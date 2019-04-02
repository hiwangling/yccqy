<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

namespace app\admin\logic;

/**
 * Description of Jxcorder
 *
 * @author Administrator
 */
class Jxcorder extends AdminBase
{
    /**
     * 出库单数据
     */
    public function orderList($where = [], $field = true, $order = '', $paginate = DB_LIST_ROWS)
    {
        $field="a.*,s.name as sname,u.name as suppliername";
        $this->modelJxcorder->alias('a');
        
        $join = [
                    [SYS_DB_PREFIX . 'jxcstorage s', 's.id = a.sid',"left"],
                    [SYS_DB_PREFIX . 'jxcsupplier u', 'u.id = a.supplier',"left"]
                ];
        
        $where['a.' . DATA_STATUS_NAME] = ['neq', DATA_DELETE];
          
        
        return $this->modelJxcorder->getList($where, $field, $order, $paginate,$join);
       // $sql= $this->modelJxcorder->getLastSql();
      //  return $reslt;
    }
    
     public function outstorageList($where = [], $field = true, $order = '', $paginate = DB_LIST_ROWS)
    {
        $field="a.*,s.name as sname,c.name as customename";
        $this->modelJxcorder->alias('a');
        
        $join = [
                    [SYS_DB_PREFIX . 'jxcstorage s', 's.id = a.sid',"left"],
                    [SYS_DB_PREFIX . 'jxccustome c', 'c.id = a.custome',"left"]
                ];
        
        $where['a.' . DATA_STATUS_NAME] = ['neq', DATA_DELETE];
        $where["ordertype"]=array('in','22,21');
          
        
        return $this->modelJxcorder->getList($where, $field, $order, $paginate,$join);
       // $sql= $this->modelJxcorder->getLastSql();
      //  return $reslt;
    }
	 
    public function Jxcordersaveinstorage($data = [])
    {
        $member = session('member_info');
        $instorageData = array(
            'orderNO' => $data['orderNO'],
            'sid' => $data['sid'],
            'supplier' => $data['supplier'],
            'ordertype' => $data['ordertype'],
              'orderlb' => 1,
             'vcdesc' => $data['vcdesc'],
            'orderdate' => $data['orderdate'],
            'operater' => MEMBER_ID,
            'operatename' => $member['nickname'],
             'status' => 1
        );
        
        $instorageDataid = $this->modelJxcorder->addInfo($instorageData);
        if ($instorageDataid!==false)
        {
                    foreach ($data['product'] as $k=>$v) {
                        if (!empty(trim($data['num'][$k])))
                        {
                            $ProductData = array(
                         'orderid' => $instorageDataid,
                        'gid' => $v,
                         'gnumber' => $data['num'][$k],
                        'price' =>  $data['price'][$k],
                                 'status' => 1
                          ); 
                            $instorageDataid = $this->modeljxcorderdetail->addInfo($ProductData);  
                        }
                       
                          
            }
        }
        return $instorageDataid;
    }
    
     public function Jxcordersaveoutstorage($data = [])
    {
        $member = session('member_info');
        $instorageData = array(
            'orderNO' => $data['orderNO'],
            'sid' => $data['sid'],
            'custome' => $data['custome'],
            'ordertype' => $data['ordertype'],
             'orderlb' => 2,
             'vcdesc' => $data['vcdesc'],
            'orderdate' => $data['orderdate'],
            'operater' => MEMBER_ID,
            'operatename' => $member['nickname'],
             'status' => 1
        );
        
        $outDataid = $this->modelJxcorder->addInfo($instorageData);
        if ($outDataid!==false)
        {
                    foreach ($data['product'] as $k=>$v) {
                        if (!empty(trim($data['num'][$k])))
                        {
                            $ProductData = array(
                         'orderid' => $outDataid,
                        'gid' => $v,
                         'gnumber' => -$data['num'][$k],
                        'price' =>  $data['price'][$k],
                                 'status' => 1
                          ); 
                            $instorageDataid = $this->modeljxcorderdetail->addInfo($ProductData);  
                        }
                       
                          
            }
        }
        return $outDataid;
    }
	/**
     * 墓穴样式类型信息编辑
     */
    public function JxcorderEdit($data = [])
    {
        
        $validate_result = $this->validateJxccustome->scene('edit')->check($data);
        
        if (!$validate_result) {
            
            return [RESULT_ERROR, $this->validateJxccustome->getError()];
        }
        
        $url = url('JxccustomeList');
        
        $result = $this->modelJxccustome->setInfo($data);
        
        $result && action_log('编辑', '编辑新增供应商，name：' . $data['name']);
        
        return $result ? [RESULT_SUCCESS, '操作成功', $url] : [RESULT_ERROR, $this->modelJxccustome->getError()];
    }

    /**
     * 获取墓穴样式类型信息
     */
    public function getJxcorderInfo($where = [], $field = true)
    {
        
        return $this->modelJxcorder->getInfo($where, $field);
    }
    
    /**
     * 墓穴样式类型删除
     */
    public function  JxcorderDel($id)
    {
        $where["orderid"]=$id;
        $this->modelJxcorderdetail->deleteInfo($where,true);
        $where1["id"]=$id;
        $result = $this->modelJxcorder->deleteInfo($where1,true);
        
        $result && action_log('删除', '出库单删除' . '，where：' . http_build_query($where1));
        
        return $result ? [RESULT_SUCCESS, '删除成功'] : [RESULT_ERROR, $this->modelJxcorder->getError()];
    }
    
   public function get_bcList($where = [], $begindate, $enddate,$storageid=0)
   {
        $wheresql = "";
     $ordersql="";
        foreach ($where as $key => $value) {
             $wheresql .= " and $key=" . $value;
        }
        if (!empty($begindate))
             $ordersql.=" and orderdate >='$begindate'";
        if (!empty($enddate))
             $ordersql.=" and orderdate <='$enddate'";
        $sql = "select  p.sn,p.name,rk.rkzs,ck.ckzs,kc.kcs from ky_jxcproduct as p 
left join (select gid,sum(gnumber) as rkzs from ky_jxcorder o  INNER JOIN ky_jxcorderdetail d on o.id=d.orderid 
 where orderlb=1 and o.`status`<>-1  and o.sid=$storageid $ordersql group by gid) as rk on rk.gid=p.id
left join (select gid,sum(gnumber) as ckzs from ky_jxcorder o  INNER JOIN ky_jxcorderdetail d on o.id=d.orderid 
 where orderlb=2 and o.`status`<>-1 and o.sid=$storageid $ordersql group by gid) as ck on ck.gid=p.id
left join (select gid,sum(gnumber) as kcs from ky_jxcorder o  INNER JOIN ky_jxcorderdetail d on o.id=d.orderid 
 where  o.`status`<>-1 and o.sid=$storageid group by gid) as kc on kc.gid=p.id
 where p.`status`<>-1   $wheresql";
          return $this->modelJxcorderdetail->query($sql);
   }
   
   public function export_bc($data,$begindate,$enddate,$storageInfo)
   {
        $titles = "商品编号,商品名称,入库数量,出库数量,总库存数";
        $keys = "sn,name,rkzs,ckzs,kcs";
        if (!empty($storageInfo))
         $title = $begindate . "-" . $enddate ."号".$storageInfo["name"]. "盘存报表";
        else
             $title = $begindate . "-" . $enddate."盘存报表"; 

        export_excel($titles, $keys, $data, $title);
   }

   /**
     * 获取列表搜索条件
     */
    public function getWhere($data = [])
    {
        
        $where = [];
        
        !empty($data['search_data']) && $where['orderNO'] = ['like', '%'.$data['search_data'].'%'];
        
        return $where;
    }
    
    
}

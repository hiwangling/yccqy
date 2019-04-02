<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

namespace app\admin\logic;

/**
 * Description of Offerprice
 *
 * @author Administrator
 */
class Offerprice extends AdminBase{
    //put your code here
     public function getOfferpriceList($where = [], $field = true, $order = 'create_time desc', $paginate = DB_LIST_ROWS) {
        $this->modelOfferprice->alias('a');
        $join = [
            [SYS_DB_PREFIX . 'cemetery c', 'a.cid = c.id'],
            [SYS_DB_PREFIX . 'member m', 'm.id = a.manager'],
          
            [SYS_DB_PREFIX . 'sell s', 's.id = a.tid'],
              ['(select  tid,sum(sellprice) as xszj,sum(realprice) as zj,sum(offerprice) as yhjg from ' . SYS_DB_PREFIX . 'finance where status=1 group by tid) as cw', 'cw.tid = a.tid'],
           
        ];
         $where['a.' . DATA_STATUS_NAME] = ['neq', DATA_DELETE];
        $this->modelOfferprice->join = $join;
        return $this->modelOfferprice->getList($where, $field, $order, $paginate);
    }

    public function getOfferpriceInfo($where = [], $field = true) {

        return $this->modelOfferprice->getInfo($where, $field);
    }
    
    public function get_Offerprice_info($where, $field = true) {
         $where[DATA_STATUS_NAME] = ['neq', DATA_DELETE];
        $Bury = $this->modelOfferprice->getInfo($where, $field);
        return $Bury;
    }
     

    public function Offerprice_add($data = []) {
        $cancelData = array(
            'tid' => $data['sid'],
            'cid' => $data['cid'],
             'manager' => $data['manager'],
             'isok' => 0,
             'offdesc'=>  $data['offdesc'],
             'operater' => $data['seller'],
            'operatername' => $data['sellname'],
            'status' => 1
        );

       return $this->modelOfferprice->addInfo($cancelData);
    }

    public function Offerprice_submit($data = []) {
        
        $rid=$this->Offerprice_add($data);
      
        if ($rid != FALSE) {
            action_log('新增加', '增加作废记录表：' . $rid);
             $result = array("code" => 0, "msg" => "优惠申请已经提交，请等待审核");
        } else {
            $result = array("code" => 1, "msg" => "error");
        }
        return $result;
    }

    public function getWhere($data = []) {

        $where = [];
        if($data['resutlstatus']!="-1")
        {
              $where['isok'] = $data['resutlstatus'];
        }
       
        !empty($data['search_data']) && $where['c.name|s.buyer|s.orderNO|s.buryname'] = ['like', '%' . $data['search_data'] . '%'];

        if (!empty($data['sbbegin'])) {
            $where['a.create_time'] = array("EGT", strtotime($data['sbbegin']));
        }
        if (!empty($data['sbend'])) {
            $where['a.create_time'] = array("ELT", strtotime($data['sbend']));
        }
        $where['a.' . DATA_STATUS_NAME] = ['neq', DATA_DELETE];
        $where['a.manager'] = MEMBER_ID;
        return $where;
    }

    public function Offerprice_cl_ajax($data = []) {
        
         $Offerpricelist = $this->getOfferpriceInfo(['id' =>$data['id']]);
        if ( empty($Offerpricelist)) {
            $result = array("code" => 1, "msg" => "参数错误");
            exit(json_encode($result));
        }   
         
        $sellwhere["id"] = $Offerpricelist["tid"];
        $sellinfo = $this->logicSell->getsellinfo_ajax($sellwhere);
        if ($sellinfo["id"] == 0) {
            $result = array("code" => 1, "msg" => "参数错误");
            exit(json_encode($result));
        }
       $canceldate = array(
            'id' => $data['id'],
            'isok' => $data['type'],
            'vcnote' => $data['vcnote'],
            'offerprice' => $data['offerprice'],
            'dobegindate' => time()
        );
        $clinfo=$this->modelOfferprice->setInfo($canceldate);
        if ($clinfo!=FALSE)
        {
            action_log('新增加', '优惠申请记录处理完成：' . $data['id']);
            if ($data['type']==2)
            {
                $sql="update " . SYS_DB_PREFIX . "finance set realprice=sellprice-".$data['offerprice'].",offerprice=".$data['offerprice'].",offertype=2 where tid=".$Offerpricelist["tid"];
               $this->modelFinance->execute($sql);
             
            }
            $result = array("code" => 0, "msg" => "作废记录处理完成！");  
        }
      else {
            $result = array("code" => 1, "msg" => "error");
        }
        return $result;
       
    }
    
     
   
}

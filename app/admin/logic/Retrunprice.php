<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

namespace app\admin\logic;

/**
 * Description of Retrunprice
 *
 * @author Administrator
 */
class Retrunprice extends AdminBase{
    
     public function getRetrunpriceList($where = [], $field = true, $order = 'create_time desc', $paginate = DB_LIST_ROWS) {
        $this->modelRetrunprice->alias('a');
        $join = [
            [SYS_DB_PREFIX . 'cemetery c', 'a.cid = c.id'],
            [SYS_DB_PREFIX . 'member m', 'm.id = a.manager'],
            [SYS_DB_PREFIX . 'sell s', 's.id = a.tid'],
        ];
         $where['a.' . DATA_STATUS_NAME] = ['neq', DATA_DELETE];
        $this->modelRetrunprice->join = $join;
        return $this->modelRetrunprice->getList($where, $field, $order, $paginate);
    }

    public function getRetrunpriceInfo($where = [], $field = true) {

        return $this->modelRetrunprice->getInfo($where, $field);
    }
    
    public function get_Retrunprice_info($where, $field = true) {
         $where[DATA_STATUS_NAME] = ['neq', DATA_DELETE];
        $Bury = $this->modelRetrunprice->getInfo($where, $field);
        return $Bury;
    }
     

    public function Retrunprice_add($data = []) {
        $cancelData = array(
            'tid' => $data['sid'],
            'cid' => $data['cid'],
             'manager' => $data['manager'],
             'isok' => 0,
             'returndesc'=>  $data['manager'],
             'operater' => $data['seller'],
            'operatername' => $data['sellname'],
            'status' => 1
        );

       return $this->modelRetrunprice->addInfo($cancelData);
    }

    public function Retrunprice_submit($data = []) {
        
        $rid=$this->Retrunprice_add($data);
      
        if ($rid != FALSE) {
            action_log('新增加', '增加作废记录表：' . $rid);
             $result = array("code" => 0, "msg" => "作废申请已经提交，请等待审核");
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

    public function Retrunprice_cl_ajax($data = []) {
        
         $Retrunpricelist = $this->getRetrunpriceInfo(['id' =>$data['id']]);
        if ( empty($Retrunpricelist)) {
            $result = array("code" => 1, "msg" => "参数错误");
            exit(json_encode($result));
        }   
         
        $sellwhere["id"] = $Retrunpricelist["tid"];
        $sellinfo = $this->logicSell->getsellinfo_ajax($sellwhere);
        if ($sellinfo["id"] == 0) {
            $result = array("code" => 1, "msg" => "参数错误");
            exit(json_encode($result));
        }
       $canceldate = array(
            'id' => $data['id'],
            'isok' => $data['type'],
            'vcnote' => $data['vcnote'],
            'dobegindate' => time()
        );
        $clinfo=$this->modelRetrunprice->setInfo($canceldate);
        if ($clinfo!=FALSE)
        {
            action_log('新增加', '作废记录处理完成：' . $data['id']);
            if ($data['type']==2)
            {
               $this->modelSell->updateInfo(['id' => $sellwhere["id"]],["orderstatus"=>4]);   ////变更记录为作废
            }
            $result = array("code" => 0, "msg" => "作废记录处理完成！");  
        }
      else {
            $result = array("code" => 1, "msg" => "error");
        }
        return $result;
       
    }
    
     
   
}


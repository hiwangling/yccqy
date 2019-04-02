<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

namespace app\admin\logic;

/**
 * Description of Move
 *
 * @author Administrator
 */
class Move extends AdminBase{
    /**
     * 获取墓园类型列表
     */
    public function getMoveList($where = [], $field = true, $order = '', $paginate = DB_LIST_ROWS) {

         $this->modelMove->alias('a');
        $join = [
                [SYS_DB_PREFIX . 'cemetery c', 'c.id = a.cid'],
                [SYS_DB_PREFIX . 'cemetery_garden g', 'c.gardenID = g.id'],
                [SYS_DB_PREFIX . 'cemetery_area r', 'c.areaID = r.id'],
            ];
        $this->modelMove->join = $join;
        $where['a.' . DATA_STATUS_NAME] = ['neq', DATA_DELETE];
 
        return $this->modelMove->getList($where, $field, $order, $paginate);
    }

    public function getMoveInfo($where = [], $field = true) {

        return $this->modelMove->getInfo($where, $field);
    }
    
 
    public function Move_add_submit($data = []) {
        $validate_result = $this->validateMove->scene('edit')->check($data);
        if (!$validate_result) {
            $result = array("code" => 1, "msg" => $this->validateMove->getError());
            return $result;
        }
         $restult=$this->addMove($data);
         if ($restult)
         {
            action_log('新增加', '增加迁墓信息，迁墓人：' . $data['buyer']);

            $result = array("code" => 0, "msg" => "success");
        } else {
            $result = array("code" => 1, "msg" => "error");
        }
        return $result;
    }

    public function Move_edit_submit($data = []) {
        $validate_result = $this->validateMove->scene('edit')->check($data);
        if (!$validate_result) {
            $result = array("code" => 1, "msg" => $this->validateMove->getError());
            return $result;
        }
         $restult= $this->update_Move($data, $data['id']);
        if ($restult)
        {
             action_log('修改', '修改迁墓信息，记录Id：' . $data['id']);
            $result = array("code" => 0, "msg" => "success");
        } else {

            $result = array("code" => 1, "msg" => "error");
        }
        return $result;
    }

    public function addMove($data = []) {
            $MoveDataTwo = array(
             'cid' => $data['cid'],
             'buyer' => $data['buyer'],
             'phone' => $data['phone'],
             'movestatus' => 1,
            'movedate' => $data['movedate'],
            'operater' => $data['operater'],
            'operatername' => $data['operatername'],
            'vcdesc' => $data['vcdesc'],
            'status' => 1
        );
       return $this->modelMove->addInfo($MoveDataTwo);
    }

    public function update_Move($data = [], $Id) {
        $MoveDataTwo = array(
            'id' => $Id,
            'buyer' => $data['buyer'],
            'phone' => $data['phone'],
           'movestatus' => 1,
            'movedate' => $data['movedate'],
            'operater' => $data['operater'],
            'operatername' => $data['operatername'],
            'vcdesc' => $data['vcdesc'],
        );
      return  $this->modelMove->setInfo($MoveDataTwo);
    }

    public function Move_Del($data = []) {
       
       
        $result = $this->modelMove->deleteInfo(["id" => $data["id"]]);
        if ($result != FALSE) {
            action_log('删除', '迁墓信息删除' . '，where：' . http_build_query(['id' => $data['id']]));
            $result = array("code" => 0, "msg" => "success");
        } else {
            $result = array("code" => 1, "msg" => $this->modelMove->getError());
        }
        return $result;
    }
    
     public function Move_pay($data = []) {
         
        $result=$this->modelMove->updateInfo_zhj(["id"=>$data["id"]],["movestatus"=>2]);
         if ($result != FALSE) {
            $this->logicSell->canacel_update_isstory($data['cid'],0); 	
             $this->modelCemetery->updateInfo(['id' => $data['cid']], ['usestatus' => 5]);
            
             $isupdate = 5;
             $result = array("code" => 0, "msg" => "success", "isupdate" => $isupdate, "cid" => $data['cid']);
          } else {
            $result = array("code" => 1, "msg" => $this->modelMove->getError());
        }
        return $result;
    }

}
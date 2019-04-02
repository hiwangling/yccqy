<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

namespace app\admin\logic;

/**
 * Description of Schedule
 *
 * @author Administrator
 */
class Schedule extends AdminBase {

    /**
     * 获取墓园类型列表
     */
    public function getScheduleList($where = [], $field = '*', $order = '', $paginate = DB_LIST_ROWS) {
        
         $this->modelSchedule->alias('s');
        $join = [
                [SYS_DB_PREFIX . 'cemetery c', 'c.id = s.cid'],
                [SYS_DB_PREFIX . 'cemetery_garden g', 'c.gardenID = g.id'],
                [SYS_DB_PREFIX . 'cemetery_area r', 'c.areaID = r.id'],
            ];
         $this->modelSchedule->join = $join;
       
        $where['s.' . DATA_STATUS_NAME] = ['neq', DATA_DELETE];
        
        return $this->modelSchedule->getList($where, $field, $order, $paginate);
    }

     

    /**
     * 墓园类型信息编辑
     */
    public function Schedule_submit($data = []) {
        $validate_result = $this->validateSchedule->scene('edit')->check($data);
        if (!$validate_result) {
            $result = array("code" => 1, "msg" => $this->validateSchedule->getError());
            return $result;
        }
        
        $result = $this->modelSchedule->setInfo($data);
        if ($result != FALSE) {
            $isupdate=0;
             if (empty($data["id"]))
             {
                 action_log('新增加', '增加预订信息，预定人：' . $data['buyer']);
                 $this->modelCemetery->updateInfo(['id' => $data['cid'],'usestatus' => 1], ['usestatus' => 2]);
                 $isupdate=2;
             }
             else
             {
                 action_log('修改', '修改预订信息，id' . $data["id"]); 
             }
             $this->logicLinkman->update_linkname($data["buyer"], $data);
             $result = array("code" => 0, "msg" => "success","isupdate"=>$isupdate,"cid"=>$data['cid']);
        } else {
            $result = array("code" => 1, "msg" => "error");
        }
        return $result;
    }

    /**
     * 获取墓园类型信息
     */
    public function getScheduleInfo($where = [], $field = true) {

        return $this->modelSchedule->getInfo($where, $field);
    }

    /**
     * 墓园类型删除
     */
    public function ScheduleDel($data = []) {
       
        $result = $this->modelSchedule->deleteInfo(['id' => $data['id']],TRUE);
     if ($result != FALSE) {
          $isupdate=0; 
         
            action_log('删除', '预订单删除' . '，where：' . http_build_query(['id' => $data['id']]));
               if($data["orderstatus"]==1)
               {
                 $result1=$this->modelCemetery->updateInfo(['id' => $data['cid'],'usestatus' => 2], ['usestatus' => 1]); 
                 if ($result1>0)
                   $isupdate=1; 
                      
                 }
             $result = array("code" => 0, "msg" => "success","isupdate"=>$isupdate,"cid"=>$data['cid']);
        } else {
            $result = array("code" => 1, "msg" => $this->modelSchedule->getError());
        }
        return $result;
      
    }

    /**
     * 获取列表搜索条件
     */
    public function getWhere($data = []) {

      $where = [];
        !empty($data['search_data']) && $where['s.buyer|c.name|s.sellname'] = ['like', '%' . $data['search_data'] . '%'];
        !empty($data['ordaintype']) && $where['s.ordaintype'] = $data['ordaintype'];
        if (!empty($data['sbbegin'])) {
            $where['s.ordainbegin'] = array("EGT", strtotime($data['sbbegin']));
        }
        if (!empty($data['sbend'])) {
            $where['s.ordainbegin'] = array("ELT", strtotime($data['sbend']));
        }
        
        return $where;
    }
    
   
   
    

}

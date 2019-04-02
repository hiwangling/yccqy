<?php

// +---------------------------------------------------------------------+
// | OneBase    | [ WE CAN DO IT JUST THINK ]                            |
// +---------------------------------------------------------------------+
// | Licensed   | http://www.apache.org/licenses/LICENSE-2.0 )           |
// +---------------------------------------------------------------------+
// | Author     | Bigotry <3162875@qq.com>                               |
// +---------------------------------------------------------------------+
// | Repository | https://gitee.com/Bigotry/OneBase                      |
// +---------------------------------------------------------------------+

namespace app\admin\logic;

/**
 * 墓位类型逻辑
 */
class Save extends AdminBase {

    /**
     * 获取寄存列表
     */
    public function getSaveList($where = [], $field = 'a.*', $order = '', $paginate = DB_LIST_ROWS) {
        $this->modelSave->alias('a');

        $join = [
            [SYS_DB_PREFIX . 'savearea sa', 'a.saveareaid = sa.id', 'left'],
            [SYS_DB_PREFIX . 'cemetery c', 'a.cid = c.id', 'left'],
            [ SYS_DB_PREFIX . 'sell s', 'a.tid = s.id', 'left'],
           
        ];
        $this->modelSave->join = $join;
        $where['a.' . DATA_STATUS_NAME] = ['neq', DATA_DELETE];

        return $this->modelSave->getList($where, $field, $order, $paginate);
    }
 
    public function getSaveInfo($where = [], $field = true) {
         $where[DATA_STATUS_NAME] = ['neq', DATA_DELETE];
        return $this->modelSave->getInfo($where, $field);
    }
    public function Save_add_submit($data = []) {
        $validate_result = $this->validateSave->scene('edit')->check($data);
        if (!$validate_result) {
            $result = array("code" => 1, "msg" => $this->validateSave->getError());
            return $result;
        }
        $data['savebegindate'] = strtotime($data['savebegindate']);
        $data['saveenddate'] = strtotime($data['saveenddate']);
         ///// 
          $data['orderNO'] = get_cw_OrderNo();  
          $data['financetype'] = 2; /////购墓操作
          $data['orderstatus'] = 1; //默认付款操作
          $data["orderbegin"] = date("Y-m-d");
          $data["orderend"] = date("Y-m-d");
           
          $data['paytype'] = 1;
          $data['payvarchar'] = $this->logicSell->get_pay_typename($data);
          $sellId = $this->logicSell->addSell($data);
           if ($sellId != FALSE) {
            ///增加财务信息表
            $chargeitem = $this->logicChargeitem->getChargeitemInfo(['id' => 1], "id,name");
            $title = $chargeitem["name"];
            $titleid = $chargeitem["id"];
           $this->logicFinance->Finance($data["orderNO"], $data["cid"], $sellId, $data["paytype"], $data["financetype"], $data["orderstatus"], $data["saveprice"], $data["saveprice"], 1, $data["saveprice"], $title, $titleid, $data["isvoice"]);
            $this->addSave($data, $sellId);
            $this->logicLinkman->update_linkname($data["buyer"], $data);
            action_log('新增加', '增加寄存信息，预定人：' . $data['buyer']);

            $result = array("code" => 0, "msg" => "success");
        } else {
            $result = array("code" => 1, "msg" => "error");
        }
        return $result;
        //////
      
    }

    public function Save_edit_submit($data = []) {
         $validate_result = $this->validateSave->scene('edit')->check($data);
        if (!$validate_result) {
            $result = array("code" => 1, "msg" => $this->validateSave->getError());
            return $result;
        }
         $where["id"] = $data["id"];
        $Savefo = $this->getSaveInfo($where);
         if (empty($Savefo)) {
            $result = array("code" => 1, "msg" => "数据异常，请检查");
            return $result;
        }
        $data['savebegindate'] = strtotime($data['savebegindate']);
        $data['saveenddate'] = strtotime($data['saveenddate']);
        
        $sellinfo = $this->logicSell->getSellInfo(["id" => $Savefo['tid']]);
        if (empty($sellinfo)) {
            $result = array("code" => 1, "msg" => "数据异常，请检查");
            return $result;
        }
        $data["id"] = $Savefo['tid'];///修改为SELLID
        $result = $this->logicSell->updateSell($data);
        if ($result != FALSE) {
            action_log('修改', '修改寄存信息信息购买人：订单号：' . $sellinfo["orderNO"]);
           
            $where_f["tid"] = $sellinfo['id'];
            $fancy["sellprice"] = $data['saveprice'];
            $fancy["realprice"] = $data['saveprice'];
            $this->modelFinance->updateInfo($where_f, $fancy);
            $this->logicLinkman->update_linkname($data["buyer"], $data);
            $this->update_Save($data, $Savefo['id']);
            $result = array("code" => 0, "msg" => "success");
        } else {

            $result = array("code" => 1, "msg" => "error");
        }
        return $result;
    }

    /**
     * 获取寄存信息
     */
  /*  public function getSaveInfo($where = [], $field = 'a.*') {
        $this->modelSave->alias('a');
        $join = [
            [SYS_DB_PREFIX . 'savearea sa', 'a.saveareaid = sa.id', 'left'],
            [SYS_DB_PREFIX . 'cemetery c', 'a.cid = c.id', 'left'],
            [SYS_DB_PREFIX . 'cemetery_garden y', 'c.gardenID = y.id', 'left'],
            [SYS_DB_PREFIX . 'cemetery_area q', 'c.areaID = q.id', 'left'],
           
        ];
        $this->modelSave->join = $join;
        $where['a.' . DATA_STATUS_NAME] = ['neq', DATA_DELETE];

        return $this->modelSave->getInfo($where, $field);
    }*/

    public function addSave($data = [], $sellId) {
        $LightDataTwo = array(
            'tid' => $sellId,
            'orderNO' => $data["orderNO"],
            'cid' => $data['cid'],
            'buyer' => $data['buyer'],
            'relation' => $data['relation'],
            'phone' => $data['phone'],
             'address' => isset($data['address']) ? $data['address'] : '',
             'deathname' => $data['deathname'],
            'saveareaid' => $data['saveareaid'],
             'saveprice' => $data['saveprice'],
            'savebegindate' => $data['savebegindate'],
            'saveenddate' => $data['saveenddate'],
           'vcnote' => $data['vcnote'],
             'savestatus' => 1
        );
        $this->modelSave->addInfo($LightDataTwo);
    }
    
    public function update_Save($data = [], $Id) {
         
         $LightDataTwo = array(
            'id' => $Id,
             'buyer' => $data['buyer'],
            'relation' => $data['relation'],
            'phone' => $data['phone'],
             'address' => isset($data['address']) ? $data['address'] : '',
             'deathname' => $data['deathname'],
            'saveareaid' => $data['saveareaid'],
             'saveprice' => $data['saveprice'],
            'savebegindate' => $data['savebegindate'],
            'saveenddate' => $data['saveenddate'],
           'vcnote' => $data['vcnote']
            
        );
        $this->modelSave->setInfo($LightDataTwo);
    }
    
    /**
     *  寄存删除
     */
    public function SaveDel($data = []) {

        $where["id"] = $data["id"];
        $Savefo = $this->getSaveInfo($where);
        if (empty($Savefo)) {
            $result = array("code" => 1, "msg" => "数据异常，请检查");
            return $result;
        }
        $this->logicSell->Sellinfo_del($Savefo["tid"]);
        $result = $this->modelSave->deleteInfo(["id" => $data["id"]]);
        if ($result != FALSE) {
            action_log('删除', '点灯信息删除' . '，where：' . http_build_query(['id' => $data['id']]));
            $result = array("code" => 0, "msg" => "success");
        } else {
            $result = array("code" => 1, "msg" => $this->modelSave->getError());
        }
        return $result;
        
       
    }

    /**
     *  寄存结算
     */
 
    
    /////更新及记录
     public function Save_update($where=[], $data=[]) {
          $result = $this->modelSave->updateInfo($where,$data);
        if ($result != FALSE) {
            action_log('更新寄存信息', '寄存信息 更新' . '，where：' . http_build_query(['id' => $where['id']]));
            $result = array("code" => 0, "msg" => "success");
        } else {
            $result = array("code" => 1, "msg" => $this->modelSave->getError());
        }
        return $result;
    }
    
    /**
     * 获取列表搜索条件
     */
    public function getWhere($data = []) {

        $where = [];
        !empty($data['search_data']) && $where['a.buyer|c.name|monumename'] = ['like', '%' . $data['search_data'] . '%'];

        if (!empty($data['sbbegin'])) {
            $where['a.savebegindate'] = array("EGT", strtotime($data['sbbegin']));
        }
        if (!empty($data['sbend'])) {
            $where['a.savebegindate'] = array("ELT", strtotime($data['sbend']));
        }
        if (!empty($data['saveareaid'])) {
            $where['a.saveareaid'] = $data['saveareaid'];
        }

        return $where;
    }

}

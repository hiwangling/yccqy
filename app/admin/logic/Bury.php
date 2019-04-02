<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

namespace app\admin\logic;

/**
 * Description of Bury
 *
 * @author Administrator
 */
class Bury extends AdminBase {

    public function getBuryList($where = [], $field = 'a.*', $order = '', $paginate = DB_LIST_ROWS) {
        $this->modelBury->alias('a');

        $where['a.' . DATA_STATUS_NAME] = ['neq', DATA_DELETE];

        return $this->modelBury->getList($where, $field, $order, $paginate);
    }

    public function get_Bury_info($where, $field) {
        $Bury = $this->modelBury->getInfo($where, $field);
        return $Bury;
    }
    
     public function get_Buryname_bcid($cid) {
         $sql="select group_concat(vcname separator ',') as deathname    
from " . SYS_DB_PREFIX . "bury  where cid=$cid and status!=-1 group by cid";
        $Bury = $this->modelBury->query($sql);
         if (!empty($Bury))
             return $Bury[0]["deathname"];
         else
             return "";
       
    }

    public function Bury_delete($where = [], $isdel = true) {
        return $this->modelBury->deleteInfo($where, $isdel);
    }

    public function Bury_add_submit($data = [], $chargeitem = [], $Serviceinfoitem = [], $financetype = 4) {
        $validate_result = $this->validateBury->scene('edit')->check($data);
        if (!$validate_result) {
            $result = array("code" => 1, "msg" => $this->validateBury->getError());
            return $result;
        }
        $data['orderNO'] = get_cw_OrderNo();
        $data['financetype'] = $financetype; ///// 
        $data['orderstatus'] = 2; //默认付款操作

        $data["orderbegin"] = date("Y-m-d");
        $data["orderend"] = date("Y-m-d");
        $sellId = $this->logicSell->addSell($data); //$this->modelSell->addInfo($sellData);
        if ($sellId != FALSE) {
            action_log('新增加', '增加安葬信息表：' . $data['buyer']);
            $this->logicSell->sell_save_selldate($sellId, $data, $chargeitem, $Serviceinfoitem, FALSE);
            $this->logicLinkman->update_linkname($data["buyer"], $data);
            $Buryinf["burystatus"] = 1;
            $Buryinf["burytype"] = $data["burytype"];
            $Buryinf["burystyle"] = $data["burystyle"];
            $Buryinf["linkname"] = $data["buyer"];
            $Buryinf["phone"] = $data["phone"];
            $Buryinf["bury"] = $data["bury"];
            $Buryinf["birth"] = $data["birth"];
            $Buryinf["death"] = $data["death"];
            $this->update_bury_info(["id" => $data['bid']], $Buryinf);
            $this->logicCemetery->update_CemeteryInfo(['id' => $data['cid'], 'usestatus' => 3], ['usestatus' => 4]);
            $result = array("code" => 0, "msg" => "success");
        } else {

            $result = array("code" => 1, "msg" => "error");
        }
        return $result;
    }

    public function bury_edit_submit($data = [], $chargeitem = [], $Serviceinfoitem = []) {
        $validate_result = $this->validateBury->scene('edit')->check($data);
        if (!$validate_result) {
            $result = array("code" => 1, "msg" => $this->validateBury->getError());
            return $result;
        }
        $sellinfo = $this->logicSell->getSellInfo(["id" => $data['id']]);
        if (empty($sellinfo)) {
            $result = array("code" => 1, "msg" => "数据异常，请检查");
            return $result;
        }
        $result = $this->logicSell->updateSell($data); //$this->modelSell->addInfo($sellData);
        if ($result != FALSE) {
            action_log('修改', '修改下葬信息购买人：订单号：' . $sellinfo["orderNO"]);
            $this->logicSell->Sell_Del_other_all(["orderNO" => $sellinfo["orderNO"]], FALSE);  ///删除掉财务数据和其他数据，在增加///
            $data["orderNO"] = $sellinfo["orderNO"];
            $data['financetype'] = $sellinfo["financetype"]; /////购墓操作
            $data['orderstatus'] = $sellinfo["orderstatus"]; //默认付款操作
            $this->logicSell->sell_save_selldate($data['id'], $data, $chargeitem, $Serviceinfoitem, FALSE);
            $this->logicLinkman->update_linkname($data["buyer"], $data);
            $Buryinf["burystatus"] = 1;
            $Buryinf["burytype"] = $data["burytype"];
            $Buryinf["burystyle"] = $data["burystyle"];
            $Buryinf["bury"] = $data["bury"];
            $Buryinf["birth"] = $data["birth"];
            $Buryinf["death"] = $data["death"];
            $Buryinf["linkname"] = $data["buyer"];
            $Buryinf["phone"] = $data["phone"];
            $this->update_bury_info(["id" => $data['bid']], $Buryinf);
            $this->logicCemetery->update_CemeteryInfo(['id' => $data['cid'], 'usestatus' => 3], ['usestatus' => 4]);

            $result = array("code" => 0, "msg" => "success");
        } else {

            $result = array("code" => 1, "msg" => "error");
        }
        return $result;
    }

    public function update_bury_info($where = [], $field = []) {
        $this->modelBury->updateInfo_zhj($where, $field);
    }

    public function Bury_sell_Del($data = []) {
        $where["bid"] = $data["id"];
        $where["cid"] = $data["cid"];
        $sellinfo = $this->logicSell->getSellInfo($where);
        if (empty($sellinfo)) {
            $result = array("code" => 1, "msg" => "数据异常，请检查");
            return $result;
        }
        $result = $this->modelSell->deleteInfo(["id" => $sellinfo["id"]], true);
        if ($result != FALSE) {
            action_log('删除', '安葬信息删除' . '，where：' . http_build_query(['id' => $sellinfo['id']]));
            $this->logicSell->Sell_Del_other_all(["orderNO" => $sellinfo["orderNO"]]);
            /////更新墓穴的状态为可操作状态
            $Buryinf["burystatus"] = 0;
            $Buryinf["burytype"] = 0;
            $Buryinf["burystyle"] = 0;
            $Buryinf["bury"] = null;
            $this->update_bury_info(['id' => $data["id"]], $Buryinf);
            $this->update_cemetery_state($data["cid"]);
            ///////
            $result = array("code" => 0, "msg" => "success");
        } else {
            $result = array("code" => 1, "msg" => $this->modelSell->getError());
        }
        return $result;
    }
    
   public function deather_add_submit($data = []) {
        $validate_result = $this->validateBury->scene('deather')->check($data);
        if (!$validate_result) {
            $result = array("code" => 1, "msg" => $this->validateBury->getError());
            return $result;
        }
            if (!empty($data['birth']) && !empty($data['death'])) {
                    $death = substr($data['death'], 0, 4);
                    $birth = substr($data['birth'], 0, 4);
                    $age = $death - $birth + 1; //date('Y',strtotime($v['bury_death']))-date('Y',strtotime($v['bury_birth']));
                } else {
                    $age = 0;
                }
            
              $buryData = array(
                 'cid' => $data['cid'],
                    'vcname' => $data['vcname'],
                    'sex' => $data['sex'],
                    'age' => $age,
                    'birth' => !empty(trim($data['birth'])) ? trim($data['birth']) : null,
                    'death' => !empty(trim($data['death'])) ? trim($data['death']) : null,
                    'bury' => !empty(trim($data['bury'])) ? trim($data['bury']) : null,
                    'sfz' => $data['sfz'],
                  
                 
                     'linkname' =>$data["buyer"],
                     'relation' =>$data["relation"],
                    'phone' => $data["phone"],
                    'burystatus' => 0,
                    'operater' => MEMBER_ID,
                    'operatename' => session('member_info')['nickname'],
                    'status' => 1
                );
                if ($data['id'] != 0) {
                        $where["id"] = $data['id'];
                        $data['sort']=10;
                        $buryId = $this->modelBury->updateinfo($where,$buryData);
                   
                } else {
                    $buryId = $this->modelBury->addInfo($buryData);
                   
                }
            
         if ($buryId != FALSE) {
            action_log('新增加', '管理墓主信息表：' . $data['vcname']);
            $buryname=$this->get_Buryname_bcid($data['cid']);
            $wherebury["id"]=$data['cid'];
            
            $this->modelCemetery->updateInfo($wherebury, ['monumename'=>$buryname]);
           
            $result = array("code" => 0, "msg" => "success");
        } else {
         $result = array("code" => 1, "msg" => "error");
        }
        return $result;
    }

    
    public function deather_Del($data = []) {
        $result = $this->modelBury->deleteInfo(["id" => $data["id"]]);
        if ($result != FALSE) {
            action_log('删除', '墓主信息删除' . '，where：' . http_build_query(['id' => $data['id']]));
             $buryname=$this->get_Buryname_bcid($data['cid']);
            $wherebury["id"]=$data['cid'];
            // $wherebury["usestatus"]=array("egt",3);
            $this->modelCemetery->updateInfo($wherebury, ['monumename'=>$buryname]);
            $result = array("code" => 0, "msg" => "success");
        } else {
            $result = array("code" => 1, "msg" => $this->modelBury->getError());
        }
        return $result;
    }
    
    private function update_cemetery_state($cid) {
        $where["cid"] = $cid;
        $where["burystatus"] = 1;
        $data = $this->modelBury->getInfo($where, "id");
        if (empty($data)) {
            $result = $this->logicCemetery->update_CemeteryInfo(['id' => $cid], ['usestatus' => 3]);
        }
        return $result;
    }

}

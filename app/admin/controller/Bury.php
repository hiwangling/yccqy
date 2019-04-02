<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

namespace app\admin\controller;

/**
 * Description of Bury
 *
 * @author Administrator
 */
class Bury extends AdminBase {

    public function Bury_list_ajax() {
        if (empty($this->param['cid'])) {
            $result = array("code" => 1, "msg" => "参数错误");
            exit(json_encode($result));
        }
        $info = $this->logicCemetery->getCemeteryList(['a.id' => $this->param['cid']], "a.*,g.name as gardename ,r.name as areaname,t.name as typename , s.name as stylename", null, 1);
        $this->assign('CemeteryType', $this->logicCemeteryType->getCemeteryTypeList(["status" => 1]));
        if (empty($info[0])) {
            $result = array("code" => 1, "msg" => "参数错误");
            exit(json_encode($result));
        }
        $this->assign('info', $info[0]);
        $Buryinfo = $this->logicBury->getBuryList(["a.cid" => $this->param['cid']], "a.* ", "sort", FALSE);
        $this->assign('Buryinfo', $Buryinfo);
        $table_lsit = $this->fetch("bury_table");
        $this->assign('table_lsit', $table_lsit);
        /////////
        $this->view->engine->layout(false);
        $infohtml = $this->fetch("buryinfo_list");
        $result = array("code" => 0, "msg" => "", "data" => $infohtml);
        exit(json_encode($result));
    }

    public function bury_show_ajax() {
        if (empty($this->param['cid']) || empty($this->param['id'])) {
            $result = array("code" => 1, "msg" => "参数错误");
            exit(json_encode($result));
        }
        $info = $this->logicCemetery->getCemeteryList(['a.id' => $this->param['cid']], "a.*,g.name as gardename ,r.name as areaname,t.name as typename , s.name as stylename", null, 1);

        if (empty($info[0])) {
            $result = array("code" => 1, "msg" => "参数错误");
            exit(json_encode($result));
        }
        $this->assign('info', $info[0]);
        ///////死者信息
        $Buryinfo = $this->logicBury->get_Bury_info(["id" => $this->param['id']], "*");
        if (empty($Buryinfo)) {
            $result = array("code" => 1, "msg" => "死者信息错误");
            exit(json_encode($result));
        }
        //////联系人信息
        $linkmanlist = $this->logicLinkman->getlinkmanList(['cid' => $this->param['cid']], "*", "id", FALSE);
        ////////销售单据信息 
        $sellwhere["cid"] = $this->param['cid'];
        $sellwhere["a.bid"] = $this->param['id']; ///死者ID
        $sellwhere["financetype"] = 4;
        $sellinfo = $this->logicSell->getsellinfo_ajax($sellwhere, FALSE);
        //////////
        // 收费项目
        $chargeitem = $this->logicChargeitem->getChargeitemStat_value(4, 0);
        ////////服务项目///////
        $Serviceinfo_where["servicetype"] = array('like', '%,4,%');
        $Serviceinfoitem = $this->logicServiceinfo->getServiceinfoList($Serviceinfo_where, "a.id,a.servicename,a.price,a.manager,deptid", "sort", FALSE);
        foreach ($Serviceinfoitem as $key => $value) {
            $Serviceinfoitem[$key]["ischeck"] = 0;
        }
        ////////////初始化价格
        if (isset($sellinfo["Financeinfo"])) {
            foreach ($sellinfo["Financeinfo"] as $key => $value) {
                if ($value["kmtype"] == 1) {////收费项目类型
                    foreach ($chargeitem as $key => $value1) {
                        if ($value1["id"] == $value["selltitleid"]) {
                            $chargeitem[$key]["defaultprice"] = $value["realprice"];
                        }
                    }
                } else { ///////服务项目价格获取
                    foreach ($Serviceinfoitem as $key => $value1) {
                        if ($value1["id"] == $value["selltitleid"]) {
                            $Serviceinfoitem[$key]["ischeck"] = 1;
                        }
                    }
                }
            }
        } else {
            $sellinfo["billTolamount"] = 0;
        }
        $this->assign('chargeitem', $chargeitem);

        $this->assign('Serviceinfoitem', $Serviceinfoitem);
        /////////////自动填写联系人///////////////////////////
        if (empty($sellinfo["buyer"])) {
            foreach ($linkmanlist as $key => $value) {
                if ($value["linkname"] == $Buryinfo["linkname"]) {
                    $sellinfo["buyer"] = $value["linkname"];
                    $sellinfo["relation"] = $value["relation"];
                    $sellinfo["phone"] = $value["phone"];
                    $sellinfo["job"] = $value["job"];
                    $sellinfo["address"] = $value["address"];
                    $sellinfo["sex"] = $value["sex"];
                    break;
                }
            }
        }
        /////////////////////////////////////////////////
        $this->assign('paytype', parse_config_array('Payment'));
        $this->assign('burytype', parse_config_array('burytype'));
        $this->assign('burystyle', parse_config_array('burystyle'));

        $this->assign('sellinfo', $sellinfo);
        $this->assign('linkmanlist', $linkmanlist);

        $this->assign('Buryinfo', $Buryinfo);


        /////////
        $this->view->engine->layout(false);
        $infohtml = $this->fetch("bury_add");
        $result = array("code" => 0, "msg" => "", "data" => $infohtml);
        exit(json_encode($result));
    }

    public function bury_save_submit() {
        if (empty($this->param['cid']) || empty($this->param['bid'])) {
            $result = array("code" => 1, "msg" => "参数错误");
            exit(json_encode($result));
        }
        ///////////////服务项目////////////
        $Serviceinfo_where["servicetype"] = array('like', '%,4,%');
        $Serviceinfoitem = $this->logicServiceinfo->getServiceinfoList($Serviceinfo_where, "a.id,a.servicename,a.price,a.manager,a.deptid", "sort", FALSE);
        //////////获取收费项目
        $chargeitem = $this->logicChargeitem->getChargeitemStat_value(4, -1);
        $chargeitemlist = array();
        if (!empty($chargeitem)) {
            foreach ($chargeitem as $key => $value) {
                $chargeitemlist[$value["id"]]["name"] = $value["name"];
                $chargeitemlist[$value["id"]]["id"] = $value["id"];
            }
        }
        //////////////
        $member = session('member_info');
        $this->param['seller'] = $member['id'];
        $this->param['sellname'] = $member['nickname'];
        if (empty($this->param['id'])) {
            $result = $this->logicBury->Bury_add_submit($this->param, $chargeitemlist, $Serviceinfoitem, 4); ////增加
        } else {
            $result = $this->logicBury->bury_edit_submit($this->param, $chargeitemlist, $Serviceinfoitem); ////增加
        }
        /////
        if ($result["code"] != 1) { ///更新表格
            $result = array("code" => 0, "data" => $this->update_table($this->param['cid']));
        }
        exit(json_encode($result));
    }

    public function bury_delete_ajax() {
        if (empty($this->param['id'])) {
            $result = array("code" => 1, "msg" => "参数错误");
            exit(json_encode($result));
        }
        $result = $this->logicBury->Bury_sell_Del($this->param);
        if ($result["code"] != 1) { ///更新表格
            $result = array("code" => 0, "data" => $this->update_table($this->param['cid']));
        }
        exit(json_encode($result));
    }
    
  
    private function update_table($cid) {
        $Buryinfo = $this->logicBury->getBuryList(["a.cid" => $cid], "a.* ", "sort", FALSE);
        $this->assign('Buryinfo', $Buryinfo);
        $this->view->engine->layout(false);
        $infohtml = $this->fetch("bury_table");
        return $infohtml;
    }

}

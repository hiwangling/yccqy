<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

namespace app\admin\controller;

/**
 * Description of Sellchang
 *
 * @author Administrator
 */
class Sellchang extends AdminBase {

    public function show_Sellchanglist_ajax() {

        if (empty($this->param['cid'])) {
            $result = array("code" => 1, "msg" => "参数错误");
            exit(json_encode($result));
        }
        $infohtml = $this->update_table($this->param['cid']);
        $result = array("code" => 0, "msg" => "", "data" => $infohtml);
        exit(json_encode($result));
    }

    public function Sellchang_ajax_show() {
        if (empty($this->param['cid'])) {
            $result = array("code" => 1, "msg" => "参数错误");
            exit(json_encode($result));
        }
        $info = $this->logicCemetery->getCemeteryList(['a.id' => $this->param['cid']], "a.*,g.name as gardename ,r.name as areaname,t.name as typename , s.name as stylename", null, 1);
        if (empty($info[0])) {
            $result = array("code" => 1, "msg" => "参数错误");
            exit(json_encode($result));
        }
        $this->assign('info', $info[0]);
        $chargeitem = $this->logicChargeitem->getChargeitemStat_value(5, -1);
        //////
        $sellwhere["cid"] = $this->param['cid'];
        $sellwhere["financetype"] = 1; ///购墓收费
        $oldsellinfo = $this->logicSell->getsellinfo_ajax($sellwhere);
        $buryanme = "";
        if (isset($oldsellinfo["bury"])) {
            foreach ($oldsellinfo["bury"] as $key => $value) {
                $buryanme .= $value["vcname"] . ",";
            }
        }
        $newsellid = 0;
        $SellchangInfo = $this->logicSellchang->getSellchangInfo(["id" => $this->param['cid']]);
        if (!empty($SellchangInfo)) {
            $newsellid = $SellchangInfo["tid"];
        }
        $sellinfo = $this->logicSell->getsellinfo_ajax(["id" => $newsellid], true);
        ////////服务项目///////
        $Serviceinfo_where["servicetype"] = array('like', '%,5,%');
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
        //////联系人///////
        $linkmanlist = $this->logicLinkman->getlinkmanList(['cid' => $this->param['cid']], "*", "id", FALSE);
        $payarray = $this->logicSell->get_pay_array($sellinfo["payvarchar"]);
        /////////////
        $this->assign('chargeitem', $chargeitem);
        $this->assign('Serviceinfoitem', $Serviceinfoitem);
        $this->assign('paytype', $payarray);
        $this->assign('oldsellinfo', $oldsellinfo);
        $this->assign('sellinfo', $sellinfo);
        $this->assign('buryanme', $buryanme);
        $this->assign('SellchangInfo', $SellchangInfo);
        $this->assign('linkmanlist', $linkmanlist);
        /////////
        $this->view->engine->layout(false);
        $infohtml = $this->fetch("chang_add");
        $result = array("code" => 0, "msg" => "", "data" => $infohtml);
        exit(json_encode($result));
    }

    /////公墓购买
    public function Sellchang_submit_ajax() {
        if (empty($this->param['newcid']) || empty($this->param['oldcid'])) {
            $result = array("code" => 1, "msg" => "参数错误");
            exit(json_encode($result));
        }
        ///////////////服务项目////////////
        $Serviceinfo_where["servicetype"] = array('like', '%,5,%');
        $Serviceinfoitem = $this->logicServiceinfo->getServiceinfoList($Serviceinfo_where, "a.id,a.servicename,a.price,a.manager,a.deptid", "sort", FALSE);
        //////////获取收费项目
        $chargeitem = $this->logicChargeitem->getChargeitemStat_value(5, -1);
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
        // if (empty($this->param['changid'])) {
        $result = $this->logicSellchang->Sellchang_add_submit($this->param, $chargeitemlist, $Serviceinfoitem, 3); ////增加
        // } else {
        //       $result = $this->logicSellchang->Sellchang_edit_submit($this->param, $chargeitemlist, $Serviceinfoitem); ////增加
        //   }
        /////
        if ($result["code"] != 1) { ///更新表格
            $result = array("code" => 0, "data" => $this->update_table($this->param['cid']));
        }
        exit(json_encode($result));
    }

    public function Sellchang_delete_ajax() {
        if (empty($this->param['id'])) {
            $result = array("code" => 1, "msg" => "参数错误");
            exit(json_encode($result));
        }
        $Sellchang = $this->logicSellchang->getSellchangInfo(['id' => $this->param['id']]); ////获取点灯的记录
        if (empty($Sellchang)) {
            $result = array("code" => 1, "msg" => "数据异常，请检查");
            return $result;
        }
        $result = $this->logicSellchang->Sellchang_Del($Sellchang);
        if ($result["code"] != 1) {
            $result["data"] = $this->update_table($Sellchang['oldcid']);
        }
        exit(json_encode($result));
    }

    public function Sellchang_pay_ajax() {
        if (empty($this->param['id'])) {
            $result = array("code" => 1, "msg" => "参数错误");
            exit(json_encode($result));
        }
        $Sellchang = $this->logicSellchang->getSellchangInfo(['id' => $this->param['id']]); ////获取点灯的记录
        if (empty($Sellchang)) {
            $result = array("code" => 1, "msg" => "数据异常，请检查");
            return $result;
        }
        $sellwhere["id"] = $Sellchang['tid'];
        $sellinfo = $this->logicSell->getSellInfo($sellwhere);
        if (empty($sellinfo)) {
            $result = array("code" => 1, "msg" => "参数错误");
            exit(json_encode($result));
        }
        if ($sellinfo["orderstatus"] == 2) {
            $result = array("code" => 0, "msg" => "success");
            $result["url"] = $url = url('Sellchang_print', array('id' => $this->param['id']));
            $result["data"] = $this->update_table($Sellchang['oldcid']);
            exit(json_encode($result));
        }
        $result = $this->logicSellchang->Sellchang_pay($Sellchang['tid'], $Sellchang['oldcid'], $Sellchang['newcid'], "2");
        if ($result["code"] != 1) { ///更新表格
            $result["data"] = $this->update_table($Sellchang['oldcid']);
            $result["url"] = $url = url('Sellchang_print', array('id' => $this->param['id']));
        }
        exit(json_encode($result));
    }

    public function Sellchang_print() {
        if (empty($this->param['id'])) {
            $this->jump(RESULT_ERROR, "参数错误");
        }
        $Sellchang = $this->logicSellchang->getSellchangInfo(['id' => $this->param['id']]); ////获取点灯的记录

        $comapnyinfo = parse_config_array('comapnyinfo');
        $this->assign('comapnyinfo', $comapnyinfo);
        $sellwhere["id"] = $Sellchang['tid'];
        $sellinfo = $this->logicSell->getSellInfo($sellwhere);
        if (empty($sellinfo)) {
            $this->jump(RESULT_ERROR, "参数错误");
        }
         $cinfo = $this->logicCemetery->getCemeteryInfo(['id' => $sellinfo['cid']]);
        $finacewhere["tid"] = $sellinfo['id'];
        $Financeinfo = $this->logicFinance->sellList($finacewhere, "*", "kmtype", false);
        $billTolamount = 0.00;
        if (!empty($Financeinfo)) {
            foreach ($Financeinfo as $value) {
                $billTolamount += $value["realprice"];
            }
        }
        $this->assign('Financeinfo', $Financeinfo);
         $this->assign('Sellchang', $Sellchang);
         $this->assign('cinfo', $cinfo);
        $this->assign('billTolamount', $billTolamount);
        $this->assign('sellinfo', $sellinfo);

        $this->assign('rq', date("Y-m-d H:i", time()));
        $member = session('member_info');
        $this->assign('useranme', $member['nickname']);
        $this->view->engine->layout(false);
        return $this->fetch('Sellchang_print');
    }

    private function update_table($cid) {
        $where['a.oldcid'] = $cid;
        $list = $this->logicSellchang->getSellchangList($where, 'a.*,s.orderNO,s.orderstatus', 'create_time desc', FALSE);
        $this->assign('cid', $cid);
        if (!empty($list[0]))
        {
            $orderstatus = $list[0]["orderstatus"];
        }
        else
        {
            $orderstatus = 1;
        }
        $usestatus = $this->logicCemetery->getCemeteryInfo(["id"=>$cid],"usestatus");
        $this->assign('usestatus', $usestatus["usestatus"]);
        $this->assign('cid', $cid);
        $this->assign('orderstate', $orderstatus);
        $this->assign('list', $list);
        $infohtml = $this->fetch("sellchang_table");

        return $infohtml;
    }

}

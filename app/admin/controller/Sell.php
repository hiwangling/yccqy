<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

namespace app\admin\controller;

/**
 * Description of Sell
 *
 * @author Administrator
 */
class Sell extends AdminBase {

    /**
     * 公墓销售列表
     */
    public function SellList() {
        $where = $this->logicSell->getWhere($this->param);

        $this->assign('list', $this->logicSell->getSellList($where, 'a.*,y.name as garden_name,q.name as area_name,c.name as c_canme', 'a.create_time desc'));
        if (empty($this->param["saveareaid"])) {
            $this->param["saveareaid"] = 0;
        }
        if (empty($this->param["savestatus"])) {
            $this->param["savestatus"] = 0;
        }
        $this->assign('formcs', $this->param);
        return $this->fetch('save_list');
    }

    public function SellList_ajax() {
        if (empty($this->param['cid'])) {
            $result = array("code" => 1, "msg" => "参数错误");
            exit(json_encode($result));
        }
        $infohtml = $this->update_table($this->param['cid']);
        $result = array("code" => 0, "msg" => "", "data" => $infohtml,);
        exit(json_encode($result));
    }

    public function Sell_ajax_show() {
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
        $sellwhere["cid"] = $this->param['cid'];
        $sellwhere["financetype"] = 1;
        $sellinfo = $this->logicSell->getsellinfo_ajax($sellwhere);
        // 收费项目
        $linkmanlist = $this->logicLinkman->getlinkmanList(['cid' => $this->param['cid']], "*", "id", FALSE);
        $this->assign('linkmanlist', $linkmanlist);
        ////墓位费是系统自带的，单独拿出来处理
        $mw_sellprice = $this->logicChargeitem->getChargeitemInfo(["id" => 2]);
        if ($mw_sellprice["showtype"] == 2) {
            $mw_sellprice["select"] = parse_config_attr($mw_sellprice["value"]);
        }
        ////////////初始化价格
        if (!empty($sellinfo["Financeinfo"])) {
            foreach ($sellinfo["Financeinfo"] as $key => $value) {
                $sellinfo["mw_sellprice"] = $value["sellprice"];
                $sellinfo["mw_realprice"] = $value["realprice"];
            }
        } else {
            $sellinfo["mw_sellprice"] = 0;
            $sellinfo["mw_realprice"] = 0;
            $sellinfo["billTolamount"] = 0;
        }

        $this->assign('mw_sellprice', $mw_sellprice); //墓位费
        $x = 1;
        $buryarray = array();
        if (isset($sellinfo["bury"])) {
            foreach ($sellinfo["bury"] as $key => $value) {
                $buryarray[$x] = $value;
                $x++;
            }
        }
        for ($z = $x; $z <= 4; $z++) {
            $buryarray[$z]["id"] = 0;
            $buryarray[$z]["vcname"] = "";
            $buryarray[$z]["sex"] = "1";
            $buryarray[$z]["sfz"] = "";
            $buryarray[$z]["birth"] = "";
            $buryarray[$z]["death"] = "";
            $buryarray[$z]["bury"] = "";
            $buryarray[$z]["burystatus"] = "0";
        }
        ////
       $payarray=$this->logicSell->get_pay_array($sellinfo["payvarchar"]);
        $this->assign('paytype', $payarray);
        $this->assign('bury', $buryarray);
        $this->assign('sellinfo', $sellinfo);
        /////////
        $this->view->engine->layout(false);
        $infohtml = $this->fetch("sell_add");
        $result = array("code" => 0, "msg" => "", "data" => $infohtml);
        exit(json_encode($result));
    }

    /////公墓购买
    public function Sell_submit() {
        if (empty($this->param['cid'])) {
            $result = array("code" => 1, "msg" => "参数错误");
            exit(json_encode($result));
        }
        $member = session('member_info');
        $this->param['seller'] = $member['id'];
        $this->param['sellname'] = $member['nickname'];
        $mw_sellprice = $this->logicChargeitem->getChargeitemInfo(["id" => 2]);
        if (empty($this->param['id'])) {
            $result = $this->logicSell->sell_cemetery_add($this->param, $mw_sellprice, []); ////增加
        } else {
            $result = $this->logicSell->sell_cemetery_edit($this->param, $mw_sellprice, []); ////增加
        }
        /////

        if ($result["code"] != 1) { ///更新表格
            $this->view->engine->layout(false);
            $result = array("code" => 0, "data" => $this->update_table($this->param['cid']));
        }
        exit(json_encode($result));
    }

    /**
     * 购墓信息删除
     */
    public function sell_delete_ajax() {
        if (empty($this->param['id'])) {
            $result = array("code" => 1, "msg" => "参数错误");
            exit(json_encode($result));
        }
        $result = $this->logicSell->sell_cemetery_Del(["id" => $this->param['id']]);

        exit(json_encode($result));
    }

    /**
     * 购墓结算
     */
    public function Sell_pay_ajax() {
        if (empty($this->param['id'])) {
            $result = array("code" => 1, "msg" => "参数错误");
            exit(json_encode($result));
        }
        $sellwhere["id"] = $this->param['id'];
        $sellinfo = $this->logicSell->getSellInfo($sellwhere);
        if (empty($sellinfo)) {
            $result = array("code" => 1, "msg" => "参数错误");
            exit(json_encode($result));
        }
        if ($sellinfo["orderstatus"] == 2) {
            $result = array("code" => 0, "msg" => "success", "isupdate" => 0, "cid" => $sellinfo['cid']);
            $result["url"] = $url = url('sell_cemetery_print', array('id' => $sellinfo['id']));
            $result["data"] = $this->update_table($sellinfo['cid']);
            exit(json_encode($result));
        }
        $result = $this->logicSell->sell_cemetery_pay($sellinfo, "2");
        if ($result["code"] != 1) { ///更新表格
            $result["data"] = $this->update_table($sellinfo['cid']);
            $result["url"] = $url = url('sell_cemetery_print', array('id' => $sellinfo['id']));
        }
        exit(json_encode($result));
    }

    public function sell_cemetery_print() {
        if (empty($this->param['id'])) {
            $this->jump(RESULT_ERROR, "参数错误");
        }

        $sellwhere["id"] = $this->param['id'];
        $sellinfo = $this->logicSell->getSellInfo($sellwhere);
        if (empty($sellinfo)) {
            $this->jump(RESULT_ERROR, "参数错误");
        }
        ////
        $sellinfo["fklx"]= $this->logicSell->get_pay_print_str($sellinfo["payvarchar"]);
        $comapnyinfo = parse_config_array('comapnyinfo');
        $this->assign('comapnyinfo', $comapnyinfo);
        $cinfo = $this->logicCemetery->getCemeteryInfo(['id' => $sellinfo['cid']]);
        $Buryinfo = $this->logicBury->getBuryList(["a.cid" => $sellinfo['cid']], "a.* ", "sort", FALSE);
        $finacewhere["tid"] = $sellinfo['id'];
        $Financeinfo = $this->logicFinance->sellList($finacewhere, "*", "kmtype", false);
        $billTolamount = 0.00;
        if (!empty($Financeinfo)) {
            foreach ($Financeinfo as $value) {
                $billTolamount += $value["realprice"];
            }
        }
        $buryname = "";
        $sex = "";
        // $Buryinfo["azdh"]=get_bury_no($Buryinfo["id"]);
        if (!empty($Buryinfo)) {
            foreach ($Buryinfo as $key => $value) {
                $buryname .= $value["vcname"] . ",";
                $sex .= getsex($value["vcname"]) . ",";
            }
            $buryname = rtrim($buryname, ",");
            $sex = rtrim($sex, ",");
        }
        $sellinfo["buryname"] = $buryname;
        $sellinfo["burysex"] = $sex;
        $this->assign('cinfo', $cinfo);
        $this->assign('Financeinfo', $Financeinfo);
        $this->assign('billTolamount', $billTolamount);
        $this->assign('sellinfo', $sellinfo);
        $this->assign('rq', date("Y-m-d H:i", time()));
        $member = session('member_info');
        $this->assign('useranme', $member['nickname']);
        $this->view->engine->layout(false);
        return $this->fetch('sell_cemetery_print');
    }

    /**
     * 删除Bury
     */
    public function Sell_deleteBury_ajax() {
        if (empty($this->param['id'])) {
            $result = array("code" => 1, "msg" => "参数错误");
            exit(json_encode($result));
        }
        $where["id"] = $this->param['id'];
        $Buryinfo = $this->logicBury->get_Bury_info($where, "*");
        if (empty($Buryinfo) || $Buryinfo["burystatus"] == 1) {
            $result = array("code" => 1, "msg" => "墓主信息错误 或者墓主已经安葬，不能删除");
            exit(json_encode($result));
        }

        $result = $this->logicBury->Bury_delete($where);
        if ($result != false) {
            $result = array("code" => 0, "msg" => "删除成功");
        } else {
            $result = array("code" => 1, "msg" => "删除失败");
        }
        exit(json_encode($result));
    }

    //////显示订单明细
    public function Sell_bill_show() {
        $sellwhere["id"] = $this->param['id'];
        $sellinfo = $this->logicSell->getsellinfo_ajax($sellwhere);
        if ($sellinfo["id"] == 0) {
            $result = array("code" => 1, "msg" => "参数错误");
            exit(json_encode($result));
        }
        $info = $this->logicCemetery->getCemeteryList(['a.id' => $sellinfo['cid']], "a.*,g.name as gardename ,r.name as areaname,t.name as typename , s.name as stylename", null, 1);

        if (empty($info[0])) {
            $result = array("code" => 1, "msg" => "参数错误");
            exit(json_encode($result));
        }
        $this->assign('info', $info[0]);
        $this->assign('sellinfo', $sellinfo);
        $this->assign('Financeinfo', $sellinfo["Financeinfo"]);
        $this->view->engine->layout(false);
        $infohtml = $this->fetch("Sell_bill");
        $result = array("code" => 0, "msg" => "", "data" => $infohtml);
        exit(json_encode($result));
    }

    //////显示增加死者信息
    public function deather_add_show() {
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
        $id = 0;
        if (!empty($this->param['id'])) {
            $id = $this->param['id'];
        }
        $Buryinfo = $this->logicBury->get_Bury_info(["id" => $id], "*");
        if (empty($Buryinfo)) {
            $Buryinfo["sex"] = 1;
        }
        $this->assign('Bury', $Buryinfo);
        $this->view->engine->layout(false);
        $infohtml = $this->fetch("deather_add");
        $result = array("code" => 0, "msg" => "", "data" => $infohtml);
        exit(json_encode($result));
    }

    /////增加，修改墓主信息
    public function deather_sumit_ajax() {
        if (empty($this->param['cid'])) {
            $result = array("code" => 1, "msg" => "参数错误");
            exit(json_encode($result));
        }

        $result = $this->logicBury->deather_add_submit($this->param); ////增加
        if ($result["code"] != 1) { ///更新表格
            $this->view->engine->layout(false);
            $result = array("code" => 0, "data" => $this->update_table($this->param['cid']));
        }
        exit(json_encode($result));
    }

    public function deather_delete_ajax() {
        if (empty($this->param['id'])) {
            $result = array("code" => 1, "msg" => "参数错误");
            exit(json_encode($result));
        }
        $result = $this->logicBury->deather_Del($this->param);
        if ($result["code"] != 1) { ///更新表格
            $this->view->engine->layout(false);
            $result = array("code" => 0, "data" => $this->update_table($this->param['cid']));
        }
        exit(json_encode($result));
    }

    public function sell_print_bury() {
        if (empty($this->param['id'])) {
            $result = array("code" => 1, "msg" => "参数错误");
            exit(json_encode($result));
        }
        $comapnyinfo = parse_config_array('comapnyinfo');
        $this->assign('comapnyinfo', $comapnyinfo);
        $cinfo = $this->logicCemetery->getCemeteryInfo(['id' => $this->param['cid']]);

        $Buryinfo = $this->logicBury->get_Bury_info(["id" => $this->param['id']], "*");
        $Buryinfo["azdh"] = get_bury_no($Buryinfo["id"]);
        if (!empty($Buryinfo["bury"])) {
            $Buryinfo["week"] = " (" . get_week($Buryinfo["bury"]) . ")";
        } else {
            $Buryinfo["week"] = "";
        }
        $this->assign('Buryinfo', $Buryinfo);
        $this->assign('cinfo', $cinfo);

        $rq = array("Y" => date("Y"), "M" => date("m"), "D" => date("d"));
        $this->assign('rq', $rq);
        $member = session('member_info');
        $this->assign('useranme', $member['nickname']);
        $this->view->engine->layout(false);
        return $this->fetch('bury_print');
    }

    public function deather_update_burystate() {
        if (empty($this->param['id'])) {
            $result = array("code" => 1, "msg" => "参数错误");
            exit(json_encode($result));
        }
        $result = $this->logicBury->update_bury_info(["id" => $this->param['id']], ["burystatus" => 1]);
    }

    private function update_table($cid) {
        $where["cid"] = $cid;
        $where["financetype"] = 1;
        $list = $this->logicSell->getSellList($where, 'a.*,cw.xszj,cw.zj,y.name as garden_name,q.name as area_name,c.name as c_canme,c.monumename', 'a.create_time desc');
       if(!empty($list[0]))
           $orderstatus=$list[0]["orderstatus"];
       else
           $orderstatus=1;
        $this->assign('cid', $cid);
        $this->assign('orderstate', $orderstatus);
        $this->assign('list', $list);
        $Buryinfo = $this->logicBury->getBuryList(["a.cid" => $cid], "a.* ", "sort", FALSE);
        $this->assign('Buryinfo', $Buryinfo);
        $this->view->engine->layout(false);
        $infohtml = $this->fetch("sell_table");

        return $infohtml;
    }

}

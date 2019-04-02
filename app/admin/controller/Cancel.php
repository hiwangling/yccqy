<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

namespace app\admin\controller;

/**
 * Description of Cancel
 *
 * @author Administrator
 */
class Cancel extends AdminBase {

    public function CancelList() {
        if (empty($this->param["resutlstatus"]))
            $this->param["resutlstatus"] = 0;
        $where = $this->logicCancel->getWhere($this->param);

        $this->assign('list', $this->logicCancel->getCancelList($where, 'a.*,c.name as cname', 'a.create_time desc'));

        $this->assign('formcs', $this->param);
        return $this->fetch('cancellist');
    }

    public function show_Cancel_ajax() {
        if (empty($this->param['cid'])) {
            $result = array("code" => 1, "msg" => "参数错误");
            exit(json_encode($result));
        }

        $infohtml = $this->update_table($this->param['cid']);
        $result = array("code" => 0, "msg" => "", "data" => $infohtml);
        exit(json_encode($result));
    }

    public function show_Cancel_sq_ajax() {

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
        /////////判断是否有正在处理的退墓单据///////
        $cwhere["cid"] = $this->param['cid'];
        $cwhere["isok"] = array("neq", 1);
        $cancelinfo = $this->logicCancel->get_Cancel_info($cwhere);
        if (!empty($cancelinfo)) {
            $result = array("code" => 1, "msg" => "有正在处理的申请，暂时不能提出申请");
            exit(json_encode($result));
        }
        /////////获取购墓单据//////////////////////////////////////
        $sellwhere["cid"] = $this->param['cid'];
        $sellwhere["financetype"] = 1;
        $sellwhere["orderstatus"] = 2;
        $sellinfo = $this->logicSell->getsellinfo_ajax($sellwhere);
        if ($sellinfo["billTolamount"] == 0) {
            $result = array("code" => 1, "msg" => "无有效的购墓单据");
            exit(json_encode($result));
        }
        $linkmanlist = $this->logicLinkman->getlinkmanList(['cid' => $this->param['cid']], "*", "id", FALSE);
        $this->assign('info', $info[0]);
        $this->assign('linkmanlist', $linkmanlist);
        $this->assign('sellinfo', $sellinfo);
        $this->assign('Financeinfo', $sellinfo["Financeinfo"]);
        $this->assign('bury', $sellinfo["bury"]);
        // 收费项目，退墓手续费，指定的
        $returnprice = $this->logicChargeitem->getChargeitemInfo(["id" => 9]);
        if (empty($returnprice)) {
            $result = array("code" => 1, "msg" => "参数错误");
            exit(json_encode($result));
        }
        //////

        $retrunprice_sxf = parse_config_array('retrunprice');
        $returnprice["defaultprice"] = $sellinfo["billTolamount"] * $retrunprice_sxf[0];
        $cancel_retrun = $sellinfo["billTolamount"] - $returnprice["defaultprice"];
        //////
        $chargeitem = $this->logicChargeitem->getChargeitemStat_value(6, 0);
        $member = $this->logicMember->getMemberList(['m.status' => ['eq', 1], 'm.is_inside' => 1], 'm.id,m.nickname', 'm.create_time desc', false);
        $this->assign('chargeitem', $chargeitem);
        $this->assign('member', $member);
        $this->assign('cancel_retrun', $cancel_retrun);
        $this->assign('returnprice', $returnprice); ////退费项目
        $this->view->engine->layout(false);
        $infohtml = $this->fetch("cancelsq");
        $result = array("code" => 0, "msg" => "", "data" => $infohtml);
        exit(json_encode($result));
    }

    public function Cancel_submit_ajax() {
        $sid = isset($this->param['sid']) ? $this->param['sid'] : FALSE;
        $cid = isset($this->param['cid']) ? $this->param['cid'] : FALSE;
        if ($sid == FALSE || $cid == FALSE) {
            $result = array("code" => 1, "msg" => "参数错误");
            exit(json_encode($result));
        }
        $member = session('member_info');
        $this->param['seller'] = $member['id'];
        $this->param['sellname'] = $member['nickname'];
        $this->param['isvoice'] = 1;
        $this->param['paytype'] = 1;
        //////////获取收费项目
        $chargeitem = $this->logicChargeitem->getChargeitemStat_value(6, -1);
        $chargeitemlist = array();
        if (!empty($chargeitem)) {
            foreach ($chargeitem as $key => $value) {
                $chargeitemlist[$value["id"]]["name"] = $value["name"];
                $chargeitemlist[$value["id"]]["id"] = $value["id"];
            }
        }
        $result = $this->logicCancel->Cancel_submit($this->param, $chargeitemlist, [], 6);
        if ($result["code"] != 1) { ///更新表格
            $result = array("code" => 0, "msg" => "申请已经提交，请等待审批", "data" => $this->update_table($this->param['cid']));
        } else {
            $result = array("code" => 1, "msg" => "申请失败", "data" => "");
        }
        exit(json_encode($result));
    }

    //////显示处理的明细
    public function show_cancell_cl_ajax() {
        $id = isset($this->param['id']) ? $this->param['id'] : FALSE;
        if ($id == FALSE) {
            $result = array("code" => 1, "msg" => "参数错误");
            exit(json_encode($result));
        }

        $canclelist = $this->logicCancel->getCancelList(['a.id' => $this->param['id']], 'a.*,c.name as cname,m.nickname', 'a.create_time desc');
        $oldsellid = 0;

        if (!empty($canclelist)) {
            $oldsellid = $canclelist[0]["oldsellid"];
        } else {
            $result = array("code" => 1, "msg" => "参数错误");
            exit(json_encode($result));
        }
        ///////
        $sellwhere["id"] = $oldsellid;
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
        /////////
        $this->assign('id', $id);
        $this->assign('cancellist', $canclelist[0]);
        $this->assign('sellinfo', $sellinfo);
        $this->assign('info', $info[0]);
        $this->assign('Financeinfo', $sellinfo["Financeinfo"]);
        $this->assign('bury', $sellinfo["bury"]);
        $this->view->engine->layout(false);
        $infohtml = $this->fetch("cancel_cl");
        $result = array("code" => 0, "msg" => "", "data" => $infohtml);
        exit(json_encode($result));
    }

    /**
     * 审批提交
     */
    public function canacel_cl_ajax() {
        $id = isset($this->param['id']) ? $this->param['id'] : FALSE;
        $type = isset($this->param['type']) ? $this->param['type'] : FALSE;
        if ($id == FALSE) {
            $result = array("code" => 1, "msg" => "参数错误");
            exit(json_encode($result));
        }
        $canclelist = $this->logicCancel->getCancelList(['a.id' => $this->param['id']], 'a.*,c.name as cname,m.nickname', 'a.create_time desc');
        if (!empty($canclelist)) {
            $Cancellistinfo = $canclelist[0];
        } else {
            $result = array("code" => 1, "msg" => "参数错误");
            exit(json_encode($result));
        }
        $result = $this->logicCancel->Sellcancel_cl_ajax($this->param);
        if ($type == 2) { ////审批通过 
            $result = $this->logicSell->Cancel_cl($Cancellistinfo["oldsellid"],$Cancellistinfo["tid"],$type,$id);
        } else {
            $result = array("code" => 0, "msg" => "处理完成", "data" => "");
        }

        exit(json_encode($result));
    }

    public function Canacel_delete_ajax() {
        if (empty($this->param['id'])) {
            $result = array("code" => 1, "msg" => "参数错误");
            exit(json_encode($result));
        }
        $where["id"] = $this->param['id'];
        $Cancel = $this->logicCancel->get_Cancel_info($where);

        if (empty($Cancel)) {
            $result = array("code" => 1, "msg" => "数据异常，请检查");
            return $result;
        }
        $result = $this->logicCancel->CancelDel($Cancel);
        if ($result["code"] != 1) { ///更新表格
            $result["data"] = $this->update_table($Cancel['cid']);
        }
        exit(json_encode($result));
    }

    public function Canacel_pay_ajax() {
        if (empty($this->param['id'])) {
            $result = array("code" => 1, "msg" => "参数错误");
            exit(json_encode($result));
        }
         $Cancel = $this->logicCancel->get_Cancel_info(["id"=>$this->param['id']]);  
          if (empty($Cancel)) {
            $result = array("code" => 1, "msg" => "数据异常，请检查");
            return $result;
        }
        $sellwhere["id"] = $Cancel['tid'];
        $sellinfo = $this->logicSell->getSellInfo($sellwhere,true);
        if (empty($sellinfo)) {
            $result = array("code" => 1, "msg" => "参数错误");
            exit(json_encode($result));
        }
        if ($sellinfo["orderstatus"] == 2) {
            $result = array("code" => 0, "msg" => "success");
            $result["url"] = $url = url('Buryservice/Buryservice_print', array('id' => $sellinfo['id']));
            $result["data"] = $this->update_table($sellinfo['cid']);
            exit(json_encode($result));
        }
        $result = $this->logicCancel->cancel_pay($sellinfo, "2");
        if ($result["code"] != 1) { ///更新表格
            $result["data"] = $this->update_table($sellinfo['cid']);
            $result["url"] = $url = url('Buryservice/Buryservice_print', array('id' => $sellinfo['id']));
        }
        exit(json_encode($result));
    }
    
    private function update_table($cid) {
        $where["a.cid"] = $cid;
        $list = $this->logicCancel->getCancelList($where, 'a.*,m.nickname,s.id as sid,s.orderstatus', 'create_time desc', FALSE);
        $this->assign('cid', $cid);
        if (!empty($list[0]))
            $orderstatus = $list[0]["orderstatus"];
        else
            $orderstatus = 1;
        $this->assign('cid', $cid);
        $this->assign('orderstate', $orderstatus);
        $this->assign('list', $list);
        $infohtml = $this->fetch("cancel_table");

        return $infohtml;
    }

}

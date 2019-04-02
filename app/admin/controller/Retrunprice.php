<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

namespace app\admin\controller;

/**
 * Description of Retrunprice
 *
 * @author Administrator
 */
class Retrunprice extends AdminBase {
    
     public function RetrunpriceList() {
        if (empty($this->param["resutlstatus"]))
            $this->param["resutlstatus"] = 0;
        $where = $this->logicRetrunprice->getWhere($this->param);

        $this->assign('list', $this->logicRetrunprice->getRetrunpriceList($where, 'a.*,c.name as cname,s.orderNO,s.orderbegin,s.financetype', 'a.create_time desc'));

        $this->assign('formcs', $this->param);
        return $this->fetch('retrunpricelist');
    }
    
    
    
    public function show_Retrunprice_sq_ajax() {
         if (empty($this->param['id'])) {
            $result = array("code" => 1, "msg" => "参数错误");
            exit(json_encode($result));
        }
        $sellwhere["id"] = $this->param['id'];
        $sellinfo = $this->logicSell->getsellinfo_ajax($sellwhere);
         
        $info = $this->logicCemetery->getCemeteryList(['a.id' =>$sellinfo['cid']], "a.*,g.name as gardename ,r.name as areaname,t.name as typename , s.name as stylename", null, 1);

        if (empty($info[0])) {
            $result = array("code" => 1, "msg" => "参数错误");
            exit(json_encode($result));
        }
        $this->assign('info', $info[0]);
        /////////判断是否有正在处理的退墓单据///////
        $cwhere["tid"] = $sellinfo['id'];
        $cwhere["isok"] = array("neq", 1);
        $Retrunpriceinfo = $this->logicRetrunprice->get_Retrunprice_info($cwhere);
        if (!empty($Retrunpriceinfo)) {
            $result = array("code" => 1, "msg" => "有正在处理的申请，暂时不能提出申请");
            exit(json_encode($result));
        }
        /////////获取购墓单据//////////////////////////////////////
         $this->assign('info', $info[0]);
         $this->assign('sellinfo', $sellinfo);
        $this->assign('Financeinfo', $sellinfo["Financeinfo"]);
        $member = $this->logicMember->getMemberList(['m.status' => ['eq', 1], 'm.is_inside' => 1], 'm.id,m.nickname', 'm.create_time desc', false);
          $this->assign('member', $member);
       $this->view->engine->layout(false);
        $infohtml = $this->fetch("retrunpricesq");
        $result = array("code" => 0, "msg" => "", "data" => $infohtml);
        exit(json_encode($result));
    }
    
    public function Retrunprice_submit_ajax() {
        $sid = isset($this->param['sid']) ? $this->param['sid'] : FALSE;
        $cid = isset($this->param['cid']) ? $this->param['cid'] : FALSE;
        if ($sid == FALSE || $cid == FALSE) {
            $result = array("code" => 1, "msg" => "参数错误");
            exit(json_encode($result));
        }
        $member = session('member_info');
        $this->param['seller'] = $member['id'];
        $this->param['sellname'] = $member['nickname'];
        $result = $this->logicRetrunprice->Retrunprice_submit($this->param);
       
        exit(json_encode($result));
    }
    
    //////显示处理的明细
    public function show_Retrunprice_cl_ajax() {
        $id = isset($this->param['id']) ? $this->param['id'] : FALSE;
        if ($id == FALSE) {
            $result = array("code" => 1, "msg" => "参数错误");
            exit(json_encode($result));
        }

        $Retrunpricelist = $this->logicRetrunprice->getRetrunpriceInfo(['id' => $this->param['id']]);
        if ($Retrunpricelist)
        $sellwhere["id"] = $Retrunpricelist["tid"];
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
        $this->assign('Retrunpricelist', $Retrunpricelist);
        $this->assign('sellinfo', $sellinfo);
        $this->assign('info', $info[0]);
        $this->assign('Financeinfo', $sellinfo["Financeinfo"]);
        
        $this->view->engine->layout(false);
        $infohtml = $this->fetch("retrunprice_cl");
        $result = array("code" => 0, "msg" => "", "data" => $infohtml);
        exit(json_encode($result));
    }
    
     public function Retrunprice_cl_ajax() {
        $id = isset($this->param['id']) ? $this->param['id'] : FALSE;
        $type = isset($this->param['type']) ? $this->param['type'] : FALSE;
        if ($id == FALSE) {
            $result = array("code" => 1, "msg" => "参数错误");
            exit(json_encode($result));
        }
       $result = $this->logicRetrunprice->Retrunprice_cl_ajax($this->param);
       exit(json_encode($result));
    }

     
}

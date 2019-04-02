<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

namespace app\admin\controller;

/**
 * Description of Light
 *
 * @author Administrator
 */
class Light extends AdminBase {

    /**
     * 寄存信息列表
     */
    public function LightList() {
        $where = $this->logicLight->getWhere($this->param);
        $this->assign('savearea', $this->logicLightarea->getLightareaList([], 'id,name', 'sort asc', FALSE));
        $this->assign('list', $this->logicLight->getLightList($where, 'a.*,sa.name as saveareananme,y.name as garden_name,q.name as area_name,c.name as c_canme', 'a.create_time desc'));
        if (empty($this->param["saveareaid"])) {
            $this->param["saveareaid"] = 0;
        }
        if (empty($this->param["savestatus"])) {
            $this->param["savestatus"] = 0;
        }
        $this->assign('formcs', $this->param);
        return $this->fetch('save_list');
    }

    /**
     * 寄存信息添加
     */
    public function Lightlist_ajax() {
        if (empty($this->param['cid'])) {
            $result = array("code" => 1, "msg" => "参数错误");
            exit(json_encode($result));
        }
        $infohtml = $this->update_table($this->param['cid']);
        $result = array("code" => 0, "msg" => "", "data" => $infohtml);
        exit(json_encode($result));
    }

    public function show_Light_ajax() {
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
         $Buryinfo= $this->logicBury->getBuryList(["cid"=> $this->param['cid']],"a.* ","sort",FALSE);
        $lid = isset($this->param['lid']) ? $this->param['lid'] : '0';
        $chargeitem = $this->logicChargeitem->getChargeitemInfo(['id' => 10]); ////获取点灯的服务项目
        /////获取点灯计划量
        /////////////
        $lightinfo = $this->logicLight->getLightInfo(['id' => $lid]); ////获取点灯的记录
        if (empty($lightinfo)) {
            $lightinfo["tid"] = 0;
            $lightinfo["amount"] = 1;
            $lightinfo["price"] = $chargeitem["defaultprice"];
            $lightinfo["paytype"] = 1;

            $lightinfo["billTolamount"] = $lightinfo["lightprice"] * 1;
            ////////////////////
            $curr = time();
            $whereplan[DATA_STATUS_NAME] = ['neq', DATA_DELETE];
            $whereplan["begindate"] = ['elt', $curr];
            $whereplan["enddate"] = ['egt', $curr];
            $lightplan = $this->logiclightplan->getlightplanInfo($whereplan);
             
            if (empty($lightplan)) {
                $result = array("code" => 1, "msg" => "无有效的点灯计划表，请设置点灯计划");
                exit(json_encode($result));
            }
            $lightinfo["lightplanid"] = $lightplan["id"];
            ///////////////////////
        } else {
            $lightinfo["billTolamount"] = $lightinfo["amount"] * $lightinfo["price"];
             
           $lightplan = $this->logiclightplan->getlightplanInfo(["id" => $lightinfo["lightplanid"]]);
        }

        $sellwhere["id"] = $lightinfo["tid"];
        $sellinfo = $this->logicSell->getsellinfo_ajax($sellwhere, FALSE);
        $linkmanlist = $this->logicLinkman->getlinkmanList(['cid' => $this->param['cid']], "*", "id", FALSE);
        $payarray = $this->logicSell->get_pay_array($sellinfo["payvarchar"]);
        $Buryinfolist=$this->logicSell->get_buryname_array($sellinfo["buryname"],$Buryinfo);
        $this->assign('bury', $Buryinfolist);
        $this->assign('paytype', $payarray);
        $this->assign('light', $lightinfo);
        $this->assign('lightplan', $lightplan);
        $this->assign('linkmanlist', $linkmanlist);
        /////////
        $this->view->engine->layout(false);
        $infohtml = $this->fetch("light_add");
        $result = array("code" => 0, "msg" => "", "data" => $infohtml);
        exit(json_encode($result));
    }

    public function Light_submit_ajax() {
        if (empty($this->param['cid'])) {
            $result = array("code" => 1, "msg" => "参数错误");
            exit(json_encode($result));
        }
         $buryname="";
          if (isset($this->param['bury']))
           {
               foreach ($this->param['bury'] as $key => $value) {
                $buryname.=$value.",";
            }
            $this->param["buryname"] = rtrim($buryname,",");
           }
        $member = session('member_info');
        $this->param['seller'] = $member['id'];
        $this->param['sellname'] = $member['nickname'];
        if (empty($this->param['lid']))
            $result = $this->logicLight->Light_add_submit($this->param);
        else
            $result = $this->logicLight->Light_edit_submit($this->param);
        if ($result["code"] != 1) { ///更新表格
            $result["data"] = $this->update_table($this->param['cid']);
        }
        exit(json_encode($result));
    }

    /**
     * 寄存信息删除
     */
    public function Light_delete_ajax() {
        if (empty($this->param['lid'])) {
            $result = array("code" => 1, "msg" => "参数错误");
            exit(json_encode($result));
        }
        $lightinfo = $this->logicLight->getLightInfo(['id' => $this->param['lid']]); ////获取点灯的记录
         if (empty($lightinfo)) {
            $result = array("code" => 1, "msg" => "数据异常，请检查");
            return $result;
        }
        $result = $this->logicLight->Light_Del($lightinfo);
        if($result["code"]!=1)
        { 
            $result["data"]=$this->update_table($lightinfo['cid']);
         } 
          exit(json_encode($result));
         
    }
    
     public function Light_pay_ajax()
    {
        if (empty($this->param['id'])) {
            $result = array("code" => 1, "msg" => "参数错误");
            exit(json_encode($result));
        }
      $lightinfo = $this->logicLight->getLightInfo(['id' => $this->param['id']]);  
          if (empty($lightinfo)) {
            $result = array("code" => 1, "msg" => "数据异常，请检查");
            return $result;
        }
        $sellwhere["id"] = $lightinfo['tid'];
        $sellinfo = $this->logicSell->getSellInfo($sellwhere);
        if (empty($sellinfo)) {
            $result = array("code" => 1, "msg" => "参数错误");
            exit(json_encode($result));
        }
        if ($sellinfo["orderstatus"] == 2) {
            $result = array("code" => 0, "msg" => "success");
            $result["url"] = $url = url('light_print', array('id' => $this->param['id'])); 
            $result["data"] = $this->update_table($sellinfo['cid']);
            exit(json_encode($result));
        }
        $result = $this->logicSell->Buryservice_pay($sellinfo, "2");
        if ($result["code"] != 1) { ///更新表格
            $result["data"] = $this->update_table($sellinfo['cid']);
            $result["url"] = $url = url('light_print', array('id' => $this->param['id']));
        }
        exit(json_encode($result));
    }

    public function  light_print()
    {
        if (empty($this->param['id'])) {
            $this->jump(RESULT_ERROR, "参数错误");
        }
      $lightinfo = $this->logicLight->getLightInfo(['id' => $this->param['id']]);  
         
        $comapnyinfo = parse_config_array('comapnyinfo');
        $this->assign('comapnyinfo', $comapnyinfo);
        $sellwhere["id"] =$lightinfo['tid'];
        $sellinfo = $this->logicSell->getSellInfo($sellwhere);
        if (empty($sellinfo)) {
            $this->jump(RESULT_ERROR, "参数错误");
        }
        $lightplan = $this->logiclightplan->getlightplanInfo(["id" => $lightinfo["lightplanid"]]);
        $cinfo = $this->logicCemetery->getCemeteryInfo(['id' => $sellinfo['cid']]);
        $finacewhere["tid"] = $sellinfo['id'];
        $Financeinfo = $this->logicFinance->sellList($finacewhere, "*", "kmtype", false);
        $billTolamount = 0.00;
        if (!empty($Financeinfo)) {
            foreach ($Financeinfo as $value) {
                $billTolamount += $value["realprice"];
            }
        }
        $this->assign('cinfo', $cinfo);
        $this->assign('Financeinfo', $Financeinfo);
        $this->assign('billTolamount', $billTolamount);
        $this->assign('sellinfo', $sellinfo);
         $this->assign('lightplan', $lightplan);
        $this->assign('rq', date("Y-m-d H:i", time()));
        $member = session('member_info');
        $this->assign('useranme', $member['nickname']);
        $this->view->engine->layout(false);
        return $this->fetch('light_print'); 
    }

    private function update_table($cid) {
        $where["a.cid"] = $cid;
        $where["a.isstory"] = 0;
        $list = $this->logicLight->getLightList($where, 'a.*,s.buryname,s.orderstatus,p.planname,p.vcdesc as planvcdesc', 'create_time desc', FALSE);
        $this->assign('cid', $cid);
        if (!empty($list[0]))
            $orderstatus = $list[0]["orderstatus"];
        else
            $orderstatus = 1;
        $this->assign('cid', $cid);
        $this->assign('orderstate', $orderstatus);
        $this->assign('list', $list);
        $infohtml = $this->fetch("light_table");

        return $infohtml;
    }

}

?>

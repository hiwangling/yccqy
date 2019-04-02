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
    
    
    public function Chang_ajax_show()
    {
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
        $this->assign('CemeteryType', $this->logicCemeteryType->getCemeteryTypeList(["status" => 1]));
        ////墓位费是系统自带的，单独拿出来处理
        /*$mw_sellprice = $this->logicChargeitem->getChargeitemInfo(["id" => 2]);
        if ($mw_sellprice["showtype"] == 2) {
            $mw_sellprice["select"] = parse_config_attr($mw_sellprice["value"]);
        }*/
        $chargeitem = $this->logicChargeitem->getChargeitemStat_value(5,-1);
         ////////服务项目///////
        $Serviceinfo_where["servicetype"]=array('like','%,5,%');
        $Serviceinfoitem = $this->logicServiceinfo->getServiceinfoList($Serviceinfo_where, "a.id,a.servicename,a.price,a.manager,deptid", "sort", FALSE);
        foreach ($Serviceinfoitem as $key => $value) {
            $Serviceinfoitem[$key]["ischeck"] = 0;
        }
      
        ///////////
        $sellwhere["cid"]=$this->param['cid'];
        $sellwhere["financetype"]=1;///购墓收费
        $oldsellinfo= $this->logicSell->getsellinfo_ajax($sellwhere);
        $buryanme="";
        if (isset($oldsellinfo["bury"])) {
            foreach ($oldsellinfo["bury"] as $key => $value) {
                 $buryanme.= $value["vcname"].",";
              }
        }
         //////联系人///////
        $linkmanlist = $this->logicLinkman->getlinkmanList(['cid' => $this->param['cid']], "*", "id", FALSE);
 
       
        $sellinfo=array();
       //  $sellinfo["mw_sellprice"] = 0;
       //  $sellinfo["mw_realprice"] = 0;
        $sellinfo["billTolamount"] = 0;
        $sellinfo["sex"]=1;
        $sellinfo['isvoice'] = 0;
        $sellinfo['paytype'] = "1";
       /////////////自动填写联系人///////////////////////////
        if (!empty($oldsellinfo["buyer"])) {
            foreach ($linkmanlist as $key => $value) {
                if ($value["linkname"] == $oldsellinfo["buyer"]) {
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
        /////////////
        $this->assign('chargeitem', $chargeitem);
     //   $this->assign('mw_sellprice', $mw_sellprice);//墓位费
        $this->assign('Serviceinfoitem', $Serviceinfoitem);
        $paytype = parse_config_array('Payment');
        $this->assign('paytype', $paytype);
        $this->assign('oldsellinfo', $oldsellinfo);
        $this->assign('sellinfo', $sellinfo);
        $this->assign('buryanme', $buryanme);
        if (!empty($oldsellinfo["Financeinfo"]))
         $this->assign('oldFinanceinfo', $oldsellinfo["Financeinfo"]);
        else
        {
         $this->assign('oldFinanceinfo', "");
        }
        $this->assign('linkmanlist', $linkmanlist);
        /////////
        $this->view->engine->layout(false);
        $infohtml = $this->fetch("chang_add");
        $result = array("code" => 0, "msg" => "", "data" => $infohtml);
        exit(json_encode($result));  
    }
    
    
     /////公墓购买
    public function Chang_submit() {
        if (empty($this->param['newcid']) || empty($this->param['oldcid'])) {
            $result = array("code" => 1, "msg" => "参数错误");
            exit(json_encode($result));
        }
        ///////////////服务项目////////////
          $Serviceinfo_where["servicetype"]=array('like','%,5,%');
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
         $result = $this->logicSellchang->Chang_submit($this->param, $chargeitemlist,$Serviceinfoitem); ////增加
          exit(json_encode($result));
    }
    
    
}


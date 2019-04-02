<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

namespace app\admin\controller;

/**
 * Description of Monumen
 *
 * @author Administrator
 */
class Monumen extends AdminBase {
    
    
    public function MonumenList_ajax()
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
      
         ////////碑文类型
         $iseditmb=1;
        if (!empty($info[0]["monumenhtml"])) {
               // $mbhtml = htmlspecialchars_decode($Cemeteryinfo["monumenhtml"]);
                $mbhtml = htmlspecialchars_decode(html_entity_decode($info[0]["monumenhtml"], ENT_QUOTES, "UTF-8"));
                $mbhtml_b =$info[0]["monumenhtml_b"]; //htmlspecialchars_decode(html_entity_decode($info[0]["monumenhtml_b"], ENT_QUOTES, "UTF-8"));
            
            }else {
                $iseditmb = '0';
                $mbhtml = $this->fetch("monument");
                $mbhtml_b = $this->fetch("monument_b");
            }
          
        ///获取死者信息//////
         $this->assign('info', $info[0]);
         $this->assign('iseditmb', $iseditmb);
         $this->assign('mbhtml', $mbhtml);
         $this->assign('mbhtml_b', $mbhtml_b);
         $Buryinfo= $this->logicBury->getBuryList(["cid"=> $this->param['cid']],"a.* ","sort",FALSE);
          foreach ($Buryinfo as $key => $value) {
            $Buryinfo[$key]['sex'] = $value['sex'] == 1 ?'母':'父';
         }
         $this->assign('bury', $Buryinfo);
        $this->view->engine->layout(false);
        $monumen_table=$this->update_table($this->param['cid']);
         $this->assign('monumen_table', $monumen_table);
        $infohtml = $this->fetch("monumen_index");
        $result = array("code" => 0, "msg" => "", "data" => $infohtml);
        exit(json_encode($result));  
    }
    
    public  function Monumenservice_ajax_show()
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
        ///////死者信息
         $Buryinfo= $this->logicBury->getBuryList(["cid"=> $this->param['cid']],"a.* ","sort",FALSE);
         
         
       
        //////联系人信息
        $linkmanlist = $this->logicLinkman->getlinkmanList(['cid' => $this->param['cid']], "*", "id", FALSE);
        ////////销售单据信息 
        if (!empty($this->param['id']))
        {
           $monumeninfo = $this->logicMonumen->getMonumenInfo(["id"=>$this->param['id']]);  
        }
        else
        {
           $monumeninfo["tid"]=0; 
           $monumeninfo["cid"]=$this->param['cid'];
           $monumeninfo["monumendate"]= date("Y-m-d");
           $monumeninfo["monumenstyle"]= 1;
           $monumeninfo["monumenttype"]= 1;
        }
        $sellwhere["cid"] = $this->param['cid'];
        $sellwhere["id"] = $monumeninfo["tid"];
        $sellwhere["financetype"] = 8;
        $sellinfo = $this->logicSell->getsellinfo_ajax($sellwhere, FALSE);
        ////////////////////////////////////////////
        
        //////////
        // 收费项目
        $chargeitem = $this->logicChargeitem->getChargeitemStat_value(8, 0);
        ////////服务项目///////
        $Serviceinfo_where["servicetype"] = array('like', '%,8,%');
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
        $this->assign('monumentype', parse_config_array('monumentype'));
        $this->assign('monumenstyle', parse_config_array('monumenstyle'));
        $this->assign('chargeitem', $chargeitem);
        $this->assign('Serviceinfoitem', $Serviceinfoitem);
        $payarray=$this->logicSell->get_pay_array($sellinfo["payvarchar"]);
      
         $Buryinfolist=$this->logicSell->get_buryname_array($sellinfo["buryname"],$Buryinfo);
           $this->assign('bury', $Buryinfolist);
        $this->assign('paytype', $payarray);
        $this->assign('sellinfo', $sellinfo);
        $this->assign('linkmanlist', $linkmanlist);
        $this->assign('Buryinfo', $Buryinfo);
        $this->assign('monumeninfo', $monumeninfo);
        /////////
        $this->view->engine->layout(false);
        $infohtml = $this->fetch("monumen_add");
        $result = array("code" => 0, "msg" => "", "data" => $infohtml);
        exit(json_encode($result));  
    }
    
    public function Monumenservice_save_submit()
    {
         if (empty($this->param['cid']) ) {
            $result = array("code" => 1, "msg" => "参数错误");
            exit(json_encode($result));
        }
        ///////////////服务项目////////////
        $Serviceinfo_where["servicetype"] = array('like', '%,8,%');
        $Serviceinfoitem = $this->logicServiceinfo->getServiceinfoList($Serviceinfo_where, "a.id,a.servicename,a.price,a.manager,a.deptid", "sort", FALSE);
        //////////获取收费项目
        $chargeitem = $this->logicChargeitem->getChargeitemStat_value(8, -1);
        $chargeitemlist = array();
        if (!empty($chargeitem)) {
            foreach ($chargeitem as $key => $value) {
                $chargeitemlist[$value["id"]]["name"] = $value["name"];
                $chargeitemlist[$value["id"]]["id"] = $value["id"];
            }
        }
        //////////////
        $buryname="";
          if (isset($this->param['bury']))
           {
               foreach ($this->param['bury'] as $key => $value) {
                $buryname.=$value.",";
            }
            $this->param["buryname"] = rtrim($buryname,",");
           }
        ////////
        $member = session('member_info');
        $this->param['seller'] = $member['id'];
        $this->param['sellname'] = $member['nickname'];
        if (empty($this->param['id'])) {
             $result = $this->logicMonumen->Monumen_add_submit($this->param, $chargeitemlist, $Serviceinfoitem, 8); ////增加
        } else {
            
            $result = $this->logicMonumen->Monumen_edit_submit($this->param, $chargeitemlist, $Serviceinfoitem); ////增加
        }
        /////
        if ($result["code"] != 1) { ///更新表格
            $result = array("code" => 0, "data" => $this->update_table($this->param['cid']));
        }
        exit(json_encode($result));
    }
 
    public function Monumenservice_delete_ajax() {
        if (empty($this->param['id'])) {
            $result = array("code" => 1, "msg" => "参数错误");
            exit(json_encode($result));
        }
         $monumeninfo = $this->logicMonumen->getMonumenInfo(["id"=>$this->param['id']]);  
          if (empty($monumeninfo)) {
            $result = array("code" => 1, "msg" => "数据异常，请检查");
            return $result;
        }
        $result1 =  $this->logicMonumen->Monumen_Del($monumeninfo);
        if($result1)
        {
             $result = array("code" => 0,"msg" => "success","data" => $this->update_table($monumeninfo['cid']));
         } 
          exit(json_encode($result));
    }
    
    public function Monumenservice_pay_ajax()
    {
        if (empty($this->param['id'])) {
            $result = array("code" => 1, "msg" => "参数错误");
            exit(json_encode($result));
        }
        $monumeninfo = $this->logicMonumen->getMonumenInfo(["id"=>$this->param['id']]);  
          if (empty($monumeninfo)) {
            $result = array("code" => 1, "msg" => "数据异常，请检查");
            return $result;
        }
        $sellwhere["id"] = $monumeninfo['tid'];
        $sellinfo = $this->logicSell->getSellInfo($sellwhere);
        if (empty($sellinfo)) {
            $result = array("code" => 1, "msg" => "参数错误");
            exit(json_encode($result));
        }
        if ($sellinfo["orderstatus"] == 2) {
            $result = array("code" => 0, "msg" => "success");
            if ($this->param['printtype']==1)
            {
                $result["url"] = $url = url('monumen_print', array('id' => $this->param['id']));
            }
            else
            {
              $result["url"] = $url = url('Buryservice/Buryservice_print', array('id' => $sellinfo['id'])); 
            }
            $result["data"] = $this->update_table($sellinfo['cid']);
            exit(json_encode($result));
        }
        $result = $this->logicSell->Buryservice_pay($sellinfo, "2");
        if ($result["code"] != 1) { ///更新表格
            $result["data"] = $this->update_table($sellinfo['cid']);
          if ($this->param['printtype']==1)
            {
                $result["url"] = $url = url('monumen_print', array('id' => $this->param['id']));
            }
            else
            {
              $result["url"] = $url = url('Buryservice/Buryservice_print', array('id' => $sellinfo['id'])); 
            }
        }
        exit(json_encode($result));
    }
    
    public function monumen_print()
    {
      if (empty($this->param['id'])) {
            $this->jump(RESULT_ERROR, "参数错误");
        }
        $monumeninfo = $this->logicMonumen->getMonumenInfo(["id"=>$this->param['id']]);   
        $comapnyinfo = parse_config_array('comapnyinfo');
        $this->assign('comapnyinfo', $comapnyinfo);
         $info = $this->logicCemetery->getCemeteryList(['a.id' => $monumeninfo['cid']], "a.*,g.name as gardename ,r.name as areaname,t.name as typename , s.name as stylename", null, 1);
        
        if (empty($info[0])) {
            $result = array("code" => 1, "msg" => "参数错误");
            exit(json_encode($result));
        }
        $this->assign('cinfo', $info[0]);
       
         $this->assign('monumeninfo', $monumeninfo);
        $rq = array("Y" => date("Y"), "M" => date("m"), "D" => date("d"));
        $this->assign('rq', $rq);
        $member = session('member_info');
        $this->assign('useranme', $member['nickname']);
        $this->view->engine->layout(false);
        return $this->fetch('monumen_print');  
    }

    public function monumen_update_ajax()
   {
        if ($this->param['type']==1) 
        {
          $data=array(
                         'monumenhtml' =>$this->param['htmls']
                          );   
        }
        else
        {
             $data=array(
                  'monumenhtml_b' =>$this->param['htmls']
                          );   
        }
         
        $result= $this->logicCemetery->update_CemeteryInfo (["id"=>$this->param['cid']],$data);
          if ($result!==false)
                 $result = array("code" => 0, "msg" =>"碑文提交成功");
          else
               $result = array("code" => 1, "msg" =>"碑文提交失败");
        exit(json_encode($result));
   }
   
   private function update_table($cid) {
        $where["a.cid"] = $cid;
        $where["a.isstory"] = 0;
        $list = $this->logicMonumen->getMonumenList($where, 'a.*,s.id as sid,s.orderstatus', 'create_time desc');
        $this->assign('cid', $cid);
        if(!empty($list[0]))
           $orderstatus=$list[0]["orderstatus"];
       else
           $orderstatus=1;
        $this->assign('cid', $cid);
        $this->assign('orderstate', $orderstatus);
        $this->assign('list', $list);
         $infohtml = $this->fetch("monumen_table");

        return $infohtml;
    }
}

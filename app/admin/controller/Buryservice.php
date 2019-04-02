<?php

/*
殡葬服务收费单
 */

namespace app\admin\controller;

/**
 * Description of Buryservice
 *
 * @author Administrator
 */
class Buryservice extends AdminBase {

    /**
     * 公墓销售列表
     */
    public function BuryserviceList() {
        $where = $this->logicSell->getWhere($this->param);
        $where["financetype"]=3;
        $this->assign('list', $this->logicSell->getSellList($where, 'a.*,y.name as garden_name,q.name as area_name,c.name as c_canme', 'a.create_time desc'));
     
        $this->assign('formcs', $this->param);
        return $this->fetch('save_list');
    }

    public function BuryserviceList_ajax() {
        if (empty($this->param['cid'])) {
            $result = array("code" => 1, "msg" => "参数错误");
            exit(json_encode($result));
        }
        $infohtml = $this->update_table($this->param['cid']);
        $result = array("code" => 0, "msg" => "", "data" => $infohtml);
        exit(json_encode($result));
    }
    
    
    
    public  function Buryservice_ajax_show()
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
         $this->assign('bury', $Buryinfo);
       
        //////联系人信息
        $linkmanlist = $this->logicLinkman->getlinkmanList(['cid' => $this->param['cid']], "*", "id", FALSE);
        ////////销售单据信息 
        $sellwhere["cid"] = $this->param['cid'];
        $sellwhere["id"] = $this->param['id'];
        $sellwhere["financetype"] = 3;
        $sellinfo = $this->logicSell->getsellinfo_ajax($sellwhere, FALSE);
        //////////
        // 收费项目
        $chargeitem = $this->logicChargeitem->getChargeitemStat_value(3, 0);
        ////////服务项目///////
        $Serviceinfo_where["servicetype"] = array('like', '%,3,%');
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
        
        /////////////////////////////////////////////////
        $Buryinfolist=$this->logicSell->get_buryname_array($sellinfo["buryname"],$Buryinfo);
        $payarray=$this->logicSell->get_pay_array($sellinfo["payvarchar"]);
         $this->assign('Bury', $Buryinfolist);
        $this->assign('paytype', $payarray);
        $this->assign('sellinfo', $sellinfo);
        $this->assign('linkmanlist', $linkmanlist);
       

        /////////
        $this->view->engine->layout(false);
        $infohtml = $this->fetch("buryservice_add");
        $result = array("code" => 0, "msg" => "", "data" => $infohtml);
        exit(json_encode($result));  
    }

    public function Buryservice_save_submit() {
        if (empty($this->param['cid']) ) {
            $result = array("code" => 1, "msg" => "参数错误");
            exit(json_encode($result));
        }
        ///////////////服务项目////////////
        $Serviceinfo_where["servicetype"] = array('like', '%,3,%');
        $Serviceinfoitem = $this->logicServiceinfo->getServiceinfoList($Serviceinfo_where, "a.id,a.servicename,a.price,a.manager,a.deptid", "sort", FALSE);
        //////////获取收费项目
        $chargeitem = $this->logicChargeitem->getChargeitemStat_value(3, -1);
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
        //       echo "<pre>";
        // print_r($this->param);
        // echo "</pre>";
        if (empty($this->param['id'])) {
             $result = $this->logicSell->Sell_add_submit($this->param, $chargeitemlist, $Serviceinfoitem, 3); ////增加
        } else {
            $result = $this->logicSell->Sell_edit_submit($this->param, $chargeitemlist, $Serviceinfoitem); ////增加
        }
        /////
        if ($result["code"] != 1) { ///更新表格
            $result = array("code" => 0, "data" => $this->update_table($this->param['cid']));
        }
        exit(json_encode($result));
    }
    
    
     /**
     * 购墓信息删除
     */
    public function Buryservice_delete_ajax() {
        if (empty($this->param['id'])) {
            $result = array("code" => 1, "msg" => "参数错误");
            exit(json_encode($result));
        }
          $sellinfo = $this->logicSell->getSellInfo(["id" => $this->param['id']]);
        
        if (empty($sellinfo)) {
            $result = array("code" => 1, "msg" => "数据异常，请检查");
            return $result;
        }
        $result1 = $this->logicSell->Sellinfo_del($sellinfo['id']);
        if($result1)
        {
          $result = array("code" => 0,"msg" => "success","data" => $this->update_table($sellinfo['cid']));
           
        } 
        else {
            $result = array("code" => 1, "msg" => "error");
        }
       
        exit(json_encode($result));
    }
    
    public function Buryservice_pay_ajax() {
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
            $result = array("code" => 0, "msg" => "success");
            $result["url"] = $url = url('Buryservice_print', array('id' => $sellinfo['id']));
            $result["data"] = $this->update_table($sellinfo['cid']);
            exit(json_encode($result));
        }
        $result = $this->logicSell->Buryservice_pay($sellinfo, "2");
        if ($result["code"] != 1) { ///更新表格
            $result["data"] = $this->update_table($sellinfo['cid']);
            $result["url"] = $url = url('Buryservice_print', array('id' => $sellinfo['id']));
        }
        exit(json_encode($result));
    }
    
    public function Buryservice_print()
    {
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
       // $Buryinfo = $this->logicBury->getBuryList(["a.cid" => $sellinfo['cid']], "a.* ", "sort", FALSE);
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
        return $this->fetch('buryservice_print'); 
    }
    
    private function update_table($cid) {
        $where["cid"] = $cid;
        $where["financetype"] =3;
        $where["isstory"] =0;
        $list = $this->logicSell->getSellList_nodeathname($where, 'a.*,cw.zj,y.name as garden_name,q.name as area_name,c.name as c_canme', 'a.create_time desc');
        $this->assign('cid', $cid);
        if(!empty($list[0]))
           $orderstatus=$list[0]["orderstatus"];
       else
           $orderstatus=1;
        $this->assign('cid', $cid);
        $this->assign('orderstate', $orderstatus);
        $this->assign('list', $list);
         $infohtml = $this->fetch("buryservice_table");

        return $infohtml;
    }

    
}
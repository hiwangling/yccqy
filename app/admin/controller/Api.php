<?php
// +---------------------------------------------------------------------+
// | OneBase    | [ WE CAN DO IT JUST THINK ]                            |
// +---------------------------------------------------------------------+
// | Licensed   | http://www.apache.org/licenses/LICENSE-2.0 )           |
// +---------------------------------------------------------------------+
// | Author     | Bigotry <3162875@qq.com>                               |
// +---------------------------------------------------------------------+
// | Repository | https://gitee.com/Bigotry/OneBase                      |
// +---------------------------------------------------------------------+

namespace app\admin\controller;

/**
 * API管理控制器
 */
class Api extends AdminBase
{
    
    /**
     * API列表
     */
    public function apiList()
    {
        
        $where = [];
        
        !empty($this->param['search_data']) && $where['name'] = ['like', '%'.(string)$this->param['search_data'].'%'];
        
        $this->assign('list', $this->logicApi->getApiList($where, true, 'sort'));
        
        return $this->fetch('api_list');
    }
    
    /**
     * API添加
     */
    public function apiAdd()
    {
        
        IS_POST && $this->jump($this->logicApi->apiEdit($this->param));
        
        $this->apiAssignGroupList('group_list');
        
        $info['request_data_json']  = $this->getApiDataFieldDefault();
        $info['response_data_json'] = $this->getApiDataFieldDefault(false);
        
        $this->assign('info', $info);
        $this->assign('api_data_type_option', $this->logicApi->getApiDataOption());
        
        return $this->fetch('api_edit');
    }
    
    /**
     * 获取API数据字段默认值
     */
    public function getApiDataFieldDefault($mark = 'request_data')
    {
        
        return $mark == 'request_data' ? json_encode([['', 0, 0, '']]) : json_encode([['', 0, '']]);
    }
    
    /**
     * API编辑
     */
    public function apiEdit()
    {
        
        IS_POST && $this->jump($this->logicApi->apiEdit($this->param));
        
        $this->apiAssignGroupList('group_list');
        
        $info = $this->logicApi->getApiInfo(['id' => $this->param['id']]);
        
        !empty($info['request_data'])  ? $info['request_data_json']  = json_encode(relevance_arr_to_index_arr($info['request_data']))  : $info['request_data_json']  = $this->getApiDataFieldDefault();
        !empty($info['response_data']) ? $info['response_data_json'] = json_encode(relevance_arr_to_index_arr($info['response_data'])) : $info['response_data_json'] = $this->getApiDataFieldDefault(false);
        
        $this->assign('info', $info);
        $this->assign('api_data_type_option', $this->logicApi->getApiDataOption());
        
        return $this->fetch('api_edit');
    }
    
    /**
     * Assign API 分组
     */
    public function apiAssignGroupList($name = 'list')
    {
        
        $this->assign($name, $this->logicApi->getApiGroupList([], true, 'sort desc'));
    }
    
    /**
     * API分组列表
     */
    public function apiGroupList()
    {
        
        $this->apiAssignGroupList();
        
        return $this->fetch('api_group_list');
    }
    
    /**
     * API分组添加
     */
    public function apiGroupAdd()
    {
        
        IS_POST && $this->jump($this->logicApi->apiGroupEdit($this->param));
        
        return $this->fetch('api_group_edit');
    }
    
    /**
     * API分组编辑
     */
    public function apiGroupEdit()
    {
        
        IS_POST && $this->jump($this->logicApi->apiGroupEdit($this->param));
        
        $info = $this->logicApi->getApiGroupInfo(['id' => $this->param['id']]);
        
        $this->assign('info', $info);
        
        return $this->fetch('api_group_edit');
    }
    
    /**
     * API分组删除
     */
    public function apiGroupDel($id = 0)
    {
        
        $this->jump($this->logicApi->apiGroupDel(['id' => $id]));
    }
    
    /**
     * 数据状态设置
     */
    public function setStatus()
    {
        
        $this->jump($this->logicAdminBase->setStatus('Api', $this->param));
    }
    
    /**
     * 排序
     */
    public function setSort()
    {
        
        $this->jump($this->logicAdminBase->setSort('Api', $this->param));
    }

    public function ajax_cemetery(){
       $where = $this->logicManage->getWhere($this->param);
       $list = $this->logicManage->getManageList($where,'a.*,t.hrm,g.name as garden_name,r.name as area_name,t.name as type_name,s.name as style_name,death.deathname', 'a.vno desc',28);
       exit(json_encode($list));
    }

    public function work_show_ajax()
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
        $cemeteryinfo=$info[0]["gardename"]." / ".$info[0]["areaname"]." / ".$info[0]["name"];
        $result = array("code" => 0, "msg" => "","cinfo"=>$cemeteryinfo);
        exit(json_encode($result)); 
    }


    public function Schedule_submit_ajax() {
        $member = session('member_info');
        // $sellerinfolist = explode('-', $this->param['sellname']);
        // $this->param['seller'] = !empty($sellerinfolist[0]) ? $sellerinfolist[0] : '0';
        // $this->param['sellname'] = !empty($sellerinfolist[1]) ? $sellerinfolist[1] : '0';
        $this->param['operid'] = $member['id'];
        $this->param['opername'] = $member['nickname'];
        $this->param['ordainend'] = strtotime($this->param['ordainend']);
        $this->param['ordainbegin'] = strtotime($this->param['ordainbegin']);
        if (empty($this->param['id'])) {
            $this->param['orderNO'] = get_cw_OrderNo();
            $this->param['orderstatus'] =1;
        }
        $result = $this->logicSchedule->Schedule_submit($this->param);
        //  if ($result["code"] != 1) { ///更新表格
        //  $this->update_table($this->param['cid']);
        // }
        exit(json_encode($result));
    }
    public function SaveList() {
       if (empty($this->param['cid'])) {
            $result = array("code" => 1, "msg" => "参数错误");
            exit(json_encode($result));
        }
          $where["a.cid"] = $this->param['cid'];
        $list =$this->logicSave->getSaveList($where, 'a.*,sa.name as saveareananme,c.name as c_canme,s.isvoice as isvoice,s.paytype as paytype', 'a.create_time desc');
        if (empty($this->param["saveareaid"])) {
            $this->param["saveareaid"] = 0;
        }
        if (empty($this->param["savestatus"])) {
            $this->param["savestatus"] = 0;
        }
        if (!empty($list)) {
            foreach ($list as $key => $value) {
                $list[$key]['savebegindate'] = date("Y-m-d", $list[$key]['savebegindate']);
                $list[$key]['saveenddate'] = date("Y-m-d", $list[$key]['saveenddate']);
                if ($value["savestatus"] == 1) {
                    $list[$key]["ts"] = get_datestate($value["saveenddate"]);
                    $list[$key]["canceldate"] = "";
                } else {
                    $list[$key]["ts"] = "";
                }
            }
        }
        exit(json_encode($list)); 
        // $this->assign('formcs', $this->param);
        // return $this->fetch('save_list');
    }
   public function BuryList() {
        if (empty($this->param['cid'])) {
            $result = array("code" => 1, "msg" => "参数错误");
            exit(json_encode($result));
        }
        if($this->param['msg'] == 1){
        $sellwhere["cid"] = $this->param['cid'];
        $sellwhere["a.bid"] = $this->param['id']; ///死者ID
        $sellwhere["financetype"] = 4;
        $sellinfo = $this->logicSell->getsellinfo_ajax($sellwhere, FALSE);
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
        $result = array("code" => 0, "msg" => "", "data" => $sellinfo);
        exit(json_encode($result));
        }else{
      $Buryinfo = $this->logicBury->getBuryList(["a.cid" => $this->param['cid']], "a.* ", "sort", FALSE);
        $result = array("code" => 0, "msg" => "", "data" => $Buryinfo);
        exit(json_encode($result));
        }

  
    }
    public function Getmember(){
         $member=$this->logicMember->getMemberList(['m.status' => ['eq', 1], 'm.is_business' => 1], 'm.id,m.nickname', 'm.create_time desc', false);
         exit(json_encode($member));
    }
    public function Schedulelist(){
        if (empty($this->param['cid'])) {
            $result = array("code" => 1, "msg" => "参数错误");
            exit(json_encode($result));
        }
         $Schedulelist=$this->logicSchedule->getScheduleList(["cid"=>$this->param['cid']], 's.*,c.name,g.name as garden_name,r.name as area_name', 'ordainbegin asc', 20);
        if (!empty($Schedulelist))
        {
            foreach ($Schedulelist as $key => $value) {
                if ($value["orderstatus"]==1)
                {
                   $Schedulelist[$key]["ts"]=get_datestate($value["ordainend"]);
                   $Schedulelist[$key]["ordainbegin"]=date("Y-m-d", $value["ordainbegin"]);
                   $Schedulelist[$key]["ordainend"]= date("Y-m-d", $value["ordainend"]);
                   $Schedulelist[$key]["ordaintype"] = get_ordaintype($value["ordaintype"]);
                }
                else
                {
                   $Schedulelist[$key]["ts"]=""; 
                }
       
            }
        }
        exit(json_encode($Schedulelist));
    }

    public function Schedule_delete_ajax() {
       $sellinfo = $this->logicSchedule->getScheduleInfo(['id' => $this->param['id']]);
       $data['id']=$this->param['id'];
       $data['cid']=$sellinfo["cid"];
       $data['orderstatus']=$sellinfo["orderstatus"];
       $result = $this->logicSchedule->ScheduleDel($data);
        exit(json_encode($result));
    }
    
       public function update_table() {
         if (empty($this->param['cid'])) {
            $result = array("code" => 1, "msg" => "参数错误");
            exit(json_encode($result));
        }
        $cid = $this->param['cid'];
        $where["cid"] = $cid;
        $where["financetype"] = 1;
        $list = $this->logicSell->getSellList($where, 'a.*,cw.zj,death.deathname,y.name as garden_name,q.name as area_name,c.name as c_canme', 'a.create_time desc');
       if(!empty($list[0]))
           $orderstatus=$list[0]["orderstatus"];
       else
           $orderstatus=1;
      
        $Buryinfo = $this->logicBury->getBuryList(["a.cid" => $cid], "a.* ", "sort", FALSE);
         foreach ($Buryinfo as $key => $value) {
            $Buryinfo[$key]['buyer'] = $Buryinfo[$key]['linkname'];
         }
        $result = array("code" => 0, "msg" => "", "data" =>$list,"buryinfo" => $Buryinfo,);
        exit(json_encode($result));
    }

    public function savearealist(){
        $result = $this->logicSavearea->getSaveareaList(['status' => ['eq', 1]], 'id,name', 'sort desc', false);
         exit(json_encode($result));
    }
    public function Save_submit_ajax() {
        if (empty($this->param['cid'])) {
            $result = array("code" => 1, "msg" => "参数错误");
            exit(json_encode($result));
        }
        $member = session('member_info');
        $this->param['seller'] = $member['id'];
        $this->param['sellname'] = $member['nickname'];
        if (empty($this->param['id'])) {
            $result = $this->logicSave->Save_add_submit($this->param);////增加
        } else {
              $result = $this->logicSave->Save_edit_submit($this->param);////增加
        }
        exit(json_encode($result));
    }

       public function Save_delete_ajax() {
        if (empty($this->param['id'])) {
            $result = array("code" => 1, "msg" => "参数错误");
            exit(json_encode($result));
        }

        $result = $this->logicSave->SaveDel($this->param);
 
        exit(json_encode($result));
    }

        public function Save_take_ajax() {
        if (empty($this->param['id'])) {
            $result = array("code" => 1, "msg" => "参数错误");
            exit(json_encode($result));
        }
        $where["id"] = $this->param['id'];
        $member = session('member_info');
        $data["canceloper"] = $member['nickname'];
        $data["savestatus"] = 2;
        $data["canceldate"] = date("Y-m-d");
        $result = $this->logicSave->Save_update($where, $data);
        exit(json_encode($result));
    }
    public function Sell_submit() {
        if (empty($this->param['cid'])) {
           $result = array("code" => 1, "msg" => "参数错误");
          exit(json_encode($result));
        }

     

      foreach ($this->param['comp'] as $key => $value){
         $this->param[$key]  = $value;
       };
       foreach ($this->param['sell'] as $key => $value){
         $this->param[$key]  = $value;
       };

       $fklx= array();
       $fklxval = array();

       foreach ($this->param['fklx'] as $key => $value) {
           array_push($fklx,$this->param['fklx'][$key]['fklx']);
           array_push($fklxval,$this->param['fklx'][$key]['fklxval']);
       }

       $this->param['fklx'] = array_filter($fklx);
       $this->param['fklxval'] = array_filter($fklxval);

       unset( $this->param['comp']);
       unset( $this->param['sell']);

        $member = session('member_info');
        $this->param['seller'] = $member['id'];
        $this->param['sellname'] = $member['nickname'];
        $mw_sellprice = $this->logicChargeitem->getChargeitemInfo(["id" => 2]);
        if (empty($this->param['id'])) {
            $result = $this->logicSell->sell_cemetery_add($this->param, $mw_sellprice, []); ////增加
        } else {
            $result = $this->logicSell->sell_cemetery_edit($this->param, $mw_sellprice, []); ////增加
        }
        exit(json_encode($result));
    }

   /////增加，修改墓主信息
    public function deather_sumit_ajax() {
        if (empty($this->param['cid'])) {
            $result = array("code" => 1, "msg" => "参数错误");
            exit(json_encode($result));
        }
        $result = $this->logicBury->deather_add_submit($this->param); ////增加
        exit(json_encode($result));
    }

       public function deather_delete_ajax() {
        if (empty($this->param['id'])) {
            $result = array("code" => 1, "msg" => "参数错误");
            exit(json_encode($result));
        }
        $result = $this->logicBury->deather_Del($this->param);
        // if ($result["code"] != 1) { ///更新表格
        //     $this->view->engine->layout(false);
        //     $result = array("code" => 0, "data" => $this->update_table($this->param['cid']));
        // }
        exit(json_encode($result));
    }

   // public function BuryserviceList_ajax() {
   //      if (empty($this->param['cid'])) {
   //          $result = array("code" => 1, "msg" => "参数错误");
   //          exit(json_encode($result));
   //      }
   //      $infohtml = $this->update_table($this->param['cid']);
   //      $result = array("code" => 0, "msg" => "", "data" => $infohtml);
   //      exit(json_encode($result));
   //  }

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

        //循环处理
         foreach ($Serviceinfoitem as $key => $value) {
             $Serviceinfoitem[$key]['name'] =$Serviceinfoitem[$key]['servicename'];
             $Serviceinfoitem[$key]['defaultprice'] =$Serviceinfoitem[$key]['price'];
         }

        array_unshift($Serviceinfoitem, array("title" =>"服务名称","name" =>"特殊服务"));
        array_unshift($chargeitem, array("title" =>"服务名称","name" =>"配套服务"));

        $data= array(
          'chargeitem' => array_merge($chargeitem,$Serviceinfoitem),
          "bury" => $Buryinfo,
          "orderNO" => $orderNO = !empty($bury) ? $bury[0]['orderNO'] : '',
          "linkmanlist" => $linkmanlist,
        );

        exit(json_encode($data));  
    }
    

    public function Buryservice_save_submit() {
        if (empty($this->param['cid']) ) {
            $result = array("code" => 1, "msg" => "参数错误");
            exit(json_encode($result));
        }

       $chargeitem_pram =array();
       $Serviceinfo_parm = array();
       $fklx= array();
       $fklxval = array();

        foreach ($this->param['chargeitemId'] as $key => $value) {

             $chargeitem_pram[$value] = $this->param['chargeitem'][$key];
        }
       foreach ($this->param['serviceinfoId'] as $key => $value) {

             $Serviceinfo_parm[$value] = $this->param['Serviceinfo'][$key];
        }
 
       foreach ($this->param['fklx'] as $key => $value) {
           array_push($fklx,$this->param['fklx'][$key]['fklx']);
           array_push($fklxval,$this->param['fklx'][$key]['fklxval']);
       }
       $this->param['chargeitem'] = $chargeitem_pram;
       $this->param['Serviceinfo'] = $Serviceinfo_parm;
       $this->param['fklx'] = array_filter($fklx);
       $this->param['fklxval'] = array_filter($fklxval);

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
       unset( $this->param['serviceinfoId']);
       unset( $this->param['chargeitemId']);
        if (empty($this->param['id'])) {
           $result = $this->logicSell->Sell_add_submit($this->param, $chargeitemlist, $Serviceinfoitem, 3); ////增加
        } else {
           $result = $this->logicSell->Sell_edit_submit($this->param, $chargeitemlist, $Serviceinfoitem); ////增加
        }

        exit(json_encode($result));
    }
    
}


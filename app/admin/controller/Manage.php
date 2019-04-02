<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

namespace app\admin\controller;

class Manage extends AdminBase
{
    
    /**
     * 首页方法
     */
    public function index()
    {
      
        $where = $this->logicManage->getWhere($this->param);
        $aid = isset($this->param['aid']) ? $this->param['aid'] : "0";
        $gid = isset($this->param['gid']) ? $this->param['gid'] : "0";
        $kewword = isset($this->param['search_data']) ? $this->param['search_data'] : "";
        $gardenname="";
        $arenname="";
          /*树形结构开始*/
        $gardenlist= $this->logicCemeteryGarden->getCemeteryGardenList(NULL,NULL,NULL,false);
        $arealist= $this->logicCemeteryArea->getCemeteryAreaList(NULL,'a.*,g.name as garden_title','gardenID,a.create_time desc',false);
        $comapnyinfo = parse_config_array('comapnyinfo');
        $url= url("manage/index");
        $zj_treestr= "{id:'z0',pid:'0',name:'" . $comapnyinfo[1] . "',open:true,icon:'/static/module/admin/img/1_open.png',font:{'font-weight':'bold'},url:'$url',target:'_self'},";
        foreach ($gardenlist as $key => $value) {
            $url= url("manage/index",["gid"=>$value["id"]]);
            if ($gid==$value["id"])
               $gardenname=$value["name"];
            $zj_treestr .= "{id:'t" . $value["id"] . "',pid:'z0',name:'" . $value["name"] . "',open:true,icon:'/static/module/admin/img/1_open.png',font:{'font-weight':'bold'},url:'$url',target:'_self'},";
            foreach ($arealist as $cval) {
                  if ($aid==$cval["id"])
                  {
                     $arenname=$cval["name"];
                     $gardenname=$cval["garden_title"];
                  }
                if ($cval["gardenID"] == $value["id"]) {
                     $url= url("manage/index",["gid"=>$value["id"],"aid"=>$cval["id"]]);
                    $zj_treestr .= "{id:'c" . $cval["id"] . "',pId:'t" . $cval["gardenID"] . "',name:'" . $cval["name"] . "',icon:'/static/module/admin/img/t2.png',url:'$url',target:'_self'},";
                }
            }
        }
        
        $zj_treestr = rtrim($zj_treestr, ",");
        $this->assign('treestr', $zj_treestr);
           /*树形结构结束*/
       if ($kewword=="" && $arenname=="" && $gardenname=="")
             $title= $comapnyinfo[1];
       else
       {
            $title=$gardenname."&nbsp&nbsp".$arenname;
            if ($kewword!="")
              $title.=" 查询关键字：" .$kewword;
       }
        $this->assign('seachinfo', $title); 
        $this->assign('list', $this->logicManage->getManageList($where,'a.*,t.hrm,g.name as garden_name,r.name as area_name,t.name as type_name,s.name as style_name,death.deathname', 'a.vno desc',28));
	$tjinfo = $this->logicManage->get_cemetery_usestatus_tj($where);
        $zs = 0;
        if (!empty($tjinfo)) {
            foreach ($tjinfo as $value) {
                $zs = $zs + $value["sl"];
            }
        }
        $this->assign('tjinfo', $tjinfo);
        $this->assign('zs', $zs);	
       
         $this->assign('formvalue', $this->param);
        
        return $this->fetch('index');
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
        $cemeteryinfo=$info[0]["gardename"]."/".$info[0]["areaname"]."/".$info[0]["name"];
        
         $this->assign('info', $info[0]);
        $this->assign('cid',  $this->param['cid']);
        /////预定信息列表
          
         $Schedulelist=$this->logicSchedule->getScheduleList(["cid"=>$this->param['cid']], 's.*,c.name,g.name as garden_name,r.name as area_name', 'ordainbegin asc', 20);
      
        if (!empty($Schedulelist))
        {
            foreach ($Schedulelist as $key => $value) {
                if ($value["orderstatus"]==1)
                {
                   $Schedulelist[$key]["ts"]=get_datestate($value["ordainend"]);
                }
                else
                {
                   $Schedulelist[$key]["ts"]=""; 
                }
            }
        }
         $this->assign('list', $Schedulelist);
         $table_lsit = $this->fetch("schedule/schedule_table");
        $this->assign('schedule_table', $table_lsit);
       /////////////////
        $infohtml = $this->fetch("work");
        $result = array("code" => 0, "msg" => "", "data" => $infohtml,"cinfo"=>$cemeteryinfo);
        exit(json_encode($result)); 
    }
    
    
    
    
}

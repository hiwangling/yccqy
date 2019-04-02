<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

namespace app\admin\controller;

/**
 * Description of Move
 *
 * @author Administrator
 */
class Move  extends AdminBase {
   /**
     * 寄存信息列表
     */
    public function MoveList() {
        $where = $this->logicMove->getWhere($this->param);
        $this->assign('list', $this->logicMove->getMoveList($where, 'a.*,g.name as garden_name,r.name as area_name,c.name as c_canme', 'a.create_time desc'));
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
    public function Movelist_ajax() {
        if (empty($this->param['cid'])) {
            $result = array("code" => 1, "msg" => "参数错误");
            exit(json_encode($result));
        }
        $infohtml = $this->update_table($this->param['cid']);
        $result = array("code" => 0, "msg" => "", "data" => $infohtml);
        exit(json_encode($result));
    }

    public function show_Move_ajax() {
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
        
        $mid = isset($this->param['id']) ? $this->param['id'] : '0';
   
        $moveinfo = $this->logicMove->getMoveInfo(['id' => $mid]); ////获取点灯的记录
        if (empty($moveinfo))
        {
            $moveinfo["movedate"]=date("Y-m-d");
        }
        $linkmanlist = $this->logicLinkman->getlinkmanList(['cid' => $this->param['cid']], "*", "id", FALSE);
        $this->assign('moveinfo', $moveinfo);
        $this->assign('linkmanlist', $linkmanlist);
        /////////
        $this->view->engine->layout(false);
        $infohtml = $this->fetch("move_add");
        $result = array("code" => 0, "msg" => "", "data" => $infohtml);
        exit(json_encode($result));
    }

    public function Move_submit_ajax() {
        if (empty($this->param['cid'])) {
            $result = array("code" => 1, "msg" => "参数错误");
            exit(json_encode($result));
        }
     
        $member = session('member_info');
        $this->param['operater'] = $member['id'];
        $this->param['operatername'] = $member['nickname'];
        if (empty($this->param['id']))
            $result = $this->logicMove->Move_add_submit($this->param);
        else
            $result = $this->logicMove->Move_edit_submit($this->param);
        if ($result["code"] != 1) { ///更新表格
            $result["data"] = $this->update_table($this->param['cid']);
        }
        exit(json_encode($result));
    }

    /**
     * 寄存信息删除
     */
    public function Move_delete_ajax() {
        if (empty($this->param['id'])) {
            $result = array("code" => 1, "msg" => "参数错误");
            exit(json_encode($result));
        }
        $MoveInfo = $this->logicMove->getMoveInfo(['id' => $this->param['id']]); ////获取点灯的记录
         if (empty($MoveInfo)) {
            $result = array("code" => 1, "msg" => "数据异常，请检查");
            return $result;
        }
        $result = $this->logicMove->Move_Del($MoveInfo);
        if($result["code"]!=1)
        { 
            $result["data"]=$this->update_table($MoveInfo['cid']);
         } 
          exit(json_encode($result));
         
    }
    
     public function Move_pay_ajax()
    {
        if (empty($this->param['id'])) {
            $result = array("code" => 1, "msg" => "参数错误");
            exit(json_encode($result));
        }
       $MoveInfo = $this->logicMove->getMoveInfo(['id' => $this->param['id']]); ////获取点灯的记录
          if (empty($MoveInfo)) {
            $result = array("code" => 1, "msg" => "数据异常，请检查");
            return $result;
        }
      
        if ($MoveInfo["movestatus"] == 2) {
            $result = array("code" => 0, "msg" => "success");
            $result["url"] = $url = url('move_print', array('id' => $this->param['id'])); 
            $result["data"] = $this->update_table($MoveInfo['cid']);
            exit(json_encode($result));
        }
        $result = $this->logicMove->Move_pay($MoveInfo);
        if ($result["code"] != 1) { ///更新表格
            $result["data"] = $this->update_table($MoveInfo['cid']);
            $result["url"] = $url = url('move_print', array('id' => $this->param['id']));
        }
        exit(json_encode($result));
    }

    public function  move_print()
    {
        if (empty($this->param['id'])) {
            $this->jump(RESULT_ERROR, "参数错误");
        }
      $Moveinfo = $this->logicMove->getMoveInfo(['id' => $this->param['id']]);  
         
        $comapnyinfo = parse_config_array('comapnyinfo');
        $this->assign('comapnyinfo', $comapnyinfo);
       $info = $this->logicCemetery->getCemeteryList(['a.id' => $Moveinfo['cid']], "a.*,g.name as gardename ,r.name as areaname,t.name as typename , s.name as stylename", null, 1);
        if (empty($info[0])) {
            $result = array("code" => 1, "msg" => "参数错误");
            exit(json_encode($result));
        }
        $Buryinfoname="";
          $Buryinfo= $this->logicBury->getBuryList(["cid"=>$Moveinfo['cid']],"a.vcname ","sort",FALSE);
         if(!empty($Buryinfo))
         {
             foreach ($Buryinfo as $key => $value) {
                  $Buryinfoname.=$value["vcname"].",";  
             }
          $Buryinfoname=rtrim($Buryinfoname,",");
         }
         $this->assign('Buryinfoname', $Buryinfoname);
        $this->assign('cinfo', $info[0]);
         $this->assign('Moveinfo', $Moveinfo);
        $rq = array("Y" => date("Y"), "M" => date("m"), "D" => date("d"));
        $this->assign('rq', $rq);
        $member = session('member_info');
        $this->assign('useranme', $member['nickname']);
        $this->view->engine->layout(false);
        return $this->fetch('move_print'); 
    }

    private function update_table($cid) {
        $where["a.cid"] = $cid;
        
        $list = $this->logicMove->getMoveList($where, 'a.*,c.expiredate, g.name as garden_name,r.name as area_name,c.name as c_canme', 'create_time desc', FALSE);
        $this->assign('cid', $cid);
        
        $this->assign('cid', $cid);
     
        $this->assign('list', $list);
        $infohtml = $this->fetch("move_table");

        return $infohtml;
    }

}

?>

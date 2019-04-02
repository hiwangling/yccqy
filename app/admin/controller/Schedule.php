<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

namespace app\admin\controller;

/**
 * Description of Schedule
 *
 * @author Administrator
 */
class Schedule extends AdminBase {

    /**
     * 服务信息列表
     */
    public function ScheduleList() {
        if (empty($this->param["ordaintype"])) {
            $this->param["ordaintype"] = 0;
        }
        $this->assign('ordaintype', parse_config_array('ordaintype'));
        $where = $this->logicSchedule->getWhere($this->param);
        $list=$this->logicSchedule->getScheduleList($where, 's.*,c.name,g.name as garden_name,r.name as area_name', 'ordainbegin asc', 20);
        if (!empty($list))
        {
            foreach ($list as $key => $value) {
                if ($value["orderstatus"]==1)
                {
                   $list[$key]["ts"]=get_datestate($value["ordainend"]);
                }
                else
                {
                   $list[$key]["ts"]=""; 
                }
            }
        }
        $this->assign('list', $list);
        $this->assign('formcs', $this->param);
        return $this->fetch('schedule_list');
    }
     public function ScheduleList_ajax() {
        if (empty($this->param['cid'])) {
            $result = array("code" => 1, "msg" => "参数错误");
            exit(json_encode($result));
        }
        $infohtml = $this->update_table($this->param['cid']);
           $result = array("code" => 0, "msg" => "", "data" => $infohtml,);
        exit(json_encode($result));
    }

    ////增加显示增加和修改，删除界面
    public function ScheduleAdd_ajax_show() {
        if (empty($this->param['cid'])) {
            $result = array("code" => 1, "msg" => "参数错误");
            exit(json_encode($result));
        }
        $info = $this->logicCemetery->getCemeteryList(['a.id' => $this->param['cid']], "a.*,g.name as gardename ,r.name as areaname,t.name as typename , s.name as stylename", null, 1);
        if (empty($info[0])) {
            $result = array("code" => 1, "msg" => "参数错误");
            exit(json_encode($result));
        }
        $this->assign('ordaintype', parse_config_array('ordaintype'));
        $this->assign('info', $info[0]);
       
        //如果是有订单记录,且订单的状态是有效，就是修改和删除///
        if ($this->param['sid']==0)
        {
            if ($info[0]["usestatus"] == 2) ////根据当前状态，获取预订单
                {
                $sellinfo = $this->logicSchedule->getScheduleInfo(['cid' => $this->param['cid'], 'orderstatus' => 1]);
            } 
            else ////新预定单
                {
                $sellinfo["ordainbegin"] = TIME_NOW;
                $sellinfo["ordainend"] = TIME_NOW + 86400 * 7;
                $sellinfo["sex"] = 1;
                $sellinfo["ordaintype"] = 2;
                $sellinfo["seller"] = 0;
            }
        }
        else ////根据预订单信息，直接修改预定单
        {
            $sellinfo = $this->logicSchedule->getScheduleInfo(['id' => $this->param['sid']]);
        }

        $this->assign('sellinfo', $sellinfo);
        $this->assign('member', $this->logicMember->getMemberList(['m.status' => ['eq', 1], 'm.is_business' => 1], 'm.id,m.nickname', 'm.create_time desc', false));
       $this->view->engine->layout(false);
        $infohtml = $this->fetch("schedule_Add");
        $result = array("code" => 0, "msg" => "", "data" => $infohtml,);
        exit(json_encode($result));
    }

    

    /////增加处理页面
    public function Schedule_submit_ajax() {
        $member = session('member_info');
        $sellerinfolist = explode('-', $this->param['sellerinfo']);
        $this->param['seller'] = !empty($sellerinfolist[0]) ? $sellerinfolist[0] : '0';
        $this->param['sellname'] = !empty($sellerinfolist[1]) ? $sellerinfolist[1] : '0';
        $this->param['operid'] = $member['id'];
        $this->param['opername'] = $member['nickname'];
        $this->param['ordainend'] = strtotime($this->param['ordainend']);
        $this->param['ordainbegin'] = strtotime($this->param['ordainbegin']);
        if (empty($this->param['id'])) {
            $this->param['orderNO'] = get_cw_OrderNo();
            $this->param['orderstatus'] =1;
        }
        $result = $this->logicSchedule->Schedule_submit($this->param);
         if ($result["code"] != 1) { ///更新表格
            $result["data"] = $this->update_table($this->param['cid']);
        }
        exit(json_encode($result));
    }

    /**
     * 服务信息删除
     */
    public function Schedule_delete_ajax() {
       $sellinfo = $this->logicSchedule->getScheduleInfo(['id' => $this->param['id']]);
       $data['id']=$this->param['id'];
       $data['cid']=$sellinfo["cid"];
       $data['orderstatus']=$sellinfo["orderstatus"];
        $result = $this->logicSchedule->ScheduleDel($data);
         if ($result["code"] != 1) { ///更新表格
            $result["data"] = $this->update_table($data['cid']);
        }
        exit(json_encode($result));
    }
    
     private function update_table($cid) {
          $where["cid"] = $cid;
           $list=$this->logicSchedule->getScheduleList($where, 's.*,c.name,g.name as garden_name,r.name as area_name', 'ordainbegin asc', 20);
        if (!empty($list))
        {
            foreach ($list as $key => $value) {
                if ($value["orderstatus"]==1)
                {
                   $list[$key]["ts"]=get_datestate($value["ordainend"]);
                }
                else
                {
                   $list[$key]["ts"]=""; 
                }
            }
        }
         $this->assign('cid', $cid);
       $this->assign('list', $list);
       $this->view->engine->layout(false);
       $infohtml = $this->fetch("schedule_table");
        
        return $infohtml;
    }
    
}

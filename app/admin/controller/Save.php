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
 * 寄存信息
 */
class Save extends AdminBase {

    /**
     * 寄存信息列表
     */
    public function SaveList() {
        $where = $this->logicSave->getWhere($this->param);
        $this->assign('savearea', $this->logicSavearea->getSaveareaList([], 'id,name', 'sort asc', FALSE));
        $list= $this->logicSave->getSaveList($where, 'a.*,sa.name as saveareananme,y.name as garden_name,q.name as area_name,c.name as c_canme', 'a.create_time desc');

        if (!empty($list)) {
            foreach ($list as $key => $value) {
                if ($value["savestatus"] == 1) {
                    $list[$key]["ts"] = get_datestate($value["saveenddate"]);
                    $list[$key]["canceldate"] = "";
                } else {
                    $list[$key]["ts"] = "";
                }
            }
        }
        $this->assign('list',$list);

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
    public function Savelist_ajax() {
        if (empty($this->param['cid'])) {
            $result = array("code" => 1, "msg" => "参数错误");
            exit(json_encode($result));
        }
        $infohtml = $this->update_table($this->param['cid']);
        $result = array("code" => 0, "msg" => "", "data" => $infohtml);
        exit(json_encode($result));
    }

    
    /**
     * 寄存信息添加
     */
    public function Save_ajax_show() {
        if (empty($this->param['cid'])) {
            $result = array("code" => 1, "msg" => "参数错误");
            exit(json_encode($result));
        }
        $info = $this->logicCemetery->getCemeteryList(['a.id' => $this->param['cid']], "a.*,g.name as gardename ,r.name as areaname,t.name as typename , s.name as stylename", null, 1);
        if (empty($info[0])) {
            $result = array("code" => 1, "msg" => "参数错误");
            exit(json_encode($result));
        }
        $chargeitem = $this->logicChargeitem->getChargeitemInfo(['id' => 1]);
        $this->assign('info', $info[0]);
        $this->assign('savearealist', $this->logicSavearea->getSaveareaList(['status' => ['eq', 1]], 'id,name', 'sort desc', false));
        $saveid = isset($this->param['id']) ? $this->param['id'] : '0';
         $SaveInfo = $this->logicSave->getSaveInfo(["id" => $saveid]);
        if (empty($SaveInfo))
        {
            $SaveInfo["saveprice"] = $chargeitem["defaultprice"];
            $SaveInfo["savebegindate"] = TIME_NOW;
            $SaveInfo["payvarchar"]="";
            $SaveInfo["saveareaid"]="1";
            $payarray = $this->logicSell->get_pay_array("");
            $SaveInfo["isvoice"] = 0;
            $SaveInfo["saveenddate"] = TIME_NOW + 86400 * 7;
        }
        else{
             $sellwhere["id"]=$SaveInfo["tid"];
             $sellinfo= $this->logicSell->getsellinfo_ajax($sellwhere,FALSE);
            if (empty($sellinfo)) {
            $result = array("code" => 1, "msg" => "数据错误");
            exit(json_encode($result));
            }
             $payarray = $this->logicSell->get_pay_array($sellinfo["payvarchar"]);
             $SaveInfo["isvoice"] = $sellinfo["isvoice"];  
        }
         $this->assign('paytype', $payarray);
          $this->assign('saveInfo', $SaveInfo);
       
        ////////
        $linkmanlist = $this->logicLinkman->getlinkmanList(['cid' => $this->param['cid']], "*", "id", FALSE);
        $this->assign('linkmanlist', $linkmanlist);
      
        
        $this->view->engine->layout(false);
        $infohtml = $this->fetch("save_add");
        $result = array("code" => 0, "msg" => "", "data" => $infohtml);
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
       
        if ($result["code"] != 1) { ///更新表格
            $result["data"] = $this->update_table($this->param['cid']);
        }
        exit(json_encode($result));
    }

    ////寄存信息编辑
    /*public function Save_edit_ajax() {
        if (empty($this->param['id'])) {
            $result = array("code" => 1, "msg" => "参数错误");
            exit(json_encode($result));
        }
       
        $this->assign('savearealist', $this->logicSavearea->getSaveareaList(['status' => ['eq', 1]], 'id,name', 'sort desc', false));
        $SaveInfo = $this->logicSave->getSaveInfo(["id" => $this->param['id']]);
       if (empty($SaveInfo)) {
            $result = array("code" => 1, "msg" => "数据错误");
            exit(json_encode($result));
        }
        $sellwhere["id"]=$SaveInfo["tid"];
        $sellinfo= $this->logicSell->getsellinfo_ajax($sellwhere,FALSE);
         if (empty($sellinfo)) {
            $result = array("code" => 1, "msg" => "数据错误");
            exit(json_encode($result));
        }
       $payarray = $this->logicSell->get_pay_array($sellinfo["payvarchar"]);
       
        $linkmanlist = $this->logicLinkman->getlinkmanList(['cid' => $SaveInfo['cid']], "*", "id", FALSE);
        $this->assign('linkmanlist', $linkmanlist);
        $this->assign('paytype', $payarray);
        $this->assign('SaveInfo', $SaveInfo);
        $this->assign('sellinfo', $sellinfo);
        $this->view->engine->layout(false);
        $infohtml = $this->fetch("save_add");
        $result = array("code" => 0, "msg" => "", "data" => $infohtml);
        exit(json_encode($result));
    }*/

    /**
     * 寄存信息删除
     */
    public function Save_delete_ajax() {
        if (empty($this->param['id'])) {
            $result = array("code" => 1, "msg" => "参数错误");
            exit(json_encode($result));
        }
        $result = $this->logicSave->SaveDel($this->param);
        if ($result["code"] != 1) { ///更新表格
            $result["data"] = $this->update_table($this->param['cid']);
        }
        exit(json_encode($result));
    }

    /**
     * 寄存结算打印
     */
    public function Save_pay_ajax() {
         if (empty($this->param['id'])) {
            $result = array("code" => 1, "msg" => "参数错误");
            exit(json_encode($result));
        }
          $SaveInfo = $this->logicSave->getSaveInfo(["id" => $this->param['id']]);
          if (empty($SaveInfo)) {
            $result = array("code" => 1, "msg" => "数据异常，请检查");
            return $result;
        }
        $sellwhere["id"] =$SaveInfo['tid'];
        $sellinfo = $this->logicSell->getSellInfo($sellwhere);
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
        $result = $this->logicSell->Buryservice_pay($sellinfo, "2");
        if ($result["code"] != 1) { ///更新表格
            $result["data"] = $this->update_table($sellinfo['cid']);
              $result["url"] = $url = url('Buryservice/Buryservice_print', array('id' => $sellinfo['id']));
        }
        exit(json_encode($result));
        
    }

    /**
     * 寄存取走
     */
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
        if ($result["code"] != 1) { ///更新表格
            $result["data"] = $this->update_table($this->param['cid']);
        }
        exit(json_encode($result));
    }

    private function update_table($cid) {
        $where["a.cid"] = $cid;
        $list = $this->logicSave->getSaveList($where, 'a.*,s.orderstatus,sa.name as saveareananme,c.name as c_canme', 'a.create_time desc');

        if (!empty($list)) {
            foreach ($list as $key => $value) {
                if ($value["savestatus"] == 1) {
                    $list[$key]["ts"] = get_datestate($value["saveenddate"]);
                    $list[$key]["canceldate"] = "";
                } else {
                    $list[$key]["ts"] = "";
                }
            }
        }
        $this->assign('cid', $cid);
      
        $this->assign('list', $list);
        $this->view->engine->layout(false);
        $infohtml = $this->fetch("save_table");
        return $infohtml;
    }

}

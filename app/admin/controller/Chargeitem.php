<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

namespace app\admin\controller;

/**
 * Description of Chargeitem
 *
 * @author Administrator
 */
class Chargeitem extends AdminBase {

    /**
     * 服务信息列表
     */
    public function ChargeitemList() {
        $where = $this->logicChargeitem->getWhere($this->param);
      
        $this->assign('list', $this->logicChargeitem->getChargeitemList($where, '*', 'sort asc', 10));
        return $this->fetch('chargeitem_list');
    }

    ////增加显示界面
    public function ChargeitemAdd_show_ajax() {
        $this->view->engine->layout(false);
        $financetype = parse_config_array('financetype');
        $this->assign('financetype', $financetype);
        $infohtml = $this->fetch("Chargeitem_add");
        $result = array("code" => 0, "msg" => "", "data" => $infohtml);
        exit(json_encode($result));
    }

    /////增加处理页面
    public function ChargeitemAdd_ajax_submit() {
        $result = $this->logicChargeitem->ChargeitemAdd($this->param);
        exit(json_encode($result));
    }
    
    public function ChargeitemEdit_ajax_show() {
        if (empty($this->param['cid'])) {
            $result = array("code" => 1, "msg" => "参数错误");
            exit(json_encode($result));
        }
         $financetype = parse_config_array('financetype');
        $this->assign('financetype', $financetype);
        $info = $this->logicChargeitem->getChargeitemInfo(['id' => $this->param['cid']]);
        if(!empty($info))
        {
            $info["financetype"]= rtrim($info["financetype"],",");
            $info["financetype"]= ltrim($info["financetype"],",");
        }
        $this->assign('info', $info);
        $this->view->engine->layout(false);
        $infohtml = $this->fetch("Chargeitem_edit");
        $result = array("code" => 0, "msg" => "", "data" => $infohtml);
        exit(json_encode($result));
    }

    public function Chargeitemedit_ajax_submit() {
        if (empty($this->param['id']) || $this->param['id'] == "0") {
            $result = array("code" => 1, "msg" => "参数错误");
            exit(json_encode($result));
        }
        $result = $this->logicChargeitem->ChargeitemEdit($this->param);
        exit(json_encode($result));
    }

    
    /**
     * 服务信息删除
     */
    public function ChargeitemDel($id = 0) {

        $this->jump($this->logicChargeitem->ChargeitemDel(['id' => $id]));
    }
    
    /**
     * 排序
     */
    public function setSort()
    {
        
        $this->jump($this->logicAdminBase->setSort('Chargeitem', $this->param));
    }

}

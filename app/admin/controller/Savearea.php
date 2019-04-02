<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

namespace app\admin\controller;

/**
 * Description of Savearea
 *
 * @author Administrator
 */
class Savearea extends AdminBase {

    /**
     * 服务信息列表
     */
    public function SaveareaList() {
        $where = $this->logicSavearea->getWhere($this->param);
        $this->assign('list', $this->logicSavearea->getSaveareaList($where, '*', 'sort asc', 10));
        return $this->fetch('index');
    }

    ////增加显示界面
    public function SaveareaAdd_ajax_show() {
        $this->view->engine->layout(false);
        $infohtml = $this->fetch("savearea_add");
        $result = array("code" => 0, "msg" => "", "data" => $infohtml);
        exit(json_encode($result));
    }

    /////增加处理页面
    public function SaveareaAdd_ajax_submit() {
        $result = $this->logicSavearea->SaveareaAdd($this->param);
        exit(json_encode($result));
    }
    
    public function SaveareaEdit_ajax_show() {
        if (empty($this->param['id'])) {
            $result = array("code" => 1, "msg" => "参数错误");
            exit(json_encode($result));
        }
        $info = $this->logicSavearea->getSaveareaInfo(['id' => $this->param['id']]);
        $this->assign('info', $info);
        $this->view->engine->layout(false);
        $infohtml = $this->fetch("savearea_edit");
        $result = array("code" => 0, "msg" => "", "data" => $infohtml);
        exit(json_encode($result));
    }

    public function Saveareaedit_ajax_submit() {
        if (empty($this->param['id']) || $this->param['id'] == "0") {
            $result = array("code" => 1, "msg" => "参数错误");
            exit(json_encode($result));
        }
        $result = $this->logicSavearea->SaveareaEdit($this->param);
        exit(json_encode($result));
    }

    
    /**
     * 服务信息删除
     */
    public function SaveareaDel($id = 0) {

        $this->jump($this->logicSavearea->SaveareaDel(['id' => $id]));
    }
    
    /**
     * 排序
     */
    public function setSort()
    {
        $this->jump($this->logicAdminBase->setSort('Savearea', $this->param));
    }

}


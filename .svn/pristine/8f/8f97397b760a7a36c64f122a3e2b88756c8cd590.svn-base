<?php

namespace app\admin\controller;

/**
 * 墓位类型控制器
 */
class CemeteryType extends AdminBase {

    /**
     * 墓位类型列表
     */
    public function CemeteryTypeList() {
        $where = $this->logicCemeteryType->getWhere($this->param);
        $this->assign('list', $this->logicCemeteryType->getCemeteryTypeList($where));
        return $this->fetch('cemtype_list');
    }

    ////增加显示界面
    public function cemeteryTypeAdd_ajax_show() {
        $this->view->engine->layout(false);
        $infohtml = $this->fetch("cemtype_add");
        $result = array("code" => 0, "msg" => "", "data" => $infohtml);
        exit(json_encode($result));
    }

    /////增加处理页面
    public function cemeteryTypeAdd_ajax_submit() {
        $result = $this->logicCemeteryType->CemeteryTypeAdd($this->param);
        exit(json_encode($result));
    }

    public function cemeteryTypeEdit_ajax_show() {
        if (empty($this->param['cid'])) {
            $result = array("code" => 1, "msg" => "参数错误");
            exit(json_encode($result));
        }
        $info = $this->logicCemeteryType->getCemeteryTypeInfo(['id' => $this->param['cid']]);
        $this->assign('info', $info);
        $this->view->engine->layout(false);
        $infohtml = $this->fetch("cemtype_edit");
        $result = array("code" => 0, "msg" => "", "data" => $infohtml);
        exit(json_encode($result));
    }

    public function cemeteryTypeedit_ajax_submit() {
        if (empty($this->param['id']) || $this->param['id'] == "0") {
            $result = array("code" => 1, "msg" => "参数错误");
            exit(json_encode($result));
        }
        $result = $this->logicCemeteryType->CemeteryTypeEdit($this->param);
        exit(json_encode($result));
    }

    /**
     * 墓位类型删除
     */
    public function CemeteryTypeDel($id = 0) {

        $this->jump($this->logicCemeteryType->CemeteryTypeDel(['id' => $id]));
    }

}

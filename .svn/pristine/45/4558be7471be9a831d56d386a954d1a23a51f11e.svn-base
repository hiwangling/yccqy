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
 * 墓园类型控制器
 */
class CemeteryGarden extends AdminBase {

    /**
     * 墓园类型列表
     */
    public function CemeteryGardenList() {
        $where = $this->logicCemeteryGarden->getWhere($this->param);
        $this->assign('list', $this->logicCemeteryGarden->getCemeteryGardenList($where));
        return $this->fetch('cemgarden_list');
    }

    ////增加显示界面
    public function cemeteryGardenAdd_ajax_show() {
        $this->view->engine->layout(false);
        $infohtml = $this->fetch("cemgarden_add");
        $result = array("code" => 0, "msg" => "", "data" => $infohtml);
        exit(json_encode($result));
    }

    /////增加处理页面
    public function cemeteryGardenAdd_ajax_submit() {
        $result = $this->logicCemeteryGarden->CemeteryGardenAdd($this->param);
        exit(json_encode($result));
    }

    public function cemeteryGardenEdit_ajax_show() {
        if (empty($this->param['cid'])) {
            $result = array("code" => 1, "msg" => "参数错误");
            exit(json_encode($result));
        }
        $info = $this->logicCemeteryGarden->getCemeteryGardenInfo(['id' => $this->param['cid']]);
        $this->assign('info', $info);
        $this->view->engine->layout(false);
        $infohtml = $this->fetch("cemgarden_edit");
        $result = array("code" => 0, "msg" => "", "data" => $infohtml);
        exit(json_encode($result));
    }

    public function cemeteryGardenedit_ajax_submit() {
        if (empty($this->param['id']) || $this->param['id'] == "0") {
            $result = array("code" => 1, "msg" => "参数错误");
            exit(json_encode($result));
        }
        $result = $this->logicCemeteryGarden->CemeteryGardenEdit($this->param);
        exit(json_encode($result));
    }

    /**
     * 墓园类型删除
     */
    public function CemeteryGardenDel($id = 0) {

        $this->jump($this->logicCemeteryGarden->CemeteryGardenDel(['id' => $id]));
    }

}

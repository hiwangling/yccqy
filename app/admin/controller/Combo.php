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
 * 服务信息控制器
 */
class Combo extends AdminBase {

    /**
     * 服务信息列表
     */
    public function ComboList() {
        $where = $this->logicCombo->getWhere($this->param);
        $this->assign('list', $this->logicCombo->getComboList($where, '*', 'sort asc', 10));
        return $this->fetch('combo_list');
    }

    ////增加显示界面
    public function ComboAdd_ajax_show() {
        $this->view->engine->layout(false);
        $infohtml = $this->fetch("combo_add");
        $result = array("code" => 0, "msg" => "", "data" => $infohtml);
        exit(json_encode($result));
    }

    /////增加处理页面
    public function ComboAdd_ajax_submit() {
        $result = $this->logicCombo->ComboAdd($this->param);
        exit(json_encode($result));
    }
    
    public function ComboEdit_ajax_show() {
        if (empty($this->param['cid'])) {
            $result = array("code" => 1, "msg" => "参数错误");
            exit(json_encode($result));
        }
        $info = $this->logicCombo->getComboInfo(['id' => $this->param['cid']]);
        $this->assign('info', $info);
        $this->view->engine->layout(false);
        $infohtml = $this->fetch("combo_edit");
        $result = array("code" => 0, "msg" => "", "data" => $infohtml);
        exit(json_encode($result));
    }

    public function Comboedit_ajax_submit() {
        if (empty($this->param['id']) || $this->param['id'] == "0") {
            $result = array("code" => 1, "msg" => "参数错误");
            exit(json_encode($result));
        }
        $result = $this->logicCombo->ComboEdit($this->param);
        exit(json_encode($result));
    }

    
    /**
     * 服务信息删除
     */
    public function ComboDel($id = 0) {

        $this->jump($this->logicCombo->ComboDel(['id' => $id]));
    }
    
    /**
     * 排序
     */
    public function setSort()
    {
        $this->jump($this->logicAdminBase->setSort('Combo', $this->param));
    }

}

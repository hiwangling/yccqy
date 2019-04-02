<?php

namespace app\admin\controller;

/**
 * 墓穴样式控制器
 */
class CemeteryStyle extends AdminBase {

    /**
     * 墓穴样式列表
     */
    public function CemeteryStyleList() {
        $where = $this->logicCemeteryStyle->getWhere($this->param);
        $this->assign('list', $this->logicCemeteryStyle->getCemeteryStyleList($where));
        return $this->fetch('cemstyle_list');
    }

    ////增加显示界面
    public function cemeteryStyleAdd_ajax_show() {
        $this->view->engine->layout(false);
        $infohtml = $this->fetch("cemstyle_add");
        $result = array("code" => 0, "msg" => "", "data" => $infohtml);
        exit(json_encode($result));
    }

    /////增加处理页面
    public function cemeteryStyleAdd_ajax_submit() {
        $result = $this->logicCemeteryStyle->CemeteryStyleAdd($this->param);
        exit(json_encode($result));
    }

    public function cemeteryStyleEdit_ajax_show() {
        if (empty($this->param['cid'])) {
            $result = array("code" => 1, "msg" => "参数错误");
            exit(json_encode($result));
        }
        $info = $this->logicCemeteryStyle->getCemeteryStyleInfo(['id' => $this->param['cid']]);
        $this->assign('info', $info);
        $this->view->engine->layout(false);
        $infohtml = $this->fetch("cemstyle_edit");
        $result = array("code" => 0, "msg" => "", "data" => $infohtml);
        exit(json_encode($result));
    }

    public function cemeteryStyleedit_ajax_submit() {
        if (empty($this->param['id']) || $this->param['id'] == "0") {
            $result = array("code" => 1, "msg" => "参数错误");
            exit(json_encode($result));
        }
        $result = $this->logicCemeteryStyle->CemeteryStyleEdit($this->param);
        exit(json_encode($result));
    }

    /**
     * 墓穴样式删除
     */
    public function CemeteryStyleDel($id = 0) {

        $this->jump($this->logicCemeteryStyle->CemeteryStyleDel(['id' => $id]));
    }
    
     public function select_style_ajax() {
         
         
        $list = $this->logicCemeteryStyle->getCemeteryStyleList(["status"=>['neq', DATA_DELETE]], 'id,name', 'id', FALSE);
       
       
            $zj_treestr = "{id:'t1',pid:0,name:'墓穴风格',},";
            foreach ($list as $cval) {
               
                    $zj_treestr .= "{id:'c" . $cval["id"] . "',pId:'t1',name:'" . $cval["name"] . "'},";
            }
        $zj_treestr = rtrim($zj_treestr, ",");
        $this->assign('treestr', $zj_treestr);
        $infohtml = $this->fetch("select_CemeteryStyle");
        $result = array("code" => 0, "msg" => "", "data" => $infohtml);
        exit(json_encode($result));
         
    }


}

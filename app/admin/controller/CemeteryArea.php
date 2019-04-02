<?php

namespace app\admin\controller;

/**
 * 墓区类型控制器
 */
class CemeteryArea extends AdminBase {

    /**
     * 墓区类型列表
     */
    public function CemeteryAreaList() {
        $where = $this->logicCemeteryArea->getWhere($this->param);
        $this->assign('list', $this->logicCemeteryArea->getCemeteryAreaList($where));
        return $this->fetch('cemarea_list');
    }

    ////增加显示界面
    public function cemeteryAreaAdd_ajax_show() {
        $this->cemeteryGardenData();
        $this->view->engine->layout(false);
        $infohtml = $this->fetch("cemarea_add");
        $result = array("code" => 0, "msg" => "", "data" => $infohtml);
        exit(json_encode($result));
    }

    /////增加处理页面
    public function cemeteryAreaAdd_ajax_submit() {
        $result = $this->logicCemeteryArea->CemeteryAreaAdd($this->param);
        exit(json_encode($result));
    }
    
    //编辑显示界面
    public function cemeteryAreaEdit_ajax_show() {
        if (empty($this->param['cid'])) {
            $result = array("code" => 1, "msg" => "参数错误");
            exit(json_encode($result));
        }
        $this->cemeteryGardenData();
        $info = $this->logicCemeteryArea->getCemeteryAreaInfo(['id' => $this->param['cid']]);
        $this->assign('info', $info);
        $this->view->engine->layout(false);
        $infohtml = $this->fetch("cemarea_edit");
        $result = array("code" => 0, "msg" => "", "data" => $infohtml);
        exit(json_encode($result));
    }

    public function cemeteryAreaedit_ajax_submit() {
        if (empty($this->param['id']) || $this->param['id'] == "0") {
            $result = array("code" => 1, "msg" => "参数错误");
            exit(json_encode($result));
        }
        $result = $this->logicCemeteryArea->CemeteryAreaEdit($this->param);
        exit(json_encode($result));
    }

    /**
     * 墓区类型删除
     */
    public function CemeteryAreaDel($id = 0) {

        $this->jump($this->logicCemeteryArea->CemeteryAreaDel(['id' => $id]));
    }
    
    /**
     * 墓园信息
     */
    private function cemeteryGardenData()
    {
        $where[DATA_STATUS_NAME] = ['neq', DATA_DELETE];

        $order = "create_time desc";

        $this->assign('garden', $this->logicCemeteryGarden->getCemeteryGardenList($where, 'id ,name',$order,false));
        
    }
    
     /**
     * 选择服务项目
     */
    public function select_CemeteryArea_ajax() {
        $where[DATA_STATUS_NAME] = ['neq', DATA_DELETE];
        $garden =  $this->logicCemeteryGarden->getCemeteryGardenList($where, 'id ,name',"id",false);
        $list = $this->logicCemeteryArea->getCemeteryAreaList(["a.status"=>['neq', DATA_DELETE]], 'a.id,a.name,gardenID', 'gardenID,a.id', FALSE);
        $zj_treestr = "";
        foreach ($garden as $key => $value) {
            $zj_treestr .= "{id:'t" . $value["id"] . "',pid:0,name:'" . $value["name"] . "',},";
            foreach ($list as $cval) {
                if ($cval["gardenID"] == $value["id"]) {
                    $zj_treestr .= "{id:'c" . $cval["id"] . "',pId:'t" . $value["id"] . "',name:'" . $cval["name"] . "'},";
                }
            }
        }
        $zj_treestr = rtrim($zj_treestr, ",");
        $this->assign('treestr', $zj_treestr);
        $infohtml = $this->fetch("select_cemarea");
        $result = array("code" => 0, "msg" => "", "data" => $infohtml);
        exit(json_encode($result));
    }

}

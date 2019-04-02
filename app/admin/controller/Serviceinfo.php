<?php
namespace app\admin\controller;

/**
 * 服务信息控制器
 */
class Serviceinfo extends AdminBase {

    private function getCommon() {
    //    $this->assign('servicetype', parse_config_array('servicetype'));
        $this->assign('servicetype', parse_config_array('financetype'));
        $this->assign('chargeunit', parse_config_array('chargeunit'));
        $this->assign('pricetype', parse_config_array('pricetype'));
    }

    /**
     * 服务信息列表
     */
    public function ServiceinfoList() {
        $where = $this->logicServiceinfo->getWhere($this->param);
        $this->getCommon();
        $this->assign('list', $this->logicServiceinfo->getServiceinfoList($where, 'a.*,b.name as branch_name', 'a.sort', 20));

        return $this->fetch('serviceinfo_list');
    }

    public function ServiceinfoAdd_ajax_show() {
        $this->getCommon();

        $this->assign('branchlist', $this->logicBranch->getBranchList(["status" => 1], "id,name", "id", false));
        $this->view->engine->layout(false);
        $infohtml = $this->fetch("serviceinfo_add");
        $result = array("code" => 0, "msg" => "", "data" => $infohtml);
        exit(json_encode($result));
    }

    /**
     * 服务信息编辑
     */
    public function ServiceinfoAdd_ajax_submit() {
        $result = $this->logicServiceinfo->ServiceinfoAdd($this->param);
        exit(json_encode($result));
    }

    public function ServiceinfoEdit_ajax_show() {
        if (empty($this->param['id'])) {
            $result = array("code" => 1, "msg" => "参数错误");
            exit(json_encode($result));
        }
        $info = $this->logicServiceinfo->getServiceinfoInfo(['id' => $this->param['id']]);
        $this->assign('branchlist', $this->logicBranch->getBranchList(["status" => 1], "id,name", "id", false));
        $this->getCommon();
        $this->assign('info', $info);
        $this->view->engine->layout(false);
        $infohtml = $this->fetch("serviceinfo_edit");
        $result = array("code" => 0, "msg" => "", "data" => $infohtml);
        exit(json_encode($result));
    }

    public function ServiceinfoEdit_ajax_submit() {
        if (empty($this->param['id']) || $this->param['id'] == "0") {
            $result = array("code" => 1, "msg" => "参数错误");
            exit(json_encode($result));
        }
        $result = $this->logicServiceinfo->ServiceinfoEdit($this->param);
        exit(json_encode($result));
    }

    /**
     * 服务信息删除
     */
    public function ServiceinfoDel($id = 0) {

        $this->jump($this->logicServiceinfo->ServiceinfoDel(['id' => $id]));
    }

    /**
     * 排序
     */
    public function setSort() {
        $this->jump($this->logicAdminBase->setSort('Serviceinfo', $this->param));
    }

    /**
     * 选择服务项目
     */
    public function select_Serviceinfo_ajax() {
        $servicetype = parse_config_array('servicetype');
        $list = $this->logicServiceinfo->getServiceinfoList([], 'a.id,a.servicename,servicetype', 'a.servicetype,a.sort asc', FALSE);
        $zj_treestr = "";
        foreach ($servicetype as $key => $value) {
            $zj_treestr .= "{id:'t" . $key . "',pid:0,name:'" . $value . "',},";
            foreach ($list as $cval) {
                if ($cval["servicetype"] == $key) {
                    $zj_treestr .= "{id:'c" . $cval["id"] . "',pId:'t" . $key . "',name:'" . $cval["servicename"] . "'},";
                }
            }
        }
        $zj_treestr = rtrim($zj_treestr, ",");
        $this->assign('treestr', $zj_treestr);
        $infohtml = $this->fetch("select_servcieinfo");
        $result = array("code" => 0, "msg" => "", "data" => $infohtml);
        exit(json_encode($result));
    }

}

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
 * 会员控制器
 */
class Member extends AdminBase {

    /**
     * 会员授权
     */
    public function memberAuth() {

        IS_POST && $this->jump($this->logicMember->addToGroup($this->param));

        // 所有的权限组
        $group_list = $this->logicAuthGroup->getAuthGroupList(['member_id' => MEMBER_ID]);

        // 会员当前权限组
        $member_group_list = $this->logicAuthGroupAccess->getMemberGroupInfo($this->param['id']);

        // 选择权限组
        $list = $this->logicAuthGroup->selectAuthGroupList($group_list, $member_group_list);

        $this->assign('list', $list);

        $this->assign('id', $this->param['id']);

        return $this->fetch('member_auth');
    }

    /**
     * 会员列表
     */
    public function memberList() {

        $where = $this->logicMember->getWhere($this->param);

        $this->assign('list', $this->logicMember->getMemberList($where));

        return $this->fetch('member_list');
    }

    /**
     * 会员导出
     */
    public function exportMemberList() {

        $where = $this->logicMember->getWhere($this->param);

        $this->logicMember->exportMemberList($where);
    }

    /**
     * 会员添加
     */
    public function memberAdd() {
        $this->param['module'] = MODULE_NAME;
        IS_POST && $this->jump($this->logicMember->memberAdd($this->param));
        $this->memberCommonData();
        return $this->fetch('member_add');
    }

    /**
     * 会员编辑
     */
    public function memberEdit() {
        $this->param['module'] = MODULE_NAME;
        IS_POST && $this->jump($this->logicMember->memberEdit($this->param));

        $info = $this->logicMember->getMemberInfo(['id' => $this->param['id']]);

        $this->memberCommonData();

        $this->assign('info', $info);

        return $this->fetch('member_edit');
    }

    /**
     * 会员删除
     */
    public function memberDel($id = 0) {

        return $this->jump($this->logicMember->memberDel(['id' => $id]));
    }

    /**
     * 个人资料
     */
    public function hrminfo($id = 0) {

        IS_POST && $this->jump($this->logicMember->hrminfo($this->param));

        $info = $this->logicMember->getMemberInfo(['id' => MEMBER_ID]);

        $this->assign('sex', parse_config_array('sex'));
        $this->assign('info', $info);
        return $this->fetch('hrminfo');
    }

    /**
     * 修改密码
     */
    public function editPassword() {

        IS_POST && $this->jump($this->logicMember->editPassword($this->param));

        $info = $this->logicMember->getMemberInfo(['id' => MEMBER_ID]);

        $this->assign('info', $info);

        return $this->fetch('edit_password');
    }

    /**
     * 重置密码
     */
    public function memberReset($id = 0) {

        return $this->jump($this->logicMember->memberReset(['id' => $id]));
    }

    private function memberCommonData() {
        $where[DATA_STATUS_NAME] = ['neq', DATA_DELETE];

        $order = "create_time desc";

        $this->assign('branch', $this->logicBranch->getBranchList($where, 'id ,name', $order, false));
        $this->assign('storage', $this->logicJxcstorage->get_storag());
        $this->assign('sex', parse_config_array('sex'));
    }
   
     public function select_member_ajax() {
       $deptlist = $this->logicBranch->getBranchList([], "id as deptid,name as deptname");
       $hrmlist = $this->logicMember->getMemberList([], "m.*", "branch", false);
       $zj_treestr = "";
        foreach ($deptlist as $key => $value) {
            $zj_treestr .= "{id:'t" . $value["deptid"] . "',pid:0,name:'" . $value["deptname"] . "',},";
            foreach ($hrmlist as $cval) {
                if ($cval["branch"] == $value["deptid"]) {
                    $zj_treestr .= "{id:'c" . $cval["id"] . "',pId:'t" . $cval["branch"] . "',name:'" . $cval["nickname"] . "'},";
                }
            }
        }
        $zj_treestr = rtrim($zj_treestr, ",");
        $this->assign('treestr', $zj_treestr);
        $infohtml = $this->fetch("select_hrm");
        $result = array("code" => 0, "msg" => "", "data" => $infohtml);
        exit(json_encode($result));
        
    }

}

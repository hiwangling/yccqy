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
 * 部门控制器
 */
class Branch extends AdminBase {

    /**
     * 部门列表
     */
    public function BranchList() {
        
        $where = $this->logicBranch->getWhere($this->param);
        $this->assign('list', $this->logicBranch->getBranchList($where));
        return $this->fetch('branch_list');
    }
   

    /**
     * 部门添加
     */
    public function BranchAdd() {
        $this->param['module'] = MODULE_NAME;
        IS_POST && $this->jump($this->logicBranch->BranchAdd($this->param));
	//$deptlist = $this->logicBranch->get_parent_dept();
        $this->assign('deptlist', $this->logicBranch->get_parent_dept());
        return $this->fetch('branch_edit');
    }

    /**
     * 部门编辑
     */
    public function BranchEdit() {
    $this->param['module'] = MODULE_NAME;
        IS_POST && $this->jump($this->logicBranch->BranchEdit($this->param));
        $info = $this->logicBranch->getBranchInfo(['id' => $this->param['id']]);
        $this->assign('info', $info);
      

        $this->assign('deptlist', $this->logicBranch->get_parent_dept($this->param['id']));
        return $this->fetch('branch_edit');
    }

    /**
     * 部门删除
     */
    public function BranchDel($id = 0) {

        $this->jump($this->logicBranch->BranchDel(['id' => $id]));
    }
    
    

}

<?php

namespace app\admin\controller;

/**
 * 岗位控制器
 */
class Grade extends AdminBase {

    /**
     * 岗位列表
     */
    public function GradeList()
    {
        $where = $this->logicGrade->getWhere($this->param);	
	$this->assign('list', $this->logicGrade->getGradeList($where));	
        return $this->fetch('grade_list');
    }
    /**
     * 岗位信息添加
     */
    public function GradeAdd()
    {
        
        IS_POST && $this->jump($this->logicGrade->GradeAdd($this->param));
        
        return $this->fetch('grade_add');
    }
    /**
     * 岗位信息编辑
     */
    public function GradeEdit()
    {
        
        IS_POST && $this->jump($this->logicGrade->GradeEdit($this->param));
        
        $info = $this->logicGrade->getGradeInfo(['id' => $this->param['id']]);
        
        $this->assign('info', $info);
        
        return $this->fetch('grade_edit');
    }
    
    /**
     * 岗位信息删除
     */
    public function GradeDel($id = 0)
    {
        
        $this->jump($this->logicGrade->GradeDel(['id' => $id]));
    }
    
    
    public function select_Grade_ajax() {
         
            $treestr = $this->logicGrade->Get_Grade_tree_str(); //得到专家的树形结构
            $this->assign('treestr', $treestr);
            $infohtml = $this->fetch("select_grade"); 
            $result = array("code" => 0, "msg" => "", "data" => $infohtml);
            exit(json_encode($result));
    }

}

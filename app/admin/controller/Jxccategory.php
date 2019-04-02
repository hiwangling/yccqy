<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

namespace app\admin\controller;

/**
 * Description of Jxccategory
 *
 * @author Administrator
 */
class Jxccategory extends AdminBase
{
   /**
     * 单位列表列表
     */
    public function JxccategoryList()
    {
        $where = $this->logicJxccategory->getWhere($this->param);
		
		$this->assign('list', $this->logicJxccategory->JxccategoryList($where));
		
        return $this->fetch('jxccategory_list');
    }
	 /**
     * 墓穴样式类型添加
     */
    public function JxccategoryAdd()
    {
        
        IS_POST && $this->jump($this->logicJxccategory->JxccategoryAdd($this->param));
          $this->assign('category', $this->logicJxccategory->get_parent());
        return $this->fetch('jxccategory_add');
    }
	/**
     * 墓穴样式类型编辑
     */
    public function JxccategoryEdit()
    {
        
        IS_POST && $this->jump($this->logicJxccategory->JxccategoryEdit($this->param));
        
        $info = $this->logicJxccategory->getJxccategoryInfo(['id' => $this->param['id']]);
            $this->assign('category', $this->logicJxccategory->get_parent());
        $this->assign('info', $info);
        
        return $this->fetch('jxccategory_edit');
    }
    
    /**
     * 墓穴样式类型删除
     */
    public function JxccategoryDel($id = 0)
    {
        
        $this->jump($this->logicJxccategory->JxccategoryDel(['id' => $id]));
    }
}
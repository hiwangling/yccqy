<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

namespace app\admin\controller;

/**
 * Description of jxcunit
 *
 * @author Administrator
 */
class Jxcunit extends AdminBase
{
   /**
     * 单位列表列表
     */
    public function JxcunitList()
    {
        $where = $this->logicJxcunit->getWhere($this->param);
		
		$this->assign('list', $this->logicJxcunit->getJxcunitList($where));
		
        return $this->fetch('jxcunit_list');
    }
	 /**
     * 墓穴样式类型添加
     */
    public function JxcunitAdd()
    {
        
        IS_POST && $this->jump($this->logicJxcunit->JxcunitAdd($this->param));
        
        return $this->fetch('jxcunit_add');
    }
	/**
     * 墓穴样式类型编辑
     */
    public function JxcunitEdit()
    {
        
        IS_POST && $this->jump($this->logicJxcunit->JxcunitEdit($this->param));
        
        $info = $this->logicJxcunit->getjxcunitInfo(['id' => $this->param['id']]);
        
        $this->assign('info', $info);
        
        return $this->fetch('jxcunit_edit');
    }
    
    /**
     * 墓穴样式类型删除
     */
    public function JxcunitDel($id = 0)
    {
        
        $this->jump($this->logicJxcunit->JxcunitDel(['id' => $id]));
    }
}

<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

namespace app\admin\controller;

/**
 * Description of Jxcsupplier
 *
 * @author Administrator
 */
class Jxcsupplier extends AdminBase
{
   /**
     * 单位列表列表
     */
    public function JxcsupplierList()
    {
        $where = $this->logicJxcsupplier->getWhere($this->param);
		
		$this->assign('list', $this->logicJxcsupplier->JxcsupplierList($where));
		
        return $this->fetch('jxcsupplier_list');
    }
	 /**
     * 墓穴样式类型添加
     */
    public function JxcsupplierAdd()
    {
        
        IS_POST && $this->jump($this->logicJxcsupplier->JxcsupplierAdd($this->param));
          $this->assign('storag', $this->logicJxcstorage->get_storag());
           
        return $this->fetch('jxcsupplier_add');
    }
	/**
     * 墓穴样式类型编辑
     */
    public function JxcsupplierEdit()
    {
        
        IS_POST && $this->jump($this->logicJxcsupplier->JxcsupplierEdit($this->param));
        
        $info = $this->logicJxcsupplier->getJxcsupplierInfo(['id' => $this->param['id']]);
            $this->assign('storag', $this->logicJxcstorage->get_storag());
        $this->assign('info', $info);
        
        return $this->fetch('jxcsupplier_edit');
    }
    
    /**
     * 墓穴样式类型删除
     */
    public function JxcsupplierDel($id = 0)
    {
        
        $this->jump($this->logicJxcsupplier->JxcsupplierDel(['id' => $id]));
    }
}
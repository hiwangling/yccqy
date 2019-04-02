<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

namespace app\admin\controller;

/**
 * Description of Jxcproduct
 *
 * @author Administrator
 */
class Jxcproduct extends AdminBase
{
   /**
     * 单位列表列表
     */
    public function JxcproductList()
    {
         $where = $this->logicJxcproduct->getWhere($this->param);
	 $this->assign('list', $this->logicJxcproduct->JxcproductList($where));
		
        return $this->fetch('jxcproduct_list');
    }
	 /**
     * 墓穴样式类型添加
     */
    public function JxcproductAdd()
    {
        
        IS_POST && $this->jump($this->logicJxcproduct->JxcproductAdd($this->param));
        $this->assign('category', $this->logicJxccategory->get_parent());
         $this->assign('supplier', $this->logicJxcsupplier->get_supplier());
          $this->assign('unit', $this->logicJxcunit->get_unit());
        return $this->fetch('jxcproduct_add');
    }
	/**
     * 墓穴样式类型编辑
     */
    public function JxcproductEdit()
    {
        
        IS_POST && $this->jump($this->logicJxcproduct->JxcproductEdit($this->param));
        
        $info = $this->logicJxcproduct->getJxcproductInfo(['id' => $this->param['id']]);
            $this->assign('category', $this->logicJxccategory->get_parent());
         $this->assign('supplier', $this->logicJxcsupplier->get_supplier());
          $this->assign('unit', $this->logicJxcunit->get_unit());
        $this->assign('info', $info);
        
        return $this->fetch('jxcproduct_edit');
    }
    
    /**
     * 墓穴样式类型删除
     */
    public function JxcproductDel($id = 0)
    {
        
        $this->jump($this->logicJxcproduct->JxcproductDel(['id' => $id]));
    }
}

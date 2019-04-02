<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

namespace app\admin\controller;

/**
 * Description of Jxcstorage
 *
 * @author Administrator
 */
class Jxcstorage extends AdminBase
{
   /**
     * 单位列表列表
     */
    public function JxcstorageList()
    {
        $where = $this->logicJxcstorage->getWhere($this->param);
		
		$this->assign('list', $this->logicJxcstorage->JxcstorageList($where));
		
        return $this->fetch('jxcstorage_list');
    }
	 /**
     * 墓穴样式类型添加
     */
    public function JxcstorageAdd()
    {
        
        IS_POST && $this->jump($this->logicJxcstorage->JxcstorageAdd($this->param));
         
        return $this->fetch('jxcstorage_add');
    }
	/**
     * 墓穴样式类型编辑
     */
    public function JxcstorageEdit()
    {
        
        IS_POST && $this->jump($this->logicJxcstorage->JxcstorageEdit($this->param));
        
        $info = $this->logicJxcstorage->getJxcstorageInfo(['id' => $this->param['id']]);
             
        $this->assign('info', $info);
        
        return $this->fetch('jxcstorage_edit');
    }
    
    /**
     * 墓穴样式类型删除
     */
    public function JxcstorageDel($id = 0)
    {
         $this->jump($this->logicJxcstorage->JxcstorageDel(['id' => $id]));
    }
    
    
    
}
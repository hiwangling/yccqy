<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

namespace app\admin\controller;

/**
 * Description of Jxccustome
 *
 * @author Administrator
 */
class Jxccustome extends AdminBase
{
   /**
     * 单位列表列表
     */
    public function JxccustomeList()
    {
        $where = $this->logicJxccustome->getWhere($this->param);
		
		$this->assign('list', $this->logicJxccustome->JxccustomeList($where));
		
        return $this->fetch('jxccustome_list');
    }
	 /**
     * 墓穴样式类型添加
     */
    public function JxccustomeAdd()
    {
        
        IS_POST && $this->jump($this->logicJxccustome->JxccustomeAdd($this->param));
          $this->assign('storag', $this->logicJxcstorage->get_storag());
        
        return $this->fetch('jxccustome_add');
    }
	/**
     * 墓穴样式类型编辑
     */
    public function JxccustomeEdit()
    {
        
        IS_POST && $this->jump($this->logicJxccustome->JxccustomeEdit($this->param));
        
        $info = $this->logicJxccustome->getJxccustomeInfo(['id' => $this->param['id']]);
            $this->assign('storag', $this->logicJxcstorage->get_storag());
        $this->assign('info', $info);
        
        return $this->fetch('jxccustome_edit');
    }
    
    /**
     * 墓穴样式类型删除
     */
    public function JxccustomeDel($id = 0)
    {
        
        $this->jump($this->logicJxccustome->JxccustomeDel(['id' => $id]));
    }
}

<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

namespace app\admin\logic;

/**
 * Description of Jxcunit
 *
 * @author Administrator
 */
class Jxcunit extends AdminBase
{
    /**
     * 获取墓穴样式类型列表
     */
    public function getJxcunitList($where = [], $field = true, $order = '', $paginate = DB_LIST_ROWS)
    {
        
        return $this->modelJxcunit->getList($where, $field, $order, $paginate);
    }
	/**
     * 墓穴样式类型信息添加
     */
    public function JxcunitAdd($data = [])
    {
        
        $validate_result = $this->validateJxcunit->scene('add')->check($data);
        
        if (!$validate_result) {
            
            return [RESULT_ERROR, $this->validateJxcunit->getError()];
        }
        
        $url = url('JxcunitList');
        
        $result = $this->modelJxcunit->setInfo($data);
		
		$result && action_log('新增', '新增单位，name：' . $data['name']);
        
        return $result ? [RESULT_SUCCESS, '操作成功', $url] : [RESULT_ERROR, $this->modelJxcunit->getError()];
    }
	/**
     * 墓穴样式类型信息编辑
     */
    public function JxcunitEdit($data = [])
    {
        
        $validate_result = $this->validateJxcunit->scene('edit')->check($data);
        
        if (!$validate_result) {
            
            return [RESULT_ERROR, $this->validateJxcunit->getError()];
        }
        
        $url = url('JxcunitList');
        
        $result = $this->modelJxcunit->setInfo($data);
        
        $result && action_log('编辑', '编辑单位类型，name：' . $data['name']);
        
        return $result ? [RESULT_SUCCESS, '操作成功', $url] : [RESULT_ERROR, $this->modelJxcunit->getError()];
    }

    /**
     * 获取墓穴样式类型信息
     */
    public function getJxcunitInfo($where = [], $field = true)
    {
        
        return $this->modelJxcunit->getInfo($where, $field);
    }
    
    /**
     * 墓穴样式类型删除
     */
    public function JxcunitDel($where = [])
    {
        
        $result = $this->modelJxcunit->deleteInfo($where);
        
        $result && action_log('删除', '单位类型删除' . '，where：' . http_build_query($where));
        
        return $result ? [RESULT_SUCCESS, '删除成功'] : [RESULT_ERROR, $this->modelJxcunit->getError()];
    }
		/**
     * 获取列表搜索条件
     */
    public function getWhere($data = [])
    {
        
        $where = [];
        
        !empty($data['search_data']) && $where['name'] = ['like', '%'.$data['search_data'].'%'];
        
        return $where;
    }
      public function get_unit($ID=0)
    {
        $where["status"] = 1;
          if ($ID>0)
            $where["id"]  = $ID;
         return $this->modelJxcunit->getList($where, 'id ,name', "create_time", false);
       
    }
}

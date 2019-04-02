<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

namespace app\admin\logic;

/**
 * Description of Jxcproduct
 *
 * @author Administrator
 */
class Jxcproduct extends AdminBase
{
    /**
     * 获取墓穴样式类型列表
     */
    public function JxcproductList($where = [], $field = true, $order = '', $paginate = DB_LIST_ROWS)
    {
        $field="a.*,j.name as cname,u.name as uname,s.name as sname";
        $this->modelJxcproduct->alias('a');
        
        $join = [
                    [SYS_DB_PREFIX . 'jxccategory j', 'j.id = a.category',"left"],
                     [SYS_DB_PREFIX . 'jxcunit u', 'u.id = a.unit',"left"],
             [SYS_DB_PREFIX . 'jxcsupplier s', 's.id = a.supplier',"left"]
                ];
        
        $where['a.' . DATA_STATUS_NAME] = ['neq', DATA_DELETE];
        
        return $this->modelJxcproduct->getList($where, $field, $order, $paginate,$join);
    }
	/**
     * 墓穴样式类型信息添加
     */
    public function JxcproductAdd($data = [])
    {
        
        $validate_result = $this->validateJxcproduct->scene('add')->check($data);
        
        if (!$validate_result) {
            
            return [RESULT_ERROR, $this->validateJxcproduct->getError()];
        }
        
        $url = url('JxcproductList');
        
        $result = $this->modelJxcproduct->setInfo($data);
		
		$result && action_log('新增', '新增产品，name：' . $data['name']);
        
        return $result ? [RESULT_SUCCESS, '操作成功', $url] : [RESULT_ERROR, $this->modelJxcproduct->getError()];
    }
	/**
     * 墓穴样式类型信息编辑
     */
    public function JxcproductEdit($data = [])
    {
        
        $validate_result = $this->validateJxcproduct->scene('edit')->check($data);
        
        if (!$validate_result) {
            
            return [RESULT_ERROR, $this->validateJxcproduct->getError()];
        }
        
        $url = url('JxcproductList');
        
        $result = $this->modelJxcproduct->setInfo($data);
        
        $result && action_log('编辑', '编辑产品，name：' . $data['name']);
        
        return $result ? [RESULT_SUCCESS, '操作成功', $url] : [RESULT_ERROR, $this->modelJxcproduct->getError()];
    }

    /**
     * 获取墓穴样式类型信息
     */
    public function getJxcproductInfo($where = [], $field = true)
    {
        
        return $this->modelJxcproduct->getInfo($where, $field);
    }
    
    /**
     * 墓穴样式类型删除
     */
    public function JxcproductDel($where = [])
    {
        
        $result = $this->modelJxcproduct->deleteInfo($where);
        
        $result && action_log('删除', '单位类型删除' . '，where：' . http_build_query($where));
        
        return $result ? [RESULT_SUCCESS, '删除成功'] : [RESULT_ERROR, $this->modelJxcproduct->getError()];
    }
		/**
     * 获取列表搜索条件
     */
    public function getWhere($data = [])
    {
        
        $where = [];
        
        !empty($data['search_data']) && $where['a.name|a.sn'] = ['like', '%'.$data['search_data'].'%'];
        
        return $where;
    }
    
      public function get_product()
    {
        $where["status"] = 1;
     
         return $this->modelJxcproduct->getList($where, 'id ,name', "category", false);
       
    } 
}


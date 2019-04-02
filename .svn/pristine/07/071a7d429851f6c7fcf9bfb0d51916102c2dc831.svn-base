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
class Jxccategory extends AdminBase
{
    /**
     * 获取墓穴样式类型列表
     */
    public function JxccategoryList($where = [], $field = true, $order = '', $paginate = DB_LIST_ROWS)
    {
        $field="a.*,j.name as pname";
        $this->modelJxccategory->alias('a');
        
        $join = [
                    [SYS_DB_PREFIX . 'jxccategory j', 'j.id = a.pid',"left"]
                ];
        
        $where['a.' . DATA_STATUS_NAME] = ['neq', DATA_DELETE];
        
        return $this->modelJxccategory->getList($where, $field, $order, $paginate,$join);
    }
	/**
     * 墓穴样式类型信息添加
     */
    public function JxccategoryAdd($data = [])
    {
        
        $validate_result = $this->validateJxccategory->scene('add')->check($data);
        
        if (!$validate_result) {
            
            return [RESULT_ERROR, $this->validateJxccategory->getError()];
        }
        
        $url = url('JxccategoryList');
        
        $result = $this->modelJxccategory->setInfo($data);
		
		$result && action_log('新增', '新增类别，name：' . $data['name']);
        
        return $result ? [RESULT_SUCCESS, '操作成功', $url] : [RESULT_ERROR, $this->modelJxccategory->getError()];
    }
	/**
     * 墓穴样式类型信息编辑
     */
    public function JxccategoryEdit($data = [])
    {
        
        $validate_result = $this->validateJxccategory->scene('edit')->check($data);
        
        if (!$validate_result) {
            
            return [RESULT_ERROR, $this->validateJxccategory->getError()];
        }
        
        $url = url('JxccategoryList');
        
        $result = $this->modelJxccategory->setInfo($data);
        
        $result && action_log('编辑', '编辑新增类别，name：' . $data['name']);
        
        return $result ? [RESULT_SUCCESS, '操作成功', $url] : [RESULT_ERROR, $this->modelJxccategory->getError()];
    }

    /**
     * 获取墓穴样式类型信息
     */
    public function getJxccategoryInfo($where = [], $field = true)
    {
        
        return $this->modelJxccategory->getInfo($where, $field);
    }
    
    /**
     * 墓穴样式类型删除
     */
    public function JxccategoryDel($where = [])
    {
        
        $result = $this->modelJxccategory->deleteInfo($where);
        
        $result && action_log('删除', '单位类型删除' . '，where：' . http_build_query($where));
        
        return $result ? [RESULT_SUCCESS, '删除成功'] : [RESULT_ERROR, $this->modelJxccategory->getError()];
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
    
      public function get_parent($ID=0)
    {
        $where["status"] = 1;
          if ($ID>0)
         $where["id"]  = array('NEQ',$ID);
         return $this->modelJxccategory->getList($where, 'id ,name', "pid", false);
       
    }
}

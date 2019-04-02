<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

namespace app\admin\logic;

/**
 * Description of Jxccustome
 *
 * @author Administrator
 */
class Jxccustome extends AdminBase
{
    /**
     * 获取墓穴样式类型列表
     */
    public function JxccustomeList($where = [], $field = true, $order = '', $paginate = DB_LIST_ROWS)
    {
        $field="a.*,s.name as sname";
        $this->modelJxccustome->alias('a');
        
        $join = [
                    [SYS_DB_PREFIX . 'jxcstorage s', 's.id = a.storageid',"left"]
                ];
        
        $where['a.' . DATA_STATUS_NAME] = ['neq', DATA_DELETE];
        
        return $this->modelJxccustome->getList($where, $field, $order, $paginate,$join);
    }
	/**
     * 墓穴样式类型信息添加
     */
    public function JxccustomeAdd($data = [])
    {
        
        $validate_result = $this->validateJxccustome->scene('add')->check($data);
        
        if (!$validate_result) {
            
            return [RESULT_ERROR, $this->validateJxccustome->getError()];
        }
        
        $url = url('JxccustomeList');
        
        $result = $this->modelJxccustome->setInfo($data);
		
		$result && action_log('新增', '新增类别，name：' . $data['name']);
        
        return $result ? [RESULT_SUCCESS, '操作成功', $url] : [RESULT_ERROR, $this->modelJxccustome->getError()];
    }
	/**
     * 墓穴样式类型信息编辑
     */
    public function JxccustomeEdit($data = [])
    {
        
        $validate_result = $this->validateJxccustome->scene('edit')->check($data);
        
        if (!$validate_result) {
            
            return [RESULT_ERROR, $this->validateJxccustome->getError()];
        }
        
        $url = url('JxccustomeList');
        
        $result = $this->modelJxccustome->setInfo($data);
        
        $result && action_log('编辑', '编辑新增供应商，name：' . $data['name']);
        
        return $result ? [RESULT_SUCCESS, '操作成功', $url] : [RESULT_ERROR, $this->modelJxccustome->getError()];
    }

    /**
     * 获取墓穴样式类型信息
     */
    public function getJxccustomeInfo($where = [], $field = true)
    {
        
        return $this->modelJxccustome->getInfo($where, $field);
    }
    
    /**
     * 墓穴样式类型删除
     */
    public function JxccustomeDel($where = [])
    {
        
        $result = $this->modelJxccustome->deleteInfo($where);
        
        $result && action_log('删除', '客户删除' . '，where：' . http_build_query($where));
        
        return $result ? [RESULT_SUCCESS, '删除成功'] : [RESULT_ERROR, $this->modelJxccustome->getError()];
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
    
     public function get_custome($sID=0)
    {
        $where["status"] = 1;
          if ($sID>0)
            $where["storageid"]  = $sID;
         return $this->modelJxccustome->getList($where, 'id ,name', "create_time", false);
       
    }
    
    
    
}
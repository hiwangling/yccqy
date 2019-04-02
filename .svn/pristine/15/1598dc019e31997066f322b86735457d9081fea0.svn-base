<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

namespace app\admin\logic;

/**
 * Description of Jxcstorage
 *
 * @author Administrator
 */
class Jxcstorage  extends AdminBase
{
    /**
     * 获取墓穴样式类型列表
     */
    public function JxcstorageList($where = [], $field = true, $order = '', $paginate = DB_LIST_ROWS)
    {
       
        $where[ DATA_STATUS_NAME] = ['neq', DATA_DELETE];
        
        return $this->modelJxcstorage->getList($where, $field, $order, $paginate);
    }
	/**
     * 墓穴样式类型信息添加
     */
    public function JxcstorageAdd($data = [])
    {
        
        $validate_result = $this->validateJxcstorage->scene('add')->check($data);
        
        if (!$validate_result) {
            
            return [RESULT_ERROR, $this->validateJxcstorage->getError()];
        }
        
        $url = url('JxcstorageList');
        
        $result = $this->modelJxcstorage->setInfo($data);
		
		$result && action_log('新增', '新增仓库，name：' . $data['name']);
        
        return $result ? [RESULT_SUCCESS, '操作成功', $url] : [RESULT_ERROR, $this->modelJxcstorage->getError()];
    }
	/**
     * 墓穴样式类型信息编辑
     */
    public function JxcstorageEdit($data = [])
    {
        
        $validate_result = $this->validateJxcstorage->scene('edit')->check($data);
        
        if (!$validate_result) {
            
            return [RESULT_ERROR, $this->validateJxcstorage->getError()];
        }
        
        $url = url('JxcstorageList');
        
        $result = $this->modelJxcstorage->setInfo($data);
        
        $result && action_log('编辑', '编辑新增仓库，name：' . $data['name']);
        
        return $result ? [RESULT_SUCCESS, '操作成功', $url] : [RESULT_ERROR, $this->modelJxcstorage->getError()];
    }

    /**
     * 获取墓穴样式类型信息
     */
    public function getJxcstorageInfo($where = [], $field = true)
    {
        
        return $this->modelJxcstorage->getInfo($where, $field);
    }
    
    /**
     * 墓穴样式类型删除
     */
    public function JxcstorageDel($where = [])
    {
        
        $result = $this->modelJxcstorage->deleteInfo($where);
        
        $result && action_log('删除', '单位仓库删除' . '，where：' . http_build_query($where));
        
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
      public function get_storag($ID=0)
    {
        $where["status"] = 1;
          if ($ID>0)
         $where["id"]  = array('NEQ',$ID);
         return $this->modelJxcstorage->getList($where, 'id ,name', "id", false);
       
    }
    
     ////根据用户的ID ,获取所在的仓库
    public function get_userid_storageid($userid )
    {
        if (!IS_ROOT)
             $sql="select  s.* from ".SYS_DB_PREFIX."jxcstorage as s inner join  ".SYS_DB_PREFIX."member  as m on m.storageid = s.id  where m.id=$userid";
         else
              $sql="select  s.* from ".SYS_DB_PREFIX."jxcstorage as s  where status!=-1";
   
             $list= $this->modelJxcstorage->getList($sql);
             if (!empty($list[0]))
                 return $list[0];
             else
                 return false;
          
    }
    
}


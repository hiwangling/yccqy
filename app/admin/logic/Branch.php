<?php
// +---------------------------------------------------------------------+
// | OneBase    | [ WE CAN DO IT JUST THINK ]                            |
// +---------------------------------------------------------------------+
// | Licensed   | http://www.apache.org/licenses/LICENSE-2.0 )           |
// +---------------------------------------------------------------------+
// | Author     | Bigotry <3162875@qq.com>                               |
// +---------------------------------------------------------------------+
// | Repository | https://gitee.com/Bigotry/OneBase                      |
// +---------------------------------------------------------------------+

namespace app\admin\logic;

/**
 * 部门逻辑
 */
class Branch extends AdminBase
{
    
    /**
     * 获取部门列表
     */
    public function getBranchList($where = [], $field = true, $order = '', $paginate = DB_LIST_ROWS)
    {
        $where["module"]=  MODULE_NAME;
        return $this->modelBranch->getList($where, $field, $order, $paginate);
    }
    /**
     * 部门信息添加
     */
    public function BranchAdd($data = [])
    {
        
        $validate_result = $this->validateBranch->scene('add')->check($data);
        
        if (!$validate_result) {
            
            return [RESULT_ERROR, $this->validateBranch->getError()];
        }
        
        $url = url('branchlist');
        
        $result = $this->modelBranch->setInfo($data);
		
		$result && action_log('新增', '新增部门，name：' . $data['name']);
        
        return $result ? [RESULT_SUCCESS, '操作成功', $url] : [RESULT_ERROR, $this->modelBlogroll->getError()];
    }

    /**
     * 部门信息编辑
     */
    public function BranchEdit($data = [])
    {
        
        $validate_result = $this->validateBranch->scene('edit')->check($data);
        
        if (!$validate_result) {
            
            return [RESULT_ERROR, $this->validateBranch->getError()];
        }
        
        $url = url('branchlist');
        
        $result = $this->modelBranch->setInfo($data);
        
        $result && action_log('编辑', '编辑部门，name：' . $data['name']);
        
        return $result ? [RESULT_SUCCESS, '操作成功', $url] : [RESULT_ERROR, $this->modelBlogroll->getError()];
    }

    /**
     * 获取部门信息
     */
    public function getBranchInfo($where = [], $field = true)
    {
        
        return $this->modelBranch->getInfo($where, $field);
    }
    
    /**
     * 部门删除
     */
    public function BranchDel($where = [])
    {
        
        $result = $this->modelBranch->deleteInfo($where);
        
        $result && action_log('删除', '部门删除' . '，where：' . http_build_query($where));
        
        return $result ? [RESULT_SUCCESS, '删除成功'] : [RESULT_ERROR, $this->modelBlogroll->getError()];
    }
	 /**
     * 获取部门列表搜索条件
     */
    public function getWhere($data = [])
    {
        
        $where = [];
       $where["module"]=  MODULE_NAME;
        !empty($data['search_data']) && $where['name'] = ['like', '%'.$data['search_data'].'%'];
        
        return $where;
    }
    
     public function get_parent_dept($ID=0)
    {
        $where["status"] = 1;
        $where["parentid"] = 0;
        $where["module"] = MODULE_NAME;
        if ($ID>0)
         $where["id"]  = array('NEQ',$ID);
         return $this->modelBranch->getList($where, 'id ,name', "iorder", false);
       
    }
    
}

<?php


namespace app\admin\logic;

/**
 * 岗位逻辑
 */
class Grade extends AdminBase
{
    
    /**
     * 获岗位列表
     */
    public function getGradeList($where = [], $field = true, $order = '', $paginate = DB_LIST_ROWS)
    {
        
        return $this->modelGrade->getList($where, $field, $order, $paginate);
    }
    /**
     * 岗位信息添加
     */
    public function GradeAdd($data = [])
    {
        
        $validate_result = $this->validateGrade->scene('add')->check($data);
        
        if (!$validate_result) {
            
            return [RESULT_ERROR, $this->validateGrade->getError()];
        }
        
        $url = url('GradeList');
        
        $result = $this->modelGrade->setInfo($data);
		
		$result && action_log('新增', '新增单位，name：' . $data['name']);
        
        return $result ? [RESULT_SUCCESS, '操作成功', $url] : [RESULT_ERROR, $this->modelGrade->getError()];
    }
    /**
     * 岗位信息编辑
     */
    public function GradeEdit($data = [])
    {
        
        $validate_result = $this->validateGrade->scene('edit')->check($data);
        
        if (!$validate_result) {
            
            return [RESULT_ERROR, $this->validateGrade->getError()];
        }
        
        $url = url('GradeList');
        
        $result = $this->modelGrade->setInfo($data);
        
        $result && action_log('编辑', '编辑单位类型，name：' . $data['name']);
        
        return $result ? [RESULT_SUCCESS, '操作成功', $url] : [RESULT_ERROR, $this->modelGrade->getError()];
    }

    /**
     * 获取岗位信息
     */
    public function getGradeInfo($where = [], $field = true)
    {
        
        return $this->modelGrade->getInfo($where, $field);
    }
    
    /**
     * 岗位信息删除
     */
    public function GradeDel($where = [])
    {
        
        $result = $this->modelGrade->deleteInfo($where);
        
        $result && action_log('删除', '单位类型删除' . '，where：' . http_build_query($where));
        
        return $result ? [RESULT_SUCCESS, '删除成功'] : [RESULT_ERROR, $this->modelGrade->getError()];
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
    
   public function Get_Grade_tree_str() {
      
        $hrmlist = $this->getGradeList([], "*", "id", false);
       
       $zj_treestr ="";
            foreach ($hrmlist as $cval) {
                    $zj_treestr .= "{id:'c" . $cval["id"] . "',pId:0,name:'" . $cval["name"] . "'},";
                }
        $zj_treestr = rtrim($zj_treestr, ",");
        return $zj_treestr;
    }
    
    
    
}

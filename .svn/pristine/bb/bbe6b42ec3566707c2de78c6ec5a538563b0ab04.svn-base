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
 * 会员逻辑
 */
class Member extends AdminBase
{
    
    /**
     * 获取会员信息
     */
    public function getMemberInfo($where = [], $field = true)
    {
        
        $info = $this->modelMember->getInfo($where, $field);
        
        //$info['leader_nickname'] = $this->modelMember->getValue(['id' => $info['leader_id']], 'nickname');
        
        return $info;
    }
    
    /**
     * 获取会员列表
     */
   public function getMemberList($where = [], $field = 'm.*,c.name as branch_name,j.name as storagename', $order = '', $paginate = DB_LIST_ROWS)
    {
        
        $this->modelMember->alias('m');
        $join = [
                    [SYS_DB_PREFIX . 'branch c', 'm.branch = c.id'],
                        [SYS_DB_PREFIX . 'jxcstorage j', 'j.id = m.storageid',"left"],
                ]; 
        $this->modelMember->join = $join;
        return $this->modelMember->getList($where, $field, $order, $paginate);
    }
    
     /**
     * 获取会员列表
     */
    public function getMemberList_byserviceid($where = [], $field = 'm.*', $order = '', $paginate = DB_LIST_ROWS)
    {
        
        $this->modelMember->alias('m');
       
        $join = [
                    [SYS_DB_PREFIX . 'serviceinfo s', 's.deptid = m.branch'],
                    [SYS_DB_PREFIX . 'servicebill b', 'b.serviceID = s.id']
                    
                ]; 
        
        $where['m.' . DATA_STATUS_NAME] = ['neq', DATA_DELETE];
         $this->modelMember->join = $join;
        
        return $this->modelMember->getList($where, $field, $order, $paginate);
    }
    
    /**
     * 导出会员列表
     */
    public function exportMemberList($where = [], $field = 'm.*,c.name as deptname', $order = 'userno desc')
    {
        
        $list = $this->getMemberList($where, $field, $order, false);
        
        $titles = "工号,姓名,岗位,部门,手机,身份证,办公地点 ";
        $keys   = "userno,username,gradename,deptname,mobile,icno,office";
        
        action_log('导出', '导出人员列表');
        
        export_excel($titles, $keys, $list, '人员列表');
    }
    
    /**
     * 获取会员列表搜索条件
     */
    public function getWhere($data = [])
    {
        
        $where = [];
        
        !empty($data['search_data']) && $where['m.nickname|m.username|m.email|m.mobile'] = ['like', '%'.$data['search_data'].'%'];
        
        if (!is_administrator()) {
            
            $member = session('member_info');
            
          
        }
        
        return $where;
    }
    
    /**
     * 获取存在继承关系的会员ids
     */
    public function getInheritMemberIds($id = 0, $data = [])
    {
        
        $member_id = $this->modelMember->getValue(['id' => $id, 'is_share_member' => DATA_NORMAL], 'leader_id');
        
        if (empty($member_id)) {
            
            return $data;
        } else {
            
            $data[] = $member_id;
            
            return $this->getInheritMemberIds($member_id, $data);
        }
    }
    
    /**
     * 获取会员的所有下级会员
     */
    public function getSubMemberIds($id = 0, $data = [])
    {
        
        $member_list = $this->modelMember->getList(['leader_id' => $id], 'id', 'id asc', false);
        
        foreach ($member_list as $v)
        {
            
            if (!empty($v['id'])) {
                
                $data[] = $v['id'];
            
                $data = array_unique(array_merge($data, $this->getSubMemberIds($v['id'], $data)));
            }
            
            continue;
        }
            
        return $data;
    }
    
    /**
     * 会员添加到用户组
     */
    public function addToGroup($data = [])
    {
        
        $url = url('memberList');
        
        if (SYS_ADMINISTRATOR_ID == $data['id']) {
            
            return [RESULT_ERROR, '天神不能授权哦~', $url];
        }
        
        $where = ['member_id' => ['in', $data['id']]];
        
        $this->modelAuthGroupAccess->deleteInfo($where, true);
        
        if (empty($data['group_id'])) {
            
            return [RESULT_SUCCESS, '会员授权成功', $url];
        }
        
        $add_data = [];
        
        foreach ($data['group_id'] as $group_id) {
            
            $add_data[] = ['member_id' => $data['id'], 'group_id' => $group_id];
        }
        
        if ($this->modelAuthGroupAccess->setList($add_data)) {
            
            action_log('授权', '会员授权，id：' . $data['id']);
        
            $this->logicAuthGroup->updateSubAuthByMember($data['id']);
            
            return [RESULT_SUCCESS, '会员授权成功', $url];
        } else {
            
            return [RESULT_ERROR, $this->modelAuthGroupAccess->getError()];
        }
    }
    
    /**
     * 会员添加
     */
    public function memberAdd($data = [])
    {
        
        $validate_result = $this->validateMember->scene('add')->check($data);
        
        if (!$validate_result) {
            
            return [RESULT_ERROR, $this->validateMember->getError()];
        }
        
        $url = url('memberList');
        $data['password'] = 123456;
        $data['leader_id'] = MEMBER_ID;
        $data['is_inside'] = DATA_NORMAL;
        $data['username'] = $data['nickname'];
        
        $result = $this->modelMember->setInfo($data);
        
        $result && action_log('新增', '新增会员，username：' . $data['username']);
        
        return $result ? [RESULT_SUCCESS, '会员添加成功', $url] : [RESULT_ERROR, $this->modelMember->getError()];
    }
    
    /**
     * 会员编辑
     */
    public function memberEdit($data = [])
    {
        
        $validate_result = $this->validateMember->scene('edit')->check($data);
        
        if (!$validate_result) {
            
            return [RESULT_ERROR, $this->validateMember->getError()];
        }
        
        $url = url('memberList');
        $data['username'] = $data['nickname'];
        $result = $this->modelMember->setInfo($data);
        
        $result && action_log('编辑', '编辑会员，id：' . $data['id']);
        
        return $result ? [RESULT_SUCCESS, '会员编辑成功', $url] : [RESULT_ERROR, $this->modelMember->getError()];
    }
	
	/**
     * 个人会员编辑
     */
    public function hrminfo($data = [])
    {
        
        $url = url('hrminfo');
        
        $result = $this->modelMember->setInfo($data);
        
        $result && action_log('编辑', '编辑个人资料，id：' . $data['id']);
        
        return $result ? [RESULT_SUCCESS, '会员编辑成功', $url] : [RESULT_ERROR, $this->modelMember->getError()];
    }
	
	/**
     * 修改密码
     */
    public function uppassword($data = [])
    {
        $validate_result = $this->validateMember->scene('uppassword')->check($data);
        
        if (!$validate_result) {
            
            return [RESULT_ERROR, $this->validateMember->getError()];
        }
		
		$passData['id']= MEMBER_ID;
		
		$passData['password']= $this->modelMember->setPasswordAttr($data['password']);
		
        $url = url('uppassword');
        
        $result = $this->modelMember->setInfo($passData);
        
        $result && action_log('编辑', '编辑个人资料，id：' . MEMBER_ID);
        
        return $result ? [RESULT_SUCCESS, '会员编辑成功', $url] : [RESULT_ERROR, $this->modelMember->getError()];
    }
	
    public function editPassword($data = []) {

        $validate_result = $this->validateMember->scene('uppassword')->check($data);

        if (!$validate_result) {

            return [RESULT_ERROR, $this->validateMember->getError()];
        }

        $member = $this->getMemberInfo(['id' => $data['id']]);

        if (data_md5_key($data['old_password']) != $member['password']) {

            return [RESULT_ERROR, '旧密码输入不正确'];
        }

        $data['id'] = MEMBER_ID;

        $url = url('index/index');

        $result = $this->modelMember->setInfo($data);

        $result && action_log('编辑', '会员密码修改，id：' . $data['id']);

        return $result ? [RESULT_SUCCESS, '密码修改成功', $url] : [RESULT_ERROR, $this->modelMember->getError()];
    }
    
	/**
     * 会员密码重置
     */
    public function memberReset($where = [])
    {
	    $url = url('memberList');
		
        $passData['id']= $where['id'];
		
		$passData['password']= $this->modelMember->setPasswordAttr(123456);
		
        $result = $this->modelMember->setInfo($passData);
                
        $result && action_log('重置', '密码重置，id：' . $where['id']);
        
        return $result ? [RESULT_SUCCESS, '密码重置成功', $url] : [RESULT_ERROR, $this->modelMember->getError(),$url];
		
        return $result ? [RESULT_SUCCESS, '会员删除成功', $url] : [RESULT_ERROR, $this->modelMember->getError(), $url];
    }
    
    /**
     * 设置会员信息
     */
    public function setMemberValue($where = [], $field = '', $value = '')
    {
        
        return $this->modelMember->setFieldValue($where, $field, $value);
    }
    
    /**
     * 会员删除
     */
    public function memberDel($where = [])
    {
        
        $url = url('memberList');
        
        if (SYS_ADMINISTRATOR_ID == $where['id'] || MEMBER_ID == $where['id']) {
            
            return [RESULT_ERROR, '天神和自己不能删除哦~', $url];
        }
        
        $result = $this->modelMember->deleteInfo($where);
                
        $result && action_log('删除', '删除会员，where：' . http_build_query($where));
        
        return $result ? [RESULT_SUCCESS, '会员删除成功', $url] : [RESULT_ERROR, $this->modelMember->getError(), $url];
    }
		/**
     * 根据部门，查找会员
     */
	public function get_parent_member($ID = 0)
    {
            $where["status"] = 1;
	  $where["module"]=  MODULE_NAME;
		$where['branch'] = $ID['ids'];

        return $this->modelMember->getList($where, 'id,nickname', "id", false);
       
    }
}

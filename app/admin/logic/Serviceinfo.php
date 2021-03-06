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
 * 墓园类型逻辑
 */
class Serviceinfo extends AdminBase {

    /**
     * 获取墓园类型列表
     */
    public function getServiceinfoList($where = [], $field = 'a.*', $order = '', $paginate = DB_LIST_ROWS) {
        $this->modelServiceinfo->alias('a');
        $join = [
            [SYS_DB_PREFIX . 'branch b', 'a.deptid = b.id', 'left'],
        ];

        $where['a.' . DATA_STATUS_NAME] = ['neq', DATA_DELETE];
        $this->modelServiceinfo->join = $join;
        return $this->modelServiceinfo->getList($where, $field, $order, $paginate);
    }

    public function getServiceinfo_edit_List($sellid, $where = [], $field = 'a.*', $order = '', $paginate = DB_LIST_ROWS) {
        $this->modelServiceinfo->alias('a');

        $join = [
            [SYS_DB_PREFIX . 'branch b', 'a.deptid = b.id', 'left'],
            [SYS_DB_PREFIX . 'servicebill s', 'a.id = s.serviceID and s.sellID=' . $sellid, 'left'],
            [SYS_DB_PREFIX . 'finance f', 'f.id = s.financeID and s.sellID=' . $sellid, 'left']
        ];

        $where['a.' . DATA_STATUS_NAME] = ['neq', DATA_DELETE];
        $this->modelServiceinfo->join = $join;
        return $this->modelServiceinfo->getList($where, $field, $order, $paginate);
    }

    /**
     * 墓园类型信息添加
     */
    public function ServiceinfoAdd($data = []) {
        $validate_result = $this->validateServiceinfo->scene('add')->check($data);
        if (!$validate_result) {
            $result = array("code" => 1, "msg" => $this->validateServiceinfo->getError());
            return $result;
        }
         $financetype_var=",";
        if(isset($data["financetype"]))
        {
            foreach ($data["financetype"] as $value) {
                $financetype_var.=$value.",";
            }
        }
        if ($financetype_var!=",")
            $data["servicetype"]=$financetype_var;
        else
            $data["servicetype"]="";
        $result = $this->modelServiceinfo->setInfo($data);
        $result && action_log('新增', '新增服务信息，name：' . $data['servicename']);
        if ($result != FALSE) {
            $result = array("code" => 0, "msg" => "success");
        } else {
            $result = array("code" => 1, "msg" => "error");
        }
        return $result;
    }

    /**
     * 墓园类型信息编辑
     */
    public function ServiceinfoEdit($data = []) {

        $validate_result = $this->validateServiceinfo->scene('edit')->check($data);
        if (!$validate_result) {
            $result = array("code" => 1, "msg" => $this->validateServiceinfo->getError());
            return $result;
        }
         $financetype_var=",";
        if(isset($data["financetype"]))
        {
            foreach ($data["financetype"] as $value) {
                $financetype_var.=$value.",";
            }
        }
        if ($financetype_var!=",")
            $data["servicetype"]=$financetype_var;
        else
            $data["servicetype"]="";
        $result = $this->modelServiceinfo->setInfo($data);
        $result && action_log('编辑', '编辑服务信息，name：' . $data['servicename']);
        if ($result != FALSE) {
            $result = array("code" => 0, "msg" => "success");
        } else {
            $result = array("code" => 1, "msg" => "error");
        }
        return $result;
    }

    /**
     * 获取墓园类型信息
     */
    public function getServiceinfoInfo($where = [], $field = true) {

        return $this->modelServiceinfo->getInfo($where, $field);
    }

    /**
     * 墓园类型删除
     */
    public function ServiceinfoDel($where = []) {

        $result = $this->modelServiceinfo->deleteInfo($where);

        $result && action_log('删除', '服务信息删除' . '，where：' . http_build_query($where));

        return $result ? [RESULT_SUCCESS, '删除成功'] : [RESULT_ERROR, $this->modelBlogroll->getError()];
    }

    /**
     * 获取列表搜索条件
     */
    public function getWhere($data = []) {

        $where = [];

        !empty($data['search_data']) && $where['servicename'] = ['like', '%' . $data['search_data'] . '%'];

        return $where;
    }

    public function getServiceinfoStat($where = [], $stat_type = 'count', $field = 'id') {

        return $this->modelServiceinfo->stat($where, $stat_type, $field);
    }

     

    /**
     * 获取某一类收费项目
     */
    public function get_service_info_type($type, $issystem = true) {
        $where["status"] = 1;
        $where["servicetype"] = $type;
        if (!$issystem) {
            $where["issystem"] = 0;
        }
        return $this->modelServiceinfo->getList($where, '*', "sort", false);
    }
    
    public  function Get_Serviceinfo_tree_str($servicetype=[])
    {
        
        $hrmlist = $this->getServiceinfoList([], "a.id,a.servicename,sellprice", "servicetype,sort s", false);
        $zj_treestr = "";
        foreach ($deptlist as $key => $value) {
            $zj_treestr .= "{id:'t" . $value["deptid"] . "',pid:0,name:'" . $value["deptname"] . "',},";
            foreach ($hrmlist as $cval) {
                if ($cval["branch"] == $value["deptid"]) {
                    $zj_treestr .= "{id:'c" . $cval["id"] . "',pId:'t" . $cval["branch"] . "',name:'" . $cval["nickname"] . "'},";
                }
            }
        }
        $zj_treestr = rtrim($zj_treestr, ",");
        return $zj_treestr;
    }
    

}

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

class Manage extends AdminBase {

    public function getManageList($where = [], $field = 'a.*', $order = '', $paginate = DB_LIST_ROWS) {
        $this->modelCemetery->alias('a');
        $join = [
            [SYS_DB_PREFIX . 'cemetery_garden g', 'a.gardenID = g.id'],
            [SYS_DB_PREFIX . 'cemetery_area r', 'a.areaID = r.id'],
            [SYS_DB_PREFIX . 'cemetery_type t', 'a.typeID = t.id'],
            [SYS_DB_PREFIX . 'cemetery_style s', 'a.styleID = s.id'],
              ];
         $this->modelCemetery->join = $join;
       
        $where['a.' . DATA_STATUS_NAME] = ['neq', DATA_DELETE];

        return $this->modelCemetery->getList($where, $field, $order, $paginate);
    }

    public function getWhere($data = []) {

        $where = [];
         !empty($data['gid']) && $where['a.gardenID'] = $data['gid'];

        !empty($data['area']) && $where['a.areaID'] = $data['area'];
        
        if (!empty($data['search_data'])) {
             $where['a.name|monumename'] = ['like', '%'.$data['search_data'].'%'];
        }

        return $where;
    }

    public function getBury($where = [], $field = true, $order = '') {
        $where[DATA_STATUS_NAME] = ['neq', DATA_DELETE];

        $list = $this->modelBury->getList($where, $field, $order, false);

        $name = '';

        foreach ($list as $k => $v) {
            $name .= $v['cid'] . ',';
        }

        if (!empty($name)) {
            $name = rtrim($name, ",");
        } else {
            $name = '';
        }
        return $name;
    }
    
     public function get_cemetery_usestatus_tj($where = [], $field = 'a.usestatus, count(a.id) as sl')
    {
        $this->modelCemetery->alias('a');
          $this->modelCemetery->group('a.usestatus');
        $where['a.' . DATA_STATUS_NAME] = ['neq', DATA_DELETE];
        return $this->modelCemetery->getList($where, $field,null,FALSE);
        
    }

}

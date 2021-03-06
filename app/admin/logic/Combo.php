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
class Combo extends AdminBase {

    /**
     * 获取墓园类型列表
     */
    public function getComboList($where = [], $field = '*', $order = '', $paginate = DB_LIST_ROWS) {

        $where[DATA_STATUS_NAME] = ['neq', DATA_DELETE];

        return $this->modelCombo->getList($where, $field, $order, $paginate);
    }

    /**
     * 墓园类型信息添加
     */
    public function ComboAdd($data = []) {
        $validate_result = $this->validateCombo->scene('add')->check($data);
        if (!$validate_result) {
            $result = array("code" => 1, "msg" => $this->validateCombo->getError());
            return $result;
        }
        $result = $this->modelCombo->setInfo($data);
        $result && action_log('新增', '新增服务套餐信息，name：' . $data['name']);
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
    public function ComboEdit($data = []) {
        $validate_result = $this->validateCombo->scene('edit')->check($data);

        if (!$validate_result) {
            $result = array("code" => 1, "msg" => $this->validateCombo->getError());
            return $result;
        }
        $result = $this->modelCombo->setInfo($data);
        $result && action_log('编辑', '编辑服务套餐信息，name：' . $data['name']);
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
    public function getComboInfo($where = [], $field = true) {

        return $this->modelCombo->getInfo($where, $field);
    }

    /**
     * 墓园类型删除
     */
    public function ComboDel($where = []) {

        $result = $this->modelCombo->deleteInfo($where);

        $result && action_log('删除', '服务信息删除' . '，where：' . http_build_query($where));

        return $result ? [RESULT_SUCCESS, '删除成功'] : [RESULT_ERROR, $this->modelCombo->getError()];
    }

    /**
     * 获取列表搜索条件
     */
    public function getWhere($data = []) {

        $where = [];

        !empty($data['search_data']) && $where['servicename'] = ['like', '%' . $data['search_data'] . '%'];

        return $where;
    }

    public function getComboStat($where = [], $stat_type = 'count', $field = 'id') {

        return $this->modelCombo->stat($where, $stat_type, $field);
    }

}

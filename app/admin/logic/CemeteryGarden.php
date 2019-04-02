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
class CemeteryGarden extends AdminBase {

    /**
     * 获取墓园类型列表
     */
    public function getCemeteryGardenList($where = [], $field = true, $order = '', $paginate = DB_LIST_ROWS) {

        return $this->modelCemeteryGarden->getList($where, $field, $order, $paginate);
    }

    /**
     * 墓园类型信息添加
     */
    public function CemeteryGardenAdd($data = []) {
        $validate_result = $this->validateCemeteryGarden->scene('add')->check($data);
        if (!$validate_result) {
            $result = array("code" => 1, "msg" => $this->validateCemeteryGarden->getError());
            return $result;
        }
        $result = $this->modelCemeteryGarden->setInfo($data);
        $result && action_log('新增', '新增墓园类型，name：' . $data['name']);
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
    public function CemeteryGardenEdit($data = []) {

        $validate_result = $this->validateCemeteryGarden->scene('edit')->check($data);

        if (!$validate_result) {
            $result = array("code" => 1, "msg" => $this->validateCemeteryGarden->getError());
            return $result;
        }
        $result = $this->modelCemeteryGarden->setInfo($data);
        $result && action_log('编辑', '编辑墓园类型，name：' . $data['name']);
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
    public function getCemeteryGardenInfo($where = [], $field = true) {

        return $this->modelCemeteryGarden->getInfo($where, $field);
    }

    /**
     * 墓园类型删除
     */
    public function CemeteryGardenDel($where = []) {

        $result = $this->modelCemeteryGarden->deleteInfo($where);

        $result && action_log('删除', '墓园类型删除' . '，where：' . http_build_query($where));

        return $result ? [RESULT_SUCCESS, '删除成功'] : [RESULT_ERROR, $this->modelBlogroll->getError()];
    }

    /**
     * 获取列表搜索条件
     */
    public function getWhere($data = []) {

        $where = [];

        !empty($data['search_data']) && $where['name'] = ['like', '%' . $data['search_data'] . '%'];

        return $where;
    }

}

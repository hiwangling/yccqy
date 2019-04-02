<?php

namespace app\admin\logic;

/**
 * 墓穴样式逻辑
 */
class CemeteryStyle extends AdminBase {

    /**
     * 获取墓穴样式列表
     */
    public function getCemeteryStyleList($where = [], $field = true, $order = '', $paginate = DB_LIST_ROWS) {

        return $this->modelCemeteryStyle->getList($where, $field, $order, $paginate);
    }

    /**
     * 墓穴样式信息添加
     */
    public function CemeteryStyleAdd($data = []) {
        $validate_result = $this->validateCemeteryStyle->scene('add')->check($data);
        if (!$validate_result) {
            $result = array("code" => 1, "msg" => $this->validateCemeteryStyle->getError());
            return $result;
        }
        $result = $this->modelCemeteryStyle->setInfo($data);
        $result && action_log('新增', '新增墓穴样式，name：' . $data['name']);
        if ($result != FALSE) {
            $result = array("code" => 0, "msg" => "success");
        } else {
            $result = array("code" => 1, "msg" => "error");
        }
        return $result;
    }

    /**
     * 墓穴样式信息编辑
     */
    public function CemeteryStyleEdit($data = []) {

        $validate_result = $this->validateCemeteryStyle->scene('edit')->check($data);

        if (!$validate_result) {
            $result = array("code" => 1, "msg" => $this->validateCemeteryStyle->getError());
            return $result;
        }
        $result = $this->modelCemeteryStyle->setInfo($data);
        $result && action_log('编辑', '编辑墓穴样式，name：' . $data['name']);
        if ($result != FALSE) {
            $result = array("code" => 0, "msg" => "success");
        } else {
            $result = array("code" => 1, "msg" => "error");
        }
        return $result;
    }

    /**
     * 获取墓穴样式信息
     */
    public function getCemeteryStyleInfo($where = [], $field = true) {

        return $this->modelCemeteryStyle->getInfo($where, $field);
    }

    /**
     * 墓穴样式删除
     */
    public function CemeteryStyleDel($where = []) {

        $result = $this->modelCemeteryStyle->deleteInfo($where);

        $result && action_log('删除', '墓穴样式删除' . '，where：' . http_build_query($where));

        return $result ? [RESULT_SUCCESS, '删除成功'] : [RESULT_ERROR, $this->modelCemeteryStyle->getError()];
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

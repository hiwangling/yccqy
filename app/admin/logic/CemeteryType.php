<?php

namespace app\admin\logic;

/**
 * 墓位类型逻辑
 */
class CemeteryType extends AdminBase {

    /**
     * 获取墓位类型列表
     */
    public function getCemeteryTypeList($where = [], $field = true, $order = '', $paginate = DB_LIST_ROWS) {

        return $this->modelCemeteryType->getList($where, $field, $order, $paginate);
    }

    /**
     * 墓位类型信息添加
     */
    public function CemeteryTypeAdd($data = []) {
        $validate_result = $this->validateCemeteryType->scene('add')->check($data);
        if (!$validate_result) {
            $result = array("code" => 1, "msg" => $this->validateCemeteryType->getError());
            return $result;
        }
        $result = $this->modelCemeteryType->setInfo($data);
        $result && action_log('新增', '新增墓位类型，name：' . $data['name']);
        if ($result != FALSE) {
            $result = array("code" => 0, "msg" => "success");
        } else {
            $result = array("code" => 1, "msg" => "error");
        }
        return $result;
    }

    /**
     * 墓位类型信息编辑
     */
    public function CemeteryTypeEdit($data = []) {

        $validate_result = $this->validateCemeteryType->scene('edit')->check($data);

        if (!$validate_result) {
            $result = array("code" => 1, "msg" => $this->validateCemeteryType->getError());
            return $result;
        }
        $result = $this->modelCemeteryType->setInfo($data);
        $result && action_log('编辑', '编辑墓位类型，name：' . $data['name']);
        if ($result != FALSE) {
            $result = array("code" => 0, "msg" => "success");
        } else {
            $result = array("code" => 1, "msg" => "error");
        }
        return $result;
    }

    /**
     * 获取墓位类型信息
     */
    public function getCemeteryTypeInfo($where = [], $field = true) {

        return $this->modelCemeteryType->getInfo($where, $field);
    }

    /**
     * 墓位类型删除
     */
    public function CemeteryTypeDel($where = []) {

        $result = $this->modelCemeteryType->deleteInfo($where);

        $result && action_log('删除', '墓位类型删除' . '，where：' . http_build_query($where));

        return $result ? [RESULT_SUCCESS, '删除成功'] : [RESULT_ERROR, $this->modelCemeteryType->getError()];
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

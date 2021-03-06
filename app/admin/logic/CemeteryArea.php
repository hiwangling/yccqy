<?php

namespace app\admin\logic;

/**
 * 墓区类型逻辑
 */
class CemeteryArea extends AdminBase {

    /**
     * 获取墓区类型列表
     */
    public function getCemeteryAreaList($where = [], $field = 'a.*,g.name as garden_name', $order = '', $paginate = DB_LIST_ROWS) {

        $this->modelCemeteryArea->alias('a');
        $join = [
                    [SYS_DB_PREFIX . 'cemetery_garden g', 'a.gardenID = g.id']
                ]; 
        $this->modelCemeteryArea->join = $join;
        
        return $this->modelCemeteryArea->getList($where, $field, $order, $paginate);
    }

    /**
     * 墓区类型信息添加
     */
    public function CemeteryAreaAdd($data = []) {
        $validate_result = $this->validateCemeteryArea->scene('add')->check($data);
        if (!$validate_result) {
            $result = array("code" => 1, "msg" => $this->validateCemeteryArea->getError());
            return $result;
        }
        $result = $this->modelCemeteryArea->setInfo($data);
        $result && action_log('新增', '新增墓区类型，name：' . $data['name']);
        if ($result != FALSE) {
            $result = array("code" => 0, "msg" => "success");
        } else {
            $result = array("code" => 1, "msg" => "error");
        }
        return $result;
    }

    /**
     * 墓区类型信息编辑
     */
    public function CemeteryAreaEdit($data = []) {

        $validate_result = $this->validateCemeteryArea->scene('edit')->check($data);

        if (!$validate_result) {
            $result = array("code" => 1, "msg" => $this->validateCemeteryArea->getError());
            return $result;
        }
        $result = $this->modelCemeteryArea->setInfo($data);
        $result && action_log('编辑', '编辑墓区类型，name：' . $data['name']);
        if ($result != FALSE) {
            $result = array("code" => 0, "msg" => "success");
        } else {
            $result = array("code" => 1, "msg" => "error");
        }
        return $result;
    }

    /**
     * 获取墓区类型信息
     */
    public function getCemeteryAreaInfo($where = [], $field = true) {

        return $this->modelCemeteryArea->getInfo($where, $field);
    }

    /**
     * 墓区类型删除
     */
    public function CemeteryAreaDel($where = []) {

        $result = $this->modelCemeteryArea->deleteInfo($where);

        $result && action_log('删除', '墓区类型删除' . '，where：' . http_build_query($where));

        return $result ? [RESULT_SUCCESS, '删除成功'] : [RESULT_ERROR, $this->modelCemeteryArea->getError()];
    }

    /**
     * 获取列表搜索条件
     */
    public function getWhere($data = []) {

        $where = [];

        !empty($data['search_data']) && $where['a.name'] = ['like', '%' . $data['search_data'] . '%'];

        return $where;
    }

}

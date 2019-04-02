<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

namespace app\admin\logic;

/**
 * Description of Savearea
 *
 * @author Administrator
 */
class Savearea extends AdminBase {

    /**
     * 获取墓园类型列表
     */
    public function getSaveareaList($where = [], $field = '*', $order = '', $paginate = DB_LIST_ROWS) {

        $where[DATA_STATUS_NAME] = ['neq', DATA_DELETE];

        return $this->modelSavearea->getList($where, $field, $order, $paginate);
    }

    /**
     * 墓园类型信息添加
     */
    public function SaveareaAdd($data = []) {
        $validate_result = $this->validateSavearea->scene('add')->check($data);
        if (!$validate_result) {
            $result = array("code" => 1, "msg" => $this->validateSavearea->getError());
            return $result;
        }
        $result = $this->modelSavearea->setInfo($data);
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
    public function SaveareaEdit($data = []) {
        $validate_result = $this->validateSavearea->scene('edit')->check($data);

        if (!$validate_result) {
            $result = array("code" => 1, "msg" => $this->validateSavearea->getError());
            return $result;
        }
        $result = $this->modelSavearea->setInfo($data);
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
    public function getSaveareaInfo($where = [], $field = true) {

        return $this->modelSavearea->getInfo($where, $field);
    }

    /**
     * 墓园类型删除
     */
    public function SaveareaDel($where = []) {

         
        $result = $this->modelSavearea->deleteInfo($where);

        $result && action_log('删除', '服务信息删除' . '，where：' . http_build_query($where));

        return $result ? [RESULT_SUCCESS, '删除成功'] : [RESULT_ERROR, $this->modelSavearea->getError()];
    }

    /**
     * 获取列表搜索条件
     */
    public function getWhere($data = []) {

        $where = [];

        !empty($data['search_data']) && $where['name'] = ['like', '%' . $data['search_data'] . '%'];

        return $where;
    }

    public function getSaveareaStat($where = [], $stat_type = 'count', $field = 'id') {

        return $this->modelSavearea->stat($where, $stat_type, $field);
    }

}

<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

namespace app\admin\logic;

/**
 * Description of Invoice
 *
 * @author Administrator
 */
class Invoice extends AdminBase {

    /**
     * 获取墓园类型列表
     */
    public function getInvoiceList($where = [], $field = '*', $order = '', $paginate = DB_LIST_ROWS) {

        $where[DATA_STATUS_NAME] = ['neq', DATA_DELETE];

        return $this->modelInvoice->getList($where, $field, $order, $paginate);
    }

    /**
     * 墓园类型信息添加
     */
    public function InvoiceAdd($data = []) {
        $validate_result = $this->validateInvoice->scene('add')->check($data);
        if (!$validate_result) {
            $result = array("code" => 1, "msg" => $this->validateInvoice->getError());
            return $result;
        }
        $data["currno"]=$data["beginno"];
        $result = $this->modelInvoice->setInfo($data);
        $result && action_log('新增', '新增发票号码，name：' . $data['beginno']);
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
    public function InvoiceEdit($data = []) {
        $validate_result = $this->validateInvoice->scene('edit')->check($data);

        if (!$validate_result) {
            $result = array("code" => 1, "msg" => $this->validateInvoice->getError());
            return $result;
        }
        $result = $this->modelInvoice->setInfo($data);
        $result && action_log('编辑', '编辑发票信息，发票号码， ：' . $data['beginno']);
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
    public function getInvoiceInfo($where = [], $field = true) {

        return $this->modelInvoice->getInfo($where, $field);
    }

    /**
     * 墓园类型删除
     */
    public function InvoiceDel($where = []) {

        $result = $this->modelInvoice->deleteInfo($where);

        $result && action_log('删除', '收费发票删除' . '，where：' . http_build_query($where));

        return $result ? [RESULT_SUCCESS, '删除成功'] : [RESULT_ERROR, $this->modelInvoice->getError()];
    }

    /**
     * 获取列表搜索条件
     */
    public function getWhere($data = []) {

        $where = [];

        !empty($data['search_data']) && $where['beginno'] = ['like', '%' . $data['search_data'] . '%'];

        return $where;
    }

    public function getInvoiceStat($where = [], $stat_type = 'count', $field = 'id') {

        return $this->modelInvoice->stat($where, $stat_type, $field);
    }

}

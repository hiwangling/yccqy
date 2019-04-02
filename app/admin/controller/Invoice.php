<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

namespace app\admin\controller;

/**
 * Description of Invoice
 *
 * @author Administrator
 */
class Invoice extends AdminBase {

    /**
     * 服务信息列表
     */
    public function InvoiceList() {
        $where = $this->logicInvoice->getWhere($this->param);
        $this->assign('list', $this->logicInvoice->getInvoiceList($where, '*', 'beginno asc', 10));
        return $this->fetch('Invoice_list');
    }

    ////增加显示界面
    public function InvoiceAdd_show_ajax() {
        $this->view->engine->layout(false);
        $infohtml = $this->fetch("Invoice_add");
        $result = array("code" => 0, "msg" => "", "data" => $infohtml);
        exit(json_encode($result));
    }

    /////增加处理页面
    public function InvoiceAdd_ajax_submit() {
        $result = $this->logicInvoice->InvoiceAdd($this->param);
        exit(json_encode($result));
    }
    
    public function InvoiceEdit_ajax_show() {
        if (empty($this->param['cid'])) {
            $result = array("code" => 1, "msg" => "参数错误");
            exit(json_encode($result));
        }
        $info = $this->logicInvoice->getInvoiceInfo(['id' => $this->param['cid']]);
        $this->assign('info', $info);
        $this->view->engine->layout(false);
        $infohtml = $this->fetch("Invoice_edit");
        $result = array("code" => 0, "msg" => "", "data" => $infohtml);
        exit(json_encode($result));
    }

    public function Invoiceedit_ajax_submit() {
        if (empty($this->param['id']) || $this->param['id'] == "0") {
            $result = array("code" => 1, "msg" => "参数错误");
            exit(json_encode($result));
        }
        $result = $this->logicInvoice->InvoiceEdit($this->param);
        exit(json_encode($result));
    }

    
    /**
     * 服务信息删除
     */
    public function InvoiceDel($id = 0) {

        $this->jump($this->logicInvoice->InvoiceDel(['id' => $id]));
    }
    
    

}

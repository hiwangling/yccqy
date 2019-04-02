<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

namespace app\admin\logic;

/**
 * Description of Cancel
 *
 * @author Administrator
 */
class Cancel extends AdminBase {

    public function getCancelList($where = [], $field = true, $order = 'create_time desc', $paginate = DB_LIST_ROWS) {
        $this->modelCancel->alias('a');

        $join = [
            [SYS_DB_PREFIX . 'cemetery c', 'a.cid = c.id'],
            [SYS_DB_PREFIX . 'member m', 'm.id = a.manager'],
            [SYS_DB_PREFIX . 'sell s', 's.id = a.tid'],
        ];
        $where['a.' . DATA_STATUS_NAME] = ['neq', DATA_DELETE];
        $this->modelCancel->join = $join;
        return $this->modelCancel->getList($where, $field, $order, $paginate);
    }

    public function get_Cancel_info($where, $field = true) {
        $where[DATA_STATUS_NAME] = ['neq', DATA_DELETE];
        $Bury = $this->modelCancel->getInfo($where, $field);
        return $Bury;
    }

    public function CancelDel($Cancel) {
        $this->modelSell->deleteInfo(['id' => $Cancel['tid']]);
        $this->modelFinance->deleteInfo(['tid' => $Cancel['tid']]);
        $result = $this->modelCancel->deleteInfo(["id" => $Cancel["id"]]);
        if ($result != FALSE) {
            action_log('删除', '退墓信息删除' . '，where：' . http_build_query(['id' => $Cancel["id"]]));
            $result = array("code" => 0, "msg" => "success");
        } else {
            $result = array("code" => 1, "msg" => $this->modelCancel->getError());
        }
        return $result;
    }

    public function Cancel_add($data = []) {
        $cancelData = array(
            'orderNO' => $data['orderNO'],
            'tid' => $data['tid'],
            'oldsellid' => $data['sid'],
            'cid' => $data['cid'],
            'returndesc' => $data['returndesc'],
            'manager' => $data['manager'],
            'isok' => 0,
            'phone' => $data['phone'],
            'buyer' => $data['buyer'],
            'billprice' => $data['billprice'],
            'readprice' => $data['readprice'],
            'operater' => $data['seller'],
            'operatername' => $data['sellname'],
            'status' => 1
        );

        $pid = $this->modelCancel->addInfo($cancelData);
    }

    public function Cancel_submit($data = [], $chitem = [], $Serviceinfoitem = [], $financetype = 6) {
        $data['orderNO'] = get_cw_OrderNo();
        $data['financetype'] = $financetype; /////购墓操作
        $data['orderstatus'] = 1; //默认付款操作
        $data["orderbegin"] = date("Y-m-d");
        $data["orderend"] = date("Y-m-d");
        $sellId = $this->logicSell->addSell($data); //$this->modelSell->addInfo($sellData);
        if ($sellId != FALSE) {
            action_log('新增加', '增加退款记录表：' . $data['buyer']);
            $returnprice = $this->logicSell->sell_save_selldate($sellId, $data, $chitem, $Serviceinfoitem, FALSE);
            $data["readprice"] = $returnprice; ///实际收的金额
            $data["tid"] = $sellId;
            $this->Cancel_add($data);
            $result = array("code" => 0, "msg" => "success");
        } else {
            $result = array("code" => 1, "msg" => "error");
        }
        return $result;
    }

    public function getWhere($data = []) {

        $where = [];
        if ($data['resutlstatus'] != "-1") {
            $where['isok'] = $data['resutlstatus'];
        }
        !empty($data['search_data']) && $where['a.buyer|s.orderNO'] = ['like', '%' . $data['search_data'] . '%'];

        if (!empty($data['sbbegin'])) {
            $where['a.create_time'] = array("EGT", strtotime($data['sbbegin']));
        }
        if (!empty($data['sbend'])) {
            $where['a.create_time'] = array("ELT", strtotime($data['sbend']));
        }
        $where['a.' . DATA_STATUS_NAME] = ['neq', DATA_DELETE];
        $where['a.manager'] = MEMBER_ID;
        return $where;
    }

    public function Sellcancel_cl_ajax($data = []) {
        $canceldate = array(
            'id' => $data['id'],
            'isok' => $data['type'],
            'vcnote' => $data['vcnote'],
            'dobegindate' => time()
        );
        $pid = $this->modelCancel->setInfo($canceldate);

        return $pid;
    }

    public function cancel_update_newsellid($canceldate) {
        /////插入财务主表

        $pid = $this->modelCancel->setInfo($canceldate);
        return $pid;
        ///////
    }

    public function cancel_pay($data = [], $paystatus) {
        $where["id"] = $data["id"];
        $result = $this->modelSell->updateInfo_zhj($where, ["orderstatus" => $paystatus]);

        if ($result != FALSE) {
            $sellFinanceData["paystatus"] = $paystatus;
            $sellFinanceData["payerdate"] = TIME_NOW;
            $fwhere["tid"] = $data["id"];
            $this->modelFinance->updateInfo_zhj($fwhere, $sellFinanceData);
            $Cemetery = array(
                'usestatus' => 1,
                'expiredate' => null,
                'monumenhtml' => "",
                'monumenhtml_b' => "",
                'monumename' => "",
            );
            $this->modelCemetery->updateInfo_zhj(['id' => $data['cid']], $Cemetery);
            $this->logicSell->canacel_update_isstory($data['cid'], $data["id"]);
            $isupdate = 1;
            action_log('付款', '殡葬服务付款' . '，where：' . http_build_query(['id' => $data["id"]]));
            $result = array("code" => 0, "msg" => "success", "isupdate" => $isupdate, "cid" => $data['cid']);
        } else {
            $result = array("code" => 1, "msg" => $this->modelSell->getError());
        }
        return $result;
    }

    

}

<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

namespace app\admin\logic;

/**
 * Description of Monumen
 *
 * @author Administrator
 */
class Monumen extends AdminBase {

    /**
     * 获取墓园类型列表
     */
    public function getMonumenList($where = [], $field = true, $order = '', $paginate = DB_LIST_ROWS) {
        $this->modelMonumen->alias('a');
        $join = [
            [
                SYS_DB_PREFIX . 'sell s', 'a.tid = s.id', 'left'],
        ];
        $this->modelMonumen->join = $join;
        $where['a.' . DATA_STATUS_NAME] = ['neq', DATA_DELETE];
        return $this->modelMonumen->getList($where, $field, $order, $paginate);
    }

    public function getMonumenInfo($where = [], $field = true) {

        return $this->modelMonumen->getInfo($where, $field);
    }

    /**
     * 墓园类型删除
     */
    public function MonumenDel($where = []) {

        $result = $this->modelMonumen->deleteInfo($where);

        $result && action_log('删除', '刻碑信息删除' . '，where：' . http_build_query($where));

        return $result ? [RESULT_SUCCESS, '删除成功'] : [RESULT_ERROR, $this->modelBlogroll->getError()];
    }

    public function Monumen_add_submit($data = [], $chargeitem = [], $Serviceinfoitem = [], $financetype = 8) {
        // $validate_result = $this->validateMonumen->scene('edit')->check($data);
        // if (!$validate_result) {
        //     $result = array("code" => 1, "msg" => $this->validateMonumen->getError());
        //     return $result;
        // }
        $data['orderNO'] = get_cw_OrderNo();
        $data['financetype'] = $financetype; /////购墓操作
        $data['orderstatus'] = 1; //默认付款操作
        $data["orderbegin"] = date("Y-m-d");
        $data["orderend"] = date("Y-m-d");
       
        $data['paytype'] = 1;
        $data['payvarchar'] = $this->logicSell->get_pay_typename($data);

        $sellId = $this->logicSell->addSell($data);
        if ($sellId != FALSE) {
            ///增加财务信息表
            $realprice = $this->logicSell->sell_save_selldate($sellId, $data, $chargeitem, $Serviceinfoitem, false);
            $this->addMonumen($data, $sellId, $realprice);
            action_log('新增加', '增加碑文信息，购买人：' . $data['buyer']);
            $result = array("code" => 0, "msg" => "success");
        } else {
            $result = array("code" => 1, "msg" => "error");
        }
        return $result;
    }

    public function Monumen_edit_submit($data = [], $chargeitem = [], $Serviceinfoitem = []) {
        // $validate_result = $this->validateMonumen->scene('edit')->check($data);
        // if (!$validate_result) {
        //     $result = array("code" => 1, "msg" => $this->validateMonumen->getError());
        //     return $result;
        // }
        $Monumenid= $data["id"];
        $sellinfo = $this->logicSell->getSellInfo(["id" => $data['sid']]);
        if (empty($sellinfo)) {
            $result = array("code" => 1, "msg" => "数据异常，请检查");
            return $result;
        }
        $data["id"] = $data['sid'];
        $data['paytype'] = 1;
        $data['payvarchar'] = $this->logicSell->get_pay_typename($data);
        $result = $this->logicSell->updateSell($data);
        if ($result != FALSE) {
            action_log('修改', '增加碑文信息：订单号：' . $sellinfo["orderNO"]);
            $this->logicSell->Sell_Del_other_all(["tid" => $sellinfo["id"]]);  ///删除掉财务数据和其他数据，在增加///
            $data["orderNO"] = $sellinfo["orderNO"];
            $data['financetype'] = $sellinfo["financetype"]; /////购墓操作
            $data['orderstatus'] = $sellinfo["orderstatus"]; //默认付款操作
             
            $realprice = $this->logicSell->sell_save_selldate($sellinfo["id"], $data, $chargeitem, $Serviceinfoitem, FALSE);
            $this->update_Monumen($data, $Monumenid,$realprice);
            $result = array("code" => 0, "msg" => "success");
        } else {

            $result = array("code" => 1, "msg" => "error");
        }
        return $result;
    }

    public function addMonumen($data = [], $sellId, $realprice) {
        $MonumenDataTwo = array(
            'tid' => $sellId,
            'orderNO' => $data["orderNO"],
            'cid' => $data['cid'],
            'buyer' => $data['buyer'],
            'monumenttype' => $data['monumenttype'],
            'monumenstyle' => $data['monumenstyle'],
            'buryname' => isset($data['buryname']) ? $data['buryname'] : '',
            'phone' => $data['phone'],
            'monumenprice' => $realprice,
            'monumendate' => $data['monumendate'],
            'vcdesc' => isset($data['vcdesc']) ? $data['vcdesc'] : '',
            'seller' => $data["seller"],
            'sellname' => $data["sellname"],
            'status' => 1
        );
        $this->modelMonumen->addInfo($MonumenDataTwo);
    }

    public function update_Monumen($data = [], $Id, $realprice) {
        $MonumenDataTwo = array(
            'id' => $Id,
            'buryname' => isset($data['buryname']) ? $data['buryname'] : '',
            'buyer' => $data['buyer'],
            'monumenttype' => $data['monumenttype'],
            'monumenstyle' => $data['monumenstyle'],
            'phone' => $data['phone'],
            'monumendate' => $data['monumendate'],
            'monumenprice' => $realprice,
            'vcdesc' => isset($data['vcdesc']) ? $data['vcdesc'] : ''
        );
        $this->modelMonumen->setInfo($MonumenDataTwo);
    }

    public function Monumen_Del($Monumeninfo = []) {
        
        $this->logicSell->Sellinfo_del($Monumeninfo["tid"]);
        $result = $this->modelMonumen->deleteInfo(["id" => $Monumeninfo["id"]]);
        if ($result != FALSE) {
            action_log('删除', '刻碑文信息删除' . '，where：' . http_build_query(['id' => $Monumeninfo['id']]));
            $result = array("code" => 0, "msg" => "success");
        } else {
            $result = array("code" => 1, "msg" => $this->modelMonumen->getError());
        }
        return $result;
    }

}

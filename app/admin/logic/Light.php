<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

namespace app\admin\logic;

/**
 * Description of Light
 *
 * @author Administrator
 */
class Light extends AdminBase {

    /**
     * 获取墓园类型列表
     */
    public function getLightList($where = [], $field = true, $order = '', $paginate = DB_LIST_ROWS) {

         $this->modelLight->alias('a');
        $join = [
            [ SYS_DB_PREFIX . 'sell s', 'a.tid = s.id', 'left'],
            [SYS_DB_PREFIX . 'lightplan p', 'a.lightplanid = p.id', 'left'],
            
        ];
        $this->modelLight->join = $join;
        $where['a.' . DATA_STATUS_NAME] = ['neq', DATA_DELETE];
 
        return $this->modelLight->getList($where, $field, $order, $paginate);
    }

    public function getLightInfo($where = [], $field = true) {

        return $this->modelLight->getInfo($where, $field);
    }
    


    /**
     * 墓园类型删除
     */
    public function LightDel($where = []) {

        $result = $this->modelLight->deleteInfo($where);

        $result && action_log('删除', '点灯信息删除' . '，where：' . http_build_query($where));

        return $result ? [RESULT_SUCCESS, '删除成功'] : [RESULT_ERROR, $this->modelBlogroll->getError()];
    }

    public function Light_add_submit($data = []) {
        $validate_result = $this->validateLight->scene('edit')->check($data);
        if (!$validate_result) {
            $result = array("code" => 1, "msg" => $this->validateLight->getError());
            return $result;
        }
        $data['orderNO'] = get_cw_OrderNo();
        $data['financetype'] = 7; /////购墓操作
        $data['orderstatus'] = 1; //默认付款操作
        $data["orderbegin"] = date("Y-m-d");
        $data["orderend"] = date("Y-m-d");
        $data["isvoice"] = 0;
        if ($data["voiceno"] != "")
            $data["isvoice"] = 1;
          $data['paytype'] = 1;
        $data["realprice"] = $data["amount"] * $data["price"];
         $data['payvarchar'] = $this->logicSell->get_pay_typename($data);

        $sellId = $this->logicSell->addSell($data);
        if ($sellId != FALSE) {
            ///增加财务信息表
            $chargeitem = $this->logicChargeitem->getChargeitemInfo(['id' => 10], "id,name");
            $title = $chargeitem["name"];
            $titleid = $chargeitem["id"];
            $this->logicFinance->Finance($data["orderNO"], $data["cid"], $sellId, $data["paytype"], $data["financetype"], $data["orderstatus"], $data["realprice"], $data["realprice"], $data["amount"], $data["price"], $title, $titleid, $data["isvoice"]);
            $this->addLight($data, $sellId);
           //$this->logicLinkman->update_linkname($data["buyer"], $data);
            action_log('新增加', '增加点灯信息，预定人：' . $data['buyer']);

            $result = array("code" => 0, "msg" => "success");
        } else {
            $result = array("code" => 1, "msg" => "error");
        }
        return $result;
    }

    public function Light_edit_submit($data = []) {
        $validate_result = $this->validateLight->scene('edit')->check($data);
        if (!$validate_result) {
            $result = array("code" => 1, "msg" => $this->validateLight->getError());
            return $result;
        }
        $sellinfo = $this->logicSell->getSellInfo(["id" => $data['sid']]);
        if (empty($sellinfo)) {
            $result = array("code" => 1, "msg" => "数据异常，请检查");
            return $result;
        }
        $data["id"] = $data['sid'];
        $data["isvoice"] = 0;
        if ($data["voiceno"] != "")
            $data["isvoice"] = 1;
          $data['paytype'] = 1;
        $data['payvarchar'] = $this->logicSell->get_pay_typename($data);
        $result = $this->logicSell->updateSell($data);
        if ($result != FALSE) {
            action_log('修改', '修改点灯信息购买人：订单号：' . $sellinfo["orderNO"]);
            $data["realprice"] = $data["amount"] * $data["price"];
            $where["tid"] = $data["sid"];
            $fancy["sellprice"] = $data['realprice'];
            $fancy["realprice"] = $data['realprice'];
            $fancy["amount"] = $data['amount'];
            $fancy["unitprice"] = $data['price'];
            $this->modelFinance->updateInfo($where, $fancy);
           // $this->logicLinkman->update_linkname($data["buyer"], $data);
            $this->update_Light($data, $data['lid']);
            $result = array("code" => 0, "msg" => "success");
        } else {

            $result = array("code" => 1, "msg" => "error");
        }
        return $result;
    }

    public function addLight($data = [], $sellId) {
        $LightDataTwo = array(
            'tid' => $sellId,
            'orderNO' => $data["orderNO"],
            'cid' => $data['cid'],
            
            'buyer' => $data['buyer'],
            'lightplanid' => $data['lightplanid'],
            'phone' => $data['phone'],
            'isok' => 1,
            'amount' => $data['amount'],
            'price' => $data['price'],
            'voiceno' => $data['voiceno'],
            'vcnote' => $data['vcnote'],
            'status' => 1
        );
        $this->modelLight->addInfo($LightDataTwo);
    }

    public function update_Light($data = [], $Id) {
        $LightDataTwo = array(
            'id' => $Id,
            'buyer' => $data['buyer'],
            'phone' => $data['phone'],
            'amount' => $data['amount'],
            'price' => $data['price'],
            'voiceno' => $data['voiceno'],
            'vcnote' => $data['vcnote']
        );
        $this->modelLight->setInfo($LightDataTwo);
    }

    public function Light_Del($data = []) {
       
        $this->logicSell->Sellinfo_del($data["tid"]);
        $result = $this->modelLight->deleteInfo(["id" => $data["id"]]);
        if ($result != FALSE) {
            action_log('删除', '点灯信息删除' . '，where：' . http_build_query(['id' => $data['id']]));
            $result = array("code" => 0, "msg" => "success");
        } else {
            $result = array("code" => 1, "msg" => $this->modelLight->getError());
        }
        return $result;
    }

}

<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

namespace app\admin\logic;

/**
 * Description of Sellchang
 *
 * @author Administrator
 */
class Sellchang extends AdminBase {

    public function getSellchangList($where = [], $field = true, $order = 'id desc', $paginate = DB_LIST_ROWS) {
        return $this->modelSellchang->getList($where, $field, $order, $paginate);
    }

    public function getSellchangInfo($where = [], $field = true) {

        return $this->modelSellchang->getInfo($where, $field);
    }

    public function SellchangDel($where = [], $field = true) {
        $result = $this->modelSellchang->deleteInfo($where, true);
        $result && action_log('删除', '删除墓穴变更信息，' . '，where：' . http_build_query($where));
        return $result;
    }

    public function getWhere($data = []) {

        $where = [];

        !empty($data['search_data']) && $where['name'] = ['like', '%' . $data['search_data'] . '%'];

        return $where;
    }

    public function addSellchang($data = [], $sellid) {
        
        $info = array(
            'buyer' => $data['buyer'],
            'sellid' => $sellid,
            'oldcid' => $data['oldcid'],
            'phone' => $data['phone'],
            'oldcname' => !empty($data['oldcname']) ? $data['oldcname'] : '',
            'newcid' => $data['newcid'],
            'newcname' => isset($data['newcname']) ? $data['newcname'] : '',
            'oldsid' => $data["oldsid"],
            'operater' => $data["seller"],
             'operater' => $data["seller"],
            'movetime' => !empty($data['movetime']) ? $data['movetime'] :  date("Y-m-d"),
            'status' => 1
        );
        return $this->modelSellchang->setInfo($info);
    }

    public function Chang_submit($data = [], $chargeitem = [], $Serviceinfoitem = [], $financetype = 5) {
        $validate_result = $this->validatesellchang->scene('edit')->check($data);
        if (!$validate_result) {
            $result = array("code" => 1, "msg" => $this->validatesellchang->getError());
            return $result;
        }
        $data['orderNO'] = get_cw_OrderNo();
        $data['financetype'] = $financetype; /////购墓操作
        $data['orderstatus'] = 2; //默认付款操作
        $data["orderbegin"] = date("Y-m-d");
        $data["orderend"] = date("Y-m-d");
        $data["cid"] = $data["newcid"];
        $sellId = $this->logicSell->addSell($data);  //$this->modelSell->addInfo($sellData);
        if ($sellId != FALSE) {
            action_log('新增加', '增加变更信息购买人：' . $data['buyer']);
            $this->logicSell->sell_save_selldate($sellId, $data, $chargeitem, $Serviceinfoitem,FALSE);
            $this->addSellchang($data, $sellId);
            $this->logicLinkman->update_linkname($data["buyer"], $data);
            $this->chang_all_info($data);
            $result = array("code" => 0, "msg" => "success");
        } else {

            $result = array("code" => 1, "msg" => "error");
        }
        return $result;
    }

    private function chang_all_info($data = []) {
        $oldcid = $data["oldcid"];
        $newid = $data["newcid"];
        // $this->modelSellchang->updateInfo(['id' => $changeinfo["id"]], [ 'isok' => 4]);
        $this->modelSell->updateInfo(['cid' => $oldcid], ['cid' => $newid]);
        $this->modellinkman->updateInfo(['cid' => $oldcid], ['cid' => $newid]);
        $this->modelBury->updateInfo(['cid' => $oldcid], ['cid' => $newid]);
        $this->modelservicebill->updateInfo(['cid' => $oldcid], ['cid' => $newid]);
        $this->modelcancel->updateInfo(['cid' => $oldcid], ['cid' => $newid]);
         $this->modellight->updateInfo(['cid' => $oldcid], ['cid' => $newid]);
        $mbinfo = $this->modelCemetery->getInfo(["id " => $oldcid], "*");
        if (!empty($mbinfo)) {
            $this->modelCemetery->updateInfo(['id' => $newid], ['expiredate' => $mbinfo["expiredate"], 'monumenhtml' => $mbinfo["monumenhtml"], 'usestatus' => $mbinfo["usestatus"]]);
            $this->modelCemetery->updateInfo(['id' => $oldcid], ['expiredate' => null, 'usestatus' => 1, 'monumenhtml' => '']);
        }
    }

}

?>

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
        $this->modelSellchang->alias('a');
        $join = [
            [SYS_DB_PREFIX . 'sell s', 'a.tid = s.id', 'left']
            
        ];
        $this->modelSellchang->join = $join;
        $where['a.' . DATA_STATUS_NAME] = ['neq', DATA_DELETE];

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
public function Sellchang_Del($data = []) {
       
        $this->logicSell->Sellinfo_del($data["tid"]);
        $result = $this->modelSellchang->deleteInfo(["id" => $data["id"]]);
        if ($result != FALSE) {
            action_log('删除', '换墓信息删除' . '，where：' . http_build_query(['id' => $data['id']]));
            $result = array("code" => 0, "msg" => "success");
        } else {
            $result = array("code" => 1, "msg" => $this->modelSellchang->getError());
        }
        return $result;
    }
    
    public function getWhere($data = []) {

        $where = [];

        !empty($data['search_data']) && $where['name'] = ['like', '%' . $data['search_data'] . '%'];

        return $where;
    }

    public function addSellchang($data = [], $sellid, $moveprice) {

        $info = array(
            'buyer' => $data['buyer'],
            'tid' => $sellid,
            'oldcid' => $data['oldcid'],
            'phone' => $data['phone'],
            'oldcname' => !empty($data['oldcname']) ? $data['oldcname'] : '',
            'newcid' => $data['newcid'],
            'newcname' => isset($data['newcname']) ? $data['newcname'] : '',
            'oldsid' => $data["oldsid"],
            'operater' => $data["seller"],
            'operater' => $data["seller"],
            'operater' => $data["seller"],
            'moveprice' => $moveprice,
            'movetime' => !empty($data['movetime']) ? $data['movetime'] : date("Y-m-d"),
            'status' => 1
        );
        return $this->modelSellchang->setInfo($info);
    }

    public function Sellchang_add_submit($data = [], $chargeitem = [], $Serviceinfoitem = [], $financetype = 5) {
        $validate_result = $this->validatesellchang->scene('edit')->check($data);
        if (!$validate_result) {
            $result = array("code" => 1, "msg" => $this->validatesellchang->getError());
            return $result;
        }
        $data['orderNO'] = get_cw_OrderNo();
        $data['financetype'] = $financetype; /////购墓操作
        $data['orderstatus'] = 1; //默认付款操作
        $data["orderbegin"] = date("Y-m-d");
        $data["orderend"] = date("Y-m-d");
        $data["cid"] = $data["newcid"];
        $data['paytype'] = 1;
        $data['payvarchar'] = $this->logicSell->get_pay_typename($data);
        $sellId = $this->logicSell->addSell($data);  //$this->modelSell->addInfo($sellData);
        if ($sellId != FALSE) {
            action_log('新增加', '增加墓穴变更信息：' . $data['buyer']);
            $price = $this->logicSell->sell_save_selldate($sellId, $data, $chargeitem, $Serviceinfoitem, FALSE);
            $this->addSellchang($data, $sellId, $price);
            // $this->logicLinkman->update_linkname($data["buyer"], $data);
            // $this->chang_all_info($data);
            $result = array("code" => 0, "msg" => "success");
        } else {

            $result = array("code" => 1, "msg" => "error");
        }
        return $result;
    }
    
   public function Sellchang_pay($tid,$oldcid,$newcid,$paystatus=2)
   {
       $where["id"] = $tid;
        $result = $this->modelSell->updateInfo_zhj($where, ["orderstatus" => $paystatus]);
        
        if ($result != FALSE) {
            $sellFinanceData["paystatus"] = $paystatus;
            $sellFinanceData["payerdate"] = TIME_NOW;
            $fwhere["tid"] =$tid;
            $this->modelFinance->updateInfo_zhj($fwhere, $sellFinanceData);
            $this->chang_all_info($oldcid,$newcid);
             $isupdate = 1;
           action_log('付款', '迁墓服务付款' . '，where：' . http_build_query(['id' => $tid]));
            $result = array("code" => 0, "msg" => "success","isupdate" => $isupdate, "cid" => $oldcid);
        } else {
            $result = array("code" => 1, "msg" => $this->modelSell->getError());
        }
        return $result;
       
   }

    private function chang_all_info($oldcid,$newid) {
        
        // $this->modelSellchang->updateInfo(['id' => $changeinfo["id"]], [ 'isok' => 4]);
        $this->modelSell->updateInfo_zhj(['cid' => $oldcid], ['cid' => $newid]);
        $this->modellinkman->updateInfo_zhj(['cid' => $oldcid], ['cid' => $newid]);
        $this->modelBury->updateInfo_zhj(['cid' => $oldcid], ['cid' => $newid]);
        $this->modelservicebill->updateInfo_zhj(['cid' => $oldcid], ['cid' => $newid]);
        $this->modelcancel->updateInfo_zhj(['cid' => $oldcid], ['cid' => $newid]);
        $this->modellight->updateInfo_zhj(['cid' => $oldcid], ['cid' => $newid]);
       $this->modelMonumen->updateInfo_zhj(['cid' => $oldcid],['cid' => $newid]);
        $mbinfo = $this->modelCemetery->getInfo(["id " => $oldcid], "*");
        if (!empty($mbinfo)) {
            $this->modelCemetery->updateInfo_zhj(['id' => $newid], ['expiredate' => $mbinfo["expiredate"], 'monumenhtml' => $mbinfo["monumenhtml"], 'monumename' => $mbinfo["monumename"], 'usestatus' => $mbinfo["usestatus"]]);
            $this->modelCemetery->updateInfo_zhj(['id' => $oldcid], ['expiredate' => null, 'usestatus' => 1, 'monumenhtml' => '','monumename'=>'']);
        }
    }

}

?>

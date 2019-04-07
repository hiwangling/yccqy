<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

namespace app\admin\logic;

/**
 * Description of Sell
 *
 * @author Administrator
 */
class Sell extends AdminBase {

    /**
     * 获取寄存列表
     */
    public function getSellList($where = [], $field = 'a.*', $order = '', $paginate = DB_LIST_ROWS) {
        $this->modelSell->alias('a');

        $join = [
            [SYS_DB_PREFIX . 'cemetery c', 'a.cid = c.id', 'left'],
            [SYS_DB_PREFIX . 'cemetery_garden y', 'c.gardenID = y.id', 'left'],
            [SYS_DB_PREFIX . 'cemetery_area q', 'c.areaID = q.id', 'left'],
            ['(select  tid,sum(sellprice) as xszj,sum(realprice) as zj from ' . SYS_DB_PREFIX . 'finance where status=1 group by tid) as cw', 'cw.tid = a.id'],
             ];
        $this->modelSell->join = $join;
        $where['a.' . DATA_STATUS_NAME] = ['neq', DATA_DELETE];

        return $this->modelSell->getList($where, $field, $order, $paginate);
    }
    ////没有墓主的服务单
    public function getSellList_nodeathname($where = [], $field = 'a.*', $order = '', $paginate = DB_LIST_ROWS) {
        $this->modelSell->alias('a');

        $join = [
            [SYS_DB_PREFIX . 'cemetery c', 'a.cid = c.id', 'left'],
            [SYS_DB_PREFIX . 'cemetery_garden y', 'c.gardenID = y.id', 'left'],
            [SYS_DB_PREFIX . 'cemetery_area q', 'c.areaID = q.id', 'left'],
            ['(select  tid,sum(realprice) as zj from ' . SYS_DB_PREFIX . 'finance where status=1 group by tid) as cw', 'cw.tid = a.id'],
             ];
        $this->modelSell->join = $join;
        $where['a.' . DATA_STATUS_NAME] = ['neq', DATA_DELETE];

        return $this->modelSell->getList($where, $field, $order, $paginate);
    }
    

    public function getSellList_all($where = [], $field = 'a.*', $order = '', $paginate = DB_LIST_ROWS) {
        $this->modelSell->alias('a');

        $join = [
            [
                '(select  tid,sum(realprice) as zj from ' . SYS_DB_PREFIX . 'finance where status=1 group by tid) as cw', 'cw.tid = a.id'],
        ];
        $this->modelSell->join = $join;
        $where['a.' . DATA_STATUS_NAME] = ['neq', DATA_DELETE];

        return $this->modelSell->getList($where, $field, $order, $paginate);
    }

    /////公墓购专门写的代码
    public function sell_cemetery_add($data = [], $chargeitem = [], $Serviceinfoitem = [], $financetype = 1) {
        $validate_result = $this->validateSell->scene('edit')->check($data);
        if (!$validate_result) {
            $result = array("code" => 1, "msg" => $this->validateSell->getError());
            return $result;
        }
        $data['orderNO'] = get_cw_OrderNo();
        $data['financetype'] = $financetype; /////购墓操作
        $data['orderstatus'] = 1; //默认未付款操作
        $data['paytype'] = 1;
        $data['payvarchar'] = $this->get_pay_typename($data);

        $sellId = $this->addSell($data);
        if ($sellId != FALSE) {
            action_log('新增加', '增加购墓信息购买人：' . $data['buyer']);
            $this->sell_save_bury($sellId, $data);
            $title = $chargeitem["name"];
            $titleid = $chargeitem["id"];
            $this->logicFinance->Finance($data["orderNO"], $data["cid"], $sellId, $data["paytype"], $data["financetype"], $data["orderstatus"], $data["mw_sellprice"], $data["mw_realprice"], 1, $data["mw_realprice"], $title, $titleid, $data["isvoice"]);
            $this->logicLinkman->update_linkname($data["buyer"], $data);
               $buryname=$this->logicBury->get_Buryname_bcid($data['cid']);
            // $this->logicCemetery->update_CemeteryInfo(['id' => $data['cid']], ['usestatus' => 3, 'typeID' => $data['CemeteryType']]);
            $this->logicCemetery->update_CemeteryInfo(['id' => $data['cid']], ['typeID' => $data['CemeteryType'], 'expiredate' => $data["orderend"],'monumename'=>$buryname]);
            $result = array("code" => 0, "msg" => "success");
        } else {

            $result = array("code" => 1, "msg" => "error");
        }
        return $result;
    }

    public function sell_cemetery_edit($data = [], $chargeitem = [], $Serviceinfoitem = [], $financetype = 1) {
        $validate_result = $this->validateSell->scene('edit')->check($data);
        if (!$validate_result) {
            $result = array("code" => 1, "msg" => $this->validateSell->getError());
            return $result;
        }
        $sellinfo = $this->getSellInfo(["id" => $data['id']]);
        if (empty($sellinfo)) {
            $result = array("code" => 1, "msg" => "销售数据异常，请检查");
            return $result;
        }
        $data['paytype'] = 1; ///这个没有作用
        $data['payvarchar'] = $this->get_pay_typename($data);
        $result = $this->updateSell($data); //$this->modelSell->addInfo($sellData);
        if ($result != FALSE) {

            action_log('修改', '修改购墓信息购买人：订单号：' . $sellinfo["orderNO"]);
            $where["tid"] = $data['id'];
            $data1['paytype'] = $financetype; /////购墓操作
            $data1['mw_sellprice'] = $data["mw_sellprice"]; //默认未付款操作
            $data1['mw_realprice'] = $data["mw_realprice"];
            $data1['offerprice'] = $data1['mw_sellprice'] - $data1['mw_realprice'];
            $data1['isvoice'] = $data["isvoice"];
            $this->logicFinance->update_Finance_paystatus($where, $data1);
            $this->logicLinkman->update_linkname($data["buyer"], $data);
            $this->logicCemetery->update_CemeteryInfo(['id' => $data['cid']], ['typeID' => $data['CemeteryType']]);

            $result = array("code" => 0, "msg" => "success");
        } else {

            $result = array("code" => 1, "msg" => "error");
        }
        return $result;
    }

    ///////购墓信息付款
    public function sell_cemetery_pay($data = [], $paystatus) {
        $where["id"] = $data["id"];
        $result = $this->modelSell->updateInfo_zhj($where, ["orderstatus" => $paystatus]);
        $isupdate = 0;
        if ($result != FALSE) {

            $sellFinanceData["paystatus"] = $paystatus;
            $sellFinanceData["payerdate"] = TIME_NOW;
            $fwhere["tid"] = $data["id"];
            $this->modelFinance->updateInfo_zhj($fwhere, $sellFinanceData);
           
            $this->modelCemetery->updateInfo(['id' => $data['cid']], ['usestatus' => 3, 'expiredate' => $data['orderend']]);
            $isupdate = 3;
            action_log('付款', '购墓信息付款' . '，where：' . http_build_query(['id' => $data["id"]]));
            $result = array("code" => 0, "msg" => "success", "isupdate" => $isupdate, "cid" => $data['cid']);
        } else {
            $result = array("code" => 1, "msg" => $this->modelSell->getError());
        }
        return $result;
    }

    /**
     *  购墓信息删除
     */
    public function sell_cemetery_Del($where = []) {
        $sellinfo = $this->getSellInfo($where);
        if (empty($sellinfo)) {
            $result = array("code" => 1, "msg" => "销售数据异常，请检查");
            return $result;
        }
        $result = $this->modelSell->deleteInfo(["id" => $sellinfo["id"]]);
        if ($result != FALSE) {
            action_log('删除', '购墓信息删除' . '，where：' . http_build_query(['id' => $where['id']]));
            $this->Sell_Del_other_all(["tid" => $sellinfo["id"]]);
            $this->modelBury->deleteInfo(["cid" => $sellinfo["cid"]]);
             $this->modelLinkman->deleteInfo(["cid" => $sellinfo["cid"]]);
            /////更新墓穴的状态为可操作状态
            $this->modelCemetery->updateInfo(['id' => $sellinfo['cid']], ['usestatus' => 1, 'expiredate' => null,'monumename'=>'','monumenhtml'=>'']);
            ///////
            $result = array("code" => 0, "msg" => "success");
        } else {
            $result = array("code" => 1, "msg" => $this->modelSell->getError());
        }
        return $result;
    }

    /////购买服务
    public function Sell_add_submit($data = [], $chargeitem = [], $Serviceinfoitem = [], $financetype = 1) {
        $validate_result = $this->validateSell->scene('edit')->check($data);
        if (!$validate_result) {
            $result = array("code" => 1, "msg" => $this->validateSell->getError());
            return $result;
        }
        $data['orderNO'] = get_cw_OrderNo();
        $data['financetype'] = $financetype; /////购墓操作
        $data['orderstatus'] = 1; //默认付款操作
         $data["orderbegin"] = date("Y-m-d");
        $data["orderend"] = date("Y-m-d");
        $data['paytype'] = 1;
        $data['payvarchar'] = $this->get_pay_typename($data);
        $sellId = $this->addSell($data); //$this->modelSell->addInfo($sellData);
        if ($sellId != FALSE) {
            action_log('新增加', '增加服务购买人：' . $data['buyer']);
            $this->sell_save_selldate($sellId, $data, $chargeitem, $Serviceinfoitem, false);
            $this->logicLinkman->update_linkname($data["buyer"], $data);
            $result = array("code" => 0, "msg" => "success");
        } else {
            $result = array("code" => 1, "msg" => "error");
        }
        return $result;
    }
public function Sell_edit_submit($data = [], $chargeitem = [], $Serviceinfoitem = []) {
        $validate_result = $this->validateSell->scene('edit')->check($data);
        if (!$validate_result) {
            $result = array("code" => 1, "msg" => $this->validateSell->getError());
            return $result;
        }
        $sellinfo = $this->getSellInfo(["id" => $data['id']]);
        if (empty($sellinfo)) {
            $result = array("code" => 1, "msg" => "销售数据异常，请检查");
            return $result;
        }
        $data['paytype'] = 1;
        $data['payvarchar'] = $this->get_pay_typename($data);
        $result = $this->updateSell($data); //$this->modelSell->addInfo($sellData);
        if ($result != FALSE) {
            action_log('修改', '修改购墓信息购买人：订单号：' . $sellinfo["orderNO"]);
            $this->Sell_Del_other_all(["tid" => $sellinfo["id"]]);  ///删除掉财务数据和其他数据，在增加///
            $data["orderNO"] = $sellinfo["orderNO"];
            $data['financetype'] = $sellinfo["financetype"]; /////购墓操作
            $data['orderstatus'] = $sellinfo["orderstatus"]; //默认付款操作
            $this->sell_save_selldate($data['id'], $data, $chargeitem, $Serviceinfoitem, FALSE);
            $this->logicLinkman->update_linkname($data["buyer"], $data);
            $result = array("code" => 0, "msg" => "success");
        } else {

            $result = array("code" => 1, "msg" => "error");
        }
        return $result;
    }
     
    ///////殡葬服务信息付款
    public function Buryservice_pay($data = [], $paystatus) {
        $where["id"] = $data["id"];
        $result = $this->modelSell->updateInfo_zhj($where, ["orderstatus" => $paystatus]);
        
        if ($result != FALSE) {
            $sellFinanceData["paystatus"] = $paystatus;
            $sellFinanceData["payerdate"] = TIME_NOW;
            $fwhere["tid"] = $data["id"];
            $this->modelFinance->updateInfo_zhj($fwhere, $sellFinanceData);
             action_log('付款', '殡葬服务付款' . '，where：' . http_build_query(['id' => $data["id"]]));
            $result = array("code" => 0, "msg" => "success");
        } else {
            $result = array("code" => 1, "msg" => $this->modelSell->getError());
        }
        return $result;
    }
    
    public function getSellInfo($where = [], $field = 'a.*') {
        $this->modelSell->alias('a');
        $where['a.status'] = 1;
        return $this->modelSell->getInfo($where, $field);
    }

    public function getsellinfo_ajax($where = [], $search_bury = true) {

        $data = $this->getSellInfo($where);
        if (empty($data)) {
            $data["relation"] = "";
            $data["sex"] = 1;
            $data["id"] = 0;
            $data["buyer"] = "";
            $data['job'] = "";
            $data['phone'] = "";
            $data['address'] = "";
            $data['isvoice'] = 0;
            $data['paytype'] = "1";
            $data['vcdesc'] = "";
            $data['orderbegin'] = date("Y-m-d");
            $data['orderend'] = (date('Y') + 20) . '-' . date('m') . "-" . date('d');
            $data['billTolamount'] = 0;
            $data['payvarchar'] = "";
            $data['buryname'] = "";
            return $data;
        }
        $finacewhere["tid"] = $data["id"];
        //$finacewhere["financetype"] = $financetype;
        $data['Financeinfo'] = $this->logicFinance->sellList($finacewhere, "*", "kmtype", false);
        //////////////////////////////////////////////////////
        //$data['linkman'] = $this->modelLinkman->getList(['cid' => $data['cid'], DATA_STATUS_NAME => ['neq', DATA_DELETE]]);
        if ($search_bury) {
            $data['bury'] = $this->modelBury->getList(['cid' => $data['cid'], 'sellid' => $data["id"], DATA_STATUS_NAME => ['neq', DATA_DELETE]], "*", "sort", FALSE);
        }
        // $data['prooffile'] = $this->modelProoffile->getList(['cid' => $data['cid'], DATA_STATUS_NAME => ['neq', DATA_DELETE]])->toArray();

        if (!empty($data['Financeinfo'])) {
            $billTolprice = array_sum(array_map(function($val) {
                        return $val['realprice'];
                    }, $data['Financeinfo']));
        } else
            $billTolprice = 0.00;
        $data['billTolamount'] = $billTolprice;
        return $data;
    }

    public function Sellinfo_del($sellid) {

        $result = $this->modelSell->deleteInfo(["id" => $sellid]);
        if ($result != FALSE) {
            $where["tid"] = $sellid;
            $this->modelFinance->deleteInfo($where);
            $this->modelServicebill->deleteInfo($where);
        }

        return $result;
    }

    public function Sell_Del_other_all($where = []) {
        $this->modelFinance->deleteInfo($where, true);
        $this->modelServicebill->deleteInfo($where, true);
    }

    /**
     * 获取列表搜索条件
     */
    public function getWhere($data = []) {

        $where = [];
        !empty($data['search_data']) && $where['a.buyer|c.name|monumename'] = ['like', '%' . $data['search_data'] . '%'];

        if (!empty($data['sbbegin'])) {
            $where['a.savebegindate'] = array("EGT", strtotime($data['sbbegin']));
        }
        if (!empty($data['sbend'])) {
            $where['a.savebegindate'] = array("ELT", strtotime($data['sbend']));
        }
        if (!empty($data['saveareaid'])) {
            $where['a.saveareaid'] = $data['saveareaid'];
        }

        return $where;
    }

    public function addSell($data) {
        $sellData = array(
            'orderNO' => $data["orderNO"],
            'cid' => $data['cid'],
            'bid' => isset($data['bid']) ? $data['bid'] : '0',
            'buyer' => $data['buyer'],
            'relation' => isset($data['relation']) ? $data['relation'] : '',
            'job' => isset($data['job']) ? $data['job'] : '',
            'phone' => $data['phone'],
            'sex' => !empty($data['sex']) ? $data['sex'] : '1',
            'address' => isset($data['address']) ? $data['address'] : '',
            'vcdesc' => isset($data['vcdesc']) ? $data['vcdesc'] : '',
            'orderstatus' => $data["orderstatus"],
            'seller' => $data["seller"],
            'sellname' => $data["sellname"],
            'orderbegin' => $data["orderbegin"],
            'orderend' => $data["orderend"],
            'isvoice' => !empty($data['isvoice']) ? $data['isvoice'] : '0',
            'paytype' => $data["paytype"],
            'financetype' => $data["financetype"],
            'buryname' => isset($data['buryname']) ? $data['buryname'] : '',
            'status' => 1,
            'payvarchar' => !empty($data['payvarchar']) ? $data['payvarchar'] : '',
        );
        return $this->modelSell->addInfo($sellData);
    }

    public function updateSell($data) {
        $sellData = array(
            'buyer' => $data['buyer'],
            'relation' =>!empty($data['relation']) ? $data['relation'] : '',
            'job' => !empty($data['job']) ? $data['job'] : '',
            'phone' => $data['phone'],
            'sex' => !empty($data['sex']) ? $data['sex'] : '1',
            'address' => !empty($data['address']) ? $data['address'] : '',
            'vcdesc' => isset($data['vcdesc']) ? $data['vcdesc'] : '',
            'seller' => $data["seller"],
            'sellname' => $data["sellname"],
            'isvoice' => $data["isvoice"],
            'buryname' => isset($data['buryname']) ? $data['buryname'] : '',
            'payvarchar' => !empty($data['payvarchar']) ? $data['payvarchar'] : '',
            'id' => $data["id"]
        );
        return $this->modelSell->setInfo($sellData);
    }

    public function sell_save_bury($sellId, $data = []) {
        $buryData = array();
        
        foreach ($data['bury'] as $k => $v) {
            unset($buryData);
            if (!empty($v['deathname'])) {
               
                if (!empty($v['birth']) && !empty($v['death'])) {
                    $death = substr($v['death'], 0, 4);
                    $birth = substr($v['birth'], 0, 4);
                    $age = $death - $birth + 1; //date('Y',strtotime($v['bury_death']))-date('Y',strtotime($v['bury_birth']));
                } else {
                    $age = 0;
                }
                $buryData = array(
                    'orderNO' => $data["orderNO"],
                    'sellID' => $sellId,
                    'cid' => $data['cid'],
                    'vcname' => $v['deathname'],
                    'sex' => $v['sex'],
                    'age' => $age,
                    'birth' => !empty($v['birth']) ? $v['birth'] : null,
                    'death' => !empty($v['death']) ? $v['death'] : null,
                    'bury' => !empty($v['bury']) ? $v['bury'] : null,
                    'sfz' => $v['sfz'],
                    'filelist' => "",
                    'sort' => $k,
                    'linkname' => $data["buyer"],
                    'relation' => $data["relation"],
                    'phone' => $data["phone"],
                    'burystatus' => 0,
                    'operater' => MEMBER_ID,
                    'operatename' => session('member_info')['nickname'],
                    'status' => 1
                );
                if ($v['id'] != 0) {
                    $where["id"] = $v['id'];
                    $buryId = $this->modelBury->updateInfo_zhj($where, $buryData);
                } else {
                    $buryId = $this->modelBury->addInfo($buryData);
                }
            }
        }
       
    }

    public function sell_save_selldate($sellId, $data = [], $chitem = [], $Serviceinfoitem = [], $ismwfw = false) {
        $price=0.00;
        ////////墓位费用////////////////////////////
        if ($ismwfw) {
            $title = $chitem[2]["name"];
            $titleid = $chitem[2]["id"];
            $price=$price+$data["mw_realprice"];
            $this->logicFinance->Finance($data["orderNO"], $data["cid"], $sellId, $data["paytype"], $data["financetype"], $data["orderstatus"], $data["mw_sellprice"], $data["mw_realprice"], 1, $data["mw_realprice"], $title, $titleid, $data["isvoice"]);
        }
        ////其他收费项目
        foreach ($chitem as $key => $value) {
            if (isset($data['chargeitem'][$key])) {
                $realprice = $data['chargeitem'][$key];
                $title = $value["name"];
                $titleid = $value["id"];
                $price=$price+$realprice;
                $this->logicFinance->Finance($data["orderNO"], $data["cid"], $sellId, $data["paytype"], $data["financetype"], $data["orderstatus"], $realprice, $realprice, 1, $realprice, $title, $titleid, $data["isvoice"]);
            }
        }
        //////////服务收费
        foreach ($Serviceinfoitem as $key => $value) {
            $titleid = $value["id"];
            if (isset($data['Serviceinfo'][$titleid])) {
                $realprice = $data['Serviceinfo'][$titleid];
                $title = $value["servicename"];
                $exechrm = $value["manager"];
                $deptid = $value["deptid"];
                 $price=$price+$realprice;
                $this->logicFinance->Finance($data["orderNO"], $data["cid"], $sellId, $data["paytype"], $data["financetype"], $data["orderstatus"], $realprice, $realprice, 1, $realprice, $title, $titleid, $data["isvoice"], 2);
                $this->logicServicebill->add_Servicebill($data["orderNO"], $data["cid"], $sellId, $titleid, $title, $data["buyer"], $data['phone'], $exechrm, $deptid);
            }
        }
      return $price;
    }

    /*
     * 退墓处理记录
     */

    //////更新收费记录的变成历史记录
    public function canacel_update_isstory($cid, $sellid) {
        if ($sellid!=0) {
            $sellwhere["cid"] = $cid;
            $sellwhere["id"] = array("neq", $sellid);
            $this->modelSell->updateInfo($sellwhere, ['isstory' => 1]);
            $Finance["cid"] = $cid;
            $Finance["tid"] = array("neq", $sellid);
            $this->modelFinance->updateInfo_zhj($Finance, ['isstory' => 1]);
        } else {
            $sellwhere["cid"] = $cid;
            $this->modelSell->updateInfo($sellwhere, ['isstory' => 1]);
            $Finance["cid"] = $cid;
            $this->modelFinance->updateInfo_zhj($Finance, ['isstory' => 1]);
        }
        $this->modellinkman->updateInfo(['cid' => $cid], ['isstory' => 1, 'status' => -1]);
        $this->modelBury->updateInfo(['cid' => $cid], ['isstory' => 1, 'status' => -1]);
        $this->modelservicebill->updateInfo(['cid' => $cid], ['isstory' => 1]);
        $this->modellight->updateInfo(['cid' => $cid], ['isstory' => 1]);
        $this->modelMonumen->updateInfo(['cid' => $cid], ['isstory' => 1]);
    }
    
    public function Cancel_cl($oldsid,$newsid,$type,$id) {
           if ($type==1)
          {
              $oldsell["orderstatus"] = 4;
              $result = $this->modelSell->updateInfo(['id' => $newsid], $oldsell); 
         }
         else
         {
              $oldsell["orderstatus"] = 3;
               $result = $this->modelSell->updateInfo(['id' => $oldsid], $oldsell);
         }
        if ($result != FALSE) {
            action_log('退墓', '退墓操作' . '，where：' . http_build_query(['id' => $id]));
            $result = array("code" => 0, "msg" => "操作完成");
        } else {
            $result = array("code" => 1, "msg" => $this->modelSell->getError());
        }
        return $result;
    }

    public function get_pay_typename($data = []) {

        $Payment = parse_config_array('Payment');
        $paystr = "";
        foreach ($Payment as $key => $value) {
            if (isset($data["fklx"][$key])) {
                $paystr .= $value . "," . trim($data["fklxval"][$key]) . "|";
            }
        }
        return $paystr;
    }

    public function get_pay_array($payvarchar) {
        $paytype = parse_config_array('Payment');
        $payarray = array();
        foreach ($paytype as $key => $value) {
            $payarray[$key] = array("ischeck" => 0, "value" => 0.00, "name" => $value);
        }
        if (!empty($payvarchar)) {
            $paylist = explode("|", $payvarchar);
            foreach ($paylist as $key => $value) {
                $payval = explode(",", $value);
                foreach ($payarray as $key => $v2) {
                    if ($v2["name"] == $payval[0]) {
                        $payarray[$key]["ischeck"] = 1;
                        $payarray[$key]["value"] = $payval[1];
                    }
                }
            }
        }
        return $payarray;
    }
    
     public function get_buryname_array($buryname,$burylist) {
        
        $burynamelist = array();
        foreach ($burylist as $key => $value) {
            $burynamelist[$key] =$value;// array("ischeck" => 0, "name" => $value["vcname"]);
             $burynamelist[$key]["ischeck"]=1;
        }
        if (!empty($buryname)) {
            $paylist = explode(",", $buryname);
            foreach ($paylist as $key => $value) {
                 foreach ($burynamelist as $key2 => $v2) {
                    if ($v2["vcname"] == $value) {
                        $burynamelist[$key2]["ischeck"] = 1;
                      }
                }
            }
        }
        return $burynamelist;
    }

    public function get_pay_print_str($payvarchar) {

        $paystr = "";
        if (!empty($payvarchar)) {
            $paylist = explode("|", $payvarchar);
            foreach ($paylist as $key => $value) {
                $payval = explode(",", $value);
                $paystr .= $payval[0] . ",";
            }
        }
        $paystr = rtrim($paystr, ",");
        return $paystr;
    }

}

<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

namespace app\admin\logic;

/**
 * Description of linkman
 *
 * @author Administrator
 */
class Linkman extends AdminBase {

    /**
     * 获取墓园类型列表
     */
    public function getlinkmanList($where = [], $field = true, $order = '', $paginate = DB_LIST_ROWS) {

        return $this->modelLinkman->getList($where, $field, $order, $paginate);
    }

    public function getlinkmanInfo($where = [], $field = true) {

        return $this->modelLinkman->getInfo($where, $field);
    }

    /**
     * 墓园类型删除
     */
    public function LinkmanDel($where = []) {
        $wh["id"]=$where["id"];
        $result = $this->modelLinkman->deleteInfo($wh);
        if ($result != FALSE) {
          
            $result = array("code" => 0, "msg" => "success");
        } else {
            $result = array("code" => 1, "msg" => $this->modelLinkman->getError());
        }
        return $result;
    }

    public function sell_add_linkname($sellId, $data = []) {
        $linkmanDataTwo = array(
            'sellID' => $sellId,
            'orderNO' => $data["orderNO"],
            'linkname' => $data['buyer'],
            'cid' => $data['cid'],
            'relation' => isset($data['relation']) ? $data['relation'] : '',
            'phone' => $data['phone'],
            'job' => isset($data['job']) ? $data['job'] : '',
            'address' => isset($data['address']) ? $data['address'] : '',
            'sex' => !empty($data['sex']) ? $data['sex'] : '1',
            'vcnote' => '',
            'linkstatus' => 1,
            'status' => 1
        );
        $this->modelLinkman->addInfo($linkmanDataTwo);
    }

    public function update_linkname($name, $data = []) {
         $linkmanDataTwo = array(
            'linkname' => $data['buyer'],
            'phone' => $data['phone'],
             'sex' => isset($data['sex']) ? $data['sex'] : '1'
            
        );
         
        if (isset($data['orderNO']))
            $linkmanDataTwo["orderNO"]=$data['orderNO'];
        if (isset($data['job']))
            $linkmanDataTwo["job"]=$data['job'];
         if (isset($data['address']))
            $linkmanDataTwo["address"]=$data['address'];
          if (isset($data['relation']))
            $linkmanDataTwo["relation"]=$data['relation'];
         
       
        $linkname = $this->getlinkmanInfo(["linkname" => $name, "cid" => $data['cid']]);
        if (!empty($linkname)) {
            $linkmanDataTwo["id"] = $linkname["id"];
        } else {
             $linkmanDataTwo["cid"] = $data['cid'];
            $linkmanDataTwo["linkstatus"] = 1;
            $linkmanDataTwo["status"] = 1;
             
        }
        $this->modelLinkman->setInfo($linkmanDataTwo);
    }

}

<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

namespace app\admin\logic;

/**
 * Description of Chargeitem
 *
 * @author Administrator
 */
class Chargeitem extends AdminBase {

    /**
     * 获取墓园类型列表
     */
    public function getChargeitemList($where = [], $field = '*', $order = '', $paginate = DB_LIST_ROWS) {

        $where[DATA_STATUS_NAME] = ['neq', DATA_DELETE];

        return $this->modelChargeitem->getList($where, $field, $order, $paginate);
    }

    /**
     * 墓园类型信息添加
     */
    public function ChargeitemAdd($data = []) {
        $validate_result = $this->validateChargeitem->scene('add')->check($data);
        if (!$validate_result) {
            $result = array("code" => 1, "msg" => $this->validateChargeitem->getError());
            return $result;
        }
        $financetype_var=",";
        if(isset($data["financetype"]))
        {
            foreach ($data["financetype"] as $value) {
                $financetype_var.=$value.",";
            }
        }
        if ($financetype_var!=",")
            $data["financetype"]=$financetype_var;
        else
            $data["financetype"]="";
        $result = $this->modelChargeitem->setInfo($data);
        $result && action_log('新增', '新增收费项目信息，name：' . $data['name']);
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
    public function ChargeitemEdit($data = []) {
        $validate_result = $this->validateChargeitem->scene('edit')->check($data);

        if (!$validate_result) {
            $result = array("code" => 1, "msg" => $this->validateChargeitem->getError());
            return $result;
        }
        $financetype_var=",";
        if(isset($data["financetype"]))
        {
            foreach ($data["financetype"] as $value) {
                $financetype_var.=$value.",";
            }
        }
        if ($financetype_var!=",")
            $data["financetype"]=$financetype_var;
        else
            $data["financetype"]="";
        $result = $this->modelChargeitem->setInfo($data);
        $result && action_log('编辑', '编辑收费项目信息，name：' . $data['name']);
        if ($result != FALSE) {
            $result = array("code" => 0, "msg" => "success");
        } else {
            $result = array("code" => 1, "msg" => "error");
        }
        return $result;
    }

    /**
     *  
     */
    public function getChargeitemInfo($where = [], $field = true) {

        return $this->modelChargeitem->getInfo($where, $field);
    }

    /**
     * 墓园类型删除
     */
    public function ChargeitemDel($where = []) {

        $result = $this->modelChargeitem->deleteInfo($where);

        $result && action_log('删除', '收费项目信息删除' . '，where：' . http_build_query($where));

        return $result ? [RESULT_SUCCESS, '删除成功'] : [RESULT_ERROR, $this->modelChargeitem->getError()];
    }

    /**
     * 获取列表搜索条件
     */
    public function getWhere($data = []) {

        $where = [];

        !empty($data['search_data']) && $where['servicename'] = ['like', '%' . $data['search_data'] . '%'];

        return $where;
    }

    public function getChargeitemStat($where = [], $stat_type = 'count', $field = 'id') {

        return $this->modelChargeitem->stat($where, $stat_type, $field);
    }
    
    /////获取单据的收费项目列表
    public function getChargeitemStat_value($financetype,$issystem=-1)
    {
        $where["financetype"]= array('like','%,'.$financetype.',%');
        if ($issystem!=-1)
           $where["issystem"]=$issystem;
       $chargeitem = $this->getChargeitemList($where,"*","sort",FALSE);
        if (!empty($chargeitem))
        {
            foreach ($chargeitem as $key => $value) {
                if ($value["showtype"]==2)
                {
                   $chargeitem[$key]["select"]=parse_config_attr($value["value"]);
                }
                else
                {
                  $chargeitem[$key]["select"]="";
                }
            }
        }
        return $chargeitem;
    }

}


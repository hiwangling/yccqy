<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

namespace app\admin\logic;

/**
 * Description of Jxcorderdetail
 *
 * @author Administrator
 */
class Jxcorderdetail extends AdminBase
{
    /**
     * 获取墓穴样式类型列表
     */
    public function orderdetailList($where = [], $field = true, $order = '', $paginate = DB_LIST_ROWS)
    {
        $field="a.*,p.sn,p.name as pname,unit";
        $this->modelJxcorderdetail->alias('a');
           $join = [
                    [SYS_DB_PREFIX . 'jxcproduct p', 'p.id = a.gid',"left"]
                ];
        $where['a.' . DATA_STATUS_NAME] = ['neq', DATA_DELETE];
        return $this->modelJxcorderdetail->getList($where, $field, $order, $paginate,$join);
    }

    public function  JxcorderdetailDel($where = [])
    {
        
        $result = $this->modelJxcorderdetail->deleteInfo($where);
        
         return $result ;
    }
  
    
    
}
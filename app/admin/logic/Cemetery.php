<?php

namespace app\admin\logic;

/**
 * 墓穴逻辑
 */
class Cemetery extends AdminBase {

    /**
     * 获取墓穴列表
     */
    public function getCemeteryList($where = [], $field = 'a.*', $order = '', $paginate = DB_LIST_ROWS)
    {
        $this->modelCemetery->alias('a');
        
        $join = [
                    [SYS_DB_PREFIX . 'cemetery_garden g', 'a.gardenID = g.id'],
                    [SYS_DB_PREFIX . 'cemetery_area r', 'a.areaID = r.id'],
                    [SYS_DB_PREFIX . 'cemetery_type t', 'a.typeID = t.id'],
                    [SYS_DB_PREFIX . 'cemetery_style s', 'a.styleID = s.id'],
                ];
        
        $where['a.' . DATA_STATUS_NAME] = ['neq', DATA_DELETE];
        $this->modelCemetery->join = $join;
        return $this->modelCemetery->getList($where, $field, $order, $paginate,$join);
    }

    /**
     * 墓穴信息添加
     */
    public function CemeteryAdd($data = []) {
        $validate_result = $this->validateCemetery->scene('add')->check($data);
        if (!$validate_result) {
            $result = array("code" => 1, "msg" => $this->validateCemetery->getError());
            return $result;
        }
        $result = $this->modelCemetery->setInfo($data);
        $result && action_log('新增', '新增墓穴，name：' . $data['name']);
        if ($result != FALSE) {
            $result = array("code" => 0, "msg" => "success");
        } else {
            $result = array("code" => 1, "msg" => "error");
        }
        return $result;
    }
    
    /**
     * 批量增加
     * @param type $data
     * @return type
     */
    public function CemeterybatchAdd($data = [])
    {
        
        $validate_result = $this->validateCemetery->scene('batchadd')->check($data);      
        if (!$validate_result) {
            $result = array("code" => 1, "msg" => $this->validateCemetery->getError());
            return $result;
        }
         //$url = url('cemetery_list');
          $data1= $data;
          unset($data1["ix_begin"]);
          unset($data1["ix_end"]);
          unset($data1["iy_begin"]);
          unset($data1["iy_end"]);
          unset($data1["id"]);
          unset($data1["sj"]);
         $gname=$this->modelCemeteryGarden->getValue(['id' => $data["gardenID"]], 'name');
         $aname=$this->modelCemeteryArea->getValue(['id' => $data["areaID"]], 'name');
         for ($xindex = $data["ix_begin"]; $xindex <= $data["ix_end"]; $xindex++) {
                for ($yindex = $data["iy_begin"]; $yindex <= $data["iy_end"]; $yindex++) {
                  $data1["name"]= $gname.$aname.$xindex."-".$yindex;
                  $data1["ix"]= $xindex;
                  $data1["iy"]= $yindex;
                  
                 $result = $this->modelCemetery->addInfo($data1);
           }
         }
        $result && action_log('新增', '批量新增墓穴，name：' . $data1['name']); 
        if ($result != FALSE) {
            $result = array("code" => 0, "msg" => "success");
        } else {
            $result = array("code" => 1, "msg" => "error");
        }
        return $result;
    }

    /**
     * 墓穴信息编辑
     */
    public function CemeteryEdit($data = []) {

        $validate_result = $this->validateCemetery->scene('edit')->check($data);

        if (!$validate_result) {
            $result = array("code" => 1, "msg" => $this->validateCemetery->getError());
            return $result;
        }
        $result = $this->modelCemetery->setInfo($data);
        $result && action_log('编辑', '编辑墓穴，name：' . $data['name']);
        if ($result != FALSE) {
            $result = array("code" => 0, "msg" => "success");
        } else {
            $result = array("code" => 1, "msg" => "error");
        }
        return $result;
    }

   
    /**
     * 获取墓穴信息
     */
    public function getCemeteryInfo($where = [], $field = true) {

        return $this->modelCemetery->getInfo($where, $field);
    }
    
    public function update_CemeteryInfo($where = [],  $data = [])
    {
        return $this->modelCemetery->updateInfo($where, $data);
    }

     
    /**
     * 墓穴删除
     */
    public function CemeteryDel($where = []) {

        $result = $this->modelCemetery->deleteInfo($where);

        $result && action_log('删除', '墓穴删除' . '，where：' . http_build_query($where));

        return $result ? [RESULT_SUCCESS, '删除成功'] : [RESULT_ERROR, $this->modelCemetery->getError()];
    }

    /**
     * 获取列表搜索条件
     */
    public function getWhere($data = []) {

        $where = [];

        !empty($data['search_data']) && $where['a.name'] = ['like', '%' . $data['search_data'] . '%'];

        return $where;
    }
    
     public function getStat($where = [], $stat_type = 'count', $field = 'id')
    {
		$where[DATA_STATUS_NAME] = ['neq', DATA_DELETE];
     
        return $this->modelCemetery->stat($where, $stat_type, $field);
		
    }
    public function create_cemeteryname($x,$y,$gid,$aid)
    {
        $gname=$this->modelCemeteryGarden->getValue(['id' => $gid], 'name');
        $aname=$this->modelCemeteryArea->getValue(['id' => $aid], 'name');
        return $gname.$aname.$x."-".$y;
        
    }
    
    public function get_xlist($areaid)
    {
        
        $where="select DISTINCT ix  from ".SYS_DB_PREFIX."cemetery where areaID=$areaid";
        return $this->modelCemetery->getList($where);
    }
    
    public function get_cemetery_list($areaid)
    {
        $where="select c.id,ix,iy,usestatus,t.hrm from ".SYS_DB_PREFIX."cemetery  as c left join ".SYS_DB_PREFIX."cemetery_type as t on c.typeID=t.id where areaID=$areaid and c.status=1 order by gardenID,areaID,ix,iy";
      
        return $this->modelCemetery->getList($where); 
    }
    public function get_areainfo_tj($areaid)
    {
         $where="select usestatus,count(*) as sl from ".SYS_DB_PREFIX."cemetery where areaID=$areaid and status=1 group by usestatus";
       return $this->modelCemetery->getList($where); 
    }
    //////统计状态分类，安区域统计分类
    public function get_gradeareninfo_tj($aid=0)
    {
        $where="select g.name as gname,a.*,zt.*
from ".SYS_DB_PREFIX."cemetery_area  a 
INNER JOIN ".SYS_DB_PREFIX."cemetery_garden as g on a.gardenID=g.id
left join (
select areaID,
count(case when usestatus=1 then 1 end ) as '1', 
count(case when usestatus=2 then 1 end ) as '2', 
count(case when usestatus=3 then 1 end ) as '3', 
count(case when usestatus=4 then 1 end ) as '4'
from ".SYS_DB_PREFIX."cemetery where  status=1 group by  areaID
) as zt on zt.areaID=a.id where  a.status=1 ";
        if ($aid!=0)
            $where.=" and a.id=$aid";
           return $this->modelCemetery->getList($where); 
    }
    public function get_area_max($areaid)
    {
         return $this->modelCemetery->getInfo("areaID=$areaid and status=1","min(ix) as min_x , max(ix) as max_x, min(iy) as min_y , max(iy) as max_y");
                
    }

    public function resetmonument_ajax($data)
    {
        $this->modelCemetery->setInfo($data);
    }
}

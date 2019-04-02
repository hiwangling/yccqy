<?php

// +---------------------------------------------------------------------+
// | OneBase    | [ WE CAN DO IT JUST THINK ]                            |
// +---------------------------------------------------------------------+
// | Licensed   | http://www.apache.org/licenses/LICENSE-2.0 )           |
// +---------------------------------------------------------------------+
// | Author     | Bigotry <3162875@qq.com>                               |
// +---------------------------------------------------------------------+
// | Repository | https://gitee.com/Bigotry/OneBase                      |
// +---------------------------------------------------------------------+

namespace app\admin\logic;

class Servicebill extends AdminBase {

    public function getServicebillList($where = [], $field = 'a.*', $order = '', $paginate = DB_LIST_ROWS,$group = '', $limit = null) {
        $this->modelServicebill->alias('a');

        $field = "a.*,c.name as cemetery_name,m.nickname,servicetype";

        $join = [
            [SYS_DB_PREFIX . 'cemetery c', 'a.cid = c.id'],
            [SYS_DB_PREFIX . 'member m', 'a.exechrm = m.id', 'left'],
            [SYS_DB_PREFIX . 'serviceinfo s', 'a.serviceid = s.id'],
            [SYS_DB_PREFIX . 'sell s1', 'a.sellID = s1.id  '],
        ];

        $where['a.' . DATA_STATUS_NAME] = ['neq', DATA_DELETE];
         $date=$this->modelServicebill->getList($where, $field, $order, $paginate, $join,$group,$limit);
        $ss=$this->modelServicebill->getLastSql();
         return $date;
    }

 
    public function getServicebillInfo($where = [], $field = true) {
        $this->modelServicebill->alias('a');
       // $field = "a.*,c.name as cemetery_name,m.nickname";
        $field="a.*,c.name as cemetery_name,c.gardenID,c.areaID,c.typeID,c.styleID,c.area,c.ix,c.iy,c.price,s.name as style_name,g.name as garden_name,r.name as area_name,t.name as type_name,m.nickname";
		
        $join = [
					[SYS_DB_PREFIX . 'cemetery c', 'a.cid = c.id'],
					[SYS_DB_PREFIX . 'cemetery_style s', 'c.styleID = s.id',"left"],
					[SYS_DB_PREFIX . 'cemetery_garden g', 'c.gardenID = g.id',"left"],
					[SYS_DB_PREFIX . 'cemetery_area r', 'c.areaID = r.id',"left"],
					[SYS_DB_PREFIX . 'cemetery_type t', 'c.typeID = t.id',"left"],
                                         [SYS_DB_PREFIX . 'member m', 'a.exechrm = m.id',"left"]
                ];
         

        $data = $this->modelServicebill->getInfo($where, $field, $join);

        if (!empty($data["joinhrm"])) {
            $memberlist="";
            $member = $this->modelMember->getList("select nickname from " . SYS_DB_PREFIX . "member where id in (" . $data["joinhrm"] . ")");
            foreach ($member as $k => $v) {
                $memberlist = $memberlist.",".$v["nickname"];
            }
            $data['joinhrm'] = $memberlist;
        } else {
            $data['joinhrm'] = "";
        }
        return $data;
    }
    public function add_Servicebill($orderNO,$cid,$tid,$serviceID,$servicename,$buyer,$phone,$exechrm,$deptid)
    {    
          $sellFinanceData = array(
                        'orderNO' => $orderNO,
                        'tid' => $tid,
                        'cid' => $cid,
                        'serviceID' => $serviceID,
                        'service' => $servicename,
                        'serviceamount' => 1,
                        'linkmane' =>$buyer,
                        'linkphone' =>$phone,
                        'exechrm' => $exechrm,
                        'deptid' => $deptid,
                        'operater' => MEMBER_ID,
                        'operatename' => session('member_info')['nickname'],
                         'resutlstatus' => 1,
                        'status' => 1
                );
       
        return $this->modelServicebill->addInfo($sellFinanceData); 
    }


    public function getWhere($data = []) {

        $where = [];

        !empty($data['search_data']) && $where['c.name|a.service'] = ['like', '%' . $data['search_data'] . '%'];

        return $where;
    }

    public function getSeachWhere($data) {
        
        if (!empty($data['cemetery_name']))
            $where['c.name'] = ['like', '%' . $data['cemetery_name'] . '%'];
        
        if (!empty($data['servicetype']))
            $where['servicetype'] = $data['servicetype']; 

        if (!empty($data['resutlstatus']))
            $where['a.resutlstatus'] = $data['resutlstatus']; 
        

        if (!empty($data['linkmane']))
            $where['linkmane'] = ['like', '%' . $data['nickname'] . '%'];

        /*if ($data['startime'] && empty($data['endtime'])) {
            $where['a.begindate'] = [['egt', $data['startime']], ['elt', date('Y-m-d', time())], 'AND'];
        }
        if ($data['startime'] && $data['endtime']) {
            $where['a.begindate'] = [['egt', $data['startime']], ['elt', $data['endtime']], 'AND'];
        }
        if (empty($data['startime']) && $data['endtime']) {
            $where['a.begindate'] = ['elt', $data['endtime']];
        }*/
        $where['a.' . DATA_STATUS_NAME] = ['neq', DATA_DELETE];
        $where['s1.orderstatus'] = ['eq', 4];
        return $where;
    }

    public function ServicebillOver($data = []) {

        $member = session('member_info');
        $data['resutlstatus'] = 2;
        $data['execdate'] = TIME_NOW;
        $data['operater'] = MEMBER_ID;
        $data['operatename'] = $member['nickname'];

        $url = url('overList');

        $this->modelBury->updateInfo(['id' => $data['buryid']], ['Burystatus' => 1]); //安葬表

        $this->modelCemetery->updateInfo(['id' => $data['cid']], ['usestatus' => 4]); //墓穴表

        $result = $this->modelServicebill->setInfo($data);

        $result && action_log('编辑', '服务完成，id：' . $data['id']);

        return $result ? [RESULT_SUCCESS, '操作成功', $url] : [RESULT_ERROR, $this->modelCemetery->getError()];
    }

    public function ServicebillDel($where = []) {

        $result = $this->modelServicebill->deleteInfo($where);

        $result && action_log('删除', '墓位类型删除' . '，where：' . http_build_query($where));

        return $result ? [RESULT_SUCCESS, '删除成功'] : [RESULT_ERROR, $this->modelCemetery->getError()];
    }

    public function getBranchList() {


        $branch = $this->modelBranch->getList([DATA_STATUS_NAME => ['neq', DATA_DELETE], 'module' => MODULE_NAME], 'id,name,parentid', '', false);

        $member = $this->modelMember->getList([DATA_STATUS_NAME => ['neq', DATA_DELETE], 'module' => MODULE_NAME], 'id,nickname,branch', '', false);
        $branchData = array();
        $memberData = array();
        foreach ($branch as $k => $v) {
            $branchData[$k]['id'] = 't' . $v['id'];
            $branchData[$k]['pId'] = 0;
            $branchData[$k]['name'] = $v['name'];
            $branchData[$k]['nocheck'] = true;
        }
        foreach ($member as $k => $v) {
            if (!empty($v['branch'])) {
                $memberData[$k]['id'] = 'c' . $v['id'];
                $memberData[$k]['pId'] = 't' . $v['branch'];
                $memberData[$k]['name'] = $v['nickname'];
            }
        }
        $data = array_merge($branchData, $memberData);
        return $data;
    }

    public function getStat($where = [], $stat_type = 'count', $field = 'id') {
         $where[DATA_STATUS_NAME] = ['neq', DATA_DELETE];
             
        return $this->modelServicebill->stat($where, $stat_type, $field);
    }
    
     public function get_billStat() {
        /* $where[DATA_STATUS_NAME] = ['neq', DATA_DELETE]; 
        return $this->modelServicebill->stat($where, $stat_type, $field);*/
        $sql="SELECT COUNT(b.id) AS tp_count FROM `ky_servicebill` as  b  inner join ky_sell s on s.id=b.tid WHERE `resutlstatus` = 1 and s.orderstatus=4 ";
         $zs=$this->modelServicebill->getList($sql);
         return $zs[0]["tp_count"];
    }
    
    

    public function upate_service_over_ajax($data = []) {
        if (empty($data['billid'])) {
            return false;
        }
        $member = session('member_info');
        $data1['id'] = $data['billid'];
        $data1['resutlstatus'] = 2;
        $data1['execdate'] = TIME_NOW;
        $data1['operater'] = MEMBER_ID;
        $data1['operatename'] = $member['nickname'];
        $data1['joinhrm'] ="";//$data['exehrm'];
        $data1['exechrm'] = MEMBER_ID;
        $data1['execnote'] = $data['note'];
        if ($data['servietype'] == 10 || $data['servietype'] == 1) {
            $servicebilldate = $this->modelservicebill->getInfo(['id' => $data['billid']], "cid");
            $this->modelBury->updateInfo(['cid' => $servicebilldate['cid']], ['Burystatus' => 1]); //安葬表
            $this->modelCemetery->updateInfo(['id' => $servicebilldate['cid']], ['usestatus' => 4]); //墓穴表
        }
        $result = $this->modelServicebill->setInfo($data1);

        $result && action_log('编辑', '服务完成，id：' . $data['billid']);

        return $result;
    }
    
    public function exportserviceList($data=[])
	{	 
                $titles = "墓穴名称,服务名称,联系人,联系电话,服务次数,开始时间,结束时间,服务要求,执行负责人,状态,完成情况说明,";
                 
                $keys   = "cemetery_name,service,linkmane,linkphone,serviceamount,begindate,enddate,vcnote,nickname,resutlstatus,execnote";
                foreach($data as $k=>$v)
		{
			 $data[$k]['resutlstatus'] =$v["resutlstatus"]==1 ? "未完成":"已经完成"; 
		 
		}
                action_log('导出', '工作任务报表');
        
             export_excel($titles, $keys, $data, '工作任务明细表');
		 
		 
	}
        
        public function  get_Service_info_ajax($where = [],$field="*")
        {
            return $this->modelServicebill->getInfo($where,$field);
           
        }
    

}

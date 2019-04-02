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

class Finance extends AdminBase {

    public function getTodaySum($where = [], $stat_type = 'count', $field = 'id') {

        $data = $this->modelFinance->stat($where, $stat_type, $field);
        if (empty($data))
            $data = 0;
        return $data;
    }

    /* 本月为付款金额
     */

    public function getmood_nopaySum($where = [], $stat_type = 'count', $field = 'id') {

        $data = $this->modelFinance->stat($where, $stat_type, $field);
        if (empty($data))
            $data = 0;
        return $data;
    }

    public function sellList($where = [], $field = '*', $order = 'payerdate desc', $paginate = DB_LIST_ROWS) {

        return $this->modelFinance->getList($where, $field, $order, $paginate);
    }

    public function exportFinanceList($where = [], $field = '*', $order = 'payerdate desc') {

        $list = $this->sellList($where, $field, $order, false);
        $financetype = parse_config_array('financetype');
        foreach ($list as $k => $v) {
            $list[$k]['financetype'] = $financetype[$v['financetype']];
            $list[$k]['payerdate'] = date('Y-m-d', $v['payerdate']);
        }
        $titles = "付款人,付款人电话,付款时间,订单类型,实收金额,操作人";
        $keys = "payer,phone,payerdate,financetype,sumprice,operatename";

        action_log('导出', '导出财务列表');

        export_excel($titles, $keys, $list, '财务列表');
    }

    public function getWhere($data = []) {
        $where = [];

        !empty($data['search_data']) && $where['payer|operatename'] = ['like', '%' . $data['search_data'] . '%'];

        return $where;
    }

    public function getWhereSeach($data) {

        if ($data['payer'])
            $where['payer'] = ['like', '%' . $data['payer'] . '%'];

        if ($data['financetype'])
            $where['financetype'] = $data['financetype'];

        if ($data['operatename'])
            $where['operatename'] = ['like', '%' . $data['operatename'] . '%'];

        if ($data['startime'] && empty($data['endtime'])) {
            $where['payerdate'] = [['egt', strtotime($data['startime'])], ['elt', time()], 'AND'];
        }
        if ($data['startime'] && $data['endtime']) {
            $where['payerdate'] = [['egt', strtotime($data['startime'])], ['elt', strtotime($data['endtime'])], 'AND'];
        }
        if (empty($data['startime']) && $data['endtime']) {
            $where['payerdate'] = ['elt', strtotime($data['endtime'])];
        }
        $where[DATA_STATUS_NAME] = ['neq', DATA_DELETE];

        return $where;
    }

    public function monthList() {
        $sql = "select
				sum(case when DATE_FORMAT(FROM_UNIXTIME(payerdate),'%m')='01' then sumprice else 0 end) as '01',
				sum(case when DATE_FORMAT(FROM_UNIXTIME(payerdate),'%m')='02' then sumprice else 0 end) as '02',
				sum(case when DATE_FORMAT(FROM_UNIXTIME(payerdate),'%m')='03' then sumprice else 0 end) as '03',
				sum(case when DATE_FORMAT(FROM_UNIXTIME(payerdate),'%m')='04' then sumprice else 0 end) as '04',
				sum(case when DATE_FORMAT(FROM_UNIXTIME(payerdate),'%m')='05' then sumprice else 0 end) as '05',
				sum(case when DATE_FORMAT(FROM_UNIXTIME(payerdate),'%m')='06' then sumprice else 0 end) as '06',
				sum(case when DATE_FORMAT(FROM_UNIXTIME(payerdate),'%m')='07' then sumprice else 0 end) as '07',
				sum(case when DATE_FORMAT(FROM_UNIXTIME(payerdate),'%m')='08' then sumprice else 0 end) as '08',
				sum(case when DATE_FORMAT(FROM_UNIXTIME(payerdate),'%m')='09' then sumprice else 0 end) as '09',
				sum(case when DATE_FORMAT(FROM_UNIXTIME(payerdate),'%m')='10' then sumprice else 0 end) as '10',
				sum(case when DATE_FORMAT(FROM_UNIXTIME(payerdate),'%m')='11' then sumprice else 0 end) as '11',
				sum(case when DATE_FORMAT(FROM_UNIXTIME(payerdate),'%m')='12' then sumprice else 0 end) as '12' 
				from ky_finance where DATE_FORMAT(FROM_UNIXTIME(payerdate),'%Y')='2018' and paystatus=2 group by DATE_FORMAT(FROM_UNIXTIME(payerdate),'%Y')";
        return $this->modelFinance->query($sql);
    }

    public function get_Finance_allprice_ajax($id) {
        $sql = "select sum(realprice) as zj from " . SYS_DB_PREFIX . "finance where status=1 and sellid=$id group by sellid";
        return $this->modelFinance->query($sql);
    }

    ////获取所有的已经付款的刻字数量
    public function get_Finance_allprice_font_ajax($cid) {
        $sql = "select sum(amount) as sl  from " . SYS_DB_PREFIX . "sell s  inner join " . SYS_DB_PREFIX . "finance f on s.id=f.sellid 
where s.cid=$cid and   (f.financetype=11 or f.financetype=12) and  s.status=1 and f.`status`=1 
GROUP BY s.cid ";
        return $this->modelFinance->query($sql);
    }

    public function get_Finance_info_ajax($where = [], $field = "*") {
        return $this->modelFinance->getInfo($where, $field);
    }

    //////增加销售科目表
    public function add_Finance( $data = []) {
        $member = session('member_info');
        $data["operate"]=MEMBER_ID;
        $data["operatename"]=$member['nickname'];
        return $this->modelFinance->addInfo($data);
    }
     public function Finance($orderNO,$cid,$tid,$paytype, $financetype,$paystatus, $sellprice, $realprice, $amount = 1, $unitprice = 0.00, $selltitle = "费用名称",$selltitleid=0, $isvoice=1,$kmtype=1,$vcnote = "") {
        $member = session('member_info');
          $sellFinanceData = array(
                    'orderNO' => $orderNO, ////财务单号
                    'cid' => $cid,
                    'tid' => $tid,
                    'paytype' => $paytype,
                    'financetype' => $financetype,
                    'paystatus' => $paystatus,
                    'sellprice' => $sellprice,
                    'realprice' =>$realprice,
                    'offerprice'=> $sellprice-$realprice,
                    'amount' => $amount,
                    'unitprice' => $unitprice,
                    'selltitle' => $selltitle,
                    'selltitleid' => $selltitleid,
                    'operate' => MEMBER_ID,
                    'operatename' => $member['nickname'],
                    'isvoice' => $isvoice,
                    'vcdesc' => $vcnote,
                    'kmtype' => $kmtype,
                    'status' => 1
                    
                );
       
        return $this->modelFinance->addInfo($sellFinanceData);
    }
    
     
    //////增加修改收费记录
    public function update_Finance_paystatus($where = [], $data = []) {
        $member = session('member_info');
        $data["operate"]=MEMBER_ID;
        $data["operatename"]=$member['nickname'];
       
        return $this->modelFinance->updateInfo($where,$data);
    }
      
    

}

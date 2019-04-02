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

namespace app\admin\controller;

/**
 * 首页控制器
 */
class Index extends AdminBase
{
     /**
     * 首页方法
     */
    public function index()
    {
		//1525743006
        //今日销售额
		//$begintime=strtotime(date("Y-m-d H:i:s",mktime(0,0,0,date('m'),date('d'),date('Y'))));
		//$endtime=strtotime(date("Y-m-d H:i:s",mktime(0,0,0,date('m'),date('d')+1,date('Y'))-1));
                $BeginDate1= date('Y-m-01', strtotime(date("Y-m-d")));
                $endDate=strtotime(date('Y-m-d', strtotime("$BeginDate1 +1 month -1 day")));
                $BeginDate= strtotime(date('Y-m-01', strtotime(date("Y-m-d"))));
		$where_noFinance = array(
			'create_time'=>array(array('egt',$BeginDate),array('elt',$endDate),'AND'),
			'paystatus'=>3
		);
                $where_Finance = array(
			'create_time'=>array(array('egt',$BeginDate),array('elt',$endDate),'AND'),
			'paystatus'=>2
		);
             $where_bill = array(
			 'resutlstatus'=>1
                      //  'sellID'=>array('in',"select id from ky_sell where orderstatus=4 and status=1")
		);
                ////
                 
                ////
		$this->assign('nofinance',$this->logicFinance->getTodaySum($where_noFinance,'sum','realprice'));
                $this->assign('finance',$this->logicFinance->getTodaySum($where_Finance,'sum','realprice'));
                $this->assign('bill',0);
		//$this->assign('bill',//$this->logicServicebill->get_billStat());
		//$sell = $this->logicSell->getExpire();
		//$this->assign('sellExpire',count($sell));
		$this->assign('cemetery',$this->logicCemetery->getStat(['usestatus'=>1]));
		//$this->assign('servicebill',$this->logicServicebill->getServicebillList(['resutlstatus'=>1],'a.*','a.create_time desc',6));
		 
		
		return $this->fetch('index');
    }
    
    /////获取最近10天的数据
    public function getindexajax(){
	
		if(IS_POST)
			{
			   $date["status"]=1;
			   $date["result"]=$this->logicindex->getyeardateajax();
			   exit(json_encode($date));
			}
	}
        
        public function getcemeteryajax()
        {
          if(IS_POST)
                {
                   $date["status"]=1;
                   $date["result"]=$this->logicindex->getcemetery();
                   exit(json_encode($date));
                }  
        }
    
    
}

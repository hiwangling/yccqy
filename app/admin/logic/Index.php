<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

namespace app\admin\logic;

/**
 * Description of I
 *
 * @author Administrator
 */
class Index extends AdminBase
{
    
     
    ////得到最近10天的数据
    public function getyeardateajax()
    {
        $listData=array(); 
        $listnum=array();
        $last10=strtotime("-30 day");
		$sql="select  DATE_FORMAT(FROM_UNIXTIME(payerdate),'%m-%d') as payerdate,SUM(realprice) as sumprice FROM ky_finance where payerdate>$last10 and paystatus=2 group by  DATE_FORMAT(FROM_UNIXTIME(payerdate),'%m-%d')";
		$finance = $this->modelFinance->query($sql);
		$finance_payerdate = array_column($finance, 'payerdate');
		$addData = array();
		for ($index = 0; $index <11; $index++) {
           $date= date("m-d", $last10+$index*86400);
          if(!in_array($date,$finance_payerdate)){
		   		$addData[$index] = array('payerdate'=>$date,'sumprice'=>0);
		  }
        }
		$finance = array_merge($addData,$finance);
		$financeData = $this->arraySequence($finance,'payerdate','SORT_ASC');
		foreach($financeData as $k=>$v){
			$listData[]= $v['payerdate'];
			$listnum[]=$v['sumprice'];
		}
        $datelsit["datetime"]=$listData;
        $datelsit["ordernumber"]=$listnum;
        return $datelsit;
    }
    
    public  function getcemetery()
    {
        $listData=array(); 
        $listnum=array();
        $last10=strtotime("-10 day");
        for ($index = 0; $index <11; $index++) {
           $listData[]= date("m-d", $last10+$index*86400);
           $listnum[]=rand(100,1000);
        }
        $datelsit["datetime"]=$listData;
        $datelsit["ordernumber"]=$listnum;
        return $datelsit;
    }
    
     function arraySequence($array, $field, $sort = 'SORT_DESC')
	{
		$arrSort = array();
		foreach ($array as $uniqid => $row) {
			foreach ($row as $key => $value) {
				$arrSort[$key][$uniqid] = $value;
			}
		}
		array_multisort($arrSort[$field], constant($sort), $array);
		return $array;
	}
  
    
 
}
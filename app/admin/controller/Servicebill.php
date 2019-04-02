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

class Servicebill extends AdminBase
{

    public function Index()
    {
        
 
		 $where = $this->logicServicebill->getSeachWhere($this->param);
                if (empty($this->param["resutlstatus"]))
                    $this->param["resutlstatus"]=0;
                if (empty($this->param["servicetype"]))
                    $this->param["servicetype"]=0;
		//$where['a.resutlstatus'] = ['eq',1];
		
		 $this->assign('servicetype', parse_config_array('servicetype'));
                $this->assign('formcs', $this->param);
		
		$this->assign('list', $this->logicServicebill->getServicebillList($where,'a.*','a.create_time desc'));
		
        return $this->fetch('servicebill_list');
    }
	
	 public function overList()
    {
        $where = $this->logicServicebill->getWhere($this->param);
		
		$where['a.resutlstatus'] = ['eq',2];
		
		$this->assign('servicetype', parse_config_array('servicetype'));
		
		$this->assign('list', $this->logicServicebill->getServicebillList($where,'a.*','a.create_time desc'));
		
        return $this->fetch('servicebill_list');
    }
	
	public function ServicebillInfo($id = 0){
	
		//IS_POST && $this->jump($this->logicServicebill->ServicebillOver($id));
		
		$info = $this->logicServicebill->getServicebillInfo(['a.id' => $this->param['id']]);
		
		$branch = $this->logicServicebill->getBranchList();
		
		$this->assign('info',$info);
		
		$this->assign('branch',json_encode($branch));

		return $this->fetch('servicebill_over');
	}
	
	public function seach(){
	
		//$where = $this->logicServicebill->getWhere($this->param);
		$where = [];
		
		if(IS_POST)$where = $this->logicServicebill->getSeachWhere($this->param);
		
		$this->assign('servicetype', parse_config_array('servicetype'));
		
		$this->assign('list', $this->logicServicebill->getServicebillList($where,'a.*','a.create_time desc'));
		
		return $this->fetch('servicebill_seach');
	}
	
	public function ServicebillOver(){
	
		IS_POST && $this->jump($this->logicServicebill->ServicebillOver($this->param));
	}
	
	public function servicebillDel($id = 0) {

        $this->jump($this->logicServicebill->ServicebillDel(['id' => $id]));
    }
        public function get_service_hrm_ajax( )
        {
           
           $info=$this->logicMember->getMemberList_byserviceid(['m.status'=>['eq',1],'b.id'=> $this->param['id']], 'm.id,m.nickname','m.create_time desc',false);
           $info=json_decode(json_encode($info),true);
            $result=array("code"=>0,"msg"=>"","count"=>0,"data"=>$info) ;
          exit(json_encode($result));
        }
        public function show_service_over_ajax()
        {
            //$Serviceinfo =$this->logicSell->getServicebillInfo($this->param['id']);
             $info = $this->logicServicebill->getServicebillInfo(['a.id' => $this->param['id']]);
             $sellinfo =$this->logicSell->get_sellinfo($info["sellID"]);
             $where["sellID"]=$info["sellID"];
             $Bury =$this->logicBury->get_Bury_info($where,"*"); 
             /////
             $this->view->engine->layout(false);
             $this->assign('info',$info);
           $this->assign('Bury',$Bury);
         $this->assign('sellinfo',$sellinfo);
 
         $infohtml=$this->fetch("servicebill_submit");
        
         $result = array("code" => 0, "msg" => "", "data" => $infohtml);  
         
        exit(json_encode($result));   
        
        
        }
        public function upate_service_over_ajax()
        {   
             $result=$this->logicServicebill->upate_service_over_ajax($this->param); 
           
           if (!$result)
                $retrunval=array("code"=>1,"msg"=>"更新错误") ;
           else
              $retrunval=array("code"=>0,"msg"=>"提交成功") ;
          exit(json_encode($retrunval));
        }
       
        
       
    
        
        public function showserviceinfo()
        {
                $info = $this->logicServicebill->getServicebillInfo(['a.id' => $this->param['id']]);
		 $this->assign('data',$info);
                 $this->view->engine->layout("layout_nomenu");
		 return $this->fetch('showserviceinfo'); 
        }
        
        public function export_execl()
        {
             $where = $this->logicServicebill->getSeachWhere($this->param);
                if (empty($this->param["resutlstatus"]))
                    $this->param["resutlstatus"]=0;
		 
		$date=$this->logicServicebill->getServicebillList($where,'a.*','a.create_time desc',FALSE);
	 $this->logicServicebill->exportserviceList($date);  
            
        }
        
        
    
}

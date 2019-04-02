<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

namespace app\admin\controller;

/**
 * Description of Jxcorder
 *
 * @author Administrator
 */
class Jxcorder extends AdminBase
{
   /**
     * 单位列表列表
     */
    public function instoragelist()
    {
            $storageinfo=$this->logicJxcstorage->get_userid_storageid(MEMBER_ID);
            if ($storageinfo===false)
            {
                $this->jump(RESULT_ERROR,"操作人没有指定仓库，请在人员表中指定仓库信息",url("index/index"));
            }
           
         $where['sid']=$storageinfo["id"];
           $where['orderlb']=1;
          if (!empty($this->param["search_data"])) {
            $where['orderNO|operatename'] = ['like', '%' . $this->param["search_data"] . '%'];  
          }
          if (!empty($this->param["supplier"])) {
            $where['supplier'] = $this->param["supplier"];
        } else {
            $this->param["supplier"] = 0;
        }
          ////
        if (empty($this->param["begindate"])) {
            $this->param["begindate"] = date("Y-m-d", strtotime("-30 day"));
           
        }

        if (empty($this->param["enddate"])) {
            $this->param["enddate"] = date("Y-m-d");
        }
               $where['orderdate']=  array('BETWEEN',array($this->param["begindate"],$this->param["enddate"]));
                $this->assign('supplier', $this->logicJxcsupplier->get_supplier($storageinfo["id"])); 
	       $this->assign('list', $this->logicJxcorder->orderList($where));
	$this->assign('formcs', $this->param);
                return $this->fetch('instoragelist');
    }
    
    
    public function JxcorderAddinstorage_ajax()
    {
         $storageinfo=$this->logicJxcstorage->get_userid_storageid(MEMBER_ID);
          if(empty($storageinfo)) 
        {
            $result = array("code" => 1, "msg" => "操作人没有指定仓库，请在人员表中指定仓库信息");
             exit(json_encode($result));  
        }
         $this->assign('supplier', $this->logicJxcsupplier->get_supplier($storageinfo["id"])); 
         $this->assign('member',session('member_info'));
          $this->assign('product', $this->logicJxcproduct->get_product()); 
          
          $this->assign('orderdate', date("Y-m-d"));
            $this->assign('storageinfo', $storageinfo);
         $infohtml=$this->fetch("instorage_add");
         $result = array("code" => 0, "msg" => "", "data" => $infohtml);  
         
        exit(json_encode($result)); 
      
    }
    
     public function Jxcordersaveinstorage_ajax()
     {
          $sid = isset($this->param['sid']) ? $this->param['sid'] : FALSE;
        if ($sid == FALSE) {
            $returndate = array("code" => 1, "msg" => "参数错误");
            exit(json_encode($returndate));
        }
        $reselt = $this->logicJxcorder->Jxcordersaveinstorage($this->param );
        ////
        if ($reselt !== FALSE) {
            $returndate = array("code" => 0, "msg" => "提交成功", "data" => $reselt);
        } else {
            $returndate = array("code" => 1, "msg" => "提交失败", "data" => "");
        }

        exit(json_encode($returndate));
     }
     
     public function showinstorage_ajax( )
     {
        $id = isset($this->param['id']) ? $this->param['id'] : FALSE;
        if ($id == FALSE) {
            $returndate = array("code" => 1, "msg" => "参数错误");
            exit(json_encode($returndate));
        }
         $storageinfo=$this->logicJxcstorage->get_userid_storageid(MEMBER_ID);
          if(empty($storageinfo)) 
        {
            $result = array("code" => 1, "msg" => "操作人没有指定惭愧，请在人员表中指定仓库信息");
             exit(json_encode($result));  
        }
         $this->assign('supplier', $this->logicJxcsupplier->get_supplier($storageinfo["id"])); 
           $where["ordertype"]=array('in','1,2');
           $where["a.id"]=$id;
           $info= $this->logicJxcorder->orderList($where,"a.*","id",FALSE);
           if (empty($info))
             {
                 $result = array("code" => 1, "msg" => "参数错误,没有出库单");
                exit(json_encode($result));  
        }   
             $this->assign('info', $info[0]);
          
          $where1["orderid"]=$id;
          
	  $this->assign('orderdetaillist', $this->logicJxcorderdetail->orderdetailList($where1,"a.*","id",FALSE));
            
        
         $this->assign('product', $this->logicJxcproduct->get_product()); 
         $this->assign('orderdate', date("Y-m-d"));
         $this->assign('storageinfo', $storageinfo);
         
         $infohtml=$this->fetch("instorage_show");
         $result = array("code" => 0, "msg" => "", "data" => $infohtml);  
         
        exit(json_encode($result));  
     }
     /**
     * 墓穴样式类型编辑
     */
    public function JxcorderEdit()
    {
        
        IS_POST && $this->jump($this->logicJxcorder->JxcorderEdit($this->param));
        
        $info = $this->logicJxcorder->getJxcorderInfo(['id' => $this->param['id']]);
            $this->assign('storag', $this->logicJxcstorage->get_storag());
        $this->assign('info', $info);
        
        return $this->fetch('jxccustome_edit');
    }
    
   //////////////////
 
      public function outstoragelist()
    {
            
               $storageinfo=$this->logicJxcstorage->get_userid_storageid(MEMBER_ID);
            if ($storageinfo===false)
            {
                $this->jump(RESULT_ERROR,"操作人没有指定仓库，请在人员表中指定仓库信息",url("index/index"));
            }
           
         $where['sid']=$storageinfo["id"];
           $where['orderlb']=2;
          if (!empty($this->param["search_data"])) {
            $where['orderNO|operatename'] = ['like', '%' . $this->param["search_data"] . '%'];  
          }
          if (!empty($this->param["custome"])) {
            $where['custome'] = $this->param["custome"];
        } else {
            $this->param["custome"] = 0;
        }
          ////
        if (empty($this->param["begindate"])) {
            $this->param["begindate"] = date("Y-m-d", strtotime("-30 day"));
           
        }

        if (empty($this->param["enddate"])) {
            $this->param["enddate"] = date("Y-m-d");
        }
               $where['orderdate']=  array('BETWEEN',array($this->param["begindate"],$this->param["enddate"]));
               $this->assign('custome', $this->logicJxccustome->get_custome($storageinfo["id"])); 
            //   $where = $this->logicJxcorder->getWhere($this->param);
             $this->assign('formcs', $this->param);
	       $this->assign('list', $this->logicJxcorder->outstorageList($where));
		
                return $this->fetch('outstorage');
    }
    
     public function JxcorderAddoutstorage_ajax()
    {
         $storageinfo=$this->logicJxcstorage->get_userid_storageid(MEMBER_ID);
          if(empty($storageinfo)) 
        {
            $result = array("code" => 1, "msg" => "操作人没有指定仓库，请在人员表中指定仓库信息");
             exit(json_encode($result));  
        }
         $this->assign('custome', $this->logicJxccustome->get_custome($storageinfo["id"])); 
         $this->assign('member',session('member_info'));
          $this->assign('product', $this->logicJxcproduct->get_product()); 
          
          $this->assign('orderdate', date("Y-m-d"));
            $this->assign('storageinfo', $storageinfo);
         $infohtml=$this->fetch("outstorage_add");
         $result = array("code" => 0, "msg" => "", "data" => $infohtml);  
         
        exit(json_encode($result)); 
      
    }
    
      public function Jxcordersaveoutstorage_ajax()
     {
          $sid = isset($this->param['sid']) ? $this->param['sid'] : FALSE;
        if ($sid == FALSE) {
            $returndate = array("code" => 1, "msg" => "参数错误");
            exit(json_encode($returndate));
        }
        $reselt = $this->logicJxcorder->Jxcordersaveoutstorage($this->param );
        ////
        if ($reselt !== FALSE) {
            $returndate = array("code" => 0, "msg" => "提交成功", "data" => $reselt);
        } else {
            $returndate = array("code" => 1, "msg" => "提交失败", "data" => "");
        }

        exit(json_encode($returndate));
     }
     
      public function showoutstorage_ajax( )
     {
        $id = isset($this->param['id']) ? $this->param['id'] : FALSE;
        if ($id == FALSE) {
            $returndate = array("code" => 1, "msg" => "参数错误");
            exit(json_encode($returndate));
        }
         $storageinfo=$this->logicJxcstorage->get_userid_storageid(MEMBER_ID);
          if(empty($storageinfo)) 
        {
            $result = array("code" => 1, "msg" => "操作人没有指定惭愧，请在人员表中指定仓库信息");
             exit(json_encode($result));  
        }
      
          
           $where["a.id"]=$id;
           $info= $this->logicJxcorder->outstorageList($where,"a.*","id",FALSE);
           if (empty($info))
             {
                 $result = array("code" => 1, "msg" => "参数错误,没有出库单");
                exit(json_encode($result));  
        }   
             $this->assign('info', $info[0]);
          
          $where1["orderid"]=$id;
	  $this->assign('orderdetaillist', $this->logicJxcorderdetail->orderdetailList($where1,"a.*","id",FALSE));
          
         $this->assign('storageinfo', $storageinfo);
         
         $infohtml=$this->fetch("outstorage_show");
         $result = array("code" => 0, "msg" => "", "data" => $infohtml);  
         
        exit(json_encode($result));  
     }
     
    /////////////////
     public function bclist()
     {
         $storageid=0;
          $storageinfo=$this->logicJxcstorage->get_userid_storageid(MEMBER_ID);
           if(!empty($storageinfo)) 
        {
           $storageid=$storageinfo["id"];
        }
        $where = [];
          if (!empty($this->param["search_data"])) {
            $where['p.sn|p.name'] = ['like', '%' . $this->param["search_data"] . '%'];  
          }
          

        if (!empty($this->param["category"])) {
            $where['p.category'] = $this->param["category"];
        } else {
            $this->param["category"] = 0;
        }
        if (empty($this->param["storage"])) {
           $this->param["storage"] = $storageid;
        }

       
        ////
         if (empty($this->param["begindate"])) {
            $this->param["begindate"] = date("Y-m-d", strtotime("-30 day"));
        }

        if (empty($this->param["enddate"])) {
            $this->param["enddate"] = date("Y-m-d");
        }
          $this->assign('storagelsit', $this->logicJxcstorage->get_storag());
          $this->assign('category', $this->logicJxccategory->get_parent());
        
   
         $list=$this->logicJxcorder->get_bcList($where, $this->param["begindate"],$this->param["enddate"],$storageid);
        
         $this->assign('list',$list);
         $this->assign('formcs', $this->param);
        return $this->fetch('bclist');
     }
     
     public function  exportselllist_execl()
     {
        $storageid=0;
          $storageinfo=$this->logicJxcstorage->get_userid_storageid(MEMBER_ID);
           if(!empty($storageinfo)) 
        {
           $storageid=$storageinfo["id"];
        }
        $where = [];
          if (!empty($this->param["search_data"])) {
            $where['p.sn|p.name'] = ['like', '%' . $this->param["search_data"] . '%'];  
          }
          

        if (!empty($this->param["category"])) {
            $where['p.category'] = $this->param["category"];
        } else {
            $this->param["category"] = 0;
        }
        if (empty($this->param["storage"])) {
           $this->param["storage"] = $storageid;
        }

       
        ////
        if (empty($this->param["begindate"])) {
            $this->param["begindate"] = date("Y-m-d", strtotime("-30 day"));
        }

        if (empty($this->param["enddate"])) {
            $this->param["enddate"] = date("Y-m-d");
        }
          $this->assign('storagelsit', $this->logicJxcstorage->get_storag());
          $this->assign('category', $this->logicJxccategory->get_parent());
        
   
         $list=$this->logicJxcorder->get_bcList($where, $this->param["begindate"],$this->param["enddate"],$storageid);
      $storageInfo=$this->logicJxcstorage->getJxcstorageInfo(["id"=>$storageid],"*"); 
       $this->logicJxcorder->export_bc($list,$this->param["begindate"],$this->param["enddate"],$storageInfo);
     }

     ///////////
    public function JxcorderDel($id = 0)
    {
        $this->jump($this->logicJxcorder->JxcorderDel($id));
    }
}


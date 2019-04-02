<?php

namespace app\admin\controller;

/**
 * 墓穴控制器
 */
class Cemetery extends AdminBase {

    /**
     * 墓穴列表
     */
    public function CemeteryList() {
        
         $where = $this->logicCemetery->getWhere($this->param);
        
	if (!empty($this->param["usestatus"]))  
        {
            $where['a.usestatus'] = $this->param["usestatus"];
        }
        else
            $this->param["usestatus"] = 0;
        if (!empty($this->param["gardenID"])) 
        {
            $where['a.gardenID'] = $this->param["gardenID"];
        }
        else
        {
              $this->param["gardenID"] = 0;
        }
        if (!empty($this->param["areaID"]))  
        {
            $where['a.areaID'] = $this->param["areaID"];
        }
        else
             $this->param["areaID"] = 0;
         if (!empty($this->param["typeID"]))  
        {
            $where['a.typeID'] = $this->param["typeID"];
        }
        else
             $this->param["typeID"] = 0;
         if (!empty($this->param["styleID"]))  
        {
            $where['a.styleID'] = $this->param["styleID"];
        }
        else
              $this->param["styleID"] = 0;
        
        $this->assign('list', $this->logicCemetery->getCemeteryList($where,'a.*,g.name as garden_name,r.name as area_name,t.name as type_name,s.name as style_name', 'a.create_time desc'));
	
		$this->assign('gardenlist', $this->logicCemeteryGarden->getCemeteryGardenList(NULL,NULL,NULL,false));
		
		//$this->assign('arealist', $this->logicCemeteryArea->getCemeteryAreaList(NULL,'a.*,g.name as garden_title','a.name',false));
                
                if ( $this->param["gardenID"] >0)
                {
                    $this->assign('arealist', $this->logicCemeteryArea->getCemeteryAreaList(["gardenID"=>$this->param["gardenID"]],'a.*,g.name as garden_title','a.name',false));
                }
                else
                {
                    $arealist1=array();
                    $this->assign('arealist',$arealist1);
                }
		$this->assign('typelist', $this->logicCemeteryType->getCemeteryTypeList(NULL,NULL,NULL,false));
		
		$this->assign('stypelist', $this->logicCemeteryStyle->getCemeteryStyleList(NULL,NULL,NULL,false));
			
        $this->assign('formcs', $this->param);		
        $this->assign('usestatus', parse_config_array('usestatus'));
		
        return $this->fetch('cemetery_list');
    }

    ////增加显示界面
    public function cemeteryAdd_ajax_show() {
        $this->view->engine->layout(false);
        $this->getCemeteryCommonData();
        $infohtml = $this->fetch("cemetery_add");
        $result = array("code" => 0, "msg" => "", "data" => $infohtml);
        exit(json_encode($result));
    }

    /////增加处理页面
    public function cemeteryAdd_ajax_submit() {
        $result = $this->logicCemetery->CemeteryAdd($this->param);
        exit(json_encode($result));
    }
    
    ////批量增加显示界面
    public function cemeteryBatchAdd_ajax_show() {
        $this->view->engine->layout(false);
        $this->getCemeteryCommonData();
        $infohtml = $this->fetch("cemeterybatchAdd");
        $result = array("code" => 0, "msg" => "", "data" => $infohtml);
        exit(json_encode($result));
    }

    /////批量增加处理
    public function cemeteryBatchAdd_ajax_submit() {
        $result = $this->logicCemetery->CemeterybatchAdd($this->param);
        exit(json_encode($result));
    }
    

    ///编辑页面
    public function cemeteryEdit_ajax_show() {
        if (empty($this->param['cid'])) {
            $result = array("code" => 1, "msg" => "参数错误");
            exit(json_encode($result));
        }
        $this->getCemeteryCommonData();
        $info = $this->logicCemetery->getCemeteryInfo(['id' => $this->param['cid']]);
        $this->assign('info', $info);
        $this->view->engine->layout(false);
        $infohtml = $this->fetch("cemetery_edit");
        $result = array("code" => 0, "msg" => "", "data" => $infohtml);
        exit(json_encode($result));
    }

    ///编辑处理
    public function cemeteryEdit_ajax_submit() {
        if (empty($this->param['id']) || $this->param['id'] == "0") {
            $result = array("code" => 1, "msg" => "参数错误");
            exit(json_encode($result));
        }
        $result = $this->logicCemetery->CemeteryEdit($this->param);
        exit(json_encode($result));
    }

    /**
     * 墓穴删除
     */
    public function CemeteryDel($id = 0) {

        $this->jump($this->logicCemetery->CemeteryDel(['id' => $id]));
    }
    
    /**
     * 根据墓园查询墓区
     * @return type
     */
    public function getArea() {

        if (IS_POST)
            return $this->logicCemeteryArea->getCemeteryAreaList(['a.gardenID' => $this->param['gardenID']], 'a.id,a.name', 'a.create_time desc', false);
    }
    
    /**
     * 取得页面相关下拉列表框信息
     */
    public function getCemeteryCommonData()
    {
        
        $usestatus = parse_config_array('usestatus');
		
		$where[DATA_STATUS_NAME] = ['neq', DATA_DELETE];
		
		$order = "create_time desc";
		
        $this->assign('garden', $this->logicCemeteryGarden->getCemeteryGardenList($where, 'id ,name',$order,false));
		
        $this->assign('area', $this->logicCemeteryArea->getCemeteryAreaList(['a.status'=>['neq',-1]], 'a.id ,a.name','a.create_time',false));

        $this->assign('type', $this->logicCemeteryType->getCemeteryTypeList($where, 'id ,name',$order,false));

        $this->assign('style', $this->logicCemeteryStyle->getCemeteryStyleList($where, 'id ,name',$order,false));
		
        $this->assign('usestatus', $usestatus);
        
    }
    
  public function getCemeteryList_ajax() {

       $request = $this->param = $this->request->param();
 
        $where['usestatus'] = 1;

        if (!empty($request['param']['vno']))
            $where['a.name'] = array('like', "%{$request['param']['vno']}%");

        if (!empty($request['param']['gardenID']))
            $where['a.gardenID'] = $request['param']['gardenID'];

        if (!empty($request['param']['areaID']))
            $where['a.areaID'] = $request['param']['areaID'];

        if (!empty($request['param']['typeID']))
            $where['a.typeID'] = $request['param']['typeID'];

        if (!empty($request['param']['style']))
            $where['a.styleID'] = $request['param']['style'];

        //  if (!empty($request['usestatus']))
        if (empty($request['param']['limit']))
            $request['param']['limit'] = 100;

       //var_dump($where);
        $list = $this->logicCemetery->getCemeteryList($where, 'a.*,g.name as garden_name,r.name as area_name,t.name as type_name,s.name as style_name', 'a.create_time desc', $request['param']['limit']);
        //var_dump(json_decode(json_encode($list))->data);
        $data = array(
            'code' => 0,
            'msg' => '',
            'count' => json_decode(json_encode($list))->total,
            'data' => json_decode(json_encode($list))->data
        );
       exit(json_encode($list));
    }

     public function getCemeteryGarden_ajax() {
          $res ="SELECT name,id FROM ky_cemetery_garden";
          $list = $this->logicCemetery->query($res);
         exit(json_encode($list));
     }
     public function getCemeteryArea_ajax() {
          $id = input('post.id');
          $where['a.gardenID'] = $id;
          $list =$this->logicCemeteryArea->getCemeteryAreaList($where);
         exit(json_encode(json_decode(json_encode($list))->data));
     }
     public function getCemeterytype_ajax() {
          $res ="SELECT name,id from ky_cemetery_type";
          $list = $this->logicCemetery->query($res);
         exit(json_encode($list));
     }
     public function getCemeteryStyle_ajax() {
          $res ="select name,id from ky_cemetery_style";
          $list = $this->logicCemetery->query($res);
         exit(json_encode($list));
     }
    
}

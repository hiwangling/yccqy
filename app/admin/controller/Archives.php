<?php

/*
 * 档案管理
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

namespace app\admin\controller;

/**
 * Description of Archives
 *
 * @author Administrator
 */
class Archives extends AdminBase {
    //put your code here
    
   public function Archives_show_ajax()
   {
       ////////公墓信息//////////
     if (empty($this->param['cid'])) {
            $result = array("code" => 1, "msg" => "参数错误");
            exit(json_encode($result));
        }
        $info = $this->logicCemetery->getCemeteryList(['a.id' => $this->param['cid']], "a.*,g.name as gardename ,r.name as areaname,t.name as typename , s.name as stylename", null, 1);
      
        if (empty($info[0])) {
            $result = array("code" => 1, "msg" => "参数错误");
            exit(json_encode($result));
        }
        $this->assign('info', $info[0]);
          if (!empty($info[0]["monumenhtml"])) {
                $mbhtml = htmlspecialchars_decode(html_entity_decode($info[0]["monumenhtml"], ENT_QUOTES, "UTF-8"));
                $mbhtml_b = htmlspecialchars_decode(html_entity_decode($info[0]["monumenhtml_b"], ENT_QUOTES, "UTF-8"));
               }else {
                  $mbhtml = $this->fetch("monumen/monument");
                $mbhtml_b = $this->fetch("monumen/monument_b");
            }
          
        ///获取死者信息//////
         $this->assign('info', $info[0]);
         $this->assign('iseditmb', 1);
         $this->assign('mbhtml', $mbhtml);
         $this->assign('mbhtml_b', $mbhtml_b);
        ///////////墓主的信息/////////////
        $Buryinfo = $this->logicBury->getBuryList(["a.cid" => $this->param['cid']], "a.* ", "sort", FALSE);
        $this->assign('Buryinfo', $Buryinfo);
        
        ///////////财务数据信息/////////////
        $sellwhere["cid"] = $this->param['cid'];
        $selllist = $this->logicSell->getSellList_all($sellwhere, "*", "a.create_time", FALSE); ///获取购墓的记录
        $this->assign('selllist', $selllist);
         ///////////联系人信息/////////////
        $linkman = $this->logiclinkman->getlinkmanList($sellwhere, "*", "create_time", FALSE); ///获取购墓的记录
        $this->assign('linkman',  $linkman);
        $this->view->engine->layout(false);
        $infohtml = $this->fetch("archives_list");
        $result = array("code" => 0, "msg" => "", "data" => $infohtml);
        exit(json_encode($result)); 
   }
   
   public function Linkman_delete_ajax() {
       if (empty($this->param['id'])) {
            $result = array("code" => 1, "msg" => "参数错误");
            exit(json_encode($result));
        }
        $result = $this->logicLinkman->LinkmanDel($this->param);
        
        exit(json_encode($result));
       
   }
}

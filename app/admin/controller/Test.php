<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

namespace app\admin\controller;

/**
 * Description of Test
 *
 * @author Administrator
 */
class Test extends AdminBase {
    //put your code here
    public function index()
    { 
         if (date('H', time())>=17)
        {
            $rq = date("Y-m-d");
        }
        else
        {
            $rq =date("Y-m-d",strtotime("-1 day"));
        }
       
      return $this->fetch('index');  
    }
    
   public function show_ajax()
   {
       $this->view->engine->layout(false);
        $infohtml = $this->fetch("test");
        $result = array("code" => 0, "msg" => "", "data" => $infohtml);
        exit(json_encode($result));
   }
    private function testarray($menu_list = [])
    {
        foreach ($menu_list as $key => $menu_info) {
            
            if (  !empty($menu_info['is_hide'])) {
                
                unset($menu_list[$key]);
            }
        }
        
        return $menu_list;
    }
}

<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

namespace app\admin\logic;

/**
 * Description of Lightplan
 *
 * @author Administrator
 */
class Lightplan extends AdminBase {
    //put your code here
    //////获取点灯计划表
    
   public function getlightplanInfo($where = [], $field = true) {

        return $this->modelLightplan->getInfo($where, $field);
       
         
    }

}

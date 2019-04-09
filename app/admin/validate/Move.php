<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

namespace app\admin\validate;

/**
 * Description of Move
 *
 * @author Administrator
 */
class Move extends AdminBase {
     // 验证规则
    protected $rule = [
        'buyer' => 'require',
        'phone' => 'require',
        'cid' => 'require',
       
    ];
    // 验证提示
    protected $message = [
        'buyer.require' => '购买人不能为空',
       
         'cid.require' => '墓穴不能为空',
        'phone.require' => '电话不能为空',
    ];
    // 应用场景
    protected $scene = [
        'edit' => ['buyer', 'phone', 'cid','lightdate'],
    ];

}

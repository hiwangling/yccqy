<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

namespace app\admin\validate;

/**
 * Description of Bury
 *
 * @author Administrator
 */
class Bury extends AdminBase {

    // 验证规则
    protected $rule = [
        'buyer' => 'require',
        'phone' => 'require',
        'cid' => 'require',
          'vcname' => 'require',
        'bid' => 'require',
        'bury'=>'require|date'
    ];
    // 验证提示
    protected $message = [
        'buyer.require' => '安葬联系人不能为空',
          'vcname.require' => '墓主不能不能为空',
        'cid.require' => '墓穴不能为空',
        'bid.require' => '墓主不能为空',
        'phone.require' => '电话不能为空',
         'bury.require' => '安葬日期不能为空',
          'bury.date' => '安葬日期必须是有效日期',
    ];
    // 应用场景
    protected $scene = [
        'edit' => ['buyer', 'phone', 'cid', 'bid','bury'],
        'deather' => ['buyer', 'phone', 'cid','vcname'],
    ];

}

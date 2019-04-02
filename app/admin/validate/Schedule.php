<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

namespace app\admin\validate;

/**
 * Description of Schedule
 *
 * @author Administrator
 */
class Schedule extends AdminBase {

    // 验证规则
    protected $rule = [
        'buyer' => 'require',
        'phone' => 'require',
        'ordainbegin' => 'require',
        'ordainend' => 'require',
        'cid' => 'require|number',
        'ordainprice' => 'number',
    ];
    // 验证提示
    protected $message = [
        'buyer.require' => '预定人不能为空',
        'ordainbegin.require' => '预订日期不能为空',
        'ordainend.require' => '预订到期时间不能为空',
        'ordainprice.number' => '订金必须为数字',
        'phone.require' => '电话不能为空',
        'cid.require' => '墓穴不能为空',
        'cid.number' => '墓穴信息错误'
    ];
    // 应用场景
    protected $scene = [
        'edit' => ['buyer', 'phone', 'ordainbegin', 'ordainend', 'cid', 'ordainprice'],
    ];

}

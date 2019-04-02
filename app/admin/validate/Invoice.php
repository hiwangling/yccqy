<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

namespace app\admin\validate;

/**
 * Description of Invoice
 *
 * @author Administrator
 */
class Invoice  extends AdminBase {

    // 验证规则
    protected $rule = [
        'beginno' => 'require|unique:invoice',
        'endno' => 'require|unique:invoice',
        'member' => 'require'
        
    ];
    // 验证提示
    protected $message = [
        'beginno.require' => '发票起始号不能为空',
        'beginno.unique' => '发票起始号已存在',
          'endno.require' => '发票结束号不能为空',
        'endno.unique' => '发票结束号已存在',
        'member.member' => '服务内容不能为空',
 
    ];
    // 应用场景
    protected $scene = [
        'edit' => ['beginno', 'endno', 'member'],
        'add' => ['beginno', 'endno', 'member'],
    ];

}

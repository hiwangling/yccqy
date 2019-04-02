<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

namespace app\admin\validate;

/**
 * Description of Jxcunit
 *
 * @author Administrator
 */
class Jxcunit extends AdminBase
{
    // 验证规则
    protected $rule =   [
        
		'name'              => 'require|unique:jxcunit',
    ];

    // 验证提示
    protected $message  =   [
        
        'name.require'              => '名称不能为空',
        'name.unique'               => '名称已存在',
    ];

    // 应用场景
    protected $scene = [
        
        'edit' =>  ['name'],
		'add' =>  ['name'],
    ];
}


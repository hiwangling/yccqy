<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

namespace app\admin\validate;

/**
 * Description of Jxcorder
 *
 * @author Administrator
 */
class Jxcorder extends AdminBase
{
    // 验证规则
    protected $rule =   [
                'orderNO'              => 'require|unique:jxcorder'
		 
    ];

    // 验证提示
    protected $message  =   [
        
      
        'orderNO.require'              => '编号不能为空',
        'orderNO.unique'               => '编号已存在',
    ];

    // 应用场景
    protected $scene = [
        
        'edit' =>  ['orderNO'],
	 'add' =>  ['orcerNO'],
        
    ];
}

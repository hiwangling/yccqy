<?php 

namespace app\admin\validate;

/**
 * 墓园类型验证器
 */
class CemeteryStyle extends AdminBase
{
    // 验证规则
    protected $rule =   [
        
		'name'              => 'require|unique:cemeteryStyle',
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

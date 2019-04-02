<?php 

// +---------------------------------------------------------------------+
// | OneBase    | [ WE CAN DO IT JUST THINK ]                            |
// +---------------------------------------------------------------------+
// | Licensed   | http://www.apache.org/licenses/LICENSE-2.0 )           |
// +---------------------------------------------------------------------+
// | Author     | Bigotry <3162875@qq.com>                               |
// +---------------------------------------------------------------------+
// | Repository | https://gitee.com/Bigotry/OneBase                      |
// +---------------------------------------------------------------------+

namespace app\admin\validate;

/**
 * 墓区类型验证器
 */
class CemeteryArea extends AdminBase
{
    // 验证规则
    protected $rule =   [
        
		'name'              => 'require|unique:cemeteryArea',
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

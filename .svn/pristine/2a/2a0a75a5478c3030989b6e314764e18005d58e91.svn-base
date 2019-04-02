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
 * 会员验证器
 */
class Member extends AdminBase
{
    
    // 验证规则
    protected $rule =   [
        
        'userno'  => 'require|unique:member',
        'nickname'  => 'require',
        'mobile'    => 'unique:member',
	'branch'    => 'gt:0',
        'password'    => 'require|confirm|length:6,20',
         'old_password'  => 'require',
    ];
    
    // 验证提示
    protected $message  =   [
        
        'userno.require'    => '工号不能为空',
        'userno.unique'     => '工号已存在',
        'nickname.require'    => '姓名不能为空',
        'password.require'    => '密码不能为空',
        'password.confirm'    => '两次密码不一致',
        'password.length'     => '密码长度为6-20字符',
        
        'mobile.unique'       => '手机号已存在',
	'branch'              => '部门不能为空',
    ];

    // 应用场景
    protected $scene = [
        
        'add'   =>  ['userno','nickname','mobile','branch'],
        'edit'  =>  ['userno','nickname','mobile','branch'],
	'uppassword' =>['password','old_password']
    ];
}

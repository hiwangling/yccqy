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
 * 菜单验证器
 */
class Save extends AdminBase {

    // 验证规则
    protected $rule = [
        'deathname' => 'require',
        'buyer' => 'require',
        'phone' => 'require',
        'savebegindate' => 'require',
        'saveenddate' => 'require',
        'saveareaid' => 'require',
        'saveprice' => 'number',
    ];
    // 验证提示
    protected $message = [
        'deathname.require' => '逝者姓名不能为空',
        'buyer.require' => '寄存联系人不能为空',
        'saveareaid.require' => '寄存地点不能为空',
        'savebegindate.require' => '预订日期不能为空',
        'saveenddate.require' => '预订到期时间不能为空',
        'saveprice.number' => '费用必须为数字',
        'phone.require' => '电话不能为空',
    ];
    // 应用场景
    protected $scene = [
        'edit' => ['buyer', 'phone', 'savebegindate', 'saveenddate', 'deathname', 'saveprice'],
    ];

}

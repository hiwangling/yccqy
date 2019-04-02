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
 * 墓园类型验证器
 */
class Serviceinfo extends AdminBase {

    // 验证规则
    protected $rule = [
        'servicename' => 'require|unique:serviceinfo',
        'sellprice' => 'require|number',
        'price' => 'require|number',
        'deptid' => 'gt:0',
        'manager' => 'gt:0',
        'sort' => 'require|number',
    ];
    // 验证提示
    protected $message = [
        'servicename.require' => '名称不能为空',
        'servicename.unique' => '名称已存在',
        'sellprice.require' => '销售价格不能为空',
        'sellprice.number' => '销售价格格式输入错误',
        'price.require' => '最低价格不能为空',
        'price.number' => '最低价格格式输入错误',
        'deptid.gt' => '请选择服务负责部门',
        'manager.gt' => '请选择服务负责人',
        'sort.require' => '排序值不能为空',
        'sort.number' => '排序值必须为数字'
    ];
    // 应用场景
    protected $scene = [
        'edit' => ['servicename', 'price', 'deptid', 'sort'],
        'add' => ['servicename', 'price', 'deptid', 'sort'],
    ];

}

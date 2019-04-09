<?php
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
namespace app\admin\validate;
/**
 * Description of Lightplan
 *
 * @author Administrator
 */
class Lightplan extends AdminBase {

    // 验证规则
    protected $rule = [
        'planname' => 'require',
        'begindate' => 'require',
        'enddate' => 'require'

    ];
    // 验证提示
    protected $message = [
        'planname.require' => '名称不能为空',
        'begindate.require' => '开始时间不能为空',
        'enddate.require' => '结束时间不能为空',

    ];
    // 应用场景
    protected $scene = [
        'edit' => ['planname', 'begindate', 'enddate']
    ];

}
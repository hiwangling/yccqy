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
class Cemetery extends AdminBase
{
    // 验证规则
    protected $rule =   [
		'gardenID'=>'gt:0',
		'areaID'=>'gt:0',
                'typeID'=>'gt:0',
		'styleID'=>'gt:0',
		'price'=>'require|gt:0',
                'ix_begin'=>'number|gt:0',
                
    ];

    // 验证提示
    protected $message  =   [
               
		'gardenID.gt'=>'请选择墓园',
		'areaID.gt'=>'请选择墓区',
		'typeID.gt'=>'请选择墓位类型',
		'styleID.gt'=>'请选择墓穴样式',
		'price.gt'=>'价格不能为空',
		'price.require'=>'价格不能为空',
                 'ix_begin.number'=>'行只能为整数',
                 'ix_begin.gt'=>'行不能为零',
                 'ix_end.number'=>'行只能为整数',
                 'ix_end.gt'=>'行不能为零',
                 'ix_end.number'=>'行只能为整数',
                 'ix_end.gt'=>'行不能为零',
                 
    ];

    // 应用场景
    protected $scene = [
        'edit' =>  ['gardenID','areaID','typeID','styleID','price'],
        'add' =>  [ 'gardenID','areaID','typeID','styleID','price'],
        'batchadd' =>  [ 'gardenID','areaID','typeID','styleID','price','ix_begin','ix_end'],
    ];
}

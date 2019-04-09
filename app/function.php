<?php
        
function getWordstyleType($id) {
    if ($id == 1) {
        return "字体风格";
    } else {
        return "照片风格";
    }
}
/////流程处理的状态
function getisok($state) {
    $html = "";
    switch ($state) {
        case 0:
            $html = "办理中";
            break;
        case 1:
            $html = "不同意";
            break;
          case 2:
            $html = "同意";
            break;
    }
    return $html;
}
////获取预定方式
function getordaintype($id) {
    $depttype = parse_config_array('ordaintype');
    if (array_key_exists($id, $depttype)) {
        return $depttype[$id];
    } else {
        return "无效";
    }
}

////获取单据类型
function getfinancetype($id) {
    $depttype = parse_config_array('financetype');
    if (array_key_exists($id, $depttype)) {
        return $depttype[$id];
    } else {
        return "无效";
    }
}
////获取付款方式
function getPayment($id) {
    $depttype = parse_config_array('Payment');
    if (array_key_exists($id, $depttype)) {
        return $depttype[$id];
    } else {
        return "";
    }
}

function getfinancetype_str($string) {
    $financetype = parse_config_array('financetype');
    $list= explode(",", $string);
    $html="";
    foreach ($list as $value) {
       if ($value!="")
       {
            if (array_key_exists($value, $financetype)) {
                $html.=$financetype[$value].",";
            }  
       }
    }
    return rtrim($html,",");
}
//////安葬的内容
function getburytype($id) {
    $depttype = parse_config_array('burytype');
    if (array_key_exists($id, $depttype)) {
        return $depttype[$id];
    } else {
        return "";
    }
}
//////安葬的风格
function getburystyle($id) {
    $depttype = parse_config_array('burystyle');
    if (array_key_exists($id, $depttype)) {
        return $depttype[$id];
    } else {
        return "";
    }
}

function getBurystatus($id) 
{
     if ($id == 1) {
        return '已安葬';
    } else {
        return '未安葬';
    }
}

function getsex($id) {
    if ($id == 1) {
        return '男';
    } else {
        return '女';
    }
}

function num_to_rmb($num) {
    $c1 = "零壹贰叁肆伍陆柒捌玖";
    $c2 = "分角元拾佰仟万拾佰仟亿";
    //精确到分后面就不要了，所以只留两个小数位
    $num = round($num, 2);
    //将数字转化为整数
    $num = $num * 100;
    if (strlen($num) > 10) {
        return "金额太大，请检查";
    }
    $i = 0;
    $c = "";
    while (1) {
        if ($i == 0) {
            //获取最后一位数字
            $n = substr($num, strlen($num) - 1, 1);
        } else {
            $n = $num % 10;
        }
        //每次将最后一位数字转化为中文
        $p1 = substr($c1, 3 * $n, 3);
        $p2 = substr($c2, 3 * $i, 3);
        if ($n != '0' || ($n == '0' && ($p2 == '亿' || $p2 == '万' || $p2 == '元'))) {
            $c = $p1 . $p2 . $c;
        } else {
            $c = $p1 . $c;
        }
        $i = $i + 1;
        //去掉数字最后一位了
        $num = $num / 10;
        $num = (int) $num;
        //结束循环
        if ($num == 0) {
            break;
        }
    }
    $j = 0;
    $slen = strlen($c);
    while ($j < $slen) {
        //utf8一个汉字相当3个字符
        $m = substr($c, $j, 6);
        //处理数字中很多0的情况,每次循环去掉一个汉字“零”
        if ($m == '零元' || $m == '零万' || $m == '零亿' || $m == '零零') {
            $left = substr($c, 0, $j);
            $right = substr($c, $j + 3);
            $c = $left . $right;
            $j = $j - 3;
            $slen = $slen - 3;
        }
        $j = $j + 3;
    }
    //这个是为了去掉类似23.0中最后一个“零”字
    if (substr($c, strlen($c) - 3, 3) == '零') {
        $c = substr($c, 0, strlen($c) - 3);
    }
    //将处理的汉字加上“整”
    if (empty($c)) {
        return "零元整";
    } else {
        return $c . "整";
    }
}

function getCheckStatus($id) {
    if ($id == 1) {
        return "<font color='#FF9933'>待办理</font>";
    } else if ($id == 2) {
        return "<font color='#FF0000'>办理中</font>";
    } else {
        return "<font color='#339999'>已结算</font>";
    }
}

        
        

function get_Cemeterystate($state) {
    $html = "";
    switch ($state) {
        case 1:
            $html = "<font color='#48966C'><b>待售</b></font>";
            break;
        case 2:
            $html = "<font color='#F39C12'><b>预定</b></font>";
            break;
        case 3:
            $html = "<font color='#CF0120'><b>已购买</b></font>";
            break;
        case 4:
            $html = "<font color='#964884'><b>安葬</b></font>";
            break;
    }
    return $html;
}

function get_financetype($state) {
    $html = "";
    switch ($state) {
        case 2:
            $html = "<font color='#48966C'><b>墓穴预购单</b></font>";
            break;
        case 1:
            $html = "<font color='#B9DEA0'><b>墓穴认购单</b></font>";
            break;
        case 3:
            $html = "<font color='#CF0120'><b>墓穴管理续费单</b></font>";
            break;
        case 4:
            $html = "<font color='#964884'><b>墓穴服务费单</b></font>";
            break;
        case 5:
            $html = "<font color='#CF0120'><b>补录单</b></font>";
            break;
        case 6:
            $html = "<font color='#000'><b>作废单</b></font>";
            break;
        case 7:
            $html = "<font color='#000'><b>墓穴变更单</b></font>";
            break;

        default:
            $html = "<font color='#964884'><b>$state</b></font>";
    }
    return $html;
}

function get_servicetype($state) {
    $html = "";
    switch ($state) {
        case 1:
            $html = "<font color='#964884'><b>购墓收费项目</b></font>";
            break;
        case 2:
            $html = "<font color='#B9DEA0'><b>点灯服务项目</b></font>";
            break;
        case 3:
            $html = "<font color='#CF0120'><b>鲜花服务项目</b></font>";
            break;
        case 4:
            $html = "<font color='#000'><b>补录服务项目</b></font>";
            break;
        case 10:
            $html = "<font color='#000'><b>安葬服务</b></font>";
            break;
        default:
            $html = "<font color='#964884'><b>其他</b></font>";
    }
    return $html;
}

function get_paystatus($state) {
    $html = "";
    switch ($state) {
        case 1:
            $html = "未付";
            break;
        case 2:
            $html = "已付";
            break;
          case 3:
            $html = "退款";
            break;
    }
    return $html;
}

function get_savestatus($state) {
    $html = "";
    switch ($state) {
        case 1:
            $html = "寄存中";
            break;
        case 2:
            $html = "已取走";
            break;
    }
    return $html;
}

function get_isok($state) {
    $html = "";
    switch ($state) {
        case 1:
            $html = "未完成";
            break;
        case 2:
            $html = "完成";
            break;
    }
    return $html;
}

function get_resutlstatus($state) {
    $html = "";
    switch ($state) {
        case 1:
            $html = "<font color='#f93131'><b>未完成</b></font>";
            break;
        case 2:
            $html = "<font color='#097bf4'><b>已完成</b></font>";
            break;
    }
    return $html;
}

function get_datestate($enddate) {
    $html = "";
    $second2 = time();
    $ts = floor(($second2 - $enddate) / 86400);
    if ($ts > 0)
        return "<font color='#f93131'><b>过期" . $ts . "天</b></font>";
    else
        return "<font color='#097bf4'><b>" . abs($ts) . "天后到期</b></font>";
}


/////查询时间范围的
function dateParse($start = '', $end = '') {
    //区间查询
    if ($start && $end) {
        return array(strtotime($start), strtotime($end));
    } else if ($start) {
        return array(strtotime($start), strtotime($start));
    } else if ($end) {
        return array(strtotime($end), strtotime($end));
    }
}
/*
function getpreferentialStatus($id) {
    if ($id == 1) {
        return "<font color='#FF9933'>已通过</font>";
    } else if ($id == 2) {
        return "<font color='#FF0000'>未通过</font>";
    } else {
        return "<font color='#339999'>未处理</font>";
    }
}*/

function getinvoiceStatus($id) {
    if ($id == 1) {
        return "<font color='#FF9933'>开票</font>";
    } else {
        return "<font color='#FF0000'>不开票</font>";
    }
}

////得到收费项目的编辑类型
function getChargeitem_showtype($id) {
    if ($id == 1) {
        return "文本输入框 ";
    } else {
        return "下拉选择框 ";
    }
}

function getChargeitem_publictype($id) {
    if ($id == 1) {
        return "指定范围";
    } else {
        return "所有";
    }
}
 
function getisInvoic($id) {
    if ($id == 1) {
        return "开票";
    } else {
        return "未开发票";
    }
}
function get_ordaintype($state) {
    $html = "";
    switch ($state) {
        case 1:
            $html = "电话预定";
            break;
        case 2:
            $html = "现场预定";
            break;
          case 3:
            $html = "网络预定";
            break;
    }
    return $html;
}
function getInvoice_isstate($id) {
    switch ($id) {
        case 2:
            $html = "<span class='badge bg-red'>停用</span>";
            break;
        case 1:
            $html = "<span class='badge bg-green'>启用</span>";
            break;
        default:
            $html = "<span class='badge bg-red'>未启用</span>";
            break;
    }
    return $html;
}

//获取预定单编号
function get_dingdan_OrderNo($data="1"){
	return "YD".date('Ymdhis',TIME_NOW);
}
//获取寄存单号
function get_cw_OrderNo($data="1"){
	return "CW".date('Ymdhis',TIME_NOW);
}
//殡仪馆单据编号
function getOrderNo(){
	return date('Ymdhis',TIME_NOW);
}

 

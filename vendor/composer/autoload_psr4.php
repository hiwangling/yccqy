<?php

// autoload_psr4.php @generated by Composer

$vendorDir = dirname(dirname(__FILE__));
$baseDir = dirname($vendorDir);

return array(
    'think\\composer\\' => array($vendorDir . '/topthink/think-installer/src'),
    'think\\captcha\\' => array($vendorDir . '/topthink/think-captcha/src'),
    'think\\' => array($baseDir . '/thinkphp/library/think', $vendorDir . '/topthink/think-image/src'),
    'Qiniu\\' => array($vendorDir . '/qiniu/php-sdk/src/Qiniu'),
    'OSS\\' => array($vendorDir . '/aliyuncs/oss-sdk-php/src/OSS'),
    'Firebase\\JWT\\' => array($vendorDir . '/firebase/php-jwt/src'),
);

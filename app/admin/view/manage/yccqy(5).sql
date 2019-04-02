/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50717
Source Host           : 127.0.0.1:3306
Source Database       : yccqy

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2019-03-30 10:34:18
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for ky_action_log
-- ----------------------------
DROP TABLE IF EXISTS `ky_action_log`;
CREATE TABLE `ky_action_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `member_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '执行会员id',
  `username` char(30) NOT NULL DEFAULT '' COMMENT '用户名',
  `ip` char(30) NOT NULL DEFAULT '' COMMENT '执行行为者ip',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '行为名称',
  `describe` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '执行的URL',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '执行行为的时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2228 DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='行为日志表';

-- ----------------------------
-- Records of ky_action_log
-- ----------------------------
INSERT INTO `ky_action_log` VALUES ('1311', '1', 'admin', '127.0.0.1', '登录', '登录操作，username：admin', '/login/loginhandle.html', '1', '1549941649', '1549941649');
INSERT INTO `ky_action_log` VALUES ('1312', '1', 'admin', '127.0.0.1', '编辑', '编辑菜单，name：菜单管理', '/menu/menuedit.html', '1', '1549949326', '1549949326');
INSERT INTO `ky_action_log` VALUES ('1313', '1', 'admin', '127.0.0.1', '新增', '新增菜单，name：个人设置', '/menu/menuadd.html', '1', '1549950674', '1549950674');
INSERT INTO `ky_action_log` VALUES ('1314', '1', 'admin', '127.0.0.1', '新增', '新增菜单，name：个人基本信息', '/menu/menuadd.html', '1', '1549950753', '1549950753');
INSERT INTO `ky_action_log` VALUES ('1315', '1', 'admin', '127.0.0.1', '新增', '新增菜单，name：修改密码 ', '/menu/menuadd.html', '1', '1549950806', '1549950806');
INSERT INTO `ky_action_log` VALUES ('1316', '1', 'admin', '127.0.0.1', '数据状态', '数据状态调整，model：Menu，ids：213，status：-1', '/menu/setstatus/ids/213/status/-1.html', '1', '1549951164', '1549951164');
INSERT INTO `ky_action_log` VALUES ('1317', '1', 'admin', '127.0.0.1', '数据状态', '数据状态调整，model：Menu，ids：212，status：-1', '/menu/setstatus/ids/212/status/-1.html', '1', '1549951452', '1549951452');
INSERT INTO `ky_action_log` VALUES ('1318', '1', 'admin', '127.0.0.1', '删除', '删除回收站数据，model_name：Menu，id213', '/trash/trashdatadel/model_name/Menu/id/213.html', '1', '1549951544', '1549951544');
INSERT INTO `ky_action_log` VALUES ('1319', '1', 'admin', '127.0.0.1', '删除', '删除回收站数据，model_name：Menu，id212', '/trash/trashdatadel/model_name/Menu/id/212.html', '1', '1549951549', '1549951549');
INSERT INTO `ky_action_log` VALUES ('1320', '1', 'admin', '127.0.0.1', '编辑', '编辑菜单，name：个人设置', '/menu/menuedit.html', '1', '1549951578', '1549951578');
INSERT INTO `ky_action_log` VALUES ('1321', '1', 'admin', '127.0.0.1', '编辑', '编辑菜单，name：人员管理', '/menu/menuedit.html', '1', '1549952032', '1549952032');
INSERT INTO `ky_action_log` VALUES ('1322', '1', 'admin', '127.0.0.1', '编辑', '编辑菜单，name：人员列表', '/menu/menuedit.html', '1', '1549952059', '1549952059');
INSERT INTO `ky_action_log` VALUES ('1323', '1', 'admin', '127.0.0.1', '数据状态', '数据状态调整，model：Menu，ids：18，status：-1', '/menu/setstatus/ids/18/status/-1.html', '1', '1549952067', '1549952067');
INSERT INTO `ky_action_log` VALUES ('1324', '1', 'admin', '127.0.0.1', '数据状态', '数据状态调整，model：Menu，ids：209，status：-1', '/menu/setstatus/ids/209/status/-1.html', '1', '1549952074', '1549952074');
INSERT INTO `ky_action_log` VALUES ('1325', '1', 'admin', '127.0.0.1', '新增', '新增菜单，name：部门管理', '/menu/menuadd.html', '1', '1549952110', '1549952110');
INSERT INTO `ky_action_log` VALUES ('1326', '1', 'admin', '127.0.0.1', '删除', '删除回收站数据，model_name：Menu，id0', '/trash/trashdatadel/model_name/Menu.html', '1', '1549952590', '1549952590');
INSERT INTO `ky_action_log` VALUES ('1327', '1', 'admin', '127.0.0.1', '新增', '新增菜单，name：人员添加', '/menu/menuadd.html', '1', '1549952903', '1549952903');
INSERT INTO `ky_action_log` VALUES ('1328', '1', 'admin', '127.0.0.1', '新增', '新增菜单，name：人员删除', '/menu/menuadd.html', '1', '1549952936', '1549952936');
INSERT INTO `ky_action_log` VALUES ('1329', '1', 'admin', '127.0.0.1', '新增', '新增菜单，name：人员编辑', '/menu/menuadd.html', '1', '1549952969', '1549952969');
INSERT INTO `ky_action_log` VALUES ('1330', '1', 'admin', '127.0.0.1', '新增', '新增菜单，name：人员导出', '/menu/menuadd.html', '1', '1549953002', '1549953002');
INSERT INTO `ky_action_log` VALUES ('1331', '1', 'admin', '127.0.0.1', '新增', '新增菜单，name：重置密码', '/menu/menuadd.html', '1', '1549953028', '1549953028');
INSERT INTO `ky_action_log` VALUES ('1332', '1', 'admin', '127.0.0.1', '数据排序', '数据排序调整，model：Menu，id：219，value：5', '/menu/setsort.html', '1', '1549953038', '1549953038');
INSERT INTO `ky_action_log` VALUES ('1333', '1', 'admin', '127.0.0.1', '数据排序', '数据排序调整，model：Menu，id：218，value：6', '/menu/setsort.html', '1', '1549953043', '1549953043');
INSERT INTO `ky_action_log` VALUES ('1334', '1', 'admin', '127.0.0.1', '编辑', '编辑菜单，name：人员添加', '/menu/menuedit.html', '1', '1549953089', '1549953089');
INSERT INTO `ky_action_log` VALUES ('1335', '1', 'admin', '127.0.0.1', '编辑', '编辑菜单，name：人员删除', '/menu/menuedit.html', '1', '1549953097', '1549953097');
INSERT INTO `ky_action_log` VALUES ('1336', '1', 'admin', '127.0.0.1', '编辑', '编辑菜单，name：人员编辑', '/menu/menuedit.html', '1', '1549953104', '1549953104');
INSERT INTO `ky_action_log` VALUES ('1337', '1', 'admin', '127.0.0.1', '编辑', '编辑菜单，name：重置密码', '/menu/menuedit.html', '1', '1549953111', '1549953111');
INSERT INTO `ky_action_log` VALUES ('1338', '1', 'admin', '127.0.0.1', '编辑', '编辑菜单，name：人员导出', '/menu/menuedit.html', '1', '1549953119', '1549953119');
INSERT INTO `ky_action_log` VALUES ('1339', '1', 'admin', '127.0.0.1', '编辑', '编辑部门，name：公墓销售部', '/branch/branchedit.html', '1', '1549954182', '1549954182');
INSERT INTO `ky_action_log` VALUES ('1340', '1', 'admin', '127.0.0.1', '新增', '新增部门，name：公墓工程部', '/branch/branchadd.html', '1', '1549954226', '1549954226');
INSERT INTO `ky_action_log` VALUES ('1341', '1', 'admin', '127.0.0.1', '编辑', '编辑部门，name：公墓销售部', '/branch/branchedit.html', '1', '1549954240', '1549954240');
INSERT INTO `ky_action_log` VALUES ('1342', '1', 'admin', '127.0.0.1', '新增', '新增权限组，name：公墓销售人员', '/auth/groupadd.html', '1', '1549954385', '1549954385');
INSERT INTO `ky_action_log` VALUES ('1343', '1', 'admin', '127.0.0.1', '新增', '新增权限组，name：公墓管理人员', '/auth/groupadd.html', '1', '1549954395', '1549954395');
INSERT INTO `ky_action_log` VALUES ('1344', '1', 'admin', '127.0.0.1', '授权', '设置权限组权限，id：18', '/auth/menuauth.html', '1', '1549954421', '1549954421');
INSERT INTO `ky_action_log` VALUES ('1345', '1', 'admin', '127.0.0.1', '授权', '设置权限组权限，id：19', '/auth/menuauth.html', '1', '1549954441', '1549954441');
INSERT INTO `ky_action_log` VALUES ('1346', '1', 'admin', '127.0.0.1', '登录', '登录操作，username：admin', '/login/loginhandle.html', '1', '1550018655', '1550018655');
INSERT INTO `ky_action_log` VALUES ('1347', '1', 'admin', '127.0.0.1', '导出', '导出人员列表', '/member/exportmemberlist.html?', '1', '1550019388', '1550019388');
INSERT INTO `ky_action_log` VALUES ('1348', '1', 'admin', '127.0.0.1', '登录', '登录操作，username：admin', '/login/loginhandle.html', '1', '1550028723', '1550028723');
INSERT INTO `ky_action_log` VALUES ('1349', '1', 'admin', '127.0.0.1', '登录', '登录操作，username：admin', '/login/loginhandle.html', '1', '1550030543', '1550030543');
INSERT INTO `ky_action_log` VALUES ('1350', '1', 'admin', '127.0.0.1', '登录', '登录操作，username：admin', '/login/loginhandle.html', '1', '1550031759', '1550031759');
INSERT INTO `ky_action_log` VALUES ('1351', '1', 'admin', '127.0.0.1', '新增', '新增菜单，name：公墓管理', '/menu/menuadd.html', '1', '1550039562', '1550039562');
INSERT INTO `ky_action_log` VALUES ('1352', '1', 'admin', '127.0.0.1', '新增', '新增菜单，name：墓园列表', '/menu/menuadd.html', '1', '1550039598', '1550039598');
INSERT INTO `ky_action_log` VALUES ('1353', '1', 'admin', '127.0.0.1', '新增', '新增菜单，name：岗位管理', '/menu/menuadd.html', '1', '1550044480', '1550044480');
INSERT INTO `ky_action_log` VALUES ('1354', '1', 'admin', '127.0.0.1', '编辑', '编辑菜单，name：岗位管理', '/menu/menuedit.html', '1', '1550044545', '1550044545');
INSERT INTO `ky_action_log` VALUES ('1355', '1', 'admin', '127.0.0.1', '新增', '新增墓园类型，name：34334', '/cemetery_garden/cemeterygardenadd_ajax_submit.html', '1', '1550046292', '1550046292');
INSERT INTO `ky_action_log` VALUES ('1356', '1', 'admin', '127.0.0.1', '新增', '新增单位，name：程序员', '/grade/gradeadd.html', '1', '1550047069', '1550047069');
INSERT INTO `ky_action_log` VALUES ('1357', '1', 'admin', '127.0.0.1', '新增', '新增单位，name：国防生的空间刚开始', '/grade/gradeadd.html', '1', '1550047460', '1550047460');
INSERT INTO `ky_action_log` VALUES ('1358', '1', 'admin', '127.0.0.1', '删除', '单位类型删除，where：id=6', '/grade/gradedel/id/6.html', '1', '1550047472', '1550047472');
INSERT INTO `ky_action_log` VALUES ('1359', '1', 'admin', '127.0.0.1', '新增', '新增单位，name：贵金属的感觉', '/grade/gradeadd.html', '1', '1550047494', '1550047494');
INSERT INTO `ky_action_log` VALUES ('1360', '1', 'admin', '127.0.0.1', '编辑', '编辑单位类型，name：121212', '/grade/gradeedit.html', '1', '1550047610', '1550047610');
INSERT INTO `ky_action_log` VALUES ('1361', '1', 'admin', '127.0.0.1', '新增', '新增墓园类型，name：的多福多寿', '/cemetery_garden/cemeterygardenadd_ajax_submit.html', '1', '1550050228', '1550050228');
INSERT INTO `ky_action_log` VALUES ('1362', '1', 'admin', '127.0.0.1', '编辑', '编辑墓园类型，name：的多福多寿', '/cemetery_garden/cemeterygardenedit_ajax_submit.html', '1', '1550050267', '1550050267');
INSERT INTO `ky_action_log` VALUES ('1363', '1', 'admin', '127.0.0.1', '编辑', '编辑墓园类型，name： 发送到发送到', '/cemetery_garden/cemeterygardenedit_ajax_submit.html', '1', '1550050289', '1550050289');
INSERT INTO `ky_action_log` VALUES ('1364', '1', 'admin', '127.0.0.1', '删除', '墓园类型删除，where：id=6', '/cemetery_garden/cemeterygardendel/id/6.html', '1', '1550050301', '1550050301');
INSERT INTO `ky_action_log` VALUES ('1365', '1', 'admin', '127.0.0.1', '登录', '登录操作，username：admin', '/login/loginhandle.html', '1', '1550105844', '1550105844');
INSERT INTO `ky_action_log` VALUES ('1366', '1', 'admin', '127.0.0.1', '登录', '登录操作，username：admin', '/login/loginhandle.html', '1', '1550112332', '1550112332');
INSERT INTO `ky_action_log` VALUES ('1367', '1', 'admin', '127.0.0.1', '新增', '新增菜单，name：墓位类型列表', '/menu/menuadd.html', '1', '1550112554', '1550112554');
INSERT INTO `ky_action_log` VALUES ('1368', '1', 'admin', '127.0.0.1', '登录', '登录操作，username：admin', '/login/loginhandle.html', '1', '1550116219', '1550116219');
INSERT INTO `ky_action_log` VALUES ('1369', '1', 'admin', '127.0.0.1', '登录', '登录操作，username：admin', '/login/loginhandle.html', '1', '1550116752', '1550116752');
INSERT INTO `ky_action_log` VALUES ('1370', '1', 'admin', '127.0.0.1', '新增', '新增墓位类型，name：sdfs', '/cemetery_type/cemeterytypeadd_ajax_submit.html', '1', '1550116952', '1550116952');
INSERT INTO `ky_action_log` VALUES ('1371', '1', 'admin', '127.0.0.1', '编辑', '编辑墓位类型，name：sdfs', '/cemetery_type/cemeterytypeedit_ajax_submit.html', '1', '1550117179', '1550117179');
INSERT INTO `ky_action_log` VALUES ('1372', '1', 'admin', '127.0.0.1', '编辑', '编辑墓位类型，name：第三方为', '/cemetery_type/cemeterytypeedit_ajax_submit.html', '1', '1550117194', '1550117194');
INSERT INTO `ky_action_log` VALUES ('1373', '1', 'admin', '127.0.0.1', '删除', '墓位类型删除，where：id=5', '/cemetery_type/cemeterytypedel/id/5.html', '1', '1550117207', '1550117207');
INSERT INTO `ky_action_log` VALUES ('1374', '1', 'admin', '127.0.0.1', '登录', '登录操作，username：admin', '/login/loginhandle.html', '1', '1550124400', '1550124400');
INSERT INTO `ky_action_log` VALUES ('1375', '1', 'admin', '127.0.0.1', '新增', '新增菜单，name：墓园新增界面', '/menu/menuadd.html', '1', '1550125189', '1550125189');
INSERT INTO `ky_action_log` VALUES ('1376', '1', 'admin', '127.0.0.1', '编辑', '编辑配置，name：allow_url', '/config/configedit.html', '1', '1550125365', '1550125365');
INSERT INTO `ky_action_log` VALUES ('1377', '1', 'admin', '127.0.0.1', '编辑', '编辑配置，name：allow_url', '/config/configedit.html', '1', '1550125748', '1550125748');
INSERT INTO `ky_action_log` VALUES ('1378', '1', 'admin', '127.0.0.1', '编辑', '编辑菜单，name：墓园新增界面', '/menu/menuedit.html', '1', '1550125865', '1550125865');
INSERT INTO `ky_action_log` VALUES ('1379', '1', 'admin', '127.0.0.1', '编辑', '编辑菜单，name：墓园新增界面', '/menu/menuedit.html', '1', '1550125901', '1550125901');
INSERT INTO `ky_action_log` VALUES ('1380', '1', 'admin', '127.0.0.1', '新增', '新增菜单，name：墓园修改界面', '/menu/menuadd.html', '1', '1550126003', '1550126003');
INSERT INTO `ky_action_log` VALUES ('1381', '1', 'admin', '127.0.0.1', '新增', '新增菜单，name：墓园删除', '/menu/menuadd.html', '1', '1550126177', '1550126177');
INSERT INTO `ky_action_log` VALUES ('1382', '1', 'admin', '127.0.0.1', '新增', '新增会员，username：sdfsf', '/member/memberadd.html', '1', '1550126559', '1550126559');
INSERT INTO `ky_action_log` VALUES ('1383', '1', 'admin', '127.0.0.1', '编辑', '编辑菜单，name：墓园删除', '/menu/menuedit.html', '1', '1550126498', '1550126498');
INSERT INTO `ky_action_log` VALUES ('1384', '1', 'admin', '127.0.0.1', '新增', '新增菜单，name：墓位类型新增页面', '/menu/menuadd.html', '1', '1550126635', '1550126635');
INSERT INTO `ky_action_log` VALUES ('1385', '1', 'admin', '127.0.0.1', '新增', '新增菜单，name：墓位类型修改页面', '/menu/menuadd.html', '1', '1550126721', '1550126721');
INSERT INTO `ky_action_log` VALUES ('1386', '1', 'admin', '127.0.0.1', '编辑', '编辑菜单，name：墓位类型编辑页面', '/menu/menuedit.html', '1', '1550126744', '1550126744');
INSERT INTO `ky_action_log` VALUES ('1387', '1', 'admin', '127.0.0.1', '编辑', '编辑会员，id：29', '/member/memberedit.html', '1', '1550126860', '1550126860');
INSERT INTO `ky_action_log` VALUES ('1388', '1', 'admin', '127.0.0.1', '新增', '新增菜单，name：墓位类型删除', '/menu/menuadd.html', '1', '1550126809', '1550126809');
INSERT INTO `ky_action_log` VALUES ('1389', '1', 'admin', '127.0.0.1', '编辑', '编辑菜单，name：墓位类型删除', '/menu/menuedit.html', '1', '1550126829', '1550126829');
INSERT INTO `ky_action_log` VALUES ('1390', '1', 'admin', '127.0.0.1', '数据排序', '数据排序调整，model：Menu，id：222，value：2', '/menu/setsort.html', '1', '1550126914', '1550126914');
INSERT INTO `ky_action_log` VALUES ('1391', '1', 'admin', '127.0.0.1', '新增', '新增菜单，name：岗位增加', '/menu/menuadd.html', '1', '1550126974', '1550126974');
INSERT INTO `ky_action_log` VALUES ('1392', '1', 'admin', '127.0.0.1', '新增', '新增菜单，name：岗位修改', '/menu/menuadd.html', '1', '1550127028', '1550127028');
INSERT INTO `ky_action_log` VALUES ('1393', '1', 'admin', '127.0.0.1', '编辑', '编辑菜单，name：岗位增加', '/menu/menuedit.html', '1', '1550127041', '1550127041');
INSERT INTO `ky_action_log` VALUES ('1394', '1', 'admin', '127.0.0.1', '新增', '新增菜单，name：岗位删除', '/menu/menuadd.html', '1', '1550127072', '1550127072');
INSERT INTO `ky_action_log` VALUES ('1395', '1', 'admin', '127.0.0.1', '编辑', '编辑菜单，name：岗位删除', '/menu/menuedit.html', '1', '1550127087', '1550127087');
INSERT INTO `ky_action_log` VALUES ('1396', '1', 'admin', '127.0.0.1', '编辑', '编辑配置，name：allow_url', '/config/configedit.html', '1', '1550127142', '1550127142');
INSERT INTO `ky_action_log` VALUES ('1397', '1', 'admin', '127.0.0.1', '导出', '导出人员列表', '/member/exportmemberlist.html?', '1', '1550127173', '1550127173');
INSERT INTO `ky_action_log` VALUES ('1398', '1', 'admin', '127.0.0.1', '导出', '导出人员列表', '/member/exportmemberlist.html?', '1', '1550127376', '1550127376');
INSERT INTO `ky_action_log` VALUES ('1399', '1', 'admin', '127.0.0.1', '编辑', '编辑配置，name：allow_url', '/config/configedit.html', '1', '1550127492', '1550127492');
INSERT INTO `ky_action_log` VALUES ('1400', '1', 'admin', '127.0.0.1', '登录', '登录操作，username：admin', '/login/loginhandle.html', '1', '1550128651', '1550128651');
INSERT INTO `ky_action_log` VALUES ('1401', '1', 'admin', '127.0.0.1', '新增', '新增菜单，name：墓区管理', '/menu/menuadd.html', '1', '1550131116', '1550131116');
INSERT INTO `ky_action_log` VALUES ('1402', '1', 'admin', '127.0.0.1', '编辑', '编辑菜单，name：墓区列表', '/menu/menuedit.html', '1', '1550131140', '1550131140');
INSERT INTO `ky_action_log` VALUES ('1403', '1', 'admin', '127.0.0.1', '新增', '新增墓区类型，name：SFSDF', '/cemetery_area/cemeteryareaadd_ajax_submit.html', '1', '1550132158', '1550132158');
INSERT INTO `ky_action_log` VALUES ('1404', '1', 'admin', '127.0.0.1', '新增', '新增墓区类型，name：DFSFSF', '/cemetery_area/cemeteryareaadd_ajax_submit.html', '1', '1550132230', '1550132230');
INSERT INTO `ky_action_log` VALUES ('1405', '1', 'admin', '127.0.0.1', '新增', '新增墓区类型，name：SFFDF', '/cemetery_area/cemeteryareaadd_ajax_submit.html', '1', '1550132358', '1550132358');
INSERT INTO `ky_action_log` VALUES ('1406', '1', 'admin', '127.0.0.1', '新增', '新增墓区类型，name：打三分是', '/cemetery_area/cemeteryareaadd_ajax_submit.html', '1', '1550132509', '1550132509');
INSERT INTO `ky_action_log` VALUES ('1407', '1', 'admin', '127.0.0.1', '编辑', '编辑墓区类型，name：地方撒', '/cemetery_area/cemeteryareaedit_ajax_submit.html', '1', '1550132808', '1550132808');
INSERT INTO `ky_action_log` VALUES ('1408', '1', 'admin', '127.0.0.1', '删除', '墓区类型删除，where：id=25', '/cemetery_area/cemeteryareadel/id/25.html', '1', '1550132881', '1550132881');
INSERT INTO `ky_action_log` VALUES ('1409', '1', 'admin', '127.0.0.1', '新增', '新增墓位类型，name：顺丰到付', '/cemetery_type/cemeterytypeadd_ajax_submit.html', '1', '1550132966', '1550132966');
INSERT INTO `ky_action_log` VALUES ('1410', '1', 'admin', '127.0.0.1', '新增', '新增菜单，name：墓区新增页面', '/menu/menuadd.html', '1', '1550133358', '1550133358');
INSERT INTO `ky_action_log` VALUES ('1411', '1', 'admin', '127.0.0.1', '新增', '新增菜单，name：墓区编辑页面', '/menu/menuadd.html', '1', '1550133397', '1550133397');
INSERT INTO `ky_action_log` VALUES ('1412', '1', 'admin', '127.0.0.1', '编辑', '编辑菜单，name：墓区编辑页面', '/menu/menuedit.html', '1', '1550133415', '1550133415');
INSERT INTO `ky_action_log` VALUES ('1413', '1', 'admin', '127.0.0.1', '新增', '新增菜单，name：墓区删除', '/menu/menuadd.html', '1', '1550133477', '1550133477');
INSERT INTO `ky_action_log` VALUES ('1414', '1', 'admin', '127.0.0.1', '编辑', '编辑配置，name：allow_url', '/config/configedit.html', '1', '1550133577', '1550133577');
INSERT INTO `ky_action_log` VALUES ('1415', '1', 'admin', '127.0.0.1', '登录', '登录操作，username：admin', '/login/loginhandle.html', '1', '1550136168', '1550136168');
INSERT INTO `ky_action_log` VALUES ('1416', '1', 'admin', '127.0.0.1', '登录', '登录操作，username：admin', '/login/loginhandle.html', '1', '1550199071', '1550199071');
INSERT INTO `ky_action_log` VALUES ('1417', '1', 'admin', '127.0.0.1', '新增', '新增菜单，name：服务收费设置', '/menu/menuadd.html', '1', '1550199445', '1550199445');
INSERT INTO `ky_action_log` VALUES ('1418', '1', 'admin', '127.0.0.1', '新增', '新增菜单，name：服务项目', '/menu/menuadd.html', '1', '1550199568', '1550199568');
INSERT INTO `ky_action_log` VALUES ('1419', '1', 'admin', '127.0.0.1', '登录', '登录操作，username：admin', '/login/loginhandle.html', '1', '1550208619', '1550208619');
INSERT INTO `ky_action_log` VALUES ('1420', '1', 'admin', '127.0.0.1', '编辑', '编辑菜单，name：墓区删除', '/menu/menuedit.html', '1', '1550208759', '1550208759');
INSERT INTO `ky_action_log` VALUES ('1421', '1', 'admin', '127.0.0.1', '登录', '登录操作，username：admin', '/login/loginhandle.html', '1', '1550210125', '1550210125');
INSERT INTO `ky_action_log` VALUES ('1422', '1', 'admin', '127.0.0.1', '新增', '新增配置，name：chargeunit', '/config/configadd.html', '1', '1550211576', '1550211576');
INSERT INTO `ky_action_log` VALUES ('1423', '1', 'admin', '127.0.0.1', '编辑', '编辑配置，name：chargeunit', '/config/configedit.html', '1', '1550211592', '1550211592');
INSERT INTO `ky_action_log` VALUES ('1424', '1', 'admin', '127.0.0.1', '新增', '新增配置，name：pricetype', '/config/configadd.html', '1', '1550211687', '1550211687');
INSERT INTO `ky_action_log` VALUES ('1425', '1', 'admin', '127.0.0.1', '登录', '登录操作，username：admin', '/login/loginhandle.html', '1', '1550212852', '1550212852');
INSERT INTO `ky_action_log` VALUES ('1426', '1', 'admin', '127.0.0.1', '新增', '新增菜单，name：墓穴样式列表', '/menu/menuadd.html', '1', '1550212989', '1550212989');
INSERT INTO `ky_action_log` VALUES ('1427', '1', 'admin', '127.0.0.1', '编辑', '编辑菜单，name：墓穴样式列表', '/menu/menuedit.html', '1', '1550213387', '1550213387');
INSERT INTO `ky_action_log` VALUES ('1428', '1', 'admin', '127.0.0.1', '编辑', '编辑菜单，name：墓区列表', '/menu/menuedit.html', '1', '1550213403', '1550213403');
INSERT INTO `ky_action_log` VALUES ('1429', '1', 'admin', '127.0.0.1', '新增', '新增墓穴样式，name：测试测试', '/cemetery_style/cemeterystyleadd_ajax_submit.html', '1', '1550213549', '1550213549');
INSERT INTO `ky_action_log` VALUES ('1430', '1', 'admin', '127.0.0.1', '编辑', '编辑墓穴样式，name：中国红', '/cemetery_style/cemeterystyleedit_ajax_submit.html', '1', '1550213614', '1550213614');
INSERT INTO `ky_action_log` VALUES ('1431', '1', 'admin', '127.0.0.1', '新增', '新增墓穴样式，name：十多个十多个', '/cemetery_style/cemeterystyleadd_ajax_submit.html', '1', '1550213648', '1550213648');
INSERT INTO `ky_action_log` VALUES ('1432', '1', 'admin', '127.0.0.1', '删除', '墓穴样式删除，where：id=5', '/cemetery_style/cemeterystyledel/id/5.html', '1', '1550213661', '1550213661');
INSERT INTO `ky_action_log` VALUES ('1433', '1', 'admin', '127.0.0.1', '新增', '新增菜单，name：墓穴样式新增页面', '/menu/menuadd.html', '1', '1550218102', '1550218102');
INSERT INTO `ky_action_log` VALUES ('1434', '1', 'admin', '127.0.0.1', '新增', '新增菜单，name：墓穴样式修改页面', '/menu/menuadd.html', '1', '1550218191', '1550218191');
INSERT INTO `ky_action_log` VALUES ('1435', '1', 'admin', '127.0.0.1', '编辑', '编辑菜单，name：墓穴样式新增页面', '/menu/menuedit.html', '1', '1550218239', '1550218239');
INSERT INTO `ky_action_log` VALUES ('1436', '1', 'admin', '127.0.0.1', '新增', '新增菜单，name：墓穴样式删除', '/menu/menuadd.html', '1', '1550218333', '1550218333');
INSERT INTO `ky_action_log` VALUES ('1437', '1', 'admin', '127.0.0.1', '编辑', '编辑配置，name：allow_url', '/config/configedit.html', '1', '1550218479', '1550218479');
INSERT INTO `ky_action_log` VALUES ('1438', '1', 'admin', '127.0.0.1', '新增', '新增菜单，name：测试', '/menu/menuadd.html', '1', '1550218857', '1550218857');
INSERT INTO `ky_action_log` VALUES ('1439', '1', 'admin', '127.0.0.1', '新增', '新增菜单，name：墓穴列表', '/menu/menuadd.html', '1', '1550218939', '1550218939');
INSERT INTO `ky_action_log` VALUES ('1440', '1', 'admin', '127.0.0.1', '编辑', '编辑菜单，name：墓穴列表', '/menu/menuedit.html', '1', '1550218960', '1550218960');
INSERT INTO `ky_action_log` VALUES ('1441', '1', 'admin', '127.0.0.1', '编辑', '编辑菜单，name：墓穴列表', '/menu/menuedit.html', '1', '1550219090', '1550219090');
INSERT INTO `ky_action_log` VALUES ('1442', '1', 'admin', '127.0.0.1', '登录', '登录操作，username：admin', '/admin.php/login/loginhandle.html', '1', '1550278467', '1550278467');
INSERT INTO `ky_action_log` VALUES ('1443', '1', 'admin', '127.0.0.1', '登录', '登录操作，username：admin', '/login/loginhandle.html', '1', '1550278857', '1550278857');
INSERT INTO `ky_action_log` VALUES ('1444', '1', 'admin', '127.0.0.1', '登录', '登录操作，username：admin', '/login/loginhandle.html', '1', '1550282483', '1550282483');
INSERT INTO `ky_action_log` VALUES ('1445', '1', 'admin', '127.0.0.1', '登录', '登录操作，username：admin', '/login/loginhandle.html', '1', '1550284374', '1550284374');
INSERT INTO `ky_action_log` VALUES ('1446', '1', 'admin', '127.0.0.1', '新增', '新增服务信息，name：12朵菊花33', '/serviceinfo/serviceinfoadd_ajax_submit.html', '1', '1550286331', '1550286331');
INSERT INTO `ky_action_log` VALUES ('1447', '1', 'admin', '127.0.0.1', '新增', '新增菜单，name：增加服务项目', '/menu/menuadd.html', '1', '1550286460', '1550286460');
INSERT INTO `ky_action_log` VALUES ('1448', '1', 'admin', '127.0.0.1', '编辑', '编辑配置，name：allow_url', '/config/configedit.html', '1', '1550286550', '1550286550');
INSERT INTO `ky_action_log` VALUES ('1449', '1', 'admin', '127.0.0.1', '编辑', '编辑服务信息，name：12朵菊花3377', '/serviceinfo/serviceinfoedit_ajax_submit.html', '1', '1550287567', '1550287567');
INSERT INTO `ky_action_log` VALUES ('1450', '1', 'admin', '127.0.0.1', '删除', '服务信息删除，where：id=22', '/serviceinfo/serviceinfodel/id/22.html', '1', '1550287670', '1550287670');
INSERT INTO `ky_action_log` VALUES ('1451', '1', 'admin', '127.0.0.1', '新增', '新增菜单，name：修改服务项目', '/menu/menuadd.html', '1', '1550287809', '1550287809');
INSERT INTO `ky_action_log` VALUES ('1452', '1', 'admin', '127.0.0.1', '编辑', '编辑菜单，name：增加服务项目', '/menu/menuedit.html', '1', '1550287834', '1550287834');
INSERT INTO `ky_action_log` VALUES ('1453', '1', 'admin', '127.0.0.1', '编辑', '编辑菜单，name：增加服务项目', '/menu/menuedit.html', '1', '1550287848', '1550287848');
INSERT INTO `ky_action_log` VALUES ('1454', '1', 'admin', '127.0.0.1', '编辑', '编辑菜单，name：修改服务项目', '/menu/menuedit.html', '1', '1550287874', '1550287874');
INSERT INTO `ky_action_log` VALUES ('1455', '1', 'admin', '127.0.0.1', '新增', '新增菜单，name：删除服务项目', '/menu/menuadd.html', '1', '1550287946', '1550287946');
INSERT INTO `ky_action_log` VALUES ('1456', '1', 'admin', '127.0.0.1', '新增', '新增墓穴，name：测试测试', '/cemetery/cemeteryadd_ajax_submit.html', '1', '1550299354', '1550299354');
INSERT INTO `ky_action_log` VALUES ('1457', '1', 'admin', '127.0.0.1', '登录', '登录操作，username：admin', '/login/loginhandle.html', '1', '1550300141', '1550300141');
INSERT INTO `ky_action_log` VALUES ('1458', '1', 'admin', '127.0.0.1', '新增', '新增菜单，name：服务套餐', '/menu/menuadd.html', '1', '1550300232', '1550300232');
INSERT INTO `ky_action_log` VALUES ('1459', '1', 'admin', '127.0.0.1', '数据排序', '数据排序调整，model：Menu，id：248，value：2', '/menu/setsort.html', '1', '1550300246', '1550300246');
INSERT INTO `ky_action_log` VALUES ('1460', '1', 'admin', '127.0.0.1', '编辑', '编辑墓穴，name：呜呜呜呜测试测试', '/cemetery/cemeteryedit_ajax_submit.html', '1', '1550300625', '1550300625');
INSERT INTO `ky_action_log` VALUES ('1461', '1', 'admin', '127.0.0.1', '新增', '新增墓穴，name：第三方 ', '/cemetery/cemeteryadd_ajax_submit.html', '1', '1550300718', '1550300718');
INSERT INTO `ky_action_log` VALUES ('1462', '1', 'admin', '127.0.0.1', '删除', '墓穴删除，where：id=2', '/cemetery/cemeterydel/id/2.html', '1', '1550300732', '1550300732');
INSERT INTO `ky_action_log` VALUES ('1463', '1', 'admin', '127.0.0.1', '新增', '新增服务套餐信息，name：的冯绍峰', '/combo/comboadd_ajax_submit.html', '1', '1550301946', '1550301946');
INSERT INTO `ky_action_log` VALUES ('1464', '1', 'admin', '127.0.0.1', '编辑', '编辑服务套餐信息，name：的冯绍峰', '/combo/comboedit_ajax_submit.html', '1', '1550302722', '1550302722');
INSERT INTO `ky_action_log` VALUES ('1465', '1', 'admin', '127.0.0.1', '编辑', '编辑菜单，name：删除服务项目', '/menu/menuedit.html', '1', '1550304576', '1550304576');
INSERT INTO `ky_action_log` VALUES ('1466', '1', 'admin', '127.0.0.1', '新增', '新增菜单，name：服务项目排序', '/menu/menuadd.html', '1', '1550304621', '1550304621');
INSERT INTO `ky_action_log` VALUES ('1467', '1', 'admin', '127.0.0.1', '数据排序', '数据排序调整，model：Menu，id：249，value：4', '/menu/setsort.html', '1', '1550304637', '1550304637');
INSERT INTO `ky_action_log` VALUES ('1468', '1', 'admin', '127.0.0.1', '编辑', '编辑菜单，name：服务项目排序', '/menu/menuedit.html', '1', '1550304689', '1550304689');
INSERT INTO `ky_action_log` VALUES ('1469', '1', 'admin', '127.0.0.1', '新增', '新增菜单，name：增加服务套餐', '/menu/menuadd.html', '1', '1550304777', '1550304777');
INSERT INTO `ky_action_log` VALUES ('1470', '1', 'admin', '127.0.0.1', '新增', '新增菜单，name：修改服务套餐', '/menu/menuadd.html', '1', '1550304823', '1550304823');
INSERT INTO `ky_action_log` VALUES ('1471', '1', 'admin', '127.0.0.1', '新增', '新增菜单，name：删除服务套餐', '/menu/menuadd.html', '1', '1550304859', '1550304859');
INSERT INTO `ky_action_log` VALUES ('1472', '1', 'admin', '127.0.0.1', '新增', '新增菜单，name：服务套餐排序', '/menu/menuadd.html', '1', '1550304897', '1550304897');
INSERT INTO `ky_action_log` VALUES ('1473', '1', 'admin', '127.0.0.1', '数据排序', '数据排序调整，model：Menu，id：252，value：3', '/menu/setsort.html', '1', '1550304910', '1550304910');
INSERT INTO `ky_action_log` VALUES ('1474', '1', 'admin', '127.0.0.1', '数据排序', '数据排序调整，model：Menu，id：253，value：4', '/menu/setsort.html', '1', '1550304920', '1550304920');
INSERT INTO `ky_action_log` VALUES ('1475', '1', 'admin', '127.0.0.1', '数据排序', '数据排序调整，model：Combo，id：5，value：4', '/combo/setsort.html', '1', '1550304944', '1550304944');
INSERT INTO `ky_action_log` VALUES ('1476', '1', 'admin', '127.0.0.1', '数据排序', '数据排序调整，model：Serviceinfo，id：2，value：2', '/serviceinfo/setsort.html', '1', '1550305092', '1550305092');
INSERT INTO `ky_action_log` VALUES ('1477', '1', 'admin', '127.0.0.1', '编辑', '编辑配置，name：allow_url', '/config/configedit.html', '1', '1550305657', '1550305657');
INSERT INTO `ky_action_log` VALUES ('1478', '1', 'admin', '127.0.0.1', '登录', '登录操作，username：admin', '/login/loginhandle.html', '1', '1550319363', '1550319363');
INSERT INTO `ky_action_log` VALUES ('1479', '1', 'admin', '127.0.0.1', '新增', '新增服务套餐信息，name：dsdfds', '/combo/comboadd_ajax_submit.html', '1', '1550319448', '1550319448');
INSERT INTO `ky_action_log` VALUES ('1480', '1', 'admin', '127.0.0.1', '编辑', '编辑服务套餐信息，name：dsdfds', '/combo/comboedit_ajax_submit.html', '1', '1550319814', '1550319814');
INSERT INTO `ky_action_log` VALUES ('1481', '1', 'admin', '127.0.0.1', '登录', '登录操作，username：admin', '/login/loginhandle.html', '1', '1550450672', '1550450672');
INSERT INTO `ky_action_log` VALUES ('1482', '1', 'admin', '127.0.0.1', '登录', '登录操作，username：admin', '/login/loginhandle.html', '1', '1550456825', '1550456825');
INSERT INTO `ky_action_log` VALUES ('1483', '1', 'admin', '127.0.0.1', '新增', '新增菜单，name：收费项目', '/menu/menuadd.html', '1', '1550458654', '1550458654');
INSERT INTO `ky_action_log` VALUES ('1484', '1', 'admin', '127.0.0.1', '编辑', '编辑菜单，name：收费项目', '/menu/menuedit.html', '1', '1550458976', '1550458976');
INSERT INTO `ky_action_log` VALUES ('1485', '1', 'admin', '127.0.0.1', '编辑', '编辑菜单，name：收费项目', '/menu/menuedit.html', '1', '1550459155', '1550459155');
INSERT INTO `ky_action_log` VALUES ('1486', '1', 'admin', '127.0.0.1', '新增', '新增菜单，name：增加收费项目', '/menu/menuadd.html', '1', '1550459454', '1550459454');
INSERT INTO `ky_action_log` VALUES ('1487', '1', 'admin', '127.0.0.1', '登录', '登录操作，username：admin', '/login/loginhandle.html', '1', '1550462437', '1550462437');
INSERT INTO `ky_action_log` VALUES ('1488', '1', 'admin', '127.0.0.1', '编辑', '编辑配置，name：allow_url', '/config/configedit.html', '1', '1550468555', '1550468555');
INSERT INTO `ky_action_log` VALUES ('1489', '1', 'admin', '127.0.0.1', '编辑', '编辑配置，name：allow_url', '/config/configedit.html', '1', '1550468598', '1550468598');
INSERT INTO `ky_action_log` VALUES ('1490', '1', 'admin', '127.0.0.1', '登录', '登录操作，username：admin', '/login/loginhandle.html', '1', '1550480110', '1550480110');
INSERT INTO `ky_action_log` VALUES ('1491', '1', 'admin', '127.0.0.1', '新增', '新增收费项目信息，name：绿化费', '/chargeitem/chargeitemadd_ajax_submit.html', '1', '1550480464', '1550480464');
INSERT INTO `ky_action_log` VALUES ('1492', '1', 'admin', '127.0.0.1', '新增', '新增收费项目信息，name：sfsf', '/chargeitem/chargeitemadd_ajax_submit.html', '1', '1550480607', '1550480607');
INSERT INTO `ky_action_log` VALUES ('1493', '1', 'admin', '127.0.0.1', '新增', '新增收费项目信息，name：鼎折覆餗', '/chargeitem/chargeitemadd_ajax_submit.html', '1', '1550480643', '1550480643');
INSERT INTO `ky_action_log` VALUES ('1494', '1', 'admin', '127.0.0.1', '新增', '新增收费项目信息，name：sfsd', '/chargeitem/chargeitemadd_ajax_submit.html', '1', '1550480749', '1550480749');
INSERT INTO `ky_action_log` VALUES ('1495', '1', 'admin', '127.0.0.1', '新增', '新增收费项目信息，name：管理费', '/chargeitem/chargeitemadd_ajax_submit.html', '1', '1550480835', '1550480835');
INSERT INTO `ky_action_log` VALUES ('1496', '1', 'admin', '127.0.0.1', '数据排序', '数据排序调整，model：Chargeitem，id：1，value：12', '/chargeitem/setsort.html', '1', '1550480873', '1550480873');
INSERT INTO `ky_action_log` VALUES ('1497', '1', 'admin', '127.0.0.1', '登录', '登录操作，username：admin', '/login/loginhandle.html', '1', '1550539840', '1550539840');
INSERT INTO `ky_action_log` VALUES ('1498', '1', 'admin', '127.0.0.1', '编辑', '编辑配置，name：allow_url', '/config/configedit.html', '1', '1550539893', '1550539893');
INSERT INTO `ky_action_log` VALUES ('1499', '1', 'admin', '127.0.0.1', '编辑', '编辑配置，name：allow_url', '/config/configedit.html', '1', '1550541570', '1550541570');
INSERT INTO `ky_action_log` VALUES ('1500', '1', 'admin', '127.0.0.1', '新增', '新增收费项目信息，name：测试项目', '/chargeitem/chargeitemadd_ajax_submit.html', '1', '1550542121', '1550542121');
INSERT INTO `ky_action_log` VALUES ('1501', '1', 'admin', '127.0.0.1', '登录', '登录操作，username：admin', '/login/loginhandle.html', '1', '1550561688', '1550561688');
INSERT INTO `ky_action_log` VALUES ('1502', '1', 'admin', '127.0.0.1', '新增', '新增菜单，name：编辑收费项目', '/menu/menuadd.html', '1', '1550561956', '1550561956');
INSERT INTO `ky_action_log` VALUES ('1503', '1', 'admin', '127.0.0.1', '编辑', '编辑菜单，name：编辑收费项目', '/menu/menuedit.html', '1', '1550562340', '1550562340');
INSERT INTO `ky_action_log` VALUES ('1504', '1', 'admin', '127.0.0.1', '编辑', '编辑配置，name：allow_url', '/config/configedit.html', '1', '1550562668', '1550562668');
INSERT INTO `ky_action_log` VALUES ('1505', '1', 'admin', '127.0.0.1', '新增', '新增菜单，name：删除收费项目', '/menu/menuadd.html', '1', '1550562844', '1550562844');
INSERT INTO `ky_action_log` VALUES ('1506', '1', 'admin', '127.0.0.1', '新增', '新增菜单，name：收费项目排序', '/menu/menuadd.html', '1', '1550562948', '1550562948');
INSERT INTO `ky_action_log` VALUES ('1507', '1', 'admin', '127.0.0.1', '编辑', '编辑收费项目信息，name：测试项目', '/chargeitem/chargeitemedit_ajax_submit.html', '1', '1550563048', '1550563048');
INSERT INTO `ky_action_log` VALUES ('1508', '1', 'admin', '127.0.0.1', '删除', '收费项目信息删除，where：id=1', '/chargeitem/chargeitemdel/id/1.html', '1', '1550563075', '1550563075');
INSERT INTO `ky_action_log` VALUES ('1509', '1', 'admin', '127.0.0.1', '登录', '登录操作，username：admin', '/login/loginhandle.html', '1', '1550625937', '1550625937');
INSERT INTO `ky_action_log` VALUES ('1510', '1', 'admin', '127.0.0.1', '新增', '新增菜单，name：发票管理', '/menu/menuadd.html', '1', '1550629625', '1550629625');
INSERT INTO `ky_action_log` VALUES ('1511', '1', 'admin', '127.0.0.1', '数据排序', '数据排序调整，model：Menu，id：259，value：4', '/menu/setsort.html', '1', '1550629633', '1550629633');
INSERT INTO `ky_action_log` VALUES ('1512', '1', 'admin', '127.0.0.1', '新增', '新增菜单，name：增加发票信息', '/menu/menuadd.html', '1', '1550632983', '1550632983');
INSERT INTO `ky_action_log` VALUES ('1513', '1', 'admin', '127.0.0.1', '新增', '新增菜单，name：修改发票信息', '/menu/menuadd.html', '1', '1550633008', '1550633008');
INSERT INTO `ky_action_log` VALUES ('1514', '1', 'admin', '127.0.0.1', '新增', '新增菜单，name：删除发票信息', '/menu/menuadd.html', '1', '1550633038', '1550633038');
INSERT INTO `ky_action_log` VALUES ('1515', '1', 'admin', '127.0.0.1', '编辑', '编辑配置，name：allow_url', '/config/configedit.html', '1', '1550633088', '1550633088');
INSERT INTO `ky_action_log` VALUES ('1516', '1', 'admin', '127.0.0.1', '数据排序', '数据排序调整，model：Menu，id：262，value：3', '/menu/setsort.html', '1', '1550633232', '1550633232');
INSERT INTO `ky_action_log` VALUES ('1517', '1', 'admin', '127.0.0.1', '编辑', '编辑菜单，name：删除发票信息', '/menu/menuedit.html', '1', '1550633241', '1550633241');
INSERT INTO `ky_action_log` VALUES ('1518', '1', 'admin', '127.0.0.1', '登录', '登录操作，username：admin', '/login/loginhandle.html', '1', '1550719463', '1550719463');
INSERT INTO `ky_action_log` VALUES ('1519', '1', 'admin', '127.0.0.1', '编辑', '编辑发票信息，发票号码， ：08100', '/invoice/invoiceedit_ajax_submit.html', '1', '1550720268', '1550720268');
INSERT INTO `ky_action_log` VALUES ('1520', '1', 'admin', '127.0.0.1', '编辑', '编辑发票信息，发票号码， ：08100', '/invoice/invoiceedit_ajax_submit.html', '1', '1550720281', '1550720281');
INSERT INTO `ky_action_log` VALUES ('1521', '1', 'admin', '127.0.0.1', '新增', '新增发票号码，name：081003', '/invoice/invoiceadd_ajax_submit.html', '1', '1550720383', '1550720383');
INSERT INTO `ky_action_log` VALUES ('1522', '1', 'admin', '127.0.0.1', '删除', '收费发票删除，where：id=9', '/invoice/invoicedel/id/9.html', '1', '1550720389', '1550720389');
INSERT INTO `ky_action_log` VALUES ('1523', '1', 'admin', '127.0.0.1', '登录', '登录操作，username：admin', '/login/loginhandle.html', '1', '1550823520', '1550823520');
INSERT INTO `ky_action_log` VALUES ('1524', '1', 'admin', '127.0.0.1', '新增', '新增发票号码，name：4001', '/invoice/invoiceadd_ajax_submit.html', '1', '1550823567', '1550823567');
INSERT INTO `ky_action_log` VALUES ('1525', '1', 'admin', '127.0.0.1', '登录', '登录操作，username：admin', '/login/loginhandle.html', '1', '1551230784', '1551230784');
INSERT INTO `ky_action_log` VALUES ('1526', '1', 'admin', '127.0.0.1', '编辑', '编辑菜单，name：行为日志', '/menu/menuedit.html', '1', '1551230839', '1551230839');
INSERT INTO `ky_action_log` VALUES ('1527', '1', 'admin', '127.0.0.1', '编辑', '编辑菜单，name：文章列表', '/menu/menuedit.html', '1', '1551231410', '1551231410');
INSERT INTO `ky_action_log` VALUES ('1528', '1', 'admin', '127.0.0.1', '新增', '新增菜单，name：墓穴管理', '/menu/menuadd.html', '1', '1551231707', '1551231707');
INSERT INTO `ky_action_log` VALUES ('1529', '1', 'admin', '127.0.0.1', '新增', '新增菜单，name：业务中心', '/menu/menuadd.html', '1', '1551231749', '1551231749');
INSERT INTO `ky_action_log` VALUES ('1530', '1', 'admin', '127.0.0.1', '编辑', '编辑菜单，name：墓穴管理', '/menu/menuedit.html', '1', '1551231791', '1551231791');
INSERT INTO `ky_action_log` VALUES ('1531', '1', 'admin', '127.0.0.1', '编辑', '编辑菜单，name：业务中心', '/menu/menuedit.html', '1', '1551231813', '1551231813');
INSERT INTO `ky_action_log` VALUES ('1532', '1', 'admin', '127.0.0.1', '新增', '新增发票号码，name：3343', '/invoice/invoiceadd_ajax_submit.html', '1', '1551232229', '1551232229');
INSERT INTO `ky_action_log` VALUES ('1533', '1', 'admin', '127.0.0.1', '新增', '新增发票号码，name：3434', '/invoice/invoiceadd_ajax_submit.html', '1', '1551232322', '1551232322');
INSERT INTO `ky_action_log` VALUES ('1534', '1', 'admin', '127.0.0.1', '编辑', '编辑菜单，name：业务中心', '/menu/menuedit.html', '1', '1551233025', '1551233025');
INSERT INTO `ky_action_log` VALUES ('1535', '1', 'admin', '127.0.0.1', '登录', '登录操作，username：admin', '/login/loginhandle.html', '1', '1551249800', '1551249800');
INSERT INTO `ky_action_log` VALUES ('1536', '1', 'admin', '127.0.0.1', '登录', '登录操作，username：admin', '/login/loginhandle.html', '1', '1551259201', '1551259201');
INSERT INTO `ky_action_log` VALUES ('1537', '1', 'admin', '127.0.0.1', '登录', '登录操作，username：admin', '/login/loginhandle.html', '1', '1551314568', '1551314568');
INSERT INTO `ky_action_log` VALUES ('1538', '1', 'admin', '127.0.0.1', '登录', '登录操作，username：admin', '/login/loginhandle.html', '1', '1551318212', '1551318212');
INSERT INTO `ky_action_log` VALUES ('1539', '1', 'admin', '127.0.0.1', '新增', '新增菜单，name：公墓预定管理', '/menu/menuadd.html', '1', '1551335489', '1551335489');
INSERT INTO `ky_action_log` VALUES ('1540', '1', 'admin', '127.0.0.1', '新增', '新增菜单，name：预定增加', '/menu/menuadd.html', '1', '1551335537', '1551335537');
INSERT INTO `ky_action_log` VALUES ('1541', '1', 'admin', '127.0.0.1', '编辑', '编辑配置，name：allow_url', '/config/configedit.html', '1', '1551335862', '1551335862');
INSERT INTO `ky_action_log` VALUES ('1542', '1', 'admin', '127.0.0.1', '登录', '登录操作，username：admin', '/login/loginhandle.html', '1', '1551356222', '1551356222');
INSERT INTO `ky_action_log` VALUES ('1543', '1', 'admin', '127.0.0.1', '登录', '登录操作，username：admin', '/login/loginhandle.html', '1', '1551407980', '1551407980');
INSERT INTO `ky_action_log` VALUES ('1544', '1', 'admin', '127.0.0.1', '登录', '登录操作，username：admin', '/login/loginhandle.html', '1', '1551424155', '1551424155');
INSERT INTO `ky_action_log` VALUES ('1545', '1', 'admin', '127.0.0.1', '编辑', '编辑配置，name：allow_url', '/config/configedit.html', '1', '1551432669', '1551432669');
INSERT INTO `ky_action_log` VALUES ('1546', '1', 'admin', '127.0.0.1', '登录', '登录操作，username：admin', '/login/loginhandle.html', '1', '1551487163', '1551487163');
INSERT INTO `ky_action_log` VALUES ('1547', '1', 'admin', '127.0.0.1', '修改', '增加预订信息，预定人：张三', '/schedule/schedule_ajax_submit.html', '1', '1551490267', '1551490267');
INSERT INTO `ky_action_log` VALUES ('1548', '1', 'admin', '127.0.0.1', '修改', '增加预订信息，预定人：张三', '/schedule/schedule_ajax_submit.html', '1', '1551490279', '1551490279');
INSERT INTO `ky_action_log` VALUES ('1549', '1', 'admin', '127.0.0.1', '修改', '增加预订信息，预定人：预订人', '/schedule/schedule_ajax_submit.html', '1', '1551493446', '1551493446');
INSERT INTO `ky_action_log` VALUES ('1550', '1', 'admin', '127.0.0.1', '修改', '增加预订信息，预定人：预订人', '/schedule/schedule_ajax_submit.html', '1', '1551493535', '1551493535');
INSERT INTO `ky_action_log` VALUES ('1551', '1', 'admin', '127.0.0.1', '修改', '增加预订信息，预定人：预订人', '/schedule/schedule_ajax_submit.html', '1', '1551493564', '1551493564');
INSERT INTO `ky_action_log` VALUES ('1552', '1', 'admin', '127.0.0.1', '修改', '增加预订信息，预定人：预订人', '/schedule/schedule_ajax_submit.html', '1', '1551493596', '1551493596');
INSERT INTO `ky_action_log` VALUES ('1553', '1', 'admin', '127.0.0.1', '修改', '增加预订信息，预定人：预订人', '/schedule/schedule_ajax_submit.html', '1', '1551493619', '1551493619');
INSERT INTO `ky_action_log` VALUES ('1554', '1', 'admin', '127.0.0.1', '修改', '增加预订信息，预定人：预订人', '/schedule/schedule_ajax_submit.html', '1', '1551493650', '1551493650');
INSERT INTO `ky_action_log` VALUES ('1555', '1', 'admin', '127.0.0.1', '修改', '增加预订信息，预定人：预订人', '/schedule/schedule_ajax_submit.html', '1', '1551493722', '1551493722');
INSERT INTO `ky_action_log` VALUES ('1556', '1', 'admin', '127.0.0.1', '修改', '增加预订信息，预定人：预订人', '/schedule/schedule_ajax_submit.html', '1', '1551493745', '1551493745');
INSERT INTO `ky_action_log` VALUES ('1557', '1', 'admin', '127.0.0.1', '修改', '增加预订信息，预定人：预订人', '/schedule/schedule_ajax_submit.html', '1', '1551493762', '1551493762');
INSERT INTO `ky_action_log` VALUES ('1558', '1', 'admin', '127.0.0.1', '修改', '增加预订信息，预定人：张三', '/schedule/schedule_ajax_submit.html', '1', '1551494914', '1551494914');
INSERT INTO `ky_action_log` VALUES ('1559', '1', 'admin', '127.0.0.1', '修改', '增加预订信息，预定人：张三', '/schedule/schedule_ajax_submit.html', '1', '1551494956', '1551494956');
INSERT INTO `ky_action_log` VALUES ('1560', '1', 'admin', '127.0.0.1', '删除', '预订单删除，where：id=1', '/schedule/schedule_delete_ajax.html', '1', '1551496363', '1551496363');
INSERT INTO `ky_action_log` VALUES ('1561', '1', 'admin', '127.0.0.1', '删除', '预订单删除，where：id=2', '/schedule/schedule_delete_ajax.html', '1', '1551496388', '1551496388');
INSERT INTO `ky_action_log` VALUES ('1562', '1', 'admin', '127.0.0.1', '修改', '增加预订信息，预定人：预订人', '/schedule/schedule_submit_ajax.html', '1', '1551496463', '1551496463');
INSERT INTO `ky_action_log` VALUES ('1563', '1', 'admin', '127.0.0.1', '编辑', '编辑配置，name：allow_url', '/config/configedit.html', '1', '1551496537', '1551496537');
INSERT INTO `ky_action_log` VALUES ('1564', '1', 'admin', '127.0.0.1', '删除', '预订单删除，where：id=1', '/schedule/schedule_delete_ajax.html', '1', '1551498001', '1551498001');
INSERT INTO `ky_action_log` VALUES ('1565', '1', 'admin', '127.0.0.1', '修改', '增加预订信息，预定人：张三', '/schedule/schedule_submit_ajax.html', '1', '1551498042', '1551498042');
INSERT INTO `ky_action_log` VALUES ('1566', '1', 'admin', '127.0.0.1', '修改', '增加预订信息，预定人：张三', '/schedule/schedule_submit_ajax.html', '1', '1551499292', '1551499292');
INSERT INTO `ky_action_log` VALUES ('1567', '1', 'admin', '127.0.0.1', '删除', '预订单删除，where：id=2', '/schedule/schedule_delete_ajax.html', '1', '1551499344', '1551499344');
INSERT INTO `ky_action_log` VALUES ('1568', '1', 'admin', '127.0.0.1', '修改', '增加预订信息，预定人：第三方对方', '/schedule/schedule_submit_ajax.html', '1', '1551499549', '1551499549');
INSERT INTO `ky_action_log` VALUES ('1569', '1', 'admin', '127.0.0.1', '新增', '新增菜单，name：寄存管理', '/menu/menuadd.html', '1', '1551509946', '1551509946');
INSERT INTO `ky_action_log` VALUES ('1570', '1', 'admin', '127.0.0.1', '新增', '新增菜单，name：寄存位置管理', '/menu/menuadd.html', '1', '1551510003', '1551510003');
INSERT INTO `ky_action_log` VALUES ('1571', '1', 'admin', '127.0.0.1', '编辑', '编辑菜单，name：寄存位置管理', '/menu/menuedit.html', '1', '1551510963', '1551510963');
INSERT INTO `ky_action_log` VALUES ('1572', '1', 'admin', '127.0.0.1', '新增', '新增服务套餐信息，name：寄存1室01', '/savearea/saveareaadd_ajax_submit.html', '1', '1551511290', '1551511290');
INSERT INTO `ky_action_log` VALUES ('1573', '1', 'admin', '127.0.0.1', '数据排序', '数据排序调整，model：Savearea，id：6，value：12', '/savearea/setsort.html', '1', '1551511350', '1551511350');
INSERT INTO `ky_action_log` VALUES ('1574', '1', 'admin', '127.0.0.1', '编辑', '编辑服务套餐信息，name：寄存1室01', '/savearea/saveareaedit_ajax_submit.html', '1', '1551511622', '1551511622');
INSERT INTO `ky_action_log` VALUES ('1575', '1', 'admin', '127.0.0.1', '编辑', '编辑服务套餐信息，name：寄存1室013', '/savearea/saveareaedit_ajax_submit.html', '1', '1551511637', '1551511637');
INSERT INTO `ky_action_log` VALUES ('1576', '1', 'admin', '127.0.0.1', '删除', '服务信息删除，where：id=6', '/savearea/saveareadel/id/6.html', '1', '1551511727', '1551511727');
INSERT INTO `ky_action_log` VALUES ('1577', '1', 'admin', '127.0.0.1', '新增', '新增服务套餐信息，name：第三方', '/savearea/saveareaadd_ajax_submit.html', '1', '1551511937', '1551511937');
INSERT INTO `ky_action_log` VALUES ('1578', '1', 'admin', '127.0.0.1', '编辑', '编辑菜单，name：寄存管理', '/menu/menuedit.html', '1', '1551512220', '1551512220');
INSERT INTO `ky_action_log` VALUES ('1579', '1', 'admin', '127.0.0.1', '新增', '新增菜单，name：寄存管理', '/menu/menuadd.html', '1', '1551512271', '1551512271');
INSERT INTO `ky_action_log` VALUES ('1580', '1', 'admin', '127.0.0.1', '新增', '新增菜单，name：寄存位置增加', '/menu/menuadd.html', '1', '1551512344', '1551512344');
INSERT INTO `ky_action_log` VALUES ('1581', '1', 'admin', '127.0.0.1', '新增', '新增菜单，name：寄存位置编辑', '/menu/menuadd.html', '1', '1551512374', '1551512374');
INSERT INTO `ky_action_log` VALUES ('1582', '1', 'admin', '127.0.0.1', '新增', '新增菜单，name：寄存位置删除', '/menu/menuadd.html', '1', '1551512435', '1551512435');
INSERT INTO `ky_action_log` VALUES ('1583', '1', 'admin', '127.0.0.1', '编辑', '编辑配置，name：allow_url', '/config/configedit.html', '1', '1551512503', '1551512503');
INSERT INTO `ky_action_log` VALUES ('1584', '1', 'admin', '127.0.0.1', '登录', '登录操作，username：admin', '/login/loginhandle.html', '1', '1551620986', '1551620986');
INSERT INTO `ky_action_log` VALUES ('1585', '1', 'admin', '127.0.0.1', '登录', '登录操作，username：admin', '/login/loginhandle.html', '1', '1551659174', '1551659174');
INSERT INTO `ky_action_log` VALUES ('1586', '1', 'admin', '127.0.0.1', '新增加', '增加寄存信息，预定人：张三', '/save/save_submit_ajax.html', '1', '1551667019', '1551667019');
INSERT INTO `ky_action_log` VALUES ('1587', '1', 'admin', '127.0.0.1', '编辑', '编辑收费项目信息，name：寄存费', '/chargeitem/chargeitemedit_ajax_submit.html', '1', '1551678802', '1551678802');
INSERT INTO `ky_action_log` VALUES ('1588', '1', 'admin', '127.0.0.1', '数据排序', '数据排序调整，model：Chargeitem，id：1，value：1', '/chargeitem/setsort.html', '1', '1551678812', '1551678812');
INSERT INTO `ky_action_log` VALUES ('1589', '1', 'admin', '127.0.0.1', '数据状态', '数据状态调整，model：Config，ids：96，status：-1', '/config/setstatus/ids/96/status/-1.html', '1', '1551683648', '1551683648');
INSERT INTO `ky_action_log` VALUES ('1590', '1', 'admin', '127.0.0.1', '数据状态', '数据状态调整，model：Config，ids：97，status：-1', '/config/setstatus/ids/97/status/-1.html', '1', '1551683655', '1551683655');
INSERT INTO `ky_action_log` VALUES ('1591', '1', 'admin', '127.0.0.1', '数据状态', '数据状态调整，model：Config，ids：102，status：-1', '/config/setstatus/ids/102/status/-1.html', '1', '1551683662', '1551683662');
INSERT INTO `ky_action_log` VALUES ('1592', '1', 'admin', '127.0.0.1', '数据状态', '数据状态调整，model：Config，ids：101，status：-1', '/config/setstatus/ids/101/status/-1.html', '1', '1551683668', '1551683668');
INSERT INTO `ky_action_log` VALUES ('1593', '1', 'admin', '127.0.0.1', '数据状态', '数据状态调整，model：Config，ids：105，status：-1', '/config/setstatus/ids/105/status/-1.html', '1', '1551683675', '1551683675');
INSERT INTO `ky_action_log` VALUES ('1594', '1', 'admin', '127.0.0.1', '数据状态', '数据状态调整，model：Config，ids：103，status：-1', '/config/setstatus/ids/103/status/-1.html', '1', '1551683681', '1551683681');
INSERT INTO `ky_action_log` VALUES ('1595', '1', 'admin', '127.0.0.1', '数据状态', '数据状态调整，model：Config，ids：78，status：-1', '/config/setstatus/ids/78/status/-1.html', '1', '1551683735', '1551683735');
INSERT INTO `ky_action_log` VALUES ('1596', '1', 'admin', '127.0.0.1', '数据状态', '数据状态调整，model：Config，ids：69，status：-1', '/config/setstatus/ids/69/status/-1.html', '1', '1551683768', '1551683768');
INSERT INTO `ky_action_log` VALUES ('1597', '1', 'admin', '127.0.0.1', '数据状态', '数据状态调整，model：Config，ids：99，status：-1', '/config/setstatus/ids/99/status/-1.html', '1', '1551683784', '1551683784');
INSERT INTO `ky_action_log` VALUES ('1598', '1', 'admin', '127.0.0.1', '数据状态', '数据状态调整，model：Config，ids：98，status：-1', '/config/setstatus/ids/98/status/-1.html', '1', '1551683790', '1551683790');
INSERT INTO `ky_action_log` VALUES ('1599', '1', 'admin', '127.0.0.1', '数据状态', '数据状态调整，model：Config，ids：100，status：-1', '/config/setstatus/ids/100/status/-1.html', '1', '1551683799', '1551683799');
INSERT INTO `ky_action_log` VALUES ('1600', '1', 'admin', '127.0.0.1', '新增加', '增加寄存信息，预定人：张三', '/save/save_submit_ajax.html', '1', '1551685187', '1551685187');
INSERT INTO `ky_action_log` VALUES ('1601', '1', 'admin', '127.0.0.1', '新增加', '增加寄存信息，预定人：张三', '/save/save_submit_ajax.html', '1', '1551687648', '1551687648');
INSERT INTO `ky_action_log` VALUES ('1602', '1', 'admin', '127.0.0.1', '新增加', '增加寄存信息，预定人：张三111', '/save/save_submit_ajax.html', '1', '1551688299', '1551688299');
INSERT INTO `ky_action_log` VALUES ('1603', '1', 'admin', '127.0.0.1', '新增加', '增加寄存信息，预定人：张三111', '/save/save_submit_ajax.html', '1', '1551688315', '1551688315');
INSERT INTO `ky_action_log` VALUES ('1604', '1', 'admin', '127.0.0.1', '新增加', '增加寄存信息，预定人：张三111222', '/save/save_submit_ajax.html', '1', '1551688338', '1551688338');
INSERT INTO `ky_action_log` VALUES ('1605', '1', 'admin', '127.0.0.1', '新增加', '增加寄存信息，预定人：发送到', '/save/save_submit_ajax.html', '1', '1551688486', '1551688486');
INSERT INTO `ky_action_log` VALUES ('1606', '1', 'admin', '127.0.0.1', '新增加', '增加寄存信息，预定人：二二', '/save/save_submit_ajax.html', '1', '1551688612', '1551688612');
INSERT INTO `ky_action_log` VALUES ('1607', '1', 'admin', '127.0.0.1', '新增加', '增加寄存信息，预定人：435345', '/save/save_submit_ajax.html', '1', '1551688658', '1551688658');
INSERT INTO `ky_action_log` VALUES ('1608', '1', 'admin', '127.0.0.1', '新增加', '增加寄存信息，预定人：第三方', '/save/save_submit_ajax.html', '1', '1551688695', '1551688695');
INSERT INTO `ky_action_log` VALUES ('1609', '1', 'admin', '127.0.0.1', '新增加', '增加寄存信息，预定人：345345', '/save/save_submit_ajax.html', '1', '1551688792', '1551688792');
INSERT INTO `ky_action_log` VALUES ('1610', '1', 'admin', '127.0.0.1', '登录', '登录操作，username：admin', '/login/loginhandle.html', '1', '1551700448', '1551700448');
INSERT INTO `ky_action_log` VALUES ('1611', '1', 'admin', '127.0.0.1', '新增加', '增加寄存信息，预定人：3433', '/save/save_submit_ajax.html', '1', '1551700804', '1551700804');
INSERT INTO `ky_action_log` VALUES ('1612', '1', 'admin', '127.0.0.1', '修改', '修改寄存信息，id11', '/save/save_submit_ajax.html', '1', '1551706960', '1551706960');
INSERT INTO `ky_action_log` VALUES ('1613', '1', 'admin', '127.0.0.1', '修改', '修改寄存信息，id11', '/save/save_submit_ajax.html', '1', '1551706980', '1551706980');
INSERT INTO `ky_action_log` VALUES ('1614', '1', 'admin', '127.0.0.1', '修改', '修改寄存信息，id11', '/save/save_submit_ajax.html', '1', '1551707182', '1551707182');
INSERT INTO `ky_action_log` VALUES ('1615', '1', 'admin', '127.0.0.1', '修改', '修改寄存信息，id11', '/save/save_submit_ajax.html', '1', '1551707199', '1551707199');
INSERT INTO `ky_action_log` VALUES ('1616', '1', 'admin', '127.0.0.1', '修改', '修改寄存信息，id11', '/save/save_submit_ajax.html', '1', '1551707262', '1551707262');
INSERT INTO `ky_action_log` VALUES ('1617', '1', 'admin', '127.0.0.1', '登录', '登录操作，username：admin', '/login/loginhandle.html', '1', '1551788616', '1551788616');
INSERT INTO `ky_action_log` VALUES ('1618', '1', 'admin', '127.0.0.1', '修改', '修改寄存信息，id11', '/save/save_submit_ajax.html', '1', '1551789170', '1551789170');
INSERT INTO `ky_action_log` VALUES ('1619', '1', 'admin', '127.0.0.1', '删除', '寄存信息删除，where：id=11', '/save/save_delete_ajax.html', '1', '1551792183', '1551792183');
INSERT INTO `ky_action_log` VALUES ('1620', '1', 'admin', '127.0.0.1', '删除', '寄存信息删除，where：id=10', '/save/save_delete_ajax.html', '1', '1551792208', '1551792208');
INSERT INTO `ky_action_log` VALUES ('1621', '1', 'admin', '127.0.0.1', '删除', '寄存信息删除，where：id=9', '/save/save_delete_ajax.html', '1', '1551792285', '1551792285');
INSERT INTO `ky_action_log` VALUES ('1622', '1', 'admin', '127.0.0.1', '删除', '寄存信息删除，where：id=8', '/save/save_delete_ajax.html', '1', '1551792308', '1551792308');
INSERT INTO `ky_action_log` VALUES ('1623', '1', 'admin', '127.0.0.1', '删除', '寄存信息删除，where：id=7', '/save/save_delete_ajax.html', '1', '1551793096', '1551793096');
INSERT INTO `ky_action_log` VALUES ('1624', '1', 'admin', '127.0.0.1', '删除', '寄存信息删除，where：id=6', '/save/save_delete_ajax.html', '1', '1551793444', '1551793444');
INSERT INTO `ky_action_log` VALUES ('1625', '1', 'admin', '127.0.0.1', '删除', '寄存信息删除，where：id=6', '/save/save_delete_ajax.html', '1', '1551793510', '1551793510');
INSERT INTO `ky_action_log` VALUES ('1626', '1', 'admin', '127.0.0.1', '删除', '寄存信息删除，where：id=5', '/save/save_delete_ajax.html', '1', '1551793551', '1551793551');
INSERT INTO `ky_action_log` VALUES ('1627', '1', 'admin', '127.0.0.1', '删除', '寄存信息删除，where：id=2', '/save/save_delete_ajax.html', '1', '1551793562', '1551793562');
INSERT INTO `ky_action_log` VALUES ('1628', '1', 'admin', '127.0.0.1', '删除', '寄存信息删除，where：id=1', '/save/save_delete_ajax.html', '1', '1551793567', '1551793567');
INSERT INTO `ky_action_log` VALUES ('1629', '1', 'admin', '127.0.0.1', '更新寄存信息', '寄存信息 更新，where：id=4', '/save/save_take_ajax.html', '1', '1551793895', '1551793895');
INSERT INTO `ky_action_log` VALUES ('1630', '1', 'admin', '127.0.0.1', '付款', '寄存信息付款，where：id=4', '/save/save_pay_ajax.html', '1', '1551794113', '1551794113');
INSERT INTO `ky_action_log` VALUES ('1631', '1', 'admin', '127.0.0.1', '登录', '登录操作，username：admin', '/login/loginhandle.html', '1', '1551852376', '1551852376');
INSERT INTO `ky_action_log` VALUES ('1632', '1', 'admin', '127.0.0.1', '新增', '新增菜单，name：寄存信息添加', '/menu/menuadd.html', '1', '1551856438', '1551856438');
INSERT INTO `ky_action_log` VALUES ('1633', '1', 'admin', '127.0.0.1', '新增', '新增菜单，name：寄存信息编辑', '/menu/menuadd.html', '1', '1551856460', '1551856460');
INSERT INTO `ky_action_log` VALUES ('1634', '1', 'admin', '127.0.0.1', '新增', '新增菜单，name：寄存信息删除', '/menu/menuadd.html', '1', '1551856481', '1551856481');
INSERT INTO `ky_action_log` VALUES ('1635', '1', 'admin', '127.0.0.1', '编辑', '编辑菜单，name：寄存信息编辑', '/menu/menuedit.html', '1', '1551856491', '1551856491');
INSERT INTO `ky_action_log` VALUES ('1636', '1', 'admin', '127.0.0.1', '编辑', '编辑菜单，name：寄存信息删除', '/menu/menuedit.html', '1', '1551856501', '1551856501');
INSERT INTO `ky_action_log` VALUES ('1637', '1', 'admin', '127.0.0.1', '新增', '新增菜单，name：寄存结算打印', '/menu/menuadd.html', '1', '1551856702', '1551856702');
INSERT INTO `ky_action_log` VALUES ('1638', '1', 'admin', '127.0.0.1', '新增', '新增菜单，name：寄存取走', '/menu/menuadd.html', '1', '1551856735', '1551856735');
INSERT INTO `ky_action_log` VALUES ('1639', '1', 'admin', '127.0.0.1', '编辑', '编辑配置，name：allow_url', '/config/configedit.html', '1', '1551856793', '1551856793');
INSERT INTO `ky_action_log` VALUES ('1640', '1', 'admin', '127.0.0.1', '新增', '新增菜单，name：公墓销售列表', '/menu/menuadd.html', '1', '1551857119', '1551857119');
INSERT INTO `ky_action_log` VALUES ('1641', '1', 'admin', '127.0.0.1', '新增', '新增菜单，name：购墓信息增加', '/menu/menuadd.html', '1', '1551857226', '1551857226');
INSERT INTO `ky_action_log` VALUES ('1642', '1', 'admin', '127.0.0.1', '登录', '登录操作，username：admin', '/login/loginhandle.html', '1', '1552095172', '1552095172');
INSERT INTO `ky_action_log` VALUES ('1643', '1', 'admin', '127.0.0.1', '编辑', '编辑菜单，name：公墓销售列表', '/menu/menuedit.html', '1', '1552095221', '1552095221');
INSERT INTO `ky_action_log` VALUES ('1644', '1', 'admin', '127.0.0.1', '数据状态', '数据状态调整，model：Config，ids：104，status：-1', '/config/setstatus/ids/104/status/-1.html', '1', '1552097511', '1552097511');
INSERT INTO `ky_action_log` VALUES ('1645', '1', 'admin', '127.0.0.1', '编辑', '编辑配置，name：financetype', '/config/configedit.html', '1', '1552097629', '1552097629');
INSERT INTO `ky_action_log` VALUES ('1646', '1', 'admin', '127.0.0.1', '新增', '新增收费项目信息，name：水电费的说法', '/chargeitem/chargeitemadd_ajax_submit.html', '1', '1552099418', '1552099418');
INSERT INTO `ky_action_log` VALUES ('1647', '1', 'admin', '127.0.0.1', '编辑', '编辑收费项目信息，name：墓位费', '/chargeitem/chargeitemedit_ajax_submit.html', '1', '1552099786', '1552099786');
INSERT INTO `ky_action_log` VALUES ('1648', '1', 'admin', '127.0.0.1', '新增', '新增收费项目信息，name：维护费', '/chargeitem/chargeitemadd_ajax_submit.html', '1', '1552099880', '1552099880');
INSERT INTO `ky_action_log` VALUES ('1649', '1', 'admin', '127.0.0.1', '编辑', '编辑收费项目信息，name：绿化费', '/chargeitem/chargeitemedit_ajax_submit.html', '1', '1552099901', '1552099901');
INSERT INTO `ky_action_log` VALUES ('1650', '1', 'admin', '127.0.0.1', '新增', '新增收费项目信息，name：墓证费', '/chargeitem/chargeitemadd_ajax_submit.html', '1', '1552099996', '1552099996');
INSERT INTO `ky_action_log` VALUES ('1651', '1', 'admin', '127.0.0.1', '新增', '新增服务信息，name：骨灰坛', '/serviceinfo/serviceinfoadd_ajax_submit.html', '1', '1552112729', '1552112729');
INSERT INTO `ky_action_log` VALUES ('1652', '1', 'admin', '127.0.0.1', '新增', '新增服务信息，name：锣鼓乐队', '/serviceinfo/serviceinfoadd_ajax_submit.html', '1', '1552115462', '1552115462');
INSERT INTO `ky_action_log` VALUES ('1653', '1', 'admin', '127.0.0.1', '编辑', '编辑服务信息，name：骨灰坛', '/serviceinfo/serviceinfoedit_ajax_submit.html', '1', '1552115474', '1552115474');
INSERT INTO `ky_action_log` VALUES ('1654', '1', 'admin', '127.0.0.1', '登录', '登录操作，username：admin', '/login/loginhandle.html', '1', '1552271889', '1552271889');
INSERT INTO `ky_action_log` VALUES ('1655', '1', 'admin', '127.0.0.1', '编辑', '编辑收费项目信息，name：管理费', '/chargeitem/chargeitemedit_ajax_submit.html', '1', '1552272006', '1552272006');
INSERT INTO `ky_action_log` VALUES ('1656', '1', 'admin', '127.0.0.1', '编辑', '编辑收费项目信息，name：管理费', '/chargeitem/chargeitemedit_ajax_submit.html', '1', '1552273017', '1552273017');
INSERT INTO `ky_action_log` VALUES ('1657', '1', 'admin', '127.0.0.1', '新增加', '增加购墓信息购买人：水电费', '/sell/sell_submit.html', '1', '1552276764', '1552276764');
INSERT INTO `ky_action_log` VALUES ('1658', '1', 'admin', '127.0.0.1', '新增加', '增加购墓信息购买人：水电费', '/sell/sell_submit.html', '1', '1552276902', '1552276902');
INSERT INTO `ky_action_log` VALUES ('1659', '1', 'admin', '127.0.0.1', '新增加', '增加购墓信息购买人：水电费', '/sell/sell_submit.html', '1', '1552277071', '1552277071');
INSERT INTO `ky_action_log` VALUES ('1660', '1', 'admin', '127.0.0.1', '新增加', '增加购墓信息购买人：水电费', '/sell/sell_submit.html', '1', '1552277167', '1552277167');
INSERT INTO `ky_action_log` VALUES ('1661', '1', 'admin', '127.0.0.1', '新增加', '增加购墓信息购买人：水电费', '/sell/sell_submit.html', '1', '1552277258', '1552277258');
INSERT INTO `ky_action_log` VALUES ('1662', '1', 'admin', '127.0.0.1', '新增加', '增加购墓信息购买人：水电费', '/sell/sell_submit.html', '1', '1552278344', '1552278344');
INSERT INTO `ky_action_log` VALUES ('1663', '1', 'admin', '127.0.0.1', '新增加', '增加购墓信息购买人：水电费', '/sell/sell_submit.html', '1', '1552278432', '1552278432');
INSERT INTO `ky_action_log` VALUES ('1664', '1', 'admin', '127.0.0.1', '登录', '登录操作，username：admin', '/login/loginhandle.html', '1', '1552380438', '1552380438');
INSERT INTO `ky_action_log` VALUES ('1665', '1', 'admin', '127.0.0.1', '编辑', '编辑收费项目信息，name：墓位费', '/chargeitem/chargeitemedit_ajax_submit.html', '1', '1552382770', '1552382770');
INSERT INTO `ky_action_log` VALUES ('1666', '1', 'admin', '127.0.0.1', '编辑', '编辑收费项目信息，name：管理费', '/chargeitem/chargeitemedit_ajax_submit.html', '1', '1552382783', '1552382783');
INSERT INTO `ky_action_log` VALUES ('1667', '1', 'admin', '127.0.0.1', '登录', '登录操作，username：admin', '/login/loginhandle.html', '1', '1552438436', '1552438436');
INSERT INTO `ky_action_log` VALUES ('1668', '1', 'admin', '127.0.0.1', '登录', '登录操作，username：admin', '/login/loginhandle.html', '1', '1552456118', '1552456118');
INSERT INTO `ky_action_log` VALUES ('1669', '1', 'admin', '127.0.0.1', '登录', '登录操作，username：admin', '/login/loginhandle.html', '1', '1552609340', '1552609340');
INSERT INTO `ky_action_log` VALUES ('1670', '1', 'admin', '127.0.0.1', '新增加', '增加购墓信息购买人：姓名', '/sell/sell_submit.html', '1', '1552610668', '1552610668');
INSERT INTO `ky_action_log` VALUES ('1671', '1', 'admin', '127.0.0.1', '修改', '修改购墓信息购买人：订单号：CW20190315084408', '/sell/sell_submit.html', '1', '1552615737', '1552615737');
INSERT INTO `ky_action_log` VALUES ('1672', '1', 'admin', '127.0.0.1', '修改', '修改购墓信息购买人：订单号：CW20190315084408', '/sell/sell_submit.html', '1', '1552615870', '1552615870');
INSERT INTO `ky_action_log` VALUES ('1673', '1', 'admin', '127.0.0.1', '修改', '修改购墓信息购买人：订单号：CW20190315084408', '/sell/sell_submit.html', '1', '1552616094', '1552616094');
INSERT INTO `ky_action_log` VALUES ('1674', '1', 'admin', '127.0.0.1', '修改', '修改购墓信息购买人：订单号：CW20190315084408', '/sell/sell_submit.html', '1', '1552616207', '1552616207');
INSERT INTO `ky_action_log` VALUES ('1675', '1', 'admin', '127.0.0.1', '修改', '修改购墓信息购买人：订单号：CW20190315084408', '/sell/sell_submit.html', '1', '1552616554', '1552616554');
INSERT INTO `ky_action_log` VALUES ('1676', '1', 'admin', '127.0.0.1', '修改', '修改购墓信息购买人：订单号：CW20190315084408', '/sell/sell_submit.html', '1', '1552617271', '1552617271');
INSERT INTO `ky_action_log` VALUES ('1677', '1', 'admin', '127.0.0.1', '修改', '修改购墓信息购买人：订单号：CW20190315084408', '/sell/sell_submit.html', '1', '1552617708', '1552617708');
INSERT INTO `ky_action_log` VALUES ('1678', '1', 'admin', '127.0.0.1', '新增加', '增加购墓信息购买人：姓名', '/sell/sell_submit.html', '1', '1552621017', '1552621017');
INSERT INTO `ky_action_log` VALUES ('1679', '1', 'admin', '127.0.0.1', '新增加', '增加购墓信息购买人：姓名', '/sell/sell_submit.html', '1', '1552621655', '1552621655');
INSERT INTO `ky_action_log` VALUES ('1680', '1', 'admin', '127.0.0.1', '新增加', '增加购墓信息购买人：姓名', '/sell/sell_submit.html', '1', '1552622005', '1552622005');
INSERT INTO `ky_action_log` VALUES ('1681', '1', 'admin', '127.0.0.1', '修改', '修改购墓信息购买人：订单号：CW20190315115324', '/sell/sell_submit.html', '1', '1552622044', '1552622044');
INSERT INTO `ky_action_log` VALUES ('1682', '1', 'admin', '127.0.0.1', '新增加', '增加购墓信息购买人：姓名', '/sell/sell_submit.html', '1', '1552622517', '1552622517');
INSERT INTO `ky_action_log` VALUES ('1683', '1', 'admin', '127.0.0.1', '新增加', '增加购墓信息购买人：张三', '/sell/sell_submit.html', '1', '1552622634', '1552622634');
INSERT INTO `ky_action_log` VALUES ('1684', '1', 'admin', '127.0.0.1', '新增加', '增加购墓信息购买人：张三', '/sell/sell_submit.html', '1', '1552622799', '1552622799');
INSERT INTO `ky_action_log` VALUES ('1685', '1', 'admin', '127.0.0.1', '修改', '修改购墓信息购买人：订单号：CW20190315120627', '/sell/sell_submit.html', '1', '1552622931', '1552622931');
INSERT INTO `ky_action_log` VALUES ('1686', '1', 'admin', '127.0.0.1', '登录', '登录操作，username：admin', '/login/loginhandle.html', '1', '1552628373', '1552628373');
INSERT INTO `ky_action_log` VALUES ('1687', '1', 'admin', '127.0.0.1', '删除', '寄存信息删除，where：id=1', '/sell/sell_delete_ajax.html', '1', '1552630015', '1552630015');
INSERT INTO `ky_action_log` VALUES ('1688', '1', 'admin', '127.0.0.1', '新增加', '增加购墓信息购买人：张三', '/sell/sell_submit.html', '1', '1552630424', '1552630424');
INSERT INTO `ky_action_log` VALUES ('1689', '1', 'admin', '127.0.0.1', '删除', '寄存信息删除，where：id=2', '/sell/sell_delete_ajax.html', '1', '1552630923', '1552630923');
INSERT INTO `ky_action_log` VALUES ('1690', '1', 'admin', '127.0.0.1', '新增加', '增加购墓信息购买人：张三', '/sell/sell_submit.html', '1', '1552631357', '1552631357');
INSERT INTO `ky_action_log` VALUES ('1691', '1', 'admin', '127.0.0.1', '删除', '寄存信息删除，where：id=3', '/sell/sell_delete_ajax.html', '1', '1552633288', '1552633288');
INSERT INTO `ky_action_log` VALUES ('1692', '1', 'admin', '127.0.0.1', '新增加', '增加购墓信息购买人：姓名', '/sell/sell_submit.html', '1', '1552633414', '1552633414');
INSERT INTO `ky_action_log` VALUES ('1693', '1', 'admin', '127.0.0.1', '修改', '修改购墓信息购买人：订单号：CW20190315030332', '/sell/sell_submit.html', '1', '1552635965', '1552635965');
INSERT INTO `ky_action_log` VALUES ('1694', '1', 'admin', '127.0.0.1', '修改', '修改购墓信息购买人：订单号：CW20190315030332', '/sell/sell_submit.html', '1', '1552635992', '1552635992');
INSERT INTO `ky_action_log` VALUES ('1695', '1', 'admin', '127.0.0.1', '修改', '修改购墓信息购买人：订单号：CW20190315030332', '/sell/sell_submit.html', '1', '1552636329', '1552636329');
INSERT INTO `ky_action_log` VALUES ('1696', '1', 'admin', '127.0.0.1', '修改', '修改购墓信息购买人：订单号：CW20190315030332', '/sell/sell_submit.html', '1', '1552641232', '1552641232');
INSERT INTO `ky_action_log` VALUES ('1697', '1', 'admin', '127.0.0.1', '修改', '修改购墓信息购买人：订单号：CW20190315030332', '/sell/sell_submit.html', '1', '1552641263', '1552641263');
INSERT INTO `ky_action_log` VALUES ('1698', '1', 'admin', '127.0.0.1', '删除', '寄存信息删除，where：id=4', '/sell/sell_delete_ajax.html', '1', '1552641322', '1552641322');
INSERT INTO `ky_action_log` VALUES ('1699', '1', 'admin', '127.0.0.1', '新增加', '增加购墓信息购买人：胜多负少分', '/sell/sell_submit.html', '1', '1552641706', '1552641706');
INSERT INTO `ky_action_log` VALUES ('1700', '1', 'admin', '127.0.0.1', '删除', '寄存信息删除，where：id=5', '/sell/sell_delete_ajax.html', '1', '1552641721', '1552641721');
INSERT INTO `ky_action_log` VALUES ('1701', '1', 'admin', '127.0.0.1', '登录', '登录操作，username：admin', '/login/loginhandle.html', '1', '1552697418', '1552697418');
INSERT INTO `ky_action_log` VALUES ('1702', '1', 'admin', '127.0.0.1', '新增加', '增加购墓信息购买人：张飞', '/sell/sell_submit.html', '1', '1552697534', '1552697534');
INSERT INTO `ky_action_log` VALUES ('1703', '1', 'admin', '127.0.0.1', '修改', '修改购墓信息购买人：订单号：CW20190316085213', '/sell/sell_submit.html', '1', '1552697567', '1552697567');
INSERT INTO `ky_action_log` VALUES ('1704', '1', 'admin', '127.0.0.1', '修改', '修改购墓信息购买人：订单号：CW20190316085213', '/sell/sell_submit.html', '1', '1552697580', '1552697580');
INSERT INTO `ky_action_log` VALUES ('1705', '1', 'admin', '127.0.0.1', '修改', '修改购墓信息购买人：订单号：CW20190316085213', '/sell/sell_submit.html', '1', '1552697749', '1552697749');
INSERT INTO `ky_action_log` VALUES ('1706', '1', 'admin', '127.0.0.1', '新增', '新增配置，name：burytype', '/config/configadd.html', '1', '1552698433', '1552698433');
INSERT INTO `ky_action_log` VALUES ('1707', '1', 'admin', '127.0.0.1', '新增', '新增配置，name：burystyle', '/config/configadd.html', '1', '1552698520', '1552698520');
INSERT INTO `ky_action_log` VALUES ('1708', '1', 'admin', '127.0.0.1', '编辑', '编辑配置，name：financetype', '/config/configedit.html', '1', '1552700820', '1552700820');
INSERT INTO `ky_action_log` VALUES ('1709', '1', 'admin', '127.0.0.1', '新增', '新增配置，name：monumentype', '/config/configadd.html', '1', '1552702920', '1552702920');
INSERT INTO `ky_action_log` VALUES ('1710', '1', 'admin', '127.0.0.1', '新增', '新增配置，name：monumentype111', '/config/configadd.html', '1', '1552703031', '1552703031');
INSERT INTO `ky_action_log` VALUES ('1711', '1', 'admin', '127.0.0.1', '编辑', '编辑配置，name：monumenstyle', '/config/configedit.html', '1', '1552703055', '1552703055');
INSERT INTO `ky_action_log` VALUES ('1712', '1', 'admin', '127.0.0.1', '编辑', '编辑配置，name：monumentype', '/config/configedit.html', '1', '1552703069', '1552703069');
INSERT INTO `ky_action_log` VALUES ('1713', '1', 'admin', '127.0.0.1', '登录', '登录操作，username：admin', '/login/loginhandle.html', '1', '1552707205', '1552707205');
INSERT INTO `ky_action_log` VALUES ('1714', '1', 'admin', '127.0.0.1', '修改', '修改购墓信息购买人：订单号：CW20190316085213', '/sell/sell_submit.html', '1', '1552713530', '1552713530');
INSERT INTO `ky_action_log` VALUES ('1715', '1', 'admin', '127.0.0.1', '修改', '修改购墓信息购买人：订单号：CW20190316085213', '/sell/sell_submit.html', '1', '1552713538', '1552713538');
INSERT INTO `ky_action_log` VALUES ('1716', '1', 'admin', '127.0.0.1', '修改', '修改购墓信息购买人：订单号：CW20190316085213', '/sell/sell_submit.html', '1', '1552713567', '1552713567');
INSERT INTO `ky_action_log` VALUES ('1717', '1', 'admin', '127.0.0.1', '修改', '修改购墓信息购买人：订单号：CW20190316085213', '/sell/sell_submit.html', '1', '1552713775', '1552713775');
INSERT INTO `ky_action_log` VALUES ('1718', '1', 'admin', '127.0.0.1', '修改', '修改购墓信息购买人：订单号：CW20190316085213', '/sell/sell_submit.html', '1', '1552713827', '1552713827');
INSERT INTO `ky_action_log` VALUES ('1719', '1', 'admin', '127.0.0.1', '修改', '修改购墓信息购买人：订单号：CW20190316085213', '/sell/sell_submit.html', '1', '1552713987', '1552713987');
INSERT INTO `ky_action_log` VALUES ('1720', '1', 'admin', '127.0.0.1', '修改', '修改购墓信息购买人：订单号：CW20190316085213', '/sell/sell_submit.html', '1', '1552714099', '1552714099');
INSERT INTO `ky_action_log` VALUES ('1721', '1', 'admin', '127.0.0.1', '修改', '修改购墓信息购买人：订单号：CW20190316085213', '/sell/sell_submit.html', '1', '1552714174', '1552714174');
INSERT INTO `ky_action_log` VALUES ('1722', '1', 'admin', '127.0.0.1', '修改', '修改购墓信息购买人：订单号：CW20190316085213', '/sell/sell_submit.html', '1', '1552714269', '1552714269');
INSERT INTO `ky_action_log` VALUES ('1723', '1', 'admin', '127.0.0.1', '修改', '修改购墓信息购买人：订单号：CW20190316085213', '/sell/sell_submit.html', '1', '1552714295', '1552714295');
INSERT INTO `ky_action_log` VALUES ('1724', '1', 'admin', '127.0.0.1', '修改', '修改购墓信息购买人：订单号：CW20190316085213', '/sell/sell_submit.html', '1', '1552714352', '1552714352');
INSERT INTO `ky_action_log` VALUES ('1725', '1', 'admin', '127.0.0.1', '修改', '修改购墓信息购买人：订单号：CW20190316085213', '/sell/sell_submit.html', '1', '1552714535', '1552714535');
INSERT INTO `ky_action_log` VALUES ('1726', '1', 'admin', '127.0.0.1', '修改', '修改购墓信息购买人：订单号：CW20190316085213', '/sell/sell_submit.html', '1', '1552714657', '1552714657');
INSERT INTO `ky_action_log` VALUES ('1727', '1', 'admin', '127.0.0.1', '修改', '修改购墓信息购买人：订单号：CW20190316085213', '/sell/sell_submit.html', '1', '1552715952', '1552715952');
INSERT INTO `ky_action_log` VALUES ('1728', '1', 'admin', '127.0.0.1', '修改', '修改购墓信息购买人：订单号：CW20190316085213', '/sell/sell_submit.html', '1', '1552716100', '1552716100');
INSERT INTO `ky_action_log` VALUES ('1729', '1', 'admin', '127.0.0.1', '修改', '修改购墓信息购买人：订单号：CW20190316085213', '/sell/sell_submit.html', '1', '1552716175', '1552716175');
INSERT INTO `ky_action_log` VALUES ('1730', '1', 'admin', '127.0.0.1', '修改', '修改购墓信息购买人：订单号：CW20190316085213', '/sell/sell_submit.html', '1', '1552716525', '1552716525');
INSERT INTO `ky_action_log` VALUES ('1731', '1', 'admin', '127.0.0.1', '新增', '新增收费项目信息，name：安葬礼仪', '/chargeitem/chargeitemadd_ajax_submit.html', '1', '1552717874', '1552717874');
INSERT INTO `ky_action_log` VALUES ('1732', '1', 'admin', '127.0.0.1', '编辑', '编辑收费项目信息，name：安葬礼仪', '/chargeitem/chargeitemedit_ajax_submit.html', '1', '1552718407', '1552718407');
INSERT INTO `ky_action_log` VALUES ('1733', '1', 'admin', '127.0.0.1', '编辑', '编辑收费项目信息，name：安葬礼仪', '/chargeitem/chargeitemedit_ajax_submit.html', '1', '1552718534', '1552718534');
INSERT INTO `ky_action_log` VALUES ('1734', '1', 'admin', '127.0.0.1', '编辑', '编辑收费项目信息，name：安葬礼仪', '/chargeitem/chargeitemedit_ajax_submit.html', '1', '1552718575', '1552718575');
INSERT INTO `ky_action_log` VALUES ('1735', '1', 'admin', '127.0.0.1', '编辑', '编辑收费项目信息，name：安葬礼仪', '/chargeitem/chargeitemedit_ajax_submit.html', '1', '1552718736', '1552718736');
INSERT INTO `ky_action_log` VALUES ('1736', '1', 'admin', '127.0.0.1', '新增', '新增收费项目信息，name：锣鼓乐队', '/chargeitem/chargeitemadd_ajax_submit.html', '1', '1552718867', '1552718867');
INSERT INTO `ky_action_log` VALUES ('1737', '1', 'admin', '127.0.0.1', '编辑', '编辑收费项目信息，name：墓位费', '/chargeitem/chargeitemedit_ajax_submit.html', '1', '1552719304', '1552719304');
INSERT INTO `ky_action_log` VALUES ('1738', '1', 'admin', '127.0.0.1', '编辑', '编辑收费项目信息，name：绿化费', '/chargeitem/chargeitemedit_ajax_submit.html', '1', '1552719316', '1552719316');
INSERT INTO `ky_action_log` VALUES ('1739', '1', 'admin', '127.0.0.1', '编辑', '编辑收费项目信息，name：管理费', '/chargeitem/chargeitemedit_ajax_submit.html', '1', '1552719326', '1552719326');
INSERT INTO `ky_action_log` VALUES ('1740', '1', 'admin', '127.0.0.1', '编辑', '编辑收费项目信息，name：墓证费', '/chargeitem/chargeitemedit_ajax_submit.html', '1', '1552719341', '1552719341');
INSERT INTO `ky_action_log` VALUES ('1741', '1', 'admin', '127.0.0.1', '编辑', '编辑服务信息，name：骨灰坛', '/serviceinfo/serviceinfoedit_ajax_submit.html', '1', '1552720104', '1552720104');
INSERT INTO `ky_action_log` VALUES ('1742', '1', 'admin', '127.0.0.1', '新增', '新增服务信息，name：瓷像安装', '/serviceinfo/serviceinfoadd_ajax_submit.html', '1', '1552720153', '1552720153');
INSERT INTO `ky_action_log` VALUES ('1743', '1', 'admin', '127.0.0.1', '编辑', '编辑服务信息，name：锣鼓乐队', '/serviceinfo/serviceinfoedit_ajax_submit.html', '1', '1552720163', '1552720163');
INSERT INTO `ky_action_log` VALUES ('1744', '1', 'admin', '127.0.0.1', '登录', '登录操作，username：admin', '/login/loginhandle.html', '1', '1552724252', '1552724252');
INSERT INTO `ky_action_log` VALUES ('1745', '1', 'admin', '127.0.0.1', '编辑', '编辑收费项目信息，name：管理费', '/chargeitem/chargeitemedit_ajax_submit.html', '1', '1552728735', '1552728735');
INSERT INTO `ky_action_log` VALUES ('1746', '1', 'admin', '127.0.0.1', '登录', '登录操作，username：admin', '/login/loginhandle.html', '1', '1552868842', '1552868842');
INSERT INTO `ky_action_log` VALUES ('1747', '1', 'admin', '127.0.0.1', '新增加', '增加安葬信息表：张飞', '/bury/bury_save_submit.html', '1', '1552884594', '1552884594');
INSERT INTO `ky_action_log` VALUES ('1748', '1', 'admin', '127.0.0.1', '新增加', '增加安葬信息表：张飞', '/bury/bury_save_submit.html', '1', '1552884662', '1552884662');
INSERT INTO `ky_action_log` VALUES ('1749', '1', 'admin', '127.0.0.1', '新增加', '增加安葬信息表：张飞', '/bury/bury_save_submit.html', '1', '1552884880', '1552884880');
INSERT INTO `ky_action_log` VALUES ('1750', '1', 'admin', '127.0.0.1', '新增加', '增加安葬信息表：张飞', '/bury/bury_save_submit.html', '1', '1552884903', '1552884903');
INSERT INTO `ky_action_log` VALUES ('1751', '1', 'admin', '127.0.0.1', '新增加', '增加安葬信息表：张飞', '/bury/bury_save_submit.html', '1', '1552885202', '1552885202');
INSERT INTO `ky_action_log` VALUES ('1752', '1', 'admin', '127.0.0.1', '新增加', '增加安葬信息表：张飞', '/bury/bury_save_submit.html', '1', '1552885346', '1552885346');
INSERT INTO `ky_action_log` VALUES ('1753', '1', 'admin', '127.0.0.1', '新增加', '增加安葬信息表：张飞', '/bury/bury_save_submit.html', '1', '1552887310', '1552887310');
INSERT INTO `ky_action_log` VALUES ('1754', '1', 'admin', '127.0.0.1', '新增加', '增加安葬信息表：张飞', '/bury/bury_save_submit.html', '1', '1552887439', '1552887439');
INSERT INTO `ky_action_log` VALUES ('1755', '1', 'admin', '127.0.0.1', '新增加', '增加购墓信息购买人：张三', '/sell/sell_submit.html', '1', '1552887676', '1552887676');
INSERT INTO `ky_action_log` VALUES ('1756', '1', 'admin', '127.0.0.1', '新增加', '增加购墓信息购买人：张三', '/sell/sell_submit.html', '1', '1552887692', '1552887692');
INSERT INTO `ky_action_log` VALUES ('1757', '1', 'admin', '127.0.0.1', '新增加', '增加购墓信息购买人：张三', '/sell/sell_submit.html', '1', '1552887798', '1552887798');
INSERT INTO `ky_action_log` VALUES ('1758', '1', 'admin', '127.0.0.1', '新增加', '增加购墓信息购买人：张三', '/sell/sell_submit.html', '1', '1552887990', '1552887990');
INSERT INTO `ky_action_log` VALUES ('1759', '1', 'admin', '127.0.0.1', '新增加', '增加购墓信息购买人：张三', '/sell/sell_submit.html', '1', '1552888039', '1552888039');
INSERT INTO `ky_action_log` VALUES ('1760', '1', 'admin', '127.0.0.1', '修改', '修改购墓信息购买人：订单号：CW20190318014718', '/sell/sell_submit.html', '1', '1552888159', '1552888159');
INSERT INTO `ky_action_log` VALUES ('1761', '1', 'admin', '127.0.0.1', '新增加', '增加购墓信息购买人：张三', '/sell/sell_submit.html', '1', '1552888608', '1552888608');
INSERT INTO `ky_action_log` VALUES ('1762', '1', 'admin', '127.0.0.1', '新增加', '增加安葬信息表：张三', '/bury/bury_save_submit.html', '1', '1552888845', '1552888845');
INSERT INTO `ky_action_log` VALUES ('1763', '1', 'admin', '127.0.0.1', '新增加', '增加安葬信息表：张三', '/bury/bury_save_submit.html', '1', '1552889046', '1552889046');
INSERT INTO `ky_action_log` VALUES ('1764', '1', 'admin', '127.0.0.1', '新增加', '增加安葬信息表：张三', '/bury/bury_save_submit.html', '1', '1552889089', '1552889089');
INSERT INTO `ky_action_log` VALUES ('1765', '1', 'admin', '127.0.0.1', '新增加', '增加购墓信息购买人：张三', '/sell/sell_submit.html', '1', '1552889153', '1552889153');
INSERT INTO `ky_action_log` VALUES ('1766', '1', 'admin', '127.0.0.1', '新增加', '增加安葬信息表：张三', '/bury/bury_save_submit.html', '1', '1552889453', '1552889453');
INSERT INTO `ky_action_log` VALUES ('1767', '1', 'admin', '127.0.0.1', '新增加', '增加购墓信息购买人：张三', '/sell/sell_submit.html', '1', '1552889853', '1552889853');
INSERT INTO `ky_action_log` VALUES ('1768', '1', 'admin', '127.0.0.1', '新增加', '增加安葬信息表：张三', '/bury/bury_save_submit.html', '1', '1552889908', '1552889908');
INSERT INTO `ky_action_log` VALUES ('1769', '1', 'admin', '127.0.0.1', '修改', '修改下葬信息购买人：订单号：CW20190318021827', '/bury/bury_save_submit.html', '1', '1552890326', '1552890326');
INSERT INTO `ky_action_log` VALUES ('1770', '1', 'admin', '127.0.0.1', '修改', '修改下葬信息购买人：订单号：CW20190318021827', '/bury/bury_save_submit.html', '1', '1552890414', '1552890414');
INSERT INTO `ky_action_log` VALUES ('1771', '1', 'admin', '127.0.0.1', '修改', '修改下葬信息购买人：订单号：CW20190318021827', '/bury/bury_save_submit.html', '1', '1552890510', '1552890510');
INSERT INTO `ky_action_log` VALUES ('1772', '1', 'admin', '127.0.0.1', '删除', '安葬信息删除，where：id=2', '/bury/bury_delete_ajax.html', '1', '1552891672', '1552891672');
INSERT INTO `ky_action_log` VALUES ('1773', '1', 'admin', '127.0.0.1', '新增加', '增加安葬信息表：张三', '/bury/bury_save_submit.html', '1', '1552891993', '1552891993');
INSERT INTO `ky_action_log` VALUES ('1774', '1', 'admin', '127.0.0.1', '修改', '修改下葬信息购买人：订单号：CW20190318025243', '/bury/bury_save_submit.html', '1', '1552892224', '1552892224');
INSERT INTO `ky_action_log` VALUES ('1775', '1', 'admin', '127.0.0.1', '修改', '修改下葬信息购买人：订单号：CW20190318025243', '/bury/bury_save_submit.html', '1', '1552892308', '1552892308');
INSERT INTO `ky_action_log` VALUES ('1776', '1', 'admin', '127.0.0.1', '修改', '修改下葬信息购买人：订单号：CW20190318025243', '/bury/bury_save_submit.html', '1', '1552892381', '1552892381');
INSERT INTO `ky_action_log` VALUES ('1777', '1', 'admin', '127.0.0.1', '新增加', '增加安葬信息表：李思思', '/bury/bury_save_submit.html', '1', '1552892525', '1552892525');
INSERT INTO `ky_action_log` VALUES ('1778', '1', 'admin', '127.0.0.1', '修改', '修改下葬信息购买人：订单号：CW20190318030204', '/bury/bury_save_submit.html', '1', '1552892550', '1552892550');
INSERT INTO `ky_action_log` VALUES ('1779', '1', 'admin', '127.0.0.1', '删除', '安葬信息删除，where：id=4', '/bury/bury_delete_ajax.html', '1', '1552892798', '1552892798');
INSERT INTO `ky_action_log` VALUES ('1780', '1', 'admin', '127.0.0.1', '删除', '安葬信息删除，where：id=3', '/bury/bury_delete_ajax.html', '1', '1552892878', '1552892878');
INSERT INTO `ky_action_log` VALUES ('1781', '1', 'admin', '127.0.0.1', '新增加', '增加安葬信息表：张三', '/bury/bury_save_submit.html', '1', '1552892999', '1552892999');
INSERT INTO `ky_action_log` VALUES ('1782', '1', 'admin', '127.0.0.1', '新增加', '增加安葬信息表：李思思', '/bury/bury_save_submit.html', '1', '1552893010', '1552893010');
INSERT INTO `ky_action_log` VALUES ('1783', '1', 'admin', '127.0.0.1', '删除', '安葬信息删除，where：id=6', '/bury/bury_delete_ajax.html', '1', '1552893033', '1552893033');
INSERT INTO `ky_action_log` VALUES ('1784', '1', 'admin', '127.0.0.1', '修改', '修改下葬信息购买人：订单号：CW20190318030958', '/bury/bury_save_submit.html', '1', '1552896087', '1552896087');
INSERT INTO `ky_action_log` VALUES ('1785', '1', 'admin', '127.0.0.1', '删除', '安葬信息删除，where：id=5', '/bury/bury_delete_ajax.html', '1', '1552896241', '1552896241');
INSERT INTO `ky_action_log` VALUES ('1786', '1', 'admin', '127.0.0.1', '新增加', '增加安葬信息表：张三', '/bury/bury_save_submit.html', '1', '1552896319', '1552896319');
INSERT INTO `ky_action_log` VALUES ('1787', '1', 'admin', '127.0.0.1', '删除', '安葬信息删除，where：id=7', '/bury/bury_delete_ajax.html', '1', '1552896330', '1552896330');
INSERT INTO `ky_action_log` VALUES ('1788', '1', 'admin', '127.0.0.1', '新增加', '增加安葬信息表：张三', '/bury/bury_save_submit.html', '1', '1552896352', '1552896352');
INSERT INTO `ky_action_log` VALUES ('1789', '1', 'admin', '127.0.0.1', '删除', '安葬信息删除，where：id=8', '/bury/bury_delete_ajax.html', '1', '1552896360', '1552896360');
INSERT INTO `ky_action_log` VALUES ('1790', '1', 'admin', '127.0.0.1', '新增加', '增加安葬信息表：张三', '/bury/bury_save_submit.html', '1', '1552896607', '1552896607');
INSERT INTO `ky_action_log` VALUES ('1791', '1', 'admin', '127.0.0.1', '删除', '安葬信息删除，where：id=9', '/bury/bury_delete_ajax.html', '1', '1552896799', '1552896799');
INSERT INTO `ky_action_log` VALUES ('1792', '1', 'admin', '127.0.0.1', '新增加', '增加安葬信息表：张三', '/bury/bury_save_submit.html', '1', '1552896849', '1552896849');
INSERT INTO `ky_action_log` VALUES ('1793', '1', 'admin', '127.0.0.1', '删除', '安葬信息删除，where：id=10', '/bury/bury_delete_ajax.html', '1', '1552896864', '1552896864');
INSERT INTO `ky_action_log` VALUES ('1794', '1', 'admin', '127.0.0.1', '新增加', '增加安葬信息表：张三', '/bury/bury_save_submit.html', '1', '1552896911', '1552896911');
INSERT INTO `ky_action_log` VALUES ('1795', '1', 'admin', '127.0.0.1', '登录', '登录操作，username：admin', '/login/loginhandle.html', '1', '1552909635', '1552909635');
INSERT INTO `ky_action_log` VALUES ('1796', '1', 'admin', '127.0.0.1', '登录', '登录操作，username：admin', '/login/loginhandle.html', '1', '1552955392', '1552955392');
INSERT INTO `ky_action_log` VALUES ('1797', '1', 'admin', '127.0.0.1', '编辑', '编辑配置，name：financetype', '/config/configedit.html', '1', '1552962325', '1552962325');
INSERT INTO `ky_action_log` VALUES ('1798', '1', 'admin', '127.0.0.1', '新增', '新增收费项目信息，name：墓穴变更费', '/chargeitem/chargeitemadd_ajax_submit.html', '1', '1552974433', '1552974433');
INSERT INTO `ky_action_log` VALUES ('1799', '1', 'admin', '127.0.0.1', '编辑', '编辑收费项目信息，name：安葬礼仪', '/chargeitem/chargeitemedit_ajax_submit.html', '1', '1552974442', '1552974442');
INSERT INTO `ky_action_log` VALUES ('1800', '1', 'admin', '127.0.0.1', '编辑', '编辑收费项目信息，name：变更补交', '/chargeitem/chargeitemedit_ajax_submit.html', '1', '1552974563', '1552974563');
INSERT INTO `ky_action_log` VALUES ('1801', '1', 'admin', '127.0.0.1', '编辑', '编辑配置，name：allow_url', '/config/configedit.html', '1', '1552975663', '1552975663');
INSERT INTO `ky_action_log` VALUES ('1802', '1', 'admin', '127.0.0.1', '编辑', '编辑配置，name：allow_url', '/config/configedit.html', '1', '1552983213', '1552983213');
INSERT INTO `ky_action_log` VALUES ('1803', '1', 'admin', '127.0.0.1', '新增', '新增收费项目信息，name：退费金额', '/chargeitem/chargeitemadd_ajax_submit.html', '1', '1552987509', '1552987509');
INSERT INTO `ky_action_log` VALUES ('1804', '1', 'admin', '127.0.0.1', '编辑', '编辑配置，name：financetype', '/config/configedit.html', '1', '1552987537', '1552987537');
INSERT INTO `ky_action_log` VALUES ('1805', '1', 'admin', '127.0.0.1', '编辑', '编辑收费项目信息，name：退费金额', '/chargeitem/chargeitemedit_ajax_submit.html', '1', '1552987605', '1552987605');
INSERT INTO `ky_action_log` VALUES ('1806', '1', 'admin', '127.0.0.1', '登录', '登录操作，username：admin', '/login/loginhandle.html', '1', '1552996553', '1552996553');
INSERT INTO `ky_action_log` VALUES ('1807', '1', 'admin', '127.0.0.1', '新增加', '增加退款记录表：张三', '/cancel/cancel_submit_ajax.html', '1', '1552999688', '1552999688');
INSERT INTO `ky_action_log` VALUES ('1808', '1', 'admin', '127.0.0.1', '新增加', '增加退款记录表：张三', '/cancel/cancel_submit_ajax.html', '1', '1552999909', '1552999909');
INSERT INTO `ky_action_log` VALUES ('1809', '1', 'admin', '127.0.0.1', '新增', '新增菜单，name：job/index.php', '/menu/menuadd.html', '1', '1553002346', '1553002346');
INSERT INTO `ky_action_log` VALUES ('1810', '1', 'admin', '127.0.0.1', '编辑', '编辑菜单，name：工作中心', '/menu/menuedit.html', '1', '1553002411', '1553002411');
INSERT INTO `ky_action_log` VALUES ('1811', '1', 'admin', '127.0.0.1', '新增', '新增菜单，name：优惠申请审批', '/menu/menuadd.html', '1', '1553002526', '1553002526');
INSERT INTO `ky_action_log` VALUES ('1812', '1', 'admin', '127.0.0.1', '新增', '新增菜单，name：退费申请审批', '/menu/menuadd.html', '1', '1553002572', '1553002572');
INSERT INTO `ky_action_log` VALUES ('1813', '1', 'admin', '127.0.0.1', '授权', '会员授权，id：21', '/member/memberauth.html', '1', '1553002613', '1553002613');
INSERT INTO `ky_action_log` VALUES ('1814', '1', 'admin', '127.0.0.1', '授权', '设置权限组权限，id：19', '/auth/menuauth.html', '1', '1553002659', '1553002659');
INSERT INTO `ky_action_log` VALUES ('1815', '1', 'admin', '127.0.0.1', '新增', '新增菜单，name：退费申请', '/menu/menuadd.html', '1', '1553002895', '1553002895');
INSERT INTO `ky_action_log` VALUES ('1816', '1', 'admin', '127.0.0.1', '编辑', '编辑配置，name：allow_url', '/config/configedit.html', '1', '1553002982', '1553002982');
INSERT INTO `ky_action_log` VALUES ('1817', '1', 'admin', '127.0.0.1', '编辑', '编辑配置，name：allow_url', '/config/configedit.html', '1', '1553003045', '1553003045');
INSERT INTO `ky_action_log` VALUES ('1818', '1', 'admin', '127.0.0.1', '登录', '登录操作，username：admin', '/login/loginhandle.html', '1', '1553004770', '1553004770');
INSERT INTO `ky_action_log` VALUES ('1819', '21', '曾云利', '127.0.0.1', '登录', '登录操作，username：曾云利', '/login/loginhandle.html', '1', '1553005250', '1553005250');
INSERT INTO `ky_action_log` VALUES ('1820', '21', '曾云利', '127.0.0.1', '新增', '新增菜单，name：退费处理', '/menu/menuadd.html', '1', '1553006236', '1553006236');
INSERT INTO `ky_action_log` VALUES ('1821', '1', 'admin', '127.0.0.1', '登录', '登录操作，username：admin', '/login/loginhandle.html', '1', '1553041174', '1553041174');
INSERT INTO `ky_action_log` VALUES ('1822', '1', 'admin', '127.0.0.1', '授权', '设置权限组权限，id：19', '/auth/menuauth.html', '1', '1553041229', '1553041229');
INSERT INTO `ky_action_log` VALUES ('1823', '21', '曾云利', '127.0.0.1', '登录', '登录操作，username：曾云利', '/login/loginhandle.html', '1', '1553041411', '1553041411');
INSERT INTO `ky_action_log` VALUES ('1824', '21', '曾云利', '127.0.0.1', '编辑', '编辑配置，name：allow_url', '/config/configedit.html', '1', '1553051223', '1553051223');
INSERT INTO `ky_action_log` VALUES ('1825', '21', '曾云利', '127.0.0.1', '新增', '新增菜单，name：申请删除', '/menu/menuadd.html', '1', '1553052913', '1553052913');
INSERT INTO `ky_action_log` VALUES ('1826', '1', 'admin', '127.0.0.1', '登录', '登录操作，username：admin', '/login/loginhandle.html', '1', '1553052946', '1553052946');
INSERT INTO `ky_action_log` VALUES ('1827', '1', 'admin', '127.0.0.1', '授权', '设置权限组权限，id：19', '/auth/menuauth.html', '1', '1553052973', '1553052973');
INSERT INTO `ky_action_log` VALUES ('1828', '21', '曾云利', '127.0.0.1', '登录', '登录操作，username：曾云利', '/login/loginhandle.html', '1', '1553053245', '1553053245');
INSERT INTO `ky_action_log` VALUES ('1829', '21', '曾云利', '127.0.0.1', '编辑', '编辑菜单，name：申请删除', '/menu/menuedit.html', '1', '1553053324', '1553053324');
INSERT INTO `ky_action_log` VALUES ('1830', '1', 'admin', '127.0.0.1', '登录', '登录操作，username：admin', '/login/loginhandle.html', '1', '1553053538', '1553053538');
INSERT INTO `ky_action_log` VALUES ('1831', '1', 'admin', '127.0.0.1', '授权', '设置权限组权限，id：19', '/auth/menuauth.html', '1', '1553053615', '1553053615');
INSERT INTO `ky_action_log` VALUES ('1832', '1', 'admin', '127.0.0.1', '授权', '设置权限组权限，id：18', '/auth/menuauth.html', '1', '1553053646', '1553053646');
INSERT INTO `ky_action_log` VALUES ('1833', '21', '曾云利', '127.0.0.1', '登录', '登录操作，username：曾云利', '/login/loginhandle.html', '1', '1553053680', '1553053680');
INSERT INTO `ky_action_log` VALUES ('1834', '21', '曾云利', '127.0.0.1', '编辑', '编辑菜单，name：申请删除', '/menu/menuedit.html', '1', '1553055076', '1553055076');
INSERT INTO `ky_action_log` VALUES ('1835', '21', '曾云利', '127.0.0.1', '删除', '退费信息删除，where：id=1', '/cancel/canacel_delete_ajax.html', '1', '1553059289', '1553059289');
INSERT INTO `ky_action_log` VALUES ('1836', '1', 'admin', '127.0.0.1', '登录', '登录操作，username：admin', '/login/loginhandle.html', '1', '1553059379', '1553059379');
INSERT INTO `ky_action_log` VALUES ('1837', '1', 'admin', '127.0.0.1', '新增', '新增配置，name：retrunprice', '/config/configadd.html', '1', '1553060662', '1553060662');
INSERT INTO `ky_action_log` VALUES ('1838', '1', 'admin', '127.0.0.1', '新增加', '增加退款记录表：张三', '/cancel/cancel_submit_ajax.html', '1', '1553061549', '1553061549');
INSERT INTO `ky_action_log` VALUES ('1839', '1', 'admin', '127.0.0.1', '删除', '退费信息删除，where：id=2', '/cancel/canacel_delete_ajax.html', '1', '1553062666', '1553062666');
INSERT INTO `ky_action_log` VALUES ('1840', '1', 'admin', '127.0.0.1', '新增加', '增加退款记录表：张三', '/cancel/cancel_submit_ajax.html', '1', '1553062726', '1553062726');
INSERT INTO `ky_action_log` VALUES ('1841', '1', 'admin', '127.0.0.1', '删除', '退费信息删除，where：id=3', '/cancel/canacel_delete_ajax.html', '1', '1553062739', '1553062739');
INSERT INTO `ky_action_log` VALUES ('1842', '1', 'admin', '127.0.0.1', '新增加', '增加退款记录表：张三', '/cancel/cancel_submit_ajax.html', '1', '1553062810', '1553062810');
INSERT INTO `ky_action_log` VALUES ('1843', '1', 'admin', '127.0.0.1', '删除', '退费信息删除，where：id=4', '/cancel/canacel_delete_ajax.html', '1', '1553062821', '1553062821');
INSERT INTO `ky_action_log` VALUES ('1844', '1', 'admin', '127.0.0.1', '新增加', '增加退款记录表：张三', '/cancel/cancel_submit_ajax.html', '1', '1553062830', '1553062830');
INSERT INTO `ky_action_log` VALUES ('1845', '1', 'admin', '127.0.0.1', '删除', '退费信息删除，where：id=5', '/cancel/canacel_delete_ajax.html', '1', '1553062845', '1553062845');
INSERT INTO `ky_action_log` VALUES ('1846', '1', 'admin', '127.0.0.1', '新增加', '增加退款记录表：张三', '/cancel/cancel_submit_ajax.html', '1', '1553062858', '1553062858');
INSERT INTO `ky_action_log` VALUES ('1847', '21', '曾云利', '127.0.0.1', '登录', '登录操作，username：曾云利', '/login/loginhandle.html', '1', '1553062931', '1553062931');
INSERT INTO `ky_action_log` VALUES ('1848', '21', '曾云利', '127.0.0.1', '删除', '退费信息删除，where：id=6', '/cancel/canacel_delete_ajax.html', '1', '1553063425', '1553063425');
INSERT INTO `ky_action_log` VALUES ('1849', '21', '曾云利', '127.0.0.1', '新增加', '增加退款记录表：张三', '/cancel/cancel_submit_ajax.html', '1', '1553063442', '1553063442');
INSERT INTO `ky_action_log` VALUES ('1850', '21', '曾云利', '127.0.0.1', '删除', '退费信息删除，where：id=7', '/cancel/canacel_delete_ajax.html', '1', '1553063461', '1553063461');
INSERT INTO `ky_action_log` VALUES ('1851', '21', '曾云利', '127.0.0.1', '新增加', '增加退款记录表：张三', '/cancel/cancel_submit_ajax.html', '1', '1553063476', '1553063476');
INSERT INTO `ky_action_log` VALUES ('1852', '21', '曾云利', '127.0.0.1', '编辑', '编辑配置，name：allow_url', '/config/configedit.html', '1', '1553067218', '1553067218');
INSERT INTO `ky_action_log` VALUES ('1853', '21', '曾云利', '127.0.0.1', '新增', '新增菜单，name：墓主增加', '/menu/menuadd.html', '1', '1553071705', '1553071705');
INSERT INTO `ky_action_log` VALUES ('1854', '21', '曾云利', '127.0.0.1', '编辑', '编辑菜单，name：墓主管理', '/menu/menuedit.html', '1', '1553071738', '1553071738');
INSERT INTO `ky_action_log` VALUES ('1855', '1', 'admin', '127.0.0.1', '登录', '登录操作，username：admin', '/login/loginhandle.html', '1', '1553071755', '1553071755');
INSERT INTO `ky_action_log` VALUES ('1856', '1', 'admin', '127.0.0.1', '编辑', '编辑配置，name：allow_url', '/config/configedit.html', '1', '1553072430', '1553072430');
INSERT INTO `ky_action_log` VALUES ('1857', '1', 'admin', '127.0.0.1', '新增加', '增加安葬信息表：胜多负少', '/bury/deather_sumit_ajax.html', '1', '1553074043', '1553074043');
INSERT INTO `ky_action_log` VALUES ('1858', '1', 'admin', '127.0.0.1', '新增加', '管理墓主信息表：水电费地方', '/bury/deather_sumit_ajax.html', '1', '1553074131', '1553074131');
INSERT INTO `ky_action_log` VALUES ('1859', '1', 'admin', '127.0.0.1', '新增', '新增菜单，name：墓主删除', '/menu/menuadd.html', '1', '1553074848', '1553074848');
INSERT INTO `ky_action_log` VALUES ('1860', '1', 'admin', '127.0.0.1', '编辑', '编辑菜单，name：墓主删除', '/menu/menuedit.html', '1', '1553074861', '1553074861');
INSERT INTO `ky_action_log` VALUES ('1861', '1', 'admin', '127.0.0.1', '删除', '墓主信息删除，where：id=4', '/bury/deather_delete_ajax.html', '1', '1553075092', '1553075092');
INSERT INTO `ky_action_log` VALUES ('1862', '1', 'admin', '127.0.0.1', '新增加', '管理墓主信息表：似懂非懂是', '/bury/deather_sumit_ajax.html', '1', '1553075614', '1553075614');
INSERT INTO `ky_action_log` VALUES ('1863', '1', 'admin', '127.0.0.1', '登录', '登录操作，username：admin', '/login/loginhandle.html', '1', '1553084730', '1553084730');
INSERT INTO `ky_action_log` VALUES ('1864', '1', 'admin', '127.0.0.1', '新增加', '管理墓主信息表：李四111', '/bury/deather_sumit_ajax.html', '1', '1553084781', '1553084781');
INSERT INTO `ky_action_log` VALUES ('1865', '1', 'admin', '127.0.0.1', '删除', '墓主信息删除，where：id=3', '/bury/deather_delete_ajax.html', '1', '1553084811', '1553084811');
INSERT INTO `ky_action_log` VALUES ('1866', '1', 'admin', '127.0.0.1', '编辑', '编辑配置，name：allow_url', '/config/configedit.html', '1', '1553088606', '1553088606');
INSERT INTO `ky_action_log` VALUES ('1867', '1', 'admin', '127.0.0.1', '新增加', '增加变更信息购买人：张三', '/sellchang/chang_submit.html', '1', '1553089409', '1553089409');
INSERT INTO `ky_action_log` VALUES ('1868', '1', 'admin', '127.0.0.1', '新增加', '增加变更信息购买人：张三', '/sellchang/chang_submit.html', '1', '1553089497', '1553089497');
INSERT INTO `ky_action_log` VALUES ('1869', '1', 'admin', '127.0.0.1', '新增加', '增加变更信息购买人：张三', '/sellchang/chang_submit.html', '1', '1553089545', '1553089545');
INSERT INTO `ky_action_log` VALUES ('1870', '1', 'admin', '127.0.0.1', '新增加', '增加变更信息购买人：张三', '/sellchang/chang_submit.html', '1', '1553089660', '1553089660');
INSERT INTO `ky_action_log` VALUES ('1871', '1', 'admin', '127.0.0.1', '新增加', '增加变更信息购买人：张三', '/sellchang/chang_submit.html', '1', '1553090256', '1553090256');
INSERT INTO `ky_action_log` VALUES ('1872', '1', 'admin', '127.0.0.1', '新增加', '增加变更信息购买人：张三', '/sellchang/chang_submit.html', '1', '1553090926', '1553090926');
INSERT INTO `ky_action_log` VALUES ('1873', '1', 'admin', '127.0.0.1', '新增加', '增加变更信息购买人：张三', '/sellchang/chang_submit.html', '1', '1553091352', '1553091352');
INSERT INTO `ky_action_log` VALUES ('1874', '1', 'admin', '127.0.0.1', '新增加', '增加变更信息购买人：张三', '/sellchang/chang_submit.html', '1', '1553091399', '1553091399');
INSERT INTO `ky_action_log` VALUES ('1875', '1', 'admin', '127.0.0.1', '新增加', '增加变更信息购买人：张三', '/sellchang/chang_submit.html', '1', '1553091426', '1553091426');
INSERT INTO `ky_action_log` VALUES ('1876', '1', 'admin', '127.0.0.1', '新增加', '增加变更信息购买人：张三', '/sellchang/chang_submit.html', '1', '1553091453', '1553091453');
INSERT INTO `ky_action_log` VALUES ('1877', '1', 'admin', '127.0.0.1', '新增加', '增加变更信息购买人：张三', '/sellchang/chang_submit.html', '1', '1553091485', '1553091485');
INSERT INTO `ky_action_log` VALUES ('1878', '1', 'admin', '127.0.0.1', '新增加', '增加变更信息购买人：张三', '/sellchang/chang_submit.html', '1', '1553091563', '1553091563');
INSERT INTO `ky_action_log` VALUES ('1879', '1', 'admin', '127.0.0.1', '新增加', '增加变更信息购买人：张三', '/sellchang/chang_submit.html', '1', '1553091739', '1553091739');
INSERT INTO `ky_action_log` VALUES ('1880', '1', 'admin', '127.0.0.1', '新增加', '增加退款记录表：张三', '/cancel/cancel_submit_ajax.html', '1', '1553091905', '1553091905');
INSERT INTO `ky_action_log` VALUES ('1881', '1', 'admin', '127.0.0.1', '登录', '登录操作，username：admin', '/login/loginhandle.html', '1', '1553093948', '1553093948');
INSERT INTO `ky_action_log` VALUES ('1882', '1', 'admin', '127.0.0.1', '登录', '登录操作，username：admin', '/login/loginhandle.html', '1', '1553131383', '1553131383');
INSERT INTO `ky_action_log` VALUES ('1883', '1', 'admin', '127.0.0.1', '新增', '新增菜单，name：点灯服务', '/menu/menuadd.html', '1', '1553131458', '1553131458');
INSERT INTO `ky_action_log` VALUES ('1884', '1', 'admin', '127.0.0.1', '新增', '新增菜单，name：增加点灯记录', '/menu/menuadd.html', '1', '1553131494', '1553131494');
INSERT INTO `ky_action_log` VALUES ('1885', '1', 'admin', '127.0.0.1', '编辑', '编辑菜单，name：增加点灯记录', '/menu/menuedit.html', '1', '1553131760', '1553131760');
INSERT INTO `ky_action_log` VALUES ('1886', '1', 'admin', '127.0.0.1', '编辑', '编辑菜单，name：菜单列表', '/menu/menuedit.html', '1', '1553131835', '1553131835');
INSERT INTO `ky_action_log` VALUES ('1887', '1', 'admin', '127.0.0.1', '新增', '新增收费项目信息，name：点灯收费', '/chargeitem/chargeitemadd_ajax_submit.html', '1', '1553132172', '1553132172');
INSERT INTO `ky_action_log` VALUES ('1888', '1', 'admin', '127.0.0.1', '新增', '新增收费项目信息，name：点灯收费', '/chargeitem/chargeitemadd_ajax_submit.html', '1', '1553132173', '1553132173');
INSERT INTO `ky_action_log` VALUES ('1889', '1', 'admin', '127.0.0.1', '编辑', '编辑配置，name：financetype', '/config/configedit.html', '1', '1553132306', '1553132306');
INSERT INTO `ky_action_log` VALUES ('1890', '1', 'admin', '127.0.0.1', '编辑', '编辑配置，name：allow_url', '/config/configedit.html', '1', '1553138403', '1553138403');
INSERT INTO `ky_action_log` VALUES ('1891', '1', 'admin', '127.0.0.1', '新增加', '增加点灯信息，预定人：张三', '/light/light_submit_ajax.html', '1', '1553145114', '1553145114');
INSERT INTO `ky_action_log` VALUES ('1892', '1', 'admin', '127.0.0.1', '新增加', '增加点灯信息，预定人：张三', '/light/light_submit_ajax.html', '1', '1553145174', '1553145174');
INSERT INTO `ky_action_log` VALUES ('1893', '1', 'admin', '127.0.0.1', '新增加', '增加点灯信息，预定人：多福多寿', '/light/light_submit_ajax.html', '1', '1553145258', '1553145258');
INSERT INTO `ky_action_log` VALUES ('1894', '1', 'admin', '127.0.0.1', '新增加', '增加点灯信息，预定人：是的发生的', '/light/light_submit_ajax.html', '1', '1553145599', '1553145599');
INSERT INTO `ky_action_log` VALUES ('1895', '1', 'admin', '127.0.0.1', '编辑', '编辑菜单，name：菜单管理', '/menu/menuedit.html', '1', '1553146214', '1553146214');
INSERT INTO `ky_action_log` VALUES ('1896', '1', 'admin', '127.0.0.1', '新增', '新增菜单，name：删除点灯服务', '/menu/menuadd.html', '1', '1553146349', '1553146349');
INSERT INTO `ky_action_log` VALUES ('1897', '1', 'admin', '127.0.0.1', '删除', '点灯信息删除，where：id=12', '/light/light_delete_ajax.html', '1', '1553146677', '1553146677');
INSERT INTO `ky_action_log` VALUES ('1898', '1', 'admin', '127.0.0.1', '删除', '点灯信息删除，where：id=10', '/light/light_delete_ajax.html', '1', '1553146727', '1553146727');
INSERT INTO `ky_action_log` VALUES ('1899', '1', 'admin', '127.0.0.1', '编辑', '编辑配置，name：allow_url', '/config/configedit.html', '1', '1553148001', '1553148001');
INSERT INTO `ky_action_log` VALUES ('1900', '1', 'admin', '127.0.0.1', '登录', '登录操作，username：admin', '/login/loginhandle.html', '1', '1553151699', '1553151699');
INSERT INTO `ky_action_log` VALUES ('1901', '1', 'admin', '127.0.0.1', '新增加', '增加变更信息购买人：张三', '/sellchang/chang_submit.html', '1', '1553152073', '1553152073');
INSERT INTO `ky_action_log` VALUES ('1902', '1', 'admin', '127.0.0.1', '新增加', '增加变更信息购买人：张三', '/sellchang/chang_submit.html', '1', '1553152132', '1553152132');
INSERT INTO `ky_action_log` VALUES ('1903', '1', 'admin', '127.0.0.1', '新增加', '增加变更信息购买人：张三', '/sellchang/chang_submit.html', '1', '1553152152', '1553152152');
INSERT INTO `ky_action_log` VALUES ('1904', '1', 'admin', '127.0.0.1', '新增加', '增加变更信息购买人：张三', '/sellchang/chang_submit.html', '1', '1553152278', '1553152278');
INSERT INTO `ky_action_log` VALUES ('1905', '1', 'admin', '127.0.0.1', '设置', '系统设置保存', '/config/setting.html', '1', '1553154324', '1553154324');
INSERT INTO `ky_action_log` VALUES ('1906', '1', 'admin', '127.0.0.1', '新增加', '增加寄存信息，预定人：张三', '/save/save_submit_ajax.html', '1', '1553157754', '1553157754');
INSERT INTO `ky_action_log` VALUES ('1907', '1', 'admin', '127.0.0.1', '更新寄存信息', '寄存信息 更新，where：id=13', '/save/save_take_ajax.html', '1', '1553158499', '1553158499');
INSERT INTO `ky_action_log` VALUES ('1908', '1', 'admin', '127.0.0.1', '更新寄存信息', '寄存信息 更新，where：id=4', '/save/save_take_ajax.html', '1', '1553158511', '1553158511');
INSERT INTO `ky_action_log` VALUES ('1909', '1', 'admin', '127.0.0.1', '更新寄存信息', '寄存信息 更新，where：id=4', '/save/save_take_ajax.html', '1', '1553158595', '1553158595');
INSERT INTO `ky_action_log` VALUES ('1910', '1', 'admin', '127.0.0.1', '更新寄存信息', '寄存信息 更新，where：id=15', '/save/save_take_ajax.html', '1', '1553158644', '1553158644');
INSERT INTO `ky_action_log` VALUES ('1911', '1', 'admin', '127.0.0.1', '更新寄存信息', '寄存信息 更新，where：id=14', '/save/save_take_ajax.html', '1', '1553158716', '1553158716');
INSERT INTO `ky_action_log` VALUES ('1912', '1', 'admin', '127.0.0.1', '删除', '寄存信息删除，where：id=15', '/save/save_delete_ajax.html', '1', '1553158725', '1553158725');
INSERT INTO `ky_action_log` VALUES ('1913', '1', 'admin', '127.0.0.1', '删除', '点灯信息删除，where：id=16', '/save/save_delete_ajax.html', '1', '1553159401', '1553159401');
INSERT INTO `ky_action_log` VALUES ('1914', '1', 'admin', '127.0.0.1', '删除', '点灯信息删除，where：id=13', '/save/save_delete_ajax.html', '1', '1553159408', '1553159408');
INSERT INTO `ky_action_log` VALUES ('1915', '1', 'admin', '127.0.0.1', '修改', '修改寄存信息信息购买人：订单号：CW20190321044228', '/save/save_submit_ajax.html', '1', '1553161418', '1553161418');
INSERT INTO `ky_action_log` VALUES ('1916', '1', 'admin', '127.0.0.1', '修改', '修改寄存信息信息购买人：订单号：CW20190321044228', '/save/save_submit_ajax.html', '1', '1553161427', '1553161427');
INSERT INTO `ky_action_log` VALUES ('1917', '1', 'admin', '127.0.0.1', '修改', '修改寄存信息信息购买人：订单号：CW20190321044228', '/save/save_submit_ajax.html', '1', '1553161603', '1553161603');
INSERT INTO `ky_action_log` VALUES ('1918', '1', 'admin', '127.0.0.1', '删除', '点灯信息删除，where：id=25', '/save/save_delete_ajax.html', '1', '1553161785', '1553161785');
INSERT INTO `ky_action_log` VALUES ('1919', '1', 'admin', '127.0.0.1', '新增加', '增加寄存信息，预定人：张三', '/save/save_submit_ajax.html', '1', '1553162158', '1553162158');
INSERT INTO `ky_action_log` VALUES ('1920', '1', 'admin', '127.0.0.1', '修改', '修改寄存信息信息购买人：订单号：CW20190321055557', '/save/save_submit_ajax.html', '1', '1553162177', '1553162177');
INSERT INTO `ky_action_log` VALUES ('1921', '1', 'admin', '127.0.0.1', '更新寄存信息', '寄存信息 更新，where：id=13', '/save/save_take_ajax.html', '1', '1553162185', '1553162185');
INSERT INTO `ky_action_log` VALUES ('1922', '1', 'admin', '127.0.0.1', '新增加', '增加预订信息，预定人：张三', '/schedule/schedule_submit_ajax.html', '1', '1553162300', '1553162300');
INSERT INTO `ky_action_log` VALUES ('1923', '1', 'admin', '127.0.0.1', '登录', '登录操作，username：admin', '/login/loginhandle.html', '1', '1553171304', '1553171304');
INSERT INTO `ky_action_log` VALUES ('1924', '1', 'admin', '127.0.0.1', '编辑', '编辑菜单，name：业务大厅', '/menu/menuedit.html', '1', '1553171399', '1553171399');
INSERT INTO `ky_action_log` VALUES ('1925', '1', 'admin', '127.0.0.1', '编辑', '编辑菜单，name：点灯服务', '/menu/menuedit.html', '1', '1553171442', '1553171442');
INSERT INTO `ky_action_log` VALUES ('1926', '1', 'admin', '127.0.0.1', '编辑', '编辑菜单，name：购墓信息增加', '/menu/menuedit.html', '1', '1553171528', '1553171528');
INSERT INTO `ky_action_log` VALUES ('1927', '1', 'admin', '127.0.0.1', '编辑', '编辑菜单，name：墓穴管理', '/menu/menuedit.html', '1', '1553171670', '1553171670');
INSERT INTO `ky_action_log` VALUES ('1928', '1', 'admin', '127.0.0.1', '数据排序', '数据排序调整，model：Menu，id：263，value：2', '/menu/setsort.html', '1', '1553171684', '1553171684');
INSERT INTO `ky_action_log` VALUES ('1929', '1', 'admin', '127.0.0.1', '数据排序', '数据排序调整，model：Menu，id：68，value：5', '/menu/setsort.html', '1', '1553171693', '1553171693');
INSERT INTO `ky_action_log` VALUES ('1930', '1', 'admin', '127.0.0.1', '数据排序', '数据排序调整，model：Menu，id：280，value：2', '/menu/setsort.html', '1', '1553171701', '1553171701');
INSERT INTO `ky_action_log` VALUES ('1931', '1', 'admin', '127.0.0.1', '数据排序', '数据排序调整，model：Menu，id：237，value：4', '/menu/setsort.html', '1', '1553171755', '1553171755');
INSERT INTO `ky_action_log` VALUES ('1932', '1', 'admin', '127.0.0.1', '数据排序', '数据排序调整，model：Menu，id：144，value：6', '/menu/setsort.html', '1', '1553171763', '1553171763');
INSERT INTO `ky_action_log` VALUES ('1933', '1', 'admin', '127.0.0.1', '编辑', '编辑菜单，name：优惠申请审批', '/menu/menuedit.html', '1', '1553171846', '1553171846');
INSERT INTO `ky_action_log` VALUES ('1934', '1', 'admin', '127.0.0.1', '编辑', '编辑菜单，name：删除点灯服务', '/menu/menuedit.html', '1', '1553171891', '1553171891');
INSERT INTO `ky_action_log` VALUES ('1935', '1', 'admin', '127.0.0.1', '编辑', '编辑菜单，name：寄存取走', '/menu/menuedit.html', '1', '1553172116', '1553172116');
INSERT INTO `ky_action_log` VALUES ('1936', '1', 'admin', '127.0.0.1', '编辑', '编辑菜单，name：寄存管理', '/menu/menuedit.html', '1', '1553172157', '1553172157');
INSERT INTO `ky_action_log` VALUES ('1937', '1', 'admin', '127.0.0.1', '登录', '登录操作，username：admin', '/login/loginhandle.html', '1', '1553175629', '1553175629');
INSERT INTO `ky_action_log` VALUES ('1938', '1', 'admin', '127.0.0.1', '登录', '登录操作，username：admin', '/login/loginhandle.html', '1', '1553176471', '1553176471');
INSERT INTO `ky_action_log` VALUES ('1939', '1', 'admin', '127.0.0.1', '登录', '登录操作，username：admin', '/login/loginhandle.html', '1', '1553239110', '1553239110');
INSERT INTO `ky_action_log` VALUES ('1940', '1', 'admin', '127.0.0.1', '登录', '登录操作，username：admin', '/login/loginhandle.html', '1', '1553253831', '1553253831');
INSERT INTO `ky_action_log` VALUES ('1941', '1', 'admin', '127.0.0.1', '修改', '修改预订信息，id3', '/schedule/schedule_submit_ajax.html', '1', '1553257667', '1553257667');
INSERT INTO `ky_action_log` VALUES ('1942', '1', 'admin', '127.0.0.1', '修改', '修改预订信息，id3', '/schedule/schedule_submit_ajax.html', '1', '1553257711', '1553257711');
INSERT INTO `ky_action_log` VALUES ('1943', '1', 'admin', '127.0.0.1', '修改', '修改预订信息，id3', '/schedule/schedule_submit_ajax.html', '1', '1553257878', '1553257878');
INSERT INTO `ky_action_log` VALUES ('1944', '1', 'admin', '127.0.0.1', '修改', '修改预订信息，id3', '/schedule/schedule_submit_ajax.html', '1', '1553258025', '1553258025');
INSERT INTO `ky_action_log` VALUES ('1945', '1', 'admin', '127.0.0.1', '新增加', '增加预订信息，预定人：张三', '/schedule/schedule_submit_ajax.html', '1', '1553258588', '1553258588');
INSERT INTO `ky_action_log` VALUES ('1946', '1', 'admin', '127.0.0.1', '新增加', '增加预订信息，预定人：张三', '/schedule/schedule_submit_ajax.html', '1', '1553259356', '1553259356');
INSERT INTO `ky_action_log` VALUES ('1947', '1', 'admin', '127.0.0.1', '修改', '修改预订信息，id7', '/schedule/schedule_submit_ajax.html', '1', '1553259385', '1553259385');
INSERT INTO `ky_action_log` VALUES ('1948', '1', 'admin', '127.0.0.1', '修改', '修改预订信息，id7', '/schedule/schedule_submit_ajax.html', '1', '1553259403', '1553259403');
INSERT INTO `ky_action_log` VALUES ('1949', '1', 'admin', '127.0.0.1', '修改', '修改预订信息，id7', '/schedule/schedule_submit_ajax.html', '1', '1553259582', '1553259582');
INSERT INTO `ky_action_log` VALUES ('1950', '1', 'admin', '127.0.0.1', '修改', '修改预订信息，id7', '/schedule/schedule_submit_ajax.html', '1', '1553260166', '1553260166');
INSERT INTO `ky_action_log` VALUES ('1951', '1', 'admin', '127.0.0.1', '修改', '修改预订信息，id7', '/schedule/schedule_submit_ajax.html', '1', '1553260182', '1553260182');
INSERT INTO `ky_action_log` VALUES ('1952', '1', 'admin', '127.0.0.1', '修改', '修改预订信息，id6', '/schedule/schedule_submit_ajax.html', '1', '1553260289', '1553260289');
INSERT INTO `ky_action_log` VALUES ('1953', '1', 'admin', '127.0.0.1', '修改', '修改预订信息，id4', '/schedule/schedule_submit_ajax.html', '1', '1553260432', '1553260432');
INSERT INTO `ky_action_log` VALUES ('1954', '1', 'admin', '127.0.0.1', '修改', '修改预订信息，id4', '/schedule/schedule_submit_ajax.html', '1', '1553260591', '1553260591');
INSERT INTO `ky_action_log` VALUES ('1955', '1', 'admin', '127.0.0.1', '新增加', '增加预订信息，预定人：张三', '/schedule/schedule_submit_ajax.html', '1', '1553261542', '1553261542');
INSERT INTO `ky_action_log` VALUES ('1956', '1', 'admin', '127.0.0.1', '修改', '修改预订信息，id7', '/schedule/schedule_submit_ajax.html', '1', '1553263936', '1553263936');
INSERT INTO `ky_action_log` VALUES ('1957', '1', 'admin', '127.0.0.1', '修改', '修改预订信息，id4', '/schedule/schedule_submit_ajax.html', '1', '1553264278', '1553264278');
INSERT INTO `ky_action_log` VALUES ('1958', '1', 'admin', '127.0.0.1', '删除', '预订单删除，where：id=4', '/schedule/schedule_delete_ajax.html', '1', '1553264532', '1553264532');
INSERT INTO `ky_action_log` VALUES ('1959', '1', 'admin', '127.0.0.1', '删除', '预订单删除，where：id=6', '/schedule/schedule_delete_ajax.html', '1', '1553265178', '1553265178');
INSERT INTO `ky_action_log` VALUES ('1960', '1', 'admin', '127.0.0.1', '删除', '预订单删除，where：id=8', '/schedule/schedule_delete_ajax.html', '1', '1553265227', '1553265227');
INSERT INTO `ky_action_log` VALUES ('1961', '1', 'admin', '127.0.0.1', '删除', '预订单删除，where：id=7', '/schedule/schedule_delete_ajax.html', '1', '1553265370', '1553265370');
INSERT INTO `ky_action_log` VALUES ('1962', '1', 'admin', '127.0.0.1', '新增加', '增加预订信息，预定人：张三', '/schedule/schedule_submit_ajax.html', '1', '1553265551', '1553265551');
INSERT INTO `ky_action_log` VALUES ('1963', '1', 'admin', '127.0.0.1', '删除', '预订单删除，where：id=9', '/schedule/schedule_delete_ajax.html', '1', '1553266266', '1553266266');
INSERT INTO `ky_action_log` VALUES ('1964', '1', 'admin', '127.0.0.1', '新增加', '增加预订信息，预定人：张三', '/schedule/schedule_submit_ajax.html', '1', '1553266324', '1553266324');
INSERT INTO `ky_action_log` VALUES ('1965', '1', 'admin', '127.0.0.1', '新增加', '增加预订信息，预定人：张三', '/schedule/schedule_submit_ajax.html', '1', '1553266342', '1553266342');
INSERT INTO `ky_action_log` VALUES ('1966', '1', 'admin', '127.0.0.1', '删除', '预订单删除，where：id=11', '/schedule/schedule_delete_ajax.html', '1', '1553266353', '1553266353');
INSERT INTO `ky_action_log` VALUES ('1967', '1', 'admin', '127.0.0.1', '删除', '预订单删除，where：id=10', '/schedule/schedule_delete_ajax.html', '1', '1553266389', '1553266389');
INSERT INTO `ky_action_log` VALUES ('1968', '1', 'admin', '127.0.0.1', '新增加', '增加预订信息，预定人：张三', '/schedule/schedule_submit_ajax.html', '1', '1553266534', '1553266534');
INSERT INTO `ky_action_log` VALUES ('1969', '1', 'admin', '127.0.0.1', '删除', '预订单删除，where：id=12', '/schedule/schedule_delete_ajax.html', '1', '1553266543', '1553266543');
INSERT INTO `ky_action_log` VALUES ('1970', '1', 'admin', '127.0.0.1', '新增加', '增加预订信息，预定人：张三', '/schedule/schedule_submit_ajax.html', '1', '1553266685', '1553266685');
INSERT INTO `ky_action_log` VALUES ('1971', '1', 'admin', '127.0.0.1', '修改', '修改预订信息，id13', '/schedule/schedule_submit_ajax.html', '1', '1553266727', '1553266727');
INSERT INTO `ky_action_log` VALUES ('1972', '1', 'admin', '127.0.0.1', '编辑', '编辑配置，name：allow_url', '/config/configedit.html', '1', '1553267164', '1553267164');
INSERT INTO `ky_action_log` VALUES ('1973', '1', 'admin', '127.0.0.1', '登录', '登录操作，username：admin', '/login/loginhandle.html', '1', '1553304905', '1553304905');
INSERT INTO `ky_action_log` VALUES ('1974', '1', 'admin', '127.0.0.1', '新增加', '增加寄存信息，预定人：似懂非懂是', '/save/save_submit_ajax.html', '1', '1553305670', '1553305670');
INSERT INTO `ky_action_log` VALUES ('1975', '1', 'admin', '127.0.0.1', '修改', '修改寄存信息信息购买人：订单号：CW20190323094749', '/save/save_submit_ajax.html', '1', '1553305680', '1553305680');
INSERT INTO `ky_action_log` VALUES ('1976', '1', 'admin', '127.0.0.1', '修改', '修改寄存信息信息购买人：订单号：CW20190323094749', '/save/save_submit_ajax.html', '1', '1553305694', '1553305694');
INSERT INTO `ky_action_log` VALUES ('1977', '1', 'admin', '127.0.0.1', '删除', '点灯信息删除，where：id=14', '/save/save_delete_ajax.html', '1', '1553305760', '1553305760');
INSERT INTO `ky_action_log` VALUES ('1978', '1', 'admin', '127.0.0.1', '新增加', '增加寄存信息，预定人：张三', '/save/save_submit_ajax.html', '1', '1553305849', '1553305849');
INSERT INTO `ky_action_log` VALUES ('1979', '1', 'admin', '127.0.0.1', '更新寄存信息', '寄存信息 更新，where：id=15', '/save/save_take_ajax.html', '1', '1553305863', '1553305863');
INSERT INTO `ky_action_log` VALUES ('1980', '1', 'admin', '127.0.0.1', '新增加', '增加寄存信息，预定人：张三', '/save/save_submit_ajax.html', '1', '1553306057', '1553306057');
INSERT INTO `ky_action_log` VALUES ('1981', '1', 'admin', '127.0.0.1', '修改', '修改预订信息，id13', '/schedule/schedule_submit_ajax.html', '1', '1553306416', '1553306416');
INSERT INTO `ky_action_log` VALUES ('1982', '1', 'admin', '127.0.0.1', '修改', '修改预订信息，id13', '/schedule/schedule_submit_ajax.html', '1', '1553306423', '1553306423');
INSERT INTO `ky_action_log` VALUES ('1983', '1', 'admin', '127.0.0.1', '修改', '修改预订信息，id13', '/schedule/schedule_submit_ajax.html', '1', '1553306661', '1553306661');
INSERT INTO `ky_action_log` VALUES ('1984', '1', 'admin', '127.0.0.1', '修改', '修改预订信息，id13', '/schedule/schedule_submit_ajax.html', '1', '1553306708', '1553306708');
INSERT INTO `ky_action_log` VALUES ('1985', '1', 'admin', '127.0.0.1', '修改', '修改预订信息，id13', '/schedule/schedule_submit_ajax.html', '1', '1553306738', '1553306738');
INSERT INTO `ky_action_log` VALUES ('1986', '1', 'admin', '127.0.0.1', '修改', '修改预订信息，id13', '/schedule/schedule_submit_ajax.html', '1', '1553306813', '1553306813');
INSERT INTO `ky_action_log` VALUES ('1987', '1', 'admin', '127.0.0.1', '新增加', '增加寄存信息，预定人：张三', '/save/save_submit_ajax.html', '1', '1553307490', '1553307490');
INSERT INTO `ky_action_log` VALUES ('1988', '1', 'admin', '127.0.0.1', '新增加', '增加寄存信息，预定人：鼎折覆餗', '/save/save_submit_ajax.html', '1', '1553307549', '1553307549');
INSERT INTO `ky_action_log` VALUES ('1989', '1', 'admin', '127.0.0.1', '新增加', '增加寄存信息，预定人：鼎折覆餗', '/save/save_submit_ajax.html', '1', '1553307691', '1553307691');
INSERT INTO `ky_action_log` VALUES ('1990', '1', 'admin', '127.0.0.1', '删除', '点灯信息删除，where：id=19', '/save/save_delete_ajax.html', '1', '1553307701', '1553307701');
INSERT INTO `ky_action_log` VALUES ('1991', '1', 'admin', '127.0.0.1', '登录', '登录操作，username：admin', '/login/loginhandle.html', '1', '1553316872', '1553316872');
INSERT INTO `ky_action_log` VALUES ('1992', '1', 'admin', '127.0.0.1', '编辑', '编辑配置，name：Payment', '/config/configedit.html', '1', '1553319136', '1553319136');
INSERT INTO `ky_action_log` VALUES ('1993', '1', 'admin', '127.0.0.1', '新增加', '增加购墓信息购买人：张三', '/sell/sell_submit.html', '1', '1553320566', '1553320566');
INSERT INTO `ky_action_log` VALUES ('1994', '1', 'admin', '127.0.0.1', '修改', '修改购墓信息购买人：订单号：CW20190323015605', '/sell/sell_submit.html', '1', '1553321945', '1553321945');
INSERT INTO `ky_action_log` VALUES ('1995', '1', 'admin', '127.0.0.1', '修改', '修改购墓信息购买人：订单号：CW20190323015605', '/sell/sell_submit.html', '1', '1553321975', '1553321975');
INSERT INTO `ky_action_log` VALUES ('1996', '1', 'admin', '127.0.0.1', '修改', '修改购墓信息购买人：订单号：CW20190323015605', '/sell/sell_submit.html', '1', '1553322092', '1553322092');
INSERT INTO `ky_action_log` VALUES ('1997', '1', 'admin', '127.0.0.1', '修改', '修改购墓信息购买人：订单号：CW20190323015605', '/sell/sell_submit.html', '1', '1553322157', '1553322157');
INSERT INTO `ky_action_log` VALUES ('1998', '1', 'admin', '127.0.0.1', '新增加', '增加购墓信息购买人：张三', '/sell/sell_submit.html', '1', '1553322472', '1553322472');
INSERT INTO `ky_action_log` VALUES ('1999', '1', 'admin', '127.0.0.1', '新增加', '增加购墓信息购买人：张三', '/sell/sell_submit.html', '1', '1553322552', '1553322552');
INSERT INTO `ky_action_log` VALUES ('2000', '1', 'admin', '127.0.0.1', '新增加', '增加购墓信息购买人：张三', '/sell/sell_submit.html', '1', '1553322694', '1553322694');
INSERT INTO `ky_action_log` VALUES ('2001', '1', 'admin', '127.0.0.1', '删除', '购墓信息删除，where：id=69', '/sell/sell_delete_ajax.html', '1', '1553323496', '1553323496');
INSERT INTO `ky_action_log` VALUES ('2002', '1', 'admin', '127.0.0.1', '新增加', '增加购墓信息购买人：张三', '/sell/sell_submit.html', '1', '1553323591', '1553323591');
INSERT INTO `ky_action_log` VALUES ('2003', '1', 'admin', '127.0.0.1', '删除', '购墓信息删除，where：id=70', '/sell/sell_delete_ajax.html', '1', '1553323674', '1553323674');
INSERT INTO `ky_action_log` VALUES ('2004', '1', 'admin', '127.0.0.1', '新增加', '增加购墓信息购买人：张三', '/sell/sell_submit.html', '1', '1553323735', '1553323735');
INSERT INTO `ky_action_log` VALUES ('2005', '1', 'admin', '127.0.0.1', '删除', '购墓信息删除，where：id=71', '/sell/sell_delete_ajax.html', '1', '1553323759', '1553323759');
INSERT INTO `ky_action_log` VALUES ('2006', '1', 'admin', '127.0.0.1', '新增加', '增加购墓信息购买人：张三', '/sell/sell_submit.html', '1', '1553323805', '1553323805');
INSERT INTO `ky_action_log` VALUES ('2007', '1', 'admin', '127.0.0.1', '删除', '购墓信息删除，where：id=72', '/sell/sell_delete_ajax.html', '1', '1553323843', '1553323843');
INSERT INTO `ky_action_log` VALUES ('2008', '1', 'admin', '127.0.0.1', '新增加', '增加购墓信息购买人：张三', '/sell/sell_submit.html', '1', '1553323910', '1553323910');
INSERT INTO `ky_action_log` VALUES ('2009', '1', 'admin', '127.0.0.1', '删除', '购墓信息删除，where：id=73', '/sell/sell_delete_ajax.html', '1', '1553323980', '1553323980');
INSERT INTO `ky_action_log` VALUES ('2010', '1', 'admin', '127.0.0.1', '新增加', '增加购墓信息购买人：张三', '/sell/sell_submit.html', '1', '1553324064', '1553324064');
INSERT INTO `ky_action_log` VALUES ('2011', '1', 'admin', '127.0.0.1', '删除', '购墓信息删除，where：id=74', '/sell/sell_delete_ajax.html', '1', '1553324119', '1553324119');
INSERT INTO `ky_action_log` VALUES ('2012', '1', 'admin', '127.0.0.1', '新增加', '增加购墓信息购买人：张三', '/sell/sell_submit.html', '1', '1553324162', '1553324162');
INSERT INTO `ky_action_log` VALUES ('2013', '1', 'admin', '127.0.0.1', '删除', '购墓信息删除，where：id=75', '/sell/sell_delete_ajax.html', '1', '1553324358', '1553324358');
INSERT INTO `ky_action_log` VALUES ('2014', '1', 'admin', '127.0.0.1', '新增加', '增加购墓信息购买人：张三', '/sell/sell_submit.html', '1', '1553324386', '1553324386');
INSERT INTO `ky_action_log` VALUES ('2015', '1', 'admin', '127.0.0.1', '删除', '购墓信息删除，where：id=76', '/sell/sell_delete_ajax.html', '1', '1553324530', '1553324530');
INSERT INTO `ky_action_log` VALUES ('2016', '1', 'admin', '127.0.0.1', '新增加', '增加购墓信息购买人：张三', '/sell/sell_submit.html', '1', '1553324956', '1553324956');
INSERT INTO `ky_action_log` VALUES ('2017', '1', 'admin', '127.0.0.1', '编辑', '编辑配置，name：orderstatus', '/config/configedit.html', '1', '1553325345', '1553325345');
INSERT INTO `ky_action_log` VALUES ('2018', '1', 'admin', '127.0.0.1', '编辑', '编辑配置，name：usestatus', '/config/configedit.html', '1', '1553325440', '1553325440');
INSERT INTO `ky_action_log` VALUES ('2019', '1', 'admin', '127.0.0.1', '新增加', '增加预订信息，预定人：双方都', '/schedule/schedule_submit_ajax.html', '1', '1553325561', '1553325561');
INSERT INTO `ky_action_log` VALUES ('2020', '1', 'admin', '127.0.0.1', '新增加', '增加预订信息，预定人：他依托一体', '/schedule/schedule_submit_ajax.html', '1', '1553325588', '1553325588');
INSERT INTO `ky_action_log` VALUES ('2021', '1', 'admin', '127.0.0.1', '新增加', '增加预订信息，预定人： 东方闪电1', '/schedule/schedule_submit_ajax.html', '1', '1553325746', '1553325746');
INSERT INTO `ky_action_log` VALUES ('2022', '1', 'admin', '127.0.0.1', '新增加', '增加购墓信息购买人：张三', '/sell/sell_submit.html', '1', '1553326116', '1553326116');
INSERT INTO `ky_action_log` VALUES ('2023', '1', 'admin', '127.0.0.1', '新增加', '管理墓主信息表：空调采购项目', '/bury/deather_sumit_ajax.html', '1', '1553327591', '1553327591');
INSERT INTO `ky_action_log` VALUES ('2024', '1', 'admin', '127.0.0.1', '新增加', '管理墓主信息表：分督导室的', '/bury/deather_sumit_ajax.html', '1', '1553328174', '1553328174');
INSERT INTO `ky_action_log` VALUES ('2025', '1', 'admin', '127.0.0.1', '新增加', '管理墓主信息表：的个梵蒂冈', '/bury/deather_sumit_ajax.html', '1', '1553328202', '1553328202');
INSERT INTO `ky_action_log` VALUES ('2026', '1', 'admin', '127.0.0.1', '新增加', '增加预订信息，预定人：风格的风格', '/schedule/schedule_submit_ajax.html', '1', '1553328246', '1553328246');
INSERT INTO `ky_action_log` VALUES ('2027', '1', 'admin', '127.0.0.1', '新增加', '增加预订信息，预定人：45454', '/schedule/schedule_submit_ajax.html', '1', '1553328266', '1553328266');
INSERT INTO `ky_action_log` VALUES ('2028', '1', 'admin', '127.0.0.1', '新增加', '增加预订信息，预定人：454', '/schedule/schedule_submit_ajax.html', '1', '1553328299', '1553328299');
INSERT INTO `ky_action_log` VALUES ('2029', '1', 'admin', '127.0.0.1', '新增加', '管理墓主信息表：空调采购项目', '/sell/deather_sumit_ajax.html', '1', '1553328472', '1553328472');
INSERT INTO `ky_action_log` VALUES ('2030', '1', 'admin', '127.0.0.1', '删除', '墓主信息删除，where：id=28', '/sell/deather_delete_ajax.html', '1', '1553329252', '1553329252');
INSERT INTO `ky_action_log` VALUES ('2031', '1', 'admin', '127.0.0.1', '删除', '墓主信息删除，where：id=29', '/sell/deather_delete_ajax.html', '1', '1553329259', '1553329259');
INSERT INTO `ky_action_log` VALUES ('2032', '1', 'admin', '127.0.0.1', '删除', '墓主信息删除，where：id=27', '/sell/deather_delete_ajax.html', '1', '1553329262', '1553329262');
INSERT INTO `ky_action_log` VALUES ('2033', '1', 'admin', '127.0.0.1', '删除', '墓主信息删除，where：id=26', '/sell/deather_delete_ajax.html', '1', '1553329265', '1553329265');
INSERT INTO `ky_action_log` VALUES ('2034', '1', 'admin', '127.0.0.1', '新增加', '管理墓主信息表：张飞11', '/sell/deather_sumit_ajax.html', '1', '1553329273', '1553329273');
INSERT INTO `ky_action_log` VALUES ('2035', '1', 'admin', '127.0.0.1', '新增加', '管理墓主信息表：李四', '/sell/deather_sumit_ajax.html', '1', '1553329835', '1553329835');
INSERT INTO `ky_action_log` VALUES ('2036', '1', 'admin', '127.0.0.1', '新增加', '管理墓主信息表：李四', '/sell/deather_sumit_ajax.html', '1', '1553329980', '1553329980');
INSERT INTO `ky_action_log` VALUES ('2037', '1', 'admin', '127.0.0.1', '新增加', '管理墓主信息表：李四', '/sell/deather_sumit_ajax.html', '1', '1553330062', '1553330062');
INSERT INTO `ky_action_log` VALUES ('2038', '1', 'admin', '127.0.0.1', '编辑', '编辑配置，name：comapnyinfo', '/config/configedit.html', '1', '1553331322', '1553331322');
INSERT INTO `ky_action_log` VALUES ('2039', '1', 'admin', '127.0.0.1', '编辑', '编辑配置，name：comapnyinfo', '/config/configedit.html', '1', '1553331422', '1553331422');
INSERT INTO `ky_action_log` VALUES ('2040', '1', 'admin', '127.0.0.1', '登录', '登录操作，username：admin', '/login/loginhandle.html', '1', '1553392250', '1553392250');
INSERT INTO `ky_action_log` VALUES ('2041', '1', 'admin', '127.0.0.1', '登录', '登录操作，username：admin', '/login/loginhandle.html', '1', '1553472734', '1553472734');
INSERT INTO `ky_action_log` VALUES ('2042', '1', 'admin', '127.0.0.1', '编辑', '编辑配置，name：allow_url', '/config/configedit.html', '1', '1553476889', '1553476889');
INSERT INTO `ky_action_log` VALUES ('2043', '1', 'admin', '127.0.0.1', '新增加', '管理墓主信息表：项目名称', '/sell/deather_sumit_ajax.html', '1', '1553477885', '1553477885');
INSERT INTO `ky_action_log` VALUES ('2044', '1', 'admin', '127.0.0.1', '删除', '购墓信息删除，where：id=78', '/sell/sell_delete_ajax.html', '1', '1553479868', '1553479868');
INSERT INTO `ky_action_log` VALUES ('2045', '1', 'admin', '127.0.0.1', '新增加', '增加购墓信息购买人：双方都', '/sell/sell_submit.html', '1', '1553479982', '1553479982');
INSERT INTO `ky_action_log` VALUES ('2046', '1', 'admin', '127.0.0.1', '编辑', '编辑配置，name：allow_url', '/config/configedit.html', '1', '1553480568', '1553480568');
INSERT INTO `ky_action_log` VALUES ('2047', '1', 'admin', '127.0.0.1', '付款', '购墓信息付款，where：id=79', '/sell/sell_pay_ajax.html', '1', '1553481200', '1553481200');
INSERT INTO `ky_action_log` VALUES ('2048', '1', 'admin', '127.0.0.1', '付款', '购墓信息付款，where：id=79', '/sell/sell_pay_ajax.html', '1', '1553481267', '1553481267');
INSERT INTO `ky_action_log` VALUES ('2049', '1', 'admin', '127.0.0.1', '付款', '购墓信息付款，where：id=79', '/sell/sell_pay_ajax.html', '1', '1553481300', '1553481300');
INSERT INTO `ky_action_log` VALUES ('2050', '1', 'admin', '127.0.0.1', '付款', '购墓信息付款，where：id=79', '/sell/sell_pay_ajax.html', '1', '1553481399', '1553481399');
INSERT INTO `ky_action_log` VALUES ('2051', '1', 'admin', '127.0.0.1', '付款', '购墓信息付款，where：id=79', '/sell/sell_pay_ajax.html', '1', '1553481422', '1553481422');
INSERT INTO `ky_action_log` VALUES ('2052', '1', 'admin', '127.0.0.1', '付款', '购墓信息付款，where：id=79', '/sell/sell_pay_ajax.html', '1', '1553481869', '1553481869');
INSERT INTO `ky_action_log` VALUES ('2053', '1', 'admin', '127.0.0.1', '付款', '购墓信息付款，where：id=79', '/sell/sell_pay_ajax.html', '1', '1553481969', '1553481969');
INSERT INTO `ky_action_log` VALUES ('2054', '1', 'admin', '127.0.0.1', '付款', '购墓信息付款，where：id=79', '/sell/sell_pay_ajax.html', '1', '1553482139', '1553482139');
INSERT INTO `ky_action_log` VALUES ('2055', '1', 'admin', '127.0.0.1', '付款', '购墓信息付款，where：id=77', '/sell/sell_pay_ajax.html', '1', '1553489358', '1553489358');
INSERT INTO `ky_action_log` VALUES ('2056', '1', 'admin', '127.0.0.1', '编辑', '编辑配置，name：Payment', '/config/configedit.html', '1', '1553490998', '1553490998');
INSERT INTO `ky_action_log` VALUES ('2057', '1', 'admin', '127.0.0.1', '新增加', '增加购墓信息购买人：张三', '/sell/sell_submit.html', '1', '1553492555', '1553492555');
INSERT INTO `ky_action_log` VALUES ('2058', '1', 'admin', '127.0.0.1', '修改', '修改购墓信息购买人：订单号：CW20190325014234', '/sell/sell_submit.html', '1', '1553493259', '1553493259');
INSERT INTO `ky_action_log` VALUES ('2059', '1', 'admin', '127.0.0.1', '修改', '修改购墓信息购买人：订单号：CW20190325014234', '/sell/sell_submit.html', '1', '1553493360', '1553493360');
INSERT INTO `ky_action_log` VALUES ('2060', '1', 'admin', '127.0.0.1', '修改', '修改购墓信息购买人：订单号：CW20190325014234', '/sell/sell_submit.html', '1', '1553493372', '1553493372');
INSERT INTO `ky_action_log` VALUES ('2061', '1', 'admin', '127.0.0.1', '付款', '购墓信息付款，where：id=80', '/sell/sell_pay_ajax.html', '1', '1553493754', '1553493754');
INSERT INTO `ky_action_log` VALUES ('2062', '1', 'admin', '127.0.0.1', '删除', '墓主信息删除，where：id=32', '/sell/deather_delete_ajax.html', '1', '1553494847', '1553494847');
INSERT INTO `ky_action_log` VALUES ('2063', '1', 'admin', '127.0.0.1', '编辑', '编辑配置，name：allow_url', '/config/configedit.html', '1', '1553498826', '1553498826');
INSERT INTO `ky_action_log` VALUES ('2064', '1', 'admin', '127.0.0.1', '登录', '登录操作，username：admin', '/login/loginhandle.html', '1', '1553559559', '1553559559');
INSERT INTO `ky_action_log` VALUES ('2065', '1', 'admin', '127.0.0.1', '编辑', '编辑配置，name：financetype', '/config/configedit.html', '1', '1553560563', '1553560563');
INSERT INTO `ky_action_log` VALUES ('2066', '1', 'admin', '127.0.0.1', '编辑', '编辑配置，name：allow_url', '/config/configedit.html', '1', '1553561305', '1553561305');
INSERT INTO `ky_action_log` VALUES ('2067', '1', 'admin', '127.0.0.1', '删除', '收费项目信息删除，where：id=3', '/chargeitem/chargeitemdel/id/3.html', '1', '1553568364', '1553568364');
INSERT INTO `ky_action_log` VALUES ('2068', '1', 'admin', '127.0.0.1', '新增', '新增收费项目信息，name：迁坟', '/chargeitem/chargeitemadd_ajax_submit.html', '1', '1553568469', '1553568469');
INSERT INTO `ky_action_log` VALUES ('2069', '1', 'admin', '127.0.0.1', '编辑', '编辑收费项目信息，name：绿化维护', '/chargeitem/chargeitemedit_ajax_submit.html', '1', '1553568481', '1553568481');
INSERT INTO `ky_action_log` VALUES ('2070', '1', 'admin', '127.0.0.1', '数据排序', '数据排序调整，model：Chargeitem，id：12，value：1', '/chargeitem/setsort.html', '1', '1553568495', '1553568495');
INSERT INTO `ky_action_log` VALUES ('2071', '1', 'admin', '127.0.0.1', '数据排序', '数据排序调整，model：Chargeitem，id：3，value：2', '/chargeitem/setsort.html', '1', '1553568512', '1553568512');
INSERT INTO `ky_action_log` VALUES ('2072', '1', 'admin', '127.0.0.1', '新增', '新增收费项目信息，name：墓穴维修', '/chargeitem/chargeitemadd_ajax_submit.html', '1', '1553568546', '1553568546');
INSERT INTO `ky_action_log` VALUES ('2073', '1', 'admin', '127.0.0.1', '新增', '新增收费项目信息，name：单张黑白烤瓷', '/chargeitem/chargeitemadd_ajax_submit.html', '1', '1553568567', '1553568567');
INSERT INTO `ky_action_log` VALUES ('2074', '1', 'admin', '127.0.0.1', '新增', '新增收费项目信息，name：单张彩色烤瓷 ', '/chargeitem/chargeitemadd_ajax_submit.html', '1', '1553568593', '1553568593');
INSERT INTO `ky_action_log` VALUES ('2075', '1', 'admin', '127.0.0.1', '编辑', '编辑收费项目信息，name：单张彩色烤瓷 ', '/chargeitem/chargeitemedit_ajax_submit.html', '1', '1553568605', '1553568605');
INSERT INTO `ky_action_log` VALUES ('2076', '1', 'admin', '127.0.0.1', '新增', '新增收费项目信息，name：黑白合照烤瓷', '/chargeitem/chargeitemadd_ajax_submit.html', '1', '1553568624', '1553568624');
INSERT INTO `ky_action_log` VALUES ('2077', '1', 'admin', '127.0.0.1', '编辑', '编辑收费项目信息，name：黑白合照烤瓷', '/chargeitem/chargeitemedit_ajax_submit.html', '1', '1553568647', '1553568647');
INSERT INTO `ky_action_log` VALUES ('2078', '1', 'admin', '127.0.0.1', '数据排序', '数据排序调整，model：Chargeitem，id：15，value：7', '/chargeitem/setsort.html', '1', '1553568680', '1553568680');
INSERT INTO `ky_action_log` VALUES ('2079', '1', 'admin', '127.0.0.1', '数据排序', '数据排序调整，model：Chargeitem，id：16，value：6', '/chargeitem/setsort.html', '1', '1553568688', '1553568688');
INSERT INTO `ky_action_log` VALUES ('2080', '1', 'admin', '127.0.0.1', '编辑', '编辑收费项目信息，name：绿化维护', '/chargeitem/chargeitemedit_ajax_submit.html', '1', '1553568712', '1553568712');
INSERT INTO `ky_action_log` VALUES ('2081', '1', 'admin', '127.0.0.1', '数据排序', '数据排序调整，model：Chargeitem，id：15，value：5', '/chargeitem/setsort.html', '1', '1553568768', '1553568768');
INSERT INTO `ky_action_log` VALUES ('2082', '1', 'admin', '127.0.0.1', '新增', '新增收费项目信息，name：彩色合照烤瓷 ', '/chargeitem/chargeitemadd_ajax_submit.html', '1', '1553568812', '1553568812');
INSERT INTO `ky_action_log` VALUES ('2083', '1', 'admin', '127.0.0.1', '新增', '新增收费项目信息，name：瓷像安装', '/chargeitem/chargeitemadd_ajax_submit.html', '1', '1553568831', '1553568831');
INSERT INTO `ky_action_log` VALUES ('2084', '1', 'admin', '127.0.0.1', '编辑', '编辑收费项目信息，name：瓷像安装', '/chargeitem/chargeitemedit_ajax_submit.html', '1', '1553568841', '1553568841');
INSERT INTO `ky_action_log` VALUES ('2085', '1', 'admin', '127.0.0.1', '新增', '新增收费项目信息，name：安葬礼仪', '/chargeitem/chargeitemadd_ajax_submit.html', '1', '1553568861', '1553568861');
INSERT INTO `ky_action_log` VALUES ('2086', '1', 'admin', '127.0.0.1', '编辑', '编辑收费项目信息，name：安葬礼仪', '/chargeitem/chargeitemedit_ajax_submit.html', '1', '1553568886', '1553568886');
INSERT INTO `ky_action_log` VALUES ('2087', '1', 'admin', '127.0.0.1', '编辑', '编辑收费项目信息，name：锣鼓乐队', '/chargeitem/chargeitemedit_ajax_submit.html', '1', '1553568947', '1553568947');
INSERT INTO `ky_action_log` VALUES ('2088', '1', 'admin', '127.0.0.1', '数据排序', '数据排序调整，model：Chargeitem，id：3，value：12', '/chargeitem/setsort.html', '1', '1553568985', '1553568985');
INSERT INTO `ky_action_log` VALUES ('2089', '1', 'admin', '127.0.0.1', '新增', '新增收费项目信息，name：骨灰坛', '/chargeitem/chargeitemadd_ajax_submit.html', '1', '1553569042', '1553569042');
INSERT INTO `ky_action_log` VALUES ('2090', '1', 'admin', '127.0.0.1', '编辑', '编辑服务信息，name：骨灰坛', '/serviceinfo/serviceinfoedit_ajax_submit.html', '1', '1553569415', '1553569415');
INSERT INTO `ky_action_log` VALUES ('2091', '1', 'admin', '127.0.0.1', '新增', '新增服务信息，name：绿化维护 ', '/serviceinfo/serviceinfoadd_ajax_submit.html', '1', '1553569457', '1553569457');
INSERT INTO `ky_action_log` VALUES ('2092', '1', 'admin', '127.0.0.1', '数据排序', '数据排序调整，model：Serviceinfo，id：4，value：1', '/serviceinfo/setsort.html', '1', '1553569470', '1553569470');
INSERT INTO `ky_action_log` VALUES ('2093', '1', 'admin', '127.0.0.1', '新增', '新增服务信息，name：单人黑照片', '/serviceinfo/serviceinfoadd_ajax_submit.html', '1', '1553569491', '1553569491');
INSERT INTO `ky_action_log` VALUES ('2094', '1', 'admin', '127.0.0.1', '新增', '新增服务信息，name：单人彩色照片', '/serviceinfo/serviceinfoadd_ajax_submit.html', '1', '1553569516', '1553569516');
INSERT INTO `ky_action_log` VALUES ('2095', '1', 'admin', '127.0.0.1', '编辑', '编辑服务信息，name：单人彩色照片', '/serviceinfo/serviceinfoedit_ajax_submit.html', '1', '1553569546', '1553569546');
INSERT INTO `ky_action_log` VALUES ('2096', '1', 'admin', '127.0.0.1', '编辑', '编辑服务信息，name：单人黑照片', '/serviceinfo/serviceinfoedit_ajax_submit.html', '1', '1553569571', '1553569571');
INSERT INTO `ky_action_log` VALUES ('2097', '1', 'admin', '127.0.0.1', '新增', '新增服务信息，name：双人黑白照片', '/serviceinfo/serviceinfoadd_ajax_submit.html', '1', '1553569599', '1553569599');
INSERT INTO `ky_action_log` VALUES ('2098', '1', 'admin', '127.0.0.1', '新增', '新增服务信息，name：双人彩色照片', '/serviceinfo/serviceinfoadd_ajax_submit.html', '1', '1553569625', '1553569625');
INSERT INTO `ky_action_log` VALUES ('2099', '1', 'admin', '127.0.0.1', '新增', '新增服务信息，name：乐队', '/serviceinfo/serviceinfoadd_ajax_submit.html', '1', '1553569646', '1553569646');
INSERT INTO `ky_action_log` VALUES ('2100', '1', 'admin', '127.0.0.1', '数据排序', '数据排序调整，model：Serviceinfo，id：2，value：8', '/serviceinfo/setsort.html', '1', '1553569704', '1553569704');
INSERT INTO `ky_action_log` VALUES ('2101', '1', 'admin', '127.0.0.1', '编辑', '编辑服务信息，name：乐队', '/serviceinfo/serviceinfoedit_ajax_submit.html', '1', '1553569722', '1553569722');
INSERT INTO `ky_action_log` VALUES ('2102', '1', 'admin', '127.0.0.1', '新增', '新增服务信息，name：移坟', '/serviceinfo/serviceinfoadd_ajax_submit.html', '1', '1553569750', '1553569750');
INSERT INTO `ky_action_log` VALUES ('2103', '1', 'admin', '127.0.0.1', '数据排序', '数据排序调整，model：Serviceinfo，id：7，value：4', '/serviceinfo/setsort.html', '1', '1553569802', '1553569802');
INSERT INTO `ky_action_log` VALUES ('2104', '1', 'admin', '127.0.0.1', '数据排序', '数据排序调整，model：Serviceinfo，id：8，value：5', '/serviceinfo/setsort.html', '1', '1553569837', '1553569837');
INSERT INTO `ky_action_log` VALUES ('2105', '1', 'admin', '127.0.0.1', '新增', '新增服务信息，name：碑文刻录', '/serviceinfo/serviceinfoadd_ajax_submit.html', '1', '1553569870', '1553569870');
INSERT INTO `ky_action_log` VALUES ('2106', '1', 'admin', '127.0.0.1', '新增', '新增服务信息，name：金箔', '/serviceinfo/serviceinfoadd_ajax_submit.html', '1', '1553569897', '1553569897');
INSERT INTO `ky_action_log` VALUES ('2107', '1', 'admin', '127.0.0.1', '数据排序', '数据排序调整，model：Serviceinfo，id：12，value：9', '/serviceinfo/setsort.html', '1', '1553569910', '1553569910');
INSERT INTO `ky_action_log` VALUES ('2108', '1', 'admin', '127.0.0.1', '编辑', '编辑服务信息，name：瓷像安装', '/serviceinfo/serviceinfoedit_ajax_submit.html', '1', '1553569935', '1553569935');
INSERT INTO `ky_action_log` VALUES ('2109', '1', 'admin', '127.0.0.1', '编辑', '编辑服务信息，name：瓷像安装', '/serviceinfo/serviceinfoedit_ajax_submit.html', '1', '1553569964', '1553569964');
INSERT INTO `ky_action_log` VALUES ('2110', '1', 'admin', '127.0.0.1', '编辑', '编辑服务信息，name：瓷像安装', '/serviceinfo/serviceinfoedit_ajax_submit.html', '1', '1553569979', '1553569979');
INSERT INTO `ky_action_log` VALUES ('2111', '1', 'admin', '127.0.0.1', '新增', '新增服务信息，name：安葬礼仪', '/serviceinfo/serviceinfoadd_ajax_submit.html', '1', '1553569998', '1553569998');
INSERT INTO `ky_action_log` VALUES ('2112', '1', 'admin', '127.0.0.1', '新增', '新增服务信息，name：春节点灯  ', '/serviceinfo/serviceinfoadd_ajax_submit.html', '1', '1553570022', '1553570022');
INSERT INTO `ky_action_log` VALUES ('2113', '1', 'admin', '127.0.0.1', '删除', '服务信息删除，where：id=14', '/serviceinfo/serviceinfodel/id/14.html', '1', '1553570038', '1553570038');
INSERT INTO `ky_action_log` VALUES ('2114', '1', 'admin', '127.0.0.1', '登录', '登录操作，username：admin', '/login/loginhandle.html', '1', '1553578810', '1553578810');
INSERT INTO `ky_action_log` VALUES ('2115', '1', 'admin', '127.0.0.1', '新增加', '增加服务购买人：他依托一体', '/buryservice/buryservice_save_submit.html', '1', '1553579341', '1553579341');
INSERT INTO `ky_action_log` VALUES ('2116', '1', 'admin', '127.0.0.1', '新增加', '增加服务购买人：他依托一体', '/buryservice/buryservice_save_submit.html', '1', '1553580485', '1553580485');
INSERT INTO `ky_action_log` VALUES ('2117', '1', 'admin', '127.0.0.1', '新增加', '增加服务购买人：张三', '/buryservice/buryservice_save_submit.html', '1', '1553581312', '1553581312');
INSERT INTO `ky_action_log` VALUES ('2118', '1', 'admin', '127.0.0.1', '付款', '殡葬服务付款，where：id=83', '/buryservice/buryservice_pay_ajax.html', '1', '1553583151', '1553583151');
INSERT INTO `ky_action_log` VALUES ('2119', '1', 'admin', '127.0.0.1', '修改', '修改购墓信息购买人：订单号：CW20190326020804', '/buryservice/buryservice_save_submit.html', '1', '1553583421', '1553583421');
INSERT INTO `ky_action_log` VALUES ('2120', '1', 'admin', '127.0.0.1', '付款', '殡葬服务付款，where：id=82', '/buryservice/buryservice_pay_ajax.html', '1', '1553583433', '1553583433');
INSERT INTO `ky_action_log` VALUES ('2121', '1', 'admin', '127.0.0.1', '登录', '登录操作，username：admin', '/login/loginhandle.html', '1', '1553645558', '1553645558');
INSERT INTO `ky_action_log` VALUES ('2122', '1', 'admin', '127.0.0.1', '编辑', '编辑配置，name：financetype', '/config/configedit.html', '1', '1553646394', '1553646394');
INSERT INTO `ky_action_log` VALUES ('2123', '1', 'admin', '127.0.0.1', '编辑', '编辑配置，name：allow_url', '/config/configedit.html', '1', '1553650256', '1553650256');
INSERT INTO `ky_action_log` VALUES ('2124', '1', 'admin', '127.0.0.1', '编辑', '编辑配置，name：monumentype', '/config/configedit.html', '1', '1553652799', '1553652799');
INSERT INTO `ky_action_log` VALUES ('2125', '1', 'admin', '127.0.0.1', '编辑', '编辑配置，name：financetype', '/config/configedit.html', '1', '1553652941', '1553652941');
INSERT INTO `ky_action_log` VALUES ('2126', '1', 'admin', '127.0.0.1', '编辑', '编辑收费项目信息，name：单张黑白烤瓷', '/chargeitem/chargeitemedit_ajax_submit.html', '1', '1553652972', '1553652972');
INSERT INTO `ky_action_log` VALUES ('2127', '1', 'admin', '127.0.0.1', '数据排序', '数据排序调整，model：Chargeitem，id：14，value：1', '/chargeitem/setsort.html', '1', '1553653002', '1553653002');
INSERT INTO `ky_action_log` VALUES ('2128', '1', 'admin', '127.0.0.1', '编辑', '编辑收费项目信息，name：瓷像安装', '/chargeitem/chargeitemedit_ajax_submit.html', '1', '1553653024', '1553653024');
INSERT INTO `ky_action_log` VALUES ('2129', '1', 'admin', '127.0.0.1', '编辑', '编辑收费项目信息，name：单张彩色烤瓷 ', '/chargeitem/chargeitemedit_ajax_submit.html', '1', '1553653049', '1553653049');
INSERT INTO `ky_action_log` VALUES ('2130', '1', 'admin', '127.0.0.1', '编辑', '编辑收费项目信息，name：黑白合照烤瓷', '/chargeitem/chargeitemedit_ajax_submit.html', '1', '1553653102', '1553653102');
INSERT INTO `ky_action_log` VALUES ('2131', '1', 'admin', '127.0.0.1', '新增加', '增加碑文信息，购买人：张三', '/monumen/monumenservice_save_submit.html', '1', '1553653935', '1553653935');
INSERT INTO `ky_action_log` VALUES ('2132', '1', 'admin', '127.0.0.1', '删除', '刻碑文信息删除，where：id=1', '/monumen/monumenservice_delete_ajax.html', '1', '1553654930', '1553654930');
INSERT INTO `ky_action_log` VALUES ('2133', '1', 'admin', '127.0.0.1', '新增加', '增加碑文信息，购买人：他依托一体', '/monumen/monumenservice_save_submit.html', '1', '1553654959', '1553654959');
INSERT INTO `ky_action_log` VALUES ('2134', '1', 'admin', '127.0.0.1', '修改', '增加碑文信息：订单号：CW20190327104918', '/monumen/monumenservice_save_submit.html', '1', '1553655951', '1553655951');
INSERT INTO `ky_action_log` VALUES ('2135', '1', 'admin', '127.0.0.1', '修改', '增加碑文信息：订单号：CW20190327104918', '/monumen/monumenservice_save_submit.html', '1', '1553655981', '1553655981');
INSERT INTO `ky_action_log` VALUES ('2136', '1', 'admin', '127.0.0.1', '修改', '增加碑文信息：订单号：CW20190327104918', '/monumen/monumenservice_save_submit.html', '1', '1553656116', '1553656116');
INSERT INTO `ky_action_log` VALUES ('2137', '1', 'admin', '127.0.0.1', '修改', '增加碑文信息：订单号：CW20190327104918', '/monumen/monumenservice_save_submit.html', '1', '1553656154', '1553656154');
INSERT INTO `ky_action_log` VALUES ('2138', '1', 'admin', '127.0.0.1', '修改', '增加碑文信息：订单号：CW20190327104918', '/monumen/monumenservice_save_submit.html', '1', '1553656173', '1553656173');
INSERT INTO `ky_action_log` VALUES ('2139', '1', 'admin', '127.0.0.1', '修改', '增加碑文信息：订单号：CW20190327104918', '/monumen/monumenservice_save_submit.html', '1', '1553656212', '1553656212');
INSERT INTO `ky_action_log` VALUES ('2140', '1', 'admin', '127.0.0.1', '付款', '殡葬服务付款，where：id=85', '/monumen/monumenservice_pay_ajax.html', '1', '1553657544', '1553657544');
INSERT INTO `ky_action_log` VALUES ('2141', '1', 'admin', '127.0.0.1', '编辑', '编辑配置，name：monumenstyle', '/config/configedit.html', '1', '1553657931', '1553657931');
INSERT INTO `ky_action_log` VALUES ('2142', '1', 'admin', '127.0.0.1', '新增加', '增加碑文信息，购买人：张三', '/monumen/monumenservice_save_submit.html', '1', '1553658481', '1553658481');
INSERT INTO `ky_action_log` VALUES ('2143', '1', 'admin', '127.0.0.1', '付款', '殡葬服务付款，where：id=86', '/monumen/monumenservice_pay_ajax.html', '1', '1553658485', '1553658485');
INSERT INTO `ky_action_log` VALUES ('2144', '1', 'admin', '127.0.0.1', '新增加', '增加碑文信息，购买人：他依托一体', '/monumen/monumenservice_save_submit.html', '1', '1553658685', '1553658685');
INSERT INTO `ky_action_log` VALUES ('2145', '1', 'admin', '127.0.0.1', '删除', '刻碑文信息删除，where：id=4', '/monumen/monumenservice_delete_ajax.html', '1', '1553658716', '1553658716');
INSERT INTO `ky_action_log` VALUES ('2146', '1', 'admin', '127.0.0.1', '新增加', '增加碑文信息，购买人：他依托一体', '/monumen/monumenservice_save_submit.html', '1', '1553658763', '1553658763');
INSERT INTO `ky_action_log` VALUES ('2147', '1', 'admin', '127.0.0.1', '付款', '殡葬服务付款，where：id=88', '/monumen/monumenservice_pay_ajax.html', '1', '1553658776', '1553658776');
INSERT INTO `ky_action_log` VALUES ('2148', '1', 'admin', '127.0.0.1', '编辑', '编辑收费项目信息，name：退墓手续费', '/chargeitem/chargeitemedit_ajax_submit.html', '1', '1553663535', '1553663535');
INSERT INTO `ky_action_log` VALUES ('2149', '1', 'admin', '127.0.0.1', '编辑', '编辑配置，name：financetype', '/config/configedit.html', '1', '1553663563', '1553663563');
INSERT INTO `ky_action_log` VALUES ('2150', '1', 'admin', '127.0.0.1', '新增加', '增加退款记录表：张三', '/cancel/cancel_submit_ajax.html', '1', '1553667061', '1553667061');
INSERT INTO `ky_action_log` VALUES ('2151', '1', 'admin', '127.0.0.1', '删除', '退墓信息删除，where：id=10', '/cancel/canacel_delete_ajax.html', '1', '1553669035', '1553669035');
INSERT INTO `ky_action_log` VALUES ('2152', '1', 'admin', '127.0.0.1', '删除', '退墓信息删除，where：id=10', '/cancel/canacel_delete_ajax.html', '1', '1553669069', '1553669069');
INSERT INTO `ky_action_log` VALUES ('2153', '1', 'admin', '127.0.0.1', '删除', '退墓信息删除，where：id=10', '/cancel/canacel_delete_ajax.html', '1', '1553669114', '1553669114');
INSERT INTO `ky_action_log` VALUES ('2154', '1', 'admin', '127.0.0.1', '新增加', '增加退款记录表：张三', '/cancel/cancel_submit_ajax.html', '1', '1553669223', '1553669223');
INSERT INTO `ky_action_log` VALUES ('2155', '1', 'admin', '127.0.0.1', '编辑', '编辑配置，name：allow_url', '/config/configedit.html', '1', '1553669533', '1553669533');
INSERT INTO `ky_action_log` VALUES ('2156', '1', 'admin', '127.0.0.1', '编辑', '编辑配置，name：allow_url', '/config/configedit.html', '1', '1553669573', '1553669573');
INSERT INTO `ky_action_log` VALUES ('2157', '1', 'admin', '127.0.0.1', '编辑', '编辑配置，name：allow_url', '/config/configedit.html', '1', '1553669686', '1553669686');
INSERT INTO `ky_action_log` VALUES ('2158', '21', '曾云利', '127.0.0.1', '登录', '登录操作，username：曾云利', '/login/loginhandle.html', '1', '1553669754', '1553669754');
INSERT INTO `ky_action_log` VALUES ('2159', '21', '曾云利', '127.0.0.1', '退墓', '退墓操作，where：id=11', '/cancel/canacel_cl_ajax.html', '1', '1553671294', '1553671294');
INSERT INTO `ky_action_log` VALUES ('2160', '21', '曾云利', '127.0.0.1', '登录', '登录操作，username：曾云利', '/login/loginhandle.html', '1', '1553672379', '1553672379');
INSERT INTO `ky_action_log` VALUES ('2161', '1', 'admin', '127.0.0.1', '登录', '登录操作，username：admin', '/login/loginhandle.html', '1', '1553672639', '1553672639');
INSERT INTO `ky_action_log` VALUES ('2162', '1', 'admin', '127.0.0.1', '付款', '殡葬服务付款，where：id=90', '/cancel/canacel_pay_ajax.html', '1', '1553675933', '1553675933');
INSERT INTO `ky_action_log` VALUES ('2163', '1', 'admin', '127.0.0.1', '登录', '登录操作，username：admin', '/login/loginhandle.html', '1', '1553690243', '1553690243');
INSERT INTO `ky_action_log` VALUES ('2164', '1', 'admin', '127.0.0.1', '新增加', '增加购墓信息购买人：史蒂夫', '/sell/sell_submit.html', '1', '1553690366', '1553690366');
INSERT INTO `ky_action_log` VALUES ('2165', '1', 'admin', '127.0.0.1', '新增加', '增加服务购买人：史蒂夫', '/buryservice/buryservice_save_submit.html', '1', '1553693001', '1553693001');
INSERT INTO `ky_action_log` VALUES ('2166', '1', 'admin', '127.0.0.1', '修改', '修改购墓信息购买人：订单号：CW20190327092320', '/buryservice/buryservice_save_submit.html', '1', '1553693093', '1553693093');
INSERT INTO `ky_action_log` VALUES ('2167', '1', 'admin', '127.0.0.1', '新增加', '增加碑文信息，购买人：双方都', '/monumen/monumenservice_save_submit.html', '1', '1553693677', '1553693677');
INSERT INTO `ky_action_log` VALUES ('2168', '1', 'admin', '127.0.0.1', '登录', '登录操作，username：admin', '/login/loginhandle.html', '1', '1553748583', '1553748583');
INSERT INTO `ky_action_log` VALUES ('2169', '1', 'admin', '127.0.0.1', '编辑', '编辑配置，name：allow_url', '/config/configedit.html', '1', '1553748971', '1553748971');
INSERT INTO `ky_action_log` VALUES ('2170', '1', 'admin', '127.0.0.1', '新增加', '增加点灯信息，预定人：双方都', '/light/light_submit_ajax.html', '1', '1553760428', '1553760428');
INSERT INTO `ky_action_log` VALUES ('2171', '1', 'admin', '127.0.0.1', '新增加', '增加点灯信息，预定人：双方都', '/light/light_submit_ajax.html', '1', '1553760489', '1553760489');
INSERT INTO `ky_action_log` VALUES ('2172', '1', 'admin', '127.0.0.1', '删除', '点灯信息删除，where：id=14', '/light/light_delete_ajax.html', '1', '1553761548', '1553761548');
INSERT INTO `ky_action_log` VALUES ('2173', '1', 'admin', '127.0.0.1', '删除', '点灯信息删除，where：id=15', '/light/light_delete_ajax.html', '1', '1553761698', '1553761698');
INSERT INTO `ky_action_log` VALUES ('2174', '1', 'admin', '127.0.0.1', '新增加', '增加点灯信息，预定人：双方都', '/light/light_submit_ajax.html', '1', '1553762074', '1553762074');
INSERT INTO `ky_action_log` VALUES ('2175', '1', 'admin', '127.0.0.1', '删除', '点灯信息删除，where：id=16', '/light/light_delete_ajax.html', '1', '1553762127', '1553762127');
INSERT INTO `ky_action_log` VALUES ('2176', '1', 'admin', '127.0.0.1', '新增加', '增加点灯信息，预定人：双方都', '/light/light_submit_ajax.html', '1', '1553762505', '1553762505');
INSERT INTO `ky_action_log` VALUES ('2177', '1', 'admin', '127.0.0.1', '删除', '点灯信息删除，where：id=17', '/light/light_delete_ajax.html', '1', '1553762510', '1553762510');
INSERT INTO `ky_action_log` VALUES ('2178', '1', 'admin', '127.0.0.1', '新增加', '增加点灯信息，预定人：双方都', '/light/light_submit_ajax.html', '1', '1553762526', '1553762526');
INSERT INTO `ky_action_log` VALUES ('2179', '1', 'admin', '127.0.0.1', '修改', '修改点灯信息购买人：订单号：CW20190328044204', '/light/light_submit_ajax.html', '1', '1553763461', '1553763461');
INSERT INTO `ky_action_log` VALUES ('2180', '1', 'admin', '127.0.0.1', '登录', '登录操作，username：admin', '/login/loginhandle.html', '1', '1553775464', '1553775464');
INSERT INTO `ky_action_log` VALUES ('2181', '1', 'admin', '127.0.0.1', '付款', '殡葬服务付款，where：id=98', '/light/light_pay_ajax.html', '1', '1553775714', '1553775714');
INSERT INTO `ky_action_log` VALUES ('2182', '1', 'admin', '127.0.0.1', '新增', '新增配置，name：lightpaytype', '/config/configadd.html', '1', '1553776538', '1553776538');
INSERT INTO `ky_action_log` VALUES ('2183', '1', 'admin', '127.0.0.1', '新增加', '增加作废记录表：1', '/retrunprice/retrunprice_submit_ajax.html', '1', '1553781616', '1553781616');
INSERT INTO `ky_action_log` VALUES ('2184', '1', 'admin', '127.0.0.1', '登录', '登录操作，username：admin', '/login/loginhandle.html', '1', '1553781671', '1553781671');
INSERT INTO `ky_action_log` VALUES ('2185', '1', 'admin', '127.0.0.1', '新增', '新增菜单，name：作废申请审批', '/menu/menuadd.html', '1', '1553781833', '1553781833');
INSERT INTO `ky_action_log` VALUES ('2186', '21', '曾云利', '127.0.0.1', '登录', '登录操作，username：曾云利', '/login/loginhandle.html', '1', '1553783999', '1553783999');
INSERT INTO `ky_action_log` VALUES ('2187', '1', 'admin', '127.0.0.1', '登录', '登录操作，username：admin', '/login/loginhandle.html', '1', '1553817924', '1553817924');
INSERT INTO `ky_action_log` VALUES ('2188', '1', 'admin', '127.0.0.1', '授权', '设置权限组权限，id：19', '/auth/menuauth.html', '1', '1553817986', '1553817986');
INSERT INTO `ky_action_log` VALUES ('2189', '21', '曾云利', '127.0.0.1', '登录', '登录操作，username：曾云利', '/login/loginhandle.html', '1', '1553818047', '1553818047');
INSERT INTO `ky_action_log` VALUES ('2190', '21', '曾云利', '127.0.0.1', '新增', '新增菜单，name：作废审批处理', '/menu/menuadd.html', '1', '1553818577', '1553818577');
INSERT INTO `ky_action_log` VALUES ('2191', '21', '曾云利', '127.0.0.1', '数据状态', '数据状态调整，model：Menu，ids：292，status：-1', '/menu/setstatus/ids/292/status/-1.html', '1', '1553818627', '1553818627');
INSERT INTO `ky_action_log` VALUES ('2192', '21', '曾云利', '127.0.0.1', '编辑', '编辑配置，name：allow_url', '/config/configedit.html', '1', '1553818672', '1553818672');
INSERT INTO `ky_action_log` VALUES ('2193', '21', '曾云利', '127.0.0.1', '编辑', '编辑配置，name：allow_url', '/config/configedit.html', '1', '1553820030', '1553820030');
INSERT INTO `ky_action_log` VALUES ('2194', '21', '曾云利', '127.0.0.1', '新增加', '作废记录处理完成：1', '/retrunprice/retrunprice_cl_ajax.html', '1', '1553820105', '1553820105');
INSERT INTO `ky_action_log` VALUES ('2195', '1', 'admin', '127.0.0.1', '登录', '登录操作，username：admin', '/login/loginhandle.html', '1', '1553820391', '1553820391');
INSERT INTO `ky_action_log` VALUES ('2196', '1', 'admin', '127.0.0.1', '新增加', '增加寄存信息，预定人：双方都', '/save/save_submit_ajax.html', '1', '1553823536', '1553823536');
INSERT INTO `ky_action_log` VALUES ('2197', '1', 'admin', '127.0.0.1', '登录', '登录操作，username：admin', '/login/loginhandle.html', '1', '1553827674', '1553827674');
INSERT INTO `ky_action_log` VALUES ('2198', '1', 'admin', '127.0.0.1', '编辑', '编辑配置，name：allow_url', '/config/configedit.html', '1', '1553827755', '1553827755');
INSERT INTO `ky_action_log` VALUES ('2199', '1', 'admin', '127.0.0.1', '新增加', '增加寄存信息，预定人：张三', '/save/save_submit_ajax.html', '1', '1553830503', '1553830503');
INSERT INTO `ky_action_log` VALUES ('2200', '1', 'admin', '127.0.0.1', '登录', '登录操作，username：admin', '/login/loginhandle.html', '1', '1553837773', '1553837773');
INSERT INTO `ky_action_log` VALUES ('2201', '1', 'admin', '127.0.0.1', '新增加', '增加寄存信息，预定人：双方都', '/save/save_submit_ajax.html', '1', '1553837967', '1553837967');
INSERT INTO `ky_action_log` VALUES ('2202', '1', 'admin', '127.0.0.1', '修改', '修改寄存信息信息购买人：订单号：CW20190329113502', '/save/save_submit_ajax.html', '1', '1553838580', '1553838580');
INSERT INTO `ky_action_log` VALUES ('2203', '1', 'admin', '127.0.0.1', '修改', '修改寄存信息信息购买人：订单号：CW20190329113502', '/save/save_submit_ajax.html', '1', '1553838623', '1553838623');
INSERT INTO `ky_action_log` VALUES ('2204', '1', 'admin', '127.0.0.1', '新增加', '增加寄存信息，预定人：双方都', '/save/save_submit_ajax.html', '1', '1553838807', '1553838807');
INSERT INTO `ky_action_log` VALUES ('2205', '1', 'admin', '127.0.0.1', '删除', '点灯信息删除，where：id=20', '/save/save_delete_ajax.html', '1', '1553838982', '1553838982');
INSERT INTO `ky_action_log` VALUES ('2206', '1', 'admin', '127.0.0.1', '删除', '点灯信息删除，where：id=22', '/save/save_delete_ajax.html', '1', '1553838995', '1553838995');
INSERT INTO `ky_action_log` VALUES ('2207', '1', 'admin', '127.0.0.1', '删除', '点灯信息删除，where：id=23', '/save/save_delete_ajax.html', '1', '1553839047', '1553839047');
INSERT INTO `ky_action_log` VALUES ('2208', '1', 'admin', '127.0.0.1', '删除', '点灯信息删除，where：id=16', '/save/save_delete_ajax.html', '1', '1553839075', '1553839075');
INSERT INTO `ky_action_log` VALUES ('2209', '1', 'admin', '127.0.0.1', '删除', '点灯信息删除，where：id=18', '/save/save_delete_ajax.html', '1', '1553839079', '1553839079');
INSERT INTO `ky_action_log` VALUES ('2210', '1', 'admin', '127.0.0.1', '新增加', '增加寄存信息，预定人：双方都', '/save/save_submit_ajax.html', '1', '1553839397', '1553839397');
INSERT INTO `ky_action_log` VALUES ('2211', '1', 'admin', '127.0.0.1', '更新寄存信息', '寄存信息 更新，where：id=21', '/save/save_take_ajax.html', '1', '1553839903', '1553839903');
INSERT INTO `ky_action_log` VALUES ('2212', '1', 'admin', '127.0.0.1', '新增加', '增加服务购买人：张三', '/buryservice/buryservice_save_submit.html', '1', '1553840082', '1553840082');
INSERT INTO `ky_action_log` VALUES ('2213', '1', 'admin', '127.0.0.1', '付款', '殡葬服务付款，where：id=106', '/buryservice/buryservice_pay_ajax.html', '1', '1553840088', '1553840088');
INSERT INTO `ky_action_log` VALUES ('2214', '1', 'admin', '127.0.0.1', '编辑', '编辑配置，name：allow_url', '/config/configedit.html', '1', '1553841812', '1553841812');
INSERT INTO `ky_action_log` VALUES ('2215', '1', 'admin', '127.0.0.1', '编辑', '编辑配置，name：allow_url', '/config/configedit.html', '1', '1553842058', '1553842058');
INSERT INTO `ky_action_log` VALUES ('2216', '1', 'admin', '127.0.0.1', '编辑', '编辑配置，name：allow_url', '/config/configedit.html', '1', '1553843944', '1553843944');
INSERT INTO `ky_action_log` VALUES ('2217', '1', 'admin', '127.0.0.1', '登录', '登录操作，username：admin', '/login/loginhandle.html', '1', '1553847515', '1553847515');
INSERT INTO `ky_action_log` VALUES ('2218', '1', 'admin', '127.0.0.1', '新增加', '增加迁墓信息，迁墓人：双方都', '/move/move_submit_ajax.html', '1', '1553847823', '1553847823');
INSERT INTO `ky_action_log` VALUES ('2219', '1', 'admin', '127.0.0.1', '新增加', '增加迁墓信息，迁墓人：双方都', '/move/move_submit_ajax.html', '1', '1553847829', '1553847829');
INSERT INTO `ky_action_log` VALUES ('2220', '1', 'admin', '127.0.0.1', '修改', '修改迁墓信息，记录Id：5', '/move/move_submit_ajax.html', '1', '1553848075', '1553848075');
INSERT INTO `ky_action_log` VALUES ('2221', '1', 'admin', '127.0.0.1', '修改', '修改迁墓信息，记录Id：5', '/move/move_submit_ajax.html', '1', '1553848085', '1553848085');
INSERT INTO `ky_action_log` VALUES ('2222', '1', 'admin', '127.0.0.1', '删除', '迁墓信息删除，where：id=11', '/move/move_delete_ajax.html', '1', '1553848421', '1553848421');
INSERT INTO `ky_action_log` VALUES ('2223', '1', 'admin', '127.0.0.1', '删除', '迁墓信息删除，where：id=10', '/move/move_delete_ajax.html', '1', '1553848437', '1553848437');
INSERT INTO `ky_action_log` VALUES ('2224', '1', 'admin', '127.0.0.1', '修改', '修改迁墓信息，记录Id：5', '/move/move_submit_ajax.html', '1', '1553848487', '1553848487');
INSERT INTO `ky_action_log` VALUES ('2225', '1', 'admin', '127.0.0.1', '登录', '登录操作，username：admin', '/login/loginhandle.html', '1', '1553906258', '1553906258');
INSERT INTO `ky_action_log` VALUES ('2226', '1', 'admin', '127.0.0.1', '编辑', '编辑配置，name：usestatus', '/config/configedit.html', '1', '1553912066', '1553912066');
INSERT INTO `ky_action_log` VALUES ('2227', '1', 'admin', '127.0.0.1', '新增加', '增加迁墓信息，迁墓人：张三', '/move/move_submit_ajax.html', '1', '1553912091', '1553912091');

-- ----------------------------
-- Table structure for ky_addon
-- ----------------------------
DROP TABLE IF EXISTS `ky_addon`;
CREATE TABLE `ky_addon` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(40) NOT NULL DEFAULT '' COMMENT '插件名或标识',
  `title` varchar(20) NOT NULL DEFAULT '' COMMENT '中文名称',
  `describe` varchar(255) NOT NULL DEFAULT '' COMMENT '插件描述',
  `config` text NOT NULL COMMENT '配置',
  `author` varchar(40) NOT NULL DEFAULT '' COMMENT '作者',
  `version` varchar(20) NOT NULL DEFAULT '' COMMENT '版本号',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '安装时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='插件表';

-- ----------------------------
-- Records of ky_addon
-- ----------------------------
INSERT INTO `ky_addon` VALUES ('3', 'File', '文件上传', '文件上传插件', '', 'Jack', '1.0', '1', '0', '0');
INSERT INTO `ky_addon` VALUES ('4', 'Icon', '图标选择', '图标选择插件', '', 'Bigotry', '1.0', '1', '0', '0');
INSERT INTO `ky_addon` VALUES ('5', 'Editor', '文本编辑器', '富文本编辑器', '', 'Bigotry', '1.0', '1', '0', '0');

-- ----------------------------
-- Table structure for ky_api
-- ----------------------------
DROP TABLE IF EXISTS `ky_api`;
CREATE TABLE `ky_api` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` char(150) NOT NULL DEFAULT '' COMMENT '接口名称',
  `group_id` int(6) unsigned NOT NULL DEFAULT '0' COMMENT '接口分组',
  `request_type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '请求类型 0:POST  1:GET',
  `api_url` char(50) NOT NULL DEFAULT '' COMMENT '请求路径',
  `describe` varchar(255) NOT NULL DEFAULT '' COMMENT '接口描述',
  `describe_text` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '接口富文本描述',
  `is_request_data` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否需要请求数据',
  `request_data` text NOT NULL COMMENT '请求数据',
  `response_data` text NOT NULL COMMENT '响应数据',
  `is_response_data` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否需要响应数据',
  `is_user_token` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否需要用户token',
  `is_response_sign` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否返回数据签名',
  `is_request_sign` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否验证请求数据签名',
  `response_examples` text NOT NULL COMMENT '响应栗子',
  `developer` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '研发者',
  `api_status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '接口状态（0:待研发，1:研发中，2:测试中，3:已完成）',
  `is_page` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否为分页接口 0：否  1：是',
  `sort` tinyint(5) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '数据状态',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=192 DEFAULT CHARSET=utf8 COMMENT='API表';

-- ----------------------------
-- Records of ky_api
-- ----------------------------
INSERT INTO `ky_api` VALUES ('186', '登录或注册', '34', '0', 'common/login', '系统登录注册接口，若用户名存在则验证密码正确性，若用户名不存在则注册新用户，返回 user_token 用于操作需验证身份的接口', '', '1', '[{\"field_name\":\"username\",\"data_type\":\"0\",\"is_require\":\"1\",\"field_describe\":\"\\u7528\\u6237\\u540d\"},{\"field_name\":\"password\",\"data_type\":\"0\",\"is_require\":\"1\",\"field_describe\":\"\\u5bc6\\u7801\"}]', '[{\"field_name\":\"data\",\"data_type\":\"2\",\"field_describe\":\"\\u4f1a\\u5458\\u6570\\u636e\\u53causer_token\"}]', '1', '0', '1', '0', '{\r\n    &quot;code&quot;: 0,\r\n    &quot;msg&quot;: &quot;操作成功&quot;,\r\n    &quot;data&quot;: {\r\n        &quot;member_id&quot;: 51,\r\n        &quot;nickname&quot;: &quot;sadasdas&quot;,\r\n        &quot;username&quot;: &quot;sadasdas&quot;,\r\n        &quot;create_time&quot;: &quot;2017-09-09 13:40:17&quot;,\r\n        &quot;user_token&quot;: &quot;eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJPbmVCYXNlIEpXVCIsImlhdCI6MTUwNDkzNTYxNywiZXhwIjoxNTA0OTM2NjE3LCJhdWQiOiJPbmVCYXNlIiwic3ViIjoiT25lQmFzZSIsImRhdGEiOnsibWVtYmVyX2lkIjo1MSwibmlja25hbWUiOiJzYWRhc2RhcyIsInVzZXJuYW1lIjoic2FkYXNkYXMiLCJjcmVhdGVfdGltZSI6IjIwMTctMDktMDkgMTM6NDA6MTcifX0.6PEShODuifNsa-x1TumLoEaR2TCXpUEYgjpD3Mz3GRM&quot;\r\n    }\r\n}', '0', '1', '0', '0', '1', '1504501410', '1520504982');
INSERT INTO `ky_api` VALUES ('187', '文章分类列表', '44', '0', 'article/categorylist', '文章分类列表接口', '', '0', '', '[{\"field_name\":\"id\",\"data_type\":\"0\",\"field_describe\":\"\\u6587\\u7ae0\\u5206\\u7c7bID\"},{\"field_name\":\"name\",\"data_type\":\"0\",\"field_describe\":\"\\u6587\\u7ae0\\u5206\\u7c7b\\u540d\\u79f0\"}]', '1', '0', '0', '0', '{\r\n    &quot;code&quot;: 0,\r\n    &quot;msg&quot;: &quot;操作成功&quot;,\r\n    &quot;data&quot;: [\r\n        {\r\n            &quot;id&quot;: 2,\r\n            &quot;name&quot;: &quot;测试文章分类2&quot;\r\n        },\r\n        {\r\n            &quot;id&quot;: 1,\r\n            &quot;name&quot;: &quot;测试文章分类1&quot;\r\n        }\r\n    ]\r\n}', '0', '0', '0', '2', '1', '1504765581', '1520504982');
INSERT INTO `ky_api` VALUES ('188', '文章列表', '44', '0', 'article/articlelist', '文章列表接口', '', '1', '[{\"field_name\":\"category_id\",\"data_type\":\"0\",\"is_require\":\"0\",\"field_describe\":\"\\u82e5\\u4e0d\\u4f20\\u9012\\u6b64\\u53c2\\u6570\\u5219\\u4e3a\\u6240\\u6709\\u5206\\u7c7b\"}]', '', '0', '0', '0', '0', '{\r\n    &quot;code&quot;: 0,\r\n    &quot;msg&quot;: &quot;操作成功&quot;,\r\n    &quot;data&quot;: {\r\n        &quot;total&quot;: 9,\r\n        &quot;per_page&quot;: &quot;10&quot;,\r\n        &quot;current_page&quot;: 1,\r\n        &quot;last_page&quot;: 1,\r\n        &quot;data&quot;: [\r\n            {\r\n                &quot;id&quot;: 16,\r\n                &quot;name&quot;: &quot;11111111&quot;,\r\n                &quot;category_id&quot;: 2,\r\n                &quot;describe&quot;: &quot;22222222&quot;,\r\n                &quot;create_time&quot;: &quot;2017-08-07 13:58:37&quot;\r\n            },\r\n            {\r\n                &quot;id&quot;: 15,\r\n                &quot;name&quot;: &quot;tttttt&quot;,\r\n                &quot;category_id&quot;: 1,\r\n                &quot;describe&quot;: &quot;sddd&quot;,\r\n                &quot;create_time&quot;: &quot;2017-08-07 13:24:46&quot;\r\n            }\r\n        ]\r\n    }\r\n}', '0', '0', '1', '1', '1', '1504779780', '1520504982');
INSERT INTO `ky_api` VALUES ('189', '首页接口', '45', '0', 'combination/index', '首页聚合接口', '', '1', '[{\"field_name\":\"category_id\",\"data_type\":\"0\",\"is_require\":\"0\",\"field_describe\":\"\\u6587\\u7ae0\\u5206\\u7c7bID\"}]', '[{\"field_name\":\"article_category_list\",\"data_type\":\"2\",\"field_describe\":\"\\u6587\\u7ae0\\u5206\\u7c7b\\u6570\\u636e\"},{\"field_name\":\"article_list\",\"data_type\":\"2\",\"field_describe\":\"\\u6587\\u7ae0\\u6570\\u636e\"}]', '1', '0', '1', '0', '{\r\n    &quot;code&quot;: 0,\r\n    &quot;msg&quot;: &quot;操作成功&quot;,\r\n    &quot;data&quot;: {\r\n        &quot;article_category_list&quot;: [\r\n            {\r\n                &quot;id&quot;: 2,\r\n                &quot;name&quot;: &quot;测试文章分类2&quot;\r\n            },\r\n            {\r\n                &quot;id&quot;: 1,\r\n                &quot;name&quot;: &quot;测试文章分类1&quot;\r\n            }\r\n        ],\r\n        &quot;article_list&quot;: {\r\n            &quot;total&quot;: 8,\r\n            &quot;per_page&quot;: &quot;2&quot;,\r\n            &quot;current_page&quot;: &quot;1&quot;,\r\n            &quot;last_page&quot;: 4,\r\n            &quot;data&quot;: [\r\n                {\r\n                    &quot;id&quot;: 15,\r\n                    &quot;name&quot;: &quot;tttttt&quot;,\r\n                    &quot;category_id&quot;: 1,\r\n                    &quot;describe&quot;: &quot;sddd&quot;,\r\n                    &quot;create_time&quot;: &quot;2017-08-07 13:24:46&quot;\r\n                },\r\n                {\r\n                    &quot;id&quot;: 14,\r\n                    &quot;name&quot;: &quot;1111111111111111111&quot;,\r\n                    &quot;category_id&quot;: 1,\r\n                    &quot;describe&quot;: &quot;123123&quot;,\r\n                    &quot;create_time&quot;: &quot;2017-08-04 15:37:20&quot;\r\n                }\r\n            ]\r\n        }\r\n    }\r\n}', '0', '0', '1', '0', '1', '1504785072', '1520504982');
INSERT INTO `ky_api` VALUES ('190', '详情页接口', '45', '0', 'combination/details', '详情页接口', '', '1', '[{\"field_name\":\"article_id\",\"data_type\":\"0\",\"is_require\":\"1\",\"field_describe\":\"\\u6587\\u7ae0ID\"}]', '[{\"field_name\":\"article_category_list\",\"data_type\":\"2\",\"field_describe\":\"\\u6587\\u7ae0\\u5206\\u7c7b\\u6570\\u636e\"},{\"field_name\":\"article_details\",\"data_type\":\"2\",\"field_describe\":\"\\u6587\\u7ae0\\u8be6\\u60c5\\u6570\\u636e\"}]', '1', '0', '0', '0', '{\r\n    &quot;code&quot;: 0,\r\n    &quot;msg&quot;: &quot;操作成功&quot;,\r\n    &quot;data&quot;: {\r\n        &quot;article_category_list&quot;: [\r\n            {\r\n                &quot;id&quot;: 2,\r\n                &quot;name&quot;: &quot;测试文章分类2&quot;\r\n            },\r\n            {\r\n                &quot;id&quot;: 1,\r\n                &quot;name&quot;: &quot;测试文章分类1&quot;\r\n            }\r\n        ],\r\n        &quot;article_details&quot;: {\r\n            &quot;id&quot;: 1,\r\n            &quot;name&quot;: &quot;213&quot;,\r\n            &quot;category_id&quot;: 1,\r\n            &quot;describe&quot;: &quot;test001&quot;,\r\n            &quot;content&quot;: &quot;第三方发送到&quot;&quot;&quot;,\r\n            &quot;create_time&quot;: &quot;2014-07-22 11:56:53&quot;\r\n        }\r\n    }\r\n}', '0', '0', '0', '0', '1', '1504922092', '1520504982');
INSERT INTO `ky_api` VALUES ('191', '修改密码', '34', '0', 'common/changepassword', '修改密码接口', '', '1', '[{\"field_name\":\"old_password\",\"data_type\":\"0\",\"is_require\":\"1\",\"field_describe\":\"\\u65e7\\u5bc6\\u7801\"},{\"field_name\":\"new_password\",\"data_type\":\"0\",\"is_require\":\"1\",\"field_describe\":\"\\u65b0\\u5bc6\\u7801\"}]', '', '0', '1', '0', '0', '{\r\n    &quot;code&quot;: 0,\r\n    &quot;msg&quot;: &quot;操作成功&quot;,\r\n    &quot;exe_time&quot;: &quot;0.037002&quot;\r\n}', '0', '0', '0', '0', '1', '1504941496', '1520504982');

-- ----------------------------
-- Table structure for ky_api_group
-- ----------------------------
DROP TABLE IF EXISTS `ky_api_group`;
CREATE TABLE `ky_api_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` char(120) NOT NULL DEFAULT '' COMMENT 'aip分组名称',
  `sort` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=72 DEFAULT CHARSET=utf8 COMMENT='api分组表';

-- ----------------------------
-- Records of ky_api_group
-- ----------------------------
INSERT INTO `ky_api_group` VALUES ('34', '基础接口', '0', '1504501195', '0', '1');
INSERT INTO `ky_api_group` VALUES ('44', '文章接口', '1', '1504765319', '1504765319', '1');
INSERT INTO `ky_api_group` VALUES ('45', '聚合接口', '0', '1504784149', '1504784149', '1');

-- ----------------------------
-- Table structure for ky_article
-- ----------------------------
DROP TABLE IF EXISTS `ky_article`;
CREATE TABLE `ky_article` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文章ID',
  `member_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员id',
  `name` char(40) NOT NULL DEFAULT '' COMMENT '文章名称',
  `category_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文章分类',
  `describe` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  `content` text NOT NULL COMMENT '文章内容',
  `cover_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '封面图片id',
  `file_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件id',
  `img_ids` varchar(200) NOT NULL DEFAULT '',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '数据状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='文章表';

-- ----------------------------
-- Records of ky_article
-- ----------------------------
INSERT INTO `ky_article` VALUES ('23', '1', '序言', '7', 'OneBase 是什么？', '&lt;h3 class=&quot;line&quot;&gt;\r\n	ThinkPHP -&amp;gt; OneBase -&amp;gt; 产品\r\n&lt;/h3&gt;\r\n&lt;p&gt;\r\n	OneBase是一个免费开源的，快速、简单的面向对象的应用研发架构，是为了快速研发应用而诞生的。在保持出色的性能和新颖设计思想同时，也注重易用性。遵循Apache2开源许可协议发布，意味着你可以免费使用OneBase，允许把您基于OneBase研发的应用开源或商业产品发布/销售。\r\n&lt;/p&gt;\r\n&lt;hr /&gt;\r\n&lt;h3 class=&quot;line&quot;&gt;\r\n	主要特性\r\n&lt;/h3&gt;\r\n&lt;p&gt;\r\n	&lt;strong&gt;规范&lt;/strong&gt;： OneBase 提供一套编码规范，可使团队研发协作事半功倍。&lt;br /&gt;\r\n&lt;strong&gt;严谨&lt;/strong&gt;： 异常严谨的错误检测和安全机制，详细的日志信息，为您的研发保驾护航。&lt;br /&gt;\r\n&lt;strong&gt;灵活&lt;/strong&gt;： 分层，服务，插件等合理的解耦合设计使您升级框架或需求变更得心应手。&lt;br /&gt;\r\n&lt;strong&gt;接口&lt;/strong&gt;： 完善的接口研发架构，使您只需关注业务逻辑研发，省心省力。&lt;br /&gt;\r\n&lt;strong&gt;高效&lt;/strong&gt;： 自动缓存设计，抛弃了处处判断的尴尬，使您不知不觉中已经使用了缓存。&lt;br /&gt;\r\n&lt;strong&gt;特色&lt;/strong&gt;： 无限级权限控制，垃圾资源回收，系统通用回收站，SEO变量支持，性能与操作监控，等各种脑洞大开的设计思想。\r\n&lt;/p&gt;\r\n&lt;hr /&gt;\r\n&lt;h3 class=&quot;line&quot;&gt;\r\n	捐赠我们\r\n&lt;/h3&gt;\r\n&lt;p&gt;\r\n	OneBase致力于简化企业和个人应用研发，您的帮助是对我们最大的支持和动力！\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	OneBase团队一直在坚持不懈地努力，并坚持开源和免费提供使用，帮助开发人员更加方便的进行应用快速研发，如果您对我们的成果表示认同并且觉得对您有所帮助我们愿意接受来自各方面的捐赠^_^。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	************ &lt;strong&gt;微信捐赠&lt;/strong&gt; ************************* &lt;strong&gt;支付宝捐赠&lt;/strong&gt; ************\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;img src=&quot;https://box.kancloud.cn/6640ec28b9701a85b8a970e53b870da3_265x265.png&quot; alt=&quot;&quot; /&gt;&lt;img src=&quot;https://box.kancloud.cn/b63395ec098a6e3c823825167bd6ffd7_265x265.png&quot; alt=&quot;&quot; /&gt;&lt;br /&gt;\r\n************************* &lt;strong&gt;QQ交流群：477824874&lt;/strong&gt; *********************\r\n&lt;/p&gt;', '0', '0', '', '1509620805', '1509762405', '1');
INSERT INTO `ky_article` VALUES ('24', '1', '安装OneBase', '7', 'OneBase安装环境要求', '&lt;h1 class=&quot;line&quot;&gt;\r\n	OneBase安装环境要求\r\n&lt;/h1&gt;\r\n&lt;hr /&gt;\r\n&lt;pre&gt;PHP &amp;gt;= &lt;span class=&quot;hljs-number&quot;&gt;7.0&lt;/span&gt;&lt;span class=&quot;hljs-number&quot;&gt;.0&lt;/span&gt; PDO PHP &lt;span class=&quot;hljs-keyword&quot;&gt;Extension&lt;/span&gt; MBstring PHP &lt;span class=&quot;hljs-keyword&quot;&gt;Extension&lt;/span&gt; CURL PHP &lt;span class=&quot;hljs-keyword&quot;&gt;Extension&lt;/span&gt; &lt;/pre&gt;\r\n&lt;hr /&gt;\r\n&lt;h3 class=&quot;line&quot;&gt;\r\n	开始安装\r\n&lt;/h3&gt;\r\n&lt;p&gt;\r\n	&lt;strong&gt;下载源码&lt;/strong&gt;：&lt;a href=&quot;https://gitee.com/Bigotry/OneBase&quot;&gt;https://gitee.com/Bigotry/OneBase&lt;/a&gt; \r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	1.下载源码后解压至Web目录。&lt;br /&gt;\r\n2.配置虚拟主机指向源码public目录。&lt;br /&gt;\r\n3.一切就绪后访问域名会看到引导安装界面。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	若安装流程正常执行完毕会跳转至系统首页，此时OneBase已经安装完成啦 ^_^\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;br /&gt;\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;br /&gt;\r\n&lt;/p&gt;\r\n&lt;p style=&quot;color:rgba(0, 0, 0, 0.87);font-family:&amp;quot;font-size:15.96px;font-style:normal;font-weight:normal;text-align:start;text-indent:0px;background-color:#FFFFFF;&quot;&gt;\r\n	&lt;strong&gt;常见安装问题：&lt;/strong&gt; \r\n&lt;/p&gt;\r\n&lt;p style=&quot;color:rgba(0, 0, 0, 0.87);font-family:&amp;quot;font-size:15.96px;font-style:normal;font-weight:normal;text-align:start;text-indent:0px;background-color:#FFFFFF;&quot;&gt;\r\n	&lt;strong&gt;1. No input file specified&lt;/strong&gt; \r\n&lt;/p&gt;\r\n&lt;p style=&quot;color:rgba(0, 0, 0, 0.87);font-family:&amp;quot;font-size:15.96px;font-style:normal;font-weight:normal;text-align:start;text-indent:0px;background-color:#FFFFFF;&quot;&gt;\r\n	&lt;strong&gt;解决办法 （.htaccess 文件 RewriteRule 改成这句 ^(.*)$ index.php [L,E=PATH_INFO:$1]）&lt;/strong&gt; \r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;br /&gt;\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;strong&gt;2. 某些Nginx版本下出现，控制器不存在问题，参考以下配置文件&lt;/strong&gt; \r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;br /&gt;\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;img src=&quot;/upload/picture/20171206/a770f61efb2ce03d85bb4bff7a8c70d7.png&quot; alt=&quot;&quot; /&gt;\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;br /&gt;\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	演示系统配置文件参考 &lt;a href=&quot;https://www.kancloud.cn/onebase/onebase/441504&quot;&gt;https://www.kancloud.cn/onebase/onebase/441504&lt;/a&gt; \r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;br /&gt;\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;span id=&quot;__kindeditor_bookmark_start_0__&quot;&gt;&lt;/span&gt; \r\n&lt;/p&gt;', '0', '0', '', '1509762474', '1512538659', '1');
INSERT INTO `ky_article` VALUES ('25', '1', '研发规范', '7', '团队研发事半功倍', '&lt;h1 class=&quot;line&quot;&gt;\r\n	研发规范\r\n&lt;/h1&gt;\r\n&lt;hr /&gt;\r\n&lt;h3 class=&quot;line&quot;&gt;\r\n	目录和文件命名\r\n&lt;/h3&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		目录命令使用小写加下划线。\r\n	&lt;/li&gt;\r\n	&lt;li&gt;\r\n		类库、函数文件统一以.php为后缀。\r\n	&lt;/li&gt;\r\n	&lt;li&gt;\r\n		类的文件名均以命名空间定义，并且命名空间的路径和类库文件所在路径一致。\r\n	&lt;/li&gt;\r\n	&lt;li&gt;\r\n		类文件采用驼峰法命名（首字母大写），其它文件采用小写加下划线命名。\r\n	&lt;/li&gt;\r\n	&lt;li&gt;\r\n		类名和类文件名保持一致，统一采用驼峰法命名（首字母大写）。\r\n	&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;hr /&gt;\r\n&lt;h3 class=&quot;line&quot;&gt;\r\n	函数和类、属性命名\r\n&lt;/h3&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		类的命名采用驼峰法（首字母大写），例如 User。\r\n	&lt;/li&gt;\r\n	&lt;li&gt;\r\n		函数的命名使用小写字母和下划线（小写字母开头）的方式，例如 get_client_ip。\r\n	&lt;/li&gt;\r\n	&lt;li&gt;\r\n		方法的命名使用驼峰法（首字母小写），例如 getUserName。\r\n	&lt;/li&gt;\r\n	&lt;li&gt;\r\n		属性的命名使用驼峰法（首字母小写），例如 tableName、instance。\r\n	&lt;/li&gt;\r\n	&lt;li&gt;\r\n		类名和类文件名保持一致，统一采用驼峰法命名（首字母大写）。\r\n	&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;hr /&gt;\r\n&lt;h3 class=&quot;line&quot;&gt;\r\n	常量和配置命名\r\n&lt;/h3&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		常量以大写字母和下划线命名，例如 APP_PATH。\r\n	&lt;/li&gt;\r\n	&lt;li&gt;\r\n		配置参数以小写字母和下划线命名，例如 url_route_on。\r\n	&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;hr /&gt;\r\n&lt;h3 class=&quot;line&quot;&gt;\r\n	数据表和字段命名\r\n&lt;/h3&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		数据表和字段采用小写加下划线方式命名，并注意字段名不要以下划线开头，例如 think_user 表和 user_name字段，不建议使用驼峰和中文作为数据表字段命名。\r\n	&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;hr /&gt;\r\n&lt;h3 class=&quot;line&quot;&gt;\r\n	编码建议\r\n&lt;/h3&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		每个类（不含注释）代码应在200行以内，每个方法（不含注释）代码应在20行以内。\r\n	&lt;/li&gt;\r\n	&lt;li&gt;\r\n		控制器层（controller）中，尽量不出现 if else switch 等流程分支语句。\r\n	&lt;/li&gt;\r\n	&lt;li&gt;\r\n		业务逻辑尽量封装在逻辑层（logic）中，供控制器调用。\r\n	&lt;/li&gt;\r\n	&lt;li&gt;\r\n		数据模型层（model）尽量在逻辑层 logic 中使用，尽量不要再控制器中直接使用model。\r\n	&lt;/li&gt;\r\n	&lt;li&gt;\r\n		数据验证尽量写在验证层（validate）中，供逻辑层调用，尽量不要在控制器中进行数据验证。\r\n	&lt;/li&gt;\r\n	&lt;li&gt;\r\n		支付|短信 等尽量封装为服务便于后续扩展，图标选择|省市县联动 等尽量封装为插件便于后续复用。\r\n	&lt;/li&gt;\r\n	&lt;li&gt;\r\n		API接口尽量根据APP界面实现组合接口，减少APP接口请求。\r\n	&lt;/li&gt;\r\n	&lt;li&gt;\r\n		其他文档中遗漏项，尽量参考OneBase编码与命名。\r\n	&lt;/li&gt;\r\n&lt;/ul&gt;', '0', '0', '', '1509762507', '1509763729', '1');
INSERT INTO `ky_article` VALUES ('26', '1', '目录结构', '7', 'OneBase目录结构', '&lt;img src=&quot;/upload/picture/20171206/e49c32fb18c336cf8706e81c704e6774.png&quot; alt=&quot;&quot; /&gt;&lt;br /&gt;', '0', '0', '', '1509762529', '1512538717', '1');
INSERT INTO `ky_article` VALUES ('27', '1', '首页介绍', '8', '后台登录与首页介绍', '&lt;h3 class=&quot;line&quot;&gt;\r\n	后台首页\r\n&lt;/h3&gt;\r\n&lt;p&gt;\r\n	安装完成以后输入 &lt;a href=&quot;http://xn--eqrt2g04jtsx/admin.php&quot;&gt;http://您的域名/admin.php&lt;/a&gt; 即可进入后台页面，若没有登录则会跳转登录页面。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;img src=&quot;https://box.kancloud.cn/fcea4ef525c3d80d03acf8c94e4149f8_1920x1000.png&quot; alt=&quot;&quot; /&gt;\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	登录完成后即可进入后台首页\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;img src=&quot;https://box.kancloud.cn/8f67981df66d26204af877e920d7e15a_1920x1002.png&quot; alt=&quot;&quot; /&gt;\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	后台分四个区域 顶部，左侧，内容，底部。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;strong&gt;顶部&lt;/strong&gt;：左侧为产品名称，旁边小图标可控制左侧是否展开，顶部右侧齿轮按钮可设置后台皮肤与布局，点击昵称区域可显示上次登录时间，时间下方左侧为 清空系统缓存按钮，右侧为退出系统按钮。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;strong&gt;左侧&lt;/strong&gt;：左侧为系统的菜单区域，左侧菜单为无限级菜单，后台的菜单管理中可控制左侧菜单与上面的图标和链接。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;strong&gt;内容&lt;/strong&gt;：内容区域分左右布局，左侧为系统信息，显示了系统的版本与依赖框架的版本包括运行环境，右侧为产品信息，值得注意的是右侧下方两项，缓存量与命中率只有后台开启自动缓存的情况下才会统计，缓存量是自动缓存的key数量，命中率为\r\n 查询次数与读取缓存次数计算出来的，比如  查询了 2次，第一次查询了数据库，第二次直接从缓存中读取，那么命中率为50%。&lt;br /&gt;\r\n系统信息与产品信息上方左侧为当前操作的标题信息，默认读取菜单名称，也可以控制器中使用 setTitle 方法设置，右侧为面包屑，可标识当前页面的位置结构。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;strong&gt;底部&lt;/strong&gt;：底部分左右布局，左侧为OneBase的版权信息，右侧为版本号，浮动在右下角的是TP5的调试信息，可在配置文件中关闭，研发阶段建议开启。\r\n&lt;/p&gt;', '0', '0', '', '1509792865', '1509792865', '1');
INSERT INTO `ky_article` VALUES ('28', '1', '会员管理', '8', '会员管理及无限级权限介绍', '&lt;h1 class=&quot;line&quot;&gt;\r\n	会员管理\r\n&lt;/h1&gt;\r\n&lt;hr /&gt;\r\n&lt;h3 class=&quot;line&quot;&gt;\r\n	会员列表\r\n&lt;/h3&gt;\r\n&lt;p&gt;\r\n	&lt;img src=&quot;https://box.kancloud.cn/98ae6e56979ef99082e34b3855c2d2b8_1920x1005.png&quot; alt=&quot;&quot; /&gt;\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	OneBase的会员列表是带继承关系的，超级管理员查看可看到所有的会员数据，上方有两个按钮，新增与导出，导出功能为演示系统导出功能的用法，数据列表中的操作按钮有授权与删除，授权可设置会员所在权限组，删除为软删除，需要彻底删除后面介绍回收站时会讲解。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;strong&gt;注意&lt;/strong&gt;：新增会员时表单中有一项 &ldquo;是否共享会员&rdquo;， 若选择共享会员自己的会员则会继承给添加的会员，添加的会员就可以在会员列表中查看到自己的会员数据，若不共享则添加的会员就没有权限查看自己的会员数据。\r\n&lt;/p&gt;\r\n&lt;hr /&gt;\r\n&lt;h3 class=&quot;line&quot;&gt;\r\n	权限管理\r\n&lt;/h3&gt;\r\n&lt;p&gt;\r\n	&lt;img src=&quot;https://box.kancloud.cn/ab02d0de03680b08ff9bf439608836e1_1903x945.png&quot; alt=&quot;&quot; /&gt;\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	权限管理点开默认为权限组列表页，可新增，删除，编辑 权限组信息。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;strong&gt;注意&lt;/strong&gt;：每个会员的权限组都是独立的，菜单授权功能也是带继承关系的，超级管理员拥有所有添加在菜单中的节点权限，比如：超级管理员添加\r\n 权限组 A， 并设置权限组A的菜单权限为 a1 a2 a3 a4 a5，然后添加一个会员 张三，将张三授权到权限组 A \r\n中，张三登录进来后，点击权限管理 是看不到 超级管理员的权限组信息的，张三此时可添加自己的权限组 B，然后给 B权限组设置 菜单权限，此时 \r\n张三可设置的菜单节点为 A 组 的最大权限 a1 a2 a3 a4 a5，那么 张三给B组的菜单权限设置为 a1 a2 a3权限， \r\n并添加李四进B组，李四 添加自己的权限组，可分配的最大权限即为 a1 a2 a3，OneBase的权限是可以这样无限的继承分配下去 ^_^。\r\n&lt;/p&gt;', '0', '0', '', '1509792935', '1509792935', '1');
INSERT INTO `ky_article` VALUES ('29', '1', '系统设置与配置管理', '8', '设置系统中需要使用的信息，在系统中通过 config 函数取值使用', '&lt;h1 class=&quot;line&quot; style=&quot;font-size:2.25em;font-family:&amp;quot;font-weight:200;color:rgba(0, 0, 0, 0.87);font-style:normal;text-align:start;text-indent:0px;background-color:#FFFFFF;&quot;&gt;\r\n	系统设置与配置管理\r\n&lt;/h1&gt;\r\n&lt;hr /&gt;\r\n&lt;h3 class=&quot;line&quot; style=&quot;font-family:&amp;quot;font-weight:200;font-size:1.5em;color:rgba(0, 0, 0, 0.87);font-style:normal;text-align:start;text-indent:0px;background-color:#FFFFFF;&quot;&gt;\r\n	系统设置\r\n&lt;/h3&gt;\r\n&lt;p style=&quot;color:rgba(0, 0, 0, 0.87);font-family:&amp;quot;font-size:15.96px;font-style:normal;font-weight:normal;text-align:start;text-indent:0px;background-color:#FFFFFF;&quot;&gt;\r\n	&lt;img src=&quot;https://box.kancloud.cn/1bf57e33aa50f1a5ced8cb49638a20fa_1920x947.png&quot; alt=&quot;&quot; style=&quot;border:0px;&quot; /&gt; \r\n&lt;/p&gt;\r\n&lt;p style=&quot;color:rgba(0, 0, 0, 0.87);font-family:&amp;quot;font-size:15.96px;font-style:normal;font-weight:normal;text-align:start;text-indent:0px;background-color:#FFFFFF;&quot;&gt;\r\n	系统设置是设置系统中需要使用的字符串，数组，文本 等信息，在系统中通过 config 函数取值使用。\r\n&lt;/p&gt;\r\n&lt;p style=&quot;color:rgba(0, 0, 0, 0.87);font-family:&amp;quot;font-size:15.96px;font-style:normal;font-weight:normal;text-align:start;text-indent:0px;background-color:#FFFFFF;&quot;&gt;\r\n	OneBase 默认支持 数字，字符，文本，枚举，数组 5种配置类型，如有需要可自行扩展，后续手册中也会演示扩展配置类型的教程。\r\n&lt;/p&gt;\r\n&lt;p style=&quot;color:rgba(0, 0, 0, 0.87);font-family:&amp;quot;font-size:15.96px;font-style:normal;font-weight:normal;text-align:start;text-indent:0px;background-color:#FFFFFF;&quot;&gt;\r\n	系统设置值之前需要先添加系统配置，下面看下如何添加系统配置。\r\n&lt;/p&gt;\r\n&lt;hr /&gt;\r\n&lt;h3 class=&quot;line&quot; style=&quot;font-family:&amp;quot;font-weight:200;font-size:1.5em;color:rgba(0, 0, 0, 0.87);font-style:normal;text-align:start;text-indent:0px;background-color:#FFFFFF;&quot;&gt;\r\n	配置列表与配置新增\r\n&lt;/h3&gt;\r\n&lt;p style=&quot;color:rgba(0, 0, 0, 0.87);font-family:&amp;quot;font-size:15.96px;font-style:normal;font-weight:normal;text-align:start;text-indent:0px;background-color:#FFFFFF;&quot;&gt;\r\n	&lt;img src=&quot;https://box.kancloud.cn/f993980d47992aee3b1bb7aafa079243_1917x945.png&quot; alt=&quot;&quot; style=&quot;border:0px;&quot; /&gt; \r\n&lt;/p&gt;\r\n&lt;p style=&quot;color:rgba(0, 0, 0, 0.87);font-family:&amp;quot;font-size:15.96px;font-style:normal;font-weight:normal;text-align:start;text-indent:0px;background-color:#FFFFFF;&quot;&gt;\r\n	&lt;img src=&quot;https://box.kancloud.cn/2aa1a9ed50c0b7c1dbe093adaceb09a2_1918x943.png&quot; alt=&quot;&quot; style=&quot;border:0px;&quot; /&gt; \r\n&lt;/p&gt;\r\n&lt;p style=&quot;color:rgba(0, 0, 0, 0.87);font-family:&amp;quot;font-size:15.96px;font-style:normal;font-weight:normal;text-align:start;text-indent:0px;background-color:#FFFFFF;&quot;&gt;\r\n	&lt;strong&gt;注意&lt;/strong&gt;：系统设置与配置列表 上面的 基础，数据，系统，API 四项 也属于系统配置，在配置列表中是可以找到的，若需要添加新的配置分组可直接在系统设置中进行设置。\r\n&lt;/p&gt;\r\n&lt;p style=&quot;color:rgba(0, 0, 0, 0.87);font-family:&amp;quot;font-size:15.96px;font-style:normal;font-weight:normal;text-align:start;text-indent:0px;background-color:#FFFFFF;&quot;&gt;\r\n	下面咱们演示添加一个枚举与一个字符配置\r\n&lt;/p&gt;\r\n&lt;p style=&quot;color:rgba(0, 0, 0, 0.87);font-family:&amp;quot;font-size:15.96px;font-style:normal;font-weight:normal;text-align:start;text-indent:0px;background-color:#FFFFFF;&quot;&gt;\r\n	添加一个客服电话字符配置\r\n&lt;/p&gt;\r\n&lt;p style=&quot;color:rgba(0, 0, 0, 0.87);font-family:&amp;quot;font-size:15.96px;font-style:normal;font-weight:normal;text-align:start;text-indent:0px;background-color:#FFFFFF;&quot;&gt;\r\n	&lt;img src=&quot;https://box.kancloud.cn/c6a21953d9548a2e588c25e02736454d_1920x730.png&quot; alt=&quot;&quot; style=&quot;border:0px;&quot; /&gt; \r\n&lt;/p&gt;\r\n&lt;p style=&quot;color:rgba(0, 0, 0, 0.87);font-family:&amp;quot;font-size:15.96px;font-style:normal;font-weight:normal;text-align:start;text-indent:0px;background-color:#FFFFFF;&quot;&gt;\r\n	添加一个语言枚举配置\r\n&lt;/p&gt;\r\n&lt;p style=&quot;color:rgba(0, 0, 0, 0.87);font-family:&amp;quot;font-size:15.96px;font-style:normal;font-weight:normal;text-align:start;text-indent:0px;background-color:#FFFFFF;&quot;&gt;\r\n	&lt;img src=&quot;https://box.kancloud.cn/92d4f8fbeb0dadd88ddc5cbb325210f7_1919x811.png&quot; alt=&quot;&quot; style=&quot;border:0px;&quot; /&gt; \r\n&lt;/p&gt;\r\n&lt;p style=&quot;color:rgba(0, 0, 0, 0.87);font-family:&amp;quot;font-size:15.96px;font-style:normal;font-weight:normal;text-align:start;text-indent:0px;background-color:#FFFFFF;&quot;&gt;\r\n	添加了两个配置后，咱们来看一下系统设置。\r\n&lt;/p&gt;\r\n&lt;p style=&quot;color:rgba(0, 0, 0, 0.87);font-family:&amp;quot;font-size:15.96px;font-style:normal;font-weight:normal;text-align:start;text-indent:0px;background-color:#FFFFFF;&quot;&gt;\r\n	&lt;img src=&quot;https://box.kancloud.cn/461df4a992ddd491056d49afc03a0fce_1917x820.png&quot; alt=&quot;&quot; style=&quot;border:0px;&quot; /&gt; \r\n&lt;/p&gt;\r\n&lt;p style=&quot;color:rgba(0, 0, 0, 0.87);font-family:&amp;quot;font-size:15.96px;font-style:normal;font-weight:normal;text-align:start;text-indent:0px;background-color:#FFFFFF;&quot;&gt;\r\n	发现多出了 两个设置选项，显示顺序可在添加配置时根据排序值控制，这里不再叙述。\r\n&lt;/p&gt;\r\n&lt;p style=&quot;color:rgba(0, 0, 0, 0.87);font-family:&amp;quot;font-size:15.96px;font-style:normal;font-weight:normal;text-align:start;text-indent:0px;background-color:#FFFFFF;&quot;&gt;\r\n	客服电话 是字符类型的配置，所以设置时 可以直接输入字符串值。\r\n&lt;/p&gt;\r\n&lt;p style=&quot;color:rgba(0, 0, 0, 0.87);font-family:&amp;quot;font-size:15.96px;font-style:normal;font-weight:normal;text-align:start;text-indent:0px;background-color:#FFFFFF;&quot;&gt;\r\n	枚举类型是单选择框只能选择一个值，因为咱们添加时配置值默认输入的是0，所以此时默认的是 PHP，默认选择值也就是 配置项 中 冒号 : 之前的内容，注意冒号是英文冒号，前后值不要包含空格，一个选项独占一行。\r\n&lt;/p&gt;\r\n&lt;p style=&quot;color:rgba(0, 0, 0, 0.87);font-family:&amp;quot;font-size:15.96px;font-style:normal;font-weight:normal;text-align:start;text-indent:0px;background-color:#FFFFFF;&quot;&gt;\r\n	下面咱们看看 在程序中如何使用\r\n&lt;/p&gt;\r\n&lt;p style=&quot;color:rgba(0, 0, 0, 0.87);font-family:&amp;quot;font-size:15.96px;font-style:normal;font-weight:normal;text-align:start;text-indent:0px;background-color:#FFFFFF;&quot;&gt;\r\n	&lt;img src=&quot;https://box.kancloud.cn/e6c3550fc71329855a9f53f3165c78fc_722x599.png&quot; alt=&quot;&quot; style=&quot;border:0px;&quot; /&gt; \r\n&lt;/p&gt;\r\n&lt;p style=&quot;color:rgba(0, 0, 0, 0.87);font-family:&amp;quot;font-size:15.96px;font-style:normal;font-weight:normal;text-align:start;text-indent:0px;background-color:#FFFFFF;&quot;&gt;\r\n	在代码中咱们通过 config函数获取了 刚才的配置标识对应的值，下面看下输出结果。\r\n&lt;/p&gt;\r\n&lt;p style=&quot;color:rgba(0, 0, 0, 0.87);font-family:&amp;quot;font-size:15.96px;font-style:normal;font-weight:normal;text-align:start;text-indent:0px;background-color:#FFFFFF;&quot;&gt;\r\n	&lt;img src=&quot;https://box.kancloud.cn/b28fb82d6ec4f7cf59e5c13754431310_692x111.png&quot; alt=&quot;&quot; style=&quot;border:0px;&quot; /&gt; \r\n&lt;/p&gt;\r\n&lt;p style=&quot;color:rgba(0, 0, 0, 0.87);font-family:&amp;quot;font-size:15.96px;font-style:normal;font-weight:normal;text-align:start;text-indent:0px;background-color:#FFFFFF;&quot;&gt;\r\n	输出了 刚才配置的客服电话 与 语言选项，若咱们在设置中将 客服电话修改为 18521353332 将 语言选项设置为 C#，那么 输出结果将变成 18521353332 与 2 。\r\n&lt;/p&gt;\r\n&lt;p style=&quot;color:rgba(0, 0, 0, 0.87);font-family:&amp;quot;font-size:15.96px;font-style:normal;font-weight:normal;text-align:start;text-indent:0px;background-color:#FFFFFF;&quot;&gt;\r\n	^_^。 理解了吧，是不是很简单。 至于OneBase默认自带的配置 后续章节会介绍蛤~\r\n&lt;/p&gt;', '0', '0', '', '1509966353', '1509966399', '1');
INSERT INTO `ky_article` VALUES ('30', '1', '菜单管理', '8', 'OneBase 后台菜单是无限级的，意味着您的后台菜单可以无限制的往下层添加', '&lt;h1 class=&quot;line&quot;&gt;\r\n	菜单管理\r\n&lt;/h1&gt;\r\n&lt;hr /&gt;\r\n&lt;h3 class=&quot;line&quot;&gt;\r\n	菜单列表\r\n&lt;/h3&gt;\r\n&lt;p&gt;\r\n	&lt;img src=&quot;https://box.kancloud.cn/cae5ec29ba13bd71a1db0aaab597481c_1919x942.png&quot; alt=&quot;&quot; /&gt; \r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	OneBase 后台菜单是无限级的，意味着您的后台菜单可以无限制的往下层添加。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	后台查看下级菜单可点击菜单名称或右侧子菜单按钮，此处使用的是递归遍历，所以点进去后模板与外层模板是一样的。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	初学者添加后台菜单建议参考OneBase现有的菜单数据添加。\r\n&lt;/p&gt;\r\n&lt;hr /&gt;\r\n&lt;h3 class=&quot;line&quot;&gt;\r\n	菜单添加\r\n&lt;/h3&gt;\r\n&lt;p&gt;\r\n	&lt;img src=&quot;https://box.kancloud.cn/8e68f8eec7b630965f564095edf30820_1905x666.png&quot; alt=&quot;&quot; /&gt; \r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	菜单名称是用于后台显示的和用户识别的，排序值是控制菜单后台显示顺序的（同级有效），链接是指点击菜单后跳转的页面语法（控制器/方法），上级菜单是指当前添加菜单属于某个菜单下级，是否隐藏是控制是否出现在后台菜单中的（隐藏菜单也会进行权限验证），图标是后台菜单名称前面的小图标，此处小图标选择已经封装成了插件需要使用小图标选择时参考菜单添加与编辑这里，小图标库也可以进行扩展（参考\r\n font-awesome）。\r\n&lt;/p&gt;', '0', '0', '', '1510137834', '1510137842', '1');
INSERT INTO `ky_article` VALUES ('31', '1', '系统回收站', '8', 'OneBase 的回收站不是其他产品那种 某个表（如：订单或文章）的回收站喔，而是整个系统所有数据的回收站喔~', '&lt;h1 class=&quot;line&quot;&gt;\r\n	系统回收站\r\n&lt;/h1&gt;\r\n&lt;hr /&gt;\r\n&lt;h3 class=&quot;line&quot;&gt;\r\n	回收站\r\n&lt;/h3&gt;\r\n&lt;p&gt;\r\n	&lt;img src=&quot;https://box.kancloud.cn/1025ac572b017963b83ad26b9c6cb517_1914x699.png&quot; alt=&quot;&quot; /&gt;\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	OneBase 的回收站不是其他产品那种 某个表（如：订单或文章）的回收站喔，而是整个系统所有数据的回收站喔~\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	下面咱们介绍一下回收站列表页面，上图中 第一列是 数据模型名称，第二列是 数据模型路径，第三列是指 此模型下面被删除数据的数量，第四列是操作列，点击数据可查看此模型被删除的数据。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	小伙伴们看到这里有列表 但是没有新增是不是很好奇数据从哪里来的丫 ^_^。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;img src=&quot;https://box.kancloud.cn/058e92152bfb5296e58bf16c663fdb96_1918x783.png&quot; alt=&quot;&quot; /&gt;\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	就是这里。。系统设置里面的系统分组中有个回收站配置，key为模型名称，值为显示列。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	意思就是 冒号前面是 模型的名称 如：用户模型（Member），冒号后面是 回收站数据 页面中显示的名称。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	腻害吧，在这里配置完成后 咱们的回收站就会自动显示对应的模型，查看被删除的数据，还可以还原和彻底干掉喔~\r\n&lt;/p&gt;\r\n&lt;hr /&gt;\r\n&lt;h3 class=&quot;line&quot;&gt;\r\n	回收站数据\r\n&lt;/h3&gt;\r\n&lt;p&gt;\r\n	&lt;img src=&quot;https://box.kancloud.cn/ee37aaf33b7b5080c2fcfe7a6365a1de_1918x698.png&quot; alt=&quot;&quot; /&gt;\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	比如上图中就是点击菜单模型旁边的数据看到的页面，里面这些数据 都是被删除的数据，点击彻底删除就可以彻底的让Ta消失。。再也找不回来了。所以要慎重(⊙o⊙)&hellip; ，点击恢复正常 可以 把删除状态恢复为正常数据状态，在菜单管理中就可以看到啦。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	系统回收站就介绍到这里咯，还有疑问可加入QQ交流群：477824874 交流蛤~期待您的光临。\r\n&lt;/p&gt;', '0', '0', '', '1510218109', '1510218109', '1');
INSERT INTO `ky_article` VALUES ('32', '1', '服务管理', '8', 'OneBase 已经集成了 支付服务和云存储服务，OneBase 追求的不是服务有多少，插件有多少，而是给开发者们一套可扩展性强，适合用来二次研发的架构', '&lt;h1 class=&quot;line&quot;&gt;\r\n	服务管理\r\n&lt;/h1&gt;\r\n&lt;hr /&gt;\r\n&lt;h3 class=&quot;line&quot;&gt;\r\n	系统服务列表\r\n&lt;/h3&gt;\r\n&lt;p&gt;\r\n	&lt;img src=&quot;https://box.kancloud.cn/05df6205da557c801dd1d061d27317a9_1917x650.png&quot; alt=&quot;&quot; /&gt;\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	图中可以看到OneBase 已经集成了 支付服务和云存储服务，OneBase \r\n追求的不是服务有多少，插件有多少，而是给开发者们一套可扩展性强，适合用来二次研发的架构，所以OneBase 自带的服务、驱动、插件 \r\n主要是起一个引导作用，实际研发中根据实际情况分析，然后进行服务、驱动、插件、函数 等封装。\r\n&lt;/p&gt;\r\n&lt;hr /&gt;\r\n&lt;h3 class=&quot;line&quot;&gt;\r\n	服务驱动列表\r\n&lt;/h3&gt;\r\n&lt;p&gt;\r\n	&lt;img src=&quot;https://box.kancloud.cn/75855cf08e4d06f5b94ac91fd278cc97_1915x679.png&quot; alt=&quot;&quot; /&gt;\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	点开支付服务右侧的驱动，可以看到已经存在支付宝、微信支付、易宝支付 的驱动，由此处就可以看到 想扩展其他支付驱动很方便，至于服务和驱动 如果进行编码及研发，可参考后续章节的服务研发及使用。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;img src=&quot;https://box.kancloud.cn/46d13fa1b8d41e0f5596932434a78ad4_1915x731.png&quot; alt=&quot;&quot; /&gt;\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;img src=&quot;https://box.kancloud.cn/68456ee3cee2ebedb4a9b86a571ccdc1_1915x736.png&quot; alt=&quot;&quot; /&gt;\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	上图为 点开 微信驱动安装与支付宝驱动安装的效果，细心的小伙伴会发现 浏览器上的URL并没有变化，而是参数在变化。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	此处使用了多态性的设计，使不同的驱动安装 展示不同的表单录入项，至于需要录入的录入项则是由驱动研发时进行控制的。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	这里只是介绍，具体研发及扩展 请阅读后续章节蛤。^_^。\r\n&lt;/p&gt;', '0', '0', '', '1510307288', '1510307288', '1');
INSERT INTO `ky_article` VALUES ('33', '1', '插件管理', '8', 'OneBase 可以自己扩展插件哦', '&lt;h1 class=&quot;line&quot;&gt;\r\n	插件管理\r\n&lt;/h1&gt;\r\n&lt;hr /&gt;\r\n&lt;h3 class=&quot;line&quot;&gt;\r\n	钩子列表\r\n&lt;/h3&gt;\r\n&lt;p&gt;\r\n	&lt;img src=&quot;https://box.kancloud.cn/232758b9b204a053cd07634fa33a47ce_1918x703.png&quot; alt=&quot;&quot; /&gt;\r\n&lt;/p&gt;\r\n&lt;hr /&gt;\r\n&lt;h3 class=&quot;line&quot;&gt;\r\n	插件列表\r\n&lt;/h3&gt;\r\n&lt;p&gt;\r\n	&lt;img src=&quot;https://box.kancloud.cn/b7406939a59699f894e653fe95eeaf17_1920x737.png&quot; alt=&quot;&quot; /&gt;\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	上图为 咱们的插件列表，右侧按钮 有 安装 与 卸载，但是每次只会出现一个，未安装状态下出现的是安装按钮，安装状态下出现的是卸载按钮。\r\n&lt;/p&gt;', '0', '0', '', '1510393207', '1510393207', '1');
INSERT INTO `ky_article` VALUES ('34', '1', '文章管理', '8', 'OneBase 文章管理可谓简单粗暴', '&lt;h1 class=&quot;line&quot;&gt;\r\n	文章管理\r\n&lt;/h1&gt;\r\n&lt;hr /&gt;\r\n&lt;h3 class=&quot;line&quot;&gt;\r\n	文章分类列表\r\n&lt;/h3&gt;\r\n&lt;p&gt;\r\n	&lt;img src=&quot;https://box.kancloud.cn/93e990d2063204f7171aaaee1e8cb319_1915x568.png&quot; alt=&quot;&quot; /&gt; \r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	文章是很常见的功能模块，也是一套系统经常会操作的功能，所以必须要简单易用。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	OneBase 考虑到文章编辑人员可能存在使用上的障碍，所以默认使用了最常见的结构，一级文章分类，此处抛弃了 无限级分类的文章架构，因为实际情况下运营人员常常要求很简单，不希望常用功能过于复杂难于理解。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	当然也不排除有些项目的需求从架构上 就必须要求 多级分类，所以此处谈下 扩展文章分类的做法，OneBase扩展多级分类建议从文章分类上 向上扩展，比如添加文章分类上 加一项顶级分类选择。\r\n&lt;/p&gt;\r\n&lt;hr /&gt;\r\n&lt;h3 class=&quot;line&quot;&gt;\r\n	文章列表\r\n&lt;/h3&gt;\r\n&lt;p&gt;\r\n	&lt;img src=&quot;https://box.kancloud.cn/e03831ec9865bfa3520b59ff68025fec_1913x688.png&quot; alt=&quot;&quot; /&gt; \r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;img src=&quot;https://box.kancloud.cn/800dd3be11a94330050a5cb1f3575512_1903x940.png&quot; alt=&quot;&quot; /&gt; \r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	上图为文章列表与文章编辑， 可以看到列表页和编辑页有些数据是咱们OneBase前端没有看到的数据，OneBase \r\n是一套研发应用解决方案，文章上的 附件，单图上传，多图上传 等 包括其他模块没有用到的一些功能存在是为了展示研发及使用上的技巧，所以 \r\n作为OneBase的使用者，是需要具备二次研发能力的。\r\n&lt;/p&gt;', '0', '0', '', '1510393374', '1510393406', '1');
INSERT INTO `ky_article` VALUES ('35', '1', '接口管理', '8', '接口管理看完后再也不用和APP研发工程师撕逼啦~自己去看文档吧，哈哈', '&lt;h1 class=&quot;line&quot;&gt;\r\n	接口管理\r\n&lt;/h1&gt;\r\n&lt;hr /&gt;\r\n&lt;h3 class=&quot;line&quot;&gt;\r\n	接口列表\r\n&lt;/h3&gt;\r\n&lt;p&gt;\r\n	接口分组管理这里就不在叙述，就是为了给接口归类。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;img src=&quot;https://box.kancloud.cn/5f5267b6d4fee4a47c9f7d8e29e88ecc_1919x738.png&quot; alt=&quot;&quot; /&gt;\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	上图为接口列表页，左上角有两个按钮，一个是新增接口，一个是接口文档跳转按钮。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	数据列表中 第1列为 接口名称，第2列为接口分组，第3列为接口请求类型，OneBase默认统一POST类型，当然需要其他类型如GET \r\n可自行扩展，第4列为接口地址也就是 \r\n（控制器/方法），第5列是接口目前的状态，接口状态中的选项在系统设置的API栏目下可进行配置，第6列为研发者，研发者成员也在系统设置的API栏目下配置，后面两列为接口排序与操作，接口排序为同级有效。\r\n&lt;/p&gt;\r\n&lt;hr /&gt;\r\n&lt;h3 class=&quot;line&quot;&gt;\r\n	接口新增\r\n&lt;/h3&gt;\r\n&lt;p&gt;\r\n	&lt;img src=&quot;https://box.kancloud.cn/c425bef34644d08f110f9e10e3a794e1_1900x945.png&quot; alt=&quot;&quot; /&gt;\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	^_^。  虽然表单数据数据有点多，但是不要怕蛤，咱们来一个一个讲解。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	咱们按从左往右，从上往下进行编号讲解，比如 1 2 3 4 对应的是 接口名称，接口排序值，请求地址，请求类型。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	1：API接口名称，就是用来看滴。。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	2：接口排序值，用来进行接口显示排序，这些都很好理解啦。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	3：请求地址，接口访问地址格式（控制器/方法）。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	4：请求类型，默认为POST，需要其他类型可自己扩展。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	5：是否为分页接口，意思就是这个接口是否需要分页功能，如果需要分页功能可传递相关参数，如：list_rows 每页显示的数据量，page 查询的页码。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	6：研发者，此接口的研发人员，选项中的可选值可在系统设置的API分组下进行配置。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	7：请求数据，意思就是执行此接口是否需要带请求参数，默认为否不带请求数据，此处的请求数据控制的为接口所依赖的请求参数，大家可以打开 &lt;a href=&quot;/api.php&quot;&gt;https://onebase.org/api.php&lt;/a&gt; 看到里面这些接口 下面有个测试接口功能，此处测试接口功能的表单就是根据这里请求数据设置自动生成的，Token与分页参数是不受此处控制的。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	8：响应数据，意思就是接口执行成功后返回的数据，默认为否不带返回数据，为是 则可添加接口返回的数据，当然也会有特殊数据 如 分页数据及后面将介绍的数据签名 等。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	9：接口分组，这个就不介绍啦。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	10：接口状态，这个也飘过吧。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	11：接口响应示例，这个是用来给接口调用者看的，方便接口调用者可一眼看清数据结构，提升团队研发效率。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	12：接口简介，用来看滴。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	13：是否验证用户令牌：user_token， 用来做身份验证滴，比如 \r\n文章列表接口，所有的访问者不需要登录也可以看到，就设置为否，这样接口调用就不需要带user_token，若 为需要身份验证的接口，如 \r\n订单列表，某个会员只能查看自己的订单，就需要用到user_token啦，所以 像 订单管理，个人中心等 这些接口是需要带 \r\nuser_token的。user_token 是调用登录接口后返回的，所以若终端想调用需要身份验证的接口，则需要 先调用登录接口后将接口中返回的\r\n user_token 保存下来，在后续接口调用过程中使用。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	14：是否响应数据签名：data_sign，此处是用于做数据安全验证的，比如咱们服务器给终端返回了数据，但是 \r\n终端那边怎么知道真滴是咱们返回的呢。。此时 data_sign 就派上用场啦。 返回的数据中带上了 data_sign \r\n字段，终端根据服务器返回的数据进行与服务器端相同的算法，计算出 终端的  data_sign，然后两端的  data_sign \r\n进行比对，若一模一样，则说明 数据是一模一样滴，这样就很安全啦，别人想改也不行，嘿嘿。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	15：是否验证请求数据签名：data_sign，原理是一样滴，意思就是 终端像接口提交数据时，咱们服务器端也得知道提交的数据是否安全，所以\r\n 咱们也要根据提交上来的数据 生成 \r\ndata_sign，与提交数据中带的data_sign，进行比对，不一样的话就不执行操作，接口返回数据签名不对，一样的话就放行。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	16：这个是备用的。。担心服务端人员太腻害，研发出来的接口实在是用言语无法表达。。就可以用富文本进行图文描述。。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	好啦，输入选项介绍完了，咱们看下登录接口的编辑数据页面，看看是咋输入滴。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;img src=&quot;https://box.kancloud.cn/b66298b92545f3cc1b2c22d886a68f4f_1900x947.png&quot; alt=&quot;&quot; /&gt;\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	后台接口管理功能就介绍到这里，更深一步将在接口研发中讲解。\r\n&lt;/p&gt;', '0', '0', '', '1510646369', '1510646369', '1');
INSERT INTO `ky_article` VALUES ('36', '1', '优化维护-SEO管理', '8', 'OneBase中的SEO信息可是支持变量滴~', '&lt;h1 class=&quot;line&quot;&gt;\r\n	SEO管理\r\n&lt;/h1&gt;\r\n&lt;hr /&gt;\r\n&lt;h3 class=&quot;line&quot;&gt;\r\n	SEO管理列表\r\n&lt;/h3&gt;\r\n&lt;p&gt;\r\n	&lt;img src=&quot;https://box.kancloud.cn/4065235f0baa9f04351aa5dfda0a7590_1920x562.png&quot; alt=&quot;&quot; /&gt;\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	上图为SEO管理数据列表，可以看到标题和关键词里面有变量，OneBase中的这些变量可不是固定的喔~\r\n&lt;/p&gt;\r\n&lt;hr /&gt;\r\n&lt;h3 class=&quot;line&quot;&gt;\r\n	SEO变量\r\n&lt;/h3&gt;\r\n&lt;p&gt;\r\n	至于新增和编辑这里就不在叙述啦~太简单咯，咱们直接看看SEO中的这些变量是从哪里来滴。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;img src=&quot;https://box.kancloud.cn/6f2c5cf3484b2768324f2409ca84accb_1915x786.png&quot; alt=&quot;&quot; /&gt;\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	咱们点开首页的SEO配置信息编辑页面，看到里面用到这些变量，{$category_name}，{$article_title}，{$article_describe}\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	这些变量是从哪里来的？ 请看下图\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;img src=&quot;https://box.kancloud.cn/a805e5dee7706276a304787f2ee31194_1031x930.png&quot; alt=&quot;&quot; /&gt;\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	细心的观众能看出来，都是 assign 方法中的变量，如果 assign 不知道是干啥的。。那么请移步至ThinkPHP5的手册 看完再来蛤。。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	SEO中的变量支持 所有在控制器中 assign 给模板赋值的变量，这意味着您想添加或减少很简单。。前提是您是开发者。当然，开发者开发完成后建议把此处所支持的变量录入到 可用变量 的输入框中 方便 非开发者知道可支持的有哪些变量蛤。\r\n&lt;/p&gt;', '0', '0', '', '1512096686', '1512096686', '1');
INSERT INTO `ky_article` VALUES ('37', '1', '优化维护-数据库', '8', '此处可以备份和还原数据库', '&lt;h1 class=&quot;line&quot;&gt;\r\n	数据库\r\n&lt;/h1&gt;\r\n&lt;hr /&gt;\r\n&lt;h3 class=&quot;line&quot;&gt;\r\n	数据备份\r\n&lt;/h3&gt;\r\n&lt;p&gt;\r\n	&lt;img src=&quot;https://box.kancloud.cn/fca84a3b960b8d65dfe2896bab3de32d_1912x873.png&quot; alt=&quot;&quot; /&gt;\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	上图是数据备份页面，列表中是数据库表信息，点击左上角的按钮备份数据，可实现数据库的备份，旁边的 优化和修复是执行的MySql内置的优化与修复，如需了解请自行搜索蛤。\r\n&lt;/p&gt;\r\n&lt;hr /&gt;\r\n&lt;h3 class=&quot;line&quot;&gt;\r\n	数据还原\r\n&lt;/h3&gt;\r\n&lt;p&gt;\r\n	&lt;img src=&quot;https://box.kancloud.cn/a939e0e84d1a25952e619e7beaff76ad_1916x788.png&quot; alt=&quot;&quot; /&gt;\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	上图是数据还原的界面，列表中为之前备份的记录，点击右侧的还原可还原到当时备份的数据库，若系统已经上线此功能要慎重使用。\r\n&lt;/p&gt;', '0', '0', '', '1512096775', '1512096775', '1');
INSERT INTO `ky_article` VALUES ('38', '1', '优化维护-文件清理', '8', '自动清理系统辣鸡文件和辣鸡数据，维护系统健康', '&lt;h1 class=&quot;line&quot;&gt;\r\n	文件清理\r\n&lt;/h1&gt;\r\n&lt;hr /&gt;\r\n&lt;h3 class=&quot;line&quot;&gt;\r\n	文件清理列表\r\n&lt;/h3&gt;\r\n&lt;p&gt;\r\n	&lt;img src=&quot;https://box.kancloud.cn/2cbbad1d7df01f67406b189a057e4a2a_1918x609.png&quot; alt=&quot;&quot; /&gt;\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	点击文件清理后发现没有数据，说明系统很健康喔~木有辣鸡文件需要清理，下面咱们人工制造两个无用的图片试试。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;img src=&quot;https://box.kancloud.cn/d42b3147c268615b37e5275c57cc5344_561x798.png&quot; alt=&quot;&quot; /&gt;\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	上图中咱们 制造了 辣鸡1 和 辣鸡2，再来看看后台。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;img src=&quot;https://box.kancloud.cn/ded6f545da29c4ddada686a061e93568_1917x764.png&quot; alt=&quot;&quot; /&gt;\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	发现辣鸡了。。腻害吧。嘿嘿。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	然后咱们点击开始清理，然后就会自动干掉 系统中没有引用的文件，这里不光是干掉没有使用的辣鸡文件哦，还隐式的干掉了 数据库中记录的文件记录但是在文件中又不存在的，是双向检索蛤。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	那么问题来了， 系统怎么知道咱们哪些需要检索为辣鸡数据 哪些不需要检索呢？\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;img src=&quot;https://box.kancloud.cn/0e48380b13dda40e59223ed21ab18d05_1918x845.png&quot; alt=&quot;&quot; /&gt;\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	图上就是配置检索字段的地方啦。: 冒号前面为 模型名称，后面为 需要检索的字段名称，但是 \r\n冒号前面的模型前咋还有下划线呢？下划线是用来区分key标识的，因为 如果没有下划线前面的 0 和 1 系统就没办法知道 这两个 key \r\n有啥区别，就理解成了 只有 1个key ， 就会造成系统清理的时候 有遗漏蛤，所以 需要添加清理配置列就参考此处喔。\r\n&lt;/p&gt;', '0', '0', '', '1512096869', '1512096869', '1');
INSERT INTO `ky_article` VALUES ('39', '1', '优化维护-行为日志', '8', '后台操作行为一目了然', '&lt;h3 class=&quot;line&quot;&gt;\r\n	行为日志列表\r\n&lt;/h3&gt;\r\n&lt;p&gt;\r\n	&lt;img src=&quot;https://box.kancloud.cn/ace534fc77ad7137c1eb21c2679d287b_1917x855.png&quot; alt=&quot;&quot; /&gt; \r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	图上是系统的行为日志，此处的行为日志是指后台的操作行为记录，不涉及其他模块，后台研发过程中需要记录行为日志则使用  action_log 函数记录，清空与删除日志此处就不说啦。\r\n&lt;/p&gt;', '0', '0', '', '1512471084', '1512471100', '1');
INSERT INTO `ky_article` VALUES ('40', '1', '优化维护-执行记录', '8', '监控系统执行记录，让系统随时处于最佳状态', '&lt;h1 class=&quot;line&quot;&gt;\r\n	执行记录\r\n&lt;/h1&gt;\r\n&lt;hr /&gt;\r\n&lt;h3 class=&quot;line&quot;&gt;\r\n	全局范围\r\n&lt;/h3&gt;\r\n&lt;p&gt;\r\n	&lt;img src=&quot;https://box.kancloud.cn/5cbb0f2cb8e55ef6593668299a67022a_1916x732.png&quot; alt=&quot;&quot; /&gt;\r\n&lt;/p&gt;\r\n&lt;hr /&gt;\r\n&lt;h3 class=&quot;line&quot;&gt;\r\n	接口范围\r\n&lt;/h3&gt;\r\n&lt;p&gt;\r\n	&lt;img src=&quot;https://box.kancloud.cn/10f2ec0dfb638c81b70016e7359c51ac_1914x725.png&quot; alt=&quot;&quot; /&gt;\r\n&lt;/p&gt;\r\n&lt;hr /&gt;\r\n&lt;p&gt;\r\n	这功能就有点腻害啦，是压轴滴蛤。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	咱们第一张图是 全局范围，意思就是 咱们整套系统的任何模块所有的操作记录。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	第二张图是 接口范围，意思就是 咱们接口模块所有的执行操作记录。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	至于数据列表上面的列就不介绍啦~相信能来到这里的小伙伴都可以看懂喔。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	看到全局范围 1200多页。。。会不会影响系统速度呢？\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	看看咱们执行记录的流程就知道咯\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	1.访问系统 -&amp;gt; 2.记录文件 -&amp;gt; 3.后台手动批量入库 -&amp;gt;  4.干掉已入库文件记录\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	清空日志是指软删除咱们全局范围中所有的数据库记录，全局范围包含了接口范围喔~\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	之前就说过咯，咱们所有的数据删除都是软删除，想要彻底干掉就去回收站介绍里面看看蛤。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	咱们后台功能介绍就到此为止咯，相信童鞋们已经看到OneBase的腻害之处了吧，下面咱们来看看如何研发后台功能吧。 ^_^。\r\n&lt;/p&gt;', '0', '0', '', '1512471194', '1512471194', '1');

-- ----------------------------
-- Table structure for ky_article_category
-- ----------------------------
DROP TABLE IF EXISTS `ky_article_category`;
CREATE TABLE `ky_article_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类ID',
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '分类名称',
  `describe` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '数据状态',
  `icon` char(20) NOT NULL DEFAULT '' COMMENT '分类图标',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='分类表';

-- ----------------------------
-- Records of ky_article_category
-- ----------------------------
INSERT INTO `ky_article_category` VALUES ('7', '基础', '基础内容', '1509620712', '1509620712', '1', 'fa-street-view');
INSERT INTO `ky_article_category` VALUES ('8', '后台介绍', '后台功能介绍', '1509792822', '1509792822', '1', 'fa-user');

-- ----------------------------
-- Table structure for ky_auth_group
-- ----------------------------
DROP TABLE IF EXISTS `ky_auth_group`;
CREATE TABLE `ky_auth_group` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户组id,自增主键',
  `module` varchar(20) NOT NULL DEFAULT '' COMMENT '用户组所属模块',
  `name` char(30) NOT NULL DEFAULT '' COMMENT '用户组名称',
  `describe` varchar(80) NOT NULL DEFAULT '' COMMENT '描述信息',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '用户组状态：为1正常，为0禁用,-1为删除',
  `rules` varchar(1000) NOT NULL DEFAULT '' COMMENT '用户组拥有的规则id，多个规则 , 隔开',
  `member_id` int(10) unsigned NOT NULL DEFAULT '0',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COMMENT='权限组表';

-- ----------------------------
-- Records of ky_auth_group
-- ----------------------------
INSERT INTO `ky_auth_group` VALUES ('18', '', '公墓销售人员', '公墓销售人员', '1', '263,264,265,266,278,279,1,210,68,75,98,124,125,127,208,70,71,72,73,126,69,135,136,140,156,141,142,143,151,152,203,204,205,206,207,267,268,270,271,272,269,273,274,275,276,277,16,17,134,215,216,217,219,218,214,27,32,34,35,36,128,220,221,224,225,226,223,227,228,229,233,234,235,236,239,240,241,242,244,144,145,150,153,146,147,154,148,149,280,282,283,284,285,281,157,158,159,160,161,162,163,164,165,237,238,245,246,247,249,248,250,251,252,253,254,256,257,258,255,259,260,261,262,166,168,169,170,171,174,211', '1', '1553053645', '1549954385');
INSERT INTO `ky_auth_group` VALUES ('19', '', '公墓管理人员', '公墓管理人员', '1', '1,210,263,265,266,278,280,264,279,286,287,288,289,290,282,283,284,285,281,291,267,268,270,271,272,269,273,274,275,276,277,16,17,134,215,216,217,219,218,214,222,230,231,232,27,32,34,35,36,128,220,221,224,225,226,223,227,228,229,233,234,235,236,239,240,241,242,244,237,238,245,246,247,249,248,250,251,252,253,254,256,257,258,255,259,260,261,262,68,75,98,124,125,127,208,70,71,72,73,126,69,135,136,140,156,141,142,143,151,152,203,204,205,206,207,157,158,159,160,161,162,163,164,165,144,145,150,153,146,147,154,148,149,166,168,169,170,171,174,211', '1', '1553817985', '1549954394');

-- ----------------------------
-- Table structure for ky_auth_group_access
-- ----------------------------
DROP TABLE IF EXISTS `ky_auth_group_access`;
CREATE TABLE `ky_auth_group_access` (
  `member_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `group_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '用户组id',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户组授权表';

-- ----------------------------
-- Records of ky_auth_group_access
-- ----------------------------
INSERT INTO `ky_auth_group_access` VALUES ('21', '18', '1553002613', '1553002613', '1');
INSERT INTO `ky_auth_group_access` VALUES ('21', '19', '1553002613', '1553002613', '1');

-- ----------------------------
-- Table structure for ky_blogroll
-- ----------------------------
DROP TABLE IF EXISTS `ky_blogroll`;
CREATE TABLE `ky_blogroll` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(50) NOT NULL DEFAULT '' COMMENT '链接名称',
  `img_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '链接图片封面',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '链接地址',
  `describe` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '数据状态',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='友情链接表';

-- ----------------------------
-- Records of ky_blogroll
-- ----------------------------

-- ----------------------------
-- Table structure for ky_branch
-- ----------------------------
DROP TABLE IF EXISTS `ky_branch`;
CREATE TABLE `ky_branch` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `managername` varchar(20) DEFAULT NULL,
  `office` varchar(100) DEFAULT NULL,
  `parentid` int(4) DEFAULT NULL,
  `iorder` tinyint(2) DEFAULT NULL,
  `vcdesc` text,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `create_time` int(11) NOT NULL,
  `update_time` int(11) NOT NULL,
  `module` varchar(10) DEFAULT NULL COMMENT ' ',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ky_branch
-- ----------------------------
INSERT INTO `ky_branch` VALUES ('24', '公墓销售部', '', '管理员', '长青园公墓', '0', '1', '公墓销售部', '1', '1529476468', '1549954240', 'admin');
INSERT INTO `ky_branch` VALUES ('34', '总经理', '', '', '', '0', '0', '', '1', '1536630482', '1536630482', 'admin');
INSERT INTO `ky_branch` VALUES ('35', '公墓工程部', '', '工程部负责人', '长青园公墓', '0', '0', '工程部负责人', '1', '1549954226', '1549954226', 'admin');

-- ----------------------------
-- Table structure for ky_bury
-- ----------------------------
DROP TABLE IF EXISTS `ky_bury`;
CREATE TABLE `ky_bury` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderNO` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `cid` int(11) DEFAULT NULL,
  `sellID` int(11) DEFAULT NULL,
  `vcname` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `sex` tinyint(1) DEFAULT '1',
  `age` int(2) DEFAULT NULL,
  `birth` date DEFAULT NULL,
  `death` date DEFAULT NULL,
  `bury` date DEFAULT NULL,
  `burystatus` tinyint(4) DEFAULT '0' COMMENT '安葬状态：0：未安葬，1：已经安葬',
  `operater` int(11) DEFAULT NULL,
  `operatename` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `sfz` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `filelist` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '证明材料列表',
  `sort` int(4) DEFAULT NULL,
  `burytype` int(2) DEFAULT NULL,
  `burystyle` int(2) DEFAULT NULL,
  `linkname` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `phone` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `relation` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `vcdesc` text CHARACTER SET utf8,
  `isstory` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of ky_bury
-- ----------------------------
INSERT INTO `ky_bury` VALUES ('7', 'CW20190323022858', '4', '68', '水电费', '2', '64', '1956-12-12', '2019-03-23', null, '0', '1', 'admin', '-1', '1553322538', '1553912097', '343', '', '1', null, null, '张三', '13986818455', '母女', null, '1');
INSERT INTO `ky_bury` VALUES ('8', 'CW20190323022858', '4', '68', '多福多寿', '1', '42', '1978-11-12', '2019-03-22', null, '0', '1', 'admin', '-1', '1553322538', '1553912097', '343', '', '2', null, null, '张三', '13986818455', '母女', null, '1');
INSERT INTO `ky_bury` VALUES ('9', 'CW20190323023027', '4', '69', '水电费', '2', '64', '1956-12-12', '2019-03-23', null, '0', '1', 'admin', '-1', '1553322627', '1553912097', '343', '', '1', null, null, '张三', '13986818455', '母女', null, '1');
INSERT INTO `ky_bury` VALUES ('10', 'CW20190323023027', '4', '69', '多福多寿', '1', '42', '1978-11-12', '2019-03-22', null, '0', '1', 'admin', '-1', '1553322627', '1553912097', '343', '', '2', null, null, '张三', '13986818455', '母女', null, '1');
INSERT INTO `ky_bury` VALUES ('11', 'CW20190323024630', '4', '70', '李四', '1', '93', '1927-12-12', '2019-03-15', '2019-03-15', '0', '1', 'admin', '-1', '1553323590', '1553912097', '4343', '', '1', null, null, '张三', '13986818455', '母女', null, '1');
INSERT INTO `ky_bury` VALUES ('12', 'CW20190323024630', '4', '70', '张五', '2', '0', '1938-12-12', null, null, '0', '1', 'admin', '-1', '1553323590', '1553912097', '34343', '', '2', null, null, '张三', '13986818455', '母女', null, '1');
INSERT INTO `ky_bury` VALUES ('13', 'CW20190323024854', '4', '71', '李四', '1', '93', '1927-12-12', '2019-03-15', null, '0', '1', 'admin', '-1', '1553323734', '1553912097', '4343', '', '1', null, null, '张三', '13986818455', '母女', null, '1');
INSERT INTO `ky_bury` VALUES ('14', 'CW20190323024854', '4', '71', '张五', '2', '0', '1938-12-12', null, null, '0', '1', 'admin', '-1', '1553323734', '1553912097', '34343', '', '2', null, null, '张三', '13986818455', '母女', null, '1');
INSERT INTO `ky_bury` VALUES ('15', 'CW20190323025004', '4', '72', '李四', '1', '93', '1927-12-12', '2019-03-15', '2019-03-15', '0', '1', 'admin', '-1', '1553323804', '1553912097', '4343', '', '1', null, null, '张三', '13986818455', '母女', null, '1');
INSERT INTO `ky_bury` VALUES ('16', 'CW20190323025004', '4', '72', '张五', '1', '82', '1938-12-12', '2019-03-12', null, '0', '1', 'admin', '-1', '1553323804', '1553912097', '34343', '', '2', null, null, '张三', '13986818455', '母女', null, '1');
INSERT INTO `ky_bury` VALUES ('17', 'CW20190323025132', '4', '73', '第三方的', '2', '1', '2019-03-14', '2019-03-13', '2019-03-21', '0', '1', 'admin', '-1', '1553323892', '1553912097', '3434', '', '1', null, null, '张三', '13986818455', '母女', null, '1');
INSERT INTO `ky_bury` VALUES ('18', 'CW20190323025132', '4', '73', '多福多寿', '1', '1', '2019-03-13', '2019-03-13', null, '0', '1', 'admin', '-1', '1553323892', '1553912097', '343', '', '2', null, null, '张三', '13986818455', '母女', null, '1');
INSERT INTO `ky_bury` VALUES ('19', 'CW20190323025417', '4', '74', '的大幅度发', '1', '121', '1899-12-31', '2019-03-01', null, '0', '1', 'admin', '-1', '1553324057', '1553912097', '多福多寿', '', '1', null, null, '张三', '13986818455', '母女', null, '1');
INSERT INTO `ky_bury` VALUES ('20', 'CW20190323025601', '4', '75', '水电费', '1', '38', '1982-12-23', '2019-03-06', null, '0', '1', 'admin', '-1', '1553324161', '1553912097', '似懂非43', '', '1', null, null, '张三', '13986818455', '母女', null, '1');
INSERT INTO `ky_bury` VALUES ('21', 'CW20190323025945', '4', '76', '问问', '1', '1', '2019-03-05', '2019-03-06', null, '0', '1', 'admin', '-1', '1553324385', '1553912097', '434', '', '1', null, null, '张三', '13986818455', '母女', null, '1');
INSERT INTO `ky_bury` VALUES ('22', 'CW20190323025945', '4', '76', ' ', '1', '0', null, null, null, '0', '1', 'admin', '-1', '1553324385', '1553912097', '', '', '2', null, null, '张三', '13986818455', '母女', null, '1');
INSERT INTO `ky_bury` VALUES ('23', 'CW20190323030915', '4', '77', '34', '1', '1', '2019-03-23', '2019-03-29', '2019-03-28', '0', '1', 'admin', '-1', '1553324955', '1553912097', '343', '', '1', null, null, '张三', '13986818455', '母女', null, '1');
INSERT INTO `ky_bury` VALUES ('24', 'CW20190323032835', '6', '78', '张飞11', '1', '64', '1956-03-21', '2019-03-14', '2019-03-24', '1', '1', 'admin', '-1', '1553326115', '1553675869', '334434', '', '10', null, null, '张三', '13986818455', ' ', null, '1');
INSERT INTO `ky_bury` VALUES ('25', 'CW20190323032835', '6', '78', '李四', '2', '1', '2019-03-29', '2019-03-13', '2019-03-22', '0', '1', 'admin', '-1', '1553326115', '1553675869', '334343', '', '10', null, null, '张三', '13986818455', ' ', null, '1');
INSERT INTO `ky_bury` VALUES ('26', null, '6', null, '空调采购项目', '1', '1', '2019-03-06', '2019-03-23', null, '0', '1', 'admin', '-1', '1553327590', '1553675869', '2019-03-21', '', '10', null, null, '张三', '13986818455', ' ', null, '1');
INSERT INTO `ky_bury` VALUES ('27', null, '6', null, '分督导室的', '1', '1', '2019-03-21', '2019-03-12', null, '0', '1', 'admin', '-1', '1553328173', '1553675869', '2019-03-13', '', '10', null, null, '第三方第三方', '是的发生的', ' ', null, '1');
INSERT INTO `ky_bury` VALUES ('28', null, '6', null, '的个梵蒂冈', '1', '0', '2019-03-22', null, null, '0', '1', 'admin', '-1', '1553328201', '1553675869', '', '', '10', null, null, '热同仁堂', '让他人', ' ', null, '1');
INSERT INTO `ky_bury` VALUES ('29', null, '6', null, '空调采购项目', '1', '0', null, null, null, '0', '1', 'admin', '-1', '1553328471', '1553675869', '', '', '10', null, null, '张三', '13986818455', ' ', null, '1');
INSERT INTO `ky_bury` VALUES ('30', null, '6', null, '项目名称', '1', '1', '2019-03-13', '2019-03-14', '2019-03-06', '1', '1', 'admin', '-1', '1553477884', '1553675869', '2019-03-13', '', '10', null, null, '张三', '13986818455', '似懂非懂是', null, '1');
INSERT INTO `ky_bury` VALUES ('31', 'CW20190325101300', '5', '79', '张三', '1', '64', '1956-12-13', '2019-03-26', '2019-03-27', '0', '1', 'admin', '-1', '1553479980', '1553911495', '334343', '', '1', null, null, '双方都', '13986818455', '母子', null, '1');
INSERT INTO `ky_bury` VALUES ('32', 'CW20190325101300', '5', '79', '李四', '2', '0', '1978-01-03', null, null, '0', '1', 'admin', '-1', '1553479980', '1553911495', '43434', '', '2', null, null, '双方都', '13986818455', '母子', null, '1');
INSERT INTO `ky_bury` VALUES ('33', 'CW20190325014234', '6', '80', '地方', '1', '0', null, null, null, '0', '1', 'admin', '-1', '1553492554', '1553675869', '', '', '1', null, null, '张三', '13986818455', '父子', null, '1');
INSERT INTO `ky_bury` VALUES ('34', 'CW20190325014234', '6', '80', '434', '1', '0', null, null, null, '0', '1', 'admin', '-1', '1553492554', '1553675869', '', '', '2', null, null, '张三', '13986818455', '父子', null, '1');
INSERT INTO `ky_bury` VALUES ('35', 'CW20190327083925', '7', '91', '地方所得税', '1', '8', '2012-03-27', '2019-03-25', null, '0', '1', 'admin', '1', '1553690365', null, '22', '', '1', null, null, '史蒂夫', '34343', '34343', null, '0');
INSERT INTO `ky_bury` VALUES ('36', 'CW20190327083925', '7', '91', '水电费', '2', '0', '2019-03-07', null, null, '0', '1', 'admin', '1', '1553690365', null, '34343', '', '2', null, null, '史蒂夫', '34343', '34343', null, '0');

-- ----------------------------
-- Table structure for ky_cancel
-- ----------------------------
DROP TABLE IF EXISTS `ky_cancel`;
CREATE TABLE `ky_cancel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderNO` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `tid` int(11) DEFAULT NULL,
  `oldsellid` int(11) DEFAULT NULL,
  `cid` int(10) DEFAULT NULL,
  `returndesc` varchar(500) CHARACTER SET utf8 DEFAULT NULL,
  `manager` int(11) DEFAULT NULL,
  `buyer` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `isok` tinyint(1) DEFAULT '0',
  `billprice` decimal(10,2) DEFAULT NULL,
  `returnprice` decimal(10,2) DEFAULT '0.00' COMMENT ' 退回金额',
  `readprice` decimal(10,2) DEFAULT NULL COMMENT '实际收到的金额',
  `vcnote` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `dobegindate` int(11) DEFAULT NULL,
  `operater` int(11) DEFAULT NULL,
  `operatername` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `isstory` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of ky_cancel
-- ----------------------------
INSERT INTO `ky_cancel` VALUES ('10', 'CW20190327021100', '89', '80', '6', '地方撒第三方士大夫', '21', '张三', '13986818455 ', '0', '7980.00', '0.00', '1798.00', null, null, '1', 'admin', '-1', '1553667060', '1553669113', '0');
INSERT INTO `ky_cancel` VALUES ('11', 'CW20190327024702', '90', '80', '6', '水电费水电费水电费', '21', '张三', '13986818455 ', '2', '7980.00', '0.00', '798.00', '多岁的似懂非懂是', '1553671293', '1', 'admin', '1', '1553669222', '1553671293', '0');

-- ----------------------------
-- Table structure for ky_cemetery
-- ----------------------------
DROP TABLE IF EXISTS `ky_cemetery`;
CREATE TABLE `ky_cemetery` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bwimg` longtext NOT NULL,
  `vno` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `gardenID` int(11) DEFAULT NULL,
  `areaID` int(11) DEFAULT NULL,
  `typeID` int(11) DEFAULT NULL,
  `styleID` int(11) DEFAULT NULL,
  `area` int(2) DEFAULT NULL,
  `ix` int(2) DEFAULT NULL,
  `iy` int(2) DEFAULT NULL,
  `vcdesc` text,
  `usestatus` int(1) DEFAULT '1' COMMENT '使用状态：1：待销售 2：已经预定 3:已经销售，4：人员已经安葬',
  `sellprice` decimal(10,2) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `materialprice` decimal(10,2) DEFAULT NULL,
  `buryprice` decimal(10,2) DEFAULT NULL,
  `grendprice` decimal(10,2) DEFAULT NULL,
  `otherprice` decimal(10,2) DEFAULT NULL,
  `status` tinyint(4) DEFAULT '1' COMMENT '1可用 0禁用',
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `cimage` int(10) DEFAULT NULL,
  `orientation` varchar(100) DEFAULT NULL,
  `monumenhtml` longtext,
  `monumenhtml_b` longtext,
  `expiredate` date DEFAULT NULL,
  `monumentype` int(4) DEFAULT NULL,
  `monumenstyle` int(4) DEFAULT NULL,
  `monumendate` date DEFAULT NULL,
  `monumenno` varchar(50) DEFAULT NULL COMMENT '碑文的订单编号',
  `monumename` varchar(255) DEFAULT NULL COMMENT '墓主的字符串',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of ky_cemetery
-- ----------------------------
INSERT INTO `ky_cemetery` VALUES ('1', '', '4444', '呜呜呜呜测试测试', '3', '24', '4', '1', '122', '4', '23', '风景41212水电费收到分', '1', null, '12655.00', '54114.00', '31101.00', '5211.00', null, '1', '1550299354', '1552890400', '195', '南', '', '', null, null, null, null, null, null);
INSERT INTO `ky_cemetery` VALUES ('2', '', '多少', '第三方 ', '3', '20', '4', '2', '121', '2', '3', '打法师大发', '1', null, '1212.00', '1542.00', '52412.00', '412412.00', null, '-1', '1550300718', '1550300731', '0', '南', '', '', null, null, null, null, null, null);
INSERT INTO `ky_cemetery` VALUES ('3', '', 'dfw', 'weee', '2', '12', '2', '2', '12', '1', '2', '十几个思考几个', '4', null, '121540.00', '1245.00', '2141.00', '254.00', null, '1', '1552616400', '1553175782', '196', '北', '', '', null, '1', '1', null, null, null);
INSERT INTO `ky_cemetery` VALUES ('4', '', null, '紫薇园DFSFSF 1-1', '2', '25', '3', '4', '526345', '1', '1', '大发不是对方', '5', null, '1212.00', '1212.00', '1212.00', '1212.00', null, '1', '1550309266', '1553912097', '0', '南', '', '', '2039-03-23', null, null, null, null, null);
INSERT INTO `ky_cemetery` VALUES ('5', '', null, '紫薇园DFSFSF2-1', '2', '25', '3', '4', '526345', '2', '1', '大发不是对方', '5', null, '1212.00', '1212.00', '1212.00', '1212.00', null, '1', '1550309266', '1553911495', '0', '南', '', '', '2039-03-25', null, null, null, null, null);
INSERT INTO `ky_cemetery` VALUES ('6', '', null, '生态园花坛葬三区1-1', '3', '19', '2', '2', '12454', '1', '1', '防守打法', '1', null, '1244114.00', '4421.00', '45452.00', '1454.00', null, '1', '1550450921', '1553675869', '0', '南', '', '', null, '1', '1', '2019-03-26', 'BW20190326082219', '');
INSERT INTO `ky_cemetery` VALUES ('7', '', null, '生态园花坛葬三区1-2', '3', '19', '1', '2', '12454', '1', '2', '防守打法', '1', null, '1244114.00', '4421.00', '45452.00', '1454.00', null, '1', '1550450921', '1553690365', '0', '南', '', '', '2039-03-27', null, null, null, null, null);
INSERT INTO `ky_cemetery` VALUES ('8', '', null, '生态园花坛葬三区2-1', '3', '19', '1', '2', '12454', '2', '1', '防守打法', '1', null, '1244114.00', '4421.00', '45452.00', '1454.00', null, '1', '1550450921', '1552887436', '0', '南', '', '', null, null, null, null, null, null);
INSERT INTO `ky_cemetery` VALUES ('9', '', null, '生态园花坛葬三区2-2', '3', '19', '1', '2', '12454', '2', '2', '防守打法', '1', null, '1244114.00', '4421.00', '45452.00', '1454.00', null, '1', '1550450921', null, '0', '南', '', '', null, null, null, null, null, null);
INSERT INTO `ky_cemetery` VALUES ('10', '', null, '生态园花坛葬三区3-1', '3', '19', '1', '2', '12454', '3', '1', '防守打法', '1', null, '1244114.00', '4421.00', '45452.00', '1454.00', null, '1', '1550450921', '1551496350', '0', '南', '', '', null, null, null, null, null, null);
INSERT INTO `ky_cemetery` VALUES ('11', '', null, '生态园花坛葬三区3-2', '3', '19', '1', '2', '12454', '3', '2', '防守打法', '2', null, '1244114.00', '4421.00', '45452.00', '1454.00', null, '1', '1550450921', '1553325745', '0', '南', '', '', null, null, null, null, null, null);
INSERT INTO `ky_cemetery` VALUES ('12', '', null, '生态园花坛葬三区1-1', '3', '19', '1', '2', '12454', '1', '1', '防守打法', '1', null, '1244114.00', '4421.00', '45452.00', '1454.00', null, '1', '1550450928', null, '0', '南', '', '', null, null, null, null, null, null);
INSERT INTO `ky_cemetery` VALUES ('13', '', null, '生态园花坛葬三区1-2', '3', '19', '1', '2', '12454', '1', '2', '防守打法', '2', null, '1244114.00', '4421.00', '45452.00', '1454.00', null, '1', '1550450928', '1553328299', '0', '南', '', '', null, null, null, null, null, null);
INSERT INTO `ky_cemetery` VALUES ('14', '', null, '生态园花坛葬三区2-1', '3', '19', '1', '2', '12454', '2', '1', '防守打法', '1', null, '1244114.00', '4421.00', '45452.00', '1454.00', null, '1', '1550450928', null, '0', '南', '', '', null, null, null, null, null, null);
INSERT INTO `ky_cemetery` VALUES ('15', '', null, '生态园花坛葬三区2-2', '3', '19', '1', '2', '12454', '2', '2', '防守打法', '1', null, '1244114.00', '4421.00', '45452.00', '1454.00', null, '1', '1550450928', null, '0', '南', '', '', null, null, null, null, null, null);
INSERT INTO `ky_cemetery` VALUES ('16', '', null, '生态园花坛葬三区3-1', '3', '19', '1', '2', '12454', '3', '1', '防守打法', '2', null, '1244114.00', '4421.00', '45452.00', '1454.00', null, '1', '1550450928', '1553328266', '0', '南', '', '', null, null, null, null, null, null);
INSERT INTO `ky_cemetery` VALUES ('17', '', null, '生态园花坛葬三区3-2', '3', '19', '1', '2', '12454', '3', '2', '防守打法', '1', null, '1244114.00', '4421.00', '45452.00', '1454.00', null, '1', '1550450928', null, '0', '南', '', '', null, null, null, null, null, null);
INSERT INTO `ky_cemetery` VALUES ('18', '', null, '生态园花坛葬三区1-1', '3', '19', '1', '2', '12454', '1', '1', '防守打法', '2', null, '1244114.00', '4421.00', '45452.00', '1454.00', null, '1', '1550451838', '1553328244', '0', '南', '', '', null, null, null, null, null, null);
INSERT INTO `ky_cemetery` VALUES ('19', '', null, '生态园花坛葬三区1-2', '3', '19', '1', '2', '12454', '1', '2', '防守打法', '1', null, '1244114.00', '4421.00', '45452.00', '1454.00', null, '1', '1550451838', null, '0', '南', '', '', null, null, null, null, null, null);
INSERT INTO `ky_cemetery` VALUES ('20', '', null, '生态园花坛葬三区2-1', '3', '19', '1', '2', '12454', '2', '1', '防守打法', '1', null, '1244114.00', '4421.00', '45452.00', '1454.00', null, '1', '1550451838', null, '0', '南', '', '', null, null, null, null, null, null);
INSERT INTO `ky_cemetery` VALUES ('21', '', null, '生态园花坛葬三区2-2', '3', '19', '1', '2', '12454', '2', '2', '防守打法', '1', null, '1244114.00', '4421.00', '45452.00', '1454.00', null, '1', '1550451838', null, '0', '南', '', '', null, null, null, null, null, null);
INSERT INTO `ky_cemetery` VALUES ('22', '', null, '生态园花坛葬三区3-1', '3', '19', '1', '2', '12454', '3', '1', '防守打法', '1', null, '1244114.00', '4421.00', '45452.00', '1454.00', null, '1', '1550451838', null, '0', '南', '', '', null, null, null, null, null, null);
INSERT INTO `ky_cemetery` VALUES ('23', '', null, '生态园花坛葬三区3-2', '3', '19', '1', '2', '12454', '3', '2', '防守打法', '1', null, '1244114.00', '4421.00', '45452.00', '1454.00', null, '1', '1550451838', null, '0', '南', '', '', null, null, null, null, null, null);
INSERT INTO `ky_cemetery` VALUES ('24', '', null, '生态园花坛葬三区1-1', '3', '19', '1', '2', '12454', '1', '1', '防守打法', '1', null, '1244114.00', '4421.00', '45452.00', '1454.00', null, '1', '1550452119', null, '0', '南', '', '', null, null, null, null, null, null);
INSERT INTO `ky_cemetery` VALUES ('25', '', null, '生态园花坛葬三区1-2', '3', '19', '1', '2', '12454', '1', '2', '防守打法', '1', null, '1244114.00', '4421.00', '45452.00', '1454.00', null, '1', '1550452119', null, '0', '南', '', '', null, null, null, null, null, null);
INSERT INTO `ky_cemetery` VALUES ('26', '', null, '生态园花坛葬三区2-1', '3', '19', '1', '2', '12454', '2', '1', '防守打法', '1', null, '1244114.00', '4421.00', '45452.00', '1454.00', null, '1', '1550452119', null, '0', '南', '', '', null, null, null, null, null, null);
INSERT INTO `ky_cemetery` VALUES ('27', '', null, '生态园花坛葬三区2-2', '3', '19', '1', '2', '12454', '2', '2', '防守打法', '1', null, '1244114.00', '4421.00', '45452.00', '1454.00', null, '1', '1550452119', null, '0', '南', '', '', null, null, null, null, null, null);
INSERT INTO `ky_cemetery` VALUES ('28', '', null, '生态园花坛葬三区3-1', '3', '19', '1', '2', '12454', '3', '1', '防守打法', '1', null, '1244114.00', '4421.00', '45452.00', '1454.00', null, '1', '1550452119', null, '0', '南', '', '', null, null, null, null, null, null);
INSERT INTO `ky_cemetery` VALUES ('29', '', null, '生态园花坛葬三区3-2', '3', '19', '1', '2', '12454', '3', '2', '防守打法', '1', null, '1244114.00', '4421.00', '45452.00', '1454.00', null, '1', '1550452119', null, '0', '南', '', '', null, null, null, null, null, null);
INSERT INTO `ky_cemetery` VALUES ('30', '', null, '生态园花坛葬四区 1-1', '3', '20', '3', '4', '1111', '1', '1', '', '1', null, '1242.00', '12323.00', '1212.00', '1212.00', null, '1', '1550452822', null, '0', 'fdf', '', '', null, null, null, null, null, null);
INSERT INTO `ky_cemetery` VALUES ('31', '', null, '生态园花坛葬四区 1-2', '3', '20', '3', '4', '1111', '1', '2', '', '1', null, '1242.00', '12323.00', '1212.00', '1212.00', null, '1', '1550452822', null, '0', 'fdf', '', '', null, null, null, null, null, null);
INSERT INTO `ky_cemetery` VALUES ('32', '', null, '生态园花坛葬四区 1-3', '3', '20', '3', '4', '1111', '1', '3', '', '1', null, '1242.00', '12323.00', '1212.00', '1212.00', null, '1', '1550452822', null, '0', 'fdf', '', '', null, null, null, null, null, null);
INSERT INTO `ky_cemetery` VALUES ('33', '', null, '生态园花坛葬四区2-1', '3', '20', '3', '4', '1111', '2', '1', '', '1', null, '1242.00', '12323.00', '1212.00', '1212.00', null, '1', '1550452822', null, '0', 'fdf', '', '', null, null, null, null, null, null);
INSERT INTO `ky_cemetery` VALUES ('34', '', null, '生态园花坛葬四区2-2', '3', '20', '3', '4', '1111', '2', '2', '', '1', null, '1242.00', '12323.00', '1212.00', '1212.00', null, '1', '1550452822', null, '0', 'fdf', '', '', null, null, null, null, null, null);
INSERT INTO `ky_cemetery` VALUES ('35', '', null, '生态园花坛葬四区2-3', '3', '20', '3', '4', '1111', '2', '3', '', '1', null, '1242.00', '12323.00', '1212.00', '1212.00', null, '1', '1550452822', null, '0', 'fdf', '', '', null, null, null, null, null, null);
INSERT INTO `ky_cemetery` VALUES ('36', '', null, '生态园花坛葬四区 1-1', '3', '20', '3', '4', '1111', '1', '1', '', '1', null, '1242.00', '12323.00', '1212.00', '1212.00', null, '1', '1550452863', null, '0', 'fdf', '', '', null, null, null, null, null, null);
INSERT INTO `ky_cemetery` VALUES ('37', '', null, '生态园花坛葬四区 1-2', '3', '20', '3', '4', '1111', '1', '2', '', '1', null, '1242.00', '12323.00', '1212.00', '1212.00', null, '1', '1550452863', null, '0', 'fdf', '', '', null, null, null, null, null, null);
INSERT INTO `ky_cemetery` VALUES ('38', '', null, '生态园花坛葬四区 1-3', '3', '20', '3', '4', '1111', '1', '3', '', '1', null, '1242.00', '12323.00', '1212.00', '1212.00', null, '1', '1550452863', null, '0', 'fdf', '', '', null, null, null, null, null, null);
INSERT INTO `ky_cemetery` VALUES ('39', '', null, '生态园花坛葬四区2-1', '3', '20', '3', '4', '1111', '2', '1', '', '1', null, '1242.00', '12323.00', '1212.00', '1212.00', null, '1', '1550452863', null, '0', 'fdf', '', '', null, null, null, null, null, null);
INSERT INTO `ky_cemetery` VALUES ('40', '', null, '生态园花坛葬四区2-2', '3', '20', '3', '4', '1111', '2', '2', '', '1', null, '1242.00', '12323.00', '1212.00', '1212.00', null, '1', '1550452863', null, '0', 'fdf', '', '', null, null, null, null, null, null);
INSERT INTO `ky_cemetery` VALUES ('41', '', null, '生态园花坛葬四区2-3', '3', '20', '3', '4', '1111', '2', '3', '', '1', null, '1242.00', '12323.00', '1212.00', '1212.00', null, '1', '1550452863', null, '0', 'fdf', '', '', null, null, null, null, null, null);
INSERT INTO `ky_cemetery` VALUES ('42', '', null, '生态园地方撒 1-1', '3', '24', '3', '3', '11', '1', '1', 'dsfsddsfds', '1', null, '222.00', '0.00', '0.00', '0.00', null, '1', '1550452992', '1553152277', '0', '11', '', '', null, null, null, null, null, null);
INSERT INTO `ky_cemetery` VALUES ('43', '', null, '生态园地方撒 1-2', '3', '24', '3', '3', '11', '1', '2', 'dsfsddsfds', '1', null, '222.00', '0.00', '0.00', '0.00', null, '1', '1550452992', null, '0', '11', '', '', null, null, null, null, null, null);
INSERT INTO `ky_cemetery` VALUES ('44', '', null, '生态园地方撒 1-3', '3', '24', '3', '3', '11', '1', '3', 'dsfsddsfds', '1', null, '222.00', '0.00', '0.00', '0.00', null, '1', '1550452992', null, '0', '11', '', '', null, null, null, null, null, null);
INSERT INTO `ky_cemetery` VALUES ('45', '', null, '生态园地方撒 1-4', '3', '24', '3', '3', '11', '1', '4', 'dsfsddsfds', '1', null, '222.00', '0.00', '0.00', '0.00', null, '1', '1550452992', null, '0', '11', '', '', null, null, null, null, null, null);
INSERT INTO `ky_cemetery` VALUES ('46', '', null, '生态园地方撒2-1', '3', '24', '3', '3', '11', '2', '1', 'dsfsddsfds', '1', null, '222.00', '0.00', '0.00', '0.00', null, '1', '1550452992', null, '0', '11', '', '', null, null, null, null, null, null);
INSERT INTO `ky_cemetery` VALUES ('47', '', null, '生态园地方撒2-2', '3', '24', '3', '3', '11', '2', '2', 'dsfsddsfds', '1', null, '222.00', '0.00', '0.00', '0.00', null, '1', '1550452992', null, '0', '11', '', '', null, null, null, null, null, null);
INSERT INTO `ky_cemetery` VALUES ('48', '', null, '生态园地方撒2-3', '3', '24', '3', '3', '11', '2', '3', 'dsfsddsfds', '1', null, '222.00', '0.00', '0.00', '0.00', null, '1', '1550452992', null, '0', '11', '', '', null, null, null, null, null, null);
INSERT INTO `ky_cemetery` VALUES ('49', '', null, '生态园地方撒2-4', '3', '24', '3', '3', '11', '2', '4', 'dsfsddsfds', '1', null, '222.00', '0.00', '0.00', '0.00', null, '1', '1550452992', null, '0', '11', '', '', null, null, null, null, null, null);

-- ----------------------------
-- Table structure for ky_cemetery_area
-- ----------------------------
DROP TABLE IF EXISTS `ky_cemetery_area`;
CREATE TABLE `ky_cemetery_area` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gardenID` int(11) DEFAULT NULL,
  `vno` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `vcdesc` text,
  `status` tinyint(4) DEFAULT '1' COMMENT '1可用 0禁用',
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `cimage` varchar(255) DEFAULT NULL,
  `vitrotype` varchar(255) DEFAULT NULL COMMENT '瓷像规格',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ky_cemetery_area
-- ----------------------------
INSERT INTO `ky_cemetery_area` VALUES ('1', '1', '', '十五区', '豪华尊贵', '-1', '1532156621', '1545277189', '71', null);
INSERT INTO `ky_cemetery_area` VALUES ('2', '1', '', '一区', '简洁明快', '1', '1532156646', '1541990017', '64', null);
INSERT INTO `ky_cemetery_area` VALUES ('3', '1', '', '三区', '', '1', '1532156958', '1546054022', '65', '6寸椭圆瓷像彩色:300、5寸椭圆瓷像彩色:200');
INSERT INTO `ky_cemetery_area` VALUES ('4', '1', '', '范德萨的', '似懂非懂是', '-1', '1533111033', '1533171345', '15', null);
INSERT INTO `ky_cemetery_area` VALUES ('5', '1', '', '二区', '惠民经济', '1', '1533171507', '1541989994', '66', null);
INSERT INTO `ky_cemetery_area` VALUES ('6', '1', '', '十六区', '庄重典范', '1', '1534040424', '1541989979', '67', null);
INSERT INTO `ky_cemetery_area` VALUES ('7', '1', '', '十区', '典雅秀美', '1', '1534040598', '1541989966', '62', null);
INSERT INTO `ky_cemetery_area` VALUES ('8', '1', '', '七区', '简洁明快', '1', '1534040656', '1541989951', '60', null);
INSERT INTO `ky_cemetery_area` VALUES ('9', '1', '', '八区', '清朗范逸', '1', '1534040694', '1541989940', '68', null);
INSERT INTO `ky_cemetery_area` VALUES ('10', '2', '', '八区', '', '1', '1534081861', '1545281695', '79', null);
INSERT INTO `ky_cemetery_area` VALUES ('11', '2', '', '七区', '', '1', '1534081895', '1545281677', '78', null);
INSERT INTO `ky_cemetery_area` VALUES ('12', '2', '', '十二区', '', '1', '1534082193', '1541989897', '61', null);
INSERT INTO `ky_cemetery_area` VALUES ('13', '1', '', '九区', '', '1', '1534145076', '1541989888', '59', null);
INSERT INTO `ky_cemetery_area` VALUES ('14', '1', '', '艺术墓', '', '1', '1536561129', '1541989878', '63', null);
INSERT INTO `ky_cemetery_area` VALUES ('15', '3', '', '花坛葬二区', '', '1', '1536561168', '1541989868', '56', null);
INSERT INTO `ky_cemetery_area` VALUES ('16', '3', '', '草坪葬', '', '1', '1536561183', '1541989851', '54', null);
INSERT INTO `ky_cemetery_area` VALUES ('17', '3', '', '桂花树葬', '', '1', '1536561198', '1541989838', '55', null);
INSERT INTO `ky_cemetery_area` VALUES ('18', '3', '', '花葬', '', '1', '1536561212', '1541989823', '58', null);
INSERT INTO `ky_cemetery_area` VALUES ('19', '3', '', '花坛葬三区', '', '1', '1536562865', '1541989809', '57', null);
INSERT INTO `ky_cemetery_area` VALUES ('20', '3', '', '花坛葬四区', '', '1', '1536562883', '1546054064', '70', '4寸椭圆瓷像彩色:200、3寸椭圆瓷像彩色:150');
INSERT INTO `ky_cemetery_area` VALUES ('21', '1', '', '数据测试区', '数据测试区', '-1', '1538228016', '1541652466', '52', null);
INSERT INTO `ky_cemetery_area` VALUES ('22', '1', '', '十二区', '', '1', '1541652514', '1545270178', '73', null);
INSERT INTO `ky_cemetery_area` VALUES ('23', '1', '', '十五区', '豪华尊贵', '1', '1545277402', '1545708937', '77', '6寸椭圆瓷像彩色:300、5寸椭圆瓷像彩色:200');
INSERT INTO `ky_cemetery_area` VALUES ('24', '3', '323', '地方撒', '的单打独斗', '1', '1550132158', '1550132807', null, null);
INSERT INTO `ky_cemetery_area` VALUES ('25', '2', '212', 'DFSFSF', 'DFSFSFSFSFS', '-1', '1550132229', '1550132880', null, null);
INSERT INTO `ky_cemetery_area` VALUES ('26', '3', '113', 'SFFDF', '世界各地', '1', '1550132358', '1550132358', null, null);
INSERT INTO `ky_cemetery_area` VALUES ('27', '2', '121', '打三分是', '打的', '1', '1550132509', '1550132509', null, null);

-- ----------------------------
-- Table structure for ky_cemetery_garden
-- ----------------------------
DROP TABLE IF EXISTS `ky_cemetery_garden`;
CREATE TABLE `ky_cemetery_garden` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vno` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `companyID` int(4) NOT NULL,
  `vcdesc` text NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1可用 0禁用',
  `create_time` int(11) NOT NULL,
  `update_time` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `vname` (`name`) USING BTREE,
  UNIQUE KEY `vno` (`vno`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ky_cemetery_garden
-- ----------------------------
INSERT INTO `ky_cemetery_garden` VALUES ('1', '001', '玫瑰园', '1', '艺术墓', '1', '1532156577', '1536561053');
INSERT INTO `ky_cemetery_garden` VALUES ('2', '2', '紫薇园', '1', '紫薇园', '1', '1534038402', '1536561029');
INSERT INTO `ky_cemetery_garden` VALUES ('3', '', '生态园', '1', '花坛葬二区\r\n花坛葬三区\r\n花坛葬四区\r\n草坪葬\r\n桂花树葬\r\n花葬', '1', '1536561005', '1536562819');
INSERT INTO `ky_cemetery_garden` VALUES ('6', '34343', ' 发送到发送到', '1', '水电费的说法', '-1', '1550046291', '1550050299');

-- ----------------------------
-- Table structure for ky_cemetery_style
-- ----------------------------
DROP TABLE IF EXISTS `ky_cemetery_style`;
CREATE TABLE `ky_cemetery_style` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vno` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `vcdesc` text,
  `status` tinyint(4) DEFAULT '1' COMMENT '1可用 0禁用',
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ky_cemetery_style
-- ----------------------------
INSERT INTO `ky_cemetery_style` VALUES ('1', null, '花岗石', '花岗石', '1', '1532158595', '1533189343');
INSERT INTO `ky_cemetery_style` VALUES ('2', null, '山西黑', '山西黑', '1', '1534041081', '1534041081');
INSERT INTO `ky_cemetery_style` VALUES ('3', null, '印度红', '印度好', '1', '1536561638', '1536561638');
INSERT INTO `ky_cemetery_style` VALUES ('4', null, '中国红', '中国红', '1', '1550213549', '1550213613');
INSERT INTO `ky_cemetery_style` VALUES ('5', null, '十多个十多个', '打法师收到复试', '-1', '1550213648', '1550213660');

-- ----------------------------
-- Table structure for ky_cemetery_type
-- ----------------------------
DROP TABLE IF EXISTS `ky_cemetery_type`;
CREATE TABLE `ky_cemetery_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `hrm` int(11) DEFAULT '0',
  `vcdesc` text,
  `status` tinyint(4) DEFAULT '1' COMMENT '1可用 0禁用',
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ky_cemetery_type
-- ----------------------------
INSERT INTO `ky_cemetery_type` VALUES ('1', '单穴', '1', '', '1', '1532158498', '1532158498');
INSERT INTO `ky_cemetery_type` VALUES ('2', '双穴', '2', '', '1', '1532158518', '1532158518');
INSERT INTO `ky_cemetery_type` VALUES ('3', '三穴', '3', '', '1', '1532158544', '1532158544');

-- ----------------------------
-- Table structure for ky_chargeitem
-- ----------------------------
DROP TABLE IF EXISTS `ky_chargeitem`;
CREATE TABLE `ky_chargeitem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `sort` int(4) DEFAULT '0' COMMENT '排序',
  `showtype` tinyint(1) DEFAULT NULL COMMENT '显示类型',
  `defaultprice` decimal(10,1) DEFAULT NULL,
  `value` text,
  `publictype` tinyint(1) DEFAULT NULL,
  `areaname` varchar(255) DEFAULT NULL,
  `area` varchar(255) DEFAULT '0',
  `stylename` varchar(255) DEFAULT NULL,
  `style` varchar(255) DEFAULT NULL,
  `vcnote` text COMMENT '描述',
  `status` tinyint(4) DEFAULT '1',
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `issystem` tinyint(1) DEFAULT '0',
  `financetype` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `state` (`status`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of ky_chargeitem
-- ----------------------------
INSERT INTO `ky_chargeitem` VALUES ('1', '寄存费', '1', '1', '100.0', '', '0', '', '0', '', '', '寄存收费，系统保留，无法删除，只能修改', '1', '1550480835', '1551678811', '1', '2');
INSERT INTO `ky_chargeitem` VALUES ('2', '墓位费', '10', '2', '7980.0', '7980.00:墓穴（低保）-- 7980.00\r\n16800.00:墓穴-- 16800.00\r\n9800.00:墓穴(待建)--9800.00\r\n14800.00:墓穴--14800.00', '1', '八区,七区,十二区,打三分是', '10,11,12,27', '花岗石,山西黑', '1,2', '', '1', '1550542121', '1552719303', '1', ',1,');
INSERT INTO `ky_chargeitem` VALUES ('3', '绿化维护', '12', '1', '0.0', '', null, null, '0', null, null, '', '1', '1552099418', '1553568985', '0', ',3,');
INSERT INTO `ky_chargeitem` VALUES ('4', '管理费', '10', '2', '200.0', '200:10年管理费\r\n300:20年管理费', null, null, '0', null, null, '', '1', '1552099880', '1552728734', '0', ',1,4,');
INSERT INTO `ky_chargeitem` VALUES ('5', '墓证费', '10', '1', '0.0', '', null, null, '0', null, null, '', '1', '1552099996', '1552719341', '0', ',1,4,');
INSERT INTO `ky_chargeitem` VALUES ('6', '安葬礼仪', '9', '1', '0.0', '', null, null, '0', null, null, '', '1', '1552717874', '1553568885', '0', ',3,');
INSERT INTO `ky_chargeitem` VALUES ('7', '锣鼓乐队', '9', '1', '0.0', '', null, null, '0', null, null, '', '1', '1552718867', '1553568946', '0', ',3,');
INSERT INTO `ky_chargeitem` VALUES ('8', '变更补交', '10', '1', '0.0', '', null, null, '0', null, null, '', '1', '1552974433', '1552974563', '0', ',5,');
INSERT INTO `ky_chargeitem` VALUES ('9', '退墓手续费', '10', '1', '0.0', '', null, null, '0', null, null, '', '1', '1552987509', '1553663535', '1', ',6,');
INSERT INTO `ky_chargeitem` VALUES ('10', '点灯收费', '10', '1', '100.0', '', null, null, '0', null, null, '这个必须是单价', '1', '1553132172', '1553132172', '1', ',7,');
INSERT INTO `ky_chargeitem` VALUES ('12', '迁坟', '1', '1', '0.0', '', null, null, '0', null, null, '', '1', '1553568469', '1553568494', '0', ',3,');
INSERT INTO `ky_chargeitem` VALUES ('17', '彩色合照烤瓷 ', '7', '1', '0.0', '', null, null, '0', null, null, '', '1', '1553568812', '1553568812', '0', ',3,');
INSERT INTO `ky_chargeitem` VALUES ('13', '墓穴维修', '3', '1', '0.0', '', null, null, '0', null, null, '', '1', '1553568546', '1553568546', '0', ',3,');
INSERT INTO `ky_chargeitem` VALUES ('14', '单张黑白烤瓷', '1', '1', '0.0', '', null, null, '0', null, null, '', '1', '1553568567', '1553653001', '0', ',3,8,');
INSERT INTO `ky_chargeitem` VALUES ('15', '单张彩色烤瓷 ', '5', '1', '0.0', '', null, null, '0', null, null, '', '1', '1553568593', '1553653048', '0', ',3,8,');
INSERT INTO `ky_chargeitem` VALUES ('16', '黑白合照烤瓷', '6', '1', '0.0', '', null, null, '0', null, null, '', '1', '1553568624', '1553653101', '0', ',3,8,');
INSERT INTO `ky_chargeitem` VALUES ('18', '瓷像安装', '10', '1', '0.0', '', null, null, '0', null, null, '', '1', '1553568831', '1553653023', '0', ',3,8,');
INSERT INTO `ky_chargeitem` VALUES ('20', '骨灰坛', '10', '1', '0.0', '', null, null, '0', null, null, '', '1', '1553569042', '1553569042', '0', ',3,');

-- ----------------------------
-- Table structure for ky_combo
-- ----------------------------
DROP TABLE IF EXISTS `ky_combo`;
CREATE TABLE `ky_combo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `sort` int(4) DEFAULT '0' COMMENT '排序',
  `service` varchar(100) DEFAULT NULL COMMENT '关联服务',
  `servicename` varchar(400) DEFAULT NULL,
  `vcnote` text COMMENT '描述',
  `status` tinyint(4) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `state` (`status`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of ky_combo
-- ----------------------------
INSERT INTO `ky_combo` VALUES ('5', '的冯绍峰', '330.00', '4', '33', null, '方法', '1', '1550301946', '1550304942');
INSERT INTO `ky_combo` VALUES ('6', 'dsdfds', '343.00', '0', '18,10', '十五点灯,三十点灯', '343434', '1', '1550319447', '1550319812');

-- ----------------------------
-- Table structure for ky_company
-- ----------------------------
DROP TABLE IF EXISTS `ky_company`;
CREATE TABLE `ky_company` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `vcdesc` text,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `create_time` int(11) NOT NULL,
  `update_time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ky_company
-- ----------------------------

-- ----------------------------
-- Table structure for ky_config
-- ----------------------------
DROP TABLE IF EXISTS `ky_config`;
CREATE TABLE `ky_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '配置ID',
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '配置名称',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '配置类型',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '配置标题',
  `group` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '配置分组',
  `extra` varchar(255) NOT NULL DEFAULT '' COMMENT '配置选项',
  `describe` varchar(255) NOT NULL DEFAULT '' COMMENT '配置说明',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态',
  `value` text NOT NULL COMMENT '配置值',
  `sort` smallint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_name` (`name`),
  KEY `type` (`type`),
  KEY `group` (`group`)
) ENGINE=InnoDB AUTO_INCREMENT=119 DEFAULT CHARSET=utf8 COMMENT='配置表';

-- ----------------------------
-- Records of ky_config
-- ----------------------------
INSERT INTO `ky_config` VALUES ('1', 'seo_title', '1', '网站标题', '1', '', '网站标题前台显示标题，优先级低于SEO模块', '1378898976', '1547273321', '1', '窑湾公墓管理程序', '3');
INSERT INTO `ky_config` VALUES ('2', 'seo_description', '2', '网站描述', '1', '', '网站搜索引擎描述，优先级低于SEO模块', '1378898976', '1547273321', '1', '窑湾|公墓', '100');
INSERT INTO `ky_config` VALUES ('3', 'seo_keywords', '2', '网站关键字', '1', '', '网站搜索引擎关键字，优先级低于SEO模块', '1378898976', '1547273321', '1', '公墓', '99');
INSERT INTO `ky_config` VALUES ('9', 'config_type_list', '3', '配置类型列表', '3', '', '主要用于数据解析和页面表单的生成', '1378898976', '1553154322', '1', '0:数字\r\n1:字符\r\n2:文本\r\n3:数组\r\n4:枚举\r\n5:图片\r\n6:文件\r\n7:富文本\r\n8:单选\r\n9:多选\r\n10:日期\r\n11:时间\r\n12:颜色', '100');
INSERT INTO `ky_config` VALUES ('20', 'config_group_list', '3', '配置分组', '3', '', '配置分组', '1379228036', '1553154322', '1', '1:基础\r\n2:数据\r\n3:系统\r\n4:API', '100');
INSERT INTO `ky_config` VALUES ('25', 'list_rows', '0', '每页数据记录数', '3', '', '数据每页显示记录数', '1379503896', '1553154322', '1', '15', '10');
INSERT INTO `ky_config` VALUES ('29', 'data_backup_part_size', '0', '数据库备份卷大小', '3', '', '该值用于限制压缩后的分卷最大长度。单位：B', '1381482488', '1553154322', '1', '52428800', '7');
INSERT INTO `ky_config` VALUES ('30', 'data_backup_compress', '4', '数据库备份文件是否启用压缩', '3', '0:不压缩\r\n1:启用压缩', '压缩备份文件需要PHP环境支持gzopen,gzwrite函数', '1381713345', '1553154322', '1', '1', '9');
INSERT INTO `ky_config` VALUES ('31', 'data_backup_compress_level', '4', '数据库备份文件压缩级别', '3', '1:普通\r\n4:一般\r\n9:最高', '数据库备份文件的压缩级别，该配置在开启压缩时生效', '1381713408', '1553154322', '1', '9', '10');
INSERT INTO `ky_config` VALUES ('33', 'allow_url', '3', '不受权限验证的url', '3', '', '', '1386644047', '1553843943', '1', '0:file/pictureupload\r\n1:addon/execute\r\n2:sell/getArea\r\n3:sell/getCemetery\r\n4:sell/getCemeteryList\r\n5:sell/printinform_add_ajax\r\n6:sell/php_insert_session\r\n7:CemeteryGarden/cemeteryGardenAdd_ajax_submit\r\n8:CemeteryGarden/cemeteryGardenedit_ajax_submit\r\n9:Grade/select_Grade_ajax\r\n10:CemeteryType/cemeteryTypeAdd_ajax_submit\r\n11:CemeteryType/cemeteryTypeedit_ajax_submit\r\n12:CemeteryArea/cemeteryAreaAdd_ajax_submit\r\n13:CemeteryArea/cemeteryAreaedit_ajax_submit\r\n14:CemeteryStyle/cemeteryStyleAdd_ajax_submit\r\n15:CemeteryStyle/cemeteryStyleedit_ajax_submit\r\n16:Serviceinfo/ServiceinfoAdd_ajax_submit\r\n17:Serviceinfo/ServiceinfoEdit_ajax_submit\r\n18:Serviceinfo/select_Serviceinfo_ajax\r\n19:Combo/ComboAdd_ajax_submit\r\n20:Combo/Comboedit_ajax_submit\r\n21:Chargeitem/ChargeitemAdd_ajax_submit\r\n22:Chargeitem/Chargeitemedit_ajax_submit\r\n23:CemeteryArea/select_CemeteryArea_ajax\r\n24:CemeteryStyle/CemeteryStyle/select_style_ajax\r\n25:Chargeitem/Chargeitemedit_ajax_submit\r\n26:Invoice/InvoiceAdd_ajax_submit\r\n27:Invoice/Invoiceedit_ajax_submit\r\n28:Schedule/Schedule_submit_ajax\r\n29:Schedule/Schedule_delete_ajax\r\n30:Savearea/SaveareaAdd_ajax_submit\r\n31:Savearea/Saveareaedit_ajax_submit\r\n32:Save/Save_submit_ajax\r\n33:Cemetery/getCemeteryList_ajax\r\n34:Sell/Sell_bill_show\r\n35:Cancel/show_Cancel_ajax\r\n36:Cancel/Cancel_submit_ajax\r\n37:Cancel/canacel_cl_ajax\r\n38:Archives/Archives_show_ajax\r\n39:Bury/deather_sumit_ajax\r\n40:Sellchang/Chang_submit\r\n41:Light/Light_submit_ajax\r\n42:Archives/Linkman_delete_ajax\r\n43:Schedule/ScheduleList_ajax\r\n44:Sell/deather_update_burystate\r\n45:Sell/Sell_pay_ajax\r\n46:Buryservice/BuryserviceList_ajax\r\n47:Monumen/MonumenList_ajax\r\n48:Monumen/monumen_print\r\n49:Cancel/show_Cancel_ajax\r\n50:Light/Lightlist_ajax\r\n51:Retrunprice/show_Retrunprice_cl_ajax\r\n52:Retrunprice/Retrunprice_cl_ajax\r\n53:Save/Savelist_ajax\r\n54:Move/Movelist_ajax\r\n55:Move/show_Move_ajax', '100');
INSERT INTO `ky_config` VALUES ('43', 'empty_list_describe', '1', '数据列表为空时的描述信息', '3', '', '', '1492278127', '1553154322', '1', 'aOh! 暂时还没有数据~', '3');
INSERT INTO `ky_config` VALUES ('44', 'trash_config', '3', '回收站配置', '3', '', 'key为模型名称，值为显示列。', '1492312698', '1553154322', '1', 'Config:name\r\nAuthGroup:name\r\nMember:nickname\r\nMenu:name\r\nArticle:name\r\nArticleCategory:name\r\nAddon:name\r\nPicture:name\r\nFile:name\r\nActionLog:describe\r\nApi:name\r\nApiGroup:name\r\nBlogroll:name', '0');
INSERT INTO `ky_config` VALUES ('49', 'static_domain', '1', '静态资源域名', '1', '', '若静态资源为本地资源则此项为空，若为外部资源则为存放静态资源的域名', '1502430387', '1547273321', '1', '', '0');
INSERT INTO `ky_config` VALUES ('52', 'team_developer', '3', '研发团队人员', '4', '', '', '1504236453', '1532752419', '1', '0:快云', '0');
INSERT INTO `ky_config` VALUES ('53', 'api_status_option', '3', 'API接口状态', '4', '', '', '1504242433', '1510894595', '1', '0:待研发\r\n1:研发中\r\n2:测试中\r\n3:已完成', '0');
INSERT INTO `ky_config` VALUES ('54', 'api_data_type_option', '3', 'API数据类型', '4', '', '', '1504328208', '1510894595', '1', '0:字符\r\n1:文本\r\n2:数组\r\n3:文件', '0');
INSERT INTO `ky_config` VALUES ('55', 'frontend_theme', '1', '前端主题', '1', '', '', '1504762360', '1547273321', '1', 'default', '0');
INSERT INTO `ky_config` VALUES ('56', 'api_domain', '1', 'API部署域名', '4', '', '', '1504779094', '1510894595', '1', 'https://demo.onebase.org', '0');
INSERT INTO `ky_config` VALUES ('57', 'api_key', '1', 'API加密KEY', '4', '', '泄露后API将存在安全隐患', '1505302112', '1510894595', '1', 'l2V|gfZp{8`;jzR~6Y1_', '0');
INSERT INTO `ky_config` VALUES ('58', 'loading_icon', '4', '页面Loading图标设置', '1', '1:图标1\r\n2:图标2\r\n3:图标3\r\n4:图标4\r\n5:图标5\r\n6:图标6\r\n7:图标7', '页面Loading图标支持7种图标切换', '1505377202', '1547273321', '1', '7', '80');
INSERT INTO `ky_config` VALUES ('59', 'sys_file_field', '3', '文件字段配置', '3', '', 'key为模型名，值为文件列名。', '1505799386', '1553154322', '1', '0_article:file_id', '0');
INSERT INTO `ky_config` VALUES ('60', 'sys_picture_field', '3', '图片字段配置', '3', '', 'key为模型名，值为图片列名。', '1506315422', '1553154322', '1', '0_article:cover_id\r\n1_article:img_ids', '0');
INSERT INTO `ky_config` VALUES ('61', 'jwt_key', '1', 'JWT加密KEY', '4', '', '', '1506748805', '1510894595', '1', 'l2V|DSFXXXgfZp{8`;FjzR~6Y1_', '0');
INSERT INTO `ky_config` VALUES ('64', 'is_write_exe_log', '4', '是否写入执行记录', '3', '0:否\r\n1:是', '', '1510544340', '1553154322', '1', '0', '101');
INSERT INTO `ky_config` VALUES ('65', 'admin_allow_ip', '3', '超级管理员登录IP', '3', '', '后台超级管理员登录IP限制，其他角色不受限。', '1510995580', '1553154322', '1', '0:27.22.112.250', '0');
INSERT INTO `ky_config` VALUES ('66', 'pjax_mode', '8', 'PJAX模式', '3', '0:否\r\n1:是', '若为PJAX模式则浏览器不会刷新，若为常规模式则为AJAX+刷新', '1512370397', '1553154322', '1', '0', '120');
INSERT INTO `ky_config` VALUES ('67', 'relation', '3', '人员关系', '2', '', '', '1523418094', '1525679776', '1', '1:夫妻\r\n2:子女\r\n3:兄\r\n4:祖孙\r\n5:婿\r\n6:媳\r\n7:侄\r\n8:姑舅姨\r\n9:其他\r\n', '1');
INSERT INTO `ky_config` VALUES ('68', 'usestatus', '3', '墓穴使用状态表', '2', '', '', '1523591682', '1553912065', '1', '1:待销售\r\n2:已预定 \r\n3:已销售\r\n4:安葬\r\n5:迁走', '1');
INSERT INTO `ky_config` VALUES ('69', 'servicetype', '3', '服务类型', '2', '', '', '1523598205', '1551683768', '-1', '1:购墓收费项目\r\n2:点灯服务项目\r\n3:鲜花服务项目\r\n4:补录服务项目\r\n10:安葬服务', '1');
INSERT INTO `ky_config` VALUES ('70', 'sex', '3', '性别', '2', '', '', '1523690688', '1523690688', '1', '1:男\r\n2:女', '0');
INSERT INTO `ky_config` VALUES ('71', 'price_range', '3', '墓穴价格区间', '1', '', '', '1523952442', '1547273321', '1', '1:0-1000\r\n2:1000-2000\r\n3:2000-3000\r\n4:大于3000', '0');
INSERT INTO `ky_config` VALUES ('72', 'servicenumber ', '0', '服务次数循环', '1', '', '', '1524041294', '1529047393', '1', '10', '0');
INSERT INTO `ky_config` VALUES ('73', 'monumentfile', '3', '碑文类型', '1', '', '', '1524042391', '1547273321', '1', '1:竖碑文\r\n2:横碑文', '0');
INSERT INTO `ky_config` VALUES ('74', 'ordaintype', '3', '预定类型', '2', '', '', '1524103949', '1529030866', '1', '1:电话预定 \r\n2:现场预定\r\n3:网络预定', '0');
INSERT INTO `ky_config` VALUES ('75', 'orderstatus', '3', '订单状态', '1', '', '', '1524280334', '1553325345', '1', '1:待付款状态\r\n3:退单状态\r\n2:付款完成', '0');
INSERT INTO `ky_config` VALUES ('76', 'financetype', '3', '财务类型', '1', '', '', '1525829650', '1553663562', '1', '1:购墓单\r\n2:寄存收费单\r\n3:殡葬服务收费单\r\n4:下葬服务单\r\n5:墓穴变更单\r\n6:退墓服务单\r\n7:点灯服务单\r\n8:碑文服务单', '0');
INSERT INTO `ky_config` VALUES ('77', 'prooffile', '3', '证明材料', '2', '', '', '1525919956', '1525919956', '1', '1:死亡证明\r\n2:身份证\r\n3:低保证明', '0');
INSERT INTO `ky_config` VALUES ('78', 'fere', '3', '祭祀类型', '2', '', '', '1527823951', '1551683734', '-1', '1:公祭\r\n2:家祭\r\n3:其他', '0');
INSERT INTO `ky_config` VALUES ('79', 'cameraNumber', '3', '相机编号', '2', '', '', '1527835694', '1532752276', '-1', '1:1001-黑\r\n2:1002-银', '0');
INSERT INTO `ky_config` VALUES ('80', 'nation', '3', '民族', '2', '', '', '1527836326', '1527837415', '-1', '1:汉族\r\n2:壮族\r\n3:满族\r\n4:回族\r\n5:苗族\r\n6:维吾尔族\r\n7:土家族\r\n8:彝族\r\n9:蒙古族\r\n10:藏族\r\n11:布依族\r\n12:侗族\r\n13:瑶族\r\n14:朝鲜族\r\n15:白族\r\n16:哈尼族\r\n17:哈萨克族\r\n18:黎族\r\n19:傣族\r\n20:畲族\r\n21:傈僳族\r\n22:仡佬族\r\n22:东乡族\r\n23:高山族\r\n24:拉祜族\r\n25:水族\r\n26:佤族\r\n27:纳西族\r\n28:羌族\r\n29:土族\r\n30:仫佬族\r\n31:锡伯族\r\n32:柯尔克孜族\r\n33:达翰尔族', '0');
INSERT INTO `ky_config` VALUES ('81', 'reason', '3', '死亡原因', '2', '', '', '1527838197', '1532752276', '-1', '1:病故\r\n2:自然死亡\r\n3:交通事故\r\n4:溺水\r\n5:高坠\r\n6:刑事案件\r\n7:自杀\r\n8:执行死刑\r\n9:待查\r\n10:工伤\r\n11:猝死', '0');
INSERT INTO `ky_config` VALUES ('82', 'dietype', '3', '死亡证明类型', '2', '', '', '1527838919', '1532752276', '-1', '1:医学\r\n2:公安', '0');
INSERT INTO `ky_config` VALUES ('83', 'Payment', '0', '付款方式', '2', '', '', '1528688113', '1553490997', '1', '1:刷卡\r\n2:现金\r\n3:微信\r\n4:支付宝', '0');
INSERT INTO `ky_config` VALUES ('84', 'receivingType', '3', '接运类型', '2', '', '', '1529033666', '1532752208', '-1', '1:接运组\r\n2:自送\r\n3:点军殡改\r\n4:猇亭殡改\r\n5:执行死刑', '0');
INSERT INTO `ky_config` VALUES ('85', 'area', '3', '区域', '2', '', '', '1529044444', '1532752228', '-1', '1:西陵区\n2:伍家区\n3:点军区\n4:高新区\n', '0');
INSERT INTO `ky_config` VALUES ('86', 'stricken', '0', '特困类型', '0', '', '', '1529373757', '1532752241', '-1', '1:军残\r\n2:烈士家属\r\n3:五保\r\n4:低保\r\n5:优抚对象\r\n6:三无人员', '0');
INSERT INTO `ky_config` VALUES ('87', 'combotype', '3', '套餐服务类别', '2', '', '', '1529658206', '1532752276', '-1', '1:基本套餐\r\n2:鲜花套餐\r\n3:绢花套餐', '0');
INSERT INTO `ky_config` VALUES ('88', 'firenotesStatus', '3', '火化状态', '2', '', '', '1529996060', '1532752276', '-1', '1:火化中\r\n2:待取灰\r\n3:已完结', '0');
INSERT INTO `ky_config` VALUES ('89', 'stoveNumber', '3', '火化炉', '2', '', '', '1529998761', '1532752276', '-1', '1:一号炉-111\r\n2:二号炉-222', '0');
INSERT INTO `ky_config` VALUES ('90', 'finance', '0', '财务归属', '2', '', '', '1531120914', '1531121099', '1', '1:财务1\r\n2:财务2', '0');
INSERT INTO `ky_config` VALUES ('91', 'supplier', '0', '供应商类型', '2', '', '', '1531121038', '1531121080', '1', '1:福德礼仪（鲜花）\r\n2:天佑殡葬（莲花灯）\r\n3:铭善殡葬（乐队）\r\n4:西游礼仪（抬灵）\r\n5:祥鹤殡葬（送灵）\r\n6:天一殡葬（遗物处理）\r\n7:龙凤（丧葬用品）\r\n8:骨灰盒\r\n9:殡仪馆', '0');
INSERT INTO `ky_config` VALUES ('92', 'income', '0', '收入类型', '2', '', '', '1531121147', '1532752276', '-1', '1:事业收入\r\n2:经营收入', '0');
INSERT INTO `ky_config` VALUES ('93', 'serviceItems', '0', '服务项目类型', '2', '', '', '1531121240', '1532752331', '-1', '1:基本服务\r\n2: 设施租用\r\n3: 殡仪馆\r\n4: 灵堂会场布置\r\n5: 丧葬用品\r\n6: 火化馆\r\n7: 其他（数据库）', '0');
INSERT INTO `ky_config` VALUES ('94', 'team', '0', '收费班组', '2', '', '', '1531969513', '1532752276', '-1', '1:白班\r\n2:晚班', '0');
INSERT INTO `ky_config` VALUES ('95', 'chargemode', '0', '收费方式', '2', '', '', '1531969730', '1532752276', '-1', '1:现金\r\n2:刷卡\r\n3:微信', '0');
INSERT INTO `ky_config` VALUES ('96', 'cemeteryreserve', '0', '预定天数', '2', '', '', '1532491210', '1551683647', '-1', '7', '0');
INSERT INTO `ky_config` VALUES ('97', 'cemeteryreserveprice', '0', '墓穴定金', '2', '', '', '1532498186', '1551683654', '-1', '100', '0');
INSERT INTO `ky_config` VALUES ('98', 'cemeterymanagerprice', '3', '维护费', '2', '', 'KEY:为描述，值为价格', '1532753530', '1551683790', '-1', '50元/年:50\r\n100元/年:100 \r\n150元/年:150\r\n200元/年:200 \r\n400元/年:400\r\n20元/年:20', '0');
INSERT INTO `ky_config` VALUES ('99', 'monumenphotoprice', '3', '瓷相费用', '2', '', '', '1532760503', '1551683783', '-1', '6寸椭圆瓷像彩色:300\r\n5寸椭圆瓷像彩色:200\r\n4寸椭圆瓷像彩色:200\r\n3寸椭圆瓷像彩色:150\r\n', '0');
INSERT INTO `ky_config` VALUES ('100', 'monumenmaterialprice', '3', '附加材料费用', '2', '', '', '1532760792', '1551683798', '-1', '6寸椭圆寿字: 100\r\n6寸椭圆仙鹤: 100\r\n5寸椭圆仙鹤: 100\r\n4寸椭圆仙鹤: 80\r\n3寸椭圆仙鹤: 50\r\n5寸椭圆寿字: 100\r\n4寸椭圆寿字:80\r\n3寸椭圆寿字: 50\r\n其他材料费用: 100', '0');
INSERT INTO `ky_config` VALUES ('101', 'monumenfontbigprice', '3', '刻字费用', '2', '', '', '1532766536', '1551683667', '-1', '普通大字:4\r\n金箔大字:19\r\n生态园金箔字:10', '0');
INSERT INTO `ky_config` VALUES ('102', 'monumenfontsmallprice', '3', '刻字费用', '2', '', '', '1532766644', '1551683661', '-1', '普通小字:4\r\n金箔小字:19\r\n生态园金箔字:10', '0');
INSERT INTO `ky_config` VALUES ('103', 'preferentialratio', '3', '优惠比例', '2', '', '用于优惠审批的比率', '1533624272', '1551683680', '-1', '0.9:九折\r\n0.85:八五折\r\n0.8:八折\r\n0.75:七五折\r\n0.7:七折', '0');
INSERT INTO `ky_config` VALUES ('104', 'szmonumenphotoprice', '3', '寿字磁像收费', '1', '', '寿字磁像收费', '1533630770', '1552097510', '-1', '6寸椭圆寿字:100\r\n5寸椭圆寿字:100\r\n4寸椭圆寿字:80\r\n3寸椭圆寿字:50\r\n6寸椭圆仙鹤:100\r\n5寸椭圆仙鹤:100\r\n4寸椭圆仙鹤:80\r\n3寸椭圆仙鹤:50', '0');
INSERT INTO `ky_config` VALUES ('105', 'sellcouponratio', '3', '销售优惠比率', '2', '', '', '1533711447', '1551683674', '-1', '0.95:九五折\r\n0.9:九折', '0');
INSERT INTO `ky_config` VALUES ('106', 'monumenfontbigpricela', '3', '金箔费用', '2', '', '金箔费用', '1535086773', '1535087880', '-1', '金箔字：15元/个', '0');
INSERT INTO `ky_config` VALUES ('107', 'comapnyinfo', '3', '单位信息', '2', '', '', '1536131363', '1553331421', '1', '1:宜昌市长青树葬陵园\r\n2:宜昌市峡口风景区南津关村\r\n3:0717-8861933/7825933', '0');
INSERT INTO `ky_config` VALUES ('108', 'print_bill', '2', ' 打印报表标题', '2', '', '', '1536131408', '1536131550', '1', '1:鸣凤山人文纪念园预定表\r\n2:鸣凤山人文纪念园登记表', '0');
INSERT INTO `ky_config` VALUES ('109', 'carveprice', '3', '刻框费', '1', '', '', '1545204742', '1547273321', '1', '6寸刻框1:50\r\n5寸刻框1:50\r\n3寸刻框2:30\r\n4寸刻框2:30\r\n', '0');
INSERT INTO `ky_config` VALUES ('110', 'steleStyle', '3', '碑式', '1', '', '', '1545227083', '1547273321', '1', '规格传统', '0');
INSERT INTO `ky_config` VALUES ('111', 'chargeunit', '3', '计量单位', '2', '', '', '1550211576', '1550211591', '1', '1:次\r\n2:套\r\n', '0');
INSERT INTO `ky_config` VALUES ('112', 'pricetype', '3', '定价类型', '1', '', '', '1550211687', '1550211687', '1', '1:政府定价\r\n2:企业定价', '0');
INSERT INTO `ky_config` VALUES ('113', 'burytype', '3', '安葬的内容', '2', '', '', '1552698433', '1552698433', '1', '1:骨灰\r\n2:衣冠\r\n3:遗骨', '0');
INSERT INTO `ky_config` VALUES ('114', 'burystyle', '3', '安葬的风格', '2', '', '', '1552698519', '1552698519', '1', '1:墓葬\r\n2:树葬\r\n3:壁葬\r\n4:撒散葬', '0');
INSERT INTO `ky_config` VALUES ('115', 'monumenstyle', '3', '碑型', '2', '', '', '1552702920', '1553657930', '1', '1:薄碑\r\n2:厚碑\r\n3:树葬碑\r\n4:平面碑\r\n5:龙凤碑\r\n6:换碑', '0');
INSERT INTO `ky_config` VALUES ('116', 'monumentype', '3', '碑文类型', '2', '', '', '1552703031', '1553652798', '1', '1:竖碑文\r\n2:横碑文 ', '0');
INSERT INTO `ky_config` VALUES ('117', 'retrunprice', '0', '退款收费费', '2', '', '收取10的退款手续费', '1553060662', '1553060662', '1', '0.1', '0');
INSERT INTO `ky_config` VALUES ('118', 'lightpaytype', '3', '点灯付款类型', '0', '', '', '1553776538', '1553776538', '1', '1:线下支付\r\n2:微信支付\r\n3:支付宝支付', '0');

-- ----------------------------
-- Table structure for ky_driver
-- ----------------------------
DROP TABLE IF EXISTS `ky_driver`;
CREATE TABLE `ky_driver` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `service_name` varchar(40) NOT NULL DEFAULT '' COMMENT '服务标识',
  `driver_name` varchar(20) NOT NULL DEFAULT '' COMMENT '驱动标识',
  `config` text NOT NULL COMMENT '配置',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '安装时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='插件表';

-- ----------------------------
-- Records of ky_driver
-- ----------------------------

-- ----------------------------
-- Table structure for ky_exe_log
-- ----------------------------
DROP TABLE IF EXISTS `ky_exe_log`;
CREATE TABLE `ky_exe_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键自增',
  `ip` char(50) NOT NULL DEFAULT '' COMMENT 'IP地址',
  `exe_url` varchar(2000) NOT NULL DEFAULT '' COMMENT '执行URL',
  `exe_time` float(10,6) unsigned NOT NULL DEFAULT '0.000000' COMMENT '执行时间 单位 秒',
  `exe_memory` char(20) NOT NULL DEFAULT '' COMMENT '内存占用KB',
  `exe_os` char(30) NOT NULL DEFAULT '' COMMENT '操作系统',
  `source_url` varchar(2000) NOT NULL DEFAULT '' COMMENT '来源URL',
  `session_id` char(32) NOT NULL DEFAULT '' COMMENT 'session_id',
  `browser` char(30) NOT NULL DEFAULT '' COMMENT '浏览器',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0',
  `login_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '执行者ID',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '类型  0 ： 应用范围 ， 1：API 范围 ',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of ky_exe_log
-- ----------------------------

-- ----------------------------
-- Table structure for ky_file
-- ----------------------------
DROP TABLE IF EXISTS `ky_file`;
CREATE TABLE `ky_file` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文件ID',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '原始文件名',
  `path` varchar(255) NOT NULL DEFAULT '' COMMENT '保存名称',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '远程地址',
  `sha1` char(40) NOT NULL DEFAULT '' COMMENT '文件 sha1编码',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '上传时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='文件表';

-- ----------------------------
-- Records of ky_file
-- ----------------------------
INSERT INTO `ky_file` VALUES ('1', 'e055153e5004d823a0292da7b18f54b6.txt', '20190216/e055153e5004d823a0292da7b18f54b6.txt', '', '8fb2db61416abe6523de5f92966ebc3551b5a1a1', '1550308330', '1550308330', '1');

-- ----------------------------
-- Table structure for ky_finance
-- ----------------------------
DROP TABLE IF EXISTS `ky_finance`;
CREATE TABLE `ky_finance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderNO` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `cid` int(11) NOT NULL,
  `tid` int(11) DEFAULT NULL,
  `paytype` tinyint(1) DEFAULT NULL,
  `financetype` tinyint(1) DEFAULT NULL,
  `payer` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `payerdate` int(11) DEFAULT NULL,
  `paystatus` tinyint(1) DEFAULT NULL,
  `sellprice` decimal(10,2) DEFAULT NULL,
  `realprice` decimal(10,2) DEFAULT NULL,
  `offerprice` decimal(10,2) DEFAULT NULL,
  `offertype` int(1) DEFAULT NULL,
  `operate` int(11) DEFAULT NULL,
  `operatename` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `status` tinyint(4) DEFAULT '1',
  `create_time` int(11) NOT NULL,
  `update_time` int(11) DEFAULT NULL,
  `amount` int(4) DEFAULT '1',
  `unitprice` decimal(10,2) DEFAULT '0.00',
  `selltitle` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `vcdesc` text CHARACTER SET utf8,
  `selltitleid` int(4) NOT NULL DEFAULT '16',
  `isvoice` tinyint(1) DEFAULT '0',
  `kmtype` tinyint(1) DEFAULT '1' COMMENT '科目类型 1：收费项目 2：服务项目',
  `isstory` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `state` (`status`) USING BTREE,
  KEY `tid` (`tid`,`financetype`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=318 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of ky_finance
-- ----------------------------
INSERT INTO `ky_finance` VALUES ('1', 'CW20190318021731', '4', '1', '1', '1', null, null, null, '2', '7980.00', '7980.00', null, null, '1', 'admin', '1', '1552889851', '1553912097', '1', '7980.00', '墓位费', '', '2', '0', '1', '1');
INSERT INTO `ky_finance` VALUES ('2', 'CW20190318021731', '4', '1', '1', '1', null, null, null, '2', '100.00', '100.00', null, null, '1', 'admin', '1', '1552889851', '1553912097', '1', '100.00', '绿化费', '', '3', '0', '1', '1');
INSERT INTO `ky_finance` VALUES ('3', 'CW20190318021731', '4', '1', '1', '1', null, null, null, '2', '200.00', '200.00', null, null, '1', 'admin', '1', '1552889851', '1553912097', '1', '200.00', '管理费', '', '4', '0', '1', '1');
INSERT INTO `ky_finance` VALUES ('4', 'CW20190318021731', '4', '1', '1', '1', null, null, null, '2', '10.00', '10.00', null, null, '1', 'admin', '1', '1552889851', '1553912097', '1', '10.00', '墓证费', '', '5', '0', '1', '1');
INSERT INTO `ky_finance` VALUES ('5', 'CW20190318021731', '4', '1', '1', '1', null, null, null, '2', '0.00', '0.00', null, null, '1', 'admin', '1', '1552889851', '1553912097', '1', '0.00', '安葬礼仪', '', '6', '0', '1', '1');
INSERT INTO `ky_finance` VALUES ('6', 'CW20190318021731', '4', '1', '1', '1', null, null, null, '2', '0.00', '0.00', null, null, '1', 'admin', '1', '1552889851', '1553912097', '1', '0.00', '锣鼓乐队', '', '7', '0', '1', '1');
INSERT INTO `ky_finance` VALUES ('7', 'CW20190318021731', '4', '1', '1', '1', null, null, null, '2', '100.00', '100.00', null, null, '1', 'admin', '1', '1552889851', '1553912097', '1', '100.00', '骨灰坛', '', '1', '0', '2', '1');
INSERT INTO `ky_finance` VALUES ('8', 'CW20190318021731', '4', '1', '1', '1', null, null, null, '2', '1000.00', '1000.00', null, null, '1', 'admin', '1', '1552889851', '1553912097', '1', '1000.00', '锣鼓乐队', '', '2', '0', '2', '1');
INSERT INTO `ky_finance` VALUES ('102', 'CW20190318041511', '4', '11', '1', '4', null, null, null, '2', '100.00', '100.00', null, null, '1', 'admin', '1', '1552896911', '1553912097', '1', '100.00', '绿化费', '', '3', '0', '1', '1');
INSERT INTO `ky_finance` VALUES ('103', 'CW20190318041511', '4', '11', '1', '4', null, null, null, '2', '200.00', '200.00', null, null, '1', 'admin', '1', '1552896911', '1553912097', '1', '200.00', '管理费', '', '4', '0', '1', '1');
INSERT INTO `ky_finance` VALUES ('104', 'CW20190318041511', '4', '11', '1', '4', null, null, null, '2', '10.00', '10.00', null, null, '1', 'admin', '1', '1552896911', '1553912097', '1', '10.00', '墓证费', '', '5', '0', '1', '1');
INSERT INTO `ky_finance` VALUES ('105', 'CW20190318041511', '4', '11', '1', '4', null, null, null, '2', '0.00', '0.00', null, null, '1', 'admin', '1', '1552896911', '1553912097', '1', '0.00', '安葬礼仪', '', '6', '0', '1', '1');
INSERT INTO `ky_finance` VALUES ('106', 'CW20190318041511', '4', '11', '1', '4', null, null, null, '2', '0.00', '0.00', null, null, '1', 'admin', '1', '1552896911', '1553912097', '1', '0.00', '锣鼓乐队', '', '7', '0', '1', '1');
INSERT INTO `ky_finance` VALUES ('114', 'CW20190320023115', '4', '21', '1', '6', null, null, null, '1', '939.00', '939.00', null, null, '21', '曾云利', '1', '1553063475', '1553912097', '1', '939.00', '退费金额', '', '9', '1', '1', '1');
INSERT INTO `ky_finance` VALUES ('115', 'CW20190320094529', '4', '24', '1', '5', null, null, null, '2', '0.00', '0.00', null, null, '1', 'admin', '1', '1553089529', '1553912097', '1', '0.00', '安葬礼仪', '', '6', '0', '1', '1');
INSERT INTO `ky_finance` VALUES ('116', 'CW20190320094529', '4', '24', '1', '5', null, null, null, '2', '1000.00', '1000.00', null, null, '1', 'admin', '1', '1553089529', '1553912097', '1', '1000.00', '变更补交', '', '8', '0', '1', '1');
INSERT INTO `ky_finance` VALUES ('117', 'CW20190320094615', '4', '26', '1', '5', null, null, null, '2', '0.00', '0.00', null, null, '1', 'admin', '1', '1553089575', '1553912097', '1', '0.00', '安葬礼仪', '', '6', '0', '1', '1');
INSERT INTO `ky_finance` VALUES ('118', 'CW20190320094615', '4', '26', '1', '5', null, null, null, '2', '1000.00', '1000.00', null, null, '1', 'admin', '1', '1553089575', '1553912097', '1', '1000.00', '变更补交', '', '8', '0', '1', '1');
INSERT INTO `ky_finance` VALUES ('119', 'CW20190320095735', '4', '28', '1', '5', null, null, null, '2', '0.00', '0.00', null, null, '1', 'admin', '1', '1553090255', '1553912097', '1', '0.00', '安葬礼仪', '', '6', '0', '1', '1');
INSERT INTO `ky_finance` VALUES ('120', 'CW20190320095735', '4', '28', '1', '5', null, null, null, '2', '100.00', '100.00', null, null, '1', 'admin', '1', '1553090255', '1553912097', '1', '100.00', '变更补交', '', '8', '0', '1', '1');
INSERT INTO `ky_finance` VALUES ('121', 'CW20190320100845', '4', '30', '1', '5', null, null, null, '2', '0.00', '0.00', null, null, '1', 'admin', '1', '1553090925', '1553912097', '1', '0.00', '安葬礼仪', '', '6', '0', '1', '1');
INSERT INTO `ky_finance` VALUES ('122', 'CW20190320100845', '4', '30', '1', '5', null, null, null, '2', '3434.00', '3434.00', null, null, '1', 'admin', '1', '1553090925', '1553912097', '1', '3434.00', '变更补交', '', '8', '0', '1', '1');
INSERT INTO `ky_finance` VALUES ('123', 'CW20190320101551', '4', '32', '1', '5', null, null, null, '2', '0.00', '0.00', null, null, '1', 'admin', '1', '1553091351', '1553912097', '1', '0.00', '安葬礼仪', '', '6', '0', '1', '1');
INSERT INTO `ky_finance` VALUES ('124', 'CW20190320101551', '4', '32', '1', '5', null, null, null, '2', '111.00', '111.00', null, null, '1', 'admin', '1', '1553091351', '1553912097', '1', '111.00', '变更补交', '', '8', '0', '1', '1');
INSERT INTO `ky_finance` VALUES ('125', 'CW20190320101628', '4', '33', '1', '5', null, null, null, '2', '0.00', '0.00', null, null, '1', 'admin', '1', '1553091388', '1553912097', '1', '0.00', '安葬礼仪', '', '6', '0', '1', '1');
INSERT INTO `ky_finance` VALUES ('126', 'CW20190320101628', '4', '33', '1', '5', null, null, null, '2', '111.00', '111.00', null, null, '1', 'admin', '1', '1553091388', '1553912097', '1', '111.00', '变更补交', '', '8', '0', '1', '1');
INSERT INTO `ky_finance` VALUES ('127', 'CW20190320101649', '4', '34', '1', '5', null, null, null, '2', '0.00', '0.00', null, null, '1', 'admin', '1', '1553091409', '1553912097', '1', '0.00', '安葬礼仪', '', '6', '0', '1', '1');
INSERT INTO `ky_finance` VALUES ('128', 'CW20190320101649', '4', '34', '1', '5', null, null, null, '2', '111.00', '111.00', null, null, '1', 'admin', '1', '1553091409', '1553912097', '1', '111.00', '变更补交', '', '8', '0', '1', '1');
INSERT INTO `ky_finance` VALUES ('129', 'CW20190320101712', '4', '35', '1', '5', null, null, null, '2', '0.00', '0.00', null, null, '1', 'admin', '1', '1553091432', '1553912097', '1', '0.00', '安葬礼仪', '', '6', '0', '1', '1');
INSERT INTO `ky_finance` VALUES ('130', 'CW20190320101712', '4', '35', '1', '5', null, null, null, '2', '111.00', '111.00', null, null, '1', 'admin', '1', '1553091432', '1553912097', '1', '111.00', '变更补交', '', '8', '0', '1', '1');
INSERT INTO `ky_finance` VALUES ('131', 'CW20190320101746', '3', '36', '1', '5', null, null, null, '2', '0.00', '0.00', null, null, '1', 'admin', '1', '1553091466', null, '1', '0.00', '安葬礼仪', '', '6', '0', '1', '0');
INSERT INTO `ky_finance` VALUES ('132', 'CW20190320101746', '3', '36', '1', '5', null, null, null, '2', '100.00', '100.00', null, null, '1', 'admin', '1', '1553091466', null, '1', '100.00', '变更补交', '', '8', '0', '1', '0');
INSERT INTO `ky_finance` VALUES ('133', 'CW20190320101905', '3', '37', '1', '5', null, null, null, '2', '0.00', '0.00', null, null, '1', 'admin', '1', '1553091545', null, '1', '0.00', '安葬礼仪', '', '6', '0', '1', '0');
INSERT INTO `ky_finance` VALUES ('134', 'CW20190320101905', '3', '37', '1', '5', null, null, null, '2', '100.00', '100.00', null, null, '1', 'admin', '1', '1553091545', null, '1', '100.00', '变更补交', '', '8', '0', '1', '0');
INSERT INTO `ky_finance` VALUES ('135', 'CW20190320102157', '3', '38', '1', '5', null, null, null, '2', '0.00', '0.00', null, null, '1', 'admin', '1', '1553091717', null, '1', '0.00', '安葬礼仪', '', '6', '0', '1', '0');
INSERT INTO `ky_finance` VALUES ('136', 'CW20190320102157', '3', '38', '1', '5', null, null, null, '2', '100.00', '100.00', null, null, '1', 'admin', '1', '1553091717', null, '1', '100.00', '变更补交', '', '8', '0', '1', '0');
INSERT INTO `ky_finance` VALUES ('137', 'CW20190320102504', '3', '39', '1', '6', null, null, null, '1', '100.00', '100.00', null, null, '1', 'admin', '1', '1553091904', null, '1', '100.00', '退费金额', '', '9', '1', '1', '0');
INSERT INTO `ky_finance` VALUES ('138', 'CW20190321011131', '3', '41', '1', '7', null, null, null, '2', '100.00', '100.00', null, null, '1', 'admin', '-1', '1553145091', '1553146726', '1', '100.00', '点灯收费', '', '10', '0', '1', '0');
INSERT INTO `ky_finance` VALUES ('139', 'CW20190321011247', '3', '42', '1', '7', null, null, null, '2', '100.00', '100.00', null, null, '1', 'admin', '1', '1553145167', null, '1', '100.00', '点灯收费', '', '10', '0', '1', '0');
INSERT INTO `ky_finance` VALUES ('140', 'CW20190321011406', '3', '43', '1', '7', null, null, null, '2', '300.00', '300.00', null, null, '1', 'admin', '-1', '1553145246', '1553146676', '3', '100.00', '点灯收费', '', '10', '1', '1', '0');
INSERT INTO `ky_finance` VALUES ('141', 'CW20190321011845', '3', '44', '1', '7', null, null, null, '2', '400.00', '400.00', null, null, '1', 'admin', '1', '1553145525', null, '4', '100.00', '点灯收费', '', '10', '1', '1', '0');
INSERT INTO `ky_finance` VALUES ('142', 'CW20190321011903', '3', '45', '1', '7', null, null, null, '2', '400.00', '400.00', null, null, '1', 'admin', '1', '1553145543', null, '4', '100.00', '点灯收费', '', '10', '1', '1', '0');
INSERT INTO `ky_finance` VALUES ('143', 'CW20190321011908', '3', '46', '1', '7', null, null, null, '2', '400.00', '400.00', null, null, '1', 'admin', '1', '1553145548', null, '4', '100.00', '点灯收费', '', '10', '1', '1', '0');
INSERT INTO `ky_finance` VALUES ('144', 'CW20190321011958', '3', '47', '1', '7', null, null, null, '2', '400.00', '400.00', null, null, '1', 'admin', '1', '1553145598', null, '4', '100.00', '点灯收费', '', '10', '1', '1', '0');
INSERT INTO `ky_finance` VALUES ('145', 'CW20190321030745', '42', '48', '1', '5', null, null, null, '2', '0.00', '0.00', null, null, '1', 'admin', '1', '1553152065', null, '1', '0.00', '安葬礼仪', '', '6', '0', '1', '0');
INSERT INTO `ky_finance` VALUES ('146', 'CW20190321030745', '42', '48', '1', '5', null, null, null, '2', '100.00', '100.00', null, null, '1', 'admin', '1', '1553152065', null, '1', '100.00', '变更补交', '', '8', '0', '1', '0');
INSERT INTO `ky_finance` VALUES ('147', 'CW20190321030842', '3', '49', '1', '5', null, null, null, '2', '0.00', '0.00', null, null, '1', 'admin', '1', '1553152122', null, '1', '0.00', '安葬礼仪', '', '6', '0', '1', '0');
INSERT INTO `ky_finance` VALUES ('148', 'CW20190321030842', '3', '49', '1', '5', null, null, null, '2', '0.00', '0.00', null, null, '1', 'admin', '1', '1553152122', null, '1', '0.00', '变更补交', '', '8', '0', '1', '0');
INSERT INTO `ky_finance` VALUES ('149', 'CW20190321030911', '3', '50', '1', '5', null, null, null, '2', '0.00', '0.00', null, null, '1', 'admin', '1', '1553152151', null, '1', '0.00', '安葬礼仪', '', '6', '0', '1', '0');
INSERT INTO `ky_finance` VALUES ('150', 'CW20190321030911', '3', '50', '1', '5', null, null, null, '2', '0.00', '0.00', null, null, '1', 'admin', '1', '1553152151', null, '1', '0.00', '变更补交', '', '8', '0', '1', '0');
INSERT INTO `ky_finance` VALUES ('151', 'CW20190321031117', '3', '51', '1', '5', null, null, null, '2', '0.00', '0.00', null, null, '1', 'admin', '1', '1553152277', null, '1', '0.00', '安葬礼仪', '', '6', '0', '1', '0');
INSERT INTO `ky_finance` VALUES ('152', 'CW20190321031117', '3', '51', '1', '5', null, null, null, '2', '0.00', '0.00', null, null, '1', 'admin', '1', '1553152277', null, '1', '0.00', '变更补交', '', '8', '0', '1', '0');
INSERT INTO `ky_finance` VALUES ('153', 'CW20190321043834', '3', '52', '1', '2', null, null, null, '2', '100.00', '100.00', null, null, '1', 'admin', '1', '1553157514', null, '1', '100.00', '寄存费', '', '1', '0', '1', '0');
INSERT INTO `ky_finance` VALUES ('154', 'CW20190321044101', '3', '53', '1', '2', null, null, null, '2', '100.00', '100.00', null, null, '1', 'admin', '1', '1553157661', null, '1', '100.00', '寄存费', '', '1', '0', '1', '0');
INSERT INTO `ky_finance` VALUES ('155', 'CW20190321044154', '3', '54', '1', '2', null, null, null, '2', '100.00', '100.00', null, null, '1', 'admin', '1', '1553157714', null, '1', '100.00', '寄存费', '', '1', '0', '1', '0');
INSERT INTO `ky_finance` VALUES ('156', 'CW20190321044228', '3', '55', '1', '2', null, null, null, '2', '100.00', '100.00', null, null, '1', 'admin', '-1', '1553157748', '1553161784', '1', '100.00', '寄存费', '', '1', '0', '1', '0');
INSERT INTO `ky_finance` VALUES ('157', 'CW20190321055529', '3', '56', '1', '2', null, null, null, '2', '100.00', '100.00', null, null, '1', 'admin', '1', '1553162129', null, '1', '100.00', '寄存费', '', '1', '0', '1', '0');
INSERT INTO `ky_finance` VALUES ('158', 'CW20190321055536', '3', '57', '1', '2', null, null, null, '2', '100.00', '100.00', null, null, '1', 'admin', '1', '1553162136', null, '1', '100.00', '寄存费', '', '1', '0', '1', '0');
INSERT INTO `ky_finance` VALUES ('159', 'CW20190321055557', '3', '58', '1', '2', null, null, null, '2', '200.00', '200.00', null, null, '1', 'admin', '1', '1553162157', '1553162176', '1', '100.00', '寄存费', '', '1', '0', '1', '0');
INSERT INTO `ky_finance` VALUES ('160', 'CW20190323094749', '4', '59', '1', '2', null, null, null, '2', '0.00', '0.00', null, null, '1', 'admin', '-1', '1553305669', '1553912097', '1', '0.00', '寄存费', '', '1', '0', '1', '1');
INSERT INTO `ky_finance` VALUES ('161', 'CW20190323095048', '4', '60', '1', '2', null, null, null, '2', '100.00', '100.00', null, null, '1', 'admin', '1', '1553305848', '1553912097', '1', '100.00', '寄存费', '', '1', '0', '1', '1');
INSERT INTO `ky_finance` VALUES ('162', 'CW20190323095415', '4', '61', '1', '2', null, null, null, '2', '100.00', '100.00', null, null, '1', 'admin', '-1', '1553306055', '1553912097', '1', '100.00', '寄存费', '', '1', '0', '1', '1');
INSERT INTO `ky_finance` VALUES ('163', 'CW20190323101800', '4', '62', '1', '2', null, null, null, '2', '100.00', '100.00', null, null, '1', 'admin', '1', '1553307480', '1553912097', '1', '100.00', '寄存费', '', '1', '0', '1', '1');
INSERT INTO `ky_finance` VALUES ('164', 'CW20190323101852', '4', '63', '2', '2', null, null, null, '2', '112.00', '112.00', null, null, '1', 'admin', '1', '1553307532', '1553912097', '1', '112.00', '寄存费', '', '1', '0', '1', '1');
INSERT INTO `ky_finance` VALUES ('165', 'CW20190323101907', '4', '64', '2', '2', null, null, null, '2', '112.00', '112.00', null, null, '1', 'admin', '-1', '1553307547', '1553912097', '1', '112.00', '寄存费', '', '1', '0', '1', '1');
INSERT INTO `ky_finance` VALUES ('166', 'CW20190323102130', '4', '65', '1', '2', null, null, null, '2', '100.00', '100.00', null, null, '1', 'admin', '-1', '1553307690', '1553912097', '1', '100.00', '寄存费', '', '1', '0', '1', '1');
INSERT INTO `ky_finance` VALUES ('175', 'CW20190323030915', '4', '77', '1', '1', null, null, '1553489357', '2', '7980.00', '7980.00', '0.00', null, '1', 'admin', '1', '1553324955', '1553912097', '1', '7980.00', '墓位费', '', '2', '0', '1', '1');
INSERT INTO `ky_finance` VALUES ('177', 'CW20190325101300', '5', '79', '1', '1', null, null, '1553482138', '2', '7980.00', '7980.00', '0.00', null, '1', 'admin', '1', '1553479980', '1553911495', '1', '7980.00', '墓位费', '', '2', '0', '1', '1');
INSERT INTO `ky_finance` VALUES ('178', 'CW20190325014234', '6', '80', '1', '1', null, null, '1553493753', '2', '7980.00', '7980.00', '0.00', null, '1', 'admin', '-1', '1553492554', '1553675869', '1', '7980.00', '墓位费', '', '2', '0', '1', '1');
INSERT INTO `ky_finance` VALUES ('179', 'CW20190326014900', '6', '81', '1', '3', null, null, null, '1', '888.00', '888.00', '0.00', null, '1', 'admin', '-1', '1553579340', '1553675869', '1', '888.00', '迁坟', '', '12', '0', '1', '1');
INSERT INTO `ky_finance` VALUES ('180', 'CW20190326014900', '6', '81', '1', '3', null, null, null, '1', '888.00', '888.00', '0.00', null, '1', 'admin', '-1', '1553579340', '1553675869', '1', '888.00', '墓穴维修', '', '13', '0', '1', '1');
INSERT INTO `ky_finance` VALUES ('181', 'CW20190326014900', '6', '81', '1', '3', null, null, null, '1', '0.00', '0.00', '0.00', null, '1', 'admin', '-1', '1553579340', '1553675869', '1', '0.00', '单张黑白烤瓷', '', '14', '0', '1', '1');
INSERT INTO `ky_finance` VALUES ('182', 'CW20190326014900', '6', '81', '1', '3', null, null, null, '1', '0.00', '0.00', '0.00', null, '1', 'admin', '-1', '1553579340', '1553675869', '1', '0.00', '单张彩色烤瓷 ', '', '15', '0', '1', '1');
INSERT INTO `ky_finance` VALUES ('183', 'CW20190326014900', '6', '81', '1', '3', null, null, null, '1', '88.00', '88.00', '0.00', null, '1', 'admin', '-1', '1553579340', '1553675869', '1', '88.00', '黑白合照烤瓷', '', '16', '0', '1', '1');
INSERT INTO `ky_finance` VALUES ('184', 'CW20190326014900', '6', '81', '1', '3', null, null, null, '1', '88.00', '88.00', '0.00', null, '1', 'admin', '-1', '1553579340', '1553675869', '1', '88.00', '彩色合照烤瓷 ', '', '17', '0', '1', '1');
INSERT INTO `ky_finance` VALUES ('185', 'CW20190326014900', '6', '81', '1', '3', null, null, null, '1', '0.00', '0.00', '0.00', null, '1', 'admin', '-1', '1553579340', '1553675869', '1', '0.00', '安葬礼仪', '', '6', '0', '1', '1');
INSERT INTO `ky_finance` VALUES ('186', 'CW20190326014900', '6', '81', '1', '3', null, null, null, '1', '0.00', '0.00', '0.00', null, '1', 'admin', '-1', '1553579340', '1553675869', '1', '0.00', '锣鼓乐队', '', '7', '0', '1', '1');
INSERT INTO `ky_finance` VALUES ('187', 'CW20190326014900', '6', '81', '1', '3', null, null, null, '1', '0.00', '0.00', '0.00', null, '1', 'admin', '-1', '1553579340', '1553675869', '1', '0.00', '瓷像安装', '', '18', '0', '1', '1');
INSERT INTO `ky_finance` VALUES ('188', 'CW20190326014900', '6', '81', '1', '3', null, null, null, '1', '0.00', '0.00', '0.00', null, '1', 'admin', '-1', '1553579340', '1553675869', '1', '0.00', '骨灰坛', '', '20', '0', '1', '1');
INSERT INTO `ky_finance` VALUES ('189', 'CW20190326014900', '6', '81', '1', '3', null, null, null, '1', '0.00', '0.00', '0.00', null, '1', 'admin', '-1', '1553579340', '1553675869', '1', '0.00', '绿化维护', '', '3', '0', '1', '1');
INSERT INTO `ky_finance` VALUES ('190', 'CW20190326014900', '6', '81', '1', '3', null, null, null, '1', '0.00', '0.00', '0.00', null, '1', 'admin', '-1', '1553579340', '1553675869', '1', '0.00', '绿化维护 ', '', '4', '0', '2', '1');
INSERT INTO `ky_finance` VALUES ('191', 'CW20190326014900', '6', '81', '1', '3', null, null, null, '1', '0.00', '0.00', '0.00', null, '1', 'admin', '-1', '1553579340', '1553675869', '1', '0.00', '单人黑照片', '', '5', '0', '2', '1');
INSERT INTO `ky_finance` VALUES ('192', 'CW20190326014900', '6', '81', '1', '3', null, null, null, '1', '0.00', '0.00', '0.00', null, '1', 'admin', '-1', '1553579340', '1553675869', '1', '0.00', '单人彩色照片', '', '6', '0', '2', '1');
INSERT INTO `ky_finance` VALUES ('206', 'CW20190326022151', '6', '83', '1', '3', null, null, '1553583151', '2', '343.00', '343.00', '0.00', null, '1', 'admin', '1', '1553581311', '1553675869', '1', '343.00', '迁坟', '', '12', '0', '1', '1');
INSERT INTO `ky_finance` VALUES ('207', 'CW20190326022151', '6', '83', '1', '3', null, null, '1553583151', '2', '343.00', '343.00', '0.00', null, '1', 'admin', '1', '1553581311', '1553675869', '1', '343.00', '墓穴维修', '', '13', '0', '1', '1');
INSERT INTO `ky_finance` VALUES ('208', 'CW20190326022151', '6', '83', '1', '3', null, null, '1553583151', '2', '343.00', '343.00', '0.00', null, '1', 'admin', '1', '1553581311', '1553675869', '1', '343.00', '单张黑白烤瓷', '', '14', '0', '1', '1');
INSERT INTO `ky_finance` VALUES ('209', 'CW20190326022151', '6', '83', '1', '3', null, null, '1553583151', '2', '343.00', '343.00', '0.00', null, '1', 'admin', '1', '1553581311', '1553675869', '1', '343.00', '单张彩色烤瓷 ', '', '15', '0', '1', '1');
INSERT INTO `ky_finance` VALUES ('210', 'CW20190326022151', '6', '83', '1', '3', null, null, '1553583151', '2', '0.00', '0.00', '0.00', null, '1', 'admin', '1', '1553581311', '1553675869', '1', '0.00', '黑白合照烤瓷', '', '16', '0', '1', '1');
INSERT INTO `ky_finance` VALUES ('211', 'CW20190326022151', '6', '83', '1', '3', null, null, '1553583151', '2', '0.00', '0.00', '0.00', null, '1', 'admin', '1', '1553581311', '1553675869', '1', '0.00', '彩色合照烤瓷 ', '', '17', '0', '1', '1');
INSERT INTO `ky_finance` VALUES ('212', 'CW20190326022151', '6', '83', '1', '3', null, null, '1553583151', '2', '0.00', '0.00', '0.00', null, '1', 'admin', '1', '1553581311', '1553675869', '1', '0.00', '安葬礼仪', '', '6', '0', '1', '1');
INSERT INTO `ky_finance` VALUES ('213', 'CW20190326022151', '6', '83', '1', '3', null, null, '1553583151', '2', '0.00', '0.00', '0.00', null, '1', 'admin', '1', '1553581311', '1553675869', '1', '0.00', '锣鼓乐队', '', '7', '0', '1', '1');
INSERT INTO `ky_finance` VALUES ('214', 'CW20190326022151', '6', '83', '1', '3', null, null, '1553583151', '2', '0.00', '0.00', '0.00', null, '1', 'admin', '1', '1553581311', '1553675869', '1', '0.00', '瓷像安装', '', '18', '0', '1', '1');
INSERT INTO `ky_finance` VALUES ('215', 'CW20190326022151', '6', '83', '1', '3', null, null, '1553583151', '2', '0.00', '0.00', '0.00', null, '1', 'admin', '1', '1553581311', '1553675869', '1', '0.00', '骨灰坛', '', '20', '0', '1', '1');
INSERT INTO `ky_finance` VALUES ('216', 'CW20190326022151', '6', '83', '1', '3', null, null, '1553583151', '2', '0.00', '0.00', '0.00', null, '1', 'admin', '1', '1553581311', '1553675869', '1', '0.00', '绿化维护', '', '3', '0', '1', '1');
INSERT INTO `ky_finance` VALUES ('217', 'CW20190326020804', '6', '82', '1', '3', null, null, '1553583432', '2', '2323.00', '2323.00', '0.00', null, '1', 'admin', '1', '1553583420', '1553675869', '1', '2323.00', '迁坟', '', '12', '0', '1', '1');
INSERT INTO `ky_finance` VALUES ('218', 'CW20190326020804', '6', '82', '1', '3', null, null, '1553583432', '2', '222222.00', '222222.00', '0.00', null, '1', 'admin', '1', '1553583420', '1553675869', '1', '222222.00', '墓穴维修', '', '13', '0', '1', '1');
INSERT INTO `ky_finance` VALUES ('219', 'CW20190326020804', '6', '82', '1', '3', null, null, '1553583432', '2', '0.00', '0.00', '0.00', null, '1', 'admin', '1', '1553583420', '1553675869', '1', '0.00', '单张黑白烤瓷', '', '14', '0', '1', '1');
INSERT INTO `ky_finance` VALUES ('220', 'CW20190326020804', '6', '82', '1', '3', null, null, '1553583432', '2', '0.00', '0.00', '0.00', null, '1', 'admin', '1', '1553583420', '1553675869', '1', '0.00', '单张彩色烤瓷 ', '', '15', '0', '1', '1');
INSERT INTO `ky_finance` VALUES ('221', 'CW20190326020804', '6', '82', '1', '3', null, null, '1553583432', '2', '2323.00', '2323.00', '0.00', null, '1', 'admin', '1', '1553583420', '1553675869', '1', '2323.00', '黑白合照烤瓷', '', '16', '0', '1', '1');
INSERT INTO `ky_finance` VALUES ('222', 'CW20190326020804', '6', '82', '1', '3', null, null, '1553583432', '2', '0.00', '0.00', '0.00', null, '1', 'admin', '1', '1553583420', '1553675869', '1', '0.00', '彩色合照烤瓷 ', '', '17', '0', '1', '1');
INSERT INTO `ky_finance` VALUES ('223', 'CW20190326020804', '6', '82', '1', '3', null, null, '1553583432', '2', '0.00', '0.00', '0.00', null, '1', 'admin', '1', '1553583420', '1553675869', '1', '0.00', '安葬礼仪', '', '6', '0', '1', '1');
INSERT INTO `ky_finance` VALUES ('224', 'CW20190326020804', '6', '82', '1', '3', null, null, '1553583432', '2', '0.00', '0.00', '0.00', null, '1', 'admin', '1', '1553583420', '1553675869', '1', '0.00', '锣鼓乐队', '', '7', '0', '1', '1');
INSERT INTO `ky_finance` VALUES ('225', 'CW20190326020804', '6', '82', '1', '3', null, null, '1553583432', '2', '0.00', '0.00', '0.00', null, '1', 'admin', '1', '1553583420', '1553675869', '1', '0.00', '瓷像安装', '', '18', '0', '1', '1');
INSERT INTO `ky_finance` VALUES ('226', 'CW20190326020804', '6', '82', '1', '3', null, null, '1553583432', '2', '0.00', '0.00', '0.00', null, '1', 'admin', '1', '1553583420', '1553675869', '1', '0.00', '骨灰坛', '', '20', '0', '1', '1');
INSERT INTO `ky_finance` VALUES ('227', 'CW20190326020804', '6', '82', '1', '3', null, null, '1553583432', '2', '0.00', '0.00', '0.00', null, '1', 'admin', '1', '1553583420', '1553675869', '1', '0.00', '绿化维护', '', '3', '0', '1', '1');
INSERT INTO `ky_finance` VALUES ('228', 'CW20190326020804', '6', '82', '1', '3', null, null, '1553583432', '2', '0.00', '0.00', '0.00', null, '1', 'admin', '1', '1553583420', '1553675869', '1', '0.00', '绿化维护 ', '', '4', '0', '2', '1');
INSERT INTO `ky_finance` VALUES ('229', 'CW20190326020804', '6', '82', '1', '3', null, null, '1553583432', '2', '0.00', '0.00', '0.00', null, '1', 'admin', '1', '1553583420', '1553675869', '1', '0.00', '单人黑照片', '', '5', '0', '2', '1');
INSERT INTO `ky_finance` VALUES ('230', 'CW20190327103214', '6', '84', '1', '8', null, null, null, '1', '44.00', '44.00', '0.00', null, '1', 'admin', '-1', '1553653934', '1553675869', '1', '44.00', '单张黑白烤瓷', '', '14', '0', '1', '1');
INSERT INTO `ky_finance` VALUES ('231', 'CW20190327103214', '6', '84', '1', '8', null, null, null, '1', '0.00', '0.00', '0.00', null, '1', 'admin', '-1', '1553653934', '1553675869', '1', '0.00', '单张彩色烤瓷 ', '', '15', '0', '1', '1');
INSERT INTO `ky_finance` VALUES ('232', 'CW20190327103214', '6', '84', '1', '8', null, null, null, '1', '0.00', '0.00', '0.00', null, '1', 'admin', '-1', '1553653934', '1553675869', '1', '0.00', '黑白合照烤瓷', '', '16', '0', '1', '1');
INSERT INTO `ky_finance` VALUES ('233', 'CW20190327103214', '6', '84', '1', '8', null, null, null, '1', '0.00', '0.00', '0.00', null, '1', 'admin', '-1', '1553653934', '1553675869', '1', '0.00', '瓷像安装', '', '18', '0', '1', '1');
INSERT INTO `ky_finance` VALUES ('250', 'CW20190327104918', '6', '85', '1', '8', null, null, '1553657543', '2', '33331.00', '33331.00', '0.00', null, '1', 'admin', '1', '1553656211', '1553675869', '1', '33331.00', '单张黑白烤瓷', '', '14', '0', '1', '1');
INSERT INTO `ky_finance` VALUES ('251', 'CW20190327104918', '6', '85', '1', '8', null, null, '1553657543', '2', '122.00', '122.00', '0.00', null, '1', 'admin', '1', '1553656211', '1553675869', '1', '122.00', '单张彩色烤瓷 ', '', '15', '0', '1', '1');
INSERT INTO `ky_finance` VALUES ('252', 'CW20190327104918', '6', '85', '1', '8', null, null, '1553657543', '2', '33.00', '33.00', '0.00', null, '1', 'admin', '1', '1553656211', '1553675869', '1', '33.00', '黑白合照烤瓷', '', '16', '0', '1', '1');
INSERT INTO `ky_finance` VALUES ('253', 'CW20190327104918', '6', '85', '1', '8', null, null, '1553657543', '2', '544.00', '544.00', '0.00', null, '1', 'admin', '1', '1553656211', '1553675869', '1', '544.00', '瓷像安装', '', '18', '0', '1', '1');
INSERT INTO `ky_finance` VALUES ('254', 'CW20190327114800', '6', '86', '1', '8', null, null, '1553658484', '2', '0.00', '0.00', '0.00', null, '1', 'admin', '1', '1553658480', '1553675869', '1', '0.00', '单张黑白烤瓷', '', '14', '0', '1', '1');
INSERT INTO `ky_finance` VALUES ('255', 'CW20190327114800', '6', '86', '1', '8', null, null, '1553658484', '2', '0.00', '0.00', '0.00', null, '1', 'admin', '1', '1553658480', '1553675869', '1', '0.00', '单张彩色烤瓷 ', '', '15', '0', '1', '1');
INSERT INTO `ky_finance` VALUES ('256', 'CW20190327114800', '6', '86', '1', '8', null, null, '1553658484', '2', '0.00', '0.00', '0.00', null, '1', 'admin', '1', '1553658480', '1553675869', '1', '0.00', '黑白合照烤瓷', '', '16', '0', '1', '1');
INSERT INTO `ky_finance` VALUES ('257', 'CW20190327114800', '6', '86', '1', '8', null, null, '1553658484', '2', '0.00', '0.00', '0.00', null, '1', 'admin', '1', '1553658480', '1553675869', '1', '0.00', '瓷像安装', '', '18', '0', '1', '1');
INSERT INTO `ky_finance` VALUES ('258', 'CW20190327115124', '6', '87', '1', '8', null, null, null, '1', '0.00', '0.00', '0.00', null, '1', 'admin', '-1', '1553658684', '1553675869', '1', '0.00', '单张黑白烤瓷', '', '14', '0', '1', '1');
INSERT INTO `ky_finance` VALUES ('259', 'CW20190327115124', '6', '87', '1', '8', null, null, null, '1', '0.00', '0.00', '0.00', null, '1', 'admin', '-1', '1553658684', '1553675869', '1', '0.00', '单张彩色烤瓷 ', '', '15', '0', '1', '1');
INSERT INTO `ky_finance` VALUES ('260', 'CW20190327115124', '6', '87', '1', '8', null, null, null, '1', '0.00', '0.00', '0.00', null, '1', 'admin', '-1', '1553658684', '1553675869', '1', '0.00', '黑白合照烤瓷', '', '16', '0', '1', '1');
INSERT INTO `ky_finance` VALUES ('261', 'CW20190327115124', '6', '87', '1', '8', null, null, null, '1', '0.00', '0.00', '0.00', null, '1', 'admin', '-1', '1553658684', '1553675869', '1', '0.00', '瓷像安装', '', '18', '0', '1', '1');
INSERT INTO `ky_finance` VALUES ('262', 'CW20190327115242', '6', '88', '1', '8', null, null, '1553658774', '2', '0.00', '0.00', '0.00', null, '1', 'admin', '1', '1553658762', '1553675869', '1', '0.00', '单张黑白烤瓷', '', '14', '0', '1', '1');
INSERT INTO `ky_finance` VALUES ('263', 'CW20190327115242', '6', '88', '1', '8', null, null, '1553658774', '2', '0.00', '0.00', '0.00', null, '1', 'admin', '1', '1553658762', '1553675869', '1', '0.00', '单张彩色烤瓷 ', '', '15', '0', '1', '1');
INSERT INTO `ky_finance` VALUES ('264', 'CW20190327115242', '6', '88', '1', '8', null, null, '1553658774', '2', '0.00', '0.00', '0.00', null, '1', 'admin', '1', '1553658762', '1553675869', '1', '0.00', '黑白合照烤瓷', '', '16', '0', '1', '1');
INSERT INTO `ky_finance` VALUES ('265', 'CW20190327115242', '6', '88', '1', '8', null, null, '1553658774', '2', '0.00', '0.00', '0.00', null, '1', 'admin', '1', '1553658762', '1553675869', '1', '0.00', '瓷像安装', '', '18', '0', '1', '1');
INSERT INTO `ky_finance` VALUES ('266', 'CW20190327021100', '6', '89', '1', '6', null, null, null, '1', '1798.00', '1798.00', '0.00', null, '1', 'admin', '-1', '1553667060', '1553675869', '1', '1798.00', '退墓手续费', '', '9', '1', '1', '1');
INSERT INTO `ky_finance` VALUES ('267', 'CW20190327024702', '6', '90', '1', '6', null, null, '1553675869', '2', '798.00', '798.00', '0.00', null, '1', 'admin', '1', '1553669222', '1553675869', '1', '798.00', '退墓手续费', '', '9', '1', '1', '0');
INSERT INTO `ky_finance` VALUES ('268', 'CW20190327083925', '7', '91', '1', '1', null, null, null, '1', '7980.00', '1596.00', '6384.00', null, '1', 'admin', '1', '1553690365', null, '1', '1596.00', '墓位费', '', '2', '0', '1', '0');
INSERT INTO `ky_finance` VALUES ('280', 'CW20190327092320', '7', '92', '1', '3', null, null, null, '1', '0.00', '0.00', '0.00', null, '1', 'admin', '1', '1553693092', null, '1', '0.00', '迁坟', '', '12', '0', '1', '0');
INSERT INTO `ky_finance` VALUES ('281', 'CW20190327092320', '7', '92', '1', '3', null, null, null, '1', '0.00', '0.00', '0.00', null, '1', 'admin', '1', '1553693092', null, '1', '0.00', '单张黑白烤瓷', '', '14', '0', '1', '0');
INSERT INTO `ky_finance` VALUES ('282', 'CW20190327092320', '7', '92', '1', '3', null, null, null, '1', '1111.00', '1111.00', '0.00', null, '1', 'admin', '1', '1553693092', null, '1', '1111.00', '墓穴维修', '', '13', '0', '1', '0');
INSERT INTO `ky_finance` VALUES ('283', 'CW20190327092320', '7', '92', '1', '3', null, null, null, '1', '0.00', '0.00', '0.00', null, '1', 'admin', '1', '1553693092', null, '1', '0.00', '单张彩色烤瓷 ', '', '15', '0', '1', '0');
INSERT INTO `ky_finance` VALUES ('284', 'CW20190327092320', '7', '92', '1', '3', null, null, null, '1', '0.00', '0.00', '0.00', null, '1', 'admin', '1', '1553693092', null, '1', '0.00', '黑白合照烤瓷', '', '16', '0', '1', '0');
INSERT INTO `ky_finance` VALUES ('285', 'CW20190327092320', '7', '92', '1', '3', null, null, null, '1', '0.00', '0.00', '0.00', null, '1', 'admin', '1', '1553693092', null, '1', '0.00', '彩色合照烤瓷 ', '', '17', '0', '1', '0');
INSERT INTO `ky_finance` VALUES ('286', 'CW20190327092320', '7', '92', '1', '3', null, null, null, '1', '0.00', '0.00', '0.00', null, '1', 'admin', '1', '1553693092', null, '1', '0.00', '安葬礼仪', '', '6', '0', '1', '0');
INSERT INTO `ky_finance` VALUES ('287', 'CW20190327092320', '7', '92', '1', '3', null, null, null, '1', '0.00', '0.00', '0.00', null, '1', 'admin', '1', '1553693092', null, '1', '0.00', '锣鼓乐队', '', '7', '0', '1', '0');
INSERT INTO `ky_finance` VALUES ('288', 'CW20190327092320', '7', '92', '1', '3', null, null, null, '1', '0.00', '0.00', '0.00', null, '1', 'admin', '1', '1553693092', null, '1', '0.00', '瓷像安装', '', '18', '0', '1', '0');
INSERT INTO `ky_finance` VALUES ('289', 'CW20190327092320', '7', '92', '1', '3', null, null, null, '1', '0.00', '0.00', '0.00', null, '1', 'admin', '1', '1553693092', null, '1', '0.00', '骨灰坛', '', '20', '0', '1', '0');
INSERT INTO `ky_finance` VALUES ('290', 'CW20190327092320', '7', '92', '1', '3', null, null, null, '1', '0.00', '0.00', '0.00', null, '1', 'admin', '1', '1553693092', null, '1', '0.00', '绿化维护', '', '3', '0', '1', '0');
INSERT INTO `ky_finance` VALUES ('291', 'CW20190327093435', '5', '93', '1', '8', null, null, null, '1', '0.00', '0.00', '0.00', null, '1', 'admin', '1', '1553693675', '1553911495', '1', '0.00', '单张黑白烤瓷', '', '14', '0', '1', '1');
INSERT INTO `ky_finance` VALUES ('292', 'CW20190327093435', '5', '93', '1', '8', null, null, null, '1', '0.00', '0.00', '0.00', null, '1', 'admin', '1', '1553693675', '1553911495', '1', '0.00', '单张彩色烤瓷 ', '', '15', '0', '1', '1');
INSERT INTO `ky_finance` VALUES ('293', 'CW20190327093435', '5', '93', '1', '8', null, null, null, '1', '0.00', '0.00', '0.00', null, '1', 'admin', '1', '1553693675', '1553911495', '1', '0.00', '黑白合照烤瓷', '', '16', '0', '1', '1');
INSERT INTO `ky_finance` VALUES ('294', 'CW20190327093435', '5', '93', '1', '8', null, null, null, '1', '0.00', '0.00', '0.00', null, '1', 'admin', '1', '1553693675', '1553911495', '1', '0.00', '瓷像安装', '', '18', '0', '1', '1');
INSERT INTO `ky_finance` VALUES ('295', 'CW20190328040707', '5', '94', '1', '7', null, null, null, '1', '100.00', '100.00', '0.00', null, '1', 'admin', '-1', '1553760427', '1553911495', '1', '100.00', '点灯收费', '', '10', '0', '1', '1');
INSERT INTO `ky_finance` VALUES ('296', 'CW20190328040729', '5', '95', '1', '7', null, null, null, '1', '100.00', '100.00', '0.00', null, '1', 'admin', '-1', '1553760449', '1553911495', '1', '100.00', '点灯收费', '', '10', '0', '1', '1');
INSERT INTO `ky_finance` VALUES ('297', 'CW20190328043429', '5', '96', '1', '7', null, null, null, '1', '400.00', '400.00', '0.00', null, '1', 'admin', '-1', '1553762069', '1553911495', '4', '100.00', '点灯收费', '', '10', '0', '1', '1');
INSERT INTO `ky_finance` VALUES ('298', 'CW20190328044139', '5', '97', '1', '7', null, null, null, '1', '300.00', '300.00', '0.00', null, '1', 'admin', '-1', '1553762499', '1553911495', '3', '100.00', '点灯收费', '', '10', '0', '1', '1');
INSERT INTO `ky_finance` VALUES ('299', 'CW20190328044204', '5', '98', '1', '7', null, null, '1553775693', '2', '400.00', '400.00', '0.00', null, '1', 'admin', '1', '1553762524', '1553911495', '4', '100.00', '点灯收费', '', '10', '0', '1', '1');
INSERT INTO `ky_finance` VALUES ('300', 'CW20190329093855', '5', '99', '1', '2', null, null, null, '2', '100.00', '100.00', '0.00', null, '1', 'admin', '-1', '1553823535', '1553911495', '1', '100.00', '寄存费', '', '1', '0', '1', '1');
INSERT INTO `ky_finance` VALUES ('301', 'CW20190329113236', '4', '100', '1', '2', null, null, null, '2', '100.00', '100.00', '0.00', null, '1', 'admin', '1', '1553830356', '1553912097', '1', '100.00', '寄存费', '', '1', '0', '1', '1');
INSERT INTO `ky_finance` VALUES ('302', 'CW20190329113243', '4', '101', '1', '2', null, null, null, '2', '100.00', '100.00', '0.00', null, '1', 'admin', '1', '1553830363', '1553912097', '1', '100.00', '寄存费', '', '1', '0', '1', '1');
INSERT INTO `ky_finance` VALUES ('303', 'CW20190329113502', '4', '102', '1', '2', null, null, null, '2', '560.00', '560.00', '0.00', null, '1', 'admin', '1', '1553830502', '1553912097', '1', '100.00', '寄存费', '', '1', '0', '1', '1');
INSERT INTO `ky_finance` VALUES ('304', 'CW20190329013926', '5', '103', '1', '2', null, null, null, '2', '100.00', '100.00', '0.00', null, '1', 'admin', '-1', '1553837966', '1553911495', '1', '100.00', '寄存费', '', '1', '0', '1', '1');
INSERT INTO `ky_finance` VALUES ('305', 'CW20190329015326', '5', '104', '1', '2', null, null, null, '2', '200.00', '200.00', '0.00', null, '1', 'admin', '-1', '1553838806', '1553911495', '1', '200.00', '寄存费', '', '1', '0', '1', '1');
INSERT INTO `ky_finance` VALUES ('306', 'CW20190329020316', '5', '105', '1', '2', null, null, null, '1', '100.00', '100.00', '0.00', null, '1', 'admin', '1', '1553839396', '1553911495', '1', '100.00', '寄存费', '', '1', '0', '1', '1');
INSERT INTO `ky_finance` VALUES ('307', 'CW20190329021441', '4', '106', '1', '3', null, null, '1553840087', '2', '0.00', '0.00', '0.00', null, '1', 'admin', '1', '1553840081', '1553912097', '1', '0.00', '迁坟', '', '12', '0', '1', '1');
INSERT INTO `ky_finance` VALUES ('308', 'CW20190329021441', '4', '106', '1', '3', null, null, '1553840087', '2', '123.00', '123.00', '0.00', null, '1', 'admin', '1', '1553840081', '1553912097', '1', '123.00', '单张黑白烤瓷', '', '14', '0', '1', '1');
INSERT INTO `ky_finance` VALUES ('309', 'CW20190329021441', '4', '106', '1', '3', null, null, '1553840087', '2', '0.00', '0.00', '0.00', null, '1', 'admin', '1', '1553840081', '1553912097', '1', '0.00', '墓穴维修', '', '13', '0', '1', '1');
INSERT INTO `ky_finance` VALUES ('310', 'CW20190329021441', '4', '106', '1', '3', null, null, '1553840087', '2', '0.00', '0.00', '0.00', null, '1', 'admin', '1', '1553840081', '1553912097', '1', '0.00', '单张彩色烤瓷 ', '', '15', '0', '1', '1');
INSERT INTO `ky_finance` VALUES ('311', 'CW20190329021441', '4', '106', '1', '3', null, null, '1553840087', '2', '0.00', '0.00', '0.00', null, '1', 'admin', '1', '1553840081', '1553912097', '1', '0.00', '黑白合照烤瓷', '', '16', '0', '1', '1');
INSERT INTO `ky_finance` VALUES ('312', 'CW20190329021441', '4', '106', '1', '3', null, null, '1553840087', '2', '0.00', '0.00', '0.00', null, '1', 'admin', '1', '1553840081', '1553912097', '1', '0.00', '彩色合照烤瓷 ', '', '17', '0', '1', '1');
INSERT INTO `ky_finance` VALUES ('313', 'CW20190329021441', '4', '106', '1', '3', null, null, '1553840087', '2', '0.00', '0.00', '0.00', null, '1', 'admin', '1', '1553840081', '1553912097', '1', '0.00', '安葬礼仪', '', '6', '0', '1', '1');
INSERT INTO `ky_finance` VALUES ('314', 'CW20190329021441', '4', '106', '1', '3', null, null, '1553840087', '2', '0.00', '0.00', '0.00', null, '1', 'admin', '1', '1553840081', '1553912097', '1', '0.00', '锣鼓乐队', '', '7', '0', '1', '1');
INSERT INTO `ky_finance` VALUES ('315', 'CW20190329021441', '4', '106', '1', '3', null, null, '1553840087', '2', '0.00', '0.00', '0.00', null, '1', 'admin', '1', '1553840081', '1553912097', '1', '0.00', '瓷像安装', '', '18', '0', '1', '1');
INSERT INTO `ky_finance` VALUES ('316', 'CW20190329021441', '4', '106', '1', '3', null, null, '1553840087', '2', '0.00', '0.00', '0.00', null, '1', 'admin', '1', '1553840081', '1553912097', '1', '0.00', '骨灰坛', '', '20', '0', '1', '1');
INSERT INTO `ky_finance` VALUES ('317', 'CW20190329021441', '4', '106', '1', '3', null, null, '1553840087', '2', '0.00', '0.00', '0.00', null, '1', 'admin', '1', '1553840081', '1553912097', '1', '0.00', '绿化维护', '', '3', '0', '1', '1');

-- ----------------------------
-- Table structure for ky_grade
-- ----------------------------
DROP TABLE IF EXISTS `ky_grade`;
CREATE TABLE `ky_grade` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `vcdesc` text,
  `status` tinyint(4) DEFAULT '1' COMMENT '1可用 0禁用',
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ky_grade
-- ----------------------------
INSERT INTO `ky_grade` VALUES ('5', '程序员', '完成程序开发', '1', '1550047069', '1550047069');
INSERT INTO `ky_grade` VALUES ('6', '国防生的空间刚开始', '四大皆空估计萨克管', '-1', '1550047460', '1550047471');
INSERT INTO `ky_grade` VALUES ('7', '121212', '地方归属感', '1', '1550047494', '1550047609');

-- ----------------------------
-- Table structure for ky_hook
-- ----------------------------
DROP TABLE IF EXISTS `ky_hook`;
CREATE TABLE `ky_hook` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(40) NOT NULL DEFAULT '' COMMENT '钩子名称',
  `describe` varchar(255) NOT NULL COMMENT '描述',
  `addon_list` varchar(255) NOT NULL DEFAULT '' COMMENT '钩子挂载的插件 ''，''分割',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 COMMENT='钩子表';

-- ----------------------------
-- Records of ky_hook
-- ----------------------------
INSERT INTO `ky_hook` VALUES ('36', 'File', '文件上传钩子', 'File', '1', '0', '0');
INSERT INTO `ky_hook` VALUES ('37', 'Icon', '图标选择钩子', 'Icon', '1', '0', '0');
INSERT INTO `ky_hook` VALUES ('38', 'ArticleEditor', '富文本编辑器', 'Editor', '1', '0', '0');

-- ----------------------------
-- Table structure for ky_invoice
-- ----------------------------
DROP TABLE IF EXISTS `ky_invoice`;
CREATE TABLE `ky_invoice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `beginno` varchar(50) DEFAULT NULL,
  `endno` varchar(50) DEFAULT NULL,
  `currno` varchar(50) DEFAULT NULL,
  `isstate` tinyint(2) DEFAULT NULL,
  `member` varchar(255) DEFAULT NULL,
  `membername` varchar(255) DEFAULT NULL,
  `vcnote` text,
  `status` tinyint(4) DEFAULT '1' COMMENT '1可用 -1禁用',
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ky_invoice
-- ----------------------------
INSERT INTO `ky_invoice` VALUES ('8', '08100', '08150', '08100', '1', '28,24,23', '张兰兰,王玲,王全霞', '描述', '1', '1550639848', '1550720280');
INSERT INTO `ky_invoice` VALUES ('9', '081003', '081007', '081003', '1', '28,24', '张兰兰,王玲', 'sdsdasd', '-1', '1550720383', '1550720389');
INSERT INTO `ky_invoice` VALUES ('10', '4001', '4050', '4001', '1', '28', '张兰兰', 'sdfds', '1', '1550823566', '1550823566');
INSERT INTO `ky_invoice` VALUES ('11', '3343', '34344', '3343', '1', '29', 'sdfsf', ' 毒贩夫妇', '1', '1551232229', '1551232229');
INSERT INTO `ky_invoice` VALUES ('12', '3434', '343444', '3434', '1', '29', 'sdfsf', '是的发的所发生的', '1', '1551232322', '1551232322');
INSERT INTO `ky_invoice` VALUES ('13', '333', '444', '333', '1', '29', 'sdfsf', '水电费的说法', '1', '1551232410', '1551232420');

-- ----------------------------
-- Table structure for ky_jxccategory
-- ----------------------------
DROP TABLE IF EXISTS `ky_jxccategory`;
CREATE TABLE `ky_jxccategory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` mediumint(9) unsigned NOT NULL DEFAULT '0',
  `name` varchar(40) NOT NULL,
  `vcdesc` text,
  `status` tinyint(4) DEFAULT '1' COMMENT '1可用 0禁用',
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ky_jxccategory
-- ----------------------------
INSERT INTO `ky_jxccategory` VALUES ('4', '0', '数码', '数码', '1', '1536493193', '1536493193');
INSERT INTO `ky_jxccategory` VALUES ('5', '4', '手机 ', '手机 ', '1', '1536493280', '1536493679');

-- ----------------------------
-- Table structure for ky_jxccustome
-- ----------------------------
DROP TABLE IF EXISTS `ky_jxccustome`;
CREATE TABLE `ky_jxccustome` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `sn` varchar(40) NOT NULL,
  `name` varchar(40) NOT NULL,
  `contact` varchar(20) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `email` varchar(40) NOT NULL,
  `fax` varchar(20) NOT NULL,
  `address` varchar(40) NOT NULL,
  `storageid` int(11) DEFAULT NULL COMMENT '仓库ID',
  `vcdesc` mediumtext,
  `status` tinyint(4) DEFAULT '1' COMMENT '1可用 0禁用',
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`) USING BTREE,
  UNIQUE KEY `sn` (`sn`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='客户';

-- ----------------------------
-- Records of ky_jxccustome
-- ----------------------------
INSERT INTO `ky_jxccustome` VALUES ('3', '客户编号', ' 客户名称', ' 联系人', 'dsfds', 'dsf', 'sdf', 'dfdsf', '9', 'sdfds', '-1', '1536501443', '1536501474');

-- ----------------------------
-- Table structure for ky_jxcproduct
-- ----------------------------
DROP TABLE IF EXISTS `ky_jxcproduct`;
CREATE TABLE `ky_jxcproduct` (
  `id` mediumint(9) unsigned NOT NULL AUTO_INCREMENT,
  `sn` varchar(40) NOT NULL,
  `name` varchar(20) NOT NULL,
  `nbsn` varchar(40) DEFAULT NULL,
  `cjsn` varchar(40) DEFAULT NULL,
  `category` int(4) DEFAULT NULL,
  `storage` varchar(20) DEFAULT NULL,
  `unit` int(4) DEFAULT NULL,
  `supplier` int(4) DEFAULT NULL,
  `spec` varchar(40) DEFAULT NULL COMMENT '规格',
  `price` decimal(10,2) unsigned DEFAULT NULL,
  `num` mediumint(9) unsigned NOT NULL DEFAULT '0' COMMENT '数量',
  `vcdesc` text,
  `status` tinyint(4) DEFAULT '1' COMMENT '1可用 0禁用',
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='产品';

-- ----------------------------
-- Records of ky_jxcproduct
-- ----------------------------
INSERT INTO `ky_jxcproduct` VALUES ('10', 'sn334343t', '香炉t', '3434t', '3434334t', '5', null, '4', '4', '方法t', '43.00', '0', '似懂非懂是', '-1', '1536654938', '1536655292');

-- ----------------------------
-- Table structure for ky_jxcstorage
-- ----------------------------
DROP TABLE IF EXISTS `ky_jxcstorage`;
CREATE TABLE `ky_jxcstorage` (
  `id` mediumint(9) unsigned NOT NULL AUTO_INCREMENT,
  `sn` varchar(40) NOT NULL COMMENT '编号',
  `name` varchar(40) NOT NULL COMMENT '名字',
  `contact` varchar(16) NOT NULL,
  `phone` varchar(12) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `vcdesc` mediumtext,
  `status` tinyint(4) DEFAULT '1' COMMENT '1可用 0禁用',
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `sn` (`sn`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='仓库管理';

-- ----------------------------
-- Records of ky_jxcstorage
-- ----------------------------
INSERT INTO `ky_jxcstorage` VALUES ('8', 'fds', 'sdfdsfsd', 'sdfds', 'sdfdsf', 'sdfdsf', 'sdfdsfd', '-1', '1536496719', '1536497029');
INSERT INTO `ky_jxcstorage` VALUES ('9', 'ck001', '1号仓库', '434343', '3434343', '谁发的所发生的', 'sdfdsfd', '1', '1536496988', '1536496988');

-- ----------------------------
-- Table structure for ky_jxcsupplier
-- ----------------------------
DROP TABLE IF EXISTS `ky_jxcsupplier`;
CREATE TABLE `ky_jxcsupplier` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `sn` varchar(40) NOT NULL,
  `name` varchar(40) NOT NULL,
  `contact` varchar(20) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `email` varchar(40) NOT NULL,
  `fax` varchar(20) NOT NULL,
  `address` varchar(40) NOT NULL,
  `storageid` int(11) DEFAULT NULL COMMENT '仓库ID',
  `vcdesc` mediumtext,
  `status` tinyint(4) DEFAULT '1' COMMENT '1可用 0禁用',
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`) USING BTREE,
  UNIQUE KEY `sn` (`sn`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='供应商';

-- ----------------------------
-- Records of ky_jxcsupplier
-- ----------------------------
INSERT INTO `ky_jxcsupplier` VALUES ('4', '5a6b0e0a2eaad', ' 供应商名称', '34343', '3434343', 'sdfsd@dfdfd.com', '传真', '宜昌市', '9', '描述', '1', '1536499982', '1536654843');

-- ----------------------------
-- Table structure for ky_jxcunit
-- ----------------------------
DROP TABLE IF EXISTS `ky_jxcunit`;
CREATE TABLE `ky_jxcunit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `vcdesc` text,
  `status` tinyint(4) DEFAULT '1' COMMENT '1可用 0禁用',
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ky_jxcunit
-- ----------------------------
INSERT INTO `ky_jxcunit` VALUES ('3', '个', '55', '1', '1536410190', '1536410878');
INSERT INTO `ky_jxcunit` VALUES ('4', '套', '', '1', '1536654713', '1536654713');

-- ----------------------------
-- Table structure for ky_light
-- ----------------------------
DROP TABLE IF EXISTS `ky_light`;
CREATE TABLE `ky_light` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderNO` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `tid` int(11) DEFAULT NULL,
  `cid` int(10) DEFAULT NULL,
  `buyer` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `isok` tinyint(1) DEFAULT '0',
  `amount` int(2) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT '0.00' COMMENT ' 退回金额',
  `lightplanid` int(11) DEFAULT NULL COMMENT '实际收到的金额',
  `voiceno` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `vcnote` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `operater` int(11) DEFAULT NULL,
  `operatername` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `isstory` tinyint(1) DEFAULT '0',
  `lightpaytype` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of ky_light
-- ----------------------------
INSERT INTO `ky_light` VALUES ('10', 'CW20190321011131', '41', '3', '张三', '13986818455', '1', '1', '100.00', '20190322', '', '的所发生的', null, null, '-1', '1553145091', '1553152277', '0', null);
INSERT INTO `ky_light` VALUES ('11', 'CW20190321011247', '42', '3', '张三', '13986818455', '1', '1', '100.00', '20190323', '', '', null, null, '1', '1553145167', '1553152277', '0', null);
INSERT INTO `ky_light` VALUES ('12', 'CW20190321011406', '43', '3', '多福多寿', '市水电费', '1', '3', '100.00', '20190315', '4343433', '似懂非懂是', null, null, '-1', '1553145246', '1553152277', '0', null);
INSERT INTO `ky_light` VALUES ('13', 'CW20190321011958', '47', '3', '是的发生的', '3433', '1', '4', '100.00', '20190323', ' 发票号码', '备注', null, null, '1', '1553145598', '1553152277', '0', null);
INSERT INTO `ky_light` VALUES ('14', 'CW20190328040707', '94', '5', '双方都', '13986818455 ', '1', '1', '100.00', '6', '', '', null, null, '-1', '1553760427', '1553911495', '1', '1');
INSERT INTO `ky_light` VALUES ('15', 'CW20190328040729', '95', '5', '双方都', '13986818455 ', '1', '1', '100.00', '6', '', '', null, null, '-1', '1553760449', '1553911495', '1', '1');
INSERT INTO `ky_light` VALUES ('16', 'CW20190328043429', '96', '5', '双方都', '13986818455 ', '1', '4', '100.00', '6', '', '', null, null, '-1', '1553762069', '1553911495', '1', '1');
INSERT INTO `ky_light` VALUES ('17', 'CW20190328044139', '97', '5', '双方都', '13986818455 ', '1', '3', '100.00', '6', '', '', null, null, '-1', '1553762499', '1553911495', '1', '1');
INSERT INTO `ky_light` VALUES ('18', 'CW20190328044204', '98', '5', '双方都', '13986818455 ', '1', '4', '100.00', '6', '', '', null, null, '1', '1553762524', '1553911495', '1', '1');

-- ----------------------------
-- Table structure for ky_lightplan
-- ----------------------------
DROP TABLE IF EXISTS `ky_lightplan`;
CREATE TABLE `ky_lightplan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `planname` varchar(40) NOT NULL,
  `begindate` int(11) DEFAULT NULL,
  `enddate` int(11) DEFAULT NULL,
  `vcdesc` text,
  `status` tinyint(4) DEFAULT '1' COMMENT '1可用 0禁用',
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`planname`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ky_lightplan
-- ----------------------------
INSERT INTO `ky_lightplan` VALUES ('6', '2019年度春节点灯', '1551369600', '1579622400', '此灯费为2020年1月24日-2020年2月8日春节(2019年农历春节)亮灯费用', '1', null, null);

-- ----------------------------
-- Table structure for ky_linkman
-- ----------------------------
DROP TABLE IF EXISTS `ky_linkman`;
CREATE TABLE `ky_linkman` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sellID` int(11) DEFAULT NULL,
  `linkname` varchar(255) CHARACTER SET utf8 NOT NULL,
  `relation` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `phone` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `job` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `address` varchar(500) CHARACTER SET utf8 DEFAULT NULL,
  `sex` tinyint(1) DEFAULT NULL,
  `vcnote` text CHARACTER SET utf8,
  `linkstatus` int(1) NOT NULL DEFAULT '1',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `cid` int(11) DEFAULT NULL,
  `orderNO` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `sfz` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of ky_linkman
-- ----------------------------
INSERT INTO `ky_linkman` VALUES ('14', null, '张三', '母女', '13986818455 ', '工作单位', '宜昌市隆康路39号', '1', null, '1', '-1', '1553306708', '1553912097', '4', 'CW20190329021441', null);
INSERT INTO `ky_linkman` VALUES ('15', null, '鼎折覆餗', '是的发生的', '水电费', null, '第三方士大夫', '1', null, '1', '-1', '1553307548', '1553912097', '4', 'CW20190323102130', null);
INSERT INTO `ky_linkman` VALUES ('16', null, '双方都', '母子', '13986818455', '的水电费的说法的', '宜昌市隆康路39号', '1', null, '1', '-1', '1553325561', '1553911495', '5', 'CW20190329020316', null);
INSERT INTO `ky_linkman` VALUES ('17', null, '他依托一体', '', '4545  ', null, '', '1', null, '1', '-1', '1553325588', '1553675869', '6', 'CW20190326020804', null);
INSERT INTO `ky_linkman` VALUES ('18', null, ' 东方闪电1', '343', '是的发生的', null, '', '1', null, '1', '1', '1553325746', '1553325746', '11', 'CW20190323032225', null);
INSERT INTO `ky_linkman` VALUES ('19', null, '张三', '父子', '13986818455 ', ' 	 工作单位', '宜昌市隆康路39号', '1', null, '1', '-1', '1553326116', '1553675869', '6', 'CW20190326022151', null);
INSERT INTO `ky_linkman` VALUES ('20', null, '风格的风格', '', '4545454', null, '', '1', null, '1', '1', '1553328246', '1553328246', '18', 'CW20190323040404', null);
INSERT INTO `ky_linkman` VALUES ('21', null, '45454', '454454', '454', null, '', '1', null, '1', '1', '1553328266', '1553328266', '16', 'CW20190323040426', null);
INSERT INTO `ky_linkman` VALUES ('22', null, '454', '454544', '454', null, '', '1', null, '1', '1', '1553328299', '1553328299', '13', 'CW20190323040459', null);
INSERT INTO `ky_linkman` VALUES ('23', null, '史蒂夫', '34343', '34343 ', '343', '宜昌市隆康路39号', '1', null, '1', '1', '1553690366', '1553693092', '7', 'CW20190327092320', null);
INSERT INTO `ky_linkman` VALUES ('24', null, '张三dasd', '母女', '13986818455', null, null, '1', null, '1', '-1', '1553838623', '1553912097', '4', null, null);

-- ----------------------------
-- Table structure for ky_member
-- ----------------------------
DROP TABLE IF EXISTS `ky_member`;
CREATE TABLE `ky_member` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `userno` varchar(20) DEFAULT NULL,
  `nickname` char(50) NOT NULL DEFAULT '' COMMENT '昵称',
  `username` char(16) NOT NULL DEFAULT '' COMMENT '用户名',
  `password` char(32) NOT NULL DEFAULT '' COMMENT '密码',
  `email` char(32) NOT NULL DEFAULT '' COMMENT '用户邮箱',
  `mobile` char(15) NOT NULL DEFAULT '' COMMENT '用户手机',
  `branch` int(10) DEFAULT NULL COMMENT '部门表ID',
  `sex` varchar(10) DEFAULT NULL COMMENT '性别 ',
  `grade` varchar(100) DEFAULT NULL,
  `gradename` varchar(255) DEFAULT NULL,
  `office` varchar(255) DEFAULT NULL,
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '用户状态',
  `leader_id` int(10) unsigned NOT NULL DEFAULT '1' COMMENT '上级会员ID',
  `is_share_member` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否共享会员',
  `is_inside` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否为后台使用者',
  `is_business` tinyint(1) NOT NULL DEFAULT '0',
  `module` varchar(20) DEFAULT NULL,
  `icno` varchar(30) DEFAULT NULL,
  `storageid` int(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 COMMENT='会员表';

-- ----------------------------
-- Records of ky_member
-- ----------------------------
INSERT INTO `ky_member` VALUES ('1', null, 'admin', 'admin', 'cce1026d81d89071f2bf9c4940e4d800', 'yczhj2007@126.com', '18555550710', '1', '1', null, null, '123123', '1553906257', '1521528175', '1', '0', '0', '1', '0', 'admin', null, '0');
INSERT INTO `ky_member` VALUES ('20', '00002', '汪正武', '汪正武', 'cce1026d81d89071f2bf9c4940e4d800', '222sdfds@dsfds.com', '18602766271', '34', '1', '', null, '', '1536630586', '1529478063', '1', '1', '0', '1', '0', 'admin', '', '0');
INSERT INTO `ky_member` VALUES ('21', '001', '曾云利', '曾云利', 'cce1026d81d89071f2bf9c4940e4d800', '', '18120343521', '24', '2', '', null, '', '1553818047', '1533360397', '1', '1', '0', '1', '1', 'admin', '', '0');
INSERT INTO `ky_member` VALUES ('22', '003', '刘德兰', '刘德兰', 'cce1026d81d89071f2bf9c4940e4d800', 'sdfsd@dfdfd.com', '18942989817', '24', '2', '', null, '沙市区殡仪馆', '1547296410', '1533360473', '1', '1', '0', '1', '1', 'admin', '', '0');
INSERT INTO `ky_member` VALUES ('23', '002', '王全霞', '王全霞', 'cce1026d81d89071f2bf9c4940e4d800', '1028901468@.qq.com', '18972381659', '24', '2', '', null, '', '1549786539', '1533540568', '1', '1', '0', '1', '1', 'admin', '', '0');
INSERT INTO `ky_member` VALUES ('24', '004', '王玲', '王玲', 'cce1026d81d89071f2bf9c4940e4d800', '', '13797480490', '24', '女', '会计', null, '财务室', '1534048916', '1534048916', '1', '1', '0', '1', '0', 'admin', '', '0');
INSERT INTO `ky_member` VALUES ('25', '00001', '陈益', '陈益', 'cce1026d81d89071f2bf9c4940e4d800', '', '13656589888', '34', '1', '', null, '', '1536630511', '1536630444', '1', '1', '0', '1', '0', 'admin', '', '0');
INSERT INTO `ky_member` VALUES ('26', '00003', '陈美秋', '陈美秋', 'cce1026d81d89071f2bf9c4940e4d800', '', '18806869999', '34', '男', '', null, '', '1536630711', '1536630711', '1', '1', '0', '1', '0', 'admin', '', '0');
INSERT INTO `ky_member` VALUES ('27', '00004', '李冰', '李冰', 'cce1026d81d89071f2bf9c4940e4d800', '', '17771636555', '34', '男', '', null, '', '1536630801', '1536630801', '1', '1', '0', '1', '0', 'admin', '', '0');
INSERT INTO `ky_member` VALUES ('28', '005', '张兰兰', '张兰兰', 'cce1026d81d89071f2bf9c4940e4d800', '', '18368850972', '24', '女', '', null, '', '1549675762', '1544842640', '1', '1', '0', '1', '1', 'admin', '', '0');
INSERT INTO `ky_member` VALUES ('29', 'sfdsdf', 'sdfsf', 'sdfsf', 'cce1026d81d89071f2bf9c4940e4d800', 'sfsdf', 'sfdsf', '35', '0', '5,7', '程序员,121212', '', '1550126858', '1550126559', '1', '1', '0', '1', '1', 'admin', 'sfds', '0');

-- ----------------------------
-- Table structure for ky_menu
-- ----------------------------
DROP TABLE IF EXISTS `ky_menu`;
CREATE TABLE `ky_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文档ID',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '菜单名称',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级分类ID',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序（同级有效）',
  `module` char(20) NOT NULL DEFAULT '' COMMENT '模块',
  `url` char(255) NOT NULL DEFAULT '' COMMENT '链接地址',
  `is_hide` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否隐藏',
  `is_shortcut` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否快捷操作',
  `icon` char(30) NOT NULL DEFAULT '' COMMENT '图标',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=293 DEFAULT CHARSET=utf8 COMMENT='菜单表';

-- ----------------------------
-- Records of ky_menu
-- ----------------------------
INSERT INTO `ky_menu` VALUES ('1', '系统首页', '0', '1', 'admin', 'index/index', '0', '0', 'fa-home', '1', '1520506753', '0');
INSERT INTO `ky_menu` VALUES ('16', '人员管理', '0', '3', 'admin', 'member/index', '0', '0', 'fa-users', '1', '1549952032', '0');
INSERT INTO `ky_menu` VALUES ('17', '人员列表', '16', '1', 'admin', 'member/memberlist', '0', '1', 'fa-list', '1', '1549952059', '0');
INSERT INTO `ky_menu` VALUES ('27', '权限管理', '16', '3', 'admin', 'auth/grouplist', '0', '0', 'fa-key', '1', '1520505512', '0');
INSERT INTO `ky_menu` VALUES ('32', '权限组编辑', '27', '0', 'admin', 'auth/groupedit', '1', '0', '', '1', '1492002620', '0');
INSERT INTO `ky_menu` VALUES ('34', '授权', '27', '0', 'admin', 'auth_manager/group', '1', '0', '', '1', '0', '0');
INSERT INTO `ky_menu` VALUES ('35', '菜单授权', '27', '0', 'admin', 'auth/menuauth', '1', '0', '', '1', '1492095653', '0');
INSERT INTO `ky_menu` VALUES ('36', '会员授权', '27', '0', 'admin', 'auth_manager/memberaccess', '1', '0', '', '1', '0', '0');
INSERT INTO `ky_menu` VALUES ('68', '系统管理', '0', '5', 'admin', 'config/group', '0', '0', 'fa-wrench', '1', '1553171692', '0');
INSERT INTO `ky_menu` VALUES ('69', '系统设置', '68', '3', 'admin', 'config/setting', '0', '0', 'fa-cogs', '1', '1520505460', '0');
INSERT INTO `ky_menu` VALUES ('70', '配置管理', '68', '2', 'admin', 'config/index', '0', '0', 'fa-cog', '1', '1520505457', '0');
INSERT INTO `ky_menu` VALUES ('71', '配置编辑', '70', '0', 'admin', 'config/configedit', '1', '0', '', '1', '1491674180', '0');
INSERT INTO `ky_menu` VALUES ('72', '配置删除', '70', '0', 'admin', 'config/configDel', '1', '0', '', '1', '1491674201', '0');
INSERT INTO `ky_menu` VALUES ('73', '配置添加', '70', '0', 'admin', 'config/configadd', '0', '0', 'fa-plus', '1', '1491666947', '0');
INSERT INTO `ky_menu` VALUES ('75', '菜单管理', '68', '1', 'admin', 'menu/index', '0', '0', 'fa-th-large', '1', '1553146214', '0');
INSERT INTO `ky_menu` VALUES ('98', '菜单编辑', '75', '0', 'admin', 'menu/menuedit', '1', '0', '', '1', '1512459021', '0');
INSERT INTO `ky_menu` VALUES ('124', '菜单列表', '75', '0', 'admin', 'menu/menulist', '0', '0', 'fa-list', '1', '1553131835', '0');
INSERT INTO `ky_menu` VALUES ('125', '菜单添加', '75', '0', 'admin', 'menu/menuadd', '0', '0', 'fa-plus', '1', '1491318307', '0');
INSERT INTO `ky_menu` VALUES ('126', '配置列表', '70', '0', 'admin', 'config/configlist', '0', '1', 'fa-list', '1', '1491666890', '1491666890');
INSERT INTO `ky_menu` VALUES ('127', '菜单状态', '75', '0', 'admin', 'menu/setstatus', '1', '0', '', '1', '1520506673', '1491674128');
INSERT INTO `ky_menu` VALUES ('128', '权限组添加', '27', '0', 'admin', 'auth/groupadd', '1', '0', '', '1', '1492002635', '1492002635');
INSERT INTO `ky_menu` VALUES ('134', '授权', '17', '0', 'admin', 'member/memberauth', '1', '0', '', '1', '1492238568', '1492101426');
INSERT INTO `ky_menu` VALUES ('135', '回收站', '68', '4', 'admin', 'trash/trashlist', '0', '0', ' fa-recycle', '1', '1520505468', '1492311462');
INSERT INTO `ky_menu` VALUES ('136', '回收站数据', '135', '0', 'admin', 'trash/trashdatalist', '1', '0', 'fa-database', '1', '1492319477', '1492319392');
INSERT INTO `ky_menu` VALUES ('140', '服务管理', '68', '5', 'admin', 'service/servicelist', '0', '0', 'fa-server', '1', '1520505473', '1492352972');
INSERT INTO `ky_menu` VALUES ('141', '插件管理', '68', '6', 'admin', 'addon/index', '0', '0', 'fa-puzzle-piece', '1', '1520505475', '1492427605');
INSERT INTO `ky_menu` VALUES ('142', '钩子列表', '141', '0', 'admin', 'addon/hooklist', '0', '0', 'fa-anchor', '1', '1492427665', '1492427665');
INSERT INTO `ky_menu` VALUES ('143', '插件列表', '141', '0', 'admin', 'addon/addonlist', '0', '0', 'fa-list', '1', '1492428116', '1492427838');
INSERT INTO `ky_menu` VALUES ('144', '文章管理', '0', '6', 'admin', 'article/index', '0', '0', 'fa-edit', '1', '1553171763', '1492480187');
INSERT INTO `ky_menu` VALUES ('145', '文章列表', '144', '0', 'admin', 'article/articlelist', '0', '0', 'fa-list', '1', '1551231409', '1492480245');
INSERT INTO `ky_menu` VALUES ('146', '文章分类', '144', '0', 'admin', 'article/articlecategorylist', '0', '0', 'fa-list', '1', '1492480359', '1492480342');
INSERT INTO `ky_menu` VALUES ('147', '文章分类编辑', '146', '0', 'admin', 'article/articlecategoryedit', '1', '0', '', '1', '1492485294', '1492485294');
INSERT INTO `ky_menu` VALUES ('148', '分类添加', '144', '0', 'admin', 'article/articlecategoryadd', '0', '0', 'fa-plus', '1', '1492486590', '1492486576');
INSERT INTO `ky_menu` VALUES ('149', '文章添加', '144', '0', 'admin', 'article/articleadd', '0', '0', 'fa-plus', '1', '1492518453', '1492518453');
INSERT INTO `ky_menu` VALUES ('150', '文章编辑', '145', '0', 'admin', 'article/articleedit', '1', '0', '', '1', '1492879589', '1492879589');
INSERT INTO `ky_menu` VALUES ('151', '插件安装', '143', '0', 'admin', 'addon/addoninstall', '1', '0', '', '1', '1492879763', '1492879763');
INSERT INTO `ky_menu` VALUES ('152', '插件卸载', '143', '0', 'admin', 'addon/addonuninstall', '1', '0', '', '1', '1492879789', '1492879789');
INSERT INTO `ky_menu` VALUES ('153', '文章删除', '145', '0', 'admin', 'article/articledel', '1', '0', '', '1', '1492879960', '1492879960');
INSERT INTO `ky_menu` VALUES ('154', '文章分类删除', '146', '0', 'admin', 'article/articlecategorydel', '1', '0', '', '1', '1492879995', '1492879995');
INSERT INTO `ky_menu` VALUES ('156', '驱动安装', '140', '0', 'admin', 'service/driverinstall', '1', '0', '', '1', '1502267009', '1502267009');
INSERT INTO `ky_menu` VALUES ('157', '接口管理', '0', '5', 'admin', 'api/index', '0', '0', 'fa fa-book', '1', '1520506753', '1504000434');
INSERT INTO `ky_menu` VALUES ('158', '分组管理', '157', '0', 'admin', 'api/apigrouplist', '0', '0', 'fa fa-fw fa-th-list', '1', '1504000977', '1504000723');
INSERT INTO `ky_menu` VALUES ('159', '分组添加', '157', '0', 'admin', 'api/apigroupadd', '0', '0', 'fa fa-fw fa-plus', '1', '1504004646', '1504004646');
INSERT INTO `ky_menu` VALUES ('160', '分组编辑', '157', '0', 'admin', 'api/apigroupedit', '1', '0', '', '1', '1504004710', '1504004710');
INSERT INTO `ky_menu` VALUES ('161', '分组删除', '157', '0', 'admin', 'api/apigroupdel', '1', '0', '', '1', '1504004732', '1504004732');
INSERT INTO `ky_menu` VALUES ('162', '接口列表', '157', '0', 'admin', 'api/apilist', '0', '0', 'fa fa-fw fa-th-list', '1', '1504172326', '1504172326');
INSERT INTO `ky_menu` VALUES ('163', '接口添加', '157', '0', 'admin', 'api/apiadd', '0', '0', 'fa fa-fw fa-plus', '1', '1504172352', '1504172352');
INSERT INTO `ky_menu` VALUES ('164', '接口编辑', '157', '0', 'admin', 'api/apiedit', '1', '0', '', '1', '1504172414', '1504172414');
INSERT INTO `ky_menu` VALUES ('165', '接口删除', '157', '0', 'admin', 'api/apidel', '1', '0', '', '1', '1504172435', '1504172435');
INSERT INTO `ky_menu` VALUES ('166', '优化维护', '0', '6', 'admin', 'maintain/index', '0', '0', 'fa-legal', '1', '1520506753', '1505387256');
INSERT INTO `ky_menu` VALUES ('168', '数据库', '166', '0', 'admin', 'maintain/database', '0', '0', 'fa-database', '1', '1505539670', '1505539394');
INSERT INTO `ky_menu` VALUES ('169', '数据备份', '168', '0', 'admin', 'database/databackup', '0', '0', 'fa-download', '1', '1506309900', '1505539428');
INSERT INTO `ky_menu` VALUES ('170', '数据还原', '168', '0', 'admin', 'database/datarestore', '0', '0', 'fa-exchange', '1', '1506309911', '1505539492');
INSERT INTO `ky_menu` VALUES ('171', '文件清理', '166', '0', 'admin', 'fileclean/cleanlist', '0', '0', 'fa-file', '1', '1506310152', '1505788517');
INSERT INTO `ky_menu` VALUES ('174', '行为日志', '166', '0', 'admin', 'log/loglist', '0', '0', 'fa-street-view', '1', '1551230839', '1507200836');
INSERT INTO `ky_menu` VALUES ('203', '友情链接', '68', '7', 'admin', 'blogroll/index', '0', '0', 'fa-link', '1', '1520505723', '1520505717');
INSERT INTO `ky_menu` VALUES ('204', '链接列表', '203', '0', 'admin', 'blogroll/blogrolllist', '0', '0', 'fa-th', '1', '1520505777', '1520505777');
INSERT INTO `ky_menu` VALUES ('205', '链接添加', '203', '0', 'admin', 'blogroll/blogrolladd', '0', '0', 'fa-plus', '1', '1520505826', '1520505826');
INSERT INTO `ky_menu` VALUES ('206', '链接编辑', '203', '0', 'admin', 'blogroll/blogrolledit', '1', '0', 'fa-edit', '1', '1520505863', '1520505863');
INSERT INTO `ky_menu` VALUES ('207', '链接删除', '203', '0', 'admin', 'blogroll/blogrolldel', '1', '0', 'fa-minus', '1', '1520505889', '1520505889');
INSERT INTO `ky_menu` VALUES ('208', '菜单排序', '75', '0', 'admin', 'menu/setsort', '1', '0', '', '1', '1520506696', '1520506696');
INSERT INTO `ky_menu` VALUES ('210', '修改密码', '1', '2', 'admin', 'member/editpassword', '1', '0', 'fa-edit', '1', '1520505510', '0');
INSERT INTO `ky_menu` VALUES ('211', '个人设置', '0', '10', 'admin', 'member/hrminfo', '0', '0', 'fa-male', '1', '1549951577', '1549950674');
INSERT INTO `ky_menu` VALUES ('214', '部门管理', '16', '2', 'admin', 'branch/branchlist', '0', '0', 'fa-edit', '1', '1549952110', '1549952110');
INSERT INTO `ky_menu` VALUES ('215', '人员添加', '17', '2', 'admin', 'member/memberadd', '1', '0', 'fa-plus', '1', '1549953089', '1549952902');
INSERT INTO `ky_menu` VALUES ('216', '人员删除', '17', '3', 'admin', 'member/memberDel', '1', '0', 'fa-remove', '1', '1549953096', '1549952936');
INSERT INTO `ky_menu` VALUES ('217', '人员编辑', '17', '4', 'admin', 'member/memberEdit', '1', '0', 'fa-edit', '1', '1549953103', '1549952968');
INSERT INTO `ky_menu` VALUES ('218', '人员导出', '17', '6', 'admin', 'member/exportMemberList', '1', '0', 'fa-list', '1', '1549953118', '1549953002');
INSERT INTO `ky_menu` VALUES ('219', '重置密码', '17', '5', 'admin', 'member/memberReset', '1', '0', 'fa-sign-in', '1', '1549953111', '1549953028');
INSERT INTO `ky_menu` VALUES ('220', '公墓管理', '0', '3', 'admin', 'cemetery/index', '0', '0', '', '1', '1550039561', '1550039561');
INSERT INTO `ky_menu` VALUES ('221', '墓园列表', '220', '0', 'admin', 'CemeteryGarden/CemeteryGardenList', '0', '0', '', '1', '1550039598', '1550039598');
INSERT INTO `ky_menu` VALUES ('222', '岗位管理', '16', '2', 'admin', 'grade/gradelist', '0', '0', '', '1', '1550126913', '1550044480');
INSERT INTO `ky_menu` VALUES ('223', '墓位类型列表', '220', '1', 'admin', 'CemeteryType/CemeteryTypeList', '0', '0', '', '1', '1550112554', '1550112554');
INSERT INTO `ky_menu` VALUES ('224', '墓园新增界面', '221', '0', 'admin', 'CemeteryGarden/cemeteryGardenAdd_ajax_show', '1', '0', 'fa-plus', '1', '1550125899', '1550125189');
INSERT INTO `ky_menu` VALUES ('225', '墓园修改界面', '221', '1', 'admin', 'CemeteryGarden/cemeteryGardenEdit_ajax_show', '1', '0', '', '1', '1550126001', '1550126001');
INSERT INTO `ky_menu` VALUES ('226', '墓园删除', '221', '2', 'admin', 'CemeteryGarden/cemeteryGardenDel', '1', '0', '', '1', '1550126497', '1550126177');
INSERT INTO `ky_menu` VALUES ('227', '墓位类型新增页面', '223', '0', 'admin', 'CemeteryType/cemeteryTypeAdd_ajax_show', '1', '0', 'fa-plus', '1', '1550126635', '1550126635');
INSERT INTO `ky_menu` VALUES ('228', '墓位类型编辑页面', '223', '1', 'admin', 'CemeteryType/cemeteryTypeEdit_ajax_show', '1', '0', '', '1', '1550126743', '1550126720');
INSERT INTO `ky_menu` VALUES ('229', '墓位类型删除', '223', '2', 'admin', 'CemeteryType/cemeteryTypeDel', '1', '0', '', '1', '1550126827', '1550126808');
INSERT INTO `ky_menu` VALUES ('230', '岗位增加', '222', '0', 'admin', 'Grade/GradeAdd', '1', '0', 'fa-star', '1', '1550127040', '1550126974');
INSERT INTO `ky_menu` VALUES ('231', '岗位修改', '222', '0', 'admin', 'Grade/GradeEdit', '1', '0', '', '1', '1550127028', '1550127028');
INSERT INTO `ky_menu` VALUES ('232', '岗位删除', '222', '0', 'admin', 'Grade/GradeDel', '1', '0', '', '1', '1550127086', '1550127072');
INSERT INTO `ky_menu` VALUES ('233', '墓区列表', '220', '2', 'admin', 'CemeteryArea/CemeteryAreaList', '0', '0', '', '1', '1550213402', '1550131116');
INSERT INTO `ky_menu` VALUES ('234', '墓区新增页面', '233', '0', 'admin', 'CemeteryArea/cemeteryAreaAdd_ajax_show', '1', '0', 'fa-plus', '1', '1550133358', '1550133358');
INSERT INTO `ky_menu` VALUES ('235', '墓区编辑页面', '233', '1', 'admin', 'CemeteryArea/cemeteryAreaEdit_ajax_show', '1', '0', '', '1', '1550133413', '1550133397');
INSERT INTO `ky_menu` VALUES ('236', '墓区删除', '233', '2', 'admin', 'CemeteryArea/cemeteryAreaDel', '1', '0', '', '1', '1550208758', '1550133476');
INSERT INTO `ky_menu` VALUES ('237', '服务收费设置', '0', '4', 'admin', 'serviveinfo/list', '0', '0', '', '1', '1553171754', '1550199445');
INSERT INTO `ky_menu` VALUES ('238', '服务项目', '237', '1', 'admin', 'serviceinfo/serviceinfolist', '0', '0', '', '1', '1550199568', '1550199568');
INSERT INTO `ky_menu` VALUES ('239', '墓穴样式列表', '220', '3', 'admin', 'CemeteryStyle/CemeteryStyleList', '0', '0', '', '1', '1550213385', '1550212988');
INSERT INTO `ky_menu` VALUES ('240', '墓穴样式新增页面', '239', '0', 'admin', 'CemeteryStyle/cemeteryStyleAdd_ajax_show', '1', '0', '', '1', '1550218235', '1550218102');
INSERT INTO `ky_menu` VALUES ('241', '墓穴样式修改页面', '239', '1', 'admin', 'CemeteryStyle/cemeteryStyleEdit_ajax_show', '1', '0', '', '1', '1550218191', '1550218191');
INSERT INTO `ky_menu` VALUES ('242', '墓穴样式删除', '239', '2', 'admin', 'CemeteryStyle/cemeteryStyleDel', '1', '0', '', '1', '1550218332', '1550218332');
INSERT INTO `ky_menu` VALUES ('243', '测试', '68', '10', 'admin', 'test/index', '0', '0', '', '1', '1550218857', '1550218857');
INSERT INTO `ky_menu` VALUES ('244', '墓穴列表', '220', '4', 'admin', 'Cemetery/CemeteryList', '0', '0', '', '1', '1550219088', '1550218938');
INSERT INTO `ky_menu` VALUES ('245', '增加服务项目', '238', '1', 'admin', 'Serviceinfo/ServiceinfoAdd_ajax_show', '1', '0', '', '1', '1550287847', '1550286460');
INSERT INTO `ky_menu` VALUES ('246', '修改服务项目', '238', '3', 'admin', 'Serviceinfo/ServiceinfoEdit_ajax_show', '1', '0', '', '1', '1550287872', '1550287809');
INSERT INTO `ky_menu` VALUES ('247', '删除服务项目', '238', '3', 'admin', 'Serviceinfo/ServiceinfoDel', '1', '0', '', '1', '1550304574', '1550287946');
INSERT INTO `ky_menu` VALUES ('248', '服务套餐', '237', '2', 'admin', 'Combo/ComboList', '0', '0', 'fa-book', '1', '1550300245', '1550300232');
INSERT INTO `ky_menu` VALUES ('249', '服务项目排序', '238', '4', 'admin', 'Serviceinfo/setSort', '1', '0', 'fa-gear', '1', '1550304688', '1550304620');
INSERT INTO `ky_menu` VALUES ('250', '增加服务套餐', '248', '1', 'admin', 'Combo/ComboAdd_ajax_show', '1', '0', '', '1', '1550304777', '1550304777');
INSERT INTO `ky_menu` VALUES ('251', '修改服务套餐', '248', '2', 'admin', 'Combo/Comboedit_ajax_submit', '1', '0', '', '1', '1550304822', '1550304822');
INSERT INTO `ky_menu` VALUES ('252', '删除服务套餐', '248', '3', 'admin', 'Combo/ComboDel', '1', '0', 'fa-times', '1', '1550304909', '1550304859');
INSERT INTO `ky_menu` VALUES ('253', '服务套餐排序', '248', '4', 'admin', 'Combo/setSort', '1', '0', '', '1', '1550304919', '1550304897');
INSERT INTO `ky_menu` VALUES ('254', '收费项目', '237', '3', 'admin', 'Chargeitem/ChargeitemList', '0', '0', '', '1', '1550459153', '1550458654');
INSERT INTO `ky_menu` VALUES ('255', '增加收费项目', '254', '0', 'admin', 'Chargeitem/ChargeitemAdd_show_ajax', '1', '0', 'fa-th-large', '1', '1550459454', '1550459454');
INSERT INTO `ky_menu` VALUES ('256', '编辑收费项目', '254', '0', 'admin', 'Chargeitem/ChargeitemEdit_ajax_show', '1', '0', 'fa-th-list', '1', '1550562334', '1550561956');
INSERT INTO `ky_menu` VALUES ('257', '删除收费项目', '254', '0', 'admin', 'Chargeitem/ChargeitemDel', '1', '0', '', '1', '1550562844', '1550562844');
INSERT INTO `ky_menu` VALUES ('258', '收费项目排序', '254', '0', 'admin', 'Chargeitem/setSort', '1', '0', '', '1', '1550562947', '1550562947');
INSERT INTO `ky_menu` VALUES ('259', '发票管理', '237', '4', 'admin', 'Invoice/InvoiceList', '0', '0', 'fa-file-o', '1', '1550629632', '1550629625');
INSERT INTO `ky_menu` VALUES ('260', '增加发票信息', '259', '1', 'admin', 'Invoice/InvoiceAdd_show_ajax', '1', '0', '', '1', '1550632982', '1550632982');
INSERT INTO `ky_menu` VALUES ('261', '修改发票信息', '259', '2', 'admin', 'Invoice/InvoiceEdit_ajax_show', '1', '0', '', '1', '1550633008', '1550633008');
INSERT INTO `ky_menu` VALUES ('262', '删除发票信息', '259', '3', 'admin', 'Invoice/InvoiceDel', '1', '0', '', '1', '1550633241', '1550633038');
INSERT INTO `ky_menu` VALUES ('263', '墓穴管理', '0', '2', 'admin', 'manage/list', '1', '0', 'fa-book', '1', '1553171683', '1551231707');
INSERT INTO `ky_menu` VALUES ('264', '业务大厅', '280', '0', 'admin', 'manage/index', '0', '1', '', '1', '1553171399', '1551231749');
INSERT INTO `ky_menu` VALUES ('265', '公墓预定管理', '263', '0', 'admin', 'Schedule/ScheduleList', '0', '0', 'fa-align-justify', '1', '1551335489', '1551335489');
INSERT INTO `ky_menu` VALUES ('266', '预定增加', '265', '0', 'admin', 'Schedule/ScheduleAdd_ajax_show', '1', '0', '', '1', '1551335536', '1551335536');
INSERT INTO `ky_menu` VALUES ('267', '寄存管理', '0', '3', 'admin', 'save/savelist1', '0', '0', 'fa-clock-o', '1', '1551512219', '1551509946');
INSERT INTO `ky_menu` VALUES ('268', '寄存位置管理', '267', '0', 'admin', 'Savearea/SaveareaList', '0', '0', 'fa-tags', '1', '1551510963', '1551510003');
INSERT INTO `ky_menu` VALUES ('269', '寄存管理', '267', '0', 'admin', 'Save/Savelist', '1', '0', 'fa-clock-o', '1', '1553172156', '1551512271');
INSERT INTO `ky_menu` VALUES ('270', '寄存位置增加', '268', '0', 'admin', 'Savearea/SaveareaAdd', '1', '0', 'fa-check', '1', '1551512344', '1551512344');
INSERT INTO `ky_menu` VALUES ('271', '寄存位置编辑', '268', '0', 'admin', 'Savearea/SaveareaEdit', '1', '0', '', '1', '1551512374', '1551512374');
INSERT INTO `ky_menu` VALUES ('272', '寄存位置删除', '268', '0', 'admin', 'Savearea/SaveareaDel', '1', '0', '', '1', '1551512435', '1551512435');
INSERT INTO `ky_menu` VALUES ('273', '寄存信息添加', '267', '0', 'admin', 'save/Save_ajax_show', '1', '0', '', '1', '1551856438', '1551856438');
INSERT INTO `ky_menu` VALUES ('274', '寄存信息编辑', '267', '0', 'admin', 'save/Save_edit_ajax', '1', '0', '', '1', '1551856490', '1551856460');
INSERT INTO `ky_menu` VALUES ('275', '寄存信息删除', '267', '0', 'admin', 'save/Save_delete_ajax', '1', '0', '', '1', '1551856500', '1551856480');
INSERT INTO `ky_menu` VALUES ('276', '寄存结算打印', '267', '0', 'admin', 'save/Save_pay_ajax', '1', '0', '', '1', '1551856702', '1551856702');
INSERT INTO `ky_menu` VALUES ('277', '寄存取走', '267', '0', 'admin', 'save/Save_take_ajax', '1', '0', '', '1', '1553172115', '1551856735');
INSERT INTO `ky_menu` VALUES ('278', '公墓销售列表', '263', '0', 'admin', 'Sell/SellList', '0', '0', 'fa-list', '1', '1552095220', '1551857119');
INSERT INTO `ky_menu` VALUES ('279', '购墓信息增加', '264', '0', 'admin', 'Bury/Bury_ajax_show', '1', '0', 'fa-user', '1', '1553171528', '1551857226');
INSERT INTO `ky_menu` VALUES ('280', '工作中心', '0', '2', 'admin', 'job/index.php', '0', '0', 'fa-wrench', '1', '1553171700', '1553002346');
INSERT INTO `ky_menu` VALUES ('281', '优惠申请审批', '280', '1', 'admin', 'Preferential/PreferentialList', '1', '0', '', '1', '1553171846', '1553002526');
INSERT INTO `ky_menu` VALUES ('282', '退费申请审批', '280', '0', 'admin', 'Cancel/CancelList', '0', '0', 'fa-repeat', '1', '1553002572', '1553002572');
INSERT INTO `ky_menu` VALUES ('283', '退费申请', '282', '0', 'admin', 'Cancel/show_Cancel_sq_ajax', '1', '0', '', '1', '1553002895', '1553002895');
INSERT INTO `ky_menu` VALUES ('284', '退费处理', '282', '0', 'admin', 'Cancel/show_cancell_cl_ajax', '1', '0', '', '1', '1553006235', '1553006235');
INSERT INTO `ky_menu` VALUES ('285', '申请删除', '282', '0', 'admin', 'Cancel/canacel_delete_ajax', '1', '0', '', '1', '1553055076', '1553052913');
INSERT INTO `ky_menu` VALUES ('286', '墓主管理', '264', '0', 'admin', 'Bury/deather_add_show', '1', '0', '', '1', '1553071737', '1553071704');
INSERT INTO `ky_menu` VALUES ('287', '墓主删除', '264', '0', 'admin', 'Bury/deather_delete_ajax', '1', '0', '', '1', '1553074860', '1553074848');
INSERT INTO `ky_menu` VALUES ('288', '点灯服务', '264', '0', 'admin', 'Light/LightList', '1', '0', '', '1', '1553171442', '1553131458');
INSERT INTO `ky_menu` VALUES ('289', '增加点灯记录', '264', '0', 'admin', 'Light/show_Light_ajax', '1', '0', '', '1', '1553131759', '1553131494');
INSERT INTO `ky_menu` VALUES ('290', '删除点灯服务', '264', '0', 'admin', 'Light/Light_delete_ajax', '1', '0', 'fa-cog', '1', '1553171891', '1553146349');
INSERT INTO `ky_menu` VALUES ('291', '作废申请审批', '280', '3', 'admin', 'Retrunprice/RetrunpriceList', '0', '0', 'fa-times-circle', '1', '1553781833', '1553781833');
INSERT INTO `ky_menu` VALUES ('292', '作废审批处理', '291', '0', 'admin', 'Retrunprice/show_Retrunprice_cl_ajax', '0', '0', '', '-1', '1553818626', '1553818577');

-- ----------------------------
-- Table structure for ky_monumen
-- ----------------------------
DROP TABLE IF EXISTS `ky_monumen`;
CREATE TABLE `ky_monumen` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderNO` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `tid` int(11) NOT NULL,
  `cid` int(11) NOT NULL,
  `monumenttype` int(4) DEFAULT NULL,
  `monumenprice` decimal(10,2) DEFAULT '0.00',
  `monumenstyle` tinyint(1) DEFAULT '1',
  `opertype` tinyint(1) DEFAULT '1',
  `phototype` int(4) DEFAULT NULL,
  `photoamount` tinyint(1) DEFAULT '1',
  `photoprice` decimal(10,2) DEFAULT '0.00',
  `buyer` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `phone` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `monumendate` date DEFAULT NULL,
  `vcdesc` text CHARACTER SET utf8,
  `amountprice` decimal(10,2) DEFAULT '0.00',
  `seller` int(4) DEFAULT NULL,
  `sellname` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `buryname` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `isstory` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of ky_monumen
-- ----------------------------
INSERT INTO `ky_monumen` VALUES ('1', 'CW20190327103214', '84', '6', '1', '0.00', '3', '1', null, '1', '0.00', '张三', '13986818455  ', '2019-03-27', '', '0.00', '1', 'admin', '-1', '1553653934', '1553654929', '', '1');
INSERT INTO `ky_monumen` VALUES ('2', 'CW20190327104918', '85', '6', '1', '34030.00', '1', '1', null, '1', '0.00', '他依托一体', '4545   ', '2019-03-27', '', '0.00', '1', 'admin', '1', '1553654958', '1553656211', '', '1');
INSERT INTO `ky_monumen` VALUES ('3', 'CW20190327114800', '86', '6', '1', '0.00', '2', '1', null, '1', '0.00', '张三', '13986818455  ', '2019-03-27', '', '0.00', '1', 'admin', '1', '1553658480', null, '地方,434', '1');
INSERT INTO `ky_monumen` VALUES ('4', 'CW20190327115124', '87', '6', '1', '0.00', '2', '1', null, '1', '0.00', '他依托一体', '4545   ', '2019-03-27', '', '0.00', '1', 'admin', '-1', '1553658684', '1553658715', '', '1');
INSERT INTO `ky_monumen` VALUES ('5', 'CW20190327115242', '88', '6', '1', '0.00', '1', '1', null, '1', '0.00', '他依托一体', '4545   ', '2019-03-27', '', '0.00', '1', 'admin', '1', '1553658762', null, '地方,434', '1');
INSERT INTO `ky_monumen` VALUES ('6', 'CW20190327093435', '93', '5', '1', '0.00', '1', '1', null, '1', '0.00', '双方都', '13986818455 ', '2019-03-27', '', '0.00', '1', 'admin', '1', '1553693675', '1553911495', '张三', '1');

-- ----------------------------
-- Table structure for ky_monumendetail
-- ----------------------------
DROP TABLE IF EXISTS `ky_monumendetail`;
CREATE TABLE `ky_monumendetail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `monumenid` int(11) NOT NULL,
  `call` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `vcname` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `birthday` int(11) DEFAULT NULL,
  `deathday` int(11) DEFAULT NULL,
  `wordstyle` int(11) DEFAULT NULL,
  `wordamount` int(4) DEFAULT NULL,
  `wordpriece` decimal(10,2) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of ky_monumendetail
-- ----------------------------

-- ----------------------------
-- Table structure for ky_monumenttype
-- ----------------------------
DROP TABLE IF EXISTS `ky_monumenttype`;
CREATE TABLE `ky_monumenttype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `typename` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `sellprice` decimal(10,2) DEFAULT NULL,
  `vcnote` text CHARACTER SET utf8,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of ky_monumenttype
-- ----------------------------

-- ----------------------------
-- Table structure for ky_move
-- ----------------------------
DROP TABLE IF EXISTS `ky_move`;
CREATE TABLE `ky_move` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) DEFAULT NULL,
  `buyer` varchar(50) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `movedate` date DEFAULT NULL,
  `movestatus` tinyint(1) DEFAULT '1',
  `vcdesc` text,
  `operater` int(11) DEFAULT NULL,
  `operatername` varchar(50) DEFAULT NULL,
  `status` tinyint(4) DEFAULT '1' COMMENT '1可用 0禁用',
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ky_move
-- ----------------------------
INSERT INTO `ky_move` VALUES ('5', '5', '双方都', '13986818455', '2019-03-30', '1', '大方的说法是', '1', 'admin', '1', '1553847620', '1553848479');
INSERT INTO `ky_move` VALUES ('6', '5', '双方都', '13986818455}', '2019-03-29', '1', '大方的说法是', '1', 'admin', '1', '1553847645', null);
INSERT INTO `ky_move` VALUES ('7', '5', '双方都', '13986818455}', '2019-03-29', '1', '', '1', 'admin', '1', '1553847681', null);
INSERT INTO `ky_move` VALUES ('8', '5', '双方都', '13986818455}', '2019-03-29', '2', '大幅度上升到', '1', 'admin', '1', '1553847720', '1553911495');
INSERT INTO `ky_move` VALUES ('9', '5', '双方都', '13986818455}', '2019-03-29', '2', '大幅度上升到', '1', 'admin', '1', '1553847737', '1553909809');
INSERT INTO `ky_move` VALUES ('10', '5', '双方都', '13986818455}', '2019-03-29', '1', '大幅度上升到', '1', 'admin', '-1', '1553847817', '1553848429');
INSERT INTO `ky_move` VALUES ('11', '5', '双方都', '13986818455}', '2019-03-29', '1', '大幅度上升到', '1', 'admin', '-1', '1553847824', '1553848414');
INSERT INTO `ky_move` VALUES ('12', '4', '张三', '13986818455 }', '2019-03-30', '2', '', '1', 'admin', '1', '1553912090', '1553912097');

-- ----------------------------
-- Table structure for ky_picture
-- ----------------------------
DROP TABLE IF EXISTS `ky_picture`;
CREATE TABLE `ky_picture` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id自增',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '图片名称',
  `path` varchar(255) NOT NULL DEFAULT '' COMMENT '路径',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '图片链接',
  `sha1` char(40) NOT NULL DEFAULT '' COMMENT '文件 sha1编码',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=198 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='图片表';

-- ----------------------------
-- Records of ky_picture
-- ----------------------------
INSERT INTO `ky_picture` VALUES ('194', 'e80c683e6d86479e41d4d23112dcaef8.jpg', '20190216/e80c683e6d86479e41d4d23112dcaef8.jpg', '', '1f7a602a6e493a53a07008990877ae4b8e38aa40', '1550299341', '1550299341', '1');
INSERT INTO `ky_picture` VALUES ('195', '3e39e1f9404217d1c761e9e7783da100.jpg', '20190216/3e39e1f9404217d1c761e9e7783da100.jpg', '', '319dc70e2c7b38987fd0d26c36f76053303b336e', '1550300612', '1550300612', '1');
INSERT INTO `ky_picture` VALUES ('196', '0a0a573f690e7d0810209632ce66945c.jpg', '20190216/0a0a573f690e7d0810209632ce66945c.jpg', '', 'c25fa031d860ea9338ef3ae1d2930286aa3665d2', '1550302865', '1550302865', '1');
INSERT INTO `ky_picture` VALUES ('197', '2abcce855d8cf5845056855f71f25b16.jpg', '20190216/2abcce855d8cf5845056855f71f25b16.jpg', '', 'f0dd65b21b762042d01ee9b93c352069f6eeee39', '1550303114', '1550303114', '1');

-- ----------------------------
-- Table structure for ky_preferential
-- ----------------------------
DROP TABLE IF EXISTS `ky_preferential`;
CREATE TABLE `ky_preferential` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sellid` int(11) DEFAULT NULL,
  `vcdesc` varchar(500) DEFAULT NULL,
  `isok` tinyint(1) DEFAULT '0' COMMENT '0: 未处理1:  同意优惠 2：不同意优惠',
  `manager` int(11) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `vcnote` varchar(500) DEFAULT NULL,
  `dobegindate` int(11) DEFAULT NULL,
  `operater` int(11) DEFAULT NULL,
  `operatername` varchar(10) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `ratio` decimal(10,0) DEFAULT NULL COMMENT '  折扣率',
  PRIMARY KEY (`id`),
  KEY `ss` (`sellid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of ky_preferential
-- ----------------------------

-- ----------------------------
-- Table structure for ky_product
-- ----------------------------
DROP TABLE IF EXISTS `ky_product`;
CREATE TABLE `ky_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` tinyint(1) DEFAULT '1',
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `name` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `Unit` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `Price` decimal(10,2) DEFAULT NULL,
  `Specifications` varchar(200) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of ky_product
-- ----------------------------

-- ----------------------------
-- Table structure for ky_prooffile
-- ----------------------------
DROP TABLE IF EXISTS `ky_prooffile`;
CREATE TABLE `ky_prooffile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sellid` int(11) DEFAULT NULL,
  `cid` int(11) DEFAULT NULL,
  `filetype` int(11) DEFAULT NULL,
  `filepath` varchar(255) DEFAULT NULL,
  `filestep` int(11) DEFAULT '1' COMMENT '1 图片  2文件',
  `status` tinyint(4) DEFAULT '1',
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of ky_prooffile
-- ----------------------------

-- ----------------------------
-- Table structure for ky_retrunprice
-- ----------------------------
DROP TABLE IF EXISTS `ky_retrunprice`;
CREATE TABLE `ky_retrunprice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) DEFAULT NULL,
  `tid` int(11) DEFAULT NULL,
  `returndesc` varchar(500) DEFAULT NULL,
  `manager` int(11) DEFAULT NULL,
  `isok` tinyint(1) DEFAULT NULL,
  `buyer` varchar(50) DEFAULT NULL,
  `phone` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `vcnote` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `dobegindate` int(11) DEFAULT NULL,
  `operater` int(11) DEFAULT NULL,
  `operatername` varchar(255) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `returnprice` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of ky_retrunprice
-- ----------------------------
INSERT INTO `ky_retrunprice` VALUES ('1', '5', '98', '21', '21', '2', null, null, '谁发的所发生的', '1553820105', '1', 'admin', '1', '1553781603', '1553820101', null);

-- ----------------------------
-- Table structure for ky_save
-- ----------------------------
DROP TABLE IF EXISTS `ky_save`;
CREATE TABLE `ky_save` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderNO` varchar(50) DEFAULT NULL,
  `tid` int(11) DEFAULT NULL,
  `cid` int(11) DEFAULT NULL,
  `buyer` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `relation` varchar(40) CHARACTER SET utf8 DEFAULT NULL,
  `phone` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `deathname` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  `sex` varchar(10) CHARACTER SET utf8 DEFAULT NULL,
  `death` int(11) DEFAULT NULL,
  `savebegindate` int(11) DEFAULT NULL,
  `saveenddate` int(11) DEFAULT NULL,
  `saveareaid` int(10) DEFAULT NULL,
  `saveprice` decimal(10,2) DEFAULT NULL,
  `vcnote` text CHARACTER SET utf8,
  `operater` int(11) DEFAULT NULL,
  `operatename` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `canceloper` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `canceldate` date DEFAULT NULL,
  `orderstate` tinyint(1) DEFAULT NULL,
  `savestatus` tinyint(4) DEFAULT '1',
  `status` tinyint(1) DEFAULT '1',
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of ky_save
-- ----------------------------
INSERT INTO `ky_save` VALUES ('13', 'CW20190321055557', '58', '3', '张三', '多岁的', '13986818455', '宜昌市隆康路39号', '大方的说法', null, null, '1553097600', '1553702400', '7', '200.00', '', null, null, 'admin', '2019-03-21', null, '2', '1', '1553162157', '1553162184');
INSERT INTO `ky_save` VALUES ('14', 'CW20190323094749', '59', '4', '似懂非懂是', '似懂非懂', '的是非得失', ' 发', '第三方', null, null, '1553270400', '1553961600', '7', '0.00', '', null, null, null, null, null, '1', '-1', '1553305669', '1553305759');
INSERT INTO `ky_save` VALUES ('15', 'CW20190323095048', '60', '4', '张三', '343', '13986818455', '宜昌市隆康路39号', '3434', null, null, '1553270400', '1553875200', '7', '100.00', '', null, null, 'admin', '2019-03-23', null, '2', '1', '1553305848', '1553305863');
INSERT INTO `ky_save` VALUES ('16', 'CW20190323095415', '61', '4', '张三', 'sdfsd', '13986818455', '宜昌市隆康路39号', 'fsd', null, null, '1553270400', '1553875200', '7', '100.00', '', null, null, null, null, null, '1', '-1', '1553306055', '1553839074');
INSERT INTO `ky_save` VALUES ('17', 'CW20190323101800', '62', '4', '张三', '母女', '13986818455', '宜昌市隆康路39号', '是否', null, null, '1553270400', '1553875200', '7', '100.00', '', null, null, null, null, null, '1', '1', '1553307480', null);
INSERT INTO `ky_save` VALUES ('18', 'CW20190323101907', '64', '4', '鼎折覆餗', '是的发生的', '水电费', '第三方士大夫', '1212', null, null, '1553097600', '1553270400', '7', '112.00', '', null, null, null, null, null, '1', '-1', '1553307547', '1553839078');
INSERT INTO `ky_save` VALUES ('19', 'CW20190323102130', '65', '4', '鼎折覆餗', '是的发生的', '水电费', '第三方士大夫', '344', null, null, '1553270400', '1553875200', '7', '100.00', '', null, null, null, null, null, '1', '-1', '1553307690', '1553307700');
INSERT INTO `ky_save` VALUES ('20', 'CW20190329093855', '99', '5', '双方都', '母子', '13986818455', '宜昌市隆康路39号', 'dfds', null, null, '1553788800', '1554393600', '7', '100.00', '', null, null, null, null, null, '1', '-1', '1553823535', '1553838981');
INSERT INTO `ky_save` VALUES ('21', 'CW20190329113502', '102', '4', '张三dasd', '母女', '13986818455', '', '343', null, null, '1553788800', '1554393600', '7', '560.00', '', null, null, 'admin', '2019-03-29', null, '2', '1', '1553830502', '1553839903');
INSERT INTO `ky_save` VALUES ('22', 'CW20190329013926', '103', '5', '双方都', '母子', '13986818455', '', 'sdf', null, null, '1553788800', '1554393600', '7', '100.00', 'dsfsdfds', null, null, null, null, null, '1', '-1', '1553837966', '1553838994');
INSERT INTO `ky_save` VALUES ('23', 'CW20190329015326', '104', '5', '双方都', '母子', '13986818455', '', '3433', null, null, '1553788800', '1554393600', '7', '200.00', '', null, null, null, null, null, '1', '-1', '1553838806', '1553839046');
INSERT INTO `ky_save` VALUES ('24', 'CW20190329020316', '105', '5', '双方都', '母子', '13986818455', '', 'SSD', null, null, '1553788800', '1554393600', '7', '100.00', '3434', null, null, null, null, null, '1', '1', '1553839396', null);

-- ----------------------------
-- Table structure for ky_savearea
-- ----------------------------
DROP TABLE IF EXISTS `ky_savearea`;
CREATE TABLE `ky_savearea` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `vcdesc` text,
  `status` tinyint(4) DEFAULT '1' COMMENT '1可用 0禁用',
  `sort` int(11) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ky_savearea
-- ----------------------------
INSERT INTO `ky_savearea` VALUES ('6', '寄存1室013', '寄存1室013', '-1', '123', '1551511290', '1551511722');
INSERT INTO `ky_savearea` VALUES ('7', '第三方', '水电费的说法', '1', '10', '1551511937', '1551511937');

-- ----------------------------
-- Table structure for ky_schedule
-- ----------------------------
DROP TABLE IF EXISTS `ky_schedule`;
CREATE TABLE `ky_schedule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderNO` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `cid` int(11) DEFAULT NULL,
  `buyer` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `relation` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `phone` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `email` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `sfz` varchar(32) CHARACTER SET utf8 DEFAULT NULL,
  `sex` tinyint(1) DEFAULT NULL,
  `ordainbegin` int(11) DEFAULT NULL,
  `ordainend` int(11) DEFAULT NULL,
  `ordaintype` int(4) DEFAULT NULL,
  `ordainprice` decimal(10,2) DEFAULT NULL,
  `vcdesc` varchar(200) CHARACTER SET utf8 DEFAULT NULL,
  `orderstatus` tinyint(2) DEFAULT NULL,
  `seller` int(11) DEFAULT NULL,
  `sellname` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `operid` int(11) DEFAULT NULL,
  `opername` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `canceldate` int(11) DEFAULT NULL,
  `cancelhrm` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `cancelnote` text CHARACTER SET utf8,
  PRIMARY KEY (`id`),
  KEY `state` (`orderstatus`) USING BTREE,
  KEY `type` (`cid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of ky_schedule
-- ----------------------------
INSERT INTO `ky_schedule` VALUES ('3', 'DD20190302120549', '3', '第三方对方', '逝者关系', '联系电话', '34343@dfds.com', '宜昌市隆康路39号', '身份证', '1', '1551456000', '1552665600', '2', '110.00', '', '1', '21', '曾云利', '1', 'admin', '1', '1551499549', '1553258024', null, null, null);
INSERT INTO `ky_schedule` VALUES ('5', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '1', '1553257442', '1553257442', null, null, null);
INSERT INTO `ky_schedule` VALUES ('13', 'CW20190322105804', '4', '张三', '母女', '13986818455', '34343@dfds.com', '宜昌市隆康路39号', '223223', '1', '1553184000', '1553788800', '2', '0.00', '', '1', '0', '无', '1', 'admin', '1', '1553266685', '1553306812', null, null, null);
INSERT INTO `ky_schedule` VALUES ('14', 'CW20190323031920', '5', '双方都', '', '13986818455', '', '', '55454', '1', '1553270400', '1553875200', '2', '0.00', '', '1', '0', '无', '1', 'admin', '1', '1553325561', '1553325561', null, null, null);
INSERT INTO `ky_schedule` VALUES ('15', 'CW20190323031947', '6', '他依托一体', '', '4545', '45454', '', '', '1', '1553270400', '1553875200', '2', '0.00', '', '1', '0', '无', '1', 'admin', '1', '1553325588', '1553325588', null, null, null);
INSERT INTO `ky_schedule` VALUES ('16', 'CW20190323032225', '11', ' 东方闪电1', '343', '是的发生的', '34343@dfds.com', '', '34343', '1', '1553270400', '1553875200', '2', '0.00', '', '1', '0', '无', '1', 'admin', '1', '1553325746', '1553325746', null, null, null);
INSERT INTO `ky_schedule` VALUES ('17', 'CW20190323040404', '18', '风格的风格', '', '4545454', '', '', '45454454', '1', '1553270400', '1553875200', '2', '0.00', '', '1', '0', '无', '1', 'admin', '1', '1553328245', '1553328245', null, null, null);
INSERT INTO `ky_schedule` VALUES ('18', 'CW20190323040426', '16', '45454', '454454', '454', '', '', '4545', '1', '1553270400', '1553875200', '2', '0.00', '', '1', '0', '无', '1', 'admin', '1', '1553328266', '1553328266', null, null, null);
INSERT INTO `ky_schedule` VALUES ('19', 'CW20190323040459', '13', '454', '454544', '454', '', '', '454', '1', '1553270400', '1553875200', '2', '0.00', '', '1', '0', '无', '1', 'admin', '1', '1553328299', '1553328299', null, null, null);

-- ----------------------------
-- Table structure for ky_sell
-- ----------------------------
DROP TABLE IF EXISTS `ky_sell`;
CREATE TABLE `ky_sell` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderNO` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `cid` int(11) DEFAULT NULL,
  `bid` int(11) DEFAULT NULL,
  `buyer` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `relation` varchar(40) CHARACTER SET utf8 DEFAULT NULL,
  `phone` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `job` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `sfz` varchar(32) CHARACTER SET utf8 DEFAULT NULL,
  `sex` tinyint(1) DEFAULT NULL,
  `orderbegin` date DEFAULT NULL,
  `orderend` date DEFAULT NULL,
  `vcdesc` varchar(200) CHARACTER SET utf8 DEFAULT NULL,
  `orderstatus` tinyint(2) DEFAULT NULL,
  `seller` int(11) DEFAULT NULL,
  `sellname` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `isvoice` tinyint(1) DEFAULT '0',
  `paytype` tinyint(1) DEFAULT '1',
  `financetype` int(4) DEFAULT NULL,
  `payvarchar` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `buryname` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `isstory` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `state` (`orderstatus`) USING BTREE,
  KEY `type` (`cid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of ky_sell
-- ----------------------------
INSERT INTO `ky_sell` VALUES ('1', 'CW20190318021731', '3', '0', '张三', '父子', '13986818455', '水电费', '宜昌市隆康路39号', null, '1', '2019-03-20', '2039-03-18', '1', '2', '1', 'admin', '1', '1552889851', '1553152277', '0', '1', '1', null, null, '0');
INSERT INTO `ky_sell` VALUES ('2', 'CW20190318021827', '3', '1', '张三', '父子', '13986818455', '水电费', '宜昌市隆康路39号', null, '1', '2019-03-18', '2019-03-18', '', '2', '1', 'admin', '-1', '1552889907', '1553152277', '0', '1', '4', null, null, '0');
INSERT INTO `ky_sell` VALUES ('11', 'CW20190318041511', '3', '1', '张三', '父子', '13986818455', '水电费', '宜昌市隆康路39号', null, '1', '2019-03-18', '2019-03-18', '', '2', '1', 'admin', '1', '1552896911', '1553152277', '0', '1', '4', null, null, '0');
INSERT INTO `ky_sell` VALUES ('12', 'CW20190319084807', '3', '0', '张三', '', '13986818455', '水电费', '宜昌市隆康路39号', null, '1', '2019-03-19', '2019-03-19', '', '1', '1', 'admin', '1', '1552999687', '1553152277', '1', '1', '6', null, null, '0');
INSERT INTO `ky_sell` VALUES ('14', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '-1', '1553059184', '1553059140', '0', '1', null, null, null, '0');
INSERT INTO `ky_sell` VALUES ('21', 'CW20190320023115', '3', '0', '张三', '', '13986818455', '水电费', '宜昌市隆康路39号', null, '1', '2019-03-20', '2019-03-20', '', '2', '21', '曾云利', '1', '1553063475', '1553152277', '1', '1', '6', null, null, '0');
INSERT INTO `ky_sell` VALUES ('22', 'CW20190320094303', '3', '0', '张三', '父子', '13986818455', '水电费', '宜昌市隆康路39号', null, '1', '2019-03-20', '2019-03-20', '', '2', '1', 'admin', '1', '1553089383', '1553152277', '0', '1', '5', null, null, '0');
INSERT INTO `ky_sell` VALUES ('23', 'CW20190320094431', '3', '0', '张三', '父子', '13986818455', '水电费', '宜昌市隆康路39号', null, '1', '2019-03-20', '2019-03-20', '', '2', '1', 'admin', '1', '1553089471', '1553152277', '0', '1', '5', null, null, '0');
INSERT INTO `ky_sell` VALUES ('24', 'CW20190320094529', '3', '0', '张三', '父子', '13986818455', '水电费', '宜昌市隆康路39号', null, '1', '2019-03-20', '2019-03-20', '', '2', '1', 'admin', '1', '1553089529', '1553152277', '0', '1', '5', null, null, '0');
INSERT INTO `ky_sell` VALUES ('25', null, '3', null, '张三', null, '13986818455', null, null, null, null, null, null, null, null, null, null, '1', '1553089550', '1553152277', '0', '1', null, null, null, '0');
INSERT INTO `ky_sell` VALUES ('26', 'CW20190320094615', '3', '0', '张三', '父子', '13986818455', '水电费', '宜昌市隆康路39号', null, '1', '2019-03-20', '2019-03-20', '', '2', '1', 'admin', '1', '1553089575', '1553152277', '0', '1', '5', null, null, '0');
INSERT INTO `ky_sell` VALUES ('27', null, '3', null, '张三', null, '13986818455', null, null, null, null, null, null, null, null, null, null, '1', '1553089660', '1553152277', '0', '1', null, null, null, '0');
INSERT INTO `ky_sell` VALUES ('28', 'CW20190320095735', '3', '0', '张三', '父子', '13986818455', '水电费', '宜昌市隆康路39号', null, '1', '2019-03-20', '2019-03-20', '', '2', '1', 'admin', '1', '1553090255', '1553152277', '0', '1', '5', null, null, '0');
INSERT INTO `ky_sell` VALUES ('29', null, '3', null, '张三', null, '13986818455', null, null, null, null, null, null, null, null, null, null, '1', '1553090256', '1553152277', '0', '1', null, null, null, '0');
INSERT INTO `ky_sell` VALUES ('30', 'CW20190320100845', '3', '0', '张三', '父子', '13986818455', '水电费', '宜昌市隆康路39号', null, '1', '2019-03-20', '2019-03-20', '', '2', '1', 'admin', '1', '1553090925', '1553152277', '0', '1', '5', null, null, '0');
INSERT INTO `ky_sell` VALUES ('31', null, '3', null, '张三', null, '13986818455', null, null, null, null, null, null, null, null, null, null, '1', '1553090926', '1553152277', '0', '1', null, null, null, '0');
INSERT INTO `ky_sell` VALUES ('32', 'CW20190320101551', '3', '0', '张三', '父子', '13986818455', '水电费', '宜昌市隆康路39号', null, '1', '2019-03-20', '2019-03-20', '', '2', '1', 'admin', '1', '1553091351', '1553152277', '0', '1', '5', null, null, '0');
INSERT INTO `ky_sell` VALUES ('33', 'CW20190320101628', '3', '0', '张三', '父子', '13986818455', '水电费', '宜昌市隆康路39号', null, '1', '2019-03-20', '2019-03-20', '', '2', '1', 'admin', '1', '1553091388', '1553152277', '0', '1', '5', null, null, '0');
INSERT INTO `ky_sell` VALUES ('34', 'CW20190320101649', '3', '0', '张三', '父子', '13986818455', '水电费', '宜昌市隆康路39号', null, '1', '2019-03-20', '2019-03-20', '', '2', '1', 'admin', '1', '1553091409', '1553152277', '0', '1', '5', null, null, '0');
INSERT INTO `ky_sell` VALUES ('35', 'CW20190320101712', '3', '0', '张三', '父子', '13986818455', '水电费', '宜昌市隆康路39号', null, '1', '2019-03-20', '2019-03-20', '', '2', '1', 'admin', '1', '1553091432', '1553152277', '0', '1', '5', null, null, '0');
INSERT INTO `ky_sell` VALUES ('36', 'CW20190320101746', '3', '0', '张三', '父子', '13986818455', '水电费', '宜昌市隆康路39号', null, '1', '2019-03-20', '2019-03-20', '', '2', '1', 'admin', '1', '1553091466', '1553152277', '0', '1', '5', null, null, '0');
INSERT INTO `ky_sell` VALUES ('37', 'CW20190320101905', '3', '0', '张三', '父子', '13986818455', '水电费', '宜昌市隆康路39号', null, '1', '2019-03-20', '2019-03-20', '', '2', '1', 'admin', '1', '1553091545', '1553152277', '0', '1', '5', null, null, '0');
INSERT INTO `ky_sell` VALUES ('38', 'CW20190320102157', '3', '0', '张三', '父子', '13986818455', '水电费', '宜昌市隆康路39号', null, '1', '2019-03-20', '2019-03-20', '', '2', '1', 'admin', '1', '1553091717', '1553152277', '0', '1', '5', null, null, '0');
INSERT INTO `ky_sell` VALUES ('39', 'CW20190320102504', '3', '0', '张三', '', '13986818455', '水电费', '宜昌市隆康路39号', null, '1', '2019-03-20', '2019-03-20', '', '1', '1', 'admin', '1', '1553091904', '1553152277', '1', '1', '6', null, null, '0');
INSERT INTO `ky_sell` VALUES ('41', 'CW20190321011131', '3', '0', '张三', '父子', '13986818455', '', '', null, '1', '2019-03-21', '2019-03-21', '', '2', '1', 'admin', '-1', '1553145091', '1553152277', '0', '1', '7', null, null, '0');
INSERT INTO `ky_sell` VALUES ('42', 'CW20190321011247', '3', '0', '张三', '', '13986818455', '', '', null, '1', '2019-03-21', '2019-03-21', '', '2', '1', 'admin', '1', '1553145167', '1553152277', '0', '1', '7', null, null, '0');
INSERT INTO `ky_sell` VALUES ('43', 'CW20190321011406', '3', '0', '多福多寿', '', '市水电费', '', '', null, '1', '2019-03-21', '2019-03-21', '', '2', '1', 'admin', '-1', '1553145246', '1553152277', '1', '1', '7', null, null, '0');
INSERT INTO `ky_sell` VALUES ('44', 'CW20190321011845', '3', '0', '是的发生的', '', '3433', '', '', null, '1', '2019-03-21', '2019-03-21', '', '2', '1', 'admin', '1', '1553145525', '1553152277', '1', '1', '7', null, null, '0');
INSERT INTO `ky_sell` VALUES ('45', 'CW20190321011903', '3', '0', '是的发生的', '', '3433', '', '', null, '1', '2019-03-21', '2019-03-21', '', '2', '1', 'admin', '1', '1553145543', '1553152277', '1', '1', '7', null, null, '0');
INSERT INTO `ky_sell` VALUES ('46', 'CW20190321011908', '3', '0', '是的发生的', '', '3433', '', '', null, '1', '2019-03-21', '2019-03-21', '', '2', '1', 'admin', '1', '1553145548', '1553152277', '1', '1', '7', null, null, '0');
INSERT INTO `ky_sell` VALUES ('47', 'CW20190321011958', '3', '0', '是的发生的', '', '3433', '', '', null, '1', '2019-03-21', '2019-03-21', '', '2', '1', 'admin', '1', '1553145598', '1553152277', '1', '1', '7', null, null, '0');
INSERT INTO `ky_sell` VALUES ('48', 'CW20190321030745', '3', '0', '张三', '父子', '13986818455', '', '', null, '1', '2019-03-21', '2019-03-21', '', '2', '1', 'admin', '1', '1553152065', '1553152277', '0', '1', '5', null, null, '0');
INSERT INTO `ky_sell` VALUES ('49', 'CW20190321030842', '3', '0', '张三', '父子', '13986818455', '', '', null, '1', '2019-03-21', '2019-03-21', '', '2', '1', 'admin', '1', '1553152122', null, '0', '1', '5', null, null, '0');
INSERT INTO `ky_sell` VALUES ('50', 'CW20190321030911', '3', '0', '张三', '父子', '13986818455', '', '', null, '1', '2019-03-21', '2019-03-21', '', '2', '1', 'admin', '1', '1553152151', null, '0', '1', '5', null, null, '0');
INSERT INTO `ky_sell` VALUES ('51', 'CW20190321031117', '3', '0', '张三', '父子', '13986818455', '', '', null, '1', '2019-03-21', '2019-03-21', '', '2', '1', 'admin', '1', '1553152277', null, '0', '1', '5', null, null, '0');
INSERT INTO `ky_sell` VALUES ('52', 'CW20190321043834', '3', '0', '佛挡杀佛', '水电费', '0717-6236178', '', '宜昌市夷陵大道181号', null, '1', '2019-03-21', '2019-03-21', '', '2', '1', 'admin', '1', '1553157514', null, '0', '1', '2', null, null, '0');
INSERT INTO `ky_sell` VALUES ('53', 'CW20190321044101', '3', '0', '佛挡杀佛', '水电费', '0717-6236178', '', '宜昌市夷陵大道181号', null, '1', '2019-03-21', '2019-03-21', '', '2', '1', 'admin', '1', '1553157661', null, '0', '1', '2', null, null, '0');
INSERT INTO `ky_sell` VALUES ('54', 'CW20190321044154', '3', '0', '佛挡杀佛', '水电费', '0717-6236178', '', '宜昌市夷陵大道181号', null, '1', '2019-03-21', '2019-03-21', '', '2', '1', 'admin', '1', '1553157714', null, '0', '1', '2', null, null, '0');
INSERT INTO `ky_sell` VALUES ('55', 'CW20190321044228', '3', '0', '张三', '水电费', '13986818455', '', '宜昌市隆康路39号', null, '1', '2019-03-21', '2019-03-21', '', '2', '1', 'admin', '-1', '1553157748', '1553161784', '0', '1', '2', null, null, '0');
INSERT INTO `ky_sell` VALUES ('56', 'CW20190321055529', '3', '0', '张三', '多岁的', '13986818455', '', '宜昌市隆康路39号', null, '1', '2019-03-21', '2019-03-21', '', '2', '1', 'admin', '1', '1553162129', null, '0', '1', '2', null, null, '0');
INSERT INTO `ky_sell` VALUES ('57', 'CW20190321055536', '3', '0', '张三', '多岁的', '13986818455', '', '宜昌市隆康路39号', null, '1', '2019-03-21', '2019-03-21', '', '2', '1', 'admin', '1', '1553162136', null, '0', '1', '2', null, null, '0');
INSERT INTO `ky_sell` VALUES ('58', 'CW20190321055557', '3', '0', '张三', '多岁的', '13986818455', '', '宜昌市隆康路39号', null, '1', '2019-03-21', '2019-03-21', '', '2', '1', 'admin', '1', '1553162157', '1553162176', '0', '1', '2', null, null, '0');
INSERT INTO `ky_sell` VALUES ('59', 'CW20190323094749', '4', '0', '似懂非懂是', '似懂非懂', '的是非得失', '', ' 发', null, '1', '2019-03-23', '2019-03-23', '', '2', '1', 'admin', '-1', '1553305669', '1553912097', '0', '1', '2', null, null, '1');
INSERT INTO `ky_sell` VALUES ('60', 'CW20190323095048', '4', '0', '张三', '343', '13986818455', '', '宜昌市隆康路39号', null, '1', '2019-03-23', '2019-03-23', '', '2', '1', 'admin', '1', '1553305848', '1553912097', '0', '1', '2', null, null, '1');
INSERT INTO `ky_sell` VALUES ('61', 'CW20190323095415', '4', '0', '张三', 'sdfsd', '13986818455', '', '宜昌市隆康路39号', null, '1', '2019-03-23', '2019-03-23', '', '2', '1', 'admin', '-1', '1553306055', '1553912097', '0', '1', '2', null, null, '1');
INSERT INTO `ky_sell` VALUES ('62', 'CW20190323101800', '4', '0', '张三', '母女', '13986818455', '', '宜昌市隆康路39号', null, '1', '2019-03-23', '2019-03-23', '', '2', '1', 'admin', '1', '1553307480', '1553912097', '0', '1', '2', null, null, '1');
INSERT INTO `ky_sell` VALUES ('63', 'CW20190323101852', '4', '0', '鼎折覆餗', '是的发生的', '水电费', '', '第三方士大夫', null, '1', '2019-03-23', '2019-03-23', '', '2', '1', 'admin', '1', '1553307532', '1553912097', '0', '2', '2', null, null, '1');
INSERT INTO `ky_sell` VALUES ('64', 'CW20190323101907', '4', '0', '鼎折覆餗', '是的发生的', '水电费', '', '第三方士大夫', null, '1', '2019-03-23', '2019-03-23', '', '2', '1', 'admin', '-1', '1553307547', '1553912097', '0', '2', '2', null, null, '1');
INSERT INTO `ky_sell` VALUES ('65', 'CW20190323102130', '4', '0', '鼎折覆餗', '是的发生的', '水电费', '', '第三方士大夫', null, '1', '2019-03-23', '2019-03-23', '', '2', '1', 'admin', '-1', '1553307690', '1553912097', '0', '1', '2', null, null, '1');
INSERT INTO `ky_sell` VALUES ('69', 'CW20190323023027', '4', '0', '张三', '母女', '13986818455', '工作单位', '宜昌市隆康路39号', null, '1', '2019-03-23', '2039-03-23', '', '1', '1', 'admin', '-1', '1553322627', '1553912097', '0', '5', '1', '7980.00', null, '1');
INSERT INTO `ky_sell` VALUES ('70', 'CW20190323024630', '4', '0', '张三', '母女', '13986818455', '工作单位', '宜昌市隆康路39号', null, '1', '2019-03-23', '2039-03-23', '', '1', '1', 'admin', '-1', '1553323590', '1553912097', '0', '1', '1', '0.00', null, '1');
INSERT INTO `ky_sell` VALUES ('71', 'CW20190323024854', '4', '0', '张三', '母女', '13986818455', '工作单位', '宜昌市隆康路39号', null, '1', '2019-03-23', '2039-03-23', '', '1', '1', 'admin', '-1', '1553323734', '1553912097', '0', '1', '1', '0.00', null, '1');
INSERT INTO `ky_sell` VALUES ('72', 'CW20190323025004', '4', '0', '张三', '母女', '13986818455', '工作单位', '宜昌市隆康路39号', null, '1', '2019-03-23', '2039-03-23', '', '1', '1', 'admin', '-1', '1553323804', '1553912097', '0', '1', '1', '0.00', null, '1');
INSERT INTO `ky_sell` VALUES ('73', 'CW20190323025132', '4', '0', '张三', '母女', '13986818455', '工作单位', '宜昌市隆康路39号', null, '1', '2019-03-23', '2039-03-23', '', '1', '1', 'admin', '-1', '1553323892', '1553912097', '0', '1', '1', '0.00', null, '1');
INSERT INTO `ky_sell` VALUES ('74', 'CW20190323025417', '4', '0', '张三', '母女', '13986818455', '工作单位', '宜昌市隆康路39号', null, '1', '2019-03-23', '2039-03-23', '', '1', '1', 'admin', '-1', '1553324057', '1553912097', '0', '1', '1', '0.00', null, '1');
INSERT INTO `ky_sell` VALUES ('75', 'CW20190323025601', '4', '0', '张三', '母女', '13986818455', '工作单位', '宜昌市隆康路39号', null, '1', '2019-03-23', '2039-03-23', '', '1', '1', 'admin', '-1', '1553324161', '1553912097', '0', '1', '1', '0.00', null, '1');
INSERT INTO `ky_sell` VALUES ('76', 'CW20190323025945', '4', '0', '张三', '母女', '13986818455', '工作单位', '宜昌市隆康路39号', null, '1', '2019-03-23', '2039-03-23', '', '1', '1', 'admin', '-1', '1553324385', '1553912097', '0', '1', '1', '0.00', null, '1');
INSERT INTO `ky_sell` VALUES ('77', 'CW20190323030915', '4', '0', '张三', '母女', '13986818455', '工作单位', '宜昌市隆康路39号', null, '1', '2019-03-23', '2039-03-23', '', '1', '1', 'admin', '1', '1553324955', '1553912097', '0', '1', '1', '0.00', null, '1');
INSERT INTO `ky_sell` VALUES ('78', 'CW20190323032835', '6', '0', '张三', '父子', '13986818455', ' 	 工作单位', '宜昌市隆康路39号', null, '1', '2019-03-23', '2039-03-23', '', '1', '1', 'admin', '-1', '1553326115', '1553675869', '0', '1', '1', '10000.00', null, '1');
INSERT INTO `ky_sell` VALUES ('79', 'CW20190325101300', '5', '0', '双方都', '母子', '13986818455', '的水电费的说法的', '宜昌市隆康路39号', null, '1', '2019-03-25', '2039-03-25', '', '2', '1', 'admin', '1', '1553479980', '1553911495', '0', '1', '1', '0.00', null, '1');
INSERT INTO `ky_sell` VALUES ('80', 'CW20190325014234', '6', '0', '张三', '父子', '13986818455', ' 	 工作单位', '宜昌市隆康路39号', null, '1', '2019-03-25', '2039-03-25', '', '3', '1', 'admin', '1', '1553492554', '1553675869', '0', '1', '1', '刷卡,343|现金,766|', null, '1');
INSERT INTO `ky_sell` VALUES ('81', 'CW20190326014900', '6', '0', '他依托一体', '', '4545 ', '', '', null, '1', '2019-03-26', '2019-03-26', '', '1', '1', 'admin', '-1', '1553579340', '1553675869', '0', '1', '3', '刷卡,0|现金,0|', '地方', '1');
INSERT INTO `ky_sell` VALUES ('82', 'CW20190326020804', '6', '0', '他依托一体', '', '4545  ', '', '', null, '1', '2019-03-26', '2019-03-26', '', '2', '1', 'admin', '1', '1553580484', '1553675869', '0', '1', '3', '刷卡,0|现金,0|', '地方,434', '1');
INSERT INTO `ky_sell` VALUES ('83', 'CW20190326022151', '6', '0', '张三', '', '13986818455 ', '', '', null, '1', '2019-03-26', '2019-03-26', '', '2', '1', 'admin', '1', '1553581311', '1553675869', '0', '1', '3', '刷卡,0|现金,0|', '地方,434', '1');
INSERT INTO `ky_sell` VALUES ('84', 'CW20190327103214', '6', '0', '张三', '', '13986818455  ', '', '', null, '1', '2019-03-27', '2019-03-27', '', '1', '1', 'admin', '-1', '1553653934', '1553675869', '0', '1', '8', '', '', '1');
INSERT INTO `ky_sell` VALUES ('85', 'CW20190327104918', '6', '0', '他依托一体', '', '4545   ', '', '', null, '1', '2019-03-27', '2019-03-27', '', '2', '1', 'admin', '1', '1553654958', '1553675869', '0', '1', '8', '', '', '1');
INSERT INTO `ky_sell` VALUES ('86', 'CW20190327114800', '6', '0', '张三', '', '13986818455  ', '', '', null, '1', '2019-03-27', '2019-03-27', '', '2', '1', 'admin', '1', '1553658480', '1553675869', '0', '1', '8', '', '地方,434', '1');
INSERT INTO `ky_sell` VALUES ('87', 'CW20190327115124', '6', '0', '他依托一体', '', '4545   ', '', '', null, '1', '2019-03-27', '2019-03-27', '', '1', '1', 'admin', '-1', '1553658684', '1553675869', '0', '1', '8', '', '', '1');
INSERT INTO `ky_sell` VALUES ('88', 'CW20190327115242', '6', '0', '他依托一体', '', '4545   ', '', '', null, '1', '2019-03-27', '2019-03-27', '', '2', '1', 'admin', '1', '1553658762', '1553675869', '0', '1', '8', '', '地方,434', '1');
INSERT INTO `ky_sell` VALUES ('89', 'CW20190327021100', '6', '0', '张三', '', '13986818455 ', ' 	 工作单位', '宜昌市隆康路39号', null, '1', '2019-03-27', '2019-03-27', '', '1', '1', 'admin', '-1', '1553667060', '1553675869', '1', '1', '6', '', '', '1');
INSERT INTO `ky_sell` VALUES ('90', 'CW20190327024702', '6', '0', '张三', '', '13986818455 ', ' 工作单位', '宜昌市隆康路39号', null, '1', '2019-03-27', '2019-03-27', '', '2', '1', 'admin', '1', '1553669222', '1553675869', '1', '1', '6', '', '', '0');
INSERT INTO `ky_sell` VALUES ('91', 'CW20190327083925', '7', '0', '史蒂夫', '34343', '34343', '343', '宜昌市隆康路39号', null, '1', '2019-03-27', '2039-03-27', '', '1', '1', 'admin', '1', '1553690365', null, '0', '1', '1', '刷卡,0|现金,0|微信,0|支付宝,0|', '', '0');
INSERT INTO `ky_sell` VALUES ('92', 'CW20190327092320', '7', '0', '史蒂夫', '', '34343 ', '', '', null, '1', '2019-03-27', '2019-03-27', '', '1', '1', 'admin', '1', '1553693000', '1553693092', '0', '1', '3', '刷卡,0|现金,0|微信,0|支付宝,0|', '地方所得税,水电费', '0');
INSERT INTO `ky_sell` VALUES ('93', 'CW20190327093435', '5', '0', '双方都', '', '13986818455 ', '', '', null, '1', '2019-03-27', '2019-03-27', '', '1', '1', 'admin', '1', '1553693675', '1553911495', '0', '1', '8', '刷卡,0|现金,0|微信,0|', '张三', '1');
INSERT INTO `ky_sell` VALUES ('94', 'CW20190328040707', '5', '0', '双方都', '', '13986818455 ', '', '', null, '1', '2019-03-28', '2019-03-28', '', '1', '1', 'admin', '-1', '1553760427', '1553911495', '0', '1', '7', '', '张三', '1');
INSERT INTO `ky_sell` VALUES ('95', 'CW20190328040729', '5', '0', '双方都', '', '13986818455 ', '', '', null, '1', '2019-03-28', '2019-03-28', '', '1', '1', 'admin', '-1', '1553760449', '1553911495', '0', '1', '7', '', '张三', '1');
INSERT INTO `ky_sell` VALUES ('96', 'CW20190328043429', '5', '0', '双方都', '', '13986818455 ', '', '', null, '1', '2019-03-28', '2019-03-28', '', '1', '1', 'admin', '-1', '1553762069', '1553911495', '0', '1', '7', '刷卡,0|', '张三', '1');
INSERT INTO `ky_sell` VALUES ('97', 'CW20190328044139', '5', '0', '双方都', '', '13986818455 ', '', '', null, '1', '2019-03-28', '2019-03-28', '', '1', '1', 'admin', '-1', '1553762499', '1553911495', '0', '1', '7', '', '张三', '1');
INSERT INTO `ky_sell` VALUES ('98', 'CW20190328044204', '5', '0', '双方都', '', '13986818455 ', '', '', null, '1', '2019-03-28', '2019-03-28', '', '4', '1', 'admin', '1', '1553762524', '1553911495', '0', '1', '7', '刷卡,0|现金,0|微信,0|', '张三', '1');
INSERT INTO `ky_sell` VALUES ('99', 'CW20190329093855', '5', '0', '双方都', '母子', '13986818455', '', '宜昌市隆康路39号', null, '1', '2019-03-29', '2019-03-29', '', '2', '1', 'admin', '-1', '1553823535', '1553911495', '0', '1', '2', '', '', '1');
INSERT INTO `ky_sell` VALUES ('100', 'CW20190329113236', '4', '0', '张三', '母女', '13986818455', '', '', null, '1', '2019-03-29', '2019-03-29', '', '2', '1', 'admin', '1', '1553830356', '1553912097', '0', '1', '2', '刷卡,0|现金,0|微信,0|支付宝,0|', '', '1');
INSERT INTO `ky_sell` VALUES ('101', 'CW20190329113243', '4', '0', '张三', '母女', '13986818455', '', '', null, '1', '2019-03-29', '2019-03-29', '', '2', '1', 'admin', '1', '1553830363', '1553912097', '0', '1', '2', '刷卡,0|现金,0|微信,0|支付宝,0|', '', '1');
INSERT INTO `ky_sell` VALUES ('102', 'CW20190329113502', '4', '0', '张三dasd', '母女', '13986818455', '', '', null, '1', '2019-03-29', '2019-03-29', '', '2', '1', 'admin', '1', '1553830502', '1553912097', '0', '1', '2', '', '', '1');
INSERT INTO `ky_sell` VALUES ('103', 'CW20190329013926', '5', '0', '双方都', '母子', '13986818455', '', '', null, '1', '2019-03-29', '2019-03-29', '', '2', '1', 'admin', '-1', '1553837966', '1553911495', '0', '1', '2', '', '', '1');
INSERT INTO `ky_sell` VALUES ('104', 'CW20190329015326', '5', '0', '双方都', '母子', '13986818455', '', '', null, '1', '2019-03-29', '2019-03-29', '', '2', '1', 'admin', '-1', '1553838806', '1553911495', '0', '1', '2', '', '', '1');
INSERT INTO `ky_sell` VALUES ('105', 'CW20190329020316', '5', '0', '双方都', '母子', '13986818455', '', '', null, '1', '2019-03-29', '2019-03-29', '', '1', '1', 'admin', '1', '1553839396', '1553911495', '0', '1', '2', '', '', '1');
INSERT INTO `ky_sell` VALUES ('106', 'CW20190329021441', '4', '0', '张三', '', '13986818455 ', '', '', null, '1', '2019-03-29', '2019-03-29', '', '2', '1', 'admin', '1', '1553840081', '1553912097', '0', '1', '3', '', '34', '1');

-- ----------------------------
-- Table structure for ky_sellchang
-- ----------------------------
DROP TABLE IF EXISTS `ky_sellchang`;
CREATE TABLE `ky_sellchang` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sellid` int(11) NOT NULL,
  `oldcid` int(11) NOT NULL,
  `oldcname` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `newcid` int(11) NOT NULL,
  `newcname` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `oldsid` int(11) DEFAULT NULL,
  `buyer` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `operater` int(11) DEFAULT NULL,
  `operatename` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `vcdesc` varchar(500) CHARACTER SET utf8 DEFAULT NULL,
  `isok` tinyint(1) DEFAULT '2',
  `movetime` date DEFAULT NULL COMMENT ' ',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of ky_sellchang
-- ----------------------------
INSERT INTO `ky_sellchang` VALUES ('1', '38', '4', '紫薇园DFSFSF 1-1', '3', '', '1', '张三', '13986818455', '1', null, '1', '1553091741', '1553091741', null, '2', '2019-03-20');
INSERT INTO `ky_sellchang` VALUES ('2', '48', '3', 'weee', '42', '生态园地方撒 1-1', '1', '张三', '13986818455', '1', null, '1', '1553152073', '1553152073', null, '2', '2019-03-22');
INSERT INTO `ky_sellchang` VALUES ('3', '51', '42', '生态园地方撒 1-1', '3', 'weee', '1', '张三', '13986818455', '1', null, '1', '1553152278', '1553152278', null, '2', '2019-03-21');

-- ----------------------------
-- Table structure for ky_seo
-- ----------------------------
DROP TABLE IF EXISTS `ky_seo`;
CREATE TABLE `ky_seo` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键自增',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '标题',
  `url` varchar(40) NOT NULL DEFAULT '' COMMENT '模块',
  `seo_title` text NOT NULL COMMENT '标题',
  `seo_keywords` text NOT NULL COMMENT '关键字',
  `seo_description` text NOT NULL COMMENT '描述',
  `usable_val` varchar(255) NOT NULL DEFAULT '' COMMENT '可用变量',
  `sort` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of ky_seo
-- ----------------------------

-- ----------------------------
-- Table structure for ky_servicebill
-- ----------------------------
DROP TABLE IF EXISTS `ky_servicebill`;
CREATE TABLE `ky_servicebill` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderNO` varchar(50) DEFAULT NULL,
  `tid` int(11) NOT NULL,
  `financeID` int(11) DEFAULT NULL,
  `cid` int(11) DEFAULT NULL,
  `serviceID` int(11) DEFAULT NULL,
  `buryid` int(11) DEFAULT '1',
  `service` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `serviceamount` int(2) DEFAULT NULL,
  `begindate` date DEFAULT NULL,
  `enddate` date DEFAULT NULL,
  `vcnote` text CHARACTER SET utf8,
  `useratta1` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `useratta2` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `linkmane` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `linkphone` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `attachment1` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `attchment2` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `execdate` int(11) DEFAULT NULL,
  `execnote` text CHARACTER SET utf8,
  `joinhrm` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `exechrm` int(4) DEFAULT NULL,
  `deptid` int(11) DEFAULT NULL COMMENT '负责部门',
  `resutlstatus` tinyint(1) DEFAULT '1',
  `operater` int(4) DEFAULT NULL,
  `operatename` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `isstory` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fid` (`financeID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of ky_servicebill
-- ----------------------------
INSERT INTO `ky_servicebill` VALUES ('1', 'CW20190318021731', '1', null, '3', '1', '1', '骨灰坛', '1', null, null, null, null, null, '张三', '13986818455', null, null, null, null, null, null, '35', '1', '1', 'admin', '1', '1552889851', '1553152277', null);
INSERT INTO `ky_servicebill` VALUES ('2', 'CW20190318021731', '1', null, '3', '2', '1', '锣鼓乐队', '1', null, null, null, null, null, '张三', '13986818455', null, null, null, null, null, null, '35', '1', '1', 'admin', '1', '1552889851', '1553152277', null);
INSERT INTO `ky_servicebill` VALUES ('16', 'CW20190326014900', '81', null, '6', '4', '1', '绿化维护 ', '1', null, null, null, null, null, '他依托一体', '4545 ', null, null, null, null, null, null, '35', '1', '1', 'admin', '-1', '1553579340', '1553675869', '1');
INSERT INTO `ky_servicebill` VALUES ('17', 'CW20190326014900', '81', null, '6', '5', '1', '单人黑照片', '1', null, null, null, null, null, '他依托一体', '4545 ', null, null, null, null, null, null, '35', '1', '1', 'admin', '-1', '1553579340', '1553675869', '1');
INSERT INTO `ky_servicebill` VALUES ('18', 'CW20190326014900', '81', null, '6', '6', '1', '单人彩色照片', '1', null, null, null, null, null, '他依托一体', '4545 ', null, null, null, null, null, null, '35', '1', '1', 'admin', '-1', '1553579340', '1553675869', '1');
INSERT INTO `ky_servicebill` VALUES ('21', 'CW20190326020804', '82', null, '6', '4', '1', '绿化维护 ', '1', null, null, null, null, null, '他依托一体', '4545  ', null, null, null, null, null, null, '35', '1', '1', 'admin', '1', '1553583420', '1553675869', '1');
INSERT INTO `ky_servicebill` VALUES ('22', 'CW20190326020804', '82', null, '6', '5', '1', '单人黑照片', '1', null, null, null, null, null, '他依托一体', '4545  ', null, null, null, null, null, null, '35', '1', '1', 'admin', '1', '1553583420', '1553675869', '1');

-- ----------------------------
-- Table structure for ky_serviceinfo
-- ----------------------------
DROP TABLE IF EXISTS `ky_serviceinfo`;
CREATE TABLE `ky_serviceinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `servicename` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `servicetype` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `sellprice` decimal(10,2) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `vcnote` text CHARACTER SET utf8,
  `manager` int(11) DEFAULT NULL,
  `isremind` tinyint(1) DEFAULT '0',
  `issystem` tinyint(1) DEFAULT '0',
  `deptid` int(11) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `sort` int(4) NOT NULL DEFAULT '1',
  `ifpushbranch` tinyint(1) DEFAULT '0' COMMENT '是否推送所有部门1是 0否',
  `iffollowadd` tinyint(1) DEFAULT '1' COMMENT '是否为后续添加服务1是 0否',
  `ifshow` tinyint(1) DEFAULT NULL,
  `ifreturn` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of ky_serviceinfo
-- ----------------------------
INSERT INTO `ky_serviceinfo` VALUES ('1', '骨灰坛', ',3,', null, '0.00', '', null, '0', '0', '35', '1', '1552112728', '1553569414', '10', '2', '0', '1', '1');
INSERT INTO `ky_serviceinfo` VALUES ('2', '乐队', ',1,4,', null, '0.00', '', null, '0', '0', '35', '1', '1552115462', '1553569721', '8', '2', '0', '1', '1');
INSERT INTO `ky_serviceinfo` VALUES ('3', '瓷像安装', ',3,', null, '0.00', '', null, '0', '0', '35', '1', '1552720153', '1553569978', '10', '2', '0', '1', '1');
INSERT INTO `ky_serviceinfo` VALUES ('4', '绿化维护 ', ',3,', null, '0.00', '', null, '0', '0', '35', '1', '1553569457', '1553569469', '1', '2', '0', '1', '1');
INSERT INTO `ky_serviceinfo` VALUES ('5', '单人黑照片', ',3,', null, '0.00', '', null, '0', '0', '35', '1', '1553569490', '1553569570', '2', '2', '0', '1', '1');
INSERT INTO `ky_serviceinfo` VALUES ('6', '单人彩色照片', ',3,', null, '0.00', '', null, '0', '0', '35', '1', '1553569516', '1553569545', '3', '2', '0', '1', '1');
INSERT INTO `ky_serviceinfo` VALUES ('7', '双人黑白照片', ',3,', null, '0.00', '', null, '0', '0', '35', '1', '1553569599', '1553569801', '4', '2', '0', '1', '1');
INSERT INTO `ky_serviceinfo` VALUES ('8', '双人彩色照片', ',3,', null, '0.00', '', null, '0', '0', '24', '1', '1553569625', '1553569836', '5', '2', '0', '1', '1');
INSERT INTO `ky_serviceinfo` VALUES ('10', '移坟', ',3,', null, '0.00', '', null, '0', '0', '35', '1', '1553569749', '1553569749', '9', '2', '0', '1', '1');
INSERT INTO `ky_serviceinfo` VALUES ('11', '碑文刻录', ',3,', null, '0.00', '', null, '0', '0', '35', '1', '1553569870', '1553569870', '9', '2', '0', '1', '1');
INSERT INTO `ky_serviceinfo` VALUES ('12', '金箔', ',3,', null, '0.00', '', null, '0', '0', '35', '1', '1553569897', '1553569910', '9', '2', '0', '1', '1');
INSERT INTO `ky_serviceinfo` VALUES ('13', '安葬礼仪', ',3,', null, '0.00', '', null, '0', '0', '35', '1', '1553569998', '1553569998', '10', '2', '0', '1', '1');
INSERT INTO `ky_serviceinfo` VALUES ('14', '春节点灯  ', '', null, '0.00', '', null, '0', '0', '35', '-1', '1553570022', '1553570037', '10', '2', '0', '1', '1');

-- ----------------------------
-- Table structure for ky_test
-- ----------------------------
DROP TABLE IF EXISTS `ky_test`;
CREATE TABLE `ky_test` (
  `recid` int(11) NOT NULL AUTO_INCREMENT,
  `images` text,
  `status` tinyint(1) DEFAULT NULL,
  `create_time` int(11) NOT NULL,
  `update_time` int(11) NOT NULL,
  PRIMARY KEY (`recid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of ky_test
-- ----------------------------

-- ----------------------------
-- Table structure for ky_wordstyle
-- ----------------------------
DROP TABLE IF EXISTS `ky_wordstyle`;
CREATE TABLE `ky_wordstyle` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `typeid` tinyint(1) NOT NULL DEFAULT '1',
  `stylename` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `unit` varchar(10) CHARACTER SET utf8 DEFAULT NULL,
  `sellprice` decimal(10,2) DEFAULT NULL,
  `vcnote` text CHARACTER SET utf8,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of ky_wordstyle
-- ----------------------------

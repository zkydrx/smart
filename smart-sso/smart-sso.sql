/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50637
Source Host           : localhost:3306
Source Database       : smart-sso

Target Server Type    : MYSQL
Target Server Version : 50637
File Encoding         : 65001

Date: 2019-05-28 15:31:21
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `sys_app`
-- ----------------------------
drop table IF EXISTS `sys_app`;
create TABLE `sys_app` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL COMMENT '名称',
  `sort` int(11) NOT NULL COMMENT '排序',
  `createTime` datetime NOT NULL COMMENT '创建时间',
  `isEnable` int(1) NOT NULL COMMENT '是否启用',
  `code` varchar(16) NOT NULL COMMENT '编码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=utf8 COMMENT='应用表';

-- ----------------------------
-- Records of sys_app
-- ----------------------------
insert into `sys_app` VALUES ('1', '单点登录权限管理系统', '20', '2015-06-02 11:31:44', '1', 'smart-sso-server');
insert into `sys_app` VALUES ('81', 'Demo管理系统', '15', '2015-11-08 17:16:39', '1', 'smart-sso-demo');
insert into `sys_app` VALUES ('82', '内容管理系统', '10', '2015-11-08 17:16:39', '1', 'smart-cms');

-- ----------------------------
-- Table structure for `sys_office`
-- ----------------------------
drop table IF EXISTS `sys_office`;
create TABLE `sys_office` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parentId` int(11) DEFAULT NULL COMMENT '父ID',
  `name` varchar(100) NOT NULL COMMENT '名称',
  `sort` int(11) NOT NULL COMMENT '排序',
  `isEnable` int(1) NOT NULL COMMENT '是否启用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='机构';

-- ----------------------------
-- Records of sys_office
-- ----------------------------
insert into `sys_office` VALUES ('1', null, 'TT公司', '30', '1');
insert into `sys_office` VALUES ('2', '1', 'XX部门', '30', '1');
insert into `sys_office` VALUES ('3', '1', 'YY部门', '20', '1');

-- ----------------------------
-- Table structure for `sys_permission`
-- ----------------------------
drop table IF EXISTS `sys_permission`;
create TABLE `sys_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `appId` int(11) NOT NULL COMMENT '应用ID',
  `parentId` int(11) DEFAULT NULL COMMENT '父ID',
  `name` varchar(50) NOT NULL COMMENT '名称',
  `url` varchar(255) NOT NULL COMMENT '权限URL',
  `sort` int(11) NOT NULL COMMENT '排序',
  `isMenu` int(1) NOT NULL COMMENT '是否菜单',
  `isEnable` int(1) NOT NULL COMMENT '是否启用',
  `icon` varchar(100) DEFAULT NULL COMMENT '图标',
  PRIMARY KEY (`id`),
  KEY `FK_SYS_PERM_REFERENCE_sys_app` (`appId`),
  CONSTRAINT `FK_SYS_PERM_REFERENCE_sys_app` FOREIGN KEY (`appId`) REFERENCES `sys_app` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8 COMMENT='权限表';

-- ----------------------------
-- Records of sys_permission
-- ----------------------------
insert into `sys_permission` VALUES ('2', '1', null, '应用', '/admin/app', '59', '1', '1', 'fa fa-th-large');
insert into `sys_permission` VALUES ('3', '1', null, '用户', '/admin/user', '79', '1', '1', 'fa-user');
insert into `sys_permission` VALUES ('4', '1', null, '角色', '/admin/role', '69', '1', '1', 'fa-users');
insert into `sys_permission` VALUES ('5', '1', null, '权限', '/admin/permission', '29', '1', '1', 'fa-key');
insert into `sys_permission` VALUES ('6', '1', '2', '应用新增', '/admin/app/edit', '4', '0', '1', 'fa-plus-circle blue');
insert into `sys_permission` VALUES ('7', '1', '2', '应用启/禁用', '/admin/app/enable', '3', '0', '1', 'fa-lock orange');
insert into `sys_permission` VALUES ('9', '1', '2', '应用删除', '/admin/app/delete', '1', '0', '1', 'fa-trash-o red');
insert into `sys_permission` VALUES ('10', '1', '3', '用户新增', '/admin/user/edit', '6', '0', '1', 'fa-plus-circle blue');
insert into `sys_permission` VALUES ('11', '1', '3', '用户启/禁用', '/admin/user/enable', '5', '0', '1', 'fa-lock orange');
insert into `sys_permission` VALUES ('13', '1', '3', '用户删除', '/admin/user/delete', '3', '0', '1', 'fa-trash-o red');
insert into `sys_permission` VALUES ('14', '1', '3', '重置密码', '/admin/user/resetPassword', '2', '0', '1', 'fa-key grey');
insert into `sys_permission` VALUES ('16', '1', '4', '角色新增', '/admin/role/edit', '5', '0', '1', 'fa-plus-circle blue');
insert into `sys_permission` VALUES ('17', '1', '4', '角色启/禁用', '/admin/role/enable', '4', '0', '1', 'fa-lock orange');
insert into `sys_permission` VALUES ('19', '1', '4', '角色删除', '/admin/role/delete', '2', '0', '1', 'fa-trash-o red');
insert into `sys_permission` VALUES ('20', '1', '4', '角色授权', '/admin/role/allocate', '1', '0', '1', 'fa-cog grey');
insert into `sys_permission` VALUES ('22', '1', '2', '应用列表', '/admin/app/list', '5', '0', '1', '');
insert into `sys_permission` VALUES ('23', '1', '3', '用户列表', '/admin/user/list', '7', '0', '1', '');
insert into `sys_permission` VALUES ('24', '1', '4', '角色列表', '/admin/role/list', '6', '0', '1', '');
insert into `sys_permission` VALUES ('25', '1', '5', '权限树列表', '/admin/permission/nodes', '1', '0', '1', '');
insert into `sys_permission` VALUES ('26', '1', '2', '应用保存', '/admin/app/save', '1', '0', '1', '');
insert into `sys_permission` VALUES ('27', '1', '3', '用户保存', '/admin/user/save', '1', '0', '1', '');
insert into `sys_permission` VALUES ('28', '1', '4', '角色保存', '/admin/role/save', '1', '0', '1', '');
insert into `sys_permission` VALUES ('29', '1', '5', '权限保存', '/admin/permission/save', '1', '0', '1', '');
insert into `sys_permission` VALUES ('30', '1', '5', '权限删除', '/admin/permission/delete', '1', '0', '1', '');
insert into `sys_permission` VALUES ('33', '81', null, '菜单1', '/admin/men1', '100', '1', '1', 'fa-user');
insert into `sys_permission` VALUES ('35', '81', '33', '菜单1新增', '/admin/menu1/edit', '1', '0', '1', '');
insert into `sys_permission` VALUES ('36', '81', '33', '菜单1删除', '/admin/menu1/delete', '1', '0', '1', '');
insert into `sys_permission` VALUES ('39', '1', null, '导航栏', '/admin/admin/menu', '99', '0', '1', '');
insert into `sys_permission` VALUES ('41', '1', null, '个人中心', '/admin/profile', '89', '1', '1', 'fa fa-desktop');
insert into `sys_permission` VALUES ('42', '1', '41', '修改密码', '/admin/profile/savePassword', '1', '0', '1', '');
insert into `sys_permission` VALUES ('44', '82', null, '栏目管理', '/admin/channel', '100', '1', '1', 'fa fa-th-large');
insert into `sys_permission` VALUES ('47', '82', null, '底部菜单管理', '/admin/menu', '110', '1', '1', 'fa fa-list-alt');
insert into `sys_permission` VALUES ('48', '82', null, '文章管理', '/admin/article', '90', '1', '1', 'fa fa-file-text');
insert into `sys_permission` VALUES ('49', '82', null, '产品管理', '/admin/product', '70', '1', '1', 'fa fa-file-powerpoint-o');
insert into `sys_permission` VALUES ('50', '82', null, '产品规格', '/admin/spec', '75', '1', '1', 'fa fa-cubes');
insert into `sys_permission` VALUES ('55', '82', null, '首页幻灯片管理', '/admin/slide', '120', '1', '1', 'fa fa-sliders');
insert into `sys_permission` VALUES ('56', '82', null, '底部菜单配置', '/admin/channelMenu/edit', '105', '1', '1', 'fa fa-cog');
insert into `sys_permission` VALUES ('59', '81', null, '菜单2', '/admin/menu2', '90', '1', '1', '');
insert into `sys_permission` VALUES ('60', '1', null, '机构', '/admin/office', '80', '1', '1', 'fa-cogs');
insert into `sys_permission` VALUES ('61', '1', '60', '机构列表', '/admin/office/list', '5', '0', '1', '');
insert into `sys_permission` VALUES ('62', '1', '60', '机构新增', '/admin/app/edit', '4', '0', '1', 'fa-plus-circle blue');
insert into `sys_permission` VALUES ('63', '1', '60', '机构启/禁用', '/admin/office/enable', '3', '0', '1', 'fa-lock orange');
insert into `sys_permission` VALUES ('65', '1', '60', '机构删除', '/admin/office/delete', '1', '0', '1', 'fa-trash-o red');

-- ----------------------------
-- Table structure for `sys_re_role_permission`
-- ----------------------------
drop table IF EXISTS `sys_re_role_permission`;
create TABLE `sys_re_role_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `roleId` int(11) NOT NULL COMMENT '角色ID',
  `permissionId` int(11) NOT NULL COMMENT '权限ID',
  `appId` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_SYS_RE_R_REFERENCE_SYS_PERM` (`permissionId`),
  KEY `FK_SYS_RE_R_REFERENCE_sys_role` (`roleId`),
  CONSTRAINT `FK_SYS_RE_R_REFERENCE_SYS_PERM` FOREIGN KEY (`permissionId`) REFERENCES `sys_permission` (`id`),
  CONSTRAINT `FK_SYS_RE_R_REFERENCE_sys_role` FOREIGN KEY (`roleId`) REFERENCES `sys_role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=419 DEFAULT CHARSET=utf8 COMMENT='角色权限表';

-- ----------------------------
-- Records of sys_re_role_permission
-- ----------------------------
insert into `sys_re_role_permission` VALUES ('345', '1', '33', '81');
insert into `sys_re_role_permission` VALUES ('346', '1', '35', '81');
insert into `sys_re_role_permission` VALUES ('347', '1', '36', '81');
insert into `sys_re_role_permission` VALUES ('348', '1', '59', '81');
insert into `sys_re_role_permission` VALUES ('349', '1', '55', '82');
insert into `sys_re_role_permission` VALUES ('350', '1', '47', '82');
insert into `sys_re_role_permission` VALUES ('351', '1', '56', '82');
insert into `sys_re_role_permission` VALUES ('352', '1', '44', '82');
insert into `sys_re_role_permission` VALUES ('353', '1', '48', '82');
insert into `sys_re_role_permission` VALUES ('354', '1', '50', '82');
insert into `sys_re_role_permission` VALUES ('355', '1', '49', '82');
insert into `sys_re_role_permission` VALUES ('387', '1', '39', '1');
insert into `sys_re_role_permission` VALUES ('388', '1', '41', '1');
insert into `sys_re_role_permission` VALUES ('389', '1', '42', '1');
insert into `sys_re_role_permission` VALUES ('390', '1', '60', '1');
insert into `sys_re_role_permission` VALUES ('391', '1', '61', '1');
insert into `sys_re_role_permission` VALUES ('392', '1', '62', '1');
insert into `sys_re_role_permission` VALUES ('393', '1', '63', '1');
insert into `sys_re_role_permission` VALUES ('394', '1', '65', '1');
insert into `sys_re_role_permission` VALUES ('395', '1', '3', '1');
insert into `sys_re_role_permission` VALUES ('396', '1', '23', '1');
insert into `sys_re_role_permission` VALUES ('397', '1', '10', '1');
insert into `sys_re_role_permission` VALUES ('398', '1', '11', '1');
insert into `sys_re_role_permission` VALUES ('399', '1', '13', '1');
insert into `sys_re_role_permission` VALUES ('400', '1', '14', '1');
insert into `sys_re_role_permission` VALUES ('401', '1', '27', '1');
insert into `sys_re_role_permission` VALUES ('402', '1', '2', '1');
insert into `sys_re_role_permission` VALUES ('403', '1', '22', '1');
insert into `sys_re_role_permission` VALUES ('404', '1', '6', '1');
insert into `sys_re_role_permission` VALUES ('405', '1', '7', '1');
insert into `sys_re_role_permission` VALUES ('406', '1', '9', '1');
insert into `sys_re_role_permission` VALUES ('407', '1', '26', '1');
insert into `sys_re_role_permission` VALUES ('408', '1', '4', '1');
insert into `sys_re_role_permission` VALUES ('409', '1', '24', '1');
insert into `sys_re_role_permission` VALUES ('410', '1', '16', '1');
insert into `sys_re_role_permission` VALUES ('411', '1', '17', '1');
insert into `sys_re_role_permission` VALUES ('412', '1', '19', '1');
insert into `sys_re_role_permission` VALUES ('413', '1', '20', '1');
insert into `sys_re_role_permission` VALUES ('414', '1', '28', '1');
insert into `sys_re_role_permission` VALUES ('415', '1', '5', '1');
insert into `sys_re_role_permission` VALUES ('416', '1', '25', '1');
insert into `sys_re_role_permission` VALUES ('417', '1', '29', '1');
insert into `sys_re_role_permission` VALUES ('418', '1', '30', '1');

-- ----------------------------
-- Table structure for `sys_re_user_role`
-- ----------------------------
drop table IF EXISTS `sys_re_user_role`;
create TABLE `sys_re_user_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL COMMENT '用户ID ',
  `roleId` int(11) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`id`),
  KEY `FK_SYS_RE_U_REFERENCE_sys_user` (`userId`),
  KEY `FK_SYS_RE_U_REFERENCE_sys_role` (`roleId`),
  CONSTRAINT `FK_SYS_RE_U_REFERENCE_sys_role` FOREIGN KEY (`roleId`) REFERENCES `sys_role` (`id`),
  CONSTRAINT `FK_SYS_RE_U_REFERENCE_sys_user` FOREIGN KEY (`userId`) REFERENCES `sys_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8 COMMENT='用户角色表';

-- ----------------------------
-- Records of sys_re_user_role
-- ----------------------------
insert into `sys_re_user_role` VALUES ('33', '2', '1');

-- ----------------------------
-- Table structure for `sys_role`
-- ----------------------------
drop table IF EXISTS `sys_role`;
create TABLE `sys_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL COMMENT '名称',
  `sort` int(11) NOT NULL COMMENT '排序',
  `description` varchar(200) DEFAULT NULL COMMENT '描述',
  `isEnable` int(1) NOT NULL COMMENT '是否启用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='角色表';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
insert into `sys_role` VALUES ('1', '系统管理员', '999', '系统管理员', '1');

-- ----------------------------
-- Table structure for `sys_user`
-- ----------------------------
drop table IF EXISTS `sys_user`;
create TABLE `sys_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `officeId` int(11) NOT NULL COMMENT '机构ID',
  `name` varchar(50) DEFAULT NULL COMMENT '姓名',
  `account` varchar(50) NOT NULL COMMENT '登录名',
  `password` varchar(100) NOT NULL COMMENT '密码(加密)',
  `lastLoginIp` varchar(20) DEFAULT NULL COMMENT '最后登录IP',
  `lastLoginTime` datetime DEFAULT NULL COMMENT '最后登录时间',
  `loginCount` int(11) NOT NULL COMMENT '登录总次数',
  `createTime` datetime NOT NULL COMMENT '创建时间',
  `isEnable` int(1) NOT NULL COMMENT '是否启用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
insert into `sys_user` VALUES ('2', '3', 'Joe', 'admin', '26524bdf4ea266f131566a89e8f4972c', '0:0:0:0:0:0:0:1', '2019-05-28 15:26:00', '266', '2015-06-02 11:31:56', '1');

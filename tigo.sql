/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50547
Source Host           : localhost:3306
Source Database       : tigo

Target Server Type    : MYSQL
Target Server Version : 50547
File Encoding         : 65001

Date: 2016-06-02 09:06:59
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `cmf_ad`
-- ----------------------------
DROP TABLE IF EXISTS `cmf_ad`;
CREATE TABLE `cmf_ad` (
  `ad_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '广告id',
  `ad_name` varchar(255) NOT NULL COMMENT '广告名称',
  `ad_content` text COMMENT '广告内容',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1显示，0不显示',
  PRIMARY KEY (`ad_id`),
  KEY `ad_name` (`ad_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cmf_ad
-- ----------------------------

-- ----------------------------
-- Table structure for `cmf_asset`
-- ----------------------------
DROP TABLE IF EXISTS `cmf_asset`;
CREATE TABLE `cmf_asset` (
  `aid` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '用户 id',
  `key` varchar(50) NOT NULL COMMENT '资源 key',
  `filename` varchar(50) DEFAULT NULL COMMENT '文件名',
  `filesize` int(11) DEFAULT NULL COMMENT '文件大小,单位Byte',
  `filepath` varchar(200) NOT NULL COMMENT '文件路径，相对于 upload 目录，可以为 url',
  `uploadtime` int(11) NOT NULL COMMENT '上传时间',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1：可用，0：删除，不可用',
  `meta` text COMMENT '其它详细信息，JSON格式',
  `suffix` varchar(50) DEFAULT NULL COMMENT '文件后缀名，不包括点',
  `download_times` int(11) NOT NULL DEFAULT '0' COMMENT '下载次数',
  PRIMARY KEY (`aid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='资源表';

-- ----------------------------
-- Records of cmf_asset
-- ----------------------------

-- ----------------------------
-- Table structure for `cmf_auth_access`
-- ----------------------------
DROP TABLE IF EXISTS `cmf_auth_access`;
CREATE TABLE `cmf_auth_access` (
  `role_id` mediumint(8) unsigned NOT NULL COMMENT '角色',
  `rule_name` varchar(255) NOT NULL COMMENT '规则唯一英文标识,全小写',
  `type` varchar(30) DEFAULT NULL COMMENT '权限规则分类，请加应用前缀,如admin_',
  KEY `role_id` (`role_id`),
  KEY `rule_name` (`rule_name`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='权限授权表';

-- ----------------------------
-- Records of cmf_auth_access
-- ----------------------------

-- ----------------------------
-- Table structure for `cmf_auth_rule`
-- ----------------------------
DROP TABLE IF EXISTS `cmf_auth_rule`;
CREATE TABLE `cmf_auth_rule` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '规则id,自增主键',
  `module` varchar(20) NOT NULL COMMENT '规则所属module',
  `type` varchar(30) NOT NULL DEFAULT '1' COMMENT '权限规则分类，请加应用前缀,如admin_',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '规则唯一英文标识,全小写',
  `param` varchar(255) DEFAULT NULL COMMENT '额外url参数',
  `title` varchar(20) NOT NULL DEFAULT '' COMMENT '规则中文描述',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效(0:无效,1:有效)',
  `condition` varchar(300) NOT NULL DEFAULT '' COMMENT '规则附加条件',
  PRIMARY KEY (`id`),
  KEY `module` (`module`,`status`,`type`)
) ENGINE=MyISAM AUTO_INCREMENT=162 DEFAULT CHARSET=utf8 COMMENT='权限规则表';

-- ----------------------------
-- Records of cmf_auth_rule
-- ----------------------------
INSERT INTO `cmf_auth_rule` VALUES ('1', 'Admin', 'admin_url', 'admin/content/default', null, '内容管理', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('2', 'Api', 'admin_url', 'api/guestbookadmin/index', null, '所有留言', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('3', 'Api', 'admin_url', 'api/guestbookadmin/delete', null, '删除网站留言', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('4', 'Comment', 'admin_url', 'comment/commentadmin/index', null, '评论管理', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('5', 'Comment', 'admin_url', 'comment/commentadmin/delete', null, '删除评论', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('6', 'Comment', 'admin_url', 'comment/commentadmin/check', null, '评论审核', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('7', 'Portal', 'admin_url', 'portal/adminpost/index', null, '文章管理', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('8', 'Portal', 'admin_url', 'portal/adminpost/listorders', null, '文章排序', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('9', 'Portal', 'admin_url', 'portal/adminpost/top', null, '文章置顶', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('10', 'Portal', 'admin_url', 'portal/adminpost/recommend', null, '文章推荐', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('11', 'Portal', 'admin_url', 'portal/adminpost/move', null, '批量移动', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('12', 'Portal', 'admin_url', 'portal/adminpost/check', null, '文章审核', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('13', 'Portal', 'admin_url', 'portal/adminpost/delete', null, '删除文章', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('14', 'Portal', 'admin_url', 'portal/adminpost/edit', null, '编辑文章', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('15', 'Portal', 'admin_url', 'portal/adminpost/edit_post', null, '提交编辑', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('16', 'Portal', 'admin_url', 'portal/adminpost/add', null, '添加文章', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('17', 'Portal', 'admin_url', 'portal/adminpost/add_post', null, '提交添加', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('18', 'Portal', 'admin_url', 'portal/adminterm/index', null, '分类管理', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('19', 'Portal', 'admin_url', 'portal/adminterm/listorders', null, '文章分类排序', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('20', 'Portal', 'admin_url', 'portal/adminterm/delete', null, '删除分类', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('21', 'Portal', 'admin_url', 'portal/adminterm/edit', null, '编辑分类', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('22', 'Portal', 'admin_url', 'portal/adminterm/edit_post', null, '提交编辑', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('23', 'Portal', 'admin_url', 'portal/adminterm/add', null, '添加分类', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('24', 'Portal', 'admin_url', 'portal/adminterm/add_post', null, '提交添加', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('25', 'Portal', 'admin_url', 'portal/adminpage/index', null, '页面管理', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('26', 'Portal', 'admin_url', 'portal/adminpage/listorders', null, '页面排序', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('27', 'Portal', 'admin_url', 'portal/adminpage/delete', null, '删除页面', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('28', 'Portal', 'admin_url', 'portal/adminpage/edit', null, '编辑页面', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('29', 'Portal', 'admin_url', 'portal/adminpage/edit_post', null, '提交编辑', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('30', 'Portal', 'admin_url', 'portal/adminpage/add', null, '添加页面', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('31', 'Portal', 'admin_url', 'portal/adminpage/add_post', null, '提交添加', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('32', 'Admin', 'admin_url', 'admin/recycle/default', null, '回收站', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('33', 'Portal', 'admin_url', 'portal/adminpost/recyclebin', null, '文章回收', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('34', 'Portal', 'admin_url', 'portal/adminpost/restore', null, '文章还原', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('35', 'Portal', 'admin_url', 'portal/adminpost/clean', null, '彻底删除', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('36', 'Portal', 'admin_url', 'portal/adminpage/recyclebin', null, '页面回收', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('37', 'Portal', 'admin_url', 'portal/adminpage/clean', null, '彻底删除', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('38', 'Portal', 'admin_url', 'portal/adminpage/restore', null, '页面还原', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('39', 'Admin', 'admin_url', 'admin/extension/default', null, '扩展工具', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('40', 'Admin', 'admin_url', 'admin/backup/default', null, '备份管理', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('41', 'Admin', 'admin_url', 'admin/backup/restore', null, '数据还原', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('42', 'Admin', 'admin_url', 'admin/backup/index', null, '数据备份', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('43', 'Admin', 'admin_url', 'admin/backup/index_post', null, '提交数据备份', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('44', 'Admin', 'admin_url', 'admin/backup/download', null, '下载备份', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('45', 'Admin', 'admin_url', 'admin/backup/del_backup', null, '删除备份', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('46', 'Admin', 'admin_url', 'admin/backup/import', null, '数据备份导入', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('47', 'Admin', 'admin_url', 'admin/plugin/index', null, '插件管理', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('48', 'Admin', 'admin_url', 'admin/plugin/toggle', null, '插件启用切换', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('49', 'Admin', 'admin_url', 'admin/plugin/setting', null, '插件设置', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('50', 'Admin', 'admin_url', 'admin/plugin/setting_post', null, '插件设置提交', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('51', 'Admin', 'admin_url', 'admin/plugin/install', null, '插件安装', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('52', 'Admin', 'admin_url', 'admin/plugin/uninstall', null, '插件卸载', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('53', 'Admin', 'admin_url', 'admin/slide/default', null, '幻灯片', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('54', 'Admin', 'admin_url', 'admin/slide/index', null, '幻灯片管理', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('55', 'Admin', 'admin_url', 'admin/slide/listorders', null, '幻灯片排序', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('56', 'Admin', 'admin_url', 'admin/slide/toggle', null, '幻灯片显示切换', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('57', 'Admin', 'admin_url', 'admin/slide/delete', null, '删除幻灯片', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('58', 'Admin', 'admin_url', 'admin/slide/edit', null, '编辑幻灯片', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('59', 'Admin', 'admin_url', 'admin/slide/edit_post', null, '提交编辑', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('60', 'Admin', 'admin_url', 'admin/slide/add', null, '添加幻灯片', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('61', 'Admin', 'admin_url', 'admin/slide/add_post', null, '提交添加', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('62', 'Admin', 'admin_url', 'admin/slidecat/index', null, '幻灯片分类', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('63', 'Admin', 'admin_url', 'admin/slidecat/delete', null, '删除分类', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('64', 'Admin', 'admin_url', 'admin/slidecat/edit', null, '编辑分类', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('65', 'Admin', 'admin_url', 'admin/slidecat/edit_post', null, '提交编辑', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('66', 'Admin', 'admin_url', 'admin/slidecat/add', null, '添加分类', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('67', 'Admin', 'admin_url', 'admin/slidecat/add_post', null, '提交添加', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('68', 'Admin', 'admin_url', 'admin/ad/index', null, '网站广告', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('69', 'Admin', 'admin_url', 'admin/ad/toggle', null, '广告显示切换', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('70', 'Admin', 'admin_url', 'admin/ad/delete', null, '删除广告', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('71', 'Admin', 'admin_url', 'admin/ad/edit', null, '编辑广告', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('72', 'Admin', 'admin_url', 'admin/ad/edit_post', null, '提交编辑', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('73', 'Admin', 'admin_url', 'admin/ad/add', null, '添加广告', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('74', 'Admin', 'admin_url', 'admin/ad/add_post', null, '提交添加', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('75', 'Admin', 'admin_url', 'admin/link/index', null, '友情链接', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('76', 'Admin', 'admin_url', 'admin/link/listorders', null, '友情链接排序', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('77', 'Admin', 'admin_url', 'admin/link/toggle', null, '友链显示切换', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('78', 'Admin', 'admin_url', 'admin/link/delete', null, '删除友情链接', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('79', 'Admin', 'admin_url', 'admin/link/edit', null, '编辑友情链接', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('80', 'Admin', 'admin_url', 'admin/link/edit_post', null, '提交编辑', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('81', 'Admin', 'admin_url', 'admin/link/add', null, '添加友情链接', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('82', 'Admin', 'admin_url', 'admin/link/add_post', null, '提交添加', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('83', 'Api', 'admin_url', 'api/oauthadmin/setting', null, '第三方登陆', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('84', 'Api', 'admin_url', 'api/oauthadmin/setting_post', null, '提交设置', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('85', 'Admin', 'admin_url', 'admin/menu/default', null, '菜单管理', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('86', 'Admin', 'admin_url', 'admin/navcat/default1', null, '前台菜单', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('87', 'Admin', 'admin_url', 'admin/nav/index', null, '菜单管理', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('88', 'Admin', 'admin_url', 'admin/nav/listorders', null, '前台导航排序', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('89', 'Admin', 'admin_url', 'admin/nav/delete', null, '删除菜单', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('90', 'Admin', 'admin_url', 'admin/nav/edit', null, '编辑菜单', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('91', 'Admin', 'admin_url', 'admin/nav/edit_post', null, '提交编辑', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('92', 'Admin', 'admin_url', 'admin/nav/add', null, '添加菜单', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('93', 'Admin', 'admin_url', 'admin/nav/add_post', null, '提交添加', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('94', 'Admin', 'admin_url', 'admin/navcat/index', null, '菜单分类', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('95', 'Admin', 'admin_url', 'admin/navcat/delete', null, '删除分类', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('96', 'Admin', 'admin_url', 'admin/navcat/edit', null, '编辑分类', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('97', 'Admin', 'admin_url', 'admin/navcat/edit_post', null, '提交编辑', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('98', 'Admin', 'admin_url', 'admin/navcat/add', null, '添加分类', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('99', 'Admin', 'admin_url', 'admin/navcat/add_post', null, '提交添加', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('100', 'Admin', 'admin_url', 'admin/menu/index', null, '后台菜单', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('101', 'Admin', 'admin_url', 'admin/menu/add', null, '添加菜单', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('102', 'Admin', 'admin_url', 'admin/menu/add_post', null, '提交添加', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('103', 'Admin', 'admin_url', 'admin/menu/listorders', null, '后台菜单排序', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('104', 'Admin', 'admin_url', 'admin/menu/export_menu', null, '菜单备份', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('105', 'Admin', 'admin_url', 'admin/menu/edit', null, '编辑菜单', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('106', 'Admin', 'admin_url', 'admin/menu/edit_post', null, '提交编辑', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('107', 'Admin', 'admin_url', 'admin/menu/delete', null, '删除菜单', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('108', 'Admin', 'admin_url', 'admin/menu/lists', null, '所有菜单', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('109', 'Admin', 'admin_url', 'admin/setting/default', null, '设置', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('110', 'Admin', 'admin_url', 'admin/setting/userdefault', null, '个人信息', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('111', 'Admin', 'admin_url', 'admin/user/userinfo', null, '修改信息', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('112', 'Admin', 'admin_url', 'admin/user/userinfo_post', null, '修改信息提交', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('113', 'Admin', 'admin_url', 'admin/setting/password', null, '修改密码', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('114', 'Admin', 'admin_url', 'admin/setting/password_post', null, '提交修改', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('115', 'Admin', 'admin_url', 'admin/setting/site', null, '网站信息', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('116', 'Admin', 'admin_url', 'admin/setting/site_post', null, '提交修改', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('117', 'Admin', 'admin_url', 'admin/route/index', null, '路由列表', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('118', 'Admin', 'admin_url', 'admin/route/add', null, '路由添加', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('119', 'Admin', 'admin_url', 'admin/route/add_post', null, '路由添加提交', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('120', 'Admin', 'admin_url', 'admin/route/edit', null, '路由编辑', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('121', 'Admin', 'admin_url', 'admin/route/edit_post', null, '路由编辑提交', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('122', 'Admin', 'admin_url', 'admin/route/delete', null, '路由删除', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('123', 'Admin', 'admin_url', 'admin/route/ban', null, '路由禁止', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('124', 'Admin', 'admin_url', 'admin/route/open', null, '路由启用', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('125', 'Admin', 'admin_url', 'admin/route/listorders', null, '路由排序', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('126', 'Admin', 'admin_url', 'admin/mailer/default', null, '邮箱配置', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('127', 'Admin', 'admin_url', 'admin/mailer/index', null, 'SMTP配置', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('128', 'Admin', 'admin_url', 'admin/mailer/index_post', null, '提交配置', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('129', 'Admin', 'admin_url', 'admin/mailer/active', null, '邮件模板', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('130', 'Admin', 'admin_url', 'admin/mailer/active_post', null, '提交模板', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('131', 'Admin', 'admin_url', 'admin/setting/clearcache', null, '清除缓存', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('132', 'User', 'admin_url', 'user/indexadmin/default', null, '用户管理', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('133', 'User', 'admin_url', 'user/indexadmin/default1', null, '用户组', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('134', 'User', 'admin_url', 'user/indexadmin/index', null, '本站用户', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('135', 'User', 'admin_url', 'user/indexadmin/ban', null, '拉黑会员', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('136', 'User', 'admin_url', 'user/indexadmin/cancelban', null, '启用会员', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('137', 'User', 'admin_url', 'user/oauthadmin/index', null, '第三方用户', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('138', 'User', 'admin_url', 'user/oauthadmin/delete', null, '第三方用户解绑', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('139', 'User', 'admin_url', 'user/indexadmin/default3', null, '管理组', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('140', 'Admin', 'admin_url', 'admin/rbac/index', null, '角色管理', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('141', 'Admin', 'admin_url', 'admin/rbac/member', null, '成员管理', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('142', 'Admin', 'admin_url', 'admin/rbac/authorize', null, '权限设置', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('143', 'Admin', 'admin_url', 'admin/rbac/authorize_post', null, '提交设置', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('144', 'Admin', 'admin_url', 'admin/rbac/roleedit', null, '编辑角色', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('145', 'Admin', 'admin_url', 'admin/rbac/roleedit_post', null, '提交编辑', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('146', 'Admin', 'admin_url', 'admin/rbac/roledelete', null, '删除角色', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('147', 'Admin', 'admin_url', 'admin/rbac/roleadd', null, '添加角色', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('148', 'Admin', 'admin_url', 'admin/rbac/roleadd_post', null, '提交添加', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('149', 'Admin', 'admin_url', 'admin/user/index', null, '管理员', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('150', 'Admin', 'admin_url', 'admin/user/delete', null, '删除管理员', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('151', 'Admin', 'admin_url', 'admin/user/edit', null, '管理员编辑', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('152', 'Admin', 'admin_url', 'admin/user/edit_post', null, '编辑提交', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('153', 'Admin', 'admin_url', 'admin/user/add', null, '管理员添加', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('154', 'Admin', 'admin_url', 'admin/user/add_post', null, '添加提交', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('155', 'Admin', 'admin_url', 'admin/plugin/update', null, '插件更新', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('156', 'Admin', 'admin_url', 'admin/storage/index', null, '文件存储', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('157', 'Admin', 'admin_url', 'admin/storage/setting_post', null, '文件存储设置提交', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('158', 'Admin', 'admin_url', 'admin/slide/ban', null, '禁用幻灯片', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('159', 'Admin', 'admin_url', 'admin/slide/cancelban', null, '启用幻灯片', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('160', 'Admin', 'admin_url', 'admin/user/ban', null, '禁用管理员', '1', '');
INSERT INTO `cmf_auth_rule` VALUES ('161', 'Admin', 'admin_url', 'admin/user/cancelban', null, '启用管理员', '1', '');

-- ----------------------------
-- Table structure for `cmf_comments`
-- ----------------------------
DROP TABLE IF EXISTS `cmf_comments`;
CREATE TABLE `cmf_comments` (
  `count` int(50) DEFAULT NULL,
  `phone` bigint(150) DEFAULT NULL,
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_table` varchar(100) NOT NULL COMMENT '评论内容所在表，不带表前缀',
  `post_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '评论内容 id',
  `url` varchar(255) DEFAULT NULL COMMENT '原文地址',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '发表评论的用户id',
  `to_uid` int(11) NOT NULL DEFAULT '0' COMMENT '被评论的用户id',
  `full_name` varchar(50) DEFAULT NULL COMMENT '评论者昵称',
  `email` varchar(255) DEFAULT NULL COMMENT '评论者邮箱',
  `createtime` datetime NOT NULL DEFAULT '2000-01-01 00:00:00' COMMENT '评论时间',
  `content` text NOT NULL COMMENT '评论内容',
  `type` smallint(1) NOT NULL DEFAULT '1' COMMENT '评论类型；1实名评论',
  `parentid` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '被回复的评论id',
  `path` varchar(500) DEFAULT NULL,
  `status` smallint(1) NOT NULL DEFAULT '1' COMMENT '状态，1已审核，0未审核',
  PRIMARY KEY (`id`),
  KEY `comment_post_ID` (`post_id`),
  KEY `comment_approved_date_gmt` (`status`),
  KEY `comment_parent` (`parentid`),
  KEY `table_id_status` (`post_table`,`post_id`,`status`),
  KEY `createtime` (`createtime`)
) ENGINE=MyISAM AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 COMMENT='评论表';

-- ----------------------------
-- Records of cmf_comments
-- ----------------------------
INSERT INTO `cmf_comments` VALUES (null, '2147483647', '1', 'posts', '3', 'index.php?g=portal&amp;m=article&amp;a=index&amp;', '0', '0', 'nininini', 'nini@nin.com', '2016-05-27 08:43:32', 'ksaljfd;lajf;lkaj;dlkfja;ldfafa', '1', '0', '0-1', '1');
INSERT INTO `cmf_comments` VALUES (null, '222222', '2', 'posts', '3', 'index.php?g=portal&amp;m=article&amp;a=index&amp;', '0', '0', '#2', '#2@qq.com', '2016-05-27 08:59:23', '22222222', '1', '0', '0-2', '1');
INSERT INTO `cmf_comments` VALUES (null, '3333', '3', 'posts', '0', 'index.php?g=portal&amp;m=article&amp;a=index&amp;', '0', '0', '33', '33@qq.com', '2016-05-27 09:04:47', '33333', '1', '0', '0-3', '1');
INSERT INTO `cmf_comments` VALUES (null, '555', '4', 'posts', '0', 'index.php?g=portal&amp;m=article&amp;a=index&amp;id=.%24_GET%5B%27id%27%5D.', '0', '0', '55', '55@qq.com', '2016-05-27 09:08:01', '5555', '1', '0', '0-4', '1');
INSERT INTO `cmf_comments` VALUES (null, '66', '5', 'posts', '0', 'index.php?g=portal&amp;m=article&amp;a=index&amp;id=.%24_GET%5B%27id%27%5D.', '0', '0', '666', '66@66.com', '2016-05-27 09:10:44', '666', '1', '0', '0-5', '1');
INSERT INTO `cmf_comments` VALUES (null, '77', '6', 'posts', '0', 'index.php?g=portal&amp;m=article&amp;a=index&amp;id=.%24_GET%5B%27id%27%5D.', '0', '0', '77', '7@7.com', '2016-05-27 09:11:59', '777', '1', '0', '0-6', '1');
INSERT INTO `cmf_comments` VALUES (null, '888', '7', 'posts', '0', 'index.php?g=portal&amp;m=article&amp;a=index&amp;id=', '0', '0', '88', '88@qq.com', '2016-05-27 09:14:11', '888', '1', '0', '0-7', '1');
INSERT INTO `cmf_comments` VALUES (null, '0', '8', 'posts', '0', 'index.php?g=portal&amp;m=article&amp;a=index&amp;id=', '0', '0', '00', '00@qq.com', '2016-05-27 09:15:34', '000', '1', '0', '0-8', '1');
INSERT INTO `cmf_comments` VALUES (null, '11', '9', 'posts', '9', 'index.php?g=portal&amp;m=article&amp;a=index&amp;id=9', '0', '0', '11', '111@qq.com', '2016-05-27 09:17:12', '11', '1', '0', '0-9', '1');
INSERT INTO `cmf_comments` VALUES (null, '14', '10', 'posts', '10', 'index.php?g=portal&amp;m=article&amp;a=index&amp;id=10', '0', '0', '14', '14@qq.com', '2016-05-27 09:18:32', '14', '1', '0', '0-10', '1');
INSERT INTO `cmf_comments` VALUES (null, '14141', '11', 'posts', '14', 'index.php?g=portal&amp;m=article&amp;a=index&amp;id=14', '0', '0', '141414141', '14141@qq.com', '2016-05-27 09:20:22', '141414', '1', '0', '0-11', '1');
INSERT INTO `cmf_comments` VALUES (null, '131', '12', 'posts', '4', 'index.php?g=portal&amp;m=article&amp;a=index&amp;id=4', '0', '0', 'nul', 'null@qq.com', '2016-05-27 10:43:50', 'null', '1', '0', '0-12', '1');
INSERT INTO `cmf_comments` VALUES (null, '12313', '13', 'posts', '3', 'index.php?g=portal&amp;m=article&amp;a=index&amp;id=3', '0', '0', 'aaaaaaaaaaaa', 'aa@qq.com', '2016-05-27 10:50:54', 'a', '1', '0', '0-13', '1');
INSERT INTO `cmf_comments` VALUES (null, '444444', '14', 'posts', '3', 'index.php?g=portal&amp;m=article&amp;a=index&amp;id=3', '0', '0', '44', '444@qq.com', '2016-05-27 10:51:10', '44444444', '1', '0', '0-14', '1');
INSERT INTO `cmf_comments` VALUES ('12', '123', '15', 'posts', '15', 'index.php?g=portal&amp;m=article&amp;a=index&amp;id=15', '0', '0', '123', '123@qq.com', '2016-05-27 13:55:55', '123', '1', '0', '0-15', '1');
INSERT INTO `cmf_comments` VALUES ('2', '1231', '16', 'posts', '16', 'index.php?g=portal&amp;m=article&amp;a=index&amp;id=16', '0', '0', '1231231', '12@qq.com', '2016-05-27 14:03:53', '1231231231', '1', '0', '0-16', '1');
INSERT INTO `cmf_comments` VALUES ('2', '111', '17', 'posts', '16', 'index.php?g=portal&amp;m=article&amp;a=index&amp;id=16', '0', '0', '1231231', '111@qq.com', '2016-05-27 14:04:21', '113', '1', '0', '0-17', '1');
INSERT INTO `cmf_comments` VALUES (null, '1123', '18', 'posts', '34', 'index.php?g=portal&amp;m=article&amp;a=index&amp;id=34', '0', '0', '111', '11@qq.com', '2016-05-27 16:20:46', '123', '1', '0', '0-18', '1');
INSERT INTO `cmf_comments` VALUES (null, '123', '19', 'posts', '33', 'index.php?g=portal&amp;m=article&amp;a=index&amp;id=33', '0', '0', '123', '12@qq.com', '2016-05-27 17:06:12', '131', '1', '0', '0-19', '1');
INSERT INTO `cmf_comments` VALUES (null, '411321', '20', 'posts', '34', 'index.php?g=portal&amp;m=article&amp;a=index&amp;id=34', '0', '0', '5646', 'io@qq.comq', '2016-05-27 17:17:01', '2', '1', '0', '0-20', '1');
INSERT INTO `cmf_comments` VALUES ('12', '2147483647', '21', 'posts', '15', 'index.php?g=portal&amp;m=article&amp;a=index&amp;id=15', '0', '0', '国学小王子', 'doudouwumi@qq.com', '2016-05-31 17:04:13', '无论时代如何变迁，无论社会如何改变，无论我们会遭遇何种挫折，体验何种快乐，亦或经历何种成长，人这一生总是在学习的路上。学习，需要尺标，需要明灯，需要导师，却有一本著作值得我们去细细品读，去思索，去体悟', '1', '0', '0-21', '1');
INSERT INTO `cmf_comments` VALUES ('12', '2147483647', '22', 'posts', '15', 'index.php?g=portal&amp;m=article&amp;a=index&amp;id=15', '0', '0', '猪不拉屎', 'zhubulashi@qq.com', '2016-05-31 17:17:33', '无论时代如何变迁，无论社会如何改变，无论我们会遭遇何种挫折，体验何种快乐，亦或经历何种成长，人这一生总是在学习的路上。学习，需要尺标，需要明灯，需要导师，却有一本著作值得我们去细细品读，去思索，去体悟', '1', '0', '0-22', '1');
INSERT INTO `cmf_comments` VALUES ('12', '2147483647', '23', 'posts', '15', 'index.php?g=portal&amp;m=article&amp;a=index&amp;id=15', '0', '0', '想飞天的猪', 'xiangfeitiandezhu@qq.com', '2016-05-31 17:22:05', '|| $content==&quot;Message&quot; ', '1', '0', '0-23', '1');
INSERT INTO `cmf_comments` VALUES ('12', '11111', '24', 'posts', '15', 'index.php?g=portal&amp;m=article&amp;a=index&amp;id=15', '0', '0', '4333', '333@qq.com', '2016-05-31 17:23:31', '1111', '1', '0', '0-24', '1');
INSERT INTO `cmf_comments` VALUES ('12', '2147483647', '25', 'posts', '15', 'index.php?g=portal&amp;m=article&amp;a=index&amp;id=15', '0', '0', '123123', '123@qq.com', '2016-05-31 17:24:01', '13415908267', '1', '0', '0-25', '1');
INSERT INTO `cmf_comments` VALUES ('12', '123123', '26', 'posts', '15', 'index.php?g=portal&amp;m=article&amp;a=index&amp;id=15', '0', '0', '123123', '123123@qq.com', '2016-05-31 17:33:18', '123123', '1', '0', '0-26', '1');
INSERT INTO `cmf_comments` VALUES ('12', '2147483647', '27', 'posts', '15', 'index.php?g=portal&amp;m=article&amp;a=index&amp;id=15', '0', '0', '2222', '22@qq.com', '2016-05-31 17:33:55', '22222222222', '1', '0', '0-27', '1');
INSERT INTO `cmf_comments` VALUES ('12', '2147483647', '28', 'posts', '15', 'index.php?g=portal&amp;m=article&amp;a=index&amp;id=15', '0', '0', '333333333333', '333333@qq.com', '2016-05-31 17:41:06', '13415908267', '1', '0', '0-28', '1');
INSERT INTO `cmf_comments` VALUES ('12', '2147483647', '29', 'posts', '15', 'index.php?g=portal&amp;m=article&amp;a=index&amp;id=15', '0', '0', '44444444444', '444@qq.com', '2016-05-31 17:41:54', '13113165466', '1', '0', '0-29', '1');
INSERT INTO `cmf_comments` VALUES ('12', '13113165466', '30', 'posts', '15', 'index.php?g=portal&amp;m=article&amp;a=index&amp;id=15', '0', '0', '555555555', '555@qq.com', '2016-05-31 17:43:29', '13113165466', '1', '0', '0-30', '1');
INSERT INTO `cmf_comments` VALUES ('11', null, '31', '', '0', null, '0', '0', null, null, '2000-01-01 00:00:00', '', '1', '0', null, '1');
INSERT INTO `cmf_comments` VALUES ('11', null, '32', '', '0', null, '0', '0', null, null, '2000-01-01 00:00:00', '', '1', '0', null, '1');
INSERT INTO `cmf_comments` VALUES ('12', '13415908267', '33', 'posts', '15', 'index.php?g=portal&amp;m=article&amp;a=index&amp;id=15', '0', '0', 'zhuzhu', 'zhuzhu@qq.com', '2016-06-01 08:54:06', 'zhuzhuzhuzhuzhuzhuhzuhzu', '1', '0', '0-33', '1');
INSERT INTO `cmf_comments` VALUES (null, '999999999999', '34', 'posts', '5', 'index.php?g=portal&amp;m=article&amp;a=index&amp;id=5', '0', '0', '为什么没有留言', 'weishenme@qq.com', '2016-06-01 12:00:58', '留言为什么短？？？？留言为什么短？？？？留言为什么短？？？？留言为什么短？？？？留言为什么短？？？？留言为什么短？？？？留言为什么短？？？？留言为什么短？？？？留言为什么短？？？？留言为什么短？？？？留言为什么短？？？？留言为什么短？？？？留言为什么短？？？？留言为什么短？？？？留言为什么短？？？？留言为什么短？？？？留言为什么短？？？？留言为什么短？？？？', '1', '0', '0-34', '1');

-- ----------------------------
-- Table structure for `cmf_common_action_log`
-- ----------------------------
DROP TABLE IF EXISTS `cmf_common_action_log`;
CREATE TABLE `cmf_common_action_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` bigint(20) DEFAULT '0' COMMENT '用户id',
  `object` varchar(100) DEFAULT NULL COMMENT '访问对象的id,格式：不带前缀的表名+id;如posts1表示xx_posts表里id为1的记录',
  `action` varchar(50) DEFAULT NULL COMMENT '操作名称；格式规定为：应用名+控制器+操作名；也可自己定义格式只要不发生冲突且惟一；',
  `count` int(11) DEFAULT '0' COMMENT '访问次数',
  `last_time` int(11) DEFAULT '0' COMMENT '最后访问的时间戳',
  `ip` varchar(15) DEFAULT NULL COMMENT '访问者最后访问ip',
  PRIMARY KEY (`id`),
  KEY `user_object_action` (`user`,`object`,`action`),
  KEY `user_object_action_ip` (`user`,`object`,`action`,`ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='访问记录表';

-- ----------------------------
-- Records of cmf_common_action_log
-- ----------------------------

-- ----------------------------
-- Table structure for `cmf_guestbook`
-- ----------------------------
DROP TABLE IF EXISTS `cmf_guestbook`;
CREATE TABLE `cmf_guestbook` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `full_name` varchar(50) NOT NULL COMMENT '留言者姓名',
  `email` varchar(100) NOT NULL COMMENT '留言者邮箱',
  `title` varchar(255) DEFAULT NULL COMMENT '留言标题',
  `msg` text NOT NULL COMMENT '留言内容',
  `createtime` datetime NOT NULL COMMENT '留言时间',
  `status` smallint(2) NOT NULL DEFAULT '1' COMMENT '留言状态，1：正常，0：删除',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='留言表';

-- ----------------------------
-- Records of cmf_guestbook
-- ----------------------------
INSERT INTO `cmf_guestbook` VALUES ('1', 'kg', '111@qq.com', null, 'gjkg', '2016-05-26 15:56:24', '1');
INSERT INTO `cmf_guestbook` VALUES ('2', 'zhu', 'zhu@zhu.com', '123131123', 'aaikaljffjkjfkkjlajklfal;jksfasasf', '2016-05-26 16:03:39', '1');
INSERT INTO `cmf_guestbook` VALUES ('3', 'aaaaaaaaaaazxcz', 'acz@acaa.com', null, 'acvxzvbvxnx451601', '2016-05-27 15:14:55', '1');

-- ----------------------------
-- Table structure for `cmf_links`
-- ----------------------------
DROP TABLE IF EXISTS `cmf_links`;
CREATE TABLE `cmf_links` (
  `link_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `link_url` varchar(255) NOT NULL COMMENT '友情链接地址',
  `link_name` varchar(255) NOT NULL COMMENT '友情链接名称',
  `link_image` varchar(255) DEFAULT NULL COMMENT '友情链接图标',
  `link_target` varchar(25) NOT NULL DEFAULT '_blank' COMMENT '友情链接打开方式',
  `link_description` text NOT NULL COMMENT '友情链接描述',
  `link_status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1显示，0不显示',
  `link_rating` int(11) NOT NULL DEFAULT '0' COMMENT '友情链接评级',
  `link_rel` varchar(255) DEFAULT NULL COMMENT '链接与网站的关系',
  `listorder` int(10) NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`link_id`),
  KEY `link_visible` (`link_status`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='友情链接表';

-- ----------------------------
-- Records of cmf_links
-- ----------------------------
INSERT INTO `cmf_links` VALUES ('1', 'http://www.tigonetwork.com', 'TIGO', '', '_blank', '', '1', '0', '', '0');

-- ----------------------------
-- Table structure for `cmf_menu`
-- ----------------------------
DROP TABLE IF EXISTS `cmf_menu`;
CREATE TABLE `cmf_menu` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `parentid` smallint(6) unsigned NOT NULL DEFAULT '0',
  `app` char(20) NOT NULL COMMENT '应用名称app',
  `model` char(20) NOT NULL COMMENT '控制器',
  `action` char(20) NOT NULL COMMENT '操作名称',
  `data` char(50) NOT NULL COMMENT '额外参数',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '菜单类型  1：权限认证+菜单；0：只作为菜单',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '状态，1显示，0不显示',
  `name` varchar(50) NOT NULL COMMENT '菜单名称',
  `icon` varchar(50) DEFAULT NULL COMMENT '菜单图标',
  `remark` varchar(255) NOT NULL COMMENT '备注',
  `listorder` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '排序ID',
  PRIMARY KEY (`id`),
  KEY `status` (`status`),
  KEY `parentid` (`parentid`),
  KEY `model` (`model`)
) ENGINE=MyISAM AUTO_INCREMENT=162 DEFAULT CHARSET=utf8 COMMENT='后台菜单表';

-- ----------------------------
-- Records of cmf_menu
-- ----------------------------
INSERT INTO `cmf_menu` VALUES ('1', '0', 'Admin', 'Content', 'default', '', '0', '1', '内容管理', 'th', '', '30');
INSERT INTO `cmf_menu` VALUES ('2', '1', 'Api', 'Guestbookadmin', 'index', '', '1', '1', '所有留言', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('3', '2', 'Api', 'Guestbookadmin', 'delete', '', '1', '0', '删除网站留言', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('4', '1', 'Comment', 'Commentadmin', 'index', '', '1', '1', '评论管理', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('5', '4', 'Comment', 'Commentadmin', 'delete', '', '1', '0', '删除评论', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('6', '4', 'Comment', 'Commentadmin', 'check', '', '1', '0', '评论审核', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('7', '1', 'Portal', 'AdminPost', 'index', '', '1', '1', '文章管理', '', '', '1');
INSERT INTO `cmf_menu` VALUES ('8', '7', 'Portal', 'AdminPost', 'listorders', '', '1', '0', '文章排序', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('9', '7', 'Portal', 'AdminPost', 'top', '', '1', '0', '文章置顶', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('10', '7', 'Portal', 'AdminPost', 'recommend', '', '1', '0', '文章推荐', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('11', '7', 'Portal', 'AdminPost', 'move', '', '1', '0', '批量移动', '', '', '1000');
INSERT INTO `cmf_menu` VALUES ('12', '7', 'Portal', 'AdminPost', 'check', '', '1', '0', '文章审核', '', '', '1000');
INSERT INTO `cmf_menu` VALUES ('13', '7', 'Portal', 'AdminPost', 'delete', '', '1', '0', '删除文章', '', '', '1000');
INSERT INTO `cmf_menu` VALUES ('14', '7', 'Portal', 'AdminPost', 'edit', '', '1', '0', '编辑文章', '', '', '1000');
INSERT INTO `cmf_menu` VALUES ('15', '14', 'Portal', 'AdminPost', 'edit_post', '', '1', '0', '提交编辑', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('16', '7', 'Portal', 'AdminPost', 'add', '', '1', '0', '添加文章', '', '', '1000');
INSERT INTO `cmf_menu` VALUES ('17', '16', 'Portal', 'AdminPost', 'add_post', '', '1', '0', '提交添加', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('18', '1', 'Portal', 'AdminTerm', 'index', '', '0', '1', '分类管理', '', '', '2');
INSERT INTO `cmf_menu` VALUES ('19', '18', 'Portal', 'AdminTerm', 'listorders', '', '1', '0', '文章分类排序', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('20', '18', 'Portal', 'AdminTerm', 'delete', '', '1', '0', '删除分类', '', '', '1000');
INSERT INTO `cmf_menu` VALUES ('21', '18', 'Portal', 'AdminTerm', 'edit', '', '1', '0', '编辑分类', '', '', '1000');
INSERT INTO `cmf_menu` VALUES ('22', '21', 'Portal', 'AdminTerm', 'edit_post', '', '1', '0', '提交编辑', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('23', '18', 'Portal', 'AdminTerm', 'add', '', '1', '0', '添加分类', '', '', '1000');
INSERT INTO `cmf_menu` VALUES ('24', '23', 'Portal', 'AdminTerm', 'add_post', '', '1', '0', '提交添加', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('25', '1', 'Portal', 'AdminPage', 'index', '', '1', '1', '页面管理', '', '', '3');
INSERT INTO `cmf_menu` VALUES ('26', '25', 'Portal', 'AdminPage', 'listorders', '', '1', '0', '页面排序', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('27', '25', 'Portal', 'AdminPage', 'delete', '', '1', '0', '删除页面', '', '', '1000');
INSERT INTO `cmf_menu` VALUES ('28', '25', 'Portal', 'AdminPage', 'edit', '', '1', '0', '编辑页面', '', '', '1000');
INSERT INTO `cmf_menu` VALUES ('29', '28', 'Portal', 'AdminPage', 'edit_post', '', '1', '0', '提交编辑', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('30', '25', 'Portal', 'AdminPage', 'add', '', '1', '0', '添加页面', '', '', '1000');
INSERT INTO `cmf_menu` VALUES ('31', '30', 'Portal', 'AdminPage', 'add_post', '', '1', '0', '提交添加', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('32', '1', 'Admin', 'Recycle', 'default', '', '1', '1', '回收站', '', '', '4');
INSERT INTO `cmf_menu` VALUES ('33', '32', 'Portal', 'AdminPost', 'recyclebin', '', '1', '1', '文章回收', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('34', '33', 'Portal', 'AdminPost', 'restore', '', '1', '0', '文章还原', '', '', '1000');
INSERT INTO `cmf_menu` VALUES ('35', '33', 'Portal', 'AdminPost', 'clean', '', '1', '0', '彻底删除', '', '', '1000');
INSERT INTO `cmf_menu` VALUES ('36', '32', 'Portal', 'AdminPage', 'recyclebin', '', '1', '1', '页面回收', '', '', '1');
INSERT INTO `cmf_menu` VALUES ('37', '36', 'Portal', 'AdminPage', 'clean', '', '1', '0', '彻底删除', '', '', '1000');
INSERT INTO `cmf_menu` VALUES ('38', '36', 'Portal', 'AdminPage', 'restore', '', '1', '0', '页面还原', '', '', '1000');
INSERT INTO `cmf_menu` VALUES ('39', '0', 'Admin', 'Extension', 'default', '', '0', '1', '扩展工具', 'cloud', '', '40');
INSERT INTO `cmf_menu` VALUES ('40', '39', 'Admin', 'Backup', 'default', '', '1', '1', '备份管理', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('41', '40', 'Admin', 'Backup', 'restore', '', '1', '1', '数据还原', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('42', '40', 'Admin', 'Backup', 'index', '', '1', '1', '数据备份', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('43', '42', 'Admin', 'Backup', 'index_post', '', '1', '0', '提交数据备份', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('44', '40', 'Admin', 'Backup', 'download', '', '1', '0', '下载备份', '', '', '1000');
INSERT INTO `cmf_menu` VALUES ('45', '40', 'Admin', 'Backup', 'del_backup', '', '1', '0', '删除备份', '', '', '1000');
INSERT INTO `cmf_menu` VALUES ('46', '40', 'Admin', 'Backup', 'import', '', '1', '0', '数据备份导入', '', '', '1000');
INSERT INTO `cmf_menu` VALUES ('47', '39', 'Admin', 'Plugin', 'index', '', '1', '1', '插件管理', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('48', '47', 'Admin', 'Plugin', 'toggle', '', '1', '0', '插件启用切换', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('49', '47', 'Admin', 'Plugin', 'setting', '', '1', '0', '插件设置', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('50', '49', 'Admin', 'Plugin', 'setting_post', '', '1', '0', '插件设置提交', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('51', '47', 'Admin', 'Plugin', 'install', '', '1', '0', '插件安装', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('52', '47', 'Admin', 'Plugin', 'uninstall', '', '1', '0', '插件卸载', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('53', '39', 'Admin', 'Slide', 'default', '', '1', '1', '幻灯片', '', '', '1');
INSERT INTO `cmf_menu` VALUES ('54', '53', 'Admin', 'Slide', 'index', '', '1', '1', '幻灯片管理', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('55', '54', 'Admin', 'Slide', 'listorders', '', '1', '0', '幻灯片排序', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('56', '54', 'Admin', 'Slide', 'toggle', '', '1', '0', '幻灯片显示切换', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('57', '54', 'Admin', 'Slide', 'delete', '', '1', '0', '删除幻灯片', '', '', '1000');
INSERT INTO `cmf_menu` VALUES ('58', '54', 'Admin', 'Slide', 'edit', '', '1', '0', '编辑幻灯片', '', '', '1000');
INSERT INTO `cmf_menu` VALUES ('59', '58', 'Admin', 'Slide', 'edit_post', '', '1', '0', '提交编辑', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('60', '54', 'Admin', 'Slide', 'add', '', '1', '0', '添加幻灯片', '', '', '1000');
INSERT INTO `cmf_menu` VALUES ('61', '60', 'Admin', 'Slide', 'add_post', '', '1', '0', '提交添加', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('62', '53', 'Admin', 'Slidecat', 'index', '', '1', '1', '幻灯片分类', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('63', '62', 'Admin', 'Slidecat', 'delete', '', '1', '0', '删除分类', '', '', '1000');
INSERT INTO `cmf_menu` VALUES ('64', '62', 'Admin', 'Slidecat', 'edit', '', '1', '0', '编辑分类', '', '', '1000');
INSERT INTO `cmf_menu` VALUES ('65', '64', 'Admin', 'Slidecat', 'edit_post', '', '1', '0', '提交编辑', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('66', '62', 'Admin', 'Slidecat', 'add', '', '1', '0', '添加分类', '', '', '1000');
INSERT INTO `cmf_menu` VALUES ('67', '66', 'Admin', 'Slidecat', 'add_post', '', '1', '0', '提交添加', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('68', '39', 'Admin', 'Ad', 'index', '', '1', '1', '网站广告', '', '', '2');
INSERT INTO `cmf_menu` VALUES ('69', '68', 'Admin', 'Ad', 'toggle', '', '1', '0', '广告显示切换', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('70', '68', 'Admin', 'Ad', 'delete', '', '1', '0', '删除广告', '', '', '1000');
INSERT INTO `cmf_menu` VALUES ('71', '68', 'Admin', 'Ad', 'edit', '', '1', '0', '编辑广告', '', '', '1000');
INSERT INTO `cmf_menu` VALUES ('72', '71', 'Admin', 'Ad', 'edit_post', '', '1', '0', '提交编辑', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('73', '68', 'Admin', 'Ad', 'add', '', '1', '0', '添加广告', '', '', '1000');
INSERT INTO `cmf_menu` VALUES ('74', '73', 'Admin', 'Ad', 'add_post', '', '1', '0', '提交添加', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('75', '39', 'Admin', 'Link', 'index', '', '0', '1', '友情链接', '', '', '3');
INSERT INTO `cmf_menu` VALUES ('76', '75', 'Admin', 'Link', 'listorders', '', '1', '0', '友情链接排序', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('77', '75', 'Admin', 'Link', 'toggle', '', '1', '0', '友链显示切换', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('78', '75', 'Admin', 'Link', 'delete', '', '1', '0', '删除友情链接', '', '', '1000');
INSERT INTO `cmf_menu` VALUES ('79', '75', 'Admin', 'Link', 'edit', '', '1', '0', '编辑友情链接', '', '', '1000');
INSERT INTO `cmf_menu` VALUES ('80', '79', 'Admin', 'Link', 'edit_post', '', '1', '0', '提交编辑', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('81', '75', 'Admin', 'Link', 'add', '', '1', '0', '添加友情链接', '', '', '1000');
INSERT INTO `cmf_menu` VALUES ('82', '81', 'Admin', 'Link', 'add_post', '', '1', '0', '提交添加', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('83', '39', 'Api', 'Oauthadmin', 'setting', '', '1', '1', '第三方登陆', 'leaf', '', '4');
INSERT INTO `cmf_menu` VALUES ('84', '83', 'Api', 'Oauthadmin', 'setting_post', '', '1', '0', '提交设置', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('85', '0', 'Admin', 'Menu', 'default', '', '1', '1', '菜单管理', 'list', '', '20');
INSERT INTO `cmf_menu` VALUES ('86', '85', 'Admin', 'Navcat', 'default1', '', '1', '1', '前台菜单', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('87', '86', 'Admin', 'Nav', 'index', '', '1', '1', '菜单管理', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('88', '87', 'Admin', 'Nav', 'listorders', '', '1', '0', '前台导航排序', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('89', '87', 'Admin', 'Nav', 'delete', '', '1', '0', '删除菜单', '', '', '1000');
INSERT INTO `cmf_menu` VALUES ('90', '87', 'Admin', 'Nav', 'edit', '', '1', '0', '编辑菜单', '', '', '1000');
INSERT INTO `cmf_menu` VALUES ('91', '90', 'Admin', 'Nav', 'edit_post', '', '1', '0', '提交编辑', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('92', '87', 'Admin', 'Nav', 'add', '', '1', '0', '添加菜单', '', '', '1000');
INSERT INTO `cmf_menu` VALUES ('93', '92', 'Admin', 'Nav', 'add_post', '', '1', '0', '提交添加', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('94', '86', 'Admin', 'Navcat', 'index', '', '1', '1', '菜单分类', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('95', '94', 'Admin', 'Navcat', 'delete', '', '1', '0', '删除分类', '', '', '1000');
INSERT INTO `cmf_menu` VALUES ('96', '94', 'Admin', 'Navcat', 'edit', '', '1', '0', '编辑分类', '', '', '1000');
INSERT INTO `cmf_menu` VALUES ('97', '96', 'Admin', 'Navcat', 'edit_post', '', '1', '0', '提交编辑', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('98', '94', 'Admin', 'Navcat', 'add', '', '1', '0', '添加分类', '', '', '1000');
INSERT INTO `cmf_menu` VALUES ('99', '98', 'Admin', 'Navcat', 'add_post', '', '1', '0', '提交添加', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('100', '85', 'Admin', 'Menu', 'index', '', '1', '1', '后台菜单', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('101', '100', 'Admin', 'Menu', 'add', '', '1', '0', '添加菜单', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('102', '101', 'Admin', 'Menu', 'add_post', '', '1', '0', '提交添加', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('103', '100', 'Admin', 'Menu', 'listorders', '', '1', '0', '后台菜单排序', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('104', '100', 'Admin', 'Menu', 'export_menu', '', '1', '0', '菜单备份', '', '', '1000');
INSERT INTO `cmf_menu` VALUES ('105', '100', 'Admin', 'Menu', 'edit', '', '1', '0', '编辑菜单', '', '', '1000');
INSERT INTO `cmf_menu` VALUES ('106', '105', 'Admin', 'Menu', 'edit_post', '', '1', '0', '提交编辑', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('107', '100', 'Admin', 'Menu', 'delete', '', '1', '0', '删除菜单', '', '', '1000');
INSERT INTO `cmf_menu` VALUES ('108', '100', 'Admin', 'Menu', 'lists', '', '1', '0', '所有菜单', '', '', '1000');
INSERT INTO `cmf_menu` VALUES ('109', '0', 'Admin', 'Setting', 'default', '', '0', '1', '设置', 'cogs', '', '0');
INSERT INTO `cmf_menu` VALUES ('110', '109', 'Admin', 'Setting', 'userdefault', '', '0', '1', '个人信息', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('111', '110', 'Admin', 'User', 'userinfo', '', '1', '1', '修改信息', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('112', '111', 'Admin', 'User', 'userinfo_post', '', '1', '0', '修改信息提交', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('113', '110', 'Admin', 'Setting', 'password', '', '1', '1', '修改密码', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('114', '113', 'Admin', 'Setting', 'password_post', '', '1', '0', '提交修改', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('115', '109', 'Admin', 'Setting', 'site', '', '1', '1', '网站信息', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('116', '115', 'Admin', 'Setting', 'site_post', '', '1', '0', '提交修改', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('117', '115', 'Admin', 'Route', 'index', '', '1', '0', '路由列表', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('118', '115', 'Admin', 'Route', 'add', '', '1', '0', '路由添加', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('119', '118', 'Admin', 'Route', 'add_post', '', '1', '0', '路由添加提交', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('120', '115', 'Admin', 'Route', 'edit', '', '1', '0', '路由编辑', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('121', '120', 'Admin', 'Route', 'edit_post', '', '1', '0', '路由编辑提交', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('122', '115', 'Admin', 'Route', 'delete', '', '1', '0', '路由删除', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('123', '115', 'Admin', 'Route', 'ban', '', '1', '0', '路由禁止', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('124', '115', 'Admin', 'Route', 'open', '', '1', '0', '路由启用', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('125', '115', 'Admin', 'Route', 'listorders', '', '1', '0', '路由排序', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('126', '109', 'Admin', 'Mailer', 'default', '', '1', '1', '邮箱配置', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('127', '126', 'Admin', 'Mailer', 'index', '', '1', '1', 'SMTP配置', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('128', '127', 'Admin', 'Mailer', 'index_post', '', '1', '0', '提交配置', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('129', '126', 'Admin', 'Mailer', 'active', '', '1', '1', '邮件模板', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('130', '129', 'Admin', 'Mailer', 'active_post', '', '1', '0', '提交模板', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('131', '109', 'Admin', 'Setting', 'clearcache', '', '1', '1', '清除缓存', '', '', '1');
INSERT INTO `cmf_menu` VALUES ('132', '0', 'User', 'Indexadmin', 'default', '', '1', '1', '用户管理', 'group', '', '10');
INSERT INTO `cmf_menu` VALUES ('133', '132', 'User', 'Indexadmin', 'default1', '', '1', '1', '用户组', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('134', '133', 'User', 'Indexadmin', 'index', '', '1', '1', '本站用户', 'leaf', '', '0');
INSERT INTO `cmf_menu` VALUES ('135', '134', 'User', 'Indexadmin', 'ban', '', '1', '0', '拉黑会员', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('136', '134', 'User', 'Indexadmin', 'cancelban', '', '1', '0', '启用会员', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('137', '133', 'User', 'Oauthadmin', 'index', '', '1', '1', '第三方用户', 'leaf', '', '0');
INSERT INTO `cmf_menu` VALUES ('138', '137', 'User', 'Oauthadmin', 'delete', '', '1', '0', '第三方用户解绑', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('139', '132', 'User', 'Indexadmin', 'default3', '', '1', '1', '管理组', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('140', '139', 'Admin', 'Rbac', 'index', '', '1', '1', '角色管理', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('141', '140', 'Admin', 'Rbac', 'member', '', '1', '0', '成员管理', '', '', '1000');
INSERT INTO `cmf_menu` VALUES ('142', '140', 'Admin', 'Rbac', 'authorize', '', '1', '0', '权限设置', '', '', '1000');
INSERT INTO `cmf_menu` VALUES ('143', '142', 'Admin', 'Rbac', 'authorize_post', '', '1', '0', '提交设置', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('144', '140', 'Admin', 'Rbac', 'roleedit', '', '1', '0', '编辑角色', '', '', '1000');
INSERT INTO `cmf_menu` VALUES ('145', '144', 'Admin', 'Rbac', 'roleedit_post', '', '1', '0', '提交编辑', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('146', '140', 'Admin', 'Rbac', 'roledelete', '', '1', '1', '删除角色', '', '', '1000');
INSERT INTO `cmf_menu` VALUES ('147', '140', 'Admin', 'Rbac', 'roleadd', '', '1', '1', '添加角色', '', '', '1000');
INSERT INTO `cmf_menu` VALUES ('148', '147', 'Admin', 'Rbac', 'roleadd_post', '', '1', '0', '提交添加', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('149', '139', 'Admin', 'User', 'index', '', '1', '1', '管理员', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('150', '149', 'Admin', 'User', 'delete', '', '1', '0', '删除管理员', '', '', '1000');
INSERT INTO `cmf_menu` VALUES ('151', '149', 'Admin', 'User', 'edit', '', '1', '0', '管理员编辑', '', '', '1000');
INSERT INTO `cmf_menu` VALUES ('152', '151', 'Admin', 'User', 'edit_post', '', '1', '0', '编辑提交', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('153', '149', 'Admin', 'User', 'add', '', '1', '0', '管理员添加', '', '', '1000');
INSERT INTO `cmf_menu` VALUES ('154', '153', 'Admin', 'User', 'add_post', '', '1', '0', '添加提交', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('155', '47', 'Admin', 'Plugin', 'update', '', '1', '0', '插件更新', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('156', '39', 'Admin', 'Storage', 'index', '', '1', '1', '文件存储', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('157', '156', 'Admin', 'Storage', 'setting_post', '', '1', '0', '文件存储设置提交', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('158', '54', 'Admin', 'Slide', 'ban', '', '1', '0', '禁用幻灯片', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('159', '54', 'Admin', 'Slide', 'cancelban', '', '1', '0', '启用幻灯片', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('160', '149', 'Admin', 'User', 'ban', '', '1', '0', '禁用管理员', '', '', '0');
INSERT INTO `cmf_menu` VALUES ('161', '149', 'Admin', 'User', 'cancelban', '', '1', '0', '启用管理员', '', '', '0');

-- ----------------------------
-- Table structure for `cmf_nav`
-- ----------------------------
DROP TABLE IF EXISTS `cmf_nav`;
CREATE TABLE `cmf_nav` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) NOT NULL COMMENT '导航分类 id',
  `parentid` int(11) NOT NULL COMMENT '导航父 id',
  `label` varchar(255) NOT NULL COMMENT '导航标题',
  `target` varchar(50) DEFAULT NULL COMMENT '打开方式',
  `href` varchar(255) NOT NULL COMMENT '导航链接',
  `icon` varchar(255) NOT NULL COMMENT '导航图标',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1显示，0不显示',
  `listorder` int(6) DEFAULT '0' COMMENT '排序',
  `path` varchar(255) NOT NULL DEFAULT '0' COMMENT '层级关系',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='前台导航表';

-- ----------------------------
-- Records of cmf_nav
-- ----------------------------
INSERT INTO `cmf_nav` VALUES ('1', '1', '0', '首页', '', 'home', '', '1', '0', '0-1');
INSERT INTO `cmf_nav` VALUES ('2', '1', '0', '列表演示', '', 'home', '', '0', '0', '0-2');
INSERT INTO `cmf_nav` VALUES ('3', '1', '0', '瀑布流', '', 'home', '', '0', '0', '0-3');
INSERT INTO `cmf_nav` VALUES ('4', '1', '0', '公司介绍', '', 'a:2:{s:6:\"action\";s:17:\"Portal/List/index\";s:5:\"param\";a:1:{s:2:\"id\";s:1:\"3\";}}', '', '1', '0', '0-4');
INSERT INTO `cmf_nav` VALUES ('5', '1', '0', '新闻中心', '', 'a:2:{s:6:\"action\";s:17:\"Portal/List/index\";s:5:\"param\";a:1:{s:2:\"id\";s:1:\"4\";}}', '', '1', '0', '0-5');
INSERT INTO `cmf_nav` VALUES ('6', '1', '0', 'Pages', '', 'a:2:{s:6:\"action\";s:17:\"Portal/List/index\";s:5:\"param\";a:1:{s:2:\"id\";s:1:\"5\";}}', '', '0', '0', '0-6');
INSERT INTO `cmf_nav` VALUES ('7', '1', '0', '活动展示', '', 'a:2:{s:6:\"action\";s:17:\"Portal/List/index\";s:5:\"param\";a:1:{s:2:\"id\";s:1:\"6\";}}', '', '1', '0', '0-7');
INSERT INTO `cmf_nav` VALUES ('8', '1', '0', '联系我们', '', 'a:2:{s:6:\"action\";s:17:\"Portal/Page/index\";s:5:\"param\";a:1:{s:2:\"id\";s:1:\"1\";}}', '', '1', '0', '0-8');

-- ----------------------------
-- Table structure for `cmf_nav_cat`
-- ----------------------------
DROP TABLE IF EXISTS `cmf_nav_cat`;
CREATE TABLE `cmf_nav_cat` (
  `navcid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '导航分类名',
  `active` int(1) NOT NULL DEFAULT '1' COMMENT '是否为主菜单，1是，0不是',
  `remark` text COMMENT '备注',
  PRIMARY KEY (`navcid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='前台导航分类表';

-- ----------------------------
-- Records of cmf_nav_cat
-- ----------------------------
INSERT INTO `cmf_nav_cat` VALUES ('1', '主导航', '1', '主导航');

-- ----------------------------
-- Table structure for `cmf_oauth_user`
-- ----------------------------
DROP TABLE IF EXISTS `cmf_oauth_user`;
CREATE TABLE `cmf_oauth_user` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `from` varchar(20) NOT NULL COMMENT '用户来源key',
  `name` varchar(30) NOT NULL COMMENT '第三方昵称',
  `head_img` varchar(200) NOT NULL COMMENT '头像',
  `uid` int(20) NOT NULL COMMENT '关联的本站用户id',
  `create_time` datetime NOT NULL COMMENT '绑定时间',
  `last_login_time` datetime NOT NULL COMMENT '最后登录时间',
  `last_login_ip` varchar(16) NOT NULL COMMENT '最后登录ip',
  `login_times` int(6) NOT NULL COMMENT '登录次数',
  `status` tinyint(2) NOT NULL,
  `access_token` varchar(512) NOT NULL,
  `expires_date` int(11) NOT NULL COMMENT 'access_token过期时间',
  `openid` varchar(40) NOT NULL COMMENT '第三方用户id',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='第三方用户表';

-- ----------------------------
-- Records of cmf_oauth_user
-- ----------------------------

-- ----------------------------
-- Table structure for `cmf_options`
-- ----------------------------
DROP TABLE IF EXISTS `cmf_options`;
CREATE TABLE `cmf_options` (
  `option_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `option_name` varchar(64) NOT NULL COMMENT '配置名',
  `option_value` longtext NOT NULL COMMENT '配置值',
  `autoload` int(2) NOT NULL DEFAULT '1' COMMENT '是否自动加载',
  PRIMARY KEY (`option_id`),
  UNIQUE KEY `option_name` (`option_name`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='全站配置表';

-- ----------------------------
-- Records of cmf_options
-- ----------------------------
INSERT INTO `cmf_options` VALUES ('1', 'member_email_active', '{\"title\":\"TIGO\\u90ae\\u4ef6\\u6fc0\\u6d3b\\u901a\\u77e5.\",\"template\":\"<p>\\u672c\\u90ae\\u4ef6\\u6765\\u81ea<a href=\\\"http:\\/\\/www.tigonetwork.com\\\">TIGO<\\/a><br\\/><br\\/>&nbsp; &nbsp;<strong>---------------<\\/strong><br\\/>&nbsp; &nbsp;<strong>\\u5e10\\u53f7\\u6fc0\\u6d3b\\u8bf4\\u660e<\\/strong><br\\/>&nbsp; &nbsp;<strong>---------------<\\/strong><br\\/><br\\/>&nbsp; &nbsp; \\u5c0a\\u656c\\u7684<span style=\\\"FONT-SIZE: 16px; FONT-FAMILY: Arial; COLOR: rgb(51,51,51); LINE-HEIGHT: 18px; BACKGROUND-COLOR: rgb(255,255,255)\\\">#username#\\uff0c\\u60a8\\u597d\\u3002<\\/span>\\u5982\\u679c\\u60a8\\u662fTIGO\\u7684\\u65b0\\u7528\\u6237\\uff0c\\u6216\\u5728\\u4fee\\u6539\\u60a8\\u7684\\u6ce8\\u518cEmail\\u65f6\\u4f7f\\u7528\\u4e86\\u672c\\u5730\\u5740\\uff0c\\u6211\\u4eec\\u9700\\u8981\\u5bf9\\u60a8\\u7684\\u5730\\u5740\\u6709\\u6548\\u6027\\u8fdb\\u884c\\u9a8c\\u8bc1\\u4ee5\\u907f\\u514d\\u5783\\u573e\\u90ae\\u4ef6\\u6216\\u5730\\u5740\\u88ab\\u6ee5\\u7528\\u3002<br\\/>&nbsp; &nbsp; \\u60a8\\u53ea\\u9700\\u70b9\\u51fb\\u4e0b\\u9762\\u7684\\u94fe\\u63a5\\u5373\\u53ef\\u6fc0\\u6d3b\\u60a8\\u7684\\u5e10\\u53f7\\uff1a<br\\/>&nbsp; &nbsp; <a title=\\\"\\\" href=\\\"http:\\/\\/#link#\\\" target=\\\"_self\\\">http:\\/\\/#link#<\\/a><br\\/>&nbsp; &nbsp; (\\u5982\\u679c\\u4e0a\\u9762\\u4e0d\\u662f\\u94fe\\u63a5\\u5f62\\u5f0f\\uff0c\\u8bf7\\u5c06\\u8be5\\u5730\\u5740\\u624b\\u5de5\\u7c98\\u8d34\\u5230\\u6d4f\\u89c8\\u5668\\u5730\\u5740\\u680f\\u518d\\u8bbf\\u95ee)<br\\/>&nbsp; &nbsp; \\u611f\\u8c22\\u60a8\\u7684\\u8bbf\\u95ee\\uff0c\\u795d\\u60a8\\u4f7f\\u7528\\u6109\\u5feb\\uff01<br\\/><br\\/>&nbsp; &nbsp; \\u6b64\\u81f4<br\\/>&nbsp; &nbsp; TIGO \\u7ba1\\u7406\\u56e2\\u961f.<\\/p>\"}', '1');
INSERT INTO `cmf_options` VALUES ('2', 'site_options', '{\"site_name\":\"TIGO\\u5185\\u5bb9\\u7ba1\\u7406\\u6846\\u67b6\",\"site_host\":\"http:\\/\\/localhost\\/thinkcmftigo\\/\",\"site_admin_url_password\":\"\",\"site_tpl\":\"maje\",\"site_adminstyle\":\"bluesky\",\"site_icp\":\"\",\"site_admin_email\":\"admin@qq.com\",\"site_tongji\":\"\",\"site_copyright\":\"\",\"site_seo_title\":\"TIGO\\u5185\\u5bb9\\u7ba1\\u7406\\u6846\\u67b6\",\"site_seo_keywords\":\"TIGO,php,\\u5185\\u5bb9\\u7ba1\\u7406\\u6846\\u67b6,cmf,cms,\\u7b80\\u7ea6\\u98ce, simplewind,framework\",\"site_seo_description\":\"TIGO\\u662f\\u7b80\\u7ea6\\u98ce\\u7f51\\u7edc\\u79d1\\u6280\\u53d1\\u5e03\\u7684\\u4e00\\u6b3e\\u7528\\u4e8e\\u5feb\\u901f\\u5f00\\u53d1\\u7684\\u5185\\u5bb9\\u7ba1\\u7406\\u6846\\u67b6\",\"urlmode\":\"0\",\"html_suffix\":\"\",\"comment_time_interval\":2}', '1');
INSERT INTO `cmf_options` VALUES ('3', 'cmf_settings', '{\"banned_usernames\":\"\"}', '1');

-- ----------------------------
-- Table structure for `cmf_plugins`
-- ----------------------------
DROP TABLE IF EXISTS `cmf_plugins`;
CREATE TABLE `cmf_plugins` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `name` varchar(50) NOT NULL COMMENT '插件名，英文',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '插件名称',
  `description` text COMMENT '插件描述',
  `type` tinyint(2) DEFAULT '0' COMMENT '插件类型, 1:网站；8;微信',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态；1开启；',
  `config` text COMMENT '插件配置',
  `hooks` varchar(255) DEFAULT NULL COMMENT '实现的钩子;以“，”分隔',
  `has_admin` tinyint(2) DEFAULT '0' COMMENT '插件是否有后台管理界面',
  `author` varchar(50) DEFAULT '' COMMENT '插件作者',
  `version` varchar(20) DEFAULT '' COMMENT '插件版本号',
  `createtime` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '插件安装时间',
  `listorder` smallint(6) NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='插件表';

-- ----------------------------
-- Records of cmf_plugins
-- ----------------------------

-- ----------------------------
-- Table structure for `cmf_posts`
-- ----------------------------
DROP TABLE IF EXISTS `cmf_posts`;
CREATE TABLE `cmf_posts` (
  `count` int(50) DEFAULT '0',
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_author` bigint(20) unsigned DEFAULT '0' COMMENT '发表者id',
  `post_keywords` varchar(150) NOT NULL COMMENT 'seo keywords',
  `post_source` varchar(150) DEFAULT NULL COMMENT '转载文章的来源',
  `post_date` datetime DEFAULT '2000-01-01 00:00:00' COMMENT 'post创建日期，永久不变，一般不显示给用户',
  `post_content` longtext COMMENT 'post内容',
  `post_title` text COMMENT 'post标题',
  `post_excerpt` text COMMENT 'post摘要',
  `post_status` int(2) DEFAULT '1' COMMENT 'post状态，1已审核，0未审核',
  `comment_status` int(2) DEFAULT '1' COMMENT '评论状态，1允许，0不允许',
  `post_modified` datetime DEFAULT '2000-01-01 00:00:00' COMMENT 'post更新时间，可在前台修改，显示给用户',
  `post_content_filtered` longtext,
  `post_parent` bigint(20) unsigned DEFAULT '0' COMMENT 'post的父级post id,表示post层级关系',
  `post_type` int(2) DEFAULT NULL,
  `post_mime_type` varchar(100) DEFAULT '',
  `comment_count` bigint(20) DEFAULT '0',
  `smeta` text COMMENT 'post的扩展字段，保存相关扩展属性，如缩略图；格式为json',
  `post_hits` int(11) DEFAULT '0' COMMENT 'post点击数，查看数',
  `post_like` int(11) DEFAULT '0' COMMENT 'post赞数',
  `istop` tinyint(1) NOT NULL DEFAULT '0' COMMENT '置顶 1置顶； 0不置顶',
  `recommended` tinyint(1) NOT NULL DEFAULT '0' COMMENT '推荐 1推荐 0不推荐',
  PRIMARY KEY (`id`),
  KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`id`),
  KEY `post_parent` (`post_parent`),
  KEY `post_author` (`post_author`),
  KEY `post_date` (`post_date`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=43 DEFAULT CHARSET=utf8 COMMENT='Portal文章表';

-- ----------------------------
-- Records of cmf_posts
-- ----------------------------
INSERT INTO `cmf_posts` VALUES (null, '1', '1', 'Contact', null, '2016-05-25 16:58:51', '', '联系我们', 'Contact', '1', '1', '2016-05-25 16:58:26', null, '0', '2', '', '0', '{\"template\":\"contact\",\"thumb\":\"\"}', '0', '0', '0', '0');
INSERT INTO `cmf_posts` VALUES (null, '2', '1', 'What We Do', 'What We Do', '2016-05-26 10:25:29', '<p><span style=\"color: rgb(153, 153, 153); font-family: &quot;Titillium Web&quot;, sans-serif; font-size: 15px; line-height: 24px; background-color: rgb(255, 255, 255);\">Suspendisse commodo tempor sagittis! In justo est, sollicitudin eu scelerisque pretium, placerat eget elit. Vestibulum congue turpis ac tincidunt accumsan.</span><span style=\"color: rgb(153, 153, 153); font-family: &quot;Titillium Web&quot;, sans-serif; font-size: 15px; line-height: 24px; background-color: rgb(255, 255, 255);\">Suspendisse commodo tempor sagittis! In justo est, sollicitudin eu scelerisque pretium, placerat eget elit. Vestibulum congue turpis ac tincidunt accumsan.</span><span style=\"color: rgb(153, 153, 153); font-family: &quot;Titillium Web&quot;, sans-serif; font-size: 15px; line-height: 24px; background-color: rgb(255, 255, 255);\">Suspendisse commodo tempor sagittis! In justo est, sollicitudin eu scelerisque pretium, placerat eget elit. Vestibulum congue turpis ac tincidunt accumsan.</span><span style=\"color: rgb(153, 153, 153); font-family: &quot;Titillium Web&quot;, sans-serif; font-size: 15px; line-height: 24px; background-color: rgb(255, 255, 255);\">Suspendisse commodo tempor sagittis! In justo est, sollicitudin eu scelerisque pretium, placerat eget elit. Vestibulum congue turpis ac tincidunt accumsan.</span><span style=\"color: rgb(153, 153, 153); font-family: &quot;Titillium Web&quot;, sans-serif; font-size: 15px; line-height: 24px; background-color: rgb(255, 255, 255);\">Suspendisse commodo tempor sagittis! In justo est, sollicitudin eu scelerisque pretium, placerat eget elit. Vestibulum congue turpis ac tincidunt accumsan.</span><span style=\"color: rgb(153, 153, 153); font-family: &quot;Titillium Web&quot;, sans-serif; font-size: 15px; line-height: 24px; background-color: rgb(255, 255, 255);\">Suspendisse commodo tempor sagittis! In justo est, sollicitudin eu scelerisque pretium, placerat eget elit. Vestibulum congue turpis ac tincidunt accumsan.</span></p>', 'What We Do test', 'Suspendisse commodo tempor sagittis! In justo est, sollicitudin eu scelerisque pretium, placerat eget elit. Vestibulum congue turpis ac tincidunt accumsan.', '1', '1', '2016-05-26 10:24:29', null, '0', null, '', '0', '{\"thumb\":\"20160526\\/57465e8c7bf15.jpg\"}', '29', '0', '1', '1');
INSERT INTO `cmf_posts` VALUES (null, '3', '1', 'Our Standards', 'Our Standards', '2016-05-26 10:26:01', '<p><span style=\"color: rgb(153, 153, 153); font-family: &quot;Titillium Web&quot;, sans-serif; font-size: 15px; line-height: 24px; background-color: rgb(255, 255, 255);\">Suspendisse commodo tempor sagittis! In justo est, sollicitudin eu scelerisque pretium, placerat eget elit. Vestibulum congue turpis ac tincidunt accumsan.</span><span style=\"color: rgb(153, 153, 153); font-family: &quot;Titillium Web&quot;, sans-serif; font-size: 15px; line-height: 24px; background-color: rgb(255, 255, 255);\">Suspendisse commodo tempor sagittis! In justo est, sollicitudin eu scelerisque pretium, placerat eget elit. Vestibulum congue turpis ac tincidunt accumsan.</span><span style=\"color: rgb(153, 153, 153); font-family: &quot;Titillium Web&quot;, sans-serif; font-size: 15px; line-height: 24px; background-color: rgb(255, 255, 255);\">Suspendisse commodo tempor sagittis! In justo est, sollicitudin eu scelerisque pretium, placerat eget elit. Vestibulum congue turpis ac tincidunt accumsan.</span><span style=\"color: rgb(153, 153, 153); font-family: &quot;Titillium Web&quot;, sans-serif; font-size: 15px; line-height: 24px; background-color: rgb(255, 255, 255);\">Suspendisse commodo tempor sagittis! In justo est, sollicitudin eu scelerisque pretium, placerat eget elit. Vestibulum congue turpis ac tincidunt accumsan.</span></p>', 'Our Standards test', 'Suspendisse commodo tempor sagittis! In justo est, sollicitudin eu scelerisque pretium, placerat eget elit. Vestibulum congue turpis ac tincidunt accumsan.', '1', '1', '2016-05-26 10:25:33', null, '0', null, '', '2', '{\"thumb\":\"20160526\\/57465eb691485.jpg\"}', '112', '0', '1', '1');
INSERT INTO `cmf_posts` VALUES ('4', '4', '1', 'Our Capabilities', 'Our Capabilities', '2016-05-26 10:26:39', '<p style=\"box-sizing: border-box; margin-top: 3.5px; margin-bottom: 0px; font-size: 15px; line-height: 1.6em; color: rgb(153, 153, 153);\">Suspendisse commodo tempor sagittis! In justo est, sollicitudin eu scelerisque pretium, placerat eget elit. Vestibulum congue turpis ac tincidunt accumsan.</p><p><br/></p>', 'Our Capabilities test', 'Suspendisse commodo tempor sagittis! In justo est, sollicitudin eu scelerisque pretium, placerat eget elit. Vestibulum congue turpis ac tincidunt accumsan.\r\n', '1', '1', '2016-05-26 10:26:15', null, '0', null, '', '1', '{\"thumb\":\"20160526\\/57465ed936f21.jpg\"}', '145', '0', '1', '1');
INSERT INTO `cmf_posts` VALUES ('1', '5', '1', '以读经教育为主题的特色学龄前教育$$$大批年轻且经验丰富的国学老师$$$树立孩子们正确的价值观，世界观和人生观', '', '2016-05-26 10:36:57', '<p><span style=\"font-family:宋体\">学龄前培训：作为公司的重要文化服务产品，慧谦公司倡导的以读经教育为主题的特色学龄前教育一直以来深受众多家长朋友们的肯定和孩子们的热爱。公司现拥有慧德学堂和慧德书院两大专业的国学教育机构，同时聚集了一大批年轻且经验丰富的国学老师，从传统的读经教育以树立孩子们正确的价值观，世界观和人生观，到琴棋书画等传统艺术课程对孩子童年生活的充实，丰富，传统文化教育是孩子们学习生涯的一盏明灯，也是解决诸多爸爸妈妈在家庭教育上苦恼的良方。（了解更多）</span>*<span style=\"font-family:宋体\">慧德学堂的教育板块进行衔接与填充。</span></p><p><br/></p>', '学龄前培训', '作为公司的重要文化服务产品，慧谦公司倡导的以读经教育为主题的特色学龄前教育一直以来深受众多家长朋友们的肯定和孩子们的热爱。公司现拥有慧德学堂和慧德书院两大专业的国学教育机构，同时聚集了一大批年轻且经验丰富的国学老师，从传统的读经教育以树立孩子们正确的价值观，世界观和人生观，到琴棋书画等传统艺术课程对孩子童年生活的充实，丰富，传统文化教育是孩子们学习生涯的一盏明灯，也是解决诸多爸爸妈妈在家庭教育上苦恼的良方。', '1', '1', '2016-05-26 10:36:13', null, '0', null, '', '1', '{\"thumb\":\"20160531\\/574cf18d62a5c.jpg\"}', '47', '0', '1', '1');
INSERT INTO `cmf_posts` VALUES ('1', '6', '1', '以“传播优秀文化，弘扬民族文化”使命$$$满足各行各业朋友对传统文化的需求$$$“追求最好质量，满足最高要求', '', '2016-05-26 10:37:23', '<p><span style=\"font-family:宋体\">传统文化教育，培训以及咨询服务：以“传播优秀文化，弘扬民族文化”为自身使命，慧谦公司自创办伊始便致力于满足各行各业顾客朋友对传统文化的需求。从儿童国学教育到传统文化大众讲座，再到企业文化咨询服务，我们总能以“追求最好质量，满足最高要求”的宗旨为您们服务。（了解更多）</span></p><p style=\"text-indent:27px\">*<span style=\"font-family:宋体\">慧德学堂</span> <span style=\"font-family:宋体\">特色国学夏令营内容衔接填充</span></p><p style=\"text-indent:27px\">*<span style=\"font-family:宋体\">慧德学堂</span> <span style=\"font-family:宋体\">传统文化亲子活动内容衔接填充</span></p><p style=\"text-indent:27px\">*<span style=\"font-family:宋体\">慧德学堂</span> <span style=\"font-family:宋体\">论语·人生·智慧</span> <span style=\"font-family:宋体\">国学经典讲座等内容衔接填充</span></p><p style=\"text-indent:27px\"><span style=\";font-family:宋体\">*</span><span style=\";font-family:宋体\">企业文化咨询服务：企业文化的构建与培养是一件非常困难的任务，其关键在于&quot;落地生根&quot;,不接地气的文化无疑是纸上谈兵，台上的倡导者满怀激情空喊口号,而台下响应者寥寥无几。中华传统文化作为一个先进的文化平台，千百年来在无数先哲的发扬下，其内容博大精深，涵盖了中国社会的方方面面，为世人所熟知。将中国传统文化的先进理念和古老智慧运用到现代企业的管理与运营中，早已被中外大量成功的企业家，管理人士以及学者所践行。</span></p><p style=\"text-indent:27px\"><span style=\";font-family:宋体\">企业文化建设的最高境界是让文化理念融在思想里、沉淀在流程中、落实到岗位上、体现在行动中,要达到这一境界,企业文化传播必不可少。将传统文化的积极因素运用到企业管理和运营中具有极大的意义，表现在:</span></p><p style=\"text-indent:32px;line-height:24px;background:white\"><span style=\"font-size:14px\">一是为企业创造高质量的文化品牌,迅速提升产品或服务品牌的附加值;</span></p><p style=\"text-indent:32px;line-height:24px;background:white\"><span style=\"font-size:14px\">二是践行传统文化的诚信，和谐理念，有利于增强客户或消费者对企业和品牌的忠诚度和依赖感;</span></p><p style=\"text-indent:32px;line-height:24px;background:white\"><span style=\"font-size:14px\">三是以传统文化的感召力影响社会，能起到积极的宣传作用，树立起正面的企业形象，从而为企业在行业，市场上的发展增加推力。</span></p><p><br/></p>', '传统文化教育，培训以及咨询服务', '以“传播优秀文化，弘扬民族文化”为自身使命，慧谦公司自创办伊始便致力于满足各行各业顾客朋友对传统文化的需求。从儿童国学教育到传统文化大众讲座，再到企业文化咨询服务，我们总能以“追求最好质量，满足最高要求”的宗旨为您们服务。', '1', '1', '2016-05-26 10:37:00', null, '0', null, '', '0', '{\"thumb\":\"20160531\\/574cf1a118b43.jpg\"}', '7', '0', '1', '1');
INSERT INTO `cmf_posts` VALUES ('0', '7', '1', '公司介绍4', '公司介绍4', '2016-05-26 11:48:26', '', '公司介绍4', '公司介绍4', '1', '1', '2016-05-26 11:48:08', null, '0', null, '', '0', '{\"thumb\":\"20160526\\/57467207a9d05.jpg\"}', '2', '0', '1', '1');
INSERT INTO `cmf_posts` VALUES (null, '8', '1', '公司介绍5', '公司介绍5', '2016-05-26 11:48:52', '<p>公司介绍5</p>', '公司介绍5', '公司介绍5', '1', '1', '2016-05-26 11:48:33', null, '0', null, '', '0', '{\"thumb\":\"20160526\\/5746721f965f6.jpg\"}', '0', '0', '1', '1');
INSERT INTO `cmf_posts` VALUES (null, '9', '1', '公司介绍6', '公司介绍6', '2016-05-26 11:49:28', '<p>公司介绍6</p>', '公司介绍6', '公司介绍6', '1', '1', '2016-05-26 11:49:14', null, '0', null, '', '1', '{\"thumb\":\"20160526\\/57467243aaa6d.jpg\"}', '0', '0', '1', '1');
INSERT INTO `cmf_posts` VALUES (null, '10', '1', '公司介绍6', '公司介绍6', '2016-05-26 11:49:40', '<p>公司介绍6</p>', '公司介绍6', '公司介绍6', '1', '1', '2016-05-26 11:49:30', null, '0', null, '', '1', '{\"thumb\":\"20160526\\/57467250e723b.jpg\"}', '0', '0', '1', '1');
INSERT INTO `cmf_posts` VALUES ('1', '11', '1', '普及中医推拿，艾灸等治疗保健方法$$$大批具备大量医学理论的专家和医师$$$极为有效地的养生功效', '', '2016-05-26 16:45:39', '<p style=\"text-indent:32px;line-height:24px;background:white\">传统中医学的养生保健服务：作为中华传统文化的瑰宝，传统中医学的理论及实践价值长期以来被世人肯定。作为对现代医学的有益补充，中医推拿，艾灸等治疗保健方法能够彻底避免西医药品药剂的副作用，对各个年龄段的人群都有极为有效地的养生功效，慧谦公司旗下拥有一批具备大量医学理论的专家和医师，利用传统中医手段为顾客提供高质量的医疗服务。（了解更多）</p><p style=\"text-indent:32px;line-height:24px;background:white\">*(小儿)推拿宣传内容衔接填充</p><p style=\"text-indent:32px;line-height:24px;background:white\">*艾灸与女性健康宣传内容衔接填充</p><p><br/></p>', '传统中医学的养生保健服务', '作为中华传统文化的瑰宝，传统中医学的理论及实践价值长期以来被世人肯定。作为对现代医学的有益补充，中医推拿，艾灸等治疗保健方法能够彻底避免西医药品药剂的副作用，对各个年龄段的人群都有极为有效地的养生功效，慧谦公司旗下拥有一批具备大量医学理论的专家和医师，利用传统中医手段为顾客提供高质量的医疗服务。', '1', '1', '2016-05-26 16:45:10', null, '0', null, '', '0', '{\"thumb\":\"20160531\\/574cf1b5cc315.jpg\"}', '5', '0', '0', '0');
INSERT INTO `cmf_posts` VALUES (null, '12', '1', '成为中外文化交流的桥梁$$$建设一流的文化交流平台$$$致力于传播推广中国传统文化', '', '2016-05-26 16:47:11', '<p style=\"line-height:24px;background:white\">长期以来，慧谦公司致力于传播推广中国传统文化，将中国文化的各个方面以各种渠道介绍给中外友人，同时我们也愿意并且践行自身的理念，努力使自身成为中外文化交流的桥梁，建设一流的文化交流平台，使得更多的国内文化界人士能够利用我们高质量的平台资源，将业务，服务，产品推向世界。（了解更多）</p><p style=\"text-indent:32px;line-height:24px;background:white\">*公司高层外访图片以及描述衔接填充</p><p style=\"text-indent:32px;line-height:24px;background:white\">*外方人士来访图片以及描述衔接填充</p><p style=\"text-indent:32px;line-height:24px;background:white\">*大型接待活动图片以及描述衔接填充</p><p><br/></p>', '中华传统文化对外交流', '长期以来，慧谦公司致力于传播推广中国传统文化，将中国文化的各个方面以各种渠道介绍给中外友人，同时我们也愿意并且践行自身的理念，努力使自身成为中外文化交流的桥梁，建设一流的文化交流平台，使得更多的国内文化界人士能够利用我们高质量的平台资源，将业务，服务，产品推向世界。', '1', '1', '2016-05-26 16:46:42', null, '0', null, '', '0', '{\"thumb\":\"20160531\\/574cf1c9d38d6.jpg\"}', '6', '0', '0', '0');
INSERT INTO `cmf_posts` VALUES ('0', '13', '1', '', 'by Josh Schott', '2016-05-26 16:52:57', '', 'Bears Type', 'by Josh Schott', '1', '1', '2016-05-26 16:51:40', null, '0', null, '', '0', '{\"thumb\":\"20160526\\/5746b95ecd93c.jpg\"}', '8', '0', '0', '0');
INSERT INTO `cmf_posts` VALUES ('0', '14', '1', '', 'Jeremy Slagle', '2016-05-26 16:53:27', '', 'Salon Spaces illustrations', 'Jeremy Slagle', '1', '1', '2016-05-26 16:53:00', null, '0', null, '', '1', '{\"thumb\":\"20160526\\/5746b984c58ff.jpg\"}', '6', '0', '0', '0');
INSERT INTO `cmf_posts` VALUES ('1', '15', '1', '', 'Dustin Leer', '2016-05-26 16:53:58', '', 'Leadership Series #3', 'Dustin Leer', '1', '1', '2016-05-26 16:53:30', null, '0', null, '', '12', '{\"thumb\":\"20160526\\/5746c9da71608.jpg\"}', '10', '0', '0', '0');
INSERT INTO `cmf_posts` VALUES ('12', '16', '1', '', '', '2016-05-27 11:01:52', '<h2 style=\"margin-top:0;margin-right:0;margin-bottom:14px;margin-left: 0;text-indent:40px;border:none;padding:0;padding:0 0 11px 0\"><img src=\"http://localhost/ThinkCMFtigo/data/upload/ueditor/20160531/574d4ec54b437.jpg\" title=\"11.jpg\" alt=\"11.jpg\" style=\"float: left;\"/><span style=\"font-size: 14px; font-family: 宋体, SimSun;\">无论时代如何变迁，无论社会如何改变，无论我们会遭遇何种挫折，体验何种快乐，亦或经历何种成长，人这一生总是在学习的路上。学习，需要尺标，需要明灯，需要导师，却有一本著作值得我们去细细品读，去思索，去体悟——《论语》。</span></h2><h2 style=\"margin-top:0;margin-right:0;margin-bottom:14px;margin-left: 0;text-indent:40px;border:none;padding:0;padding:0 0 11px 0\"><span style=\"font-size: 14px; font-family: 宋体, SimSun;\">古往今来的中华人都注重修身立命，何谓修身，参通天、地、人三者也，何谓立命，诚明正心，执守道本以顺天命。论语编写于春秋，千百年来，其中通俗易懂，鞭辟入里的哲论引导着无数的华夏人走出蒙昧，安身立命，直至造福苍生。就这点来说，论语成为了世代国人的启蒙教材，其在中国历史上的重要性无可替代。</span></h2><h2 style=\"margin-top:0;margin-right:0;margin-bottom:14px;margin-left: 0;text-indent:40px;border:none;padding:0;padding:0 0 11px 0\"><span style=\"font-size: 14px; font-family: 宋体, SimSun;\">当今中国教育主要侧重于科学知识与技能技巧的普及，而以《论语》为基础的传统文化教材，则是侧重培育儿童思想道德，从小为其树立正确的人生观，价值观，世界观。在纷繁复杂的现代社会中，生活、学习，现今工作的节奏是如此之快，即使是学识丰富，心志坚强的成年人亦难以做到“三省吾身”，极难抗拒物质，名利的诱惑，以至于浮躁，使得自己迷失本心，精神痛苦，相较之下，懵懂的儿童如若忽视德育，内心不受锻炼磨砺，却是更难适应变化复杂的社会发展。如此，《论语》为我们提供的关于道德，价值观的先贤智慧是对当今教育的有益补充。</span></h2><h2 style=\"text-indent:40px;border:none;padding:0;padding:0 0 11px 0\"><span style=\"font-size: 14px; font-family: 宋体, SimSun;\">茁壮成长的童年是人一生中学习能力，模仿能力最强的阶段，儿童如同白纸，而父母的言传身教则是这白纸上最初的色彩，由此可见父母的角色对儿童何其重要。</span></h2><h2 style=\"text-indent:40px;border:none;padding:0;padding:0 0 11px 0\"><span style=\"font-size: 14px; font-family: 宋体, SimSun;\">与西方个人主义文化截然不同，中国社会重视集体文化，珍视和谐社会，而和谐社会必须要落实到每个家庭之上，因此中国历史上历来都探讨“小家“与”大家”的辩证关系。很遗憾的是，当今社会里，不少父母迫于生活和工作压力，与子女相处的时间越来越短，甚至完全没有，造成父母不被子女爱戴，子女更得不到父母的关爱，如此一来双方代沟愈加明显，家庭问题和道德问题也越来越多。我们倡导大家重新拾起论语，因为论语的智慧重在礼教，重在明每个人在家庭，社会中的关系，学习品读它，不仅是为了从小让子女知道父母的伟大，教会子女去爱戴父母，也为让父母重新建立起家庭观念，认识到自身对孩子发展的重要意义，唯有如此才能达到家庭和谐的纯粹目的</span></h2><h2 style=\"margin-top:0;margin-right:0;margin-bottom:14px;margin-left: 0;text-indent:40px;border:none;padding:0;padding:0 0 11px 0\"><span style=\"font-size: 14px; font-family: 宋体, SimSun;\">六月十八号慧德学堂将举办&nbsp; “ 再续论语•人生•智慧－国学经典讲座”，著名传统文化教育家－杨文老师将再次造访慧德学堂，为到场的父母和孩子答疑解惑，分享他对传统文化教育的理解，经验和智慧。</span></h2><p><br/></p>', ' 论语•人生•智慧 国学经典讲座', '无论时代如何变迁，无论社会如何改变，无论我们会遭遇何种挫折，体验何种快乐，亦或经历何种成长，人这一生总是在学习的路上。学习，需要尺标，需要明灯，需要导师，却有一本著作值得我们去细细品读，去思索，去体悟——《论语》。$$$\r\n古往今来的中华人都注重修身立命，何谓修身，参通天、地、人三者也，何谓立命，诚明正心，执守道本以顺天命。论语编写于春秋，千百年来，其中通俗易懂，鞭辟入里的哲论引导着无数的华夏人走出蒙昧，安身立命，直至造福苍生。就这点来说，论语成为了世代国人的启蒙教材，其在中国历史上的重要性无可替代。\r\n', '1', '1', '2016-05-27 11:00:34', null, '0', null, '', '2', '{\"thumb\":\"20160531\\/574d4ecf63160.jpg\"}', '128', '0', '0', '0');
INSERT INTO `cmf_posts` VALUES ('2', '17', '1', '', '', '2016-05-27 11:02:21', '<p><span style=\"color: rgb(153, 153, 153); font-family: &quot;Titillium Web&quot;, sans-serif; font-size: 15px; line-height: 24px; background-color: rgb(255, 255, 255);\">Nunc quis turpis sed tortor viverra dictum. Etiam in cursus libero, ut cursus turpis. Nulla quis nulla pellentesque, commodo lorem sed, ultrices leo. Duis magna mauris, cursus vitae lacus ut, consequat malesuada magna. Duis bibendum pellentesque nisi eget volutpat. Nunc rhoncus ultrices lectus.Aliquam eu dui quis orci ultrices eleifend ut non massa. Duis commodo, ante in vulputate iaculis, libero ex fringilla dolor, id laoreet augue lorem in velit.</span></p>', '2', 'Nunc quis turpis sed tortor viverra dictum. Etiam in cursus libero, ut cursus turpis. Nulla quis nulla pellentesque, commodo lorem sed, ultrices leo. Duis magna mauris, cursus vitae lacus ut, consequat malesuada magna. Duis bibendum pellentesque nisi eget volutpat. Nunc rhoncus ultrices lectus.Aliquam eu dui quis orci ultrices eleifend ut non massa. Duis commodo, ante in vulputate iaculis, libero ex fringilla dolor, id laoreet augue lorem in velit.', '1', '1', '2016-05-27 11:01:55', null, '0', null, '', '0', '{\"thumb\":\"20160527\\/5747b8b98425c.jpg\"}', '12', '0', '0', '0');
INSERT INTO `cmf_posts` VALUES ('0', '18', '1', '', '', '2016-05-27 11:02:46', '<p><span style=\"color: rgb(153, 153, 153); font-family: &quot;Titillium Web&quot;, sans-serif; font-size: 15px; line-height: 24px; background-color: rgb(255, 255, 255);\">Nunc quis turpis sed tortor viverra dictum. Etiam in cursus libero, ut cursus turpis. Nulla quis nulla pellentesque, commodo lorem sed, ultrices leo. Duis magna mauris, cursus vitae lacus ut, consequat malesuada magna. Duis bibendum pellentesque nisi eget volutpat. Nunc rhoncus ultrices lectus.Aliquam eu dui quis orci ultrices eleifend ut non massa. Duis commodo, ante in vulputate iaculis, libero ex fringilla dolor, id laoreet augue lorem in velit.</span></p>', '3', 'Nunc quis turpis sed tortor viverra dictum. Etiam in cursus libero, ut cursus turpis. Nulla quis nulla pellentesque, commodo lorem sed, ultrices leo. Duis magna mauris, cursus vitae lacus ut, consequat malesuada magna. Duis bibendum pellentesque nisi eget volutpat. Nunc rhoncus ultrices lectus.Aliquam eu dui quis orci ultrices eleifend ut non massa. Duis commodo, ante in vulputate iaculis, libero ex fringilla dolor, id laoreet augue lorem in velit.', '1', '1', '2016-05-27 11:02:23', null, '0', null, '', '0', '{\"thumb\":\"20160527\\/5747b8d2f23ca.jpg\"}', '3', '0', '0', '0');
INSERT INTO `cmf_posts` VALUES ('0', '19', '1', '', '', '2016-05-27 11:03:06', '<p><span style=\"color: rgb(153, 153, 153); font-family: &quot;Titillium Web&quot;, sans-serif; font-size: 15px; line-height: 24px; background-color: rgb(255, 255, 255);\">Nunc quis turpis sed tortor viverra dictum. Etiam in cursus libero, ut cursus turpis. Nulla quis nulla pellentesque, commodo lorem sed, ultrices leo. Duis magna mauris, cursus vitae lacus ut, consequat malesuada magna. Duis bibendum pellentesque nisi eget volutpat. Nunc rhoncus ultrices lectus.Aliquam eu dui quis orci ultrices eleifend ut non massa. Duis commodo, ante in vulputate iaculis, libero ex fringilla dolor, id laoreet augue lorem in velit.</span></p>', '4', 'Nunc quis turpis sed tortor viverra dictum. Etiam in cursus libero, ut cursus turpis. Nulla quis nulla pellentesque, commodo lorem sed, ultrices leo. Duis magna mauris, cursus vitae lacus ut, consequat malesuada magna. Duis bibendum pellentesque nisi eget volutpat. Nunc rhoncus ultrices lectus.Aliquam eu dui quis orci ultrices eleifend ut non massa. Duis commodo, ante in vulputate iaculis, libero ex fringilla dolor, id laoreet augue lorem in velit.', '1', '1', '2016-05-27 11:02:50', null, '0', null, '', '0', '{\"thumb\":\"20160527\\/5747b8e7a4e9e.jpg\"}', '0', '0', '0', '0');
INSERT INTO `cmf_posts` VALUES (null, '20', '1', '1', '1', '2016-05-27 14:38:09', '<p>1</p>', '1', '1', '1', '1', '2016-05-27 14:37:32', null, '0', null, '', '0', '{\"thumb\":\"20160527\\/5747eb4d4f202.jpg\"}', '0', '0', '0', '0');
INSERT INTO `cmf_posts` VALUES (null, '21', '1', '2', '2', '2016-05-27 14:38:55', '<p>2</p>', '2', '2', '1', '1', '2016-05-27 14:38:12', null, '0', null, '', '0', '{\"thumb\":\"20160527\\/5747eb6438bd8.jpg\"}', '0', '0', '0', '0');
INSERT INTO `cmf_posts` VALUES (null, '22', '1', '3', '3', '2016-05-27 14:39:19', '<p>3</p>', '3', '3', '1', '1', '2016-05-27 14:38:57', null, '0', null, '', '0', '{\"thumb\":\"20160527\\/5747eb935ccc9.jpg\"}', '0', '0', '0', '0');
INSERT INTO `cmf_posts` VALUES (null, '23', '1', '4', '4', '2016-05-27 14:39:37', '<p>4</p>', '4', '4', '1', '1', '2016-05-27 14:39:21', null, '0', null, '', '0', '{\"thumb\":\"20160527\\/5747eba5a5907.jpg\"}', '0', '0', '0', '0');
INSERT INTO `cmf_posts` VALUES (null, '24', '1', '5', '5', '2016-05-27 14:39:54', '<p>5</p>', '5', '5', '1', '1', '2016-05-27 14:39:39', null, '0', null, '', '0', '{\"thumb\":\"20160527\\/5747ebb7728b1.jpg\"}', '0', '0', '0', '0');
INSERT INTO `cmf_posts` VALUES (null, '25', '1', '6', '6', '2016-05-27 14:40:10', '<p>6</p>', '6', '6', '1', '1', '2016-05-27 14:39:57', null, '0', null, '', '0', '{\"thumb\":\"20160527\\/5747ebc737ece.jpg\"}', '0', '0', '0', '0');
INSERT INTO `cmf_posts` VALUES (null, '26', '1', '7', '7', '2016-05-27 14:40:38', '<p>7</p>', '7', '7', '1', '1', '2016-05-27 14:40:23', null, '0', null, '', '0', '{\"thumb\":\"20160527\\/5747ebe314ea0.jpg\"}', '0', '0', '0', '0');
INSERT INTO `cmf_posts` VALUES (null, '27', '1', '8', '8', '2016-05-27 14:40:55', '<p>8</p>', '8', '8', '1', '1', '2016-05-27 14:40:40', null, '0', null, '', '0', '{\"thumb\":\"20160527\\/5747ebf47cac4.jpg\"}', '0', '0', '0', '0');
INSERT INTO `cmf_posts` VALUES (null, '28', '1', '9', '9', '2016-05-27 14:41:09', '<p>9</p>', '9', '9', '1', '1', '2016-05-27 14:40:57', null, '0', null, '', '0', '{\"thumb\":\"20160527\\/5747ec0278f64.jpg\"}', '0', '0', '0', '0');
INSERT INTO `cmf_posts` VALUES (null, '29', '1', '10', '10', '2016-05-27 14:41:23', '<p>10</p>', '10', '10', '1', '1', '2016-05-27 14:41:11', null, '0', null, '', '0', '{\"thumb\":\"20160527\\/5747ec10a26b7.jpg\"}', '0', '0', '0', '0');
INSERT INTO `cmf_posts` VALUES (null, '30', '1', '11', '11', '2016-05-27 14:41:42', '<p>11</p>', '11', '11', '1', '1', '2016-05-27 14:41:26', null, '0', null, '', '0', '{\"thumb\":\"20160527\\/5747ec2166d6d.jpg\"}', '0', '0', '0', '0');
INSERT INTO `cmf_posts` VALUES (null, '31', '1', '12', '12', '2016-05-27 14:42:02', '<p>12</p>', '12', '12', '1', '1', '2016-05-27 14:41:48', null, '0', null, '', '0', '{\"thumb\":\"20160527\\/5747ec3724010.jpg\"}', '0', '0', '0', '0');
INSERT INTO `cmf_posts` VALUES (null, '32', '1', '13', '13', '2016-05-27 14:42:20', '<p>13</p>', '13', '13', '1', '1', '2016-05-27 14:42:04', null, '0', null, '', '0', '{\"thumb\":\"20160527\\/5747ec465643d.jpg\"}', '0', '0', '0', '0');
INSERT INTO `cmf_posts` VALUES (null, '33', '1', '14', '14', '2016-05-27 15:08:39', '<p>14</p>', '14', '14', '1', '1', '2016-05-27 15:07:40', null, '0', null, '', '1', '{\"thumb\":\"20160527\\/5747f273202ad.jpg\"}', '0', '0', '0', '0');
INSERT INTO `cmf_posts` VALUES (null, '34', '1', '', null, '2016-05-27 16:07:36', '<p><span style=\"color: rgb(153, 153, 153); font-family: &quot;Titillium Web&quot;, sans-serif; font-size: 15px; line-height: 24px; background-color: rgb(255, 255, 255);\">Suspendisse commodo tempor sagittis! In justo est, sollicitudin eu scelerisque pretium, placerat eget elit. Vestibulum congue turpis ac tincidunt accumsan.</span></p>', '学龄前培训', 'Suspendisse commodo tempor sagittis! In justo est, sollicitudin eu scelerisque pretium, placerat eget elit. Vestibulum congue turpis ac tincidunt accumsan.', '0', '1', '2016-05-27 16:05:18', null, '0', '2', '', '2', '{\"template\":\"single\",\"thumb\":\"20160527\\/57480043bad94.jpg\"}', '0', '0', '0', '0');
INSERT INTO `cmf_posts` VALUES (null, '35', '1', '', null, '2016-05-27 16:08:18', '', '传统文化教育、培训以及咨询服务', 'Suspendisse commodo tempor sagittis! In justo est, sollicitudin eu scelerisque pretium, placerat eget elit. Vestibulum congue turpis ac tincidunt accumsan.', '0', '1', '2016-05-27 16:07:39', null, '0', '2', '', '0', '{\"template\":\"single\",\"thumb\":\"20160527\\/5748006ec863a.jpg\"}', '0', '0', '0', '0');
INSERT INTO `cmf_posts` VALUES (null, '36', '1', '', null, '2016-05-27 16:08:49', '<p><span style=\"color: rgb(153, 153, 153); font-family: &quot;Titillium Web&quot;, sans-serif; font-size: 15px; line-height: 24px; background-color: rgb(255, 255, 255);\">Suspendisse commodo tempor sagittis! In justo est, sollicitudin eu scelerisque pretium, placerat eget elit. Vestibulum congue turpis ac tincidunt accumsan.</span><span style=\"color: rgb(153, 153, 153); font-family: &quot;Titillium Web&quot;, sans-serif; font-size: 15px; line-height: 24px; background-color: rgb(255, 255, 255);\">Suspendisse commodo tempor sagittis! In justo est, sollicitudin eu scelerisque pretium, placerat eget elit. Vestibulum congue turpis ac tincidunt accumsan.</span><span style=\"color: rgb(153, 153, 153); font-family: &quot;Titillium Web&quot;, sans-serif; font-size: 15px; line-height: 24px; background-color: rgb(255, 255, 255);\">Suspendisse commodo tempor sagittis! In justo est, sollicitudin eu scelerisque pretium, placerat eget elit. Vestibulum congue turpis ac tincidunt accumsan.</span><span style=\"color: rgb(153, 153, 153); font-family: &quot;Titillium Web&quot;, sans-serif; font-size: 15px; line-height: 24px; background-color: rgb(255, 255, 255);\">Suspendisse commodo tempor sagittis! In justo est, sollicitudin eu scelerisque pretium, placerat eget elit. Vestibulum congue turpis ac tincidunt accumsan.</span></p>', '传统中医学的养生保健服务', 'Suspendisse commodo tempor sagittis! In justo est, sollicitudin eu scelerisque pretium, placerat eget elit. Vestibulum congue turpis ac tincidunt accumsan.', '0', '1', '2016-05-27 16:08:22', null, '0', '2', '', '0', '{\"template\":\"single\",\"thumb\":\"20160527\\/5748008e862e9.jpeg\"}', '0', '0', '0', '0');
INSERT INTO `cmf_posts` VALUES (null, '37', '1', '', null, '2016-05-27 16:09:16', '<p><span style=\"color: rgb(153, 153, 153); font-family: &quot;Titillium Web&quot;, sans-serif; font-size: 15px; line-height: 24px; background-color: rgb(255, 255, 255);\">Suspendisse commodo tempor sagittis! In justo est, sollicitudin eu scelerisque pretium, placerat eget elit. Vestibulum congue turpis ac tincidunt accumsan.</span><span style=\"color: rgb(153, 153, 153); font-family: &quot;Titillium Web&quot;, sans-serif; font-size: 15px; line-height: 24px; background-color: rgb(255, 255, 255);\">Suspendisse commodo tempor sagittis! In justo est, sollicitudin eu scelerisque pretium, placerat eget elit. Vestibulum congue turpis ac tincidunt accumsan.</span><span style=\"color: rgb(153, 153, 153); font-family: &quot;Titillium Web&quot;, sans-serif; font-size: 15px; line-height: 24px; background-color: rgb(255, 255, 255);\">Suspendisse commodo tempor sagittis! In justo est, sollicitudin eu scelerisque pretium, placerat eget elit. Vestibulum congue turpis ac tincidunt accumsan.</span><span style=\"color: rgb(153, 153, 153); font-family: &quot;Titillium Web&quot;, sans-serif; font-size: 15px; line-height: 24px; background-color: rgb(255, 255, 255);\">Suspendisse commodo tempor sagittis! In justo est, sollicitudin eu scelerisque pretium, placerat eget elit. Vestibulum congue turpis ac tincidunt accumsan.</span><span style=\"color: rgb(153, 153, 153); font-family: &quot;Titillium Web&quot;, sans-serif; font-size: 15px; line-height: 24px; background-color: rgb(255, 255, 255);\">Suspendisse commodo tempor sagittis! In justo est, sollicitudin eu scelerisque pretium, placerat eget elit. Vestibulum congue turpis ac tincidunt accumsan.</span><span style=\"color: rgb(153, 153, 153); font-family: &quot;Titillium Web&quot;, sans-serif; font-size: 15px; line-height: 24px; background-color: rgb(255, 255, 255);\">Suspendisse commodo tempor sagittis! In justo est, sollicitudin eu scelerisque pretium, placerat eget elit. Vestibulum congue turpis ac tincidunt accumsan.</span></p>', '中华传统文化对外交流', 'Suspendisse commodo tempor sagittis! In justo est, sollicitudin eu scelerisque pretium, placerat eget elit. Vestibulum congue turpis ac tincidunt accumsan.', '0', '1', '2016-05-27 16:08:52', null, '0', '2', '', '0', '{\"template\":\"single\",\"thumb\":\"20160527\\/574800a92080a.jpeg\"}', '0', '0', '0', '0');
INSERT INTO `cmf_posts` VALUES (null, '38', '1', '', '', '2016-05-27 16:39:49', '<p><span style=\"color: rgb(153, 153, 153); font-family: &quot;Titillium Web&quot;, sans-serif; font-size: 15px; line-height: 24px; background-color: rgb(255, 255, 255);\">Suspendisse commodo tempor sagittis! In justo est, sollicitudin eu scelerisque pretium, placerat eget elit. Vestibulum congue turpis ac tincidunt accumsan.</span><span style=\"color: rgb(153, 153, 153); font-family: &quot;Titillium Web&quot;, sans-serif; font-size: 15px; line-height: 24px; background-color: rgb(255, 255, 255);\">Suspendisse commodo tempor sagittis! In justo est, sollicitudin eu scelerisque pretium, placerat eget elit. Vestibulum congue turpis ac tincidunt accumsan.</span></p>', '学龄前培训', 'Suspendisse commodo tempor sagittis! In justo est, sollicitudin eu scelerisque pretium, placerat eget elit. Vestibulum congue turpis ac tincidunt accumsan.', '1', '1', '2016-05-27 16:38:58', null, '0', null, '', '0', '{\"thumb\":\"20160527\\/574807b12a21e.jpg\"}', '9', '0', '0', '0');
INSERT INTO `cmf_posts` VALUES (null, '39', '1', '', '', '2016-05-27 16:40:21', '<p><span style=\"color: rgb(153, 153, 153); font-family: &quot;Titillium Web&quot;, sans-serif; font-size: 15px; line-height: 24px; background-color: rgb(255, 255, 255);\">Suspendisse commodo tempor sagittis! In justo est, sollicitudin eu scelerisque pretium, placerat eget elit. Vestibulum congue turpis ac tincidunt accumsan.</span></p>', '传统文化教育、培训以及咨询服务', 'Suspendisse commodo tempor sagittis! In justo est, sollicitudin eu scelerisque pretium, placerat eget elit. Vestibulum congue turpis ac tincidunt accumsan.', '1', '1', '2016-05-27 16:39:53', null, '0', null, '', '0', '{\"thumb\":\"20160527\\/574807f15b471.jpg\"}', '4', '0', '0', '0');
INSERT INTO `cmf_posts` VALUES (null, '40', '1', '', '', '2016-05-27 16:41:13', '<p><span style=\"color: rgb(153, 153, 153); font-family: &quot;Titillium Web&quot;, sans-serif; font-size: 15px; line-height: 24px; background-color: rgb(255, 255, 255);\">Suspendisse commodo tempor sagittis! In justo est, sollicitudin eu scelerisque pretium, placerat eget elit. Vestibulum congue turpis ac tincidunt accumsan.</span></p>', '传统中医学的养生保健服务', 'Suspendisse commodo tempor sagittis! In justo est, sollicitudin eu scelerisque pretium, placerat eget elit. Vestibulum congue turpis ac tincidunt accumsan.', '1', '1', '2016-05-27 16:40:24', null, '0', null, '', '0', '{\"thumb\":\"20160527\\/574808255ccef.jpeg\"}', '0', '0', '0', '0');
INSERT INTO `cmf_posts` VALUES (null, '41', '1', '', '', '2016-05-27 16:41:45', '<p style=\"box-sizing: border-box; margin-top: 2.54688px; margin-bottom: 0px; font-size: 15px; line-height: 1.6em; color: rgb(153, 153, 153);\">Suspendisse commodo tempor sagittis! In justo est, sollicitudin eu scelerisque pretium, placerat eget elit. Vestibulum congue turpis ac tincidunt accumsan.</p><p><br/></p>', '中华传统文化对外交流', 'Suspendisse commodo tempor sagittis! In justo est, sollicitudin eu scelerisque pretium, placerat eget elit. Vestibulum congue turpis ac tincidunt accumsan.\r\n', '1', '1', '2016-05-27 16:41:15', null, '0', null, '', '0', '{\"thumb\":\"20160527\\/57480845a6b9e.jpeg\"}', '2', '0', '0', '0');
INSERT INTO `cmf_posts` VALUES (null, '42', '1', '', '', '2016-05-27 17:12:53', '', '中华传统文化对外交流', '中华传统文化对外交流', '1', '1', '2016-05-27 17:11:53', null, '0', null, '', '0', '{\"thumb\":\"20160527\\/57480f914d723.jpeg\"}', '3', '0', '0', '0');

-- ----------------------------
-- Table structure for `cmf_role`
-- ----------------------------
DROP TABLE IF EXISTS `cmf_role`;
CREATE TABLE `cmf_role` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL COMMENT '角色名称',
  `pid` smallint(6) DEFAULT NULL COMMENT '父角色ID',
  `status` tinyint(1) unsigned DEFAULT NULL COMMENT '状态',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `listorder` int(3) NOT NULL DEFAULT '0' COMMENT '排序字段',
  PRIMARY KEY (`id`),
  KEY `parentId` (`pid`),
  KEY `status` (`status`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='角色表';

-- ----------------------------
-- Records of cmf_role
-- ----------------------------
INSERT INTO `cmf_role` VALUES ('1', '超级管理员', '0', '1', '拥有网站最高管理员权限！', '1329633709', '1329633709', '0');

-- ----------------------------
-- Table structure for `cmf_role_user`
-- ----------------------------
DROP TABLE IF EXISTS `cmf_role_user`;
CREATE TABLE `cmf_role_user` (
  `role_id` int(11) unsigned DEFAULT '0' COMMENT '角色 id',
  `user_id` int(11) DEFAULT '0' COMMENT '用户id',
  KEY `group_id` (`role_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户角色对应表';

-- ----------------------------
-- Records of cmf_role_user
-- ----------------------------

-- ----------------------------
-- Table structure for `cmf_route`
-- ----------------------------
DROP TABLE IF EXISTS `cmf_route`;
CREATE TABLE `cmf_route` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '路由id',
  `full_url` varchar(255) DEFAULT NULL COMMENT '完整url， 如：portal/list/index?id=1',
  `url` varchar(255) DEFAULT NULL COMMENT '实际显示的url',
  `listorder` int(5) DEFAULT '0' COMMENT '排序，优先级，越小优先级越高',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态，1：启用 ;0：不启用',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='url路由表';

-- ----------------------------
-- Records of cmf_route
-- ----------------------------

-- ----------------------------
-- Table structure for `cmf_slide`
-- ----------------------------
DROP TABLE IF EXISTS `cmf_slide`;
CREATE TABLE `cmf_slide` (
  `slide_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `slide_cid` int(11) NOT NULL COMMENT '幻灯片分类 id',
  `slide_name` varchar(255) NOT NULL COMMENT '幻灯片名称',
  `slide_pic` varchar(255) DEFAULT NULL COMMENT '幻灯片图片',
  `slide_url` varchar(255) DEFAULT NULL COMMENT '幻灯片链接',
  `slide_des` varchar(255) DEFAULT NULL COMMENT '幻灯片描述',
  `slide_content` text COMMENT '幻灯片内容',
  `slide_status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1显示，0不显示',
  `listorder` int(10) DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`slide_id`),
  KEY `slide_cid` (`slide_cid`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='幻灯片表';

-- ----------------------------
-- Records of cmf_slide
-- ----------------------------
INSERT INTO `cmf_slide` VALUES ('1', '1', 'index', '/ThinkCMFtigo/data/upload/20160531/574ce83d3525c.jpg', '', '', '', '1', '0');
INSERT INTO `cmf_slide` VALUES ('3', '1', '啊盛大盛大', '/thinkcmftigo/data/upload/20160601/574e6b904aed1.jpg', '', '', '', '1', '0');

-- ----------------------------
-- Table structure for `cmf_slide_cat`
-- ----------------------------
DROP TABLE IF EXISTS `cmf_slide_cat`;
CREATE TABLE `cmf_slide_cat` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `cat_name` varchar(255) NOT NULL COMMENT '幻灯片分类',
  `cat_idname` varchar(255) NOT NULL COMMENT '幻灯片分类标识',
  `cat_remark` text COMMENT '分类备注',
  `cat_status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1显示，0不显示',
  PRIMARY KEY (`cid`),
  KEY `cat_idname` (`cat_idname`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='幻灯片分类表';

-- ----------------------------
-- Records of cmf_slide_cat
-- ----------------------------
INSERT INTO `cmf_slide_cat` VALUES ('1', 'portal_index', 'portal_index', 'portal_index', '1');

-- ----------------------------
-- Table structure for `cmf_terms`
-- ----------------------------
DROP TABLE IF EXISTS `cmf_terms`;
CREATE TABLE `cmf_terms` (
  `term_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类id',
  `name` varchar(200) DEFAULT NULL COMMENT '分类名称',
  `slug` varchar(200) DEFAULT '',
  `taxonomy` varchar(32) DEFAULT NULL COMMENT '分类类型',
  `description` longtext COMMENT '分类描述',
  `parent` bigint(20) unsigned DEFAULT '0' COMMENT '分类父id',
  `count` bigint(20) DEFAULT '0' COMMENT '分类文章数',
  `path` varchar(500) DEFAULT NULL COMMENT '分类层级关系路径',
  `seo_title` varchar(500) DEFAULT NULL,
  `seo_keywords` varchar(500) DEFAULT NULL,
  `seo_description` varchar(500) DEFAULT NULL,
  `list_tpl` varchar(50) DEFAULT NULL COMMENT '分类列表模板',
  `one_tpl` varchar(50) DEFAULT NULL COMMENT '分类文章页模板',
  `listorder` int(5) NOT NULL DEFAULT '0' COMMENT '排序',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1发布，0不发布',
  PRIMARY KEY (`term_id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='Portal 文章分类表';

-- ----------------------------
-- Records of cmf_terms
-- ----------------------------
INSERT INTO `cmf_terms` VALUES ('1', '列表演示', '', 'article', '', '0', '0', '0-1', '', '', '', 'list', 'article', '0', '1');
INSERT INTO `cmf_terms` VALUES ('2', '瀑布流', '', 'article', '', '0', '0', '0-2', '', '', '', 'list_masonry', 'article', '0', '1');
INSERT INTO `cmf_terms` VALUES ('3', '公司介绍', '', 'article', 'About', '0', '0', '0-3', '', '', '', 'about', 'about', '0', '1');
INSERT INTO `cmf_terms` VALUES ('4', '新闻中心', '', 'article', 'Blog', '0', '0', '0-4', '', '', '', 'blog', 'single', '0', '1');
INSERT INTO `cmf_terms` VALUES ('5', 'Pages（待定）', '', 'article', 'Pages', '0', '0', '0-5', '', '', '', 'pages', 'page', '0', '1');
INSERT INTO `cmf_terms` VALUES ('6', '活动展示', '', 'article', 'Gallery', '0', '0', '0-6', '', '', '', 'gallery', 'gallery', '0', '1');
INSERT INTO `cmf_terms` VALUES ('9', '项目介绍', '', 'article', '', '3', '0', '0-3-9', '', '', '', 'list', 'single', '0', '1');
INSERT INTO `cmf_terms` VALUES ('10', '师资介绍', '', 'article', '', '3', '0', '0-3-10', '', '', '', 'list', 'single', '0', '1');

-- ----------------------------
-- Table structure for `cmf_term_relationships`
-- ----------------------------
DROP TABLE IF EXISTS `cmf_term_relationships`;
CREATE TABLE `cmf_term_relationships` (
  `tid` bigint(20) NOT NULL AUTO_INCREMENT,
  `object_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT 'posts表里文章id',
  `term_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '分类id',
  `listorder` int(10) NOT NULL DEFAULT '0' COMMENT '排序',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1发布，0不发布',
  PRIMARY KEY (`tid`),
  KEY `term_taxonomy_id` (`term_id`)
) ENGINE=MyISAM AUTO_INCREMENT=38 DEFAULT CHARSET=utf8 COMMENT='Portal 文章分类对应表';

-- ----------------------------
-- Records of cmf_term_relationships
-- ----------------------------
INSERT INTO `cmf_term_relationships` VALUES ('1', '2', '8', '1', '0');
INSERT INTO `cmf_term_relationships` VALUES ('2', '3', '8', '2', '0');
INSERT INTO `cmf_term_relationships` VALUES ('3', '4', '8', '3', '0');
INSERT INTO `cmf_term_relationships` VALUES ('4', '5', '9', '0', '1');
INSERT INTO `cmf_term_relationships` VALUES ('5', '6', '9', '0', '1');
INSERT INTO `cmf_term_relationships` VALUES ('6', '7', '8', '4', '0');
INSERT INTO `cmf_term_relationships` VALUES ('7', '8', '8', '5', '0');
INSERT INTO `cmf_term_relationships` VALUES ('8', '9', '8', '6', '0');
INSERT INTO `cmf_term_relationships` VALUES ('9', '10', '8', '6', '0');
INSERT INTO `cmf_term_relationships` VALUES ('10', '11', '9', '0', '1');
INSERT INTO `cmf_term_relationships` VALUES ('11', '12', '9', '0', '1');
INSERT INTO `cmf_term_relationships` VALUES ('12', '13', '10', '0', '1');
INSERT INTO `cmf_term_relationships` VALUES ('13', '14', '10', '0', '1');
INSERT INTO `cmf_term_relationships` VALUES ('14', '15', '10', '0', '1');
INSERT INTO `cmf_term_relationships` VALUES ('15', '16', '4', '0', '1');
INSERT INTO `cmf_term_relationships` VALUES ('16', '17', '4', '0', '1');
INSERT INTO `cmf_term_relationships` VALUES ('17', '18', '4', '0', '1');
INSERT INTO `cmf_term_relationships` VALUES ('18', '19', '4', '0', '1');
INSERT INTO `cmf_term_relationships` VALUES ('19', '20', '6', '0', '1');
INSERT INTO `cmf_term_relationships` VALUES ('20', '21', '6', '0', '1');
INSERT INTO `cmf_term_relationships` VALUES ('21', '22', '6', '0', '1');
INSERT INTO `cmf_term_relationships` VALUES ('22', '23', '6', '0', '1');
INSERT INTO `cmf_term_relationships` VALUES ('23', '24', '6', '0', '1');
INSERT INTO `cmf_term_relationships` VALUES ('24', '25', '6', '0', '1');
INSERT INTO `cmf_term_relationships` VALUES ('25', '26', '6', '0', '1');
INSERT INTO `cmf_term_relationships` VALUES ('26', '27', '6', '0', '1');
INSERT INTO `cmf_term_relationships` VALUES ('27', '28', '6', '0', '1');
INSERT INTO `cmf_term_relationships` VALUES ('28', '29', '6', '0', '1');
INSERT INTO `cmf_term_relationships` VALUES ('29', '30', '6', '0', '1');
INSERT INTO `cmf_term_relationships` VALUES ('30', '31', '6', '0', '1');
INSERT INTO `cmf_term_relationships` VALUES ('31', '32', '6', '0', '1');
INSERT INTO `cmf_term_relationships` VALUES ('32', '33', '6', '0', '1');
INSERT INTO `cmf_term_relationships` VALUES ('33', '38', '11', '0', '0');
INSERT INTO `cmf_term_relationships` VALUES ('34', '39', '12', '0', '0');
INSERT INTO `cmf_term_relationships` VALUES ('35', '40', '12', '0', '0');
INSERT INTO `cmf_term_relationships` VALUES ('36', '41', '13', '0', '0');
INSERT INTO `cmf_term_relationships` VALUES ('37', '42', '14', '0', '0');

-- ----------------------------
-- Table structure for `cmf_users`
-- ----------------------------
DROP TABLE IF EXISTS `cmf_users`;
CREATE TABLE `cmf_users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_login` varchar(60) NOT NULL DEFAULT '' COMMENT '用户名',
  `user_pass` varchar(64) NOT NULL DEFAULT '' COMMENT '登录密码；sp_password加密',
  `user_nicename` varchar(50) NOT NULL DEFAULT '' COMMENT '用户美名',
  `user_email` varchar(100) NOT NULL DEFAULT '' COMMENT '登录邮箱',
  `user_url` varchar(100) NOT NULL DEFAULT '' COMMENT '用户个人网站',
  `avatar` varchar(255) DEFAULT NULL COMMENT '用户头像，相对于upload/avatar目录',
  `sex` smallint(1) DEFAULT '0' COMMENT '性别；0：保密，1：男；2：女',
  `birthday` date DEFAULT NULL COMMENT '生日',
  `signature` varchar(255) DEFAULT NULL COMMENT '个性签名',
  `last_login_ip` varchar(16) DEFAULT NULL COMMENT '最后登录ip',
  `last_login_time` datetime NOT NULL DEFAULT '2000-01-01 00:00:00' COMMENT '最后登录时间',
  `create_time` datetime NOT NULL DEFAULT '2000-01-01 00:00:00' COMMENT '注册时间',
  `user_activation_key` varchar(60) NOT NULL DEFAULT '' COMMENT '激活码',
  `user_status` int(11) NOT NULL DEFAULT '1' COMMENT '用户状态 0：禁用； 1：正常 ；2：未验证',
  `score` int(11) NOT NULL DEFAULT '0' COMMENT '用户积分',
  `user_type` smallint(1) DEFAULT '1' COMMENT '用户类型，1:admin ;2:会员',
  `coin` int(11) NOT NULL DEFAULT '0' COMMENT '金币',
  `mobile` varchar(20) NOT NULL DEFAULT '' COMMENT '手机号',
  PRIMARY KEY (`id`),
  KEY `user_login_key` (`user_login`),
  KEY `user_nicename` (`user_nicename`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of cmf_users
-- ----------------------------
INSERT INTO `cmf_users` VALUES ('1', 'admin', '###2525cac6a628a1660d8556b3f13c6dca', 'admin', 'admin@qq.com', '', null, '0', null, null, '0.0.0.0', '2016-06-01 11:52:40', '2016-05-25 04:17:03', '', '1', '0', '1', '0', '');

-- ----------------------------
-- Table structure for `cmf_user_favorites`
-- ----------------------------
DROP TABLE IF EXISTS `cmf_user_favorites`;
CREATE TABLE `cmf_user_favorites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` bigint(20) DEFAULT NULL COMMENT '用户 id',
  `title` varchar(255) DEFAULT NULL COMMENT '收藏内容的标题',
  `url` varchar(255) DEFAULT NULL COMMENT '收藏内容的原文地址，不带域名',
  `description` varchar(500) DEFAULT NULL COMMENT '收藏内容的描述',
  `table` varchar(50) DEFAULT NULL COMMENT '收藏实体以前所在表，不带前缀',
  `object_id` int(11) DEFAULT NULL COMMENT '收藏内容原来的主键id',
  `createtime` int(11) DEFAULT NULL COMMENT '收藏时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户收藏表';

-- ----------------------------
-- Records of cmf_user_favorites
-- ----------------------------

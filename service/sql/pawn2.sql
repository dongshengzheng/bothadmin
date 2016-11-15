# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.7.14)
# Database: pawn2
# Generation Time: 2016-11-15 12:47:43 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table sys_button
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_button`;

CREATE TABLE `sys_button` (
  `button_id` int(11) NOT NULL AUTO_INCREMENT,
  `menu_id` int(11) NOT NULL COMMENT '子菜单名称',
  `button_name` varchar(64) NOT NULL COMMENT '按钮名称',
  `button_url` varchar(255) NOT NULL COMMENT '按钮路径',
  `status` int(3) NOT NULL DEFAULT '1',
  PRIMARY KEY (`button_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `sys_button` WRITE;
/*!40000 ALTER TABLE `sys_button` DISABLE KEYS */;

INSERT INTO `sys_button` (`button_id`, `menu_id`, `button_name`, `button_url`, `status`)
VALUES
	(1,2,'新增菜单/子菜单','right/addMenu',1),
	(2,2,'修改菜单/子菜单','right/editMenu',1),
	(3,2,'删除菜单/子菜单','right/deleteMenu',1),
	(4,2,'批量删除菜单/子菜单','right/batchDeleteMenu',1),
	(5,2,'子菜单信息','right/subMenu',1),
	(6,2,'权限信息','right/button',1),
	(7,2,'新增权限','right/addBtn',1),
	(8,2,'修改权限','right/editBtn',1),
	(9,2,'删除权限','right/deleteBtn',1),
	(10,2,'批量删除权限','right/batchDeleteBtn',1),
	(11,3,'新增','user/add',1),
	(12,3,'修改','user/edit',1),
	(13,3,'删除','user/delete',1),
	(14,3,'批量删除','user/batchDelete',1),
	(15,3,'授权','user/editRole',1),
	(16,4,'新增','role/add',1),
	(17,4,'修改','role/edit',1),
	(18,4,'删除','role/delete',1),
	(19,4,'批量删除','role/batchDelete',1),
	(20,4,'编辑权限','role/editRight',1);

/*!40000 ALTER TABLE `sys_button` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sys_menu
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_menu`;

CREATE TABLE `sys_menu` (
  `menu_id` int(11) NOT NULL AUTO_INCREMENT,
  `menu_name` varchar(64) NOT NULL COMMENT '菜单名称',
  `menu_url` varchar(255) DEFAULT NULL COMMENT '菜单URL',
  `parent_id` int(11) DEFAULT NULL COMMENT '父菜单ID',
  `menu_order` int(11) DEFAULT NULL COMMENT '菜单顺序',
  `menu_icon` varchar(32) DEFAULT NULL COMMENT '菜单图标',
  `menu_type` int(11) DEFAULT NULL COMMENT '菜单类型 资源类型：1-分类； 2-菜单',
  `removable` int(11) NOT NULL DEFAULT '1',
  `description` varchar(255) DEFAULT NULL,
  `status` int(3) NOT NULL DEFAULT '1',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `sys_menu` WRITE;
/*!40000 ALTER TABLE `sys_menu` DISABLE KEYS */;

INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `menu_url`, `parent_id`, `menu_order`, `menu_icon`, `menu_type`, `removable`, `description`, `status`)
VALUES
	(1,'系统管理','#',0,1,'',1,0,'系统管理11耳朵\n',1),
	(2,'权限管理','right',1,2,'',2,1,'权限管理12',1),
	(3,'用户管理','user',1,3,'',2,1,'用户管理',1),
	(4,'角色管理','role',1,4,'',2,1,'角色管理2',1),
	(93,'系统工具','#',0,10,NULL,1,1,'',1);

/*!40000 ALTER TABLE `sys_menu` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sys_role
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_role`;

CREATE TABLE `sys_role` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(64) NOT NULL COMMENT '角色名称',
  `removable` int(3) NOT NULL DEFAULT '0' COMMENT '可被删除 0=不行 1=可以',
  `allocatable` int(3) DEFAULT '1' COMMENT '可被分配 0=不行 1=可以',
  `description` varchar(255) DEFAULT NULL,
  `status` int(3) NOT NULL DEFAULT '1',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `sys_role` WRITE;
/*!40000 ALTER TABLE `sys_role` DISABLE KEYS */;

INSERT INTO `sys_role` (`role_id`, `role_name`, `removable`, `allocatable`, `description`, `status`)
VALUES
	(1,'系统管理员',0,1,'系统管理员',1),
	(2,'服务器管理员',1,1,'',1),
	(3,'test',1,1,'123',-1);

/*!40000 ALTER TABLE `sys_role` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sys_role_resource
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_role_resource`;

CREATE TABLE `sys_role_resource` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL DEFAULT '0',
  `resource_id` int(11) NOT NULL DEFAULT '0',
  `resource_type` int(3) NOT NULL DEFAULT '0' COMMENT '资源类型：1-分类； 2-菜单；3-按钮',
  PRIMARY KEY (`id`),
  KEY `role_id_idx` (`role_id`),
  KEY `resource_id_idx` (`resource_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='权限和资源（菜单+按钮）';

LOCK TABLES `sys_role_resource` WRITE;
/*!40000 ALTER TABLE `sys_role_resource` DISABLE KEYS */;

INSERT INTO `sys_role_resource` (`id`, `role_id`, `resource_id`, `resource_type`)
VALUES
	(354,1,1,1),
	(355,1,2,2),
	(356,1,3,2),
	(357,1,4,2),
	(358,1,93,1);

/*!40000 ALTER TABLE `sys_role_resource` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sys_user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_user`;

CREATE TABLE `sys_user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `login_name` varchar(64) NOT NULL COMMENT '登录名',
  `password` varchar(64) NOT NULL COMMENT '密码',
  `name` varchar(64) DEFAULT NULL COMMENT '姓名',
  `last_login` varchar(255) DEFAULT NULL COMMENT '上次登录时间',
  `ip` varchar(32) DEFAULT NULL COMMENT 'IP',
  `status` varchar(32) DEFAULT NULL COMMENT '状态',
  `description` varchar(255) DEFAULT NULL,
  `email` varchar(32) DEFAULT NULL COMMENT '邮箱',
  `phone` varchar(32) DEFAULT NULL,
  `skin` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `sys_user` WRITE;
/*!40000 ALTER TABLE `sys_user` DISABLE KEYS */;

INSERT INTO `sys_user` (`user_id`, `login_name`, `password`, `name`, `last_login`, `ip`, `status`, `description`, `email`, `phone`, `skin`)
VALUES
	(1,'admin','dd94709528bb1c83d08f3088d4043f4742891f4f','admin','2016-10-30 13:31:21','0:0:0:0:0:0:0:1','1','123','123','123',1),
	(84,'sunhan','71431ddb024987660b7faedf7880fbf35eb9f1dc','孙汉',NULL,NULL,'1','1','1','1',1),
	(85,'admin123','91868ceb2b0ef1ddaed59140471087722d60c872','123',NULL,NULL,'1','123','123123','123',1),
	(86,'123123','5a8f70e725742ee64204353e700778b29f81b988','123',NULL,NULL,'-1','123','213','123',1),
	(87,'test','07df646fbca858e0b4284e4547595ae3b8cb0605','123',NULL,NULL,'-1','1231','123','123',1),
	(88,'123','88ea39439e74fa27c09a4fc0bc8ebe6d00978392','123',NULL,NULL,'-1','123','123','123',1),
	(89,'11test','915cf224878eb7fae09529feb502ca429093e85c','1123',NULL,NULL,'-1','123','123','123',1),
	(90,'测试数据','89ebd531abb18239d93e461c2e7b2932bc392906','123123',NULL,NULL,'1','123','123123','1231',1);

/*!40000 ALTER TABLE `sys_user` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sys_user_role
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_user_role`;

CREATE TABLE `sys_user_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `role_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户和角色';

LOCK TABLES `sys_user_role` WRITE;
/*!40000 ALTER TABLE `sys_user_role` DISABLE KEYS */;

INSERT INTO `sys_user_role` (`id`, `user_id`, `role_id`)
VALUES
	(1,1,1),
	(74,89,1);

/*!40000 ALTER TABLE `sys_user_role` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

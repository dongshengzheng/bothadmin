/*
 Navicat Premium Backup

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50625
 Source Host           : localhost
 Source Database       : jsdd

 Target Server Type    : MySQL
 Target Server Version : 50625
 File Encoding         : utf-8

 Date: 11/20/2016 20:28:18 PM
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `DATABASECHANGELOG`
-- ----------------------------
DROP TABLE IF EXISTS `DATABASECHANGELOG`;
CREATE TABLE `DATABASECHANGELOG` (
  `ID` varchar(255) NOT NULL,
  `AUTHOR` varchar(255) NOT NULL,
  `FILENAME` varchar(255) NOT NULL,
  `DATEEXECUTED` datetime NOT NULL,
  `ORDEREXECUTED` int(11) NOT NULL,
  `EXECTYPE` varchar(10) NOT NULL,
  `MD5SUM` varchar(35) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `COMMENTS` varchar(255) DEFAULT NULL,
  `TAG` varchar(255) DEFAULT NULL,
  `LIQUIBASE` varchar(20) DEFAULT NULL,
  `CONTEXTS` varchar(255) DEFAULT NULL,
  `LABELS` varchar(255) DEFAULT NULL,
  `DEPLOYMENT_ID` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `DATABASECHANGELOGLOCK`
-- ----------------------------
DROP TABLE IF EXISTS `DATABASECHANGELOGLOCK`;
CREATE TABLE `DATABASECHANGELOGLOCK` (
  `ID` int(11) NOT NULL,
  `LOCKED` bit(1) NOT NULL,
  `LOCKGRANTED` datetime DEFAULT NULL,
  `LOCKEDBY` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `dd_browser_history`
-- ----------------------------
DROP TABLE IF EXISTS `dd_browser_history`;
CREATE TABLE `dd_browser_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '浏览历史id',
  `user_id` int(11) DEFAULT NULL,
  `target_id` int(11) DEFAULT NULL,
  `type` mediumint(8) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL  COMMENT '创建时间',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `create_by` int(11) DEFAULT NULL COMMENT '创建者',
  `update_by` int(11) DEFAULT NULL COMMENT '更新者',
  `del_flag` mediumint(8) DEFAULT NULL COMMENT '逻辑删除标记（0：显示；1：隐藏）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='浏览历史';

-- ----------------------------
--  Table structure for `dd_collect`
-- ----------------------------
DROP TABLE IF EXISTS `dd_collect`;
CREATE TABLE `dd_collect` (
  `id` varchar(64) NOT NULL COMMENT '主键',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` varchar(64) DEFAULT NULL COMMENT '逻辑删除标记（0：显示；1：隐藏）',
  `works_id` varchar(64) DEFAULT NULL COMMENT '作品Id',
  `collect_by` varchar(64) DEFAULT NULL COMMENT '收藏者 ID',
  `start_time` varchar(64) DEFAULT NULL COMMENT '收藏起始时间',
  `end_time` varchar(64) DEFAULT NULL COMMENT '收藏截止时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='收藏';

-- ----------------------------
--  Table structure for `dd_comments`
-- ----------------------------
DROP TABLE IF EXISTS `dd_comments`;
CREATE TABLE `dd_comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `works_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL COMMENT '创建者',
  `type` mediumint(8) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL COMMENT '评论有递归',
  `follow_count` int(11) DEFAULT NULL COMMENT '关注数量，冗余字段',
  `create_date` datetime DEFAULT NULL  COMMENT '创建时间',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `create_by` int(11) DEFAULT NULL COMMENT '创建者',
  `update_by` int(11) DEFAULT NULL COMMENT '更新者',
  `del_flag` mediumint(8) DEFAULT NULL COMMENT '逻辑删除标记（0：显示；1：隐藏）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `dd_consumer`
-- ----------------------------
DROP TABLE IF EXISTS `dd_consumer`;
CREATE TABLE `dd_consumer` (
  `id` varchar(64) NOT NULL COMMENT '主键',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` varchar(64) DEFAULT NULL COMMENT '逻辑删除标记（0：显示；1：隐藏）',
  `type` varchar(64) DEFAULT NULL COMMENT '用户类型',
  `customer` varchar(64) DEFAULT NULL COMMENT '备选名字',
  `name` varchar(64) DEFAULT NULL COMMENT '姓名',
  `address` varchar(64) DEFAULT NULL COMMENT '地址',
  `phone` varchar(64) DEFAULT NULL COMMENT '联系方式',
  `no` varchar(64) DEFAULT NULL COMMENT '身份证',
  `remark` text COMMENT '备注',
  `datetime` datetime DEFAULT NULL COMMENT '登记/收藏时间',
  `pub` varchar(64) DEFAULT '0' COMMENT '是否公开',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='提供/收藏者';

-- ----------------------------
--  Records of `dd_consumer`
-- ----------------------------
BEGIN;
INSERT INTO `dd_consumer` VALUES ('001466f01ec14794bd86ddf60f3310d1', 'f87d838e3d514bf3b8c0b1e2fb6cd8ca', '2016-10-16 13:48:07', 'f87d838e3d514bf3b8c0b1e2fb6cd8ca', '2016-10-16 13:48:07', null, '0', '1', 'sunhan', 'sunhan', '12313', '123123123', '', '123123', '2016-10-16 00:00:00', null), ('036daffc5bd647f3b008c1d820da1846', 'f87d838e3d514bf3b8c0b1e2fb6cd8ca', '2016-10-15 19:44:23', 'f87d838e3d514bf3b8c0b1e2fb6cd8ca', '2016-10-15 19:44:23', null, '0', '1', 'sunhan', 'sunhan', '12313', '123123123', '', '123123', '2016-10-15 00:00:00', '0'), ('03a15f4eea204fbebf5b26a9b4536cba', 'f87d838e3d514bf3b8c0b1e2fb6cd8ca', '2016-10-16 13:52:35', 'f87d838e3d514bf3b8c0b1e2fb6cd8ca', '2016-10-16 13:52:35', null, '0', '2', null, 'sunhan', '12313', '123123123', '', '123123', '2016-10-16 00:00:00', '0'), ('08d2d109342c4a4e8a52aa787b0e75ae', 'f87d838e3d514bf3b8c0b1e2fb6cd8ca', '2016-10-16 13:52:51', 'f87d838e3d514bf3b8c0b1e2fb6cd8ca', '2016-10-16 13:52:51', null, '0', '2', null, 'sunhan', '12313', '123123123', '', '123123', '2016-10-16 00:00:00', '0'), ('09d9385ac8524ad5b97dc15dcdd53bd5', '98bf5ff7bf234f0d8da72cbfd7df874a', '2016-10-11 22:43:56', '98bf5ff7bf234f0d8da72cbfd7df874a', '2016-10-11 22:43:56', null, '0', '1', 'kaku1', 'kaku1', '测试一二三', '123', '320381198808283513', '2313', '2016-10-11 00:00:00', '0'), ('0c5e36518e8f40adacf601722922243a', '98bf5ff7bf234f0d8da72cbfd7df874a', '2016-10-06 10:44:05', '98bf5ff7bf234f0d8da72cbfd7df874a', '2016-10-06 10:44:05', null, '0', '1', 'kaku1', 'kaku1', '测试一二三', '123', '320381198808283513', '这个是备注', '2016-10-06 00:00:00', '0'), ('0dda01570c154a249d204da310b45a66', 'f87d838e3d514bf3b8c0b1e2fb6cd8ca', '2016-10-06 21:43:59', 'f87d838e3d514bf3b8c0b1e2fb6cd8ca', '2016-10-06 21:43:59', null, '0', '2', 'sunhan', 'sunhan', '12313', '123123123', '320381198808283513', '123123', '2016-10-06 00:00:00', '0'), ('0ee7ed9953d44618afb3224dceb22138', 'f87d838e3d514bf3b8c0b1e2fb6cd8ca', '2016-10-16 13:52:21', 'f87d838e3d514bf3b8c0b1e2fb6cd8ca', '2016-10-16 13:52:21', null, '0', '1', 'sunhan', 'sunhan', '12313', '123123123', '', '123123', '2016-10-16 00:00:00', null), ('13a2dafae204412ab04babcc2ae42ffd', 'f87d838e3d514bf3b8c0b1e2fb6cd8ca', '2016-10-16 13:50:01', 'f87d838e3d514bf3b8c0b1e2fb6cd8ca', '2016-10-16 13:50:01', null, '0', '1', 'sunhan', 'sunhan', '12313', '123123123', '', '123123', '2016-10-16 00:00:00', null), ('13bf0a0bd1a54c3384515e92e027464d', 'f87d838e3d514bf3b8c0b1e2fb6cd8ca', '2016-10-15 19:44:27', 'f87d838e3d514bf3b8c0b1e2fb6cd8ca', '2016-10-15 19:44:27', null, '0', '1', 'sunhan', 'sunhan', '12313', '123123123', '', '123123', '2016-10-15 00:00:00', '0'), ('15b5367e34ee4f858e5de8932d4223b7', 'f87d838e3d514bf3b8c0b1e2fb6cd8ca', '2016-10-07 11:15:58', 'f87d838e3d514bf3b8c0b1e2fb6cd8ca', '2016-10-07 11:15:58', null, '0', '1', 'sunhan', 'sunhan', '12313', '123123123', '', '123123', '2016-10-07 00:00:00', '0'), ('167b584b79774ffea49ae35204958795', '98bf5ff7bf234f0d8da72cbfd7df874a', '2016-10-11 21:39:23', '98bf5ff7bf234f0d8da72cbfd7df874a', '2016-10-11 21:39:23', null, '0', '1', 'kaku1', 'kaku1', '测试一二三', '123', '320381198808283513', '12313', '2016-10-11 00:00:00', '0'), ('173e2b68c5524a1c9fdfd5964fb5ee25', '98bf5ff7bf234f0d8da72cbfd7df874a', '2016-10-14 01:20:16', '98bf5ff7bf234f0d8da72cbfd7df874a', '2016-10-14 01:20:16', null, '0', '1', 'kaku1', 'kaku1', '测试一二三', '123', '320381198808283513', '', '2016-10-14 00:00:00', '0'), ('1766ddbd666842df9a729253e7437bc1', 'fce0d97933344d0f8b46e80b30e32c8b', '2016-10-16 10:28:37', 'fce0d97933344d0f8b46e80b30e32c8b', '2016-10-16 10:28:37', null, '0', '1', 'marco', 'marco', '江苏无锡', '051086214538', '320322190010105678', '', '2016-10-16 00:00:00', '0'), ('18eb636e9b284611889478990a0de89c', 'f87d838e3d514bf3b8c0b1e2fb6cd8ca', '2016-10-07 14:26:26', 'f87d838e3d514bf3b8c0b1e2fb6cd8ca', '2016-10-07 16:41:05', null, '0', '2', 'sunhan', 'sunhan', '12313', '123123123', '320381198808283513', '123123', '2016-10-07 00:00:00', '0'), ('1c0647f8d79b432e8bc9ef1cfb61fb69', '98bf5ff7bf234f0d8da72cbfd7df874a', '2016-10-16 11:08:48', '98bf5ff7bf234f0d8da72cbfd7df874a', '2016-10-16 11:08:48', null, '0', '2', null, 'kaku1', '测试一二三', '12312312312', '320381198808283513', '123', '2016-10-15 00:00:00', '0'), ('1c74b56838834ce0a2540b0087e3f6fb', 'f87d838e3d514bf3b8c0b1e2fb6cd8ca', '2016-10-06 22:49:50', 'f87d838e3d514bf3b8c0b1e2fb6cd8ca', '2016-10-06 22:49:50', null, '0', '1', 'sunhan', 'sunhan', '12313', '123123123', '320381198808283513', '123123', '2016-10-06 00:00:00', '0'), ('1d98534a796644ada96de85eac7e7ae7', 'f87d838e3d514bf3b8c0b1e2fb6cd8ca', '2016-10-07 12:16:48', 'f87d838e3d514bf3b8c0b1e2fb6cd8ca', '2016-10-07 12:16:48', null, '0', '1', 'sunhan', 'sunhan', '12313', '123123123', '', '123123', '2016-10-07 00:00:00', '0'), ('1f9773264c87414190ed9fb1ce1e5791', 'f87d838e3d514bf3b8c0b1e2fb6cd8ca', '2016-10-15 19:44:49', 'f87d838e3d514bf3b8c0b1e2fb6cd8ca', '2016-10-15 19:44:49', null, '0', '1', 'sunhan', 'sunhan', '12313', '123123123', '', '123123', '2016-10-15 00:00:00', '0'), ('202f5705480d4714b3bbfb779382719c', '98bf5ff7bf234f0d8da72cbfd7df874a', '2016-10-16 11:05:13', '98bf5ff7bf234f0d8da72cbfd7df874a', '2016-10-16 11:05:13', null, '0', '2', null, 'kaku1', '测试一二三', '12312312312', '320381198808283513', '123', '2016-10-15 00:00:00', '0'), ('27240ca16ea44267ad0a2118dbbd8aa8', '98bf5ff7bf234f0d8da72cbfd7df874a', '2016-10-16 10:58:33', '98bf5ff7bf234f0d8da72cbfd7df874a', '2016-10-16 10:58:33', null, '0', '2', null, 'kaku1', '测试一二三', '12312312312', '320381198808283513', '123', '2016-10-15 00:00:00', '0'), ('2783e8352b5c41e38c58098d5099ca83', '98bf5ff7bf234f0d8da72cbfd7df874a', '2016-10-14 01:19:04', '98bf5ff7bf234f0d8da72cbfd7df874a', '2016-10-14 01:19:04', null, '0', '1', 'kaku1', 'kaku1', '测试一二三', '123', '320381198808283513', '', '2016-10-14 00:00:00', '0'), ('2c168b6cab404675b0abf31877871bc1', '98bf5ff7bf234f0d8da72cbfd7df874a', '2016-10-28 22:54:19', '98bf5ff7bf234f0d8da72cbfd7df874a', '2016-10-28 22:54:19', null, '0', '1', null, 'kaku1', '测试一二三', '12312312312', '320381198808283513', '12', '2016-10-28 00:00:00', null), ('2dc8e854b87148f89c2dbbc68a80a863', '98bf5ff7bf234f0d8da72cbfd7df874a', '2016-10-11 21:54:52', '98bf5ff7bf234f0d8da72cbfd7df874a', '2016-10-11 21:54:52', null, '0', '2', 'kaku1', 'kaku1', '测试一二三', '123', '320381198808283513', '2342', '2016-10-11 00:00:00', '0'), ('31260601e89c4cea816d2df247af9c16', '98bf5ff7bf234f0d8da72cbfd7df874a', '2016-10-16 11:05:59', '98bf5ff7bf234f0d8da72cbfd7df874a', '2016-10-16 11:05:59', null, '0', '2', null, 'kaku1', '测试一二三', '12312312312', '320381198808283513', '123', '2016-10-15 00:00:00', '0'), ('321b117ed25a4a5786afc732c4bfda5e', '98bf5ff7bf234f0d8da72cbfd7df874a', '2016-10-28 22:11:51', '98bf5ff7bf234f0d8da72cbfd7df874a', '2016-10-28 22:11:51', null, '0', '1', null, 'kaku1', '测试一二三', '12312312312', '320381198808283513', '123', '2016-10-28 00:00:00', null), ('3236e43e3b034e62a2c7e21ee442d7f7', 'fce0d97933344d0f8b46e80b30e32c8b', '2016-10-16 10:29:47', 'fce0d97933344d0f8b46e80b30e32c8b', '2016-10-16 10:29:47', null, '0', '1', 'marco', 'marco', '江苏无锡', '051086214538', '320322190010105678', '', '2016-10-16 00:00:00', '0'), ('337bfd7cbdf4411dbcdbe9d5365ef73f', 'fce0d97933344d0f8b46e80b30e32c8b', '2016-10-16 10:28:38', 'fce0d97933344d0f8b46e80b30e32c8b', '2016-10-16 10:28:38', null, '0', '1', 'marco', 'marco', '江苏无锡', '051086214538', '320322190010105678', '', '2016-10-16 00:00:00', '0'), ('36f6201d26d64ef4b84b48b9d2de6ec7', '98bf5ff7bf234f0d8da72cbfd7df874a', '2016-10-15 13:21:36', '98bf5ff7bf234f0d8da72cbfd7df874a', '2016-10-16 11:16:43', null, '0', '2', null, 'kaku1', '测试一二三', '12312312312', '320381198808283513', '123', '2016-10-15 00:00:00', '0'), ('3744601bc2364127b315c54fb009864d', 'f87d838e3d514bf3b8c0b1e2fb6cd8ca', '2016-10-16 10:01:28', 'f87d838e3d514bf3b8c0b1e2fb6cd8ca', '2016-10-16 10:37:06', null, '0', '2', 'sunhan', 'sunhan', '12313', '123123123', '', '123123', '2016-10-16 00:00:00', '0'), ('390ce82b53134198bd240a47b27f606b', '98bf5ff7bf234f0d8da72cbfd7df874a', '2016-10-16 19:11:38', '98bf5ff7bf234f0d8da72cbfd7df874a', '2016-10-16 19:19:29', null, '0', '2', null, 'kaku1', '测试一二三', '12312312312', '320381198808283513', '测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试', '2016-10-16 00:00:00', '1'), ('40e800ab4fd844f9a687ccc2feb00dbc', 'f87d838e3d514bf3b8c0b1e2fb6cd8ca', '2016-10-06 23:00:51', 'f87d838e3d514bf3b8c0b1e2fb6cd8ca', '2016-10-16 10:26:08', null, '0', '2', 'sunhan', 'sunhan', '12313', '123123123', '', '123123', '2016-10-06 00:00:00', '0'), ('453f8b35425940ef9a997993d64407b6', 'fce0d97933344d0f8b46e80b30e32c8b', '2016-10-16 10:54:39', 'fce0d97933344d0f8b46e80b30e32c8b', '2016-10-16 10:54:39', null, '0', '1', 'marco', 'marco', '江苏无锡', '051086214538', '', '', '2016-10-16 00:00:00', '0'), ('4a0a79c616c9410ea2126b836a382108', '98bf5ff7bf234f0d8da72cbfd7df874a', '2016-10-28 22:13:07', '98bf5ff7bf234f0d8da72cbfd7df874a', '2016-10-28 22:13:07', null, '0', '1', null, 'kaku1', '测试一二三', '12312312312', '320381198808283513', '123123', '2016-10-28 00:00:00', null), ('5363456178194529981dba6950442edc', '98bf5ff7bf234f0d8da72cbfd7df874a', '2016-10-14 01:20:08', '98bf5ff7bf234f0d8da72cbfd7df874a', '2016-10-14 01:20:08', null, '0', '2', 'kaku1', 'kaku1', '测试一二三', '123', '320381198808283513', '', '2016-10-14 00:00:00', '0'), ('543fa992af9241d9ba818250973c666f', 'f87d838e3d514bf3b8c0b1e2fb6cd8ca', '2016-10-16 12:36:46', 'f87d838e3d514bf3b8c0b1e2fb6cd8ca', '2016-10-16 12:36:46', null, '0', '1', 'sunhan', 'sunhan', '12313', '123123123', '', '123123', '2016-10-16 00:00:00', null), ('61d15be59eef48dcb1299ab62c0c6b85', 'f87d838e3d514bf3b8c0b1e2fb6cd8ca', '2016-10-15 19:44:15', 'f87d838e3d514bf3b8c0b1e2fb6cd8ca', '2016-10-15 19:44:15', null, '0', '1', 'sunhan', 'sunhan', '12313', '123123123', '', '123123', '2016-10-15 00:00:00', '0'), ('67289b289e79473f94edaa14d5209437', '98bf5ff7bf234f0d8da72cbfd7df874a', '2016-10-16 11:06:20', '98bf5ff7bf234f0d8da72cbfd7df874a', '2016-10-16 11:06:20', null, '0', '2', null, 'kaku1', '测试一二三', '12312312312', '320381198808283513', '123', '2016-10-15 00:00:00', '0'), ('701e1eed134f468bb42e6d7f6e298955', 'f87d838e3d514bf3b8c0b1e2fb6cd8ca', '2016-10-16 13:48:45', 'f87d838e3d514bf3b8c0b1e2fb6cd8ca', '2016-10-16 13:48:45', null, '0', '1', 'sunhan', 'sunhan', '12313', '123123123', '', '123123', '2016-10-16 00:00:00', null), ('70d7a3e27d3b47d496be7effe791c337', '98bf5ff7bf234f0d8da72cbfd7df874a', '2016-10-14 01:20:32', '98bf5ff7bf234f0d8da72cbfd7df874a', '2016-10-14 01:20:32', null, '0', '2', 'kaku1', 'kaku1', '测试一二三', '123', '320381198808283513', '123', '2016-10-14 00:00:00', '0'), ('70f7e46a8f9a473a8b0b35aa903c0f72', 'f87d838e3d514bf3b8c0b1e2fb6cd8ca', '2016-10-16 10:00:12', 'f87d838e3d514bf3b8c0b1e2fb6cd8ca', '2016-10-16 10:00:12', null, '0', '1', 'sunhan', 'sunhan', '12313', '123123123', '', '123123', '2016-10-16 00:00:00', '0'), ('7502cf1ed24c4ba8bc138979bcb22780', 'fce0d97933344d0f8b46e80b30e32c8b', '2016-10-15 21:49:11', 'fce0d97933344d0f8b46e80b30e32c8b', '2016-10-15 21:49:11', null, '0', '2', 'marco', 'marco', '江苏无锡', '051086214538', '', '', '2016-10-15 00:00:00', '0'), ('7da8593201284ca5bbeb0aed7f42eba7', 'fce0d97933344d0f8b46e80b30e32c8b', '2016-10-16 10:34:38', 'fce0d97933344d0f8b46e80b30e32c8b', '2016-10-16 10:34:38', null, '0', '2', 'marco', 'marco', '江苏无锡', '051086214538', '', '', '2016-10-16 00:00:00', '0'), ('85e369437dd240668f9b72aa3e2fe3ce', 'f87d838e3d514bf3b8c0b1e2fb6cd8ca', '2016-10-07 16:24:32', 'f87d838e3d514bf3b8c0b1e2fb6cd8ca', '2016-10-07 16:24:32', null, '0', '1', '', '卡酷', '', '', '', '', '2016-10-07 00:00:00', '0'), ('88b6a6850f1b4a59a23cab7813092721', 'f87d838e3d514bf3b8c0b1e2fb6cd8ca', '2016-10-15 19:44:31', 'f87d838e3d514bf3b8c0b1e2fb6cd8ca', '2016-10-15 19:44:31', null, '0', '1', 'sunhan', 'sunhan', '12313', '123123123', '', '123123', '2016-10-15 00:00:00', '0'), ('88d548819d834cd1975d4676eeda1735', '98bf5ff7bf234f0d8da72cbfd7df874a', '2016-10-28 22:28:19', '98bf5ff7bf234f0d8da72cbfd7df874a', '2016-10-28 22:28:19', null, '0', '1', null, 'kaku1', '测试一二三', '12312312312', '320381198808283513', '123123', '2016-10-28 00:00:00', null), ('8e34cb8776224024bbfafeb7333c3303', 'f87d838e3d514bf3b8c0b1e2fb6cd8ca', '2016-10-15 19:44:40', 'f87d838e3d514bf3b8c0b1e2fb6cd8ca', '2016-10-15 19:44:40', null, '0', '1', 'sunhan', 'sunhan', '12313', '123123123', '', '123123', '2016-10-15 00:00:00', '0'), ('8ec857ce6d92441abcefc0c9c03759f0', 'f87d838e3d514bf3b8c0b1e2fb6cd8ca', '2016-10-06 22:58:42', 'f87d838e3d514bf3b8c0b1e2fb6cd8ca', '2016-10-06 22:58:42', null, '0', '1', 'sunhan', 'sunhan', '12313', '123123123', '320381198808283513', '123123', '2016-10-06 00:00:00', '0'), ('9105f1eafbfb4933b606057752828dee', 'f87d838e3d514bf3b8c0b1e2fb6cd8ca', '2016-10-15 19:44:19', 'f87d838e3d514bf3b8c0b1e2fb6cd8ca', '2016-10-15 19:44:19', null, '0', '1', 'sunhan', 'sunhan', '12313', '123123123', '', '123123', '2016-10-15 00:00:00', '0'), ('93f95510230c495cbb542efef8c9b386', 'f87d838e3d514bf3b8c0b1e2fb6cd8ca', '2016-10-07 12:37:08', 'f87d838e3d514bf3b8c0b1e2fb6cd8ca', '2016-10-07 12:37:08', null, '0', '1', 'sunhan', 'sunhan', '12313', '123123123', '', '123123', '2016-10-07 00:00:00', '0'), ('96e816d3f02a42b2b3fac16662e6269d', 'f87d838e3d514bf3b8c0b1e2fb6cd8ca', '2016-10-15 19:44:35', 'f87d838e3d514bf3b8c0b1e2fb6cd8ca', '2016-10-15 19:44:35', null, '0', '1', 'sunhan', 'sunhan', '12313', '123123123', '', '123123', '2016-10-15 00:00:00', '0'), ('994a206688ab4e21b558f3cf0ae1426d', '98bf5ff7bf234f0d8da72cbfd7df874a', '2016-10-16 10:57:36', '98bf5ff7bf234f0d8da72cbfd7df874a', '2016-10-16 10:57:36', null, '0', '2', null, 'kaku1', '测试一二三', '12312312312', '320381198808283513', '123', '2016-10-15 00:00:00', '0'), ('9a059d86bc624901a283f65c777f3abb', '98bf5ff7bf234f0d8da72cbfd7df874a', '2016-10-11 21:39:57', '98bf5ff7bf234f0d8da72cbfd7df874a', '2016-10-11 21:39:57', null, '0', '2', 'kaku1', 'kaku1', '测试一二三', '123', '320381198808283513', '12313', '2016-10-11 00:00:00', '0'), ('9ef24f4164e84caeb271ce255a7e0628', 'f87d838e3d514bf3b8c0b1e2fb6cd8ca', '2016-10-07 12:27:39', 'f87d838e3d514bf3b8c0b1e2fb6cd8ca', '2016-10-15 18:22:23', null, '0', '1', 'sunhan', 'sunhan', '12313', '123123123', '', '123123', '2016-10-07 00:00:00', '0'), ('a1779a7b93894a698c9f185c3069243d', '98bf5ff7bf234f0d8da72cbfd7df874a', '2016-10-11 21:55:09', '98bf5ff7bf234f0d8da72cbfd7df874a', '2016-10-11 21:55:09', null, '0', '1', 'kaku1', 'kaku1', '测试一二三', '123', '320381198808283513', '123123', '2016-10-11 00:00:00', '0'), ('a30b997f58bf4132b59328c8748bb2d4', '98bf5ff7bf234f0d8da72cbfd7df874a', '2016-10-11 22:42:10', '98bf5ff7bf234f0d8da72cbfd7df874a', '2016-10-11 22:42:10', null, '0', '1', 'kaku1', 'kaku1', '测试一二三', '123', '320381198808283513', '123', '2016-10-11 00:00:00', '0'), ('a369b25bb38444cf83ad8f290b6a85ae', 'f87d838e3d514bf3b8c0b1e2fb6cd8ca', '2016-10-07 12:31:00', 'f87d838e3d514bf3b8c0b1e2fb6cd8ca', '2016-10-07 12:31:00', null, '0', '1', 'sunhan', 'sunhan', '12313', '123123123', '', '123123', '2016-10-07 00:00:00', '0'), ('a5865bd1f6cd4820911a1222bd310f95', '98bf5ff7bf234f0d8da72cbfd7df874a', '2016-10-16 11:00:18', '98bf5ff7bf234f0d8da72cbfd7df874a', '2016-10-16 11:00:18', null, '0', '2', null, 'kaku1', '测试一二三', '12312312312', '320381198808283513', '123', '2016-10-15 00:00:00', '0'), ('aab356b9f1ff4ef6a241993b73d7d4d0', 'fce0d97933344d0f8b46e80b30e32c8b', '2016-10-09 11:48:01', 'fce0d97933344d0f8b46e80b30e32c8b', '2016-10-09 11:48:01', null, '0', '1', 'marco', 'marco', '江苏无锡滨湖区', '123456789', '320322000000001234', '', '2016-10-09 00:00:00', '0'), ('ab1fe35148514b12b090c783f25bb374', 'f87d838e3d514bf3b8c0b1e2fb6cd8ca', '2016-10-06 23:18:26', 'f87d838e3d514bf3b8c0b1e2fb6cd8ca', '2016-10-06 23:18:26', null, '0', '1', 'sunhan', 'sunhan', '12313', '123123123', '', '123123', '2016-10-06 00:00:00', '0'), ('aebd16e016194e74aea05c73c8867266', '98bf5ff7bf234f0d8da72cbfd7df874a', '2016-10-14 01:03:01', '98bf5ff7bf234f0d8da72cbfd7df874a', '2016-10-14 01:03:01', null, '0', '1', 'kaku1', 'kaku1', '测试一二三', '123', '320381198808283513', '测试登记2', '2022-10-06 00:00:00', '0'), ('afbe6358f48641c7b12061454952d9e6', '98bf5ff7bf234f0d8da72cbfd7df874a', '2016-10-28 22:10:22', '98bf5ff7bf234f0d8da72cbfd7df874a', '2016-10-28 22:10:22', null, '0', '1', null, 'kaku1', '测试一二三', '12312312312', '320381198808283513', '测试', '2016-10-28 00:00:00', null), ('b320af9316f84d778b487eb9b66ed016', '98bf5ff7bf234f0d8da72cbfd7df874a', '2016-10-06 10:54:33', '98bf5ff7bf234f0d8da72cbfd7df874a', '2016-10-06 10:54:33', null, '0', '1', 'kaku1', 'kaku1', '测试一二三', '123', '320381198808283513', '测试登记2', '2016-10-06 00:00:00', '0'), ('b4753bff55db424d847855c7834991f8', 'f87d838e3d514bf3b8c0b1e2fb6cd8ca', '2016-10-06 21:42:53', 'f87d838e3d514bf3b8c0b1e2fb6cd8ca', '2016-10-06 21:42:53', null, '0', '1', 'sunhan', 'sunhan', '12313', '123123123', '320381198808283513', '123123', '2016-10-06 00:00:00', '0'), ('b51caeb8e7d54cacafec91db548905c4', '98bf5ff7bf234f0d8da72cbfd7df874a', '2016-10-06 10:47:32', '98bf5ff7bf234f0d8da72cbfd7df874a', '2016-10-06 10:47:32', null, '0', '2', 'kaku1', 'kaku1', '测试一二三', '123', '320381198808283513', '这个是备注', '2016-10-06 00:00:00', '0'), ('b8554d8a258b48299de70214df9e1da5', 'f87d838e3d514bf3b8c0b1e2fb6cd8ca', '2016-10-07 11:11:29', 'f87d838e3d514bf3b8c0b1e2fb6cd8ca', '2016-10-07 11:11:29', null, '0', '1', 'sunhan', 'sunhan', '12313', '123123123', '', '123123', '2016-10-07 00:00:00', '0'), ('b8d3dcdd345c4c4d8b140a6d94c67d4a', '98bf5ff7bf234f0d8da72cbfd7df874a', '2016-10-11 21:54:20', '98bf5ff7bf234f0d8da72cbfd7df874a', '2016-10-11 21:54:20', null, '0', '1', 'kaku1', 'kaku1', '测试一二三', '123', '320381198808283513', '2342', '2016-10-11 00:00:00', '0'), ('bb2b2ae9aa4b4ede97eaf22b468d0185', 'fce0d97933344d0f8b46e80b30e32c8b', '2016-10-15 21:47:18', 'fce0d97933344d0f8b46e80b30e32c8b', '2016-10-15 21:47:18', null, '0', '1', 'marco', 'marco', '江苏无锡', '051086214538', '320322190000001334', '', '2016-10-15 00:00:00', '0'), ('c193d9798b67432bbb2aec1be0846841', '98bf5ff7bf234f0d8da72cbfd7df874a', '2016-10-28 22:07:34', '98bf5ff7bf234f0d8da72cbfd7df874a', '2016-10-28 22:07:34', null, '0', '1', null, 'kaku1', '测试一二三', '12312312312', '320381198808283513', '测试备注', '2016-10-28 00:00:00', null), ('c41ba67a026e414fba10e0d4247a7138', 'f87d838e3d514bf3b8c0b1e2fb6cd8ca', '2016-10-15 19:44:06', 'f87d838e3d514bf3b8c0b1e2fb6cd8ca', '2016-10-15 19:44:06', null, '0', '1', 'sunhan', 'sunhan', '12313', '123123123', '', '123123', '2016-10-15 00:00:00', '0'), ('c6fe75f8c9e9475f9491474c925f1de1', '98bf5ff7bf234f0d8da72cbfd7df874a', '2016-10-15 14:11:20', '98bf5ff7bf234f0d8da72cbfd7df874a', '2016-10-15 14:11:20', null, '0', '1', 'kaku1', 'kaku1', '测试一二三', '12312312312', '320381198808283513', '123', '2016-10-15 00:00:00', '0'), ('c88d8d6283b9438cb8e9fa8727c89550', '98bf5ff7bf234f0d8da72cbfd7df874a', '2016-10-14 01:21:30', '98bf5ff7bf234f0d8da72cbfd7df874a', '2016-10-14 01:21:30', null, '0', '1', 'kaku1', 'kaku1', '测试一二三', '123', '320381198808283513', '', '2016-10-14 00:00:00', '0'), ('d17f3f8e1e2b427ea541d33444ab072b', '98bf5ff7bf234f0d8da72cbfd7df874a', '2016-10-11 21:55:40', '98bf5ff7bf234f0d8da72cbfd7df874a', '2016-10-11 21:55:40', null, '0', '2', 'kaku1', 'kaku1', '测试一二三', '123', '320381198808283513', '123123', '2016-10-11 00:00:00', '0'), ('d638a69083b94fd6ba1b565283529dc7', 'f87d838e3d514bf3b8c0b1e2fb6cd8ca', '2016-10-06 20:50:45', 'f87d838e3d514bf3b8c0b1e2fb6cd8ca', '2016-10-06 20:50:45', null, '0', '2', 'sunhan', 'sunhan', '12313', '123123123', '320381198808283513', '123123', '2016-10-06 00:00:00', '0'), ('da86282ff58e466db71d76ed8b0d3274', '98bf5ff7bf234f0d8da72cbfd7df874a', '2016-10-14 01:06:29', '98bf5ff7bf234f0d8da72cbfd7df874a', '2016-10-16 11:54:53', null, '0', '2', null, 'kaku1', '测试一二三', '12312312312', '320381198808283513', '测试登记2', '2012-10-06 00:00:00', '0'), ('e01e76cea5b346f3ab6391df0f47d206', 'f87d838e3d514bf3b8c0b1e2fb6cd8ca', '2016-10-06 20:49:35', 'f87d838e3d514bf3b8c0b1e2fb6cd8ca', '2016-10-06 20:49:35', null, '0', '1', 'sunhan', 'sunhan', '12313', '123123123', '320381198808283513', '123123', '2016-10-06 00:00:00', '0'), ('e2d57e8ee3eb42aa87e7dded30759ab4', '98bf5ff7bf234f0d8da72cbfd7df874a', '2016-10-14 01:40:39', '98bf5ff7bf234f0d8da72cbfd7df874a', '2016-10-14 01:40:39', null, '0', '1', 'kaku1', 'kaku1', '测试一二三', '123', '320381198808283513', '123', '2016-10-14 00:00:00', '0'), ('e85ca23f56ca40aa82d6685f6c1771ad', '98bf5ff7bf234f0d8da72cbfd7df874a', '2016-10-16 11:06:12', '98bf5ff7bf234f0d8da72cbfd7df874a', '2016-10-16 11:06:12', null, '0', '2', null, 'kaku1', '测试一二三', '12312312312', '320381198808283513', '123', '2016-10-15 00:00:00', '0'), ('e880321a9d7c40d89486dfe43db7aa46', '98bf5ff7bf234f0d8da72cbfd7df874a', '2016-10-11 22:47:05', '98bf5ff7bf234f0d8da72cbfd7df874a', '2016-10-11 22:47:05', null, '0', '1', 'kaku1', 'kaku1', '测试一二三', '123', '320381198808283513', '', '2016-10-11 00:00:00', '0'), ('eaabcc3e88e146ca97f1538350e09bac', 'f87d838e3d514bf3b8c0b1e2fb6cd8ca', '2016-10-07 13:16:45', 'f87d838e3d514bf3b8c0b1e2fb6cd8ca', '2016-10-07 14:56:41', null, '0', '1', 'sunhan', 'sunhan', '12313', '123123123', '', '123123', '2016-10-07 00:00:00', '0'), ('ef89b5e6f77e4e06bdf98a6dd414e495', 'f87d838e3d514bf3b8c0b1e2fb6cd8ca', '2016-10-16 13:52:42', 'f87d838e3d514bf3b8c0b1e2fb6cd8ca', '2016-10-16 13:52:42', null, '0', '1', 'sunhan', 'sunhan', '12313', '123123123', '', '123123', '2016-10-16 00:00:00', null), ('f8ce0001edeb402d9866bfcda148767e', '98bf5ff7bf234f0d8da72cbfd7df874a', '2016-10-15 13:18:50', '98bf5ff7bf234f0d8da72cbfd7df874a', '2016-10-15 13:18:50', null, '0', '1', 'kaku1', 'kaku1', '测试一二三', '15862614903', '320381198808283513', '123123', '2016-10-15 00:00:00', '0'), ('fa48bab27dca469da1dc17dc8a23e115', '98bf5ff7bf234f0d8da72cbfd7df874a', null, '98bf5ff7bf234f0d8da72cbfd7df874a', '2016-10-06 10:54:57', null, '0', '2', 'kaku1', 'kaku1', '测试一二三', '123', '320381198808283513', '测试登记2', null, '0'), ('fbbe832bbbfc4fcea2eebd8252add250', '98bf5ff7bf234f0d8da72cbfd7df874a', '2016-10-16 11:03:35', '98bf5ff7bf234f0d8da72cbfd7df874a', '2016-10-16 11:03:35', null, '0', '2', null, 'kaku1', '测试一二三', '12312312312', '320381198808283513', '123', '2016-10-15 00:00:00', '0');
COMMIT;

-- ----------------------------
--  Table structure for `dd_follow_history`
-- ----------------------------
DROP TABLE IF EXISTS `dd_follow_history`;
CREATE TABLE `dd_follow_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '关注历史id',
  `user_id` int(11) DEFAULT NULL,
  `target_id` int(11) DEFAULT NULL,
  `type` mediumint(8) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL  COMMENT '创建时间',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `create_by` int(11) DEFAULT NULL COMMENT '创建者',
  `update_by` int(11) DEFAULT NULL COMMENT '更新者',
  `del_flag` mediumint(8) DEFAULT NULL COMMENT '逻辑删除标记（0：显示；1：隐藏）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `dd_interpretation`
-- ----------------------------
DROP TABLE IF EXISTS `dd_interpretation`;
CREATE TABLE `dd_interpretation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `works_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL COMMENT '创建表',
  `type` varchar(64) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL COMMENT '诠释有递归',
  `score_demanded` mediumint(8) DEFAULT NULL COMMENT '想要的分数 选项20 50 100',
  `status` mediumint(8) DEFAULT NULL COMMENT '是否提交成功',
  `deal_date` datetime DEFAULT NULL,
  `picture` varchar(64) DEFAULT NULL,
  `follow_count` int(11) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL  COMMENT '创建时间',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `create_by` int(11) DEFAULT NULL COMMENT '创建者',
  `update_by` int(11) DEFAULT NULL COMMENT '更新者',
  `del_flag` mediumint(8) DEFAULT NULL COMMENT '逻辑删除标记（0：显示；1：隐藏）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `dd_message`
-- ----------------------------
DROP TABLE IF EXISTS `dd_message`;
CREATE TABLE `dd_message` (
  `id` varchar(64) NOT NULL COMMENT '主键',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` varchar(64) DEFAULT NULL COMMENT '逻辑删除标记（0：显示；1：隐藏）',
  `title` varchar(64) DEFAULT NULL COMMENT '标题',
  `content` varchar(255) DEFAULT NULL COMMENT '内容',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='消息';

-- ----------------------------
--  Table structure for `dd_report`
-- ----------------------------
DROP TABLE IF EXISTS `dd_report`;
CREATE TABLE `dd_report` (
  `id` varchar(64) NOT NULL COMMENT '主键',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` varchar(64) DEFAULT NULL COMMENT '逻辑删除标记（0：显示；1：隐藏）',
  `works_id` varchar(64) DEFAULT NULL COMMENT '作品Id',
  `works_no` varchar(64) DEFAULT NULL COMMENT '作品编号',
  `des` text COMMENT '描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='评估报告';

-- ----------------------------
--  Records of `dd_report`
-- ----------------------------
BEGIN;
INSERT INTO `dd_report` VALUES ('06a580b0d65a4e8d994d851f5b06ad27', 'f87d838e3d514bf3b8c0b1e2fb6cd8ca', '2016-09-24 22:45:23', 'f87d838e3d514bf3b8c0b1e2fb6cd8ca', '2016-09-24 22:45:23', null, '0', '36e71f94b380467d97cfd813ec09d100', null, '232'), ('2bf9769930b842acb82840d7f80f3150', 'fce0d97933344d0f8b46e80b30e32c8b', '2016-10-16 10:33:33', 'fce0d97933344d0f8b46e80b30e32c8b', '2016-10-16 10:33:33', null, '0', 'd020fc0be5504547986e842126a10e10', null, '随便写点吧'), ('2deb3f1f33644cbeadc825d6be7b386f', 'f87d838e3d514bf3b8c0b1e2fb6cd8ca', '2016-10-16 13:50:23', 'f87d838e3d514bf3b8c0b1e2fb6cd8ca', '2016-10-16 13:50:23', null, '0', '4b86866116114c2ba794a1c79bf558b6', null, '123123123'), ('3d97fafd8241498884ef66b1cb02d5e8', 'f87d838e3d514bf3b8c0b1e2fb6cd8ca', '2016-10-16 13:52:32', 'f87d838e3d514bf3b8c0b1e2fb6cd8ca', '2016-10-16 13:52:32', null, '0', '952590a9f79c4f6d857aad98c20826df', null, '123'), ('48a307f911b4452e969f18cd8e2d1b42', '1', '2016-09-22 01:34:20', '1', '2016-09-22 01:34:20', null, '0', '3332dddef86f440caa726fc37b14fa2c', null, '1232131'), ('50d5f30deb2048338d2ce622f772c635', '1', '2016-09-22 21:03:22', '1', '2016-09-22 21:03:22', null, '0', '093130e80b8e4e85957eee39dad625a5', null, '213123123'), ('5994fb74bc724db28127d2e1d0dba559', 'f87d838e3d514bf3b8c0b1e2fb6cd8ca', '2016-10-07 12:32:28', 'f87d838e3d514bf3b8c0b1e2fb6cd8ca', '2016-10-07 12:32:28', null, '0', '484755e1f1e44048a67be34e30d0375d', null, '测试报告'), ('805ede87b284469da19023749158a002', 'f87d838e3d514bf3b8c0b1e2fb6cd8ca', '2016-10-07 13:17:29', 'f87d838e3d514bf3b8c0b1e2fb6cd8ca', '2016-10-07 13:17:29', null, '0', '301371b089d7487b94fd32f52e017c89', null, '测'), ('80982ab29a134b4ca58377b017c9ff12', 'f87d838e3d514bf3b8c0b1e2fb6cd8ca', '2016-09-24 22:28:25', 'f87d838e3d514bf3b8c0b1e2fb6cd8ca', '2016-09-24 22:28:25', null, '0', '36e71f94b380467d97cfd813ec09d100', null, 'sfsdfadsfdsfasdf'), ('825de86ef2e8421ab89ce6aa2c1aca69', '98bf5ff7bf234f0d8da72cbfd7df874a', '2016-10-06 10:47:26', '98bf5ff7bf234f0d8da72cbfd7df874a', '2016-10-06 10:47:26', null, '0', 'd331b7474d33486291b87f847589dcf8', null, '测试的鉴定'), ('83b74574ec64441f8423a54da6f5acca', 'f87d838e3d514bf3b8c0b1e2fb6cd8ca', '2016-10-07 12:37:40', 'f87d838e3d514bf3b8c0b1e2fb6cd8ca', '2016-10-07 12:37:40', null, '0', '177c132874c345c4b60e6489bbfa8dde', null, '测试'), ('8d53192e5b2f4b70bf1dce5c3c474ab4', '98bf5ff7bf234f0d8da72cbfd7df874a', '2016-10-06 10:54:54', '98bf5ff7bf234f0d8da72cbfd7df874a', '2016-10-06 10:54:54', null, '0', '2421e75974e040f796fb9cd9afab7bb8', null, '1'), ('9c2d60d008d84e3cae745b8d5a5f9b77', '98bf5ff7bf234f0d8da72cbfd7df874a', '2016-10-15 14:11:55', '98bf5ff7bf234f0d8da72cbfd7df874a', '2016-10-15 14:11:55', null, '0', 'e8d4a95a4a2f4acd9b934779ca57e783', null, '123123'), ('a02774c9f8ef43539abfb3627637ae5d', '98bf5ff7bf234f0d8da72cbfd7df874a', '2016-10-14 01:19:42', '98bf5ff7bf234f0d8da72cbfd7df874a', '2016-10-14 01:19:42', null, '0', 'fc066eb410834bf79448e50e97bdb5f9', null, '123123'), ('a990d737c16f4482a057ef414891d01b', '98bf5ff7bf234f0d8da72cbfd7df874a', '2016-10-16 19:19:17', '98bf5ff7bf234f0d8da72cbfd7df874a', '2016-10-16 19:19:17', null, '0', 'bc8a146d518f491481e6ad1c01605e01', null, '12321'), ('b2ac7c3d9f054a9e8e51765649311897', 'fce0d97933344d0f8b46e80b30e32c8b', '2016-10-15 21:48:42', 'fce0d97933344d0f8b46e80b30e32c8b', '2016-10-15 21:48:42', null, '0', '6722ac5da36642cfb3861d2dcd703971', null, '莫有样在真'), ('b4a70cfd09bc429d90c7cb05f150a0ee', 'f87d838e3d514bf3b8c0b1e2fb6cd8ca', '2016-10-16 10:00:35', 'f87d838e3d514bf3b8c0b1e2fb6cd8ca', '2016-10-16 10:00:35', null, '0', 'e8d25bed99f64e0b9ce7f5aeefbdbf10', null, '123'), ('be5ccb724c85459482ad3bf749d169fe', '98bf5ff7bf234f0d8da72cbfd7df874a', '2016-09-30 16:35:20', '98bf5ff7bf234f0d8da72cbfd7df874a', '2016-09-30 23:28:36', null, '0', '190196e54dd841f7827c3c044a553f26', null, '测试评估123'), ('cb1322d282bc49db9156b9ec3b91a289', '98bf5ff7bf234f0d8da72cbfd7df874a', '2016-10-03 12:12:57', '98bf5ff7bf234f0d8da72cbfd7df874a', '2016-10-03 12:12:57', null, '0', '9d5e722d66db456d83d7291c41c7b984', null, '123'), ('cc5b0c3252c34f20a9a894c6ec76da7c', '98bf5ff7bf234f0d8da72cbfd7df874a', '2016-10-11 21:54:44', '98bf5ff7bf234f0d8da72cbfd7df874a', '2016-10-11 21:54:44', null, '0', '60bc298551c7446a9422aa77792afe32', null, '123'), ('d09cbeca22184515b82246f81a04fef9', '98bf5ff7bf234f0d8da72cbfd7df874a', '2016-09-21 20:24:34', '98bf5ff7bf234f0d8da72cbfd7df874a', '2016-09-21 20:24:34', null, '0', '6d05841e43e84bdda49e78e0cea0ea6a', null, '123123123'), ('d641156b10cf45658bc3bfde0469bc10', '98bf5ff7bf234f0d8da72cbfd7df874a', '2016-10-11 21:39:50', '98bf5ff7bf234f0d8da72cbfd7df874a', '2016-10-11 21:39:50', null, '0', '3c4e80dedcb0478f8120b48c4248cc31', null, '12312'), ('d7c09b05b37140c5b1ab85576a4a6daa', 'f87d838e3d514bf3b8c0b1e2fb6cd8ca', '2016-09-15 16:04:33', 'f87d838e3d514bf3b8c0b1e2fb6cd8ca', '2016-09-15 23:35:19', null, '0', '9f1da519505045339d09d3ff5129f2aa', null, '12312313123213123'), ('db3b72390c814fdaa5db558af1e230f2', '98bf5ff7bf234f0d8da72cbfd7df874a', '2016-10-15 13:21:50', '98bf5ff7bf234f0d8da72cbfd7df874a', '2016-10-15 13:21:50', null, '0', '24d1f53b247544eeb2b844369c762e62', null, '123'), ('dd41ad5a96b9457bb3505e45a0c9ecec', 'f87d838e3d514bf3b8c0b1e2fb6cd8ca', '2016-10-06 21:43:44', 'f87d838e3d514bf3b8c0b1e2fb6cd8ca', '2016-10-06 21:43:44', null, '0', '672821a40a37424682f1129923e058fd', null, '测试'), ('dd6a467ee8dc45f68dd5bbf8ff570b26', '98bf5ff7bf234f0d8da72cbfd7df874a', '2016-10-14 01:20:29', '98bf5ff7bf234f0d8da72cbfd7df874a', '2016-10-14 01:20:29', null, '0', '53f49104195740c395dd8a88b956aed9', null, '123'), ('dea3155a599c47179fef453edb83985e', '1', '2016-09-22 01:37:31', '1', '2016-09-22 01:37:31', null, '0', '3332dddef86f440caa726fc37b14fa2c', null, '12313'), ('e04b33a1c0c341c19261e2a5295d6f60', 'f87d838e3d514bf3b8c0b1e2fb6cd8ca', '2016-10-16 13:52:49', 'f87d838e3d514bf3b8c0b1e2fb6cd8ca', '2016-10-16 13:52:49', null, '0', '98b71c2410e24db995b85358d99d699c', null, '123'), ('e6e4ab7912624cd69209f350ef35d90f', '98bf5ff7bf234f0d8da72cbfd7df874a', '2016-10-11 21:55:35', '98bf5ff7bf234f0d8da72cbfd7df874a', '2016-10-11 21:55:35', null, '0', 'ce8aeaf85aab4e15993dab0f184747cd', null, '123'), ('ecd0cf8522e94def9c186c3f3f49cf6c', 'f87d838e3d514bf3b8c0b1e2fb6cd8ca', '2016-10-06 22:59:31', 'f87d838e3d514bf3b8c0b1e2fb6cd8ca', '2016-10-06 22:59:31', null, '0', 'ba46d9ca602944e6a902b6f0bb7cf035', null, '测试报告'), ('edcb646f4e89435cbcc7b20b7c0be00c', '1', '2016-09-22 01:35:46', '1', '2016-09-22 01:35:46', null, '0', '3332dddef86f440caa726fc37b14fa2c', null, '123131'), ('f1c9eec0177d42bdb70a0d73a7866049', 'f87d838e3d514bf3b8c0b1e2fb6cd8ca', '2016-09-24 21:54:48', 'f87d838e3d514bf3b8c0b1e2fb6cd8ca', '2016-09-24 21:54:48', null, '0', '5bbe5e5f751e4c8b89f20c6694be11c7', null, '12312'), ('fc5cb22f10ee4c28a037a3c8c56f765b', 'f87d838e3d514bf3b8c0b1e2fb6cd8ca', '2016-10-06 20:50:31', 'f87d838e3d514bf3b8c0b1e2fb6cd8ca', '2016-10-06 20:50:31', null, '0', '74de02acea694c20ba602a6f772c2018', null, '这里是测试的评估');
COMMIT;

-- ----------------------------
--  Table structure for `dd_score_history`
-- ----------------------------
DROP TABLE IF EXISTS `dd_score_history`;
CREATE TABLE `dd_score_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '积分历史记录id',
  `from_user_id` int(11) DEFAULT NULL,
  `to_user_id` int(11) DEFAULT NULL,
  `value` decimal(11,2) DEFAULT NULL COMMENT '加减积分',
  `type` mediumint(8) DEFAULT NULL COMMENT '(字典表)(如果是交易类型的，标注to,from)',
  `create_date` datetime DEFAULT NULL  COMMENT '创建时间',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `create_by` int(11) DEFAULT NULL COMMENT '创建者',
  `update_by` int(11) DEFAULT NULL COMMENT '更新者',
  `del_flag` mediumint(8) DEFAULT NULL COMMENT '逻辑删除标记（0：显示；1：隐藏）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `dd_transfer_history`
-- ----------------------------
DROP TABLE IF EXISTS `dd_transfer_history`;
CREATE TABLE `dd_transfer_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '转让历史id',
  `works_id` int(11) DEFAULT NULL,
  `from_user_id` int(11) DEFAULT NULL,
  `to_user_id` int(11) DEFAULT NULL,
  `relation` varchar(64) DEFAULT NULL,
  `transfer_type` mediumint(8) DEFAULT NULL,
  `score` decimal(11,2) DEFAULT NULL,
  `status` mediumint(8) DEFAULT NULL,
  `reason` varchar(255) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL  COMMENT '创建时间',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `create_by` int(11) DEFAULT NULL COMMENT '创建者',
  `update_by` int(11) DEFAULT NULL COMMENT '更新者',
  `del_flag` mediumint(8) DEFAULT NULL COMMENT '逻辑删除标记（0：显示；1：隐藏）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `dd_value_report`
-- ----------------------------
DROP TABLE IF EXISTS `dd_value_report`;
CREATE TABLE `dd_value_report` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '价值报告id',
  `works_id` int(11) DEFAULT NULL,
  `certified_by` varchar(64) DEFAULT NULL COMMENT '出据方',
  `description` varchar(255) DEFAULT NULL,
  `picture` varchar(64) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL  COMMENT '创建时间',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `create_by` int(11) DEFAULT NULL COMMENT '创建者',
  `update_by` int(11) DEFAULT NULL COMMENT '更新者',
  `del_flag` mediumint(8) DEFAULT NULL COMMENT '逻辑删除标记（0：显示；1：隐藏）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `dd_working_progress`
-- ----------------------------
DROP TABLE IF EXISTS `dd_working_progress`;
CREATE TABLE `dd_working_progress` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '作品加工状态id',
  `works_id` int(11) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `picture` varchar(64) DEFAULT NULL,
  `percent` varchar(64) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL COMMENT '加工者',
  `create_date` datetime DEFAULT NULL  COMMENT '创建时间',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `create_by` int(11) DEFAULT NULL COMMENT '创建者',
  `update_by` int(11) DEFAULT NULL COMMENT '更新者',
  `del_flag` mediumint(8) DEFAULT NULL COMMENT '逻辑删除标记（0：显示；1：隐藏）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `dd_works`
-- ----------------------------
DROP TABLE IF EXISTS `dd_works`;
CREATE TABLE `dd_works` (
  `id` varchar(64) NOT NULL COMMENT '主键',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` varchar(64) DEFAULT NULL COMMENT '逻辑删除标记（0：显示；1：隐藏）',
  `no` varchar(64) DEFAULT NULL COMMENT '编号',
  `public_flag` varchar(64) DEFAULT '1' COMMENT '是否公开（0：隐藏；1：公开）',
  `collect_by` varchar(64) DEFAULT NULL COMMENT '收藏者',
  `provide_by` varchar(64) DEFAULT NULL COMMENT '提供者',
  `name` varchar(64) DEFAULT NULL COMMENT '作品名称',
  `breed` varchar(64) DEFAULT NULL COMMENT '品种',
  `type` varchar(64) DEFAULT NULL COMMENT '作品类型',
  `size` varchar(64) DEFAULT NULL COMMENT '尺寸重量',
  `gy_type` varchar(64) DEFAULT NULL COMMENT '工艺制作',
  `level_zk` varchar(64) DEFAULT NULL COMMENT '篆刻级别',
  `works_meanning` varchar(1000) DEFAULT NULL COMMENT '作品诠释',
  `status` varchar(64) DEFAULT NULL COMMENT '审核状态',
  `images` text COMMENT '图片',
  `recommend` varchar(64) DEFAULT '0',
  `reason` varchar(255) DEFAULT NULL,
  `kqdy` varchar(45) DEFAULT NULL,
  `maker` varchar(45) DEFAULT NULL,
  `make_time` datetime DEFAULT NULL,
  `slide` mediumint(11) DEFAULT NULL COMMENT '是否轮播 字典表：是，否，随机 （作品轮播：）',
  `slide_till` datetime DEFAULT NULL COMMENT '截止日期（和slide联合判断）',
  `browser_count` int(11) DEFAULT NULL COMMENT '浏览次数：（ip）',
  `follow_count` int(11) DEFAULT NULL COMMENT '关注数量，冗余字段',
  `value` decimal(11,2) DEFAULT NULL COMMENT '价值',
  `value_till` datetime DEFAULT NULL COMMENT '价值有效时间',
  `certified` mediumint(8) DEFAULT NULL COMMENT '是否认证(如果认证了，则页面有大红章，才能在页面显示value)',
  `working_status` mediumint(8) DEFAULT NULL COMMENT '作品状态字典表 完成、加工中',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='物品/作品';

-- ----------------------------
--  Records of `dd_works`
-- ----------------------------
BEGIN;
INSERT INTO `dd_works` VALUES ('3e4c8f5cfe934b9ebe12b5134c1fe7d4', '98bf5ff7bf234f0d8da72cbfd7df874a', '2016-10-28 22:10:23', '98bf5ff7bf234f0d8da72cbfd7df874a', '2016-10-28 22:10:23', null, '0', '1477663776274', null, null, 'afbe6358f48641c7b12061454952d9e6', null, null, null, null, null, null, null, '0', null, '0', null, null, null, null, null, null, null, null, null, null, null, null), ('4b0029d57abb4193829a4aaaaaf1a4bc', '98bf5ff7bf234f0d8da72cbfd7df874a', '2016-10-28 22:13:07', '98bf5ff7bf234f0d8da72cbfd7df874a', '2016-10-28 22:32:05', null, '0', '1477663973748', null, null, '88d548819d834cd1975d4676eeda1735', '测试作品', '2', '5', '123', '2', '1', '123', '0', null, '0', null, '20', '123', '2016-10-05 00:00:00', null, null, null, null, null, null, null, null), ('7ab1f578936548b98a9b957cabbaa2e4', '98bf5ff7bf234f0d8da72cbfd7df874a', '2016-10-28 22:54:19', '98bf5ff7bf234f0d8da72cbfd7df874a', '2016-10-28 23:26:43', null, '0', '1477666450759', null, null, '2c168b6cab404675b0abf31877871bc1', '123', '请选择品种', '请选择作品类型', '123|123|123|1231', '请选择工艺制作', '请选择篆刻级别', '123', '0', null, '0', null, '请选择矿区地域', '123', '2016-09-26 00:00:00', null, null, null, null, null, null, null, null), ('ff4f44bc11214c29a5d0ab2828e67ce8', '98bf5ff7bf234f0d8da72cbfd7df874a', '2016-10-28 22:11:51', '98bf5ff7bf234f0d8da72cbfd7df874a', '2016-10-28 22:11:51', null, '0', '1477663900878', null, null, '321b117ed25a4a5786afc732c4bfda5e', null, null, null, null, null, null, null, '0', null, '0', null, null, null, null, null, null, null, null, null, null, null, null);
COMMIT;

-- ----------------------------
--  Table structure for `dd_works_level`
-- ----------------------------
DROP TABLE IF EXISTS `dd_works_level`;
CREATE TABLE `dd_works_level` (
  `id` varchar(64) NOT NULL COMMENT '主键',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` varchar(64) DEFAULT NULL COMMENT '逻辑删除标记（0：显示；1：隐藏）',
  `works_id` varchar(64) DEFAULT NULL COMMENT '作品Id',
  `zhidi` varchar(64) DEFAULT NULL COMMENT '质地',
  `zhidi2` varchar(64) DEFAULT NULL COMMENT '质地二',
  `ganguan` varchar(64) DEFAULT NULL COMMENT '感官',
  `moshidu` varchar(64) DEFAULT NULL COMMENT '磨氏度',
  `xueliang` varchar(64) DEFAULT NULL COMMENT '血量',
  `xuese` varchar(64) DEFAULT NULL COMMENT '血色',
  `xuexing` varchar(64) DEFAULT NULL COMMENT '血形',
  `nongyandu` varchar(64) DEFAULT NULL COMMENT '浓艳度',
  `jingdu` varchar(64) DEFAULT NULL COMMENT '精度',
  `dise` varchar(64) DEFAULT NULL COMMENT '地色',
  `liu` varchar(64) DEFAULT NULL COMMENT '绺',
  `lie` varchar(64) DEFAULT NULL COMMENT '裂',
  `inithanxueliang` varchar(64) DEFAULT NULL COMMENT '原石含血量',
  `hanxuemian` varchar(64) DEFAULT NULL COMMENT '印章含血面',
  `hanxueliang` varchar(64) DEFAULT NULL COMMENT '雕件含血量',
  `hanxuefangshi` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='作品等级';

-- ----------------------------
--  Records of `dd_works_level`
-- ----------------------------
BEGIN;
INSERT INTO `dd_works_level` VALUES ('00099160af67474ab28ea2d58e38542d', '98bf5ff7bf234f0d8da72cbfd7df874a', '2016-10-15 13:19:24', '98bf5ff7bf234f0d8da72cbfd7df874a', '2016-10-15 13:19:24', null, '0', '457d27f4b220490bae1256bd745a1ef3', '3', '3', '2', '2', '2', '2', '2', '1', '2', '2', '2', '2', null, '2', null, '2'), ('097780a4f96e4eeca763f9b6f9c71ea7', '1', '2016-09-22 01:31:45', '1', '2016-09-22 01:31:45', null, '0', '3332dddef86f440caa726fc37b14fa2c', '2', '2', '1', '3', '2', '3', '2', '2', '3', '2', '2', '3', null, '3', null, null), ('23e92837f45b4f4facedc9c46983ba84', '98bf5ff7bf234f0d8da72cbfd7df874a', '2016-10-06 10:54:50', '98bf5ff7bf234f0d8da72cbfd7df874a', '2016-10-06 10:54:50', null, '0', '2421e75974e040f796fb9cd9afab7bb8', '3', '3', '3', '3', '3', '', '3', '2', '3', '', '3', '3', null, '', null, '3'), ('2510bc737f8a4ca1b8e1c24360760d8c', '98bf5ff7bf234f0d8da72cbfd7df874a', '2016-09-24 12:53:05', '98bf5ff7bf234f0d8da72cbfd7df874a', '2016-09-24 13:45:16', null, '0', 'd5f0904cc8ec496eabd0a9e290ef1af4', '3', '4', '3', '2', '2', '3', '2', '2', '2', '2', '2', '2', null, '2', null, '2'), ('32409a354443468f877d5160a48a5c0c', 'f87d838e3d514bf3b8c0b1e2fb6cd8ca', '2016-09-24 20:56:03', 'f87d838e3d514bf3b8c0b1e2fb6cd8ca', '2016-09-24 20:56:11', null, '0', '27b0139770d54ff5b8f7bd79d14d67ab', '', '', '', '', '', '', '2', '', '', '', '', '', null, '', null, null), ('32fecdd01a45400e80fde9a28192c778', '98bf5ff7bf234f0d8da72cbfd7df874a', '2016-09-21 20:22:34', '98bf5ff7bf234f0d8da72cbfd7df874a', '2016-09-21 20:22:34', null, '0', '6d05841e43e84bdda49e78e0cea0ea6a', '3', '3', '3', '3', '2', '2', '3', '2', '3', '3', '3', '3', null, '3', null, null), ('34ba71d37ac242cab4d9712b2ea539c8', 'f87d838e3d514bf3b8c0b1e2fb6cd8ca', '2016-10-07 12:37:31', 'f87d838e3d514bf3b8c0b1e2fb6cd8ca', '2016-10-07 12:37:31', null, '0', '177c132874c345c4b60e6489bbfa8dde', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null), ('38b790ccab784fd090d90100973d8141', 'f87d838e3d514bf3b8c0b1e2fb6cd8ca', '2016-10-16 13:48:52', 'f87d838e3d514bf3b8c0b1e2fb6cd8ca', '2016-10-16 13:48:52', null, '0', '150310d7de89436cb5c5a721bd53c4ee', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2'), ('4b1ea1d5d26d4ff2b1447da70b886dcd', 'f87d838e3d514bf3b8c0b1e2fb6cd8ca', '2016-10-16 13:50:13', 'f87d838e3d514bf3b8c0b1e2fb6cd8ca', '2016-10-16 13:50:13', null, '0', '4b86866116114c2ba794a1c79bf558b6', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null), ('68f7e388384c46efb6763ebaf0dfce13', '98bf5ff7bf234f0d8da72cbfd7df874a', '2016-10-15 13:21:46', '98bf5ff7bf234f0d8da72cbfd7df874a', '2016-10-15 13:21:46', null, '0', '24d1f53b247544eeb2b844369c762e62', '', '', '3', '', '', '', '', '', '', '', '', '', null, '', null, ''), ('6a899eadc16e4cfbbe8c341a9f0c6ad6', 'f87d838e3d514bf3b8c0b1e2fb6cd8ca', '2016-10-16 13:42:29', 'f87d838e3d514bf3b8c0b1e2fb6cd8ca', '2016-10-16 13:47:55', null, '0', '5834c460d0014004905afd9035d41396', '', '', '', '', '', '', '', '', '', '', '', '', null, '', null, '1'), ('7823ec2f828045d598fb959a86ad3fce', 'f87d838e3d514bf3b8c0b1e2fb6cd8ca', '2016-10-06 20:50:19', 'f87d838e3d514bf3b8c0b1e2fb6cd8ca', '2016-10-06 20:50:19', null, '0', '74de02acea694c20ba602a6f772c2018', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null), ('7fad36f81de144ea92fb70e76752809f', 'f87d838e3d514bf3b8c0b1e2fb6cd8ca', '2016-09-24 21:47:11', 'f87d838e3d514bf3b8c0b1e2fb6cd8ca', '2016-09-24 21:58:22', null, '0', '5bbe5e5f751e4c8b89f20c6694be11c7', '2', '2', '3', '4', '2', '2', '6', '2', '3', '3', '1', '2', null, '3', null, null), ('800cfc5d0d6a4250b3279e467bfd8337', '98bf5ff7bf234f0d8da72cbfd7df874a', '2016-10-14 01:20:25', '98bf5ff7bf234f0d8da72cbfd7df874a', '2016-10-14 01:20:25', null, '0', '53f49104195740c395dd8a88b956aed9', '', '', '', '', '', '', '', '', '', '', '', '', null, '', null, ''), ('882bda13e2244d178a403491fb5f12ee', '98bf5ff7bf234f0d8da72cbfd7df874a', '2016-10-11 21:39:45', '98bf5ff7bf234f0d8da72cbfd7df874a', '2016-10-11 21:39:45', null, '0', '3c4e80dedcb0478f8120b48c4248cc31', '2', '2', '3', '3', '', '3', '2', '1', '2', '2', '2', '2', null, '2', null, '2'), ('895d6066e7a447c8adab168e64cebdd1', 'fce0d97933344d0f8b46e80b30e32c8b', '2016-10-16 10:32:31', 'fce0d97933344d0f8b46e80b30e32c8b', '2016-10-16 10:32:31', null, '0', 'd020fc0be5504547986e842126a10e10', '2', '1', '3', '5', '3', '2', '4', '2', '1', '4', '3', '4', null, '3', null, null), ('8a9f828cdba745e899c1fd5e5116c8de', 'f87d838e3d514bf3b8c0b1e2fb6cd8ca', '2016-09-15 16:04:29', 'f87d838e3d514bf3b8c0b1e2fb6cd8ca', '2016-09-15 23:32:21', null, '0', '9f1da519505045339d09d3ff5129f2aa', '1', '2', '1', '5', '1', '2', '5', '3', '3', '3', '1', '4', null, '5', null, null), ('97bd5039adbc4c3c92405e5e81283872', 'f87d838e3d514bf3b8c0b1e2fb6cd8ca', '2016-10-16 10:00:29', 'f87d838e3d514bf3b8c0b1e2fb6cd8ca', '2016-10-16 10:00:29', null, '0', 'e8d25bed99f64e0b9ce7f5aeefbdbf10', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null), ('9a4e00c657004983bd780b9e86b5f656', '98bf5ff7bf234f0d8da72cbfd7df874a', '2016-10-11 21:55:32', '98bf5ff7bf234f0d8da72cbfd7df874a', '2016-10-11 21:55:32', null, '0', 'ce8aeaf85aab4e15993dab0f184747cd', '', '', '', '', '', '', '', '', '', '', '', '', null, '', null, ''), ('9a6044cb7b7d4204b84cb9e0ca964d73', '98bf5ff7bf234f0d8da72cbfd7df874a', '2016-10-15 14:11:45', '98bf5ff7bf234f0d8da72cbfd7df874a', '2016-10-15 14:11:45', null, '0', 'e8d4a95a4a2f4acd9b934779ca57e783', '', '', '', '', '', '', '', '', '', '', '', '', null, '', null, ''), ('9a9eaa2880f7495e98603c31ba7bac80', '98bf5ff7bf234f0d8da72cbfd7df874a', '2016-09-30 16:31:23', '98bf5ff7bf234f0d8da72cbfd7df874a', '2016-09-30 23:27:36', null, '0', '190196e54dd841f7827c3c044a553f26', '1', '1', '1', '2', '1', '1', '1', '1', '1', '1', '3', '3', null, '1', null, '3'), ('9dbff6704c2748d096c996d807b9b9e7', 'f87d838e3d514bf3b8c0b1e2fb6cd8ca', '2016-10-07 12:32:19', 'f87d838e3d514bf3b8c0b1e2fb6cd8ca', '2016-10-07 12:32:19', null, '0', '484755e1f1e44048a67be34e30d0375d', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null), ('a51e244ffc1f4b85b6148d2b0d3e3e21', 'f87d838e3d514bf3b8c0b1e2fb6cd8ca', '2016-10-06 21:43:37', 'f87d838e3d514bf3b8c0b1e2fb6cd8ca', '2016-10-06 21:43:37', null, '0', '672821a40a37424682f1129923e058fd', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null), ('b94ce544246646fab39a678ab9000cf7', '98bf5ff7bf234f0d8da72cbfd7df874a', '2016-10-14 01:21:38', '98bf5ff7bf234f0d8da72cbfd7df874a', '2016-10-14 01:21:38', null, '0', '1c25221e6e2a4abaad1b72733af3445a', '', '', '', '', '', '', '', '', '', '', '', '', null, '', null, ''), ('b99549f5181947d3affba0c53cea03c2', '98bf5ff7bf234f0d8da72cbfd7df874a', '2016-10-16 19:19:12', '98bf5ff7bf234f0d8da72cbfd7df874a', '2016-10-16 19:19:12', null, '0', 'bc8a146d518f491481e6ad1c01605e01', '', '', '', '', '', '', '', '', '', '', '', '', null, '', null, ''), ('bd6d9d15f2124f9f912405f2cbb90907', '1', '2016-09-22 21:23:01', '1', '2016-09-22 21:27:50', null, '0', '2ec224cdafc44778bebd1c568443e831', '2', '', '', '', '', '', '', '', '', '', '', '', null, '', null, null), ('c42908a20add4a72a56ac69899d39b25', 'f87d838e3d514bf3b8c0b1e2fb6cd8ca', '2016-10-16 13:52:31', 'f87d838e3d514bf3b8c0b1e2fb6cd8ca', '2016-10-16 13:52:31', null, '0', '952590a9f79c4f6d857aad98c20826df', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null), ('c809bfc7f6414e9da3d7703f6fc9d127', '98bf5ff7bf234f0d8da72cbfd7df874a', '2016-10-06 10:47:19', '98bf5ff7bf234f0d8da72cbfd7df874a', '2016-10-06 10:47:19', null, '0', 'd331b7474d33486291b87f847589dcf8', '1', '1', '1', '1', '1', '2', '2', '2', '2', '2', '2', '2', null, '2', null, '2'), ('cc1558088dac4bc7ae407db69b72d708', 'f87d838e3d514bf3b8c0b1e2fb6cd8ca', '2016-10-07 13:17:22', 'f87d838e3d514bf3b8c0b1e2fb6cd8ca', '2016-10-07 13:17:22', null, '0', '301371b089d7487b94fd32f52e017c89', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null), ('cc9c2d8dfb1f4795a750cce94e725573', 'f87d838e3d514bf3b8c0b1e2fb6cd8ca', '2016-10-16 13:48:17', 'f87d838e3d514bf3b8c0b1e2fb6cd8ca', '2016-10-16 13:48:17', null, '0', '99503788c0ec4e46babfec28f25d01bd', null, null, null, null, null, null, null, null, null, null, null, null, null, '1', null, null), ('ce175c01159647548bcfe08d6aabb724', '98bf5ff7bf234f0d8da72cbfd7df874a', '2016-10-11 21:54:40', '98bf5ff7bf234f0d8da72cbfd7df874a', '2016-10-11 21:54:40', null, '0', '60bc298551c7446a9422aa77792afe32', '', '', '', '', '', '', '', '', '', '', '', '', null, '', null, ''), ('d0c35034768146179585d8158b2c70b0', '98bf5ff7bf234f0d8da72cbfd7df874a', '2016-10-14 01:19:37', '98bf5ff7bf234f0d8da72cbfd7df874a', '2016-10-14 01:19:37', null, '0', 'fc066eb410834bf79448e50e97bdb5f9', '', '', '', '', '', '', '', '', '', '', '', '', null, '', null, ''), ('d42fff232236483eab9682f5eec2b5c3', '1', '2016-09-22 20:57:11', '1', '2016-09-22 21:03:13', null, '0', '093130e80b8e4e85957eee39dad625a5', '2', '2', '2', '2', '2', '2', '2', '1', '2', '2', '2', '2', null, '2', null, null), ('d8cb4076a11548fe882382f61657451a', 'f87d838e3d514bf3b8c0b1e2fb6cd8ca', '2016-10-16 13:52:47', 'f87d838e3d514bf3b8c0b1e2fb6cd8ca', '2016-10-16 13:52:47', null, '0', '98b71c2410e24db995b85358d99d699c', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null), ('e069cafe56444375bc71bb4b032f3fca', 'f87d838e3d514bf3b8c0b1e2fb6cd8ca', '2016-10-06 22:59:21', 'f87d838e3d514bf3b8c0b1e2fb6cd8ca', '2016-10-06 22:59:21', null, '0', 'ba46d9ca602944e6a902b6f0bb7cf035', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null), ('e4deef57adbc4e2898b36d2e77aadfcb', '98bf5ff7bf234f0d8da72cbfd7df874a', '2016-10-03 12:12:51', '98bf5ff7bf234f0d8da72cbfd7df874a', '2016-10-03 12:12:51', null, '0', '9d5e722d66db456d83d7291c41c7b984', '', '', '', '', '', '', '', '', '', '', '', '', null, '', null, ''), ('eed2b84b30a148ff99a78e0ee29500fe', '1', '2016-09-22 03:25:39', '1', '2016-09-22 03:26:42', null, '0', '5c5967d2fbc041eb9f3a06caa2fb25c8', '1', '4', '3', '1', '1', '1', '1', '1', '4', '4', '4', '4', null, '4', null, null);
COMMIT;

-- ----------------------------
--  Table structure for `sys_button`
-- ----------------------------
DROP TABLE IF EXISTS `sys_button`;
CREATE TABLE `sys_button` (
  `button_id` int(11) NOT NULL AUTO_INCREMENT,
  `menu_id` int(11) NOT NULL COMMENT '子菜单名称',
  `button_name` varchar(64) NOT NULL COMMENT '按钮名称',
  `button_url` varchar(255) NOT NULL COMMENT '按钮路径',
  `status` int(3) NOT NULL DEFAULT '1',
  PRIMARY KEY (`button_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `sys_button`
-- ----------------------------
BEGIN;
INSERT INTO `sys_button` VALUES ('1', '2', '新增菜单/子菜单', 'right/addMenu', '1'), ('2', '2', '修改菜单/子菜单', 'right/editMenu', '1'), ('3', '2', '删除菜单/子菜单', 'right/deleteMenu', '1'), ('4', '2', '批量删除菜单/子菜单', 'right/batchDeleteMenu', '1'), ('5', '2', '子菜单信息', 'right/subMenu', '1'), ('6', '2', '权限信息', 'right/button', '1'), ('7', '2', '新增权限', 'right/addBtn', '1'), ('8', '2', '修改权限', 'right/editBtn', '1'), ('9', '2', '删除权限', 'right/deleteBtn', '1'), ('10', '2', '批量删除权限', 'right/batchDeleteBtn', '1'), ('11', '3', '新增', 'user/add', '1'), ('12', '3', '修改', 'user/edit', '1'), ('13', '3', '删除', 'user/delete', '1'), ('14', '3', '批量删除', 'user/batchDelete', '1'), ('15', '3', '授权', 'user/editRole', '1'), ('16', '4', '新增', 'role/add', '1'), ('17', '4', '修改', 'role/edit', '1'), ('18', '4', '删除', 'role/delete', '1'), ('19', '4', '批量删除', 'role/batchDelete', '1'), ('20', '4', '编辑权限', 'role/editRight', '1');
COMMIT;

-- ----------------------------
--  Table structure for `sys_dict`
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict`;
CREATE TABLE `sys_dict` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `value` varchar(100) NOT NULL COMMENT '数据值',
  `label` varchar(100) NOT NULL COMMENT '标签名',
  `type` varchar(100) NOT NULL COMMENT '类型',
  `description` varchar(100) NOT NULL COMMENT '描述',
  `sort` decimal(10,0) NOT NULL COMMENT '排序（升序）',
  `parent_id` varchar(64) DEFAULT '0' COMMENT '父级编号',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `sys_dict_value` (`value`),
  KEY `sys_dict_label` (`label`),
  KEY `sys_dict_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='字典表';

-- ----------------------------
--  Records of `sys_dict`
-- ----------------------------
BEGIN;
INSERT INTO `sys_dict` VALUES ('001d31a2e0424874aa9cbd8e851d71b4', '4', '4-5', 'dd_moshidu', '磨氏度', '40', '0', '1', '2016-09-04 17:05:15', '1', '2016-09-24 11:25:07', '', '0'), ('006d08892fb04e2bb86c65498115397c', '50', '灰刚板地', 'dd_zhidi2', '质地二', '50', '0', '1', '2016-09-04 16:56:36', '1', '2016-09-04 16:56:36', '', '0'), ('046495809ab54a6b80cdbb699362ce28', '3', '&gt;15%', 'dd_xueliang', '血量', '30', '0', '1', '2016-09-04 17:12:54', '1', '2016-09-04 17:12:54', '', '0'), ('049f941b3b62432a8bcdbcb261c2e517', '70', '康山岭', 'dd_kqdy', '矿区地域', '70', '0', '1', '2016-10-06 21:22:26', '1', '2016-10-06 21:22:26', '', '0'), ('0507fb414217482f9010c14b5e34eca9', '30', '粗糠坞', 'dd_kqdy', '矿区地域', '30', '0', '1', '2016-10-06 21:21:59', '1', '2016-10-06 21:21:59', '', '0'), ('0852237bdb59452197a47de0b293e42e', '3', '硬', 'dd_zhidi', '质地', '30', '0', '1', '2016-09-04 16:54:38', '1', '2016-09-04 16:54:38', '', '0'), ('0a22f3278a624882a822e0820f27efcb', '1', '主表', 'table_type', '表类型', '20', '0', '1', '2016-01-05 21:47:14', '1', '2016-01-05 21:53:34', '', '0'), ('0b3ad7ad1d63428793805b6d4b0504fc', '3', '黑', 'dd_dise', '地色', '30', '0', '1', '2016-09-04 17:25:00', '1', '2016-09-04 17:25:00', '', '0'), ('0d0914ea72d14061a46f33c1d3ec9a9f', '1', '浓艳', 'dd_nongyandu', '浓艳度', '10', '0', '1', '2016-09-04 17:18:51', '1', '2016-09-04 17:18:51', '', '0'), ('0d7a2285c70147a5a51d25716169edcc', '2', '软', 'dd_zhidi', '质地', '20', '0', '1', '2016-09-04 16:54:30', '1', '2016-09-04 16:54:30', '', '0'), ('0d7bf35943e84c52ae25582d2ac82477', '2', '昌化田黄石', 'dd_pinzhong', '品种', '20', '0', '1', '2016-09-24 15:52:44', '1', '2016-09-24 15:52:44', '', '0'), ('0ee131f8703b433d96e7c441b40b8b0b', '1', '表面含血', 'dd_hanxuefangshi', '含血方式', '10', '0', '1', '2016-09-24 13:55:02', '1', '2016-09-24 13:55:02', '', '0'), ('1', '0', '正常', 'del_flag', '删除标记', '10', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0'), ('10', 'yellow', '黄色', 'color', '颜色值', '40', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0'), ('100', 'java.util.Date', 'Date', 'gen_java_type', 'Java类型', '50', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1'), ('101', 'com.thinkgem.jeesite.modules.sys.entity.User', 'User', 'gen_java_type', 'Java类型', '60', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1'), ('102', 'com.thinkgem.jeesite.modules.sys.entity.Office', 'Office', 'gen_java_type', 'Java类型', '70', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1'), ('103', 'com.thinkgem.jeesite.modules.sys.entity.Area', 'Area', 'gen_java_type', 'Java类型', '80', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1'), ('104', 'Custom', 'Custom', 'gen_java_type', 'Java类型', '90', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1'), ('105', '1', '会议通告\0\0', 'oa_notify_type', '通知通告类型', '10', '0', '1', '2013-11-08 08:00:00', '1', '2013-11-08 08:00:00', null, '0'), ('106', '2', '奖惩通告\0\0', 'oa_notify_type', '通知通告类型', '20', '0', '1', '2013-11-08 08:00:00', '1', '2013-11-08 08:00:00', null, '0'), ('107', '3', '活动通告\0\0', 'oa_notify_type', '通知通告类型', '30', '0', '1', '2013-11-08 08:00:00', '1', '2013-11-08 08:00:00', null, '0'), ('108', '0', '草稿', 'oa_notify_status', '通知通告状态', '10', '0', '1', '2013-11-08 08:00:00', '1', '2013-11-08 08:00:00', null, '0'), ('109', '1', '发布', 'oa_notify_status', '通知通告状态', '20', '0', '1', '2013-11-08 08:00:00', '1', '2013-11-08 08:00:00', null, '0'), ('11', 'orange', '橙色', 'color', '颜色值', '50', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0'), ('110', '0', '未读', 'oa_notify_read', '通知通告状态', '10', '0', '1', '2013-11-08 08:00:00', '1', '2013-11-08 08:00:00', null, '0'), ('111', '1', '已读', 'oa_notify_read', '通知通告状态', '20', '0', '1', '2013-11-08 08:00:00', '1', '2013-11-08 08:00:00', null, '0'), ('11b0e9453f5a42798adacaf921ead448', '2', '2-4', 'dd_moshidu', '磨氏度', '20', '0', '1', '2016-09-04 17:04:53', '1', '2016-09-24 11:24:32', '', '0'), ('12', 'default', '默认主题', 'theme', '主题方案', '10', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0'), ('13', 'cerulean', '天蓝主题', 'theme', '主题方案', '20', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0'), ('14', 'readable', '橙色主题', 'theme', '主题方案', '30', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0'), ('17', '1', '国家', 'sys_area_type', '区域类型', '10', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0'), ('18', '2', '省份、直辖市', 'sys_area_type', '区域类型', '20', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0'), ('19', '3', '地市', 'sys_area_type', '区域类型', '30', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0'), ('1973488a10db4f58a7b50ffbc0061dbb', '1', '净', 'dd_jingdu', '精度', '10', '0', '1', '2016-09-04 17:19:54', '1', '2016-09-04 17:19:54', '', '0'), ('1a238da3b6de4fdd95800faaf50ab383', '110', '笔架石', 'dd_kqdy', '矿区地域', '110', '0', '1', '2016-10-06 21:23:01', '1', '2016-10-06 21:23:01', '', '0'), ('1c0ac576c33d41fcb4c16602bf4fad5d', 'post', 'post', 'interface_type', '接口类型', '20', '0', '1', '2015-11-30 15:52:25', '1', '2015-11-30 15:52:39', '', '0'), ('1dbf52e46c8e4263b2acefbcdf9aab61', '120', '灰石岭', 'dd_kqdy', '矿区地域', '120', '0', '1', '2016-10-06 21:23:10', '1', '2016-10-06 21:23:10', '', '0'), ('1e6a4444f7834307b2bc22eb58989430', '5', '褐', 'dd_dise', '地色', '50', '0', '1', '2016-09-04 17:25:26', '1', '2016-09-04 17:25:26', '', '0'), ('1eb6c056151943debc494db4b8062cdf', '1', '鲜红', 'dd_xuese', '血色', '10', '0', '1', '2016-09-04 17:13:55', '1', '2016-09-04 17:13:55', '', '0'), ('1f191377c532482abdff242209963bb1', '6', '星点状', 'dd_xuexing', '血形', '70', '0', '1', '2016-09-04 17:18:10', '1', '2016-09-04 17:18:10', '', '0'), ('2', '1', '删除', 'del_flag', '删除标记', '20', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0'), ('20', '4', '区县', 'sys_area_type', '区域类型', '40', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0'), ('21', '1', '公司', 'sys_office_type', '机构类型', '60', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0'), ('22', '2', '部门', 'sys_office_type', '机构类型', '70', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0'), ('221a918bd1e149239a17ab0fdeaf5ecd', 'get', 'get', 'interface_type', '接口类型', '10', '0', '1', '2015-11-30 15:51:56', '1', '2015-11-30 15:51:56', '', '0'), ('23', '3', '小组', 'sys_office_type', '机构类型', '80', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0'), ('24', '4', '其它', 'sys_office_type', '机构类型', '90', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0'), ('25', '1', '综合部', 'sys_office_common', '快捷通用部门', '30', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0'), ('25f9dfd73c4f4f31b1d76a6c28246635', '5', '网脉状', 'dd_xuexing', '血形', '50', '0', '1', '2016-09-04 17:17:40', '1', '2016-09-04 17:17:40', '', '0'), ('26', '2', '开发部', 'sys_office_common', '快捷通用部门', '40', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0'), ('27', '3', '人力部', 'sys_office_common', '快捷通用部门', '50', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0'), ('27c183e802b0459da5d5403f46b26dd3', '60', '活刚板地', 'dd_zhidi2', '质地二', '60', '0', '1', '2016-09-04 16:56:53', '1', '2016-09-04 16:56:53', '', '0'), ('28', '1', '一级', 'sys_office_grade', '机构等级', '10', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0'), ('281b416efb774626897b20933050c423', '2', '艳', 'dd_nongyandu', '浓艳度', '20', '0', '1', '2016-09-04 17:19:00', '1', '2016-09-04 17:19:00', '', '0'), ('2878a390fde7406cb593835fc4498d05', '2', '裂', 'dd_lie', '裂', '20', '0', '1', '2016-09-04 17:30:00', '1', '2016-09-04 17:30:00', '', '0'), ('29', '2', '二级', 'sys_office_grade', '机构等级', '20', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0'), ('2c39d7c90ea34cd7bd23a2bc197b44d3', '1', '微裂', 'dd_lie', '裂', '10', '0', '1', '2016-09-04 17:29:47', '1', '2016-09-04 17:29:47', '', '0'), ('2d231c87a6844c39b77d29a7d407ab47', '4', '复位黏结', 'dd_lie', '裂', '40', '0', '1', '2016-09-04 17:30:27', '1', '2016-09-04 17:30:27', '', '0'), ('3', '1', '显示', 'show_hide', '显示/隐藏', '10', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0'), ('30', '3', '三级', 'sys_office_grade', '机构等级', '30', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0'), ('3069d36c610840d8a55fb457226be15a', '6', '1面', 'dd_mian', '印章含血面', '60', '0', '1', '2016-09-04 17:32:10', '1', '2016-09-04 17:32:10', '', '0'), ('31', '4', '四级', 'sys_office_grade', '机构等级', '40', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0'), ('32', '1', '所有数据', 'sys_data_scope', '数据范围', '10', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0'), ('321ec8d0ab714518acf0eea10c932348', '40', '老鹰岩', 'dd_kqdy', '矿区地域', '40', '0', '1', '2016-10-06 21:22:05', '1', '2016-10-06 21:22:05', '', '0'), ('326e7bc5590546239f3d10c102e86d36', '3', '花', 'dd_jingdu', '精度', '30', '0', '1', '2016-09-04 17:20:14', '1', '2016-09-04 17:20:14', '', '0'), ('33', '2', '所在公司及以下数据', 'sys_data_scope', '数据范围', '20', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0'), ('33bbe7a5d3764c35974ad7bb86509b8f', '6', '青', 'dd_dise', '地色', '60', '0', '1', '2016-09-04 17:25:38', '1', '2016-09-04 17:25:38', '', '0'), ('34', '3', '所在公司数据', 'sys_data_scope', '数据范围', '30', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0'), ('35', '4', '所在部门及以下数据', 'sys_data_scope', '数据范围', '40', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0'), ('36', '5', '所在部门数据', 'sys_data_scope', '数据范围', '50', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0'), ('36e938a425624de0801fcd2f37f37083', '2', '5面', 'dd_mian', '印章含血面', '20', '0', '1', '2016-09-04 17:31:17', '1', '2016-09-04 17:31:17', '', '0'), ('37', '8', '仅本人数据', 'sys_data_scope', '数据范围', '90', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0'), ('3778e8dba108458fb4def094385098d3', '1', '审核中', 'dd_status', '作品审核', '10', '0', '1', '2016-09-15 13:33:14', '1', '2016-09-15 13:33:14', '', '0'), ('38', '9', '按明细设置', 'sys_data_scope', '数据范围', '100', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0'), ('382955c8e8244dd2bc65065d19bb7caa', '3', '透、细腻、干', 'dd_ganguan', '感官', '30', '0', '1', '2016-09-04 17:01:06', '1', '2016-09-24 13:57:54', '', '0'), ('3883fd12606c4bd5bbff8ff4c959e0b3', '2', '印章', 'dd_zuopinleixing', '作品类型', '20', '0', '1', '2016-09-24 20:20:49', '1', '2016-09-24 20:20:49', '', '0'), ('39', '1', '系统管理', 'sys_user_type', '用户类型', '10', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0'), ('3aa4470658154053b9531106c786f26a', '1', '2&ndash;2.5', 'dd_moshidu', '磨氏度', '10', '0', '1', '2016-09-04 17:02:12', '1', '2016-09-04 17:02:12', '', '0'), ('3c37273e37bc475fa078041eb0ba6ed7', '2', '白', 'dd_dise', '地色', '20', '0', '1', '2016-09-04 17:24:50', '1', '2016-09-04 17:24:50', '', '0'), ('3c791be00171489cbb669ad571245e60', '3', '三级', 'dd_level', '级别', '30', '0', '1', '2016-09-24 20:31:25', '1', '2016-09-24 20:31:25', '', '0'), ('4', '0', '隐藏', 'show_hide', '显示/隐藏', '20', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0'), ('40', '2', '部门经理', 'sys_user_type', '用户类型', '20', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0'), ('41', '3', '普通用户', 'sys_user_type', '用户类型', '30', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0'), ('42', 'basic', '基础主题', 'cms_theme', '站点主题', '10', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '1'), ('426d26147d8a4bc083a9d111cd0ae5ac', '130', '鸡冠岩', 'dd_kqdy', '矿区地域', '130', '0', '1', '2016-10-06 21:23:18', '1', '2016-10-06 21:23:18', '', '0'), ('43', 'blue', '蓝色主题', 'cms_theme', '站点主题', '20', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '1'), ('43c9472f411c4d3eafb3bf5319ffe499', '2', '异常报告', 'report_type', '异常的报告', '20', '0', '1', '2015-12-08 17:49:57', '1', '2015-12-08 17:49:57', '', '0'), ('44', 'red', '红色主题', 'cms_theme', '站点主题', '30', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '1'), ('45', 'article', '文章模型', 'cms_module', '栏目模型', '10', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '1'), ('46', 'picture', '图片模型', 'cms_module', '栏目模型', '20', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '1'), ('47', 'download', '下载模型', 'cms_module', '栏目模型', '30', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '1'), ('479b623a72504c7bb0794c8154d6de82', '5', '无', 'dd_lie', '裂', '50', '0', '1', '2016-10-07 09:49:50', '1', '2016-10-07 09:49:50', '', '0'), ('48', 'link', '链接模型', 'cms_module', '栏目模型', '40', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '1'), ('49', 'special', '专题模型', 'cms_module', '栏目模型', '50', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '1'), ('4996faa1719341d483f11e17a4d6e9cf', '7', '混合', 'dd_dise', '地色', '70', '0', '1', '2016-09-04 17:25:47', '1', '2016-09-04 17:25:47', '', '0'), ('4a953baa9f3b4014a1d22e1669cd83bb', '4', '杂', 'dd_jingdu', '精度', '40', '0', '1', '2016-09-04 17:20:25', '1', '2016-09-04 17:20:25', '', '0'), ('4c593f5e344f49a6814a900d135b7c10', '4', '不透、细腻、温润', 'dd_ganguan', '感官', '40', '0', '1', '2016-09-04 17:01:16', '1', '2016-09-24 13:58:31', '', '0'), ('4c7fe66af9b64f5192d5ce01618adefa', '4', '复位黏结', 'dd_liu', '绺', '40', '0', '1', '2016-09-04 17:28:18', '1', '2016-09-04 17:28:18', '', '0'), ('4ed93f4ca2a64297b972d4fc5c5b5993', '1', '&gt;50%', 'dd_xueliang', '血量', '10', '0', '1', '2016-09-04 17:07:54', '1', '2016-09-04 17:07:54', '', '0'), ('5', '1', '是', 'yes_no', '是/否', '10', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0'), ('50', '0', '默认展现方式', 'cms_show_modes', '展现方式', '10', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '1'), ('51', '1', '首栏目内容列表', 'cms_show_modes', '展现方式', '20', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '1'), ('52', '2', '栏目第一条内容', 'cms_show_modes', '展现方式', '30', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '1'), ('52250b5574d9497ab4b27ee685c67531', '2', '二级', 'dd_level', '级别', '20', '0', '1', '2016-09-24 20:31:16', '1', '2016-09-24 20:31:16', '', '0'), ('52f52a5fb006420981753b3b001b0a2b', '1', '昌化田黄鸡血石', 'dd_pinzhong', '品种', '10', '0', '1', '2016-09-24 15:52:30', '1', '2016-09-24 15:52:30', '', '0'), ('53', '0', '发布', 'cms_del_flag', '内容状态', '10', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '1'), ('537354e101d44095914ac34f3fcfbf0e', '3', '裂', 'dd_liu', '绺', '30', '0', '1', '2016-09-04 17:27:29', '1', '2016-09-04 17:27:29', '', '0'), ('53e64e07c4cf41fe894dfcee387ef71b', '1', '黄', 'dd_dise', '地色', '10', '0', '1', '2016-09-04 17:24:45', '1', '2016-09-04 17:24:45', '', '0'), ('54', '1', '删除', 'cms_del_flag', '内容状态', '20', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '1'), ('55', '2', '审核', 'cms_del_flag', '内容状态', '15', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '1'), ('56', '1', '首页焦点图', 'cms_posid', '推荐位', '10', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '1'), ('57', '2', '栏目页文章推荐', 'cms_posid', '推荐位', '20', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '1'), ('57b74b81792741528beea50524d0120a', '6', '其他', 'dd_zuopinleixing', '作品类型', '60', '0', '1', '2016-09-24 20:22:00', '1', '2016-09-24 20:22:00', '', '0'), ('58', '1', '咨询', 'cms_guestbook', '留言板分类', '10', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '1'), ('5859360f9f2b4483b7e936ad4363a6f7', '10', '纤岭', 'dd_kqdy', '矿区地域', '10', '0', '1', '2016-10-06 21:21:35', '1', '2016-10-06 21:21:35', '', '0'), ('59', '2', '建议', 'cms_guestbook', '留言板分类', '20', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '1'), ('5b899603552c48519e7ba8eb9da0b41f', '0', '单表', 'table_type', '表类型', '10', '0', '1', '2016-01-05 21:46:39', '1', '2016-01-05 21:53:50', '', '0'), ('5cc745f5851f4429adaa80dae2a1e195', '50', '红硐岩', 'dd_kqdy', '矿区地域', '50', '0', '1', '2016-10-06 21:22:12', '1', '2016-10-06 21:22:12', '', '0'), ('6', '0', '否', 'yes_no', '是/否', '20', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0'), ('60', '3', '投诉', 'cms_guestbook', '留言板分类', '30', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '1'), ('61', '4', '其它', 'cms_guestbook', '留言板分类', '40', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '1'), ('618ed09f357e45ada15523a8cd9b334f', '1', '原石', 'dd_zuopinleixing', '作品类型', '10', '0', '1', '2016-09-24 20:17:08', '1', '2016-09-24 20:17:08', '', '0'), ('62', '1', '公休', 'oa_leave_type', '请假类型', '10', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0'), ('62c46500d26b405c9aaf6cf4abd3394d', '2', '古玩', 'dd_preference', '收藏偏好', '20', '0', '1', '2016-09-22 05:30:40', '1', '2016-09-22 05:30:40', '', '0'), ('63', '2', '病假', 'oa_leave_type', '请假类型', '20', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0'), ('64', '3', '事假', 'oa_leave_type', '请假类型', '30', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0'), ('64e59b749e924dd990522504ffa12b49', '3', '条状', 'dd_xuexing', '血形', '30', '0', '1', '2016-09-04 17:17:16', '1', '2016-09-04 17:17:16', '', '0'), ('65', '4', '调休', 'oa_leave_type', '请假类型', '40', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0'), ('66', '5', '婚假', 'oa_leave_type', '请假类型', '60', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0'), ('67', '1', '接入日志', 'sys_log_type', '日志类型', '30', '0', '1', '2013-06-03 08:00:00', '1', '2013-06-03 08:00:00', null, '0'), ('68', '2', '异常日志', 'sys_log_type', '日志类型', '40', '0', '1', '2013-06-03 08:00:00', '1', '2013-06-03 08:00:00', null, '0'), ('680ddd8c91fe43588a7bb7aafe816633', '1', '正常报告', 'report_type', '正常的报告', '10', '0', '1', '2015-12-08 17:49:28', '1', '2015-12-08 17:49:28', '正常的报告', '0'), ('684b56a51508445e9dd8031c1afa6656', '70', '刚硬地', 'dd_zhidi2', '质地二', '70', '0', '1', '2016-09-04 16:57:22', '1', '2016-09-04 16:57:22', '', '0'), ('68f91e9c1c12456ca74857a6c1a0de87', '4', '暗红', 'dd_xuese', '血色', '40', '0', '1', '2016-09-04 17:15:58', '1', '2016-09-04 17:15:58', '', '0'), ('69', 'leave', '请假流程', 'act_type', '流程类型', '10', '0', '1', '2013-06-03 08:00:00', '1', '2013-06-03 08:00:00', null, '0'), ('6a3fe5cdfe7642468ce8f572a376da86', '5', '4-6', 'dd_moshidu', '磨氏度', '50', '0', '1', '2016-09-04 17:05:31', '1', '2016-09-24 11:25:21', '', '0'), ('6ced885afc3348e79312d164531af705', '2', '未通过', 'dd_status', '作品审核', '20', '0', '1', '2016-09-15 13:33:24', '1', '2016-09-15 13:33:24', '', '0'), ('7', 'red', '红色', 'color', '颜色值', '10', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0'), ('70', 'test_audit', '审批测试流程', 'act_type', '流程类型', '20', '0', '1', '2013-06-03 08:00:00', '1', '2013-06-03 08:00:00', null, '0'), ('700975067b454350836de058eba62df4', '4', '小玩件', 'dd_zuopinleixing', '作品类型', '40', '0', '1', '2016-09-24 20:21:30', '1', '2016-09-24 20:21:30', '', '0'), ('71', '1', '分类1', 'act_category', '流程分类', '10', '0', '1', '2013-06-03 08:00:00', '1', '2015-11-06 16:08:42', '', '0'), ('71804c6b820048b09c9f6f2c11121113', 'ace', 'ACE风格', 'theme', '主题方案', '15', '0', '1', '2016-04-20 21:57:21', '1', '2016-04-20 21:57:21', '', '0'), ('71cf200c40d04a7b9ef9209a69ebd958', '1', '一级', 'dd_level', '级别', '10', '0', '1', '2016-09-24 20:31:03', '1', '2016-09-24 20:31:03', '', '0'), ('72', '2', '分类2', 'act_category', '流程分类', '20', '0', '1', '2013-06-03 08:00:00', '1', '2013-06-03 08:00:00', null, '0'), ('72c5bd5aacd14ba0a5dbe3cf4c99069a', '2', '内在含血', 'dd_hanxuefangshi', '含血方式', '20', '0', '1', '2016-09-24 13:55:13', '1', '2016-09-24 13:55:13', '', '0'), ('73', 'crud', '增删改查', 'gen_category', '代码生成分类', '10', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1'), ('74', 'crud_many', '增删改查（包含从表）', 'gen_category', '代码生成分类', '20', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1'), ('747623f17c4d4d6ab5d3f7a7e31095fe', '60', '红硐湾', 'dd_kqdy', '矿区地域', '60', '0', '1', '2016-10-06 21:22:19', '1', '2016-10-06 21:22:19', '', '0'), ('75', 'tree', '树结构', 'gen_category', '代码生成分类', '30', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1'), ('76', '=', '=', 'gen_query_type', '查询方式', '10', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1'), ('77', '!=', '!=', 'gen_query_type', '查询方式', '20', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1'), ('78', '&gt;', '&gt;', 'gen_query_type', '查询方式', '30', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1'), ('79', '&lt;', '&lt;', 'gen_query_type', '查询方式', '40', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1'), ('7c6e845565204df387791ee78b32d2d3', '4', '灰', 'dd_dise', '地色', '40', '0', '1', '2016-09-04 17:25:12', '1', '2016-09-04 17:25:12', '', '0'), ('7cbd8538fcba476ebb973ca49209be24', '2', '收藏者', 'dd_user_type', '用户类型', '20', '0', '1', '2016-09-13 20:57:05', '1', '2016-09-13 20:57:05', '', '0'), ('8', 'green', '绿色', 'color', '颜色值', '20', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0'), ('80', 'between', 'Between', 'gen_query_type', '查询方式', '50', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1'), ('81', 'like', 'Like', 'gen_query_type', '查询方式', '60', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1'), ('813f9694a4144b86b4254529a43916f3', '10', '冻地', 'dd_zhidi2', '质地二', '10', '0', '1', '2016-09-04 16:55:22', '1', '2016-09-04 16:55:22', '', '0'), ('82', 'left_like', 'Left Like', 'gen_query_type', '查询方式', '70', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1'), ('83', 'right_like', 'Right Like', 'gen_query_type', '查询方式', '80', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1'), ('84', 'input', '文本框', 'gen_show_type', '字段生成方案', '10', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1'), ('84200b9655a14d1fb5de4ac43e8ab249', '3', '淡', 'dd_nongyandu', '浓艳度', '30', '0', '1', '2016-09-04 17:19:12', '1', '2016-09-04 17:19:12', '', '0'), ('85', 'textarea', '文本域', 'gen_show_type', '字段生成方案', '20', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1'), ('85ba34675ca64fc98c39fb535e459d60', '1', '6面', 'dd_mian', '印章含血面', '10', '0', '1', '2016-09-04 17:31:10', '1', '2016-09-04 17:31:10', '', '0'), ('85ff7713ec0c401183d9f58332b7ec82', '3', '4面', 'dd_mian', '印章含血面', '30', '0', '1', '2016-09-04 17:31:24', '1', '2016-09-04 17:31:24', '', '0'), ('86', 'select', '下拉框', 'gen_show_type', '字段生成方案', '30', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1'), ('87', 'checkbox', '复选框', 'gen_show_type', '字段生成方案', '40', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1'), ('87d1d47af7a141a19dee9b26f381cbfe', '90', '其他', 'dd_zhidi2', '质地二', '90', '0', '1', '2016-10-07 09:47:45', '1', '2016-10-07 09:47:45', '', '0'), ('88', 'radiobox', '单选框', 'gen_show_type', '字段生成方案', '50', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1'), ('88467409951845aa9f79998e185eaa0d', '3', '表面及内在含血', 'dd_hanxuefangshi', '含血方式', '30', '0', '1', '2016-09-24 13:55:33', '1', '2016-09-24 15:51:52', '', '0'), ('89', 'dateselect', '日期选择', 'gen_show_type', '字段生成方案', '60', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1'), ('8901e8145f1b463d8cc5c5eb58b0146b', '4', '&gt;5%', 'dd_xueliang', '血量', '40', '0', '1', '2016-09-04 17:13:07', '1', '2016-09-04 17:13:07', '', '0'), ('8c3145a687274cd38fac84ea2288f10f', '8', '其他', 'dd_dise', '地色', '80', '0', '1', '2016-09-04 17:25:59', '1', '2016-09-04 17:25:59', '', '0'), ('8e04d72f945b4e258748a6dfb7b12862', '4', '云雾状', 'dd_xuexing', '血形', '40', '0', '1', '2016-09-04 17:17:27', '1', '2016-09-04 17:17:27', '', '0'), ('8eb9be94a4de4a198c6a202632f39e18', '5', '昌化彩石、奇石', 'dd_pinzhong', '品种', '50', '0', '1', '2016-09-24 15:53:14', '1', '2016-09-24 15:53:14', '', '0'), ('9', 'blue', '蓝色', 'color', '颜色值', '30', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0'), ('90', 'userselect', '人员选择', 'gen_show_type', '字段生成方案', '70', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1'), ('91', 'officeselect', '部门选择', 'gen_show_type', '字段生成方案', '80', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1'), ('92', 'areaselect', '区域选择', 'gen_show_type', '字段生成方案', '90', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1'), ('93', 'String', 'String', 'gen_java_type', 'Java类型', '10', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1'), ('9343745e55b841ed847f4fba7bb52ee0', '3', '淡红', 'dd_xuese', '血色', '30', '0', '1', '2016-09-04 17:15:11', '1', '2016-09-04 17:15:11', '', '0'), ('94', 'Long', 'Long', 'gen_java_type', 'Java类型', '20', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1'), ('95', 'dao', '仅持久层', 'gen_category', '代码生成分类\0\0\0\0', '40', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1'), ('96', '1', '男', 'sex', '性别', '10', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '0'), ('97', '2', '女', 'sex', '性别', '20', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '0'), ('9774ef7899e447fbbb2b0210a2323c82', '80', '冷水湾', 'dd_kqdy', '矿区地域', '80', '0', '1', '2016-10-06 21:22:35', '1', '2016-10-06 21:22:35', '', '0'), ('98', 'Integer', 'Integer', 'gen_java_type', 'Java类型', '30', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1'), ('9818440417374f49860abc6ab3f01d27', '80', '硬地', 'dd_zhidi2', '质地二', '80', '0', '1', '2016-09-04 16:58:03', '1', '2016-09-04 16:58:21', '', '0'), ('98aab714bc284422ad14307a4b080c7b', '4', '刚', 'dd_zhidi', '质地', '40', '0', '1', '2016-09-04 16:54:44', '1', '2016-09-04 16:54:44', '', '0'), ('99', 'Double', 'Double', 'gen_java_type', 'Java类型', '40', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1'), ('9a4432917cde413d89ef521f86b613d6', '3', '古家具', 'dd_preference', '收藏偏好', '30', '0', '1', '2016-09-22 05:30:52', '1', '2016-09-22 05:30:52', '', '0'), ('9bf15a8bf0eb4a8e8c095c0d1b26dada', '6', '5-6', 'dd_moshidu', '磨氏度', '60', '0', '1', '2016-09-04 17:05:53', '1', '2016-09-24 11:25:29', '', '0'), ('9c3ddec31631448abd4e919849124e17', '1', '玉石', 'dd_preference', '收藏偏好', '10', '0', '1', '2016-09-22 05:30:29', '1', '2016-09-22 05:30:29', '', '0'), ('9ffed451cbe24bd88fc9b546e81f2145', '1', '提供者', 'dd_user_type', '用户类型', '10', '0', '1', '2016-09-13 20:56:55', '1', '2016-09-13 20:56:55', '', '0'), ('9fff790bbe7b438e84ed2da12b56e37a', '2', '接收', 'check', '审核动作', '20', '0', '1', '2016-07-11 20:16:00', '1', '2016-07-11 20:16:49', '', '0'), ('a00bfaa427444983b1d6c9bafaf669bb', '4', '四级', 'dd_level', '级别', '40', '0', '1', '2016-09-24 20:31:32', '1', '2016-09-24 20:31:32', '', '0'), ('a1a2a3b21cbc4bd09be3956e1253c15a', '20', '软地', 'dd_zhidi2', '质地二', '20', '0', '1', '2016-09-04 16:55:40', '1', '2016-09-04 16:55:40', '', '0'), ('a2b4a2979dcc4e5ba9b3b688d380ff7a', '5', '2面', 'dd_mian', '印章含血面', '50', '0', '1', '2016-09-04 17:32:00', '1', '2016-09-04 17:32:00', '', '0'), ('a309516d7d654ce3b2acbdf814e07c06', '3', '雕件', 'dd_zuopinleixing', '作品类型', '30', '0', '1', '2016-09-24 20:21:19', '1', '2016-09-24 20:21:19', '', '0'), ('a8e3b524ff0b4c259842f2165ffd29ce', '2', '&gt;30%', 'dd_xueliang', '血量', '20', '0', '1', '2016-09-04 17:12:38', '1', '2016-09-04 17:12:38', '', '0'), ('aa836aaca1e8414c93179a91b8347ac5', '3', '裂缝', 'dd_lie', '裂', '30', '0', '1', '2016-09-04 17:30:11', '1', '2016-09-04 17:30:11', '', '0'), ('aad55f3973294c798aa28298072c77da', '2', '略净', 'dd_jingdu', '精度', '20', '0', '1', '2016-09-04 17:20:04', '1', '2016-09-04 17:20:04', '', '0'), ('ab22169ab7c2418dab12de5a0b7046dd', '5', '组合套件', 'dd_zuopinleixing', '作品类型', '50', '0', '1', '2016-09-24 20:21:48', '1', '2016-09-24 20:21:48', '', '0'), ('abf513f559334f33be0cb4b85d9ff43f', '2', '微透、细腻、温润', 'dd_ganguan', '感官', '20', '0', '1', '2016-09-04 17:00:53', '1', '2016-09-24 13:57:44', '', '0'), ('ad0ffa57e88d4c679306c4f9f7a8a6ce', '5', '不透、细腻、干', 'dd_ganguan', '感官', '50', '0', '1', '2016-09-24 13:58:49', '1', '2016-09-24 13:58:49', '', '0'), ('b010b1c1f614402486f4e3f13cc48460', '1', '冻', 'dd_zhidi', '质地', '10', '0', '1', '2016-09-04 16:35:41', '1', '2016-09-04 16:35:41', '', '0'), ('ba4a69b250214b30923ca20b12400e16', '0', '无', 'dd_liu', '绺', '50', '0', '1', '2016-09-24 15:49:51', '1', '2016-09-24 15:49:51', '', '0'), ('bb20c58dd8174251ac2cd271ab99a61d', '2', '格', 'dd_liu', '绺', '20', '0', '1', '2016-09-04 17:27:19', '1', '2016-09-04 17:27:19', '', '0'), ('bde6043665ef4571b85d0edab667cd15', '3', '树结构表', 'table_type', '表类型', '40', '0', '1', '2016-01-06 19:48:50', '1', '2016-01-06 19:48:50', '', '0'), ('c48d1da62d4e40e29ab5ee8d34e43b1e', '3', '退还', 'check', '审核动作', '30', '0', '1', '2016-07-11 20:17:10', '1', '2016-07-11 20:17:10', '', '0'), ('c6672ff59b7a46e8b1f0fd1f537986cb', '2', '片状', 'dd_xuexing', '血形', '20', '0', '1', '2016-09-04 17:16:58', '1', '2016-09-04 17:16:58', '', '0'), ('c6c9204ff37c48a8a8c8b1a0d4a2b1d7', '4', '昌化冻石', 'dd_pinzhong', '品种', '40', '0', '1', '2016-09-24 15:53:05', '1', '2016-09-24 15:53:32', '', '0'), ('cc94b0c5df554a46894991210a5fc486', '2', '附表', 'table_type', '表类型', '30', '0', '1', '2016-01-05 21:47:38', '1', '2016-01-05 21:53:44', '', '0'), ('d1655ae5a6a34fadb5feee88de295689', '4', '3面', 'dd_mian', '印章含血面', '40', '0', '1', '2016-09-04 17:31:31', '1', '2016-09-04 17:31:43', '', '0'), ('d17eb3b764ae42a997ce7514844bdf34', '6', '细脉状', 'dd_xuexing', '血形', '60', '0', '1', '2016-09-04 17:17:54', '1', '2016-09-04 17:17:54', '', '0'), ('d66f262f2cd7448bb300197b5d48393e', '100', '蚱蜢脚盘', 'dd_kqdy', '矿区地域', '100', '0', '1', '2016-10-06 21:22:53', '1', '2016-10-06 21:22:53', '', '0'), ('d97e569ff76d4b5a9580bbd7495fb849', '11', '冻软地', 'dd_zhidi2', '质地二', '11', '0', '1', '2016-10-07 09:47:05', '1', '2016-10-07 09:47:05', '', '0'), ('de5dd84524524d8ca2d29cdabd7f45b6', '1', '透、细腻、温润', 'dd_ganguan', '感官', '10', '0', '1', '2016-09-04 17:00:35', '1', '2016-09-24 13:57:29', '', '0'), ('e129a4e2ee7c4559ba721ab5db1d5f82', '1', '绺', 'dd_liu', '绺', '10', '0', '1', '2016-09-04 17:27:08', '1', '2016-09-04 17:27:08', '', '0'), ('e15141405b534ce39e58c13fbadf56d3', '1', '递交', 'check', '审核动作', '10', '0', '1', '2016-07-11 20:15:30', '1', '2016-07-11 20:16:37', '', '0'), ('e17eea632d7b4ccf9cc56c21a77c1485', '5', '&gt;0%', 'dd_xueliang', '血量', '50', '0', '1', '2016-09-04 17:13:24', '1', '2016-09-04 17:13:24', '', '0'), ('e2ccae02e319499aab2daa223092124e', '4', '稀', 'dd_nongyandu', '浓艳度', '40', '0', '1', '2016-09-04 17:19:25', '1', '2016-09-04 17:19:25', '', '0'), ('e2fb6aaac72b442d923c30a87ebe5c32', '3', '昌化鸡血石', 'dd_pinzhong', '品种', '30', '0', '1', '2016-09-24 15:52:54', '1', '2016-09-24 15:53:40', '', '0'), ('e5da08652d4646b5b788ba14c142da01', '8', '其他', 'dd_xuexing', '血形', '80', '0', '1', '2016-09-04 17:18:23', '1', '2016-09-04 17:18:23', '', '0'), ('e6fcd84000a4449cb6d8a1a7af68d7ba', '3', '已通过', 'dd_status', '作品审核', '30', '0', '1', '2016-09-15 13:33:46', '1', '2016-09-15 13:33:46', '', '0'), ('eb8003913351432e8045e6727224488a', '20', '核桃岭', 'dd_kqdy', '矿区地域', '20', '0', '1', '2016-10-06 21:21:49', '1', '2016-10-06 21:21:49', '', '0'), ('f03a34ab39e04e49b7b2e0785d1ee8a0', '40', '冻软硬地', 'dd_zhidi2', '质地二', '40', '0', '1', '2016-09-04 16:56:08', '1', '2016-09-04 16:56:27', '', '0'), ('f55203290d7f40929c81e800fcded6f8', '3', '2-6', 'dd_moshidu', '磨氏度', '30', '0', '1', '2016-09-04 17:05:06', '1', '2016-09-24 11:24:49', '', '0'), ('f94fb24757c04405b7b5c6b45bdc2a56', '90', '仰天荡', 'dd_kqdy', '矿区地域', '90', '0', '1', '2016-10-06 21:22:43', '1', '2016-10-06 21:22:43', '', '0'), ('fa30f4449d9444a2b5c00749d7e99952', '30', '冻软刚地', 'dd_zhidi2', '质地二', '30', '0', '1', '2016-09-04 16:55:52', '1', '2016-09-04 16:55:52', '', '0'), ('fd6347bb1e65460a8ee939b8907f966c', '1', '团块状', 'dd_xuexing', '血形', '10', '0', '1', '2016-09-04 17:16:45', '1', '2016-09-04 17:16:45', '', '0'), ('fef8cca584114142b11f4a9d22dcf86d', '2', '红', 'dd_xuese', '血色', '20', '0', '1', '2016-09-04 17:15:02', '1', '2016-09-04 17:15:02', '', '0');
COMMIT;

-- ----------------------------
--  Table structure for `sys_menu`
-- ----------------------------
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
) ENGINE=InnoDB AUTO_INCREMENT=95 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `sys_menu`
-- ----------------------------
BEGIN;
INSERT INTO `sys_menu` VALUES ('1', '系统管理', '#', '0', '1', '', '1', '0', '系统管理11耳朵\n', '1'), ('2', '权限管理', 'right', '1', '2', '', '2', '1', '权限管理12', '1'), ('3', '用户管理', 'user', '1', '3', '', '2', '1', '用户管理', '1'), ('4', '角色管理', 'role', '1', '4', '', '2', '1', '角色管理2', '1'), ('93', '系统工具', '#', '0', '10', null, '1', '1', '', '1'), ('94', '123123', '#', '0', '123', null, '1', '1', '123', '1');
COMMIT;

-- ----------------------------
--  Table structure for `sys_role`
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(64) NOT NULL COMMENT '角色名称',
  `removable` int(3) NOT NULL DEFAULT '0' COMMENT '可被删除 0=不行 1=可以',
  `allocatable` int(3) DEFAULT '1' COMMENT '可被分配 0=不行 1=可以',
  `description` varchar(255) DEFAULT NULL,
  `status` int(3) NOT NULL DEFAULT '1',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `sys_role`
-- ----------------------------
BEGIN;
INSERT INTO `sys_role` VALUES ('1', '系统管理员', '0', '1', '系统管理员', '1'), ('2', '服务器管理员', '1', '1', '', '1'), ('3', 'test', '1', '1', '123', '-1');
COMMIT;

-- ----------------------------
--  Table structure for `sys_role_resource`
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_resource`;
CREATE TABLE `sys_role_resource` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL DEFAULT '0',
  `resource_id` int(11) NOT NULL DEFAULT '0',
  `resource_type` int(3) NOT NULL DEFAULT '0' COMMENT '资源类型：1-分类； 2-菜单；3-按钮',
  PRIMARY KEY (`id`),
  KEY `role_id_idx` (`role_id`),
  KEY `resource_id_idx` (`resource_id`)
) ENGINE=InnoDB AUTO_INCREMENT=359 DEFAULT CHARSET=utf8 COMMENT='权限和资源（菜单+按钮）';

-- ----------------------------
--  Records of `sys_role_resource`
-- ----------------------------
BEGIN;
INSERT INTO `sys_role_resource` VALUES ('354', '1', '1', '1'), ('355', '1', '2', '2'), ('356', '1', '3', '2'), ('357', '1', '4', '2'), ('358', '1', '93', '1');
COMMIT;

-- ----------------------------
--  Table structure for `sys_score_calc`
-- ----------------------------
DROP TABLE IF EXISTS `sys_score_calc`;
CREATE TABLE `sys_score_calc` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT NULL,
  `value` decimal(11,2) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL  COMMENT '创建时间',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `create_by` int(11) DEFAULT NULL COMMENT '创建者',
  `update_by` int(11) DEFAULT NULL COMMENT '更新者',
  `del_flag` mediumint(8) DEFAULT NULL COMMENT '逻辑删除标记（0：显示；1：隐藏）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '积分计算方式';

-- ----------------------------
--  Table structure for `sys_user`
-- ----------------------------
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
  `identification` varchar(64) DEFAULT NULL COMMENT '身份证',
  `perfer` varchar(64) DEFAULT NULL COMMENT '偏好',
  `public` varchar(64) DEFAULT NULL COMMENT '是否公开',
  `score` varchar(64) DEFAULT NULL,
  `follow_count` int(11) DEFAULT NULL COMMENT '关注数量，冗余字段',
  `type` varchar(64) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL  COMMENT '创建时间',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `create_by` int(11) DEFAULT NULL COMMENT '创建者',
  `update_by` int(11) DEFAULT NULL COMMENT '更新者',
  `del_flag` mediumint(8) DEFAULT NULL COMMENT '逻辑删除标记（0：显示；1：隐藏）',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `sys_user`
-- ----------------------------
BEGIN;
INSERT INTO `sys_user` VALUES ('1', 'admin', 'dd94709528bb1c83d08f3088d4043f4742891f4f', 'admin', '2016-11-20 19:53:26', '0:0:0:0:0:0:0:1', '1', '123', '123', '123', '1', null, null, null, null, null, null, null, null, null, null, null), ('84', 'sunhan', '71431ddb024987660b7faedf7880fbf35eb9f1dc', '孙汉', null, null, '1', '1', '1', '1', '1', null, null, null, null, null, null, null, null, null, null, null), ('85', 'admin123', '91868ceb2b0ef1ddaed59140471087722d60c872', '123', null, null, '1', '123', '123123', '123', '1', null, null, null, null, null, null, null, null, null, null, null), ('86', '123123', '5a8f70e725742ee64204353e700778b29f81b988', '123', null, null, '-1', '123', '213', '123', '1', null, null, null, null, null, null, null, null, null, null, null), ('87', 'test', '07df646fbca858e0b4284e4547595ae3b8cb0605', '123', null, null, '-1', '1231', '123', '123', '1', null, null, null, null, null, null, null, null, null, null, null), ('88', '123', '88ea39439e74fa27c09a4fc0bc8ebe6d00978392', '123', null, null, '-1', '123', '123', '123', '1', null, null, null, null, null, null, null, null, null, null, null), ('89', '11test', '915cf224878eb7fae09529feb502ca429093e85c', '1123', null, null, '-1', '123', '123', '123', '1', null, null, null, null, null, null, null, null, null, null, null), ('90', '测试数据', '89ebd531abb18239d93e461c2e7b2932bc392906', '123123', null, null, '1', '123', '123123', '1231', '1', null, null, null, null, null, null, null, null, null, null, null);
COMMIT;

-- ----------------------------
--  Table structure for `sys_user_role`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `role_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8 COMMENT='用户和角色';

-- ----------------------------
--  Records of `sys_user_role`
-- ----------------------------
BEGIN;
INSERT INTO `sys_user_role` VALUES ('1', '1', '1'), ('74', '89', '1');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;

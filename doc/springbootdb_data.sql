/*
 Navicat Premium Data Transfer

 Source Server         : Mysql
 Source Server Type    : MySQL
 Source Server Version : 50722
 Source Host           : localhost:3306
 Source Schema         : springbootdb

 Target Server Type    : MySQL
 Target Server Version : 50722
 File Encoding         : 65001

 Date: 05/03/2020 15:48:42
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for log_error
-- ----------------------------
DROP TABLE IF EXISTS `log_error`;
CREATE TABLE `log_error`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `request_uri` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'uri',
  `method` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '请求方式',
  `user_agent` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '代理',
  `ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ip',
  `ip_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ip位置',
  `message` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作信息',
  `gmt_create` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for log_login
-- ----------------------------
DROP TABLE IF EXISTS `log_login`;
CREATE TABLE `log_login`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `account` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '登录账户',
  `ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '登录ip',
  `browser` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '浏览器',
  `os` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作系统',
  `message` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '登录信息',
  `gmt_create` datetime(0) NULL DEFAULT NULL COMMENT '创建时间/登录时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint(19) NOT NULL AUTO_INCREMENT COMMENT '主键,id',
  `dept_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '部门名称',
  `parent_id` bigint(19) NULL DEFAULT NULL COMMENT '父级id',
  `parent_ids` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '完整路径',
  `available` tinyint(1) NULL DEFAULT 0 COMMENT '可用,0:不可用默认,1:可用',
  `gmt_create` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (1, '天上人间总部', 0, '0', 1, '2019-07-12 13:58:25', NULL);
INSERT INTO `sys_dept` VALUES (2, '广东分司', 1, '0/1/', 1, '2019-07-12 13:58:28', NULL);
INSERT INTO `sys_dept` VALUES (3, '上海分司', 1, '0/1/', 1, '2019-07-12 13:58:43', NULL);
INSERT INTO `sys_dept` VALUES (4, '江西分司', 1, '0/1/', 1, '2019-07-12 13:58:25', NULL);
INSERT INTO `sys_dept` VALUES (5, '湖南分司', 1, '0/1/', 1, '2019-07-12 13:58:28', NULL);
INSERT INTO `sys_dept` VALUES (6, '研发一部', 2, '0/1/2/', 1, '2019-07-12 13:58:56', NULL);
INSERT INTO `sys_dept` VALUES (7, '公关部门', 2, '0/1/2/', 1, '2019-07-12 13:58:25', NULL);
INSERT INTO `sys_dept` VALUES (8, '人力资源部门', 2, '0/1/5/', 1, '2019-07-12 13:58:28', NULL);
INSERT INTO `sys_dept` VALUES (9, '研发二部', 3, '0/1/3/', 1, '2019-07-12 13:58:25', NULL);
INSERT INTO `sys_dept` VALUES (10, '财务部门', 4, '0/1/4/', 1, '2019-07-12 13:58:28', NULL);

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `menu_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '资源名称',
  `icon` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图标',
  `type` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类型,菜单?按钮',
  `url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '资源url',
  `parent_id` bigint(20) NULL DEFAULT NULL COMMENT '父节点id',
  `parent_ids` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '完整节点id',
  `permission` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '资源权限',
  `available` tinyint(1) NULL DEFAULT 0 COMMENT '是否可用,0:不可,默认;1:可用',
  `gmt_create` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 504 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 'zmdi zmdi-settings', 'menu', '', 0, '0/', NULL, 1, '2019-07-11 22:17:46', '2019-09-11 23:53:26');
INSERT INTO `sys_menu` VALUES (2, '系统监控', 'zmdi zmdi-shield-security', 'menu', '', 0, '0/', NULL, 1, '2019-07-27 17:37:24', NULL);
INSERT INTO `sys_menu` VALUES (3, '网络资源', 'zmdi zmdi-globe-alt', 'menu', '', 0, '0/', NULL, 1, '2019-07-27 17:39:10', NULL);
INSERT INTO `sys_menu` VALUES (4, '任务调度', 'zmdi zmdi-alarm', 'menu', '', 0, '0/', NULL, 1, '2019-09-06 00:10:29', NULL);
INSERT INTO `sys_menu` VALUES (11, '用户管理', NULL, 'menu', '/system/user', 1, '0/1/', 'system:user:view', 1, '2019-07-11 22:38:48', NULL);
INSERT INTO `sys_menu` VALUES (12, '角色管理', NULL, 'menu', '/system/role', 1, '0/1/', 'system:role:view', 1, '2019-07-11 22:39:47', NULL);
INSERT INTO `sys_menu` VALUES (13, '部门管理', NULL, 'menu', '/system/dept', 1, '0/1/', 'system:dept:view', 1, '2019-07-11 22:22:14', NULL);
INSERT INTO `sys_menu` VALUES (14, '菜单管理', NULL, 'menu', '/system/menu', 1, '0/1/', 'system:menu:view', 1, '2019-07-11 22:39:47', NULL);
INSERT INTO `sys_menu` VALUES (15, '字典管理', NULL, 'menu', '#', 1, '0/1/', 'system:session:view', 1, '2019-07-12 14:37:49', NULL);
INSERT INTO `sys_menu` VALUES (16, '日志管理', NULL, 'menu', '#', 1, '0/1/', 'log:view', 1, '2019-07-11 22:39:47', NULL);
INSERT INTO `sys_menu` VALUES (101, '部门查询', NULL, 'button', '#', 13, '0/1/10/', 'system:dept:list', 1, '2019-07-11 22:48:37', NULL);
INSERT INTO `sys_menu` VALUES (102, '部门新增', NULL, 'button', '#', 13, '0/1/10/', 'system:dept:create', 1, '2019-07-11 22:48:37', NULL);
INSERT INTO `sys_menu` VALUES (103, '部门删除', NULL, 'button', '#', 13, '0/1/10/', 'system:dept:remove', 1, '2019-07-11 22:48:37', NULL);
INSERT INTO `sys_menu` VALUES (104, '部门修改', NULL, 'button', '#', 13, '0/1/10/', 'system:dept:edit', 1, '2019-07-11 22:48:37', NULL);
INSERT INTO `sys_menu` VALUES (111, '用户查询', NULL, 'button', '#', 11, '0/1/11/', 'system:user:list', 1, '2019-07-11 22:48:37', NULL);
INSERT INTO `sys_menu` VALUES (112, '用户新增', NULL, 'button', '#', 11, '0/1/11/', 'system:user:create', 1, '2019-07-11 22:48:37', NULL);
INSERT INTO `sys_menu` VALUES (113, '用户删除', NULL, 'button', '#', 11, '0/1/11/', 'system:user:remove', 1, '2019-07-11 22:48:37', NULL);
INSERT INTO `sys_menu` VALUES (114, '用户修改', NULL, 'button', '#', 11, '0/1/11/', 'system:user:edit', 1, '2019-07-11 22:48:37', NULL);
INSERT INTO `sys_menu` VALUES (121, '角色查询', NULL, 'button', '#', 12, '0/1/12/', 'system:user:list', 1, '2019-07-11 22:48:37', NULL);
INSERT INTO `sys_menu` VALUES (122, '角色新增', NULL, 'button', '#', 12, '0/1/12/', 'system:role:create', 1, '2019-07-11 22:48:38', NULL);
INSERT INTO `sys_menu` VALUES (123, '角色删除', NULL, 'button', '#', 12, '0/1/12/', 'system:role:remove', 1, '2019-07-11 22:48:39', NULL);
INSERT INTO `sys_menu` VALUES (124, '角色修改', NULL, 'button', '#', 12, '0/1/12/', 'system:role:edit', 1, '2019-07-11 22:48:48', NULL);
INSERT INTO `sys_menu` VALUES (131, '菜单查询', NULL, 'button', '#', 14, '0/1/13/', 'system:menu:list', 1, '2019-07-11 22:49:38', NULL);
INSERT INTO `sys_menu` VALUES (132, '菜单新增', NULL, 'button', '#', 14, '0/1/13/', 'system:menu:create', 1, '2019-07-11 22:49:38', NULL);
INSERT INTO `sys_menu` VALUES (133, '菜单删除', NULL, 'button', '#', 14, '0/1/13/', 'system:menu:remove', 1, '2019-07-11 22:49:39', NULL);
INSERT INTO `sys_menu` VALUES (134, '菜单修改', NULL, 'button', '#', 14, '0/1/13/', 'system:menu:edit', 1, '2019-07-11 22:49:48', NULL);
INSERT INTO `sys_menu` VALUES (141, '日志查询', NULL, 'button', '#', 16, '0/1/14/', 'log:login:list', 1, '2019-07-11 22:49:38', NULL);
INSERT INTO `sys_menu` VALUES (142, '日志下载', NULL, 'button', '#', 16, '0/1/14/', 'log:login:download', 1, '2019-07-11 22:49:38', NULL);
INSERT INTO `sys_menu` VALUES (143, '日志删除', NULL, 'button', '#', 16, '0/1/14/', 'log:login:remove', 1, '2019-07-11 22:49:39', NULL);
INSERT INTO `sys_menu` VALUES (201, '在线用户', NULL, 'menu', 'session', 2, '0/2/', 'session:list', 1, '2019-09-05 22:41:19', NULL);
INSERT INTO `sys_menu` VALUES (202, '系统日志', NULL, 'menu', NULL, 2, '0/2/', NULL, 1, '2020-02-15 20:46:59', NULL);
INSERT INTO `sys_menu` VALUES (203, 'Redis监控', NULL, 'menu', 'monitor/redis', 2, '0/2/', 'monitor:redis:view1', 1, '2020-02-15 20:46:57', '2020-03-04 15:49:43');
INSERT INTO `sys_menu` VALUES (204, 'Redis终端', NULL, 'menu', NULL, 2, '0/2/', NULL, 1, '2020-02-15 20:47:26', NULL);
INSERT INTO `sys_menu` VALUES (301, '天气查询', NULL, 'menu', 'weather', 3, '0/3/', 'weather:list', 1, '2020-02-14 20:31:30', NULL);
INSERT INTO `sys_menu` VALUES (302, '每日一文', NULL, 'menu', 'article', 3, '0/3/', NULL, 1, '2020-02-14 20:32:14', NULL);
INSERT INTO `sys_menu` VALUES (303, '影视资讯', NULL, 'menu', NULL, 3, '0/3/', NULL, 1, '2020-02-14 20:32:49', NULL);
INSERT INTO `sys_menu` VALUES (304, 'one一个', NULL, 'menu', NULL, 3, '0/3/', NULL, 1, '2020-02-14 20:33:20', NULL);
INSERT INTO `sys_menu` VALUES (401, '正在热映', NULL, 'menu', 'movie/hot', 303, '0/3/303/', NULL, 1, '2020-02-22 22:34:50', NULL);
INSERT INTO `sys_menu` VALUES (402, '即将上映', NULL, 'menu', 'movie/coming', 303, '0/3/303/', NULL, 1, '2020-02-22 22:37:17', NULL);
INSERT INTO `sys_menu` VALUES (501, '剔除用户', NULL, 'button', NULL, 201, '0/2/201/', 'user:kickout', 1, '2020-03-04 18:23:55', NULL);
INSERT INTO `sys_menu` VALUES (502, '定时任务', NULL, 'menu', 'job', 4, '0/4/', NULL, 1, '2020-03-04 20:14:28', NULL);
INSERT INTO `sys_menu` VALUES (503, '调度日志', NULL, 'menu', 'jobLog', 4, '0/4/', NULL, 1, '2020-03-04 20:14:54', NULL);

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `role_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色字符',
  `role_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色名称',
  `available` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否可用,0:不可,默认;1:可用',
  `gmt_create` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, 'admin', '管理员', 1, '2019-07-12 10:42:47', NULL);
INSERT INTO `sys_role` VALUES (2, 'manager', '经理', 1, '2019-07-12 10:43:09', NULL);
INSERT INTO `sys_role` VALUES (3, 'tester', '测试人员', 1, '2019-07-12 14:25:43', NULL);
INSERT INTO `sys_role` VALUES (4, 'employer', '普通员工', 1, '2019-07-12 14:26:24', NULL);
INSERT INTO `sys_role` VALUES (5, 'develop', '研发人员', 1, '2019-09-09 17:20:24', NULL);
INSERT INTO `sys_role` VALUES (6, 'accounter', '财务', 1, '2019-09-09 17:20:28', NULL);
INSERT INTO `sys_role` VALUES (7, 'policy', '行政人员', 1, NULL, NULL);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `role_id` bigint(20) NULL DEFAULT NULL COMMENT '角色id',
  `menu_id` bigint(20) NULL DEFAULT NULL COMMENT '资源id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 71 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (1, 1, 10);
INSERT INTO `sys_role_menu` VALUES (2, 1, 11);
INSERT INTO `sys_role_menu` VALUES (3, 1, 12);
INSERT INTO `sys_role_menu` VALUES (4, 1, 13);
INSERT INTO `sys_role_menu` VALUES (5, 1, 14);
INSERT INTO `sys_role_menu` VALUES (6, 1, 15);
INSERT INTO `sys_role_menu` VALUES (7, 2, 101);
INSERT INTO `sys_role_menu` VALUES (9, 3, 101);
INSERT INTO `sys_role_menu` VALUES (10, 3, 111);
INSERT INTO `sys_role_menu` VALUES (11, 2, 121);
INSERT INTO `sys_role_menu` VALUES (12, 3, 121);
INSERT INTO `sys_role_menu` VALUES (13, 1, 1);
INSERT INTO `sys_role_menu` VALUES (14, 2, 1);
INSERT INTO `sys_role_menu` VALUES (15, 3, 1);
INSERT INTO `sys_role_menu` VALUES (16, 1, 2);
INSERT INTO `sys_role_menu` VALUES (17, 1, 3);
INSERT INTO `sys_role_menu` VALUES (31, 2, 10);
INSERT INTO `sys_role_menu` VALUES (32, 2, 11);
INSERT INTO `sys_role_menu` VALUES (33, 1, 101);
INSERT INTO `sys_role_menu` VALUES (34, 1, 102);
INSERT INTO `sys_role_menu` VALUES (35, 1, 103);
INSERT INTO `sys_role_menu` VALUES (36, 2, 102);
INSERT INTO `sys_role_menu` VALUES (37, 3, 102);
INSERT INTO `sys_role_menu` VALUES (38, 1, 4);
INSERT INTO `sys_role_menu` VALUES (39, 1, 111);
INSERT INTO `sys_role_menu` VALUES (40, 1, 112);
INSERT INTO `sys_role_menu` VALUES (41, 1, 113);
INSERT INTO `sys_role_menu` VALUES (42, 1, 114);
INSERT INTO `sys_role_menu` VALUES (43, 1, 121);
INSERT INTO `sys_role_menu` VALUES (44, 1, 122);
INSERT INTO `sys_role_menu` VALUES (45, 1, 123);
INSERT INTO `sys_role_menu` VALUES (46, 1, 124);
INSERT INTO `sys_role_menu` VALUES (47, 4, 111);
INSERT INTO `sys_role_menu` VALUES (48, 4, 121);
INSERT INTO `sys_role_menu` VALUES (49, 4, 131);
INSERT INTO `sys_role_menu` VALUES (50, 5, 121);
INSERT INTO `sys_role_menu` VALUES (51, 5, 131);
INSERT INTO `sys_role_menu` VALUES (52, 6, 121);
INSERT INTO `sys_role_menu` VALUES (53, 6, 131);
INSERT INTO `sys_role_menu` VALUES (54, 7, 121);
INSERT INTO `sys_role_menu` VALUES (55, 7, 131);
INSERT INTO `sys_role_menu` VALUES (57, 1, 301);
INSERT INTO `sys_role_menu` VALUES (58, 1, 302);
INSERT INTO `sys_role_menu` VALUES (59, 1, 303);
INSERT INTO `sys_role_menu` VALUES (60, 1, 304);
INSERT INTO `sys_role_menu` VALUES (61, 1, 202);
INSERT INTO `sys_role_menu` VALUES (62, 1, 203);
INSERT INTO `sys_role_menu` VALUES (63, 1, 204);
INSERT INTO `sys_role_menu` VALUES (64, 1, 401);
INSERT INTO `sys_role_menu` VALUES (65, 1, 402);
INSERT INTO `sys_role_menu` VALUES (66, 1, 201);
INSERT INTO `sys_role_menu` VALUES (68, 1, 4);
INSERT INTO `sys_role_menu` VALUES (69, 1, 502);
INSERT INTO `sys_role_menu` VALUES (70, 1, 503);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `dept_id` bigint(20) NULL DEFAULT NULL COMMENT '部门id',
  `avatar_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '昵称',
  `avatar_url` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像url',
  `user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '帐号',
  `user_real` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '真实姓名',
  `user_password` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `salt` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '盐',
  `token` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'cookie使用',
  `gender` int(1) NULL DEFAULT 1 COMMENT '性别,1:男;0:女',
  `birth` date NULL DEFAULT NULL COMMENT '出生年月,yyyy-MM-dd',
  `mail` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `phone` varchar(13) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电话',
  `locked` tinyint(1) NOT NULL DEFAULT 0 COMMENT '账户锁定,1:锁;0:不锁,默认',
  `login_ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '最后登录ip',
  `login_date` timestamp(0) NULL DEFAULT NULL COMMENT '最后登录时间',
  `gmt_create` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 4, '牛魔王', '20180414165754.jpg', 'admin', '张三', '20ce2f91c109ca63d0f8636e111f9e79', 'eeb5e8e9a8dd519be0331ead9e91fc57', NULL, 0, '1989-01-01', 'perfectxxl@gmail.com', '17350852927', 0, '127.0.0.1', '2020-03-04 21:14:56', '2019-07-12 13:59:42', NULL);
INSERT INTO `sys_user` VALUES (2, 3, '香蕉与芭拉', 'default.jpg', 'G0009263', '欧阳峰', '9c0a58df3934fcad3606f79588c4e3d6', 'fe5c15aa44760bf8dcf9195d7019d490', NULL, 1, '1995-05-15', 'perfectxlx@gmail.com', '173522852927', 0, '127.0.0.1', '2020-03-04 20:46:06', '2019-07-12 14:30:45', '2019-07-17 14:17:00');
INSERT INTO `sys_user` VALUES (3, 3, '铁扇公主', 'default.jpg', 'G0009264', '聂小妾', 'f7a186fb591c08fd18f195d68918cbdf', 'dc626f3f41d0140b21cd9be2038dfc6a', NULL, 0, '1999-10-02', 'perfectxlx@gmail.com', '173522852927', 0, '127.0.0.1', '2020-03-04 20:47:37', '2019-09-06 17:14:42', '2019-07-17 14:44:05');
INSERT INTO `sys_user` VALUES (5, 2, '曹操', 'default.jpg', 'G0009266', '蔡徐坤', '46108ce905b1e91e65f77975001d1cee', '3833d4be614e13c24c27de07c7e04e4d', NULL, 0, '1995-05-15', 'perfectxlx@gmail.com', '173522852989', 1, '127.0.0.1', '2019-09-06 23:26:36', '2019-09-06 23:26:39', NULL);
INSERT INTO `sys_user` VALUES (6, 4, '关羽', 'default.jpg', 'G0009267', '阿克苏', '46108ce905b1e91e65f77975001d1cee', '3833d4be614e13c24c27de07c7e04e4d', NULL, 1, '1990-07-01', '12@qq.com', '13576637348', 1, '127.0.0.1', '2019-09-06 23:28:20', '2019-09-06 23:28:24', NULL);
INSERT INTO `sys_user` VALUES (7, 7, '马杀鸡', 'default.jpg', 'G0009268', '孙晓宇', '46108ce905b1e91e65f77975001d1cee', '3833d4be614e13c24c27de07c7e04e4d', NULL, 1, '1990-07-01', 'qa@qq.com', '13576637348', 1, '127.0.0.1', '2019-09-06 23:28:20', '2019-09-06 23:28:24', NULL);
INSERT INTO `sys_user` VALUES (8, 10, '沙湖小学生', 'default.jpg', 'G0009269', '雄安红', '123456', '1', NULL, 0, '2019-09-06', 'ss@qq.com', '13576637348', 0, '127.0.0.1', '2019-09-06 23:40:33', '2019-09-06 23:40:35', NULL);
INSERT INTO `sys_user` VALUES (9, 7, '马杀鸡', 'default.jpg', 'G0009270', '孙晓', '1', '1', NULL, 0, '1990-07-01', 'qa@qq.com', '13576637348', 1, '127.0.0.1', '2019-09-06 23:28:20', '2019-09-06 23:28:24', NULL);
INSERT INTO `sys_user` VALUES (10, 8, '分舞九天', 'default.jpg', 'G0009271', '广西仔', '1', '1', NULL, 0, '1990-07-01', 'qqq@qq.com', '13576637348', 0, '127.0.0.1', '2019-09-06 23:28:20', '2019-09-06 23:28:24', NULL);
INSERT INTO `sys_user` VALUES (11, 9, '啪啪啪', 'default.jpg', 'G0009272', '孙宇', '1', '1', NULL, 1, '1990-07-01', '1qs2@qq.com', '13576637348', 1, '127.0.0.1', '2019-09-06 23:28:20', '2019-09-06 23:28:24', NULL);
INSERT INTO `sys_user` VALUES (12, 2, '马彪答滴滴', 'default.jpg', 'G0009273', '吴语宇', '1', '1', NULL, 1, '1990-07-01', 'xiel@126.com', '13576637348', 1, '127.0.0.1', '2019-09-06 23:28:20', '2019-09-06 23:28:24', NULL);
INSERT INTO `sys_user` VALUES (13, 5, '东北老铁', 'default.jpg', 'G0009274', '张买安', '1', '1', NULL, 1, '1990-07-01', 'xiel@126.com', '13576637348', 1, '127.0.0.1', '2019-09-06 23:28:20', '2019-09-06 23:28:24', NULL);
INSERT INTO `sys_user` VALUES (14, 7, '广西老表', 'default.jpg', 'G0009275', '张倩', '1', '1', NULL, 0, '1990-07-01', '1q122@qq.com', '13576637348', 0, '127.0.0.1', '2019-09-06 23:28:20', '2019-09-06 23:28:24', NULL);
INSERT INTO `sys_user` VALUES (15, 6, '大表哥', 'default.jpg', 'G0009276', '张表', '1', '1', NULL, 1, '1990-07-01', '12ewew@qq.com', '13576637348', 1, '127.0.0.1', '2019-09-06 23:28:20', '2019-09-06 23:28:24', NULL);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(20) NULL DEFAULT NULL COMMENT '用户id',
  `role_id` bigint(20) NULL DEFAULT NULL COMMENT '角色id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 48 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1, 1);
INSERT INTO `sys_user_role` VALUES (2, 2, 2);
INSERT INTO `sys_user_role` VALUES (5, 1, 2);
INSERT INTO `sys_user_role` VALUES (35, 3, 4);
INSERT INTO `sys_user_role` VALUES (37, 5, 4);
INSERT INTO `sys_user_role` VALUES (38, 6, 4);
INSERT INTO `sys_user_role` VALUES (39, 7, 4);
INSERT INTO `sys_user_role` VALUES (41, 9, 4);
INSERT INTO `sys_user_role` VALUES (42, 10, 4);
INSERT INTO `sys_user_role` VALUES (43, 11, 4);
INSERT INTO `sys_user_role` VALUES (44, 12, 4);
INSERT INTO `sys_user_role` VALUES (45, 13, 4);
INSERT INTO `sys_user_role` VALUES (46, 15, 4);
INSERT INTO `sys_user_role` VALUES (47, 8, 4);

SET FOREIGN_KEY_CHECKS = 1;

/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80032 (8.0.32)
 Source Host           : 127.0.0.1:3306
 Source Schema         : video-RBP-make

 Target Server Type    : MySQL
 Target Server Version : 80032 (8.0.32)
 File Encoding         : 65001

 Date: 12/09/2024 16:37:59
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `wx_unionid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uni_name`(`name` ASC) USING BTREE,
  UNIQUE INDEX `uni_mobile`(`mobile` ASC) USING BTREE,
  UNIQUE INDEX `uni_email`(`email` ASC) USING BTREE,
  UNIQUE INDEX `uni_token`(`token` ASC) USING BTREE,
  UNIQUE INDEX `uni_unionid`(`wx_unionid` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES (1, 'hnsjb', '123', 'hnsjb', '82995820@qq.com', '38c95be2bbf46de9f5841bbcbecb8558', '4aae2494dc27dc534d1f8f7e20d41712', NULL, '2022-04-12 08:05:18', '2022-07-21 02:23:42');
INSERT INTO `admin` VALUES (2, '联通账号', '12', 'CU', 'lluck42@163.com', '81dc9bdb52d04dc20036dbd8313ed055', '90403ff17db90e35a4f7812115fcad41', 'oZLQPsyE5b7KBH-GLF6wXZw5Zegc', '2022-04-12 08:05:18', '2022-06-16 03:48:06');
INSERT INTO `admin` VALUES (8, '联通账号2', '1543', 'CU', 'lluck42@164.com', '81dc9bdb52d04dc20036dbd8313ed055', '7a0d47499bf0ea04732fb5f445d33590', 'oZLQPs2TRhFEo2MPmfV81YypQCCI', '2022-04-12 08:05:18', '2023-01-10 16:26:04');
INSERT INTO `admin` VALUES (11, 'name', '18625516657', 'CU', 'hnsjb123@chinaunicom.cn', 'e10adc3949ba59abbe56e057f20f883e', '2a724e4f1cf1e40bc9f8d33a0d0a0ae2', 'oZLQPs1IvkB_GoiSxDXcgw7meC_8', '2022-04-14 03:17:50', '2022-05-23 08:18:01');
INSERT INTO `admin` VALUES (12, '张士健', '15617517075', 'CU', '123@chinaunicom.cn', '202cb962ac59075b964b07152d234b70', '888d1096e670c43d970a68b9080c79f3', NULL, '2022-04-14 07:37:38', '2022-05-26 01:50:16');
INSERT INTO `admin` VALUES (13, '联通账户004', '18625516697', 'CU', 'aaa004@chinaunicom.cn', '202cb962ac59075b964b07152d234b70', 'c3872bbaeeda33ba826f65ea9fd5a46f', NULL, '2022-04-14 09:02:10', '2022-04-14 09:02:10');
INSERT INTO `admin` VALUES (14, '152698157', '13298409986', 'CU', '145625@chinaunicom.cn', '2be9bd7a3434f7038ca27d1918de58bd', 'db408bfa7f01eae6e456a6a9055e9617', NULL, '2022-04-15 01:16:13', '2022-04-19 01:07:45');
INSERT INTO `admin` VALUES (15, '15637719019', '15637719019', 'CU', 'luowl1@chinaunicom.cn', 'e10adc3949ba59abbe56e057f20f883e', 'c9ed53d6eee6ee125731b155ab97e065', NULL, '2022-10-08 03:39:42', '2022-10-08 03:39:42');
INSERT INTO `admin` VALUES (16, '1245678', '15613118804', 'CU', 'www175989680@chinaunicom.cn', 'a3f0bec59cebeb60553ec80bbfd5dfdf', 'd1f7b74196b5a7d9926edeb41df1ad1d', NULL, '2023-06-05 12:24:53', '2023-06-05 12:24:53');
INSERT INTO `admin` VALUES (17, '123456789', '15613118801', 'CU', 'www132456789@chinaunicom.cn', 'e10adc3949ba59abbe56e057f20f883e', '8b7bc05a4c8aaa2c2d109d6c862c588b', NULL, '2023-06-05 13:29:10', '2023-06-05 13:45:20');
INSERT INTO `admin` VALUES (18, '1234567890', '15613110987', 'CU', 'www1324156789@chinaunicom.cn', 'e10adc3949ba59abbe56e057f20f883e', '20ca80da3ef3a2aa41d72922e7c7eef1', NULL, '2023-06-05 13:48:04', '2023-06-05 13:48:04');

-- ----------------------------
-- Table structure for admin_permission
-- ----------------------------
DROP TABLE IF EXISTS `admin_permission`;
CREATE TABLE `admin_permission`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `admin_role` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `request_uri` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 41 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_permission
-- ----------------------------
INSERT INTO `admin_permission` VALUES (1, 'hnsjb', '/admin/info');
INSERT INTO `admin_permission` VALUES (2, 'hnsjb', '/upload/add');
INSERT INTO `admin_permission` VALUES (4, 'hnsjb', '/form/info');
INSERT INTO `admin_permission` VALUES (6, 'hnsjb', '/form/list');
INSERT INTO `admin_permission` VALUES (7, 'hnsjb', '/form/confirm');
INSERT INTO `admin_permission` VALUES (8, 'hnsjb', '/form/submit');
INSERT INTO `admin_permission` VALUES (10, 'hnsjb', '/form/reject');
INSERT INTO `admin_permission` VALUES (12, 'hnsjb', '/admin/logout');
INSERT INTO `admin_permission` VALUES (13, 'hnsjb', '/upload/list');
INSERT INTO `admin_permission` VALUES (14, 'hnsjb', '/dialog/add');
INSERT INTO `admin_permission` VALUES (15, 'hnsjb', '/dialog/oneFormList');
INSERT INTO `admin_permission` VALUES (16, 'hnsjb', '/form/setFiles');
INSERT INTO `admin_permission` VALUES (17, 'hnsjb', '/admin/changePassword');
INSERT INTO `admin_permission` VALUES (19, 'CU', '/form/add');
INSERT INTO `admin_permission` VALUES (20, 'CU', '/form/info');
INSERT INTO `admin_permission` VALUES (21, 'CU', '/form/delete');
INSERT INTO `admin_permission` VALUES (22, 'CU', '/form/pass');
INSERT INTO `admin_permission` VALUES (23, 'CU', '/form/reject');
INSERT INTO `admin_permission` VALUES (24, 'CU', '/form/myList');
INSERT INTO `admin_permission` VALUES (25, 'CU', '/admin/logout');
INSERT INTO `admin_permission` VALUES (26, 'CU', '/dialog/add');
INSERT INTO `admin_permission` VALUES (27, 'CU', '/dialog/oneFormList');
INSERT INTO `admin_permission` VALUES (28, 'CU', '/admin/changePassword');
INSERT INTO `admin_permission` VALUES (29, 'CU', '/form/myInfo');
INSERT INTO `admin_permission` VALUES (30, 'CU', '/form/setFilesOrigin');
INSERT INTO `admin_permission` VALUES (31, 'CU', '/upload/add');
INSERT INTO `admin_permission` VALUES (32, 'CU', '/form/myUpdate');
INSERT INTO `admin_permission` VALUES (33, 'CU', '/company/myList');
INSERT INTO `admin_permission` VALUES (34, 'CU', '/company/myAdd');
INSERT INTO `admin_permission` VALUES (35, 'CU', '/company/myDelete');
INSERT INTO `admin_permission` VALUES (36, 'hnsjb', '/form/setProductionStatus');
INSERT INTO `admin_permission` VALUES (37, 'hnsjb', '/company/reduceNum');
INSERT INTO `admin_permission` VALUES (38, 'CU', '/admin/info');
INSERT INTO `admin_permission` VALUES (39, 'hnsjb', '/admin/wxUnbind');
INSERT INTO `admin_permission` VALUES (40, 'CU', '/admin/wxUnbind');

-- ----------------------------
-- Table structure for company
-- ----------------------------
DROP TABLE IF EXISTS `company`;
CREATE TABLE `company`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `admin_id` int NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '上门地址',
  `created_at` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 57 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of company
-- ----------------------------
INSERT INTO `company` VALUES (14, 8, '河南 郑州市 手机报', '嘉禾花园-1号楼三单元', '2022-04-11 01:09:16', '2022-04-11 01:09:16');
INSERT INTO `company` VALUES (45, 8, '河南郑州疫情结束有有限公司', '郑州市二七区交通路', '2022-05-23 07:37:00', '2022-05-23 07:37:00');
INSERT INTO `company` VALUES (46, 11, '测试01', '测试01', '2022-05-23 08:17:07', '2022-05-23 08:17:07');
INSERT INTO `company` VALUES (47, 12, '士测试公司', '河南金水区', '2022-05-26 01:51:24', '2022-05-26 01:51:24');
INSERT INTO `company` VALUES (49, 2, '河南郑州志高商务有限公司（测试）', '', '2022-05-26 02:04:57', '2022-05-26 02:04:57');
INSERT INTO `company` VALUES (50, 2, '河南统计局', '', '2022-05-26 10:21:46', '2022-05-26 10:21:46');
INSERT INTO `company` VALUES (53, 8, '测试2022年5月30日', '测试2022年5月30日', '2022-05-30 07:42:56', '2022-05-30 07:42:56');
INSERT INTO `company` VALUES (54, 2, '河南省联通', '123', '2022-06-16 07:30:21', '2022-06-16 07:30:21');
INSERT INTO `company` VALUES (55, 17, '河南省郑州市', '金水区123号', '2023-06-05 13:30:08', '2023-06-05 13:30:08');
INSERT INTO `company` VALUES (56, 18, '河南郑州', '河南郑州', '2023-06-05 13:48:52', '2023-06-05 13:48:52');

-- ----------------------------
-- Table structure for form
-- ----------------------------
DROP TABLE IF EXISTS `form`;
CREATE TABLE `form`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `admin_id` int NULL DEFAULT NULL,
  `admin_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `company_id` int NULL DEFAULT NULL,
  `scale` enum('A','B','C','D','E','F') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `type` json NULL COMMENT '[\"拍摄\",\"专访\",\"剪辑\"]',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `demand_file` json NULL,
  `wx_demand_file` json NULL,
  `link_man` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `link_mobile` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `link_email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `files` json NULL,
  `files_origin` json NULL,
  `wx_files_origin` json NULL,
  `status` enum('创建','确认','审核','通过','驳回') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `production_status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '制作状态',
  `visit_date` date NULL DEFAULT NULL COMMENT '上门日期',
  `expect_delivery_date` date NULL DEFAULT NULL COMMENT '预计交付日期',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 65 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of form
-- ----------------------------
INSERT INTO `form` VALUES (48, 8, '联通账号2', 14, 'A', '[\"剪辑\"]', '体检', '项目描述', '[{\"raw\": {\"uid\": 1658370129961}, \"uid\": 1658370129961, \"name\": \"空间望远镜.jpg\", \"size\": 116459, \"status\": \"success\", \"response\": {\"msg\": \"请求成功\", \"data\": {\"id\": 414, \"src\": \"/uploads/2022/07/af1d2e184048b507bfa01635428dc6c3.jpg\", \"name\": \"空间望远镜.jpg\", \"type\": \"素材\", \"form_id\": 48, \"created_at\": null}, \"status\": 1}, \"percentage\": 100}]', NULL, '客户经理', '联系方式', 'asdf123@163.com', NULL, '{\"psauarr\": [], \"psvdarr\": [], \"pstxtarr\": [], \"psotherarr\": []}', NULL, '确认', '停滞', NULL, NULL, '2022-05-23 07:32:19', '2022-07-21 02:23:20');
INSERT INTO `form` VALUES (49, 8, '联通账号2', 45, 'D', '[\"拍摄\"]', '视频拍摄', '视频拍摄', NULL, '[]', '11', '13298409989', '757611014@qq.com', NULL, NULL, '[]', '创建', NULL, NULL, NULL, '2022-05-23 07:37:22', '2022-05-23 07:38:02');
INSERT INTO `form` VALUES (51, 11, 'name', 46, 'A', '[\"拍摄\"]', '测试01122', '项目描述', '[{\"raw\": {\"uid\": 1653294054425}, \"uid\": 1653294054425, \"name\": \"a3-2.jpg\", \"size\": 9168, \"status\": \"success\", \"response\": {\"msg\": \"请求成功\", \"data\": {\"id\": 358, \"src\": \"/uploads/2022/05/9b092d4b04380f3e2d0a616dbb224b1f.jpg\", \"name\": \"a3-2.jpg\", \"type\": \"素材\", \"form_id\": 51, \"created_at\": null}, \"status\": 1}, \"percentage\": 100}]', '[{\"id\": 354, \"src\": \"/uploads/2022/05/6b4c03fbf7070a5cee491751ad4f6648.jpg\", \"url\": \"https://vidrgt.lvgs.com.cn/uploads/2022/05/6b4c03fbf7070a5cee491751ad4f6648.jpg\", \"name\": \"tmp_545be0fcd8497622551528b58e692acef2c016f9eaea5011.jpg\", \"path\": \"https://vidrgt.lvgs.com.cn/uploads/2022/05/6b4c03fbf7070a5cee491751ad4f6648.jpg\", \"type\": \"素材\", \"ishow\": true, \"mytype\": \"WX\", \"extname\": \"tmp_545be0fcd8497622551528b58e692acef2c016f9eaea5011.jpg\", \"form_id\": 51, \"longpath\": \"https://vidrgt.lvgs.com.cn/uploads/2022/05/6b4c03fbf7070a5cee491751ad4f6648.jpg\", \"pcstatus\": \"ed\", \"created_at\": null}]', '客户经理', '联系方式', 'lluck@qq.com', NULL, '{\"moviearr\": [{\"raw\": {\"uid\": 1653294048893}, \"uid\": 1653294048893, \"name\": \"a3-2.jpg\", \"size\": 9168, \"status\": \"success\", \"response\": {\"msg\": \"请求成功\", \"data\": {\"id\": 357, \"src\": \"/uploads/2022/05/9b092d4b04380f3e2d0a616dbb224b1f.jpg\", \"name\": \"a3-2.jpg\", \"type\": \"素材\", \"form_id\": 51, \"created_at\": null}, \"status\": 1}, \"percentage\": 100}]}', '[{\"id\": 355, \"src\": \"/uploads/2022/05/a6a3535e4693bc59957cea10106b8fe2.jpg\", \"url\": \"https://vidrgt.lvgs.com.cn/uploads/2022/05/a6a3535e4693bc59957cea10106b8fe2.jpg\", \"name\": \"tmp_e7ff4d95c71eb11c4ee24e87c217cbc8becdc9c8a6b5bd78.jpg\", \"path\": \"https://vidrgt.lvgs.com.cn/uploads/2022/05/a6a3535e4693bc59957cea10106b8fe2.jpg\", \"type\": \"素材\", \"ishow\": true, \"mytype\": \"WX\", \"extname\": \"tmp_e7ff4d95c71eb11c4ee24e87c217cbc8becdc9c8a6b5bd78.jpg\", \"form_id\": 51, \"longpath\": \"https://vidrgt.lvgs.com.cn/uploads/2022/05/a6a3535e4693bc59957cea10106b8fe2.jpg\", \"pcstatus\": \"ed\", \"created_at\": null}, {\"id\": 356, \"src\": \"/uploads/2022/05/21bbe6c3386c8914a1e53832406815d3.jpg\", \"url\": \"https://vidrgt.lvgs.com.cn/uploads/2022/05/21bbe6c3386c8914a1e53832406815d3.jpg\", \"name\": \"tmp_e4b48f50657ae7c0b333c264b90374c5b146912bfc806cca.jpg\", \"path\": \"https://vidrgt.lvgs.com.cn/uploads/2022/05/21bbe6c3386c8914a1e53832406815d3.jpg\", \"type\": \"素材\", \"ishow\": true, \"mytype\": \"WX\", \"extname\": \"tmp_e4b48f50657ae7c0b333c264b90374c5b146912bfc806cca.jpg\", \"form_id\": 51, \"longpath\": \"https://vidrgt.lvgs.com.cn/uploads/2022/05/21bbe6c3386c8914a1e53832406815d3.jpg\", \"pcstatus\": \"ed\", \"created_at\": null}]', '创建', NULL, NULL, NULL, '2022-05-23 08:18:13', '2022-05-25 02:41:37');
INSERT INTO `form` VALUES (52, 12, '张士健', 47, 'C', '[\"拍摄\", \"剪辑\", \"专访\"]', '项目0526测试', '描述啊', '[{\"raw\": {\"uid\": 1653530153370}, \"uid\": 1653530153370, \"name\": \"测word.docx\", \"size\": 10984, \"status\": \"success\", \"response\": {\"msg\": \"请求成功\", \"data\": {\"id\": 366, \"src\": \"/uploads/2022/05/252e6fcb60a4b41abfda3ca7665fceeb.docx\", \"name\": \"测word.docx\", \"type\": \"素材\", \"form_id\": 52, \"longurl\": \"http://vidrgt.lvgs.com.cn/uploads/2022/05/252e6fcb60a4b41abfda3ca7665fceeb.docx\", \"filetype\": \"txt\", \"created_at\": null}, \"status\": 1}, \"percentage\": 100}]', '[{\"url\": \"https://vidrgt.lvgs.com.cn/uploads/2022/05/ef964c3f29e9b23e92568eb8be9abfe6.pdf\", \"name\": \"111.pdf\", \"path\": \"https://vidrgt.lvgs.com.cn/uploads/2022/05/ef964c3f29e9b23e92568eb8be9abfe6.pdf\", \"mytype\": \"WX\", \"extname\": \"pdf\", \"pcstatus\": \"ed\"}, {\"url\": \"https://vidrgt.lvgs.com.cn/uploads/2022/05/414d6ffb455f569fbf1a34201c660aac.mp3\", \"name\": \"a.mp3\", \"path\": \"https://vidrgt.lvgs.com.cn/uploads/2022/05/414d6ffb455f569fbf1a34201c660aac.mp3\", \"mytype\": \"WX\", \"extname\": \"mp3\", \"pcstatus\": \"ed\"}, {\"url\": \"https://vidrgt.lvgs.com.cn/uploads/2022/05/9e0fcba209052f63a56ed59c365047c3.png\", \"name\": \"assets.png\", \"path\": \"https://vidrgt.lvgs.com.cn/uploads/2022/05/9e0fcba209052f63a56ed59c365047c3.png\", \"mytype\": \"WX\", \"extname\": \"png\", \"pcstatus\": \"ed\"}, {\"url\": \"https://vidrgt.lvgs.com.cn/uploads/2022/05/3cf571d4cf2a4c4b2df823a27852a7d5.mp4\", \"name\": \"movie.mp4\", \"path\": \"https://vidrgt.lvgs.com.cn/uploads/2022/05/3cf571d4cf2a4c4b2df823a27852a7d5.mp4\", \"mytype\": \"WX\", \"extname\": \"mp4\", \"pcstatus\": \"ed\"}, {\"url\": \"https://vidrgt.lvgs.com.cn/uploads/2022/05/81af1ccbfb11616793113c488d6f4d3b.png\", \"name\": \"backleft.png\", \"mytype\": \"WX\", \"extname\": \"png\", \"pcstatus\": \"ed\"}, {\"url\": \"https://vidrgt.lvgs.com.cn/uploads/2022/05/fff312d1544eddf8117e0ac77053c6e2.png\", \"name\": \"backright.png\", \"mytype\": \"WX\", \"extname\": \"png\", \"pcstatus\": \"ed\"}]', '张啊', '176', '165@qq.com', NULL, '{\"moviearr\": [{\"raw\": {\"uid\": 1653530041576}, \"uid\": 1653530041576, \"name\": \"111.pdf\", \"size\": 934, \"status\": \"success\", \"response\": {\"msg\": \"请求成功\", \"data\": {\"id\": 362, \"src\": \"/uploads/2022/05/ef964c3f29e9b23e92568eb8be9abfe6.pdf\", \"name\": \"111.pdf\", \"type\": \"素材\", \"form_id\": 52, \"created_at\": null}, \"status\": 1}, \"percentage\": 100}, {\"raw\": {\"uid\": 1653530046630}, \"uid\": 1653530046630, \"name\": \"assets.png\", \"size\": 18309, \"status\": \"success\", \"response\": {\"msg\": \"请求成功\", \"data\": {\"id\": 363, \"src\": \"/uploads/2022/05/9e0fcba209052f63a56ed59c365047c3.png\", \"name\": \"assets.png\", \"type\": \"素材\", \"form_id\": 52, \"created_at\": null}, \"status\": 1}, \"percentage\": 100}, {\"raw\": {\"uid\": 1653530116859}, \"uid\": 1653530116859, \"name\": \"a.mp3\", \"size\": 2876496, \"status\": \"success\", \"response\": {\"msg\": \"请求成功\", \"data\": {\"id\": 364, \"src\": \"/uploads/2022/05/414d6ffb455f569fbf1a34201c660aac.mp3\", \"name\": \"a.mp3\", \"type\": \"素材\", \"form_id\": 52, \"created_at\": null}, \"status\": 1}, \"percentage\": 100}, {\"raw\": {\"uid\": 1653530123362}, \"uid\": 1653530123362, \"name\": \"vd.mp4\", \"size\": 318465, \"status\": \"success\", \"response\": {\"msg\": \"请求成功\", \"data\": {\"id\": 365, \"src\": \"/uploads/2022/05/3cf571d4cf2a4c4b2df823a27852a7d5.mp4\", \"name\": \"vd.mp4\", \"type\": \"素材\", \"form_id\": 52, \"created_at\": null}, \"status\": 1}, \"percentage\": 100}, {\"raw\": {\"uid\": 1653551046335}, \"uid\": 1653551046335, \"name\": \"Someone You Loved.mp3\", \"size\": 5946710, \"status\": \"success\", \"response\": {\"msg\": \"请求成功\", \"data\": {\"id\": 368, \"src\": \"/uploads/2022/05/f1f35841212dbfe0f6b7e7ba487c60c5.mp3\", \"name\": \"Someone You Loved.mp3\", \"type\": \"素材\", \"form_id\": 52, \"created_at\": null}, \"status\": 1}, \"percentage\": 100}]}', '[{\"id\": 361, \"src\": \"/uploads/2022/05/067aca210b391f549d841b716e50281f.jpg\", \"url\": \"https://vidrgt.lvgs.com.cn/uploads/2022/05/067aca210b391f549d841b716e50281f.jpg\", \"name\": \"tmp_58aed3f715d0854b05471766e178a91a.jpg\", \"path\": \"https://vidrgt.lvgs.com.cn/uploads/2022/05/067aca210b391f549d841b716e50281f.jpg\", \"type\": \"素材\", \"ishow\": true, \"mytype\": \"WX\", \"extname\": \"tmp_58aed3f715d0854b05471766e178a91a.jpg\", \"form_id\": 52, \"longpath\": \"https://vidrgt.lvgs.com.cn/uploads/2022/05/067aca210b391f549d841b716e50281f.jpg\", \"pcstatus\": \"ed\", \"created_at\": null}, {\"id\": 378, \"src\": \"/uploads/2022/05/816a9e93fefd20ad07fac3de40933ce0.jpg\", \"url\": \"https://vidrgt.lvgs.com.cn/uploads/2022/05/816a9e93fefd20ad07fac3de40933ce0.jpg\", \"name\": \"ALFcBFq3IIas816a9e93fefd20ad07fac3de40933ce0.jpg\", \"path\": \"https://vidrgt.lvgs.com.cn/uploads/2022/05/816a9e93fefd20ad07fac3de40933ce0.jpg\", \"type\": \"素材\", \"ishow\": true, \"mytype\": \"WX\", \"extname\": \"ALFcBFq3IIas816a9e93fefd20ad07fac3de40933ce0.jpg\", \"form_id\": 52, \"longpath\": \"https://vidrgt.lvgs.com.cn/uploads/2022/05/816a9e93fefd20ad07fac3de40933ce0.jpg\", \"pcstatus\": \"ed\", \"created_at\": null}]', '创建', NULL, NULL, NULL, '2022-05-26 01:51:51', '2022-05-27 03:18:38');
INSERT INTO `form` VALUES (53, 2, '联通账号', 49, 'B', '[\"剪辑\", \"拍摄\"]', '宣传片拍摄', '拍摄', '[{\"raw\": {\"uid\": 1653531842137}, \"uid\": 1653531842137, \"name\": \"政企视频彩铃内容设置操作手册.docx\", \"size\": 775165, \"status\": \"success\", \"response\": {\"msg\": \"请求成功\", \"data\": {\"id\": 367, \"src\": \"/uploads/2022/05/9a1ee24818bab6e52e5fe531afd5f455.docx\", \"name\": \"政企视频彩铃内容设置操作手册.docx\", \"type\": \"素材\", \"form_id\": 53, \"created_at\": null}, \"status\": 1}, \"percentage\": 100}]', NULL, '李林波', '17596495687', '2101666399@qq.com', NULL, '{\"psauarr\": [], \"psvdarr\": [], \"pstxtarr\": [], \"psotherarr\": []}', NULL, '创建', NULL, NULL, NULL, '2022-05-26 02:10:09', '2022-05-26 02:24:37');
INSERT INTO `form` VALUES (57, 8, '联通账号2', 53, 'D', '[\"拍摄\"]', '测试2022年5月30日项目', '项目标书1\n项目描述2', '[{\"raw\": {\"uid\": 1653896603829}, \"uid\": 1653896603829, \"name\": \"a3-2.jpg\", \"size\": 9168, \"status\": \"success\", \"response\": {\"msg\": \"请求成功\", \"data\": {\"id\": 410, \"src\": \"/uploads/2022/05/9b092d4b04380f3e2d0a616dbb224b1f.jpg\", \"name\": \"a3-2.jpg\", \"type\": \"素材\", \"form_id\": 57, \"created_at\": null}, \"status\": 1}, \"percentage\": 100}]', NULL, '测试客户经理', '测试联系方式', 'lluck42@163.com', NULL, '{\"moviearr\": [{\"raw\": {\"uid\": 1653896685298}, \"uid\": 1653896685298, \"name\": \"a2-2.jpg\", \"size\": 9078, \"status\": \"success\", \"response\": {\"msg\": \"请求成功\", \"data\": {\"id\": 411, \"src\": \"/uploads/2022/05/cd929c150bfb4de63cda294e1728293c.jpg\", \"name\": \"a2-2.jpg\", \"type\": \"素材\", \"form_id\": 57, \"created_at\": null}, \"status\": 1}, \"percentage\": 100}]}', NULL, '确认', '完成', NULL, NULL, '2022-05-30 07:43:10', '2022-06-16 03:21:56');
INSERT INTO `form` VALUES (58, 8, '联通账号2', 53, 'D', '[\"拍摄\"]', '2022年6月16日测试02', '2022年6月16日测试02\n2022年6月16日测试02\n2022年6月16日测试02', '[{\"raw\": {\"uid\": 1655351121867}, \"uid\": 1655351121867, \"name\": \"075ddde7c73716abc61389cbf814127.jpg\", \"size\": 20182, \"status\": \"success\", \"response\": {\"msg\": \"请求成功\", \"data\": {\"id\": 412, \"src\": \"/uploads/2022/06/dd9619204f60d4182ac93081e7972e24.jpg\", \"name\": \"075ddde7c73716abc61389cbf814127.jpg\", \"type\": \"素材\", \"form_id\": 58, \"created_at\": null}, \"status\": 1}, \"percentage\": 100}]', NULL, '客户经理', '客户经理', '123213@qq.com', NULL, '{\"moviearr\": [{\"raw\": {\"uid\": 1655351149847}, \"uid\": 1655351149847, \"name\": \"12.png\", \"size\": 392, \"status\": \"success\", \"response\": {\"msg\": \"请求成功\", \"data\": {\"id\": 413, \"src\": \"/uploads/2022/06/9f011edab9efc4005577ef2d471281da.png\", \"name\": \"12.png\", \"type\": \"素材\", \"form_id\": 58, \"created_at\": null}, \"status\": 1}, \"percentage\": 100}]}', NULL, '确认', NULL, NULL, NULL, '2022-06-16 03:44:42', '2022-06-16 03:48:51');
INSERT INTO `form` VALUES (59, 2, '联通账号', 54, 'B', NULL, '2022年6月16日视频制作', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '创建', NULL, NULL, NULL, '2022-06-16 07:31:19', '2022-06-16 07:31:19');
INSERT INTO `form` VALUES (60, 8, '联通账号2', 53, 'B', '[\"拍摄\"]', '测试项目220721', '测试i项目描述', '[{\"raw\": {\"uid\": 1658370274307}, \"uid\": 1658370274307, \"name\": \"111.pdf\", \"size\": 934, \"status\": \"success\", \"response\": {\"msg\": \"请求成功\", \"data\": {\"id\": 415, \"src\": \"/uploads/2022/07/ef964c3f29e9b23e92568eb8be9abfe6.pdf\", \"name\": \"111.pdf\", \"type\": \"素材\", \"form_id\": 60, \"created_at\": null}, \"status\": 1}, \"percentage\": 100}]', NULL, '张建', '15617517078', '1623495@qq.com', NULL, '{\"moviearr\": []}', NULL, '确认', NULL, NULL, NULL, '2022-07-21 02:23:37', '2022-07-21 02:26:01');
INSERT INTO `form` VALUES (61, 8, '联通账号2', 53, 'A', NULL, '测试230101', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '创建', NULL, NULL, NULL, '2023-01-10 16:09:29', '2023-01-10 16:09:29');
INSERT INTO `form` VALUES (62, 8, '联通账号2', 53, 'A', '[\"拍摄\", \"剪辑\", \"专访\"]', '测试230110', '测试', '[{\"raw\": {\"uid\": 1673338493148}, \"uid\": 1673338493148, \"name\": \"11.1.pdf\", \"size\": 934, \"status\": \"success\", \"response\": {\"msg\": \"请求成功\", \"data\": {\"id\": 423, \"src\": \"/uploads/2023/01/ef964c3f29e9b23e92568eb8be9abfe6.pdf\", \"name\": \"11.1.pdf\", \"type\": \"素材\", \"form_id\": 62, \"created_at\": null}, \"status\": 1}, \"percentage\": 100}]', '[{\"url\": \"https://vidrgt.lvgs.com.cn/uploads/2023/01/5c04f0c2500f5972058d6e062f9f61c7.jpg\", \"name\": \"tmp_9263debf4261e11845d4e91c62a13e1a.jpg\", \"path\": \"https://vidrgt.lvgs.com.cn/uploads/2023/01/5c04f0c2500f5972058d6e062f9f61c7.jpg\", \"mytype\": \"WX\", \"extname\": \"tmp_9263debf4261e11845d4e91c62a13e1a.jpg\", \"pcstatus\": \"ed\"}]', '张', '15617517073', 'jz123@qq.com', NULL, '{\"psauarr\": [], \"psvdarr\": [], \"pstxtarr\": [{\"raw\": {\"uid\": 1673338469887}, \"uid\": 1673338469887, \"name\": \"11.1.pdf\", \"size\": 934, \"status\": \"success\", \"response\": {\"msg\": \"请求成功\", \"data\": {\"id\": 420, \"src\": \"/uploads/2023/01/ef964c3f29e9b23e92568eb8be9abfe6.pdf\", \"name\": \"11.1.pdf\", \"type\": \"素材\", \"form_id\": 62, \"created_at\": null}, \"status\": 1}, \"percentage\": 100}, {\"raw\": {\"uid\": 1673338478809}, \"uid\": 1673338478809, \"name\": \"测word.docx\", \"size\": 10984, \"status\": \"success\", \"response\": {\"msg\": \"请求成功\", \"data\": {\"id\": 421, \"src\": \"/uploads/2023/01/252e6fcb60a4b41abfda3ca7665fceeb.docx\", \"name\": \"测word.docx\", \"type\": \"素材\", \"form_id\": 62, \"created_at\": null}, \"status\": 1}, \"percentage\": 100}, {\"raw\": {\"uid\": 1673338486336}, \"uid\": 1673338486336, \"name\": \"测excel.xls\", \"size\": 17920, \"status\": \"success\", \"response\": {\"msg\": \"请求成功\", \"data\": {\"id\": 422, \"src\": \"/uploads/2023/01/4525bcf293a21686290a8070b8c9f73b.xls\", \"name\": \"测excel.xls\", \"type\": \"素材\", \"form_id\": 62, \"created_at\": null}, \"status\": 1}, \"percentage\": 100}], \"psotherarr\": []}', '[]', '创建', NULL, NULL, NULL, '2023-01-10 16:10:55', '2023-01-10 16:14:55');
INSERT INTO `form` VALUES (63, 17, '123456789', 55, 'A', NULL, 'qaq', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '创建', NULL, NULL, NULL, '2023-06-05 13:31:58', '2023-06-05 13:31:58');
INSERT INTO `form` VALUES (64, 18, '1234567890', 56, 'A', NULL, '1213141213131', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '创建', NULL, NULL, NULL, '2023-06-05 13:49:00', '2023-06-05 13:49:00');

-- ----------------------------
-- Table structure for form_dialog
-- ----------------------------
DROP TABLE IF EXISTS `form_dialog`;
CREATE TABLE `form_dialog`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `form_id` int UNSIGNED NULL DEFAULT NULL,
  `admin_id` int UNSIGNED NULL DEFAULT NULL,
  `admin_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `admin_role` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `form_id`(`form_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of form_dialog
-- ----------------------------
INSERT INTO `form_dialog` VALUES (1, 2, 2, '联通账号', 'CU', '归凯撒赶快发噶看', '2022-04-04 15:01:35');
INSERT INTO `form_dialog` VALUES (2, 2, 1, 'hnsjb', 'hnsjb', '1313155 513135', '2022-04-04 15:01:51');
INSERT INTO `form_dialog` VALUES (3, 11, 2, '联通账号', 'CU', '测试时间', '2022-04-07 09:18:16');
INSERT INTO `form_dialog` VALUES (4, 26, 8, '联通账号2', 'CU', '我先留个言·', '2022-04-11 01:14:15');
INSERT INTO `form_dialog` VALUES (5, 29, 2, '联通账号', 'CU', '请尽快制作！\n请尽快制作！', '2022-04-11 01:56:15');

-- ----------------------------
-- Table structure for reduce_record
-- ----------------------------
DROP TABLE IF EXISTS `reduce_record`;
CREATE TABLE `reduce_record`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `company_id` int NULL DEFAULT NULL,
  `company_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `form_id` int NULL DEFAULT NULL,
  `form_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of reduce_record
-- ----------------------------
INSERT INTO `reduce_record` VALUES (1, 2, '郑州移动', 3, '将军专访', '作品已完成，扣除费用', '2022-04-04 15:05:34');
INSERT INTO `reduce_record` VALUES (2, 2, '郑州移动', 2, '五一剪辑1', '扣除剪辑费用', '2022-04-04 15:05:55');
INSERT INTO `reduce_record` VALUES (3, 2, '郑州移动', 2, '五一剪辑1', '再次扣费01', '2022-04-06 09:27:48');
INSERT INTO `reduce_record` VALUES (4, 2, '郑州移动', 1, '清明拍摄1', '拍摄扣费01', '2022-04-06 09:28:22');
INSERT INTO `reduce_record` VALUES (5, 2, '郑州移动', 1, '清明拍摄1', '123123', '2022-04-07 07:16:43');

-- ----------------------------
-- Table structure for upload
-- ----------------------------
DROP TABLE IF EXISTS `upload`;
CREATE TABLE `upload`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `type` enum('视频','音频','素材') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `src` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `form_id` int UNSIGNED NULL DEFAULT NULL,
  `form_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `form_description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `form_id`(`form_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 427 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of upload
-- ----------------------------
INSERT INTO `upload` VALUES (1, '111.pdf', '素材', '/uploads/2022/04/ef964c3f29e9b23e92568eb8be9abfe6.pdf', 1, NULL, NULL, '2022-04-04 14:43:13');
INSERT INTO `upload` VALUES (2, 'assets.png', '素材', '/uploads/2022/04/9e0fcba209052f63a56ed59c365047c3.png', 2, NULL, NULL, '2022-04-04 14:44:22');
INSERT INTO `upload` VALUES (3, '12345678.jpg', '素材', '/uploads/2022/04/722c93f6263750d8e8fab3ab3acb38a2.jpg', 2, NULL, NULL, '2022-04-04 14:44:26');
INSERT INTO `upload` VALUES (4, '142056921990.mp4', '视频', '/uploads/2022/04/0e1a934d7d0302b0d8b7ec1a088dcc63.mp4', 1, NULL, NULL, '2022-04-04 14:44:40');
INSERT INTO `upload` VALUES (5, '142056921990.mp4', '视频', '/uploads/2022/04/0e1a934d7d0302b0d8b7ec1a088dcc63.mp4', 1, NULL, NULL, '2022-04-04 14:44:53');
INSERT INTO `upload` VALUES (6, '141907667820.mp4', '视频', '/uploads/2022/04/e486a427ddac1657bc57cecd25518358.mp4', 2, NULL, NULL, '2022-04-04 15:02:01');
INSERT INTO `upload` VALUES (7, '142013450851.mp4', '视频', '/uploads/2022/04/7d7c4fc074f2080f276f304239ae1ac4.mp4', 2, NULL, NULL, '2022-04-04 15:02:06');
INSERT INTO `upload` VALUES (8, 'aaa.mp4', '视频', '/uploads/2022/04/a41e77eca67e1c5cedea54ac5ea07dbc.mp4', 3, NULL, NULL, '2022-04-04 15:03:41');
INSERT INTO `upload` VALUES (9, '142056921990.mp4', '视频', '/uploads/2022/04/0e1a934d7d0302b0d8b7ec1a088dcc63.mp4', 2, NULL, NULL, '2022-04-04 15:04:22');
INSERT INTO `upload` VALUES (10, '150717128571.jpg', '素材', '/uploads/2022/04/ab8294c60d8ef7c3c8c2aee867e45b2e.jpg', 9, NULL, NULL, '2022-04-07 09:45:39');
INSERT INTO `upload` VALUES (11, '142056921990.mp4', '素材', '/uploads/2022/04/0e1a934d7d0302b0d8b7ec1a088dcc63.mp4', 9, NULL, NULL, '2022-04-07 09:45:43');
INSERT INTO `upload` VALUES (12, '12.png', '素材', '/uploads/2022/04/9f011edab9efc4005577ef2d471281da.png', 9, NULL, NULL, '2022-04-07 09:46:16');
INSERT INTO `upload` VALUES (13, '150717128571.jpg', '素材', '/uploads/2022/04/ab8294c60d8ef7c3c8c2aee867e45b2e.jpg', 15, NULL, NULL, '2022-04-08 00:33:22');
INSERT INTO `upload` VALUES (14, '150717128571.jpg', '素材', '/uploads/2022/04/ab8294c60d8ef7c3c8c2aee867e45b2e.jpg', 15, NULL, NULL, '2022-04-08 00:33:26');
INSERT INTO `upload` VALUES (15, 'demo.txt', '素材', '/uploads/2022/04/15f34144ddeef5cda0b5592b31cfa0f6.txt', 15, NULL, NULL, '2022-04-08 00:33:48');
INSERT INTO `upload` VALUES (16, '111.pdf', '素材', '/uploads/2022/04/ef964c3f29e9b23e92568eb8be9abfe6.pdf', 21, NULL, NULL, '2022-04-08 01:46:54');
INSERT INTO `upload` VALUES (17, '111.pdf', '素材', '/uploads/2022/04/ef964c3f29e9b23e92568eb8be9abfe6.pdf', 21, NULL, NULL, '2022-04-08 01:54:34');
INSERT INTO `upload` VALUES (18, 'demo.txt', '素材', '/uploads/2022/04/15f34144ddeef5cda0b5592b31cfa0f6.txt', 22, NULL, NULL, '2022-04-08 02:24:18');
INSERT INTO `upload` VALUES (19, 'demo.txt', '素材', '/uploads/2022/04/15f34144ddeef5cda0b5592b31cfa0f6.txt', 22, NULL, NULL, '2022-04-08 02:24:24');
INSERT INTO `upload` VALUES (20, 'demo.txt', '素材', '/uploads/2022/04/15f34144ddeef5cda0b5592b31cfa0f6.txt', 22, NULL, NULL, '2022-04-08 02:26:27');
INSERT INTO `upload` VALUES (21, '12.png', '素材', '/uploads/2022/04/9f011edab9efc4005577ef2d471281da.png', 26, NULL, NULL, '2022-04-11 01:13:17');
INSERT INTO `upload` VALUES (22, '12.png', '素材', '/uploads/2022/04/9f011edab9efc4005577ef2d471281da.png', 26, NULL, NULL, '2022-04-11 01:13:51');
INSERT INTO `upload` VALUES (23, '12.png', '素材', '/uploads/2022/04/9f011edab9efc4005577ef2d471281da.png', 29, NULL, NULL, '2022-04-11 01:54:32');
INSERT INTO `upload` VALUES (24, '12.png', '素材', '/uploads/2022/04/9f011edab9efc4005577ef2d471281da.png', 29, NULL, NULL, '2022-04-11 01:55:34');
INSERT INTO `upload` VALUES (25, '142246906439.mp4', '素材', '/uploads/2022/04/2ab795144ad15b657bbbc2679fc4bd55.mp4', 29, NULL, NULL, '2022-04-11 01:55:40');
INSERT INTO `upload` VALUES (26, '12.png', '素材', '/uploads/2022/04/9f011edab9efc4005577ef2d471281da.png', 29, NULL, NULL, '2022-04-11 01:55:51');
INSERT INTO `upload` VALUES (27, '河南联通政企彩铃业务受理单.doc', '素材', '/uploads/2022/04/c1f1b154b552fa11861bc22762b64a15.doc', 35, NULL, NULL, '2022-04-12 01:34:40');
INSERT INTO `upload` VALUES (28, '“换铃抽豪礼 赢百元话费“活动方案4.0（0810）.docx', '素材', '/uploads/2022/04/1e1eb962efef766d1713750fb22593e4.docx', 35, NULL, NULL, '2022-04-12 01:41:55');
INSERT INTO `upload` VALUES (29, '1-”享5大超级权益 送16元话费“铂金会员返话费活动方案（0330）.docx', '素材', '/uploads/2022/04/8971f4f7fdee8dffe7cffb30d941ebd3.docx', 35, NULL, NULL, '2022-04-12 01:42:23');
INSERT INTO `upload` VALUES (30, '交付文件.mp4', '视频', '/uploads/2022/04/511ae78ce5207b4d499950654e2ef955.mp4', 26, NULL, NULL, '2022-04-12 03:01:07');
INSERT INTO `upload` VALUES (31, '111.pdf', '素材', '/uploads/2022/04/ef964c3f29e9b23e92568eb8be9abfe6.pdf', 37, NULL, NULL, '2022-04-21 02:20:13');
INSERT INTO `upload` VALUES (32, 'assets.png', '素材', '/uploads/2022/04/9e0fcba209052f63a56ed59c365047c3.png', 37, NULL, NULL, '2022-04-21 08:04:31');
INSERT INTO `upload` VALUES (33, '12345678.jpg', '素材', '/uploads/2022/04/722c93f6263750d8e8fab3ab3acb38a2.jpg', 37, NULL, NULL, '2022-04-21 08:04:38');
INSERT INTO `upload` VALUES (34, '222.pdf', '素材', '/uploads/2022/04/dc971cde2a25e93e1f79df62819dc519.pdf', 37, NULL, NULL, '2022-04-21 08:38:27');
INSERT INTO `upload` VALUES (35, '5BkoJjsUO3pVdd80df0fabdb2b5632ddbfe55f4644e8.png', '素材', '/uploads/2022/04/dd80df0fabdb2b5632ddbfe55f4644e8.png', 37, NULL, NULL, '2022-04-21 09:08:03');
INSERT INTO `upload` VALUES (36, 'rWmHOggQ1ARj94eb68edb53152c2ca7a5a373d59139e.png', '素材', '/uploads/2022/04/94eb68edb53152c2ca7a5a373d59139e.png', 37, NULL, NULL, '2022-04-21 09:19:02');
INSERT INTO `upload` VALUES (37, 'yh9Q6FC9meSWdd80df0fabdb2b5632ddbfe55f4644e8.png', '素材', '/uploads/2022/04/dd80df0fabdb2b5632ddbfe55f4644e8.png', 37, NULL, NULL, '2022-04-21 09:19:02');
INSERT INTO `upload` VALUES (38, 'lingdao.png', '素材', '/uploads/2022/04/94eb68edb53152c2ca7a5a373d59139e.png', 39, NULL, NULL, '2022-04-22 00:37:59');
INSERT INTO `upload` VALUES (39, 'lanmu.png', '素材', '/uploads/2022/04/dd80df0fabdb2b5632ddbfe55f4644e8.png', 39, NULL, NULL, '2022-04-22 01:25:25');
INSERT INTO `upload` VALUES (40, 'lanmu.png', '素材', '/uploads/2022/04/dd80df0fabdb2b5632ddbfe55f4644e8.png', 39, NULL, NULL, '2022-04-22 01:25:47');
INSERT INTO `upload` VALUES (41, 'lanmu.png', '素材', '/uploads/2022/04/dd80df0fabdb2b5632ddbfe55f4644e8.png', 39, NULL, NULL, '2022-04-22 01:26:49');
INSERT INTO `upload` VALUES (42, 'mxSRqQWFN6O3dd80df0fabdb2b5632ddbfe55f4644e8.png', '素材', '/uploads/2022/04/dd80df0fabdb2b5632ddbfe55f4644e8.png', 37, NULL, NULL, '2022-04-22 01:48:13');
INSERT INTO `upload` VALUES (43, 'MXmHsEOMDwgp722c93f6263750d8e8fab3ab3acb38a2.jpg', '素材', '/uploads/2022/04/722c93f6263750d8e8fab3ab3acb38a2.jpg', 37, NULL, NULL, '2022-04-22 01:59:29');
INSERT INTO `upload` VALUES (44, 'OMcRNPWOc9p8722c93f6263750d8e8fab3ab3acb38a2.jpg', '素材', '/uploads/2022/04/722c93f6263750d8e8fab3ab3acb38a2.jpg', 37, NULL, NULL, '2022-04-22 02:01:22');
INSERT INTO `upload` VALUES (45, '9QJhrCkKS4QB722c93f6263750d8e8fab3ab3acb38a2.jpg', '素材', '/uploads/2022/04/722c93f6263750d8e8fab3ab3acb38a2.jpg', 37, NULL, NULL, '2022-04-22 02:03:07');
INSERT INTO `upload` VALUES (46, 'Aid8417MKsU594eb68edb53152c2ca7a5a373d59139e.png', '素材', '/uploads/2022/04/94eb68edb53152c2ca7a5a373d59139e.png', 37, NULL, NULL, '2022-04-22 02:07:19');
INSERT INTO `upload` VALUES (47, 'xzw8qgCGOP6gdd80df0fabdb2b5632ddbfe55f4644e8.png', '素材', '/uploads/2022/04/dd80df0fabdb2b5632ddbfe55f4644e8.png', 37, NULL, NULL, '2022-04-22 02:07:23');
INSERT INTO `upload` VALUES (48, 'JPsWX3BivArh94eb68edb53152c2ca7a5a373d59139e.png', '素材', '/uploads/2022/04/94eb68edb53152c2ca7a5a373d59139e.png', 37, NULL, NULL, '2022-04-22 02:14:28');
INSERT INTO `upload` VALUES (49, 'cu5yKDz7V4fQdd80df0fabdb2b5632ddbfe55f4644e8.png', '素材', '/uploads/2022/04/dd80df0fabdb2b5632ddbfe55f4644e8.png', 37, NULL, NULL, '2022-04-22 02:14:28');
INSERT INTO `upload` VALUES (50, '3hvmN9Q2AhyWfff312d1544eddf8117e0ac77053c6e2.png', '素材', '/uploads/2022/04/fff312d1544eddf8117e0ac77053c6e2.png', 37, NULL, NULL, '2022-04-22 02:14:28');
INSERT INTO `upload` VALUES (51, 'okx139NOYSbq81af1ccbfb11616793113c488d6f4d3b.png', '素材', '/uploads/2022/04/81af1ccbfb11616793113c488d6f4d3b.png', 37, NULL, NULL, '2022-04-22 02:14:28');
INSERT INTO `upload` VALUES (52, '5n8Ep9WOmjddf128c00d236030315613ce9bc9130492.png', '素材', '/uploads/2022/04/f128c00d236030315613ce9bc9130492.png', 37, NULL, NULL, '2022-04-22 02:19:34');
INSERT INTO `upload` VALUES (53, 'b3Yj6cii7hYffff312d1544eddf8117e0ac77053c6e2.png', '素材', '/uploads/2022/04/fff312d1544eddf8117e0ac77053c6e2.png', 37, NULL, NULL, '2022-04-22 02:19:34');
INSERT INTO `upload` VALUES (54, '3S0MbDt4kdXI81af1ccbfb11616793113c488d6f4d3b.png', '素材', '/uploads/2022/04/81af1ccbfb11616793113c488d6f4d3b.png', 37, NULL, NULL, '2022-04-22 02:19:34');
INSERT INTO `upload` VALUES (55, 'qnRvd7n219Q222f51ae45d8d33f7d48da084c16decd6.png', '素材', '/uploads/2022/04/22f51ae45d8d33f7d48da084c16decd6.png', 37, NULL, NULL, '2022-04-22 02:21:15');
INSERT INTO `upload` VALUES (56, 'VoOkYuu9jp4yfff312d1544eddf8117e0ac77053c6e2.png', '素材', '/uploads/2022/04/fff312d1544eddf8117e0ac77053c6e2.png', 37, NULL, NULL, '2022-04-22 02:21:15');
INSERT INTO `upload` VALUES (57, 'ogiLtFzaNDAV81af1ccbfb11616793113c488d6f4d3b.png', '素材', '/uploads/2022/04/81af1ccbfb11616793113c488d6f4d3b.png', 37, NULL, NULL, '2022-04-22 02:21:15');
INSERT INTO `upload` VALUES (58, 'rKk0M9HgUQ4z22f51ae45d8d33f7d48da084c16decd6.png', '素材', '/uploads/2022/04/22f51ae45d8d33f7d48da084c16decd6.png', 37, NULL, NULL, '2022-04-22 02:22:46');
INSERT INTO `upload` VALUES (59, '5k2aOqyiLZElfff312d1544eddf8117e0ac77053c6e2.png', '素材', '/uploads/2022/04/fff312d1544eddf8117e0ac77053c6e2.png', 37, NULL, NULL, '2022-04-22 02:22:46');
INSERT INTO `upload` VALUES (60, 'K09ljEU2A0cX81af1ccbfb11616793113c488d6f4d3b.png', '素材', '/uploads/2022/04/81af1ccbfb11616793113c488d6f4d3b.png', 37, NULL, NULL, '2022-04-22 02:22:46');
INSERT INTO `upload` VALUES (61, 'iXlNsm4Lz9Zf94eb68edb53152c2ca7a5a373d59139e.png', '素材', '/uploads/2022/04/94eb68edb53152c2ca7a5a373d59139e.png', 37, NULL, NULL, '2022-04-22 02:25:11');
INSERT INTO `upload` VALUES (62, 'Kt7aH06D01t2dd80df0fabdb2b5632ddbfe55f4644e8.png', '素材', '/uploads/2022/04/dd80df0fabdb2b5632ddbfe55f4644e8.png', 37, NULL, NULL, '2022-04-22 02:25:11');
INSERT INTO `upload` VALUES (63, 'kV00M5Ks5uBVdd80df0fabdb2b5632ddbfe55f4644e8.png', '素材', '/uploads/2022/04/dd80df0fabdb2b5632ddbfe55f4644e8.png', 37, NULL, NULL, '2022-04-22 02:30:06');
INSERT INTO `upload` VALUES (64, 'OHbFLLvdOG39dd80df0fabdb2b5632ddbfe55f4644e8.png', '素材', '/uploads/2022/04/dd80df0fabdb2b5632ddbfe55f4644e8.png', 37, NULL, NULL, '2022-04-22 02:30:11');
INSERT INTO `upload` VALUES (65, 'TAIQLxG1KM0efff312d1544eddf8117e0ac77053c6e2.png', '素材', '/uploads/2022/04/fff312d1544eddf8117e0ac77053c6e2.png', 37, NULL, NULL, '2022-04-22 02:34:35');
INSERT INTO `upload` VALUES (66, 'ctgz0eVpDop281af1ccbfb11616793113c488d6f4d3b.png', '素材', '/uploads/2022/04/81af1ccbfb11616793113c488d6f4d3b.png', 37, NULL, NULL, '2022-04-22 02:34:35');
INSERT INTO `upload` VALUES (67, 'yfh2SnupIaTT072b291e343d380d779487254fd2f0af.png', '素材', '/uploads/2022/04/072b291e343d380d779487254fd2f0af.png', 37, NULL, NULL, '2022-04-22 02:34:42');
INSERT INTO `upload` VALUES (68, 'L88CWQplrGYe3002ac9d60aaaa7abb77489453998c77.png', '素材', '/uploads/2022/04/3002ac9d60aaaa7abb77489453998c77.png', 37, NULL, NULL, '2022-04-22 02:34:42');
INSERT INTO `upload` VALUES (69, 'jCssxhsSqTQ281af1ccbfb11616793113c488d6f4d3b.png', '素材', '/uploads/2022/04/81af1ccbfb11616793113c488d6f4d3b.png', 37, NULL, NULL, '2022-04-22 02:38:02');
INSERT INTO `upload` VALUES (70, '67wyq97w91wC072b291e343d380d779487254fd2f0af.png', '素材', '/uploads/2022/04/072b291e343d380d779487254fd2f0af.png', 37, NULL, NULL, '2022-04-22 02:38:08');
INSERT INTO `upload` VALUES (71, 'YacT9VDGBuct3002ac9d60aaaa7abb77489453998c77.png', '素材', '/uploads/2022/04/3002ac9d60aaaa7abb77489453998c77.png', 37, NULL, NULL, '2022-04-22 02:38:08');
INSERT INTO `upload` VALUES (72, 'AyakfTbxUKT20ff637f27d1ca7fca5d8c62d4ec01c17.png', '素材', '/uploads/2022/04/0ff637f27d1ca7fca5d8c62d4ec01c17.png', 37, NULL, NULL, '2022-04-22 02:38:08');
INSERT INTO `upload` VALUES (73, 'kpoZ9w0K6tifa86d7a852ab03441756cb9aadfaa9039.png', '素材', '/uploads/2022/04/a86d7a852ab03441756cb9aadfaa9039.png', 37, NULL, NULL, '2022-04-22 02:44:34');
INSERT INTO `upload` VALUES (74, 'e4k49r1omNDJ94eb68edb53152c2ca7a5a373d59139e.png', '素材', '/uploads/2022/04/94eb68edb53152c2ca7a5a373d59139e.png', 37, NULL, NULL, '2022-04-22 02:44:40');
INSERT INTO `upload` VALUES (75, 'oX098IFFRrgpdd80df0fabdb2b5632ddbfe55f4644e8.png', '素材', '/uploads/2022/04/dd80df0fabdb2b5632ddbfe55f4644e8.png', 37, NULL, NULL, '2022-04-22 02:44:40');
INSERT INTO `upload` VALUES (76, 'Oe9twExX5lVX81af1ccbfb11616793113c488d6f4d3b.png', '素材', '/uploads/2022/04/81af1ccbfb11616793113c488d6f4d3b.png', 37, NULL, NULL, '2022-04-22 02:46:00');
INSERT INTO `upload` VALUES (77, 'fbYRV1J3v8LBa86d7a852ab03441756cb9aadfaa9039.png', '素材', '/uploads/2022/04/a86d7a852ab03441756cb9aadfaa9039.png', 37, NULL, NULL, '2022-04-22 02:46:01');
INSERT INTO `upload` VALUES (78, 'znAnc574XBkz3002ac9d60aaaa7abb77489453998c77.png', '素材', '/uploads/2022/04/3002ac9d60aaaa7abb77489453998c77.png', 37, NULL, NULL, '2022-04-22 02:47:04');
INSERT INTO `upload` VALUES (79, 'mqjSIAjqANM73002ac9d60aaaa7abb77489453998c77.png', '素材', '/uploads/2022/04/3002ac9d60aaaa7abb77489453998c77.png', 37, NULL, NULL, '2022-04-22 02:49:25');
INSERT INTO `upload` VALUES (80, 'io3WRsHds5UEdd80df0fabdb2b5632ddbfe55f4644e8.png', '素材', '/uploads/2022/04/dd80df0fabdb2b5632ddbfe55f4644e8.png', 37, NULL, NULL, '2022-04-22 02:49:25');
INSERT INTO `upload` VALUES (81, 'ZqkXomJnS39Offf312d1544eddf8117e0ac77053c6e2.png', '素材', '/uploads/2022/04/fff312d1544eddf8117e0ac77053c6e2.png', 37, NULL, NULL, '2022-04-22 02:49:25');
INSERT INTO `upload` VALUES (82, 'rhKQzqPrvrxQ81af1ccbfb11616793113c488d6f4d3b.png', '素材', '/uploads/2022/04/81af1ccbfb11616793113c488d6f4d3b.png', 37, NULL, NULL, '2022-04-22 02:49:25');
INSERT INTO `upload` VALUES (83, 'yvqfc4V4TvA994eb68edb53152c2ca7a5a373d59139e.png', '素材', '/uploads/2022/04/94eb68edb53152c2ca7a5a373d59139e.png', 37, NULL, NULL, '2022-04-22 02:52:20');
INSERT INTO `upload` VALUES (84, 'bH2JgnzaxhmKdd80df0fabdb2b5632ddbfe55f4644e8.png', '素材', '/uploads/2022/04/dd80df0fabdb2b5632ddbfe55f4644e8.png', 37, NULL, NULL, '2022-04-22 02:52:20');
INSERT INTO `upload` VALUES (85, 'FLweKMApEJUK81af1ccbfb11616793113c488d6f4d3b.png', '素材', '/uploads/2022/04/81af1ccbfb11616793113c488d6f4d3b.png', 37, NULL, NULL, '2022-04-22 03:04:39');
INSERT INTO `upload` VALUES (86, 'CCuNO0YkRPPWfff312d1544eddf8117e0ac77053c6e2.png', '素材', '/uploads/2022/04/fff312d1544eddf8117e0ac77053c6e2.png', 37, NULL, NULL, '2022-04-22 03:04:43');
INSERT INTO `upload` VALUES (87, 'ny06OXEvoGCrf128c00d236030315613ce9bc9130492.png', '素材', '/uploads/2022/04/f128c00d236030315613ce9bc9130492.png', 37, NULL, NULL, '2022-04-22 03:04:48');
INSERT INTO `upload` VALUES (88, 'BUAk642Ah81q82b9c7a5a3f405032b1db71a25f67021.png', '素材', '/uploads/2022/04/82b9c7a5a3f405032b1db71a25f67021.png', 37, NULL, NULL, '2022-04-22 03:05:11');
INSERT INTO `upload` VALUES (89, 'L3mvVhJ6vDTU94eb68edb53152c2ca7a5a373d59139e.png', '素材', '/uploads/2022/04/94eb68edb53152c2ca7a5a373d59139e.png', 37, NULL, NULL, '2022-04-22 03:05:56');
INSERT INTO `upload` VALUES (90, 'i6qPscRUuwhldd80df0fabdb2b5632ddbfe55f4644e8.png', '素材', '/uploads/2022/04/dd80df0fabdb2b5632ddbfe55f4644e8.png', 37, NULL, NULL, '2022-04-22 03:05:56');
INSERT INTO `upload` VALUES (91, 'I9pZRuL06eQ5fff312d1544eddf8117e0ac77053c6e2.png', '素材', '/uploads/2022/04/fff312d1544eddf8117e0ac77053c6e2.png', 37, NULL, NULL, '2022-04-22 03:06:01');
INSERT INTO `upload` VALUES (92, 'cVd6HoWCrBeP81af1ccbfb11616793113c488d6f4d3b.png', '素材', '/uploads/2022/04/81af1ccbfb11616793113c488d6f4d3b.png', 37, NULL, NULL, '2022-04-22 03:06:01');
INSERT INTO `upload` VALUES (93, '2kVwZyonYJomf128c00d236030315613ce9bc9130492.png', '素材', '/uploads/2022/04/f128c00d236030315613ce9bc9130492.png', 37, NULL, NULL, '2022-04-22 03:53:26');
INSERT INTO `upload` VALUES (94, 'QvOhAPQNHVbO81af1ccbfb11616793113c488d6f4d3b.png', '素材', '/uploads/2022/04/81af1ccbfb11616793113c488d6f4d3b.png', 37, NULL, NULL, '2022-04-22 03:53:26');
INSERT INTO `upload` VALUES (95, 'qzfFhkhWhggAf128c00d236030315613ce9bc9130492.png', '素材', '/uploads/2022/04/f128c00d236030315613ce9bc9130492.png', 37, NULL, NULL, '2022-04-22 03:53:59');
INSERT INTO `upload` VALUES (96, '7LrWqXmYBB8Bfff312d1544eddf8117e0ac77053c6e2.png', '素材', '/uploads/2022/04/fff312d1544eddf8117e0ac77053c6e2.png', 37, NULL, NULL, '2022-04-22 03:53:59');
INSERT INTO `upload` VALUES (97, 'B7mC1jMBNtBo94eb68edb53152c2ca7a5a373d59139e.png', '素材', '/uploads/2022/04/94eb68edb53152c2ca7a5a373d59139e.png', 37, NULL, NULL, '2022-04-22 07:02:51');
INSERT INTO `upload` VALUES (98, 'mcGXfhmo6NNK81af1ccbfb11616793113c488d6f4d3b.png', '素材', '/uploads/2022/04/81af1ccbfb11616793113c488d6f4d3b.png', 37, NULL, NULL, '2022-04-22 07:02:51');
INSERT INTO `upload` VALUES (99, 'JSDEw9VC8BcPfe4feb944e22d70f8f6649b346e5f77e.png', '素材', '/uploads/2022/04/fe4feb944e22d70f8f6649b346e5f77e.png', 37, NULL, NULL, '2022-04-22 07:02:56');
INSERT INTO `upload` VALUES (100, '7W49l0PO881d072b291e343d380d779487254fd2f0af.png', '素材', '/uploads/2022/04/072b291e343d380d779487254fd2f0af.png', 37, NULL, NULL, '2022-04-22 07:02:56');
INSERT INTO `upload` VALUES (101, 'FHTnsogoa5GZ82b9c7a5a3f405032b1db71a25f67021.png', '素材', '/uploads/2022/04/82b9c7a5a3f405032b1db71a25f67021.png', 37, NULL, NULL, '2022-04-22 07:02:56');
INSERT INTO `upload` VALUES (102, 'BJTL65SRUcBSf2ee44820f0816e1807299d5fd9f152f.png', '素材', '/uploads/2022/04/f2ee44820f0816e1807299d5fd9f152f.png', 37, NULL, NULL, '2022-04-22 07:02:56');
INSERT INTO `upload` VALUES (103, 'R66QBEVzr2rGa86d7a852ab03441756cb9aadfaa9039.png', '素材', '/uploads/2022/04/a86d7a852ab03441756cb9aadfaa9039.png', 37, NULL, NULL, '2022-04-22 07:02:56');
INSERT INTO `upload` VALUES (104, 'fqFeRgi3hoOKdd80df0fabdb2b5632ddbfe55f4644e8.png', '素材', '/uploads/2022/04/dd80df0fabdb2b5632ddbfe55f4644e8.png', 37, NULL, NULL, '2022-04-22 07:11:48');
INSERT INTO `upload` VALUES (105, 'oFG1D9a30smH22f51ae45d8d33f7d48da084c16decd6.png', '素材', '/uploads/2022/04/22f51ae45d8d33f7d48da084c16decd6.png', 37, NULL, NULL, '2022-04-22 07:11:48');
INSERT INTO `upload` VALUES (106, 'ZhlBIkXd2mZZfff312d1544eddf8117e0ac77053c6e2.png', '素材', '/uploads/2022/04/fff312d1544eddf8117e0ac77053c6e2.png', 37, NULL, NULL, '2022-04-22 07:11:49');
INSERT INTO `upload` VALUES (107, 'a4rCkAmYcrQz81af1ccbfb11616793113c488d6f4d3b.png', '素材', '/uploads/2022/04/81af1ccbfb11616793113c488d6f4d3b.png', 37, NULL, NULL, '2022-04-22 07:11:49');
INSERT INTO `upload` VALUES (108, 'vdlm9zuFVpWMa86d7a852ab03441756cb9aadfaa9039.png', '素材', '/uploads/2022/04/a86d7a852ab03441756cb9aadfaa9039.png', 37, NULL, NULL, '2022-04-22 07:11:52');
INSERT INTO `upload` VALUES (109, 'Cf6EOHunzVjC072b291e343d380d779487254fd2f0af.png', '素材', '/uploads/2022/04/072b291e343d380d779487254fd2f0af.png', 37, NULL, NULL, '2022-04-22 07:11:52');
INSERT INTO `upload` VALUES (110, '6GVY6Y9XjsFV3002ac9d60aaaa7abb77489453998c77.png', '素材', '/uploads/2022/04/3002ac9d60aaaa7abb77489453998c77.png', 37, NULL, NULL, '2022-04-22 07:11:52');
INSERT INTO `upload` VALUES (111, 'ug533jdjBXwnfe4feb944e22d70f8f6649b346e5f77e.png', '素材', '/uploads/2022/04/fe4feb944e22d70f8f6649b346e5f77e.png', 37, NULL, NULL, '2022-04-22 07:11:52');
INSERT INTO `upload` VALUES (112, 'a4rCkAmYcrQz81af1ccbfb11616793113c488d6f4d3b.png', '素材', '/uploads/2022/04/81af1ccbfb11616793113c488d6f4d3b.png', 37, NULL, NULL, '2022-04-22 07:12:12');
INSERT INTO `upload` VALUES (113, 'vbR671S2m7Xd072b291e343d380d779487254fd2f0af.png', '素材', '/uploads/2022/04/072b291e343d380d779487254fd2f0af.png', 37, NULL, NULL, '2022-04-22 07:20:46');
INSERT INTO `upload` VALUES (114, 'oOIQzzLsFTYy3002ac9d60aaaa7abb77489453998c77.png', '素材', '/uploads/2022/04/3002ac9d60aaaa7abb77489453998c77.png', 37, NULL, NULL, '2022-04-22 07:20:46');
INSERT INTO `upload` VALUES (115, 'D5YhSKvb17WZf128c00d236030315613ce9bc9130492.png', '素材', '/uploads/2022/04/f128c00d236030315613ce9bc9130492.png', 37, NULL, NULL, '2022-04-22 07:20:48');
INSERT INTO `upload` VALUES (116, 'vsq5g68txhBn81af1ccbfb11616793113c488d6f4d3b.png', '素材', '/uploads/2022/04/81af1ccbfb11616793113c488d6f4d3b.png', 37, NULL, NULL, '2022-04-22 07:20:48');
INSERT INTO `upload` VALUES (117, 'vsq5g68txhBn81af1ccbfb11616793113c488d6f4d3b.png', '素材', '/uploads/2022/04/81af1ccbfb11616793113c488d6f4d3b.png', 37, NULL, NULL, '2022-04-22 07:21:03');
INSERT INTO `upload` VALUES (118, 'cPlsfxs4VTrjfff312d1544eddf8117e0ac77053c6e2.png', '素材', '/uploads/2022/04/fff312d1544eddf8117e0ac77053c6e2.png', 37, NULL, NULL, '2022-04-22 07:47:15');
INSERT INTO `upload` VALUES (119, 'IIGbMXp8yN5J81af1ccbfb11616793113c488d6f4d3b.png', '素材', '/uploads/2022/04/81af1ccbfb11616793113c488d6f4d3b.png', 37, NULL, NULL, '2022-04-22 07:47:15');
INSERT INTO `upload` VALUES (120, 'uhO8ekvBWGFx072b291e343d380d779487254fd2f0af.png', '素材', '/uploads/2022/04/072b291e343d380d779487254fd2f0af.png', 37, NULL, NULL, '2022-04-22 07:47:45');
INSERT INTO `upload` VALUES (121, '5w3uKT0pBgJH3002ac9d60aaaa7abb77489453998c77.png', '素材', '/uploads/2022/04/3002ac9d60aaaa7abb77489453998c77.png', 37, NULL, NULL, '2022-04-22 07:47:45');
INSERT INTO `upload` VALUES (122, 'IkklpE6jrRHW072b291e343d380d779487254fd2f0af.png', '素材', '/uploads/2022/04/072b291e343d380d779487254fd2f0af.png', 37, NULL, NULL, '2022-04-22 07:51:10');
INSERT INTO `upload` VALUES (123, 'BC1rle33BNKt3002ac9d60aaaa7abb77489453998c77.png', '素材', '/uploads/2022/04/3002ac9d60aaaa7abb77489453998c77.png', 37, NULL, NULL, '2022-04-22 07:51:10');
INSERT INTO `upload` VALUES (124, 'Jy8Wr83K2uJOf128c00d236030315613ce9bc9130492.png', '素材', '/uploads/2022/04/f128c00d236030315613ce9bc9130492.png', 37, NULL, NULL, '2022-04-22 07:51:14');
INSERT INTO `upload` VALUES (125, 'wX2Lt9A8cowc81af1ccbfb11616793113c488d6f4d3b.png', '素材', '/uploads/2022/04/81af1ccbfb11616793113c488d6f4d3b.png', 37, NULL, NULL, '2022-04-22 07:51:14');
INSERT INTO `upload` VALUES (126, 'F5OMWsihFTxXfff312d1544eddf8117e0ac77053c6e2.png', '素材', '/uploads/2022/04/fff312d1544eddf8117e0ac77053c6e2.png', 37, NULL, NULL, '2022-04-22 07:53:05');
INSERT INTO `upload` VALUES (127, '9oYlev6kPOkc81af1ccbfb11616793113c488d6f4d3b.png', '素材', '/uploads/2022/04/81af1ccbfb11616793113c488d6f4d3b.png', 37, NULL, NULL, '2022-04-22 07:53:05');
INSERT INTO `upload` VALUES (128, 'kgh4wuiRxX8r072b291e343d380d779487254fd2f0af.png', '素材', '/uploads/2022/04/072b291e343d380d779487254fd2f0af.png', 37, NULL, NULL, '2022-04-22 07:53:33');
INSERT INTO `upload` VALUES (129, 'jq2tsSixq2EG3002ac9d60aaaa7abb77489453998c77.png', '素材', '/uploads/2022/04/3002ac9d60aaaa7abb77489453998c77.png', 37, NULL, NULL, '2022-04-22 07:53:33');
INSERT INTO `upload` VALUES (130, 'dmyb7yyyXPhM81af1ccbfb11616793113c488d6f4d3b.png', '素材', '/uploads/2022/04/81af1ccbfb11616793113c488d6f4d3b.png', 37, NULL, NULL, '2022-04-22 07:55:02');
INSERT INTO `upload` VALUES (131, 'fRpNpBsJ0yycfff312d1544eddf8117e0ac77053c6e2.png', '素材', '/uploads/2022/04/fff312d1544eddf8117e0ac77053c6e2.png', 37, NULL, NULL, '2022-04-22 07:55:02');
INSERT INTO `upload` VALUES (132, '3lVSSrqIwxwM3002ac9d60aaaa7abb77489453998c77.png', '素材', '/uploads/2022/04/3002ac9d60aaaa7abb77489453998c77.png', 37, NULL, NULL, '2022-04-22 07:55:27');
INSERT INTO `upload` VALUES (133, '7Z9kaiH85uF9072b291e343d380d779487254fd2f0af.png', '素材', '/uploads/2022/04/072b291e343d380d779487254fd2f0af.png', 37, NULL, NULL, '2022-04-22 07:55:27');
INSERT INTO `upload` VALUES (134, 'ma14ZAYCJ9h594eb68edb53152c2ca7a5a373d59139e.png', '素材', '/uploads/2022/04/94eb68edb53152c2ca7a5a373d59139e.png', 37, NULL, NULL, '2022-04-22 08:09:47');
INSERT INTO `upload` VALUES (135, 'M8c6tUm75T10dd80df0fabdb2b5632ddbfe55f4644e8.png', '素材', '/uploads/2022/04/dd80df0fabdb2b5632ddbfe55f4644e8.png', 37, NULL, NULL, '2022-04-22 08:09:47');
INSERT INTO `upload` VALUES (136, '111.pdf', '素材', '/uploads/2022/04/ef964c3f29e9b23e92568eb8be9abfe6.pdf', 37, NULL, NULL, '2022-04-22 08:15:18');
INSERT INTO `upload` VALUES (137, '111.pdf', '素材', '/uploads/2022/04/ef964c3f29e9b23e92568eb8be9abfe6.pdf', 37, NULL, NULL, '2022-04-22 08:21:13');
INSERT INTO `upload` VALUES (138, 'agjS2XwOtGsefe4feb944e22d70f8f6649b346e5f77e.png', '素材', '/uploads/2022/04/fe4feb944e22d70f8f6649b346e5f77e.png', 37, NULL, NULL, '2022-04-22 09:07:35');
INSERT INTO `upload` VALUES (139, 'n7QY2w2U0Wdla86d7a852ab03441756cb9aadfaa9039.png', '素材', '/uploads/2022/04/a86d7a852ab03441756cb9aadfaa9039.png', 37, NULL, NULL, '2022-04-22 09:07:35');
INSERT INTO `upload` VALUES (140, '4JDlaxLxYuv3072b291e343d380d779487254fd2f0af.png', '素材', '/uploads/2022/04/072b291e343d380d779487254fd2f0af.png', 37, NULL, NULL, '2022-04-22 09:09:42');
INSERT INTO `upload` VALUES (141, 'FBgwCMnw0QAO3002ac9d60aaaa7abb77489453998c77.png', '素材', '/uploads/2022/04/3002ac9d60aaaa7abb77489453998c77.png', 37, NULL, NULL, '2022-04-22 09:09:42');
INSERT INTO `upload` VALUES (142, '3u7ToKhgVN6Jf128c00d236030315613ce9bc9130492.png', '素材', '/uploads/2022/04/f128c00d236030315613ce9bc9130492.png', 37, NULL, NULL, '2022-04-22 09:13:37');
INSERT INTO `upload` VALUES (143, '5J5DS6bHFyu4f128c00d236030315613ce9bc9130492.png', '素材', '/uploads/2022/04/f128c00d236030315613ce9bc9130492.png', 37, NULL, NULL, '2022-04-22 09:17:03');
INSERT INTO `upload` VALUES (144, 'agjS2XwOtGsefe4feb944e22d70f8f6649b346e5f77e.png', '素材', '/uploads/2022/04/fe4feb944e22d70f8f6649b346e5f77e.png', 37, NULL, NULL, '2022-04-22 09:17:03');
INSERT INTO `upload` VALUES (145, 'hXCebuj7Dx7f94eb68edb53152c2ca7a5a373d59139e.png', '素材', '/uploads/2022/04/94eb68edb53152c2ca7a5a373d59139e.png', 37, NULL, NULL, '2022-04-22 09:18:15');
INSERT INTO `upload` VALUES (146, 'kWvvJCyR3c8ffff312d1544eddf8117e0ac77053c6e2.png', '素材', '/uploads/2022/04/fff312d1544eddf8117e0ac77053c6e2.png', 37, NULL, NULL, '2022-04-22 09:18:41');
INSERT INTO `upload` VALUES (147, 'jv3sY3iOXDis94eb68edb53152c2ca7a5a373d59139e.png', '素材', '/uploads/2022/04/94eb68edb53152c2ca7a5a373d59139e.png', 37, NULL, NULL, '2022-04-22 09:18:48');
INSERT INTO `upload` VALUES (148, 'kWvvJCyR3c8ffff312d1544eddf8117e0ac77053c6e2.png', '素材', '/uploads/2022/04/fff312d1544eddf8117e0ac77053c6e2.png', 37, NULL, NULL, '2022-04-22 09:18:48');
INSERT INTO `upload` VALUES (149, '5J5DS6bHFyu4f128c00d236030315613ce9bc9130492.png', '素材', '/uploads/2022/04/f128c00d236030315613ce9bc9130492.png', 37, NULL, NULL, '2022-04-22 09:18:48');
INSERT INTO `upload` VALUES (150, 'h1g33uCudXiZ94eb68edb53152c2ca7a5a373d59139e.png', '素材', '/uploads/2022/04/94eb68edb53152c2ca7a5a373d59139e.png', 37, NULL, NULL, '2022-04-22 09:20:59');
INSERT INTO `upload` VALUES (151, 'E5KeRnFNGkXf94eb68edb53152c2ca7a5a373d59139e.png', '素材', '/uploads/2022/04/94eb68edb53152c2ca7a5a373d59139e.png', 37, NULL, NULL, '2022-04-22 09:22:43');
INSERT INTO `upload` VALUES (152, 'agjS2XwOtGsefe4feb944e22d70f8f6649b346e5f77e.png', '素材', '/uploads/2022/04/fe4feb944e22d70f8f6649b346e5f77e.png', 37, NULL, NULL, '2022-04-22 09:22:43');
INSERT INTO `upload` VALUES (153, '5J5DS6bHFyu4f128c00d236030315613ce9bc9130492.png', '素材', '/uploads/2022/04/f128c00d236030315613ce9bc9130492.png', 37, NULL, NULL, '2022-04-22 09:22:44');
INSERT INTO `upload` VALUES (154, '5YJNpD4G1VMR072b291e343d380d779487254fd2f0af.png', '素材', '/uploads/2022/04/072b291e343d380d779487254fd2f0af.png', 37, NULL, NULL, '2022-04-22 09:22:51');
INSERT INTO `upload` VALUES (155, 'gDaJlN0cDZqp3002ac9d60aaaa7abb77489453998c77.png', '素材', '/uploads/2022/04/3002ac9d60aaaa7abb77489453998c77.png', 37, NULL, NULL, '2022-04-22 09:22:51');
INSERT INTO `upload` VALUES (156, '5J5DS6bHFyu4f128c00d236030315613ce9bc9130492.png', '素材', '/uploads/2022/04/f128c00d236030315613ce9bc9130492.png', 37, NULL, NULL, '2022-04-22 09:23:00');
INSERT INTO `upload` VALUES (157, 'agjS2XwOtGsefe4feb944e22d70f8f6649b346e5f77e.png', '素材', '/uploads/2022/04/fe4feb944e22d70f8f6649b346e5f77e.png', 37, NULL, NULL, '2022-04-22 09:23:00');
INSERT INTO `upload` VALUES (158, 'ACAvWdoQBDYQ94eb68edb53152c2ca7a5a373d59139e.png', '素材', '/uploads/2022/04/94eb68edb53152c2ca7a5a373d59139e.png', 37, NULL, NULL, '2022-04-22 09:43:15');
INSERT INTO `upload` VALUES (159, 'agjS2XwOtGsefe4feb944e22d70f8f6649b346e5f77e.png', '素材', '/uploads/2022/04/fe4feb944e22d70f8f6649b346e5f77e.png', 37, NULL, NULL, '2022-04-22 09:43:16');
INSERT INTO `upload` VALUES (160, '5J5DS6bHFyu4f128c00d236030315613ce9bc9130492.png', '素材', '/uploads/2022/04/f128c00d236030315613ce9bc9130492.png', 37, NULL, NULL, '2022-04-22 09:43:16');
INSERT INTO `upload` VALUES (161, 'KlbuVIbNyL31072b291e343d380d779487254fd2f0af.png', '素材', '/uploads/2022/04/072b291e343d380d779487254fd2f0af.png', 37, NULL, NULL, '2022-04-22 09:43:26');
INSERT INTO `upload` VALUES (162, 'ZleoZh3lcz7Y3002ac9d60aaaa7abb77489453998c77.png', '素材', '/uploads/2022/04/3002ac9d60aaaa7abb77489453998c77.png', 37, NULL, NULL, '2022-04-22 09:43:26');
INSERT INTO `upload` VALUES (163, '5J5DS6bHFyu4f128c00d236030315613ce9bc9130492.png', '素材', '/uploads/2022/04/f128c00d236030315613ce9bc9130492.png', 37, NULL, NULL, '2022-04-22 09:43:42');
INSERT INTO `upload` VALUES (164, 'ACAvWdoQBDYQ94eb68edb53152c2ca7a5a373d59139e.png', '素材', '/uploads/2022/04/94eb68edb53152c2ca7a5a373d59139e.png', 37, NULL, NULL, '2022-04-22 09:43:42');
INSERT INTO `upload` VALUES (165, '12345678.jpg', '素材', '/uploads/2022/04/722c93f6263750d8e8fab3ab3acb38a2.jpg', 37, NULL, NULL, '2022-04-24 00:52:43');
INSERT INTO `upload` VALUES (166, '222.pdf', '素材', '/uploads/2022/04/dc971cde2a25e93e1f79df62819dc519.pdf', 37, NULL, NULL, '2022-04-24 00:52:48');
INSERT INTO `upload` VALUES (167, 'a.mp3', '素材', '/uploads/2022/04/414d6ffb455f569fbf1a34201c660aac.mp3', 37, NULL, NULL, '2022-04-24 00:52:56');
INSERT INTO `upload` VALUES (168, '12345678.jpg', '素材', '/uploads/2022/04/722c93f6263750d8e8fab3ab3acb38a2.jpg', 37, NULL, NULL, '2022-04-24 00:54:05');
INSERT INTO `upload` VALUES (169, '111.pdf', '素材', '/uploads/2022/04/ef964c3f29e9b23e92568eb8be9abfe6.pdf', 37, NULL, NULL, '2022-04-24 00:54:07');
INSERT INTO `upload` VALUES (170, '12345678.jpg', '素材', '/uploads/2022/04/722c93f6263750d8e8fab3ab3acb38a2.jpg', 37, NULL, NULL, '2022-04-24 00:54:45');
INSERT INTO `upload` VALUES (171, '12345678.jpg', '素材', '/uploads/2022/04/722c93f6263750d8e8fab3ab3acb38a2.jpg', 37, NULL, NULL, '2022-04-24 00:54:48');
INSERT INTO `upload` VALUES (172, 'a.mp3', '素材', '/uploads/2022/04/414d6ffb455f569fbf1a34201c660aac.mp3', 37, NULL, NULL, '2022-04-24 00:54:53');
INSERT INTO `upload` VALUES (173, '12345678.jpg', '素材', '/uploads/2022/04/722c93f6263750d8e8fab3ab3acb38a2.jpg', 37, NULL, NULL, '2022-04-24 00:57:12');
INSERT INTO `upload` VALUES (174, 'a.mp3', '素材', '/uploads/2022/04/414d6ffb455f569fbf1a34201c660aac.mp3', 37, NULL, NULL, '2022-04-24 00:57:15');
INSERT INTO `upload` VALUES (175, '222.pdf', '素材', '/uploads/2022/04/dc971cde2a25e93e1f79df62819dc519.pdf', 37, NULL, NULL, '2022-04-24 00:57:18');
INSERT INTO `upload` VALUES (176, '12345678.jpg', '素材', '/uploads/2022/04/722c93f6263750d8e8fab3ab3acb38a2.jpg', 37, NULL, NULL, '2022-04-24 00:58:33');
INSERT INTO `upload` VALUES (177, '222.pdf', '素材', '/uploads/2022/04/dc971cde2a25e93e1f79df62819dc519.pdf', 37, NULL, NULL, '2022-04-24 00:58:36');
INSERT INTO `upload` VALUES (178, '12345678.jpg', '素材', '/uploads/2022/04/722c93f6263750d8e8fab3ab3acb38a2.jpg', 37, NULL, NULL, '2022-04-24 01:01:11');
INSERT INTO `upload` VALUES (179, 'a.mp3', '素材', '/uploads/2022/04/414d6ffb455f569fbf1a34201c660aac.mp3', 37, NULL, NULL, '2022-04-24 01:01:14');
INSERT INTO `upload` VALUES (180, '12345678.jpg', '素材', '/uploads/2022/04/722c93f6263750d8e8fab3ab3acb38a2.jpg', 37, NULL, NULL, '2022-04-24 01:01:46');
INSERT INTO `upload` VALUES (181, '222.pdf', '素材', '/uploads/2022/04/dc971cde2a25e93e1f79df62819dc519.pdf', 37, NULL, NULL, '2022-04-24 01:01:51');
INSERT INTO `upload` VALUES (182, '12345678.jpg', '素材', '/uploads/2022/04/722c93f6263750d8e8fab3ab3acb38a2.jpg', 37, NULL, NULL, '2022-04-24 01:08:15');
INSERT INTO `upload` VALUES (183, '12345678.jpg', '素材', '/uploads/2022/04/722c93f6263750d8e8fab3ab3acb38a2.jpg', 37, NULL, NULL, '2022-04-24 01:08:41');
INSERT INTO `upload` VALUES (184, '222.pdf', '素材', '/uploads/2022/04/dc971cde2a25e93e1f79df62819dc519.pdf', 37, NULL, NULL, '2022-04-24 01:08:44');
INSERT INTO `upload` VALUES (185, 'a.mp3', '素材', '/uploads/2022/04/414d6ffb455f569fbf1a34201c660aac.mp3', 37, NULL, NULL, '2022-04-24 01:08:47');
INSERT INTO `upload` VALUES (186, 'LouHgykmm4uhfff312d1544eddf8117e0ac77053c6e2.png', '素材', '/uploads/2022/04/fff312d1544eddf8117e0ac77053c6e2.png', 37, NULL, NULL, '2022-04-24 02:48:50');
INSERT INTO `upload` VALUES (187, 'KoHnsmPYMSlL81af1ccbfb11616793113c488d6f4d3b.png', '素材', '/uploads/2022/04/81af1ccbfb11616793113c488d6f4d3b.png', 37, NULL, NULL, '2022-04-24 02:48:50');
INSERT INTO `upload` VALUES (188, 'MuEygexojFyV82b9c7a5a3f405032b1db71a25f67021.png', '素材', '/uploads/2022/04/82b9c7a5a3f405032b1db71a25f67021.png', 37, NULL, NULL, '2022-04-24 02:50:56');
INSERT INTO `upload` VALUES (189, 'KoHnsmPYMSlL81af1ccbfb11616793113c488d6f4d3b.png', '素材', '/uploads/2022/04/81af1ccbfb11616793113c488d6f4d3b.png', 37, NULL, NULL, '2022-04-24 02:50:56');
INSERT INTO `upload` VALUES (190, 'b84ahXgrrXLv072b291e343d380d779487254fd2f0af.png', '素材', '/uploads/2022/04/072b291e343d380d779487254fd2f0af.png', 37, NULL, NULL, '2022-04-24 02:51:04');
INSERT INTO `upload` VALUES (191, 'Z0XDlnL2snLW3002ac9d60aaaa7abb77489453998c77.png', '素材', '/uploads/2022/04/3002ac9d60aaaa7abb77489453998c77.png', 37, NULL, NULL, '2022-04-24 02:51:04');
INSERT INTO `upload` VALUES (192, 'tOFvTliKPDZr0ff637f27d1ca7fca5d8c62d4ec01c17.png', '素材', '/uploads/2022/04/0ff637f27d1ca7fca5d8c62d4ec01c17.png', 37, NULL, NULL, '2022-04-24 02:53:35');
INSERT INTO `upload` VALUES (193, 'kiOygbwnTHPo94eb68edb53152c2ca7a5a373d59139e.png', '素材', '/uploads/2022/04/94eb68edb53152c2ca7a5a373d59139e.png', 37, NULL, NULL, '2022-04-24 02:53:35');
INSERT INTO `upload` VALUES (194, 'ZycYbKVR1dxjdeb6746b4ad489edbc87a1105b4bfe7a.png', '素材', '/uploads/2022/04/deb6746b4ad489edbc87a1105b4bfe7a.png', 37, NULL, NULL, '2022-04-24 02:53:53');
INSERT INTO `upload` VALUES (195, 'epMVjhAEBr3Rfe4feb944e22d70f8f6649b346e5f77e.png', '素材', '/uploads/2022/04/fe4feb944e22d70f8f6649b346e5f77e.png', 37, NULL, NULL, '2022-04-24 02:53:53');
INSERT INTO `upload` VALUES (196, 'movie.mp4', '素材', '/uploads/2022/04/3cf571d4cf2a4c4b2df823a27852a7d5.mp4', 37, NULL, NULL, '2022-04-24 03:14:50');
INSERT INTO `upload` VALUES (197, 'AP4vwFFNMV7afff312d1544eddf8117e0ac77053c6e2.png', '素材', '/uploads/2022/04/fff312d1544eddf8117e0ac77053c6e2.png', 37, NULL, NULL, '2022-04-24 06:55:02');
INSERT INTO `upload` VALUES (198, 'QEGFw9I9RwAn81af1ccbfb11616793113c488d6f4d3b.png', '素材', '/uploads/2022/04/81af1ccbfb11616793113c488d6f4d3b.png', 37, NULL, NULL, '2022-04-24 06:55:02');
INSERT INTO `upload` VALUES (199, 'thxLML0XviuH072b291e343d380d779487254fd2f0af.png', '素材', '/uploads/2022/04/072b291e343d380d779487254fd2f0af.png', 37, NULL, NULL, '2022-04-24 06:55:12');
INSERT INTO `upload` VALUES (200, 'kNrFIzboeBin3002ac9d60aaaa7abb77489453998c77.png', '素材', '/uploads/2022/04/3002ac9d60aaaa7abb77489453998c77.png', 37, NULL, NULL, '2022-04-24 06:55:12');
INSERT INTO `upload` VALUES (201, 'assets.png', '素材', '/uploads/2022/04/9e0fcba209052f63a56ed59c365047c3.png', 37, NULL, NULL, '2022-04-24 07:06:29');
INSERT INTO `upload` VALUES (202, 'dnl0eQCs6y81a86d7a852ab03441756cb9aadfaa9039.png', '素材', '/uploads/2022/04/a86d7a852ab03441756cb9aadfaa9039.png', 37, NULL, NULL, '2022-04-24 08:06:06');
INSERT INTO `upload` VALUES (203, 'AP4vwFFNMV7afff312d1544eddf8117e0ac77053c6e2.png', '素材', '/uploads/2022/04/fff312d1544eddf8117e0ac77053c6e2.png', 37, NULL, NULL, '2022-04-24 08:06:06');
INSERT INTO `upload` VALUES (204, 'QEGFw9I9RwAn81af1ccbfb11616793113c488d6f4d3b.png', '素材', '/uploads/2022/04/81af1ccbfb11616793113c488d6f4d3b.png', 37, NULL, NULL, '2022-04-24 08:06:06');
INSERT INTO `upload` VALUES (205, 'dnl0eQCs6y81a86d7a852ab03441756cb9aadfaa9039.png', '素材', '/uploads/2022/04/a86d7a852ab03441756cb9aadfaa9039.png', 37, NULL, NULL, '2022-04-24 08:11:39');
INSERT INTO `upload` VALUES (206, 'QEGFw9I9RwAn81af1ccbfb11616793113c488d6f4d3b.png', '素材', '/uploads/2022/04/81af1ccbfb11616793113c488d6f4d3b.png', 37, NULL, NULL, '2022-04-24 08:11:39');
INSERT INTO `upload` VALUES (207, 'thxLML0XviuH072b291e343d380d779487254fd2f0af.png', '素材', '/uploads/2022/04/072b291e343d380d779487254fd2f0af.png', 37, NULL, NULL, '2022-04-24 08:11:48');
INSERT INTO `upload` VALUES (208, 'tmp_042dc944e168d9bd022932d7e5f4b7d8.jpg', '素材', '/uploads/2022/04/9c8dd283393d40d3151e33d5e3cc6858.jpg', 37, NULL, NULL, '2022-04-24 08:27:36');
INSERT INTO `upload` VALUES (209, '111.pdf', '素材', '/uploads/2022/04/ef964c3f29e9b23e92568eb8be9abfe6.pdf', 37, NULL, NULL, '2022-04-24 09:12:08');
INSERT INTO `upload` VALUES (210, 'lanmu.png', '素材', '/uploads/2022/04/dd80df0fabdb2b5632ddbfe55f4644e8.png', 37, NULL, NULL, '2022-04-24 09:12:59');
INSERT INTO `upload` VALUES (211, 'lingdao.png', '素材', '/uploads/2022/04/94eb68edb53152c2ca7a5a373d59139e.png', 37, NULL, NULL, '2022-04-24 09:13:27');
INSERT INTO `upload` VALUES (212, 'test-button.png', '素材', '/uploads/2022/04/82b9c7a5a3f405032b1db71a25f67021.png', 37, NULL, NULL, '2022-04-24 09:14:00');
INSERT INTO `upload` VALUES (213, 'lingdao.png', '素材', '/uploads/2022/04/94eb68edb53152c2ca7a5a373d59139e.png', 37, NULL, NULL, '2022-04-24 09:14:04');
INSERT INTO `upload` VALUES (214, 'nodata.png', '素材', '/uploads/2022/04/8ac82ec5d4ae7c02b058a335ea6733f6.png', 37, NULL, NULL, '2022-04-24 09:14:51');
INSERT INTO `upload` VALUES (215, 'play.png', '素材', '/uploads/2022/04/fb1700861891b1cb0572d6b2fbdc6869.png', 37, NULL, NULL, '2022-04-24 09:14:55');
INSERT INTO `upload` VALUES (216, 'tmp_bad6eedf605c6473c7c71876324c9e9d98de297ec3a73a9e.jpg', '素材', '/uploads/2022/04/808e63415635331aa286dd215f616604.jpg', 44, NULL, NULL, '2022-04-24 09:34:29');
INSERT INTO `upload` VALUES (217, 'nodata.png', '素材', '/uploads/2022/04/8ac82ec5d4ae7c02b058a335ea6733f6.png', 45, NULL, NULL, '2022-04-25 07:22:12');
INSERT INTO `upload` VALUES (218, 'lingdao.png', '素材', '/uploads/2022/04/94eb68edb53152c2ca7a5a373d59139e.png', 45, NULL, NULL, '2022-04-25 07:22:39');
INSERT INTO `upload` VALUES (219, 'lingdao.png', '素材', '/uploads/2022/04/94eb68edb53152c2ca7a5a373d59139e.png', 45, NULL, NULL, '2022-04-25 07:22:48');
INSERT INTO `upload` VALUES (220, 'backleft.png', '素材', '/uploads/2022/04/81af1ccbfb11616793113c488d6f4d3b.png', 45, NULL, NULL, '2022-04-25 07:22:50');
INSERT INTO `upload` VALUES (221, 'z06.png', '素材', '/uploads/2022/04/29d29e97cc897e58eb28a184f2766741.png', 45, NULL, NULL, '2022-04-25 07:22:59');
INSERT INTO `upload` VALUES (222, 'tmp_0828b465a0a6ec80135bdbca9eb9d08c.jpg', '素材', '/uploads/2022/04/6593ebb89146ca49232137853bb5d710.jpg', 45, NULL, NULL, '2022-04-25 07:32:16');
INSERT INTO `upload` VALUES (223, 'tmp_e306852801b80e2e411fac20d102d211.jpg', '素材', '/uploads/2022/05/19845a33a8d3f03ff9786ce849dde845.jpg', 45, NULL, NULL, '2022-05-06 02:27:00');
INSERT INTO `upload` VALUES (224, 'jBqvg9mR9P00722c93f6263750d8e8fab3ab3acb38a2.jpg', '素材', '/uploads/2022/05/722c93f6263750d8e8fab3ab3acb38a2.jpg', 46, NULL, NULL, '2022-05-11 07:47:03');
INSERT INTO `upload` VALUES (225, '38YipPrtu3HG9e0fcba209052f63a56ed59c365047c3.png', '素材', '/uploads/2022/05/9e0fcba209052f63a56ed59c365047c3.png', 46, NULL, NULL, '2022-05-11 07:52:32');
INSERT INTO `upload` VALUES (226, 'Dk7rNnmMC9wp9e0fcba209052f63a56ed59c365047c3.png', '素材', '/uploads/2022/05/9e0fcba209052f63a56ed59c365047c3.png', 46, NULL, NULL, '2022-05-11 08:01:34');
INSERT INTO `upload` VALUES (227, 'o6PVSLUUIRA29e0fcba209052f63a56ed59c365047c3.png', '素材', '/uploads/2022/05/9e0fcba209052f63a56ed59c365047c3.png', 46, NULL, NULL, '2022-05-11 08:22:24');
INSERT INTO `upload` VALUES (228, 'jBqvg9mR9P00722c93f6263750d8e8fab3ab3acb38a2.jpg', '素材', '/uploads/2022/05/722c93f6263750d8e8fab3ab3acb38a2.jpg', 46, NULL, NULL, '2022-05-11 08:22:24');
INSERT INTO `upload` VALUES (229, 'vIzIuZe2uGxO9e0fcba209052f63a56ed59c365047c3.png', '素材', '/uploads/2022/05/9e0fcba209052f63a56ed59c365047c3.png', 46, NULL, NULL, '2022-05-11 08:22:46');
INSERT INTO `upload` VALUES (230, 'jBqvg9mR9P00722c93f6263750d8e8fab3ab3acb38a2.jpg', '素材', '/uploads/2022/05/722c93f6263750d8e8fab3ab3acb38a2.jpg', 46, NULL, NULL, '2022-05-11 08:22:46');
INSERT INTO `upload` VALUES (231, '4tgE7RoAr4XF22f51ae45d8d33f7d48da084c16decd6.png', '素材', '/uploads/2022/05/22f51ae45d8d33f7d48da084c16decd6.png', 46, NULL, NULL, '2022-05-11 08:26:44');
INSERT INTO `upload` VALUES (232, 'vIzIuZe2uGxO9e0fcba209052f63a56ed59c365047c3.png', '素材', '/uploads/2022/05/9e0fcba209052f63a56ed59c365047c3.png', 46, NULL, NULL, '2022-05-11 08:26:44');
INSERT INTO `upload` VALUES (233, 'jBqvg9mR9P00722c93f6263750d8e8fab3ab3acb38a2.jpg', '素材', '/uploads/2022/05/722c93f6263750d8e8fab3ab3acb38a2.jpg', 46, NULL, NULL, '2022-05-11 08:26:44');
INSERT INTO `upload` VALUES (234, 'VjLkH4Wn7mrBfff312d1544eddf8117e0ac77053c6e2.png', '素材', '/uploads/2022/05/fff312d1544eddf8117e0ac77053c6e2.png', 46, NULL, NULL, '2022-05-11 08:30:09');
INSERT INTO `upload` VALUES (235, 'kIpNdXzEWz2R81af1ccbfb11616793113c488d6f4d3b.png', '素材', '/uploads/2022/05/81af1ccbfb11616793113c488d6f4d3b.png', 46, NULL, NULL, '2022-05-11 08:30:09');
INSERT INTO `upload` VALUES (236, 'VamVJokVS4O894eb68edb53152c2ca7a5a373d59139e.png', '素材', '/uploads/2022/05/94eb68edb53152c2ca7a5a373d59139e.png', 46, NULL, NULL, '2022-05-11 08:40:41');
INSERT INTO `upload` VALUES (237, 'jBqvg9mR9P00722c93f6263750d8e8fab3ab3acb38a2.jpg', '素材', '/uploads/2022/05/722c93f6263750d8e8fab3ab3acb38a2.jpg', 46, NULL, NULL, '2022-05-11 08:40:41');
INSERT INTO `upload` VALUES (238, 'vIzIuZe2uGxO9e0fcba209052f63a56ed59c365047c3.png', '素材', '/uploads/2022/05/9e0fcba209052f63a56ed59c365047c3.png', 46, NULL, NULL, '2022-05-11 08:40:41');
INSERT INTO `upload` VALUES (239, '4tgE7RoAr4XF22f51ae45d8d33f7d48da084c16decd6.png', '素材', '/uploads/2022/05/22f51ae45d8d33f7d48da084c16decd6.png', 46, NULL, NULL, '2022-05-11 08:40:41');
INSERT INTO `upload` VALUES (240, 'ger1mFLeoXBq94eb68edb53152c2ca7a5a373d59139e.png', '素材', '/uploads/2022/05/94eb68edb53152c2ca7a5a373d59139e.png', 46, NULL, NULL, '2022-05-11 08:40:53');
INSERT INTO `upload` VALUES (241, 'jBqvg9mR9P00722c93f6263750d8e8fab3ab3acb38a2.jpg', '素材', '/uploads/2022/05/722c93f6263750d8e8fab3ab3acb38a2.jpg', 46, NULL, NULL, '2022-05-11 08:40:53');
INSERT INTO `upload` VALUES (242, 'vIzIuZe2uGxO9e0fcba209052f63a56ed59c365047c3.png', '素材', '/uploads/2022/05/9e0fcba209052f63a56ed59c365047c3.png', 46, NULL, NULL, '2022-05-11 08:40:53');
INSERT INTO `upload` VALUES (243, '4tgE7RoAr4XF22f51ae45d8d33f7d48da084c16decd6.png', '素材', '/uploads/2022/05/22f51ae45d8d33f7d48da084c16decd6.png', 46, NULL, NULL, '2022-05-11 08:40:53');
INSERT INTO `upload` VALUES (244, 'opkklGTvRFr8072b291e343d380d779487254fd2f0af.png', '素材', '/uploads/2022/05/072b291e343d380d779487254fd2f0af.png', 46, NULL, NULL, '2022-05-11 08:41:11');
INSERT INTO `upload` VALUES (245, 'o7rVPSREyJ1V3002ac9d60aaaa7abb77489453998c77.png', '素材', '/uploads/2022/05/3002ac9d60aaaa7abb77489453998c77.png', 46, NULL, NULL, '2022-05-11 08:41:11');
INSERT INTO `upload` VALUES (246, 'IJQZplEIJV6H072b291e343d380d779487254fd2f0af.png', '素材', '/uploads/2022/05/072b291e343d380d779487254fd2f0af.png', 46, NULL, NULL, '2022-05-11 08:45:15');
INSERT INTO `upload` VALUES (247, 'tJxfrsVQIjK73002ac9d60aaaa7abb77489453998c77.png', '素材', '/uploads/2022/05/3002ac9d60aaaa7abb77489453998c77.png', 46, NULL, NULL, '2022-05-11 08:45:15');
INSERT INTO `upload` VALUES (248, 'ger1mFLeoXBq94eb68edb53152c2ca7a5a373d59139e.png', '素材', '/uploads/2022/05/94eb68edb53152c2ca7a5a373d59139e.png', 46, NULL, NULL, '2022-05-11 08:45:15');
INSERT INTO `upload` VALUES (249, '4tgE7RoAr4XF22f51ae45d8d33f7d48da084c16decd6.png', '素材', '/uploads/2022/05/22f51ae45d8d33f7d48da084c16decd6.png', 46, NULL, NULL, '2022-05-11 08:45:15');
INSERT INTO `upload` VALUES (250, 'tmp_eb292576376b104eb5e17d32231c5c30.jpg', '素材', '/uploads/2022/05/6355328bd163d8af36d5b7fd11010adb.jpg', 46, NULL, NULL, '2022-05-11 09:04:09');
INSERT INTO `upload` VALUES (251, 'Ps1brGRtGcLl94eb68edb53152c2ca7a5a373d59139e.png', '素材', '/uploads/2022/05/94eb68edb53152c2ca7a5a373d59139e.png', 46, NULL, NULL, '2022-05-11 09:04:45');
INSERT INTO `upload` VALUES (252, 'tmp_9c82e1dc7bca4cde6374ec0ba1379128.jpg', '素材', '/uploads/2022/05/e54d9e36b0abf5d282efe0a15d193626.jpg', 46, NULL, NULL, '2022-05-11 09:09:03');
INSERT INTO `upload` VALUES (253, 'tmp_eb292576376b104eb5e17d32231c5c30.jpg', '素材', '/uploads/2022/05/6355328bd163d8af36d5b7fd11010adb.jpg', 46, NULL, NULL, '2022-05-11 09:09:03');
INSERT INTO `upload` VALUES (254, 'tmp_7be8b2f21ad3018b63e85a3e3c068658.jpg', '素材', '/uploads/2022/05/f7c531f5a621f6766c6024ab1589d9fe.jpg', 46, NULL, NULL, '2022-05-11 09:09:21');
INSERT INTO `upload` VALUES (255, 'GJ3k3b5KjmZzf128c00d236030315613ce9bc9130492.png', '素材', '/uploads/2022/05/f128c00d236030315613ce9bc9130492.png', 46, NULL, NULL, '2022-05-11 09:13:46');
INSERT INTO `upload` VALUES (256, 'qaO2IJ86Wvuof128c00d236030315613ce9bc9130492.png', '素材', '/uploads/2022/05/f128c00d236030315613ce9bc9130492.png', 46, NULL, NULL, '2022-05-11 09:15:54');
INSERT INTO `upload` VALUES (257, 'tmp_32a25158f33b62d6bfb4d1785a10f101.jpg', '素材', '/uploads/2022/05/28be8944d46692964a2bbabb59d3067c.jpg', 46, NULL, NULL, '2022-05-11 09:31:51');
INSERT INTO `upload` VALUES (258, 'tmp_eb292576376b104eb5e17d32231c5c30.jpg', '素材', '/uploads/2022/05/6355328bd163d8af36d5b7fd11010adb.jpg', 46, NULL, NULL, '2022-05-11 09:43:12');
INSERT INTO `upload` VALUES (259, 'tmp_eb292576376b104eb5e17d32231c5c30.jpg', '素材', '/uploads/2022/05/6355328bd163d8af36d5b7fd11010adb.jpg', 46, NULL, NULL, '2022-05-11 09:48:44');
INSERT INTO `upload` VALUES (260, 'tmp_e23dc95d9a31ed1284342ec4fe3fab98.jpg', '素材', '/uploads/2022/05/8dc08346d445a1e03fca4c02e5a738e9.jpg', 46, NULL, NULL, '2022-05-11 09:48:54');
INSERT INTO `upload` VALUES (261, 'tmp_eb292576376b104eb5e17d32231c5c30.jpg', '素材', '/uploads/2022/05/6355328bd163d8af36d5b7fd11010adb.jpg', 46, NULL, NULL, '2022-05-11 09:48:55');
INSERT INTO `upload` VALUES (262, 'tmp_e23dc95d9a31ed1284342ec4fe3fab98.jpg', '素材', '/uploads/2022/05/8dc08346d445a1e03fca4c02e5a738e9.jpg', 46, NULL, NULL, '2022-05-11 09:56:58');
INSERT INTO `upload` VALUES (263, 'tmp_eb292576376b104eb5e17d32231c5c30.jpg', '素材', '/uploads/2022/05/6355328bd163d8af36d5b7fd11010adb.jpg', 46, NULL, NULL, '2022-05-11 09:56:58');
INSERT INTO `upload` VALUES (264, 'kVWadXICQ7qlfff312d1544eddf8117e0ac77053c6e2.png', '素材', '/uploads/2022/05/fff312d1544eddf8117e0ac77053c6e2.png', 46, NULL, NULL, '2022-05-12 00:40:46');
INSERT INTO `upload` VALUES (265, 'x9LzVprSIOwF81af1ccbfb11616793113c488d6f4d3b.png', '素材', '/uploads/2022/05/81af1ccbfb11616793113c488d6f4d3b.png', 46, NULL, NULL, '2022-05-12 00:40:46');
INSERT INTO `upload` VALUES (266, 'ewX8ay95NlBx072b291e343d380d779487254fd2f0af.png', '素材', '/uploads/2022/05/072b291e343d380d779487254fd2f0af.png', 46, NULL, NULL, '2022-05-12 00:46:17');
INSERT INTO `upload` VALUES (267, '4s0HWgC8IpGX3002ac9d60aaaa7abb77489453998c77.png', '素材', '/uploads/2022/05/3002ac9d60aaaa7abb77489453998c77.png', 46, NULL, NULL, '2022-05-12 00:46:17');
INSERT INTO `upload` VALUES (268, 'LS8AHNVpav5J82b9c7a5a3f405032b1db71a25f67021.png', '素材', '/uploads/2022/05/82b9c7a5a3f405032b1db71a25f67021.png', 46, NULL, NULL, '2022-05-12 00:46:51');
INSERT INTO `upload` VALUES (269, 'tmp_14e71fd8d98221c6e683aa291c4d442a.jpg', '素材', '/uploads/2022/05/f7c531f5a621f6766c6024ab1589d9fe.jpg', 46, NULL, NULL, '2022-05-12 00:47:56');
INSERT INTO `upload` VALUES (270, 'tmp_3bc5c08f713bf8baf82aa606718d38f9.jpg', '素材', '/uploads/2022/05/b3fed2da7cac3e0bea1ce32afa7723ae.jpg', 46, NULL, NULL, '2022-05-12 00:47:56');
INSERT INTO `upload` VALUES (271, 'BBTMcCcKuJGEfe4feb944e22d70f8f6649b346e5f77e.png', '素材', '/uploads/2022/05/fe4feb944e22d70f8f6649b346e5f77e.png', 46, NULL, NULL, '2022-05-12 00:50:34');
INSERT INTO `upload` VALUES (272, 'tmp_0b432a4adca7042972262bd5f3f91c19.jpg', '素材', '/uploads/2022/05/cbe30d59114f21c3207306174e47472e.jpg', 46, NULL, NULL, '2022-05-12 00:53:51');
INSERT INTO `upload` VALUES (273, 'tmp_7338119dd8c403f3a5422672c13a9c75.jpg', '素材', '/uploads/2022/05/333aa5de839eda462ae59d85a903cde4.jpg', 46, NULL, NULL, '2022-05-12 00:54:32');
INSERT INTO `upload` VALUES (274, 'tmp_7fa7788b2dc42008f443854ae203d7ea.jpg', '素材', '/uploads/2022/05/e32143fe6136dcac6466dadcc5b892c7.jpg', 46, NULL, NULL, '2022-05-12 00:55:03');
INSERT INTO `upload` VALUES (275, 'AXuj2S1ZVTq681af1ccbfb11616793113c488d6f4d3b.png', '素材', '/uploads/2022/05/81af1ccbfb11616793113c488d6f4d3b.png', 46, NULL, NULL, '2022-05-12 00:55:28');
INSERT INTO `upload` VALUES (276, 'tmp_e5ad3c81151b68371d4f6f753fc3b962.jpg', '素材', '/uploads/2022/05/e54d9e36b0abf5d282efe0a15d193626.jpg', 46, NULL, NULL, '2022-05-12 00:55:49');
INSERT INTO `upload` VALUES (277, 'tmp_595fbe62c4f27a6c275613d0d823911a.jpg', '素材', '/uploads/2022/05/28be8944d46692964a2bbabb59d3067c.jpg', 46, NULL, NULL, '2022-05-12 00:56:05');
INSERT INTO `upload` VALUES (278, 'tmp_5a10ca298e14b617c463646ee6b32835.jpg', '素材', '/uploads/2022/05/d893f2ef9d1055cf78d6d12ea927fe6e.jpg', 46, NULL, NULL, '2022-05-12 00:57:43');
INSERT INTO `upload` VALUES (279, 'qpF0Go3b3WZX82b9c7a5a3f405032b1db71a25f67021.png', '素材', '/uploads/2022/05/82b9c7a5a3f405032b1db71a25f67021.png', 46, NULL, NULL, '2022-05-12 00:58:03');
INSERT INTO `upload` VALUES (280, 'tmp_ca346b49939a7f2f96409b750c5d7ef5.jpg', '素材', '/uploads/2022/05/10ad61ec58c0ba80163f58eece3d0114.jpg', 46, NULL, NULL, '2022-05-12 00:58:26');
INSERT INTO `upload` VALUES (281, 'tmp_3401c561cedde61736ac58677eabbf50.jpg', '素材', '/uploads/2022/05/10ad61ec58c0ba80163f58eece3d0114.jpg', 46, NULL, NULL, '2022-05-12 00:58:52');
INSERT INTO `upload` VALUES (282, 'tmp_df33894de97e4d220d83f4369cd6382e.jpg', '素材', '/uploads/2022/05/0b02b757dbd82aca7fc704877db0797d.jpg', 46, NULL, NULL, '2022-05-12 01:01:17');
INSERT INTO `upload` VALUES (283, 'tmp_74e5c685fb05dc25830011c972fa2b37.jpg', '素材', '/uploads/2022/05/1c56f12e23c4753588d332ade9921962.jpg', 46, NULL, NULL, '2022-05-12 01:01:17');
INSERT INTO `upload` VALUES (284, 'tmp_cb0445d8ea11dcdfeb3058eb6ba5b89b.jpg', '素材', '/uploads/2022/05/38739715a09b63b8b347b931640f10b0.jpg', 46, NULL, NULL, '2022-05-12 01:02:53');
INSERT INTO `upload` VALUES (285, 'tmp_995b484576c572400cc69f210ea3ce1e.jpg', '素材', '/uploads/2022/05/e54d9e36b0abf5d282efe0a15d193626.jpg', 46, NULL, NULL, '2022-05-12 01:05:26');
INSERT INTO `upload` VALUES (286, 'tmp_51ccd57864488f716cbac7a06b654a4f.jpg', '素材', '/uploads/2022/05/05b74baa3be26c973149b567360cd961.jpg', 46, NULL, NULL, '2022-05-12 01:09:08');
INSERT INTO `upload` VALUES (287, 'tmp_995b484576c572400cc69f210ea3ce1e.jpg', '素材', '/uploads/2022/05/e54d9e36b0abf5d282efe0a15d193626.jpg', 46, NULL, NULL, '2022-05-12 01:09:08');
INSERT INTO `upload` VALUES (288, 'tmp_638acb1e892952142845ff948f68a3cb.jpg', '素材', '/uploads/2022/05/c35fc168ca0532a873142353a023c071.jpg', 46, NULL, NULL, '2022-05-12 01:13:48');
INSERT INTO `upload` VALUES (289, 'QJJ930ZQxsHj94eb68edb53152c2ca7a5a373d59139e.png', '素材', '/uploads/2022/05/94eb68edb53152c2ca7a5a373d59139e.png', 46, NULL, NULL, '2022-05-12 01:14:37');
INSERT INTO `upload` VALUES (290, 'HSHo9Drdzq00dd80df0fabdb2b5632ddbfe55f4644e8.png', '素材', '/uploads/2022/05/dd80df0fabdb2b5632ddbfe55f4644e8.png', 46, NULL, NULL, '2022-05-12 01:14:38');
INSERT INTO `upload` VALUES (291, 'uPJRFkgWVKDkf128c00d236030315613ce9bc9130492.png', '素材', '/uploads/2022/05/f128c00d236030315613ce9bc9130492.png', 46, NULL, NULL, '2022-05-12 02:13:39');
INSERT INTO `upload` VALUES (292, 'g3U6pApiu6Krdd80df0fabdb2b5632ddbfe55f4644e8.png', '素材', '/uploads/2022/05/dd80df0fabdb2b5632ddbfe55f4644e8.png', 46, NULL, NULL, '2022-05-12 02:17:12');
INSERT INTO `upload` VALUES (293, 'ivGhjR5yASh494eb68edb53152c2ca7a5a373d59139e.png', '素材', '/uploads/2022/05/94eb68edb53152c2ca7a5a373d59139e.png', 46, NULL, NULL, '2022-05-12 02:22:51');
INSERT INTO `upload` VALUES (294, 'xsZQqoaYFwbNfe4feb944e22d70f8f6649b346e5f77e.png', '素材', '/uploads/2022/05/fe4feb944e22d70f8f6649b346e5f77e.png', 46, NULL, NULL, '2022-05-12 02:26:09');
INSERT INTO `upload` VALUES (295, 'HHDTyGVqRlUP82b9c7a5a3f405032b1db71a25f67021.png', '素材', '/uploads/2022/05/82b9c7a5a3f405032b1db71a25f67021.png', 46, NULL, NULL, '2022-05-12 02:28:03');
INSERT INTO `upload` VALUES (296, 'uRTW6qnRKJyqf2ee44820f0816e1807299d5fd9f152f.png', '素材', '/uploads/2022/05/f2ee44820f0816e1807299d5fd9f152f.png', 46, NULL, NULL, '2022-05-12 02:29:49');
INSERT INTO `upload` VALUES (297, 'tmp_4b4018c219ce68a873a07e30eddcef63.jpg', '素材', '/uploads/2022/05/3f36c4ef4e684d53161d49b32ea43568.jpg', 46, NULL, NULL, '2022-05-12 02:30:42');
INSERT INTO `upload` VALUES (298, 'tmp_2db2a518395becd42a1d7be236561a6e.jpg', '素材', '/uploads/2022/05/10ad61ec58c0ba80163f58eece3d0114.jpg', 46, NULL, NULL, '2022-05-12 02:31:08');
INSERT INTO `upload` VALUES (299, 'mu64cft0DoLFfff312d1544eddf8117e0ac77053c6e2.png', '素材', '/uploads/2022/05/fff312d1544eddf8117e0ac77053c6e2.png', 46, NULL, NULL, '2022-05-12 02:54:04');
INSERT INTO `upload` VALUES (300, 'aSIvSIMFWR0A81af1ccbfb11616793113c488d6f4d3b.png', '素材', '/uploads/2022/05/81af1ccbfb11616793113c488d6f4d3b.png', 46, NULL, NULL, '2022-05-12 02:54:04');
INSERT INTO `upload` VALUES (301, 't5KF3fcwmbHqfe4feb944e22d70f8f6649b346e5f77e.png', '素材', '/uploads/2022/05/fe4feb944e22d70f8f6649b346e5f77e.png', 46, NULL, NULL, '2022-05-12 02:54:20');
INSERT INTO `upload` VALUES (302, 'q7RVNUcdWIvZ22f51ae45d8d33f7d48da084c16decd6.png', '素材', '/uploads/2022/05/22f51ae45d8d33f7d48da084c16decd6.png', 46, NULL, NULL, '2022-05-12 02:54:31');
INSERT INTO `upload` VALUES (303, 't5KF3fcwmbHqfe4feb944e22d70f8f6649b346e5f77e.png', '素材', '/uploads/2022/05/fe4feb944e22d70f8f6649b346e5f77e.png', 46, NULL, NULL, '2022-05-12 02:54:31');
INSERT INTO `upload` VALUES (304, 'tmp_b8f5d0617e478301da597f08c3fd82fd.jpg', '素材', '/uploads/2022/05/32432541bdbc259a99bc6082ad079a29.jpg', 46, NULL, NULL, '2022-05-12 02:56:28');
INSERT INTO `upload` VALUES (305, 'tmp_ff91f5f8a3e708f26afe93ffad27f265.jpg', '素材', '/uploads/2022/05/6184411659b24f83b33312cbe8a0d2b2.jpg', 46, NULL, NULL, '2022-05-12 02:56:38');
INSERT INTO `upload` VALUES (306, 'tmp_b8f5d0617e478301da597f08c3fd82fd.jpg', '素材', '/uploads/2022/05/32432541bdbc259a99bc6082ad079a29.jpg', 46, NULL, NULL, '2022-05-12 02:56:38');
INSERT INTO `upload` VALUES (307, 'tmp_243fd77400ad77868ae43aa0711b941d.jpg', '素材', '/uploads/2022/05/55c34f6f1511949b2dd6f2bc3e587814.jpg', 46, NULL, NULL, '2022-05-12 02:57:22');
INSERT INTO `upload` VALUES (308, 'tmp_b3b32d3c359da9a037500c2000658ff6.jpg', '素材', '/uploads/2022/05/13b16986cd91c58934fb63c17b830a48.jpg', 46, NULL, NULL, '2022-05-12 02:58:13');
INSERT INTO `upload` VALUES (309, 'tmp_243fd77400ad77868ae43aa0711b941d.jpg', '素材', '/uploads/2022/05/55c34f6f1511949b2dd6f2bc3e587814.jpg', 46, NULL, NULL, '2022-05-12 02:58:13');
INSERT INTO `upload` VALUES (310, 'tmp_112a08d28914eeb732bfe94a15e42124.jpg', '素材', '/uploads/2022/05/6184411659b24f83b33312cbe8a0d2b2.jpg', 46, NULL, NULL, '2022-05-12 02:59:56');
INSERT INTO `upload` VALUES (311, 'tmp_efc4dc8d36e60986e0cab3195862be58.jpg', '素材', '/uploads/2022/05/2048c2ca0a00e4776154f00cdb68d994.jpg', 46, NULL, NULL, '2022-05-12 03:00:05');
INSERT INTO `upload` VALUES (312, 'tmp_112a08d28914eeb732bfe94a15e42124.jpg', '素材', '/uploads/2022/05/6184411659b24f83b33312cbe8a0d2b2.jpg', 46, NULL, NULL, '2022-05-12 03:00:05');
INSERT INTO `upload` VALUES (313, 'zBbf0rmtNrcj81af1ccbfb11616793113c488d6f4d3b.png', '素材', '/uploads/2022/05/81af1ccbfb11616793113c488d6f4d3b.png', 46, NULL, NULL, '2022-05-12 09:43:51');
INSERT INTO `upload` VALUES (314, '22PKwbkQ8cWt81af1ccbfb11616793113c488d6f4d3b.png', '素材', '/uploads/2022/05/81af1ccbfb11616793113c488d6f4d3b.png', 46, NULL, NULL, '2022-05-12 09:45:32');
INSERT INTO `upload` VALUES (315, '3i3YxJftnK4S81af1ccbfb11616793113c488d6f4d3b.png', '素材', '/uploads/2022/05/81af1ccbfb11616793113c488d6f4d3b.png', 46, NULL, NULL, '2022-05-12 09:46:21');
INSERT INTO `upload` VALUES (316, '3lobPzukOodyf128c00d236030315613ce9bc9130492.png', '素材', '/uploads/2022/05/f128c00d236030315613ce9bc9130492.png', 46, NULL, NULL, '2022-05-12 09:47:33');
INSERT INTO `upload` VALUES (317, 'TQEYadofbn3Hfff312d1544eddf8117e0ac77053c6e2.png', '素材', '/uploads/2022/05/fff312d1544eddf8117e0ac77053c6e2.png', 46, NULL, NULL, '2022-05-12 09:47:33');
INSERT INTO `upload` VALUES (318, 'aimQ7K0kwQ7d94eb68edb53152c2ca7a5a373d59139e.png', '素材', '/uploads/2022/05/94eb68edb53152c2ca7a5a373d59139e.png', 46, NULL, NULL, '2022-05-12 09:48:22');
INSERT INTO `upload` VALUES (319, 'z8ZPJFg7Fhxtdd80df0fabdb2b5632ddbfe55f4644e8.png', '素材', '/uploads/2022/05/dd80df0fabdb2b5632ddbfe55f4644e8.png', 46, NULL, NULL, '2022-05-12 09:48:22');
INSERT INTO `upload` VALUES (320, 'lnXxU8piPVXZfff312d1544eddf8117e0ac77053c6e2.png', '素材', '/uploads/2022/05/fff312d1544eddf8117e0ac77053c6e2.png', 46, NULL, NULL, '2022-05-12 09:50:21');
INSERT INTO `upload` VALUES (321, 'L95V5r9NBxpo82b9c7a5a3f405032b1db71a25f67021.png', '素材', '/uploads/2022/05/82b9c7a5a3f405032b1db71a25f67021.png', 46, NULL, NULL, '2022-05-12 09:53:16');
INSERT INTO `upload` VALUES (322, 'VCcvdWIX0D96a86d7a852ab03441756cb9aadfaa9039.png', '素材', '/uploads/2022/05/a86d7a852ab03441756cb9aadfaa9039.png', 46, NULL, NULL, '2022-05-12 10:05:57');
INSERT INTO `upload` VALUES (323, 'tmp_c22467455c28668072c531a43a60421c.jpg', '素材', '/uploads/2022/05/6184411659b24f83b33312cbe8a0d2b2.jpg', 46, NULL, NULL, '2022-05-12 10:06:39');
INSERT INTO `upload` VALUES (324, 'Jl4MFHGBwj7Qdd80df0fabdb2b5632ddbfe55f4644e8.png', '素材', '/uploads/2022/05/dd80df0fabdb2b5632ddbfe55f4644e8.png', 46, NULL, NULL, '2022-05-12 10:16:28');
INSERT INTO `upload` VALUES (325, 'o4PjFWK7er3Bfff312d1544eddf8117e0ac77053c6e2.png', '素材', '/uploads/2022/05/fff312d1544eddf8117e0ac77053c6e2.png', 46, NULL, NULL, '2022-05-12 10:16:29');
INSERT INTO `upload` VALUES (326, 'eUzsSi8ka0Up81af1ccbfb11616793113c488d6f4d3b.png', '素材', '/uploads/2022/05/81af1ccbfb11616793113c488d6f4d3b.png', 46, NULL, NULL, '2022-05-12 10:16:29');
INSERT INTO `upload` VALUES (327, 'yhIajrSqt403a86d7a852ab03441756cb9aadfaa9039.png', '素材', '/uploads/2022/05/a86d7a852ab03441756cb9aadfaa9039.png', 46, NULL, NULL, '2022-05-12 10:16:29');
INSERT INTO `upload` VALUES (328, 'MaxixW8lkVIP072b291e343d380d779487254fd2f0af.png', '素材', '/uploads/2022/05/072b291e343d380d779487254fd2f0af.png', 46, NULL, NULL, '2022-05-12 10:16:51');
INSERT INTO `upload` VALUES (329, '3o9BKJrmetbW3002ac9d60aaaa7abb77489453998c77.png', '素材', '/uploads/2022/05/3002ac9d60aaaa7abb77489453998c77.png', 46, NULL, NULL, '2022-05-12 10:16:51');
INSERT INTO `upload` VALUES (330, 'ljG8n4NIBsv922f51ae45d8d33f7d48da084c16decd6.png', '素材', '/uploads/2022/05/22f51ae45d8d33f7d48da084c16decd6.png', 46, NULL, NULL, '2022-05-12 10:23:45');
INSERT INTO `upload` VALUES (331, 'ryalO3CoLvU5a86d7a852ab03441756cb9aadfaa9039.png', '素材', '/uploads/2022/05/a86d7a852ab03441756cb9aadfaa9039.png', 46, NULL, NULL, '2022-05-12 11:28:13');
INSERT INTO `upload` VALUES (332, 'pCwtsa9RCWwfa86d7a852ab03441756cb9aadfaa9039.png', '素材', '/uploads/2022/05/a86d7a852ab03441756cb9aadfaa9039.png', 46, NULL, NULL, '2022-05-12 11:33:15');
INSERT INTO `upload` VALUES (333, 'elhHCnh4qOQ4a86d7a852ab03441756cb9aadfaa9039.png', '素材', '/uploads/2022/05/a86d7a852ab03441756cb9aadfaa9039.png', 46, NULL, NULL, '2022-05-12 11:34:21');
INSERT INTO `upload` VALUES (334, 'KUt8WrM0xSPvfff312d1544eddf8117e0ac77053c6e2.png', '素材', '/uploads/2022/05/fff312d1544eddf8117e0ac77053c6e2.png', 46, NULL, NULL, '2022-05-12 11:35:00');
INSERT INTO `upload` VALUES (335, 'GC8dbdqfqF0R81af1ccbfb11616793113c488d6f4d3b.png', '素材', '/uploads/2022/05/81af1ccbfb11616793113c488d6f4d3b.png', 46, NULL, NULL, '2022-05-12 11:35:00');
INSERT INTO `upload` VALUES (336, 'moU6n6IwB9zva86d7a852ab03441756cb9aadfaa9039.png', '素材', '/uploads/2022/05/a86d7a852ab03441756cb9aadfaa9039.png', 46, NULL, NULL, '2022-05-12 11:35:00');
INSERT INTO `upload` VALUES (337, 'KUt8WrM0xSPvfff312d1544eddf8117e0ac77053c6e2.png', '素材', '/uploads/2022/05/fff312d1544eddf8117e0ac77053c6e2.png', 46, NULL, NULL, '2022-05-12 11:35:03');
INSERT INTO `upload` VALUES (338, 'moU6n6IwB9zva86d7a852ab03441756cb9aadfaa9039.png', '素材', '/uploads/2022/05/a86d7a852ab03441756cb9aadfaa9039.png', 46, NULL, NULL, '2022-05-12 11:35:03');
INSERT INTO `upload` VALUES (339, 'i9adf3pxjKHcfff312d1544eddf8117e0ac77053c6e2.png', '素材', '/uploads/2022/05/fff312d1544eddf8117e0ac77053c6e2.png', 46, NULL, NULL, '2022-05-13 00:19:08');
INSERT INTO `upload` VALUES (340, 'LClfZ4Trn6ay81af1ccbfb11616793113c488d6f4d3b.png', '素材', '/uploads/2022/05/81af1ccbfb11616793113c488d6f4d3b.png', 46, NULL, NULL, '2022-05-13 00:19:08');
INSERT INTO `upload` VALUES (341, 'NudVm3A0RBah81af1ccbfb11616793113c488d6f4d3b.png', '素材', '/uploads/2022/05/81af1ccbfb11616793113c488d6f4d3b.png', 46, NULL, NULL, '2022-05-13 00:26:34');
INSERT INTO `upload` VALUES (342, 'DpKSjbhuMWFef128c00d236030315613ce9bc9130492.png', '素材', '/uploads/2022/05/f128c00d236030315613ce9bc9130492.png', 46, NULL, NULL, '2022-05-13 00:34:14');
INSERT INTO `upload` VALUES (343, 'dJ02FgJyK319f128c00d236030315613ce9bc9130492.png', '素材', '/uploads/2022/05/f128c00d236030315613ce9bc9130492.png', 46, NULL, NULL, '2022-05-13 00:43:48');
INSERT INTO `upload` VALUES (344, 'tmp_62b48bfcbd541b238c3c514273aa28f9.jpg', '素材', '/uploads/2022/05/6184411659b24f83b33312cbe8a0d2b2.jpg', 46, NULL, NULL, '2022-05-13 00:46:13');
INSERT INTO `upload` VALUES (345, 'iQ8KtOGMcOzj81af1ccbfb11616793113c488d6f4d3b.png', '素材', '/uploads/2022/05/81af1ccbfb11616793113c488d6f4d3b.png', 37, NULL, NULL, '2022-05-13 02:16:15');
INSERT INTO `upload` VALUES (346, 'WXChqSXtwR0mfff312d1544eddf8117e0ac77053c6e2.png', '素材', '/uploads/2022/05/fff312d1544eddf8117e0ac77053c6e2.png', 37, NULL, NULL, '2022-05-13 02:16:15');
INSERT INTO `upload` VALUES (347, 'qd32lY2Q7YG73002ac9d60aaaa7abb77489453998c77.png', '素材', '/uploads/2022/05/3002ac9d60aaaa7abb77489453998c77.png', 37, NULL, NULL, '2022-05-13 02:20:27');
INSERT INTO `upload` VALUES (348, 'gUWOp94uiYAF072b291e343d380d779487254fd2f0af.png', '素材', '/uploads/2022/05/072b291e343d380d779487254fd2f0af.png', 37, NULL, NULL, '2022-05-13 02:20:28');
INSERT INTO `upload` VALUES (349, '222.pdf', '素材', '/uploads/2022/05/dc971cde2a25e93e1f79df62819dc519.pdf', 37, NULL, NULL, '2022-05-13 02:23:14');
INSERT INTO `upload` VALUES (350, 'tmp_4ecb183993def0c5cfdbc71720d90c54.jpg', '素材', '/uploads/2022/05/bc55b1e76330fc2f3f960aa2d035aee2.jpg', 37, NULL, NULL, '2022-05-13 12:36:36');
INSERT INTO `upload` VALUES (351, 'tmp_ea6d4eb4518d1b1f91b5a0bcf19d6b60.jpg', '素材', '/uploads/2022/05/3f165ebc443e68ebef6128043d5cc3ef.jpg', 47, NULL, NULL, '2022-05-20 00:16:12');
INSERT INTO `upload` VALUES (352, 'tmp_f5d4f864ef9bbb63c81b606a5317a183.jpg', '素材', '/uploads/2022/05/b89ce5d8c845d5cd0b0a6232e42dbdd7.jpg', 47, NULL, NULL, '2022-05-20 00:16:12');
INSERT INTO `upload` VALUES (353, 'tmp_6d673a1d219859c0d4a858f7c0090ae0.jpg', '素材', '/uploads/2022/05/c0e6734e4f0d8ff07425ce8fb31a9f78.jpg', 47, NULL, NULL, '2022-05-20 00:17:12');
INSERT INTO `upload` VALUES (354, 'tmp_545be0fcd8497622551528b58e692acef2c016f9eaea5011.jpg', '素材', '/uploads/2022/05/6b4c03fbf7070a5cee491751ad4f6648.jpg', 51, NULL, NULL, '2022-05-23 08:19:03');
INSERT INTO `upload` VALUES (355, 'tmp_e7ff4d95c71eb11c4ee24e87c217cbc8becdc9c8a6b5bd78.jpg', '素材', '/uploads/2022/05/a6a3535e4693bc59957cea10106b8fe2.jpg', 51, NULL, NULL, '2022-05-23 08:20:03');
INSERT INTO `upload` VALUES (356, 'tmp_e4b48f50657ae7c0b333c264b90374c5b146912bfc806cca.jpg', '素材', '/uploads/2022/05/21bbe6c3386c8914a1e53832406815d3.jpg', 51, NULL, NULL, '2022-05-23 08:20:03');
INSERT INTO `upload` VALUES (357, 'a3-2.jpg', '素材', '/uploads/2022/05/9b092d4b04380f3e2d0a616dbb224b1f.jpg', 51, NULL, NULL, '2022-05-23 08:20:49');
INSERT INTO `upload` VALUES (358, 'a3-2.jpg', '素材', '/uploads/2022/05/9b092d4b04380f3e2d0a616dbb224b1f.jpg', 51, NULL, NULL, '2022-05-23 08:20:54');
INSERT INTO `upload` VALUES (359, 'tmp_8ad4aea6c17350d3ef41999c1e0b6101.jpg', '素材', '/uploads/2022/05/1c56f12e23c4753588d332ade9921962.jpg', 52, NULL, NULL, '2022-05-26 01:52:18');
INSERT INTO `upload` VALUES (360, 'tmp_3db3c6cdef0e1d36b96c618d58ba3b63.jpg', '素材', '/uploads/2022/05/6184411659b24f83b33312cbe8a0d2b2.jpg', 52, NULL, NULL, '2022-05-26 01:52:18');
INSERT INTO `upload` VALUES (361, 'tmp_58aed3f715d0854b05471766e178a91a.jpg', '素材', '/uploads/2022/05/067aca210b391f549d841b716e50281f.jpg', 52, NULL, NULL, '2022-05-26 01:53:11');
INSERT INTO `upload` VALUES (362, '111.pdf', '素材', '/uploads/2022/05/ef964c3f29e9b23e92568eb8be9abfe6.pdf', 52, NULL, NULL, '2022-05-26 01:54:02');
INSERT INTO `upload` VALUES (363, 'assets.png', '素材', '/uploads/2022/05/9e0fcba209052f63a56ed59c365047c3.png', 52, NULL, NULL, '2022-05-26 01:54:07');
INSERT INTO `upload` VALUES (364, 'a.mp3', '素材', '/uploads/2022/05/414d6ffb455f569fbf1a34201c660aac.mp3', 52, NULL, NULL, '2022-05-26 01:55:17');
INSERT INTO `upload` VALUES (365, 'vd.mp4', '素材', '/uploads/2022/05/3cf571d4cf2a4c4b2df823a27852a7d5.mp4', 52, NULL, NULL, '2022-05-26 01:55:24');
INSERT INTO `upload` VALUES (366, '测word.docx', '素材', '/uploads/2022/05/252e6fcb60a4b41abfda3ca7665fceeb.docx', 52, NULL, NULL, '2022-05-26 01:55:54');
INSERT INTO `upload` VALUES (367, '政企视频彩铃内容设置操作手册.docx', '素材', '/uploads/2022/05/9a1ee24818bab6e52e5fe531afd5f455.docx', 53, NULL, NULL, '2022-05-26 02:24:06');
INSERT INTO `upload` VALUES (368, 'Someone You Loved.mp3', '素材', '/uploads/2022/05/f1f35841212dbfe0f6b7e7ba487c60c5.mp3', 52, NULL, NULL, '2022-05-26 07:44:07');
INSERT INTO `upload` VALUES (369, 'JlV3lfcxTYF53cf571d4cf2a4c4b2df823a27852a7d5.mp4', '素材', '/uploads/2022/05/3cf571d4cf2a4c4b2df823a27852a7d5.mp4', 52, NULL, NULL, '2022-05-26 10:24:50');
INSERT INTO `upload` VALUES (370, 'rp3ozJrHZcz0ef964c3f29e9b23e92568eb8be9abfe6.pdf', '素材', '/uploads/2022/05/ef964c3f29e9b23e92568eb8be9abfe6.pdf', 52, NULL, NULL, '2022-05-26 10:24:50');
INSERT INTO `upload` VALUES (371, 'XhtL6IXAOtsW3cf571d4cf2a4c4b2df823a27852a7d5.mp4', '素材', '/uploads/2022/05/3cf571d4cf2a4c4b2df823a27852a7d5.mp4', 52, NULL, NULL, '2022-05-26 10:28:02');
INSERT INTO `upload` VALUES (372, '0QyHsn4xKWZ4722c93f6263750d8e8fab3ab3acb38a2.jpg', '素材', '/uploads/2022/05/722c93f6263750d8e8fab3ab3acb38a2.jpg', 52, NULL, NULL, '2022-05-26 10:32:15');
INSERT INTO `upload` VALUES (373, 'uI3lc3idVYZN3cf571d4cf2a4c4b2df823a27852a7d5.mp4', '素材', '/uploads/2022/05/3cf571d4cf2a4c4b2df823a27852a7d5.mp4', 52, NULL, NULL, '2022-05-26 10:34:43');
INSERT INTO `upload` VALUES (374, 'uI3lc3idVYZN3cf571d4cf2a4c4b2df823a27852a7d5.mp4', '素材', '/uploads/2022/05/3cf571d4cf2a4c4b2df823a27852a7d5.mp4', 52, NULL, NULL, '2022-05-26 10:35:57');
INSERT INTO `upload` VALUES (375, 'nfBVQIEOxrqS816a9e93fefd20ad07fac3de40933ce0.jpg', '素材', '/uploads/2022/05/816a9e93fefd20ad07fac3de40933ce0.jpg', 52, NULL, NULL, '2022-05-26 10:36:10');
INSERT INTO `upload` VALUES (376, 'tmp_7d24f4935ef8321bce94aa4678b4049e.jpg', '素材', '/uploads/2022/05/1c56f12e23c4753588d332ade9921962.jpg', 52, NULL, NULL, '2022-05-26 10:37:50');
INSERT INTO `upload` VALUES (377, 'tmp_8ddf8cb50cf87474d8f484a6cec46b7f.jpg', '素材', '/uploads/2022/05/a46474f1e0c007479a1343429e46b472.jpg', 52, NULL, NULL, '2022-05-26 10:38:05');
INSERT INTO `upload` VALUES (378, 'ALFcBFq3IIas816a9e93fefd20ad07fac3de40933ce0.jpg', '素材', '/uploads/2022/05/816a9e93fefd20ad07fac3de40933ce0.jpg', 52, NULL, NULL, '2022-05-26 10:38:41');
INSERT INTO `upload` VALUES (379, 'rKA9UnN2Dr5f9e0fcba209052f63a56ed59c365047c3.png', '素材', '/uploads/2022/05/9e0fcba209052f63a56ed59c365047c3.png', 52, NULL, NULL, '2022-05-26 10:46:22');
INSERT INTO `upload` VALUES (380, '831E6rRgPt2mef964c3f29e9b23e92568eb8be9abfe6.pdf', '素材', '/uploads/2022/05/ef964c3f29e9b23e92568eb8be9abfe6.pdf', 52, NULL, NULL, '2022-05-27 02:55:42');
INSERT INTO `upload` VALUES (381, 'cdVWXz2jc2C6414d6ffb455f569fbf1a34201c660aac.mp3', '素材', '/uploads/2022/05/414d6ffb455f569fbf1a34201c660aac.mp3', 52, NULL, NULL, '2022-05-27 02:55:42');
INSERT INTO `upload` VALUES (382, 'iGn6zV1lfIZk9e0fcba209052f63a56ed59c365047c3.png', '素材', '/uploads/2022/05/9e0fcba209052f63a56ed59c365047c3.png', 52, NULL, NULL, '2022-05-27 02:55:42');
INSERT INTO `upload` VALUES (383, 'PeYRkvv5cB6g3cf571d4cf2a4c4b2df823a27852a7d5.mp4', '素材', '/uploads/2022/05/3cf571d4cf2a4c4b2df823a27852a7d5.mp4', 52, NULL, NULL, '2022-05-27 02:55:42');
INSERT INTO `upload` VALUES (384, 'iqgv1qav1XeHef964c3f29e9b23e92568eb8be9abfe6.pdf', '素材', '/uploads/2022/05/ef964c3f29e9b23e92568eb8be9abfe6.pdf', 52, NULL, NULL, '2022-05-27 03:00:30');
INSERT INTO `upload` VALUES (385, 'xQyA1zSnrFx1414d6ffb455f569fbf1a34201c660aac.mp3', '素材', '/uploads/2022/05/414d6ffb455f569fbf1a34201c660aac.mp3', 52, NULL, NULL, '2022-05-27 03:00:31');
INSERT INTO `upload` VALUES (386, 's7TB6SKF0wwI3cf571d4cf2a4c4b2df823a27852a7d5.mp4', '素材', '/uploads/2022/05/3cf571d4cf2a4c4b2df823a27852a7d5.mp4', 52, NULL, NULL, '2022-05-27 03:00:31');
INSERT INTO `upload` VALUES (387, 'qwTcK9D3nlnb39c8f9fba40acd88169d69680c55c911.jpg', '素材', '/uploads/2022/05/39c8f9fba40acd88169d69680c55c911.jpg', 52, NULL, NULL, '2022-05-27 03:00:31');
INSERT INTO `upload` VALUES (388, 'v4J10wbsCKQuc860c0041842f1e6e3833d5f13fd330b.jpg', '素材', '/uploads/2022/05/c860c0041842f1e6e3833d5f13fd330b.jpg', 52, NULL, NULL, '2022-05-27 03:00:31');
INSERT INTO `upload` VALUES (389, '9uJB3xdHpUdZbcbba26acc38e51f3c125e4122f9b669.jpg', '素材', '/uploads/2022/05/bcbba26acc38e51f3c125e4122f9b669.jpg', 52, NULL, NULL, '2022-05-27 03:04:06');
INSERT INTO `upload` VALUES (390, 'hQNmZ56qq2gca1ba492c9a743005663193b3d39ba468.jpg', '素材', '/uploads/2022/05/a1ba492c9a743005663193b3d39ba468.jpg', 52, NULL, NULL, '2022-05-27 03:04:06');
INSERT INTO `upload` VALUES (391, '8h3blFeJqTEwbcbba26acc38e51f3c125e4122f9b669.jpg', '素材', '/uploads/2022/05/bcbba26acc38e51f3c125e4122f9b669.jpg', 52, NULL, NULL, '2022-05-27 03:05:12');
INSERT INTO `upload` VALUES (392, 'EsW9YZHWuImhef964c3f29e9b23e92568eb8be9abfe6.pdf', '素材', '/uploads/2022/05/ef964c3f29e9b23e92568eb8be9abfe6.pdf', 52, NULL, NULL, '2022-05-27 03:14:56');
INSERT INTO `upload` VALUES (393, 'LGtcBFbv6h2G414d6ffb455f569fbf1a34201c660aac.mp3', '素材', '/uploads/2022/05/414d6ffb455f569fbf1a34201c660aac.mp3', 52, NULL, NULL, '2022-05-27 03:14:56');
INSERT INTO `upload` VALUES (394, 'pguNgZJ0dLsV9e0fcba209052f63a56ed59c365047c3.png', '素材', '/uploads/2022/05/9e0fcba209052f63a56ed59c365047c3.png', 52, NULL, NULL, '2022-05-27 03:14:56');
INSERT INTO `upload` VALUES (395, 'yP96YMlvzjq73cf571d4cf2a4c4b2df823a27852a7d5.mp4', '素材', '/uploads/2022/05/3cf571d4cf2a4c4b2df823a27852a7d5.mp4', 52, NULL, NULL, '2022-05-27 03:14:56');
INSERT INTO `upload` VALUES (396, 'RraYb1HY9CRZ81af1ccbfb11616793113c488d6f4d3b.png', '素材', '/uploads/2022/05/81af1ccbfb11616793113c488d6f4d3b.png', 52, NULL, NULL, '2022-05-27 03:14:56');
INSERT INTO `upload` VALUES (397, '4gnn9VjAdG0q072b291e343d380d779487254fd2f0af.png', '素材', '/uploads/2022/05/072b291e343d380d779487254fd2f0af.png', 52, NULL, NULL, '2022-05-27 03:14:56');
INSERT INTO `upload` VALUES (398, 'WYWjKJLqVXR529d29e97cc897e58eb28a184f2766741.png', '素材', '/uploads/2022/05/29d29e97cc897e58eb28a184f2766741.png', 52, NULL, NULL, '2022-05-27 03:14:56');
INSERT INTO `upload` VALUES (399, '28W4dM1BK6mV81af1ccbfb11616793113c488d6f4d3b.png', '素材', '/uploads/2022/05/81af1ccbfb11616793113c488d6f4d3b.png', 52, NULL, NULL, '2022-05-27 03:17:23');
INSERT INTO `upload` VALUES (400, 'Xv1ZGCieEWQAfff312d1544eddf8117e0ac77053c6e2.png', '素材', '/uploads/2022/05/fff312d1544eddf8117e0ac77053c6e2.png', 52, NULL, NULL, '2022-05-27 03:17:23');
INSERT INTO `upload` VALUES (401, 'XYGxzQ3Ka6bW3002ac9d60aaaa7abb77489453998c77.png', '素材', '/uploads/2022/05/3002ac9d60aaaa7abb77489453998c77.png', 52, NULL, NULL, '2022-05-27 05:02:18');
INSERT INTO `upload` VALUES (402, 'ZOzowZ2erGyT072b291e343d380d779487254fd2f0af.png', '素材', '/uploads/2022/05/072b291e343d380d779487254fd2f0af.png', 52, NULL, NULL, '2022-05-27 05:02:18');
INSERT INTO `upload` VALUES (403, 'Sdj8riV2eM4Q81af1ccbfb11616793113c488d6f4d3b.png', '素材', '/uploads/2022/05/81af1ccbfb11616793113c488d6f4d3b.png', 52, NULL, NULL, '2022-05-27 05:04:28');
INSERT INTO `upload` VALUES (404, 'Ovtjdi3hBUv5ef964c3f29e9b23e92568eb8be9abfe6.pdf', '素材', '/uploads/2022/05/ef964c3f29e9b23e92568eb8be9abfe6.pdf', 52, NULL, NULL, '2022-05-27 06:56:58');
INSERT INTO `upload` VALUES (405, 'Ud9dHNIMbyxr414d6ffb455f569fbf1a34201c660aac.mp3', '素材', '/uploads/2022/05/414d6ffb455f569fbf1a34201c660aac.mp3', 52, NULL, NULL, '2022-05-27 06:56:58');
INSERT INTO `upload` VALUES (406, '8Xk1tq1igLF99e0fcba209052f63a56ed59c365047c3.png', '素材', '/uploads/2022/05/9e0fcba209052f63a56ed59c365047c3.png', 52, NULL, NULL, '2022-05-27 06:56:58');
INSERT INTO `upload` VALUES (407, 'NB3fQtCeLyJY3cf571d4cf2a4c4b2df823a27852a7d5.mp4', '素材', '/uploads/2022/05/3cf571d4cf2a4c4b2df823a27852a7d5.mp4', 52, NULL, NULL, '2022-05-27 06:56:58');
INSERT INTO `upload` VALUES (408, 'HmmFubLArdfa81af1ccbfb11616793113c488d6f4d3b.png', '素材', '/uploads/2022/05/81af1ccbfb11616793113c488d6f4d3b.png', 52, NULL, NULL, '2022-05-27 06:58:27');
INSERT INTO `upload` VALUES (409, 'niSiNvMeYCKvfff312d1544eddf8117e0ac77053c6e2.png', '素材', '/uploads/2022/05/fff312d1544eddf8117e0ac77053c6e2.png', 52, NULL, NULL, '2022-05-27 06:58:27');
INSERT INTO `upload` VALUES (410, 'a3-2.jpg', '素材', '/uploads/2022/05/9b092d4b04380f3e2d0a616dbb224b1f.jpg', 57, NULL, NULL, '2022-05-30 07:43:24');
INSERT INTO `upload` VALUES (411, 'a2-2.jpg', '素材', '/uploads/2022/05/cd929c150bfb4de63cda294e1728293c.jpg', 57, NULL, NULL, '2022-05-30 07:44:45');
INSERT INTO `upload` VALUES (412, '075ddde7c73716abc61389cbf814127.jpg', '素材', '/uploads/2022/06/dd9619204f60d4182ac93081e7972e24.jpg', 58, NULL, NULL, '2022-06-16 03:45:21');
INSERT INTO `upload` VALUES (413, '12.png', '素材', '/uploads/2022/06/9f011edab9efc4005577ef2d471281da.png', 58, NULL, NULL, '2022-06-16 03:45:49');
INSERT INTO `upload` VALUES (414, '空间望远镜.jpg', '素材', '/uploads/2022/07/af1d2e184048b507bfa01635428dc6c3.jpg', 48, NULL, NULL, '2022-07-21 02:22:08');
INSERT INTO `upload` VALUES (415, '111.pdf', '素材', '/uploads/2022/07/ef964c3f29e9b23e92568eb8be9abfe6.pdf', 60, NULL, NULL, '2022-07-21 02:24:34');
INSERT INTO `upload` VALUES (416, 'tmp_9263debf4261e11845d4e91c62a13e1a.jpg', '素材', '/uploads/2023/01/5c04f0c2500f5972058d6e062f9f61c7.jpg', 62, NULL, NULL, '2023-01-10 16:12:48');
INSERT INTO `upload` VALUES (417, 'tmp_c57a5d5958c428dbb5e7a373dc25dd87.jpg', '素材', '/uploads/2023/01/044f3a9ab31d7e8d1d6e1a2cf64ab6a5.jpg', 62, NULL, NULL, '2023-01-10 16:12:48');
INSERT INTO `upload` VALUES (418, 'tmp_67104c99b9efd4f6557d2fddbd62f29c.jpg', '素材', '/uploads/2023/01/a45a74bba537f00397afb8a4ea52cf6b.jpg', 62, NULL, NULL, '2023-01-10 16:12:48');
INSERT INTO `upload` VALUES (419, 'tmp_49708bc9070c298f165947519aa550a7.jpg', '素材', '/uploads/2023/01/d5e18ce78b44548256f343d7e27fb9a8.jpg', 62, NULL, NULL, '2023-01-10 16:12:48');
INSERT INTO `upload` VALUES (420, '11.1.pdf', '素材', '/uploads/2023/01/ef964c3f29e9b23e92568eb8be9abfe6.pdf', 62, NULL, NULL, '2023-01-10 16:14:29');
INSERT INTO `upload` VALUES (421, '测word.docx', '素材', '/uploads/2023/01/252e6fcb60a4b41abfda3ca7665fceeb.docx', 62, NULL, NULL, '2023-01-10 16:14:38');
INSERT INTO `upload` VALUES (422, '测excel.xls', '素材', '/uploads/2023/01/4525bcf293a21686290a8070b8c9f73b.xls', 62, NULL, NULL, '2023-01-10 16:14:46');
INSERT INTO `upload` VALUES (423, '11.1.pdf', '素材', '/uploads/2023/01/ef964c3f29e9b23e92568eb8be9abfe6.pdf', 62, NULL, NULL, '2023-01-10 16:14:52');
INSERT INTO `upload` VALUES (424, '111.txt', '素材', '/uploads/2023/06/09726305e74bab5e09c9d6c9672e6085.txt', 64, NULL, NULL, '2023-06-05 13:50:43');
INSERT INTO `upload` VALUES (425, '111.txt', '素材', '/uploads/2023/06/09726305e74bab5e09c9d6c9672e6085.txt', 64, NULL, NULL, '2023-06-05 13:50:54');
INSERT INTO `upload` VALUES (426, '111.jsp', '素材', '/uploads/2023/06/dc5588437674fd5f0683b9bc5d24ddba.jsp', 64, NULL, NULL, '2023-06-05 13:58:34');

SET FOREIGN_KEY_CHECKS = 1;

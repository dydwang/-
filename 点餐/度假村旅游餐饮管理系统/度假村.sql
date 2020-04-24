/*
 Navicat Premium Data Transfer

 Source Server         : video
 Source Server Type    : MySQL
 Source Server Version : 50627
 Source Host           : localhost:3306
 Source Schema         : company

 Target Server Type    : MySQL
 Target Server Version : 50627
 File Encoding         : 65001

 Date: 23/03/2020 11:51:58
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tbl_address
-- ----------------------------
DROP TABLE IF EXISTS `tbl_address`;
CREATE TABLE `tbl_address`  (
  `names` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ids` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`ids`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tbl_address
-- ----------------------------
INSERT INTO `tbl_address` VALUES ('101', '1584233806196');
INSERT INTO `tbl_address` VALUES ('102', '1584233871392');
INSERT INTO `tbl_address` VALUES ('103', '1584233874955');

SET FOREIGN_KEY_CHECKS = 1;




/*
 Navicat Premium Data Transfer

 Source Server         : video
 Source Server Type    : MySQL
 Source Server Version : 50627
 Source Host           : localhost:3306
 Source Schema         : company

 Target Server Type    : MySQL
 Target Server Version : 50627
 File Encoding         : 65001

 Date: 23/03/2020 11:52:04
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tbl_cai_gou
-- ----------------------------
DROP TABLE IF EXISTS `tbl_cai_gou`;
CREATE TABLE `tbl_cai_gou`  (
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ids` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `times` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `price` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `status` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ids`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tbl_cai_gou
-- ----------------------------
INSERT INTO `tbl_cai_gou` VALUES ('测试', '1584787984041', '1587571200000', '150', 'true');
INSERT INTO `tbl_cai_gou` VALUES ('新测试', '1584788150493', '1616601600000', '277', 'true');
INSERT INTO `tbl_cai_gou` VALUES ('', '1584865754967', '1583856000000', '90', 'true');

SET FOREIGN_KEY_CHECKS = 1;
/*
 Navicat Premium Data Transfer

 Source Server         : video
 Source Server Type    : MySQL
 Source Server Version : 50627
 Source Host           : localhost:3306
 Source Schema         : company

 Target Server Type    : MySQL
 Target Server Version : 50627
 File Encoding         : 65001

 Date: 23/03/2020 11:52:11
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tbl_cai_gou_list
-- ----------------------------
DROP TABLE IF EXISTS `tbl_cai_gou_list`;
CREATE TABLE `tbl_cai_gou_list`  (
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ids` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sort` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `price` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `num` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `caiId` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`ids`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tbl_cai_gou_list
-- ----------------------------
INSERT INTO `tbl_cai_gou_list` VALUES ('cc', '15847881505450', '海鲜', '3', '3', '1584788150493');
INSERT INTO `tbl_cai_gou_list` VALUES ('ccd', '15847881505451', '其他', '16', '15', '1584788150493');
INSERT INTO `tbl_cai_gou_list` VALUES ('vv', '15847881505452', '水果', '7', '4', '1584788150493');
INSERT INTO `tbl_cai_gou_list` VALUES ('sssff', '15847956148860', '肉类', '15', '10', '1584795614838');
INSERT INTO `tbl_cai_gou_list` VALUES ('sssbb', '15847956524710', '肉类', '15', '10', '1584795652440');
INSERT INTO `tbl_cai_gou_list` VALUES ('sssbb', '15847957185970', '肉类', '15', '10', '1584795718550');
INSERT INTO `tbl_cai_gou_list` VALUES ('mm', '15847957185981', '调味品', '1', '1', '1584795718550');
INSERT INTO `tbl_cai_gou_list` VALUES ('sss123', '15847961909140', '肉类', '15', '10', '1584787984041');
INSERT INTO `tbl_cai_gou_list` VALUES ('cc', '15848656162040', '肉类', '0', '9', '1584865616080');
INSERT INTO `tbl_cai_gou_list` VALUES ('bb', '15848656162041', '水果', '0', '100', '1584865616080');
INSERT INTO `tbl_cai_gou_list` VALUES ('cc', '15848656180870', '肉类', '0', '9', '1584865618054');
INSERT INTO `tbl_cai_gou_list` VALUES ('bb', '15848656180871', '水果', '0', '100', '1584865618054');
INSERT INTO `tbl_cai_gou_list` VALUES ('cc', '15848656307600', '肉类', '0', '9', '1584865630711');
INSERT INTO `tbl_cai_gou_list` VALUES ('bb', '15848656307601', '水果', '0', '100', '1584865630711');
INSERT INTO `tbl_cai_gou_list` VALUES ('cc', '15848658387460', '肉类', '10', '3', '1584865754967');
INSERT INTO `tbl_cai_gou_list` VALUES ('bb', '15848658387471', '肉类', '15', '4', '1584865754967');

SET FOREIGN_KEY_CHECKS = 1;
/*
 Navicat Premium Data Transfer

 Source Server         : video
 Source Server Type    : MySQL
 Source Server Version : 50627
 Source Host           : localhost:3306
 Source Schema         : company

 Target Server Type    : MySQL
 Target Server Version : 50627
 File Encoding         : 65001

 Date: 23/03/2020 11:52:18
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tbl_comment
-- ----------------------------
DROP TABLE IF EXISTS `tbl_comment`;
CREATE TABLE `tbl_comment`  (
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ids` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `phone` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `text` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`ids`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tbl_comment
-- ----------------------------
INSERT INTO `tbl_comment` VALUES ('18786085146', '1583944423082', '18786085146', '水水水水水');

SET FOREIGN_KEY_CHECKS = 1;
/*
 Navicat Premium Data Transfer

 Source Server         : video
 Source Server Type    : MySQL
 Source Server Version : 50627
 Source Host           : localhost:3306
 Source Schema         : company

 Target Server Type    : MySQL
 Target Server Version : 50627
 File Encoding         : 65001

 Date: 23/03/2020 11:52:22
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tbl_cook_sort
-- ----------------------------
DROP TABLE IF EXISTS `tbl_cook_sort`;
CREATE TABLE `tbl_cook_sort`  (
  `ids` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `userId` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sortId` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`ids`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tbl_cook_sort
-- ----------------------------
INSERT INTO `tbl_cook_sort` VALUES ('1584863249588', '1584447099396', '1584815829505');
INSERT INTO `tbl_cook_sort` VALUES ('1584865549026', '1584447099396', '1584815820349');
INSERT INTO `tbl_cook_sort` VALUES ('1584869661302', '1584447099396', '1584815839872');

SET FOREIGN_KEY_CHECKS = 1;
/*
 Navicat Premium Data Transfer

 Source Server         : video
 Source Server Type    : MySQL
 Source Server Version : 50627
 Source Host           : localhost:3306
 Source Schema         : company

 Target Server Type    : MySQL
 Target Server Version : 50627
 File Encoding         : 65001

 Date: 23/03/2020 11:52:27
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tbl_goods
-- ----------------------------
DROP TABLE IF EXISTS `tbl_goods`;
CREATE TABLE `tbl_goods`  (
  `names` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ids` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `image` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `text` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `price` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sortId` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `status` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`ids`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tbl_goods
-- ----------------------------
INSERT INTO `tbl_goods` VALUES ('可乐', '1584855744443', '450fb33f172f211b34197e0694da4e46', '非常好喝', '3.1', '1584815829505', 'false');
INSERT INTO `tbl_goods` VALUES ('雪碧', '1584855794544', '02e8f85dc4d5dd0b2d0a2be3648ce1c4', '奥里给', '3.1', '1584815829505', 'true');
INSERT INTO `tbl_goods` VALUES ('冰淇淋', '1584862413548', '9080ad0d8685c98f286e6348033c5854', '甜', '2.1', '1584815820349', 'true');
INSERT INTO `tbl_goods` VALUES ('大肉', '1584865910661', '2476c6c28fc62be8f4ab3ded45ec170f', 'rrr', '9.1', '1584865894369', 'false');

SET FOREIGN_KEY_CHECKS = 1;
/*
 Navicat Premium Data Transfer

 Source Server         : video
 Source Server Type    : MySQL
 Source Server Version : 50627
 Source Host           : localhost:3306
 Source Schema         : company

 Target Server Type    : MySQL
 Target Server Version : 50627
 File Encoding         : 65001

 Date: 23/03/2020 11:52:35
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tbl_image
-- ----------------------------
DROP TABLE IF EXISTS `tbl_image`;
CREATE TABLE `tbl_image`  (
  `ids` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `image` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`ids`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tbl_image
-- ----------------------------
INSERT INTO `tbl_image` VALUES ('1583932661884', '7bea5e310325b79b0ad1a5b1d28195f2');
INSERT INTO `tbl_image` VALUES ('1583944217144', 'cb756a891db0f96836fd3c41ce3cb48a');
INSERT INTO `tbl_image` VALUES ('1584865447117', '1968b10008f5ccb7ab839d2d5426f09b');

SET FOREIGN_KEY_CHECKS = 1;
/*
 Navicat Premium Data Transfer

 Source Server         : video
 Source Server Type    : MySQL
 Source Server Version : 50627
 Source Host           : localhost:3306
 Source Schema         : company

 Target Server Type    : MySQL
 Target Server Version : 50627
 File Encoding         : 65001

 Date: 23/03/2020 11:52:40
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tbl_news
-- ----------------------------
DROP TABLE IF EXISTS `tbl_news`;
CREATE TABLE `tbl_news`  (
  `names` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ids` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pdfPath` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `videoPath` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ids`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tbl_news
-- ----------------------------
INSERT INTO `tbl_news` VALUES ('w', '1583935659873', '<p>ww</p>', '1f9cdc0a836b345347169123043d3bb9', '15165091464116417f638dff28bf3306');
INSERT INTO `tbl_news` VALUES ('测试新闻', '1583942295857', '<p>测试新闻</p>', '', '');
INSERT INTO `tbl_news` VALUES ('我的新闻', '1583942333139', '<p><strong>我的新闻</strong></p>', '', '');
INSERT INTO `tbl_news` VALUES ('消息信息', '1583944292266', '<p>嘻嘻嘻</p>', 'd1b37846b43e34b74a6d100c3ab6d076', 'be7b41cfb2501b7efdd4ea70086c5a8c');

SET FOREIGN_KEY_CHECKS = 1;
/*
 Navicat Premium Data Transfer

 Source Server         : video
 Source Server Type    : MySQL
 Source Server Version : 50627
 Source Host           : localhost:3306
 Source Schema         : company

 Target Server Type    : MySQL
 Target Server Version : 50627
 File Encoding         : 65001

 Date: 23/03/2020 11:52:45
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tbl_pay
-- ----------------------------
DROP TABLE IF EXISTS `tbl_pay`;
CREATE TABLE `tbl_pay`  (
  `payId` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `userId` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `price` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ids` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`payId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tbl_pay
-- ----------------------------
INSERT INTO `tbl_pay` VALUES ('2020322153234', '1584816478183', '9.3', '1584862354605');
INSERT INTO `tbl_pay` VALUES ('2020322154046', '', '5.2', '1584862846501');
INSERT INTO `tbl_pay` VALUES ('202032216045', '', '6.300000000000001', '1584864045782');
INSERT INTO `tbl_pay` VALUES ('2020322161917', '', '10.4', '1584865157084');
INSERT INTO `tbl_pay` VALUES ('2020322162459', '', '17.6', '1584865499851');

SET FOREIGN_KEY_CHECKS = 1;
/*
 Navicat Premium Data Transfer

 Source Server         : video
 Source Server Type    : MySQL
 Source Server Version : 50627
 Source Host           : localhost:3306
 Source Schema         : company

 Target Server Type    : MySQL
 Target Server Version : 50627
 File Encoding         : 65001

 Date: 23/03/2020 11:52:45
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tbl_pay
-- ----------------------------
DROP TABLE IF EXISTS `tbl_pay`;
CREATE TABLE `tbl_pay`  (
  `payId` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `userId` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `price` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ids` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`payId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tbl_pay
-- ----------------------------
INSERT INTO `tbl_pay` VALUES ('2020322153234', '1584816478183', '9.3', '1584862354605');
INSERT INTO `tbl_pay` VALUES ('2020322154046', '', '5.2', '1584862846501');
INSERT INTO `tbl_pay` VALUES ('202032216045', '', '6.300000000000001', '1584864045782');
INSERT INTO `tbl_pay` VALUES ('2020322161917', '', '10.4', '1584865157084');
INSERT INTO `tbl_pay` VALUES ('2020322162459', '', '17.6', '1584865499851');

SET FOREIGN_KEY_CHECKS = 1;
/*
 Navicat Premium Data Transfer

 Source Server         : video
 Source Server Type    : MySQL
 Source Server Version : 50627
 Source Host           : localhost:3306
 Source Schema         : company

 Target Server Type    : MySQL
 Target Server Version : 50627
 File Encoding         : 65001

 Date: 23/03/2020 11:52:50
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tbl_paylist
-- ----------------------------
DROP TABLE IF EXISTS `tbl_paylist`;
CREATE TABLE `tbl_paylist`  (
  `payId` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `goodId` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `num` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ids` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tbl_paylist
-- ----------------------------
INSERT INTO `tbl_paylist` VALUES ('2020322161917', '1584862413548', '2', 'true', '1584865157084');
INSERT INTO `tbl_paylist` VALUES ('2020322161917', '1584855744443', '2', 'true', '1584865157084');
INSERT INTO `tbl_paylist` VALUES ('2020322162459', '1584862413548', '1', 'false', '1584865499851');
INSERT INTO `tbl_paylist` VALUES ('2020322162459', '1584855794544', '2', 'true', '1584865499851');
INSERT INTO `tbl_paylist` VALUES ('2020322162459', '1584855744443', '3', 'false', '1584865499851');

SET FOREIGN_KEY_CHECKS = 1;
/*
 Navicat Premium Data Transfer

 Source Server         : video
 Source Server Type    : MySQL
 Source Server Version : 50627
 Source Host           : localhost:3306
 Source Schema         : company

 Target Server Type    : MySQL
 Target Server Version : 50627
 File Encoding         : 65001

 Date: 23/03/2020 11:52:54
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tbl_sort
-- ----------------------------
DROP TABLE IF EXISTS `tbl_sort`;
CREATE TABLE `tbl_sort`  (
  `ids` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `names` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`ids`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tbl_sort
-- ----------------------------
INSERT INTO `tbl_sort` VALUES ('1584815820349', '甜品');
INSERT INTO `tbl_sort` VALUES ('1584815829505', '饮品');
INSERT INTO `tbl_sort` VALUES ('1584815839872', '湘菜');
INSERT INTO `tbl_sort` VALUES ('1584865894369', '肉');

SET FOREIGN_KEY_CHECKS = 1;
/*
 Navicat Premium Data Transfer

 Source Server         : video
 Source Server Type    : MySQL
 Source Server Version : 50627
 Source Host           : localhost:3306
 Source Schema         : company

 Target Server Type    : MySQL
 Target Server Version : 50627
 File Encoding         : 65001

 Date: 23/03/2020 11:52:59
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tbl_teacou
-- ----------------------------
DROP TABLE IF EXISTS `tbl_teacou`;
CREATE TABLE `tbl_teacou`  (
  `ids` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `grade` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `courseId` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `course` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `userId` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `address` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ids`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tbl_teacou
-- ----------------------------
INSERT INTO `tbl_teacou` VALUES ('1584264481151', '一年级上', '1584197586830', '语文', '1584232676480', '小教室');

SET FOREIGN_KEY_CHECKS = 1;
/*
 Navicat Premium Data Transfer

 Source Server         : video
 Source Server Type    : MySQL
 Source Server Version : 50627
 Source Host           : localhost:3306
 Source Schema         : company

 Target Server Type    : MySQL
 Target Server Version : 50627
 File Encoding         : 65001

 Date: 23/03/2020 11:53:04
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tbl_user
-- ----------------------------
DROP TABLE IF EXISTS `tbl_user`;
CREATE TABLE `tbl_user`  (
  `names` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ids` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `username` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `startTime` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `grade` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `endTime` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `operation` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ids`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tbl_user
-- ----------------------------
INSERT INTO `tbl_user` VALUES ('ccmm', '1584445200504', '1584445200504', 'YG_1234', '1583164800000', '人事', '1583683200000', '管理员');
INSERT INTO `tbl_user` VALUES ('采购', '1584446841875', '1584446841875', 'YG_1234', '1583856000000', '采购员', NULL, '管理员');
INSERT INTO `tbl_user` VALUES ('厨师', '1584447099396', '1584447099396', 'YG_1234', '1584288000000', '厨师', NULL, '管理员');
INSERT INTO `tbl_user` VALUES ('最强点餐', '1584816478183', '1584816478183', 'YG_1234', '1583164800000', '点餐员', NULL, '管理员');
INSERT INTO `tbl_user` VALUES ('www', '1584865954089', '1584865954089', 'YG_1234', '1583078400000', '人事', NULL, '管理员');
INSERT INTO `tbl_user` VALUES ('ww', '1584866067932', '1584866067932', 'YG_1234', '1583683200000', '点餐员', NULL, '管理员');

SET FOREIGN_KEY_CHECKS = 1;

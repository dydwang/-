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

 Date: 12/04/2020 21:10:42
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tbl_history
-- ----------------------------
DROP TABLE IF EXISTS `tbl_history`;
CREATE TABLE `tbl_history`  (
  `names` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ids` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `borrow` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `image` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `num` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `userId` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fun` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ballId` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ids`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tbl_history
-- ----------------------------
INSERT INTO `tbl_history` VALUES ('测试', '1586694909585', '2', 'abb76033de4944ec837afdcae40ad4af', '1', '1585325323142', '', '还球', '1586671045230');
INSERT INTO `tbl_history` VALUES ('测试', '1586695358167', '3', 'abb76033de4944ec837afdcae40ad4af', '1', '1585325323142', '', '借球', '1586671045230');
INSERT INTO `tbl_history` VALUES ('新', '1586696773825', '0', 'f55a0ab95fb4fd5e15a677ea2f7ce61e', '1', '1585325323142', '', '借球', '1586696763907');

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
INSERT INTO `tbl_image` VALUES ('1586696729768', '80315ab05607c0a553ccf7792e327080');
INSERT INTO `tbl_image` VALUES ('1586696736412', '2212dfbf86787a157e4194943daef608');
INSERT INTO `tbl_image` VALUES ('1586696742926', 'ada619c3b85179bad1eb22baf13f3f0e');

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
INSERT INTO `tbl_news` VALUES ('wsss', '1583935659873', '<p>ww</p>', '29be9439551ece4392134d35190d9e73', '15165091464116417f638dff28bf3306');
INSERT INTO `tbl_news` VALUES ('测试新闻', '1583942295857', '<p>测试新闻</p>', '', '');
INSERT INTO `tbl_news` VALUES ('我的新闻', '1583942333139', '<p><strong>我的新闻</strong></p>', '', '');
INSERT INTO `tbl_news` VALUES ('消息信息', '1583944292266', '<p>嘻嘻嘻</p>', 'd1b37846b43e34b74a6d100c3ab6d076', 'be7b41cfb2501b7efdd4ea70086c5a8c');
INSERT INTO `tbl_news` VALUES ('wwwwww', '1585229089810', '<p>wwww</p>', '', '');
INSERT INTO `tbl_news` VALUES ('xx', '1585229224139', '<p>xxx</p>', '', '');
INSERT INTO `tbl_news` VALUES ('xxxxx', '1585325801923', '<p><strong>测试新闻测试新闻测试新</strong>闻测试<u>新闻测试新闻测试新</u>闻测试新闻测试新闻测试新闻测试新闻测试新闻测试新闻测试新闻测试新闻测试新闻测试新闻测试新闻测试新闻测试新闻测<em>试新闻测试新</em>闻</p>', 'de3ae2e1554a84ba7c88a20133ce1980', 'd011aaa15f27f8a8ce19df08d6b1c6ec');
INSERT INTO `tbl_news` VALUES ('测的是撒旦发射点发射点', '1586696859321', '<p>撒旦范德萨范德萨范德萨</p>', 'f8528799d1e347c08c4993cf9247e2a1', '4ba787fc95e5d3dd9356ed626eb4bd9f');

-- ----------------------------
-- Table structure for tbl_pay
-- ----------------------------
DROP TABLE IF EXISTS `tbl_pay`;
CREATE TABLE `tbl_pay`  (
  `names` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ids` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `borrow` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `image` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `num` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `userId` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fun` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ballId` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ids`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tbl_pay
-- ----------------------------
INSERT INTO `tbl_pay` VALUES ('测试', '1586691990007', '3', 'abb76033de4944ec837afdcae40ad4af', '1', '1585325323142', '同意', '还球', '1586671045230');
INSERT INTO `tbl_pay` VALUES ('测试', '1586692564459', '3', 'abb76033de4944ec837afdcae40ad4af', '1', '1585325323142', '同意', '还球', '1586671045230');
INSERT INTO `tbl_pay` VALUES ('测试', '1586694892372', '2', 'abb76033de4944ec837afdcae40ad4af', '1', '1585325323142', '同意', '借球', '1586671045230');
INSERT INTO `tbl_pay` VALUES ('测试', '1586694909585', '2', 'abb76033de4944ec837afdcae40ad4af', '1', '1585325323142', '', '还球', '1586671045230');
INSERT INTO `tbl_pay` VALUES ('测试', '1586695031810', '3', 'abb76033de4944ec837afdcae40ad4af', '1', '1585325323142', '', '借球', '1586671045230');
INSERT INTO `tbl_pay` VALUES ('测试', '1586695319740', '3', 'abb76033de4944ec837afdcae40ad4af', '1', '1585325323142', '', '借球', '1586671045230');
INSERT INTO `tbl_pay` VALUES ('测试', '1586695358167', '3', 'abb76033de4944ec837afdcae40ad4af', '1', '1585325323142', '', '借球', '1586671045230');
INSERT INTO `tbl_pay` VALUES ('新', '1586696773825', '0', 'f55a0ab95fb4fd5e15a677ea2f7ce61e', '1', '1585325323142', '同意', '还球', '1586696763907');

-- ----------------------------
-- Table structure for tbl_sort
-- ----------------------------
DROP TABLE IF EXISTS `tbl_sort`;
CREATE TABLE `tbl_sort`  (
  `names` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ids` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `image` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `num` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `borrow` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ids`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tbl_sort
-- ----------------------------
INSERT INTO `tbl_sort` VALUES ('测试', '1586671045230', 'abb76033de4944ec837afdcae40ad4af', '9', '3');
INSERT INTO `tbl_sort` VALUES ('新', '1586696763907', 'f55a0ab95fb4fd5e15a677ea2f7ce61e', '100', '-1');

-- ----------------------------
-- Table structure for tbl_user
-- ----------------------------
DROP TABLE IF EXISTS `tbl_user`;
CREATE TABLE `tbl_user`  (
  `names` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ids` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `userImg` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `username` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `city` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `grade` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ids`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tbl_user
-- ----------------------------
INSERT INTO `tbl_user` VALUES ('wwwcc', '1585325323142', '0cd27ad33d3979c2b2aaf1138d71a81a', 'www', 'wwwcc', '', '管理员');

SET FOREIGN_KEY_CHECKS = 1;

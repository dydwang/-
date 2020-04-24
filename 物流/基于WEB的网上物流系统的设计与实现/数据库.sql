/*
 Navicat Premium Data Transfer

 Source Server         : video
 Source Server Type    : MySQL
 Source Server Version : 50627
 Source Host           : localhost:3306
 Source Schema         : logistics

 Target Server Type    : MySQL
 Target Server Version : 50627
 File Encoding         : 65001

 Date: 07/04/2020 01:05:13
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tbl_comment
-- ----------------------------
DROP TABLE IF EXISTS `tbl_comment`;
CREATE TABLE `tbl_comment`  (
  `userId` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ids` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `text` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `address` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `good` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ids`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tbl_comment
-- ----------------------------
INSERT INTO `tbl_comment` VALUES ('1586098137451', '1586187984269', 'ccc', '邢台市-天津市', '36');
INSERT INTO `tbl_comment` VALUES ('1586190614546', '1586190915933', 'CESS', '北京市-邯郸市', '0');

-- ----------------------------
-- Table structure for tbl_commlist
-- ----------------------------
DROP TABLE IF EXISTS `tbl_commlist`;
CREATE TABLE `tbl_commlist`  (
  `userId` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ids` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `commentId` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ids`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tbl_commlist
-- ----------------------------
INSERT INTO `tbl_commlist` VALUES ('1586190614546', '1586190809132', '1586187984269');
INSERT INTO `tbl_commlist` VALUES ('1586190614546', '1586190813811', '1586190800780');
INSERT INTO `tbl_commlist` VALUES ('1586190614546', '1586190919930', '1586190915933');

-- ----------------------------
-- Table structure for tbl_goods
-- ----------------------------
DROP TABLE IF EXISTS `tbl_goods`;
CREATE TABLE `tbl_goods`  (
  `names` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ids` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `image` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `text` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`ids`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tbl_goods
-- ----------------------------

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
INSERT INTO `tbl_image` VALUES ('1586091009753', 'c77a883be0059ca12d126e11ec02b041');
INSERT INTO `tbl_image` VALUES ('1586190536539', '11958d868f753de6df3ffd39795b96c5');
INSERT INTO `tbl_image` VALUES ('1586190544482', '428809bd08e3f2b8912c13ed07359890');

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
INSERT INTO `tbl_news` VALUES ('测试新闻', '1586091207616', '<p>测试</p>', 'd3765a448803eb6d546a01ba824410d1', 'b2efc880d23ef9bc98ab0e54e488a6db');

-- ----------------------------
-- Table structure for tbl_pay
-- ----------------------------
DROP TABLE IF EXISTS `tbl_pay`;
CREATE TABLE `tbl_pay`  (
  `ids` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `price` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `start_city` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `end_city` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `address` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `userId` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `status` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`ids`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tbl_pay
-- ----------------------------
INSERT INTO `tbl_pay` VALUES ('1586098155810', '0.1', '邢台市', '天津市', 'ce', '1586098137451', '已到达');
INSERT INTO `tbl_pay` VALUES ('1586190786230', '14.1', '北京市', '邯郸市', 'cssdfsfdsf', '1586190614546', '已到达');

-- ----------------------------
-- Table structure for tbl_sort
-- ----------------------------
DROP TABLE IF EXISTS `tbl_sort`;
CREATE TABLE `tbl_sort`  (
  `price` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ids` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `start_city` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `end_city` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`ids`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tbl_sort
-- ----------------------------
INSERT INTO `tbl_sort` VALUES ('0.1', '1586094573014', '邢台市', '天津市');
INSERT INTO `tbl_sort` VALUES ('14.1', '1586190580315', '北京市', '邯郸市');

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
  PRIMARY KEY (`ids`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tbl_user
-- ----------------------------
INSERT INTO `tbl_user` VALUES ('www', '1586098137451', '03a8e737e542d403dfa60593fa961c24', 'www', 'www', NULL);
INSERT INTO `tbl_user` VALUES ('eee', '1586190614546', '9bb6c9d18d912388099e92c457bbd981', 'eee', 'eee', NULL);

SET FOREIGN_KEY_CHECKS = 1;

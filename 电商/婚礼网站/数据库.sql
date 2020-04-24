/*
 Navicat Premium Data Transfer

 Source Server         : video
 Source Server Type    : MySQL
 Source Server Version : 50627
 Source Host           : localhost:3306
 Source Schema         : hun_li

 Target Server Type    : MySQL
 Target Server Version : 50627
 File Encoding         : 65001

 Date: 28/03/2020 22:39:42
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tbl_cloth
-- ----------------------------
DROP TABLE IF EXISTS `tbl_cloth`;
CREATE TABLE `tbl_cloth`  (
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ids` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `address` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `carId` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `clothId` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `userId` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`ids`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tbl_cloth
-- ----------------------------
INSERT INTO `tbl_cloth` VALUES ('werew', '1585404834113', 'werew', '1', '4', '1585280135024');
INSERT INTO `tbl_cloth` VALUES ('ceecececec', '1585406288197', 'eceecefef', '0', '2', '1585405116732');

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
INSERT INTO `tbl_comment` VALUES ('cece', '1585406304999', '18786085146', 'cecece');

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
INSERT INTO `tbl_news` VALUES ('weewew', '1585398120476', '', '', '5bcee136a336b6848540b48bd1f99979');
INSERT INTO `tbl_news` VALUES ('测试', '1585406039768', '<p>测试</p>', '', 'a99ff3fb40ff5b925044f67b05cf0991');
INSERT INTO `tbl_news` VALUES ('ccccccccccccccccccccccccccc', '1585406261759', '<p>ccccccccccccccccccccccccccccc</p>', '', '6b1a00d1cfcd7cbb2ba0dc680dcd0920');

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
INSERT INTO `tbl_user` VALUES ('wwwccc', '1585405116732', '9ad476f89fd5aa1ac68cf427cd1b9ddd', 'www', 'www', NULL);
INSERT INTO `tbl_user` VALUES ('eee', '1585406008200', '', 'eee', 'eee', NULL);
INSERT INTO `tbl_user` VALUES ('mmm', '1585406225451', '', 'mmm', 'mmm', NULL);

SET FOREIGN_KEY_CHECKS = 1;

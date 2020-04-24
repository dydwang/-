/*
 Navicat Premium Data Transfer

 Source Server         : video
 Source Server Type    : MySQL
 Source Server Version : 50627
 Source Host           : localhost:3306
 Source Schema         : study

 Target Server Type    : MySQL
 Target Server Version : 50627
 File Encoding         : 65001

 Date: 16/02/2020 12:49:25
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tbl_blog
-- ----------------------------
DROP TABLE IF EXISTS `tbl_blog`;
CREATE TABLE `tbl_blog`  (
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ids` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `mains` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `nickName` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sorts` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `userImg` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`ids`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tbl_blog
-- ----------------------------
INSERT INTO `tbl_blog` VALUES ('找兼职', '1581781899239', '急需兼职', 'dydwang', '兼职求职', 'https://wx.qlogo.cn/mmopen/vi_32/b5bPkyppWTG4HwNUPvJlwLp3tQQmlcNrFF377RTib82Ql7gAxL7X74whWU288ukAnDnibuqWFGN2GbTLZkv3KktQ/132');
INSERT INTO `tbl_blog` VALUES ('急需兼职', '1581782110697', '有没有兼职', 'dydwang', '兼职求职', 'https://wx.qlogo.cn/mmopen/vi_32/b5bPkyppWTG4HwNUPvJlwLp3tQQmlcNrFF377RTib82Ql7gAxL7X74whWU288ukAnDnibuqWFGN2GbTLZkv3KktQ/132');

SET FOREIGN_KEY_CHECKS = 1;










/*
 Navicat Premium Data Transfer

 Source Server         : video
 Source Server Type    : MySQL
 Source Server Version : 50627
 Source Host           : localhost:3306
 Source Schema         : study

 Target Server Type    : MySQL
 Target Server Version : 50627
 File Encoding         : 65001

 Date: 16/02/2020 12:49:32
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tbl_comment
-- ----------------------------
DROP TABLE IF EXISTS `tbl_comment`;
CREATE TABLE `tbl_comment`  (
  `text` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ids` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `blogId` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `nickName` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `userImg` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`ids`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tbl_comment
-- ----------------------------
INSERT INTO `tbl_comment` VALUES ('奔驰车标', '1581781116425', '1581777563050', 'dydwang', 'https://wx.qlogo.cn/mmopen/vi_32/b5bPkyppWTG4HwNUPvJlwLp3tQQmlcNrFF377RTib82Ql7gAxL7X74whWU288ukAnDnibuqWFGN2GbTLZkv3KktQ/132');
INSERT INTO `tbl_comment` VALUES ('很好很好', '1581781501164', '1581777563050', 'dydwang', 'https://wx.qlogo.cn/mmopen/vi_32/b5bPkyppWTG4HwNUPvJlwLp3tQQmlcNrFF377RTib82Ql7gAxL7X74whWU288ukAnDnibuqWFGN2GbTLZkv3KktQ/132');
INSERT INTO `tbl_comment` VALUES ('不错不错', '1581782004382', '1581781899239', 'dydwang', 'https://wx.qlogo.cn/mmopen/vi_32/b5bPkyppWTG4HwNUPvJlwLp3tQQmlcNrFF377RTib82Ql7gAxL7X74whWU288ukAnDnibuqWFGN2GbTLZkv3KktQ/132');
INSERT INTO `tbl_comment` VALUES ('我有好兼职', '1581782203873', '1581781899239', 'dydwang', 'https://wx.qlogo.cn/mmopen/vi_32/b5bPkyppWTG4HwNUPvJlwLp3tQQmlcNrFF377RTib82Ql7gAxL7X74whWU288ukAnDnibuqWFGN2GbTLZkv3KktQ/132');

SET FOREIGN_KEY_CHECKS = 1;






/*
 Navicat Premium Data Transfer

 Source Server         : video
 Source Server Type    : MySQL
 Source Server Version : 50627
 Source Host           : localhost:3306
 Source Schema         : study

 Target Server Type    : MySQL
 Target Server Version : 50627
 File Encoding         : 65001

 Date: 16/02/2020 12:49:38
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tbl_course
-- ----------------------------
DROP TABLE IF EXISTS `tbl_course`;
CREATE TABLE `tbl_course`  (
  `input` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ids` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `weeks` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `timeStart` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `timeEnd` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `nickName` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`ids`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tbl_course
-- ----------------------------
INSERT INTO `tbl_course` VALUES ('数学', '1581781941830', '5', '09:01', '10:01', 'dydwang');
INSERT INTO `tbl_course` VALUES ('英语', '1581782150066', '7', '09:01', '11:01', 'dydwang');

SET FOREIGN_KEY_CHECKS = 1;





/*
 Navicat Premium Data Transfer

 Source Server         : video
 Source Server Type    : MySQL
 Source Server Version : 50627
 Source Host           : localhost:3306
 Source Schema         : study

 Target Server Type    : MySQL
 Target Server Version : 50627
 File Encoding         : 65001

 Date: 16/02/2020 12:49:47
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tbl_user
-- ----------------------------
DROP TABLE IF EXISTS `tbl_user`;
CREATE TABLE `tbl_user`  (
  `names` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `nickName` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `old` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `grade` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `stuId` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ids` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`nickName`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tbl_user
-- ----------------------------
INSERT INTO `tbl_user` VALUES ('神仙', 'dydwang', '19', '大一', '2017', '1581782081141');

SET FOREIGN_KEY_CHECKS = 1;

/*
 Navicat Premium Data Transfer

 Source Server         : video
 Source Server Type    : MySQL
 Source Server Version : 50627
 Source Host           : localhost:3306
 Source Schema         : course

 Target Server Type    : MySQL
 Target Server Version : 50627
 File Encoding         : 65001

 Date: 01/04/2020 22:12:22
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
INSERT INTO `tbl_address` VALUES ('101', '1584622544387');
INSERT INTO `tbl_address` VALUES ('121', '1584622546719');
INSERT INTO `tbl_address` VALUES ('103', '1584622549877');
INSERT INTO `tbl_address` VALUES ('4444', '1584635483245');

-- ----------------------------
-- Table structure for tbl_chat
-- ----------------------------
DROP TABLE IF EXISTS `tbl_chat`;
CREATE TABLE `tbl_chat`  (
  `ids` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `courseId` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `teaId` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `stuId` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `text` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `peo` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ids`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tbl_chat
-- ----------------------------
INSERT INTO `tbl_chat` VALUES ('1585741365723', '1584622578216', '1585709264633', '1584633943545', '123456', 'stu');
INSERT INTO `tbl_chat` VALUES ('1585741601811', '1584622578216', '1585709264633', '1584633943545', '123546', 'stu');
INSERT INTO `tbl_chat` VALUES ('1585741927763', '1584622578216', '1585709264633', '1584633943545', 'sdfsdfdsfdsfdsfdsfgsdgdsgdsgdsfsd', 'stu');
INSERT INTO `tbl_chat` VALUES ('1585741997550', '1584622578216', '1585709264633', '1584633943545', 'sdfsdf', '');
INSERT INTO `tbl_chat` VALUES ('1585742151884', '1584622578216', '1585709264633', '1584633943545', '我有一个问题', 'stu');
INSERT INTO `tbl_chat` VALUES ('1585742154116', '1584622578216', '1585709264633', '1584633943545', '威风威风', 'stu');
INSERT INTO `tbl_chat` VALUES ('1585742155994', '1584622578216', '1585709264633', '1584633943545', '温热我认为', 'stu');
INSERT INTO `tbl_chat` VALUES ('1585742157479', '1584622578216', '1585709264633', '1584633943545', '温热微软', 'stu');
INSERT INTO `tbl_chat` VALUES ('1585744407418', '1584622578216', '1585709264633', '1584633943545', 'wer', '');
INSERT INTO `tbl_chat` VALUES ('1585745746942', '1584622578216', '1585709264633', '1585745718734', 'zml', 'stu');
INSERT INTO `tbl_chat` VALUES ('1585745751181', '1584622578216', '1585709264633', '1585745718734', '安全', 'stu');
INSERT INTO `tbl_chat` VALUES ('1585745889553', '1584622608348', '1584622453089', '1585745718734', 'ccccccccccc', 'stu');
INSERT INTO `tbl_chat` VALUES ('1585745899905', '1584622608348', '1584622453089', '1585745718734', 'wwwwwwwwwwwwww', '');

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
INSERT INTO `tbl_comment` VALUES ('sss', '1584635725741', '18786085146', 'sdfsdfdsfsdfsdfsdfds');

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
-- Table structure for tbl_hot
-- ----------------------------
DROP TABLE IF EXISTS `tbl_hot`;
CREATE TABLE `tbl_hot`  (
  `ids` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `userId` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `courseId` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `teaId` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`ids`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tbl_hot
-- ----------------------------
INSERT INTO `tbl_hot` VALUES ('1584633762796', '1584622453089', '1584622616681', '1584622453089');
INSERT INTO `tbl_hot` VALUES ('1584635380509', '1584635287248', '1584622620510', '1584622453089');
INSERT INTO `tbl_hot` VALUES ('1584635381878', '1584635287248', '1584622616681', '1584622453089');
INSERT INTO `tbl_hot` VALUES ('1585725604872', '1584633943545', '1585709888099', '1585709264633');
INSERT INTO `tbl_hot` VALUES ('1585745737248', '1585745718734', '1585709888099', '1585709264633');
INSERT INTO `tbl_hot` VALUES ('1585745824014', '1585745718734', '1584622616681', '1584622453089');

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
INSERT INTO `tbl_image` VALUES ('1585745661368', '255045c27b60fa94fedcbb0b8af7abaa');
INSERT INTO `tbl_image` VALUES ('1585745668402', '045feffc441cff300586acac713e8dc4');
INSERT INTO `tbl_image` VALUES ('1585745686082', 'fc5eff52fecd61345fd331e1d163a641');

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
INSERT INTO `tbl_news` VALUES ('测试新闻', '1584635698097', '<p><strong><u>八八八八  杀杀杀  </u><em><u>踩踩踩</u></em></strong></p>', 'e92934408222bee85a3d8918a0bb2492', '42a96d005ff3b9ea2f7881e6a77184a7');
INSERT INTO `tbl_news` VALUES ('ccccccccccccccccccccccc', '1585745939727', '', 'b0e76db5de75661a4db1c0653830d8f8', '');

-- ----------------------------
-- Table structure for tbl_sort
-- ----------------------------
DROP TABLE IF EXISTS `tbl_sort`;
CREATE TABLE `tbl_sort`  (
  `names` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ids` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `grade` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `address` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ids`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tbl_sort
-- ----------------------------
INSERT INTO `tbl_sort` VALUES ('语文', '1584622560921', '一年级下', '101');
INSERT INTO `tbl_sort` VALUES ('语文', '1584622569023', '二年级上', '121');
INSERT INTO `tbl_sort` VALUES ('语文', '1584622578216', '一年级上', '103');
INSERT INTO `tbl_sort` VALUES ('数学', '1584622608348', '一年级上', '101');
INSERT INTO `tbl_sort` VALUES ('444', '1584635492210', '一年级下', '4444');

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
INSERT INTO `tbl_teacou` VALUES ('1584622616681', '一年级上', '1584622608348', '数学', '1584622453089', '101');
INSERT INTO `tbl_teacou` VALUES ('1584622620510', '一年级上', '1584622578216', '语文', '1584622453089', '103');
INSERT INTO `tbl_teacou` VALUES ('1584635470762', '二年级上', '1584622569023', '语文', '1584635396923', '121');
INSERT INTO `tbl_teacou` VALUES ('1584635475387', '一年级上', '1584622578216', '语文', '1584635396923', '103');
INSERT INTO `tbl_teacou` VALUES ('1584635503031', '一年级下', '1584635492210', '444', '1584635396923', '4444');
INSERT INTO `tbl_teacou` VALUES ('1585709888099', '一年级上', '1584622578216', '语文', '1585709264633', '103');

-- ----------------------------
-- Table structure for tbl_test
-- ----------------------------
DROP TABLE IF EXISTS `tbl_test`;
CREATE TABLE `tbl_test`  (
  `names` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ids` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `file` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `courseId` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `userId` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ids`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tbl_test
-- ----------------------------
INSERT INTO `tbl_test` VALUES ('小测', '1585732159800', 'e05374358035814452d7695b40e28c69', '1585709888099', '1585709264633');
INSERT INTO `tbl_test` VALUES ('新测试', '1585732175733', '330ff1f8d7c4199d9f95d3993011758a', '1585709888099', '1585709264633');

-- ----------------------------
-- Table structure for tbl_test_list
-- ----------------------------
DROP TABLE IF EXISTS `tbl_test_list`;
CREATE TABLE `tbl_test_list`  (
  `ids` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `myFile` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `testId` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `userId` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ids`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tbl_test_list
-- ----------------------------
INSERT INTO `tbl_test_list` VALUES ('1585732587294', '576668233e42f3e168aa68ff469730d0', '1585732175733', '1584633943545');

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
  `grade` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ids`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tbl_user
-- ----------------------------
INSERT INTO `tbl_user` VALUES ('ttt', '1584622453089', '', 'ttt', 'ttt', '教师');
INSERT INTO `tbl_user` VALUES ('学生', '1584633943545', '', 'sss', 'sss', '学生');
INSERT INTO `tbl_user` VALUES ('我是新教师', '1584635396923', '5b6126d6d3d9102b18c0ab199371f5ba', 'rrr', 'rrr', '教师');
INSERT INTO `tbl_user` VALUES ('wwww', '1585709264633', 'c6128e139711f5314cdf1e8a6f044c99', 'wwww', 'wwww', '教师');
INSERT INTO `tbl_user` VALUES ('sss', '1585725589039', '', 'sss', 'sss', '学生');
INSERT INTO `tbl_user` VALUES ('xxx', '1585745718734', 'c1b023194280b90fed4d5a320f74a7e0', 'xxx', 'xxx', '学生');

-- ----------------------------
-- Table structure for tbl_work
-- ----------------------------
DROP TABLE IF EXISTS `tbl_work`;
CREATE TABLE `tbl_work`  (
  `names` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ids` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `file` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `courseId` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `userId` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ids`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tbl_work
-- ----------------------------
INSERT INTO `tbl_work` VALUES ('测试', '1585721369670', '8b55613432d30a07c1f850e422c1b3cf', '1585709888099', '1585709264633');
INSERT INTO `tbl_work` VALUES ('新练习题', '1585729232637', '417f5216fc554967a0911f5620aa1ea7', '1585709888099', '1585709264633');
INSERT INTO `tbl_work` VALUES ('tttttttttttt', '1585745808101', '0683943188c2d57ff72618a593353275', '1584622616681', '1584622453089');

-- ----------------------------
-- Table structure for tbl_work_list
-- ----------------------------
DROP TABLE IF EXISTS `tbl_work_list`;
CREATE TABLE `tbl_work_list`  (
  `ids` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `myFile` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `workId` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `userId` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ids`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tbl_work_list
-- ----------------------------
INSERT INTO `tbl_work_list` VALUES ('1585730919538', 'fd5830a7ada3f806f2f8d863c264dc7e', '1585729232637', '1584633943545');
INSERT INTO `tbl_work_list` VALUES ('1585732113567', 'efcd4d2e6cf4e2524c55a0244a0119c6', '1585721369670', '1584633943545');
INSERT INTO `tbl_work_list` VALUES ('1585732488964', '8f69a63ad5a89db7f354e03aa3b81267', '1585732175733', '1584633943545');
INSERT INTO `tbl_work_list` VALUES ('1585745857751', '4511e8f1eff1443b822864ca0a8a508e', '1585745808101', '1585745718734');

SET FOREIGN_KEY_CHECKS = 1;

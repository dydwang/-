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

 Date: 30/03/2020 20:34:58
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tbl_active
-- ----------------------------
DROP TABLE IF EXISTS `tbl_active`;
CREATE TABLE `tbl_active`  (
  `teamName` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `username` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ids` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `activeName` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `names` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `team` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `startTime` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `annex` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `endTime` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ids`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tbl_active
-- ----------------------------
INSERT INTO `tbl_active` VALUES ('羽毛球协会', '12345', '1585201763667', 'sdf', '12345', '0', '1583856000000', '4', 'd50553efb90e1bb132c6ebf791a6c565', '1584720000000');
INSERT INTO `tbl_active` VALUES ('篮球协会', '11111111111', '1585229404472', '士大夫士大夫士大夫', '社长', '1', '1583251200000', '4', '3cd645fcda66394e0e8230c617068ef9', '1584633600000');

-- ----------------------------
-- Table structure for tbl_annex
-- ----------------------------
DROP TABLE IF EXISTS `tbl_annex`;
CREATE TABLE `tbl_annex`  (
  `ids` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `names` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `resource` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`ids`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tbl_annex
-- ----------------------------
INSERT INTO `tbl_annex` VALUES ('1', '场地预约表', '988c5c6cebe6bfff5358b0d845e2c53a');
INSERT INTO `tbl_annex` VALUES ('2', '活动申请表', '74e47349b59d78e72fc53db0b8cd41b1');
INSERT INTO `tbl_annex` VALUES ('3', '人事调动表', '376ef612472fa21ca82d064dcc29e99f');

-- ----------------------------
-- Table structure for tbl_build
-- ----------------------------
DROP TABLE IF EXISTS `tbl_build`;
CREATE TABLE `tbl_build`  (
  `teamName` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `username` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ids` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `buildName` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `buildId` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `team` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `names` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `text` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `startTime` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `annex` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `endTime` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ids`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tbl_build
-- ----------------------------
INSERT INTO `tbl_build` VALUES ('羽毛球协会', '12345', '1585227324505', '1号教学楼-2楼-02', '0-1-1', '0', '12345', 'sdfsd', '1583251200000', '4', '0aaabb4f0b14715b94f23519a8ea9b32', '1584028800000');
INSERT INTO `tbl_build` VALUES ('羽毛球协会', '12345', '1585227399737', '1号教学楼-2楼-02', '0-1-1', '0', '12345', 'sdfsd', '1583251200000', '0', '0aaabb4f0b14715b94f23519a8ea9b32', '1584028800000');
INSERT INTO `tbl_build` VALUES ('羽毛球协会', '12345', '1585227430562', '1号教学楼-2楼-07', '0-1-6', '0', '12345', 'dsf', '1582646400000', '0', '0e94f73439741f615664e48bc7917571', '1583510400000');
INSERT INTO `tbl_build` VALUES ('篮球协会', '11111111111', '1585229452268', '1号教学楼-3楼-07', '0-2-6', '1', '社长', '手动阀手动阀', '1583856000000', '4', '4a20c18e9f26af6fa9ef928e9237d9f5', '1584115200000');
INSERT INTO `tbl_build` VALUES ('篮球协会', '11111111111', '1585229519030', '风雨操场-1楼-06', '5-0-5', '1', '社长', '撒旦发射点', '1583164800000', '1', '0f327e899ef88b2cdd981da2ee246605', '1584028800000');

-- ----------------------------
-- Table structure for tbl_comment
-- ----------------------------
DROP TABLE IF EXISTS `tbl_comment`;
CREATE TABLE `tbl_comment`  (
  `userId` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ids` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `text` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `admin` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`ids`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tbl_comment
-- ----------------------------
INSERT INTO `tbl_comment` VALUES ('1585280135024', '1585280587387', 'vbbbvv', 'asdfsdf');
INSERT INTO `tbl_comment` VALUES ('1585280135024', '1585312680589', 'bbbb', '');
INSERT INTO `tbl_comment` VALUES ('1585280135024', '1585312697005', 'cvc', '');
INSERT INTO `tbl_comment` VALUES ('1585325323142', '1585325728809', 'hhhh', 'sdfdsf');

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
  PRIMARY KEY (`ids`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tbl_goods
-- ----------------------------
INSERT INTO `tbl_goods` VALUES ('we', '1585282814004', 'ec3f2caaa7171de6b44380362750da2a,ff9a4bd956d5a01400f5017b0156e3ac', 'we景点介绍景点介绍景点介绍景点介绍景点介绍景点介绍', '1');
INSERT INTO `tbl_goods` VALUES ('测试', '1585284854693', '0bdb3f58f889c48543c33dbde0c2fa87,00539c33125cdea1c14864624382965c', '测试', '5');
INSERT INTO `tbl_goods` VALUES ('cccc', '1585325541608', '518f895171abb54c998b45a7c0d542cd,b2db9ecaa947358d02f03849d4c3a085', 'cccc', '3');

-- ----------------------------
-- Table structure for tbl_hotel
-- ----------------------------
DROP TABLE IF EXISTS `tbl_hotel`;
CREATE TABLE `tbl_hotel`  (
  `names` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ids` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `image` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `text` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `price` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`ids`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tbl_hotel
-- ----------------------------
INSERT INTO `tbl_hotel` VALUES ('WCW', '1585324698956', 'cee0cf24255b8e93171e5525141cc004', 'WCWC', '3');
INSERT INTO `tbl_hotel` VALUES ('酒店', '1585325599298', 'e9384a4f376c85e55bb372849299fed0,263bb4c9a3f91e7031b5ef74d2070093', '酒店', '3');

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
INSERT INTO `tbl_image` VALUES ('1585325497571', '041b916b93d3e147b34ccfaa0137d1a0');
INSERT INTO `tbl_image` VALUES ('1585325509178', '301a9b549813df1c51baabd3cf8af294');

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
INSERT INTO `tbl_news` VALUES ('wwwwww', '1585229089810', '<p>wwww</p>', '', '');
INSERT INTO `tbl_news` VALUES ('xx', '1585229224139', '<p>xxx</p>', '', '');
INSERT INTO `tbl_news` VALUES ('xxxxx', '1585325801923', '<p><strong>测试新闻测试新闻测试新</strong>闻测试<u>新闻测试新闻测试新</u>闻测试新闻测试新闻测试新闻测试新闻测试新闻测试新闻测试新闻测试新闻测试新闻测试新闻测试新闻测试新闻测试新闻测<em>试新闻测试新</em>闻</p>', 'de3ae2e1554a84ba7c88a20133ce1980', 'd011aaa15f27f8a8ce19df08d6b1c6ec');

-- ----------------------------
-- Table structure for tbl_pay
-- ----------------------------
DROP TABLE IF EXISTS `tbl_pay`;
CREATE TABLE `tbl_pay`  (
  `userId` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ids` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `time` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `num` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `price` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`ids`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tbl_pay
-- ----------------------------
INSERT INTO `tbl_pay` VALUES ('1585280135024', '1585309784992', '1583164800000', '测试门票', '2', '5');
INSERT INTO `tbl_pay` VALUES ('1585280135024', '1585311824883', '1583683200000', 'we景点门票', '1', '1');
INSERT INTO `tbl_pay` VALUES ('1585280135024', '1585311828481', '1583942400000', 'we景点门票', '1', '1');
INSERT INTO `tbl_pay` VALUES ('1585280135024', '1585311832194', '1582646400000', 'we景点门票', '1', '1');
INSERT INTO `tbl_pay` VALUES ('1585280135024', '1585311836192', '1583424000000', 'we景点门票', '1', '1');
INSERT INTO `tbl_pay` VALUES ('1585280135024', '1585311840222', '1583164800000', 'we景点门票', '4', '1');
INSERT INTO `tbl_pay` VALUES ('1585280135024', '1585311843677', '1583337600000', 'we景点门票', '1', '1');
INSERT INTO `tbl_pay` VALUES ('1585280135024', '1585311846993', '1583337600000', 'we景点门票', '1', '1');
INSERT INTO `tbl_pay` VALUES ('1585280135024', '1585311850431', '1583942400000', 'we景点门票', '1', '1');
INSERT INTO `tbl_pay` VALUES ('1585280135024', '1585312100453', '1583251200000', 'we景点门票', '5', '1');
INSERT INTO `tbl_pay` VALUES ('1585280135024', '1585312106076', '1583942400000', 'we景点门票', '8', '1');
INSERT INTO `tbl_pay` VALUES ('1585325323142', '1585325655834', '1583078400000', 'cccc景点门票', '1', '3');
INSERT INTO `tbl_pay` VALUES ('1585325323142', '1585325669212', '1583683200000', 'cccc景点门票', '1', '3');
INSERT INTO `tbl_pay` VALUES ('1585325323142', '1585325672578', '1583942400000', 'cccc景点门票', '1', '3');
INSERT INTO `tbl_pay` VALUES ('1585325323142', '1585325675722', '1583251200000', 'cccc景点门票', '1', '3');
INSERT INTO `tbl_pay` VALUES ('1585325323142', '1585325678853', '1583424000000', 'cccc景点门票', '1', '3');
INSERT INTO `tbl_pay` VALUES ('1585325323142', '1585325685011', '1585497600000', 'cccc景点门票', '4', '3');
INSERT INTO `tbl_pay` VALUES ('1585325323142', '1585325689295', '1583337600000', 'cccc景点门票', '1', '3');
INSERT INTO `tbl_pay` VALUES ('1585325323142', '1585325692664', '1584460800000', 'cccc景点门票', '1', '3');
INSERT INTO `tbl_pay` VALUES ('1585325323142', '1585325704846', '1583769600000', '酒店景点门票', '3', '3');
INSERT INTO `tbl_pay` VALUES ('1585325323142', '1585325708544', '1583251200000', '酒店景点门票', '1', '3');
INSERT INTO `tbl_pay` VALUES ('1585325323142', '1585325713164', '1584547200000', '酒店景点门票', '1', '3');

-- ----------------------------
-- Table structure for tbl_per
-- ----------------------------
DROP TABLE IF EXISTS `tbl_per`;
CREATE TABLE `tbl_per`  (
  `teamName` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `username` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `names` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `team` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `grade` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `annex` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`username`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tbl_per
-- ----------------------------
INSERT INTO `tbl_per` VALUES ('羽毛球协会', '1111111', '1111111', '1111111', '0', '1', '2', 'dda3ff991d033bbf98f2f1318cc3bae6');
INSERT INTO `tbl_per` VALUES ('篮球协会', '11111111111', '22222', '社长', '1', '0', '2', '68c3dd7e301dd5aa011009f31faeffff');
INSERT INTO `tbl_per` VALUES ('羽毛球协会', '12345', '12345', '12345', '0', '0', '2', 'e7c84b1d3993cbb4c9f293ef3c7abd35');
INSERT INTO `tbl_per` VALUES ('羽毛球协会', '123456', '123456', '123456', '0', '1', '2', '7963d2bb57efe147813138e2a1effd03');
INSERT INTO `tbl_per` VALUES ('羽毛球协会', '123456123456', '123456123456', '123456', '0', '2', '2', '2bccb5569013fc4208da2d6864fa65cc');
INSERT INTO `tbl_per` VALUES ('篮球协会', '456564894415', '456564894415', '队员', '1', '2', '3', 'dce6513db364939232764c08ef78d11c');
INSERT INTO `tbl_per` VALUES ('羽毛球协会', '789789', '789789', '789789', '0', '1', '3', '065c32b19a2c96a6ec561a6f93bd0e7f');
INSERT INTO `tbl_per` VALUES ('篮球协会', '79878945', '79878945', 'sdfsdfsd', '1', '2', '2', '64779730de4f56b6abf5acddc96951f0');

-- ----------------------------
-- Table structure for tbl_show
-- ----------------------------
DROP TABLE IF EXISTS `tbl_show`;
CREATE TABLE `tbl_show`  (
  `teamName` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `names` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `team` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `username` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ids` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `title` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `module` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `annex` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `text` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ids`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tbl_show
-- ----------------------------
INSERT INTO `tbl_show` VALUES ('羽毛球协会', '12345', '0', '12345', '1585208920104', 'ss', '0', 'a1246cd6d89fc925b779164fb62356f0', 'xc');
INSERT INTO `tbl_show` VALUES ('羽毛球协会', '12345', '0', '12345', '1585214950396', 'ccc', '1', '5bba470216b58db6dc43b9ae7a669261', 'cccc');
INSERT INTO `tbl_show` VALUES ('羽毛球协会', '12345', '0', '12345', '1585215692076', '车', '2', 'dff41e86fe8cc6fc2ca612e0a713edfc,02125f8112d975e63ec6a582a4777917,fe548fb5dc240cc14e5c0a3d4842501b,2a11959e9baee335bceb8dc20a80e136', '好车');
INSERT INTO `tbl_show` VALUES ('篮球协会', '社长', '1', '11111111111', '1585229622930', 'dsfsdfsd', '2', '43f7f78551e5b5bca27a8d8b62bcf88f,5826c1310746e66f9e1374769bcc8308', 'sdfsdfsdf');

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
INSERT INTO `tbl_user` VALUES ('www', '1585325323142', 'dae24a60d7d0ab6f17e5625ad0c854cc', 'www', 'www', '', '管理员');
INSERT INTO `tbl_user` VALUES ('ccc', '1585325630445', '', 'ccc', 'ccc', '', '普通用户');

SET FOREIGN_KEY_CHECKS = 1;

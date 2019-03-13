/*
Navicat MySQL Data Transfer

Source Server         : jquery
Source Server Version : 50714
Source Host           : localhost:3306
Source Database       : jquery_myschool

Target Server Type    : MYSQL
Target Server Version : 50714
File Encoding         : 65001

Date: 2018-07-07 17:43:28
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for province
-- ----------------------------
DROP TABLE IF EXISTS `province`;
CREATE TABLE `province` (
  `id` int(11) NOT NULL,
  `province_name` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of province
-- ----------------------------
INSERT INTO `province` VALUES ('1', '广东');
INSERT INTO `province` VALUES ('2', '湖南');
INSERT INTO `province` VALUES ('3', '湖北');
INSERT INTO `province` VALUES ('4', '江苏');
INSERT INTO `province` VALUES ('5', '山东');
INSERT INTO `province` VALUES ('6', '安徽');
INSERT INTO `province` VALUES ('7', '四川');
INSERT INTO `province` VALUES ('8', '黑龙江');
INSERT INTO `province` VALUES ('9', '内蒙古');
INSERT INTO `province` VALUES ('10', '西藏');

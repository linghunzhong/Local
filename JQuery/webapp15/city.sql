/*
Navicat MySQL Data Transfer

Source Server         : jquery
Source Server Version : 50714
Source Host           : localhost:3306
Source Database       : jquery_myschool

Target Server Type    : MYSQL
Target Server Version : 50714
File Encoding         : 65001

Date: 2018-07-07 17:43:13
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for city
-- ----------------------------
DROP TABLE IF EXISTS `city`;
CREATE TABLE `city` (
  `id` int(22) NOT NULL,
  `city_name` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `province_id` int(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `city_ibfk_1` (`province_id`),
  CONSTRAINT `city_ibfk_1` FOREIGN KEY (`province_id`) REFERENCES `province` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of city
-- ----------------------------
INSERT INTO `city` VALUES ('1', '东莞', '1');
INSERT INTO `city` VALUES ('2', '深圳', '1');
INSERT INTO `city` VALUES ('3', '虎门', '1');
INSERT INTO `city` VALUES ('4', '岳阳', '2');
INSERT INTO `city` VALUES ('5', '株洲', '2');
INSERT INTO `city` VALUES ('6', '长沙', '2');
INSERT INTO `city` VALUES ('7', '赤壁', '3');
INSERT INTO `city` VALUES ('8', '武汉', '3');
INSERT INTO `city` VALUES ('9', '宜昌', '3');
INSERT INTO `city` VALUES ('10', '江苏1', '4');
INSERT INTO `city` VALUES ('11', '山东1', '5');
INSERT INTO `city` VALUES ('12', '安徽1', '6');
INSERT INTO `city` VALUES ('13', '四川1', '7');
INSERT INTO `city` VALUES ('14', '黑龙江1', '8');
INSERT INTO `city` VALUES ('15', '内蒙古1', '9');
INSERT INTO `city` VALUES ('16', '西藏1', '10');

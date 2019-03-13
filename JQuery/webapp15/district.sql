/*
Navicat MySQL Data Transfer

Source Server         : jquery
Source Server Version : 50714
Source Host           : localhost:3306
Source Database       : jquery_myschool

Target Server Type    : MYSQL
Target Server Version : 50714
File Encoding         : 65001

Date: 2018-07-07 17:43:21
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for district
-- ----------------------------
DROP TABLE IF EXISTS `district`;
CREATE TABLE `district` (
  `id` int(11) NOT NULL,
  `district_name` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `city_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `city_ibfk_2` (`city_id`),
  CONSTRAINT `city_ibfk_2` FOREIGN KEY (`city_id`) REFERENCES `city` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of district
-- ----------------------------
INSERT INTO `district` VALUES ('1', '东莞2.1', '1');
INSERT INTO `district` VALUES ('2', '东莞2.2', '1');
INSERT INTO `district` VALUES ('3', '东莞2.3', '1');
INSERT INTO `district` VALUES ('4', '深圳2.1', '2');
INSERT INTO `district` VALUES ('5', '深圳2.2', '2');
INSERT INTO `district` VALUES ('6', '深圳2.3', '2');
INSERT INTO `district` VALUES ('7', '虎门2.1', '3');
INSERT INTO `district` VALUES ('8', '虎门2.2', '3');
INSERT INTO `district` VALUES ('9', '虎门2.3', '3');
INSERT INTO `district` VALUES ('10', '岳阳2.1', '4');
INSERT INTO `district` VALUES ('11', '岳阳2.2', '4');
INSERT INTO `district` VALUES ('12', '岳阳2.3', '4');
INSERT INTO `district` VALUES ('13', '株洲2.1', '5');
INSERT INTO `district` VALUES ('14', '株洲2.2', '5');
INSERT INTO `district` VALUES ('15', '株洲2.3', '5');
INSERT INTO `district` VALUES ('16', '长沙2.1', '6');
INSERT INTO `district` VALUES ('17', '长沙2.2', '6');
INSERT INTO `district` VALUES ('18', '长沙2.3', '6');
INSERT INTO `district` VALUES ('19', '赤壁2.1', '7');
INSERT INTO `district` VALUES ('20', '赤壁2.2', '7');
INSERT INTO `district` VALUES ('21', '赤壁2.3', '7');
INSERT INTO `district` VALUES ('22', '武汉2.1', '8');
INSERT INTO `district` VALUES ('23', '武汉2.2', '8');
INSERT INTO `district` VALUES ('24', '武汉2.3', '8');
INSERT INTO `district` VALUES ('25', '宜昌2.1', '9');
INSERT INTO `district` VALUES ('26', '宜昌2.2', '9');
INSERT INTO `district` VALUES ('27', '宜昌2.3', '9');
INSERT INTO `district` VALUES ('28', '江苏2', '10');
INSERT INTO `district` VALUES ('29', '山东2', '11');
INSERT INTO `district` VALUES ('30', '安徽2', '12');
INSERT INTO `district` VALUES ('31', '四川2', '13');
INSERT INTO `district` VALUES ('32', '黑龙江2', '14');
INSERT INTO `district` VALUES ('33', '内蒙古2', '15');
INSERT INTO `district` VALUES ('34', '西藏2', '16');

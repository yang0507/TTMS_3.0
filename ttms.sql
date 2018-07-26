/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : ttms

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2018-07-27 01:16:40
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `data_dict`
-- ----------------------------
DROP TABLE IF EXISTS `data_dict`;
CREATE TABLE `data_dict` (
  `dict_id` int(11) NOT NULL AUTO_INCREMENT,
  `dict_parent_id` int(11) DEFAULT NULL,
  `dict_index` int(11) DEFAULT NULL,
  `dict_name` varchar(200) DEFAULT NULL,
  `dict_value` varchar(100) NOT NULL,
  PRIMARY KEY (`dict_id`),
  KEY `FK_super_child_dict` (`dict_parent_id`),
  CONSTRAINT `FK_super_child_dict` FOREIGN KEY (`dict_parent_id`) REFERENCES `data_dict` (`dict_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of data_dict
-- ----------------------------
INSERT INTO `data_dict` VALUES ('1', null, '1', '数据字典', '根');
INSERT INTO `data_dict` VALUES ('2', '1', '2', 'PLAYTYPE', '影片类型');
INSERT INTO `data_dict` VALUES ('3', '1', '3', 'PLAYLANG', '影片语言');
INSERT INTO `data_dict` VALUES ('4', '1', '4', '锁失效时间', '5');
INSERT INTO `data_dict` VALUES ('5', '2', '1', 'Costume Drama', '奇幻片');
INSERT INTO `data_dict` VALUES ('6', '2', '2', 'Anime Piece', '动画片');
INSERT INTO `data_dict` VALUES ('7', '2', '3', 'Life Drama', '喜剧');
INSERT INTO `data_dict` VALUES ('8', '2', '4', 'Horror Movies', '恐怖片');
INSERT INTO `data_dict` VALUES ('9', '2', '5', 'War Movies', '战争片');
INSERT INTO `data_dict` VALUES ('10', '2', '6', 'Science Fiction', '科幻片');
INSERT INTO `data_dict` VALUES ('11', '3', '1', 'Chinese', '国语');
INSERT INTO `data_dict` VALUES ('12', '3', '2', 'English', '英语');
INSERT INTO `data_dict` VALUES ('14', '3', '3', 'French', '法语');
INSERT INTO `data_dict` VALUES ('15', '3', '4', 'Spanish', '西班牙语');
INSERT INTO `data_dict` VALUES ('16', '2', '7', 'youngLife', '青春片');
INSERT INTO `data_dict` VALUES ('17', '3', '5', 'Korean', '韩语');

-- ----------------------------
-- Table structure for `employee`
-- ----------------------------
DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee` (
  `emp_id` int(11) NOT NULL AUTO_INCREMENT,
  `emp_no` varchar(20) NOT NULL,
  `emp_name` varchar(100) NOT NULL,
  `emp_tel_num` varchar(20) DEFAULT NULL,
  `emp_addr` varchar(200) DEFAULT NULL,
  `emp_email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`emp_id`),
  UNIQUE KEY `emp_no` (`emp_no`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of employee
-- ----------------------------
INSERT INTO `employee` VALUES ('4', '004', '刘六六', '44444', '西一路44号', '444@sina.com.cn');
INSERT INTO `employee` VALUES ('6', '006', '李念', '66666', '大溪地66号', '666@xiyou.edu.cn');
INSERT INTO `employee` VALUES ('7', '007', '凌霜华', '77777', '大溪地77号', '777@xiyou.edu.cn');
INSERT INTO `employee` VALUES ('8', '008', '景茵梦', '88888', '大溪地88号', '888@xiyou.edu.cn');
INSERT INTO `employee` VALUES ('9', '009', '任水寒', '99999', '大溪地99号', '18220095376@163.com');
INSERT INTO `employee` VALUES ('10', '010', '丁玲珑', '10101', '大溪地10号', '100@xiyou.edu.cn');
INSERT INTO `employee` VALUES ('11', '011', '柳兰歌', '11111', '大溪地11号', '111@xiyou.edu.cn');
INSERT INTO `employee` VALUES ('12', '012', '燕七', '12121', '大溪地12号', '121@xiyou.edu.cn');
INSERT INTO `employee` VALUES ('13', '013', '丁典', '13131', '大溪地13号', '131@xiyou.edu.cn');
INSERT INTO `employee` VALUES ('14', '014', '袁冠南', '14141', '大溪地14号', '141@xiyou.edu.cn');
INSERT INTO `employee` VALUES ('15', 'guest04', '老胡', '17812345674', '吉祥村004号', 'laohu@tom.com');
INSERT INTO `employee` VALUES ('16', 'guest05', '老钱', '15612345678', '西斜七路005号', 'laoqian@yahoo.com.cn');
INSERT INTO `employee` VALUES ('17', 'guest06', '老章', '18710905922', '西长安街121号', 'laozhang@sohu.com');
INSERT INTO `employee` VALUES ('18', 'qwerttttt', '王新春', '15829010180', '鸿商富贾赛季', 'eu199@126.com');
INSERT INTO `employee` VALUES ('19', 'dfsf333', '就是他', '15829010180', '富商区', '144@qq.com');
INSERT INTO `employee` VALUES ('22', '182', '杨召', '11111111111', '三原县', '176@163.com');
INSERT INTO `employee` VALUES ('24', '090', '杨', '11111111111', '三原县', '176@163.com');

-- ----------------------------
-- Table structure for `play`
-- ----------------------------
DROP TABLE IF EXISTS `play`;
CREATE TABLE `play` (
  `play_id` int(11) NOT NULL AUTO_INCREMENT,
  `play_type_id` int(11) DEFAULT NULL,
  `play_lang_id` int(11) DEFAULT NULL,
  `play_name` varchar(200) DEFAULT NULL,
  `play_introduction` varchar(2000) DEFAULT NULL,
  `play_image` varchar(100) DEFAULT NULL,
  `play_length` int(11) DEFAULT NULL,
  `play_ticket_price` decimal(10,2) DEFAULT NULL,
  `play_status` smallint(6) DEFAULT '0' COMMENT '取值含义：\r\n            0：待安排演出\r\n            1：已安排演出\r\n            -1：下线\r\n            -2：删除不再显示到系统中',
  PRIMARY KEY (`play_id`),
  KEY `FK_dict_lan_play` (`play_lang_id`),
  KEY `FK_dict_type_play` (`play_type_id`),
  CONSTRAINT `FK_dict_lan_play` FOREIGN KEY (`play_lang_id`) REFERENCES `data_dict` (`dict_id`),
  CONSTRAINT `FK_dict_type_play` FOREIGN KEY (`play_type_id`) REFERENCES `data_dict` (`dict_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of play
-- ----------------------------
INSERT INTO `play` VALUES ('1', '6', '11', '大圣归来', '精品国漫', 'tu/12.jpg', '112', '23.00', '1');
INSERT INTO `play` VALUES ('4', '6', '11', '上班这些事', '哈哈哈', 'tu/9eacbc1f.png', '120', '23.00', '1');
INSERT INTO `play` VALUES ('5', '16', '11', '花过天晴', '洋溢着青春气息', 'tu/c8320b95.png', '120', '22.00', '1');
INSERT INTO `play` VALUES ('6', '5', '17', '天后传', '奇幻', 'tu/930e1d19.png', '120', '23.00', '1');

-- ----------------------------
-- Table structure for `sale`
-- ----------------------------
DROP TABLE IF EXISTS `sale`;
CREATE TABLE `sale` (
  `sale_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `emp_id` int(11) DEFAULT NULL,
  `sale_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `sale_payment` decimal(10,2) DEFAULT NULL,
  `sale_change` decimal(10,2) DEFAULT NULL,
  `sale_type` smallint(6) DEFAULT NULL COMMENT '类别取值含义：\r\n            1：销售单\r\n            -1：退款单',
  `sale_status` smallint(6) DEFAULT NULL COMMENT '销售单状态如下：\r\n            0：代付款\r\n            1：已付款\r\n            -2：删除不再显示到系统中',
  PRIMARY KEY (`sale_ID`),
  KEY `FK_employee_sale` (`emp_id`),
  CONSTRAINT `FK_employee_sale` FOREIGN KEY (`emp_id`) REFERENCES `employee` (`emp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sale
-- ----------------------------
INSERT INTO `sale` VALUES ('1', '22', '2018-06-11 16:06:26', '23.40', null, '1', '1');
INSERT INTO `sale` VALUES ('2', '22', '2018-06-11 16:07:18', '163.80', null, '1', '1');
INSERT INTO `sale` VALUES ('3', '22', '2018-06-12 11:23:20', '23.40', null, '-1', '1');
INSERT INTO `sale` VALUES ('4', '22', '2018-06-12 18:57:01', '2.00', null, '1', '1');
INSERT INTO `sale` VALUES ('5', '22', '2018-06-12 18:57:33', '2.00', null, '-1', '1');
INSERT INTO `sale` VALUES ('6', '22', '2018-06-12 20:48:37', '6.00', null, '1', '1');
INSERT INTO `sale` VALUES ('7', '22', '2018-06-12 20:49:57', '2.00', null, '-1', '1');
INSERT INTO `sale` VALUES ('8', '22', '2018-06-13 08:59:23', '46.80', null, '1', '1');
INSERT INTO `sale` VALUES ('9', '22', '2018-06-13 09:10:28', '23.40', null, '1', '1');
INSERT INTO `sale` VALUES ('10', '22', '2018-06-13 09:13:11', '70.20', null, '1', '1');
INSERT INTO `sale` VALUES ('11', '22', '2018-06-13 10:21:35', '163.80', null, '1', '1');
INSERT INTO `sale` VALUES ('12', '22', '2018-06-14 09:39:59', '93.60', null, '1', '1');
INSERT INTO `sale` VALUES ('13', '22', '2018-06-14 21:01:47', '69.00', null, '1', '1');
INSERT INTO `sale` VALUES ('14', '22', '2018-06-14 21:02:07', '115.00', null, '1', '1');
INSERT INTO `sale` VALUES ('15', '22', '2018-06-14 21:03:24', '23.00', null, '-1', '1');
INSERT INTO `sale` VALUES ('16', '22', '2018-06-15 12:43:37', '92.00', null, '1', '1');
INSERT INTO `sale` VALUES ('17', '22', '2018-06-15 12:44:44', '23.00', null, '-1', '1');

-- ----------------------------
-- Table structure for `sale_item`
-- ----------------------------
DROP TABLE IF EXISTS `sale_item`;
CREATE TABLE `sale_item` (
  `sale_item_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ticket_id` bigint(20) DEFAULT NULL,
  `sale_ID` bigint(20) DEFAULT NULL,
  `sale_item_price` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`sale_item_id`),
  KEY `FK_sale_sale_item` (`sale_ID`),
  KEY `FK_ticket_sale_item` (`ticket_id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sale_item
-- ----------------------------
INSERT INTO `sale_item` VALUES ('1', '1162', '1', '23.40');
INSERT INTO `sale_item` VALUES ('2', '1225', '2', '23.40');
INSERT INTO `sale_item` VALUES ('3', '1235', '2', '23.40');
INSERT INTO `sale_item` VALUES ('4', '1245', '2', '23.40');
INSERT INTO `sale_item` VALUES ('5', '1246', '2', '23.40');
INSERT INTO `sale_item` VALUES ('6', '1247', '2', '23.40');
INSERT INTO `sale_item` VALUES ('7', '1247', '2', '23.40');
INSERT INTO `sale_item` VALUES ('8', '1236', '2', '23.40');
INSERT INTO `sale_item` VALUES ('9', '1162', '3', '23.40');
INSERT INTO `sale_item` VALUES ('10', '1571', '4', '2.00');
INSERT INTO `sale_item` VALUES ('11', '1571', '5', '2.00');
INSERT INTO `sale_item` VALUES ('12', '1675', '6', '2.00');
INSERT INTO `sale_item` VALUES ('13', '1675', '6', '2.00');
INSERT INTO `sale_item` VALUES ('14', '1680', '6', '2.00');
INSERT INTO `sale_item` VALUES ('15', '1680', '7', '2.00');
INSERT INTO `sale_item` VALUES ('16', '1162', '8', '23.40');
INSERT INTO `sale_item` VALUES ('17', '1218', '8', '23.40');
INSERT INTO `sale_item` VALUES ('18', '1209', '9', '23.40');
INSERT INTO `sale_item` VALUES ('19', '1217', '10', '23.40');
INSERT INTO `sale_item` VALUES ('20', '1227', '10', '23.40');
INSERT INTO `sale_item` VALUES ('21', '1228', '10', '23.40');
INSERT INTO `sale_item` VALUES ('22', '1164', '11', '23.40');
INSERT INTO `sale_item` VALUES ('23', '1164', '11', '23.40');
INSERT INTO `sale_item` VALUES ('24', '1165', '11', '23.40');
INSERT INTO `sale_item` VALUES ('25', '1166', '11', '23.40');
INSERT INTO `sale_item` VALUES ('26', '1175', '11', '23.40');
INSERT INTO `sale_item` VALUES ('27', '1174', '11', '23.40');
INSERT INTO `sale_item` VALUES ('28', '1173', '11', '23.40');
INSERT INTO `sale_item` VALUES ('29', '1168', '12', '23.40');
INSERT INTO `sale_item` VALUES ('30', '1169', '12', '23.40');
INSERT INTO `sale_item` VALUES ('31', '1170', '12', '23.40');
INSERT INTO `sale_item` VALUES ('32', '1171', '12', '23.40');
INSERT INTO `sale_item` VALUES ('33', '1691', '13', '23.00');
INSERT INTO `sale_item` VALUES ('34', '1692', '13', '23.00');
INSERT INTO `sale_item` VALUES ('35', '1693', '13', '23.00');
INSERT INTO `sale_item` VALUES ('36', '1717', '14', '23.00');
INSERT INTO `sale_item` VALUES ('37', '1717', '14', '23.00');
INSERT INTO `sale_item` VALUES ('38', '1718', '14', '23.00');
INSERT INTO `sale_item` VALUES ('39', '1725', '14', '23.00');
INSERT INTO `sale_item` VALUES ('40', '1726', '14', '23.00');
INSERT INTO `sale_item` VALUES ('41', '1717', '15', '23.00');
INSERT INTO `sale_item` VALUES ('42', '2019', '16', '23.00');
INSERT INTO `sale_item` VALUES ('43', '2020', '16', '23.00');
INSERT INTO `sale_item` VALUES ('44', '2020', '16', '23.00');
INSERT INTO `sale_item` VALUES ('45', '2021', '16', '23.00');
INSERT INTO `sale_item` VALUES ('46', '2019', '17', '23.00');

-- ----------------------------
-- Table structure for `schedule`
-- ----------------------------
DROP TABLE IF EXISTS `schedule`;
CREATE TABLE `schedule` (
  `sched_id` int(11) NOT NULL AUTO_INCREMENT,
  `studio_id` int(11) DEFAULT NULL,
  `play_id` int(11) DEFAULT NULL,
  `sched_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `sched_ticket_price` double(11,2) DEFAULT NULL,
  `sched_status` int(11) unsigned zerofill DEFAULT '00000000000' COMMENT '0 无票\r\n1 有票',
  PRIMARY KEY (`sched_id`),
  KEY `FK_play_sched` (`play_id`),
  KEY `FK_studio_sched` (`studio_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of schedule
-- ----------------------------
INSERT INTO `schedule` VALUES ('2', '1', '1', '2018-02-13 10:43:56', '23.40', '00000000001');
INSERT INTO `schedule` VALUES ('3', '1', '1', '2018-06-07 10:38:16', '32.10', '00000000001');
INSERT INTO `schedule` VALUES ('4', '1', '1', '2018-06-07 10:38:17', '122.00', '00000000001');
INSERT INTO `schedule` VALUES ('9', '11', '3', '2018-06-07 10:38:19', '123.00', '00000000001');
INSERT INTO `schedule` VALUES ('10', '12', '4', '2018-06-07 10:38:25', '22.00', '00000000001');
INSERT INTO `schedule` VALUES ('12', '13', '1', '2018-06-07 11:01:17', '23.00', '00000000001');
INSERT INTO `schedule` VALUES ('13', '1', '1', '2018-06-07 11:17:09', '12.00', '00000000001');
INSERT INTO `schedule` VALUES ('16', '1', '1', '2017-05-23 18:35:30', '12.00', '00000000001');
INSERT INTO `schedule` VALUES ('18', '4', '4', '2018-06-15 21:26:33', '12.00', '00000000001');
INSERT INTO `schedule` VALUES ('19', '7', '1', '2018-06-16 21:29:52', '23.00', '00000000000');
INSERT INTO `schedule` VALUES ('21', '1', '5', '2018-06-15 23:01:54', '52.00', '00000000001');
INSERT INTO `schedule` VALUES ('22', '18', '6', '2018-06-16 12:42:21', '23.00', '00000000001');

-- ----------------------------
-- Table structure for `seat`
-- ----------------------------
DROP TABLE IF EXISTS `seat`;
CREATE TABLE `seat` (
  `seat_id` int(11) NOT NULL AUTO_INCREMENT,
  `studio_id` int(11) DEFAULT NULL,
  `seat_row` int(11) DEFAULT NULL,
  `seat_column` int(11) DEFAULT NULL,
  `seat_status` smallint(6) DEFAULT NULL COMMENT '取值含义：\r\n                       0：此处是空位，没有安排座椅\r\n                       1：完好的座位，可以使用\r\n                       -1：座位损坏，不能安排座位',
  PRIMARY KEY (`seat_id`),
  KEY `FK_studio_seat` (`studio_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12637 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of seat
-- ----------------------------
INSERT INTO `seat` VALUES ('12100', '1', '1', '1', '1');
INSERT INTO `seat` VALUES ('12101', '1', '1', '2', '1');
INSERT INTO `seat` VALUES ('12102', '1', '1', '3', '1');
INSERT INTO `seat` VALUES ('12103', '1', '1', '4', '1');
INSERT INTO `seat` VALUES ('12104', '1', '1', '5', '0');
INSERT INTO `seat` VALUES ('12105', '1', '1', '6', '0');
INSERT INTO `seat` VALUES ('12106', '1', '1', '7', '1');
INSERT INTO `seat` VALUES ('12107', '1', '1', '8', '1');
INSERT INTO `seat` VALUES ('12108', '1', '1', '9', '1');
INSERT INTO `seat` VALUES ('12109', '1', '1', '10', '1');
INSERT INTO `seat` VALUES ('12110', '1', '2', '1', '1');
INSERT INTO `seat` VALUES ('12111', '1', '2', '2', '1');
INSERT INTO `seat` VALUES ('12112', '1', '2', '3', '1');
INSERT INTO `seat` VALUES ('12113', '1', '2', '4', '1');
INSERT INTO `seat` VALUES ('12114', '1', '2', '5', '1');
INSERT INTO `seat` VALUES ('12115', '1', '2', '6', '0');
INSERT INTO `seat` VALUES ('12116', '1', '2', '7', '1');
INSERT INTO `seat` VALUES ('12117', '1', '2', '8', '1');
INSERT INTO `seat` VALUES ('12118', '1', '2', '9', '1');
INSERT INTO `seat` VALUES ('12119', '1', '2', '10', '1');
INSERT INTO `seat` VALUES ('12120', '1', '3', '1', '1');
INSERT INTO `seat` VALUES ('12121', '1', '3', '2', '1');
INSERT INTO `seat` VALUES ('12122', '1', '3', '3', '1');
INSERT INTO `seat` VALUES ('12123', '1', '3', '4', '1');
INSERT INTO `seat` VALUES ('12124', '1', '3', '5', '1');
INSERT INTO `seat` VALUES ('12125', '1', '3', '6', '1');
INSERT INTO `seat` VALUES ('12126', '1', '3', '7', '1');
INSERT INTO `seat` VALUES ('12127', '1', '3', '8', '1');
INSERT INTO `seat` VALUES ('12128', '1', '3', '9', '1');
INSERT INTO `seat` VALUES ('12129', '1', '3', '10', '1');
INSERT INTO `seat` VALUES ('12130', '1', '4', '1', '1');
INSERT INTO `seat` VALUES ('12131', '1', '4', '2', '1');
INSERT INTO `seat` VALUES ('12132', '1', '4', '3', '0');
INSERT INTO `seat` VALUES ('12133', '1', '4', '4', '1');
INSERT INTO `seat` VALUES ('12134', '1', '4', '5', '1');
INSERT INTO `seat` VALUES ('12135', '1', '4', '6', '1');
INSERT INTO `seat` VALUES ('12136', '1', '4', '7', '1');
INSERT INTO `seat` VALUES ('12137', '1', '4', '8', '1');
INSERT INTO `seat` VALUES ('12138', '1', '4', '9', '1');
INSERT INTO `seat` VALUES ('12139', '1', '4', '10', '1');
INSERT INTO `seat` VALUES ('12140', '1', '5', '1', '1');
INSERT INTO `seat` VALUES ('12141', '1', '5', '2', '1');
INSERT INTO `seat` VALUES ('12142', '1', '5', '3', '1');
INSERT INTO `seat` VALUES ('12143', '1', '5', '4', '1');
INSERT INTO `seat` VALUES ('12144', '1', '5', '5', '1');
INSERT INTO `seat` VALUES ('12145', '1', '5', '6', '1');
INSERT INTO `seat` VALUES ('12146', '1', '5', '7', '1');
INSERT INTO `seat` VALUES ('12147', '1', '5', '8', '1');
INSERT INTO `seat` VALUES ('12148', '1', '5', '9', '1');
INSERT INTO `seat` VALUES ('12149', '1', '5', '10', '1');
INSERT INTO `seat` VALUES ('12150', '1', '6', '1', '1');
INSERT INTO `seat` VALUES ('12151', '1', '6', '2', '1');
INSERT INTO `seat` VALUES ('12152', '1', '6', '3', '1');
INSERT INTO `seat` VALUES ('12153', '1', '6', '4', '1');
INSERT INTO `seat` VALUES ('12154', '1', '6', '5', '1');
INSERT INTO `seat` VALUES ('12155', '1', '6', '6', '1');
INSERT INTO `seat` VALUES ('12156', '1', '6', '7', '1');
INSERT INTO `seat` VALUES ('12157', '1', '6', '8', '1');
INSERT INTO `seat` VALUES ('12158', '1', '6', '9', '1');
INSERT INTO `seat` VALUES ('12159', '1', '6', '10', '1');
INSERT INTO `seat` VALUES ('12160', '1', '7', '1', '1');
INSERT INTO `seat` VALUES ('12161', '1', '7', '2', '1');
INSERT INTO `seat` VALUES ('12162', '1', '7', '3', '1');
INSERT INTO `seat` VALUES ('12163', '1', '7', '4', '1');
INSERT INTO `seat` VALUES ('12164', '1', '7', '5', '1');
INSERT INTO `seat` VALUES ('12165', '1', '7', '6', '1');
INSERT INTO `seat` VALUES ('12166', '1', '7', '7', '1');
INSERT INTO `seat` VALUES ('12167', '1', '7', '8', '1');
INSERT INTO `seat` VALUES ('12168', '1', '7', '9', '1');
INSERT INTO `seat` VALUES ('12169', '1', '7', '10', '1');
INSERT INTO `seat` VALUES ('12170', '1', '8', '1', '1');
INSERT INTO `seat` VALUES ('12171', '1', '8', '2', '1');
INSERT INTO `seat` VALUES ('12172', '1', '8', '3', '1');
INSERT INTO `seat` VALUES ('12173', '1', '8', '4', '1');
INSERT INTO `seat` VALUES ('12174', '1', '8', '5', '1');
INSERT INTO `seat` VALUES ('12175', '1', '8', '6', '1');
INSERT INTO `seat` VALUES ('12176', '1', '8', '7', '1');
INSERT INTO `seat` VALUES ('12177', '1', '8', '8', '1');
INSERT INTO `seat` VALUES ('12178', '1', '8', '9', '1');
INSERT INTO `seat` VALUES ('12179', '1', '8', '10', '1');
INSERT INTO `seat` VALUES ('12180', '1', '9', '1', '1');
INSERT INTO `seat` VALUES ('12181', '1', '9', '2', '1');
INSERT INTO `seat` VALUES ('12182', '1', '9', '3', '1');
INSERT INTO `seat` VALUES ('12183', '1', '9', '4', '1');
INSERT INTO `seat` VALUES ('12184', '1', '9', '5', '1');
INSERT INTO `seat` VALUES ('12185', '1', '9', '6', '1');
INSERT INTO `seat` VALUES ('12186', '1', '9', '7', '1');
INSERT INTO `seat` VALUES ('12187', '1', '9', '8', '1');
INSERT INTO `seat` VALUES ('12188', '1', '9', '9', '1');
INSERT INTO `seat` VALUES ('12189', '1', '9', '10', '1');
INSERT INTO `seat` VALUES ('12190', '1', '10', '1', '1');
INSERT INTO `seat` VALUES ('12191', '1', '10', '2', '1');
INSERT INTO `seat` VALUES ('12192', '1', '10', '3', '1');
INSERT INTO `seat` VALUES ('12193', '1', '10', '4', '1');
INSERT INTO `seat` VALUES ('12194', '1', '10', '5', '1');
INSERT INTO `seat` VALUES ('12195', '1', '10', '6', '1');
INSERT INTO `seat` VALUES ('12196', '1', '10', '7', '1');
INSERT INTO `seat` VALUES ('12197', '1', '10', '8', '1');
INSERT INTO `seat` VALUES ('12198', '1', '10', '9', '1');
INSERT INTO `seat` VALUES ('12199', '1', '10', '10', '1');
INSERT INTO `seat` VALUES ('12200', '2', '1', '1', '1');
INSERT INTO `seat` VALUES ('12201', '2', '1', '2', '1');
INSERT INTO `seat` VALUES ('12202', '2', '1', '3', '1');
INSERT INTO `seat` VALUES ('12203', '2', '1', '4', '0');
INSERT INTO `seat` VALUES ('12204', '2', '1', '5', '1');
INSERT INTO `seat` VALUES ('12205', '2', '1', '6', '1');
INSERT INTO `seat` VALUES ('12206', '2', '1', '7', '1');
INSERT INTO `seat` VALUES ('12207', '2', '1', '8', '1');
INSERT INTO `seat` VALUES ('12208', '2', '1', '9', '1');
INSERT INTO `seat` VALUES ('12209', '2', '2', '1', '1');
INSERT INTO `seat` VALUES ('12210', '2', '2', '2', '1');
INSERT INTO `seat` VALUES ('12211', '2', '2', '3', '1');
INSERT INTO `seat` VALUES ('12212', '2', '2', '4', '1');
INSERT INTO `seat` VALUES ('12213', '2', '2', '5', '1');
INSERT INTO `seat` VALUES ('12214', '2', '2', '6', '1');
INSERT INTO `seat` VALUES ('12215', '2', '2', '7', '1');
INSERT INTO `seat` VALUES ('12216', '2', '2', '8', '1');
INSERT INTO `seat` VALUES ('12217', '2', '2', '9', '1');
INSERT INTO `seat` VALUES ('12218', '2', '3', '1', '1');
INSERT INTO `seat` VALUES ('12219', '2', '3', '2', '1');
INSERT INTO `seat` VALUES ('12220', '2', '3', '3', '1');
INSERT INTO `seat` VALUES ('12221', '2', '3', '4', '1');
INSERT INTO `seat` VALUES ('12222', '2', '3', '5', '1');
INSERT INTO `seat` VALUES ('12223', '2', '3', '6', '1');
INSERT INTO `seat` VALUES ('12224', '2', '3', '7', '1');
INSERT INTO `seat` VALUES ('12225', '2', '3', '8', '1');
INSERT INTO `seat` VALUES ('12226', '2', '3', '9', '1');
INSERT INTO `seat` VALUES ('12227', '2', '4', '1', '1');
INSERT INTO `seat` VALUES ('12228', '2', '4', '2', '1');
INSERT INTO `seat` VALUES ('12229', '2', '4', '3', '1');
INSERT INTO `seat` VALUES ('12230', '2', '4', '4', '1');
INSERT INTO `seat` VALUES ('12231', '2', '4', '5', '1');
INSERT INTO `seat` VALUES ('12232', '2', '4', '6', '1');
INSERT INTO `seat` VALUES ('12233', '2', '4', '7', '1');
INSERT INTO `seat` VALUES ('12234', '2', '4', '8', '1');
INSERT INTO `seat` VALUES ('12235', '2', '4', '9', '1');
INSERT INTO `seat` VALUES ('12236', '2', '5', '1', '1');
INSERT INTO `seat` VALUES ('12237', '2', '5', '2', '1');
INSERT INTO `seat` VALUES ('12238', '2', '5', '3', '1');
INSERT INTO `seat` VALUES ('12239', '2', '5', '4', '1');
INSERT INTO `seat` VALUES ('12240', '2', '5', '5', '1');
INSERT INTO `seat` VALUES ('12241', '2', '5', '6', '1');
INSERT INTO `seat` VALUES ('12242', '2', '5', '7', '1');
INSERT INTO `seat` VALUES ('12243', '2', '5', '8', '1');
INSERT INTO `seat` VALUES ('12244', '2', '5', '9', '1');
INSERT INTO `seat` VALUES ('12245', '2', '6', '1', '1');
INSERT INTO `seat` VALUES ('12246', '2', '6', '2', '1');
INSERT INTO `seat` VALUES ('12247', '2', '6', '3', '1');
INSERT INTO `seat` VALUES ('12248', '2', '6', '4', '1');
INSERT INTO `seat` VALUES ('12249', '2', '6', '5', '1');
INSERT INTO `seat` VALUES ('12250', '2', '6', '6', '1');
INSERT INTO `seat` VALUES ('12251', '2', '6', '7', '1');
INSERT INTO `seat` VALUES ('12252', '2', '6', '8', '1');
INSERT INTO `seat` VALUES ('12253', '2', '6', '9', '1');
INSERT INTO `seat` VALUES ('12254', '2', '7', '1', '1');
INSERT INTO `seat` VALUES ('12255', '2', '7', '2', '1');
INSERT INTO `seat` VALUES ('12256', '2', '7', '3', '1');
INSERT INTO `seat` VALUES ('12257', '2', '7', '4', '1');
INSERT INTO `seat` VALUES ('12258', '2', '7', '5', '1');
INSERT INTO `seat` VALUES ('12259', '2', '7', '6', '1');
INSERT INTO `seat` VALUES ('12260', '2', '7', '7', '1');
INSERT INTO `seat` VALUES ('12261', '2', '7', '8', '1');
INSERT INTO `seat` VALUES ('12262', '2', '7', '9', '1');
INSERT INTO `seat` VALUES ('12263', '2', '8', '1', '1');
INSERT INTO `seat` VALUES ('12264', '2', '8', '2', '1');
INSERT INTO `seat` VALUES ('12265', '2', '8', '3', '1');
INSERT INTO `seat` VALUES ('12266', '2', '8', '4', '1');
INSERT INTO `seat` VALUES ('12267', '2', '8', '5', '1');
INSERT INTO `seat` VALUES ('12268', '2', '8', '6', '1');
INSERT INTO `seat` VALUES ('12269', '2', '8', '7', '1');
INSERT INTO `seat` VALUES ('12270', '2', '8', '8', '1');
INSERT INTO `seat` VALUES ('12271', '2', '8', '9', '1');
INSERT INTO `seat` VALUES ('12272', '2', '9', '1', '1');
INSERT INTO `seat` VALUES ('12273', '2', '9', '2', '1');
INSERT INTO `seat` VALUES ('12274', '2', '9', '3', '1');
INSERT INTO `seat` VALUES ('12275', '2', '9', '4', '1');
INSERT INTO `seat` VALUES ('12276', '2', '9', '5', '1');
INSERT INTO `seat` VALUES ('12277', '2', '9', '6', '1');
INSERT INTO `seat` VALUES ('12278', '2', '9', '7', '1');
INSERT INTO `seat` VALUES ('12279', '2', '9', '8', '1');
INSERT INTO `seat` VALUES ('12280', '2', '9', '9', '1');
INSERT INTO `seat` VALUES ('12281', '4', '1', '1', '0');
INSERT INTO `seat` VALUES ('12282', '4', '1', '2', '1');
INSERT INTO `seat` VALUES ('12283', '4', '1', '3', '1');
INSERT INTO `seat` VALUES ('12284', '4', '1', '4', '1');
INSERT INTO `seat` VALUES ('12285', '4', '1', '5', '1');
INSERT INTO `seat` VALUES ('12286', '4', '1', '6', '1');
INSERT INTO `seat` VALUES ('12287', '4', '1', '7', '1');
INSERT INTO `seat` VALUES ('12288', '4', '1', '8', '1');
INSERT INTO `seat` VALUES ('12289', '4', '2', '1', '1');
INSERT INTO `seat` VALUES ('12290', '4', '2', '2', '1');
INSERT INTO `seat` VALUES ('12291', '4', '2', '3', '1');
INSERT INTO `seat` VALUES ('12292', '4', '2', '4', '1');
INSERT INTO `seat` VALUES ('12293', '4', '2', '5', '1');
INSERT INTO `seat` VALUES ('12294', '4', '2', '6', '1');
INSERT INTO `seat` VALUES ('12295', '4', '2', '7', '1');
INSERT INTO `seat` VALUES ('12296', '4', '2', '8', '1');
INSERT INTO `seat` VALUES ('12297', '4', '3', '1', '1');
INSERT INTO `seat` VALUES ('12298', '4', '3', '2', '1');
INSERT INTO `seat` VALUES ('12299', '4', '3', '3', '1');
INSERT INTO `seat` VALUES ('12300', '4', '3', '4', '1');
INSERT INTO `seat` VALUES ('12301', '4', '3', '5', '1');
INSERT INTO `seat` VALUES ('12302', '4', '3', '6', '1');
INSERT INTO `seat` VALUES ('12303', '4', '3', '7', '1');
INSERT INTO `seat` VALUES ('12304', '4', '3', '8', '1');
INSERT INTO `seat` VALUES ('12305', '4', '4', '1', '1');
INSERT INTO `seat` VALUES ('12306', '4', '4', '2', '1');
INSERT INTO `seat` VALUES ('12307', '4', '4', '3', '1');
INSERT INTO `seat` VALUES ('12308', '4', '4', '4', '1');
INSERT INTO `seat` VALUES ('12309', '4', '4', '5', '1');
INSERT INTO `seat` VALUES ('12310', '4', '4', '6', '1');
INSERT INTO `seat` VALUES ('12311', '4', '4', '7', '1');
INSERT INTO `seat` VALUES ('12312', '4', '4', '8', '1');
INSERT INTO `seat` VALUES ('12313', '4', '5', '1', '1');
INSERT INTO `seat` VALUES ('12314', '4', '5', '2', '1');
INSERT INTO `seat` VALUES ('12315', '4', '5', '3', '1');
INSERT INTO `seat` VALUES ('12316', '4', '5', '4', '1');
INSERT INTO `seat` VALUES ('12317', '4', '5', '5', '1');
INSERT INTO `seat` VALUES ('12318', '4', '5', '6', '1');
INSERT INTO `seat` VALUES ('12319', '4', '5', '7', '1');
INSERT INTO `seat` VALUES ('12320', '4', '5', '8', '1');
INSERT INTO `seat` VALUES ('12321', '4', '6', '1', '1');
INSERT INTO `seat` VALUES ('12322', '4', '6', '2', '1');
INSERT INTO `seat` VALUES ('12323', '4', '6', '3', '1');
INSERT INTO `seat` VALUES ('12324', '4', '6', '4', '1');
INSERT INTO `seat` VALUES ('12325', '4', '6', '5', '1');
INSERT INTO `seat` VALUES ('12326', '4', '6', '6', '1');
INSERT INTO `seat` VALUES ('12327', '4', '6', '7', '1');
INSERT INTO `seat` VALUES ('12328', '4', '6', '8', '1');
INSERT INTO `seat` VALUES ('12329', '4', '7', '1', '1');
INSERT INTO `seat` VALUES ('12330', '4', '7', '2', '1');
INSERT INTO `seat` VALUES ('12331', '4', '7', '3', '1');
INSERT INTO `seat` VALUES ('12332', '4', '7', '4', '1');
INSERT INTO `seat` VALUES ('12333', '4', '7', '5', '1');
INSERT INTO `seat` VALUES ('12334', '4', '7', '6', '1');
INSERT INTO `seat` VALUES ('12335', '4', '7', '7', '1');
INSERT INTO `seat` VALUES ('12336', '4', '7', '8', '1');
INSERT INTO `seat` VALUES ('12337', '4', '8', '1', '1');
INSERT INTO `seat` VALUES ('12338', '4', '8', '2', '1');
INSERT INTO `seat` VALUES ('12339', '4', '8', '3', '1');
INSERT INTO `seat` VALUES ('12340', '4', '8', '4', '1');
INSERT INTO `seat` VALUES ('12341', '4', '8', '5', '1');
INSERT INTO `seat` VALUES ('12342', '4', '8', '6', '1');
INSERT INTO `seat` VALUES ('12343', '4', '8', '7', '1');
INSERT INTO `seat` VALUES ('12344', '4', '8', '8', '1');
INSERT INTO `seat` VALUES ('12434', '7', '1', '1', '1');
INSERT INTO `seat` VALUES ('12435', '7', '1', '2', '1');
INSERT INTO `seat` VALUES ('12436', '7', '1', '3', '1');
INSERT INTO `seat` VALUES ('12437', '7', '1', '4', '1');
INSERT INTO `seat` VALUES ('12438', '7', '1', '5', '1');
INSERT INTO `seat` VALUES ('12439', '7', '1', '6', '1');
INSERT INTO `seat` VALUES ('12440', '7', '1', '7', '1');
INSERT INTO `seat` VALUES ('12441', '7', '1', '8', '1');
INSERT INTO `seat` VALUES ('12442', '7', '2', '1', '1');
INSERT INTO `seat` VALUES ('12443', '7', '2', '2', '1');
INSERT INTO `seat` VALUES ('12444', '7', '2', '3', '1');
INSERT INTO `seat` VALUES ('12445', '7', '2', '4', '1');
INSERT INTO `seat` VALUES ('12446', '7', '2', '5', '1');
INSERT INTO `seat` VALUES ('12447', '7', '2', '6', '1');
INSERT INTO `seat` VALUES ('12448', '7', '2', '7', '1');
INSERT INTO `seat` VALUES ('12449', '7', '2', '8', '1');
INSERT INTO `seat` VALUES ('12450', '7', '3', '1', '1');
INSERT INTO `seat` VALUES ('12451', '7', '3', '2', '1');
INSERT INTO `seat` VALUES ('12452', '7', '3', '3', '1');
INSERT INTO `seat` VALUES ('12453', '7', '3', '4', '1');
INSERT INTO `seat` VALUES ('12454', '7', '3', '5', '1');
INSERT INTO `seat` VALUES ('12455', '7', '3', '6', '1');
INSERT INTO `seat` VALUES ('12456', '7', '3', '7', '1');
INSERT INTO `seat` VALUES ('12457', '7', '3', '8', '1');
INSERT INTO `seat` VALUES ('12458', '7', '4', '1', '1');
INSERT INTO `seat` VALUES ('12459', '7', '4', '2', '1');
INSERT INTO `seat` VALUES ('12460', '7', '4', '3', '1');
INSERT INTO `seat` VALUES ('12461', '7', '4', '4', '1');
INSERT INTO `seat` VALUES ('12462', '7', '4', '5', '1');
INSERT INTO `seat` VALUES ('12463', '7', '4', '6', '1');
INSERT INTO `seat` VALUES ('12464', '7', '4', '7', '1');
INSERT INTO `seat` VALUES ('12465', '7', '4', '8', '1');
INSERT INTO `seat` VALUES ('12466', '7', '5', '1', '1');
INSERT INTO `seat` VALUES ('12467', '7', '5', '2', '1');
INSERT INTO `seat` VALUES ('12468', '7', '5', '3', '1');
INSERT INTO `seat` VALUES ('12469', '7', '5', '4', '1');
INSERT INTO `seat` VALUES ('12470', '7', '5', '5', '1');
INSERT INTO `seat` VALUES ('12471', '7', '5', '6', '1');
INSERT INTO `seat` VALUES ('12472', '7', '5', '7', '1');
INSERT INTO `seat` VALUES ('12473', '7', '5', '8', '1');
INSERT INTO `seat` VALUES ('12474', '7', '6', '1', '1');
INSERT INTO `seat` VALUES ('12475', '7', '6', '2', '1');
INSERT INTO `seat` VALUES ('12476', '7', '6', '3', '1');
INSERT INTO `seat` VALUES ('12477', '7', '6', '4', '1');
INSERT INTO `seat` VALUES ('12478', '7', '6', '5', '1');
INSERT INTO `seat` VALUES ('12479', '7', '6', '6', '1');
INSERT INTO `seat` VALUES ('12480', '7', '6', '7', '1');
INSERT INTO `seat` VALUES ('12481', '7', '6', '8', '1');
INSERT INTO `seat` VALUES ('12482', '7', '7', '1', '1');
INSERT INTO `seat` VALUES ('12483', '7', '7', '2', '1');
INSERT INTO `seat` VALUES ('12484', '7', '7', '3', '1');
INSERT INTO `seat` VALUES ('12485', '7', '7', '4', '1');
INSERT INTO `seat` VALUES ('12486', '7', '7', '5', '1');
INSERT INTO `seat` VALUES ('12487', '7', '7', '6', '1');
INSERT INTO `seat` VALUES ('12488', '7', '7', '7', '1');
INSERT INTO `seat` VALUES ('12489', '7', '7', '8', '1');
INSERT INTO `seat` VALUES ('12490', '7', '8', '1', '0');
INSERT INTO `seat` VALUES ('12491', '7', '8', '2', '0');
INSERT INTO `seat` VALUES ('12492', '7', '8', '3', '0');
INSERT INTO `seat` VALUES ('12493', '7', '8', '4', '0');
INSERT INTO `seat` VALUES ('12494', '7', '8', '5', '0');
INSERT INTO `seat` VALUES ('12495', '7', '8', '6', '0');
INSERT INTO `seat` VALUES ('12496', '7', '8', '7', '1');
INSERT INTO `seat` VALUES ('12497', '7', '8', '8', '1');
INSERT INTO `seat` VALUES ('12498', '7', '9', '1', '1');
INSERT INTO `seat` VALUES ('12499', '7', '9', '2', '1');
INSERT INTO `seat` VALUES ('12500', '7', '9', '3', '1');
INSERT INTO `seat` VALUES ('12501', '7', '9', '4', '-1');
INSERT INTO `seat` VALUES ('12502', '7', '9', '5', '-1');
INSERT INTO `seat` VALUES ('12503', '7', '9', '6', '-1');
INSERT INTO `seat` VALUES ('12504', '7', '9', '7', '-1');
INSERT INTO `seat` VALUES ('12505', '7', '9', '8', '-1');
INSERT INTO `seat` VALUES ('12552', '11', '1', '1', '1');
INSERT INTO `seat` VALUES ('12553', '11', '1', '2', '1');
INSERT INTO `seat` VALUES ('12554', '11', '1', '3', '1');
INSERT INTO `seat` VALUES ('12555', '11', '1', '4', '1');
INSERT INTO `seat` VALUES ('12556', '11', '1', '5', '1');
INSERT INTO `seat` VALUES ('12557', '11', '2', '1', '1');
INSERT INTO `seat` VALUES ('12558', '11', '2', '2', '1');
INSERT INTO `seat` VALUES ('12559', '11', '2', '3', '1');
INSERT INTO `seat` VALUES ('12560', '11', '2', '4', '1');
INSERT INTO `seat` VALUES ('12561', '11', '2', '5', '1');
INSERT INTO `seat` VALUES ('12562', '11', '3', '1', '1');
INSERT INTO `seat` VALUES ('12563', '11', '3', '2', '1');
INSERT INTO `seat` VALUES ('12564', '11', '3', '3', '1');
INSERT INTO `seat` VALUES ('12565', '11', '3', '4', '1');
INSERT INTO `seat` VALUES ('12566', '11', '3', '5', '1');
INSERT INTO `seat` VALUES ('12567', '11', '4', '1', '1');
INSERT INTO `seat` VALUES ('12568', '11', '4', '2', '1');
INSERT INTO `seat` VALUES ('12569', '11', '4', '3', '1');
INSERT INTO `seat` VALUES ('12570', '11', '4', '4', '1');
INSERT INTO `seat` VALUES ('12571', '11', '4', '5', '1');
INSERT INTO `seat` VALUES ('12572', '13', '1', '1', '-1');
INSERT INTO `seat` VALUES ('12573', '13', '1', '2', '1');
INSERT INTO `seat` VALUES ('12574', '13', '2', '1', '1');
INSERT INTO `seat` VALUES ('12575', '13', '2', '2', '0');
INSERT INTO `seat` VALUES ('12576', '17', '1', '1', '1');
INSERT INTO `seat` VALUES ('12577', '17', '1', '2', '1');
INSERT INTO `seat` VALUES ('12578', '17', '1', '3', '1');
INSERT INTO `seat` VALUES ('12579', '17', '1', '4', '1');
INSERT INTO `seat` VALUES ('12580', '17', '1', '5', '1');
INSERT INTO `seat` VALUES ('12581', '17', '2', '1', '1');
INSERT INTO `seat` VALUES ('12582', '17', '2', '2', '1');
INSERT INTO `seat` VALUES ('12583', '17', '2', '3', '1');
INSERT INTO `seat` VALUES ('12584', '17', '2', '4', '1');
INSERT INTO `seat` VALUES ('12585', '17', '2', '5', '1');
INSERT INTO `seat` VALUES ('12586', '17', '3', '1', '1');
INSERT INTO `seat` VALUES ('12587', '17', '3', '2', '1');
INSERT INTO `seat` VALUES ('12588', '17', '3', '3', '-1');
INSERT INTO `seat` VALUES ('12589', '17', '3', '4', '1');
INSERT INTO `seat` VALUES ('12590', '17', '3', '5', '1');
INSERT INTO `seat` VALUES ('12591', '17', '4', '1', '1');
INSERT INTO `seat` VALUES ('12592', '17', '4', '2', '1');
INSERT INTO `seat` VALUES ('12593', '17', '4', '3', '1');
INSERT INTO `seat` VALUES ('12594', '17', '4', '4', '1');
INSERT INTO `seat` VALUES ('12595', '17', '4', '5', '1');
INSERT INTO `seat` VALUES ('12596', '17', '5', '1', '1');
INSERT INTO `seat` VALUES ('12597', '17', '5', '2', '1');
INSERT INTO `seat` VALUES ('12598', '17', '5', '3', '1');
INSERT INTO `seat` VALUES ('12599', '17', '5', '4', '1');
INSERT INTO `seat` VALUES ('12600', '17', '5', '5', '1');
INSERT INTO `seat` VALUES ('12601', '18', '1', '1', '-1');
INSERT INTO `seat` VALUES ('12602', '18', '1', '2', '1');
INSERT INTO `seat` VALUES ('12603', '18', '1', '3', '1');
INSERT INTO `seat` VALUES ('12604', '18', '1', '4', '1');
INSERT INTO `seat` VALUES ('12605', '18', '1', '5', '1');
INSERT INTO `seat` VALUES ('12606', '18', '1', '6', '1');
INSERT INTO `seat` VALUES ('12607', '18', '2', '1', '1');
INSERT INTO `seat` VALUES ('12608', '18', '2', '2', '1');
INSERT INTO `seat` VALUES ('12609', '18', '2', '3', '1');
INSERT INTO `seat` VALUES ('12610', '18', '2', '4', '1');
INSERT INTO `seat` VALUES ('12611', '18', '2', '5', '1');
INSERT INTO `seat` VALUES ('12612', '18', '2', '6', '1');
INSERT INTO `seat` VALUES ('12613', '18', '3', '1', '1');
INSERT INTO `seat` VALUES ('12614', '18', '3', '2', '1');
INSERT INTO `seat` VALUES ('12615', '18', '3', '3', '1');
INSERT INTO `seat` VALUES ('12616', '18', '3', '4', '1');
INSERT INTO `seat` VALUES ('12617', '18', '3', '5', '1');
INSERT INTO `seat` VALUES ('12618', '18', '3', '6', '1');
INSERT INTO `seat` VALUES ('12619', '18', '4', '1', '1');
INSERT INTO `seat` VALUES ('12620', '18', '4', '2', '1');
INSERT INTO `seat` VALUES ('12621', '18', '4', '3', '1');
INSERT INTO `seat` VALUES ('12622', '18', '4', '4', '1');
INSERT INTO `seat` VALUES ('12623', '18', '4', '5', '1');
INSERT INTO `seat` VALUES ('12624', '18', '4', '6', '1');
INSERT INTO `seat` VALUES ('12625', '18', '5', '1', '1');
INSERT INTO `seat` VALUES ('12626', '18', '5', '2', '1');
INSERT INTO `seat` VALUES ('12627', '18', '5', '3', '1');
INSERT INTO `seat` VALUES ('12628', '18', '5', '4', '1');
INSERT INTO `seat` VALUES ('12629', '18', '5', '5', '1');
INSERT INTO `seat` VALUES ('12630', '18', '5', '6', '1');
INSERT INTO `seat` VALUES ('12631', '18', '6', '1', '1');
INSERT INTO `seat` VALUES ('12632', '18', '6', '2', '1');
INSERT INTO `seat` VALUES ('12633', '18', '6', '3', '1');
INSERT INTO `seat` VALUES ('12634', '18', '6', '4', '1');
INSERT INTO `seat` VALUES ('12635', '18', '6', '5', '1');
INSERT INTO `seat` VALUES ('12636', '18', '6', '6', '1');

-- ----------------------------
-- Table structure for `studio`
-- ----------------------------
DROP TABLE IF EXISTS `studio`;
CREATE TABLE `studio` (
  `studio_id` int(11) NOT NULL AUTO_INCREMENT,
  `studio_name` varchar(100) NOT NULL,
  `studio_row_count` int(11) DEFAULT NULL,
  `studio_col_count` int(11) DEFAULT NULL,
  `studio_introduction` varchar(2000) DEFAULT NULL,
  `studio_flag` smallint(6) DEFAULT NULL COMMENT '取值含义：\r\n                        0：尚未生成座位，可以根据行列信息生成座位\r\n                        1：已经根据影厅的座位信息安排了座位，不能再安排座位；\r\n                        -1：影厅损坏或者废弃，不能使用                     -2：删除不再显示到系统中',
  PRIMARY KEY (`studio_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of studio
-- ----------------------------
INSERT INTO `studio` VALUES ('1', '1号演播厅', '10', '10', '1号演播厅。。。。', '1');
INSERT INTO `studio` VALUES ('2', '2号演播厅', '9', '9', '2号演播厅。。。。', '1');
INSERT INTO `studio` VALUES ('4', '4号演播厅', '8', '8', '4号演播厅。。。。', '1');
INSERT INTO `studio` VALUES ('7', '3号演播厅', '9', '8', 'IMAX', '1');
INSERT INTO `studio` VALUES ('8', '5号演播厅', '9', '9', '3D环绕音', '-2');
INSERT INTO `studio` VALUES ('11', '123', '4', '5', '2222', '-2');
INSERT INTO `studio` VALUES ('13', '222', '2', '2', '222', '-2');
INSERT INTO `studio` VALUES ('14', 'test', '4', '4', '1234test', '-2');
INSERT INTO `studio` VALUES ('15', '2', '2', '2', '2', '-2');
INSERT INTO `studio` VALUES ('16', '2', '4', '4', '4', '-2');
INSERT INTO `studio` VALUES ('17', '5号演播厅', '5', '5', 'test', '1');
INSERT INTO `studio` VALUES ('18', '6号演播厅', '6', '6', '六号演播厅', '1');

-- ----------------------------
-- Table structure for `ticket`
-- ----------------------------
DROP TABLE IF EXISTS `ticket`;
CREATE TABLE `ticket` (
  `ticket_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `seat_id` int(11) DEFAULT NULL,
  `sched_id` int(11) DEFAULT NULL,
  `ticket_price` decimal(10,2) DEFAULT NULL,
  `ticket_status` smallint(6) DEFAULT NULL COMMENT '含义如下：\r\n            0：待销售\r\n            1：锁定\r\n            9：卖出\r\n           -1: 座位异常（损坏 或 无座 ）',
  `ticket_locked_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ticket_id`),
  KEY `FK_sched_ticket` (`sched_id`),
  KEY `FK_seat_ticket` (`seat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2054 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ticket
-- ----------------------------
INSERT INTO `ticket` VALUES ('1096', '12282', '1', '22.80', '1', '2018-04-12 16:05:56');
INSERT INTO `ticket` VALUES ('1097', '12283', '1', '22.80', '1', '2018-04-12 16:06:05');
INSERT INTO `ticket` VALUES ('1098', '12284', '1', '22.80', '1', '2018-04-12 16:06:10');
INSERT INTO `ticket` VALUES ('1099', '12285', '1', '22.80', '0', null);
INSERT INTO `ticket` VALUES ('1100', '12286', '1', '22.80', '0', null);
INSERT INTO `ticket` VALUES ('1101', '12287', '1', '22.80', '0', null);
INSERT INTO `ticket` VALUES ('1102', '12288', '1', '22.80', '0', null);
INSERT INTO `ticket` VALUES ('1103', '12289', '1', '22.80', '0', null);
INSERT INTO `ticket` VALUES ('1104', '12290', '1', '22.80', '0', null);
INSERT INTO `ticket` VALUES ('1105', '12291', '1', '22.80', '0', null);
INSERT INTO `ticket` VALUES ('1106', '12292', '1', '22.80', '0', null);
INSERT INTO `ticket` VALUES ('1107', '12293', '1', '22.80', '1', '2018-04-12 16:06:13');
INSERT INTO `ticket` VALUES ('1108', '12294', '1', '22.80', '1', '2018-04-12 16:06:16');
INSERT INTO `ticket` VALUES ('1109', '12295', '1', '22.80', '1', '2018-04-12 16:06:17');
INSERT INTO `ticket` VALUES ('1110', '12296', '1', '22.80', '0', null);
INSERT INTO `ticket` VALUES ('1111', '12297', '1', '22.80', '0', null);
INSERT INTO `ticket` VALUES ('1112', '12298', '1', '22.80', '0', null);
INSERT INTO `ticket` VALUES ('1113', '12299', '1', '22.80', '0', null);
INSERT INTO `ticket` VALUES ('1114', '12300', '1', '22.80', '0', null);
INSERT INTO `ticket` VALUES ('1115', '12301', '1', '22.80', '1', '2018-04-12 16:06:20');
INSERT INTO `ticket` VALUES ('1116', '12302', '1', '22.80', '1', '2018-04-12 16:06:20');
INSERT INTO `ticket` VALUES ('1117', '12303', '1', '22.80', '0', null);
INSERT INTO `ticket` VALUES ('1118', '12304', '1', '22.80', '0', null);
INSERT INTO `ticket` VALUES ('1119', '12305', '1', '22.80', '0', null);
INSERT INTO `ticket` VALUES ('1120', '12306', '1', '22.80', '0', null);
INSERT INTO `ticket` VALUES ('1121', '12307', '1', '22.80', '1', '2018-04-12 17:25:14');
INSERT INTO `ticket` VALUES ('1122', '12308', '1', '22.80', '1', '2018-04-12 17:25:26');
INSERT INTO `ticket` VALUES ('1123', '12309', '1', '22.80', '0', null);
INSERT INTO `ticket` VALUES ('1124', '12310', '1', '22.80', '0', null);
INSERT INTO `ticket` VALUES ('1125', '12311', '1', '22.80', '0', null);
INSERT INTO `ticket` VALUES ('1126', '12312', '1', '22.80', '0', null);
INSERT INTO `ticket` VALUES ('1127', '12313', '1', '22.80', '0', null);
INSERT INTO `ticket` VALUES ('1128', '12314', '1', '22.80', '0', null);
INSERT INTO `ticket` VALUES ('1129', '12315', '1', '22.80', '1', '2018-04-12 17:25:14');
INSERT INTO `ticket` VALUES ('1130', '12316', '1', '22.80', '1', '2018-04-12 17:25:32');
INSERT INTO `ticket` VALUES ('1131', '12317', '1', '22.80', '1', '2018-04-12 17:25:32');
INSERT INTO `ticket` VALUES ('1132', '12318', '1', '22.80', '1', '2018-04-12 16:06:34');
INSERT INTO `ticket` VALUES ('1133', '12319', '1', '22.80', '1', '2018-04-12 16:06:34');
INSERT INTO `ticket` VALUES ('1134', '12320', '1', '22.80', '0', null);
INSERT INTO `ticket` VALUES ('1135', '12321', '1', '22.80', '0', null);
INSERT INTO `ticket` VALUES ('1136', '12322', '1', '22.80', '0', null);
INSERT INTO `ticket` VALUES ('1137', '12323', '1', '22.80', '0', null);
INSERT INTO `ticket` VALUES ('1138', '12324', '1', '22.80', '1', '2018-04-12 17:25:36');
INSERT INTO `ticket` VALUES ('1139', '12325', '1', '22.80', '0', null);
INSERT INTO `ticket` VALUES ('1140', '12326', '1', '22.80', '0', null);
INSERT INTO `ticket` VALUES ('1141', '12327', '1', '22.80', '0', null);
INSERT INTO `ticket` VALUES ('1142', '12328', '1', '22.80', '0', null);
INSERT INTO `ticket` VALUES ('1143', '12329', '1', '22.80', '0', null);
INSERT INTO `ticket` VALUES ('1144', '12330', '1', '22.80', '0', null);
INSERT INTO `ticket` VALUES ('1145', '12331', '1', '22.80', '0', null);
INSERT INTO `ticket` VALUES ('1146', '12332', '1', '22.80', '0', null);
INSERT INTO `ticket` VALUES ('1147', '12333', '1', '22.80', '0', null);
INSERT INTO `ticket` VALUES ('1148', '12334', '1', '22.80', '0', null);
INSERT INTO `ticket` VALUES ('1149', '12335', '1', '22.80', '0', null);
INSERT INTO `ticket` VALUES ('1150', '12336', '1', '22.80', '0', null);
INSERT INTO `ticket` VALUES ('1151', '12337', '1', '22.80', '0', null);
INSERT INTO `ticket` VALUES ('1152', '12338', '1', '22.80', '0', null);
INSERT INTO `ticket` VALUES ('1153', '12339', '1', '22.80', '9', null);
INSERT INTO `ticket` VALUES ('1154', '12340', '1', '22.80', '9', null);
INSERT INTO `ticket` VALUES ('1155', '12341', '1', '22.80', '9', null);
INSERT INTO `ticket` VALUES ('1156', '12342', '1', '22.80', '9', null);
INSERT INTO `ticket` VALUES ('1157', '12343', '1', '22.80', '0', null);
INSERT INTO `ticket` VALUES ('1158', '12344', '1', '22.80', '0', null);
INSERT INTO `ticket` VALUES ('1159', '12100', '2', '23.40', '9', '2018-06-10 08:04:44');
INSERT INTO `ticket` VALUES ('1160', '12101', '2', '23.40', '9', '2018-06-10 03:50:07');
INSERT INTO `ticket` VALUES ('1161', '12102', '2', '23.40', '9', '2018-06-10 03:50:08');
INSERT INTO `ticket` VALUES ('1162', '12103', '2', '23.40', '9', null);
INSERT INTO `ticket` VALUES ('1163', '12106', '2', '23.40', '0', null);
INSERT INTO `ticket` VALUES ('1164', '12107', '2', '23.40', '9', '2018-06-13 10:21:30');
INSERT INTO `ticket` VALUES ('1165', '12108', '2', '23.40', '9', '2018-06-13 10:21:31');
INSERT INTO `ticket` VALUES ('1166', '12109', '2', '23.40', '9', '2018-06-13 10:21:31');
INSERT INTO `ticket` VALUES ('1167', '12110', '2', '23.40', '9', '2018-06-10 08:04:55');
INSERT INTO `ticket` VALUES ('1168', '12111', '2', '23.40', '9', '2018-06-14 09:38:52');
INSERT INTO `ticket` VALUES ('1169', '12112', '2', '23.40', '9', '2018-06-14 09:38:54');
INSERT INTO `ticket` VALUES ('1170', '12113', '2', '23.40', '9', null);
INSERT INTO `ticket` VALUES ('1171', '12114', '2', '23.40', '9', '2018-06-14 09:38:59');
INSERT INTO `ticket` VALUES ('1172', '12116', '2', '23.40', '0', null);
INSERT INTO `ticket` VALUES ('1173', '12117', '2', '23.40', '9', '2018-06-13 10:21:33');
INSERT INTO `ticket` VALUES ('1174', '12118', '2', '23.40', '9', '2018-06-13 10:21:32');
INSERT INTO `ticket` VALUES ('1175', '12119', '2', '23.40', '9', '2018-06-13 10:21:32');
INSERT INTO `ticket` VALUES ('1176', '12120', '2', '23.40', '0', null);
INSERT INTO `ticket` VALUES ('1177', '12121', '2', '23.40', '9', null);
INSERT INTO `ticket` VALUES ('1178', '12122', '2', '23.40', '0', null);
INSERT INTO `ticket` VALUES ('1179', '12123', '2', '23.40', '0', null);
INSERT INTO `ticket` VALUES ('1180', '12124', '2', '23.40', '0', null);
INSERT INTO `ticket` VALUES ('1181', '12125', '2', '23.40', '0', null);
INSERT INTO `ticket` VALUES ('1182', '12126', '2', '23.40', '0', null);
INSERT INTO `ticket` VALUES ('1183', '12127', '2', '23.40', '0', null);
INSERT INTO `ticket` VALUES ('1184', '12128', '2', '23.40', '0', null);
INSERT INTO `ticket` VALUES ('1185', '12129', '2', '23.40', '0', null);
INSERT INTO `ticket` VALUES ('1186', '12130', '2', '23.40', '0', null);
INSERT INTO `ticket` VALUES ('1187', '12131', '2', '23.40', '0', null);
INSERT INTO `ticket` VALUES ('1188', '12133', '2', '23.40', '9', null);
INSERT INTO `ticket` VALUES ('1189', '12134', '2', '23.40', '9', null);
INSERT INTO `ticket` VALUES ('1190', '12135', '2', '23.40', '0', null);
INSERT INTO `ticket` VALUES ('1191', '12136', '2', '23.40', '0', null);
INSERT INTO `ticket` VALUES ('1192', '12137', '2', '23.40', '0', null);
INSERT INTO `ticket` VALUES ('1193', '12138', '2', '23.40', '0', null);
INSERT INTO `ticket` VALUES ('1194', '12139', '2', '23.40', '0', null);
INSERT INTO `ticket` VALUES ('1195', '12140', '2', '23.40', '0', null);
INSERT INTO `ticket` VALUES ('1196', '12141', '2', '23.40', '0', null);
INSERT INTO `ticket` VALUES ('1197', '12142', '2', '23.40', '0', null);
INSERT INTO `ticket` VALUES ('1198', '12143', '2', '23.40', '0', null);
INSERT INTO `ticket` VALUES ('1199', '12144', '2', '23.40', '1', '2018-04-12 17:25:55');
INSERT INTO `ticket` VALUES ('1200', '12145', '2', '23.40', '0', null);
INSERT INTO `ticket` VALUES ('1201', '12146', '2', '23.40', '1', '2018-04-12 16:07:57');
INSERT INTO `ticket` VALUES ('1202', '12147', '2', '23.40', '0', null);
INSERT INTO `ticket` VALUES ('1203', '12148', '2', '23.40', '0', null);
INSERT INTO `ticket` VALUES ('1204', '12149', '2', '23.40', '0', null);
INSERT INTO `ticket` VALUES ('1205', '12150', '2', '23.40', '0', null);
INSERT INTO `ticket` VALUES ('1206', '12151', '2', '23.40', '0', null);
INSERT INTO `ticket` VALUES ('1207', '12152', '2', '23.40', '0', null);
INSERT INTO `ticket` VALUES ('1208', '12153', '2', '23.40', '0', null);
INSERT INTO `ticket` VALUES ('1209', '12154', '2', '23.40', '9', '2018-06-13 09:10:26');
INSERT INTO `ticket` VALUES ('1210', '12155', '2', '23.40', '0', null);
INSERT INTO `ticket` VALUES ('1211', '12156', '2', '23.40', '0', null);
INSERT INTO `ticket` VALUES ('1212', '12157', '2', '23.40', '9', null);
INSERT INTO `ticket` VALUES ('1213', '12158', '2', '23.40', '0', null);
INSERT INTO `ticket` VALUES ('1214', '12159', '2', '23.40', '0', null);
INSERT INTO `ticket` VALUES ('1215', '12160', '2', '23.40', '0', null);
INSERT INTO `ticket` VALUES ('1216', '12161', '2', '23.40', '0', null);
INSERT INTO `ticket` VALUES ('1217', '12162', '2', '23.40', '9', '2018-06-13 09:13:07');
INSERT INTO `ticket` VALUES ('1218', '12163', '2', '23.40', '9', '2018-06-13 08:59:22');
INSERT INTO `ticket` VALUES ('1219', '12164', '2', '23.40', '0', null);
INSERT INTO `ticket` VALUES ('1220', '12165', '2', '23.40', '0', null);
INSERT INTO `ticket` VALUES ('1221', '12166', '2', '23.40', '0', null);
INSERT INTO `ticket` VALUES ('1222', '12167', '2', '23.40', '9', null);
INSERT INTO `ticket` VALUES ('1223', '12168', '2', '23.40', '0', null);
INSERT INTO `ticket` VALUES ('1224', '12169', '2', '23.40', '0', null);
INSERT INTO `ticket` VALUES ('1225', '12170', '2', '23.40', '9', '2018-06-11 04:07:11');
INSERT INTO `ticket` VALUES ('1226', '12171', '2', '23.40', '0', null);
INSERT INTO `ticket` VALUES ('1227', '12172', '2', '23.40', '9', '2018-06-13 09:13:08');
INSERT INTO `ticket` VALUES ('1228', '12173', '2', '23.40', '9', '2018-06-13 09:13:09');
INSERT INTO `ticket` VALUES ('1229', '12174', '2', '23.40', '0', null);
INSERT INTO `ticket` VALUES ('1230', '12175', '2', '23.40', '0', null);
INSERT INTO `ticket` VALUES ('1231', '12176', '2', '23.40', '0', null);
INSERT INTO `ticket` VALUES ('1232', '12177', '2', '23.40', '0', null);
INSERT INTO `ticket` VALUES ('1233', '12178', '2', '23.40', '0', null);
INSERT INTO `ticket` VALUES ('1234', '12179', '2', '23.40', '0', null);
INSERT INTO `ticket` VALUES ('1235', '12180', '2', '23.40', '9', '2018-06-11 04:07:11');
INSERT INTO `ticket` VALUES ('1236', '12181', '2', '23.40', '9', '2018-06-11 04:07:17');
INSERT INTO `ticket` VALUES ('1237', '12182', '2', '23.40', '0', null);
INSERT INTO `ticket` VALUES ('1238', '12183', '2', '23.40', '0', null);
INSERT INTO `ticket` VALUES ('1239', '12184', '2', '23.40', '0', null);
INSERT INTO `ticket` VALUES ('1240', '12185', '2', '23.40', '0', null);
INSERT INTO `ticket` VALUES ('1241', '12186', '2', '23.40', '0', null);
INSERT INTO `ticket` VALUES ('1242', '12187', '2', '23.40', '0', null);
INSERT INTO `ticket` VALUES ('1243', '12188', '2', '23.40', '0', null);
INSERT INTO `ticket` VALUES ('1244', '12189', '2', '23.40', '0', null);
INSERT INTO `ticket` VALUES ('1245', '12190', '2', '23.40', '9', '2018-06-11 04:07:12');
INSERT INTO `ticket` VALUES ('1246', '12191', '2', '23.40', '9', '2018-06-11 04:07:12');
INSERT INTO `ticket` VALUES ('1247', '12192', '2', '23.40', '9', '2018-06-11 04:07:16');
INSERT INTO `ticket` VALUES ('1248', '12193', '2', '23.40', '0', null);
INSERT INTO `ticket` VALUES ('1249', '12194', '2', '23.40', '0', null);
INSERT INTO `ticket` VALUES ('1250', '12195', '2', '23.40', '0', null);
INSERT INTO `ticket` VALUES ('1251', '12196', '2', '23.40', '0', null);
INSERT INTO `ticket` VALUES ('1252', '12197', '2', '23.40', '0', null);
INSERT INTO `ticket` VALUES ('1253', '12198', '2', '23.40', '0', null);
INSERT INTO `ticket` VALUES ('1254', '12199', '2', '23.40', '0', null);
INSERT INTO `ticket` VALUES ('1255', '12100', '3', '32.10', '0', null);
INSERT INTO `ticket` VALUES ('1256', '12101', '3', '32.10', '0', null);
INSERT INTO `ticket` VALUES ('1257', '12102', '3', '32.10', '0', null);
INSERT INTO `ticket` VALUES ('1258', '12103', '3', '32.10', '0', null);
INSERT INTO `ticket` VALUES ('1259', '12106', '3', '32.10', '0', null);
INSERT INTO `ticket` VALUES ('1260', '12107', '3', '32.10', '0', null);
INSERT INTO `ticket` VALUES ('1261', '12108', '3', '32.10', '0', null);
INSERT INTO `ticket` VALUES ('1262', '12109', '3', '32.10', '0', null);
INSERT INTO `ticket` VALUES ('1263', '12110', '3', '32.10', '0', null);
INSERT INTO `ticket` VALUES ('1264', '12111', '3', '32.10', '0', null);
INSERT INTO `ticket` VALUES ('1265', '12112', '3', '32.10', '0', null);
INSERT INTO `ticket` VALUES ('1266', '12113', '3', '32.10', '0', null);
INSERT INTO `ticket` VALUES ('1267', '12114', '3', '32.10', '0', null);
INSERT INTO `ticket` VALUES ('1268', '12116', '3', '32.10', '0', null);
INSERT INTO `ticket` VALUES ('1269', '12117', '3', '32.10', '0', null);
INSERT INTO `ticket` VALUES ('1270', '12118', '3', '32.10', '0', null);
INSERT INTO `ticket` VALUES ('1271', '12119', '3', '32.10', '0', null);
INSERT INTO `ticket` VALUES ('1272', '12120', '3', '32.10', '0', null);
INSERT INTO `ticket` VALUES ('1273', '12121', '3', '32.10', '0', null);
INSERT INTO `ticket` VALUES ('1274', '12122', '3', '32.10', '0', null);
INSERT INTO `ticket` VALUES ('1275', '12123', '3', '32.10', '0', null);
INSERT INTO `ticket` VALUES ('1276', '12124', '3', '32.10', '0', null);
INSERT INTO `ticket` VALUES ('1277', '12125', '3', '32.10', '0', null);
INSERT INTO `ticket` VALUES ('1278', '12126', '3', '32.10', '0', null);
INSERT INTO `ticket` VALUES ('1279', '12127', '3', '32.10', '0', null);
INSERT INTO `ticket` VALUES ('1280', '12128', '3', '32.10', '0', null);
INSERT INTO `ticket` VALUES ('1281', '12129', '3', '32.10', '0', null);
INSERT INTO `ticket` VALUES ('1282', '12130', '3', '32.10', '0', null);
INSERT INTO `ticket` VALUES ('1283', '12131', '3', '32.10', '0', null);
INSERT INTO `ticket` VALUES ('1284', '12133', '3', '32.10', '0', null);
INSERT INTO `ticket` VALUES ('1285', '12134', '3', '32.10', '0', null);
INSERT INTO `ticket` VALUES ('1286', '12135', '3', '32.10', '0', null);
INSERT INTO `ticket` VALUES ('1287', '12136', '3', '32.10', '0', null);
INSERT INTO `ticket` VALUES ('1288', '12137', '3', '32.10', '0', null);
INSERT INTO `ticket` VALUES ('1289', '12138', '3', '32.10', '0', null);
INSERT INTO `ticket` VALUES ('1290', '12139', '3', '32.10', '0', null);
INSERT INTO `ticket` VALUES ('1291', '12140', '3', '32.10', '0', null);
INSERT INTO `ticket` VALUES ('1292', '12141', '3', '32.10', '0', null);
INSERT INTO `ticket` VALUES ('1293', '12142', '3', '32.10', '0', null);
INSERT INTO `ticket` VALUES ('1294', '12143', '3', '32.10', '0', null);
INSERT INTO `ticket` VALUES ('1295', '12144', '3', '32.10', '0', null);
INSERT INTO `ticket` VALUES ('1296', '12145', '3', '32.10', '0', null);
INSERT INTO `ticket` VALUES ('1297', '12146', '3', '32.10', '0', null);
INSERT INTO `ticket` VALUES ('1298', '12147', '3', '32.10', '0', null);
INSERT INTO `ticket` VALUES ('1299', '12148', '3', '32.10', '0', null);
INSERT INTO `ticket` VALUES ('1300', '12149', '3', '32.10', '0', null);
INSERT INTO `ticket` VALUES ('1301', '12150', '3', '32.10', '0', null);
INSERT INTO `ticket` VALUES ('1302', '12151', '3', '32.10', '0', null);
INSERT INTO `ticket` VALUES ('1303', '12152', '3', '32.10', '0', null);
INSERT INTO `ticket` VALUES ('1304', '12153', '3', '32.10', '0', null);
INSERT INTO `ticket` VALUES ('1305', '12154', '3', '32.10', '0', null);
INSERT INTO `ticket` VALUES ('1306', '12155', '3', '32.10', '0', null);
INSERT INTO `ticket` VALUES ('1307', '12156', '3', '32.10', '0', null);
INSERT INTO `ticket` VALUES ('1308', '12157', '3', '32.10', '0', null);
INSERT INTO `ticket` VALUES ('1309', '12158', '3', '32.10', '0', null);
INSERT INTO `ticket` VALUES ('1310', '12159', '3', '32.10', '0', null);
INSERT INTO `ticket` VALUES ('1311', '12160', '3', '32.10', '0', null);
INSERT INTO `ticket` VALUES ('1312', '12161', '3', '32.10', '0', null);
INSERT INTO `ticket` VALUES ('1313', '12162', '3', '32.10', '0', null);
INSERT INTO `ticket` VALUES ('1314', '12163', '3', '32.10', '0', null);
INSERT INTO `ticket` VALUES ('1315', '12164', '3', '32.10', '0', null);
INSERT INTO `ticket` VALUES ('1316', '12165', '3', '32.10', '0', null);
INSERT INTO `ticket` VALUES ('1317', '12166', '3', '32.10', '0', null);
INSERT INTO `ticket` VALUES ('1318', '12167', '3', '32.10', '0', null);
INSERT INTO `ticket` VALUES ('1319', '12168', '3', '32.10', '0', null);
INSERT INTO `ticket` VALUES ('1320', '12169', '3', '32.10', '0', null);
INSERT INTO `ticket` VALUES ('1321', '12170', '3', '32.10', '0', null);
INSERT INTO `ticket` VALUES ('1322', '12171', '3', '32.10', '0', null);
INSERT INTO `ticket` VALUES ('1323', '12172', '3', '32.10', '0', null);
INSERT INTO `ticket` VALUES ('1324', '12173', '3', '32.10', '0', null);
INSERT INTO `ticket` VALUES ('1325', '12174', '3', '32.10', '0', null);
INSERT INTO `ticket` VALUES ('1326', '12175', '3', '32.10', '0', null);
INSERT INTO `ticket` VALUES ('1327', '12176', '3', '32.10', '0', null);
INSERT INTO `ticket` VALUES ('1328', '12177', '3', '32.10', '0', null);
INSERT INTO `ticket` VALUES ('1329', '12178', '3', '32.10', '0', null);
INSERT INTO `ticket` VALUES ('1330', '12179', '3', '32.10', '0', null);
INSERT INTO `ticket` VALUES ('1331', '12180', '3', '32.10', '0', null);
INSERT INTO `ticket` VALUES ('1332', '12181', '3', '32.10', '0', null);
INSERT INTO `ticket` VALUES ('1333', '12182', '3', '32.10', '0', null);
INSERT INTO `ticket` VALUES ('1334', '12183', '3', '32.10', '0', null);
INSERT INTO `ticket` VALUES ('1335', '12184', '3', '32.10', '0', null);
INSERT INTO `ticket` VALUES ('1336', '12185', '3', '32.10', '0', null);
INSERT INTO `ticket` VALUES ('1337', '12186', '3', '32.10', '0', null);
INSERT INTO `ticket` VALUES ('1338', '12187', '3', '32.10', '0', null);
INSERT INTO `ticket` VALUES ('1339', '12188', '3', '32.10', '0', null);
INSERT INTO `ticket` VALUES ('1340', '12189', '3', '32.10', '0', null);
INSERT INTO `ticket` VALUES ('1341', '12190', '3', '32.10', '0', null);
INSERT INTO `ticket` VALUES ('1342', '12191', '3', '32.10', '0', null);
INSERT INTO `ticket` VALUES ('1343', '12192', '3', '32.10', '0', null);
INSERT INTO `ticket` VALUES ('1344', '12193', '3', '32.10', '0', null);
INSERT INTO `ticket` VALUES ('1345', '12194', '3', '32.10', '0', null);
INSERT INTO `ticket` VALUES ('1346', '12195', '3', '32.10', '0', null);
INSERT INTO `ticket` VALUES ('1347', '12196', '3', '32.10', '0', null);
INSERT INTO `ticket` VALUES ('1348', '12197', '3', '32.10', '0', null);
INSERT INTO `ticket` VALUES ('1349', '12198', '3', '32.10', '0', null);
INSERT INTO `ticket` VALUES ('1350', '12199', '3', '32.10', '0', null);
INSERT INTO `ticket` VALUES ('1353', '12281', '8', '32.00', '-1', null);
INSERT INTO `ticket` VALUES ('1354', '12282', '8', '32.00', '9', null);
INSERT INTO `ticket` VALUES ('1355', '12283', '8', '32.00', '9', null);
INSERT INTO `ticket` VALUES ('1356', '12284', '8', '32.00', '9', null);
INSERT INTO `ticket` VALUES ('1357', '12285', '8', '32.00', '9', null);
INSERT INTO `ticket` VALUES ('1358', '12286', '8', '32.00', '9', null);
INSERT INTO `ticket` VALUES ('1359', '12287', '8', '32.00', '0', null);
INSERT INTO `ticket` VALUES ('1360', '12288', '8', '32.00', '0', null);
INSERT INTO `ticket` VALUES ('1361', '12289', '8', '32.00', '0', null);
INSERT INTO `ticket` VALUES ('1362', '12290', '8', '32.00', '0', null);
INSERT INTO `ticket` VALUES ('1363', '12291', '8', '32.00', '0', null);
INSERT INTO `ticket` VALUES ('1364', '12292', '8', '32.00', '0', null);
INSERT INTO `ticket` VALUES ('1365', '12293', '8', '32.00', '0', null);
INSERT INTO `ticket` VALUES ('1366', '12294', '8', '32.00', '0', null);
INSERT INTO `ticket` VALUES ('1367', '12295', '8', '32.00', '0', null);
INSERT INTO `ticket` VALUES ('1368', '12296', '8', '32.00', '0', null);
INSERT INTO `ticket` VALUES ('1369', '12297', '8', '32.00', '0', null);
INSERT INTO `ticket` VALUES ('1370', '12298', '8', '32.00', '0', null);
INSERT INTO `ticket` VALUES ('1371', '12299', '8', '32.00', '0', null);
INSERT INTO `ticket` VALUES ('1372', '12300', '8', '32.00', '0', null);
INSERT INTO `ticket` VALUES ('1373', '12301', '8', '32.00', '0', null);
INSERT INTO `ticket` VALUES ('1374', '12302', '8', '32.00', '0', null);
INSERT INTO `ticket` VALUES ('1375', '12303', '8', '32.00', '0', null);
INSERT INTO `ticket` VALUES ('1376', '12304', '8', '32.00', '0', null);
INSERT INTO `ticket` VALUES ('1377', '12305', '8', '32.00', '0', null);
INSERT INTO `ticket` VALUES ('1378', '12306', '8', '32.00', '0', null);
INSERT INTO `ticket` VALUES ('1379', '12307', '8', '32.00', '0', null);
INSERT INTO `ticket` VALUES ('1380', '12308', '8', '32.00', '9', null);
INSERT INTO `ticket` VALUES ('1381', '12309', '8', '32.00', '9', null);
INSERT INTO `ticket` VALUES ('1382', '12310', '8', '32.00', '0', null);
INSERT INTO `ticket` VALUES ('1383', '12311', '8', '32.00', '0', null);
INSERT INTO `ticket` VALUES ('1384', '12312', '8', '32.00', '0', null);
INSERT INTO `ticket` VALUES ('1385', '12313', '8', '32.00', '0', null);
INSERT INTO `ticket` VALUES ('1386', '12314', '8', '32.00', '0', null);
INSERT INTO `ticket` VALUES ('1387', '12315', '8', '32.00', '0', null);
INSERT INTO `ticket` VALUES ('1388', '12316', '8', '32.00', '9', null);
INSERT INTO `ticket` VALUES ('1389', '12317', '8', '32.00', '9', null);
INSERT INTO `ticket` VALUES ('1390', '12318', '8', '32.00', '0', null);
INSERT INTO `ticket` VALUES ('1391', '12319', '8', '32.00', '0', null);
INSERT INTO `ticket` VALUES ('1392', '12320', '8', '32.00', '0', null);
INSERT INTO `ticket` VALUES ('1393', '12321', '8', '32.00', '0', null);
INSERT INTO `ticket` VALUES ('1394', '12322', '8', '32.00', '0', null);
INSERT INTO `ticket` VALUES ('1395', '12323', '8', '32.00', '0', null);
INSERT INTO `ticket` VALUES ('1396', '12324', '8', '32.00', '0', null);
INSERT INTO `ticket` VALUES ('1397', '12325', '8', '32.00', '0', null);
INSERT INTO `ticket` VALUES ('1398', '12326', '8', '32.00', '0', null);
INSERT INTO `ticket` VALUES ('1399', '12327', '8', '32.00', '0', null);
INSERT INTO `ticket` VALUES ('1400', '12328', '8', '32.00', '0', null);
INSERT INTO `ticket` VALUES ('1401', '12329', '8', '32.00', '0', null);
INSERT INTO `ticket` VALUES ('1402', '12330', '8', '32.00', '0', null);
INSERT INTO `ticket` VALUES ('1403', '12331', '8', '32.00', '0', null);
INSERT INTO `ticket` VALUES ('1404', '12332', '8', '32.00', '0', null);
INSERT INTO `ticket` VALUES ('1405', '12333', '8', '32.00', '0', null);
INSERT INTO `ticket` VALUES ('1406', '12334', '8', '32.00', '0', null);
INSERT INTO `ticket` VALUES ('1407', '12335', '8', '32.00', '0', null);
INSERT INTO `ticket` VALUES ('1408', '12336', '8', '32.00', '0', null);
INSERT INTO `ticket` VALUES ('1409', '12337', '8', '32.00', '0', null);
INSERT INTO `ticket` VALUES ('1410', '12338', '8', '32.00', '0', null);
INSERT INTO `ticket` VALUES ('1411', '12339', '8', '32.00', '0', null);
INSERT INTO `ticket` VALUES ('1412', '12340', '8', '32.00', '9', null);
INSERT INTO `ticket` VALUES ('1413', '12341', '8', '32.00', '9', null);
INSERT INTO `ticket` VALUES ('1414', '12342', '8', '32.00', '0', null);
INSERT INTO `ticket` VALUES ('1415', '12343', '8', '32.00', '0', null);
INSERT INTO `ticket` VALUES ('1416', '12344', '8', '32.00', '0', null);
INSERT INTO `ticket` VALUES ('1417', '12507', '9', '123.00', '-1', null);
INSERT INTO `ticket` VALUES ('1418', '12508', '9', '123.00', '0', null);
INSERT INTO `ticket` VALUES ('1419', '12509', '9', '123.00', '0', null);
INSERT INTO `ticket` VALUES ('1420', '12510', '9', '123.00', '0', null);
INSERT INTO `ticket` VALUES ('1421', '12511', '9', '123.00', '-1', null);
INSERT INTO `ticket` VALUES ('1422', '12512', '9', '123.00', '0', null);
INSERT INTO `ticket` VALUES ('1423', '12513', '9', '123.00', '-1', null);
INSERT INTO `ticket` VALUES ('1424', '12514', '9', '123.00', '0', null);
INSERT INTO `ticket` VALUES ('1425', '12515', '9', '123.00', '-1', null);
INSERT INTO `ticket` VALUES ('1426', '12516', '9', '123.00', '0', null);
INSERT INTO `ticket` VALUES ('1427', '12517', '9', '123.00', '0', null);
INSERT INTO `ticket` VALUES ('1428', '12518', '9', '123.00', '9', null);
INSERT INTO `ticket` VALUES ('1429', '12519', '9', '123.00', '-1', null);
INSERT INTO `ticket` VALUES ('1430', '12520', '9', '123.00', '9', null);
INSERT INTO `ticket` VALUES ('1431', '12521', '9', '123.00', '0', null);
INSERT INTO `ticket` VALUES ('1432', '12522', '9', '123.00', '0', null);
INSERT INTO `ticket` VALUES ('1433', '12523', '9', '123.00', '9', null);
INSERT INTO `ticket` VALUES ('1434', '12524', '9', '123.00', '-1', null);
INSERT INTO `ticket` VALUES ('1435', '12525', '9', '123.00', '9', null);
INSERT INTO `ticket` VALUES ('1436', '12526', '9', '123.00', '0', null);
INSERT INTO `ticket` VALUES ('1437', '12527', '10', '22.00', '-1', null);
INSERT INTO `ticket` VALUES ('1438', '12528', '10', '22.00', '9', null);
INSERT INTO `ticket` VALUES ('1439', '12529', '10', '22.00', '9', null);
INSERT INTO `ticket` VALUES ('1440', '12530', '10', '22.00', '0', null);
INSERT INTO `ticket` VALUES ('1441', '12531', '10', '22.00', '0', null);
INSERT INTO `ticket` VALUES ('1442', '12532', '10', '22.00', '0', null);
INSERT INTO `ticket` VALUES ('1443', '12533', '10', '22.00', '-1', null);
INSERT INTO `ticket` VALUES ('1444', '12534', '10', '22.00', '0', null);
INSERT INTO `ticket` VALUES ('1445', '12535', '10', '22.00', '0', null);
INSERT INTO `ticket` VALUES ('1446', '12536', '10', '22.00', '0', null);
INSERT INTO `ticket` VALUES ('1447', '12537', '10', '22.00', '0', null);
INSERT INTO `ticket` VALUES ('1448', '12538', '10', '22.00', '0', null);
INSERT INTO `ticket` VALUES ('1449', '12539', '10', '22.00', '-1', null);
INSERT INTO `ticket` VALUES ('1450', '12540', '10', '22.00', '0', null);
INSERT INTO `ticket` VALUES ('1451', '12541', '10', '22.00', '0', null);
INSERT INTO `ticket` VALUES ('1452', '12542', '10', '22.00', '0', null);
INSERT INTO `ticket` VALUES ('1453', '12543', '10', '22.00', '0', null);
INSERT INTO `ticket` VALUES ('1454', '12544', '10', '22.00', '0', null);
INSERT INTO `ticket` VALUES ('1455', '12545', '10', '22.00', '-1', null);
INSERT INTO `ticket` VALUES ('1456', '12546', '10', '22.00', '0', null);
INSERT INTO `ticket` VALUES ('1457', '12547', '10', '22.00', '0', null);
INSERT INTO `ticket` VALUES ('1458', '12548', '10', '22.00', '0', null);
INSERT INTO `ticket` VALUES ('1459', '12549', '10', '22.00', '0', null);
INSERT INTO `ticket` VALUES ('1460', '12550', '10', '22.00', '0', null);
INSERT INTO `ticket` VALUES ('1461', '12551', '10', '22.00', '-1', null);
INSERT INTO `ticket` VALUES ('1462', '12572', '11', '123.00', '-1', null);
INSERT INTO `ticket` VALUES ('1463', '12573', '11', '123.00', '0', null);
INSERT INTO `ticket` VALUES ('1464', '12574', '11', '123.00', '9', null);
INSERT INTO `ticket` VALUES ('1465', '12575', '11', '123.00', '-1', null);
INSERT INTO `ticket` VALUES ('1466', '12572', '12', '23.00', '0', '2018-06-10 03:45:56');
INSERT INTO `ticket` VALUES ('1467', '12573', '12', '23.00', '0', '2018-06-10 03:46:01');
INSERT INTO `ticket` VALUES ('1468', '12574', '12', '23.00', '0', null);
INSERT INTO `ticket` VALUES ('1469', '12575', '12', '23.00', '0', null);
INSERT INTO `ticket` VALUES ('1470', '12100', '13', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1471', '12101', '13', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1472', '12102', '13', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1473', '12103', '13', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1474', '12104', '13', '12.00', '-1', null);
INSERT INTO `ticket` VALUES ('1475', '12105', '13', '12.00', '-1', null);
INSERT INTO `ticket` VALUES ('1476', '12106', '13', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1477', '12107', '13', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1478', '12108', '13', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1479', '12109', '13', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1480', '12110', '13', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1481', '12111', '13', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1482', '12112', '13', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1483', '12113', '13', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1484', '12114', '13', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1485', '12115', '13', '12.00', '-1', null);
INSERT INTO `ticket` VALUES ('1486', '12116', '13', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1487', '12117', '13', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1488', '12118', '13', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1489', '12119', '13', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1490', '12120', '13', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1491', '12121', '13', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1492', '12122', '13', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1493', '12123', '13', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1494', '12124', '13', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1495', '12125', '13', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1496', '12126', '13', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1497', '12127', '13', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1498', '12128', '13', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1499', '12129', '13', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1500', '12130', '13', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1501', '12131', '13', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1502', '12132', '13', '12.00', '-1', null);
INSERT INTO `ticket` VALUES ('1503', '12133', '13', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1504', '12134', '13', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1505', '12135', '13', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1506', '12136', '13', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1507', '12137', '13', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1508', '12138', '13', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1509', '12139', '13', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1510', '12140', '13', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1511', '12141', '13', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1512', '12142', '13', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1513', '12143', '13', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1514', '12144', '13', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1515', '12145', '13', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1516', '12146', '13', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1517', '12147', '13', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1518', '12148', '13', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1519', '12149', '13', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1520', '12150', '13', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1521', '12151', '13', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1522', '12152', '13', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1523', '12153', '13', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1524', '12154', '13', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1525', '12155', '13', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1526', '12156', '13', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1527', '12157', '13', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1528', '12158', '13', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1529', '12159', '13', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1530', '12160', '13', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1531', '12161', '13', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1532', '12162', '13', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1533', '12163', '13', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1534', '12164', '13', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1535', '12165', '13', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1536', '12166', '13', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1537', '12167', '13', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1538', '12168', '13', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1539', '12169', '13', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1540', '12170', '13', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1541', '12171', '13', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1542', '12172', '13', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1543', '12173', '13', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1544', '12174', '13', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1545', '12175', '13', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1546', '12176', '13', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1547', '12177', '13', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1548', '12178', '13', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1549', '12179', '13', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1550', '12180', '13', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1551', '12181', '13', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1552', '12182', '13', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1553', '12183', '13', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1554', '12184', '13', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1555', '12185', '13', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1556', '12186', '13', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1557', '12187', '13', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1558', '12188', '13', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1559', '12189', '13', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1560', '12190', '13', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1561', '12191', '13', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1562', '12192', '13', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1563', '12193', '13', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1564', '12194', '13', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1565', '12195', '13', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1566', '12196', '13', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1567', '12197', '13', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1568', '12198', '13', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1569', '12199', '13', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1570', '12601', '17', '2.00', '-1', null);
INSERT INTO `ticket` VALUES ('1571', '12602', '17', '2.00', '0', '2018-06-12 06:56:58');
INSERT INTO `ticket` VALUES ('1572', '12603', '17', '2.00', '0', null);
INSERT INTO `ticket` VALUES ('1573', '12604', '17', '2.00', '0', null);
INSERT INTO `ticket` VALUES ('1574', '12100', '16', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1575', '12101', '16', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1576', '12102', '16', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1577', '12103', '16', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1578', '12104', '16', '12.00', '-1', null);
INSERT INTO `ticket` VALUES ('1579', '12105', '16', '12.00', '-1', null);
INSERT INTO `ticket` VALUES ('1580', '12106', '16', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1581', '12107', '16', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1582', '12108', '16', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1583', '12109', '16', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1584', '12110', '16', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1585', '12111', '16', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1586', '12112', '16', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1587', '12113', '16', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1588', '12114', '16', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1589', '12115', '16', '12.00', '-1', null);
INSERT INTO `ticket` VALUES ('1590', '12116', '16', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1591', '12117', '16', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1592', '12118', '16', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1593', '12119', '16', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1594', '12120', '16', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1595', '12121', '16', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1596', '12122', '16', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1597', '12123', '16', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1598', '12124', '16', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1599', '12125', '16', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1600', '12126', '16', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1601', '12127', '16', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1602', '12128', '16', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1603', '12129', '16', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1604', '12130', '16', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1605', '12131', '16', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1606', '12132', '16', '12.00', '-1', null);
INSERT INTO `ticket` VALUES ('1607', '12133', '16', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1608', '12134', '16', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1609', '12135', '16', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1610', '12136', '16', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1611', '12137', '16', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1612', '12138', '16', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1613', '12139', '16', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1614', '12140', '16', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1615', '12141', '16', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1616', '12142', '16', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1617', '12143', '16', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1618', '12144', '16', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1619', '12145', '16', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1620', '12146', '16', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1621', '12147', '16', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1622', '12148', '16', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1623', '12149', '16', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1624', '12150', '16', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1625', '12151', '16', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1626', '12152', '16', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1627', '12153', '16', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1628', '12154', '16', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1629', '12155', '16', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1630', '12156', '16', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1631', '12157', '16', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1632', '12158', '16', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1633', '12159', '16', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1634', '12160', '16', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1635', '12161', '16', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1636', '12162', '16', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1637', '12163', '16', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1638', '12164', '16', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1639', '12165', '16', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1640', '12166', '16', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1641', '12167', '16', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1642', '12168', '16', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1643', '12169', '16', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1644', '12170', '16', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1645', '12171', '16', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1646', '12172', '16', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1647', '12173', '16', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1648', '12174', '16', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1649', '12175', '16', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1650', '12176', '16', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1651', '12177', '16', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1652', '12178', '16', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1653', '12179', '16', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1654', '12180', '16', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1655', '12181', '16', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1656', '12182', '16', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1657', '12183', '16', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1658', '12184', '16', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1659', '12185', '16', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1660', '12186', '16', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1661', '12187', '16', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1662', '12188', '16', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1663', '12189', '16', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1664', '12190', '16', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1665', '12191', '16', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1666', '12192', '16', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1667', '12193', '16', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1668', '12194', '16', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1669', '12195', '16', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1670', '12196', '16', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1671', '12197', '16', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1672', '12198', '16', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1673', '12199', '16', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1674', '12605', '18', '2.00', '-1', null);
INSERT INTO `ticket` VALUES ('1675', '12606', '18', '2.00', '9', '2018-06-12 08:48:33');
INSERT INTO `ticket` VALUES ('1676', '12607', '18', '2.00', '0', null);
INSERT INTO `ticket` VALUES ('1677', '12608', '18', '2.00', '0', null);
INSERT INTO `ticket` VALUES ('1678', '12609', '18', '2.00', '0', null);
INSERT INTO `ticket` VALUES ('1679', '12610', '18', '2.00', '0', null);
INSERT INTO `ticket` VALUES ('1680', '12611', '18', '2.00', '0', '2018-06-12 08:48:35');
INSERT INTO `ticket` VALUES ('1681', '12612', '18', '2.00', '0', null);
INSERT INTO `ticket` VALUES ('1682', '12613', '18', '2.00', '0', null);
INSERT INTO `ticket` VALUES ('1683', '12614', '18', '2.00', '0', null);
INSERT INTO `ticket` VALUES ('1684', '12615', '18', '2.00', '0', null);
INSERT INTO `ticket` VALUES ('1685', '12616', '18', '2.00', '0', null);
INSERT INTO `ticket` VALUES ('1686', '12617', '18', '2.00', '0', null);
INSERT INTO `ticket` VALUES ('1687', '12618', '18', '2.00', '0', null);
INSERT INTO `ticket` VALUES ('1688', '12619', '18', '2.00', '0', null);
INSERT INTO `ticket` VALUES ('1689', '12620', '18', '2.00', '0', null);
INSERT INTO `ticket` VALUES ('1690', '12281', '17', '23.00', '-1', null);
INSERT INTO `ticket` VALUES ('1691', '12282', '17', '23.00', '9', '2018-06-14 09:01:33');
INSERT INTO `ticket` VALUES ('1692', '12283', '17', '23.00', '9', '2018-06-14 09:01:34');
INSERT INTO `ticket` VALUES ('1693', '12284', '17', '23.00', '9', '2018-06-14 09:01:36');
INSERT INTO `ticket` VALUES ('1694', '12285', '17', '23.00', '0', null);
INSERT INTO `ticket` VALUES ('1695', '12286', '17', '23.00', '0', null);
INSERT INTO `ticket` VALUES ('1696', '12287', '17', '23.00', '0', null);
INSERT INTO `ticket` VALUES ('1697', '12288', '17', '23.00', '0', null);
INSERT INTO `ticket` VALUES ('1698', '12289', '17', '23.00', '0', null);
INSERT INTO `ticket` VALUES ('1699', '12290', '17', '23.00', '0', null);
INSERT INTO `ticket` VALUES ('1700', '12291', '17', '23.00', '0', null);
INSERT INTO `ticket` VALUES ('1701', '12292', '17', '23.00', '0', null);
INSERT INTO `ticket` VALUES ('1702', '12293', '17', '23.00', '0', null);
INSERT INTO `ticket` VALUES ('1703', '12294', '17', '23.00', '0', null);
INSERT INTO `ticket` VALUES ('1704', '12295', '17', '23.00', '0', null);
INSERT INTO `ticket` VALUES ('1705', '12296', '17', '23.00', '0', null);
INSERT INTO `ticket` VALUES ('1706', '12297', '17', '23.00', '0', null);
INSERT INTO `ticket` VALUES ('1707', '12298', '17', '23.00', '0', null);
INSERT INTO `ticket` VALUES ('1708', '12299', '17', '23.00', '0', null);
INSERT INTO `ticket` VALUES ('1709', '12300', '17', '23.00', '0', null);
INSERT INTO `ticket` VALUES ('1710', '12301', '17', '23.00', '0', null);
INSERT INTO `ticket` VALUES ('1711', '12302', '17', '23.00', '0', null);
INSERT INTO `ticket` VALUES ('1712', '12303', '17', '23.00', '0', null);
INSERT INTO `ticket` VALUES ('1713', '12304', '17', '23.00', '0', null);
INSERT INTO `ticket` VALUES ('1714', '12305', '17', '23.00', '0', null);
INSERT INTO `ticket` VALUES ('1715', '12306', '17', '23.00', '0', null);
INSERT INTO `ticket` VALUES ('1716', '12307', '17', '23.00', '0', null);
INSERT INTO `ticket` VALUES ('1717', '12308', '17', '23.00', '0', '2018-06-14 09:01:57');
INSERT INTO `ticket` VALUES ('1718', '12309', '17', '23.00', '9', null);
INSERT INTO `ticket` VALUES ('1719', '12310', '17', '23.00', '0', null);
INSERT INTO `ticket` VALUES ('1720', '12311', '17', '23.00', '0', null);
INSERT INTO `ticket` VALUES ('1721', '12312', '17', '23.00', '0', null);
INSERT INTO `ticket` VALUES ('1722', '12313', '17', '23.00', '0', null);
INSERT INTO `ticket` VALUES ('1723', '12314', '17', '23.00', '0', null);
INSERT INTO `ticket` VALUES ('1724', '12315', '17', '23.00', '0', null);
INSERT INTO `ticket` VALUES ('1725', '12316', '17', '23.00', '9', null);
INSERT INTO `ticket` VALUES ('1726', '12317', '17', '23.00', '9', '2018-06-14 09:02:01');
INSERT INTO `ticket` VALUES ('1727', '12318', '17', '23.00', '0', null);
INSERT INTO `ticket` VALUES ('1728', '12319', '17', '23.00', '0', null);
INSERT INTO `ticket` VALUES ('1729', '12320', '17', '23.00', '0', null);
INSERT INTO `ticket` VALUES ('1730', '12321', '17', '23.00', '0', null);
INSERT INTO `ticket` VALUES ('1731', '12322', '17', '23.00', '0', null);
INSERT INTO `ticket` VALUES ('1732', '12323', '17', '23.00', '0', null);
INSERT INTO `ticket` VALUES ('1733', '12324', '17', '23.00', '0', null);
INSERT INTO `ticket` VALUES ('1734', '12325', '17', '23.00', '0', null);
INSERT INTO `ticket` VALUES ('1735', '12326', '17', '23.00', '0', null);
INSERT INTO `ticket` VALUES ('1736', '12327', '17', '23.00', '0', null);
INSERT INTO `ticket` VALUES ('1737', '12328', '17', '23.00', '0', null);
INSERT INTO `ticket` VALUES ('1738', '12329', '17', '23.00', '0', null);
INSERT INTO `ticket` VALUES ('1739', '12330', '17', '23.00', '0', null);
INSERT INTO `ticket` VALUES ('1740', '12331', '17', '23.00', '0', null);
INSERT INTO `ticket` VALUES ('1741', '12332', '17', '23.00', '0', null);
INSERT INTO `ticket` VALUES ('1742', '12333', '17', '23.00', '0', null);
INSERT INTO `ticket` VALUES ('1743', '12334', '17', '23.00', '0', null);
INSERT INTO `ticket` VALUES ('1744', '12335', '17', '23.00', '0', null);
INSERT INTO `ticket` VALUES ('1745', '12336', '17', '23.00', '0', null);
INSERT INTO `ticket` VALUES ('1746', '12337', '17', '23.00', '0', null);
INSERT INTO `ticket` VALUES ('1747', '12338', '17', '23.00', '0', null);
INSERT INTO `ticket` VALUES ('1748', '12339', '17', '23.00', '0', null);
INSERT INTO `ticket` VALUES ('1749', '12340', '17', '23.00', '0', null);
INSERT INTO `ticket` VALUES ('1750', '12341', '17', '23.00', '0', null);
INSERT INTO `ticket` VALUES ('1751', '12342', '17', '23.00', '0', null);
INSERT INTO `ticket` VALUES ('1752', '12343', '17', '23.00', '0', null);
INSERT INTO `ticket` VALUES ('1753', '12344', '17', '23.00', '0', null);
INSERT INTO `ticket` VALUES ('1754', '12281', '18', '12.00', '-1', null);
INSERT INTO `ticket` VALUES ('1755', '12282', '18', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1756', '12283', '18', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1757', '12284', '18', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1758', '12285', '18', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1759', '12286', '18', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1760', '12287', '18', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1761', '12288', '18', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1762', '12289', '18', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1763', '12290', '18', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1764', '12291', '18', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1765', '12292', '18', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1766', '12293', '18', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1767', '12294', '18', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1768', '12295', '18', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1769', '12296', '18', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1770', '12297', '18', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1771', '12298', '18', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1772', '12299', '18', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1773', '12300', '18', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1774', '12301', '18', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1775', '12302', '18', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1776', '12303', '18', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1777', '12304', '18', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1778', '12305', '18', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1779', '12306', '18', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1780', '12307', '18', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1781', '12308', '18', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1782', '12309', '18', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1783', '12310', '18', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1784', '12311', '18', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1785', '12312', '18', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1786', '12313', '18', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1787', '12314', '18', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1788', '12315', '18', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1789', '12316', '18', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1790', '12317', '18', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1791', '12318', '18', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1792', '12319', '18', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1793', '12320', '18', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1794', '12321', '18', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1795', '12322', '18', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1796', '12323', '18', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1797', '12324', '18', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1798', '12325', '18', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1799', '12326', '18', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1800', '12327', '18', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1801', '12328', '18', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1802', '12329', '18', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1803', '12330', '18', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1804', '12331', '18', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1805', '12332', '18', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1806', '12333', '18', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1807', '12334', '18', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1808', '12335', '18', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1809', '12336', '18', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1810', '12337', '18', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1811', '12338', '18', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1812', '12339', '18', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1813', '12340', '18', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1814', '12341', '18', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1815', '12342', '18', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1816', '12343', '18', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1817', '12344', '18', '12.00', '0', null);
INSERT INTO `ticket` VALUES ('1818', '12100', '20', '23.00', '0', null);
INSERT INTO `ticket` VALUES ('1819', '12101', '20', '23.00', '0', null);
INSERT INTO `ticket` VALUES ('1820', '12102', '20', '23.00', '0', null);
INSERT INTO `ticket` VALUES ('1821', '12103', '20', '23.00', '0', null);
INSERT INTO `ticket` VALUES ('1822', '12104', '20', '23.00', '-1', null);
INSERT INTO `ticket` VALUES ('1823', '12105', '20', '23.00', '-1', null);
INSERT INTO `ticket` VALUES ('1824', '12106', '20', '23.00', '0', null);
INSERT INTO `ticket` VALUES ('1825', '12107', '20', '23.00', '0', null);
INSERT INTO `ticket` VALUES ('1826', '12108', '20', '23.00', '0', null);
INSERT INTO `ticket` VALUES ('1827', '12109', '20', '23.00', '0', null);
INSERT INTO `ticket` VALUES ('1828', '12110', '20', '23.00', '0', null);
INSERT INTO `ticket` VALUES ('1829', '12111', '20', '23.00', '0', null);
INSERT INTO `ticket` VALUES ('1830', '12112', '20', '23.00', '0', null);
INSERT INTO `ticket` VALUES ('1831', '12113', '20', '23.00', '0', null);
INSERT INTO `ticket` VALUES ('1832', '12114', '20', '23.00', '0', null);
INSERT INTO `ticket` VALUES ('1833', '12115', '20', '23.00', '-1', null);
INSERT INTO `ticket` VALUES ('1834', '12116', '20', '23.00', '0', null);
INSERT INTO `ticket` VALUES ('1835', '12117', '20', '23.00', '0', null);
INSERT INTO `ticket` VALUES ('1836', '12118', '20', '23.00', '0', null);
INSERT INTO `ticket` VALUES ('1837', '12119', '20', '23.00', '0', null);
INSERT INTO `ticket` VALUES ('1838', '12120', '20', '23.00', '0', null);
INSERT INTO `ticket` VALUES ('1839', '12121', '20', '23.00', '0', null);
INSERT INTO `ticket` VALUES ('1840', '12122', '20', '23.00', '0', null);
INSERT INTO `ticket` VALUES ('1841', '12123', '20', '23.00', '0', null);
INSERT INTO `ticket` VALUES ('1842', '12124', '20', '23.00', '0', null);
INSERT INTO `ticket` VALUES ('1843', '12125', '20', '23.00', '0', null);
INSERT INTO `ticket` VALUES ('1844', '12126', '20', '23.00', '0', null);
INSERT INTO `ticket` VALUES ('1845', '12127', '20', '23.00', '0', null);
INSERT INTO `ticket` VALUES ('1846', '12128', '20', '23.00', '0', null);
INSERT INTO `ticket` VALUES ('1847', '12129', '20', '23.00', '0', null);
INSERT INTO `ticket` VALUES ('1848', '12130', '20', '23.00', '0', null);
INSERT INTO `ticket` VALUES ('1849', '12131', '20', '23.00', '0', null);
INSERT INTO `ticket` VALUES ('1850', '12132', '20', '23.00', '-1', null);
INSERT INTO `ticket` VALUES ('1851', '12133', '20', '23.00', '0', null);
INSERT INTO `ticket` VALUES ('1852', '12134', '20', '23.00', '0', null);
INSERT INTO `ticket` VALUES ('1853', '12135', '20', '23.00', '0', null);
INSERT INTO `ticket` VALUES ('1854', '12136', '20', '23.00', '0', null);
INSERT INTO `ticket` VALUES ('1855', '12137', '20', '23.00', '0', null);
INSERT INTO `ticket` VALUES ('1856', '12138', '20', '23.00', '0', null);
INSERT INTO `ticket` VALUES ('1857', '12139', '20', '23.00', '0', null);
INSERT INTO `ticket` VALUES ('1858', '12140', '20', '23.00', '0', null);
INSERT INTO `ticket` VALUES ('1859', '12141', '20', '23.00', '0', null);
INSERT INTO `ticket` VALUES ('1860', '12142', '20', '23.00', '0', null);
INSERT INTO `ticket` VALUES ('1861', '12143', '20', '23.00', '0', null);
INSERT INTO `ticket` VALUES ('1862', '12144', '20', '23.00', '0', null);
INSERT INTO `ticket` VALUES ('1863', '12145', '20', '23.00', '0', null);
INSERT INTO `ticket` VALUES ('1864', '12146', '20', '23.00', '0', null);
INSERT INTO `ticket` VALUES ('1865', '12147', '20', '23.00', '0', null);
INSERT INTO `ticket` VALUES ('1866', '12148', '20', '23.00', '0', null);
INSERT INTO `ticket` VALUES ('1867', '12149', '20', '23.00', '0', null);
INSERT INTO `ticket` VALUES ('1868', '12150', '20', '23.00', '0', null);
INSERT INTO `ticket` VALUES ('1869', '12151', '20', '23.00', '0', null);
INSERT INTO `ticket` VALUES ('1870', '12152', '20', '23.00', '0', null);
INSERT INTO `ticket` VALUES ('1871', '12153', '20', '23.00', '0', null);
INSERT INTO `ticket` VALUES ('1872', '12154', '20', '23.00', '0', null);
INSERT INTO `ticket` VALUES ('1873', '12155', '20', '23.00', '0', null);
INSERT INTO `ticket` VALUES ('1874', '12156', '20', '23.00', '0', null);
INSERT INTO `ticket` VALUES ('1875', '12157', '20', '23.00', '0', null);
INSERT INTO `ticket` VALUES ('1876', '12158', '20', '23.00', '0', null);
INSERT INTO `ticket` VALUES ('1877', '12159', '20', '23.00', '0', null);
INSERT INTO `ticket` VALUES ('1878', '12160', '20', '23.00', '0', null);
INSERT INTO `ticket` VALUES ('1879', '12161', '20', '23.00', '0', null);
INSERT INTO `ticket` VALUES ('1880', '12162', '20', '23.00', '0', null);
INSERT INTO `ticket` VALUES ('1881', '12163', '20', '23.00', '0', null);
INSERT INTO `ticket` VALUES ('1882', '12164', '20', '23.00', '0', null);
INSERT INTO `ticket` VALUES ('1883', '12165', '20', '23.00', '0', null);
INSERT INTO `ticket` VALUES ('1884', '12166', '20', '23.00', '0', null);
INSERT INTO `ticket` VALUES ('1885', '12167', '20', '23.00', '0', null);
INSERT INTO `ticket` VALUES ('1886', '12168', '20', '23.00', '0', null);
INSERT INTO `ticket` VALUES ('1887', '12169', '20', '23.00', '0', null);
INSERT INTO `ticket` VALUES ('1888', '12170', '20', '23.00', '0', null);
INSERT INTO `ticket` VALUES ('1889', '12171', '20', '23.00', '0', null);
INSERT INTO `ticket` VALUES ('1890', '12172', '20', '23.00', '0', null);
INSERT INTO `ticket` VALUES ('1891', '12173', '20', '23.00', '0', null);
INSERT INTO `ticket` VALUES ('1892', '12174', '20', '23.00', '0', null);
INSERT INTO `ticket` VALUES ('1893', '12175', '20', '23.00', '0', null);
INSERT INTO `ticket` VALUES ('1894', '12176', '20', '23.00', '0', null);
INSERT INTO `ticket` VALUES ('1895', '12177', '20', '23.00', '0', null);
INSERT INTO `ticket` VALUES ('1896', '12178', '20', '23.00', '0', null);
INSERT INTO `ticket` VALUES ('1897', '12179', '20', '23.00', '0', null);
INSERT INTO `ticket` VALUES ('1898', '12180', '20', '23.00', '0', null);
INSERT INTO `ticket` VALUES ('1899', '12181', '20', '23.00', '0', null);
INSERT INTO `ticket` VALUES ('1900', '12182', '20', '23.00', '0', null);
INSERT INTO `ticket` VALUES ('1901', '12183', '20', '23.00', '0', null);
INSERT INTO `ticket` VALUES ('1902', '12184', '20', '23.00', '0', null);
INSERT INTO `ticket` VALUES ('1903', '12185', '20', '23.00', '0', null);
INSERT INTO `ticket` VALUES ('1904', '12186', '20', '23.00', '0', null);
INSERT INTO `ticket` VALUES ('1905', '12187', '20', '23.00', '0', null);
INSERT INTO `ticket` VALUES ('1906', '12188', '20', '23.00', '0', null);
INSERT INTO `ticket` VALUES ('1907', '12189', '20', '23.00', '0', null);
INSERT INTO `ticket` VALUES ('1908', '12190', '20', '23.00', '0', null);
INSERT INTO `ticket` VALUES ('1909', '12191', '20', '23.00', '0', null);
INSERT INTO `ticket` VALUES ('1910', '12192', '20', '23.00', '0', null);
INSERT INTO `ticket` VALUES ('1911', '12193', '20', '23.00', '0', null);
INSERT INTO `ticket` VALUES ('1912', '12194', '20', '23.00', '0', null);
INSERT INTO `ticket` VALUES ('1913', '12195', '20', '23.00', '0', null);
INSERT INTO `ticket` VALUES ('1914', '12196', '20', '23.00', '0', null);
INSERT INTO `ticket` VALUES ('1915', '12197', '20', '23.00', '0', null);
INSERT INTO `ticket` VALUES ('1916', '12198', '20', '23.00', '0', null);
INSERT INTO `ticket` VALUES ('1917', '12199', '20', '23.00', '0', null);
INSERT INTO `ticket` VALUES ('1918', '12100', '21', '52.00', '0', null);
INSERT INTO `ticket` VALUES ('1919', '12101', '21', '52.00', '0', null);
INSERT INTO `ticket` VALUES ('1920', '12102', '21', '52.00', '0', null);
INSERT INTO `ticket` VALUES ('1921', '12103', '21', '52.00', '0', null);
INSERT INTO `ticket` VALUES ('1922', '12104', '21', '52.00', '-1', null);
INSERT INTO `ticket` VALUES ('1923', '12105', '21', '52.00', '-1', null);
INSERT INTO `ticket` VALUES ('1924', '12106', '21', '52.00', '0', null);
INSERT INTO `ticket` VALUES ('1925', '12107', '21', '52.00', '0', null);
INSERT INTO `ticket` VALUES ('1926', '12108', '21', '52.00', '0', null);
INSERT INTO `ticket` VALUES ('1927', '12109', '21', '52.00', '0', null);
INSERT INTO `ticket` VALUES ('1928', '12110', '21', '52.00', '0', null);
INSERT INTO `ticket` VALUES ('1929', '12111', '21', '52.00', '0', null);
INSERT INTO `ticket` VALUES ('1930', '12112', '21', '52.00', '0', null);
INSERT INTO `ticket` VALUES ('1931', '12113', '21', '52.00', '0', null);
INSERT INTO `ticket` VALUES ('1932', '12114', '21', '52.00', '0', null);
INSERT INTO `ticket` VALUES ('1933', '12115', '21', '52.00', '-1', null);
INSERT INTO `ticket` VALUES ('1934', '12116', '21', '52.00', '0', null);
INSERT INTO `ticket` VALUES ('1935', '12117', '21', '52.00', '0', null);
INSERT INTO `ticket` VALUES ('1936', '12118', '21', '52.00', '0', null);
INSERT INTO `ticket` VALUES ('1937', '12119', '21', '52.00', '0', null);
INSERT INTO `ticket` VALUES ('1938', '12120', '21', '52.00', '0', null);
INSERT INTO `ticket` VALUES ('1939', '12121', '21', '52.00', '0', null);
INSERT INTO `ticket` VALUES ('1940', '12122', '21', '52.00', '0', null);
INSERT INTO `ticket` VALUES ('1941', '12123', '21', '52.00', '0', null);
INSERT INTO `ticket` VALUES ('1942', '12124', '21', '52.00', '0', null);
INSERT INTO `ticket` VALUES ('1943', '12125', '21', '52.00', '0', null);
INSERT INTO `ticket` VALUES ('1944', '12126', '21', '52.00', '0', null);
INSERT INTO `ticket` VALUES ('1945', '12127', '21', '52.00', '0', null);
INSERT INTO `ticket` VALUES ('1946', '12128', '21', '52.00', '0', null);
INSERT INTO `ticket` VALUES ('1947', '12129', '21', '52.00', '0', null);
INSERT INTO `ticket` VALUES ('1948', '12130', '21', '52.00', '0', null);
INSERT INTO `ticket` VALUES ('1949', '12131', '21', '52.00', '0', null);
INSERT INTO `ticket` VALUES ('1950', '12132', '21', '52.00', '-1', null);
INSERT INTO `ticket` VALUES ('1951', '12133', '21', '52.00', '0', null);
INSERT INTO `ticket` VALUES ('1952', '12134', '21', '52.00', '0', null);
INSERT INTO `ticket` VALUES ('1953', '12135', '21', '52.00', '0', null);
INSERT INTO `ticket` VALUES ('1954', '12136', '21', '52.00', '0', null);
INSERT INTO `ticket` VALUES ('1955', '12137', '21', '52.00', '0', null);
INSERT INTO `ticket` VALUES ('1956', '12138', '21', '52.00', '0', null);
INSERT INTO `ticket` VALUES ('1957', '12139', '21', '52.00', '0', null);
INSERT INTO `ticket` VALUES ('1958', '12140', '21', '52.00', '0', null);
INSERT INTO `ticket` VALUES ('1959', '12141', '21', '52.00', '0', null);
INSERT INTO `ticket` VALUES ('1960', '12142', '21', '52.00', '0', null);
INSERT INTO `ticket` VALUES ('1961', '12143', '21', '52.00', '0', null);
INSERT INTO `ticket` VALUES ('1962', '12144', '21', '52.00', '0', null);
INSERT INTO `ticket` VALUES ('1963', '12145', '21', '52.00', '0', null);
INSERT INTO `ticket` VALUES ('1964', '12146', '21', '52.00', '0', null);
INSERT INTO `ticket` VALUES ('1965', '12147', '21', '52.00', '0', null);
INSERT INTO `ticket` VALUES ('1966', '12148', '21', '52.00', '0', null);
INSERT INTO `ticket` VALUES ('1967', '12149', '21', '52.00', '0', null);
INSERT INTO `ticket` VALUES ('1968', '12150', '21', '52.00', '0', null);
INSERT INTO `ticket` VALUES ('1969', '12151', '21', '52.00', '0', null);
INSERT INTO `ticket` VALUES ('1970', '12152', '21', '52.00', '0', null);
INSERT INTO `ticket` VALUES ('1971', '12153', '21', '52.00', '0', null);
INSERT INTO `ticket` VALUES ('1972', '12154', '21', '52.00', '0', null);
INSERT INTO `ticket` VALUES ('1973', '12155', '21', '52.00', '0', null);
INSERT INTO `ticket` VALUES ('1974', '12156', '21', '52.00', '0', null);
INSERT INTO `ticket` VALUES ('1975', '12157', '21', '52.00', '0', null);
INSERT INTO `ticket` VALUES ('1976', '12158', '21', '52.00', '0', null);
INSERT INTO `ticket` VALUES ('1977', '12159', '21', '52.00', '0', null);
INSERT INTO `ticket` VALUES ('1978', '12160', '21', '52.00', '0', null);
INSERT INTO `ticket` VALUES ('1979', '12161', '21', '52.00', '0', null);
INSERT INTO `ticket` VALUES ('1980', '12162', '21', '52.00', '0', null);
INSERT INTO `ticket` VALUES ('1981', '12163', '21', '52.00', '0', null);
INSERT INTO `ticket` VALUES ('1982', '12164', '21', '52.00', '0', null);
INSERT INTO `ticket` VALUES ('1983', '12165', '21', '52.00', '0', null);
INSERT INTO `ticket` VALUES ('1984', '12166', '21', '52.00', '0', null);
INSERT INTO `ticket` VALUES ('1985', '12167', '21', '52.00', '0', null);
INSERT INTO `ticket` VALUES ('1986', '12168', '21', '52.00', '0', null);
INSERT INTO `ticket` VALUES ('1987', '12169', '21', '52.00', '0', null);
INSERT INTO `ticket` VALUES ('1988', '12170', '21', '52.00', '0', null);
INSERT INTO `ticket` VALUES ('1989', '12171', '21', '52.00', '0', null);
INSERT INTO `ticket` VALUES ('1990', '12172', '21', '52.00', '0', null);
INSERT INTO `ticket` VALUES ('1991', '12173', '21', '52.00', '0', null);
INSERT INTO `ticket` VALUES ('1992', '12174', '21', '52.00', '0', null);
INSERT INTO `ticket` VALUES ('1993', '12175', '21', '52.00', '0', null);
INSERT INTO `ticket` VALUES ('1994', '12176', '21', '52.00', '0', null);
INSERT INTO `ticket` VALUES ('1995', '12177', '21', '52.00', '0', null);
INSERT INTO `ticket` VALUES ('1996', '12178', '21', '52.00', '0', null);
INSERT INTO `ticket` VALUES ('1997', '12179', '21', '52.00', '0', null);
INSERT INTO `ticket` VALUES ('1998', '12180', '21', '52.00', '0', null);
INSERT INTO `ticket` VALUES ('1999', '12181', '21', '52.00', '0', null);
INSERT INTO `ticket` VALUES ('2000', '12182', '21', '52.00', '0', null);
INSERT INTO `ticket` VALUES ('2001', '12183', '21', '52.00', '0', null);
INSERT INTO `ticket` VALUES ('2002', '12184', '21', '52.00', '0', null);
INSERT INTO `ticket` VALUES ('2003', '12185', '21', '52.00', '0', null);
INSERT INTO `ticket` VALUES ('2004', '12186', '21', '52.00', '0', null);
INSERT INTO `ticket` VALUES ('2005', '12187', '21', '52.00', '0', null);
INSERT INTO `ticket` VALUES ('2006', '12188', '21', '52.00', '0', null);
INSERT INTO `ticket` VALUES ('2007', '12189', '21', '52.00', '0', null);
INSERT INTO `ticket` VALUES ('2008', '12190', '21', '52.00', '0', null);
INSERT INTO `ticket` VALUES ('2009', '12191', '21', '52.00', '0', null);
INSERT INTO `ticket` VALUES ('2010', '12192', '21', '52.00', '0', null);
INSERT INTO `ticket` VALUES ('2011', '12193', '21', '52.00', '0', null);
INSERT INTO `ticket` VALUES ('2012', '12194', '21', '52.00', '0', null);
INSERT INTO `ticket` VALUES ('2013', '12195', '21', '52.00', '0', null);
INSERT INTO `ticket` VALUES ('2014', '12196', '21', '52.00', '0', null);
INSERT INTO `ticket` VALUES ('2015', '12197', '21', '52.00', '0', null);
INSERT INTO `ticket` VALUES ('2016', '12198', '21', '52.00', '0', null);
INSERT INTO `ticket` VALUES ('2017', '12199', '21', '52.00', '0', null);
INSERT INTO `ticket` VALUES ('2018', '12601', '22', '23.00', '-1', null);
INSERT INTO `ticket` VALUES ('2019', '12602', '22', '23.00', '0', '2018-06-15 00:43:01');
INSERT INTO `ticket` VALUES ('2020', '12603', '22', '23.00', '9', '2018-06-15 00:43:35');
INSERT INTO `ticket` VALUES ('2021', '12604', '22', '23.00', '9', '2018-06-15 00:43:36');
INSERT INTO `ticket` VALUES ('2022', '12605', '22', '23.00', '0', null);
INSERT INTO `ticket` VALUES ('2023', '12606', '22', '23.00', '0', null);
INSERT INTO `ticket` VALUES ('2024', '12607', '22', '23.00', '0', null);
INSERT INTO `ticket` VALUES ('2025', '12608', '22', '23.00', '0', null);
INSERT INTO `ticket` VALUES ('2026', '12609', '22', '23.00', '0', null);
INSERT INTO `ticket` VALUES ('2027', '12610', '22', '23.00', '0', null);
INSERT INTO `ticket` VALUES ('2028', '12611', '22', '23.00', '0', null);
INSERT INTO `ticket` VALUES ('2029', '12612', '22', '23.00', '0', null);
INSERT INTO `ticket` VALUES ('2030', '12613', '22', '23.00', '0', null);
INSERT INTO `ticket` VALUES ('2031', '12614', '22', '23.00', '0', null);
INSERT INTO `ticket` VALUES ('2032', '12615', '22', '23.00', '0', null);
INSERT INTO `ticket` VALUES ('2033', '12616', '22', '23.00', '0', null);
INSERT INTO `ticket` VALUES ('2034', '12617', '22', '23.00', '0', null);
INSERT INTO `ticket` VALUES ('2035', '12618', '22', '23.00', '0', null);
INSERT INTO `ticket` VALUES ('2036', '12619', '22', '23.00', '0', null);
INSERT INTO `ticket` VALUES ('2037', '12620', '22', '23.00', '0', null);
INSERT INTO `ticket` VALUES ('2038', '12621', '22', '23.00', '0', null);
INSERT INTO `ticket` VALUES ('2039', '12622', '22', '23.00', '0', null);
INSERT INTO `ticket` VALUES ('2040', '12623', '22', '23.00', '0', null);
INSERT INTO `ticket` VALUES ('2041', '12624', '22', '23.00', '0', null);
INSERT INTO `ticket` VALUES ('2042', '12625', '22', '23.00', '0', null);
INSERT INTO `ticket` VALUES ('2043', '12626', '22', '23.00', '0', null);
INSERT INTO `ticket` VALUES ('2044', '12627', '22', '23.00', '0', null);
INSERT INTO `ticket` VALUES ('2045', '12628', '22', '23.00', '0', null);
INSERT INTO `ticket` VALUES ('2046', '12629', '22', '23.00', '0', null);
INSERT INTO `ticket` VALUES ('2047', '12630', '22', '23.00', '0', null);
INSERT INTO `ticket` VALUES ('2048', '12631', '22', '23.00', '0', null);
INSERT INTO `ticket` VALUES ('2049', '12632', '22', '23.00', '0', null);
INSERT INTO `ticket` VALUES ('2050', '12633', '22', '23.00', '0', null);
INSERT INTO `ticket` VALUES ('2051', '12634', '22', '23.00', '0', null);
INSERT INTO `ticket` VALUES ('2052', '12635', '22', '23.00', '0', null);
INSERT INTO `ticket` VALUES ('2053', '12636', '22', '23.00', '0', null);

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `emp_pass` varchar(255) NOT NULL COMMENT '密码',
  `type` int(11) NOT NULL DEFAULT '0' COMMENT '用户类型：\r\n0为售票员\r\n1为管理员\r\n2为经理\r\n',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '0为未激活\r\n1为已激活',
  `emp_no` varchar(20) NOT NULL COMMENT '用户名',
  `activation_code` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`emp_no`),
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`emp_no`) REFERENCES `employee` (`emp_no`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('25bfc0fa206722704da7bd56a78779d7', '0', '1', '004', '123');
INSERT INTO `user` VALUES ('84f6071313854c94c1d8542bcfd4b14f', '1', '1', '006', '123');
INSERT INTO `user` VALUES ('0d0589cd78709802a64a9a4580ae6789', '2', '1', '007', '123');
INSERT INTO `user` VALUES ('d83bee2610a7ebea12ca46db4cc169c8', '2', '1', '009', '5fec2b66-aba0-4a55-886d-aaa56023113d');
INSERT INTO `user` VALUES ('e892a98675a7635ae40b353ba067fb8c', '0', '1', '090', '12e688b7-dcbe-41fb-bbc8-b4929267017d');
INSERT INTO `user` VALUES ('42ae1471c92d25f17088ddbb092fcdab', '2', '1', '182', 'e6f72e8c-a716-4c82-b508-11d68065c8c7');


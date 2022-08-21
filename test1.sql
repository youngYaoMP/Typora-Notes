/*
Navicat MySQL Data Transfer

Source Server         : ymp
Source Server Version : 50623
Source Host           : localhost:3306
Source Database       : test1

Target Server Type    : MYSQL
Target Server Version : 50623
File Encoding         : 65001

Date: 2022-08-18 20:33:02
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course` (
  `cno` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`cno`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of course
-- ----------------------------
INSERT INTO `course` VALUES ('1', '高等数学');
INSERT INTO `course` VALUES ('2', '大学语文');
INSERT INTO `course` VALUES ('3', '线性代数');
INSERT INTO `course` VALUES ('4', '离散数学');
INSERT INTO `course` VALUES ('5', '大学物理');
INSERT INTO `course` VALUES ('6', '数电模电');

-- ----------------------------
-- Table structure for course_selection
-- ----------------------------
DROP TABLE IF EXISTS `course_selection`;
CREATE TABLE `course_selection` (
  `sno` int(11) NOT NULL,
  `cno` int(11) NOT NULL,
  PRIMARY KEY (`sno`,`cno`),
  KEY `course-selection_ibfk_2` (`cno`),
  CONSTRAINT `course_selection_ibfk_1` FOREIGN KEY (`sno`) REFERENCES `student` (`sno`) ON DELETE CASCADE,
  CONSTRAINT `course_selection_ibfk_2` FOREIGN KEY (`cno`) REFERENCES `course` (`cno`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of course_selection
-- ----------------------------
INSERT INTO `course_selection` VALUES ('1', '1');
INSERT INTO `course_selection` VALUES ('1', '2');
INSERT INTO `course_selection` VALUES ('2', '2');
INSERT INTO `course_selection` VALUES ('3', '3');
INSERT INTO `course_selection` VALUES ('4', '4');
INSERT INTO `course_selection` VALUES ('1', '5');
INSERT INTO `course_selection` VALUES ('2', '5');
INSERT INTO `course_selection` VALUES ('3', '5');
INSERT INTO `course_selection` VALUES ('5', '5');
INSERT INTO `course_selection` VALUES ('6', '5');
INSERT INTO `course_selection` VALUES ('6', '6');

-- ----------------------------
-- Table structure for dept
-- ----------------------------
DROP TABLE IF EXISTS `dept`;
CREATE TABLE `dept` (
  `deptno` int(11) NOT NULL AUTO_INCREMENT,
  `dname` varchar(10) DEFAULT NULL,
  `loc` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`deptno`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dept
-- ----------------------------
INSERT INTO `dept` VALUES ('1', '总指挥部', '顶层');
INSERT INTO `dept` VALUES ('2', '测试部', '一楼');
INSERT INTO `dept` VALUES ('3', '营销部', '二楼');
INSERT INTO `dept` VALUES ('4', '人事部', '三楼');
INSERT INTO `dept` VALUES ('5', '策划部', '四楼');

-- ----------------------------
-- Table structure for emp
-- ----------------------------
DROP TABLE IF EXISTS `emp`;
CREATE TABLE `emp` (
  `empno` int(11) NOT NULL AUTO_INCREMENT,
  `ename` varchar(10) DEFAULT NULL,
  `job` varchar(10) DEFAULT NULL,
  `mgr` int(11) DEFAULT NULL,
  `hiredate` datetime DEFAULT NULL,
  `sal` int(11) DEFAULT NULL,
  `comm` int(11) DEFAULT NULL,
  `deptno` int(11) DEFAULT NULL,
  PRIMARY KEY (`empno`),
  KEY `1` (`deptno`),
  CONSTRAINT `1` FOREIGN KEY (`deptno`) REFERENCES `dept` (`deptno`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of emp
-- ----------------------------
INSERT INTO `emp` VALUES ('1', '马云', '总经理', '1', '2022-05-31 16:09:08', '20000', '18000', '1');
INSERT INTO `emp` VALUES ('2', '王五', '营销经理', '1', '2022-06-07 16:09:24', '2000', '1800', '3');
INSERT INTO `emp` VALUES ('3', '姚桃', '测试经理', '1', '2022-06-27 16:07:55', '2000', '1800', '2');
INSERT INTO `emp` VALUES ('4', '喜羊羊', '人事经理', '1', '2022-06-16 16:13:43', '2000', '1800', '4');
INSERT INTO `emp` VALUES ('5', '美羊羊', '策划经理', '1', '2022-06-14 16:14:27', '2000', '18000', '5');
INSERT INTO `emp` VALUES ('6', '李四', '销售员', '2', '2022-06-01 15:40:15', '1500', '1000', '3');
INSERT INTO `emp` VALUES ('7', '张三', '测试员', '3', '2022-08-14 15:39:32', '1600', '800', '2');
INSERT INTO `emp` VALUES ('8', '营销办事员(红太狼)', 'CLERK', '2', '2022-08-26 17:45:01', '540', '400', '3');
INSERT INTO `emp` VALUES ('9', '测试办事员(小灰灰)', 'CLERK', '3', '2022-08-11 17:45:27', '500', '400', '2');
INSERT INTO `emp` VALUES ('10', '小二', '测试员', '3', '2022-08-17 17:58:00', '1200', '1000', '2');

-- ----------------------------
-- Table structure for menuinfo
-- ----------------------------
DROP TABLE IF EXISTS `menuinfo`;
CREATE TABLE `menuinfo` (
  `menuid` varchar(10) NOT NULL,
  `f_menuid` varchar(10) DEFAULT NULL,
  `menuname` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`menuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of menuinfo
-- ----------------------------
INSERT INTO `menuinfo` VALUES ('A00001', null, '交易执行');
INSERT INTO `menuinfo` VALUES ('A00002', 'A00001', '股票交易');
INSERT INTO `menuinfo` VALUES ('A00003', null, '债券交易');
INSERT INTO `menuinfo` VALUES ('A00004', null, '期货交易');
INSERT INTO `menuinfo` VALUES ('B00001', null, '指令下达');

-- ----------------------------
-- Table structure for roleinfo
-- ----------------------------
DROP TABLE IF EXISTS `roleinfo`;
CREATE TABLE `roleinfo` (
  `roleid` int(11) NOT NULL AUTO_INCREMENT,
  `orgid` int(11) DEFAULT NULL,
  `rolename` varchar(10) DEFAULT NULL,
  `roledesc` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`roleid`)
) ENGINE=InnoDB AUTO_INCREMENT=6668 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of roleinfo
-- ----------------------------
INSERT INTO `roleinfo` VALUES ('6666', '1', '交易员', '拥有交易执行权限的角色');
INSERT INTO `roleinfo` VALUES ('6667', '2', '投资经理', '拥有指令下单等权限的角色');

-- ----------------------------
-- Table structure for rolemenu
-- ----------------------------
DROP TABLE IF EXISTS `rolemenu`;
CREATE TABLE `rolemenu` (
  `roleid` int(11) NOT NULL,
  `menuid` varchar(10) NOT NULL,
  PRIMARY KEY (`roleid`,`menuid`),
  KEY `rolemenu_ibfk_2` (`menuid`),
  CONSTRAINT `rolemenu_ibfk_1` FOREIGN KEY (`roleid`) REFERENCES `roleinfo` (`roleid`) ON DELETE CASCADE,
  CONSTRAINT `rolemenu_ibfk_2` FOREIGN KEY (`menuid`) REFERENCES `menuinfo` (`menuid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rolemenu
-- ----------------------------
INSERT INTO `rolemenu` VALUES ('6666', 'A00001');
INSERT INTO `rolemenu` VALUES ('6667', 'A00002');

-- ----------------------------
-- Table structure for score
-- ----------------------------
DROP TABLE IF EXISTS `score`;
CREATE TABLE `score` (
  `name` varchar(10) DEFAULT NULL,
  `kecheng` varchar(10) DEFAULT NULL,
  `fenshu` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of score
-- ----------------------------
INSERT INTO `score` VALUES ('张三', '语文', '81');
INSERT INTO `score` VALUES ('张三', '数学', '75');
INSERT INTO `score` VALUES ('李四', '语文', '76');
INSERT INTO `score` VALUES ('李四', '数学', '70');
INSERT INTO `score` VALUES ('王五', '语文', '81');
INSERT INTO `score` VALUES ('王五', '数学', '100');
INSERT INTO `score` VALUES ('王五', '英语', '90');

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `sno` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`sno`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES ('1', '小姚');
INSERT INTO `student` VALUES ('2', '小啾');
INSERT INTO `student` VALUES ('3', '小李');
INSERT INTO `student` VALUES ('4', '小莲');
INSERT INTO `student` VALUES ('5', '阿生');
INSERT INTO `student` VALUES ('6', '宝哥');
INSERT INTO `student` VALUES ('7', '小邓');
INSERT INTO `student` VALUES ('8', '谢老板');
INSERT INTO `student` VALUES ('9', '何同学');
INSERT INTO `student` VALUES ('10', '杏儿');

-- ----------------------------
-- Table structure for test
-- ----------------------------
DROP TABLE IF EXISTS `test`;
CREATE TABLE `test` (
  `money` int(11) NOT NULL,
  `name` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of test
-- ----------------------------
INSERT INTO `test` VALUES ('100', 'ab');
INSERT INTO `test` VALUES ('750', '何同学');
INSERT INTO `test` VALUES ('1000', '小啾');
INSERT INTO `test` VALUES ('666', '小姚');
INSERT INTO `test` VALUES ('6000', '小邓');
INSERT INTO `test` VALUES ('10000', '阿生');
INSERT INTO `test` VALUES ('100', 'ab');
INSERT INTO `test` VALUES ('600', 'cd');
INSERT INTO `test` VALUES ('600', 'cd');
INSERT INTO `test` VALUES ('700', 'ef');

-- ----------------------------
-- Table structure for test1
-- ----------------------------
DROP TABLE IF EXISTS `test1`;
CREATE TABLE `test1` (
  `Id` int(11) NOT NULL,
  `P_Id` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of test1
-- ----------------------------
INSERT INTO `test1` VALUES ('1', '1');
INSERT INTO `test1` VALUES ('2', '2');
INSERT INTO `test1` VALUES ('3', '2');
INSERT INTO `test1` VALUES ('4', '2');
INSERT INTO `test1` VALUES ('5', '6');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `P_Id` int(11) NOT NULL,
  `name` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`P_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'a');
INSERT INTO `user` VALUES ('2', 'b');
INSERT INTO `user` VALUES ('3', 'c');

-- ----------------------------
-- Table structure for userinfo
-- ----------------------------
DROP TABLE IF EXISTS `userinfo`;
CREATE TABLE `userinfo` (
  `userid` int(11) NOT NULL AUTO_INCREMENT,
  `orgid` int(11) DEFAULT NULL,
  `username` varchar(10) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=8884 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of userinfo
-- ----------------------------
INSERT INTO `userinfo` VALUES ('8881', '1', '张飞', '0');
INSERT INTO `userinfo` VALUES ('8882', '1', '关羽', '1');
INSERT INTO `userinfo` VALUES ('8883', '2', '曹操', '0');

-- ----------------------------
-- Table structure for userrole
-- ----------------------------
DROP TABLE IF EXISTS `userrole`;
CREATE TABLE `userrole` (
  `roleid` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  PRIMARY KEY (`roleid`,`userid`),
  KEY `userrole_ibfk_2` (`userid`),
  CONSTRAINT `userrole_ibfk_1` FOREIGN KEY (`roleid`) REFERENCES `roleinfo` (`roleid`) ON DELETE CASCADE,
  CONSTRAINT `userrole_ibfk_2` FOREIGN KEY (`userid`) REFERENCES `userinfo` (`userid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of userrole
-- ----------------------------
INSERT INTO `userrole` VALUES ('6666', '8881');
INSERT INTO `userrole` VALUES ('6667', '8882');
INSERT INTO `userrole` VALUES ('6667', '8883');

-- ----------------------------
-- Table structure for xscj
-- ----------------------------
DROP TABLE IF EXISTS `xscj`;
CREATE TABLE `xscj` (
  `xh` char(10) DEFAULT NULL,
  `kch` char(10) DEFAULT NULL,
  `kccj` int(11) DEFAULT NULL,
  KEY `xh` (`xh`),
  CONSTRAINT `xscj_ibfk_1` FOREIGN KEY (`xh`) REFERENCES `xsda` (`xh`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xscj
-- ----------------------------
INSERT INTO `xscj` VALUES ('2000jsj006', 'Yy1', '80');
INSERT INTO `xscj` VALUES ('2000jsj006', 'Yy2', '60');
INSERT INTO `xscj` VALUES ('2000jsj007', 'Yy1', '70');
INSERT INTO `xscj` VALUES ('2000jsj007', 'Yy2', '70');
INSERT INTO `xscj` VALUES ('2000jsj008', 'Yy1', '90');
INSERT INTO `xscj` VALUES ('2000jsj008', 'Yy2', '100');

-- ----------------------------
-- Table structure for xsda
-- ----------------------------
DROP TABLE IF EXISTS `xsda`;
CREATE TABLE `xsda` (
  `xh` char(10) NOT NULL,
  `xm` char(8) DEFAULT NULL,
  `csny` datetime DEFAULT NULL,
  `gz` decimal(6,0) DEFAULT NULL,
  `zy` char(10) DEFAULT NULL,
  PRIMARY KEY (`xh`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xsda
-- ----------------------------
INSERT INTO `xsda` VALUES ('2000jsj006', '张四', '1965-06-01 17:27:25', '3600', '计算机');
INSERT INTO `xsda` VALUES ('2000jsj007', '张三', '1998-06-01 17:27:25', '2000', '计算机');
INSERT INTO `xsda` VALUES ('2000jsj008', '李平', '1978-06-01 17:27:25', '1000', '数统');

/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 80016
Source Host           : localhost:3306
Source Database       : webshopplatform

Target Server Type    : MYSQL
Target Server Version : 80016
File Encoding         : 65001

Date: 2019-06-23 19:26:41
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '管理员ID',
  `admin_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '管理员登录名',
  `password` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '管理员登陆密码',
  `admin_tel` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '电话',
  `admin_email` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '邮箱',
  `admin_addr` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '地址',
  `admin_delete` int(1) NOT NULL DEFAULT '0' COMMENT '管理员状态',
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', 'admin', 'admin', '12345678900', '12345678900@139.com', '岭南师范学院本校区', '0');
INSERT INTO `admin` VALUES ('2', 'admin1', '0000', '12345678901', '12345678901@139.com', '岭南师范学院', '0');
INSERT INTO `admin` VALUES ('5', 'admin', '0000', '110120119', 'admin', 'admin', '0');

-- ----------------------------
-- Table structure for attr_value
-- ----------------------------
DROP TABLE IF EXISTS `attr_value`;
CREATE TABLE `attr_value` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '扩展属性值ID',
  `value` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '扩展属性值',
  `sid` int(11) DEFAULT NULL COMMENT '扩展属性ID',
  `pid` int(11) DEFAULT NULL COMMENT '商品ID',
  PRIMARY KEY (`id`),
  KEY `sid` (`sid`),
  KEY `pid` (`pid`),
  CONSTRAINT `pid` FOREIGN KEY (`pid`) REFERENCES `product` (`id`),
  CONSTRAINT `sid` FOREIGN KEY (`sid`) REFERENCES `secondcatalog` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of attr_value
-- ----------------------------
INSERT INTO `attr_value` VALUES ('1', '一个', '1', '1');
INSERT INTO `attr_value` VALUES ('2', '椭圆果冻', '2', '1');
INSERT INTO `attr_value` VALUES ('3', '橙、粉、白', '3', '1');
INSERT INTO `attr_value` VALUES ('5', '一包', '1', '2');
INSERT INTO `attr_value` VALUES ('6', null, '2', '2');
INSERT INTO `attr_value` VALUES ('7', null, '3', '2');
INSERT INTO `attr_value` VALUES ('8', '60克', '8', '2');
INSERT INTO `attr_value` VALUES ('9', '奇塑家居', '4', '4');
INSERT INTO `attr_value` VALUES ('10', '收纳盒', '5', '4');
INSERT INTO `attr_value` VALUES ('11', '看装纳小物品', '6', '4');
INSERT INTO `attr_value` VALUES ('12', null, '7', '4');
INSERT INTO `attr_value` VALUES ('13', '爱之家', '4', '3');
INSERT INTO `attr_value` VALUES ('14', '床上用品', '5', '3');
INSERT INTO `attr_value` VALUES ('15', null, '6', '3');
INSERT INTO `attr_value` VALUES ('16', '浪漫', '7', '3');
INSERT INTO `attr_value` VALUES ('17', '偏硬', '4', '5');
INSERT INTO `attr_value` VALUES ('18', '散装', '5', '5');
INSERT INTO `attr_value` VALUES ('19', '乐视乐事', '6', '5');
INSERT INTO `attr_value` VALUES ('20', '花生味', '7', '5');
INSERT INTO `attr_value` VALUES ('29', '包装', '5', '10');
INSERT INTO `attr_value` VALUES ('30', '徐福记', '6', '10');
INSERT INTO `attr_value` VALUES ('31', '话梅味', '7', '10');
INSERT INTO `attr_value` VALUES ('32', '一盒', '1', '7');
INSERT INTO `attr_value` VALUES ('33', '黑色', '3', '7');
INSERT INTO `attr_value` VALUES ('34', '偏硬', '9', '11');
INSERT INTO `attr_value` VALUES ('35', '软', '9', '12');
INSERT INTO `attr_value` VALUES ('36', '25克', '8', '1');
INSERT INTO `attr_value` VALUES ('37', null, '2', '7');
INSERT INTO `attr_value` VALUES ('38', '软', '1', '16');
INSERT INTO `attr_value` VALUES ('39', '椭圆', '2', '16');
INSERT INTO `attr_value` VALUES ('40', '乳白', '3', '16');
INSERT INTO `attr_value` VALUES ('41', '脆', '9', '17');
INSERT INTO `attr_value` VALUES ('42', '脆脆的', '9', '18');
INSERT INTO `attr_value` VALUES ('43', '软', '4', '19');
INSERT INTO `attr_value` VALUES ('44', '未知', '10', '24');
INSERT INTO `attr_value` VALUES ('45', '鲜橙、水蜜桃、荔枝', '14', '1');
INSERT INTO `attr_value` VALUES ('46', '喜之郎', '15', '1');
INSERT INTO `attr_value` VALUES ('47', '250克', '8', '7');
INSERT INTO `attr_value` VALUES ('48', '花生', '14', '7');
INSERT INTO `attr_value` VALUES ('49', '德福集团', '15', '7');
INSERT INTO `attr_value` VALUES ('50', '一小盒', '1', '9');
INSERT INTO `attr_value` VALUES ('51', '红', '3', '9');
INSERT INTO `attr_value` VALUES ('52', '草莓味', '14', '9');
INSERT INTO `attr_value` VALUES ('53', '爱之家', '15', '9');
INSERT INTO `attr_value` VALUES ('54', '甘草味', '14', '2');
INSERT INTO `attr_value` VALUES ('55', '爱之家', '15', '2');
INSERT INTO `attr_value` VALUES ('56', '棉纱', '13', '3');
INSERT INTO `attr_value` VALUES ('57', '塑料', '13', '4');
INSERT INTO `attr_value` VALUES ('58', '木鸟之家', '4', '28');
INSERT INTO `attr_value` VALUES ('59', '挂式', '5', '28');
INSERT INTO `attr_value` VALUES ('60', '采用复合型材料', '13', '28');
INSERT INTO `attr_value` VALUES ('61', 'L码', '21', '29');
INSERT INTO `attr_value` VALUES ('62', '中青年女性', '24', '29');
INSERT INTO `attr_value` VALUES ('63', 'M码', '21', '30');
INSERT INTO `attr_value` VALUES ('64', '复古', '22', '30');
INSERT INTO `attr_value` VALUES ('65', '所有女性', '24', '30');
INSERT INTO `attr_value` VALUES ('66', 'M码', '21', '31');
INSERT INTO `attr_value` VALUES ('67', '潮流', '22', '31');
INSERT INTO `attr_value` VALUES ('68', '青女女性、在校女学生', '24', '31');
INSERT INTO `attr_value` VALUES ('69', 'L码', '21', '32');
INSERT INTO `attr_value` VALUES ('70', '流行', '22', '32');
INSERT INTO `attr_value` VALUES ('71', '天之蓝', '23', '32');
INSERT INTO `attr_value` VALUES ('72', '商务人士', '24', '32');
INSERT INTO `attr_value` VALUES ('73', 'SL、M、L', '21', '33');
INSERT INTO `attr_value` VALUES ('74', '潮流、热销', '22', '33');
INSERT INTO `attr_value` VALUES ('75', '萌小妹', '23', '33');
INSERT INTO `attr_value` VALUES ('76', '在校女学生、青年女性', '24', '33');

-- ----------------------------
-- Table structure for catalog
-- ----------------------------
DROP TABLE IF EXISTS `catalog`;
CREATE TABLE `catalog` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '分类ID',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '分类名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of catalog
-- ----------------------------
INSERT INTO `catalog` VALUES ('1', '零食');
INSERT INTO `catalog` VALUES ('2', '生活用品');
INSERT INTO `catalog` VALUES ('3', '服装');
INSERT INTO `catalog` VALUES ('5', '鞋子');
INSERT INTO `catalog` VALUES ('6', '护肤品');
INSERT INTO `catalog` VALUES ('7', '电子产品');

-- ----------------------------
-- Table structure for merchant
-- ----------------------------
DROP TABLE IF EXISTS `merchant`;
CREATE TABLE `merchant` (
  `merchant_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商家ID',
  `merchant_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '商家登录名',
  `merchant_password` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '商家登录密码',
  `realname` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '商家实名',
  `merchant_tel` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '电话',
  `merchant_email` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '邮箱',
  `merchant_addr` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '地址',
  `merchant_Sname` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '商店名',
  `merchant_Stel` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '商店电话',
  `isPassed` int(2) DEFAULT '0' COMMENT '商家状态',
  `businessPhoto` varchar(255) DEFAULT NULL COMMENT '营业照片路径，用于商家审核',
  `registerTime` varchar(20) DEFAULT NULL COMMENT '申请注册以及作为商家入驻时间',
  PRIMARY KEY (`merchant_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of merchant
-- ----------------------------
INSERT INTO `merchant` VALUES ('1', 'merchant', '0000', '王五', '12345678999', '12345678999@139.com', '岭南师范学院本校', '齐来乐事', '030-258-456', '1', null, '2016-06-03');
INSERT INTO `merchant` VALUES ('6', 'mc1', '0000', '力王', '12345678901', '12345678901@139.com', '岭南师范学院12', '有力', '0088880', '1', null, '2019-06-01');
INSERT INTO `merchant` VALUES ('7', 'JSON', 'woshizhuxiaodi', '猪小弟', '15768501236', '15768501236@139.com', '湛江市赤坎区光明小路', '猪之家腊肠', '15768501236', '1', 'images/business/a9bd2bfb47a5495e896a3edd0deeeb2a.gif', '2019-06-20');
INSERT INTO `merchant` VALUES ('8', 'fuzhuang', '0000', '福特白', '12345678936', '12345678936@139.com', '广州天河', '衣身有你', '010-00112233', '1', 'images/business/10c2f442c7954ed6bd83d7bbcd757a2e.jpeg', '2019-06-23');

-- ----------------------------
-- Table structure for orderitem
-- ----------------------------
DROP TABLE IF EXISTS `orderitem`;
CREATE TABLE `orderitem` (
  `id` varchar(30) NOT NULL COMMENT '订单号，时间戳',
  `pid` int(11) NOT NULL COMMENT '商品号',
  `sid` int(11) NOT NULL COMMENT '用户号',
  `price` double(10,2) NOT NULL COMMENT '购买时商品价',
  `quantity` int(11) NOT NULL COMMENT '数量',
  `name` varchar(50) DEFAULT NULL COMMENT '收件人',
  `address` varchar(100) DEFAULT NULL COMMENT '收件地址',
  `telephone` char(11) DEFAULT NULL COMMENT '收件人联系电话',
  `status` int(11) DEFAULT NULL COMMENT '状态位，为0是购物车，为1是待提交订单，为2是订单提交，为3是已发货订单，为4是订单完成',
  PRIMARY KEY (`id`,`pid`,`sid`),
  KEY `fk_orderItem_pid` (`pid`),
  KEY `fk_orderItem_sid` (`sid`),
  CONSTRAINT `fk_orderItem_pid` FOREIGN KEY (`pid`) REFERENCES `product` (`id`),
  CONSTRAINT `fk_orderItem_sid` FOREIGN KEY (`sid`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of orderitem
-- ----------------------------

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品ID',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '商品名',
  `price` decimal(10,2) DEFAULT NULL COMMENT '商品价',
  `discount` decimal(10,2) DEFAULT NULL COMMENT '折扣价',
  `dateofmanufacture` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '生产日期',
  `termofvalidity` int(11) DEFAULT NULL COMMENT '有效期',
  `mid` int(11) DEFAULT NULL COMMENT '商家id',
  `merchantname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '冗余商店名',
  `isPassed` int(11) NOT NULL DEFAULT '0' COMMENT '状态位',
  `image` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '图片路径',
  `cid` int(11) DEFAULT NULL COMMENT '冗余一级分类id',
  `quantity` int(11) DEFAULT '0' COMMENT '商品储存量',
  `isHot` int(11) DEFAULT '0' COMMENT 'sh热门商品状态位',
  `registerTime` varchar(20) DEFAULT NULL COMMENT '商品上架注册时间，主要用于管理员查询',
  PRIMARY KEY (`id`),
  KEY `FK_PID` (`mid`),
  CONSTRAINT `FK_PID` FOREIGN KEY (`mid`) REFERENCES `merchant` (`merchant_id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('1', '喜之郎果冻', '1.00', '1.00', '20190623', '180', '6', '有力', '1', 'images/be776bd40f3b499e9df4b4ebee75afc8.jpeg', '1', '100', null, '2019-06-17');
INSERT INTO `product` VALUES ('2', '情人梅', '3.70', '3.70', '20190623', '120', '1', '齐来乐事', '1', 'images/af5c6dc37d24464c9e65610ff58f9b05.jpeg', '1', '44', null, '2019-06-17');
INSERT INTO `product` VALUES ('3', '家用舒适棉枕', '28.00', '28.00', '20190623', '365', '1', '齐来乐事', '1', 'images/bb607239154f49f6be06f9027e2c84b3.jpeg', '2', '50', null, '2019-06-16');
INSERT INTO `product` VALUES ('4', '小物件收纳盒', '8.80', '8.80', '20190623', '180', '1', '齐来乐事', '1', 'images/103018aa62224537a7aaca1610517108.jpeg', '2', '50', null, '2019-06-16');
INSERT INTO `product` VALUES ('5', '牛轧糖', '2.00', '1.00', '20190409', '120', '1', '齐来乐事', '1', 'images/65204fd2623044b88ae8e086fc8be7f8.jpeg', '2', '44', null, '2019-06-16');
INSERT INTO `product` VALUES ('7', '德福巧克力', '89.00', '85.00', '20190623', '120', '6', '有力', '1', 'images/75be3e04eb86425792b6de5538531599.jpeg', '1', '50', null, '2019-06-16');
INSERT INTO `product` VALUES ('8', '测试2', '20.00', '2.00', '20190509', '60', '6', '有力', '2', 'images/8d3553d967154a349b4903fb553f4774.gif', '2', '0', null, '2019-06-17');
INSERT INTO `product` VALUES ('9', '甜甜蜜蜜爱心软糖', '9.90', '9.90', '20190623', '180', '6', '有力', '1', 'images/4242ab7f18ab4f4ba6872691c56b4978.jpeg', '1', '50', null, '2019-06-18');
INSERT INTO `product` VALUES ('10', '话梅糖', '20.00', '20.00', '20190509', '50', '6', '有力', '0', 'images/02d734fc232a4185a2bf9fa586f908cf.jpeg', '2', '10', null, '2019-06-13');
INSERT INTO `product` VALUES ('11', '威化草莓饼干', '20.00', '18.80', '20190509', '180', '6', '有力', '2', 'images/2f59ff2ed5bf4ec9b27cedb24e8832f2.jpeg', '6', '-2', null, '2019-06-02');
INSERT INTO `product` VALUES ('12', '威化巧克力饼干', '90.00', '78.80', '20190509', '180', '6', '有力', '2', 'images/936ad2fd08bd4028b28c1313261fa842.jpeg', '6', '0', null, '2019-06-02');
INSERT INTO `product` VALUES ('13', '2345', '234.00', '234.00', '201905010', '3', '6', '有力', '2', 'images/dfbb541d30214864a67785994a5d076c.gif', '5', '0', null, '2019-05-25');
INSERT INTO `product` VALUES ('14', '不添加更多属性', '1.00', '1.00', '1', '1', '6', '有力', '2', '', '8', '1', '0', '2019-06-14');
INSERT INTO `product` VALUES ('15', '2019-06-10', '10.00', '10.00', '20160610', '80', '6', '有力', '2', 'images/f20d9baccc1f4429be1f92bfa8606ac0.png', '8', '8', '0', '2019-06-08');
INSERT INTO `product` VALUES ('16', '哈密新瓜', '20.00', '20.00', '20190610', '20', '6', '有力', '2', 'images/358d7cbea56e47eeab3b6f595d8a7a99.jpeg', '1', '100', '0', '2019-06-15');
INSERT INTO `product` VALUES ('17', '美味都市脆脆香', '1.00', '1.00', '20160610', '180', '6', '有力', '2', '', '6', '30', '0', '2019-06-12');
INSERT INTO `product` VALUES ('18', '奥利奥', '19.90', '19.90', '2019-06-17', '360', '6', '有力', '0', 'images/b2e357fc74e04c6b8875b3aff40205b3.jpeg', '6', '0', '0', '2019-06-11');
INSERT INTO `product` VALUES ('19', '1', '5.00', '3.00', '20190101', '60', '6', '有力', '2', '', '2', '40', '0', '2019-06-11');
INSERT INTO `product` VALUES ('20', '20190623', '10.00', '10.00', '20190623', '80', '6', '有力', '0', 'images/776b25fb48664bbb9365b8d114f67f19.png', '8', '10', '0', '2019-06-13');
INSERT INTO `product` VALUES ('21', '20190623', '20.00', '20.00', '20190623', '80', '6', '有力', '0', 'images/2dae4412e726467b80a80b27afed643a.png', '8', '10', '0', '2019-06-13');
INSERT INTO `product` VALUES ('22', '20190623', '20.00', '10.00', '20190623', '80', '6', '有力', '0', 'images/632029291b5946c297eaf50573d1add7.png', '8', '40', '0', '2019-06-13');
INSERT INTO `product` VALUES ('23', '修改之后', '10.00', '10.00', '20190623', '60', '6', '有力', '0', 'images/5eb148e2f82240f5b23182465d04107e.jpeg', '8', '10', '0', '2019-06-23');
INSERT INTO `product` VALUES ('24', 'JSON', '12.00', '12.00', '20190623', '20', '7', '猪之家腊肠', '0', 'images/7f3e6f20b91b4605b590bbb21c951d43.jpeg', '7', '40', '0', '2019-06-23');
INSERT INTO `product` VALUES ('27', '34', '34.00', '34.00', '20190623', '34', '7', '猪之家腊肠', '0', '', '9', '34', '0', '2019-06-23');
INSERT INTO `product` VALUES ('28', '便携式衣架', '39.90', '39.90', '20190623', '365', '1', '齐来乐事', '1', 'images/3710fc01575c4a6f9af4a0f8dbd80401.jpeg', '2', '50', '0', '2019-06-23');
INSERT INTO `product` VALUES ('29', '加长皮毛外套', '199.00', '189.00', '20190623', '365', '8', '衣身有你', '1', 'images/ab16d89d1fc54bf395ba25322fe212ea.png', '3', '20', '0', '2019-06-23');
INSERT INTO `product` VALUES ('30', '复古线绒戴帽外套', '69.00', '69.00', '20190623', '365', '8', '衣身有你', '1', 'images/84ee15ad262f493dbffcd8ef58b79f1f.jpeg', '3', '20', '0', '2019-06-23');
INSERT INTO `product` VALUES ('31', '线纹连衣裙', '109.00', '100.00', '20190623', '365', '8', '衣身有你', '1', 'images/a24da149f3b744de87bee1fe279b37a2.jpeg', '3', '10', '0', '2019-06-23');
INSERT INTO `product` VALUES ('32', '超酷长袖男式上衣', '59.90', '49.90', '20190623', '368', '8', '衣身有你', '1', 'images/564a8acf12af421285118abd6a135c6b.png', '3', '22', '0', '2019-06-23');
INSERT INTO `product` VALUES ('33', '萌小妹连衣裙摆长袖加绒', '59.00', '59.00', '20190623', '368', '8', '衣身有你', '1', 'images/6825fa52a69c4342b09c281cf2acaa15.jpeg', '3', '10', '0', '2019-06-23');

-- ----------------------------
-- Table structure for secondcatalog
-- ----------------------------
DROP TABLE IF EXISTS `secondcatalog`;
CREATE TABLE `secondcatalog` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '扩展属性ID',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '扩展属名称',
  `cid` int(11) NOT NULL COMMENT '分类ID',
  PRIMARY KEY (`id`),
  KEY `cid` (`cid`),
  CONSTRAINT `cid` FOREIGN KEY (`cid`) REFERENCES `catalog` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of secondcatalog
-- ----------------------------
INSERT INTO `secondcatalog` VALUES ('1', '规格', '1');
INSERT INTO `secondcatalog` VALUES ('2', '形状', '1');
INSERT INTO `secondcatalog` VALUES ('3', '颜色', '1');
INSERT INTO `secondcatalog` VALUES ('4', '品牌', '2');
INSERT INTO `secondcatalog` VALUES ('5', '类型', '2');
INSERT INTO `secondcatalog` VALUES ('6', '用途', '2');
INSERT INTO `secondcatalog` VALUES ('7', '风格', '2');
INSERT INTO `secondcatalog` VALUES ('8', '重量', '1');
INSERT INTO `secondcatalog` VALUES ('9', '功能疗效', '6');
INSERT INTO `secondcatalog` VALUES ('10', '品牌', '7');
INSERT INTO `secondcatalog` VALUES ('13', '材料', '2');
INSERT INTO `secondcatalog` VALUES ('14', '口味', '1');
INSERT INTO `secondcatalog` VALUES ('15', '品牌', '1');
INSERT INTO `secondcatalog` VALUES ('16', '尺码', '5');
INSERT INTO `secondcatalog` VALUES ('17', '款式', '5');
INSERT INTO `secondcatalog` VALUES ('18', '适用人群', '5');
INSERT INTO `secondcatalog` VALUES ('19', '材质', '5');
INSERT INTO `secondcatalog` VALUES ('20', '品牌', '5');
INSERT INTO `secondcatalog` VALUES ('21', '尺码', '3');
INSERT INTO `secondcatalog` VALUES ('22', '款式', '3');
INSERT INTO `secondcatalog` VALUES ('23', '品牌', '3');
INSERT INTO `secondcatalog` VALUES ('24', '适用人群', '3');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `user_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户登录名',
  `user_password` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户登录密码',
  `realname` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '用户实名',
  `user_sex` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '性别',
  `user_tel` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '联系电话',
  `user_email` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '邮箱',
  `user_addr` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '地址',
  `user_delete` int(2) DEFAULT '0' COMMENT '用户状态',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('2', 'user', '1111', '用户1', '男', '12345678900', '12345678900@139.com', '岭南师范学院本校区', '0');
INSERT INTO `user` VALUES ('3', '张三', '0000', '张三', '男', '12345678901', '12345678901@139.com', '岭南师范学院', '0');
INSERT INTO `user` VALUES ('6', 'zhangsan', '0000', '张三', '男', '12345678900', '12345678900@139.com', '12', '0');
INSERT INTO `user` VALUES ('10', 'YQ', 'abcabc', null, '男', null, '15768501236@139.com', null, '0');

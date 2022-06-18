/*
 Navicat MySQL Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 50515
 Source Host           : localhost:3306
 Source Schema         : user-povertyrelief

 Target Server Type    : MySQL
 Target Server Version : 50515
 File Encoding         : 65001

 Date: 22/03/2022 17:01:19
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `id` int(11) NOT NULL,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '登录用户名',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电话',
  `gender` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '性别',
  `age` int(11) NULL DEFAULT NULL COMMENT '年龄',
  `nickname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '昵称',
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像',
  PRIMARY KEY (`id`, `username`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '管理员' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES (1, 'admin', 'admin', NULL, '男', 21, '小王', 'https://wangjc-blog.oss-cn-beijing.aliyuncs.com/2022/03/10/337976ddd84141d1b3eb4ba6c1121f00fill_w570_h760_g0_mark_2021062714423028.jpeg');

-- ----------------------------
-- Table structure for donation
-- ----------------------------
DROP TABLE IF EXISTS `donation`;
CREATE TABLE `donation`  (
  `id` char(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品名称',
  `stock` int(11) NULL DEFAULT NULL COMMENT '库存',
  `detail` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '详情',
  `donate_user_id` char(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发布用户id',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '价格(使用贫困代码购买)',
  `cover` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'tupain',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '捐赠物' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of donation
-- ----------------------------
INSERT INTO `donation` VALUES ('1504773181163155458', '二手衣服', 10, '<div id=\"description\" class=\"J_DetailSection tshop-psm ke-post\">\r\n    \r\n    <div id=\"J_DivItemDesc\" class=\"content\"><div><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i3/2470208415/O1CN01N1wsGn2C27dGY6821_!!2470208415.gif\" style=\"max-width: 750.0px;\"><a name=\"hlg_list_3_47306657_start\"></a></div><table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"margin: 0.0px auto;border: 0;\">			<tbody><tr>			<td style=\"border: 0;\">			<div class=\"hlg_list_47306657\">			<div><img alt=\"自定义 20200906\" src=\"https://img.alicdn.com/imgextra/i1/2470208415/O1CN01vF4qjp2C27dUkOhwH_!!2470208415.jpg\" style=\"\" usemap=\"#hlgCustomMap_ifqiu8q_1646227329247\"><map name=\"hlgCustomMap_ifqiu8q_1646227329247\"><area coords=\"115,113,279,289\" href=\"https://item.taobao.com/item.htm?spm=a21dvs.23580594.0.0.52de3d0dPzp1BX&amp;ft=t&amp;id=669715814907\" shape=\"rect\"> <area coords=\"299,117,453,284\" href=\"https://item.taobao.com/item.htm?spm=a21dvs.23580594.0.0.52de3d0dPzp1BX&amp;ft=t&amp;id=669367449656\" shape=\"rect\"> <area coords=\"474,120,633,282\" href=\"https://item.taobao.com/item.htm?spm=a21dvs.23580594.0.0.52de3d0dPzp1BX&amp;ft=t&amp;id=669368277283\" shape=\"rect\"> <area coords=\"121,297,288,457\" href=\"https://item.taobao.com/item.htm?spm=a21dvs.23580594.0.0.52de3d0dPzp1BX&amp;ft=t&amp;id=668977076646\" shape=\"rect\"> <area coords=\"300,293,458,461\" href=\"https://item.taobao.com/item.htm?spm=a21dvs.23580594.0.0.52de3d0dPzp1BX&amp;ft=t&amp;id=670061743172\" shape=\"rect\"> <area coords=\"474,293,632,453\" href=\"https://item.taobao.com/item.htm?spm=a21dvs.23580594.0.0.52de3d0dPzp1BX&amp;ft=t&amp;id=669710154079\" shape=\"rect\"> <area coords=\"121,471,281,627\" href=\"https://item.taobao.com/item.htm?spm=a21dvs.23580594.0.0.52de3d0dPzp1BX&amp;ft=t&amp;id=669710714486\" shape=\"rect\"> <area coords=\"291,472,459,629\" href=\"https://item.taobao.com/item.htm?spm=a21dvs.23580594.0.0.52de3d0dPzp1BX&amp;ft=t&amp;id=668976712616\" shape=\"rect\"> <area coords=\"472,462,635,632\" href=\"https://item.taobao.com/item.htm?spm=a21dvs.23580594.0.0.52de3d0dPzp1BX&amp;ft=t&amp;id=669369065339\" shape=\"rect\"></map></div>			</div>			</td>		</tr>	</tbody></table><div><a name=\"hlg_list_3_47306657_end\"></a></div><div><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i3/2470208415/O1CN01lTqqRo2C27dd00tkg_!!2470208415.jpg\" style=\"max-width: 750.0px;\"><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i3/2470208415/O1CN01Gv2obM2C27dF6KXqE_!!2470208415.jpg\" style=\"max-width: 750.0px;\"><img align=\"absmiddle\" src=\"//img.alicdn.com/tps/i4/T10B2IXb4cXXcHmcPq-85-85.gif\" class=\"\" data-ks-lazyload=\"https://img.alicdn.com/imgextra/i4/2470208415/O1CN01sT1FQ62C27dKrmMyc_!!2470208415.jpg\" style=\"max-width: 750.0px;\" width=\"750\" height=\"612\"><img align=\"absmiddle\" src=\"//img.alicdn.com/tps/i4/T10B2IXb4cXXcHmcPq-85-85.gif\" class=\"\" data-ks-lazyload=\"https://img.alicdn.com/imgextra/i3/2470208415/O1CN01jPITCa2C27dOQfEfD_!!2470208415.jpg\" style=\"max-width: 750.0px;\" width=\"750\" height=\"380\"><a href=\"https://item.taobao.com/item.htm?spm=a21dvs.23580594.0.0.52de3d0d0TCtDe&amp;ft=t&amp;id=668032444853\"><img align=\"absmiddle\" src=\"//img.alicdn.com/tps/i4/T10B2IXb4cXXcHmcPq-85-85.gif\" class=\"\" data-ks-lazyload=\"https://img.alicdn.com/imgextra/i3/2470208415/O1CN01pzXh7A2C27dJO0BTu_!!2470208415.jpg\" style=\"max-width: 750.0px;\" width=\"259\" height=\"374\"></a><a href=\"https://item.taobao.com/item.htm?spm=a21dvs.23580594.0.0.52de3d0d0TCtDe&amp;ft=t&amp;id=667897088062\"><img align=\"absmiddle\" src=\"//img.alicdn.com/tps/i4/T10B2IXb4cXXcHmcPq-85-85.gif\" class=\"\" data-ks-lazyload=\"https://img.alicdn.com/imgextra/i2/2470208415/O1CN01AhA7no2C27dGY4Rp0_!!2470208415.jpg\" style=\"max-width: 750.0px;\" width=\"229\" height=\"374\"></a><a href=\"https://item.taobao.com/item.htm?spm=a21dvs.23580594.0.0.52de3d0d0TCtDe&amp;ft=t&amp;id=667897220406\"><img align=\"absmiddle\" src=\"//img.alicdn.com/tps/i4/T10B2IXb4cXXcHmcPq-85-85.gif\" class=\"\" data-ks-lazyload=\"https://img.alicdn.com/imgextra/i1/2470208415/O1CN010owOjV2C27d3tQZ2c_!!2470208415.jpg\" style=\"max-width: 750.0px;\" width=\"262\" height=\"374\"></a><a href=\"https://item.taobao.com/item.htm?spm=a21dvs.23580594.0.0.72ff3d0dxxVNH9&amp;ft=t&amp;id=668284745752\"><img align=\"absmiddle\" src=\"//img.alicdn.com/tps/i4/T10B2IXb4cXXcHmcPq-85-85.gif\" class=\"\" data-ks-lazyload=\"https://img.alicdn.com/imgextra/i3/2470208415/O1CN01v3rAus2C27dAw8ftx_!!2470208415.jpg\" style=\"max-width: 750.0px;\" width=\"750\" height=\"230\"></a><img align=\"absmiddle\" src=\"//img.alicdn.com/tps/i4/T10B2IXb4cXXcHmcPq-85-85.gif\" class=\"\" data-ks-lazyload=\"https://img.alicdn.com/imgextra/i2/2470208415/O1CN01wiVxEv2C27dHpMElM_!!2470208415.jpg\" style=\"max-width: 750.0px;\" width=\"750\" height=\"939\"><img align=\"absmiddle\" src=\"//img.alicdn.com/tps/i4/T10B2IXb4cXXcHmcPq-85-85.gif\" class=\"\" data-ks-lazyload=\"https://img.alicdn.com/imgextra/i2/2470208415/O1CN01fqavyY2C27dH89dc6_!!2470208415.jpg\" style=\"max-width: 750.0px;\" width=\"750\" height=\"844\"><img align=\"absmiddle\" src=\"//img.alicdn.com/tps/i4/T10B2IXb4cXXcHmcPq-85-85.gif\" class=\"\" data-ks-lazyload=\"https://img.alicdn.com/imgextra/i1/2470208415/O1CN01fVq8NU2C27dHpM6S2_!!2470208415.jpg\" style=\"max-width: 750.0px;\" width=\"750\" height=\"834\"><img align=\"absmiddle\" src=\"//img.alicdn.com/tps/i4/T10B2IXb4cXXcHmcPq-85-85.gif\" class=\"\" data-ks-lazyload=\"https://img.alicdn.com/imgextra/i2/2470208415/O1CN01ZXtUr42C27dAZL5vC_!!2470208415.jpg\" style=\"max-width: 750.0px;\" width=\"750\" height=\"872\"><img align=\"absmiddle\" src=\"//img.alicdn.com/tps/i4/T10B2IXb4cXXcHmcPq-85-85.gif\" class=\"\" data-ks-lazyload=\"https://img.alicdn.com/imgextra/i2/2470208415/O1CN01tgUq3c2C27dGBAtUG_!!2470208415.jpg\" style=\"max-width: 750.0px;\" width=\"750\" height=\"770\"><img align=\"absmiddle\" src=\"//img.alicdn.com/tps/i4/T10B2IXb4cXXcHmcPq-85-85.gif\" class=\"\" data-ks-lazyload=\"https://img.alicdn.com/imgextra/i2/2470208415/O1CN01i5o4oV2C27dDX2BOJ_!!2470208415.jpg\" style=\"max-width: 750.0px;\" width=\"750\" height=\"1169\"><img align=\"absmiddle\" src=\"//img.alicdn.com/tps/i4/T10B2IXb4cXXcHmcPq-85-85.gif\" class=\"\" data-ks-lazyload=\"https://img.alicdn.com/imgextra/i1/2470208415/O1CN01FyOFgT2C27dAZMIlZ_!!2470208415.jpg\" style=\"max-width: 750.0px;\" width=\"750\" height=\"817\"><img align=\"absmiddle\" src=\"//img.alicdn.com/tps/i4/T10B2IXb4cXXcHmcPq-85-85.gif\" class=\"\" data-ks-lazyload=\"https://img.alicdn.com/imgextra/i1/2470208415/O1CN01NIVJhn2C27dJ16tpn_!!2470208415.jpg\" style=\"max-width: 750.0px;\" width=\"750\" height=\"875\"><img align=\"absmiddle\" src=\"//img.alicdn.com/tps/i4/T10B2IXb4cXXcHmcPq-85-85.gif\" class=\"\" data-ks-lazyload=\"https://img.alicdn.com/imgextra/i3/2470208415/O1CN01JFCSgj2C27dHpLMhq_!!2470208415.jpg\" style=\"max-width: 750.0px;\" width=\"750\" height=\"883\"><img align=\"absmiddle\" src=\"//img.alicdn.com/tps/i4/T10B2IXb4cXXcHmcPq-85-85.gif\" class=\"\" data-ks-lazyload=\"https://img.alicdn.com/imgextra/i3/2470208415/O1CN01wx2xpn2C27dKqsRoA_!!2470208415.jpg\" style=\"max-width: 750.0px;\" width=\"750\" height=\"1118\"><img align=\"absmiddle\" src=\"//img.alicdn.com/tps/i4/T10B2IXb4cXXcHmcPq-85-85.gif\" class=\"\" data-ks-lazyload=\"https://img.alicdn.com/imgextra/i3/2470208415/O1CN01IA9QzS2C27d8Lx4fN_!!2470208415.jpg\" style=\"max-width: 750.0px;\" width=\"750\" height=\"836\"><img align=\"absmiddle\" src=\"//img.alicdn.com/tps/i4/T10B2IXb4cXXcHmcPq-85-85.gif\" class=\"\" data-ks-lazyload=\"https://img.alicdn.com/imgextra/i1/2470208415/O1CN01KfJdrR2C27dJivpWi_!!2470208415.jpg\" style=\"max-width: 750.0px;\" width=\"750\" height=\"872\"><img align=\"absmiddle\" src=\"//img.alicdn.com/tps/i4/T10B2IXb4cXXcHmcPq-85-85.gif\" class=\"\" data-ks-lazyload=\"https://img.alicdn.com/imgextra/i1/2470208415/O1CN01hOj1jQ2C27d8LwKwj_!!2470208415.jpg\" style=\"max-width: 750.0px;\" width=\"750\" height=\"914\"><img align=\"absmiddle\" src=\"//img.alicdn.com/tps/i4/T10B2IXb4cXXcHmcPq-85-85.gif\" class=\"\" data-ks-lazyload=\"https://img.alicdn.com/imgextra/i3/2470208415/O1CN01rQUrYu2C27dKquBuF_!!2470208415.jpg\" style=\"max-width: 750.0px;\" width=\"750\" height=\"837\"><img align=\"absmiddle\" src=\"//img.alicdn.com/tps/i4/T10B2IXb4cXXcHmcPq-85-85.gif\" class=\"\" data-ks-lazyload=\"https://img.alicdn.com/imgextra/i3/2470208415/O1CN01zInY0V2C27dGBCAVP_!!2470208415.jpg\" style=\"max-width: 750.0px;\" width=\"750\" height=\"770\"><img align=\"absmiddle\" src=\"//img.alicdn.com/tps/i4/T10B2IXb4cXXcHmcPq-85-85.gif\" class=\"\" data-ks-lazyload=\"https://img.alicdn.com/imgextra/i2/2470208415/O1CN01x6ROsM2C27dJ1974j_!!2470208415.jpg\" style=\"max-width: 750.0px;\" width=\"750\" height=\"812\"><img align=\"absmiddle\" src=\"//img.alicdn.com/tps/i4/T10B2IXb4cXXcHmcPq-85-85.gif\" class=\"\" data-ks-lazyload=\"https://img.alicdn.com/imgextra/i1/2470208415/O1CN011iEVyc2C27d8Lxbwi_!!2470208415.jpg\" style=\"max-width: 750.0px;\" width=\"750\" height=\"934\"><img align=\"absmiddle\" src=\"//img.alicdn.com/tps/i4/T10B2IXb4cXXcHmcPq-85-85.gif\" class=\"\" data-ks-lazyload=\"https://img.alicdn.com/imgextra/i1/2470208415/O1CN01usJdAP2C27dJiwQxy_!!2470208415.jpg\" style=\"max-width: 750.0px;\" width=\"750\" height=\"777\"><img align=\"absmiddle\" src=\"//img.alicdn.com/tps/i4/T10B2IXb4cXXcHmcPq-85-85.gif\" class=\"\" data-ks-lazyload=\"https://img.alicdn.com/imgextra/i2/2470208415/O1CN01A1E9132C27d9t1Xkz_!!2470208415.jpg\" style=\"max-width: 750.0px;\" width=\"750\" height=\"936\"><img align=\"absmiddle\" src=\"//img.alicdn.com/tps/i4/T10B2IXb4cXXcHmcPq-85-85.gif\" class=\"\" data-ks-lazyload=\"https://img.alicdn.com/imgextra/i1/2470208415/O1CN01mDKiRU2C27d9szSrT_!!2470208415.jpg\" style=\"max-width: 750.0px;\" width=\"750\" height=\"839\"><img align=\"absmiddle\" src=\"//img.alicdn.com/tps/i4/T10B2IXb4cXXcHmcPq-85-85.gif\" class=\"\" data-ks-lazyload=\"https://img.alicdn.com/imgextra/i2/2470208415/O1CN01jaqmrB2C27dDX3nB7_!!2470208415.jpg\" style=\"max-width: 750.0px;\" width=\"750\" height=\"760\"><img align=\"absmiddle\" src=\"//img.alicdn.com/tps/i4/T10B2IXb4cXXcHmcPq-85-85.gif\" class=\"\" data-ks-lazyload=\"https://img.alicdn.com/imgextra/i4/2470208415/O1CN01OvAh6d2C27dEUCLFE_!!2470208415.jpg\" style=\"max-width: 750.0px;\" width=\"750\" height=\"837\"><img align=\"absmiddle\" src=\"//img.alicdn.com/tps/i4/T10B2IXb4cXXcHmcPq-85-85.gif\" class=\"\" data-ks-lazyload=\"https://img.alicdn.com/imgextra/i4/2470208415/O1CN01xH4jis2C27d8LtaSG_!!2470208415.jpg\" style=\"max-width: 750.0px;\" width=\"750\" height=\"799\"><img align=\"absmiddle\" src=\"//img.alicdn.com/tps/i4/T10B2IXb4cXXcHmcPq-85-85.gif\" class=\"\" data-ks-lazyload=\"https://img.alicdn.com/imgextra/i4/2470208415/O1CN011xiuNO2C27dAZLA6t_!!2470208415.jpg\" style=\"max-width: 750.0px;\" width=\"750\" height=\"795\"></div><div><a name=\"hlg_list_4_41832058_start\"></a></div><table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"margin: 0.0px auto;border: 0;\">			<tbody><tr>			<td style=\"border: 0;\">			<div class=\"hlg_list_41832058\">			<div><img alt=\"自定义 20201118\" src=\"//img.alicdn.com/tps/i4/T10B2IXb4cXXcHmcPq-85-85.gif\" class=\"\" data-ks-lazyload=\"https://img.alicdn.com/imgextra/i4/2470208415/O1CN01Ozsjro2C27ZUnciwv_!!2470208415.jpg\" style=\"\" usemap=\"#hlgCustomMap_va98wo_1624871335038\" width=\"750\" height=\"872\"><map name=\"hlgCustomMap_va98wo_1624871335038\"></map></div>			</div>			</td>		</tr>	</tbody></table><div><a name=\"hlg_list_4_41832058_end\"></a></div><div class=\"hlg_rand_2040491267\" style=\"opacity: 0;height: 0;width: 0;\">247668584</div></div>\r\n</div>', NULL, 20.99, 'https://wangjc-blog.oss-cn-beijing.aliyuncs.com/2022/03/18/56c401c5e7144fa79b193e3116c45039fill_w570_h760_g0_mark_2021061314282789.jpg');
INSERT INTO `donation` VALUES ('1505706426767720450', 'test', 12, '<p>afdsdfsfasd&nbsp;</p>', NULL, 123.00, 'https://wangjc-blog.oss-cn-beijing.aliyuncs.com/2022/03/21/0f8250623e5442438e7bd1a399fafa8afill_w570_h760_g0_mark_2021032722174290.jpg');
INSERT INTO `donation` VALUES ('1505727644388507649', '二手衣物1123', 1012, '<p>细节展示&nbsp; &nbsp; ew&nbsp; &nbsp; &nbsp; &nbsp; df sdfa X&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>', NULL, 12222.89, 'https://wangjc-blog.oss-cn-beijing.aliyuncs.com/2022/03/21/23693a1895ba4363bdf91623aebe61eafill_w570_h760_g0_mark_2021032722254659.jpg');
INSERT INTO `donation` VALUES ('1505727669743075329', '二手衣物1123', 1012, '<p>细节展示&nbsp; &nbsp; ew&nbsp; &nbsp; &nbsp; &nbsp; df sdfa X&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>', NULL, 12222.89, 'https://wangjc-blog.oss-cn-beijing.aliyuncs.com/2022/03/21/23693a1895ba4363bdf91623aebe61eafill_w570_h760_g0_mark_2021032722254659.jpg');
INSERT INTO `donation` VALUES ('1505820290695962625', '捐赠物品测试', 100, '<h1 id=\"3wgsd\"><u>test</u></h1>', NULL, 89.99, 'https://wangjc-blog.oss-cn-beijing.aliyuncs.com/2022/03/21/5ae209ac747442d2bbb8aec5ff763fc8fill_w570_h760_g0_mark_2021062217022042.jpeg');

-- ----------------------------
-- Table structure for donation_id
-- ----------------------------
DROP TABLE IF EXISTS `donation_id`;
CREATE TABLE `donation_id`  (
  `id` char(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` char(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '购买用户id',
  `donation_id` char(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '捐赠物id',
  `copies` int(11) NULL DEFAULT NULL COMMENT '分数',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '价格',
  `total_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '总价',
  `people_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收货地址',
  `people_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收货人姓名',
  `people_tel` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收货人电话',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '捐赠物订单' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of donation_id
-- ----------------------------

-- ----------------------------
-- Table structure for donation_order
-- ----------------------------
DROP TABLE IF EXISTS `donation_order`;
CREATE TABLE `donation_order`  (
  `id` char(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` char(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '购买用户id',
  `donation_id` char(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '捐赠id',
  `copies` int(11) NULL DEFAULT NULL COMMENT '分数',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '价格',
  `total_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '总价',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收货地址',
  `people_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收货地址',
  `people_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收货人姓名',
  `people_tel` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收货人电话',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '购物订单' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of donation_order
-- ----------------------------
INSERT INTO `donation_order` VALUES ('1504331269419552770', '1101', '1504331103752933377', 1, 12.56, 12.56, NULL, ' 爱的色放', '范德萨', '啊手动阀', '名称');
INSERT INTO `donation_order` VALUES ('1504332945857699841', '1101', '14541', 1, 12.89, 12.89, NULL, '啊手动阀矮得', '123', '123是的方法都是', '二手衣物');
INSERT INTO `donation_order` VALUES ('1504774084989530114', '1504772344344981506', '1504773181163155458', 3, 20.99, 62.97, NULL, '湖北省武汉市xx区xx小区xx街道xx号', '李四', '18989890101', '二手衣服');
INSERT INTO `donation_order` VALUES ('212676098', '1101', '11', 1, 12.89, 12.89, NULL, '22222', '123', '123', NULL);

-- ----------------------------
-- Table structure for panel
-- ----------------------------
DROP TABLE IF EXISTS `panel`;
CREATE TABLE `panel`  (
  `id` char(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cover` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '封面',
  `detail` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '详情',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `admin_id` char(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发布管理员id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '政策展板' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of panel
-- ----------------------------
INSERT INTO `panel` VALUES ('1', '王忠林主持省推进“一带一路”建设工作领导小组工作大会', 'https://rb.gywb.cn/epaper/gyrb/res/2021-04/29/A04/gyrb5382699b002@600_400.jpg', '<div class=\"hbgov-article-content\" bfdi=\"92\">\n				\n					\n				\n				<div class=\"view TRS_UEDITOR trs_paper_default trs_web\" bfdi=\"93\"><p style=\"text-indent: 2em; text-align: center; font-size: 1.125rem;\" bfdi=\"94\"><strong bfdi=\"95\">王忠林主持省推进“一带一路”建设工作领导小组会议强调</strong></p><p style=\"text-indent: 2em; text-align: center; font-size: 1.125rem;\" bfdi=\"96\"><strong bfdi=\"97\">服务融入新发展格局 深度参与“一带一路”建设</strong></p><p style=\"text-indent: 2em; text-align: center; font-size: 1.125rem;\" bfdi=\"98\"><strong bfdi=\"99\">打造高水平对外开放“新沿海”</strong></p><p style=\"text-indent: 2em; text-align: left; font-size: 1.125rem;\" bfdi=\"100\">3月17日下午，省推进“一带一路”建设工作领导小组召开会议，总结2021年工作，部署今年重点工作。省委副书记、省长、领导小组组长王忠林主持会议并强调，要深入学习贯彻习近平总书记在第三次“一带一路”建设座谈会上的重要讲话精神，落实省委工作要求，积极服务和融入新发展格局，全力打造高水平对外开放“新沿海”，为共建“一带一路”高质量发展作出湖北贡献。</p><p style=\"text-indent: 2em; text-align: left; font-size: 1.125rem;\" bfdi=\"101\">会议指出，近年来，我省认真落实党中央决策部署，积极参与“一带一路”建设，加快对外开放步伐，取得显著成效。同时，也存在开放的意识不够强、载体不够优、通道不够多、机制不够活等短板问题。要站位全局、把握大势，保持清醒、奋发作为，以更强决心、更大力度推动参与共建“一带一路”走深走实。</p><p style=\"text-indent: 2em; text-align: left; font-size: 1.125rem;\" bfdi=\"102\">会议强调，湖北参与共建“一带一路”，既面临巩固成果、稳步推进的压力，也面临加快突破、缩差补短的压力。要充分发挥我省区位、科教、产业等优势，聚焦发力、精准施策，以更实举措推动参与共建“一带一路”全面提速。要<strong bfdi=\"103\">全力畅通中部陆海空国际大通道</strong>，加速提升综合交通枢纽能级、打造多元立体通道网络、提高综合运输服务水平，加快建设新时代“祖国立交桥”；<strong bfdi=\"104\">全力推动开放型经济突破性发展</strong>，抓住RCEP生效实施机遇，出台用好配套政策措施，加大“引进来”“走出去”力度，千方百计增强外贸发展功能、构建口岸经济体系、提升利用外资质效；<strong bfdi=\"105\">全力提升对外开放服务水平</strong>，打造一流营商环境，推动创新驱动型国际合作，用好国际金融市场，创优对外交流合作机制；<strong bfdi=\"106\">全力支持外向型企业发展，</strong>在培育壮大、服务保障、引导规范上狠下功夫，增强湖北企业海外竞争力；<strong bfdi=\"107\">全力加强风险防控</strong>，健全风险防控机制，强化安全防护措施，防范跨国跨境腐败风险，切实保障境外项目、资产、人员安全。</p><p style=\"text-indent: 2em; text-align: left; font-size: 1.125rem;\" bfdi=\"108\">会议强调，参与共建“一带一路”是一项系统性工程，领导小组要发挥统筹协调、牵头抓总作用，各成员单位要分工协作、密切配合，<strong bfdi=\"109\">强化责任落实、督导考核、舆论宣传</strong>，保持“拼抢实”的状态和作风，谋定快动、善作善成，以更硬作风推动参与共建“一带一路”见功见效。</p><p style=\"text-indent: 2em; text-align: left; font-size: 1.125rem;\" bfdi=\"110\">副省长、领导小组副组长赵海山出席会议。<span style=\"text-indent: 32px;\" bfdi=\"111\">（<span style=\"text-indent: 32px;\" bfdi=\"112\">湖北日报</span>记者杨念明）</span></p><p style=\"text-indent: 2em; text-align: right; font-size: 1.125rem;\" bfdi=\"113\">编辑：朱习芳</p><p style=\"text-indent: 2em; text-align: right; font-size: 1.125rem;\" bfdi=\"114\">责编：蔡佳圆</p><p style=\"text-indent: 2em; text-align: right; font-size: 1.125rem;\" bfdi=\"115\">--审核：敬  冉</p></div>\n				\n				\n				<div class=\"hbgov-att-list-block\" bfdi=\"116\">\n					<ul bfdi=\"117\">\n						\n						 \n					</ul>\n				</div>\n			</div>', '2022-04-08 19:38:00', '1101');
INSERT INTO `panel` VALUES ('1505819853020340225', '湖北省疫情防控部署', 'https://wangjc-blog.oss-cn-beijing.aliyuncs.com/2022/03/21/23bfc9cd0b6c47b69e854bd66a4d6a322021032923383734.jpeg', '<h1 id=\"su2ir\"><u style=\"background-color: rgb(194, 79, 74);\">湖北省疫情防控部署</u></h1>', '2022-03-21 16:13:24', NULL);
INSERT INTO `panel` VALUES ('2', '省委全面深化改革委员会会议举行', 'https://tse1-mm.cn.bing.net/th/id/R-C.20ae70d7323586aa133823d100062e1d?rik=a2wfDUfNlfX2EA&riu=http%3a%2f%2fedu.eastday.com%2fimages%2fthumbnailimg%2fmonth_2104%2f20210419032955120.jpg&ehk=ouXlbRvL122B%2ffjrzJj6px1QGvA7BUUK2bc7ddV%2bjJo%3d&risl=&pid=ImgRaw&r=0&sres=1&sresct=1', '<div class=\"hbgov-article-content\" bfdi=\"92\">\n				\n					\n				\n				<div class=\"view TRS_UEDITOR trs_paper_default trs_web\" bfdi=\"93\"><p style=\"text-indent: 2em; font-size: 1.125rem; text-align: center;\" bfdi=\"94\"><strong bfdi=\"95\"><span data-index=\"16\" style=\"font-size: 18px;\" bfdi=\"96\">省委全面深化改革委员会会议举行</span></strong></p><p style=\"text-indent: 2em; font-size: 1.125rem; text-align: center;\" bfdi=\"97\"><strong bfdi=\"98\"><span data-index=\"16\" style=\"font-size: 18px;\" bfdi=\"99\">强化执法司法监督提升人民群众满意度获得感</span></strong></p><p style=\"text-indent: 2em; font-size: 1.125rem; text-align: center;\" bfdi=\"100\"><strong bfdi=\"101\"><span data-index=\"16\" style=\"font-size: 18px;\" bfdi=\"102\">深化省属国资国企改革加快建立现代企业制度</span></strong></p><p style=\"text-indent: 2em; font-size: 1.125rem; text-align: center;\" bfdi=\"103\"><strong bfdi=\"104\"><span data-index=\"16\" style=\"font-size: 18px;\" bfdi=\"105\">应勇主持并讲话 王忠林李荣灿等出席</span></strong></p><p style=\"text-indent: 2em; font-size: 1.125rem;\" bfdi=\"106\">3月16日，省委全面深化改革委员会召开第十二次会议，深入学习贯彻中央全面深化改革委员会有关会议精神，总结2021年我省改革工作，部署2022年工作。省委书记、省委深改委主任应勇主持会议并强调，要深入学习贯彻习近平总书记关于全面深化改革的重要论述，紧紧围绕党中央决策部署和全省高质量发展大局谋划推进改革工作，蹄疾步稳、纵深推进关键领域和重大环节改革取得新成效，为湖北加快“建成支点、走在前列、谱写新篇”提供强劲动力。</p><p style=\"text-indent: 2em; font-size: 1.125rem;\" bfdi=\"107\">省委副书记、省长、省委深改委副主任王忠林，省委副书记、省委深改委副主任李荣灿，省政协党组书记、主席孙伟，省人大常委会党组书记、常务副主任王玲出席会议。</p><p style=\"text-indent: 2em; font-size: 1.125rem;\" bfdi=\"108\">会议审议了《省委深改委2021年工作总结报告》《省委深改委2022年工作要点》《2022年度重大改革项目论证报告》《进一步规范落实中央深改委会议精神工作细则（试行）》和《湖北省贯彻落实〈关于加强政法领域执法司法制约监督制度机制建设的意见〉责任分工清单》等文件，讨论研究深化省属国资国企改革。</p><p style=\"text-indent: 2em; font-size: 1.125rem;\" bfdi=\"109\">会议指出，过去一年，在以习近平同志为核心的党中央坚强领导下，<strong bfdi=\"110\"><span data-index=\"16\" style=\"font-size: 18px;\" bfdi=\"111\">我省统筹疫情防控和经济社会发展，取得了疫后重振决定性成果。</span></strong>省委深改委认真贯彻落实党中央改革决策部署，<strong bfdi=\"112\"><span data-index=\"16\" style=\"font-size: 18px;\" bfdi=\"113\">推动重点领域改革实现重大突破，</span></strong><strong bfdi=\"114\"><span data-index=\"16\" style=\"font-size: 18px;\" bfdi=\"115\">各项改革工作取得新进展。</span></strong>今年是党的二十大召开之年，我省也将召开省第十二次党代会。<strong bfdi=\"116\"><span data-index=\"16\" style=\"font-size: 18px;\" bfdi=\"117\">要坚持和加强党对改革工作的全面领导，</span></strong>坚持“两个确立”，做到“两个维护”，不折不扣推动党中央改革决策部署在湖北落地见效。<strong bfdi=\"118\"><span data-index=\"16\" style=\"font-size: 18px;\" bfdi=\"119\">要深入总结我省全面深化改革新成效新经验，</span></strong>研究谋划未来一个时期我省全面深化改革的重点任务、思路举措，推动改革更好服务国家战略和全省发展大局。<strong bfdi=\"120\"><span data-index=\"16\" style=\"font-size: 18px;\" bfdi=\"121\">要切实提升改革综合效能，</span></strong>注重全局性、防止碎片化，注重系统集成和协同高效，注重顶层设计与探索创新。<strong bfdi=\"122\"><span data-index=\"16\" style=\"font-size: 18px;\" bfdi=\"123\">要坚持目标导向、问题导向、结果导向，</span></strong>加强跟踪问效，确保改革任务落实落地。</p><p style=\"text-indent: 2em; font-size: 1.125rem;\" bfdi=\"124\">会议强调，<strong bfdi=\"125\"><span data-index=\"16\" style=\"font-size: 18px;\" bfdi=\"126\">要深入贯彻习近平法治思想，把坚持“两个确立”、做到“两个维护”作为推进政法领域改革的根本要求，</span></strong>不断完善党领导政法工作的体制机制。<strong bfdi=\"127\"><span data-index=\"16\" style=\"font-size: 18px;\" bfdi=\"128\">要坚持以人民为中心的发展思想，深化执法司法制约监督改革，</span></strong>巩固拓展政法队伍教育整顿成果，切实解决执法司法突出问题，不断提高执法司法公信力和群众满意度，努力让人民群众在每一起案件办理、每一件事情处理中都能感受到公平正义。<strong bfdi=\"129\"><span data-index=\"16\" style=\"font-size: 18px;\" bfdi=\"130\">要切实加强政法机关内部系统完备的监督制约体系建设；</span></strong>健全政法机关相互制约的体制机制，加强检察机关法律监督工作；强化纪律监督、监察监督和人大监督，完善群众监督、舆论监督机制。<strong bfdi=\"131\"><span data-index=\"16\" style=\"font-size: 18px;\" bfdi=\"132\">全省各政法机关党委（党组）要履行主体责任，</span></strong>相关部门协同推进，确保取得改革实效。</p><p style=\"text-indent: 2em; font-size: 1.125rem;\" bfdi=\"133\">会议指出，<strong bfdi=\"134\"><span data-index=\"16\" style=\"font-size: 18px;\" bfdi=\"135\">深入推进省属国资国企改革，突出主业主责、注重国企功能、聚焦创新发展，任重道远。</span><span data-index=\"16\" style=\"font-size: 18px;\" bfdi=\"136\">要锚定企业主攻方向，</span></strong>切实增强国企活力、竞争力，提高企业效率和效益。<strong bfdi=\"137\"><span data-index=\"16\" style=\"font-size: 18px;\" bfdi=\"138\">要加快建立现代企业制度，</span></strong>深化市场化重组整合，切实打破企业内部“坛坛罐罐”。<strong bfdi=\"139\"><span data-index=\"16\" style=\"font-size: 18px;\" bfdi=\"140\">要坚持管好国资、少管企业、不干预经营，</span></strong>健全完善国资国企内控制度，加强风险防范，确保国有资本安全，实现保值增值。<strong bfdi=\"141\"><span data-index=\"16\" style=\"font-size: 18px;\" bfdi=\"142\">要淡化“管理”思想、强化“服务”意识，</span></strong>多用改革的办法和市场化手段解决问题，让国企成为真正的市场主体，放开手脚创新发展。</p><p style=\"text-indent: 2em; font-size: 1.125rem;\" bfdi=\"143\">省委全面深化改革委员会委员参加会议。<span style=\"font-size: 18px;text-indent: 36px;\" bfdi=\"144\">（黄俊华、王馨）</span></p><p style=\"text-indent: 2em; font-size: 1.125rem; text-align: right;\" bfdi=\"145\"><span style=\"font-size: 18px;text-indent: 36px;\" bfdi=\"146\">编辑：胡芳华</span></p><p style=\"text-indent: 2em; font-size: 1.125rem; text-align: right;\" bfdi=\"147\"><span style=\"font-size: 18px;text-indent: 36px;\" bfdi=\"148\">责编：蔡佳圆</span></p><p style=\"text-indent: 2em; font-size: 1.125rem; text-align: right;\" bfdi=\"149\"><span style=\"font-size: 18px;text-indent: 36px;\" bfdi=\"150\">审核：敬  冉</span></p></div>\n				\n				\n				<div class=\"hbgov-att-list-block\" bfdi=\"151\">\n					<ul bfdi=\"152\">\n						\n						 \n					</ul>\n				</div>\n			</div>', '2022-04-08 19:38:00', '1101');
INSERT INTO `panel` VALUES ('21234', '今年政策好啊', 'https://secondhand-liaoke.oss-cn-hangzhou.aliyuncs.com/images/2/2022/03/EZmsMzkUKwARKfUGWrosZ59TGg5oOv.jpg', '今年政策是真的好', '2022-04-08 19:38:00', '1101');
INSERT INTO `panel` VALUES ('213', '今年政策好啊', 'https://secondhand-liaoke.oss-cn-hangzhou.aliyuncs.com/images/2/2022/03/EZmsMzkUKwARKfUGWrosZ59TGg5oOv.jpg', '今年政策是真的好', '2022-04-08 19:38:00', '1101');
INSERT INTO `panel` VALUES ('217', '今年政策好啊', 'https://secondhand-liaoke.oss-cn-hangzhou.aliyuncs.com/images/2/2022/03/EZmsMzkUKwARKfUGWrosZ59TGg5oOv.jpg', '今年政策是真的好', '2022-04-08 19:38:00', '1101');
INSERT INTO `panel` VALUES ('21776', '今年政策好啊', 'https://secondhand-liaoke.oss-cn-hangzhou.aliyuncs.com/images/2/2022/03/EZmsMzkUKwARKfUGWrosZ59TGg5oOv.jpg', '今年政策是真的好', '2022-04-08 19:38:00', '1101');
INSERT INTO `panel` VALUES ('217760', '今年政策好啊', 'https://secondhand-liaoke.oss-cn-hangzhou.aliyuncs.com/images/2/2022/03/EZmsMzkUKwARKfUGWrosZ59TGg5oOv.jpg', '今年政策是真的好', '2022-04-08 19:38:00', '1101');
INSERT INTO `panel` VALUES ('2177609', '今年政策好啊', 'https://secondhand-liaoke.oss-cn-hangzhou.aliyuncs.com/images/2/2022/03/EZmsMzkUKwARKfUGWrosZ59TGg5oOv.jpg', '今年政策是真的好', '2022-04-08 19:38:00', '1101');
INSERT INTO `panel` VALUES ('21776097', '今年政策好啊', 'https://secondhand-liaoke.oss-cn-hangzhou.aliyuncs.com/images/2/2022/03/EZmsMzkUKwARKfUGWrosZ59TGg5oOv.jpg', '今年政策是真的好', '2022-04-08 19:38:00', '1101');

-- ----------------------------
-- Table structure for point_subsidize
-- ----------------------------
DROP TABLE IF EXISTS `point_subsidize`;
CREATE TABLE `point_subsidize`  (
  `id` char(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `subsidize_id` char(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '资助人用户id',
  `user_id` char(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '被资助人用户id',
  `create_time` datetime NULL DEFAULT NULL COMMENT '资助关系成立时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '点对点资助' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of point_subsidize
-- ----------------------------
INSERT INTO `point_subsidize` VALUES ('1504653791440560129', '1101', '', '2022-03-18 10:59:53');
INSERT INTO `point_subsidize` VALUES ('1504653837670178818', '1101', '28', '2022-03-18 11:00:04');
INSERT INTO `point_subsidize` VALUES ('1504656283855470593', '1101', '', '2022-03-18 11:09:47');
INSERT INTO `point_subsidize` VALUES ('1504656440789557250', '1101', '1101', '2022-03-18 11:10:24');
INSERT INTO `point_subsidize` VALUES ('1504771129909424130', '1504771038754615298', '1504770392697581569', '2022-03-18 18:46:09');
INSERT INTO `point_subsidize` VALUES ('1504772939437027330', '1504772860235984898', '1504772344344981506', '2022-03-18 18:53:20');
INSERT INTO `point_subsidize` VALUES ('1506149063035342850', '1505481412843917314', '1505482126466994178', '2022-03-22 14:01:33');

-- ----------------------------
-- Table structure for poverty_apply
-- ----------------------------
DROP TABLE IF EXISTS `poverty_apply`;
CREATE TABLE `poverty_apply`  (
  `id` char(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` char(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `real_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `id_card` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `detail` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `picture` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `is_audit` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否通过',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of poverty_apply
-- ----------------------------
INSERT INTO `poverty_apply` VALUES ('1506153933511503874', '1505481412843917314', '123', '123', '123', '<p>sdfsdafdfadsdsffadssadf</p>', 'https://wangjc-blog.oss-cn-beijing.aliyuncs.com/2022/03/22/fd095ec187b445bcaf6291af200168f3fill_w570_h760_g0_mark_2021032722254659.jpg', '是');
INSERT INTO `poverty_apply` VALUES ('1506180514950868993', '1506180088947994625', '张三', '1988911101029910', '湖北省武汉市', '<p>阀手动</p>', 'https://wangjc-blog.oss-cn-beijing.aliyuncs.com/2022/03/22/a905603455ce4532ad470435f3d0b460fill_w570_h760_g0_mark_20210625143503100.jpeg', '是');

-- ----------------------------
-- Table structure for poverty_user
-- ----------------------------
DROP TABLE IF EXISTS `poverty_user`;
CREATE TABLE `poverty_user`  (
  `id` char(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` char(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户id',
  `picture` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '认证本人图片',
  `info` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '认证信息',
  `level` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '认证等级',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '贫困户' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of poverty_user
-- ----------------------------
INSERT INTO `poverty_user` VALUES ('1505810166115934209', '1505482126466994178', 'https://wangjc-blog.oss-cn-beijing.aliyuncs.com/2022/03/21/95b623a25093486f98907c25aab2c945fill_w570_h760_g0_mark_202110061351458.jpg', NULL, NULL);
INSERT INTO `poverty_user` VALUES ('1506155477506101249', '1505481412843917314', 'https://wangjc-blog.oss-cn-beijing.aliyuncs.com/2022/03/22/fd095ec187b445bcaf6291af200168f3fill_w570_h760_g0_mark_2021032722254659.jpg', NULL, NULL);
INSERT INTO `poverty_user` VALUES ('1506180619686834178', '1506180088947994625', 'https://wangjc-blog.oss-cn-beijing.aliyuncs.com/2022/03/22/a905603455ce4532ad470435f3d0b460fill_w570_h760_g0_mark_20210625143503100.jpeg', NULL, NULL);

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product`  (
  `id` char(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品名称',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '价格',
  `stock` int(11) NULL DEFAULT NULL COMMENT '库存',
  `detail` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '详情',
  `release_user_id` char(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发布用户id',
  `cover` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '封面',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('131', '二手衣物', 10.00, 1097, '1', '12.89', 'https://youthtoday.oss-cn-beijing.aliyuncs.com/images/2021/06/14/16236330077178468.jpg');
INSERT INTO `product` VALUES ('1331', '二手衣物', 10.00, 1, '1', '12.89', 'https://youthtoday.oss-cn-beijing.aliyuncs.com/images/2021/06/14/16236330077178468.jpg');
INSERT INTO `product` VALUES ('13321', '二手衣物', 10.00, 0, '1', '12.89', 'https://youthtoday.oss-cn-beijing.aliyuncs.com/images/2021/06/14/16236330077178468.jpg');
INSERT INTO `product` VALUES ('133211', '二手衣物', 10.00, 0, '1', '12.89', 'https://youthtoday.oss-cn-beijing.aliyuncs.com/images/2021/06/14/16236330077178468.jpg');
INSERT INTO `product` VALUES ('1361', '二手衣物', 10.00, 0, '1', '12.89', 'https://youthtoday.oss-cn-beijing.aliyuncs.com/images/2021/06/14/16236330077178468.jpg');
INSERT INTO `product` VALUES ('1505734918200762369', '123', 222.00, 122, '', '22222', 'https://wangjc-blog.oss-cn-beijing.aliyuncs.com/2022/03/21/bdf77c24d46e48f88372eb5bd3794a8cfill_w570_h760_g0_mark_2021032722304184.jpg');

-- ----------------------------
-- Table structure for product_order
-- ----------------------------
DROP TABLE IF EXISTS `product_order`;
CREATE TABLE `product_order`  (
  `id` char(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` char(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '购买用户id',
  `product_id` char(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品id',
  `copies` int(11) NULL DEFAULT NULL COMMENT '分数',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '价格',
  `total_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '总价',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收货地址',
  `people_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收货地址',
  `people_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收货人姓名',
  `people_tel` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收货人电话',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '购物订单' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of product_order
-- ----------------------------
INSERT INTO `product_order` VALUES ('1504610060586876929', '1101', '1504363157525884930', 7, 14.50, 101.50, NULL, '北京市东城区1101', '张三', '14040989840', 'test');
INSERT INTO `product_order` VALUES ('1506138586926510082', '1505482126466994178', '1505734918200762369', 1, 222.00, 222.00, NULL, 'qwerqwe', 'ewrq', 'qwer', '123');

-- ----------------------------
-- Table structure for student_loan
-- ----------------------------
DROP TABLE IF EXISTS `student_loan`;
CREATE TABLE `student_loan`  (
  `id` char(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cover` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '封面',
  `detail` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '详情',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `admin_id` char(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发布管理员id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '助学贷款' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of student_loan
-- ----------------------------
INSERT INTO `student_loan` VALUES ('1', '2021湖北大学生助学贷款申请流程（网上或现场办理）', 'https://secondhand-liaoke.oss-cn-hangzhou.aliyuncs.com/images/2/2022/03/EZmsMzkUKwARKfUGWrosZ59TGg5oOv.jpg', '<div class=\"content\" id=\"bo\"><!--top--><!--content--><h1>　　<strong><span style=\"background-color:#FFE500;\" id=\"d9cuw\">2021湖北大学生申请助学贷款指南（网上或现场办理）</span></strong></h1><p>　　湖北大学生生源地助学贷款分为初次办理（新贷）和续贷（此前已经办理过，要进行续贷），两者申请流程不一样。</p><p>　　<strong><span style=\"color:#E53333;\">（一）在校生续贷</span>（2021年以前年度获得贷款、继续申请贷款的学生）</strong></p><p>　　续贷学生均可以采取远程方式办理，无法通过远程办理的可到现场办理。</p><p>　　<strong><span style=\"color:#003399;\">1.续贷远程办理</span></strong></p><p>　　（1）远程办理需满足：以前年度办理贷款电子合同；借款学生本人办理；借款学生关键信息不得变更；自备安装支付宝APP的手机。</p><p>　　（2）网上申请：登录国家开发银行生源地信用助学贷款信息系统（https://sls.cdb.com.cn/），更新个人及共同借款人相关信息，点击“申请贷款”，提交本人续贷声明。</p><p>　　（3）身份认证：选择“线上签订合同”。学生需同意《国家开发银行生源地助学贷款续贷远程受理协议书》。确认系统生成合同信息后，用支付宝手机APP扫描系统弹出的身份证二维码，通过人脸识别进行身份认证。</p><p>　　（4）完成申请：身份认证成功后，回到在线服务系统，点击“我已完成身份认证，点击查询”，完成在线申请办理，等待资助中心审核，接收回执验证短信。</p><p>　　<strong>借款学生远程提交续贷申请后，5个工作日内等待资助中心进行审查确认，接收回执验证短信（如超过5个工作日，或者至返校前仍然未收到受理证明信息，可以联系资助中心咨询）。学生到高校报到时，借款学生可以持合同回执验证短信，或者纸质受理证明（自行登录在线服务系统下载打印）进行回执确认。</strong></p><p>　　<strong><span style=\"color:#003399;\">2.续贷现场办理</span></strong></p><p>　　（1）网上申请：登录国家开发银行生源地信用助学贷款信息系统（https://sls.cdb.com.cn/），更新个人及共同借款人相关信息，再提出续贷申请。按照系统提示填写续贷声明后，打印《申请表》并签字。</p><p>　　（2）材料准备：借款学生或共同借款人签字的《申请表》原件1份（无需加盖公章）和办理人身份证原件1份。</p><p>　　（3）现场办理：借款学生或共同借款人的任何一方携带本人身份证原件、《申请表》前往贷款办理现场。经审核同意后由县级资助中心经办人指导到场一方（借款学生或共同借款人）使用手写板签订电子合同并分别签署借款学生和共同借款人姓名，需在代签处注明代签人。打印借款合同副本和《受理证明》（附有“校验码”）交给学生。&nbsp;</p><p>　　<strong><span style=\"color:#E53333;\">（二）新贷（以前年度未获得过生源地信用助学贷款的学生）</span></strong></p><p>　　<strong>1.网上申请：</strong>登录国家开发银行生源地信用助学贷款信息系统（https://sls.cdb.com.cn/），完成注册并填写个人及共同借款人基本信息，提交贷款申请后从系统内导出打印《申请表》（未进行预申请的学生在系统内导出《申请表》和《家庭经济困难学生认定表》）。</p><p>　　<strong>2.材料准备：</strong></p><p>　　（1）已通过预申请的：借款学生本人签字的《申请表》原件1份；录取通知书（在校生为学生证）原件（如在校生学生证遗失，可用《教育部学籍在线验证报告》代替）；借款学生及共同借款人双方身份证原件，户口簿原件。</p><p>　　（2）没办理预申请的：借款学生本人签字的《申请表》原件1份、《家庭经济困难学生认定表》原件1份；录取通知书（在校生为学生证）原件（如在校生学生证遗失，可用《教育部学籍在线验证报告》代替）；借款学生及共同借款人双方身份证原件，户口簿原件。</p><p>　　<strong>3、现场办理：</strong>借款学生及共同借款人双方携申请材料共同到学生资助中心办理。经现场审核同意后，由经办人指导借款学生和共同借款人使用手写板签订电子合同，并打印合同副本和《受理证明》（附有“校验码”）交给学生。借款学生及共同借款人必须在借款合同上签字，严禁由其他人代替借款学生或共同借款人签订借款合同。</p><p>　　<strong>所有借款学生（包括新贷和续贷学生）在现场办理贷款时所签电子合同为预签贷款合同。预签合同未经国家开发银行湖北省分行最终审批同意，不能获得贷款。</strong></p><div id=\"adInArticle\"><div><p font-style:normal;font-variant:normal;font-weight:400;letter-spacing:normal;orphans:2;text-align:start;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;-webkit-text-stroke-width:0px;text-decoration-style:initial;text-decoration-color:initial;\"=\"\">温馨提示：微信搜索公众号武汉本地宝，关注后在对话框回复【助学】可获湖北大学生生源地助学贷款线上/线下办理方式及时间、申请条件及流程、所需材料。</p><p font-style:normal;font-variant:normal;font-weight:400;letter-spacing:normal;orphans:2;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;-webkit-text-stroke-width:0px;text-decoration-style:initial;text-decoration-color:initial;text-align:center;\"=\"\" align=\"center\"><img src=\"http://imgbdb3.bendibao.com/dazheimg/202111/12/20211112162410_21535.png\"/></p></div></div><div class=\"ad-in-article a-2\"><!--\n<div style=\"width:760px;height:100px;float:left;margin: 14px 0;\">\n<script type=\"text/javascript\" src=\"http://d.s11.cn/x7dry1fhrn.js\"></script>\n</div>\n---></div><!--bottom--><script>var newNode = document.createElement(\"div\");newNode.innerHTML =document.getElementById(\"add_ewm_content\").innerHTML ;document.getElementById(\"add_ewm_content\").remove();document.getElementById(\"adInArticle\").insertBefore(newNode,document.getElementById(\"adInArticle\").firstChild);</script><!--mobile--><p class=\"view_city_index\"><a style=\"background:none;\" href=\"http://m.wh.bendibao.com/edu/129283.shtm\" target=\"_blank\">手机访问</a>&nbsp;<a href=\"http://wh.bendibao.com\" target=\"_blank\">武汉本地宝首页</a></p><div id=\"sclear\" style=\"clear:both;\"></div></div>', '2022-04-08 19:38:00', '1101');
INSERT INTO `student_loan` VALUES ('2', '2021湖北生源地助学贷款申请流程（新贷+续贷）', 'https://secondhand-liaoke.oss-cn-hangzhou.aliyuncs.com/images/2/2022/03/EZmsMzkUKwARKfUGWrosZ59TGg5oOv.jpg', '<div class=\"content\" id=\"bo\"><!--top--><!--content--><p style=\"text-align:center;\"><img src=\"http://imgbdb3.bendibao.com/whbdb/edu/20208/06/2020806100330_90590.png\" width=\"600\" height=\"276\"/></p><h1>　　<strong><span style=\"background-color:#FFE500;\" id=\"dj9of\">2021湖北生源地助学贷款申请流程</span></strong></h1><p>　　湖北大学生生源地助学贷款分为初次办理（新贷）和续贷（此前已经办理过，要进行续贷），两者申请流程不一样。</p><p>　　<strong><span style=\"color:#E53333;\">（一）在校生续贷</span>（2021年以前年度获得贷款、继续申请贷款的学生）</strong></p><p>　　续贷学生均可以采取远程方式办理，无法通过远程办理的可到现场办理。</p><p>　　<strong><span style=\"color:#003399;\">1.续贷远程办理</span></strong></p><p>　　（1）远程办理需满足：以前年度办理贷款电子合同；借款学生本人办理；借款学生关键信息不得变更；自备安装支付宝APP的手机。</p><p>　　（2）网上申请：登录国家开发银行生源地信用助学贷款信息系统（https://sls.cdb.com.cn/），更新个人及共同借款人相关信息，点击“申请贷款”，提交本人续贷声明。</p><p>　　（3）身份认证：选择“线上签订合同”。学生需同意《国家开发银行生源地助学贷款续贷远程受理协议书》。确认系统生成合同信息后，用支付宝手机APP扫描系统弹出的身份证二维码，通过人脸识别进行身份认证。</p><p>　　（4）完成申请：身份认证成功后，回到在线服务系统，点击“我已完成身份认证，点击查询”，完成在线申请办理，等待资助中心审核，接收回执验证短信。</p><p>　　<strong>借款学生远程提交续贷申请后，5个工作日内等待资助中心进行审查确认，接收回执验证短信（如超过5个工作日，或者至返校前仍然未收到受理证明信息，可以联系资助中心咨询）。学生到高校报到时，借款学生可以持合同回执验证短信，或者纸质受理证明（自行登录在线服务系统下载打印）进行回执确认。</strong></p><p>　　<strong><span style=\"color:#003399;\">2.续贷现场办理</span></strong></p><p>　　（1）网上申请：登录国家开发银行生源地信用助学贷款信息系统（https://sls.cdb.com.cn/），更新个人及共同借款人相关信息，再提出续贷申请。按照系统提示填写续贷声明后，打印《申请表》并签字。</p><p>　　（2）材料准备：借款学生或共同借款人签字的《申请表》原件1份（无需加盖公章）和办理人身份证原件1份。</p><p>　　（3）现场办理：借款学生或共同借款人的任何一方携带本人身份证原件、《申请表》前往贷款办理现场。经审核同意后由县级资助中心经办人指导到场一方（借款学生或共同借款人）使用手写板签订电子合同并分别签署借款学生和共同借款人姓名，需在代签处注明代签人。打印借款合同副本和《受理证明》（附有“校验码”）交给学生。&nbsp;</p><p>　　<strong><span style=\"color:#E53333;\">（二）新贷（以前年度未获得过生源地信用助学贷款的学生）</span></strong></p><p>　　<strong>1.网上申请：</strong>登录国家开发银行生源地信用助学贷款信息系统（https://sls.cdb.com.cn/），完成注册并填写个人及共同借款人基本信息，提交贷款申请后从系统内导出打印《申请表》（未进行预申请的学生在系统内导出《申请表》和《家庭经济困难学生认定表》）。</p><p>　　<strong>2.材料准备：</strong></p><p>　　（1）已通过预申请的：借款学生本人签字的《申请表》原件1份；录取通知书（在校生为学生证）原件（如在校生学生证遗失，可用《教育部学籍在线验证报告》代替）；借款学生及共同借款人双方身份证原件，户口簿原件。</p><p>　　（2）没办理预申请的：借款学生本人签字的《申请表》原件1份、《家庭经济困难学生认定表》原件1份；录取通知书（在校生为学生证）原件（如在校生学生证遗失，可用《教育部学籍在线验证报告》代替）；借款学生及共同借款人双方身份证原件，户口簿原件。</p><p>　　<strong>3、现场办理：</strong>借款学生及共同借款人双方携申请材料共同到学生资助中心办理。经现场审核同意后，由经办人指导借款学生和共同借款人使用手写板签订电子合同，并打印合同副本和《受理证明》（附有“校验码”）交给学生。借款学生及共同借款人必须在借款合同上签字，严禁由其他人代替借款学生或共同借款人签订借款合同。</p><p>　　<strong>所有借款学生（包括新贷和续贷学生）在现场办理贷款时所签电子合同为预签贷款合同。预签合同未经国家开发银行湖北省分行最终审批同意，不能获得贷款。</strong></p><p>　　»»&nbsp;<strong><a href=\"http://m.wh.bendibao.com/edu/114592.shtm\" target=\"_blank\">湖北生源地助学贷款申请时间</a></strong></p><div id=\"adInArticle\"><div><p font-style:normal;font-variant:normal;font-weight:400;letter-spacing:normal;orphans:2;text-align:start;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;-webkit-text-stroke-width:0px;text-decoration-style:initial;text-decoration-color:initial;\"=\"\">温馨提示：微信搜索公众号武汉本地宝，关注后在对话框回复【助学】可获湖北大学生生源地助学贷款线上/线下办理方式及时间、申请条件及流程、所需材料。</p><p font-style:normal;font-variant:normal;font-weight:400;letter-spacing:normal;orphans:2;text-indent:0px;text-transform:none;white-space:normal;widows:2;word-spacing:0px;-webkit-text-stroke-width:0px;text-decoration-style:initial;text-decoration-color:initial;text-align:center;\"=\"\" align=\"center\"><img src=\"http://imgbdb3.bendibao.com/dazheimg/202111/12/20211112162410_21535.png\"/></p></div></div><div class=\"ad-in-article a-2\"><!--\n<div style=\"width:760px;height:100px;float:left;margin: 14px 0;\">\n<script type=\"text/javascript\" src=\"http://d.s11.cn/x7dry1fhrn.js\"></script>\n</div>\n---></div><!--bottom--><script>var newNode = document.createElement(\"div\");newNode.innerHTML =document.getElementById(\"add_ewm_content\").innerHTML ;document.getElementById(\"add_ewm_content\").remove();document.getElementById(\"adInArticle\").insertBefore(newNode,document.getElementById(\"adInArticle\").firstChild);</script><!--mobile--><p class=\"view_city_index\"><a style=\"background:none;\" href=\"http://m.wh.bendibao.com/edu/114593.shtm\" target=\"_blank\">手机访问</a>&nbsp;<a href=\"http://wh.bendibao.com\" target=\"_blank\">武汉本地宝首页</a></p><div id=\"sclear\" style=\"clear:both;\"></div></div>', '2022-04-08 19:38:00', '1101');
INSERT INTO `student_loan` VALUES ('21', '助学贷款公告', 'https://secondhand-liaoke.oss-cn-hangzhou.aliyuncs.com/images/2/2022/03/EZmsMzkUKwARKfUGWrosZ59TGg5oOv.jpg', '今年政策是真的好', '2022-04-08 19:38:00', '1101');
INSERT INTO `student_loan` VALUES ('212', '助学贷款公告', 'https://secondhand-liaoke.oss-cn-hangzhou.aliyuncs.com/images/2/2022/03/EZmsMzkUKwARKfUGWrosZ59TGg5oOv.jpg', '今年政策是真的好', '2022-04-08 19:38:00', '1101');
INSERT INTO `student_loan` VALUES ('2123', '助学贷款公告', 'https://secondhand-liaoke.oss-cn-hangzhou.aliyuncs.com/images/2/2022/03/EZmsMzkUKwARKfUGWrosZ59TGg5oOv.jpg', '今年政策是真的好', '2022-04-08 19:38:00', '1101');
INSERT INTO `student_loan` VALUES ('21234', '助学贷款公告', 'https://secondhand-liaoke.oss-cn-hangzhou.aliyuncs.com/images/2/2022/03/EZmsMzkUKwARKfUGWrosZ59TGg5oOv.jpg', '今年政策是真的好', '2022-04-08 19:38:00', '1101');
INSERT INTO `student_loan` VALUES ('212341', '助学贷款公告', 'https://secondhand-liaoke.oss-cn-hangzhou.aliyuncs.com/images/2/2022/03/EZmsMzkUKwARKfUGWrosZ59TGg5oOv.jpg', '今年政策是真的好', '2022-04-08 19:38:00', '1101');
INSERT INTO `student_loan` VALUES ('213', '助学贷款公告', 'https://secondhand-liaoke.oss-cn-hangzhou.aliyuncs.com/images/2/2022/03/EZmsMzkUKwARKfUGWrosZ59TGg5oOv.jpg', '今年政策是真的好', '2022-04-08 19:38:00', '1101');
INSERT INTO `student_loan` VALUES ('217', '助学贷款公告', 'https://secondhand-liaoke.oss-cn-hangzhou.aliyuncs.com/images/2/2022/03/EZmsMzkUKwARKfUGWrosZ59TGg5oOv.jpg', '今年政策是真的好', '2022-04-08 19:38:00', '1101');
INSERT INTO `student_loan` VALUES ('21776', '助学贷款公告', 'https://secondhand-liaoke.oss-cn-hangzhou.aliyuncs.com/images/2/2022/03/EZmsMzkUKwARKfUGWrosZ59TGg5oOv.jpg', '今年政策是真的好', '2022-04-08 19:38:00', '1101');
INSERT INTO `student_loan` VALUES ('217760', '助学贷款公告', 'https://secondhand-liaoke.oss-cn-hangzhou.aliyuncs.com/images/2/2022/03/EZmsMzkUKwARKfUGWrosZ59TGg5oOv.jpg', '今年政策是真的好', '2022-04-08 19:38:00', '1101');
INSERT INTO `student_loan` VALUES ('2177609', '助学贷款公告', 'https://secondhand-liaoke.oss-cn-hangzhou.aliyuncs.com/images/2/2022/03/EZmsMzkUKwARKfUGWrosZ59TGg5oOv.jpg', '今年政策是真的好', '2022-04-08 19:38:00', '1101');
INSERT INTO `student_loan` VALUES ('21776097', '助学贷款公告', 'https://secondhand-liaoke.oss-cn-hangzhou.aliyuncs.com/images/2/2022/03/EZmsMzkUKwARKfUGWrosZ59TGg5oOv.jpg', '今年政策是真的好', '2022-04-08 19:38:00', '1101');
INSERT INTO `student_loan` VALUES ('2177609756', '助学贷款公告', 'https://secondhand-liaoke.oss-cn-hangzhou.aliyuncs.com/images/2/2022/03/EZmsMzkUKwARKfUGWrosZ59TGg5oOv.jpg', '今年政策是真的好', '2022-04-08 19:38:00', '1101');
INSERT INTO `student_loan` VALUES ('21776097564', '助学贷款公告', 'https://secondhand-liaoke.oss-cn-hangzhou.aliyuncs.com/images/2/2022/03/EZmsMzkUKwARKfUGWrosZ59TGg5oOv.jpg', '今年政策是真的好', '2022-04-08 19:38:00', '1101');
INSERT INTO `student_loan` VALUES ('217760975643', '助学贷款公告', 'https://secondhand-liaoke.oss-cn-hangzhou.aliyuncs.com/images/2/2022/03/EZmsMzkUKwARKfUGWrosZ59TGg5oOv.jpg', '今年政策是真的好', '2022-04-08 19:38:00', '1101');
INSERT INTO `student_loan` VALUES ('217765', '助学贷款公告', 'https://secondhand-liaoke.oss-cn-hangzhou.aliyuncs.com/images/2/2022/03/EZmsMzkUKwARKfUGWrosZ59TGg5oOv.jpg', '今年政策是真的好', '2022-04-08 19:38:00', '1101');
INSERT INTO `student_loan` VALUES ('21776578', '助学贷款公告', 'https://secondhand-liaoke.oss-cn-hangzhou.aliyuncs.com/images/2/2022/03/EZmsMzkUKwARKfUGWrosZ59TGg5oOv.jpg', '今年政策是真的好', '2022-04-08 19:38:00', '1101');

-- ----------------------------
-- Table structure for token
-- ----------------------------
DROP TABLE IF EXISTS `token`;
CREATE TABLE `token`  (
  `id` char(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` char(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `balance` decimal(10, 2) NULL DEFAULT NULL COMMENT '余额',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '代币' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of token
-- ----------------------------
INSERT INTO `token` VALUES ('1505810166141100033', '1505482126466994178', 821.00);
INSERT INTO `token` VALUES ('1506155477598375937', '1505481412843917314', 100.00);
INSERT INTO `token` VALUES ('1506180619812663297', '1506180088947994625', 10100.00);

-- ----------------------------
-- Table structure for token_apply
-- ----------------------------
DROP TABLE IF EXISTS `token_apply`;
CREATE TABLE `token_apply`  (
  `id` char(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` char(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户id',
  `money` decimal(10, 2) NULL DEFAULT NULL COMMENT '申请金额',
  `reason` varchar(2048) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '理由',
  `is_audit` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否通过',
  `id_card` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证号码',
  `real_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '真实姓名',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '详细地址',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of token_apply
-- ----------------------------
INSERT INTO `token_apply` VALUES ('1506166528008155138', '1505482126466994178', 100.00, '123阿达是的方法都是', '是', NULL, NULL, NULL);
INSERT INTO `token_apply` VALUES ('1506168438777868290', '1505482126466994178', 111.00, '123123', '是', NULL, NULL, NULL);
INSERT INTO `token_apply` VALUES ('1506170464656142337', '1505482126466994178', 12.00, '123fasd', '是', '123', '123', '123');
INSERT INTO `token_apply` VALUES ('1506180721935577089', '1506180088947994625', 10000.00, '零花钱', '是', '1988911101029910', '张三', '湖北省武汉市');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` char(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '登录用户名',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `tel` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电话',
  `gender` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '性别',
  `age` int(11) NULL DEFAULT NULL COMMENT '年龄',
  `nickname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '昵称',
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像',
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `id_card` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证号码',
  `real_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '真实姓名',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '详细地址',
  `subsidize_id` char(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '资助人id',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1505481412843917314', '张三', '1101', '18989892011', '女', 0, '张菲', 'https://wangjc-blog.oss-cn-beijing.aliyuncs.com/2022/03/20/75117030727a46fdb62b3d4174f8c3d1fill_w570_h760_g0_mark_2021032722254659.jpg', 'youthtoday@163.com', '123', '123', '123', NULL);
INSERT INTO `user` VALUES ('1505482126466994178', 'admin', 'admin', '123', '男', 0, '13', 'https://wangjc-blog.oss-cn-beijing.aliyuncs.com/2022/03/20/9b4c71d89e944d9d8acb545eecaf808bfill_w570_h760_g0_mark_2021032722174290.jpg', '123', '123', '123', '123', '1505481412843917314');
INSERT INTO `user` VALUES ('1506160675368636418', '111', '111', '111', '男', 111, '111', 'https://wangjc-blog.oss-cn-beijing.aliyuncs.com/2022/03/22/e75a46ec60274479acb4e6be7792a3d7fill_w570_h760_g0_mark_202110061351458.jpg', '111', NULL, NULL, NULL, NULL);
INSERT INTO `user` VALUES ('1506180088947994625', '222', '111', '19889891010', '女', 0, '111', 'https://wangjc-blog.oss-cn-beijing.aliyuncs.com/2022/03/22/8dfabb188bf2499a8a6c098cf203919cfill_w570_h760_g0_mark_202107011441042.jpeg', '111', '1988911101029910', '张三', '湖北省武汉市', NULL);

SET FOREIGN_KEY_CHECKS = 1;

/*
 Navicat MySQL Data Transfer

 Source Server         : 565134909
 Source Server Type    : MySQL
 Source Server Version : 80015
 Source Host           : localhost:3306
 Source Schema         : my_blog

 Target Server Type    : MySQL
 Target Server Version : 80015
 File Encoding         : 65001

 Date: 22/04/2019 18:29:21
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_group_permissions_group_id_permission_id_0cd325b0_uniq`(`group_id`, `permission_id`) USING BTREE,
  INDEX `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm`(`permission_id`) USING BTREE,
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_permission_content_type_id_codename_01ab375a_uniq`(`content_type_id`, `codename`) USING BTREE,
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 49 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES (1, 'Can add log entry', 1, 'add_logentry');
INSERT INTO `auth_permission` VALUES (2, 'Can change log entry', 1, 'change_logentry');
INSERT INTO `auth_permission` VALUES (3, 'Can delete log entry', 1, 'delete_logentry');
INSERT INTO `auth_permission` VALUES (4, 'Can view log entry', 1, 'view_logentry');
INSERT INTO `auth_permission` VALUES (5, 'Can add permission', 2, 'add_permission');
INSERT INTO `auth_permission` VALUES (6, 'Can change permission', 2, 'change_permission');
INSERT INTO `auth_permission` VALUES (7, 'Can delete permission', 2, 'delete_permission');
INSERT INTO `auth_permission` VALUES (8, 'Can view permission', 2, 'view_permission');
INSERT INTO `auth_permission` VALUES (9, 'Can add group', 3, 'add_group');
INSERT INTO `auth_permission` VALUES (10, 'Can change group', 3, 'change_group');
INSERT INTO `auth_permission` VALUES (11, 'Can delete group', 3, 'delete_group');
INSERT INTO `auth_permission` VALUES (12, 'Can view group', 3, 'view_group');
INSERT INTO `auth_permission` VALUES (13, 'Can add user', 4, 'add_user');
INSERT INTO `auth_permission` VALUES (14, 'Can change user', 4, 'change_user');
INSERT INTO `auth_permission` VALUES (15, 'Can delete user', 4, 'delete_user');
INSERT INTO `auth_permission` VALUES (16, 'Can view user', 4, 'view_user');
INSERT INTO `auth_permission` VALUES (17, 'Can add content type', 5, 'add_contenttype');
INSERT INTO `auth_permission` VALUES (18, 'Can change content type', 5, 'change_contenttype');
INSERT INTO `auth_permission` VALUES (19, 'Can delete content type', 5, 'delete_contenttype');
INSERT INTO `auth_permission` VALUES (20, 'Can view content type', 5, 'view_contenttype');
INSERT INTO `auth_permission` VALUES (21, 'Can add session', 6, 'add_session');
INSERT INTO `auth_permission` VALUES (22, 'Can change session', 6, 'change_session');
INSERT INTO `auth_permission` VALUES (23, 'Can delete session', 6, 'delete_session');
INSERT INTO `auth_permission` VALUES (24, 'Can view session', 6, 'view_session');
INSERT INTO `auth_permission` VALUES (25, 'Can add 博客分类', 7, 'add_category');
INSERT INTO `auth_permission` VALUES (26, 'Can change 博客分类', 7, 'change_category');
INSERT INTO `auth_permission` VALUES (27, 'Can delete 博客分类', 7, 'delete_category');
INSERT INTO `auth_permission` VALUES (28, 'Can view 博客分类', 7, 'view_category');
INSERT INTO `auth_permission` VALUES (29, 'Can add 博客正文', 8, 'add_entry');
INSERT INTO `auth_permission` VALUES (30, 'Can change 博客正文', 8, 'change_entry');
INSERT INTO `auth_permission` VALUES (31, 'Can delete 博客正文', 8, 'delete_entry');
INSERT INTO `auth_permission` VALUES (32, 'Can view 博客正文', 8, 'view_entry');
INSERT INTO `auth_permission` VALUES (33, 'Can add 博客标签', 9, 'add_tag');
INSERT INTO `auth_permission` VALUES (34, 'Can change 博客标签', 9, 'change_tag');
INSERT INTO `auth_permission` VALUES (35, 'Can delete 博客标签', 9, 'delete_tag');
INSERT INTO `auth_permission` VALUES (36, 'Can view 博客标签', 9, 'view_tag');
INSERT INTO `auth_permission` VALUES (37, 'Can add site', 10, 'add_site');
INSERT INTO `auth_permission` VALUES (38, 'Can change site', 10, 'change_site');
INSERT INTO `auth_permission` VALUES (39, 'Can delete site', 10, 'delete_site');
INSERT INTO `auth_permission` VALUES (40, 'Can view site', 10, 'view_site');
INSERT INTO `auth_permission` VALUES (41, 'Can add 评论', 11, 'add_comment');
INSERT INTO `auth_permission` VALUES (42, 'Can change 评论', 11, 'change_comment');
INSERT INTO `auth_permission` VALUES (43, 'Can delete 评论', 11, 'delete_comment');
INSERT INTO `auth_permission` VALUES (44, 'Can view 评论', 11, 'view_comment');
INSERT INTO `auth_permission` VALUES (45, 'Can moderate comments', 11, 'can_moderate');
INSERT INTO `auth_permission` VALUES (46, 'Can add comment flag', 12, 'add_commentflag');
INSERT INTO `auth_permission` VALUES (47, 'Can change comment flag', 12, 'change_commentflag');
INSERT INTO `auth_permission` VALUES (48, 'Can delete comment flag', 12, 'delete_commentflag');
INSERT INTO `auth_permission` VALUES (49, 'Can view comment flag', 12, 'view_commentflag');

-- ----------------------------
-- Table structure for auth_user
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `last_login` datetime(6) NULL DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `first_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `last_name` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(254) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_user
-- ----------------------------
INSERT INTO `auth_user` VALUES (1, 'pbkdf2_sha256$120000$D3Jfcizajdnt$T3TdoJUH35EOE8W4AWqkgrEHi8Zlyc6A6rHFVMk++1I=', '2019-04-02 01:43:19.921484', 1, 'XJJ', '', '', '565134909@qq.com', 1, 1, '2019-04-01 03:39:02.517076');
INSERT INTO `auth_user` VALUES (2, 'pbkdf2_sha256$120000$tiX7du44JKrL$smknUOXSixhPW4OjwgQOM3YMKoxK3FvZN9YcSFFLI/E=', NULL, 0, '许竣杰', '', '', '', 0, 1, '2019-04-02 01:47:58.102128');

-- ----------------------------
-- Table structure for auth_user_groups
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_user_groups_user_id_group_id_94350c0c_uniq`(`user_id`, `group_id`) USING BTREE,
  INDEX `auth_user_groups_group_id_97559544_fk_auth_group_id`(`group_id`) USING BTREE,
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for auth_user_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq`(`user_id`, `permission_id`) USING BTREE,
  INDEX `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm`(`permission_id`) USING BTREE,
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for blog_category
-- ----------------------------
DROP TABLE IF EXISTS `blog_category`;
CREATE TABLE `blog_category`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blog_category
-- ----------------------------
INSERT INTO `blog_category` VALUES (1, '日记');
INSERT INTO `blog_category` VALUES (2, '随笔');

-- ----------------------------
-- Table structure for blog_entry
-- ----------------------------
DROP TABLE IF EXISTS `blog_entry`;
CREATE TABLE `blog_entry`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `img` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `body` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `abstract` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `visiting` int(10) UNSIGNED NOT NULL,
  `created_time` datetime(6) NOT NULL,
  `modifyed_time` datetime(6) NOT NULL,
  `author_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `blog_entry_author_id_81ca74ac_fk_auth_user_id`(`author_id`) USING BTREE,
  CONSTRAINT `blog_entry_author_id_81ca74ac_fk_auth_user_id` FOREIGN KEY (`author_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blog_entry
-- ----------------------------
INSERT INTO `blog_entry` VALUES (1, '第一条博客', '', 'hello world', 'hello world', 14, '2019-04-01 23:13:16.763202', '2019-04-01 23:13:16.763202', 1);
INSERT INTO `blog_entry` VALUES (2, '第二条博客', 'blog_img/514b28147521cf6d6b51a306c2dab73d.bmp', '哈哈哈', '啦啦啦', 10, '2019-04-02 01:48:50.288526', '2019-04-02 01:55:02.884115', 2);

-- ----------------------------
-- Table structure for blog_entry_category
-- ----------------------------
DROP TABLE IF EXISTS `blog_entry_category`;
CREATE TABLE `blog_entry_category`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `blog_entry_category_entry_id_category_id_dbee0293_uniq`(`entry_id`, `category_id`) USING BTREE,
  INDEX `blog_entry_category_category_id_c7c4d147_fk_blog_category_id`(`category_id`) USING BTREE,
  CONSTRAINT `blog_entry_category_category_id_c7c4d147_fk_blog_category_id` FOREIGN KEY (`category_id`) REFERENCES `blog_category` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `blog_entry_category_entry_id_cd1f0804_fk_blog_entry_id` FOREIGN KEY (`entry_id`) REFERENCES `blog_entry` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blog_entry_category
-- ----------------------------
INSERT INTO `blog_entry_category` VALUES (1, 1, 1);
INSERT INTO `blog_entry_category` VALUES (2, 2, 1);
INSERT INTO `blog_entry_category` VALUES (3, 2, 2);

-- ----------------------------
-- Table structure for blog_entry_tags
-- ----------------------------
DROP TABLE IF EXISTS `blog_entry_tags`;
CREATE TABLE `blog_entry_tags`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `blog_entry_tags_entry_id_tag_id_bea7dc18_uniq`(`entry_id`, `tag_id`) USING BTREE,
  INDEX `blog_entry_tags_tag_id_b0072fbd_fk_blog_tag_id`(`tag_id`) USING BTREE,
  CONSTRAINT `blog_entry_tags_entry_id_268214b7_fk_blog_entry_id` FOREIGN KEY (`entry_id`) REFERENCES `blog_entry` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `blog_entry_tags_tag_id_b0072fbd_fk_blog_tag_id` FOREIGN KEY (`tag_id`) REFERENCES `blog_tag` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blog_entry_tags
-- ----------------------------
INSERT INTO `blog_entry_tags` VALUES (1, 1, 1);
INSERT INTO `blog_entry_tags` VALUES (3, 2, 2);

-- ----------------------------
-- Table structure for blog_movies
-- ----------------------------
DROP TABLE IF EXISTS `blog_movies`;
CREATE TABLE `blog_movies`  (
  `film_addr` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cover_pic` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ori_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `prod_year` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `prod_country` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `category` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `language` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `subtitle` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `release_date` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `score` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `file_format` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `video_size` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `file_size` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `film_length` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `director` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `actors` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `profile` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `capt_pic` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blog_movies
-- ----------------------------
INSERT INTO `blog_movies` VALUES ('ftp://d:d@a.dygodj8.com:12322/[电影天堂www.dy2018.com]非同凡响BD粤语中字.mp4', '\r\n&nbs;img src=\"htts:img.18qweasd.comdfilehtmlgndyjddy2019-04-0826aaf3614b4972330a28c847bb19fa71.jg\" alt=\"非同凡响(1).JPG\" width=\"518\" height=\"732\" \r\n', '译　　名　Distinction非同凡響\r\n', '片　　名　非同凡响\r\n', '年　　代　2018\r\n', '产　　地　香港\r\n', '类　　别　剧情\r\n', '语　　言　粤语\r\n', '字　　幕　中文字幕\r\n', '上映日期　2018-10-11(香港)\r\n', '豆瓣评分　7.010 from 130 users\r\n', 'IMDb评分　4.710 from 90 users\r\n', '文件格式　x264 + ACC\r\n', '视频尺寸　1280 x 720\r\n', '文件大小　1182 MB\r\n', '片　　长　99 Mins\r\n', '导　　演　欧文杰\r\n', '主　　演　余香凝\r\n　　　　　　岑珈其\r\n　　　　　　叶童\r\n　　　　　　谷祖琳\r\n　　　　　　张国强\r\n　　　　　　廖子妤\r\n　　　　　　欧锦棠\r\n　　　　　　钟景辉\r\n　　　　　　张蔓姿\r\n　　　　　　陈丽云\r\n　　　　　　郭伟亮\r\n　　　　　　蒋祖曼\r\n　　　　　　傅月美\r\n　　　　　　梁健平\r\n　　　　　　林嘉华\r\n　　　　　　刘玉翠\r\n　　　　　　陈桂芬\r\n　　　　　　岑乐怡\r\n　　　　　　陈曾宁\r\n　　　　　　游学修\r\n　　　　　　易健儿\r\n　　　　　　谢珈朗\r\n　　　　　　徐浩昌\r\n　　　　　　何故\r\n', '简　　介\r\n　　從特殊學校啟光學校欲透過舉辦音樂劇來提高畢業生就職機會開始。在校的音樂老師徐寶雯（谷祖琳飾）在面對這個計劃，隨著演出日子逼近壓力加深。音樂劇同時找來名校萃英中學學生前來協助，但最終只有在班中成績未能趕上的錢思穎（余香凝飾）繼續當上義工，但卻要面對家人與學校的壓力。同時在成績中下育才中學孔老師（歐錦棠飾），帶來新移民陳麗與透過當義工「洗底」的吳珈豪（岑珈其飾）來協助。珈豪與思穎最初對音樂劇的態度，卻隨著在校同學的盡力演出，漸有改觀。\r\n');
INSERT INTO `blog_movies` VALUES ('ftp://d:d@a.dygodj8.com:12322/[电影天堂www.dy2018.com]黑暗BD中英双字.mp4', '\r\n&nbs;img src=\"htts:img.18qweasd.comdfilehtmlgndyjddy2019-04-10d58c868368db24cb1c2e13b8c4df1b9a.jg\" alt=\"黑暗(1).JPG\" width=\"518\" height=\"735\" \r\n', '译　　名　The Dark\r\n', '片　　名　黑暗\r\n', '年　　代　2018\r\n', '产　　地　奥地利 Austria\r\n', '类　　别　恐怖\r\n', '语　　言　英语\r\n', '字　　幕　中英双字\r\n', '上映日期　2018-04-21(翠贝卡电影节)2018-10-12(奥地利)\r\n', '豆瓣评分　5.710 from 68 users\r\n', 'IMDb评分　5.610 from 2306 users\r\n', '文件格式　x264 + ACC\r\n', '视频尺寸　1280 x 720\r\n', '文件大小　1312 MB\r\n', '片　　长　95 Mins\r\n', '导　　演　Justin P. Lange\r\n', '主　　演　Nadia Alexander\r\n　　　　　　托比&middot;尼克尔斯\r\n　　　　　　卡尔&middot;马克维斯\r\n', '简　　介\r\n　　一个杀气腾腾、食肉不死的年轻女孩在她几十年前被谋杀的偏远森林里游荡，发现一个被绑架和虐待的男孩藏在受害者的一辆车的后备箱里。\r\n');
INSERT INTO `blog_movies` VALUES ('ftp://d:d@a.dygodj8.com:12322/[电影天堂www.dy2018.com]诡风怪谈BD中英双字.mkv', '\r\n&nbs;img src=\"htts:img.18qweasd.comdfilehtmlgndyjddy2019-04-11a12dfdde99300402af529a1f92389e38.jg\" alt=\"诡风怪谈(1).JPG\" width=\"518\" height=\"768\" \r\n', '译　　名　The Wind\r\n', '片　　名　诡风怪谈\r\n', '年　　代　2018\r\n', '产　　地　美国\r\n', '类　　别　恐怖西部\r\n', '语　　言　英语\r\n', '字　　幕　中英双字\r\n', '上映日期　2018-09-10(多伦多电影节)\r\n', 'IMDb评分　5.810 from 939 users\r\n', '文件格式　x264 + ACC\r\n', '视频尺寸　1280 x 720\r\n', '文件大小　1024 MB\r\n', '片　　长　88 Mins\r\n', '导　　演　Emma Tammi\r\n', '主　　演　茱莉亚&middot;古丹妮&middot;泰勒斯\r\n　　　　　　阿什利&middot;祖克曼\r\n', '简　　介\r\n　　《风之星》是一部以19世纪末的西部边疆为背景的超自然惊悚片，它将凯特琳&middot;杰拉德（阴险的：最后一把钥匙）描绘成一个被荒芜的土地的严酷和孤立所逼疯的平原女人。\r\n', '影片截图\r\ndivimg src=\"htts:img.18qweasd.comdfilehtmlgndyjddy2019-04-11ef72d95aae2e04f72f9a4384da5e54d2.jg\" alt=\"诡风怪谈BD中英双字.mkv_thumbs_[2019.04.11_20.37.34](1).jg\" width=\"926\" height=\"850\" div\r\n');
INSERT INTO `blog_movies` VALUES ('ftp://d:d@a.dygodj8.com:12322/[电影天堂www.dy2018.com]欢迎来到马文镇BD中英双字.mp4', '\r\n&nbs;img src=\"htts:img.18qweasd.comdfilehtmlgndyjddy2019-04-076513cb25e487a7a513b419f14c48c157.jg\" alt=\"欢迎来到马文镇(1).JPG\" width=\"518\" height=\"745\" \r\n', '译　　名　Welcome to Marwen\r\n', '片　　名　欢迎来到马文镇\r\n', '年　　代　2018\r\n', '产　　地　美国\r\n', '类　　别　剧情传记\r\n', '语　　言　英语\r\n', '字　　幕　中英双字\r\n', '上映日期　2018-12-21(美国)\r\n', '豆瓣评分　5.910 from 247 users\r\n', 'IMDb评分　7.110 from 37647 users\r\n', '文件格式　x264 + ACC\r\n', '视频尺寸　1280 x 720\r\n', '文件大小　1387 MB\r\n', '片　　长　116 Mins\r\n', '导　　演　罗伯特&middot;泽米吉斯\r\n', '主　　演　史蒂夫&middot;卡瑞尔\r\n　　　　　　法尔克&middot;亨特切尔\r\n　　　　　　马特&middot;欧莱瑞\r\n　　　　　　尼古莱&middot;维切尔\r\n　　　　　　帕特里克&middot;罗卡斯\r\n　　　　　　亚历克斯&middot;洛韦\r\n　　　　　　艾莎&middot;冈萨雷斯\r\n　　　　　　莱斯利&middot;泽米吉斯\r\n　　　　　　梅里特&middot;韦弗\r\n　　　　　　格温多兰&middot;克里斯蒂\r\n　　　　　　加奈儿&middot;梦奈\r\n　　　　　　莱斯利&middot;曼恩\r\n　　　　　　尼尔&middot;杰克逊\r\n　　　　　　西沃恩&middot;威廉姆斯\r\n　　　　　　黛安&middot;克鲁格\r\n　　　　　　埃里克&middot;李塞德\r\n　　　　　　康拉德&middot;科茨\r\n　　　　　　薇娜&middot;苏德\r\n　　　　　　帕特里克&middot;萨邦圭\r\n　　　　　　弗雷泽&middot;艾奇逊\r\n　　　　　　杰夫&middot;桑卡\r\n　　　　　　特雷弗&middot;琼斯\r\n　　　　　　莎伦&middot;克兰德尔\r\n', '简　　介\r\n　　《马尔文科》根据2010年同名纪录片改编，讲述了Mark Hogancam的真实故事。这个男人在被5名青少年暴打之后，陷入长达九天的昏迷，醒来后失去了记忆，他的生活、朋友和家人什么都不记得了。&nbs;\r\n　　作为一种特殊的治疗手段，Mark Hogancam开始在自家后院，用1：6的模型玩偶创作出了一个二战时期的比利时小镇，他将之称为&ldquo;马文科尔&rdquo;（Marwencol），他用玩偶代表自己、朋友和那些殴打他的人。&nbs;\r\n　　&ldquo;马文科尔&rdquo;在一定程度上修补了Mark Hogancam的头脑，同时也让他创造出了一个奇幻的世界。而这个世界通过Jeff Malmberg在2010年公映的纪录片，也得以让更多的人看到。\r\n');
INSERT INTO `blog_movies` VALUES ('ftp://d:d@a.dygodj8.com:12322/[电影天堂www.dy2018.com]人面鱼：红衣小女孩外传BD国语中字.mp4', '\r\n&nbs;img src=\"htts:img.18qweasd.comdfilehtmlgndyjddy2019-03-15b20cbfee7b2fe6ef693e9fd526c3d6ff.jg\" alt=\"人面鱼(1).JPG\" width=\"518\" height=\"731\" \r\n', '译　　名　人面鱼：红衣小女孩外传红衣小女孩3The Devil Fish\r\n', '片　　名　人面魚：紅衣小女孩外傳\r\n', '年　　代　2018\r\n', '产　　地　台湾\r\n', '类　　别　恐怖\r\n', '语　　言　汉语普通话\r\n', '字　　幕　中文字幕\r\n', '上映日期　2018-11-12(金马影展)2018-11-23(台湾)\r\n', '豆瓣评分　5.610 from 719 users\r\n', 'IMDb评分　4.910 from 121 users\r\n', '文件格式　x264 + ACC\r\n', '视频尺寸　1280 x 720\r\n', '文件大小　1266 MB\r\n', '片　　长　114 Mins\r\n', '导　　演　庄绚维 Hsuan Wei Chuang\r\n', '主　　演　郑人硕 Rexen Cheng\r\n　　　　　　徐若瑄\r\n　　　　　　吴至璿 Chaster Wu\r\n　　　　　　张书伟 Joe Chang\r\n　　　　　　龙劭华 Siu Wa Lung\r\n　　　　　　高慧君 Francesca Kao\r\n　　　　　　陈少卉 Shaohui Chen\r\n　　　　　　辛佳颖 Belle Hsin\r\n', '简　　介\r\n　　《人面鱼：红衣小女孩外传》改编自台湾乡野传说&ldquo;人面鱼&ldquo;，1990年代有人在高雄县冈山镇（今高雄市冈山区）出游钓起一尾吴郭鱼（罗非鱼），烧烤食用时却听到诡异的声音询问：&ldquo;鱼肉好吃否？&rdquo;之后其拍摄的照片鱼的上头还浮现人脸，令当事人毛骨悚然，不过事件本身有诸多疑点被认为是无根据的谣传。\r\n');
INSERT INTO `blog_movies` VALUES ('ftp://d:d@a.dygodj8.com:12322/[电影天堂www.dy2018.com]发掘真相BD中英双字.mp4', '\r\nimg src=\"htts:img.18qweasd.comdfilehtmlgndyjddy2019-04-113c2553d322bceb0b005cf1ead9d3b3cd.jg\" alt=\"发掘真相(1).JPG\" width=\"518\" height=\"735\" &nbs;\r\n', '译　　名　发掘\r\n', '片　　名　El desentierro\r\n', '年　　代　2018\r\n', '产　　地　西班牙加泰罗尼亚阿尔巴尼亚\r\n', '类　　别　剧情\r\n', '语　　言　西班牙语加泰罗尼亚语\r\n', '字　　幕　中英双字\r\n', '上映日期　2018-11-16(西班牙)\r\n', 'IMDb评分　5.510 from 80 users\r\n', '文件格式　x264 + ACC\r\n', '视频尺寸　1280 x 720\r\n', '文件大小　1305 MB\r\n', '片　　长　109 Mins\r\n', '导　　演　Nacho Rui&eacute;rez\r\n', '主　　演　莱昂纳多&middot;斯巴拉格利亚\r\n　　　　　　Michel Noher\r\n　　　　　　扬&middot;科奈特\r\n　　　　　　伊莲娜&middot;乔瓦诺娃\r\n　　　　　　内斯琳&middot;彻瓦泽德\r\n　　　　　　安娜&middot;托伦特\r\n', '简　　介\r\n　　Vera来到沿海城市遇见Jordi。Jordi刚刚从阿根廷来到这里参加一个部长的葬礼。Vera突然决定调查他爸爸消失20年的事情。所有人都以为他爸爸死了。Diego，是Vera的表弟，是一个已故政治家的儿子，现在是流浪作家，住在erignan小镇。他们一起冒险，并试图解救Vera的妈妈。她妈妈被犯罪组织拐走卖淫了\r\n', '影片截图\r\nimg src=\"htts:img.18qweasd.comdfilehtmlgndyjddy2019-04-11d3dd97fa7b8320900b00a6f5a5b98bb0.jg\" alt=\"发掘真相BD中英双字.m4_thumbs_[2019.04.11_15.58.16](1).jg\" width=\"926\" height=\"850\" \r\n');
INSERT INTO `blog_movies` VALUES ('ftp://d:d@a.dygodj8.com:12322/[电影天堂www.dy2018.com]坦克BD中英双字.mp4', '\r\n&nbs;img src=\"htts:img.18qweasd.comdfilehtmlgndyjddy2019-04-11e573a7ca5105ac4451a45a30ac05cc70.jg\" alt=\"坦克(1).JPG\" width=\"518\" height=\"736\" \r\n', '译　　名　坦克\r\n', '片　　名　Танки\r\n', '年　　代　2018\r\n', '产　　地　俄罗斯\r\n', '类　　别　动作历史喜剧\r\n', '语　　言　俄语\r\n', '字　　幕　中英双字\r\n', '上映日期　2018-04-26(俄罗斯)\r\n', '豆瓣评分　6.510 from 189 users\r\n', 'IMDb评分　4.910 from 671 users\r\n', '文件格式　x264 + ACC\r\n', '视频尺寸　1280 x 720\r\n', '文件大小　1113 MB\r\n', '片　　长　93 Mins\r\n', '导　　演　基姆&middot;德鲁日宁\r\n', '主　　演　安德烈&middot;梅尔兹利金\r\n　　　　　　阿格拉娅&middot;塔拉索娃\r\n　　　　　　Aleksandr Tyutin\r\n　　　　　　Sergey Chetvertkov\r\n　　　　　　Anton Filienko\r\n　　　　　　Aleksey Ovsyannikov\r\n　　　　　　Sergey Stukalov\r\n　　　　　　Nikolay Gorshkov\r\n', '简　　介\r\n　　T-34坦克，是第二次世界大战前由苏联哈尔科夫共产国际工厂设计师米哈伊尔&middot;伊里奇&middot;科什金设计的中型坦克。本片是两辆原型坦克从哈尔科夫，自走到莫斯科参审的传奇经历&helli;&helli;\r\n');
INSERT INTO `blog_movies` VALUES ('ftp://d:d@a.dygodj8.com:12322/[电影天堂www.dy2018.com]完美约会BD中字.mkv', '\r\n&nbs;img src=\"htts:img.18qweasd.comdfilehtmlgndyjddy2019-04-133411ae898a68452f3b3151a3dfb6e96e.jg\" alt=\"完美约会(1).JPG\" width=\"518\" height=\"766\" \r\n', '译　　名　完美约会The Stand-In完美约会对象最佳出租男友(港)\r\n', '片　　名　The Perfect Date\r\n', '年　　代　2019\r\n', '产　　地　美国\r\n', '类　　别　喜剧爱情\r\n', '语　　言　英语\r\n', '字　　幕　中文字幕\r\n', '上映日期　2019-04-12(美国)\r\n', '豆瓣评分　6.110 from 103 users\r\n', 'IMDb评分　6.210 from 1123 users\r\n', '文件格式　x264 + ACC\r\n', '视频尺寸　1280 x 720\r\n', '文件大小　1057 MB\r\n', '片　　长　91 Mins\r\n', '导　　演　克里斯&middot;尼尔森 Chris Nelson\r\n', '主　　演　劳拉&middot;马兰洛 Laura Marano\r\n　　　　　　诺亚&middot;琴蒂内奥 Noah Centineo\r\n　　　　　　卡米拉&middot;门德斯 Camila Mendes\r\n　　　　　　马特&middot;沃尔什 Matt Walsh\r\n　　　　　　乔&middot;克里斯特 Joe Chrest\r\n　　　　　　埃文&middot;卡斯特罗 Evan Castelloe\r\n　　　　　　韦恩&middot;佩雷 Wayne P&eacute;re\r\n　　　　　　卡丽&middot;拉扎 Carrie Lazar\r\n　　　　　　布莱恩&middot;克恩 Blaine Kern III\r\n　　　　　　欧迪瑟亚斯&middot;乔治亚迪斯 Odiseas Georgiadis\r\n　　　　　　Sue-Lynn Ansari\r\n　　　　　　Trina LaFargue\r\n', '简　　介\r\n　　布鲁克斯 (诺亚&middot;琴蒂内奥饰) 巧妙地为大学筹集资金，他开发了一款约会应用。在这款应用中，他为你能想象到的每一种情况都扮演着&ldquo;替身&rdquo;男友的角色。通过一周中每晚做一个不同的人的旅程，他发现真正的布鲁克斯根本不是他想的那样，令他惊讶的是，他爱上了他梦想中的真正的女孩。\r\n');
INSERT INTO `blog_movies` VALUES ('ftp://d:d@a.dygodj8.com:12322/[电影天堂www.dy2018.com]幻想游戏BD日语中字.mp4', '\r\n&nbs;img src=\"htts:img.18qweasd.comdfilehtmlgndyjddy2019-04-058bc8e034e2eb00f7ed39a8a2644f4d87.jg\" alt=\"幻想游戏(1).JPG\" width=\"518\" height=\"732\" \r\n', '译　　名　幻想游戏Imagination Game\r\n', '片　　名　イマジネーションゲーム\r\n', '年　　代　2018\r\n', '产　　地　日本\r\n', '类　　别　剧情\r\n', '语　　言　日语\r\n', '字　　幕　中文字幕\r\n', '上映日期　2018-06-16(上海电影节)2018-07-28(日本)\r\n', '豆瓣评分　5.410 from 269 users\r\n', 'IMDb评分　6.210 from 5 users\r\n', '文件格式　x264 + ACC\r\n', '视频尺寸　1280 x 720\r\n', '文件大小　1099 MB\r\n', '片　　长　92 Mins\r\n', '导　　演　畑泰介\r\n', '主　　演　久本雅美 Masami Hisamoto\r\n　　　　&nbs; 　板野友美 Tomomi Itano\r\n', '简　　介\r\n　　早见真纪子是在大型建筑承包商就职的精英女强人。早见专注工作，目前单身，但她其实是&ldquo;深夜寻找内衣&rdquo;的网站背后神秘的女神。她把贴身衣物藏在街道，给提示让人们去寻找。有一天，早见遇见了在公园露宿的葵。葵是网站&ldquo;向丈夫复仇&rdquo;上的一名颇有影响力的博主。她趁丈夫在外工作，秘密向丈夫复仇。在现代网络文化之下面对复杂的事件，两个女人关系渐渐密切。\r\n');
INSERT INTO `blog_movies` VALUES ('ftp://d:d@a.dygodj8.com:12322/[电影天堂www.dy2018.com]死寂BD中字.mkv', '\r\n&nbs;img src=\"htts:img.18qweasd.comdfilehtmlgndyjddy2019-04-1002c29ce6afedbe9cf5165afdbfb0f3f8.jg\" alt=\"死寂(1).JPG\" width=\"518\" height=\"767\" \r\n', '译　　名　死寂寂静杀机\r\n', '片　　名　The Silence\r\n', '年　　代　2019\r\n', '产　　地　德国\r\n', '类　　别　恐怖\r\n', '语　　言　英语\r\n', '字　　幕　中文字幕\r\n', '上映日期　2019-05-16(德国)\r\n', 'IMDb评分　5.510 from 188 users\r\n', '文件格式　x264 + ACC\r\n', '视频尺寸　1280 x 720\r\n', '文件大小　1054 MB\r\n', '片　　长　91 Mins\r\n', '导　　演　约翰&middot;R&middot;莱昂耐迪 John R. Leonetti\r\n', '主　　演　琪兰&middot;席普卡 Kiernan Shika\r\n　　　　　　斯坦利&middot;图齐 Stanley Tucci\r\n　　　　　　米兰达&middot;奥图 Miranda Otto\r\n　　　　　　约翰&middot;考伯特 John Corbett\r\n　　　　　　萨拉&middot;阿伯特 Sarah Abbott\r\n　　　　　　凯尔&middot;布瑞特科夫 Kyle Breitkof\r\n　　　　　　邓普斯&middot;布瑞克 Demsey Bryk\r\n　　　　　　比利&middot;麦克莱伦 Billy MacLellan\r\n　　　　　　泰勒&middot;拉芙 Taylor Love\r\n　　　　　　Kate Corbett\r\n　　　　　　Hannah Gordon\r\n', '简　　介\r\n　　斯坦利&middot;图齐出演恐怖惊悚片[死寂](The Silence，暂译)，影片由大热恐怖片[安娜贝尔]导演约翰&middot;R&middot;莱昂耐迪执导，琪兰&middot;席普卡此前已确定加盟。影片改编自蒂姆&middot;莱伯恩所著畅销小说，编剧凯莉&middot;范&middot;戴克、肖恩&middot;范&middot;戴克([切尔诺贝利日记])。故事围绕一个失聪少女遭遇一种酷似蝙蝠的恐怖物种展开。\r\n', '影片截图\r\ndivimg src=\"htts:img.18qweasd.comdfilehtmlgndyjddy2019-04-109c8c67fe34db0b8c3cabc494c5e08dd3.jg\" alt=\"死寂BD中字.mkv_thumbs_[2019.04.10_22.33.14](1).jg\" width=\"926\" height=\"850\" div\r\n');
INSERT INTO `blog_movies` VALUES ('ftp://d:d@a.dygodj8.com:12322/[电影天堂www.dy2018.com]王者少年HD中英双字.mkv', '\r\n&nbs;img src=\"htts:img.18qweasd.comdfilehtmlgndyjddy2019-04-0702bc8dffbe1904f463f6c7796964495e.jg\" alt=\"王者少年(1).JPG\" width=\"518\" height=\"768\" \r\n', '译　　名　王者少年\r\n', '片　　名　The Kid Who Would Be King\r\n', '年　　代　2019\r\n', '产　　地　英国美国\r\n', '类　　别　奇幻冒险\r\n', '语　　言　英语\r\n', '字　　幕　中英双字\r\n', '上映日期　2019-01-25(美国)\r\n', '豆瓣评分　5.510 from 227 users\r\n', 'IMDb评分　6.110 from 3895 users\r\n', '文件格式　x264 + ACC\r\n', '视频尺寸　1280 x 720\r\n', '文件大小　1415 MB\r\n', '片　　长　120 Mins\r\n', '导　　演　乔&middot;考尼什\r\n', '主　　演　路易斯&middot;阿什伯恩&middot;瑟金斯\r\n　　　　　　丹妮斯&middot;高夫\r\n　　　　　　迪安&middot;肖穆\r\n　　　　　　汤姆&middot;泰勒\r\n　　　　　　雷亚安娜&middot;杜瑞斯\r\n　　　　　　内森&middot;斯图尔特-贾瑞特\r\n　　　　　　诺玛&middot;杜梅温尼\r\n　　　　　　丽贝卡&middot;弗格森\r\n　　　　　　马克&middot;博纳尔\r\n　　　　　　安格斯&middot;里\r\n　　　　　　路易斯&middot;马丁\r\n　　　　　　乔伊&middot;安沙\r\n　　　　　　亚当&middot;利斯\r\n　　　　　　亚历山德拉&middot;罗奇\r\n　　　　　　尼克&middot;穆罕默德\r\n　　　　　　帕特里克&middot;斯图尔特\r\n　　　　　　迈拉&middot;麦克法迪\r\n　　　　　　亚当&middot;布克斯顿\r\n　　　　　　克劳迪&middot;布莱克利\r\n　　　　　　吉娜薇&middot;欧瑞丽\r\n　　　　　　露丝&middot;霍洛克斯\r\n　　　　　　贾格&middot;帕特尔\r\n　　　　　　康纳&middot;沃尔夫\r\n', '简　　介\r\n　　剧情讲述一群小朋友探索追踪一个中世纪祸害&mdash;&mdash;名叫Morgana、是亚瑟王同父(母)异母(父)的妹妹的故事。路易斯饰Alex，偶然发现了亚瑟王的圣剑&ldquo;Excalibur&rdquo;，泰勒饰他的同伴兰斯洛特，Denise Gough饰他的母亲，Imrie饰年轻版梅林，斯图尔特有望饰演老版梅林，弗格森则有望饰演大反派Morgana。该片由福斯发行，充满动作冒险元素。\r\n');
INSERT INTO `blog_movies` VALUES ('ftp://d:d@a.dygodj8.com:12322/[电影天堂www.dy2018.com]翠丝BD粤语中字.mp4', '\r\n&nbs;img src=\"htts:img.18qweasd.comdfilehtmlgndyjddy2019-04-13f3af90a3eca8f56c32760cb4ed5b83e9.jg\" alt=\"翠丝(1).JPG\" width=\"518\" height=\"720\" \r\n', '译　　名　翠丝Tracey\r\n', '片　　名　翠絲\r\n', '年　　代　2018\r\n', '产　　地　香港\r\n', '类　　别　剧情同性\r\n', '语　　言　粤语\r\n', '字　　幕　中文字幕\r\n', '上映日期　2018-10-28(东京电影节)2018-11-22(香港)\r\n', '豆瓣评分　6.610 from 3026 users\r\n', 'IMDb评分　6.310 from 142 users\r\n', '文件格式　x264 + ACC\r\n', '视频尺寸　1280 x 720\r\n', '文件大小　1423 MB\r\n', '片　　长　119 Mins\r\n', '导　　演　李骏硕 Jun Lee\r\n', '主　　演　姜皓文 Phili Keung Ho-Man\r\n　　　　　　惠英红 Kara Wai Ying Hung\r\n　　　　　　余香凝 Jennifer Yu\r\n　　　　　　周祉君 Aaron Chow\r\n　　　　　　吴肇轩 Kenneth Woo\r\n　　　　　　陳蕾 Panther Chan\r\n　　　　　　葛民辉 Eric Kot\r\n　　　　　　黄河 River Huang\r\n　　　　　　岑珈其 Kaki Sham\r\n　　　　　　袁富华 Fu-wah Yuen\r\n　　　　　　梁舜燕 Lily Leung\r\n　　　　　　顾定轩 Zeno Koo\r\n　　　　　　黃溢濠 Wong Yat Ho\r\n　　　　　　张国强 Kwok Keung Cheung\r\n　　　　　　李昭南\r\n　　　　　　陈志全\r\n', '简　　介\r\n　　★ 港版《丹麦女孩》 勇敢用爱为自己发声！&nbs;\r\n　　★ 金马影后惠英红 继《血观音》后话题演出&nbs;\r\n　　★ 本届金马奖 最佳男配角 最佳女配角 双料入围&nbs;\r\n　　金马奖影后惠英红年度话题演出。安宜（惠英红 饰）与结缡多年的老公大雄（姜皓文饰）在同个屋簷下，一同育有儿子（吴肇轩 饰）与女儿（余香凝 饰），出嫁的女儿也已有孕在身，一切看似和乐无忧，但她竟却从未发现与枕边人原来是同床异梦。某日深夜老公接到越洋来电，得知儿时老友已在伦敦逝世，致电告知的是他的合法同婚伴侣阿邦（黄河 饰），并预计携带老友骨灰返港安置。与此同时，老公又安宜客串票戏的场合，重遇他儿时认识的昔日粤剧花旦打铃哥（袁富华 饰）。故友骤逝又加上巧遇故知，翻起老公许多往事，他决定坦承揭示深藏已久的秘密：他想要变性。安逸过著师奶生活多年的安宜，自认平静的婚姻生活顿时发生剧烈家变，她与家人将如何面对曾是一家之主的人，如今改名唤做「翠丝」&helli;&helli;？&nbs;\r\n');
INSERT INTO `blog_movies` VALUES ('ftp://d:d@a.dygodj8.com:12322/[电影天堂www.dy2018.com]芳龄十六BD中英双字.mp4', '\r\n&nbs;img src=\"htts:img.18qweasd.comdfilehtmlgndyjddy2019-04-086c67f3f5afeeda40c19b2aefb78b2925.jg\" alt=\"芳龄十六(1).JPG\" width=\"518\" height=\"767\" \r\n', '译　　名　芳龄十六\r\n', '片　　名　Level 16\r\n', '年　　代　2018\r\n', '产　　地　加拿大\r\n', '类　　别　科幻\r\n', '语　　言　英语\r\n', '字　　幕　中英双字\r\n', '上映日期　2019-03-01(加拿大)\r\n', '豆瓣评分　6.210 from 638 users\r\n', 'IMDb评分　5.810 from 1334 users\r\n', '文件格式　x264 + ACC\r\n', '视频尺寸　1280 x 720\r\n', '文件大小　1222 MB\r\n', '片　　长　102 Mins\r\n', '导　　演　Danishka Esterhazy\r\n', '主　　演　凯蒂&middot;道格拉斯 Katie Douglas\r\n　　　　　　Celina Martin\r\n　　　　　　莎拉&middot;坎宁 Sara Canning\r\n', '简　　介\r\n　　16岁的Vivien被困在Vestalis学院，这是一所像监狱一样的寄宿学校，她对自己保持沉默，不为任何人伸出脖子。直到她和背叛她的前朋友索菲亚重聚。女孩们一起进行了一次危险的搜索，以发现监禁背后的可怕真相。很快，女孩们就要为自己的生命奔波，要么自救，要么就得努力死去。\r\n');
INSERT INTO `blog_movies` VALUES ('ftp://d:d@a.dygodj8.com:12322/[电影天堂www.dy2018.com]集中营里的摄影师BD中字.mp4', '\r\n&nbs;img src=\"htts:img.18qweasd.comdfilehtmlgndyjddy2019-04-06b5f53c2c73a271431f7772b5d77b01da.jg\" alt=\"集中营里的摄影师(1).JPG\" width=\"518\" height=\"735\" \r\n', '译　　名　集中营里的摄影师The Photograher of Mauthausen\r\n', '片　　名　El fot&oacute;grafo de Mauthausen\r\n', '年　　代　2018\r\n', '产　　地　西班牙\r\n', '类　　别　传记历史战争\r\n', '语　　言　西班牙语\r\n', '字　　幕　中文字幕\r\n', '上映日期　2018-10-26(西班牙)\r\n', '豆瓣评分　7.110 from 333 users\r\n', 'IMDb评分　6.710 from 3186 users\r\n', '文件格式　x264 + ACC\r\n', '视频尺寸　1280 x 720\r\n', '文件大小　1322 MB\r\n', '片　　长　110 Mins\r\n', '导　　演　玛&middot;塔尔加纳 Mar Targarona\r\n', '主　　演　马里奥&middot;卡萨斯 Mario Casas\r\n　　　　　　理查德&middot;范&middot;韦登 Richard van Weyden\r\n　　　　　　阿兰&middot;埃尔南德斯 Alain Hern&aacute;ndez\r\n　　　　　　阿德里亚&middot;萨拉查 Adri&agrave; Salazar\r\n　　　　　　爱德华&middot;布赫 Eduard Buch\r\n　　　　　　斯特凡&middot;韦纳特 Stefan Weinert\r\n　　　　　　弗兰克&middot;费斯 Frank Feys\r\n　　　　　　卢卡&middot;佩洛斯 Luka Peros\r\n　　　　　　玛卡蕾娜&middot;戈麦斯 Macarena G&oacute;mez\r\n　　　　　　丹尼斯&middot;乌伊洛基 D&eacute;nes Ujlaky\r\n　　　　　　玛丽安&middot;科奇什 Mariann Kocsis\r\n', '简　　介\r\n　　　一名在纳粹集中营里担任归档工作的加泰罗尼亚囚犯，利用职务之便，偷走了记录纳粹暴行的照片底片。本片改编自真实事件\r\n');

-- ----------------------------
-- Table structure for blog_phones
-- ----------------------------
DROP TABLE IF EXISTS `blog_phones`;
CREATE TABLE `blog_phones`  (
  `mNo` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `mMark` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `mPrice` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `mNote` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `mFile` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`mNo`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blog_phones
-- ----------------------------
INSERT INTO `blog_phones` VALUES ('000001', 'OPPO', '3599.00', 'OPPO Reno 全面屏拍照手机 8G+256G 雾海绿 全网通 移动联通电信 双卡双待手机', '000001.jpg');
INSERT INTO `blog_phones` VALUES ('000002', 'Apple', '5899.00', 'Apple iPhone XR (A2108) 128GB 黑色 移动联通电信4G手机 双卡双待', '000002.jpg');
INSERT INTO `blog_phones` VALUES ('000003', '【KPL官方比赛用机】vivo', '3298.00', '【KPL官方比赛用机】vivo iQOO 44W超快闪充 8GB+128GB电光蓝 全面屏拍照手机 骁龙855电竞游戏 全网通4G', '000003.jpg');
INSERT INTO `blog_phones` VALUES ('000004', '荣耀8X', '1299.00', '荣耀8X 千元屏霸 91%屏占比 2000万AI双摄 4GB+64GB 幻夜黑 移动联通电信4G全面屏 双卡双待', '000004.jpg');
INSERT INTO `blog_phones` VALUES ('000005', 'vivo', '799.00', 'vivo U1 水滴全面屏 AI智慧拍照手机 3GB+32GB 极光色 移动联通电信全网通4G', '000005.jpg');
INSERT INTO `blog_phones` VALUES ('000006', '荣耀10青春版', '1299.00', '荣耀10青春版 幻彩渐变 2400万AI自拍 全网通版4GB+64GB 渐变蓝 移动联通电信4G全面屏 双卡双待', '000006.jpg');
INSERT INTO `blog_phones` VALUES ('000007', '小米', '1199.00', '小米 红米Redmi Note7 幻彩渐变AI双摄 4GB+64GB 梦幻蓝 全网通4G 双卡双待 水滴全面屏拍照游戏智能', '000007.jpg');
INSERT INTO `blog_phones` VALUES ('000008', 'vivo', '3198.00', 'vivo X27 8GB+128GB大内存 雀羽蓝 零界全面屏AI三摄 移动联通电信全网通4G手机', '000008.jpg');
INSERT INTO `blog_phones` VALUES ('000009', '三星', '6999.00', '三星 Galaxy S10+ 8GB+128GB炭晶黑（SM-G9750）3D超声波屏下指纹超感官全视屏骁龙855双卡双待全网通4G', '000009.jpg');
INSERT INTO `blog_phones` VALUES ('000010', '荣耀V20', '2799.00', '荣耀V20 胡歌同款 麒麟980芯片 魅眼全视屏 4800万深感相机 6GB+128GB 幻夜黑 移动联通电信4G全面屏', '000010.jpg');
INSERT INTO `blog_phones` VALUES ('000011', '荣耀畅玩8C两天一充', '899.00', '荣耀畅玩8C两天一充 莱茵护眼 刘海屏 全网通版4GB+32GB 幻夜黑 移动联通电信4G全面屏 双卡双待', '000011.jpg');
INSERT INTO `blog_phones` VALUES ('000012', '小米', '799.00', '小米 红米6 4GB+64GB 铂银灰 全网通4G手机 双卡双待', '000012.jpg');
INSERT INTO `blog_phones` VALUES ('000013', 'Apple', '6199.00', 'Apple iPhone X (A1865) 64GB 深空灰色 移动联通电信4G手机', '000013.jpg');
INSERT INTO `blog_phones` VALUES ('000014', '小米', '799.00', '小米 红米Redmi 7 幻彩渐变AI双摄 3GB+32GB 梦幻蓝 全网通4G 双卡双待 水滴全面屏拍照游戏智能', '000014.jpg');
INSERT INTO `blog_phones` VALUES ('000015', '小米8SE', '1599.00', '小米8SE 全面屏智能游戏拍照手机 6GB+64GB 灰色 骁龙710处理器 全网通4G 双卡双待', '000015.jpg');
INSERT INTO `blog_phones` VALUES ('000016', '小米8青春版', '1499.00', '小米8青春版 镜面渐变AI双摄 6GB+64GB 梦幻蓝 骁龙 全网通4G 双卡双待 全面屏拍照游戏智能', '000016.jpg');
INSERT INTO `blog_phones` VALUES ('000017', '三星', '5999.00', '三星 Galaxy S10 8GB+128GB炭晶黑（SM-G9730）3D超声波屏下指纹超感官全视屏骁龙855双卡双待全网通4G', '000017.jpg');
INSERT INTO `blog_phones` VALUES ('000018', 'vivo', '1598.00', 'vivo Z3 6GB+64GB 极光蓝 性能实力派 全面屏游戏手机 移动联通电信全网通4G手机', '000018.jpg');
INSERT INTO `blog_phones` VALUES ('000019', '黑鲨游戏手机2', '3499.00', '黑鲨游戏手机2 8GB+128GB 暗影黑 骁龙855 Magic Press立体操控 塔式全域液冷 全面屏 全网通4G 双卡双待', '000019.jpg');
INSERT INTO `blog_phones` VALUES ('000020', '华为', '4288.00', '华为 HUAWEI P30 超感光徕卡三摄麒麟980AI智能芯片全面屏屏内指纹版手机8GB+128GB亮黑色全网通双4G', '000020.jpg');
INSERT INTO `blog_phones` VALUES ('000021', 'Apple', '9699.00', 'Apple iPhone XS Max (A2104) 256GB 深空灰色 移动联通电信4G手机 双卡双待', '000021.jpg');
INSERT INTO `blog_phones` VALUES ('000022', 'Apple', '3799.00', 'Apple iPhone 8 (A1863) 64GB 深空灰色 移动联通电信4G手机', '000022.jpg');
INSERT INTO `blog_phones` VALUES ('000023', 'vivo', '2298.00', 'vivo S1 6GB+128GB 宠爱粉 2480万AI高清自拍 超广角后置三摄拍照手机 移动联通电信全网通4G', '000023.jpg');
INSERT INTO `blog_phones` VALUES ('000024', 'OPPO', '2999.00', 'OPPO Reno手机【19日限时加赠智能手环+6期免息】全面屏拍照手机 全网通手机双卡双待 极夜黑 (6G+128G)', '000024.jpg');
INSERT INTO `blog_phones` VALUES ('000025', '诺基亚', '1069.00', '诺基亚 NOKIA X6 6GB+64GB 星空黑 全网通 双卡双待 移动联通电信4G手机', '000025.jpg');
INSERT INTO `blog_phones` VALUES ('000026', 'Apple', '4699.00', 'Apple iPhone 8 Plus (A1864) 64GB 深空灰色 移动联通电信4G手机', '000026.jpg');
INSERT INTO `blog_phones` VALUES ('000027', '华为', '3999.00', '华为 HUAWEI Mate 20 麒麟980AI智能芯片全面屏超微距影像超大广角徕卡三摄6GB+128GB亮黑色全网通版双4G', '000027.jpg');
INSERT INTO `blog_phones` VALUES ('000028', '荣耀10', '2199.00', '荣耀10 GT游戏加速 AIS手持夜景 6GB+64GB 幻夜黑 全网通 移动联通电信4G 双卡双待 游戏', '000028.jpg');
INSERT INTO `blog_phones` VALUES ('000029', '华为', '2299.00', '华为 HUAWEI nova 4e 3200万立体美颜AI超广角三摄珍珠屏6GB+128GB幻夜黑全网通版双4G', '000029.jpg');
INSERT INTO `blog_phones` VALUES ('000030', 'vivo', '3298.00', 'vivo iQOO 水滴全面屏 超广角AI三摄拍照 高通骁龙855 4G全网通 电竞游戏 智能手机 熔岩橙 8GB 128GB', '000030.jpg');
INSERT INTO `blog_phones` VALUES ('000031', '诺基亚（NOKIA）新105', '139.00', '诺基亚（NOKIA）新105 黑色 直板按键 移动联通2G手机 老人手机 学生备用功能机', '000031.jpg');
INSERT INTO `blog_phones` VALUES ('000032', 'OPPO', '999.00', 'OPPO A5 全面屏拍照手机 3GB+64GB 幻镜蓝 全网通 移动联通电信4G 双卡双待手机', '000032.jpg');
INSERT INTO `blog_phones` VALUES ('000033', '华为', '1499.00', '华为 HUAWEI 畅享MAX 4GB+64GB 幻夜黑 全网通版 珍珠屏杜比全景声大电池 移动联通电信4G 双卡双待', '000033.jpg');
INSERT INTO `blog_phones` VALUES ('000034', '小米', '1199.00', '小米 红米Redmi Note7 幻彩渐变AI双摄 4GB+64GB 梦幻蓝 全网通4G 双卡双待 水滴全面屏拍照游戏智能', '000034.jpg');
INSERT INTO `blog_phones` VALUES ('000035', '三星', '4999.00', '三星 Galaxy S10e 6GB+128GB 炭晶黑（SM-G9700）超感官全视屏 骁龙855 双卡双待 全网通4G', '000035.jpg');
INSERT INTO `blog_phones` VALUES ('000036', '小米6X', '1299.00', '小米6X 全网通 6GB+64GB 赤焰红 移动联通电信4G手机 双卡双待 智能手机 拍照手机', '000036.jpg');
INSERT INTO `blog_phones` VALUES ('000037', '荣耀8X', '1499.00', '荣耀8X Max 7.12英寸90%屏占比珍珠屏 4GB+64GB 魅海蓝 移动联通电信4G全面屏 双卡双待', '000037.jpg');
INSERT INTO `blog_phones` VALUES ('000038', '飞利浦（PHILIPS）E171L', '198.00', '飞利浦（PHILIPS）E171L 曜石黑 直板按键 移动联通 老人手机 老年功能机', '000038.jpg');
INSERT INTO `blog_phones` VALUES ('000039', '飞利浦', '178.00', '飞利浦 PHILIPS E258S 宝石蓝 直板按键 移动/联通2G 老人手机 老年功能手机', '000039.jpg');
INSERT INTO `blog_phones` VALUES ('000040', '魅族', '1698.00', '魅族 16 X 全面屏游戏手机 6GB+64GB 砚墨黑 全网通移动联通电信4G手机 双卡双待', '000040.jpg');
INSERT INTO `blog_phones` VALUES ('000041', '魅族', '2298.00', '魅族 16th 全面屏游戏手机 6GB+64GB 静夜黑 全网通移动联通电信4G手机 双卡双待', '000041.png');
INSERT INTO `blog_phones` VALUES ('000042', '努比亚', '3399.00', '努比亚 nubia X 双面屏 深空灰 8GB+128GB 全网通 移动联通电信4G手机 双卡双待', '000042.jpg');
INSERT INTO `blog_phones` VALUES ('000043', '联想Z5', '1248.00', '联想Z5 6GB+128GB 极光蓝 6.2英寸全面屏双摄 全网通4G手机 双卡双待', '000043.jpg');
INSERT INTO `blog_phones` VALUES ('000044', '荣耀Magic2魔法手机', '3499.00', '荣耀Magic2魔法手机 麒麟980AI智能芯片 超广角AI三摄 6GB+128GB 渐变黑 移动联通电信4G 双卡双待', '000044.jpg');
INSERT INTO `blog_phones` VALUES ('000045', '华为', '649.00', '华为 HUAWEI 畅享8e青春 2GB+32GB全面屏 黑色 全网通版 移动联通电信4G手机 双卡双待', '000045.jpg');
INSERT INTO `blog_phones` VALUES ('000046', '锤子（smartisan', '1598.00', '锤子（smartisan ) 坚果 Pro 2S 6G+64GB 炫光蓝 全面屏双摄 全网通4G手机 双卡双待 游戏', '000046.jpg');
INSERT INTO `blog_phones` VALUES ('000047', '小米8', '2599.00', '小米8 全面屏游戏智能手机 6GB+128GB 蓝色 全网通4G 双卡双待', '000047.jpg');
INSERT INTO `blog_phones` VALUES ('000048', '小米Mix3', '3299.00', '小米Mix3 6GB+128GB黑色 骁龙845 全网通4G 双卡双待 全面屏拍照游戏智能手机', '000048.jpg');
INSERT INTO `blog_phones` VALUES ('000049', '联想K5', '1198.00', '联想K5 Pro 6GB+128GB 格调黑 千元影霸 1600万AI四摄 4050mAh大电池 全网通4G 双卡双待', '000049.png');
INSERT INTO `blog_phones` VALUES ('000050', '小米9', '3299.00', '小米9 xiaomi新品三摄 8GB+128GB全息幻彩蓝 骁龙855 全网通4G 双卡双待 水滴全面屏拍照游戏智能', '000050.jpg');
INSERT INTO `blog_phones` VALUES ('000051', '锤子（smartisan）', '2499.00', '锤子（smartisan） 坚果 R1 6G+128GB 碳黑色 全面屏双摄 全网通4G手机 双卡双待 游戏', '000051.jpg');
INSERT INTO `blog_phones` VALUES ('000052', '飞利浦', '178.00', '飞利浦 (PHILIPS) E279 极速灰 直板按键 移动联通2G 老人手机 老年机 老年功能机', '000052.jpg');
INSERT INTO `blog_phones` VALUES ('000053', '努比亚', '2499.00', '努比亚 nubia 红魔 全面屏 游戏手机 8GB+128GB 烈焰红 移动联通电信4G手机 双卡双待', '000053.jpg');
INSERT INTO `blog_phones` VALUES ('000054', '魅族', '1198.00', '魅族 15 全面屏手机 全网通公开版 4GB+64GB 砚黑 移动联通电信4G手机 双卡双待', '000054.jpg');
INSERT INTO `blog_phones` VALUES ('000055', '360手机', '1299.00', '360手机 N7 全网通 6GB+64GB 石墨黑 移动联通电信4G手机 双卡双待 全面屏 游戏', '000055.jpg');
INSERT INTO `blog_phones` VALUES ('000056', '魅族', '749.00', '魅族 V8 全面屏手机 4GB+64GB 曜黑 全网通移动联通电信4G手机 双卡双待', '000056.jpg');
INSERT INTO `blog_phones` VALUES ('000057', '飞利浦（PHILIPS）E108', '99.00', '飞利浦（PHILIPS）E108 陨石黑 直板按键 移动联通2G 双卡双待 老人手机 老年功能机 学生机备机', '000057.jpg');
INSERT INTO `blog_phones` VALUES ('000058', '小米8屏幕指纹版', '2699.00', '小米8屏幕指纹版 8GB+128GB 透明版 全网通4G 双卡双待 全面屏拍照游戏智能手机', '000058.jpg');
INSERT INTO `blog_phones` VALUES ('000059', 'vivo', '1049.00', 'vivo Z1青春版 新一代全面屏AI双摄手机 4GB+64GB 极光色 移动联通电信全网通4G', '000059.jpg');
INSERT INTO `blog_phones` VALUES ('000060', 'vivo', '1598.00', 'vivo Z3 6GB+64GB 极光蓝 性能实力派 全面屏游戏手机 移动联通电信全网通4G手机', '000060.jpg');
INSERT INTO `blog_phones` VALUES ('000061', '小米Max3', '1899.00', '小米Max3 大屏游戏智能手机 6GB+128GB 黑色 骁龙处理器 全网通4G 双卡双待', '000061.jpg');
INSERT INTO `blog_phones` VALUES ('000062', '360手机', '1399.00', '360手机 N7 Lite 全网通 6GB+128GB 幻影黑 移动联通电信4G手机 双卡双待 全面屏 游戏', '000062.jpg');
INSERT INTO `blog_phones` VALUES ('000063', '三星', '2498.00', '三星 Galaxy A9s (SM-A9200)全面屏手机 后置四摄 Bixby 6GB+128GB 鱼子黑 全网通4G 双卡双待', '000063.jpg');
INSERT INTO `blog_phones` VALUES ('000064', '华为（HUAWEI）', '528.00', '华为（HUAWEI） 荣耀 畅玩7 全网通 移动联通电信4G 全面屏智能老人手机 双卡双待 金色 (2G RAM+16G ROM)', '000064.jpg');
INSERT INTO `blog_phones` VALUES ('000065', '守护宝（上海中兴）F888', '178.00', '守护宝（上海中兴）F888 直板 按键 超长待机 三防老人手机 双卡双待 黑色 2G移动/联通版', '000065.jpg');
INSERT INTO `blog_phones` VALUES ('000066', '华为（HUAWEI）', '498.00', '华为（HUAWEI） 荣耀 畅玩7 智能老人手机 金色 全网通(2G+16G)', '000066.jpg');
INSERT INTO `blog_phones` VALUES ('000067', '小辣椒', '589.00', '小辣椒 红辣椒7R 6.0英寸 全面屏手机 3GB+32GB 渐变黑 全网通 移动联通电信4G 双卡双待', '000067.jpg');
INSERT INTO `blog_phones` VALUES ('000068', 'OPPO', '2599.00', 'OPPO 【6G版直降200+6期免息】R17 幻色渐变机身屏下指纹解锁手机 6.4英寸水滴屏 霓光紫 全网通(6G RAM+128G ROM)', '000068.jpg');
INSERT INTO `blog_phones` VALUES ('000069', 'OPPO', '2999.00', 'OPPO 【6期免息】R17 雾光金 幻色渐变机身屏下指纹解锁手机 6.4英寸手机 雾光金（8+128GB）', '000069.jpg');
INSERT INTO `blog_phones` VALUES ('000070', '三星', '1649.00', '三星 Galaxy A6s 6GB+128GB 撒浪黑 (SM-G6200) 全面屏 性价比智能手机 全网通4G 双卡双待', '000070.jpg');
INSERT INTO `blog_phones` VALUES ('000071', '小辣椒', '369.00', '小辣椒 红辣椒Q11 白色 2GB+16GB 全网通4G 双卡双待手机', '000071.jpg');
INSERT INTO `blog_phones` VALUES ('000072', '努比亚', '1599.00', '努比亚 nubia Z18mini 全面屏手机 6GB+128GB 青瓷蓝 移动联通电信4G手机 双卡双待', '000072.jpg');
INSERT INTO `blog_phones` VALUES ('000073', 'vivo', '4998.00', 'vivo NEX 双屏版 AI三摄 游戏手机 10GB+128GB 冰原蓝 移动联通电信全网通4G', '000073.jpg');
INSERT INTO `blog_phones` VALUES ('000074', '华为nova4e', '2299.00', '华为nova4e 手机 【免息送6件豪礼】 全网通双卡双待 幻夜黑 6GB+128GB 0首付3期免息', '000074.jpg');
INSERT INTO `blog_phones` VALUES ('000075', '飞利浦（PHILIPS）', '238.00', '飞利浦（PHILIPS） E316 深宝蓝 大屏超长待机 直板按键 移动联通2G 双卡双待 老人 学生备用功能机', '000075.jpg');
INSERT INTO `blog_phones` VALUES ('000076', '华为', '1999.00', '华为 HUAWEI 麦芒7 6G+64G 铂光金 全网通 前置智慧双摄 移动联通电信4G手机 双卡双待', '000076.jpg');
INSERT INTO `blog_phones` VALUES ('000077', '三星', '1698.00', '三星 Galaxy A9 Star 4GB+64GB 极夜黑（SM-G8850）全面屏手机 AI美拍 前后2400万像素 全网通4G 双卡双待', '000077.jpg');
INSERT INTO `blog_phones` VALUES ('000078', 'vivo【新品上市】U1全面屏', '799.00', 'vivo【新品上市】U1全面屏 AI智慧拍照 双卡双待 4G全网通 大电量智能手机y93 y97 极光红 3GB 32GB', '000078.jpg');
INSERT INTO `blog_phones` VALUES ('000079', '飞利浦（PHILIPS）E107', '99.00', '飞利浦（PHILIPS）E107 移动联通 老人手机 老年功能机 星空黑', '000079.jpg');
INSERT INTO `blog_phones` VALUES ('000080', '飞利浦（PHILIPS）E171L', '198.00', '飞利浦（PHILIPS）E171L 相思红 直板按键 移动联通 老人手机 老年功能机', '000080.jpg');
INSERT INTO `blog_phones` VALUES ('000081', '诺基亚', '499.00', '诺基亚 NOKIA 8110 移动联通4G手机 黄色 直板按键 双卡双待 经典复刻 炫酷滑盖 4G热点备用功能机', '000081.jpg');
INSERT INTO `blog_phones` VALUES ('000082', '【独角精灵版】三星', '2569.00', '【独角精灵版】三星 Galaxy A8s 6GB+128GB莓什么（SM-G8870）黑瞳全视屏 骁龙710芯片全网通4G 双卡双待', '000082.jpg');
INSERT INTO `blog_phones` VALUES ('000083', '努比亚', '2699.00', '努比亚 nubia Z18 全面屏3.0 极夜黑 8GB+128GB 全网通 移动联通电信4G手机 双卡双待', '000083.jpg');
INSERT INTO `blog_phones` VALUES ('000084', '小米8青春版', '1499.00', '小米8青春版 镜面渐变AI双摄 6GB+64GB 梦幻蓝 骁龙 全网通4G 双卡双待 全面屏拍照游戏智能', '000084.jpg');
INSERT INTO `blog_phones` VALUES ('000085', '飞利浦（PHILIPS）', '198.00', '飞利浦（PHILIPS） E151Y 电信版天翼直板老人手机 超长待机老年手机 学生备用功能机 陨石黑', '000085.jpg');
INSERT INTO `blog_phones` VALUES ('000086', 'OPPO', '1499.00', 'OPPO A7 全面屏拍照手机 4GB+64GB 清新粉 全网通 移动联通电信4G 双卡双待手机', '000086.jpg');
INSERT INTO `blog_phones` VALUES ('000087', '小米', '1658.00', '小米 红米Note7 Pro 手机 亮黑色 全网通 6G+128G', '000087.jpg');
INSERT INTO `blog_phones` VALUES ('000088', '华为（HUAWEI）', '497.00', '华为（HUAWEI） 荣耀 畅玩7手机 金色 全网通(2GB+16GB)', '000088.jpg');
INSERT INTO `blog_phones` VALUES ('000089', '华为（HUAWEI）华为荣耀9i手机', '1178.00', '华为（HUAWEI）华为荣耀9i手机 幻夜黑 全网通4GB+64GB', '000089.jpg');
INSERT INTO `blog_phones` VALUES ('000090', '华为（HUAWEI）', '3299.30', '华为（HUAWEI） 华为荣耀V20 手机 幻夜黑 【6期免息+碎屏险】全网通8G+128G', '000090.png');
INSERT INTO `blog_phones` VALUES ('000091', '诺基亚（NOKIA）新130', '159.00', '诺基亚（NOKIA）新130 黑色 直板按键 移动联通2G手机 双卡双待 老人手机 学生备用功能机', '000091.jpg');
INSERT INTO `blog_phones` VALUES ('000092', 'vivo', '1598.00', 'vivo Z1 新一代全面屏AI双摄游戏手机 6GB+64GB 瓷釉黑 移动联通电信全网通4G', '000092.jpg');
INSERT INTO `blog_phones` VALUES ('000093', '天语（K-TOUCH）E2', '139.00', '天语（K-TOUCH）E2 电信2G 直板按键老人手机 超长待机学生备用 老年机 铂光金', '000093.jpg');
INSERT INTO `blog_phones` VALUES ('000094', '诺基亚', '499.00', '诺基亚 NOKIA 8110 移动联通4G手机 黄色 直板按键 双卡双待 经典复刻 炫酷滑盖 4G热点备用功能机', '000094.jpg');
INSERT INTO `blog_phones` VALUES ('000095', '三星', '4699.00', '三星 Galaxy Note8（SM-N9500）6GB+256GB 谜夜黑 移动联通电信4G 游戏 双卡双待', '000095.jpg');
INSERT INTO `blog_phones` VALUES ('000096', '华为P30', '4288.00', '华为P30 手机【送6件豪礼 华为原厂直供现货速发 价保放心购】 亮黑色 全网通（8GB+128GB）屏内指纹', '000096.jpg');
INSERT INTO `blog_phones` VALUES ('000097', '纽曼（Newman）L9', '148.00', '纽曼（Newman）L9 星空黑 超长待机 直板按键 三防老人手机 双卡双待 学生备用 移动/联通版 老年人', '000097.jpg');
INSERT INTO `blog_phones` VALUES ('000098', '守护宝', '199.00', '守护宝 L660 典雅红 双屏翻盖 大屏大字 超长待机 移动联通2G 双卡双待 老人手机 学生备用功能机', '000098.jpg');
INSERT INTO `blog_phones` VALUES ('000099', '诺基亚（NOKIA）3310', '299.00', '诺基亚（NOKIA）3310 深蓝色 直板按键 移动联通2G手机 双卡双待 时尚手机 经典复刻 学生备用功能机', '000099.jpg');
INSERT INTO `blog_phones` VALUES ('000100', '小米', '1658.00', '小米 Redmi 红米Note7Pro 手机 亮黑色 6G+ 128GB 全网通', '000100.jpg');
INSERT INTO `blog_phones` VALUES ('000101', 'vivo', '1498.00', 'vivo Z1新一代全面屏 双摄拍照 6GB+64GB大内存手机 极光特别版', '000101.jpg');
INSERT INTO `blog_phones` VALUES ('000102', '小米9', '2299.00', '小米9 SE 4800万超广角三摄 骁龙712 水滴全面屏 游戏智能拍照手机 6GB+128GB 全息幻彩蓝 全网通4G双卡双待', '000102.jpg');
INSERT INTO `blog_phones` VALUES ('000103', '中兴ZTE', '1199.00', '中兴ZTE Blade V10 4GB+64GB 夜空黑 准旗舰CPU 3200万AI自拍 高清水滴屏 超强续航 双卡双待全网通4G', '000103.jpg');
INSERT INTO `blog_phones` VALUES ('000104', '【移动版特惠】三星', '3899.00', '【移动版特惠】三星 Galaxy Note8（SM-N9508）6G+64G 谜夜黑 移动4G+智 游戏 双卡双待', '000104.jpg');
INSERT INTO `blog_phones` VALUES ('000105', '【千玺代言】华为新品', '2699.00', '【千玺代言】华为新品 HUAWEI nova 3全面屏高清四摄游戏手机 海报级自拍 6GB+128GB 蓝楹紫全网通双卡双待', '000105.jpg');
INSERT INTO `blog_phones` VALUES ('000106', '飞利浦（PHILIPS）', '158.00', '飞利浦（PHILIPS） E183A 按键直板 老人手机 移动联通 双卡双待老年机 炫丽红', '000106.jpg');
INSERT INTO `blog_phones` VALUES ('000107', '魅族（MEIZU）', '729.00', '魅族（MEIZU） 魅族V8 4G手机【京东三仓现货24小时内发货211限时达】 曜黑 全网通（4+64G）高配', '000107.jpg');
INSERT INTO `blog_phones` VALUES ('000108', '天语（K-TOUCH）N1', '99.00', '天语（K-TOUCH）N1 老人手机 移动/联通 双卡双待 按键直板 老年学生备用功能机 金色', '000108.jpg');
INSERT INTO `blog_phones` VALUES ('000109', '小米9', '3299.80', '小米9 骁龙855 游戏手机 幻彩蓝 全网通 8G+128G', '000109.jpg');
INSERT INTO `blog_phones` VALUES ('000110', '诺基亚（NOKIA）新105', '139.00', '诺基亚（NOKIA）新105 黑色 直板按键 移动联通2G手机 老人手机 学生备用功能机', '000110.jpg');
INSERT INTO `blog_phones` VALUES ('000111', '华为（HUAWEI）', '3299.00', '华为（HUAWEI） 荣耀v20手机 幻夜黑 8+128G 全网通【6期免息】', '000111.jpg');
INSERT INTO `blog_phones` VALUES ('000112', '一加手机6', '2699.00', '一加手机6 8GB+128GB 月牙白 高通骁龙845 全面屏双摄游戏手机 全网通4G 双卡双待', '000112.jpg');
INSERT INTO `blog_phones` VALUES ('000113', '中兴（ZTE）A606移动联通电信全网通4G', '399.00', '中兴（ZTE）A606移动联通电信全网通4G 老年智能老人手机 黑色 (2G RAM+16G ROM)', '000113.jpg');
INSERT INTO `blog_phones` VALUES ('000114', 'OPPO', '2599.00', 'OPPO R17手机【低至2599元！6期免息+赠碎屏险+蓝牙耳机+私人定制】屏幕指纹 全网通 流光蓝（6G+128G） 官方标配', '000114.jpg');
INSERT INTO `blog_phones` VALUES ('000115', '华为（HUAWEI）', '758.00', '华为（HUAWEI） 华为畅享7 4G智能手机 香槟金 全网通(3G+32G)', '000115.jpg');
INSERT INTO `blog_phones` VALUES ('000116', '华为（HUAWEI）', '1145.00', '华为（HUAWEI） 华为畅享9 手机 幻夜黑 全网通4GB+64GB（分期免息0首付）', '000116.jpg');
INSERT INTO `blog_phones` VALUES ('000117', '华为（HUAWEI）', '1899.00', '华为（HUAWEI） 荣耀10青春版 手机 渐变蓝 全网通(6G+128G)', '000117.jpg');
INSERT INTO `blog_phones` VALUES ('000118', '中兴天机AXON', '3799.00', '中兴天机AXON 9Pro 8G+256G 超大广角 AI智能快拍 IP68防尘防水 双卡双待全网通', '000118.jpg');
INSERT INTO `blog_phones` VALUES ('000119', '飞利浦（PHILIPS）E133X', '238.00', '飞利浦（PHILIPS）E133X 陨石黑 电信CDMA 老人手机', '000119.png');
INSERT INTO `blog_phones` VALUES ('000120', 'OPPO', '2999.00', 'OPPO Reno手机 新品预约送一年碎屏险 4800万像素隐藏摄像头 全景屏拍照全网通 极夜黑 6G+128G 官网标配', '000120.jpg');
INSERT INTO `blog_phones` VALUES ('000121', '华为P30', '4288.00', '华为P30 手机 亮黑色 全网通(8G+128G)（分期免息0首付）', '000121.jpg');
INSERT INTO `blog_phones` VALUES ('000122', '华为（HUAWEI）', '505.00', '华为（HUAWEI） 荣耀 畅玩7 全网通4G全面屏智能老人手机 金色 全网通(2+16G)', '000122.png');
INSERT INTO `blog_phones` VALUES ('000123', 'HUAWEI', '1188.00', 'HUAWEI 华为畅享9 华为手机 极光蓝 4GB+64GB', '000123.jpg');
INSERT INTO `blog_phones` VALUES ('000124', '天语（K-TOUCH）Q21', '79.00', '天语（K-TOUCH）Q21 移动/联通2G 直板按键 双卡双待 老人手机 学生备用功能机 金色', '000124.jpg');
INSERT INTO `blog_phones` VALUES ('000125', '飞利浦（PHILIPS）E209J', '168.00', '飞利浦（PHILIPS）E209J 直板按键 移动联通 老人手机 老年功能机 皇家蓝', '000125.jpg');
INSERT INTO `blog_phones` VALUES ('000126', '华为nova4新品【6期免息当天发货送智能手环+移动电源】手机易烊千玺手机极点全面屏', '3299.00', '华为nova4新品【6期免息当天发货送智能手环+移动电源】手机易烊千玺手机极点全面屏 贝母白 4800万高配超广角三摄 8GB+128GB全网通', '000126.jpg');
INSERT INTO `blog_phones` VALUES ('000127', '海尔（Haier）', '198.00', '海尔（Haier） M360 老人手机 移动联通 双卡双待 老年机 红色 老年版', '000127.jpg');
INSERT INTO `blog_phones` VALUES ('000128', '一加手机6T', '3199.00', '一加手机6T 8GB+128GB 墨岩黑 超强城市夜景 光感屏幕指纹 全面屏双摄游戏手机 全网通4G 双卡双待', '000128.jpg');
INSERT INTO `blog_phones` VALUES ('000129', '飞利浦（PHILIPS）', '139.00', '飞利浦（PHILIPS） E163K 炫酷红 移动联通2G直板按键老人手机 双卡双待 超长待机 老年 学生备用功能机', '000129.jpg');
INSERT INTO `blog_phones` VALUES ('000130', '联想Z5s', '1497.00', '联想Z5s 6GB+64GB 星夜灰 骁龙710AIE 后置AI变焦三摄 6.3英寸水滴屏 渐变玻璃机身 全网通4G 双卡双待', '000130.jpg');
INSERT INTO `blog_phones` VALUES ('000131', '诺基亚（NOKIA）216', '299.00', '诺基亚（NOKIA）216 黑色 直板按键 移动联通2G手机 双卡双待 老人手机 学生备用功能机', '000131.jpg');
INSERT INTO `blog_phones` VALUES ('000132', '飞利浦（PHILIPS）E212A', '288.00', '飞利浦（PHILIPS）E212A 深锖色 翻盖按键 长待机 移动联通2G 双卡双待 老人手机 学生备用功能机', '000132.jpg');
INSERT INTO `blog_phones` VALUES ('000133', '华为（HUAWEI）荣耀畅玩8C', '928.00', '华为（HUAWEI）荣耀畅玩8C 移动联通电信全网通4G 全面屏智能老年老人手机 双卡双待 黑色 (4G RAM+32G ROM)', '000133.png');
INSERT INTO `blog_phones` VALUES ('000134', '华为（HUAWEI）华为mate20手机【6期免息送碎屏险】', '3499.00', '华为（HUAWEI）华为mate20手机【6期免息送碎屏险】 极光色 (6G+64G全网通)', '000134.png');
INSERT INTO `blog_phones` VALUES ('000135', '【直降至999元】OPPO', '999.00', '【直降至999元】OPPO A5 超视野全面屏拍照手机 3G+64G版 幻镜粉', '000135.jpg');
INSERT INTO `blog_phones` VALUES ('000136', '中兴ZTE', '1199.00', '中兴ZTE Blade V10 4GB+64GB 静湖绿 准旗舰CPU 3200万AI自拍 高清水滴屏 超强续航 双卡双待全网通4G', '000136.png');
INSERT INTO `blog_phones` VALUES ('000137', '华为nova4', '3299.00', '华为nova4 手机 苏音蓝 4800万超广角三摄（8G+128G）', '000137.jpg');
INSERT INTO `blog_phones` VALUES ('000138', '华为（HUAWEI）华为P20', '3788.00', '华为（HUAWEI）华为P20 Pro 手机 极光色 全网通6GB+128G【华为官方直供】', '000138.jpg');
INSERT INTO `blog_phones` VALUES ('000139', '华为P30', '6288.00', '华为P30 Pro 手机 超感光徕卡四摄10倍混合变焦50倍数码变焦【现货当天发免息送华为无线充】 天空之境 全网通（8G+128G）无线充电 屏内指纹', '000139.jpg');
INSERT INTO `blog_phones` VALUES ('000140', 'OPPO【3期免息】K1', '1699.00', 'OPPO【3期免息】K1 首款千元屏下指纹解锁手机 6.4英寸水滴屏 摩卡红（6+64G）套装版', '000140.jpg');
INSERT INTO `blog_phones` VALUES ('000141', '华为（HUAWEI）', '3299.80', '华为（HUAWEI） nova4手机 亮黑色 8G+128G 6期免息 4800万超广角三摄', '000141.jpg');
INSERT INTO `blog_phones` VALUES ('000142', '三星', '4499.00', '三星 Galaxy S9+ 6GB+64GB 夕雾紫 （SM-G9650/DS）全视曲面屏 智能可变光圈全网通4G 游戏 双卡双待', '000142.jpg');
INSERT INTO `blog_phones` VALUES ('000143', '华为（HUAWEI）', '1145.00', '华为（HUAWEI） 华为畅享9 手机 幻夜黑 全网通(4G+64G)（分期免息0首付）', '000143.png');
INSERT INTO `blog_phones` VALUES ('000144', '小辣椒', '369.00', '小辣椒 红辣椒Q11 白色 2GB+16GB 全网通4G 双卡双待手机', '000144.jpg');
INSERT INTO `blog_phones` VALUES ('000145', '华为（HUAWEI）', '3299.00', '华为（HUAWEI） 华为nova4 手机 苏音蓝 4800万 8GB+128GB（6期免息+碎屏险）', '000145.jpg');
INSERT INTO `blog_phones` VALUES ('000146', '华为（HUAWEI）', '499.00', '华为（HUAWEI） 荣耀7 畅玩7 手机 金色 全网通（2G+16G）', '000146.jpg');
INSERT INTO `blog_phones` VALUES ('000147', '中兴（ZTE）', '399.00', '中兴（ZTE） A606 全网4G 2GB运行+16GB内存 5.45英寸大屏 智能老人手机 黑色 2G+16G', '000147.jpg');
INSERT INTO `blog_phones` VALUES ('000148', '天语', '660.00', '天语 X21 刘海全面屏智能手机 全网通4G 移动联通电信 双卡双待一体机 蓝色 尊享版（3GB+64GB）', '000148.jpg');
INSERT INTO `blog_phones` VALUES ('000149', 'vivo【限时立减150】Z3高通骁龙处理器', '1448.00', 'vivo【限时立减150】Z3高通骁龙处理器 4+128G 水滴全面屏 双摄拍照手机 梦幻粉', '000149.jpg');
INSERT INTO `blog_phones` VALUES ('000150', '飞利浦（PHILIPS）', '149.00', '飞利浦（PHILIPS） E132X 香槟金 直板按键 超长待机 移动2G 双卡单待 老人手机 学生备用功能机', '000150.jpg');
INSERT INTO `blog_phones` VALUES ('000151', '华为p30麒麟980AI智能芯片全面屏屏内指纹超感光徕卡三摄手机', '4588.00', '华为p30麒麟980AI智能芯片全面屏屏内指纹超感光徕卡三摄手机 天空之境 全网通（8G+128G）', '000151.jpg');
INSERT INTO `blog_phones` VALUES ('000152', 'vivo', '1199.00', 'vivo U1 水滴全面屏 AI智慧拍照 4GB+64GB 移动联通电信全网通4G手机 星夜黑', '000152.jpg');
INSERT INTO `blog_phones` VALUES ('000153', '飞利浦（PHILIPS）E135X', '298.00', '飞利浦（PHILIPS）E135X 陨石黑 超长待机 移动联通 翻盖老人手机 老年机', '000153.jpg');
INSERT INTO `blog_phones` VALUES ('000154', '三星', '2498.00', '三星 Galaxy A9s (SM-A9200)全面屏手机 后置四摄 Bixby 6GB+128GB 鱼子黑 全网通4G 双卡双待', '000154.jpg');
INSERT INTO `blog_phones` VALUES ('000155', '华为（HUAWEI）', '1899.00', '华为（HUAWEI） 荣耀8X 手机 幻夜黑 全网通（6G+128G）', '000155.jpg');
INSERT INTO `blog_phones` VALUES ('000156', '【送一年碎屏保】小米', '1649.00', '【送一年碎屏保】小米 红米note7Pro 手机 亮黑色 全网通 6G+128G', '000156.jpg');
INSERT INTO `blog_phones` VALUES ('000157', '【自营配送', '1449.00', '【自营配送 豪礼套装】三星Galaxy A6s (SM-G6200)全面屏 性价比智能 撒浪黑 全网通(6G+64G)+3期免息套装', '000157.jpg');
INSERT INTO `blog_phones` VALUES ('000158', '华为nova4e', '1989.00', '华为nova4e 手机【6期免息+赠4重好礼】移动全网通 雀翎蓝 4G+128G', '000158.jpg');
INSERT INTO `blog_phones` VALUES ('000159', '小米9SE', '2349.00', '小米9SE 手机 幻彩蓝 全网通6GB+128GB', '000159.jpg');
INSERT INTO `blog_phones` VALUES ('000160', '华为P30', '6788.00', '华为P30 Pro手机【白条免息】全网通智能手机 天空之境 8G+256G 送原装耳机+数据线+音箱+3期免息', '000160.jpg');
INSERT INTO `blog_phones` VALUES ('000161', '华为P30', '4288.10', '华为P30 手机 亮黑色 全网通（8GB+128GB）', '000161.jpg');
INSERT INTO `blog_phones` VALUES ('000162', '小辣椒', '589.00', '小辣椒 红辣椒7R 6.0英寸 全面屏手机 3GB+32GB 渐变黑 全网通 移动联通电信4G 双卡双待', '000162.jpg');
INSERT INTO `blog_phones` VALUES ('000163', '天语（K-TOUCH）Q21', '69.00', '天语（K-TOUCH）Q21 移动/联通2G 直板按键 双卡双待 老人手机 学生备用功能机 红色', '000163.jpg');
INSERT INTO `blog_phones` VALUES ('000164', 'vivo', '899.00', 'vivo U1 水滴全面屏 双卡双待 4G全网通 智能手机 极光色【耳机套装】 3GB 32GB', '000164.jpg');
INSERT INTO `blog_phones` VALUES ('000165', 'UNNO', '599.00', 'UNNO 午诺P8 全网通4GB+64GB 移动联通电信 裸眼3D智能4g手机 双卡双待 黑色', '000165.jpg');
INSERT INTO `blog_phones` VALUES ('000166', '已降300元！OPPO', '999.00', '已降300元！OPPO A5 拍照手机【下单999元起+当天发货+碎屏险】全屏双摄全面屏大电池全网通 A5 (3G+32G) 凝夜紫', '000166.jpg');
INSERT INTO `blog_phones` VALUES ('000167', '华为（HUAWEI）畅享9', '1119.00', '华为（HUAWEI）畅享9 移动4G版全网通 双卡双待 全面屏智能老人老年手机 幻夜黑 (4G RAM+64G ROM)', '000167.jpg');
INSERT INTO `blog_phones` VALUES ('000168', '飞利浦（PHILIPS）', '229.00', '飞利浦（PHILIPS） E311 海军蓝 时尚环保 直板按键 长待机 移动联通2G 双卡双待 老人 学生备用功能机', '000168.jpg');
INSERT INTO `blog_phones` VALUES ('000169', '小米9透明尊享版', '3699.00', '小米9透明尊享版 手机 透明尊享版 全网通8GB+256GB', '000169.png');
INSERT INTO `blog_phones` VALUES ('000170', '联想K5', '1198.00', '联想K5 Pro 6GB+128GB 格调黑 千元影霸 1600万AI四摄 4050mAh大电池 全网通4G 双卡双待', '000170.png');
INSERT INTO `blog_phones` VALUES ('000171', '华为P30', '6788.10', '华为P30 pro 手机 天空之境 全网通（8GB+256GB）', '000171.jpg');
INSERT INTO `blog_phones` VALUES ('000172', '华为（HUAWEI）畅享9s', '1699.00', '华为（HUAWEI）畅享9s 手机 幻夜黑 全网通（4+128G）', '000172.jpg');
INSERT INTO `blog_phones` VALUES ('000173', 'vivo【限时优惠200', '1049.00', 'vivo【限时优惠200 低至999】Z1青春版 4GB+64GB全面屏AI双摄拍照 智能手机 极光色 4GB 64GB', '000173.jpg');
INSERT INTO `blog_phones` VALUES ('000174', '三星', '1299.00', '三星 Galaxy Folder2 （SM-G1650）2GB+16GB 帕托金 移动联通电信4G翻盖 双卡双待', '000174.jpg');
INSERT INTO `blog_phones` VALUES ('000175', '索爱', '239.00', '索爱 Z6 移动/联通老人手机 翻盖老年手机双屏双卡双待 金色', '000175.jpg');
INSERT INTO `blog_phones` VALUES ('000176', 'VJVJ', '549.00', 'VJVJ V21 全面屏 人脸指纹双识别 全网通4G智能手机 双卡双待 黑色', '000176.jpg');
INSERT INTO `blog_phones` VALUES ('000177', '华为（HUAWEI）', '1219.00', '华为（HUAWEI） 荣耀 9i 手机【下单即赠4重好礼】 幻夜黑 全网通 4GB+64GB', '000177.jpg');
INSERT INTO `blog_phones` VALUES ('000178', '三星', '2569.00', '三星 Galaxy A8s 6GB+128GB 外星银（SM-G8870）黑瞳全视屏手机 骁龙710芯片 后置三摄 全网通4G 双卡双待', '000178.jpg');
INSERT INTO `blog_phones` VALUES ('000179', '华为（HUAWEI）', '1299.00', '华为（HUAWEI） 荣耀 畅玩8C 手机 幻夜黑 全网通（4+64GB）', '000179.jpg');
INSERT INTO `blog_phones` VALUES ('000180', '飞利浦（PHILIPS）', '149.00', '飞利浦（PHILIPS） E132X 香槟金 直板按键 超长待机 移动2G 双卡单待 老人手机 学生备用功能机', '000180.jpg');
INSERT INTO `blog_phones` VALUES ('000181', '华为p30麒麟980AI智能芯片全面屏屏内指纹超感光徕卡三摄手机', '4588.00', '华为p30麒麟980AI智能芯片全面屏屏内指纹超感光徕卡三摄手机 天空之境 全网通（8G+128G）', '000181.jpg');
INSERT INTO `blog_phones` VALUES ('000182', 'vivo', '1199.00', 'vivo U1 水滴全面屏 AI智慧拍照 4GB+64GB 移动联通电信全网通4G手机 星夜黑', '000182.jpg');
INSERT INTO `blog_phones` VALUES ('000183', '飞利浦（PHILIPS）E135X', '298.00', '飞利浦（PHILIPS）E135X 陨石黑 超长待机 移动联通 翻盖老人手机 老年机', '000183.jpg');
INSERT INTO `blog_phones` VALUES ('000184', '三星', '2498.00', '三星 Galaxy A9s (SM-A9200)全面屏手机 后置四摄 Bixby 6GB+128GB 鱼子黑 全网通4G 双卡双待', '000184.jpg');
INSERT INTO `blog_phones` VALUES ('000185', '华为（HUAWEI）', '1899.00', '华为（HUAWEI） 荣耀8X 手机 幻夜黑 全网通（6G+128G）', '000185.jpg');
INSERT INTO `blog_phones` VALUES ('000186', '【送一年碎屏保】小米', '1649.00', '【送一年碎屏保】小米 红米note7Pro 手机 亮黑色 全网通 6G+128G', '000186.jpg');
INSERT INTO `blog_phones` VALUES ('000187', '【自营配送', '1449.00', '【自营配送 豪礼套装】三星Galaxy A6s (SM-G6200)全面屏 性价比智能 撒浪黑 全网通(6G+64G)+3期免息套装', '000187.jpg');
INSERT INTO `blog_phones` VALUES ('000188', '华为nova4e', '1989.00', '华为nova4e 手机【6期免息+赠4重好礼】移动全网通 雀翎蓝 4G+128G', '000188.jpg');
INSERT INTO `blog_phones` VALUES ('000189', '小米9SE', '2349.00', '小米9SE 手机 幻彩蓝 全网通6GB+128GB', '000189.jpg');
INSERT INTO `blog_phones` VALUES ('000190', '华为P30', '6788.00', '华为P30 Pro手机【白条免息】全网通智能手机 天空之境 8G+256G 送原装耳机+数据线+音箱+3期免息', '000190.jpg');
INSERT INTO `blog_phones` VALUES ('000191', '华为P30', '4288.10', '华为P30 手机 亮黑色 全网通（8GB+128GB）', '000191.jpg');
INSERT INTO `blog_phones` VALUES ('000192', '小辣椒', '589.00', '小辣椒 红辣椒7R 6.0英寸 全面屏手机 3GB+32GB 渐变黑 全网通 移动联通电信4G 双卡双待', '000192.jpg');
INSERT INTO `blog_phones` VALUES ('000193', '天语（K-TOUCH）Q21', '69.00', '天语（K-TOUCH）Q21 移动/联通2G 直板按键 双卡双待 老人手机 学生备用功能机 红色', '000193.jpg');
INSERT INTO `blog_phones` VALUES ('000194', 'vivo', '899.00', 'vivo U1 水滴全面屏 双卡双待 4G全网通 智能手机 极光色【耳机套装】 3GB 32GB', '000194.jpg');
INSERT INTO `blog_phones` VALUES ('000195', 'UNNO', '599.00', 'UNNO 午诺P8 全网通4GB+64GB 移动联通电信 裸眼3D智能4g手机 双卡双待 黑色', '000195.jpg');
INSERT INTO `blog_phones` VALUES ('000196', '已降300元！OPPO', '999.00', '已降300元！OPPO A5 拍照手机【下单999元起+当天发货+碎屏险】全屏双摄全面屏大电池全网通 A5 (3G+32G) 凝夜紫', '000196.jpg');
INSERT INTO `blog_phones` VALUES ('000197', '华为（HUAWEI）畅享9', '1119.00', '华为（HUAWEI）畅享9 移动4G版全网通 双卡双待 全面屏智能老人老年手机 幻夜黑 (4G RAM+64G ROM)', '000197.jpg');
INSERT INTO `blog_phones` VALUES ('000198', '飞利浦（PHILIPS）', '229.00', '飞利浦（PHILIPS） E311 海军蓝 时尚环保 直板按键 长待机 移动联通2G 双卡双待 老人 学生备用功能机', '000198.jpg');
INSERT INTO `blog_phones` VALUES ('000199', '小米9透明尊享版', '3699.00', '小米9透明尊享版 手机 透明尊享版 全网通8GB+256GB', '000199.png');
INSERT INTO `blog_phones` VALUES ('000200', '联想K5', '1198.00', '联想K5 Pro 6GB+128GB 格调黑 千元影霸 1600万AI四摄 4050mAh大电池 全网通4G 双卡双待', '000200.png');
INSERT INTO `blog_phones` VALUES ('000201', '华为P30', '6788.10', '华为P30 pro 手机 天空之境 全网通（8GB+256GB）', '000201.jpg');
INSERT INTO `blog_phones` VALUES ('000202', '华为（HUAWEI）畅享9s', '1699.00', '华为（HUAWEI）畅享9s 手机 幻夜黑 全网通（4+128G）', '000202.jpg');
INSERT INTO `blog_phones` VALUES ('000203', 'vivo【限时优惠200', '1049.00', 'vivo【限时优惠200 低至999】Z1青春版 4GB+64GB全面屏AI双摄拍照 智能手机 极光色 4GB 64GB', '000203.jpg');
INSERT INTO `blog_phones` VALUES ('000204', '三星', '1299.00', '三星 Galaxy Folder2 （SM-G1650）2GB+16GB 帕托金 移动联通电信4G翻盖 双卡双待', '000204.jpg');
INSERT INTO `blog_phones` VALUES ('000205', '索爱', '239.00', '索爱 Z6 移动/联通老人手机 翻盖老年手机双屏双卡双待 金色', '000205.jpg');
INSERT INTO `blog_phones` VALUES ('000206', 'VJVJ', '549.00', 'VJVJ V21 全面屏 人脸指纹双识别 全网通4G智能手机 双卡双待 黑色', '000206.jpg');
INSERT INTO `blog_phones` VALUES ('000207', '华为（HUAWEI）', '1219.00', '华为（HUAWEI） 荣耀 9i 手机【下单即赠4重好礼】 幻夜黑 全网通 4GB+64GB', '000207.jpg');
INSERT INTO `blog_phones` VALUES ('000208', '三星', '2569.00', '三星 Galaxy A8s 6GB+128GB 外星银（SM-G8870）黑瞳全视屏手机 骁龙710芯片 后置三摄 全网通4G 双卡双待', '000208.jpg');
INSERT INTO `blog_phones` VALUES ('000209', '华为（HUAWEI）', '1299.00', '华为（HUAWEI） 荣耀 畅玩8C 手机 幻夜黑 全网通（4+64GB）', '000209.jpg');
INSERT INTO `blog_phones` VALUES ('000210', '华为（HUAWEI）', '3299.30', '华为（HUAWEI） 华为荣耀V20 手机 幻夜黑 【6期免息+碎屏险】全网通8G+128G', '000210.png');
INSERT INTO `blog_phones` VALUES ('000211', '华为（HUAWEI）', '3999.00', '华为（HUAWEI） 华为Mate20 手机 亮黑色 全网通(6G+128G)（6期免息0首付）', '000211.png');
INSERT INTO `blog_phones` VALUES ('000212', '酷派（Coolpad）', '399.00', '酷派（Coolpad） 8737A 移动4G+ 全网通智能老人手机 双卡双待 锐志金 （2GRAM+16G ROM）', '000212.jpg');
INSERT INTO `blog_phones` VALUES ('000213', '守护宝（上海中兴）U288+', '188.00', '守护宝（上海中兴）U288+ 黑色 环保材质 直板按键 超长待机 移动联通2G 老人 学生备用功能机', '000213.jpg');
INSERT INTO `blog_phones` VALUES ('000214', 'AGM', '1549.00', 'AGM H1 户外三防智能手机防水防摔JBL大喇叭音乐手机双卡双待超长待机智能老人 枪黑 4G+32G', '000214.png');
INSERT INTO `blog_phones` VALUES ('000215', 'HAIYU', '129.90', 'HAIYU H6（6800毫安）电信三防老人机天翼2G电霸老人手机 黑金', '000215.jpg');
INSERT INTO `blog_phones` VALUES ('000216', 'OPPO', '2599.00', 'OPPO R17 手机【6期免息+送屏碎保+蓝牙耳机等+私人定制】指纹解锁大屏游戏拍照全网通双卡双待 R17 霓光紫(6GB+128GB)', '000216.jpg');
INSERT INTO `blog_phones` VALUES ('000217', '小米（MI）', '520.00', '小米（MI） 红米6A 智能老人手机 全网通 2G+16G 流沙金', '000217.jpg');
INSERT INTO `blog_phones` VALUES ('000218', '联想Z5', '1998.00', '联想Z5 Pro 6GB+64GB 陶瓷黑 滑盖全面屏 2400万AI四摄 光电屏下指纹 全网通4G 双卡双待', '000218.jpg');
INSERT INTO `blog_phones` VALUES ('000219', '酷派（Coolpad）', '168.00', '酷派（Coolpad） S158 电信2g 老人手机 黑色', '000219.jpg');
INSERT INTO `blog_phones` VALUES ('000220', '华为（HUAWEI）', '1183.00', '华为（HUAWEI） 荣耀9i手机 幻夜黑 全网通(4G+64G)', '000220.jpg');
INSERT INTO `blog_phones` VALUES ('000221', 'Apple', '2648.00', 'Apple 苹果 iPhone 6s Plus 4G手机 玫瑰金 全网通 32GB', '000221.jpg');
INSERT INTO `blog_phones` VALUES ('000222', '红米Redmi', '1666.00', '红米Redmi Note7Pro 手机 梦幻蓝 6GB 128GB', '000222.jpg');
INSERT INTO `blog_phones` VALUES ('000223', '飞利浦（PHILIPS）', '199.00', '飞利浦（PHILIPS） E331K 古铜棕 直板 按键 老年手机 移动联通2G 双卡双待 老人 学生备用功能机', '000223.jpg');
INSERT INTO `blog_phones` VALUES ('000224', 'OPPO', '1599.00', 'OPPO A7x【已降300元到手1400起+送高保真耳机+碎屏险】指纹识别解锁手机 全网通双卡双待 A7x 星空紫(4G+128G)', '000224.jpg');
INSERT INTO `blog_phones` VALUES ('000225', '纽曼NewmanF188移动联通电信翻盖老人手机', '98.00', '纽曼NewmanF188移动联通电信翻盖老人手机 红色移动版', '000225.jpg');
INSERT INTO `blog_phones` VALUES ('000226', '小辣椒', '899.00', '小辣椒 红辣椒8X 4+64GB 学生智能手机 水滴屏 美颜双摄 微Q多开 人脸识别 移动联通电信4G全网通 流光紫', '000226.jpg');
INSERT INTO `blog_phones` VALUES ('000227', '天语（K-TOUCH）Q21C', '139.00', '天语（K-TOUCH）Q21C 电信2G 直板按键老人手机 超长待机学生备用 老年机 幻夜黑', '000227.jpg');
INSERT INTO `blog_phones` VALUES ('000228', '飞利浦', '319.00', '飞利浦 PHILIPS E259S 宝石蓝 双屏翻盖 大屏大字 长待机 移动联通2G 双卡双待 老人 学生备用功能机', '000228.jpg');
INSERT INTO `blog_phones` VALUES ('000229', '魅族（MEIZU）', '1138.00', '魅族（MEIZU） 魅族15 全面屏游戏手机 黑色 全网通（4+64G）', '000229.jpg');
INSERT INTO `blog_phones` VALUES ('000230', 'OPPO【6期免息】R17', '2999.00', 'OPPO【6期免息】R17 幻色渐变机身屏下指纹解锁手机 6.4英寸水滴屏 雾光渐变色 全网通(8G RAM+128G ROM)', '000230.jpg');
INSERT INTO `blog_phones` VALUES ('000231', 'OPPO', '1199.00', 'OPPO A5【直降300元，低至999元+90天碎屏险】全面屏双摄拍照千元大电量 幻镜粉 (4G+64G)全网通', '000231.jpg');
INSERT INTO `blog_phones` VALUES ('000232', '天语（K-TOUCH）V6', '199.00', '天语（K-TOUCH）V6 翻盖老人手机 移动/联通双卡双待 超长待机 备用老年功能机 红色', '000232.jpg');
INSERT INTO `blog_phones` VALUES ('000233', '飞利浦（PHILIPS）', '179.00', '飞利浦（PHILIPS） E152Y 皇家蓝 移动联通2G直板按键老人手机 双卡双待 老年手机 学生备用功能机', '000233.jpg');
INSERT INTO `blog_phones` VALUES ('000234', '联想Z5s', '1497.00', '联想Z5s 6GB+64GB 钛晶蓝 骁龙710AIE 后置AI变焦三摄 6.3英寸水滴屏 渐变玻璃机身 全网通4G 双卡双待', '000234.jpg');
INSERT INTO `blog_phones` VALUES ('000235', '酷派（Coolpad）', '269.00', '酷派（Coolpad） 智能老人手机 5267 移动联通电信4G 学生机 白色 全网通单卡版 (1G RAM+8G ROM）', '000235.jpg');
INSERT INTO `blog_phones` VALUES ('000236', '【3期免息赠5重好礼】华为畅享9S', '1699.00', '【3期免息赠5重好礼】华为畅享9S 手机 幻夜黑 全网通 4G+128G', '000236.jpg');
INSERT INTO `blog_phones` VALUES ('000237', '华为（HUAWEI）', '818.00', '华为（HUAWEI） 荣耀 V9 play 移动联通电信全网通4G 智能老人手机双卡双待 铂光金(3GB RAM+32GB ROM)', '000237.jpg');
INSERT INTO `blog_phones` VALUES ('000238', '朵唯DOOV', '699.00', '朵唯DOOV D1水滴全面屏全网通4G移动联通电信双卡双待 超薄智能手机女性学生老人微信八开 梦幻紫 4GB+64GB', '000238.jpg');
INSERT INTO `blog_phones` VALUES ('000239', 'OPPO【3期免息】K1首款千元屏下指纹解锁拍照手机', '1599.00', 'OPPO【3期免息】K1首款千元屏下指纹解锁拍照手机 6.4英寸水滴全面屏 银光绿（6G+64G）', '000239.png');
INSERT INTO `blog_phones` VALUES ('000240', '华为（HUAWEI）华为P20', '3349.00', '华为（HUAWEI）华为P20 手机 极光色 全网通6GB+128G【华为官方直供】', '000240.jpg');
INSERT INTO `blog_phones` VALUES ('000241', '已降300！OPPO', '1199.00', '已降300！OPPO A5手机【3G版到手999元起4G版仅1199+碎屏险】美颜拍照大屏双摄全网通 A5 幻镜粉(4G+64G)', '000241.jpg');
INSERT INTO `blog_phones` VALUES ('000242', '华为（HUAWEI）', '2398.00', '华为（HUAWEI） 华为荣耀Note10 手机 幻夜黑 全网通6GB+128GB', '000242.jpg');
INSERT INTO `blog_phones` VALUES ('000243', '守护宝（上海中兴）N1', '99.00', '守护宝（上海中兴）N1 直板按键 超长待机 典雅红 2G移动联通 老人手机 学生备用机', '000243.jpg');
INSERT INTO `blog_phones` VALUES ('000244', 'GlocalMe', '999.00', 'GlocalMe 移动超人S1自带100GB全国流量4+64GB八核旗舰 前置指纹 自带流量手机 黑色 VIP畅享流量全国包年', '000244.jpg');
INSERT INTO `blog_phones` VALUES ('000245', '华为（HUAWEI）', '599.00', '华为（HUAWEI） 荣耀 畅玩7 手机 黑色 全网通 2GB+16GB', '000245.jpg');
INSERT INTO `blog_phones` VALUES ('000246', '华为（HUAWEI）', '2348.00', '华为（HUAWEI） 华为Nova3 手机 亮黑色 全网通6GB+128GB尊享版', '000246.jpg');
INSERT INTO `blog_phones` VALUES ('000247', '酷派（Coolpad）', '338.00', '酷派（Coolpad） 锋尚N3C 移动联通电信全网通4G 全面屏智能老年老人手机 双卡双待 钛晶灰 (2G RAM+16G ROM)', '000247.jpg');
INSERT INTO `blog_phones` VALUES ('000248', '华为mate20', '3999.00', '华为mate20 手机 【免息赠7件豪礼】 全网通双卡双待 极光色 （6GB+128GB）送豪礼+0首付分期免息', '000248.jpg');
INSERT INTO `blog_phones` VALUES ('000249', '不羁（unruly）', '89.00', '不羁（unruly） C6电信2G 老人手机电信版 黑色', '000249.jpg');
INSERT INTO `blog_phones` VALUES ('000250', '小米', '1698.00', '小米 红米Redmi 红米Note7Pro 手机 暮光金 全网通(6G+128G)', '000250.png');
INSERT INTO `blog_phones` VALUES ('000251', '多亲（QIN）QF9', '299.00', '多亲（QIN）QF9 AI功能电话老人手机双卡双待 移动联通4G手机 电信volte 远程定位 深灰色', '000251.jpg');
INSERT INTO `blog_phones` VALUES ('000252', 'OPPO', '3099.00', 'OPPO R17 新品全面屏手机 【6G已降200】 全网通游戏手机 屏下指纹 双卡双待 拍照 8G+128G 霓光紫 超值套餐', '000252.jpg');
INSERT INTO `blog_phones` VALUES ('000253', '诺基亚（NOKIA）新款105', '139.00', '诺基亚（NOKIA）新款105 移动2G老人机 学生手机 备用功能机 蓝色 单卡', '000253.jpg');
INSERT INTO `blog_phones` VALUES ('000254', '华为（HUAWEI）', '1398.00', '华为（HUAWEI） nova 2S 全面屏手机 全网通 浅艾蓝（4G+64G）', '000254.jpg');
INSERT INTO `blog_phones` VALUES ('000255', '小米（MI）', '521.00', '小米（MI） 小米6A 红米6A 手机 巴厘蓝 全网通 2G+16G', '000255.png');
INSERT INTO `blog_phones` VALUES ('000256', 'Apple', '5528.00', 'Apple 苹果 iPhone XR (A2108) 【送无线充电器】手机 黑色 全网通 128GB', '000256.jpg');
INSERT INTO `blog_phones` VALUES ('000257', 'MOQI', '2299.00', 'MOQI 摩奇i7s游戏手机 高通全网通4G 内置手柄 液冷散热 超长待机 双卡双待 黑色', '000257.png');
INSERT INTO `blog_phones` VALUES ('000258', '华为（HUAWEI）', '1799.00', '华为（HUAWEI） 华为畅享9 plus 全面屏手机 幻夜黑 全网通（6GB+128GB）', '000258.jpg');
INSERT INTO `blog_phones` VALUES ('000259', 'vivo', '1498.00', 'vivo Y93s 4G+128G 极光蓝 水滴屏全面屏 移动联通电信全网通4G手机 双卡双待', '000259.jpg');
INSERT INTO `blog_phones` VALUES ('000260', 'OPPO', '999.00', 'OPPO A5【直降300低至999+90天碎屏保】移动联通电信4G 双卡双待手机 全网通 幻境蓝（3G+64G） 官方标配', '000260.jpg');
INSERT INTO `blog_phones` VALUES ('000261', '华为（HUAWEI）荣耀9i', '1228.00', '华为（HUAWEI）荣耀9i 全网通 智能手机 黑色 4G+64G', '000261.jpg');
INSERT INTO `blog_phones` VALUES ('000262', '华为（HUAWEI）', '1249.10', '华为（HUAWEI） 畅享9 高清珍珠屏AI长续航全网通手机【送移动电源+耳机+钢化膜】 幻夜黑 4+64GB（分期免息0首付）', '000262.jpg');
INSERT INTO `blog_phones` VALUES ('000263', '【送一年碎屏保】小米（MI）', '1188.00', '【送一年碎屏保】小米（MI） 红米note7小金刚手机 梦幻蓝 4GB+64GB全网通', '000263.jpg');
INSERT INTO `blog_phones` VALUES ('000264', 'OPPO', '2299.00', 'OPPO 【领券减100+3期免息】R15x 屏下指纹水滴全面屏 6G+128G手机 冰萃银', '000264.jpg');
INSERT INTO `blog_phones` VALUES ('000265', '华为（HUAWEI）', '5499.00', '华为（HUAWEI） 华为Mate20pro 手机 亮黑色 全网通(8G+128G)(UD版 屏内解锁)', '000265.png');
INSERT INTO `blog_phones` VALUES ('000266', '华为（HUAWEI）', '518.00', '华为（HUAWEI） 荣耀 畅玩7 全网通 移动联通电信4G 智能老人手机 双卡双待 黑色 2G+16G', '000266.jpg');
INSERT INTO `blog_phones` VALUES ('000267', '小米（MI）', '649.00', '小米（MI） 红米6A 移动联通电信全网通4G 老年智能老人手机 双卡双待 樱花粉 (3G RAM+32G ROM)', '000267.jpg');
INSERT INTO `blog_phones` VALUES ('000268', '联想S5', '798.00', '联想S5 4G+64G 星夜黑 全金属一体化机身 FHD+ 全面屏双摄 全网通4G手机 双卡双待', '000268.jpg');
INSERT INTO `blog_phones` VALUES ('000269', '诺基亚（NOKIA）', '368.00', '诺基亚（NOKIA） 3310 4G版 移动4G版 老人老年手机 深沉黑', '000269.jpg');
INSERT INTO `blog_phones` VALUES ('000270', '荣耀畅玩7C', '899.00', '荣耀畅玩7C 全面屏手机 全网通标配版 3GB+32GB 铂光金 移动联通电信4G手机 双卡双待', '000270.jpg');
INSERT INTO `blog_phones` VALUES ('000271', '华为（HUAWEI）', '529.00', '华为（HUAWEI） 荣耀畅玩7 移动联通电信4G 智能老人手机 蓝色 全网通(2G+16G)', '000271.jpg');
INSERT INTO `blog_phones` VALUES ('000272', '誉品（YEPEN）', '499.00', '誉品（YEPEN） i7s 全网通4G智能手机 双卡双待 大屏学生老人机老年手机 黑色', '000272.jpg');
INSERT INTO `blog_phones` VALUES ('000273', '8848', '12999.00', '8848 钛金手机M5尊享版智能商务加密轻奢手机双卡双待全网通4G 8核256G内存 黑色', '000273.jpg');
INSERT INTO `blog_phones` VALUES ('000274', '小米9SE', '2349.00', '小米9SE 游戏手机 骁龙712 幻彩蓝 全网通(6GB RAM+128GB ROM)', '000274.jpg');
INSERT INTO `blog_phones` VALUES ('000275', '黑莓（BlackBerry）KEY2标准版', '3699.00', '黑莓（BlackBerry）KEY2标准版 6GB+64GB双卡双待 4G全网通手机 黑色 移动联通电信', '000275.jpg');
INSERT INTO `blog_phones` VALUES ('000276', '华为mate20', '3999.00', '华为mate20 手机【6期免息赠原装皮套+一年碎屏险】 极光色 全网通 6G+128G', '000276.jpg');
INSERT INTO `blog_phones` VALUES ('000277', 'OPPO', '2999.00', 'OPPO R17【8G版已降200仅2999元+6期免息+碎屏险+智能手环】屏幕指纹解锁拍照游戏 R17 雾光金(8GB+128GB)', '000277.jpg');
INSERT INTO `blog_phones` VALUES ('000278', '华为', '1699.00', '华为 HUAWEI 畅享 9S 全网通 双卡双待 珍珠屏智能游戏手机 幻夜黑 4GB+128GB', '000278.jpg');
INSERT INTO `blog_phones` VALUES ('000279', '华为（HUAWEI）', '623.90', '华为（HUAWEI） 畅享8e青春版 智能老人手机 金色 全网通 2G+32G', '000279.jpg');
INSERT INTO `blog_phones` VALUES ('000280', '诺基亚（NOKIA）X6', '968.00', '诺基亚（NOKIA）X6 全网通版移动联通电信4G 智能老人老年全面屏手机 双卡双待 星空黑 (4G RAM+64G ROM)', '000280.jpg');
INSERT INTO `blog_phones` VALUES ('000281', '360', '1368.00', '360 N7 Lite 移动联通电信全网通4G 全面屏智能老人老年手机 双卡双待 幻影黑 (6G RAM+128G ROM)', '000281.jpg');
INSERT INTO `blog_phones` VALUES ('000282', '荣耀10青春版', '1899.00', '荣耀10青春版 手机 【6期白条免息 下单立送多重豪礼】 渐变黑 全网通（6+128GB）', '000282.jpg');
INSERT INTO `blog_phones` VALUES ('000283', '华为（HUAWEI）', '3349.00', '华为（HUAWEI） P20 全面屏 手机 极光 全网通（6G+128G）', '000283.jpg');
INSERT INTO `blog_phones` VALUES ('000284', '小米（MI）', '798.00', '小米（MI） 红米6 智能老人手机 铂银灰 全网通 4G+64G', '000284.jpg');
INSERT INTO `blog_phones` VALUES ('000285', '守护宝（上海中兴）CV28', '199.00', '守护宝（上海中兴）CV28 直板按键 超长待机 电信2G老人手机 学生备用功能机 暮光黑', '000285.jpg');
INSERT INTO `blog_phones` VALUES ('000286', 'OPPO【直降200+6期免息】R17屏下指纹手机', '2599.00', 'OPPO【直降200+6期免息】R17屏下指纹手机', '000286.jpg');
INSERT INTO `blog_phones` VALUES ('000287', '【自营配送', '2498.00', '【自营配送 豪礼套装】三星Galaxy A9s 6G+128G 后置四摄 全面屏手机 柠沁蓝 全网通（6G+128G）送3期免息+1万毫安充电宝', '000287.jpg');
INSERT INTO `blog_phones` VALUES ('000288', '【购机赠碎屏险】华为畅享9e', '999.00', '【购机赠碎屏险】华为畅享9e 手机 幻夜黑（3G+64G） 全网通', '000288.jpg');
INSERT INTO `blog_phones` VALUES ('000289', '华为（HUAWEI）', '1139.00', '华为（HUAWEI） 华为畅享9 手机 幻夜黑 4G+64G', '000289.jpg');
INSERT INTO `blog_phones` VALUES ('000290', '飞利浦（PHILIPS）', '319.00', '飞利浦（PHILIPS） E259S 翻盖手机 老人机 移动/联通 大屏老年机 双卡双待 陨石黑', '000290.png');
INSERT INTO `blog_phones` VALUES ('000291', '诺基亚（NOKIA）', '139.00', '诺基亚（NOKIA） 诺基亚 105/106 移动联通2G手机 新诺基亚105 黑色(单卡) 老人机 直板学生', '000291.jpg');
INSERT INTO `blog_phones` VALUES ('000292', '华为（HUAWEI）', '1728.00', '华为（HUAWEI） 荣耀Play 游戏手机 幻夜黑 全网通6GB+64GB', '000292.jpg');
INSERT INTO `blog_phones` VALUES ('000293', '魅族（MEIZU）魅族魅蓝S6手机', '719.00', '魅族（MEIZU）魅族魅蓝S6手机 月光银 全网通（3GB+32GB）', '000293.jpg');
INSERT INTO `blog_phones` VALUES ('000294', '欧奇（OUKI）', '3999.00', '欧奇（OUKI） K10 一万毫安大电池 超长待机续航智能手机 6+128GB 全网通4G 轻奢商务 双卡双待 黑色', '000294.png');
INSERT INTO `blog_phones` VALUES ('000295', '多亲（QIN）QF9', '299.00', '多亲（QIN）QF9 AI功能电话老人手机双卡双待 移动联通4G手机 电信volte 远程定位 深灰色', '000295.jpg');
INSERT INTO `blog_phones` VALUES ('000296', '【白条免息】华为（HUAWEI）', '1299.00', '【白条免息】华为（HUAWEI） 荣耀10青春版 全网通智能手机 渐变蓝 4G+64G赠荣耀原装耳机+蓝牙', '000296.jpg');
INSERT INTO `blog_phones` VALUES ('000297', '华为（HUAWEI）', '1878.00', '华为（HUAWEI） 华为nova3i 手机 蓝楹紫 全网通(6G+128G)', '000297.jpg');
INSERT INTO `blog_phones` VALUES ('000298', '小米（MI）', '529.00', '小米（MI） 红米6A手机 樱花粉 全网通2G+16G', '000298.jpg');
INSERT INTO `blog_phones` VALUES ('000299', '魅族（MEIZU）', '2788.00', '魅族（MEIZU） 魅族16th Plus 游戏手机 远山白 全网通8GB+128GB', '000299.png');
INSERT INTO `blog_phones` VALUES ('000300', '华为（HUAWEI）荣耀V20', '3799.00', '华为（HUAWEI）荣耀V20 手机 全网通 幻影红(8+256G)联名版 赠6期免息+原装耳机', '000300.jpg');
INSERT INTO `blog_phones` VALUES ('000301', '华为（HUAWEI）', '1899.10', '华为（HUAWEI） 荣耀10青春版 全网通 华为手机 幻夜黑 全网通 6GB+128GB分期免息版', '000301.jpg');
INSERT INTO `blog_phones` VALUES ('000302', '荣耀8x', '1599.00', '荣耀8x 手机【6期白条免息】 幻影蓝 全网通6GB+64GB（高配版）', '000302.jpg');
INSERT INTO `blog_phones` VALUES ('000303', '华为mate20pro【3期免息赠原装无线充+1年碎屏险】手机', '5499.00', '华为mate20pro【3期免息赠原装无线充+1年碎屏险】手机 翡冷翠 8GB+128GB 全网通(UD屏内指纹版）', '000303.png');
INSERT INTO `blog_phones` VALUES ('000304', '华为（HUAWEI）', '2378.00', '华为（HUAWEI） 荣耀10 GT游戏手机 幻影蓝 全网通6GB+128GB尊享版', '000304.jpg');
INSERT INTO `blog_phones` VALUES ('000305', '华为', '1699.00', '华为 荣耀10 青春版 手机 幻夜黑 全网通(6G+64G)蓝牙音箱+碎屏险+6期免息', '000305.png');
INSERT INTO `blog_phones` VALUES ('000306', '小米（MI）', '829.00', '小米（MI） 红米6全网通4G智能手机 铂银灰 4G+64G', '000306.png');
INSERT INTO `blog_phones` VALUES ('000307', '美图（meitu）V7', '3999.00', '美图（meitu）V7 (MP1801) 赤霞橙光 智能美颜 全身美型 8+128G 双卡双待 全网通', '000307.jpg');
INSERT INTO `blog_phones` VALUES ('000308', '魅族（MEIZU）', '2638.00', '魅族（MEIZU） 魅族16th 游戏手机 静夜黑 全网通8GB+128GB', '000308.png');
INSERT INTO `blog_phones` VALUES ('000309', 'OPPO', '1599.00', 'OPPO K1手机 【全新系列】 屏下指纹识别 骁龙660 游戏手机 墨玉黑 6G+64G 全网通', '000309.png');
INSERT INTO `blog_phones` VALUES ('000310', '飞利浦（PHILIPS）E209J', '168.00', '飞利浦（PHILIPS）E209J 直板按键 移动联通 老人手机 老年功能机 绚丽红', '000310.jpg');
INSERT INTO `blog_phones` VALUES ('000311', '酷派（Coolpad）S688', '89.00', '酷派（Coolpad）S688 金色 移动联通2G 老人手机 直板按键 双卡双待 老年功能手机', '000311.jpg');
INSERT INTO `blog_phones` VALUES ('000312', '小米（MI）', '1698.00', '小米（MI） 小米8青春版 手机 梦幻蓝 全网通(6G+128G)', '000312.png');
INSERT INTO `blog_phones` VALUES ('000313', '华为（HUAWEI）荣耀Note10', '2388.00', '华为（HUAWEI）荣耀Note10 GT游戏加速 大屏游戏手机 幻夜黑 全网通 6GB+128GB', '000313.jpg');
INSERT INTO `blog_phones` VALUES ('000314', '中兴（ZTE）S36', '299.00', '中兴（ZTE）S36 移动4G 老年人智能手机 双卡双待 白色 1+8G', '000314.jpg');
INSERT INTO `blog_phones` VALUES ('000315', 'Apple', '5588.00', 'Apple 苹果 iPhone Xr 手机 红色 全网通 128G', '000315.jpg');
INSERT INTO `blog_phones` VALUES ('000316', '诺基亚（NOKIA）', '928.00', '诺基亚（NOKIA） 诺基亚X6 手机 黑色 4GB+64GB', '000316.jpg');
INSERT INTO `blog_phones` VALUES ('000317', '酷派（Coolpad）', '159.00', '酷派（Coolpad） S618电信老人机 天翼老年手机 电信版老人直板手机 男 女 黑色', '000317.jpg');
INSERT INTO `blog_phones` VALUES ('000318', '华为（HUAWEI）', '1118.00', '华为（HUAWEI） 畅享9 移动全网通4G智能手机 幻夜黑（4G+64G）', '000318.jpg');
INSERT INTO `blog_phones` VALUES ('000319', '【自营配送', '1899.00', '【自营配送 豪礼套装】华为（HUAWEI）华为荣耀10青春版 2400万AI自拍 全面屏华为 幻夜黑 全网通4G（6G+128G）送原装耳机+壳膜套装', '000319.jpg');
INSERT INTO `blog_phones` VALUES ('000320', '华为（HUAWEI）', '2348.00', '华为（HUAWEI） 华为nova3 手机 蓝楹紫 全网通(6G+128G)', '000320.jpg');
INSERT INTO `blog_phones` VALUES ('000321', '摩托罗拉', '3199.00', '摩托罗拉 motorola z3（XT1929-15）6GB+128GB 星钻黑 全面屏模块化全网通4G 双卡双待', '000321.jpg');
INSERT INTO `blog_phones` VALUES ('000322', '华为（HUAWEI）', '1249.00', '华为（HUAWEI） 荣耀9i 全网通4G手机 魅海蓝 4GB+64GB', '000322.jpg');
INSERT INTO `blog_phones` VALUES ('000323', '天语（K-Touch）', '99.00', '天语（K-Touch） Q21C 电信老人机 儿童手机直板按键老年机 学生备用电信手机 红色', '000323.jpg');
INSERT INTO `blog_phones` VALUES ('000324', 'Apple', '7108.00', 'Apple 苹果 iPhone Xs 手机 金色 全网通 64GB', '000324.jpg');
INSERT INTO `blog_phones` VALUES ('000325', '小米（MI）', '517.00', '小米（MI） 红米6A 移动联通电信4G 老年智能手机 双卡双待 樱花粉 全网通(2G+16G)', '000325.jpg');
INSERT INTO `blog_phones` VALUES ('000326', '纽曼（Newman）', '59.00', '纽曼（Newman） L66 移动/联通2G 老人手机 红色', '000326.jpg');
INSERT INTO `blog_phones` VALUES ('000327', '天语i9', '599.00', '天语i9 全网通4g 迷你手机 电信4g 卡片手机 超薄小屏 儿童智能手机袖珍 人脸解锁 微信 亮黑色（3+32G）', '000327.jpg');
INSERT INTO `blog_phones` VALUES ('000328', '小米9', '3049.00', '小米9 骁龙855 游戏手机 幻彩蓝 全网通 6G+128GB', '000328.jpg');
INSERT INTO `blog_phones` VALUES ('000329', '360', '852.00', '360 N7 Lite 手机 幻影黑 全网通 4GB+32GB', '000329.jpg');

-- ----------------------------
-- Table structure for blog_tag
-- ----------------------------
DROP TABLE IF EXISTS `blog_tag`;
CREATE TABLE `blog_tag`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blog_tag
-- ----------------------------
INSERT INTO `blog_tag` VALUES (1, '心情');
INSERT INTO `blog_tag` VALUES (2, '随笔');

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `object_repr` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content_type_id` int(11) NULL DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `django_admin_log_content_type_id_c4bce8eb_fk_django_co`(`content_type_id`) USING BTREE,
  INDEX `django_admin_log_user_id_c564eba6_fk_auth_user_id`(`user_id`) USING BTREE,
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------
INSERT INTO `django_admin_log` VALUES (1, '2019-04-01 23:12:55.062248', '1', '日记', 1, '[{\"added\": {}}]', 7, 1);
INSERT INTO `django_admin_log` VALUES (2, '2019-04-01 23:13:11.133260', '1', '心情', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (3, '2019-04-01 23:13:16.783149', '1', '第一条博客', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (4, '2019-04-02 01:45:09.655118', '2', '随笔', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (5, '2019-04-02 01:47:58.335476', '2', '许竣杰', 1, '[{\"added\": {}}]', 4, 1);
INSERT INTO `django_admin_log` VALUES (6, '2019-04-02 01:48:34.326219', '2', '随笔', 1, '[{\"added\": {}}]', 7, 1);
INSERT INTO `django_admin_log` VALUES (7, '2019-04-02 01:48:50.298509', '2', '第二条博客', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (8, '2019-04-02 01:55:02.893088', '2', '第二条博客', 2, '[{\"changed\": {\"fields\": [\"tags\"]}}]', 8, 1);

-- ----------------------------
-- Table structure for django_comment_flags
-- ----------------------------
DROP TABLE IF EXISTS `django_comment_flags`;
CREATE TABLE `django_comment_flags`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `flag` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `flag_date` datetime(6) NOT NULL,
  `comment_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `django_comment_flags_user_id_comment_id_flag_537f77a7_uniq`(`user_id`, `comment_id`, `flag`) USING BTREE,
  INDEX `django_comment_flags_comment_id_d8054933_fk_django_comments_id`(`comment_id`) USING BTREE,
  INDEX `django_comment_flags_flag_8b141fcb`(`flag`) USING BTREE,
  CONSTRAINT `django_comment_flags_comment_id_d8054933_fk_django_comments_id` FOREIGN KEY (`comment_id`) REFERENCES `django_comments` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `django_comment_flags_user_id_f3f81f0a_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for django_comments
-- ----------------------------
DROP TABLE IF EXISTS `django_comments`;
CREATE TABLE `django_comments`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `object_pk` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_email` varchar(254) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `comment` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `submit_date` datetime(6) NOT NULL,
  `ip_address` char(39) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `is_public` tinyint(1) NOT NULL,
  `is_removed` tinyint(1) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `site_id` int(11) NULL DEFAULT NULL,
  `user_id` int(11) NULL DEFAULT NULL,
  `comment_title` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `level` int(10) UNSIGNED NULL DEFAULT NULL,
  `parent_comment_id` int(11) NULL DEFAULT NULL,
  `user_img` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `django_comments_content_type_id_c4afe962_fk_django_co`(`content_type_id`) USING BTREE,
  INDEX `django_comments_user_id_a0a440a1_fk_auth_user_id`(`user_id`) USING BTREE,
  INDEX `django_comments_submit_date_514ed2d9`(`submit_date`) USING BTREE,
  INDEX `django_comments_site_id_9dcf666e_fk_django_site_id`(`site_id`) USING BTREE,
  INDEX `django_comments_parent_comment_id_6fc6af4e_fk_django_comments_id`(`parent_comment_id`) USING BTREE,
  CONSTRAINT `django_comments_content_type_id_c4afe962_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `django_comments_parent_comment_id_6fc6af4e_fk_django_comments_id` FOREIGN KEY (`parent_comment_id`) REFERENCES `django_comments` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `django_comments_site_id_9dcf666e_fk_django_site_id` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `django_comments_user_id_a0a440a1_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_comments
-- ----------------------------
INSERT INTO `django_comments` VALUES (1, '1', '', 'xxx@xxx.com', 'https://xxx.xxx.xxx.xxx', '机智(•́⌄•́๑)૭✧', '2019-04-02 01:49:28.096409', '127.0.0.1', 1, 0, 8, 1, NULL, '哇', 0, NULL, '');
INSERT INTO `django_comments` VALUES (2, '2', '', 'xxx@xxx.com', 'https://xxx.xxx.xxx.xxx', '喜欢', '2019-04-02 01:56:47.741297', '127.0.0.1', 1, 0, 8, 1, NULL, '好看', 0, NULL, '');

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `model` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `django_content_type_app_label_model_76bd3d3b_uniq`(`app_label`, `model`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES (1, 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES (3, 'auth', 'group');
INSERT INTO `django_content_type` VALUES (2, 'auth', 'permission');
INSERT INTO `django_content_type` VALUES (4, 'auth', 'user');
INSERT INTO `django_content_type` VALUES (7, 'blog', 'category');
INSERT INTO `django_content_type` VALUES (8, 'blog', 'entry');
INSERT INTO `django_content_type` VALUES (9, 'blog', 'tag');
INSERT INTO `django_content_type` VALUES (5, 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES (11, 'django_comments', 'comment');
INSERT INTO `django_content_type` VALUES (12, 'django_comments', 'commentflag');
INSERT INTO `django_content_type` VALUES (6, 'sessions', 'session');
INSERT INTO `django_content_type` VALUES (10, 'sites', 'site');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES (1, 'contenttypes', '0001_initial', '2019-04-01 03:27:08.915068');
INSERT INTO `django_migrations` VALUES (2, 'auth', '0001_initial', '2019-04-01 03:27:11.022208');
INSERT INTO `django_migrations` VALUES (3, 'admin', '0001_initial', '2019-04-01 03:27:11.467004');
INSERT INTO `django_migrations` VALUES (4, 'admin', '0002_logentry_remove_auto_add', '2019-04-01 03:27:11.482959');
INSERT INTO `django_migrations` VALUES (5, 'admin', '0003_logentry_add_action_flag_choices', '2019-04-01 03:27:11.502916');
INSERT INTO `django_migrations` VALUES (6, 'contenttypes', '0002_remove_content_type_name', '2019-04-01 03:27:11.765204');
INSERT INTO `django_migrations` VALUES (7, 'auth', '0002_alter_permission_name_max_length', '2019-04-01 03:27:11.940189');
INSERT INTO `django_migrations` VALUES (8, 'auth', '0003_alter_user_email_max_length', '2019-04-01 03:27:12.325175');
INSERT INTO `django_migrations` VALUES (9, 'auth', '0004_alter_user_username_opts', '2019-04-01 03:27:12.344106');
INSERT INTO `django_migrations` VALUES (10, 'auth', '0005_alter_user_last_login_null', '2019-04-01 03:27:12.483763');
INSERT INTO `django_migrations` VALUES (11, 'auth', '0006_require_contenttypes_0002', '2019-04-01 03:27:12.493706');
INSERT INTO `django_migrations` VALUES (12, 'auth', '0007_alter_validators_add_error_messages', '2019-04-01 03:27:12.515666');
INSERT INTO `django_migrations` VALUES (13, 'auth', '0008_alter_user_username_max_length', '2019-04-01 03:27:12.702950');
INSERT INTO `django_migrations` VALUES (14, 'auth', '0009_alter_user_last_name_max_length', '2019-04-01 03:27:13.042043');
INSERT INTO `django_migrations` VALUES (15, 'blog', '0001_initial', '2019-04-01 03:27:14.299047');
INSERT INTO `django_migrations` VALUES (16, 'sessions', '0001_initial', '2019-04-01 03:27:14.405759');
INSERT INTO `django_migrations` VALUES (17, 'sites', '0001_initial', '2019-04-02 01:10:21.801244');
INSERT INTO `django_migrations` VALUES (18, 'django_comments', '0001_initial', '2019-04-02 01:10:23.230422');
INSERT INTO `django_migrations` VALUES (19, 'django_comments', '0002_update_user_email_field_length', '2019-04-02 01:10:23.468792');
INSERT INTO `django_migrations` VALUES (20, 'django_comments', '0003_add_submit_date_index', '2019-04-02 01:10:23.548571');
INSERT INTO `django_migrations` VALUES (21, 'django_comments', '0004_auto_20180521_2221', '2019-04-02 01:10:25.150287');
INSERT INTO `django_migrations` VALUES (22, 'sites', '0002_alter_domain_unique', '2019-04-02 01:10:25.209130');

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session`  (
  `session_key` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `session_data` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`) USING BTREE,
  INDEX `django_session_expire_date_a5c62663`(`expire_date`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_session
-- ----------------------------
INSERT INTO `django_session` VALUES ('1jlfbb1pysg7grxpar5lrea9h38sh24y', 'ODI0MzM3MWYyZTFmNWEyMzgxNWZmZTQwNjcxMGExN2UwNDk5YzRhMDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIzNGM1MDAwZGQ1OWM0MmM4NGQwNjcwOGY4MzE2Njk5NWYxMDBiOTY5In0=', '2019-04-16 01:43:19.933453');

-- ----------------------------
-- Table structure for django_site
-- ----------------------------
DROP TABLE IF EXISTS `django_site`;
CREATE TABLE `django_site`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `django_site_domain_a2e37b91_uniq`(`domain`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_site
-- ----------------------------
INSERT INTO `django_site` VALUES (1, 'example.com', 'example.com');

SET FOREIGN_KEY_CHECKS = 1;

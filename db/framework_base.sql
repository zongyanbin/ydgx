/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50724
Source Host           : localhost:3306
Source Database       : framework_base

Target Server Type    : MYSQL
Target Server Version : 50724
File Encoding         : 65001

Date: 2019-04-30 18:12:25
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `addresses`
-- ----------------------------
DROP TABLE IF EXISTS `addresses`;
CREATE TABLE `addresses` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `street` varchar(100) NOT NULL DEFAULT '',
  `number` varchar(5) DEFAULT '',
  `zip_code` varchar(10) NOT NULL,
  `city` varchar(50) NOT NULL DEFAULT '',
  `province` varchar(50) NOT NULL DEFAULT '',
  `country_id` int(11) NOT NULL,
  `phone` varchar(30) DEFAULT '',
  `mobile` varchar(30) DEFAULT '',
  `email` varchar(50) DEFAULT '',
  `vat` varchar(50) DEFAULT '',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of addresses
-- ----------------------------

-- ----------------------------
-- Table structure for `adminusers`
-- ----------------------------
DROP TABLE IF EXISTS `adminusers`;
CREATE TABLE `adminusers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `real_password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_active` tinyint(4) NOT NULL DEFAULT '1',
  `locale` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of adminusers
-- ----------------------------
INSERT INTO `adminusers` VALUES ('3', 'admin', 'Admin', 'admin@qq.com', '$2y$10$eNcPoj1tvfvogcEGsoGUw.F2VqGWipwloyYGfiSpXkyIDQ9Ywtd1C', 'password', 'sHayvDunOkpGNl1jzZtTgLLGRcW9LbKAw6wa9K7J1cYg0M5LJo6CJom5Of9S', '1', 'en', '0000-00-00 00:00:00', '2019-04-19 12:37:31');
INSERT INTO `adminusers` VALUES ('4', 'zongyanbin', 'zongyanbin', 'zongyanbin@qq.com', '$2y$10$eNcPoj1tvfvogcEGsoGUw.F2VqGWipwloyYGfiSpXkyIDQ9Ywtd1C', 'password', 'lopPNerGf1UyRVaIYZQvtSddrueTS9OENpUA8N5qEHeukBNBAPm65msTKYon', '1', 'en', '2019-04-19 12:44:09', '2019-04-19 12:44:09');

-- ----------------------------
-- Table structure for `adminuser_role`
-- ----------------------------
DROP TABLE IF EXISTS `adminuser_role`;
CREATE TABLE `adminuser_role` (
  `adminuser_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`adminuser_id`,`role_id`),
  KEY `adminuser_role_role_id_foreign` (`role_id`),
  CONSTRAINT `adminuser_role_adminuser_id_foreign` FOREIGN KEY (`adminuser_id`) REFERENCES `adminusers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `adminuser_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of adminuser_role
-- ----------------------------
INSERT INTO `adminuser_role` VALUES ('3', '1');

-- ----------------------------
-- Table structure for `articles`
-- ----------------------------
DROP TABLE IF EXISTS `articles`;
CREATE TABLE `articles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `domain` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `parent_id` int(11) NOT NULL,
  `id_template` int(11) NOT NULL,
  `menu_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `subtitle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `intro` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `abstract` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `doc` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `banner` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `link` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sort` int(11) NOT NULL,
  `pub` tinyint(4) DEFAULT '1',
  `ignore_slug_translation` int(1) NOT NULL DEFAULT '0',
  `top_menu` tinyint(4) DEFAULT '1',
  `template_id` int(11) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of articles
-- ----------------------------
INSERT INTO `articles` VALUES ('1', '', '0', '0', null, '', null, null, null, '', 'home', '', '', '', '', '0', '1', '0', '0', '0', '0', '2016-07-04 14:54:35', '2018-06-11 17:57:11');
INSERT INTO `articles` VALUES ('2', '', '0', '0', null, '', null, null, null, '', 'company', '', 'ff0000.png', '', '', '0', '0', '0', '0', '0', '0', '2016-07-04 14:56:59', '2019-04-22 04:19:17');
INSERT INTO `articles` VALUES ('3', '', '0', '0', null, '', null, null, null, '', 'privacy', '', '', '', '', '2000', '1', '0', '0', '0', '0', '2016-07-04 15:11:17', '2017-08-01 22:33:01');
INSERT INTO `articles` VALUES ('4', '', '0', '0', null, '', null, null, null, '', 'contacts', '', '', '', '', '400', '1', '0', '1', '0', '0', '2016-07-04 15:11:39', '2019-03-03 00:11:54');
INSERT INTO `articles` VALUES ('5', '', '0', '0', null, '', null, null, null, '', 'products', '', '', '', '', '200', '1', '0', '1', '0', '0', '2016-07-04 15:20:37', '2018-01-25 19:03:49');
INSERT INTO `articles` VALUES ('6', '', '0', '0', null, '', null, null, null, '', 'news', '', '', '', '', '300', '1', '0', '1', '0', '0', '2016-07-04 15:59:05', '2018-08-12 00:38:10');
INSERT INTO `articles` VALUES ('7', '', '9', '0', null, '', null, null, null, '', 'login', '', '', '', '', '1000', '1', '0', '0', '0', '0', '2016-08-09 21:12:14', '2017-08-01 23:57:18');
INSERT INTO `articles` VALUES ('8', '', '9', '0', null, '', null, null, null, '', 'user-dashboard', '', '', '', '', '1200', '1', '0', '0', '0', '0', '2016-08-09 21:24:04', '2017-08-01 22:33:30');
INSERT INTO `articles` VALUES ('9', '', '0', '0', null, '', null, null, null, '', 'reserved-area', '', '', '', '', '1100', '0', '0', '0', '0', '0', '2016-08-10 15:16:26', '2017-08-01 23:57:05');
INSERT INTO `articles` VALUES ('10', '', '9', '0', null, '', null, null, null, '', 'user-profile', '', '', '', '', '1300', '1', '0', '0', '0', '0', '2016-08-10 15:17:38', '2017-08-01 22:33:37');
INSERT INTO `articles` VALUES ('11', '', '0', '0', null, '', null, null, null, '', null, null, null, null, '', '2000', '1', '0', '0', '0', '0', '2017-08-02 00:13:57', '2017-08-02 00:16:28');

-- ----------------------------
-- Table structure for `article_translations`
-- ----------------------------
DROP TABLE IF EXISTS `article_translations`;
CREATE TABLE `article_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `article_id` int(10) unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `menu_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `subtitle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `intro` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `abstract` text COLLATE utf8_unicode_ci,
  `seo_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `seo_description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `seo_no_index` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `article_translations_article_id_locale_unique` (`article_id`,`locale`),
  KEY `article_translations_locale_index` (`locale`),
  CONSTRAINT `article_translations_article_id_foreign` FOREIGN KEY (`article_id`) REFERENCES `articles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of article_translations
-- ----------------------------
INSERT INTO `article_translations` VALUES ('1', '1', 'it', 'home', 'Home', 'Home', 'LaraCms', null, '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec volutpat maximus purus, sit amet congue nulla maximus quis. Nam sit amet massa sed ante rhoncus vehicula. Nam nec metus eu lorem porttitor suscipit. In at mi sit amet felis tincidunt lobortis ac quis nulla. Morbi condimentum eros vel felis iaculis facilisis. Nam at elit a odio elementum fringilla a vel magna. Vestibulum varius bibendum lectus, sed cursus leo consectetur a. Duis venenatis hendrerit enim, vitae tincidunt quam. Phasellus sollicitudin lobortis turpis, quis mollis purus porttitor sit amet.</p>', '', '', '', '0', '2016-07-04 15:53:04', '2017-08-01 23:12:25');
INSERT INTO `article_translations` VALUES ('2', '1', 'en', 'home', 'Home', 'Home', '', null, '', '', '', '', '', '2016-07-04 15:53:04', '2017-08-01 23:52:32');
INSERT INTO `article_translations` VALUES ('3', '2', 'it', 'azienda', 'Azienda', 'Azienda', '', '', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus egestas aliquam mollis. Donec luctus luctus dui, vitae dapibus ipsum fermentum a. Quisque fermentum sodales iaculis. Nunc blandit ante luctus urna laoreet sollicitudin. Praesent a libero vitae elit pretium cursus. Ut maximus felis pretium augue ullamcorper venenatis. Aenean mattis hendrerit dui id aliquet. Nunc rhoncus ipsum ut orci posuere semper vel quis diam. Duis pulvinar molestie nisi, sed sollicitudin metus fermentum sit amet. Phasellus semper, nibh sed laoreet blandit, ligula neque egestas tortor, ac porttitor massa justo ut diam.</p>\r\n<p>Donec id sem sem. Pellentesque augue quam, euismod nec neque non, sollicitudin tincidunt purus. Sed viverra libero eget ante sollicitudin iaculis. Donec erat tellus, aliquet aliquam nisi vel, faucibus interdum est. In aliquet pharetra eros vel lacinia. Nam sit amet ex tristique, pretium quam quis, ullamcorper dolor. Vestibulum gravida eros accumsan gravida iaculis. Suspendisse eu elit metus. Pellentesque iaculis rutrum augue quis blandit. Fusce at lacus vestibulum, placerat justo vitae, lacinia nisl. Phasellus accumsan enim vitae ex condimentum rhoncus.</p>\r\n<p>Duis feugiat semper eros, vitae consectetur mauris volutpat viverra. Aenean at augue dui. Sed varius tincidunt hendrerit. Cras sed condimentum nunc. Vestibulum consequat eget ipsum a ultrices. Proin auctor commodo facilisis. Praesent quis neque tellus. Fusce venenatis, odio nec facilisis molestie, orci lacus lobortis orci, nec commodo tortor tortor et eros. Sed lacinia nisi et eleifend pharetra. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Morbi sodales diam quis diam volutpat, et egestas purus scelerisque. Phasellus bibendum diam venenatis tortor pretium iaculis. Aliquam a faucibus mauris. Aenean sed urna velit. Nam malesuada dui eget scelerisque fermentum.</p>', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus egestas aliquam mollis. Donec luctus luctus dui, vitae dapibus ipsum fermentum a. Quisque fermentum sodales iaculis. Nunc blandit ante luctus urna laoreet sollicitudin. Praesent a libero vitae elit pretium cursus. Ut maximus felis pretium augue ullamcorper venenatis. Aenean mattis hendrerit dui id aliquet. Nunc rhoncus ipsum ut orci posuere semper vel quis diam. Duis pulvinar molestie nisi, sed sollicitudin metus fermentum sit amet. Phasellus semper, nibh sed laoreet blandit, ligula neque egestas tortor, ac porttitor massa justo ut diam.</p>\r\n<p>Donec id sem sem. Pellentesque augue quam, euismod nec neque non, sollicitudin tincidunt purus. Sed viverra libero eget ante sollicitudin iaculis. Donec erat tellus, aliquet aliquam nisi vel, faucibus interdum est. In aliquet pharetra eros vel lacinia. Nam sit amet ex tristique, pretium quam quis, ullamcorper dolor. Vestibulum gravida eros accumsan gravida iaculis. Suspendisse eu elit metus. Pellentesque iaculis rutrum augue quis blandit. Fusce at lacus vestibulum, placerat justo vitae, lacinia nisl. Phasellus accumsan enim vitae ex condimentum rhoncus.</p>\r\n<p>Duis feugiat semper eros, vitae consectetur mauris volutpat viverra. Aenean at augue dui. Sed varius tincidunt hendrerit. Cras sed condimentum nunc. Vestibulum consequat eget ipsum a ultrices. Proin auctor commodo facilisis. Praesent quis neque tellus. Fusce venenatis, odio nec facilisis molestie, orci lacus lobortis orci, nec commodo tortor tortor et eros. Sed lacinia nisi et eleifend pharetra. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Morbi sodales diam quis diam volutpat, et egestas purus scelerisque. Phasellus bibendum diam venenatis tortor pretium iaculis. Aliquam a faucibus mauris. Aenean sed urna velit. Nam malesuada dui eget scelerisque fermentum.</p>', '', '', '', '2016-07-04 15:53:13', '2018-01-29 21:24:31');
INSERT INTO `article_translations` VALUES ('4', '2', 'en', '1', '1', '1', '1', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus egestas aliquam mollis. Donec luctus luctus dui, vitae dapibus ipsum fermentum a. Quisque fermentum sodales iaculis. Nunc blandit ante luctus urna laoreet sollicitudin. Praesent a liber', '', '', '', '', '', '2016-07-04 15:53:13', '2019-03-03 22:30:55');
INSERT INTO `article_translations` VALUES ('5', '3', 'it', 'privacy', 'Privacy', 'Privacy', '', null, '', '', '', '', '', '2016-07-04 15:53:28', '2017-08-01 22:33:01');
INSERT INTO `article_translations` VALUES ('6', '3', 'en', 'privacy', 'Privacy', 'Privacy', '', null, '', '', '', '', '', '2016-07-04 15:53:28', '2017-08-01 22:33:01');
INSERT INTO `article_translations` VALUES ('7', '5', 'it', 'prodotti', '', 'Categorie', '', null, '', '', '', '', '', '2016-07-04 15:53:38', '2018-01-25 19:03:49');
INSERT INTO `article_translations` VALUES ('8', '5', 'en', 'products', '', 'Categories', '', null, '', '', '', '', '', '2016-07-04 15:53:38', '2018-01-25 19:03:49');
INSERT INTO `article_translations` VALUES ('9', '4', 'it', 'contatti', 'Contatti', 'Contatti', '', null, '', '', '', '', '', '2016-07-04 15:54:32', '2017-08-01 22:32:40');
INSERT INTO `article_translations` VALUES ('10', '4', 'en', 'contacts', 'Contacts', 'Contacts', '', null, '', '', '', '', '', '2016-07-04 15:54:32', '2017-08-01 22:32:40');
INSERT INTO `article_translations` VALUES ('13', '6', 'it', 'news', 'News', 'News', '', null, '', '', '', '', '', '2016-08-04 19:24:58', '2017-08-01 22:33:11');
INSERT INTO `article_translations` VALUES ('14', '6', 'en', 'news', 'News', 'News', 'News Sub Title', null, '', '', '', '', '', '2016-08-04 19:24:58', '2018-08-12 00:38:10');
INSERT INTO `article_translations` VALUES ('15', '7', 'it', 'login', 'Login', 'Login', 'login', null, '', '', 'Login', '', '', '2016-08-09 21:12:14', '2017-08-01 22:33:20');
INSERT INTO `article_translations` VALUES ('16', '7', 'en', 'login', 'Login', 'Login', 'Login', null, '', '', 'Login', '', '', '2016-08-09 21:12:14', '2017-08-01 22:33:20');
INSERT INTO `article_translations` VALUES ('17', '8', 'it', 'dashboard', 'Dashboard', 'Dashboard', 'Dashboard', null, '', '', '', '', '', '2016-08-09 21:24:04', '2017-08-01 22:33:30');
INSERT INTO `article_translations` VALUES ('18', '8', 'en', 'dashboard', 'Dashboard', 'Dashboard', '', null, '', '', '', '', '', '2016-08-09 21:24:04', '2017-08-01 22:33:30');
INSERT INTO `article_translations` VALUES ('19', '9', 'it', 'users', '', 'Users', 'Users', null, '', '', '', '', '', '2016-08-10 15:16:26', '2017-08-01 23:56:45');
INSERT INTO `article_translations` VALUES ('20', '9', 'en', 'users', 'Users', 'Users', '', null, '', '', '', '', '', '2016-08-10 15:16:26', '2017-08-01 23:56:21');
INSERT INTO `article_translations` VALUES ('21', '10', 'it', 'profile', 'Profile', 'Profile', 'Profile', null, '', '', '', '', '', '2016-08-10 15:17:38', '2017-08-01 22:33:37');
INSERT INTO `article_translations` VALUES ('22', '10', 'en', 'user-profile', 'User profile', 'User profile', '', null, '', '', '', '', '', '2016-08-10 15:17:38', '2017-08-01 22:33:37');
INSERT INTO `article_translations` VALUES ('23', '11', 'it', 'register', '', 'Registrazione', '', null, '', '', '', '', '', '2017-08-02 00:13:57', '2017-08-02 00:13:57');
INSERT INTO `article_translations` VALUES ('24', '11', 'en', 'register', '', 'Register', '', null, '', '', '', '', '', '2017-08-02 00:13:57', '2017-08-02 00:13:57');
INSERT INTO `article_translations` VALUES ('25', '6', 'es', '', '', '', '', null, '', '', '', '', '', '2018-08-12 00:38:10', '2018-08-12 00:38:10');
INSERT INTO `article_translations` VALUES ('26', '6', 'fr', '', '', '', '', null, '', '', '', '', '', '2018-08-12 00:38:10', '2018-08-12 00:38:10');
INSERT INTO `article_translations` VALUES ('27', '4', 'es', '', '', '', '', null, '', '', '', '', '', '2019-03-03 00:11:54', '2019-03-03 00:11:54');
INSERT INTO `article_translations` VALUES ('28', '4', 'fr', '', '', '', '', null, '', '', '', '', '', '2019-03-03 00:11:54', '2019-03-03 00:11:54');
INSERT INTO `article_translations` VALUES ('29', '2', 'es', '', '', '', '', null, '', '', '', '', '', '2019-03-03 22:30:55', '2019-03-03 22:30:55');
INSERT INTO `article_translations` VALUES ('30', '2', 'fr', '', '', '', '', null, '', '', '', '', '', '2019-03-03 22:30:55', '2019-03-03 22:30:55');

-- ----------------------------
-- Table structure for `carts`
-- ----------------------------
DROP TABLE IF EXISTS `carts`;
CREATE TABLE `carts` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `status` tinyint(4) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of carts
-- ----------------------------
INSERT INTO `carts` VALUES ('1', '0', '5', '2019-03-03 00:14:43', '2019-03-03 00:14:43');
INSERT INTO `carts` VALUES ('2', '0', '1', '2019-04-06 07:16:21', '2019-04-06 07:16:21');

-- ----------------------------
-- Table structure for `cart_items`
-- ----------------------------
DROP TABLE IF EXISTS `cart_items`;
CREATE TABLE `cart_items` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `cart_id` int(11) NOT NULL,
  `product_code` varchar(255) NOT NULL,
  `product_model_code` varchar(255) DEFAULT NULL,
  `quantity` int(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cart_items
-- ----------------------------
INSERT INTO `cart_items` VALUES ('1', '1', 'PRDA', null, '1', '2019-03-03 00:14:43', '2019-03-03 00:14:43');
INSERT INTO `cart_items` VALUES ('2', '2', 'PRDA', null, '1', '2019-04-06 07:16:21', '2019-04-06 07:16:21');

-- ----------------------------
-- Table structure for `categories`
-- ----------------------------
DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_parent` int(10) unsigned DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `abstract` text COLLATE utf8_unicode_ci,
  `description` text COLLATE utf8_unicode_ci,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `banner` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `doc` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sort` int(11) NOT NULL,
  `pub` tinyint(4) DEFAULT '1',
  `seo_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `seo_description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `categories_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of categories
-- ----------------------------
INSERT INTO `categories` VALUES ('1', '0', '', null, null, 'identity', '', '', '', '0', '1', null, null, '0', '2016-07-04 14:29:04', '2019-04-17 10:27:43');
INSERT INTO `categories` VALUES ('2', '0', '', null, null, 'research', '', '', '', '10', '1', null, null, '0', '2016-12-26 20:16:23', '2018-06-13 22:44:31');
INSERT INTO `categories` VALUES ('3', '0', '', null, null, 'start-up', '', '', '', '20', '1', null, null, '0', '2016-12-28 02:33:25', '2018-06-13 22:45:00');

-- ----------------------------
-- Table structure for `category_translations`
-- ----------------------------
DROP TABLE IF EXISTS `category_translations`;
CREATE TABLE `category_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `category_id` int(10) unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `seo_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `seo_description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_by` int(10) unsigned NOT NULL,
  `update_by` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `categories_translations_category_id_locale_unique` (`category_id`,`locale`),
  KEY `categories_translations_locale_index` (`locale`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of category_translations
-- ----------------------------
INSERT INTO `category_translations` VALUES ('1', 'prima-categoria', '1', 'it', 'Prima Categoria', null, '', '', '0', '0', '2016-07-04 14:29:04', '2018-06-13 22:43:39');
INSERT INTO `category_translations` VALUES ('2', 'first-category', '1', 'en', 'First Category', null, '', '', '0', '0', '2016-07-04 14:29:04', '2018-06-13 22:43:39');
INSERT INTO `category_translations` VALUES ('3', 'second-category', '2', 'en', 'Second Category', null, '', '', '0', '0', '2016-12-26 20:16:23', '2018-06-13 22:44:31');
INSERT INTO `category_translations` VALUES ('4', 'seconda-categoria', '2', 'it', 'Seconda Categoria', null, '', '', '0', '0', '2016-12-26 20:16:23', '2018-06-13 22:44:31');
INSERT INTO `category_translations` VALUES ('5', 'thid-category', '3', 'en', 'Third Category', null, '', '', '0', '0', '2016-12-28 02:33:25', '2018-06-13 22:45:00');
INSERT INTO `category_translations` VALUES ('6', 'terza-category', '3', 'it', 'Terza Categoria', null, '', '', '0', '0', '2016-12-28 02:33:25', '2018-06-13 22:45:00');
INSERT INTO `category_translations` VALUES ('7', 'nuova-categoria', '4', 'it', 'Nuova categoria', null, '', '', '0', '0', '2017-08-02 21:16:28', '2017-08-02 21:16:28');
INSERT INTO `category_translations` VALUES ('8', 'new-category', '4', 'en', 'New category', null, '', '', '0', '0', '2017-08-02 21:16:28', '2017-08-02 21:16:28');

-- ----------------------------
-- Table structure for `contacts`
-- ----------------------------
DROP TABLE IF EXISTS `contacts`;
CREATE TABLE `contacts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `request_product_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `subject` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `message` text COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `surname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `company` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` tinyint(4) DEFAULT '0',
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of contacts
-- ----------------------------
INSERT INTO `contacts` VALUES ('1', '', '11', '11', 'Angelo marco Asperti', 'Asperti', '', 'marcoasperti@gmail.com', '0', '0', '2019-04-11 04:03:22', '2019-04-11 04:03:22');

-- ----------------------------
-- Table structure for `countries`
-- ----------------------------
DROP TABLE IF EXISTS `countries`;
CREATE TABLE `countries` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `iso_code` varchar(3) COLLATE utf8_unicode_ci NOT NULL,
  `id_continent` int(11) DEFAULT NULL,
  `eu` tinyint(1) DEFAULT NULL,
  `vat` decimal(4,1) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=248 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of countries
-- ----------------------------
INSERT INTO `countries` VALUES ('1', 'Andorra', 'AD', '0', '0', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('2', 'United Arab Emirates', 'AE', '0', '0', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('3', 'Afghanistan', 'AF', null, '0', '0.0', '1', null, '3', '2016-08-09 06:00:00', '2019-04-11 04:01:06');
INSERT INTO `countries` VALUES ('4', 'Antigua And Barbuda', 'AG', '0', '0', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('5', 'Anguilla', 'AI', '0', '0', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('6', 'Albania', 'AL', '0', '0', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('7', 'Armenia', 'AM', '0', '0', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('8', 'Angola', 'AO', '0', '0', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('9', 'Antarctica', 'AQ', '0', '0', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('10', 'Argentina', 'AR', '0', '0', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('11', 'American Samoa', 'AS', '0', '0', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('12', 'Austria', 'AT', '0', '1', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('13', 'Australia', 'AU', '0', '0', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('14', 'Aruba', 'AW', '0', '0', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('15', 'Aland Islands', 'AX', '0', '0', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2017-01-03 22:45:13');
INSERT INTO `countries` VALUES ('16', 'Azerbaijan', 'AZ', '0', '0', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('17', 'Bosnia And Herzegovina', 'BA', '0', '0', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('18', 'Barbados', 'BB', '0', '0', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('19', 'Bangladesh', 'BD', '0', '0', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('20', 'Belgium', 'BE', '0', '1', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('21', 'Burkina Faso', 'BF', '0', '0', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('22', 'Bulgaria', 'BG', '0', '1', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('23', 'Bahrain', 'BH', '0', '0', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('24', 'Burundi', 'BI', '0', '0', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('25', 'Benin', 'BJ', '0', '0', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('26', 'Saint Barthelemy', 'BL', '0', '0', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('27', 'Bermuda', 'BM', '0', '0', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('28', 'Brunei', 'BN', '0', '0', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('29', 'Bolivia', 'BO', '0', '0', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('30', 'Bonaire, Saint Eustatius And Saba ', 'BQ', '0', '0', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('31', 'Brazil', 'BR', '0', '0', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('32', 'Bahamas', 'BS', '0', '0', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('33', 'Bhutan', 'BT', '0', '0', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('34', 'Bouvet Island', 'BV', '0', '0', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('35', 'Botswana', 'BW', '0', '0', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('36', 'Belarus', 'BY', '0', '0', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('37', 'Belize', 'BZ', '0', '0', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('38', 'Canada', 'CA', '0', '0', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('39', 'Cocos Islands', 'CC', '0', '0', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('40', 'Democratic Republic Of The Congo', 'CD', '0', '0', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('41', 'Central African Republic', 'CF', '0', '0', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('42', 'Republic Of The Congo', 'CG', '0', '0', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('43', 'Switzerland', 'CH', '0', '0', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('44', 'Ivory Coast', 'CI', '0', '0', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('45', 'Cook Islands', 'CK', '0', '0', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('46', 'Chile', 'CL', '0', '0', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('47', 'Cameroon', 'CM', '0', '0', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('48', 'China', 'CN', '0', '0', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('49', 'Colombia', 'CO', '0', '0', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('50', 'Costa Rica', 'CR', '0', '0', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('51', 'Cuba', 'CU', '0', '0', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('52', 'Cape Verde', 'CV', '0', '0', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('53', 'Curacao', 'CW', '0', '0', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('54', 'Christmas Island', 'CX', '0', '0', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('55', 'Cyprus', 'CY', '0', '1', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('56', 'Czech Republic', 'CZ', '0', '1', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('57', 'Germany', 'DE', '0', '1', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('58', 'Djibouti', 'DJ', '0', '0', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('59', 'Denmark', 'DK', '0', '1', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('60', 'Dominica', 'DM', '0', '0', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('61', 'Dominican Republic', 'DO', '0', '0', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('62', 'Algeria', 'DZ', '0', '0', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('63', 'Ecuador', 'EC', '0', '0', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('64', 'Estonia', 'EE', '0', '1', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('65', 'Egypt', 'EG', '0', '0', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('66', 'Western Sahara', 'EH', '0', '0', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('67', 'Eritrea', 'ER', '0', '0', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('68', 'Spain', 'ES', '0', '1', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('69', 'Ethiopia', 'ET', '0', '0', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('70', 'Finland', 'FI', '0', '1', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('71', 'Fiji', 'FJ', '0', '0', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('72', 'Falkland Islands', 'FK', '0', '0', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('73', 'Micronesia', 'FM', '0', '0', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('74', 'Faroe Islands', 'FO', '0', '0', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('75', 'France', 'FR', '0', '1', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('76', 'Gabon', 'GA', '0', '0', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('77', 'United Kingdom', 'GB', '0', '0', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('78', 'Grenada', 'GD', '0', '0', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('79', 'Georgia', 'GE', '0', '0', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('80', 'French Guiana', 'GF', '0', '0', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('81', 'Guernsey', 'GG', '0', '0', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('82', 'Ghana', 'GH', '0', '0', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('83', 'Gibraltar', 'GI', '0', '0', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('84', 'Greenland', 'GL', '0', '0', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('85', 'Gambia', 'GM', '0', '0', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('86', 'Guinea', 'GN', '0', '0', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('87', 'Guadeloupe', 'GP', '0', '0', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('88', 'Equatorial Guinea', 'GQ', '0', '0', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('89', 'Greece', 'GR', '0', '1', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('90', 'South Georgia And The South Sandwich Islands', 'GS', '0', '0', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('91', 'Guatemala', 'GT', '0', '0', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('92', 'Guam', 'GU', '0', '0', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('93', 'Guinea-Bissau', 'GW', '0', '0', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('94', 'Guyana', 'GY', '0', '0', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('95', 'Hong Kong', 'HK', '0', '0', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('96', 'Honduras', 'HN', '0', '0', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('97', 'Croatia', 'HR', '0', '1', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('98', 'Haiti', 'HT', '0', '0', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('99', 'Hungary', 'HU', '0', '1', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('100', 'Indonesia', 'ID', '0', '0', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('101', 'Ireland', 'IE', '0', '1', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('102', 'Israel', 'IL', '0', '0', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('103', 'Isle Of Man', 'IM', '0', '0', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('104', 'India', 'IN', '0', '0', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('105', 'British Indian Ocean Territory', 'IO', '0', '0', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('106', 'Iraq', 'IQ', '0', '0', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('107', 'Iran', 'IR', '0', '0', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('108', 'Iceland', 'IS', '0', '0', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('109', 'Italy', 'IT', '0', '1', '22.0', '1', '0', '1', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('110', 'Jersey', 'JE', '0', '0', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('111', 'Jamaica', 'JM', '0', '0', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('112', 'Jordan', 'JO', '0', '0', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('113', 'Japan', 'JP', '0', '0', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('114', 'Kenya', 'KE', '0', '0', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('115', 'Kyrgyzstan', 'KG', '0', '0', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('116', 'Cambodia', 'KH', '0', '0', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('117', 'Kiribati', 'KI', '0', '0', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('118', 'Comoros', 'KM', '0', '0', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('119', 'Saint Kitts And Nevis', 'KN', '0', '0', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('120', 'North Korea', 'KP', '0', '0', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('121', 'South Korea', 'KR', '0', '0', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('122', 'Kuwait', 'KW', '0', '0', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('123', 'Cayman Islands', 'KY', '0', '0', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('124', 'Kazakhstan', 'KZ', '0', '0', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('125', 'Laos', 'LA', '0', '0', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('126', 'Lebanon', 'LB', '0', '0', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('127', 'Saint Lucia', 'LC', '0', '0', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('128', 'Liechtenstein', 'LI', '0', '0', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('129', 'Sri Lanka', 'LK', '0', '0', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('130', 'Liberia', 'LR', '0', '0', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('131', 'Lesotho', 'LS', '0', '0', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('132', 'Lithuania', 'LT', '0', '1', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('133', 'Luxembourg', 'LU', '0', '1', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('134', 'Latvia', 'LV', '0', '1', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('135', 'Libya', 'LY', '0', '0', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('136', 'Morocco', 'MA', '0', '0', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('137', 'Monaco', 'MC', '0', '0', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('138', 'Moldova', 'MD', '0', '0', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('139', 'Montenegro', 'ME', '0', '0', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('140', 'Saint Martin', 'MF', '0', '0', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('141', 'Madagascar', 'MG', '0', '0', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('142', 'Marshall Islands', 'MH', '0', '0', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('143', 'Macedonia', 'MK', '0', '0', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('144', 'Mali', 'ML', '0', '0', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('145', 'Myanmar', 'MM', '0', '0', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('146', 'Mongolia', 'MN', '0', '0', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('147', 'Macao', 'MO', '0', '0', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('148', 'Northern Mariana Islands', 'MP', '0', '0', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('149', 'Martinique', 'MQ', '0', '0', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('150', 'Mauritania', 'MR', '0', '0', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('151', 'Montserrat', 'MS', '0', '0', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('152', 'Malta', 'MT', '0', '1', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('153', 'Mauritius', 'MU', '0', '0', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('154', 'Maldives', 'MV', '0', '0', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('155', 'Malawi', 'MW', '0', '0', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('156', 'Mexico', 'MX', '0', '0', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('157', 'Malaysia', 'MY', '0', '0', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('158', 'Mozambique', 'MZ', '0', '0', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('159', 'Namibia', 'NA', '0', '0', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('160', 'New Caledonia', 'NC', '0', '0', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('161', 'Niger', 'NE', '0', '0', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('162', 'Norfolk Island', 'NF', '0', '0', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('163', 'Nigeria', 'NG', '0', '0', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('164', 'Nicaragua', 'NI', '0', '0', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('165', 'Netherlands', 'NL', '0', '1', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('166', 'Norway', 'NO', '0', '0', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('167', 'Nepal', 'NP', '0', '0', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('168', 'Nauru', 'NR', '0', '0', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('169', 'Niue', 'NU', '0', '0', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('170', 'New Zealand', 'NZ', '0', '0', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('171', 'Oman', 'OM', '0', '0', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('172', 'Panama', 'PA', '0', '0', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('173', 'Peru', 'PE', '0', '0', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('174', 'French Polynesia', 'PF', '0', '0', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('175', 'Papua New Guinea', 'PG', '0', '0', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('176', 'Philippines', 'PH', '0', '0', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('177', 'Pakistan', 'PK', '0', '0', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('178', 'Poland', 'PL', '0', '1', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('179', 'Saint Pierre And Miquelon', 'PM', '0', '0', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('180', 'Puerto Rico', 'PR', '0', '0', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('181', 'Palestinian Territory', 'PS', '0', '0', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('182', 'Portugal', 'PT', '0', '1', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('183', 'Palau', 'PW', '0', '0', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('184', 'Paraguay', 'PY', '0', '0', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('185', 'Qatar', 'QA', '0', '0', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('186', 'Reunion', 'RE', '0', '0', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('187', 'Romania', 'RO', '0', '1', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('188', 'Serbia', 'RS', '0', '0', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('189', 'Russia', 'RU', '0', '0', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('190', 'Rwanda', 'RW', '0', '0', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('191', 'Saudi Arabia', 'SA', '0', '0', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('192', 'Solomon Islands', 'SB', '0', '0', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('193', 'Seychelles', 'SC', '0', '0', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('194', 'Sudan', 'SD', '0', '0', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('195', 'Sweden', 'SE', '0', '1', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('196', 'Singapore', 'SG', '0', '0', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('197', 'Saint Helena', 'SH', '0', '0', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('198', 'Slovenia', 'SI', '0', '1', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('199', 'Svalbard And Jan Mayen', 'SJ', '0', '0', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('200', 'Slovakia', 'SK', '0', '1', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('201', 'Sierra Leone', 'SL', '0', '0', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('202', 'San Marino', 'SM', '0', '0', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('203', 'Senegal', 'SN', '0', '0', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('204', 'Somalia', 'SO', '0', '0', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('205', 'Suriname', 'SR', '0', '0', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('206', 'South Sudan', 'SS', '0', '0', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('207', 'Sao Tome And Principe', 'ST', '0', '0', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('208', 'El Salvador', 'SV', '0', '0', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('209', 'Sint Maarten', 'SX', '0', '0', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('210', 'Syria', 'SY', '0', '0', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('211', 'Swaziland', 'SZ', '0', '0', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('212', 'Turks And Caicos Islands', 'TC', '0', '0', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('213', 'Chad', 'TD', '0', '0', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('214', 'French Southern Territories', 'TF', '0', '0', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('215', 'Togo', 'TG', '0', '0', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('216', 'Thailand', 'TH', '0', '0', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('217', 'Tajikistan', 'TJ', '0', '0', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('218', 'Tokelau', 'TK', '0', '0', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('219', 'East Timor', 'TL', '0', '0', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('220', 'Turkmenistan', 'TM', '0', '0', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('221', 'Tunisia', 'TN', '0', '0', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('222', 'Tonga', 'TO', '0', '0', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('223', 'Turkey', 'TR', '0', '0', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('224', 'Trinidad And Tobago', 'TT', '0', '0', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('225', 'Tuvalu', 'TV', '0', '0', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('226', 'Taiwan', 'TW', '0', '0', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('227', 'Tanzania', 'TZ', '0', '0', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('228', 'Ukraine', 'UA', '0', '0', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('229', 'Uganda', 'UG', '0', '0', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('230', 'United States Minor Outlying Islands', 'UM', '0', '0', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('231', 'United States', 'US', '0', '0', '0.0', '1', '0', '1', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('232', 'Uruguay', 'UY', '0', '0', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('233', 'Uzbekistan', 'UZ', '0', '0', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('234', 'Saint Vincent And The Grenadines', 'VC', '0', '0', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('235', 'Venezuela', 'VE', '0', '0', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('236', 'British Virgin Islands', 'VG', '0', '0', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('237', 'U.S. Virgin Islands', 'VI', '0', '0', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('238', 'Vietnam', 'VN', '0', '0', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('239', 'Vanuatu', 'VU', '0', '0', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('240', 'Wallis And Futuna', 'WF', '0', '0', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('241', 'Samoa', 'WS', '0', '0', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('242', 'Kosovo', 'XK', '0', '0', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('243', 'Yemen', 'YE', '0', '0', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('244', 'Mayotte', 'YT', '0', '0', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('245', 'South Africa', 'ZA', '0', '0', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('246', 'Zambia', 'ZM', '0', '0', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');
INSERT INTO `countries` VALUES ('247', 'Zimbabwe', 'ZW', '0', '0', '0.0', '1', '0', '0', '2016-08-09 06:00:00', '2016-08-09 06:00:00');

-- ----------------------------
-- Table structure for `discounts`
-- ----------------------------
DROP TABLE IF EXISTS `discounts`;
CREATE TABLE `discounts` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(20) NOT NULL DEFAULT '',
  `amount` varchar(10) NOT NULL,
  `description` varchar(255) NOT NULL DEFAULT '',
  `date_start` timestamp NULL DEFAULT NULL,
  `date_end` timestamp NULL DEFAULT NULL,
  `uses` int(11) NOT NULL,
  `pub` tinyint(4) NOT NULL DEFAULT '1',
  `created_at` int(11) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of discounts
-- ----------------------------
INSERT INTO `discounts` VALUES ('1', 'qwerty', '20', '', null, null, '0', '1', '2019', '2019-04-11 04:22:54');

-- ----------------------------
-- Table structure for `domains`
-- ----------------------------
DROP TABLE IF EXISTS `domains`;
CREATE TABLE `domains` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `domain` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci NOT NULL,
  `sort` int(11) NOT NULL,
  `pub` tinyint(4) DEFAULT '1',
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of domains
-- ----------------------------
INSERT INTO `domains` VALUES ('1', 'imagetype', '', '', '10', '1', '0', '2016-06-23 15:36:42', '2016-06-28 15:58:39');
INSERT INTO `domains` VALUES ('2', 'imagetype', '', '', '20', '1', '0', '2016-06-23 15:38:24', '2016-06-28 15:59:19');
INSERT INTO `domains` VALUES ('21', 'template', '', 'template_subpage', '30', '1', '0', '2016-06-28 21:18:04', '2016-12-27 22:17:35');

-- ----------------------------
-- Table structure for `domain_translations`
-- ----------------------------
DROP TABLE IF EXISTS `domain_translations`;
CREATE TABLE `domain_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `domain_id` int(10) unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `update_by` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `domains_translations_domain_id_locale_unique` (`domain_id`,`locale`),
  KEY `domains_translations_locale_index` (`locale`),
  CONSTRAINT `domains_translations_domain_id_foreign` FOREIGN KEY (`domain_id`) REFERENCES `domains` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=123 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of domain_translations
-- ----------------------------
INSERT INTO `domain_translations` VALUES ('1', '1', 'it', 'Top Header Slider', '0', '2016-06-23 15:36:42', '2016-06-28 15:58:39');
INSERT INTO `domain_translations` VALUES ('2', '1', 'en', 'Top Header Slider', '0', '2016-06-23 15:36:42', '2016-06-28 15:58:39');
INSERT INTO `domain_translations` VALUES ('7', '2', 'it', 'Bottom Slider Image', '0', '2016-06-23 15:38:24', '2016-06-28 15:59:19');
INSERT INTO `domain_translations` VALUES ('8', '2', 'en', 'page gallery', '0', '2016-06-23 15:38:24', '2016-12-28 00:38:49');
INSERT INTO `domain_translations` VALUES ('121', '21', 'it', 'Template con sottopagine', '0', '2016-06-28 21:18:04', '2016-07-04 15:38:10');
INSERT INTO `domain_translations` VALUES ('122', '21', 'en', 'Sub page template', '0', '2016-06-28 21:18:04', '2016-12-27 22:17:28');

-- ----------------------------
-- Table structure for `errors`
-- ----------------------------
DROP TABLE IF EXISTS `errors`;
CREATE TABLE `errors` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `message` varchar(256) NOT NULL,
  `file` varchar(256) NOT NULL,
  `line` int(11) NOT NULL,
  `trace` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of errors
-- ----------------------------
INSERT INTO `errors` VALUES ('1', 'Class App\\LaraCms\\Website\\Controllers\\Auth\\Request does not exist', '/Users/web08/REPOLARAVEL/framework_base/vendor/laravel/framework/src/Illuminate/Routing/RouteSignatureParameters.php', '25', '/Users/web08/REPOLARAVEL/framework_base/vendor/laravel/framework/src/Illuminate/Routing/RouteSignatureParameters.php\\n\\n/Users/web08/REPOLARAVEL/framework_base/vendor/laravel/framework/src/Illuminate/Routing/RouteSignatureParameters.php\\n/Users/web08/REPOLARAVEL/framework_base/vendor/laravel/framework/src/Illuminate/Routing/Route.php\\n/Users/web08/REPOLARAVEL/framework_base/vendor/laravel/framework/src/Illuminate/Routing/ImplicitRouteBinding.php\\n/Users/web08/REPOLARAVEL/framework_base/vendor/laravel/framework/src/Illuminate/Routing/Router.php\\n/Users/web08/REPOLARAVEL/framework_base/vendor/laravel/framework/src/Illuminate/Routing/Middleware/SubstituteBindings.php\\n/Users/web08/REPOLARAVEL/framework_base/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php\\n/Users/web08/REPOLARAVEL/framework_base/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php\\n/Users/web08/REPOLARAVEL/framework_base/vendor/laravel/framework/src/Illuminate/Foundation/Http/Middleware/VerifyCsrfToken.php\\n/Users/web08/REPOLARAVEL/framework_base/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php\\n/Users/web08/REPOLARAVEL/framework_base/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php\\n/Users/web08/REPOLARAVEL/framework_base/vendor/laravel/framework/src/Illuminate/View/Middleware/ShareErrorsFromSession.php\\n/Users/web08/REPOLARAVEL/framework_base/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php\\n/Users/web08/REPOLARAVEL/framework_base/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php\\n/Users/web08/REPOLARAVEL/framework_base/vendor/laravel/framework/src/Illuminate/Session/Middleware/StartSession.php\\n/Users/web08/REPOLARAVEL/framework_base/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php\\n/Users/web08/REPOLARAVEL/framework_base/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php\\n/Users/web08/REPOLARAVEL/framework_base/vendor/laravel/framework/src/Illuminate/Cookie/Middleware/AddQueuedCookiesToResponse.php\\n/Users/web08/REPOLARAVEL/framework_base/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php\\n/Users/web08/REPOLARAVEL/framework_base/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php\\n/Users/web08/REPOLARAVEL/framework_base/vendor/laravel/framework/src/Illuminate/Cookie/Middleware/EncryptCookies.php\\n/Users/web08/REPOLARAVEL/framework_base/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php\\n/Users/web08/REPOLARAVEL/framework_base/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php\\n/Users/web08/REPOLARAVEL/framework_base/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php\\n/Users/web08/REPOLARAVEL/framework_base/vendor/laravel/framework/src/Illuminate/Routing/Router.php\\n/Users/web08/REPOLARAVEL/framework_base/vendor/laravel/framework/src/Illuminate/Routing/Router.php\\n/Users/web08/REPOLARAVEL/framework_base/vendor/laravel/framework/src/Illuminate/Routing/Router.php\\n/Users/web08/REPOLARAVEL/framework_base/vendor/laravel/framework/src/Illuminate/Routing/Router.php\\n/Users/web08/REPOLARAVEL/framework_base/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php\\n/Users/web08/REPOLARAVEL/framework_base/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php\\n/Users/web08/REPOLARAVEL/framework_base/vendor/barryvdh/laravel-debugbar/src/Middleware/InjectDebugbar.php\\n/Users/web08/REPOLARAVEL/framework_base/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php\\n/Users/web08/REPOLARAVEL/framework_base/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php\\n/Users/web08/REPOLARAVEL/framework_base/app/Http/Middleware/ForceSSLMiddleware.php\\n/Users/web08/REPOLARAVEL/framework_base/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php\\n/Users/web08/REPOLARAVEL/framework_base/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php\\n/Users/web08/REPOLARAVEL/framework_base/vendor/laravel/framework/src/Illuminate/Foundation/Http/Middleware/CheckForMaintenanceMode.php\\n/Users/web08/REPOLARAVEL/framework_base/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php\\n/Users/web08/REPOLARAVEL/framework_base/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php\\n/Users/web08/REPOLARAVEL/framework_base/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php\\n/Users/web08/REPOLARAVEL/framework_base/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php\\n/Users/web08/REPOLARAVEL/framework_base/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php\\n/Users/web08/REPOLARAVEL/framework_base/public/index.php\\n/Users/web08/.composer/vendor/laravel/valet/server.php', '2018-06-20 15:23:25', '2018-06-20 15:23:25');
INSERT INTO `errors` VALUES ('2', 'Class App\\LaraCms\\Website\\Controllers\\Auth\\Request does not exist', '/Users/web08/REPOLARAVEL/framework_base/vendor/laravel/framework/src/Illuminate/Routing/RouteSignatureParameters.php', '25', '/Users/web08/REPOLARAVEL/framework_base/vendor/laravel/framework/src/Illuminate/Routing/RouteSignatureParameters.php\\n\\n/Users/web08/REPOLARAVEL/framework_base/vendor/laravel/framework/src/Illuminate/Routing/RouteSignatureParameters.php\\n/Users/web08/REPOLARAVEL/framework_base/vendor/laravel/framework/src/Illuminate/Routing/Route.php\\n/Users/web08/REPOLARAVEL/framework_base/vendor/laravel/framework/src/Illuminate/Routing/ImplicitRouteBinding.php\\n/Users/web08/REPOLARAVEL/framework_base/vendor/laravel/framework/src/Illuminate/Routing/Router.php\\n/Users/web08/REPOLARAVEL/framework_base/vendor/laravel/framework/src/Illuminate/Routing/Middleware/SubstituteBindings.php\\n/Users/web08/REPOLARAVEL/framework_base/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php\\n/Users/web08/REPOLARAVEL/framework_base/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php\\n/Users/web08/REPOLARAVEL/framework_base/vendor/laravel/framework/src/Illuminate/Foundation/Http/Middleware/VerifyCsrfToken.php\\n/Users/web08/REPOLARAVEL/framework_base/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php\\n/Users/web08/REPOLARAVEL/framework_base/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php\\n/Users/web08/REPOLARAVEL/framework_base/vendor/laravel/framework/src/Illuminate/View/Middleware/ShareErrorsFromSession.php\\n/Users/web08/REPOLARAVEL/framework_base/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php\\n/Users/web08/REPOLARAVEL/framework_base/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php\\n/Users/web08/REPOLARAVEL/framework_base/vendor/laravel/framework/src/Illuminate/Session/Middleware/StartSession.php\\n/Users/web08/REPOLARAVEL/framework_base/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php\\n/Users/web08/REPOLARAVEL/framework_base/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php\\n/Users/web08/REPOLARAVEL/framework_base/vendor/laravel/framework/src/Illuminate/Cookie/Middleware/AddQueuedCookiesToResponse.php\\n/Users/web08/REPOLARAVEL/framework_base/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php\\n/Users/web08/REPOLARAVEL/framework_base/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php\\n/Users/web08/REPOLARAVEL/framework_base/vendor/laravel/framework/src/Illuminate/Cookie/Middleware/EncryptCookies.php\\n/Users/web08/REPOLARAVEL/framework_base/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php\\n/Users/web08/REPOLARAVEL/framework_base/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php\\n/Users/web08/REPOLARAVEL/framework_base/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php\\n/Users/web08/REPOLARAVEL/framework_base/vendor/laravel/framework/src/Illuminate/Routing/Router.php\\n/Users/web08/REPOLARAVEL/framework_base/vendor/laravel/framework/src/Illuminate/Routing/Router.php\\n/Users/web08/REPOLARAVEL/framework_base/vendor/laravel/framework/src/Illuminate/Routing/Router.php\\n/Users/web08/REPOLARAVEL/framework_base/vendor/laravel/framework/src/Illuminate/Routing/Router.php\\n/Users/web08/REPOLARAVEL/framework_base/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php\\n/Users/web08/REPOLARAVEL/framework_base/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php\\n/Users/web08/REPOLARAVEL/framework_base/vendor/barryvdh/laravel-debugbar/src/Middleware/InjectDebugbar.php\\n/Users/web08/REPOLARAVEL/framework_base/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php\\n/Users/web08/REPOLARAVEL/framework_base/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php\\n/Users/web08/REPOLARAVEL/framework_base/app/Http/Middleware/ForceSSLMiddleware.php\\n/Users/web08/REPOLARAVEL/framework_base/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php\\n/Users/web08/REPOLARAVEL/framework_base/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php\\n/Users/web08/REPOLARAVEL/framework_base/vendor/laravel/framework/src/Illuminate/Foundation/Http/Middleware/CheckForMaintenanceMode.php\\n/Users/web08/REPOLARAVEL/framework_base/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php\\n/Users/web08/REPOLARAVEL/framework_base/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php\\n/Users/web08/REPOLARAVEL/framework_base/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php\\n/Users/web08/REPOLARAVEL/framework_base/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php\\n/Users/web08/REPOLARAVEL/framework_base/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php\\n/Users/web08/REPOLARAVEL/framework_base/public/index.php\\n/Users/web08/.composer/vendor/laravel/valet/server.php', '2018-06-20 15:25:40', '2018-06-20 15:25:40');
INSERT INTO `errors` VALUES ('3', 'Class App\\LaraCms\\Website\\Controllers\\Auth\\Request does not exist', '/Users/web08/REPOLARAVEL/framework_base/vendor/laravel/framework/src/Illuminate/Routing/RouteSignatureParameters.php', '25', '/Users/web08/REPOLARAVEL/framework_base/vendor/laravel/framework/src/Illuminate/Routing/RouteSignatureParameters.php\\n\\n/Users/web08/REPOLARAVEL/framework_base/vendor/laravel/framework/src/Illuminate/Routing/RouteSignatureParameters.php\\n/Users/web08/REPOLARAVEL/framework_base/vendor/laravel/framework/src/Illuminate/Routing/Route.php\\n/Users/web08/REPOLARAVEL/framework_base/vendor/laravel/framework/src/Illuminate/Routing/ImplicitRouteBinding.php\\n/Users/web08/REPOLARAVEL/framework_base/vendor/laravel/framework/src/Illuminate/Routing/Router.php\\n/Users/web08/REPOLARAVEL/framework_base/vendor/laravel/framework/src/Illuminate/Routing/Middleware/SubstituteBindings.php\\n/Users/web08/REPOLARAVEL/framework_base/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php\\n/Users/web08/REPOLARAVEL/framework_base/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php\\n/Users/web08/REPOLARAVEL/framework_base/vendor/laravel/framework/src/Illuminate/Foundation/Http/Middleware/VerifyCsrfToken.php\\n/Users/web08/REPOLARAVEL/framework_base/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php\\n/Users/web08/REPOLARAVEL/framework_base/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php\\n/Users/web08/REPOLARAVEL/framework_base/vendor/laravel/framework/src/Illuminate/View/Middleware/ShareErrorsFromSession.php\\n/Users/web08/REPOLARAVEL/framework_base/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php\\n/Users/web08/REPOLARAVEL/framework_base/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php\\n/Users/web08/REPOLARAVEL/framework_base/vendor/laravel/framework/src/Illuminate/Session/Middleware/StartSession.php\\n/Users/web08/REPOLARAVEL/framework_base/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php\\n/Users/web08/REPOLARAVEL/framework_base/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php\\n/Users/web08/REPOLARAVEL/framework_base/vendor/laravel/framework/src/Illuminate/Cookie/Middleware/AddQueuedCookiesToResponse.php\\n/Users/web08/REPOLARAVEL/framework_base/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php\\n/Users/web08/REPOLARAVEL/framework_base/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php\\n/Users/web08/REPOLARAVEL/framework_base/vendor/laravel/framework/src/Illuminate/Cookie/Middleware/EncryptCookies.php\\n/Users/web08/REPOLARAVEL/framework_base/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php\\n/Users/web08/REPOLARAVEL/framework_base/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php\\n/Users/web08/REPOLARAVEL/framework_base/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php\\n/Users/web08/REPOLARAVEL/framework_base/vendor/laravel/framework/src/Illuminate/Routing/Router.php\\n/Users/web08/REPOLARAVEL/framework_base/vendor/laravel/framework/src/Illuminate/Routing/Router.php\\n/Users/web08/REPOLARAVEL/framework_base/vendor/laravel/framework/src/Illuminate/Routing/Router.php\\n/Users/web08/REPOLARAVEL/framework_base/vendor/laravel/framework/src/Illuminate/Routing/Router.php\\n/Users/web08/REPOLARAVEL/framework_base/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php\\n/Users/web08/REPOLARAVEL/framework_base/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php\\n/Users/web08/REPOLARAVEL/framework_base/vendor/barryvdh/laravel-debugbar/src/Middleware/InjectDebugbar.php\\n/Users/web08/REPOLARAVEL/framework_base/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php\\n/Users/web08/REPOLARAVEL/framework_base/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php\\n/Users/web08/REPOLARAVEL/framework_base/app/Http/Middleware/ForceSSLMiddleware.php\\n/Users/web08/REPOLARAVEL/framework_base/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php\\n/Users/web08/REPOLARAVEL/framework_base/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php\\n/Users/web08/REPOLARAVEL/framework_base/vendor/laravel/framework/src/Illuminate/Foundation/Http/Middleware/CheckForMaintenanceMode.php\\n/Users/web08/REPOLARAVEL/framework_base/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php\\n/Users/web08/REPOLARAVEL/framework_base/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php\\n/Users/web08/REPOLARAVEL/framework_base/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php\\n/Users/web08/REPOLARAVEL/framework_base/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php\\n/Users/web08/REPOLARAVEL/framework_base/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php\\n/Users/web08/REPOLARAVEL/framework_base/public/index.php\\n/Users/web08/.composer/vendor/laravel/valet/server.php', '2018-06-20 15:27:30', '2018-06-20 15:27:30');
INSERT INTO `errors` VALUES ('4', 'Class \'App\\LaraCms\\Website\\Controllers\\Auth\\Registered\' not found', '/Users/web08/REPOLARAVEL/framework_base/app/laraCms/Website/Controllers/Auth/RegisterController.php', '108', '\\n/Users/web08/REPOLARAVEL/framework_base/vendor/laravel/framework/src/Illuminate/Routing/Controller.php\\n/Users/web08/REPOLARAVEL/framework_base/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php\\n/Users/web08/REPOLARAVEL/framework_base/vendor/laravel/framework/src/Illuminate/Routing/Route.php\\n/Users/web08/REPOLARAVEL/framework_base/vendor/laravel/framework/src/Illuminate/Routing/Route.php\\n/Users/web08/REPOLARAVEL/framework_base/vendor/laravel/framework/src/Illuminate/Routing/Router.php\\n/Users/web08/REPOLARAVEL/framework_base/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php\\n/Users/web08/REPOLARAVEL/framework_base/app/Http/Middleware/RedirectIfAuthenticated.php\\n/Users/web08/REPOLARAVEL/framework_base/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php\\n/Users/web08/REPOLARAVEL/framework_base/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php\\n/Users/web08/REPOLARAVEL/framework_base/app/Http/Middleware/UserCart.php\\n/Users/web08/REPOLARAVEL/framework_base/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php\\n/Users/web08/REPOLARAVEL/framework_base/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php\\n/Users/web08/REPOLARAVEL/framework_base/vendor/mcamara/laravel-localization/src/Mcamara/LaravelLocalization/Middleware/LaravelLocalizationRedirectFilter.php\\n/Users/web08/REPOLARAVEL/framework_base/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php\\n/Users/web08/REPOLARAVEL/framework_base/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php\\n/Users/web08/REPOLARAVEL/framework_base/app/Http/Middleware/GF_ShieldMiddleware.php\\n/Users/web08/REPOLARAVEL/framework_base/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php\\n/Users/web08/REPOLARAVEL/framework_base/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php\\n/Users/web08/REPOLARAVEL/framework_base/vendor/laravel/framework/src/Illuminate/Routing/Middleware/SubstituteBindings.php\\n/Users/web08/REPOLARAVEL/framework_base/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php\\n/Users/web08/REPOLARAVEL/framework_base/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php\\n/Users/web08/REPOLARAVEL/framework_base/vendor/laravel/framework/src/Illuminate/Foundation/Http/Middleware/VerifyCsrfToken.php\\n/Users/web08/REPOLARAVEL/framework_base/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php\\n/Users/web08/REPOLARAVEL/framework_base/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php\\n/Users/web08/REPOLARAVEL/framework_base/vendor/laravel/framework/src/Illuminate/View/Middleware/ShareErrorsFromSession.php\\n/Users/web08/REPOLARAVEL/framework_base/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php\\n/Users/web08/REPOLARAVEL/framework_base/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php\\n/Users/web08/REPOLARAVEL/framework_base/vendor/laravel/framework/src/Illuminate/Session/Middleware/StartSession.php\\n/Users/web08/REPOLARAVEL/framework_base/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php\\n/Users/web08/REPOLARAVEL/framework_base/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php\\n/Users/web08/REPOLARAVEL/framework_base/vendor/laravel/framework/src/Illuminate/Cookie/Middleware/AddQueuedCookiesToResponse.php\\n/Users/web08/REPOLARAVEL/framework_base/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php\\n/Users/web08/REPOLARAVEL/framework_base/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php\\n/Users/web08/REPOLARAVEL/framework_base/vendor/laravel/framework/src/Illuminate/Cookie/Middleware/EncryptCookies.php\\n/Users/web08/REPOLARAVEL/framework_base/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php\\n/Users/web08/REPOLARAVEL/framework_base/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php\\n/Users/web08/REPOLARAVEL/framework_base/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php\\n/Users/web08/REPOLARAVEL/framework_base/vendor/laravel/framework/src/Illuminate/Routing/Router.php\\n/Users/web08/REPOLARAVEL/framework_base/vendor/laravel/framework/src/Illuminate/Routing/Router.php\\n/Users/web08/REPOLARAVEL/framework_base/vendor/laravel/framework/src/Illuminate/Routing/Router.php\\n/Users/web08/REPOLARAVEL/framework_base/vendor/laravel/framework/src/Illuminate/Routing/Router.php\\n/Users/web08/REPOLARAVEL/framework_base/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php\\n/Users/web08/REPOLARAVEL/framework_base/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php\\n/Users/web08/REPOLARAVEL/framework_base/vendor/barryvdh/laravel-debugbar/src/Middleware/InjectDebugbar.php\\n/Users/web08/REPOLARAVEL/framework_base/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php\\n/Users/web08/REPOLARAVEL/framework_base/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php\\n/Users/web08/REPOLARAVEL/framework_base/app/Http/Middleware/ForceSSLMiddleware.php\\n/Users/web08/REPOLARAVEL/framework_base/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php\\n/Users/web08/REPOLARAVEL/framework_base/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php\\n/Users/web08/REPOLARAVEL/framework_base/vendor/laravel/framework/src/Illuminate/Foundation/Http/Middleware/CheckForMaintenanceMode.php\\n/Users/web08/REPOLARAVEL/framework_base/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php\\n/Users/web08/REPOLARAVEL/framework_base/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php\\n/Users/web08/REPOLARAVEL/framework_base/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php\\n/Users/web08/REPOLARAVEL/framework_base/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php\\n/Users/web08/REPOLARAVEL/framework_base/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php\\n/Users/web08/REPOLARAVEL/framework_base/public/index.php\\n/Users/web08/.composer/vendor/laravel/valet/server.php', '2018-06-20 15:34:54', '2018-06-20 15:34:54');

-- ----------------------------
-- Table structure for `examples`
-- ----------------------------
DROP TABLE IF EXISTS `examples`;
CREATE TABLE `examples` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `article_id` int(11) NOT NULL,
  `article_2_id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `description_2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `doc` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image_crop` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image_media_id` int(11) DEFAULT NULL,
  `sort` int(11) DEFAULT '0',
  `pub` tinyint(4) DEFAULT '1',
  `color` varchar(7) COLLATE utf8_unicode_ci DEFAULT '0',
  `date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of examples
-- ----------------------------
INSERT INTO `examples` VALUES ('1', '1', '2', '', '', null, null, '', 'test.png', 'm-agutti-58.jpg', '0', '10', '1', '#80b0f0', '2017-08-09', '2017-08-23 18:20:05', '2019-04-11 03:46:50');

-- ----------------------------
-- Table structure for `example_article`
-- ----------------------------
DROP TABLE IF EXISTS `example_article`;
CREATE TABLE `example_article` (
  `example_id` int(10) unsigned NOT NULL,
  `article_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `example_article_example_id_index` (`example_id`),
  KEY `example_article_article_id_index` (`article_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of example_article
-- ----------------------------
INSERT INTO `example_article` VALUES ('1', '8', null, null);
INSERT INTO `example_article` VALUES ('1', '7', null, null);
INSERT INTO `example_article` VALUES ('1', '1', null, null);

-- ----------------------------
-- Table structure for `example_translations`
-- ----------------------------
DROP TABLE IF EXISTS `example_translations`;
CREATE TABLE `example_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `example_id` int(10) unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `description_2` text COLLATE utf8_unicode_ci,
  `seo_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `seo_description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `seo_no_index` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `update_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `example_translations_example_id_locale_unique` (`example_id`,`locale`),
  KEY `example_translations_locale_unique` (`locale`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of example_translations
-- ----------------------------
INSERT INTO `example_translations` VALUES ('1', '1', 'it', 'lorem-ipsum', 'Lorem ipsum', 'Lorem ipsum dolor sit amet consectetur adipisci elit', '<p>Lorem ipsum dolor sit amet consectetur adipisci elit&nbsp;</p>', '', '', '', '0', '0', '2017-08-23 18:20:05', '2017-08-23 18:20:05');
INSERT INTO `example_translations` VALUES ('2', '1', 'en', '111', '11', '', '', '', '', '', '0', '0', '2017-08-23 18:20:05', '2019-03-03 00:19:33');
INSERT INTO `example_translations` VALUES ('3', '1', 'es', '', '', '', '', '', '', '', '0', '0', '2019-03-03 00:19:33', '2019-03-03 00:19:33');
INSERT INTO `example_translations` VALUES ('4', '1', 'fr', '', '', '', '', '', '', '', '0', '0', '2019-03-03 00:19:33', '2019-03-03 00:19:33');

-- ----------------------------
-- Table structure for `hpsliders`
-- ----------------------------
DROP TABLE IF EXISTS `hpsliders`;
CREATE TABLE `hpsliders` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `icon` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `link` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sort` int(11) NOT NULL,
  `is_active` tinyint(4) DEFAULT '1',
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `hpsliders_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of hpsliders
-- ----------------------------
INSERT INTO `hpsliders` VALUES ('1', 'maguttiCms Slider', 'free open source CMS based on the Laravel PHP Framework', null, 'header2.jpg', '', 'laracms-slier', '200', '1', '0', '2016-12-28 01:34:38', '2017-08-02 21:17:01');
INSERT INTO `hpsliders` VALUES ('2', 'maguttiCms 5.6', 'A modular multilingual CMS built with Laravel 5.6', null, '87786-img011.jpg', '', 'laracms-53', '100', '1', '0', '2016-12-28 02:18:09', '2018-08-12 00:58:17');

-- ----------------------------
-- Table structure for `media`
-- ----------------------------
DROP TABLE IF EXISTS `media`;
CREATE TABLE `media` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `media_category_id` int(10) unsigned NOT NULL,
  `model_id` int(10) unsigned NOT NULL,
  `model_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `collection_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `alt` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `file_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `file_ext` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `disk` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `size` int(10) unsigned NOT NULL,
  `manipulations` text COLLATE utf8_unicode_ci NOT NULL,
  `pub` tinyint(4) DEFAULT '1',
  `sort` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `media_model_id_model_type_index` (`model_id`,`model_type`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of media
-- ----------------------------
INSERT INTO `media` VALUES ('2', '0', '2', 'App\\Article', 'images', '', null, '', 'ff0000.png', 'png', '', '14594', '', '1', null, '2018-05-03 17:55:26', '2018-05-03 17:55:26');
INSERT INTO `media` VALUES ('3', '0', '2', 'App\\Article', 'images', '', null, '', '24524-00ff00.png', 'png', '', '14903', '', '1', null, '2018-05-03 17:56:11', '2018-05-03 17:56:11');
INSERT INTO `media` VALUES ('4', '0', '1', 'App\\Example', 'images', '', null, '', 'blade-odd-even.jpg', 'jpg', 'media', '60117', '', '1', null, '2019-04-11 03:47:06', '2019-04-11 03:47:06');

-- ----------------------------
-- Table structure for `media_translations`
-- ----------------------------
DROP TABLE IF EXISTS `media_translations`;
CREATE TABLE `media_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `media_id` int(10) unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `alt` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `media_translations_media_id_locale_unique` (`media_id`,`locale`),
  KEY `media_translations_locale_index` (`locale`),
  CONSTRAINT `media_translations_media_id_foreign` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of media_translations
-- ----------------------------
INSERT INTO `media_translations` VALUES ('2', '2', 'it', 'ff0000.png', null, '', '2018-05-03 17:55:26', '2018-05-03 17:55:26');
INSERT INTO `media_translations` VALUES ('3', '3', 'it', '24524-00ff00.png', null, '', '2018-05-03 17:56:11', '2018-05-03 17:56:11');
INSERT INTO `media_translations` VALUES ('4', '4', 'en', 'blade-odd-even.jpg', null, '', '2019-04-11 03:47:06', '2019-04-11 03:47:06');

-- ----------------------------
-- Table structure for `migrations`
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES ('2014_10_12_000000_create_users_table', '1');
INSERT INTO `migrations` VALUES ('2014_10_12_100000_create_password_resets_table', '1');
INSERT INTO `migrations` VALUES ('2015_08_23_104442_create_products_table', '1');
INSERT INTO `migrations` VALUES ('2015_08_23_123427_add_paid_to_products', '1');
INSERT INTO `migrations` VALUES ('2015_08_27_133226_create_articles_table', '1');
INSERT INTO `migrations` VALUES ('2015_08_28_101039_add_media_to_articles_table', '1');
INSERT INTO `migrations` VALUES ('2015_08_29_151840_entrust_setup_tables', '1');
INSERT INTO `migrations` VALUES ('2015_08_29_173518_add_is_active_to_users_table', '1');
INSERT INTO `migrations` VALUES ('2015_12_06_191101_create_object_translation_table', '1');
INSERT INTO `migrations` VALUES ('2015_12_07_161911_article_translations', '1');
INSERT INTO `migrations` VALUES ('2015_12_20_135234_add_password_real_to_users_table', '1');
INSERT INTO `migrations` VALUES ('2015_12_23_205357_create_socials_table', '2');
INSERT INTO `migrations` VALUES ('2015_12_26_180448_create_hpsliders', '3');
INSERT INTO `migrations` VALUES ('2015_12_28_173515_add_subtitle_intro_abstract_to_article_table', '4');
INSERT INTO `migrations` VALUES ('2015_12_28_173917_add_subtitle_abstract_to_article_translations_table', '4');
INSERT INTO `migrations` VALUES ('2016_01_03_185806_add_subtitle_intro_to_article_translations', '5');
INSERT INTO `migrations` VALUES ('2016_01_03_190819_create_news_table', '6');
INSERT INTO `migrations` VALUES ('2016_01_03_190932_create_news_translations_table', '7');
INSERT INTO `migrations` VALUES ('2016_01_03_191050_create_media_table', '8');
INSERT INTO `migrations` VALUES ('2016_01_03_191145_create_media_translations_table', '9');
INSERT INTO `migrations` VALUES ('2016_01_09_213704_create_tags_table', '10');
INSERT INTO `migrations` VALUES ('2016_01_23_141830_create_contact_table', '11');
INSERT INTO `migrations` VALUES ('2016_01_23_141830_create_contacts_table', '12');
INSERT INTO `migrations` VALUES ('2016_01_27_195512_create_adminusers_table', '12');
INSERT INTO `migrations` VALUES ('2016_07_06_154403_create_newsletters_table', '13');
INSERT INTO `migrations` VALUES ('2016_08_04_150202_create_adminuser_role', '14');
INSERT INTO `migrations` VALUES ('2016_08_09_125134_create_countries_table', '15');
INSERT INTO `migrations` VALUES ('2016_08_09_135031_create_settings_table', '16');

-- ----------------------------
-- Table structure for `news`
-- ----------------------------
DROP TABLE IF EXISTS `news`;
CREATE TABLE `news` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `domain` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `date` date NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `doc` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `link` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sort` int(11) NOT NULL,
  `pub` tinyint(4) DEFAULT '1',
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of news
-- ----------------------------
INSERT INTO `news` VALUES ('1', '', '2017-07-25', '', '', 'pinoscotto11', '96281-dedprifxoaaxql6.jpg', 'DEDpRifXoAAXql6.jpg', null, '10', '1', '0', '2017-07-11 15:18:08', '2019-04-06 06:59:43');
INSERT INTO `news` VALUES ('2', '', '2017-07-25', '', '', 'pinoscotto11', '96281-dedprifxoaaxql6.jpg', 'DEDpRifXoAAXql6.jpg', null, '10', '1', '0', '2019-02-17 22:22:30', '2019-02-17 22:22:30');
INSERT INTO `news` VALUES ('3', '', '2017-07-25', '', '', 'pinoscotto11', '96281-dedprifxoaaxql6.jpg', 'DEDpRifXoAAXql6.jpg', null, '10', '1', '0', '2019-02-17 22:34:24', '2019-02-17 22:34:24');
INSERT INTO `news` VALUES ('4', '', '2017-07-25', '', '', 'pinoscotto11', '96281-dedprifxoaaxql6.jpg', 'DEDpRifXoAAXql6.jpg', null, '10', '1', '0', '2019-02-17 22:34:26', '2019-02-17 22:34:26');

-- ----------------------------
-- Table structure for `newsletters`
-- ----------------------------
DROP TABLE IF EXISTS `newsletters`;
CREATE TABLE `newsletters` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `locale` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'locale   code',
  `sort` int(11) NOT NULL,
  `pub` tinyint(4) DEFAULT '1',
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of newsletters
-- ----------------------------
INSERT INTO `newsletters` VALUES ('1', '', '7832@qq.com', 'en', '0', '1', '0', '2019-04-26 05:04:32', '2019-04-26 05:04:32');

-- ----------------------------
-- Table structure for `news_tag`
-- ----------------------------
DROP TABLE IF EXISTS `news_tag`;
CREATE TABLE `news_tag` (
  `news_id` int(10) unsigned NOT NULL,
  `tag_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `news_tag_news_id_index` (`news_id`),
  KEY `news_tag_tag_id_index` (`tag_id`),
  CONSTRAINT `news_tag_news_id_foreign` FOREIGN KEY (`news_id`) REFERENCES `news` (`id`) ON DELETE CASCADE,
  CONSTRAINT `news_tag_tag_id_foreign` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of news_tag
-- ----------------------------

-- ----------------------------
-- Table structure for `news_translations`
-- ----------------------------
DROP TABLE IF EXISTS `news_translations`;
CREATE TABLE `news_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `news_id` int(10) unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `abstract` text COLLATE utf8_unicode_ci,
  `subtitle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `intro` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `seo_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `seo_description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `update_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `news_translations_news_id_locale_unique` (`news_id`,`locale`),
  KEY `news_translations_locale_index` (`locale`),
  CONSTRAINT `news_translations_news_id_foreign` FOREIGN KEY (`news_id`) REFERENCES `news` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of news_translations
-- ----------------------------
INSERT INTO `news_translations` VALUES ('1', 'titolo-della-news-1', '1', 'it', 'Titolo della news 1', '<p>wqeqweqweqw</p>', null, null, null, '', '', '0', '0', '2017-07-11 15:18:08', '2017-08-02 17:21:57');
INSERT INTO `news_translations` VALUES ('2', 'news-one-title', '1', 'en', 'News  one  title 12', '<p>&egrave;llp</p>', null, null, null, 'ree', '', '0', '0', '2017-07-11 15:18:08', '2019-04-06 06:59:43');
INSERT INTO `news_translations` VALUES ('3', '', '1', 'es', '', '', null, null, null, '', '', '0', '0', '2018-08-12 00:44:56', '2018-08-12 00:44:56');
INSERT INTO `news_translations` VALUES ('4', '', '1', 'fr', '', '', null, null, null, '', '', '0', '0', '2018-08-12 00:44:56', '2018-08-12 00:44:56');

-- ----------------------------
-- Table structure for `orders`
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `cart_id` int(11) NOT NULL,
  `products_cost` varchar(255) NOT NULL DEFAULT '',
  `shipping_cost` varchar(255) NOT NULL DEFAULT '',
  `vat_cost` varchar(255) NOT NULL,
  `total_cost` varchar(255) NOT NULL DEFAULT '',
  `billing_address_id` int(11) NOT NULL,
  `shipping_address_id` int(11) NOT NULL,
  `token` varchar(32) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `order_token_unique` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orders
-- ----------------------------

-- ----------------------------
-- Table structure for `order_items`
-- ----------------------------
DROP TABLE IF EXISTS `order_items`;
CREATE TABLE `order_items` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `cartitem_id` int(11) NOT NULL,
  `product_code` varchar(255) NOT NULL DEFAULT '',
  `product_model_code` varchar(255) DEFAULT '',
  `quantity` int(11) NOT NULL,
  `price` float NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order_items
-- ----------------------------

-- ----------------------------
-- Table structure for `password_resets`
-- ----------------------------
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`),
  KEY `password_resets_token_index` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of password_resets
-- ----------------------------
INSERT INTO `password_resets` VALUES ('user@magutti.com', '$2y$10$w7x4hzpu36UXSNLzkNstE.utn8CasEFA1R9UfpQ6XDyDX/RvfLjWq', '2019-04-11 03:50:08');

-- ----------------------------
-- Table structure for `payments`
-- ----------------------------
DROP TABLE IF EXISTS `payments`;
CREATE TABLE `payments` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `payment_method_id` int(11) NOT NULL,
  `is_paid` tinyint(4) NOT NULL,
  `code` varchar(255) NOT NULL DEFAULT '',
  `transaction` varchar(255) NOT NULL,
  `notes` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of payments
-- ----------------------------

-- ----------------------------
-- Table structure for `payment_methods`
-- ----------------------------
DROP TABLE IF EXISTS `payment_methods`;
CREATE TABLE `payment_methods` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '',
  `code` varchar(10) NOT NULL,
  `is_active` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of payment_methods
-- ----------------------------
INSERT INTO `payment_methods` VALUES ('1', 'Paypal', 'paypal', '1', '2018-06-15 16:26:08', '2019-04-17 10:21:05');
INSERT INTO `payment_methods` VALUES ('2', 'bank Transafer', 'bank', '1', '2018-06-15 16:26:26', '2018-08-12 01:01:19');

-- ----------------------------
-- Table structure for `permissions`
-- ----------------------------
DROP TABLE IF EXISTS `permissions`;
CREATE TABLE `permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_name_unique` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of permissions
-- ----------------------------

-- ----------------------------
-- Table structure for `permission_role`
-- ----------------------------
DROP TABLE IF EXISTS `permission_role`;
CREATE TABLE `permission_role` (
  `permission_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `permission_role_role_id_foreign` (`role_id`),
  CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of permission_role
-- ----------------------------

-- ----------------------------
-- Table structure for `products`
-- ----------------------------
DROP TABLE IF EXISTS `products`;
CREATE TABLE `products` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `category_id` int(10) unsigned DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `subtitle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `price` float NOT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `doc` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `video` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sort` int(11) NOT NULL,
  `pub` tinyint(4) DEFAULT '1',
  `seo_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `seo_description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `products_code_unique` (`code`),
  UNIQUE KEY `products_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of products
-- ----------------------------
INSERT INTO `products` VALUES ('1', 'PRDA', '1', '', '', '', null, '10', 'A.png', null, '', '30', '1', null, null, '0', '2017-08-02 18:09:39', '2018-08-12 01:00:07');
INSERT INTO `products` VALUES ('2', 'PRDB', '2', '', '', '', null, '20', 'B.png', null, '', '10', '1', null, null, '0', '2018-06-13 22:49:32', '2018-06-13 22:49:32');
INSERT INTO `products` VALUES ('3', 'PRDC', '3', '', '', '', null, '30', '22.jpg', null, '', '0', '1', null, null, '0', '2018-06-13 22:50:05', '2019-04-26 04:59:01');

-- ----------------------------
-- Table structure for `product_models`
-- ----------------------------
DROP TABLE IF EXISTS `product_models`;
CREATE TABLE `product_models` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(10) unsigned NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sort` int(11) NOT NULL,
  `pub` tinyint(4) DEFAULT '1',
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of product_models
-- ----------------------------

-- ----------------------------
-- Table structure for `product_model_translations`
-- ----------------------------
DROP TABLE IF EXISTS `product_model_translations`;
CREATE TABLE `product_model_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_model_id` int(10) NOT NULL,
  `locale` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `created_by` int(10) unsigned NOT NULL,
  `update_by` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of product_model_translations
-- ----------------------------

-- ----------------------------
-- Table structure for `product_translations`
-- ----------------------------
DROP TABLE IF EXISTS `product_translations`;
CREATE TABLE `product_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `subtitle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `doc` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `permalink` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `seo_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `seo_description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_by` int(10) unsigned NOT NULL,
  `update_by` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `products_translations_product_id_locale_unique` (`product_id`,`locale`),
  KEY `products_translations_locale_index` (`locale`),
  CONSTRAINT `products_translations_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of product_translations
-- ----------------------------
INSERT INTO `product_translations` VALUES ('1', 'prodotto-a', '1', 'it', 'Prodotto A', '', '', null, 'prodotti/prima-categoria/prodotto-a', '', '', '0', '0', '2017-08-02 18:09:39', '2019-04-11 03:49:33');
INSERT INTO `product_translations` VALUES ('2', 'product-number-1', '1', 'en', 'Product number 1', 'product number 1 subtitle', '', null, 'products/first-category/product-number-1', '', '', '0', '0', '2017-08-02 18:09:39', '2019-04-17 10:29:34');
INSERT INTO `product_translations` VALUES ('3', 'prodotto-b', '2', 'it', 'Prodotto B', '', '', null, '', '', '', '0', '0', '2018-06-13 22:49:32', '2018-06-13 22:49:32');
INSERT INTO `product_translations` VALUES ('4', 'product-b', '2', 'en', 'Product B', '', '', null, 'productb', '', '', '0', '0', '2018-06-13 22:49:32', '2019-04-11 03:45:32');
INSERT INTO `product_translations` VALUES ('5', 'prodotto-c', '3', 'it', 'Prodotto C', '', '', null, '', null, null, '0', '0', '2018-06-13 22:50:05', '2019-04-17 10:26:58');
INSERT INTO `product_translations` VALUES ('6', 'product-c', '3', 'en', 'Product C', '', '', null, '', null, null, '0', '0', '2018-06-13 22:50:05', '2019-04-17 10:26:57');
INSERT INTO `product_translations` VALUES ('7', '', '1', 'es', '', '', '', null, '', '', '', '0', '0', '2018-08-12 00:59:53', '2018-08-12 00:59:53');
INSERT INTO `product_translations` VALUES ('8', '', '1', 'fr', '', '', '', null, '', '', '', '0', '0', '2018-08-12 00:59:53', '2018-08-12 00:59:53');
INSERT INTO `product_translations` VALUES ('9', '', '3', 'es', '', '', '', null, '', null, null, '0', '0', '2019-04-11 03:44:04', '2019-04-17 10:26:58');
INSERT INTO `product_translations` VALUES ('10', '', '3', 'fr', '', '', '', null, '', null, null, '0', '0', '2019-04-11 03:44:04', '2019-04-17 10:26:58');
INSERT INTO `product_translations` VALUES ('11', '', '2', 'es', '', '', '', null, '', '', '', '0', '0', '2019-04-11 03:45:33', '2019-04-11 03:45:33');
INSERT INTO `product_translations` VALUES ('12', '', '2', 'fr', '', '', '', null, '', '', '', '0', '0', '2019-04-11 03:45:33', '2019-04-11 03:45:33');

-- ----------------------------
-- Table structure for `provinces`
-- ----------------------------
DROP TABLE IF EXISTS `provinces`;
CREATE TABLE `provinces` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `country_id` int(8) NOT NULL,
  `state_id` int(8) NOT NULL,
  `title` varchar(255) NOT NULL,
  `code` varchar(32) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_region` (`state_id`),
  KEY `id_country` (`country_id`)
) ENGINE=MyISAM AUTO_INCREMENT=111 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of provinces
-- ----------------------------
INSERT INTO `provinces` VALUES ('1', '109', '19', 'Agrigento', 'AG', '0000-00-00 00:00:00', '2016-09-30 15:19:55');
INSERT INTO `provinces` VALUES ('2', '109', '2', 'Alessandria', 'AL', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `provinces` VALUES ('3', '109', '11', 'Ancona', 'AN', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `provinces` VALUES ('4', '109', '1', 'Aosta', 'AO', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `provinces` VALUES ('5', '109', '5', 'Arezzo', 'AR', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `provinces` VALUES ('6', '109', '11', 'Ascoli Piceno', 'AP', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `provinces` VALUES ('7', '109', '2', 'Asti', 'AT', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `provinces` VALUES ('8', '109', '15', 'Avellino', 'AV', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `provinces` VALUES ('9', '109', '16', 'Bari', 'BA', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `provinces` VALUES ('10', '109', '6', 'Belluno', 'BL', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `provinces` VALUES ('11', '109', '15', 'Benevento', 'BN', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `provinces` VALUES ('12', '109', '7', 'Bergamo', 'BG', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `provinces` VALUES ('13', '109', '2', 'Biella', 'BI', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `provinces` VALUES ('14', '109', '8', 'Bologna', 'BO', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `provinces` VALUES ('15', '109', '12', 'Bolzano', 'BZ', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `provinces` VALUES ('16', '109', '7', 'Brescia', 'BS', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `provinces` VALUES ('17', '109', '16', 'Brindisi', 'BR', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `provinces` VALUES ('18', '109', '20', 'Cagliari', 'CA', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `provinces` VALUES ('19', '109', '19', 'Caltanissetta', 'CL', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `provinces` VALUES ('20', '109', '14', 'Campobasso', 'CB', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `provinces` VALUES ('21', '109', '20', 'Carbonia-Iglesias', 'CI', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `provinces` VALUES ('22', '109', '15', 'Caserta', 'CE', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `provinces` VALUES ('23', '109', '19', 'Catania', 'CT', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `provinces` VALUES ('24', '109', '18', 'Catanzaro', 'CZ', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `provinces` VALUES ('25', '109', '13', 'Chieti', 'CH', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `provinces` VALUES ('26', '109', '7', 'Como', 'CO', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `provinces` VALUES ('27', '109', '18', 'Cosenza', 'CS', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `provinces` VALUES ('28', '109', '7', 'Cremona', 'CR', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `provinces` VALUES ('29', '109', '18', 'Crotone', 'KR', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `provinces` VALUES ('30', '109', '2', 'Cuneo', 'CN', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `provinces` VALUES ('31', '109', '19', 'Enna', 'EN', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `provinces` VALUES ('32', '109', '8', 'Ferrara', 'FE', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `provinces` VALUES ('33', '109', '5', 'Firenze', 'FI', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `provinces` VALUES ('34', '109', '16', 'Foggia', 'FG', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `provinces` VALUES ('35', '109', '8', 'Forlì-Cesena', 'FC', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `provinces` VALUES ('36', '109', '9', 'Frosinone', 'FR', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `provinces` VALUES ('37', '109', '3', 'Genova', 'GE', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `provinces` VALUES ('38', '109', '4', 'Gorizia', 'GO', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `provinces` VALUES ('39', '109', '5', 'Grosseto', 'GR', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `provinces` VALUES ('40', '109', '3', 'Imperia', 'IM', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `provinces` VALUES ('41', '109', '14', 'Isernia', 'IS', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `provinces` VALUES ('42', '109', '3', 'La Spezia', 'SP', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `provinces` VALUES ('43', '109', '13', 'L\'Aquila', 'AQ', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `provinces` VALUES ('44', '109', '9', 'Latina', 'LT', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `provinces` VALUES ('45', '109', '16', 'Lecce', 'LE', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `provinces` VALUES ('46', '109', '7', 'Lecco', 'LC', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `provinces` VALUES ('47', '109', '5', 'Livorno', 'LI', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `provinces` VALUES ('48', '109', '7', 'Lodi', 'LO', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `provinces` VALUES ('49', '109', '5', 'Lucca', 'LU', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `provinces` VALUES ('50', '109', '11', 'Macerata', 'MC', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `provinces` VALUES ('51', '109', '7', 'Mantova', 'MN', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `provinces` VALUES ('52', '109', '5', 'Massa-Carrara', 'MS', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `provinces` VALUES ('53', '109', '17', 'Matera', 'MT', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `provinces` VALUES ('54', '109', '19', 'Messina', 'ME', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `provinces` VALUES ('55', '109', '7', 'Milano', 'MI', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `provinces` VALUES ('56', '109', '8', 'Modena', 'MO', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `provinces` VALUES ('57', '109', '15', 'Napoli', 'NA', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `provinces` VALUES ('58', '109', '2', 'Novara', 'NO', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `provinces` VALUES ('59', '109', '20', 'Nuoro', 'NU', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `provinces` VALUES ('60', '109', '20', 'Olbia-Tempio', 'OT', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `provinces` VALUES ('61', '109', '20', 'Oristano', 'OR', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `provinces` VALUES ('62', '109', '6', 'Padova', 'PD', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `provinces` VALUES ('63', '109', '19', 'Palermo', 'PA', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `provinces` VALUES ('64', '109', '8', 'Parma', 'PR', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `provinces` VALUES ('65', '109', '7', 'Pavia', 'PV', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `provinces` VALUES ('66', '109', '10', 'Perugia', 'PG', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `provinces` VALUES ('67', '109', '11', 'Pesaro', 'PU', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `provinces` VALUES ('68', '109', '13', 'Pescara', 'PE', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `provinces` VALUES ('69', '109', '8', 'Piacenza', 'PC', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `provinces` VALUES ('70', '109', '5', 'Pisa', 'PI', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `provinces` VALUES ('71', '109', '5', 'Pistoia', 'PT', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `provinces` VALUES ('72', '109', '4', 'Pordenone', 'PN', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `provinces` VALUES ('73', '109', '17', 'Potenza', 'PZ', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `provinces` VALUES ('74', '109', '5', 'Prato', 'PO', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `provinces` VALUES ('75', '109', '19', 'Ragusa', 'RG', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `provinces` VALUES ('76', '109', '8', 'Ravenna', 'RA', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `provinces` VALUES ('77', '109', '18', 'Reggio Calabria', 'RC', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `provinces` VALUES ('78', '109', '8', 'Reggio Emilia', 'RE', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `provinces` VALUES ('79', '109', '9', 'Rieti', 'RI', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `provinces` VALUES ('80', '109', '8', 'Rimini', 'RN', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `provinces` VALUES ('81', '109', '9', 'Roma', 'RM', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `provinces` VALUES ('82', '109', '6', 'Rovigo', 'RO', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `provinces` VALUES ('83', '109', '15', 'Salerno', 'SA', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `provinces` VALUES ('84', '109', '20', 'Medio Campidano', 'VS', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `provinces` VALUES ('85', '109', '20', 'Sassari', 'SS', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `provinces` VALUES ('86', '109', '3', 'Savona', 'SV', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `provinces` VALUES ('87', '109', '5', 'Siena', 'SI', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `provinces` VALUES ('88', '109', '19', 'Siracusa', 'SR', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `provinces` VALUES ('89', '109', '7', 'Sondrio', 'SO', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `provinces` VALUES ('90', '109', '16', 'Taranto', 'TA', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `provinces` VALUES ('91', '109', '13', 'Teramo', 'TE', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `provinces` VALUES ('92', '109', '10', 'Terni', 'TR', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `provinces` VALUES ('93', '109', '2', 'Torino', 'TO', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `provinces` VALUES ('94', '109', '20', 'Ogliastra', 'OG', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `provinces` VALUES ('95', '109', '19', 'Trapani', 'TP', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `provinces` VALUES ('96', '109', '12', 'Trento', 'TN', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `provinces` VALUES ('97', '109', '6', 'Treviso', 'TV', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `provinces` VALUES ('98', '109', '4', 'Trieste', 'TS', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `provinces` VALUES ('99', '109', '4', 'Udine', 'UD', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `provinces` VALUES ('100', '109', '7', 'Varese', 'VA', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `provinces` VALUES ('101', '109', '6', 'Venezia', 'VE', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `provinces` VALUES ('102', '109', '2', 'Verbano-Cusio-Ossola', 'VB', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `provinces` VALUES ('103', '109', '2', 'Vercelli', 'VC', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `provinces` VALUES ('104', '109', '6', 'Verona', 'VR', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `provinces` VALUES ('105', '109', '18', 'Vibo Valentia', 'VV', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `provinces` VALUES ('106', '109', '6', 'Vicenza', 'VI', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `provinces` VALUES ('107', '109', '9', 'Viterbo', 'VT', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `provinces` VALUES ('108', '109', '16', 'Barletta Andria Trani', 'BT', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `provinces` VALUES ('109', '109', '11', 'Fermo', 'FM', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `provinces` VALUES ('110', '109', '7', 'Monza e Brianza ', 'MB', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- ----------------------------
-- Table structure for `roles`
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO `roles` VALUES ('1', 'su', 'super user', 'can do all', '2015-12-21 02:23:32', '2015-12-21 02:23:32');
INSERT INTO `roles` VALUES ('2', 'admin', 'admin', 'admi  user', '2015-12-21 02:26:36', '2015-12-21 02:26:36');
INSERT INTO `roles` VALUES ('3', 'user', 'user', 'user role', '2015-12-21 02:50:58', '2015-12-21 02:50:58');
INSERT INTO `roles` VALUES ('7', 'Guest', 'guest', 'guest user', '2015-12-28 21:37:23', '2015-12-28 21:37:23');

-- ----------------------------
-- Table structure for `role_user`
-- ----------------------------
DROP TABLE IF EXISTS `role_user`;
CREATE TABLE `role_user` (
  `user_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `role_user_role_id_foreign` (`role_id`),
  CONSTRAINT `role_user_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `role_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of role_user
-- ----------------------------
INSERT INTO `role_user` VALUES ('1', '1');
INSERT INTO `role_user` VALUES ('1', '3');

-- ----------------------------
-- Table structure for `settings`
-- ----------------------------
DROP TABLE IF EXISTS `settings`;
CREATE TABLE `settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `domain` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `settings_key_unique` (`key`),
  KEY `settings_id_index` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of settings
-- ----------------------------
INSERT INTO `settings` VALUES ('1', 'GA_CODE', 'UA-', 'Codice  google  analitycs', 'GA', '2016-08-09 20:01:24', '2016-08-09 20:28:06');
INSERT INTO `settings` VALUES ('2', 'credits_url', 'https:/magutti.com', 'url credits', 'webiste', '2016-08-09 20:29:05', '2016-12-29 22:35:06');
INSERT INTO `settings` VALUES ('3', 'GMAPS_KEY', '', 'Google maps apy key', '', '2016-12-28 01:28:54', '2016-12-29 17:24:44');
INSERT INTO `settings` VALUES ('4', 'iubenda_code_it', 'asd', '', '', '2018-06-05 15:08:21', '2018-06-05 15:08:21');
INSERT INTO `settings` VALUES ('5', 'iubenda_code_en', 'fgh', '', '', '2018-06-05 15:10:35', '2018-06-05 15:10:35');
INSERT INTO `settings` VALUES ('6', 'iubenda_site', 'jkl', '', '', '2018-06-05 15:10:49', '2018-06-05 15:10:49');

-- ----------------------------
-- Table structure for `socials`
-- ----------------------------
DROP TABLE IF EXISTS `socials`;
CREATE TABLE `socials` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `icon` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `link` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sort` int(11) NOT NULL,
  `is_active` tinyint(4) DEFAULT '1',
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of socials
-- ----------------------------
INSERT INTO `socials` VALUES ('1', 'facebook', null, 'fa-facebook-f', '', 'http://www.facebook.com', '10', '1', '0', '2016-08-09 20:50:01', '2016-08-09 18:50:01');
INSERT INTO `socials` VALUES ('2', 'Twitter', '', 'fa-twitter', '', 'http://www.twitter.com', '20', '1', '0', '2016-06-28 20:58:53', '2016-06-28 18:58:53');
INSERT INTO `socials` VALUES ('3', 'Linkedin', '', 'fa-linkedin-in', '', 'http://www.linkedin.com', '30', '1', '0', '2016-06-28 20:58:59', '2016-06-28 18:58:59');

-- ----------------------------
-- Table structure for `special_prices`
-- ----------------------------
DROP TABLE IF EXISTS `special_prices`;
CREATE TABLE `special_prices` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `product_code` varchar(255) NOT NULL DEFAULT '',
  `list_code` varchar(10) NOT NULL,
  `price` float NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of special_prices
-- ----------------------------

-- ----------------------------
-- Table structure for `states`
-- ----------------------------
DROP TABLE IF EXISTS `states`;
CREATE TABLE `states` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `country_id` int(8) NOT NULL,
  `title` varchar(255) NOT NULL,
  `zone` varchar(32) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_country` (`country_id`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of states
-- ----------------------------
INSERT INTO `states` VALUES ('1', '109', 'Valle d\'Aosta', 'north', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `states` VALUES ('2', '109', 'Piemonte', 'north', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `states` VALUES ('3', '109', 'Liguria', 'north', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `states` VALUES ('4', '109', 'Friuli Venezia Giulia', 'north', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `states` VALUES ('5', '109', 'Toscana', 'center', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `states` VALUES ('6', '109', 'Veneto', 'north', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `states` VALUES ('7', '109', 'Lombardia', 'north', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `states` VALUES ('8', '109', 'Emilia Romagna', 'north', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `states` VALUES ('9', '109', 'Lazio', 'center', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `states` VALUES ('10', '109', 'Umbria', 'center', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `states` VALUES ('11', '109', 'Marche', 'center', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `states` VALUES ('12', '109', 'Trentino Alto Adige', 'north', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `states` VALUES ('13', '109', 'Abruzzo', 'south', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `states` VALUES ('14', '109', 'Molise', 'south', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `states` VALUES ('15', '109', 'Campania', 'south', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `states` VALUES ('16', '109', 'Puglia', 'south', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `states` VALUES ('17', '109', 'Basilicata', 'south', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `states` VALUES ('18', '109', 'Calabria', 'south', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `states` VALUES ('19', '109', 'Sicilia', 'south', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `states` VALUES ('20', '109', 'Sardegna', 'center', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- ----------------------------
-- Table structure for `tags`
-- ----------------------------
DROP TABLE IF EXISTS `tags`;
CREATE TABLE `tags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `created_by` int(10) unsigned NOT NULL,
  `update_by` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of tags
-- ----------------------------
INSERT INTO `tags` VALUES ('1', '', 'tag', '0', '0', '2016-12-28 02:07:28', '2016-12-28 01:07:28');
INSERT INTO `tags` VALUES ('2', '', 'php', '0', '0', '2016-12-28 01:07:15', '2016-12-28 01:07:15');
INSERT INTO `tags` VALUES ('4', '', 'artisan', '0', '0', '2017-08-02 22:01:53', '2017-08-02 22:01:53');
INSERT INTO `tags` VALUES ('5', '', 'laravel', '0', '0', '2019-04-11 03:47:34', '2019-04-11 03:47:34');

-- ----------------------------
-- Table structure for `tag_translations`
-- ----------------------------
DROP TABLE IF EXISTS `tag_translations`;
CREATE TABLE `tag_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tag_id` int(10) unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tag_translations_tag_id_locale_unique` (`tag_id`,`locale`),
  KEY `tag_translations_locale_index` (`locale`),
  CONSTRAINT `tag_translations_tag_id_foreign` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of tag_translations
-- ----------------------------
INSERT INTO `tag_translations` VALUES ('1', '1', 'en', 'Tag', '2016-12-28 02:07:07', '2016-12-28 01:07:07');
INSERT INTO `tag_translations` VALUES ('2', '1', 'it', 'tag', '2016-12-27 22:46:45', '2016-12-27 21:46:45');
INSERT INTO `tag_translations` VALUES ('3', '2', 'en', 'PHP', '2016-12-28 01:07:15', '2016-12-28 01:07:15');
INSERT INTO `tag_translations` VALUES ('4', '2', 'it', 'Php', '2016-12-28 01:07:15', '2017-08-02 22:02:09');
INSERT INTO `tag_translations` VALUES ('7', '4', 'it', 'Artisan', '2017-08-02 22:01:53', '2017-08-02 22:01:53');
INSERT INTO `tag_translations` VALUES ('8', '4', 'en', 'Artisan', '2017-08-02 22:01:53', '2017-08-02 22:01:53');
INSERT INTO `tag_translations` VALUES ('9', '1', 'es', 'tag', '2019-04-11 03:47:26', '2019-04-11 03:47:26');
INSERT INTO `tag_translations` VALUES ('10', '1', 'fr', '', '2019-04-11 03:47:26', '2019-04-11 03:47:26');
INSERT INTO `tag_translations` VALUES ('11', '5', 'en', 'laravel', '2019-04-11 03:47:34', '2019-04-11 03:47:34');
INSERT INTO `tag_translations` VALUES ('12', '5', 'it', '', '2019-04-11 03:47:34', '2019-04-11 03:47:34');
INSERT INTO `tag_translations` VALUES ('13', '5', 'es', '', '2019-04-11 03:47:34', '2019-04-11 03:47:34');
INSERT INTO `tag_translations` VALUES ('14', '5', 'fr', '', '2019-04-11 03:47:34', '2019-04-11 03:47:34');

-- ----------------------------
-- Table structure for `users`
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `gender` varchar(1) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `real_password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `list_code` varchar(10) COLLATE utf8_unicode_ci DEFAULT '',
  `is_active` tinyint(4) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', 'test', 'user@magutti.com', 'M', '$2y$10$nSpZLy5yt1j43AuCGKrPH.Qa0m/8lIRxHGMHGzIYpU39.NicTQqQ6', '12345678', '6bcalqQ4bUf5W4gbgBqcajBtrNI1HLH2AIY1uVVt8E1311NHnLIY70KzH6dp', '', '1', '2017-07-07 21:37:30', '2019-04-26 10:30:37');
INSERT INTO `users` VALUES ('6', 'Angelo marco Asperti', 'marco@magutti.com', '', '$2y$10$E2z1k.YNZXxE6O.czXTrueFjtazPNSVNF7dmC.VusocCnpoaJ1Sp.', null, 'd1KFvIUzwEvnWWOedGhDKBBNQb5rOwYjkCr6zcfN08rSvuM7fOKzRQixU7oh', '', '1', '2019-04-11 03:55:15', '2019-04-26 10:31:33');
INSERT INTO `users` VALUES ('7', 'zongyan', 'zongyan@qq.com', '', '$2y$10$D91wxl5V76hwpwNngAj8pe6q.ME58zBKlwuLlUMDkQammyTi1sB6O', null, null, '', '1', '2019-04-26 04:50:51', '2019-04-26 10:30:22');

-- ----------------------------
-- Table structure for `video--`
-- ----------------------------
DROP TABLE IF EXISTS `video--`;
CREATE TABLE `video--` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `vid` char(20) NOT NULL DEFAULT '' COMMENT 'è§†é¢‘ID',
  `title` char(80) NOT NULL DEFAULT '' COMMENT 'è§†é¢‘æ ‡é¢˜',
  `subtitle` char(80) NOT NULL DEFAULT '' COMMENT 'è§†é¢‘å‰¯æ ‡é¢˜',
  `source` char(50) DEFAULT '' COMMENT 'æ¥æº',
  `sourcelink` char(200) NOT NULL DEFAULT '',
  `author` char(50) NOT NULL DEFAULT '',
  `categoryid` mediumint(8) NOT NULL DEFAULT '0' COMMENT 'æ ç›®ID',
  `thumb` char(150) NOT NULL DEFAULT '' COMMENT 'è§†é¢‘å°é¢',
  `keyword` char(50) NOT NULL DEFAULT '' COMMENT 'è§†é¢‘å…³é”®å­—',
  `description` text NOT NULL COMMENT 'è§†é¢‘ç®€ä»‹',
  `duration` int(11) NOT NULL DEFAULT '0' COMMENT 'è§†é¢‘æ—¶é•¿',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'æ–‡ç« çŠ¶æ€ 0 é€šè¿‡ -1 å¾…å®¡æ ¸ -2 è‰ç¨¿',
  `video_status` tinyint(1) NOT NULL DEFAULT '20' COMMENT 'è§†é¢‘çŠ¶æ€',
  `url` char(200) NOT NULL DEFAULT '',
  `islink` tinyint(1) NOT NULL DEFAULT '0',
  `hits` int(10) NOT NULL DEFAULT '0' COMMENT 'è®¿é—®æ¬¡æ•°',
  `digs` int(11) NOT NULL DEFAULT '0' COMMENT 'é¡¶æ•°',
  `stamps` int(11) NOT NULL DEFAULT '0' COMMENT 'è¸©æ•°',
  `toptime` int(11) NOT NULL DEFAULT '0',
  `createtime` int(11) NOT NULL DEFAULT '0' COMMENT 'æ·»åŠ æ—¶é—´',
  `listorder` mediumint(8) NOT NULL DEFAULT '0' COMMENT 'æŽ’åº',
  `pubtime` int(11) NOT NULL DEFAULT '0' COMMENT 'å‘å¸ƒæ—¶é—´',
  PRIMARY KEY (`id`),
  KEY `categoryid` (`categoryid`),
  KEY `status` (`status`,`video_status`) USING BTREE,
  KEY `listorder` (`listorder`),
  KEY `toptime` (`toptime`)
) ENGINE=InnoDB AUTO_INCREMENT=248 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of video--
-- ----------------------------
INSERT INTO `video--` VALUES ('8', '-N3GwN47o60', 'åå·æ¥¼ä¸­æˆ·test1', '', '', '', '', '150', 'http://test.img01.cucimg.com/M01/07/91/cR9D6FPMx-Leka6QAABHxGc7bOs296.jpg', 'å®žæ‹,wanwenqi888', 'åå·æ¥¼ä¸­æˆ·test1', '93807', '-1', '10', 'http://www.cuc.edu.cn//8.html', '0', '0', '0', '0', '0', '1405935399', '0', '1405935399');
INSERT INTO `video--` VALUES ('9', '1YUtfizBW_o', 'åå·æ¥¼ä¸­æˆ·test2', '', '', '', '', '150', 'http://test.img01.cucimg.com/M01/07/9A/cR9D6FPMzwyWt7ksAABHxGc7bOs836-2.jpg', 'å®žæ‹,çŽ°åœº,wanwenqi888', 'åå·æ¥¼ä¸­æˆ·test2', '93807', '0', '20', 'http://www.cuc.edu.cn//9.html', '0', '0', '0', '0', '0', '1405935399', '0', '1405935399');
INSERT INTO `video--` VALUES ('24', '1234', '2014ç ”ç©¶ç”Ÿæ¯•ä¸šå…¸ç¤¼ï¼ˆä¸Šï¼‰', '', 'æ’­éŸ³ä¸»æŒè‰ºæœ¯å­¦é™¢', '', '', '205', 'http://img01.cuctv.com/M00/2F/C5/cR9ARlPsSCfg0GjoAAEinol_mUA349.jpg', 'æ­¦æ±‰ä¼ åª’,ä¸»é¢˜,2014', '<h1 style=\"margin:0px 0px 5px;padding:0px;font-size:14px;font-weight:normal;color:#666666;font-family:å®‹ä½“, Tahoma, Helvetica, Arial, sans-serif;white-space:normal;background-color:#FFFFFF;\">\r\n	2014ç ”ç©¶ç”Ÿæ¯•ä¸šå…¸ç¤¼ï¼ˆä¸Šï¼‰\r\n</h1>', '93807', '0', '20', 'http://www.cuc.edu.cn/dst/24.html', '1', '919', '0', '0', '0', '1407993437', '0', '1407993387');
INSERT INTO `video--` VALUES ('25', '12345', '2014ç ”ç©¶ç”Ÿæ¯•ä¸šå…¸ç¤¼ï¼ˆä¸Šï¼‰', '', 'æ ¡ç”µè§†å°', '', '', '205', 'http://img01.cuctv.com/M00/62/18/dNXNClPsSIyQUVm3AAEinnroTIc369.jpg', 'æ•…äº‹', '<h1 style=\"margin:0px 0px 5px;padding:0px;font-size:14px;font-weight:normal;color:#666666;font-family:å®‹ä½“, Tahoma, Helvetica, Arial, sans-serif;white-space:normal;background-color:#FFFFFF;\">\r\n	2014ç ”ç©¶ç”Ÿæ¯•ä¸šå…¸ç¤¼ï¼ˆä¸Šï¼‰\r\n</h1>\r\n<h1 style=\"margin:0px 0px 5px;padding:0px;font-size:14px;font-weight:normal;color:#666666;font-family:å®‹ä½“, Tahoma, Helvetica, Arial, sans-serif;white-space:normal;background-color:#FFFFFF;\">\r\n</h1>', '93807', '0', '20', 'http://www.cuc.edu.cn/dst/25.html', '1', '843', '0', '0', '0', '1407993470', '0', '1407993441');
INSERT INTO `video--` VALUES ('26', 'NDfInDBz1IU', '2014ç ”ç©¶ç”Ÿæ¯•ä¸šå…¸ç¤¼ï¼ˆä¸‹ï¼‰', '', 'æ ¡ç”µè§†å°', '', '', '205', 'http://img01.cuctv.com/M00/B1/33/cR8oB1PsSKi7pVM-AAAUvSSW7os497.jpg', 'æ€»å†³èµ›', '<h1 style=\"margin:0px 0px 5px;padding:0px;font-size:14px;font-weight:normal;color:#666666;font-family:å®‹ä½“, Tahoma, Helvetica, Arial, sans-serif;white-space:normal;background-color:#FFFFFF;\">\r\n	<h3 style=\"margin:0px;padding:0px 0px 0px 5px;font-size:14px;line-height:48px;color:#555555;font-family:å®‹ä½“, Helvetica, Arial, sans-serif;white-space:normal;\">\r\n		2014ç ”ç©¶ç”Ÿæ¯•ä¸šå…¸ç¤¼ï¼ˆä¸‹ï¼‰\r\n	</h3>\r\n</h1>\r\n<h1 style=\"margin:0px 0px 5px;padding:0px;font-size:14px;font-weight:normal;color:#666666;font-family:å®‹ä½“, Tahoma, Helvetica, Arial, sans-serif;white-space:normal;background-color:#FFFFFF;\">\r\n</h1>', '93807', '0', '20', 'http://www.cuc.edu.cn/dst/26.html', '1', '686', '0', '0', '0', '1407993498', '0', '1407993472');
INSERT INTO `video--` VALUES ('41', 'hUU2mIHe4hE', 'ã€ç­é‰´ã€‘2010è¡Œæ”¿ç®¡ç†', '', '', '', '', '166', 'http://img01.cuctv.com/M01/5A/37/dNXNClQX9lrl5aL_AAjAit4F9BA330.png', 'æ ¡å›­,éŸ³ä¹,æ¯•ä¸šå­£,baiyang001', 'ã€ç­é‰´ã€‘2010è¡Œæ”¿ç®¡ç†', '480778', '0', '20', 'http://www.cuc.edu.cn/bjzl/41.html', '0', '921', '5', '0', '1410579960', '1410579979', '96', '1410579979');
INSERT INTO `video--` VALUES ('42', 'Qk_4PcLC0HI', 'ã€ç­é‰´ã€‘2010æ–‡è‰ºç¼–å¯¼', '', '', '', '', '166', 'http://img01.cuctv.com/M01/1D/7D/cR9ARlQX9fORcJ0EAAV7s-vE01o558.png', 'æ ¡å›­,éŸ³ä¹,æ¯•ä¸šå­£,baiyang001', 'å¹¿é™¢å†è§MVæœ€ç»ˆç‰ˆ', '237400', '0', '20', 'http://www.cuc.edu.cn/bjzl/42.html', '0', '859', '0', '0', '1410585000', '1410585011', '97', '1410585011');
INSERT INTO `video--` VALUES ('46', 'jLGS0bE5gzU', 'ä¸­å›½ä¼ åª’å¤§å­¦å®£ä¼ ç‰‡', '', '', '', '', '140', 'http://img01.cuctv.com/M01/85/87/dNXNClQVShCvdZ-sAACSrhrd2p4579.jpg', 'å®£ä¼ ç‰‡,baiyang001', '<span style=\"font-size:18px;\">ä¸­å›½ä¼ åª’å¤§å­¦å®£ä¼ ç‰‡ã€‚</span>', '753407', '0', '20', 'http://www.cuc.edu.cn/video/46.html', '0', '1074', '43', '4', '1410659880', '1410659926', '0', '1410659926');
INSERT INTO `video--` VALUES ('47', 'zbZ8c2CS8mE', 'å…‰ åŒ—äº¬å›½é™…ç”µå­éŸ³ä¹èŠ‚ç”µå­éŸ³ä¹ä½œæ›²æ¯”èµ›ä¸‰ç­‰å¥–', '', 'è‰ºæœ¯å­¦éƒ¨', '', 'é­æ¿›', '140', 'http://img01.cuctv.com/M01/3C/11/cR9ARlQU8gHxFLXGAAAodBJW5b8967.jpg', 'ç”µå­éŸ³ä¹', '<span style=\"font-size:18px;\">æ­¤ç‰‡è£èŽ·åŒ—äº¬å›½é™…ç”µå­éŸ³ä¹èŠ‚ç”µå­éŸ³ä¹ä½œæ›²æ¯”èµ›ä¸‰ç­‰å¥–ã€‚</span>', '312810', '0', '20', 'http://www.cuc.edu.cn/video/47.html', '0', '1564', '3', '0', '1410659880', '1410659926', '0', '1410659926');
INSERT INTO `video--` VALUES ('48', 'haa68Grr7KI', 'æ—¥è½åŒ—äº¬16æ—¶59åˆ† å…¨å›½è®¡ç®—æœºè®¾è®¡å¤§èµ›ä¸€ç­‰å¥–', '', 'è‰ºæœ¯å­¦éƒ¨', '', ' æ›¹é›¨æ¿›', '140', 'http://img01.cuctv.com/M00/C7/45/cR9ARlQU-C_diqqvAAAz6qabhdU217.jpg', 'ç”µå­éŸ³ä¹', '<span style=\"font-size:18px;\">æ­¤ç‰‡è£èŽ·å…¨å›½è®¡ç®—æœºè®¾è®¡å¤§èµ›ä¸€ç­‰å¥–ã€‚</span>', '266000', '0', '20', 'http://www.cuc.edu.cn/video/48.html', '0', '753', '1', '0', '1410660660', '1410660677', '0', '1410660677');
INSERT INTO `video--` VALUES ('49', 'KcP79GQ-l24', 'åŠŸå¤«å…”ä¸ŽèœåŒ…ç‹—å¤§åå‡»', '', 'è‰ºæœ¯å­¦éƒ¨', '', 'æŽæ™ºå‹‡', '151', 'http://img01.cuctv.com/M02/55/AD/cR9ARlQU-lWEObzUAAAvmkQ_usU497.jpg', 'åŠ¨ç”»', '<span style=\"font-size:18px;\">æœ¬ç‰‡æ˜¯ç”±ä¸­å›½ä¼ åª’å¤§å­¦å‡ºå“ï¼Œ</span><span style=\"line-height:2;font-size:18px;\">è‘—ååŠ¨ç”»äººæŽæ™ºå‹‡çŽ‡å°†å°†å°†åŠ¨ç”»å·¥ä½œå®¤æ‰“é€ çš„ç²¾å“åŠ¨ç”»ã€‚</span>', '362287', '0', '20', 'http://www.cuc.edu.cn/dongman/49.html', '0', '1234', '2', '0', '1410661260', '1410661314', '0', '1410661314');
INSERT INTO `video--` VALUES ('52', 'z5WdyrLXWO4', 'ã€ç­é‰´ã€‘2010è¯‘åˆ¶', '', '', '', '', '166', 'http://img01.cuctv.com/M00/8C/0F/cR9ARlQU-Zfn5Qf-AABsZz8-yoU083.jpg', 'æ ¡å›­,mv,éŸ³ä¹,æ¯•ä¸šå­£,baiyang001', 'ã€ç­é‰´ã€‘2010è¯‘åˆ¶', '286871', '0', '20', 'http://www.cuc.edu.cn/bjzl/52.html', '0', '585', '0', '0', '1410661440', '1410661449', '0', '1410661449');
INSERT INTO `video--` VALUES ('53', 'fChwrUlclTE', 'ã€ç­é‰´ã€‘2010å…‰ä¿¡æ¯ç§‘å­¦ä¸ŽæŠ€æœ¯', '', '', '', '', '166', 'http://img01.cuctv.com/M00/67/C3/cR9ARlQU-gDTSPbVAAAihTegT_0413.jpg', 'æ ¡å›­,mv,éŸ³ä¹,æ¯•ä¸šå­£,baiyang001', 'ã€ç­é‰´ã€‘2010å…‰ä¿¡æ¯ç§‘å­¦ä¸ŽæŠ€æœ¯', '247823', '0', '20', 'http://www.cuc.edu.cn/bjzl/53.html', '0', '590', '0', '0', '1410661440', '1410661449', '0', '1410661449');
INSERT INTO `video--` VALUES ('54', 'J03_jYsFyh8', 'ã€ç­é‰´ã€‘2010æ—¥è¯­', '', '', '', '', '166', 'http://img01.cuctv.com/M01/E0/37/cR9ARlQU-iiGKXMEAABUy_UeaX8187.jpg', 'æ ¡å›­,mv,éŸ³ä¹,æ¯•ä¸šå­£,baiyang001', 'ã€ç­é‰´ã€‘2010æ—¥è¯­', '433810', '0', '20', 'http://www.cuc.edu.cn/bjzl/54.html', '0', '661', '0', '0', '1410661440', '1410661449', '0', '1410661449');
INSERT INTO `video--` VALUES ('55', '4pJoasq6iUI', 'ã€ç­é‰´ã€‘2010ä¿¡æ¯ä¸Žè®¡ç®—ç§‘å­¦', '', '', '', '', '166', 'http://img01.cuctv.com/M01/71/C7/cR9ARlQU-kiKvHmbAABGRVDsZtU242.jpg', 'æ ¡å›­,mv,éŸ³ä¹,æ¯•ä¸šå­£,baiyang001', 'ã€ç­é‰´ã€‘2010ä¿¡æ¯ä¸Žè®¡ç®—ç§‘å­¦', '346267', '0', '20', 'http://www.cuc.edu.cn/bjzl/55.html', '0', '824', '0', '0', '1410661440', '1410661449', '0', '1410661449');
INSERT INTO `video--` VALUES ('56', 'JIYWDy2fCFo', 'ã€ç­é‰´ã€‘2010è®¡ç®—æœºæŠ€æœ¯ä¸Žç§‘å­¦', '', '', '', '', '166', 'http://img01.cuctv.com/M02/AA/FB/cR9ARlQU-mn0NNAgAABV_uaRl48134.jpg', 'æ ¡å›­,mv,éŸ³ä¹,æ¯•ä¸šå­£,baiyang001', 'ã€ç­é‰´ã€‘2010è®¡ç®—æœºæŠ€æœ¯ä¸Žç§‘å­¦', '275567', '0', '20', 'http://www.cuc.edu.cn/bjzl/56.html', '0', '625', '0', '0', '1410661440', '1410661449', '0', '1410661449');
INSERT INTO `video--` VALUES ('57', 'M3lrG-kngIc', 'ã€ç­é‰´ã€‘2010æœé²œè¯­', '', '', '', '', '166', 'http://img01.cuctv.com/M00/79/C7/cR9ARlQU_c-LNMy2AABhZiMyvwg352.jpg', 'æ ¡å›­,éŸ³ä¹,mv,æ¯•ä¸šå­£,baiyang001', 'ã€ç­é‰´ã€‘2010æœé²œè¯­', '283867', '0', '20', 'http://www.cuc.edu.cn/bjzl/57.html', '0', '648', '0', '0', '1410662460', '1410662514', '0', '1410662514');
INSERT INTO `video--` VALUES ('58', 'y37CXXfFfrU', 'ã€ç­é‰´ã€‘2010è‡ªåŠ¨åŒ–', '', '', '', '', '166', 'http://img01.cuctv.com/M00/D6/A5/cR9ARlQU_iWt5g63AABQyYkz2X4648.jpg', 'æ ¡å›­,mv,æ¯•ä¸šå­£,éŸ³ä¹,baiyang001', 'ã€ç­é‰´ã€‘2010è‡ªåŠ¨åŒ–', '331880', '0', '20', 'http://www.cuc.edu.cn/bjzl/58.html', '0', '686', '0', '0', '1410662460', '1410662514', '0', '1410662514');
INSERT INTO `video--` VALUES ('59', 'IO62WoDFyeA', 'ã€ç­é‰´ã€‘2010ä¿„è¯­', '', '', '', '', '166', 'http://img01.cuctv.com/M00/8A/C7/cR9ARlQU_q30r3xqAABbYJQ10Gs586.jpg', 'æ ¡å›­,éŸ³ä¹,mv,æ¯•ä¸šå­£,baiyang001', 'ã€ç­é‰´ã€‘2010ä¿„è¯­', '379658', '0', '20', 'http://www.cuc.edu.cn/bjzl/59.html', '0', '628', '0', '0', '1410662460', '1410662514', '0', '1410662514');
INSERT INTO `video--` VALUES ('60', 'qtLKePuG8wU', 'ã€ç­é‰´ã€‘2010åœŸè¯­', '', '', '', '', '166', 'http://img01.cuctv.com/M00/23/99/cR9ARlQU_5C5LXgAAABHLhmvs1c815.jpg', 'æ ¡å›­,mv,éŸ³ä¹,æ¯•ä¸šå­£,baiyang001', 'ã€ç­é‰´ã€‘2010åœŸè¯­', '200328', '0', '20', 'http://www.cuc.edu.cn/bjzl/60.html', '0', '822', '0', '0', '1410662460', '1410662514', '0', '1410662514');
INSERT INTO `video--` VALUES ('61', 'zwZNs87OIKE', 'é¢å…· åŒ—äº¬å›½é™…ç”µå­éŸ³ä¹èŠ‚ç”µå­éŸ³ä¹ä½œæ›²æ¯”èµ›ä¸€ç­‰å¥–', '', 'è‰ºæœ¯å­¦éƒ¨', '', 'ç½—ä¾èŽŽ', '140', 'http://img01.cuctv.com/M01/BD/F4/cR8oB1QVS0baR4rxAAICR0i0EWw684.jpg', 'ç”µå­éŸ³ä¹', '<span style=\"font-size:18px;\">æ­¤ç‰‡è£èŽ·åŒ—äº¬å›½é™…ç”µå­éŸ³ä¹èŠ‚ç”µå­éŸ³ä¹ä½œæ›²æ¯”èµ›ä¸€ç­‰å¥–ã€‚</span>', '622000', '0', '20', 'http://www.cuc.edu.cn/video/61.html', '0', '1460', '11', '0', '1410663000', '1410663009', '0', '1410663009');
INSERT INTO `video--` VALUES ('62', 'IeYYx_UhJto', 'ã€ç­é‰´ã€‘2010å¹¿æ’­ç”µè§†å·¥ç¨‹', '', '', '', '', '166', 'http://img01.cuctv.com/M01/81/21/cR9ARlQVAHbLkJXIAABDab8du5I309.jpg', 'æ ¡å›­,éŸ³ä¹,mv,æ¯•ä¸šå­£,baiyang001', 'ã€ç­é‰´ã€‘2010å¹¿æ’­ç”µè§†å·¥ç¨‹', '544600', '0', '20', 'http://www.cuc.edu.cn/bjzl/62.html', '0', '937', '0', '0', '1410663720', '1410663749', '0', '1410663749');
INSERT INTO `video--` VALUES ('63', 'dplzzeoKaOY', 'ã€ç­é‰´ã€‘2010è‘¡è¯­', '', '', '', '', '166', 'http://img01.cuctv.com/M01/AA/FF/cR9ARlQVAHawWSWLAABOh2q1OJw469.jpg', 'æ ¡å›­,mv,éŸ³ä¹,æ¯•ä¸šå­£,baiyang001', 'ã€ç­é‰´ã€‘2010è‘¡è¯­', '300026', '0', '20', 'http://www.cuc.edu.cn/bjzl/63.html', '0', '761', '0', '0', '1410663720', '1410663749', '0', '1410663749');
INSERT INTO `video--` VALUES ('64', 'wUceTFL3UJg', 'ã€ç­é‰´ã€‘2010å›½é™…æ–°é—»', '', '', '', '', '166', 'http://img01.cuctv.com/M00/F6/08/cR9ARlQVAYKEXJ34AABpBnacKxo173.jpg', 'æ ¡å›­,éŸ³ä¹,mv,æ¯•ä¸šå­£,baiyang001', 'ã€ç­é‰´ã€‘2010å›½é™…æ–°é—»', '244667', '0', '20', 'http://www.cuc.edu.cn/bjzl/64.html', '0', '755', '0', '0', '1410663720', '1410663749', '0', '1410663749');
INSERT INTO `video--` VALUES ('65', 'DTi9uJ9lq_M', 'ã€ç­é‰´ã€‘2010è‹±è¯­æ’­éŸ³', '', '', '', '', '166', 'http://img01.cuctv.com/M01/EE/C3/cR9ARlQVA42JAPSvAAA_JGUN274420.jpg', 'æ ¡å›­,mv,éŸ³ä¹,æ¯•ä¸šå­£,baiyang001', 'ã€ç­é‰´ã€‘2010è‹±è¯­æ’­éŸ³', '540267', '0', '20', 'http://www.cuc.edu.cn/bjzl/65.html', '0', '885', '3', '0', '1410663720', '1410663749', '0', '1410663749');
INSERT INTO `video--` VALUES ('66', 'BVLwgU3fh0s', 'ã€ç­é‰´ã€‘2010æ„å¤§åˆ©è¯­', '', '', '', '', '166', 'http://img01.cuctv.com/M01/FD/97/cR9ARlQVBFLhPlD6AABhqoUQU0g720.jpg', 'æ ¡å›­,éŸ³ä¹,mv,æ¯•ä¸šå­£,baiyang001', 'ã€ç­é‰´ã€‘2010æ„å¤§åˆ©è¯­', '531221', '0', '20', 'http://www.cuc.edu.cn/bjzl/66.html', '0', '684', '0', '0', '1410663720', '1410663749', '0', '1410663749');
INSERT INTO `video--` VALUES ('67', 'fnXueQZ_dxY', 'ã€ç­é‰´ã€‘2010å›½é™…ç»æµŽä¸Žè´¸æ˜“', '', '', '', '', '166', 'http://img01.cuctv.com/M02/AA/83/cR9ARlQVBdaUIHZSAABSF6dHt7s163.jpg', 'æ ¡å›­,mv,éŸ³ä¹,æ¯•ä¸šå­£,baiyang001', 'ã€ç­é‰´ã€‘2010å›½é™…ç»æµŽä¸Žè´¸æ˜“', '84004', '0', '20', 'http://www.cuc.edu.cn/bjzl/67.html', '0', '563', '0', '0', '1410664500', '1410664515', '0', '1410664515');
INSERT INTO `video--` VALUES ('68', 'W3kHC4z4_a4', 'ã€ç­é‰´ã€‘2010è‹±è¯­', '', '', '', '', '166', 'http://img01.cuctv.com/M02/37/D4/cR9ARlQVBd2_0V52AABKE1YAFjc586.jpg', 'æ ¡å›­,éŸ³ä¹,æ¯•ä¸šå­£,mv,baiyang001', '', '340800', '0', '20', 'http://www.cuc.edu.cn/bjzl/68.html', '0', '667', '0', '0', '1410664500', '1410664515', '0', '1410664515');
INSERT INTO `video--` VALUES ('69', 'FRhl5sL61r0', 'ã€ç­é‰´ã€‘2010å·¥å•†ç®¡ç†', '', '', '', '', '166', 'http://img01.cuctv.com/M01/D4/B8/cR9ARlQVBkyvcdIyAABWxcqYQt8964.jpg', 'æ ¡å›­,mv,éŸ³ä¹,æ¯•ä¸šå­£,baiyang001', 'ã€ç­é‰´ã€‘2010å·¥å•†ç®¡ç†', '380050', '0', '20', 'http://www.cuc.edu.cn/bjzl/69.html', '0', '597', '0', '0', '1410664500', '1410664515', '0', '1410664515');
INSERT INTO `video--` VALUES ('70', 'GwuK2dZXuWw', 'ã€ç­é‰´ã€‘2012é«˜èŒç”µè§†æ‘„åƒ', '', '', '', '', '166', 'http://img01.cuctv.com/M01/6A/B7/cR9ARlQVBwSeuwVoAABjf6Y1nNY808.jpg', 'æ ¡å›­,éŸ³ä¹,mv,æ¯•ä¸šå­£,baiyang001', 'ã€ç­é‰´ã€‘2012é«˜èŒç”µè§†æ‘„åƒ', '275378', '0', '20', 'http://www.cuc.edu.cn/bjzl/70.html', '0', '670', '0', '0', '1410664500', '1410664515', '0', '1410664515');
INSERT INTO `video--` VALUES ('71', 'v8lvP3wvSmY', 'ã€ç­é‰´ã€‘2010å¸‚åœºè¥é”€', '', '', '', '', '166', 'http://img01.cuctv.com/M01/D7/95/cR9ARlQVBx6VhDurAABZfYR_lK4099.jpg', 'æ ¡å›­,mv,éŸ³ä¹,æ¯•ä¸šå­£,baiyang001', 'ã€ç­é‰´ã€‘2010å¸‚åœºè¥é”€', '633673', '0', '20', 'http://www.cuc.edu.cn/bjzl/71.html', '0', '707', '0', '0', '1410664500', '1410664515', '0', '1410664515');
INSERT INTO `video--` VALUES ('72', 'ML-gWbSDwSM', 'ã€ç­é‰´ã€‘2010ä¼šè®¡å­¦', '', '', '', '', '166', 'http://img01.cuctv.com/M01/FC/87/cR9ARlQVB4nuEdFzAACFihORa48787.jpg', 'æ ¡å›­,éŸ³ä¹,mv,æ¯•ä¸šå­£,baiyang001', 'ã€ç­é‰´ã€‘2010ä¼šè®¡å­¦', '649600', '0', '20', 'http://www.cuc.edu.cn/bjzl/72.html', '0', '803', '42', '0', '1410664500', '1410664515', '0', '1410664515');
INSERT INTO `video--` VALUES ('73', 'c6ocH8gpdE0', 'ã€ç­é‰´ã€‘2010ç”µè§†ç¼–å¯¼', '', '', '', '', '166', 'http://img01.cuctv.com/M01/84/31/cR9ARlQVB5y9KQ-3AAA8-1rWD0E204.jpg', 'æ ¡å›­,éŸ³ä¹,mv,æ¯•ä¸šå­£,baiyang001', 'ã€ç­é‰´ã€‘2010ç”µè§†ç¼–å¯¼', '226500', '0', '20', 'http://www.cuc.edu.cn/bjzl/73.html', '0', '885', '0', '0', '1410664500', '1410664515', '0', '1410664515');
INSERT INTO `video--` VALUES ('74', 'YwULwiFVvpc', 'ã€ç­é‰´ã€‘2010ä¿¡æ¯ç®¡ç†ä¸Žä¿¡æ¯ç³»ç»Ÿ', '', '', '', '', '166', 'http://img01.cuctv.com/M01/59/E7/cR9ARlQVCFX5VqkQAABviZcoEkk311.jpg', 'æ ¡å›­,mv,éŸ³ä¹,æ¯•ä¸šå­£,baiyang001', 'ã€ç­é‰´ã€‘2010ä¿¡æ¯ç®¡ç†ä¸Žä¿¡æ¯ç³»ç»Ÿ', '363698', '0', '20', 'http://www.cuc.edu.cn/bjzl/74.html', '0', '602', '1', '0', '1410665700', '1410665700', '0', '1410665700');
INSERT INTO `video--` VALUES ('75', 'ua5Mtw-Bj_k', 'ã€ç­é‰´ã€‘2010æ–‡åŒ–äº§ä¸šï¼ˆå½±è§†åˆ¶ç‰‡æ–¹å‘ï¼‰', '', '', '', '', '166', 'http://img01.cuctv.com/M01/71/41/cR9ARlQVCPystmj7AABYB3FZbeI401.jpg', 'æ ¡å›­,mv,éŸ³ä¹,æ¯•ä¸šå­£,baiyang001', 'ã€ç­é‰´ã€‘2010æ–‡åŒ–äº§ä¸šï¼ˆå½±è§†åˆ¶ç‰‡æ–¹å‘ï¼‰', '822878', '0', '20', 'http://www.cuc.edu.cn/bjzl/75.html', '0', '715', '0', '0', '1410665700', '1410665700', '0', '1410665700');
INSERT INTO `video--` VALUES ('76', '5UQi_BzGgzM', 'ã€ç­é‰´ã€‘2010ä¼ åª’ç»æµŽ', '', '', '', '', '166', 'http://img01.cuctv.com/M01/C0/1B/cR9ARlQVCS_rUJlXAABMx9-lMSQ274.jpg', 'æ ¡å›­,mv,éŸ³ä¹,æ¯•ä¸šå­£,baiyang001', 'ã€ç­é‰´ã€‘2010ä¼ åª’ç»æµŽ', '239134', '0', '20', 'http://www.cuc.edu.cn/bjzl/76.html', '0', '742', '1', '0', '1410665700', '1410665700', '0', '1410665700');
INSERT INTO `video--` VALUES ('77', 'Tz4RI6t_SF8', 'ã€ç­é‰´ã€‘2012æ’­åŒ', '', '', '', '', '166', 'http://img01.cuctv.com/M02/11/34/cR9ARlQVClupjkl5AABp89xIPK4362.jpg', 'æ ¡å›­,mv,éŸ³ä¹,æ¯•ä¸šå­£,baiyang001', 'ã€ç­é‰´ã€‘2012æ’­åŒ', '543734', '0', '20', 'http://www.cuc.edu.cn/bjzl/77.html', '0', '867', '0', '0', '1410665700', '1410665700', '0', '1410665700');
INSERT INTO `video--` VALUES ('78', 'On8qDzr686A', 'ã€ç­é‰´ã€‘2012é«˜èŒå½±è§†åŠ¨ç”»', '', '', '', '', '166', 'http://img01.cuctv.com/M02/B9/4D/cR9ARlQVCrn47rkWAABGHegZhYs021.jpg', 'æ ¡å›­,mv,éŸ³ä¹,æ¯•ä¸šå­£,baiyang001', 'ã€ç­é‰´ã€‘2012é«˜èŒå½±è§†åŠ¨ç”»', '631534', '0', '20', 'http://www.cuc.edu.cn/bjzl/78.html', '0', '717', '0', '0', '1410665700', '1410665700', '0', '1410665700');
INSERT INTO `video--` VALUES ('79', 'nTxuxP_k1ZU', 'ã€ç­é‰´ã€‘2010æ–‡åŒ–äº§ä¸šï¼ˆæ–‡åŒ–ç»çºªæ–¹å‘ï¼‰', '', '', '', '', '166', 'http://img01.cuctv.com/M02/42/B8/cR9ARlQVCxHPvPLSAAAr4jCcuNg724.jpg', 'æ ¡å›­,mv,éŸ³ä¹,æ¯•ä¸šå­£,baiyang001', 'ã€ç­é‰´ã€‘2010æ–‡åŒ–äº§ä¸šï¼ˆæ–‡åŒ–ç»çºªæ–¹å‘ï¼‰', '371142', '0', '20', 'http://www.cuc.edu.cn/bjzl/79.html', '0', '695', '5', '0', '1410665700', '1410665700', '0', '1410665700');
INSERT INTO `video--` VALUES ('80', '1MI5KZ8JS30', 'ã€ç­é‰´ã€‘2010æ³•å­¦', '', '', '', '', '166', 'http://img01.cuctv.com/M02/7A/63/dNXNClQ7IZDRGktIAACpqj2GjCM476.jpg', 'æ ¡å›­,mv,éŸ³ä¹,æ¯•ä¸šå­£,baiyang001', 'ã€ç­é‰´ã€‘2010æ³•å­¦', '698334', '0', '20', 'http://www.cuc.edu.cn/bjzl/80.html', '0', '891', '66', '0', '1410665700', '1410665700', '0', '1410665700');
INSERT INTO `video--` VALUES ('81', 'w_aFqOQi7Xs', 'ã€ç­é‰´ã€‘2010æˆå‰§ç¾Žæœ¯äººç‰©', '', '', '', '', '166', 'http://img01.cuctv.com/M02/94/5F/cR9ARlQVC8K2-XoSAABO438VSC0606.jpg', 'æ ¡å›­,éŸ³ä¹,mv,æ¯•ä¸šå­£,baiyang001', 'ã€ç­é‰´ã€‘2010æˆå‰§ç¾Žæœ¯äººç‰©', '88267', '0', '20', 'http://www.cuc.edu.cn/bjzl/81.html', '0', '749', '0', '0', '1410665700', '1410665700', '0', '1410665700');
INSERT INTO `video--` VALUES ('82', 'Od0kNInM5Ds', 'ã€ç­é‰´ã€‘2010ç¼–è¾‘å‡ºç‰ˆ', '', '', '', '', '166', 'http://img01.cuctv.com/M02/F7/87/cR9ARlQVDSymfNLjAACYhqZblr8247.jpg', 'æ ¡å›­,éŸ³ä¹,æ¯•ä¸šå­£mv,baiyang001', '2010ç¼–è¾‘å‡ºç‰ˆ', '294852', '0', '20', 'http://www.cuc.edu.cn/bjzl/82.html', '0', '642', '1', '0', '1410666240', '1410666276', '0', '1410666276');
INSERT INTO `video--` VALUES ('83', 'mTQ6u95gYug', 'ã€ç­é‰´ã€‘2010ç”µè§†æ‘„åƒ', '', '', '', '', '166', 'http://img01.cuctv.com/M00/43/A5/cR9ARlQVDo6Z8FrXAAAmixQAmcs688.jpg', 'æ ¡å›­,éŸ³ä¹,æ¯•ä¸šå­£,mv,baiyang001', '2010ç”µè§†æ‘„åƒ', '319066', '0', '20', 'http://www.cuc.edu.cn/bjzl/83.html', '0', '940', '4', '0', '1410666240', '1410666276', '0', '1410666276');
INSERT INTO `video--` VALUES ('84', 'FN8R8vVzddg', 'æŠ¢ç‹®å¤´Lion Dance', '', 'è‰ºæœ¯å­¦éƒ¨', '', 'æ®µé›¯é”´ é©¬ç»´ä½³', '151', 'http://img01.cuctv.com/M01/FB/9D/cR8oB1QVTC6139QyAAJMKvqzGbM022.jpg', 'åŠ¨ç”»', '<span style=\"font-size:18px;\">æ­¤ç‰‡è£èŽ·2012å¹´ä¸œäº¬å›½é™…åŠ¨ç”»èŠ‚ï¼ˆTAFï¼‰ä¸œäº¬åŠ¨ç”»å¤§èµç‰¹åˆ«èµï¼›è£èŽ·2012å¹´ç¬¬å…­å±Šäºšæ´²é’å¹´åŠ¨æ¼«å¤§èµ›ï¼ˆAYACCï¼‰è‡³å°Šå¤§å¥–ç­‰ã€‚</span>', '240025', '0', '20', 'http://www.cuc.edu.cn/dongman/84.html', '0', '1111', '26', '0', '1410666960', '1410666984', '0', '1410666984');
INSERT INTO `video--` VALUES ('85', 'gjIyI9emtc8', 'æ‰è¿·è—Hide&seek', '', 'è‰ºæœ¯å­¦éƒ¨', '', 'è‘£å¥•ç¦çŽ‹å†¬é˜³', '151', 'http://img01.cuctv.com/M00/55/97/cR9ARlQVEfvJha3iAABvKVpzFhE524.jpg', 'åŠ¨ç”»', '<span style=\"font-size:18px;\">æ­¤ç‰‡è£èŽ·ç¬¬ä¸ƒå±ŠåŽ¦é—¨å›½é™…åŠ¨æ¼«èŠ‚â€œé‡‘æµ·è±šâ€åŠ¨ç”»ä½œå“å¤§èµ›æœ€ä½³åŠ¨ç”»é“¶å¥–ã€‚</span>', '188267', '0', '20', 'http://www.cuc.edu.cn/dongman/85.html', '0', '958', '22', '0', '1410667200', '1410667217', '0', '1410667217');
INSERT INTO `video--` VALUES ('86', '9XbfmiZDs5I', 'ã€ç­é‰´ã€‘2010éŸ³ä¹ç¼–è¾‘', '', '', '', '', '166', 'http://img01.cuctv.com/M00/1C/55/cR9ARlQVEbKjbSR7AAAmsW7X6SU173.jpg', 'æ ¡å›­,éŸ³ä¹,mv,æ¯•ä¸šå­£,baiyang001', 'ã€ç­é‰´ã€‘2010éŸ³ä¹ç¼–è¾‘', '279934', '0', '20', 'http://www.cuc.edu.cn/bjzl/86.html', '0', '830', '0', '0', '1410667260', '1410667262', '0', '1410667262');
INSERT INTO `video--` VALUES ('87', '-klIPKcVANo', 'ã€ç­é‰´ã€‘2010å¹¿æ’­ç”µè§†æ–°é—»å­¦', '', '', '', '', '166', 'http://img01.cuctv.com/M00/03/F5/cR8oB1Qo3XHQiFRZAACOMRRy3_g853.jpg', 'æ ¡å›­,éŸ³ä¹,æ¯•ä¸šå­£,mv,baiyang001', '', '334618', '0', '20', 'http://www.cuc.edu.cn/bjzl/87.html', '0', '802', '1', '0', '1410667260', '1410667262', '97', '1410667262');
INSERT INTO `video--` VALUES ('88', 'uZN_itFresc', 'ã€ç­é‰´ã€‘2010ç½‘ç»œ', '', '', '', '', '166', 'http://img01.cuctv.com/M00/01/29/cR9ARlQVEwSMIfS7AABAyw3_uU8222.jpg', 'æ ¡å›­,éŸ³ä¹,mv,æ¯•ä¸šå­£,baiyang001', 'ã€ç­é‰´ã€‘2010ç½‘ç»œ', '473306', '0', '20', 'http://www.cuc.edu.cn/bjzl/88.html', '0', '794', '0', '0', '1410667740', '1410667798', '0', '1410667798');
INSERT INTO `video--` VALUES ('89', '8dzu6wTj9MY', 'ã€ç­é‰´ã€‘2010å›¾æ‘„', '', '', '', '', '166', 'http://img01.cuctv.com/M00/04/7D/cR9ARlQVFEjLYfZ1AAB3PdLtG6g424.jpg', 'æ ¡å›­,éŸ³ä¹,mv,æ¯•ä¸šå­£,baiyang001', 'ã€ç­é‰´ã€‘2010å›¾æ‘„', '604740', '0', '20', 'http://www.cuc.edu.cn/bjzl/89.html', '0', '637', '0', '0', '1410667740', '1410667798', '0', '1410667798');
INSERT INTO `video--` VALUES ('90', 'EIhSzEAoqqI', 'çºªå¿µæ—¥å¿«ä¹', '', 'è‰ºæœ¯å­¦éƒ¨', '', 'ç¨‹è…¾ ç²±å¸†', '151', 'http://img01.cuctv.com/M01/B2/77/cR9ARlQVSz6WcvnuAAKtxjy26x8448.jpg', 'åŠ¨ç”»', '<div class=\"para\">\r\n	<span style=\"color:#000000;font-size:18px;\">æœ¬ç‰‡è®²è¿°äº†ç»“å©šçºªå¿µæ—¥å½“å¤©ï¼Œæ•æ„Ÿçš„å¦»å­ç­‰å¾…ä¸ˆå¤«å›žå®¶å›¢èšå´å› å…¶ç”µè¯ä¸€ç›´æ— äººæŽ¥å¬è€Œé™·å…¥äº†ä¸€ç³»åˆ—å•¼ç¬‘çš†éžçš„æƒ³è±¡æ•…äº‹ã€‚</span><span style=\"line-height:2;color:#000000;font-size:18px;\">è£èŽ·ç¬¬åä¸€å±Šä¸œäº¬åŠ¨ç”»å¤§å¥–â€œç‰¹åˆ«èµâ€å¤§å¥–ã€‚</span> \r\n</div>', '531867', '0', '20', 'http://www.cuc.edu.cn/dongman/90.html', '0', '1103', '57', '19', '1410667980', '1410668038', '0', '1410668038');
INSERT INTO `video--` VALUES ('91', 'Dxt5KEmNznU', 'ã€ç­é‰´ã€‘2010éŸ³å¯¼', '', '', '', '', '166', 'http://img01.cuctv.com/M02/50/C9/cR9ARlQVFrX89gQtAABZLs6BxqA577.jpg', 'æ ¡å›­,mv,éŸ³ä¹,æ¯•ä¸šå­£,baiyang001', 'ã€ç­é‰´ã€‘2010éŸ³å¯¼', '583440', '0', '20', 'http://www.cuc.edu.cn/bjzl/91.html', '0', '724', '0', '0', '1410668460', '1410668489', '0', '1410668489');
INSERT INTO `video--` VALUES ('92', 'SiIh3E-4rM4', 'ã€ç­é‰´ã€‘2010æˆå‰§å½±è§†ç¾Žæœ¯è®¾è®¡', '', '', '', '', '166', 'http://img01.cuctv.com/M02/B2/DF/cR9ARlQVF1CmtqtaAABeh6EUz-A410.jpg', 'æ ¡å›­,éŸ³ä¹,mv,æ¯•ä¸šå­£,baiyang001', 'ã€ç­é‰´ã€‘2010æˆå‰§å½±è§†ç¾Žæœ¯è®¾è®¡', '544934', '0', '20', 'http://www.cuc.edu.cn/bjzl/92.html', '0', '893', '0', '0', '1410668460', '1410668489', '0', '1410668489');
INSERT INTO `video--` VALUES ('93', 'KhXV7BHppEo', '2014æ¯•ä¸šå¹´é‰´1', '', '', '', '', '166', 'http://img01.cuctv.com/M02/2B/79/dNXNClQX9dzM9ABCAADI3f7NTw8296.jpg', 'æ ¡å›­,mv,éŸ³ä¹,æ¯•ä¸šå­£,baiyang001', '2014æ¯•ä¸šå¹´é‰´1', '190134', '0', '20', 'http://www.cuc.edu.cn/bjzl/93.html', '0', '851', '0', '0', '1410668460', '1410668497', '102', '1410668497');
INSERT INTO `video--` VALUES ('94', '2V2W726Ucc8', 'ã€ç­é‰´ã€‘2010æ¸¸æˆè®¾è®¡æŠ€æœ¯', '', '', '', '', '166', 'http://img01.cuctv.com/M02/98/38/cR9ARlQVGCOWkgVQAABYt5fCp04738.jpg', 'æ ¡å›­,éŸ³ä¹,mv,æ¯•ä¸šå­£,baiyang001', 'ã€ç­é‰´ã€‘2010æ¸¸æˆè®¾è®¡æŠ€æœ¯', '623667', '0', '20', 'http://www.cuc.edu.cn/bjzl/94.html', '0', '653', '0', '0', '1410668760', '1410668777', '0', '1410668777');
INSERT INTO `video--` VALUES ('95', 'ZFlPBcmUpvs', 'ã€ç­é‰´ã€‘2010æ’­éŸ³ä¸»æŒ', '', '', '', '', '166', 'http://img01.cuctv.com/M02/6B/93/cR9ARlQX9ZeocmuzAASoKWRm3GM695.png', 'æ ¡å›­,mv,éŸ³ä¹,æ¯•ä¸šå­£,baiyang001', 'ã€ç­é‰´ã€‘2010æ’­éŸ³ä¸»æŒ', '307549', '0', '20', 'http://www.cuc.edu.cn/bjzl/95.html', '0', '1314', '21', '2', '1410668760', '1410668777', '100', '1410668777');
INSERT INTO `video--` VALUES ('96', 'CzQvtPMiaC0', 'å¹¿å‘Šå­¦æ¦‚è®º', '', '', '', '-ä¸ä¿Šæ°', '198', 'http://img01.cuctv.com/M02/53/23/cR8oB1QVG3fWLNCiAABMf060mQk292.jpg', 'å¹¿å‘Šå­¦', '<p>\r\n	è¯¾ç¨‹æŒ‡å¯¼æ€æƒ³åŠå®šä½ï¼š\r\n</p>\r\n<p>\r\n	ã€€ã€€å¹¿å‘Šå­¦æ¦‚è®ºè¯¾ç¨‹ï¼ŒåŠ›æ±‚ç«‹è¶³ä¸­å›½å½“ä»£å¹¿å‘Šï¼ŒåŒæ—¶ä»‹ç»ä¸–ç•Œå¹¿å‘Šçš„æœ€æ–°å‘å±•æƒ…å†µå’Œæœ€æ–°ç†è®ºåŠ¨å‘ï¼Œä»¥é€‚åº”æ–°æ—¶æœŸå­¦ç”Ÿçš„å­¦ä¹ éœ€è¦å’Œå¹¿å‘Šä¸šç•Œä»Žä¸šè€…çš„å‚è€ƒéœ€è¦ã€‚åŠæ—¶æŠŠå¹¿å‘Šå­¦æœ€æ–°ç ”ç©¶å’Œå‘å±•æˆæžœå¼•å…¥æ•™å­¦æ´»åŠ¨ï¼Œå¼ºè°ƒå¹¿å‘Šå­¦åŽŸç†çš„åŸºç¡€æ€§ä¸Žå…ˆè¿›æ€§ã€ç»å…¸æ€§ä¸ŽçŽ°ä»£æ€§å†…å®¹çš„æœ‰æœºç»“åˆã€‚åŸºäºŽä»¥ä¸Šè¯¾ç¨‹æŒ‡å¯¼æ€æƒ³å’Œå®šä½ï¼Œæœ¬è¯¾ç¨‹æ³¨é‡å°†å¹¿å‘Šå­¦ç†è®ºä¸Žå¹¿å‘Šå®žåŠ¡ç›¸ç»“åˆï¼Œä»Žå¹¿å‘Šå­¦æ¦‚è®ºè¯¾ç¨‹çš„ç‰¹ç‚¹å‡ºå‘ï¼Œèžå¹¿å‘Šã€è¥é”€ã€ä¼ æ’­ä¸Žæ¶ˆè´¹è€…çš„çŸ¥è¯†äºŽä¸€ä½“ï¼Œå¼ºè°ƒå­¦ç”Ÿç»¼åˆèƒ½åŠ›åŸ¹å…»ä¸Žç´ è´¨æé«˜ï¼Œè¯¾å†…è¯¾å¤–ç›¸ç»“åˆï¼Œè¯¾ç¨‹æ•™å­¦æ•ˆæžœæ˜Žæ˜¾ã€‚\r\n</p>\r\n<p>\r\n	ã€€ã€€æ•™å­¦å†…å®¹ï¼š\r\n</p>\r\n<p>\r\n	ã€€ã€€è¯¥è¯¾ç¨‹å†…å®¹å…·æœ‰åŸºç¡€æ€§ã€å‰æ²¿æ€§å’Œæ—¶ä»£æ€§çš„é²œæ˜Žç‰¹è‰²ï¼Œæ³¨é‡æ•™å­¦ä¸Žç§‘ç ”çš„ç»“åˆã€‚æœ¬è¯¾ç¨‹æ˜¯å¹¿å‘Šå­¦çš„ä¸“ä¸šåŸºç¡€è¯¾ï¼Œéœ€è¦è¯´æ˜Žçš„æ˜¯ï¼šç¬¬ä¸€ï¼Œå¹¿å‘Šå­¦æ¦‚è®ºè¿™é—¨è¯¾é‡åœ¨ä¸“ä¸šç†è®ºåŸºç¡€çš„è®²è§£ã€é‡åœ¨ä»Žæ•´ä½“ç»“æž„è®²è§£å¹¿å‘Šå­¦çš„å„æ–¹é¢çŸ¥è¯†ã€‚ç¬¬äºŒï¼Œæœ¬è¯¾ç¨‹å…ˆä»‹ç»å®è§‚çš„çŸ¥è¯†ï¼Œç„¶åŽè¿›å…¥å¾®è§‚çŸ¥è¯†çš„è®²è§£ï¼›å…ˆä»‹ç»å¹¿å‘ŠåŸºç¡€ç†è®ºï¼Œç„¶åŽä»Žæ¦‚è®ºçš„è§’åº¦ä»‹ç»å…·æœ‰å¾ˆå¼ºå®žç”¨æ€§çš„å…·ä½“å¹¿å‘Šåº”ç”¨çŸ¥è¯†ä»¥åŠç›¸å…³çš„ç†è®ºçŸ¥è¯†ã€‚ç¬¬ä¸‰ï¼Œåœ¨è¯¾ç¨‹ä¸­ï¼Œæ³¨é‡å‘å­¦ç”Ÿè®²æŽˆå…·æœ‰å‰æ²¿æ€§å’Œæ—¶ä»£æ€§çš„å†…å®¹ã€‚ç¬¬å››ï¼Œè¯¾ç¨‹è¯¦ç»†è®²è§£å½“ä»£ä¸–ç•Œå¹¿å‘Šä¸šå‘å±•æ¦‚å†µä»¥åŠå½“ä»£ä¸­å›½å¹¿å‘Šä¸šå‘å±•æ¦‚å†µï¼Œä½¿å¾—å­¦ç”Ÿèƒ½å¯¹ä¸­å›½å’Œä¸–ç•Œå¹¿å‘Šä¸šçš„å‘å±•æ¦‚å†µæœ‰ä¸ªæ•´ä½“çš„äº†è§£ï¼Œäº†è§£ä¸­å›½å¹¿å‘Šä¸šçš„å‘å±•è¿‡ç¨‹ï¼Œæ¸…æ¥šä¸­å›½å¹¿å‘Šä¸šé¢ä¸´ç€æ€Žæ ·çš„ä¸–ç•Œå¹¿å‘Šä¸šçŽ¯å¢ƒã€‚ç¬¬äº”ï¼Œè¯¾ç¨‹çš„ä¸»è¦å†…å®¹åŒ…æ‹¬ï¼šä»€ä¹ˆæ˜¯å¹¿å‘Šï¼Œå¹¿å‘Šæºæµæ¦‚è¿°ï¼Œå¹¿å‘Šä¸Žç¤¾ä¼šã€ä¸Žç»æµŽçš„å…³ç³»ï¼Œå¹¿å‘ŠåŠŸèƒ½ï¼Œå¹¿å‘Šä¸šçš„ç§ç§å‚ä¸Žè€…ç­‰å†…å®¹ã€‚ç¬¬å…­ï¼Œè¯¾ç¨‹æ³¨é‡æ•™å­¦ä¸Žç§‘ç ”ç›¸ç»“åˆï¼Œç»„ç»‡å­¦ç”Ÿç§¯æžå‚ä¸Žå®žè·µï¼Œè¿›è¡Œå¹¿å‘Šç­–åˆ’ã€å¹¿å‘Šè¿ä½œã€è¥é”€ç­‰æ–¹é¢çš„ç ”ç©¶ï¼Œå¹¶å–å¾—äº†ã€Šä¸­å›½å¹¿å‘ŠäºŒåå¹´çŒ›è¿›å²ã€‹ã€ã€Šä¸­å›½å¹¿å‘Šå¹´é‰´ã€‹ç­‰ä¸°å¯Œçš„ç§‘ç ”æˆæžœï¼Œåœ¨ã€Šå›½é™…å¹¿å‘Šã€‹ã€ã€Šå¹¿å‘Šä¸»ã€‹ã€ã€ŠçŽ°ä»£å¹¿å‘Šã€‹ç­‰ä¸“ä¸šæ‚å¿—å‘è¡¨å¤§é‡çš„ç ”ç©¶è®ºæ–‡ã€‚\r\n</p>\r\n<p>\r\n	ã€€ã€€æ•™å­¦æ–¹å¼ï¼š\r\n</p>\r\n<p>\r\n	ã€€ã€€æœ¬è¯¾ç¨‹æ ¹æ®æ•™å­¦å†…å®¹çš„ç‰¹ç‚¹ï¼Œç‰¹åˆ«é‡‡å–äº†å›¢é˜Ÿæ•™å­¦çš„æ–¹å¼ã€‚ç”±äºŽå¹¿å‘Šå­¦æ¦‚è®ºæ˜¯åŸºç¡€è¯¾ï¼Œæ˜¯å…¥é—¨è¯¾ï¼Œæ¶‰åŠå†…å®¹å¹¿åšï¼Œæ˜¯è”ç³»å¤šé—¨ä¸“ä¸šè¯¾çš„å…³é”®æ‰€åœ¨ï¼Œæ‰€ä»¥åœ¨è®²æŽˆè¿‡ç¨‹ä¸­ï¼Œæœ¬è¯¾ç¨‹é‡‡å–äº†åˆ†å•å…ƒè®¾è®¡ï¼Œæœ‰æ€»ï¼Œæœ‰åˆ†ã€‚æœ‰ç†è®ºè®²è¿°ã€æœ‰æ¡ˆä¾‹è§‚æ‘©ã€æœ‰å®žè·µæŒ‡å¯¼ï¼Œæ•´ä¸ªå›¢é˜Ÿæˆå‘˜å„æœ‰åˆ†å·¥ï¼Œåšåˆ°ä¸€è¯¾å¤šäººã€ä¸€äººå¤šè¯¾ã€‚æœ¬è¯¾ç¨‹çš„æ•™å­¦æ–¹å¼ä»¥ä¼ ç»Ÿè¯¾å ‚æ•™å­¦æ–¹å¼ä¸ºä¸»ï¼Œè¾…ä¹‹ä»¥è°ƒæŸ¥ç ”ç©¶ã€æ¨¡æ‹Ÿå¹¿å‘Šç­–åˆ’ç­‰å¤šç§æ•™å­¦æ–¹å¼ã€‚åœ¨æ•™å­¦æŠ€æœ¯æ‰‹æ®µä¸Šï¼Œé‡‡å–ä¼ ç»Ÿæ‰‹æ®µå’Œå½±è§†æ•™å­¦èµ„æºç›¸ç»“åˆçš„æ‰‹æ®µã€‚\r\n</p>', '0', '0', '20', 'http://www.cuc.edu.cn/jpkc/96.html', '0', '734', '0', '0', '1410669060', '1410669466', '0', '1410669065');
INSERT INTO `video--` VALUES ('97', 'MxNLkFd8gLY', 'åŠ¨ç”»æ¦‚è®º', '', '', '', 'è´¾å¦', '198', 'http://img01.cuctv.com/M00/73/A5/cR9ARlQVG8OtftY3AAA0QuC9Dug119.jpg', 'åŠ¨ç”»', '<p>\r\n	è¯¾ç¨‹æŒ‡å¯¼æ€æƒ³åŠå®šä½ï¼š\r\n</p>\r\n<p>\r\n	ã€€ã€€å¹¿å‘Šå­¦æ¦‚è®ºè¯¾ç¨‹ï¼ŒåŠ›æ±‚ç«‹è¶³ä¸­å›½å½“ä»£å¹¿å‘Šï¼ŒåŒæ—¶ä»‹ç»ä¸–ç•Œå¹¿å‘Šçš„æœ€æ–°å‘å±•æƒ…å†µå’Œæœ€æ–°ç†è®ºåŠ¨å‘ï¼Œä»¥é€‚åº”æ–°æ—¶æœŸå­¦ç”Ÿçš„å­¦ä¹ éœ€è¦å’Œå¹¿å‘Šä¸šç•Œä»Žä¸šè€…çš„å‚è€ƒéœ€è¦ã€‚åŠæ—¶æŠŠå¹¿å‘Šå­¦æœ€æ–°ç ”ç©¶å’Œå‘å±•æˆæžœå¼•å…¥æ•™å­¦æ´»åŠ¨ï¼Œå¼ºè°ƒå¹¿å‘Šå­¦åŽŸç†çš„åŸºç¡€æ€§ä¸Žå…ˆè¿›æ€§ã€ç»å…¸æ€§ä¸ŽçŽ°ä»£æ€§å†…å®¹çš„æœ‰æœºç»“åˆã€‚åŸºäºŽä»¥ä¸Šè¯¾ç¨‹æŒ‡å¯¼æ€æƒ³å’Œå®šä½ï¼Œæœ¬è¯¾ç¨‹æ³¨é‡å°†å¹¿å‘Šå­¦ç†è®ºä¸Žå¹¿å‘Šå®žåŠ¡ç›¸ç»“åˆï¼Œä»Žå¹¿å‘Šå­¦æ¦‚è®ºè¯¾ç¨‹çš„ç‰¹ç‚¹å‡ºå‘ï¼Œèžå¹¿å‘Šã€è¥é”€ã€ä¼ æ’­ä¸Žæ¶ˆè´¹è€…çš„çŸ¥è¯†äºŽä¸€ä½“ï¼Œå¼ºè°ƒå­¦ç”Ÿç»¼åˆèƒ½åŠ›åŸ¹å…»ä¸Žç´ è´¨æé«˜ï¼Œè¯¾å†…è¯¾å¤–ç›¸ç»“åˆï¼Œè¯¾ç¨‹æ•™å­¦æ•ˆæžœæ˜Žæ˜¾ã€‚\r\n</p>\r\n<p>\r\n	ã€€ã€€æ•™å­¦å†…å®¹ï¼š\r\n</p>\r\n<p>\r\n	ã€€ã€€è¯¥è¯¾ç¨‹å†…å®¹å…·æœ‰åŸºç¡€æ€§ã€å‰æ²¿æ€§å’Œæ—¶ä»£æ€§çš„é²œæ˜Žç‰¹è‰²ï¼Œæ³¨é‡æ•™å­¦ä¸Žç§‘ç ”çš„ç»“åˆã€‚æœ¬è¯¾ç¨‹æ˜¯å¹¿å‘Šå­¦çš„ä¸“ä¸šåŸºç¡€è¯¾ï¼Œéœ€è¦è¯´æ˜Žçš„æ˜¯ï¼šç¬¬ä¸€ï¼Œå¹¿å‘Šå­¦æ¦‚è®ºè¿™é—¨è¯¾é‡åœ¨ä¸“ä¸šç†è®ºåŸºç¡€çš„è®²è§£ã€é‡åœ¨ä»Žæ•´ä½“ç»“æž„è®²è§£å¹¿å‘Šå­¦çš„å„æ–¹é¢çŸ¥è¯†ã€‚ç¬¬äºŒï¼Œæœ¬è¯¾ç¨‹å…ˆä»‹ç»å®è§‚çš„çŸ¥è¯†ï¼Œç„¶åŽè¿›å…¥å¾®è§‚çŸ¥è¯†çš„è®²è§£ï¼›å…ˆä»‹ç»å¹¿å‘ŠåŸºç¡€ç†è®ºï¼Œç„¶åŽä»Žæ¦‚è®ºçš„è§’åº¦ä»‹ç»å…·æœ‰å¾ˆå¼ºå®žç”¨æ€§çš„å…·ä½“å¹¿å‘Šåº”ç”¨çŸ¥è¯†ä»¥åŠç›¸å…³çš„ç†è®ºçŸ¥è¯†ã€‚ç¬¬ä¸‰ï¼Œåœ¨è¯¾ç¨‹ä¸­ï¼Œæ³¨é‡å‘å­¦ç”Ÿè®²æŽˆå…·æœ‰å‰æ²¿æ€§å’Œæ—¶ä»£æ€§çš„å†…å®¹ã€‚ç¬¬å››ï¼Œè¯¾ç¨‹è¯¦ç»†è®²è§£å½“ä»£ä¸–ç•Œå¹¿å‘Šä¸šå‘å±•æ¦‚å†µä»¥åŠå½“ä»£ä¸­å›½å¹¿å‘Šä¸šå‘å±•æ¦‚å†µï¼Œä½¿å¾—å­¦ç”Ÿèƒ½å¯¹ä¸­å›½å’Œä¸–ç•Œå¹¿å‘Šä¸šçš„å‘å±•æ¦‚å†µæœ‰ä¸ªæ•´ä½“çš„äº†è§£ï¼Œäº†è§£ä¸­å›½å¹¿å‘Šä¸šçš„å‘å±•è¿‡ç¨‹ï¼Œæ¸…æ¥šä¸­å›½å¹¿å‘Šä¸šé¢ä¸´ç€æ€Žæ ·çš„ä¸–ç•Œå¹¿å‘Šä¸šçŽ¯å¢ƒã€‚ç¬¬äº”ï¼Œè¯¾ç¨‹çš„ä¸»è¦å†…å®¹åŒ…æ‹¬ï¼šä»€ä¹ˆæ˜¯å¹¿å‘Šï¼Œå¹¿å‘Šæºæµæ¦‚è¿°ï¼Œå¹¿å‘Šä¸Žç¤¾ä¼šã€ä¸Žç»æµŽçš„å…³ç³»ï¼Œå¹¿å‘ŠåŠŸèƒ½ï¼Œå¹¿å‘Šä¸šçš„ç§ç§å‚ä¸Žè€…ç­‰å†…å®¹ã€‚ç¬¬å…­ï¼Œè¯¾ç¨‹æ³¨é‡æ•™å­¦ä¸Žç§‘ç ”ç›¸ç»“åˆï¼Œç»„ç»‡å­¦ç”Ÿç§¯æžå‚ä¸Žå®žè·µï¼Œè¿›è¡Œå¹¿å‘Šç­–åˆ’ã€å¹¿å‘Šè¿ä½œã€è¥é”€ç­‰æ–¹é¢çš„ç ”ç©¶ï¼Œå¹¶å–å¾—äº†ã€Šä¸­å›½å¹¿å‘ŠäºŒåå¹´çŒ›è¿›å²ã€‹ã€ã€Šä¸­å›½å¹¿å‘Šå¹´é‰´ã€‹ç­‰ä¸°å¯Œçš„ç§‘ç ”æˆæžœï¼Œåœ¨ã€Šå›½é™…å¹¿å‘Šã€‹ã€ã€Šå¹¿å‘Šä¸»ã€‹ã€ã€ŠçŽ°ä»£å¹¿å‘Šã€‹ç­‰ä¸“ä¸šæ‚å¿—å‘è¡¨å¤§é‡çš„ç ”ç©¶è®ºæ–‡ã€‚\r\n</p>\r\n<p>\r\n	ã€€ã€€æ•™å­¦æ–¹å¼ï¼š\r\n</p>\r\n<p>\r\n	ã€€ã€€æœ¬è¯¾ç¨‹æ ¹æ®æ•™å­¦å†…å®¹çš„ç‰¹ç‚¹ï¼Œç‰¹åˆ«é‡‡å–äº†å›¢é˜Ÿæ•™å­¦çš„æ–¹å¼ã€‚ç”±äºŽå¹¿å‘Šå­¦æ¦‚è®ºæ˜¯åŸºç¡€è¯¾ï¼Œæ˜¯å…¥é—¨è¯¾ï¼Œæ¶‰åŠå†…å®¹å¹¿åšï¼Œæ˜¯è”ç³»å¤šé—¨ä¸“ä¸šè¯¾çš„å…³é”®æ‰€åœ¨ï¼Œæ‰€ä»¥åœ¨è®²æŽˆè¿‡ç¨‹ä¸­ï¼Œæœ¬è¯¾ç¨‹é‡‡å–äº†åˆ†å•å…ƒè®¾è®¡ï¼Œæœ‰æ€»ï¼Œæœ‰åˆ†ã€‚æœ‰ç†è®ºè®²è¿°ã€æœ‰æ¡ˆä¾‹è§‚æ‘©ã€æœ‰å®žè·µæŒ‡å¯¼ï¼Œæ•´ä¸ªå›¢é˜Ÿæˆå‘˜å„æœ‰åˆ†å·¥ï¼Œåšåˆ°ä¸€è¯¾å¤šäººã€ä¸€äººå¤šè¯¾ã€‚æœ¬è¯¾ç¨‹çš„æ•™å­¦æ–¹å¼ä»¥ä¼ ç»Ÿè¯¾å ‚æ•™å­¦æ–¹å¼ä¸ºä¸»ï¼Œè¾…ä¹‹ä»¥è°ƒæŸ¥ç ”ç©¶ã€æ¨¡æ‹Ÿå¹¿å‘Šç­–åˆ’ç­‰å¤šç§æ•™å­¦æ–¹å¼ã€‚åœ¨æ•™å­¦æŠ€æœ¯æ‰‹æ®µä¸Šï¼Œé‡‡å–ä¼ ç»Ÿæ‰‹æ®µå’Œå½±è§†æ•™å­¦èµ„æºç›¸ç»“åˆçš„æ‰‹æ®µã€‚\r\n</p>\r\n<p>\r\n	<br />\r\n</p>', '0', '0', '20', 'http://www.cuc.edu.cn/jpkc/97.html', '0', '736', '0', '0', '1410669480', '1410669628', '0', '1410669521');
INSERT INTO `video--` VALUES ('98', '3VDIiUqFp9c', 'å¹¿æ’­ç”µè§†èŠ‚ç›®åˆ¶ä½œ', '', '', '', 'é«˜æ™“çº¢', '198', 'http://img01.cuctv.com/M00/E2/55/dNXNClQVHIq2jrjJAABcrzwU22U822.jpg', 'ç”µè§†èŠ‚ç›®,åˆ¶ä½œ', '<span style=\"font-family:Simsun;font-size:14px;line-height:normal;white-space:normal;\">&nbsp;ã€Šå¹¿æ’­ç”µè§†èŠ‚ç›®åˆ¶ä½œã€‹è¯¾ç¨‹æ˜¯ä¸­å›½ä¼ åª’å¤§å­¦çš„å‰èº«åŒ—äº¬å¹¿æ’­å­¦é™¢æœ€æ—©å¼€è®¾çš„ä¸“ä¸šåŸºç¡€è¯¾ä¹‹ä¸€ï¼Œä¹Ÿæ˜¯ç”µè§†ç³»æœ€æˆç†Ÿçš„ä¸“ä¸šè¯¾ç¨‹ä¹‹ä¸€ã€‚ ä½œä¸ºä¸€é—¨ä¸“ä¸šåŸºç¡€è¯¾ï¼Œæœ¬è¯¾ç¨‹æ‰€æ¶‰åŠçš„çŸ¥è¯†è´¯ç©¿äº†å¹¿ç”µäº§åˆ¶å…¨è¿‡ç¨‹ï¼ŒåŒ…æ‹¬ä»Žå‰æœŸçš„ç­–åˆ’ã€é‡‡è®¿ã€æ‹æ‘„åˆ°åŽæœŸçš„ç¼–è¾‘ã€å†™ä½œã€æŠ€æœ¯åˆ¶ä½œçš„å¤šç»´åº¦å†…å®¹ã€‚æœ¬è¯¾ç¨‹åœ¨ç³»ç»Ÿé˜è¿°èŠ‚ç›®åˆ¶ä½œåŸºæœ¬åŽŸç†/æ‰‹æ³•çš„åŸºç¡€ä¸Šï¼Œç»“åˆå¹¿æ’­ç”µè§†åª’ä½“çš„å¤§ä¼—ä¼ æ’­ç‰¹æ€§ï¼Œä¾§é‡ä»‹ç»èŠ‚ç›®åˆ¶ä½œçš„çŽ°ä»£æ€ç»´å’Œåˆ›ä½œç†å¿µï¼Œæ³¨é‡å¯¹å­¦ç”Ÿåˆ›ä½œç†å¿µã€åˆ›ä½œæ€ç»´å’Œåˆ›ä½œæŠ€å·§ç­‰ç»¼åˆç´ è´¨çš„åŸ¹å…»ï¼Œä½¿å¾—å­¦ç”Ÿèƒ½å¤Ÿæ ‘ç«‹ä¸€ç§å¯¹äºŽå¹¿æ’­ç”µè§†èŠ‚ç›®çš„â€œæ•´ä½“æŠŠæ¡è§‚â€ã€‚ é€šè¿‡æœ¬è¯¾ç¨‹ï¼Œå­¦ç”Ÿèƒ½å¤ŸæŽŒæ¡å¹¿æ’­ç”µè§†åˆ¶ä½œçš„åŸºæœ¬ç‰¹ç‚¹å’ŒåŸºæœ¬åŽŸç†ï¼Œä¸ºè¿›ä¸€æ­¥æ·±å…¥ä¸“ä¸šè¯¾ç¨‹æ‰“ä¸‹åŸºç¡€ã€‚</span>', '0', '0', '20', 'http://www.cuc.edu.cn/jpkc/98.html', '0', '1079', '0', '0', '1410669662', '1410669723', '0', '1410669662');
INSERT INTO `video--` VALUES ('99', 'DMsOnRAAdNI', '2014æ¯•ä¸šå¹´é‰´2', '', '', '', '', '166', 'http://img01.cuctv.com/M02/6A/C4/dNXNClQX9f_5vUNXAAEc_Sz_IM8945.jpg', 'æ ¡å›­,éŸ³ä¹,mv,æ¯•ä¸šå­£,baiyang001', '2014æ¯•ä¸šå¹´é‰´2', '239267', '-1', '20', 'http://www.cuc.edu.cn/bjzl/99.html', '0', '607', '0', '0', '1410673500', '1410673536', '101', '1410673536');
INSERT INTO `video--` VALUES ('100', 'NbHd6ZQ3e-I', 'ã€ç­é‰´ã€‘2010è¡¨æ¼”', '', '', '', '', '166', 'http://img01.cuctv.com/M00/4B/E5/cR9ARlQVKXHDu5Y4AAAiGO3u78o894.jpg', 'æ ¡å›­,mv,éŸ³ä¹,æ¯•ä¸šå­£,baiyang001', 'ã€ç­é‰´ã€‘2010è¡¨æ¼”', '600867', '0', '20', 'http://www.cuc.edu.cn/bjzl/100.html', '0', '996', '1', '0', '1410673500', '1410673536', '95', '1410673536');
INSERT INTO `video--` VALUES ('101', 'BhI5vUVAqaQ', 'è¸½è¸½ç‹¬è¡Œ 2013å¹´çºªå½•ç‰‡é‡‘å¥–', '', '', '', '', '140', 'http://img01.cuctv.com/M00/9E/09/cR9ARlQVLYeEtOOmAABsjeuM95g725.jpg', 'çºªå½•ç‰‡', '<span style=\"font-size:18px;\">æœ¬ç‰‡è£èŽ·2013å¹´çºªå½•ç‰‡é‡‘å¥–ã€‚å¯¼æ¼”ï¼šç¨‹æµ©æµ©ã€‚</span>', '1879331', '0', '20', 'http://www.cuc.edu.cn/video/101.html', '0', '897', '2', '0', '1410674160', '1410674197', '0', '1410674197');
INSERT INTO `video--` VALUES ('102', 'ZFlPBcmUpvs', 'ã€ç­é‰´ã€‘2010æ’­éŸ³ä¸»æŒ', '', '', '', '', '166', 'http://img01.cuctv.com/M00/DA/6F/dNXNClQVMQnqXx7lAAN0gA0y5m4796.png', 'æ ¡å›­,mv,éŸ³ä¹,æ¯•ä¸šå­£,baiyang001', 'ã€ç­é‰´ã€‘2010æ’­éŸ³ä¸»æŒ', '307549', '-1', '20', 'http://www.cuc.edu.cn/bjzl/102.html', '0', '1', '0', '0', '1410675120', '1410675174', '0', '1410675174');
INSERT INTO `video--` VALUES ('103', '_A-kTCz1qJY', 'å˜æˆåŒ…å­çš„å¥³å‹', '', '', '', '', '140', 'http://img01.cuctv.com/M01/10/A0/cR9ARlQVROKoTx1BAAAw3kCG2dg318.jpg', 'å¾®ç”µå½±', '<p>\r\n	&nbsp;\r\n</p>', '1348975', '0', '20', 'http://www.cuc.edu.cn/video/103.html', '0', '695', '2', '1', '1410680220', '1410680220', '0', '1410680220');
INSERT INTO `video--` VALUES ('104', 'TOsDErepJTQ', 'å¤å¤© 2013å¹´çºªå½•ç‰‡é“¶å¥–', '', '', '', '', '140', 'http://img01.cuctv.com/M00/79/C5/dNXNClQVUeK-TZSBAAD_zoJFCR0639.jpg', 'å¾®ç”µå½±', '<p>\r\n	<span style=\"color:#000000;font-size:18px;\">æœ¬ç‰‡ç”±ä¸­å›½ä¼ åª’å¤§å­¦æ›¹ä¹…å¹³å½±åƒå·¥ä½œå®¤ä¸Žè¥¿å®‰ç¾Žæœ¯å­¦é™¢å½±è§†ç©ºé—´é€ åž‹å®žéªŒå®¤è”åˆå‡ºå“ã€‚<span style=\"font-size:18px;line-height:36px;white-space:normal;\">æœ¬ç‰‡è£èŽ·2013å¹´çºªå½•ç‰‡é“¶å¥–ã€‚</span></span><span style=\"color:#000000;font-size:18px;\">å¯¼æ¼”ï¼šåˆ˜å¼ºã€‚</span> \r\n</p>', '1776350', '0', '20', 'http://www.cuc.edu.cn/video/104.html', '0', '698', '1', '0', '1410683220', '1410683237', '0', '1410683237');
INSERT INTO `video--` VALUES ('106', 'Js8tW8OrbUY', 'æ ¡æ­Œï¼šå¹´è½»çš„ç™½æ¨', '', '', '', '', '140', 'http://img01.cuctv.com/M00/89/04/cR8oB1QWj52MJXNHAAEAiOxRcTk653.jpg', 'æ ¡æ­Œ', '<span style=\"font-size:18px;\">ä¸­å›½ä¼ åª’å¤§å­¦æ ¡æ­Œï¼šå¹´è½»çš„ç™½æ¨ã€‚ä½œè¯ï¼šå¶å»¶æ»¨ ä½œæ›²ï¼šåˆ˜å¤©ç¤¼ã€‚</span>', '356334', '0', '20', 'http://www.cuc.edu.cn/video/106.html', '0', '985', '0', '0', '1410751680', '1410751690', '0', '1410751690');
INSERT INTO `video--` VALUES ('107', '7IIQD0gY3fo', 'ç”µæ¢¯å£', '', 'è‰ºæœ¯å­¦éƒ¨', '', 'çŽ‹è‹¥å§—', '151', 'http://img01.cuctv.com/M01/EC/AF/cR9ARlQWg3eZT90YAAA6sppYRLw636.jpg', 'åŠ¨ç”»', '', '413999', '0', '20', 'http://www.cuc.edu.cn/dongman/107.html', '0', '885', '0', '0', '1410761760', '1410761817', '0', '1410761817');
INSERT INTO `video--` VALUES ('108', 'px1w0iFSNec', 'æˆ‘å§¥çˆ·', '', 'è‰ºæœ¯å­¦éƒ¨', '', 'èƒ¡éƒè¡', '151', 'http://img01.cuctv.com/M01/41/F9/cR9ARlQWkyu73lLKAAKExKwsjoM317.jpg', 'åŠ¨ç”»', '', '276334', '0', '20', 'http://www.cuc.edu.cn/dongman/108.html', '0', '1110', '92', '1', '1410761820', '1410761831', '0', '1410761831');
INSERT INTO `video--` VALUES ('109', 'yz_vPNaXw70', 'å†è§é›¨å¤©The song of rain', '', 'è‰ºæœ¯å­¦éƒ¨', '', 'éƒ‘é›…æ–‡', '151', 'http://img01.cuctv.com/M00/28/D5/cR9ARlQWXDmZNdehAAA2KEu1XWU703.jpg', 'åŠ¨ç”»', '', '491134', '0', '20', 'http://www.cuc.edu.cn/dongman/109.html', '0', '768', '2', '0', '1410761820', '1410761831', '0', '1410761831');
INSERT INTO `video--` VALUES ('110', '4Zwvxa6YvHI', 'In poster', '', 'è‰ºæœ¯å­¦éƒ¨', '', 'è¢å¿—è¶…', '151', 'http://img01.cuctv.com/M00/3C/B1/cR9ARlQWiePsv1vVAAAMThQ-Bck838-1.jpg', 'åŠ¨ç”»', '', '232038', '0', '20', 'http://www.cuc.edu.cn/dongman/110.html', '0', '809', '0', '0', '1410764460', '1410764507', '0', '1410764507');
INSERT INTO `video--` VALUES ('111', 'O6EsKq40e10', 'åƒæ—©é¥­å•¦', '', 'è‰ºæœ¯å­¦éƒ¨', '', 'è‹è‰º', '151', 'http://img01.cuctv.com/M01/E4/C1/cR9ARlQWkyuK-b4PAABJWT9M87k237.jpg', 'åŠ¨ç”»', '', '307800', '0', '20', 'http://www.cuc.edu.cn/dongman/111.html', '0', '811', '0', '0', '1410765840', '1410765847', '0', '1410765847');
INSERT INTO `video--` VALUES ('112', 'n2xA_oO0tCU', 'æ¢…èŠ±å‰‘', '', 'è‰ºæœ¯å­¦éƒ¨', '', 'æ­¥å°è¿œ çŽ‹è‹¥æ™¨ é™ˆå®—ç£Š å‘¨å…¨ å´å¸…è¾¾ å”', '151', 'http://img01.cuctv.com/M02/A0/95/cR9ARlQWlyegLu51AAA3tIenZyk928.jpg', 'åŠ¨ç”»', '', '510551', '0', '20', 'http://www.cuc.edu.cn/dongman/112.html', '0', '779', '0', '0', '1410766800', '1410766843', '0', '1410766843');
INSERT INTO `video--` VALUES ('113', 'Fj_ODdrdpbw', 'è—åœ¨æ ‘åŽçš„å°ç†ŠLittle Bear and Balloon', '', 'è‰ºæœ¯å­¦éƒ¨', '', 'é™ˆè²ä»ª', '151', 'http://img01.cuctv.com/M02/8E/F5/cR9ARlQWm0uQQg5eAABHxjYuGYM797.jpg', 'åŠ¨ç”»,baiyang001', '', '249177', '0', '20', 'http://www.cuc.edu.cn/dongman/113.html', '0', '852', '1', '0', '1410768000', '1410768012', '0', '1410768012');
INSERT INTO `video--` VALUES ('114', 'L1uyPGJVeLs', 'èƒ¡æ­£è£â€”å¤§ä¼—åª’ä»‹å¯¹ç¤¾ä¼šçš„å½±å“ï¼ˆä¸‹ï¼‰', '', '', '', 'èƒ¡æ­£è£', '198', 'http://img01.cuctv.com/M00/B7/09/cR8oB1QY1krEmCNKAAC0XPinoxQ260.jpg', 'å¤§ä¼—,å½±å“', '', '0', '0', '20', 'http://www.cuc.edu.cn/jpkc/114.html', '0', '706', '0', '0', '1410913620', '1410913723', '0', '1410913668');
INSERT INTO `video--` VALUES ('115', 'ZPIZg_DJRwA', 'èƒ¡æ­£è£â€”å¤§ä¼—åª’ä»‹å¯¹ç¤¾ä¼šçš„å½±å“ï¼ˆä¸Šï¼‰', '', '', '', 'èƒ¡æ­£è£', '198', 'http://img01.cuctv.com/M00/55/27/cR9ARlQY1pHPVM0LAACk5pyM6Qg277.jpg', 'å¤§ä¼—,å½±å“', 'èƒ¡æ­£è£â€”å¤§ä¼—åª’ä»‹å¯¹ç¤¾ä¼šçš„å½±å“', '0', '0', '20', 'http://www.cuc.edu.cn/jpkc/115.html', '0', '706', '0', '0', '1410913942', '1410914025', '0', '1410913942');
INSERT INTO `video--` VALUES ('116', 'tnlUEu0EZxU', 'é¾™è€˜-ä¼ æ’­æ•ˆæžœï¼šç¬¬ä¸‰è€…æ•ˆæžœ', '', '', '', 'é¾™è€˜', '198', 'http://img01.cuctv.com/M00/70/F1/cR8oB1QY13-5v8eMAAEvaVA9imM032.jpg', 'ç¬¬ä¸‰è€…', 'é¾™è€˜-ä¼ æ’­æ•ˆæžœï¼šç¬¬ä¸‰è€…æ•ˆæžœ', '0', '0', '20', 'http://www.cuc.edu.cn/jpkc/116.html', '0', '773', '0', '0', '1410914057', '1410914179', '0', '1410914057');
INSERT INTO `video--` VALUES ('117', 'NxeZ75RtDVM', 'é¾™è€˜-ä¼ æ’­æ•ˆæžœï¼šçŸ¥æ²Ÿç†è®º', '', '', '', 'é¾™è€˜', '198', 'http://img01.cuctv.com/M02/AA/8D/cR9ARlQY2_iPZER4AAEZ2ZYmCoc763.jpg', '', '<span style=\"color:#444444;font-family:tahoma, arial, å®‹ä½“, sans-serif;font-size:12px;line-height:18px;white-space:normal;background-color:#FFFCE9;\">é¾™è€˜-ä¼ æ’­æ•ˆæžœï¼šçŸ¥æ²Ÿç†è®º</span>', '0', '0', '20', 'http://www.cuc.edu.cn/jpkc/117.html', '0', '559', '0', '0', '1410914940', '1410915262', '0', '1410914942');
INSERT INTO `video--` VALUES ('118', '8SZ8nmd8eYI', 'é¾™è€˜-ä¼ æ’­æ•ˆæžœï¼šæ²‰é»˜çš„èžºæ—‹', '', '', '', 'é¾™è€˜', '198', 'http://img01.cuctv.com/M00/97/58/dNXNClQY2-bT07RIAAF-lhuoaPU651.jpg', '', '<span style=\"color:#444444;font-family:tahoma, arial, å®‹ä½“, sans-serif;font-size:12px;line-height:18px;white-space:normal;background-color:#FFFCE9;\">é¾™è€˜-ä¼ æ’­æ•ˆæžœï¼šæ²‰é»˜çš„èžºæ—‹</span>', '0', '0', '20', 'http://www.cuc.edu.cn/jpkc/118.html', '0', '584', '0', '0', '1410915265', '1410915307', '0', '1410915265');
INSERT INTO `video--` VALUES ('119', 'GvIG1CpIOUM', 'é¾™è€˜-ä¼ æ’­æ•ˆæžœï¼šæ¶µåŒ–ç†è®º', '', '', '', 'é¾™è€˜', '198', 'http://img01.cuctv.com/M02/C6/AD/dNXNClQY3J-JpLX1AAE20-dqw7E717.jpg', '', '<span style=\"color:#444444;font-family:tahoma, arial, å®‹ä½“, sans-serif;font-size:12px;line-height:18px;white-space:normal;background-color:#FFFCE9;\">é¾™è€˜-ä¼ æ’­æ•ˆæžœï¼šæ¶µåŒ–ç†è®º</span>', '0', '0', '20', 'http://www.cuc.edu.cn/jpkc/119.html', '0', '748', '0', '0', '1410915420', '1410915445', '0', '1410915420');
INSERT INTO `video--` VALUES ('120', 'vyXGNRAtnME', 'èƒ¡æ­£è£-ä¼ æ’­å­¦çš„è¯žç”Ÿï¼ˆä¸Šï¼‰', '', '', '', 'èƒ¡æ­£è£', '198', 'http://img01.cuctv.com/M02/53/43/cR8oB1QY3xvmgRyHAAy-T0uD1FU018.jpg', 'ä¼ æ’­å­¦', '<span style=\"color:#444444;font-family:tahoma, arial, å®‹ä½“, sans-serif;font-size:12px;line-height:18px;white-space:normal;background-color:#FFFCE9;\">èƒ¡æ­£è£-ä¼ æ’­å­¦çš„è¯žç”Ÿï¼ˆä¸Šï¼‰</span>', '0', '0', '20', 'http://www.cuc.edu.cn/jpkc/120.html', '0', '628', '0', '0', '1410915555', '1410916125', '0', '1410915555');
INSERT INTO `video--` VALUES ('121', '73SnAOvBO98', 'èƒ¡æ­£è£-ä¼ æ’­å­¦çš„è¯žç”Ÿï¼ˆä¸‹ï¼‰', '', '', '', 'èƒ¡æ­£è£', '198', 'http://img01.cuctv.com/M00/8E/98/dNXNClQY38Wd_CMWAA2MulRo-e0666.jpg', 'ä¼ æ’­å­¦', '<span style=\"color:#444444;font-family:tahoma, arial, å®‹ä½“, sans-serif;font-size:12px;line-height:18px;white-space:normal;background-color:#FFFCE9;\">èƒ¡æ­£è£-ä¼ æ’­å­¦çš„è¯žç”Ÿï¼ˆä¸‹ï¼‰</span>', '0', '0', '20', 'http://www.cuc.edu.cn/jpkc/121.html', '0', '708', '0', '0', '1410916080', '1410916231', '0', '1410916139');
INSERT INTO `video--` VALUES ('122', 'zeDAU9gz_UQ', 'é¾™è€˜-ä¼ æ’­æ•ˆæžœï¼šè®®ç¨‹è®¾ç½®', '', '', '', 'é¾™è€˜', '198', 'http://img01.cuctv.com/M00/15/3F/dNXNClQY7gW7-z7JAAwE8RpkPl0485.jpg', '', '<span style=\"color:#444444;font-family:tahoma, arial, å®‹ä½“, sans-serif;font-size:12px;line-height:18px;white-space:normal;background-color:#FFFCE9;\">é¾™è€˜-ä¼ æ’­æ•ˆæžœï¼šè®®ç¨‹è®¾ç½®</span>', '0', '0', '20', 'http://www.cuc.edu.cn/jpkc/122.html', '0', '667', '0', '0', '1410919680', '1410919853', '0', '1410919727');
INSERT INTO `video--` VALUES ('141', 'xKQ12XyaFzc', 'ç•™å½±', '', 'è‰ºæœ¯å­¦éƒ¨', '', '', '151', 'http://img01.cuctv.com/M02/14/57/cR9ARlQY-JyLJNcXAAAdXubayNM731-2.jpg', 'åŠ¨ç”»', '<p>\r\n	æ•…äº‹åˆ›æ„ç»„ï¼šåˆ˜æ˜Žå› éŸ©é“® å•å®£ æœ±æ»¨&nbsp;\r\n</p>\r\n<p>\r\n	å¯¼æ¼”ç»„ï¼šæœ±æ»¨&nbsp;<span style=\"white-space:normal;\">åˆ˜æ˜Žå› éŸ©é“® æ›¹æ™¨ æ±ªéš†</span>\r\n</p>', '206734', '0', '20', 'http://www.cuc.edu.cn/dongman/141.html', '0', '826', '0', '0', '1410923100', '1410923109', '0', '1410923109');
INSERT INTO `video--` VALUES ('142', 'PGS5p62B0DE', 'ä¸­å›½ä¼ åª’å¤§å­¦æ–‡åŒ–åˆ›æ„å›­å®£ä¼ ç‰‡', '', '', '', '', '140', 'http://img01.cuctv.com/M02/3D/DF/cR9ARlQZD4_qYZoTAACifTUm1FQ347.jpg', 'å®£ä¼ ç‰‡', '', '622810', '0', '20', 'http://www.cuc.edu.cn/video/142.html', '0', '936', '0', '0', '1410929880', '1410929918', '0', '1410929918');
INSERT INTO `video--` VALUES ('143', 'LMBueXqvJ6U', 'èƒ¡æ­£è£-ä¼ æ’­å­¦çš„å…ˆé©±è€…', '', '', '', '', '198', 'http://img01.cuctv.com/M01/59/3F/cR9ARlQY_fLu16r3AABNmn3q8bg333.jpg', 'èƒ¡æ­£è£,ä¼ æ’­å­¦,è®²å ‚,baiyang001', '', '2985334', '0', '20', 'http://www.cuc.edu.cn/jpkc/143.html', '0', '852', '0', '0', '1410934200', '1410934237', '0', '1410934237');
INSERT INTO `video--` VALUES ('144', 'ULfoDT3BOmI', 'é¾™è€˜-ä¼ æ’­æ•ˆæžœçš„æ•´åˆè®¤è¯†', '', '', '', '', '198', 'http://img01.cuctv.com/M02/56/07/cR9ARlQZCmq0OWJZAABLLOUOXF8756.jpg', 'é¾™è€˜,ä¼ æ’­å­¦,baiyang001', 'é¾™è€˜-ä¼ æ’­æ•ˆæžœçš„æ•´åˆè®¤è¯†', '3117267', '0', '20', 'http://www.cuc.edu.cn/jpkc/144.html', '0', '735', '0', '0', '1410934200', '1410934237', '0', '1410934237');
INSERT INTO `video--` VALUES ('145', 'b8-lC3PBS9c', 'çŽ‹è’™è®²åº§ï¼ˆä¸‹ï¼‰', '', '', '', '', '198', 'http://img01.cuctv.com/M02/07/C7/dNXNClQZiCqQXt0cAABxc93W7Ig754.jpg', 'çŽ‹è’™,baiyang001', 'çŽ‹è’™', '3465503', '-1', '20', 'http://www.cuc.edu.cn/jpkc/145.html', '0', '0', '0', '0', '1411004955', '1411004955', '0', '1411004955');
INSERT INTO `video--` VALUES ('146', 'MNwPkjTCpVI', 'çŽ‹è’™è®²åº§ï¼ˆä¸Šï¼‰', '', '', '', '', '198', 'http://img01.cuctv.com/M01/98/A9/cR9ARlQZi22G772_AABeaJKt5XU569.jpg', 'çŽ‹è’™,baiyang001', 'çŽ‹è’™', '3392935', '-1', '20', 'http://www.cuc.edu.cn/jpkc/146.html', '0', '0', '0', '0', '1411004955', '1411004955', '0', '1411004955');
INSERT INTO `video--` VALUES ('149', 'z9GJx9Styg0', 'æ­¦ä¹‹æ¢¦a warrior\'s dream', '', 'è‰ºæœ¯å­¦éƒ¨', '', 'æŽæ™‹', '151', 'http://img01.cuctv.com/M01/66/47/cR9ARlQfmD2sIiGNAABB7poUnbM018.jpg', 'åŠ¨ç”» 2014å¾®ç”µå½±èŠ‚ åŠŸå¤«', '<span style=\"color:#000000;font-family:å®‹ä½“, Tahoma, Helvetica, Arial, sans-serif;font-size:16px;line-height:18px;white-space:normal;background-color:#FFFFFF;\">2014ç¬¬ä¸‰å±Šå¤§å­¦ç”Ÿå¾®ç”µå½±èŠ‚èŽ·å¥–ä½œå“ã€‚æœ¬ç‰‡æ˜¯ä¸€éƒ¨å†™å®žé£Žæ ¼çš„ä¸‰ç»´åŠ¨ç”»çŸ­ç‰‡ï¼Œé•¿åº¦3åˆ†14ç§’ã€‚æœ¬ç‰‡è¡¨çŽ°äº†ä¸€ä¸ªæ­¦è€…åœ¨ç»ƒåŠŸæ—¶ä¸Žæƒ³è±¡ä¸­å¯¹æ‰‹çš„æˆ˜æ–—ï¼Œè¯´æ˜Žæ­¦è€…è¦è¶…è¶Šçš„æœ€å¤§å¯¹æ‰‹å…¶å®žæ˜¯è‡ªå·±ï¼Œæœ€åŽçš„ç”»é¢å®šæ ¼åœ¨æŽå°é¾™çš„ç…§ç‰‡å’Œä»–çš„äº²ç¬”é¢˜å­—walk onä¸Šï¼Œè¡¨è¾¾äº†ä½œè€…å¸Œæœ›ç”„å­ä¸¹èƒ½ç»§æ‰¿å…¶å¶åƒæŽå°é¾™çš„ç²¾ç¥žï¼Œåœ¨ç”µå½±å’Œæ­¦æœ¯çš„é“è·¯ä¸Šä¸æ–­å‰è¡Œçš„ç¥æ„¿ã€‚</span>', '197252', '0', '20', 'http://www.cuc.edu.cn/dongman/149.html', '0', '832', '690', '0', '1411357140', '1411357173', '0', '1411357173');
INSERT INTO `video--` VALUES ('150', 'axCUhEhEsDs', 'ã€ç­é‰´ã€‘2010é€šä¿¡', '', '', '', '', '151', 'http://img01.cuctv.com/M01/2C/A3/cR9ARlQWq53_jLlGAAAkXrIfYWA783.jpg', 'æ ¡å›­,éŸ³ä¹,mv,æ¯•ä¸šå­£,baiyang001', 'ã€ç­é‰´ã€‘2010é€šä¿¡', '964853', '-1', '20', 'http://www.cuc.edu.cn/dongman/150.html', '0', '0', '0', '0', '1411367326', '1411367326', '0', '1411367326');
INSERT INTO `video--` VALUES ('151', 'RJmbhNkBDTE', 'NO ZUO NO DIE', '', 'è‰ºæœ¯å­¦éƒ¨', '', 'æœè¯—è¯—', '151', 'http://img01.cuctv.com/M00/67/73/cR9ARlQfvgi8jW-7AABB69pxcSo364.jpg', 'åŠ¨ç”»', 'å¯¼æ¼”ã€ç¼–å‰§ï¼šæœè¯—è¯— ç¾Žæœ¯è®¾è®¡ï¼šå¼ ç»¿æ´²', '110734', '0', '20', 'http://www.cuc.edu.cn/dongman/151.html', '0', '760', '1', '0', '1411367280', '1411367326', '0', '1411367326');
INSERT INTO `video--` VALUES ('152', '7SiELdW6DwA', 'The Voyager', '', 'è‰ºæœ¯å­¦éƒ¨', '', 'åˆ˜æŸ¯ä¼¶ ä»»ç° å¼ èŠ¸æ›¼ åˆ˜æ¢¦ç‘¶', '151', 'http://img01.cuctv.com/M01/82/90/cR8oB1QfxKyx0QBoABjqhtGGTyo367.png', 'åŠ¨ç”»', '', '178400', '0', '20', 'http://www.cuc.edu.cn/dongman/152.html', '0', '858', '0', '0', '1411367280', '1411367326', '0', '1411367326');
INSERT INTO `video--` VALUES ('153', 'zeeQpFJUevk', 'è‰ Grass', '', 'è‰ºæœ¯å­¦éƒ¨', '', 'å•å¼ èˆ’é›… å­™é›¨è²', '151', 'http://img01.cuctv.com/M00/34/E0/cR9ARlQfv4CosxWeAAAXvap4NTM591-5.jpg', 'åŠ¨ç”»', '', '121967', '0', '20', 'http://www.cuc.edu.cn/dongman/153.html', '0', '802', '0', '0', '1411367280', '1411367326', '0', '1411367326');
INSERT INTO `video--` VALUES ('154', 'EL1swC6qjx8', 'åŸŽ', '', 'è‰ºæœ¯å­¦éƒ¨', '', 'çŽ‹èµ« ä»»ç›Šæ°‘ å¾æºª å¼ çš–æ™´', '151', 'http://img01.cuctv.com/M02/6C/3F/cR9ARlQfx2r9oSN-AAA4BYM058c400-4.jpg', 'åŠ¨ç”»', 'ã€ŠåŸŽã€‹çŽ‹èµ«ï¼Œä»»ç›Šæ°‘ï¼Œå¾æºªï¼Œå¼ çš–æ™´', '225047', '0', '20', 'http://www.cuc.edu.cn/dongman/154.html', '0', '660', '0', '0', '1411369200', '1411369218', '0', '1411369218');
INSERT INTO `video--` VALUES ('155', 'kqpDxqBSuqY', 'é£žç¿”', '', 'è‰ºæœ¯å­¦éƒ¨', '', 'æ›¹æ¶¦æ³½ é‡‘æ³½ä¼Ÿ', '151', 'http://img01.cuctv.com/M02/28/27/dNXNClRPLC6cl80vAALjk4-Sgr4156.jpg', 'ç¬¬ä¹å±Šä¸­å›½ï¼ˆåŒ—äº¬ï¼‰å›½é™…å¤§å­¦ç”ŸåŠ¨ç”»èŠ', 'æœ¬ç‰‡è£èŽ·ç¬¬ä¹å±Šä¸­å›½ï¼ˆåŒ—äº¬ï¼‰å›½é™…å¤§å­¦ç”ŸåŠ¨ç”»èŠ‚æœ€ä½³éŸ³ä¹ä¸Žå£°éŸ³å¥–Best Original Music Awardã€‚', '115055', '0', '20', 'http://www.cuc.edu.cn/dongman/155.html', '0', '2699', '21', '8', '1411370160', '1411370176', '0', '1411370176');
INSERT INTO `video--` VALUES ('156', 'mfPMkp25YuE', 'å¥‹è±†', '', 'è‰ºæœ¯å­¦éƒ¨', '', 'èƒ¡é–å¨ ä»²ç»´é‘« æ¨ç«£æ°', '151', 'http://img01.cuctv.com/M01/01/B1/cR9ARlQf1MXX_yJrAAA-RnfU5tc845.jpg', 'åŠ¨ç”»', '', '188334', '0', '20', 'http://www.cuc.edu.cn/dongman/156.html', '0', '767', '0', '0', '1411373940', '1411373978', '0', '1411373978');
INSERT INTO `video--` VALUES ('157', 'IWs7uUZJtaM', 'çŒ«', '', '', '', 'å¾ç¿ ä»»æ–‡ç…œ', '151', 'http://img01.cuctv.com/M02/DC/5B/cR9ARlQg15Lx9cdOAAAmDdeT_Vc404.jpg', 'åŠ¨ç”»', '', '104800', '0', '20', 'http://www.cuc.edu.cn/dongman/157.html', '0', '810', '0', '0', '1411438740', '1411438769', '0', '1411438769');
INSERT INTO `video--` VALUES ('158', 'kQTAKu8-190', 'å®ˆæŠ¤', '', 'è‰ºæœ¯å­¦éƒ¨', '', 'éƒ‘é›æ³½ æŽçº¢è‰³ çŽ‹éŸ§é£ž', '151', 'http://img01.cuctv.com/M00/DE/87/cR9ARlQg2WP0NQsiAAA8ApgzO9s403.jpg', 'åŠ¨ç”»', '', '153882', '0', '20', 'http://www.cuc.edu.cn/dongman/158.html', '0', '860', '0', '0', '1411451760', '1411451808', '0', '1411451808');
INSERT INTO `video--` VALUES ('159', 'vL-38r1QHpM', 'åšé¢˜', '', 'è‰ºæœ¯å­¦éƒ¨', '', ' éŸ©åŒ—è¾° å­™æ¥  è·¯ä¸°ç¡• éŸ©ç’', '151', 'http://img01.cuctv.com/M00/4F/BD/cR9ARlQhDw-e_yFBAABh6UxP8A8688.jpg', 'åŠ¨ç”»', '', '167066', '0', '20', 'http://www.cuc.edu.cn/dongman/159.html', '0', '930', '1', '0', '1411452900', '1411452904', '0', '1411452904');
INSERT INTO `video--` VALUES ('160', '9pnspJM8q2Q', 'å­”pore', '', 'è‰ºæœ¯å­¦éƒ¨', '', 'é»„æ™¶ ä½•ç’å¸Œ æœ±æ²èŒç»„', '151', 'http://img01.cuctv.com/M02/8C/91/cR9ARlQgzX2EJpCbAAAtdfIPMDo246.jpg', 'åŠ¨ç”»', '', '154334', '0', '20', 'http://www.cuc.edu.cn/dongman/160.html', '0', '745', '0', '0', '1411452960', '1411452999', '0', '1411452999');
INSERT INTO `video--` VALUES ('161', 'IN45geV5KWY', 'food', '', 'è‰ºæœ¯å­¦éƒ¨', '', 'æŽå“² ä¸è”š ç”°æ€é›¨ æœé›¨æ¶µ', '151', 'http://img01.cuctv.com/M01/91/05/cR9ARlQhEA2Yq2HoAABJrVhbSwE226.jpg', 'åŠ¨ç”»', '', '73608', '0', '20', 'http://www.cuc.edu.cn/dongman/161.html', '0', '729', '0', '0', '1411454160', '1411454178', '0', '1411454178');
INSERT INTO `video--` VALUES ('162', 'ILsWn4oNpak', 'â€ä¸Žæ¢¦åŒè¡Œ çˆ±ä¸Žè´£ä»»â€œâ€”â€”ä¸­ä¼ MBAå­¦é™¢2013è¿Žæ–°æ™šä¼šæš¨å¯¼å¸ˆè˜', '', 'MBAå­¦é™¢', '', '', '140', 'http://img01.cuctv.com/M01/BF/50/cR9ARlQisS3e8rrjAABfnyviif8667.jpg', 'è¿Žæ–°æ™šä¼š', '', '7015051', '0', '20', 'http://www.cuc.edu.cn/video/162.html', '0', '884', '13', '0', '1411605120', '1411605175', '0', '1411605175');
INSERT INTO `video--` VALUES ('163', 'bEuSbHYsha8', 'ç”µæ± ', '', 'è‰ºæœ¯å­¦éƒ¨', '', 'å¼ å®¶æº', '151', 'http://img01.cuctv.com/M02/D5/05/cR9ARlQktrveEYqzAAA2sSbcyB8172.jpg', 'åŠ¨ç”»', 'å¯¼æ¼”ï¼šå¼ å®¶æº æŒ‡å¯¼æ•™å¸ˆï¼šæ¨æ™“å†› ç´¢æ™“çŽ²', '190298', '0', '20', 'http://www.cuc.edu.cn/dongman/163.html', '0', '677', '0', '0', '1411693380', '1411693413', '0', '1411693413');
INSERT INTO `video--` VALUES ('164', '8mvAQScytlw', 'å·¥ä¸šé£Ÿä»£', '', 'è‰ºæœ¯å­¦éƒ¨', '', 'éƒ‘ä¸½å‡¤ å­£äº‘æ™´ åˆ˜é›¨èŒ æŽäºšæ¢¦', '151', 'http://img01.cuctv.com/M00/07/D9/cR9ARlQkvOOtZh3mAAAY0rMhJaM798.jpg', 'åŠ¨ç”»', '', '224751', '0', '20', 'http://www.cuc.edu.cn/dongman/164.html', '0', '784', '0', '0', '1411693980', '1411693985', '0', '1411693985');
INSERT INTO `video--` VALUES ('165', 'qM9hYYCxUhQ', 'å€’å™å™æƒ…è¯—', '', 'è‰ºæœ¯å­¦éƒ¨', '', 'éƒ­ç‘¾ é©¬é›¯é¦¨', '151', 'http://img01.cuctv.com/M00/6F/27/cR9ARlQkxp6X9idCAAAgk7Hrnp0070-3.jpg', 'åŠ¨ç”»', '', '163334', '0', '20', 'http://www.cuc.edu.cn/dongman/165.html', '0', '762', '1', '0', '1411696620', '1411696653', '0', '1411696653');
INSERT INTO `video--` VALUES ('166', 'fhjCiZQfL6Y', 'ç«Ÿç„¶æ˜¯ä½ ', '', 'è‰ºæœ¯å­¦éƒ¨', '', 'æ¨æ™— é‚±é¹é£ž', '151', 'http://img01.cuctv.com/M02/4C/A1/cR9ARlQkz_7Kl2e8AAA-3ZERnAw152-6.jpg', 'åŠ¨ç”»', '', '116054', '0', '20', 'http://www.cuc.edu.cn/dongman/166.html', '0', '954', '0', '0', '1411702800', '1411702833', '0', '1411702833');
INSERT INTO `video--` VALUES ('168', 'w1THwzVvPlo', 'è¥¿æ±Ÿæœˆ', '', 'è‰ºæœ¯å­¦éƒ¨', '', 'æ›¾æ™“é›… æ±ªæ’', '151', 'http://img01.cuctv.com/M00/CF/AF/cR9ARlQlBdirsxcdAABbhkGZ6IQ616-2.jpg', 'åŠ¨ç”»', '', '102000', '0', '20', 'http://www.cuc.edu.cn/dongman/168.html', '0', '728', '0', '0', '1411713240', '1411713294', '0', '1411713294');
INSERT INTO `video--` VALUES ('169', 'xtoqKeRso80', 'è¿™ä¸ªç”µè¯å¾ˆé‡è¦', '', 'è‰ºæœ¯å­¦éƒ¨', '', 'æŽæ¬¢ æŽå¥¥å®‡ æ–½åšæ–‡ èµµå›½ç¿”', '151', 'http://img01.cuctv.com/M00/A8/78/cR9ARlQlE4__yd2TAABJ-n-h88g665-3.jpg', 'åŠ¨ç”»', '', '118148', '0', '20', 'http://www.cuc.edu.cn/dongman/169.html', '0', '908', '38', '0', '1411716360', '1411716406', '0', '1411716406');
INSERT INTO `video--` VALUES ('170', '1sCZ2R3tyRw', 'è€å±‹ \"é‡‘é£žç‡•å¥–\"åŠ\"æœ€ä½³å‰§æœ¬å¥–\"', '', 'è‰ºæœ¯å­¦éƒ¨', '', 'å¨„éœ„éœ„', '140', 'http://img01.cuctv.com/M02/91/40/dNXNClQlVaWZ__quABQDHy_IM40473.png', 'å¾®ç”µå½±,é£žç‡•å¥–', 'é¦–å±Šæµ·å³¡ä¸¤å²¸å¾®ç”µå½±é«˜å³°è®ºå›é£žç‡•å¥–åœ¨æ­¦æ±‰å¤§å­¦æ­æ™“ï¼Œæˆ‘æ ¡æ–°é—»å­¦é™¢çŽ‹ç¿å‘æ•™æŽˆã€å½±è§†è‰ºæœ¯å­¦é™¢éƒ‘å‘è£è€å¸ˆæŒ‡å¯¼ï¼Œå½±è§†è‰ºæœ¯å­¦é™¢2011çº§å¹¿æ’­ç”µè§†ç¼–å¯¼ï¼ˆç»¼è‰ºæ–¹å‘ï¼‰å¨„éœ„éœ„ç¼–å‰§å¹¶å¯¼æ¼”çš„å¾®ç”µå½±ä½œå“ã€Šè€å±‹ã€‹è£èŽ·\"é‡‘é£žç‡•å¥–\"åŠ\"æœ€ä½³å‰§æœ¬å¥–\"ã€‚', '745013', '0', '20', 'http://www.cuc.edu.cn/video/170.html', '0', '771', '3', '0', '1411728300', '1411728339', '0', '1411728339');
INSERT INTO `video--` VALUES ('171', '02MtnRd9Wak', 'ä¸­å›½ä¼ åª’å¤§å­¦äº¤å“ä¹å›¢æˆç«‹äº”å‘¨å¹´ç²¾é€‰é›†ï¼ˆä¸Šï¼‰', '', '', '', '', '140', 'http://img01.cuctv.com/M01/F9/73/cR9ARlQnx83yLXkxAABfaS-WnjY807-6.jpg', 'äº¤å“ä¹å›¢,ç²¾é€‰é›†', '', '3830202', '0', '20', 'http://www.cuc.edu.cn/video/171.html', '0', '116', '0', '0', '1411961160', '1411961189', '0', '1411961189');
INSERT INTO `video--` VALUES ('172', 'clpPwtKPmP0', 'ä¸­å›½ä¼ åª’å¤§å­¦äº¤å“ä¹å›¢æˆç«‹äº”å‘¨å¹´ç²¾é€‰é›†ï¼ˆä¸‹ï¼‰', '', '', '', '', '140', 'http://img01.cuctv.com/M01/99/19/cR9ARlQnymWaGv65AABfiz7c3G4054-6.jpg', 'äº¤å“ä¹å›¢,ç²¾é€‰é›†', '', '3626400', '0', '20', 'http://www.cuc.edu.cn/video/172.html', '0', '80', '1', '0', '1411961160', '1411961189', '0', '1411961189');
INSERT INTO `video--` VALUES ('173', 'YE5D3Lthv_o', 'MBAå­¦å­ä¸ƒå›½è¯­è¨€æ¼”ç»Žæ ¡æ­Œ', '', 'MBAå­¦é™¢', '', '', '140', 'http://img01.cuctv.com/M01/3C/67/cR9ARlQo92TMag42ACGMVoe2jWE640.png', 'å”±æ­Œ', '', '150025', '0', '20', 'http://www.cuc.edu.cn/video/173.html', '0', '179', '12', '0', '1411970460', '1411970515', '0', '1411970515');
INSERT INTO `video--` VALUES ('174', 'O4uM-KjopWY', 'ã€Šå›½å®¶å®¡è®¡ã€‹ç‰‡èŠ±', '', '', '', '', '140', 'http://img01.cuctv.com/M02/0E/E3/cR9ARlQqdi6_MpiNAAAn2HDwWy8057.jpg', 'å®£ä¼ ç‰‡,baiyang001', 'ã€Šå›½å®¶å®¡è®¡ã€‹ç‰‡èŠ±', '583534', '-3', '20', '', '0', '2', '0', '0', '1412070565', '1412070565', '0', '1412070565');
INSERT INTO `video--` VALUES ('175', 'O4uM-KjopWY', 'ä¸­ä¼ å‡ºå“ï¼šç”µè§†è¿žç»­å‰§ã€Šå›½å®¶å®¡è®¡ã€‹é¢„å‘Šç‰‡â€”â€”10æœˆ4æ—¥æ²³åŒ—å', '', 'æˆå‰§å½±è§†å­¦é™¢', '', '', '140', 'http://img01.cuctv.com/M02/FD/C5/cR9ARlQuikKc-dXmAAKUrwTQEn4038.jpg', 'é¢„å‘Šç‰‡,baiyang001', 'ã€Šå›½å®¶å®¡è®¡ã€‹é¢„å‘Šç‰‡', '583534', '-3', '20', 'http://www.cuc.edu.cn/video/175.html', '0', '4', '0', '0', '1412335620', '1412335661', '0', '1412335661');
INSERT INTO `video--` VALUES ('176', 'mM_djWmBHzM', 'ã€Šå›½å®¶å®¡è®¡ã€‹é¢„å‘Šç‰‡â€”â€”10æœˆ4æ—¥æ²³åŒ—å«è§†é¦–æ’­', '', '', '', '', '140', 'http://img01.cuctv.com/M02/67/C3/cR8oB1Qunn3qwxTDAAKUrwTQEn4697.jpg', 'å›½å®¶å®¡è®¡,baiyang001', 'ã€Šå›½å®¶å®¡è®¡ã€‹é¢„å‘Šç‰‡', '280734', '0', '20', 'http://www.cuc.edu.cn/video/176.html', '0', '58', '0', '0', '1412341260', '1412341302', '0', '1412341302');
INSERT INTO `video--` VALUES ('177', 'mM_djWmBHzM', 'ã€Šå›½å®¶å®¡è®¡ã€‹ç‰‡èŠ±', '', '', '', '', '140', 'http://img01.cuctv.com/M02/FA/B3/dNXNClQuirHyr34FAABPJkQbuUI461.jpg', 'å›½å®¶å®¡è®¡,baiyang001', 'å›½å®¶å®¡è®¡ç‰‡èŠ±', '280734', '-3', '20', '', '0', '0', '0', '0', '1412341633', '1412341633', '0', '1412341633');
INSERT INTO `video--` VALUES ('178', '9y17p59eEqk', 'life form', '', '', '', '', '151', 'http://img01.cuctv.com/M01/E9/CB/cR9ARlQ0q6e1R9HrAAA5kMHoEcE922.jpg', 'åŠ¨ç”»,baiyang001', 'life form', '54600', '-1', '20', '', '0', '0', '0', '0', '1412739294', '1412739294', '0', '1412739294');
INSERT INTO `video--` VALUES ('179', 'YqlwseQp08k', 'ä¼ åª’å¤§å­¦å¸ˆç”Ÿâ€œç™¾ä½å…±äº§å…šäººç™¾ç¯‡å°ä¼ æœ—è¯µä¼šâ€', '', '', '', '', '140', 'http://img01.cuctv.com/M00/57/8B/cR9ARlQ0_S_AtHglAABceHAkePg992.jpg', 'å…±äº§å…šäºº,æœ—è¯µä¼š,baiyang001', '', '5719493', '0', '20', 'http://www.cuc.edu.cn/video/179.html', '0', '1450', '0', '0', '1412768040', '1412768040', '0', '1412768040');
INSERT INTO `video--` VALUES ('180', 'x8P5cjaZyyo', 'äº”ä¸ªä¸€å·¥ç¨‹å¥–ï¼šã€Šèµ°è¿›å’Œç”°ã€‹ç¬¬ä¸€é›† ç»¿æ´²å’Œå¼¦', '', 'æ–°é—»ä¼ æ’­å­¦éƒ¨', '', '', '140', 'http://img01.cuctv.com/M02/1B/69/cR8oB1REqJKVT20xAAEmkYQr5s4332.jpg', 'èµ°è¿›å’Œç”° çºªå½•ç‰‡', '<p>\r\n	<span style=\"color:#333333;font-family:å®‹ä½“;line-height:25px;white-space:normal;background-color:#FFFFFF;\"><span style=\"color:#333333;font-family:SimSun;line-height:26px;text-indent:24px;white-space:normal;background-color:#FFFFFF;\">ã€Šèµ°è¿›å’Œç”°ã€‹æ˜¯ç”±åŒ—äº¬æ´ç–†å’Œç”°æŒ‡æŒ¥éƒ¨å§”æ‰˜ä¸­å›½ä¼ åª’å¤§å­¦åˆ¶ä½œçš„ç”µè§†çºªå½•ç‰‡ï¼Œç”±ç”µè§†ä¸Žæ–°é—»å­¦é™¢æ‰¿æ‹…å…·ä½“æ‘„åˆ¶ä»»åŠ¡ã€‚</span></span><span style=\"color:#333333;font-family:SimSun;line-height:25px;white-space:normal;background-color:#FFFFFF;\"><span style=\"font-family:SimSun;\">æœ¬ç‰‡è£èŽ·</span></span><span style=\"background-color:#FFFFFF;color:#2B2B2B;font-family:SimSun;letter-spacing:-1.5px;line-height:normal;\">ç¬¬13å±Šç²¾ç¥žæ–‡æ˜Žå»ºè®¾â€œäº”ä¸ªä¸€å·¥ç¨‹â€å¥–ã€‚</span><span style=\"color:#333333;font-family:å®‹ä½“;line-height:25px;white-space:normal;background-color:#FFFFFF;\"><span style=\"font-family:SimSun;\"><br />\r\n</span></span> \r\n</p>\r\n<p>\r\n	<span style=\"color:#333333;font-family:å®‹ä½“;line-height:25px;white-space:normal;background-color:#FFFFFF;\">ã€Šèµ°è¿›å’Œç”°ã€‹æ˜¯ç¬¬ä¸€éƒ¨å…¨æ™¯å¼åæ˜ æ–°ç–†å’Œç”°é£ŽåœŸäººæƒ…çš„è®°å½•ç‰‡ï¼Œåˆ†åˆ¥ä»Žè‡ªç„¶ã€äººæ–‡ã€ç‰©äº§ã€åŽ†å²çš„è§’åº¦è§£è¯»å’Œç”°ã€‚ç”µè§†è§‚ä¼—é€šè¿‡åœ¨ç”µè§†é‡Œèµ°è¿›å’Œç”°ï¼Œèµ°è¿›æ–°ç–†ï¼Œèµ°è¿›å°‘æ•°æ°‘æ—çš„ç”Ÿæ´»æ·±å¤„ï¼Œå…¨é¢å®¢è§‚äº†è§£æ°‘æ—åœ°åŒºåŽ†å²æ–‡åŒ–ï¼Œäº†è§£æ·³æœ´å–„è‰¯çš„æ°‘é£Žæ°‘ä¿—ï¼Œå¯¹äºŽæ ‘ç«‹å’Œç”°ä¹ƒè‡³æ–°ç–†çš„è‰¯å¥½å½¢è±¡ï¼ŒåŠ å¼·å„æ°‘æ—ä¹‹é–“å¿ƒçµæ²Ÿé€šã€å¢žè¿›äº†è§£äº’ä¿¡ã€ä¿ƒè¿›æ°‘æ—å›¢ç»“éžå¸¸æœ‰å¸®åŠ©ã€‚</span> \r\n</p>', '1866867', '0', '20', 'http://www.cuc.edu.cn/video/180.html', '0', '2857', '0', '0', '1413012000', '1413012043', '0', '1413012043');
INSERT INTO `video--` VALUES ('181', 'hOUzf14vH90', 'äº”ä¸ªä¸€å·¥ç¨‹å¥–ï¼šã€Šèµ°è¿›å’Œç”°ã€‹ç¬¬äºŒé›† äººæ–‡å’å¹', '', 'æ–°é—»ä¼ æ’­å­¦éƒ¨', '', '', '140', 'http://img01.cuctv.com/M02/2E/91/cR8oB1REqOzg_mFPAAEmkYQr5s4918.jpg', 'èµ°è¿›å’Œç”°', '<p style=\"white-space:normal;\">\r\n	<span style=\"color:#333333;font-family:å®‹ä½“;line-height:25px;background-color:#FFFFFF;\"><span style=\"font-family:SimSun;line-height:26px;text-indent:24px;\">ã€Šèµ°è¿›å’Œç”°ã€‹æ˜¯ç”±åŒ—äº¬æ´ç–†å’Œç”°æŒ‡æŒ¥éƒ¨å§”æ‰˜ä¸­å›½ä¼ åª’å¤§å­¦åˆ¶ä½œçš„ç”µè§†çºªå½•ç‰‡ï¼Œç”±ç”µè§†ä¸Žæ–°é—»å­¦é™¢æ‰¿æ‹…å…·ä½“æ‘„åˆ¶ä»»åŠ¡ã€‚</span></span><span style=\"color:#333333;font-family:SimSun;line-height:25px;background-color:#FFFFFF;\">æœ¬ç‰‡è£èŽ·</span><span style=\"background-color:#FFFFFF;color:#2B2B2B;font-family:SimSun;letter-spacing:-1.5px;line-height:normal;\">ç¬¬13å±Šç²¾ç¥žæ–‡æ˜Žå»ºè®¾â€œäº”ä¸ªä¸€å·¥ç¨‹â€å¥–ã€‚</span><span style=\"color:#333333;font-family:å®‹ä½“;line-height:25px;background-color:#FFFFFF;\"><span style=\"font-family:SimSun;\"><br />\r\n</span></span> \r\n</p>\r\n<p style=\"white-space:normal;\">\r\n	<span style=\"color:#333333;font-family:å®‹ä½“;line-height:25px;background-color:#FFFFFF;\">ã€Šèµ°è¿›å’Œç”°ã€‹æ˜¯ç¬¬ä¸€éƒ¨å…¨æ™¯å¼åæ˜ æ–°ç–†å’Œç”°é£ŽåœŸäººæƒ…çš„è®°å½•ç‰‡ï¼Œåˆ†åˆ¥ä»Žè‡ªç„¶ã€äººæ–‡ã€ç‰©äº§ã€åŽ†å²çš„è§’åº¦è§£è¯»å’Œç”°ã€‚ç”µè§†è§‚ä¼—é€šè¿‡åœ¨ç”µè§†é‡Œèµ°è¿›å’Œç”°ï¼Œèµ°è¿›æ–°ç–†ï¼Œèµ°è¿›å°‘æ•°æ°‘æ—çš„ç”Ÿæ´»æ·±å¤„ï¼Œå…¨é¢å®¢è§‚äº†è§£æ°‘æ—åœ°åŒºåŽ†å²æ–‡åŒ–ï¼Œäº†è§£æ·³æœ´å–„è‰¯çš„æ°‘é£Žæ°‘ä¿—ï¼Œå¯¹äºŽæ ‘ç«‹å’Œç”°ä¹ƒè‡³æ–°ç–†çš„è‰¯å¥½å½¢è±¡ï¼ŒåŠ å¼·å„æ°‘æ—ä¹‹é–“å¿ƒçµæ²Ÿé€šã€å¢žè¿›äº†è§£äº’ä¿¡ã€ä¿ƒè¿›æ°‘æ—å›¢ç»“éžå¸¸æœ‰å¸®åŠ©ã€‚</span> \r\n</p>', '2099800', '0', '20', 'http://www.cuc.edu.cn/video/181.html', '0', '722', '0', '0', '1413012900', '1413012957', '0', '1413012957');
INSERT INTO `video--` VALUES ('182', 'EpaLp9s0hOw', 'äº”ä¸ªä¸€å·¥ç¨‹å¥–ï¼šã€Šèµ°è¿›å’Œç”°ã€‹ç¬¬ä¸‰é›† æ—¶å…‰åå¥', '', 'æ–°é—»ä¼ æ’­å­¦éƒ¨', '', '', '140', 'http://img01.cuctv.com/M02/EA/70/dNXNClREqM-2dpQWAAEmkcjt7qc185.jpg', 'èµ°è¿›å’Œç”°', '<p style=\"white-space:normal;\">\r\n	<span style=\"color:#333333;font-family:å®‹ä½“;line-height:25px;background-color:#FFFFFF;\"><span style=\"font-family:SimSun;line-height:26px;text-indent:24px;\">ã€Šèµ°è¿›å’Œç”°ã€‹æ˜¯ç”±åŒ—äº¬æ´ç–†å’Œç”°æŒ‡æŒ¥éƒ¨å§”æ‰˜ä¸­å›½ä¼ åª’å¤§å­¦åˆ¶ä½œçš„ç”µè§†çºªå½•ç‰‡ï¼Œç”±ç”µè§†ä¸Žæ–°é—»å­¦é™¢æ‰¿æ‹…å…·ä½“æ‘„åˆ¶ä»»åŠ¡ã€‚</span></span><span style=\"color:#333333;font-family:SimSun;line-height:25px;background-color:#FFFFFF;\">æœ¬ç‰‡è£èŽ·</span><span style=\"background-color:#FFFFFF;color:#2B2B2B;font-family:SimSun;letter-spacing:-1.5px;line-height:normal;\">ç¬¬13å±Šç²¾ç¥žæ–‡æ˜Žå»ºè®¾â€œäº”ä¸ªä¸€å·¥ç¨‹â€å¥–ã€‚</span><span style=\"color:#333333;font-family:å®‹ä½“;line-height:25px;background-color:#FFFFFF;\"><span style=\"font-family:SimSun;\"><br />\r\n</span></span> \r\n</p>\r\n<p style=\"white-space:normal;\">\r\n	<span style=\"color:#333333;font-family:å®‹ä½“;line-height:25px;background-color:#FFFFFF;\">ã€Šèµ°è¿›å’Œç”°ã€‹æ˜¯ç¬¬ä¸€éƒ¨å…¨æ™¯å¼åæ˜ æ–°ç–†å’Œç”°é£ŽåœŸäººæƒ…çš„è®°å½•ç‰‡ï¼Œåˆ†åˆ¥ä»Žè‡ªç„¶ã€äººæ–‡ã€ç‰©äº§ã€åŽ†å²çš„è§’åº¦è§£è¯»å’Œç”°ã€‚ç”µè§†è§‚ä¼—é€šè¿‡åœ¨ç”µè§†é‡Œèµ°è¿›å’Œç”°ï¼Œèµ°è¿›æ–°ç–†ï¼Œèµ°è¿›å°‘æ•°æ°‘æ—çš„ç”Ÿæ´»æ·±å¤„ï¼Œå…¨é¢å®¢è§‚äº†è§£æ°‘æ—åœ°åŒºåŽ†å²æ–‡åŒ–ï¼Œäº†è§£æ·³æœ´å–„è‰¯çš„æ°‘é£Žæ°‘ä¿—ï¼Œå¯¹äºŽæ ‘ç«‹å’Œç”°ä¹ƒè‡³æ–°ç–†çš„è‰¯å¥½å½¢è±¡ï¼ŒåŠ å¼·å„æ°‘æ—ä¹‹é–“å¿ƒçµæ²Ÿé€šã€å¢žè¿›äº†è§£äº’ä¿¡ã€ä¿ƒè¿›æ°‘æ—å›¢ç»“éžå¸¸æœ‰å¸®åŠ©ã€‚</span> \r\n</p>', '2085734', '0', '20', 'http://www.cuc.edu.cn/video/182.html', '0', '351', '0', '0', '1413012900', '1413012957', '0', '1413012957');
INSERT INTO `video--` VALUES ('183', 'RaJpCbppUtY', 'äº”ä¸ªä¸€å·¥ç¨‹å¥–ï¼šã€Šèµ°è¿›å’Œç”°ã€‹ç¬¬å››é›† å²æœˆäº¤å“', '', 'æ–°é—»ä¼ æ’­å­¦éƒ¨', '', '', '140', 'http://img01.cuctv.com/M02/83/95/cR9ARlREqFm-yG4sAAEmkYQr5s4568.jpg', 'èµ°è¿›å’Œç”°', '<p style=\"white-space:normal;\">\r\n	<span style=\"color:#333333;font-family:å®‹ä½“;line-height:25px;background-color:#FFFFFF;\"><span style=\"font-family:SimSun;line-height:26px;text-indent:24px;\">ã€Šèµ°è¿›å’Œç”°ã€‹æ˜¯ç”±åŒ—äº¬æ´ç–†å’Œç”°æŒ‡æŒ¥éƒ¨å§”æ‰˜ä¸­å›½ä¼ åª’å¤§å­¦åˆ¶ä½œçš„ç”µè§†çºªå½•ç‰‡ï¼Œç”±ç”µè§†ä¸Žæ–°é—»å­¦é™¢æ‰¿æ‹…å…·ä½“æ‘„åˆ¶ä»»åŠ¡ã€‚</span></span><span style=\"color:#333333;font-family:SimSun;line-height:25px;background-color:#FFFFFF;\">æœ¬ç‰‡è£èŽ·</span><span style=\"background-color:#FFFFFF;color:#2B2B2B;font-family:SimSun;letter-spacing:-1.5px;line-height:normal;\">ç¬¬13å±Šç²¾ç¥žæ–‡æ˜Žå»ºè®¾â€œäº”ä¸ªä¸€å·¥ç¨‹â€å¥–ã€‚</span><span style=\"color:#333333;font-family:å®‹ä½“;line-height:25px;background-color:#FFFFFF;\"><span style=\"font-family:SimSun;\"><br />\r\n</span></span> \r\n</p>\r\n<p style=\"white-space:normal;\">\r\n	<span style=\"color:#333333;font-family:å®‹ä½“;line-height:25px;background-color:#FFFFFF;\">ã€Šèµ°è¿›å’Œç”°ã€‹æ˜¯ç¬¬ä¸€éƒ¨å…¨æ™¯å¼åæ˜ æ–°ç–†å’Œç”°é£ŽåœŸäººæƒ…çš„è®°å½•ç‰‡ï¼Œåˆ†åˆ¥ä»Žè‡ªç„¶ã€äººæ–‡ã€ç‰©äº§ã€åŽ†å²çš„è§’åº¦è§£è¯»å’Œç”°ã€‚ç”µè§†è§‚ä¼—é€šè¿‡åœ¨ç”µè§†é‡Œèµ°è¿›å’Œç”°ï¼Œèµ°è¿›æ–°ç–†ï¼Œèµ°è¿›å°‘æ•°æ°‘æ—çš„ç”Ÿæ´»æ·±å¤„ï¼Œå…¨é¢å®¢è§‚äº†è§£æ°‘æ—åœ°åŒºåŽ†å²æ–‡åŒ–ï¼Œäº†è§£æ·³æœ´å–„è‰¯çš„æ°‘é£Žæ°‘ä¿—ï¼Œå¯¹äºŽæ ‘ç«‹å’Œç”°ä¹ƒè‡³æ–°ç–†çš„è‰¯å¥½å½¢è±¡ï¼ŒåŠ å¼·å„æ°‘æ—ä¹‹é–“å¿ƒçµæ²Ÿé€šã€å¢žè¿›äº†è§£äº’ä¿¡ã€ä¿ƒè¿›æ°‘æ—å›¢ç»“éžå¸¸æœ‰å¸®åŠ©ã€‚</span> \r\n</p>', '2074000', '0', '20', 'http://www.cuc.edu.cn/video/183.html', '0', '196', '0', '0', '1413012900', '1413012957', '0', '1413012957');
INSERT INTO `video--` VALUES ('184', 'N0tJqfBTsRw', 'â€œç™½æ¨æƒ…Â·ä¸­å›½æ¢¦â€ä¸­ä¼ 60å‘¨å¹´æ ¡åº†æ™šä¼šï¼ˆä¸Šï¼‰', '', '', '', '', '140', 'http://img01.cuctv.com/M00/47/4F/cR8oB1Q7HCjX5Y4wAGhNCkpHu20237.jpg', 'ã€Šç™½æ¨æƒ…ä¸­å›½æ¢¦ã€‹ä¸­ä¼ 60å‘¨å¹´æ ¡åº†æ™šä¼š', 'ã€Šç™½æ¨æƒ…ä¸­å›½æ¢¦ã€‹ä¸­ä¼ 60å‘¨å¹´æ ¡åº†æ™šä¼šï¼ˆä¸Šï¼‰', '4169604', '0', '20', 'http://www.cuc.edu.cn/video/184.html', '0', '6787', '21', '2', '1413159060', '1413159062', '0', '1413159062');
INSERT INTO `video--` VALUES ('185', 'kyFTOmUroJI', 'â€œç™½æ¨æƒ…Â·ä¸­å›½æ¢¦â€ä¸­ä¼ 60å‘¨å¹´æ ¡åº†æ™šä¼šï¼ˆä¸‹ï¼‰', '', '', '', '', '140', 'http://img01.cuctv.com/M01/3C/E7/dNXNClQ7HHSVSoh7AGhNCkIEr9k332.jpg', 'ã€Šç™½æ¨æƒ…ä¸­å›½æ¢¦ã€‹ä¸­ä¼ 60å‘¨å¹´æ ¡åº†æ™šä¼š', 'ã€Šç™½æ¨æƒ…ä¸­å›½æ¢¦ã€‹ä¸­ä¼ 60å‘¨å¹´æ ¡åº†æ™šä¼šï¼ˆä¸‹ï¼‰', '4571631', '0', '20', 'http://www.cuc.edu.cn/video/185.html', '0', '3412', '2', '0', '1413159060', '1413159062', '0', '1413159062');
INSERT INTO `video--` VALUES ('186', '8GntNC8VMvE', 'ç¬¬åäºŒå±Šâ€œåŠå¤çš„çºªå¿µâ€å¤§å­¦ç”Ÿå½±åƒå±•é¢å¥–å…¸ç¤¼', '', 'æ–°é—»ä¼ æ’­å­¦éƒ¨', '', '', '140', 'http://img01.cuctv.com/M02/C6/AF/cR9ARlQ7GurWkuaQABwu0Wf35rA435.png', 'åŠå¤çš„çºªå¿µ', '', '7089053', '0', '20', 'http://www.cuc.edu.cn/video/186.html', '0', '562', '2', '0', '1413159060', '1413159076', '0', '1413159076');
INSERT INTO `video--` VALUES ('187', 'trJRsXuehPM', '11thåŠå¤æ‹å­—å¹•æœ€ç»ˆç‰ˆ', '', '', '', '', '140', 'http://img01.cuctv.com/M00/70/A1/cR9ARlQ5GDOgLK0vAABPwZAmsDE144.jpg', 'åŠå¤çš„çºªå¿µ,baiyang001', '', '6106692', '-1', '-20', '', '0', '0', '0', '0', '1413159076', '1413159076', '0', '1413159076');
INSERT INTO `video--` VALUES ('188', 'lJtzJRq6dbU', 'ç¬¬åå±Šå…¨å›½å¤§å­¦ç”Ÿä¸€åˆ†é’Ÿå½±åƒå¤§èµ›é¢å¥–æ™šä¼š', '', '', '', '', '140', 'http://img01.cuctv.com/M01/6F/6B/cR9ARlQ5IzapPq7nAAAhdGijmn8767.jpg', 'ä¸€åˆ†é’Ÿå½±åƒèŠ‚', '', '7791949', '-1', '-20', 'http://www.cuc.edu.cn/video/188.html', '0', '0', '0', '0', '1413159060', '1413159076', '0', '1413159076');
INSERT INTO `video--` VALUES ('189', '6dSv4zcSMDE', 'ã€Šè¥¿åŒºæ•…äº‹ã€‹å®£ä¼ ç‰‡', '', 'è‰ºæœ¯å­¦éƒ¨', '', '', '140', 'http://img01.cuctv.com/M00/79/FD/dNXNClQ7jm2jXzX6ABW0y44LD1E015.png', 'å®£ä¼ ç‰‡', 'ã€Šè¥¿åŒºæ•…äº‹ã€‹å®£ä¼ ç‰‡', '51600', '0', '20', 'http://www.cuc.edu.cn/video/189.html', '0', '1202', '1', '0', '1413189120', '1413189123', '0', '1413189123');
INSERT INTO `video--` VALUES ('190', '2aQlHY6XneA', 'ç¬¬åä¸€å±Šâ€œåŠå¤çš„çºªå¿µâ€å¤§å­¦ç”Ÿå½±åƒå±•é¢å¥–å…¸ç¤¼', '', 'æ–°é—»ä¼ æ’­å­¦éƒ¨', '', '', '140', 'http://img01.cuctv.com/M01/19/E3/cR8oB1Q8a4ePGn3OABxJyDddUbA127.png', 'åŠå¤çš„çºªå¿µ æ™šä¼š', '', '6099610', '0', '20', 'http://www.cuc.edu.cn/video/190.html', '0', '47', '0', '0', '1413245580', '1413245592', '0', '1413245592');
INSERT INTO `video--` VALUES ('191', '9eBD-TpJ6C4', 'ç¬¬åå±Šå…¨å›½å¤§å­¦ç”Ÿä¸€åˆ†é’Ÿå½±åƒå¤§èµ›é¢å¥–æ™šä¼š', '', 'æ–°é—»ä¼ æ’­å­¦éƒ¨', '', '', '140', 'http://img01.cuctv.com/M00/F1/0B/cR8oB1Q8bHL4VRrNACUOR1ZBYXY489.png', 'ä¸€åˆ†é’Ÿ,æ™šä¼š', '', '7786936', '0', '20', 'http://www.cuc.edu.cn/video/191.html', '0', '82', '0', '0', '1413245580', '1413245592', '0', '1413245592');
INSERT INTO `video--` VALUES ('192', 'RUgYumQNdSY', 'ç¬¬åå±Šå…¨å›½å¤§å­¦ç”Ÿä¸€åˆ†é’Ÿå½±åƒå¤§èµ›é¢å¥–æ™šä¼š', '', 'æ–°é—»ä¼ æ’­å­¦éƒ¨', '', '', '140', 'http://img01.cuctv.com/M02/77/CB/dNXNClQ-DfiItlGLACUOR4jZax0129.png', 'ä¸€åˆ†é’Ÿå½±åƒå¤§èµ›,æ™šä¼š', '', '7787939', '-3', '20', 'http://www.cuc.edu.cn/video/192.html', '0', '3', '0', '0', '1413352260', '1413352306', '2', '1413352306');
INSERT INTO `video--` VALUES ('193', 'UILT0t2ql-o', 'ä¸­å›½ä¼ åª’å¤§å­¦äº¤å“ä¹å›¢2014å¹´æ–°å¹´éŸ³ä¹ä¼š', '', 'è‰ºæœ¯å­¦éƒ¨', '', '', '140', 'http://img01.cuctv.com/M01/0C/27/dNXNClQ-DCjsmBIzAA5E72_ehFY118.png', 'ä¸­å›½ä¼ åª’å¤§å­¦äº¤å“ä¹å›¢,æ–°å¹´éŸ³ä¹ä¼š,201', '', '7672134', '0', '20', 'http://www.cuc.edu.cn/video/193.html', '0', '627', '0', '0', '1413352260', '1413352306', '0', '1413352306');
INSERT INTO `video--` VALUES ('194', 'Hb6Je2DPwAg', 'ä¸­ä¼ ä¹‹å­:ç•™å­¦ç”Ÿ', '', 'ä¸­å›½ä¼ åª’å¤§å­¦ç”µè§†å°', '', '', '140', 'http://img01.cuctv.com/M00/F7/35/cR9ARlRQU3apoJdbAAJ11DPX6lE476.jpg', 'ä¸­ä¼ ä¹‹å­', '', '467667', '0', '20', 'http://www.cuc.edu.cn/video/194.html', '0', '20', '0', '0', '1413360780', '1413360823', '0', '1413360823');
INSERT INTO `video--` VALUES ('195', 'fPNBMgkcclI', 'ä¸­ä¼ ä¹‹å­_20140410_ä¼ æ‰¿', '', '', '', '', '140', 'http://img01.cuctv.com/M00/CD/29/cR9ARlQ-GWOAuXUUAAB8hLLaqmI681.jpg', 'ä¸­ä¼ ä¹‹å­,baiyang001', '', '608200', '-1', '20', '', '0', '0', '0', '0', '1413360823', '1413360823', '0', '1413360823');
INSERT INTO `video--` VALUES ('196', 'f-6QEn3tzt8', 'ä¸­ä¼ ä¹‹å­ï¼šèƒ¡æ™ºé”‹', '', 'ä¸­å›½ä¼ åª’å¤§å­¦ç”µè§†å°', '', '', '140', 'http://img01.cuctv.com/M01/0F/DD/cR9ARlRInA-9-f0rAAJ11DPX6lE688.jpg', 'ä¸­ä¼ ä¹‹å­', '', '621065', '0', '20', 'http://www.cuc.edu.cn/video/196.html', '0', '32', '0', '0', '1413360780', '1413360823', '0', '1413360823');
INSERT INTO `video--` VALUES ('197', '2mmGIT54kmU', 'ä¸­ä¼ ä¹‹å­_20140417_æ…ˆå­åšçˆ±æŽåœŸç”Ÿ', '', '', '', '', '140', 'http://img01.cuctv.com/M02/C7/41/cR9ARlQ-GijG5_G1AABVZGPUCJE188.jpg', 'ä¸­ä¼ ä¹‹å­,baiyang001', '', '797267', '-1', '20', '', '0', '0', '0', '0', '1413360823', '1413360823', '0', '1413360823');
INSERT INTO `video--` VALUES ('198', '-CFmjVZuHX8', 'ä¸­ä¼ ä¹‹å­ï¼šæ›¾åº†ç‘ž', '', 'ä¸­å›½ä¼ åª’å¤§å­¦ç”µè§†å°', '', '', '140', 'http://img01.cuctv.com/M01/F0/A8/cR8oB1RIdazgln30AAJ11DPX6lE124.jpg', 'ä¸­ä¼ ä¹‹å­', '', '859524', '0', '20', 'http://www.cuc.edu.cn/video/198.html', '0', '21', '0', '0', '1413360780', '1413360823', '0', '1413360823');
INSERT INTO `video--` VALUES ('199', 'mz4Od6-ZLYM', 'ä¸­ä¼ ä¹‹å­ï¼šæŽæ¾å ‚å’Œä»–çš„Chinaæ¢¦', '', 'ä¸­å›½ä¼ åª’å¤§å­¦ç”µè§†å°', '', '', '140', 'http://img01.cuctv.com/M02/C7/89/cR8oB1RPP07e5-S7AAJ11DPX6lE880.jpg', 'ä¸­ä¼ ä¹‹å­', '', '670334', '0', '20', 'http://www.cuc.edu.cn/video/199.html', '0', '10', '0', '0', '1413360780', '1413360823', '0', '1413360823');
INSERT INTO `video--` VALUES ('200', 'osIUGx2WdZE', 'ä¸­ä¼ ä¹‹å­ï¼šæœ±ç¾½å›', '', 'ä¸­å›½ä¼ åª’å¤§å­¦ç”µè§†å°', '', '', '140', 'http://img01.cuctv.com/M01/09/B9/cR9ARlRIdSXhl0EQAAJ11DPX6lE142.jpg', 'ä¸­ä¼ ä¹‹å­', '', '718400', '0', '20', 'http://www.cuc.edu.cn/video/200.html', '0', '15', '0', '0', '1413360780', '1413360823', '0', '1413360823');
INSERT INTO `video--` VALUES ('201', 'i7J_dH-U4Pg', 'ä¸­ä¼ ä¹‹å­ï¼šæˆ‘çš„é“ƒå…°èŠ±æ¢¦', '', 'ä¸­å›½ä¼ åª’å¤§å­¦ç”µè§†å°', '', '', '140', 'http://img01.cuctv.com/M00/D3/15/dNXNClRQVAmbeqfgAAJ11Ju3HZk727.jpg', 'ä¸­ä¼ ä¹‹å­', '', '717600', '0', '20', 'http://www.cuc.edu.cn/video/201.html', '0', '11', '0', '0', '1413360780', '1413360823', '0', '1413360823');
INSERT INTO `video--` VALUES ('202', 'jSeY5oBerP8', 'ä¸­ä¼ ä¹‹å­ï¼šè·¯ç››ç« ', '', 'ä¸­å›½ä¼ åª’å¤§å­¦ç”µè§†å°', '', '', '140', 'http://img01.cuctv.com/M02/E3/49/cR8oB1RIclKbBMSWAAJ11DPX6lE926.jpg', 'ä¸­ä¼ ä¹‹å­', '', '795757', '0', '20', 'http://www.cuc.edu.cn/video/202.html', '0', '39', '0', '0', '1413360780', '1413360823', '0', '1413360823');
INSERT INTO `video--` VALUES ('203', 'ud_T10XX62c', 'ä¸­ä¼ ä¹‹å­ï¼šå¼ é¢‚', '', 'ä¸­å›½ä¼ åª’å¤§å­¦ç”µè§†å°', '', '', '140', 'http://img01.cuctv.com/M00/50/EB/dNXNClRIdU-nLEZjAAJ11Ju3HZk708.jpg', 'ä¸­ä¼ ä¹‹å­', '', '659725', '0', '20', 'http://www.cuc.edu.cn/video/203.html', '0', '59', '3', '0', '1413360780', '1413360823', '0', '1413360823');
INSERT INTO `video--` VALUES ('204', 'xzrGxazoT6M', 'ä¸­ä¼ ä¹‹å­ï¼šèµµçŽ‰æ˜Ž', '', 'ä¸­å›½ä¼ åª’å¤§å­¦ç”µè§†å°', '', '', '140', 'http://img01.cuctv.com/M00/3F/08/cR9ARlRIdNHYpG95AAJ11DPX6lE055.jpg', 'ä¸­ä¼ ä¹‹å­', '', '643751', '0', '20', 'http://www.cuc.edu.cn/video/204.html', '0', '16', '0', '0', '1413360780', '1413360823', '0', '1413360823');
INSERT INTO `video--` VALUES ('205', 'ajn5t5Ycrdw', 'ä¸­ä¼ ä¹‹å­ï¼šåˆ˜ä¹¦äº®', '', 'ä¸­å›½ä¼ åª’å¤§å­¦ç”µè§†å°', '', '', '140', 'http://img01.cuctv.com/M02/03/AD/dNXNClRIdQOc-0BLAAJ11Ju3HZk477.jpg', 'ä¸­ä¼ ä¹‹å­', '', '1151543', '0', '20', 'http://www.cuc.edu.cn/video/205.html', '0', '40', '0', '0', '1413360780', '1413360823', '0', '1413360823');
INSERT INTO `video--` VALUES ('206', 'Ef6loyFxM-w', 'ä¸­ä¼ ä¹‹å­ï¼šæ›¾å¿—åŽ', '', 'ä¸­å›½ä¼ åª’å¤§å­¦ç”µè§†å°', '', '', '140', 'http://img01.cuctv.com/M02/91/C3/cR9ARlRIdEzIjrdQAAJ11DPX6lE545.jpg', 'ä¸­ä¼ ä¹‹å­', '', '1841900', '0', '20', 'http://www.cuc.edu.cn/video/206.html', '0', '20', '1', '0', '1413360780', '1413360823', '0', '1413360823');
INSERT INTO `video--` VALUES ('207', 'uQ8wAH3ZvNw', '2014å¹´ä¸­å›½ä¼ åª’å¤§å­¦MBAå®žè·µå¯¼å¸ˆè˜ä»»ä»ªå¼', '', 'MBAå­¦é™¢', '', '', '140', 'http://img01.cuctv.com/M00/98/AF/dNXNClRHETS-BBvuAAIUlzFL480854.jpg', 'MBAå­¦é™¢æ™šä¼š', '', '413871', '-3', '20', 'http://www.cuc.edu.cn/video/207.html', '0', '11', '0', '0', '1413943440', '1413943465', '4', '1413943465');
INSERT INTO `video--` VALUES ('208', '152VG4AqQKw', 'ä»¥æ¢¦ä¸ºä¼ å…±èµ¢æœªæ¥â€”â€”ä¸­å›½ä¼ åª’å¤§å­¦MBAå­¦é™¢æˆç«‹äº”å‘¨å¹´æš¨2014', '', 'MBAå­¦é™¢', '', '', '140', 'http://img01.cuctv.com/M00/28/55/cR8oB1RIb4i4hcSFABx_9mKfJGE419.png', 'MBAå­¦é™¢,æ™šä¼š', '', '2865791', '-3', '20', 'http://www.cuc.edu.cn/video/208.html', '0', '26', '0', '0', '1414032240', '1414032267', '0', '1414032267');
INSERT INTO `video--` VALUES ('209', 'QeX9PajycCo', 'ä»¥æ¢¦ä¸ºä¼ å…±èµ¢æœªæ¥â€”â€”ä¸­å›½ä¼ åª’å¤§å­¦MBAå­¦é™¢æˆç«‹äº”å‘¨å¹´æš¨2014', '', 'MBAå­¦é™¢', '', '', '140', 'http://img01.cuctv.com/M01/59/FF/cR9ARlRIbrfv2UtgABx_9mKfJGE289.png', 'MBAå­¦é™¢,æ™šä¼š', '', '3180467', '-3', '20', 'http://www.cuc.edu.cn/video/209.html', '0', '86', '0', '0', '1414032240', '1414032267', '5', '1414032267');
INSERT INTO `video--` VALUES ('210', 'ngY6F48Q2Jc', 'ç¬¬15å±Šé½è¶Šæœ—è¯µè‰ºæœ¯èŠ‚æ€»å†³èµ›(ä¸Š)', '', 'æ’­éŸ³ä¸»æŒè‰ºæœ¯å­¦é™¢', '', '', '140', 'http://img01.cuctv.com/M02/9E/27/dNXNClRJwUrCxPlQAAR726QMUok345.jpg', '15å±Šé½è¶ŠèŠ‚', '', '6900292', '0', '20', 'http://www.cuc.edu.cn/video/210.html', '0', '2593', '805', '1', '1414117980', '1414117995', '0', '1414117995');
INSERT INTO `video--` VALUES ('211', 'Io9pr-pFhjU', 'ç¬¬15å±Šé½è¶Šæœ—è¯µè‰ºæœ¯èŠ‚æ€»å†³èµ›(ä¸‹)', '', 'æ’­éŸ³ä¸»æŒè‰ºæœ¯å­¦é™¢', '', '', '140', 'http://img01.cuctv.com/M01/53/63/cR9ARlRJu9q9lInLAAR727_jAZw959.jpg', '15å±Šé½è¶ŠèŠ‚', '', '8419908', '0', '20', 'http://www.cuc.edu.cn/video/211.html', '0', '1276', '1', '0', '1414117980', '1414117995', '0', '1414117995');
INSERT INTO `video--` VALUES ('212', 't0pzZiOcnFI', 'ä»¥æ¢¦ä¸ºä¼ å…±èµ¢æœªæ¥â€”â€”ä¸­å›½ä¼ åª’å¤§å­¦MBAå­¦é™¢æˆç«‹äº”å‘¨å¹´æš¨2014', '', 'MBAå­¦é™¢', '', '', '140', 'http://img01.cuctv.com/M01/31/91/dNXNClRKDhyZww05ABx_9vkNlMk755.png', 'MBAå­¦é™¢,æ™šä¼š', '', '3180467', '-3', '20', 'http://www.cuc.edu.cn/video/212.html', '0', '0', '0', '0', '1414139340', '1414139371', '0', '1414139371');
INSERT INTO `video--` VALUES ('213', 'NZgmS32FEqs', 'ä»¥æ¢¦ä¸ºä¼ å…±èµ¢æœªæ¥â€”â€”ä¸­å›½ä¼ åª’å¤§å­¦MBAå­¦é™¢æˆç«‹äº”å‘¨å¹´æš¨2014', '', '', '', '', '140', 'http://img01.cuctv.com/M00/94/59/cR9ARlRKFOnIma-fABx_9mKfJGE157.png', 'MBAå­¦é™¢,æ™šä¼š', '', '6045800', '0', '20', 'http://www.cuc.edu.cn/video/213.html', '0', '362', '12', '0', '1414139520', '1414139525', '0', '1414139525');
INSERT INTO `video--` VALUES ('214', 'VkR1Gmeiu58', 'å¤©ç´¢', '', 'è‰ºæœ¯å­¦éƒ¨', '', '', '140', 'http://img01.cuctv.com/M00/CF/15/cR9ARlRNuw7zX69IAAAfyB7wuRQ524-5.jpg', 'å¤§å­¦ç”Ÿç”µè§†èŠ‚', '<p>\r\n	2013ä¸­å›½å¤§å­¦ç”Ÿç”µè§†èŠ‚<span style=\"font-family:SimSun;text-indent:32px;white-space:normal;background-color:#FFFFFF;\">çºªå½•ç‰‡å•å…ƒå…¥å›´ä½œå“ã€‚</span>\r\n</p>\r\n<p>\r\n	<span style=\"font-family:SimSun;text-indent:32px;white-space:normal;background-color:#FFFFFF;\">æŒ‡å¯¼è€å¸ˆï¼šæŽå…´å›½&nbsp;å¯¼æ¼”ï¼šç¨‹æ–‡ å‰¯å¯¼æ¼”ï¼šå¼ è‰³ æ‘„å½±ï¼šè”¡æ° ç¨‹æ–‡ å‰ªè¾‘ï¼šå¼ è‰³</span>\r\n</p>', '1926400', '0', '20', 'http://www.cuc.edu.cn/video/214.html', '0', '47', '0', '0', '1414391040', '1414391053', '0', '1414391053');
INSERT INTO `video--` VALUES ('215', '-5bOlcCccKs', 'ç¬¬15å±Šé½è¶Šæœ—è¯µè‰ºæœ¯èŠ‚åå®¶åç¯‡æœ—è¯µä¼š', '', '', '', '', '140', 'http://img01.cuctv.com/M00/B1/18/cR8oB1RN-IiGA_m2AAFLLbuFVtc298.jpg', 'é½è¶ŠèŠ‚,baiyang001', '', '7443000', '0', '20', 'http://www.cuc.edu.cn/video/215.html', '0', '2057', '33', '0', '1414395960', '1414396017', '0', '1414396017');
INSERT INTO `video--` VALUES ('216', '74W3SXKTo5k', 'å¤æ—¥ç«¥è°£', '', 'è‰ºæœ¯å­¦éƒ¨', '', '', '140', 'http://img01.cuctv.com/M00/D3/85/cR9ARlRN-GnRNWFtAAA_9C_D8Tg713-1.jpg', '2012å¤§å­¦ç”Ÿç”µè§†èŠ‚', '<p>\r\n	<p style=\"white-space:normal;\">\r\n		å‰§æƒ…ç®€ä»‹ï¼šè¿™æ˜¯ä¸€éƒ¨æ‹ç»™ç•™å®ˆå„¿ç«¥çš„ä½œå“ï¼Œæ˜¯ä¸€éƒ¨çœŸæ­£é€‚åˆå­©å­ä»¬è§‚çœ‹çš„è§†å¬ç«¥è¯ã€‚ä¸ºç•™å®ˆå­©å­ç‚¹ç‡ƒæ˜Žå¤©çš„å¸Œæœ›ï¼Œç…§äº®äº²äººçš„è„¸åºžã€‚ä¸è¦è®©ç«¥è¯æ¶ˆå¤±åœ¨è¿™ä¸ªå¤å¤©ï¼Œå†¬å¤©è¿˜è¦ç»§ç»­ã€‚\r\n	</p>\r\n	<p style=\"white-space:normal;\">\r\n		ä¸»è¦å¥–é¡¹ï¼š\r\n	</p>\r\n	<p style=\"white-space:normal;\">\r\n		<span style=\"font-family:SimSun;\">å›½é™…å¤§å­¦ç”Ÿå¾®ç”µå½±ç››å…¸æœ€ä½³äººæ°”å¥–</span>\r\n	</p>\r\n</p>\r\n<p>\r\n	<span style=\"white-space:normal;\"></span><span style=\"white-space:normal;font-family:SimSun;\">ç¬¬å…­å±Šä¸Šæµ·å¤§å­¦ç”Ÿç”µè§†èŠ‚æœ€ä½³å®žéªŒç‰‡å¥–</span>\r\n</p>\r\n<p>\r\n	<span style=\"white-space:normal;\"></span><span style=\"white-space:normal;font-family:SimSun;\">ç¬¬åäºŒå±Š â€œé‡‘ç†ŠçŒ«â€å›½é™…å¤§å­¦ç”Ÿå½±è§†å¥–å®žéªŒç‰‡æœ€ä½³åˆ›æ„å¥–æåå¥–</span><span style=\"white-space:normal;\"></span>\r\n	<p style=\"white-space:normal;\">\r\n		<span style=\"font-family:SimSun;\">ä¸­éŸ©ç”µå½±èŠ‚çŸ­ç‰‡å•å…ƒå‰§æƒ…å•å…ƒæåå¥–</span>\r\n	</p>\r\n	<p style=\"white-space:normal;\">\r\n		å¯¼æ¼”ï¼šçŸ³å¤©æ—­\r\n	</p>\r\n</p>', '439770', '0', '20', 'http://www.cuc.edu.cn/video/216.html', '0', '35', '0', '0', '1414397160', '1414397175', '0', '1414397175');
INSERT INTO `video--` VALUES ('217', '53ZlQ3NdGes', 'ä¸€å¤œæˆå', '', 'è‰ºæœ¯å­¦éƒ¨', '', '', '140', 'http://img01.cuctv.com/M01/58/C5/cR8oB1RO7OSdUsASAAWKb8BSbp8284.png', '2012å¤§å­¦ç”Ÿç”µè§†èŠ‚', '<p>\r\n	è¯¥ç‰‡è£èŽ·2012ä¸­å›½å¤§å­¦ç”Ÿç”µè§†èŠ‚çŸ­ç‰‡ç«žèµ›å•å…ƒäºŒç­‰å¥–ã€‚\r\n</p>\r\n<p>\r\n	ç¼–å‰§ã€å¯¼æ¼”ï¼šæŽå¿—è¶… è‰ºæœ¯æŒ‡å¯¼ï¼šæ¸¸é£ž&nbsp;\r\n</p>', '1578455', '0', '20', 'http://www.cuc.edu.cn/video/217.html', '0', '120', '0', '0', '1414457460', '1414457514', '0', '1414457514');
INSERT INTO `video--` VALUES ('218', '38DMZxKljFU', 'äº‘ä¸Šä½›ç«¥', '', 'è‰ºæœ¯å­¦éƒ¨', '', '', '140', 'http://img01.cuctv.com/M01/64/ED/cR8oB1RO9jCRP1LQAAPPJtrgJHA215.jpg', '2012å¤§å­¦ç”Ÿç”µè§†èŠ‚', '<p>\r\n	æ­¤ç‰‡è£èŽ·2012å¹´ä¸­å›½å¤§å­¦ç”Ÿç”µè§†èŠ‚çºªå½•ç‰‡å•å…ƒé‡‘å¥–ã€‚\r\n</p>\r\n<p>\r\n	å¯¼æ¼”ï¼šè”¡æ° åˆ¶ç‰‡ã€å‰¯å¯¼æ¼”ï¼šç¨‹æ–‡ æ‘„å½±ï¼šè”¡æ° é’Ÿæ™“çŽ® ç¨‹æ–‡ å½•éŸ³ï¼šç¨‹æ–‡ é’Ÿæ™“çŽ® å‰ªè¾‘ï¼šè”¡æ° ç¨‹æ–‡ æŒ‡å¯¼è€å¸ˆï¼šæŽå…´å›½\r\n</p>\r\n<p>\r\n	<br />\r\n</p>', '1693535', '0', '20', 'http://www.cuc.edu.cn/video/218.html', '0', '1696', '0', '0', '1414457460', '1414457514', '0', '1414457514');
INSERT INTO `video--` VALUES ('219', 'vMyMzfbONjc', 'ä¸­å›½ä¼ åª’å¤§å­¦é©¬æ‹‰æ¾æ—¥è®°', '', '', '', '', '140', 'http://img01.cuctv.com/M01/59/09/cR9ARlROCM3ciUivAABYjoZ0wG8561-6.jpg', '2012å¤§å­¦ç”Ÿç”µè§†èŠ‚', '', '962267', '-1', '20', 'http://www.cuc.edu.cn/video/219.html', '0', '0', '0', '0', '1414457460', '1414457514', '0', '1414457514');
INSERT INTO `video--` VALUES ('220', 'hdnqthnhMZ4', 'äº‘ä¸Šä½›ç«¥', '', 'è‰ºæœ¯å­¦éƒ¨', '', '', '140', 'http://img01.cuctv.com/M02/D8/C3/dNXNClRO99Po6XAtAAPPJtrUPdI912.jpg', '2012å¤§å­¦ç”Ÿç”µè§†èŠ‚', '<p>\r\n	è¯¥ç‰‡è£èŽ·2012å¹´ä¸­å›½å¤§å­¦ç”Ÿç”µè§†èŠ‚çºªå½•ç‰‡å•å…ƒé‡‘å¥–ã€‚\r\n</p>\r\n<p>\r\n	å¯¼æ¼”ï¼šè”¡æ° åˆ¶ç‰‡ã€å‰¯å¯¼æ¼”ï¼šç¨‹æ–‡ æŒ‡å¯¼è€å¸ˆï¼šæŽå…´å›½\r\n</p>', '1693535', '-3', '20', 'http://www.cuc.edu.cn/video/220.html', '0', '0', '0', '0', '1414457460', '1414457514', '0', '1414457514');
INSERT INTO `video--` VALUES ('221', 'ocUcBH2sn1M', 'å°é©¬è¿‡æ²³', '', 'è‰ºæœ¯å­¦éƒ¨', '', 'è‚–å›é€¸ å¼ é›ªè•Š', '151', 'http://img01.cuctv.com/M00/20/ED/cR9ARlRPHRXguQH2AABUwq0fUmM013.jpg', 'ç¬¬ä¹å±Šä¸­å›½ï¼ˆåŒ—äº¬ï¼‰å›½é™…å¤§å­¦ç”ŸåŠ¨ç”»èŠ', 'ç¬¬ä¹å±Šä¸­å›½ï¼ˆåŒ—äº¬ï¼‰å›½é™…å¤§å­¦ç”ŸåŠ¨ç”»èŠ‚ ç™½æ¨å¥–å…¥å›´ä½œå“', '138495', '-3', '20', 'http://www.cuc.edu.cn/dongman/221.html', '0', '31', '0', '0', '1414471680', '1414471695', '0', '1414471695');
INSERT INTO `video--` VALUES ('222', 'TZXaJP0-FhI', 'å¿ƒå¢ƒ Mood Infection', '', 'è‰ºæœ¯å­¦éƒ¨', '', 'æŽå†°æ¸… ä½•ç››æº', '151', 'http://img01.cuctv.com/M02/05/71/cR8oB1RPKpz657aAAAInZwGyBmk571.jpg', 'ç¬¬ä¹å±Šä¸­å›½ï¼ˆåŒ—äº¬ï¼‰å›½é™…å¤§å­¦ç”ŸåŠ¨ç”»èŠ', '<p>\r\n	æœ¬ç‰‡è£èŽ·ç¬¬ä¹å±Šä¸­å›½ï¼ˆåŒ—äº¬ï¼‰å›½é™…å¤§å­¦ç”ŸåŠ¨ç”»èŠ‚æœ€ä½³åŠ¨ç”»è§†è§‰é£Žæ ¼å¥– Best Art Design Awardã€‚\r\n</p>\r\n<p>\r\n	<br />\r\n</p>', '174600', '0', '20', 'http://www.cuc.edu.cn/dongman/222.html', '0', '2583', '2', '0', '1414471680', '1414471695', '0', '1414471695');
INSERT INTO `video--` VALUES ('223', 'SGGQspY2RLE', 'ä¸­å›½ä¼ åª’å¤§å­¦--åŠ¨ï¼Œä¸åŠ¨å°±', '', '', '', '', '140', 'http://img01.cuctv.com/M01/BA/B7/cR8oB1ROBOv4AYhXAABOaxdyuqg455.jpg', '2012å¤§å­¦ç”Ÿç”µè§†èŠ‚', '', '783267', '-1', '20', 'http://www.cuc.edu.cn/video/223.html', '0', '0', '0', '0', '1414473840', '1414473861', '0', '1414473861');
INSERT INTO `video--` VALUES ('224', 'GdpOwfdH2zU', 'é‡å¤§çš„æŠ‰æ‹©ä¹‹åšæŒºçš„é’æ˜¥A Fatal Decision-Forever Young', '', 'è‰ºæœ¯å­¦éƒ¨', '', '', '151', 'http://img01.cuctv.com/M00/D6/C7/dNXNClRRidnfGahLABJh_OGMDHM182.png', 'ç¬¬ä¹å±Šä¸­å›½ï¼ˆåŒ—äº¬ï¼‰å›½é™…å¤§å­¦ç”ŸåŠ¨ç”»èŠ', 'ç¬¬ä¹å±Šä¸­å›½ï¼ˆåŒ—äº¬ï¼‰å›½é™…å¤§å­¦ç”ŸåŠ¨ç”»èŠ‚ ç™½æ¨å¥–å…¥å›´ä½œå“', '253000', '0', '20', 'http://www.cuc.edu.cn/dongman/224.html', '0', '69', '0', '0', '1414629720', '1414629768', '0', '1414629768');
INSERT INTO `video--` VALUES ('225', 'oyyenakybNI', 'ã€ç­é‰´ã€‘2006æ’­éŸ³åŒå­¦ä½', '', 'æ’­éŸ³ä¸Žä¸»æŒå­¦é™¢', '', '', '166', 'http://img01.cuctv.com/M00/52/9D/dNXNClRV7_Ho3pHjAADw852INUI480.jpg', 'æ ¡å›­,mv,æ¯•ä¸šå­£,baiyang001', 'ã€ç­é‰´ã€‘2006æ’­éŸ³åŒå­¦ä½', '990467', '0', '20', 'http://www.cuc.edu.cn/bjzl/225.html', '0', '68', '0', '0', '1414918020', '1414918026', '0', '1414918026');
INSERT INTO `video--` VALUES ('226', '9vA2Nj-eRjo', 'åˆ˜è·ƒè¿›-åŽ†å²ä¸ŽçŽ°å®žä¹‹é—´çš„ç»å…¸ç ”è¯»(ä¸‹)', '', '', '', '', '198', 'http://img01.cuctv.com/M00/CC/80/cR9ARlRWDF7oUhoTAABHBrHEuqk861.jpg', 'åˆ˜è·ƒè¿›-åŽ†å²ä¸ŽçŽ°å®žä¹‹é—´çš„ç»å…¸ç ”è¯»(ä¸‹', 'åˆ˜è·ƒè¿›-åŽ†å²ä¸ŽçŽ°å®žä¹‹é—´çš„ç»å…¸ç ”è¯»(ä¸‹)', '2809334', '-1', '20', 'http://www.cuc.edu.cn/jpkc/226.html', '0', '0', '0', '0', '1414978020', '1414978060', '0', '1414978060');
INSERT INTO `video--` VALUES ('227', 'kFQcCSdvHW4', 'åˆ˜è·ƒè¿›-åŽ†å²ä¸ŽçŽ°å®žä¹‹é—´çš„ç»å…¸ç ”è¯»(ä¸Š)', '', '', '', '', '198', 'http://img01.cuctv.com/M00/76/D5/cR9ARlRWDWbudxZpAABNMQCFKVo009.jpg', 'åˆ˜è·ƒè¿›-åŽ†å²ä¸ŽçŽ°å®žä¹‹é—´çš„ç»å…¸ç ”è¯»,bai', 'åˆ˜è·ƒè¿›-åŽ†å²ä¸ŽçŽ°å®žä¹‹é—´çš„ç»å…¸ç ”è¯»', '3208534', '-1', '20', 'http://www.cuc.edu.cn/jpkc/227.html', '0', '0', '0', '0', '1414978020', '1414978060', '1', '1414978060');
INSERT INTO `video--` VALUES ('228', 'hUWF7j7uULo', 'è¸¢è¸æ— å£°', '', '', '', '', '140', 'http://img01.cuctv.com/M02/BF/61/dNXNClRaIWbmLDNBAANXArrp6fQ966.jpg', 'çºªå½•ç‰‡,è¸¢è¸èˆž', '<p>\r\n	<span style=\"font-family:SimSun;\">&nbsp;è¿™æ˜¯ä¸€ç¾¤è‹ç«¥çš„æˆé•¿æ•…äº‹ï¼Œä»–ä»¬åœ¨æ— å£°çš„ä¸–ç•Œé‡Œç»˜ç”»ã€æœ—è¯µã€è·³èˆžâ€¦â€¦ç”¨è‡ªèº«çš„çµæ€§å’Œè€æ€§è®©ç”Ÿå‘½å˜å¾—ä¸°å¯Œè€Œå¤šå½©ï¼Œåšå‡ºå¯¹å‘½è¿æœ€æœ‰åŠ›çš„å›žå“ï¼Œè¿™å°±æ˜¯æˆ‘æ ¡æ–°é—»ä¼ æ’­å­¦éƒ¨å‰¯æ•™æŽˆåˆ˜åšæ‰§å¯¼çš„çºªå½•ç‰‡ã€Šè¸¢è¸æ— å£°ã€‹ä¸­æ‰€è¦è®²è¿°çš„æ•…äº‹ã€‚2014å¹´11æœˆ7æ—¥è‡³8æ—¥ï¼Œè¿™éƒ¨çºªå½•ç‰‡å°†åœ¨ä¸­å¤®ç”µè§†å°çºªå½•ç‰‡é¢‘é“é‡æ’­ï¼Œçºªå½•ç‰‡å¯¼æ¼”é˜Žæ˜¥æ¥è¯„ä»·å®ƒâ€œå±•çŽ°äº†ä¸€ä¸ªä¸ªå¹¼å°çš„å¿ƒçµåƒæ˜¥ç¬‹ä¸€æ ·åœ¨æ— å£°çš„ä¸–ç•Œé‡Œæˆé•¿â€ã€‚</span> \r\n</p>\r\n<p>\r\n	<span style=\"line-height:2;\">&nbsp;</span><span style=\"font-family:SimSun;line-height:2;\">æœ¬ç‰‡å¯¼æ¼”åˆ˜åšç³»æ–°é—»ä¼ æ’­å­¦éƒ¨å‰¯æ•™æŽˆã€‚</span> \r\n</p>', '2734934', '0', '20', 'http://www.cuc.edu.cn/video/228.html', '0', '1178', '0', '0', '1415177940', '1415177943', '0', '1415177943');
INSERT INTO `video--` VALUES ('229', 'FWUjPqWbc9g', 'ä¸­å¤–å½±è§†äº¤å“éŸ³ä¹ä¼šï¼ˆä¸Šï¼‰', '', 'è‰ºæœ¯å­¦éƒ¨', '', '', '140', 'http://img01.cuctv.com/M02/1C/91/cR9ARlRawGqQwwgTAAD4FY3jCr8446.jpg', 'æ ¡åº†,ä¸­å›½ä¼ åª’å¤§å­¦äº¤å“ä¹å›¢', '<p>\r\n	<span style=\"color:#333333;font-family:å®‹ä½“, Tahoma, Helvetica, Arial, sans-serif;text-indent:32px;white-space:normal;\"><span style=\"color:#333333;font-family:å®‹ä½“, Tahoma, Helvetica, Arial, sans-serif;text-indent:32px;white-space:normal;\"><span style=\"line-height:2;\">&nbsp;2014å¹´</span><span style=\"line-height:2;\">9æœˆ24æ—¥æ™šï¼Œåº†ç¥æˆ‘æ ¡å»ºæ ¡60å‘¨å¹´ã€Šä¸­å¤–å½±è§†äº¤å“éŸ³ä¹ä¼šã€‹åœ¨ç»¼åˆå®žéªŒæ¥¼1500äººæŠ¥å‘ŠåŽ…ç²¾å½©ä¸Šæ¼”ã€‚</span></span><span style=\"line-height:2;\"></span><br />\r\n</span> \r\n</p>\r\n<p>\r\n	<span style=\"color:#333333;font-family:å®‹ä½“, Tahoma, Helvetica, Arial, sans-serif;text-indent:32px;white-space:normal;\"><span style=\"line-height:2;\">&nbsp;</span><span style=\"line-height:2;\">éŸ³ä¹ä¼šç”±æˆ‘å›½è‘—åæŒ‡æŒ¥å®¶æ´ªä¾ å¥³å£«æ‹…ä»»æŒ‡æŒ¥ã€‚ä¸ŠåŠåœºï¼Œäº¤å“ä¹å›¢æ¼”å¥äº†ã€Šçº¢è‰²å¨˜å­å†›ã€‹ã€ã€Šç™½æ¯›å¥³ã€‹ç­‰å¤šéƒ¨ä¸­å›½ç»å…¸ç”µå½±ä½œå“éŸ³ä¹ï¼Œå¹¶é‚€è¯·ç©ºæ”¿æ–‡å·¥å›¢å¥³é«˜éŸ³æ­Œå”±å®¶ä¼Šæ³“è¿œã€äºŒç‚®æ–‡å·¥å›¢å¥³é«˜éŸ³æ­Œå”±å®¶çŽ‹å–†ä»¥åŠä¸­å›½å¹¿æ’­è‰ºæœ¯å›¢ç”·é«˜éŸ³æ­Œå”±å®¶è–›æµ©åž ä¸Žäº¤å“ä¹å›¢åˆä½œï¼Œæ¼”å”±äº†ã€Šæˆ‘çš„ç¥–å›½ã€‹ã€ã€Šè‹±é›„èµžæ­Œã€‹ã€ã€Šæ€€å¿µæˆ˜å‹ã€‹ç­‰è€ä¸€è¾ˆè§‚ä¼—å°¤ä¸ºè€³ç†Ÿèƒ½è¯¦çš„ç”µå½±æ’æ›²ï¼Œå°†è§‚ä¼—é‡æ–°å¸¦å›žäº†æ·±å…·æ—¶ä»£çƒ™å°çš„éŽé‡‘å²æœˆã€‚ä¸‹åŠåœºï¼ŒéŸ³ä¹ä¼šé€‰å–çš„æ˜¯ç»å…¸çš„å¤–å›½ä½œå“ï¼Œæ¼”å¥äº†ã€Šæ­Œå‰§é™¢é­…å½±ã€‹ã€ã€ŠETå¤–æ˜Ÿäººã€‹ã€ã€ŠåŠ å‹’æ¯”æµ·ç›—ã€‹ç­‰æžå¯Œè§†è§‰ä¸Žå¬è§‰å†²å‡»åŠ›çš„ç»å…¸å¤§ç‰‡åŽŸå£°éŸ³ä¹ã€‚</span></span> \r\n</p>', '3222667', '-3', '-20', 'http://www.cuc.edu.cn/video/229.html', '0', '1', '0', '0', '1415233620', '1415233622', '0', '1415233622');
INSERT INTO `video--` VALUES ('230', '2818oiHlELY', 'ä¸­å¤–å½±è§†äº¤å“éŸ³ä¹ä¼šï¼ˆä¸‹ï¼‰', '', 'è‰ºæœ¯å­¦éƒ¨è‰ºæœ¯æ•™è‚²ä¸­å¿ƒ', '', '', '140', 'http://img01.cuctv.com/M02/F3/35/cR8oB1RbEU7dHkIZAAD4FY3jCr8024.jpg', 'æ ¡åº†,ä¸­å›½ä¼ åª’å¤§å­¦äº¤å“ä¹å›¢', '<p style=\"white-space:normal;\">\r\n	<span style=\"color:#333333;font-family:å®‹ä½“, Tahoma, Helvetica, Arial, sans-serif;text-indent:32px;\"><span style=\"line-height:2;\">&nbsp;2014å¹´</span><span style=\"line-height:2;\">9æœˆ24æ—¥æ™šï¼Œåº†ç¥æˆ‘æ ¡å»ºæ ¡60å‘¨å¹´ã€Šä¸­å¤–å½±è§†äº¤å“éŸ³ä¹ä¼šã€‹åœ¨ç»¼åˆå®žéªŒæ¥¼1500äººæŠ¥å‘ŠåŽ…ç²¾å½©ä¸Šæ¼”ã€‚</span></span><span style=\"line-height:2;color:#333333;font-family:å®‹ä½“, Tahoma, Helvetica, Arial, sans-serif;text-indent:32px;\">éŸ³ä¹ä¼šç”±æˆ‘å›½è‘—åæŒ‡æŒ¥å®¶æ´ªä¾ å¥³å£«æ‹…ä»»æŒ‡æŒ¥ã€‚ä¸ŠåŠåœºï¼Œäº¤å“ä¹å›¢æ¼”å¥äº†ã€Šçº¢è‰²å¨˜å­å†›ã€‹ã€ã€Šç™½æ¯›å¥³ã€‹ç­‰å¤šéƒ¨ä¸­å›½ç»å…¸ç”µå½±ä½œå“éŸ³ä¹ï¼Œå¹¶é‚€è¯·ç©ºæ”¿æ–‡å·¥å›¢å¥³é«˜éŸ³æ­Œå”±å®¶ä¼Šæ³“è¿œã€äºŒç‚®æ–‡å·¥å›¢å¥³é«˜éŸ³æ­Œå”±å®¶çŽ‹å–†ä»¥åŠä¸­å›½å¹¿æ’­è‰ºæœ¯å›¢ç”·é«˜éŸ³æ­Œå”±å®¶è–›æµ©åž ä¸Žäº¤å“ä¹å›¢åˆä½œï¼Œæ¼”å”±äº†ã€Šæˆ‘çš„ç¥–å›½ã€‹ã€ã€Šè‹±é›„èµžæ­Œã€‹ã€ã€Šæ€€å¿µæˆ˜å‹ã€‹ç­‰è€ä¸€è¾ˆè§‚ä¼—å°¤ä¸ºè€³ç†Ÿèƒ½è¯¦çš„ç”µå½±æ’æ›²ï¼Œå°†è§‚ä¼—é‡æ–°å¸¦å›žäº†æ·±å…·æ—¶ä»£çƒ™å°çš„éŽé‡‘å²æœˆã€‚ä¸‹åŠåœºï¼ŒéŸ³ä¹ä¼šé€‰å–çš„æ˜¯ç»å…¸çš„å¤–å›½ä½œå“ï¼Œæ¼”å¥äº†ã€Šæ­Œå‰§é™¢é­…å½±ã€‹ã€ã€ŠETå¤–æ˜Ÿäººã€‹ã€ã€ŠåŠ å‹’æ¯”æµ·ç›—ã€‹ç­‰æžå¯Œè§†è§‰ä¸Žå¬è§‰å†²å‡»åŠ›çš„ç»å…¸å¤§ç‰‡åŽŸå£°éŸ³ä¹ã€‚</span> \r\n</p>', '3674000', '0', '20', 'http://www.cuc.edu.cn/video/230.html', '0', '1109', '3', '0', '1415239920', '1415239925', '1', '1415239925');
INSERT INTO `video--` VALUES ('231', 'Z-3mFoL7AxY', 'ä¸­å¤–å½±è§†äº¤å“éŸ³ä¹ä¼šï¼ˆä¸Šï¼‰', '', 'è‰ºæœ¯å­¦éƒ¨è‰ºæœ¯æ•™è‚²ä¸­å¿ƒ', '', '', '140', 'http://img01.cuctv.com/M02/90/CB/dNXNClRbETKNsomqAAD4Fb8JsgY704.jpg', 'æ ¡åº†,ä¸­å›½ä¼ åª’å¤§å­¦äº¤å“ä¹å›¢', '<p style=\"white-space:normal;\">\r\n	<span style=\"color:#333333;font-family:å®‹ä½“, Tahoma, Helvetica, Arial, sans-serif;text-indent:32px;\"><span style=\"line-height:2;\">&nbsp;2014å¹´</span><span style=\"line-height:2;\">9æœˆ24æ—¥æ™šï¼Œåº†ç¥æˆ‘æ ¡å»ºæ ¡60å‘¨å¹´ã€Šä¸­å¤–å½±è§†äº¤å“éŸ³ä¹ä¼šã€‹åœ¨ç»¼åˆå®žéªŒæ¥¼1500äººæŠ¥å‘ŠåŽ…ç²¾å½©ä¸Šæ¼”ã€‚</span></span><span style=\"color:#333333;font-family:å®‹ä½“, Tahoma, Helvetica, Arial, sans-serif;text-indent:32px;line-height:2;\">éŸ³ä¹ä¼šç”±æˆ‘å›½è‘—åæŒ‡æŒ¥å®¶æ´ªä¾ å¥³å£«æ‹…ä»»æŒ‡æŒ¥ã€‚ä¸ŠåŠåœºï¼Œäº¤å“ä¹å›¢æ¼”å¥äº†ã€Šçº¢è‰²å¨˜å­å†›ã€‹ã€ã€Šç™½æ¯›å¥³ã€‹ç­‰å¤šéƒ¨ä¸­å›½ç»å…¸ç”µå½±ä½œå“éŸ³ä¹ï¼Œå¹¶é‚€è¯·ç©ºæ”¿æ–‡å·¥å›¢å¥³é«˜éŸ³æ­Œå”±å®¶ä¼Šæ³“è¿œã€äºŒç‚®æ–‡å·¥å›¢å¥³é«˜éŸ³æ­Œå”±å®¶çŽ‹å–†ä»¥åŠä¸­å›½å¹¿æ’­è‰ºæœ¯å›¢ç”·é«˜éŸ³æ­Œå”±å®¶è–›æµ©åž ä¸Žäº¤å“ä¹å›¢åˆä½œï¼Œæ¼”å”±äº†ã€Šæˆ‘çš„ç¥–å›½ã€‹ã€ã€Šè‹±é›„èµžæ­Œã€‹ã€ã€Šæ€€å¿µæˆ˜å‹ã€‹ç­‰è€ä¸€è¾ˆè§‚ä¼—å°¤ä¸ºè€³ç†Ÿèƒ½è¯¦çš„ç”µå½±æ’æ›²ï¼Œå°†è§‚ä¼—é‡æ–°å¸¦å›žäº†æ·±å…·æ—¶ä»£çƒ™å°çš„éŽé‡‘å²æœˆã€‚ä¸‹åŠåœºï¼ŒéŸ³ä¹ä¼šé€‰å–çš„æ˜¯ç»å…¸çš„å¤–å›½ä½œå“ï¼Œæ¼”å¥äº†ã€Šæ­Œå‰§é™¢é­…å½±ã€‹ã€ã€ŠETå¤–æ˜Ÿäººã€‹ã€ã€ŠåŠ å‹’æ¯”æµ·ç›—ã€‹ç­‰æžå¯Œè§†è§‰ä¸Žå¬è§‰å†²å‡»åŠ›çš„ç»å…¸å¤§ç‰‡åŽŸå£°éŸ³ä¹ã€‚</span> \r\n</p>', '3282031', '0', '20', 'http://www.cuc.edu.cn/video/231.html', '0', '2644', '0', '0', '1415254020', '1415254076', '2', '1415254076');
INSERT INTO `video--` VALUES ('232', 'C1ReqXY4bZ8', 'ç¬¬ä¹å±Šä¸­å›½ï¼ˆåŒ—äº¬ï¼‰å›½é™…å¤§å­¦ç”ŸåŠ¨ç”»èŠ‚é—­å¹•å¼æš¨é¢å¥–å…¸ç¤¼ï¼ˆä¸', '', 'è‰ºæœ¯å­¦éƒ¨', '', '', '140', 'http://img01.cuctv.com/M01/AB/8D/dNXNClRlTzf3JRgxAAvVQWYeg68918.png', 'åŠ¨ç”»èŠ‚', '', '3016534', '0', '20', 'http://www.cuc.edu.cn/video/232.html', '0', '2564', '0', '0', '1415925360', '1415925376', '4', '1415925376');
INSERT INTO `video--` VALUES ('233', 'OCP7oFdg5o8', '2014ä¸­å›½éŸ³ä¹äº§ä¸šå‘å±•æŠ¥å‘ŠäºŽ11æœˆ6æ—¥å‡ºç‚‰', '', 'è‰ºæœ¯å­¦éƒ¨', '', '', '140', 'http://img01.cuctv.com/M01/2C/17/cR9ARlRlTMycE1NjAABu3LDSANA595.jpg', 'éŸ³ä¹äº§ä¸šå‘å±•æŠ¥å‘Š', '', '77334', '-1', '20', 'http://www.cuc.edu.cn/video/233.html', '0', '0', '0', '0', '1415927100', '1415927159', '0', '1415927159');
INSERT INTO `video--` VALUES ('234', 'Kah-HcejLQw', 'ç¬¬ä¹å±Šä¸­å›½ï¼ˆåŒ—äº¬ï¼‰å›½é™…å¤§å­¦ç”ŸåŠ¨ç”»èŠ‚é—­å¹•å¼æš¨é¢å¥–å…¸ç¤¼ï¼ˆä¸', '', '', '', '', '140', 'http://img01.cuctv.com/M01/21/B5/cR8oB1RlYYSYNDyYAAvVQaD_J_Q887.png', 'åŠ¨ç”»èŠ‚', '', '2074600', '0', '20', 'http://www.cuc.edu.cn/video/234.html', '0', '872', '48', '0', '1415930220', '1415930225', '3', '1415930225');
INSERT INTO `video--` VALUES ('235', 'HojQv1igKJ0', 'ã€ç­é‰´ã€‘2012æ’­éŸ³åŒå­¦ä½', '', '', '', '', '166', 'http://img01.cuctv.com/M01/B2/C7/dNXNClRm37KF0MT7AAChPAitSN4871.jpg', 'æ ¡å›­,mv,æ¯•ä¸šå­£,baiyang001', 'ã€ç­é‰´ã€‘2012æ’­éŸ³åŒå­¦ä½', '692934', '-1', '20', 'http://www.cuc.edu.cn/bjzl/235.html', '0', '0', '0', '0', '1416027960', '1416028001', '0', '1416028001');
INSERT INTO `video--` VALUES ('236', 'HojQv1igKJ0', 'ã€ç­é‰´ã€‘2012æ’­éŸ³ä¸»æŒäºŒå­¦ä½', '', '', '', '', '166', 'http://img01.cuctv.com/M01/9F/84/cR9ARlRnDSayoInMAAChPP3j7jA862.jpg', 'æ ¡å›­,mv,æ¯•ä¸šå­£,baiyang001', 'ã€ç­é‰´ã€‘2012æ’­éŸ³ä¸»æŒäºŒå­¦ä½', '692934', '0', '20', 'http://www.cuc.edu.cn/bjzl/236.html', '0', '49', '0', '0', '1416039600', '1416039650', '0', '1416039650');
INSERT INTO `video--` VALUES ('237', 'b0ur-D_ClzY', 'ä¸­ä¼ 60å‘¨å¹´æ ¡åº†æ™šä¼šç²¾ç¼–å­—å¹•ç‰ˆ1', '', '', '', '', '140', 'http://img01.cuctv.com/M01/4B/31/cR9ARlRnLVO4t4XjAABT5JYgwT4054.jpg', 'ä¸­ä¼ 60å‘¨å¹´æ ¡åº†æ™šä¼šç²¾ç¼–å­—å¹•ç‰ˆ,baiyang0', 'ä¸­ä¼ 60å‘¨å¹´æ ¡åº†æ™šä¼šç²¾ç¼–å­—å¹•ç‰ˆ', '3208000', '0', '20', 'http://www.cuc.edu.cn/video/237.html', '0', '112', '0', '0', '1416183720', '1416183757', '0', '1416183757');
INSERT INTO `video--` VALUES ('238', 'qEWsatvk99Q', 'ä¸­ä¼ 60å‘¨å¹´æ ¡åº†æ™šä¼šç²¾ç¼–å­—å¹•ç‰ˆ2', '', '', '', '', '140', 'http://img01.cuctv.com/M02/FE/F4/cR9ARlRnNvjNs51fAABgVj11RmE094.jpg', 'ä¸­å›½ä¼ åª’å¤§å­¦60å‘¨å¹´æ ¡åº†æ™šä¼šç²¾ç¼–å­—å¹•', 'ä¸­å›½ä¼ åª’å¤§å­¦60å‘¨å¹´æ ¡åº†æ™šä¼šç²¾ç¼–å­—å¹•ç‰ˆ', '2978334', '0', '20', 'http://www.cuc.edu.cn/video/238.html', '0', '33', '1', '0', '1416183720', '1416183757', '0', '1416183757');
INSERT INTO `video--` VALUES ('239', 'ubqekGEJGSc', 'ä¸­ä¼ 60å‘¨å¹´æ ¡åº†æ™šä¼šç²¾ç¼–å­—å¹•ç‰ˆ3', '', '', '', '', '140', 'http://img01.cuctv.com/M02/D3/C8/cR9ARlRnRCy5ie2EAABCjbeL5jM600-2.jpg', 'ä¸­å›½ä¼ åª’å¤§å­¦60å‘¨å¹´æ ¡åº†æ™šä¼šç²¾ç¼–å­—å¹•', 'ä¸­å›½ä¼ åª’å¤§å­¦60å‘¨å¹´æ ¡åº†æ™šä¼šç²¾ç¼–å­—å¹•ç‰ˆ', '2994934', '0', '20', 'http://www.cuc.edu.cn/video/239.html', '0', '36', '0', '0', '1416183720', '1416183757', '0', '1416183757');
INSERT INTO `video--` VALUES ('240', 'hozprd0Hhf0', 'ä¸­ä¼ 60å‘¨å¹´æ ¡åº†æ™šä¼šç²¾ç¼–å­—å¹•ç‰ˆ4', '', '', '', '', '140', 'http://img01.cuctv.com/M02/0E/45/cR9ARlRob6Pf8aKZAAA-dgLy9m8367.jpg', 'ä¸­å›½ä¼ åª’å¤§å­¦60å‘¨å¹´æ ¡åº†æ™šä¼šç²¾ç¼–å­—å¹•', 'ä¸­å›½ä¼ åª’å¤§å­¦60å‘¨å¹´æ ¡åº†æ™šä¼šç²¾ç¼–å­—å¹•ç‰ˆ', '2892734', '0', '20', 'http://www.cuc.edu.cn/video/240.html', '0', '41', '0', '0', '1416183720', '1416183757', '0', '1416183757');
INSERT INTO `video--` VALUES ('241', '4-kRf_v1Ht4', 'ä¸­ä¼ 60å‘¨å¹´æ ¡åº†æ™šä¼šç²¾ç¼–å­—å¹•ç‰ˆ5', '', '', '', '', '140', 'http://img01.cuctv.com/M02/0A/99/cR9ARlRoeAmbDjyZAABoIhp-0Ik867-2.jpg', 'ä¸­å›½ä¼ åª’å¤§å­¦60å‘¨å¹´æ ¡åº†æ™šä¼šç²¾ç¼–å­—å¹•', 'ä¸­å›½ä¼ åª’å¤§å­¦60å‘¨å¹´æ ¡åº†æ™šä¼šç²¾ç¼–å­—å¹•ç‰ˆ', '3985534', '0', '20', 'http://www.cuc.edu.cn/video/241.html', '0', '24', '0', '0', '1416183720', '1416183757', '0', '1416183757');
INSERT INTO `video--` VALUES ('242', 'yq6R5ri-WAc', 'ä¸­ä¼ 60å‘¨å¹´æ ¡åº†å…¸ç¤¼ç²¾ç¼–å­—å¹•ç‰ˆ', '', '', '', '', '140', 'http://img01.cuctv.com/M00/24/C7/cR9ARlRoeOfB2S-uAAB1ZA6F_Kg132.jpg', 'ä¸­å›½ä¼ åª’å¤§å­¦60å‘¨å¹´æ ¡åº†å…¸ç¤¼ç²¾ç¼–å­—å¹•', 'ä¸­å›½ä¼ åª’å¤§å­¦60å‘¨å¹´æ ¡åº†å…¸ç¤¼ç²¾ç¼–å­—å¹•ç‰ˆ', '2420934', '0', '20', 'http://www.cuc.edu.cn/video/242.html', '0', '104', '0', '0', '1416183720', '1416183757', '0', '1416183757');
INSERT INTO `video--` VALUES ('243', 'uIDnOEXuMBE', 'å¾é¡ºä½œã€Šä¸­å›½ä¼ åª’å¤§å­¦2010å±Šæ¯•ä¸šé‰´â€”â€”è®°å¿†Â·å››å¹´ã€‹', '', '', '', '', '140', 'http://img01.cuctv.com/M00/D4/53/cR9ARlRq9hz3_7K0AABGuiwB82w368.jpg', '2010å±Šæ¯•ä¸šé‰´,baiyang001', '', '819800', '-3', '20', '', '0', '0', '0', '0', '1416298013', '1416298013', '0', '1416298013');
INSERT INTO `video--` VALUES ('244', 'I0HFqF8hWpk', 'å¯»æ‰¾æœ€ç¾Žæ­Œå£°', '', 'æ–°é—»ä¼ æ’­å­¦éƒ¨', '', '', '140', 'http://img01.cuctv.com/M00/56/B1/dNXNClRrAki45YDXACRj_sBizkk877.png', 'å¯»æ‰¾æœ€ç¾Žæ­Œå£°', '', '1122549', '0', '20', 'http://www.cuc.edu.cn/video/244.html', '0', '14', '0', '0', '1416297960', '1416298013', '0', '1416298013');
INSERT INTO `video--` VALUES ('245', 'RH3dFzwW66A', 'ä¸­å›½ä¼ åª’å¤§å­¦2014çº§æ–°ç”Ÿå†›è®­ç»“ä¸šå…¸ç¤¼çºªå®ž', '', 'å­¦ç”Ÿå·¥ä½œéƒ¨', '', '', '140', 'http://img01.cuctv.com/M01/DD/2D/cR9ARlRsVSTBUjg4AAuxwLczpxg023.jpg', '2014çº§æ–°ç”Ÿå†›è®­ç»“ä¸šå…¸ç¤¼', '', '953467', '0', '20', 'http://www.cuc.edu.cn/video/245.html', '0', '2118', '1', '0', '1416384960', '1416384986', '5', '1416384986');
INSERT INTO `video--` VALUES ('246', 'uIDnOEXuMBE', 'å¾é¡ºä½œã€Šä¸­å›½ä¼ åª’å¤§å­¦2010å±Šæ¯•ä¸šé‰´â€”â€”è®°å¿†Â·å››å¹´ã€‹', '', '', '', '', '166', 'http://img01.cuctv.com/M00/D4/53/cR9ARlRq9hz3_7K0AABGuiwB82w368.jpg', '2010å±Šæ¯•ä¸šé‰´,baiyang001', '', '819800', '-1', '20', '', '0', '0', '0', '0', '1416466045', '1416466045', '0', '1416466045');
INSERT INTO `video--` VALUES ('247', 'Zp8VbEaczMg', 'ã€æ–°é—»çºªå½•ç‰‡ã€‘é€ ä¸­å›½æ–°é—»å¥–ä¸‰ç­‰å¥–', '', 'æ–°é—»ä¼ æ’­å­¦éƒ¨', '', '', '140', 'http://img01.cuctv.com/M01/43/15/cR9ARlRujRPvYt8AAALUZMnDqko770.jpg', 'ä¸­å›½æ–°é—»å¥–', '<p>\r\n	<span style=\"color:#333333;font-family:å®‹ä½“, Tahoma, Helvetica, Arial, sans-serif;text-indent:32px;white-space:normal;\">&nbsp;æ–°é—»çºªå½•ç‰‡ã€Šé€ã€‹ç”±æ–°é—»ä¼ æ’­å­¦éƒ¨é«˜æ™“è™¹å­¦éƒ¨é•¿ç­–åˆ’å¹¶æ‹…ä»»å‡ºå“äººï¼Œç§¦ç‘œæ˜Žæ•™æŽˆä»»æ€»å¯¼æ¼”ï¼Œ2013çº§ç¡•å£«ç ”ç©¶ç”Ÿæ¨ä¿Šå³°ä»»å¯¼æ¼”ï¼Œè®²è¿°äº†åŒ—äº¬æ˜Œå¹³å†œæ°‘æ¨å›½åº†ç­‰è¢«å…³çˆ±é—å¿˜çš„åŽŸå›½æ°‘å…šæŠ—æˆ˜è€å…µï¼Œè¿›è€Œå¼•å‘ç¤¾ä¼šå„æ–¹å¯¹æŠ—æ—¥æˆ˜äº‰æ‚²å£®æ°‘æ—å²å¤šç»´åº¦å…³æ³¨çš„æ•…äº‹ã€‚</span> \r\n</p>\r\n<p>\r\n	<span style=\"color:#333333;font-family:å®‹ä½“, Tahoma, Helvetica, Arial, sans-serif;text-indent:32px;white-space:normal;\"><span style=\"color:#333333;font-family:å®‹ä½“, Tahoma, Helvetica, Arial, sans-serif;text-indent:32px;white-space:normal;\">&nbsp;è¿™éƒ¨ä½œå“æ˜¯ç§¦ç‘œæ˜Žæ•™æŽˆå¸¦é¢†ç ”ç©¶ç”Ÿåˆ›ä½œçš„ã€Šä¸­å›½æ–°æµªæ½®ã€‹ç³»åˆ—çºªå½•ç‰‡çš„ç¬¬äº”é›†ã€‚è¯¥ç³»åˆ—çºªå½•ç‰‡å°è¯•å¯¹ä¸“ä¸šæ•™å­¦å’Œç§‘ç ”è¿›è¡Œåˆ›æ–°æ€§æŽ¢ç´¢ï¼ŒåšæŒä»¥çŽ°å®žä¸»ä¹‰çš„åˆ›ä½œè¿½æ±‚æ¿€å‘å­¦ç”Ÿåˆ›ä½œçƒ­æƒ…ï¼ŒèŽ·å¾—ç¤¾ä¼šçš„è¾ƒé«˜è¯„ä»·ï¼Œå…¶ä¸­ç³»åˆ—ç‰‡ç¬¬ä¸€é›†ã€Š3â€¢1415â€¢â€¢â€¢ã€‹èŽ·å›½é™…æƒå¨ç”µè§†èŠ‚ç¬¬äºŒåå››å±ŠFIPAå›½é™…ç”µè§†èŠ‚ä¸»ç«žèµ›æåå¥–ã€é¦™æ¸¯åŽè¯­çºªå½•ç‰‡èŠ‚æœ€ä½³çŸ­çºªå½•ç‰‡æåå¥–ã€ä¸­å›½è§†åå¹´åº¦çºªå½•ç‰‡åä¼˜ä½œå“å¥–ï¼›ç³»åˆ—ç‰‡ç¬¬äºŒé›†ã€Šæˆ‘ä¹Ÿè¦æˆåã€‹èŽ·ä¸­å¹¿åä¼šç¬¬äº”å±Šâ€œçºªå½•ä¸­å›½â€åˆ›ä¼˜èŠ‚ç›®å¥–ï¼›ç³»åˆ—ç‰‡ç¬¬ä¸‰é›†ã€Šå¯»æ‰¾å›žæ¥çš„ä¸–ç•Œã€‹å…¥å›´ç¬¬äºŒåäº”å±ŠFIPAå›½é™…ç”µè§†èŠ‚å…¨æ™¯å•å…ƒï¼ŒèŽ·ç¬¬å…­å±Šâ€œçºªå½•ä¸­å›½â€åˆ›ä¼˜è¯„æžå¥–ï¼Œå…¥å›´ç¬¬ä¸‰å±ŠåŒ—äº¬å›½é™…ç”µå½±èŠ‚å±•æ˜ å•å…ƒï¼›ç³»åˆ—ç‰‡ç¬¬å››é›†ã€Šä¸‡ç‰©ç”Ÿæ˜†ä»‘ã€‹èŽ·å¾—åŒ—äº¬æ°‘æ—ç”µå½±å±•æœ€ä½³çºªå½•ç‰‡å¥–ç­‰ã€‚</span><br />\r\n</span> \r\n</p>', '1544934', '0', '20', 'http://www.cuc.edu.cn/video/247.html', '0', '1295', '0', '0', '1416530580', '1416530592', '6', '1416530592');

-- ----------------------------
-- Table structure for `videos`
-- ----------------------------
DROP TABLE IF EXISTS `videos`;
CREATE TABLE `videos` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `vid` char(20) NOT NULL DEFAULT '' COMMENT 'vid',
  `title` char(80) NOT NULL DEFAULT '' COMMENT '标题',
  `thumb` char(150) NOT NULL DEFAULT '' COMMENT '缩略图',
  `keyword` char(50) NOT NULL DEFAULT '' COMMENT '关键字',
  `pushed` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'é»˜è®¤0 1 å·²æŽ¨é€',
  `description` text NOT NULL COMMENT '简介',
  `duration` int(11) NOT NULL DEFAULT '0' COMMENT '时长',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'é»˜è®¤0 -1å·²åˆ é™¤',
  `video_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'è§†é¢‘çŠ¶æ€',
  `createtime` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `fileurl` char(150) DEFAULT '' COMMENT 'mp4播放地址',
  PRIMARY KEY (`id`),
  UNIQUE KEY `vid` (`vid`),
  KEY `pushed` (`pushed`)
) ENGINE=InnoDB AUTO_INCREMENT=249 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of videos
-- ----------------------------
INSERT INTO `videos` VALUES ('236', 'rPKDTFKRHg0', '马1111111', 'http://img02.cuctv.com/M00/00/01/CgEBe1y5hFWhNlHEAABnZrWv-wc117.jpg', '话题,yanbinzong', '1', '马11111111', '30133', '0', '20', '1555662788', '20190430/2019-04-30-10-53-06-5cc80cf2c0bfe.tpl');
INSERT INTO `videos` VALUES ('237', 'mI8FhFnlCHc', '马aaaaaaaaa', 'http://img02.cuctv.com/M00/00/01/CgEBe1y5iLzHJeNHAABnZrWv-wc579.jpg', '海外,yanbinzong', '1', '马aaaaaaaaa马aaaaaaaaa', '30133', '0', '10', '1555662875', '20190430/2019-04-30-11-04-30-5cc80f9e9ab10.gif');
INSERT INTO `videos` VALUES ('238', 'em182CNLf_8', '马cccc', 'http://img02.cuctv.com/M00/00/01/CgEBe1y5ibbcHTNbAABnZrWv-wc871.jpg', '马cccc,yanbinzong', '1', '马cccc', '30133', '0', '10', '1555663128', '');
INSERT INTO `videos` VALUES ('239', '1556247111', '马dddddddddddd', 'http://img02.cuctv.com/M00/00/01/CgEBe1y5icmCetM9AABnZrWv-wc467.jpg', '话题,yanbinzong', '1', '马ddd', '30133', '0', '-15', '1556247111', '20190430/2019-04-30-10-58-38-5cc80e3ea566d.gif');
INSERT INTO `videos` VALUES ('240', 'Onlt5FReyAU', '马bbbb', 'http://img02.cuctv.com/M00/00/01/CgEBe1y5iZajjtQTAABnZrWv-wc557.jpg', '花絮,yanbinzong', '1', '马bbbb', '30133', '0', '20', '1555663216', '');
INSERT INTO `videos` VALUES ('242', '85dMRiXHS-U', '马6666666666666', 'http://img02.cuctv.com/M00/01/01/CgEBe1y5jHSqih-IAABnZrWv-wc431.jpg', '花絮,yanbinzong', '1', '马6666666666666', '30133', '0', '20', '1555663865', '');
INSERT INTO `videos` VALUES ('243', '1555927130', '123', 'http://img02.cuctv.com/M00/01/00/CgEBe1y9iGbHGxEUAABnZrWv-wc664.jpg', '花絮,yanbinzong', '1', '马4222aa', '30133', '0', '-15', '1555927130', '20190430/2019-04-30-10-50-50-5cc80c6ac997e.txt');
INSERT INTO `videos` VALUES ('244', '1555927175', '123', 'http://img02.cuctv.com/M00/01/00/CgEBe1y9iGbHGxEUAABnZrWv-wc664.jpg', '花絮,yanbinzong', '1', '马4222aa', '30133', '0', '-15', '1555927175', '20190430/2019-04-30-10-55-28-5cc80d806ad64.gif');
INSERT INTO `videos` VALUES ('245', 'DFeebiuHE1I', '马4222aa11', 'http://img02.cuctv.com/M00/01/00/CgEBe1y9iGbHGxEUAABnZrWv-wc664.jpg', '花絮,yanbinzong', '1', '马4222aa', '30133', '0', '20', '1555927213', '20190430/2019-04-30-11-30-24-5cc815b01af86.txt');
INSERT INTO `videos` VALUES ('246', 'eCUwrwagXIM', '3F4803A4131BE11A60AA805280D093FD', 'http://img02.cuctv.com/M00/00/01/CgEBe1y-6YPeinrZAAAqkvD330g910.jpg', '花絮,仰大公学TopClass', '1', '3F4803A4131BE11A60AA805280D093FD', '11035', '0', '10', '1556015323', '20190430/2019-04-30-11-30-14-5cc815a63c47a.png');
INSERT INTO `videos` VALUES ('247', '1556076898', '马1122', 'http://img02.cuctv.com/M00/00/01/CgEBe1y_2daNQFyfAABnZrWv-wc377.jpg', '花絮,仰大公学TopClass', '1', '马1122', '30133', '0', '20', '1556076898', '20190430/2019-04-30-11-30-01-5cc81599c58ea.jpg');
INSERT INTO `videos` VALUES ('248', 'Pr_9NGZlUDo', '马1111', 'http://img02.cuctv.com/M00/00/01/CgEBe1zHvUjGkPjjAABnZrWv-wc004.jpg', '花絮,仰大公学TopClass', '1', '马1111', '30133', '0', '10', '1556593882', '20190430/2019-04-30-11-28-46-5cc8154e2a344.docx');

-- ----------------------------
-- Table structure for `video_translations`
-- ----------------------------
DROP TABLE IF EXISTS `video_translations`;
CREATE TABLE `video_translations` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `vid` char(20) NOT NULL DEFAULT '' COMMENT 'è§†é¢‘ID',
  `title` char(80) NOT NULL DEFAULT '' COMMENT 'è§†é¢‘æ ‡é¢˜',
  `thumb` char(150) NOT NULL DEFAULT '' COMMENT 'è§†é¢‘å°é¢',
  `keyword` char(50) NOT NULL DEFAULT '' COMMENT 'è§†é¢‘å…³é”®å­—',
  `pushed` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'é»˜è®¤0 1 å·²æŽ¨é€',
  `description` text NOT NULL COMMENT 'è§†é¢‘ç®€ä»‹',
  `duration` int(11) NOT NULL DEFAULT '0' COMMENT 'è§†é¢‘æ—¶é•¿',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'é»˜è®¤0 -1å·²åˆ é™¤',
  `video_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'è§†é¢‘çŠ¶æ€',
  `createtime` int(11) NOT NULL DEFAULT '0' COMMENT 'æ·»åŠ æ—¶é—´',
  PRIMARY KEY (`id`),
  UNIQUE KEY `vid` (`vid`),
  KEY `pushed` (`pushed`)
) ENGINE=InnoDB AUTO_INCREMENT=243 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of video_translations
-- ----------------------------
INSERT INTO `video_translations` VALUES ('236', 'rPKDTFKRHg0', '马1111111', 'http://img02.cuctv.com/M00/00/01/CgEBe1y5hFWhNlHEAABnZrWv-wc117.jpg', '话题,yanbinzong', '1', '马11111111', '30133', '0', '20', '1555662788');
INSERT INTO `video_translations` VALUES ('237', 'mI8FhFnlCHc', '马aaaaaaaaa', 'http://img02.cuctv.com/M00/00/01/CgEBe1y5iLzHJeNHAABnZrWv-wc579.jpg', '海外,yanbinzong', '1', '马aaaaaaaaa马aaaaaaaaa', '30133', '0', '10', '1555662875');
INSERT INTO `video_translations` VALUES ('238', 'em182CNLf_8', '马cccc', 'http://img02.cuctv.com/M00/00/01/CgEBe1y5ibbcHTNbAABnZrWv-wc871.jpg', '马cccc,yanbinzong', '1', '马cccc', '30133', '0', '10', '1555663128');
INSERT INTO `video_translations` VALUES ('239', 'qkEY3iik2lY', '马dddddddddddd', 'http://img02.cuctv.com/M00/00/01/CgEBe1y5icmCetM9AABnZrWv-wc467.jpg', '话题,yanbinzong', '1', '马ddd', '30133', '0', '10', '1555663152');
INSERT INTO `video_translations` VALUES ('240', 'Onlt5FReyAU', '马bbbb', 'http://img02.cuctv.com/M00/00/01/CgEBe1y5iZajjtQTAABnZrWv-wc557.jpg', '花絮,yanbinzong', '1', '马bbbb', '30133', '0', '20', '1555663216');
INSERT INTO `video_translations` VALUES ('242', '85dMRiXHS-U', '马6666666666666', 'http://img02.cuctv.com/M00/01/01/CgEBe1y5jHSqih-IAABnZrWv-wc431.jpg', '花絮,yanbinzong', '1', '马6666666666666', '30133', '0', '20', '1555663865');

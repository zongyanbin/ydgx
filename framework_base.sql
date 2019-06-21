/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50724
Source Host           : localhost:3306
Source Database       : framework_base

Target Server Type    : MYSQL
Target Server Version : 50724
File Encoding         : 65001

Date: 2019-05-17 18:04:19
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
INSERT INTO `adminusers` VALUES ('3', 'admin', 'Admin', 'admin@qq.com', '$2y$10$eNcPoj1tvfvogcEGsoGUw.F2VqGWipwloyYGfiSpXkyIDQ9Ywtd1C', 'password', 'ZPlnqDwevniRGJiMZSbvW4MMqxHgrr1J3JVIUMocT6x7BjMSflELX3QgNbsf', '1', 'en', '0000-00-00 00:00:00', '2019-04-19 12:37:31');
INSERT INTO `adminusers` VALUES ('4', 'zongyanbin', 'zongyanbin', 'zongyanbin@qq.com', '$2y$10$eNcPoj1tvfvogcEGsoGUw.F2VqGWipwloyYGfiSpXkyIDQ9Ywtd1C', 'password', 'eoIBRyqNbRZI1XkY8yXmjqmv3iP7NeThX0I6Cps5fzsVJGJWr05SbnrG3FJ5', '1', 'en', '2019-04-19 12:44:09', '2019-04-19 12:44:09');

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
INSERT INTO `password_resets` VALUES ('zongyan@qq.com', '$2y$10$izJRTyjpe/DVFm4QQYOOLuA8z2xNYYRV7.RGczmLI9SOColh/jkSO', '2019-05-07 06:26:15');
INSERT INTO `password_resets` VALUES ('18710077009@qq.com', '$2y$10$IbF4clo52ki/FFfKgeCm/uykj.5yFcfpgaZIwrXzRVvcL1eJX.q/.', '2019-05-09 04:37:27');

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
  `phone` varchar(15) CHARACTER SET utf8 DEFAULT NULL,
  `face_picture` blob COMMENT '头像图片',
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_phone_unique` (`phone`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', 'test', 'user@magutti.com', 'M', '$2y$10$nSpZLy5yt1j43AuCGKrPH.Qa0m/8lIRxHGMHGzIYpU39.NicTQqQ6', '12345678', '6bcalqQ4bUf5W4gbgBqcajBtrNI1HLH2AIY1uVVt8E1311NHnLIY70KzH6dp', '', '1', '2017-07-07 21:37:30', '2019-04-26 10:30:37', null, null);
INSERT INTO `users` VALUES ('6', 'Angelo marco Asperti', 'marco@magutti.com', '', '$2y$10$E2z1k.YNZXxE6O.czXTrueFjtazPNSVNF7dmC.VusocCnpoaJ1Sp.', null, 'd1KFvIUzwEvnWWOedGhDKBBNQb5rOwYjkCr6zcfN08rSvuM7fOKzRQixU7oh', '', '1', '2019-04-11 03:55:15', '2019-04-26 10:31:33', null, null);
INSERT INTO `users` VALUES ('7', 'zongyan', 'zongyan@qq.com', '', '$2y$10$D91wxl5V76hwpwNngAj8pe6q.ME58zBKlwuLlUMDkQammyTi1sB6O', null, null, '', '1', '2019-04-26 04:50:51', '2019-04-26 10:30:22', null, null);
INSERT INTO `users` VALUES ('8', 'adin', 'zyb@qq.com', '', '$2y$10$xFtN2y4hVzYFfssqTUpCYOsNUrwh59f7ZVwXaJ8eK7A7YqhxLPY0S', null, null, '', '1', '2019-05-06 10:34:47', '2019-05-06 10:34:47', null, null);
INSERT INTO `users` VALUES ('9', '18810088001', '', '', '$2y$10$J1FXqPzA2INEbAYk9rKBRuT2HJjoiPMU6nD3LDGcUHnkPooAiJ9Lq', null, null, '', '1', '2019-05-06 10:59:29', '2019-05-09 10:06:21', '18810088001', null);
INSERT INTO `users` VALUES ('15', '18710077001@qq.com', '18710077001@qq.com', '', '$2y$10$uiTpUHiQhStAa3DiJSpC3uV7rD0ZJGR70w2ms5J9iSEwUc2KdwR3m', null, null, '', '1', '2019-05-06 11:16:15', '2019-05-06 11:16:15', null, null);
INSERT INTO `users` VALUES ('17', '', '', '', '$2y$10$pbopNQHPEWTkf71jclieHuYxe38oZrY6JS2FVaiEqcFWBoi6rEbo.', null, null, '', '1', '2019-05-06 11:29:25', '2019-05-07 04:55:20', null, null);
INSERT INTO `users` VALUES ('18', '', '', '', '$2y$10$5RU.XEV9/3jQr0BicMv7K.73Ptu5qCz4Kh726baWEuASyps8/TB0G', null, null, '', '1', '2019-05-06 11:29:47', '2019-05-06 11:29:47', null, null);
INSERT INTO `users` VALUES ('19', '', '', '', '$2y$10$HmN6naBd5UVzfUzq9TADnesjIgupf12.gp9P5m5R5ie3FsqHPKIb2', null, null, '', '1', '2019-05-06 11:31:25', '2019-05-06 11:31:25', null, null);
INSERT INTO `users` VALUES ('20', '', '', '', '$2y$10$3fn7Ji3y.yxwLakEsGR63u1zhJv14bD2zBRJ3olEKE6LPIzOctv9K', null, null, '', '1', '2019-05-06 11:34:48', '2019-05-06 11:34:48', '2147483647', null);
INSERT INTO `users` VALUES ('22', '123', '', '', '$2y$10$fz0DizL8w0UVIr/rw5zuReNF70AFwteUTgtj/Xd6O1FUkeS8bqyzi', null, null, '', '1', '2019-05-06 11:41:31', '2019-05-09 12:38:50', '18710077001', 0x646174613A696D6167652F6A7065673B6261736536342C2F396A2F34414151536B5A4A5267414241514141415141424141442F327742444142414C4441344D4368414F445134534552415447436761474259574744456A4A52306F4F6A4D3950446B7A4F4464415346784F514552585254633455473152563139695A32686E506B31786558426B6546786C5A32502F327742444152455345686756474338614769396A516A684359324E6A59324E6A59324E6A59324E6A59324E6A59324E6A59324E6A59324E6A59324E6A59324E6A59324E6A59324E6A59324E6A59324E6A59324E6A59324E6A5932502F7741415243414763415A77444153494141684542417845422F38514148774141415155424151454241514541414141414141414141414543417751464267634943516F4C2F3851417452414141674544417749454177554642415141414146394151494441415152425249684D5545474531466842794A7846444B426B61454949304B78775256533066416B4D324A7967676B4B4668635947526F6C4A69636F4B536F304E5459334F446B3651305246526B644953557054564656575631685A576D4E6B5A575A6E61476C7163335231646E643465587144684957476834694A69704B546C4A57576C35695A6D714B6A704B576D7036697071724B7A744C57327437693575734C44784D584778386A4A79744C54314E585731396A5A32754869342B546C3575666F3665727838765030396662332B506E362F38514148774541417745424151454241514542415141414141414141414543417751464267634943516F4C2F385141745245414167454342415144424163464241514141514A3341414543417845454253457842684A425551646863524D694D6F454946454B526F62484243534D7A55764156596E4C524368596B4E4F456C3852635947526F6D4A7967704B6A55324E7A67354F6B4E4552555A4853456C4B55315256566C64595756706A5A47566D5A326870616E4E3064585A3365486C36676F4F456859614869496D4B6B704F556C5A61586D4A6D616F714F6B7061616E714B6D7173724F3074626133754C6D367773504578636248794D6E4B3074505531646258324E6E613475506B3565626E364F6E7138765030396662332B506E362F396F4144414D4241414952417845415077446E4B576B78536A705164775555555567436755436C6F414B4B4B4B426853306C4C5351776F6F705254414B4B4B4D436B4155555555414646464649416F6F4646413041464C675543696742615369696759555555554146464C55336C526A61476B59457147345148746E726B55415155564E73683237764E6B36342F31592F384169715A4B6E6C79736D6337546A4E4158473055564A6277506353625677414F5759394648716638414F61426245644658664D73322F7742483242592B302B506D7A366E32397638414A7254517642495563633951656F4939516539414A3349364B4B6644474A484F346B4B6F334E6A306F474D704B7342344762615974716E6A6343636A2B6C5253495935475275716E42375542635A5253304E39302F536741704B4B4B414369745054394E5765497A33586D78776B664955584A4A3963663352334E4D683071643953537A4B4535494F35534D464F354250474B647462453836376D6652572B766835504D6B7A6371552B66594136676B416453536658676A486274564379303079334469636A79596F7A4A49596E56384165347941633971454A5469316447645257724870537A324D46796A6C49325A2F4F6B6642564642342F7A314E5A6A71465A67726267443178313936513030394274464646417A56384E2F3868492F39637A2F537570726C7644662F4143456A2F7742637A2F537570716C73637458347A7A34555543696D626F4B4B4B42534142533055436741464C53557441776F6F6F6F474B4B4B42525141436967555567436969696B4155555555444446464B4B4B42674B4B4B4B414369696967416F7052525141566177574B454E46743241484C4C6E4F507256576967545259325362414E304F3750507A4C2F6A5564775130376C6345456E42714F6969343067713970706D6B67753765494D2B3649747456636C6A7558385456476969346D726C6E2B7A72372F6E7975502B2F546634564C71686C566F594A4E773875464D497777564F305A485450345652706472597A676E384B56786372754A556B4C694E6A75475659625778365648676A727839614B4C6C4E45367832367347616263672F68436E4A2F705462685745705A73454F636868304E525A7064784B675A4A4136444E4D56684B472B366670526967394B42674B565474594E787763386A492F4B6B6F6F4131644E76476B75726D57376E2B5A7264314264674F636341663443712B6E333030553045586E6D4F495341386E47305A4765657739653372564B6B6F7552796F3661336D5837664E4A4C396B5A436B69704931317A6735774D622B422B46564C4F342B7A795477792B524641384C4D59345A67775A754239346B382B782F4B735369676C553747374D36582B6E576B554C77573861534D4A497A4D46326A50422B596A4A783335724875566953356B534269305373517248715232394B696F6F4B55624253476C6F785157616E687638413543522F36356E2B6C6454584C2B48502B516B662B755A2F7058555653324F5372385A35384F6C464646427546416F46464143305555554451436C704253306B41556F704B576D4D4B42306F4853696B415555555567436969696759556F704B5555444369696967416F6F705251414369696967416F6F4646414252525251415555565042624E4D636A6866576B326C75556F7554304951435467416B315953304F33644B775266656E797A5157507971504D6C39427A2B645570486C756D33544D514F796973377437467452677276636E653667692B574A4E78486331455A4A70753541394278546B534B4E636B6A387636314B73325679695948716170523673786C5836496857466D417A6E38366130653367416D6C6D6E6C492B554144317A564356356A6B686D503050465659796332796435696A59492F4F706F5853547136723961794838772F65503630304D7939442B7441314F78754E356139484C6651635530636A49427857537431496F786E50317036587A67386E69697A483752645454776665697173643575347942376B31595679774279472B68716274477173304F6F6F44713348512B686F716B37696173464A53305577456F6F6F6F414B4B4B4B414E5877352F79456A2F317A50384153756F726C2F446E2F4952502F584D2F3072714B7062484A562B4D793950384144554D45656235524C4965775937522B574D31427265687752576A584E6F70517079795A4A4248343535727133586374593369535532326C4F4170627A506B794277767561343577717871335475677031564A6176553465744F7A697457734C747758655A5977634E4741464F3464446E5036437379723865704F6C6A4A61694E466A646366494D456E494F34395354782B4664735457536651757A57316C2F613632364B72764A4A744B6C53493478365942424A2F48483171384C43316B4378694331436A647459416334353669636B2F7257572B73494E3752326F3879522F4D4C5374764159444177754237396331484E716D394931386C5877574C6D596839356272324750773539364C36457453624E44533747796C6C7470705931547A575942444B53446A4F654368342B725A39366F616A61326B4D43533232574475567A357059636452676F76725462665647686B746959564B57374D797170783136386B6E31714735764450436B49686A6952474A47776B6B6B39535353616E70714E4A33754E7359316C76594935426C486B5545656F7A58527259324A6B6A686C677468477A6B4B637170626E3145784A2F492F537561745A5262334D557A4B58456268746F4F4D343936767072486B75776974396B544135486D487A415431594E3250304750617175456B3373554A30387565534D677274596A424854384B303944302B43346B535338556D4F516D4F4E4D6B626D786B6E7477506231724C6C5A5A4A575A5134424F666E6263667877422F4B724E6C716C35597568686E6659684A455A64746E346745564F3235625461304A39506A74707057696C74675931334757597577324C6A6A47446764757563316D48473467486756652F744E7A626D475733686C55735859735842596E755347476678716A3734774430464949703633436A46464C5157674178525252514D4B4B4B4B41464646416F6F414B42525251415555555541464641713761576F507A76304872554E70467767354D626132686635354268665139365A6436674642687473414467766A70394B53387653354D554A3272304C437161726A6B4C395038616C4A796432564F6F7161744546554C387A456E504A4A357A55696C35547469553765374867552B47334C2F4144534835616C4C7275326F75522B6E34316F6C59347054636E71496B434C387A596B5071334146534D712F65633448303471435335574D3541336B666B4B7154795353743837594236494254494A5A7232464F4167636A734F6C5A3874334B354941436739674B6D4D4A492B594165337055624B736655666A53754E4659687572487237307A493756497833453971504C372F414D366477476F753973644B5757466F694F515237566174596A7544464D6A5055392F777178714549386F4F426A41357A316F7544526D5274673961307259704B4172642F774144576448475363416A38613059493970777841507144535A5362512B5A4A49666D2F77425A48363978546F35466647446A3271796F4954613448503631526E684D4C2F4B634B6630706247305A58334C4E46527850764744314653565364796D67704B576B6F414B4B4B4B414E5877352F79456A2F414E637A2F53756F726C2F446E2F4953502F584D2F77424B36697157787831666A4E4B73337843364A6F3178356847434D44506335474B35622F684A39552F3536702F333746556233557276554370755A5334586F75414150774838367479566A4F4643536C646C6174473268747064497570476959547737666E4C6E484A3744412F584E5A31584C6255507339724C414C5743525A514E3563766B34504851674448304652756D64636B376147684C706B555673736172424A4B49684C4C38372B594233326A37764139633153315037446D5037467436486474335936385A3364386466306F2F7461667953676A69336D50792F4F326E6674394F7550624F4D2B395561585555553175576F4E4F753769495351773731505142687550593447636E4765777143574E6F5A576A6B41444B64707763395070544B56546767347A37476D5672314E6931747253366852356F42616F307170484A35684A6366785A79653371414F74545846686277784A506332663252466D614D715335444448796E75635A394B7A727255686437444A61573432674264686362514F774737414834436F70376F7A524A457363554D61456B4C486E7165704A4A4A4A2F476B32516F7439517666732F77427166374C2F414B72746A4F50777A7A6A363831586F6F7047713273464646464178614B4B4B41436969696759556F6F464641425252514B414155555555414646465457384A6C6C4178386F704E3256796F7862646B54576C73572B647542554E2F65627A35454A776F344A4657622B635730416A54377A566B41592B596E4A4A2F45316A46637A7579366B6C54584B6952564741716E36314B47564143324437643271485041474D342F6848663630364D5A6650567A333950705736304F4754625A4D7A4E49666D4F4639425457505A53514B5848474D632B744E4373376856475039724E424A47634137552B5A7658306F5744596478795750657241574F4C684F666633714B6151344F4F545142424F36786A356A7A324865716A497A6E63655078365661574848377962377836436B6B4849794F4F79343630726A534B686A783136552B434C65784C5A774F3372536C5750666E2B5650554E7543726E413630726A534A6C5A6F2F6D3267632F4B505370726B72396D587A497A6B383542717645444C49464A347A79616D765566614755384159494270444D3478723935574F61755772626C772F5070554D664A2B7663314D71424844597744337070695A644749774D6B6C5437644B624C3836383478366D6E4B654D444850627361677A68764C62494236444E4E6A69374D6A4759327878782B7454413541493731576B4F4467384D76512B745357386D3445666C53544E30376F6D6F6F4646554D536C704B4B414E5877352F774168492F3841584D2F3072714B356677352F7945542F414E637A2F53756F716C73636C58347A7A366C704B576733436969696759436C7042533044436C464A5330414641365544705253414B4B4B4B5142525252514E436969675555444369696967425252514B4B41415555436967416F6F7061414536317132305967674C4E31366B2B3155374F4C66494749344872556D707A3755454B48356D36343743735A766D646A6F68376B655A6D64637969655A6E4A2B58745666655866356365314E6D666A5976556E715455734152592B6F4950552B746178566C5A48484E33315939515651354177652B6554566851455842354A484A37564771664E3572444A36443271554559354F42366B63307A4673465538344A322F78476A4A4B3756424365766330684C4F5141417144706A7253412B5A38716E5A477666316F4568636268674C74587637303341556A676E3048636D6E4D36686371434636644F5453444C41374156486339365447694E6A68797877376E30364C5347496E6C6753783631596A6950626F4B76513265324D75334A48556D6B32556C334D7462664136597A3270336B4746446B6374577861327942544E4976543776464D2B7A6D5751764A30394B68746C70497057467153526B676477503861666432355167726E613348343173576C71716F7A4163756654745333746E7574794E70347A326F757761527962513743555041627039616C695673624342757A3171316452664E6E417A696D6F6759416B6E49344E556E63686F69565375426E6A5054306F6E587A592F6C474A463644312F2B76556E494A562B7633536169636C43526E7030494E5553696E4B77614D4F66783435714E4738747867386461664F636B734F68363143472F6850616B61785A7049775A515254717157546B76355A34394B3130303969427563443663304F5353314E347763746B55364B3056302B496665596E394B6C577A68582B44503135714856696A565965543345384F663868452F7744584D2F30727036794E4C6A6A533679697144745051437465746163755A584F444577354B6C6A7A36696969714E42614B4B4B426F42533067706153474170615155744D4148536967644B4B514252525253414B4B4B4B41464646416F6F4767705253556F6F474646464641425252525141557167733242535661736F74306D534B6D5473726C776A7A4F78626A566265416C754D444A724475726A66493868504C644B3064566E3271496C504A35503072436D626E476179677570646156766437455A4F34343936306F592B41474A422F6C565330525154492B546A6F505772676261684C5A33742B6C6249345A4F374A6979347954374165744E505055384471616779546B395066307070647A68592B536568505369354C524F377146775346483950616B53587A63694E506B587161534F4945444A7A6A717A5649753347316368632B6E576D43513549315A747A5A7A334E57556A4C416359486F65314C444675786E6F4F3157346F79334B34322F7A7157793072447253414D33543551636B31636E564F4977514642797870596B454565346A61716A4A39364C4F4A7076337A72684430422F6971514645506E414B4152474F675070566D477A52674146783631596A69376454337137464674475342525954646B5170416F344141707330494D5A474B7537526A7055556F2B5167556D684A334F50756F686C686A6F654F4B71414658365A7A57336678424A5178484765745A567770526A7831475254544C617569704F4D6B6E505559503137565833423039537646537A4D517835366A4E555866612B3448673961704D6A596A5937584B6E6B4556574A77616C6D595A506F4F6C5242715A5366516D52797271363131466E4E353175725A35365679536E745776703934386352564D666A5756534C65783234657079376D39526B41636B43736837715A7634386654696F326B6339574A2F476F5646395464346C6445644A706A71626F674D436470364774617559384F66384149524F6566335A2F7058543130776A79717835574B6E7A314C6E6E31464646556143305555554451436C704253306B4D42533067706159414F6C464136555567436969696B415555555544466F6F46464130464B4B536C4641425252525141555555744142576E416F677479376463633152746F79386F34794B6E31535952514251526D735A7537736A7070523555354D7962326665374D547954564A4158596574456A626A7A544666626E7554786972697249354B73726C3633415A3971343270796166497733347A555966795941677757504C6E4E524B784F58627239616F773252594F5736672B77704659386A6766336A32465169646B586366766E686339766568415478324858336F456C63742B61352B56422B6C5772534875636E3150616F4C614864786E6A756130345556766B414941366B3856445A6F6C596C6943375478774F70713148694565624D77554837716A2B74514435766C52674637635A713342592B592B3658666A3059386E3842307044596B4B6E554833746C6259486A5042632F3046617353377362526852774D2F306F6A6879414D5955644256784541485371524459525242515036315958474F6C4D55636436634D30454D5531472F7742326E6D6D734B54476A4B314F484D4C45446B63317A31344E317372397858573343426B497831726D626D5079345A46786E61314A36477131527A3179354371784A794F3155642B515236644B304C364D6766586D736F6E424E5648556957672B5135554832714654673034456D4D2B6F7068362F57744C454E36334A5256757A59373974556B5046574C59346D58334E5139447067376D6E5256704C43566743785541383963314B756E4C2F4849543942697064534B4E31526D796277352F7945542F317A50394B366573545237574F47374C726E4F303954573357734A4B5375634F4A6934564C4D382B4646416F706D6F7446464641304B4B4B42525351414B576B464C544142306F6F4853696B4D4B4B4B4B514253696B7052514D4B4B4B4B41436C464A536967416F6F6F464177705655735142314E4A56367867344D6A6A365A714A4F794C7078356D536A5A615735593963567A39334F5A7057596E69722B71336D39764C5138447237316A736335465A7758566D7457566C796F5978366E7453784435747848542B6449426B355035564E6749765058734B32765934476D33714E636B6A4A4A7A36552F4143686D36436F31354F572F4F69556C6946586D68457349775A5A4D6B2F2F414668576842435141696A356A2B6C56345532734165335833725673343558424B4C6774315931445A6356596B52424541684F5736317032746B306742664954303966725357646B7145504964372B2F6174654D6344474B513237435132386359777167477255615948536D6F76657031774251513363565641715166576B474D556F34716B53795252785330774E69674E5149636161614E777A31785346313773507A6F47686B693546596C374550744A556759635936643632336D6A556373507A724F314256654C63683558754B6C6F714C4F5231474572477974794634726E70426735485375743142544A45373963444278584F5378677874675959484A4870546937465356796D50304E4E4A77667054694D556B6D633539613152684C51464E546F6551523171734469703050536B30625570616E5957736E6D5773622B716970717862432B614F30574D4B435639616C61396D622B4C4830726B396B323265717138556B622B6D2F7744487A2F77453171317A5767537953616951376B6A5965702B6C644C5856546A79717A504B78632B6570633050374B30332F414A384C582F7679762B4648396C61642F77412B46722F3335582F43726C4661484E6439796E2F5A576E66382B46722F414E2B562F77414B542B79744F2F35384C582F767976384168563269674C7675552F374A30372F6E7774662B2F4B2F345566325470332F5068612F392B562F77713552514633334B66396C61642F7A34577638413335582F41416F2F737254762B6643312F77432F4B2F3456636F6F4337376C502B7974502F77436643312F3738722F68522F5A576E2F38415068612F392B562F77713552514633334B6638415A576E2F41505068612F3841666C66384B50374B302F384135384C582F7679762B46584B4B41752B35542F737254762B6643312F3738722F41495566325670332F5068612F7744666C66384143726C4641586663702F325670332F5068612F392B562F776F2F7372547638416E7774662B2F4B2F3456636F6F4337376C503841737254762B6643312F77432F4B2F345566325670332F506A612F3841666C66384B755555426439796E2F5A576E663841506A6266392B562F777050374B30372F414A3862622F7679762B4658614B4C4264397A6B6645656877516558635771434D4D3231314854366973572B7546746266614F7072737645662F494E552F37592F6B613833314F344D7335415041726D714B386A314D4B375575597153466E596E49353954554A48755077356F624A6F5663486E72373161566B5A546B327836414B4D386B39754B593579632F77435454767648476550576D343366536D5A4D556E6176506569496C65632F6570724D43636E6F4F314F6A2B5946694B487353747933437949753932366E76563461695171724775503531425A577179717064632F57756974745074566A47595154366D6F6252705A70476244714D6941626966784E576F396164543933497179396A70366E35777166384378554273644F6B4A564A526E4F50765A6F75533057596464546341344172577462364F636345567A7A614D71486447784939657454323062327841505148725263664C646148544B6477347039564C57546447446D7257654B704762337352545465574B7A4C725657685835534D316475766D47434F4B7A6E74466B4A2B55592B6C53324E4A50636F4E726B72456A4F50786F532F755A5734795237416D7277302B46423834555A39525530623238612F66584134366766316F567974455A345338624C4B4759666C54472F7447504A534E7942325050466251766264547438354D2B357037537134344950304E416B7A6C784E4A4B4A4970596D56735A7A362F5773615654484C38773450423472744A59773075514D35724831665477305A64416565635546626E4B334D57787A36486D6F582B344D31715838655939783449474D59724C5033613069376D63305267314D6E317148767A54315076564E4763485A6D6C5A4E6B6C6175566D326A596B483172565743562F75787351652B4F4B684E4C63376B6E4A5852706548502B5169662B755A2F705854317A7567323873642B58645142735063653164465678643164484A585455395363585574764E746B4A4942357A576D70444B434477656179622B36467755455A79754D34787A6D744F33585A4247766F414B34634A4A38306F33756C7377717839314E364D6C6F6F6F7230446E436969696741724B6B314A6F62695657554D6F50474F4B3144584E537A4E4531784736355A7A672B6F35724F6F32746D644643436D3366557574717A7954524A476F565377424A366D746A33726B7A4D306951776F6E7A4B3344657561367041516F7A317055354E376C563661686132672B69696974546D43696969674171687145687949392B30597A6B45632F6D52562B7358556E6D45785A43796C6544744A47526E672F72576C4E586C5971437577734A3253394549636C474A4662566331592B6131794A73456B644332666D62303936364D644B75756B704654566D4F6F6F416F3656675159506A4B63322B696C78314D67555A2F47764D6D4A646932436565665376522F485A2F346B4B352F35374C2F41434E656474746272767836446D736D745472705361703249752B426E506F42533743426C38443236314B6F596A35564341647A317072414B4D395436356F73446479496B6B66374E4D5A766C36304D3435376E327142334C4771534D705346335A4E5862564449514F315546484E616D6B6A4C305357677162753954627334635267415A7165363144374843546B5A3944567979684251476C764C424A6F7A6C4154394B78747164462B687A5542757456756349536F50566D35503456416B30304E384933764A496F77324763354F507746644E59577957354143676C65343756587539422B3033686D74706C544A795664654256706F7A614B316E71303633686A6A6C2B315144712B336163563065785A6F513478794D31563076536C735A486C6C6B535356686A706743744B7A742F4B6A6B546A6157796F484F333270505859536257677A547A2F43656F7254322F4C5647434C5A4D6653745048795A49706F556E71554A567961696B7848477A59364438717473674A4E5637323338794459435144393733704D615A796573584E374E62764E45786A677A6A635076502F674B78482B7A74594B5653342B306C766D636B624D65316434397245397531764A743870686A474F5257656E6875787741307337726E37706241716B31594C584D42644D6D58543472714352747A6665516E4F61304E4D31435A475747574E783762636A3836332F4B565978456741516342616E74374E4635326A38716C75355330475171584162424831704C6949474D676A365666455941774F4B676E58355453364354757A6964585879305A43414D644B776B694D6E41726F504566424242353647734742697367494766617169394274583349576A4B6B673078654F4B304A38414E4C6A6A47507872507A6B357130376F786D6B6E6F574957324F44364775777435424C416A6A754D317861477567306D2B564C6378795A4A4854465931597437486F59536F6C6F7A6F394E2F342B662B416D7457734C527273543378514B514E684F536663567531644A4E51737A6C786B6C4B7064476E425977774E75417933716561735667335775584674644C4535306D49594A59545832786830786B626550312F43724F6C616A6458354A326165385375517A3239345A43767078742F714B75454977566F725135584A7964326131464646575346464646417771746357634677637978686A3639442B6C4A63766571562B79775153676A6B797A475048354B31556A7263636434384E776B714246424A57435667474A49507A62656E7630704E4A37676D3037706C32437774376474306353376833504A713158506170727A3271426F4A4C626D62594764686B4448494B733634494F4F2F6365754B585274636B7674514E744C4E6250386D3465587379542F414D426C662B6C4356746762626432644252525254414B4B4B4B4143713978415A674E7051456479704A2F4442474B71616E7146785A4F676A746F356C6670383068624936384C4733353154744E6276355A496F7062434F4A3547326A7A445047442F3331466A7037303032746776593037573161456776497368786A63564F342F6953617543734736317936747674582F45746C59517571676E706767456B6C4E3354723048487678544E48313634314C556E69654A59346C474E7178537351666479414233366764755451336362666336486F4F6151304535704B516D637A342F62623466552F77445464663547764F6674494234362B3472305434682F386934762F5864663547764D514D314C535A63573757525A4E3052334A714753566E366D6F7A5267304A413550594D306C4C53557947534A39335070576A7042784F5650587257596837646A5636795952334D5A7A314F445579324E716275643159444D61317069494D7649724C3035775978577845774F4B794E6D563273564A79427450745372596B663874434B764B42696E6852696D6B5A7473707832694B636B6C6A37314D797171344846536E6A705555726471595876755278444D6C58794235645572666D53727A44354B614A5A57492B616C3267696B616E4B63696B686C6553306A6B3549495074556632446E6879425638436C4146466B46325659375256397A366D7064675563564E77425562455572416E636A6641716E644E68436173796B44765762714D776A69596B306D5846484B6179566D757467504136316C5151376E4A786A6161316261324E33504A634F775651654165395254694F316B6B6B635A52736C654F706F54364650755A4E2B77456D78534D44726971693961664932397978376D6D64363257787A5056334A56484271355A4E6954423731545134475057706F4732794B6665705A30553359367277352F7945542F317A50384153756F726C7644664F6F6B39764C50394B366D716A735A56666A4675376D563774344A7A6477573641663841487662797330764766766F43415059632B3436564E597A784C4C4662366661535251444A6B4C32377841656D4E774753546E3172566F716A454B4B4B4B424251656C464641474C7139676275376A4930793375575643566B6D436C4E33594D543832427A7741655456586134733249735A49486E325278514A43634971734D35774346376E6E4846644A5253386839546D4E546A65354D68386D595447517247467435655547464F57517231786B626A6A4870547445743368314A7674636336754F45334A4F6348766C69377839682F462F68585330553767776F6F6F6F414B44306F6F6F41357A784D50744D6C764574764A4C734C4D332B6A73366A4F4D632B55342F5438717937474132757057307773355556484F356F374E675277665333512F716670586230554C514E7A6C6233546D7576744D73555633493575464B6C67366B674B4D38626B3442487150616D364E706C35447130456C356179674B4A4348636C67704A48667A58782B512B70727244306F48544A6F7659487149614B4F7448515541637438512B6644712F3966432F794E656137634C6D76537669462F794C712F38415864663547764F472B364650414836564C4E494C53354141545367447630702B505470545430346F754B7733476561616574546C64736649354E516B55784E43565A676249427A686C36565737314E61354D3667647A5131644246325A326D6B5847364A535432726F4C655145446D754F3037666279474A7A376A3656306C704C77426D734E6E59363947726F325562337158634D565569636363314D4742464E476251386D7138726331497A56585A6753787A52634569653247547571362F334B70576244623171347A445A3170706B7952576676534B324B63574250576D53454263354641496D5667525473315656694B6C443863305843784957714A326F4C6A465179796355726A5349356E774F7459577358424D525665746156784C7831724476334737633349427A696B617252584330454B5779784D79687A324A724838517A447A307431497767352B7464706F586C58756D4351424343534F6E66706D76504E555630314B345751376D56794D3163596454467A3646493848696B7A7A546A7A5359474D316F5A4E616A787A2B64534C37564767504270363961686D315063376677345664456456414F77676D742B7559384A534135516B5A4150466450537070704D4D585A79304E7969696974546E43696969675155555555444369696967416F6F6F6F414B4B4B4B414369696967416F46464136554148656B4A6F6F6F414253476C375555434F61386472763046522F3033582B52727A686B354A3744765870506A6F676143435467656376386A586D63737538347A6866353144334E59765377683542394B6247752B5432464E59353448537255434249386E7161614378444C793250536D4D4D4C6B2F6855717143344A2F476F706D334E676442516761496176614D5658553469324D5A3731526F556C546B634556526D6468664631756F6D4B68515267454772397049654F61354733314B566D6A6A6C4959413954317270724E7371434478574D31726336716254566A66686C7A6A6D724B767831724D6762675A4E58556269705447305764784936316B61684E4C41354B41344E615962696F62694953446B5A6F45744759396A713869796C4A56326E73633847745A745455516B353664617A4A3950444E386F70384671325172386A336F5679326F376B423162555A355435454B72486E712B636D7453786B754C67715A5677423178307178426249716A436A3871746F67556341436E596C7956724951714D644B694A4B6D7057594156585A6761475368576B50725545726E48576C592B6C514F54696B556B51546B6B6461787279357434703153347A746345676A73635672546E6731786573542B64664E742B367679696E4658593550513633524C3644544E4751547546494A4A484765546E46635A714534753732613441774A474A41714D426E77704A50314E4B3635594159774B30755A637041423270534D63476E67425157503455696A6563486A464F354C56682F4B784B50556D68522F4B6E7A482F4146616A74534A3930314C4E4B614F693849482F4145397639772F30727361343777662F414D68422F77446350394B3747726A7352572B4D734C4F346359636E6E706D74474E39366B343648465A747462744A4972456256484F54786E365670716F5651414D41644B344D45716C6D3544724F4E374964525252586F484F464646464143566E5874784B5A544643474F3372744753613071796E6B6544556D4B6F5844597A6A742B564E47744B313237433274793855694A497A6E65635963486A3854576E3172496C6553665534315A504C5257347965762B4E613944436F6C6F78614B4B4B526D4646464641445363444E5A747A64544D7274466C59314F4352576A4970614E6C376B455668526551586547356C6B694F65674F422B504662556B7437484C69484C62596B6A76726D46566C664C776C73456B35725A52673668783049794B35725552626F4668745A704A574A366273715030726F4C4F4D78576B534E3156514456566F717961366B596154356E467536525052533032756337446C2F694A2F794C71342F352B462F6B61383141774F764E656D2B502F38416B5877546A6964542B68727A484A7A785573306A734C47752B514C5636516255774D63635646614A7957394F3953334256414E78343630696B567057324A78314E51415A2B70707A4D5A474C4770496B7A6D6D44376B525443564561747971516D4B67497A7854524452474F7464586F74794A6F4679666D417761355772756C5866326135584A2B527544536B726F7144355764334177396175786E69736D316D44414545477453416772574A30505572586D72525762425A636A506646516E784461446A42625066745768635755567847513667354870584A332B6B745A7A4861534979654432464270535557374D3368724D4C3449546731616A314B7A59636B6F665446636C46617A64456D47302B316145656B7A794B434C7744324B5A6F4F68306F574E3174586A55455272774F3550576F5731356878734835316C79615449695A2B314F7A65796743716E324233634C356A7554786A4E476F6C54685931705045536B3746694C79486F71636D72566C63547A71544E4559796578504E4F306652307445334D6F4C6E394B30326956657746466D637333464F794B7042417147513856596C774D34716A504946424A4F4B424C557A7459757673316F375A3549777463614158624A3579657461336943567048546E6A30716841673367656E4E58485243657244626847366363666A536D45716D577158437175575047632F5531576D6B5A69546E3565324B454E7057453271666D6B6641374164614939736B6F58627451636E317149416B314979694F50614F5750552B31576A466F4862664A6E386A54736251414F39516A705572486B6653705A7041364877682F7741684A763841726D663656325663583451502F45315966394D7A2F537530716F45562F6A4E654B497841414F78556341484839425574632F656133667833445132326E466C35416C654F63714D656F455866324A2B74574E4F31653675376E7972697761415A4944625A7566384176714E5142395350705469724B787A7663324B4B4B4B5942525252514D4B722F41475937325A4A6E5463633447302F7A465A657561354A705538614B4C514B774C667637677178783241414F4D396A30344E5166327A64504F75326542594755466E53306C6D524363664C356973465031346F424E6F327673354C4B576D6B666163344F422F495A717857506436764C444A4A354B517A526F7769504C68692B4D6B4461726B38653359306D6B61726558736F69757252494778754F664E552F67475144386D7067322B70745555555567436765744135704361414138315575394F67757558424466336C36315331692F6E74703478466557646F6F77536268682B383745414668775058502F774265744271576F5433614347387470596E2B584D4E6F38794C6A7557567344506F5363635534796131544A6C465356704B3570576D6C5731712B39464C4F4F6A4E7A697239593875744A457234754E4E597135554D3932493150364D632B3334306D6C36776C394B70612B3038463834746F6E334F435039724979503841674E45704F5772464745594B794E6D6B6F706152527A586A345A3850446A2F6C737638414931356D464C4E783172303378372F794C7735782B2B582B52727A6C4E71754D6E41417A5576633168735759304555573568774B7A3570444C49543237564E63334C54664B6F326F50317175426A6B30696B6877556E41413656636969326F4F4F6356466252466B7A363163412B5167476D675A54756541712B70717579354A396174546A4D6F41485155696F465232596339715A4A544B484763564830713236385658644D445072516D53306265693669654970473548546E7258565763344F4B383552696A426C4A42485131306D6B616D4A4D4B3577342F57733552366F31684F36737A74346D44436B6E746B6E517177423971703264794855633170524D47465169396E63352B6252776A376B4A58327045696E6A474D37685854655772446B413043326A505544387164726C2B336B6C5A6E504A444C4C38703448746D74537973556941596A4A39617672626F7652522B5650326852785474596C315739434D446150616F5A6D34715356735651754A653261545A4B56794F6154727A57566379467955586B5650504958626174522B5674516B39616873305373633772492F65786B6A76564B4C494236444E616D73786E61722F7742306E4E5A717165536567725250516C37334962695449786E6F654B67427A33464B78334B543730316553414F707137456377344541487637306F4A5A2F6D48555531735A774F67707749425076514C6361764C443630396A6C3661674A786A726D6C2F6A3961544C69644234512F77435173332F58492F7A46647258452B442F2B5173662B7554667A46647456514D367A764D727A32443668716B737157746F305A41426537735763715142774E785850345A48765464456A6B74745462466E46483569684845466D38434A676E4A4A4F51783548512F797270714B70474C4369696967515555555541594F7232307339385369536B474E554372477A622B53534D376776662B4C49396A565932747A497764726151784C777A5979774F526E43344259446231343967525854305544366E4B36766242496E6769745A575672685A4142417A715273354A2B5278315063486E39453850512F5A74554A4E713859655061474673554765764A4545592F504E64585251494B4B4B4B4268306F6F4E46414756714275486D325773313673754F45696A51526A334C4F702F49456E327170466258396A745337763732524D354432384D624C394755526C7678366654705851447053476B68474463746678334635396C74376E613071487A597775346A6141516F626A38546970644A6A75726536386C31766842734A41755243666D7A324D663961326853476762415574494B576D49356E78376E2B7746782F7A33582B52727A6B497A7346475354586F2F6A7A6E5146774D6E7A6C2F6B61382B5A316755716E4D68474366536F6535744261454D3457503546494A376B564569376D433039464D722F414D36737752596B59344842394B53314E4772496D52647365656C5342635264736D6E45664A543975414142307169436A4B76377A707A774B5A4A6E79396F716159425A794F35714E686B4433706B6B5A6A4F337256646C7A6B656C6142512B574E6F4A7A565171413741482F7743765146696B5255317157575546546769686B2B553471537854644A5362304646616E52616471424746626731306C6E654B77487A43754E524D4869727345386B4A4743635669644E726F37694F5146633571515359364775617464574141566D7251545545595A42716B7948473572655950576D504B4233724D612F556436725336674477707A5362476F6C2B3475564136316D537A4E495346714579504D3350417178444633787A557655757953434B49415A504A7037726B644F6C54684F4F6C4936674C52594C6D44715549614667526D73426A74674A62726A46645A63523768674431726D745567614A474948796B2F6C56526651556C70637953666C48316F56396F78334E4A6A4934353470414D6D745443377553444F4D306A64614D3859464B6F44455A4F42534C53486F4E715A39656C4E5057704D67726A48546F616A626F4B5265794E2F7765662B4A73662B7554667A466476584565447638416B4C6E2F414B354E2F4D563239564859797150336A636F704D307455596852525251494B4B4B4B414369696B6F474C52535574414252525251415543696967417044536D6B504649425230704F394B447853643641466F704B4B596A6D764872624E4156736766766C2F6B61383151475638446B64545870487841557434665252312B304C2F4931777178434B4C6E6A74554D326865773233554C4777343345314E457543337655486D6851514F3571784551567954556F316B376F6E59596A49474D3034453756365A706E42774F7746457238453979756175356D56376C51626B2B777068584C67444A774B644F3236594E774F4B6443517A4E67446A7651684E436A436F7935796635565343356B33446F4B754F43695A39525664527467475279546967437577784363314E7061626D4A704C676259443335717A7043664C6E48576B336F4F4B314C71703378556F586A7055714A37564B73594936566962497265586E7455714977365A4834314F7351783071564966616770454B4B78366B2F6E55795245314F6B51394B73527844306F4533596A68695070567445366355714A6A74557971665369784C59304B50536D534B44774B6E787854434F70373078584D3534387351423046564E5173466C6749325A376B56712B587965427A542F4C44446E6B5978534B75656658476B5478356B68486D4B4F6F485556516635546A6B48767869765170624D77792B596D344B65754F667A465158576C773334356A694A5038574D4556616E3349634F714F42357A5569396561364B39384C724543304D2F503931685753326D5863584C517356486356584D6D455974626B4F4D6F6655436F69616B4A4B687777497A3631417A554A467A6152305067372F6B4C6B66394D6D2F6D4B3769754638474E6E57542F3179622B597275717448504E336B59446632696B526D2B337A6263627362324F52585961584B382B6E57387368426430425031727A3254577042614D45416B6A417877447750382B7464376F4C6954524C4A7830614A542B6C4B4A32343178745A577635476852525256486D68525252514D677533614B306D6B5837796F7A4436675679566E44714F6F786563756F79726C6A7876626A386A5856366A2F414D672B357A2F7A79622B5663316F5637486232364C504D6F357741546A3838482B654B6C37366E5A68302B5354537579744B6D6F77577A584B366A4B3061344F51375950356E6D757330795635744F74355A4343376F436672584F367A647753326B695739774341324E674F4F50363176364C2F77416765302F3635722F4B68447847744E4E717A4C314646465563515543696B4E49434B366B614B306D6B5837794957483141726A343276726949546D2B7546445A3444482F47757431454F644E75684743584D4C37514F3577635635344E55757243434F4F35526C4A7967776F5948427763652B6169615A31346155556D6E612F6D61736A586B4D486E66326C4B57484A5465632F7A72724E4F6C656654344A5A4F585A4154396138385738754C79462F7373627945486279414F534D342F537538304173644373532B643568585031785368667156697051615357356F675545556F7044317255346A6E664847503744585051544C2F493135356354636266617651504872626441552F7744545A663547764D33596B5A4A71487562512B4547596A424A7137412B354F7455484F4D437034572F64656E4E4130376C34796741486B306C7A4B464348504A537168633741527A7A544A4A4E794C6E50464B343745766D626C4950587056697A62356D4236316E4273634372646D774D326330304A6F747A726C6348706731577944694D634472567559376C59656F716E47415A534F44306F596B6862745149426A717A566630654C354F6C564C6C6437787267657046612B6C5234485476557439436B757062574C4861706B51647855346A343655497544696F73576D4E574C5051564973587456684542465043596F7346794A55774F6C5371764934707755436E71426E70514A73564639716B4146497450416F4549514B6179385649423755757A7552525956797569633830395641363961667477314F4B34625061697758477247434F6C4D61316A4F5346326B2B6C574647656C5077414F5454734679694C4A4F342F4D3031374E4341754F4B766B3534555A70504C593965507053735570475A4C7031717749654A44395256582B774E506D3632712F555676433355386E6E36314973617230474B6175684F567A44744E447339506E2B305152624849323954305038412B71723161567552353242365661726147787A7A334D4B31384C324E7442354B79546C506E504C4C7A754142364B505469746932676A7472654F434A5173635943716F37415668584F7333456476644E45397474673445307A6D50666E6F562B55672F68775455756C367A4C65366759504D303931324134687539374431774E677A2F536D69577A646F6F6F6F414B4B4B78746531535454664945553976475A4351566C417A6A31473652422B744B347A576B525A454B4D4D717777525747336853795A79524A4F6F504F4177775030716E463467764A725A5A495A3756334179346A6733716E4A487A6B532F494D6335504875656C61643171733064776B4672433837374E3532786B4B33546F7A4D46787A31796162535A554B6B6F664379755043646B446E7A726A2F766F6634567477524A4245735559415242674430724F2F745A336B6A56494E6F615655494C42695155336345484765335531526B313755556C6E516159584B4843736F6C59412B6832786B456A767A394B4C57484F704F66784F35306C465A4F6A616C643667306E326930534152486178337543543179465A4634495072577451514148656A504E425046464942434151516568726E372F7768593337715A626D375149785A56526B41424A7966346176366E667A32636C756B566E4A4F4A4A41705A53754F68344757427A78394B707A616E654A636B4C6332595579716B63545248652F493341486679526B3867487054415A59654562505477524264335A425950686D556A634D382F64397A573744456B454B52527146564274556567725076745275376543526F744C755355364D78694B6B5A2F36365A2F54384B6E747279655A31575454726D4145637537526B44386E4A2F536C754975696B4E4761536D4D356A34676E48683563663839312F6B61383059636756365A3851422F7854362F38415864663547764D7A317A554773666845626B6E5034564C436344474F2F656F636479616B55345869686A5249547838324F44774B6A596739796161535478534545554A46584148427A55317535575545647A55497079384555434E523279534D3950536F4C595A6E4847636D6B6A59685844486B696E576A4133414850666D6B324E4974684E38774F4F67726630794861764937316E3245496335474439445851576B577863643668376A36456E6C664C78555254616331643238597044447555347057424D5A62674D4B6D4B653346513275524B564E5851767451445A58432B6C4F326B64716D4B4830706A416755574663616E33716C78696F3763457353616C4C4265744342734150576E635978544276626F4F4B63456675514B5972434D425359334441352F43705246334E5342564137553742644967534E6833347156597833483430384143676E30707043754C674155763070677965395041774F7441726830484E524D7836436E4D6561626A4A7044524A614439356E7669726C566262682F77414B7456724859796C75637265536C6452655743374D7A7179423245625371682B623551696E4F514F3263393658537062687456746B6E5A6A6A7A6D414E6E4A436553446E4C486E3664713669697157676E71464646464951566B61304C695952515736546B736373304C73724165784256667A502F414145317230554163784270636C724A3578743363493477584C5476434D636C4133716570417A3748746231474F3475356F7078444974704878496F794A4A554F4D2F4C3178774F4F4365526A31334B4B426D417175397861737345797A5354435A6C4D544B714B454B6A6B6A413764382B315A38756A336C397146784A3969743155746B6D545963746E6E4265334C456670364874585830553768646D483463736271786A6C4530455561794E754A5667446B594147305271414D447257344B4B4B51494B44306F6F6F41357658375933463248476D787A497171444D31734A53707A2F64487A4D4D646761716C37677A2F494C766D56534A462B316F4658493445586C376359794D5A7272754B4453514746646154424F74394E6357455573736A67787330617378474230347A36314E59574D63476F7338476D7261527248743371714C35687A364B53667A41725878525168435555556C4D446D506943636548312F774375362F794E6561592F477653766947662B4B65582F414B37722F493135716F4262705573326873495634795152514F6E3430356C413447667A7046475230346F754F326F754F74496552673975394B78374367664D4D64365254473470363845456E705444312B6C4C514A45797477535479616D672B53596B2B6C5656507931596A49366B342B5770734D6461586C7A62585A6C685047376B486F61376E534E516A3147484D5943794C39354365522F396175465269497A376D706253376D744C684A6F47324F76362F57726355305A71566A305A554F6552556F794230716E6F7572322B71776A42435471506E6A4A2F5556703752576254526164796D55784947412B7457736436504B48576E426344464B775845334446524D647871557161416E72514178464F33432F6E55715241636E6B303956343655754B61514E6962514F6C41464C696C413470324A754A326F464C696A464142696A464B4F4253356F433467347053614B596141514E796161425330436B4D6C742F762F414956617174422F725077717A5773646A4B57346C4663482F77414A7271582F41447874662B2B572F77446971503841684E4E532F7743654E722F3379332F78564D726B5A336C4663482F776D757066383862582F766C762F6971502B4530314C2F6E6A612F3841664C662F41425641636A4F386F72672F2B4530314C2F6E6A612F3841664C662F414256482F4361616C2F7A7874663841766C762F414971674F526E655556776E2F4361616C2F7A7874663841766C762F4149716A2F684E4E532F3534327638413379332F414D56514C6B5A336446634A2F77414A7071582F41447874662B2B572F77446971503841684D39532F7743654E722F3379332F78564F772B526E643056776E2F41416D656F2F38415047312F3735622F414F4B7056385A616B7A41655461386E2B36332F414D56534432624F36363056794E33346E766265314D7579446342774370786E38367A492F48477153482F55326638413379332F414D5655715365786371456F376E6F4F63644B4258424C3430314E6D48377130432F376A632F38416A31536E786C663942426273783742572F774161647948426F376969754A7550474639625168705972597565775675762F6656565234333158595865437A486F4E72662F41425642504B642F535635372F77414A337175662B50657A49482B77332F78564E506A7A5651535049732F2B2B4779502F4871592B51322F6945366A516F304C44635A7751506F442F6A586E436735474B30745731613831615153336367594A7769714D4B7630716B69595573523071576152566B526B456E617634302F793973514A783134464551335030357161635948593756704174796F773759356F7867456A705438454C76505538436D4D41446A50413630444730754F514B4D6A384B6541565463657036554167497A785579676E493731457671616C697757357A516B44646878474233464563653838394B57586E4E4C48386F7A56497A4A6B6C65306D563761516F366E68683172743943312B4C556C454D784564304F326548397858427638783570417A7267676C53446B4D4F6F6F6154424F7836754D34706356797568654B56597262616B3244305766312F33765436313161345A515279434D676739717A7459744E4D514C5474764641464F6F42735163436C6F6F6F46634B4B5476533058414B4B4B4B41447452533055414A32707070394E49704168706F6F4E4A53754E453175666E2F437256564C582F5748365662726147786C50635A51614B516D724A754D6272555439445572486D6F58364771517479704C312F726969464C57542F574C7459657651306B315535537974386849627352564E41316F612B3243455941525237344651584639444247587A6E486F4B5979544C41704C3459446B4D4163666A78574C646D6565512B6178774F673441466155344B5735794E7539694B2B3143613863723979502B364F2F317153787469344765463938314846486C7473594752316230466156736F5537564F5142676E2F505375683253736A524D6538454D6366495A6A376B6A2F77437457644F427A735946765134352B6871336461744843436966764748596367566A7A3336545A3378474D2B716E7055525863745849684B556C654D456854794D396A54375674376269546765315535476157554D434D6E6A497251736B4843714D2F546D72566B56716131764B566933444A35787458726D7034355358415A6A6865546A2B564F7472594C434E33796E6B3448555A706B674375736366444E7953503452334E5A757A754B355A4E79356E5A6B6242485564765947716D6F366F624747575148644B7962554855627A302F4C72544A726D474C45635849487079536663316C61704C6D7A383872356744674651324F6F39616C515672736175596D52454D755343667157623669684C68574F4E702B762F3171667030713346784A464C62703554444D6B72456778442B396B2F79372F6C53616D7774336A53315244623433527A3751544C372B33303766576C7A704F787071564C36494D413449424C632B2F7743465635384B6E486356596B6C6431327553526E6759412F70555468464F35686E486233726D7257357444525873525771593559636D6E7A495861516E7365616445333778636B636E6E32703079344441455A4C6461794B52566B77414D394232465148676335796531574A4342394230717563732F504A37304462424633455A3665744F4A33756364756C425047425150656B4E4B776F7A6A363159695459755433706B4B5A2B632F68566E74564C51687535452F4F654B52542B46505A654B6A586B342F57714A4A42794B51357869675A3655754D6A4752514178634C6B2B76617433524E66754E4F5A596D4C54572F644431583647734A77536365395859396B6358412B592B74466B3977505237472B743951683832326B4444754F342B6F375659727936317537697A75466B7435536A2B6F364836697573307A7856444D77697631386D546F4A4239302F58307148466F615A30314954696B527736426B594D70484248494E4B5455447347633055436E59346F4749427853346F41706159684D555970614B414578534555366B4E4961474555773149523731453578556A524E616E39372B4657367057664D6D666172746251324D5A376A6151305545566F69434D31433534715A6878554C6A697251466152586237716B2B34464A466242473879516B676442696E4D377039316A2B5761547A474B37693549786E67597130726D4653636C6F7874784937664C39335062302B745A452B435371644D38736566725636376B4D4E6F6476384172474E5A38692B565A4941636B6A4A50765730465A47533769493341696A2B586439343978546275365944374C625A7966766B667971754A74676262313446576247304B714859344A354A503961306156726D7952483969574341504B354C48386679465A73696E6551467836393856765865436D31507634366B2F64465A4C71713555486352316F547675576B4D737246376839374879342F3150307270625331534750624641636479336573434F355A44684D376A334847507036565A463563484F365A2F7A715A4A73646D624E7A4F30635A36452F705649624347387953514F2F33694D63666E565A477435473354586A6276526C49782B504E4C4F596C516D50442F3757536635437057674A464B396A65496B695A537037642F3071336F6B34457069456F5357555A6A7942687364525748655851544C354A3744746E38366F3230747A476A4674366C5435734C4564474838736A2B564B55744C46577364587146314C47376F4849592F6544714D566C764A484B67533574345A46424A4155464F6535794F68344861725770336B642F70304639477038772F4B344841423735504948746D734E72745777704A56753237485030494F4B704B467276634E6244627449467762627A517850334877636534622F414F745766494F6D4F65665871617379534E6B2F317A5545536E424C454673394B3471317562513269394E52625A6430795A7867486B2B74537A4D444978375A78546F6C3248357570354E51544E6B6B3859395053736972465751376D506F4B55526C427965545367664E6E2F4F615632433839667251324E4C714D493741554975343437556E4C63314E43417145304A41325372786743706359485046563162352B74576D5534427856475A48777735707543446E74375538446A474B55594643416A4150584E4F474B4747426A6B34706E55635A706747506D357163664D764A714D6A4F4F657450584F4B424447794746574A46476367446B564756794D302F4A614D5A505469674378702B71336D6E766D336D495476477879702F44745856366634707462674B743270743544786E71702F4775475042347A5631576A686858715A4736306D6B7754615053593353564E3062426C50516735465041727A6D3176726D30666662797446374135422F437436793855796A356275414F5037305A7766797158467259704D36696C375653744E57737276416A6C327366344A42745036396175314E6D74783346704B4B4B5142696B70314A5259426A644B7233445951315A596356556E35645236314C4B69576249664E7A36566471706144442F685679746F62474D3979754C6D416A69654D2F384141682F6A516269442F6E74482F774239442F477565744C64726D59527151704F546B3831626C30746F74755A464F35676F7744337271644F4D585A7378556D2B68707450436638416C716E2F414830503861595347584B6B4548754F52575664576A577A4B724E754C44504658374862396B554167343638304F4B53756870746A5A467966616D6A6C4144786C756E6F4B6B6B774D3147334542623042716F6D4E58557A37746A4B2F734B7158783232365A3942566B676D324C5A35504E55395362646251742F655556756A4F4255746C5270464D7077692F4D666574534F6379715A475835423931423350624E5A434B306A663355556453656F71643768323277576850393535635978394432347170473656796138757767614E446C2B726E333950725651495245474A354A2F4F6F6F3138795A5934686C516544362B395733565A5A4244467945372B70396168757975614A6132515278777430626154366A6A3863644B6E4953456650437839775177716E4A754A5A6B2B56313464434F7634564764516C6A474659726A714F47782B64484D6D726A61643743334D7475574F4969507144564E6D6C417A48356B61397A7549465450716C7751517271506459775036556166416454752F4C6E6C64686A4A4A364B4F3951326870476573445372396F6B79593834516633762F414B314F33626C634E31497950714F6C62312F42477944596D794D44434B4230582F504E594573544F58786B496F4735683239767253746F5531636C3069596C62697A4A4953614D6C42364D5054366A4972456E79726B6450556574614673367861686268666C4B735077713166365554435A2F4B324B3349646567396D485566576F65713049636C46325A6A517953506C50765947526E7456304C73375A39367157386252584A522F6C4F5038347177375942504F63344663733733314E6F4E57754D6D6B626B5A717357475431705A4D6738382B33725455556C7532653571624633484B435353654D56484953375948547455737832664B765539366245674A4C4D4F42782B4E4342694D417546484A71517474536F743235796163783348464E497A627578305179774A4E614F303741654D597168414D47745149504A47616F437430363048706A7453734D48426F3755414E78786E7655654D484F616D55436B5A665367426E503178546B3763644B467A67656E38715665754B424431365A3755345977796B6539494D4141722B4E4B573436633041516E72394B6B553773626A534D6F3235787A534C316F41657777636A4F4B6C68636A726A3631475677656C506A394469674332684C67676B566F573270336C6E674A4B537639312B522F6A5751426E6B6347724D636A676745352B744672686336653038535153454C64524E45542F45767A4C2F694B31345A3470303378534B362B716D754978453644647552765548696D6F4C6932667A624F63676A75682F6D4F3953343968706E665A474B626D75617350452B4373576F707350547A5648483431304D55305538596B69645851394370794B6871785331486E705656786D6236565A4A41717648383072476F334B576862746868767771315665415962384B7356764859786C755A316C434A4A76746F4F41347745323942323647725538526C436257436C5733636A4E5A65684444757554674B4D565931646D437867456A6D747052664E59784B7570466A4F465A677856514F426A483836745771684C566565767A566C6E4A4979536334363173374173616744697447724A497036496F333935465A51655A4D657643494F724830714454377A37667072533443747947414F514D6630726D4E6175357074537543375A324F596C48393152366657746E776B41326E53353779382F6C564A57526850596D6B63526D4F4A754136566E744D725769712F4C784E6A465839545165596879636A707A5545646E4338686467574A39547857363249675A2F6C6D354F306B72474F70783171535A304B2B56455169667859424C4E396166637973574B6A436744484178554E6A457338337A3534394455795A31525767354645555A38766A504259395439505372576E78414B57484A787833716E497861666165426E62783246587271647250546D6C6843376C47426B5A4659314A47304670634C794649347A6353754969507573652F77434865734E352F504C65576D53503474684B2F77443171706D346C76626A7A4C6D5270435154676E696F376A5570396D3164714944674B6F774B79556D614B4B6570504D306B4D62534F4649582B366636477466535557326742624C547A6747516E6855587267657072466151793245415A5268356C5675765469746959346C6E783637667772536E715A79305A5063337146586B666F6F5048394B72366773567270796F634752526C38487178362F34666857664F7832717659756F503836715830726D33795736742F53726C6F53527732307A5377335042517941415A2B59382F657836653962647471775336614D4E67466A792F437566636476722B64556F46486D6E714E6F55443241544E5A794D57586E36316B6E5A48504A63323573366E5A784B50744E7541497964724952676F3358413941665373695144494A774D636E6E70562F7A6E6654384D636C5A436D6535414847665538316C335445796265315A31563778765231694D487A6E646A48705477676A47545573536A614F4B6A6D354F4B784E2B68426E6532345A795467552B544563657A50546A2F4769415966507055637A4576673030534D556454543855384155553053535139654B3075664A41485164717A344238316154663674506F61594666414F5161544742546D366D67397141476A48307057475237696D3938556F366730414E492B58506567646367552F3171506F324B414A31414979447A515151434B4536666854332B364B424550384A42706F7744696E4F4D4E54527761414A564F52672F6E54674F654F4B6A586B633034486A5070514259583150656E3738634C30714C4F526D6E5A364367427A5373423630785A41684A5537632B394F50536F335545476759733870494A6368683630746C71567A70386D2B326B49582B4A44797071746B676B553255414C6D6B3163466F647459612F62333057306B5254416378736576303961314C555A5148317279754A696271455A4F444950353136786244454B4432724A717866517451384E553951772F6571617459374755747A2F396B3D);
INSERT INTO `users` VALUES ('23', '', '', '', '$2y$10$0MwZtg7ighElhx43CmCrLu.olcqCXCaH4gMJmiTqx1fl/LQVgrfKG', null, null, '', '1', '2019-05-06 11:42:34', '2019-05-06 11:42:34', '18710077000', null);
INSERT INTO `users` VALUES ('24', '', '', '', '$2y$10$eVQsjwn6.8qIyQsdf4m9b.GSzo6KiPPgINubPzpiO7OzRauN7HapG', null, null, '', '1', '2019-05-06 11:43:54', '2019-05-06 11:43:54', '18710077003', null);
INSERT INTO `users` VALUES ('25', '', '', '', '$2y$10$5Ip6SPj03TSXEkVSE0rb4u..n4tH3529OgY2fmTwDFGZ3JJ.3RkV6', null, null, '', '1', '2019-05-06 11:44:45', '2019-05-06 11:44:45', '18710077004', null);
INSERT INTO `users` VALUES ('26', '18710077005', '', '', '$2y$10$AAPP1bjPf0gNmdrdx8ISxeQ7ExoeZg3g.9IpxqZIEibZ1niPtWbcO', null, null, '', '1', '2019-05-06 11:46:02', '2019-05-06 11:46:02', '18710077005', null);
INSERT INTO `users` VALUES ('27', '18710077006', '', '', '$2y$10$FBbhmdT5elktf0cP9ahB0u0g.qeC0vThQl6W0ZPTq3eVmKmHImI5e', null, null, '', '1', '2019-05-06 11:59:43', '2019-05-06 11:59:43', '18710077006', null);
INSERT INTO `users` VALUES ('28', '18710077007', '', '', '$2y$10$1XIHAiSLpyNb4DrIH738Suv2Krppi3I4W5wOg4jhhL4N5JVZwfaO2', null, null, '', '1', '2019-05-07 04:23:04', '2019-05-07 04:23:04', '18710077007', null);
INSERT INTO `users` VALUES ('29', '18710077008', '18710077009@qq.com', 'M', '$2y$10$u2FbB1GgZzWya9gJS7dA9ucYQgjClMm0VimHWcDl1CDCHy6K/qSFG', null, null, '1871007700', '1', '2019-05-07 04:56:24', '2019-05-08 11:57:51', '18710077009', 0x646174613A696D6167652F6A7065673B6261736536342C2F396A2F34414151536B5A4A5267414241514141415141424141442F327742444142414C4441344D4368414F445134534552415447436761474259574744456A4A52306F4F6A4D3950446B7A4F4464415346784F514552585254633455473152563139695A32686E506B31786558426B6546786C5A32502F327742444152455345686756474338614769396A516A684359324E6A59324E6A59324E6A59324E6A59324E6A59324E6A59324E6A59324E6A59324E6A59324E6A59324E6A59324E6A59324E6A59324E6A59324E6A59324E6A5932502F7741415243414567415341444153494141684542417845422F38514147774141415155424151414141414141414141414141414141414543417751464267662F7841424145414142417749454241494941776344417755414141414241414944424245464569457845794A4255544A684268597A63584B6873644655675A455546534E4355704C424E474C784A44586863344B547776442F7841415A415141444151454241414141414141414141414141414141415149444241582F7841416745514542414149434177414441514141414141414141414141514952417945534D55454545794A522F396F4144414D4241414952417845415077446E2F6D6A70593355314E565330726E4F68646C635261397455745456793152627863764C657761304E477535305364305330644A46564F5A4761674D6C65367A575A622F7162364B6475454849476D662F414B68305A6B624547337542352F6B556C44505355314B386957534F7166635A78486D79742F32366A5539314E5434714B656D4C654B5A5A4778755A474F45426C422F336232386B4A2F7266537257596561536E696C346D626957307462635830376855757569573549414A4E687345696C704E7A3245495167424B684344434549515951684B67424345494153704571415243454A41364E6865344142587749364F4579503841463043576B6945556645663276717375736E64557A33486847797874387270763178342B56396957563952495A4A44703043474E4A476F33364A6A6631734E676C7A4F4F6A5861667A4F2F7746744A70785A353231596139736265546D6431386B6A6958617635764A4E6A4141303043527841766332545A47764C6E36754E6D68516C6A6E6E4B7A6C5A3150645752433651423739474459643035325267734E753641726C7555574143715453616C7253435276354B65563770547734394F3554544532495741755567706C684F7043554E4E386F314B6D646F62445539536B5A7938316B6256496C695949334148563533505A58596E4E63776872736F614E2B367143545462556A645474446F36553262636E564932644C453453484B5164564E545345386A2F414E557A517537416C5045655535687072716A5A4C61416841576A597656486B6A716849776843456745495167796F516842684345494153704571414549367055414A4549514172464644785A626E59617141416B3247355772454730395063364143354B7A7A79314E4E754C486433666972696B2B5350684E2F6D33397979533749414F716B6E6C347372705847774F337556654A706C666D64664C303830384D64526879352B575730735A76626344793671646A637850526F544C45576177326433374254734144637570412F5657357148477876626C5336446D654C396D6F4A62474C6B5863646D704D32573733324C6A73454555764C74586E334E43593570747A62646B396F49475A77416432534F49767136336B4E30476A634C4E794D2F397A2B796A63304F75476244643364545A533677497330624E55384E4F5A4E414C41616B7162546B5A37596378387577546D30354C77434F556272556253336B34624E43664A5331464F324D434A6A626D32705532726D4C496243487A614E75504A58355948525241323047684374307443654B3064504535583330325A6A723669316B746E7079557349624C65334B64776E52437A69782F3548757443706779734C547530322F4A566D52356D3247376451716C5459596C534A5671314856434F7145674549516B416843454756434F714541495168426C51684341457152434145495374626D63416C765236333657714B4C4D374D646B33465A3942434435755677577036653536433558503155726E766338376C597A2B737474382F347738554D3874335736445A53556763646576304371746136523441334B306F6D4E62614D57733356785773634F562B4A6F325A5757747A4642356232334369664B51346748795465495737364B6D64546A6C4E33654C364A686331707A76504E73304B4A723353676E56726568366B7038634C57794237395864415546496B356E6167325064537877746164726C45624353644C6B713348466C41754C6B71625679475177416B4632333157724254434B4C4F37636132376C525538517A5A6A3032437354502F694E6961535862324864535A6B5565514635414C3337655364465346784C6E486656573461634E333150552F3456324B433532314B4E44656C616D6F67305A6E6275566730347932746F726F6A4143527A5574463562637269644F477A4F4852327179697A495154333158535972446D4A6432574C5552746141656949723347556C534A5675304856434F7145674549516B41684356426843454945434549515A554951674243454941566D696A7A79583642567871624C54703269476E4C764B367A7A7570707477343779327134724E707767664D72416C65584F73465A7270792B556D36704133492B61574536527A35377178434D677A396467725A47575033366C563665306B686B63624D6A2B615757626950796A337252787A7674494462706370756863637830472F32436131347A5A4276314B613656726E33614F567567387967766457325061305A6E43326D67546D4579795841303831586A4265627532332F415043303661484B304F665964676C62706369616E6944514356626A596334445158505036414A6A473541487547596E594B566E47796C6B594453343939542F414F464B6C6D535673445774614D306A6A5941626B717852307868426B6C494D7A39376450636D5564433242786B634D3072744C6E6F46705177613569626E75694A744C4645586537743356324E6F6145786A62624A3430545254725754584A784B616455556F6F5663516530726E70575A6D79523957727170473343353673694C4B783976433974314C57567A4B56496C573751645549366F5341516843514356496C51595168434145495167465168434443454A3854444A4947684B336F536254306348454F5A3368435A696C5A7732384B4F336D72637A32556C4D6464656E6D75646E6C4C3543346C59542B7136372F474B4751334F7536694F39676E4F76667A546F6F39644E5374353038374B32314B485A57426A656D7054576B6D354736613432646C483670392B47776C43616249374C796A7845616C543038524A424F67417571385463357A6B4C5467613032613436626E7A537450474A6153472F4D52796A71723855655A7749626E49325352517956466D4E5A6B6A376C625648544D68626F4E65366866704644514F636330727A6679576842544D6A384C624A375737414B654E714557694F4D44594B646F736B614534424F4A707A516E674A674E6B374D6D6B705453676C4342456268634C4A784F4F32575473624C5A746F716462454A496E44795531654E37565055756A2F457A2F4C374A6655796A2F457A2F41432B7936524B75686A35354F6139544B503841457A2F4C374939544B503841457A2F4C374C705549486E6D3572314D6F2F784D2F774176736A314D6F2F784D2F77417673756C51676565582B756139544B5038545038414C374939544B5038545038414C374C70554948374D763841584E657074482B4A6E2B583252366D3066346D6635665A64496979422B7A4A7A667162522F695A2F6C396B657074482B496E2B5832585357525A47682B7A4A7A6671625366695A2F6C396B6570744A2B4A6E2B5832585357525A4C512F5A6D3437452F5254396E706E7A55737A6E35426374666255666B73716A6945635A6B643831364A4B41596E67692F4B56357869633468703867334B783566386A763841773776655758786D596C56636155687075304C4F6471646B357A794C71504D3578314B4D5A6F2B5850644B31706355397A673175567154526F53487A47765A55777047373353587A4F413348564C34575747704B526F467730485537706F576F686D4961304379303656384D494C6E327A4C4D70324F6534745962616272576F73473477752B55685256786267784E747A594142586F73566941467A757166376A41466F3562447A436137424A67644A477046573146696C4F54346C64687159354C5A58445663692F4461706E555756696A343044686D4C67504E47783475766155384B68525463526F75626C586D6D3663525A6F4F646C33566553735A475463374A38354755724971596E50754D783152614A4E707063646942734E46432F48694E4146522F6452652B354C6C596877714E6835786634696C74586A49664A693878746C7659714A324C794D365A676536306F6153426D6F593153476E707A764733394578303646563669715A54765931344E6E6465796E57526972326D74695A4A6F77445661353279644D654C487979315679544561646A43376941323644636C54303077714947796757446C7A5761484E4E6E64594148682B39625743794F6651744236456852686E626532764C7854444863614345445A433163775168434146484E4A776F793739464971574A53354953304335385836454B735A756E4A757178784B614F51463461576E6F434374526A737A413464526463785055475A7742476F30334A5852556238314F3061386F445437374C626C77385A4B764F61696443524B7564426B756B542F6356354A696C534A36673566433354566574542B776B2B452F52654E6C6F4F7568506D73383532367678382F475A496A716B38675079436B4C522F4F626E6F477032747555426A556C584C6149326234745432535831755572694164464339344876546B5A334C52487673377A543454726671713137717A53367A414A32644D3863743173596442596C78473633616551524E3132437159644343304C516E6F754A47514352376C6A5854746C34686A6D55384F4631726474537145324B5673425936567274645264783256716E776872616B6C39794F684B73343768736C5448464C4177504C526C6341726D6B575573654C7A5538454C36756D4C593542796B4739317277634B7268457364694375616F7347714A3559673647566A576E6D4C7A6F417571707159553957324F4B2F42654E64504365364C4A38544C59536B76464D574C586A427373365349746D446C71514337416C426C32676D4371694D587556646C5A6479694D5A4453377430376F7053736A4573526252744C57744C6E6E77746275342F5A632F46693164577A793561694B6D794E4A7338372B5158525255704E512B6164755A7A394C442B554C466D3947716A39706B6445496E5275324C7A736E6A70563755616245635671673930636D664A7A456453722B473433493532536F6362396E477976345468483775696B3472672B5354664C73416E6675616E6E6B75364D45585252493764564B36685A5667584A6134624F436D6E6E5A424735386D624B33664B307550364456514D78474352676577795A53384D356F334E314A734E7746725A4C31584E6A6C5A64347338594753376D6D35664A7571313665426C5043324F4D636F544B69725A546876457541516245445334364C4D69394A364B5868355753444F51427A526E667944722F4A4C4847543076506C7A7A6D736D32684151715A68434549415546544532574D33424A476F74756C714B694F6D6A346B75624C65334B77755036414655686A6C455A544665653446372F73386C766F6E4C7273657531646C47654D53616477485167432F3157784847324E6761305741564E324C55545852423077615A7951304F4755364139445971752F30696F515743486A544F6362414D6949387574766371797A7558745679323177676F766F4569684B4F6632456E776E364C7867506157334A5873302F734A506750305868705052545A746547576C34537362714145795770485456564465323653364A46584F6E4F6B6337644D4A755549546A4F335A574335566D6D3071477173313256313150487548646A644B7277647068513556755278687A5668594B34506A61623768644642624B4669364B7153554F5A325A70313749464E4B4434417452725155384D5169316E74686E6352666C437378775A64536271664A5A4934674255573971306735686F72304465525574334261455135555171676B484D6B793343664A346B3169424661576D4C764136785663303837657857705A4756476A386D63326D6C663439465A6A70386732566F4E534F533050496D4B7A6D43696B654A2B4152617A374E3336446D30574E773463536E6868714A6A57544E6B476269524E626C614E535259433754746671756C633172685A7A5152324955556C4A5479352B4A4378326475563178754F793363376E32553758303468705853525350644D30634D364E614C394F7574767A4B794961656161566C4B795363484E6C4462456C6E6134456849413877757A4F4755546F68476157497361334B473564414C33742B715232465544346D5275704953786E68426273675662594347414533494770537047744447687251413043774136424B6742434549436C692F774432757174767733665263593643305264774C484C767766384150435864564E4A5431624D6C544379566C37355843345658397959582B42672F7351506A4E714935706F4D4B44424542772F4649334E63384D3657584C50455763484A5443514E4C39474E734466746E2F7741666C646567773462525146726F71574A685943476C72625776756E2F736C4F5763506752354C57746C434C65396A346641334C4247332B6C6F47317569656A5941446F684249352F59536641666F76446D747556376A5037435434543946346A48594E4A4B5661595464527538535379666C73626C467571517068466B306853736264795937644D7244564E436377793331364B464B3035534369396C6A645631654156466F773037744E6C31644F2B34433454444A444849776763722B713679696D754173624E56317A754E316A6C4D30716C432B34566C7051697849536F5A546F6E45364B47563179416D554E5A713457576C4634466E5165327374466D794A53795153654A52683169704A4E30777430756752493131303446566D7673564B31344B416C756D4F636B7A65616A63344A62456A555168433359424345494151684341454951674243456E56414B554451493670436B4362705367493354434B6632456E7748364C7863783557414C326D5966775A50685030586A637A7779326D76514B61764371356262645275762B5A547937636E636F68595A4A4E556F5A78626B6A74314B694456504F4C75734F69624942477A7A4B5973566E4378736B48524B64536B75715A31316A6F5959734C5A6C424467413558614B573751567A314C6A4A62536D6E6D4632327343746244354D306253336179793549364F4B3961644C547933617272487248706E72516A646F6F6C585974357268564B7958676750364B5A726C48557869574F78544B653262486A4554616B4E4A73543332577A44584E633239317A7458687776646F5351635A6E4B346E524A64786C616C646A63464B3443516B754F7A57693553515979796F466D4E6330396E4251515959795351797646334871566F7755555448584452644E5038794A346D38674A334B436370557577736F5A447168414D6C676F33794A72696F58755358493651714B6F6E4545655A33754138314D732F4653476949753161486172706A6D34354D73704B6246694D6A334737426B47397569304775446D6877324F6F575658507047306F4D6257356E6A6C734C4B2F5241696B6A7A6235516E56357961386F734243454B5751516843415251564653326E467A715430552F565A4E5339347847777933365A746C65474F3732793563376A4F6A6A693561376D6A475661454D7A5A3477396875437368314C5530346B6C5042735162334F67397966365050653647572F6844685A613534592B4E79782B4F6669354F547A6D4F583173495141686337744D6E30676B502B302F5265485A6E504E7A6372334366574354345439463467376B4E6830335371735453726C4F79305759376C566D4E7A75485A61424757506251425374574975346B7174492F4F2F77416770706E35526B48694F3669613237674578657A41323554546F56624462445A56794E3030574937726577476F7530786E64705746617855394855476E6E61386244644C4B6268345878727649437238525750527A43534E726D6D3449577241515669366232734F6D5A474C766341453056634A6263794E4138796D5656473271694C584532505A63726957477A30556E49357A6F6A334F794659597A4B3672715831464D3461794E4B6645324358566A3233374C696F6E31455A766B635739727135432B73634C78774F50754F71626F2F526A386467487851654E345366764F6D5964584C6C32747846777559434C64584F55456A71736B677867487A4B57796E426A3964573746615A32306972747853436162687876446A354C416F734E714B36594352783466577936576E77756E70326A687867456462493759386D4F4F4E4F7554716D5055376D5A51717372724952485571725677766C4C514768375275306D32716457566B4E46415A7033467242755130752B696F6E486164304A6C6967715A4130687232694F7859547343485731393131304F4F585633457A36597559476D6D5A5A75335074386C626761356B4C4775385146697137735162484132576147654C4D374B47756143373332424F6967626A6C45366378417A3341422F77424F2F722B53657A75567331576F68493033614433386B715242496C516741374B6C5830417177484135586A59715773716D306B426C4C58504F7A577447726A3041576363662F684D642B3736724D64584D356267645476302F4A50484B343363546C6A4D70724A43634B72706947537A3269486D5374656B706F3657467355597342383145797659344D4D6B55734F63484B4A414E6265346C527478654353544A547856457A68346D746A4C5330642B617976506B797A6D7179342B484843376E746F4A4F7142736C57625A484E37435434543946346B386335373358743033735A5068503058697A6D366B6E766F70725441366B6A75623239796B71356547334944636C503473644E447271386A51425A376E4637726C4A5A42726478335538456561355449786D65417230446244554A6847396F416432564D69344376564873335830364B7332504D577454537245456C4D4F6856783741484733525633734E796A61624770677549474A776865644F685857306C52653271383761533033476858525952696563434E3573386265617A79782B787278352F4B3765463259424C55557A4A3479317A5162716A52564163427271744F4E32594B49763164756171734B6C676B4A684E78324B574230734F6A3257383130376F577944554B4934657878325430326E50646172482F61584F3073542B53574768645576752F514C5862687241623256714F4273657752704E352B6B4E4E544D6759477447696B666F464937514B724E4A61364757376C55457A374C50715A736F4B6C714A72417167344F6D6663374B6256794F6F783572354B44684D4C3779534E625A6873534364656F364C6E424246465350456F4D67446A5A6B726A4947767459414E31313032755433585A545152547379544D6139765A775457556C4F78346579466A584E626C424132485A644C6A594E4E546D4D307232762F67677935474E327351375659644C4551326E66776A6D757A6D3466753638502F37666D7534665155736B5A6A6654786C684A4A47585335304B722F75504337572F59594C442F41474944514779456A477459774E614C4E614C41646B714145626F5145425578427233553768477A4D372F315447514F346341756361397A70794A71517A557047554F6E725850684C74397932332B46314D315044554E797A52746B6144657A6866564F6447777379466A63682F6C746F6B474A566755356F754F58556A5846305A69696D646C41796D3172573176354C4D6A6C616172396F34787950415A6B474A7534673137663458557830564C45316A57514D6131684A61414E69643034306C4F475A42424747373279684830657A324E797444515362433179626C50736B43564D6B632B6B456E776E364C78596B6E366C65307A2B786B2B452F52654E787842397934325944715647545442454972744D6A74752F645264537036695553484B7A5267324361324B355A652B70536179646254556B576C2B7056706A627948736C6859477430374A385973484875565356616F626357506452783247717356497331703664564364744F67545367414A767031555432324A486458496D3645714356764D30394C6F436B34574E6B52756378344C54596854534D35796F6D742F694149547274302B463469624E447A597270714F72446744646352464757674661644C565352573130574C706B3348635253583255776375656F735442417A4661544B746A68346B355533466F35776B632F525554564E37714B5373467430576C4D5679575777575A5531494256656574766F30334B676148534F75564E7253596C35706E2B536E79426F38302B4F4D414B544A3155365062715549534C71634A554A4571414549516777684345414A436C53494143556F61676F41516B51676B632F735A5068503058693873756D55614E48526530542B776B2B452F52654D55304845356E44726F7072586A4C54785A3557357665725676346A644E4155335153584F67556B5A44794C4B507265332B56694E746B73646948447A534452703154685A72643962367139736B4E594C7743326D71726B454D50364B656F6548514475317969466E466F4B433066434C48556145617174564135744F6D775670344E394E677135353668336B4555494332386C764A51784E7A56494137713447356A666F5156586F323571752F596F476D7579505142544E5A6F6E745A73706D784C42764541615273534650464E4B7A5A796349745649794C5642773574524B644C7062766564535649794657493455487653474B4C585658596F67416C5A465A574774434E4A7449316D69567A4C41715142493458544C6266574269474F565557495355744A54746B4D66694A314B33317975664C36543159796B6B3246373662446F74366A3866475A57372B513434376937534136695A2B682B36314D4478562B4A527963534D4D6647514342742F2B30545A34327350475941386C6F4669644262725A5576524A325A316365377766716C3672544F595A6356796B3170306945445A437078424856434547513772427848484B6D47756B703657426A2B483469372F414A5739315845562B4978552F704469456232363344626B394C42526E75547030666A3434334B7A4A6F4E78374643534253524574467A622F6C616D44596D2F455935654C474753526B4167624C6C4A4D5659584F4D5A79746350366C72656864553271646942614E47766263393733555935573130632F48686A68363158547055424B646C733839464E3743543454394635477877696974354C317962324D6E776E364C786957572F4B464661385A4879473555744C4A6F716C2B556B70394D367A30615676343032764F552B536358356F584548573456495348572F5A494A76345432445336523653756C7A467A664E4E6963544B4235717148574E79564A47386B744930494B634B787079614E64627146563844334F4A3330567345634E742B716F7A654D332F7152536B506A59517A5873536F384E5A6D714C39314F65576E633772597154436F72506165345374364F52734D6930436D5A47703434377348755467797857656D6B706769315432784B784847437052476A5237514D6A5537573254777850445546614774556F616B614C4B533271456B79704345394756413232467A574B594A577959684C55556B72514A664663324956794C306A707073786A686C646C414A356F37616D77317A6271334669636374472B704D636B62474F796B5041766362374779364E625938664C6C7833654C6E7A67654D387638646E4B4C446E4F69313841777962446F35544F344638684249627142622F414A56714846614F64704D637A584F42494C576B4567674532304A364252535935525238484D393434725134576A4C725832427466564C54546B2F4A7A7A7838613077685A636550554D6B3343612B584D54793368667A64794E4F693145334F45464152756B59584E2B6B47425646632B5A314B79456D57504C7A75745A3178727365793336696F6A706F6E5354534E6A6A614E584F49412B616F6E476F5852515355385574533262776D4C4B6247313748585170687947482B68324C557464444E4B796B657950784E34683138396C316D423457374434333854494A487459313258726C42312B61735259725275685A4A4C4F796E7A5873795A375775304A423076354A73474E59644F3178465A41306878615136526F50315346582F636C4B527042414C54634855454954434F6632456E776E364C78472B684B39756E39684A384A2B6938524935624B6130347A5471304475552B486C656D472B7964486F34585171653031774861584E776D4F3042417435704339523671644C32552B394F61374B35705566564F47685453316D53586961626271744B5478416B676B4A44476441645553456351375753744569323574344130486579304D4E6876493156346F7335615063747A4436634E4930555663693748465A7152374C485A57324E73454F6A7A4A464B6868314E6C59795756646F4D6377763157674733434274587936703256545A416B745A42625271554452524856344156693277515A414538424E7A4271514F5051464E4C6D34616156386A5A42506146347976796C3779476A58624D516474745672314E505344415130773852376758514D4E6E4739756747672F4C5262346869424244476774304668736B69705949584F644645786863626B6757755675353248454455384B5546743872706E4E614F566A5330674165647A722B617A63556445614C444C737A6C6B4C4151597952636757314C48412F5664532F44614A3465483030524568446E336234694F366C2F5A594D38622B457A4E454D724462776A7951653348595549344D5967655969775268784A6243626D34497470474F7137554A4F477A506E796A4E61312B746B354F6A3643684345677A73636C6244514F632B557841754453513170334E756F4B776F6A4C4852307A515A41774E6331737A346E4777324758683978314F71367438544A434D37513678754C3946544F4334595358476868755463387158304D366D3430314E68384C58667335655A4D7834594A494637477A775472762B61685978314978313851627848546B4E6A6448487A36674853312F3058515155304E4E474934496D7873476F44516E4E6769627149326733766533565036564F41734571454A476A6E39684A384A2B693852636456376455663665543454394634663231537254436A334962664D6E6B45646B77623351725264307531376F41734E55446D3353556273556F31487651626761376F423051536472725A576A707568334D346539524E6471564B773346764E5361322B76665354526D4F78413342367272634772344B36454668797944646E56635757677A637776594B536E71583073346C686357766274627171386478486C717652516567557242626455634678574846594F6A5A326A6D5A2F6B4C55345955617356755656714938334D4E777245527647436C4D524F796447334B4C4A41345754486B424B5259704D704A514562476A506D4B6B4458504F31676E736A37715143796367744D6245477031676E4941526F747271467A33726C686E394E522F5950756A3179777A2B6D6F2F734833577A4C78726F554C6E76584C445036616A2B77666448726A686E394E522F5950756A51386136464335373178777A2B6D662B77666448726C686E394E522F59507567654F546F5569786F665361696D5A6E597961336D30666456582B6D75467365574674526347326A423930747A612F315A796230365246317A667270686C72354B6E2B7766645374394C634F4942797A6A33734833524B6E777339743943776D656C6D48534535577A324858494C66565175394E734B456E444171484F386D433331515771364A497562643662345330324C616E2B7766644966546E43522F4C552F3841786A376F486A58513148734A50675030586949466C336D4D2B6D734652517951554555676449334C7848365A622B53346472627573455665453137496644666F694E70633634436338444D476854675A59795276737056395658447A325462583138314934584A614F6961644C6B624452436A58472F354A42736C7474644B426335522B61434B305746302B4C62336C4E7663324852534E3642494869397937716B4E79646C4B52796739564848664E64584764574B6430314B397338627978773249586359446A30654A4D4555316F3667644F6A764D4C6858757532795A4849364E3753306C72687148446F55576245756E71345175597748306E624C6B70385263475032624C306437313141317435692B697A733075585A4C4A51314B453849477A57684C5A4B68424551684B6A59662F5A);
INSERT INTO `users` VALUES ('30', '18710099001', '', '', '$2y$10$qwXn4xqJTkcHfkcc6FowHu7vEWe8/ip5ocv9Tl6bzX1IvR7z8DDQ2', null, null, '', '1', '2019-05-07 06:16:37', '2019-05-07 06:16:37', '18710099001', null);
INSERT INTO `users` VALUES ('31', '18710011001', '', '', '$2y$10$MziR4xVXUHn2kTK3S0v60eu1ZgW8XHu9MG4BIX9AFRp0KF0M9KwOW', null, null, '', '1', '2019-05-07 06:17:16', '2019-05-07 06:17:16', '18710011001', null);
INSERT INTO `users` VALUES ('32', '18710011002', '', '', '$2y$10$.wi7o8xeLVbMNQBl9OqXc.ZdHHs8YLPvX.pDPVTD63hKoU9hv6oH2', null, null, '', '1', '2019-05-07 06:21:17', '2019-05-07 06:21:17', '18710011002', null);
INSERT INTO `users` VALUES ('34', '13381039822', '', '', '$2y$10$gMxCQcS3lu9nq9MAkS0Uwu27bHgxXyDZw5csQ7NoRApNuFyYaRWSm', null, null, '', '1', '2019-05-07 14:17:17', '2019-05-07 14:17:17', '13381039822', null);
INSERT INTO `users` VALUES ('35', '17600199331', '', '', '$2y$10$P1RVqvsgyAF.HU5ChAkOxe7RMIMprsO.SQKwpcSqQs6lvUfkH6gxe', null, null, '', '1', '2019-05-10 04:41:45', '2019-05-17 09:54:56', '17600199331', null);

-- ----------------------------
-- Table structure for `video--`
-- ----------------------------
DROP TABLE IF EXISTS `video--`;
CREATE TABLE `video--` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `vid` char(20) NOT NULL DEFAULT '',
  `title` char(80) NOT NULL DEFAULT '',
  `subtitle` char(80) NOT NULL DEFAULT '',
  `source` char(50) DEFAULT '',
  `sourcelink` char(200) NOT NULL DEFAULT '',
  `author` char(50) NOT NULL DEFAULT '',
  `categoryid` mediumint(8) NOT NULL DEFAULT '0',
  `thumb` char(150) NOT NULL DEFAULT '',
  `keyword` char(50) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `duration` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `video_status` tinyint(1) NOT NULL DEFAULT '20',
  `url` char(200) NOT NULL DEFAULT '',
  `islink` tinyint(1) NOT NULL DEFAULT '0',
  `hits` int(10) NOT NULL DEFAULT '0',
  `digs` int(11) NOT NULL DEFAULT '0',
  `stamps` int(11) NOT NULL DEFAULT '0',
  `toptime` int(11) NOT NULL DEFAULT '0',
  `createtime` int(11) NOT NULL DEFAULT '0',
  `listorder` mediumint(8) NOT NULL DEFAULT '0',
  `pubtime` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `categoryid` (`categoryid`),
  KEY `status` (`status`,`video_status`) USING BTREE,
  KEY `listorder` (`listorder`),
  KEY `toptime` (`toptime`)
) ENGINE=InnoDB AUTO_INCREMENT=248 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of video--
-- ----------------------------

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
  `pushed` tinyint(1) NOT NULL DEFAULT '0' COMMENT '公共',
  `description` text NOT NULL COMMENT '简介',
  `duration` int(11) NOT NULL DEFAULT '0' COMMENT '时长',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'é»˜è®¤0 -1å·²åˆ é™¤',
  `video_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '视频状态',
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

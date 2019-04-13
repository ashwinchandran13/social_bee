/*
SQLyog Ultimate v10.00 Beta1
MySQL - 5.5.15 : Database - social_bee
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`social_bee` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `social_bee`;

/*Table structure for table `tbl_comment_history_table` */

DROP TABLE IF EXISTS `tbl_comment_history_table`;

CREATE TABLE `tbl_comment_history_table` (
  `comment_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_parent_id` bigint(20) unsigned DEFAULT NULL,
  `post_id` bigint(20) unsigned NOT NULL,
  `message` varchar(1000) NOT NULL,
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` varchar(50) NOT NULL,
  `updated_by` varchar(50) DEFAULT NULL,
  `like_count` tinyint(3) unsigned DEFAULT NULL,
  PRIMARY KEY (`comment_id`),
  KEY `fk_tbl_comment_history_table_post_id` (`post_id`),
  KEY `fk_tbl_comment_history_table_post_created_by` (`created_by`),
  KEY `fk_tbl_comment_history_table_post_id_updated_bye` (`updated_by`),
  KEY `fk_tbl_comment_history_table_post_id_comment_parent` (`comment_parent_id`),
  CONSTRAINT `fk_tbl_comment_history_table_post_id_comment_parent` FOREIGN KEY (`comment_parent_id`) REFERENCES `tbl_comment_history_table` (`comment_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_tbl_comment_history_table_post_created_by` FOREIGN KEY (`created_by`) REFERENCES `tbl_login` (`user_name`) ON UPDATE CASCADE,
  CONSTRAINT `fk_tbl_comment_history_table_post_id` FOREIGN KEY (`post_id`) REFERENCES `tbl_post` (`post_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_tbl_comment_history_table_post_id_updated_bye` FOREIGN KEY (`updated_by`) REFERENCES `tbl_login` (`user_name`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tbl_comment_history_table` */

/*Table structure for table `tbl_like_history` */

DROP TABLE IF EXISTS `tbl_like_history`;

CREATE TABLE `tbl_like_history` (
  `like_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) unsigned NOT NULL,
  `liked_by` varchar(50) NOT NULL,
  `like_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`like_id`),
  UNIQUE KEY `UNQ_LIKE_POST` (`like_id`,`post_id`),
  KEY `fk_tbl_like_history_post_id` (`post_id`),
  KEY `fk_tbl_like_history_liked_by` (`liked_by`),
  CONSTRAINT `fk_tbl_like_history_post_id` FOREIGN KEY (`post_id`) REFERENCES `tbl_post` (`post_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_tbl_like_history_liked_by` FOREIGN KEY (`liked_by`) REFERENCES `tbl_login` (`user_name`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tbl_like_history` */

/*Table structure for table `tbl_login` */

DROP TABLE IF EXISTS `tbl_login`;

CREATE TABLE `tbl_login` (
  `user_name` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `user_type` varchar(20) NOT NULL,
  PRIMARY KEY (`user_name`),
  KEY `tbl_login_user_type_fk` (`user_type`),
  CONSTRAINT `tbl_login_user_type_fk` FOREIGN KEY (`user_type`) REFERENCES `tbl_user_type` (`user_type`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tbl_login` */

/*Table structure for table `tbl_notification` */

DROP TABLE IF EXISTS `tbl_notification`;

CREATE TABLE `tbl_notification` (
  `notification_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `notification_user` varchar(20) NOT NULL,
  `notification_message` varchar(100) NOT NULL,
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_read` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`notification_id`),
  KEY `tbl_notification_user_fk` (`notification_user`),
  CONSTRAINT `tbl_notification_user_fk` FOREIGN KEY (`notification_user`) REFERENCES `tbl_login` (`user_name`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tbl_notification` */

/*Table structure for table `tbl_organization` */

DROP TABLE IF EXISTS `tbl_organization`;

CREATE TABLE `tbl_organization` (
  `organization_name` varchar(100) NOT NULL,
  `email_id` varchar(50) NOT NULL,
  `contact_no` varchar(15) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `organization_type` varchar(20) NOT NULL,
  PRIMARY KEY (`organization_name`),
  KEY `tbl_organization_org_type` (`organization_type`),
  CONSTRAINT `tbl_organization_org_type` FOREIGN KEY (`organization_type`) REFERENCES `tbl_organization_type` (`name`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tbl_organization` */

/*Table structure for table `tbl_organization_type` */

DROP TABLE IF EXISTS `tbl_organization_type`;

CREATE TABLE `tbl_organization_type` (
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tbl_organization_type` */

/*Table structure for table `tbl_post` */

DROP TABLE IF EXISTS `tbl_post`;

CREATE TABLE `tbl_post` (
  `post_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_parent_id` bigint(20) unsigned DEFAULT NULL,
  `post_type` varchar(20) NOT NULL,
  `post_content` varchar(10000) NOT NULL,
  `created_time` timestamp NULL DEFAULT NULL,
  `updated_time` timestamp NULL DEFAULT NULL,
  `created_by` varchar(50) NOT NULL,
  `updated_by` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`post_id`),
  KEY `tbl_post_created_by` (`created_by`),
  KEY `tbl_post_updated_by` (`updated_by`),
  KEY `tbl_post_parent_post` (`post_parent_id`),
  CONSTRAINT `tbl_post_created_by` FOREIGN KEY (`created_by`) REFERENCES `tbl_login` (`user_name`) ON UPDATE CASCADE,
  CONSTRAINT `tbl_post_parent_post` FOREIGN KEY (`post_parent_id`) REFERENCES `tbl_post` (`post_id`) ON UPDATE CASCADE,
  CONSTRAINT `tbl_post_updated_by` FOREIGN KEY (`updated_by`) REFERENCES `tbl_login` (`user_name`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tbl_post` */

/*Table structure for table `tbl_registration` */

DROP TABLE IF EXISTS `tbl_registration`;

CREATE TABLE `tbl_registration` (
  `registration_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `organization_name` varchar(100) NOT NULL,
  `dob` date NOT NULL,
  `email_id` varchar(50) NOT NULL,
  `user_name` varchar(50) NOT NULL,
  `mobile_no` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`registration_id`),
  KEY `organization_name` (`organization_name`),
  KEY `tbl_registration_user_name` (`user_name`),
  CONSTRAINT `tbl_registration_user_name` FOREIGN KEY (`user_name`) REFERENCES `tbl_login` (`user_name`) ON UPDATE CASCADE,
  CONSTRAINT `tbl_registration_ibfk_1` FOREIGN KEY (`organization_name`) REFERENCES `tbl_organization` (`organization_name`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tbl_registration` */

/*Table structure for table `tbl_subscribe` */

DROP TABLE IF EXISTS `tbl_subscribe`;

CREATE TABLE `tbl_subscribe` (
  `subscription_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) unsigned NOT NULL,
  `user_name` varchar(50) NOT NULL,
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`subscription_id`),
  KEY `fk_tbl_subscribe_post_id` (`post_id`),
  CONSTRAINT `fk_tbl_subscribe_post_id` FOREIGN KEY (`post_id`) REFERENCES `tbl_post` (`post_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tbl_subscribe` */

/*Table structure for table `tbl_user_type` */

DROP TABLE IF EXISTS `tbl_user_type`;

CREATE TABLE `tbl_user_type` (
  `user_type` varchar(20) NOT NULL,
  `user_type_description` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`user_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tbl_user_type` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

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

/*Table structure for table `tbl_comment_history` */

DROP TABLE IF EXISTS `tbl_comment_history`;

CREATE TABLE `tbl_comment_history` (
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
  CONSTRAINT `fk_tbl_comment_history_table_post_created_by` FOREIGN KEY (`created_by`) REFERENCES `tbl_login` (`user_name`) ON UPDATE CASCADE,
  CONSTRAINT `fk_tbl_comment_history_table_post_id` FOREIGN KEY (`post_id`) REFERENCES `tbl_post` (`post_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_tbl_comment_history_table_post_id_comment_parent` FOREIGN KEY (`comment_parent_id`) REFERENCES `tbl_comment_history` (`comment_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_tbl_comment_history_table_post_id_updated_bye` FOREIGN KEY (`updated_by`) REFERENCES `tbl_login` (`user_name`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tbl_comment_history` */

/*Table structure for table `tbl_community` */

DROP TABLE IF EXISTS `tbl_community`;

CREATE TABLE `tbl_community` (
  `community_id` varchar(20) NOT NULL,
  `community_name` varchar(50) NOT NULL,
  `community_description` varchar(1000) NOT NULL,
  `created_by` varchar(50) NOT NULL,
  `community_type` varchar(15) NOT NULL DEFAULT 'DEFAULT',
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_time` datetime DEFAULT NULL,
  `updated_by` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`community_id`),
  KEY `fk_tbl_community_created_by` (`created_by`),
  KEY `fk_tbl_community_updated_by` (`updated_by`),
  CONSTRAINT `fk_tbl_community_created_by` FOREIGN KEY (`created_by`) REFERENCES `tbl_login` (`user_name`) ON UPDATE CASCADE,
  CONSTRAINT `fk_tbl_community_updated_by` FOREIGN KEY (`updated_by`) REFERENCES `tbl_login` (`user_name`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tbl_community` */

insert  into `tbl_community`(`community_id`,`community_name`,`community_description`,`created_by`,`community_type`,`created_time`,`updated_time`,`updated_by`) values ('79vwko88diwwkkgkc4k0','vvvv1','ldrljehrkjehrkhwr','vineethrvin@gmail.com','GAMING','2019-05-12 00:54:51',NULL,NULL),('c3s4zjlesvsw4kwkoccw','vin','fhkjfhs','vineethrvin@gmail.com','ENTERTAINMENT','2019-05-11 20:59:22',NULL,NULL),('i09dsd9qmygwcg0wk0ow','mygroup','sample data','ashwinchandran@gmail.com','ENTERTAINMENT','2019-05-19 15:53:23',NULL,NULL);

/*Table structure for table `tbl_community_type` */

DROP TABLE IF EXISTS `tbl_community_type`;

CREATE TABLE `tbl_community_type` (
  `community_type_name` varchar(15) NOT NULL,
  `community_type_description` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`community_type_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tbl_community_type` */

insert  into `tbl_community_type`(`community_type_name`,`community_type_description`) values ('ENTERTAINMENT',NULL),('GAMING',NULL),('OTHERS',NULL);

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
  CONSTRAINT `fk_tbl_like_history_liked_by` FOREIGN KEY (`liked_by`) REFERENCES `tbl_login` (`user_name`) ON UPDATE CASCADE,
  CONSTRAINT `fk_tbl_like_history_post_id` FOREIGN KEY (`post_id`) REFERENCES `tbl_post` (`post_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tbl_like_history` */

/*Table structure for table `tbl_login` */

DROP TABLE IF EXISTS `tbl_login`;

CREATE TABLE `tbl_login` (
  `user_name` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `user_type` varchar(20) NOT NULL DEFAULT 'NORMAL',
  PRIMARY KEY (`user_name`),
  KEY `tbl_login_user_type_fk` (`user_type`),
  CONSTRAINT `tbl_login_user_type_fk` FOREIGN KEY (`user_type`) REFERENCES `tbl_user_type` (`user_type`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tbl_login` */

insert  into `tbl_login`(`user_name`,`password`,`user_type`) values ('admin','admin','ADMIN'),('ashwinchandran@gmail.com','ashwin','NORMAL'),('ddas@gmail.com','f','NORMAL'),('vineethrvin@gmail.com','vin@123','NORMAL');

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
  `organization_name` varchar(50) NOT NULL,
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

insert  into `tbl_organization_type`(`name`) values ('COLLEGE'),('OFFICE');

/*Table structure for table `tbl_post` */

DROP TABLE IF EXISTS `tbl_post`;

CREATE TABLE `tbl_post` (
  `post_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_parent_id` bigint(20) unsigned DEFAULT NULL,
  `post_type` varchar(20) NOT NULL,
  `post_content` varchar(10000) NOT NULL,
  `post_image` blob,
  `community_id` varchar(20) NOT NULL,
  `created_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_time` timestamp NULL DEFAULT NULL,
  `created_by` varchar(50) NOT NULL,
  `updated_by` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`post_id`),
  KEY `fk_tbl_post_created_by` (`created_by`),
  KEY `fk_tbl_post_parent_post` (`post_parent_id`),
  KEY `fk_tbl_post_updated_by` (`updated_by`),
  KEY `fk_tbl_post_community_id` (`community_id`),
  CONSTRAINT `fk_tbl_post_community_id` FOREIGN KEY (`community_id`) REFERENCES `tbl_community` (`community_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_tbl_post_created_by` FOREIGN KEY (`created_by`) REFERENCES `tbl_login` (`user_name`) ON UPDATE CASCADE,
  CONSTRAINT `fk_tbl_post_parent_post` FOREIGN KEY (`post_parent_id`) REFERENCES `tbl_post` (`post_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_tbl_post_updated_by` FOREIGN KEY (`updated_by`) REFERENCES `tbl_login` (`user_name`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;

/*Data for the table `tbl_post` */

insert  into `tbl_post`(`post_id`,`post_parent_id`,`post_type`,`post_content`,`post_image`,`community_id`,`created_time`,`updated_time`,`created_by`,`updated_by`) values (1,NULL,'SAMPLE','Test data','ÿØÿà\0JFIF\0\0`\0`\0\0ÿş\0;CREATOR: gd-jpeg v1.0 (using IJG JPEG v80), quality = 82\nÿÛ\0C\0				\r\r\n\Z!\'\"#%%%),($+!$%$ÿÛ\0C				$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ÿÀ\0G\0\"\0ÿÄ\0\0\0\0\0\0\0\0\0\0\0	\nÿÄ\0µ\0\0\0}\0!1AQa\"q2‘¡#B±ÁRÑğ$3br‚	\n\Z%&\'()*456789:CDEFGHIJSTUVWXYZcdefghijstuvwxyzƒ„…†‡ˆ‰Š’“”•–—˜™š¢£¤¥¦§¨©ª²³´µ¶·¸¹ºÂÃÄÅÆÇÈÉÊÒÓÔÕÖ×ØÙÚáâãäåæçèéêñòóôõö÷øùúÿÄ\0\0\0\0\0\0\0\0	\nÿÄ\0µ\0\0w\0!1AQaq\"2B‘¡±Á	#3RğbrÑ\n$4á%ñ\Z&\'()*56789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz‚ƒ„…†‡ˆ‰Š’“”•–—˜™š¢£¤¥¦§¨©ª²³´µ¶·¸¹ºÂÃÄÅÆÇÈÉÊÒÓÔÕÖ×ØÙÚâãäåæçèéêòóôõö÷øùúÿÚ\0\0\0?\0ò·vŞß1ê{Òoï7çC}öúšCÒ¬Şÿ\0ŞoÎïıæüé£©¤ïï7çFöşó~tœĞM\0;{}¿:7·÷Ûó¦úQŠ@.öşñüèŞßŞoÎ“S@.æşó~tooï7çIÖŠ`;{ÿ\0|şt›ÛûÍùÒ\n(w¿÷çK½¿¼ß6Š\0vö?Äß›ûÍùÒQÚ€{xştooïÎQŠ\0]ÍıæüéC·÷›ó¤¢‹€»ÛûÍùÑ½¿¼ß%\0»›ûÍùÑ½ÿ\0¼:@( Bîï·çK¹¿¼ß%%;y¿:]íıæüé( ŞßŞoÎ“sÿ\0xşt¢Œf€\rÍıæüèŞßŞ?)h\0ÜßŞ?(fşó~t˜¢€sy¿:77÷›ó£b€\rÌ?‰¿:77÷›ó£¢€\rÍıãùÑ¹ÿ\0¼ß£\0»ßûÇó£sy¿:LRâæşó~tnoï7çF( sy¿:MÍıæüéqF(\0ŞßŞoÎ“sxşt¸£\0››ûÍùÑ¹¿¼:P¹£o­\0&æşñüèÜßŞoÎ—mh77÷›ó ³âoÎ—”À77÷›ó¤ÜßŞoÎ”Òb-ıæüé7?÷›ó¥£ÀMÍıæüé77÷›ó§IŠ\0MÍıæüèÜßŞoÎ‚(Å\rÏıãùÑ¹ÿ\0¼:J(oïÎíıæüè#4c\0››ûÍùĞY¿¼ß¤Å\0.æşó~t…ÛûÍùÒâ“\0›ŸûÍùÑ¹¿¼ß†€ÏıöüèÜßŞ?P$7sy¿:7·÷›ó£ĞEsy¿:]ïıãùÒbŠ\07·÷›ó¤ÜßŞoÎƒF(\0ÜßŞoÎíıæüé\r&(w·÷›ó¤ÜßŞoÎŠ(nï7çI¹¿¼ßP0ŞßŞoÎï¼:CI@½¿¼ß&çşó~t”@…Şÿ\0Ş?ÛûÍùÒQÒ‹½¿¼ß*;o_™ºúÓ\r,}~¢€.7ßo©¤æœÿ\0}¾¦P´¦”u %´PE´ÀJ(¢˜¢”PQKF(\0Åg”\0†—K@Q@RĞb–Š(RRÑŠ\n\\Râ€¸ RĞbŒRâ—\0”RĞh1KŠ\\QŠ\0J1J(€ŒS¶Òâ€ŒÑƒOÆiq@ÛF)ûivĞ1FÚ“mh=¦µ.ÚM´Ú6Ô»i6Ğ`TÈë÷dPG½7mi4Ñ£ùëºÚU$ôV=~†©\\ZÍjû\'£oFjX\'–Ù·FØõt\Z~­i}\ZÛ_\"r6âNW¯cÕQPÜ£æ5fr¸4m®£Rğ{•iôÆiŞ6îFğ=ñW6ÈÊÅYJ°8 ŒU)l\r5¹)©1IŠ¡â—â)1@	ŠLbŠB(¸¢Š1HbŒS±AÀeœE&9 Ci1OÅ%GZZ(¸¤<S¨ ÒKŠ(ÜRSé1@\r¢”ŠL~T\0”†—P1¦ŠZ(Ú1KE’–“\0Rb–ĞE-! éIÔRâÔ\0”©÷×ê))Sï¯ÔP×ûíõ4Ş”çûíõ4Ú@.i(¥)\0(¢Š`QGZ`QKŠ\0:QŠ(Í\0\Z3GZ\0\0¥¢Š\0( Ğ(\0¥(ïE\0QKŠ\0J\0¥Å.8 Å-(¢ QŠ&)E¸ b”\n\\PQŠv)@Å\03í´ìsF(€QŠvÚpZ3m.)á}ªÍ¾Ÿ=ÉÂ&>´›°6ÒíÅt¶^wæÈ^åÑZiÚœ}qaÉÍùÖN²[jRƒg\r•ÍÁ(%|÷\nqùÖ•¯„õK£ş¥c÷‘±]zø“E´ŠÉä#Ò¶3øt¤ˆå8¶†ÚtÛ×ÿ\0Ö³uj?†%¨G«2ìşê•ˆ=â…˜~}+V?„Só½ÉüQ?jñ¹¨çËûG?İN?V£‡‹µ­wry\n€`}\\úÖR^­\"”aØ‰~C×3§ô§ÿ\0Â´±y\0ınøÖ¬^ñ	 ³qÊÏz‘ÿ\0èßÎ­Áài˜5ÅÕ„	è.åŸüp\nÉÕŸó—ËÇ?ÿ\0\nÆĞô·…Áÿ\0\Z…şÁÎc¹Aê³¯õ»QàKÂŸ. zƒú­X‡Á·ñG©ãÓúsSíæ¾ĞrÃ±æ7¿¢…¶¥ÕÔ\'f„2ß@X×~\nÔ``x.•¸ÛOàü	¯c“MÖ´òw\\Ç!ÿ\0¦ŠÌĞíÿ\0\Z®Öé:âêÊcÖKwÃgğçóÅ\\qS[êÆ/cÂgµšÖO*â\"îº•?­G·µíZ‡†!¾…’0·	ÔÁ*\0G¿‡?B>µçúçƒeµß-Š»Îëwûë»}~‡ëÖº©âc=Ì§IÄÌÑüC6ËÙ–\0zg}ÔöşUÑj\Z]‡‰íEÌn‘Ü»8çû²ë\\NÚ·¥êsés‡‰²§†CÑ‡¡«?µÈŒº2¥õŒúuËÛ\\Æc‘zƒÜzQPcÚ½â+iË–ÚË÷$?zô?ìŸóíÄ^ÙO§ÜÉmp›$Œà_qíUN|Ú=ÂQ±S›jB)1ZG¶Šõ¤\"ŒÅò)1@†IŠ~)1@ÆbŒSˆ£f)§‘HE\03”şqIŠâRRš1Š\0n)1N9¢€i1O4y cqINÇ”n))Æ“\0†“µ)¢‰IKE\0%%.h Å%/zC@	Š1Å-\0ÜRRš(†„ûëõR§ß_¨ Ë·ÔÓzÒ·ßo© TŒ\0Å-%Ó°h ÑLŠ)E\0QE\0”¸Ï4 PKE\0QE ´RŠ%—P0Å(t¥Å\0ŒQJ(\0£¸£\0b”\n1J”\np¸ c@§J.(”¸¥œœ(©c„¹À ‚çµY·°–á‚ªŸZ’5†[ç>ƒükVÛKÕ/ãRıšû†L¨uy¿\0j%+\r+Ãeefs<»›û©ÉüêÂënéöÛ\\ô®÷­(ô=Npº…Ó]ÜÏ\'v}6&OıôGÒµìÚy¥‚Ú[öÚÇ?<×<¦·ÜÑEœÓizÍÚ´·-äÆ&géøĞÔ¶~·œƒö›‹•èÆ4Úôÿ\0Ç«°ƒLFu•Â™GFqğ&Éü«Jv_õiĞıãÏëXËm¬h_s²ğE¨u&ØÆK8Ë~\0îşu¹oá½6\r¥-şéä±Çè½+J;iIwÀ=óçW­´è›ih„Çı¶8®Yâ$ú›ÆŒQ\r­Õ±Û’¬¼b5–kB¹¦!–	İ{;üz¯ÛÁ$x\"1Ó\n¡MN!†6-$‘£ÿ\0¶Ü\\®We¶Ä[æ\nDP*¥¥$ş[qV7DcÍ‰}ğqüéÉä2—\nã®IÈşt†4“ä#¶ÿ\0Å+˜=GVVÜ&f¨Şp?ñêpê0Š[Û#ŸÖ *‰Èÿ\0tú\nI¶n0ä™ˆ7ëEÁFW(ÈÓ¦[ìl½şö?¡B{È&ÊÍ\nœ’Fõ«³]„8I-C«´©ı1PIyÎ=Î$+ŸûèP¤tF=Ñ—-µ»ğ¯ßkœÏš£{\n].S‰@ÂLÇŸ¡õş}ëVæ+iˆØê„ôM»—ªOÂ0ã)ıî¸ú÷ş•¼gÜO5ñg†rÏul \\ İ4j>øşğ¾¾¸Ï\\×+Ûî Y>P¥]hÛ±ö\'Ò¼ËÅz±›í°DRŞf!“şyÉÜc°şUêaë_İg\rjvÕ:V£&›py¸t=WI¬X&·`²ÁóÏ\Zî‰±Ë¯u>â¹+¡ğ½ûÖŒÜıøóıà:~#ŠÖ¬mï£8;û¬åÈ¤\"¶üK`-o„Ñ.!¹×Ø÷EkutCVvd{i1R¦â˜Å§F(2)6Ô„Rb€#\"Ô…i È£ò)(˜Å&)äRb\"“üRbÅ!ò)\rh\"œE4Ğ1)§RPi§Hh¸æÓ±HE\06ŠZLPPih ÒÑŠB(\0¤¥¤Å:ĞiSï¯ÔRb•>úıE.7ßo©¤¥¾ßZ8¤\nZ(¦E%-0\nQECIA¥ëL\0RÑFi\0P(¥Æ(\0¢Š(\0Í(K@)h¢jZJP(´\n)h\0£ R@\0¸¥Å.8 @\0¥Å§\n\0@)ÁiBÒ@\0¡iÀUİ;J¹ÔÜ­º\r‹÷åc„O©õöšM¥«\rÊ`\0+[OĞo/™Cƒor	\\³eş§µàÓ´­o™ÌÒ.3#œú(è¿[;ÔfçP×ßÉ³ŒÚÚ1å†rŞäõ5“¨Şßy¢·¶¡°H#7—ÖAÿ\0{EûÕ¨tí_Wc%ìíeËxfú¿~•©¥ø~ÒÁ–˜â‘¹fÿ\0ZË±@UÇË:Élo\ZmîUÓ´k-: –öê§»I>æ´wq’G ¦Ÿ¼:‘w»Ç¾3\\²›z³u¶,D…G\n»Têê?½Uxâï#1„äÿ\0õªÜI\Zğ¨î=tü³Y;š\"h²a]ÀËC¸şCü*ìwS8‘†xÂ¨AùòJX#P6­ªz3‚ßÏŠ½•G‰qÜü¿×Œ‹B%¥Äè®ê§¬Œp?<Uûk)1–’ÕGû)ŸÔœRGu#ıàşYFOëV7>T‹y]y*43›{Gk˜¬¤vô©DIèª=Æêj-(ÚÀìíÒ keV8Lÿ\0²9üù§{r]êË}l—Œı‰¨$kLœ¢(?ÅæmÏéM0¨ÉX0Oñ(Qúí¨Y%ÎÃ®wúI¶Í#M!ï&¶¯÷„ùıªí¥F”óÇ©#ò¢[6eùm•;œ9?Ö©Íep¹xŞhØğUGäE4j—™º[†l$ˆ3‘†Ü?#ƒúÕo*hÒ[èËŒÿ\0Ÿj¸$ºPw³·nB‚?,\ZYHeÀî[œÕÅØ¦eË`B€§°ì\rbêöÜÁ\'™e‘vÌ‡ÓûßQı=«¨`’¨&&\0JâÛ+rGµtÂVÕJ7<SWÒåÒ/Ö_˜™:†«ZÌÖ×1Ì‡¬>•é~&ğüz‘!Í¸\'îœrŸCÆ?\nó&B¤«{\ZõiTU\"yõ á#¬×`[ı¥Œd §Óø‡áÍq¸®ÛÃó½-QùÚLd²ÃüA®:xL3IêŒWò8¥EÚñì:‹f@E!&)¸­ÌÆIŠ“´„PdRb¤\"šEŠi!˜ È¤\"¤Å4ŠŒÅ!ëO#4ÜP+4Ò)äRc=hÌR\Z~)¤P!¤\Zm<úR@ÆE)â@\rÅ!§R\Z\0m!§R\Z7”¤RP Å%-&((¥¤ b\ZJZJ\0(4Q@\r\"•>úıE‘B~¢€.8ùÛëM¥¾ßSE\0 ëGZ:QLÅ¢Š@t úÒ”\0½M-( ŒQ@\0KE(Å¥ bŠ(Q@GcŠ\\P\0-–€Pœ\0\0S©\0§\n\0:“á@\0à(œ\0)Àd;Óá…æG\Z—fè+¥Ñ4@6Êw1\'\nëœ¹ôNàµ÷ğàdÔJj+R’¹[FğÛ\\²ÉvLàD½Xú}}‡Nøã;Z†«m¢Ä¶Ğ¢½À\0$H2±‰ü>™ê+ê:ÊØ§é˜–ç[:Œˆÿ\0Ù^ÙëßZ~‡¡ÚîX<îsœäp}O¯å\\òw÷§±¢]\"C§è²ŞÉö­L³·Uƒ°úÿ\0Ÿ¯¥uÄ‘¢…p:Ÿ…5TtØT‹—à\\µ*¹3¢ìJ¤·N”øÓÚ˜WƒÉôÖ¹iÈÔÈGa÷GÔÖ/ÌÕAEş-ÇÚ—í#\0+d÷ÛĞUaó‰d$àN\0©¢ÂaQ\0é»“I±¤Z‰ØV}ÿ\0úæ®Ãö¦ó„CĞ|çó<Ugæ“ì*åº³ıíÀ“üg¥g\"‘r4„¸ógVë‚ØÏà+NÙaPÄ¬GñX~š«cfá‹¨|ÕP(üs[6±Eã~ñ*“É÷Æa\"îX‚)Ù@,ê½ñ…ãV<ˆÕ€`F}óŸæi±L±\r«¸ÏĞT¦æuË/–p8ı­I„œ®HƒòÛÈçxõ5‰<Â6Æ¦ìÿ\0ŸÊ«¶¡o!;î%}¿yCà~•Yõ{L7–¨Šx¬>oóì(¸£Z”IšPÑSøôª’Km.ìN¥—ø•™°\nÏ»½ŒÈ»‘$8ÀIOş?åTÚâeùM³¢ÿ\0´ÃÎƒ¢1±¦ÓÀø\'h~›™OøÔ\rs$Fy!¬wºÕ²-âÀüä\rTûRrñ÷HõšEØè^hˆnè6sùÑæyË´Kãø‡øW&ÇÌ,ñ]Ì§İ‰Ö /z€„¸IsĞ2?:¥qXê¥Óa˜\0¯Ù£|Nj-ç…~W®:\Z¹•Ô/­ñ¸õğ«–¾&Úâ9•>ßÖ®2°œn\\¹µŠå\\†=	à‚:WšxãK6š»søÿ\0ƒ©üAëšõ4¼‚ğ6çéÍs8Ò$ÔtwhÌ\'Ü¯ ãğ?¥váªZHå¯Äã|&Ä-Êîî‡?Ö²üC‹Z»QÓ~0\rløFÜì»rÀ(sØâ¨x‚Ú{­rëÈ†I6°\\ª’2WlïYÍ%û´bMÅmÛøC^º¡Òî‡\0Zµÿ\0\nïÅEà¨êC)Çë[:[´gÉ.Ç3¶ŠŞ›Á#¶‹|PudŒ¸–k\ZXr£Ç ê¥Hü\r5$öd´Öä8¤ÅHE!@FE&)æ“3¤Å8ŠLP1†Š~)1@XŒŒÓH©æšEŠJq„PPÌRO¦‘@†‘šn1O4ÓÍ\04óIN¤ï@\r¤\"HhÚCNÅ!\0Ú¥4„ñ@„¤¥¢‰ŠCÍ)Ph4Q@	J¿}~´†•GÎ¿ZZ¼ßSIJçæo©¦çš/z(´\0\n0)i\r\0 \nN¦@Q@-Š\0(¢Š\0P)i-\0-q@ j)hqE”PN¤”Pâ–’@\n(\npPREÏ HÆXûãó=‡½1W8©­:Å™’Ş0\ZyNGuÏû+ßÔñĞTÊV@•ËºN™LCkmÉ“Ğc®^üØTº±<’™›(ì‡%à¢·¯fo¨oWê3µœ)§Z6û™;¿ç’¬Ûl{)÷56¥Çh‡nwôgõ>ƒÛÿ\0Õ\\îI{Ò5Qè‰t}‹J“0 °<}·ó­˜×¨ı*!’AÏ>¿áR‚#ZãœÜÙÑ¤´$\nî-ÀêM#\\ò 9=‡Sş\\Íæ°’ùâ§DŒã“şy¬ÍHšn$è?…NâjuPÅz/˜}ş•*àqœzâ¤hp]¼tÿ\0w“SF HôdÔ^ju+êNçŞ›öÕ@G˜îœızÒ(ĞOİŒ“·ùÕ«[˜ØfÀä ş¼Ö±âK€!Æz³|Çõ«6ÛÂ20ãç<~iwI\n€£{gîçv>¸«ğßdeƒ£!Qäÿ\0½>¼VæRG\\ç;sùrkR(aŒ)”³\0p£;–M`Ë/®©³$¢OÜA¹ârçK=ÅÜÑ«Ë”¤ƒ›‡@õ\0ç2$rs\n›`ß{kÄäŸÄT‘é° \r>7Ó}æ÷Ïè*Dìµ\"šîÖ@æãª\\“ÿ\0 ş´yW’w¶	¸|¢i@$zaA©$¿´³Ü\\~ğuÇ\rùœŸåYrëŸÚí`’ãœasúšZ”‰¼P177PÁşÂHG?ªR(d¤vlã«;\'üji@$‚ÒÕ‰û£ùô¤yn|–\"í±œ\0PcÓ\ny§b®wg÷ii?‰mó¦Í|îË#wâåY“ÛÂãy´û´ˆã?ÏëQÏ¢Ég+7LÇ#/òª°\ZàÌOï	=H1QJè‹º@]Ñ·ôVL¶È›È»Ç_øúñBZo–¢4h^öİ?|J¤˜\Zm%Œ£ËÜŒ8ÊÕ+›Š–Fb?¸üşG·æiö¶7÷X\"aq	;\\Èˆà}Xü‰­¤Ø[8/.vBTÂ»‹\\Y8İœ„Öİ¤—+±±“Á¦i³Aj°@éµ[ükk‹kyËDLg0\'·¯·ëB•¶›ú-¥¡\"<+±låôbx¤2ı<Æä¶ÀIüj=:é.¢ÚÍóõqa”Ã.óıÖaÏé[{Fõ3äKBxf„­\ZñÜ°­­=FD±¡*:”È#ßß…eÚJÄ˜ÌlçtO›è~œÿ\0ZÚÓàªöÄã°Ec)\r«\"ãÙÛÌZy`ŞçŸ65Äƒ¹^OëU¯ô-7X±òµx/¡9÷#ÌÛí»ï/áÒ´¸Ã®sÜ÷üGëÖ¢¼µP¿n¶òÖ]¹;¾ìËı×¾Ô}3J2wÜægø×á	±Y.ô!Ú75”¸•îÑ¿ñcÈ¯0e*JAF5ô¼zšm‘]]ì|ÌÏ[7·¡?_çæŸ<°®YpØ3”W¤€:õ0Ø¦ß$Ì*Q²æG˜M©H¦^‰Ì6šiôÜP!¸¦‘O4”aÒ)ô„PdSH©¦‘@#ŠióHEE4Š~)¦\r¤§\Zn(†Òš(´Ò)Ô˜ ‘IN4†€’”Òs@	@¢’€IKGj\0Jï/ÔQBğËõi¾ó}M&)Ï÷Ûêi?\Z\0(¢ŒĞHM)¢˜\0½¨¢P(h¢ƒ@„ëN“´ZZAK@)iiq@\0ìqIJ(\0à)1N ¥ Râ€\nu ê(§\nAOU$€:šXµ]¿½$¨  w#ß°÷®†ÆEÓ,áĞ©Ôm_ùçğ¨úÿ\0*Æ²‰&¸D|“ç|ÿ\0ttõ­HƒêfWÉ\\åW¶Àt¬*y—XÒìÉf–R^yçnãÖ¶£F`\0ªñ.ÅÚ	\'¹õ©|Íœ¦¸êK™0‹Äc“Í4+J2ÙÇ÷Æ£EËncš°2zğ==kXøÀQ‘‚zg*@\0#\'\'Ö¢\0ã ¨ÚãĞãÓj[)|Ô^	ÉôZ{Ï¼ €\0ÉéÇÔöªÁÜò1ƒÈô¥\0#Ùcƒüñõ¤RD«+ÍÆr	å½?Ï½L‘\"~ñ¹?ŞsLE’\\»ÛúÕ˜­Ó …ŞGBxQøÔ±€´ø\n­.’5úúÖ•¬\03ßì À?ãúÕO´*®ÂŞcvT8ñ©öAòÀBdr‘·â{Vre#¢·€JÂ“’\n´×±[BBB`ãêİsIt\0\"kœéÌIô\'8ıiÂèI,K¶LrR5]î\0ük&‹7^xXËp?ïOü­Pwº˜šàZÄX–i2Ÿa÷›êsW¬tûÙ	âÄÛCLÀúZVVVV²1ŠĞ<å˜îw>¾¿­-	nÆ¦ƒ5Ğf³ÓD™çí\Z’³)÷æjßü#¢M‹«j×@söhG—à‰€?5·u$Q–yÈ<FŸçÎ³nuåÀXš(‰êW–çéEÉ\\ÌH¬4ë’\r25Bpãğ’_³©+qöwÇİ¤€=\0f¬kİ~Iµ¼3:©Á•ÛjÄ‘Ã5ƒsâY˜&fcÆÛxÉêÁh³f©#°Üe£ƒjú¤(ëš­$Å›\"9WŒ®Õ ®[ıJW$ÇtÙéÌ2Â=gR¹X`KıÅ¶ãk üñÓÔÿ\0ˆªäeèu÷=Ëª›LıíŠIüÅ=à‚Ñv4Q–n¨¨\0Ï¾:ÔS(ğÍ‰RÒ\\Ş•Ä’áxè3Ğk†¿ñ³4¬\"‡Ê\\u äûÿ\0õª¢+uŞ³oí.­·åÆGËíí\\Î£ª^]±»\'ˆâQÏ×œšÄ}KV\'ÙÏf‹§ê*}+P½¹½Xd·„®±´	<ôÏğ†§fh¢;ÂòkY‘[tÜ3#¤ÿ\0»ş\'?JĞ¸ĞmìÆ·7—î½ˆ\0}}ÿ\0.;WOu4:]œ™RÁF}º~¥r:>·evÆY%o1ÎXà¨®0Â•ÛW\'bÕ†İ™äAœ­ ?ïd®zzVÜ/<.‡sIàn#•Ï¯µ,PÛL¤Ä„~ğo½ôÿ\0?\\v‘\"œùgÏ>„qJè—;HÓRc•Ûı[ÿ\0u×ß±íW´É$óVebW¦à9üÇ>üúU;;.ìæ,’ì˜Ş¿P:ŞKO.÷í!vïP¤çøùOäqQ\'s;a1ÜÆ’F£kòØç†¢…Lmåå~Í?İìc~ãéÿ\0ê¢À}Icbp¹ tÈ<ÿ\0_ĞÔ·Q\"‰K(	8íêG¿CøP™Ì÷±…©[Gm<£É!ä$Uş 8üÇ?î•‹2yÖ×\ZMÁ«)0¹èÀŒşGùŠŞÕ„×Âf\0\\DLR…èÄz}GO¯µróÌí‚_ò·r3œ~|ş&º!ª¹ªÛSÅukÓu	­ˆ #¹ôªF»O‰Ao¡¾UÀyú÷®0×¹N|ñR<ÉÇ•´0ŠB)ÜšJĞ‘˜¤Å<ÓMi§”ÓLcM0Ô„SH¤dfÓÈ¦\Z\r4Ò)ô†˜4ÓO\"šim%.) Å!â–’i´ãM4J\rP\ZLQE\0†Š()Wï/ÔRP¿}~¢€-7ß?SIJß}¾¦Š\0))h<Pw¥“ê\0(¢Š\0)i)hQE:RŠ\0(Å/z\\ĞŠQH)E\0áÀ¤4¸Í\08Rõ¤§PN€RŠ.)ËINP*hW,OáQ\nš0qÔŸşµ&•„DÄX4§ úÒ¶­#€°ª6êU@#oà8«ÈûF+¬®oZó6t<š|CqÉéüê´GyÉû£õ«³ì+•›¢Æğ?§Òe\n>léÜÕV•TgŒÒ¢iƒÇ$İÍC)\"É˜¹<€aĞR ÜÄğ}ÍB¨Ä†q“v«‡‚Ø98Ú9©efI[d@‘\\÷úUÔ„(ãœr[?ÌÔ{Õ>V#ª?‰íô¨¤”Ë€>TÏ*C-¼ñ¨ëæï…	¥p70°<\0*‰™\"ÿ\0xtõĞTiîßË…29Î*JF©š41Ï®NÕÿ\0ÊŸn·7xŒ#mÏ\0)ÿ\0€Œ~mI§éÛù\0‘‡CÙ~Ÿã[0<q)$aÎ£ñê\n†4:ÃDšC™dÚ3÷\"Q»éß¥oY-®˜Ÿ»XãN˜Œîw?í9şB°ÛWx×ç*©Ÿ»ŒøgÜx…äùb9cÆ@éôÿ\0ŠÍ¦Ë;uÕX…‰@éÏO©<Ö\rç‰%™YTá0rÀì_ş¿ëô®y\'–êb.àüÄğè?ŸµiYBdmÉ\\HxçŸn?•¶%±#=õìg2Ê ÈP#ıÒ7°ş&ı*d‚af”Æ>ìA@SïŸ”÷³ô«VÚ$÷$Iz4C²sïíìOáN¼ñ>‡£¶.]xÙåAô$ğ?Ïz\r_¡Hø~IÜÊÆÙ$cò V¹”}C|‹ø%XËÈ\0]Ü¬qûÉˆ-ÿ\0lâçùVv£âİRâa:ÌŒ.?vOÓwıò+›¼»kh<÷y!YN[·yöS–?\\ÂšMšÂ”¥¡ÔïÓšåaO´JÄ*˜Ğ°\'8–#9õº©¦³ğİ,#IÙs#**ùcÓ t®GÂb->ÛûE¡v“ÊiO\'ı¬dñÔåÍcxòÿ\0]¸ò~ĞëŸ˜§ÏøçôÔnìtÑÀÎ´ùVËr=oÆku+|“ÀŸ~¹®~]en0‰I?İ~å—\'Õ¹ÍZN‰:F+UÙ§•S_Œ™ÛæÏşôyş•·à¨Şÿ\0\\·i-b‹Ê”Ÿ`©“Î¦{eUû¢¯xCúÊqüjOäËÿ\0³\n™¦‘¥l(Ñ”¡ºGAâ{I[KÔFU?&ÿ\0\Zñ«{½BŞLºî9ë!P?LWĞŠ’ir(¤TGû¿ã†¯×ô²ŒíVHÉñQ„àÀPxKº7|%®Ü4Ëo,YIHQ´‚»½3Û<~8¯H±nb#•Œ¡şìœ}³Áüëçx5×²¸ŒˆêzõşUî~ñZÖøÚÏ0ã8\'qÇÕdü…DÓZœ¸ªé-mÑÚ8°²F¬‘“Ğg¿“VÒ/™hàFqĞ•VM°j,Â2REyİ‘üÛò­qâTÆc`êı_…LQâUŸRºò3œoSƒÆ28ÿ\0\Z|’ï·Yk:sƒĞƒÛñæ•œÃ\"1 ’»Xz‘ÿ\0Ö¦[DÖlÄ€r¹Èü¨Zæf]\"C8Wåf2Äı×ş?QÁ÷Ç_¨Y™>ê¿Ì¹şÿ\0QÈüë´¸t’Ù\ZbT¥eôìOÓ­rÚì2rdæòÍî1»ğ<7âkzLÙ­58Â_FÊÿ\0ª“òÍyÉë:¼#RĞî`ûÌèGĞŸÒ¼S‚0G½Œ#÷,pâ¥q†›O¦šê0ŠB)ÄRP&4Ši§RÅ\0†ÓM8ÓiŒi¦‘O4Ò)¤\"œi\r0i§šiæ4”¦Ğ\Zi§RP1¦Ó©(†ŠSA Š(Ç4())Çšm\0&)Wï¯ÔRb•>úıE-7ßo©¤¥¼ßZJ\0(£½!â‹Ş–RĞFh¤Å–“\Z-‚–€RÒK@(”ê\0-”P §IŠ^ô\0áJ))ÀP1E-&)hÂH)@ C€â®Y¦eOQÏóª‚¯ÙpãéåQ=ŠF¤g§RXâ«/Z™\Z¸ftÄ¶­ŒÂœÓméı*¿™´T6âNN§jÁš\"ËJXĞ\n–(öì~sÛÒ«À1‡n§ «(A=zrje´ÇA×¹¥û@_–2I#–¾•Q¦%vŒ…<{šO3hãÜ÷5,h´@äîaÏ²ÔS]…RKz÷ÿ\0õUG¤;ÛmY³¶<3&IèùıiIod÷ I1Ú•¯oVè01Š:µV!Rx$XòéUä¾ÚÉ\'©cÔĞ=Í)¯\n\0şâôüj´ÚÁÛ±0}‡\0V5Ö¢3¤àqùúTvñKy†nÃÿ\0×©h´‹Ïx\'liXò\0à~ãW-m¥¹_˜„R3µI\0¯Sü¾µ½µ­¨.ÿ\0x`’ÇëÏOÇš¯sâ¸¢-¢‰3Ù!øÿ\0*›v4Q¹ÓZAkh€Ï·hè;Wè_Î¡ŸÆëo‡I·MĞÌ@öQõ9®*}NkÙHv¹p8…T~1îjif·²A.¤c„J@¬7áĞp\rÍaI·cd]jZ±m¼•ĞŸ¹	!¶z·áÅHu>Ãr¬«Œá¼µË>„ôÛ9ö®Fã[ºÔY¢¶Wê	#pÿ\0k»bqíVl´w—i˜’aG@£Ğ€}*¹W–ÊzËCSûyW6;»u¹˜å¿öü¾•kHÒ\Zîëígsui,ÿ\0÷Ñçõ§ZÙ$@Q[q¶‡hëÜÕ8Øô\'JcËM{Ì’úëbĞà‘Â³„`ÓærìX÷£Ö´ŒliSTãÊ†ìëÅ9bÍ9\'¦*Â ÅZEÊV*M\nj¥„†ßPÆì¯ø~ V¤Ê\n:Ö<êR\\=k:‘5£ï\'z\r½â³,˜Ê¸ÜO¨<ÿ\0ñuÃk¶UÔ¨NppO®8ÏãŒş5³a}˜ºìçĞÿ\0ÏçPkñy˜”s‘Äõ±ùVÑ´y˜8{\nÎ=Ï*×ìŒ™WsğcVY–m<”È‘‰ç<?àÿ\0}\ZÃ×-D‘6GJÍğ£ı‡â˜fÊ…ÄÎ=T8ÿ\0f¦ÕÓF™­ËÎ¥G6V¬í’AŒŸpÏäó­;YKF\nıò™Æ:Üÿ\0ŸzæÒñšÚ%%v©î{ƒş­+ï.ìÆB±*c¶xÿ\0ÙEs§©òUh»\Z·’9È8Ú|ÀÙïùgô¬åº	2É€®£Ëÿ\0Ò¬Éx’*¨`p¡”âRHÿ\0?Zç®®EÓ!c~pİ×üæìŠQ²³.ŞÌÑyŒªFz¯bGOğükõÖ[pW$Å†î£§èHü*y5œ˜œw=ù÷¬ùfT™ĞgaÏ°=Æ¶‚³)ìcnÙ$‰ÙXsêOç^iâK?±k…Ú¬w¨úÿ\0“^•,lYÈu%OÓüæ¸¯\ZÛÖ×‡9uØßQÓùW§„vv8ñ\nêç*i)M4×yÈ!¤4êCL‘ŞÒÒbÚi§HiŒa¤4ãM4\0ÃM4ò)¦’¸¤<\nu4Ó†ŒSˆ¤4\0Â))Æ›H4”ãMÅ\Zi)Æ›@!¥íHh(4R\Z\0LÒ§Ş_¨£\'Ş_¨ M÷Ûêi´çûíõ4”\0Ru¥¤ ¥¢Š\0(¢@šJZJ\0Jp¤¥\0´´‚–€\nZ(\0´´\nZ\0QJ:Ğ)hE:š)â€\nQE( ê@)Â\n]µ8oÂ©•fŒ}?Ïò©–Å#U[ùTŠØúÕhÛ(>•.î3\\:¢HzRCûÆ°éş5^Wäõëô©“ N§Ú°e¢ìo»‘Ó ÿ\0\Z“Íİşu[ÌØ¼è(Wã“ô¨e¢É–üqP¼Æc´Ú«Ë6Iè¿Ö­YZç,äõëş{Ô,¬öüÍ×ÓüjÑ‘cÜÉèM@ÓíW…X!T¦ºîñ€u¤Qj{Â_ ì+>k†—*‡×¡üûUs+JıÉ`v©¥’ŞÉ7ÌÃ#¢ûÿ\0Åm,Tm’\\00à{óÔûše÷ˆ!¶ıÜ½“ıçXWºÕÅĞ*»–0>èî=ÍTiá´Í}¬İ8ùû£úâšGE:mš7×WÄyÎüò°§ùãëHÓÁm{Ë‘\ZuÂy?VïøVšÔóª÷Ç\'Üúş9ú\n[m>[‰<ÉK;¥MW)éĞÁJ[š\r®ÜH¦6!gêà~ñ¿Ôû\r%æ“|›™‰Éf9&¯éÚ)à•âº+K%ˆ\n^‡·‡ÁÆ\nö Óôµˆ@ÍlEP8ØĞ(©ÁGzi2ÚÈ±l£;Ïj.%ÉÚN¦†F˜vªÌÄ÷¡jîrÓ<½£ù)ëÉéL‚&˜ü¤\0;š»œäq*};Óº&¦*Œ,¤®\"KĞqÍ=l&ª0¨6Ó®C\'NÀ‚*µ$d«ÓÒDOÎk2ú.ZG‘GPzŠ†h·‚1D•ÑÕIò²¦™u°”$à.õªGjĞœnNœÿ\0Ÿ¥sÒ†´›wjÕµºQÁÎ8>ã±ÿ\0>•Ë%gpÅR³UbajppË\\Dñ´\Zª4|1£êAÇëŠôb\02Ã¡æ¸-f?&ê)zl‘[ò4úšÖŠ©@öMWK½6ÚV`à{Zr^ù3ÛÎ‡ï#ú†kÏü%;5”@·\nï	öÚpş;]\"]n‚lår¿\"²å÷Ä+9»ci#ƒ‘`¼ó´ß¡Èüª§pnbEù™Aş.‡ùãÕœ—í\ZF£…b2}x¤Œ•·xwüªx>¾‡ùUrjq_A\rÆôİÜŸåL’q Ï‡üÿ\0µQæ`î¸?BeÜd^rT7ãÿ\0ëª!–çbXº¼¸üEr(T¹Ò¥eeençò®•dÊO¿Ò²µ[Dº‚X‚á¼¶Áİ¿Jë ìÑÏU]nÃÓO>”Ã^™Â%!¥¤&˜\r\"ƒJi\r \Zi¤qN\"’˜\rÅ0Šy4Ó@\r4ÓN=i¤sI\0ÓHG¦Ó„Siø¦‘@\r\"’–ŠC\Zi´ãM4\0”ÓN4Ó@¤4½©\r\0\'z(4f€„ûëõB}õúŠ\0²ß}¾¦Ô­Ë·ÔÒb€\n( PÑE%\0-Š(\0£½cš\0ZZAJ(¢”ri)GZZJZ\0P)Â›Şœ(¢Š@)ÂŠ){R\n^ô\0¢œ)\0§­\0êLRĞŠ±ä}pÏçPjH$zÿ\0:O`.ÂÇbƒÔqSîùjì`‡\rSy™C\\ubtS}S™	=N´g¹ªËÏçRİÇ¥s4l‰Ô’~´’Ì#MÇÀzÓ÷Ï_åP×3wÚfËE«8šiw¿^çúV qÇj«\n¬hzT7AA%°\0ëR4‰nnö‚rSÇãTUå»l£¼‡‚~ƒ°¨w“æMò@¼ª­îjö¬1¦1×”$Z.ÜjQY ßçn™ÅeOw½÷LåŸŒãëY—zª¨Ê¶ÑëüGéYt÷$º™û¹ëõõ­Ê™­w«wlÇñ‘Àÿ\0tSQÛX¼ï½Év=YI¨¬Ñr+¡°Ø1œPÑîá¨El>ÃGÎ>Zèl´Ä@2´Û-¼bµáÁ›=ªT’WB`VTcµ5qNÑ£W*h¸ˆªëËT’H\0ÅÂq½¢‚I77µFíÇJa(\'5]ªƒHÕA%bäZ½¬ClˆêG¢’*xüUmÚÜ8Ï$(üÍsó_¨ôª­¨ÓoåT\"yU+É¶vçÅq•M¬½8-´Z–ÓÅÒ!u°u²\rp?Ú§Ü3O]Yºn¥cHå¸{ZÇ¤ÿ\0ÂI¤^çí–ò§8üT“N}Úú/;J¾Šã#>[7Ó1^w¬İÚ§PFmêÌ:2œ\Z5[¿‘ŞŒÚòz£vúĞ‚ÑJ…ut¬¨&k)¼·û‡ô«Pê“K—4¾pìÏËÆ¢ºfBAät52W=\Zp—/,Ëí¶æÜ¦A d{Šá¼MlB?«¦Óï\n7”ıW§ÓÒ©øĞIš€`Œÿ\0faMò7FD>\Z½Ûcu·—E¿!¿‘®œÍç$®ìş¼ÿ\0:â¼6Ub‘AûÆ2°ÿ\0*éâœ69àøbµ>_I£RIZ;Gÿ\0`géÿ\0UYI÷!‰ÏOOóíYëóÛÈ¹ûêHüE2ÚäªÆ¤€~?çg”Ëm0fW?Côÿ\0&««í)¼äŒ¡=ñşE:CÃÓ¨ªòk°3òĞ„Ëq6ƒÜƒQ^©xòÒzš!o›¯šuáÿ\0FsèWùŠŞæS<Îò\"îh³GëP5iø‚1©1Qò±\'õ¬Ó^¬]Ñç½ÃÍ%)¤ª†’–“\0†šE8ÓM\0†‘HiÆšh¤SM8ÓM!4ÓÍ8ô¦‘LB\Za§ÓM\06›N¤\"€\ZO4†–Ò¦›N4†‰Ò“4´†€½¥è=h¦•>úıh4/ß_¨ M÷Ûêi;R·Şo©¤ I@ QF)(\0¥¢Š\0(h¥é@\n(‚œ(\0´QŞ€Râ’—µ\0(§\nEëNâ€”\nAÅ8P §\nLRŠ8S©¢@\n)ÔÑNí@\n8¥sM§Š\0œËü¿ÏÖœÆ\rC`ãÖœx¬gè\\ebu8Í»SQ²)¥ñ\\R‰Õ>WÂ`pO…Mf˜\0ôÏòªdïpµtH#?—Ò²h²[‹ ƒ³f›qİ!àr£ººUİ‚¨ë“Šåu_!v’Àq»8…8Srzénl_êá‰ÀQşÈ®z÷Wg;T“íŸçYj’\\)cşÌjMF#¼nVÎä÷q]Ã¾¦´êÁt¹pÈÎÛœäÔñ>ZÌ&æ!™-®Pz”&Ÿğ\'>‡ƒTè¾‡u<m;ÙèoAq·«g}·×1À8ìjÜW%Hæ°”ZÑ½\né«ÅîŸ¨go5ÑYİ\0f¼ŞÂü©5Öi·¡ÔÖRG¯BµÎ­%½?Ì—\rÇš°³dõ¨;y‘x>j	§ÅFóà`Ue”iØÊ/í×D÷À¬ë‹İ¹Á¦İ\\ÏssÛ5V2œË3_õª|IëX×úÜ¤«>çşêöúúVş%WÙüİ•æÿ\0?…m\n2–§—ˆÌ¨Òvnï²;?¶Zr^ŸS\\J¦½uó-µÎ=]‚S\ZÜLs™´ ÿ\0Z¿`ºÉ«5“øiIú^ŸZ·\rç#šóa«ê¶G3GpŠ;ºîjé¾,²…?í)Çèi<4ºjoK9£~Z—‹óG¢Ûß9­8/·\\u–£ãänz•<øV½µÉèMs8´ìÏre%x»£Zä•a*G5p:ßY²¸ÍfùÛ“’ÊäÃ)Bx=+&ˆÅÓæ<wFe’=½ÄĞÈ^£õ®‚ÒU”ÕYUÁúÿ\0úë/TCØ:8Ïâ9ş”í>áPÆOÌ¡ŠcØò? §cæ1¾óæ]NÉÃ ãÕQïÎW®py÷ÿ\0ëƒUôùLw/x?2şT×Ê<ÂG×ƒøúÓİ4•™kx,z2àCL‘¶J‡*ªMº\'ŒıáûÅSØwş¿•Y›÷±H>¢‚EC‚zZ~bMµLğä@Â­ŞFzŒV°z™Ïc‰ñ¸.R?P\rbâ·u´?0ÏE˜b?•a\Zõ©ìyóZ4”ãM«$:RRÓM\0#SOJqéMí@	M4êCŠ\0a¦Ó4Ğ”ŞÔ§¥! ÓiÔÓ@\r4‡¥-€i)h\"\r4ÓN4Ú!¤¥¤4\0è¢ĞÚ…ûËõP¿y~¢€,·ßo©¢•şû}M%”u¤¥ aGz\r\0´\nNô´\0R@¥P\0)h¥ E-P()h¢Š@3N\0£šP):S…\0œ))E\08\np¤´\0¢”RRŠ\0ZZJZ\0PjElğzÔtf“@J­¶šÇ¥45)9®z¾¦Ğ´ÌÇ=;ı*¦µ¬Ã¦ÅºC¹ÜAÕ¿úÔj:ŒzU“M\'\'¢¯÷¥qvö÷>#½’yœ¬ şñÇş‚µ„i_YloÍØeÍî£â‚±Œ¢Ÿ¤iÿ\0×ıjx4hğn®dîO\n?ñ­¿*+XVFŠ8¡ÅkÍ¥–ˆºq¼µ#HÒ5ÚŠ¨=`S±C°wÅT’åÛ…ùGëMFæ³«hË`ñQ\\XÚŞ.&ÿ\0{?˜ª„–êI eyŠ¿fcõµÕæÑî,‰’ÍüøÇXdäãÓŞ’—ˆÏjeAóÛ7Ş¥{Ÿ§QïW£º‘8<ŠòÍoqslŞUÒr®8İìÆ†¯¤©V³æ¤ìûÁq‚5Óh—ü…\'šåüÏ¶Ç$Û<»¨¿ãâ<cpşøÌ~5cM»ò¥S†¹*Óå>‡ŒUÏK·Ÿ*1W\"˜`œÖ…Îä_zÒq\\ì÷ã+¢ñ—#$Õ{‰öŠˆËÅR»¹ÂzPT¤V¾»¬ÌÁTw=«ŠÕüC%ÄE˜˜íGÌçÛÚ—^ÕåÔ.E¥¨.m¿Âµ´]-)<Ù1%Û™ÿ\0»ì+®P\\ÒÜùÌV.x™ºT]¢·¢3,<+$ÀK©HTD(ô#ş»okmb›-à%ÿ\0duüjW“œ\nÏºÔR2V?½{\n~ôŞ§#•*ºÿ\0‚h	2k-î{u\\ä\n¡w{3DîÒ0\n¤àp:WŒòsøÕ*2Î9_»Ñ¡u“î2°ÿ\0dæ¡ºĞ¬¯¹x|¹?ç¤+WŸ«4g(Ì¤t âµ,|M©Ù‰üäÁ(ÏëÖ“ Ö±fğÎiT\\µá§Şn´z†«5<:ğñ{û/Q].­Gu\Z4:±ÂÈ9şëÍúÕ‘£ø®ËS+ãìÓ7\\üô?ĞÔZ®•&‹+ê6\r¹â{r8Çsôş]E\róû•wîtÓn‚úÎ\\ĞëëşÕo.áDä©½EaxXíD…²2…º‘Üqßğ5ĞàH•ÅR›ƒågÓáqÄÒU)ìÉ«wnccÏU>„U\0íivaa*†_b?ıUòµ«n©Ôwöé\"œÉgğ¨Hğ±ô9%u³6Rçl\\(<ğG¸­[œMJ9QÏáŒ\Zæmî7Ú:c,­‘íşµméwjëå¹Àá‡ò?çŞ„xUb,áËEÔcªŸş¿èk@İ°gk¯·µbßFÖ—è¤í\'×ô#ùUÛyÄ‘¸ÀdDqÒ™ÎN¹I9È+Ÿ¡«06è:­Weİ`£õè{ÿ\0:šÑ—{Ÿ˜dfœe¨œt9İz/ºF>c ?ˆSüó\\¹®ÏÄPˆ8ÿ\0ûqÿ\0&¸Ó^µxuEf4ÓE8Ókc0¦šZC@i´ãMï@	M4ãHh´ÓN&ši\0Úi¥4„S\r4Ó0š\0i ÒšLR¦’”Óh\r4Ó©\r\Zi\r8ÓM\0%­Ò\Z\0CJ¿y~¢ƒBıáõi¾ó}i3C}æúšJ\0\\Ğ:ÑE\0¥¤ïK@	Ş–E\0(¥Å ¥ ¢ŠZ\0:RĞÖ”P:ÒŠ8RŠAK@ÇRâ’@áMñ@\n)E¢€\n^””ìĞ ¢Š;Ğ1sKE€\nç´•›®êcc ŞÒ)XÇsêRÕÆŒ\rfê_k	in~@Ş\\~€woóé]vQiöñÛB0‘Œg¹=É÷¬O›[Vòåö¹ıÜci<wşŸ•oOªXI÷f$ÿ\0¸Â±©ˆé„’z•d-š…“¬‹û.3/ş:Â ¼–&G’Ü½Æ9¬ÒgD$“¹›;ù²{•%¦s|û`ˆ·©ì*Ö‹¤I«Ş,+ƒ—oA^·áıŞÎH¡QjèHá”œÙç6ş¿–?2BU@É!xêk*ïGX¤NòÕ¶ñ^£ã\rMşÌ·mª1æ‘Üÿ\0v¹_ ¨ÉJÖ0¸ÔN*KWNÙ¨Õš&Èàúz×tlmn$‹ŸQÅkx‡àµü^ƒÄzÜ:Í¯”ê(?ÖÛ62ÃÄ~ãÓÔÊ­ª<¦ùLnš¿Gş°ãßù}*²È‹&câ3ÊAéøUÿ\0õlC©#±SìÓ<YÈFàúÕ”£Í»ˆä¨¥÷¶‰yæD •º’dW¡\\m}¹®²Ü ×œÑöØyŞ7-<¸Ëø§U6öşJ6A ï[·íC\\-ÖígZ‚v³ìú(ëıkJ0NW{#“4Ä:t¹a¼´4¼/¦ˆ£şĞ˜~òAˆÁşõükfG§íTaT`ØUé¼¨Î>óp+K¹Êç—+aér®…[ÛÆbbŒü½úÕ5BÇj‚O «63ê)moyà^Ëà…ööè“Ş(’cÉÏAí]Q´GÎÕ©*šG”Ûx#VÖ-İ\"…H6ä®O5fãàÆeö«ÙgEè1€Xú\núNÑm,ã\n¨Ç ¯:ø‡¬}·\\û_ê­¸\n;±­a³%«<A>k÷v¦òÏJÔæ¶ÉXâ.8ëĞW=}à½JËvTü½JŸğ¯¹|7zÑ¬4ÍVÆm0\"¹±ä’ê~RI?{ÿ\0xwÃÚ–“s{«ÛÆ†$İö”P$ÏaşÖN­\Z^Öe}ÏÉíæµ“Ëš6Fô=ë¬ğ—‰K²išƒîWù\"‘ùÿ\0€·¯µzˆ¼§êP¸DTcÛgúW‘kş»ğıÖÉUŒDü’TÕ¡¦§^<5ERåÜrøoU	+Ÿ6b:éô\"½M½òÖ)Ğü²(#ÛÚ¸%¼>$ğÃHçuí‰Ş¬ÄgñkÃ>\"‡N±’+åU·.Üwí‚k’¥7RŞGÒà1Tğµôv§Q]y?ëO¸ìu\rÅs&õôë°À‡†Ò­ÉãM6EÚãşùãX·ú­á&-Ãıâõ®aS±İŠÆá§)£§ÓõUK¡—P22sÇ±ü«¡²”EvQIØÇrº{~¼¶DÚª’¤•àa‡#ÿ\0­]f‡â8®áX¦.³D2¬I^Ì?¯ÓØÔÎŒ¢®Ñó³œ¬™è3¯˜Å!E\"_˜né¼Àô>¾µ“öŸ³]¨ùŞ\0áTgîş98«VÚ´wV›DîUC¯Íƒ„Y÷ÖÚ,«sr®7d»Oıò:~9¬‘4pò©+\"ú^›I$PÙŒ®pŞÃ¸÷Î´,î#¹D–>ı@9\0ûTzf—iA@ÈQ€\\änj÷öm¸ùào)‰ÏËĞş’=w“Tp¼^¦f¿›fd_à‘XûğEp­É&½ûrÄñJ£ç;Oq‚¯<‘Lr2ªH5êaŸ»cå1t9ÚJÌkS4âi¦º@4”´Ó@¦šq¦Ğ\Zi¥4‡­\0#SM8ÓM i3JiJ`!æši{PzP7½:“½\04ÒRšC@i†i¦Æ”Pi(ZJ^ô\Z\0n)Sï¯ÔQŠï¯ÔP\"Ë}æúšJVûçêi3@Å¤¥¢(¢Š-(” ĞN‚”P÷¥¤¢€”RRĞÓ…6œ\0(§\nJQ@J))İ(iÂ›N\0¢”QJ(\0´‚–€E\0ìÒQÅ\0•ÌxÄ¦ûQœ+ûdWM\\§‹ImB%¢©4Í3ÃÖçO·2<Á™0R0	çÒ‘´‹@N×˜àúğ­¦ÄV¼qµ\0•d´‡vEsÕmlz:1šr’…i*+o›“ƒÈÿ\0\n¯ªX%•°X‹$1Üy­;)7Bu(ÇÔŠ^}»ÉÛ‘YFNúšN”uQ]Íÿ\0i«’LëóKógÛµzU’$í!ÆKW% Ä°Ú[Æ8ÚŠ?JêÊ†³•TrÈ@ÇÒº‘ås4†êæK‡ûÎÄı9£˜ÚÅOR–Mt£TV`t®—Ãµo\rêí¨ù¦ìJ6ÜÃ+`NBN>ğõ®_~O5Î0qM¤÷Œ¿Á§ÜëWwºE¼–Ös¿›ŒÂO%A@9ÁãŒq\\6 »gVÆ	\\Â»›ßŞG‚+ÖâòäŒû‘X5©IX~“.ÙR»kGÌ`ŸJàtÙ10èk»°ËB§Ú¼ÊªÒ>×.Ÿ5$Èu‹ƒ\r´Œ:ª“úW;á8|ËÙ¦#ı\\xRúÕ­â6+e?ûµ[ÁÉ˜n›¾å¡«§¥93›ïb©Åô»ş¾ãjAXº“fe_A[²¯³,m~×­¬l2ªÀ‘ôª¥¹çfwåK»=á·†ã´…o\'LÍ\'<º=+×tò¨¡@Åpz‚(ÑG@:W[et:ç½u#ÃœltÉ6á^¯Ü—×ïœ“Ÿ5¿{İæ¼wÆP5—ˆnrIğ}s[ÒÜˆnlè~=Öôdòb½k‹b0Ö×#Í‰‡¡ úQ¬øÎëT‚ßo§ÂÛã¶ó„b:yÚ9À9À8®HN\0âš×ÖöåØ×{­àäÖ>»§ZêÖrA8+ÁÇJp¸ãt6àš§ª±g™xv4oÉ¦Í’“£GÏñdĞÑ¤X[ÜjâÆñ vˆ9Ç\"º/iÓM­éšœ0ä¤Ê’sXåM¿Œ6?Ó\0üÏÿ\0^¼Ù+NIv=Z1^Îœ¤´Sü®¾ôÎ|¢¶Òßçÿ\0\Z†ãÁZ:.RİÁÿ\0®­ş5Ó`Q<Lı«ÏSŸsêª`ğÿ\0óí}ÈóûÏ[Û“±÷K¤[4Ev[\nAÁíŸOjêïìŒœU-*Ä#ä©#ñªs}YââğÂ‹šdrÎœ²ğˆûWAfVŞ<œëQØÛ,Kàâ°uÍQã?g„á»šÉ³¿-¥dÙ¹yâ´¶ıÜm’)¶-‘œe¸ô®\'qbOz³…æ³=¨Èõ85õkF@@”¡ô5Åê«²ş^1“Ò¥ĞµŠUçŠw‰\rDÈ:J¡ÿ\0¥w`ç­—â\\2pu¾Ïô3)\r¢½ã˜\Zm8šm!OÑN4”ÀJCKMj\0CM4¦›HšNÔãM4ÀNÔÓNíMë@\r4ŞiÆ“¥\0!¦šu4ĞM!§\Zi¤1\r7¥8ÓM\0!¤¥¤4)ï¯ÔRĞŸ}~¢–[ï·ÔÒw¥o¾ßSI@Q@@¢@@ RĞŠQH:€\nQIJ(iØƒš(iâš)Â€S©¢œ\0´Râ€S… ¥ï@ŞM§PKE\0PÑE(â€\n(ëGj\0i®SÅjF¡v1ĞšêÍsŞ-‡)mq˜Éúóı\rGs¢¸5‚¿÷‚ŸÒ²]¹«3ı«@É@ıGáU×-_ˆõ°Ôşeí<’²Ø«şF®_üÌ£ıš¡¦8şò‘WgÉ?AŠÉîoN7•ÎÇEºÙ[È§!‘yü+§µºÌcÜW™ø7Uİ¬]¾x‰+â»[ï,Äãµv#Ã–æN¿flµ#ı\\‡zŸ­fI(yí]eğ‡S¶0¾êİMqzÕŒ¥f®xaĞÖ±‘i‘´•²œri/½A$™ªr-!³?Ë\\·ˆXoˆwä×Lb’líS´ucÀÉø†d’÷Ë·ÆÜúõ›zš4WÓ†f_s^‘¦[ÿ\0£¯…pš-¡–ê55êÁbQÕåÖw‘öY];SÔå|Im\'^‡a5KÁ$:İÆ9#k1]ˆ-Ç›°pk•ğl¿eÖ´œy¢9õÿ\0¬jékNHÇ¹qT§Ñİ_y×I*¾Ÿvº¦[å‘×8=ëcÉÈç¥bkáìæµ»_ùfÅÜÿ\0Q¥Iëc,Êš>klwºeÖĞ¼×Ig|¹ûİy¯;ÒµU–5!ºŒıEt×ıjêŒµ+êÑ5½\\ßtÏí;%»„fx{ëPÃ©w\'õ«‰©)\' õæ¶Œ­©ÂâÓ<ÇíAô4¿iäâº?øi.Üéä+Z>Çé\\|ñ\\Ú±Y¢t#ÔWBše\"úÌ§ø…)œgnGÖ±şĞÄáA\'ØS5ÅÒ­MÍé)Ÿ¹pòAè=é¹¤‹Š»±¹käK#©u3\0¤ ê\'ŸĞ× Úüm¹yô=ÿ\0ëVÇ‡|è,n5Kß–Ys1İP>Uüó¬¿@×¾\"°È‰ZV>çüÍy¼÷”æ}²jzÕ»ˆdTH¬¤c2\0+M$eßÄ<²=j; Ûÿ\0WÓêjÕşÔÕ«DP€g« ı\Z³›<Ü_BU÷Ğ3ùjGéšàµe+¨Nçv+Ğ±†FÇ\"FÉÿ\0€×â+pºaüYÏçRğjĞş»³W&¥\nEM±sÀ§ÉÕÅZz–tÙJ¸­]m·‹VÎNÂ?ZÇ±Sæ\0;Ö¦áš%şê×Nã<¼ı¯©Ëåù”èÍWª~~)¦“KHx CM¨4”\0”‡šZJ\0Ji¥4†€i)Ç¥4ô 4ÑN¤ \ZCKIŞ€ĞO4†&ÒšLÒ)§­:šh\0¦æ–ĞR¯ß_¨¢…ûëõe¾û}M%+}óõ4Ó@\n)i-\nZJZ–RĞ!E:š)Â€–“¸ bÒŠn)hàRH´\0´áÒ’–\n)E%-)iJZ\0u- ¥ ”RRŠ\0QKI@ ¢Š(*–«foôù ŞW)şğäUÓIô sÃ7¹šÕÉN@?Âã¨üGò5nQƒTõ8?²55»\0ı’å°øêßÔ?ÌU÷†r	À9^ŒB=cV=OO	4Óˆë\'òçFì\rjºç?ZÆˆa…mGÊû×4O\rY;K§_	¡b­Ê˜®«JñL7(cåÉŒô¬›ë5™HaøúVöÒÛ· ‘Ù…m	İXó1xWNMÚèô¨õ#‡{\Z”êºl}¬=\ry|w×ıÉœ~5)Õïq=«[œjÇw=®—),Ğ…>ªqYwwZ-‡$nËœ×%%íÌü4ò¿¶ia±–v3JR¶ìÚ”e7h+–u]zk´u‰D6è2Ux®6k•I•äÁËn\"¶5Ë¸áÿ\0Dƒ)ùÈş&ôü*Æ‹¡”XĞ“Ë³(8ö¨•Eİõ;0øIÕ©ËªûŠúo‰ °o0C°ÿ\0¦˜ş•·ÄÓ[$>Ÿ½ÿ\0ëWE¤hzu°˜÷a5Ğ%­º(\rcñŠåua„úZXRVöÖÿ\0·Qçw~:T`dZF ûpµÏ¦«æêís\n¬R+«¨VÈ$wéí^Áu éZ”e±·Ï¯–µÂk¾ŠÌI0Ç7Í…Ó>‡¥T+Ó‹ølcŠË1u!gSšÚ­-©ÚXİG}i\rÔ_rEÎ=qøÔZ­ˆ¼´xÈ#Šæ¼¬ª#ÛNÛì:Ÿùfİ3ô=¿Ö»6B;VS‹§#§V8Ê{ì×™ÀÛ]Í¥ÍåH	U?—¸ÿ\0\nèm<@­!Ã`tèi5ns$c¼uÆkv³ZÙKò–\'\0ëÖº¡QKsæ±8JØyZ*ñ=\rq¶*ÜzÊãï×ŠÇ«_@0·R®;1Ïó«+â]MG_ ­’gŸ)Æ[Î5®>õCw®Úˆ‰˜ÆBŒ’pkÇÄš›ÿ\0ËÛ áP3j\Z‹|í4¹?ÆÇ9[qÓ‡;´Soúõ;gÇö–¡£ÓaIOñ€Çü+FÓo<G¨ıAAœ¨oâÿ\0Rh>\n–éÖ[vpFÿ\0^»­¶^°k‰>TŒtîÇ°õÏRµô‰î`²îWí+è–¶ı[0üexºv––@–qóü1ß‰şF®|=Ó\r®˜÷’®$»mÃ=vçÉü«“·ŠëÆ^ >i\"2wJÃ¤h:(ş_™¯P·	,h¢€ €‚¢«ä‚§×©éå°xœD±røV‘ÿ\0?ë¹~3Å$§Š_é%~\r`{3v3n›}Ú&{Z6‘æ,ŸïŒ~\nÆ±™Ë_—Â\rl[6¸ÿ\0?–k¹åâ·&fÚFzn5Êj¹»¾bÊÖº³nÒªà÷ÏÓŠÊ“Jd=3ŒóKc»M¸hfEj\"‹¶MU¸‡nkcÉê9RKs+r0¢©;š¸4õ+ÙC·ç=)“ÉæÊÍÛµ[r6²/T’EQÅwá)ï#å8‹›=5 \n(éEw,ô¢‚hÓIšZCÒ€ÓNíHh¦šiÙÓ@i½©M\'j\0NÔÓÖM4\0ÃA¥4†€½%/ziëHji¥4Ú%!ëJHÒAï@¤ ÒPâ…á×ê)3J¿y~¢€,?ßo­%+ıóõ¤ ´ƒ¥-KH)h´QE\0:–’—µsKM@Å¥Å%( S±M§\n-- ¥hÂ€hÅ( c…- ¥ Å(æ”½()E\'Zu\0½©)h\0¢ŠC@…Å\'JQA dVÑ^@ğL»£q‚+IeÑ&WÌM±\'ì÷û£=·¨üEtõ\rÕ¬74Æ6ê\rRá7tU…UÈ.qA ÷õ¡ÁÅr×Zn¥£e­î­È^¯áıGâ)Ö>*É:ïÇ^}EsN‹û\'µ…ÆÆëŸC®\nsQIb²tª¶ší„øÅÊ)ô”şµ£Ü2&ˆgÌÓG·gUhîgI¢+Š~¢˜¾ByUü«NMNÆ\0L·p\'ÖAYW¾3Óm”ù;î¶Ñµ3ş\'7²\"¥,5¨Ñj=\Z(†N\0Â¹ıÄpZÆÖÚ{®z<Ëü—ük3Qñ6£®1·…ICÿ\0,¢_øïRhş\Zyç98?ğÿ\0ZYCYïØçNXİáchõäWÑ4‰of.rª{{×q¦ÛD6«|±¯P;ÔÛ¦ŸhËÁ­gÛê$ujÂsswg©C4T#ó=\'J¸²\n®JÙqk0ù\nóÜãğ¯3´Õ1µ Ö\0‡9¨±İ\Z‹£7îWììÌ¤Ø‘øÖMõ¤zŒ%T621HÚÜr.$\'>¢’Îa+|§#uCV:©¾c„ÔôË«K¿µÚ®.cûèG¯Ó¹Çnâº\rxªŞêÎB¯±ËEì}Wß·zßÕtO¶ÃçF»d5Å_è>uÉ–\r– ¼‡,Ÿ\\w÷­éÔ‹\\•6îyÌJu>³„øº®ŒïZ êX2‘ÃÁ¬­WI‚î-²FNs\\„\'Ö<7 †ò,z0ÌR{ß–>•ĞÚøïJ¾T)%«÷\'ç_ÌsúS•	­cª\"c‡ªùjû’ìÿ\0ÌÌ¸ğe¼Äí?@À\Z§ÿ\0{¿å™ú%v–ú†™tŠşÕóÿ\0M\05d½ªrn QşøÅgy-‰P£?{G÷m¯aŒåŠ÷V·l¼3gjCÁ#»sSİxH²É#²Çô®kXøŒˆ\nØCúk7ô_ñ5¤a9ljµğô½%è¿à>£¨YèÖÆ[™}Õy ëÎõ]Zÿ\0Åº’ÚÛ!Ç;#å{³ëø\nŠ_Å|Ò<q7ŞaÔz(ÿ\0\"»-\'K´Ñíü›TÆ~üË9÷?Ò´¼im¬xQ­vk’—âÿ\0¯»Ô± é0hvBŞ/™Ûæ–Nîßáè+YdôªJ‘fÇzæÕ»³è\"£J\nVHÑñL’o”’j—Ÿ­CwwåÛ»g ªQ9*UHÖA4îAë‘[Ñ°]¸õ9şUÇønIoOš\\å¶·^§ ık¨s$Cã}ë)FÌò\'‹…I]3zĞ)É=êÓ[Âéós_ÛqÛÂüØäúÕyüeh¨@˜1ô^M.SÚÃb©Ó§ïJÆ½ôP&vóïÒ°nîƒ?“ùSè+&ûÅ^7—•ø›ü*æ‘lÄy–b2I­aç›Î¡¸ĞÕ÷%¹É´`=1ŸRHÿ\0\nÍ­mW÷p…=ÈşGük*½JJÑ>\"¬Ü¤å\'«ŠZJĞÈCIKI@„¤&–šh3FiGJi 4ÓN4Öé@i\r)¦ç4\0ÚJu4ĞI¤ïJi1@	Şšİiİé­H±¦fœi¦˜Ègl)µL;Ôæ¬ÎÛ¾_J¬Pæƒ¢\nÈšÈn}êpÁ†GJ¬Š\nœı*H>PV‚gº%¥_¼¿ZJï/ÔPb[¾ßZm+ıöúšJ@--PÒ(üiE\0¥P(Â–RŠ\0ZP(¢\0¥J(áKH)h£¥8SiÂŠ\r(¤Å( \nu4S¨\0¥ Q@\n)i.h\0´RPÖ–Š(\n(¢æ›NÍ! ¬İgF³¿‹ÎxJ?å¢|­¨ëZt¸Ü›HÏQYÔØÚ„”f›8y49Ÿ&ğı%Lş¢¢\Z İ&µ?\\ÿ\0…t7p˜d+ùT\nåkÛÍu>¢\rQ)[ñ2cğåëÿ\0¬¼‚1şÂjä>²æ¹’k‚;3m_ÈUñ/\"|çš‰V›êwRËğĞ×–şº‹g`’1¬PáQ]­´V±\0ƒ›¬\n;b­-àqÁ¬¬z’ŠĞ«¬’Èq\\ÌÁã|ƒ‘é]MÊù«ÍcÜYôÍRV9ê¾c9.İpzTË©È£©¥6IjÅ®ŠdnTĞÂš–·ÓÜ8EI®ÏD·xÑ³§ëT4½b …®šÎŒ\0fÑéĞºFµ°VL~5“®hQÜ®ğ¸nÄu­(ŸgCRI6WñHÚk©Â8h[^D“Bx!×rŸ¨5Ÿ7‚´kìÉk$öNyÄo•ü›?¥uÚ¼rƒ•ÏK[9*qWJ?8+á©UÒ¤S9ë\0ßÆq©ÛÊ?é¬e–j«x\'WSÍÆ1é»ü+­KöèÆ†ºİŞ¶XšÎ’á½¿rÑx&àÿ\0ÇÖ¦ wX#ş§ü+JËÃz^ÁÖ4£şZNwôh¼ãÖ i²j%Vrİrü5xÃ_=2Ï›NU/?é\rÎ;Ô$v:–/ùÀw¦›zÍkªEœ·z¸Äã­^Æ˜¸ÏzÌ×¯1o!°ÓH«øg&¥Yz\nÃ»¹k½^-ƒrBÇ×o\'ù\ZÒÇŒÄZ\r.§[á;`Š¬Ã\'\"?nšÜ˜ïtõXş˜$ŠÍğÌR-’™0N7gÔàsùUû™13@İœŸAñı+7¹ã7¡Ëë¤Iu&ÑòfëÓôÅcØÁû€ØäÖ¾¦\ZY/]rpBÓ4ÍÈÉfFrşf©»qllËN¬Ãƒå]u„]¹$Ë2J¥ee‡ÈäRLZİò‚[JßôÏ­L]äLö05Æù¡_öIşCúVehë¤ÅøcI¬ã^œ6GŸ-Ä¤Í-!5bÓM8Ò\Z%!æ–(¼R\Zv8¦Ğ\ZkS4Ğ”ÜqJzRv ¦)M#PZ’–ñ@\r<SæœÆšzP1Ji$f‚ÀÓ†àPiw!e$š@COcŠfyÏåA­Ã\0\nHÆ(8­\nqÍrlæ•~úıi3¹r)Wï¯Öƒ«2Ëıóõ4\nï·ÔĞ)Z))h´Q@ bÒIJ(E(£\n\0Zp¦ŠQ@«Å6(ii:€–’”PŠp¦N\0îÔ¢’–€GJP(\0éKE€Ğ(¥ \0Q@¥ Íbô\0QA¢€\nTi)W­DõEEêV»µDíÑ”µ‰\"•$bºIˆ^õ—\n—Êõï^k}ˆå÷^Æh5j\\®\r9‘ïBe·S0Û“j€ß	Ö9ÎÔnUû}\rMƒQ_[­Ô\rcÔCT’\n’•½ÓR’eX0=ÁÍL!Wë^~ÑÍm)Xäx¤^ª?\Z³ˆµK2K¼Î3Véö9a[Môv*qÅ_¶±Uí\\EŸš<‹@qİ±mñL`<Ä3î ĞÔ83¾–2‹êvD¬«„ë\\Ô3Ò&mê)=˜VF¿§ËÂŞ@àb³p}Øb©=¤Ór=E4İöÍbK©D+<D{8ªÉªnnG¨4¬ií›‰ƒ\nÈº\nÙ§5ŞáÖªË.îôìD§rœãi&ª´¤w©î­Q•ê¬fæ=®)†z¬ÏŠŒÈh±œª–š|sQ=Á5Y˜ĞjÒ9ªV,		äÔÈÕU*e`ŠY\0êkT>­Q×—fÚ¾ÿ\0*ÿ\0SYúrm3Jz$dÊ™3½ÔáÈ sèùÖ‘iæŒ¾À¡`?–j[<Š³æw;}6/\"ÕSv¢€=p¥™÷NÌAÚ]€ˆÿ\0ëÕËXÌvÙeî_>½ê´I¹úó*¨?Î²¹„Œ{‹Bm®%õ,Çëº¯é4ø†06ÿ\0ÔóÛìWnå:Õ†Ûmª @¬¥!¤6ÊÜ31#€€p?Ïµ\\š0¶Ïé¸ùÔ°Æ±„R9çè\0§]€m“İÇò4é?ySc‹Öÿ\0ä! ô\0~•jö«Íü¸éÇòªF½ˆì9î%!¥¤5BÓHÀ¥¤=(	¤§SM\0©´¹¤4\0†šiÔÓ@\r&›N¤ï@i†i†€šzRšc°\0ŸJ2G	Ö¡2îäğ*)gÉ<ÔFLŸaA´cbc&æ8à\nEl-Cæ\0qMyò>^”H_=OáMV,~•“<ŸÊ•Âõ4\0íÙl‚8¨AŒäRNxúP¸ŸvG¥J¿x}ET„ãVÓï/ÔPg4Yo¾ßS@¡¾û}hŒÂ–“¥/j\0)E”PJ))hÙ RS¨\nQ@¥)âš8PÓ…4sN€\ZQ@à(\0œ)/j\0QJ)( ëJ))s@-”Ğw¥ h \0QJi1@-£\0‡­´R*Çµ\0À¥rÊ;u¬kO•\ZRØÉº\nÇS<Ç#Š±ª]`yHy5\r’|›Èãµyç¡)Ğ+`qœT8¨¥‘®/w#l-ì?Æ§Rr8úÓG¯…Ä_İ{‹b¥fÈÍAiêjÑè\\©¨Y-Úä|²X²¼–ÍåÜGŸFõ®˜Œô¨&¶I—k aî*Ó±ÍV‚½N{6r“ƒéH!²Ï2=hMáøÜæ6hıºŠHü2ÌyœşWÌoªÔèŠ&;èó7Ò•#·•‚E®Ç -ÍoZøZÕpeó%>çô­ë=>U(‘>‚¥ÔFôğ21ôo³÷¤	ıÀ2çêOJé¾Íq*BŠŠ½\0¨¸§Y97¹êÑ¡\nkİEfj	ÔòµS•±š›\Z9ÌÙª’ÔÒ5V‘ñV‘œ¤Bıj4ù¢&iÔœ´ÁÍ+:Ä›œàV‰u*“É¨gbòD¼…É?Z‚I\ZtÈ]ÃõzX¾h:·ô¨”º#Í­Vû	o;@¦?3]‡íƒO¹º\0}É5›oÈ[\0p?\né<=Öˆêû¿YÜæ:ŠŸLc?Oÿ\0US•¡ãG<}+JåTYœÿ\0u€üj“©óá_áÃù\Z‹èKÜ–hAÑsÉ˜ÿ\0\ZÓò±mJ­x„XÆ£¦P~¢´Tn†#¹\'éšÄ¢n£ÈÁX¸\\Ó¯p ¿é§O 5,Œ$»i1ÎÀ?SQ_-àÏMäÿ\0ã¦¶¥ñTØáoÉ7rgÛù\nªjÍÿ\0ü}?áüª±¯alyÌm!¥¤¦MPh)\r”\0””´”\0”ÓJi\r\06ÒÒ\Z\0F¦fi”\0ÓU/åòáÇ÷*ÙëXzÍÑYÂáëøÒ.+Q¦L¨8ã­1§)ïTÄì8<àÓ\ZàÉëÆi›ƒù‡‡ŒĞÒp¿twõ5HÜg… Ÿ…4İ„œw .hŒnã4ğêztB6fÆãÉêÂ¥i•Õäö3¿8•=ê,„\'¯_sK$n=èÔm™@Õy>òıES³L±sô«‘ıõúŠ¦õ-7ßo­\0ĞÃæo©£µ#0´”´)h¢€œ)´á@…¥¤¹ bŠZ@x§\n\0QJ(ëN€\0)ÀqJ±³.BœzL-_nì¨¤Ò¸)Ø©E°\'tYô\'ùU¥\\0ÊíÇ¾Gó¹X¦;héwJ3±öuÿ\0\ZoØnü³ÿ\0Ç”ÿ\0Z9Yb—)´œù.G¨¦*yR>¢À@¥ŒSbŠv(Å¥¥ÅPIKÖ€(bŠZJÒã5,PùOçQ)$®Æ“nÈ`]‹œ|Ç¥T»¹)PrÆ¬^N!‘»ùVÄåœg’Çëï^}I¹3ºœ9PÖİ<ûFK1äú\nµw*ÛÁ±xãòZÁöhšGûÌ2sÚ³î¦if#“ÓéY.äKÎpr=ÿ\0úÂš“2ÈÒc¸ÆxÅ+á{zú÷&™“ÁÆ8Î=;\nf‘mj‹Èë(ÊœúCKĞÖTWÿ\0\' Ÿ˜zúÖ¤n²®áŸJ£ÖÃâÕäªEHª\Z T±·5hìE„„\Z±\0v¨á9r<T¶m:8°:TÀH¤\nqj–ÍĞ»±QÉ%5š ‘ñŞ€ld²UI¤ëNšP+>y³V‘Œ¦:Y€ïUd“Lw&™Éª9å0f iNØùsÏ¥E}(N•ÀÃ1TSéÏÿ\0Z©ÕdÔ\\†\\_Ånvƒ½ÿ\0º;}k=&–æãt­œ) ‚ªªò}ø«–É†b:?—øĞÙäÊ£›ÔÕ·Œ›P:cŸÔéZ¦<Û£ªj¬~éÆ8´íIh¾ç?Ö°lÍ“C#İœ½Òº_GÌlFv®1QŸëXVÑÿ\0¡©ôŒ“ÿ\0|×O¡ÆUÏ\'ò\nMÉf›Æ<‘“ò‚?•RÉÇİÏëñ­I,eHà~85F5S*ÛË?¥CØ]Iõ@ÂÚ(ÇMÃ?^kE[÷q°ùZ«ê\n¢(7`îèjÑÇÙA÷?Î dP¨óÛ?çšeïğ“ÏoÌTãí;çŠKÓ¶Ñ~\\à­mGâ2©±ç÷§7j¹éSİÿ\0¯f#õªõì-8NÔ†–œÓ†’ƒH(\ZCÒ”óIÚ€µ!¥¤j\0Ji¥¦š\0JCKÚ“µ\0\'je>˜x c\Z°õø\0hn3Á;[üÿ\0•¸ÕOQ´ûe«ÅÜŒ­!ÅÙœÍÑXå/ü\rÁö¬é¦*øöıióI\"–ŠL‚¼j›î“T’§­+šÜœNxÁÀÔÖÌ1½ºÓÖ¨üÜ)õ«0«?-ò§Lw4Âæ‚Nòg`ü{Tğ…%=ÉªñäuéReÊ;ôÆKşµ·¹Â™©D„ûz\nˆ.I)Ú«Ğ\Zµ¦Åö‡óH!ü ÷ MØĞ·ËŒÖ¦O¾>´”«÷×ê)Şå·ûíõ¦Ò¿Şo©¤ BÒŠJZ.)i)E\0—KÒ€RÒ\np4QN\0šrp950U_¼r}!„päòqôäÕˆÄI«¹½¹ıO‘ßƒò¯§Sş~µ2H‘œ ù½G\'ó©l	£†]ÙfH=ÎYñíS/ÙãÛ™YØóÈ$Ÿø?Î’ÚÂêì€±LŒŸóõ®‡Oğ¥Ää¤©dÿ\0ŸÊ²”Òİ–“{O\'(‘İ <à:À? 2jD·óÎ“°?ôß¯ø×igá\r6Ü†<ÍÜnÿ\0\nÒ‹H°…v­œCĞíÉüÉ¬%^+cEMõ8ô®r#~²0şf­cÜd’<ä¸oş½wÊ±D8‰G°Àş@Tnñÿ\0qyô³x†Z¤pm¡ó£ÏbãiüÀ¢}Á,¨Rx?Èÿ\0:ïÆGÜb=€6ä|Èà(X†Äóé4`FCÄØüôªÒhÒò?GS^‡\"Ù093î Ô2[XÊ¤úô«X¡:>›r«¸Bå}Bš®Q“ï)Q^ŒúEƒ¢²1î¤JkiÏ…Æï÷ÿ\0Z´XµÔŸ`Ï;Ï­®ñ¼;híƒlŸPúÕøfĞ…TüªúÔ	ö28p„ôæå·~>§ØIá¨7ô€\0ì\nOì;D?3Œ´OåŠ>µö29(ú1ú\nš+¥8XÇãÉü…u&ÖÂÜü£öıj{„xB¶xÅv.4S-)P•·{vKP¼H2‰€GJŸQÔòS…s·SŒw1ôí\\ò¨å¹¼`¢W¼¸ÎK:…Ï_­A§Û´Ó4òòJš+.Ì“!{“RİL O.>;v©4Z_\\\nó¬Øó!/şqO¹rä \'&œŠøœP‹#u#ğ5‡\nO÷Èê}ÍC?İÅD0®çÎ­ı£ÊMã×§­WŒWb}qJ.,H¸ÁÀ8úÓ*-§th[Ü¥ÊeNê¾•*¶ÓX€˜!‡k³àÖ®Ûßoe[GCM¥ZzKsZ9±Ş­Ç?½doÇ æ•nJÓ=ÌŞYÇ­8Î¾µ†/pzÒ5ùõ¢ÅûCZ[;Õ)¯\0ïYò^3w¨™˜Œ±Ú=OÄæŞÄòÜæ«³–¨Zâ%î\\ûp*\'º‘¸\\ öëùÑÌfâŞå‡+úÆØu¨åƒ×½AÖœ¢‹‡ «ïQj’fbÏ‹ÀõêÀ_J¥~H¾Ü~fšzœ¸İ(²º\'\nqïş:½gl}ıIş‚¡hÀ^iXÁ¹Šô\'bÓ“<dx+ß{OAö`;ĞŠ‡Ê\n\\z‚Z·§F1\"÷ÆáùÖ$½Ëiú+(ÒºÙÓ\'‚p*çü¿İE®—IÀ\n8<­@™~pM¼ØÎAşF©ÛÅ‹‚;â8÷­ó[KƒÁsYÙ&ú?ö£^±š–.¥İR!å[õN~€ÿ\0X\'uŒ~¹ş¢¢Ô‰òcãŒãó*0’ÁtÜH©‘\\ÊG÷°)·Ùû1#ÑN?*‘\0ûT¾ÄĞS/\0h˜g(#ğÅoGs\Z›}yş¾OúèßÎ =*{Ïõò¾j¹5ë­<JCKŠi¦\Z\rPMÒÒ\Z\0AHÔ´†€šN´ìSM\04ÒRšCÒ€ÓM:˜Ô\0ÓL4óMj\0Ã×tx¦â	”r?¾õ¬˜ìöì€`±åÏ½tzœâ	ş#À¬\\ùí)ÿ\0Y/ì(±¬v35±ŒàTâ¸#×­hKgsqnÆYùÚqÚ¨>›y%ífP;”4˜_RÂÉ,¸ÉÀôgñ«I ‡ær‡@:óëTm­.İ€ŠŞfú)­»\rÛxvŒçËSœıM\0äW³¶ŸU›säB½ÇO ®8–$€¥HÖ5Š€S¨!»‰BıõúÒšT:ıE,7Ş?SG?Şo©¤\0´¢ŠE( bŠZ( «O…4p<‡Ğ{Òl®qµFüÍL€!÷ôjİµ†ó´s[šn!„JÍêßtåYÊ¢E(¶cÙéwwîPªıtúO…0\Zfÿ\0=1Z0E 0õè?W#¸cÆHÜ~şºåi=c·-ÙØ[Ùªü½GñŒgğ«¢e\0®p=°?\nËYğ¼g½H[,Oüâ¹Ÿ™ª4\râ[éÒ£7’H gû :Î{¸Tãp\'éŸÔÕi5Hú(-ôæ¤£M®ÛŒ·=:Œş”Ã;ºôo©&³\ZòwÉUqõ8¨Y¥a’?SıiXf¡|uØ>¬)¦eyˆ3èEd–=ğ?Lg9ûÿ\0’Š,3dÊñæ£g^ÏÏ½c™_ûò ¤ûL€ÿ\0­—şúÅ+Ôgrp§#ı–ÿ\0\Zc<ªßÇøÕ·²õ™±Ûv\r*ê\'§˜‡>àP–¹˜€Ä~5_J¿ÀWıåoëM„˜œ{r(ûJ·²:tÿ\0\Z\n#kùIûÑƒîqPI¨m¼Ÿ@Oêjv!‰;\"luÊ)¨Q³˜ãUÿ\0pbœú«…İôXğAŸÖ³n.®\'àG#“ÇCş:ÚıÂ/\"1ÿ\0|ŠŠKÈ!<ÇçM0±ƒı—{sÊ\"^åˆÏåN]\"ŞÑKJÁ›¯®jüúïºÕ¸¬kË‡•‰É>ç§åT›ß]…P\0LV4®IÎy5n`I9?Z©!Âòi”ˆUÇ–4Ú½éÛ}j7;Ûı‘úÓÃÀÿ\0xÔ.7×Æ¥‘±’~¿áQ€=ÍU€@Œ¨:=³EÁ.Òà€?3éRZ‚dbİÿ\0?•V¸b!\0™Î>é“@Ñ°~M ¦p?–jn<¤Îw3cüşµ^4æVìª\0ÿ\0?Z”mxÆ~ê–?^ŸÖ›)24‘ÑÏ”åwÔqVá—Îİ¹qƒ*Qæ€8Â“úš½l›Sñ©“=<»šU9o ò‹ÜšŠ¯E\'êjrµŠ›³Ûök±Lãîá~‚¡l±É$ıjVZa	Äo4¡iÛiÊœÓDòR$EªX­óÚ¯CkÒªö*4îUß•Ÿyú[{c•t‹oXwI›æş*Pzœyµ>Z+Ô­$*û°Ö·tËbÒ–™OåYrGÌ`¦º-rdãø‰Jsg€‘3¯úCã P?Z·b¤]ô)ş5ÂN0_ĞÔğnC>„~5Éê^a¶Û±ƒøfº-5BB„úu÷ƒ2m²‘³?®+zÅ±o=w1RL)ˆ	súÖd’l¹¶r\nìú˜ÿ\0JÒ-û œ¹Î²Š‡Ç\në‘ø7øÒ$Õ¼æî&gK…Ov+ú\ZKÃ‹,ÿ\0²¸¦Y’údD|ÜüxT€ä!¯$9=¿¤»\0|¸şÊ•@[–Çñ*Ÿ×Ò›¨¦?rGèkz[˜ÔØà¯¿ãâ_÷³UM[ÔF.d÷Áı*¡¯^;{ÓM;4ÓL£Q@	Hii()\r)¤ Ò”¦’€\Zi;RšNÔ\0‡Ša§ša ši=sN5CUºğæ~Ò¥s2òO·Ş„÷kú\n§pÿ\0i¸Â´|ª*vÿ\0Fµÿ\0¦“~‚§Ñm7Hgaò§îiš½£il-mÒ!ÔrO©©±N\Z“!¤zRbF(‡ƒE8)(ÓJ¿y~¢Šï/ÔP†ûíõ4”¯÷ÛëI@J)@(¤ê\0P*T=zSUjÌqäóRØÇE,\0RÇ°¥odÇB¨;(êj+e$av­xØ’±!vîÇ úÖR‘I-âŠ >]ßïôü»Õøäy:¯N˜•GPg\rŸn*ÚÜÃú±’?ˆõ®iHÙ\"x |e†Å#øº~U`I@nbç¦f5ä’tãß×ñ§/˜İˆğ“MîZ4ùşê÷ëP9f$»lÔ\07\n%^;“úT‚q·æ÷#? ¥kàLdäüŞ…N”y¬8\0Œú|£ôÅIåòã=òqúSüŒñ€ßˆşT‡r«K)ş\">†£eİë“ë“ÿ\0Ö«Â5ù2\0R˜ş´Ï% HöäÒ°\\¥¸…Hı³“ü©¥Ø\n¢‰«olyäñU&\\‘òşX«‘Op?*O5z~ŸãMp{Ê¿@Fj&POv?AEƒ˜“tYûÈ>†šÂ#üjÏÒ¡e¬cñ¦7lèiXi“EW#İM0³)æP~ª)›˜÷j6™Àæ0jlUÉ\Z|œ_ûïÆ¸í¼øjsÿ\0L×şúéP¼àÿ\0£ğ¢Ã¹<“c«Ui®€à°ü*6t<àŠ…äOï~Gü)Ø.2[ƒÛ?T•Ù‰ş“VÑN=Æ)…YW§åLŸ20‘ïUZ=¼ó“W§ÀêCn•JgÇÔÕ¯)şııª6`£=‡êi[ß§zŒÄg¨è*’Ær~fêJr\0C6:(Æ?ğ¦0ŞşZş&¦}ªJöŸğı6m÷e àp¹#§ŸÖª]Îx\0\0ùöÍ_˜„GÈ2Äûg&³.$-)|p7ÓœRZ²–Ä–ÑŒ‚~ûødT“Òävdıÿ\0^aA8Úœÿ\03QÈK<?ˆcğÿ\0 ~tu\Z£÷äb´¢\\ ÕF2LƒĞäş\0V¢¯2=Üª¢æÆ¨ØTÄTdT¹]–˜V¬2Ğ±ÚšB±ÇÕflöÍO©=«NÚËÚ«a¨\\­§N*ôV¸ê*ä6˜íVß¥Kge*%ƒ\nq\\ÌÉJOLúŠí%ˆ®Juÿ\0‰„äq´ßT©½O+>©G×ô*°>zŒr§?¡ÿ\0\nêt8\0ŸâL×8ÉşHìùıkªÒ\"ÚsÈ‰‡ä¢œÙóqZ^G‹ŒuÏËN10cÛ“úT“€n—8î\'•ºC“Áÿ\0ëT\\È´Ã~—ƒÔ’ç[öj\ZÍ	XùV¡]909Æ•nYœÛÛİ—ÿ\0A‰‘zN<ö”·óÿ\0\nÌ„ã\"góÿ\0ëÖ4d[òæ¨Â¯_Ş®?:D\ZW‡}™õà~•Ãû1?ë©Oš¦—f(½ĞõÏÿ\0Z Òÿ\0äë¦Z@Jx˜Û1ÿ\0õê-UˆØGf?Ê¦aûÇÿ\0wÒ Õ›0©ÿ\0lWEÌ*lqZ˜ışïP?Ïòª´5Xû?Ìä*¯V;,m!§R\Z¡\r ÑÒŒĞR\Z\\R@	HiM%\04Ò\ZSHh©§¥/zC@Æša§ši c\rs“=İİÏ$Q”SŸ+v=3ë[·“y±xğµ‘+y1uù›©¨”­±Û… ¦œ¤P’s¨^D*Å¶ªá®Ş·…c^Š?3T4½,ÅqöÙÜÉ…_OsïZ¸æªúÕ-ÌÒØn(4¦ŠÆÒb–’	INíM4\0”\'ß_¨¤=iSï¯Ö–ïŸ­‡ûíõ¢€”S{ÒŠ8SÔsM\"ŠC$Eõ«pE¼‚AÅEo9qéZÖÑÆ\0-YÊE$Kmi‘™x^Ê:ÖšH‘(\0€éT|ÅNO4Ã39ãåÏækİš+#A®ulûzP’nõ#×µTw>?\ZW½Ty©åì;š*û‹Û­=¥@Hr³6k#í2·C±O~™şµ4(­ƒ´ÉêO\0QÉÜ9wHÈ\'ß\'ô«ñÉÕéœÒ©Á\0P¦ÅÀüêâ	2›~¤Ô;\"•Ù:¤xÀrƒĞœ:xUQ”•sşËf¢X•ÍƒìIoçRÇi$ˆÉÏ ÛúŠ‡4R‹ä™1‚ìqìGéş¼›8’(lƒV~ÄÙò=NOëA‚R;Á÷_şµ.x•”ŒññºÜ(ÿ\0eñN\rmÔ›‘øƒV\ZÏøJã>àgò é¤ç‡9è8ÿ\0\n9â>VQv\'\r(·b¢ip9şuu´ùO~Ô\ra7üó“?î.de	%,OCøæ£it#?Jºöw#îÛŸ©\n?¨šÎSÏ–§è(º™I˜Ÿ¼Äş¢|uõ«¯i!À\"1õÅC%¾ß½,@{\Z\\ÈveRHş#Ï¾iŒXóŸÒ­b$0±ö¦:*–\"ÇÓ5<È¤™Q²O2ôÒŒ:ù„{ÔîÌ?\"ã±8ÅU–F#;²?¼2Gçÿ\0×¢÷†HÁ;@Çrj„óƒÇ_jtï1úä~œ~µZFÈ8}ñŠ´‚ä39èİ}*¤¼äššGP0=qş5RItàU¤\r‘ÈØéQ*8ÎãúSÏËÉëÛ4Í¥˜ÇüşuAqö‘å‹aO\'Õ¿úÕ$h%¹\n8Ì}}Ïµ<¯•2cÛßü÷¡•a„D¼nû-CWº”;I\'÷º{\nÏŒ6»Èıj[Ùwå3÷?:}ª|¢L``=ÏúU%d[}	%á%nG@§¡”íŒàò¨?­K0\0…äûš…È`£¦æÜ?¥)í\"Ä’r?Zº²m}I?­N±{ŸYƒ§ÉF(‰–˜S=ªÆÌô§,94Î´®VzU˜mrzU˜mIíZV¶|)›F™­—ŠÔ·´ÅX·´qW£¶µKfğ¤T[qéN0\n¾ Å5¡¬›;©Ó2î#Â×,y¾º÷p¿Î»Û˜¾C\\EÄd^ÜŸ½ü]\'©àqmJ¿¡RæKõõ\"º$p}¢‘¿Oşµs¶ 9wòÒé1åèê?ZsgÌEhX•sp«şÃş8©Š…B}\nüt…G -vŒ8A?5!Âƒ÷|¿ı¿úÕrÔ¨F€sˆŸP3ı+bÈ•¶·ş4ş•œSl*ŸôÊCúV…‘?Ùñ·pëı(&H·_²ïÇT\'ğ5KYG_˜UØÓ6ÅGüòÅPWÄÑÇş4‘›4—8Èşâş<Ôv	ÿ\0é#Uúş4±Ö1ş_õ§iØ[{‘ßqşTq9•‡ªgüşU_X!m“?ßZ°˜2®{¡­UÖOú*z†È×MÑÏWc½;›ê1ıj«·Gúƒš¤ãG¡¯R;LojCN¤5B\Zh óHM\0æ’—(\r%)æ’€Ò\Z\r! 4ÓÅ8Ó\Z€\Zi´ãU/çòbÀûïÀ¤Ù¥89ÉEîeûEÁ?ÁŞ«A½»\0‘y?J\'q[GSZ:}·Ù­Æáó¿ÌßĞVqWw=<DÕ*|±,ı)\r-©ä‰ŠLS»RR\Zi´ãM4JJ^Ô‡­\0!¡>úıh4\'ß_­\0Xo¾ßSE\r÷Ûêh \0u§SE8P—­Y†<‘P Ï£m\0Ö¦LfŞ<ĞTí8A…üê»ÌÊÔÔbL÷Åck—±iK;zÓüå‹‚}MP’ë©Ó½\"İrsO”.]iÙÿ\0ˆñßÖLÇ¨æ Œdõ\0v­x•F[§¡ïS\'a¥r[{@@f\'ıãı*òyh1Œúw5S~îsøÒ4Øû¿sNM›F&¹\n\0/·Ò£käs#gĞV<÷ÑÇY¤oî¡ş¿şºf¾œæ(â½óü«j£zH!£ğáıhà}é\'wiT\nÇk6f{¢ÄûÒ}Šİ>û¨÷ùòÀ©°Íøõ+¥Çà%Z±ˆpãâ1ÆAë\\¤‰§¯Ib$z«ëUK~ÅHİû=¨.wkâX…;¤?ì¬müÈ«+ª£Œµ¹±1ãÿ\0Asü«Î3œ¤9úBşÍO	ÀıÔÀ{BßĞÒäC¹è‡U´,6}aÿ\0²Ó[Q³‚²1ö+/˜À‡•qô‰ÿ\0©4nŸ½z¾Àê){0æ;Ãqk!ù¢?S»üMA5ÎƒˆãcéÏõ®(äc|—dz3(ÿ\0Ùi–ëÕÿ\0½6?–)ò1Ô¾©bƒ!­Ô~¿ ªÍ¬XVHËwØ„Ÿä+š7\'(ƒèïçMk¼•1õ8şTù˜Û¹ÖPò€ãÕ²¿Ìÿ\0J¥&¥+µPäÍe´ò•#r(>ÕÈ§ïÏ»Ûÿ\0\Zj\"æ4$¼cò´Ø‰Tæº‹8$¹ÿ\0i‰¨Jî¶÷øÆAÑxü‡éÍZH.sƒ§@9ªÒÜ?6O¶jf´‘Æ]¤Ú;•úô‹l¨	ÆTuÇõ\'üj®S!›ş”Ïº2~cşzU‰f\\`ŞÃ¥D\"’c÷r®@?ÔÓ±ì1Éıøš³\"ŞÇ.z±ì=½J‘¤8-ÉÆÇè5\',@#§·ÿ\0^€v…yd=N0;û\n§s9%‰êy$túS¦œ7Ê‡\n¼éÿ\0×¬Û‰wŸ-xù¡\"Ó°Å&â\\ç©Ú£ëŞµJ„ÂôTãò^Æ ¤¸¨Âı}jIñä¿O§¯âi°L‚Gbƒen¥<§›vQGÊ /ëÿ\0Ö¦«ƒt]~äKÇ×ÿ\0×Šµ¥ÂI2‡¡¥\'dua©ûZ±£`\n™V–4ÍYŠ{f²GÙF$qÂIéVb¶$ô«Û{Uû{QÇ›:éÒ¹\rµ§N+RÚÏÚ¦¶³éÅiÁkÕGdiEkÈ«+oV’\nvĞ;TÜÖ0±TÀ=*\'¯2Ô-&tBÆeÌ)®ü¿œcø‰ı?úõè7+òšà5e+1÷?Òª–çÏq*ıÌ_ŸèÊ¶i†r}H®§F\0BKs\\ÍŸÌ’sÕ›úWG¤–ÑƒıÓÿ\0 Ó™òQøKNdÄ~<Óæå\0˜Çş9Og®Ò¿­\"¡[Éò92qø\'ÿ\0\\T˜µ© I>P<†Å^ƒ)pˆÿ\0}U 2-Ïmüê{FÆ”¤öcú9¦DXN‡N1YVëºHw9üÅjBryàş‚²à>^;üÌ¹ÿ\0b’2f¤dû~ï¿Ö“L!ÒàôÌ?\nï,‘qØŠf—¸ÁÆCÂ„&L¿ëÓ# 5[[8²÷OëV“*¨ªºĞÿ\0Cú×UÑÏSc½ÿ\0] í¹ÅS½š·yş½¿ß\'óªÒ½8œC(4v¤&¨B\Z1Ji Í%\Z\0JNÔ´†€\Zi\r)¤Å \ZzSM8ÓM1¡­€9¬y¥ûDí!û‹ÂÕİF}‘ùj~gãğ¬»–òã¯SYÉô=<+/hÇYÅöËÂÌ3|ŸA[=j+o²Ûªcæ<·Ö§ªŠ±Çˆ©í\'qZ)i)˜x¤¥ji 4ÓN4Ó@	IKÒĞ\Zï¯ÔPE÷×ë@™;}öúšZFûíõ4P1iÂš*D]ÆÛ¦{rjé}ƒhªñ~í2zÓL…½‰©Üd¦L÷à~´Ç˜Ÿ•J‰›°¡M	™0¼jA!ì95_vM^Ó­üÆóŸ„^æ”•ØÑrÎßbyÖ®*’77\0vÊ’(ËáÛ…Kµp8Ç9\\è„Dšq#=:oz¦|ë£ŒíJ™b2şòCòƒÖ‡9\03lCØu?Oñ¬ªC!‡åDóuö¡äb	v_ à‰ı)UY†Õ4ôãSGn‘¹Á=\0åøRT	da€Tö?tŸæiÇOg%¤òş¯ÏóÏò«„Ç\0m\'¨êM:(®§oÜÆÏFã‰¥q•…‚…ıŞ×ÿ\0v3ÇãŒPatËw.©ü‰­4Ğw°k«Ö?îŒÌÔí¤épŒÈå‡©`?˜©æyñgQõ™Ûù\n¯$q—–0=K·õ®„Ç¤¦AŒÎ;`³còâ¦]%ôä$qóãúf`±È²Y“‘s}Y¨û-«tyıØÈşµÚ. ¨G“£yƒÕ‘ÿ\0 ÔSjSô\Ze¼Cı¥ÇóaG0XäE²§ÜY°ÙùµN–’0ÊÁ6=HAş5Ñ,—ÍÊ5ŠgÖ=ßû1¤–ßV~—6Üÿ\0r5Z|Ác\rt·~JH>™ş‚ì¤£Ü’?©­‘¥j®¸{ G÷BŸéP\"ô7ü|ºQÇèhæŒ¡§@KÙ#ú\Z“ìh£û¿îŒ~µªº³øüº¤gÙ<:\"?;LÀúÖaØÆ’+{s»Ì‡>İ0\rB÷§ú¥šCèˆ\0üÍm¾§Û0>jôrÎßøé¨ßÈ\"i\\úù{GæqG0¬`9½™³¸Ov%ÏøS$Òä|5Ìùöc]‘]¸ÜÑ¢Ó2dÓùUˆà$Ì¡û‘óËÿ\0¯T˜?e†,`Ïñ¨¤ÜAÊà^õviWr!ç¬’qY—@ä€d=?ÙhDnÀ|ÌÇ§\'¹ö•FiÌ¹\n\n¯N)ggvÃ’[û£€>µBk‚çdg8à²ğ°«HWâoùg\0»/·Ö’Ş\rìª¯¹¥†İ›\n\0Àü…\\…B!Úpñtİş«`¸æ)`p£‚¼j³»ª\\¢ûçòÀ¥$NÅ³ˆ”d{ş½FçÏ™Tğ\0Æ=+\r1QvÚŸ¼m£?İ\\ÖŞ!LVJ(dx\\ì_ë]E¥¿+9³ŞÉhóIÔù‚jüÇÒ¤¶¶ÏjÒ·¶àqY9]JÈ µéÅhÛZsÒ¥‚ØzV”cVmŒ)$†ÛÛ*âD\0àSãŠ§T¦¥+lCåÒö«xéLeâ™)•˜T\n´â«Ê)3x2Èù\rp:ÉÅüãĞJô•5ÀëJ¿nŸ¹$QOsÂâ_àG×ôe;0<“îIşUÒØ`G=ÏåŠæìÈÄ1÷†2k¨±â2F2Úr>A|$¿4„úıÓ¢!¥fê|×ÿ\0€-1‡EÎw0üy¦ÄRsŒÈãÿ\0ºõ4›RÛ@oçV-ÿ\0äŒwsÿ\0\Z©ü6lO]ãô5jÌ“¦ıÒø¤C4`}Ğ«gƒª1x#øœş¹©­_}œ,>P?R?¥U\r°ñÓÌaš“5 ­ÔgÔşµ–Ä5Ö{ğ§Ú¸(‡#õÍE¦¶YóÕ—?Ê„&X‰‡ÖªëGızæ¬ôŸÛ\'ùU-i±n{×]ª9ªìr‡÷Ì}óUŸ¿Ö¬Şñ1Y»×¤1´‡­-4õª\ZniO4”\0SM8Ó{ĞÚ’”ÒPOÒšm\ZiŒB©\' ÓÍPÔç!VûÏ×ØRnÆ´i¹ÉEŞo:Wº›§Cö«£3Œ¤gsQ\\±a’xÀïZö¶âÚˆu“êk8«êzªŠä‰)¤ëKŠ+CÊÒšC@i´ãM=h\r!¥4Ó@	IKHh\r÷×ëAéBıõúŠXo¾ßS@¡¾û}MMÉMÚ´˜»çÂ£İÆ“vi¤æ’@;=éÀÓ½8S`MoUŒwı+vAaŠ¡§EåÆdÇÌİ=¿ÏøVÄK±\0üÍsU™­8ƒ°yéŒPªÌ’ıĞxŞ4æÄ¬Y¸E ¹ûÌ0İ_JägBÛ3Oe¤X™Ûs±â–4,Û›©è*^\0ööïô¥`lP®{}=éQÇîAE=do¼Ô*n!› ûª)e¹	X~B“\ZÅn2qîOz_í÷HYúU‚I9ÜÇÔ÷«pÁIóş_ãRÑW¸Š.nr^W÷`õcÓó©¡°Ní©œõÆOıôßĞQö¬ñÇCŒ(úõ\"¤¯ËÍ´zú‡ëPÆZ@!æTOBä/ó<ş¤7²Ÿ–&R`Y¿–*‚İX[ËŸ!®eKÄ~áDúÕË`şîÿ\0ã£üjl3bİ¦oõj8îÚ\0ı3V6¹ÃI<_/l–ğ®un/eıä†hÔôg+şëJÑyÌ×q€{o-şX L„î:š\"ã\0ëD’Ø É¼oveCş5Ë4v1(iç©UÇëšd×:d*\02IN¿¥ tlÓH,·à0ëÒ¡›SÓÊ24‡=T*çN©d¿ñïg&îÄ.MDuiS?è²z“‘ŸéMD\r÷Ô¬İ6ù7rÀIÇê*Œ²!|ÅbÙíæqøñXÏª^#V„zy¿ıqU\'’y›|[7¹Ïõ5J\"¹±-ûáƒ4#°”Ó“YójÍĞËßU…ŸLàUó`ºÏ¡ÃıíÚdöSñªQÉ\'»‰Ûq3KÜoÂşƒ5RKâ8DHÿ\0İ^OâÂ æÙ>êK õc´ñªRŞÌW÷Q¬j{ãhızÕ¨Šå‹ŒÈÅ¦\'şw7åÿ\0Ö¬Û«ØãPãÔõ&£“Í˜ÎdÇ§\0TkhXıİÆ´H’´²I?Ê~Tî3×êiñ[\\çbtÜGòkÈXÈ2a›¨”¥rwË£)…È¶\r¿0ÛxNî}ÿ\0Î*¼²5ÌŒƒïÃÚ+µÁ$‰œnöô ’U‰/Ê@*”o°\\‘ØBıÕõîi‚D…1äôê³Èò\0£üèç¯5¼h7¸¹_föîGÛ„ˆ\\úµÛÙÛğ+šğ°XÖBMv¶pôâ¸ké&‘÷y%P‹ï©5½¿µiAN)¶ğô­£Ås6}=*vBÃªôQJ$«q¦)¤gaÉJŠr)qWc‘È‰—\n™‡5Ó±q z­/LÔò0\0’k2ûU´´¾™êy©µôFüñ‚æ“²	ÇÊkñ\0Û{)=À#ò®Z;\\W5â	–æS4@í+5¬(T‹¼¢ÏšÏ±ØzôT)M6ŸB­Ï’§øUEtÖ‡÷l=ñ\\Äcd™ô#ô®–×%\\ú3TI.¥¡6pÈ;†õ¢ßnz»Qı*l:œÿ\0Z —bèãõg©±—1~6İ°ÏüjÕƒŸ±“ÔdÕŸÙôr?Z½¤°û4ª{ıi	²ÎvÙ[¿1çşMC)	æ`\'çõ©-Ûf—u!ş…M—¤=Œ€ĞŒÙ¥hAŠ,zšƒLœXÍ-Œ‡ìÈqĞãñ¤±aöÆÀà¡ÇçB-±ıèúŸåYÚû¢ÖƒŞşzVOˆy {×e\rÑÉWcš¾ÿ\0^O¯5U¿¥Yºù}	Yè­Q½©	½©¦˜„4PhZnEmøcL‡Q»f¸@ñÇÑBk²›AÒŞ-¯elF; R?ÍsÏË”÷0Y\rlMYI$ö<ÄÒVïˆôÒñqjÌÖìvÜ˜Ï×¸¬\ZÚRWG—‰ÂÔÃTtª«4!¦šqéMª9ÈäF…› 5ŒÒ–/pıOJ¹©K½–İO»VuÆdt‚1’H”İW	MBòëùiP§k‡è¼/¹­Sô¦ÁÛÂ‘¯E:´JÇŸZ£œœƒµ%-! ÈJCKHhÚCJi(4Ò\ZSHh”ÓN¤4\0†…ûËõ\Zï¯ÔP&Nß}¾¦Šï·ÖŠ9zÔ„à\nbõ¥\'&€4SzS‡J\0QRF»İWÔòj1Vm3;T°6m#È\\ô^qW	È÷éôªöŠgñ©ËÚ¸fîÎ˜ì5» è({äôs·\'© |Š¯è+4‹¸æ<àp;štj\'ğÕ7^õ9ÈÏÖ›VÔl²ã€y4Ô‹€Î»‰è¾´ˆ7åÈ$g\n=jÒ+pxG-ıÑíRô+qT 4¿¢õéØU¤$ã¨ÍFdXÁ\0áGSëQ\ZSÀşµ›-›¢	šİî23Àês€?\ZjŒıãè:RJGü´=:(è)SåÆUİÏPş?Ê‘ehÉÚşA\'‘ùØ{·Şıj&7 ÇÜO¼ßSÚœ–áAóËQÔ‰¤\\ÆJÄ»ñHK7øÓ]Üã“ÿ\0|ÿ\0‰¤šòÊÚ6)™}ú\n¥.ºì\nÃû?/ëÖšWË3G.wI\" n™ıXÔ%¢F \\<¾YÏòık:K¹İ·m‰®Ü·æri®×²pe¹`Oòÿ\0ëU(Šæ›KnÃoy)ÿ\0\Z†I“MU#¼Ä¯ó\"©¦™pp ™¿ŞlÖ¬/†¯ˆæOÃÌâv1®eÛòÇgö`ÿ\0ãPKs1ÿ\0Yz}[ÿ\0¬*Ûø}£Á–xØ¾Oä?Ænİ$V>Èqş\Z.€Ç‘ãns,ÇİÕGõ¦”Œ¬1\'¿\'ùÖğÒìĞó;“İb]ÇúÓ¿²-º˜Ê¨ï4O™Í´R¹ÃHN{F¿Öœ4¹-åÇŞsœJèˆ·‰JÀ ã«\"…‰5FpÒ°n[‡#ó<~B©1fÚ4‹\0êz(üi…]×/Şè?ÄÕé‘äqÛˆªR¸Êï*¸œŸÄôhL†r–ì0Ózz~Bg,ÄÌw°ş~Qõ4ù˜D›rP¸êßT“÷‡\0a{\nÚ7-‰$í $Ÿ^ŸíP„ÉÉ56ÎÔ¡q]Ğ¤¢MÈÄ~ÔõAŠxõZ×”:O	\0auô|ş•ÚÙÇÀ®Â³ˆ¯Lx`}kĞlÀÀ¯ZŒı‡ê*˜hùhh@€UÈÅWˆ`U¨År#éˆ5«q*¼u:¶;Öˆä¨É—CëT¯µ[M>%ÌñÄ¿ígé\\¦«ñ\ZİŸ”Âş©­iÒO…v\'C\r­Y[Ë¯Üv2Îˆ¥™€©&¹½SÆZ}V9>Ğã´|Î¸;ırûTrnn©9Ø¼(ü*˜æ»éåıj?¸ùÜWËl4mæÿ\0ÈİÔ|Y|HGòÑ:şuÎÎw33RsQg4ıÙé]ôéB\nÑV>sŒ­ˆ|Õ¤ßõØzœÔé‚0psÖ«©Ç5\"75v9îÁ±w§ u•·o!1½wsøÖbU»gÚ=HÇ±¯7…ûq:)ÖÒÌt¯ó`tÛçJ€™›„şLqMr\0×ŸÊŸaË¤úæ¼ë\Z\\¸¬>Ë$?­\\ÓˆçLs’çT·iãÔIÔÿ\0…[ÒÛtÒ¯B\\şª\rCZõ/@Ù°#?u?œäòıÒXí{R}qŸÊ›)İGfV©B.XIşmÔ¶G¼ÿ\0s¯ãQécı¼Š’Ûmã´cùÓBe¶ûØô¬]y¾P=Ål·Zçõ×ùÀô5ÛAjrU0¥9Ü=êjV<ãëPšïG(””½©)€†Š\r%:È#W>¦ºw¸,:×áù<µÏ½n5Ø^5Y{ìı[-¦–œ{$.®Í…ÌgÑ’3ê9Ê¸?zìg¼ßò“×Šåôëo´İ\"ò)ËWVvŒ®|ça]\\EÓŞW_üRÃÂ¶«;Ü¤ÆU\n8÷æªjÔ´È$™b1 ÎaıóÖ»Ë6P€dJœØşU1ÄÍêvTáÌ\"*M5Öÿ\0Ò<,±TyŸï15&•m¹šå‡²ÿ\0Zõ}oÂzN¾	¹„Å9é<?+~=ã\\­ák­\n5#lÖƒåYS·ûÃ±®ŠU#&x™¦µ{ªñîŒŒR\Zv)¤WIób\ZJZCH¤¥¤=h\r7½8ÓMcM%)¤ bR\ZZmĞ¿}~¢”Ò)ù×ê(Ã}öúš(¾ßSH:Ğ1ëE%.h\0Í8SiËÒ€*å€å¦*˜«–G‡Ò¦[7 â!ô©p©ÍEf%úTÏ÷Áö®¹Ò¶õÆ;SdçøSÿ\0å·Ö£ûÒÄĞÛ$Aóqü#?=ÁÛ·×ŠH‡SOsŒR{‚‹Œ}Ñ€=MûÉëÉ÷>ŸJ~@\\úUWıãz…fË@3#dôíNÆü*çõÿ\0ëR‘Æ8\0uúS€%y8\'üâ³(aãåuoğ¦²pş÷Ãüiİ~QsíUîîÊ!E\'ÏùïE®1óİ¥°Â`óùÖ]Íì’œ¸ö-Ğ~0,¹üùÿ\0õÔÚ<Ä\01İñêj”Bå?)æ˜´ØU¸tÙÇp¿WÒ8lĞ|››Ó·ÿ\0^¡æYÎ|½”`\0(Õì/P[`X„Ï¢üÍùÓ¢ ~æØÄç˜¶2H;Ôô,?AÔÿ\0*”}ŠÙÆPNãş{sù ş´ùÌ6;ÛËOúd»TÀøÓÅ Ÿ>IçaÉXòÇó«Iı¡x7$^Zâ”í_Àñ5!±LµŞ<às±FØÇáş5-$\Z”B¬K˜maäp[ùä}*EJ¹Ğ`~güjq=¤dˆ#-¥¶?àXÀı)ZhÎw·Ì{¹±øgùÒ{å÷\"\\š¦m&™wG1şü­‘ùtı^_¶Í¢¢’wşCõ¨nB¸¸¹ˆü1ŸÌñEÄQ–Ä›‰·Œà*Ğf«LÑÆ\n8\0XäşUm°ëˆÖi6úqõ<ùÖd·Q±1ÄêqÔCûÂ>¤|£ó«@U¹‘‚ùP„Ÿæk*âì Ú«Éÿ\0=jkû½­…ùŸÔ°b¿Ğ¥gcœ“’{×e\Z<Ú²[Åœîc“F)æ“×¡Ûc;\"¸§â—h¢@0-=V—m=ô¢ÀKjíÈêpÊr\rzN…õ²È8nŒ¾†¼ÙE_°Ôæ°I•#©şµÉ‰Ã{U¦ç³“æ¯SŞW‹ßüÏY„ä\n´œWÅã»˜Ğ!½zU[ßê—`ªÊ SÚ1ƒù×œ°[ÔúêœQ‚Œn›oµ¿ÌôkívÃJº¸D gnrÇğ®OWø‡<û¢Ó¡/üô“–üOÎ¸×‘äbîÌÌy,Ç$Óz×},#¬µgÌãx^ê—¸¿¿ü‹77“ŞÉæÜLò¿«œÔaª0iÀñ]©%¢>~Rrwnì\ZrŸJˆ585P‰ŠvqÒ¢İÍ8÷ 	Aœ§µC»ğs@ñVQÁD0êEŠ\0½»€?„gùT±ˆó×hªÈùÓ÷•\0˜8±¯7†·¿hO£.Û6ë9†~îOùüêŞÀÜsÕ‘BÌ‚&_\\ÿ\0!Vty2ç¶TèUæ4msSMâ^á€ıqI\'0H3ŒëM³Ê¬êz’Hÿ\0¾³K!*Ò\'ª°¨kMcör?ºÃô©m\0ûkc¦Ğ?Z‹M9VÀã ÔÖ§7|z@Å·Ís\ZÓî™½ô®šVù[ØW%«>éŸõß‡Gc6CÈ¨ÚœıiÔ×j0ÒPh&˜Òi3Jh¡”‘­¤H5qîïYºËõ<Á$×‡=d~±Cİ¥9î2Ã\'½P{•Ó U	îcü«¢ğş—gí7)½sò!éõ­{¯éW_ël b}°J¸·ÊÒêe:Õ#Yî¯o¿Èà`ñ«C7”eô\'­t>.YËVn~xräüúp®VWR?Zˆü7Ò#ÿ\0y.àÿ\0vmÃÿ\0ÍO\'fk\ZÕ¯i¤×ÏüÛ]B;´Ü¤¥Ip±Ío$2üÑÊ¥}Erw¾Õt76W\ryc.¸ÄŠ=qÜ~´È<Pnm™™¹HÇsŠ¨ó]!U•5)mÔçpÄg¡Å3âi¤×°~NÆšJ	¢i(=i\rÒ\ZSM4\nâ\ZCÒ”ÓMÒõ¤ ¡Î¿QE÷×ê(,7ßo­ §7ßo©¦÷ c…-&h ¢’”P!Â¬Ú¶	ªÂ¥€íz\Z™!›ö¯º0=*ÓöúVmœ˜ïZ!²½+’qÔŞ/Aã—Ú¢øb¥C’*1÷‡Ö¥\r“GÓéKûÇÓŠlm…4±t#ÜÒhi‹)Â…õ¦ ä‘ô’M98³–ÅÄP2@ŒÀúp)Çå_vşU·9¸ZÎÅ‘Í(T ;š¤Ë»ç|EjÌ€9çî¯$Ó#ŒÈÛÏÕV°†Ãnd}Çt…\\r¦Èó“×Xûÿ\0)xDÀà×Ş˜†y8ÀÎ(µÀŒDòœ’=Û°öıĞÛ¨*¹lä¤šp-9Ú>Uçš³\n\"7î†\\pd=¾•[{ÇcsvKÜIöxÏ;GŞ?_ş½\\Š+{5ÿ\0G7ŒÃq\'éÒ€9ëŸåFøÓ$¶ï^p?Ş¢R¹J6ş‘<ƒÌuSß3~])¶‡“<D‡œû-VŸU@ÉôTùESkû©0cò­××şµl­\rgH¢@`ö†\0üê\'¿)€{Aÿ\0Z²İ\\°3ÜÊXÿ\0gó§9$êÛ¼ãÍ¨åî+“Ksæ.VÒY¤şõÄ?^*¬³HGï\'¶¶öŒäŸ¦6[èXlŠ™`è*ÅÓ/Şh¢\'¶A?’ÿ\0RApš(dåãiÖé¸ÿ\0JÈÕ54‰<˜6oÏa¿ıÂ—P¹ò#İ\"ÈûòwÈ§ğëXå²zšìÃÑæ÷Ä6/$’I$õ&“­8úRb½(«Å.(ÚGjpZÑ ´ğ=±I¶˜¢:æ)q@SŞœ)\0§\0(ÀÓÔÔcëN ç4¹¦ÒƒE€pæŒşT™¥æ€	¥¦)Â€\r<JŒRƒŠ`KšPÕj]Ùâ\\™O 8ªêxÓÃb–¢lw«HÀş5AŞ§‰ûRı‘Û3ƒ“1ïSi$­ÂfşfªÇ&Ûõ5ƒí¹ç†çñ¯G’ZlÍá+›¶ç&P:ò>”’\\GşÖA¥µùg•{OçQÜ6×ˆÍşÂj[Ò‰UÁ=T*Ó›œãşªƒMä`œU‹Oøø#Ş…¸=‹3œ+×¨¾fork¯¹8qWgt‡5èá¶8knW&šzÒ±¦µÖ`!8¤&”õ¦Ğ04èĞ¼Š\0Ïzmlizc´^s©şèÇjÆ½E6ÏK*ÀËˆ4´İúZ@…S¥7È.y­a`Goz[\rûIŒ“»Ç88-ø×Ùú|©rÅ#GNÖ­ åàcµj&­jãı`›ƒ4däÛÈÌ{´Î­$¾±Áòd¹‡ıÙIşy«JH%*rz£Un¡~’/çR	Œ‚\rsßğŒ\\¡ıÆ¤ÿ\0öÑşUöšÆœ¥È[”|£ó~G­—arS{3nK “€;ı+Éü¯&úî5á#™ĞmÆº‰|Cö­¨§¥s÷™Û»ÈÌ~¤×V\ZÒ»è|×b•*^Ê½ššiM6½á Ği)CíM4êJ\0i¤4¦Ğ1´†–ĞRRšC@hO¾¿Z\r\"}õúŠ	,·Şo© R1ùÛêhÍ”RP:Ğ1Ô¢›J(Â§S8RFÖ_›¯µ “+ôşUÏÂûH>•­m0ãĞğkÄ¸³AzR7\0¦©ÏÖÜ…jÆÆ—O–&ëõ¨·mb=ñB6óÖ†2F?0 9ëP±ıá©cç¬fke8úôªò6:v4„ï>Õ	÷õÍJCl†AÑsîjx—	îyúT#ç©©Ãu=ºş¥S@…#\'ŸËŞ£+çIµsµ{úš&“j˜ğ*h£Øc¯V4íeq^ìtq‡`«Âÿ\0jV•#@£8\02I0\n®§Ö¡w)vûØÀ·µfîÊZ-ÁQ—Æ{Ãüj”“É;a3Üö¤\"IÛ,pè*M¡AÂ¾ÕJ6îF‘¨äò_Î•\"š@ƒÔu?_ÊœI\'l`Ø°şB¢FÆI›.z–äÿ\0õ©0!Êà›x<¥?òÑø\'úÑöd;åsõ#©æ¬´ÙoİG“êy?ıjŠh$sºâ`£¿?çúÔŒŠE³…1,í\'}±óúÕi®d\'’ŞÑ ‰’ò*Vš8ÛĞ™éş*ÂñıÖÚY1¿æd^;}kZpæ•‰lÉ¿¿šúS,ò3œ`dô•YìšlÅ>Ê¯¿5ëB)+#2@¥‡=©BÔ«=cµHvR… TÁZ]€óU`\"ÛÇ4lÈÍJW4»i_j]½ªP¢‚1@ŠP´üfŒHC@¥¥—¦1)A iq@-&=)Â€RƒE(Q@£t Îy¥™J8 	÷§nô¨§Å\0L§ƒSFõYO*5\0^‰Ï\\Õ‹fpp?*ŒMV¢“k©ëX×§í ÑQvw:H5Á#£Qİ>cùÓ-fó´®BõúS¯1€?Û?Ò¾}«3ªúôã—#ÿ\0öZ¹hÒXz£¥>qÖ®[œ]°úÒêbkÒô®&s—5Ùjm¶ÙëŠ”åzx}\Z»‘šCÖ–šMt˜ˆy4\0IÀ“ĞÉ¥7–E5,ìp\0ï]†¡Å§¨–@$¹=[²ûñ¬kV5®ç«•å5qó´4Šİöÿ\0‚PÒ<2Ä­ÅğºÃÿ\0Å…t\"§î¤/^]J£¼Ò09},?gEz¾¬‚áQ “ƒµnÂH£…Wp\0\n£}aq©[4Vò¬GpË°Èâ¨`ë/Ëq˜÷\"£]ÑÕî¶Ô±Y[¡Í#Ø®D¾·bIh€şáİSGâ¶sFÚªU;™<=şs¥fÛÉ5FöôF:Õ&×­æ‹zÈ>•w¨†$)ŞærJ²ÜÂÔÕ ×gòø¿{LŒ‘ùÕrsëÍM~Kj±?Â«úUs^•Ú\'ç™Ş#ÚV·a\r%)¦šè<P¦Ó³M4€;Siİ©´\0ÓA¥4Òh:SM;½!4\0†šM8ÓhR/ß_¨ ĞŸ|}h,?ßo­7,~´PP´´QH¥))Tf˜…ê`§\n\0‘\r]¶—iª\0â¥GÁ¥«ŒŞŠP@5eä*9î+\"Öq÷MhÁ.ç‘XJ64LYÎ{Mßƒštã¯¡çéU÷v¤•ĞîZfÉğ©à<­SWÜ¸ô«6Ç‚\\Ö5\"i=øfÏ¥@ßêØş<€rÙÅA.v0òjbŠld<’Ş‚¥?*ãè*÷5#šmj	è\"\0Ó©=gñ«¹Æpjñ¾—~~oSŠr¸rOAÒª±idç‘SÈ~RFƒhÈïÀ¨ŠêSn8Àïı)¥K£\0øñ5!àcŠh @;\n\0PŞ_íİ¿Â“`±É*€\0çÖ\rízš,®NÈ“ŸANK#ƒ).~½*ÔVáïù}9¥§höê}ª»\r!¾D6İ@Üz*õ¯8×ï>Õ«\\>PÛ\0ÏaÇô®ßR½[X]Ë,ET¶:±ÿ\0\nóIX»\'“É®œ$urb›è+œ¦´ ‡j¥P²ˆÏp?º¼š×<\nõ#©˜€c­%ÏgJÑ\0¢œĞx¥i€}ßzJ¤Îhh\'Ò“š3Ú€.)§P\0(#¶(Ï¥(9¡\0M;£­/SLcS±K‘F9Í\0 £ŠSIÓš@RsIšG^i¤óFê>–›œŠ7P1á³R#T©Uğhê7JµgA8«·=({J¸\\Ç?0lê9«×gv?ß5‰c;$êøˆq[w…è9í^.Ÿ-OS¦›º\'ÒÜ‰6öÏõ«Ğÿ\0ÇãgÒ³t“‰ˆükJ2~Ös\\¶Ô·°İa±nÕÆ¹Ë\ZëõÃ‹s\\su¯N‡ÂpUÜm4òiI©-!ûEÌqö\'\'é[É¤®Â•9Tš§Û±¿áÍ<DŸiuıã—?Â+{$\n­l¡c\0v©‰¯¤ÜääÏ×ğ8ahFŒ:~/¸âÕÉHZ Ÿ>[€qyôâ¢çS]M\r2ş7·VYÏ¢&F\\†Ï·âÍâK)™ZR¡Nµjiş9‘°|ĞÃÔ\Zèä’Øò2Œİ›³=H´g®µG,pÍ+*²Ÿánk—°ñL3–úÕ¹µÈ¢Œ¸l¶8æ¦ï±ºQjêF_‹4ëK8şÓh¢R<Ä_ºAïZÃ³¼İÁ4ßjí5œ™bLŒëšÇÓÈ\'k¢;cŒ/m‘£pâI‡Bj#KM5èEYXø:ÕI¹¾¢´†”Ò\Zfb\ZN”´”\0„Ò\ZSM4\0†šiÔÓ@! ÒP\0i´¦šMaHŸ}~´”\'ß_¨ a¾û}M-#}óõ¢Š)i)hiG”Pæœ)´´\0úU<ÓE(<Ğ\"Äo‚+Bò3ÜVRjhä+ĞÔI™¸$Y£ªr­ô¨â¸ÛÓ¡§Hûê°îIØæ¯[¾yìk%[­ZÍµºñQ8Ü¸³PŒƒP0ÈJ™[# õ¨¥séX$hÈ!ã#Ò¥cQ}Ù=êMÙÚ}ªšÔIè	÷ÏÒ‘GÊŸ_éJ¿{ô tÎ:b“\Zã(i¨?J“øi|Ÿ¥GBúŒÇÔ.|¼­ÓØR°,BúÓÛ\nP!­À\n&¬Ä‹ç‚İÏ¥E\nóZtŒY€\0œÔIô)–MÙ’{}k>ëQò²’Ò3ßÿ\0­EåÑoÜÁÀîŞ¾õŸ .%zA³7Y¸\"ÚMçs½3\\»uõ­ılùvª¸åÛ¯Óÿ\0×Y¶e¼æ/İú×£‡…¢g\'rÕœf€)ûíËSË{ÓAøÓ7f»R.ìRdTa³NU\0ü÷¥VÅGº”7À—vEÅD\r87	ÎiF¦ƒJhìÒæ›šPq@Ç\nu2@ÇdçÚœ´ÚPhİéi(>Ô\\àĞix¤ LiàÓ	§°¨˜ó@j7TLØ ¿€¶)»»ÔEóŞ€Ô›u85Aºœ¯Ÿ­j6ÁëW#zÍFæ­Dşô§¾[+á9®’bLHH8=k”…ùÒ[\0Ú|.3’0Ùõ¼ì|tR5¤÷E4‘sß½j)ÿ\0KéØVf}ø\ZÔı)Oª×˜·6{µöÄšäó]_ˆÎ!æ¹3^„á©¸ÓVt×Ü‚j©§CŸ9qOğ3ĞÉ—ûe?ë£;{Œ¨«!³YVg–<\nKõQÁÅxÍj~«N¥£v^fDûÆ±õ­@,,öª×Z§^kSÔCFÄ;ÕÂ\r³“ŠŠ‹9ÛôSa¹,r~•™¨@û8ØëİxÍh‰\n«ÎıOAYÏ™X¹ï^‚J*ÇÅU“©7.¥«]FX€*Ä\ZÓ‡XšUÚÌkœVŸÍ“Ñy©åF¯8«&Mwç]Í]BŒş&´ ‰`ˆ\"ş4È\"Ædaó7è*jé§3ê>U°”\Z\r!­N(¢’6—4†€Ò\ZZi Bf’”ÓI `i(4”\0†ƒÒŠCA,Nh_¾¿Z	¡~úıEE†ûçë@¤o¾ßSE@¢@‡P))s@Å¥¤éK@… Ò\nZ\0p4ğj1N•_(—ÔÕaN•‚äûù©ãz¦\rKóI¡¦lZOÿ\0õ\Z¶ë‘ƒĞÖ4rm ö­KiÕÔ+}kšQ¶¦±•È[ ŒõRƒÛëŠ’xğsPŠ7\"¶\Zq²ûÔCØõ©s—STÉd¢…P>´/$ÒŸdÍªüù=)å€ëqëéN\'¯°4BJ3ë“øPŒv(QÔU;ÉŒqìSó\Z³+\0åğÿ\0:Î™·9sÎ*(®ÃhÛÔãš…—qæ¦a“Ô¾õ¸D®˜DÊR9í|ù÷‘@§î¯?ÿ\0XT$¬hp\0Æ)“L$¸–\\ä“…>Â¡g¯B”l¬ÙÁ4Ü“Q–£un€—>ôàÕÿ\0JPÙ¦»èV¨·~TàsŞ€&R†¨AçƒNi	’î¥ëQ§ô¤˜÷¥ÍGºœP™¥£\r“N\rL	E8}j5<Ó¦€àRx¦ŠQÍqİx£ÚŒúR\Z\0kš®íƒS“Uæé]äÃsM2ç¥C;çšŒ=!–wûÒî¨sO\r@†§æ¡Í8\Z`XWæ¬G\'J¦­S¡¤”/œWI¤É¾ÁĞ“ò¿øñ®NÁ·ôWvóc\0*	½sbãzl¨;HÜ²¾ëü«Tq:b²¬²&ZÕÿ\0–¨kÇKSw±ŸâC„Ú¹f®›Ä§åJæMzT~†§Ä0ÕË;rJ¹éÖ«G–EAÜÖµÁ[H	öâ±ÅNÉEIÃ˜NiË-£§ÌI®ÄK°Y·ZĞ@5J{²I9¬é®Íq¨ŸQSËŞ’OÍY×S4î±g¦›$¸Ë‚¢ßåDÒ7Şjè§§‘‹Ä7îŞË¸ˆ— ªäà`P[’OSB)cŠÕö<äí¨°©f¿ek±7à*¾™b1æ8àtÏzÔ­iÃ«<¼^%ü\nJZC[`v¤¥¦Ò\04”´”CHzQŞĞ1\r!¥4Òh†’–Ğ1)	¥4ÚÄïHM-! HJUûãê)´ª~uúŠ\n,¼ßSFho¼ßSI@íJ)4½\r±ii(udQ@Å¢Ec©E ¥éA\"Ó…4RĞPáN\rŠ`§\n\0±äU¨%Úpj‚¶\rNÍCE&mE ¸iÁaÓŞ«KòŸj†	v0ô«sñ—G?ZÆÖf—º S†5b3ònjªŸåVaä~Ö”ĞâLœ~tğp´Š:Ÿz ¬æ«aqO·\0#9¨³ÔÔ¡q^™ëS-†·+Ü7Èê~cU$ãñ«2ÎÍU]±–ëUÜ$ÈROAüë7U¹0[ÈàóŒ/ÔÖŒŸ*ß©ú×7â+Œ¼p£qı«ª\nìÄÈ-ŒSKÔ/!Í7yõ®èŒ°Z”\Z…[ÖzÕ…Éhæ˜\Z»Ú˜ÇÒƒMİH\rAÖš4¡¨ı)A¦n¹÷¤\"MÔn¨÷R† u 	ƒ{Ò†¨7ú\Zr½\0Y\rOV&«©èÀ4ğØ¨éêÂ˜gµ%GºôÀGTlxæ¤-Ÿ¥A)Áâ“—zJËQ#f¦¼ŸéQ\"â¤	Ô Ô@\Z\n.ƒšQšh¥š`H­Šš6æ«¯Z•3@¢l7N+kEsöŒÎTñšÁˆò+cGp—‘{ãŞ²¬¯nu„ùƒÖµÏßJÈµâQÍkg•¯\ZÚ›ô2|HÜ¨®tÖÿ\0‰Ì¹¬`£©â½\nzDå’nVE‹,aú\n\\º;BƒDåAÅfêkÏ›çŸ1úÕ°ª—^¾¥	e&ª³Óäj€¶Ü¿P:ST•Îz•,®À®÷	ØrßZ¯w/™&Ğ~U©İ¾Ï\'ïµS\0‘“ß­t­äÎ\\ÏQ1“Wôû3;ƒŒ(êi,t÷¹mÄmOS[‘D° Dõ§_Vpb±J+–;‚¨E\n£\0t§Pºä7q(¥¤¡’Àô¦ÒšJ%!¥¤ šii3@„¦šSI@\r¢Š\r\0%4Òši \ZLÒšm\0„4«÷×ê(¡>úıE,7Şo­%+}æúšJ\0viE4RĞKE%-BÒÒ\nQ@Å£½P…-4u§PH¢M¥ ìÒƒM¥xÆjEnj*rš[G«öòo­eÆjå«àÖSEE#kãŞ¬ÛC(ù…Xˆ`\nÎOBã¹?jkvGÖšÇ$Ö	jj\0n zâ¦”	ì2/½ŸLšK†è\'«-¤\'wªÌ2àv^MY‘ºÂª±;}ØäÖ°Fs •ÀË1ÀœúWr×3É1?x“]6½sö{2€üÒü¿‡zä\'l×]5¥É±~qIº˜íƒMİé[Åˆ˜>)ÂJ¯º—~*®-	iD¸ª¡éwšw–¼ŞhóUƒæ—u;…ËB^ù¥óª¦óK¾\\·æZ<Ğ{ÕO3&”5—<ÀhUCûÒ‡4î-o÷§ç­UKæQp¹hIR,œõª\"Ozx’€/,´ñ0@JE/›š_óÅ!œU7Ş”Iõ¦2ğ›=é²3UVLT²½i6;®?ÖSRÎrçšAR&<qNS8j¬Áã¢š\r=y hp©c¨ÅI¤&Y´l[lÑ·0<ık5:ŒU»sƒŠM]XGkk1yÈ­|ıÚÅ²}Ëäœ€k\\¼fµ7¹â3™éYV‘åŒ‡·´ü@wJ˜úU8°ˆ\0kV|´Ò]OO$Áû\\C«-£ùô*İ¯ZÆ¼ä\ZÛº<\ZÄ¼ï\\±>®²2¥\'8¤Eá…:ŸzYNÒ[¿Aõ¦Lßg‡h?3WM5Ôñ13ÖÄR±¸Ÿhè8­;=%Tœî=BöSM‹÷€¤æ·Ûï\ZŞ	6yÉJM=Æ€\0À\0ĞRÒâ’¶<fQŠJ„ÑHhÀÓsKI@Ã4ÚRi(\0\'ÚSI@„4ÓJi\rµ!¥¤=h†›Ji\rˆM! ÑÚ‚”©÷×ê)(O¾¿ZXo¾ßSE\r÷ÛëE\0(§Sihu¥¤(	!Â–QAC¨‚”P¨¤–‚Zœ)”àh:–“4£¥t§\nh§\nÆy«–İ\Z§ÉÀ«ğ¦ÑQ\"‘?pÕ2¥B§-íÒ¥A’?:ÂF¨—8ömÍ9ÎN)¨7KÇn>•	XEÂT2¶I>•3\'YÏoÄÖi]šlˆ&=ó¨_©§–$–¨[&º\"Œ™Íø”H.Œ—·\n}+š¸Jï55³)\0‡ã¹k½H&<­Z®£î³²–¥J~Ò&sÍ0°Î¬Éa5¸bøeäU68­ã4õG-JRƒ´Õ‡Í.ê„œŠq#5ªfD¡ÉëĞSƒTïšvî)Ü	ƒ\n]ÕïÎ”6y¦Û³KQf”1õ¥q\\\Z\\â¢İKº•Âä¡±J İÍ;};äÁéwÔ‡­;8z•óëFú.‘\'©¥ó*¯™NG0Ñh7zppj°~Õ\"°=ñEÊE…z‘[Š®Z‘^•ÊDr¹¥SQ3|æ¤C‘M<Ó‡4Ğ3R(ª…QÅHzTJ•cbsS ¤)ê´„ÉUˆ\r@£*œ\ZuºC‡µæè1ôæ·à)®kÃòî—•«}œ,A‰à\nòêÆÓf‘ÕhgjçuÀöªLØ,ò¥iåUelf¹g.f}Ö_…úµ¾ïÔ¯s\'QY7l0I8¯Îõ™tÙ\Z\"kUè`¦³m%Æ[!GÒ‹™wƒ•ªWš#	@ãiçkv«VVæŞ „å»šëM[Cæùj95Q\ZÚbn™}kõª\Z\\xŞ‚¯Ö´×SÍÌ§v¢- £4ZPfÒšJÄ4ÚRi(\0¤¥Í!4CM&—4†€Ò\Z)	 HCIJi3@Ä4†”Òf‚D¤&ŠC@M&h£4!¥Có¯ÔRP¿}~¢[ï·ÔÑJß}¾¦š(´¢’”P!ÔRRĞH¢”SE8PR½©3J:P1E(4ÚQA,u-\'¢€BÓ… ğ‡Ò€©(T½J¨=?ZWè@Ö® 8ÍG{}2jÂ€¾ø¬›-\0/SÍMÀÉàŞ”ÈãÏÎß€¥sÛó¬Ş¥¡º°è*KuÚ¹=j ¦G daEL¶±qCÈª¤ì0p~ñÇáSJøîj«séÒˆDrc\\í\\~•	§çN\'\'Ô‡\n	ïZŞÄÅ9;\"Òïl‚¨Ï¥h7sTîO¸\\®î}Õ\Z\n•%ÆMÄJÀƒÜb¹‹ˆ¼©}+©œ×?©¦Û†=æº°òÖÇ‰›R\\Š]ŒÖ¤§0¦â»“>yS¿5}i@Ïzd‚y4¹ÁâŒQŒ\Z`.iA¤Å\0¤Òn¤9¤4®‹Rn>´ÃM&€%İFï—5	z7zQp%2QæTJ@ù<š.2ÎüÒ‡Ïz¬±ÀÅ(cEÊE±!=ië&;ÕEz•I?+”‹+!\'ŸÎ¬CÈª±¯LÕ¨Û ªE¢?¼#Ş¦Fª²8Yˆ÷©ãj¤È,©ïS)YZ¤İÖË,«R	*¸@>ğ\'Ú“íG²1ü*H­Ù¤iN_\n¹¤$´õ˜õ“ö‰HÏæ)¦iÿ\0çŸëQõˆw6X:Ïì³qg\\óS+«t5Î‡ºÏş´ñuyn¦F\\(ëMWƒêD°•V®\'uáÙ6¼©Û\0ÖåìùEŒq–®;Áš“^OpY ù½y®˜’Ä±êkƒ5Í¡ëd˜/iSÚÏhşğ?Èc*¤Ç­X‘ªœÍÁ®4}dŠs·ZÌ²jíËõ¬é[5¤N\ZÒ+KMriÏOrÂ¶‰æT5ì—e¸8ÆãSÒ\"ìŠ5öÍkªšĞùœt¯UùE%­†–šhf’ƒE\Zx šZm\0â›šSHq@04ÚZi \Zm)4™ 4†–›@˜R\ZJJ	E-! ¡(_¾¿QIÚ„ûãëL–Zo¾ßSH)[ï7Ö“4ŠRŠAE\0:–›J(%Š)E%-\0‡P\r ¥.iËÍ2œ(@¹éNŞ”Å|b¬Ã:ƒógğ¤Á	šz¡ôh@ñ>?x>„UØâN¥À¬ÜìRFJ[Êİ#f+)O,6ÖªÄ€q*ştï,xŸ÷qPê¢RÛËç¿©§„Uäò}*ÃFÄü±7ãÍFm¥n£ĞTÜ«´…\'ôĞ¤œ.I5kìÇ¡\0ØS„dp\0Û¥ˆã‹bã½,ŒzÓœìª³H©ó;}Næ›ÈäúÔ,J\\¿ `v¦ã÷5ªV3ná£ŠŠSòç×µIÀäşµXı+:ÎÑ=<ª´Ä+ôÔÈÅgÜ·QWd<\ZÍ¹nµÈ°©±JcÖ±µ4èß…kJÕ›z7FEoIÚIF6ôš1ÚšF)ì9ÅFkÑGÊÉ\n>˜\r8U£1qN¤¢˜F=(¥¢ÂÒ)ô„T\\ÓJÔÄSH \nóM+S•šV€ ÛI¶§ÙFÌP41#§JrÇø§ªb¤Pæ‹â$x<ÔÈ6ò)âœ(E¢LşTàqPî¥ß‘Ce¤T¼˜‰¾^*KVaò®*¬ã|øõ8®ƒG³Tc\\Õj¸ìw`°ª´ìößLš~¥Û>œVŒÆ|¢~µØèÚlA(+¦‚Æ$\ná^|ñgÚarjQì7‹Âwgf*_øEgV½/ìéŒmÂ¿İ‹¨ÏF8\ZhóøF¥ÃúRH?†½­Ğÿ\0¨Í²zPª2cˆO¾yëŸ4ÖSF0¬Ê@\'µvfÙGAPİ\"CÏ$ğk\Z®ç-|¾.\rZF“f¶°ó]û»zÕÇl\nwlõ†”¤äîÌ°Øxáé*QèE#U)ßŠfÅgÏ\'ZqARZ§lš£\'Z±+dš¬æ´GUÜˆjÍšnTÍ_Ócıè\' æµGŞ†‹˜N)¢¼š+²*Èù\Z²æ›RQA¦bÂ›šRi(!¢ƒIš\0”\Z;P1§šJ^Ô”%4ÒšCABQÚŠJ!¤£4†‚@ÒPM%!i§­)¤ &„ûëõ¤ïJ¿ëê)ˆ´ß}¾´”¬~vúšJEE%-\0.h¤¥Z\\ÒRƒ@…šfiE\0‡\n\\ÒRĞ1A§Í0S¨Ub;Õ¨.Ş>‡\"¨ƒNŞ“WÍ¸u1Æåü^Šş#×?–k™R¬¤tjÍÓ)HêÒòï­L\'·<ïú×(·S:x»”õÖ³tŠS:fdeÒªM\'n3õÉ¬_8·Ş+øóFàGß¡S9v[ÂO}sU÷‚rpO­0mşñüã_áüXæ­FÂnä™ÉÏSMfÇ==ê&¸ÀàAP³–<œÿ\0*v’MßJa<SKb‘›ŠæÄ=R>£!¥îÊ£ë¡­Åf\\5^™¸¬Ë†äÖöª²¬¦¨ÎsVånµFcÖ´GVgL¸cP¦¬Ì3UÏèAİ&|¥hòÍ¡½)ÀÓ:Ğ8­ƒ%œ*54¹É«¸‰¥˜\r.x ç4SsIšBšJ(Í\0&)1N¤Å\0&(Å:Š\0h§PqF)”…Ï4 úShT–‡n œdŠmàT3DBuÊ}k«Ñ€RµËÄÒWñ®ŸJ8+\\XÏ{\'ïæzÀ*×AÏjætwùVº([#­yÒÜûêğ,ŠcÓ—ÖšæÜé„ÓÜTf¤¤ÀáA\' ¬‹©ŒÒ“Øtnúã+å/âjƒp*âs×ôDlx¨$lTqUg|\nÒÇ™ZâLf³f~MZ™òj¤ëD:’+Hj5<•U£ŠcW®+VÁvÆÍøVlI“[®Èzó[A]f2|”¤Çæ’Š\ru£å˜f(¢	E”)\r’€4„Ò“I@›ÒPi(\Zi3A¢€ñM&”Ós@˜R\ZZoZzJZBh(CHM.i¦„&hO¾>¢”/ß_¨ ’ÛıæúÒR·ßo­%…-%\0´QE–’Š\0u.i¢Š>–›šPh½)i)hA§fš(Í\0<\ZPi”¹ 	C‘Şœ%næ¢¥Í(˜ÿ\0)Şyşª€\Z\\Ò°‰¼öõ¦™	<š8¥¦É7Sw\Zm¢ÃBçõ¤fâ‚§;S$8çU—4Û>ï-¢éaãı\\‚f¬ùš­ÎÜ\Z¡1¨FõZSÖ¨ÌjÜ§Š¥)«GVV“¸ÅVjœœ“P½wRøOœÅ¯Ş2<PiM6µ9Î)ÀÓ)Aæ¨V$Í(j4ài’;4¹¦Ræ€šZfis@´™£>”\0êCIš:Ó´´Ğih)\n)qIÇjZ’Ğâ*6éRv¨Øœcò©e&D‹”®ŸK<­rÛ¿ÒRºm,òµÅˆÜ÷2‡ùÆä(®–Ù²µÊi-À®’ÙøæÏsï0²¼lh«R‘Q£ÔéƒI\ZÏBŒj¥Ü¢ÿ\0hô«×w1Û\'8İé\\ü÷\r4…Øõ¦‘“›Jã	,Ù=j7jRj)ŠĞç“\"•ğ\rPNµ<ïÁª¶MZG,äE+Uw5$UİêÑÉ9¹¨‰É§±Í0-Z9&ÉíÓ.j°Áè\0ªV1ƒ\"æ®’O©®ŠK[k;AG¸”Ph®ƒÀŠ)(\0¤4¦“8 4fƒƒHhÀÓMÒ@„¢ŠC@Àšm:šH¡\r7<Ph B\ZNô¹¦š\n@M¢’€ÒQšCLL)Sï¯Ö’„á×ê)q¾û}i1C}æúš3ABRŠJZ/ÖŠ)3@ÅÍ¢Š\0p4´Êp4SJ)3K@‡fMÍ(4u(SsKM¹ f”\Zm õ SA§PÑšLÑ@ÇTEæ6{Ö˜ˆdm«ÔÖŒQP¸®jõyU–ç·“åïS_\nüY]áâ©Ì¤V«­R¸Læ¸>ÒP²2\'5FcZ1ã5›85¢8j»%j§)«2š¥+b´Š<ê² -óÓ¿Î>´ç®ºOCÂÅüw\"=i½)ÆškS‰¢“4T-‡J	4ÜÒæ˜‡fŒÒfŠ;8£4”QpFxÅ\'z)€´´ÜÒÓîô´ÑÖ—<ĞR)E4RÔ²‡ƒÅFõ\'j‰ÏZ–R*³¤!÷®ŸJo»\\¤‡ƒï]>’r¸ñõò™{Í®–Ü-tVÍÅs:c\nèm›å×3ï0²ĞÓéò]¬î\'ÃŞª¬W\'µf\\İ™\\ã§j„º’VstÓ1ÉÏ¯½WİMÍ#6h•Êìq|Uy^•Ş«K%UŒœˆg’ªHÕ,­“UªÑÍ6Fæ«¹©œÔ\rVY±„Ò¨æ’¥ŒsÅYÍ\"õšíFol\nš›Û\0õ\'š+ª’ĞùœÎ§5[vÒQEjy‚\Z(¤<\Z\0)\râŠ!¤É£4”\r!£4”ÀM!4f’€šCE%2BĞi	¤4™ ÑAAM4¦šzÓRKHiè_¾¿QHzÒ¯¿QAE§ûíõ4f†ûíõ P0h4fÆ€”QK@\n(E¤¥\0¹§L¥€KšniA Å(ÌÓ gIšZb9£4)hsFi)hê_nôÜâ®XÛï>c+:“QWgV,MUN‹;m‹“÷ZÙR\"`t¥\"¼¹ÍÉİŸ£a°Ğ¡MS†È®â©N3Z\n¥:ñIPÊ¹²n«fäpkïŒÖ¨òë™W­P™ªåËu¬é›šÚ\'‘ZV!vÁÏ¥Lş¿V~jÀæ5úWE#ÈÄ;²6ÓéNaÍ4ÖÇ#ÑIhÍQ,\\ÒƒMëJxë@‡f”\Zfisš.³N\rL½é€ì÷¥¦æŒó@J\r ¥ªLc¨íIJ8 hQJ\r6—8¤Ëš‰ÏZ“<TRdT1¢”ÇæÍtÚC|«\\Ä¼“].s\Za\\•ö=<©şñ˜Ü\nß¶|Ísš{`\nØYü¸÷zW$}ÖVE»Ë¼/–Öª!Üyª¢S#dš²§„gRãÉ¨İ¨g¨$z¤dØÙ$ª²ÉštÖªÈÕhÂrÚ¡cN-P»fš9äÆ»sQ§3TDÕ£l^õb–]O5rÍ7H>µhæœ‹¯ÆĞSh\',O­%vÅY!^§=G Í¢’¨çaIšZCÖ4š\\ñI@˜”„ÑI@$é\r)4Ú”\ZJbbQE!¤\0i\rÒP4†”i\r\0!4”ILL(4RR\0éJ£ç_¨¤\"„ûëõÆZ¾ßSFh¾ßSIH¢’–‹Fi3K@hÍ\n\0Z:Qš(\0¥¤Í \n\\ÓsE\0>”S3Kš\0u8\Ze(4\0ú)¹4n f”u¦fœ ’\0äš\nJäÖñ¤ÇaÖ¶ Œ*€J«g\0@ïÔÖ‚(¯6½^ge±÷¹6_õzw—Ä÷ÿ\0!àqC\npXãD*¤ãƒW$5Nf¦j¦]×zÄ¼ï[wg­aŞµ¬O2¹rzÖt½kBæ¨2äÖñ<<CÔ#ŞÀU»›v¶*Ô j³£Ùı¢ér>QÉ«>%‹lñH˜ü¿ıuÑMu<ªÒÕDÃ=j6ëR7ZcV§;x PhíL‘hÏƒ4fKšJ(riA¦æ–˜¥Ğiİ©€´¢š\r8q@Í-%E!E.(I”ª)¥=*\rCNC’k£Ñ[÷1Ÿjç­oh˜zq\\µ–‡£–JÕ~G]døÇ¥]š(ïÖ²m$ÀkÌÜÕÀÖ§ÙÒ¢^ˆñV<Î*ŒoOó}è±¯1a¤¨$’˜d¨LÓH™HI­@ÍC½BÍTŒ$Åg¨˜ĞM1š¨ÆR\ZÍLÎhcM©#l•+BĞmVolUÆzV”cl`~5¬ÙçcjòRljNôg]gË°&ÒšNh$>´ÜÒæ›@®-&h4”„¢ŒÒ@ÂÑšCB’–’4šSIAI!¢’€¥ĞM%0aHh¢‘!šJ(Í ëBıõúŠJTûëõÀ´ß}¾¦’†ûíõ4”„.iE4šZ…¢’€h´RRĞÑIK@IGµ\\ÒçšoJZ--6”\Z.iA¦æ–€\ZŒæ›K@Ç\n¹có¼ôíUcC#…ëfŞ Š\0í\\ØŠœ«•şG‚öµ=¬–‹óÿ\0€Oãib§^+ÏgİAY¦1§QHh™­Š£;ñV%Z£;â©“e+¦ëX—g­jİ?šÆºnkHn!™—<UTn5bàäÒÙÀf™Pu\'ÑÂ¯-MİÛÉµóÃ?òªŞ$‹÷1IèÄgğÿ\0ëVÊ ¢ŒV~¼›´æ?İ`ß­u¥dxn|Ó¹É·Za©Tf˜ØÃIJy4A,J&E¦æ—­4sFhÔÓsNš\0^†”RR)€¢)€óN\rLÑIš3NãC³šZfiÙâ“eéPÉÒ¥<Ô2w©c+?ZÕÑ$Â²Ç5”Ãš»¥>ÛŒxV5ctÎ¬ùk&u¶òajÜošÍ¾QVâ|WÑö§¡x5/™ïUÃÒ9¤ts™*7’¢i3Lg¦C˜æ|ÓSKSIªFnB³S	ÍæšOÉcMÏ41¦©É­Ë9-WsZ9ªvIòæ­æº)G©àfU¯%ĞRhÍ4õ¥­(\\ÓI¢’‚XA4fšh…&’ŠJ\0(¤¤Íp&Ği	¦ ¤¢œR‚’Š\r&h¤¦ &’’ƒ@‚Š))AIKH(´‰÷×ê(&•>úıieşû}M%~vúÒbÅ R\nZĞ´f’Š‘@4”¹ bĞx¤Í\0´\nLÑŠ\0q£4€Ñ@KM¢€Fi3šZšPiI~lqÇzRi+³JTåRjİ—l ÀŞzšÔx¨m£Ú:b­¢×—R\\Ò¹ú>¨RTãĞz-J8¦¯¦³;öÎW•êI©Ë%4e9K\'Sš¡;ÔÓIYóË×š´rT•Š×RVEËõ«·uæ³._­iyX‰•$95± ÚògaÀà}k&šâeE$àWWo\nÛÂ±/Eúšë§ç1•z.¤•[QO2Æuï°ŸËš³QÊ¡Ñ”“È#ŠÜóN!úÔF¦H=* ÕŒ4”¦›A!ïIKšJ`sKE\nÅ( ´½)£“J(ìšu7ñ S@<\Z\\óLê`…Í(¦æŒ÷¦PâG©¨d©3Q½Cµ=£l3ïP‘NN=ÅKWF•šgW|¢¬£Ö}¬›âVÅZVÅyÍ_NwI–ÃĞ^ ïFú›ó’¤İQn£u1sn¤Í3u!jä8i¤ÒfšÍM#)HF§Ä»˜Qgš½aNóÚ¶Œo¡çâ+(EÉ—aMˆ>Ô™®¤¬|ÕI¹IÉ‹A¤¢™›qIš)(Ò\Z^ô„Ğ\0M%ÒhšCE%\nCE%°´†“4f†)	 œR\Z\0)\rŠbbPy¢ŠB\nJ3ElRPi€”©÷×ê))É÷×ê)aşû}M6œÿ\0}¾¦›@Å¢’Š\0\\Ñš( –’Š\0Z¤Í-\0-”´\0QIšZ.h¤£4Z3Iš\0‡æ´l ÀÉš£o’@1À­»xğÉ‰©eÊ¦Èp|Òu¥è‹.\0«)‘­LpŸeaE1Ú•›@¤ÆJøÍQš\\T“KïT&—­ZG4æG4µŸq-K4k:âZÑ#Ï­P‚âOzÎ™Ë¶Mq-K¥Ø›©|Éî×¯¹ô­á&.ºŠ¹{E±òcóÜ|Í÷sØV¥4`)s]QV>~srwbÒ7ÑHÃ#™~»/&P1‡?Îª5hë1˜õ	FO8<ı+9ºÓ4E6œi¹Å\nJ^´PQE&FxS½hŠZ\03KšAE\0.iÀâ›ÛÒ”t CÁ¥ïLî´ÀSKH-;”€Ôl*R=ê6,M‘cšU¤P)f®—>Saê:V¢µs¶ò¤½«n)C¨aĞ×%hYÜú¿ÍGº,fÔÍÔ„Ö=>bMŞô›ª2iQasîo¨CQºšD¹’—¦Í0œÓãBäš´Œ*T²%·…¦p¢µãA\Z…¥Gm\0?Ú=MMšé„,Åb=¤¬¶\n(¤­1h4gŠLĞE&hé@!4¹¦š	ašJJ\r\n)3Fh„ÑïHh   ÑHiˆCA4I@®QIH“4´”AIš(¦0ïHiM%\0©÷×ê)3JŸ}~¢Ë÷Ûêi)_ï·ÔÒPE\n\0Ph AE\n(¢’Š\0^isŠLÑš.hÍ6–€Ñši¥QN¦ŠÚ?6@AÉ¥)$®Í¨Ò•Y¨Gv^°ƒjäõ5«`\n¯`*âŒW•9s;Ÿ£`ğñ£MB=	S‰›šk¶*,u·a$|\n©4½y¥š_z£<İyªHÂs<¹ïT&’Ÿ,¾õJiqZ$qU¨Eq5fÜMRÜMT‚=Ì¢4&µŒO#]$-­³ŞÎxÏ ®Š’ÕaWQZZ¥¤A¯V>¦§®ÈFÇÍâ+:’ò)iƒ­:¨ç4ÒisM&×ˆF/Æ2ƒúÖKVÏˆ×÷ĞyR+Ğh¶#4ÒiÆšE0Pi´¢€µ\'zSÍÆ.;ûP)(Í\0--\'Ö@8¥Î)¼”´p§\n`§@J\0qš;QpÔmO&˜i\0Ó@¤4£Š\0‘sWm%(qØÕ4«ğE*JÌÖ•YB\\Ñ5óŞš}½¨¹¶\r*ğF~õDC#mu*Ã±®9Óqg½C\Z«MÅ4Ú^´˜¨±Ğæ\'ZZ1éREÊÁUrj’2D•Øˆ…\0É­[KQ\nîo¼J-­V“ËzÕŠŞ¶¬ñqX¾v;E&sFkS€Z3HhÏ\0fŠLÑÖ!4\ZBhašJ)(´†ŒÓI iFi(  &Š3I@ƒšJ	¤¦ ¤¥íHh¦’Š3Hi	šJZ)ŒJ3A¤=hsšJ:\n)JrıõúŠLR¯ß_¨ E‡ûíõ¦ÓŸï·ÔÓsÍ\n(¢€4RQ@Gj2( ŠLÑš\0\\Òu¢–€Ô½©2(È¦ ¥Í%( bŠÓ°‡jäMP…<É\0í[P&Ğ+?²}6C…»uŸ¢,Ä8«ÅDƒ¤é\\G×ÇD8¶*´ÒãŠt²`U¥ëÍ4ˆœ†Í/Z£,½iòÉTf—Ş­#Š¥A³KŠ¡q5>y½ë:iK65¬by•ëXdŒÒ8U’p\0­{!iO27Ş>ÕŸcä6AûÃÛûµzºéÂÇÍb±>ÑÙl-(4™¥ëZœC±Fi)sH4†–šhÄcıC{°şU†Æ·¼IşªèÇùVPZØi4Üw§\Za¦\0OçE!¢€Fihí@	E.pi=é€RƒH( £)3@ O_z`#Ò”PŠisM£Š@˜ÔãM&\r4¢’ŠJ†¬Ä{ÕU«\Z¤3oI—c•çæ©$1Î¸‘Aôõƒg\'—\"°ìk VéI™§tQ“K`vàF¦gNz…iÒÖ>É+U+\\¥šÌø\n·i\ZíE\0S¨ªQKc\n•§?‰…QTd(¢“&’€4f’“4\\Òf“9¢\\(¢“4ZBi\r™¢ÔP0¤ ÒPÒFi(i(S$\\ÒQHi\rQš”Q‘L\0Ò\Z(Í \n(¢…*ıõúŠLÒ©ù×ê(i¢}Íò÷=é<—şïëE\0y/ıßÖ%ÿ\0»úÑE%ÿ\0»úÑä¿÷Z( Éîş´y/ıßÖŠ(y/ıßÖ%ÿ\0»úÑEÉîş´y/ıßÖŠ(\0òdôıi<—şïëE\0¾Kÿ\0wõ¥ÉıßÖŠ(\Z44û7?6:ûÖ´Vîİıh¢¼º®òw?AË¢¡B*=‰Ä.İıi’(éúÑEfw¹2œË!íúÕ)VOîş´QZ$sT“)L²ü¿­PœIÉÛúÑEZ<ú³v3§6şµoOÓ]@Ô?tdqEÓM?©+X¾!îş´¢şïëEĞ_)ÿ\0»úÒˆŸû¿­PÀ_*OOÖ)ı?Z( òŸû¿­!‰ÿ\0»úÑE\0dxŠ	\r¬goI=}s¦	?»úÑEÇaDŸİıi¾DŸİıh¢˜	öy?»úÒùÿ\0wõ¢Š\0O\"Oîş´¾D˜û¿­Py2wõ¥òe?ÃúÑE\0	?»úĞ “û¿­S€·“û¿­/“&>ïëE\0¢3÷ZQŸİıEPGdÏİıiŞD™û¿­R¦?»úÒ$şïëECŸİıhIıßÖŠ(°IıßÖ§?»úŠ(ªr¤şïë[ö{ŞÊò8¢ŠrØl°\"îş´¾Kçîş´QYˆ<—ôıi|—şïëE\0yOıßÖ%ÿ\0»úÑE\0\'”çøZ<§şïëE\0†\'şïëIå?÷Z( –Kÿ\0wõ¤ò¤şïëEOıßÖ“Éîş´QAH<—şïëIä¿÷Z( `aîş´T‡øZ( Êîş´Kÿ\0wõ¢Š\0Cÿ\0wõ¤ò_û¿­S$<™?»úÑä¿÷Z(¤ ò_û¿­\'’ùû¿­P4Kÿ\0v“Éîş´QLaåIıßÖ“ÉîÑE)ÿ\0»úÑä¿÷Z(¤+‡’ÿ\0İıhò_û¿­S<—şïëJ¾õù{úÑE ?ÿÙ','79vwko88diwwkkgkc4k0',NULL,NULL,'vineethrvin@gmail.com',NULL),(25,NULL,'TEXT','79vwko88diwwkkgkc4k0',NULL,'79vwko88diwwkkgkc4k0',NULL,NULL,'vineethrvin@gmail.com',NULL),(36,NULL,'TEXT','dgsdfgsdfgdf',NULL,'79vwko88diwwkkgkc4k0',NULL,NULL,'vineethrvin@gmail.com',NULL),(37,NULL,'TEXT','fdfdfdfsfs',NULL,'79vwko88diwwkkgkc4k0',NULL,NULL,'vineethrvin@gmail.com',NULL),(38,NULL,'TEXT','abcdlkadlkajfalkfjsf',NULL,'79vwko88diwwkkgkc4k0',NULL,NULL,'vineethrvin@gmail.com',NULL),(39,NULL,'TEXT','I am testing this post',NULL,'79vwko88diwwkkgkc4k0',NULL,NULL,'vineethrvin@gmail.com',NULL),(40,NULL,'TEXT','I am testing this post',NULL,'79vwko88diwwkkgkc4k0',NULL,NULL,'vineethrvin@gmail.com',NULL),(41,NULL,'TEXT','This is my post',NULL,'79vwko88diwwkkgkc4k0',NULL,NULL,'vineethrvin@gmail.com',NULL),(42,NULL,'TEXT','x;fk;mf;kfmkldmfklflfmlksnvlsvslvslvm',NULL,'79vwko88diwwkkgkc4k0',NULL,NULL,'vineethrvin@gmail.com',NULL),(43,NULL,'TEXT','sfasfsffsdfsdfsf',NULL,'79vwko88diwwkkgkc4k0','2019-05-27 01:09:56',NULL,'vineethrvin@gmail.com',NULL),(44,NULL,'TEXT','I am testing a post',NULL,'c3s4zjlesvsw4kwkoccw','2019-05-27 01:10:14',NULL,'vineethrvin@gmail.com',NULL),(45,NULL,'TEXT','this is testing with time',NULL,'c3s4zjlesvsw4kwkoccw','2019-05-27 01:10:34',NULL,'vineethrvin@gmail.com',NULL);

/*Table structure for table `tbl_registration` */

DROP TABLE IF EXISTS `tbl_registration`;

CREATE TABLE `tbl_registration` (
  `registration_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `email_id` varchar(50) NOT NULL,
  `user_name` varchar(50) NOT NULL,
  `mobile_no` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`registration_id`),
  UNIQUE KEY `tbl_registration_user_name_UNQ` (`user_name`),
  CONSTRAINT `tbl_registration_user_name` FOREIGN KEY (`user_name`) REFERENCES `tbl_login` (`user_name`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

/*Data for the table `tbl_registration` */

insert  into `tbl_registration`(`registration_id`,`first_name`,`last_name`,`dob`,`email_id`,`user_name`,`mobile_no`) values (8,'Vineeth','Reghu',NULL,'vineethrvin@gmail.com','vineethrvin@gmail.com','7708300158'),(9,'BCD','sd',NULL,'ddas@gmail.com','ddas@gmail.com','dfdf'),(10,'Ashwin','Chandran',NULL,'ashwinchandran@gmail.com','ashwinchandran@gmail.com','1111111111111');

/*Table structure for table `tbl_subscribe` */

DROP TABLE IF EXISTS `tbl_subscribe`;

CREATE TABLE `tbl_subscribe` (
  `subscription_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `community_id` varchar(20) NOT NULL,
  `user_name` varchar(50) NOT NULL,
  `user_type` varchar(20) NOT NULL,
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`subscription_id`),
  UNIQUE KEY `UNQ_user_community` (`community_id`,`user_name`),
  KEY `fk_tbl_subscribe_user_type` (`user_type`),
  CONSTRAINT `fk_tbl_subscribe_community_id` FOREIGN KEY (`community_id`) REFERENCES `tbl_community` (`community_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_tbl_subscribe_user_type` FOREIGN KEY (`user_type`) REFERENCES `tbl_user_type` (`user_type`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tbl_subscribe` */

/*Table structure for table `tbl_user_role` */

DROP TABLE IF EXISTS `tbl_user_role`;

CREATE TABLE `tbl_user_role` (
  `role_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `user_name` varchar(50) NOT NULL,
  `community_id` varchar(20) NOT NULL,
  `user_type` varchar(20) NOT NULL,
  PRIMARY KEY (`role_id`),
  UNIQUE KEY `UNQ_USER_COMMUNITY` (`user_name`,`community_id`),
  KEY `tbl_user_role_community_id` (`community_id`),
  KEY `tbl_user_role_user_type` (`user_type`),
  CONSTRAINT `tbl_user_role_community_id` FOREIGN KEY (`community_id`) REFERENCES `tbl_community` (`community_id`) ON UPDATE CASCADE,
  CONSTRAINT `tbl_user_role_user_name` FOREIGN KEY (`user_name`) REFERENCES `tbl_login` (`user_name`) ON UPDATE CASCADE,
  CONSTRAINT `tbl_user_role_user_type` FOREIGN KEY (`user_type`) REFERENCES `tbl_user_type` (`user_type`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `tbl_user_role` */

insert  into `tbl_user_role`(`role_id`,`user_name`,`community_id`,`user_type`) values (1,'vineethrvin@gmail.com','c3s4zjlesvsw4kwkoccw','COMMUNITY_OWNER'),(2,'vineethrvin@gmail.com','79vwko88diwwkkgkc4k0','COMMUNITY_OWNER'),(3,'ashwinchandran@gmail.com','i09dsd9qmygwcg0wk0ow','COMMUNITY_OWNER');

/*Table structure for table `tbl_user_type` */

DROP TABLE IF EXISTS `tbl_user_type`;

CREATE TABLE `tbl_user_type` (
  `user_type` varchar(20) NOT NULL,
  `user_type_description` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`user_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tbl_user_type` */

insert  into `tbl_user_type`(`user_type`,`user_type_description`) values ('ADMIN',NULL),('COMMUNITY_ADMIN','can make changes in community'),('COMMUNITY_OWNER','owns the community can delete the community too and has all privilege of community admin'),('NORMAL',NULL);

/*Table structure for table `test` */

DROP TABLE IF EXISTS `test`;

CREATE TABLE `test` (
  `name` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `test` */

insert  into `test`(`name`) values (':created_by');

/* Procedure structure for procedure `community_creation` */

/*!50003 DROP PROCEDURE IF EXISTS  `community_creation` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `community_creation`(IN in_community_id varchar(20),
        in_community_name VARCHAR(50),
        in_community_description varchar(1000) ,
        in_created_by varchar(50),
        in_community_type varchar(15))
BEGIN
DECLARE EXIT HANDLER FOR SQLEXCEPTION 
BEGIN
ROLLBACK;
RESIGNAL;
    END;
START TRANSACTION;
INSERT INTO tbl_community
            (community_id,
             community_name,
             community_description,
              created_by,
             community_type)
VALUES (in_community_id,
        in_community_name,
        in_community_description,
        in_created_by,
        in_community_type);
INSERT INTO tbl_user_role
            (
             user_name,
             community_id,
             user_type)
VALUES (
        in_created_by,
        in_community_id,
        'COMMUNITY_OWNER');
        COMMIT;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `registration` */

/*!50003 DROP PROCEDURE IF EXISTS  `registration` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `registration`(IN in_first_name VARCHAR(50),
IN in_last_name VARCHAR(50),
IN in_email_id VARCHAR(50),
IN in_mobile_no VARCHAR(15),
IN in_user_name VARCHAR(50),
IN in_password varchar(50))
BEGIN
DECLARE EXIT HANDLER FOR SQLEXCEPTION 
BEGIN
ROLLBACK;
RESIGNAL;
    END;
START TRANSACTION;
INSERT INTO tbl_login
            (user_name,
             `password`)
VALUES (in_user_name,
        in_password);
INSERT INTO tbl_registration
            (
             first_name,
             last_name,
             dob,
             email_id,
             user_name,
             mobile_no)
VALUES (        in_first_name,
        in_last_name,
        null,
        in_email_id,
        in_user_name,
        in_mobile_no);
        COMMIT;
select in_user_name;
        
    END */$$
DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

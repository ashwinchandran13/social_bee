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

insert  into `tbl_post`(`post_id`,`post_parent_id`,`post_type`,`post_content`,`post_image`,`community_id`,`created_time`,`updated_time`,`created_by`,`updated_by`) values (1,NULL,'SAMPLE','Test data','����\0JFIF\0\0`\0`\0\0��\0;CREATOR: gd-jpeg v1.0 (using IJG JPEG v80), quality = 82\n��\0C\0				\r\r\n\Z!\'\"#%%%),($+!$%$��\0C				$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$��\0G\0\"\0��\0\0\0\0\0\0\0\0\0\0\0	\n��\0�\0\0\0}\0!1AQa\"q2���#B��R��$3br�	\n\Z%&\'()*456789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz���������������������������������������������������������������������������\0\0\0\0\0\0\0\0	\n��\0�\0\0w\0!1AQaq\"2�B����	#3R�br�\n$4�%�\Z&\'()*56789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz��������������������������������������������������������������������������\0\0\0?\0�v��1�{�o�7�C}���CҬ��\0�o΍����������7�F���~t��M\0;{}�:7�����Q�@.��������oΓS@.���~too�7�I֊`;{�\0|�t������\n(w����K���ߝ6�\0v�?�ߝ�����Qڀ{x�too�ΐQ�\0]�����C���󤢋������ѽ��ߝ%\0�����ѽ�\0�:@(�B���K���ߝ%%;y�:]�����(����oΓs�\0x�t��f�\r��������?�)h\0���?�(f��~t���sy�:77���b�\r�?��:77�����\r����ѹ�\0�ߝ�\0�����sy�:LR����~tno�7�F(�sy�:M�����qF(\0���oΓsx�t��\0�����ѹ��:P��o�\0&��������oΗmh77����oΗ��77������oΔ�b�-����7?����M�����77���I�\0M��������o΂(�\r����ѹ�\0�:J(o�΍�����#4c\0������Y��ߝ��\0.���~t�������\0�����ѹ��ߝ����������?�P$7sy�:7�����Esy�:]�����b�\07�������o΃F(\0���o΍�����\r&(w�������oΊ(n�7�I���ߝP0���o΍:CI@���ߝ&���~t�@���\0�?������Qҁ����ߝ*;o_����\r,}~��.7�o����\0}���P����u %�PE��J(����PQKF(\0�g�\0��K@Q@R�b��(RRъ\n\\R���R�b�R�\0�R�h1K�\\Q�\0J1J(��S����уO�iq@�F)�iv�1Fړmh=���.�M��6Իi6�`T���dPG�7mi4ѣ���U$�V=~��\\Z�j�\'��oFjX\'�ٷF���t\Z~�i}\Z�_\"r6�NW�c�QPܣ�5fr�4m��R�{�i��i�6�F�=��W6���YJ�8 �U)l\r5�)�1I����)1@	�Lb��B(����1Hb�S�A�e�E&9�Ci1O�%GZZ(��<S���K�(�RS�1@\r���L~T\0���P1��Z(�1KE���\0Rb���E-!��I�R��\0�����))S��P����4ޔ����4�@.i(�)\0(��`QGZ`QK�\0:Q�(�\0\Z3GZ\0\0���\0(��(\0�(�E\0QK�\0J\0��.8��-(���Q�&)E��b�\n\\PQ�v)@�\03��sF(�Q�v�pZ3m.)�}�;�=��&>���6���t�^w��^��Z�i��}qa�����N�[jR�g\r���(%|�\nq�֕���K���c���]z��E����#�Ҷ3�t���8���t���\0ֳuj?�%�G�2�����=⅘~}+V?�S���Q?�j񞹨���G?�N?V�����wry\n�`}\\��R�^�\"�a؉~C�3����\0´�y\0�n�֬^�	 ��q��z��\0��έ���i�5�Մ	�.吟�p\n�՟���?�\0\n�������\0\Z����c�A곯��Q�K.�z����X����G����Ӂ�sS���rñ�7�������\'f�2�@�X�~\n�``x.���O��	�c�Mִ�w\\�!�\0������\0\Z���:���c�Kw�g����\\qS[��/c�g���O*�\"?�G���Z��!���0�	��*\0G��?B>����e��-����w�뎻}~��ֺ��c=̧I����C6��ٖ\0zg}���U�j\Z]���E�n���8����\\Nڷ��s�s�����Cч���?�Ȍ�2����u��\\�c�z��z�QPcڽ�+i˖���$?z�?����^�O���mp�$���_q�UN|�=�Q�S�jB)1ZG������\"����)1@�I�~)1@�b�S��f)��HE\03��qI��RR�1�\0n)1N9��i1O4�y�cqIN��n))Ɠ\0���)���IKE\0%%.h��%/zC@	�1�-\0�RR�(�����R��_���˷��zҷ�o��T�\0�-%Ӱh��L�)E\0QE\0���4�PKE\0QE��R�%�P0�(t��\0�QJ(\0���\0b�\n1J�\np��c@�J.(�������(�c������Y���Ⴊ�Z�5�[�>��kV�K�/�R�����L�uy�\0j%+\r+��eefs<���������n���\\����(�=Np���]��\'v}6&O��Gҵ��y����[���?<�<����E��iz�ڴ�-��&g���Զ~���������4���\0ǫ��LFu�GFq�&���Jv_�i�����X�m�h_s���E�u&��K8�~\0��u�o�6\r�-�����+J;iIw�=��W���ih����8�Y�$��ƌQ\r�՝�����b5�kB��!�	�{;�z���$x�\"�1�\n�MN!�6-$���\0�܁\\�We���[�\nDP*���$�[qV7Dc͉}�q����2�\n�I��t�4��#��\0��+�=GVV�&f��p?��p�0�[�#�֞ *���\0t�\nI�n0䎙�7�E�FW(�Ӧ[�l���?�B{�&��\n���F���]�8I-C����1PIy�=�$+���P�tF=ї-�����k��Ϛ�{\n]�.S�@�Lǟ���}�V�+i����M���O�0�)�������g�O5�g�r�ul�\\ �4j>�������\\��+�� Y>P�]h۱�\'Ҽ��z���DR�f!��y��c��U�a�_�g\rjv�:V�&�py��t=WI�X&�`����\Z˯u>�+���֌������:~#�֬m�8;���Ȥ\"��K`-o��.!�����EkutCVvd{i1R����F(2)6ԄRb�#\"�ԅi�ȣ�)(��&)�Rb�\"��Rb��!�)\rh\"�E4�1)�RPi�Hh��ӱHE\06�ZLPPih��ъB(\0�����:��iS��Rb�>��E.7�o�����Z8�\nZ(�E%-0\nQE�CIA��L\0R�Fi\0P(��(\0��(\0�(K@)h��jZJP(�\n)h\0��R�@\0���.8�@\0���\n\0@)�iBҁ@\0�i�U�;J��ܭ�\r���c�O����M��\r�`\0+[O�o/�C�or	\\�e����Ӵ�o���.3#��(迎[�;�f�P��ɳ���1�r���5����y�������H#7���A�\0{E�ըt�_Wc%��e�xf����~����~����⑹f�\0Z˱@U��:�lo\Zm�UӴk-: ��ꧻI>�wq�G�����:�w�Ǿ3\\��z�u�,D�G\n�T��?���Ux��#1���\0���I\Z��=t��Y;�\"h�a]��C��C�*�wS8��x¨A��JX#P6��z3��ϊ��G�q������B%������p?<U�k)1���G�)�ԜRGu�#���YFO�V7>T�y]�y*43�{Gk���v��DI�=��j-(����ҠkeV8L�\0�9���{r]��}l�����$kL��(?��m��M0��X0O�(Q��Y%�îw��I��#M!�&��������F��ǩ#�[6e�m�;�9?֩�ep�x�h��UG�E4j���[�l$�3���?#���o*h��[�ˌ�\0�j�$�Pw��nB�?,\Z�YHe��[���ئe�`B����\rb����\'�e�v̇���Q�=��`��&&\0J��+�rG�t�V�J7<SW���/��_��:���Z���1̇�>��~&��z���!͸\'�r�C�?\n�&B��{\Z�iTU\"y� �#��`[���d�������q������-Q��Ld���A�:xL3I�W�8�E���:�f@E!&)����I����PdRb�\"�E�i!��Ȥ\"��4���!�O#4�P+�4�)�Rc=h�R\Z~)�P!�\Zm<�R@�E)�@\r�!�R\Z\0m!�R\Z7��RP �%-&((���b\ZJZJ\0(4Q@\r\"�>��E�B�~��.8���M���SE\0 �GZ:QL���@t����\0�M-(��Q@\0KE(���b�(Q@Gc�\\P\0-��P�\0\0S�\0�\n\0:��@\0�(�\0)�d�;���G\Z�f�+��4@6�w1\'\n뜹�N������d�Jj+R��[F��\\��vL�D�X�}}�N��;Z��m�ĶТ��\0$H2���>��+�:�؁�阖�[:���\0�^���Z~�����X<�s��p}O��\\�w����]\"C������L��U����\0���uđ��p:��5Tt�T���\\�*�3��J��N���ژW���ֹi���Ga�G��/��AE�-�ڗ�#\0+d���Ua�d$�N\0���aQ\0黓I��Z�ؐV}�\0������C�|��<U�g搓�*庳�����g�g\"�r4���g�V����+N�aPĬG�X~��cfየ|�P(�s[6�E�~�*����a\"�X�)�@,���V<�Հ`F}��i�L�\r�����T��u�/�p8��I���H�����x�5�<�6����\0�ʫ��o!;�%}�yC�~�Y�{L7���x�>o��(��Z�I��P�S�����Km.�N������\nϻ��Ȼ�$8�IO�?��T��e�M���\0��΃�1�����\'h~��O��\rs�$�Fy!��w��ղ-����\rT�Rr��H��E��^h�n�6s���y˴K����W&��,�]̧݉֠/z���Is�2?:�qX��a�\0�٣|Nj-�~W�:\Z���/����𫖾&��9�>�֮2��n\\����\\�=	��:W�x�K6���s���\0����A��4���6���s�8�$�twh̞\'�ܯ ��?�v�ZH���|&�-����?ֲ�C�Z�Q�~0\rl�F��r�(s��x��{�r�ȆI6�\\��2Wl�Y�%��bM�m��C^�����\0Z��\0\n��E���C)��[:�[�g�.�3���ޛ��#���|Pud���k\ZX�r�� ꎥH�\r5$�d���8��HE!@FE&)�3��8�LP1���~)1@X���H��E�Jq�PP�RO��@���n1O4��\04�IN��@\r�\"�Hh�CN�!\0��4��@�������C�)Ph4Q@	J�}~���GοZZ��SIJ��o���/z(�\0\n0)i\r\0�\nN��@Q@-�\0(��\0P)i-\0-q@��j)hqE�P�N��P▒�@\n(\npP�RE� H�X���=��1W8���:ř��0\ZyNGu��+����T�V@�˺N�LCkmɓ�c�^��T���<���(�%ࢷ�fo�oW�3��)�Z6��;�璞��l�{)�56���h�nw�g�>���\0�\\�I{�5Q�t}�J�0 �<}�����*!�A�>��R�#Z�ܝ����$\n�-��M#\\�9=�S�\\�����D���y��H�n$�?�N�juP�z/�}��*�q�z�hp]�t�\0w�SF��H�d�^ju+�N�ޛ��@G����z�(�O݌���ի[��f����ֱ�K�!�z�|���6۝�20��<~iwI\n��{g��v>����de���!Q��\0��>�V�RG\\�;s�rkR(a�)��\0p�;�M`�/���$�O�A���r�K=��ѫ������@�\0��2$rs\n�`�{k���T�� \r>7��}����*D�\"���@���\\��\0���yW�w�	�|�i@$zaA�$����\\~�u�\r����Yr���`��as��Z����P177P���HG?��R�(d�vl�;\'�ji@$��Չ�����yn|�\"�\0Pc�\ny�b�wg�ii?�m���|��#w��Y����y�����?���Q���g+7L�#/�\Z��O�	=H1QJ苺@]ѷ�VL���Ȼ�_���BZo��4h^��?|J��\Zm%���܌8��+���Fb?���G��i��7�X\"aq	;\\Ȉ�}X�����[8/.vBT���\\Y8ݜ��ݞ��+�����i�Aj��@�[�kk�ky�DLg0\'����B����-��\"<+�l��bx�2��<���I�j=:�.�����qa��.���a��[{F�3�KBxf��\Z�ܰ��=FD��*:��#ߎ߅e�JĘ�l�tO���~��\0Z�������Ec)\r�\"����Zy`��65ă��^O�U��-7X��x/�9�#����/�Ҵ��îs����G�֢��P�n���]�;��������}3J2w��g����	�Y.�!�75�����ѿ�cȯ0e*J�AF5��z�m�]]�|��[7��?_��<��Yp�3�W��:�0ئ�$�*Q��G�M�H�^��6�i��P!���O4�a�)�PdSH���@#�i�HEE4�~)��\r��\Zn(��Қ(��)Ԙ��IN4�����s@	@���IKGj\0J�/�QB���i��}M&)����i?\Z\0(���HM)��\0����P(h��@��N��ZZAK@)iiq@\0�qIJ(\0�)1N���R�\nu �(�\nAOU$�:�X�]��$� ��w#߰����E�,����m_�����\0*Ʋ�&�D|��|�\0tt���H��fW�\\�W��t�*y�X���f�R^y�n�ֶ�F`\0��.��	\'���|͜���K��0���c��4+J2���ƣE�nc��2z�==kX��Q��zg*@\0#\'\'֢\0㠨�����j[)|�^	��Z{ϼ��\0���������1����\0#�c������RD�+��r	�?ϽL�\"~�?�sLE�\\����՘�� ��GBxQ�Ա����\n�.�5��֕�\03�� �?���O�*���cvT8��A��Bdr���{Vre#���J�\n�ױ[BB�B`���sIt\0\"k����I�\'8�i��I,K�LrR5]�\0�k&�7^x�X�p?�O��Pw����Z�X�i2�a���sW�t��	����CL��ZVVVV�1��<���w>���-	n���5�f��D���\Z��)��j��#�M��j�@s�hG����?5�u$Q�y�<F��γnu��X�(��W���E�\\�H�4��\r25Bp���_��+q�w����=\0f�k�~I��3:����j�đ��5�s�Y�&fc��x���h�f�#��e��j��(뚭$ś\"9W�����[�JW$�t����2�=gR�X`K�Ŷ�k �����\0���e�u�=˪�L��I��=���v4Q�n��\0Ͼ:�S(�͉R�\\ޕĒ�x�3��k����4�\"��\\u ���\0����+�u޳o�.����G���\\Σ�^]��\'��Q�ל��}KV\'��f���*}+P���Xd������	<�����fh��;��kY��[t�3#��\0��\'?Jи�m�Ʒ7���\0}}�\0.;WOu4:]��R�F}�~�r:>�ev�Y%o1�X��0�W\'bՐ�ݙ�A�� ?�d�zzV�/<.�sI�n#�ϯ�,P�L�Ą~�o���\0?�\\�v�\"��g�>�qJ��;H�R�c���[�\0u�߱�W��$�VebW��9��>��U;;.��,����P:�KO.��!v�P�����O�qQ\'s;a1�ƒF�k������Lm��~�?��c~���\0��}�Icbp� t�<�\0_�ԷQ\"�K(�	8��G�C�P������[Gm<��!�$U� 8��?�2y��\ZM��)0�����G���Մ��f\0\\DLR���z}GO��r���_��r3�~|�&�!����S�uk�u	�� #���F�O�Ao��U��y���0׹N|�R<�Ǖ�0�B)ܚJБ���<�Mi����LcM0ԄSH�df��Ȧ\Z\r4�)�4�O\"�im%.)��!▒�i��M4J\rP\ZLQE\0��()W�/�RP�}~��-7�?SIJ�}���\0))h<Pw���\0(��\0)i)hQE:�R�\0(�/z\\��QH)E\0���4��\08R���PN�R�.)�INP*hW,O�Q\n�0q�ԟ��&��D�X4� �Ҷ�#���6�U@#o�8���F+���oZ�6t<�|Cq����Gy�������+�����?�Ҟe\n>l����V�Tg��Ңi��$��C)\"ɘ�<�a�R ���}�B�Ćq��v����98�9�efI[d@��\\��UԄ(�r[?��{�>V#��?������ˀ>T�*C-�����	�p70�<\0*��\"�\0xt��Ti��˅29�*JF��41ϮN��\0ʟn�7x�#m�\0)�\0��~mI����\0��C�~��[0<q)$a�����\n�4:�D�C�d�3�\"Q��ߥoY-����X�N���w?�9�B��Wx��*������g�x���b9c�@���\0�ͦ�;uՁX��@��O�<�\r�%�YT�0r��_�����y\'��b.��Ğ��?��iYBdm�\\Hx�n?��%�#=��g2� �P#��7��&�*d�af��>�A@S����V�$�$Iz4C���s���O�N��>���.]x��A�$�?�z\r_�H�~I����$c�V��}C|��%X���\0]ܬq�Ɉ-�\0l���Vv���R�a�:̌.?vO�w��+���kh<�y!YN[��y�S�?\\M�����Ӛ�a�O�J�*�а\'8�#9������݁,#I�s#**�c� t�G�b->��E�v��iO\'��d����cx���\0]��~����������n�t��δ�V�r=o�ku+�|����~��~]en0�I?�~�\'չ�Z�N�:F+U٧�S_�������y������\0\\�i-b�ʔ��`��Φ{eU���xC��q�jO���\0�\n����l(є��GA�{I[K�F�U?&�\0\Z�{�B�L��9�!P?LW���ir(�TG��ㆯ�����VH��Q���P�xK�7|%��4�o,YIHQ����3�<~8�H��nb#�����}�����x5ײ����z��U�~�Zց��Ϗ0�8\'q��d��D�Z����-m��8��F����g��V�/�h�Fq���VM�j,�2REyݑ���q�T�c`��_�LQ�U�R���3�oS��28�\0\Z|��Yk:s�Ѓ��敜�\"1 ��Xz��\0֦[D��lĀr����Z�f]\"C8W�f2����?Q���_�Y�>�̹��\0Q��봸t��\ZbT�e��Oӭr��2rd��͎�1��<7�kzL٭58��_F���\0����y��:�#R��`���GЎ�Ҽ��S�0G��#�,p��q��O���0�B)�RP&4�i�R�\0��M8�i�i��O4�)�\"�i\r0i��i�4����\Zi�RP1��ө(��SA��(�4())ǚm\0&)W��Rb�>��E-7�o�����ZJ\0(��!⁋ޖ�R�Fh����\Z-���R�K@(��\0-�P �I�^�\0�J))�P1E-&)hH)@�C��Y�eOQ�󪂯�p���Q=�F�g�RX�/Z�\Z�ftĶ���m��*���T6�NN�j��\"�JX��\n�(���~s�ҫ�1�n���(A=zrje��A׹��@_�2I#���Q�%v��<{�O3h���5,h�@��aϲ�S]�RKz��\0�UG��;��mY��<3&I���iIod� I1ڞ��oV�01��:�V!Rx$X��U���\'�c��=�)�\n\0����j���۱0}�\0V5֢3���q��Tv�Ky�n��\0שh���x\'liX�\0�~�W-m��_��R3�I\0��S�������.�\0x`����Oǚ�s⸢-��3��!��\0*�v4Q��ZAkh�Ϸh�;W�_Ρ���o�I�M��@�Q�9�*}Nk�H�v�p8�T~1�jif��A.�c��J@�7��p\r��aI�cd]jZ�m��П�	!�z���Hu�>�r���ἵ�>���9��F�[��Y��W��	#p�\0k�bq�Vl�w�i��aG@���}*�W��z�CS�y�W6;�u�������kH�\Z���gsui,�\0�����Z�$@Q[q��h���8��\'Jc�M{̒��b�����³�`��r�X��ִ�l�iST�ʆ���9b�9\'�*� �ZE�V*M\nj����P�����~�V��\n�:�<�R\\�=k:�5��\'z\r��,�ʸ�O�<�\0�u�k��UԨNppO�8���5�a}������\0���Pk�y��s������VѴy�8{\n�=�*���Ws�cVY�m<�ȑ��<?��\0}\Z��-D�6GJ������fʅ��=T8�\0f���F���Ώ�G6V��A��p���;YKF\n���:���\0�z����%%v��{���+�.��B�*c�x�\0�Es���Uh�\Z���9�8�|����g���	2ɀ���˞�\0Ҭ�x�*�`p���RH�\0?Z箮E��!c~p�����Q��.���y��Fz�bGO��k��[pW$ņ�H�*y5���w=�����fT��ga��=ƶ��)�cn�$��Xs�O�^i�K?�k�ڬw���\0�^�,lY��u%O��港\Z��ׇ9u��Q��W��vv8�\n��*i)M4�y�!�4�CL�ސ��b���i�Hi�a�4�M4\0�M4�)����<\nu4����S��4\0�))ƛH4��M�\Zi)ƛ@!��Hh(4R\Z\0Lҧ�_��\'�_��M���i�����4�\0Ru������\0(��@�JZJ\0Jp��\0�����\nZ(\0��\nZ\0QJ:�)hE:�)�\nQE(��@)\n]�8o©��f�}?���#U[�T����h�(>�.�3\\:�HzRC�����5^W�������N��ڰe��o��Ӡ�\0\Z����u[�ؼ�(W���e�ɐ��qP��c�ګ�6I�֭YZ�,����{ԍ,�������jёc���M@��W�X!T����u�Qj{�_��+>k��*�ס��Us+J��`v�����7��#���\0��m,Tm�\\00�{����e��!��������XW����*��0>��=�Tiᴏ͞}��8������GE:m�7�W�y������H��m{ˑ\Zu�y?V��V�������\'���9�\n[m>[�<�K;��MW)���J[�\r��H�6!g��~���\r%�|����f9&���)���+K%�\n^�����\n� ����@�lEP8��(���Gzi2�ȱl�;�j.%��N���F�v�����j�rӏ<���)���L�&���\0;����q*};Ӻ&�*�,��\"K�q�=l&�0��6ӮC\'N��*�$d�Ӟ�DO�k2�.ZG��GPz��h��1D���I򲦙u��$�.��G�jМnN��\0��s҆��wjյ�Q��8>��\0>��%gp�R�Ubajpp�\\D�\Z�4|1��A���b\02á�-f?&�)zl�[�4��֊�@�MWK�6�V`��{Zr^�3�·�#��k��%;5�@�\n�	��p�;]\"]n�l�r��\"������+9�ci#��`��ߡ�����pnb�E��A��.���՜��\ZF��b2}x����xw��x>���Urjq_A\r������L�q �����\0��Q�`?�Be�d^rT7��\0��!��bX�����Er�(T�ҥeee�n��d�O�Ҳ�[D��X�ἶ�ݿJ����U]n��O>��^��%!��&�\r\"�Ji\r \Zi�qN\"��\r�0�y4�@\r4�N=i�sI\0�HG����Si���@\r\"���C\Zi��M4\0��N4�@�4��\r\0\'z(4f�����B}���\0��}���ԭ˷��b�\n(�P�E%\0-�(\0��c�\0ZZAJ(��ri)GZZJZ\0P)ޜ(���@)�){R\n^�\0��)\0��\0�LR����}p��PjH�$z�\0:O`.��b��qS��j��`��\rSy�C\\ubtS}S�	=N��g�����R�ǥs4l�Ԓ~���#MǞ�z���_�P�3w�f�E�8�iw�^��V�q�j�\n�hzT7AA%�\0�R4�nn��r�S��TU�l�����~���w��M�@�����j���1�1��$Z.�jQY ���n��eOw��L����Y�z��ʶ���G�Y�t�$������������w�wl����\0tSQ�X���v=Y�I���r+���1�P���El>�G�>Z�l��@2��-�b����=�T�WB`VTc�5qNѣW*h�����T�H\0��q���I77�F��Ja�(\'5]��H�A%b�Z��Cl��G��*x�Um��8�$(��s�_�������o�T�\"yU+ɶv��q�M��8-�Z����!u�u�\rp?ڧ�3O]Y�n�cH�{ZǤ�\0�I�^���8�T�N}��/;J���#>[7�1^w��ڧ�PFm�̎:2�\Z5[��ތ��z�v�Ђ�J�ut��&k)�������P�K�4�p���Ƣ��fBA�t52W=\Zp�/,���ܦA d{��MlB?����\n7��W��ҩ���I��`��\0�faM�7FD>\Z��cu���E�!����͍�$�����\0:�6Ub�A��2��\0*��69��b��>_I�RIZ;G�\0`g��\0UYI�!��OO��Y���ȹ��H�E2��Ƥ��~?�g��m0fW?C��\0&���)�䌡=��E:CÁӨ��k�3�Є�q6�܃Q^�x��z�!o���u��\0Fs�W��ޞ�S<��\"�h���G�P5i��1�1Q�\'���^�]����%)������\0��E8�M\0��Hiƚh�SM8�M!�4��8���LB\Za��M\06�N�\"�\ZO4������N4���ғ4������=h��>��h4/�_��M���i;R��o����I@�QF)(\0���\0(h��@\n(��(\0�QހR⒗�\0(�\nE�N��\nA�8P �\nLR�8S���@\n)��N�@\n8�sM��\0�����֜��\rC`�֜x�g�\\ebu8��SQ�)��\\R��>W�`pO�Mf�\0���d�p�tH#�?�Ҳh�[����f�q�!�r���U݂�듊�u_!v��q�8�8Srz�nl_���Q�Ȯz�Wg;T���Yj�\\)c��jMF#�nV���q]þ����t�p��ۜ���>Z�&�!�-�Pz�&��\'�>��T辇u<m;��oAq��g}��1�8�j�W%H气Zў�\n�ŝgo5�Y�\0f�����5�i����RG�B�έ%�?��\r����d��;y�x>j	��F��`Ue��i��/��D����ݹ���\\��ss�5V2��3_���|I�X�����>������V�%�W��ݕ��\0?�m\n2����̨�vn�;?�Zr^�S\\J��u�-��=]�S\Z�Ls����\0Z�`���5��iI��^�Z�\r�#��a��G3Gp�;���j�,��?�)��i<4�joK9�~Z���G���9�8/�\\u����nz�<�V����Ms8���r�e%x��Z�a*�G5p:�Y���f�ۓ����)Bx=+&����<wFe�=��Ў�^�����U��YU���\0��/TC؝:8��9���>�P�O̡�c��?��c�1���]N��à��Q��W�py��\0�U��Lw/x?2�T��<�G׃����4��kx,�z2��CL��J�*�M�\'�����S�w���Y���H>��EC�zZ�~bM�L��@­�Fz�V�z��c���.R?P\rb�u�?0�E�b?�a\Z���y�Z�4��M�$:RR�M\0#SOJq�M�@	M4�C�\0a�Ӎ4���ԧ�!��i��@\r4��-�i)h\"�\r4�N4�!���4\0�袐�څ���P�y~��,��o�����}M%�u���aGz\r\0�\nN��\0R�@�P\0)h��E-P()h���@3N\0��P):S�\0�))E\08\np��\0��RR�\0ZZJZ\0PjEl�z�tf�@J���ǥ45)9�z���Н���=;�*���æźC���Aտ��j:�zU�M\'\'�����qv��>#��y�� �������i_Ylo��e���������i�\0��jx4h�n�d�O\n?�*+XVF�8��kͥ���q��#H�5ڊ�=`S�C��w�T��ۅ�G�MF泫h�`�Q\\X��.&��\0{?�����I�ey��fc������,������Xd���ޒ���jeA��7��{��Q�W���8<����oqsl�U�r�8��Ɔ����V�����q�5�h���\'���϶�$�<�����<cp���~5cM��S���*��>��U�K��*1W\"�`�����_z�q\\���+��#$�{������R��zPT�V�����Tw=����C%ĞE���G���ڗ^���.E��.m��µ�]-)<�1%ۏ��\0��+�P\\����V.x��T]���3,<+$�K�HTD(�#��okmb�-��%�\0du�jW��\nϺ�R2V?��{\n~�ާ#�*��\0�h	2k-�{u\\��\n�w{3D��0\n��p:W��s��*2�9_�ѡu��2��\0d桺Ь��x|�?�+W��4g(̤t �,|M������(��֓�ֱf��iT\\���n�z�����5<:��{�/Q].��Gu\Z4:���9����Ց����S+���7\\���?��Z��&�+�6\r��{r8�s��]E\r���w�t�n���\\������o.�D��EaxX��D��2����q��5��H��R���g��q��U)���wncc�U>�U\0�ivaa�*�_b?�U�n���w��\"��g�H��9%u�6R�l�\\(<�G��[�MJ9Q��\Z�m�7�:c,�����m�wj�����?�ބxUb,���E�c�����k@ݰgk���b�F֗��\'��#�U�yđ���dDqҙ�N�I9�+���06�:�We��`���{�\0:�ї{��df�e��t9�z/�F>c ?�S��\\����P�8�\0��q�\0&��^�x�uEf4�E8�kc0��ZC@i��M�@	M4�Hh��N&�i\0�i�4�S\r4Ӎ0�\0i�ҚLR����h\r4ө\r\Zi\r8�M\0%��\Z\0CJ�y~��B���i��}i3C}���J\0\\�:�E\0���K@	ޖ�E\0(�� ����Z\0:�R�֔P:Ҋ8R�AK@�R⒁@�M�@\n)E��\n^���� ��;�1sKE�\n������cc ��)X�s�R�ƌ\rf�_k	in~@�\\~�wo��]vQi���B0��g�=���O�[V�������ci<w���oO�XI�f$�\0�±��鄒z�d�-������.3/�: ��&G�ܽ�9��gD$���;��{�%��s|�`����*֋�I��,+���oA^�����H�Q�j�Hᔜ���6���?2BU@�!x�k*�GX�N�ն�^��\rM��̷m�1���\0v�_ ��J�0��N*KWN٨՚&���z�tlmn$��Q�kx���^��z�:ͯ��(?��62��~������<��Ln���G�����}*�ȋ&c�3ʏA��U�\0�lC�#��S��<Y�F���Ք����䨥����y�D�����dW�\\m}���ܠל���y�7-<����U6��J6A���[��C\\-��gZ�v���(��kJ0NW{#�4�:t�a��4�/����И~�A�����kfG���TaT`�U鼨�>�p+K���+a�r��[��bb�����5B�j�O��63�)moy�^�������(�c��A�]Q��G�թ*��G��x#V�-�\"��H6�O5f���Ɲe���gE�1�X�\n��N�m,�\n��Ǡ�:���}�\\�_ꭸ\n;��a�%�<A>k�v���J���X�.8��W=}�J�vT���J��|7z�Ѭ4�V�m0\"����~RI?{�\0xw�ږ�s{��Ɔ$���P$�a��N�\Z^�e}����浓˚6F�=��K�i���W�\"���\0����z����P�DTc�g�W�k������U�D��Tա��^<5ER��r�oU	+�6b:���\"�M����)���(#�ڸ%�>$��H�u�ެ�g�k�>\"�N��+��U�.�w�k��7R�G��1T��v�Q]y?�O��u\r�s&�������ҭ��M6E�����X�����&-�����aS�݊��)����UK��P22sǱ�����EvQI��r�{~��Dڪ����a�#�\0�]f��8��X�.�D2�I^�?����Ό�������3���!E\"_�n���>�������]���\0�Tg��98�VڴwV�D�UC�̓��Y���,�sr�7d��O��:~9��4p�+\"�^�I$Pٌ�p�ø�δ,�#�D�>�@9\0�Tzf�iA@�Q�\\�nj��m���o)������=w�Tp�^�f��fd_��X��Ep��&��r��J��;Oq��<�Lr2�H5�a��c�1t�9�J�kS4�i���@4���@��q��\Zi�4��\0#SM8�M i3JiJ`!�i{PzP7�:��\04�R�C@i��i��ƞ�Pi(ZJ^�\Z\0n)S��Q���P\"�}���JV���i3@Ť���(��-(���N��P������RR�Ӆ6�\0(�\nJQ@J))�(iN\0��QJ(\0�����E\0��Q�\0��xĦ�Q��+�dWM\\��ImB%��4͝3���O�2<��0R0	�ґ��@Nט�����V�q�\0�d��vEs�mlz:1�r��i*+o�����\0\n��X%��X�$1�y�;)7Bu(�Ԋ�^�}��ۑYFN��N�uQ]��\0i��L��K�g۵zU�$�!�KW%�İ�[�8ڊ?J�ʆ��Tr�@�Һ��s4���K�����9����OR�Mt�TV`t����o\r�����J6��+`NBN>���_~O5�0qM��������Ww�E���s����O%A@9��q\\6��gV�	\\»���G�+�������X5�IX~�.�R�kG�`�J�t�10�k���B�ڼʪ�>�.�5$�u��\r��:���W;�8|�٦#�\\xR�խ�6+e?��[�ɘn�������93��b�������jA�X��fe_A[���,m~׭�l2��������fw�K�=᷆㴅o\'L�\'<��=+�t�@�pz�(�G@:W[et:�u#Ült�6�^�ܗ��5��{��w�P5��nrI�}s[�܈nl�~=��d�b�k�b0��#͉����Q����T��o������b:y�9�9�8�HN\0��������{����>��Z��rA8+��Jp��t6�����g�xv4oɦ͒��G��d�ѤX[�j��� v��9�\"�/i�M�障0�ʒ�sX�M��6�?�\0���\0^��+NIv=Z1^Μ��S����΍|�������\0\Z���Z:.R���\0���5�`�Q<L���S�s�`��\0��}����[ۓ���K�[4Ev[\nA��Oj�����U-*�#��#�s}Y����dr�������WAfV�<��Q��,K��u�Q�?g�Ớɳ�-�dٹyⴶ��m�)��-��e���\'qbOz���=���85�kF@@���5�ꫲ�^1�ҥе�U�w�\rD�:J��\0�w`筏��\\2p�u���3)\r���\Zm8�m!O�N4��JCKMj\0CM4��H�N��M4�N��N�M�@\r4�iƓ�\0!��u4�M!�\Zi�1\r7�8�M\0!���4)��RП}~���[���w�o��SI@Q@@��@@�R��QH:�\nQIJ(i���(i�)S���\0�R�S� ��@ޝM�PKE\0P�E(�\n(�Gj\0i�S�jF�v1К��s�-�)mq������\rGs���5�����Ҳ]��3��@���@�G�U�-_������e�<��ث�F�_�̣����8��Wg�?A���oN7���E��[ȧ!�y�+����c�W��7Uݬ]�x�+��[�,��v#Ö�N�fl�#�\\�z��fI(y�]e��S�0���Mqz��Ռ�f�xa�ֱ�i������ri�/�A$��r-!�?�\\��Xo�w��Lb�l�S�uc����d��ˍ�������z�4Wӆf_s^��[�\0���p�-���55��bQ����w��Y];S��|Im\'^�a5K�$:��9#k1]�-Ǜ��pk��l�e֍��y��9��\0�j�kNH��qT���_y�I*��v��[��8=�c���bk��浻_�f���\0Q�I�c,ʚ�>klw�e�м�Ig|���y�;ҵU�5!���Et��jꌏ�+��5��\\ߎt��;%��fx{�Péw\'����)\' �涌�����<��A�4�i��?�i.���+�Z>��\\|�\\ڱY�t#�WB�e\"�̧��)�gnGֱ����A\'�S5�ҭM��)��p�A�=鹤�����k�K#�u3\0� �\'��� ��m�y��=�\0�VǇ|�,n5KߖYs1�P>U��@׾\"�ȉZV>���y����}�jzջ���dT�H��c2\0+�M$e��<�=j; ��\0W��j���իDP�g���\Z��<�_BU���3�jG��e+�N�v+б�F�\"F��\0���+p��a�Y��R��j����W&�\nEM�s�����Zz�t�J��]m��V�N�?ZǱS�\0;֎��%���N�<����������W�~~)��KHx�CM�4�\0���ZJ\0Ji�4��i)ǥ4��4�N��\ZCKIހ��O4���&�ҚL�)��:�h\0�斐�R��_������e��}M%+}��4�@\n)i-\nZJZ��R�!E:�)����bҊn)h�R�H�\0��Ғ��\n)E%-)iJZ\0u- ���RR�\0QKI@���(*��fo����W)���U�I��s�7����N@?���G�5nQ�T�8?�55�\0�������?�U��r	�9^�B=�cV=OO	4ӈ�\'��F�\rj��?Zƈa�mG���4�O\rY�;K�_	�b������J�L7(c�Ɍ����5�Ha��V��۷ �مm	�X�1xWNM�����#�{\Z���l}�=\ry|w��ɜ~5)��q�=�[�j�w=��),Ѕ>�qYwwZ-�$n˜�%%���4�ia��v3JR��ڔe7h+�u]zk�u�D6�2Ux�6k�I����n\"�5˸��\0D�)���&��*Ƌ��XГ˳(8���E��;0�Iթ�����o� �o0C��\0�������[$>���\0�WE�hzu���a5�%��(\rc��ua��ZXRV���\0�Q�w~:�T`d�ZF �p�Ϧ����s\n�R+��V�$w��^�u��Z�e��ϯ���k���I0�7���>��T+Ӌ�lc��1u!gS�ڭ-��X�G}i\r�_rE�=q��Z����x�#����#�N��:��f�3�=�ֻ6B;VS��#�V8�{�י��]ͥ��H	U?���\0\n�m<@�!�`t�i5�ns$c��u�kv�Z�K�\'\0�ֺ�QKs�8J�yZ*�=\rq�*�z���׊ǫ_@0�R�;1��+�]MG_���g�)�[��5�>�Cw�ڈ���B��pk�Ě��\0����P3j\Z�|�4�?��9[qӇ;�So��;�g������a�IO����+F�o<G��A�A��o��\0Rh>\n���[�vpF�\0^���^�k�>T�t�ǰ��R���`��W�+薶�[0�ex�v��@�q��1�߉�F�|=�\r�����$�m�=v���������^ >i\"2wJäh:(�_��P�	,h�������䂧ש��x�D�r�V��\0?�~3�$���_�%~\r`{3v3n�}�&{Z6��,��~\nƱ��_��\rl[6��\0?�k���&f�Fzn5�j���b��ֺ�nҪ���ӊʓJd=3��Kc�M�hfEj\"��MU��nkc��9RKs+r0��;��4�+�C��=)�����۵[r6�/T�EQ�w�)�#�8���=5�\n(�Ew,����h�I�ZCҀ�N�Hh��i��@i��M\'j\0N��֝M4\0�A�4���%/zi�Hji�4�%!�JH�A�@���P����)3J�y~��,?�o�%+��������-KH)h�QE\0:����sKM�@ť�%(�S�M�\n-- �hh�(�c�- ���(掔�()E\'Zu\0��)h\0��C@��\'JQA�dV�^@�L��q�+�Ie�&W�M�\'����=���Et�\rլ7�4�6�\rR�7tU�U�.q�A������r�Zn��e���^���G�)�>*�:��^}EsN��\'�����C�\nsQIb�t�������)������2&��g��G�gUh�gI�+��~���ByU��NMN�\0L�p\'�AYW�3�m��;��ѵ3�\'7�\"�,5��j=\Z(�N\0�¹��pZ���{�z<����k3Q�6��1��IC�\0,�_��Rh�\Zy�98?��\0ZYCY���NX���ch��W�4�of.r�{{�q��D6�|��P;�ۦ�h���g��$uj�sswg�C4T#�=\'J���\n�J�qk0�\n����3��1�����\0�9���\Z��7�W��̤�؁���M��z�%T621H��r.$\'>���a+|�#uCV:��c���˫K��ڮ.c��G�ӹ�n�\rx����B���E�}W߷z��tO���F�d5�_�>uɖ\r����,�\\w���ԋ\\�6�y�Ju>�������Z �X2�����WI��-�FNs\\�\'�<7 ��,z0�R{�ߖ>�����J�T)%��\'�_�s�S�	�c�\"�c���j����\0�̸�e���?@�\Z��\0{���%v����t�����\0M\05d��rn Q���gy-�P�?{G�m��a�劏�V�l�3gjC�#�sS�x�H��#����kX���\n�C��k7�_�5�a9l�j����%��>��Y���[�}�y�����]Z�\0ź���!�;#�{���\n�_�|�<q7ޞa�z(�\0\"�-\'K�����T�~���9�?Ҵ�im��xQ��vk����\0��Ա��0hvB�/���N����+Yd��J�f�z�ջ��\"�J\nVH��L�o��j����Cww�ۻg��Q9*UH��A4�A�[Ѱ]��9�U��nIoO�\\嶷^���k�s$C�}�)F��\'��I]3z�)�=��[���s_�q�������y�eh�@�1�^M.S��b�ӧ�Jƽ�P&v��Ұn�?���S�+&��^7�����*�l�y��b2I�a盏Ρ����%��ɴ`=1�RH�\0\nͭmW�p�=��G�k*�JJ�>\"�ܤ�\'��ZJ��CIKI@��&��h3FiGJi�4�N4��@i\r)��4\0�Ju4�I��Ji1@	ޚ�i��H��f�i���gl)�L;���۾_J�P惢\nȚ�n}�p��GJ��\n��*H>PV�g�%�_��ZJ�/�Pb[��Zm+����J@--P�(�iE\0�P(�R�\0ZP(��\0��J(�KH)h��8Si�\r(��(�\nu4S�\0��Q@\n)i.h\0�RP֖�(\n(����N�!���gF����xJ?�|����Zt�ܛH�QY��ڄ�f�8y49�&��%L���\Z��&�?\\�\0�t7p�d+�T\n�k���u>��\rQ)[�2c����\0���1��j�>��湒k�;3m_�U�/\"|皉V��wR���ז���g`�1�P��Q�]��V�\0���\n;b�-�q���z��Ы���q\\���|���]M����c�Y��RV9�c9.�pzT˩ȣ��6IjŮ�dnT������8EI��D�x�����T4�b �����\0f��кF��VL~5��hQܮ�n�u�(�gCRI6W�H�k��8h[^D�Bx!�r��5�7��k��k$�Ny�o���?�uڝ�r���K[9*qWJ?8+�UҤS9�\0��q���?�e�j�x\'WS�ƞ1��+�K��Ɔ��޶X�������r�x&��\0�֦�wX#���+J��z^���4��ZNw�h��֠i�j%Vrݝr�5x�_=2ϛNU/?�\r�;�$v:�/��w���z�k�E��z���^Ƙ��z�ׯ1o!��H��g&�Yz\nû�k�^-�rB��o\'�\Z�Ǎ��Z\r.�[�;`���\'\"?n�ܘ�t�X��$����R-��0N7g��s�U��13@ݜ�A���+7��7���Iu&��f����c������־�\ZY/]rpB�4���f�Fr�f��qll�N�Ã��]u�]�$�2J�ee���RLZ��[J����L]�L�05���_�I�C�Veh���c�I��^�6G�-Ĥ�-!5b�M8�\Z%!斐�(�R\Zv8��\ZkS�4���qJzRv���)M#PZ����@\r<S�ƚzP1Ji$f�����Piw!e$�@COc�fy��A��\0\nH�(8�\nq�rl�~��i3�r)W�փ��2����4\n���)Z))h�Q@�bҁIJ(E(�\n\0Zp��Q@��6�(ii:����P�p��N\0�Ԣ����GJP(\0�KE��(��\0Q@���b��\0QA��\nTi)W�D�EE�V��D�є���\"�$b�I�^��\n����^k}���^�h5j\\�\r9��Be�S0ۓ�j��	�9��nU�}\rM�Q_[��\rc�CT�\n����R�eX0=��L!W�^~��m)X�x�^�?\Z���K2K��3V��9a�[M�v*q�_��U�\\E���<�@q��m�L`<Ğ3��83��2��vD����\\�3�&m�)=�VF�����@�b�p}��b�=���r=E4���bK�D+<D{8�ɪnnG�4�i퍛��\nȺ\n٧5��֪�.���D�r��i&���w���Q��f�=�)�z�ϊ��h�����|sQ=�5Y��j�9�V,		����U*e`�Y�\0�kT�>�Qחf����\0*�\0SY�rm3Jz$dʙ3���� s���֞�i������`?�j[<���w;}6/\"�S�v��=p���N�A�]���\0���X�v�e�_>��I���*�?β���{�Bm�%�,�뺯�4��06��\0�����Wn�:Ն�m� @��!�6��31#��p?ϵ\\�0����԰Ʊ�R9���\0�]�m����4�?ySc���\0�! �\0~��j��������F���9�%!��5B�H���=(	��SM\0����4\0��i��@\r&�N��@i��i���zR�c�\0�J2G	֡2���*)g�<�FL�aA�cbc&�8�\nEl-C�\0qMy�>^�H_=O�MV,~��<�ʞ���4\0��l��8�A��RNx�P��vG�J�x}ET��V��/�Pg4Yo��S@���}h���/j\0)E�PJ))h٠RS�\nQ@�)�8PӅ4sN�\ZQ@�(\0�)/j\0QJ)(��J))s@-��w��h�\0QJi1@-�\0���R*ǵ\0��r�;u�kO�\ZR�����\nǞS<��#���]`yHy5\r�|���y�)�+`q�T8����/w#l�-�?ƧRr8��G���_�{�b�f��A�i�j��\\��Y-��|��X������G�F������&�I�k�a�*ӱ�V���N{6r���H!��2=�hM����6h���H�2�y��W̎o���&;��7ҕ#���E�Ǡ-�oZ�Z�pe�%>����=>U(�>���F��21�o���	��2��OJ��q*B���\0����Y97��ѡ\nk�Efj	��S����\Z9�٪���5V��V���B�j4��&��i�����+:ě��V�u*��ɨgb�D���?Z�I\Zt�]��zX�h:�����#ͭV�	o;@�?3]��O��\0}�5�o�[\0p?\n�<=֍����Y��:���Lc?O�\0US����G<}+J�TY��\0u��j����_�Á�\Z��KܖhA�sɍ��\0\Z��mJ�x�Xƣ�P~��Tn�#�\'�Ģn���X�\\ӯp ���O�5,�$�i1��?SQ_�-��M��\0㦶��T��o�7rg��\n�j��\0�}?�����aly�m!���MPh)\r�\0����\0��Ji\r\06���\Z\0F�f�i�\0�U/������*��Xz��Y�����.+Q�L�8�1�)�T��8<��\Z����i���������p�tw�5H�g� ��4݁���w�.h�n�4��ztB6f����¥i����3�8�=�,�\'�_sK$n=��m�@��y>��ES�L�s���������-7�o�\0���o���#0���)h���)��@�����b�Z@x�\n\0QJ(�N�\0)�qJ��.B�z�L-_n��Ҹ)ةE�\'tY�\'�U��\\0��ǾG���X�;h�wJ3��u�\0\Zo�n���\0ǔ�\0Z9�Y�b�)���.G��*yR>���@��Sb�v(����PIKր(b�ZJ���5,P��O�Q)$�Ɠn�`]��|ǥT��)PrƬ^N!���V��g�ǁ��^}I�3��9P��<�FK1��\n�w*���x��Z��h�G��2sڳ�if#���Y.�K�pr=�\0��2��c��x�+�{z��&����8�=;\nf�mj���(ʜ��CK��TW�\0\' ��z�֤n���J����՞�EH�\Z�T��5h�E��\Z�\0v��9r<T�m:8�:T�H�\nqj��л�Q�%5����ހld�UI��N�P+>y�V���:Y��Ud��Lw&�ɪ9�0f�iN��sϥE}(�N���1TS���\0Z��d�\\�\\_�nv���\0�;}k=&���t��) ����}���Ɇb:�?�����ʣ��շ��P:c�ԏ�Z�<ۣ�j�~��8��Ih��?ְl͓C#ݜ�Һ_G�lFv�1�Q��XV��\0����\0|�O��U�\'�\nM�f��<���?�R������I,eH�~85F5S*���?�C�]I�@��(�M�?^kE[�q��Z��\n�(7`��j���A�?ΠdP���?�e���o�T���;�KӶ�~\\�mG�2�����7j��S��\0�f#����-�8NԆ�������H(\ZCҔ�Iڀ�!��j\0Ji���\0JCKړ�\0\'je>�x�c\Z���\0hn3�;[��\0����OQ��e��܌��!�ٜ��X�/�\r����*���i�I\"��L���j��T���+�ܜNx�����1���֨��)��0�?-�Lw4��N�g`�{T���%�=ɪ��u�Re��;��K�������D��z\n�.I)ګ�\Z������H!����M�з�ˌ֦O�>������)������ҿ�o���BҊJZ.)i)E\0�KҀR�\np4QN\0�rp950U_�r}!�p��q��Ո�I������O�߃�S�~�2H�� ��G\'�l	��]�fH=�Y��S/��ۙY���$��?Β���쀱L������O�����d�\0�ʲ��ݖ�{O\'(�� <�:�? 2jD��Γ�?�߯��ig�\r6܆�<��n�\0\nҋH��v��C����ɬ%^+cEM�8��r#�~�0�f�c�d�<�o��wʱD8�G���@Tn��\0qy��x�Z�pm����b�i���}�,�Rx?��\0:��G�b=�6�|��(X����4`FC������h��?GS^�\"�09�3��2[Xʤ���X�:�>�r��B�}B��Q��)Q^��E���1�Jkiυ�����\0Z�X�ԟ`�;ϭ��;h�l�P���f��T����	�28p����~>��I�7�\0�\nO�;D?3��O�>��29(�1�\n�+�8X�����u&�������j�{��xB�x�v.4S-)P��{vKP�H2��GJ�Q��S�s�S��w1��\\�幼`�W���K:��_�A�۴�4��J�+.̓!{�R�L O.>;v�4Z�_\\\n����!/�qO�r� \'&����P�#u#�5�\nO���}�C?��D0��έ���M�ק�W�Wb}q�J.,H���8��*-�th[ܥ�eN꾕*��X��!�k���֮��oe[�GCM�ZzKsZ9�ޭ�?�do� �nJ�=��Yǭ8ξ��/pz�5�����CZ[�;�)�\0�Y�^3w������=O������櫳��Z�%�\\�p*\'���\\ �����f���+���u�����׽A�֜��� ��Qj�fb������_J�~H��~f�z���(��\'\nq��:�gl}�I���h�^iX����\'bӓ<d�x�+�{OA�`;�Њ��\n\\z�Z��F1\"�����$��i�+(�Һ���\'�p*����E��I�\n8<�@�~pM���A�F��ŋ�;�8���[K��sY�&�?��^����.��R!�[�N~��\0�X\'u�~����ԉ�c���*0��t�H��\\�G��)���1#�N?*�\0�T���S/\0h�g(#��oGs\Z�}y��O���Π=*{����j�5뭏<JCK�i�\Z\rPM��\Z\0AHԴ���N��SM\04�R�CҀ�M:��\0�L4�Mj\0��t�x��	�r?�������`��Ͻtz��	�#��\\��)�\0Y/�(��v35����T�#׭hKgsqn�Y��qڨ>�y%�fP;�4�_R��,����g�I ��r�@:��Tm�.݀��f�)��\r�xv���S��M\0�W���U�s�B��O���8�$��H�5��S�!��B���ҚT:�E,7�?SG?�o��\0����E(�b�Z(����O�4p<��{�l�q�F��L�!��jݵ��s[�n�!�J���t��YʢE(�c��ww�P���t�O�0\Zf�\0=1Z0E 0��?W#�c�H�~���i=�c�-��[٪��G�g�e\0�p=�?\n�Y�g�H[,O�⹟��4\r��[�ң7�H g��:�{�T�p\'���i5H�(-�椣M�ی�=:����;��o�&�\Z�w�Uq�8�Y�a�?S�iXf�|u�>�)�ey�3�Ed�=�?Lg9��\0��,3d���g^�Ͻc�_�����L��\0�����+�grp�#���\0\Zc<�����������v\r*�\'���>�P�����~5_J��W��o�M����{r(�J��:t�\0\Z\n#k�I�у�qPI�m���@O�jv!�;\"lu�)�Q���U�\0p�b������X�A�ֳn.�\'�G#��C�:���/\"1�\0|��K�!<��M0����{s��\"^���N]\"��KJ����j����ո�kˇ���>��T��]�P\0LV4�I�y5n`I9?Z�!��i��Uǖ4����}j7;��������\0x�.7��ƥ���~��Q�=�U�@��:�=�E�.���?3��RZ�db��\0?�V�b!\0��>�@��~M���p?�jn<��w3c���^4�V�\0�\0?�Z�mx�~�?^�֛)24��ϔ�w��q�V��ݹq��*�Q�8���l�S�=<��U9o��ܚ���E\'�jr������k�L���~��l��$�jVZa	ďo4�i�iʜ�D�R$E�X��گCkҪ�*4�U�ߎ��y�[{c�t�o�XwI���*Pz�y�>Z+ԭ$*��ַt�bҖ�O�YrG�`��-rd���Jsg��3��C�P?Z�b�]�)�5��N0_���nC>�~5���^a�����f�-5BB��u��2m����?�+zűo=w1RL�)��	s��d�l���r\n����\0J�-����β���\n��7��$ռ��&�gK�Ov+�\ZKË,�\0���Y��dD|܏�xT��!�$9=����\0|���ʕ@[���*��қ��?rG�kz[���௿��_��UM[�F.d���*��^;{�M;4�L�Q@	Hii()\r)�������\Zi;R�N�\0��a��a��i=sN5CU���~ҁ�s2�O�ބ�k�\n�p�\0i���|�*v�\0F��\0��~���m7Hga��i���il-m�!�rO���N\Z�!�zRb�F(��E8�)(�J�y~���/�P����4�����I@J)�@(��\0P*T�=zSUj�q��R��E,\0Rǰ�od�B�;(�j+e$av�xؒ�!v�Ǡ��R�I-� >]��������y:�N��G�Pg\r�n*������?���iH�\"x |e��#��~U`I@nb�f5�t����/�݈��M�Z4�����P9f$��l�\07\n%^;��T�q���#?��k�Ld��ޅ�N�y�8\0��|���I���=�q�S���߈�T�r�K)�\">��eݐ���\0֫�5�2\0R����% H��Ұ\\���H�������\n���oly䞝�U�&\\���X��Op?*O5z~��Mp{ʿ@Fj&POv?AE���tY��>���#�j�ҡe�c�7l�iXi�EW#�M0�)�P~�)���j6���0jlU�\Z|�_��Ƹ��js�\0L����P���\0��ù<�c�Ui����*6t<����O�~G�)�.2[��?�T�ى��V�N=�)�YW��L�20���UZ=��W���Cn�Jg����)����6`�=��i[ߧz���g��*��r~f�Jr\0C6:(�?�0��Z�&�}�J����6m�e �p�#��֪]��x\0\0���_��G�2��g&�.$-)|p7ӜRZ��Ė���~��dT���vd��\0^�aA8ڜ�\03Q�K<�?�c��\0 ~tu\Z����b��\\ �F2L����\0V��2=ܪ������T�TdT��]��V�2бښB�Ǟ�fl��O�=�N��ګa�\\��N*�V��*�6��V��Kge*%�\nq\\�ɝJOL���%��Ju�\0���q��T��O+>��G��*�>z�r�?��\0\n�t8�\0��L�8���H���k��\"�sȉ�䢜��qZ^G��u��N1�0cۓ�T��n�8��\'��C���\0�T\\ȴ�~��Ԓ�[�j\Z�	X�V�]909��nY��ہݗ�\0A��zN<�����\0\n���\"g��\0�ց�4d��[�樁¯_ޮ?:D\ZW�}���~����1?�O���f(�����\0Z���\0��Z@Jx���1�\0���-U��Gf?ʦa���\0w�Ҡ՛0��\0lWE�*lqZ����P?���5X�?��*��V;,m!�R\Z�\r��Ҍ�R\Z\\R@	HiM%\04�\ZSHh����/zC@ƚa��i�c\rs�=��ϝ$Q�S�+v=3�[��y�x�+y1u�������ۅ����P�s�^D*Ŷ�ᮎ���c^�?3T4�,�q���Ʌ_Os�Z����-���n(4����b���	IN�M4\0�\'�_��=iS�ց��������S{Ҋ8S�sM\"�C$E��pE��A�Eo9q�Z���\0-Y�E$Kmi��x^�:֚H�(\0��T|ōNO4�39����k�ݚ+#A�ul�zP�n�#׵T�w>?\ZW�Ty���;�*��ۭ=�@Hr�6k#�2�C�O~���4(�����O\0Q��9�wH�\'�\'������ҩ��\0P������	2�~��;\"��:�x�r�М:xUQ��s��f�X��̓�Io�R�i$��Ϡ����4R��1��q�G����8�(�l�V~���=NO�A�R;��_��.x�������(�\0e�N\rmԛ���V\Z��J�>�g���9�8�\0\n9�>VQv�\'\r(�b�ip9�uu��O~�\ra7��?��.de	%,OC��it#?J��w#�۟�\n?����Sϖ��(��I������|u���i!�\"1��C%�߽,@{\Z\\�veRH�#Ͼi�X�ҭb$0���:*�\"��5<Ȥ�Q�O2�Ҍ:��{���?\"�8�U�F#;�?�2G��\0ע��H�;@�rj���_jt�1��~�~�ZF�8}񊴂�39��}*��䚚GP0=q�5RIt�U�\r����Q*8���S�����4ͥ�����uAq���aO\'տ��$h%�\n8��}}ϵ<���2c������a�D�n�-CW��;I\'��{\nό6����j[�w�3��?:}�|�L``�=��U%d[}	%�%nG@�������?�K0\0������`����?�)�\"Ēr?Z��m}I?�N�{�Y���F(���S=�����,94δ�VzU�mrzU�mI�ZV�|)�F����Է��X��qW���Kf�T[q�N0\n� �5���;��2�#��,y���p�λۘ�C\\E�d^ܞ����]\'��qmJ��R�K��\"��$p}���O��s� 9w���1���?Zsg�EhX�sp����8���B}\n�t�G -v�8A?�5!��|�����rԨF��s��P3�+bȕ���4���Sl*���C�V��?��p��(&H�_���T\'�5KYG_�U��6�G���PW�ў��4��4�8����<�v	�\0�#U��4��1��_��i�[{��q�Tq9���g��U_X!m�?�Z��2�{��U�O�*z���M��Wc��;��1�j���G�����G��R;LojCN�5B\Zh��HM\0撗�(\r%)撀�\Z\r!�4��8�\Z�\Zi��U/��b�����٥89�E�e�E�?�ޫA��\0��y?J\'q[GSZ:}�٭������VqWw=<D�*|�,�)\r-�䉊LS�RR\Zi��M4JJ^ԇ�\0!�>��h4\'�_�\0Xo��SE\r���h�\0u�SE8P��Y�<�P ��m\0֦Lf�<�T�8A�������bL��ck��iK;z��勁�}MP�덩ӽ\"�rsO�.]i��\0���֝LǨ栌d�\0v�x�F[���S\'a�r[{@@f\'���*�yh1��w5S~�s��4����sNM�F&��\n\0/�ңk�s#g�V<��ǐY�o������f���(������j��zH!����h�}�\'wiT\n�k6�f{����}��>�������������+���%Z��p��1��A��\\����Ib$z��U�K~�Hݏ�=�.wk�X�;�?�m�ȫ+������1��\0As���3��9�B��O	����{B����C��U�,6}a�\0��[Q����1�+/�����q��\0�4n���z���){0�;�qk!��?S��MA5Ξ���c����(�c|�dz3(�\0�i����\0�6?�)�1Ծ�b�!��~���ͬX�VH�w؄��+�7\'(����Mk���1�8�T��۹�P��ղ���\0J�&�+��P��e��#r(>�ȧ�ϻ��\0\Zj\"�4$�c����T溋8$��\0i��J���ƎA�x����ZH.s���@9���?6O�jf���]��;���l�	�Tu��\'�j��S!����Ϻ2~c�zU�f\\`�åD\"�c�r�@?����1�����\"��.z��=�J��8-����5�\',@#���\0^�v�yd=N0;�\n�s9%��y$t�S��7ʇ\n���\0׬ۉw�-x��\"Ӱ�&�\\�ڣ�޵J���T��^� �����}jI��O���i�L�Gb��en�<��vQGʠ/��\0֦��t]~�K���\0׊���I2���\'dua��Z���`\n�V�4�Y�{f�G�F$q�I�Vb�$���{U�{Q��:�ҹ\r��N+R��ڦ����i�k��GdiEk�ȫ+oV�\nv�;T��0�T�=*\'��2�-&tB�e�)����c���?���7+��5e+1�?Ҫ���q*��_��ʶi�r}H��F\0B��Ks\\̒͟s՛�WG��у���\0�ә�Q�KN�d�~<���\0���9O��g�ҿ�\"�[��92q�\'�\0\\T����I>P<���^��)p��\0}U 2-�m���{FƔ��c�9�D�XN�N1YV�Hw9��jBry�����>^;�̹�\0�b�2f�d�~�֓L!���̝?\n�,�q؊f����C�&L���#�5[[8��O�V�*������\0C��U��Sc���\0] ��S���y����\'�ҽ8�C(4v�&�B\Z1Ji��%\Z\0JNԴ��\Zi\r)�� \ZzSM8�M1���9�y��D�!�����F}��j~g�𬻖���SY��=<+/h�Y�����3|�A[=j+o�۪c�<�֧���ǈ��\'qZ)i)�x��ji�4�N4�@	IKҐ�\Z��PE���@�;}���ZF���4P1i*D]Ɛۦ{rj�}�h��~�2z�L�����d�L��~�ǘ��J����M	�0��jA!�95_vM^ӭ���^�攝���r��by�֮*�77\0vʒ(��ۅK�p8�9\\�D�q#�=:oz�|료�J�b2��C�և9\03lC�u?O��C!��D�u���b	v_����)UY��4��SGn���=\0��RT	da�T�?t��i�Og%���������\0m\'��M:(��o���F���q��������\0v3��Pat�w.����4�w�k��?����p��凩`?����y�gQ����\n�$q��0=K����Ǥ�A��;`�c�⦎]%��$q���f�`�ȲY��s}Y��-�ty������.��G��y����\0��SjS�\Ze�C����aG0X�E���Y����N��0��6=HA�5�,���5�g�=��1���V~�6��\0r5Z|�c\rt�~JH>����잤��ܒ?����j��{�G�B��P\"�7�|�Q��h����@K��#�\Z��h����~���������g�<:\"?;L��֎a�ƒ+{s�̇>�0\rB�����C�\0��m����0>j�r�����ȏ\"i\\��{G�qG0�`9����Ov%��S$��|5���c]�]��Ѣ�2d���U���$̡�����\0�T�?e�,`���A��^�viWr!笒qY�@�d=?�hDn�|�ǧ\'���Fi̹\n\n�N)ggvÒ[���>�Bk��dg8����HW�o�g\0��/�֒�\r�����ݛ\n\0���\\�B!�p�t���`��)`p���j����\\������$Nų��d{���F�ϙT�\0�=+\r1Qvڞ��m�?�\\�ޝ!LVJ(�d�x\\�_�]E���+9���h�I���j��Ҥ���jҷ��qY9]J�Ƞ���h�Zsҥ��zV�cVm��)$���*�D\0�S㊧T���+lC����x�Le�)��T\n���)3x2���\rp:�����J���5��J�n��$QOs��_�G��e;0<��I�U��`G=�������1��2k���2F2�r>A|$��4����Ӣ!�f�|��\0�-1�E�w0�y��Rs����\0��4�Rێ@o�V-�\0��ws�\0�\Z��6lO]��5j̓�����C4`}Ыg��1x#������_}�,>P?R?�U\r����a��5���g�����5�{��ڸ(��#��E��Y�՗?ʄ&X���֪�G�z����\'�U-i�n{�]�9��r���}�U��֬��1Y�פ�1���-4��\ZniO4�\0SM8�{�ڒ��PO�Қm\Zi�B�\'���P��!V����Rnƴi��E�o:W����C���3��g�sQ\\�a��x��Z�����u��k8��z���)��K�+C��ҚC@i��M=h\r!�4�@	IKHh\r���A�B����Xo��S@���}MM�Mڴ���£ݏƓvi��@;=����8S`Mo�U�w�+vAa���E��d���=���V�K�\0��sU��8���y�P�̒��x�4�ĬY�E����0�_J�gB�3Oe�X��s��4,ۛ��*^\0�����`lP���{}=�Q��AE=do��*n!����)e�	��X~B�\Z��n2q�Oz_��HY�U�I9�����p�I��_�R�W��.nr^W�`�c�󩡰�N���O����Q����C�(��\"���ʹz���P�Z@!�TOB�/�<��7���&R`Y��*��X[˟!�eK�~�D���`���\0��jl3bݦo�j8��\0�3V6��I<_/l��un/e��h��g+��J�y��q�{o-�X�L��:�\"�\0�D�� ɼ�oveC�5�4v1(i�U��d�:d*\02I�N���tl�H,��0끏ҡ�S��24�=T�*�N�d���g&��.MDuiS?貐z����MD\r�Ԭ�6�7r�I��*��!|�b���q��XϪ^#V�zy��qU\'�y�|�[7���5J\"��-��4#��ӓY�j����U��L�U�`���������d�S��Q�\'���q3K�o���5RK�8DH�\0�^O� ���>�K �c��R��W�Q�j{�h�zը�勌�Ŧ\'�w7��\0֬۫��P���&��͘��dǧ\0TkhX��ƴH���I?�~T�3��i�[\\�bt�G�k�X�2a����rwː��)�ȶ\r�0�xN�}�\0�*��5̌���ڝ+��$��n����U�/�@*�o�\\��B����i�D�1�����\0�����5�h7���_f��Gۄ�\\�������+��X��BMv�p��k�&��y%P��5���iAN)������s6}=*vB���QJ�$�q�)�ga�J�r�)q�Wc�ȉ�\n��5ӱq z�/L��0\0�k2�U�����y���F��擲	��k��\0�{)=�#�Z;\\W5�	��S4@�+��5�(T���Ϛϱ�z�T)M6�B��ϒ��UEtև�l=�\\�cd��#����%\\�3TI.��6p�;����nz�Q�*l:��\0Z �b���g���1~6�����jՃ����d����r?Z����4�{�i	�Ξv�[��1��MC)	�`\'���-�f�u!���M��=��Ќ٥hA�,z��L��X�-����q���a������B-������Y���փ��zVO�y {�e\r��Wc���\0^O�5U��Y���}	Y�譎Q��	�����4PhZnEm�cL�Q�f�@���Bk��A��-�elF; R?�s�˔�0Y\rlMYI$�<��V����qj���v�ܘ�׸�\Z�RWG�����Tt��4!��q�M�9��F���5�Җ/p�OJ��K���O�Vu�dt�1�H��ݏW	MB���iP�k��/��S�����E�:�JǟZ�����%-!��JCKHh�CJi(4�\ZSHh��N�4\0�����\Z��P&N�}����֊9zԄ�\nb��\'&�4SzS�J\0QRF��W��j1Vm3;T�6m#�\\�^qW	�������g��ڸf�Θ�5� �({��s�\'��|���+4���<�p;�tj\'��7^�9��֛V�l��y4ԋ�λ�辴�7��$g\n=j�+pxG-���R�+qT� 4�����U�$��FdX�\0�GS�Q\ZS������-��	�����23��s�?\Zj�����:RJG��=:(�)S��U��P��?ʑeh���A\'���{���j&7���O��Sڜ��A��Q���\\ƎJĻ��HK7��]����\0|�\0������6)�}�\n�.��\n��?/�֚W�3G.wI\" n��X�%�F \\<��Y���k:K�ݷm��ܷ�ri�ײpe�`O��\0�U(��Kn�oy)�\0�\Z�I�MU#�į�\"���pp ���l֬/����OÏ��v1�e���g�`�\0�PKs1�\0Yz}[�\0�*��}���xؾO�?Ɲ�n�$V>�q�\Z.�Ǒ�ns,���G�����1\'�\'�������;��b]��ӿ�-��ʨ�4�O�ʹR��HN{F�֜4�-���s�J舷�J���\"��5FpҰn[�#�<~B�1f�4�\0�z(�i�]�/��?����q���R���*�����hL�r��0�zz~Bg,��w��~Q�4��D�rP��ߍT���\0a{\nڝ7-�$� $�^���P���56�ԡq]Ф�M��~��A�x�Zה:O	\0au�|�������³��Lx�`}k�l���Z����*�h�hh@�U��W�`U��r#鞈�5�q�*�u:�;ֈ�ɗ�C�T��[M>%��Ŀ�g�\\���\Z���������iҝO�v\'C\r�Y[˯�v2Έ����&��S�Z}�V9>��|�θ;�r�Trnn�9ؼ(�*�����j?���W�l4m��\0���|Y|HG��:�u���w33RsQg4���]��B\n�V>s���|դ���z���0ps֫��5\"75v9���w� u��o!1�ws��bU�g�=HǱ�7��q:)���t��`tۏ�J������LqMr\0ןʟa�����\Z\\��>�$?�\\���Ls��T�i��I���\0�[��tүB\\��\rCZ�/@ٰ#?u�?������X�{R}q�ʛ)�GfV�B.XI��mԶG��\0s��Q�c�����m�c��Be�����]y�P=�l�Z������5�AjrU0�9�=�jV<��P��G(����)���\r%:�#W>��w�,:���<�Ͻn5�^5Y{��[-���{$.�ͅ�g�ђ3�9ʸ?z�g���׊���o��\"�)�WVv��|�a]\\E��W_��R����;ܤ�U\n8��j�Դ�$�b1��a���ֻ�6P�dJ���U1���vT��\"�*M5��\0�<,�Ty��15&�m��凲�\0Z�}o�zN�	���9�<?+~=��\\���k�\n5#lփ�YS��ñ��U#&x���{��R\Zv)�WI�b\ZJZCH���=h\r7�8�McM%)��bR\ZZmп}~���)���(�}���(��SH:�1�E%.h\0�8Si�Ҁ*�另*���G�Ҧ[7 �!��p��Ef%�T������Ҷ��;Sd��S�\0�֣���А�$A�q�#?�=�۷׊H�SOs�R{���}р=M�����>�J~@\\�UW��z�f�@3#d��N��*���\0�R��8\0u�S�%y8\'��(a��uo�p����i�~Q�s�U���!E\'���E�1�ݥ��`���]�쒜��-�~0,����\0�Ԑ�<�\01����j�B�?)�����U�t���p��W�8l�|��ӷ�\0^���Y�|��`\0(��/P�[`X�Ϣ���ӎ��~������2H;��,?A��\0*�}���PN��{s� ����6;�ːO�d�T����Š��>I�a�X���I��x7$^Z��_��5!�L��<�s�F����5-$\Z�B�K�ma��p[��}*EJ��`~g�jq=�d�#-���?�X��)Zh�w��{���g���{��\"\\��m&�wG1�����t�^_�����w�C��nB�����1���E�Q�������*��f�L��\n8\0X��Um���i6�q�<��d�Q�1��q�C��>�|��@U�����P���k*�� ګ��\0=jk������԰b���gc���{�e\Z<ڲ[Ŝ�c�F)�ס�c;�\"����h�@0-=V�m=���Kj���p�r\rzN����8n�����E_��氐I�#���ɉ�{U�糓�S�W����Y��\n��W��㻘�!�zU[��`�� S�1��ל�[���Q��n�o����k�v�J��D gnr��OW��<��ӡ/�����Oθב�b���y,�$�z�},#��g��x�^ꗸ����77�����L򿫜�a�0i��]�%�>~Rrwn�\Zr�J�585P���vqҢ��8��	A���C��s@�VQ�D0�E��\0���?�g�T����h������\0�8��7���hO�.�6�9�~�O���ސ��s��B̂&_\\�\0!Vty2�T�U�4msSM�^��qI\'0H3��M�ʬ�z�H�\0��K!*�\'���kMc�r?����m\0�kc��?Z�M9V�� �֧7|z@�ŷ�s\Z�����V�[�W%�>韞�߇Gc6CȨڜ�i���j0�Ph&���i3Jh�����H5q��Y���<��$ׇ=d~�Cݥ9�2�\'�P{�ӠU	�c�������g�7)�s�!���{��W_�l b}�J�����e:�#Y�o����`�C7�e�\'�t>.Y�Vn~xr���p�VWR?Z��7�#�\0�y.��\0vm��\0�O\'fk\Zկi������]B;�ܤ�Ip��o$2��ʥ}Erw��t76W\ryc.�Ċ=q�~��<Pnm���H�s���]!U�5)m��p�g��3�i�װ~NƚJ	��i(=i\r�\ZSM4\n�\ZCҔ�M������οQE���(,7�o� �7�o����c�-&h����P!¬ڶ	�¥��z\Z�!����0=*���Vm���Z!��+�q��/A�ڢ�b�C�*1��֥\r�G��K��ӊlm�4�t#��hi�)������M98����P2@���p)��_v�U�9�Z�ő�(T ;��˻�|�Ej̀9��$�#������V���nd}�t�\\r�����X��\0�)xD���ޘ�y8��(���D�=۰���ۨ*�l���p-9�>U皳\n\"7�\\pd=��[{��csvK�I�x�;G�?_��\\�+{5�\0G�7��q\'�Ҁ9��F��$��^p?ޢR�J6��<��uS��3~])���<�D���-V�U�@��T�ESk��0c�����l�\rgH�@`���\0��\'��)�{A�\0Z��\\�3��X�\0g�9�$����ͨ��+�Ks�.V�Y���ĝ?^*��HG�\'����䟦6[�Xl���`�*���/�h�\'�A?��\0�RAp�(d��i���\0J��54�<�6o�a���P��#�\"���wȧ��X�z��������6/$�I$�&��8�Rb�(���.(�GjpZ� ��=�I����:�)q@Sޜ)\0�\0(����c�N��4��҃E�p��T���	���)\r<J�R��`K�P�j]��\\�O 8��x��b���lw�H��5Aާ��R���3���1�Si$�f�f��&��5�����G�Zl��+���&P:�>��\\G��A���g�{O�Q�6׈����j[҉U�=T*�ӛ�����M�`��U�O��#ޅ�=�3�+���fork��8��qWgt�5��8knW&�zұ����`!8�&����04�м�\0�zmlizc�^s����jƽE6�K*����4���Z@�S�7�.y�a`Goz[\r�I����88-�׎���|�r�#GN֭ ��c�j&�j��`��4d����{���$����d����I�y�JH%*rz�Un�~�/�R	��\rs���\\��Ƥ�\0���U��Ɯ��[�|��~G��arS{3nK����;�+���&��5�#��mƺ�|C�����s��ۻ��~��V\Zһ�|�b�*^����iM6����i)C�M4�J\0i�4���1�����RR�C@hO��Z\r\"}���	,��o��R1���h��RP:�1Ԣ�J(�S8RF�_�����+��U���H>��m0���kĸ�AzR7\0���֞܅j�ƗO�&����mb=�B6�ֆ�2F?0 9�P���c��fke8����6:v4��>�	���JCl�A�s�jx�	�y�T#����u=���S@�#\'��ޣ+�I�s�{��&�j��*h��c�V4�eq^�tq�`���\0�jV�#@��8\02I0\n���֡w)v�����f��Z-�Q��{��j���;a3����\"I�,p�*M�A��J6�F����_Ε�\"�@��u?�_ʜI\'l`ذ�B��F�I�.z���\0��0!���x<�?���\'���d;�s�#�欴�o�G��y?�j�h$s��`��?��Ԍ�E��1,�\'}����i�d�\'��� ����*V�8�Й��*�����Y1��d^;}kZp敉lɿ���S,�3�`d��Y�l��>ʯ�5�B)+#2@��=�Bԫ=c�HvR� T�Z]��U`\"��4l��JW4�i�_j]��P��1@�P��f�HC@����1)A�iq@-&=)R�E(Q@�t��y��J8�	��n�����\0L��SF�YO*5\0^��\\Ջfpp?�*�MV��k��Xק� �Qvw:H5�#�Qݞ�>c��-f���B��S�1�?�?Ҿ}�3����#�\0�Z�h�Xz��>q֮[�]����bk���&s�5�jm��는�zx}�\Z���C֖�Mt��y4\0I���ɥ�7�E�5,�p\0�]���ŧ��@$�=[���kV�5�竕�5q�4����\0�P�<2ĭ�����\0��t\"��/^]J�����09},?gEz����Q �����n�H��Wp\0\n�}aq�[4V�Gp˰��`�/�q��\"�]���ԝ��Y[��#�خD��bIh����SGⶏsF��U;�<=�s�f��5F��F:�&׭�z�>��w��$)��rJ������ �g����{�L����rs��M~Kj�?«�Us^��\'��#�V�a\r%)���<P�ӳM4�;Siݩ�\0�A�4�h:SM;�!4\0��M8�hR/�_��П|}h,?�o�7,~�PP��QH�))Tf���`�\n\0�\r]��i�\0�G����ފP@5e�*9�+\"�q�Mh�.�XJ64LY�{M߃�t㯡��U�v����Zf���<�SWܸ��6ǂ\\�5\"i=�fϥ@����<�r��A.v0�jb�ld<�ނ�?*��*�5#�mj	�\"\0ө=g���pj�~~oS�r�rOAҪ�id�S�~RF�h������Sn8���)�K��\0��5!�c��h �@;\n\0P�_��ݿ`��*�\0�֐\r큞z�,�Nȓ�ANK#�).~�*�V���}9��h��}��\r!�D6�@�z*��8��>ի\\>P�\0�a����R�[X]�,ET�:��\0\n�IX�\'�ɮ�$urb��+�����j��P���p?����<\n�#���c�%�gJ�\0���x�i�}�zJ��hh\'ғ�3ڀ.)�P\0(#�(ϥ(9�\0�M;��/SLcS�K�F9�\0 ��SIӚ@RsI��G^i��F�>����7P1�R#T�U�h�7J�gA8��=({J�\\�?0l�9��gv?�5�c;$���q[w��9�^.�-OS���\'�܉6������\0��gҳt����kJ2~�s\\�Է��a�n�ƹ�\Z��Ës\\su�N��pU�m4�iI�-!�E�q�\'\'�[ɤ�9T��۱���<D�iu�㏗?�+{$\n�l�c\0v����������8ahF�:~/����HZ��>[�q�y���S]M\r2�7�VY��&F\\�Ϸ���K�)�ZR�N�ji�9��|���\Z����2�ݛ�=H�g��G,p�+*���nk���L3���չ�Ȣ��l�8�ﱺQj�F_�4�K8��h�R<�_�A�Zó���4�j�5��bL���ӝ�\'�k��;�c��/m��p�I��Bj#KM5�EYX�:�I�������\Zfb\ZN���\0��\ZSM4\0��i��@!��P\0i���MaH�}~��\'�_��a��}M-#}�����)i)hiG�P�)��\0�U<�E(<�\"�o�+B�3�VR�jh�+��I��$Y��r�����ӡ�H����I��[�y�k%[�Z͵��Q8ܸ�P��P0�J�[# ���s�X$h�!�#ҥcQ}�=�M��}���I�	��ґGʟ_�J�{��t�:b�\Z�(i�?J��i|��GB����.|�����R�,B���\nP!��\n&�ċ��ϥE\n�Zt�Y�\0��I�)�M��{}k>�Q򲐒�3��\0�E��o����޾�� .%�zA�7Y�\"�M�s��3\\�u���l�v���ۯ��\0�Y�e��/��ף���g\'r՜f�)���S�{�A��7f�R.�RdTa�NU\0���V�G��7��vE�D\r87	��iF��Jh��曚Pq@�\nu2�@�d�ڜ��Ph��i(>�\\��ix��Li��	�����@j7TLؠ����)���E�ހ��u85A�����j6��W#z�F�D����[+�9��bLHH8=k����[\0�|.3�0����|tR5��E�4�s߽j)�\0K��Vf�}�\Z��)O�ט�6{������]_��!�3^��᩸�Vt�܂j��C�9qO�3�ɗ�e?�;{���!�YVg�<\n�K�Q��x�j~�N��v^fD�Ʊ��@,,���Z�^kS�CFĞ;��\r�����9��Sa�,r~���@��8���x�h�\n���OAYϙX��^�J*��U��7.��]FX�*�\ZӇX�U��k�V��͓�y��F�8�&Mw�]�]B��&���`�\"�4�\"�da�7�*j�3�>U��\Z\r!�N(���6�4���\ZZi�Bf���I�`i(4�\0��ҊCA,Nh_��Z	�~��EE����@�o��SE@��@�P))s@ť��K@���\nZ\0p4�j1N�_(���aN�������z�\rK�I��lZO��\0�\Z�둃��4rm ��Ki��+}k�Q�����[ ��R��늒x�sP�7\"�\Zq���C���s�S�T�d��P>�/$Ҏ��d����=)��q��N\'��4BJ3��P�v(Q�U;Ɍq�S�\Z�+\0���\0:Ι�9s�*(��h��㚅�q�a��Ԟ���D��D�R9�|���@��?��\0XT$�hp\0�)�L$��\\䓅>¡g�B�l���4ܓQ��un��>����\0JP٦��V��~T�sހ&R��A�Ni	���Q�������G��P���\r�N\rL	E8}j5<Ӂ���R�x��Q�q�x�ڌ�R\Z\0k���S�U��]��sM2�C;皌=!�w���sO\r@����8\Z`XW�G\'J��S���/�WI�ɾ�Г���N���Wv�c\0*	�sb�zl�;Hܲ����Tq:b���&Z��\0��k�KSw���C�ڹf��ħ�J�MzT~���0��;rJ��֫G�EA�ֵ�[H	���N�EIØNi�-���I��K�Y�Z��@5J{�I9���q��QS�ޒO�Y�S4�g���$������D�7�j�����7��˸������`P[�OSB)c���<���f�ek�7�*��b1�8�t�zԭië<�^%�\nJZC[`v����\04���CHzQސ�1\r!�4�h�����1)	�4���HM-!�HJU���)��~u��\n,��SFho��SI@�J)4�\r�ii(udQ@���Ec�E ��A\"Ӆ4R�P�N\r�`�\n\0��U�%�pj��\rN��CE&mE ��i�a�ޫK�j�	v0��s��G?Z��f�� S�5b3�nj���Va�~֔��L�~t�p��:�z���aqO�\0#9���ԡq^��S-��+�7��~cU$��2���U]���U�$ȏROA��7U�0[���/�֌�*�ߩ��7�+��p��q���\n���-�SK�/!�7y��茰Z�\Z�[֞zՅ�h�\Z��ژ�҃M�H\rA֝��4���)A�n���\"M�n��R� u�	�{҆�7�\Zr�\0Y\rOV&����4�ب��g�%G����GTlx�-��A)���zJ�Q#f����Q\"�	Ԡ�@\Z�\n.��Q�h��`H���6櫯Z�3@�l7N+kEs���T����+cGp��{�޲���nu���ֵ��Jȵ�Q�kg��\Zڛ�2|Hܨ�t��\0�̹�`���\nzD�nVE�,�a�\n�\\�;B�D��A�f�kϛ�1��հ��^��	e&����j��ܿP:ST��z�,����	�r�Z�w/�&�~U�ݾ�\'�S\0��߭t���\\�Q1�W��3;��(�i,t��m�mOS[�D��D��_Vpb�J+�;��E\n�\0t�P��7q(�������ҚJ%!����ii3@���SI@\r��\r\0%4Қi�\ZLҚm\0�4����(�>��E,7�o�%+}���J\0viE4R�KE%-B��\nQ@ţ�P�-4u�PH��M���҃M�x�jEnj*r�[G���o��e�j���SEE�#k�ެێC(��X�`\n�OB�?jkvG֚�$�	jj\0n z⦔�	�2/��L�K��\'�-�\'w��2�v^MY���ª�;}��ְFs ���1���Wr�3�1?x�]6�s�{2������z�\'l�]5�ɱ~qI���M��[ň�>)�J���~*�-	iD����w�w���h�U��u;��B^����K��\\��Z<�{�O3&�5�<�hUC�҇4�-o���UK�Qp�hIR,���\"Ozx��/,��0@JE/��_��!�U7ޔI��2�=��3UVLT���i6;�?�SR�r�AR&<qNS8j�����\r=y�hp�c��I�&Y��l[lѷ0<�k5:�U�s��M]XGkk�1yȭ|��Ų}�䜀k\\��f�7���3��YV�匇���@wJ��U8��\0kV|��]OO$��\\C�-���*ݯZƼ�\Zۺ<\Zļ�\\�>��2�\'8�E��:�zYN�[�A��L�g�h?3WM5��13��R���h�8�;=%T��=B�SM��������\Z�	6y�JM=ƀ\0�\0�R�Ⓐ<fQ�J��Hh��sKI@�4�Ri(\0\'�SI@�4�Ji\r�!��=h��Ji\r�M!��ڂ������)(O��ZXo��SE\r���E\0(�Sihu��(	!�QAC���P����Z�)��h:��4��t�\nh�\n�y���\Z������Q\"�?p�2�B�-�ҥA�?:�F��8�m�9�N)�7K�n>�	XE�T2�I>�3\'Y�o��i]�l�&=�_���$��[&�\"�����H.���\n}+��J�55�)\0���k�H&<�Z����J~�&s�0�ά�a5�b�e�U68��4�G-JR��Շ�.���q#5�fD����S�T�v�)�	�\n]��Δ6y�۳KQf�1��q\\�\Z\\��K���䡱J���;};����w����;�8z���F�.�\'���*��NG0�h7zppj�~�\"�=�E�E�z�[��Z�^��Dr��SQ3|�C�M<Ӈ4�3R(��Q�HzTJ�cbsS��)괄�U��\r@�*�\Zu�C�����1���)�k�����}�,A��\n����f��hgj�u���L�,��i�Uelf�g.f}�_�����ԯs\'QY7l0I8����t�\Z\"kU�`��m%�[!G�ҋ�w���W�#	@�i�kv�VV�� �廚�M[C��j95Q\Z�bn�}k��\Z\\xނ�ִ�S�̧v�- �4Z�Pf�ҚJ�4�Ri(\0���!4CM&�4���\Z)	�HCIJi3@�4���f�D�&�C@M&h�4!�C��RP�}~��[���J�}���(����P!�RR�H��SE8PR��3J:P1E(4�QA,u-\'��BӅ ��ҁ��(T�J�=?ZW�@֮ 8�G{}2j����-\0/S�M����ޔ����߀�s��ޥ����*Kuڹ=j �G�daEL��qC����0p~���SJ��j�s�҈Drc\\�\\~�	��N\'\'�ԇ\n	�Z���9;\"���l����h7sT�O�\\��}�\Z\n�%�M�J���b�����}+���?��ۆ=溰��ǉ�R\\�]�֤�0�⻓>y�S��5}i@�zd�y4���Q�\Z`.iA��\0��n�9�4��Rn>��M&�%�F�5	z7zQp%2Q�TJ@�<�.2��҇�z����(cE�E�!=i�&;�Ez�I?�+��+!\'�άCȪ��Lը۠�E�?�#ަF��8Y����j��,��S)YZ�݁֝�,��R	*��@>�\'ړ�G�1�*H�٤iN_\n��$�������H��)�i�\0��Q��w6X:��qg\\�S+�t5·�����uyn�F\\(�MW��D��V�\'u��6���\0����E�q��;���^OpY���y���ı�k�5͡�d�/iS��h��?�c*�ǭX������4}d�s�Z̝�j�����[5�N\Z�+KM�ri�O�r¶��T5�e�8��S�\"�5��k�����t�U�E%����hf��E\Zx��Zm\0⛚SHq@04�Zi�\Zm)4��4���@�R\ZJJ	E-!��(_��QIڄ���L�Zo��SH)[�7֓4�R�AE\0:��J(%�)E%-\0�P\r �.i��2�(@��Nޔ�|b��:��g��	�z���h@�>?x>�U��N�����RFJ[��#f+)O,6֪Āq*�t�,x��qP��R���翩��U��}*�F���7��Fm�n��Tܫ���\'�Ф�.I5k�ǡ\0�S�dp\0ۥ��b�,�zӜ���H��;}N�����,J\\� `v���5�V3nᝣ��S��׵I�����X�+:��=<����+�ԍ��gܷQWd<\Z͹n�ȏ���Jcֱ�4�߅kJ՛z7FEoI�I�F6��1ښF)�9�Fk�G��\n>�\r8U�1qN���F=(����)�T�\\�J��SH�\n�M+S��V� �I���F�P41#�JrǞ���b�P��$x<��6�)�(E�L�T�qP�ߑCe�T����^*KV�a��*��|��8��G�Tc�\\�j��w`������L�~��>�V���|�~����lA(+���$\n�^|�g�arjQ��7��wgf*_�EgV�/��m¿����F8\Zh��F���R�H?�����\0�ͲzP�2�c�O�y�4�SF0��@\'�vf�GAP�\"C�$�k\Z��-|�.\rZF��f���]��z��l\nwl�������̰�x��*Q�E#U)ߊ�f�g�\'ZqARZ�l��\'Z�+d���G�U܈�j͚n�T�_�c��\'��Gކ����N)����+�*��\Z�曐RQA�b�Ri(!��I�\0�\Z;P1��J^Ԕ%4ҚCABQڊJ!��4��@�PM%!i��)��&������J���)���}����~v��JEE%-\0.h��Z\\�R�@���fiE\0�\n\\�R�1A��0S�Ub;ը.�>�\"��NޓW͸u1����^��#�?�k�R��tj��)H����L\'�<���(�S�:x���ֳt�S:f�de�ҪM\'n3�ɬ_8��+��F�GߡS9v[�O}sU��rpO�0m����_��X�F�n���SMf�==�&���AP��<��\0*v��M�Ja<SKb�����=R>�!��ʣ���f\\5^���ˆ���������sV�n�FcִGVgL�cP���3U��A�&|�h�͡�)��:�8��%�*54�ɫ����\r.x��4SsI�B�J(�\0&)1N��\0&(�:�\0h�PqF)���4��ShT��n��d�m�T3DBu�}k�рR����W�J8+\\X��{\'��z��*�A�j�tw�V�([#�y�����,�cӗ֚�܁���Tf����A\'�����ғ�tn��+�/�j�p*�sם�Dlx�$lT�qUg|\n���Z�Lf�f~MZ��j���D�:�+Hj5<�U��cW�+V�v���VlI�[��z�[A]�f2|���撊\ru��f��(��	E�)\r��4�ғI@��Pi(\Zi3A���M&��s@�R\ZZoZzJZBh(CHM.i��&hO�>���/�_��������R��o�%�-%\0�QE���\0u.i��>���Ph�)i)hA�f�(�\0<\ZPi���	C�ޜ%n梥�(��\0�)�y���\Z\\Ұ������	<��8����7Sw\Zm��B���f₧�;S$8�U�4�>�-��a��\\�f������\Z�1�F�ZS֨�jܧ��)�GVV���Vj���P�wR�O�ů�2<PiM6�9�)��)A�V$�(j�4�i�;4��R��Zfis@����>�\0�CI�:����ih)\n)qI�jZ���*6�Rv�؜c�e&D�����K<�rۿ�R�m,�ň��2���Ǝ�(��ٲ��i-�������s�0��lh�R�Q���I\Z�B��j�ܢ�\0h���w1�\'8��\\��\r4�������J�	,�=j7jRj)���\"��\rP�N�<����MZG,�E+Uw5$�U����9���ɧ��0-Z9&���.j���\0�V1�\"��O���K[�k;AG��Ph����)(\0�4��8�4f��Hh��M�@���C@��m:�H�\r7<Ph�B\ZN����\n@M����Q�CLL)S�֒����)q��}i1C}���3ABR�JZ/֊)3@����\0p4��p4SJ)3K@�f�M�(4u(SsKM��f�\Zm���SA�PњL�@�T�E�6{֘�dm��֌QP��j�yU�緓��S�_\n�Y]��̤V��R�L�>�P�2\'5FcZ1�5�85�8j�%j�)�2��+b��<� -�����>�箺OC���w\"=i�)ƚkS����4T-�J	4��昇f��f�;8�4�QpFx�\'z)����������֗<�R)E4RԲ���F�\'j��Z�R*��!���Jo�\\����]>�r����{����-tV��s:c\n�m��ם3�0��Ӎ��]��\'��ު��W\'�f\\ݙ\\�j����Vst�1�ϯ�W�M�#6h����q|Uy^�ޫK%U���g��H�,��U����6F櫹���\rV�Y��Ҩ撥�s�Y�\"���Fol\n���\0�\'�+�����Χ5[v�QEjy�\Z(�<\Z\0)\r�!�ɣ4�\r!�4��M!4f���CE%2B��i	�4���AAM4��z�RKHi�_��QHzү�QAE����4f�����P0h4f�ƀ�QK@\n(E��\0��L��K�niA��(�Ӂ�gI�Zb9�4�)hsFi)h�_n���X��>c�+:�QWgV,MUN�;m����Z�R\"`t�\"����ݟ�a�СMS�Ȯ�N3Z\n�:�IPʹ�n�f�pk�֨��W�P����u�雚�\'�ZV!v�ϥL���V~j��5�WE#��;�6��Na�4��#�I�h�Q,\\҃M�Jx�@�f�\Zfis�.�N\rL��������@J\r ��Lc��IJ8�hQJ\r6�8�����Z�<TRdT1�����t�C|�\\ļ�].�s\Za\\��=<��񝎘�\n߶|�s�{`\n�Y���zW�$}�VE�˼/�֪!�y��S#d�����gR�ɨݨg�$z�d��$��ɚt�֪��h�rڡcN-P�f�9�ƻsQ�3TDգ�l^�b�]O5r�7H>�h朋���Sh\',O�%v�Y!^�=G �����aI�ZC֐4�\\�I@����I@$�\r)4��\ZJbbQE!�\0i\r�P4���i\r\0!4�ILL(4RR\0�J��_��\"�����Z��SFh��SIH�����Fi3K@h�\n\0Z:Q�(\0����\n\\�sE\0>�S3K�\0u8\Ze(4\0�)�4n�f�u�f���\0�\nJ�����aֶ��*�J�g\0�@��ւ(�6�^ge���6_�zw����\0!�qC\np�X�D*��W$5Nf��j�]�zļ�[wg�aޞ��O2��rz�t�kB�2���<<Cԍ#��U��v�*�Ԡj������r>Qɫ>%�l�H����u�Mu<���D�=j6�R7ZcV�;x�Ph�L�h��4f�K�J(riA�斘��iݩ����\r8q@�-%E!E.(I��)�=*\rCNC�k��[�1�j��oh��zq\\�����J�~G]d�ǥ]��(�ֲm$�k����֧�ҝ�^��V<�*�o�O�}豯1a��$��d��L�H�HI�@�C�B�T�$�g���M1���R\Z�L�hcM�#�l�+B�mVolU�zV�cl`~5���cj�RljN�g]g˰&�ҚNh$>����@�-&h4�����@њCB����4�SIAI!�����M%0aHh��!�J(� �B����JT������}�������4��.iE4�Z����h�RR��IK@IG�\\��oJZ--6�\Z.iA�斀\Z��K@�\n�c���UcC#��f� �\0�\\؊����G���=�����\0�O�ib�^+�g�AY�1�QHh����;�V%Z�;��e+��X�g�j�?�ƺnkH�n!��<UTn5b�����f�Pu\'�¯-M��ɵ��?��$��1I��g��\0�V� ���V~����?�`߭u�dxn|ӹɷZa�Tf���IJy4A,J&E�旭4sFh��sN�\0^��RR�)���)��N\rL�I�3N�C��Zfi��e�P�ҥ<�2w�c+?Z��$²�5�Ú��>یxV5ctά�k&u��aj�o�́�QV�|W�����x5/��U��9�ts�*7��i3Lg�C��|�SKSI�FnB�S	��OɍcM�41��ɭ�9-WsZ9�vI���)G��fU�%�Rh�4����(\\�I���XA4f�h�&��J\0(���p&��i	� ����R���\r&h�� &���@��))AIKH(�����(&�>��i�e��}M%~v��b�ŠR\nZдf���@4���b�x��\0�\nLъ\0q�4��@KM��Fi3�Z�PiI~l�q�zRi+�JT�Rjݗl ��z�ԍx�m��:b��חR\\ҹ�>�RT��z-J8����;��W��I��%4e9K\'S��;��IY��ך�rT���RVE����u�._�iyX��$95����ga��}k&��eE$�WWo\n�±/E����1�z.��[QO2�uﰟ˚�Qʡє��#���N!��F��H=�*�Ռ4���A!�IK�J`sKE\n�(���)��J(�u7�S@<\Z\\�L�`��(����P�G��d�3Q�C��=�l�3�P�NN=�KWF���gW|����}���V�ZV�y�_NwI���^��F�����Qn�u1sn��3u!j�8�i��f��M#)HF�Ļ�Qg��aN�ڶ�o���+(EɗaM�>�ԙ���|�I�IɋA����qI�)(�\Z^��\0M%�h�CE%\nCE%����4f��)	��R\Z\0)\r�bbPy��B\nJ3ElRPi������))����)a��}M6��\0}���@Ţ��\0\\њ(����\0Z��-\0-��\0QI�Z.h��4Z3I�\0��l ����o�@1���x�ɉ�eʏ��p|�u��.\0�)��Lp�eaE1ڕ���@��J��Q�\\T�K�T&��ZG4�G4��q-K4�k:�Z�#ϭP��OzΙ˶Mq-K�؛�|��ׯ�����&.���{E��c��|��s�V�4`)s]QV>~srwb�7�H�#�~�/&P1�?Ϊ5h�1��	FO8<�+9��4E6�i��\nJ^�PQE&FxS�h�Z\03K�AE\0.i���Ҕt�C���L��SKH-;���l*R=�6,M�c�U�P)f��>Sa�:V��s�����n)C�a��%hY����G�,f���Ԅ�=>bM����2iQas�o�CQ��D�����0���B����*T�%���p���A\Z��Gm\0�?�=MM��,���b=���\n(��1h4g�L�E&h�@!4���	a�JJ\r\n)3Fh���Hh����Hi�CA4I@�QIH�4��AI�(�0�HiM%\0����)3J�}~������i)_���PE\n\0Ph�AE\n(���\0^is�Lњ.h�6��њi�QN����?6@Aɥ)$�ͨҕY�Gv^��j��5�`\n�`*�W�9s;��`��MB=	S���k�*,u�a$|\n�4�y��_z�<�y�H�s<��T&��,��JiqZ$qU�Eq5f�MR�MT�=̢4&��O#]$-����xϠ����aW�QZZ��A�V>����F���+:��)i��:��4�isM&�׈F/��2���KVψ��ОyR+�h�#4�iƚE0Pi����\'zS��.;�P)(�\0--\'ց@8��)����p�\n`�@J\0q�;Qp�mO&�i\0�@�4��\0�sWm%(q��4��E*J�֕YB\\�5�ޝ�}����\r*�F~�DC#mu*ñ�9�qg�C\Z�M�4�^������\'ZZ1�RE��Urj�2�D�؈��\0ɭ[KQ\n�o�J-�V��zՊ����qX�v;E&sFkS�Z3Hh�\0f�L�ց!4\ZBha�J)(����I�iFi(��&�3I@��J	�� ���Hh���3Hi	�JZ)�J3A�=hs�J:\n)Jr����LR��_��E�����ӟ���s�\n(��4RQ@Gj2(��Lњ\0\\�u���Խ�2(Ȧ ��%(�b�Ӱ�j�MP�<�\0�[P&�+�?�}6C��u��,�8��D���\\G��D8�*���t�`U���4����/Z�,�i��Tf�ޭ#��A�K��q5>y��:iK65�by��Xd��8U�p\0�{!iO27�>���c�6A�����z�����b�>��l-(4���Z�C�Fi)sH4���h�c�C{��U�Ʒ�I�����VPZ�i4�w�\Za�\0O�E!��Fih�@	E.pi=�R�H(���)3�@�O_z`#ҔP�isM��@���M&�\r4���J���{�U�\Z�3oI�c����$1θ�A���g\'�\"��k�V�I��tQ�K`v��F�gNz��i��>�+U+\\��̍�\n�i\Z�E\0S��QKc\n��?��QTd(��&��4f��4\\�f�9��\\(��4ZBi\r�����P0���P�Fi(i(S$\\�QHi\rQ��Q�L\0�\Z(� \n(���*����Lҩ���(i�}���=�<����E\0y/��֏%�\0���E%�\0�����Z(�����y/��֊(y/��֏%�\0���E����y/��֊(\0�d��i<����E\0�K�\0w�����֊(\Z44�7?6:�ִV���h�����w?Aˢ�B*=��.��i��(���Efw�2��!���)VO���QZ$sT�)L����P�I����EZ<��v3��6��oO�]@��?tdqE�M?��+X�!�������EЏ_)�\0��҈����P�_*OO֏)�?Z(�����!��\0���E\0dx�	\r�goI=}�s�	?���E�a�D���i�D���h��	�y?�����\0w���\0O\"O����D����Py2w���e?���E\0	?��� ����S������/�&>��E\0�3�ZQ���EPGd���i�D����R�?���$���EC���hI��֊(�I��֧�?���(�r����[�{���8��r�l�\"����K����QY�<���i|����E\0yO��֏%�\0���E\0\'���Z<����E\0�\'���I�?�Z(��K�\0w������EO��֓����QAH<����I��Z(�`a����T��Z(������K�\0w���\0C�\0w���_���S$<�?�����Z(� �_���\'�����P4K�\0v�����QLa�I��֓���E)�\0�����Z(�+���\0��h�_���S<����J����{��E ?��','79vwko88diwwkkgkc4k0',NULL,NULL,'vineethrvin@gmail.com',NULL),(25,NULL,'TEXT','79vwko88diwwkkgkc4k0',NULL,'79vwko88diwwkkgkc4k0',NULL,NULL,'vineethrvin@gmail.com',NULL),(36,NULL,'TEXT','dgsdfgsdfgdf',NULL,'79vwko88diwwkkgkc4k0',NULL,NULL,'vineethrvin@gmail.com',NULL),(37,NULL,'TEXT','fdfdfdfsfs',NULL,'79vwko88diwwkkgkc4k0',NULL,NULL,'vineethrvin@gmail.com',NULL),(38,NULL,'TEXT','abcdlkadlkajfalkfjsf',NULL,'79vwko88diwwkkgkc4k0',NULL,NULL,'vineethrvin@gmail.com',NULL),(39,NULL,'TEXT','I am testing this post',NULL,'79vwko88diwwkkgkc4k0',NULL,NULL,'vineethrvin@gmail.com',NULL),(40,NULL,'TEXT','I am testing this post',NULL,'79vwko88diwwkkgkc4k0',NULL,NULL,'vineethrvin@gmail.com',NULL),(41,NULL,'TEXT','This is my post',NULL,'79vwko88diwwkkgkc4k0',NULL,NULL,'vineethrvin@gmail.com',NULL),(42,NULL,'TEXT','x;fk;mf;kfmkldmfklflfmlksnvlsvslvslvm',NULL,'79vwko88diwwkkgkc4k0',NULL,NULL,'vineethrvin@gmail.com',NULL),(43,NULL,'TEXT','sfasfsffsdfsdfsf',NULL,'79vwko88diwwkkgkc4k0','2019-05-27 01:09:56',NULL,'vineethrvin@gmail.com',NULL),(44,NULL,'TEXT','I am testing a post',NULL,'c3s4zjlesvsw4kwkoccw','2019-05-27 01:10:14',NULL,'vineethrvin@gmail.com',NULL),(45,NULL,'TEXT','this is testing with time',NULL,'c3s4zjlesvsw4kwkoccw','2019-05-27 01:10:34',NULL,'vineethrvin@gmail.com',NULL);

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

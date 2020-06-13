
drop database if exists wittershoedb;

CREATE DATABASE wittershoedb CHARACTER SET utf8;

use wittershoedb;

-- MySQL dump 10.13  Distrib 5.7.30, for Linux (x86_64)
--
-- Host: localhost    Database: wittershoedb
-- ------------------------------------------------------
-- Server version	5.7.30-0ubuntu0.18.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


--
-- Temporary table structure for view `HOT_SHOES`
--

DROP TABLE IF EXISTS `HOT_SHOES`;
/*!50001 DROP VIEW IF EXISTS `HOT_SHOES`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `HOT_SHOES` AS SELECT 
 1 AS `shoe_id`,
 1 AS `shoeName`,
 1 AS `shoeModel`,
 1 AS `viewCount`,
 1 AS `quantitySold`,
 1 AS `favouriteCount`,
 1 AS `shoeThumbnail`,
 1 AS `categoryName`,
 1 AS `newPrice`,
 1 AS `hotCount`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `HOT_SHOES_NEXT`
--

DROP TABLE IF EXISTS `HOT_SHOES_NEXT`;
/*!50001 DROP VIEW IF EXISTS `HOT_SHOES_NEXT`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `HOT_SHOES_NEXT` AS SELECT 
 1 AS `shoe_id`,
 1 AS `shoeName`,
 1 AS `shoeModel`,
 1 AS `viewCount`,
 1 AS `quantitySold`,
 1 AS `favouriteCount`,
 1 AS `shoeThumbnail`,
 1 AS `categoryName`,
 1 AS `newPrice`,
 1 AS `hotCount`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `NEW_SHOES`
--

DROP TABLE IF EXISTS `NEW_SHOES`;
/*!50001 DROP VIEW IF EXISTS `NEW_SHOES`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `NEW_SHOES` AS SELECT 
 1 AS `shoe_id`,
 1 AS `shoeName`,
 1 AS `shoeModel`,
 1 AS `shoeThumbnail`,
 1 AS `dateCreated`,
 1 AS `categoryName`,
 1 AS `newPrice`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `NEW_SHOES_NEXT`
--

DROP TABLE IF EXISTS `NEW_SHOES_NEXT`;
/*!50001 DROP VIEW IF EXISTS `NEW_SHOES_NEXT`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `NEW_SHOES_NEXT` AS SELECT 
 1 AS `shoe_id`,
 1 AS `shoeName`,
 1 AS `shoeModel`,
 1 AS `shoeThumbnail`,
 1 AS `dateCreated`,
 1 AS `categoryName`,
 1 AS `newPrice`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `account_user`
--

DROP TABLE IF EXISTS `account_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `displayName` varchar(128) NOT NULL,
  `messengerId` varchar(128) NOT NULL,
  `phone` varchar(32) NOT NULL,
  `defaultAddress` varchar(255) NOT NULL,
  `gender` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_user`
--

LOCK TABLES `account_user` WRITE;
/*!40000 ALTER TABLE `account_user` DISABLE KEYS */;
INSERT INTO `account_user` VALUES (1,'pbkdf2_sha256$180000$GhDe2jfiXjod$48dL5zXbOIJlyzpMxfApgobyh8ZD9GjhDa37cOCBMP4=','2020-05-22 18:56:24.909712',1,'admin','','','123@abc.com',1,1,'2019-09-11 08:54:47.000000','Admin','','01234','ha noi',1),(3,'pbkdf2_sha256$180000$FKK9x2N2L82d$KlV9Oj1lCx7q3cf2J6R1gV1srJQLDb1Ed0Jx98T3NGA=','2020-04-23 13:44:19.329647',0,'admin234','','','',0,1,'2020-04-23 13:44:19.143727','dfsdfsdfss','','3123123123123','',1),(4,'pbkdf2_sha256$180000$5VBDXcjNTUTj$tjb8pzPd5/qX3KItDJhA/mkdtK5/95W9iKDus4/cHA8=','2020-04-23 13:47:21.483075',0,'gianguser3','','','',0,1,'2020-04-23 13:47:21.287734','dfsdfsdfss','','3123123123123','',1),(5,'pbkdf2_sha256$180000$3ccBiRKUcwYi$DxH2wztIJ/6Oz8DM9Z8uvDA/PBQr3+Imdxt6Cgbkpnw=','2020-04-23 13:51:50.845786',0,'gianguser4','','','',0,1,'2020-04-23 13:51:50.649102','dfsdfsdfss','','3123123123123','',1),(6,'pbkdf2_sha256$180000$LkUbQRLX0hWo$DU4S1PewyAMSHos8uybhUvisUDw13jXoBFglo97fh80=','2020-04-23 13:52:51.633502',0,'gianguser5','','','',0,1,'2020-04-23 13:52:51.447232','dfsdfsdfss','','3123123123123','',1),(7,'pbkdf2_sha256$180000$jxSFPUe0hvkd$45cWjA8NDRJCyWcNQjxG9QVCoH3XwlF1H5t2QdB4jX8=','2020-04-23 13:55:56.356090',0,'gianguser6','','','',0,1,'2020-04-23 13:55:56.186061','dfsdfsdfss','','3123123123123','',1),(9,'pbkdf2_sha256$180000$yGC0oAKGC9ie$Ft7B2tojGTfHG1BVUF0QvZP/h61iFcIEjaN4JqYuhKo=','2020-05-22 16:59:14.000000',0,'giang3','','','sth@gmail.com',0,1,'2020-04-28 09:35:05.000000','Nguyễn Đình Giang','','098 765 4321','DHCN Hà Nội',1),(31,'pbkdf2_sha256$180000$2SglLVg8zcKc$XC9fVhXhbMWlj04pX+GVXfKwp+QWcCDu1fDh3X7ujJQ=',NULL,0,'98877','','','',0,1,'2020-05-08 15:24:29.054432','giang 1231231231','98877','','',1),(33,'pbkdf2_sha256$180000$9N2JtrIYcwkB$wbUSXw4KwCL9YcOvdIObKlg7M6BqPZ4unVDDtBgM93M=','2020-05-12 13:16:11.583848',0,'1234567','','','',0,1,'2020-05-08 17:56:16.000000','giang 123 messenger user','1234567','098 765 4321000','Ha noi 1123',1),(34,'pbkdf2_sha256$180000$yGC0oAKGC9ie$Ft7B2tojGTfHG1BVUF0QvZP/h61iFcIEjaN4JqYuhKo=','2020-05-23 06:50:21.290502',0,'ndgiang','','','',0,1,'2020-05-09 12:29:00.000000','ND Giang','2674052232724560','098 765 4321','DHCN Ha Noi',1),(35,'pbkdf2_sha256$180000$ohBcbXVytyyx$cSvj5YBshOoRTDsMP3c+zk1m0W5dWBGRo1zz5430BB0=','2020-05-14 10:15:57.328191',0,'giang2','','','sth@gmail.com2',0,1,'2020-05-14 10:15:57.085041','ND Giang','','098 765 4321000','DHCN Hà Nội, Nhổn, Nguyên Xá, Bắc Từ Liêm',1),(36,'pbkdf2_sha256$180000$k1lyGqauCa2Y$kCTuITON73cZ7I2TqOH+GierffyJ+WTQMunSEn3GHiM=','2020-05-17 19:54:51.973878',0,'giang_admin','','','',1,1,'2020-05-17 17:51:05.000000','Giang Ad','','0098 764 321','123 456',1),(37,'pbkdf2_sha256$180000$8iPFYwxTPTEk$LYbY3ccavvm6Aroo3xN/Vx39ZIsOHlgCX4DWdcHHx60=','2020-05-19 13:26:02.000000',0,'tk_nu','','','',0,1,'2020-05-19 13:26:02.000000','tài khoản nữ','','123444','ha noi',1),(38,'pbkdf2_sha256$180000$Xug01gic19pt$JaDuTTdHg7DLy2kxQlQp9QORIZW11bcksscLza/+tsY=','2020-05-19 19:10:32.000000',0,'giangadmin','','','',1,1,'2020-05-19 19:10:32.000000','ND Giang','','3123123123123','13123123',1),(39,'pbkdf2_sha256$180000$dDhQlcVVzxQS$rohaeWPdcm763pR0otWlAPvmqKn83KEBLfhLsJdvSdM=','2020-05-22 13:00:38.068830',0,'nhanvien1','','','',1,1,'2020-05-20 09:27:48.000000','Nhan vien 1','','098 765 4321','Ha Noi 1',1),(40,'pbkdf2_sha256$180000$uCRWoAbPJPEC$yuRCMh325yjyKUeqVBvDWeA9hipC0WBslFCUVqHLPvA=','2020-05-20 16:18:54.061314',0,'random1','','','',0,1,'2020-05-20 16:18:53.879251','random1','','098 765 4321','Ha Noi',1),(41,'pbkdf2_sha256$180000$BoZI6vV4e4bG$jdn3HzY0mNSntNNw47hPCOipeIcpTjJ5KoJrT+nV2G4=','2020-05-22 17:00:09.434083',0,'quanly1','','','sth@gmail.com',1,1,'2020-05-21 16:01:58.000000','quan ly 1','','098 765 4321','Ha Nam',1);
/*!40000 ALTER TABLE `account_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_user_groups`
--

DROP TABLE IF EXISTS `account_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `account_user_groups_user_id_group_id_4d09af3e_uniq` (`user_id`,`group_id`),
  KEY `account_user_groups_group_id_6c71f749_fk_auth_group_id` (`group_id`),
  CONSTRAINT `account_user_groups_group_id_6c71f749_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `account_user_groups_user_id_14345e7b_fk_account_user_id` FOREIGN KEY (`user_id`) REFERENCES `account_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_user_groups`
--

LOCK TABLES `account_user_groups` WRITE;
/*!40000 ALTER TABLE `account_user_groups` DISABLE KEYS */;
INSERT INTO `account_user_groups` VALUES (1,36,1),(3,39,2),(4,41,3);
/*!40000 ALTER TABLE `account_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_user_user_permissions`
--

DROP TABLE IF EXISTS `account_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `account_user_user_permis_user_id_permission_id_48bdd28b_uniq` (`user_id`,`permission_id`),
  KEY `account_user_user_pe_permission_id_66c44191_fk_auth_perm` (`permission_id`),
  CONSTRAINT `account_user_user_pe_permission_id_66c44191_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `account_user_user_pe_user_id_cc42d270_fk_account_u` FOREIGN KEY (`user_id`) REFERENCES `account_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_user_user_permissions`
--

LOCK TABLES `account_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `account_user_user_permissions` DISABLE KEYS */;
INSERT INTO `account_user_user_permissions` VALUES (1,38,21);
/*!40000 ALTER TABLE `account_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
INSERT INTO `auth_group` VALUES (1,'admin_group'),(2,'Nhân viên'),(3,'Quản lý');
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=184 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
INSERT INTO `auth_group_permissions` VALUES (70,1,1),(71,1,2),(72,1,3),(73,1,4),(74,1,5),(75,1,6),(76,1,7),(77,1,8),(78,1,9),(79,1,10),(80,1,11),(81,1,12),(82,1,13),(83,1,14),(84,1,15),(85,1,16),(86,1,17),(87,1,18),(88,1,19),(89,1,20),(1,1,21),(2,1,22),(3,1,23),(4,1,24),(5,1,25),(6,1,26),(7,1,27),(8,1,28),(9,1,29),(10,1,30),(11,1,31),(12,1,32),(35,1,33),(36,1,34),(37,1,35),(38,1,36),(90,1,37),(91,1,38),(92,1,39),(93,1,40),(39,1,41),(40,1,42),(41,1,43),(42,1,44),(94,1,45),(95,1,46),(96,1,47),(97,1,48),(13,1,49),(14,1,50),(15,1,51),(16,1,52),(98,1,53),(99,1,54),(100,1,55),(101,1,56),(102,1,57),(103,1,58),(104,1,59),(105,1,60),(106,1,61),(107,1,62),(108,1,63),(109,1,64),(110,1,65),(111,1,66),(112,1,67),(113,1,68),(114,1,69),(115,1,70),(116,1,71),(117,1,72),(118,1,73),(119,1,74),(17,1,75),(18,1,76),(19,1,77),(20,1,78),(21,1,79),(22,1,80),(120,1,81),(121,1,82),(122,1,83),(123,1,84),(124,1,85),(125,1,86),(126,1,87),(127,1,88),(23,1,89),(24,1,90),(25,1,91),(26,1,92),(128,1,93),(129,1,94),(130,1,95),(131,1,96),(132,1,97),(29,1,98),(133,1,99),(30,1,100),(32,1,101),(33,1,102),(34,1,103),(31,1,104),(134,1,105),(135,1,106),(136,1,107),(137,1,108),(46,2,25),(47,2,26),(48,2,27),(49,2,28),(50,2,29),(51,2,30),(52,2,31),(53,2,32),(54,2,33),(55,2,34),(56,2,35),(57,2,36),(58,2,41),(59,2,42),(60,2,43),(61,2,44),(62,2,49),(63,2,50),(64,2,51),(65,2,52),(66,2,61),(67,2,62),(68,2,63),(69,2,64),(45,2,98),(44,2,100),(138,2,104),(139,3,9),(140,3,10),(141,3,11),(142,3,12),(143,3,21),(144,3,22),(145,3,23),(146,3,24),(147,3,25),(148,3,26),(149,3,27),(150,3,28),(151,3,29),(152,3,30),(153,3,31),(154,3,32),(155,3,33),(156,3,34),(157,3,35),(158,3,36),(159,3,41),(160,3,42),(161,3,43),(162,3,44),(163,3,49),(164,3,50),(165,3,51),(166,3,52),(167,3,61),(168,3,62),(169,3,63),(170,3,64),(171,3,73),(172,3,74),(173,3,75),(174,3,76),(175,3,77),(176,3,78),(177,3,79),(178,3,80),(179,3,97),(180,3,98),(181,3,99),(182,3,100),(183,3,104);
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add content type',4,'add_contenttype'),(14,'Can change content type',4,'change_contenttype'),(15,'Can delete content type',4,'delete_contenttype'),(16,'Can view content type',4,'view_contenttype'),(17,'Can add session',5,'add_session'),(18,'Can change session',5,'change_session'),(19,'Can delete session',5,'delete_session'),(20,'Can view session',5,'view_session'),(21,'Can add user',6,'add_user'),(22,'Can change user',6,'change_user'),(23,'Can delete user',6,'delete_user'),(24,'Can view user',6,'view_user'),(25,'Can add brand',7,'add_brand'),(26,'Can change brand',7,'change_brand'),(27,'Can delete brand',7,'delete_brand'),(28,'Can view brand',7,'view_brand'),(29,'Can add category',8,'add_category'),(30,'Can change category',8,'change_category'),(31,'Can delete category',8,'delete_category'),(32,'Can view category',8,'view_category'),(33,'Can add color',9,'add_color'),(34,'Can change color',9,'change_color'),(35,'Can delete color',9,'delete_color'),(36,'Can view color',9,'view_color'),(37,'Can add coupon',10,'add_coupon'),(38,'Can change coupon',10,'change_coupon'),(39,'Can delete coupon',10,'delete_coupon'),(40,'Can view coupon',10,'view_coupon'),(41,'Can add detail shoe',11,'add_detailshoe'),(42,'Can change detail shoe',11,'change_detailshoe'),(43,'Can delete detail shoe',11,'delete_detailshoe'),(44,'Can view detail shoe',11,'view_detailshoe'),(45,'Can add order package status',12,'add_orderpackagestatus'),(46,'Can change order package status',12,'change_orderpackagestatus'),(47,'Can delete order package status',12,'delete_orderpackagestatus'),(48,'Can view order package status',12,'view_orderpackagestatus'),(49,'Can add shoe',13,'add_shoe'),(50,'Can change shoe',13,'change_shoe'),(51,'Can delete shoe',13,'delete_shoe'),(52,'Can view shoe',13,'view_shoe'),(53,'Can add order package',14,'add_orderpackage'),(54,'Can change order package',14,'change_orderpackage'),(55,'Can delete order package',14,'delete_orderpackage'),(56,'Can view order package',14,'view_orderpackage'),(57,'Can add order item',15,'add_orderitem'),(58,'Can change order item',15,'change_orderitem'),(59,'Can delete order item',15,'delete_orderitem'),(60,'Can view order item',15,'view_orderitem'),(61,'Can add image',16,'add_image'),(62,'Can change image',16,'change_image'),(63,'Can delete image',16,'delete_image'),(64,'Can view image',16,'view_image'),(65,'Can add favourite',17,'add_favourite'),(66,'Can change favourite',17,'change_favourite'),(67,'Can delete favourite',17,'delete_favourite'),(68,'Can view favourite',17,'view_favourite'),(69,'Can add cart',18,'add_cart'),(70,'Can change cart',18,'change_cart'),(71,'Can delete cart',18,'delete_cart'),(72,'Can view cart',18,'view_cart'),(73,'Can add feedback',19,'add_feedback'),(74,'Can change feedback',19,'change_feedback'),(75,'Can delete feedback',19,'delete_feedback'),(76,'Can view feedback',19,'view_feedback'),(77,'Can add coupon',20,'add_coupon'),(78,'Can change coupon',20,'change_coupon'),(79,'Can delete coupon',20,'delete_coupon'),(80,'Can view coupon',20,'view_coupon'),(81,'Can add order package status',21,'add_orderpackagestatus'),(82,'Can change order package status',21,'change_orderpackagestatus'),(83,'Can delete order package status',21,'delete_orderpackagestatus'),(84,'Can view order package status',21,'view_orderpackagestatus'),(85,'Can add cart',22,'add_cart'),(86,'Can change cart',22,'change_cart'),(87,'Can delete cart',22,'delete_cart'),(88,'Can view cart',22,'view_cart'),(89,'Can add order item',23,'add_orderitem'),(90,'Can change order item',23,'change_orderitem'),(91,'Can delete order item',23,'delete_orderitem'),(92,'Can view order item',23,'view_orderitem'),(93,'Can add order package',24,'add_orderpackage'),(94,'Can change order package',24,'change_orderpackage'),(95,'Can delete order package',24,'delete_orderpackage'),(96,'Can view order package',24,'view_orderpackage'),(97,'Can add order package',25,'add_orderpackage'),(98,'Can change order package',25,'change_orderpackage'),(99,'Can delete order package',25,'delete_orderpackage'),(100,'Can view order package',25,'view_orderpackage'),(101,'Can add order item',26,'add_orderitem'),(102,'Can change order item',26,'change_orderitem'),(103,'Can delete order item',26,'delete_orderitem'),(104,'Can view order item',26,'view_orderitem'),(105,'Can add favourite',27,'add_favourite'),(106,'Can change favourite',27,'change_favourite'),(107,'Can delete favourite',27,'delete_favourite'),(108,'Can view favourite',27,'view_favourite');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_cart`
--

DROP TABLE IF EXISTS `cart_cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cart_cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `quantityOnCart` int(11) NOT NULL,
  `detailShoe_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cart_cart_detailShoe_id_63fcfc23_fk_mainapp_detailshoe_id` (`detailShoe_id`),
  KEY `cart_cart_user_id_9b4220b9_fk_account_user_id` (`user_id`),
  CONSTRAINT `cart_cart_detailShoe_id_63fcfc23_fk_mainapp_detailshoe_id` FOREIGN KEY (`detailShoe_id`) REFERENCES `mainapp_detailshoe` (`id`),
  CONSTRAINT `cart_cart_user_id_9b4220b9_fk_account_user_id` FOREIGN KEY (`user_id`) REFERENCES `account_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_cart`
--

LOCK TABLES `cart_cart` WRITE;
/*!40000 ALTER TABLE `cart_cart` DISABLE KEYS */;
INSERT INTO `cart_cart` VALUES (3,1,97,1),(7,2,109,33),(13,1,97,35);
/*!40000 ALTER TABLE `cart_cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact_us_feedback`
--

DROP TABLE IF EXISTS `contact_us_feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contact_us_feedback` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `email` varchar(64) NOT NULL,
  `subject` varchar(64) NOT NULL,
  `content` longtext NOT NULL,
  `dateSend` date NOT NULL,
  `read` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_us_feedback`
--

LOCK TABLES `contact_us_feedback` WRITE;
/*!40000 ALTER TABLE `contact_us_feedback` DISABLE KEYS */;
INSERT INTO `contact_us_feedback` VALUES (1,'Harry Potter','sth@gmail.com','the subject','content j do','2020-04-23',1);
/*!40000 ALTER TABLE `contact_us_feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coupon_coupon`
--

DROP TABLE IF EXISTS `coupon_coupon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coupon_coupon` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `couponTitle` varchar(64) NOT NULL,
  `couponCode` varchar(32) NOT NULL,
  `expirationDate` date NOT NULL,
  `discountRate` int(11) NOT NULL,
  `discountAmount` int(11) NOT NULL,
  `couponDescription` longtext NOT NULL,
  `couponAmount` int(11) NOT NULL,
  `couponImage` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `couponCode` (`couponCode`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coupon_coupon`
--

LOCK TABLES `coupon_coupon` WRITE;
/*!40000 ALTER TABLE `coupon_coupon` DISABLE KEYS */;
INSERT INTO `coupon_coupon` VALUES (1,'coupon mặc định','no_coupon','2018-07-31',0,0,'coupon mặc định nhằm tránh sai dữ liệu',99983,'coupon_images/coupon_15.png'),(2,'Giảm 15% giá trị đơn hàng khi đặt hàng online','ONLINE_ORDER','2021-03-26',15,0,'Giam',100,'coupon_images/coupon_15_aQpeqU1.png'),(3,'Giảm 20% giá trị đơn hàng','ABCD_CODE2','2020-06-11',20,0,'',42,'coupon_images/coupon_15_6uruprs.png');
/*!40000 ALTER TABLE `coupon_coupon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_account_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_account_user_id` FOREIGN KEY (`user_id`) REFERENCES `account_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=211 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2020-04-24 16:21:00.516914','1','Coupon object (1)',1,'[{\"added\": {}}]',20,1),(2,'2020-04-24 16:55:34.904424','1','id(1) _ title(Giảm 15% khi thanh toán online) _ code(ONLINEPAYMENT) _ date(2022-12-31) _ rate(15 %) _ amount(0 đ)',2,'[{\"changed\": {\"fields\": [\"CouponCode\"]}}]',20,1),(3,'2020-04-28 15:53:17.262680','1','Cart( id:1 _ username:giang _ shoe:Giày lười Louis Vuitton họa tiết da nhăn GLLV25 _ quantity:2 )',1,'[{\"added\": {}}]',22,1),(4,'2020-04-28 15:57:43.417283','2','Cart( id:2 _ username:giang _ shoe:Giày thể thao B771 _ quantity:3 )',1,'[{\"added\": {}}]',22,1),(5,'2020-04-28 16:43:50.292773','3','Cart( id:3 _ username:giang _ shoe:Giày lười Louis Vuitton họa tiết da nhăn GLLV25 _ quantity:1 )',1,'[{\"added\": {}}]',22,1),(6,'2020-04-29 12:18:23.691589','7','DetailShoe( id:7 _ shoeName:Giày lười Louis Vuitton họa tiết da nhăn GLLV25 _ color:Đen _ size:43 _ quantityAvailable:0 _ oldPrice:520000 _ newPrice:440000 )',2,'[{\"changed\": {\"fields\": [\"QuantityAvailable\"]}}]',11,1),(7,'2020-04-29 12:18:25.289011','1','Cart( id:1 _ username:giang _ shoe:Giày lười Louis Vuitton họa tiết da nhăn GLLV25 _ quantity:2 )',2,'[]',22,1),(8,'2020-04-30 08:00:38.796332','4','Cart( id:4 _ username:giang _ shoe:Giày thể thao B967 _ quantity:2 )',3,'',22,1),(9,'2020-05-01 16:29:11.686585','1','Shoe( id:1  _ name:Giày lười Louis Vuitton họa tiết bàn cờ GLLV12_ category:Giày lười                      _ quantitySold:550  _ view:1500_ favourite:1000 )',2,'[{\"changed\": {\"fields\": [\"ShoeThumbnail\"]}}]',13,1),(10,'2020-05-01 16:29:48.510564','2','Shoe( id:2  _ name:Giày lười Louis Vuitton họa tiết da nhăn GLLV25_ category:Giày lười                      _ quantitySold:370  _ view:1100_ favourite:2200 )',2,'[{\"changed\": {\"fields\": [\"ShoeThumbnail\"]}}]',13,1),(11,'2020-05-01 16:29:57.405309','3','Shoe( id:3  _ name:Giày lười Louis Vuitton họa tiết ô rạn GLLV09_ category:Giày lười                      _ quantitySold:480  _ view:1900_ favourite:1600 )',2,'[{\"changed\": {\"fields\": [\"ShoeThumbnail\"]}}]',13,1),(12,'2020-05-01 16:30:05.491807','4','Shoe( id:4  _ name:Giày lười Louis Vuitton like au họa tiết rạn GLLV22_ category:Giày lười                      _ quantitySold:290  _ view:2000_ favourite:1900 )',2,'[{\"changed\": {\"fields\": [\"ShoeThumbnail\"]}}]',13,1),(13,'2020-05-01 16:30:13.275802','5','Shoe( id:5  _ name:Giày lười Versace họa tiết vân lá GLV08_ category:Giày lười                      _ quantitySold:350  _ view:3000_ favourite:2000 )',2,'[{\"changed\": {\"fields\": [\"ShoeThumbnail\"]}}]',13,1),(14,'2020-05-01 16:31:48.357650','1','Shoe( id:1  _ name:Giày lười Louis Vuitton họa tiết bàn cờ GLLV12_ category:Giày lười                      _ quantitySold:550  _ view:1500_ favourite:1000 )',2,'[{\"changed\": {\"fields\": [\"ShoeThumbnail\"]}}]',13,1),(15,'2020-05-01 16:31:58.733219','1','Shoe( id:1  _ name:Giày lười Louis Vuitton họa tiết bàn cờ GLLV12_ category:Giày lười                      _ quantitySold:550  _ view:1500_ favourite:1000 )',2,'[{\"changed\": {\"fields\": [\"ShoeThumbnail\"]}}]',13,1),(16,'2020-05-01 16:32:05.735451','2','Shoe( id:2  _ name:Giày lười Louis Vuitton họa tiết da nhăn GLLV25_ category:Giày lười                      _ quantitySold:370  _ view:1100_ favourite:2200 )',2,'[{\"changed\": {\"fields\": [\"ShoeThumbnail\"]}}]',13,1),(17,'2020-05-01 16:32:36.512977','2','Shoe( id:2  _ name:Giày lười Louis Vuitton họa tiết da nhăn GLLV25_ category:Giày lười                      _ quantitySold:370  _ view:1100_ favourite:2200 )',2,'[{\"changed\": {\"fields\": [\"ShoeThumbnail\"]}}]',13,1),(18,'2020-05-01 16:32:48.870759','2','Shoe( id:2  _ name:Giày lười Louis Vuitton họa tiết da nhăn GLLV25_ category:Giày lười                      _ quantitySold:370  _ view:1100_ favourite:2200 )',2,'[]',13,1),(19,'2020-05-01 16:32:56.256024','3','Shoe( id:3  _ name:Giày lười Louis Vuitton họa tiết ô rạn GLLV09_ category:Giày lười                      _ quantitySold:480  _ view:1900_ favourite:1600 )',2,'[{\"changed\": {\"fields\": [\"ShoeThumbnail\"]}}]',13,1),(20,'2020-05-01 16:33:06.246605','3','Shoe( id:3  _ name:Giày lười Louis Vuitton họa tiết ô rạn GLLV09_ category:Giày lười                      _ quantitySold:480  _ view:1900_ favourite:1600 )',2,'[{\"changed\": {\"fields\": [\"ShoeThumbnail\"]}}]',13,1),(21,'2020-05-01 16:33:12.487934','4','Shoe( id:4  _ name:Giày lười Louis Vuitton like au họa tiết rạn GLLV22_ category:Giày lười                      _ quantitySold:290  _ view:2000_ favourite:1900 )',2,'[{\"changed\": {\"fields\": [\"ShoeThumbnail\"]}}]',13,1),(22,'2020-05-01 16:33:24.879814','4','Shoe( id:4  _ name:Giày lười Louis Vuitton like au họa tiết rạn GLLV22_ category:Giày lười                      _ quantitySold:290  _ view:2000_ favourite:1900 )',2,'[{\"changed\": {\"fields\": [\"ShoeThumbnail\"]}}]',13,1),(23,'2020-05-01 16:33:34.670975','5','Shoe( id:5  _ name:Giày lười Versace họa tiết vân lá GLV08_ category:Giày lười                      _ quantitySold:350  _ view:3000_ favourite:2000 )',2,'[{\"changed\": {\"fields\": [\"ShoeThumbnail\"]}}]',13,1),(24,'2020-05-01 16:33:40.734415','5','Shoe( id:5  _ name:Giày lười Versace họa tiết vân lá GLV08_ category:Giày lười                      _ quantitySold:350  _ view:3000_ favourite:2000 )',2,'[{\"changed\": {\"fields\": [\"ShoeThumbnail\"]}}]',13,1),(25,'2020-05-01 16:34:22.773348','6','Shoe( id:6  _ name:Giày thể thao B771            _ category:Giày thể thao                  _ quantitySold:270  _ view:1400_ favourite:1970 )',2,'[{\"changed\": {\"fields\": [\"ShoeThumbnail\"]}}]',13,1),(26,'2020-05-01 16:34:35.322186','7','Shoe( id:7  _ name:Giày thể thao B798            _ category:Giày thể thao                  _ quantitySold:790  _ view:2100_ favourite:2300 )',2,'[{\"changed\": {\"fields\": [\"ShoeThumbnail\"]}}]',13,1),(27,'2020-05-01 16:34:43.774368','8','Shoe( id:8  _ name:Giày thể thao B967            _ category:Giày thể thao                  _ quantitySold:400  _ view:1600_ favourite:2200 )',2,'[{\"changed\": {\"fields\": [\"ShoeThumbnail\"]}}]',13,1),(28,'2020-05-01 16:35:04.633696','9','Shoe( id:9  _ name:Giày bata B536                _ category:Giày bata                      _ quantitySold:420  _ view:1800_ favourite:2700 )',2,'[{\"changed\": {\"fields\": [\"ShoeThumbnail\"]}}]',13,1),(29,'2020-05-01 16:41:33.317093','1','Image( id:1  _ shoeName:Giày lười Louis Vuitton họa tiết bàn cờ GLLV12_ imageName:shoe_images/GLLV12_1.jpg )',2,'[{\"changed\": {\"fields\": [\"ShoeImage\"]}}]',16,1),(30,'2020-05-01 16:41:45.161156','2','Image( id:2  _ shoeName:Giày lười Louis Vuitton họa tiết bàn cờ GLLV12_ imageName:shoe_images/GLLV12_2.jpg )',2,'[{\"changed\": {\"fields\": [\"ShoeImage\"]}}]',16,1),(31,'2020-05-01 16:41:58.726231','3','Image( id:3  _ shoeName:Giày lười Louis Vuitton họa tiết bàn cờ GLLV12_ imageName:shoe_images/GLLV12_3.jpg )',2,'[{\"changed\": {\"fields\": [\"ShoeImage\"]}}]',16,1),(32,'2020-05-01 16:42:14.998283','4','Image( id:4  _ shoeName:Giày lười Louis Vuitton họa tiết bàn cờ GLLV12_ imageName:shoe_images/GLLV12_4.jpg )',2,'[{\"changed\": {\"fields\": [\"ShoeImage\"]}}]',16,1),(33,'2020-05-01 16:42:25.864490','5','Image( id:5  _ shoeName:Giày lười Louis Vuitton họa tiết bàn cờ GLLV12_ imageName:shoe_images/GLLV12_5.jpg )',2,'[{\"changed\": {\"fields\": [\"ShoeImage\"]}}]',16,1),(34,'2020-05-01 16:42:35.596511','6','Image( id:6  _ shoeName:Giày lười Louis Vuitton họa tiết da nhăn GLLV25_ imageName:shoe_images/GLLV25_1.jpg )',2,'[{\"changed\": {\"fields\": [\"ShoeImage\"]}}]',16,1),(35,'2020-05-01 16:42:54.465083','7','Image( id:7  _ shoeName:Giày lười Louis Vuitton họa tiết da nhăn GLLV25_ imageName:shoe_images/GLLV25_2.jpg )',2,'[{\"changed\": {\"fields\": [\"ShoeImage\"]}}]',16,1),(36,'2020-05-01 16:43:12.976460','8','Image( id:8  _ shoeName:Giày lười Louis Vuitton họa tiết da nhăn GLLV25_ imageName:shoe_images/GLLV25_3.jpg )',2,'[{\"changed\": {\"fields\": [\"ShoeImage\"]}}]',16,1),(37,'2020-05-01 16:43:20.560649','9','Image( id:9  _ shoeName:Giày lười Louis Vuitton họa tiết da nhăn GLLV25_ imageName:shoe_images/GLLV25_4.jpg )',2,'[{\"changed\": {\"fields\": [\"ShoeImage\"]}}]',16,1),(38,'2020-05-01 16:43:28.412423','10','Image( id:10 _ shoeName:Giày lười Louis Vuitton họa tiết da nhăn GLLV25_ imageName:shoe_images/GLLV25_5.jpg )',2,'[{\"changed\": {\"fields\": [\"ShoeImage\"]}}]',16,1),(39,'2020-05-01 16:43:37.615618','11','Image( id:11 _ shoeName:Giày lười Louis Vuitton họa tiết ô rạn GLLV09_ imageName:shoe_images/GLLV09_1.jpg )',2,'[{\"changed\": {\"fields\": [\"ShoeImage\"]}}]',16,1),(40,'2020-05-01 16:43:47.093462','12','Image( id:12 _ shoeName:Giày lười Louis Vuitton họa tiết ô rạn GLLV09_ imageName:shoe_images/GLLV09_2.jpg )',2,'[{\"changed\": {\"fields\": [\"ShoeImage\"]}}]',16,1),(41,'2020-05-01 16:43:56.646430','13','Image( id:13 _ shoeName:Giày lười Louis Vuitton họa tiết ô rạn GLLV09_ imageName:shoe_images/GLLV09_3.jpg )',2,'[{\"changed\": {\"fields\": [\"ShoeImage\"]}}]',16,1),(42,'2020-05-01 16:44:39.980149','14','Image( id:14 _ shoeName:Giày lười Louis Vuitton họa tiết ô rạn GLLV09_ imageName:shoe_images/GLLV09_4.jpg )',2,'[{\"changed\": {\"fields\": [\"ShoeImage\"]}}]',16,1),(43,'2020-05-01 16:44:49.854175','15','Image( id:15 _ shoeName:Giày lười Louis Vuitton họa tiết ô rạn GLLV09_ imageName:shoe_images/GLLV09_5.jpg )',2,'[{\"changed\": {\"fields\": [\"ShoeImage\"]}}]',16,1),(44,'2020-05-01 16:45:01.006654','16','Image( id:16 _ shoeName:Giày lười Louis Vuitton like au họa tiết rạn GLLV22_ imageName:shoe_images/GLLV22_1.jpg )',2,'[{\"changed\": {\"fields\": [\"ShoeImage\"]}}]',16,1),(45,'2020-05-01 16:45:10.843519','17','Image( id:17 _ shoeName:Giày lười Louis Vuitton like au họa tiết rạn GLLV22_ imageName:shoe_images/GLLV22_2.jpg )',2,'[{\"changed\": {\"fields\": [\"ShoeImage\"]}}]',16,1),(46,'2020-05-01 16:45:19.695702','18','Image( id:18 _ shoeName:Giày lười Louis Vuitton like au họa tiết rạn GLLV22_ imageName:shoe_images/GLLV22_3.jpg )',2,'[{\"changed\": {\"fields\": [\"ShoeImage\"]}}]',16,1),(47,'2020-05-01 16:45:31.607049','19','Image( id:19 _ shoeName:Giày lười Louis Vuitton like au họa tiết rạn GLLV22_ imageName:shoe_images/GLLV22_3_pvPrCTv.jpg )',2,'[{\"changed\": {\"fields\": [\"ShoeImage\"]}}]',16,1),(48,'2020-05-01 16:45:47.560475','19','Image( id:19 _ shoeName:Giày lười Louis Vuitton like au họa tiết rạn GLLV22_ imageName:shoe_images/GLLV22_4.jpg )',2,'[{\"changed\": {\"fields\": [\"ShoeImage\"]}}]',16,1),(49,'2020-05-01 16:45:57.244530','20','Image( id:20 _ shoeName:Giày lười Louis Vuitton like au họa tiết rạn GLLV22_ imageName:shoe_images/GLLV22_5.jpg )',2,'[{\"changed\": {\"fields\": [\"ShoeImage\"]}}]',16,1),(50,'2020-05-01 16:46:31.463945','21','Image( id:21 _ shoeName:Giày lười Versace họa tiết vân lá GLV08_ imageName:shoe_images/GLV08_1.jpg )',2,'[{\"changed\": {\"fields\": [\"ShoeImage\"]}}]',16,1),(51,'2020-05-01 16:46:39.806108','22','Image( id:22 _ shoeName:Giày lười Versace họa tiết vân lá GLV08_ imageName:shoe_images/GLV08_2.jpg )',2,'[{\"changed\": {\"fields\": [\"ShoeImage\"]}}]',16,1),(52,'2020-05-01 16:46:47.487959','23','Image( id:23 _ shoeName:Giày lười Versace họa tiết vân lá GLV08_ imageName:shoe_images/GLV08_3.jpg )',2,'[{\"changed\": {\"fields\": [\"ShoeImage\"]}}]',16,1),(53,'2020-05-01 16:46:54.840632','24','Image( id:24 _ shoeName:Giày lười Versace họa tiết vân lá GLV08_ imageName:shoe_images/GLV08_4.jpg )',2,'[{\"changed\": {\"fields\": [\"ShoeImage\"]}}]',16,1),(54,'2020-05-01 16:47:03.606891','25','Image( id:25 _ shoeName:Giày lười Versace họa tiết vân lá GLV08_ imageName:shoe_images/GLV08_5.jpg )',2,'[{\"changed\": {\"fields\": [\"ShoeImage\"]}}]',16,1),(55,'2020-05-01 16:47:30.587661','26','Image( id:26 _ shoeName:Giày thể thao B771            _ imageName:shoe_images/B771_1.jpg )',2,'[{\"changed\": {\"fields\": [\"ShoeImage\"]}}]',16,1),(56,'2020-05-01 16:47:37.892257','27','Image( id:27 _ shoeName:Giày thể thao B771            _ imageName:shoe_images/B771_2.png )',2,'[{\"changed\": {\"fields\": [\"ShoeImage\"]}}]',16,1),(57,'2020-05-01 16:47:46.205610','28','Image( id:28 _ shoeName:Giày thể thao B771            _ imageName:shoe_images/B771_3.jpg )',2,'[{\"changed\": {\"fields\": [\"ShoeImage\"]}}]',16,1),(58,'2020-05-01 16:47:52.043971','29','Image( id:29 _ shoeName:Giày thể thao B771            _ imageName:shoe_images/B771_4.jpg )',2,'[{\"changed\": {\"fields\": [\"ShoeImage\"]}}]',16,1),(59,'2020-05-01 16:48:00.359961','30','Image( id:30 _ shoeName:Giày thể thao B771            _ imageName:shoe_images/B771_5.jpg )',2,'[{\"changed\": {\"fields\": [\"ShoeImage\"]}}]',16,1),(60,'2020-05-01 16:48:09.405899','31','Image( id:31 _ shoeName:Giày thể thao B798            _ imageName:shoe_images/B798_1.jpg )',2,'[{\"changed\": {\"fields\": [\"ShoeImage\"]}}]',16,1),(61,'2020-05-01 16:48:19.014078','32','Image( id:32 _ shoeName:Giày thể thao B798            _ imageName:shoe_images/B798_2.jpg )',2,'[{\"changed\": {\"fields\": [\"ShoeImage\"]}}]',16,1),(62,'2020-05-01 16:48:27.397153','33','Image( id:33 _ shoeName:Giày thể thao B798            _ imageName:shoe_images/B798_3.jpg )',2,'[{\"changed\": {\"fields\": [\"ShoeImage\"]}}]',16,1),(63,'2020-05-01 16:48:36.176872','34','Image( id:34 _ shoeName:Giày thể thao B798            _ imageName:shoe_images/B798_4.jpg )',2,'[{\"changed\": {\"fields\": [\"ShoeImage\"]}}]',16,1),(64,'2020-05-01 16:48:45.388267','35','Image( id:35 _ shoeName:Giày thể thao B798            _ imageName:shoe_images/B798_5.jpg )',2,'[{\"changed\": {\"fields\": [\"ShoeImage\"]}}]',16,1),(65,'2020-05-01 16:48:56.767803','36','Image( id:36 _ shoeName:Giày thể thao B967            _ imageName:shoe_images/B967_1.jpg )',2,'[{\"changed\": {\"fields\": [\"ShoeImage\"]}}]',16,1),(66,'2020-05-01 16:49:04.255315','37','Image( id:37 _ shoeName:Giày thể thao B967            _ imageName:shoe_images/B967_2.jpg )',2,'[{\"changed\": {\"fields\": [\"ShoeImage\"]}}]',16,1),(67,'2020-05-01 16:49:11.299667','38','Image( id:38 _ shoeName:Giày thể thao B967            _ imageName:shoe_images/B967_3.jpg )',2,'[{\"changed\": {\"fields\": [\"ShoeImage\"]}}]',16,1),(68,'2020-05-01 16:49:17.636196','39','Image( id:39 _ shoeName:Giày thể thao B967            _ imageName:shoe_images/B967_4.jpg )',2,'[{\"changed\": {\"fields\": [\"ShoeImage\"]}}]',16,1),(69,'2020-05-01 16:49:24.487570','40','Image( id:40 _ shoeName:Giày thể thao B967            _ imageName:shoe_images/B967_5.jpg )',2,'[{\"changed\": {\"fields\": [\"ShoeImage\"]}}]',16,1),(70,'2020-05-01 16:49:31.913818','41','Image( id:41 _ shoeName:Giày bata B536                _ imageName:shoe_images/B536_1.jpg )',2,'[{\"changed\": {\"fields\": [\"ShoeImage\"]}}]',16,1),(71,'2020-05-01 16:49:37.420661','42','Image( id:42 _ shoeName:Giày bata B536                _ imageName:shoe_images/B536_2.jpg )',2,'[{\"changed\": {\"fields\": [\"ShoeImage\"]}}]',16,1),(72,'2020-05-01 16:49:43.753067','43','Image( id:43 _ shoeName:Giày bata B536                _ imageName:shoe_images/B536_3.jpg )',2,'[{\"changed\": {\"fields\": [\"ShoeImage\"]}}]',16,1),(73,'2020-05-01 16:49:49.752905','44','Image( id:44 _ shoeName:Giày bata B536                _ imageName:shoe_images/B536_4.jpg )',2,'[{\"changed\": {\"fields\": [\"ShoeImage\"]}}]',16,1),(74,'2020-05-01 16:49:54.604871','45','Image( id:45 _ shoeName:Giày bata B536                _ imageName:shoe_images/B536_5.jpg )',2,'[{\"changed\": {\"fields\": [\"ShoeImage\"]}}]',16,1),(75,'2020-05-03 09:39:46.543762','1','id(1) _ title(Giảm 15% khi thanh toán online) _ code(ONLINEPAYMENT) _ date(2022-12-31) _ rate(15 %) _ amount(0 đ)',2,'[{\"changed\": {\"fields\": [\"CouponImage\"]}}]',20,1),(76,'2020-05-03 09:40:12.831230','1','id(1) _ title(Giảm giá khi thanh toán online) _ code(ONLINEPAYMENT) _ date(2022-12-31) _ rate(15 %) _ amount(0 đ)',2,'[{\"changed\": {\"fields\": [\"CouponTitle\"]}}]',20,1),(77,'2020-05-03 10:04:41.609653','2','id(2) _ title(Coupon 1) _ code(ABCD_CODE) _ date(2020-05-28) _ rate(15 %) _ amount(0 đ)',1,'[{\"added\": {}}]',20,1),(78,'2020-05-03 10:05:44.416039','3','id(3) _ title(Coupon 2) _ code(ABCD_CODE2) _ date(2020-05-03) _ rate(15 %) _ amount(0 đ)',1,'[{\"added\": {}}]',20,1),(79,'2020-05-03 10:05:55.028153','3','id(3) _ title(Coupon 2) _ code(ABCD_CODE2) _ date(2020-05-28) _ rate(15 %) _ amount(0 đ)',2,'[{\"changed\": {\"fields\": [\"ExpirationDate\"]}}]',20,1),(80,'2020-05-03 15:09:28.734825','9','User( id:9_ MessengerId:_ username:giang_ displayName:giang nd_ phone:098 765 4321 )',2,'[{\"changed\": {\"fields\": [\"Email address\"]}}]',6,1),(81,'2020-05-03 18:27:27.490449','1','id(1) _ title(coupon mặc định) _ code(no_value) _ date(2018-07-31) _ rate(0 %) _ amount(0 đ)',2,'[{\"changed\": {\"fields\": [\"CouponTitle\", \"CouponCode\", \"ExpirationDate\", \"DiscountRate\", \"CouponAmount\", \"CouponDescription\"]}}]',20,1),(82,'2020-05-04 13:51:08.577977','2','[Đang giao] OrderPackage( id:2 _ username:giang _ receiver:giang nd _ receiverAddress:Ha noi _ totalPayment:440000 )',2,'[{\"changed\": {\"fields\": [\"Status\"]}}]',25,1),(83,'2020-05-04 18:13:31.513037','2','[Từ chối (admin)] OrderPackage( id:2 _ username:giang _ receiver:giang nd _ receiverAddress:Ha noi _ totalPayment:440000 )',2,'[{\"changed\": {\"fields\": [\"Note\", \"Status\"]}}]',25,1),(84,'2020-05-05 15:35:20.966910','4','DetailShoe( id:4 _ shoeName:Giày lười Louis Vuitton họa tiết bàn cờ GLLV12 _ color:Đen _ size:44 _ quantityAvailable:45 _ oldPrice:560000 _ newPrice:480000 )',2,'[{\"changed\": {\"fields\": [\"QuantityAvailable\"]}}]',11,1),(85,'2020-05-05 15:36:20.726922','89','DetailShoe( id:89 _ shoeName:Giày thể thao B798 _ color:Đen _ size:41 _ quantityAvailable:20 _ oldPrice:620000 _ newPrice:520000 )',2,'[{\"changed\": {\"fields\": [\"NewPrice\"]}}]',11,1),(86,'2020-05-05 16:07:55.192329','1','Shoe( id:1  _ name:Giày lười Louis Vuitton họa tiết bàn cờ GLLV12_ category:Giày lười                      _ quantitySold:550  _ view:1500_ favourite:1000 )',2,'[{\"changed\": {\"fields\": [\"ShoeModel\"]}}]',13,1),(87,'2020-05-05 16:08:09.258294','2','Shoe( id:2  _ name:Giày lười Louis Vuitton họa tiết da nhăn GLLV25_ category:Giày lười                      _ quantitySold:370  _ view:1110_ favourite:2200 )',2,'[{\"changed\": {\"fields\": [\"ShoeModel\"]}}]',13,1),(88,'2020-05-05 16:08:18.208807','3','Shoe( id:3  _ name:Giày lười Louis Vuitton họa tiết ô rạn GLLV09_ category:Giày lười                      _ quantitySold:480  _ view:1900_ favourite:1600 )',2,'[{\"changed\": {\"fields\": [\"ShoeModel\"]}}]',13,1),(89,'2020-05-05 16:08:26.078065','4','Shoe( id:4  _ name:Giày lười Louis Vuitton like au họa tiết rạn GLLV22_ category:Giày lười                      _ quantitySold:290  _ view:2000_ favourite:1900 )',2,'[{\"changed\": {\"fields\": [\"ShoeModel\"]}}]',13,1),(90,'2020-05-05 16:08:42.230041','5','Shoe( id:5  _ name:Giày lười Versace họa tiết vân lá GLV08_ category:Giày lười                      _ quantitySold:350  _ view:3000_ favourite:2000 )',2,'[{\"changed\": {\"fields\": [\"ShoeModel\"]}}]',13,1),(91,'2020-05-05 16:08:50.004215','6','Shoe( id:6  _ name:Giày thể thao B771            _ category:Giày thể thao                  _ quantitySold:270  _ view:1400_ favourite:1970 )',2,'[{\"changed\": {\"fields\": [\"ShoeModel\"]}}]',13,1),(92,'2020-05-05 16:08:56.409149','7','Shoe( id:7  _ name:Giày thể thao B798            _ category:Giày thể thao                  _ quantitySold:790  _ view:2100_ favourite:2300 )',2,'[{\"changed\": {\"fields\": [\"ShoeModel\"]}}]',13,1),(93,'2020-05-05 16:09:07.553705','8','Shoe( id:8  _ name:Giày thể thao B967            _ category:Giày thể thao                  _ quantitySold:400  _ view:1600_ favourite:2200 )',2,'[{\"changed\": {\"fields\": [\"ShoeModel\"]}}]',13,1),(94,'2020-05-05 16:09:14.026644','9','Shoe( id:9  _ name:Giày bata B536                _ category:Giày bata                      _ quantitySold:420  _ view:1800_ favourite:2700 )',2,'[{\"changed\": {\"fields\": [\"ShoeModel\"]}}]',13,1),(95,'2020-05-08 14:00:22.579525','14','User( id:14_ MessengerId:1234567_ username:1234567_ displayName:giang 123_ phone: )',3,'',6,1),(96,'2020-05-08 14:01:16.335365','15','User( id:15_ MessengerId:1234567_ username:1234567_ displayName:giang 123_ phone: )',3,'',6,1),(97,'2020-05-08 14:05:57.943834','13','User( id:13_ MessengerId:33_ username:33_ displayName:giang_ phone: )',3,'',6,1),(98,'2020-05-08 14:05:57.948705','12','User( id:12_ MessengerId:mg1231_ username:user2123_ displayName:_ phone: )',3,'',6,1),(99,'2020-05-08 14:05:57.952131','11','User( id:11_ MessengerId:mg1231_ username:user123_ displayName:_ phone: )',3,'',6,1),(100,'2020-05-08 14:30:01.889411','16','User( id:16_ MessengerId:1234567_ username:1234567_ displayName:giang 123_ phone: )',3,'',6,1),(101,'2020-05-08 15:13:57.220784','30','User( id:30_ MessengerId:98877_ username:98877_ displayName:_ phone: )',3,'',6,1),(102,'2020-05-08 15:13:57.226485','18','User( id:18_ MessengerId:1234567_ username:_ displayName:giang 123_ phone: )',3,'',6,1),(103,'2020-05-08 15:13:57.230097','17','User( id:17_ MessengerId:1234567_ username:1234567_ displayName:giang 123_ phone: )',3,'',6,1),(104,'2020-05-08 17:41:50.863911','32','User( id:32_ MessengerId:_ username:gianguser7_ displayName:dfsdfsdfss_ phone:3123123123123 )',3,'',6,1),(105,'2020-05-09 08:31:46.624736','5','[Chờ xác nhận] OrderPackage( id:5 _ username:1234567 _ receiver:giang 123 _ receiverAddress:1231231 _ totalPayment:260000 )',3,'',25,1),(106,'2020-05-09 08:31:46.627720','4','[Chờ xác nhận] OrderPackage( id:4 _ username:1234567 _ receiver:giang 123 _ receiverAddress:1231231 _ totalPayment:260000 )',3,'',25,1),(107,'2020-05-09 08:31:46.631168','3','[Chờ xác nhận] OrderPackage( id:3 _ username:1234567 _ receiver:giang 123 _ receiverAddress:123123 _ totalPayment:260000 )',3,'',25,1),(108,'2020-05-09 12:17:42.854819','6','Cart( id:6 _ username:1234567 _ shoe:Giày bata B536 _ quantity:3 )',3,'',22,1),(109,'2020-05-09 15:45:13.541311','33','User( id:33_ MessengerId:1234567_ username:1234567_ displayName:giang 123_ phone:098 765 4321 )',2,'[{\"changed\": {\"fields\": [\"Phone\", \"DefaultAddress\"]}}]',6,1),(110,'2020-05-09 17:26:13.500595','9','User( id:9_ MessengerId:2674052232724560_ username:giang_ displayName:Nguyễn Đình Giang_ phone:098 765 4321 )',2,'[{\"changed\": {\"fields\": [\"DisplayName\", \"MessengerId\", \"DefaultAddress\"]}}]',6,1),(111,'2020-05-10 15:00:38.310578','3','id(3) _ title(Coupon 2) _ code(ABCD_CODE2) _ date(2020-05-05) _ rate(15 %) _ amount(0 đ)',2,'[{\"changed\": {\"fields\": [\"ExpirationDate\"]}}]',20,1),(112,'2020-05-10 15:00:46.466269','2','id(2) _ title(Coupon 1) _ code(ABCD_CODE) _ date(2020-05-06) _ rate(15 %) _ amount(0 đ)',2,'[{\"changed\": {\"fields\": [\"ExpirationDate\"]}}]',20,1),(113,'2020-05-11 09:59:47.362460','3','id(3) _ title(Coupon 2) _ code(ABCD_CODE2) _ date(2020-06-11) _ rate(15 %) _ amount(0 đ)',2,'[{\"changed\": {\"fields\": [\"ExpirationDate\"]}}]',20,1),(114,'2020-05-12 16:12:04.104876','9','[Đã hủy (user)] id:9 _ username:giang _ receiver:Nguyễn Đình Giang _ receiverAddress:DHCN Hà Nội _ totalPayment:9860000',2,'[{\"changed\": {\"fields\": [\"DateOrder\"]}}]',25,1),(115,'2020-05-12 16:12:35.515327','9','[Đã hủy (user)] id:9 _ username:giang _ receiver:Nguyễn Đình Giang _ receiverAddress:DHCN Hà Nội _ totalPayment:9860000',2,'[{\"changed\": {\"fields\": [\"DateOrder\"]}}]',25,1),(116,'2020-05-12 16:12:54.425710','9','[Đã hủy (user)] id:9 _ username:giang _ receiver:Nguyễn Đình Giang _ receiverAddress:DHCN Hà Nội _ totalPayment:9860000',2,'[{\"changed\": {\"fields\": [\"DateOrder\"]}}]',25,1),(117,'2020-05-13 18:12:18.761013','1','id(1) _ title(coupon mặc định) _ code(no_coupon) _ date(2018-07-31) _ rate(0 %) _ amount(0 đ)',2,'[{\"changed\": {\"fields\": [\"CouponCode\"]}}]',20,1),(118,'2020-05-13 18:37:08.399757','8','[Đang giao] id:8 _ username:giang _ receiver:Nguyễn Đình Giang _ receiverAddress:DHCN Hà Nội _ totalPayment:580000',2,'[{\"changed\": {\"fields\": [\"Status\"]}}]',25,1),(119,'2020-05-13 18:39:25.530741','7','[Đã giao] id:7 _ username:giang _ receiver:Nguyễn Đình Giang _ receiverAddress:DHCN Hà Nội _ totalPayment:1100000',2,'[{\"changed\": {\"fields\": [\"Status\"]}}]',25,1),(120,'2020-05-14 10:15:49.874364','10','User( id:10_ MessengerId:_ username:giang2_ displayName:giang nd2_ phone:123444 )',3,'',6,1),(121,'2020-05-14 10:40:22.310797','9','Shoe( id:9  _ name:B536                          _ category:Giày bata                      _ quantitySold:423  _ view:1811_ favourite:2700 )',2,'[{\"changed\": {\"fields\": [\"Image static\"]}}]',13,1),(122,'2020-05-14 10:41:06.519410','8','Shoe( id:8  _ name:B967                          _ category:Giày thể thao                  _ quantitySold:400  _ view:1606_ favourite:2200 )',2,'[{\"changed\": {\"fields\": [\"Image static\"]}}]',13,1),(123,'2020-05-14 10:41:32.722062','7','Shoe( id:7  _ name:B798                          _ category:Giày thể thao                  _ quantitySold:792  _ view:2182_ favourite:2300 )',2,'[{\"changed\": {\"fields\": [\"Image static\"]}}]',13,1),(124,'2020-05-14 10:42:00.427465','6','Shoe( id:6  _ name:B771                          _ category:Giày thể thao                  _ quantitySold:275  _ view:1410_ favourite:1970 )',2,'[{\"changed\": {\"fields\": [\"Image static\"]}}]',13,1),(125,'2020-05-14 10:42:26.995492','5','Shoe( id:5  _ name:GLV08                         _ category:Giày lười                      _ quantitySold:350  _ view:3003_ favourite:2000 )',2,'[{\"changed\": {\"fields\": [\"Image static\"]}}]',13,1),(126,'2020-05-14 10:42:57.388291','4','Shoe( id:4  _ name:GLLV22                        _ category:Giày lười                      _ quantitySold:290  _ view:2003_ favourite:1900 )',2,'[{\"changed\": {\"fields\": [\"Image static\"]}}]',13,1),(127,'2020-05-14 10:43:22.584247','3','Shoe( id:3  _ name:GLLV09                        _ category:Giày lười                      _ quantitySold:480  _ view:1920_ favourite:1600 )',2,'[{\"changed\": {\"fields\": [\"Image static\"]}}]',13,1),(128,'2020-05-14 10:43:47.341764','2','Shoe( id:2  _ name:GLLV25                        _ category:Giày lười                      _ quantitySold:373  _ view:1140_ favourite:2201 )',2,'[{\"changed\": {\"fields\": [\"Image static\"]}}]',13,1),(129,'2020-05-14 10:44:07.757473','1','Shoe( id:1  _ name:GLLV12                        _ category:Giày lười                      _ quantitySold:550  _ view:1502_ favourite:1001 )',2,'[{\"changed\": {\"fields\": [\"Image static\"]}}]',13,1),(130,'2020-05-17 17:55:09.461929','1','admin_group',1,'[{\"added\": {}}]',3,1),(131,'2020-05-17 17:55:20.404814','36','User( id:36_ MessengerId:_ username:giang_admin_ displayName:Giang Ad_ phone:0098 764 321 )',2,'[{\"changed\": {\"fields\": [\"Groups\", \"Staff status\"]}}]',6,1),(132,'2020-05-17 18:12:02.207029','1','admin_group',2,'[{\"changed\": {\"fields\": [\"Permissions\"]}}]',3,1),(133,'2020-05-17 18:13:17.628600','1','admin_group',2,'[{\"changed\": {\"fields\": [\"Permissions\"]}}]',3,1),(134,'2020-05-17 18:14:58.202220','1','admin_group',2,'[{\"changed\": {\"fields\": [\"Permissions\"]}}]',3,1),(135,'2020-05-17 19:55:28.309680','16','[Chờ xác nhận] id:16 _ username:giang _ receiver:Nguyễn Đình Giang _ receiverAddress:DHCN Hà Nội _ totalPayment:580000',2,'[{\"changed\": {\"fields\": [\"DateOrder\", \"DateDelivery\"]}}]',25,36),(136,'2020-05-17 19:55:41.347567','15','[Chờ xác nhận] id:15 _ username:giang _ receiver:Nguyễn Đình Giang _ receiverAddress:DHCN Hà Nội _ totalPayment:580000',2,'[{\"changed\": {\"fields\": [\"DateOrder\", \"DateDelivery\"]}}]',25,36),(137,'2020-05-17 19:55:53.766427','14','[Chờ xác nhận] id:14 _ username:giang _ receiver:Nguyễn Đình Giang _ receiverAddress:DHCN Hà Nội _ totalPayment:580000',2,'[{\"changed\": {\"fields\": [\"DateOrder\", \"DateDelivery\"]}}]',25,36),(138,'2020-05-17 19:56:38.990885','8','[Đã giao] id:8 _ username:giang _ receiver:Nguyễn Đình Giang _ receiverAddress:DHCN Hà Nội _ totalPayment:580000',2,'[{\"changed\": {\"fields\": [\"Status\"]}}]',25,36),(139,'2020-05-17 19:56:54.568016','10','[Đang giao] id:10 _ username:giang _ receiver:Nguyễn Đình Giang _ receiverAddress:DHCN Hà Nội _ totalPayment:1615000',2,'[{\"changed\": {\"fields\": [\"Status\"]}}]',25,36),(140,'2020-05-17 19:57:13.677294','10','[Chờ xác nhận] id:10 _ username:giang _ receiver:Nguyễn Đình Giang _ receiverAddress:DHCN Hà Nội _ totalPayment:1615000',2,'[{\"changed\": {\"fields\": [\"Status\"]}}]',25,36),(141,'2020-05-17 20:25:57.440819','6','[Đã giao] id:6 _ username:1234567 _ receiver:giang 123 _ receiverAddress:3123123 _ totalPayment:520000',2,'[{\"changed\": {\"fields\": [\"Status\"]}}]',25,36),(142,'2020-05-18 16:10:17.821303','1','User( id:1_ MessengerId:_ username:admin_ displayName:Admin_ phone:01234 )',2,'[{\"changed\": {\"fields\": [\"DisplayName\", \"Phone\", \"DefaultAddress\"]}}]',6,1),(143,'2020-05-19 09:05:05.187924','1','[Đã hủy] id:1 _ username:giang _ receiver:giang nd _ receiverAddress:Ha noi _ totalPayment:374000',2,'[{\"changed\": {\"fields\": [\"Status\"]}}]',25,1),(144,'2020-05-19 09:05:14.354259','9','[Đã hủy] id:9 _ username:giang _ receiver:Nguyễn Đình Giang _ receiverAddress:DHCN Hà Nội _ totalPayment:9860000',2,'[{\"changed\": {\"fields\": [\"Status\"]}}]',25,1),(145,'2020-05-19 09:05:21.168965','11','[Đã hủy] id:11 _ username:giang2 _ receiver:ND Giang _ receiverAddress:DHCN Hà Nội, Nhổn, Nguyên Xá, Bắc Từ Liêm _ totalPayment:5720000',2,'[{\"changed\": {\"fields\": [\"Status\"]}}]',25,1),(146,'2020-05-19 13:26:32.978224','17','[Đã giao] id:17 _ username:tk_nu _ receiver:tài khoản nữ _ receiverAddress:ha noi _ totalPayment:580000',2,'[{\"changed\": {\"fields\": [\"Status\"]}}]',25,1),(147,'2020-05-19 13:27:40.858915','37','User( id:37_ MessengerId:_ username:tk_nu_ displayName:tài khoản nữ_ phone:123444 )',2,'[{\"changed\": {\"fields\": [\"Gender\"]}}]',6,1),(148,'2020-05-19 19:11:17.039671','38','User( id:38_ MessengerId:_ username:giangadmin_ displayName:ND Giang_ phone:3123123123123 )',2,'[{\"changed\": {\"fields\": [\"User permissions\", \"Staff status\"]}}]',6,1),(149,'2020-05-19 19:15:53.212852','2','salesman',1,'[{\"added\": {}}]',3,1),(150,'2020-05-19 19:17:08.339059','2','salesman',2,'[]',3,1),(151,'2020-05-19 19:18:18.062078','2','salesman',2,'[{\"changed\": {\"fields\": [\"Permissions\"]}}]',3,1),(152,'2020-05-20 08:38:09.033102','5','Shoe( id:5  _ name:GLV08                         _ category:Giày lười                      _ quantitySold:351  _ view:3007_ favourite:2000 )',2,'[{\"changed\": {\"fields\": [\"Brand\"]}}]',13,1),(153,'2020-05-20 09:24:57.404344','2','Nhân viên',2,'[{\"changed\": {\"fields\": [\"Name\", \"Permissions\"]}}]',3,1),(154,'2020-05-20 09:25:16.678970','1','admin_group',2,'[{\"changed\": {\"fields\": [\"Permissions\"]}}]',3,1),(155,'2020-05-20 09:26:46.189271','1','admin_group',2,'[]',3,1),(156,'2020-05-20 09:27:02.156925','2','Nhân viên',2,'[]',3,1),(157,'2020-05-20 09:30:45.984467','2','Nhân viên',2,'[]',3,1),(158,'2020-05-20 09:31:01.111827','39','[39] Username: nhanvien1 - Name: Nhan vien 1 - Phone: 098 765 4321 - Khách hàng',2,'[{\"changed\": {\"fields\": [\"Staff status\"]}}]',6,1),(159,'2020-05-20 09:31:47.915171','2','Nhân viên',2,'[{\"changed\": {\"fields\": [\"Permissions\"]}}]',3,1),(160,'2020-05-20 09:32:10.245957','2','Nhân viên',2,'[{\"changed\": {\"fields\": [\"Permissions\"]}}]',3,1),(161,'2020-05-20 09:44:45.988323','1','[Người dùng hủy] id:1 _ receiver:giang nd _ receiverAddress:Ha noi _ totalPayment:374000',2,'[{\"changed\": {\"fields\": [\"DateOrder\"]}}]',25,39),(162,'2020-05-20 09:48:43.031696','17','[Đã giao] id:17 _ receiver:tài khoản n _ receiverAddress:ha noi _ totalPayment:580000',2,'[{\"changed\": {\"fields\": [\"Receiver\"]}}]',25,39),(163,'2020-05-20 09:59:54.462328','7','[7] B798 - Giày thể thao B798',2,'[{\"changed\": {\"name\": \"image\", \"object\": \"Image( id:35 _ shoeName:Gi\\u00e0y th\\u1ec3 thao B798            _ imageName:shoe_images/96809369_138888857717177_6422026695175307264_n.jpg )\", \"fields\": [\"ShoeImage\"]}}]',13,39),(164,'2020-05-20 10:00:52.274949','7','[7] B798 - Giày thể thao B798',2,'[{\"changed\": {\"name\": \"image\", \"object\": \"Image( id:35 _ shoeName:Gi\\u00e0y th\\u1ec3 thao B798            _ imageName:shoe_images/B798_5_PyH5vj9.jpg )\", \"fields\": [\"ShoeImage\"]}}]',13,39),(165,'2020-05-20 10:03:36.733422','7','[7] B798 - Giày thể thao B798',2,'[{\"deleted\": {\"name\": \"image\", \"object\": \"Image object (None)\"}}]',13,39),(166,'2020-05-20 10:03:55.475644','7','[7] B798 - Giày thể thao B798',2,'[{\"added\": {\"name\": \"image\", \"object\": \"Image object (46)\"}}]',13,39),(167,'2020-05-20 10:05:55.681693','9','[9] B536 - Giày bata B536',2,'[{\"deleted\": {\"name\": \"image\", \"object\": \"[None] Shoe: Gi\\u00e0y bata B536 - Image: shoe_images/B536_5.jpg\"}}]',13,39),(168,'2020-05-20 10:06:11.841332','9','[9] B536 - Giày bata B536',2,'[{\"deleted\": {\"name\": \"image\", \"object\": \"[None] Shoe: Gi\\u00e0y bata B536 - Image: shoe_images/B536_4.jpg\"}}]',13,39),(169,'2020-05-20 10:06:47.406987','9','[9] B536 - Giày bata B536',2,'[{\"added\": {\"name\": \"image\", \"object\": \"[47] Shoe: Gi\\u00e0y bata B536 - Image: shoe_images/B536_4_hzguu1B.jpg\"}}, {\"added\": {\"name\": \"image\", \"object\": \"[48] Shoe: Gi\\u00e0y bata B536 - Image: shoe_images/B536_5_TupiB2G.jpg\"}}]',13,39),(170,'2020-05-20 10:07:17.201973','5','[5] GLV08 - Giày lười Versace họa tiết vân lá GLV08',2,'[{\"changed\": {\"fields\": [\"Brand\"]}}]',13,39),(171,'2020-05-20 10:07:39.165618','1','[1] GLLV12 - Giày lười Louis Vuitton họa tiết bàn cờ GLLV12',2,'[{\"changed\": {\"fields\": [\"Brand\"]}}]',13,39),(172,'2020-05-20 10:07:49.033441','2','[2] GLLV25 - Giày lười Louis Vuitton họa tiết da nhăn GLLV25',2,'[{\"changed\": {\"fields\": [\"Brand\"]}}]',13,39),(173,'2020-05-20 10:19:40.243225','1','[1] from Harry Potter - title: the subject',2,'[{\"changed\": {\"fields\": [\"Read\"]}}]',19,1),(174,'2020-05-21 14:25:55.509052','7','[7] B798 - Giày thể thao B798',2,'[{\"changed\": {\"name\": \"detail shoe\", \"object\": \"[89] Model: B798 - Size: 41 - M\\u00e0u: \\u0110en - Gi\\u00e1 c\\u0169: 620000 - Gi\\u00e1 m\\u1edbi: 520000\", \"fields\": [\"QuantityAvailable\"]}}]',13,1),(175,'2020-05-21 14:31:29.835728','39','[39] Username: nhanvien1 - Name: Nhan vien 1 - Phone: 098 765 4321 - Khách hàng',2,'[{\"changed\": {\"fields\": [\"Password\"]}}]',6,1),(176,'2020-05-21 16:05:20.909277','3','Quản lý',1,'[{\"added\": {}}]',3,1),(177,'2020-05-21 16:05:35.053514','3','Quản lý',2,'[]',3,1),(178,'2020-05-21 16:06:12.077498','41','[41] Username: quanly1 - Name: quan ly 1 - Phone: 098 765 4321 - Khách hàng',2,'[{\"changed\": {\"fields\": [\"Staff status\"]}}]',6,1),(179,'2020-05-21 16:22:23.848142','18','[Chờ xác nhận] id:18 _ receiver:random1 _ receiverAddress:Ha Noi _ totalPayment:1560000',2,'[{\"changed\": {\"fields\": [\"DateOrder\"]}}]',25,41),(180,'2020-05-21 16:22:33.312409','18','[Đã giao] id:18 _ receiver:random1 _ receiverAddress:Ha Noi _ totalPayment:1560000',2,'[{\"changed\": {\"fields\": [\"Status\"]}}]',25,41),(181,'2020-05-21 18:13:17.997866','2','[2] Title: Giảm giá khi đặt hàng online - Date: 2021-03-26 - Rate: 15',2,'[{\"changed\": {\"fields\": [\"CouponTitle\", \"CouponCode\", \"ExpirationDate\", \"CouponAmount\"]}}]',20,41),(182,'2020-05-21 18:13:27.614249','2','[2] Title: Giảm giá khi đặt hàng online - Date: 2021-03-26 - Rate: 15',2,'[{\"changed\": {\"fields\": [\"CouponDescription\"]}}]',20,41),(183,'2020-05-22 01:17:06.164210','7','[7] T798 - Giày thể thao T798',2,'[{\"changed\": {\"fields\": [\"ShoeName\", \"ShoeModel\"]}}]',13,41),(184,'2020-05-22 01:17:25.057667','8','[8] T967 - Giày thể thao B967',2,'[{\"changed\": {\"fields\": [\"ShoeModel\"]}}]',13,41),(185,'2020-05-22 01:17:37.447474','6','[6] T771 - Giày thể thao T771',2,'[{\"changed\": {\"fields\": [\"ShoeName\", \"ShoeModel\"]}}]',13,41),(186,'2020-05-22 08:25:32.949612','3','[3] Title: Coupon 2 - Date: 2020-06-11 - Rate: 20',2,'[{\"changed\": {\"fields\": [\"DiscountRate\"]}}]',20,41),(187,'2020-05-22 08:26:50.657552','2','[2] Title: Giảm 15% giá trị đơn hàng khi đặt hàng online - Date: 2021-03-26 - Rate: 15',2,'[{\"changed\": {\"fields\": [\"CouponTitle\", \"CouponDescription\"]}}]',20,41),(188,'2020-05-22 08:27:16.312605','3','[3] Title: Giảm 20% giá trị đơn hàng - Date: 2020-06-11 - Rate: 20',2,'[{\"changed\": {\"fields\": [\"CouponTitle\"]}}]',20,41),(189,'2020-05-22 08:37:25.891309','9','[9] B536 - Giày bata B536',2,'[{\"changed\": {\"fields\": [\"DateCreated\"]}}]',13,41),(190,'2020-05-22 08:56:59.856635','8','[8] T967 - Giày thể thao B967',2,'[{\"changed\": {\"fields\": [\"QuantitySold\"]}}]',13,41),(191,'2020-05-22 09:21:08.759919','10','[10] V1123 - Giày mèo',1,'[{\"added\": {}}, {\"added\": {\"name\": \"image\", \"object\": \"[49] Shoe: Gi\\u00e0y m\\u00e8o - Image: shoe_images/96809369_138888857717177_6422026695175307264_n_QoNRrqN.jpg\"}}, {\"added\": {\"name\": \"detail shoe\", \"object\": \"[111] Model: V1123 - Size: 40 - M\\u00e0u: Tr\\u1eafng - Gi\\u00e1 c\\u0169: 300000 - Gi\\u00e1 m\\u1edbi: 200000\"}}]',13,41),(192,'2020-05-22 09:22:10.669060','10','[10] V1123 - Giày mèo',2,'[{\"added\": {\"name\": \"image\", \"object\": \"[50] Shoe: Gi\\u00e0y m\\u00e8o - Image: shoe_images/97510678_287568185741771_1943610221997850624_n.jpg\"}}]',13,41),(193,'2020-05-22 09:22:35.879943','10','[10] V1123 - Giày mèo',2,'[{\"added\": {\"name\": \"image\", \"object\": \"[51] Shoe: Gi\\u00e0y m\\u00e8o - Image: shoe_images/pngguru.com_1.png\"}}]',13,41),(194,'2020-05-22 09:22:55.014592','10','[10] V1123 - Giày mèo',2,'[{\"changed\": {\"fields\": [\"ViewCount\"]}}, {\"added\": {\"name\": \"image\", \"object\": \"[52] Shoe: Gi\\u00e0y m\\u00e8o - Image: shoe_images/88110961_241213566881521_8349616203827773440_n.jpg\"}}]',13,41),(195,'2020-05-22 13:00:57.558299','10','[10] V1123 - Giày mèo',2,'[{\"changed\": {\"name\": \"image\", \"object\": \"[52] Shoe: Gi\\u00e0y m\\u00e8o - Image: shoe_images/97510678_287568185741771_1943610221997850624_n_m2w9jIK.jpg\", \"fields\": [\"ShoeImage\"]}}]',13,39),(196,'2020-05-22 13:01:27.228182','10','[10] V1123 - Giày mèo',2,'[{\"changed\": {\"name\": \"image\", \"object\": \"[51] Shoe: Gi\\u00e0y m\\u00e8o - Image: shoe_images/89631277_201169267646092_5058440794206109696_n.jpg\", \"fields\": [\"ShoeImage\"]}}]',13,39),(197,'2020-05-22 14:04:13.531097','21','[Đang giao] id:21 _ receiver:Nhan vien 1 _ receiverAddress:Ha Noi 1 _ totalPayment:920000',2,'[{\"changed\": {\"fields\": [\"Status\"]}}]',25,41),(198,'2020-05-22 17:01:57.428780','9','[9] Username: giang3 - Name: Nguyễn Đình Giang - Phone: 098 765 4321 - Nhân viên',2,'[{\"changed\": {\"fields\": [\"Username\"]}}]',6,41),(199,'2020-05-22 17:02:56.913288','9','[9] Username: giang3 - Name: Nguyễn Đình Giang - Phone: 098 765 4321 - Nhân viên',2,'[{\"changed\": {\"fields\": [\"MessengerId\"]}}]',6,41),(200,'2020-05-22 17:05:01.104120','34','[34] Username: ndgiang - Name: messenger user - Phone: 098 765 4321 - Nhân viên',2,'[{\"changed\": {\"fields\": [\"Username\", \"MessengerId\", \"Phone\", \"DefaultAddress\"]}}]',6,41),(201,'2020-05-22 17:07:16.104581','34','[34] Username: ndgiang - Name: messenger user - Phone: 098 765 4321 - Nhân viên',2,'[{\"changed\": {\"fields\": [\"Password\"]}}]',6,41),(202,'2020-05-22 17:58:41.425594','34','[34] Username: ndgiang - Name: ND Giang - Phone: 098 765 4321 - Nhân viên',2,'[{\"changed\": {\"fields\": [\"DisplayName\"]}}]',6,41),(203,'2020-05-22 18:01:41.341642','34','[34] Username: ndgiang - Name: ND Giang - Phone: 098 765 4321 - Nhân viên',2,'[{\"deleted\": {\"name\": \"order package\", \"object\": \"[Ch\\u1edd x\\u00e1c nh\\u1eadn] id:None _ receiver:messenger user _ receiverAddress:DHCN Ha Noi _ totalPayment:416000\"}}]',6,41),(204,'2020-05-22 18:56:39.588093','24','[None] id:24 _ receiver:ND Giang _ receiverAddress:DHCN Ha Noi _ totalPayment:1040000',3,'',25,1),(205,'2020-05-22 18:57:27.754656','25','[None] id:25 _ receiver:ND Giang _ receiverAddress:DHCN Ha Noi _ totalPayment:520000',3,'',25,1),(206,'2020-05-23 03:09:07.268246','10','[10] V1123 - Giày mèo',2,'[{\"changed\": {\"fields\": [\"Image static\"]}}]',13,41),(207,'2020-05-23 03:12:38.040785','10','[10] V1123 - Giày mèo',2,'[{\"changed\": {\"fields\": [\"Image static\"]}}]',13,41),(208,'2020-05-23 05:08:15.760410','34','[34] Username: ndgiang - Name: ND Giang - Phone: 098 765 4321 - Nhân viên',2,'[{\"deleted\": {\"name\": \"order package\", \"object\": \"[Ch\\u1edd x\\u00e1c nh\\u1eadn] id:None _ receiver:ND Giang _ receiverAddress:DHCN Ha Noi _ totalPayment:208000\"}}, {\"deleted\": {\"name\": \"order package\", \"object\": \"[Ch\\u1edd x\\u00e1c nh\\u1eadn] id:None _ receiver:ND Giang _ receiverAddress:DHCN Ha Noi _ totalPayment:928000\"}}, {\"deleted\": {\"name\": \"order package\", \"object\": \"[Ng\\u01b0\\u1eddi d\\u00f9ng h\\u1ee7y] id:None _ receiver:ND Giang _ receiverAddress:DHCN Ha Noi _ totalPayment:1560000\"}}]',6,41),(209,'2020-05-23 05:23:22.964700','34','[34] Username: ndgiang - Name: ND Giang - Phone: 098 765 4321 - Nhân viên',2,'[{\"deleted\": {\"name\": \"order package\", \"object\": \"[Ch\\u1edd x\\u00e1c nh\\u1eadn] id:None _ receiver:ND Giang _ receiverAddress:DHCN Ha Noi _ totalPayment:928000\"}}, {\"deleted\": {\"name\": \"order package\", \"object\": \"[Ng\\u01b0\\u1eddi d\\u00f9ng h\\u1ee7y] id:None _ receiver:ND Giang _ receiverAddress:DHCN Ha Noi _ totalPayment:1560000\"}}]',6,41),(210,'2020-05-23 06:18:10.505141','34','[34] Username: ndgiang - Name: ND Giang - Phone: 098 765 4321 - Nhân viên',2,'[{\"deleted\": {\"name\": \"order package\", \"object\": \"[Ch\\u1edd x\\u00e1c nh\\u1eadn] id:None _ receiver:ND Giang _ receiverAddress:DHCN Ha Noi _ totalPayment:352000\"}}, {\"deleted\": {\"name\": \"order package\", \"object\": \"[Ng\\u01b0\\u1eddi d\\u00f9ng h\\u1ee7y] id:None _ receiver:ND Giang _ receiverAddress:DHCN Ha Noi _ totalPayment:1560000\"}}]',6,41);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (6,'account','user'),(1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(22,'cart','cart'),(23,'cart','orderitem'),(24,'cart','orderpackage'),(21,'cart','orderpackagestatus'),(19,'contact_us','feedback'),(4,'contenttypes','contenttype'),(20,'coupon','coupon'),(27,'favourite','favourite'),(7,'mainapp','brand'),(18,'mainapp','cart'),(8,'mainapp','category'),(9,'mainapp','color'),(10,'mainapp','coupon'),(11,'mainapp','detailshoe'),(17,'mainapp','favourite'),(16,'mainapp','image'),(15,'mainapp','orderitem'),(14,'mainapp','orderpackage'),(12,'mainapp','orderpackagestatus'),(13,'mainapp','shoe'),(26,'order','orderitem'),(25,'order','orderpackage'),(5,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2020-04-22 18:19:40.061434'),(2,'contenttypes','0002_remove_content_type_name','2020-04-22 18:19:40.132433'),(3,'auth','0001_initial','2020-04-22 18:19:40.213955'),(4,'auth','0002_alter_permission_name_max_length','2020-04-22 18:19:40.423000'),(5,'auth','0003_alter_user_email_max_length','2020-04-22 18:19:40.438514'),(6,'auth','0004_alter_user_username_opts','2020-04-22 18:19:40.446450'),(7,'auth','0005_alter_user_last_login_null','2020-04-22 18:19:40.455319'),(8,'auth','0006_require_contenttypes_0002','2020-04-22 18:19:40.459087'),(9,'auth','0007_alter_validators_add_error_messages','2020-04-22 18:19:40.467531'),(10,'auth','0008_alter_user_username_max_length','2020-04-22 18:19:40.477880'),(11,'auth','0009_alter_user_last_name_max_length','2020-04-22 18:19:40.487278'),(12,'auth','0010_alter_group_name_max_length','2020-04-22 18:19:40.533971'),(13,'auth','0011_update_proxy_permissions','2020-04-22 18:19:40.542827'),(14,'account','0001_initial','2020-04-22 18:19:40.627258'),(15,'admin','0001_initial','2020-04-22 18:19:40.864793'),(16,'admin','0002_logentry_remove_auto_add','2020-04-22 18:19:40.969173'),(17,'admin','0003_logentry_add_action_flag_choices','2020-04-22 18:19:40.982281'),(18,'mainapp','0001_initial','2020-04-22 18:19:41.410255'),(19,'sessions','0001_initial','2020-04-22 18:19:41.957183'),(20,'account','0002_user_gender','2020-04-23 13:31:34.997270'),(21,'contact_us','0001_initial','2020-04-23 15:48:59.194315'),(22,'contact_us','0002_auto_20200423_2255','2020-04-23 15:55:56.859286'),(23,'contact_us','0003_auto_20200423_2303','2020-04-23 16:03:10.915315'),(24,'coupon','0001_initial','2020-04-24 10:20:04.660685'),(25,'mainapp','0002_auto_20200424_1719','2020-04-24 10:20:04.757245'),(26,'coupon','0002_auto_20200428_1642','2020-04-28 09:42:08.581939'),(27,'mainapp','0003_auto_20200428_1642','2020-04-28 09:42:08.949400'),(28,'mainapp','0004_delete_favourite','2020-04-28 10:43:42.337403'),(29,'cart','0001_initial','2020-04-28 10:43:42.484862'),(30,'cart','0002_auto_20200501_2301','2020-05-01 16:01:59.868278'),(31,'mainapp','0005_auto_20200501_2301','2020-05-01 16:02:00.014632'),(32,'mainapp','0006_auto_20200501_2306','2020-05-01 16:06:19.723548'),(33,'coupon','0003_coupon_couponamount','2020-05-03 09:21:18.556326'),(34,'order','0001_initial','2020-05-03 09:21:18.652903'),(35,'coupon','0004_coupon_couponimage','2020-05-03 09:34:04.509653'),(36,'account','0003_auto_20200504_0007','2020-05-03 17:07:45.835570'),(37,'favourite','0001_initial','2020-05-03 17:07:45.883611'),(38,'mainapp','0007_shoe_shoemodel','2020-05-05 16:07:22.318463'),(39,'order','0002_auto_20200505_2307','2020-05-05 16:07:22.348476'),(40,'order','0003_auto_20200513_0003','2020-05-12 17:03:09.596105'),(41,'favourite','0002_favourite_date_like','2020-05-13 10:34:34.448869'),(42,'mainapp','0008_auto_20200513_2153','2020-05-13 14:54:11.064053'),(43,'mainapp','0009_auto_20200513_2156','2020-05-13 14:56:19.278632'),(44,'mainapp','0010_shoe_image_static','2020-05-14 10:38:29.338879'),(45,'contact_us','0004_feedback_read','2020-05-20 10:19:28.525424'),(46,'order','0004_auto_20200520_1719','2020-05-20 10:19:28.556047');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('278raz9oyctnhgdk9ft738guymmcwohc','YWRlNDQ1ZDg3MGQ0Y2I4YmQyZTNkY2JiZTEwYzMwZWI4MWU1YWZjODp7Il9zZXNzaW9uX2V4cGlyeSI6MCwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6Ijc5YmJjMjAzYjYxOWY3MTkxZDZmMTU3ZTI1NmViZTFjN2I4MWY5OGYifQ==','2020-06-03 14:00:43.978043'),('3gy5rnz0g3ih1ekwjm43llifsr7m2d7p','Nzk1MzdmOGFmMjE1YTk1MmQ0ZTk0NGZjZmNkM2NhZGNmZGEzOWVlMTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3OWJiYzIwM2I2MTlmNzE5MWQ2ZjE1N2UyNTZlYmUxYzdiODFmOThmIn0=','2020-05-23 08:14:27.159242'),('3hggi8358w9wxkuuq5yr62kdjmbohjv1','NmI2ZTQ0NmUwNjgxYzBhNDdmYWQ0ODFlNzk3ZWNkMmVmZTgwNGNmMTp7Il9zZXNzaW9uX2V4cGlyeSI6MCwiX2F1dGhfdXNlcl9pZCI6IjM0IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJkMDZjNWE5NmI0NzMyMWVkNDQ3NzIzZGVjZGRiNTI5NWE0ODJlYzQ3In0=','2020-06-06 06:50:21.297612'),('3k6xxx331k2nnehl7bq7rfy0ebqtb4bp','Nzk1MzdmOGFmMjE1YTk1MmQ0ZTk0NGZjZmNkM2NhZGNmZGEzOWVlMTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3OWJiYzIwM2I2MTlmNzE5MWQ2ZjE1N2UyNTZlYmUxYzdiODFmOThmIn0=','2020-05-27 14:54:19.769128'),('3w6o17et3lo37a1o3p5dyra4w0yiw9no','N2ZlZDcxOTY0NWYxMjZkNDg3MDcwZDAyMjY5MDlkMDQ2OTYyNDkyMzp7Il9zZXNzaW9uX2V4cGlyeSI6MSwiX2F1dGhfdXNlcl9pZCI6IjM5IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2U0YzcxMjc3MDBiYmZkNjAyODdkMDI2MDgyZjRiM2U2ZGVjYThmIn0=','2020-05-21 14:58:31.452021'),('4heo6721qeu39l7f5jg3932z10hk5fky','Nzk1MzdmOGFmMjE1YTk1MmQ0ZTk0NGZjZmNkM2NhZGNmZGEzOWVlMTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3OWJiYzIwM2I2MTlmNzE5MWQ2ZjE1N2UyNTZlYmUxYzdiODFmOThmIn0=','2020-05-12 14:57:30.626845'),('4pnejfi3toq5lhj6dfl7rtvkwx2ws6lq','YWRlNDQ1ZDg3MGQ0Y2I4YmQyZTNkY2JiZTEwYzMwZWI4MWU1YWZjODp7Il9zZXNzaW9uX2V4cGlyeSI6MCwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6Ijc5YmJjMjAzYjYxOWY3MTkxZDZmMTU3ZTI1NmViZTFjN2I4MWY5OGYifQ==','2020-06-05 18:56:24.913651'),('6zz5ezcxopff8aft79nll7zff1mosyx7','ZWQwMzI3MzA2Y2JlOTNiNDczNTJiMGQzNTFjODAyZTAwYTg4YTQ5Njp7Il9zZXNzaW9uX2V4cGlyeSI6MCwiX2F1dGhfdXNlcl9pZCI6IjkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6ImQwNmM1YTk2YjQ3MzIxZWQ0NDc3MjNkZWNkZGI1Mjk1YTQ4MmVjNDcifQ==','2020-06-05 07:00:38.553017'),('71f8a8bzw1swviyi5znv5nz2vjhxelb0','NmI2ZTQ0NmUwNjgxYzBhNDdmYWQ0ODFlNzk3ZWNkMmVmZTgwNGNmMTp7Il9zZXNzaW9uX2V4cGlyeSI6MCwiX2F1dGhfdXNlcl9pZCI6IjM0IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJkMDZjNWE5NmI0NzMyMWVkNDQ3NzIzZGVjZGRiNTI5NWE0ODJlYzQ3In0=','2020-06-05 19:04:27.837694'),('8geo7u6z5lis9kb7m3h755q5yxkfg3rp','Nzk1MzdmOGFmMjE1YTk1MmQ0ZTk0NGZjZmNkM2NhZGNmZGEzOWVlMTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3OWJiYzIwM2I2MTlmNzE5MWQ2ZjE1N2UyNTZlYmUxYzdiODFmOThmIn0=','2020-05-23 12:17:28.695915'),('8wi0knnpp8f8xkin1bxi1t4402sp1tjk','N2ZlZDcxOTY0NWYxMjZkNDg3MDcwZDAyMjY5MDlkMDQ2OTYyNDkyMzp7Il9zZXNzaW9uX2V4cGlyeSI6MSwiX2F1dGhfdXNlcl9pZCI6IjM5IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2U0YzcxMjc3MDBiYmZkNjAyODdkMDI2MDgyZjRiM2U2ZGVjYThmIn0=','2020-05-21 14:57:50.124578'),('apuo8tm2glq1g2bqpac7agr06aodifzt','YWVhMGQ1ZDlmMzU1MDYzNzRmNzYwNjBjOWRjMjJiYzY4NTNkNTUzYTp7Il9hdXRoX3VzZXJfaWQiOiIzOCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYzkxZmYxNWM2NjhjODZmNjQwY2RhZjY2MzJlZjYwMmVjYzFiZjMxMiJ9','2020-06-02 19:10:32.464189'),('bbobqtdhmuj751mwh5drb7mk3vwe2x48','NmI2ZTQ0NmUwNjgxYzBhNDdmYWQ0ODFlNzk3ZWNkMmVmZTgwNGNmMTp7Il9zZXNzaW9uX2V4cGlyeSI6MCwiX2F1dGhfdXNlcl9pZCI6IjM0IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJkMDZjNWE5NmI0NzMyMWVkNDQ3NzIzZGVjZGRiNTI5NWE0ODJlYzQ3In0=','2020-06-06 06:20:32.270412'),('cde6gxs5s0pooz7ywxhikr2oiekwnv57','MmM3NDYzZWE1YjE3Y2QzNDVjNGE2ZTgwMDZlZjA4ZTBhY2FhZDgyZDp7Il9zZXNzaW9uX2V4cGlyeSI6MCwiX2F1dGhfdXNlcl9pZCI6IjM2IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI1ZmU1MzE3ZGJjMWE0NmFkZDNkMGI1MTY3MDI4MjY4OWE4N2U2YzlmIn0=','2020-05-31 19:54:51.980114'),('df85y98a1ox3xafpojgraz733l7y4fcz','YmFjNjExYTE5ZWQ5YmViZTMxOGM5NTk5NGQwM2U5YzMyNzM4OGY5NTp7Il9hdXRoX3VzZXJfaWQiOiI5IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJkMDZjNWE5NmI0NzMyMWVkNDQ3NzIzZGVjZGRiNTI5NWE0ODJlYzQ3In0=','2020-06-05 08:59:07.096642'),('ds2i09ugu4z752tewplmg70m602c3tqg','Nzk1MzdmOGFmMjE1YTk1MmQ0ZTk0NGZjZmNkM2NhZGNmZGEzOWVlMTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3OWJiYzIwM2I2MTlmNzE5MWQ2ZjE1N2UyNTZlYmUxYzdiODFmOThmIn0=','2020-05-28 09:39:50.161313'),('dvrh1chlf5aie3jnj8tt1zum5r6ykfxg','YWRlNDQ1ZDg3MGQ0Y2I4YmQyZTNkY2JiZTEwYzMwZWI4MWU1YWZjODp7Il9zZXNzaW9uX2V4cGlyeSI6MCwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6Ijc5YmJjMjAzYjYxOWY3MTkxZDZmMTU3ZTI1NmViZTFjN2I4MWY5OGYifQ==','2020-05-20 15:20:33.197400'),('fez177kj0ungw41zqoiz078t8brqpdpz','Nzk1MzdmOGFmMjE1YTk1MmQ0ZTk0NGZjZmNkM2NhZGNmZGEzOWVlMTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3OWJiYzIwM2I2MTlmNzE5MWQ2ZjE1N2UyNTZlYmUxYzdiODFmOThmIn0=','2020-05-18 17:48:37.964551'),('fgsa288y93fvdmohk2gcjkzdj04ijqa8','Nzk1MzdmOGFmMjE1YTk1MmQ0ZTk0NGZjZmNkM2NhZGNmZGEzOWVlMTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3OWJiYzIwM2I2MTlmNzE5MWQ2ZjE1N2UyNTZlYmUxYzdiODFmOThmIn0=','2020-06-04 16:02:05.941700'),('gdu8udojtci9gupg7zx2la06y88mqfd5','YzNmMmQ1ZjAwNDY2NjlhMDdkNjU1NTFhY2Y3ZjY2ZTdiMzUwZDIwNjp7Il9hdXRoX3VzZXJfaWQiOiIzOSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNmU4NWE3ZTkyN2I1N2YwZDJhZGY2MmIwN2VhOTFhNWYyY2FlY2VkMyJ9','2020-06-03 09:27:48.836385'),('ghf5tq1m6y4w3el70hq0ytjv67is9i98','ZWQwMzI3MzA2Y2JlOTNiNDczNTJiMGQzNTFjODAyZTAwYTg4YTQ5Njp7Il9zZXNzaW9uX2V4cGlyeSI6MCwiX2F1dGhfdXNlcl9pZCI6IjkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6ImQwNmM1YTk2YjQ3MzIxZWQ0NDc3MjNkZWNkZGI1Mjk1YTQ4MmVjNDcifQ==','2020-06-05 01:59:06.851903'),('iau5fvpczkig0t2m80yi3lascwwvmr10','M2I2NWY4ZGYxZjk4NDAwN2ExYWI3MmI4NDY1NWU0NjNiYjAzZjY5Nzp7Il9zZXNzaW9uX2V4cGlyeSI6MCwiX2F1dGhfdXNlcl9pZCI6IjkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjVmYjhhYzI5ODZjMzg0ZGYyYTY4YzdkMTIyNjU3MWVkYTY0YTI5YjkifQ==','2020-05-14 09:06:06.747337'),('j0pxc8ud8jlcfc9adphoay1htgekwkz6','N2ZlZDcxOTY0NWYxMjZkNDg3MDcwZDAyMjY5MDlkMDQ2OTYyNDkyMzp7Il9zZXNzaW9uX2V4cGlyeSI6MSwiX2F1dGhfdXNlcl9pZCI6IjM5IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2U0YzcxMjc3MDBiYmZkNjAyODdkMDI2MDgyZjRiM2U2ZGVjYThmIn0=','2020-05-21 14:58:21.924000'),('lks7idyi4h0qus26nexdm4oc0po67ljc','Nzk1MzdmOGFmMjE1YTk1MmQ0ZTk0NGZjZmNkM2NhZGNmZGEzOWVlMTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3OWJiYzIwM2I2MTlmNzE5MWQ2ZjE1N2UyNTZlYmUxYzdiODFmOThmIn0=','2020-05-19 15:34:35.708923'),('my1vutbpmlh14zgifrxppzbbpc8w873o','Nzk1MzdmOGFmMjE1YTk1MmQ0ZTk0NGZjZmNkM2NhZGNmZGEzOWVlMTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3OWJiYzIwM2I2MTlmNzE5MWQ2ZjE1N2UyNTZlYmUxYzdiODFmOThmIn0=','2020-05-14 07:59:37.900402'),('nqiua1hrc5wqav0rnus6xwijfycryqce','Nzk1MzdmOGFmMjE1YTk1MmQ0ZTk0NGZjZmNkM2NhZGNmZGEzOWVlMTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3OWJiYzIwM2I2MTlmNzE5MWQ2ZjE1N2UyNTZlYmUxYzdiODFmOThmIn0=','2020-05-25 15:21:57.624797'),('o6jpxybf0mecnzjgiclxqvazexw780qp','NmI2ZTQ0NmUwNjgxYzBhNDdmYWQ0ODFlNzk3ZWNkMmVmZTgwNGNmMTp7Il9zZXNzaW9uX2V4cGlyeSI6MCwiX2F1dGhfdXNlcl9pZCI6IjM0IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJkMDZjNWE5NmI0NzMyMWVkNDQ3NzIzZGVjZGRiNTI5NWE0ODJlYzQ3In0=','2020-06-06 05:27:03.802561'),('oni1i1huabvufea5ld72vydq3ffw5x4y','M2QzMGUxMDcwMTE5ZGJlMDk1OTI1ZGIwYTFiZTAzMTBkYTU3M2NmYTp7Il9hdXRoX3VzZXJfaWQiOiI0MSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiODY2YmEwODk3NzhjODhmZGQyMmVlNTJkYWRmMzFhZjYzMmY0ODc5YiJ9','2020-06-05 17:00:09.438901'),('or5qxw3dcluyflukpcjbr8jypqz1wysd','YWRlNDQ1ZDg3MGQ0Y2I4YmQyZTNkY2JiZTEwYzMwZWI4MWU1YWZjODp7Il9zZXNzaW9uX2V4cGlyeSI6MCwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6Ijc5YmJjMjAzYjYxOWY3MTkxZDZmMTU3ZTI1NmViZTFjN2I4MWY5OGYifQ==','2020-06-01 15:48:43.040881'),('p5tdyaas7efw4012ll8usvzsll4uf84s','YmFjNjExYTE5ZWQ5YmViZTMxOGM5NTk5NGQwM2U5YzMyNzM4OGY5NTp7Il9hdXRoX3VzZXJfaWQiOiI5IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJkMDZjNWE5NmI0NzMyMWVkNDQ3NzIzZGVjZGRiNTI5NWE0ODJlYzQ3In0=','2020-06-05 08:40:24.849897'),('qvg7igfqxr7a1g4utlvjpcon9mk1sdgh','Nzk1MzdmOGFmMjE1YTk1MmQ0ZTk0NGZjZmNkM2NhZGNmZGEzOWVlMTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3OWJiYzIwM2I2MTlmNzE5MWQ2ZjE1N2UyNTZlYmUxYzdiODFmOThmIn0=','2020-05-26 10:35:43.805127'),('snr22dryvrg7kadmuzqg2jrn5l1j8u2o','Nzk1MzdmOGFmMjE1YTk1MmQ0ZTk0NGZjZmNkM2NhZGNmZGEzOWVlMTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3OWJiYzIwM2I2MTlmNzE5MWQ2ZjE1N2UyNTZlYmUxYzdiODFmOThmIn0=','2020-05-13 07:14:16.995786'),('sqpgd3hhlfkfcn3ziljd7cb2prw1yris','Nzk1MzdmOGFmMjE1YTk1MmQ0ZTk0NGZjZmNkM2NhZGNmZGEzOWVlMTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3OWJiYzIwM2I2MTlmNzE5MWQ2ZjE1N2UyNTZlYmUxYzdiODFmOThmIn0=','2020-05-28 10:15:16.308367'),('t6dde3vr7zill2x2cvxai9m5cwna3j00','MDczZGMwZjMyM2Y2MWZjZjdjYTc0MWVmY2I0YTYwNzUwM2U5MjhiYzp7Il9hdXRoX3VzZXJfaWQiOiIzNCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiZDA2YzVhOTZiNDczMjFlZDQ0NzcyM2RlY2RkYjUyOTVhNDgyZWM0NyJ9','2020-06-06 05:17:30.197823'),('twcvkvo4cvekd9w2886wxprq2mny5752','NmI2ZTQ0NmUwNjgxYzBhNDdmYWQ0ODFlNzk3ZWNkMmVmZTgwNGNmMTp7Il9zZXNzaW9uX2V4cGlyeSI6MCwiX2F1dGhfdXNlcl9pZCI6IjM0IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJkMDZjNWE5NmI0NzMyMWVkNDQ3NzIzZGVjZGRiNTI5NWE0ODJlYzQ3In0=','2020-06-05 18:04:33.762496'),('uzy0bwehzjixwrztesr5nclt99cdy56w','Nzk1MzdmOGFmMjE1YTk1MmQ0ZTk0NGZjZmNkM2NhZGNmZGEzOWVlMTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3OWJiYzIwM2I2MTlmNzE5MWQ2ZjE1N2UyNTZlYmUxYzdiODFmOThmIn0=','2020-05-18 13:16:19.568452'),('v34lpgg8stilnl2der5arbv3zys0g5xb','YWRlNDQ1ZDg3MGQ0Y2I4YmQyZTNkY2JiZTEwYzMwZWI4MWU1YWZjODp7Il9zZXNzaW9uX2V4cGlyeSI6MCwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6Ijc5YmJjMjAzYjYxOWY3MTkxZDZmMTU3ZTI1NmViZTFjN2I4MWY5OGYifQ==','2020-05-31 17:51:23.743826'),('v9nndmypkz870yq783k5kjcongnaf4gw','OWUwNTI4MWJiODI2MjBmZmI0NzAzNjEzYTg0MjVlMjQ0MmJjNjNjMjp7Il9hdXRoX3VzZXJfaWQiOiI0MCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMThhYTM3MzIwYjZiZGE1N2IxMjZhODAxNzEwMmFkY2UyMzk1YjJmNCJ9','2020-06-03 16:18:54.065168'),('yuqa8lfou5o3swvvwawrv55msao9k74p','M2QzMGUxMDcwMTE5ZGJlMDk1OTI1ZGIwYTFiZTAzMTBkYTU3M2NmYTp7Il9hdXRoX3VzZXJfaWQiOiI0MSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiODY2YmEwODk3NzhjODhmZGQyMmVlNTJkYWRmMzFhZjYzMmY0ODc5YiJ9','2020-06-05 14:03:54.990595'),('z08fv41qhi9u6d799r6ijie6qyp6920g','Nzk1MzdmOGFmMjE1YTk1MmQ0ZTk0NGZjZmNkM2NhZGNmZGEzOWVlMTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3OWJiYzIwM2I2MTlmNzE5MWQ2ZjE1N2UyNTZlYmUxYzdiODFmOThmIn0=','2020-05-17 15:08:03.448473'),('zltwf3w35r0lnj6yebefmajul1tsw9n1','YmFjNjExYTE5ZWQ5YmViZTMxOGM5NTk5NGQwM2U5YzMyNzM4OGY5NTp7Il9hdXRoX3VzZXJfaWQiOiI5IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJkMDZjNWE5NmI0NzMyMWVkNDQ3NzIzZGVjZGRiNTI5NWE0ODJlYzQ3In0=','2020-06-05 14:10:06.903735'),('zxwaolpxugx6mxx8aqr9vb3sybwa5rmk','Nzk1MzdmOGFmMjE1YTk1MmQ0ZTk0NGZjZmNkM2NhZGNmZGEzOWVlMTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3OWJiYzIwM2I2MTlmNzE5MWQ2ZjE1N2UyNTZlYmUxYzdiODFmOThmIn0=','2020-05-25 09:59:35.851520');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favourite_favourite`
--

DROP TABLE IF EXISTS `favourite_favourite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `favourite_favourite` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shoe_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `date_like` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `favourite_favourite_shoe_id_9ed562ed_fk_mainapp_shoe_id` (`shoe_id`),
  KEY `favourite_favourite_user_id_7e49432e_fk_account_user_id` (`user_id`),
  CONSTRAINT `favourite_favourite_shoe_id_9ed562ed_fk_mainapp_shoe_id` FOREIGN KEY (`shoe_id`) REFERENCES `mainapp_shoe` (`id`),
  CONSTRAINT `favourite_favourite_user_id_7e49432e_fk_account_user_id` FOREIGN KEY (`user_id`) REFERENCES `account_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favourite_favourite`
--

LOCK TABLES `favourite_favourite` WRITE;
/*!40000 ALTER TABLE `favourite_favourite` DISABLE KEYS */;
INSERT INTO `favourite_favourite` VALUES (5,1,9,'2020-05-13'),(6,2,9,'2020-05-13'),(8,8,9,'2020-05-22');
/*!40000 ALTER TABLE `favourite_favourite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mainapp_brand`
--

DROP TABLE IF EXISTS `mainapp_brand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mainapp_brand` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `brandName` varchar(128) NOT NULL,
  `brandDesc` varchar(1024) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mainapp_brand`
--

LOCK TABLES `mainapp_brand` WRITE;
/*!40000 ALTER TABLE `mainapp_brand` DISABLE KEYS */;
INSERT INTO `mainapp_brand` VALUES (1,'Unknown',''),(2,'Nike',''),(3,'Adidas',''),(4,'Gucci',''),(5,'Louis Vuitton',''),(6,'Versace','');
/*!40000 ALTER TABLE `mainapp_brand` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mainapp_category`
--

DROP TABLE IF EXISTS `mainapp_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mainapp_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `categoryName` varchar(128) NOT NULL,
  `categoryThumbnail` varchar(255) NOT NULL,
  `categoryDesc` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mainapp_category`
--

LOCK TABLES `mainapp_category` WRITE;
/*!40000 ALTER TABLE `mainapp_category` DISABLE KEYS */;
INSERT INTO `mainapp_category` VALUES (1,'Giày da','1_da.jpg',''),(2,'Giày lười','2_luoi.jpg',''),(3,'Giày thể thao','3_thethao.jpg',''),(4,'Giày cao cổ','4_caoco.jpg',''),(5,'Giày vải','5_vai.jpg',''),(6,'Giày bata','6_bata.jpg','');
/*!40000 ALTER TABLE `mainapp_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mainapp_color`
--

DROP TABLE IF EXISTS `mainapp_color`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mainapp_color` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `colorName` varchar(64) NOT NULL,
  `colorDesc` varchar(128) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mainapp_color`
--

LOCK TABLES `mainapp_color` WRITE;
/*!40000 ALTER TABLE `mainapp_color` DISABLE KEYS */;
INSERT INTO `mainapp_color` VALUES (1,'Đen',''),(2,'Trắng',''),(3,'Đỏ',''),(4,'Vàng',''),(5,'Nâu',''),(6,'Xám',''),(7,'Lam',''),(8,'Lục',''),(9,'Hồng',''),(10,'Nhiều màu','');
/*!40000 ALTER TABLE `mainapp_color` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mainapp_detailshoe`
--

DROP TABLE IF EXISTS `mainapp_detailshoe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mainapp_detailshoe` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `size` int(11) NOT NULL,
  `quantityAvailable` int(11) NOT NULL,
  `oldPrice` int(11) NOT NULL,
  `newPrice` int(11) NOT NULL,
  `detailShoeDesc` varchar(255) NOT NULL,
  `color_id` int(11) NOT NULL,
  `shoe_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mainapp_detailshoe_shoe_id_c6bcdaa5_fk_mainapp_shoe_id` (`shoe_id`),
  KEY `mainapp_detailshoe_color_id_329e30fd_fk_mainapp_color_id` (`color_id`),
  CONSTRAINT `mainapp_detailshoe_color_id_329e30fd_fk_mainapp_color_id` FOREIGN KEY (`color_id`) REFERENCES `mainapp_color` (`id`),
  CONSTRAINT `mainapp_detailshoe_shoe_id_c6bcdaa5_fk_mainapp_shoe_id` FOREIGN KEY (`shoe_id`) REFERENCES `mainapp_shoe` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=112 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mainapp_detailshoe`
--

LOCK TABLES `mainapp_detailshoe` WRITE;
/*!40000 ALTER TABLE `mainapp_detailshoe` DISABLE KEYS */;
INSERT INTO `mainapp_detailshoe` VALUES (1,41,20,560000,480000,'',1,1),(2,42,10,560000,480000,'',1,1),(3,43,15,560000,480000,'',1,1),(4,44,45,560000,480000,'',1,1),(5,41,18,520000,440000,'',1,2),(6,42,28,520000,440000,'',1,2),(7,43,0,520000,440000,'',1,2),(8,44,5,520000,440000,'',1,2),(9,41,10,600000,520000,'',1,3),(10,42,12,600000,520000,'',1,3),(11,43,18,600000,520000,'',1,3),(12,44,9,600000,520000,'',1,3),(13,41,11,480000,400000,'',1,4),(14,42,22,480000,400000,'',1,4),(15,43,37,480000,400000,'',1,4),(16,44,9,480000,400000,'',1,4),(17,41,19,650000,580000,'',1,5),(18,42,29,650000,580000,'',1,5),(19,43,10,650000,580000,'',1,5),(20,44,8,650000,580000,'',1,5),(81,41,18,660000,580000,'',1,6),(82,42,24,660000,580000,'',1,6),(83,43,10,660000,580000,'',1,6),(84,44,28,660000,580000,'',1,6),(85,41,14,660000,580000,'',2,6),(86,42,28,660000,580000,'',2,6),(87,43,7,660000,580000,'',2,6),(88,44,8,660000,580000,'',2,6),(89,41,15,620000,520000,'',1,7),(90,42,29,620000,520000,'',1,7),(91,43,10,620000,520000,'',1,7),(92,44,8,620000,520000,'',1,7),(93,41,20,620000,520000,'',2,7),(94,42,30,620000,520000,'',2,7),(95,43,7,620000,520000,'',2,7),(96,44,8,620000,520000,'',2,7),(97,41,19,700000,580000,'',1,8),(98,42,30,700000,580000,'',1,8),(99,43,10,700000,580000,'',1,8),(100,44,8,700000,580000,'',1,8),(101,41,20,700000,580000,'',2,8),(102,42,30,700000,580000,'',2,8),(103,43,8,700000,580000,'',2,8),(104,44,8,700000,580000,'',2,8),(105,39,19,330000,260000,'',2,9),(106,40,30,330000,260000,'',2,9),(107,41,7,330000,260000,'',2,9),(108,42,25,330000,260000,'',2,9),(109,43,35,330000,260000,'',2,9),(110,44,6,330000,260000,'',2,9),(111,40,20,300000,200000,'',2,10);
/*!40000 ALTER TABLE `mainapp_detailshoe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mainapp_image`
--

DROP TABLE IF EXISTS `mainapp_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mainapp_image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `imageDesc` varchar(64) NOT NULL,
  `shoe_id` int(11) NOT NULL,
  `shoeImage` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mainapp_image_shoe_id_391fe90b_fk_mainapp_shoe_id` (`shoe_id`),
  CONSTRAINT `mainapp_image_shoe_id_391fe90b_fk_mainapp_shoe_id` FOREIGN KEY (`shoe_id`) REFERENCES `mainapp_shoe` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mainapp_image`
--

LOCK TABLES `mainapp_image` WRITE;
/*!40000 ALTER TABLE `mainapp_image` DISABLE KEYS */;
INSERT INTO `mainapp_image` VALUES (1,'',1,'shoe_images/GLLV12_1.jpg'),(2,'',1,'shoe_images/GLLV12_2.jpg'),(3,'',1,'shoe_images/GLLV12_3.jpg'),(4,'',1,'shoe_images/GLLV12_4.jpg'),(5,'',1,'shoe_images/GLLV12_5.jpg'),(6,'',2,'shoe_images/GLLV25_1.jpg'),(7,'',2,'shoe_images/GLLV25_2.jpg'),(8,'',2,'shoe_images/GLLV25_3.jpg'),(9,'',2,'shoe_images/GLLV25_4.jpg'),(10,'',2,'shoe_images/GLLV25_5.jpg'),(11,'',3,'shoe_images/GLLV09_1.jpg'),(12,'',3,'shoe_images/GLLV09_2.jpg'),(13,'',3,'shoe_images/GLLV09_3.jpg'),(14,'',3,'shoe_images/GLLV09_4.jpg'),(15,'',3,'shoe_images/GLLV09_5.jpg'),(16,'',4,'shoe_images/GLLV22_1.jpg'),(17,'',4,'shoe_images/GLLV22_2.jpg'),(18,'',4,'shoe_images/GLLV22_3.jpg'),(19,'',4,'shoe_images/GLLV22_4.jpg'),(20,'',4,'shoe_images/GLLV22_5.jpg'),(21,'',5,'shoe_images/GLV08_1.jpg'),(22,'',5,'shoe_images/GLV08_2.jpg'),(23,'',5,'shoe_images/GLV08_3.jpg'),(24,'',5,'shoe_images/GLV08_4.jpg'),(25,'',5,'shoe_images/GLV08_5.jpg'),(26,'',6,'shoe_images/B771_1.jpg'),(27,'',6,'shoe_images/B771_2.png'),(28,'',6,'shoe_images/B771_3.jpg'),(29,'',6,'shoe_images/B771_4.jpg'),(30,'',6,'shoe_images/B771_5.jpg'),(31,'',7,'shoe_images/B798_1.jpg'),(32,'',7,'shoe_images/B798_2.jpg'),(33,'',7,'shoe_images/B798_3.jpg'),(34,'',7,'shoe_images/B798_4.jpg'),(36,'',8,'shoe_images/B967_1.jpg'),(37,'',8,'shoe_images/B967_2.jpg'),(38,'',8,'shoe_images/B967_3.jpg'),(39,'',8,'shoe_images/B967_4.jpg'),(40,'',8,'shoe_images/B967_5.jpg'),(41,'',9,'shoe_images/B536_1.jpg'),(42,'',9,'shoe_images/B536_2.jpg'),(43,'',9,'shoe_images/B536_3.jpg'),(46,'',7,'shoe_images/B798_5_jMYU0hT.jpg'),(47,'',9,'shoe_images/B536_4_hzguu1B.jpg'),(48,'',9,'shoe_images/B536_5_TupiB2G.jpg'),(49,'',10,'shoe_images/96809369_138888857717177_6422026695175307264_n_QoNRrqN.jpg'),(50,'',10,'shoe_images/97510678_287568185741771_1943610221997850624_n.jpg'),(51,'',10,'shoe_images/89631277_201169267646092_5058440794206109696_n.jpg'),(52,'',10,'shoe_images/97510678_287568185741771_1943610221997850624_n_m2w9jIK.jpg');
/*!40000 ALTER TABLE `mainapp_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mainapp_shoe`
--

DROP TABLE IF EXISTS `mainapp_shoe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mainapp_shoe` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shoeName` varchar(255) NOT NULL,
  `shoeThumbnail` varchar(100) NOT NULL,
  `active` int(11) NOT NULL,
  `quantitySold` int(11) NOT NULL,
  `viewCount` int(11) NOT NULL,
  `favouriteCount` int(11) NOT NULL,
  `dateCreated` datetime(6) NOT NULL,
  `shoeDesc` varchar(2048) NOT NULL,
  `brand_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `shoeModel` varchar(255) NOT NULL,
  `dateModified` datetime(6) NOT NULL,
  `image_static` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mainapp_shoe_brand_id_623c0182_fk_mainapp_brand_id` (`brand_id`),
  KEY `mainapp_shoe_category_id_8c8cc3d8_fk_mainapp_category_id` (`category_id`),
  CONSTRAINT `mainapp_shoe_brand_id_623c0182_fk_mainapp_brand_id` FOREIGN KEY (`brand_id`) REFERENCES `mainapp_brand` (`id`),
  CONSTRAINT `mainapp_shoe_category_id_8c8cc3d8_fk_mainapp_category_id` FOREIGN KEY (`category_id`) REFERENCES `mainapp_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mainapp_shoe`
--

LOCK TABLES `mainapp_shoe` WRITE;
/*!40000 ALTER TABLE `mainapp_shoe` DISABLE KEYS */;
INSERT INTO `mainapp_shoe` VALUES (1,'Giày lười Louis Vuitton họa tiết bàn cờ GLLV12','shoe_thumbnails/GLLV12_1.jpg',1,550,1502,1001,'2019-09-02 00:00:00.000000','Giày êm chạy không đau chân',5,2,'GLLV12','2020-05-20 10:07:39.163945','https://i.imgur.com/EDqqj3U.jpg'),(2,'Giày lười Louis Vuitton họa tiết da nhăn GLLV25','shoe_thumbnails/GLLV25_1.jpg',1,375,1142,2201,'2020-02-22 00:00:00.000000','Giày êm chạy không đau chân',5,2,'GLLV25','2020-05-23 05:31:41.954087','https://i.imgur.com/lxAEOG5.jpg'),(3,'Giày lười Louis Vuitton họa tiết ô rạn GLLV09','shoe_thumbnails/GLLV09_1.jpg',1,480,1933,1600,'2020-02-12 00:00:00.000000','Giày êm chạy không đau chân',1,2,'GLLV09','2020-05-21 15:53:51.874283','https://i.imgur.com/13oSvab.jpg'),(4,'Giày lười Louis Vuitton like au họa tiết rạn GLLV22','shoe_thumbnails/GLLV22_1.jpg',1,291,2006,1900,'2020-01-12 00:00:00.000000','Giày êm chạy không đau chân',1,2,'GLLV22','2020-05-22 14:03:20.535831','https://i.imgur.com/CNZKtnm.jpg'),(5,'Giày lười Versace họa tiết vân lá GLV08','shoe_thumbnails/GLV08_1.jpg',1,352,3008,2000,'2020-03-20 00:00:00.000000','Giày êm chạy không đau chân',6,2,'GLV08','2020-05-23 06:50:32.900577','https://i.imgur.com/SqAm33C.jpg'),(6,'Giày thể thao T771','shoe_thumbnails/B771_1.jpg',1,289,1413,1970,'2020-02-02 00:00:00.000000','Giày êm chạy không đau chân',1,3,'T771','2020-05-23 05:18:02.370200','https://i.imgur.com/8xaCOw1.jpg'),(7,'Giày thể thao T798','shoe_thumbnails/B798_1.jpg',1,796,2217,2300,'2019-08-19 00:00:00.000000','Giày êm chạy không đau chân',1,3,'T798','2020-05-23 05:29:59.091927','https://i.imgur.com/372dixB.jpg'),(8,'Giày thể thao B967','shoe_thumbnails/B967_1.jpg',1,853,1625,2200,'2019-12-12 00:00:00.000000','Giày êm chạy không đau chân',1,3,'T967','2020-05-22 16:50:48.237088','https://i.imgur.com/DgFwpj3.jpg'),(9,'Giày bata B536','shoe_thumbnails/B536_1.jpg',1,428,1816,2700,'2020-04-08 00:00:00.000000','Giày êm chạy không đau chân',1,6,'B536','2020-05-23 06:22:13.671432','https://i.imgur.com/l53QjH5.jpg'),(10,'Giày mèo','shoe_thumbnails/96809369_138888857717177_6422026695175307264_n.jpg',1,0,6,0,'2020-05-22 09:19:38.000000','',3,5,'V1123','2020-05-23 03:12:38.039211','https://i.imgur.com/DZIZ5eH.png');
/*!40000 ALTER TABLE `mainapp_shoe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_orderitem`
--

DROP TABLE IF EXISTS `order_orderitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_orderitem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `quantity` int(11) NOT NULL,
  `itemPrice` int(11) NOT NULL,
  `detailShoe_id` int(11) NOT NULL,
  `orderPackage_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `order_orderitem_detailShoe_id_b4b633e3_fk_mainapp_detailshoe_id` (`detailShoe_id`),
  KEY `order_orderitem_orderPackage_id_db2fad4d_fk_order_ord` (`orderPackage_id`),
  CONSTRAINT `order_orderitem_detailShoe_id_b4b633e3_fk_mainapp_detailshoe_id` FOREIGN KEY (`detailShoe_id`) REFERENCES `mainapp_detailshoe` (`id`),
  CONSTRAINT `order_orderitem_orderPackage_id_db2fad4d_fk_order_ord` FOREIGN KEY (`orderPackage_id`) REFERENCES `order_orderpackage` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_orderitem`
--

LOCK TABLES `order_orderitem` WRITE;
/*!40000 ALTER TABLE `order_orderitem` DISABLE KEYS */;
INSERT INTO `order_orderitem` VALUES (1,2,440000,5,1),(2,2,440000,5,2),(6,1,520000,90,6),(7,3,580000,87,7),(8,1,520000,89,7),(9,1,580000,81,8),(10,20,580000,85,9),(11,3,440000,8,10),(12,1,580000,81,10),(13,1,520000,89,11),(14,10,520000,91,11),(15,2,260000,107,12),(16,1,260000,105,13),(17,1,580000,82,13),(18,1,580000,82,14),(19,1,580000,82,15),(20,1,580000,82,16),(21,1,580000,17,17),(22,3,520000,95,18),(23,0,440000,7,19),(24,1,440000,6,19),(25,3,580000,85,19),(26,3,580000,85,20),(27,1,260000,108,20),(28,2,260000,108,21),(29,1,400000,15,21),(30,1,580000,97,22),(31,2,580000,103,22),(42,1,580000,18,33);
/*!40000 ALTER TABLE `order_orderitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_orderpackage`
--

DROP TABLE IF EXISTS `order_orderpackage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_orderpackage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dateOrder` datetime(6) NOT NULL,
  `dateDelivery` datetime(6) NOT NULL,
  `receiver` varchar(128) NOT NULL,
  `receiverNumber` varchar(32) NOT NULL,
  `receiverAddress` varchar(255) NOT NULL,
  `note` longtext NOT NULL,
  `status` int(11) NOT NULL,
  `totalPayment` int(11) NOT NULL,
  `coupon_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `order_orderpackage_coupon_id_6e279c52_fk_coupon_coupon_id` (`coupon_id`),
  KEY `order_orderpackage_user_id_34d2117f_fk_account_user_id` (`user_id`),
  CONSTRAINT `order_orderpackage_coupon_id_6e279c52_fk_coupon_coupon_id` FOREIGN KEY (`coupon_id`) REFERENCES `coupon_coupon` (`id`),
  CONSTRAINT `order_orderpackage_user_id_34d2117f_fk_account_user_id` FOREIGN KEY (`user_id`) REFERENCES `account_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_orderpackage`
--

LOCK TABLES `order_orderpackage` WRITE;
/*!40000 ALTER TABLE `order_orderpackage` DISABLE KEYS */;
INSERT INTO `order_orderpackage` VALUES (1,'2020-04-08 00:00:00.000000','2020-05-11 00:00:00.000000','giang nd','098 765 4321','Ha noi','',5,374000,2,9),(2,'2020-05-04 00:00:00.000000','2020-05-11 00:00:00.000000','giang nd','098 765 4321','Ha noi','Đang mưa lũ k giao đc',4,440000,1,9),(6,'2020-05-09 00:00:00.000000','2020-05-16 00:00:00.000000','giang 123','3123123123123','3123123','',3,520000,1,33),(7,'2020-05-12 00:00:00.000000','2020-05-19 00:00:00.000000','Nguyễn Đình Giang','098 765 4321','DHCN Hà Nội','',3,1100000,1,9),(8,'2020-05-12 00:00:00.000000','2020-05-19 00:00:00.000000','Nguyễn Đình Giang','098 765 4321','DHCN Hà Nội','',3,580000,1,9),(9,'2020-05-12 00:00:00.000000','2020-05-19 00:00:00.000000','Nguyễn Đình Giang','098 765 4321','DHCN Hà Nội','',5,9860000,3,9),(10,'2020-05-12 00:00:00.000000','2020-05-19 00:00:00.000000','Nguyễn Đình Giang','098 765 4321','DHCN Hà Nội','',1,1615000,3,9),(11,'2020-05-14 10:16:47.000000','2020-05-21 10:16:47.000000','ND Giang','098 765 4321000','DHCN Hà Nội, Nhổn, Nguyên Xá, Bắc Từ Liêm','',5,5720000,1,35),(12,'2020-05-14 10:21:01.523559','2020-05-21 10:21:01.523572','ND Giang','098 765 4321000','DHCN Hà Nội, Nhổn, Nguyên Xá, Bắc Từ Liêm','',1,520000,1,35),(13,'2020-05-17 19:02:14.104758','2020-05-24 19:02:14.104766','Nguyễn Đình Giang','098 765 4321','DHCN Hà Nội','',1,840000,1,9),(14,'2020-05-06 19:07:29.000000','2020-05-12 19:07:29.000000','Nguyễn Đình Giang','098 765 4321','DHCN Hà Nội','',1,580000,1,9),(15,'2020-05-06 19:08:49.000000','2020-05-12 19:08:49.000000','Nguyễn Đình Giang','098 765 4321','DHCN Hà Nội','',1,580000,1,9),(16,'2020-05-08 19:12:08.000000','2020-05-15 19:12:08.000000','Nguyễn Đình Giang','098 765 4321','DHCN Hà Nội','',1,580000,1,9),(17,'2020-05-19 13:26:15.000000','2020-05-26 13:26:15.000000','tài khoản n','123444','ha noi','',3,580000,1,37),(18,'2020-03-18 16:19:36.000000','2020-05-27 16:19:36.000000','random1','098 765 4321','Ha Noi','',3,1560000,1,40),(19,'2020-05-22 08:23:18.992701','2020-05-29 08:23:18.992709','Nguyễn Đình Giang','098 765 4321','DHCN Hà Nội','',1,2180000,1,9),(20,'2020-05-22 08:43:13.447712','2020-05-29 08:43:13.447717','Nguyễn Đình Giang','098 765 4321','DHCN Hà Nội','',1,1600000,3,9),(21,'2020-05-22 14:03:20.000000','2020-05-29 14:03:20.000000','Nhan vien 1','098 765 4321','Ha Noi 1','',2,920000,1,39),(22,'2020-05-22 14:10:41.625984','2020-05-29 14:10:41.625993','Nguyễn Đình Giang','098 765 4321','DHCN Hà Nội','',1,1740000,1,9),(33,'2020-05-23 06:50:32.857290','2020-05-30 06:50:32.857300','ND Giang','098 765 4321','DHCN Ha Noi','',1,580000,1,34);
/*!40000 ALTER TABLE `order_orderpackage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `HOT_SHOES`
--

/*!50001 DROP VIEW IF EXISTS `HOT_SHOES`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `HOT_SHOES` AS select distinct `mainapp_shoe`.`id` AS `shoe_id`,`mainapp_shoe`.`shoeName` AS `shoeName`,`mainapp_shoe`.`shoeModel` AS `shoeModel`,`mainapp_shoe`.`viewCount` AS `viewCount`,`mainapp_shoe`.`quantitySold` AS `quantitySold`,`mainapp_shoe`.`favouriteCount` AS `favouriteCount`,`mainapp_shoe`.`shoeThumbnail` AS `shoeThumbnail`,`mainapp_category`.`categoryName` AS `categoryName`,`mainapp_detailshoe`.`newPrice` AS `newPrice`,((`mainapp_shoe`.`viewCount` + `mainapp_shoe`.`quantitySold`) + `mainapp_shoe`.`favouriteCount`) AS `hotCount` from ((`mainapp_shoe` join `mainapp_detailshoe` on((`mainapp_shoe`.`id` = `mainapp_detailshoe`.`shoe_id`))) join `mainapp_category` on((`mainapp_shoe`.`category_id` = `mainapp_category`.`id`))) where (`mainapp_shoe`.`active` = 1) order by `hotCount` desc limit 0,5 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `HOT_SHOES_NEXT`
--

/*!50001 DROP VIEW IF EXISTS `HOT_SHOES_NEXT`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `HOT_SHOES_NEXT` AS select distinct `mainapp_shoe`.`id` AS `shoe_id`,`mainapp_shoe`.`shoeName` AS `shoeName`,`mainapp_shoe`.`shoeModel` AS `shoeModel`,`mainapp_shoe`.`viewCount` AS `viewCount`,`mainapp_shoe`.`quantitySold` AS `quantitySold`,`mainapp_shoe`.`favouriteCount` AS `favouriteCount`,`mainapp_shoe`.`shoeThumbnail` AS `shoeThumbnail`,`mainapp_category`.`categoryName` AS `categoryName`,`mainapp_detailshoe`.`newPrice` AS `newPrice`,((`mainapp_shoe`.`viewCount` + `mainapp_shoe`.`quantitySold`) + `mainapp_shoe`.`favouriteCount`) AS `hotCount` from ((`mainapp_shoe` join `mainapp_detailshoe` on((`mainapp_shoe`.`id` = `mainapp_detailshoe`.`shoe_id`))) join `mainapp_category` on((`mainapp_shoe`.`category_id` = `mainapp_category`.`id`))) where (`mainapp_shoe`.`active` = 1) order by `hotCount` desc limit 5,5 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `NEW_SHOES`
--

/*!50001 DROP VIEW IF EXISTS `NEW_SHOES`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `NEW_SHOES` AS select distinct `mainapp_shoe`.`id` AS `shoe_id`,`mainapp_shoe`.`shoeName` AS `shoeName`,`mainapp_shoe`.`shoeModel` AS `shoeModel`,`mainapp_shoe`.`shoeThumbnail` AS `shoeThumbnail`,`mainapp_shoe`.`dateCreated` AS `dateCreated`,`mainapp_category`.`categoryName` AS `categoryName`,`mainapp_detailshoe`.`newPrice` AS `newPrice` from ((`mainapp_shoe` join `mainapp_detailshoe` on((`mainapp_shoe`.`id` = `mainapp_detailshoe`.`shoe_id`))) join `mainapp_category` on((`mainapp_shoe`.`category_id` = `mainapp_category`.`id`))) where (`mainapp_shoe`.`active` = 1) order by `mainapp_shoe`.`dateCreated` desc limit 0,5 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `NEW_SHOES_NEXT`
--

/*!50001 DROP VIEW IF EXISTS `NEW_SHOES_NEXT`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `NEW_SHOES_NEXT` AS select distinct `mainapp_shoe`.`id` AS `shoe_id`,`mainapp_shoe`.`shoeName` AS `shoeName`,`mainapp_shoe`.`shoeModel` AS `shoeModel`,`mainapp_shoe`.`shoeThumbnail` AS `shoeThumbnail`,`mainapp_shoe`.`dateCreated` AS `dateCreated`,`mainapp_category`.`categoryName` AS `categoryName`,`mainapp_detailshoe`.`newPrice` AS `newPrice` from ((`mainapp_shoe` join `mainapp_detailshoe` on((`mainapp_shoe`.`id` = `mainapp_detailshoe`.`shoe_id`))) join `mainapp_category` on((`mainapp_shoe`.`category_id` = `mainapp_category`.`id`))) where (`mainapp_shoe`.`active` = 1) order by `mainapp_shoe`.`dateCreated` desc limit 5,5 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-05-24 15:26:37

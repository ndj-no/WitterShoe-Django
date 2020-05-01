-- MySQL dump 10.13  Distrib 5.7.29, for Linux (x86_64)
--
-- Host: localhost    Database: wittershoedb
-- ------------------------------------------------------
-- Server version	5.7.29-0ubuntu0.18.04.1

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


drop database wittershoedb;
CREATE DATABASE wittershoedb CHARACTER SET utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_user`
--

LOCK TABLES `account_user` WRITE;
/*!40000 ALTER TABLE `account_user` DISABLE KEYS */;
INSERT INTO `account_user` VALUES (1,'pbkdf2_sha256$180000$GhDe2jfiXjod$48dL5zXbOIJlyzpMxfApgobyh8ZD9GjhDa37cOCBMP4=','2020-04-30 07:59:37.896202',1,'admin','','','123@abc.com',1,1,'2020-04-23 08:54:47.304450','','','','',1),(3,'pbkdf2_sha256$180000$FKK9x2N2L82d$KlV9Oj1lCx7q3cf2J6R1gV1srJQLDb1Ed0Jx98T3NGA=','2020-04-23 13:44:19.329647',0,'admin234','','','',0,1,'2020-04-23 13:44:19.143727','dfsdfsdfss','','3123123123123','',1),(4,'pbkdf2_sha256$180000$5VBDXcjNTUTj$tjb8pzPd5/qX3KItDJhA/mkdtK5/95W9iKDus4/cHA8=','2020-04-23 13:47:21.483075',0,'gianguser3','','','',0,1,'2020-04-23 13:47:21.287734','dfsdfsdfss','','3123123123123','',1),(5,'pbkdf2_sha256$180000$3ccBiRKUcwYi$DxH2wztIJ/6Oz8DM9Z8uvDA/PBQr3+Imdxt6Cgbkpnw=','2020-04-23 13:51:50.845786',0,'gianguser4','','','',0,1,'2020-04-23 13:51:50.649102','dfsdfsdfss','','3123123123123','',1),(6,'pbkdf2_sha256$180000$LkUbQRLX0hWo$DU4S1PewyAMSHos8uybhUvisUDw13jXoBFglo97fh80=','2020-04-23 13:52:51.633502',0,'gianguser5','','','',0,1,'2020-04-23 13:52:51.447232','dfsdfsdfss','','3123123123123','',1),(7,'pbkdf2_sha256$180000$jxSFPUe0hvkd$45cWjA8NDRJCyWcNQjxG9QVCoH3XwlF1H5t2QdB4jX8=','2020-04-23 13:55:56.356090',0,'gianguser6','','','',0,1,'2020-04-23 13:55:56.186061','dfsdfsdfss','','3123123123123','',1),(8,'pbkdf2_sha256$180000$StsF98H7uhM0$Rk6wvpdoH0To2LWx6e/23aeMRWe3JCV0d3RRo4m3PL4=','2020-04-23 14:03:08.193304',0,'gianguser7','','','',0,1,'2020-04-23 14:03:07.999118','dfsdfsdfss','','3123123123123','',1),(9,'pbkdf2_sha256$180000$C2TpmhQrsM9s$0zoagmXn40ToUKu2HIdDqNZlQe4CAaP52ZuFrcUt0C0=','2020-04-30 09:06:06.742195',0,'giang','','','',0,1,'2020-04-28 09:35:05.088767','giang nd','','098 765 4321','Ha noi',1),(10,'pbkdf2_sha256$180000$swkb9MA292px$vnd1O2F0pITNFTPuLP+aSelpxv+fH+HdxQN1f7CG+U8=','2020-04-30 08:38:51.161790',0,'giang2','','','',0,1,'2020-04-30 08:38:50.975183','giang nd','','3123123123123','England',1);
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_user_groups`
--

LOCK TABLES `account_user_groups` WRITE;
/*!40000 ALTER TABLE `account_user_groups` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_user_user_permissions`
--

LOCK TABLES `account_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `account_user_user_permissions` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add content type',4,'add_contenttype'),(14,'Can change content type',4,'change_contenttype'),(15,'Can delete content type',4,'delete_contenttype'),(16,'Can view content type',4,'view_contenttype'),(17,'Can add session',5,'add_session'),(18,'Can change session',5,'change_session'),(19,'Can delete session',5,'delete_session'),(20,'Can view session',5,'view_session'),(21,'Can add user',6,'add_user'),(22,'Can change user',6,'change_user'),(23,'Can delete user',6,'delete_user'),(24,'Can view user',6,'view_user'),(25,'Can add brand',7,'add_brand'),(26,'Can change brand',7,'change_brand'),(27,'Can delete brand',7,'delete_brand'),(28,'Can view brand',7,'view_brand'),(29,'Can add category',8,'add_category'),(30,'Can change category',8,'change_category'),(31,'Can delete category',8,'delete_category'),(32,'Can view category',8,'view_category'),(33,'Can add color',9,'add_color'),(34,'Can change color',9,'change_color'),(35,'Can delete color',9,'delete_color'),(36,'Can view color',9,'view_color'),(37,'Can add coupon',10,'add_coupon'),(38,'Can change coupon',10,'change_coupon'),(39,'Can delete coupon',10,'delete_coupon'),(40,'Can view coupon',10,'view_coupon'),(41,'Can add detail shoe',11,'add_detailshoe'),(42,'Can change detail shoe',11,'change_detailshoe'),(43,'Can delete detail shoe',11,'delete_detailshoe'),(44,'Can view detail shoe',11,'view_detailshoe'),(45,'Can add order package status',12,'add_orderpackagestatus'),(46,'Can change order package status',12,'change_orderpackagestatus'),(47,'Can delete order package status',12,'delete_orderpackagestatus'),(48,'Can view order package status',12,'view_orderpackagestatus'),(49,'Can add shoe',13,'add_shoe'),(50,'Can change shoe',13,'change_shoe'),(51,'Can delete shoe',13,'delete_shoe'),(52,'Can view shoe',13,'view_shoe'),(53,'Can add order package',14,'add_orderpackage'),(54,'Can change order package',14,'change_orderpackage'),(55,'Can delete order package',14,'delete_orderpackage'),(56,'Can view order package',14,'view_orderpackage'),(57,'Can add order item',15,'add_orderitem'),(58,'Can change order item',15,'change_orderitem'),(59,'Can delete order item',15,'delete_orderitem'),(60,'Can view order item',15,'view_orderitem'),(61,'Can add image',16,'add_image'),(62,'Can change image',16,'change_image'),(63,'Can delete image',16,'delete_image'),(64,'Can view image',16,'view_image'),(65,'Can add favourite',17,'add_favourite'),(66,'Can change favourite',17,'change_favourite'),(67,'Can delete favourite',17,'delete_favourite'),(68,'Can view favourite',17,'view_favourite'),(69,'Can add cart',18,'add_cart'),(70,'Can change cart',18,'change_cart'),(71,'Can delete cart',18,'delete_cart'),(72,'Can view cart',18,'view_cart'),(73,'Can add feedback',19,'add_feedback'),(74,'Can change feedback',19,'change_feedback'),(75,'Can delete feedback',19,'delete_feedback'),(76,'Can view feedback',19,'view_feedback'),(77,'Can add coupon',20,'add_coupon'),(78,'Can change coupon',20,'change_coupon'),(79,'Can delete coupon',20,'delete_coupon'),(80,'Can view coupon',20,'view_coupon'),(81,'Can add order package status',21,'add_orderpackagestatus'),(82,'Can change order package status',21,'change_orderpackagestatus'),(83,'Can delete order package status',21,'delete_orderpackagestatus'),(84,'Can view order package status',21,'view_orderpackagestatus'),(85,'Can add cart',22,'add_cart'),(86,'Can change cart',22,'change_cart'),(87,'Can delete cart',22,'delete_cart'),(88,'Can view cart',22,'view_cart'),(89,'Can add order item',23,'add_orderitem'),(90,'Can change order item',23,'change_orderitem'),(91,'Can delete order item',23,'delete_orderitem'),(92,'Can view order item',23,'view_orderitem'),(93,'Can add order package',24,'add_orderpackage'),(94,'Can change order package',24,'change_orderpackage'),(95,'Can delete order package',24,'delete_orderpackage'),(96,'Can view order package',24,'view_orderpackage');
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_cart`
--

LOCK TABLES `cart_cart` WRITE;
/*!40000 ALTER TABLE `cart_cart` DISABLE KEYS */;
INSERT INTO `cart_cart` VALUES (1,2,7,9),(2,3,87,9),(3,1,5,9);
/*!40000 ALTER TABLE `cart_cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_orderitem`
--

DROP TABLE IF EXISTS `cart_orderitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cart_orderitem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `quantity` int(11) NOT NULL,
  `itemPrice` int(11) NOT NULL,
  `detailShoe_id` int(11) NOT NULL,
  `orderPackage_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cart_orderitem_detailShoe_id_305aec83_fk_mainapp_detailshoe_id` (`detailShoe_id`),
  KEY `cart_orderitem_orderPackage_id_1a018f55_fk_cart_orderpackage_id` (`orderPackage_id`),
  CONSTRAINT `cart_orderitem_detailShoe_id_305aec83_fk_mainapp_detailshoe_id` FOREIGN KEY (`detailShoe_id`) REFERENCES `mainapp_detailshoe` (`id`),
  CONSTRAINT `cart_orderitem_orderPackage_id_1a018f55_fk_cart_orderpackage_id` FOREIGN KEY (`orderPackage_id`) REFERENCES `cart_orderpackage` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_orderitem`
--

LOCK TABLES `cart_orderitem` WRITE;
/*!40000 ALTER TABLE `cart_orderitem` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart_orderitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_orderpackage`
--

DROP TABLE IF EXISTS `cart_orderpackage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cart_orderpackage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dateOrder` date NOT NULL,
  `dateDelivery` date NOT NULL,
  `receiver` varchar(128) NOT NULL,
  `receiverNumber` varchar(32) NOT NULL,
  `receiverAddress` varchar(255) NOT NULL,
  `note` varchar(255) NOT NULL,
  `status` int(11) NOT NULL,
  `totalPayment` int(11) NOT NULL,
  `orderPackageNote` varchar(255) NOT NULL,
  `coupon_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cart_orderpackage_coupon_id_454a494e_fk_coupon_coupon_id` (`coupon_id`),
  KEY `cart_orderpackage_user_id_2a6ea7fc_fk_account_user_id` (`user_id`),
  CONSTRAINT `cart_orderpackage_coupon_id_454a494e_fk_coupon_coupon_id` FOREIGN KEY (`coupon_id`) REFERENCES `coupon_coupon` (`id`),
  CONSTRAINT `cart_orderpackage_user_id_2a6ea7fc_fk_account_user_id` FOREIGN KEY (`user_id`) REFERENCES `account_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_orderpackage`
--

LOCK TABLES `cart_orderpackage` WRITE;
/*!40000 ALTER TABLE `cart_orderpackage` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart_orderpackage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_orderpackagestatus`
--

DROP TABLE IF EXISTS `cart_orderpackagestatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cart_orderpackagestatus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `statusName` varchar(128) NOT NULL,
  `statusDesc` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_orderpackagestatus`
--

LOCK TABLES `cart_orderpackagestatus` WRITE;
/*!40000 ALTER TABLE `cart_orderpackagestatus` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart_orderpackagestatus` ENABLE KEYS */;
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_us_feedback`
--

LOCK TABLES `contact_us_feedback` WRITE;
/*!40000 ALTER TABLE `contact_us_feedback` DISABLE KEYS */;
INSERT INTO `contact_us_feedback` VALUES (1,'Harry Potter','sth@gmail.com','the subject','content j do','2020-04-23');
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
  PRIMARY KEY (`id`),
  UNIQUE KEY `couponCode` (`couponCode`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coupon_coupon`
--

LOCK TABLES `coupon_coupon` WRITE;
/*!40000 ALTER TABLE `coupon_coupon` DISABLE KEYS */;
INSERT INTO `coupon_coupon` VALUES (1,'Giảm 15% khi thanh toán online','ONLINEPAYMENT','2022-12-31',15,0,'Website chưa có chức năng thanh toán online.Coupon trên chỉ làm cảnh :)))');
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2020-04-24 16:21:00.516914','1','Coupon object (1)',1,'[{\"added\": {}}]',20,1),(2,'2020-04-24 16:55:34.904424','1','id(1) _ title(Giảm 15% khi thanh toán online) _ code(ONLINEPAYMENT) _ date(2022-12-31) _ rate(15 %) _ amount(0 đ)',2,'[{\"changed\": {\"fields\": [\"CouponCode\"]}}]',20,1),(3,'2020-04-28 15:53:17.262680','1','Cart( id:1 _ username:giang _ shoe:Giày lười Louis Vuitton họa tiết da nhăn GLLV25 _ quantity:2 )',1,'[{\"added\": {}}]',22,1),(4,'2020-04-28 15:57:43.417283','2','Cart( id:2 _ username:giang _ shoe:Giày thể thao B771 _ quantity:3 )',1,'[{\"added\": {}}]',22,1),(5,'2020-04-28 16:43:50.292773','3','Cart( id:3 _ username:giang _ shoe:Giày lười Louis Vuitton họa tiết da nhăn GLLV25 _ quantity:1 )',1,'[{\"added\": {}}]',22,1),(6,'2020-04-29 12:18:23.691589','7','DetailShoe( id:7 _ shoeName:Giày lười Louis Vuitton họa tiết da nhăn GLLV25 _ color:Đen _ size:43 _ quantityAvailable:0 _ oldPrice:520000 _ newPrice:440000 )',2,'[{\"changed\": {\"fields\": [\"QuantityAvailable\"]}}]',11,1),(7,'2020-04-29 12:18:25.289011','1','Cart( id:1 _ username:giang _ shoe:Giày lười Louis Vuitton họa tiết da nhăn GLLV25 _ quantity:2 )',2,'[]',22,1),(8,'2020-04-30 08:00:38.796332','4','Cart( id:4 _ username:giang _ shoe:Giày thể thao B967 _ quantity:2 )',3,'',22,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (6,'account','user'),(1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(22,'cart','cart'),(23,'cart','orderitem'),(24,'cart','orderpackage'),(21,'cart','orderpackagestatus'),(19,'contact_us','feedback'),(4,'contenttypes','contenttype'),(20,'coupon','coupon'),(7,'mainapp','brand'),(18,'mainapp','cart'),(8,'mainapp','category'),(9,'mainapp','color'),(10,'mainapp','coupon'),(11,'mainapp','detailshoe'),(17,'mainapp','favourite'),(16,'mainapp','image'),(15,'mainapp','orderitem'),(14,'mainapp','orderpackage'),(12,'mainapp','orderpackagestatus'),(13,'mainapp','shoe'),(5,'sessions','session');
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
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2020-04-22 18:19:40.061434'),(2,'contenttypes','0002_remove_content_type_name','2020-04-22 18:19:40.132433'),(3,'auth','0001_initial','2020-04-22 18:19:40.213955'),(4,'auth','0002_alter_permission_name_max_length','2020-04-22 18:19:40.423000'),(5,'auth','0003_alter_user_email_max_length','2020-04-22 18:19:40.438514'),(6,'auth','0004_alter_user_username_opts','2020-04-22 18:19:40.446450'),(7,'auth','0005_alter_user_last_login_null','2020-04-22 18:19:40.455319'),(8,'auth','0006_require_contenttypes_0002','2020-04-22 18:19:40.459087'),(9,'auth','0007_alter_validators_add_error_messages','2020-04-22 18:19:40.467531'),(10,'auth','0008_alter_user_username_max_length','2020-04-22 18:19:40.477880'),(11,'auth','0009_alter_user_last_name_max_length','2020-04-22 18:19:40.487278'),(12,'auth','0010_alter_group_name_max_length','2020-04-22 18:19:40.533971'),(13,'auth','0011_update_proxy_permissions','2020-04-22 18:19:40.542827'),(14,'account','0001_initial','2020-04-22 18:19:40.627258'),(15,'admin','0001_initial','2020-04-22 18:19:40.864793'),(16,'admin','0002_logentry_remove_auto_add','2020-04-22 18:19:40.969173'),(17,'admin','0003_logentry_add_action_flag_choices','2020-04-22 18:19:40.982281'),(18,'mainapp','0001_initial','2020-04-22 18:19:41.410255'),(19,'sessions','0001_initial','2020-04-22 18:19:41.957183'),(20,'account','0002_user_gender','2020-04-23 13:31:34.997270'),(21,'contact_us','0001_initial','2020-04-23 15:48:59.194315'),(22,'contact_us','0002_auto_20200423_2255','2020-04-23 15:55:56.859286'),(23,'contact_us','0003_auto_20200423_2303','2020-04-23 16:03:10.915315'),(24,'coupon','0001_initial','2020-04-24 10:20:04.660685'),(25,'mainapp','0002_auto_20200424_1719','2020-04-24 10:20:04.757245'),(26,'coupon','0002_auto_20200428_1642','2020-04-28 09:42:08.581939'),(27,'mainapp','0003_auto_20200428_1642','2020-04-28 09:42:08.949400'),(28,'mainapp','0004_delete_favourite','2020-04-28 10:43:42.337403'),(29,'cart','0001_initial','2020-04-28 10:43:42.484862');
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
INSERT INTO `django_session` VALUES ('4heo6721qeu39l7f5jg3932z10hk5fky','Nzk1MzdmOGFmMjE1YTk1MmQ0ZTk0NGZjZmNkM2NhZGNmZGEzOWVlMTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3OWJiYzIwM2I2MTlmNzE5MWQ2ZjE1N2UyNTZlYmUxYzdiODFmOThmIn0=','2020-05-12 14:57:30.626845'),('iau5fvpczkig0t2m80yi3lascwwvmr10','M2I2NWY4ZGYxZjk4NDAwN2ExYWI3MmI4NDY1NWU0NjNiYjAzZjY5Nzp7Il9zZXNzaW9uX2V4cGlyeSI6MCwiX2F1dGhfdXNlcl9pZCI6IjkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjVmYjhhYzI5ODZjMzg0ZGYyYTY4YzdkMTIyNjU3MWVkYTY0YTI5YjkifQ==','2020-05-14 09:06:06.747337'),('my1vutbpmlh14zgifrxppzbbpc8w873o','Nzk1MzdmOGFmMjE1YTk1MmQ0ZTk0NGZjZmNkM2NhZGNmZGEzOWVlMTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3OWJiYzIwM2I2MTlmNzE5MWQ2ZjE1N2UyNTZlYmUxYzdiODFmOThmIn0=','2020-05-14 07:59:37.900402'),('snr22dryvrg7kadmuzqg2jrn5l1j8u2o','Nzk1MzdmOGFmMjE1YTk1MmQ0ZTk0NGZjZmNkM2NhZGNmZGEzOWVlMTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3OWJiYzIwM2I2MTlmNzE5MWQ2ZjE1N2UyNTZlYmUxYzdiODFmOThmIn0=','2020-05-13 07:14:16.995786');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mainapp_detailshoe`
--

LOCK TABLES `mainapp_detailshoe` WRITE;
/*!40000 ALTER TABLE `mainapp_detailshoe` DISABLE KEYS */;
INSERT INTO `mainapp_detailshoe` VALUES (1,41,20,560000,480000,'',1,1),(2,42,10,560000,480000,'',1,1),(3,43,15,560000,480000,'',1,1),(4,44,1,560000,480000,'',1,1),(5,41,20,520000,440000,'',1,2),(6,42,30,520000,440000,'',1,2),(7,43,0,520000,440000,'',1,2),(8,44,8,520000,440000,'',1,2),(9,41,10,600000,520000,'',1,3),(10,42,12,600000,520000,'',1,3),(11,43,18,600000,520000,'',1,3),(12,44,9,600000,520000,'',1,3),(13,41,11,480000,400000,'',1,4),(14,42,22,480000,400000,'',1,4),(15,43,38,480000,400000,'',1,4),(16,44,9,480000,400000,'',1,4),(17,41,20,650000,580000,'',1,5),(18,42,30,650000,580000,'',1,5),(19,43,10,650000,580000,'',1,5),(20,44,8,650000,580000,'',1,5),(81,41,20,660000,580000,'',1,6),(82,42,30,660000,580000,'',1,6),(83,43,10,660000,580000,'',1,6),(84,44,28,660000,580000,'',1,6),(85,41,20,660000,580000,'',2,6),(86,42,30,660000,580000,'',2,6),(87,43,10,660000,580000,'',2,6),(88,44,8,660000,580000,'',2,6),(89,41,20,620000,530000,'',1,7),(90,42,30,620000,520000,'',1,7),(91,43,10,620000,520000,'',1,7),(92,44,8,620000,520000,'',1,7),(93,41,20,620000,520000,'',2,7),(94,42,30,620000,520000,'',2,7),(95,43,10,620000,520000,'',2,7),(96,44,8,620000,520000,'',2,7),(97,41,20,700000,580000,'',1,8),(98,42,30,700000,580000,'',1,8),(99,43,10,700000,580000,'',1,8),(100,44,8,700000,580000,'',1,8),(101,41,20,700000,580000,'',2,8),(102,42,30,700000,580000,'',2,8),(103,43,10,700000,580000,'',2,8),(104,44,8,700000,580000,'',2,8),(105,39,20,330000,260000,'',2,9),(106,40,30,330000,260000,'',2,9),(107,41,10,330000,260000,'',2,9),(108,42,28,330000,260000,'',2,9),(109,43,38,330000,260000,'',2,9),(110,44,8,330000,260000,'',2,9);
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
  `imageName` varchar(255) NOT NULL,
  `imageDesc` varchar(64) NOT NULL,
  `shoe_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mainapp_image_shoe_id_391fe90b_fk_mainapp_shoe_id` (`shoe_id`),
  CONSTRAINT `mainapp_image_shoe_id_391fe90b_fk_mainapp_shoe_id` FOREIGN KEY (`shoe_id`) REFERENCES `mainapp_shoe` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mainapp_image`
--

LOCK TABLES `mainapp_image` WRITE;
/*!40000 ALTER TABLE `mainapp_image` DISABLE KEYS */;
INSERT INTO `mainapp_image` VALUES (1,'GLLV12_1.jpg','',1),(2,'GLLV12_2.jpg','',1),(3,'GLLV12_3.jpg','',1),(4,'GLLV12_4.jpg','',1),(5,'GLLV12_5.jpg','',1),(6,'GLLV25_1.jpg','',2),(7,'GLLV25_2.jpg','',2),(8,'GLLV25_3.jpg','',2),(9,'GLLV25_4.jpg','',2),(10,'GLLV25_5.jpg','',2),(11,'GLLV09_1.jpg','',3),(12,'GLLV09_2.jpg','',3),(13,'GLLV09_3.jpg','',3),(14,'GLLV09_4.jpg','',3),(15,'GLLV09_5.jpg','',3),(16,'GLLV22_1.jpg','',4),(17,'GLLV22_2.jpg','',4),(18,'GLLV22_3.jpg','',4),(19,'GLLV22_4.jpg','',4),(20,'GLLV22_5.jpg','',4),(21,'GLV08_1.jpg','',5),(22,'GLV08_2.jpg','',5),(23,'GLV08_3.jpg','',5),(24,'GLV08_4.jpg','',5),(25,'GLV08_5.jpg','',5),(26,'B771_1.jpg','',6),(27,'B771_2.jpg','',6),(28,'B771_3.jpg','',6),(29,'B771_4.jpg','',6),(30,'B771_5.jpg','',6),(31,'B798_1.jpg','',7),(32,'B798_2.jpg','',7),(33,'B798_3.jpg','',7),(34,'B798_4.jpg','',7),(35,'B798_5.jpg','',7),(36,'B967_1.jpg','',8),(37,'B967_2.jpg','',8),(38,'B967_3.jpg','',8),(39,'B967_4.jpg','',8),(40,'B967_5.jpg','',8),(41,'B536_1.jpg','',9),(42,'B536_2.jpg','',9),(43,'B536_3.jpg','',9),(44,'B536_4.jpg','',9),(45,'B536_5.jpg','',9);
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
  `shoeThumbnail` varchar(255) NOT NULL,
  `active` int(11) NOT NULL,
  `quantitySold` int(11) NOT NULL,
  `viewCount` int(11) NOT NULL,
  `favouriteCount` int(11) NOT NULL,
  `dateCreated` datetime(6) NOT NULL,
  `shoeDesc` varchar(2048) NOT NULL,
  `brand_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mainapp_shoe_brand_id_623c0182_fk_mainapp_brand_id` (`brand_id`),
  KEY `mainapp_shoe_category_id_8c8cc3d8_fk_mainapp_category_id` (`category_id`),
  CONSTRAINT `mainapp_shoe_brand_id_623c0182_fk_mainapp_brand_id` FOREIGN KEY (`brand_id`) REFERENCES `mainapp_brand` (`id`),
  CONSTRAINT `mainapp_shoe_category_id_8c8cc3d8_fk_mainapp_category_id` FOREIGN KEY (`category_id`) REFERENCES `mainapp_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mainapp_shoe`
--

LOCK TABLES `mainapp_shoe` WRITE;
/*!40000 ALTER TABLE `mainapp_shoe` DISABLE KEYS */;
INSERT INTO `mainapp_shoe` VALUES (1,'Giày lười Louis Vuitton họa tiết bàn cờ GLLV12','GLLV12_1.jpg',1,550,1500,1000,'2019-09-02 00:00:00.000000','Giày êm chạy không đau chân',1,2),(2,'Giày lười Louis Vuitton họa tiết da nhăn GLLV25','GLLV25_1.jpg',1,370,1100,2200,'2020-02-22 00:00:00.000000','Giày êm chạy không đau chân',1,2),(3,'Giày lười Louis Vuitton họa tiết ô rạn GLLV09','GLLV09_1.jpg',1,480,1900,1600,'2020-02-12 00:00:00.000000','Giày êm chạy không đau chân',1,2),(4,'Giày lười Louis Vuitton like au họa tiết rạn GLLV22','GLLV22_1.jpg',1,290,2000,1900,'2020-01-12 00:00:00.000000','Giày êm chạy không đau chân',1,2),(5,'Giày lười Versace họa tiết vân lá GLV08','GLV08_1.jpg',1,350,3000,2000,'2020-03-20 00:00:00.000000','Giày êm chạy không đau chân',1,2),(6,'Giày thể thao B771','B771_1.jpg',1,270,1400,1970,'2020-02-02 00:00:00.000000','Giày êm chạy không đau chân',1,3),(7,'Giày thể thao B798','B798_1.jpg',1,790,2100,2300,'2019-08-19 00:00:00.000000','Giày êm chạy không đau chân',1,3),(8,'Giày thể thao B967','B967_1.jpg',1,400,1600,2200,'2019-12-12 00:00:00.000000','Giày êm chạy không đau chân',1,3),(9,'Giày bata B536','B536_1.jpg',1,420,1800,2700,'2019-12-29 00:00:00.000000','Giày êm chạy không đau chân',1,6);
/*!40000 ALTER TABLE `mainapp_shoe` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-05-01 22:45:10

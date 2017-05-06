-- MySQL dump 10.13  Distrib 5.6.27, for Win64 (x86_64)
--
-- Host: localhost    Database: paternity_test_customer_info_collection
-- ------------------------------------------------------
-- Server version	5.6.27-log

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
-- Table structure for table `customer_tracking`
--

DROP TABLE IF EXISTS `customer_tracking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_tracking` (
  `id` varchar(255) NOT NULL DEFAULT '',
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `province` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `contact_mobile` varchar(255) DEFAULT NULL,
  `contact_weixin` varchar(255) DEFAULT NULL,
  `contact_tel` varchar(255) DEFAULT NULL,
  `contact_qq` varchar(255) DEFAULT NULL,
  `identification_type` tinyint(2) NOT NULL COMMENT '1.上户口 2.无创 3.个人 4.其它',
  `gestational_age` int(11) NOT NULL COMMENT '孕周',
  `child_age` int(11) NOT NULL,
  `comment` text NOT NULL,
  `result` varchar(255) NOT NULL,
  `dialogue_effectiveness` tinyint(2) NOT NULL DEFAULT '1' COMMENT '0.对话有效 1.对话无效',
  `access_mode` tinyint(2) NOT NULL DEFAULT '3' COMMENT '1.400电话 2.商务通PC端 3.移动端',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_tracking`
--

LOCK TABLES `customer_tracking` WRITE;
/*!40000 ALTER TABLE `customer_tracking` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_tracking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recv_mail_reg`
--

DROP TABLE IF EXISTS `recv_mail_reg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recv_mail_reg` (
  `id` varchar(255) NOT NULL,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `recv_mail_time` datetime DEFAULT NULL,
  `recipient_name` varchar(255) DEFAULT NULL COMMENT '收件人',
  `sender_name` varchar(255) DEFAULT NULL,
  `sender_address` varchar(255) DEFAULT NULL,
  `sender_phone` varchar(255) DEFAULT NULL COMMENT '寄件人电话号码',
  `express_order` varchar(255) DEFAULT NULL COMMENT '快递单号',
  `mail_payment_method` tinyint(2) DEFAULT NULL COMMENT '邮件寄件方式：1.已付，2.到付',
  `mail_content` varchar(255) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `customer_tracking_id` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recv_mail_reg`
--

LOCK TABLES `recv_mail_reg` WRITE;
/*!40000 ALTER TABLE `recv_mail_reg` DISABLE KEYS */;
/*!40000 ALTER TABLE `recv_mail_reg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `send_mail_reg`
--

DROP TABLE IF EXISTS `send_mail_reg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `send_mail_reg` (
  `id` varchar(255) NOT NULL,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `recv_mail_time` datetime NOT NULL,
  `recipient_name` varchar(255) DEFAULT NULL COMMENT '收件人',
  `sender_name` varchar(255) DEFAULT NULL,
  `sender_address` varchar(255) DEFAULT NULL,
  `sender_phone` varchar(255) DEFAULT NULL COMMENT '寄件人电话号码',
  `express_order` varchar(255) DEFAULT NULL COMMENT '快递单号',
  `mail_payment_method` tinyint(2) DEFAULT NULL COMMENT '邮件寄件方式：1.已付，2.到付',
  `mail_content` varchar(255) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `customer_tracking_id` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `send_mail_reg`
--

LOCK TABLES `send_mail_reg` WRITE;
/*!40000 ALTER TABLE `send_mail_reg` DISABLE KEYS */;
/*!40000 ALTER TABLE `send_mail_reg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_resource`
--

DROP TABLE IF EXISTS `sys_resource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_resource` (
  `id` bigint(20) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `url` varchar(200) DEFAULT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  `parent_ids` varchar(100) DEFAULT NULL,
  `permission` varchar(100) DEFAULT NULL,
  `available` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_resource`
--

LOCK TABLES `sys_resource` WRITE;
/*!40000 ALTER TABLE `sys_resource` DISABLE KEYS */;
INSERT INTO `sys_resource` VALUES (1,'资源','all',NULL,0,'0/',NULL,1);
/*!40000 ALTER TABLE `sys_resource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role`
--

DROP TABLE IF EXISTS `sys_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_role` (
  `id` bigint(20) NOT NULL,
  `role` varchar(64) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `resource_ids` varchar(100) DEFAULT NULL,
  `available` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role`
--

LOCK TABLES `sys_role` WRITE;
/*!40000 ALTER TABLE `sys_role` DISABLE KEYS */;
INSERT INTO `sys_role` VALUES (1,'admin','超级管理员','1',1);
/*!40000 ALTER TABLE `sys_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user`
--

DROP TABLE IF EXISTS `sys_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_user` (
  `id` int(2) NOT NULL,
  `username` varchar(64) DEFAULT NULL,
  `password` varchar(64) DEFAULT NULL,
  `salt` varchar(64) DEFAULT NULL,
  `role_ids` varchar(255) DEFAULT NULL,
  `locked` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user`
--

LOCK TABLES `sys_user` WRITE;
/*!40000 ALTER TABLE `sys_user` DISABLE KEYS */;
INSERT INTO `sys_user` VALUES (1,'admin','d3c59d25033dbf980d29554025c23a75','8d78869f470951332959580424d4bf4f','1',0);
/*!40000 ALTER TABLE `sys_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tracking_time`
--

DROP TABLE IF EXISTS `tracking_time`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tracking_time` (
  `id` varchar(255) NOT NULL,
  `tracking_time` datetime NOT NULL,
  `customer_tracking_id` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tracking_time`
--

LOCK TABLES `tracking_time` WRITE;
/*!40000 ALTER TABLE `tracking_time` DISABLE KEYS */;
/*!40000 ALTER TABLE `tracking_time` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaction_report`
--

DROP TABLE IF EXISTS `transaction_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transaction_report` (
  `id` varchar(255) NOT NULL DEFAULT '',
  `close_time` datetime NOT NULL COMMENT '成交时间',
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `customer_tracking_id` varchar(255) NOT NULL,
  `sample_father` tinyint(2) NOT NULL COMMENT '0.无 1.口腔试纸 2.血痕 3.外周血 4.头发 5.精液',
  `sample_child` tinyint(2) NOT NULL COMMENT '0.无 1.牙齿 2.血痕 3.头发 4.外周血',
  `sample_mon` tinyint(2) NOT NULL COMMENT '0.无 1.牙齿 2.血痕 3.头发 4.外周血',
  `payment_method` tinyint(2) NOT NULL COMMENT '0.其它 1.支付宝 2.现金 3.银行汇款 4.微信 5.代理',
  `amount` decimal(10,2) NOT NULL,
  `comment` varchar(255) NOT NULL,
  `mail_address` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaction_report`
--

LOCK TABLES `transaction_report` WRITE;
/*!40000 ALTER TABLE `transaction_report` DISABLE KEYS */;
/*!40000 ALTER TABLE `transaction_report` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-05-06  9:42:35

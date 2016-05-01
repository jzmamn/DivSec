-- MySQL dump 10.13  Distrib 5.7.9, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: divsec
-- ------------------------------------------------------
-- Server version	5.7.10-log

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
-- Table structure for table `aproval`
--

DROP TABLE IF EXISTS `aproval`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aproval` (
  `app_id` int(11) NOT NULL AUTO_INCREMENT,
  `app_request_id` int(11) NOT NULL,
  `app_is_approved` bit(1) DEFAULT NULL,
  `app_date` datetime DEFAULT NULL,
  `app_ent_date` datetime DEFAULT NULL,
  `app_user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`app_id`),
  KEY `fk_app_request_id_idx` (`app_request_id`),
  CONSTRAINT `fk_app_request_id` FOREIGN KEY (`app_request_id`) REFERENCES `request` (`req_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aproval`
--

LOCK TABLES `aproval` WRITE;
/*!40000 ALTER TABLE `aproval` DISABLE KEYS */;
/*!40000 ALTER TABLE `aproval` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `division`
--

DROP TABLE IF EXISTS `division`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `division` (
  `div_id` int(11) NOT NULL AUTO_INCREMENT,
  `div_name` varchar(50) DEFAULT NULL,
  `div_active` bit(1) DEFAULT NULL,
  PRIMARY KEY (`div_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `division`
--

LOCK TABLES `division` WRITE;
/*!40000 ALTER TABLE `division` DISABLE KEYS */;
INSERT INTO `division` VALUES (1,'Admin',''),(2,'Planning',''),(3,'Registrar',''),(4,'Agriculture',''),(5,'Accounts',''),(6,'ABC','');
/*!40000 ALTER TABLE `division` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_setup`
--

DROP TABLE IF EXISTS `email_setup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `email_setup` (
  `email_id` int(11) NOT NULL AUTO_INCREMENT,
  `email_is_out_look` binary(1) DEFAULT NULL,
  `email_sender_name` varchar(100) DEFAULT NULL,
  `email_sender_email` varchar(100) DEFAULT NULL,
  `email_server_name` varchar(50) DEFAULT NULL,
  `email_port` varchar(6) DEFAULT NULL,
  `email_user_name` varchar(100) DEFAULT NULL,
  `email_password` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`email_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_setup`
--

LOCK TABLES `email_setup` WRITE;
/*!40000 ALTER TABLE `email_setup` DISABLE KEYS */;
/*!40000 ALTER TABLE `email_setup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gender`
--

DROP TABLE IF EXISTS `gender`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gender` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gender` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gender`
--

LOCK TABLES `gender` WRITE;
/*!40000 ALTER TABLE `gender` DISABLE KEYS */;
INSERT INTO `gender` VALUES (1,'Male'),(2,'Female'),(3,'Other');
/*!40000 ALTER TABLE `gender` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `instructions`
--

DROP TABLE IF EXISTS `instructions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `instructions` (
  `ins_id` int(11) NOT NULL AUTO_INCREMENT,
  `ins_pr_id` int(11) DEFAULT NULL,
  `ins_instruction` varchar(500) DEFAULT NULL,
  `ins_date` datetime DEFAULT NULL,
  `ins_is_read` bit(1) DEFAULT NULL,
  `ins_stf_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`ins_id`),
  KEY `fk_ins_pr_id_idx` (`ins_pr_id`),
  CONSTRAINT `fk_ins_pr_id` FOREIGN KEY (`ins_pr_id`) REFERENCES `request` (`req_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instructions`
--

LOCK TABLES `instructions` WRITE;
/*!40000 ALTER TABLE `instructions` DISABLE KEYS */;
INSERT INTO `instructions` VALUES (1,12,'IAny candidate, who is unable to sit for an examination paper or the examination due to illness, should submit Medical Certificate and submission form with relevant details “within seven working days with effect from exam date” to the Examinations & Registration Branch.','2016-01-14 01:52:18','\0',23),(2,11,'this is jezeem aymen','2016-01-14 01:52:18','\0',23),(3,11,'IAny candidate, who is unable to sit for an examination paper or the examination due to illness, should submit Medical Certificate and submission form with relevant details “within seven working days with effect from exam date” to the Examinations & Registration Branch.','2016-01-14 01:53:14','\0',23),(4,10,'this is jezeem aymen','2016-01-14 01:53:56','\0',23),(5,13,'IAny candidate, who is unable to sit for an examination paper or the examination due to illness, should submit Medical Certificate and submission form with relevant details “within seven working days with effect from exam date” to the Examinations & Registration Branch.','2016-01-14 04:29:33','\0',23),(6,13,'this is jezeem aymen','2016-01-14 04:56:36','\0',23),(7,13,'IAny candidate, who is unable to sit for an examination paper or the examination due to illness, should submit Medical Certificate and submission form with relevant details “within seven working days with effect from exam date” to the Examinations & Registration Branch.','2016-01-14 04:58:14','\0',23),(8,13,'this is jezeem aymen','2016-01-14 05:01:38','\0',23),(9,13,'IAny candidate, who is unable to sit for an examination paper or the examination due to illness, should submit Medical Certificate and submission form with relevant details “within seven working days with effect from exam date” to the Examinations & Registration Branch.','2016-01-14 05:09:10','\0',23),(10,13,'this is jezeem aymen','2016-01-14 05:13:22','\0',23),(11,13,'IAny candidate, who is unable to sit for an examination paper or the examination due to illness, should submit Medical Certificate and submission form with relevant details “within seven working days with effect from exam date” to the Examinations & Registration Branch.','2016-01-14 05:15:53','\0',23),(12,13,'this is jezeem aymen','2016-01-14 05:16:33','\0',23),(13,13,'IAny candidate, who is unable to sit for an examination paper or the examination due to illness, should submit Medical Certificate and submission form with relevant details “within seven working days with effect from exam date” to the Examinations & Registration Branch.','2016-01-14 09:16:32','\0',23),(14,13,'this is jezeem aymen','2016-01-15 00:22:58','\0',23),(15,13,'This is the last instruction','2016-01-15 00:29:37','\0',23),(16,10,'hi','2016-01-19 07:58:46','\0',23),(17,10,'hi','2016-01-19 07:59:00','\0',23),(18,10,'how is the thing','2016-01-19 07:59:22','\0',23),(19,12,'this is','2016-01-19 08:06:08','\0',23),(20,12,'please get the matter','2016-01-19 08:11:21','\0',23),(21,13,'121','2016-01-19 08:14:25','\0',23),(22,7,'121','2016-01-19 08:14:59','\0',23),(23,7,'121','2016-01-19 08:15:01','\0',23),(24,7,'121','2016-01-19 08:18:28','\0',23),(25,12,'adf','2016-01-19 08:20:34','\0',23),(26,11,'pleas do this immediately','2016-01-19 08:24:48','\0',23),(27,13,'can be done','2016-01-24 08:40:19','\0',23),(28,19,'Please do this immediately','2016-01-06 11:43:27','\0',21),(29,20,'do','2016-01-06 09:40:14','\0',23);
/*!40000 ALTER TABLE `instructions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notification`
--

DROP TABLE IF EXISTS `notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notification` (
  `ntn_id` int(11) NOT NULL AUTO_INCREMENT,
  `ntn_type` varchar(100) DEFAULT NULL,
  `ntn_active` bit(1) DEFAULT NULL,
  PRIMARY KEY (`ntn_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification`
--

LOCK TABLES `notification` WRITE;
/*!40000 ALTER TABLE `notification` DISABLE KEYS */;
INSERT INTO `notification` VALUES (1,'Non',''),(2,'SMS',''),(3,'Email',''),(4,'SMS/Email','');
/*!40000 ALTER TABLE `notification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `process_request`
--

DROP TABLE IF EXISTS `process_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `process_request` (
  `pr_id` int(11) NOT NULL AUTO_INCREMENT,
  `pr_request_id` int(11) DEFAULT NULL,
  `pr_subject_id` int(11) DEFAULT NULL,
  `pr_division_id` int(11) DEFAULT NULL,
  `pr_user_id` int(11) DEFAULT NULL,
  `pr_txn_date` datetime DEFAULT NULL,
  `pr_status_id` int(11) DEFAULT NULL,
  `pr_duration` int(3) DEFAULT NULL,
  `pr_note` varchar(100) DEFAULT NULL,
  `pr_cost` decimal(18,2) DEFAULT NULL,
  PRIMARY KEY (`pr_id`),
  KEY `fk_pr_request_id_idx` (`pr_request_id`),
  KEY `fk_pr_status_id_idx` (`pr_status_id`),
  CONSTRAINT `fk_pr_request_id` FOREIGN KEY (`pr_request_id`) REFERENCES `request` (`req_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_pr_status_id` FOREIGN KEY (`pr_status_id`) REFERENCES `request_status` (`rs_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Request Processing details and the progress are updated.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `process_request`
--

LOCK TABLES `process_request` WRITE;
/*!40000 ALTER TABLE `process_request` DISABLE KEYS */;
/*!40000 ALTER TABLE `process_request` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `process_stage`
--

DROP TABLE IF EXISTS `process_stage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `process_stage` (
  `rst_id` int(11) NOT NULL AUTO_INCREMENT,
  `rst_pr_id` int(11) NOT NULL,
  `rst_stg_id` int(11) DEFAULT NULL,
  `rst_stage_status_id` int(11) NOT NULL,
  `rs_sequence_no` int(11) DEFAULT NULL,
  `rst_txn_date` datetime DEFAULT NULL,
  `rst_note` varchar(100) DEFAULT NULL,
  `rst_user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`rst_id`),
  KEY `fk_rst_stage_status_idx` (`rst_stage_status_id`),
  KEY `fk_rst_user_id_idx` (`rst_user_id`),
  KEY `fk_stg_pr_id_idx` (`rst_pr_id`),
  KEY `fk_rst_stg_id_idx` (`rst_stg_id`),
  CONSTRAINT `fk_rst_pr_id` FOREIGN KEY (`rst_pr_id`) REFERENCES `request` (`req_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_rst_stage_status` FOREIGN KEY (`rst_stage_status_id`) REFERENCES `stage_status` (`ss_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_rst_stg_id` FOREIGN KEY (`rst_stg_id`) REFERENCES `subjec_stage` (`stg_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_rst_user_id` FOREIGN KEY (`rst_user_id`) REFERENCES `staff` (`stf_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `process_stage`
--

LOCK TABLES `process_stage` WRITE;
/*!40000 ALTER TABLE `process_stage` DISABLE KEYS */;
INSERT INTO `process_stage` VALUES (11,7,1,1,0,'2016-01-04 10:57:47','',23),(12,7,2,1,1,'2016-01-04 10:57:47','',23),(13,8,1,1,0,'2016-01-05 10:59:06','',23),(14,8,2,1,1,'2016-01-05 10:59:06','',23),(15,10,1,1,0,'2016-01-06 08:04:51','',23),(16,10,2,1,1,'2016-01-06 08:04:51','',23),(17,11,1,2,0,'2016-01-07 04:55:40','jezeem',23),(18,11,2,3,1,'2016-01-07 04:55:40','New note',23),(19,12,1,1,0,'2016-01-13 09:55:11','',23),(20,12,2,1,1,'2016-01-13 09:55:11','',23),(21,13,1,3,0,'2016-01-13 10:02:51','Completed',23),(22,13,2,2,1,'2016-01-13 10:02:51','stage',23),(23,14,1,3,0,'2016-01-14 10:50:00','Given to cleark',23),(24,14,2,3,1,'2016-01-14 10:50:00','stage',23),(25,15,3,3,0,'2016-01-24 00:03:38','stage',23),(26,16,4,1,0,'2016-01-24 05:53:14','',21),(27,17,4,1,0,'2016-01-03 09:07:29','',23),(28,18,4,1,0,'2016-01-03 09:08:27','',23),(29,19,4,1,0,'2016-01-06 11:42:58','',21),(30,20,6,2,0,'2016-01-06 09:23:50','stage',23),(31,20,7,1,1,'2016-01-06 09:23:50','stage',23),(32,20,8,1,2,'2016-01-06 09:23:51','',23);
/*!40000 ALTER TABLE `process_stage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `public_individual`
--

DROP TABLE IF EXISTS `public_individual`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `public_individual` (
  `pi_id` int(11) NOT NULL AUTO_INCREMENT,
  `pi_name` varchar(100) DEFAULT NULL,
  `pi_address1` varchar(50) DEFAULT NULL,
  `pi_address2` varchar(50) DEFAULT NULL,
  `pi_address3` varchar(50) DEFAULT NULL,
  `pi_land_phone` varchar(10) DEFAULT NULL,
  `pi_mobile_phone` varchar(10) DEFAULT NULL,
  `pi_email` varchar(100) DEFAULT NULL,
  `pi_ind_user_id` int(11) DEFAULT NULL,
  `pi_user_pwd` varchar(100) DEFAULT NULL,
  `pi_nic` varchar(10) DEFAULT NULL,
  `pi_dob` datetime DEFAULT NULL,
  `pi_gender` varchar(20) DEFAULT NULL,
  `pi_note` varchar(100) DEFAULT NULL,
  `pi_user_id` int(11) DEFAULT NULL,
  `pi_notfication_type_id` int(11) DEFAULT NULL,
  `pi_active` bit(1) DEFAULT NULL,
  PRIMARY KEY (`pi_id`),
  KEY `pi_notfication_id_idx` (`pi_notfication_type_id`),
  CONSTRAINT `fk_pi_notfication_type_id` FOREIGN KEY (`pi_notfication_type_id`) REFERENCES `notification` (`ntn_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `public_individual`
--

LOCK TABLES `public_individual` WRITE;
/*!40000 ALTER TABLE `public_individual` DISABLE KEYS */;
INSERT INTO `public_individual` VALUES (1,'N.J.Aymen','105, Gall Road,','Colombo','6','123123','773166010','jzmamn@gmail.com',821491169,'123','821491169v','1980-10-01 00:00:00','Male','This a test',1,1,''),(2,'Rafatha J Aymen','adsf1','3','Nintavur','1234232323','1223232321','jzmamn@gmail.com',NULL,NULL,'232323232v','2016-01-07 00:00:00','Female','adfs',23,2,''),(3,'Rafatha','adsf1','adsf2','adf3','1234232323','1223232321','jzmamn@gmail.com',NULL,NULL,'232323232v','2015-09-12 00:00:00','Male','adfs',23,2,''),(4,'Fathima Rafatha','qewr','qer','qewr','11','11','jzmamn@gmail.com',NULL,NULL,'2322323232','2015-12-14 00:00:00','Male','233232',23,1,''),(5,'dasf','adsf','dfas','daf','123445','122334','jamz@aho.com',NULL,NULL,'821411111','2016-02-17 00:00:00','Male','',21,3,'\0');
/*!40000 ALTER TABLE `public_individual` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `request`
--

DROP TABLE IF EXISTS `request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `request` (
  `req_id` int(11) NOT NULL AUTO_INCREMENT,
  `req_subject_id` int(11) DEFAULT NULL,
  `req_division_id` int(11) DEFAULT NULL,
  `req_public_id` int(11) DEFAULT NULL,
  `req_ent_date` datetime DEFAULT NULL,
  `req_note` varchar(100) DEFAULT NULL,
  `req_fees` decimal(10,2) DEFAULT NULL,
  `req_user_id` int(11) DEFAULT NULL,
  `req_durartion` int(11) DEFAULT NULL,
  `req_status_id` int(11) DEFAULT NULL,
  `req_is_read` bit(1) DEFAULT NULL,
  `req_processed` bit(1) DEFAULT NULL,
  `req_is_void` bit(1) DEFAULT NULL,
  PRIMARY KEY (`req_id`),
  KEY `fk_req_public_id_idx` (`req_public_id`),
  KEY `fk_req_division_id_idx` (`req_division_id`),
  KEY `fk_req_user_id_idx` (`req_user_id`),
  KEY `fk_req_subject_id_idx` (`req_subject_id`),
  KEY `fk_req_status_id_idx` (`req_status_id`),
  CONSTRAINT `fk_req_division_id` FOREIGN KEY (`req_division_id`) REFERENCES `division` (`div_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_req_public_id` FOREIGN KEY (`req_public_id`) REFERENCES `public_individual` (`pi_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_req_status_id` FOREIGN KEY (`req_status_id`) REFERENCES `request_status` (`rs_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_req_subject_id` FOREIGN KEY (`req_subject_id`) REFERENCES `subject` (`sbj_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_req_user_id` FOREIGN KEY (`req_user_id`) REFERENCES `staff` (`stf_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COMMENT='details about the request submitted by the public individual';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `request`
--

LOCK TABLES `request` WRITE;
/*!40000 ALTER TABLE `request` DISABLE KEYS */;
INSERT INTO `request` VALUES (7,4,2,1,'2016-01-04 00:00:00','Aymen',1200.00,23,1,3,'\0','\0',''),(8,4,2,1,'2016-02-05 00:00:00','new',1200.00,23,1,7,'\0','\0','\0'),(10,4,2,1,'2016-02-06 00:00:00','',1200.00,23,1,4,'\0','\0',''),(11,4,2,1,'2016-01-07 00:00:00','12',1200.00,23,1,5,'\0','\0',''),(12,4,2,4,'2016-01-13 00:00:00','New',1200.00,23,1,3,'\0','\0','\0'),(13,4,2,1,'2016-01-13 00:00:00','jezeem',1200.00,23,1,1,'\0','\0','\0'),(14,4,2,1,'2016-01-14 00:00:00','Birth Certificate',1200.00,23,1,3,'\0','\0','\0'),(15,5,2,1,'2016-02-24 00:00:00','',2.00,23,2,2,'\0','\0','\0'),(16,11,1,1,'2016-02-24 00:00:00','',1000.00,21,1,1,'\0','\0','\0'),(17,11,1,1,'2016-02-03 00:00:00','Test',1000.00,23,1,5,'\0','\0','\0'),(18,11,1,1,'2016-02-03 00:00:00','a',1000.00,23,1,6,'\0','\0','\0'),(19,11,1,4,'2016-02-06 00:00:00','new',1000.00,21,1,1,'\0','\0','\0'),(20,10,3,1,'2016-02-06 00:00:00','new',1000.00,23,2,2,'\0','\0','\0'),(21,9,5,2,'2016-05-01 00:00:00','',2323.00,21,23,1,'\0','\0','\0');
/*!40000 ALTER TABLE `request` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `request_log`
--

DROP TABLE IF EXISTS `request_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `request_log` (
  `rl_id` int(11) NOT NULL AUTO_INCREMENT,
  `rl_pr_id` int(11) DEFAULT NULL,
  `rl_txn_date` datetime DEFAULT NULL,
  `rl_status_id` int(11) DEFAULT NULL,
  `rl_user_id` int(11) DEFAULT NULL,
  `rl_note` varchar(100) DEFAULT NULL,
  `rl_ent_date` datetime DEFAULT NULL,
  `rl_void` bit(1) DEFAULT NULL,
  PRIMARY KEY (`rl_id`),
  KEY `fk_req_id_idx` (`rl_pr_id`),
  CONSTRAINT `fk_pr_id` FOREIGN KEY (`rl_pr_id`) REFERENCES `request` (`req_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `request_log`
--

LOCK TABLES `request_log` WRITE;
/*!40000 ALTER TABLE `request_log` DISABLE KEYS */;
INSERT INTO `request_log` VALUES (27,7,'2016-01-07 20:30:37',2,23,'Nice test','2016-01-04 00:00:00','\0'),(29,11,'2016-01-07 21:05:40',1,23,'','2016-01-07 00:00:00','\0'),(30,7,'2016-01-08 20:31:55',2,23,'Nice test','2016-01-04 00:00:00',''),(31,14,'2016-01-14 22:56:55',1,23,'Birth Certificate','2016-01-14 00:00:00','\0'),(32,14,'2016-01-14 23:00:22',2,23,'Birth Certificate','2016-01-14 00:00:00','\0'),(33,12,'2016-01-21 23:22:47',1,23,'New','2016-01-13 00:00:00','\0'),(34,11,'2016-01-24 10:54:55',1,23,'','2016-01-07 00:00:00',''),(35,8,'2016-01-24 11:38:45',1,23,'','2016-01-05 00:00:00','\0'),(36,8,'2016-01-24 17:43:24',1,23,'new','2016-01-05 00:00:00','\0'),(37,8,'2016-01-24 18:57:32',1,23,'new','2016-02-05 00:00:00','\0'),(38,10,'2016-01-24 18:59:06',1,23,'','2016-01-06 00:00:00',''),(39,14,'2016-01-24 18:59:57',3,23,'Birth Certificate','2016-01-14 00:00:00','\0'),(40,14,'2016-01-24 19:00:47',3,23,'Birth Certificate','2016-03-14 00:00:00','\0'),(41,15,'2016-01-24 19:00:47',1,23,'','2016-01-24 00:00:00','\0'),(42,16,'2016-01-24 19:02:00',1,21,'','2016-01-24 00:00:00','\0'),(43,10,'2016-01-24 19:02:53',1,23,'','2016-02-06 00:00:00',''),(44,16,'2016-01-28 22:39:24',1,21,'','2016-02-24 00:00:00','\0'),(45,16,'2016-01-28 22:46:31',1,21,'','2016-02-24 00:00:00','\0'),(46,17,'2016-02-03 21:07:43',1,23,'Test','2016-02-03 00:00:00','\0'),(47,18,'2016-02-03 21:08:38',1,23,'a','2016-02-03 00:00:00','\0'),(48,18,'2016-02-03 21:09:31',5,23,'a','2016-02-03 00:00:00','\0'),(49,8,'2016-02-03 21:11:54',4,23,'new','2016-02-05 00:00:00','\0'),(50,7,'2016-02-03 21:40:50',2,23,'Aymen','2016-01-04 00:00:00',''),(51,19,'2016-02-06 11:43:43',1,21,'','2016-02-06 00:00:00','\0'),(52,20,'2016-02-06 21:33:35',1,23,'','2016-02-06 00:00:00','\0');
/*!40000 ALTER TABLE `request_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `request_status`
--

DROP TABLE IF EXISTS `request_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `request_status` (
  `rs_id` int(11) NOT NULL,
  `rs_name` varchar(50) DEFAULT NULL,
  `rs_active` bit(1) DEFAULT NULL,
  PRIMARY KEY (`rs_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `request_status`
--

LOCK TABLES `request_status` WRITE;
/*!40000 ALTER TABLE `request_status` DISABLE KEYS */;
INSERT INTO `request_status` VALUES (1,'New',''),(2,'Opened',''),(3,'Completed',''),(4,'Closed',''),(5,'ToBeApp',''),(6,'Approved',''),(7,'Rejected','');
/*!40000 ALTER TABLE `request_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sms_setup`
--

DROP TABLE IF EXISTS `sms_setup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sms_setup` (
  `sms_id` int(11) NOT NULL,
  `sms_com_port_id` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`sms_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sms_setup`
--

LOCK TABLES `sms_setup` WRITE;
/*!40000 ALTER TABLE `sms_setup` DISABLE KEYS */;
/*!40000 ALTER TABLE `sms_setup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `staff` (
  `stf_id` int(11) NOT NULL AUTO_INCREMENT,
  `stf_name` varchar(50) DEFAULT NULL,
  `stf_category_id` int(11) DEFAULT NULL,
  `stf_user_id` varchar(10) DEFAULT NULL,
  `stf_password` varchar(300) DEFAULT NULL,
  `stf_dvision_id` int(11) NOT NULL,
  `stf_email` varchar(100) DEFAULT NULL,
  `stf_mobile` varchar(10) DEFAULT NULL,
  `stf_note` varchar(100) DEFAULT NULL,
  `stf_active` bit(1) DEFAULT NULL,
  `stf_role` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`stf_id`),
  UNIQUE KEY `stf_user_id_UNIQUE` (`stf_user_id`),
  KEY `fk_stf_category_id_idx` (`stf_category_id`),
  KEY `fk_stf_divsion_id_idx` (`stf_dvision_id`),
  CONSTRAINT `fk_stf_divsion_id` FOREIGN KEY (`stf_dvision_id`) REFERENCES `division` (`div_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff`
--

LOCK TABLES `staff` WRITE;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
INSERT INTO `staff` VALUES (21,'Admin',1,'admin','$2a$10$LOqePml/koRGsk2YAIOFI.1YNKZg7EsQ5BAIuYP1nWOyYRl21dlne',1,'','','','\0','ROLE_ADMIN'),(22,'HOD',2,'hod','$2a$10$LOqePml/koRGsk2YAIOFI.1YNKZg7EsQ5BAIuYP1nWOyYRl21dlne',2,'','','','\0','ROLE_HOD'),(23,'Staff',3,'staff','$2a$10$LOqePml/koRGsk2YAIOFI.1YNKZg7EsQ5BAIuYP1nWOyYRl21dlne',2,'','','','','ROLE_STAFF'),(29,'HodAdmin',2,'hodadmin','$2a$10$LOqePml/koRGsk2YAIOFI.1YNKZg7EsQ5BAIuYP1nWOyYRl21dlne',1,'','','','\0','ROLE_HOD'),(36,'staffadmin',3,'staffadmin','$2a$10$LOqePml/koRGsk2YAIOFI.1YNKZg7EsQ5BAIuYP1nWOyYRl21dlne',1,'','','','',NULL),(37,'abc',1,'auah','12344',1,'jzmamn@gmail.com','12343214','this si','',NULL),(38,'asdf',3,'adf','aaaa',1,'','','','',NULL),(40,'Shameer',1,'wererere','1234',1,'','','','',NULL),(41,'Nasheerdeen',1,'na','$2a$10$LABTIDs4/hN7GwPw5yXtT.z9OLBJlm9jrg87tmqUEVqR9xBvl5OIe',3,'na@yahoo.com','34342','as','',NULL),(42,'Pubudu',2,'ss','$2a$10$eqF8jwV.KoZUjvSAZFmJFODfpr61.aXsZKqihKRMGXKIOYg0KKfbe',3,'','','','',NULL),(44,'Senthuran',3,'t','$2a$10$oJpuRM.2VWSCQVr25YaFNulQ9uJtdOJ6HikfWf6xgXHSEr/sNmsmO',2,'','','','',NULL),(45,'y',3,'y','$2a$10$5rZjCXZMokMhAGcyK4x/3OyjVjWg3de9jQArnSNKEA2nBwry2ezi6',3,'','','','',NULL),(46,'Shameer',2,'n','$2a$10$rBRykvuK8RRmIOae9OnK9uI5AJQV0M9KVmK7UaJbYPy8N8Ie4D0qO',1,'','','','',NULL),(50,'1',3,'uu','$2a$10$v77LrBySsJRtAUAeVyR.T.g2RLrgvklITCsxkoZMRhpLRRdYU./eW',2,'','','','',NULL),(58,'Update',1,'zz','$2a$10$LpbZrzWrmD2uKh.1zAEXWemlxxAK3SH8dHBqpcTcgvt9I4VEwkLxy',2,'','','','',NULL),(59,'a',3,'h','$2a$10$fznX8RG4hciAI5TSxpcDr.v4kqjnEt43Ja8IfzsvTJ.9JwAQNGRi6',2,'','','','',NULL),(63,'asdfad',2,'bv','$2a$10$loJ6tEQZJqUCGBgz3EAEx.d5D/SN/lTuhlkYrK5B6qr8620.EkIr.',1,'','','','',NULL),(64,'adf',3,'nb','$2a$10$2pi4OOnuM6Zs/EbbnzDkb.ZZJEu.6krCWgsuxazLgGU4Zih2MhFnC',1,'','','','',NULL),(65,'adf',1,'af','$2a$10$g0HbMN9nL2WEJKmncDgFeurzF1bpkqyh07uRZOQdAZ.uUg568Inb6',1,'','','','',NULL),(66,'Tests',2,'vb','$2a$10$AzdKbpK6F4gwQM2qksmpzekjcvO3Twq72h1dlVcCy0lMqg.sW5Ho6',3,'','','','',NULL),(67,'Zeee',2,'saa','$2a$10$K1w7u3nIOn18VqPfYULLCO7t4fCDQDHrj6gO4B4IQhNQgh/Epr6za',1,'','','','',NULL),(68,'Chamila',3,'aasdf','$2a$10$M/0O2ibBp1rrzysICRo1cuBNCeyvfBpMUlJXkDHv.QfFrIviBEAIC',3,'','12344','','',NULL),(69,'aymenass',3,'er','$2a$10$AsXAaa/WkPKJh9tL5uN.aODc9M1PfYyzluUvINskSHoffTNFAh7bO',1,'','','','',NULL),(70,'Jezeem',3,'fdfd','$2a$10$rNzpNrdVn8/zeaBxKEbqc.UJHf81muC.Jc3uofVuXOQ/btCR78ns2',1,'','121','','',NULL);
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff_role`
--

DROP TABLE IF EXISTS `staff_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `staff_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `staff_id` int(11) NOT NULL,
  `role_id` int(11) DEFAULT NULL,
  `role_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_role_role_id_idx` (`role_id`),
  KEY `fk_role_stfid_idx` (`staff_id`),
  CONSTRAINT `fk_role_stfid` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`stf_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff_role`
--

LOCK TABLES `staff_role` WRITE;
/*!40000 ALTER TABLE `staff_role` DISABLE KEYS */;
INSERT INTO `staff_role` VALUES (1,23,3,'ROLE_STAFF'),(2,21,1,'ROLE_ADMIN'),(3,22,2,'ROLE_HOD'),(4,29,2,'ROLE_HOD'),(5,36,3,'ROLE_STAFF');
/*!40000 ALTER TABLE `staff_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stage_log`
--

DROP TABLE IF EXISTS `stage_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stage_log` (
  `ps_id` int(11) NOT NULL AUTO_INCREMENT,
  `ps_rst_id` int(11) DEFAULT NULL,
  `ps_stage_id` int(11) DEFAULT NULL,
  `ps_status_id` int(11) DEFAULT NULL,
  `ps_txn_date` datetime DEFAULT NULL,
  `ps_user_id` int(11) DEFAULT NULL,
  `ps_note` varchar(100) DEFAULT NULL,
  `ps_ent_date` datetime DEFAULT NULL,
  PRIMARY KEY (`ps_id`),
  KEY `fk_rst_id_idx` (`ps_rst_id`),
  CONSTRAINT `fk_rst_id` FOREIGN KEY (`ps_rst_id`) REFERENCES `process_stage` (`rst_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stage_log`
--

LOCK TABLES `stage_log` WRITE;
/*!40000 ALTER TABLE `stage_log` DISABLE KEYS */;
INSERT INTO `stage_log` VALUES (1,11,1,1,'2016-01-08 23:12:15',23,'','2016-01-07 04:55:40'),(2,11,1,1,'2016-01-08 23:23:59',23,'aymen','2016-01-07 04:55:40'),(3,11,1,1,'2016-01-08 23:24:23',23,'jezeem','2016-01-07 04:55:40'),(4,11,2,1,'2016-01-13 21:46:37',23,'','2016-01-07 04:55:40'),(5,13,1,1,'2016-01-13 22:12:30',23,'','2016-01-13 10:02:51'),(6,13,2,1,'2016-01-13 22:16:15',23,'','2016-01-13 10:02:51'),(7,13,2,3,'2016-01-13 22:17:56',23,'stage','2016-01-13 10:02:51'),(8,13,1,2,'2016-01-13 22:19:45',23,'stage','2016-01-13 10:02:51'),(9,13,1,3,'2016-01-13 22:30:30',23,'stage','2016-01-13 10:02:51'),(10,14,1,1,'2016-01-14 22:55:29',23,'','2016-01-14 10:50:00'),(11,14,1,2,'2016-01-14 22:58:47',23,'Given to cleark','2016-01-14 10:50:00'),(12,14,2,1,'2016-01-14 22:59:48',23,'','2016-01-14 10:50:00'),(13,15,3,1,'2016-01-24 12:03:51',23,'','2016-01-24 00:03:38'),(14,20,6,1,'2016-02-06 21:24:29',23,'','2016-01-06 09:23:50'),(15,20,6,3,'2016-02-06 21:24:43',23,'stage','2016-01-06 09:23:50'),(16,20,7,1,'2016-02-06 21:25:03',23,'','2016-01-06 09:23:50'),(17,20,7,3,'2016-02-06 21:27:31',23,'stage','2016-01-06 09:23:50'),(18,20,6,2,'2016-02-06 21:31:07',23,'stage','2016-01-06 09:23:50'),(19,20,7,2,'2016-02-06 21:33:08',23,'stage','2016-01-06 09:23:50'),(20,20,6,1,'2016-02-06 21:33:27',23,'stage','2016-01-06 09:23:50'),(21,11,2,3,'2016-05-01 09:59:56',23,'hehe','2016-01-07 04:55:40');
/*!40000 ALTER TABLE `stage_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stage_status`
--

DROP TABLE IF EXISTS `stage_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stage_status` (
  `ss_id` int(11) NOT NULL AUTO_INCREMENT,
  `ss_name` varchar(50) DEFAULT NULL,
  `ss_active` bit(1) DEFAULT NULL,
  PRIMARY KEY (`ss_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stage_status`
--

LOCK TABLES `stage_status` WRITE;
/*!40000 ALTER TABLE `stage_status` DISABLE KEYS */;
INSERT INTO `stage_status` VALUES (1,'Pending',''),(2,'Progress',''),(3,'Completed','');
/*!40000 ALTER TABLE `stage_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subjec_stage`
--

DROP TABLE IF EXISTS `subjec_stage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subjec_stage` (
  `stg_id` int(11) NOT NULL AUTO_INCREMENT,
  `stg_subject_id` int(11) DEFAULT NULL,
  `stg_name` varchar(100) DEFAULT NULL,
  `stg_active` bit(1) DEFAULT NULL,
  `stg_cost` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`stg_id`),
  KEY `fk_sbject_id_idx` (`stg_subject_id`),
  CONSTRAINT `fk_sbject_id` FOREIGN KEY (`stg_subject_id`) REFERENCES `subject` (`sbj_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='Stages for a subject that is to be completed.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subjec_stage`
--

LOCK TABLES `subjec_stage` WRITE;
/*!40000 ALTER TABLE `subjec_stage` DISABLE KEYS */;
INSERT INTO `subjec_stage` VALUES (1,4,'Submitted to cleark','',100.00),(2,4,'Registrar Signature','',100.00),(3,5,'Aymen','',NULL),(4,11,'Stage 1','',100.00),(5,8,'Step 1','',NULL),(6,10,'Submit the form to cleark','',NULL),(7,10,'Birth Certifiecate Collected','',NULL),(8,10,'Registrar\'s Signature','',NULL);
/*!40000 ALTER TABLE `subjec_stage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subject`
--

DROP TABLE IF EXISTS `subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subject` (
  `sbj_id` int(11) NOT NULL AUTO_INCREMENT,
  `sbj_code` varchar(50) DEFAULT NULL,
  `sbj_name` varchar(50) DEFAULT NULL,
  `sbj_active` bit(1) DEFAULT NULL,
  `sbj_div_id` int(11) DEFAULT NULL,
  `sbj_duration` int(11) DEFAULT NULL,
  `sbj_cost` decimal(18,2) DEFAULT NULL,
  PRIMARY KEY (`sbj_id`),
  KEY `fk_sbj_div_id_idx` (`sbj_div_id`),
  CONSTRAINT `fk_sbj_div_id` FOREIGN KEY (`sbj_div_id`) REFERENCES `division` (`div_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subject`
--

LOCK TABLES `subject` WRITE;
/*!40000 ALTER TABLE `subject` DISABLE KEYS */;
INSERT INTO `subject` VALUES (4,'plan/jez/2004','Jezeem','',2,1,1200.00),(5,'adfdadf','a','',2,2,2.00),(7,'com','je','',5,23,2323.00),(8,'coma','je','',5,23,2323.00),(9,'com','je','',5,23,2323.00),(10,'Reg/Cert/Birth','aa','',3,2,1000.00),(11,'admin/2016/sand','Sand Permit','',1,1,1000.00);
/*!40000 ALTER TABLE `subject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket`
--

DROP TABLE IF EXISTS `ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ticket` (
  `tkt_id` int(11) NOT NULL AUTO_INCREMENT,
  `tkt_reply_id` int(11) DEFAULT NULL,
  `tkt_reply_sequence` int(11) DEFAULT NULL,
  `tkt_date` datetime DEFAULT NULL,
  `tkt_from` int(11) DEFAULT NULL,
  `tkt_to` int(11) DEFAULT NULL,
  `tkt_message` varchar(500) DEFAULT NULL,
  `tkt_priority` int(11) DEFAULT NULL,
  `tkt_status` int(11) DEFAULT NULL,
  `tkt_is_new` bit(1) DEFAULT NULL,
  PRIMARY KEY (`tkt_id`),
  KEY `fk_tkt_from_idx` (`tkt_from`),
  KEY `fk_tkt_to_idx` (`tkt_to`),
  KEY `fk_tkt_priority_idx` (`tkt_priority`),
  KEY `fk_tkt_status_idx` (`tkt_status`),
  CONSTRAINT `fk_tkt_from` FOREIGN KEY (`tkt_from`) REFERENCES `staff` (`stf_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tkt_priority` FOREIGN KEY (`tkt_priority`) REFERENCES `ticket_priority` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tkt_status` FOREIGN KEY (`tkt_status`) REFERENCES `ticket_status` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tkt_to` FOREIGN KEY (`tkt_to`) REFERENCES `staff` (`stf_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket`
--

LOCK TABLES `ticket` WRITE;
/*!40000 ALTER TABLE `ticket` DISABLE KEYS */;
/*!40000 ALTER TABLE `ticket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket_priority`
--

DROP TABLE IF EXISTS `ticket_priority`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ticket_priority` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tkt_priority` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket_priority`
--

LOCK TABLES `ticket_priority` WRITE;
/*!40000 ALTER TABLE `ticket_priority` DISABLE KEYS */;
INSERT INTO `ticket_priority` VALUES (1,'High'),(2,'Medium'),(3,'Low');
/*!40000 ALTER TABLE `ticket_priority` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket_status`
--

DROP TABLE IF EXISTS `ticket_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ticket_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tkt_status` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket_status`
--

LOCK TABLES `ticket_status` WRITE;
/*!40000 ALTER TABLE `ticket_status` DISABLE KEYS */;
INSERT INTO `ticket_status` VALUES (1,'Pending'),(2,'Open'),(3,'Close');
/*!40000 ALTER TABLE `ticket_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_category`
--

DROP TABLE IF EXISTS `user_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_category` (
  `cat_id` int(11) NOT NULL AUTO_INCREMENT,
  `cat_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`cat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='categories are saved. Admin, Head of Divison, Staff and publ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_category`
--

LOCK TABLES `user_category` WRITE;
/*!40000 ALTER TABLE `user_category` DISABLE KEYS */;
INSERT INTO `user_category` VALUES (1,'ROLE_ADMIN'),(2,'ROLE_HOD'),(3,'ROLE_STAFF');
/*!40000 ALTER TABLE `user_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vw_annual_status`
--

DROP TABLE IF EXISTS `vw_annual_status`;
/*!50001 DROP VIEW IF EXISTS `vw_annual_status`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vw_annual_status` AS SELECT 
 1 AS `EntYear`,
 1 AS `New`,
 1 AS `Opend`,
 1 AS `Completed`,
 1 AS `Closed`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_bar_by_all_division`
--

DROP TABLE IF EXISTS `vw_bar_by_all_division`;
/*!50001 DROP VIEW IF EXISTS `vw_bar_by_all_division`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vw_bar_by_all_division` AS SELECT 
 1 AS `EntMonth`,
 1 AS `EntMonth1`,
 1 AS `EntYear`,
 1 AS `New`,
 1 AS `Opend`,
 1 AS `Completed`,
 1 AS `Closed`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_bar_by_division`
--

DROP TABLE IF EXISTS `vw_bar_by_division`;
/*!50001 DROP VIEW IF EXISTS `vw_bar_by_division`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vw_bar_by_division` AS SELECT 
 1 AS `req_division_id`,
 1 AS `EntMonth`,
 1 AS `EntMonth1`,
 1 AS `EntYear`,
 1 AS `New`,
 1 AS `Opend`,
 1 AS `Completed`,
 1 AS `Closed`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_div_period_status`
--

DROP TABLE IF EXISTS `vw_div_period_status`;
/*!50001 DROP VIEW IF EXISTS `vw_div_period_status`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vw_div_period_status` AS SELECT 
 1 AS `div_id`,
 1 AS `div_name`,
 1 AS `EntMonth`,
 1 AS `EntMonth1`,
 1 AS `EntYear`,
 1 AS `New`,
 1 AS `Opend`,
 1 AS `Completed`,
 1 AS `Closed`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_division_by_year`
--

DROP TABLE IF EXISTS `vw_division_by_year`;
/*!50001 DROP VIEW IF EXISTS `vw_division_by_year`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vw_division_by_year` AS SELECT 
 1 AS `div_id`,
 1 AS `div_name`,
 1 AS `EntYear`,
 1 AS `New`,
 1 AS `Opend`,
 1 AS `Completed`,
 1 AS `Closed`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_division_status`
--

DROP TABLE IF EXISTS `vw_division_status`;
/*!50001 DROP VIEW IF EXISTS `vw_division_status`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vw_division_status` AS SELECT 
 1 AS `div_name`,
 1 AS `New`,
 1 AS `Opend`,
 1 AS `Completed`,
 1 AS `Closed`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_donut_division`
--

DROP TABLE IF EXISTS `vw_donut_division`;
/*!50001 DROP VIEW IF EXISTS `vw_donut_division`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vw_donut_division` AS SELECT 
 1 AS `req_status_id`,
 1 AS `label`,
 1 AS `value`,
 1 AS `divId`,
 1 AS `div_name`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_donut_division_period`
--

DROP TABLE IF EXISTS `vw_donut_division_period`;
/*!50001 DROP VIEW IF EXISTS `vw_donut_division_period`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vw_donut_division_period` AS SELECT 
 1 AS `req_status_id`,
 1 AS `label`,
 1 AS `value`,
 1 AS `Count`,
 1 AS `EntMonth`,
 1 AS `EntYear`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_last_modified`
--

DROP TABLE IF EXISTS `vw_last_modified`;
/*!50001 DROP VIEW IF EXISTS `vw_last_modified`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vw_last_modified` AS SELECT 
 1 AS `rl_pr_id`,
 1 AS `DateEnt`,
 1 AS `Modified`,
 1 AS `rl_note`,
 1 AS `rl_user_id`,
 1 AS `stf_name`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_monthly_status`
--

DROP TABLE IF EXISTS `vw_monthly_status`;
/*!50001 DROP VIEW IF EXISTS `vw_monthly_status`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vw_monthly_status` AS SELECT 
 1 AS `EntMonth`,
 1 AS `EntMonth1`,
 1 AS `EntYear`,
 1 AS `New`,
 1 AS `Opend`,
 1 AS `Completed`,
 1 AS `Closed`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_req_batch_count`
--

DROP TABLE IF EXISTS `vw_req_batch_count`;
/*!50001 DROP VIEW IF EXISTS `vw_req_batch_count`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vw_req_batch_count` AS SELECT 
 1 AS `req_status_id`,
 1 AS `rs_name`,
 1 AS `count`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_req_completed`
--

DROP TABLE IF EXISTS `vw_req_completed`;
/*!50001 DROP VIEW IF EXISTS `vw_req_completed`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vw_req_completed` AS SELECT 
 1 AS `req_id`,
 1 AS `req_subject_id`,
 1 AS `sbj_code`,
 1 AS `req_division_id`,
 1 AS `div_name`,
 1 AS `req_public_id`,
 1 AS `pi_name`,
 1 AS `req_status_id`,
 1 AS `rs_name`,
 1 AS `today`,
 1 AS `EntDate`,
 1 AS `sbj_duration`,
 1 AS `Past`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_req_overdue`
--

DROP TABLE IF EXISTS `vw_req_overdue`;
/*!50001 DROP VIEW IF EXISTS `vw_req_overdue`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vw_req_overdue` AS SELECT 
 1 AS `req_id`,
 1 AS `req_subject_id`,
 1 AS `sbj_code`,
 1 AS `req_division_id`,
 1 AS `div_name`,
 1 AS `req_public_id`,
 1 AS `pi_name`,
 1 AS `req_status_id`,
 1 AS `rs_name`,
 1 AS `today`,
 1 AS `EntDate`,
 1 AS `sbj_duration`,
 1 AS `Overdue`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_req_status_summary`
--

DROP TABLE IF EXISTS `vw_req_status_summary`;
/*!50001 DROP VIEW IF EXISTS `vw_req_status_summary`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vw_req_status_summary` AS SELECT 
 1 AS `label`,
 1 AS `value`,
 1 AS `req_division_id`,
 1 AS `req_ent_date`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_req_stg_trail`
--

DROP TABLE IF EXISTS `vw_req_stg_trail`;
/*!50001 DROP VIEW IF EXISTS `vw_req_stg_trail`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vw_req_stg_trail` AS SELECT 
 1 AS `Status`,
 1 AS `TrailId`,
 1 AS `rst_id`,
 1 AS `rst_pr_id`,
 1 AS `rst_stg_id`,
 1 AS `stg_name`,
 1 AS `rst_stage_status_id`,
 1 AS `ss_name`,
 1 AS `rst_txn_date`,
 1 AS `Modified`,
 1 AS `rst_note`,
 1 AS `rst_user_id`,
 1 AS `stf_name`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_request_list`
--

DROP TABLE IF EXISTS `vw_request_list`;
/*!50001 DROP VIEW IF EXISTS `vw_request_list`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vw_request_list` AS SELECT 
 1 AS `req_id`,
 1 AS `req_subject_id`,
 1 AS `sbj_code`,
 1 AS `sbj_name`,
 1 AS `req_division_id`,
 1 AS `div_name`,
 1 AS `req_public_id`,
 1 AS `pi_name`,
 1 AS `pi_mobile_phone`,
 1 AS `pi_email`,
 1 AS `req_ent_date`,
 1 AS `req_note`,
 1 AS `req_fees`,
 1 AS `req_user_id`,
 1 AS `stf_name`,
 1 AS `req_durartion`,
 1 AS `req_status_id`,
 1 AS `rs_name`,
 1 AS `req_is_read`,
 1 AS `req_processed`,
 1 AS `req_is_void`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_request_trail`
--

DROP TABLE IF EXISTS `vw_request_trail`;
/*!50001 DROP VIEW IF EXISTS `vw_request_trail`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vw_request_trail` AS SELECT 
 1 AS `Status`,
 1 AS `seq`,
 1 AS `req_id`,
 1 AS `req_ent_date`,
 1 AS `Modified`,
 1 AS `req_note`,
 1 AS `stf_name`,
 1 AS `req_user_id`,
 1 AS `req_status_id`,
 1 AS `rs_name`,
 1 AS `req_is_void`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_staff_list`
--

DROP TABLE IF EXISTS `vw_staff_list`;
/*!50001 DROP VIEW IF EXISTS `vw_staff_list`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vw_staff_list` AS SELECT 
 1 AS `id`,
 1 AS `text`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_test`
--

DROP TABLE IF EXISTS `vw_test`;
/*!50001 DROP VIEW IF EXISTS `vw_test`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vw_test` AS SELECT 
 1 AS `div_id`,
 1 AS `div_name`,
 1 AS `div_active`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `vw_annual_status`
--

/*!50001 DROP VIEW IF EXISTS `vw_annual_status`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_annual_status` AS select date_format(`r`.`req_ent_date`,_utf8'%Y') AS `EntYear`,count((case when (`r`.`req_status_id` = 1) then `r`.`req_id` else NULL end)) AS `New`,count((case when (`r`.`req_status_id` = 2) then `r`.`req_id` else NULL end)) AS `Opend`,count((case when (`r`.`req_status_id` = 3) then `r`.`req_id` else NULL end)) AS `Completed`,count((case when (`r`.`req_status_id` = 4) then `r`.`req_id` else NULL end)) AS `Closed` from (`request` `r` join `division` `d` on((`r`.`req_division_id` = `d`.`div_id`))) group by date_format(`r`.`req_ent_date`,_utf8'%Y') order by `r`.`req_ent_date` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_bar_by_all_division`
--

/*!50001 DROP VIEW IF EXISTS `vw_bar_by_all_division`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_bar_by_all_division` AS select date_format(`r`.`req_ent_date`,_utf8'%M') AS `EntMonth`,date_format(`r`.`req_ent_date`,_utf8'%m') AS `EntMonth1`,date_format(`r`.`req_ent_date`,_utf8'%Y') AS `EntYear`,count((case when (`r`.`req_status_id` = 1) then `r`.`req_id` else NULL end)) AS `New`,count((case when (`r`.`req_status_id` = 2) then `r`.`req_id` else NULL end)) AS `Opend`,count((case when (`r`.`req_status_id` = 3) then `r`.`req_id` else NULL end)) AS `Completed`,count((case when (`r`.`req_status_id` = 4) then `r`.`req_id` else NULL end)) AS `Closed` from (`request` `r` join `division` `d` on((`r`.`req_division_id` = `d`.`div_id`))) group by date_format(`r`.`req_ent_date`,_utf8'%M'),date_format(`r`.`req_ent_date`,_utf8'%Y') order by `r`.`req_ent_date` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_bar_by_division`
--

/*!50001 DROP VIEW IF EXISTS `vw_bar_by_division`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_bar_by_division` AS select `r`.`req_division_id` AS `req_division_id`,date_format(`r`.`req_ent_date`,_utf8'%b') AS `EntMonth`,date_format(`r`.`req_ent_date`,_utf8'%m') AS `EntMonth1`,date_format(`r`.`req_ent_date`,_utf8'%Y') AS `EntYear`,count((case when (`r`.`req_status_id` = 1) then `r`.`req_id` else NULL end)) AS `New`,count((case when (`r`.`req_status_id` = 2) then `r`.`req_id` else NULL end)) AS `Opend`,count((case when (`r`.`req_status_id` = 3) then `r`.`req_id` else NULL end)) AS `Completed`,count((case when (`r`.`req_status_id` = 4) then `r`.`req_id` else NULL end)) AS `Closed` from (`request` `r` join `division` `d` on((`r`.`req_division_id` = `d`.`div_id`))) group by `r`.`req_division_id`,date_format(`r`.`req_ent_date`,_utf8'%M'),date_format(`r`.`req_ent_date`,_utf8'%Y') order by `r`.`req_ent_date` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_div_period_status`
--

/*!50001 DROP VIEW IF EXISTS `vw_div_period_status`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_div_period_status` AS select `r`.`req_division_id` AS `div_id`,`d`.`div_name` AS `div_name`,date_format(`r`.`req_ent_date`,_utf8'%b') AS `EntMonth`,date_format(`r`.`req_ent_date`,_utf8'%m') AS `EntMonth1`,date_format(`r`.`req_ent_date`,_utf8'%Y') AS `EntYear`,count((case when (`r`.`req_status_id` = 1) then `r`.`req_id` else NULL end)) AS `New`,count((case when (`r`.`req_status_id` = 2) then `r`.`req_id` else NULL end)) AS `Opend`,count((case when (`r`.`req_status_id` = 3) then `r`.`req_id` else NULL end)) AS `Completed`,count((case when (`r`.`req_status_id` = 4) then `r`.`req_id` else NULL end)) AS `Closed` from (`request` `r` join `division` `d` on((`r`.`req_division_id` = `d`.`div_id`))) group by date_format(`r`.`req_ent_date`,_utf8'%M'),date_format(`r`.`req_ent_date`,_utf8'%Y'),`d`.`div_name` order by `r`.`req_ent_date` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_division_by_year`
--

/*!50001 DROP VIEW IF EXISTS `vw_division_by_year`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_division_by_year` AS select `r`.`req_division_id` AS `div_id`,`d`.`div_name` AS `div_name`,date_format(`r`.`req_ent_date`,_utf8'%Y') AS `EntYear`,count((case when (`r`.`req_status_id` = 1) then `r`.`req_id` else NULL end)) AS `New`,count((case when (`r`.`req_status_id` = 2) then `r`.`req_id` else NULL end)) AS `Opend`,count((case when (`r`.`req_status_id` = 3) then `r`.`req_id` else NULL end)) AS `Completed`,count((case when (`r`.`req_status_id` = 4) then `r`.`req_id` else NULL end)) AS `Closed` from (`request` `r` join `division` `d` on((`r`.`req_division_id` = `d`.`div_id`))) group by date_format(`r`.`req_ent_date`,_utf8'%Y'),`r`.`req_division_id` order by `r`.`req_ent_date` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_division_status`
--

/*!50001 DROP VIEW IF EXISTS `vw_division_status`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_division_status` AS select `d`.`div_name` AS `div_name`,count((case when (`r`.`req_status_id` = 1) then `r`.`req_id` else NULL end)) AS `New`,count((case when (`r`.`req_status_id` = 2) then `r`.`req_id` else NULL end)) AS `Opend`,count((case when (`r`.`req_status_id` = 3) then `r`.`req_id` else NULL end)) AS `Completed`,count((case when (`r`.`req_status_id` = 4) then `r`.`req_id` else NULL end)) AS `Closed` from (`request` `r` join `division` `d` on((`r`.`req_division_id` = `d`.`div_id`))) group by `d`.`div_name` order by `r`.`req_ent_date` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_donut_division`
--

/*!50001 DROP VIEW IF EXISTS `vw_donut_division`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_donut_division` AS select `r`.`req_status_id` AS `req_status_id`,`rs`.`rs_name` AS `label`,count(`r`.`req_id`) AS `value`,`r`.`req_division_id` AS `divId`,`d`.`div_name` AS `div_name` from ((`request` `r` join `request_status` `rs` on((`r`.`req_status_id` = `rs`.`rs_id`))) join `division` `d` on((`r`.`req_division_id` = `d`.`div_id`))) where (`r`.`req_status_id` in (1,2,3,4)) group by `r`.`req_status_id`,`rs`.`rs_name`,`r`.`req_division_id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_donut_division_period`
--

/*!50001 DROP VIEW IF EXISTS `vw_donut_division_period`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_donut_division_period` AS select `r`.`req_status_id` AS `req_status_id`,`rs`.`rs_name` AS `label`,count(`r`.`req_id`) AS `value`,`r`.`req_division_id` AS `Count`,date_format(`r`.`req_ent_date`,_utf8'%M') AS `EntMonth`,date_format(`r`.`req_ent_date`,_utf8'%Y') AS `EntYear` from (`request` `r` join `request_status` `rs` on((`r`.`req_status_id` = `rs`.`rs_id`))) group by `r`.`req_status_id`,`rs`.`rs_name`,`r`.`req_division_id`,date_format(`r`.`req_ent_date`,_utf8'%M'),date_format(`r`.`req_ent_date`,_utf8'%Y') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_last_modified`
--

/*!50001 DROP VIEW IF EXISTS `vw_last_modified`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_last_modified` AS select `rl`.`rl_pr_id` AS `rl_pr_id`,date_format(`rl`.`rl_ent_date`,'%Y-%m-%d') AS `DateEnt`,date_format(`rl`.`rl_txn_date`,'%Y-%m-%d') AS `Modified`,`rl`.`rl_note` AS `rl_note`,`rl`.`rl_user_id` AS `rl_user_id`,`s`.`stf_name` AS `stf_name` from ((`request_log` `rl` join `request` `r` on((`rl`.`rl_pr_id` = `r`.`req_id`))) join `staff` `s` on((`rl`.`rl_user_id` = `s`.`stf_id`))) order by `rl`.`rl_txn_date` desc limit 25 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_monthly_status`
--

/*!50001 DROP VIEW IF EXISTS `vw_monthly_status`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_monthly_status` AS select date_format(`r`.`req_ent_date`,_utf8'%b') AS `EntMonth`,date_format(`r`.`req_ent_date`,_utf8'%m') AS `EntMonth1`,date_format(`r`.`req_ent_date`,_utf8'%Y') AS `EntYear`,count((case when (`r`.`req_status_id` = 1) then `r`.`req_id` else NULL end)) AS `New`,count((case when (`r`.`req_status_id` = 2) then `r`.`req_id` else NULL end)) AS `Opend`,count((case when (`r`.`req_status_id` = 3) then `r`.`req_id` else NULL end)) AS `Completed`,count((case when (`r`.`req_status_id` = 4) then `r`.`req_id` else NULL end)) AS `Closed` from (`request` `r` join `division` `d` on((`r`.`req_division_id` = `d`.`div_id`))) group by date_format(`r`.`req_ent_date`,_utf8'%M'),date_format(`r`.`req_ent_date`,_utf8'%Y') order by `r`.`req_ent_date` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_req_batch_count`
--

/*!50001 DROP VIEW IF EXISTS `vw_req_batch_count`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_req_batch_count` AS select `r`.`req_status_id` AS `req_status_id`,`rs`.`rs_name` AS `rs_name`,count(`r`.`req_id`) AS `count` from (`request` `r` join `request_status` `rs` on((`r`.`req_status_id` = `rs`.`rs_id`))) group by `r`.`req_status_id`,`rs`.`rs_name` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_req_completed`
--

/*!50001 DROP VIEW IF EXISTS `vw_req_completed`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_req_completed` AS select `r`.`req_id` AS `req_id`,`r`.`req_subject_id` AS `req_subject_id`,`sb`.`sbj_code` AS `sbj_code`,`r`.`req_division_id` AS `req_division_id`,`d`.`div_name` AS `div_name`,`r`.`req_public_id` AS `req_public_id`,`p`.`pi_name` AS `pi_name`,`r`.`req_status_id` AS `req_status_id`,`rs`.`rs_name` AS `rs_name`,date_format(now(),'%Y-%m-%d') AS `today`,date_format(`r`.`req_ent_date`,'%Y-%m-%d') AS `EntDate`,`sb`.`sbj_duration` AS `sbj_duration`,((date_format(now(),'%Y%m%d') - date_format(`r`.`req_ent_date`,'%Y%m%d')) - `sb`.`sbj_duration`) AS `Past` from ((((`request` `r` join `subject` `sb` on((`r`.`req_subject_id` = `sb`.`sbj_id`))) join `division` `d` on((`r`.`req_division_id` = `d`.`div_id`))) join `public_individual` `p` on((`r`.`req_public_id` = `p`.`pi_id`))) join `request_status` `rs` on((`r`.`req_status_id` = `rs`.`rs_id`))) where (`r`.`req_status_id` = 3) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_req_overdue`
--

/*!50001 DROP VIEW IF EXISTS `vw_req_overdue`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_req_overdue` AS select `r`.`req_id` AS `req_id`,`r`.`req_subject_id` AS `req_subject_id`,`sb`.`sbj_code` AS `sbj_code`,`r`.`req_division_id` AS `req_division_id`,`d`.`div_name` AS `div_name`,`r`.`req_public_id` AS `req_public_id`,`p`.`pi_name` AS `pi_name`,`r`.`req_status_id` AS `req_status_id`,`rs`.`rs_name` AS `rs_name`,date_format(now(),'%Y-%m-%d') AS `today`,date_format(`r`.`req_ent_date`,'%Y-%m-%d') AS `EntDate`,`sb`.`sbj_duration` AS `sbj_duration`,`TOTAL_WEEKDAYS`(date_format(now(),'%Y-%m-%d'),date_format(`r`.`req_ent_date`,'%Y-%m-%d')) AS `Overdue` from ((((`request` `r` join `subject` `sb` on((`r`.`req_subject_id` = `sb`.`sbj_id`))) join `division` `d` on((`r`.`req_division_id` = `d`.`div_id`))) join `public_individual` `p` on((`r`.`req_public_id` = `p`.`pi_id`))) join `request_status` `rs` on((`r`.`req_status_id` = `rs`.`rs_id`))) where ((`r`.`req_status_id` not in (3,4)) and (`TOTAL_WEEKDAYS`(date_format(now(),'%Y-%m-%d'),date_format(`r`.`req_ent_date`,'%Y-%m-%d')) > 0)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_req_status_summary`
--

/*!50001 DROP VIEW IF EXISTS `vw_req_status_summary`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_req_status_summary` AS select `rs`.`rs_name` AS `label`,count(`r`.`req_id`) AS `value`,`r`.`req_division_id` AS `req_division_id`,`r`.`req_ent_date` AS `req_ent_date` from (`request` `r` join `request_status` `rs` on((`r`.`req_status_id` = `rs`.`rs_id`))) where (`r`.`req_status_id` in (1,2,3,4)) group by `r`.`req_status_id`,`rs`.`rs_name` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_req_stg_trail`
--

/*!50001 DROP VIEW IF EXISTS `vw_req_stg_trail`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_req_stg_trail` AS select 'Original' AS `Status`,0 AS `TrailId`,`ps`.`rst_id` AS `rst_id`,`ps`.`rst_pr_id` AS `rst_pr_id`,`ps`.`rst_stg_id` AS `rst_stg_id`,`sg`.`stg_name` AS `stg_name`,`ps`.`rst_stage_status_id` AS `rst_stage_status_id`,`ss`.`ss_name` AS `ss_name`,date_format(`ps`.`rst_txn_date`,'%Y-%m-%d') AS `rst_txn_date`,NULL AS `Modified`,`ps`.`rst_note` AS `rst_note`,`ps`.`rst_user_id` AS `rst_user_id`,`stf`.`stf_name` AS `stf_name` from ((((`process_stage` `ps` join `request` `r` on((`ps`.`rst_pr_id` = `r`.`req_id`))) join `subjec_stage` `sg` on((`ps`.`rst_stg_id` = `sg`.`stg_id`))) join `staff` `stf` on((`stf`.`stf_id` = `ps`.`rst_user_id`))) join `stage_status` `ss` on((`ss`.`ss_id` = `ps`.`rst_stage_status_id`))) union all select 'Modified' AS `Staus`,`sl`.`ps_id` AS `ps_id`,`sl`.`ps_rst_id` AS `ps_rst_id`,`ps`.`rst_pr_id` AS `rst_pr_id`,`sl`.`ps_stage_id` AS `ps_stage_id`,`sg`.`stg_name` AS `stg_name`,`sl`.`ps_status_id` AS `ps_status_id`,`ss`.`ss_name` AS `ss_name`,NULL AS `NULL`,date_format(`sl`.`ps_txn_date`,'%Y-%m-%d') AS `ps_txn_date`,`sl`.`ps_note` AS `ps_note`,`sl`.`ps_user_id` AS `ps_user_id`,`stf`.`stf_name` AS `stf_name` from ((((`stage_log` `sl` join `process_stage` `ps` on((`sl`.`ps_rst_id` = `ps`.`rst_id`))) join `subjec_stage` `sg` on((`sl`.`ps_stage_id` = `sg`.`stg_id`))) join `staff` `stf` on((`stf`.`stf_id` = `sl`.`ps_user_id`))) join `stage_status` `ss` on((`ss`.`ss_id` = `sl`.`ps_status_id`))) order by `rst_id`,`rst_pr_id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_request_list`
--

/*!50001 DROP VIEW IF EXISTS `vw_request_list`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_request_list` AS select `r`.`req_id` AS `req_id`,`r`.`req_subject_id` AS `req_subject_id`,`s`.`sbj_code` AS `sbj_code`,`s`.`sbj_name` AS `sbj_name`,`r`.`req_division_id` AS `req_division_id`,`d`.`div_name` AS `div_name`,`r`.`req_public_id` AS `req_public_id`,`p`.`pi_name` AS `pi_name`,`p`.`pi_mobile_phone` AS `pi_mobile_phone`,`p`.`pi_email` AS `pi_email`,`r`.`req_ent_date` AS `req_ent_date`,`r`.`req_note` AS `req_note`,`r`.`req_fees` AS `req_fees`,`r`.`req_user_id` AS `req_user_id`,`st`.`stf_name` AS `stf_name`,`r`.`req_durartion` AS `req_durartion`,`r`.`req_status_id` AS `req_status_id`,`rs`.`rs_name` AS `rs_name`,`r`.`req_is_read` AS `req_is_read`,`r`.`req_processed` AS `req_processed`,`r`.`req_is_void` AS `req_is_void` from (((((`request` `r` join `division` `d` on((`r`.`req_division_id` = `d`.`div_id`))) join `public_individual` `p` on((`r`.`req_public_id` = `p`.`pi_id`))) join `subject` `s` on((`r`.`req_subject_id` = `s`.`sbj_id`))) join `staff` `st` on((`r`.`req_user_id` = `st`.`stf_id`))) join `request_status` `rs` on((`r`.`req_status_id` = `rs`.`rs_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_request_trail`
--

/*!50001 DROP VIEW IF EXISTS `vw_request_trail`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_request_trail` AS select 'Original' AS `Status`,1 AS `seq`,`r`.`req_id` AS `req_id`,`r`.`req_ent_date` AS `req_ent_date`,'' AS `Modified`,`r`.`req_note` AS `req_note`,`s`.`stf_name` AS `stf_name`,`r`.`req_user_id` AS `req_user_id`,`r`.`req_status_id` AS `req_status_id`,`rs`.`rs_name` AS `rs_name`,`r`.`req_is_void` AS `req_is_void` from ((`request` `r` join `request_status` `rs` on((`r`.`req_status_id` = `rs`.`rs_id`))) join `staff` `s` on((`r`.`req_user_id` = `s`.`stf_id`))) union all select 'Modified' AS `Status`,2 AS `seq`,`rl`.`rl_pr_id` AS `rl_pr_id`,'' AS `req_ent_date`,`rl`.`rl_txn_date` AS `rl_txn_date`,`rl`.`rl_note` AS `rl_note`,`s`.`stf_name` AS `stf_name`,`rl`.`rl_user_id` AS `rl_user_id`,`rl`.`rl_status_id` AS `rl_status_id`,`rs`.`rs_name` AS `rs_name`,`rl`.`rl_void` AS `rl_void` from ((`request_log` `rl` join `request_status` `rs` on((`rl`.`rl_status_id` = `rs`.`rs_id`))) join `staff` `s` on((`s`.`stf_id` = `rl`.`rl_user_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_staff_list`
--

/*!50001 DROP VIEW IF EXISTS `vw_staff_list`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_staff_list` AS select `staff`.`stf_id` AS `id`,`staff`.`stf_name` AS `text` from `staff` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_test`
--

/*!50001 DROP VIEW IF EXISTS `vw_test`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_test` AS select `division`.`div_id` AS `div_id`,`division`.`div_name` AS `div_name`,`division`.`div_active` AS `div_active` from `division` */;
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

-- Dump completed on 2016-05-01 12:42:36

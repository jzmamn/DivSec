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
  `app_req_status` int(11) DEFAULT NULL,
  `app_date` datetime DEFAULT NULL,
  `app_is_printed` bit(1) DEFAULT NULL,
  `app_printed_date` datetime DEFAULT NULL,
  `app_user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`app_id`),
  UNIQUE KEY `app_request_id_UNIQUE` (`app_request_id`),
  KEY `fk_app_request_id_idx` (`app_request_id`),
  CONSTRAINT `fk_app_request_id` FOREIGN KEY (`app_request_id`) REFERENCES `request` (`req_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aproval`
--

LOCK TABLES `aproval` WRITE;
/*!40000 ALTER TABLE `aproval` DISABLE KEYS */;
INSERT INTO `aproval` VALUES (1,11,5,'2016-06-05 09:53:19','','2016-06-21 22:20:49',67),(2,8,6,'2016-06-14 04:09:29','\0','2016-06-21 22:20:49',67),(3,18,7,'2016-06-14 03:59:31','\0','2016-06-21 22:20:49',67),(6,17,6,'2016-06-06 07:47:36','\0','2016-06-21 22:20:49',67),(12,26,6,'2016-06-26 04:07:14','\0','2016-06-21 22:20:49',67),(13,23,5,'2016-06-14 06:02:27','','2016-06-21 22:20:49',23),(14,31,5,'2016-06-18 10:15:16','','2016-06-21 22:20:49',67),(15,28,5,'2016-06-18 10:20:47','','2016-06-21 22:20:49',67),(16,42,5,'2016-06-21 10:10:35','','2016-06-21 22:20:49',67),(17,34,7,'2016-06-26 04:07:20','\0','2016-06-21 22:20:49',67),(18,38,5,'2016-06-24 04:14:10','\0',NULL,67),(19,40,5,'2016-06-24 05:19:18','\0',NULL,73),(20,49,5,'2016-06-25 04:29:26','\0',NULL,73),(21,45,5,'2016-06-25 05:01:48','\0',NULL,74),(22,41,5,'2016-06-25 05:03:13','\0',NULL,74),(23,50,5,'2016-06-25 05:14:21','\0',NULL,74),(24,51,5,'2016-06-25 05:14:29','\0',NULL,74),(25,54,5,'2016-06-26 04:03:35','\0',NULL,23),(26,55,5,'2016-06-26 04:04:48','\0',NULL,74);
/*!40000 ALTER TABLE `aproval` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client_role`
--

DROP TABLE IF EXISTS `client_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `client_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_client_id` int(11) NOT NULL,
  `role_role_id` int(11) DEFAULT NULL,
  `role_role_name` varchar(45) DEFAULT 'ROLE_CLIENT',
  PRIMARY KEY (`id`),
  KEY `fk_role_client_id_idx` (`role_client_id`),
  CONSTRAINT `fk_role_client_id` FOREIGN KEY (`role_client_id`) REFERENCES `public_individual` (`pi_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client_role`
--

LOCK TABLES `client_role` WRITE;
/*!40000 ALTER TABLE `client_role` DISABLE KEYS */;
INSERT INTO `client_role` VALUES (1,1,4,'ROLE_CLIENT');
/*!40000 ALTER TABLE `client_role` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `division`
--

LOCK TABLES `division` WRITE;
/*!40000 ALTER TABLE `division` DISABLE KEYS */;
INSERT INTO `division` VALUES (1,'Admin',''),(2,'Planning',''),(3,'Registrar',''),(4,'Agriculture',''),(5,'Accounts',''),(6,'Social Welfare',''),(7,'Disaster Management',''),(8,'Samurdhi',''),(9,'Land','');
/*!40000 ALTER TABLE `division` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_log`
--

DROP TABLE IF EXISTS `email_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `email_log` (
  `email_id` int(11) NOT NULL AUTO_INCREMENT,
  `email_date` datetime DEFAULT NULL,
  `email_req_id` int(11) DEFAULT NULL,
  `email_user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`email_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_log`
--

LOCK TABLES `email_log` WRITE;
/*!40000 ALTER TABLE `email_log` DISABLE KEYS */;
INSERT INTO `email_log` VALUES (6,'2016-06-12 11:20:52',21,67),(7,'2016-06-20 10:45:57',38,67),(8,'2016-06-21 03:50:47',38,67);
/*!40000 ALTER TABLE `email_log` ENABLE KEYS */;
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
-- Table structure for table `holiday`
--

DROP TABLE IF EXISTS `holiday`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `holiday` (
  `hol_id` int(11) NOT NULL AUTO_INCREMENT,
  `hol_date` datetime DEFAULT NULL,
  `hol_desc` varchar(50) DEFAULT NULL,
  `hol_is_active` bit(1) DEFAULT NULL,
  PRIMARY KEY (`hol_id`),
  UNIQUE KEY `id_UNIQUE` (`hol_id`),
  UNIQUE KEY `hol_date_UNIQUE` (`hol_date`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `holiday`
--

LOCK TABLES `holiday` WRITE;
/*!40000 ALTER TABLE `holiday` DISABLE KEYS */;
INSERT INTO `holiday` VALUES (1,'2016-05-09 00:00:00','Lieu Leave for Poya day',''),(2,'2016-05-15 00:00:00','Poyadays',''),(3,'2016-06-20 00:00:00','Office Holiday',''),(4,'2016-06-28 00:00:00','Sick Leave',''),(5,'2016-07-06 00:00:00','Ramzan Festival',''),(6,'2016-06-23 00:00:00','Official Leave','');
/*!40000 ALTER TABLE `holiday` ENABLE KEYS */;
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
  KEY `fk_ins_stf_id_idx` (`ins_stf_id`),
  CONSTRAINT `fk_ins_pr_id` FOREIGN KEY (`ins_pr_id`) REFERENCES `request` (`req_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_ins_stf_id` FOREIGN KEY (`ins_stf_id`) REFERENCES `staff` (`stf_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instructions`
--

LOCK TABLES `instructions` WRITE;
/*!40000 ALTER TABLE `instructions` DISABLE KEYS */;
INSERT INTO `instructions` VALUES (1,12,'IAny candidate, who is unable to sit for an examination paper or the examination due to illness, should submit Medical Certificate and submission form with relevant details “within seven working days with effect from exam date” to the Examinations & Registration Branch.','2016-01-14 01:52:18','\0',67),(2,11,'this is jezeem aymen','2016-01-14 01:52:18','\0',67),(3,11,'IAny candidate, who is unable to sit for an examination paper or the examination due to illness, should submit Medical Certificate and submission form with relevant details “within seven working days with effect from exam date” to the Examinations & Registration Branch.','2016-01-14 01:53:14','\0',67),(4,10,'this is jezeem aymen','2016-01-14 01:53:56','\0',67),(5,13,'IAny candidate, who is unable to sit for an examination paper or the examination due to illness, should submit Medical Certificate and submission form with relevant details “within seven working days with effect from exam date” to the Examinations & Registration Branch.','2016-01-14 04:29:33','\0',67),(6,13,'this is jezeem aymen','2016-01-14 04:56:36','\0',67),(7,13,'IAny candidate, who is unable to sit for an examination paper or the examination due to illness, should submit Medical Certificate and submission form with relevant details “within seven working days with effect from exam date” to the Examinations & Registration Branch.','2016-01-14 04:58:14','\0',67),(8,13,'this is jezeem aymen','2016-01-14 05:01:38','\0',67),(9,13,'IAny candidate, who is unable to sit for an examination paper or the examination due to illness, should submit Medical Certificate and submission form with relevant details “within seven working days with effect from exam date” to the Examinations & Registration Branch.','2016-01-14 05:09:10','\0',67),(10,13,'this is jezeem aymen','2016-01-14 05:13:22','\0',67),(11,13,'IAny candidate, who is unable to sit for an examination paper or the examination due to illness, should submit Medical Certificate and submission form with relevant details “within seven working days with effect from exam date” to the Examinations & Registration Branch.','2016-01-14 05:15:53','\0',67),(12,13,'this is jezeem aymen','2016-01-14 05:16:33','\0',67),(13,13,'IAny candidate, who is unable to sit for an examination paper or the examination due to illness, should submit Medical Certificate and submission form with relevant details “within seven working days with effect from exam date” to the Examinations & Registration Branch.','2016-01-14 09:16:32','\0',67),(14,13,'this is jezeem aymen','2016-01-15 00:22:58','\0',67),(15,13,'This is the last instruction','2016-01-15 00:29:37','\0',67),(16,10,'Attend to this','2016-01-19 07:58:46','\0',67),(17,10,'Attend to this','2016-01-19 07:59:00','\0',67),(18,10,'how is the thing','2016-01-19 07:59:22','\0',67),(19,12,'this is','2016-01-19 08:06:08','\0',67),(20,12,'please get the matter','2016-01-19 08:11:21','\0',67),(21,13,'Attend to this','2016-01-19 08:14:25','\0',67),(22,7,'Attend to this','2016-01-19 08:14:59','\0',67),(23,7,'please get the matter','2016-01-19 08:15:01','\0',67),(24,7,'please get the matter','2016-01-19 08:18:28','\0',67),(25,12,'adf','2016-01-19 08:20:34','\0',67),(26,11,'pleas do this immediately','2016-01-19 08:24:48','\0',67),(27,13,'can be done','2016-01-24 08:40:19','\0',67),(28,19,'Please do this immediately','2016-01-06 11:43:27','\0',67),(29,20,'complete this','2016-01-06 09:40:14','\0',67),(30,20,'get approval','2016-01-09 07:32:55','\0',67),(31,7,'Try to sort out the problem','2016-01-12 09:47:55','\0',67),(32,26,'Please sort out the problem','2016-01-12 09:53:31','\0',67),(33,7,'Get the approval','2016-01-12 10:38:21','\0',67),(34,7,'Get the approval','2016-01-12 10:38:31','\0',67),(35,7,'Get the approval','2016-01-12 10:38:32','\0',67),(36,7,'Get the approval','2016-01-12 10:39:43','\0',67),(37,26,'aymen','2016-01-12 10:41:03','\0',67),(38,26,'qwq','2016-01-12 10:41:47','\0',67),(39,26,'qwq','2016-01-12 10:42:11','\0',67),(40,26,'dsf','2016-01-12 10:44:03','\0',67),(41,26,'dsf','2016-01-12 10:44:07','\0',67),(42,26,'wwww','2016-06-12 10:50:13','\0',67),(43,26,'wew','2016-06-12 10:50:20','\0',67),(44,26,'qwe','2016-06-12 10:53:12','\0',67),(45,45,'Please sort out the problem','2016-06-24 05:17:18','\0',67);
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
) ENGINE=InnoDB AUTO_INCREMENT=127 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `process_stage`
--

LOCK TABLES `process_stage` WRITE;
/*!40000 ALTER TABLE `process_stage` DISABLE KEYS */;
INSERT INTO `process_stage` VALUES (11,7,1,1,0,'2016-01-04 10:57:47','',23),(12,7,2,1,1,'2016-01-04 10:57:47','',23),(13,8,1,1,0,'2016-01-05 10:59:06','',23),(14,8,2,1,1,'2016-01-05 10:59:06','',23),(15,10,1,1,0,'2016-01-06 08:04:51','',23),(16,10,2,1,1,'2016-01-06 08:04:51','',23),(17,11,1,2,0,'2016-01-07 04:55:40','jezeem',23),(18,11,2,3,1,'2016-01-07 04:55:40','New note',23),(19,12,1,1,0,'2016-01-13 09:55:11','',23),(20,12,2,1,1,'2016-01-13 09:55:11','',23),(21,13,1,3,0,'2016-01-13 10:02:51','Completed',23),(22,13,2,3,1,'2016-01-13 10:02:51','stage',23),(23,14,1,3,0,'2016-01-14 10:50:00','Given to cleark',23),(24,14,2,3,1,'2016-01-14 10:50:00','stage',23),(25,15,3,3,0,'2016-01-24 00:03:38','stage',23),(26,16,4,1,0,'2016-01-24 05:53:14','',21),(27,17,4,1,0,'2016-01-03 09:07:29','',23),(28,18,4,2,0,'2016-01-03 09:08:27','stage',23),(29,19,4,2,0,'2016-01-06 11:42:58','stage',21),(30,20,6,3,0,'2016-01-06 09:23:50','stage',23),(31,20,7,3,1,'2016-01-06 09:23:50','stage',23),(32,20,8,3,2,'2016-01-06 09:23:51','stage',23),(33,22,3,1,0,'2016-06-10 08:02:56','',67),(34,23,3,1,0,'2016-06-12 01:17:43','',67),(35,24,6,1,0,'2016-06-12 01:22:13','',67),(36,24,7,1,1,'2016-06-12 01:22:13','',67),(37,24,8,1,2,'2016-06-12 01:22:13','',67),(38,25,10,1,0,'2016-06-12 01:29:53','',67),(39,26,10,2,0,'2016-06-12 01:35:08','stage',67),(40,27,1,1,0,'2016-06-18 05:40:47','',67),(41,27,2,1,1,'2016-06-18 05:40:47','',67),(42,27,11,1,2,'2016-06-18 05:40:47','',67),(43,28,3,1,0,'2016-06-18 05:42:33','',67),(44,28,12,1,1,'2016-06-18 05:42:34','',67),(45,29,1,1,0,'2016-06-18 05:44:46','',67),(46,29,2,1,1,'2016-06-18 05:44:46','',67),(47,29,11,1,2,'2016-06-18 05:44:46','',67),(48,30,1,1,0,'2016-06-18 05:44:19','',67),(49,30,2,2,1,'2016-06-18 05:44:19','stage',67),(50,30,11,1,2,'2016-06-18 05:44:19','',67),(51,31,1,1,0,'2016-06-18 09:44:13','',67),(52,31,2,1,1,'2016-06-18 09:44:13','',67),(53,31,11,1,2,'2016-06-18 09:44:13','',67),(54,32,10,1,0,'2016-06-18 09:57:11','',67),(55,33,5,3,0,'2016-06-18 10:04:23','stage',67),(56,34,9,1,0,'2016-06-18 10:11:50','',67),(57,35,4,1,0,'2016-06-18 10:15:53','',67),(58,36,6,1,0,'2016-06-18 10:19:26','',67),(59,36,7,1,1,'2016-06-18 10:19:26','',67),(60,36,8,1,2,'2016-06-18 10:19:26','',67),(61,37,10,1,0,'2016-06-18 10:21:03','',67),(62,38,1,1,0,'2016-06-18 11:11:23','',67),(63,38,2,1,1,'2016-06-18 11:11:24','',67),(64,39,5,3,0,'2016-06-21 10:01:42','stage',67),(65,39,51,2,1,'2016-06-21 10:01:42','stage',67),(66,39,52,2,2,'2016-06-21 10:01:42','stage',67),(67,39,53,1,3,'2016-06-21 10:01:42','',67),(68,39,54,3,4,'2016-06-21 10:01:42','stage',67),(69,40,13,3,0,'2016-06-21 10:05:49','stage',67),(70,40,14,3,1,'2016-06-21 10:05:49','stage',67),(71,40,15,1,2,'2016-06-21 10:05:49','',67),(72,41,55,3,0,'2016-06-21 10:08:39','stage',67),(73,41,56,3,1,'2016-06-21 10:08:39','stage',67),(74,41,57,3,2,'2016-06-21 10:08:39','stage',67),(75,42,18,1,0,'2016-06-21 10:10:17','',67),(76,42,24,1,1,'2016-06-21 10:10:17','',67),(77,42,25,1,2,'2016-06-21 10:10:18','',67),(78,43,19,1,0,'2016-06-22 04:00:49','',67),(79,43,27,1,1,'2016-06-22 04:00:49','',67),(80,43,28,1,2,'2016-06-22 04:00:49','',67),(81,43,29,1,3,'2016-06-22 04:00:49','',67),(82,44,5,3,0,'2016-06-24 04:16:00','stage',67),(83,44,51,3,1,'2016-06-24 04:16:00','stage',67),(84,44,52,3,2,'2016-06-24 04:16:00','stage',67),(85,44,53,3,3,'2016-06-24 04:16:00','stage',67),(86,44,54,3,4,'2016-06-24 04:16:00','stage',67),(87,45,55,3,0,'2016-06-24 05:13:11','stage',67),(88,45,56,3,1,'2016-06-24 05:13:11','stage',67),(89,45,57,2,2,'2016-06-24 05:13:11','stage',67),(90,46,55,3,0,'2016-06-25 04:18:10','stage',73),(91,46,56,3,1,'2016-06-25 04:18:10','stage',73),(92,46,57,3,2,'2016-06-25 04:18:10','stage',73),(93,47,13,1,0,'2016-06-25 04:18:55','',73),(94,47,14,1,1,'2016-06-25 04:18:55','',73),(95,47,15,1,2,'2016-06-25 04:18:55','',73),(96,48,13,3,0,'2016-06-25 04:23:20','stage',73),(97,48,14,3,1,'2016-06-25 04:23:20','stage',73),(98,48,15,3,2,'2016-06-25 04:23:20','stage',73),(99,49,13,1,0,'2016-06-25 04:25:30','',73),(100,49,14,1,1,'2016-06-25 04:25:30','',73),(101,49,15,1,2,'2016-06-25 04:25:30','',73),(102,50,55,1,0,'2016-06-25 04:56:27','',74),(103,50,56,1,1,'2016-06-25 04:56:27','',74),(104,50,57,1,2,'2016-06-25 04:56:27','',74),(105,51,55,1,0,'2016-06-25 05:04:36','',74),(106,51,56,1,1,'2016-06-25 05:04:36','',74),(107,51,57,1,2,'2016-06-25 05:04:36','',74),(108,52,55,1,0,'2016-06-25 05:09:31','',74),(109,52,56,1,1,'2016-06-25 05:09:31','',74),(110,52,57,1,2,'2016-06-25 05:09:31','',74),(111,53,3,1,0,'2016-06-25 05:18:59','',23),(112,53,12,2,1,'2016-06-25 05:18:59','stage',23),(113,53,42,1,2,'2016-06-25 05:18:59','',23),(114,53,43,3,3,'2016-06-25 05:18:59','stage',23),(115,53,44,1,4,'2016-06-25 05:18:59','',23),(116,54,1,1,0,'2016-06-25 05:22:31','',67),(117,54,2,1,1,'2016-06-25 05:22:31','',67),(118,54,39,1,2,'2016-06-25 05:22:31','',67),(119,54,40,1,3,'2016-06-25 05:22:31','',67),(120,54,41,1,4,'2016-06-25 05:22:31','',67),(121,55,55,1,0,'2016-06-25 05:37:43','',74),(122,55,56,1,1,'2016-06-25 05:37:43','',74),(123,55,57,1,2,'2016-06-25 05:37:44','',74),(124,56,55,2,0,'2016-06-25 05:41:43','stage',67),(125,56,56,1,1,'2016-06-25 05:41:43','stage',67),(126,56,57,3,2,'2016-06-25 05:41:43','stage',67);
/*!40000 ALTER TABLE `process_stage` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `divsec`.`process_stage_AFTER_UPDATE` AFTER UPDATE ON `process_stage` FOR EACH ROW
BEGIN 

INSERT INTO `stage_log`
(ps_pr_id,`ps_rst_id`,`ps_stage_id`,`ps_status_id`,`ps_txn_date`,`ps_user_id`,`ps_note`,`ps_ent_date`)
VALUES
(OLD.`rst_pr_id`,OLD.rst_id,OLD.`rst_stg_id`,OLD.`rst_stage_status_id`,
    now(),OLD.`rst_user_id`,OLD.`rst_note`,OLD.`rst_txn_date`);

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

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
  `pi_ind_user_id` varchar(50) DEFAULT NULL,
  `pi_user_pwd` varchar(100) DEFAULT NULL,
  `pi_nic` varchar(10) DEFAULT NULL,
  `pi_dob` datetime DEFAULT NULL,
  `pi_gender` varchar(20) DEFAULT NULL,
  `pi_note` varchar(100) DEFAULT NULL,
  `pi_user_id` int(11) DEFAULT NULL,
  `pi_notfication_type_id` int(11) DEFAULT NULL,
  `pi_active` bit(1) DEFAULT NULL,
  `pi_role` varchar(20) DEFAULT 'ROLE_CLIENT',
  PRIMARY KEY (`pi_id`),
  KEY `pi_notfication_id_idx` (`pi_notfication_type_id`),
  CONSTRAINT `fk_pi_notfication_type_id` FOREIGN KEY (`pi_notfication_type_id`) REFERENCES `notification` (`ntn_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `public_individual`
--

LOCK TABLES `public_individual` WRITE;
/*!40000 ALTER TABLE `public_individual` DISABLE KEYS */;
INSERT INTO `public_individual` VALUES (1,'N.J.Aymen','105, Main Road,','Nintavur','06','123123','773166010','jzmamn@gmail.com',NULL,NULL,'821491169v','1980-10-01 00:00:00','Male','Brother of Yazir Aymen',67,4,'','ROLE_CLIENT'),(2,'A.S. Wickramaratna','School Avenue','Nintavur','5','1234232323','773166010','jzmamn@gmail.com',NULL,NULL,'232323232v','2016-01-07 00:00:00','Female','adfs',67,2,'','ROLE_CLIENT'),(3,'S.Ranasinghe','1 st Cross Street','Addapallama','1','1234232323','773166010','jzmamn@gmail.com',NULL,NULL,'232323232v','2015-09-12 00:00:00','Male','adfs',67,2,'','ROLE_CLIENT'),(4,'W.Pubudu','22B, Hospital Road','Nintavur','4','11','773166010','jzmamn@gmail.com',NULL,NULL,'2322323232','2015-12-14 00:00:00','Male','233232',67,1,'','ROLE_CLIENT'),(5,'M.S. Jayawardana','56/8A, Park Road','Oluvil','05','123445','773166010','jamz@aho.com',NULL,NULL,'821411111','2016-02-17 00:00:00','Male','',67,3,'\0','ROLE_CLIENT'),(10,'K.Ravi','23, Second Cross Road','Nintavur','05','1234232323','773166010','jzmamn@gmail.com',NULL,NULL,'982522522v','2016-06-18 00:00:00','Male','',67,1,'\0','ROLE_CLIENT'),(11,'J.S. Bernard','Main Street','Nintavur','08','','773166010','jzmamn@gmail.com',NULL,NULL,'','1980-02-05 00:00:00','Male','',67,1,'\0','ROLE_CLIENT'),(12,'D.Chamila Silva','20, 2nd Cross Road,','Addapallama','06','','773166010','jzmamn@gmail.com',NULL,NULL,'','1970-02-03 00:00:00','Male','',67,1,'','ROLE_CLIENT');
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
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8 COMMENT='details about the request submitted by the public individual';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `request`
--

LOCK TABLES `request` WRITE;
/*!40000 ALTER TABLE `request` DISABLE KEYS */;
INSERT INTO `request` VALUES (7,4,2,1,'2016-01-04 00:00:00','This is void',1200.00,23,1,8,'\0','\0','\0'),(8,4,2,1,'2016-02-05 00:00:00','new',1200.00,23,1,3,'\0','\0','\0'),(10,4,2,1,'2016-02-06 00:00:00','new',1200.00,67,1,8,'\0','\0','\0'),(11,4,2,1,'2016-01-07 00:00:00','12',1200.00,23,1,4,'\0','\0','\0'),(12,4,2,4,'2016-01-13 00:00:00','New',1200.00,23,1,3,'\0','\0','\0'),(13,4,2,1,'2016-01-13 00:00:00','jezeem',1200.00,23,1,3,'\0','\0','\0'),(14,4,2,1,'2016-01-14 00:00:00','Birth Certificate',1200.00,23,1,3,'\0','\0','\0'),(15,5,2,1,'2016-02-24 00:00:00','first seen',2.00,23,2,4,'\0','\0','\0'),(16,11,9,1,'2016-02-24 00:00:00','new',1000.00,21,1,3,'\0','\0','\0'),(17,11,9,1,'2016-02-03 00:00:00','Test',1000.00,23,1,3,'\0','\0','\0'),(18,11,9,1,'2016-02-03 00:00:00','this',1000.00,23,1,7,'\0','\0','\0'),(19,11,9,4,'2016-02-06 00:00:00','new',1000.00,21,1,4,'\0','\0','\0'),(20,10,3,1,'2016-02-06 00:00:00','new',1000.00,23,2,3,'\0','\0','\0'),(21,9,1,2,'2016-05-01 00:00:00','new',2323.00,21,23,3,'\0','\0','\0'),(22,5,2,5,'2016-06-10 00:00:00','first seen',200.00,67,2,3,'\0','\0','\0'),(23,5,2,3,'2016-06-12 00:00:00','first seen',200.00,67,2,3,'\0','\0','\0'),(24,10,3,2,'2016-06-12 00:00:00','first seen',1000.00,67,2,2,'\0','\0','\0'),(25,9,1,4,'2016-06-12 00:00:00','first seen',2323.00,67,23,2,'\0','\0',''),(26,9,1,3,'2016-06-12 00:00:00','first seen',2323.00,67,23,6,'\0','\0','\0'),(27,4,2,3,'2016-06-18 00:00:00','first seen',1200.00,67,1,2,'\0','\0',''),(28,5,2,5,'2016-06-18 00:00:00','first seen',200.00,67,2,5,'\0','\0',''),(29,4,2,4,'2016-06-18 00:00:00','first seen',1200.00,67,1,3,'\0','\0',''),(30,4,2,5,'2016-06-18 00:00:00','first seen',1200.00,67,1,2,'\0','\0','\0'),(31,4,2,4,'2016-06-18 00:00:00','first seen',1200.00,67,1,5,'\0','\0',''),(32,9,1,3,'2016-06-18 00:00:00','first seen',100.00,67,2,2,'\0','\0',''),(33,8,5,5,'2016-06-18 00:00:00','first seen',0.00,67,1,3,'\0','\0','\0'),(34,7,2,3,'2016-06-18 00:00:00','first seen',2000.00,67,3,7,'\0','\0','\0'),(35,11,9,4,'2016-06-18 00:00:00','first seen',1000.00,67,1,2,'\0','\0','\0'),(36,10,3,3,'2016-06-18 00:00:00','first seen',1000.00,67,2,2,'\0','\0',''),(37,9,1,5,'2016-06-18 00:00:00','new',100.00,67,2,2,'\0','\0','\0'),(38,4,2,3,'2016-06-18 00:00:00','first seen',1200.00,67,1,5,'\0','\0','\0'),(39,8,5,12,'2016-06-21 00:00:00','first seen',0.00,67,1,2,'\0','\0',''),(40,12,8,10,'2016-06-21 00:00:00','first seen',0.00,67,30,5,'\0','\0','\0'),(41,18,7,2,'2016-06-21 00:00:00','new',0.00,67,7,4,'\0','\0','\0'),(42,15,6,10,'2016-06-21 00:00:00','new',0.00,67,3,5,'\0','\0','\0'),(43,16,6,12,'2016-06-22 00:00:00','first seen',0.00,67,1,2,'\0','\0',''),(44,8,5,3,'2016-06-24 00:00:00','new',0.00,67,1,3,'\0','\0','\0'),(45,18,7,4,'2016-06-24 00:00:00','first seen',0.00,67,7,4,'\0','\0','\0'),(46,18,7,3,'2016-06-25 00:00:00','first seen',0.00,73,7,3,'\0','\0','\0'),(47,12,8,3,'2016-06-25 00:00:00','first seen',0.00,73,30,2,'\0','\0',''),(48,12,8,12,'2016-06-25 00:00:00','first seen',0.00,73,30,3,'\0','\0','\0'),(49,12,8,11,'2016-06-25 00:00:00','first seen',0.00,73,30,5,'\0','\0',''),(50,18,7,5,'2016-06-25 00:00:00','first seen',0.00,74,7,5,'\0','\0','\0'),(51,18,7,11,'2016-06-25 00:00:00','first seen',0.00,74,7,5,'\0','\0','\0'),(52,18,7,2,'2016-06-25 00:00:00','first seen',0.00,74,7,2,'\0','\0',''),(53,5,2,1,'2016-06-25 00:00:00','first seen',200.00,23,2,2,'\0','\0',''),(54,4,2,1,'2016-06-25 00:00:00','first seen',1200.00,23,1,5,'\0','\0','\0'),(55,18,7,5,'2016-06-25 00:00:00','first seen',0.00,74,7,5,'\0','\0','\0'),(56,18,7,10,'2016-06-25 00:00:00','first seen',0.00,74,7,2,'\0','\0','');
/*!40000 ALTER TABLE `request` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `divsec`.`request_AFTER_UPDATE` AFTER UPDATE ON `request` FOR EACH ROW
BEGIN
INSERT INTO `divsec`.`request_log`
(`rl_pr_id`,`rl_txn_date`,`rl_status_id`,`rl_user_id`,`rl_note`,
`rl_ent_date`,`rl_void`)
VALUES
(OLD.`req_id`,now(),OLD.`req_status_id`,OLD.`req_user_id`,
OLD.`req_note`, OLD.`req_ent_date`,OLD.`req_is_void`);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

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
) ENGINE=InnoDB AUTO_INCREMENT=267 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `request_log`
--

LOCK TABLES `request_log` WRITE;
/*!40000 ALTER TABLE `request_log` DISABLE KEYS */;
INSERT INTO `request_log` VALUES (27,7,'2016-01-07 20:30:37',2,23,'Nice test','2016-01-04 00:00:00','\0'),(29,11,'2016-01-07 21:05:40',1,23,'','2016-01-07 00:00:00','\0'),(30,7,'2016-01-08 20:31:55',2,23,'Nice test','2016-01-04 00:00:00',''),(31,14,'2016-01-14 22:56:55',1,23,'Birth Certificate','2016-01-14 00:00:00','\0'),(32,14,'2016-01-14 23:00:22',2,23,'Birth Certificate','2016-01-14 00:00:00','\0'),(33,12,'2016-01-21 23:22:47',1,23,'New','2016-01-13 00:00:00','\0'),(34,11,'2016-01-24 10:54:55',1,23,'','2016-01-07 00:00:00',''),(35,8,'2016-01-24 11:38:45',1,23,'','2016-01-05 00:00:00','\0'),(36,8,'2016-01-24 17:43:24',1,23,'new','2016-01-05 00:00:00','\0'),(37,8,'2016-01-24 18:57:32',1,23,'new','2016-02-05 00:00:00','\0'),(38,10,'2016-01-24 18:59:06',1,23,'','2016-01-06 00:00:00',''),(39,14,'2016-01-24 18:59:57',3,23,'Birth Certificate','2016-01-14 00:00:00','\0'),(40,14,'2016-01-24 19:00:47',3,23,'Birth Certificate','2016-03-14 00:00:00','\0'),(41,15,'2016-01-24 19:00:47',1,23,'','2016-01-24 00:00:00','\0'),(42,16,'2016-01-24 19:02:00',1,21,'','2016-01-24 00:00:00','\0'),(43,10,'2016-01-24 19:02:53',1,23,'','2016-02-06 00:00:00',''),(44,16,'2016-01-28 22:39:24',1,21,'','2016-02-24 00:00:00','\0'),(45,16,'2016-01-28 22:46:31',1,21,'','2016-02-24 00:00:00','\0'),(46,17,'2016-02-03 21:07:43',1,23,'Test','2016-02-03 00:00:00','\0'),(47,18,'2016-02-03 21:08:38',1,23,'a','2016-02-03 00:00:00','\0'),(48,18,'2016-02-03 21:09:31',5,23,'a','2016-02-03 00:00:00','\0'),(49,8,'2016-02-03 21:11:54',4,23,'new','2016-02-05 00:00:00','\0'),(50,7,'2016-02-03 21:40:50',2,23,'Aymen','2016-01-04 00:00:00',''),(51,19,'2016-02-06 11:43:43',1,21,'','2016-02-06 00:00:00','\0'),(52,20,'2016-02-06 21:33:35',1,23,'','2016-02-06 00:00:00','\0'),(53,20,'2016-05-09 19:32:18',2,23,'new','2016-02-06 00:00:00','\0'),(54,20,'2016-05-09 19:33:42',3,23,'new','2016-02-06 00:00:00','\0'),(55,13,'2016-05-15 09:00:05',1,23,'jezeem','2016-01-13 00:00:00','\0'),(56,17,'2016-05-17 11:19:41',5,23,'Test','2016-02-03 00:00:00','\0'),(57,21,'2016-05-18 23:06:54',1,21,'','2016-05-01 00:00:00','\0'),(58,19,'2016-05-18 23:06:59',1,21,'new','2016-02-06 00:00:00','\0'),(59,16,'2016-05-18 23:07:05',1,21,'','2016-02-24 00:00:00','\0'),(60,11,'2016-05-19 06:25:34',5,23,'12','2016-01-07 00:00:00',''),(61,18,'2016-05-19 06:25:48',6,23,'a','2016-02-03 00:00:00','\0'),(62,18,'2016-05-19 06:28:41',5,23,'a','2016-02-03 00:00:00','\0'),(63,18,'2016-05-19 06:28:53',6,23,'a','2016-02-03 00:00:00','\0'),(64,17,'2016-05-19 06:37:21',6,23,'Test','2016-02-03 00:00:00','\0'),(65,17,'2016-05-19 06:38:27',5,23,'Test','2016-02-03 00:00:00','\0'),(66,17,'2016-05-19 06:43:33',6,23,'Test','2016-02-03 00:00:00','\0'),(67,17,'2016-05-19 06:43:50',5,23,'Test','2016-02-03 00:00:00','\0'),(68,11,'2016-05-19 19:25:55',6,23,'12','2016-01-07 00:00:00','\0'),(69,18,'2016-05-19 19:29:14',5,23,'a','2016-02-03 00:00:00','\0'),(70,17,'2016-05-19 19:29:24',6,23,'Test','2016-02-03 00:00:00','\0'),(71,8,'2016-05-19 20:43:00',7,23,'new','2016-02-05 00:00:00','\0'),(72,8,'2016-05-19 20:43:16',5,23,'new','2016-02-05 00:00:00','\0'),(73,17,'2016-05-29 10:55:23',5,23,'Test','2016-02-03 00:00:00','\0'),(74,17,'2016-05-29 10:59:11',6,23,'Test','2016-02-03 00:00:00','\0'),(75,17,'2016-05-29 10:59:21',5,23,'Test','2016-02-03 00:00:00','\0'),(76,11,'2016-05-29 11:05:02',5,23,'12','2016-01-07 00:00:00','\0'),(77,18,'2016-05-29 11:06:56',6,23,'a','2016-02-03 00:00:00','\0'),(78,17,'2016-05-29 11:07:03',6,23,'Test','2016-02-03 00:00:00','\0'),(79,18,'2016-05-29 11:07:08',5,23,'a','2016-02-03 00:00:00','\0'),(80,18,'2016-05-29 11:08:37',6,23,'a','2016-02-03 00:00:00','\0'),(81,11,'2016-05-29 11:08:48',6,23,'12','2016-01-07 00:00:00','\0'),(82,8,'2016-05-29 11:08:53',7,23,'new','2016-02-05 00:00:00','\0'),(83,18,'2016-05-29 11:10:03',5,23,'a','2016-02-03 00:00:00','\0'),(84,17,'2016-05-29 11:10:07',5,23,'Test','2016-02-03 00:00:00','\0'),(85,18,'2016-05-29 11:10:15',6,23,'a','2016-02-03 00:00:00','\0'),(86,18,'2016-05-29 11:11:12',5,23,'a','2016-02-03 00:00:00','\0'),(87,18,'2016-05-29 11:11:22',6,23,'a','2016-02-03 00:00:00','\0'),(88,17,'2016-05-29 11:11:30',6,23,'Test','2016-02-03 00:00:00','\0'),(89,18,'2016-05-29 11:18:00',5,23,'a','2016-02-03 00:00:00','\0'),(90,18,'2016-05-29 11:24:38',6,23,'a','2016-02-03 00:00:00','\0'),(91,18,'2016-05-29 11:26:14',5,23,'a','2016-02-03 00:00:00','\0'),(92,18,'2016-05-29 11:32:40',6,23,'a','2016-02-03 00:00:00','\0'),(93,18,'2016-05-29 11:33:05',5,23,'a','2016-02-03 00:00:00','\0'),(94,18,'2016-05-29 11:43:00',6,23,'a','2016-02-03 00:00:00','\0'),(95,8,'2016-05-29 11:43:31',5,23,'new','2016-02-05 00:00:00','\0'),(96,18,'2016-05-29 11:43:43',5,23,'a','2016-02-03 00:00:00','\0'),(97,8,'2016-05-29 11:44:32',6,23,'new','2016-02-05 00:00:00','\0'),(98,18,'2016-05-29 11:44:42',6,23,'a','2016-02-03 00:00:00','\0'),(99,11,'2016-05-29 11:45:26',5,23,'12','2016-01-07 00:00:00','\0'),(100,11,'2016-05-29 11:50:58',6,23,'12','2016-01-07 00:00:00','\0'),(101,17,'2016-05-29 19:49:15',5,23,'Test','2016-02-03 00:00:00','\0'),(102,8,'2016-06-05 08:50:29',5,23,'new','2016-02-05 00:00:00','\0'),(103,18,'2016-06-05 08:51:13',5,23,'a','2016-02-03 00:00:00','\0'),(104,18,'2016-06-05 08:51:53',6,23,'a','2016-02-03 00:00:00','\0'),(105,17,'2016-06-05 08:56:21',6,23,'Test','2016-02-03 00:00:00','\0'),(106,18,'2016-06-05 08:58:41',5,23,'a','2016-02-03 00:00:00','\0'),(107,18,'2016-06-05 09:02:57',6,23,'a','2016-02-03 00:00:00','\0'),(108,18,'2016-06-05 09:03:16',5,23,'a','2016-02-03 00:00:00','\0'),(109,18,'2016-06-05 09:03:33',6,23,'a','2016-02-03 00:00:00','\0'),(110,18,'2016-06-05 09:03:46',5,23,'a','2016-02-03 00:00:00','\0'),(111,17,'2016-06-05 09:39:10',5,23,'Test','2016-02-03 00:00:00','\0'),(112,18,'2016-06-05 09:40:24',7,23,'a','2016-02-03 00:00:00','\0'),(113,11,'2016-06-05 09:41:51',5,23,'12','2016-01-07 00:00:00','\0'),(114,18,'2016-06-05 09:45:45',6,23,'a','2016-02-03 00:00:00','\0'),(115,17,'2016-06-05 09:48:26',6,23,'Test','2016-02-03 00:00:00','\0'),(116,11,'2016-06-05 09:53:05',6,23,'12','2016-01-07 00:00:00','\0'),(117,18,'2016-06-05 09:55:00',5,23,'a','2016-02-03 00:00:00','\0'),(118,18,'2016-06-06 19:47:16',6,23,'a','2016-02-03 00:00:00','\0'),(119,8,'2016-06-06 19:47:23',6,23,'new','2016-02-05 00:00:00','\0'),(120,18,'2016-06-06 19:47:32',5,23,'a','2016-02-03 00:00:00','\0'),(121,17,'2016-06-06 19:47:36',5,23,'Test','2016-02-03 00:00:00','\0'),(122,8,'2016-06-06 19:47:40',5,23,'new','2016-02-05 00:00:00','\0'),(123,21,'2016-06-08 20:50:17',2,21,'new','2016-05-01 00:00:00','\0'),(124,21,'2016-06-08 20:50:27',1,21,'new','2016-05-01 00:00:00','\0'),(125,21,'2016-06-09 22:45:03',2,21,'new','2016-05-01 00:00:00','\0'),(126,15,'2016-06-10 20:10:28',2,23,'','2016-02-24 00:00:00','\0'),(127,22,'2016-06-12 13:15:28',1,67,'','2016-06-10 00:00:00','\0'),(128,15,'2016-06-12 13:15:42',1,23,'new','2016-02-24 00:00:00','\0'),(129,22,'2016-06-12 13:16:49',2,67,'first seen','2016-06-10 00:00:00','\0'),(130,22,'2016-06-12 13:16:51',1,67,'first seen','2016-06-10 00:00:00','\0'),(131,23,'2016-06-12 13:18:31',1,67,'','2016-06-12 00:00:00','\0'),(132,23,'2016-06-12 13:18:40',2,67,'first seen','2016-06-12 00:00:00','\0'),(133,23,'2016-06-12 13:18:42',1,67,'first seen','2016-06-12 00:00:00','\0'),(134,24,'2016-06-12 13:23:18',1,67,'','2016-06-12 00:00:00','\0'),(135,24,'2016-06-12 13:24:49',2,67,'first seen','2016-06-12 00:00:00','\0'),(136,24,'2016-06-12 13:24:54',1,67,'first seen','2016-06-12 00:00:00','\0'),(137,24,'2016-06-12 13:25:49',2,67,'first seen','2016-06-12 00:00:00','\0'),(138,24,'2016-06-12 13:25:51',1,67,'first seen','2016-06-12 00:00:00','\0'),(139,24,'2016-06-12 13:26:07',2,67,'first seen','2016-06-12 00:00:00','\0'),(140,24,'2016-06-12 13:26:09',1,67,'first seen','2016-06-12 00:00:00','\0'),(141,24,'2016-06-12 13:28:58',2,67,'first seen','2016-06-12 00:00:00','\0'),(142,24,'2016-06-12 13:29:00',1,67,'first seen','2016-06-12 00:00:00','\0'),(143,25,'2016-06-12 13:34:58',1,67,'','2016-06-12 00:00:00','\0'),(144,26,'2016-06-12 13:35:11',1,67,'','2016-06-12 00:00:00','\0'),(145,18,'2016-06-14 03:59:31',6,23,'a','2016-02-03 00:00:00','\0'),(146,19,'2016-06-14 04:30:56',2,21,'new','2016-02-06 00:00:00','\0'),(147,16,'2016-06-14 04:33:14',2,21,'new','2016-02-24 00:00:00','\0'),(148,17,'2016-06-14 04:33:14',6,23,'Test','2016-02-03 00:00:00','\0'),(149,18,'2016-06-14 04:33:14',7,23,'this','2016-02-03 00:00:00','\0'),(150,26,'2016-06-14 05:45:36',2,67,'first seen','2016-06-12 00:00:00',''),(151,23,'2016-06-14 05:46:50',2,67,'first seen','2016-06-12 00:00:00','\0'),(152,26,'2016-06-14 05:47:03',4,67,'first seen','2016-06-12 00:00:00',''),(153,26,'2016-06-14 05:47:12',3,67,'first seen','2016-06-12 00:00:00',''),(154,23,'2016-06-14 05:52:19',3,67,'first seen','2016-06-12 00:00:00','\0'),(155,23,'2016-06-14 05:53:18',2,67,'first seen','2016-06-12 00:00:00','\0'),(156,26,'2016-06-14 05:53:26',5,67,'first seen','2016-06-12 00:00:00',''),(157,22,'2016-06-14 05:53:38',2,67,'first seen','2016-06-10 00:00:00','\0'),(158,26,'2016-06-14 05:53:50',2,67,'first seen','2016-06-12 00:00:00',''),(159,23,'2016-06-14 06:00:45',3,67,'first seen','2016-06-12 00:00:00','\0'),(160,23,'2016-06-14 06:02:27',2,67,'first seen','2016-06-12 00:00:00','\0'),(161,23,'2016-06-14 06:09:01',5,67,'first seen','2016-06-12 00:00:00','\0'),(162,23,'2016-06-14 06:12:22',2,67,'first seen','2016-06-12 00:00:00','\0'),(163,26,'2016-06-14 06:14:18',3,67,'first seen','2016-06-12 00:00:00',''),(164,23,'2016-06-14 06:19:58',3,67,'first seen','2016-06-12 00:00:00','\0'),(165,8,'2016-06-14 06:20:19',6,23,'new','2016-02-05 00:00:00','\0'),(166,23,'2016-06-14 06:24:40',2,67,'first seen','2016-06-12 00:00:00','\0'),(167,26,'2016-06-14 06:26:57',2,67,'first seen','2016-06-12 00:00:00',''),(168,26,'2016-06-14 06:27:03',3,67,'first seen','2016-06-12 00:00:00',''),(169,26,'2016-06-17 05:27:05',2,67,'first seen','2016-06-12 00:00:00',''),(170,25,'2016-06-17 05:27:05',2,67,'first seen','2016-06-12 00:00:00',''),(171,21,'2016-06-17 05:27:05',3,21,'new','2016-05-01 00:00:00','\0'),(172,20,'2016-06-17 05:44:50',2,23,'new','2016-02-06 00:00:00','\0'),(173,27,'2016-06-18 05:40:49',1,67,'','2016-06-18 00:00:00','\0'),(174,28,'2016-06-18 05:42:36',1,67,'','2016-06-18 00:00:00','\0'),(175,29,'2016-06-18 05:44:48',1,67,'','2016-06-18 00:00:00','\0'),(176,30,'2016-06-18 17:44:23',1,67,'','2016-06-18 00:00:00','\0'),(177,31,'2016-06-18 21:44:16',1,67,'','2016-06-18 00:00:00','\0'),(178,32,'2016-06-18 21:57:13',1,67,'','2016-06-18 00:00:00','\0'),(179,32,'2016-06-18 21:57:19',2,67,'first seen','2016-06-18 00:00:00',''),(180,32,'2016-06-18 21:57:21',1,67,'new','2016-06-18 00:00:00','\0'),(181,33,'2016-06-18 22:04:26',1,67,'','2016-06-18 00:00:00','\0'),(182,34,'2016-06-18 22:11:54',1,67,'','2016-06-18 00:00:00','\0'),(183,34,'2016-06-18 22:12:00',2,67,'first seen','2016-06-18 00:00:00',''),(184,34,'2016-06-18 22:12:01',1,67,'new','2016-06-18 00:00:00','\0'),(185,26,'2016-06-18 22:15:06',2,67,'first seen','2016-06-12 00:00:00',''),(186,31,'2016-06-18 22:15:16',2,67,'first seen','2016-06-18 00:00:00',''),(187,29,'2016-06-18 22:15:22',2,67,'first seen','2016-06-18 00:00:00',''),(188,35,'2016-06-18 22:15:55',1,67,'','2016-06-18 00:00:00','\0'),(189,35,'2016-06-18 22:15:57',2,67,'first seen','2016-06-18 00:00:00',''),(190,35,'2016-06-18 22:16:10',1,67,'new','2016-06-18 00:00:00','\0'),(191,35,'2016-06-18 22:16:11',2,67,'first seen','2016-06-18 00:00:00',''),(192,35,'2016-06-18 22:17:16',1,67,'new','2016-06-18 00:00:00','\0'),(193,35,'2016-06-18 22:17:19',2,67,'first seen','2016-06-18 00:00:00',''),(194,35,'2016-06-18 22:17:21',1,67,'new','2016-06-18 00:00:00','\0'),(195,36,'2016-06-18 22:19:28',1,67,'','2016-06-18 00:00:00','\0'),(196,36,'2016-06-18 22:19:30',2,67,'first seen','2016-06-18 00:00:00',''),(197,36,'2016-06-18 22:19:33',1,67,'new','2016-06-18 00:00:00','\0'),(198,36,'2016-06-18 22:19:35',2,67,'first seen','2016-06-18 00:00:00',''),(199,36,'2016-06-18 22:19:36',1,67,'new','2016-06-18 00:00:00','\0'),(200,28,'2016-06-18 22:20:47',2,67,'first seen','2016-06-18 00:00:00',''),(201,37,'2016-06-18 22:21:15',1,67,'','2016-06-18 00:00:00','\0'),(202,37,'2016-06-18 22:21:20',2,67,'first seen','2016-06-18 00:00:00',''),(203,37,'2016-06-18 22:21:37',1,67,'new','2016-06-18 00:00:00','\0'),(204,37,'2016-06-18 22:21:46',2,67,'first seen','2016-06-18 00:00:00',''),(205,38,'2016-06-18 23:12:16',1,67,'','2016-06-18 00:00:00','\0'),(206,39,'2016-06-21 22:01:44',1,67,'','2016-06-21 00:00:00','\0'),(207,33,'2016-06-21 22:04:19',2,67,'first seen','2016-06-18 00:00:00',''),(208,33,'2016-06-21 22:04:26',2,67,'first seen','2016-06-18 00:00:00','\0'),(209,40,'2016-06-21 22:05:51',1,67,'','2016-06-21 00:00:00','\0'),(210,30,'2016-06-21 22:07:05',2,67,'first seen','2016-06-18 00:00:00',''),(211,34,'2016-06-21 22:07:11',2,67,'first seen','2016-06-18 00:00:00',''),(212,35,'2016-06-21 22:07:20',2,67,'first seen','2016-06-18 00:00:00',''),(213,40,'2016-06-21 22:07:38',2,67,'first seen','2016-06-21 00:00:00',''),(214,38,'2016-06-21 22:07:50',2,67,'first seen','2016-06-18 00:00:00',''),(215,41,'2016-06-21 22:08:41',1,67,'','2016-06-21 00:00:00','\0'),(216,41,'2016-06-21 22:09:14',2,67,'first seen','2016-06-21 00:00:00',''),(217,42,'2016-06-21 22:10:20',1,67,'','2016-06-21 00:00:00','\0'),(218,42,'2016-06-21 22:10:29',2,67,'first seen','2016-06-21 00:00:00',''),(219,42,'2016-06-21 22:10:35',2,67,'new','2016-06-21 00:00:00','\0'),(220,34,'2016-06-21 22:10:43',2,67,'first seen','2016-06-18 00:00:00','\0'),(221,17,'2016-06-21 22:10:53',6,23,'Test','2016-02-03 00:00:00','\0'),(222,8,'2016-06-21 22:22:25',2,23,'new','2016-02-05 00:00:00','\0'),(223,7,'2016-06-21 22:22:33',3,23,'Aymen','2016-01-04 00:00:00',''),(224,11,'2016-06-21 22:23:10',5,23,'12','2016-01-07 00:00:00','\0'),(225,15,'2016-06-22 03:56:15',2,23,'first seen','2016-02-24 00:00:00','\0'),(226,16,'2016-06-22 03:56:25',2,21,'new','2016-02-24 00:00:00','\0'),(227,19,'2016-06-22 03:56:58',2,21,'new','2016-02-06 00:00:00','\0'),(228,43,'2016-06-22 04:00:51',1,67,'','2016-06-22 00:00:00','\0'),(229,38,'2016-06-24 04:14:09',2,67,'first seen','2016-06-18 00:00:00','\0'),(230,44,'2016-06-24 04:16:07',1,67,'','2016-06-24 00:00:00','\0'),(231,44,'2016-06-24 04:17:33',2,67,'first seen','2016-06-24 00:00:00',''),(232,45,'2016-06-24 05:13:37',1,67,'','2016-06-24 00:00:00','\0'),(233,40,'2016-06-24 05:19:18',2,67,'first seen','2016-06-21 00:00:00','\0'),(234,47,'2016-06-25 04:19:04',1,73,'','2016-06-25 00:00:00','\0'),(235,48,'2016-06-25 04:23:37',1,73,'','2016-06-25 00:00:00','\0'),(236,49,'2016-06-25 04:26:03',1,73,'','2016-06-25 00:00:00','\0'),(237,49,'2016-06-25 04:29:26',2,73,'first seen','2016-06-25 00:00:00',''),(238,48,'2016-06-25 04:37:25',2,73,'first seen','2016-06-25 00:00:00',''),(239,48,'2016-06-25 04:37:34',2,73,'first seen','2016-06-25 00:00:00','\0'),(240,46,'2016-06-25 04:54:51',1,73,'','2016-06-25 00:00:00','\0'),(241,50,'2016-06-25 04:56:37',1,74,'','2016-06-25 00:00:00','\0'),(242,45,'2016-06-25 05:01:48',2,67,'first seen','2016-06-24 00:00:00',''),(243,50,'2016-06-25 05:02:30',2,74,'first seen','2016-06-25 00:00:00',''),(244,46,'2016-06-25 05:02:41',2,73,'first seen','2016-06-25 00:00:00',''),(245,41,'2016-06-25 05:03:13',2,67,'new','2016-06-21 00:00:00','\0'),(246,51,'2016-06-25 05:04:48',1,74,'','2016-06-25 00:00:00','\0'),(247,41,'2016-06-25 05:05:34',5,67,'new','2016-06-21 00:00:00','\0'),(248,45,'2016-06-25 05:05:46',5,67,'first seen','2016-06-24 00:00:00','\0'),(249,41,'2016-06-25 05:08:00',3,67,'new','2016-06-21 00:00:00','\0'),(250,46,'2016-06-25 05:08:35',2,73,'first seen','2016-06-25 00:00:00','\0'),(251,52,'2016-06-25 05:10:37',1,74,'','2016-06-25 00:00:00','\0'),(252,50,'2016-06-25 05:14:21',2,74,'first seen','2016-06-25 00:00:00','\0'),(253,51,'2016-06-25 05:14:28',2,74,'first seen','2016-06-25 00:00:00',''),(254,53,'2016-06-25 05:19:02',1,23,'','2016-06-25 00:00:00','\0'),(255,54,'2016-06-25 05:22:44',1,67,'','2016-06-25 00:00:00','\0'),(256,55,'2016-06-25 05:40:19',1,74,'','2016-06-25 00:00:00','\0'),(257,56,'2016-06-25 17:48:04',1,74,'','2016-06-25 00:00:00','\0'),(258,7,'2016-06-25 18:09:38',4,23,'Aymen','2016-01-04 00:00:00',''),(259,7,'2016-06-25 18:46:28',8,23,'Aymen','2016-01-04 00:00:00','\0'),(260,7,'2016-06-25 19:27:19',4,23,'Aymen','2016-01-04 00:00:00','\0'),(261,7,'2016-06-25 19:30:05',8,67,'Aymen','2016-01-04 00:00:00','\0'),(262,10,'2016-06-26 04:01:36',4,23,'','2016-02-06 00:00:00',''),(263,54,'2016-06-26 04:03:35',2,67,'first seen','2016-06-25 00:00:00',''),(264,55,'2016-06-26 04:04:48',2,74,'first seen','2016-06-25 00:00:00',''),(265,26,'2016-06-26 04:07:14',5,67,'first seen','2016-06-12 00:00:00',''),(266,34,'2016-06-26 04:07:20',5,67,'first seen','2016-06-18 00:00:00','\0');
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
INSERT INTO `request_status` VALUES (1,'New',''),(2,'Opened',''),(3,'Completed',''),(4,'Closed',''),(5,'For Approval',''),(6,'Approved',''),(7,'Rejected',''),(8,'Void','');
/*!40000 ALTER TABLE `request_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sms_log`
--

DROP TABLE IF EXISTS `sms_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sms_log` (
  `sms_id` int(11) NOT NULL AUTO_INCREMENT,
  `sms_date` datetime DEFAULT NULL,
  `sms_req_id` int(11) DEFAULT NULL,
  `sms_user_id` int(11) DEFAULT NULL,
  `sms_response` varchar(100) DEFAULT NULL,
  `sms_status` varchar(45) DEFAULT NULL,
  `sms_charges` decimal(4,2) DEFAULT NULL,
  PRIMARY KEY (`sms_id`)
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sms_log`
--

LOCK TABLES `sms_log` WRITE;
/*!40000 ALTER TABLE `sms_log` DISABLE KEYS */;
INSERT INTO `sms_log` VALUES (101,'2016-06-21 03:50:51',38,67,NULL,NULL,0.00),(102,'2016-06-21 04:07:47',38,67,NULL,NULL,0.00),(103,'2016-06-21 04:08:55',38,67,NULL,NULL,0.00),(104,'2016-06-21 04:11:46',16,67,NULL,NULL,0.00),(105,'2016-06-22 05:22:50',7,67,NULL,NULL,0.00),(106,'2016-06-22 06:05:14',41,67,NULL,NULL,0.00);
/*!40000 ALTER TABLE `sms_log` ENABLE KEYS */;
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
  `stf_pi_id` int(11) DEFAULT '0',
  PRIMARY KEY (`stf_id`),
  UNIQUE KEY `stf_user_id_UNIQUE` (`stf_user_id`),
  KEY `fk_stf_category_id_idx` (`stf_category_id`),
  KEY `fk_stf_divsion_id_idx` (`stf_dvision_id`),
  CONSTRAINT `fk_stf_divsion_id` FOREIGN KEY (`stf_dvision_id`) REFERENCES `division` (`div_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff`
--

LOCK TABLES `staff` WRITE;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
INSERT INTO `staff` VALUES (21,'Admin',5,'admin','$2a$10$puEecKeldTE25v4z.rm7YOWAiO7btGzQs98FHYrPEAxdv5mklXGyy',1,NULL,NULL,NULL,'','ROLE_ADMIN',0),(22,'HOD',2,'hod','$2a$10$9a5T8ZvgLEnESExilY8/V.1W6SpXzBE7W2KubmqDmlAUaDHRVW9Wm',2,NULL,NULL,NULL,'','ROLE_HOD',0),(23,'Staff',3,'staff','$2a$10$LOqePml/koRGsk2YAIOFI.1YNKZg7EsQ5BAIuYP1nWOyYRl21dlne',2,'','','','','ROLE_STAFF',0),(29,'HodAdmin',2,'hodadmin','$2a$10$LOqePml/koRGsk2YAIOFI.1YNKZg7EsQ5BAIuYP1nWOyYRl21dlne',1,'','','','\0','ROLE_HOD',0),(36,'staffadmin',3,'staffadmin','$2a$10$LOqePml/koRGsk2YAIOFI.1YNKZg7EsQ5BAIuYP1nWOyYRl21dlne',1,'','','','','ROLE_STAFF',0),(67,'DS',1,'ds','$2a$10$dssGWeG8.VgWAVmMWrav3uv99jxvTR4dYbLlYRA2JGjVcIJfR4Y5m',1,'','','','','ROLE_DS',0),(71,'M.S. Jayawardana',4,'jaya','$2a$10$s61cCMe0SR2zxHfIAP1K0.S2BcqceZgTT40.jTlDfLiFjLDzco7oi',6,NULL,NULL,'','','ROLE_CLIENT',5),(72,'N.J.Aymen',4,'aymen','$2a$10$LOqePml/koRGsk2YAIOFI.1YNKZg7EsQ5BAIuYP1nWOyYRl21dlne',6,'','','','','ROLE_CLIENT',1),(73,'Samurdhi',3,'samurdhi','$2a$10$rgAFRpZmz.jCexQnEPKc1OJgkD8FE6M3cSTY.ZwFwRemcZxtj6vQi',8,NULL,NULL,NULL,'','ROLE_STAFF',0),(74,'Disaster Management',3,'disaster','$2a$10$SZ3W6wUgcSm/VCbyOTxpqOtJO9mpYeqcs7NyYRl2NcYput/nSxyv6',7,NULL,NULL,NULL,'','ROLE_STAFF',0);
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `staff_AUPD` AFTER UPDATE ON `staff`
 FOR EACH ROW UPDATE `divsec`.`staff_role` r
SET
`role_id` = new.stf_category_id,
`role_name` = OLD.stf_role
WHERE `staff_id` = old.stf_Id */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff_role`
--

LOCK TABLES `staff_role` WRITE;
/*!40000 ALTER TABLE `staff_role` DISABLE KEYS */;
INSERT INTO `staff_role` VALUES (1,23,3,'ROLE_STAFF'),(2,21,5,'ROLE_ADMIN'),(3,22,2,'ROLE_HOD'),(4,29,2,'ROLE_HOD'),(5,36,3,'ROLE_STAFF'),(6,71,4,'ROLE_CLIENT'),(7,67,1,'ROLE_DS'),(8,72,4,'ROLE_CLIENT'),(9,73,3,'ROLE_STAFF'),(10,74,3,'ROLE_STAFF');
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
  `ps_pr_id` int(11) DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stage_log`
--

LOCK TABLES `stage_log` WRITE;
/*!40000 ALTER TABLE `stage_log` DISABLE KEYS */;
INSERT INTO `stage_log` VALUES (1,NULL,11,1,1,'2016-01-08 23:12:15',23,'','2016-01-07 04:55:40'),(2,NULL,11,1,1,'2016-01-08 23:23:59',23,'aymen','2016-01-07 04:55:40'),(3,NULL,11,1,1,'2016-01-08 23:24:23',23,'jezeem','2016-01-07 04:55:40'),(4,NULL,11,2,1,'2016-01-13 21:46:37',23,'','2016-01-07 04:55:40'),(5,NULL,13,1,1,'2016-01-13 22:12:30',23,'','2016-01-13 10:02:51'),(6,NULL,13,2,1,'2016-01-13 22:16:15',23,'','2016-01-13 10:02:51'),(7,NULL,13,2,3,'2016-01-13 22:17:56',23,'stage','2016-01-13 10:02:51'),(8,NULL,13,1,2,'2016-01-13 22:19:45',23,'stage','2016-01-13 10:02:51'),(9,NULL,13,1,3,'2016-01-13 22:30:30',23,'stage','2016-01-13 10:02:51'),(10,NULL,14,1,1,'2016-01-14 22:55:29',23,'','2016-01-14 10:50:00'),(11,NULL,14,1,2,'2016-01-14 22:58:47',23,'Given to cleark','2016-01-14 10:50:00'),(12,NULL,14,2,1,'2016-01-14 22:59:48',23,'','2016-01-14 10:50:00'),(13,NULL,15,3,1,'2016-01-24 12:03:51',23,'','2016-01-24 00:03:38'),(14,NULL,20,6,1,'2016-02-06 21:24:29',23,'','2016-01-06 09:23:50'),(15,NULL,20,6,3,'2016-02-06 21:24:43',23,'stage','2016-01-06 09:23:50'),(16,NULL,20,7,1,'2016-02-06 21:25:03',23,'','2016-01-06 09:23:50'),(17,NULL,20,7,3,'2016-02-06 21:27:31',23,'stage','2016-01-06 09:23:50'),(18,NULL,20,6,2,'2016-02-06 21:31:07',23,'stage','2016-01-06 09:23:50'),(19,NULL,20,7,2,'2016-02-06 21:33:08',23,'stage','2016-01-06 09:23:50'),(20,NULL,20,6,1,'2016-02-06 21:33:27',23,'stage','2016-01-06 09:23:50'),(21,NULL,11,2,3,'2016-05-01 09:59:56',23,'hehe','2016-01-07 04:55:40'),(22,NULL,13,2,2,'2016-05-15 08:59:55',23,'stage','2016-01-13 10:02:51'),(23,NULL,26,10,1,'2016-06-14 04:05:59',67,'','2016-06-12 01:35:08'),(25,NULL,19,4,1,'2016-06-17 05:28:39',21,'','2016-01-06 11:42:58'),(26,NULL,18,4,1,'2016-06-17 05:32:34',23,'','2016-01-03 09:08:27'),(30,NULL,20,7,1,'2016-06-17 05:44:38',23,'stage','2016-01-06 09:23:50'),(31,NULL,20,6,2,'2016-06-17 05:44:42',23,'stage','2016-01-06 09:23:50'),(32,NULL,20,8,1,'2016-06-17 05:44:47',23,'','2016-01-06 09:23:51'),(33,NULL,39,5,1,'2016-06-21 22:02:52',67,'','2016-06-21 10:01:42'),(34,NULL,39,51,1,'2016-06-21 22:02:56',67,'','2016-06-21 10:01:42'),(35,NULL,39,5,2,'2016-06-21 22:03:01',67,'stage','2016-06-21 10:01:42'),(36,NULL,39,52,1,'2016-06-21 22:03:05',67,'','2016-06-21 10:01:42'),(37,NULL,39,54,1,'2016-06-21 22:03:18',67,'','2016-06-21 10:01:42'),(38,NULL,33,5,1,'2016-06-21 22:04:17',67,'','2016-06-18 10:04:23'),(39,NULL,40,13,1,'2016-06-21 22:05:59',67,'','2016-06-21 10:05:49'),(40,NULL,40,14,1,'2016-06-21 22:06:04',67,'','2016-06-21 10:05:49'),(41,NULL,30,2,1,'2016-06-21 22:07:01',67,'','2016-06-18 05:44:19'),(42,NULL,41,55,1,'2016-06-21 22:08:51',67,'','2016-06-21 10:08:39'),(43,NULL,41,56,1,'2016-06-21 22:08:56',67,'','2016-06-21 10:08:39'),(45,NULL,44,5,1,'2016-06-24 04:16:20',67,'','2016-06-24 04:16:00'),(46,NULL,44,51,1,'2016-06-24 04:16:24',67,'','2016-06-24 04:16:00'),(47,NULL,44,52,1,'2016-06-24 04:16:52',67,'','2016-06-24 04:16:00'),(48,NULL,44,51,2,'2016-06-24 04:16:59',67,'stage','2016-06-24 04:16:00'),(49,NULL,44,53,1,'2016-06-24 04:17:07',67,'','2016-06-24 04:16:00'),(50,NULL,44,54,1,'2016-06-24 04:17:14',67,'','2016-06-24 04:16:00'),(51,NULL,48,13,1,'2016-06-25 04:37:12',73,'','2016-06-25 04:23:20'),(52,NULL,48,14,1,'2016-06-25 04:37:18',73,'','2016-06-25 04:23:20'),(53,NULL,48,15,1,'2016-06-25 04:37:22',73,'','2016-06-25 04:23:20'),(54,NULL,45,55,1,'2016-06-25 05:01:29',67,'','2016-06-24 05:13:11'),(55,NULL,45,56,1,'2016-06-25 05:01:34',67,'','2016-06-24 05:13:11'),(56,NULL,45,57,1,'2016-06-25 05:01:39',67,'','2016-06-24 05:13:11'),(57,NULL,46,55,1,'2016-06-25 05:08:10',73,'','2016-06-25 04:18:10'),(58,NULL,46,56,1,'2016-06-25 05:08:14',73,'','2016-06-25 04:18:10'),(59,NULL,46,57,1,'2016-06-25 05:08:18',73,'','2016-06-25 04:18:10'),(60,NULL,41,55,2,'2016-06-25 05:08:46',67,'stage','2016-06-21 10:08:39'),(61,NULL,41,57,1,'2016-06-25 05:08:50',67,'','2016-06-21 10:08:39'),(62,NULL,53,43,1,'2016-06-25 05:19:13',23,'','2016-06-25 05:18:59'),(63,NULL,53,12,1,'2016-06-25 05:19:18',23,'','2016-06-25 05:18:59'),(64,NULL,56,56,1,'2016-06-26 14:26:24',74,'','2016-06-25 05:41:43'),(65,NULL,56,55,1,'2016-06-26 14:26:32',74,'','2016-06-25 05:41:43'),(66,NULL,56,55,2,'2016-06-26 14:27:58',74,'stage','2016-06-25 05:41:43'),(67,NULL,56,56,2,'2016-06-26 14:47:26',74,'stage','2016-06-25 05:41:43'),(68,NULL,56,55,3,'2016-06-26 14:47:30',74,'stage','2016-06-25 05:41:43'),(69,NULL,56,57,1,'2016-06-26 15:00:18',74,'','2016-06-25 05:41:43'),(70,NULL,56,57,2,'2016-06-26 15:01:00',67,'stage','2016-06-25 05:41:43'),(71,NULL,56,57,1,'2016-06-26 16:10:50',67,'stage','2016-06-25 05:41:43');
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
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8 COMMENT='Stages for a subject that is to be completed.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subjec_stage`
--

LOCK TABLES `subjec_stage` WRITE;
/*!40000 ALTER TABLE `subjec_stage` DISABLE KEYS */;
INSERT INTO `subjec_stage` VALUES (1,4,'Duly filled application','',100.00),(2,4,'Original Deed of the land','',100.00),(3,5,'Duly filled application','',NULL),(4,11,'Obtaining the application','',100.00),(5,8,'Duly filled application form 55','',NULL),(6,10,'Duly filled application','',NULL),(7,10,'Conform the value of the stamps','',NULL),(8,10,'Collect the BC','',NULL),(9,7,'Duly filled application','',NULL),(10,9,'Duly filled application','',NULL),(11,4,'Complete the function','\0',NULL),(12,5,'Compare original and copy of the estimation','',NULL),(13,12,'Certified Results Sheet by Principal','',100.00),(14,12,'Duly filled application form','',NULL),(15,12,'Divineguma Devlopment officer signature','',NULL),(16,13,'Stage','',100.00),(17,14,'Stage','',100.00),(18,15,'Duly filled application','',100.00),(19,16,'Application Letter','',100.00),(20,11,'Permit Original Vs Copy','',100.00),(21,11,'Report from GS','',100.00),(22,11,'Land Officer recommendation','',100.00),(23,11,'Send to District Surveyor Department','',100.00),(24,15,'GS Certified application','',100.00),(25,15,'GS Certified NIC of BC','',100.00),(26,16,'Application Letter','\0',NULL),(27,16,'GS Certified duly filled application','',100.00),(28,16,'BC or Documents that conform the age','',100.00),(29,16,'Photo 3x2 cm','',100.00),(30,17,'Obtaining the applicarion','',100.00),(31,17,'Registered Survey Plan','',100.00),(32,17,'Conform the original and the copy of the documents','',100.00),(33,17,'Report from GS','',100.00),(34,17,'Report from Land Officer','',100.00),(35,17,'Prepare CD contains details','',100.00),(36,17,'Recommendation of DS','',100.00),(37,17,'Submit to District Land Commissioner','',100.00),(38,10,'Registrar\'s Signature','',NULL),(39,4,'Certified Surveyor Plan','',100.00),(40,4,'Compare original and copy of the estimation','',100.00),(41,4,'DS Recommendation and Approval','',100.00),(42,5,'Deed of the land','',NULL),(43,5,'GS Report','',NULL),(44,5,'DS Recommendation','',NULL),(45,7,'GS Report','',NULL),(46,7,'Field visit report','',NULL),(47,7,'DS Recommendation','',NULL),(48,9,'GS report','',NULL),(49,9,'Registered Survey Plan','',NULL),(50,9,'Valuation officer\'s Report','',NULL),(51,8,'Birth Certificate','',NULL),(52,8,'Treasury form 148','',NULL),(53,8,'Treasury form 147','',NULL),(54,8,'2 photos 1/4 x 2 1/4','',NULL),(55,18,'Duly filled application','',100.00),(56,18,'GS Report','',100.00),(57,18,'DS Recommendation','',100.00);
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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subject`
--

LOCK TABLES `subject` WRITE;
/*!40000 ALTER TABLE `subject` DISABLE KEYS */;
INSERT INTO `subject` VALUES (4,'plan/house/2004','Housing Fund','',2,1,1200.00),(5,'plan/build/2004','Building Construction','',2,2,200.00),(7,'plan/drainage/2003','Planning Drainages','',2,3,2000.00),(8,'acc/pension/2014','Pension Payments','',5,1,0.00),(9,'admin/worth/2006','Worth Certificate','',1,2,100.00),(10,'reg/cert/birth','Birth Certificate','',3,2,1000.00),(11,'land/surveyreq/1935','Land Survey Requisition','',9,1,1000.00),(12,'samurdhi/divinegu/2015/02','Divineguma Sidhora Sholarship','',8,30,0.00),(13,'acc/vhowner/1998','vehicle ownership transfer','',5,1,1000.00),(14,'acc/business/reg/1918','Business Registration','',5,1,1500.00),(15,'sw/elderspmnt/01/2016 ','Elders Payment','',6,3,0.00),(16,'sw/eldersid/2014','Elders Identity Card','',6,1,0.00),(17,'land/newgrant/1935','Application for new Grant','',9,14,300.00),(18,'disaster/flood/2014','Flood Relief Fund','',7,7,0.00);
/*!40000 ALTER TABLE `subject` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `subject_AINS` AFTER INSERT ON `subject`
 FOR EACH ROW INSERT INTO `divsec`.`subjec_stage`
(`stg_subject_id`,`stg_name`,`stg_active`,`stg_cost`)
VALUES
(new.sbj_id,'Stage',true,100.00) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='categories are saved. Admin, Head of Divison, Staff and publ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_category`
--

LOCK TABLES `user_category` WRITE;
/*!40000 ALTER TABLE `user_category` DISABLE KEYS */;
INSERT INTO `user_category` VALUES (1,'ROLE_DS'),(2,'ROLE_HOD'),(3,'ROLE_STAFF'),(4,'ROLE_CLIENT'),(5,'ROLE_ADMIN');
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
 1 AS `Closed`,
 1 AS `For Approval`,
 1 AS `Approved`,
 1 AS `Rejected`*/;
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
 1 AS `Closed`,
 1 AS `For Approval`,
 1 AS `Approved`,
 1 AS `Rejected`*/;
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
 1 AS `Closed`,
 1 AS `For Approval`,
 1 AS `Approved`,
 1 AS `Rejected`*/;
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
 1 AS `Closed`,
 1 AS `For Approval`,
 1 AS `Approved`,
 1 AS `Rejected`*/;
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
-- Temporary view structure for view `vw_email_log`
--

DROP TABLE IF EXISTS `vw_email_log`;
/*!50001 DROP VIEW IF EXISTS `vw_email_log`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vw_email_log` AS SELECT 
 1 AS `email_id`,
 1 AS `email_date`,
 1 AS `email_req_id`,
 1 AS `sbj_code`,
 1 AS `pi_id`,
 1 AS `pi_name`,
 1 AS `email_user_id`,
 1 AS `stf_name`*/;
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
 1 AS `Holi`,
 1 AS `datediff(now(),req_ent_date)`,
 1 AS `sbj_duration`,
 1 AS `WeekDays`,
 1 AS `OverDue`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_req_reminder`
--

DROP TABLE IF EXISTS `vw_req_reminder`;
/*!50001 DROP VIEW IF EXISTS `vw_req_reminder`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vw_req_reminder` AS SELECT 
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
 1 AS `Holi`,
 1 AS `datediff(now(),req_ent_date)`,
 1 AS `sbj_duration`,
 1 AS `WeekDays`,
 1 AS `Reminder`*/;
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
 1 AS `stf_name`,
 1 AS `subjectCode`*/;
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
-- Temporary view structure for view `vw_sms_log`
--

DROP TABLE IF EXISTS `vw_sms_log`;
/*!50001 DROP VIEW IF EXISTS `vw_sms_log`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vw_sms_log` AS SELECT 
 1 AS `sms_id`,
 1 AS `sms_date`,
 1 AS `sms_req_id`,
 1 AS `sbj_code`,
 1 AS `pi_id`,
 1 AS `pi_name`,
 1 AS `sms_response`,
 1 AS `sms_status`,
 1 AS `sms_charges`,
 1 AS `sms_user_id`,
 1 AS `stf_name`*/;
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
-- Temporary view structure for view `vw_tobe_printed`
--

DROP TABLE IF EXISTS `vw_tobe_printed`;
/*!50001 DROP VIEW IF EXISTS `vw_tobe_printed`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vw_tobe_printed` AS SELECT 
 1 AS `app_id`,
 1 AS `app_request_id`,
 1 AS `sbj_code`,
 1 AS `app_req_status`,
 1 AS `app_is_printed`,
 1 AS `stf_name`,
 1 AS `rs_name`,
 1 AS `app_date`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_undo_printed`
--

DROP TABLE IF EXISTS `vw_undo_printed`;
/*!50001 DROP VIEW IF EXISTS `vw_undo_printed`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vw_undo_printed` AS SELECT 
 1 AS `app_id`,
 1 AS `app_request_id`,
 1 AS `sbj_code`,
 1 AS `app_req_status`,
 1 AS `app_is_printed`,
 1 AS `app_printed_date`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'divsec'
--

--
-- Dumping routines for database 'divsec'
--
/*!50003 DROP FUNCTION IF EXISTS `TOTAL_WEEKDAYS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `TOTAL_WEEKDAYS`(date1 DATE, date2 DATE) RETURNS int(11)
RETURN ABS(DATEDIFF(date2, date1)) + 1
     - ABS(DATEDIFF(ADDDATE(date2, INTERVAL 1 - DAYOFWEEK(date2) DAY),
                    ADDDATE(date1, INTERVAL 1 - DAYOFWEEK(date1) DAY))) / 7 * 2
     - (DAYOFWEEK(IF(date1 < date2, date1, date2)) = 1)
     - (DAYOFWEEK(IF(date1 > date2, date1, date2)) = 7) ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

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
/*!50001 VIEW `vw_bar_by_all_division` AS select date_format(`r`.`req_ent_date`,_utf8'%M') AS `EntMonth`,date_format(`r`.`req_ent_date`,_utf8'%m') AS `EntMonth1`,date_format(`r`.`req_ent_date`,_utf8'%Y') AS `EntYear`,count((case when (`r`.`req_status_id` = 1) then `r`.`req_id` else NULL end)) AS `New`,count((case when (`r`.`req_status_id` = 2) then `r`.`req_id` else NULL end)) AS `Opend`,count((case when (`r`.`req_status_id` = 3) then `r`.`req_id` else NULL end)) AS `Completed`,count((case when (`r`.`req_status_id` = 4) then `r`.`req_id` else NULL end)) AS `Closed`,count((case when (`r`.`req_status_id` = 5) then `r`.`req_id` else NULL end)) AS `For Approval`,count((case when (`r`.`req_status_id` = 6) then `r`.`req_id` else NULL end)) AS `Approved`,count((case when (`r`.`req_status_id` = 7) then `r`.`req_id` else NULL end)) AS `Rejected` from (`request` `r` join `division` `d` on((`r`.`req_division_id` = `d`.`div_id`))) group by date_format(`r`.`req_ent_date`,_utf8'%M'),date_format(`r`.`req_ent_date`,_utf8'%Y') order by `r`.`req_ent_date` */;
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
/*!50001 VIEW `vw_bar_by_division` AS select `r`.`req_division_id` AS `req_division_id`,date_format(`r`.`req_ent_date`,_utf8'%b') AS `EntMonth`,date_format(`r`.`req_ent_date`,_utf8'%m') AS `EntMonth1`,date_format(`r`.`req_ent_date`,_utf8'%Y') AS `EntYear`,count((case when (`r`.`req_status_id` = 1) then `r`.`req_id` else NULL end)) AS `New`,count((case when (`r`.`req_status_id` = 2) then `r`.`req_id` else NULL end)) AS `Opend`,count((case when (`r`.`req_status_id` = 3) then `r`.`req_id` else NULL end)) AS `Completed`,count((case when (`r`.`req_status_id` = 4) then `r`.`req_id` else NULL end)) AS `Closed`,count((case when (`r`.`req_status_id` = 5) then `r`.`req_id` else NULL end)) AS `For Approval`,count((case when (`r`.`req_status_id` = 6) then `r`.`req_id` else NULL end)) AS `Approved`,count((case when (`r`.`req_status_id` = 7) then `r`.`req_id` else NULL end)) AS `Rejected` from (`request` `r` join `division` `d` on((`r`.`req_division_id` = `d`.`div_id`))) group by `r`.`req_division_id`,date_format(`r`.`req_ent_date`,_utf8'%M'),date_format(`r`.`req_ent_date`,_utf8'%Y') order by `r`.`req_ent_date` */;
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
/*!50001 VIEW `vw_div_period_status` AS select `r`.`req_division_id` AS `div_id`,`d`.`div_name` AS `div_name`,date_format(`r`.`req_ent_date`,_utf8'%b') AS `EntMonth`,date_format(`r`.`req_ent_date`,_utf8'%m') AS `EntMonth1`,date_format(`r`.`req_ent_date`,_utf8'%Y') AS `EntYear`,count((case when (`r`.`req_status_id` = 1) then `r`.`req_id` else NULL end)) AS `New`,count((case when (`r`.`req_status_id` = 2) then `r`.`req_id` else NULL end)) AS `Opend`,count((case when (`r`.`req_status_id` = 3) then `r`.`req_id` else NULL end)) AS `Completed`,count((case when (`r`.`req_status_id` = 4) then `r`.`req_id` else NULL end)) AS `Closed`,count((case when (`r`.`req_status_id` = 5) then `r`.`req_id` else NULL end)) AS `For Approval`,count((case when (`r`.`req_status_id` = 6) then `r`.`req_id` else NULL end)) AS `Approved`,count((case when (`r`.`req_status_id` = 7) then `r`.`req_id` else NULL end)) AS `Rejected` from (`request` `r` join `division` `d` on((`r`.`req_division_id` = `d`.`div_id`))) group by date_format(`r`.`req_ent_date`,_utf8'%M'),date_format(`r`.`req_ent_date`,_utf8'%Y'),`d`.`div_name` order by `r`.`req_ent_date` */;
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
/*!50001 VIEW `vw_division_by_year` AS select `r`.`req_division_id` AS `div_id`,`d`.`div_name` AS `div_name`,date_format(`r`.`req_ent_date`,_utf8'%Y') AS `EntYear`,count((case when (`r`.`req_status_id` = 1) then `r`.`req_id` else NULL end)) AS `New`,count((case when (`r`.`req_status_id` = 2) then `r`.`req_id` else NULL end)) AS `Opend`,count((case when (`r`.`req_status_id` = 3) then `r`.`req_id` else NULL end)) AS `Completed`,count((case when (`r`.`req_status_id` = 4) then `r`.`req_id` else NULL end)) AS `Closed`,count((case when (`r`.`req_status_id` = 5) then `r`.`req_id` else NULL end)) AS `For Approval`,count((case when (`r`.`req_status_id` = 6) then `r`.`req_id` else NULL end)) AS `Approved`,count((case when (`r`.`req_status_id` = 7) then `r`.`req_id` else NULL end)) AS `Rejected` from (`request` `r` join `division` `d` on((`r`.`req_division_id` = `d`.`div_id`))) group by date_format(`r`.`req_ent_date`,_utf8'%Y'),`r`.`req_division_id` order by `r`.`req_ent_date` */;
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
/*!50001 VIEW `vw_donut_division` AS select `r`.`req_status_id` AS `req_status_id`,`rs`.`rs_name` AS `label`,count(`r`.`req_id`) AS `value`,`r`.`req_division_id` AS `divId`,`d`.`div_name` AS `div_name` from ((`request` `r` join `request_status` `rs` on((`r`.`req_status_id` = `rs`.`rs_id`))) join `division` `d` on((`r`.`req_division_id` = `d`.`div_id`))) where (`r`.`req_status_id` in (1,2,3,4,5,6,7)) group by `r`.`req_status_id`,`rs`.`rs_name`,`r`.`req_division_id` */;
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
-- Final view structure for view `vw_email_log`
--

/*!50001 DROP VIEW IF EXISTS `vw_email_log`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_email_log` AS select `l`.`email_id` AS `email_id`,date_format(`l`.`email_date`,'%Y-%m-%d %r') AS `email_date`,`l`.`email_req_id` AS `email_req_id`,`s`.`sbj_code` AS `sbj_code`,`p`.`pi_id` AS `pi_id`,`p`.`pi_name` AS `pi_name`,`l`.`email_user_id` AS `email_user_id`,`st`.`stf_name` AS `stf_name` from ((((`email_log` `l` left join `request` `r` on((`l`.`email_req_id` = `r`.`req_id`))) left join `subject` `s` on((`r`.`req_subject_id` = `s`.`sbj_id`))) left join `public_individual` `p` on((`r`.`req_public_id` = `p`.`pi_id`))) left join `staff` `st` on((`l`.`email_user_id` = `st`.`stf_id`))) */;
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
/*!50001 VIEW `vw_req_overdue` AS select `r`.`req_id` AS `req_id`,`r`.`req_subject_id` AS `req_subject_id`,`sb`.`sbj_code` AS `sbj_code`,`r`.`req_division_id` AS `req_division_id`,`d`.`div_name` AS `div_name`,`r`.`req_public_id` AS `req_public_id`,`p`.`pi_name` AS `pi_name`,`r`.`req_status_id` AS `req_status_id`,`rs`.`rs_name` AS `rs_name`,date_format(now(),'%Y-%m-%d') AS `today`,date_format(`r`.`req_ent_date`,'%Y-%m-%d') AS `EntDate`,(select count(0) from `holiday` where ((`holiday`.`hol_is_active` = 1) and (cast(`holiday`.`hol_date` as date) between `r`.`req_ent_date` and cast(now() as date)))) AS `Holi`,(to_days(now()) - to_days(`r`.`req_ent_date`)) AS `datediff(now(),req_ent_date)`,`sb`.`sbj_duration` AS `sbj_duration`,`TOTAL_WEEKDAYS`(date_format(now(),'%Y-%m-%d'),date_format(`r`.`req_ent_date`,'%Y-%m-%d')) AS `WeekDays`,((`TOTAL_WEEKDAYS`(date_format(now(),'%Y-%m-%d'),date_format(`r`.`req_ent_date`,'%Y-%m-%d')) - `sb`.`sbj_duration`) - (select count(0) from `holiday` where ((`holiday`.`hol_is_active` = 1) and (cast(`holiday`.`hol_date` as date) between `r`.`req_ent_date` and cast(now() as date))))) AS `OverDue` from ((((`request` `r` join `subject` `sb` on((`r`.`req_subject_id` = `sb`.`sbj_id`))) join `division` `d` on((`r`.`req_division_id` = `d`.`div_id`))) join `public_individual` `p` on((`r`.`req_public_id` = `p`.`pi_id`))) join `request_status` `rs` on((`r`.`req_status_id` = `rs`.`rs_id`))) where ((((`TOTAL_WEEKDAYS`(date_format(now(),'%Y-%m-%d'),date_format(`r`.`req_ent_date`,'%Y-%m-%d')) - `sb`.`sbj_duration`) - (select count(0) from `holiday` where ((`holiday`.`hol_is_active` = 1) and (cast(`holiday`.`hol_date` as date) between `r`.`req_ent_date` and cast(now() as date))))) > 0) and (`r`.`req_status_id` not in (3,4,7,8))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_req_reminder`
--

/*!50001 DROP VIEW IF EXISTS `vw_req_reminder`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_req_reminder` AS select `r`.`req_id` AS `req_id`,`r`.`req_subject_id` AS `req_subject_id`,`sb`.`sbj_code` AS `sbj_code`,`r`.`req_division_id` AS `req_division_id`,`d`.`div_name` AS `div_name`,`r`.`req_public_id` AS `req_public_id`,`p`.`pi_name` AS `pi_name`,`r`.`req_status_id` AS `req_status_id`,`rs`.`rs_name` AS `rs_name`,date_format(now(),'%Y-%m-%d') AS `today`,date_format(`r`.`req_ent_date`,'%Y-%m-%d') AS `EntDate`,(select count(0) from `holiday` where ((`holiday`.`hol_is_active` = 1) and (cast(`holiday`.`hol_date` as date) between `r`.`req_ent_date` and cast(now() as date)))) AS `Holi`,(to_days(now()) - to_days(`r`.`req_ent_date`)) AS `datediff(now(),req_ent_date)`,`sb`.`sbj_duration` AS `sbj_duration`,`TOTAL_WEEKDAYS`(date_format(now(),'%Y-%m-%d'),date_format(`r`.`req_ent_date`,'%Y-%m-%d')) AS `WeekDays`,abs(((`TOTAL_WEEKDAYS`(date_format(now(),'%Y-%m-%d'),date_format(`r`.`req_ent_date`,'%Y-%m-%d')) - `sb`.`sbj_duration`) - (select count(0) from `holiday` where ((`holiday`.`hol_is_active` = 1) and (cast(`holiday`.`hol_date` as date) between `r`.`req_ent_date` and cast(now() as date)))))) AS `Reminder` from ((((`request` `r` join `subject` `sb` on((`r`.`req_subject_id` = `sb`.`sbj_id`))) join `division` `d` on((`r`.`req_division_id` = `d`.`div_id`))) join `public_individual` `p` on((`r`.`req_public_id` = `p`.`pi_id`))) join `request_status` `rs` on((`r`.`req_status_id` = `rs`.`rs_id`))) where ((((`TOTAL_WEEKDAYS`(date_format(now(),'%Y-%m-%d'),date_format(`r`.`req_ent_date`,'%Y-%m-%d')) - `sb`.`sbj_duration`) - (select count(0) from `holiday` where ((`holiday`.`hol_is_active` = 1) and (cast(`holiday`.`hol_date` as date) between `r`.`req_ent_date` and cast(now() as date))))) < 0) and (`r`.`req_status_id` not in (3,4,7,8))) */;
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
/*!50001 VIEW `vw_req_stg_trail` AS select 'Current' AS `Status`,0 AS `TrailId`,`ps`.`rst_id` AS `rst_id`,`ps`.`rst_pr_id` AS `rst_pr_id`,`ps`.`rst_stg_id` AS `rst_stg_id`,`sg`.`stg_name` AS `stg_name`,`ps`.`rst_stage_status_id` AS `rst_stage_status_id`,`ss`.`ss_name` AS `ss_name`,date_format(`ps`.`rst_txn_date`,'%Y-%m-%d %r') AS `rst_txn_date`,NULL AS `Modified`,`ps`.`rst_note` AS `rst_note`,`ps`.`rst_user_id` AS `rst_user_id`,`stf`.`stf_name` AS `stf_name`,`s`.`sbj_code` AS `subjectCode` from (((((`process_stage` `ps` join `request` `r` on((`ps`.`rst_pr_id` = `r`.`req_id`))) join `subject` `s` on((`r`.`req_subject_id` = `s`.`sbj_id`))) join `subjec_stage` `sg` on((`ps`.`rst_stg_id` = `sg`.`stg_id`))) join `staff` `stf` on((`stf`.`stf_id` = `ps`.`rst_user_id`))) join `stage_status` `ss` on((`ss`.`ss_id` = `ps`.`rst_stage_status_id`))) union all select 'Modified' AS `Staus`,`sl`.`ps_id` AS `ps_id`,`sl`.`ps_rst_id` AS `ps_rst_id`,`ps`.`rst_pr_id` AS `rst_pr_id`,`sl`.`ps_stage_id` AS `ps_stage_id`,`sg`.`stg_name` AS `stg_name`,`sl`.`ps_status_id` AS `ps_status_id`,`ss`.`ss_name` AS `ss_name`,NULL AS `NULL`,date_format(`sl`.`ps_txn_date`,'%Y-%m-%d %r') AS `ps_txn_date`,`sl`.`ps_note` AS `ps_note`,`sl`.`ps_user_id` AS `ps_user_id`,`stf`.`stf_name` AS `stf_name`,'' AS `subjectCode` from ((((`stage_log` `sl` join `process_stage` `ps` on((`sl`.`ps_rst_id` = `ps`.`rst_id`))) join `subjec_stage` `sg` on((`sl`.`ps_stage_id` = `sg`.`stg_id`))) join `staff` `stf` on((`stf`.`stf_id` = `sl`.`ps_user_id`))) join `stage_status` `ss` on((`ss`.`ss_id` = `sl`.`ps_status_id`))) order by `rst_id`,`rst_pr_id` */;
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
/*!50001 VIEW `vw_request_list` AS select `r`.`req_id` AS `req_id`,`r`.`req_subject_id` AS `req_subject_id`,`s`.`sbj_code` AS `sbj_code`,`s`.`sbj_name` AS `sbj_name`,`r`.`req_division_id` AS `req_division_id`,`d`.`div_name` AS `div_name`,`r`.`req_public_id` AS `req_public_id`,`p`.`pi_name` AS `pi_name`,`p`.`pi_mobile_phone` AS `pi_mobile_phone`,`p`.`pi_email` AS `pi_email`,date_format(`r`.`req_ent_date`,'%Y-%m-%d') AS `req_ent_date`,`r`.`req_note` AS `req_note`,`r`.`req_fees` AS `req_fees`,`r`.`req_user_id` AS `req_user_id`,`st`.`stf_name` AS `stf_name`,`r`.`req_durartion` AS `req_durartion`,`r`.`req_status_id` AS `req_status_id`,`rs`.`rs_name` AS `rs_name`,`r`.`req_is_read` AS `req_is_read`,`r`.`req_processed` AS `req_processed`,`r`.`req_is_void` AS `req_is_void` from (((((`request` `r` join `division` `d` on((`r`.`req_division_id` = `d`.`div_id`))) join `public_individual` `p` on((`r`.`req_public_id` = `p`.`pi_id`))) join `subject` `s` on((`r`.`req_subject_id` = `s`.`sbj_id`))) join `staff` `st` on((`r`.`req_user_id` = `st`.`stf_id`))) join `request_status` `rs` on((`r`.`req_status_id` = `rs`.`rs_id`))) */;
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
/*!50001 VIEW `vw_request_trail` AS select 'Current' AS `Status`,1 AS `seq`,`r`.`req_id` AS `req_id`,`r`.`req_ent_date` AS `req_ent_date`,'' AS `Modified`,`r`.`req_note` AS `req_note`,`s`.`stf_name` AS `stf_name`,`r`.`req_user_id` AS `req_user_id`,`r`.`req_status_id` AS `req_status_id`,`rs`.`rs_name` AS `rs_name`,`r`.`req_is_void` AS `req_is_void` from ((`request` `r` join `request_status` `rs` on((`r`.`req_status_id` = `rs`.`rs_id`))) join `staff` `s` on((`r`.`req_user_id` = `s`.`stf_id`))) union all select 'Modified' AS `Status`,2 AS `seq`,`rl`.`rl_pr_id` AS `rl_pr_id`,'' AS `req_ent_date`,`rl`.`rl_txn_date` AS `rl_txn_date`,`rl`.`rl_note` AS `rl_note`,`s`.`stf_name` AS `stf_name`,`rl`.`rl_user_id` AS `rl_user_id`,`rl`.`rl_status_id` AS `rl_status_id`,`rs`.`rs_name` AS `rs_name`,`rl`.`rl_void` AS `rl_void` from ((`request_log` `rl` join `request_status` `rs` on((`rl`.`rl_status_id` = `rs`.`rs_id`))) join `staff` `s` on((`s`.`stf_id` = `rl`.`rl_user_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_sms_log`
--

/*!50001 DROP VIEW IF EXISTS `vw_sms_log`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_sms_log` AS select `l`.`sms_id` AS `sms_id`,date_format(`l`.`sms_date`,'%Y-%m-%d %r') AS `sms_date`,`l`.`sms_req_id` AS `sms_req_id`,`s`.`sbj_code` AS `sbj_code`,`p`.`pi_id` AS `pi_id`,`p`.`pi_name` AS `pi_name`,`l`.`sms_response` AS `sms_response`,`l`.`sms_status` AS `sms_status`,`l`.`sms_charges` AS `sms_charges`,`l`.`sms_user_id` AS `sms_user_id`,`st`.`stf_name` AS `stf_name` from ((((`sms_log` `l` left join `request` `r` on((`l`.`sms_req_id` = `r`.`req_id`))) left join `subject` `s` on((`r`.`req_subject_id` = `s`.`sbj_id`))) left join `public_individual` `p` on((`r`.`req_public_id` = `p`.`pi_id`))) left join `staff` `st` on((`l`.`sms_user_id` = `st`.`stf_id`))) */;
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

--
-- Final view structure for view `vw_tobe_printed`
--

/*!50001 DROP VIEW IF EXISTS `vw_tobe_printed`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_tobe_printed` AS select `a`.`app_id` AS `app_id`,`a`.`app_request_id` AS `app_request_id`,`s`.`sbj_code` AS `sbj_code`,`a`.`app_req_status` AS `app_req_status`,`a`.`app_is_printed` AS `app_is_printed`,`st`.`stf_name` AS `stf_name`,`rt`.`rs_name` AS `rs_name`,date_format(`a`.`app_date`,'%Y-%m-%d  %r') AS `app_date` from ((((`aproval` `a` join `request` `r` on((`a`.`app_request_id` = `r`.`req_id`))) join `subject` `s` on((`s`.`sbj_id` = `r`.`req_subject_id`))) join `staff` `st` on((`a`.`app_user_id` = `st`.`stf_id`))) join `request_status` `rt` on((`r`.`req_status_id` = `rt`.`rs_id`))) where ((`a`.`app_req_status` in (6,7)) and (`a`.`app_is_printed` = 0)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_undo_printed`
--

/*!50001 DROP VIEW IF EXISTS `vw_undo_printed`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_undo_printed` AS select `a`.`app_id` AS `app_id`,`a`.`app_request_id` AS `app_request_id`,`s`.`sbj_code` AS `sbj_code`,`a`.`app_req_status` AS `app_req_status`,`a`.`app_is_printed` AS `app_is_printed`,date_format(`a`.`app_printed_date`,'%Y-%m-%d  %r') AS `app_printed_date` from (((`aproval` `a` join `request` `r` on((`a`.`app_request_id` = `r`.`req_id`))) join `subject` `s` on((`s`.`sbj_id` = `r`.`req_subject_id`))) join `request_status` `rt` on((`r`.`req_status_id` = `rt`.`rs_id`))) where (`a`.`app_req_status` in (6,7)) */;
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

-- Dump completed on 2016-06-26 16:36:48

-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jan 18, 2016 at 05:31 PM
-- Server version: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `divsec`
--

-- --------------------------------------------------------

--
-- Table structure for table `aproval`
--

CREATE TABLE IF NOT EXISTS `aproval` (
  `app_id` int(11) NOT NULL AUTO_INCREMENT,
  `app_request_id` int(11) NOT NULL,
  `app_is_approved` bit(1) DEFAULT NULL,
  `app_date` datetime DEFAULT NULL,
  `app_ent_date` datetime DEFAULT NULL,
  `app_user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`app_id`),
  KEY `fk_app_request_id_idx` (`app_request_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `division`
--

CREATE TABLE IF NOT EXISTS `division` (
  `div_id` int(11) NOT NULL AUTO_INCREMENT,
  `div_name` varchar(50) DEFAULT NULL,
  `div_active` bit(1) DEFAULT NULL,
  PRIMARY KEY (`div_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `division`
--

INSERT INTO `division` (`div_id`, `div_name`, `div_active`) VALUES
(1, 'Admin', b'1'),
(2, 'Planning', b'1'),
(3, 'Registrar', b'1'),
(4, 'Agriculture', b'1'),
(5, 'this', b'1'),
(6, 'ABC', b'1');

-- --------------------------------------------------------

--
-- Table structure for table `email_setup`
--

CREATE TABLE IF NOT EXISTS `email_setup` (
  `email_id` int(11) NOT NULL AUTO_INCREMENT,
  `email_is_out_look` binary(1) DEFAULT NULL,
  `email_sender_name` varchar(100) DEFAULT NULL,
  `email_sender_email` varchar(100) DEFAULT NULL,
  `email_server_name` varchar(50) DEFAULT NULL,
  `email_port` varchar(6) DEFAULT NULL,
  `email_user_name` varchar(100) DEFAULT NULL,
  `email_password` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`email_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `gender`
--

CREATE TABLE IF NOT EXISTS `gender` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gender` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `gender`
--

INSERT INTO `gender` (`id`, `gender`) VALUES
(1, 'Male'),
(2, 'Female'),
(3, 'Other');

-- --------------------------------------------------------

--
-- Table structure for table `instructions`
--

CREATE TABLE IF NOT EXISTS `instructions` (
  `ins_id` int(11) NOT NULL AUTO_INCREMENT,
  `ins_pr_id` int(11) DEFAULT NULL,
  `ins_instruction` varchar(500) DEFAULT NULL,
  `ins_date` datetime DEFAULT NULL,
  `ins_is_read` bit(1) DEFAULT NULL,
  `ins_stf_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`ins_id`),
  KEY `fk_ins_pr_id_idx` (`ins_pr_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=16 ;

--
-- Dumping data for table `instructions`
--

INSERT INTO `instructions` (`ins_id`, `ins_pr_id`, `ins_instruction`, `ins_date`, `ins_is_read`, `ins_stf_id`) VALUES
(1, 12, 'IAny candidate, who is unable to sit for an examination paper or the examination due to illness, should submit Medical Certificate and submission form with relevant details “within seven working days with effect from exam date” to the Examinations & Registration Branch.', '2016-01-14 01:52:18', b'0', 23),
(2, 11, 'this is jezeem aymen', '2016-01-14 01:52:18', b'0', 23),
(3, 11, 'IAny candidate, who is unable to sit for an examination paper or the examination due to illness, should submit Medical Certificate and submission form with relevant details “within seven working days with effect from exam date” to the Examinations & Registration Branch.', '2016-01-14 01:53:14', b'0', 23),
(4, 10, 'this is jezeem aymen', '2016-01-14 01:53:56', b'0', 23),
(5, 13, 'IAny candidate, who is unable to sit for an examination paper or the examination due to illness, should submit Medical Certificate and submission form with relevant details “within seven working days with effect from exam date” to the Examinations & Registration Branch.', '2016-01-14 04:29:33', b'0', 23),
(6, 13, 'this is jezeem aymen', '2016-01-14 04:56:36', b'0', 23),
(7, 13, 'IAny candidate, who is unable to sit for an examination paper or the examination due to illness, should submit Medical Certificate and submission form with relevant details “within seven working days with effect from exam date” to the Examinations & Registration Branch.', '2016-01-14 04:58:14', b'0', 23),
(8, 13, 'this is jezeem aymen', '2016-01-14 05:01:38', b'0', 23),
(9, 13, 'IAny candidate, who is unable to sit for an examination paper or the examination due to illness, should submit Medical Certificate and submission form with relevant details “within seven working days with effect from exam date” to the Examinations & Registration Branch.', '2016-01-14 05:09:10', b'0', 23),
(10, 13, 'this is jezeem aymen', '2016-01-14 05:13:22', b'0', 23),
(11, 13, 'IAny candidate, who is unable to sit for an examination paper or the examination due to illness, should submit Medical Certificate and submission form with relevant details “within seven working days with effect from exam date” to the Examinations & Registration Branch.', '2016-01-14 05:15:53', b'0', 23),
(12, 13, 'this is jezeem aymen', '2016-01-14 05:16:33', b'0', 23),
(13, 13, 'IAny candidate, who is unable to sit for an examination paper or the examination due to illness, should submit Medical Certificate and submission form with relevant details “within seven working days with effect from exam date” to the Examinations & Registration Branch.', '2016-01-14 09:16:32', b'0', 23),
(14, 13, 'this is jezeem aymen', '2016-01-15 00:22:58', b'0', 23),
(15, 13, 'This is the last instruction', '2016-01-15 00:29:37', b'0', 23);

-- --------------------------------------------------------

--
-- Table structure for table `notification`
--

CREATE TABLE IF NOT EXISTS `notification` (
  `ntn_id` int(11) NOT NULL AUTO_INCREMENT,
  `ntn_type` varchar(100) DEFAULT NULL,
  `ntn_active` bit(1) DEFAULT NULL,
  PRIMARY KEY (`ntn_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `notification`
--

INSERT INTO `notification` (`ntn_id`, `ntn_type`, `ntn_active`) VALUES
(1, 'Non', b'1'),
(2, 'SMS', b'1'),
(3, 'Email', b'1'),
(4, 'SMS/Email', b'1');

-- --------------------------------------------------------

--
-- Table structure for table `process_request`
--

CREATE TABLE IF NOT EXISTS `process_request` (
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
  KEY `fk_pr_status_id_idx` (`pr_status_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Request Processing details and the progress are updated.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `process_stage`
--

CREATE TABLE IF NOT EXISTS `process_stage` (
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
  KEY `fk_rst_stg_id_idx` (`rst_stg_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=25 ;

--
-- Dumping data for table `process_stage`
--

INSERT INTO `process_stage` (`rst_id`, `rst_pr_id`, `rst_stg_id`, `rst_stage_status_id`, `rs_sequence_no`, `rst_txn_date`, `rst_note`, `rst_user_id`) VALUES
(11, 7, 1, 1, 0, '2016-01-04 10:57:47', '', 23),
(12, 7, 2, 1, 1, '2016-01-04 10:57:47', '', 23),
(13, 8, 1, 1, 0, '2016-01-05 10:59:06', '', 23),
(14, 8, 2, 1, 1, '2016-01-05 10:59:06', '', 23),
(15, 10, 1, 1, 0, '2016-01-06 08:04:51', '', 23),
(16, 10, 2, 1, 1, '2016-01-06 08:04:51', '', 23),
(17, 11, 1, 2, 0, '2016-01-07 04:55:40', 'jezeem', 23),
(18, 11, 2, 3, 1, '2016-01-07 04:55:40', 'hehe', 23),
(19, 12, 1, 1, 0, '2016-01-13 09:55:11', '', 23),
(20, 12, 2, 1, 1, '2016-01-13 09:55:11', '', 23),
(21, 13, 1, 3, 0, '2016-01-13 10:02:51', 'Completed', 23),
(22, 13, 2, 2, 1, '2016-01-13 10:02:51', 'stage', 23),
(23, 14, 1, 3, 0, '2016-01-14 10:50:00', 'Given to cleark', 23),
(24, 14, 2, 3, 1, '2016-01-14 10:50:00', 'stage', 23);

--
-- Triggers `process_stage`
--
DROP TRIGGER IF EXISTS `request_stage_AUPD`;
DELIMITER //
CREATE TRIGGER `request_stage_AUPD` AFTER UPDATE ON `process_stage`
 FOR EACH ROW -- Edit trigger body code below this line. Do not edit lines above this one
BEGIN 

INSERT INTO `stage_log`
(`ps_rst_id`,`ps_stage_id`,`ps_status_id`,`ps_txn_date`,`ps_user_id`,`ps_note`,`ps_ent_date`)
VALUES
(OLD.`rst_pr_id`,OLD.`rst_stg_id`,OLD.`rst_stage_status_id`,
    now(),OLD.`rst_user_id`,OLD.`rst_note`,OLD.`rst_txn_date`);

END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `public_individual`
--

CREATE TABLE IF NOT EXISTS `public_individual` (
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
  KEY `pi_notfication_id_idx` (`pi_notfication_type_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `public_individual`
--

INSERT INTO `public_individual` (`pi_id`, `pi_name`, `pi_address1`, `pi_address2`, `pi_address3`, `pi_land_phone`, `pi_mobile_phone`, `pi_email`, `pi_ind_user_id`, `pi_user_pwd`, `pi_nic`, `pi_dob`, `pi_gender`, `pi_note`, `pi_user_id`, `pi_notfication_type_id`, `pi_active`) VALUES
(1, 'N.J.Aymen', '105, Gall Road,', 'Colombo', '6', '123123', '777123123', 'jzmamn@gmail.com', 821491169, '123', '821491169v', '1980-10-01 00:00:00', 'Male', 'This a test', 1, 1, b'1'),
(2, 'Rafatha J Aymen', 'adsf1', '3', 'Nintavur', '1234232323', '1223232321', 'jzmamn@gmail.com', NULL, NULL, '232323232v', '2016-01-07 00:00:00', 'Female', 'adfs', 23, 2, b'1'),
(3, 'Rafatha', 'adsf1', 'adsf2', 'adf3', '1234232323', '1223232321', 'jzmamn@gmail.com', NULL, NULL, '232323232v', '2015-09-12 00:00:00', 'Male', 'adfs', 23, 2, b'1'),
(4, 'Fathima Rafatha', 'qewr', 'qer', 'qewr', '11', '11', 'jzmamn@gmail.com', NULL, NULL, '2322323232', '2015-12-14 00:00:00', 'Male', '233232', 23, 1, b'1');

-- --------------------------------------------------------

--
-- Table structure for table `request`
--

CREATE TABLE IF NOT EXISTS `request` (
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
  KEY `fk_req_status_id_idx` (`req_status_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='details about the request submitted by the public individual' AUTO_INCREMENT=15 ;

--
-- Dumping data for table `request`
--

INSERT INTO `request` (`req_id`, `req_subject_id`, `req_division_id`, `req_public_id`, `req_ent_date`, `req_note`, `req_fees`, `req_user_id`, `req_durartion`, `req_status_id`, `req_is_read`, `req_processed`, `req_is_void`) VALUES
(7, 4, 2, 1, '2016-01-04 00:00:00', 'Aymen', '1200.00', 23, 1, 2, b'0', b'0', b'1'),
(8, 4, 2, 1, '2016-01-05 00:00:00', '', '1200.00', 23, 1, 1, b'0', b'0', b'0'),
(10, 4, 2, 1, '2016-01-06 00:00:00', '', '1200.00', 23, 1, 1, b'0', b'0', b'1'),
(11, 4, 2, 1, '2016-01-07 00:00:00', '', '1200.00', 23, 1, 1, b'0', b'0', b'1'),
(12, 4, 2, 4, '2016-01-13 00:00:00', 'New', '1200.00', 23, 1, 1, b'0', b'0', b'0'),
(13, 4, 2, 1, '2016-01-13 00:00:00', 'jezeem', '1200.00', 23, 1, 1, b'0', b'0', b'0'),
(14, 4, 2, 1, '2016-01-14 00:00:00', 'Birth Certificate', '1200.00', 23, 1, 3, b'0', b'0', b'0');

--
-- Triggers `request`
--
DROP TRIGGER IF EXISTS `request_AUPD`;
DELIMITER //
CREATE TRIGGER `request_AUPD` AFTER UPDATE ON `request`
 FOR EACH ROW -- Edit trigger body code below this line. Do not edit lines above this one
BEGIN 
INSERT INTO `divsec`.`request_log`
(`rl_pr_id`,`rl_txn_date`,`rl_status_id`,`rl_user_id`,`rl_note`,
`rl_ent_date`,`rl_void`)
VALUES
(OLD.`req_id`,now(),OLD.`req_status_id`,OLD.`req_user_id`,
OLD.`req_note`, OLD.`req_ent_date`,OLD.`req_is_void`);
END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `request_log`
--

CREATE TABLE IF NOT EXISTS `request_log` (
  `rl_id` int(11) NOT NULL AUTO_INCREMENT,
  `rl_pr_id` int(11) DEFAULT NULL,
  `rl_txn_date` datetime DEFAULT NULL,
  `rl_status_id` int(11) DEFAULT NULL,
  `rl_user_id` int(11) DEFAULT NULL,
  `rl_note` varchar(100) DEFAULT NULL,
  `rl_ent_date` datetime DEFAULT NULL,
  `rl_void` bit(1) DEFAULT NULL,
  PRIMARY KEY (`rl_id`),
  KEY `fk_req_id_idx` (`rl_pr_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=33 ;

--
-- Dumping data for table `request_log`
--

INSERT INTO `request_log` (`rl_id`, `rl_pr_id`, `rl_txn_date`, `rl_status_id`, `rl_user_id`, `rl_note`, `rl_ent_date`, `rl_void`) VALUES
(27, 7, '2016-01-07 20:30:37', 2, 23, 'Nice test', '2016-01-04 00:00:00', b'0'),
(29, 11, '2016-01-07 21:05:40', 1, 23, '', '2016-01-07 00:00:00', b'0'),
(30, 7, '2016-01-08 20:31:55', 2, 23, 'Nice test', '2016-01-04 00:00:00', b'1'),
(31, 14, '2016-01-14 22:56:55', 1, 23, 'Birth Certificate', '2016-01-14 00:00:00', b'0'),
(32, 14, '2016-01-14 23:00:22', 2, 23, 'Birth Certificate', '2016-01-14 00:00:00', b'0');

-- --------------------------------------------------------

--
-- Table structure for table `request_status`
--

CREATE TABLE IF NOT EXISTS `request_status` (
  `rs_id` int(11) NOT NULL,
  `rs_name` varchar(50) DEFAULT NULL,
  `rs_active` bit(1) DEFAULT NULL,
  PRIMARY KEY (`rs_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `request_status`
--

INSERT INTO `request_status` (`rs_id`, `rs_name`, `rs_active`) VALUES
(1, 'New', b'1'),
(2, 'Opened', b'1'),
(3, 'Completed', b'1'),
(4, 'Closed', b'1'),
(5, 'ToBeApp', b'1'),
(6, 'Approved', b'1'),
(7, 'Rejected', b'1');

-- --------------------------------------------------------

--
-- Table structure for table `sms_setup`
--

CREATE TABLE IF NOT EXISTS `sms_setup` (
  `sms_id` int(11) NOT NULL,
  `sms_com_port_id` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`sms_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE IF NOT EXISTS `staff` (
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
  PRIMARY KEY (`stf_id`),
  UNIQUE KEY `stf_user_id_UNIQUE` (`stf_user_id`),
  KEY `fk_stf_category_id_idx` (`stf_category_id`),
  KEY `fk_stf_divsion_id_idx` (`stf_dvision_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=42 ;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`stf_id`, `stf_name`, `stf_category_id`, `stf_user_id`, `stf_password`, `stf_dvision_id`, `stf_email`, `stf_mobile`, `stf_note`, `stf_active`) VALUES
(21, 'admin1', 2, 'Aymen', '$2a$10$YRhk2f9tSmElt5OvQh9JcOJyw9hEVSMkvu.PV4rmL28wQU3PWTgoi', 1, '', '', '', b'0'),
(22, 'aymen', 2, 'aa', '11', 1, '', '', '', b'0'),
(23, 'a', 1, 'a', '$2a$10$LOqePml/koRGsk2YAIOFI.1YNKZg7EsQ5BAIuYP1nWOyYRl21dlne', 2, '', '', '', b'1'),
(29, 'af', 3, 'aaaa', '5', 2, '', '', '', b'0'),
(36, 'aaa', 3, '11', '123', 1, '', '', '', b'1'),
(37, 'abc', 1, 'auah', '12344', 1, 'jzmamn@gmail.com', '12343214', 'this si', b'1'),
(38, 'asdf', 3, 'adf', 'aaaa', 1, '', '', '', b'1'),
(40, 'Shameer', 1, 'wererere', '1234', 1, '', '', '', b'1'),
(41, 'Nasheerdeen', NULL, 'na', '$2a$10$LABTIDs4/hN7GwPw5yXtT.z9OLBJlm9jrg87tmqUEVqR9xBvl5OIe', 3, 'na@yahoo.com', '34342', 'as', b'1');

-- --------------------------------------------------------

--
-- Table structure for table `staff_role`
--

CREATE TABLE IF NOT EXISTS `staff_role` (
  `staff_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`staff_id`,`role_id`),
  KEY `fk_role_role_id_idx` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `staff_role`
--

INSERT INTO `staff_role` (`staff_id`, `role_id`) VALUES
(23, 1),
(21, 2);

-- --------------------------------------------------------

--
-- Table structure for table `stage_log`
--

CREATE TABLE IF NOT EXISTS `stage_log` (
  `ps_id` int(11) NOT NULL AUTO_INCREMENT,
  `ps_rst_id` int(11) DEFAULT NULL,
  `ps_stage_id` int(11) DEFAULT NULL,
  `ps_status_id` int(11) DEFAULT NULL,
  `ps_txn_date` datetime DEFAULT NULL,
  `ps_user_id` int(11) DEFAULT NULL,
  `ps_note` varchar(100) DEFAULT NULL,
  `ps_ent_date` datetime DEFAULT NULL,
  PRIMARY KEY (`ps_id`),
  KEY `fk_rst_id_idx` (`ps_rst_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `stage_log`
--

INSERT INTO `stage_log` (`ps_id`, `ps_rst_id`, `ps_stage_id`, `ps_status_id`, `ps_txn_date`, `ps_user_id`, `ps_note`, `ps_ent_date`) VALUES
(1, 11, 1, 1, '2016-01-08 23:12:15', 23, '', '2016-01-07 04:55:40'),
(2, 11, 1, 1, '2016-01-08 23:23:59', 23, 'aymen', '2016-01-07 04:55:40'),
(3, 11, 1, 1, '2016-01-08 23:24:23', 23, 'jezeem', '2016-01-07 04:55:40'),
(4, 11, 2, 1, '2016-01-13 21:46:37', 23, '', '2016-01-07 04:55:40'),
(5, 13, 1, 1, '2016-01-13 22:12:30', 23, '', '2016-01-13 10:02:51'),
(6, 13, 2, 1, '2016-01-13 22:16:15', 23, '', '2016-01-13 10:02:51'),
(7, 13, 2, 3, '2016-01-13 22:17:56', 23, 'stage', '2016-01-13 10:02:51'),
(8, 13, 1, 2, '2016-01-13 22:19:45', 23, 'stage', '2016-01-13 10:02:51'),
(9, 13, 1, 3, '2016-01-13 22:30:30', 23, 'stage', '2016-01-13 10:02:51'),
(10, 14, 1, 1, '2016-01-14 22:55:29', 23, '', '2016-01-14 10:50:00'),
(11, 14, 1, 2, '2016-01-14 22:58:47', 23, 'Given to cleark', '2016-01-14 10:50:00'),
(12, 14, 2, 1, '2016-01-14 22:59:48', 23, '', '2016-01-14 10:50:00');

-- --------------------------------------------------------

--
-- Table structure for table `stage_status`
--

CREATE TABLE IF NOT EXISTS `stage_status` (
  `ss_id` int(11) NOT NULL AUTO_INCREMENT,
  `ss_name` varchar(50) DEFAULT NULL,
  `ss_active` bit(1) DEFAULT NULL,
  PRIMARY KEY (`ss_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `stage_status`
--

INSERT INTO `stage_status` (`ss_id`, `ss_name`, `ss_active`) VALUES
(1, 'Pending', b'1'),
(2, 'Progress', b'1'),
(3, 'Completed', b'1');

-- --------------------------------------------------------

--
-- Table structure for table `subject`
--

CREATE TABLE IF NOT EXISTS `subject` (
  `sbj_id` int(11) NOT NULL AUTO_INCREMENT,
  `sbj_code` varchar(50) DEFAULT NULL,
  `sbj_name` varchar(50) DEFAULT NULL,
  `sbj_active` bit(1) DEFAULT NULL,
  `sbj_div_id` int(11) DEFAULT NULL,
  `sbj_duration` int(11) DEFAULT NULL,
  `sbj_cost` decimal(18,2) DEFAULT NULL,
  PRIMARY KEY (`sbj_id`),
  KEY `fk_sbj_div_id_idx` (`sbj_div_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `subject`
--

INSERT INTO `subject` (`sbj_id`, `sbj_code`, `sbj_name`, `sbj_active`, `sbj_div_id`, `sbj_duration`, `sbj_cost`) VALUES
(4, 'plan/jez/2004', 'Jezeem', b'1', 2, 1, '1200.00'),
(5, 'adfdadf', 'a', b'1', 2, 2, '2.00'),
(7, 'com', 'je', b'1', 5, 23, '2323.00'),
(8, 'coma', 'je', b'1', 5, 23, '2323.00'),
(9, 'com', 'je', b'1', 5, 23, '2323.00'),
(10, 'af', 'aa', b'1', 3, 2, '123.00');

-- --------------------------------------------------------

--
-- Table structure for table `subjec_stage`
--

CREATE TABLE IF NOT EXISTS `subjec_stage` (
  `stg_id` int(11) NOT NULL AUTO_INCREMENT,
  `stg_subject_id` int(11) DEFAULT NULL,
  `stg_name` varchar(100) DEFAULT NULL,
  `stg_active` bit(1) DEFAULT NULL,
  `stg_cost` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`stg_id`),
  KEY `fk_sbject_id_idx` (`stg_subject_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Stages for a subject that is to be completed.' AUTO_INCREMENT=4 ;

--
-- Dumping data for table `subjec_stage`
--

INSERT INTO `subjec_stage` (`stg_id`, `stg_subject_id`, `stg_name`, `stg_active`, `stg_cost`) VALUES
(1, 4, 'Submitted to cleark', b'1', '100.00'),
(2, 4, 'Registrar Signature', b'1', '100.00'),
(3, 5, 'Aymen', b'1', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ticket`
--

CREATE TABLE IF NOT EXISTS `ticket` (
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
  KEY `fk_tkt_status_idx` (`tkt_status`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ticket_priority`
--

CREATE TABLE IF NOT EXISTS `ticket_priority` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tkt_priority` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `ticket_priority`
--

INSERT INTO `ticket_priority` (`id`, `tkt_priority`) VALUES
(1, 'High'),
(2, 'Medium'),
(3, 'Low');

-- --------------------------------------------------------

--
-- Table structure for table `ticket_status`
--

CREATE TABLE IF NOT EXISTS `ticket_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tkt_status` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `ticket_status`
--

INSERT INTO `ticket_status` (`id`, `tkt_status`) VALUES
(1, 'Pending'),
(2, 'Open'),
(3, 'Close');

-- --------------------------------------------------------

--
-- Table structure for table `user_category`
--

CREATE TABLE IF NOT EXISTS `user_category` (
  `cat_id` int(11) NOT NULL AUTO_INCREMENT,
  `cat_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`cat_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='categories are saved. Admin, Head of Divison, Staff and publ' AUTO_INCREMENT=4 ;

--
-- Dumping data for table `user_category`
--

INSERT INTO `user_category` (`cat_id`, `cat_name`) VALUES
(1, 'ROLE_ADMIN'),
(2, 'ROLE_HOD'),
(3, 'ROLE_STAFF');

-- --------------------------------------------------------

--
-- Stand-in structure for view `vw_request_trail`
--
CREATE TABLE IF NOT EXISTS `vw_request_trail` (
`Status` varchar(8)
,`seq` bigint(20)
,`req_id` int(11)
,`req_ent_date` varchar(19)
,`Modified` varchar(19)
,`req_note` varchar(100)
,`stf_name` varchar(50)
,`req_user_id` int(11)
,`req_status_id` int(11)
,`rs_name` varchar(50)
,`req_is_void` bit(1)
);
-- --------------------------------------------------------

--
-- Stand-in structure for view `vw_req_batch_count`
--
CREATE TABLE IF NOT EXISTS `vw_req_batch_count` (
`req_status_id` int(11)
,`rs_name` varchar(50)
,`count` bigint(21)
);
-- --------------------------------------------------------

--
-- Stand-in structure for view `vw_req_completed`
--
CREATE TABLE IF NOT EXISTS `vw_req_completed` (
`req_id` int(11)
,`req_subject_id` int(11)
,`sbj_code` varchar(50)
,`req_division_id` int(11)
,`div_name` varchar(50)
,`req_public_id` int(11)
,`pi_name` varchar(100)
,`req_status_id` int(11)
,`rs_name` varchar(50)
,`today` varchar(10)
,`EntDate` varchar(10)
,`sbj_duration` int(11)
,`Past` double(17,0)
);
-- --------------------------------------------------------

--
-- Stand-in structure for view `vw_req_overdue`
--
CREATE TABLE IF NOT EXISTS `vw_req_overdue` (
`req_id` int(11)
,`req_subject_id` int(11)
,`sbj_code` varchar(50)
,`req_division_id` int(11)
,`div_name` varchar(50)
,`req_public_id` int(11)
,`pi_name` varchar(100)
,`req_status_id` int(11)
,`rs_name` varchar(50)
,`today` varchar(10)
,`EntDate` varchar(10)
,`sbj_duration` int(11)
,`Overdue` double(17,0)
);
-- --------------------------------------------------------

--
-- Stand-in structure for view `vw_req_stg_trail`
--
CREATE TABLE IF NOT EXISTS `vw_req_stg_trail` (
`Status` varchar(8)
,`TrailId` bigint(11)
,`rst_id` int(11)
,`rst_pr_id` int(11)
,`rst_stg_id` int(11)
,`stg_name` varchar(100)
,`rst_stage_status_id` int(11)
,`ss_name` varchar(50)
,`rst_txn_date` varchar(10)
,`Modified` varchar(10)
,`rst_note` varchar(100)
,`rst_user_id` int(11)
,`stf_name` varchar(50)
);
-- --------------------------------------------------------

--
-- Stand-in structure for view `vw_test`
--
CREATE TABLE IF NOT EXISTS `vw_test` (
`div_id` int(11)
,`div_name` varchar(50)
,`div_active` bit(1)
);
-- --------------------------------------------------------

--
-- Structure for view `vw_request_trail`
--
DROP TABLE IF EXISTS `vw_request_trail`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_request_trail` AS select 'Original' AS `Status`,1 AS `seq`,`r`.`req_id` AS `req_id`,`r`.`req_ent_date` AS `req_ent_date`,'' AS `Modified`,`r`.`req_note` AS `req_note`,`s`.`stf_name` AS `stf_name`,`r`.`req_user_id` AS `req_user_id`,`r`.`req_status_id` AS `req_status_id`,`rs`.`rs_name` AS `rs_name`,`r`.`req_is_void` AS `req_is_void` from ((`request` `r` join `request_status` `rs` on((`r`.`req_status_id` = `rs`.`rs_id`))) join `staff` `s` on((`r`.`req_user_id` = `s`.`stf_id`))) union all select 'Modified' AS `Status`,2 AS `seq`,`rl`.`rl_pr_id` AS `rl_pr_id`,'' AS ``,`rl`.`rl_txn_date` AS `rl_txn_date`,`rl`.`rl_note` AS `rl_note`,`s`.`stf_name` AS `stf_name`,`rl`.`rl_user_id` AS `rl_user_id`,`rl`.`rl_status_id` AS `rl_status_id`,`rs`.`rs_name` AS `rs_name`,`rl`.`rl_void` AS `rl_void` from ((`request_log` `rl` join `request_status` `rs` on((`rl`.`rl_status_id` = `rs`.`rs_id`))) join `staff` `s` on((`s`.`stf_id` = `rl`.`rl_user_id`)));

-- --------------------------------------------------------

--
-- Structure for view `vw_req_batch_count`
--
DROP TABLE IF EXISTS `vw_req_batch_count`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_req_batch_count` AS select `r`.`req_status_id` AS `req_status_id`,`rs`.`rs_name` AS `rs_name`,count(`r`.`req_id`) AS `count` from (`request` `r` join `request_status` `rs` on((`r`.`req_status_id` = `rs`.`rs_id`))) group by `r`.`req_status_id`,`rs`.`rs_name`;

-- --------------------------------------------------------

--
-- Structure for view `vw_req_completed`
--
DROP TABLE IF EXISTS `vw_req_completed`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_req_completed` AS select `r`.`req_id` AS `req_id`,`r`.`req_subject_id` AS `req_subject_id`,`sb`.`sbj_code` AS `sbj_code`,`r`.`req_division_id` AS `req_division_id`,`d`.`div_name` AS `div_name`,`r`.`req_public_id` AS `req_public_id`,`p`.`pi_name` AS `pi_name`,`r`.`req_status_id` AS `req_status_id`,`rs`.`rs_name` AS `rs_name`,date_format(now(),'%Y-%m-%d') AS `today`,date_format(`r`.`req_ent_date`,'%Y-%m-%d') AS `EntDate`,`sb`.`sbj_duration` AS `sbj_duration`,((date_format(now(),'%Y%m%d') - date_format(`r`.`req_ent_date`,'%Y%m%d')) - `sb`.`sbj_duration`) AS `Past` from ((((`request` `r` join `subject` `sb` on((`r`.`req_subject_id` = `sb`.`sbj_id`))) join `division` `d` on((`r`.`req_division_id` = `d`.`div_id`))) join `public_individual` `p` on((`r`.`req_public_id` = `p`.`pi_id`))) join `request_status` `rs` on((`r`.`req_status_id` = `rs`.`rs_id`))) where (`r`.`req_status_id` = 3);

-- --------------------------------------------------------

--
-- Structure for view `vw_req_overdue`
--
DROP TABLE IF EXISTS `vw_req_overdue`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_req_overdue` AS select `r`.`req_id` AS `req_id`,`r`.`req_subject_id` AS `req_subject_id`,`sb`.`sbj_code` AS `sbj_code`,`r`.`req_division_id` AS `req_division_id`,`d`.`div_name` AS `div_name`,`r`.`req_public_id` AS `req_public_id`,`p`.`pi_name` AS `pi_name`,`r`.`req_status_id` AS `req_status_id`,`rs`.`rs_name` AS `rs_name`,date_format(now(),'%Y-%m-%d') AS `today`,date_format(`r`.`req_ent_date`,'%Y-%m-%d') AS `EntDate`,`sb`.`sbj_duration` AS `sbj_duration`,((date_format(now(),'%Y%m%d') - date_format(`r`.`req_ent_date`,'%Y%m%d')) - `sb`.`sbj_duration`) AS `Overdue` from ((((`request` `r` join `subject` `sb` on((`r`.`req_subject_id` = `sb`.`sbj_id`))) join `division` `d` on((`r`.`req_division_id` = `d`.`div_id`))) join `public_individual` `p` on((`r`.`req_public_id` = `p`.`pi_id`))) join `request_status` `rs` on((`r`.`req_status_id` = `rs`.`rs_id`))) where (`r`.`req_status_id` not in (3,4));

-- --------------------------------------------------------

--
-- Structure for view `vw_req_stg_trail`
--
DROP TABLE IF EXISTS `vw_req_stg_trail`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_req_stg_trail` AS select 'Original' AS `Status`,0 AS `TrailId`,`ps`.`rst_id` AS `rst_id`,`ps`.`rst_pr_id` AS `rst_pr_id`,`ps`.`rst_stg_id` AS `rst_stg_id`,`sg`.`stg_name` AS `stg_name`,`ps`.`rst_stage_status_id` AS `rst_stage_status_id`,`ss`.`ss_name` AS `ss_name`,date_format(`ps`.`rst_txn_date`,'%Y-%m-%d') AS `rst_txn_date`,NULL AS `Modified`,`ps`.`rst_note` AS `rst_note`,`ps`.`rst_user_id` AS `rst_user_id`,`stf`.`stf_name` AS `stf_name` from ((((`process_stage` `ps` join `request` `r` on((`ps`.`rst_pr_id` = `r`.`req_id`))) join `subjec_stage` `sg` on((`ps`.`rst_stg_id` = `sg`.`stg_id`))) join `staff` `stf` on((`stf`.`stf_id` = `ps`.`rst_user_id`))) join `stage_status` `ss` on((`ss`.`ss_id` = `ps`.`rst_stage_status_id`))) union all select 'Modified' AS `Staus`,`sl`.`ps_id` AS `ps_id`,`sl`.`ps_rst_id` AS `ps_rst_id`,`ps`.`rst_pr_id` AS `rst_pr_id`,`sl`.`ps_stage_id` AS `ps_stage_id`,`sg`.`stg_name` AS `stg_name`,`sl`.`ps_status_id` AS `ps_status_id`,`ss`.`ss_name` AS `ss_name`,NULL AS `NULL`,date_format(`sl`.`ps_txn_date`,'%Y-%m-%d') AS `ps_txn_date`,`sl`.`ps_note` AS `ps_note`,`sl`.`ps_user_id` AS `ps_user_id`,`stf`.`stf_name` AS `stf_name` from ((((`stage_log` `sl` join `process_stage` `ps` on((`sl`.`ps_rst_id` = `ps`.`rst_id`))) join `subjec_stage` `sg` on((`sl`.`ps_stage_id` = `sg`.`stg_id`))) join `staff` `stf` on((`stf`.`stf_id` = `sl`.`ps_user_id`))) join `stage_status` `ss` on((`ss`.`ss_id` = `sl`.`ps_status_id`))) order by `rst_id`,`rst_pr_id`;

-- --------------------------------------------------------

--
-- Structure for view `vw_test`
--
DROP TABLE IF EXISTS `vw_test`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_test` AS select `division`.`div_id` AS `div_id`,`division`.`div_name` AS `div_name`,`division`.`div_active` AS `div_active` from `division`;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `aproval`
--
ALTER TABLE `aproval`
  ADD CONSTRAINT `fk_app_request_id` FOREIGN KEY (`app_request_id`) REFERENCES `request` (`req_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `instructions`
--
ALTER TABLE `instructions`
  ADD CONSTRAINT `fk_ins_pr_id` FOREIGN KEY (`ins_pr_id`) REFERENCES `request` (`req_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `process_request`
--
ALTER TABLE `process_request`
  ADD CONSTRAINT `fk_pr_request_id` FOREIGN KEY (`pr_request_id`) REFERENCES `request` (`req_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_pr_status_id` FOREIGN KEY (`pr_status_id`) REFERENCES `request_status` (`rs_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `process_stage`
--
ALTER TABLE `process_stage`
  ADD CONSTRAINT `fk_rst_pr_id` FOREIGN KEY (`rst_pr_id`) REFERENCES `request` (`req_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_rst_stage_status` FOREIGN KEY (`rst_stage_status_id`) REFERENCES `stage_status` (`ss_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_rst_stg_id` FOREIGN KEY (`rst_stg_id`) REFERENCES `subjec_stage` (`stg_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_rst_user_id` FOREIGN KEY (`rst_user_id`) REFERENCES `staff` (`stf_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `public_individual`
--
ALTER TABLE `public_individual`
  ADD CONSTRAINT `fk_pi_notfication_type_id` FOREIGN KEY (`pi_notfication_type_id`) REFERENCES `notification` (`ntn_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `request`
--
ALTER TABLE `request`
  ADD CONSTRAINT `fk_req_division_id` FOREIGN KEY (`req_division_id`) REFERENCES `division` (`div_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_req_public_id` FOREIGN KEY (`req_public_id`) REFERENCES `public_individual` (`pi_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_req_status_id` FOREIGN KEY (`req_status_id`) REFERENCES `request_status` (`rs_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_req_subject_id` FOREIGN KEY (`req_subject_id`) REFERENCES `subject` (`sbj_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_req_user_id` FOREIGN KEY (`req_user_id`) REFERENCES `staff` (`stf_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `request_log`
--
ALTER TABLE `request_log`
  ADD CONSTRAINT `fk_pr_id` FOREIGN KEY (`rl_pr_id`) REFERENCES `request` (`req_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `staff`
--
ALTER TABLE `staff`
  ADD CONSTRAINT `fk_stf_divsion_id` FOREIGN KEY (`stf_dvision_id`) REFERENCES `division` (`div_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `staff_role`
--
ALTER TABLE `staff_role`
  ADD CONSTRAINT `fk_role_role_id` FOREIGN KEY (`role_id`) REFERENCES `user_category` (`cat_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_role_user_id` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`stf_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `stage_log`
--
ALTER TABLE `stage_log`
  ADD CONSTRAINT `fk_rst_id` FOREIGN KEY (`ps_rst_id`) REFERENCES `process_stage` (`rst_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `subject`
--
ALTER TABLE `subject`
  ADD CONSTRAINT `fk_sbj_div_id` FOREIGN KEY (`sbj_div_id`) REFERENCES `division` (`div_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `subjec_stage`
--
ALTER TABLE `subjec_stage`
  ADD CONSTRAINT `fk_sbject_id` FOREIGN KEY (`stg_subject_id`) REFERENCES `subject` (`sbj_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `ticket`
--
ALTER TABLE `ticket`
  ADD CONSTRAINT `fk_tkt_from` FOREIGN KEY (`tkt_from`) REFERENCES `staff` (`stf_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tkt_priority` FOREIGN KEY (`tkt_priority`) REFERENCES `ticket_priority` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tkt_status` FOREIGN KEY (`tkt_status`) REFERENCES `ticket_status` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tkt_to` FOREIGN KEY (`tkt_to`) REFERENCES `staff` (`stf_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

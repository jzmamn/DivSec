-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Dec 31, 2015 at 08:02 PM
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `division`
--

INSERT INTO `division` (`div_id`, `div_name`, `div_active`) VALUES
(1, 'Admin', b'1'),
(2, 'Planning', b'1'),
(3, 'Registrar', b'1'),
(4, 'Agriculture', b'1'),
(5, 'this', b'1');

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
  `ins_instruction` varchar(100) DEFAULT NULL,
  `ins_date` datetime DEFAULT NULL,
  `ins_is_read` bit(1) DEFAULT NULL,
  PRIMARY KEY (`ins_id`),
  KEY `fk_ins_pr_id_idx` (`ins_pr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

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
  KEY `fk_stg_pr_id_idx` (`rst_pr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

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
(1, 'N.J.Aymen', '105, Gall Road,', 'Colombo', '6', '123123', '777123123', 'jzmamn@gmail.com', 821491169, '123', '821491169v', '1980-10-01 00:00:00', 'Male', 'This a test', 1, 2, b'1'),
(2, 'Rafatha J Aymen', 'adsf1', 'adsf2', 'adf3', '1234232323', '1223232321', 'jzmamn@gmail.com', NULL, NULL, '232323232v', '2015-09-11 00:00:00', 'Male', 'adfs', 23, 2, b'1'),
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
  KEY `fk_req_subject_id_idx` (`req_subject_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='details about the request submitted by the public individual' AUTO_INCREMENT=1 ;

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
  PRIMARY KEY (`rl_id`),
  KEY `fk_req_id_idx` (`rl_pr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=41 ;

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
(40, 'Shameer', 1, 'wererere', '1234', 1, '', '', '', b'1');

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
  PRIMARY KEY (`ps_id`),
  KEY `fk_rst_id_idx` (`ps_rst_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

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
(1, 'Progress', b'1'),
(2, 'Pending', b'1'),
(3, 'Complete', b'1');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Stages for a subject that is to be completed.' AUTO_INCREMENT=3 ;

--
-- Dumping data for table `subjec_stage`
--

INSERT INTO `subjec_stage` (`stg_id`, `stg_subject_id`, `stg_name`, `stg_active`, `stg_cost`) VALUES
(1, 4, 'Stage1', b'1', NULL),
(2, 4, 'Stage2', b'1', '100.00');

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
-- Stand-in structure for view `vw_test`
--
CREATE TABLE IF NOT EXISTS `vw_test` (
`div_id` int(11)
,`div_name` varchar(50)
,`div_active` bit(1)
);
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
  ADD CONSTRAINT `fk_ins_pr_id` FOREIGN KEY (`ins_pr_id`) REFERENCES `process_request` (`pr_request_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

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
  ADD CONSTRAINT `fk_rst_pr_id` FOREIGN KEY (`rst_pr_id`) REFERENCES `process_request` (`pr_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_rst_stage_status` FOREIGN KEY (`rst_stage_status_id`) REFERENCES `stage_status` (`ss_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
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
  ADD CONSTRAINT `fk_req_subject_id` FOREIGN KEY (`req_subject_id`) REFERENCES `subject` (`sbj_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_req_user_id` FOREIGN KEY (`req_user_id`) REFERENCES `staff` (`stf_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `request_log`
--
ALTER TABLE `request_log`
  ADD CONSTRAINT `fk_pr_id` FOREIGN KEY (`rl_pr_id`) REFERENCES `process_request` (`pr_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

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

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

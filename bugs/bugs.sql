-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 24, 2021 at 07:52 AM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bugs`
--

-- --------------------------------------------------------

--
-- Table structure for table `bugs`
--

CREATE TABLE `bugs` (
  `bug_id` mediumint(9) NOT NULL,
  `assigned_to` mediumint(9) NOT NULL,
  `bug_file_loc` mediumtext NOT NULL DEFAULT '',
  `bug_severity` varchar(64) NOT NULL,
  `bug_status` varchar(64) NOT NULL,
  `creation_ts` datetime DEFAULT NULL,
  `delta_ts` datetime NOT NULL,
  `short_desc` varchar(255) NOT NULL,
  `op_sys` varchar(64) NOT NULL,
  `priority` varchar(64) NOT NULL,
  `product_id` smallint(6) NOT NULL,
  `rep_platform` varchar(64) NOT NULL,
  `reporter` mediumint(9) NOT NULL,
  `version` varchar(64) NOT NULL,
  `component_id` mediumint(9) NOT NULL,
  `resolution` varchar(64) NOT NULL DEFAULT '',
  `target_milestone` varchar(64) NOT NULL DEFAULT '---',
  `qa_contact` mediumint(9) DEFAULT NULL,
  `status_whiteboard` mediumtext NOT NULL DEFAULT '',
  `lastdiffed` datetime DEFAULT NULL,
  `everconfirmed` tinyint(4) NOT NULL,
  `reporter_accessible` tinyint(4) NOT NULL DEFAULT 1,
  `cclist_accessible` tinyint(4) NOT NULL DEFAULT 1,
  `estimated_time` decimal(7,2) NOT NULL DEFAULT 0.00,
  `remaining_time` decimal(7,2) NOT NULL DEFAULT 0.00,
  `deadline` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `bugs`
--

INSERT INTO `bugs` (`bug_id`, `assigned_to`, `bug_file_loc`, `bug_severity`, `bug_status`, `creation_ts`, `delta_ts`, `short_desc`, `op_sys`, `priority`, `product_id`, `rep_platform`, `reporter`, `version`, `component_id`, `resolution`, `target_milestone`, `qa_contact`, `status_whiteboard`, `lastdiffed`, `everconfirmed`, `reporter_accessible`, `cclist_accessible`, `estimated_time`, `remaining_time`, `deadline`) VALUES
(8, 5, '', 'enhancement', 'RESOLVED', '2021-12-24 13:47:48', '2021-12-24 13:48:46', 'Không hiện hình ảnh ở trang khách hàng', 'Windows', '---', 3, 'PC', 5, 'unspecified', 4, 'FIXED', '---', NULL, '', NULL, 1, 1, 1, '0.00', '0.00', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bugs`
--
ALTER TABLE `bugs`
  ADD PRIMARY KEY (`bug_id`),
  ADD KEY `bugs_assigned_to_idx` (`assigned_to`),
  ADD KEY `bugs_creation_ts_idx` (`creation_ts`),
  ADD KEY `bugs_delta_ts_idx` (`delta_ts`),
  ADD KEY `bugs_bug_severity_idx` (`bug_severity`),
  ADD KEY `bugs_bug_status_idx` (`bug_status`),
  ADD KEY `bugs_op_sys_idx` (`op_sys`),
  ADD KEY `bugs_priority_idx` (`priority`),
  ADD KEY `bugs_product_id_idx` (`product_id`),
  ADD KEY `bugs_reporter_idx` (`reporter`),
  ADD KEY `bugs_version_idx` (`version`),
  ADD KEY `bugs_component_id_idx` (`component_id`),
  ADD KEY `bugs_resolution_idx` (`resolution`),
  ADD KEY `bugs_target_milestone_idx` (`target_milestone`),
  ADD KEY `bugs_qa_contact_idx` (`qa_contact`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bugs`
--
ALTER TABLE `bugs`
  MODIFY `bug_id` mediumint(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bugs`
--
ALTER TABLE `bugs`
  ADD CONSTRAINT `fk_bugs_assigned_to_profiles_userid` FOREIGN KEY (`assigned_to`) REFERENCES `profiles` (`userid`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_bugs_component_id_components_id` FOREIGN KEY (`component_id`) REFERENCES `components` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_bugs_product_id_products_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_bugs_qa_contact_profiles_userid` FOREIGN KEY (`qa_contact`) REFERENCES `profiles` (`userid`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_bugs_reporter_profiles_userid` FOREIGN KEY (`reporter`) REFERENCES `profiles` (`userid`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

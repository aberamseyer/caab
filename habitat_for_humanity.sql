-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 18, 2017 at 07:20 PM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `habitat_for_humanity`
--

-- --------------------------------------------------------

--
-- Table structure for table `actor`
--

CREATE TABLE `actor` (
  `actor_id` int(9) NOT NULL,
  `address_id` int(9) NOT NULL,
  `relation_id` int(9) DEFAULT NULL,
  `actor_type` enum('P','O') NOT NULL COMMENT 'P = person, O = Organization'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `actor`
--

INSERT INTO `actor` (`actor_id`, `address_id`, `relation_id`, `actor_type`) VALUES
(1, 1, 1, 'P'),
(2, 2, 2, 'P'),
(3, 3, 3, 'O'),
(4, 4, 4, 'O'),
(5, 5, 5, 'P'),
(6, 6, 2, 'P');

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

CREATE TABLE `address` (
  `address_id` int(9) NOT NULL,
  `street` varchar(120) DEFAULT '',
  `apartment_no` varchar(6) DEFAULT '',
  `city` varchar(120) NOT NULL,
  `state` varchar(20) NOT NULL,
  `zipcode` varchar(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `address`
--

INSERT INTO `address` (`address_id`, `street`, `apartment_no`, `city`, `state`, `zipcode`) VALUES
(1, '1443 County rd 1300 N', '', 'roanoke', 'illinois', '61561'),
(2, '124 crossings drive', '4', 'normal', 'il', '61760'),
(3, '12 candy lane', 'b', 'London', 'MO', '23485'),
(4, '965 empty lot street', '', 'hiroshima', 'AR', '96248'),
(5, '12 candy lane', '', 'London', 'Maine', '00210'),
(6, '54 another empty lot', '2', 'New York City', 'NY', '94854'),
(7, '65 aoeu dr', '6', 'Phillidalphia', 'WA', '45321'),
(8, 'qwert lane', '', 'Memphis', 'NJ', '30421'),
(9, 'aoeu dr', '', 'Phillidalphia', 'WA', '45321');

-- --------------------------------------------------------

--
-- Table structure for table `class`
--

CREATE TABLE `class` (
  `class_id` int(9) NOT NULL,
  `class_name` varchar(120) NOT NULL,
  `class_desc` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `class`
--

INSERT INTO `class` (`class_id`, `class_name`, `class_desc`) VALUES
(1, 'poor', ''),
(2, 'homeless', ''),
(3, 'middle', ''),
(4, 'single mother', ''),
(5, 'disability', ''),
(6, 'high class', '(very rich)');

-- --------------------------------------------------------

--
-- Table structure for table `construction_status`
--

CREATE TABLE `construction_status` (
  `cstatus_id` int(9) NOT NULL,
  `cstatus` varchar(120) NOT NULL,
  `cstatus_description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `construction_status`
--

INSERT INTO `construction_status` (`cstatus_id`, `cstatus`, `cstatus_description`) VALUES
(1, 'processing', ''),
(2, 'broke ground', ''),
(3, 'under construction', ''),
(4, 'utilities ', 'structure is built, electrical, plumbing, etc is being put in.'),
(5, 'vaccant', 'house is complete, but no one has moved in.'),
(6, 'occupied', 'house is complete, and a family is living inside.');

-- --------------------------------------------------------

--
-- Table structure for table `family`
--

CREATE TABLE `family` (
  `family_id` int(9) NOT NULL,
  `class_id` int(9) DEFAULT NULL,
  `milestone_id` int(9) DEFAULT NULL,
  `equity_hrs` double NOT NULL,
  `income` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `family`
--

INSERT INTO `family` (`family_id`, `class_id`, `milestone_id`, `equity_hrs`, `income`) VALUES
(1, 4, 2, 10, 26000),
(2, 2, 3, 43, 12000);

-- --------------------------------------------------------

--
-- Table structure for table `house`
--

CREATE TABLE `house` (
  `house_id` int(9) NOT NULL,
  `address_id` int(9) NOT NULL,
  `property_id` int(9) NOT NULL,
  `family_id` int(9) DEFAULT NULL,
  `construction_cost` double NOT NULL,
  `size` int(30) NOT NULL,
  `bedrooms` int(2) NOT NULL,
  `bathrooms` double NOT NULL,
  `cstatus_id` int(9) DEFAULT NULL,
  `house_style` int(9) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `house`
--

INSERT INTO `house` (`house_id`, `address_id`, `property_id`, `family_id`, `construction_cost`, `size`, `bedrooms`, `bathrooms`, `cstatus_id`, `house_style`) VALUES
(1, 7, 1, 1, 1200000, 23000, 12, 4, 6, 1);

-- --------------------------------------------------------

--
-- Table structure for table `house_contribution`
--

CREATE TABLE `house_contribution` (
  `contribution_id` int(9) NOT NULL,
  `actor_id` int(9) NOT NULL,
  `house_id` int(9) NOT NULL,
  `involvement_desc` varchar(120) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `house_contribution`
--

INSERT INTO `house_contribution` (`contribution_id`, `actor_id`, `house_id`, `involvement_desc`) VALUES
(1, 1, 1, 'did laundry'),
(2, 2, 1, 'donated $5000'),
(3, 2, 2, 'organized volunteers together');

-- --------------------------------------------------------

--
-- Table structure for table `house_style`
--

CREATE TABLE `house_style` (
  `style_id` int(9) NOT NULL,
  `style` varchar(120) NOT NULL,
  `style_desc` text DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `house_style`
--

INSERT INTO `house_style` (`style_id`, `style`, `style_desc`) VALUES
(1, 'apartment', ''),
(2, 'duplex', ''),
(3, 'split level', ''),
(4, 'ranch', ''),
(5, 'mansion', ''),
(6, 'town house', ''),
(7, 'bungalo', '');

-- --------------------------------------------------------

--
-- Table structure for table `log`
--

CREATE TABLE `log` (
  `log_id` int(9) NOT NULL,
  `family_id` int(9) DEFAULT NULL,
  `contact_id` int(9) NOT NULL COMMENT 'actor_id',
  `house_id` int(9) DEFAULT NULL,
  `property_id` int(9) DEFAULT NULL,
  `reason` varchar(120) NOT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `notes` text DEFAULT '',
  `status` varchar(120) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `log`
--

INSERT INTO `log` (`log_id`, `family_id`, `contact_id`, `house_id`, `property_id`, `reason`, `date`, `notes`, `status`) VALUES
(1, NULL, 2, NULL, 1, 'is broken', '2017-10-16 11:42:53', 'this property is broken and previously it was not, please fix', 'processing');

-- --------------------------------------------------------

--
-- Table structure for table `milestone`
--

CREATE TABLE `milestone` (
  `milestone_id` int(9) NOT NULL,
  `milestone` varchar(120) NOT NULL,
  `milestone_desc` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `milestone`
--

INSERT INTO `milestone` (`milestone_id`, `milestone`, `milestone_desc`) VALUES
(1, 'moved in', ''),
(2, 'had a child', ''),
(3, 'payed us back', 'finally payed us back for the house we provided them! '),
(4, '10+ years', 'been living here for 10+ years! Wow!');

-- --------------------------------------------------------

--
-- Table structure for table `organization`
--

CREATE TABLE `organization` (
  `organization_id` int(9) NOT NULL,
  `name` varchar(120) NOT NULL,
  `contact_id` int(9) NOT NULL COMMENT 'person_id'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `organization`
--

INSERT INTO `organization` (`organization_id`, `name`, `contact_id`) VALUES
(3, 'FrontierAirlines', 1),
(4, 'loudbaron.co', 5);

-- --------------------------------------------------------

--
-- Table structure for table `person`
--

CREATE TABLE `person` (
  `person_id` int(9) NOT NULL,
  `family_id` int(9) DEFAULT NULL,
  `first` varchar(20) NOT NULL,
  `middle` varchar(20) DEFAULT '',
  `last` varchar(20) NOT NULL,
  `email` varchar(120) NOT NULL,
  `home_phone` varchar(20) DEFAULT '',
  `cell_phone` varchar(20) DEFAULT '',
  `work_phone` varchar(20) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `person`
--

INSERT INTO `person` (`person_id`, `family_id`, `first`, `middle`, `last`, `email`, `home_phone`, `cell_phone`, `work_phone`) VALUES
(1, NULL, 'Andrew', 'John', 'Fehr', 'ajfehr@ilstu.edu', '309-229-6771', '', ''),
(2, 1, 'Abe', '', 'Ramseyer', 'aramsey@ilstu.edu', '', '', ''),
(5, 2, 'Harry', 'and', 'Griffen', 'whatupwhatup@boo.com', '', '123-456-1223', ''),
(6, 1, 'Abe\'s', 'illegitimate', 'child', 'tuttut@gmail.com', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `property`
--

CREATE TABLE `property` (
  `property_no` int(9) NOT NULL,
  `address_id` int(9) NOT NULL,
  `zone_id` int(9) DEFAULT NULL,
  `owner_id` int(9)  DEFAULT NULL COMMENT 'actor_id ',
  `pstatus_id` int(9) DEFAULT '1',
  `appraised_value` double DEFAULT NULL,
  `appraised_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `taxes` double DEFAULT NULL,
  `notes` text DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `property`
--

INSERT INTO `property` (`property_no`, `address_id`, `zone_id`, `owner_id`, `pstatus_id`, `appraised_value`, `appraised_date`, `taxes`, `notes`) VALUES
(1, 8, 1, 2, 2, 423000, '2017-10-12 19:15:27', 80000, ''),
(2, 9, 2, 4, 1, 46000.3, '2017-10-12 19:15:27', 12000, '');

-- --------------------------------------------------------

--
-- Table structure for table `property_status`
--

CREATE TABLE `property_status` (
  `pstatus_id` int(9) NOT NULL,
  `pstatus` varchar(120) NOT NULL,
  `pstatus_desc` text DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `property_status`
--

INSERT INTO `property_status` (`pstatus_id`, `pstatus`, `pstatus_desc`) VALUES
(1, 'vacant', ''),
(2, 'filled', ''),
(3, 'processing', '');

-- --------------------------------------------------------

--
-- Table structure for table `relation_type`
--

CREATE TABLE `relation_type` (
  `relation_id` int(9) NOT NULL,
  `relation_name` varchar(120) NOT NULL,
  `relation_desc` text DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `relation_type`
--

INSERT INTO `relation_type` (`relation_id`, `relation_name`, `relation_desc`) VALUES
(1, 'tennant', ''),
(2, 'private property owner', ''),
(3, 'vendor', ''),
(4, 'orginization', ''),
(5, 'volunteer', '');

-- --------------------------------------------------------

--
-- Table structure for table `zone`
--

CREATE TABLE `zone` (
  `zone_id` int(9) NOT NULL,
  `zone_info` varchar(120) DEFAULT 'none',
  `zone_desc` text DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `zone`
--

INSERT INTO `zone` (`zone_id`, `zone_info`, `zone_desc`) VALUES
(1, 'first zone', ''),
(2, 'second zone', ''),
(3, 'danger zone', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `actor`
--
ALTER TABLE `actor`
  ADD PRIMARY KEY (`actor_id`);

--
-- Indexes for table `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`address_id`);

--
-- Indexes for table `class`
--
ALTER TABLE `class`
  ADD PRIMARY KEY (`class_id`);

--
-- Indexes for table `construction_status`
--
ALTER TABLE `construction_status`
  ADD PRIMARY KEY (`cstatus_id`);

--
-- Indexes for table `family`
--
ALTER TABLE `family`
  ADD PRIMARY KEY (`family_id`);

--
-- Indexes for table `house`
--
ALTER TABLE `house`
  ADD PRIMARY KEY (`house_id`);

--
-- Indexes for table `house_contribution`
--
ALTER TABLE `house_contribution`
  ADD PRIMARY KEY (`contribution_id`);

--
-- Indexes for table `house_style`
--
ALTER TABLE `house_style`
  ADD PRIMARY KEY (`style_id`);

--
-- Indexes for table `log`
--
ALTER TABLE `log`
  ADD PRIMARY KEY (`log_id`);

--
-- Indexes for table `milestone`
--
ALTER TABLE `milestone`
  ADD PRIMARY KEY (`milestone_id`);

--
-- Indexes for table `organization`
--
ALTER TABLE `organization`
  ADD PRIMARY KEY (`organization_id`);

--
-- Indexes for table `person`
--
ALTER TABLE `person`
  ADD PRIMARY KEY (`person_id`);

--
-- Indexes for table `property`
--
ALTER TABLE `property`
  ADD PRIMARY KEY (`property_no`),
  ADD UNIQUE KEY `address_id` (`address_id`);

--
-- Indexes for table `property_status`
--
ALTER TABLE `property_status`
  ADD PRIMARY KEY (`pstatus_id`);

--
-- Indexes for table `relation_type`
--
ALTER TABLE `relation_type`
  ADD PRIMARY KEY (`relation_id`);

--
-- Indexes for table `zone`
--
ALTER TABLE `zone`
  ADD PRIMARY KEY (`zone_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `actor`
--
ALTER TABLE `actor`
  MODIFY `actor_id` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `address`
--
ALTER TABLE `address`
  MODIFY `address_id` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `class`
--
ALTER TABLE `class`
  MODIFY `class_id` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `construction_status`
--
ALTER TABLE `construction_status`
  MODIFY `cstatus_id` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `family`
--
ALTER TABLE `family`
  MODIFY `family_id` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `house`
--
ALTER TABLE `house`
  MODIFY `house_id` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `house_contribution`
--
ALTER TABLE `house_contribution`
  MODIFY `contribution_id` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `house_style`
--
ALTER TABLE `house_style`
  MODIFY `style_id` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `log`
--
ALTER TABLE `log`
  MODIFY `log_id` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `milestone`
--
ALTER TABLE `milestone`
  MODIFY `milestone_id` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `property`
--
ALTER TABLE `property`
  MODIFY `property_no` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `property_status`
--
ALTER TABLE `property_status`
  MODIFY `pstatus_id` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `relation_type`
--
ALTER TABLE `relation_type`
  MODIFY `relation_id` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `zone`
--
ALTER TABLE `zone`
  MODIFY `zone_id` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

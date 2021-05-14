-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 14, 2021 at 04:46 PM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 8.0.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gadgetbadget`
--

-- --------------------------------------------------------

--
-- Table structure for table `buyer1`
--

CREATE TABLE `buyer1` (
  `bID` int(11) NOT NULL,
  `bName` varchar(255) NOT NULL,
  `bAddress` varchar(255) NOT NULL,
  `bEmail` varchar(255) NOT NULL,
  `bDate` varchar(255) NOT NULL,
  `pNo` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `buyer1`
--

INSERT INTO `buyer1` (`bID`, `bName`, `bAddress`, `bEmail`, `bDate`, `pNo`) VALUES
(2, 'rwer', 'wetw', 'twet', 'tw', 'twet'),
(3, 'tert', 'gdf', 'gsg', 'sdg', '20');

-- --------------------------------------------------------

--
-- Table structure for table `pay1`
--

CREATE TABLE `pay1` (
  `pyId` int(11) NOT NULL,
  `pyDes` varchar(20) NOT NULL,
  `pyDate` varchar(255) NOT NULL,
  `amount` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pay1`
--

INSERT INTO `pay1` (`pyId`, `pyDes`, `pyDate`, `amount`) VALUES
(1, 'ICT', '2020-09-01', 5000),
(2, 'Science', '2020-05-11', 7600);

-- --------------------------------------------------------

--
-- Table structure for table `product1`
--

CREATE TABLE `product1` (
  `pId` int(11) NOT NULL,
  `pName` varchar(255) NOT NULL,
  `pDate` varchar(255) NOT NULL,
  `pPrice` varchar(255) NOT NULL,
  `pDes` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product1`
--

INSERT INTO `product1` (`pId`, `pName`, `pDate`, `pPrice`, `pDes`) VALUES
(1, 'tert', '2020', '500', '1'),
(3, 'gdg', 'dg', 'dgd', 'dgd');

-- --------------------------------------------------------

--
-- Table structure for table `research`
--

CREATE TABLE `research` (
  `rId` int(11) NOT NULL,
  `rName` varchar(255) NOT NULL,
  `pName` varchar(255) NOT NULL,
  `rDate` varchar(255) NOT NULL,
  `rDes` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `research`
--

INSERT INTO `research` (`rId`, `rName`, `pName`, `rDate`, `rDes`) VALUES
(1, 'fdsf', 'sf', 'sfd', 'sf');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `buyer1`
--
ALTER TABLE `buyer1`
  ADD PRIMARY KEY (`bID`);

--
-- Indexes for table `pay1`
--
ALTER TABLE `pay1`
  ADD PRIMARY KEY (`pyId`);

--
-- Indexes for table `product1`
--
ALTER TABLE `product1`
  ADD PRIMARY KEY (`pId`);

--
-- Indexes for table `research`
--
ALTER TABLE `research`
  ADD PRIMARY KEY (`rId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `buyer1`
--
ALTER TABLE `buyer1`
  MODIFY `bID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `pay1`
--
ALTER TABLE `pay1`
  MODIFY `pyId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `product1`
--
ALTER TABLE `product1`
  MODIFY `pId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `research`
--
ALTER TABLE `research`
  MODIFY `rId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

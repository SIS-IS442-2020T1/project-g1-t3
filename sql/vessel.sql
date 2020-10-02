-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Mar 11, 2020 at 05:29 AM
-- Server version: 5.7.21
-- PHP Version: 7.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `vesselDb`
--
CREATE DATABASE IF NOT EXISTS `vesselDb` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `vesselDb`;

-- --------------------------------------------------------

--
-- Table structure for table `vesselInfo`
--

DROP TABLE IF EXISTS `vesselInfo`;
CREATE TABLE IF NOT EXISTS `vesselInfo` (
  `abbrVslM` varchar(45) NOT NULL,
  `inVoyN` varchar(20) NOT NULL,
  `fullInVoyN` varchar(12) NOT NULL,
  `outVoyN` varchar(20) NOT NULL,
  `btrDt` varchar(120) NOT NULL,
  `etdDt` varchar(120) NOT NULL,
  `unbthgDt` varchar(120) NOT NULL,
  `berthN` varchar(20) NOT NULL,
  `status` varchar(50) NOT NULL,
  `abbrTerminalM` varchar(120) NOT NULL,
  `shiftSeqN` varchar(120) NOT NULL,
  PRIMARY KEY (`abbrVsIM`, `inVoyN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vesselInfo`
--

INSERT INTO `vesselInfo` (`abbrVslM`,`inVoyN`,`fullInVoyN`,`outVoyN`,`btrDt`,`etdDt`,`unbthgDt`,`berthN`,`status`,`abbrTerminalM`,`shiftSeqN`)
('tester@sis.smu.edu.sg', 'qwerty');

COMMIT;
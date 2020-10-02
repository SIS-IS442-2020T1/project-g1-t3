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
-- Database: `favouriteDb`
--
CREATE DATABASE IF NOT EXISTS `favouriteDb` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `favouriteDb`;

-- --------------------------------------------------------

--
-- Table structure for table `favourite`
--

DROP TABLE IF EXISTS `favourite`;
CREATE TABLE IF NOT EXISTS `favourite` (
  `email` varchar(255) NOT NULL,
  `abbrVslM` varchar(45) NOT NULL,
  `inVoyN` varchar(20) NOT NULL,
  PRIMARY KEY (`email`, `abbrVslM`, `inVoyN`),
  foreign key (`email`) references userAccount.user (`email`),
  foreign key (`abbrVslM`, `inVoyN`) references vesselDb.vesselInfo (`abbrVslM`, `inVoyN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vesselInfo`
--

INSERT INTO `favourite` (`abbrVslM`,`inVoyN`,`fullInVoyN`,`outVoyN`,`btrDt`,`etdDt`,`unbthgDt`,`berthN`,`status`,`abbrTerminalM`,`shiftSeqN`)
();

COMMIT;
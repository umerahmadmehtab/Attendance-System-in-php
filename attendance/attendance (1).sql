-- phpMyAdmin SQL Dump
-- version 4.4.14
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Dec 15, 2015 at 11:54 AM
-- Server version: 5.6.26
-- PHP Version: 5.6.12
create database if not exists `attendance1`;
use `attendance1`;

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `attendance`
--

-- --------------------------------------------------------

--
-- Table structure for table `attendance`
--

CREATE TABLE IF NOT EXISTS `attendance` (
  `classid` int(50) NOT NULL,
  `studentid` int(50) NOT NULL,
  `isPresent` varchar(10) NOT NULL,
  `session` int(10) unsigned NOT NULL,
  `comments` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `attendance`
--

INSERT INTO `attendance` (`classid`, `studentid`, `isPresent`, `session`, `comments`) VALUES
(1, 1, 'present', 1, 'comment'),
(1, 1, 'present', 3, 'comment'),
(1, 1, 'present', 4, 'comment'),
(1, 1, 'present', 5, 'comment'),
(1, 1, 'absent', 7, 'comment'),
(1, 1, 'present', 8, 'comment'),
(1, 2, 'present', 1, 'comment'),
(1, 2, 'present', 3, 'comment'),
(1, 2, 'present', 4, 'comment'),
(1, 2, 'present', 5, 'comment'),
(1, 2, 'present', 7, 'comment'),
(1, 2, 'present', 8, 'comment'),
(1, 3, 'present', 7, 'comment'),
(1, 3, 'present', 8, 'comment'),
(1, 4, 'present', 7, 'comment'),
(1, 4, 'present', 8, 'comment'),
(1, 5, 'present', 7, 'comment'),
(1, 5, 'present', 8, 'comment'),
(2, 3, 'present', 1, 'comment'),
(2, 3, 'present', 3, 'comment'),
(2, 3, 'present', 4, 'comment'),
(2, 3, 'present', 5, 'comment'),
(2, 4, 'present', 1, 'comment'),
(2, 4, 'present', 3, 'comment'),
(2, 4, 'present', 4, 'comment'),
(2, 4, 'present', 5, 'comment'),
(2, 5, 'present', 1, 'comment'),
(2, 5, 'present', 3, 'comment'),
(2, 5, 'present', 4, 'comment'),
(2, 5, 'present', 5, 'comment');

-- --------------------------------------------------------

--
-- Table structure for table `class`
--

CREATE TABLE IF NOT EXISTS `class` (
  `id` int(50) NOT NULL,
  `teacherid` int(50) NOT NULL,
  `starttime` time NOT NULL,
  `endtime` time NOT NULL,
  `credit_hours` int(11) NOT NULL,
  `name` varchar(10) NOT NULL COMMENT 'class name as BESE4A'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `class`
--

INSERT INTO `class` (`id`, `teacherid`, `starttime`, `endtime`, `credit_hours`, `name`) VALUES
(1, 6, '02:30:00', '03:30:00', 4, 'BESE4A'),
(2, 7, '02:30:00', '03:30:00', 3, 'BESE4C');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(50) NOT NULL,
  `fullname` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `class` varchar(10) NOT NULL,
  `role` enum('teacher','student','admin') NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `fullname`, `email`, `class`, `role`) VALUES
(1, 'Abdul Basit', 'basit850@gmail.com', 'BESE4A', 'student'),
(2, 'abc', 'abc@gmail.com', 'BESE4A', 'student'),
(3, 'akmal', 'amkal@gmail.com', 'BESE4A', 'student'),
(4, 'Usman', 'usman@gmail.com', 'BESE4A', 'student'),
(5, 'rahat hashmi', 'rahat@gmail.com', 'BESE4A', 'student'),
(6, 'imran khan', 'khan@gmail.com', 'BESE4A', 'teacher'),
(7, 'Fahad Satti', 'fahad.satti@seecs.edu.pk', 'BESE4A', 'teacher');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `attendance`
--
ALTER TABLE `attendance`
  ADD PRIMARY KEY (`classid`,`studentid`,`session`),
  ADD KEY `fk_studentid` (`studentid`);

--
-- Indexes for table `class`
--
ALTER TABLE `class`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_teacherid` (`teacherid`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `attendance`
--
ALTER TABLE `attendance`
  ADD CONSTRAINT `fk_classid` FOREIGN KEY (`classid`) REFERENCES `class` (`id`),
  ADD CONSTRAINT `fk_studentid` FOREIGN KEY (`studentid`) REFERENCES `user` (`id`);

--
-- Constraints for table `class`
--
ALTER TABLE `class`
  ADD CONSTRAINT `fk_teacherid` FOREIGN KEY (`teacherid`) REFERENCES `user` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

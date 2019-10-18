-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 14, 2018 at 11:27 AM
-- Server version: 5.6.39-cll-lve
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ashtavin_IT`
--

-- --------------------------------------------------------

--
-- Table structure for table `assignment`
--

CREATE TABLE `assignment` (
  `assig_id` int(20) NOT NULL,
  `assig_pdf` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `id` int(20) NOT NULL,
  `Type` varchar(20) NOT NULL,
  `Pass` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`id`, `Type`, `Pass`) VALUES
(1, 'Material', 'Material@123'),
(2, 'Admin', 'Admin@123');

-- --------------------------------------------------------

--
-- Table structure for table `material`
--

CREATE TABLE `material` (
  `m_id` int(20) NOT NULL,
  `sub_code` varchar(20) NOT NULL,
  `mat_name` varchar(30) NOT NULL,
  `mat_pdf` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `material`
--

INSERT INTO `material` (`m_id`, `sub_code`, `mat_name`, `mat_pdf`) VALUES
(4, 'CS - 26', 'Introduction ASP.NET', 'ASP.Net_01_Introduction_2009-07-07.ppt'),
(5, 'CS - 26', 'ASP.NET Freamwork', 'dotnetframework.pdf');

-- --------------------------------------------------------

--
-- Table structure for table `newsit`
--

CREATE TABLE `newsit` (
  `n_id` int(20) NOT NULL,
  `n_image` varchar(30) NOT NULL,
  `n_contain` varchar(500) NOT NULL,
  `n_title` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `subject`
--

CREATE TABLE `subject` (
  `sub_id` int(20) NOT NULL,
  `sub_name` varchar(100) NOT NULL,
  `sub_image` varchar(30) NOT NULL,
  `sub_code` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `subject`
--

INSERT INTO `subject` (`sub_id`, `sub_name`, `sub_image`, `sub_code`) VALUES
(7, 'TECHNICAL COMMUNICATION SKILL', 'csimage.jpg', 'CS – 01'),
(9, 'PROBLEM SOLVING METHODOLOGIES AND PROGRAMMING IN C', 'cpro.jpg', 'CS - 02'),
(10, 'COMPUTER FUNDAMENTAL AND EMERGING TECHNOLOGY', 'funda.jpg', 'CS - 03'),
(11, 'NETWORKING & INTERNET ENVIRONMENT', 'networking.jpg', 'CS - 04'),
(12, 'DATA STRUCTURE USING C LANG.', 'ds.jpg', 'CS - 07'),
(13, 'WEB PROGRAMMING', 'php.jpeg', 'CS - 08'),
(14, 'COA', 'coa.jpg', 'CS - 09'),
(15, 'MATHS', 'math.jpg', 'CS - 10'),
(16, 'SAD', 'sad.jpg', 'CS - 13'),
(17, 'C++', 'cpp.jpg', 'CS - 14'),
(18, 'RDBMS USING ORACLE', 'oracle.jpg', 'CS - 15'),
(19, 'CMS USING WORDPRESS', 'wp.jpg', 'CS - 16'),
(20, 'JAVA', 'java.jpg', 'CS - 19'),
(21, 'C#', 'csharp.jpg', 'CS - 20'),
(22, 'NETWORK TECHNOLOGY & ADMINISTRATION', 'networking.jpg', 'CS - 21'),
(23, 'UNIX / LINUX', 'linux.png', 'CS - 22'),
(24, 'J2EE', 'j2ee.jpg', 'CS - 25'),
(25, 'ASP.NET', 'asp.jpg', 'CS - 26'),
(26, 'SEO', 'seo.jpg', 'CS - 27'),
(27, 'ANDROID', 'adroid.jpg', 'CS - 31'),
(28, 'DW WITH SQL SERVER 2012', 'warehouse.jpg', 'CS - 32'),
(29, 'PYTHON', 'python.jpg', 'CS - 33');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `assignment`
--
ALTER TABLE `assignment`
  ADD PRIMARY KEY (`assig_id`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `material`
--
ALTER TABLE `material`
  ADD PRIMARY KEY (`m_id`);

--
-- Indexes for table `newsit`
--
ALTER TABLE `newsit`
  ADD PRIMARY KEY (`n_id`);

--
-- Indexes for table `subject`
--
ALTER TABLE `subject`
  ADD PRIMARY KEY (`sub_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `assignment`
--
ALTER TABLE `assignment`
  MODIFY `assig_id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `login`
--
ALTER TABLE `login`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `material`
--
ALTER TABLE `material`
  MODIFY `m_id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `newsit`
--
ALTER TABLE `newsit`
  MODIFY `n_id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `subject`
--
ALTER TABLE `subject`
  MODIFY `sub_id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Dec 15, 2020 at 08:05 PM
-- Server version: 5.7.24
-- PHP Version: 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `infm603`
--
CREATE DATABASE IF NOT EXISTS `infm603` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `infm603`;

-- --------------------------------------------------------

--
-- Table structure for table `centers`
--

DROP TABLE IF EXISTS `centers`;
CREATE TABLE `centers` (
  `center_id` int(11) NOT NULL,
  `center_name` varchar(45) NOT NULL,
  `address` varchar(45) DEFAULT NULL,
  `phone_number` varchar(15) DEFAULT NULL,
  `state` varchar(20) NOT NULL,
  `county` varchar(20) NOT NULL,
  `zip` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `centers`
--

INSERT INTO `centers` (`center_id`, `center_name`, `address`, `phone_number`, `state`, `county`, `zip`) VALUES
(1, 'Bridgeway Community Cupboard', '9189 Red Branch Road', '', 'MD', 'Columbia', '21045'),
(2, 'Glenelg United Methodist Church', '13900 Burntwoods Road', '', 'MD', 'Glenelg', '21737'),
(3, 'Rachell L. Gray Community Foundation', '6327 Meadowridge Road', '443-796-5162', 'MD', 'Elkridge', '21075'),
(4, 'Ellicott City Head Start Center', '8510 High Ridge RD', '', 'MD', 'Ellicott City', '21043'),
(5, 'North Laurel Multi-Service Center', '9900 Washington Blvd N.', '', 'MD', 'Laurel', '20723'),
(6, 'Solomons Porch Worship Center', '10545 Guilford Road, Suite 104', '', 'MD', 'Jessup', '20794'),
(7, 'FIRN', '599 Harpers Farm Road, Suite E-200', '', 'MD', 'Columbia', '21044'),
(8, 'Gethsemane United Methodist Church', '910 Addison Road', '301-336-1219', 'MD', 'Capitol Heights', '20743'),
(9, 'SAFE Food Pantry', '5305 Village Center Drive', '443-741-1060', 'MD', 'Columbia', '21044');

-- --------------------------------------------------------

--
-- Table structure for table `inventory`
--

DROP TABLE IF EXISTS `inventory`;
CREATE TABLE `inventory` (
  `center_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `inventory`
--

INSERT INTO `inventory` (`center_id`, `item_id`, `quantity`) VALUES
(1, 1, 50),
(1, 12, 23),
(1, 13, 15),
(1, 7, 19),
(1, 6, 60),
(1, 4, 45),
(1, 3, 14),
(1, 5, 22),
(1, 10, 64),
(1, 11, 7),
(2, 10, 65),
(2, 2, 24),
(2, 1, 54),
(2, 6, 37),
(2, 3, 80),
(2, 12, 67),
(3, 15, 21),
(3, 14, 55),
(3, 1, 10),
(3, 2, 50),
(3, 3, 75),
(3, 4, 45),
(3, 9, 21),
(3, 10, 98),
(3, 18, 150),
(3, 19, 45),
(3, 20, 97),
(3, 21, 24),
(3, 22, 41),
(3, 23, 80),
(3, 24, 94),
(3, 25, 72),
(3, 27, 90),
(3, 28, 74),
(3, 29, 60),
(1, 15, 75),
(1, 18, 22),
(1, 19, 25),
(1, 20, 43),
(1, 21, 65),
(1, 22, 15),
(1, 23, 37),
(1, 28, 39);

-- --------------------------------------------------------

--
-- Table structure for table `inventory_items`
--

DROP TABLE IF EXISTS `inventory_items`;
CREATE TABLE `inventory_items` (
  `item_id` int(11) NOT NULL,
  `item_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `inventory_items`
--

INSERT INTO `inventory_items` (`item_id`, `item_name`) VALUES
(1, 'cereal'),
(2, 'soup'),
(3, 'pasta'),
(4, 'pasta sauce'),
(5, 'tuna'),
(6, 'sealed cookies/sweets'),
(7, 'juice'),
(8, 'baby food'),
(9, 'diapers'),
(10, 'wipes'),
(11, 'peanut butter'),
(12, 'canned beans'),
(13, 'canned fruit'),
(14, 'canned vegetables'),
(15, 'canned corn'),
(16, 'canned soup'),
(17, 'canned fish'),
(18, 'gloves'),
(19, 'cloth masks'),
(20, 'N95 masks'),
(21, 'rice'),
(22, 'oatmeal'),
(23, 'applesauce'),
(24, 'cooking oils'),
(25, 'crackers'),
(26, 'granola bars'),
(27, 'nuts'),
(28, 'powdered milk'),
(29, 'chili'),
(30, 'eggs'),
(31, 'milk'),
(32, 'bread'),
(33, 'chicken'),
(34, 'beef'),
(35, 'fish'),
(36, 'detergent'),
(37, 'toothpaste'),
(38, 'soap'),
(39, 'shampoo'),
(40, 'toilet paper');

-- --------------------------------------------------------

--
-- Table structure for table `patients`
--

DROP TABLE IF EXISTS `patients`;
CREATE TABLE `patients` (
  `patient_id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `address` varchar(100) DEFAULT NULL,
  `test_date` timestamp NULL DEFAULT NULL,
  `delivery_date` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `patients`
--

INSERT INTO `patients` (`patient_id`, `name`, `address`, `test_date`, `delivery_date`) VALUES
(1, 'John Doe', '123 ABC Street', '2020-12-12 05:00:00', '2020-12-14 05:00:00'),
(2, 'Donald Trump', '1600 Pennsylvania Avenue NW, Washington, DC 20500', '2020-10-02 04:00:00', '2020-10-05 04:00:00'),
(3, 'Tom Hanks', '1840 Century Park East, Suite 700, Los Angeles, CA 90067', '2020-03-11 04:00:00', '2020-03-15 04:00:00'),
(4, 'Lamar Jackson', NULL, '2020-11-26 05:00:00', '2020-12-02 05:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `patient_requests`
--

DROP TABLE IF EXISTS `patient_requests`;
CREATE TABLE `patient_requests` (
  `patient_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `patient_requests`
--

INSERT INTO `patient_requests` (`patient_id`, `item_id`) VALUES
(1, 14),
(1, 2),
(1, 33),
(1, 38),
(1, 40),
(1, 3),
(1, 30),
(1, 31),
(2, 9),
(3, 2),
(3, 11),
(3, 21),
(3, 31),
(3, 36),
(3, 10),
(3, 35),
(3, 40),
(4, 40),
(4, 14),
(4, 2),
(4, 21),
(4, 30),
(4, 32),
(4, 31),
(4, 38),
(4, 35);

-- --------------------------------------------------------

--
-- Table structure for table `patient_restrictions`
--

DROP TABLE IF EXISTS `patient_restrictions`;
CREATE TABLE `patient_restrictions` (
  `patient_id` int(11) NOT NULL,
  `restriction_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `patient_restrictions`
--

INSERT INTO `patient_restrictions` (`patient_id`, `restriction_id`) VALUES
(1, 1),
(1, 2),
(1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `restrictions`
--

DROP TABLE IF EXISTS `restrictions`;
CREATE TABLE `restrictions` (
  `restriction_id` int(11) NOT NULL,
  `restriction_name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `restrictions`
--

INSERT INTO `restrictions` (`restriction_id`, `restriction_name`) VALUES
(1, 'No Meat'),
(2, 'No Fish'),
(3, 'No Dairy'),
(4, 'No Gluten'),
(5, 'No Nuts');

-- --------------------------------------------------------

--
-- Table structure for table `volunteers`
--

DROP TABLE IF EXISTS `volunteers`;
CREATE TABLE `volunteers` (
  `volunteer_id` int(11) NOT NULL,
  `center_id` int(11) NOT NULL,
  `name` varchar(25) NOT NULL,
  `email` varchar(30) NOT NULL,
  `latest_test` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `volunteers`
--

INSERT INTO `volunteers` (`volunteer_id`, `center_id`, `name`, `email`, `latest_test`) VALUES
(1, 1, 'Will Kraft', 'wkraft@umd.edu', '2020-09-10 04:00:00'),
(2, 2, 'John Smith', 'john.smith@gmail.com', '2020-12-01 05:00:00'),
(3, 4, 'Wendy H. Blais', 'blais@gmail.com', '2020-12-02 05:00:00'),
(4, 3, 'Benjamin Parker', 'bparker@aol.com', '2020-12-04 05:00:00'),
(5, 2, 'Harry Potter', 'potterharry@hogwarts.net', '2020-11-29 05:00:00'),
(6, 1, 'Richard Smith', 'rickysmith@umd.edu', '2020-12-05 05:00:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `centers`
--
ALTER TABLE `centers`
  ADD PRIMARY KEY (`center_id`);

--
-- Indexes for table `inventory`
--
ALTER TABLE `inventory`
  ADD KEY `center_id` (`center_id`),
  ADD KEY `item_id` (`item_id`);

--
-- Indexes for table `inventory_items`
--
ALTER TABLE `inventory_items`
  ADD PRIMARY KEY (`item_id`);

--
-- Indexes for table `patients`
--
ALTER TABLE `patients`
  ADD PRIMARY KEY (`patient_id`);

--
-- Indexes for table `patient_requests`
--
ALTER TABLE `patient_requests`
  ADD KEY `patient_id_idx2` (`patient_id`),
  ADD KEY `item_id_idx2` (`item_id`);

--
-- Indexes for table `patient_restrictions`
--
ALTER TABLE `patient_restrictions`
  ADD KEY `restriction_id_idx` (`restriction_id`),
  ADD KEY `patient_id_idx` (`patient_id`);

--
-- Indexes for table `restrictions`
--
ALTER TABLE `restrictions`
  ADD PRIMARY KEY (`restriction_id`);

--
-- Indexes for table `volunteers`
--
ALTER TABLE `volunteers`
  ADD PRIMARY KEY (`volunteer_id`),
  ADD KEY `center_idx` (`center_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `volunteers`
--
ALTER TABLE `volunteers`
  MODIFY `volunteer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `inventory`
--
ALTER TABLE `inventory`
  ADD CONSTRAINT `inventory_ibfk_1` FOREIGN KEY (`center_id`) REFERENCES `centers` (`center_id`),
  ADD CONSTRAINT `inventory_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `inventory_items` (`item_id`);

--
-- Constraints for table `patient_requests`
--
ALTER TABLE `patient_requests`
  ADD CONSTRAINT `item_id_fk2` FOREIGN KEY (`item_id`) REFERENCES `inventory_items` (`item_id`),
  ADD CONSTRAINT `patient_id_fk2` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`patient_id`);

--
-- Constraints for table `patient_restrictions`
--
ALTER TABLE `patient_restrictions`
  ADD CONSTRAINT `patient_id_fk` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`patient_id`),
  ADD CONSTRAINT `restriction_id_fk` FOREIGN KEY (`restriction_id`) REFERENCES `restrictions` (`restriction_id`);

--
-- Constraints for table `volunteers`
--
ALTER TABLE `volunteers`
  ADD CONSTRAINT `center_id` FOREIGN KEY (`center_id`) REFERENCES `centers` (`center_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

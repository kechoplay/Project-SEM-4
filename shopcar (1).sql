-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Apr 06, 2017 at 03:52 PM
-- Server version: 10.1.19-MariaDB
-- PHP Version: 5.6.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shopcar`
--

-- --------------------------------------------------------

--
-- Table structure for table `bill`
--

CREATE TABLE `bill` (
  `bill_id` int(11) NOT NULL,
  `cus_id` int(11) NOT NULL,
  `total` double NOT NULL,
  `payment` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `bill`
--

INSERT INTO `bill` (`bill_id`, `cus_id`, `total`, `payment`, `address`, `date`, `status`) VALUES
(11, 3, 500, 'Live', 'da nang', '2017-03-29 15:39:42', 2),
(12, 3, 1500, 'Bank transfer', '120 Xuan Dinh', '2017-04-05 01:50:37', 1),
(13, 3, 0, 'Bank transfer', '', '2017-03-31 07:59:49', 0),
(14, 3, 250, 'Bank transfer', 'da nang', '2017-04-03 15:39:04', 0);

-- --------------------------------------------------------

--
-- Table structure for table `bill_detail`
--

CREATE TABLE `bill_detail` (
  `bill_id` int(11) NOT NULL,
  `pro_id` int(11) NOT NULL,
  `price` double NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `bill_detail`
--

INSERT INTO `bill_detail` (`bill_id`, `pro_id`, `price`, `quantity`) VALUES
(11, 4, 500, 1),
(12, 4, 500, 2),
(12, 5, 250, 2),
(14, 6, 250, 1);

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `cat_id` int(11) NOT NULL,
  `cat_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `cat_image` varchar(300) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`cat_id`, `cat_name`, `cat_image`) VALUES
(26, 'Toyota', 'logo-Toyota.png'),
(29, 'Audi', 'audi.png'),
(30, 'Ford', 'eH03LTE.jpg'),
(35, 'Mitsubishi', 'Mitsubishi_logo_standart.png');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `cus_id` int(11) NOT NULL,
  `username` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `fullname` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `mobile` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `level` tinyint(4) NOT NULL DEFAULT '2'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`cus_id`, `username`, `password`, `fullname`, `email`, `address`, `mobile`, `level`) VALUES
(2, 'admin', '21232f297a57a5a743894a0e4a801fc3', 'Kiều Sơn Tùng', 'kechoplay@gmail.com', '120 Xuân Đỉnh', '01645220249', 1),
(3, 'kechoplay', '5b7a2eb26aa71815d5593bedff2d13b5', 'Kieu son tung', 'k6cda01.kstung@aptech.vn', '111 Xuân Dinh', '01645220249', 2),
(5, 'kechoplay1', '5b7a2eb26aa71815d5593bedff2d13b5', '', '', '', '', 2),
(6, 'tungvodoi', '5b7a2eb26aa71815d5593bedff2d13b5', 'Tung Kieu', 'asdas@yahoo.com', '120 Xuan Dinh', '01645220249', 2),
(7, 'tungvodoi1', '5b7a2eb26aa71815d5593bedff2d13b5', 'Kieu son tung', 'asd@gmail.com', 'da nang', '01645220249', 2);

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `feed_id` int(11) NOT NULL,
  `cus_id` int(11) NOT NULL,
  `pro_id` int(11) NOT NULL,
  `feed_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `feed_content` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  `feed_status` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`feed_id`, `cus_id`, `pro_id`, `feed_date`, `feed_content`, `feed_status`) VALUES
(1, 5, 5, '2017-03-30 07:52:14', 'nice', 1),
(2, 3, 6, '2017-04-05 01:56:05', 'k chi dep ma con dep', 1);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `pro_id` int(11) NOT NULL,
  `pro_name` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `pro_price` double NOT NULL,
  `pro_image` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `pro_descrip` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  `pro_color` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `pro_yearsx` int(4) NOT NULL,
  `cat_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`pro_id`, `pro_name`, `pro_price`, `pro_image`, `pro_descrip`, `pro_color`, `pro_yearsx`, `cat_id`) VALUES
(4, 'audi a3 sedan', 500, 'audi-a3-sedan1.jpg', 'nice', 'trang', 2015, 29),
(5, 'audi q5', 250, 'audi-q5-1.jpg', 'nice', 'trang', 2015, 29),
(6, 'ford eco 1', 250, 'ford-eco1.jpg', 'dep chat', 'xanh', 2016, 30);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bill`
--
ALTER TABLE `bill`
  ADD PRIMARY KEY (`bill_id`),
  ADD KEY `cus_id` (`cus_id`),
  ADD KEY `cus_id_2` (`cus_id`);

--
-- Indexes for table `bill_detail`
--
ALTER TABLE `bill_detail`
  ADD PRIMARY KEY (`bill_id`,`pro_id`),
  ADD KEY `bill_id` (`bill_id`),
  ADD KEY `bill_detail_ibfk_1` (`pro_id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`cat_id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`cus_id`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`feed_id`),
  ADD KEY `cus_id` (`cus_id`),
  ADD KEY `pro_id` (`pro_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`pro_id`),
  ADD KEY `cat_id` (`cat_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bill`
--
ALTER TABLE `bill`
  MODIFY `bill_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `cat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;
--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `cus_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `feed_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `pro_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `bill`
--
ALTER TABLE `bill`
  ADD CONSTRAINT `bill_ibfk_1` FOREIGN KEY (`cus_id`) REFERENCES `customer` (`cus_id`);

--
-- Constraints for table `bill_detail`
--
ALTER TABLE `bill_detail`
  ADD CONSTRAINT `bill_detail_ibfk_1` FOREIGN KEY (`pro_id`) REFERENCES `product` (`pro_id`),
  ADD CONSTRAINT `bill_detail_ibfk_2` FOREIGN KEY (`bill_id`) REFERENCES `bill` (`bill_id`);

--
-- Constraints for table `feedback`
--
ALTER TABLE `feedback`
  ADD CONSTRAINT `feedback_ibfk_1` FOREIGN KEY (`cus_id`) REFERENCES `customer` (`cus_id`),
  ADD CONSTRAINT `feedback_ibfk_2` FOREIGN KEY (`pro_id`) REFERENCES `product` (`pro_id`);

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`cat_id`) REFERENCES `category` (`cat_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

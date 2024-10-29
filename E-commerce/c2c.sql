-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 29, 2024 at 06:12 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `c2c`
--

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `contact_id` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `contact`
--

INSERT INTO `contact` (`contact_id`, `email`, `description`) VALUES
(1, 'ark@gmail.com', 'hey i need a website for businesss');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `email` varchar(20) NOT NULL,
  `state` varchar(20) NOT NULL,
  `city` varchar(20) NOT NULL,
  `pincode` varchar(20) NOT NULL,
  `address` varchar(100) NOT NULL,
  `orderedproducts` varchar(500) NOT NULL,
  `totalprice` varchar(10) NOT NULL,
  `isDelivered` varchar(20) DEFAULT 'False',
  `timeStamp` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `name`, `email`, `state`, `city`, `pincode`, `address`, `orderedproducts`, `totalprice`, `isDelivered`, `timeStamp`) VALUES
(3, 'test', 'test@gmail.com', 'karnataka', 'bangalore', '564785', 'banagalore', '[{\"id\":\"2\",\"name\":\"Camera X\",\"quantity\":3,\"price\":\"5000\"},{\"id\":\"3\",\"name\":\"Shoes\",\"quantity\":3,\"price\":\"999\"},{\"id\":\"1\",\"name\":\"Camera\",\"quantity\":1,\"price\":\"50000\"}]', '67997', NULL, '2024-10-29');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` varchar(20) NOT NULL,
  `category` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `stock` int(11) NOT NULL,
  `image` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `name`, `price`, `category`, `description`, `stock`, `image`, `email`) VALUES
(1, 'Camera', '50000', 'DSLR', 'Best camera to capture pics', 4, 'Dslrr.jpg', 'anees@gmail.com'),
(2, 'Camera X', '5000', 'DSLR', 'Best camera', 3, 'dss.jpg', 'anees@gmail.com'),
(3, 'Shoes', '999', 'Sparx', 'best shoes in market', 7, 'sghoeee.jpg', 'anees@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `signup`
--

CREATE TABLE `signup` (
  `user_id` int(11) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `mobile_number` varchar(12) NOT NULL,
  `password` text NOT NULL,
  `profileimage` varchar(500) NOT NULL,
  `isAdmin` varchar(10) NOT NULL DEFAULT 'False'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `signup`
--

INSERT INTO `signup` (`user_id`, `first_name`, `last_name`, `email`, `mobile_number`, `password`, `profileimage`, `isAdmin`) VALUES
(5, 'anees', 'khan', 'anees@gmail.com', '7896547859', 'scrypt:32768:8:1$KPn6ZjTOesQQEs3u$99335e0a12cd32920e88523cffa6f61d4eefa4c6afd9ab57ccc7b10db03f6a6c9edf34ff94f634f4369b9ae3303ac556bb0f49eacae7a94960986d119619490b', 'anees_khan.jpg', 'True'),
(6, 'aadithya', 'rajat', 'aadi@gmail.com', '7878787878', 'scrypt:32768:8:1$EZMUUSslU4y2S2Em$94fc1682a2a44ba210558a0acecb7edf755b688fedb02a3946e83e4ad545f3e6f30a120ba955d391a62c58b84c3a1cf8bf16cdfe6d1c9118d07c56ee3a319302', 'arkkk_1.jpg', 'False'),
(7, 'test', 'tester', 'test@gmail.com', '8888888888', 'scrypt:32768:8:1$RTEyKJDNncKTf28A$1109ca6f4b23426018311edc3e34ea0fe33d2c9a65bbb98e065451aae84b206d87503f87121c26585ca85f240c51c3883750c18dfb897f95158721616c26c404', '', 'False');

-- --------------------------------------------------------

--
-- Table structure for table `test`
--

CREATE TABLE `test` (
  `id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `test`
--

INSERT INTO `test` (`id`, `name`) VALUES
(1, 'guvi'),
(2, 'python');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`contact_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `signup`
--
ALTER TABLE `signup`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `test`
--
ALTER TABLE `test`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `contact_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `signup`
--
ALTER TABLE `signup`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `test`
--
ALTER TABLE `test`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

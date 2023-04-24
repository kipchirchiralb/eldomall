-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 24, 2023 at 12:47 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `eldomall_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `companies`
--

CREATE TABLE `companies` (
  `id` varchar(5) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `companies`
--

INSERT INTO `companies` (`id`, `name`, `location`) VALUES
('ad-01', 'Anchor Deck Inc', 'Nairobi, Kenya'),
('fk89', 'French Korns Supermarket', 'Arusha, Tanzania'),
('jd-02', 'Jane Deals Limited', 'Eldoret, Kenya');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `price` int(10) DEFAULT NULL,
  `quantity` int(5) DEFAULT NULL,
  `company_id` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `name`, `description`, `price`, `quantity`, `company_id`) VALUES
(2, 'Nokia 2.4', '64 GB ROM, 4GB RAM , 6.5 inch screen', 24000, 5, 'jd-02'),
(3, 'HP Folio 1040 G3', '14 inch screen 500GB ', 240000, 3, 'fk89'),
(5, 'Dell Inspiron', '14 inch screen 500GB ', 50000, 20, 'ad-01');

-- --------------------------------------------------------

--
-- Table structure for table `purchases`
--

CREATE TABLE `purchases` (
  `transaction_id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `user_id` int(8) DEFAULT NULL,
  `amount` int(10) DEFAULT NULL,
  `mode_of_payment` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `purchases`
--

INSERT INTO `purchases` (`transaction_id`, `product_id`, `user_id`, `amount`, `mode_of_payment`) VALUES
(1, 5, 222, 565656, 'cash'),
(3, 3, 222, 565656, 'cash'),
(5, 2, 33, 565656, 'cash'),
(7, 2, 0, 565656, 'cash');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(8) NOT NULL,
  `fullname` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `date_of_reg` date DEFAULT curdate(),
  `phone` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `fullname`, `email`, `password`, `date_of_reg`, `phone`, `location`) VALUES
(0, 'albert', '', NULL, '0000-00-00', NULL, NULL),
(1, 'goku', 'mj993600@gmail.com', 'passuwad', '2023-04-19', '07999999', 'elteret'),
(33, 'kemboi', 'k@g.com', NULL, '0000-00-00', '784874387483', 'kisumu'),
(55, 'sick puppy', 'mj993600@gmail.com', 'passuwad', '2023-04-19', '432423', ''),
(111, NULL, 'aal@gmail.com', NULL, '0000-00-00', '454545', 'eldoret'),
(222, 'jorit', 'j@g.m', NULL, '0000-00-00', '777778', 'german'),
(362, 'Dwayne', 'drokud@gmail.com', 'kjuhygfd', '2023-04-19', '+2547............', 'Nairobi,Kenya'),
(555, 'kenn', 'ken@gmail.com', NULL, '0000-00-00', '828282', 'hello'),
(788, NULL, NULL, NULL, '2023-03-31', NULL, NULL),
(888, NULL, 'aal@gmail.com', NULL, '0000-00-00', '454545', 'eldoret'),
(989, 'Dwayne', 'drokud@gmail.com', 'ttt', '2023-04-19', '+2547............', 'Nairobi,Kenya'),
(999, 'jorit', 'j@g.m', NULL, '0000-00-00', '777778', 'german'),
(7829, 'Albert Kipchirchir', 'alb@gm.c', 'ssd', '2023-04-14', '738q728372', '343'),
(90000, 'main', 'alphy@gmail.co.ke', '7ujm', '2023-04-19', '09090090', 'ktl'),
(3535345, NULL, NULL, NULL, '0000-00-00', NULL, NULL),
(6767676, 'Victor Odhiambo', 'victor@gmail.com', 'victor', '2023-04-20', '070707', 'eldoret'),
(62762812, 'albert', 'albert@example.com', 'ppp', '2023-04-19', '08938393', 'kenya'),
(87872872, 'Jedial Musyimi', 'jed@gmail.com', '727whwh', '2023-04-14', '7627672627', 'Eldoret, Kenya');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `companies`
--
ALTER TABLE `companies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `company_id` (`company_id`);

--
-- Indexes for table `purchases`
--
ALTER TABLE `purchases`
  ADD PRIMARY KEY (`transaction_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `purchases`
--
ALTER TABLE `purchases`
  MODIFY `transaction_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`);

--
-- Constraints for table `purchases`
--
ALTER TABLE `purchases`
  ADD CONSTRAINT `purchases_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`),
  ADD CONSTRAINT `purchases_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

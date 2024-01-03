-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jan 03, 2024 at 11:35 PM
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
-- Database: `s22226104`
--
CREATE DATABASE IF NOT EXISTS `22226104` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `22226104`;

-- --------------------------------------------------------

--
-- Table structure for table `admin_users`
--

CREATE TABLE `admin_users` (
  `admin_id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin_users`
--

INSERT INTO `admin_users` (`admin_id`, `username`, `password`) VALUES
(1, 'admin', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `cs_attribute`
--

CREATE TABLE `cs_attribute` (
  `id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `value` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cs_attribute`
--

INSERT INTO `cs_attribute` (`id`, `name`, `description`, `value`) VALUES
(1, 'Material', '', '100% Polyester'),
(2, 'Dimensions', '', 'H: 77cm W: 179CM D93.5cm'),
(3, 'Weight', '', '26kg'),
(4, 'Colour', '', 'Black'),
(5, 'asd', 'asd', 'asfd'),
(6, '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `cs_category`
--

CREATE TABLE `cs_category` (
  `id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cs_category`
--

INSERT INTO `cs_category` (`id`, `name`, `description`) VALUES
(1, 'Sofas', 'Indulge in the perfect blend of comfort and style with our curated collection of sofas. Whether you\'re looking to upgrade your living space or add a touch of luxury to your home, our diverse range of sofas offers something for every taste and lifestyle.'),
(2, 'Tables', 'Discover the perfect balance of functionality and aesthetics with our exquisite collection of tables. From stylish coffee tables that anchor your living room to versatile dining tables that invite gatherings, our curated selection offers a variety of designs to complement every corner of your home.'),
(3, 'Beds', 'Indulge in the luxury of restful nights and stylish interiors with our thoughtfully curated collection of beds. At LIKEA, we understand that your bedroom is your sanctuary, and our beds are designed to blend comfort, craftsmanship, and aesthetics seamlessly.'),
(4, 'Wardrobes & Chests', 'Introducing our sophisticated collection of wardrobes and chests, where functionality meets fashion. At LIKEA, we understand the importance of storage solutions that not only keep your belongings in order but also enhance the aesthetics of your space. Explore our thoughtfully designed furniture pieces that redefine organization and style.');

-- --------------------------------------------------------

--
-- Table structure for table `cs_category_prd`
--

CREATE TABLE `cs_category_prd` (
  `category_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cs_category_prd`
--

INSERT INTO `cs_category_prd` (`category_id`, `product_id`) VALUES
(1, 1),
(1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `cs_product`
--

CREATE TABLE `cs_product` (
  `id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `price` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cs_product`
--

INSERT INTO `cs_product` (`id`, `name`, `description`, `price`) VALUES
(1, 'Comfy Fabric 2 Seater In Black', 'Spacious sofa. Soft sleep space. The Patsy sofa bed is the ideal solution when you have guests to stay. The sleek design, in a stylish charcoal fabric, is perfect for any modern home. Fold it out flat using the clic clac mechanism, and it transforms into a comfy single bed. With a striking stitching detail, Patsy is quite the looker.', 190),
(2, 'Comfy Fabric 2 Seater In Black', 'aksjdhfas', 100);

-- --------------------------------------------------------

--
-- Table structure for table `cs_product_media`
--

CREATE TABLE `cs_product_media` (
  `product_id` int(11) NOT NULL,
  `media_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cs_product_media`
--

INSERT INTO `cs_product_media` (`product_id`, `media_id`) VALUES
(1, 1),
(1, 2),
(1, 3),
(2, 4);

-- --------------------------------------------------------

--
-- Table structure for table `cs_prod_attribute`
--

CREATE TABLE `cs_prod_attribute` (
  `product_id` int(11) NOT NULL,
  `attribute_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cs_prod_attribute`
--

INSERT INTO `cs_prod_attribute` (`product_id`, `attribute_id`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(2, 5),
(2, 6);

-- --------------------------------------------------------

--
-- Table structure for table `media`
--

CREATE TABLE `media` (
  `id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `media`
--

INSERT INTO `media` (`id`, `name`, `path`) VALUES
(1, '2_seater_black_1', './assets/images/products/2_seater_black_1.webp'),
(2, '2_seater_black_2', './assets/images/products/2_seater_black_2.webp'),
(3, '2_seater_black_3', './assets/images/products/2_seater_black_3.webp'),
(4, 'asd', 'asd');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_users`
--
ALTER TABLE `admin_users`
  ADD PRIMARY KEY (`admin_id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `cs_attribute`
--
ALTER TABLE `cs_attribute`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cs_category`
--
ALTER TABLE `cs_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cs_category_prd`
--
ALTER TABLE `cs_category_prd`
  ADD PRIMARY KEY (`category_id`,`product_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `cs_product`
--
ALTER TABLE `cs_product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cs_product_media`
--
ALTER TABLE `cs_product_media`
  ADD PRIMARY KEY (`product_id`,`media_id`),
  ADD KEY `media_id` (`media_id`);

--
-- Indexes for table `cs_prod_attribute`
--
ALTER TABLE `cs_prod_attribute`
  ADD PRIMARY KEY (`product_id`,`attribute_id`),
  ADD KEY `attribute_id` (`attribute_id`);

--
-- Indexes for table `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_users`
--
ALTER TABLE `admin_users`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `cs_attribute`
--
ALTER TABLE `cs_attribute`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `cs_category`
--
ALTER TABLE `cs_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `cs_product`
--
ALTER TABLE `cs_product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `media`
--
ALTER TABLE `media`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cs_category_prd`
--
ALTER TABLE `cs_category_prd`
  ADD CONSTRAINT `cs_category_prd_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `cs_category` (`id`),
  ADD CONSTRAINT `cs_category_prd_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `cs_product` (`id`);

--
-- Constraints for table `cs_product_media`
--
ALTER TABLE `cs_product_media`
  ADD CONSTRAINT `cs_product_media_ibfk_1` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`),
  ADD CONSTRAINT `cs_product_media_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `cs_product` (`id`);

--
-- Constraints for table `cs_prod_attribute`
--
ALTER TABLE `cs_prod_attribute`
  ADD CONSTRAINT `cs_prod_attribute_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `cs_product` (`id`),
  ADD CONSTRAINT `cs_prod_attribute_ibfk_2` FOREIGN KEY (`attribute_id`) REFERENCES `cs_attribute` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

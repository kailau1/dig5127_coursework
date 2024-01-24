-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jan 23, 2024 at 12:53 AM
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
-- Database: `22226104`
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
(1, 'admin', '$2y$10$joCEnrkGvvKiK8qtgrjIfefnsehpHaXsTz/NfGDjH8YZT6CQGYBke');

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
(4, 'Wardrobes & Chests', 'Introducing our sophisticated collection of wardrobes and chests, where functionality meets fashion. At LIKEA, we understand the importance of storage solutions that not only keep your belongings in order but also enhance the aesthetics of your space. Explore our thoughtfully designed furniture pieces that redefine organization and style.'),
(5, 'Lamps', 'Illuminate your world with our enchanting lamp collection, where light meets artistry to create a captivating ambiance. Immerse yourself in a symphony of designs, from contemporary elegance to vintage charm, each lamp a statement piece that adds warmth and character to your space.'),
(6, 'Desks', 'Elevate your workspace with our stunning desk collection, where functionality meets design in perfect harmony. Immerse yourself in a realm of productivity and style as you explore our curated range of desks, meticulously crafted for the modern enthusiast. '),
(7, 'Chairs', 'Indulge in the ultimate blend of comfort and style with our exquisite collection of chairs. Crafted with precision and designed to elevate your space, each chair is a testament to sophistication. Dive into the luxury of relaxation as you explore a range that marries functionality with aesthetics.');

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
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(5, 6),
(5, 7),
(5, 8),
(5, 16),
(5, 17),
(6, 13),
(6, 14),
(6, 15),
(7, 9),
(7, 10),
(7, 11);

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
(2, 'Comfy Fabric 2 Seater In Grey', 'aksjdhfas', 100),
(3, 'Comfy Fabric 2 Seater In Beige', 'aksjdhfas', 100),
(4, 'Comfy Fabric 3 Seater In Pearl', 'Graceful, chic, goes-with-everything - the timeless, this is a contemporary classic sofa to love for years to come. Its seat cushions offer supportive comfort with low maintenance, making it as practical as it is stylish.', 100),
(5, 'Comfy Fabric Right hand chair In Charcoal', 'aksjdhfas', 100),
(6, 'Dorma Lamp', 'This stunning Dorma table lamp is the perfect product to add a timeless piece to any room of the house, with its modern colourway that complements an array of home decors.', 100),
(7, 'Aria Lamp', 'Add opulence and sparkle to your room with the Aria table lamp. Featuring hand finished multi-faceted crystals this lamp is sure to impress', 70),
(8, 'LED Lamp', 'The LED table lamp is a practical companion on a writing and working table. It has clearly defined shapes and a striking angular design that is easy to see.', 80),
(9, 'One Seater Chair - Black', 'A deep black one seater chair, comfortbale high quality material and wide range of colours. ', 190),
(10, 'One Seater Chair - White', 'A pale white seater chair, comfortbale high quality material and wide range of colours. ', 190),
(11, 'One Seater Chair - Orange', 'A vibrant orange seater chair, comfortbale high quality material and wide range of colours. ', 190),
(13, 'Black Desk', 'A elegant quality office desk, comfortbale high quality material and wide range of colours. ', 190),
(14, 'White Desk', 'A elegant quality office desk, comfortbale high quality material and wide range of colours. ', 190),
(15, 'Wood Desk', 'A elegant quality office desk, comfortbale high quality material and wide range of colours. ', 250),
(16, 'Fabric Table lamp', ' This lamp impresses not only with its appearance but also with its technical features. In addition to the E27 socket in the white fabric lampshade, there is another light source integrated into the table lamp. It sits vertically in the wooden frame and looks like a decorative light strip when turned on. ', 100),
(17, 'Fairford Lamp', 'A delightful bedside lamp featuring a grey washed scratch-effect ceramic base with fabric shade. Scratch effect base with fabric shade.', 50);

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
(2, 4),
(2, 5),
(2, 6),
(2, 7),
(3, 8),
(3, 9),
(3, 10),
(4, 11),
(4, 12),
(4, 13),
(5, 14),
(5, 15),
(5, 16),
(5, 17),
(5, 18),
(6, 19),
(6, 20),
(6, 21),
(7, 22),
(7, 23),
(7, 24),
(8, 25),
(8, 26),
(8, 27),
(9, 28),
(10, 29),
(11, 30),
(13, 33),
(14, 32),
(15, 31),
(16, 34),
(16, 35),
(16, 36),
(17, 37),
(17, 38),
(17, 39);

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
(4, '3_seater_lightg_1', './assets/images/products/3_seater_lightg_1.webp'),
(5, '3_seater_lightg_2', './assets/images/products/3_seater_lightg_2.webp'),
(6, '3_seater_lightg_3', './assets/images/products/3_seater_lightg_3.webp'),
(7, '3_seater_lightg_4', './assets/images/products/3_seater_lightg_4.webp'),
(8, 'lisbon_beige_1', './assets/images/products/lisbon_beige_1.webp'),
(9, 'lisbon_beige_2', './assets/images/products/lisbon_beige_2.webp'),
(10, 'lisbon_beige_3', './assets/images/products/lisbon_beige_3.webp'),
(11, 'pearl_3_seater_1', './assets/images/products/pearl_3_seater_1.webp'),
(12, 'pearl_3_seater_2', './assets/images/products/pearl_3_seater_2.webp'),
(13, 'pearl_3_seater_3', './assets/images/products/pearl_3_seater_3.webp'),
(14, 'right_hand_charcoal_1', './assets/images/products/right_hand_charcoal_1.webp'),
(15, 'right_hand_charcoal_2', './assets/images/products/right_hand_charcoal_2.webp'),
(16, 'right_hand_charcoal_3', './assets/images/products/right_hand_charcoal_3.webp'),
(17, 'right_hand_charcoal_4', './assets/images/products/right_hand_charcoal_4.webp'),
(18, 'right_hand_charcoal_5', './assets/images/products/right_hand_charcoal_5.webp'),
(19, 'aria_lamp_1', './assets/images/products/aria_lamp_1.webp'),
(20, 'aria_lamp_2', './assets/images/products/aria_lamp_2.webp'),
(21, 'aria_lamp_3', './assets/images/products/aria_lamp_3.webp'),
(22, 'dorma_lamp_1', './assets/images/products/dorma_lamp_1.webp'),
(23, 'dorma_lamp_2', './assets/images/products/dorma_lamp_2.webp'),
(24, 'dorma_lamp_3', './assets/images/products/dorma_lamp_3.webp'),
(25, 'led_lamp_1', './assets/images/products/led_lamp_1.webp'),
(26, 'led_lamp_2', './assets/images/products/led_lamp_2.webp'),
(27, 'led_lamp_3', './assets/images/products/led_lamp_3.webp'),
(28, 'black_1_seater', './assets/images/products/black_1_seater.webp'),
(29, 'white_1_seater', './assets/images/products/white_1_seater.webp'),
(30, 'orange_1_seater', './assets/images/products/orange_1_seater.webp'),
(31, '1_wood_desk', './assets/images/products/1_Desk_Wood.webp'),
(32, '1_white_desk', './assets/images/products/1_Desk_White.webp'),
(33, '1_black_desk', './assets/images/products/1_Desk_Black.webp'),
(34, 'fabric_table_lamp_1', './assets/images/products/fabric_table_lamp_1.webp'),
(35, 'fabric_table_lamp_2', './assets/images/products/fabric_table_lamp_2.webp'),
(36, 'fabric_table_lamp_3', './assets/images/products/fabric_table_lamp_3.webp'),
(37, 'fairford_lamp_1', './assets/images/products/fairford_lamp_1.webp'),
(38, 'fairford_lamp_2', './assets/images/products/fairford_lamp_2.webp'),
(39, 'fairford_lamp_3', './assets/images/products/fairford_lamp_3.webp');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `cs_product`
--
ALTER TABLE `cs_product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `media`
--
ALTER TABLE `media`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

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

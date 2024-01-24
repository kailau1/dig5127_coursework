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
CREATE DATABASE IF NOT EXISTS `22226104_22180993` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `22226104_22180993`;

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
(5, 'Material', '', '100% Polyester'),
(6, 'Dimensions', '', 'H: 77cm W: 179CM D93.5cm'),
(7, 'Weight', '', '26kg'),
(8, 'Colour', '', 'Grey'),
(9, 'Material', '', '100% Polyester'),
(10, 'Dimensions', '', 'H: 77cm W: 179CM D93.5cm'),
(11, 'Weight', '', '26kg'),
(12, 'Colour', '', 'Beige'),
(13, 'Material', '', '100% Polyester'),
(14, 'Dimensions', '', 'H: 90cm W: 202cm D: 88cm'),
(15, 'Weight', '', '29kg'),
(16, 'Colour', '', 'Pearl'),
(17, 'Material', '', '100% Polyester'),
(18, 'Dimensions', '', 'H: 65cm W: 240cm D: 92cm'),
(19, 'Weight', '', '34kg'),
(20, 'Colour', '', 'Charcoal'),
(21, 'Material', '', 'Metal base, Linen Shade'),
(22, 'Dimentions', '', 'H: 52.5cm W: 20cm D: 25cm'),
(23, 'Weight', '', '2.5kg'),
(24, 'Colour', '', 'Black'),
(25, 'Material', '', '85% Glass, 15% Metal'),
(26, 'Dimensions', '', 'H: 30cm W: 30cm D: 12cm'),
(27, 'Weight', '', '1.5kg'),
(28, 'Colour', '', 'silver'),
(29, 'Material', '', 'Metal'),
(30, 'Dimensions', '', 'H: 47cm W: 12cm D: 45.5cm'),
(31, 'Weight', '', '2kg'),
(32, 'Colour', '', 'matt black'),
(33, 'Material', 'one seater', ''),
(34, 'Dimensions', '', ''),
(35, 'Weight', '', ''),
(36, 'Colour', '', 'black'),
(37, 'Material', 'one seater', ''),
(38, 'Dimensions', '', ''),
(39, 'Weight', '', ''),
(40, 'Colour', '', 'white'),
(41, 'Material', 'one seater', ''),
(42, 'Dimensions', '', ''),
(43, 'Weight', '', ''),
(44, 'Colour', '', 'orange'),
(45, 'Material', 'desk', ''),
(46, 'Dimensions', '', ''),
(47, 'Weight', '', ''),
(48, 'Colour', '', 'black'),
(49, 'Material', 'desk', ''),
(50, 'Dimensions', '', ''),
(51, 'Weight', '', ''),
(52, 'Colour', '', 'White'),
(53, 'Material', '', 'Wood'),
(54, 'Dimensions', '', ''),
(55, 'Weight', '', ''),
(56, 'Colour', '', 'brown'),
(57, 'Material', '', 'Wood, Metal, Fabric'),
(58, 'Dimensions', '', 'H: 53cm W: 32cm D: 20cm'),
(59, 'Weight', '', '2.51kg'),
(60, 'Colour', '', 'Light Oak'),
(61, 'Material', '', 'Ceramic'),
(62, 'Dimensions', '', 'H: 48.5cm Diameter: 30cm'),
(63, 'Weight', '', '4.5kg'),
(64, 'Colour', '', 'Black');


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
(2, 'Comfy Fabric 2 Seater In Grey', 'Introducing our Grey Elegance Sofa, a versatile and stylish centerpiece for your living space. Upholstered in a sophisticated grey fabric, this sofa effortlessly combines comfort with modern aesthetics. The plush cushions and clean lines create a cozy yet contemporary look, making it perfect for both casual relaxation and formal entertaining. The neutral grey hue complements a variety of decor styles, providing a timeless and adaptable addition to your home. Elevate your living room with the Grey Elegance Sofa, where comfort meets elegance in every detail.', 100),
(3, 'Comfy Fabric 2 Seater In Beige', 'Create a cozy and inviting atmosphere with our Beige Haven Sectional Sofa. Upholstered in a soft and durable beige fabric, this sofa brings warmth and comfort to your living space. The sectional design allows for versatile seating arrangements, making it ideal for both intimate gatherings and family movie nights. The neutral beige color complements a variety of decor styles, providing a canvas for you to personalize with accent pillows and throws. The Beige Haven Sectional Sofa is a perfect choice for those seeking a harmonious blend of style and comfort', 100),
(4, 'Comfy Fabric 3 Seater In Pearl', 'Elevate your home with the timeless charm of the Pearl Essence Loveseat. This sofa boasts a graceful pearl-colored fabric upholstery that exudes understated luxury. The subtle sheen of the fabric enhances the sophistication of the design, making it a perfect addition to both classic and modern interiors. The Pearl Essence Loveseat\'s inviting cushions and sturdy construction ensure a cozy and durable seating experience. Make a style statement in your living room with this exquisite piece that effortlessly blends comfort and elegance.', 100),
(5, 'Comfy Fabric Right hand chair In Charcoal', 'Unwind in style with our Charcoal Right-Handed Lounge Chair, a modern and ergonomic addition to your living room or study. The charcoal-colored upholstery exudes sophistication, while the right-handed design provides optimal support for relaxation. With its contemporary silhouette and plush cushioning, this lounge chair offers both comfort and aesthetic appeal. Whether you\'re curling up with a good book or simply enjoying a moment of tranquility, the Charcoal Right-Handed Lounge Chair is a versatile and chic seating option for your home.', 100),
(6, 'Dorma Lamp', 'Transform your living space with the timeless elegance of the DORMA Vintage Floor Lamp. This exquisite piece combines classic design elements with modern functionality, creating a statement piece that complements any decor style. The DORMA lamp features a sturdy metal base and a gracefully arched neck, supporting a vintage-inspired glass shade that diffuses warm light throughout the room. Whether placed in a corner to create a cozy reading nook or as a focal point in your living room, the DORMA Vintage Floor Lamp adds a touch of sophistication and nostalgia to your home.', 190),
(7, 'Aria Lamp', 'Experience the future of lighting with our ARIA Smart Pendant Lamp, a cutting-edge addition to your smart home ecosystem. This sleek and contemporary pendant lamp not only illuminates your space with adjustable brightness and color temperature but also integrates seamlessly with your smart home devices. Control the ARIA lamp with your voice using compatible voice assistants or customize your lighting preferences through a user-friendly app on your smartphone. The minimalist design, combined with the smart technology, makes the ARIA Smart Pendant Lamp a must-have for those who appreciate both style and innovation in their living spaces.', 190),
(8, 'LED Lamp', 'Introducing our LED Illuminate Pro Table Lamp, a sleek and modern lighting solution designed to elevate your workspace or living area. This energy-efficient lamp features advanced LED technology, providing a crisp and bright illumination that reduces eye strain during extended periods of use. The adjustable neck and three brightness levels allow you to customize the lighting to suit your needs, whether you\'re working on a project, reading a book, or simply creating a cozy ambiance. The LED Illuminate Pro Table Lamp combines style with functionality, making it a perfect addition to any contemporary setting.', 190),
(9, 'One Seater Chair - Black', 'A deep black one seater chair, comfortbale high quality material and wide range of colours. ', 1200),
(10, 'One Seater Chair - White', 'A pale white seater chair, comfortbale high quality material and wide range of colours. ', 1250),
(11, 'One Seater Chair - Orange', 'A vibrant orange seater chair, comfortbale high quality material and wide range of colours. ', 999),
(13, 'Black Desk', 'A elegant quality office desk, comfortbale high quality material and wide range of colours. ', 190),
(14, 'White Desk', 'A elegant quality office desk, comfortbale high quality material and wide range of colours. ', 190),
(15, 'Wood Desk', 'A elegant quality office desk, comfortbale high quality material and wide range of colours. ', 250);

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
(7, 19),
(7, 20),
(7, 21),
(6, 22),
(6, 23),
(6, 24),
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
(2, 6),
(2, 7),
(2, 8),
(3, 9),
(3, 10),
(3, 11),
(3, 12),
(4, 13),
(4, 14),
(4, 15),
(4, 16),
(5, 17),
(5, 18),
(5, 19),
(5, 20),
(6, 21),
(6, 22),
(6, 23),
(6, 24),
(7, 25),
(7, 26),
(7, 27),
(7, 28),
(8, 29),
(8, 30),
(8, 31),
(8, 32),
(9, 33),
(9, 34),
(9, 35),
(9, 36),
(10, 37),
(10, 38),
(10, 39),
(10, 40),
(11, 41),
(11, 42),
(11, 43),
(11, 44),
(13, 45),
(13, 46),
(13, 47),
(13, 48),
(14, 49),
(14, 50),
(14, 51),
(14, 52),
(15, 53),
(15, 54),
(15, 55),
(15, 56),
(16, 57),
(16, 58),
(16, 59),
(16, 60),
(17, 61),
(17, 62),
(17, 63),
(17, 64);


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
ALTER TABLE cs_category_prd
ADD CONSTRAINT cs_category_prd_ibfk_1 FOREIGN KEY (category_id)
REFERENCES cs_category (id)
ON DELETE CASCADE,
ADD CONSTRAINT cs_category_prd_ibfk_2 FOREIGN KEY (product_id)
REFERENCES cs_product (id)
ON DELETE CASCADE;
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

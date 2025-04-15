-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 15, 2025 at 10:40 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecommerce`
--
CREATE DATABASE IF NOT EXISTS `ecommerce` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `ecommerce`;

-- --------------------------------------------------------

--
-- Table structure for table `addresses`
--

CREATE TABLE `addresses` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `address` text NOT NULL,
  `city` text DEFAULT NULL,
  `region` text DEFAULT NULL,
  `postal_code` text DEFAULT NULL,
  `country` text DEFAULT 'Uganda',
  `is_default` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `addresses`
--

INSERT INTO `addresses` (`id`, `user_id`, `address`, `city`, `region`, `postal_code`, `country`, `is_default`) VALUES
(1, 1, 'abby apartment', 'soroti', 'temele', '31443', 'Uganda', 1),
(2, 8, 'wall street kireka', 'kampala metropolitan', 'seguku', '8080', 'Uganda', 1);

-- --------------------------------------------------------

--
-- Table structure for table `admindetails`
--

CREATE TABLE `admindetails` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `phone` int(10) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admindetails`
--

INSERT INTO `admindetails` (`id`, `username`, `phone`, `email`, `password`) VALUES
(1, 'dac', 773389498, 'shanonsimon000@yahoo.com', '$2y$10$hUMKnPj5zFiumHw61hmb3uFgzydzxKPFBQkWtSNl0bdSDPcgLc0dK');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL,
  `slug` text NOT NULL,
  `icon` text DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `icon`, `created_at`) VALUES
(1, 'Electronics', '', NULL, '2025-03-26 12:13:09'),
(2, 'Fashion', '', NULL, '2025-03-27 10:28:17'),
(3, 'Home Products', '', NULL, '2025-04-01 12:29:48'),
(4, 'Computing', '', NULL, '2025-04-01 12:30:13');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `address_id` int(11) DEFAULT NULL,
  `total_amount` double NOT NULL,
  `payment_method` text DEFAULT NULL,
  `payment_status` text DEFAULT 'pending',
  `order_status` text DEFAULT 'processing',
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `address_id`, `total_amount`, `payment_method`, `payment_status`, `order_status`, `created_at`) VALUES
(1, 1, 1, 398, 'cash_on_delivery', 'pending', 'cancelled', '2025-04-01 10:53:25'),
(2, 1, 1, 60, 'cash_on_delivery', 'refunded', 'cancelled', '2025-04-01 13:03:21'),
(3, 1, 1, 19, 'cash_on_delivery', 'paid', 'delivered', '2025-04-01 13:07:31'),
(4, 1, 1, 29, 'mobile_money', 'paid', 'delivered', '2025-04-01 13:10:27'),
(6, 1, 1, 60, 'mobile_money', 'pending', 'shipped', '2025-04-01 13:52:49'),
(7, 1, 1, 100, 'cash_on_delivery', 'pending', 'processing', '2025-04-02 11:36:03'),
(8, 1, 1, 19, 'cash_on_delivery', 'pending', 'processing', '2025-04-02 11:37:27'),
(9, 1, 1, 60, 'mobile_money', 'pending', 'processing', '2025-04-02 12:46:52');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `price` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `quantity`, `price`) VALUES
(1, 1, 1, 2, 199),
(2, 2, 2, 1, 50),
(3, 3, 3, 1, 9),
(4, 4, 4, 1, 19),
(6, 6, 2, 1, 50),
(7, 7, 3, 10, 9),
(8, 8, 3, 1, 9),
(9, 9, 2, 1, 50);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `name` text NOT NULL,
  `slug` text NOT NULL,
  `description` text DEFAULT NULL,
  `price` double NOT NULL,
  `old_price` double DEFAULT NULL,
  `image_url` text DEFAULT NULL,
  `rating` double DEFAULT 0,
  `stock` int(11) DEFAULT 0,
  `featured` int(11) DEFAULT 0,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category_id`, `name`, `slug`, `description`, `price`, `old_price`, `image_url`, `rating`, `stock`, `featured`, `created_at`) VALUES
(1, 1, 'phones', 'phones', 'super quality phone, water proof on checking', 199, 200, 'https://images.unsplash.com/photo-1592136957897-b2b6ca21e10d', 0, 18, 1, '2025-03-27 10:07:31'),
(2, 1, 'HeadSets', 'headsets', 'for quality music and clear audio', 50, 75, 'https://images.unsplash.com/photo-1505740420928-5e560c06d30e', 0, 17, 0, '2025-04-01 12:38:06'),
(3, 2, 'Timderland', 'timderland', 'leather shoe', 9, 20, 'https://images.unsplash.com/photo-1626947346165-4c2288dadc2a', 0, 88, 0, '2025-04-01 12:39:48'),
(4, 3, 'ALL in One kitchen combo', 'all-in-one-kitchen-combo', 'get your kitchen set to a modern environment with quality products', 19, 20, 'https://images.unsplash.com/photo-1597817109745-c418f4875230', 0, 4, 0, '2025-04-01 12:42:55');

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `rating` int(11) NOT NULL,
  `comment` text DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`id`, `product_id`, `user_id`, `rating`, `comment`, `created_at`) VALUES
(1, 1, 1, 3, 'just too late, poor deriverrly', '2025-04-01 11:36:45'),
(2, 1, 6, 5, 'i enjoyed it', '2025-04-01 11:42:53'),
(3, 3, 1, 3, 'poor delivery', '2025-04-02 11:34:06'),
(4, 2, 8, 1, 'the quality of the sound is much stereo and less base, no base at all. Too overrated for the price.', '2025-04-02 12:33:53'),
(5, 2, 1, 3, 'average quality', '2025-04-02 12:45:24');

-- --------------------------------------------------------

--
-- Table structure for table `userdetails`
--

CREATE TABLE `userdetails` (
  `id` int(12) NOT NULL,
  `username` varchar(255) NOT NULL,
  `phone` int(10) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `userdetails`
--

INSERT INTO `userdetails` (`id`, `username`, `phone`, `email`, `password`) VALUES
(4, 'shanon082', 771950092, 'shanonsimon082@gmail.com', '$2y$10$B6SjuIkfOaLmXmOQ42jFG.yYAaS4TI.ZaD3YXIwOcYsGuGWmO49fe'),
(5, 'simon', 772335579, 'kaswadd@gmail.com', '$2y$10$/rPwrLd3BE5v5G.l4F.IR.mbApJgGgfA7ZRE.SVxJ7w5N9LjGkuh6'),
(6, 'kigozi', 772335578, 'kaswadaniel100@gmail.com', '$2y$10$G54WizkWDowASDYjP50r4uGyp309qtVtuN1aavaJuFxvkvLrTKlwK');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` text NOT NULL,
  `email` text NOT NULL,
  `password` text NOT NULL,
  `first_name` text DEFAULT NULL,
  `last_name` text DEFAULT NULL,
  `phone` text DEFAULT NULL,
  `profile_image` longblob NOT NULL,
  `is_admin` int(11) DEFAULT 0,
  `newsletter` int(11) DEFAULT 0,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `first_name`, `last_name`, `phone`, `profile_image`, `is_admin`, `newsletter`, `created_at`) VALUES
(1, 'shan', '2101600074@sun.ac.ug', '$2y$10$r.ZskVDAFPp7ekFT668tZuiqaZm1OmRv9PT.mpTgnJ6.zUxXykgoq', 'dacx', 'cymo', '0771950092', 0x2e2f75706c6f6164732f70726f66696c655f696d616765732f6c6f676f2e6a7067, 0, 0, '2025-03-20 16:26:08'),
(5, 'froggy james', 'kalikatimothy@gmail.com', '$2y$10$cwJUofKlv2UbyEIOlLPYH.VXU6/s5cvCCxTTXKtsUgGqnd4n4p8xK', 'froggy', 'james', '0773389498', '', 1, 0, '2025-03-25 20:58:17'),
(6, 'admin', 'admin@tukole.com', '$2y$10$9aMiNSCRomJDK4OJLc4w9uuPQ0yT.VGH5K8RX2XlTc98n7kwaFoGi', 'shanon', 'vibez', '0771950092', 0x2e2f75706c6f6164732f70726f66696c655f696d616765732f32303235303131315f3231353331322e6a7067, 1, 0, '2025-03-26 12:10:08'),
(8, 'simonwall', 'cashwall@sun.ac.ug', '$2y$10$GeLyZhCpz.i4OxBoGxc2hOYdj1JYtQndBMEBsluiHYiWBQgHjwPHi', 'simon', 'hall', '0773389498', 0x2e2f75706c6f6164732f70726f66696c655f696d616765732f494d472d32303235303231302d5741303030302e6a7067, 0, 0, '2025-04-02 12:26:33');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `addresses`
--
ALTER TABLE `addresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `admindetails`
--
ALTER TABLE `admindetails`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `address_id` (`address_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `userdetails`
--
ALTER TABLE `userdetails`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `password` (`password`),
  ADD UNIQUE KEY `unique` (`phone`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`) USING HASH,
  ADD UNIQUE KEY `email` (`email`) USING HASH;

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `addresses`
--
ALTER TABLE `addresses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `admindetails`
--
ALTER TABLE `admindetails`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `userdetails`
--
ALTER TABLE `userdetails`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `addresses`
--
ALTER TABLE `addresses`
  ADD CONSTRAINT `addresses_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`address_id`) REFERENCES `addresses` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `reviews_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;
--
-- Database: `exam_one`
--
CREATE DATABASE IF NOT EXISTS `exam_one` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `exam_one`;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `reset_token` varchar(255) DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  `profile_image` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `full_name`, `email`, `username`, `password_hash`, `created_at`, `updated_at`, `reset_token`, `expires_at`, `profile_image`) VALUES
(1, 'juma', 'juma@gmail.com', 'juma', '$2y$10$dA4eAUSZZxD08bHvQtSM6uhtFdGjBARoqZQW/6KS96i4LfFykVH4y', '2025-04-01 09:26:24', '2025-04-01 09:26:24', NULL, NULL, NULL),
(2, 'keneth', 'keneth@gmail.com', 'keneth', '$2y$10$J6edGBJTDKID7TPyPfU6n.Bx0WXFRWV0vLNiEnuf.lxWDIVWnmfeO', '2025-04-14 16:56:41', '2025-04-14 16:56:41', NULL, NULL, NULL),
(3, 'hellen', 'hellen@gmail.com', 'hellen', '$2y$10$37HsCvtJOLmWvv4.H3jgiewWZEEM.i0AbbLwrwB4Qdj0H7DkWSOHm', '2025-04-14 16:57:53', '2025-04-14 16:57:53', NULL, NULL, NULL),
(4, 'sarah', 'sarah@gmail.com', 'sarah', '$2y$10$wogmKWV7KA0w4AQgatsHdO.5SXSwVTXo2/7yNJLBeg4tqZKaWbYAu', '2025-04-14 16:59:25', '2025-04-14 16:59:25', NULL, NULL, NULL),
(5, 'Muhammed', '2101600071@sun.ac.ug', 'Muhammed', '$2y$10$Q.cCKlwfnz7TJ3a3sAK8yeFDAzeWx2pSQOuefjSZAXtS1aEtPQity', '2025-04-14 19:20:23', '2025-04-14 19:28:21', NULL, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- Database: `phpmyadmin`
--
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `phpmyadmin`;

-- --------------------------------------------------------

--
-- Table structure for table `pma__bookmark`
--

CREATE TABLE `pma__bookmark` (
  `id` int(10) UNSIGNED NOT NULL,
  `dbase` varchar(255) NOT NULL DEFAULT '',
  `user` varchar(255) NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `query` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- Table structure for table `pma__central_columns`
--

CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) NOT NULL,
  `col_name` varchar(64) NOT NULL,
  `col_type` varchar(64) NOT NULL,
  `col_length` text DEFAULT NULL,
  `col_collation` varchar(64) NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) DEFAULT '',
  `col_default` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Central list of columns';

-- --------------------------------------------------------

--
-- Table structure for table `pma__column_info`
--

CREATE TABLE `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL,
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `column_name` varchar(64) NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `transformation` varchar(255) NOT NULL DEFAULT '',
  `transformation_options` varchar(255) NOT NULL DEFAULT '',
  `input_transformation` varchar(255) NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__designer_settings`
--

CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) NOT NULL,
  `settings_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Settings related to Designer';

-- --------------------------------------------------------

--
-- Table structure for table `pma__export_templates`
--

CREATE TABLE `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL,
  `export_type` varchar(10) NOT NULL,
  `template_name` varchar(64) NOT NULL,
  `template_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved export templates';

-- --------------------------------------------------------

--
-- Table structure for table `pma__favorite`
--

CREATE TABLE `pma__favorite` (
  `username` varchar(64) NOT NULL,
  `tables` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- Table structure for table `pma__history`
--

CREATE TABLE `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL DEFAULT '',
  `db` varchar(64) NOT NULL DEFAULT '',
  `table` varchar(64) NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp(),
  `sqlquery` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__navigationhiding`
--

CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) NOT NULL,
  `item_name` varchar(64) NOT NULL,
  `item_type` varchar(64) NOT NULL,
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

-- --------------------------------------------------------

--
-- Table structure for table `pma__pdf_pages`
--

CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__recent`
--

CREATE TABLE `pma__recent` (
  `username` varchar(64) NOT NULL,
  `tables` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

-- --------------------------------------------------------

--
-- Table structure for table `pma__relation`
--

CREATE TABLE `pma__relation` (
  `master_db` varchar(64) NOT NULL DEFAULT '',
  `master_table` varchar(64) NOT NULL DEFAULT '',
  `master_field` varchar(64) NOT NULL DEFAULT '',
  `foreign_db` varchar(64) NOT NULL DEFAULT '',
  `foreign_table` varchar(64) NOT NULL DEFAULT '',
  `foreign_field` varchar(64) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Table structure for table `pma__savedsearches`
--

CREATE TABLE `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL DEFAULT '',
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `search_name` varchar(64) NOT NULL DEFAULT '',
  `search_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_coords`
--

CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT 0,
  `x` float UNSIGNED NOT NULL DEFAULT 0,
  `y` float UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_info`
--

CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `display_field` varchar(64) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_uiprefs`
--

CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) NOT NULL,
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL,
  `prefs` text NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

-- --------------------------------------------------------

--
-- Table structure for table `pma__tracking`
--

CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text NOT NULL,
  `schema_sql` text DEFAULT NULL,
  `data_sql` longtext DEFAULT NULL,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__userconfig`
--

CREATE TABLE `pma__userconfig` (
  `username` varchar(64) NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `config_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Dumping data for table `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('root', '2025-03-22 07:49:39', '{\"Console\\/Mode\":\"collapse\"}');

-- --------------------------------------------------------

--
-- Table structure for table `pma__usergroups`
--

CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) NOT NULL,
  `tab` varchar(64) NOT NULL,
  `allowed` enum('Y','N') NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Table structure for table `pma__users`
--

CREATE TABLE `pma__users` (
  `username` varchar(64) NOT NULL,
  `usergroup` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';

--
-- Indexes for dumped tables
--

--
-- Indexes for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pma__central_columns`
--
ALTER TABLE `pma__central_columns`
  ADD PRIMARY KEY (`db_name`,`col_name`);

--
-- Indexes for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- Indexes for table `pma__designer_settings`
--
ALTER TABLE `pma__designer_settings`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_user_type_template` (`username`,`export_type`,`template_name`);

--
-- Indexes for table `pma__favorite`
--
ALTER TABLE `pma__favorite`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__history`
--
ALTER TABLE `pma__history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- Indexes for table `pma__navigationhiding`
--
ALTER TABLE `pma__navigationhiding`
  ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- Indexes for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  ADD PRIMARY KEY (`page_nr`),
  ADD KEY `db_name` (`db_name`);

--
-- Indexes for table `pma__recent`
--
ALTER TABLE `pma__recent`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__relation`
--
ALTER TABLE `pma__relation`
  ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- Indexes for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- Indexes for table `pma__table_coords`
--
ALTER TABLE `pma__table_coords`
  ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- Indexes for table `pma__table_info`
--
ALTER TABLE `pma__table_info`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Indexes for table `pma__table_uiprefs`
--
ALTER TABLE `pma__table_uiprefs`
  ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- Indexes for table `pma__tracking`
--
ALTER TABLE `pma__tracking`
  ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- Indexes for table `pma__userconfig`
--
ALTER TABLE `pma__userconfig`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__usergroups`
--
ALTER TABLE `pma__usergroups`
  ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- Indexes for table `pma__users`
--
ALTER TABLE `pma__users`
  ADD PRIMARY KEY (`username`,`usergroup`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__history`
--
ALTER TABLE `pma__history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  MODIFY `page_nr` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Database: `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `test`;
--
-- Database: `user_accounts`
--
CREATE DATABASE IF NOT EXISTS `user_accounts` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `user_accounts`;

-- --------------------------------------------------------

--
-- Table structure for table `inverter_power`
--

CREATE TABLE `inverter_power` (
  `id` int(11) NOT NULL,
  `inverter_name` varchar(10) NOT NULL CHECK (`inverter_name` in ('INV1','INV2','INV3','INV4','INV5','INV6','INV7','INV8','INV9','INV10','INV11')),
  `power_output` decimal(10,2) NOT NULL COMMENT 'Power output in kW',
  `timestamp` datetime DEFAULT current_timestamp(),
  `status` enum('active','idle','fault') DEFAULT 'active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `inverter_power`
--

INSERT INTO `inverter_power` (`id`, `inverter_name`, `power_output`, `timestamp`, `status`) VALUES
(1, 'INV1', 4.75, '2025-03-31 19:30:13', 'active'),
(2, 'INV2', 5.20, '2025-03-31 19:35:13', 'active'),
(3, 'INV3', 3.90, '2025-03-31 19:40:13', 'active'),
(4, 'INV4', 4.25, '2025-03-31 19:45:13', 'active'),
(5, 'INV5', 5.50, '2025-03-31 19:50:13', 'active'),
(6, 'INV6', 4.80, '2025-03-31 19:55:13', 'active'),
(7, 'INV7', 4.95, '2025-03-31 20:00:13', 'active'),
(8, 'INV8', 5.10, '2025-03-31 20:05:13', 'active'),
(9, 'INV9', 4.60, '2025-03-31 20:10:13', 'active'),
(10, 'INV10', 5.30, '2025-03-31 20:15:13', 'active'),
(11, 'INV11', 4.40, '2025-03-31 20:20:13', 'active');

-- --------------------------------------------------------

--
-- Table structure for table `outputs`
--

CREATE TABLE `outputs` (
  `E_energy` float DEFAULT NULL,
  `Inv_Vout` float DEFAULT NULL,
  `Trans_Vout` float DEFAULT NULL,
  `30_days_Vout` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `outputs`
--

INSERT INTO `outputs` (`E_energy`, `Inv_Vout`, `Trans_Vout`, `30_days_Vout`) VALUES
(77.52, 772.18, 31.12, 30.91),
(76.13, 781.44, 31.94, 30.03),
(78.89, 796.33, 32.84, 31.95),
(75.67, 768.22, 30.11, 29.02),
(79.46, 752.77, 30.98, 32.1),
(76.95, 763.48, 31.3, 31.01),
(77.66, 794.14, 30.45, 30.5),
(78.21, 759.61, 32.65, 32.93),
(79.03, 771.29, 31.71, 29.44),
(75.89, 785.22, 32.11, 30.78),
(77.08, 799.75, 32.4, 31.32),
(76.47, 780.34, 30.94, 30.69),
(78.73, 754.1, 31.67, 28.77),
(75.98, 776.83, 30.7, 29.89),
(76.36, 790.9, 32.38, 30.44),
(79.28, 765.55, 31.1, 32.8),
(77.41, 796.22, 30.62, 31.9),
(78.6, 770.04, 32.04, 30.96),
(77.89, 786.11, 32.93, 28.68),
(75.45, 758.29, 30.18, 29.25),
(76.82, 793.73, 30.8, 32.43),
(78.17, 762.18, 32.12, 30.72),
(75.73, 767.4, 30.54, 30.91),
(76.67, 787.12, 31.89, 29.7),
(78.08, 782.55, 32.75, 32.04),
(77.15, 777.77, 31.2, 31.33),
(76.01, 750.91, 30.31, 30.11),
(79, 792.66, 32.51, 32.29),
(78.42, 779.13, 31.33, 28.96),
(75.61, 773.02, 30.92, 29.56),
(77.74, 760.88, 30.25, 31.2);

-- --------------------------------------------------------

--
-- Table structure for table `string_currents`
--

CREATE TABLE `string_currents` (
  `string_name` varchar(10) NOT NULL,
  `INV1` decimal(5,2) NOT NULL COMMENT 'Current in Amperes (should be 5-12A)',
  `INV2` decimal(5,2) NOT NULL,
  `INV3` decimal(5,2) NOT NULL,
  `INV4` decimal(5,2) NOT NULL,
  `INV5` decimal(5,2) NOT NULL,
  `INV6` decimal(5,2) NOT NULL,
  `INV7` decimal(5,2) NOT NULL,
  `INV8` decimal(5,2) NOT NULL,
  `INV9` decimal(5,2) NOT NULL,
  `INV10` decimal(5,2) NOT NULL,
  `INV11` decimal(5,2) NOT NULL,
  `timestamp` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `string_currents`
--

INSERT INTO `string_currents` (`string_name`, `INV1`, `INV2`, `INV3`, `INV4`, `INV5`, `INV6`, `INV7`, `INV8`, `INV9`, `INV10`, `INV11`, `timestamp`) VALUES
('Str1', 7.20, 7.50, 7.10, 7.40, 7.30, 7.60, 7.00, 7.20, 7.50, 7.10, 7.40, '2025-03-31 21:27:27'),
('Str10', 7.10, 7.30, 7.00, 7.20, 7.10, 7.40, 6.90, 7.10, 7.30, 7.00, 7.20, '2025-03-31 21:27:27'),
('Str11', 8.20, 8.40, 8.10, 8.30, 8.20, 8.50, 8.00, 8.20, 8.40, 8.10, 8.30, '2025-03-31 21:27:27'),
('Str12', 7.40, 7.60, 7.30, 7.50, 7.40, 7.70, 7.20, 7.40, 7.60, 7.30, 7.50, '2025-03-31 21:27:27'),
('Str13', 6.70, 6.90, 6.60, 6.80, 6.70, 7.00, 6.50, 6.70, 6.90, 6.60, 6.80, '2025-03-31 21:27:27'),
('Str14', 8.40, 8.60, 8.30, 8.50, 8.40, 8.70, 8.20, 8.40, 8.60, 8.30, 8.50, '2025-03-31 21:27:27'),
('Str15', 7.00, 7.20, 6.90, 7.10, 7.00, 7.30, 6.80, 7.00, 7.20, 6.90, 7.10, '2025-03-31 21:27:27'),
('Str16', 7.90, 8.10, 7.80, 8.00, 7.90, 8.20, 7.70, 7.90, 8.10, 7.80, 8.00, '2025-03-31 21:27:27'),
('Str17', 6.60, 6.80, 6.50, 6.70, 6.60, 6.90, 6.40, 6.60, 6.80, 6.50, 6.70, '2025-03-31 21:27:27'),
('Str18', 7.30, 7.50, 7.20, 7.40, 7.30, 7.60, 7.10, 7.30, 7.50, 7.20, 7.40, '2025-03-31 21:27:27'),
('Str19', 8.50, 8.70, 8.40, 8.60, 8.50, 8.80, 8.30, 8.50, 8.70, 8.40, 8.60, '2025-03-31 21:27:27'),
('Str2', 8.10, 8.30, 8.00, 8.20, 8.10, 8.40, 7.90, 8.10, 8.30, 8.00, 8.20, '2025-03-31 21:27:27'),
('Str20', 6.40, 6.60, 6.30, 6.50, 6.40, 6.70, 6.20, 6.40, 6.60, 6.30, 6.50, '2025-03-31 21:27:27'),
('Str21', 7.70, 7.90, 7.60, 7.80, 7.70, 8.00, 7.50, 7.70, 7.90, 7.60, 7.80, '2025-03-31 21:27:27'),
('Str3', 6.80, 7.00, 6.70, 6.90, 6.80, 7.10, 6.60, 6.80, 7.00, 6.70, 6.90, '2025-03-31 21:27:27'),
('Str4', 7.50, 7.70, 7.40, 7.60, 7.50, 7.80, 7.30, 7.50, 7.70, 7.40, 7.60, '2025-03-31 21:27:27'),
('Str5', 8.30, 8.50, 8.20, 8.40, 8.30, 8.60, 8.10, 8.30, 8.50, 8.20, 8.40, '2025-03-31 21:27:27'),
('Str6', 6.50, 6.70, 6.40, 6.60, 6.50, 6.80, 6.30, 6.50, 6.70, 6.40, 6.60, '2025-03-31 21:27:27'),
('Str7', 7.80, 8.00, 7.70, 7.90, 7.80, 8.10, 7.60, 7.80, 8.00, 7.70, 7.90, '2025-03-31 21:27:27'),
('Str8', 8.00, 8.20, 7.90, 8.10, 8.00, 8.30, 7.80, 8.00, 8.20, 7.90, 8.10, '2025-03-31 21:27:27'),
('Str9', 6.90, 7.10, 6.80, 7.00, 6.90, 7.20, 6.70, 6.90, 7.10, 6.80, 7.00, '2025-03-31 21:27:27');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_sales`
--

CREATE TABLE `tbl_sales` (
  `id` int(11) NOT NULL,
  `source` varchar(150) DEFAULT NULL,
  `amount` varchar(250) DEFAULT NULL,
  `rate` int(11) DEFAULT NULL,
  `totalcost` varchar(250) DEFAULT NULL,
  `salesdate` varchar(250) DEFAULT NULL,
  `month` varchar(250) DEFAULT NULL,
  `product` varchar(250) DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  `breed` varchar(250) DEFAULT NULL,
  `trn_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tbl_sales`
--

INSERT INTO `tbl_sales` (`id`, `source`, `amount`, `rate`, `totalcost`, `salesdate`, `month`, `product`, `year`, `breed`, `trn_date`) VALUES
(1, 'Inverter4', '55', 44, '2420', '2020-01-05', 'Jan', 'Transformer2', 2020, 'Native', '2020-01-30'),
(2, 'Inverter4', '65', 44, '2860', '2020-01-11', 'Jan', 'Transformer2', 2020, 'Native', '2020-01-30'),
(3, 'Inverter4', '53', 44, '2332', '2020-01-16', 'Jan', 'Transformer2', 2020, 'Native', '2020-01-30'),
(4, 'Inverter4', '20', 50, '500', '2020-01-18', 'Jan', 'Transformer2', 2020, 'Native', '2020-01-30'),
(5, 'Inverter4', '13', 50, '650', '2020-01-18', 'Jan', 'Transformer2', 2020, 'Native', '2020-01-30'),
(7, 'Inverter4', '10', 50, '500', '2020-01-20', 'Jan', 'Transformer2', 2020, 'Native', '2020-01-30'),
(10, 'Inverter4', '5', 50, '250', '2020-01-22', 'Jan', 'Transformer2', 2020, 'Native', '2020-01-30'),
(12, 'Inverter4', '66', 44, '2904', '2020-01-24', 'Jan', 'Transformer2', 2020, 'Native', '2020-01-30'),
(13, 'Inverter4', '6', 50, '300', '2020-01-24', 'Jan', 'Transformer2', 2020, 'Native', '2020-01-30'),
(14, 'Inverter4', '5', 50, '250', '2020-01-24', 'Jan', 'Transformer2', 2020, 'Native', '2020-01-30'),
(15, 'Inverter4', '2', 50, '100', '2020-01-25', 'Jan', 'Transformer2', 2020, 'Native', '2020-01-30'),
(16, 'Inverter4', '6', 50, '300', '2020-01-26', 'Jan', 'Transformer2', 2020, 'Native', '2020-01-30'),
(17, 'Inverter4', '5', 50, '250', '2020-01-26', 'Jan', 'Transformer2', 2020, 'Native', '2020-01-30'),
(18, 'Inverter4', '15', 50, '750', '2020-01-27', 'Jan', 'Transformer2', 2020, 'Native', '2020-01-30'),
(19, 'Inverter4', '10', 50, '500', '2020-01-28', 'Jan', 'Transformer2', 2020, 'Native', '2020-01-30'),
(20, 'Inverter4', '5', 50, '250', '2020-01-28', 'Jan', 'Transformer2', 2020, 'Native', '2020-01-30'),
(21, 'Inverter4', '5', 50, '250', '2020-01-28', 'Jan', 'Transformer2', 2020, 'Native', '2020-01-30'),
(22, 'Inverter4', '7', 50, '350', '2020-01-30', 'Jan', 'Transformer2', 2020, 'Native', '2020-01-30'),
(23, 'Inverter4', '53', 44, '2332', '2020-01-31', 'Feb', 'Transformer2', 2020, 'Native', '2020-02-01'),
(25, 'Inverter4', '25', 50, '1250', '2020-02-05', 'Mar', 'Transformer2', 2020, 'Native', '2020-03-08'),
(26, 'Inverter4', '10', 50, '500', '2020-02-08', 'Mar', 'Transformer2', 2020, 'Native', '2020-03-08'),
(27, 'Inverter4', '35', 40, '1400', '2020-02-08', 'Mar', 'Transformer2', 2020, 'Native', '2020-03-08'),
(28, 'Inverter4', '25', 50, '1250', '2020-02-10', 'Mar', 'Transformer2', 2020, 'Native', '2020-03-08'),
(29, 'Inverter4', '40', 40, '1600', '2020-02-14', 'Mar', 'Transformer2', 2020, 'Native', '2020-03-08'),
(30, 'Inverter4', '3', 50, '150', '2020-02-15', 'Mar', 'Transformer2', 2020, 'Native', '2020-03-08'),
(31, 'Inverter4', '5', 50, '250', '2020-02-16', 'Mar', 'Transformer2', 2020, 'Native', '2020-03-08'),
(32, 'Inverter4', '10', 50, '500', '2020-02-17', 'Mar', 'Transformer2', 2020, 'Native', '2020-03-08'),
(34, 'Inverter4', '3', 50, '150', '2020-02-18', 'Mar', 'Transformer2', 2020, 'Native', '2020-03-08'),
(35, 'Inverter4', '10', 50, '500', '2020-02-18', 'Mar', 'Transformer2', 2020, 'Native', '2020-03-08'),
(36, 'Inverter4', '7', 50, '350', '2020-02-18', 'Mar', 'Transformer2', 2020, 'Native', '2020-03-08'),
(37, 'Inverter4', '5', 50, '250', '2020-02-19', 'Mar', 'Transformer2', 2020, 'Native', '2020-03-08'),
(38, 'Inverter4', '10', 50, '500', '2020-02-19', 'Mar', 'Transformer2', 2020, 'Native', '2020-03-08'),
(40, 'Inverter4', '39', 38, '1482', '2020-02-24', 'Mar', 'Transformer2', 2020, 'Native', '2020-03-08'),
(41, 'Inverter4', '45', 38, '1710', '2020-02-26', 'Mar', 'Transformer2', 2020, 'Native', '2020-03-08'),
(42, 'Inverter4', '10', 50, '500', '2020-02-26', 'Mar', 'Transformer2', 2020, 'Native', '2020-03-08'),
(43, 'Inverter4', '62', 38, '2356', '2020-02-29', 'Mar', 'Transformer2', 2020, 'Native', '2020-03-08'),
(44, 'Inverter4', '2.5', 50, '125', '2020-03-09', 'Mar', 'Transformer2', 2020, 'Native', '2020-03-10'),
(45, 'Inverter4', '5', 50, '250', '2020-03-09', 'Mar', 'Transformer2', 2020, 'Native', '2020-03-10'),
(46, 'Inverter4', '10', 50, '500', '2020-03-09', 'Mar', 'Transformer2', 2020, 'Native', '2020-03-10'),
(47, 'Inverter4', '10', 50, '500', '2020-03-09', 'Mar', 'Transformer2', 2020, 'Native', '2020-03-10'),
(48, 'Inverter4', '4', 50, '200', '2020-03-09', 'Mar', 'Transformer2', 2020, 'Native', '2020-03-10'),
(49, 'Inverter4', '5', 50, '250', '2020-03-09', 'Mar', 'Transformer2', 2020, 'Native', '2020-03-10'),
(50, 'Inverter4', '5', 50, '250', '2020-03-09', 'Mar', 'Transformer2', 2020, 'Native', '2020-03-10'),
(51, 'Inverter4', '2', 50, '100', '2020-03-09', 'Mar', 'Transformer2', 2020, 'Native', '2020-03-10'),
(52, 'Inverter4', '2.75', 50, '137.5', '2020-03-09', 'Mar', 'Transformer2', 2020, 'Native', '2020-03-10'),
(53, 'Inverter4', '68', 38, '2584', '2020-03-09', 'Mar', 'Transformer2', 2020, 'Native', '2020-03-10'),
(54, 'Inverter4', '50', 38, '1900', '2020-03-10', 'Mar', 'Transformer2', 2020, 'Native', '2020-03-10'),
(55, 'Inverter4', '10', 50, '500', '2020-03-12', 'Mar', 'Transformer2', 2020, 'Native', '2020-03-12'),
(56, 'Inverter4', '5', 50, '250', '2020-03-12', 'Mar', 'Transformer2', 2020, 'Native', '2020-03-12'),
(57, 'Inverter4', '2', 50, '100', '2020-03-12', 'Mar', 'Transformer2', 2020, 'Native', '2020-03-12'),
(132, 'Inverter1', '54', 50, '2700', '2020-09-05', 'Sep', 'Transformer1', 2020, 'Native', '2020-09-30'),
(133, 'Inverter1', '41', 50, '2050', '2020-09-10', 'Sep', 'Transformer1', 2020, 'Native', '2020-09-30'),
(134, 'Inverter1', '7', 50, '350', '2020-09-10', 'Sep', 'Transformer1', 2020, 'Native', '2020-09-30'),
(135, 'Inverter1', '5', 50, '250', '2020-09-15', 'Sep', 'Transformer1', 2020, 'Native', '2020-09-30'),
(136, 'Inverter1', '19', 50, '950', '2020-09-18', 'Sep', 'Transformer1', 2020, 'Native', '2020-09-30'),
(137, 'Inverter1', '15', 50, '750', '2020-09-20', 'Sep', 'Transformer1', 2020, 'Native', '2020-09-30'),
(138, 'Inverter1', '5', 50, '250', '2020-09-21', 'Sep', 'Transformer1', 2020, 'Native', '2020-09-30'),
(139, 'Inverter1', '8', 50, '400', '2020-10-04', 'Oct', 'Transformer1', 2020, 'Native', '2020-10-05'),
(140, 'Inverter1', '5', 50, '250', '2020-10-06', 'Oct', 'Transformer1', 2020, 'Native', '2020-10-06'),
(141, 'Inverter1', '3', 50, '150', '2020-10-10', 'Oct', 'Transformer1', 2020, 'Native', '2020-10-11'),
(142, 'Inverter1', '5', 50, '250', '2020-10-12', 'Oct', 'Transformer1', 2020, 'Native', '2020-10-18'),
(143, 'Inverter1', '3', 50, '150', '2020-10-12', 'Oct', 'Transformer1', 2020, 'Native', '2020-10-18'),
(144, 'Inverter1', '4', 50, '200', '2020-10-12', 'Oct', 'Transformer1', 2020, 'Native', '2020-10-18'),
(146, 'Inverter1', '4', 2675, '10700', '2019-06-18', 'Oct', 'Transformer1', 2020, 'Native', '2020-10-21'),
(147, 'Inverter1', '3', 5000, '15000', '2020-07-31', 'Oct', 'Transformer1', 2020, 'Native', '2020-10-21'),
(148, 'Inverter1', '2', 2500, '5000', '2019-06-18', 'Oct', 'Transformer1', 2020, 'Native', '2020-10-21'),
(149, 'Inverter1', '1', 5000, '5000', '2020-07-31', 'Oct', 'Transformer1', 2020, 'Native', '2020-10-21'),
(150, 'Inverter1', '1', 2500, '2500', '2019-06-18', 'Oct', 'Transformer1', 2020, 'Native', '2020-10-21'),
(151, 'Inverter1', '2', 3200, '6400', '2019-05-20', 'Oct', 'Transformer1', 2020, 'Native', '2020-10-21'),
(152, 'Inverter1', '1', 2000, '2000', '2020-05-19', 'Oct', 'Transformer1', 2020, 'Native', '2020-10-21'),
(153, 'Inverter1', '2', 3200, '6400', '2019-05-20', 'Oct', 'Transformer1', 2020, 'Native', '2020-10-21'),
(154, 'Inverter1', '2', 4000, '8000', '2020-05-19', 'Oct', 'Transformer1', 2020, 'Native', '2020-10-21'),
(155, 'Inverter1', '1', 3200, '3200', '2020-05-19', 'Oct', 'Transformer1', 2020, 'Native', '2020-10-21'),
(157, 'Inverter1', '1', 2000, '2000', '2020-02-24', 'Oct', 'Transformer1', 2020, 'Native', '2020-10-21'),
(158, 'Inverter1', '4', 2375, '9500', '2020-02-18', 'Oct', 'Transformer1', 2020, 'Native', '2020-10-21'),
(159, 'Inverter1', '2', 3200, '6400', '2019-05-20', 'Oct', 'Transformer1', 2020, 'Native', '2020-10-21'),
(160, 'Inverter1', '1', 6800, '6800', '2020-02-02', 'Oct', 'Transformer1', 2020, 'Native', '2020-10-21'),
(161, 'Inverter1', '2', 2800, '5600', '2019-12-03', 'Oct', 'Transformer1', 2020, 'Native', '2020-10-21'),
(162, 'Inverter1', '2', 3200, '6400', '2019-05-20', 'Oct', 'Transformer1', 2020, 'Native', '2020-10-21'),
(163, 'Inverter1', '1', 6600, '6600', '2019-01-19', 'Oct', 'Transformer1', 2020, 'Native', '2020-10-21'),
(164, 'Inverter1', '2', 3000, '6000', '2019-02-12', 'Oct', 'Transformer1', 2020, 'Native', '2020-10-21'),
(165, 'Inverter1', '1', 2000, '2000', '2018-12-21', 'Oct', 'Transformer1', 2020, 'Native', '2020-10-21'),
(166, 'Inverter1', '1', 2700, '2700', '2018-12-08', 'Oct', 'Transformer1', 2020, 'Native', '2020-10-21'),
(167, 'Inverter1', '1', 3500, '3500', '2018-12-01', 'Oct', 'Transformer1', 2020, 'Native', '2020-10-21'),
(168, 'Inverter1', '5', 0, '0', '2018-06-06', 'Oct', 'Transformer1', 2020, 'Native', '2020-10-21'),
(169, 'Inverter1', '1', 6000, '6000', '2018-02-12', 'Oct', 'Transformer1', 2020, 'Native', '2020-10-21'),
(170, 'Inverter1', '1', 6000, '6000', '2018-01-02', 'Oct', 'Transformer1', 2020, 'Native', '2020-10-21'),
(171, 'Inverter1', '6', 5000, '30000', '2018-08-30', 'Oct', 'Transformer1', 2020, 'Native', '2020-10-21'),
(172, 'Inverter1', '2', 3100, '6200', '2019-05-24', 'Oct', 'Transformer1', 2020, 'Native', '2020-10-21'),
(174, 'Inverter1', '1', 3200, '3200', '2019-03-17', 'Oct', 'Transformer1', 2020, 'Native', '2020-10-21'),
(175, 'Inverter1', '8', 3200, '25600', '2019-05-20', 'Oct', 'Transformer1', 2020, 'Native', '2020-10-21'),
(176, 'Inverter1', '8', 4000, '32000', '2019-05-20', 'Oct', 'Transformer1', 2020, 'Native', '2020-10-21'),
(177, 'Inverter1', '6', 6600, '39600', '2019-01-19', 'Oct', 'Transformer1', 2020, 'Native', '2020-10-21'),
(178, 'Inverter1', '1', 6600, '6600', '2019-02-19', 'Oct', 'Transformer1', 2020, 'Native', '2020-10-21'),
(179, 'Inverter1', '1', 4000, '4000', '2019-03-19', 'Oct', 'Transformer1', 2020, 'Native', '2020-10-21'),
(180, 'Inverter1', '1', 9000, '9000', '2019-01-19', 'Oct', 'Transformer1', 2020, 'Native', '2020-10-21'),
(181, 'Inverter1', '2', 5500, '11000', '2018-08-18', 'Oct', 'Transformer1', 2020, 'Native', '2020-10-21'),
(182, 'Inverter1', '2', 3750, '7500', '2019-01-12', 'Oct', 'Transformer1', 2020, 'Native', '2020-10-22'),
(183, 'Inverter1', '6', 3000, '18000', '2019-01-12', 'Oct', 'Transformer1', 2020, 'Native', '2020-10-22'),
(184, 'Inverter1', '1', 4500, '4500', '2019-08-11', 'Oct', 'Transformer1', 2020, 'Native', '2020-10-22'),
(185, 'Inverter4', '1', 5000, '5000', '2018-08-18', 'Oct', 'Transformer2', 2020, 'Native', '2020-10-22'),
(186, 'Inverter4', '2', 6000, '12000', '2018-08-18', 'Oct', 'Transformer2', 2020, 'Native', '2020-10-22'),
(187, 'Inverter4', '1', 2400, '2400', '2018-05-25', 'Oct', 'Transformer2', 2020, 'Native', '2020-10-22'),
(188, 'Inverter4', '1', 4000, '4000', '2020-02-24', 'Oct', 'Transformer2', 2020, 'Native', '2020-10-22'),
(189, 'Inverter4', '1', 4500, '4500', '2019-01-13', 'Oct', 'Transformer2', 2020, 'Native', '2020-10-22'),
(190, 'Inverter4', '1', 14000, '14000', '2020-08-14', 'Oct', 'Transformer2', 2020, 'Native', '2020-10-22'),
(191, 'Inverter4', '2', 4000, '8000', '2019-07-02', 'Oct', 'Transformer2', 2020, 'Native', '2020-10-22'),
(192, 'Inverter4', '1', 11000, '11000', '2019-06-18', 'Oct', 'Transformer2', 2020, 'Native', '2020-10-22'),
(193, 'Inverter4', '1', 4000, '4000', '2019-03-19', 'Oct', 'Transformer2', 2020, 'Native', '2020-10-22'),
(194, 'Inverter4', '2', 3500, '7000', '2019-08-10', 'Oct', 'Transformer2', 2020, 'Native', '2020-10-22'),
(195, 'Inverter4', '8', 2500, '20000', '2019-07-10', 'Oct', 'Transformer2', 2020, 'Native', '2020-10-22'),
(196, 'Inverter4', '1', 14000, '14000', '2020-08-14', 'Oct', 'Transformer2', 2020, 'Native', '2020-10-22'),
(197, 'Inverter4', '7', 3200, '22400', '2019-05-20', 'Oct', 'Transformer2', 2020, 'Native', '2020-10-22'),
(198, 'Inverter4', '3', 2800, '8400', '2019-12-03', 'Oct', 'Transformer2', 2020, 'Native', '2020-10-22'),
(199, 'Inverter4', '1', 2500, '2500', '2019-07-10', 'Oct', 'Transformer2', 2020, 'Native', '2020-10-22'),
(200, 'Inverter4', '10', 3000, '30000', '2019-02-07', 'Oct', 'Transformer2', 2020, 'Native', '2020-10-22'),
(201, 'Inverter4', '6', 5000, '30000', '2019-08-11', 'Oct', 'Transformer2', 2020, 'Native', '2020-10-22'),
(202, 'Inverter4', '1', 4000, '4000', '2019-08-11', 'Oct', 'Transformer2', 2020, 'Native', '2020-10-22'),
(203, 'Inverter4', '1', 5000, '5000', '2019-10-26', 'Oct', 'Transformer2', 2020, 'Native', '2020-10-22'),
(204, 'Inverter4', '1', 3000, '3000', '2019-03-07', 'Oct', 'Transformer2', 2020, 'Native', '2020-10-22'),
(207, 'Inverter4', '1', 4500, '4500', '2019-08-11', 'Oct', 'Transformer2', 2020, 'Native', '2020-10-22'),
(208, 'Inverter4', '1', 5000, '5000', '2019-06-04', 'Oct', 'Transformer2', 2020, 'Native', '2020-10-22'),
(209, 'Inverter4', '2', 2500, '5000', '2019-02-11', 'Oct', 'Transformer2', 2020, 'Native', '2020-10-22'),
(210, 'Inverter4', '1', 3000, '3000', '2019-01-12', 'Oct', 'Transformer2', 2020, 'Native', '2020-10-22'),
(211, 'Inverter4', '1', 3000, '3000', '2019-01-12', 'Oct', 'Transformer2', 2020, 'Native', '2020-10-22'),
(212, 'Inverter2', '1', 105000, '105000', '2020-09-17', 'Oct', 'Transformer2', 2020, 'Native', '2020-10-22'),
(214, 'Inverter2', '1', 80000, '80000', '2020-07-31', 'Oct', 'Transformer2', 2020, 'Native', '2020-10-22'),
(218, 'Inverter2', '1', 125000, '125000', '2020-07-04', 'Oct', 'Transformer2', 2020, 'Native', '2020-10-22'),
(219, 'Inverter2', '1', 189500, '189500', '2020-07-03', 'Oct', 'Transformer2', 2020, 'Native', '2020-10-22'),
(220, 'Inverter2', '1', 74000, '74000', '2020-07-31', 'Oct', 'Transformer2', 2020, 'Native', '2020-10-22'),
(221, 'Inverter2', '1', 63000, '63000', '2020-07-31', 'Oct', 'Transformer2', 2020, 'Native', '2020-10-22'),
(222, 'Inverter2', '1', 93500, '93500', '2020-07-31', 'Oct', 'Transformer2', 2020, 'Native', '2020-10-22'),
(223, 'Inverter4', '1', 3000, '3000', '2019-02-07', 'Oct', 'Transformer2', 2020, 'Native', '2020-10-22'),
(224, 'Inverter4', '1', 5000, '5000', '2020-07-31', 'Oct', 'Transformer2', 2020, 'Native', '2020-10-22'),
(225, 'Inverter4', '1', 2500, '2500', '2019-06-18', 'Oct', 'Transformer2', 2020, 'Native', '2020-10-22'),
(226, 'Inverter4', '4', 5375, '21500', '2020-07-31', 'Oct', 'Transformer2', 2020, 'Native', '2020-10-22'),
(227, 'Inverter4', '9', 2500, '22500', '2020-07-10', 'Oct', 'Transformer2', 2020, 'Native', '2020-10-22'),
(228, 'Inverter4', '8', 2500, '20000', '2020-07-10', 'Oct', 'Transformer2', 2020, 'Native', '2020-10-22'),
(229, 'Inverter4', '4', 2500, '10000', '2020-02-18', 'Oct', 'Transformer2', 2020, 'Native', '2020-10-22'),
(230, 'Inverter4', '1', 4000, '4000', '2020-06-19', 'Oct', 'Transformer2', 2020, 'Native', '2020-10-22'),
(231, 'Inverter4', '1', 2800, '2800', '2020-05-21', 'Oct', 'Transformer2', 2020, 'Native', '2020-10-22'),
(232, 'Inverter4', '1', 2500, '2500', '2020-02-12', 'Oct', 'Transformer2', 2020, 'Native', '2020-10-22'),
(233, 'Inverter4', '1', 4000, '4000', '2020-03-10', 'Oct', 'Transformer2', 2020, 'Native', '2020-10-22'),
(243, 'Inverter1', '9', 600, '5400', '2020-12-13', 'Dec', 'Transformer2', 2020, 'Native', '2020-12-19'),
(246, 'Inverter4', '1', 6000, '6000', '2020-12-20', 'Dec', 'Transformer2', 2020, 'Native', '2020-12-20'),
(247, 'Inverter4', '1', 6000, '6000', '2020-12-20', 'Dec', 'Transformer2', 2020, 'Native', '2020-12-20'),
(248, 'Inverter4', '1', 6000, '6000', '2020-12-20', 'Dec', 'Transformer2', 2020, 'Native', '2020-12-20'),
(249, 'Inverter4', '1', 6000, '6000', '2020-12-20', 'Dec', 'Transformer2', 2020, 'Native', '2020-12-20'),
(308, 'Inverter1', '10', 220, '2200', '2021-03-10', 'Mar', 'Transformer2', 2021, 'Native', '2021-03-10'),
(309, 'Inverter1', '14', 300, '4200', '2021-03-10', 'Mar', 'Transformer2', 2021, 'Native', '2021-03-10'),
(311, 'Inverter1', '4', 450, '1800', '2021-02-10', 'Mar', 'Transformer2', 2021, 'Native', '2021-03-10'),
(312, 'Inverter1', '5', 450, '2250', '2021-02-10', 'Mar', 'Transformer2', 2021, 'Native', '2021-03-10'),
(347, 'Inverter2', '2', 55, '110', '2021-04-03', 'Apr', '3', 2021, 'Hybreed', '2021-04-15'),
(348, 'Inverter2', '5', 60, '300', '2021-04-03', 'Apr', '3', 2021, 'Hybreed', '2021-04-15'),
(349, 'Inverter2', '5', 60, '300', '2021-04-04', 'Apr', '3', 2021, 'Hybreed', '2021-04-15'),
(350, 'Inverter2', '20', 44, '880', '2021-04-04', 'Apr', '3', 2021, 'Hybreed', '2021-04-15'),
(351, 'Inverter2', '5', 60, '300', '2021-04-05', 'Apr', '3', 2021, 'Hybreed', '2021-04-15'),
(352, 'Inverter2', '5', 55, '275', '2021-04-05', 'Apr', '3', 2021, 'Hybreed', '2021-04-15'),
(354, 'Inverter2', '21', 44, '924', '2021-04-05', 'Apr', '3', 2021, 'Hybreed', '2021-04-15'),
(355, 'Inverter2', '5', 55, '275', '2021-04-06', 'Apr', '3', 2021, 'Hybreed', '2021-04-15'),
(356, 'Inverter2', '2.5', 60, '150', '2021-04-06', 'Apr', '3', 2021, 'Hybreed', '2021-04-15'),
(357, 'Inverter2', '2.5', 60, '150', '2021-04-06', 'Apr', '3', 2021, 'Hybreed', '2021-04-15'),
(358, 'Inverter2', '20', 44, '880', '2021-04-06', 'Apr', '3', 2021, 'Hybreed', '2021-04-15'),
(359, 'Inverter2', '2.5', 60, '150', '2021-04-06', 'Apr', '3', 2021, 'Hybreed', '2021-04-15'),
(360, 'Inverter2', '5', 60, '300', '2021-04-07', 'Apr', '3', 2021, 'Hybreed', '2021-04-15'),
(361, 'Inverter2', '10', 55, '550', '2021-04-07', 'Apr', '3', 2021, 'Hybreed', '2021-04-15'),
(362, 'Inverter2', '20', 44, '880', '2021-04-07', 'Apr', '3', 2021, 'Hybreed', '2021-04-15'),
(363, 'Inverter2', '5', 60, '300', '2021-04-08', 'Apr', '3', 2021, 'Hybreed', '2021-04-15'),
(364, 'Inverter2', '22', 44, '968', '2021-04-08', 'Apr', '3', 2021, 'Hybreed', '2021-04-15'),
(365, 'Inverter2', '23', 44, '1012', '2021-04-09', 'Apr', '3', 2021, 'Hybreed', '2021-04-15'),
(366, 'Inverter2', '9', 55, '495', '2021-04-09', 'Apr', '3', 2021, 'Hybreed', '2021-04-15'),
(367, 'Inverter2', '23', 44, '1012', '2021-04-10', 'Apr', '3', 2021, 'Hybreed', '2021-04-15'),
(368, 'Inverter2', '23', 44, '1012', '2021-04-11', 'Apr', '3', 2021, 'Hybreed', '2021-04-15'),
(369, 'Inverter2', '5', 60, '300', '2021-04-11', 'Apr', '3', 2021, 'Hybreed', '2021-04-15'),
(370, 'Inverter2', '8', 60, '480', '2021-04-11', 'Apr', '3', 2021, 'Hybreed', '2021-04-15'),
(371, 'Inverter2', '5', 60, '300', '2021-04-11', 'Apr', '3', 2021, 'Hybreed', '2021-04-15'),
(372, 'Inverter2', '5', 60, '300', '2021-04-11', 'Apr', '3', 2021, 'Hybreed', '2021-04-15'),
(373, 'Inverter2', '23', 44, '1012', '2021-04-12', 'Apr', '3', 2021, 'Hybreed', '2021-04-15'),
(374, 'Inverter2', '5', 55, '275', '2021-04-12', 'Apr', '3', 2021, 'Hybreed', '2021-04-15'),
(375, 'Inverter2', '2', 55, '110', '2021-03-12', 'Apr', '3', 2021, 'Hybreed', '2021-04-15'),
(376, 'Inverter2', '10', 60, '600', '2021-03-13', 'Apr', '3', 2021, 'Hybreed', '2021-04-15'),
(377, 'Inverter2', '6.5', 60, '390', '2021-03-13', 'Apr', '3', 2021, 'Hybreed', '2021-04-15'),
(378, 'Inverter2', '6.5', 60, '390', '2021-03-13', 'Apr', '3', 2021, 'Hybreed', '2021-04-15'),
(379, 'Inverter2', '6.5', 60, '390', '2021-04-13', 'Apr', '3', 2021, 'Hybreed', '2021-04-15'),
(380, 'Inverter2', '6.5', 60, '390', '2021-04-13', 'Apr', '3', 2021, 'Hybreed', '2021-04-15'),
(381, 'Inverter2', '16', 44, '704', '2021-04-13', 'Apr', '3', 2021, 'Hybreed', '2021-04-15'),
(382, 'Inverter2', '23', 44, '1012', '2021-04-14', 'Apr', '3', 2021, 'Hybreed', '2021-04-15'),
(383, 'Inverter2', '6.5', 60, '390', '2021-04-14', 'Apr', '3', 2021, 'Hybreed', '2021-04-15'),
(384, 'Inverter2', '5', 60, '300', '2021-04-14', 'Apr', '3', 2021, 'Hybreed', '2021-04-15'),
(385, 'Inverter2', '5', 60, '300', '2021-04-15', 'Apr', '3', 2021, 'Hybreed', '2021-04-15'),
(386, 'Inverter2', '3.5', 55, '192.5', '2021-04-15', 'Apr', '3', 2021, 'Hybreed', '2021-04-15'),
(387, 'Inverter2', '19', 44, '836', '2021-04-15', 'Apr', '3', 2021, 'Hybreed', '2021-04-15'),
(395, 'Inverter2', '23', 44, '1012', '2021-04-16', 'Apr', '3', 2021, 'Hybreed', '2021-04-19'),
(396, 'Inverter2', '5', 55, '275', '2021-04-16', 'Apr', '3', 2021, 'Hybreed', '2021-04-19'),
(397, 'Inverter2', '5', 60, '300', '2021-04-17', 'Apr', '3', 2021, 'Hybreed', '2021-04-19'),
(398, 'Inverter2', '29', 44, '1276', '2021-04-17', 'Apr', '3', 2021, 'Hybreed', '2021-04-19'),
(399, 'Inverter2', '34', 44, '1496', '2021-04-18', 'Apr', '3', 2021, 'Hybreed', '2021-04-19'),
(400, 'Inverter2', '31', 44, '1364', '2021-04-19', 'Apr', '3', 2021, 'Hybreed', '2021-04-19'),
(403, 'Inverter2', '4', 60, '240', '2021-04-20', 'Apr', '3', 2021, 'Hybreed', '2021-04-27'),
(404, 'Inverter2', '10', 60, '600', '2021-04-20', 'Apr', '3', 2021, 'Hybreed', '2021-04-27'),
(405, 'Inverter2', '35', 44, '1540', '2021-04-20', 'Apr', '3', 2021, 'Hybreed', '2021-04-27'),
(406, 'Inverter2', '33', 44, '1452', '2021-04-21', 'Apr', '3', 2021, 'Hybreed', '2021-04-27'),
(407, 'Inverter2', '34', 44, '1496', '2021-04-22', 'Apr', '3', 2021, 'Native', '2021-04-27'),
(408, 'Inverter2', '5', 60, '300', '2021-04-22', 'Apr', '3', 2021, 'Native', '2021-04-27'),
(409, 'Inverter2', '10', 60, '600', '2021-04-22', 'Apr', '3', 2021, 'Native', '2021-04-27'),
(410, 'Inverter2', '5', 55, '275', '2021-04-22', 'Apr', '3', 2021, 'Native', '2021-04-27'),
(411, 'Inverter2', '10', 55, '550', '2021-04-22', 'Apr', '3', 2021, 'Native', '2021-04-27'),
(412, 'Inverter2', '31', 44, '1364', '2021-04-23', 'Apr', '3', 2021, 'Native', '2021-04-27'),
(413, 'Inverter2', '3', 55, '165', '2021-04-23', 'Apr', '3', 2021, 'Native', '2021-04-27'),
(414, 'Inverter2', '5', 60, '300', '2021-04-24', 'Apr', '3', 2021, 'Native', '2021-04-27'),
(415, 'Inverter2', '5', 60, '300', '2021-04-24', 'Apr', '3', 2021, 'Native', '2021-04-27'),
(416, 'Inverter2', '31', 44, '1364', '2021-04-24', 'Apr', '3', 2021, 'Native', '2021-04-27'),
(417, 'Inverter2', '27', 44, '1188', '2021-04-25', 'Apr', '3', 2021, 'Native', '2021-04-27'),
(418, 'Inverter2', '30', 44, '1320', '2021-04-26', 'Apr', '3', 2021, 'Native', '2021-04-27'),
(422, 'Inverter2', '12', 55, '660', '2021-04-27', 'Apr', '3', 2021, 'Native', '2021-04-28'),
(424, 'Inverter2', '5', 60, '300', '2021-04-27', 'Apr', '3', 2021, 'Native', '2021-04-28'),
(425, 'Inverter2', '33', 44, '1452', '2021-04-27', 'Apr', '3', 2021, 'Native', '2021-04-28'),
(427, 'Inverter2', '5', 60, '300', '2021-04-27', 'Apr', '3', 2021, 'Native', '2021-04-30'),
(428, 'Inverter2', '5', 55, '275', '2021-04-28', 'Apr', '3', 2021, 'Native', '2021-04-30'),
(429, 'Inverter2', '7', 60, '420', '2021-04-28', 'Apr', '3', 2021, 'Native', '2021-04-30'),
(430, 'Inverter2', '7', 60, '420', '2021-04-28', 'Apr', '3', 2021, 'Native', '2021-04-30'),
(432, 'Inverter2', '35', 44, '1540', '2021-04-28', 'Apr', '3', 2021, 'Native', '2021-04-30'),
(433, 'Inverter2', '31', 44, '1364', '2021-04-29', 'Apr', '3', 2021, 'Native', '2021-04-30'),
(434, 'Inverter2', '29', 44, '1276', '2021-04-30', 'Apr', '3', 2021, 'Native', '2021-04-30'),
(435, 'Inverter1', '50', 8, '375', '2021-04-27', 'Apr', 'Transformer1', 2021, 'Native', '2021-04-30'),
(436, 'Inverter2', '35', 45, '1575', '2021-05-01', 'May', '3', 2021, 'Native', '2021-05-01'),
(437, 'Inverter2', '5', 60, '300', '2021-05-01', 'May', '3', 2021, 'Native', '2021-05-01'),
(438, 'Inverter2', '5', 60, '300', '2021-05-01', 'May', '3', 2021, 'Native', '2021-05-01'),
(439, 'Inverter2', '5', 60, '300', '2021-05-01', 'May', '3', 2021, 'Native', '2021-05-01'),
(440, 'Inverter2', '8', 55, '440', '2021-05-02', 'May', '3', 2021, 'Native', '2021-05-07'),
(441, 'Inverter2', '4', 60, '240', '2021-05-02', 'May', '3', 2021, 'Native', '2021-05-07'),
(442, 'Inverter2', '5', 60, '300', '2021-05-02', 'May', '3', 2021, 'Native', '2021-05-07'),
(443, 'Inverter2', '32', 45, '1440', '2021-05-02', 'May', '3', 2021, 'Native', '2021-05-07'),
(444, 'Inverter2', '25.5', 45, '1147.5', '2021-05-03', 'May', '3', 2021, 'Native', '2021-05-07'),
(445, 'Inverter2', '23', 45, '1035', '2021-05-04', 'May', '3', 2021, 'Native', '2021-05-07'),
(446, 'Inverter2', '3', 55, '165', '2021-05-04', 'May', '3', 2021, 'Native', '2021-05-07'),
(447, 'Inverter2', '5', 60, '300', '2021-05-04', 'May', '3', 2021, 'Native', '2021-05-07'),
(448, 'Inverter2', '5', 60, '300', '2021-05-04', 'May', '3', 2021, 'Native', '2021-05-07'),
(449, 'Inverter2', '29', 45, '1305', '2021-05-05', 'May', '3', 2021, 'Native', '2021-05-07'),
(450, 'Inverter2', '40', 45, '1800', '2021-05-06', 'May', '3', 2021, 'Native', '2021-05-07'),
(451, 'Inverter2', '30', 45, '1350', '2021-05-07', 'May', '3', 2021, 'Native', '2021-05-07'),
(452, 'Inverter2', '10', 55, '550', '2021-05-07', 'May', '3', 2021, 'Native', '2021-05-07'),
(453, 'Inverter2', '5', 55, '275', '2021-05-08', 'May', '3', 2021, 'Native', '2021-05-07'),
(455, 'Inverter2', '45', 55, '2475', '2021-05-07', 'May', '3', 2021, 'Native', '2021-05-08'),
(456, 'Inverter2', '10', 55, '550', '2021-05-07', 'May', '3', 2021, 'Native', '2021-05-08'),
(457, 'Inverter2', '31', 45, '1395', '2021-05-08', 'May', '3', 2021, 'Native', '2021-05-08'),
(458, 'Inverter2', '4', 55, '220', '2021-05-08', 'May', '3', 2021, 'Native', '2021-05-08'),
(459, 'Inverter4', '158', 0, '0', '2021-05-08', 'May', 'Transformer2', 2021, 'Native', '2021-05-08'),
(460, 'Inverter2', '2', 60, '120', '2021-05-09', 'May', '3', 2021, 'Native', '2021-05-10'),
(461, 'Inverter2', '10', 60, '600', '2021-05-09', 'May', '3', 2021, 'Native', '2021-05-10'),
(462, 'Inverter2', '5', 60, '300', '2021-05-09', 'May', '3', 2021, 'Native', '2021-05-10'),
(463, 'Inverter2', '5', 60, '300', '2021-05-09', 'May', '3', 2021, 'Native', '2021-05-10'),
(464, 'Inverter2', '5', 60, '300', '2021-05-09', 'May', '3', 2021, 'Native', '2021-05-10'),
(465, 'Inverter2', '5', 60, '300', '2021-05-09', 'May', '3', 2021, 'Native', '2021-05-10'),
(466, 'Inverter2', '4.5', 55, '247.5', '2021-05-09', 'May', '3', 2021, 'Native', '2021-05-10'),
(467, 'Inverter2', '20', 45, '900', '2021-05-09', 'May', '3', 2021, 'Native', '2021-05-10'),
(468, 'Inverter2', '22', 45, '990', '2021-05-10', 'May', '3', 2021, 'Native', '2021-05-10'),
(469, 'Inverter2', '7', 60, '420', '2021-05-10', 'May', '3', 2021, 'Native', '2021-05-10'),
(470, 'Inverter2', '5', 55, '275', '2021-05-10', 'May', '3', 2021, 'Native', '2021-05-10'),
(471, 'Inverter2', '5', 55, '275', '2021-05-10', 'May', '3', 2021, 'Native', '2021-05-10'),
(472, 'Inverter2', '5', 60, '300', '2021-05-10', 'May', '3', 2021, 'Native', '2021-05-10'),
(473, 'Inverter2', '5', 60, '300', '2021-05-11', 'May', '3', 2021, 'Native', '2021-05-11'),
(474, 'Inverter2', '5', 60, '300', '2021-05-11', 'May', '3', 2021, 'Native', '2021-05-11'),
(475, 'Inverter2', '2', 55, '110', '2021-05-11', 'May', '3', 2021, 'Native', '2021-05-11'),
(476, 'Inverter2', '3.5', 55, '192.5', '2021-05-11', 'May', '3', 2021, 'Native', '2021-05-11'),
(477, 'Inverter2', '22', 45, '990', '2021-05-11', 'May', '3', 2021, 'Native', '2021-05-11'),
(478, 'Inverter4', '1', 4600, '4600', '2021-05-09', 'May', 'Transformer2', 2021, 'Native', '2021-05-13'),
(479, 'Inverter2', '4.5', 60, '270', '2021-05-12', 'May', '3', 2021, 'Native', '2021-05-13'),
(480, 'Inverter2', '6', 55, '330', '2021-05-12', 'May', '3', 2021, 'Native', '2021-05-13'),
(481, 'Inverter2', '5', 55, '275', '2021-05-12', 'May', '3', 2021, 'Native', '2021-05-13'),
(482, 'Inverter2', '15.5', 55, '852.5', '2021-05-12', 'May', '3', 2021, 'Native', '2021-05-13'),
(483, 'Inverter2', '32', 45, '1440', '2021-05-12', 'May', '3', 2021, 'Native', '2021-05-13'),
(484, 'Inverter2', '30', 45, '1350', '2021-05-13', 'May', '3', 2021, 'Native', '2021-05-13'),
(485, 'Inverter2', '2', 55, '110', '2021-05-13', 'May', '3', 2021, 'Native', '2021-05-15'),
(486, 'Inverter2', '2', 55, '110', '2021-05-13', 'May', '3', 2021, 'Native', '2021-05-15'),
(487, 'Inverter2', '4', 60, '240', '2021-05-13', 'May', '3', 2021, 'Native', '2021-05-15'),
(488, 'Inverter2', '6', 55, '330', '2021-05-13', 'May', '3', 2021, 'Native', '2021-05-15'),
(489, 'Inverter2', '40', 45, '1800', '2021-05-14', 'May', '3', 2021, 'Native', '2021-05-15'),
(490, 'Inverter2', '2', 55, '110', '2021-05-14', 'May', '3', 2021, 'Native', '2021-05-15'),
(491, 'Inverter4', '1', 6000, '6000', '2021-05-15', 'May', 'Transformer2', 2021, 'Native', '2021-05-17'),
(492, 'Inverter2', '44', 45, '1980', '2021-05-15', 'May', '3', 2021, 'Native', '2021-05-19'),
(493, 'Inverter2', '51', 45, '2295', '2021-05-16', 'May', '3', 2021, 'Native', '2021-05-19'),
(494, 'Inverter2', '52', 45, '2340', '2021-05-17', 'May', '3', 2021, 'Native', '2021-05-19'),
(495, 'Inverter2', '51', 45, '2295', '2021-05-18', 'May', '3', 2021, 'Native', '2021-05-19'),
(496, 'Inverter2', '53', 45, '2385', '2021-05-19', 'May', '3', 2021, 'Native', '2021-05-19'),
(497, 'Inverter2', '52', 45, '2340', '2021-05-20', 'May', '3', 2021, 'Native', '2021-05-23'),
(498, 'Inverter2', '2', 60, '120', '2021-05-20', 'May', '3', 2021, 'Native', '2021-05-23'),
(499, 'Inverter2', '5', 60, '300', '2021-05-20', 'May', '3', 2021, 'Native', '2021-05-23'),
(500, 'Inverter2', '5', 60, '300', '2021-05-20', 'May', '3', 2021, 'Native', '2021-05-23'),
(501, 'Inverter2', '56', 45, '2520', '2021-05-21', 'May', '3', 2021, 'Native', '2021-05-23'),
(502, 'Inverter2', '54', 45, '2430', '2021-05-22', 'May', '3', 2021, 'Native', '2021-05-23'),
(503, 'Inverter2', '5', 60, '300', '2021-05-22', 'May', '3', 2021, 'Native', '2021-05-23'),
(504, 'Inverter2', '5', 60, '300', '2021-05-22', 'May', '3', 2021, 'Native', '2021-05-23'),
(505, 'Inverter2', '10', 60, '600', '2021-05-22', 'May', '3', 2021, 'Native', '2021-05-23'),
(506, 'Inverter2', '53', 45, '2385', '2021-05-23', 'May', '3', 2021, 'Native', '2021-05-23'),
(507, 'Inverter4', ' 27', 5000, '135000', '2021-05-23', 'May', 'Transformer2', 2021, 'Native', '2021-05-25'),
(508, 'Inverter2', '46.5', 45, '2092.5', '2021-05-24', 'May', '3', 2021, 'Native', '2021-05-29'),
(509, 'Inverter2', '44', 45, '1980', '2021-05-25', 'May', '3', 2021, 'Native', '2021-05-29'),
(510, 'Inverter2', '15', 55, '825', '2021-05-26', 'May', '3', 2021, 'Native', '2021-05-29'),
(511, 'Inverter2', '5', 60, '300', '2021-05-26', 'May', '3', 2021, 'Native', '2021-05-29'),
(512, 'Inverter2', '5', 60, '300', '2021-05-26', 'May', '3', 2021, 'Native', '2021-05-29'),
(513, 'Inverter2', '15', 55, '825', '2021-05-26', 'May', '3', 2021, 'Native', '2021-05-29'),
(514, 'Inverter2', '5', 60, '300', '2021-05-26', 'May', '3', 2021, 'Native', '2021-05-29'),
(515, 'Inverter2', '5', 60, '300', '2021-05-26', 'May', '3', 2021, 'Native', '2021-05-29'),
(516, 'Inverter2', '20', 60, '1200', '2021-05-26', 'May', '3', 2021, 'Native', '2021-05-29'),
(518, 'Inverter2', '5', 55, '275', '2021-05-28', 'May', '3', 2021, 'Native', '2021-05-29'),
(519, 'Inverter2', '32', 40, '1280', '2021-05-29', 'May', '3', 2021, 'Native', '2021-05-31'),
(520, 'Inverter2', '40', 40, '1600', '2021-05-30', 'May', '3', 2021, 'Native', '2021-05-31'),
(521, 'Inverter2', '10', 55, '550', '2021-05-30', 'May', '3', 2021, 'Native', '2021-05-31'),
(522, 'Inverter2', '5', 60, '300', '2021-05-30', 'May', '3', 2021, 'Native', '2021-05-31'),
(523, 'Inverter2', '5', 55, '275', '2021-05-30', 'May', '3', 2021, 'Native', '2021-05-31'),
(524, 'Inverter2', '5', 55, '275', '2021-05-30', 'May', '3', 2021, 'Native', '2021-05-31'),
(525, 'Inverter2', '15', 55, '825', '2021-05-30', 'May', '3', 2021, 'Native', '2021-05-31'),
(526, 'Inverter2', '38.5', 40, '1540', '2021-05-31', 'May', '3', 2021, 'Native', '2021-05-31'),
(527, 'Inverter2', '5', 55, '275', '2021-05-31', 'May', '3', 2021, 'Native', '2021-05-31'),
(529, 'Inverter2', '10', 55, '550', '2021-05-31', 'May', '3', 2021, 'Native', '2021-05-31'),
(530, 'Inverter2', '35.5', 40, '1420', '2021-06-01', 'Jun', '3', 2021, 'Native', '2021-06-02'),
(531, 'Inverter2', '39', 40, '1560', '2021-06-02', 'Jun', '3', 2021, 'Native', '2021-06-02'),
(532, 'Inverter2', '39', 40, '1560', '2021-06-03', 'Jun', '3', 2021, 'Native', '2021-06-07'),
(533, 'Inverter2', '10', 55, '550', '2021-06-03', 'Jun', '3', 2021, 'Native', '2021-06-07'),
(534, 'Inverter2', '37', 40, '1480', '2021-06-04', 'Jun', '3', 2021, 'Native', '2021-06-07'),
(535, 'Inverter2', '34', 40, '1360', '2021-06-05', 'Jun', '3', 2021, 'Native', '2021-06-07'),
(536, 'Inverter2', '8', 55, '440', '2021-06-05', 'Jun', '3', 2021, 'Native', '2021-06-07'),
(537, 'Inverter2', '10', 55, '550', '2021-06-05', 'Jun', '3', 2021, 'Native', '2021-06-07'),
(538, 'Inverter2', '5', 60, '300', '2021-06-05', 'Jun', '3', 2021, 'Native', '2021-06-07'),
(539, 'Inverter2', '5', 60, '300', '2021-06-05', 'Jun', '3', 2021, 'Native', '2021-06-07'),
(540, 'Inverter2', '36.5', 40, '1460', '2021-06-06', 'Jun', '3', 2021, 'Native', '2021-06-07'),
(541, 'Inverter2', '5', 60, '300', '2021-06-06', 'Jun', '3', 2021, 'Native', '2021-06-07'),
(542, 'Inverter2', '3', 55, '165', '2021-06-07', 'Jun', '3', 2021, 'Native', '2021-06-07'),
(543, 'Inverter2', '66.5', 40, '2660', '2021-06-07', 'Jun', '3', 2021, 'Native', '2021-06-07'),
(544, 'Inverter2', '38', 40, '1520', '2021-06-08', 'Jun', '3', 2021, 'Native', '2021-06-19'),
(545, 'Inverter2', '3', 55, '165', '2021-06-08', 'Jun', '3', 2021, 'Native', '2021-06-19'),
(546, 'Inverter2', '37.5', 40, '1500', '2021-06-09', 'Jun', '3', 2021, 'Native', '2021-06-19'),
(547, 'Inverter2', '5', 55, '275', '2021-06-09', 'Jun', '3', 2021, 'Native', '2021-06-19'),
(548, 'Inverter2', '5', 60, '300', '2021-06-09', 'Jun', '3', 2021, 'Native', '2021-06-19'),
(549, 'Inverter2', '5', 60, '300', '2021-06-09', 'Jun', '3', 2021, 'Native', '2021-06-19'),
(550, 'Inverter2', '37', 40, '1480', '2021-06-10', 'Jun', '3', 2021, 'Native', '2021-06-19'),
(551, 'Inverter2', '73', 40, '2920', '2021-06-11', 'Jun', '3', 2021, 'Native', '2021-06-19'),
(552, 'Inverter2', '36', 40, '1440', '2021-06-12', 'Jun', '3', 2021, 'Native', '2021-06-19'),
(553, 'Inverter2', '34', 40, '1360', '2021-06-13', 'Jun', '3', 2021, 'Native', '2021-06-19'),
(554, 'Inverter2', '10', 60, '600', '2021-06-14', 'Jun', '3', 2021, 'Native', '2021-06-19'),
(555, 'Inverter2', '5', 60, '300', '2021-06-14', 'Jun', '3', 2021, 'Native', '2021-06-19'),
(556, 'Inverter2', '15', 55, '825', '2021-06-14', 'Jun', '3', 2021, 'Native', '2021-06-19'),
(557, 'Inverter2', '5', 60, '300', '2021-06-14', 'Jun', '3', 2021, 'Native', '2021-06-19'),
(558, 'Inverter2', '5', 60, '300', '2021-06-14', 'Jun', '3', 2021, 'Native', '2021-06-19'),
(559, 'Inverter2', '5', 60, '300', '2021-06-14', 'Jun', '3', 2021, 'Native', '2021-06-19'),
(560, 'Inverter2', '5', 60, '300', '2021-06-14', 'Jun', '3', 2021, 'Native', '2021-06-19'),
(561, 'Inverter2', '20', 60, '1200', '2021-06-14', 'Jun', '3', 2021, 'Native', '2021-06-19'),
(562, 'Inverter2', '15', 60, '900', '2021-06-14', 'Jun', '3', 2021, 'Native', '2021-06-19'),
(563, 'Inverter2', '3', 60, '180', '2021-06-14', 'Jun', '3', 2021, 'Native', '2021-06-19'),
(564, 'Inverter2', '10', 60, '600', '2021-06-14', 'Jun', '3', 2021, 'Native', '2021-06-19'),
(565, 'Inverter2', '67', 40, '2680', '2021-06-15', 'Jun', '3', 2021, 'Native', '2021-06-19'),
(566, 'Inverter2', '31', 40, '1240', '2021-06-16', 'Jun', '3', 2021, 'Native', '2021-06-19'),
(568, 'Inverter2', '62.5', 40, '2500', '2021-06-18', 'Jun', '3', 2021, 'Native', '2021-06-19'),
(569, 'Inverter2', '10', 55, '550', '2021-06-18', 'Jun', '3', 2021, 'Native', '2021-06-19'),
(570, 'Inverter2', '10', 60, '600', '2021-06-18', 'Jun', '3', 2021, 'Native', '2021-06-19'),
(571, 'Inverter2', '4', 60, '240', '2021-06-18', 'Jun', '3', 2021, 'Native', '2021-06-19'),
(572, 'Inverter2', '5', 60, '300', '2021-06-18', 'Jun', '3', 2021, 'Native', '2021-06-19'),
(573, 'Inverter1', '30', 7, '210', '2021-06-09', 'Jun', 'Transformer1', 2021, 'Native', '2021-06-19'),
(574, 'Inverter2', '34', 40, '1360', '2021-06-19', 'Jun', '3', 2021, 'Native', '2021-06-30'),
(575, 'Inverter2', '34', 40, '1360', '2021-06-20', 'Jun', '3', 2021, 'Native', '2021-06-30'),
(576, 'Inverter2', '10', 55, '550', '2021-06-20', 'Jun', '3', 2021, 'Native', '2021-06-30'),
(577, 'Inverter2', '5', 55, '275', '2021-06-21', 'Jun', '3', 2021, 'Native', '2021-06-30'),
(578, 'Inverter2', '28', 40, '1120', '2021-06-21', 'Jun', '3', 2021, 'Native', '2021-06-30'),
(579, 'Inverter2', '34.5', 40, '1380', '2021-06-22', 'Jun', '3', 2021, 'Native', '2021-06-30'),
(580, 'Inverter2', '3', 60, '180', '2021-06-22', 'Jun', '3', 2021, 'Native', '2021-06-30'),
(581, 'Inverter2', '5', 60, '300', '2021-06-22', 'Jun', '3', 2021, 'Native', '2021-06-30'),
(582, 'Inverter2', '63', 40, '2520', '2021-06-23', 'Jun', '3', 2021, 'Native', '2021-06-30'),
(583, 'Inverter2', '33.5', 40, '1340', '2021-06-24', 'Jun', '3', 2021, 'Native', '2021-06-30'),
(584, 'Inverter2', '15', 55, '825', '2021-06-24', 'Jun', '3', 2021, 'Native', '2021-06-30'),
(585, 'Inverter2', '35', 40, '1400', '2021-06-25', 'Jun', '3', 2021, 'Native', '2021-06-30'),
(586, 'Inverter2', '38', 40, '1520', '2021-06-26', 'Jun', '3', 2021, 'Native', '2021-06-30'),
(587, 'Inverter2', '5', 60, '300', '2021-06-26', 'Jun', '3', 2021, 'Native', '2021-06-30'),
(588, 'Inverter2', '20', 55, '1100', '2021-06-26', 'Jun', '3', 2021, 'Native', '2021-06-30'),
(589, 'Inverter2', '5', 60, '300', '2021-06-27', 'Jun', '3', 2021, 'Native', '2021-06-30'),
(590, 'Inverter2', '35', 40, '1400', '2021-06-27', 'Jun', '3', 2021, 'Native', '2021-06-30'),
(591, 'Inverter2', '33.5', 40, '1340', '2021-06-28', 'Jun', '3', 2021, 'Native', '2021-06-30'),
(592, 'Inverter2', '30.5', 40, '1220', '2021-06-29', 'Jun', '3', 2021, 'Native', '2021-06-30'),
(593, 'Inverter2', '34', 55, '1870', '2021-06-29', 'Jun', '3', 2021, 'Native', '2021-06-30'),
(594, 'Inverter2', '28', 55, '1540', '2021-06-30', 'Jun', '3', 2021, 'Native', '2021-06-30'),
(595, 'Inverter2', '9', 55, '495', '2021-06-30', 'Jun', '3', 2021, 'Native', '2021-06-30'),
(596, 'Inverter2', '34.5', 40, '1380', '2021-07-01', 'Jul', '3', 2021, 'Native', '2021-07-05'),
(597, 'Inverter2', '30', 40, '1200', '2021-07-02', 'Jul', '3', 2021, 'Native', '2021-07-05'),
(598, 'Inverter2', '30', 40, '1200', '2021-07-03', 'Jul', '3', 2021, 'Native', '2021-07-05'),
(599, 'Inverter2', '10', 55, '550', '2021-07-03', 'Jul', '3', 2021, 'Native', '2021-07-05'),
(600, 'Inverter2', '30.5', 40, '1220', '2021-07-04', 'Jul', '3', 2021, 'Native', '2021-07-05'),
(601, 'Inverter2', '34', 40, '1360', '2021-07-05', 'Jul', '3', 2021, 'Native', '2021-07-05'),
(602, 'Inverter2', '5', 60, '300', '2021-07-05', 'Jul', '3', 2021, 'Native', '2021-07-05'),
(603, 'Inverter2', '5', 55, '275', '2021-07-05', 'Jul', '3', 2021, 'Native', '2021-07-05'),
(604, 'Inverter2', '5', 55, '275', '2021-07-05', 'Jul', '3', 2021, 'Native', '2021-07-05'),
(605, 'Inverter2', '33', 40, '1320', '2021-07-06', 'Jul', '3', 2021, 'Native', '2021-07-08'),
(606, 'Inverter2', '40', 55, '2200', '2021-07-06', 'Jul', '3', 2021, 'Native', '2021-07-08'),
(607, 'Inverter2', '35', 40, '1400', '2021-07-07', 'Jul', '3', 2021, 'Native', '2021-07-08'),
(608, 'Inverter2', '2.5', 60, '150', '2021-07-07', 'Jul', '3', 2021, 'Native', '2021-07-08'),
(609, 'Inverter2', '2.5', 60, '150', '2021-07-07', 'Jul', '3', 2021, 'Native', '2021-07-08'),
(610, 'Inverter2', '31', 40, '1240', '2021-07-08', 'Jul', '3', 2021, 'Native', '2021-07-09'),
(611, 'Inverter2', '37', 40, '1480', '2021-07-09', 'Jul', '3', 2021, 'Native', '2021-07-09'),
(612, 'Inverter2', '15', 55, '825', '2021-07-09', 'Jul', '3', 2021, 'Native', '2021-07-09'),
(613, 'Inverter2', '2.5', 60, '150', '2021-07-09', 'Jul', '3', 2021, 'Native', '2021-07-09'),
(614, 'Inverter2', '35', 40, '1400', '2021-07-10', 'Jul', '3', 2021, 'Native', '2021-07-20'),
(615, 'Inverter2', '32.5', 40, '1300', '2021-07-11', 'Jul', '3', 2021, 'Native', '2021-07-20'),
(616, 'Inverter2', '35', 40, '1400', '2021-07-12', 'Jul', '3', 2021, 'Native', '2021-07-20'),
(617, 'Inverter2', '15', 55, '825', '2021-07-12', 'Jul', '3', 2021, 'Native', '2021-07-20'),
(618, 'Inverter2', '10', 60, '600', '2021-07-12', 'Jul', '3', 2021, 'Native', '2021-07-20'),
(619, 'Inverter2', '34.5', 40, '1380', '2021-07-13', 'Jul', '3', 2021, 'Native', '2021-07-20'),
(620, 'Inverter2', '35', 40, '1400', '2021-07-14', 'Jul', '3', 2021, 'Native', '2021-07-20'),
(621, 'Inverter2', '50', 55, '2750', '2021-07-14', 'Jul', '3', 2021, 'Native', '2021-07-20'),
(622, 'Inverter2', '34.5', 40, '1380', '2021-07-15', 'Jul', '3', 2021, 'Native', '2021-07-20'),
(623, 'Inverter2', '33', 40, '1320', '2021-07-16', 'Jul', '3', 2021, 'Native', '2021-07-20'),
(624, 'Inverter2', '30', 40, '1200', '2021-07-17', 'Jul', '3', 2021, 'Native', '2021-07-20'),
(625, 'Inverter2', '20', 55, '1100', '2021-07-17', 'Jul', '3', 2021, 'Native', '2021-07-20'),
(626, 'Inverter2', '3', 55, '165', '2021-07-17', 'Jul', '3', 2021, 'Native', '2021-07-20'),
(627, 'Inverter2', '27', 40, '1080', '2021-07-18', 'Jul', '3', 2021, 'Native', '2021-07-20'),
(628, 'Inverter2', '5', 60, '300', '2021-07-18', 'Jul', '3', 2021, 'Native', '2021-07-20'),
(629, 'Inverter2', '3', 60, '180', '2021-07-18', 'Jul', '3', 2021, 'Native', '2021-07-20'),
(630, 'Inverter2', '10', 60, '600', '2021-07-19', 'Jul', '3', 2021, 'Native', '2021-07-20'),
(631, 'Inverter2', '25', 40, '1000', '2021-07-19', 'Jul', '3', 2021, 'Native', '2021-07-20'),
(632, 'Inverter2', '26', 40, '1040', '2021-07-20', 'Jul', '3', 2021, 'Native', '2021-07-31'),
(633, 'Inverter2', '25', 55, '1375', '2021-07-20', 'Jul', '3', 2021, 'Native', '2021-07-31'),
(634, 'Inverter2', '27', 40, '1080', '2021-07-21', 'Jul', '3', 2021, 'Native', '2021-07-31'),
(635, 'Inverter2', '27.5', 40, '1100', '2021-07-22', 'Jul', '3', 2021, 'Native', '2021-07-31'),
(636, 'Inverter2', '10', 55, '550', '2021-07-22', 'Jul', '3', 2021, 'Native', '2021-07-31'),
(637, 'Inverter2', '28', 40, '1120', '2021-07-23', 'Jul', '3', 2021, 'Native', '2021-07-31'),
(638, 'Inverter2', '25.5', 40, '1020', '2021-07-24', 'Jul', '3', 2021, 'Native', '2021-07-31'),
(639, 'Inverter2', '10', 55, '550', '2021-07-24', 'Jul', '3', 2021, 'Native', '2021-07-31'),
(640, 'Inverter2', '10', 55, '550', '2021-07-24', 'Jul', '3', 2021, 'Native', '2021-07-31'),
(641, 'Inverter2', '25.5', 40, '1020', '2021-07-25', 'Jul', '3', 2021, 'Native', '2021-07-31'),
(642, 'Inverter2', '25.5', 40, '1020', '2021-07-26', 'Jul', '3', 2021, 'Native', '2021-07-31'),
(643, 'Inverter2', '26.5', 40, '1060', '2021-07-27', 'Jul', '3', 2021, 'Native', '2021-07-31'),
(644, 'Inverter2', '27.5', 40, '1100', '2021-07-28', 'Jul', '3', 2021, 'Native', '2021-07-31'),
(645, 'Inverter2', '5', 60, '300', '2021-07-28', 'Jul', '3', 2021, 'Native', '2021-07-31'),
(646, 'Inverter2', '5', 60, '300', '2021-07-28', 'Jul', '3', 2021, 'Native', '2021-07-31'),
(647, 'Inverter2', '3', 60, '180', '2021-07-28', 'Jul', '3', 2021, 'Native', '2021-07-31'),
(648, 'Inverter2', '5', 60, '300', '2021-07-29', 'Jul', '3', 2021, 'Native', '2021-07-31'),
(649, 'Inverter2', '5', 60, '300', '2021-07-29', 'Jul', '3', 2021, 'Native', '2021-07-31'),
(653, 'Inverter2', '5', 60, '300', '2021-07-30', 'Jul', '3', 2021, 'Native', '2021-07-31'),
(654, 'Inverter2', '33', 40, '1320', '2021-07-31', 'Jul', '3', 2021, 'Native', '2021-07-31'),
(655, 'Inverter2', '50', 55, '2750', '2021-07-31', 'Jul', '3', 2021, 'Native', '2021-07-31'),
(656, 'Inverter2', '5', 55, '275', '2021-07-31', 'Jul', '3', 2021, 'Native', '2021-07-31'),
(657, 'Inverter5', '1', 9350, '9350', '2021-07-15', 'Aug', 'Transformer2', 2021, 'Native', '2021-08-01'),
(658, 'Inverter5', '1', 8500, '8500', '2021-07-18', 'Aug', 'Transformer2', 2021, 'Native', '2021-08-01'),
(659, 'Inverter5', '1', 9000, '9000', '2021-07-18', 'Aug', 'Transformer2', 2021, 'Native', '2021-08-01'),
(660, 'Inverter5', '1', 11050, '11050', '2021-07-14', 'Aug', 'Transformer2', 2021, 'Native', '2021-08-01'),
(661, 'Inverter5', '1', 11050, '11050', '2021-07-19', 'Aug', 'Transformer2', 2021, 'Native', '2021-08-01'),
(662, 'Inverter5', '1', 12750, '12750', '2021-07-18', 'Aug', 'Transformer2', 2021, 'Native', '2021-08-01'),
(663, 'Inverter5', '1', 14025, '14025', '2021-07-12', 'Aug', 'Transformer2', 2021, 'Native', '2021-08-01'),
(664, 'Inverter5', '1', 9350, '9350', '2021-07-12', 'Aug', 'Transformer2', 2021, 'Native', '2021-08-01'),
(665, 'Inverter5', '1', 9775, '9775', '2021-07-12', 'Aug', 'Transformer2', 2021, 'Native', '2021-08-01'),
(666, 'Inverter5', '1', 10625, '10625', '2021-07-12', 'Aug', 'Transformer2', 2021, 'Native', '2021-08-01'),
(667, 'Inverter5', '1', 10625, '10625', '2021-07-12', 'Aug', 'Transformer2', 2021, 'Native', '2021-08-01'),
(668, 'Inverter5', '1', 12325, '12325', '2021-07-12', 'Aug', 'Transformer2', 2021, 'Native', '2021-08-01'),
(669, 'Inverter5', '1', 10625, '10625', '2021-07-12', 'Aug', 'Transformer2', 2021, 'Native', '2021-08-01'),
(670, 'Inverter5', '1', 8925, '8925', '2021-07-12', 'Aug', 'Transformer2', 2021, 'Native', '2021-08-01'),
(671, 'Inverter5', '1', 10625, '10625', '2021-07-12', 'Aug', 'Transformer2', 2021, 'Native', '2021-08-01'),
(672, 'Inverter5', '1', 8925, '8925', '2021-08-18', 'Aug', 'Transformer2', 2021, 'Native', '2021-08-01'),
(673, 'Inverter5', '1', 8925, '8925', '2021-08-18', 'Aug', 'Transformer2', 2021, 'Native', '2021-08-01'),
(674, 'Inverter5', '1', 8075, '8075', '2021-07-12', 'Aug', 'Transformer2', 2021, 'Native', '2021-08-01'),
(675, 'Inverter5', '1', 10625, '10625', '2021-07-17', 'Aug', 'Transformer2', 2021, 'Native', '2021-08-01'),
(676, 'Inverter4', '2', 5650, '11300', '2021-07-17', 'Aug', 'Transformer2', 2021, 'Native', '2021-08-07'),
(677, 'Inverter4', '5', 9594, '47970', '2021-07-20', 'Aug', 'Transformer2', 2021, 'Native', '2021-08-07'),
(678, 'Inverter4', '4', 7020, '28080', '2021-07-20', 'Aug', 'Transformer2', 2021, 'Native', '2021-08-07'),
(679, 'Inverter4', '1', 8190, '8190', '2021-07-20', 'Aug', 'Transformer2', 2021, 'Native', '2021-08-07'),
(680, 'Inverter4', '1', 0, '0', '2021-07-20', 'Aug', 'Transformer2', 2021, 'Native', '2021-08-07'),
(681, 'Inverter3', ' 25', 944, '23600', '2021-07-07', 'Aug', 'Transformer1', 2021, 'Native', '2021-08-07'),
(682, 'Inverter4', '2', 11950, '23900', '2021-08-05', 'Aug', 'Transformer2', 2021, 'Native', '2021-08-07'),
(683, 'Inverter2', '1', 116200, '116200', '2021-07-17', 'Aug', 'Transformer2', 2021, 'Native', '2021-08-07'),
(684, 'Inverter2', '1', 83600, '83600', '2021-07-17', 'Aug', 'Transformer2', 2021, 'Native', '2021-08-07'),
(685, 'Inverter2', '1', 83600, '83600', '2021-07-17', 'Aug', 'Transformer2', 2021, 'Native', '2021-08-07'),
(686, 'Inverter2', '1', 68000, '68000', '2021-07-17', 'Aug', 'Transformer2', 2021, 'Native', '2021-08-07'),
(687, 'Inverter2', '4', 72050, '288200', '2021-07-19', 'Aug', 'Transformer2', 2021, 'Native', '2021-08-07'),
(688, 'Inverter2', '2', 63000, '126000', '2021-07-20', 'Aug', 'Transformer2', 2021, 'Native', '2021-08-07'),
(689, 'Inverter2', '2', 58000, '116000', '2021-07-20', 'Aug', 'Transformer2', 2021, 'Native', '2021-08-07'),
(690, 'Inverter2', '1', 80000, '80000', '2021-07-20', 'Aug', 'Transformer2', 2021, 'Native', '2021-08-07'),
(691, 'Inverter2', '1', 49000, '49000', '2021-07-20', 'Aug', 'Transformer2', 2021, 'Native', '2021-08-07'),
(692, 'Inverter2', '1', 45000, '45000', '2021-07-20', 'Aug', 'Transformer2', 2021, 'Native', '2021-08-07'),
(693, 'Inverter2', '1', 48500, '48500', '2021-07-20', 'Aug', 'Transformer2', 2021, 'Native', '2021-08-07'),
(694, 'Inverter2', '1', 47000, '47000', '2021-07-20', 'Aug', 'Transformer2', 2021, 'Native', '2021-08-07'),
(695, 'Inverter2', '27', 40, '1080', '2021-08-01', 'Aug', '3', 2021, 'Native', '2021-08-14'),
(696, 'Inverter2', '30', 40, '1200', '2021-08-02', 'Aug', '3', 2021, 'Native', '2021-08-14'),
(697, 'Inverter2', '10', 55, '550', '2021-08-02', 'Aug', '3', 2021, 'Native', '2021-08-14'),
(698, 'Inverter2', '5', 55, '275', '2021-08-02', 'Aug', '3', 2021, 'Native', '2021-08-14'),
(699, 'Inverter2', '27', 40, '1080', '2021-08-03', 'Aug', '3', 2021, 'Native', '2021-08-14'),
(700, 'Inverter2', '26', 40, '1040', '2021-08-04', 'Aug', '3', 2021, 'Native', '2021-08-14'),
(701, 'Inverter2', '26', 40, '1040', '2021-08-05', 'Aug', '3', 2021, 'Native', '2021-08-14'),
(702, 'Inverter2', '40', 55, '2200', '2021-08-05', 'Aug', '3', 2021, 'Native', '2021-08-14'),
(703, 'Inverter2', '28', 40, '1120', '2021-08-07', 'Aug', '3', 2021, 'Native', '2021-08-14'),
(704, 'Inverter2', '5', 55, '275', '2021-08-08', 'Aug', '3', 2021, 'Native', '2021-08-14'),
(705, 'Inverter2', '20', 55, '1100', '2021-08-08', 'Aug', '3', 2021, 'Native', '2021-08-14'),
(706, 'Inverter2', '15', 40, '600', '2021-08-08', 'Aug', '3', 2021, 'Native', '2021-08-14'),
(707, 'Inverter2', '26.5', 40, '1060', '2021-08-09', 'Aug', '3', 2021, 'Native', '2021-08-14'),
(708, 'Inverter2', '5', 55, '275', '2021-08-09', 'Aug', '3', 2021, 'Native', '2021-08-14'),
(709, 'Inverter2', '5', 55, '275', '2021-08-09', 'Aug', '3', 2021, 'Native', '2021-08-14'),
(710, 'Inverter2', '27.5', 60, '1650', '2021-08-10', 'Aug', '3', 2021, 'Native', '2021-08-14'),
(711, 'Inverter2', '26.5', 60, '1590', '2021-08-11', 'Aug', '3', 2021, 'Native', '2021-08-14'),
(712, 'Inverter2', '20', 55, '1100', '2021-08-11', 'Aug', '3', 2021, 'Native', '2021-08-14'),
(713, 'Inverter2', '2.5', 60, '150', '2021-08-11', 'Aug', '3', 2021, 'Native', '2021-08-14'),
(714, 'Inverter2', '2.5', 60, '150', '2021-08-11', 'Aug', '3', 2021, 'Native', '2021-08-14'),
(715, 'Inverter2', '20', 55, '1100', '2021-08-12', 'Aug', '3', 2021, 'Native', '2021-08-14'),
(716, 'Inverter2', '12', 40, '480', '2021-08-12', 'Aug', '3', 2021, 'Native', '2021-08-14'),
(717, 'Inverter2', '5', 55, '275', '2021-08-12', 'Aug', '3', 2021, 'Native', '2021-08-14'),
(718, 'Inverter2', '25', 40, '1000', '2021-08-13', 'Aug', '3', 2021, 'Native', '2021-08-14'),
(719, 'Inverter2', '24.5', 40, '980', '2021-08-14', 'Aug', '3', 2021, 'Native', '2021-08-14'),
(720, 'Inverter2', '30', 55, '1650', '2021-08-15', 'Aug', '3', 2021, 'Native', '2021-08-17'),
(721, 'Inverter2', '5', 60, '300', '2021-08-15', 'Aug', '3', 2021, 'Native', '2021-08-17'),
(722, 'Inverter2', '2', 60, '120', '2021-08-15', 'Aug', '3', 2021, 'Native', '2021-08-17'),
(723, 'Inverter2', '18', 40, '720', '2021-08-15', 'Aug', '3', 2021, 'Native', '2021-08-17'),
(724, 'Inverter2', '16', 40, '640', '2021-08-16', 'Aug', '3', 2021, 'Native', '2021-08-17'),
(725, 'Inverter2', '22', 40, '880', '2021-08-17', 'Aug', '3', 2021, 'Native', '2021-08-17'),
(726, 'Inverter2', '5', 60, '300', '2021-08-17', 'Aug', '3', 2021, 'Native', '2021-08-17'),
(727, 'Inverter2', '40', 55, '2200', '2021-08-17', 'Aug', '3', 2021, 'Native', '2021-08-17'),
(728, 'Inverter2', '10', 55, '550', '2021-08-17', 'Aug', '3', 2021, 'Native', '2021-08-17'),
(729, 'Inverter2', '5', 60, '300', '2021-08-17', 'Aug', '3', 2021, 'Native', '2021-08-17'),
(730, 'Inverter2', '25.5', 40, '1020', '2021-08-18', 'Aug', '3', 2021, 'Native', '2021-08-30'),
(731, 'Inverter2', '30', 55, '1650', '2021-08-19', 'Aug', '3', 2021, 'Native', '2021-08-30'),
(732, 'Inverter2', '28.5', 40, '1140', '2021-08-19', 'Aug', '3', 2021, 'Native', '2021-08-30'),
(733, 'Inverter2', '27', 40, '1080', '2021-08-20', 'Aug', '3', 2021, 'Native', '2021-08-30'),
(734, 'Inverter2', '5', 60, '300', '2021-08-20', 'Aug', '3', 2021, 'Native', '2021-08-30'),
(735, 'Inverter2', '5', 60, '300', '2021-08-20', 'Aug', '3', 2021, 'Native', '2021-08-30'),
(736, 'Inverter2', '5', 55, '275', '2021-08-20', 'Aug', '3', 2021, 'Native', '2021-08-30');
INSERT INTO `tbl_sales` (`id`, `source`, `amount`, `rate`, `totalcost`, `salesdate`, `month`, `product`, `year`, `breed`, `trn_date`) VALUES
(737, 'Inverter2', '3.5', 55, '192.5', '2021-08-21', 'Aug', '3', 2021, 'Native', '2021-08-30'),
(738, 'Inverter2', '26', 40, '1040', '2021-08-21', 'Aug', '3', 2021, 'Native', '2021-08-30'),
(739, 'Inverter2', '33', 40, '1320', '2021-08-22', 'Aug', '3', 2021, 'Native', '2021-08-30'),
(740, 'Inverter2', '45', 55, '2475', '2021-08-22', 'Aug', '3', 2021, 'Native', '2021-08-30'),
(741, 'Inverter2', '5', 60, '300', '2021-08-22', 'Aug', '3', 2021, 'Native', '2021-08-30'),
(742, 'Inverter2', '31.5', 40, '1260', '2021-08-23', 'Aug', '3', 2021, 'Native', '2021-08-30'),
(743, 'Inverter2', '26', 40, '1040', '2021-08-24', 'Aug', '3', 2021, 'Native', '2021-08-30'),
(744, 'Inverter2', '5', 60, '300', '2021-08-24', 'Aug', '3', 2021, 'Native', '2021-08-30'),
(745, 'Inverter2', '10', 55, '550', '2021-08-24', 'Aug', '3', 2021, 'Native', '2021-08-30'),
(746, 'Inverter2', '27', 55, '1485', '2021-08-25', 'Aug', '3', 2021, 'Native', '2021-08-30'),
(747, 'Inverter2', '27', 40, '1080', '2021-08-25', 'Aug', '3', 2021, 'Native', '2021-08-30'),
(748, 'Inverter2', '24', 40, '960', '2021-08-26', 'Aug', '3', 2021, 'Native', '2021-08-30'),
(749, 'Inverter2', '20', 55, '1100', '2021-08-26', 'Aug', '3', 2021, 'Native', '2021-08-30'),
(750, 'Inverter2', '29', 40, '1160', '2021-08-27', 'Aug', '3', 2021, 'Native', '2021-08-30'),
(751, 'Inverter2', '26', 40, '1040', '2021-08-28', 'Aug', '3', 2021, 'Native', '2021-08-30'),
(752, 'Inverter2', '10', 60, '600', '2021-08-28', 'Aug', '3', 2021, 'Native', '2021-08-30'),
(753, 'Inverter2', '8', 60, '480', '2021-08-28', 'Aug', '3', 2021, 'Native', '2021-08-30'),
(754, 'Inverter2', '5', 60, '300', '2021-08-28', 'Aug', '3', 2021, 'Native', '2021-08-30'),
(755, 'Inverter2', '28', 40, '1120', '2021-08-29', 'Aug', '3', 2021, 'Native', '2021-08-30'),
(756, 'Inverter2', '23.5', 55, '1292.5', '2021-08-29', 'Aug', '3', 2021, 'Native', '2021-08-30'),
(757, 'Inverter2', '19', 40, '760', '2021-08-30', 'Aug', '3', 2021, 'Native', '2021-08-30'),
(758, 'Inverter2', '5', 55, '275', '2021-08-30', 'Aug', '3', 2021, 'Native', '2021-08-30'),
(759, 'Inverter2', '21', 40, '840', '2021-08-30', 'Aug', '3', 2021, 'Native', '2021-08-30'),
(760, 'Inverter2', '26', 40, '1040', '2021-08-31', 'Aug', '3', 2021, 'Native', '2021-08-31'),
(761, 'Inverter2', '20', 55, '1100', '2021-08-31', 'Aug', '3', 2021, 'Native', '2021-08-31'),
(762, 'Inverter2', '46.5', 55, '2557.5', '2021-08-31', 'Aug', '3', 2021, 'Native', '2021-08-31'),
(763, 'Inverter2', '20', 55, '1100', '2021-08-31', 'Aug', '3', 2021, 'Native', '2021-08-31'),
(766, 'Inverter2', '25', 45, '1125', '2021-09-01', 'Sep', '3', 2021, 'Native', '2021-09-09'),
(769, 'Inverter2', '24', 45, '1080', '2021-09-02', 'Sep', '3', 2021, 'Native', '2021-09-09'),
(770, 'Inverter2', '25', 45, '1125', '2021-09-03', 'Sep', '3', 2021, 'Native', '2021-09-09'),
(772, 'Inverter2', '23', 45, '1035', '2021-09-04', 'Sep', '3', 2021, 'Native', '2021-09-09'),
(773, 'Inverter2', '30', 45, '1350', '2021-09-05', 'Sep', '3', 2021, 'Native', '2021-09-09'),
(776, 'Inverter2', '28', 45, '1260', '2021-09-06', 'Sep', '3', 2021, 'Native', '2021-09-09'),
(777, 'Inverter2', '30', 45, '1350', '2021-09-07', 'Sep', '3', 2021, 'Native', '2021-09-09'),
(780, 'Inverter2', '30', 45, '1350', '2021-09-08', 'Sep', '3', 2021, 'Native', '2021-09-09'),
(781, 'Inverter2', '28', 45, '1260', '2021-09-09', 'Sep', '3', 2021, 'Native', '2021-09-09'),
(782, 'Inverter2', '31', 45, '1395', '2021-09-10', 'Sep', '3', 2021, 'Native', '2021-09-11'),
(783, 'Inverter2', '28', 45, '1260', '2021-09-11', 'Sep', '3', 2021, 'Native', '2021-09-11'),
(785, 'Inverter2', '32', 45, '1440', '2021-09-12', 'Sep', '3', 2021, 'Native', '2021-09-12'),
(786, 'Inverter2', '27', 45, '1215', '2021-09-13', 'Sep', '3', 2021, 'Native', '2021-09-13'),
(787, 'Inverter2', '34', 45, '1530', '2021-09-14', 'Sep', '3', 2021, 'Native', '2021-09-14'),
(788, 'Inverter2', '5', 60, '300', '2021-09-01', 'Sep', '3', 2021, 'Native', '2021-09-19'),
(789, 'Inverter2', '35', 55, '1925', '2021-09-01', 'Sep', '3', 2021, 'Native', '2021-09-19'),
(790, 'Inverter2', '5', 60, '300', '2021-09-01', 'Sep', '3', 2021, 'Native', '2021-09-19'),
(791, 'Inverter2', '5', 60, '300', '2021-09-02', 'Sep', '3', 2021, 'Native', '2021-09-19'),
(792, 'Inverter2', '1', 60, '60', '2021-09-02', 'Sep', '3', 2021, 'Native', '2021-09-19'),
(793, 'Inverter2', '1', 60, '60', '2021-09-05', 'Sep', '3', 2021, 'Native', '2021-09-19'),
(794, 'Inverter2', '.5', 60, '30', '2021-09-05', 'Sep', '3', 2021, 'Native', '2021-09-19'),
(795, 'Inverter2', '15', 55, '825', '2021-09-05', 'Sep', '3', 2021, 'Native', '2021-09-19'),
(796, 'Inverter2', '50', 55, '2750', '2021-09-05', 'Sep', '3', 2021, 'Native', '2021-09-19'),
(797, 'Inverter2', '2', 60, '120', '2021-09-06', 'Sep', '3', 2021, 'Native', '2021-09-19'),
(798, 'Inverter2', '30', 55, '1650', '2021-09-07', 'Sep', '3', 2021, 'Native', '2021-09-19'),
(799, 'Inverter2', '10', 55, '550', '2021-09-07', 'Sep', '3', 2021, 'Native', '2021-09-19'),
(801, 'Inverter2', '5', 60, '300', '2021-09-08', 'Sep', '3', 2021, 'Native', '2021-09-19'),
(802, 'Inverter2', '5', 60, '300', '2021-09-09', 'Sep', '3', 2021, 'Native', '2021-09-19'),
(803, 'Inverter2', '4', 60, '240', '2021-09-09', 'Sep', '3', 2021, 'Native', '2021-09-19'),
(804, 'Inverter2', '5', 60, '300', '2021-09-09', 'Sep', '3', 2021, 'Native', '2021-09-19'),
(805, 'Inverter2', '5', 60, '300', '2021-09-09', 'Sep', '3', 2021, 'Native', '2021-09-19'),
(806, 'Inverter2', '.5', 60, '30', '2021-09-11', 'Sep', '3', 2021, 'Native', '2021-09-19'),
(807, 'Inverter2', '1', 60, '60', '2021-09-11', 'Sep', '3', 2021, 'Native', '2021-09-19'),
(808, 'Inverter2', '5', 60, '300', '2021-09-12', 'Sep', '3', 2021, 'Native', '2021-09-19'),
(809, 'Inverter2', '50', 55, '2750', '2021-09-12', 'Sep', '3', 2021, 'Native', '2021-09-19'),
(810, 'Inverter2', '10', 60, '600', '2021-09-12', 'Sep', '3', 2021, 'Native', '2021-09-19'),
(811, 'Inverter2', '5', 60, '300', '2021-09-12', 'Sep', '3', 2021, 'Native', '2021-09-19'),
(812, 'Inverter2', '.5', 60, '30', '2021-09-12', 'Sep', '3', 2021, 'Native', '2021-09-19'),
(813, 'Inverter2', '5', 60, '300', '2021-09-13', 'Sep', '3', 2021, 'Native', '2021-09-19'),
(814, 'Inverter2', '3', 60, '180', '2021-09-14', 'Sep', '3', 2021, 'Native', '2021-09-19'),
(816, 'Inverter2', '5', 60, '300', '2021-09-14', 'Sep', '3', 2021, 'Native', '2021-09-19'),
(817, 'Inverter2', '47', 45, '2115', '2021-09-15', 'Sep', '3', 2021, 'Native', '2021-09-19'),
(818, 'Inverter2', '10', 60, '600', '2021-09-15', 'Sep', '3', 2021, 'Native', '2021-09-19'),
(819, 'Inverter2', '5', 60, '300', '2021-09-16', 'Sep', '3', 2021, 'Native', '2021-09-19'),
(820, 'Inverter2', '49', 45, '2205', '2021-09-16', 'Sep', '3', 2021, 'Native', '2021-09-19'),
(821, 'Inverter2', '47', 45, '2115', '2021-09-17', 'Sep', '3', 2021, 'Native', '2021-09-19'),
(823, 'Inverter2', '.5', 60, '30', '2021-09-17', 'Sep', '3', 2021, 'Native', '2021-09-19'),
(824, 'Inverter2', '5', 60, '300', '2021-09-17', 'Sep', '3', 2021, 'Native', '2021-09-19'),
(825, 'Inverter2', '69', 45, '3105', '2021-09-18', 'Sep', '3', 2021, 'Native', '2021-09-19'),
(826, 'Inverter2', '70', 45, '3150', '2021-09-19', 'Sep', '3', 2021, 'Native', '2021-09-19'),
(827, 'Inverter2', '73.5', 45, '3307.5', '2021-09-20', 'Sep', '3', 2021, 'Native', '2021-09-20'),
(828, 'Inverter2', '30', 55, '1650', '2021-09-20', 'Sep', '3', 2021, 'Native', '2021-09-20'),
(829, 'Inverter2', '3', 60, '180', '2021-09-20', 'Sep', '3', 2021, 'Native', '2021-09-20'),
(830, 'Inverter2', '3', 60, '180', '2021-09-20', 'Sep', '3', 2021, 'Native', '2021-09-20'),
(831, 'Inverter2', '1', 60, '60', '2021-09-20', 'Sep', '3', 2021, 'Native', '2021-09-20'),
(832, 'Inverter2', '25', 55, '1375', '2021-09-20', 'Sep', '3', 2021, 'Native', '2021-09-20'),
(834, 'Inverter2', '73', 45, '3285', '2021-09-21', 'Sep', '3', 2021, 'Native', '2021-09-21'),
(835, 'Inverter2', '3', 60, '180', '2021-09-21', 'Sep', '3', 2021, 'Native', '2021-09-21'),
(836, 'Inverter2', '4', 60, '240', '2021-09-21', 'Sep', '3', 2021, 'Native', '2021-09-21'),
(837, 'Inverter2', '.5', 60, '30', '2021-09-21', 'Sep', '3', 2021, 'Native', '2021-09-21'),
(838, 'Inverter2', '17', 55, '935', '2021-09-21', 'Sep', '3', 2021, 'Native', '2021-09-21'),
(839, 'Inverter2', '46', 45, '2070', '2021-09-22', 'Sep', '3', 2021, 'Native', '2021-09-22'),
(840, 'Inverter2', '3', 60, '180', '2021-09-22', 'Sep', '3', 2021, 'Native', '2021-09-22'),
(841, 'Inverter2', '10', 60, '600', '2021-09-22', 'Sep', '3', 2021, 'Native', '2021-09-22'),
(843, 'Inverter2', '47', 45, '2115', '2021-09-23', 'Sep', '3', 2021, 'Native', '2021-09-23'),
(844, 'Inverter2', '30', 55, '1650', '2021-09-23', 'Sep', '3', 2021, 'Native', '2021-09-23'),
(845, 'Inverter2', '4.5', 60, '270', '2021-09-23', 'Sep', '3', 2021, 'Native', '2021-09-23'),
(847, 'Inverter2', '47', 45, '2115', '2021-09-24', 'Sep', '3', 2021, 'Native', '2021-09-24'),
(848, 'Inverter2', '5', 55, '275', '2021-09-24', 'Sep', '3', 2021, 'Native', '2021-09-24'),
(849, 'Inverter2', '50', 45, '2250', '2021-09-25', 'Sep', '3', 2021, 'Native', '2021-09-25'),
(850, 'Inverter2', '2', 60, '120', '2021-09-25', 'Sep', '3', 2021, 'Native', '2021-09-25'),
(851, 'Inverter2', '3', 60, '180', '2021-09-25', 'Sep', '3', 2021, 'Native', '2021-09-25'),
(852, 'Inverter2', '5', 60, '300', '2021-09-25', 'Sep', '3', 2021, 'Native', '2021-09-25'),
(853, 'Inverter2', '5', 60, '300', '2021-09-25', 'Sep', '3', 2021, 'Native', '2021-09-25'),
(854, 'Inverter2', '30', 55, '1650', '2021-09-25', 'Sep', '3', 2021, 'Native', '2021-09-25'),
(855, 'Inverter2', '5', 60, '300', '2021-09-25', 'Sep', '3', 2021, 'Native', '2021-09-25'),
(856, 'Inverter2', '5', 60, '300', '2021-09-25', 'Sep', '3', 2021, 'Native', '2021-09-25'),
(857, 'Inverter2', '36', 45, '1620', '2021-09-26', 'Sep', '3', 2021, 'Native', '2021-09-26'),
(858, 'Inverter2', '7', 60, '420', '2021-09-26', 'Sep', '3', 2021, 'Native', '2021-09-26'),
(859, 'Inverter2', '2', 60, '120', '2021-09-26', 'Sep', '3', 2021, 'Native', '2021-09-26'),
(860, 'Inverter2', '44.5', 45, '2002.5', '2021-09-27', 'Sep', '3', 2021, 'Native', '2021-09-27'),
(861, 'Inverter2', '5', 60, '300', '2021-09-27', 'Sep', '3', 2021, 'Native', '2021-09-27'),
(862, 'Inverter2', '45', 45, '2025', '2021-09-28', 'Sep', '3', 2021, 'Native', '2021-09-28'),
(863, 'Inverter2', '.5', 60, '30', '2021-09-28', 'Sep', '3', 2021, 'Native', '2021-09-28'),
(864, 'Inverter2', '5', 60, '300', '2021-09-28', 'Sep', '3', 2021, 'Native', '2021-09-28'),
(865, 'Inverter2', '2', 60, '120', '2021-09-28', 'Sep', '3', 2021, 'Native', '2021-09-28'),
(866, 'Inverter2', '.5', 60, '30', '2021-09-28', 'Sep', '3', 2021, 'Native', '2021-09-28'),
(867, 'Inverter2', '47.5', 45, '2137.5', '2021-09-29', 'Sep', '3', 2021, 'Native', '2021-09-29'),
(868, 'Inverter2', '14', 55, '770', '2021-09-29', 'Sep', '3', 2021, 'Native', '2021-09-29'),
(869, 'Inverter2', '1', 60, '60', '2021-09-29', 'Sep', '3', 2021, 'Native', '2021-09-29'),
(870, 'Inverter2', '5', 60, '300', '2021-09-30', 'Sep', '3', 2021, 'Native', '2021-09-30'),
(871, 'Inverter2', '5', 60, '300', '2021-09-30', 'Sep', '3', 2021, 'Native', '2021-09-30'),
(872, 'Inverter2', '37', 45, '1665', '2021-09-30', 'Sep', '3', 2021, 'Native', '2021-09-30'),
(873, 'Inverter2', '.5', 60, '30', '2021-09-30', 'Sep', '3', 2021, 'Native', '2021-09-30'),
(874, 'Inverter2', '71', 45, '3195', '2021-10-01', 'Oct', '3', 2021, 'Native', '2021-10-01'),
(875, 'Inverter2', '50', 45, '2250', '2021-10-02', 'Oct', '3', 2021, 'Native', '2021-10-02'),
(876, 'Inverter2', '49.5', 45, '2227.5', '2021-10-03', 'Oct', '3', 2021, 'Native', '2021-10-03'),
(877, 'Inverter2', '45', 55, '2475', '2021-10-03', 'Oct', '3', 2021, 'Native', '2021-10-03'),
(878, 'Inverter2', '5', 60, '300', '2021-10-03', 'Oct', '3', 2021, 'Native', '2021-10-03'),
(879, 'Inverter2', '.5', 60, '30', '2021-10-03', 'Oct', '3', 2021, 'Native', '2021-10-03'),
(880, 'Inverter2', '49', 45, '2205', '2021-10-04', 'Oct', '3', 2021, 'Native', '2021-10-04'),
(881, 'Inverter2', '5', 60, '300', '2021-10-04', 'Oct', '3', 2021, 'Native', '2021-10-04'),
(882, 'Inverter2', '5', 60, '300', '2021-10-04', 'Oct', '3', 2021, 'Native', '2021-10-04'),
(883, 'Inverter2', '.5', 60, '30', '2021-10-04', 'Oct', '3', 2021, 'Native', '2021-10-04'),
(884, 'Inverter2', '50', 45, '2250', '2021-10-05', 'Oct', '3', 2021, 'Native', '2021-10-05'),
(885, 'Inverter2', '7', 60, '420', '2021-10-05', 'Oct', '3', 2021, 'Native', '2021-10-05'),
(886, 'Inverter2', '5', 60, '300', '2021-10-05', 'Oct', '3', 2021, 'Native', '2021-10-05'),
(887, 'Inverter2', '.5', 60, '30', '2021-10-05', 'Oct', '3', 2021, 'Native', '2021-10-05'),
(888, 'Inverter2', '76', 45, '3420', '2021-10-06', 'Oct', '3', 2021, 'Native', '2021-10-06'),
(889, 'Inverter2', '.5', 60, '30', '2021-10-06', 'Oct', '3', 2021, 'Native', '2021-10-06'),
(890, 'Inverter2', '.5', 60, '30', '2021-10-06', 'Oct', '3', 2021, 'Native', '2021-10-06'),
(891, 'Inverter2', '70', 45, '3150', '2021-10-07', 'Oct', '3', 2021, 'Native', '2021-10-07'),
(892, 'Inverter2', '18', 60, '1080', '2021-10-07', 'Oct', '3', 2021, 'Native', '2021-10-07'),
(893, 'Inverter2', '20', 55, '1100', '2021-10-07', 'Oct', '3', 2021, 'Native', '2021-10-07'),
(894, 'Inverter2', '5', 60, '300', '2021-10-07', 'Oct', '3', 2021, 'Native', '2021-10-07'),
(895, 'Inverter2', '55', 45, '2475', '2021-10-08', 'Oct', '3', 2021, 'Native', '2021-10-09'),
(896, 'Inverter2', '70.5', 45, '3172.5', '2021-10-09', 'Oct', '3', 2021, 'Native', '2021-10-09'),
(897, 'Inverter2', '71', 45, '3195', '2021-10-10', 'Oct', '3', 2021, 'Native', '2021-10-10'),
(898, 'Inverter2', '15', 55, '825', '2021-10-10', 'Oct', '3', 2021, 'Native', '2021-10-10'),
(899, 'Inverter2', '5', 60, '300', '2021-10-10', 'Oct', '3', 2021, 'Native', '2021-10-10'),
(900, 'Inverter2', '.5', 60, '30', '2021-10-10', 'Oct', '3', 2021, 'Native', '2021-10-10'),
(901, 'Inverter2', '51.5', 45, '2317.5', '2021-10-11', 'Oct', '3', 2021, 'Native', '2021-10-11'),
(902, 'Inverter2', '.5', 60, '30', '2021-10-11', 'Oct', '3', 2021, 'Native', '2021-10-11'),
(903, 'Inverter2', '5', 60, '300', '2021-10-11', 'Oct', '3', 2021, 'Native', '2021-10-11'),
(904, 'Inverter2', '21', 55, '1155', '2021-10-12', 'Oct', '3', 2021, 'Native', '2021-10-12'),
(905, 'Inverter2', '5', 60, '300', '2021-10-12', 'Oct', '3', 2021, 'Native', '2021-10-12'),
(906, 'Inverter2', '52.5', 45, '2362.5', '2021-10-12', 'Oct', '3', 2021, 'Native', '2021-10-12'),
(907, 'Inverter2', '51', 45, '2295', '2021-10-13', 'Oct', '3', 2021, 'Native', '2021-10-13'),
(908, 'Inverter2', '5', 60, '300', '2021-10-13', 'Oct', '3', 2021, 'Native', '2021-10-13'),
(909, 'Inverter2', '.5', 60, '30', '2021-10-13', 'Oct', '3', 2021, 'Native', '2021-10-13'),
(910, 'Inverter2', '5', 60, '300', '2021-10-13', 'Oct', '3', 2021, 'Native', '2021-10-13'),
(911, 'Inverter2', '51', 45, '2295', '2021-10-14', 'Oct', '3', 2021, 'Native', '2021-10-14'),
(912, 'Inverter2', '15', 55, '825', '2021-10-14', 'Oct', '3', 2021, 'Native', '2021-10-14'),
(913, 'Inverter2', '5', 60, '300', '2021-10-14', 'Oct', '3', 2021, 'Native', '2021-10-14'),
(914, 'Inverter2', '.5', 60, '30', '2021-10-14', 'Oct', '3', 2021, 'Native', '2021-10-14'),
(915, 'Inverter2', '2', 60, '120', '2021-10-14', 'Oct', '3', 2021, 'Native', '2021-10-14'),
(916, 'Inverter2', '72', 45, '3240', '2021-10-15', 'Oct', '3', 2021, 'Native', '2021-10-16'),
(918, 'Inverter2', '12', 55, '660', '2021-10-15', 'Oct', '3', 2021, 'Native', '2021-10-16'),
(920, 'Inverter2', '51', 45, '2295', '2021-10-16', 'Oct', '3', 2021, 'Native', '2021-10-16'),
(921, 'Inverter2', '.5', 60, '30', '2021-10-16', 'Oct', '3', 2021, 'Native', '2021-10-16'),
(922, 'Inverter2', '49', 45, '2205', '2021-10-17', 'Oct', '3', 2021, 'Native', '2021-10-17'),
(923, 'Inverter2', '.5', 60, '30', '2021-10-17', 'Oct', '3', 2021, 'Native', '2021-10-17'),
(925, 'Inverter3', '23', 10, '230', '2021-10-16', 'Oct', 'Transformer1', 2021, 'Native', '2021-10-18'),
(926, 'Inverter2', '48', 45, '2160', '2021-10-18', 'Oct', '3', 2021, 'Native', '2021-10-18'),
(927, 'Inverter2', '5', 60, '300', '2021-10-18', 'Oct', '3', 2021, 'Native', '2021-10-18'),
(928, 'Inverter2', '.5', 60, '30', '2021-10-19', 'Oct', '3', 2021, 'Native', '2021-10-19'),
(929, 'Inverter2', '5', 55, '275', '2021-10-19', 'Oct', '3', 2021, 'Native', '2021-10-19'),
(930, 'Inverter2', '44', 45, '1980', '2021-10-19', 'Oct', '3', 2021, 'Native', '2021-10-19'),
(931, 'Inverter2', '48', 45, '2160', '2021-10-20', 'Oct', '3', 2021, 'Native', '2021-10-20'),
(932, 'Inverter2', '5', 60, '300', '2021-10-21', 'Oct', '3', 2021, 'Native', '2021-10-21'),
(933, 'Inverter2', '5', 60, '300', '2021-10-21', 'Oct', '3', 2021, 'Native', '2021-10-21'),
(934, 'Inverter2', '10', 55, '550', '2021-10-21', 'Oct', '3', 2021, 'Native', '2021-10-21'),
(935, 'Inverter2', '30', 55, '1650', '2021-10-21', 'Oct', '3', 2021, 'Native', '2021-10-21'),
(936, 'Inverter2', '5', 60, '300', '2021-10-21', 'Oct', '3', 2021, 'Native', '2021-10-21'),
(937, 'Inverter2', '2', 60, '120', '2021-10-21', 'Oct', '3', 2021, 'Native', '2021-10-21'),
(938, 'Inverter2', '44', 45, '1980', '2021-10-21', 'Oct', '3', 2021, 'Native', '2021-10-21'),
(939, 'Inverter2', '44', 45, '1980', '2021-10-22', 'Oct', '3', 2021, 'Native', '2021-10-22'),
(940, 'Inverter2', '10.5', 60, '630', '2021-10-22', 'Oct', '3', 2021, 'Native', '2021-10-22'),
(941, 'Inverter2', '42', 45, '1890', '2021-10-23', 'Oct', '3', 2021, 'Native', '2021-10-23'),
(942, 'Inverter2', '42', 45, '1890', '2021-10-24', 'Oct', '3', 2021, 'Native', '2021-10-24'),
(943, 'Inverter2', '1', 60, '60', '2021-10-24', 'Oct', '3', 2021, 'Native', '2021-10-24'),
(944, 'Inverter2', '1', 60, '60', '2021-10-24', 'Oct', '3', 2021, 'Native', '2021-10-24'),
(945, 'Inverter2', '42.5', 45, '1912.5', '2021-10-25', 'Oct', '3', 2021, 'Native', '2021-10-25'),
(946, 'Inverter2', '2', 55, '110', '2021-10-25', 'Oct', '3', 2021, 'Native', '2021-10-25'),
(947, 'Inverter2', '5', 60, '300', '2021-10-25', 'Oct', '3', 2021, 'Native', '2021-10-25'),
(948, 'Inverter2', '.5', 60, '30', '2021-10-25', 'Oct', '3', 2021, 'Native', '2021-10-25'),
(949, 'Inverter2', '3.5', 60, '210', '2021-10-25', 'Oct', '3', 2021, 'Native', '2021-10-25'),
(950, 'Inverter2', '43', 45, '1935', '2021-10-26', 'Oct', '3', 2021, 'Native', '2021-10-26'),
(951, 'Inverter2', '42.5', 45, '1912.5', '2021-10-27', 'Oct', '3', 2021, 'Native', '2021-10-27'),
(952, 'Inverter2', '5', 60, '300', '2021-10-27', 'Oct', '3', 2021, 'Native', '2021-10-27'),
(953, 'Inverter2', '5', 60, '300', '2021-10-27', 'Oct', '3', 2021, 'Native', '2021-10-27'),
(954, 'Inverter2', '5', 60, '300', '2021-10-27', 'Oct', '3', 2021, 'Native', '2021-10-27'),
(955, 'Inverter2', '5', 60, '300', '2021-10-27', 'Oct', '3', 2021, 'Native', '2021-10-27'),
(956, 'Inverter2', '.5', 60, '30', '2021-10-27', 'Oct', '3', 2021, 'Native', '2021-10-27'),
(957, 'Inverter2', '10', 60, '600', '2021-10-27', 'Oct', '3', 2021, 'Native', '2021-10-27'),
(958, 'Inverter2', '7', 60, '420', '2021-10-28', 'Oct', '3', 2021, 'Native', '2021-10-28'),
(959, 'Inverter2', '41', 45, '1845', '2021-10-28', 'Oct', '3', 2021, 'Native', '2021-10-28'),
(960, 'Inverter2', '38', 45, '1710', '2021-10-29', 'Oct', '3', 2021, 'Native', '2021-10-30'),
(961, 'Inverter2', '52', 55, '2860', '2021-10-29', 'Oct', '3', 2021, 'Native', '2021-10-30'),
(963, 'Inverter2', '27', 55, '1485', '2021-10-30', 'Oct', '3', 2021, 'Native', '2021-10-30'),
(964, 'Inverter2', '45', 45, '2025', '2021-10-30', 'Oct', '3', 2021, 'Native', '2021-10-30'),
(965, 'Inverter2', '5', 55, '275', '2021-10-30', 'Oct', '3', 2021, 'Native', '2021-10-30'),
(966, 'Inverter2', '2', 60, '120', '2021-10-30', 'Oct', '3', 2021, 'Native', '2021-10-30'),
(967, 'Inverter2', '.5', 60, '30', '2021-10-30', 'Oct', '3', 2021, 'Native', '2021-10-30'),
(968, 'Inverter2', '43', 45, '1935', '2021-10-31', 'Oct', '3', 2021, 'Native', '2021-10-31'),
(969, 'Inverter2', '.5', 60, '30', '2021-10-31', 'Oct', '3', 2021, 'Native', '2021-10-31'),
(970, 'Inverter2', '2', 60, '120', '2021-10-31', 'Oct', '3', 2021, 'Native', '2021-10-31'),
(971, 'Inverter2', '47', 45, '2115', '2021-11-01', 'Nov', '3', 2021, 'Native', '2021-11-01'),
(972, 'Inverter2', '10', 55, '550', '2021-11-01', 'Nov', '3', 2021, 'Native', '2021-11-02'),
(973, 'Inverter2', '10', 55, '550', '2021-11-01', 'Nov', '3', 2021, 'Native', '2021-11-02'),
(974, 'Inverter2', '5', 60, '300', '2021-11-02', 'Nov', '3', 2021, 'Native', '2021-11-02'),
(975, 'Inverter2', '5', 55, '275', '2021-11-02', 'Nov', '3', 2021, 'Native', '2021-11-02'),
(976, 'Inverter2', '47', 45, '2115', '2021-11-02', 'Nov', '3', 2021, 'Native', '2021-11-02'),
(977, 'Inverter2', '46', 45, '2070', '2021-11-03', 'Nov', '3', 2021, 'Native', '2021-11-03'),
(978, 'Inverter2', '2', 55, '110', '2021-11-03', 'Nov', '3', 2021, 'Native', '2021-11-03'),
(979, 'Inverter2', '5', 55, '275', '2021-11-03', 'Nov', '3', 2021, 'Native', '2021-11-03'),
(980, 'Inverter2', '5', 60, '300', '2021-11-03', 'Nov', '3', 2021, 'Native', '2021-11-03'),
(981, 'Inverter2', '44', 45, '1980', '2021-11-04', 'Nov', '3', 2021, 'Native', '2021-11-04'),
(982, 'Inverter2', '5', 60, '300', '2021-11-04', 'Nov', '3', 2021, 'Native', '2021-11-04'),
(983, 'Inverter2', '5', 60, '300', '2021-11-04', 'Nov', '3', 2021, 'Native', '2021-11-04'),
(984, 'Inverter2', '.5', 60, '30', '2021-11-04', 'Nov', '3', 2021, 'Native', '2021-11-04'),
(985, 'Inverter2', '13', 55, '715', '2021-11-04', 'Nov', '3', 2021, 'Native', '2021-11-04'),
(986, 'Inverter2', '2', 60, '120', '2021-11-04', 'Nov', '3', 2021, 'Native', '2021-11-04'),
(987, 'Inverter2', '5', 60, '300', '2021-11-04', 'Nov', '3', 2021, 'Native', '2021-11-04'),
(988, 'Inverter2', '5', 60, '300', '2021-11-05', 'Nov', '3', 2021, 'Native', '2021-11-06'),
(990, 'Inverter2', '37', 45, '1665', '2021-11-05', 'Nov', '3', 2021, 'Native', '2021-11-06'),
(991, 'Inverter2', '7', 55, '385', '2021-11-05', 'Nov', '3', 2021, 'Native', '2021-11-06'),
(992, 'Inverter2', '44', 45, '1980', '2021-11-06', 'Nov', '3', 2021, 'Native', '2021-11-06'),
(993, 'Inverter2', '5', 60, '300', '2021-11-06', 'Nov', '3', 2021, 'Native', '2021-11-06'),
(994, 'Inverter2', '5', 60, '300', '2021-11-06', 'Nov', '3', 2021, 'Native', '2021-11-06'),
(995, 'Inverter2', '.5', 60, '30', '2021-11-06', 'Nov', '3', 2021, 'Native', '2021-11-06'),
(996, 'Inverter2', '2', 60, '120', '2021-11-06', 'Nov', '3', 2021, 'Native', '2021-11-06'),
(997, 'Inverter2', '3.5', 60, '210', '2021-11-06', 'Nov', '3', 2021, 'Native', '2021-11-06'),
(998, 'Inverter2', '38', 55, '2090', '2021-11-06', 'Nov', '3', 2021, 'Native', '2021-11-06'),
(999, 'Inverter2', '38', 45, '1710', '2021-11-07', 'Nov', '3', 2021, 'Native', '2021-11-07'),
(1000, 'Inverter2', '40', 45, '1800', '2021-11-08', 'Nov', '3', 2021, 'Native', '2021-11-09'),
(1001, 'Inverter2', '4', 55, '220', '2021-11-08', 'Nov', '3', 2021, 'Native', '2021-11-09'),
(1002, 'Inverter2', '5', 60, '300', '2021-11-08', 'Nov', '3', 2021, 'Native', '2021-11-09'),
(1003, 'Inverter2', '5', 60, '300', '2021-11-08', 'Nov', '3', 2021, 'Native', '2021-11-09'),
(1004, 'Inverter2', '13', 60, '780', '2021-11-08', 'Nov', '3', 2021, 'Native', '2021-11-09'),
(1005, 'Inverter2', '5', 55, '275', '2021-11-08', 'Nov', '3', 2021, 'Native', '2021-11-09'),
(1006, 'Inverter2', '2', 60, '120', '2021-11-08', 'Nov', '3', 2021, 'Native', '2021-11-09'),
(1007, 'Inverter2', '2.5', 60, '150', '2021-11-08', 'Nov', '3', 2021, 'Native', '2021-11-09'),
(1008, 'Inverter2', '39', 45, '1755', '2021-11-09', 'Nov', '3', 2021, 'Native', '2021-11-09'),
(1009, 'Inverter2', '24', 55, '1320', '2021-11-09', 'Nov', '3', 2021, 'Native', '2021-11-09'),
(1010, 'Inverter2', '5', 55, '275', '2021-11-10', 'Nov', '3', 2021, 'Native', '2021-11-10'),
(1014, 'Inverter2', '40', 45, '1800', '2021-11-10', 'Nov', '3', 2021, 'Native', '2021-11-10'),
(1015, 'Inverter2', '5', 55, '275', '2021-11-10', 'Nov', '3', 2021, 'Native', '2021-11-10'),
(1016, 'Inverter2', '40', 45, '1800', '2021-11-11', 'Nov', '3', 2021, 'Native', '2021-11-15'),
(1017, 'Inverter2', '10.5', 55, '577.5', '2021-11-11', 'Nov', '3', 2021, 'Native', '2021-11-15'),
(1018, 'Inverter2', '39', 45, '1755', '2021-11-12', 'Nov', '3', 2021, 'Native', '2021-11-15'),
(1019, 'Inverter2', '38', 45, '1710', '2021-11-13', 'Nov', '3', 2021, 'Native', '2021-11-15'),
(1020, 'Inverter2', '33', 45, '1485', '2021-11-14', 'Nov', '3', 2021, 'Native', '2021-11-15'),
(1021, 'Inverter2', '26', 55, '1430', '2021-11-14', 'Nov', '3', 2021, 'Native', '2021-11-15'),
(1023, 'Inverter2', '5', 60, '300', '2021-11-14', 'Nov', '3', 2021, 'Native', '2021-11-15'),
(1024, 'Inverter2', '5', 60, '300', '2021-11-14', 'Nov', '3', 2021, 'Native', '2021-11-15'),
(1025, 'Inverter2', '7', 60, '420', '2021-11-14', 'Nov', '3', 2021, 'Native', '2021-11-15'),
(1026, 'Inverter2', '5', 55, '275', '2021-11-14', 'Nov', '3', 2021, 'Native', '2021-11-15'),
(1027, 'Inverter2', '4', 60, '240', '2021-11-14', 'Nov', '3', 2021, 'Native', '2021-11-15'),
(1028, 'Inverter2', '2', 60, '120', '2021-11-14', 'Nov', '3', 2021, 'Native', '2021-11-15'),
(1029, 'Inverter2', '33.5', 45, '1507.5', '2021-11-15', 'Nov', '3', 2021, 'Native', '2021-11-15'),
(1030, 'Inverter2', '37', 45, '1665', '2021-11-16', 'Nov', '3', 2021, 'Native', '2021-11-16'),
(1031, 'Inverter2', '13.5', 55, '742.5', '2021-11-16', 'Nov', '3', 2021, 'Native', '2021-11-16'),
(1032, 'Inverter2', '19', 55, '1045', '2021-11-16', 'Nov', '3', 2021, 'Native', '2021-11-16'),
(1033, 'Inverter2', '1', 60, '60', '2021-11-16', 'Nov', '3', 2021, 'Native', '2021-11-16'),
(1034, 'Inverter2', '.5', 60, '30', '2021-11-16', 'Nov', '3', 2021, 'Native', '2021-11-16'),
(1035, 'Inverter2', '5', 60, '300', '2021-11-16', 'Nov', '3', 2021, 'Native', '2021-11-16'),
(1036, 'Inverter2', '37', 45, '1665', '2021-11-17', 'Nov', '3', 2021, 'Native', '2021-11-17'),
(1037, 'Inverter2', '34', 45, '1530', '2021-11-18', 'Nov', '3', 2021, 'Native', '2021-11-18'),
(1038, 'Inverter2', '2', 60, '120', '2021-11-18', 'Nov', '3', 2021, 'Native', '2021-11-20'),
(1039, 'Inverter2', '20', 55, '1100', '2021-11-18', 'Nov', '3', 2021, 'Native', '2021-11-20'),
(1040, 'Inverter2', '5', 60, '300', '2021-11-20', 'Nov', '3', 2021, 'Native', '2021-11-20'),
(1041, 'Inverter2', '5', 60, '300', '2021-11-18', 'Nov', '3', 2021, 'Native', '2021-11-20'),
(1042, 'Inverter2', '5', 60, '300', '2021-11-18', 'Nov', '3', 2021, 'Native', '2021-11-20'),
(1043, 'Inverter2', '5', 60, '300', '2021-11-18', 'Nov', '3', 2021, 'Native', '2021-11-20'),
(1044, 'Inverter2', '3', 60, '180', '2021-11-18', 'Nov', '3', 2021, 'Native', '2021-11-20'),
(1045, 'Inverter2', '42', 45, '1890', '2021-11-19', 'Nov', '3', 2021, 'Native', '2021-11-20'),
(1046, 'Inverter2', '39', 45, '1755', '2021-11-20', 'Nov', '3', 2021, 'Native', '2021-11-20'),
(1047, 'Inverter3', '15', 10, '150', '2021-09-28', 'Nov', 'Transformer1', 2021, 'Native', '2021-11-21'),
(1048, 'Inverter3', '15', 10, '150', '2021-09-30', 'Nov', 'Transformer1', 2021, 'Native', '2021-11-21'),
(1049, 'Inverter2', '40', 45, '1800', '2021-11-21', 'Nov', '3', 2021, 'Native', '2021-11-21'),
(1050, 'Inverter2', '40', 45, '1800', '2021-11-22', 'Nov', '3', 2021, 'Native', '2021-11-22'),
(1051, 'Inverter2', '45', 55, '2475', '2021-11-22', 'Nov', '3', 2021, 'Native', '2021-11-22'),
(1052, 'Inverter2', '10', 60, '600', '2021-11-22', 'Nov', '3', 2021, 'Native', '2021-11-22'),
(1053, 'Inverter2', '20', 60, '1200', '2021-11-22', 'Nov', '3', 2021, 'Native', '2021-11-22'),
(1054, 'Inverter2', '.5', 60, '30', '2021-11-22', 'Nov', '3', 2021, 'Native', '2021-11-22'),
(1055, 'Inverter2', '39.5', 45, '1777.5', '2021-11-23', 'Nov', '3', 2021, 'Native', '2021-11-23'),
(1056, 'Inverter2', '5', 60, '300', '2021-11-23', 'Nov', '3', 2021, 'Native', '2021-11-23'),
(1057, 'Inverter2', '10', 60, '600', '2021-11-23', 'Nov', '3', 2021, 'Native', '2021-11-23'),
(1058, 'Inverter2', '10', 60, '600', '2021-11-24', 'Nov', '3', 2021, 'Native', '2021-11-24'),
(1059, 'Inverter2', '38', 45, '1710', '2021-11-24', 'Nov', '3', 2021, 'Native', '2021-11-24'),
(1060, 'Inverter2', '34.25', 45, '1541.25', '2021-11-25', 'Nov', '3', 2021, 'Native', '2021-11-25'),
(1061, 'Inverter2', '5', 60, '300', '2021-11-25', 'Nov', '3', 2021, 'Native', '2021-11-27'),
(1062, 'Inverter2', '5', 60, '300', '2021-11-25', 'Nov', '3', 2021, 'Native', '2021-11-27'),
(1063, 'Inverter2', '5', 60, '300', '2021-11-25', 'Nov', '3', 2021, 'Native', '2021-11-27'),
(1064, 'Inverter2', '33', 45, '1485', '2021-11-26', 'Nov', '3', 2021, 'Native', '2021-11-27'),
(1065, 'Inverter2', '49', 45, '2205', '2021-11-27', 'Nov', '3', 2021, 'Native', '2021-11-27'),
(1066, 'Inverter2', '10', 60, '600', '2021-11-27', 'Nov', '3', 2021, 'Native', '2021-11-27'),
(1067, 'Inverter2', '36', 45, '1620', '2021-11-28', 'Nov', '3', 2021, 'Native', '2021-11-29'),
(1068, 'Inverter2', '34', 55, '1870', '2021-11-29', 'Nov', '3', 2021, 'Native', '2021-11-29'),
(1069, 'Inverter2', '5', 60, '300', '2021-11-29', 'Nov', '3', 2021, 'Native', '2021-11-29'),
(1070, 'Inverter2', '2', 60, '120', '2021-11-29', 'Nov', '3', 2021, 'Native', '2021-11-29'),
(1071, 'Inverter2', '1', 60, '60', '2021-11-29', 'Nov', '3', 2021, 'Native', '2021-11-29'),
(1072, 'Inverter2', '38', 45, '1710', '2021-11-29', 'Nov', '3', 2021, 'Native', '2021-11-29'),
(1073, 'Inverter2', '34', 45, '1530', '2021-11-30', 'Nov', '3', 2021, 'Native', '2021-11-30'),
(1074, 'Inverter2', '37', 45, '1665', '2021-12-01', 'Dec', '3', 2021, 'Native', '2021-12-01'),
(1075, 'Inverter2', '37', 45, '1665', '2021-12-02', 'Dec', '3', 2021, 'Native', '2021-12-04'),
(1076, 'Inverter2', '3', 60, '180', '2021-12-02', 'Dec', '3', 2021, 'Native', '2021-12-04'),
(1077, 'Inverter2', '5', 60, '300', '2021-12-02', 'Dec', '3', 2021, 'Native', '2021-12-04'),
(1078, 'Inverter2', '5', 60, '300', '2021-12-02', 'Dec', '3', 2021, 'Native', '2021-12-04'),
(1079, 'Inverter2', '36', 45, '1620', '2021-12-03', 'Dec', '3', 2021, 'Native', '2021-12-04'),
(1080, 'Inverter2', '38', 45, '1710', '2021-12-04', 'Dec', '3', 2021, 'Native', '2021-12-04'),
(1081, 'Inverter2', '10', 60, '600', '2021-12-04', 'Dec', '3', 2021, 'Native', '2021-12-04'),
(1082, 'Inverter2', '10', 60, '600', '2021-12-04', 'Dec', '3', 2021, 'Native', '2021-12-04'),
(1083, 'Inverter2', '5', 60, '300', '2021-12-04', 'Dec', '3', 2021, 'Native', '2021-12-04'),
(1084, 'Inverter2', '40', 45, '1800', '2021-12-05', 'Dec', '3', 2021, 'Native', '2021-12-05'),
(1085, 'Inverter2', '30', 55, '1650', '2021-12-05', 'Dec', '3', 2021, 'Native', '2021-12-05'),
(1086, 'Inverter2', '57', 45, '2565', '2021-12-06', 'Dec', '3', 2021, 'Native', '2021-12-07'),
(1087, 'Inverter2', '57', 45, '2565', '2021-12-07', 'Dec', '3', 2021, 'Native', '2021-12-07'),
(1088, 'Inverter2', '5', 60, '300', '2021-12-07', 'Dec', '3', 2021, 'Native', '2021-12-07'),
(1089, 'Inverter2', '2', 60, '120', '2021-12-07', 'Dec', '3', 2021, 'Native', '2021-12-07'),
(1090, 'Inverter2', '8', 60, '480', '2021-12-07', 'Dec', '3', 2021, 'Native', '2021-12-07'),
(1091, 'Inverter2', '76', 45, '3420', '2021-12-08', 'Dec', '3', 2021, 'Native', '2021-12-08'),
(1092, 'Inverter2', '12', 60, '720', '2021-12-08', 'Dec', '3', 2021, 'Native', '2021-12-08'),
(1093, 'Inverter2', '39', 45, '1755', '2021-12-09', 'Dec', '3', 2021, 'Native', '2021-12-11'),
(1094, 'Inverter2', '5', 60, '300', '2021-12-09', 'Dec', '3', 2021, 'Native', '2021-12-11'),
(1095, 'Inverter2', '10', 60, '600', '2021-12-09', 'Dec', '3', 2021, 'Native', '2021-12-11'),
(1096, 'Inverter2', '58', 45, '2610', '2021-12-10', 'Dec', '3', 2021, 'Native', '2021-12-11'),
(1097, 'Inverter2', '4', 60, '240', '2021-12-10', 'Dec', '3', 2021, 'Native', '2021-12-11'),
(1098, 'Inverter2', '5', 60, '300', '2021-12-11', 'Dec', '3', 2021, 'Native', '2021-12-11'),
(1099, 'Inverter2', '40', 45, '1800', '2021-12-11', 'Dec', '3', 2021, 'Native', '2021-12-11'),
(1102, 'Inverter2', '30', 55, '1650', '2021-12-12', 'Dec', '3', 2021, 'Native', '2021-12-15'),
(1103, 'Inverter2', '39', 45, '1755', '2021-12-12', 'Dec', '3', 2021, 'Native', '2021-12-15'),
(1104, 'Inverter2', '.75', 60, '45', '2021-12-13', 'Dec', '3', 2021, 'Native', '2021-12-15'),
(1105, 'Inverter2', '39', 55, '2145', '2021-12-13', 'Dec', '3', 2021, 'Native', '2021-12-15'),
(1106, 'Inverter2', '9.25', 60, '555', '2021-12-13', 'Dec', '3', 2021, 'Native', '2021-12-15'),
(1107, 'Inverter2', '32', 45, '1440', '2021-12-14', 'Dec', '3', 2021, 'Native', '2021-12-15'),
(1108, 'Inverter2', '39', 45, '1755', '2021-12-15', 'Dec', '3', 2021, 'Native', '2021-12-15'),
(1109, 'Inverter2', '24.5', 60, '1470', '2021-12-15', 'Dec', '3', 2021, 'Native', '2021-12-15'),
(1110, 'Inverter2', '3', 60, '180', '2021-12-15', 'Dec', '3', 2021, 'Native', '2021-12-15'),
(1111, 'Inverter2', '5', 60, '300', '2021-12-15', 'Dec', '3', 2021, 'Native', '2021-12-15'),
(1112, 'Inverter2', '5', 60, '300', '2021-12-15', 'Dec', '3', 2021, 'Native', '2021-12-15'),
(1113, 'Inverter2', '2', 60, '120', '2021-12-15', 'Dec', '3', 2021, 'Native', '2021-12-15'),
(1114, 'Inverter2', '33', 55, '1815', '2021-12-16', 'Dec', '3', 2021, 'Native', '2021-12-17'),
(1115, 'Inverter2', '41.5', 45, '1867.5', '2021-12-16', 'Dec', '3', 2021, 'Native', '2021-12-18'),
(1116, 'Inverter2', '43.5', 45, '1957.5', '2021-12-17', 'Dec', '3', 2021, 'Native', '2021-12-18'),
(1117, 'Inverter2', '41.5', 45, '1867.5', '2021-12-18', 'Dec', '3', 2021, 'Native', '2021-12-18'),
(1119, 'Inverter2', '5', 60, '300', '2021-12-18', 'Dec', '3', 2021, 'Native', '2021-12-18'),
(1120, 'Inverter2', '5', 60, '300', '2021-12-19', 'Dec', '3', 2021, 'Native', '2021-12-19'),
(1121, 'Inverter2', '9.5', 60, '570', '2021-12-19', 'Dec', '3', 2021, 'Native', '2021-12-19'),
(1122, 'Inverter2', '42.5', 45, '1912.5', '2021-12-19', 'Dec', '3', 2021, 'Native', '2021-12-19'),
(1123, NULL, '2080', 25, '52000', '2021-12-12', 'Dec', 'Paddy', 2021, 'Native', '2021-12-20'),
(1124, 'Inverter2', '43', 45, '1935', '2021-12-20', 'Dec', '3', 2021, 'Native', '2021-12-22'),
(1125, 'Inverter2', '26', 55, '1430', '2021-12-20', 'Dec', '3', 2021, 'Native', '2021-12-22'),
(1126, 'Inverter2', '40', 45, '1800', '2021-12-21', 'Dec', '3', 2021, 'Native', '2021-12-22'),
(1127, 'Inverter2', '39', 45, '1755', '2021-12-22', 'Dec', '3', 2021, 'Native', '2021-12-22'),
(1128, 'Inverter2', '10', 60, '600', '2021-12-22', 'Dec', '3', 2021, 'Native', '2021-12-22'),
(1129, 'Inverter2', '42', 45, '1890', '2021-12-23', 'Dec', '3', 2021, 'Native', '2021-12-23'),
(1130, 'Inverter2', '5', 60, '300', '2021-12-23', 'Dec', '3', 2021, 'Native', '2021-12-23'),
(1131, 'Inverter2', '4', 60, '240', '2021-12-23', 'Dec', '3', 2021, 'Native', '2021-12-23'),
(1133, 'Inverter2', '43', 45, '1935', '2021-12-24', 'Dec', '3', 2021, 'Native', '2021-12-26'),
(1134, 'Inverter2', '40', 45, '1800', '2021-12-25', 'Dec', '3', 2021, 'Native', '2021-12-26'),
(1135, 'Inverter2', '20', 55, '1100', '2021-12-25', 'Dec', '3', 2021, 'Native', '2021-12-26'),
(1136, 'Inverter2', '5', 60, '300', '2021-12-25', 'Dec', '3', 2021, 'Native', '2021-12-26'),
(1137, 'Inverter2', '5', 60, '300', '2021-12-25', 'Dec', '3', 2021, 'Native', '2021-12-26'),
(1138, 'Inverter2', '5', 60, '300', '2021-12-25', 'Dec', '3', 2021, 'Native', '2021-12-26'),
(1139, 'Inverter2', '5', 60, '300', '2021-12-25', 'Dec', '3', 2021, 'Native', '2021-12-26'),
(1140, 'Inverter2', '40', 45, '1800', '2021-12-26', 'Dec', '3', 2021, 'Native', '2021-12-26'),
(1141, 'Inverter2', '44', 45, '1980', '2021-12-27', 'Dec', '3', 2021, 'Native', '2021-12-27'),
(1142, 'Inverter2', '5', 60, '300', '2021-12-27', 'Dec', '3', 2021, 'Native', '2021-12-27'),
(1143, 'Inverter2', '10', 60, '600', '2021-12-27', 'Dec', '3', 2021, 'Native', '2021-12-27'),
(1144, 'Inverter2', '42.5', 45, '1912.5', '2021-12-28', 'Dec', '3', 2021, 'Native', '2021-12-28'),
(1145, 'Inverter2', '40', 45, '1800', '2021-12-29', 'Dec', '3', 2021, 'Native', '2021-12-29'),
(1147, 'Inverter2', '40', 45, '1800', '2021-12-30', 'Dec', '3', 2021, 'Native', '2021-12-30'),
(1148, 'Inverter2', '10', 60, '600', '2021-12-30', 'Dec', '3', 2021, 'Native', '2021-12-30'),
(1149, 'Inverter2', '20', 55, '1100', '2021-12-30', 'Dec', '3', 2021, 'Native', '2021-12-30'),
(1150, 'Inverter2', '5', 60, '300', '2021-12-30', 'Dec', '3', 2021, 'Native', '2021-12-30'),
(1151, 'Inverter2', '5', 60, '300', '2021-12-30', 'Dec', '3', 2021, 'Native', '2021-12-30'),
(1152, 'Inverter2', '.5', 60, '30', '2021-12-30', 'Dec', '3', 2021, 'Native', '2021-12-30'),
(1154, 'Inverter2', '40', 45, '1800', '2021-12-31', 'Jan', '3', 2022, 'Native', '2022-01-01'),
(1155, NULL, '1', 19800, '19800', '2022-01-18', 'Jan', 'Transformer2', 2022, 'Native', '2022-01-01'),
(1156, NULL, '1', 300, '300', '2021-09-06', 'Jan', 'Transformer2', 2022, 'Native', '2022-01-02'),
(1157, NULL, '1', 300, '300', '2021-09-07', 'Jan', 'Transformer2', 2022, 'Native', '2022-01-02'),
(1184, 'Inverter2', '43', 46, '1978', '2022-01-01', 'Jan', '3', 2022, 'Native', '2022-01-02'),
(1185, 'Inverter2', '5', 60, '300', '2022-01-01', 'Jan', '3', 2022, 'Native', '2022-01-02'),
(1186, 'Inverter2', '41', 46, '1886', '2022-01-02', 'Jan', '3', 2022, 'Native', '2022-01-02'),
(1187, 'Inverter2', '10', 60, '600', '2022-01-02', 'Jan', '3', 2022, 'Native', '2022-01-02'),
(1188, 'Inverter2', '5', 60, '300', '2022-01-02', 'Jan', '3', 2022, 'Native', '2022-01-02'),
(1189, 'Inverter2', '5', 60, '300', '2022-01-02', 'Jan', '3', 2022, 'Native', '2022-01-02'),
(1190, NULL, '22', 10, '220', '2021-12-29', 'Jan', 'Transformer1', 2022, 'Native', '2022-01-02'),
(1191, 'Inverter2', '39.5', 46, '1817', '2022-01-03', 'Jan', '3', 2022, 'Native', '2022-01-03'),
(1192, 'Inverter2', '59.5', 46, '2737', '2022-01-04', 'Jan', '3', 2022, 'Native', '2022-01-04'),
(1193, 'Inverter2', '2', 60, '120', '2022-01-04', 'Jan', '3', 2022, 'Native', '2022-01-04'),
(1194, 'Inverter2', '58.5', 46, '2691', '2022-01-05', 'Jan', '3', 2022, 'Native', '2022-01-05'),
(1195, 'Inverter2', '10', 60, '600', '2022-01-05', 'Jan', '3', 2022, 'Native', '2022-01-05'),
(1196, 'Inverter2', '1', 60, '60', '2022-01-05', 'Jan', '3', 2022, 'Native', '2022-01-05'),
(1199, 'Inverter2', '44', 46, '2024', '2022-01-06', 'Jan', '3', 2022, 'Native', '2022-01-08'),
(1200, 'Inverter2', '25', 55, '1375', '2022-01-06', 'Jan', '3', 2022, 'Native', '2022-01-08'),
(1201, 'Inverter2', '5', 60, '300', '2022-01-06', 'Jan', '3', 2022, 'Native', '2022-01-08'),
(1204, 'Inverter2', '10', 60, '600', '2022-01-06', 'Jan', '3', 2022, 'Native', '2022-01-08'),
(1206, 'Inverter2', '42', 46, '1932', '2022-01-07', 'Jan', '3', 2022, 'Native', '2022-01-08'),
(1207, 'Inverter2', '68', 46, '3128', '2022-01-08', 'Jan', '3', 2022, 'Native', '2022-01-08'),
(1208, 'Inverter2', '41', 46, '1886', '2022-01-09', 'Jan', '3', 2022, 'Native', '2022-01-09'),
(1209, 'Inverter2', '7.5', 55, '412.5', '2022-01-09', 'Jan', '3', 2022, 'Native', '2022-01-09'),
(1210, 'Inverter2', '41', 46, '1886', '2022-01-10', 'Jan', '3', 2022, 'Native', '2022-01-10'),
(1211, 'Inverter2', '5', 60, '300', '2022-01-10', 'Jan', '3', 2022, 'Native', '2022-01-10'),
(1212, 'Inverter2', '5', 60, '300', '2022-01-10', 'Jan', '3', 2022, 'Native', '2022-01-10'),
(1213, 'Inverter2', '2.5', 60, '150', '2022-01-10', 'Jan', '3', 2022, 'Native', '2022-01-10'),
(1214, 'Inverter2', '38', 46, '1748', '2022-01-11', 'Jan', '3', 2022, 'Native', '2022-01-18'),
(1215, 'Inverter2', '39.5', 46, '1817', '2022-01-12', 'Jan', '3', 2022, 'Native', '2022-01-18'),
(1216, 'Inverter2', '41', 46, '1886', '2022-01-13', 'Jan', '3', 2022, 'Native', '2022-01-18'),
(1217, 'Inverter2', '10', 60, '600', '2022-01-13', 'Jan', '3', 2022, 'Native', '2022-01-18'),
(1218, 'Inverter2', '5', 60, '300', '2022-01-13', 'Jan', '3', 2022, 'Native', '2022-01-18'),
(1219, 'Inverter2', '33', 46, '1518', '2022-01-14', 'Jan', '3', 2022, 'Native', '2022-01-18'),
(1220, 'Inverter2', '24', 55, '1320', '2022-01-14', 'Jan', '3', 2022, 'Native', '2022-01-18'),
(1221, 'Inverter2', '37', 46, '1702', '2022-01-15', 'Jan', '3', 2022, 'Native', '2022-01-18'),
(1222, 'Inverter2', '40', 46, '1840', '2022-01-16', 'Jan', '3', 2022, 'Native', '2022-01-18'),
(1223, 'Inverter2', '43.5', 46, '2001', '2022-01-17', 'Jan', '3', 2022, 'Native', '2022-01-18'),
(1224, 'Inverter2', '47', 46, '2162', '2022-01-18', 'Jan', '3', 2022, 'Native', '2022-01-18'),
(1225, 'Inverter2', '34', 55, '1870', '2022-01-18', 'Jan', '3', 2022, 'Native', '2022-01-18'),
(1226, 'Inverter2', '5', 60, '300', '2022-01-18', 'Jan', '3', 2022, 'Native', '2022-01-18'),
(1227, 'Inverter2', '5', 60, '300', '2022-01-18', 'Jan', '3', 2022, 'Native', '2022-01-18'),
(1228, 'Inverter2', '5', 60, '300', '2022-01-18', 'Jan', '3', 2022, 'Native', '2022-01-18'),
(1229, 'Inverter2', '2', 60, '120', '2022-01-18', 'Jan', '3', 2022, 'Native', '2022-01-18'),
(1230, 'Inverter2', '8', 60, '480', '2022-01-18', 'Jan', '3', 2022, 'Native', '2022-01-18'),
(1231, 'Inverter2', '34.5', 46, '1587', '2022-01-19', 'Jan', '3', 2022, 'Native', '2022-01-19'),
(1232, 'Inverter2', '46', 46, '2116', '2022-01-20', 'Jan', '3', 2022, 'Native', '2022-01-20'),
(1233, 'Inverter2', '5', 60, '300', '2022-01-20', 'Jan', '3', 2022, 'Native', '2022-01-20'),
(1234, 'Inverter2', '5', 60, '300', '2022-01-20', 'Jan', '3', 2022, 'Native', '2022-01-20'),
(1235, 'Inverter2', '8', 60, '480', '2022-01-20', 'Jan', '3', 2022, 'Native', '2022-01-20'),
(1236, 'Inverter2', '43', 46, '1978', '2022-01-21', 'Jan', '3', 2022, 'Native', '2022-01-22'),
(1237, 'Inverter2', '4', 60, '240', '2022-01-21', 'Jan', '3', 2022, 'Native', '2022-01-22'),
(1238, 'Inverter2', '33', 46, '1518', '2022-01-22', 'Jan', '3', 2022, 'Native', '2022-01-22'),
(1239, 'Inverter2', '25', 55, '1375', '2022-01-22', 'Jan', '3', 2022, 'Native', '2022-01-22'),
(1241, 'Inverter2', '36', 46, '1656', '2022-01-23', 'Jan', '3', 2022, 'Native', '2022-01-23'),
(1242, 'Inverter2', '5', 60, '300', '2022-01-23', 'Jan', '3', 2022, 'Native', '2022-01-23'),
(1243, 'Inverter2', '8', 60, '480', '2022-01-23', 'Jan', '3', 2022, 'Native', '2022-01-23'),
(1244, 'Inverter2', '.5', 60, '30', '2022-01-23', 'Jan', '3', 2022, 'Native', '2022-01-23'),
(1245, 'Inverter2', '.5', 60, '30', '2022-01-23', 'Jan', '3', 2022, 'Native', '2022-01-23'),
(1246, 'Inverter2', '40', 46, '1840', '2022-01-24', 'Jan', '3', 2022, 'Native', '2022-01-24'),
(1247, 'Inverter2', '5', 60, '300', '2022-01-24', 'Jan', '3', 2022, 'Native', '2022-01-24'),
(1248, 'Inverter2', '1', 60, '60', '2022-01-24', 'Jan', '3', 2022, 'Native', '2022-01-24'),
(1249, 'Inverter2', '44', 46, '2024', '2022-01-25', 'Jan', '3', 2022, 'Native', '2022-01-26'),
(1250, 'Inverter2', '45', 46, '2070', '2022-01-26', 'Jan', '3', 2022, 'Native', '2022-01-26'),
(1251, 'Inverter2', '17', 55, '935', '2022-01-26', 'Jan', '3', 2022, 'Native', '2022-01-26'),
(1252, 'Inverter2', '7.5', 60, '450', '2022-01-27', 'Jan', '3', 2022, 'Native', '2022-01-29'),
(1253, 'Inverter2', '5', 60, '300', '2022-01-27', 'Jan', '3', 2022, 'Native', '2022-01-29'),
(1254, 'Inverter2', '5', 60, '300', '2022-01-27', 'Jan', '3', 2022, 'Native', '2022-01-29'),
(1255, 'Inverter2', '5', 60, '300', '2022-01-27', 'Jan', '3', 2022, 'Native', '2022-01-29'),
(1256, 'Inverter2', '9.5', 60, '570', '2022-01-27', 'Jan', '3', 2022, 'Native', '2022-01-29'),
(1257, 'Inverter2', '42', 46, '1932', '2022-01-27', 'Jan', '3', 2022, 'Native', '2022-01-29'),
(1258, 'Inverter2', '35', 46, '1610', '2022-01-28', 'Jan', '3', 2022, 'Native', '2022-01-29'),
(1259, 'Inverter2', '18.5', 55, '1017.5', '2022-01-28', 'Jan', '3', 2022, 'Native', '2022-01-29'),
(1260, 'Inverter2', '48', 46, '2208', '2022-01-29', 'Jan', '3', 2022, 'Native', '2022-01-29'),
(1261, 'Inverter2', '5', 60, '300', '2022-01-30', 'Jan', '3', 2022, 'Native', '2022-01-30'),
(1262, 'Inverter2', '43', 46, '1978', '2022-01-30', 'Jan', '3', 2022, 'Native', '2022-01-30'),
(1263, 'Inverter2', '1', 60, '60', '2022-01-30', 'Jan', '3', 2022, 'Native', '2022-01-30'),
(1264, 'Inverter2', '47', 46, '2162', '2022-01-31', 'Jan', '3', 2022, 'Native', '2022-01-31'),
(1265, 'Inverter2', '44', 46, '2024', '2022-02-01', 'Feb', '3', 2022, 'Native', '2022-02-01'),
(1266, 'Inverter2', '46', 46, '2116', '2022-02-02', 'Feb', '3', 2022, 'Native', '2022-02-02');

-- --------------------------------------------------------

--
-- Table structure for table `transformer_power`
--

CREATE TABLE `transformer_power` (
  `id` int(11) NOT NULL,
  `transformer_name` varchar(10) NOT NULL CHECK (`transformer_name` in ('Trans1','Trans2','Trans3','Trans4')),
  `power_output` decimal(10,2) NOT NULL COMMENT 'Power output in kW (range 750-800)',
  `timestamp` datetime DEFAULT current_timestamp(),
  `status` enum('online','offline','maintenance') DEFAULT 'online',
  `temperature` decimal(5,2) DEFAULT NULL COMMENT 'Winding temperature in °C',
  `load_percentage` decimal(5,2) DEFAULT NULL COMMENT 'Percentage load capacity'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transformer_power`
--

INSERT INTO `transformer_power` (`id`, `transformer_name`, `power_output`, `timestamp`, `status`, `temperature`, `load_percentage`) VALUES
(1, 'Trans1', 766.88, '2025-03-31 20:55:21', 'online', 74.43, 81.95),
(2, 'Trans2', 400.00, '2025-03-31 20:55:21', 'online', 71.56, 93.35),
(3, 'Trans3', 756.84, '2025-03-31 20:55:21', 'online', 65.22, 89.94),
(4, 'Trans4', 763.50, '2025-03-31 20:55:21', 'maintenance', 43.62, 29.98);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `ID` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `Password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`ID`, `Name`, `Email`, `Password`) VALUES
(11, 'keneth', 'keneth@gmail.com', '$2y$10$7NorbBKqzRJBmpD7PCbBV.UC6V6JbUJdurPd1ouuZGbPZvZeAFxny'),
(12, 'juma', 'juma@gmail.com', '$2y$10$9DWEY4AFMJ/16b7tGkgJCO0syERKS1x9L9k9SjbPc/2o2.od7KxZe'),
(13, 'sudaice', 'sudaice@gmail.com', '$2y$10$fSzCULojlPOLokvJ5fpGWOoFeLgVTT1oEeWHh9CJDMrnq.kRfLAvG'),
(14, 'linda', 'linda@gmail.com', '$2y$10$ftgCGmCWAe9j59zaefG8h.p/i0Ax0myRbZbsT.cfb6xqFGT.FgFSq'),
(15, 'nathan', 'nathan@gmail.com', '$2y$10$L3JxO2a/FklrdFGqu.4KQ.jvZszboS8NMUMv3ezldHXw589Nkrrj2');

-- --------------------------------------------------------

--
-- Table structure for table `user_form`
--

CREATE TABLE `user_form` (
  `id` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `image` varchar(100) NOT NULL,
  `reset_token` varchar(64) DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_form`
--

INSERT INTO `user_form` (`id`, `name`, `email`, `password`, `image`, `reset_token`, `expires_at`) VALUES
(1, 'idid', 'idid@gmail.com', 'd41d8cd98f00b204e9800998ecf8427e', 'idid.jpg', '144747', '2025-03-31 16:48:41'),
(8, 'muhammed', 'muhammed@gmail.com', '202cb962ac59075b964b07152d234b70', 'Screenshot 2025-03-27 124122.png', NULL, NULL),
(9, 'Idid muhammed', 'ididmuhammed93@gmail.com', '202cb962ac59075b964b07152d234b70', '', '3196eac76a3f2078d8bce23664a5431d7b88a8c9d2f4065be745b7bb0c49f8a2', '2025-03-29 15:15:15'),
(10, 'tom', 'tom@gmail.com', '202cb962ac59075b964b07152d234b70', '', NULL, NULL),
(11, 'sudaice', 'sudaice@gmail.com', '202cb962ac59075b964b07152d234b70', 'default-avatar.png', '950165', '2025-03-31 16:40:20'),
(12, 'simba', 'simba@gmail.com', '202cb962ac59075b964b07152d234b70', '', NULL, NULL),
(13, 'salim', 'salim@gmail.com', 'd41d8cd98f00b204e9800998ecf8427e', 'idid.jpg', '553774', '2025-03-31 12:50:11'),
(14, 'Muhammed', '2101600071@sun.ac.ug', '$2y$10$u1ePnetm2PoNDidA80zMZu8FrBUnzP8HashtHWaPZW4UpJNHdA0Na', '', NULL, NULL),
(15, 'musa', 'musa@gmail.com', '202cb962ac59075b964b07152d234b70', '', NULL, NULL),
(16, 'habat', 'habat@gmail.com', 'd41d8cd98f00b204e9800998ecf8427e', 'idid.jpg', NULL, NULL),
(17, 'Idid', '2101600071@sun.ac.ug', '$2y$10$u1ePnetm2PoNDidA80zMZu8FrBUnzP8HashtHWaPZW4UpJNHdA0Na', '', NULL, NULL),
(18, 'juma', 'juma@gmail.com', '202cb962ac59075b964b07152d234b70', '', NULL, NULL),
(19, 'isak', 'isak@gmail.com', '202cb962ac59075b964b07152d234b70', '', NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `inverter_power`
--
ALTER TABLE `inverter_power`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `string_currents`
--
ALTER TABLE `string_currents`
  ADD PRIMARY KEY (`string_name`);

--
-- Indexes for table `tbl_sales`
--
ALTER TABLE `tbl_sales`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transformer_power`
--
ALTER TABLE `transformer_power`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `user_form`
--
ALTER TABLE `user_form`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_reset_token` (`reset_token`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `inverter_power`
--
ALTER TABLE `inverter_power`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `tbl_sales`
--
ALTER TABLE `tbl_sales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1267;

--
-- AUTO_INCREMENT for table `transformer_power`
--
ALTER TABLE `transformer_power`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `user_form`
--
ALTER TABLE `user_form`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

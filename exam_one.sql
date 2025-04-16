-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 16, 2025 at 06:15 AM
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
-- Database: `exam_one`
--

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
(5, 'Idid Muhammed', '2101600071@sun.ac.ug', 'Idid', '$2y$10$z1bQXGwhkQu5fLwQr2wHYeAVCwQoRkOFJE6cuBnZx86Cuhm868LyS', '2025-04-14 19:20:23', '2025-04-15 22:21:26', NULL, NULL, NULL);

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
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 14, 2023 at 02:47 PM
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
-- Database: `auth-multi-guard`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `phone`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin', '01770802187', 'admin@gmail.com', NULL, '$2y$10$jzwTsj/BH.3.krsiAWoEQeVBvuJPh5WJoe3ZhzXvYGk2MOfd/oWM6', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `doctors`
--

CREATE TABLE `doctors` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `hospital` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `email_verified` int(11) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `doctors`
--

INSERT INTO `doctors` (`id`, `name`, `hospital`, `email`, `email_verified_at`, `password`, `remember_token`, `email_verified`, `created_at`, `updated_at`) VALUES
(3, 'Test name', 'Dhaka Medical', 'test21@gmail.com', NULL, '$2y$10$iNK6y1lmWttJHEx7k6lb8.SOjStw8y2YL7E5IAEi0Q3wXNz0IZU/y', NULL, 1, '2023-08-13 05:13:07', '2023-08-14 06:37:12'),
(4, 'Md Manik', 'Dhaka Bangladesh', 'manik@gmail.com', NULL, '$2y$10$NED2uvYpJo.v97SNjWgKgOeMm40.BCDrQp7JjhpqPvBbXz/VU4vUC', NULL, 1, '2023-08-13 05:59:59', '2023-08-14 06:33:29');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2023_08_12_105548_create_admins_table', 2),
(6, '2023_08_12_122311_create_doctors_table', 3),
(7, '2023_08_13_053559_create_verify_users_table', 4),
(8, '2023_08_13_091318_create_verify_doctors_table', 5);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('user@gmail.com', 'Ndc4nfKrc9q2fABdxKc8cjTB7s13NEJqrpn3niFawUHAyVhHX7NcmM6Tr6A3p268', '2023-08-13 07:10:52'),
('user@gmail.com', 'X86QGwqDFDtcLbhvLEOMrVv5dkC5AihESGl2Dt3i5FofmcVOOgdnMUEyHctNMxOx', '2023-08-14 02:30:36'),
('mo15103053@gmail.com', 'LCL9tiKpis7VqEA7pT9L3MnRuVuqMw2fSnhtRzUqMe9m6fKua0RwOLOdr8RocvRA', '2023-08-14 06:41:31');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `email_verified` int(11) NOT NULL DEFAULT 0,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `email_verified`, `remember_token`, `created_at`, `updated_at`) VALUES
(2, 'User', 'user@gmail.com', NULL, '$2y$10$SQx.KjzFIv9cYR8bEXQchuTfWEt6wWVOLU1ILqfQWQV6C0tbbfe0y', 0, NULL, '2023-08-12 03:36:58', '2023-08-12 03:36:58'),
(9, 'Moshiur Rahman', 'mo15103053@gmail.com', NULL, '$2y$10$lik3Odf6TF5k8qt0re3PouL.tfFPkR9UtRJtYpJ6MWjRNg6rOewNi', 1, NULL, '2023-08-13 01:41:17', '2023-08-14 03:44:59'),
(10, 'Md Atik hasan Khan', 'hasan@gmail.com', NULL, '$2y$10$kDm0vRDWWwMb6jhAoxfSG.yJIYIVmeUasDG1nhnImd7JNsOOZHEbO', 1, NULL, '2023-08-13 02:06:09', '2023-08-13 02:06:31'),
(11, 'Nahid Khan', 'khan@gmail.com', NULL, '$2y$10$ZqD6rTG/Umxdgs.r8wPa7uwP8RwLpIug2zCszMkoXQTF04TXIHflu', 1, NULL, '2023-08-13 02:22:48', '2023-08-13 02:24:29'),
(12, 'Md habib Khan', 'habib1@gmail.com', NULL, '$2y$10$Ngen1WkhuucHH337rfceaOp6xb0JFU80ZZ86eBDXh0B5ZonG3G9f6', 1, NULL, '2023-08-13 02:25:15', '2023-08-13 02:26:31'),
(13, 'Tanvir Hasan', 'tanvir@gmail.com', NULL, '$2y$10$Q8LTB9Goip5gtc31DT0CtO29l.BF3kxm0dF8/IW.qO6gt6R.HJVVy', 1, NULL, '2023-08-13 03:03:29', '2023-08-14 04:25:21');

-- --------------------------------------------------------

--
-- Table structure for table `verify_doctors`
--

CREATE TABLE `verify_doctors` (
  `doctor_id` int(11) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `verify_doctors`
--

INSERT INTO `verify_doctors` (`doctor_id`, `token`, `created_at`, `updated_at`) VALUES
(3, '3e7af56cbcd58795e97f461afb6b968502bdf6f23dc0a6f9331a7134b58d10b01', '2023-08-13 05:13:07', '2023-08-13 05:13:07'),
(4, '405e2e446aeb0f340759ab6f02fcd7b7246154b590d8b36ff904ffce167d38f3f', '2023-08-13 05:59:59', '2023-08-13 05:59:59');

-- --------------------------------------------------------

--
-- Table structure for table `verify_users`
--

CREATE TABLE `verify_users` (
  `user_id` int(11) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `verify_users`
--

INSERT INTO `verify_users` (`user_id`, `token`, `created_at`, `updated_at`) VALUES
(4, '45207eaf5aad4df36af1a2d7796146f65a922beded4422f28b67834bd72ce840c', '2023-08-13 01:11:34', '2023-08-13 01:11:34'),
(5, '5a40d3e815f3ea985d6e265224d5967e9d37523b06d053ce07ef5fc105b140f11', '2023-08-13 01:14:14', '2023-08-13 01:14:14'),
(6, '67cde5449e147f4814ce017447090847b68af88dac2537fed53c80434314b75bd', '2023-08-13 01:18:15', '2023-08-13 01:18:15'),
(7, '7c0aaff2309d406d1660c8c85f93297f32c4e76a4d9b8f538b31c82b8d039efc7', '2023-08-13 01:21:33', '2023-08-13 01:21:33'),
(8, '8505d6cf7768966a8c0fec49f266064e49bea1b828979b1a21eca79e4b8048d0a', '2023-08-13 01:40:35', '2023-08-13 01:40:35'),
(9, '94f7f36a9c3812bfb6b1d0013e5fcd87a1c436d3ea235354c2c7bf7e0ac73bc7c', '2023-08-13 01:41:17', '2023-08-13 01:41:17'),
(10, '10e902e5f05c241371d78d8be27a4c68d90845b983177ba63a140684e19967401b', '2023-08-13 02:06:09', '2023-08-13 02:06:09'),
(11, '11edc8d53dc44029c8943c3a829c31b1f939bdec5e934c97411e82922339fc0ed9', '2023-08-13 02:22:48', '2023-08-13 02:22:48'),
(12, '12f6d156da9ce52005cb51ca22338823021dbea0c81e1f020732af6390a106c247', '2023-08-13 02:25:15', '2023-08-13 02:25:15'),
(13, '1318b198a2d5c6375b1ef10993bbf958787a2b0442e4104b91d41ebe9224a1cf74', '2023-08-13 03:03:29', '2023-08-13 03:03:29');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_email_unique` (`email`);

--
-- Indexes for table `doctors`
--
ALTER TABLE `doctors`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `doctors_email_unique` (`email`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `doctors`
--
ALTER TABLE `doctors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

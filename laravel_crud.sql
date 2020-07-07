-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 07, 2020 at 09:54 AM
-- Server version: 10.4.13-MariaDB
-- PHP Version: 7.4.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laravel_crud`
--

-- --------------------------------------------------------

--
-- Table structure for table `guru`
--

CREATE TABLE `guru` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `telepon` varchar(15) NOT NULL,
  `alamat` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `guru`
--

INSERT INTO `guru` (`id`, `nama`, `telepon`, `alamat`, `created_at`, `updated_at`) VALUES
(1, 'Sarjono', '089622938112', 'Bandung', '2020-05-28 21:27:34', '0000-00-00 00:00:00'),
(2, 'Dwikartika', '089622938111', 'Bekasi', '2020-05-28 21:29:05', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `mapel`
--

CREATE TABLE `mapel` (
  `id` int(11) NOT NULL,
  `kode` varchar(191) NOT NULL,
  `nama` varchar(191) NOT NULL,
  `semester` varchar(45) NOT NULL,
  `guru_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mapel`
--

INSERT INTO `mapel` (`id`, `kode`, `nama`, `semester`, `guru_id`, `created_at`, `updated_at`) VALUES
(1, 'M-001', 'Matematika', 'ganjil', 1, '2020-04-29 15:51:49', '0000-00-00 00:00:00'),
(2, 'B-001', 'Bahasa Indonesia', 'ganjil', 1, '2020-04-29 15:51:49', '0000-00-00 00:00:00'),
(3, 'M-002', 'Agama Islam', 'ganjil', 2, '2020-05-01 16:50:15', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `mapel_siswa`
--

CREATE TABLE `mapel_siswa` (
  `id` int(11) NOT NULL,
  `siswa_id` int(11) NOT NULL,
  `mapel_id` int(11) NOT NULL,
  `nilai` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mapel_siswa`
--

INSERT INTO `mapel_siswa` (`id`, `siswa_id`, `mapel_id`, `nilai`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 99, '2020-04-29 15:54:37', '2020-05-02 17:16:34'),
(2, 1, 2, 85, '2020-04-29 15:54:37', '0000-00-00 00:00:00'),
(3, 3, 1, 88, '2020-04-29 16:08:27', '2020-05-02 17:23:40'),
(4, 1, 1, 99, '2020-04-30 10:24:16', '2020-05-02 17:16:34'),
(5, 1, 1, 99, '2020-04-30 10:26:03', '2020-05-02 17:16:34'),
(6, 1, 1, 99, '2020-04-30 10:28:43', '2020-05-02 17:16:34'),
(7, 1, 2, 96, '2020-04-30 10:29:16', '2020-04-30 17:29:16'),
(8, 4, 1, 98, '2020-04-30 10:29:59', '2020-04-30 17:29:59'),
(9, 4, 2, 95, '2020-04-30 10:30:21', '2020-05-29 21:19:59'),
(12, 1, 3, 98, '2020-05-01 17:06:27', '0000-00-00 00:00:00'),
(13, 6, 1, 85, '2020-05-01 10:19:20', '2020-05-01 17:19:20'),
(14, 6, 3, 95, '2020-05-01 10:19:47', '2020-05-01 17:19:47'),
(15, 6, 2, 93, '2020-05-01 10:20:10', '2020-05-01 17:20:10'),
(16, 3, 2, 91, '2020-05-02 10:23:02', '2020-05-02 17:23:02'),
(17, 3, 3, 98, '2020-05-02 10:23:15', '2020-05-02 17:23:15'),
(20, 5, 1, 93, '2020-05-02 11:26:15', '2020-05-02 18:26:15'),
(21, 4, 3, 99, '2020-05-29 14:15:40', '2020-05-29 21:15:40'),
(22, 7, 1, 95, '2020-06-02 20:08:12', '2020-06-03 03:08:12'),
(23, 7, 2, 96, '2020-06-02 20:08:26', '2020-06-03 03:08:26'),
(24, 7, 3, 98, '2020-06-02 20:08:41', '2020-06-03 03:08:41');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2020_04_22_160928_create_siswa_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `slug` varchar(255) NOT NULL,
  `thumbnail` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `user_id`, `title`, `content`, `slug`, `thumbnail`, `created_at`, `updated_at`) VALUES
(1, 11, 'Ini berita pertama', '<p>Ini isi dari berita pertama yang di input secara manual </p>', 'ini-berita-pertama', '', '2020-07-07 04:22:18', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `siswa`
--

CREATE TABLE `siswa` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `nama_depan` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama_belakang` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jenis_kelamin` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `agama` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alamat` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `siswa`
--

INSERT INTO `siswa` (`id`, `user_id`, `nama_depan`, `nama_belakang`, `jenis_kelamin`, `agama`, `alamat`, `avatar`, `created_at`, `updated_at`) VALUES
(4, 0, 'Muhammad', 'Gagan', 'L', 'Islam', 'Jakarta', NULL, '2020-04-21 17:00:00', '2020-06-25 07:59:55'),
(5, 0, 'Iman', 'Supriadi', 'L', 'Islam', 'Bekasi', NULL, '2020-04-21 17:00:00', '2020-04-24 09:13:48'),
(7, 0, 'Didin', 'Afifuddin', 'L', 'Islam', 'Majalengka', NULL, '2020-04-23 10:27:37', '2020-04-23 10:27:37'),
(11, 0, 'Anwar', 'Nurrahman', 'L', 'Islam', 'Bandung', NULL, '2020-04-24 10:25:16', '2020-04-24 10:25:16'),
(20, 13, 'idad', 'Rusdiana', 'L', 'Islam', 'Bandung Barat', 'Logo-politeknik-tedc-bandung.png', '2020-06-26 09:15:47', '2020-06-26 09:18:13'),
(21, 14, 'Faiz', 'Muhammad', 'L', 'Islam', 'Purwakarta', NULL, '2020-06-30 01:35:41', '2020-06-30 01:35:41'),
(22, 15, 'Ujang', 'Sarip', 'L', 'Islam', 'Sukabumi', NULL, '2020-06-30 01:38:53', '2020-06-30 01:38:53'),
(24, 19, 'Ikhwan', 'Maulana', 'L', 'Islam', 'Cirebon', NULL, '2020-07-01 21:50:31', '2020-07-01 21:50:31'),
(26, 21, 'Muhammad', 'Gilang', 'L', 'Islam', 'Cirebon', NULL, '2020-07-01 22:07:40', '2020-07-01 22:07:40'),
(27, 22, 'Tufiq', 'M', 'L', 'Islam', 'Cianjur', NULL, '2020-07-02 01:17:49', '2020-07-02 01:17:49'),
(28, 23, 'Ovie', 'Sri', 'P', 'Islam', 'Yogyakarta', NULL, '2020-07-02 07:30:32', '2020-07-02 07:30:32'),
(29, 24, 'Zaki', 'Rayhan', 'L', 'Islam', 'Surabaya', NULL, '2020-07-02 09:32:34', '2020-07-02 09:32:34');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `role` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `role`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'Basrul', 'basrul@gmail.com', NULL, '0736d2049be76004da8e2e0bc946ea9c', 'PrNEP6ob82Kk22aizn9zPoU1HTGWJIc8B1ZQWSj0MrQRFPLVJozpqo5HDRlN', '2020-04-26 03:12:39', '2020-04-26 03:12:39'),
(3, 'siswa', 'Azil', 'azil@gmail.com', NULL, '$2y$10$x1ysCrNMIPP//mUUbry4cONj/Hw4QAD8IYfkciUcKC7wY.QUFBUXi', 'L6sxdaTNK3YPdlYDZJ9xbpsgWEUTrHIOE4XVKXcUt6M4xl8s6Fs5PrvdtZ7a', '2020-04-27 09:53:51', '2020-04-27 09:53:51'),
(6, 'siswa', 'Mahmud', 'mahmud@gmail.com', NULL, '$2y$10$b4.vurbLpr21vl7NOJV7uu3YxTSMmIQ.rFvhWPdhqeV9Zbux0.oRq', 'UiaIEL54oz4Xl3rzyf2JUf0AnD4vYMyRIYLre8go9kVuzSQy5aPHQUFMN5xP', '2020-04-29 11:33:41', '2020-04-29 11:33:41'),
(7, 'siswa', 'Muhammad', 'reynaldi@gmail.com', NULL, '$2y$10$6IxJe5hthWkdTysLAeuqM.HPSpgDZEmZH9JCv4O5uGEUWBeHHrbZm', 'B0f9HF0wEuU3rSpyKeM8iU0tcoDqO9zDNHzZTOO3E4bk7mrjrsDdzjvScJL3', '2020-04-29 11:38:40', '2020-04-29 11:38:40'),
(8, 'siswa', 'Rifaldi', 'akhbar@gmail.com', NULL, '$2y$10$1iA1yRY4DprFAZaHQUhqieOPt62hixP7MvR6j3HuzW3lKq2lsmdKa', 'aVlPF3lELGYKCnUOighMHXQsxNwH4i5LxLYwekXcfmwyrcnBNFkQEEvnKB7L', '2020-04-29 11:51:38', '2020-04-29 11:51:38'),
(9, 'siswa', 'Muhammad', 'muhammadyusuf@gmail.com', NULL, '$2y$10$ne.q/8VICB3Mr7.f6BKmiel2uFjoPeM0seI2i3ZHyeE.cnntxSB0y', 'mg4bkXK2Wt5foy21MJFSGsRnGeufs1u726NjSemD07ops5TZjtHWZWfCCmBr', '2020-04-29 11:55:05', '2020-04-29 11:55:05'),
(10, 'admin', 'idad', 'rolloic@gmail.com', NULL, '$2y$10$WG9Fq8ghDypmmYn7sfFp9erMrKnHCV4ldxIGfNX8ULlvE0ba7OZ6i', 'Hvg16UdsmXBuZ1PLV5VbjIqZGKVnkNpfiTTY2mdDry7ZWAxV4wLBQSA1goYY', '2020-05-26 04:20:13', '2020-05-26 04:20:13'),
(11, 'admin', 'Anwar', 'anwar@gmail.com', NULL, '$2y$10$xThMzPNl.9oS3q9bSNK.BOCjOz6Zziwy6MxPJe4053I7uVHNo3qye', 'y1YDS282sEAWZPYqCqWhfqTVlt0HpcyN4pw0n10zC2z68MWeQt884Skd4n9S', '2020-05-26 14:21:22', '2020-05-26 14:21:22'),
(12, 'siswa', 'Muhammad', 'topik@gmail.com', NULL, '$2y$10$sVFjSYNVi1YyZ4pm3Nd3xOLctVkFirLKqQ4ASqRW39gN9Ltx1inny', 'zXW7SSQc5fR7ukAYKBrRx4MQ2ThrjTRrlHNMLu7SM4oUT7owmOg1JAQObt6o', '2020-06-25 10:24:07', '2020-06-25 10:24:07'),
(13, 'siswa', 'idad', 'idadrusdiana01@gmail.com', NULL, '$2y$10$gE4UxzA8O6ZPNR/bOsS8teHgIp05JOdDimrZPfQOY01qzYnocx1LK', 'h9cewPxXH31fnWqGPjebaEwvAqyFnYrj9wzpIXG37cbeBCbM4biBw31t6rGv', '2020-06-26 09:15:47', '2020-06-26 09:15:47'),
(14, 'siswa', 'Faiz', 'faiz@gmail.com', NULL, '$2y$10$LrCLNO/K2E5BOXsYydG5XusavmMgslFFj5UN0zYtEgQ6sbeUT1Ai.', 'JsgFJlHkFgC9NZwMscm3TJfYnBXzeRNZfLGTyVZ7B1dqhBqqWpu2z22RyFhr', '2020-06-30 01:35:41', '2020-06-30 01:35:41'),
(15, 'siswa', 'Ujang', 'ujang@gmail.com', NULL, '$2y$10$3pSYb2EAs5M9pLvAMLOMseIpZVbsbIdSo27tYmo8nZIcHAcQoPzum', 'GtHsK1g611EsJeOHvltTUi0OyzWpfP1nLXD4p3BLaRP6rEOLWXOtt7x3nd8m', '2020-06-30 01:38:53', '2020-06-30 01:38:53'),
(16, 'siswa', 'Muhammad', 'rivan@gmail.com', NULL, '$2y$10$uTqv4.qChRez6qhk9INe4ewab1nM4C4WMb33NSvLnK0UJl2GahT4m', 'jjIlJEoCHIv0e2yNK9baA7x2bbuk2cvmEsvZ36BuOcAXLhoVHeVURfs6psX0', '2020-07-01 21:44:17', '2020-07-01 21:44:17'),
(19, 'siswa', 'Ikhwan', 'ikhwan@gmail.com', NULL, '$2y$10$xE5b/V3w6xxvM89/VJOtOOsjq4waTfSyUiX6slHXITZJEGzdeY5bi', 'nZIU5tcIxtxpVgyBatZSnFjNAQ09M8h5QlhBzMcyZ7HIB2q4DSsfDC6wNtxm', '2020-07-01 21:50:30', '2020-07-01 21:50:30'),
(21, 'siswa', 'Muhammad', 'gilang@gmail.com', NULL, '$2y$10$B0AK7SAtTDkOFUMAeCP1L.4IsJR6mNSBe9hEYzNmI.mkD4aPM90.K', 'vxP0eh2gVUML81BLEFfDt1LdlstxUqU3SdL8TxqazxjgvBJCLBg3pfVPvQGC', '2020-07-01 22:07:40', '2020-07-01 22:07:40'),
(22, 'siswa', 'Tufiq', 'taufiq@gmail.com', NULL, '$2y$10$1UehrfifS/EuJshSt7ycreuulNqcY48/prgGhhmTB6Rh9JF0vgiw6', 'g3doWKUItmuwYaXUamm9hHYnx30APUBv0mnlrqYaxLDOC3Zz8WxYlfOHUzqp', '2020-07-02 01:17:48', '2020-07-02 01:17:48'),
(23, 'siswa', 'Ovie', 'ovie@gmail.com', NULL, '$2y$10$9H5Qg.jrALEL1yCwzW5wauROhGZYBni06JeyGNRLmtgU3f2GFxTJm', '8xjQ0WrREQ1KJY0Ol5w0qP7byQVv9Jan7Nv3OmN1F4FbTHqQyY5dQqozhRa2', '2020-07-02 07:30:32', '2020-07-02 07:30:32'),
(24, 'siswa', 'Zaki', 'zaki@gmail.com', NULL, '$2y$10$rMzk7szgq1AgHb4PN/ZgPugGrLqJr1UbNKR2nYIN01mP5s/oQLvcS', 'fgej9WH9fyoNXnXMeRdkXEaENumwuoR3Fh9R6CYJqm6lyoRgyV94eyuHXNeh', '2020-07-02 09:32:34', '2020-07-02 09:32:34');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `guru`
--
ALTER TABLE `guru`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mapel`
--
ALTER TABLE `mapel`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mapel_siswa`
--
ALTER TABLE `mapel_siswa`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `siswa`
--
ALTER TABLE `siswa`
  ADD PRIMARY KEY (`id`);

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
-- AUTO_INCREMENT for table `guru`
--
ALTER TABLE `guru`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `mapel`
--
ALTER TABLE `mapel`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `mapel_siswa`
--
ALTER TABLE `mapel_siswa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `siswa`
--
ALTER TABLE `siswa`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

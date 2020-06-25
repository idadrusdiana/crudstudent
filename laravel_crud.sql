-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 22, 2020 at 07:52 AM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 7.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
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
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
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
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
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
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
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
(4, 0, 'Muhammad', 'Gagan', 'L', 'Islam', 'Depok', NULL, '2020-04-21 17:00:00', '2020-04-24 09:14:42'),
(5, 0, 'Iman', 'Supriadi', 'L', 'Islam', 'Bekasi', NULL, '2020-04-21 17:00:00', '2020-04-24 09:13:48'),
(6, 0, 'Andi', 'Sulaeman', 'L', 'Islam', 'Bandung', NULL, '2020-04-23 10:21:01', '2020-04-23 10:21:01'),
(7, 0, 'Didin', 'Afifuddin', 'L', 'Islam', 'Majalengka', NULL, '2020-04-23 10:27:37', '2020-04-23 10:27:37'),
(9, 0, 'Muhammad', 'Taufiq', 'L', 'Islam', 'Cirebon', NULL, '2020-04-24 07:53:57', '2020-04-24 07:53:57'),
(10, 0, 'Ikhwan', 'Maulana', 'L', 'Islam', 'Cirebon', NULL, '2020-04-24 09:15:16', '2020-04-24 09:15:16'),
(11, 0, 'Anwar', 'Nurrahman', 'L', 'Islam', 'Bandung', NULL, '2020-04-24 10:25:16', '2020-04-24 10:25:16'),
(12, 0, 'Andi', 'Kurniawa', 'L', 'Islam', 'Ciledug', NULL, '2020-04-27 09:22:47', '2020-04-27 09:22:47'),
(13, 3, 'Azil', 'Ilham', 'L', 'Islam', 'Bandung', NULL, '2020-04-27 09:53:52', '2020-04-27 09:53:52'),
(15, 6, 'Mahmud', 'Azhari', 'L', 'Islam', 'Jakarta', NULL, '2020-04-29 11:33:41', '2020-04-29 11:33:41'),
(16, 7, 'Muhammad', 'Reynaldi', 'L', 'Islam', 'Bekasi', NULL, '2020-04-29 11:38:40', '2020-04-29 11:38:40'),
(17, 8, 'Rifaldi', 'Akhbar', 'L', 'Islam', 'Bandung', 'D:\\xampp\\tmp\\phpC6C.tmp', '2020-04-29 11:51:38', '2020-04-29 11:51:38'),
(18, 9, 'Muhammad', 'Yusuf', 'L', 'Islam', 'Bandung', 'fron NPIC.jpeg', '2020-04-29 11:55:05', '2020-04-29 11:55:05');

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
(11, 'admin', 'Anwar', 'anwar@gmail.com', NULL, '$2y$10$xThMzPNl.9oS3q9bSNK.BOCjOz6Zziwy6MxPJe4053I7uVHNo3qye', 'FZKu23wdyEOyhzWLolsoT8ZbnFiSw4XSoz93j1e0hl4bdws8MOURQwquTsdi', '2020-05-26 14:21:22', '2020-05-26 14:21:22');

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
-- AUTO_INCREMENT for table `siswa`
--
ALTER TABLE `siswa`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

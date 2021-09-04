DROP SCHEMA IF EXISTS posse;
CREATE SCHEMA posse;
USE posse;


-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- ホスト: mysql
-- 生成日時: 2021 年 9 月 04 日 05:17
-- サーバのバージョン： 8.0.23
-- PHP のバージョン: 7.4.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+09:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- データベース: `posse`
--

-- --------------------------------------------------------

--
-- テーブルの構造 `events`
--

CREATE TABLE `events` (
  `id` int NOT NULL,
  `name` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `start_at` datetime DEFAULT NULL,
  `end_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- テーブルのデータのダンプ `events`
--

INSERT INTO `events` (`id`, `name`, `start_at`, `end_at`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '縦モク', '2021-09-04 21:00:00', '2021-09-09 23:00:00', '2021-09-03 01:50:46', '2021-09-04 04:59:05', NULL),
(2, '横モク', '2021-09-04 21:00:00', '2021-09-04 23:00:00', '2021-09-03 01:50:46', '2021-09-04 04:59:15', NULL),
(3, 'スペモク', '2021-09-05 20:00:00', '2021-09-05 22:00:00', '2021-09-03 01:50:46', '2021-09-04 04:59:21', NULL),
(4, '縦モク', '2021-09-06 21:00:00', '2021-09-06 14:00:08', '2021-09-03 01:50:46', '2021-09-04 05:00:11', NULL),
(5, '横モク', '2021-09-07 21:00:00', '2021-09-09 14:00:13', '2021-09-03 01:50:46', '2021-09-04 05:00:17', NULL),
(6, 'スペモク', '2021-09-08 20:00:00', '2021-09-08 14:00:18', '2021-09-03 01:50:46', '2021-09-04 05:00:22', NULL),
(7, '縦モク', '2021-09-09 21:00:00', '2021-09-09 23:00:00', '2021-09-03 01:50:46', '2021-09-04 05:00:00', NULL),
(8, '横モク', '2021-09-09 21:00:00', '2021-09-09 23:00:00', '2021-09-03 01:50:46', '2021-09-04 05:00:43', NULL),
(9, 'スペモク', '2021-09-10 20:00:00', '2021-09-10 22:00:00', '2021-09-03 01:50:46', '2021-09-04 05:00:59', NULL),
(10, '縦モク', '2021-09-13 21:00:00', '2021-09-13 23:00:00', '2021-09-03 01:50:46', '2021-09-04 05:01:08', NULL),
(11, '横モク', '2021-09-17 14:01:21', '2021-09-17 23:00:00', '2021-09-03 01:50:46', '2021-09-04 05:01:25', NULL),
(12, 'スペモク', '2021-09-09 20:00:00', '2021-08-09 22:00:00', '2021-09-03 01:50:46', '2021-09-04 05:01:38', NULL),
(13, '遊び', '2021-09-06 18:00:00', '2021-09-06 22:00:00', '2021-09-03 01:50:46', '2021-09-04 05:01:50', NULL),
(14, 'ハッカソン', '2021-09-03 10:00:00', '2021-09-06 22:00:00', '2021-09-03 01:50:46', '2021-09-04 05:02:00', NULL),
(15, '遊び', '2021-09-04 18:00:00', '2021-09-06 22:00:00', '2021-09-03 01:50:46', '2021-09-03 13:17:43', NULL);

-- --------------------------------------------------------

--
-- テーブルの構造 `event_attendance`
--

CREATE TABLE `event_attendance` (
  `id` int NOT NULL,
  `event_id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  `status_id` int NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- テーブルのデータのダンプ `event_attendance`
--

INSERT INTO `event_attendance` (`id`, `event_id`, `user_id`, `status_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 1, 1, '2021-09-03 01:50:46', '2021-09-03 04:53:19', NULL),
(2, 1, 2, 1, '2021-09-03 01:50:46', '2021-09-03 05:01:56', NULL),
(3, 1, 3, 0, '2021-09-03 01:50:46', '2021-09-03 10:13:05', NULL),
(4, 2, 1, 2, '2021-09-03 01:50:46', '2021-09-04 04:55:58', NULL),
(5, 2, 2, 1, '2021-09-03 01:50:46', '2021-09-03 05:02:04', NULL),
(6, 2, 3, 1, '2021-09-03 01:50:46', '2021-09-04 04:56:01', NULL),
(7, 1, 4, 1, '2021-09-03 02:31:56', '2021-09-03 05:02:50', NULL),
(9, 2, 4, 0, '2021-09-03 10:00:48', '2021-09-03 12:07:40', NULL),
(10, 3, 1, 2, '2021-09-03 10:00:48', '2021-09-04 04:56:16', NULL),
(11, 3, 2, 0, '2021-09-03 10:00:48', '2021-09-03 12:08:02', NULL),
(12, 3, 3, 1, '2021-09-03 10:00:48', '2021-09-04 04:53:31', NULL),
(13, 3, 4, 0, '2021-09-03 10:00:48', '2021-09-04 04:53:33', NULL),
(14, 4, 1, 1, '2021-09-04 04:55:11', '2021-09-04 04:56:14', NULL),
(15, 4, 2, 2, '2021-09-04 04:55:11', '2021-09-04 04:56:10', NULL),
(16, 4, 3, 0, '2021-09-04 04:55:11', '2021-09-04 04:55:11', NULL),
(17, 4, 4, 1, '2021-09-04 04:55:11', '2021-09-04 04:56:04', NULL),
(21, 5, 1, 0, '2021-09-04 04:55:25', '2021-09-04 04:55:25', NULL),
(22, 5, 2, 1, '2021-09-04 04:55:25', '2021-09-04 04:56:08', NULL),
(23, 5, 3, 2, '2021-09-04 04:55:25', '2021-09-04 04:56:20', NULL),
(24, 5, 4, 1, '2021-09-04 04:55:25', '2021-09-04 04:56:06', NULL),
(28, 6, 1, 0, '2021-09-04 04:55:32', '2021-09-04 04:55:32', NULL),
(29, 6, 2, 1, '2021-09-04 04:55:32', '2021-09-04 04:56:12', NULL),
(30, 6, 3, 0, '2021-09-04 04:55:32', '2021-09-04 04:55:32', NULL),
(31, 6, 4, 0, '2021-09-04 04:55:32', '2021-09-04 04:55:32', NULL),
(35, 7, 1, 0, '2021-09-04 04:56:40', '2021-09-04 04:56:40', NULL),
(36, 7, 2, 0, '2021-09-04 04:56:40', '2021-09-04 04:56:40', NULL),
(37, 7, 3, 0, '2021-09-04 04:56:40', '2021-09-04 04:56:40', NULL),
(38, 7, 4, 0, '2021-09-04 04:56:40', '2021-09-04 04:56:40', NULL),
(42, 8, 1, 0, '2021-09-04 04:57:38', '2021-09-04 04:57:38', NULL),
(43, 8, 2, 0, '2021-09-04 04:57:38', '2021-09-04 04:57:38', NULL),
(44, 8, 3, 0, '2021-09-04 04:57:38', '2021-09-04 04:57:38', NULL),
(45, 8, 4, 0, '2021-09-04 04:57:38', '2021-09-04 04:57:38', NULL),
(49, 9, 1, 0, '2021-09-04 04:57:46', '2021-09-04 04:57:46', NULL),
(50, 9, 2, 0, '2021-09-04 04:57:46', '2021-09-04 04:57:46', NULL),
(51, 9, 3, 0, '2021-09-04 04:57:46', '2021-09-04 04:57:46', NULL),
(52, 9, 4, 0, '2021-09-04 04:57:46', '2021-09-04 04:57:46', NULL),
(56, 10, 1, 0, '2021-09-04 04:57:53', '2021-09-04 04:57:53', NULL),
(57, 10, 2, 0, '2021-09-04 04:57:53', '2021-09-04 04:57:53', NULL),
(58, 10, 3, 0, '2021-09-04 04:57:53', '2021-09-04 04:57:53', NULL),
(59, 10, 4, 0, '2021-09-04 04:57:53', '2021-09-04 04:57:53', NULL),
(63, 11, 1, 0, '2021-09-04 04:57:58', '2021-09-04 04:57:58', NULL),
(64, 11, 2, 0, '2021-09-04 04:57:58', '2021-09-04 04:57:58', NULL),
(65, 11, 3, 0, '2021-09-04 04:57:58', '2021-09-04 04:57:58', NULL),
(66, 11, 4, 0, '2021-09-04 04:57:58', '2021-09-04 04:57:58', NULL),
(70, 12, 1, 0, '2021-09-04 04:58:03', '2021-09-04 04:58:03', NULL),
(71, 12, 2, 0, '2021-09-04 04:58:03', '2021-09-04 04:58:03', NULL),
(72, 12, 3, 0, '2021-09-04 04:58:03', '2021-09-04 04:58:03', NULL),
(73, 12, 4, 0, '2021-09-04 04:58:03', '2021-09-04 04:58:03', NULL),
(77, 13, 1, 0, '2021-09-04 04:58:08', '2021-09-04 04:58:08', NULL),
(78, 13, 2, 0, '2021-09-04 04:58:08', '2021-09-04 04:58:08', NULL),
(79, 13, 3, 0, '2021-09-04 04:58:08', '2021-09-04 04:58:08', NULL),
(80, 13, 4, 0, '2021-09-04 04:58:08', '2021-09-04 04:58:08', NULL),
(84, 14, 1, 0, '2021-09-04 04:58:13', '2021-09-04 04:58:13', NULL),
(85, 14, 2, 0, '2021-09-04 04:58:13', '2021-09-04 04:58:13', NULL),
(86, 14, 3, 0, '2021-09-04 04:58:13', '2021-09-04 04:58:13', NULL),
(87, 14, 4, 0, '2021-09-04 04:58:13', '2021-09-04 04:58:13', NULL),
(91, 15, 1, 0, '2021-09-04 04:58:18', '2021-09-04 04:58:18', NULL),
(92, 15, 2, 0, '2021-09-04 04:58:18', '2021-09-04 04:58:18', NULL),
(93, 15, 3, 0, '2021-09-04 04:58:18', '2021-09-04 04:58:18', NULL),
(94, 15, 4, 0, '2021-09-04 04:58:18', '2021-09-04 04:58:18', NULL);

-- --------------------------------------------------------

--
-- テーブルの構造 `event_details`
--

CREATE TABLE `event_details` (
  `id` int NOT NULL,
  `event_id` int NOT NULL,
  `text` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- テーブルのデータのダンプ `event_details`
--

INSERT INTO `event_details` (`id`, `event_id`, `text`) VALUES
(1, 1, 'これは1番の詳細だよ'),
(2, 2, 'これは2番の詳細だよ'),
(3, 3, ''),
(4, 4, 'これ詳細だよ'),
(5, 5, 'これ詳細だよ'),
(6, 6, 'これ詳細だよ'),
(7, 7, 'これ詳細だよ'),
(8, 8, '当たり！！'),
(9, 9, '外れ'),
(10, 10, 'これ詳細だよ----'),
(11, 11, 'これ詳細だよ----'),
(12, 12, 'これ詳細だよ----'),
(13, 13, 'これ詳細だよ----'),
(14, 14, 'これ詳細だよ----'),
(15, 15, 'これ----');

-- --------------------------------------------------------

--
-- テーブルの構造 `status`
--

CREATE TABLE `status` (
  `id` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- テーブルのデータのダンプ `status`
--

INSERT INTO `status` (`id`, `name`) VALUES
(0, '未入力'),
(1, '参加'),
(2, '不参加'),
(3, '遅刻'),
(4, '早退');

-- --------------------------------------------------------

--
-- テーブルの構造 `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `admin` int DEFAULT NULL,
  `git_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `slack_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `reset_pass` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- テーブルのデータのダンプ `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `name`, `admin`, `git_id`, `slack_id`, `reset_pass`) VALUES
(1, 'test@com', '$2y$10$qAUTKgOxdh73V6QjFfz4Be.Z1qTG71.YJiknJAAaOeypMmMuDOYy6', 'SHUTO', 1, '', 'U01C72Q45MJ', NULL),
(2, 'test2@com', '$2y$10$FEoRodC7xIfg6CLJPjT4fe6z13j7rRdndYs0JHG1RHYRzjcr1Xtl6', 'DAIKI', 0, '', 'U01H96KU21K', NULL),
(3, 'test3@com', '$2y$10$UdjbbCr8fnk7U21dI6ran.1MFgVF4gqyrmbC1t55f1a8d.FwMAR8a', 'TAROU', 0, '', 'U015H9Q2WTZ', ''),
(4, 'test4@com', '$2y$10$UdjbbCr8fnk7U21dI6ran.1MFgVF4gqyrmbC1t55f1a8d.FwMAR8a', 'MORIPA', 1, '', 'U015H9Q2WTZ', '');

--
-- ダンプしたテーブルのインデックス
--

--
-- テーブルのインデックス `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `event_attendance`
--
ALTER TABLE `event_attendance`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `event_id` (`event_id`,`user_id`);

--
-- テーブルのインデックス `event_details`
--
ALTER TABLE `event_details`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `event_id` (`event_id`);

--
-- テーブルのインデックス `status`
--
ALTER TABLE `status`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- ダンプしたテーブルの AUTO_INCREMENT
--

--
-- テーブルの AUTO_INCREMENT `events`
--
ALTER TABLE `events`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- テーブルの AUTO_INCREMENT `event_attendance`
--
ALTER TABLE `event_attendance`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=98;

--
-- テーブルの AUTO_INCREMENT `event_details`
--
ALTER TABLE `event_details`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- テーブルの AUTO_INCREMENT `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

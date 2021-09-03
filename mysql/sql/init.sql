DROP SCHEMA IF EXISTS posse;
CREATE SCHEMA posse;
USE posse;


-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- ホスト: mysql
-- 生成日時: 2021 年 9 月 03 日 11:53
-- サーバのバージョン： 8.0.23
-- PHP のバージョン: 7.4.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


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
(1, '縦モク', '2021-08-01 21:00:00', '2021-08-01 23:00:00', '2021-09-03 01:50:46', '2021-09-03 01:50:46', NULL),
(2, '横モク', '2021-08-02 21:00:00', '2021-08-02 23:00:00', '2021-09-03 01:50:46', '2021-09-03 01:50:46', NULL),
(3, 'スペモク', '2021-08-03 20:00:00', '2021-08-03 22:00:00', '2021-09-03 01:50:46', '2021-09-03 01:50:46', NULL),
(4, '縦モク', '2021-08-08 21:00:00', '2021-08-08 23:00:00', '2021-09-03 01:50:46', '2021-09-03 01:50:46', NULL),
(5, '横モク', '2021-08-09 21:00:00', '2021-08-09 23:00:00', '2021-09-03 01:50:46', '2021-09-03 01:50:46', NULL),
(6, 'スペモク', '2021-08-10 20:00:00', '2021-08-10 22:00:00', '2021-09-03 01:50:46', '2021-09-03 01:50:46', NULL),
(7, '縦モク', '2021-08-15 21:00:00', '2021-08-15 23:00:00', '2021-09-03 01:50:46', '2021-09-03 01:50:46', NULL),
(8, '横モク', '2021-08-16 21:00:00', '2021-08-16 23:00:00', '2021-09-03 01:50:46', '2021-09-03 01:50:46', NULL),
(9, 'スペモク', '2021-08-17 20:00:00', '2021-08-17 22:00:00', '2021-09-03 01:50:46', '2021-09-03 01:50:46', NULL),
(10, '縦モク', '2021-08-22 21:00:00', '2021-08-22 23:00:00', '2021-09-03 01:50:46', '2021-09-03 01:50:46', NULL),
(11, '横モク', '2021-08-23 21:00:00', '2021-08-23 23:00:00', '2021-09-03 01:50:46', '2021-09-03 01:50:46', NULL),
(12, 'スペモク', '2021-08-24 20:00:00', '2021-08-24 22:00:00', '2021-09-03 01:50:46', '2021-09-03 01:50:46', NULL),
(13, '遊び', '2021-09-22 18:00:00', '2021-09-22 22:00:00', '2021-09-03 01:50:46', '2021-09-03 01:50:46', NULL),
(14, 'ハッカソン', '2021-09-03 10:00:00', '2021-09-03 22:00:00', '2021-09-03 01:50:46', '2021-09-03 01:50:46', NULL),
(15, '遊び', '2021-09-06 18:00:00', '2021-09-06 22:00:00', '2021-09-03 01:50:46', '2021-09-03 01:50:46', NULL);

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
(4, 2, 1, 0, '2021-09-03 01:50:46', '2021-09-03 10:13:03', NULL),
(5, 2, 2, 1, '2021-09-03 01:50:46', '2021-09-03 05:02:04', NULL),
(6, 3, 1, 0, '2021-09-03 01:50:46', '2021-09-03 10:13:08', NULL),
(7, 1, 4, 1, '2021-09-03 02:31:56', '2021-09-03 05:02:50', NULL),
(9, 6, 1, 0, '2021-09-03 10:00:48', '2021-09-03 10:00:48', NULL),
(10, 6, 2, 0, '2021-09-03 10:00:48', '2021-09-03 10:00:48', NULL),
(11, 6, 3, 0, '2021-09-03 10:00:48', '2021-09-03 10:00:48', NULL);

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
(7, 7, 'これ詳細だよ');

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
  `admin` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- テーブルのデータのダンプ `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `name`, `admin`) VALUES
(1, 'test@com', '$2y$10$UdjbbCr8fnk7U21dI6ran.1MFgVF4gqyrmbC1t55f1a8d.FwMAR8a', 'SHUTO', 1),
(2, 'test2@com', '$2y$10$UdjbbCr8fnk7U21dI6ran.1MFgVF4gqyrmbC1t55f1a8d.FwMAR8a', 'DAIKI', 1),
(3, 'test3@com', '$2y$10$UdjbbCr8fnk7U21dI6ran.1MFgVF4gqyrmbC1t55f1a8d.FwMAR8a', 'TAROU', 1),
(4, 'test4@com', '$2y$10$UdjbbCr8fnk7U21dI6ran.1MFgVF4gqyrmbC1t55f1a8d.FwMAR8a', 'MORIPA', 1);

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
  ADD PRIMARY KEY (`id`);

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
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- テーブルの AUTO_INCREMENT `event_details`
--
ALTER TABLE `event_details`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- テーブルの AUTO_INCREMENT `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
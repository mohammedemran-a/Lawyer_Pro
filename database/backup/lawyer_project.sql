-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 05, 2025 at 07:56 PM
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
-- Database: `lawyer_project`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE `accounts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `account_name` varchar(150) NOT NULL,
  `account_type` enum('بنك','نقدي','محفظة') NOT NULL,
  `currency` varchar(10) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `activity_logs`
--

CREATE TABLE `activity_logs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `action` varchar(50) NOT NULL,
  `table_name` varchar(100) NOT NULL,
  `record_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `admin_agent_bots`
--

CREATE TABLE `admin_agent_bots` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `admin_user_id` bigint(20) UNSIGNED NOT NULL,
  `task` text NOT NULL,
  `result` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `app_settings`
--

CREATE TABLE `app_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key_name` varchar(120) NOT NULL,
  `value_json` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`value_json`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `authorizations`
--

CREATE TABLE `authorizations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED DEFAULT NULL,
  `lawyer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `type` enum('خاص','عام') NOT NULL,
  `company_name` varchar(200) DEFAULT NULL,
  `year` date DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `office_file_no` varchar(100) DEFAULT NULL,
  `attachments` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`attachments`)),
  `notes` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `a_i_training_data`
--

CREATE TABLE `a_i_training_data` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `source` varchar(150) NOT NULL,
  `category` varchar(120) DEFAULT NULL,
  `content` longtext NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bot_feedbaks`
--

CREATE TABLE `bot_feedbaks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `bot_kind` enum('LegalAssistant','AdminAgent') NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `rating` tinyint(4) NOT NULL,
  `comment` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cache`
--

INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
('laravel-cache-livewire-rate-limiter:a17961fa74e9275d529f489537f179c05d50c2f3', 'i:1;', 1759686654),
('laravel-cache-livewire-rate-limiter:a17961fa74e9275d529f489537f179c05d50c2f3:timer', 'i:1759686654;', 1759686654),
('laravel-cache-spatie.permission.cache', 'a:3:{s:5:\"alias\";a:4:{s:1:\"a\";s:2:\"id\";s:1:\"b\";s:4:\"name\";s:1:\"c\";s:10:\"guard_name\";s:1:\"r\";s:5:\"roles\";}s:11:\"permissions\";a:249:{i:0;a:4:{s:1:\"a\";i:1;s:1:\"b\";s:12:\"view_account\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:1;a:4:{s:1:\"a\";i:2;s:1:\"b\";s:16:\"view_any_account\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:2;a:4:{s:1:\"a\";i:3;s:1:\"b\";s:14:\"create_account\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:3;a:4:{s:1:\"a\";i:4;s:1:\"b\";s:14:\"update_account\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:4;a:4:{s:1:\"a\";i:5;s:1:\"b\";s:15:\"restore_account\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:5;a:4:{s:1:\"a\";i:6;s:1:\"b\";s:19:\"restore_any_account\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:6;a:4:{s:1:\"a\";i:7;s:1:\"b\";s:17:\"replicate_account\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:7;a:4:{s:1:\"a\";i:8;s:1:\"b\";s:15:\"reorder_account\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:8;a:4:{s:1:\"a\";i:9;s:1:\"b\";s:14:\"delete_account\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:9;a:4:{s:1:\"a\";i:10;s:1:\"b\";s:18:\"delete_any_account\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:10;a:4:{s:1:\"a\";i:11;s:1:\"b\";s:20:\"force_delete_account\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:11;a:4:{s:1:\"a\";i:12;s:1:\"b\";s:24:\"force_delete_any_account\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:12;a:4:{s:1:\"a\";i:13;s:1:\"b\";s:18:\"view_authorization\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:13;a:4:{s:1:\"a\";i:14;s:1:\"b\";s:22:\"view_any_authorization\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:14;a:4:{s:1:\"a\";i:15;s:1:\"b\";s:20:\"create_authorization\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:15;a:4:{s:1:\"a\";i:16;s:1:\"b\";s:20:\"update_authorization\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:16;a:4:{s:1:\"a\";i:17;s:1:\"b\";s:21:\"restore_authorization\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:17;a:4:{s:1:\"a\";i:18;s:1:\"b\";s:25:\"restore_any_authorization\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:18;a:4:{s:1:\"a\";i:19;s:1:\"b\";s:23:\"replicate_authorization\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:19;a:4:{s:1:\"a\";i:20;s:1:\"b\";s:21:\"reorder_authorization\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:20;a:4:{s:1:\"a\";i:21;s:1:\"b\";s:20:\"delete_authorization\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:21;a:4:{s:1:\"a\";i:22;s:1:\"b\";s:24:\"delete_any_authorization\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:22;a:4:{s:1:\"a\";i:23;s:1:\"b\";s:26:\"force_delete_authorization\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:23;a:4:{s:1:\"a\";i:24;s:1:\"b\";s:30:\"force_delete_any_authorization\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:24;a:4:{s:1:\"a\";i:25;s:1:\"b\";s:11:\"view_client\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:25;a:4:{s:1:\"a\";i:26;s:1:\"b\";s:15:\"view_any_client\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:26;a:4:{s:1:\"a\";i:27;s:1:\"b\";s:13:\"create_client\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:27;a:4:{s:1:\"a\";i:28;s:1:\"b\";s:13:\"update_client\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:28;a:4:{s:1:\"a\";i:29;s:1:\"b\";s:14:\"restore_client\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:29;a:4:{s:1:\"a\";i:30;s:1:\"b\";s:18:\"restore_any_client\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:30;a:4:{s:1:\"a\";i:31;s:1:\"b\";s:16:\"replicate_client\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:31;a:4:{s:1:\"a\";i:32;s:1:\"b\";s:14:\"reorder_client\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:32;a:4:{s:1:\"a\";i:33;s:1:\"b\";s:13:\"delete_client\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:33;a:4:{s:1:\"a\";i:34;s:1:\"b\";s:17:\"delete_any_client\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:34;a:4:{s:1:\"a\";i:35;s:1:\"b\";s:19:\"force_delete_client\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:35;a:4:{s:1:\"a\";i:36;s:1:\"b\";s:23:\"force_delete_any_client\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:36;a:4:{s:1:\"a\";i:37;s:1:\"b\";s:10:\"view_court\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:37;a:4:{s:1:\"a\";i:38;s:1:\"b\";s:14:\"view_any_court\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:38;a:4:{s:1:\"a\";i:39;s:1:\"b\";s:12:\"create_court\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:39;a:4:{s:1:\"a\";i:40;s:1:\"b\";s:12:\"update_court\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:40;a:4:{s:1:\"a\";i:41;s:1:\"b\";s:13:\"restore_court\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:41;a:4:{s:1:\"a\";i:42;s:1:\"b\";s:17:\"restore_any_court\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:42;a:4:{s:1:\"a\";i:43;s:1:\"b\";s:15:\"replicate_court\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:43;a:4:{s:1:\"a\";i:44;s:1:\"b\";s:13:\"reorder_court\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:44;a:4:{s:1:\"a\";i:45;s:1:\"b\";s:12:\"delete_court\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:45;a:4:{s:1:\"a\";i:46;s:1:\"b\";s:16:\"delete_any_court\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:46;a:4:{s:1:\"a\";i:47;s:1:\"b\";s:18:\"force_delete_court\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:47;a:4:{s:1:\"a\";i:48;s:1:\"b\";s:22:\"force_delete_any_court\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:48;a:4:{s:1:\"a\";i:49;s:1:\"b\";s:18:\"view_daily::report\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:49;a:4:{s:1:\"a\";i:50;s:1:\"b\";s:22:\"view_any_daily::report\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:50;a:4:{s:1:\"a\";i:51;s:1:\"b\";s:20:\"create_daily::report\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:51;a:4:{s:1:\"a\";i:52;s:1:\"b\";s:20:\"update_daily::report\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:52;a:4:{s:1:\"a\";i:53;s:1:\"b\";s:21:\"restore_daily::report\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:53;a:4:{s:1:\"a\";i:54;s:1:\"b\";s:25:\"restore_any_daily::report\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:54;a:4:{s:1:\"a\";i:55;s:1:\"b\";s:23:\"replicate_daily::report\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:55;a:4:{s:1:\"a\";i:56;s:1:\"b\";s:21:\"reorder_daily::report\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:56;a:4:{s:1:\"a\";i:57;s:1:\"b\";s:20:\"delete_daily::report\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:57;a:4:{s:1:\"a\";i:58;s:1:\"b\";s:24:\"delete_any_daily::report\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:58;a:4:{s:1:\"a\";i:59;s:1:\"b\";s:26:\"force_delete_daily::report\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:59;a:4:{s:1:\"a\";i:60;s:1:\"b\";s:30:\"force_delete_any_daily::report\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:60;a:4:{s:1:\"a\";i:61;s:1:\"b\";s:13:\"view_document\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:61;a:4:{s:1:\"a\";i:62;s:1:\"b\";s:17:\"view_any_document\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:62;a:4:{s:1:\"a\";i:63;s:1:\"b\";s:15:\"create_document\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:63;a:4:{s:1:\"a\";i:64;s:1:\"b\";s:15:\"update_document\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:64;a:4:{s:1:\"a\";i:65;s:1:\"b\";s:16:\"restore_document\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:65;a:4:{s:1:\"a\";i:66;s:1:\"b\";s:20:\"restore_any_document\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:66;a:4:{s:1:\"a\";i:67;s:1:\"b\";s:18:\"replicate_document\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:67;a:4:{s:1:\"a\";i:68;s:1:\"b\";s:16:\"reorder_document\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:68;a:4:{s:1:\"a\";i:69;s:1:\"b\";s:15:\"delete_document\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:69;a:4:{s:1:\"a\";i:70;s:1:\"b\";s:19:\"delete_any_document\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:70;a:4:{s:1:\"a\";i:71;s:1:\"b\";s:21:\"force_delete_document\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:71;a:4:{s:1:\"a\";i:72;s:1:\"b\";s:25:\"force_delete_any_document\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:72;a:4:{s:1:\"a\";i:73;s:1:\"b\";s:20:\"view_document::trash\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:73;a:4:{s:1:\"a\";i:74;s:1:\"b\";s:24:\"view_any_document::trash\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:74;a:4:{s:1:\"a\";i:75;s:1:\"b\";s:22:\"create_document::trash\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:75;a:4:{s:1:\"a\";i:76;s:1:\"b\";s:22:\"update_document::trash\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:76;a:4:{s:1:\"a\";i:77;s:1:\"b\";s:23:\"restore_document::trash\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:77;a:4:{s:1:\"a\";i:78;s:1:\"b\";s:27:\"restore_any_document::trash\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:78;a:4:{s:1:\"a\";i:79;s:1:\"b\";s:25:\"replicate_document::trash\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:79;a:4:{s:1:\"a\";i:80;s:1:\"b\";s:23:\"reorder_document::trash\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:80;a:4:{s:1:\"a\";i:81;s:1:\"b\";s:22:\"delete_document::trash\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:81;a:4:{s:1:\"a\";i:82;s:1:\"b\";s:26:\"delete_any_document::trash\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:82;a:4:{s:1:\"a\";i:83;s:1:\"b\";s:28:\"force_delete_document::trash\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:83;a:4:{s:1:\"a\";i:84;s:1:\"b\";s:32:\"force_delete_any_document::trash\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:84;a:4:{s:1:\"a\";i:85;s:1:\"b\";s:22:\"view_fee::distribution\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:85;a:4:{s:1:\"a\";i:86;s:1:\"b\";s:26:\"view_any_fee::distribution\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:86;a:4:{s:1:\"a\";i:87;s:1:\"b\";s:24:\"create_fee::distribution\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:87;a:4:{s:1:\"a\";i:88;s:1:\"b\";s:24:\"update_fee::distribution\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:88;a:4:{s:1:\"a\";i:89;s:1:\"b\";s:25:\"restore_fee::distribution\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:89;a:4:{s:1:\"a\";i:90;s:1:\"b\";s:29:\"restore_any_fee::distribution\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:90;a:4:{s:1:\"a\";i:91;s:1:\"b\";s:27:\"replicate_fee::distribution\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:91;a:4:{s:1:\"a\";i:92;s:1:\"b\";s:25:\"reorder_fee::distribution\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:92;a:4:{s:1:\"a\";i:93;s:1:\"b\";s:24:\"delete_fee::distribution\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:93;a:4:{s:1:\"a\";i:94;s:1:\"b\";s:28:\"delete_any_fee::distribution\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:94;a:4:{s:1:\"a\";i:95;s:1:\"b\";s:30:\"force_delete_fee::distribution\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:95;a:4:{s:1:\"a\";i:96;s:1:\"b\";s:34:\"force_delete_any_fee::distribution\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:96;a:4:{s:1:\"a\";i:97;s:1:\"b\";s:12:\"view_hearing\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:97;a:4:{s:1:\"a\";i:98;s:1:\"b\";s:16:\"view_any_hearing\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:98;a:4:{s:1:\"a\";i:99;s:1:\"b\";s:14:\"create_hearing\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:99;a:4:{s:1:\"a\";i:100;s:1:\"b\";s:14:\"update_hearing\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:100;a:4:{s:1:\"a\";i:101;s:1:\"b\";s:15:\"restore_hearing\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:101;a:4:{s:1:\"a\";i:102;s:1:\"b\";s:19:\"restore_any_hearing\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:102;a:4:{s:1:\"a\";i:103;s:1:\"b\";s:17:\"replicate_hearing\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:103;a:4:{s:1:\"a\";i:104;s:1:\"b\";s:15:\"reorder_hearing\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:104;a:4:{s:1:\"a\";i:105;s:1:\"b\";s:14:\"delete_hearing\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:105;a:4:{s:1:\"a\";i:106;s:1:\"b\";s:18:\"delete_any_hearing\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:106;a:4:{s:1:\"a\";i:107;s:1:\"b\";s:20:\"force_delete_hearing\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:107;a:4:{s:1:\"a\";i:108;s:1:\"b\";s:24:\"force_delete_any_hearing\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:108;a:4:{s:1:\"a\";i:109;s:1:\"b\";s:19:\"view_laws::document\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:109;a:4:{s:1:\"a\";i:110;s:1:\"b\";s:23:\"view_any_laws::document\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:110;a:4:{s:1:\"a\";i:111;s:1:\"b\";s:21:\"create_laws::document\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:111;a:4:{s:1:\"a\";i:112;s:1:\"b\";s:21:\"update_laws::document\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:112;a:4:{s:1:\"a\";i:113;s:1:\"b\";s:22:\"restore_laws::document\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:113;a:4:{s:1:\"a\";i:114;s:1:\"b\";s:26:\"restore_any_laws::document\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:114;a:4:{s:1:\"a\";i:115;s:1:\"b\";s:24:\"replicate_laws::document\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:115;a:4:{s:1:\"a\";i:116;s:1:\"b\";s:22:\"reorder_laws::document\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:116;a:4:{s:1:\"a\";i:117;s:1:\"b\";s:21:\"delete_laws::document\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:117;a:4:{s:1:\"a\";i:118;s:1:\"b\";s:25:\"delete_any_laws::document\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:118;a:4:{s:1:\"a\";i:119;s:1:\"b\";s:27:\"force_delete_laws::document\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:119;a:4:{s:1:\"a\";i:120;s:1:\"b\";s:31:\"force_delete_any_laws::document\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:120;a:4:{s:1:\"a\";i:121;s:1:\"b\";s:11:\"view_lawyer\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:121;a:4:{s:1:\"a\";i:122;s:1:\"b\";s:15:\"view_any_lawyer\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:122;a:4:{s:1:\"a\";i:123;s:1:\"b\";s:13:\"create_lawyer\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:123;a:4:{s:1:\"a\";i:124;s:1:\"b\";s:13:\"update_lawyer\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:124;a:4:{s:1:\"a\";i:125;s:1:\"b\";s:14:\"restore_lawyer\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:125;a:4:{s:1:\"a\";i:126;s:1:\"b\";s:18:\"restore_any_lawyer\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:126;a:4:{s:1:\"a\";i:127;s:1:\"b\";s:16:\"replicate_lawyer\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:127;a:4:{s:1:\"a\";i:128;s:1:\"b\";s:14:\"reorder_lawyer\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:128;a:4:{s:1:\"a\";i:129;s:1:\"b\";s:13:\"delete_lawyer\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:129;a:4:{s:1:\"a\";i:130;s:1:\"b\";s:17:\"delete_any_lawyer\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:130;a:4:{s:1:\"a\";i:131;s:1:\"b\";s:19:\"force_delete_lawyer\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:131;a:4:{s:1:\"a\";i:132;s:1:\"b\";s:23:\"force_delete_any_lawyer\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:132;a:4:{s:1:\"a\";i:133;s:1:\"b\";s:23:\"view_lawyer::attachment\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:133;a:4:{s:1:\"a\";i:134;s:1:\"b\";s:27:\"view_any_lawyer::attachment\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:134;a:4:{s:1:\"a\";i:135;s:1:\"b\";s:25:\"create_lawyer::attachment\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:135;a:4:{s:1:\"a\";i:136;s:1:\"b\";s:25:\"update_lawyer::attachment\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:136;a:4:{s:1:\"a\";i:137;s:1:\"b\";s:26:\"restore_lawyer::attachment\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:137;a:4:{s:1:\"a\";i:138;s:1:\"b\";s:30:\"restore_any_lawyer::attachment\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:138;a:4:{s:1:\"a\";i:139;s:1:\"b\";s:28:\"replicate_lawyer::attachment\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:139;a:4:{s:1:\"a\";i:140;s:1:\"b\";s:26:\"reorder_lawyer::attachment\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:140;a:4:{s:1:\"a\";i:141;s:1:\"b\";s:25:\"delete_lawyer::attachment\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:141;a:4:{s:1:\"a\";i:142;s:1:\"b\";s:29:\"delete_any_lawyer::attachment\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:142;a:4:{s:1:\"a\";i:143;s:1:\"b\";s:31:\"force_delete_lawyer::attachment\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:143;a:4:{s:1:\"a\";i:144;s:1:\"b\";s:35:\"force_delete_any_lawyer::attachment\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:144;a:4:{s:1:\"a\";i:145;s:1:\"b\";s:20:\"view_lawyer::contact\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:145;a:4:{s:1:\"a\";i:146;s:1:\"b\";s:24:\"view_any_lawyer::contact\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:146;a:4:{s:1:\"a\";i:147;s:1:\"b\";s:22:\"create_lawyer::contact\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:147;a:4:{s:1:\"a\";i:148;s:1:\"b\";s:22:\"update_lawyer::contact\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:148;a:4:{s:1:\"a\";i:149;s:1:\"b\";s:23:\"restore_lawyer::contact\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:149;a:4:{s:1:\"a\";i:150;s:1:\"b\";s:27:\"restore_any_lawyer::contact\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:150;a:4:{s:1:\"a\";i:151;s:1:\"b\";s:25:\"replicate_lawyer::contact\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:151;a:4:{s:1:\"a\";i:152;s:1:\"b\";s:23:\"reorder_lawyer::contact\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:152;a:4:{s:1:\"a\";i:153;s:1:\"b\";s:22:\"delete_lawyer::contact\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:153;a:4:{s:1:\"a\";i:154;s:1:\"b\";s:26:\"delete_any_lawyer::contact\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:154;a:4:{s:1:\"a\";i:155;s:1:\"b\";s:28:\"force_delete_lawyer::contact\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:155;a:4:{s:1:\"a\";i:156;s:1:\"b\";s:32:\"force_delete_any_lawyer::contact\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:156;a:4:{s:1:\"a\";i:157;s:1:\"b\";s:14:\"view_legalcase\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:157;a:4:{s:1:\"a\";i:158;s:1:\"b\";s:18:\"view_any_legalcase\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:158;a:4:{s:1:\"a\";i:159;s:1:\"b\";s:16:\"create_legalcase\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:159;a:4:{s:1:\"a\";i:160;s:1:\"b\";s:16:\"update_legalcase\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:160;a:4:{s:1:\"a\";i:161;s:1:\"b\";s:17:\"restore_legalcase\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:161;a:4:{s:1:\"a\";i:162;s:1:\"b\";s:21:\"restore_any_legalcase\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:162;a:4:{s:1:\"a\";i:163;s:1:\"b\";s:19:\"replicate_legalcase\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:163;a:4:{s:1:\"a\";i:164;s:1:\"b\";s:17:\"reorder_legalcase\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:164;a:4:{s:1:\"a\";i:165;s:1:\"b\";s:16:\"delete_legalcase\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:165;a:4:{s:1:\"a\";i:166;s:1:\"b\";s:20:\"delete_any_legalcase\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:166;a:4:{s:1:\"a\";i:167;s:1:\"b\";s:22:\"force_delete_legalcase\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:167;a:4:{s:1:\"a\";i:168;s:1:\"b\";s:26:\"force_delete_any_legalcase\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:168;a:4:{s:1:\"a\";i:169;s:1:\"b\";s:26:\"view_logal::assistant::bot\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:169;a:4:{s:1:\"a\";i:170;s:1:\"b\";s:30:\"view_any_logal::assistant::bot\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:170;a:4:{s:1:\"a\";i:171;s:1:\"b\";s:28:\"create_logal::assistant::bot\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:171;a:4:{s:1:\"a\";i:172;s:1:\"b\";s:28:\"update_logal::assistant::bot\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:172;a:4:{s:1:\"a\";i:173;s:1:\"b\";s:29:\"restore_logal::assistant::bot\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:173;a:4:{s:1:\"a\";i:174;s:1:\"b\";s:33:\"restore_any_logal::assistant::bot\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:174;a:4:{s:1:\"a\";i:175;s:1:\"b\";s:31:\"replicate_logal::assistant::bot\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:175;a:4:{s:1:\"a\";i:176;s:1:\"b\";s:29:\"reorder_logal::assistant::bot\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:176;a:4:{s:1:\"a\";i:177;s:1:\"b\";s:28:\"delete_logal::assistant::bot\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:177;a:4:{s:1:\"a\";i:178;s:1:\"b\";s:32:\"delete_any_logal::assistant::bot\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:178;a:4:{s:1:\"a\";i:179;s:1:\"b\";s:34:\"force_delete_logal::assistant::bot\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:179;a:4:{s:1:\"a\";i:180;s:1:\"b\";s:38:\"force_delete_any_logal::assistant::bot\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:180;a:4:{s:1:\"a\";i:181;s:1:\"b\";s:32:\"view_revenue::distribution::rule\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:181;a:4:{s:1:\"a\";i:182;s:1:\"b\";s:36:\"view_any_revenue::distribution::rule\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:182;a:4:{s:1:\"a\";i:183;s:1:\"b\";s:34:\"create_revenue::distribution::rule\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:183;a:4:{s:1:\"a\";i:184;s:1:\"b\";s:34:\"update_revenue::distribution::rule\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:184;a:4:{s:1:\"a\";i:185;s:1:\"b\";s:35:\"restore_revenue::distribution::rule\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:185;a:4:{s:1:\"a\";i:186;s:1:\"b\";s:39:\"restore_any_revenue::distribution::rule\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:186;a:4:{s:1:\"a\";i:187;s:1:\"b\";s:37:\"replicate_revenue::distribution::rule\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:187;a:4:{s:1:\"a\";i:188;s:1:\"b\";s:35:\"reorder_revenue::distribution::rule\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:188;a:4:{s:1:\"a\";i:189;s:1:\"b\";s:34:\"delete_revenue::distribution::rule\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:189;a:4:{s:1:\"a\";i:190;s:1:\"b\";s:38:\"delete_any_revenue::distribution::rule\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:190;a:4:{s:1:\"a\";i:191;s:1:\"b\";s:40:\"force_delete_revenue::distribution::rule\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:191;a:4:{s:1:\"a\";i:192;s:1:\"b\";s:44:\"force_delete_any_revenue::distribution::rule\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:192;a:4:{s:1:\"a\";i:193;s:1:\"b\";s:9:\"view_role\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:193;a:4:{s:1:\"a\";i:194;s:1:\"b\";s:13:\"view_any_role\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:194;a:4:{s:1:\"a\";i:195;s:1:\"b\";s:11:\"create_role\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:195;a:4:{s:1:\"a\";i:196;s:1:\"b\";s:11:\"update_role\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:196;a:4:{s:1:\"a\";i:197;s:1:\"b\";s:11:\"delete_role\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:197;a:4:{s:1:\"a\";i:198;s:1:\"b\";s:15:\"delete_any_role\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:198;a:4:{s:1:\"a\";i:199;s:1:\"b\";s:9:\"view_task\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:199;a:4:{s:1:\"a\";i:200;s:1:\"b\";s:13:\"view_any_task\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:200;a:4:{s:1:\"a\";i:201;s:1:\"b\";s:11:\"create_task\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:201;a:4:{s:1:\"a\";i:202;s:1:\"b\";s:11:\"update_task\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:202;a:4:{s:1:\"a\";i:203;s:1:\"b\";s:12:\"restore_task\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:203;a:4:{s:1:\"a\";i:204;s:1:\"b\";s:16:\"restore_any_task\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:204;a:4:{s:1:\"a\";i:205;s:1:\"b\";s:14:\"replicate_task\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:205;a:4:{s:1:\"a\";i:206;s:1:\"b\";s:12:\"reorder_task\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:206;a:4:{s:1:\"a\";i:207;s:1:\"b\";s:11:\"delete_task\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:207;a:4:{s:1:\"a\";i:208;s:1:\"b\";s:15:\"delete_any_task\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:208;a:4:{s:1:\"a\";i:209;s:1:\"b\";s:17:\"force_delete_task\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:209;a:4:{s:1:\"a\";i:210;s:1:\"b\";s:21:\"force_delete_any_task\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:210;a:4:{s:1:\"a\";i:211;s:1:\"b\";s:16:\"view_transaction\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:211;a:4:{s:1:\"a\";i:212;s:1:\"b\";s:20:\"view_any_transaction\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:212;a:4:{s:1:\"a\";i:213;s:1:\"b\";s:18:\"create_transaction\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:213;a:4:{s:1:\"a\";i:214;s:1:\"b\";s:18:\"update_transaction\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:214;a:4:{s:1:\"a\";i:215;s:1:\"b\";s:19:\"restore_transaction\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:215;a:4:{s:1:\"a\";i:216;s:1:\"b\";s:23:\"restore_any_transaction\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:216;a:4:{s:1:\"a\";i:217;s:1:\"b\";s:21:\"replicate_transaction\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:217;a:4:{s:1:\"a\";i:218;s:1:\"b\";s:19:\"reorder_transaction\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:218;a:4:{s:1:\"a\";i:219;s:1:\"b\";s:18:\"delete_transaction\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:219;a:4:{s:1:\"a\";i:220;s:1:\"b\";s:22:\"delete_any_transaction\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:220;a:4:{s:1:\"a\";i:221;s:1:\"b\";s:24:\"force_delete_transaction\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:221;a:4:{s:1:\"a\";i:222;s:1:\"b\";s:28:\"force_delete_any_transaction\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:222;a:4:{s:1:\"a\";i:223;s:1:\"b\";s:27:\"view_transaction::categorie\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:223;a:4:{s:1:\"a\";i:224;s:1:\"b\";s:31:\"view_any_transaction::categorie\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:224;a:4:{s:1:\"a\";i:225;s:1:\"b\";s:29:\"create_transaction::categorie\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:225;a:4:{s:1:\"a\";i:226;s:1:\"b\";s:29:\"update_transaction::categorie\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:226;a:4:{s:1:\"a\";i:227;s:1:\"b\";s:30:\"restore_transaction::categorie\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:227;a:4:{s:1:\"a\";i:228;s:1:\"b\";s:34:\"restore_any_transaction::categorie\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:228;a:4:{s:1:\"a\";i:229;s:1:\"b\";s:32:\"replicate_transaction::categorie\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:229;a:4:{s:1:\"a\";i:230;s:1:\"b\";s:30:\"reorder_transaction::categorie\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:230;a:4:{s:1:\"a\";i:231;s:1:\"b\";s:29:\"delete_transaction::categorie\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:231;a:4:{s:1:\"a\";i:232;s:1:\"b\";s:33:\"delete_any_transaction::categorie\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:232;a:4:{s:1:\"a\";i:233;s:1:\"b\";s:35:\"force_delete_transaction::categorie\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:233;a:4:{s:1:\"a\";i:234;s:1:\"b\";s:39:\"force_delete_any_transaction::categorie\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:234;a:4:{s:1:\"a\";i:235;s:1:\"b\";s:9:\"view_user\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:235;a:4:{s:1:\"a\";i:236;s:1:\"b\";s:13:\"view_any_user\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:236;a:4:{s:1:\"a\";i:237;s:1:\"b\";s:11:\"create_user\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:237;a:4:{s:1:\"a\";i:238;s:1:\"b\";s:11:\"update_user\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:238;a:4:{s:1:\"a\";i:239;s:1:\"b\";s:12:\"restore_user\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:239;a:4:{s:1:\"a\";i:240;s:1:\"b\";s:16:\"restore_any_user\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:240;a:4:{s:1:\"a\";i:241;s:1:\"b\";s:14:\"replicate_user\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:241;a:4:{s:1:\"a\";i:242;s:1:\"b\";s:12:\"reorder_user\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:242;a:4:{s:1:\"a\";i:243;s:1:\"b\";s:11:\"delete_user\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:243;a:4:{s:1:\"a\";i:244;s:1:\"b\";s:15:\"delete_any_user\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:244;a:4:{s:1:\"a\";i:245;s:1:\"b\";s:17:\"force_delete_user\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:245;a:4:{s:1:\"a\";i:246;s:1:\"b\";s:21:\"force_delete_any_user\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:246;a:4:{s:1:\"a\";i:247;s:1:\"b\";s:14:\"page_Dashboard\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:247;a:4:{s:1:\"a\";i:248;s:1:\"b\";s:17:\"widget_CasesStats\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:248;a:4:{s:1:\"a\";i:249;s:1:\"b\";s:17:\"widget_CasesTable\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}}s:5:\"roles\";a:1:{i:0;a:3:{s:1:\"a\";i:1;s:1:\"b\";s:11:\"super_admin\";s:1:\"c\";s:3:\"web\";}}}', 1759772995);

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `case_amendments`
--

CREATE TABLE `case_amendments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `case_id` bigint(20) UNSIGNED NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `old_value` text DEFAULT NULL,
  `new_value` text DEFAULT NULL,
  `modified_by` bigint(20) UNSIGNED NOT NULL,
  `modified_at` datetime NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

CREATE TABLE `clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(150) NOT NULL,
  `type` enum('شركة','فرد') NOT NULL,
  `city` varchar(120) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `email` varchar(150) NOT NULL,
  `username` varchar(120) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `start_at` date DEFAULT NULL,
  `end_at` date DEFAULT NULL,
  `note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `client_contacts`
--

CREATE TABLE `client_contacts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `type` enum('email','phone','address') NOT NULL,
  `value` varchar(500) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `courts`
--

CREATE TABLE `courts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(200) NOT NULL,
  `kind` enum('محكمة','نيابة','قسم شرطة') NOT NULL,
  `level` enum('ابتدائية','استئناف','عليا','غير ذالك') DEFAULT NULL,
  `city` varchar(120) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `location` longtext DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `court_changes`
--

CREATE TABLE `court_changes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `court_id` bigint(20) UNSIGNED DEFAULT NULL,
  `old_location` varchar(255) DEFAULT NULL,
  `new_location` varchar(255) DEFAULT NULL,
  `modifed_by` bigint(20) UNSIGNED DEFAULT NULL,
  `change_date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `daily_reports`
--

CREATE TABLE `daily_reports` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `case_id` bigint(20) UNSIGNED DEFAULT NULL,
  `lawyer_id` bigint(20) UNSIGNED NOT NULL,
  `report_date` date NOT NULL,
  `content` text NOT NULL,
  `week_no` tinyint(4) DEFAULT NULL,
  `status` enum('مكتمل','قيد المراجعة','مرفوض') NOT NULL DEFAULT 'قيد المراجعة',
  `reviewer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `documents`
--

CREATE TABLE `documents` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `case_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED DEFAULT NULL,
  `lawyer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(200) NOT NULL,
  `doc_type` enum('مستند','عريضة','حكم','محضر','أخرى') DEFAULT NULL,
  `storage_type` enum('DB','Path') NOT NULL DEFAULT 'Path',
  `file_path` varchar(500) DEFAULT NULL,
  `file_blob` varchar(255) DEFAULT NULL,
  `upload_at` date DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `is_missing` tinyint(1) NOT NULL DEFAULT 0,
  `in_trash` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
-- Table structure for table `fee_distributions`
--

CREATE TABLE `fee_distributions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `transaction_id` bigint(20) UNSIGNED NOT NULL,
  `beneficiary_type` enum('محامي','مكتب','تكلفة','وكيل') NOT NULL,
  `beneficiary_id` int(11) DEFAULT NULL,
  `rule_type` enum('جلب عميل','حضور جلسة','إعداد عرائض','تكاليف','نسبة المكتب') NOT NULL,
  `percentage` double DEFAULT NULL,
  `amount` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hearings`
--

CREATE TABLE `hearings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `case_id` bigint(20) UNSIGNED DEFAULT NULL,
  `court_id` bigint(20) UNSIGNED DEFAULT NULL,
  `lawyer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED DEFAULT NULL,
  `hearing_datetime` datetime NOT NULL,
  `topic` varchar(200) DEFAULT NULL,
  `decision` text DEFAULT NULL,
  `required_action` text DEFAULT NULL,
  `postponed_to` date DEFAULT NULL,
  `conter` int(11) DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `calendar_tag` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `inventories`
--

CREATE TABLE `inventories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(150) NOT NULL,
  `quantity` int(11) NOT NULL,
  `location` varchar(120) DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `laws_documents`
--

CREATE TABLE `laws_documents` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `law_number` varchar(50) NOT NULL,
  `law_title` varchar(255) NOT NULL,
  `law_description` longtext DEFAULT NULL,
  `issue_date` date DEFAULT NULL,
  `amendment_date` date DEFAULT NULL,
  `law_category` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lawyers`
--

CREATE TABLE `lawyers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(150) NOT NULL,
  `grade` enum('تحت التمرين','ابتدائي','استئناف','عليا') DEFAULT NULL,
  `city` varchar(120) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `email` varchar(150) NOT NULL,
  `username` varchar(120) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `joined_at` date DEFAULT NULL,
  `end_at` date DEFAULT NULL,
  `note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lawyer_attachments`
--

CREATE TABLE `lawyer_attachments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `lawyer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `file_name` varchar(255) NOT NULL,
  `file_path` varchar(512) DEFAULT NULL,
  `category` enum('إنابة','بطاقة نقابة','هوية','اخرى') NOT NULL,
  `storage_type` enum('DB','Path') NOT NULL DEFAULT 'Path',
  `file_blob` blob DEFAULT NULL,
  `uploaded_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lawyer_contacts`
--

CREATE TABLE `lawyer_contacts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `lawyer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `type` enum('phone','email','address') NOT NULL,
  `value` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `legal_case`
--

CREATE TABLE `legal_case` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `case_number` varchar(100) NOT NULL,
  `client_id` bigint(20) UNSIGNED DEFAULT NULL,
  `lawyer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `court_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_role` enum('مدعي','مدعى عليه','مستأنف','مستأنف ضده','طاعن','مجنى عليه','مستشكل','متظلم ضده','مقدم طلب الرد') DEFAULT NULL,
  `title` varchar(200) DEFAULT NULL,
  `category` enum('جنائي','مدني','تجاري','أحوال شخصية','عمالي','أخرى') DEFAULT NULL,
  `status` enum('قيد النظر','منتهية بحكم','معلقة','مؤجلة','مغلقة','منتهية بصلح','منتهية بتنازل','متوقفة') NOT NULL DEFAULT 'قيد النظر',
  `received_at` date DEFAULT NULL,
  `ended_at` date DEFAULT NULL,
  `office_file_no` varchar(100) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `logal_assistant_bots`
--

CREATE TABLE `logal_assistant_bots` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `question` text NOT NULL,
  `response` longtext DEFAULT NULL,
  `source_law_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
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
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2025_09_05_091745_create_lawyers_table', 1),
(5, '2025_09_05_092759_create_lawyer_contacts_table', 1),
(6, '2025_09_05_093214_create_lawyer_attachments_table', 1),
(7, '2025_09_05_094404_create_clients_table', 1),
(8, '2025_09_05_095022_create_client_contacts_table', 1),
(9, '2025_09_05_095336_create_courts_table', 1),
(10, '2025_09_05_095849_create_court_changes_table', 1),
(11, '2025_09_05_100357_create_legal_case_table', 1),
(12, '2025_09_05_101620_create_case_amendments_table', 1),
(13, '2025_09_05_102706_create_hearings_table', 1),
(14, '2025_09_06_015131_add_lawyer_id_to_users_table', 1),
(15, '2025_09_06_015220_add_client_id_to_users_table', 1),
(16, '2025_09_06_021357_create_documents_table', 1),
(17, '2025_09_06_025628_create_authorizations_table', 1),
(18, '2025_09_06_203913_create_accounts_table', 1),
(19, '2025_09_06_204323_create_transaction_categories_table', 1),
(20, '2025_09_06_204443_create_transactions_table', 1),
(21, '2025_09_06_205743_create_revenue_distribution_rules_table', 1),
(22, '2025_09_06_210353_create_fee_distributions_table', 1),
(23, '2025_09_06_211526_create_daily_reports_table', 1),
(24, '2025_09_06_212915_create_tasks_table', 1),
(25, '2025_09_06_213533_create_notifications_table', 1),
(26, '2025_09_06_214015_create_activity_logs_table', 1),
(27, '2025_09_06_214256_create_workflows_table', 1),
(28, '2025_09_06_214748_create_inventories_table', 1),
(29, '2025_09_06_215032_create_laws_documents_table', 1),
(30, '2025_09_06_215251_create_logal_assistant_bots_table', 1),
(31, '2025_09_06_215732_create_admin_agent_bots_table', 1),
(32, '2025_09_06_220005_create_bot_feedbaks_table', 1),
(33, '2025_09_06_220229_create_a_i_training_data_table', 1),
(34, '2025_09_06_220418_create_app_settings_table', 1),
(35, '2025_09_27_162102_create_permission_tables', 1);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 1);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `record_table` varchar(100) DEFAULT NULL,
  `record_id` int(11) DEFAULT NULL,
  `message` text NOT NULL,
  `is_read` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'view_account', 'web', '2025-10-05 14:48:59', '2025-10-05 14:48:59'),
(2, 'view_any_account', 'web', '2025-10-05 14:48:59', '2025-10-05 14:48:59'),
(3, 'create_account', 'web', '2025-10-05 14:48:59', '2025-10-05 14:48:59'),
(4, 'update_account', 'web', '2025-10-05 14:48:59', '2025-10-05 14:48:59'),
(5, 'restore_account', 'web', '2025-10-05 14:48:59', '2025-10-05 14:48:59'),
(6, 'restore_any_account', 'web', '2025-10-05 14:48:59', '2025-10-05 14:48:59'),
(7, 'replicate_account', 'web', '2025-10-05 14:48:59', '2025-10-05 14:48:59'),
(8, 'reorder_account', 'web', '2025-10-05 14:48:59', '2025-10-05 14:48:59'),
(9, 'delete_account', 'web', '2025-10-05 14:48:59', '2025-10-05 14:48:59'),
(10, 'delete_any_account', 'web', '2025-10-05 14:48:59', '2025-10-05 14:48:59'),
(11, 'force_delete_account', 'web', '2025-10-05 14:48:59', '2025-10-05 14:48:59'),
(12, 'force_delete_any_account', 'web', '2025-10-05 14:48:59', '2025-10-05 14:48:59'),
(13, 'view_authorization', 'web', '2025-10-05 14:48:59', '2025-10-05 14:48:59'),
(14, 'view_any_authorization', 'web', '2025-10-05 14:48:59', '2025-10-05 14:48:59'),
(15, 'create_authorization', 'web', '2025-10-05 14:48:59', '2025-10-05 14:48:59'),
(16, 'update_authorization', 'web', '2025-10-05 14:48:59', '2025-10-05 14:48:59'),
(17, 'restore_authorization', 'web', '2025-10-05 14:48:59', '2025-10-05 14:48:59'),
(18, 'restore_any_authorization', 'web', '2025-10-05 14:48:59', '2025-10-05 14:48:59'),
(19, 'replicate_authorization', 'web', '2025-10-05 14:48:59', '2025-10-05 14:48:59'),
(20, 'reorder_authorization', 'web', '2025-10-05 14:48:59', '2025-10-05 14:48:59'),
(21, 'delete_authorization', 'web', '2025-10-05 14:48:59', '2025-10-05 14:48:59'),
(22, 'delete_any_authorization', 'web', '2025-10-05 14:48:59', '2025-10-05 14:48:59'),
(23, 'force_delete_authorization', 'web', '2025-10-05 14:48:59', '2025-10-05 14:48:59'),
(24, 'force_delete_any_authorization', 'web', '2025-10-05 14:48:59', '2025-10-05 14:48:59'),
(25, 'view_client', 'web', '2025-10-05 14:48:59', '2025-10-05 14:48:59'),
(26, 'view_any_client', 'web', '2025-10-05 14:48:59', '2025-10-05 14:48:59'),
(27, 'create_client', 'web', '2025-10-05 14:48:59', '2025-10-05 14:48:59'),
(28, 'update_client', 'web', '2025-10-05 14:48:59', '2025-10-05 14:48:59'),
(29, 'restore_client', 'web', '2025-10-05 14:48:59', '2025-10-05 14:48:59'),
(30, 'restore_any_client', 'web', '2025-10-05 14:48:59', '2025-10-05 14:48:59'),
(31, 'replicate_client', 'web', '2025-10-05 14:48:59', '2025-10-05 14:48:59'),
(32, 'reorder_client', 'web', '2025-10-05 14:48:59', '2025-10-05 14:48:59'),
(33, 'delete_client', 'web', '2025-10-05 14:48:59', '2025-10-05 14:48:59'),
(34, 'delete_any_client', 'web', '2025-10-05 14:48:59', '2025-10-05 14:48:59'),
(35, 'force_delete_client', 'web', '2025-10-05 14:48:59', '2025-10-05 14:48:59'),
(36, 'force_delete_any_client', 'web', '2025-10-05 14:48:59', '2025-10-05 14:48:59'),
(37, 'view_court', 'web', '2025-10-05 14:48:59', '2025-10-05 14:48:59'),
(38, 'view_any_court', 'web', '2025-10-05 14:49:00', '2025-10-05 14:49:00'),
(39, 'create_court', 'web', '2025-10-05 14:49:00', '2025-10-05 14:49:00'),
(40, 'update_court', 'web', '2025-10-05 14:49:00', '2025-10-05 14:49:00'),
(41, 'restore_court', 'web', '2025-10-05 14:49:00', '2025-10-05 14:49:00'),
(42, 'restore_any_court', 'web', '2025-10-05 14:49:00', '2025-10-05 14:49:00'),
(43, 'replicate_court', 'web', '2025-10-05 14:49:00', '2025-10-05 14:49:00'),
(44, 'reorder_court', 'web', '2025-10-05 14:49:00', '2025-10-05 14:49:00'),
(45, 'delete_court', 'web', '2025-10-05 14:49:00', '2025-10-05 14:49:00'),
(46, 'delete_any_court', 'web', '2025-10-05 14:49:00', '2025-10-05 14:49:00'),
(47, 'force_delete_court', 'web', '2025-10-05 14:49:00', '2025-10-05 14:49:00'),
(48, 'force_delete_any_court', 'web', '2025-10-05 14:49:00', '2025-10-05 14:49:00'),
(49, 'view_daily::report', 'web', '2025-10-05 14:49:00', '2025-10-05 14:49:00'),
(50, 'view_any_daily::report', 'web', '2025-10-05 14:49:00', '2025-10-05 14:49:00'),
(51, 'create_daily::report', 'web', '2025-10-05 14:49:00', '2025-10-05 14:49:00'),
(52, 'update_daily::report', 'web', '2025-10-05 14:49:00', '2025-10-05 14:49:00'),
(53, 'restore_daily::report', 'web', '2025-10-05 14:49:00', '2025-10-05 14:49:00'),
(54, 'restore_any_daily::report', 'web', '2025-10-05 14:49:00', '2025-10-05 14:49:00'),
(55, 'replicate_daily::report', 'web', '2025-10-05 14:49:00', '2025-10-05 14:49:00'),
(56, 'reorder_daily::report', 'web', '2025-10-05 14:49:00', '2025-10-05 14:49:00'),
(57, 'delete_daily::report', 'web', '2025-10-05 14:49:00', '2025-10-05 14:49:00'),
(58, 'delete_any_daily::report', 'web', '2025-10-05 14:49:00', '2025-10-05 14:49:00'),
(59, 'force_delete_daily::report', 'web', '2025-10-05 14:49:00', '2025-10-05 14:49:00'),
(60, 'force_delete_any_daily::report', 'web', '2025-10-05 14:49:00', '2025-10-05 14:49:00'),
(61, 'view_document', 'web', '2025-10-05 14:49:00', '2025-10-05 14:49:00'),
(62, 'view_any_document', 'web', '2025-10-05 14:49:00', '2025-10-05 14:49:00'),
(63, 'create_document', 'web', '2025-10-05 14:49:00', '2025-10-05 14:49:00'),
(64, 'update_document', 'web', '2025-10-05 14:49:00', '2025-10-05 14:49:00'),
(65, 'restore_document', 'web', '2025-10-05 14:49:00', '2025-10-05 14:49:00'),
(66, 'restore_any_document', 'web', '2025-10-05 14:49:00', '2025-10-05 14:49:00'),
(67, 'replicate_document', 'web', '2025-10-05 14:49:00', '2025-10-05 14:49:00'),
(68, 'reorder_document', 'web', '2025-10-05 14:49:00', '2025-10-05 14:49:00'),
(69, 'delete_document', 'web', '2025-10-05 14:49:00', '2025-10-05 14:49:00'),
(70, 'delete_any_document', 'web', '2025-10-05 14:49:00', '2025-10-05 14:49:00'),
(71, 'force_delete_document', 'web', '2025-10-05 14:49:00', '2025-10-05 14:49:00'),
(72, 'force_delete_any_document', 'web', '2025-10-05 14:49:00', '2025-10-05 14:49:00'),
(73, 'view_document::trash', 'web', '2025-10-05 14:49:00', '2025-10-05 14:49:00'),
(74, 'view_any_document::trash', 'web', '2025-10-05 14:49:00', '2025-10-05 14:49:00'),
(75, 'create_document::trash', 'web', '2025-10-05 14:49:00', '2025-10-05 14:49:00'),
(76, 'update_document::trash', 'web', '2025-10-05 14:49:00', '2025-10-05 14:49:00'),
(77, 'restore_document::trash', 'web', '2025-10-05 14:49:00', '2025-10-05 14:49:00'),
(78, 'restore_any_document::trash', 'web', '2025-10-05 14:49:00', '2025-10-05 14:49:00'),
(79, 'replicate_document::trash', 'web', '2025-10-05 14:49:00', '2025-10-05 14:49:00'),
(80, 'reorder_document::trash', 'web', '2025-10-05 14:49:00', '2025-10-05 14:49:00'),
(81, 'delete_document::trash', 'web', '2025-10-05 14:49:00', '2025-10-05 14:49:00'),
(82, 'delete_any_document::trash', 'web', '2025-10-05 14:49:00', '2025-10-05 14:49:00'),
(83, 'force_delete_document::trash', 'web', '2025-10-05 14:49:00', '2025-10-05 14:49:00'),
(84, 'force_delete_any_document::trash', 'web', '2025-10-05 14:49:00', '2025-10-05 14:49:00'),
(85, 'view_fee::distribution', 'web', '2025-10-05 14:49:00', '2025-10-05 14:49:00'),
(86, 'view_any_fee::distribution', 'web', '2025-10-05 14:49:00', '2025-10-05 14:49:00'),
(87, 'create_fee::distribution', 'web', '2025-10-05 14:49:00', '2025-10-05 14:49:00'),
(88, 'update_fee::distribution', 'web', '2025-10-05 14:49:00', '2025-10-05 14:49:00'),
(89, 'restore_fee::distribution', 'web', '2025-10-05 14:49:00', '2025-10-05 14:49:00'),
(90, 'restore_any_fee::distribution', 'web', '2025-10-05 14:49:00', '2025-10-05 14:49:00'),
(91, 'replicate_fee::distribution', 'web', '2025-10-05 14:49:00', '2025-10-05 14:49:00'),
(92, 'reorder_fee::distribution', 'web', '2025-10-05 14:49:00', '2025-10-05 14:49:00'),
(93, 'delete_fee::distribution', 'web', '2025-10-05 14:49:00', '2025-10-05 14:49:00'),
(94, 'delete_any_fee::distribution', 'web', '2025-10-05 14:49:00', '2025-10-05 14:49:00'),
(95, 'force_delete_fee::distribution', 'web', '2025-10-05 14:49:00', '2025-10-05 14:49:00'),
(96, 'force_delete_any_fee::distribution', 'web', '2025-10-05 14:49:00', '2025-10-05 14:49:00'),
(97, 'view_hearing', 'web', '2025-10-05 14:49:00', '2025-10-05 14:49:00'),
(98, 'view_any_hearing', 'web', '2025-10-05 14:49:00', '2025-10-05 14:49:00'),
(99, 'create_hearing', 'web', '2025-10-05 14:49:00', '2025-10-05 14:49:00'),
(100, 'update_hearing', 'web', '2025-10-05 14:49:00', '2025-10-05 14:49:00'),
(101, 'restore_hearing', 'web', '2025-10-05 14:49:00', '2025-10-05 14:49:00'),
(102, 'restore_any_hearing', 'web', '2025-10-05 14:49:00', '2025-10-05 14:49:00'),
(103, 'replicate_hearing', 'web', '2025-10-05 14:49:00', '2025-10-05 14:49:00'),
(104, 'reorder_hearing', 'web', '2025-10-05 14:49:00', '2025-10-05 14:49:00'),
(105, 'delete_hearing', 'web', '2025-10-05 14:49:00', '2025-10-05 14:49:00'),
(106, 'delete_any_hearing', 'web', '2025-10-05 14:49:00', '2025-10-05 14:49:00'),
(107, 'force_delete_hearing', 'web', '2025-10-05 14:49:00', '2025-10-05 14:49:00'),
(108, 'force_delete_any_hearing', 'web', '2025-10-05 14:49:00', '2025-10-05 14:49:00'),
(109, 'view_laws::document', 'web', '2025-10-05 14:49:00', '2025-10-05 14:49:00'),
(110, 'view_any_laws::document', 'web', '2025-10-05 14:49:00', '2025-10-05 14:49:00'),
(111, 'create_laws::document', 'web', '2025-10-05 14:49:00', '2025-10-05 14:49:00'),
(112, 'update_laws::document', 'web', '2025-10-05 14:49:00', '2025-10-05 14:49:00'),
(113, 'restore_laws::document', 'web', '2025-10-05 14:49:00', '2025-10-05 14:49:00'),
(114, 'restore_any_laws::document', 'web', '2025-10-05 14:49:00', '2025-10-05 14:49:00'),
(115, 'replicate_laws::document', 'web', '2025-10-05 14:49:00', '2025-10-05 14:49:00'),
(116, 'reorder_laws::document', 'web', '2025-10-05 14:49:00', '2025-10-05 14:49:00'),
(117, 'delete_laws::document', 'web', '2025-10-05 14:49:00', '2025-10-05 14:49:00'),
(118, 'delete_any_laws::document', 'web', '2025-10-05 14:49:00', '2025-10-05 14:49:00'),
(119, 'force_delete_laws::document', 'web', '2025-10-05 14:49:00', '2025-10-05 14:49:00'),
(120, 'force_delete_any_laws::document', 'web', '2025-10-05 14:49:00', '2025-10-05 14:49:00'),
(121, 'view_lawyer', 'web', '2025-10-05 14:49:00', '2025-10-05 14:49:00'),
(122, 'view_any_lawyer', 'web', '2025-10-05 14:49:00', '2025-10-05 14:49:00'),
(123, 'create_lawyer', 'web', '2025-10-05 14:49:00', '2025-10-05 14:49:00'),
(124, 'update_lawyer', 'web', '2025-10-05 14:49:00', '2025-10-05 14:49:00'),
(125, 'restore_lawyer', 'web', '2025-10-05 14:49:00', '2025-10-05 14:49:00'),
(126, 'restore_any_lawyer', 'web', '2025-10-05 14:49:00', '2025-10-05 14:49:00'),
(127, 'replicate_lawyer', 'web', '2025-10-05 14:49:00', '2025-10-05 14:49:00'),
(128, 'reorder_lawyer', 'web', '2025-10-05 14:49:00', '2025-10-05 14:49:00'),
(129, 'delete_lawyer', 'web', '2025-10-05 14:49:00', '2025-10-05 14:49:00'),
(130, 'delete_any_lawyer', 'web', '2025-10-05 14:49:00', '2025-10-05 14:49:00'),
(131, 'force_delete_lawyer', 'web', '2025-10-05 14:49:00', '2025-10-05 14:49:00'),
(132, 'force_delete_any_lawyer', 'web', '2025-10-05 14:49:00', '2025-10-05 14:49:00'),
(133, 'view_lawyer::attachment', 'web', '2025-10-05 14:49:00', '2025-10-05 14:49:00'),
(134, 'view_any_lawyer::attachment', 'web', '2025-10-05 14:49:00', '2025-10-05 14:49:00'),
(135, 'create_lawyer::attachment', 'web', '2025-10-05 14:49:00', '2025-10-05 14:49:00'),
(136, 'update_lawyer::attachment', 'web', '2025-10-05 14:49:00', '2025-10-05 14:49:00'),
(137, 'restore_lawyer::attachment', 'web', '2025-10-05 14:49:00', '2025-10-05 14:49:00'),
(138, 'restore_any_lawyer::attachment', 'web', '2025-10-05 14:49:00', '2025-10-05 14:49:00'),
(139, 'replicate_lawyer::attachment', 'web', '2025-10-05 14:49:00', '2025-10-05 14:49:00'),
(140, 'reorder_lawyer::attachment', 'web', '2025-10-05 14:49:00', '2025-10-05 14:49:00'),
(141, 'delete_lawyer::attachment', 'web', '2025-10-05 14:49:00', '2025-10-05 14:49:00'),
(142, 'delete_any_lawyer::attachment', 'web', '2025-10-05 14:49:00', '2025-10-05 14:49:00'),
(143, 'force_delete_lawyer::attachment', 'web', '2025-10-05 14:49:00', '2025-10-05 14:49:00'),
(144, 'force_delete_any_lawyer::attachment', 'web', '2025-10-05 14:49:00', '2025-10-05 14:49:00'),
(145, 'view_lawyer::contact', 'web', '2025-10-05 14:49:01', '2025-10-05 14:49:01'),
(146, 'view_any_lawyer::contact', 'web', '2025-10-05 14:49:01', '2025-10-05 14:49:01'),
(147, 'create_lawyer::contact', 'web', '2025-10-05 14:49:01', '2025-10-05 14:49:01'),
(148, 'update_lawyer::contact', 'web', '2025-10-05 14:49:01', '2025-10-05 14:49:01'),
(149, 'restore_lawyer::contact', 'web', '2025-10-05 14:49:01', '2025-10-05 14:49:01'),
(150, 'restore_any_lawyer::contact', 'web', '2025-10-05 14:49:01', '2025-10-05 14:49:01'),
(151, 'replicate_lawyer::contact', 'web', '2025-10-05 14:49:01', '2025-10-05 14:49:01'),
(152, 'reorder_lawyer::contact', 'web', '2025-10-05 14:49:01', '2025-10-05 14:49:01'),
(153, 'delete_lawyer::contact', 'web', '2025-10-05 14:49:01', '2025-10-05 14:49:01'),
(154, 'delete_any_lawyer::contact', 'web', '2025-10-05 14:49:01', '2025-10-05 14:49:01'),
(155, 'force_delete_lawyer::contact', 'web', '2025-10-05 14:49:01', '2025-10-05 14:49:01'),
(156, 'force_delete_any_lawyer::contact', 'web', '2025-10-05 14:49:01', '2025-10-05 14:49:01'),
(157, 'view_legalcase', 'web', '2025-10-05 14:49:01', '2025-10-05 14:49:01'),
(158, 'view_any_legalcase', 'web', '2025-10-05 14:49:01', '2025-10-05 14:49:01'),
(159, 'create_legalcase', 'web', '2025-10-05 14:49:01', '2025-10-05 14:49:01'),
(160, 'update_legalcase', 'web', '2025-10-05 14:49:01', '2025-10-05 14:49:01'),
(161, 'restore_legalcase', 'web', '2025-10-05 14:49:01', '2025-10-05 14:49:01'),
(162, 'restore_any_legalcase', 'web', '2025-10-05 14:49:01', '2025-10-05 14:49:01'),
(163, 'replicate_legalcase', 'web', '2025-10-05 14:49:01', '2025-10-05 14:49:01'),
(164, 'reorder_legalcase', 'web', '2025-10-05 14:49:01', '2025-10-05 14:49:01'),
(165, 'delete_legalcase', 'web', '2025-10-05 14:49:01', '2025-10-05 14:49:01'),
(166, 'delete_any_legalcase', 'web', '2025-10-05 14:49:01', '2025-10-05 14:49:01'),
(167, 'force_delete_legalcase', 'web', '2025-10-05 14:49:01', '2025-10-05 14:49:01'),
(168, 'force_delete_any_legalcase', 'web', '2025-10-05 14:49:01', '2025-10-05 14:49:01'),
(169, 'view_logal::assistant::bot', 'web', '2025-10-05 14:49:01', '2025-10-05 14:49:01'),
(170, 'view_any_logal::assistant::bot', 'web', '2025-10-05 14:49:01', '2025-10-05 14:49:01'),
(171, 'create_logal::assistant::bot', 'web', '2025-10-05 14:49:01', '2025-10-05 14:49:01'),
(172, 'update_logal::assistant::bot', 'web', '2025-10-05 14:49:01', '2025-10-05 14:49:01'),
(173, 'restore_logal::assistant::bot', 'web', '2025-10-05 14:49:01', '2025-10-05 14:49:01'),
(174, 'restore_any_logal::assistant::bot', 'web', '2025-10-05 14:49:01', '2025-10-05 14:49:01'),
(175, 'replicate_logal::assistant::bot', 'web', '2025-10-05 14:49:01', '2025-10-05 14:49:01'),
(176, 'reorder_logal::assistant::bot', 'web', '2025-10-05 14:49:01', '2025-10-05 14:49:01'),
(177, 'delete_logal::assistant::bot', 'web', '2025-10-05 14:49:01', '2025-10-05 14:49:01'),
(178, 'delete_any_logal::assistant::bot', 'web', '2025-10-05 14:49:01', '2025-10-05 14:49:01'),
(179, 'force_delete_logal::assistant::bot', 'web', '2025-10-05 14:49:01', '2025-10-05 14:49:01'),
(180, 'force_delete_any_logal::assistant::bot', 'web', '2025-10-05 14:49:01', '2025-10-05 14:49:01'),
(181, 'view_revenue::distribution::rule', 'web', '2025-10-05 14:49:01', '2025-10-05 14:49:01'),
(182, 'view_any_revenue::distribution::rule', 'web', '2025-10-05 14:49:01', '2025-10-05 14:49:01'),
(183, 'create_revenue::distribution::rule', 'web', '2025-10-05 14:49:01', '2025-10-05 14:49:01'),
(184, 'update_revenue::distribution::rule', 'web', '2025-10-05 14:49:01', '2025-10-05 14:49:01'),
(185, 'restore_revenue::distribution::rule', 'web', '2025-10-05 14:49:01', '2025-10-05 14:49:01'),
(186, 'restore_any_revenue::distribution::rule', 'web', '2025-10-05 14:49:01', '2025-10-05 14:49:01'),
(187, 'replicate_revenue::distribution::rule', 'web', '2025-10-05 14:49:01', '2025-10-05 14:49:01'),
(188, 'reorder_revenue::distribution::rule', 'web', '2025-10-05 14:49:01', '2025-10-05 14:49:01'),
(189, 'delete_revenue::distribution::rule', 'web', '2025-10-05 14:49:01', '2025-10-05 14:49:01'),
(190, 'delete_any_revenue::distribution::rule', 'web', '2025-10-05 14:49:01', '2025-10-05 14:49:01'),
(191, 'force_delete_revenue::distribution::rule', 'web', '2025-10-05 14:49:01', '2025-10-05 14:49:01'),
(192, 'force_delete_any_revenue::distribution::rule', 'web', '2025-10-05 14:49:01', '2025-10-05 14:49:01'),
(193, 'view_role', 'web', '2025-10-05 14:49:01', '2025-10-05 14:49:01'),
(194, 'view_any_role', 'web', '2025-10-05 14:49:01', '2025-10-05 14:49:01'),
(195, 'create_role', 'web', '2025-10-05 14:49:01', '2025-10-05 14:49:01'),
(196, 'update_role', 'web', '2025-10-05 14:49:01', '2025-10-05 14:49:01'),
(197, 'delete_role', 'web', '2025-10-05 14:49:01', '2025-10-05 14:49:01'),
(198, 'delete_any_role', 'web', '2025-10-05 14:49:01', '2025-10-05 14:49:01'),
(199, 'view_task', 'web', '2025-10-05 14:49:01', '2025-10-05 14:49:01'),
(200, 'view_any_task', 'web', '2025-10-05 14:49:01', '2025-10-05 14:49:01'),
(201, 'create_task', 'web', '2025-10-05 14:49:01', '2025-10-05 14:49:01'),
(202, 'update_task', 'web', '2025-10-05 14:49:01', '2025-10-05 14:49:01'),
(203, 'restore_task', 'web', '2025-10-05 14:49:01', '2025-10-05 14:49:01'),
(204, 'restore_any_task', 'web', '2025-10-05 14:49:01', '2025-10-05 14:49:01'),
(205, 'replicate_task', 'web', '2025-10-05 14:49:01', '2025-10-05 14:49:01'),
(206, 'reorder_task', 'web', '2025-10-05 14:49:01', '2025-10-05 14:49:01'),
(207, 'delete_task', 'web', '2025-10-05 14:49:01', '2025-10-05 14:49:01'),
(208, 'delete_any_task', 'web', '2025-10-05 14:49:01', '2025-10-05 14:49:01'),
(209, 'force_delete_task', 'web', '2025-10-05 14:49:01', '2025-10-05 14:49:01'),
(210, 'force_delete_any_task', 'web', '2025-10-05 14:49:01', '2025-10-05 14:49:01'),
(211, 'view_transaction', 'web', '2025-10-05 14:49:01', '2025-10-05 14:49:01'),
(212, 'view_any_transaction', 'web', '2025-10-05 14:49:01', '2025-10-05 14:49:01'),
(213, 'create_transaction', 'web', '2025-10-05 14:49:01', '2025-10-05 14:49:01'),
(214, 'update_transaction', 'web', '2025-10-05 14:49:01', '2025-10-05 14:49:01'),
(215, 'restore_transaction', 'web', '2025-10-05 14:49:01', '2025-10-05 14:49:01'),
(216, 'restore_any_transaction', 'web', '2025-10-05 14:49:01', '2025-10-05 14:49:01'),
(217, 'replicate_transaction', 'web', '2025-10-05 14:49:01', '2025-10-05 14:49:01'),
(218, 'reorder_transaction', 'web', '2025-10-05 14:49:01', '2025-10-05 14:49:01'),
(219, 'delete_transaction', 'web', '2025-10-05 14:49:01', '2025-10-05 14:49:01'),
(220, 'delete_any_transaction', 'web', '2025-10-05 14:49:01', '2025-10-05 14:49:01'),
(221, 'force_delete_transaction', 'web', '2025-10-05 14:49:01', '2025-10-05 14:49:01'),
(222, 'force_delete_any_transaction', 'web', '2025-10-05 14:49:01', '2025-10-05 14:49:01'),
(223, 'view_transaction::categorie', 'web', '2025-10-05 14:49:01', '2025-10-05 14:49:01'),
(224, 'view_any_transaction::categorie', 'web', '2025-10-05 14:49:01', '2025-10-05 14:49:01'),
(225, 'create_transaction::categorie', 'web', '2025-10-05 14:49:01', '2025-10-05 14:49:01'),
(226, 'update_transaction::categorie', 'web', '2025-10-05 14:49:01', '2025-10-05 14:49:01'),
(227, 'restore_transaction::categorie', 'web', '2025-10-05 14:49:01', '2025-10-05 14:49:01'),
(228, 'restore_any_transaction::categorie', 'web', '2025-10-05 14:49:01', '2025-10-05 14:49:01'),
(229, 'replicate_transaction::categorie', 'web', '2025-10-05 14:49:01', '2025-10-05 14:49:01'),
(230, 'reorder_transaction::categorie', 'web', '2025-10-05 14:49:01', '2025-10-05 14:49:01'),
(231, 'delete_transaction::categorie', 'web', '2025-10-05 14:49:01', '2025-10-05 14:49:01'),
(232, 'delete_any_transaction::categorie', 'web', '2025-10-05 14:49:01', '2025-10-05 14:49:01'),
(233, 'force_delete_transaction::categorie', 'web', '2025-10-05 14:49:01', '2025-10-05 14:49:01'),
(234, 'force_delete_any_transaction::categorie', 'web', '2025-10-05 14:49:01', '2025-10-05 14:49:01'),
(235, 'view_user', 'web', '2025-10-05 14:49:01', '2025-10-05 14:49:01'),
(236, 'view_any_user', 'web', '2025-10-05 14:49:01', '2025-10-05 14:49:01'),
(237, 'create_user', 'web', '2025-10-05 14:49:01', '2025-10-05 14:49:01'),
(238, 'update_user', 'web', '2025-10-05 14:49:01', '2025-10-05 14:49:01'),
(239, 'restore_user', 'web', '2025-10-05 14:49:01', '2025-10-05 14:49:01'),
(240, 'restore_any_user', 'web', '2025-10-05 14:49:01', '2025-10-05 14:49:01'),
(241, 'replicate_user', 'web', '2025-10-05 14:49:01', '2025-10-05 14:49:01'),
(242, 'reorder_user', 'web', '2025-10-05 14:49:01', '2025-10-05 14:49:01'),
(243, 'delete_user', 'web', '2025-10-05 14:49:01', '2025-10-05 14:49:01'),
(244, 'delete_any_user', 'web', '2025-10-05 14:49:01', '2025-10-05 14:49:01'),
(245, 'force_delete_user', 'web', '2025-10-05 14:49:01', '2025-10-05 14:49:01'),
(246, 'force_delete_any_user', 'web', '2025-10-05 14:49:01', '2025-10-05 14:49:01'),
(247, 'page_Dashboard', 'web', '2025-10-05 14:49:02', '2025-10-05 14:49:02'),
(248, 'widget_CasesStats', 'web', '2025-10-05 14:49:02', '2025-10-05 14:49:02'),
(249, 'widget_CasesTable', 'web', '2025-10-05 14:49:02', '2025-10-05 14:49:02');

-- --------------------------------------------------------

--
-- Table structure for table `revenue_distribution_rules`
--

CREATE TABLE `revenue_distribution_rules` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `lawyer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `case_id` bigint(20) UNSIGNED DEFAULT NULL,
  `type` enum('جلب عميل','حضور جلسة','إعداد عرائض','تكاليف','نسبة المكتب') NOT NULL,
  `percentage` double DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `effective_from` date DEFAULT NULL,
  `effective_to` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'super_admin', 'web', '2025-10-05 14:48:31', '2025-10-05 14:48:31');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 1),
(27, 1),
(28, 1),
(29, 1),
(30, 1),
(31, 1),
(32, 1),
(33, 1),
(34, 1),
(35, 1),
(36, 1),
(37, 1),
(38, 1),
(39, 1),
(40, 1),
(41, 1),
(42, 1),
(43, 1),
(44, 1),
(45, 1),
(46, 1),
(47, 1),
(48, 1),
(49, 1),
(50, 1),
(51, 1),
(52, 1),
(53, 1),
(54, 1),
(55, 1),
(56, 1),
(57, 1),
(58, 1),
(59, 1),
(60, 1),
(61, 1),
(62, 1),
(63, 1),
(64, 1),
(65, 1),
(66, 1),
(67, 1),
(68, 1),
(69, 1),
(70, 1),
(71, 1),
(72, 1),
(73, 1),
(74, 1),
(75, 1),
(76, 1),
(77, 1),
(78, 1),
(79, 1),
(80, 1),
(81, 1),
(82, 1),
(83, 1),
(84, 1),
(85, 1),
(86, 1),
(87, 1),
(88, 1),
(89, 1),
(90, 1),
(91, 1),
(92, 1),
(93, 1),
(94, 1),
(95, 1),
(96, 1),
(97, 1),
(98, 1),
(99, 1),
(100, 1),
(101, 1),
(102, 1),
(103, 1),
(104, 1),
(105, 1),
(106, 1),
(107, 1),
(108, 1),
(109, 1),
(110, 1),
(111, 1),
(112, 1),
(113, 1),
(114, 1),
(115, 1),
(116, 1),
(117, 1),
(118, 1),
(119, 1),
(120, 1),
(121, 1),
(122, 1),
(123, 1),
(124, 1),
(125, 1),
(126, 1),
(127, 1),
(128, 1),
(129, 1),
(130, 1),
(131, 1),
(132, 1),
(133, 1),
(134, 1),
(135, 1),
(136, 1),
(137, 1),
(138, 1),
(139, 1),
(140, 1),
(141, 1),
(142, 1),
(143, 1),
(144, 1),
(145, 1),
(146, 1),
(147, 1),
(148, 1),
(149, 1),
(150, 1),
(151, 1),
(152, 1),
(153, 1),
(154, 1),
(155, 1),
(156, 1),
(157, 1),
(158, 1),
(159, 1),
(160, 1),
(161, 1),
(162, 1),
(163, 1),
(164, 1),
(165, 1),
(166, 1),
(167, 1),
(168, 1),
(169, 1),
(170, 1),
(171, 1),
(172, 1),
(173, 1),
(174, 1),
(175, 1),
(176, 1),
(177, 1),
(178, 1),
(179, 1),
(180, 1),
(181, 1),
(182, 1),
(183, 1),
(184, 1),
(185, 1),
(186, 1),
(187, 1),
(188, 1),
(189, 1),
(190, 1),
(191, 1),
(192, 1),
(193, 1),
(194, 1),
(195, 1),
(196, 1),
(197, 1),
(198, 1),
(199, 1),
(200, 1),
(201, 1),
(202, 1),
(203, 1),
(204, 1),
(205, 1),
(206, 1),
(207, 1),
(208, 1),
(209, 1),
(210, 1),
(211, 1),
(212, 1),
(213, 1),
(214, 1),
(215, 1),
(216, 1),
(217, 1),
(218, 1),
(219, 1),
(220, 1),
(221, 1),
(222, 1),
(223, 1),
(224, 1),
(225, 1),
(226, 1),
(227, 1),
(228, 1),
(229, 1),
(230, 1),
(231, 1),
(232, 1),
(233, 1),
(234, 1),
(235, 1),
(236, 1),
(237, 1),
(238, 1),
(239, 1),
(240, 1),
(241, 1),
(242, 1),
(243, 1),
(244, 1),
(245, 1),
(246, 1),
(247, 1),
(248, 1),
(249, 1);

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('RQaXFTA8qFBuBlfZmDZiEpwxsQLRkNrIyfevZjRa', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36 Edg/140.0.0.0', 'YTo2OntzOjY6Il90b2tlbiI7czo0MDoib041anU4MjhiaXh1a3VaS3JzSlZaWEsweW03RGFRclB0MnNOVm82WSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hZG1pbi9zaGllbGQvcm9sZXMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjM6InVybCI7YTowOnt9czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjE3OiJwYXNzd29yZF9oYXNoX3dlYiI7czo2MDoiJDJ5JDEyJC9ZZmpHTHBvVFVVZkpxaFpOV1JOT2VxLmpjTUNuTHJkLlg1TTQ5S2JtYUVBSGpNeFBnbHN1Ijt9', 1759686632);

-- --------------------------------------------------------

--
-- Table structure for table `tasks`
--

CREATE TABLE `tasks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(200) NOT NULL,
  `priority` enum('High','Normal','Low') NOT NULL DEFAULT 'Normal',
  `status` enum('Not Started','In Progress','Completed','Deferred','Waiting') NOT NULL DEFAULT 'Not Started',
  `percent_complete` int(11) NOT NULL DEFAULT 0,
  `description` text DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `finished_at` datetime DEFAULT NULL,
  `attachments` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`attachments`)),
  `notes` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `account_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED DEFAULT NULL,
  `lawyer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `case_id` bigint(20) UNSIGNED DEFAULT NULL,
  `transaction_category_id` bigint(20) UNSIGNED NOT NULL,
  `amount` decimal(12,2) NOT NULL,
  `txn_type` enum('دفعة مقدمة','دفعة نهائية','رسوم','أخرى') NOT NULL,
  `txn_date` datetime NOT NULL,
  `notes` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transaction_categories`
--

CREATE TABLE `transaction_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(120) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED DEFAULT NULL,
  `lawyer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `client_id`, `lawyer_id`, `name`, `email`, `email_verified_at`, `password`, `last_login`, `is_active`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, NULL, NULL, 'Test User', 'test@example.com', '2025-10-05 14:48:24', '$2y$12$/YfjGLpoTUUfJqhZNWRNOeq.jcMCnLrd.X5M49KbmaEAHjMxPglsu', NULL, 1, '5hJHBwNBOX', '2025-10-05 14:48:24', '2025-10-05 14:48:24');

-- --------------------------------------------------------

--
-- Table structure for table `workflows`
--

CREATE TABLE `workflows` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(150) NOT NULL,
  `module` varchar(100) NOT NULL,
  `related_case_id` bigint(20) UNSIGNED DEFAULT NULL,
  `state` enum('جديد','قيد التنفيذ','مكتمل','مؤجل') NOT NULL,
  `step_no` int(11) NOT NULL,
  `step_desc` text DEFAULT NULL,
  `assigned_user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `start_at` datetime DEFAULT NULL,
  `end_at` datetime DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `accounts_account_name_index` (`account_name`),
  ADD KEY `accounts_account_type_index` (`account_type`),
  ADD KEY `accounts_currency_index` (`currency`);

--
-- Indexes for table `activity_logs`
--
ALTER TABLE `activity_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `activity_logs_user_id_index` (`user_id`),
  ADD KEY `activity_logs_action_index` (`action`),
  ADD KEY `activity_logs_table_name_index` (`table_name`),
  ADD KEY `activity_logs_record_id_index` (`record_id`);

--
-- Indexes for table `admin_agent_bots`
--
ALTER TABLE `admin_agent_bots`
  ADD PRIMARY KEY (`id`),
  ADD KEY `admin_agent_bots_admin_user_id_index` (`admin_user_id`);

--
-- Indexes for table `app_settings`
--
ALTER TABLE `app_settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `app_settings_key_name_unique` (`key_name`);

--
-- Indexes for table `authorizations`
--
ALTER TABLE `authorizations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `authorizations_client_id_index` (`client_id`),
  ADD KEY `authorizations_lawyer_id_index` (`lawyer_id`),
  ADD KEY `authorizations_type_index` (`type`),
  ADD KEY `authorizations_company_name_index` (`company_name`),
  ADD KEY `authorizations_year_index` (`year`),
  ADD KEY `authorizations_start_date_index` (`start_date`),
  ADD KEY `authorizations_end_date_index` (`end_date`),
  ADD KEY `authorizations_office_file_no_index` (`office_file_no`);

--
-- Indexes for table `a_i_training_data`
--
ALTER TABLE `a_i_training_data`
  ADD PRIMARY KEY (`id`),
  ADD KEY `a_i_training_data_source_index` (`source`),
  ADD KEY `a_i_training_data_category_index` (`category`);

--
-- Indexes for table `bot_feedbaks`
--
ALTER TABLE `bot_feedbaks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bot_feedbaks_bot_kind_index` (`bot_kind`),
  ADD KEY `bot_feedbaks_user_id_index` (`user_id`),
  ADD KEY `bot_feedbaks_rating_index` (`rating`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `case_amendments`
--
ALTER TABLE `case_amendments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_case_amendments_legal_case` (`case_id`),
  ADD KEY `fk_case_amendments_users` (`modified_by`),
  ADD KEY `case_amendments_file_name_index` (`file_name`),
  ADD KEY `case_amendments_modified_at_index` (`modified_at`);

--
-- Indexes for table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `clients_email_unique` (`email`),
  ADD UNIQUE KEY `clients_username_unique` (`username`),
  ADD KEY `clients_name_index` (`name`),
  ADD KEY `clients_type_index` (`type`),
  ADD KEY `clients_city_index` (`city`),
  ADD KEY `clients_address_index` (`address`),
  ADD KEY `clients_start_at_index` (`start_at`),
  ADD KEY `clients_end_at_index` (`end_at`);

--
-- Indexes for table `client_contacts`
--
ALTER TABLE `client_contacts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `client_contacts_client_id_index` (`client_id`),
  ADD KEY `client_contacts_type_index` (`type`),
  ADD KEY `client_contacts_value_index` (`value`);

--
-- Indexes for table `courts`
--
ALTER TABLE `courts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `courts_name_index` (`name`),
  ADD KEY `courts_kind_index` (`kind`),
  ADD KEY `courts_level_index` (`level`),
  ADD KEY `courts_city_index` (`city`);

--
-- Indexes for table `court_changes`
--
ALTER TABLE `court_changes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `court_changes_court_id_index` (`court_id`),
  ADD KEY `court_changes_modifed_by_index` (`modifed_by`);

--
-- Indexes for table `daily_reports`
--
ALTER TABLE `daily_reports`
  ADD PRIMARY KEY (`id`),
  ADD KEY `daily_reports_case_id_index` (`case_id`),
  ADD KEY `daily_reports_lawyer_id_index` (`lawyer_id`),
  ADD KEY `daily_reports_report_date_index` (`report_date`),
  ADD KEY `daily_reports_week_no_index` (`week_no`),
  ADD KEY `daily_reports_status_index` (`status`),
  ADD KEY `daily_reports_reviewer_id_index` (`reviewer_id`);

--
-- Indexes for table `documents`
--
ALTER TABLE `documents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `documents_case_id_index` (`case_id`),
  ADD KEY `documents_client_id_index` (`client_id`),
  ADD KEY `documents_lawyer_id_index` (`lawyer_id`),
  ADD KEY `documents_name_index` (`name`),
  ADD KEY `documents_doc_type_index` (`doc_type`),
  ADD KEY `documents_upload_at_index` (`upload_at`),
  ADD KEY `documents_is_missing_index` (`is_missing`),
  ADD KEY `documents_in_trash_index` (`in_trash`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `fee_distributions`
--
ALTER TABLE `fee_distributions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fee_distributions_transaction_id_index` (`transaction_id`),
  ADD KEY `fee_distributions_beneficiary_type_index` (`beneficiary_type`),
  ADD KEY `fee_distributions_beneficiary_id_index` (`beneficiary_id`),
  ADD KEY `fee_distributions_rule_type_index` (`rule_type`),
  ADD KEY `fee_distributions_percentage_index` (`percentage`),
  ADD KEY `fee_distributions_amount_index` (`amount`);

--
-- Indexes for table `hearings`
--
ALTER TABLE `hearings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `hearings_case_id_index` (`case_id`),
  ADD KEY `hearings_court_id_index` (`court_id`),
  ADD KEY `hearings_lawyer_id_index` (`lawyer_id`),
  ADD KEY `hearings_client_id_index` (`client_id`),
  ADD KEY `hearings_hearing_datetime_index` (`hearing_datetime`),
  ADD KEY `hearings_postponed_to_index` (`postponed_to`),
  ADD KEY `hearings_calendar_tag_index` (`calendar_tag`);

--
-- Indexes for table `inventories`
--
ALTER TABLE `inventories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `inventories_location_name_index` (`location`,`name`),
  ADD KEY `inventories_name_index` (`name`),
  ADD KEY `inventories_quantity_index` (`quantity`),
  ADD KEY `inventories_location_index` (`location`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `laws_documents`
--
ALTER TABLE `laws_documents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `laws_documents_law_number_index` (`law_number`),
  ADD KEY `laws_documents_law_title_index` (`law_title`),
  ADD KEY `laws_documents_issue_date_index` (`issue_date`),
  ADD KEY `laws_documents_amendment_date_index` (`amendment_date`),
  ADD KEY `laws_documents_law_category_index` (`law_category`);

--
-- Indexes for table `lawyers`
--
ALTER TABLE `lawyers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `lawyers_email_unique` (`email`),
  ADD UNIQUE KEY `lawyers_username_unique` (`username`),
  ADD KEY `lawyers_name_index` (`name`),
  ADD KEY `lawyers_grade_index` (`grade`),
  ADD KEY `lawyers_city_index` (`city`),
  ADD KEY `lawyers_phone_index` (`phone`),
  ADD KEY `lawyers_joined_at_index` (`joined_at`),
  ADD KEY `lawyers_end_at_index` (`end_at`);

--
-- Indexes for table `lawyer_attachments`
--
ALTER TABLE `lawyer_attachments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lawyer_attachments_lawyer_id_index` (`lawyer_id`);

--
-- Indexes for table `lawyer_contacts`
--
ALTER TABLE `lawyer_contacts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lawyer_contacts_lawyer_id_index` (`lawyer_id`),
  ADD KEY `lawyer_contacts_type_index` (`type`),
  ADD KEY `lawyer_contacts_value_index` (`value`);

--
-- Indexes for table `legal_case`
--
ALTER TABLE `legal_case`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `legal_case_case_number_unique` (`case_number`),
  ADD KEY `legal_case_client_id_index` (`client_id`),
  ADD KEY `legal_case_lawyer_id_index` (`lawyer_id`),
  ADD KEY `legal_case_court_id_index` (`court_id`),
  ADD KEY `legal_case_category_index` (`category`),
  ADD KEY `legal_case_status_index` (`status`),
  ADD KEY `legal_case_received_at_index` (`received_at`),
  ADD KEY `legal_case_ended_at_index` (`ended_at`),
  ADD KEY `legal_case_office_file_no_index` (`office_file_no`);

--
-- Indexes for table `logal_assistant_bots`
--
ALTER TABLE `logal_assistant_bots`
  ADD PRIMARY KEY (`id`),
  ADD KEY `logal_assistant_bots_user_id_index` (`user_id`),
  ADD KEY `logal_assistant_bots_source_law_id_index` (`source_law_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_user_id_is_read_index` (`user_id`,`is_read`),
  ADD KEY `notifications_user_id_index` (`user_id`),
  ADD KEY `notifications_record_table_index` (`record_table`),
  ADD KEY `notifications_record_id_index` (`record_id`),
  ADD KEY `notifications_is_read_index` (`is_read`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `revenue_distribution_rules`
--
ALTER TABLE `revenue_distribution_rules`
  ADD PRIMARY KEY (`id`),
  ADD KEY `revenue_distribution_rules_lawyer_id_type_index` (`lawyer_id`,`type`),
  ADD KEY `revenue_distribution_rules_lawyer_id_index` (`lawyer_id`),
  ADD KEY `revenue_distribution_rules_case_id_index` (`case_id`),
  ADD KEY `revenue_distribution_rules_type_index` (`type`),
  ADD KEY `revenue_distribution_rules_percentage_index` (`percentage`),
  ADD KEY `revenue_distribution_rules_amount_index` (`amount`),
  ADD KEY `revenue_distribution_rules_effective_from_index` (`effective_from`),
  ADD KEY `revenue_distribution_rules_effective_to_index` (`effective_to`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `tasks`
--
ALTER TABLE `tasks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tasks_user_id_index` (`user_id`),
  ADD KEY `tasks_title_index` (`title`),
  ADD KEY `tasks_priority_index` (`priority`),
  ADD KEY `tasks_status_index` (`status`),
  ADD KEY `tasks_due_date_index` (`due_date`),
  ADD KEY `tasks_finished_at_index` (`finished_at`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transactions_account_id_txn_date_index` (`account_id`,`txn_date`),
  ADD KEY `transactions_client_id_txn_date_index` (`client_id`,`txn_date`),
  ADD KEY `transactions_account_id_index` (`account_id`),
  ADD KEY `transactions_client_id_index` (`client_id`),
  ADD KEY `transactions_lawyer_id_index` (`lawyer_id`),
  ADD KEY `transactions_case_id_index` (`case_id`),
  ADD KEY `transactions_transaction_category_id_index` (`transaction_category_id`),
  ADD KEY `transactions_txn_type_index` (`txn_type`),
  ADD KEY `transactions_txn_date_index` (`txn_date`);

--
-- Indexes for table `transaction_categories`
--
ALTER TABLE `transaction_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transaction_categories_name_index` (`name`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_lawyer_id_index` (`lawyer_id`),
  ADD KEY `users_client_id_index` (`client_id`);

--
-- Indexes for table `workflows`
--
ALTER TABLE `workflows`
  ADD PRIMARY KEY (`id`),
  ADD KEY `workflows_module_index` (`module`),
  ADD KEY `workflows_related_case_id_index` (`related_case_id`),
  ADD KEY `workflows_state_index` (`state`),
  ADD KEY `workflows_step_no_index` (`step_no`),
  ADD KEY `workflows_assigned_user_id_index` (`assigned_user_id`),
  ADD KEY `workflows_start_at_index` (`start_at`),
  ADD KEY `workflows_end_at_index` (`end_at`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts`
--
ALTER TABLE `accounts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `activity_logs`
--
ALTER TABLE `activity_logs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `admin_agent_bots`
--
ALTER TABLE `admin_agent_bots`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `app_settings`
--
ALTER TABLE `app_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `authorizations`
--
ALTER TABLE `authorizations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `a_i_training_data`
--
ALTER TABLE `a_i_training_data`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bot_feedbaks`
--
ALTER TABLE `bot_feedbaks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `case_amendments`
--
ALTER TABLE `case_amendments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `clients`
--
ALTER TABLE `clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `client_contacts`
--
ALTER TABLE `client_contacts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `courts`
--
ALTER TABLE `courts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `court_changes`
--
ALTER TABLE `court_changes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `daily_reports`
--
ALTER TABLE `daily_reports`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `documents`
--
ALTER TABLE `documents`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fee_distributions`
--
ALTER TABLE `fee_distributions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hearings`
--
ALTER TABLE `hearings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `inventories`
--
ALTER TABLE `inventories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `laws_documents`
--
ALTER TABLE `laws_documents`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lawyers`
--
ALTER TABLE `lawyers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lawyer_attachments`
--
ALTER TABLE `lawyer_attachments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lawyer_contacts`
--
ALTER TABLE `lawyer_contacts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `legal_case`
--
ALTER TABLE `legal_case`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `logal_assistant_bots`
--
ALTER TABLE `logal_assistant_bots`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=250;

--
-- AUTO_INCREMENT for table `revenue_distribution_rules`
--
ALTER TABLE `revenue_distribution_rules`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tasks`
--
ALTER TABLE `tasks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transaction_categories`
--
ALTER TABLE `transaction_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `workflows`
--
ALTER TABLE `workflows`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `activity_logs`
--
ALTER TABLE `activity_logs`
  ADD CONSTRAINT `activity_logs_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `admin_agent_bots`
--
ALTER TABLE `admin_agent_bots`
  ADD CONSTRAINT `admin_agent_bots_admin_user_id_foreign` FOREIGN KEY (`admin_user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `authorizations`
--
ALTER TABLE `authorizations`
  ADD CONSTRAINT `authorizations_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `authorizations_lawyer_id_foreign` FOREIGN KEY (`lawyer_id`) REFERENCES `lawyers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `bot_feedbaks`
--
ALTER TABLE `bot_feedbaks`
  ADD CONSTRAINT `bot_feedbaks_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `case_amendments`
--
ALTER TABLE `case_amendments`
  ADD CONSTRAINT `fk_case_amendments_legal_case` FOREIGN KEY (`case_id`) REFERENCES `legal_case` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_case_amendments_users` FOREIGN KEY (`modified_by`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `client_contacts`
--
ALTER TABLE `client_contacts`
  ADD CONSTRAINT `client_contacts_client_id_fk` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `court_changes`
--
ALTER TABLE `court_changes`
  ADD CONSTRAINT `court_changes_court_id_foreign` FOREIGN KEY (`court_id`) REFERENCES `courts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `court_changes_modified_by_foreign` FOREIGN KEY (`modifed_by`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `daily_reports`
--
ALTER TABLE `daily_reports`
  ADD CONSTRAINT `daily_reports_case_id_foreign` FOREIGN KEY (`case_id`) REFERENCES `legal_case` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `daily_reports_lawyer_id_foreign` FOREIGN KEY (`lawyer_id`) REFERENCES `lawyers` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `daily_reports_reviewer_id_foreign` FOREIGN KEY (`reviewer_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `documents`
--
ALTER TABLE `documents`
  ADD CONSTRAINT `documents_case_id_foreign` FOREIGN KEY (`case_id`) REFERENCES `legal_case` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `documents_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `documents_lawyer_id_foreign` FOREIGN KEY (`lawyer_id`) REFERENCES `lawyers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `fee_distributions`
--
ALTER TABLE `fee_distributions`
  ADD CONSTRAINT `fee_distributions_transaction_id_foreign` FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `hearings`
--
ALTER TABLE `hearings`
  ADD CONSTRAINT `hearings_case_id_foreign` FOREIGN KEY (`case_id`) REFERENCES `legal_case` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `hearings_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `hearings_court_id_foreign` FOREIGN KEY (`court_id`) REFERENCES `courts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `hearings_lawyer_id_foreign` FOREIGN KEY (`lawyer_id`) REFERENCES `lawyers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `lawyer_attachments`
--
ALTER TABLE `lawyer_attachments`
  ADD CONSTRAINT `lawyer_attachments_lawyer_id_foreign` FOREIGN KEY (`lawyer_id`) REFERENCES `lawyers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `lawyer_contacts`
--
ALTER TABLE `lawyer_contacts`
  ADD CONSTRAINT `lawyer_contacts_lawyer_id_foreign` FOREIGN KEY (`lawyer_id`) REFERENCES `lawyers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `legal_case`
--
ALTER TABLE `legal_case`
  ADD CONSTRAINT `legal_case_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `legal_case_court_id_foreign` FOREIGN KEY (`court_id`) REFERENCES `courts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `legal_case_lawyer_id_foreign` FOREIGN KEY (`lawyer_id`) REFERENCES `lawyers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `logal_assistant_bots`
--
ALTER TABLE `logal_assistant_bots`
  ADD CONSTRAINT `logal_assistant_bots_source_law_id_foreign` FOREIGN KEY (`source_law_id`) REFERENCES `laws_documents` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `logal_assistant_bots_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `notifications_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `revenue_distribution_rules`
--
ALTER TABLE `revenue_distribution_rules`
  ADD CONSTRAINT `revenue_distribution_rules_case_id_foreign` FOREIGN KEY (`case_id`) REFERENCES `legal_case` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `revenue_distribution_rules_lawyer_id_foreign` FOREIGN KEY (`lawyer_id`) REFERENCES `lawyers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tasks`
--
ALTER TABLE `tasks`
  ADD CONSTRAINT `tasks_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_account_id_foreign` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transactions_case_id_foreign` FOREIGN KEY (`case_id`) REFERENCES `legal_case` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transactions_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transactions_lawyer_id_foreign` FOREIGN KEY (`lawyer_id`) REFERENCES `lawyers` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transactions_transaction_category_id_foreign` FOREIGN KEY (`transaction_category_id`) REFERENCES `transaction_categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `users_lawyer_id_foreign` FOREIGN KEY (`lawyer_id`) REFERENCES `lawyers` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `workflows`
--
ALTER TABLE `workflows`
  ADD CONSTRAINT `workflows_assigned_user_id_foreign` FOREIGN KEY (`assigned_user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `workflows_related_case_id_foreign` FOREIGN KEY (`related_case_id`) REFERENCES `legal_case` (`id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

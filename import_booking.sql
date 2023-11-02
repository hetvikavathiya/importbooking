-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 20, 2023 at 01:55 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.1.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `import_booking`
--

-- --------------------------------------------------------

--
-- Table structure for table `agent`
--

CREATE TABLE `agent` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `mobile_no` varchar(50) NOT NULL,
  `city` varchar(50) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `agent`
--

INSERT INTO `agent` (`id`, `user_id`, `name`, `mobile_no`, `city`, `created_at`, `updated_at`) VALUES
(1, 20, 'hetvi123', '9974089992', 'v1d', '2023-10-07 10:50:51', '2023-10-07 16:38:49'),
(2, 20, 'qaswdc', '9974089992', 'asdc', '2023-10-07 16:38:40', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

CREATE TABLE `booking` (
  `id` int(11) NOT NULL,
  `party_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `agent_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `document_id` int(11) NOT NULL,
  `date` varchar(50) NOT NULL,
  `status` varchar(20) NOT NULL,
  `container` varchar(10) NOT NULL,
  `quantity` varchar(50) NOT NULL,
  `net_wt` varchar(50) NOT NULL,
  `gross_wt` varchar(100) NOT NULL,
  `CHA` varchar(100) NOT NULL,
  `ETA` varchar(100) NOT NULL,
  `loading_port` varchar(50) NOT NULL,
  `discharge_port` varchar(50) NOT NULL,
  `bill_no` varchar(50) NOT NULL,
  `insurance` varchar(20) NOT NULL,
  `igm_files` varchar(50) NOT NULL,
  `custom_duty` varchar(50) NOT NULL,
  `custom_duty_status` varchar(50) NOT NULL,
  `shipping_line` varchar(50) NOT NULL,
  `shipping_line_status` varchar(20) NOT NULL,
  `delivery_date` varchar(50) NOT NULL,
  `cha_bill` varchar(20) NOT NULL,
  `cha_bill_status` varchar(20) NOT NULL,
  `cha_misc_exp` varchar(20) NOT NULL,
  `cha_misc_exp_status` varchar(20) NOT NULL,
  `transport` varchar(20) NOT NULL,
  `transport_status` varchar(20) NOT NULL,
  `uploade_documents` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `booking`
--

INSERT INTO `booking` (`id`, `party_id`, `company_id`, `agent_id`, `category_id`, `product_id`, `document_id`, `date`, `status`, `container`, `quantity`, `net_wt`, `gross_wt`, `CHA`, `ETA`, `loading_port`, `discharge_port`, `bill_no`, `insurance`, `igm_files`, `custom_duty`, `custom_duty_status`, `shipping_line`, `shipping_line_status`, `delivery_date`, `cha_bill`, `cha_bill_status`, `cha_misc_exp`, `cha_misc_exp_status`, `transport`, `transport_status`, `uploade_documents`, `user_id`, `created_at`, `updated_at`) VALUES
(9, 7, 1, 0, 2, 1, 0, '2023-10-05', 'Arrived', 'FCL', '12', '2', '12', '12', '12', '12', '2', '12', 'Yes', 'Yes', '12', 'No', '12', 'Yes', '2023-10-19', '12', 'Yes', '21', 'Yes', '2', 'Yes', '', 11, '2023-10-11 12:56:21', '0000-00-00 00:00:00'),
(23, 5, 1, 1, 4, 0, 0, '2023-09-26', 'In-transit', 'LCL', '12', '12', '2', '22', '12', '12', '12', '12', 'Yes', 'Yes', '12', 'Yes', '12', 'Yes', '2023-10-28', '12', 'Yes', '12', 'Yes', '12', 'Yes', '', 11, '2023-10-19 10:47:46', '2023-10-20 16:03:10');

-- --------------------------------------------------------

--
-- Table structure for table `booking_payment`
--

CREATE TABLE `booking_payment` (
  `id` int(11) NOT NULL,
  `booking_id` int(11) NOT NULL,
  `date` date DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `remark` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `booking_payment`
--

INSERT INTO `booking_payment` (`id`, `booking_id`, `date`, `amount`, `remark`) VALUES
(12, 23, '2023-10-18', 1, 'test'),
(16, 9, '2023-10-20', 123, '12345sdfgh'),
(18, 23, '2023-10-20', 4, '');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(555) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `client_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `status` varchar(255) DEFAULT 'show'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`, `created_at`, `updated_at`, `client_id`, `user_id`, `updated_by`, `status`) VALUES
(2, 'SILICONE SEALANTS', '2022-09-04 17:55:56', NULL, NULL, 1, NULL, 'show'),
(3, 'WIRE MESH', '2022-09-04 18:21:46', NULL, NULL, 1, NULL, 'show'),
(4, 'FRICTION STAY', '2022-09-18 15:42:33', NULL, NULL, 1, NULL, 'show'),
(5, 'WEATHER STRIP', '2022-09-18 15:42:45', NULL, NULL, 1, NULL, 'show'),
(6, 'BEARING', '2022-09-18 15:42:52', NULL, NULL, 1, NULL, 'show'),
(7, 'DOOR CLOSER', '2022-09-18 16:16:06', NULL, NULL, 1, NULL, 'show'),
(8, 'DOMAL LOCKS', '2022-09-18 16:16:15', NULL, NULL, 1, NULL, 'show'),
(9, 'HARDWARE', '2022-11-12 13:56:04', NULL, NULL, 1, NULL, 'show'),
(15, 'qswdef`123', '2023-10-07 16:26:57', '2023-10-07 16:46:42', NULL, 20, NULL, 'show'),
(20, 'wsdf', '2023-10-07 17:05:40', '2023-10-07 17:26:47', NULL, 11, NULL, 'show');

-- --------------------------------------------------------

--
-- Table structure for table `company`
--

CREATE TABLE `company` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `mobile_no` varchar(50) NOT NULL,
  `city` varchar(50) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `company`
--

INSERT INTO `company` (`id`, `user_id`, `name`, `mobile_no`, `city`, `created_at`, `updated_at`) VALUES
(1, 11, 'hetvi123', '9974089992', 'vasd', '2023-10-07 10:50:05', '2023-10-10 12:55:47'),
(2, 20, 'asdcf123', '9974089992', 'asdfg', '2023-10-07 16:39:31', '2023-10-07 16:39:37');

-- --------------------------------------------------------

--
-- Table structure for table `document`
--

CREATE TABLE `document` (
  `id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `document`
--

INSERT INTO `document` (`id`, `name`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'Adhar Card', 11, '2023-10-19 16:30:34', '0000-00-00 00:00:00'),
(2, 'Pan Card12', 11, '2023-10-19 16:31:02', '2023-10-19 16:32:48'),
(4, 'Ration Card', 11, '2023-10-19 17:34:29', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `party`
--

CREATE TABLE `party` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `mobile_no` varchar(20) NOT NULL,
  `city` varchar(50) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `party`
--

INSERT INTO `party` (`id`, `user_id`, `name`, `mobile_no`, `city`, `created_at`, `updated_at`) VALUES
(5, 11, 'hetviqwedrfgt', '9974089992', 'vwe', '2023-10-07 16:09:18', '0000-00-00 00:00:00'),
(6, 20, 'hetvi1', '9974089992', 'vas', '2023-10-07 16:10:47', '2023-10-07 16:13:15'),
(7, 20, 'hetvi123', '9974089992', 'vwe', '2023-10-07 16:11:28', '0000-00-00 00:00:00'),
(8, 20, 'wedfr123', '9974089992', 'wdfg', '2023-10-07 16:23:45', '2023-10-07 16:31:46');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `group_id` int(11) DEFAULT NULL,
  `unit_id` int(11) DEFAULT NULL,
  `sub_unit_id` int(11) DEFAULT NULL,
  `sales_price` double DEFAULT NULL,
  `purchase_price` double DEFAULT NULL,
  `main_rate` double DEFAULT 0,
  `bill_rate` double DEFAULT NULL,
  `cash_rate` double DEFAULT NULL,
  `agent_rate` double DEFAULT NULL,
  `image` varchar(500) DEFAULT NULL,
  `barcode` varchar(500) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  `user_id` int(255) NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `qty` int(11) DEFAULT 1,
  `pieces` int(11) DEFAULT NULL,
  `min_stock_alert` double DEFAULT NULL,
  `color` varchar(500) DEFAULT NULL,
  `groups` varchar(500) DEFAULT NULL,
  `parcel_code` varchar(500) DEFAULT NULL,
  `open_box` double DEFAULT NULL,
  `open_pieces` double DEFAULT NULL,
  `open_price` double DEFAULT NULL,
  `other_pid` int(11) DEFAULT NULL,
  `other_pidn` int(11) DEFAULT NULL,
  `other_pidnn` int(11) DEFAULT NULL,
  `other_pidnnn` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `sub_category_id` int(11) DEFAULT NULL,
  `hsn_code` varchar(500) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `name`, `group_id`, `unit_id`, `sub_unit_id`, `sales_price`, `purchase_price`, `main_rate`, `bill_rate`, `cash_rate`, `agent_rate`, `image`, `barcode`, `created_at`, `updated_at`, `user_id`, `updated_by`, `qty`, `pieces`, `min_stock_alert`, `color`, `groups`, `parcel_code`, `open_box`, `open_pieces`, `open_price`, `other_pid`, `other_pidn`, `other_pidnn`, `other_pidnnn`, `category_id`, `sub_category_id`, `hsn_code`) VALUES
(1, 'KEINGS 789 CLEAR', NULL, 5, 3, NULL, 0, 120, 70, 60, 3, NULL, '36579021', '2022-09-01 21:59:21', '2023-10-07 17:58:10', 11, NULL, 1, 24, 0, 'None', '789 CLEAR', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 3, 3, '35069100'),
(2, 'KEINGS 789 WHITE', NULL, 5, 3, NULL, 0, 0, 0, 0, 3, NULL, '78364915', '2022-09-03 16:23:20', '2023-01-24 12:34:16', 1, NULL, 1, 24, 0, 'None', '789 WHITE', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 2, 2, '35069100'),
(3, 'KEINGS 789 BLACK', NULL, 5, 3, NULL, 0, 85, 25, 60, 3, NULL, '41368275', '2022-09-04 17:59:47', '2023-01-24 12:34:10', 1, NULL, 1, 24, 100, 'None', '789 BLACK', NULL, 0, 0, 60, NULL, NULL, NULL, NULL, 2, 2, '35069100'),
(4, 'KEINGS 14X14 SS 2FT', NULL, 6, 6, NULL, 0, 10, 3, 0, 0.5, NULL, '36708451', '2022-09-04 18:33:12', '2022-09-22 16:12:01', 1, NULL, 1, 200, 0, 'None', '14X14 SS', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 3, 3, ''),
(5, 'Tiktik 1', NULL, 1, 1, NULL, 1, 15, 12, 3, 0.5, NULL, '38960715', '2022-09-17 10:27:21', '2022-09-19 20:54:17', 1, NULL, 1, 10, 1, 'None', '14X14 SS', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 1, 1, '1'),
(153, 'EMPIRE M 18X16 BLK 4\"', NULL, 6, 6, NULL, 0, 0, 0, 0, 0, NULL, '67021548', '2022-09-20 14:35:17', '2022-09-25 17:40:08', 1, NULL, 1, 400, 0, 'None', '18X16 BLK', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 3, 18, ''),
(163, 'VCAN M 14X14 BLK 2\"', NULL, 6, 6, NULL, 0, 0, 0, 0, 0, NULL, '03245718', '2022-10-30 13:08:49', '0000-00-00 00:00:00', 1, NULL, 1, 200, 0, 'None', '14X14 BLK', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 3, 19, ''),
(6, 'KEINGS GP BLACK', NULL, 5, 3, NULL, 0, 80, 25, 55, 3, NULL, '46891327', '2022-09-18 16:48:48', '2023-07-18 13:11:12', 1, NULL, 1, 24, 0, 'None', 'None', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 2, 2, '35061000'),
(7, 'KEINGS GP WHITE', NULL, 5, 3, NULL, 0, 0, 0, 0, 3, NULL, '94827503', '2022-09-18 16:50:07', '2023-07-18 13:11:03', 1, NULL, 1, 24, 0, 'None', 'None', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 2, 2, '35061000'),
(8, 'KEINGS NAIL FREE', NULL, 5, 3, NULL, 0, 0, 0, 0, 0, NULL, '96475108', '2022-09-18 16:52:02', '0000-00-00 00:00:00', 1, NULL, 1, 24, 0, 'None', 'None', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 2, 2, ''),
(9, 'KEINGS 789 BLACK PRIME', NULL, 5, 3, NULL, 0, 0, 0, 0, 3, NULL, '90153276', '2022-09-18 16:52:48', '2023-01-24 12:34:04', 1, NULL, 1, 24, 0, 'None', '789 BLACK', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 2, 2, ''),
(10, 'KEINGS 789 WHITE PRIME', NULL, 5, 3, NULL, 0, 0, 0, 0, 3, NULL, '53469782', '2022-09-18 16:53:50', '2023-01-24 12:33:57', 1, NULL, 1, 24, 0, 'None', '789 WHITE', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 2, 2, ''),
(11, 'KEINGS 789 POUCH BLACK', NULL, 5, 5, NULL, 0, 0, 0, 0, 3, NULL, '91652784', '2022-09-18 16:56:33', '2023-01-24 12:33:49', 1, NULL, 1, 20, 0, 'None', '789 BLACK', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 2, 2, ''),
(12, 'KEINGS 789 POUCH WHITE', NULL, 5, 5, NULL, 0, 0, 0, 0, 3, NULL, '34281957', '2022-09-18 16:57:11', '2023-01-24 12:33:42', 1, NULL, 1, 20, 0, 'None', '789 WHITE', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 2, 2, ''),
(13, 'KEINGS S 14X14 SS 2\"', NULL, 6, 6, NULL, 0, 0, 0, 0, 0, NULL, '03586491', '2022-09-18 17:05:58', '2022-09-25 17:34:52', 1, NULL, 1, 200, 0, 'None', '14X14 SS', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 3, 3, ''),
(14, 'KEINGS S 14X14 SS 2.5\"', NULL, 6, 6, NULL, 0, 0, 0, 0, 0, NULL, '67532489', '2022-09-18 17:08:53', '2022-09-25 17:34:43', 1, NULL, 1, 250, 0, 'None', '14X14 SS', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 3, 3, ''),
(15, 'KEINGS S 14X14 SS 3\"', NULL, 6, 6, NULL, 0, 0, 0, 0, 0, NULL, '39701468', '2022-09-18 17:10:15', '2022-09-25 17:34:34', 1, NULL, 1, 300, 0, 'None', '14X14 SS', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 3, 3, ''),
(16, 'KEINGS S 14X14 SS 3.5\"', NULL, 6, 6, NULL, 0, 0, 0, 0, 0, NULL, '36705891', '2022-09-18 17:11:34', '2022-09-25 17:34:26', 1, NULL, 1, 350, 0, 'None', '14X14 SS', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 3, 3, ''),
(17, 'KEINGS S 14X14 SS 3.75\"', NULL, 6, 6, NULL, 0, 0, 0, 0, 0, NULL, '41856792', '2022-09-18 17:12:34', '2022-09-25 17:34:17', 1, NULL, 1, 375, 0, 'None', '14X14 SS', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 3, 3, ''),
(18, 'KEINGS S 14X14 SS 4\"', NULL, 6, 6, NULL, 0, 0, 0, 0, 0, NULL, '23145096', '2022-09-18 17:13:05', '2022-09-25 17:34:08', 1, NULL, 1, 400, 0, 'None', '14X14 SS', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 3, 3, ''),
(19, 'KEINGS S 14X14 SS 5\"', NULL, 6, 6, NULL, 0, 0, 0, 0, 0, NULL, '51204879', '2022-09-18 17:13:48', '2022-09-25 17:33:57', 1, NULL, 1, 500, 0, 'None', '14X14 SS', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 3, 3, ''),
(20, 'KEINGS M 14X14 SS 2\"', NULL, 6, 6, NULL, 0, 0, 0, 0, 0, NULL, '01385729', '2022-09-18 17:15:31', '2022-09-25 17:33:44', 1, NULL, 1, 200, 0, 'None', '14X14 SS', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 3, 3, ''),
(21, 'KEINGS M 14X14 SS 2.5\"', NULL, 6, 6, NULL, 0, 0, 0, 0, 0, NULL, '85417293', '2022-09-18 17:20:42', '2022-09-25 17:33:34', 1, NULL, 1, 250, 0, 'None', '14X14 SS', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 3, 3, ''),
(22, 'KEINGS M 14X14 SS 3\"', NULL, 6, 6, NULL, 0, 0, 0, 0, 0, NULL, '14892706', '2022-09-18 17:21:45', '2022-09-25 17:33:05', 1, NULL, 1, 300, 0, 'None', '14X14 SS', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 3, 3, ''),
(23, 'KEINGS M 14X14 SS 3.5\"', NULL, 6, 6, NULL, 0, 0, 0, 0, 0, NULL, '53027169', '2022-09-18 17:22:45', '2022-09-25 17:32:56', 1, NULL, 1, 350, 0, 'None', '14X14 SS', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 3, 3, ''),
(24, 'KEINGS M 14X14 SS 3.75\"', NULL, 6, 6, NULL, 0, 0, 0, 0, 0, NULL, '02894765', '2022-09-18 17:24:05', '2022-09-25 17:32:47', 1, NULL, 1, 375, 0, 'None', '14X14 SS', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 3, 3, ''),
(25, 'KEINGS M 14X14 SS 4\"', NULL, 6, 6, NULL, 0, 0, 0, 0, 0, NULL, '83976405', '2022-09-18 17:24:38', '2022-09-25 17:32:38', 1, NULL, 1, 400, 0, 'None', '14X14 SS', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 3, 3, ''),
(26, 'KEINGS M 14X14 SS 5\"', NULL, 6, 6, NULL, 0, 0, 0, 0, 0, NULL, '56913208', '2022-09-18 17:26:06', '2022-09-25 17:32:28', 1, NULL, 1, 500, 0, 'None', '14X14 SS', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 3, 3, ''),
(27, 'KEINGS M 14X14 BLK 2\"', NULL, 6, 6, NULL, 0, 0, 0, 0, 0, NULL, '35129470', '2022-09-18 17:27:31', '2022-09-25 17:32:20', 1, NULL, 1, 200, 0, 'None', '14X14 BLK', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 3, 3, ''),
(28, 'KEINGS M 14X14 BLK 2.5\"', NULL, 6, 6, NULL, 0, 0, 0, 0, 0, NULL, '34587906', '2022-09-18 17:28:01', '2022-09-25 17:32:08', 1, NULL, 1, 250, 0, 'None', '14X14 BLK', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 3, 3, ''),
(29, 'KEINGS M 14X14 BLK 3\"', NULL, 6, 6, NULL, 0, 0, 0, 0, 0, NULL, '02843517', '2022-09-18 17:28:51', '2022-09-25 17:31:59', 1, NULL, 1, 300, 0, 'None', '14X14 BLK', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 3, 3, ''),
(30, 'KEINGS M 14X14 BLK 3.5\"', NULL, 6, 6, NULL, 0, 0, 0, 0, 0, NULL, '91327086', '2022-09-18 17:29:25', '2022-09-25 17:31:49', 1, NULL, 1, 350, 0, 'None', '14X14 BLK', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 3, 3, ''),
(31, 'KEINGS M 14X14 BLK 3.75\"', NULL, 6, 6, NULL, 0, 0, 0, 0, 0, NULL, '18703946', '2022-09-18 17:30:03', '2022-09-25 17:31:40', 1, NULL, 1, 375, 0, 'None', '14X14 BLK', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 3, 3, ''),
(32, 'KEINGS M 14X14 BLK 4\"', NULL, 6, 6, NULL, 0, 0, 0, 0, 0, NULL, '57032819', '2022-09-18 17:30:50', '2022-09-25 17:31:31', 1, NULL, 1, 400, 0, 'None', '14X14 BLK', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 3, 3, ''),
(33, 'KEINGS M 14X14 BLK 5\"', NULL, 6, 6, NULL, 0, 0, 0, 0, 0, NULL, '64182759', '2022-09-18 17:31:22', '2022-09-25 17:31:20', 1, NULL, 1, 500, 0, 'None', '14X14 BLK', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 3, 3, ''),
(34, 'BENZZ 789 BLACK', NULL, 5, 3, NULL, 0, 0, 0, 0, 3, NULL, '62478590', '2022-09-18 17:51:41', '2023-01-24 12:33:35', 1, NULL, 1, 24, 0, 'None', '789 BLACK', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 2, 4, ''),
(35, 'BENZZ 789 WHITE', NULL, 5, 3, NULL, 0, 0, 0, 0, 3, NULL, '97054623', '2022-09-18 17:52:32', '2023-01-24 12:33:26', 1, NULL, 1, 24, 0, 'None', '789 WHITE', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 2, 4, ''),
(36, 'BENZZ 789 CLEAR', NULL, 5, 3, NULL, 0, 0, 0, 0, 3, NULL, '95864320', '2022-09-18 17:53:11', '2023-01-24 12:33:18', 1, NULL, 1, 24, 0, 'None', '789 CLEAR', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 2, 4, ''),
(37, 'BESTON POUCH 789 BLACK', NULL, 5, 5, NULL, 0, 0, 0, 0, 3, NULL, '30921458', '2022-09-18 17:54:40', '2023-01-24 12:33:11', 1, NULL, 1, 20, 0, 'None', '789 BLACK', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 2, 5, ''),
(38, 'BESTON POUCH 789 WHITE', NULL, 5, 5, NULL, 0, 0, 0, 0, 3, NULL, '97346082', '2022-09-18 17:55:12', '2023-01-24 12:33:04', 1, NULL, 1, 20, 0, 'None', '789 WHITE', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 2, 5, ''),
(39, 'EZZE 789 BLACK', NULL, 5, 3, NULL, 0, 0, 0, 0, 3, NULL, '19807452', '2022-09-18 17:56:50', '2023-01-24 12:32:57', 1, NULL, 1, 24, 0, 'None', '789 BLACK', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 2, 6, ''),
(40, 'EZZE 789 WHITE', NULL, 5, 3, NULL, 0, 0, 0, 0, 3, NULL, '20154976', '2022-09-18 17:57:42', '2023-01-24 12:32:49', 1, NULL, 1, 24, 0, 'None', '789 WHITE', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 2, 6, ''),
(41, 'CUBEX 789 BLACK', NULL, 5, 3, NULL, 0, 0, 0, 0, 3, NULL, '54310728', '2022-09-18 17:59:11', '2023-01-24 12:32:41', 1, NULL, 1, 24, 0, 'None', '789 BLACK', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 2, 7, ''),
(42, 'CUBEX 789 WHITE', NULL, 5, 3, NULL, 0, 0, 0, 0, 3, NULL, '85936147', '2022-09-18 18:00:26', '2023-01-24 12:32:33', 1, NULL, 1, 24, 0, 'None', '789 WHITE', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 2, 7, ''),
(43, 'CUBEX 789 CLEAR', NULL, 5, 3, NULL, 0, 0, 0, 0, 3, NULL, '23018496', '2022-09-18 18:02:18', '2023-01-24 12:32:26', 1, NULL, 1, 24, 0, 'None', '789 CLEAR', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 2, 7, ''),
(44, 'CUBEX PREMIUM 789 BLACK', NULL, 5, 3, NULL, 0, 0, 0, 0, 3, NULL, '08745632', '2022-09-18 18:03:00', '2023-01-24 12:32:19', 1, NULL, 1, 24, 0, 'None', '789 BLACK', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 2, 7, ''),
(45, 'CUBEX PREMIUM 789 WHITE', NULL, 5, 3, NULL, 0, 0, 0, 0, 3, NULL, '86540721', '2022-09-18 18:04:09', '2023-01-24 12:32:09', 1, NULL, 1, 24, 0, 'None', '789 WHITE', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 2, 7, ''),
(46, 'CUBEX PREMIUM 789 CLEAR', NULL, 5, 3, NULL, 0, 0, 0, 0, 3, NULL, '82719640', '2022-09-18 18:04:36', '2023-01-24 12:31:59', 1, NULL, 1, 24, 0, 'None', '789 CLEAR', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 2, 7, ''),
(47, 'EMPIRE 789 BLACK', NULL, 5, 3, NULL, 0, 0, 0, 0, 3, NULL, '61035297', '2022-09-18 18:06:47', '2023-07-31 14:35:48', 1, NULL, 1, 24, 0, 'None', '789 BLACK', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 2, 8, '35061000'),
(48, 'EMPIRE 789 WHITE', NULL, 5, 3, NULL, 0, 0, 0, 0, 3, NULL, '18236745', '2022-09-18 18:07:31', '2023-01-24 12:31:44', 1, NULL, 1, 24, 0, 'None', '789 WHITE', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 2, 8, ''),
(49, 'EMPIRE 789 CLEAR', NULL, 5, 3, NULL, 0, 0, 0, 0, 3, NULL, '48560129', '2022-09-18 18:08:04', '2023-07-31 14:35:55', 1, NULL, 1, 24, 0, 'None', '789 CLEAR', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 2, 8, '35061000'),
(50, 'KORESEAL 789 BLACK', NULL, 5, 3, NULL, 0, 0, 0, 0, 3, NULL, '52146389', '2022-09-18 18:16:42', '2023-01-24 12:31:03', 1, NULL, 1, 24, 0, 'None', '789 BLACK', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 2, 9, ''),
(51, 'KORESEAL 789 WHITE', NULL, 5, 3, NULL, 0, 0, 0, 0, 3, NULL, '10374956', '2022-09-18 18:17:34', '2023-01-24 12:30:45', 1, NULL, 1, 24, 0, 'None', '789 WHITE', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 2, 9, ''),
(52, 'KORESEAL 789 CLEAR', NULL, 5, 3, NULL, 0, 0, 0, 0, 3, NULL, '06318274', '2022-09-18 18:18:06', '2023-01-24 12:30:38', 1, NULL, 1, 24, 0, 'None', '789 CLEAR', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 2, 9, ''),
(53, 'LEZO 789 BLACK', NULL, 5, 3, NULL, 0, 0, 0, 0, 3, NULL, '12564789', '2022-09-18 18:20:11', '2023-01-24 12:30:25', 1, NULL, 1, 24, 0, 'None', '789 BLACK', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 2, 10, ''),
(54, 'LEZO 789 WHITE', NULL, 5, 3, NULL, 0, 0, 0, 0, 3, NULL, '93258674', '2022-09-18 18:20:42', '2023-01-24 12:30:15', 1, NULL, 1, 24, 0, 'None', '789 WHITE', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 2, 10, ''),
(55, 'LEZO 789 CLEAR', NULL, 5, 3, NULL, 0, 0, 0, 0, 3, NULL, '82093147', '2022-09-18 18:21:13', '2023-01-24 12:30:04', 1, NULL, 1, 24, 0, 'None', '789 CLEAR', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 2, 10, ''),
(56, 'VCAN B 789 BLACK', NULL, 5, 3, NULL, 0, 0, 0, 0, 3, NULL, '36159274', '2022-09-18 18:23:23', '2023-01-24 12:29:54', 1, NULL, 1, 24, 0, 'None', '789 BLACK', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 2, 11, ''),
(57, 'VCAN B 789 WHITE', NULL, 5, 3, NULL, 0, 0, 0, 0, 3, NULL, '01539724', '2022-09-18 18:24:00', '2023-01-24 12:29:38', 1, NULL, 1, 24, 0, 'None', '789 WHITE', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 2, 11, ''),
(58, 'VCAN B 789 CLEAR', NULL, 5, 3, NULL, 0, 0, 0, 0, 3, NULL, '17432590', '2022-09-18 18:24:33', '2023-01-24 12:29:32', 1, NULL, 1, 24, 0, 'None', '789 CLEAR', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 2, 11, ''),
(59, 'VCAN P 789 BLACK', NULL, 5, 3, NULL, 0, 0, 0, 0, 3, NULL, '29356718', '2022-09-18 18:25:21', '2023-01-24 12:29:18', 1, NULL, 1, 24, 0, 'None', '789 BLACK', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 2, 11, ''),
(60, 'VCAN P 789 WHITE', NULL, 5, 3, NULL, 0, 0, 0, 0, 3, NULL, '30694125', '2022-09-18 18:25:55', '2023-01-24 12:29:03', 1, NULL, 1, 24, 0, 'None', '789 WHITE', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 2, 11, ''),
(61, 'VCAN P 789 CLEAR', NULL, 5, 3, NULL, 0, 0, 0, 0, 3, NULL, '97835462', '2022-09-18 18:26:31', '2023-01-24 12:28:54', 1, NULL, 1, 24, 0, 'None', '789 CLEAR', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 2, 11, ''),
(62, 'V-BOND 789 BLACK', NULL, 5, 3, NULL, 0, 0, 0, 0, 3, NULL, '70681945', '2022-09-18 18:29:01', '2023-01-24 12:28:48', 1, NULL, 1, 24, 0, 'None', '789 BLACK', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 2, 12, ''),
(63, 'V-BOND 789 WHITE', NULL, 5, 3, NULL, 0, 0, 0, 0, 3, NULL, '23587614', '2022-09-18 18:30:42', '2023-01-24 12:28:36', 1, NULL, 1, 24, 0, 'None', '789 WHITE', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 2, 12, ''),
(64, 'VELFIT 789 BLACK', NULL, 5, 3, NULL, 0, 0, 0, 0, 3, NULL, '50842137', '2022-09-19 12:43:35', '2023-01-24 12:28:31', 1, NULL, 1, 24, 0, 'None', '789 BLACK', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 2, 13, ''),
(65, 'VELFIT 789 WHITE', NULL, 5, 3, NULL, 0, 0, 0, 0, 3, NULL, '01563294', '2022-09-19 12:44:16', '2023-01-24 12:28:25', 1, NULL, 1, 24, 0, 'None', '789 WHITE', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 2, 13, ''),
(66, 'VELFIT 789 CLEAR', NULL, 5, 3, NULL, 0, 0, 0, 0, 3, NULL, '64902587', '2022-09-19 12:44:49', '2023-01-24 12:28:18', 1, NULL, 1, 24, 0, 'None', '789 CLEAR', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 2, 13, ''),
(67, 'VELFIT NP BLACK', NULL, 5, 3, NULL, 0, 0, 0, 0, 3, NULL, '23908751', '2022-09-19 12:46:05', '2023-01-24 12:44:43', 1, NULL, 1, 24, 0, 'None', 'None', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 2, 13, ''),
(68, 'VELFIT NP WHITE', NULL, 5, 3, NULL, 0, 0, 0, 0, 0, NULL, '93605214', '2022-09-19 12:47:22', '0000-00-00 00:00:00', 1, NULL, 1, 24, 0, 'None', 'None', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 2, 13, ''),
(69, 'KEINGS 304 SS 3\"', NULL, 6, 6, NULL, 0, 0, 0, 0, 0, NULL, '50728134', '2022-09-19 13:30:15', '0000-00-00 00:00:00', 1, NULL, 1, 300, 0, 'None', '304 SS', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 3, 14, ''),
(70, 'KEINGS 304 SS 4\"', NULL, 6, 6, NULL, 0, 0, 0, 0, 0, NULL, '01583974', '2022-09-19 13:41:56', '0000-00-00 00:00:00', 1, NULL, 1, 400, 0, 'None', '304 SS', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 3, 14, ''),
(71, 'KEINGS 304 BLK 3\"', NULL, 6, 6, NULL, 0, 0, 0, 0, 0, NULL, '52408916', '2022-09-19 13:42:42', '0000-00-00 00:00:00', 1, NULL, 1, 300, 0, 'None', '304 BLK', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 3, 14, ''),
(72, 'KEINGS 304 BLK 4\"', NULL, 6, 6, NULL, 0, 0, 0, 0, 0, NULL, '09512843', '2022-09-19 13:43:14', '2022-09-22 16:10:14', 1, NULL, 1, 400, 0, 'None', '304 BLK', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 3, 14, ''),
(73, 'KEINGS M 18X16 SS 2\"', NULL, 6, 6, NULL, 0, 0, 0, 0, 0, NULL, '60894257', '2022-09-19 13:53:54', '2022-09-25 17:31:11', 1, NULL, 1, 200, 0, 'None', '18X16 SS', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 3, 16, ''),
(74, 'KEINGS M 18X16 SS 2.5\"', NULL, 6, 6, NULL, 0, 0, 0, 0, 0, NULL, '71586093', '2022-09-19 13:54:24', '2022-09-25 17:31:00', 1, NULL, 1, 250, 0, 'None', '18X16 SS', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 3, 16, ''),
(75, 'KEINGS M 18X16 SS 3\"', NULL, 6, 6, NULL, 0, 0, 0, 0, 0, NULL, '42598631', '2022-09-19 13:55:24', '2022-09-25 17:30:50', 1, NULL, 1, 300, 0, 'None', '18X16 SS', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 3, 16, ''),
(76, 'KEINGS M 18X16 SS 3.5\"', NULL, 6, 6, NULL, 0, 0, 0, 0, 0, NULL, '70354921', '2022-09-19 13:56:23', '2022-09-25 17:30:41', 1, NULL, 1, 350, 0, 'None', '18X16 SS', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 3, 16, ''),
(77, 'KEINGS M 18X16 SS 3.75\"', NULL, 6, 6, NULL, 0, 0, 0, 0, 0, NULL, '40321596', '2022-09-19 13:57:00', '2022-09-25 17:30:32', 1, NULL, 1, 375, 0, 'None', '18X16 SS', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 3, 16, ''),
(78, 'KEINGS M 18X16 SS 4\"', NULL, 6, 6, NULL, 0, 0, 0, 0, 0, NULL, '03918245', '2022-09-19 13:57:38', '2022-09-25 17:30:23', 1, NULL, 1, 400, 0, 'None', '18X16 SS', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 3, 16, ''),
(79, 'KEINGS M 18X16 SS 5\"', NULL, 6, 6, NULL, 0, 0, 0, 0, 0, NULL, '67150928', '2022-09-19 13:59:41', '2022-09-25 17:30:10', 1, NULL, 1, 500, 0, 'None', '18X16 SS', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 3, 16, ''),
(80, 'KEINGS M 18X16 BLK 2\"', NULL, 6, 6, NULL, 0, 0, 0, 0, 0, NULL, '17035486', '2022-09-19 14:00:47', '2022-09-25 17:30:01', 1, NULL, 1, 200, 0, 'None', '18X16 BLK', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 3, 16, ''),
(81, 'KEINGS M 18X16 BLK 2.5\"', NULL, 6, 6, NULL, 0, 0, 0, 0, 0, NULL, '89026354', '2022-09-19 14:01:29', '2022-09-25 17:29:50', 1, NULL, 1, 250, 0, 'None', '18X16 BLK', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 3, 16, ''),
(82, 'KEINGS M 18X16 BLK 3\"', NULL, 6, 6, NULL, 0, 0, 0, 0, 0, NULL, '96783150', '2022-09-19 14:02:10', '2022-09-25 17:29:40', 1, NULL, 1, 300, 0, 'None', '18X16 BLK', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 3, 16, ''),
(83, 'KEINGS M 18X16 BLK 3.5\"', NULL, 6, 6, NULL, 0, 0, 0, 0, 0, NULL, '59230714', '2022-09-19 14:03:56', '2022-09-25 17:29:29', 1, NULL, 1, 350, 0, 'None', '18X16 BLK', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 3, 16, ''),
(84, 'KEINGS M 18X16 BLK 3.75\"', NULL, 6, 6, NULL, 0, 0, 0, 0, 0, NULL, '04718925', '2022-09-19 14:04:43', '2022-09-25 17:29:12', 1, NULL, 1, 375, 0, 'None', '304 BLK', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 3, 16, ''),
(85, 'KEINGS M 18X16 BLK 4\"', NULL, 6, 6, NULL, 0, 0, 0, 0, 0, NULL, '78340165', '2022-09-19 14:05:20', '2022-09-25 17:29:02', 1, NULL, 1, 400, 0, 'None', '304 BLK', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 3, 16, ''),
(86, 'KEINGS M 18X16 BLK 5\"', NULL, 6, 6, NULL, 0, 0, 0, 0, 0, NULL, '41625839', '2022-09-19 14:05:49', '2022-09-25 17:28:48', 1, NULL, 1, 500, 0, 'None', '304 BLK', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 3, 16, ''),
(87, 'EMPIRE M 14X14 SS 2\"', NULL, 6, 6, NULL, 0, 0, 0, 0, 0, NULL, '17640289', '2022-09-19 14:16:19', '2022-09-25 17:42:14', 1, NULL, 1, 200, 0, 'None', '14X14 SS', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 3, 17, ''),
(88, 'EMPIRE M 14X14 SS 2.5\"', NULL, 6, 6, NULL, 0, 0, 0, 0, 0, NULL, '25490163', '2022-09-19 14:17:09', '2022-09-25 17:42:06', 1, NULL, 1, 250, 0, 'None', '14X14 SS', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 3, 17, ''),
(89, 'EMPIRE M 14X14 SS 3\"', NULL, 6, 6, NULL, 0, 0, 0, 0, 0, NULL, '28507964', '2022-09-19 14:17:42', '2022-09-25 17:41:58', 1, NULL, 1, 300, 0, 'None', '14X14 SS', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 3, 17, ''),
(90, 'EMPIRE M 14X14 SS 3.5\"', NULL, 6, 6, NULL, 0, 0, 0, 0, 0, NULL, '84725960', '2022-09-19 14:18:37', '2022-09-25 17:41:49', 1, NULL, 1, 350, 0, 'None', '14X14 SS', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 3, 17, ''),
(91, 'EMPIRE M 14X14 SS 3.75\"', NULL, 6, 6, NULL, 0, 0, 0, 0, 0, NULL, '25389147', '2022-09-19 14:19:04', '2022-09-25 17:41:41', 1, NULL, 1, 375, 0, 'None', '14X14 SS', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 3, 17, ''),
(92, 'EMPIRE M 14X14 SS 4\"', NULL, 6, 6, NULL, 0, 0, 0, 0, 0, NULL, '52486903', '2022-09-19 14:21:26', '2022-09-25 17:41:34', 1, NULL, 1, 400, 0, 'None', '14X14 SS', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 3, 17, ''),
(93, 'EMPIRE M 14X14 SS 5\"', NULL, 6, 6, NULL, 0, 0, 0, 0, 0, NULL, '46915807', '2022-09-19 14:43:44', '2022-09-25 17:41:26', 1, NULL, 1, 500, 0, 'None', '14X14 SS', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 3, 17, ''),
(94, 'EMPIRE M 14X14 BLK 2\"', NULL, 6, 6, NULL, 0, 0, 0, 0, 0, NULL, '08513279', '2022-09-19 14:52:49', '2022-09-25 17:41:08', 1, NULL, 1, 200, 0, 'None', '14X14 BLK', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 3, 17, ''),
(95, 'EMPIRE M 14X14 BLK 2.5\"', NULL, 6, 6, NULL, 0, 0, 0, 0, 0, NULL, '68093524', '2022-09-19 14:53:19', '2022-09-25 17:40:57', 1, NULL, 1, 250, 0, 'None', '14X14 BLK', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 3, 17, ''),
(96, 'EMPIRE M 14X14 BLK 3\"', NULL, 6, 6, NULL, 0, 0, 0, 0, 0, NULL, '08519423', '2022-09-19 14:53:46', '2022-09-25 17:40:47', 1, NULL, 1, 300, 0, 'None', '14X14 BLK', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 3, 17, ''),
(97, 'EMPIRE M 14X14 BLK 3.5\"', NULL, 6, 6, NULL, 0, 0, 0, 0, 0, NULL, '92340568', '2022-09-19 14:56:23', '2022-09-25 17:40:39', 1, NULL, 1, 350, 0, 'None', '14X14 BLK', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 3, 17, ''),
(98, 'EMPIRE M 14X14 BLK 3.75\"', NULL, 6, 6, NULL, 0, 0, 0, 0, 0, NULL, '53062819', '2022-09-19 14:58:01', '2022-09-25 17:40:31', 1, NULL, 1, 375, 0, 'None', '14X14 BLK', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 3, 17, ''),
(99, 'EMPIRE M 14X14 BLK 4\"', NULL, 6, 6, NULL, 0, 0, 0, 0, 0, NULL, '68519402', '2022-09-19 15:01:25', '2022-09-25 17:40:23', 1, NULL, 1, 400, 0, 'None', '14X14 BLK', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 3, 17, ''),
(100, 'EMPIRE M 14X14 BLK 5\"', NULL, 6, 6, NULL, 0, 0, 0, 0, 0, NULL, '76143028', '2022-09-19 15:02:29', '2022-09-25 17:40:16', 1, NULL, 1, 500, 0, 'None', '14X14 BLK', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 3, 17, ''),
(101, 'VCAN M 14X14 SS 2\"', NULL, 6, 6, NULL, 0, 0, 0, 0, 0, NULL, '09653271', '2022-09-19 15:18:03', '2022-09-25 17:39:45', 1, NULL, 1, 200, 0, 'None', '14X14 SS', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 3, 19, ''),
(102, 'VCAN M 14X14 SS 2.5\"', NULL, 6, 6, NULL, 0, 0, 0, 0, 0, NULL, '04182956', '2022-09-19 15:18:44', '2022-09-25 17:39:36', 1, NULL, 1, 250, 0, 'None', '14X14 SS', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 3, 19, ''),
(103, 'VCAN M 14X14 SS 3\"', NULL, 6, 6, NULL, 0, 0, 0, 0, 0, NULL, '79813056', '2022-09-19 15:19:13', '2022-09-25 17:39:27', 1, NULL, 1, 300, 0, 'None', '14X14 SS', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 3, 19, ''),
(104, 'VCAN M 14X14 SS 3.5\"', NULL, 6, 6, NULL, 0, 0, 0, 0, 0, NULL, '46270315', '2022-09-19 15:21:43', '2022-09-25 17:39:19', 1, NULL, 1, 350, 0, 'None', '14X14 SS', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 3, 19, ''),
(105, 'VCAN M 14X14 SS 3.75\"', NULL, 6, 6, NULL, 0, 0, 0, 0, 0, NULL, '68903524', '2022-09-19 15:22:26', '2022-09-25 17:39:11', 1, NULL, 1, 375, 0, 'None', '14X14 SS', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 3, 19, ''),
(106, 'VCAN M 14X14 SS 4\"', NULL, 6, 6, NULL, 0, 0, 0, 0, 0, NULL, '23195864', '2022-09-19 15:23:25', '2022-09-25 17:39:02', 1, NULL, 1, 400, 0, 'None', '14X14 SS', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 3, 19, ''),
(107, 'VCAN M 14X14 SS 5\"', NULL, 6, 6, NULL, 0, 0, 0, 0, 0, NULL, '01643598', '2022-09-19 15:24:10', '2022-09-25 17:38:54', 1, NULL, 1, 500, 0, 'None', '14X14 SS', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 3, 19, ''),
(108, 'VCAN M 18X16 SS 2\"', NULL, 6, 6, NULL, 0, 0, 0, 0, 0, NULL, '39408726', '2022-09-19 15:30:57', '2023-07-19 15:29:34', 1, NULL, 1, 200, 0, 'None', '18X16 SS', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 3, 20, '76169100'),
(109, 'VCAN M 18X16 SS 2.5\"', NULL, 6, 6, NULL, 0, 0, 0, 0, 0, NULL, '23851069', '2022-09-19 15:31:55', '2023-07-19 15:29:27', 1, NULL, 1, 250, 0, 'None', '18X16 SS', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 3, 20, '76169100'),
(110, 'VCAN M 18X16 SS 3\"', NULL, 6, 6, NULL, 0, 0, 0, 0, 0, NULL, '40269517', '2022-09-19 15:32:56', '2023-07-19 15:29:19', 1, NULL, 1, 300, 0, 'None', '18X16 SS', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 3, 20, '76169100'),
(111, 'VCAN M 18X16 SS 3.5\"', NULL, 6, 6, NULL, 0, 0, 0, 0, 0, NULL, '89176543', '2022-09-19 15:33:25', '2023-07-19 15:29:12', 1, NULL, 1, 350, 0, 'None', '18X16 SS', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 3, 20, '76169100'),
(112, 'VCAN M 18X16 SS 3.75\"', NULL, 6, 6, NULL, 0, 0, 0, 0, 0, NULL, '42390765', '2022-09-19 15:34:10', '2023-07-19 15:29:05', 1, NULL, 1, 375, 0, 'None', '18X16 SS', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 3, 20, '76169100'),
(113, 'VCAN M 18X16 SS 4\"', NULL, 6, 6, NULL, 0, 0, 0, 0, 0, NULL, '78049516', '2022-09-19 15:34:38', '2023-07-19 15:28:58', 1, NULL, 1, 400, 0, 'None', '18X16 SS', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 3, 20, '76169100'),
(114, 'VCAN M 18X16 SS 5\"', NULL, 6, 6, NULL, 0, 0, 0, 0, 0, NULL, '48657230', '2022-09-19 15:35:20', '2023-07-19 15:28:50', 1, NULL, 1, 500, 0, 'None', '18X16 SS', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 3, 20, '76169100'),
(115, 'VCAN M 18X16 BLK 2\"', NULL, 6, 6, NULL, 0, 0, 0, 0, 0, NULL, '47826953', '2022-09-19 16:52:00', '2023-07-19 15:28:42', 1, NULL, 1, 200, 0, 'None', '18X16 BLK', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 3, 20, '76169100'),
(116, 'VCAN M 18X16 BLK 2.5\"', NULL, 6, 6, NULL, 0, 0, 0, 0, 0, NULL, '25149386', '2022-09-19 16:52:55', '2023-07-19 15:28:35', 1, NULL, 1, 250, 0, 'None', '18X16 BLK', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 3, 20, '76169100'),
(117, 'VCAN M 18X16 BLK 3\"', NULL, 6, 6, NULL, 0, 0, 0, 0, 0, NULL, '95871042', '2022-09-19 16:53:31', '2023-07-19 15:28:28', 1, NULL, 1, 300, 0, 'None', '18X16 BLK', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 3, 20, '76169100'),
(118, 'VCAN M 18X16 BLK 3.5\"', NULL, 6, 6, NULL, 0, 0, 0, 0, 0, NULL, '78062914', '2022-09-19 16:53:59', '2023-07-19 15:28:20', 1, NULL, 1, 350, 0, 'None', '18X16 BLK', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 3, 20, '76169100'),
(119, 'VCAN M 18X16 BLK 3.75\"', NULL, 6, 6, NULL, 0, 0, 0, 0, 0, NULL, '05947286', '2022-09-19 16:54:49', '2023-07-19 15:28:11', 1, NULL, 1, 375, 0, 'None', '18X16 BLK', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 3, 20, '76169100'),
(120, 'VCAN M 18X16 BLK 4\"', NULL, 6, 6, NULL, 0, 0, 0, 0, 0, NULL, '35782406', '2022-09-19 16:55:38', '2023-07-19 15:28:04', 1, NULL, 1, 400, 0, 'None', '18X16 BLK', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 3, 20, '76169100'),
(121, 'VCAN M 18X16 BLK 5\"', NULL, 6, 6, NULL, 0, 0, 0, 0, 0, NULL, '04872539', '2022-09-19 16:56:11', '2023-07-19 15:27:58', 1, NULL, 1, 500, 0, 'None', '18X16 BLK', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 3, 20, '76169100'),
(122, 'VCAN M 304 SS 3\"', NULL, 6, 6, NULL, 0, 0, 0, 0, 0, NULL, '03751489', '2022-09-19 17:03:30', '2023-06-24 13:51:24', 1, NULL, 1, 300, 0, 'None', '304 SS', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 3, 30, ''),
(123, 'VCAN M 304 SS 4\"', NULL, 6, 6, NULL, 0, 0, 0, 0, 0, NULL, '36145097', '2022-09-19 17:04:05', '2023-06-24 13:51:11', 1, NULL, 1, 400, 0, 'None', '304 SS', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 3, 30, ''),
(124, 'VCAN M 304 SS 5\"', NULL, 6, 6, NULL, 0, 0, 0, 0, 0, NULL, '57438901', '2022-09-19 17:04:44', '2023-06-24 13:51:02', 1, NULL, 1, 500, 0, 'None', '304 SS', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 3, 30, ''),
(125, 'VCAN M 304 BLK 3\"', NULL, 6, 6, NULL, 0, 0, 0, 0, 0, NULL, '95712063', '2022-09-19 17:09:18', '2023-06-24 13:50:49', 1, NULL, 1, 300, 0, 'None', '304 BLK', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 3, 30, ''),
(126, 'VCAN M 304 BLK 4\"', NULL, 6, 6, NULL, 0, 0, 0, 0, 0, NULL, '13564209', '2022-09-19 17:09:48', '2023-06-24 13:50:38', 1, NULL, 1, 400, 0, 'None', '304 BLK', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 3, 30, ''),
(127, 'VCAN M 304 BLK 5\"', NULL, 6, 6, NULL, 0, 0, 0, 0, 0, NULL, '29786314', '2022-09-19 17:10:23', '2023-06-24 13:50:29', 1, NULL, 1, 500, 0, 'None', '304 BLK', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 3, 30, ''),
(128, 'CX DOOR CLOSER', NULL, 5, 2, NULL, 0, 0, 0, 0, 0, NULL, '46890573', '2022-09-19 17:16:00', '0000-00-00 00:00:00', 1, NULL, 1, 10, 0, 'None', 'None', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 7, 22, ''),
(129, 'KEINGS FSTAY 8\"', NULL, 5, 1, NULL, 0, 0, 0, 0, 0, NULL, '80297134', '2022-09-19 17:20:13', '0000-00-00 00:00:00', 1, NULL, 1, 50, 0, 'None', 'None', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 4, 23, ''),
(130, 'KEINGS FSTAY 10\"', NULL, 5, 1, NULL, 0, 0, 0, 0, 0, NULL, '81074592', '2022-09-19 17:20:36', '2023-07-31 12:26:08', 1, NULL, 1, 50, 0, 'None', 'None', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 4, 23, '83024110'),
(131, 'KEINGS FSTAY 12\"', NULL, 5, 1, NULL, 0, 0, 0, 0, 0, NULL, '36795420', '2022-09-19 17:23:29', '0000-00-00 00:00:00', 1, NULL, 1, 50, 0, 'None', 'None', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 4, 23, ''),
(132, 'KEINGS FSTAY 14\"', NULL, 5, 1, NULL, 0, 0, 0, 0, 0, NULL, '63402987', '2022-09-19 17:24:08', '2023-07-31 12:26:15', 1, NULL, 1, 50, 0, 'None', 'None', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 4, 23, '83024110'),
(133, 'KEINGS FSTAY 16\"', NULL, 5, 1, NULL, 0, 0, 0, 0, 0, NULL, '48207165', '2022-09-19 17:25:14', '0000-00-00 00:00:00', 1, NULL, 1, 50, 0, 'None', 'None', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 4, 23, ''),
(134, 'VELFIT FSTAY 8\"', NULL, 5, 1, NULL, 0, 0, 0, 0, 0, NULL, '03894671', '2022-09-19 17:25:46', '0000-00-00 00:00:00', 1, NULL, 1, 50, 0, 'None', 'None', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 4, 24, ''),
(135, 'VELFIT FSTAY 10\"', NULL, 5, 1, NULL, 0, 0, 0, 0, 0, NULL, '02537968', '2022-09-19 17:26:52', '0000-00-00 00:00:00', 1, NULL, 1, 50, 0, 'None', 'None', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 4, 24, ''),
(136, 'VELFIT FSTAY 12\"', NULL, 5, 1, NULL, 0, 0, 0, 0, 0, NULL, '89421365', '2022-09-19 17:28:23', '0000-00-00 00:00:00', 1, NULL, 1, 50, 0, 'None', 'None', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 4, 24, ''),
(137, 'VELFIT FSTAY 14\"', NULL, 5, 1, NULL, 0, 0, 0, 0, 0, NULL, '30942675', '2022-09-19 17:28:44', '0000-00-00 00:00:00', 1, NULL, 1, 50, 0, 'None', 'None', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 4, 24, ''),
(138, 'VELFIT FSTAY 16\"', NULL, 5, 1, NULL, 0, 0, 0, 0, 0, NULL, '92461853', '2022-09-19 17:29:39', '0000-00-00 00:00:00', 1, NULL, 1, 50, 0, 'None', 'None', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 4, 24, ''),
(139, 'KEINGS WOOLPILE BLK', NULL, 5, 2, NULL, 0, 0, 0, 0, 0, NULL, '42395810', '2022-09-19 17:37:09', '2023-01-08 18:33:06', 1, NULL, 1, 1, 0, 'None', 'WOOLPILE BLACK', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 5, 25, ''),
(140, 'KEINGS WOOLPILE GREY', NULL, 5, 2, NULL, 0, 0, 0, 0, 0, NULL, '71905648', '2022-09-19 17:37:34', '2023-01-08 18:32:25', 1, NULL, 1, 1, 0, 'None', 'WOOLPILE GREY', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 5, 25, ''),
(141, 'DOMAL LOCK BLK', NULL, 5, 2, NULL, 0, 0, 0, 0, 0, NULL, '80176239', '2022-09-19 17:39:08', '2023-08-01 11:46:20', 1, NULL, 1, 100, 0, 'None', 'None', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 8, 26, '83024110'),
(142, 'DOMAL LOCK WHT', NULL, 5, 2, NULL, 0, 0, 0, 0, 0, NULL, '56837920', '2022-09-19 17:40:56', '2023-08-01 11:46:09', 1, NULL, 1, 100, 0, 'None', 'None', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 8, 26, '83024110'),
(143, 'BEARING 625', NULL, 5, 2, NULL, 0, 0, 0, 0, 0, NULL, '23156704', '2022-09-19 18:07:29', '0000-00-00 00:00:00', 1, NULL, 1, 5000, 0, 'None', 'None', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 6, 27, ''),
(144, 'BEARING 626', NULL, 5, 2, NULL, 0, 0, 0, 0, 0, NULL, '63987015', '2022-09-19 18:08:00', '0000-00-00 00:00:00', 1, NULL, 1, 3000, 0, 'None', 'None', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 6, 27, ''),
(145, 'BEARING 608', NULL, 5, 2, NULL, 0, 0, 0, 0, 0, NULL, '12578093', '2022-09-19 18:08:58', '0000-00-00 00:00:00', 1, NULL, 1, 2000, 0, 'None', 'None', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 6, 27, ''),
(146, 'CYCLONE (L) 18X16 BLK 2\"', NULL, 6, 6, NULL, 0, 0, 0, 0, 0, NULL, '73298164', '2022-09-19 18:11:30', '0000-00-00 00:00:00', 1, NULL, 1, 200, 0, 'None', '18X16 BLK', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 3, 29, ''),
(147, 'CYCLONE (L) 18X16 BLK 2.5\"', NULL, 6, 6, NULL, 0, 0, 0, 0, 0, NULL, '97308264', '2022-09-19 18:12:25', '0000-00-00 00:00:00', 1, NULL, 1, 250, 0, 'None', '18X16 BLK', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 3, 29, ''),
(148, 'CYCLONE (L) 18X16 BLK 3\"', NULL, 6, 6, NULL, 0, 0, 0, 0, 0, NULL, '97013254', '2022-09-19 18:12:55', '2023-07-13 17:51:01', 1, NULL, 1, 300, 0, 'None', '18X16 BLK', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 3, 29, '76169100'),
(149, 'CYCLONE (L) 18X16 BLK 3.5\"', NULL, 6, 6, NULL, 0, 0, 0, 0, 0, NULL, '09738651', '2022-09-19 18:13:46', '0000-00-00 00:00:00', 1, NULL, 1, 350, 0, 'None', '18X16 BLK', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 3, 29, ''),
(150, 'CYCLONE (L) 18X16 BLK 4\"', NULL, 6, 6, NULL, 0, 0, 0, 0, 0, NULL, '70325689', '2022-09-19 18:14:23', '2023-07-13 17:50:36', 1, NULL, 1, 400, 0, 'None', '18X16 BLK', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 3, 29, '76169100'),
(151, 'CYCLONE (S) 14X14 BLK 3\"', NULL, 6, 6, NULL, 0, 0, 0, 0, 0, NULL, '54072968', '2022-09-19 18:16:27', '2023-01-30 13:25:24', 1, NULL, 1, 150, 0, 'None', '14X14 BLK', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 3, 28, ''),
(152, 'CYCLONE (S) 14X14 BLK 4\"', NULL, 6, 6, NULL, 0, 0, 0, 0, 0, NULL, '30856742', '2022-09-19 18:17:43', '2023-01-30 13:24:52', 1, NULL, 1, 200, 0, 'None', '14X14 BLK', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 3, 28, ''),
(154, 'CUBEX 789 GREY', NULL, 5, 3, NULL, 0, 0, 0, 0, 0, NULL, '49370825', '2022-09-23 13:42:28', '0000-00-00 00:00:00', 1, NULL, 1, 24, 0, 'None', 'None', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 2, 7, ''),
(155, 'VCAN P 789 BROWN', NULL, 5, 3, NULL, 0, 0, 0, 0, 3, NULL, '02853467', '2022-09-24 22:54:52', '2023-01-24 12:28:12', 1, NULL, 1, 24, 0, 'None', 'None', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 2, 11, ''),
(156, 'VALUE 14X14 SS 2\"', NULL, 6, 6, NULL, 0, 0, 0, 0, 0, NULL, '27064135', '2022-09-24 23:40:46', '0000-00-00 00:00:00', 1, NULL, 1, 200, 0, 'None', '14X14 SS', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 3, 21, ''),
(157, 'VALUE 14X14 SS 2.5\"', NULL, 6, 6, NULL, 0, 0, 0, 0, 0, NULL, '63410827', '2022-09-24 23:41:36', '0000-00-00 00:00:00', 1, NULL, 1, 250, 0, 'None', '14X14 SS', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 3, 21, ''),
(158, 'VALUE 14X14 SS 3\"', NULL, 6, 6, NULL, 0, 0, 0, 0, 0, NULL, '41905236', '2022-09-24 23:42:03', '0000-00-00 00:00:00', 1, NULL, 1, 300, 0, 'None', '14X14 SS', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 3, 21, ''),
(159, 'VALUE 14X14 SS 4\"', NULL, 6, 6, NULL, 0, 0, 0, 0, 0, NULL, '76284190', '2022-09-24 23:42:33', '0000-00-00 00:00:00', 1, NULL, 1, 400, 0, 'None', '14X14 SS', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 3, 21, ''),
(160, 'VCAN PREMIUM 789 BLACK', NULL, 5, 3, NULL, 0, 0, 0, 0, 3, NULL, '23864705', '2022-09-24 23:49:51', '2023-01-24 12:28:03', 1, NULL, 1, 24, 0, 'None', '789 BLACK', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 2, 11, ''),
(161, 'VCAN PREMIUM 789 WHITE', NULL, 5, 3, NULL, 0, 0, 0, 0, 3, NULL, '43752609', '2022-09-24 23:50:20', '2023-01-24 12:27:53', 1, NULL, 1, 24, 0, 'None', '789 WHITE', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 2, 11, ''),
(162, 'VCAN PREMIUM 789 CLEAR', NULL, 5, 3, NULL, 0, 0, 0, 0, 3, NULL, '57894126', '2022-09-24 23:50:53', '2023-01-24 12:27:47', 1, NULL, 1, 24, 0, 'None', '789 CLEAR', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 2, 11, ''),
(164, 'VCAN M 14X14 BLK 2.5\"', NULL, 6, 6, NULL, 0, 0, 0, 0, 0, NULL, '01489753', '2022-10-30 13:09:30', '0000-00-00 00:00:00', 1, NULL, 1, 250, 0, 'None', '14X14 BLK', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 3, 19, ''),
(165, 'VCAN M 14X14 BLK 3\"', NULL, 6, 6, NULL, 0, 0, 0, 0, 0, NULL, '25348019', '2022-10-30 13:10:35', '0000-00-00 00:00:00', 1, NULL, 1, 300, 0, 'None', '14X14 BLK', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 3, 19, ''),
(166, 'VCAN M 14X14 BLK 3.5\"', NULL, 6, 6, NULL, 0, 0, 0, 0, 0, NULL, '08154732', '2022-10-30 13:11:30', '0000-00-00 00:00:00', 1, NULL, 1, 350, 0, 'None', '14X14 BLK', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 3, 19, ''),
(167, 'VCAN M 14X14 BLK 3.75\"', NULL, 6, 6, NULL, 0, 0, 0, 0, 0, NULL, '48536091', '2022-10-30 13:12:13', '0000-00-00 00:00:00', 1, NULL, 1, 375, 0, 'None', '14X14 BLK', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 3, 19, ''),
(168, 'VCAN M 14X14 BLK 4\"', NULL, 6, 6, NULL, 0, 0, 0, 0, 0, NULL, '70235918', '2022-10-30 13:13:05', '0000-00-00 00:00:00', 1, NULL, 1, 400, 0, 'None', '14X14 BLK', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 3, 19, ''),
(169, 'VCAN M 14X14 BLK 5\"', NULL, 6, 6, NULL, 0, 0, 0, 0, 0, NULL, '25934801', '2022-10-30 13:13:54', '2023-06-17 14:26:09', 1, NULL, 1, 500, 0, 'None', '14X14 BLK', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 3, 19, '76169100'),
(170, 'VCAN M 18X16 BRT 3.5\"', NULL, 6, 6, NULL, 0, 0, 0, 0, 0, NULL, '01425986', '2022-10-30 13:14:54', '2023-06-17 14:25:57', 1, NULL, 1, 350, 0, 'None', 'None', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 3, 19, '76169100'),
(171, 'VCAN M 18X16 BRT 3.75\"', NULL, 6, 6, NULL, 0, 0, 0, 0, 0, NULL, '20817635', '2022-10-30 13:15:45', '2023-06-17 14:25:50', 1, NULL, 1, 375, 0, 'None', 'None', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 3, 19, '76169100'),
(172, '14X14 S SS 2 FT UB', NULL, 6, 6, NULL, 0, 0, 0, 0, 0, NULL, '25736019', '2022-11-12 12:41:26', '2023-06-17 14:25:40', 1, NULL, 1, 200, 0, 'None', '14X14 SS', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 3, 31, '76169100'),
(173, '14X14 S SS 2.5 FT UB', NULL, 6, 6, NULL, 0, 0, 0, 0, 0, NULL, '19403258', '2022-11-12 12:42:08', '2023-06-17 14:25:31', 1, NULL, 1, 250, 0, 'None', '14X14 SS', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 3, 31, '76169100'),
(174, '14X14 S SS 3 FT UB', NULL, 6, 6, NULL, 0, 0, 0, 0, 0, NULL, '81563407', '2022-11-12 12:42:44', '2023-06-17 14:25:23', 1, NULL, 1, 300, 0, 'None', '14X14 SS', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 3, 31, '76169100'),
(175, '14X14 S SS 3.5 FT UB', NULL, 6, 6, NULL, 0, 0, 0, 0, 0, NULL, '47306518', '2022-11-12 12:43:31', '2023-06-17 14:25:14', 1, NULL, 1, 350, 0, 'None', '14X14 SS', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 3, 31, '76169100'),
(176, '14X14 S SS 3.75 FT UB', NULL, 6, 6, NULL, 0, 0, 0, 0, 0, NULL, '92453801', '2022-11-12 12:44:08', '2023-06-17 14:25:05', 1, NULL, 1, 375, 0, 'None', '14X14 SS', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 3, 31, '76169100'),
(177, '14X14 S SS 4 FT UB', NULL, 6, 6, NULL, 0, 0, 0, 0, 0, NULL, '43891072', '2022-11-12 12:44:45', '2023-06-17 14:24:56', 1, NULL, 1, 400, 0, 'None', '14X14 SS', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 3, 31, '76169100'),
(178, '14X14 S SS 5 FT UB', NULL, 6, 6, NULL, 0, 0, 0, 0, 0, NULL, '21094573', '2022-11-12 12:45:22', '2023-06-17 14:24:48', 1, NULL, 1, 500, 0, 'None', '14X14 SS', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 3, 31, '76169100'),
(179, 'FLOOR SPRING', NULL, 5, 2, NULL, 0, 0, 0, 0, 0, NULL, '21406953', '2022-11-12 14:00:50', '0000-00-00 00:00:00', 1, NULL, 1, 4, 0, 'None', 'None', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 9, 32, ''),
(180, 'SILICONE GUN (28 PC)', NULL, 5, 2, NULL, 0, 0, 0, 0, 0, NULL, '95670183', '2022-11-28 15:43:00', '2023-06-17 14:24:35', 1, NULL, 1, 28, 0, 'None', 'None', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 9, 32, '85151900'),
(181, 'SILICONE GUN (24 PC)', NULL, 5, 2, NULL, 0, 0, 0, 0, 0, NULL, '08153726', '2022-11-28 15:44:50', '2023-06-17 14:24:27', 1, NULL, 1, 24, 0, 'None', 'None', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 9, 32, '85151900'),
(182, 'WOOLPILE FCT BLACK (L)', NULL, 5, 7, NULL, 0, 0, 0, 0, 0, NULL, '06957138', '2022-12-01 13:00:13', '2023-06-17 14:23:26', 1, NULL, 1, 8, 0, 'None', 'WOOLPILE BLACK', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 5, 33, '59119090'),
(183, 'WOOLPILE FCT GREY (L)', NULL, 5, 7, NULL, 0, 0, 0, 0, 0, NULL, '83471209', '2022-12-01 13:01:00', '2023-06-17 14:23:16', 1, NULL, 1, 8, 0, 'None', 'WOOLPILE GREY', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 5, 33, '59119090'),
(184, 'WOOLPILE FCT BLACK (S)', NULL, 5, 7, NULL, 0, 0, 0, 0, 0, NULL, '31548207', '2022-12-01 13:01:38', '2023-06-17 14:20:41', 1, NULL, 1, 10, 0, 'None', 'WOOLPILE BLACK', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 5, 33, '59119090'),
(185, 'WOOLPILE FCT GREY (S)', NULL, 5, 7, NULL, 0, 0, 0, 0, 0, NULL, '51324067', '2022-12-01 13:03:37', '2023-06-17 14:20:32', 1, NULL, 1, 10, 0, 'None', 'WOOLPILE GREY', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 5, 33, '59119090'),
(186, '16 MM UPVC FLAT ROLLER', NULL, 5, 2, NULL, 0, 0, 0, 0, 0, NULL, '06493258', '2022-12-01 16:59:03', '2023-06-17 14:20:23', 1, NULL, 1, 200, 0, 'None', 'None', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 6, 27, '84821020'),
(187, '16 MM UPVC GROOVE ROLLER', NULL, 5, 2, NULL, 0, 0, 0, 0, 0, NULL, '27189540', '2022-12-01 16:59:42', '2023-06-17 14:20:16', 1, NULL, 1, 200, 0, 'None', 'None', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 6, 27, '84821020'),
(188, 'DOMAL BEARING', NULL, 5, 2, NULL, 0, 0, 0, 0, 0, NULL, '26435719', '2022-12-01 17:00:26', '2023-06-17 14:20:08', 1, NULL, 1, 560, 0, 'None', 'None', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 6, 27, '84821020'),
(189, 'KEINGS 304 SS 2.5\"', NULL, 6, 6, NULL, 0, 0, 0, 0, 0, NULL, '80537124', '2022-12-08 12:30:43', '2023-06-17 14:18:58', 1, NULL, 1, 250, 0, 'None', '304 SS', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 3, 14, '73141410'),
(190, 'VCAN M 18X16 BRT 2.5\"', NULL, 6, 6, NULL, 0, 0, 0, 0, 0, NULL, '49250168', '2022-12-08 17:04:43', '2023-06-17 14:18:34', 1, NULL, 1, 250, 0, 'None', 'None', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 3, 20, '76169100'),
(191, 'G-FITTING', NULL, 5, 2, NULL, 0, 0, 0, 0, 0, NULL, '92504781', '2022-12-31 14:15:08', '0000-00-00 00:00:00', 1, NULL, 1, 100, 0, 'None', 'None', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 9, 32, ''),
(192, 'FSTAY UB-8\"', NULL, 5, 1, NULL, 0, 0, 0, 0, 0, NULL, '14037596', '2022-12-31 14:50:16', '2023-06-17 14:18:24', 1, NULL, 1, 50, 0, 'None', 'None', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 4, 34, '83024110'),
(193, 'FSTAY UB-10\"', NULL, 5, 1, NULL, 0, 0, 0, 0, 0, NULL, '36495810', '2022-12-31 14:50:42', '2023-06-17 14:18:18', 1, NULL, 1, 50, 0, 'None', 'None', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 4, 34, '83024110'),
(194, 'FSTAY UB-12\"', NULL, 5, 1, NULL, 0, 0, 0, 0, 0, NULL, '67123094', '2022-12-31 14:51:17', '2023-06-17 14:18:11', 1, NULL, 1, 50, 0, 'None', 'None', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 4, 34, '83024110'),
(195, 'FSTAY UB-14\"', NULL, 5, 1, NULL, 0, 0, 0, 0, 0, NULL, '75834016', '2022-12-31 14:52:06', '2023-06-17 14:18:04', 1, NULL, 1, 50, 0, 'None', 'None', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 4, 34, '83024110'),
(196, 'FSTAY UB-16\"', NULL, 5, 1, NULL, 0, 0, 0, 0, 0, NULL, '58130672', '2022-12-31 14:52:52', '2023-06-17 14:17:58', 1, NULL, 1, 50, 0, 'None', 'None', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 4, 34, '83024110'),
(197, 'FSTAY UB-18\"', NULL, 5, 1, NULL, 0, 0, 0, 0, 0, NULL, '04861372', '2022-12-31 14:53:24', '2023-06-17 14:17:50', 1, NULL, 1, 50, 0, 'None', 'None', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 4, 34, '83024110'),
(198, 'UPVC HANDLE', NULL, 5, 2, NULL, 0, 0, 0, 0, 0, NULL, '53267981', '2022-12-31 15:00:21', '0000-00-00 00:00:00', 1, NULL, 1, 100, 0, 'None', 'None', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 9, 32, ''),
(199, 'LOCK PATCH US-10', NULL, 5, 2, NULL, 0, 0, 0, 0, 0, NULL, '85390647', '2022-12-31 15:09:44', '0000-00-00 00:00:00', 1, NULL, 1, 20, 0, 'None', 'None', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 9, 32, ''),
(200, '625 MANGO MILKY', NULL, 8, 2, NULL, 0, 0, 0, 0, 0, NULL, '14056982', '2023-01-01 14:41:30', '2023-06-17 14:16:32', 1, NULL, 1, 3000, 0, 'None', 'None', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 6, 27, '84821020'),
(201, '625 UNO BODY', NULL, 8, 2, NULL, 0, 0, 0, 0, 0, NULL, '83102756', '2023-01-01 14:42:13', '2023-06-17 14:16:25', 1, NULL, 1, 3000, 0, 'None', 'None', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 6, 27, '84821020'),
(202, '626 METAL BODY', NULL, 8, 2, NULL, 0, 0, 0, 0, 0, NULL, '50391267', '2023-01-01 14:44:10', '2023-06-17 14:16:12', 1, NULL, 1, 3000, 0, 'None', 'None', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 6, 27, '84821020'),
(203, '1+1 DOMAL', NULL, 8, 2, NULL, 0, 0, 0, 0, 0, NULL, '21605348', '2023-01-01 14:45:28', '2023-06-17 14:16:19', 1, NULL, 1, 1000, 0, 'None', 'None', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 6, 27, '84821020'),
(204, 'KEINGS PREMIUM 789 BLK', NULL, 5, 3, NULL, 0, 0, 0, 0, 3, NULL, '84759021', '2023-01-04 11:23:03', '2023-06-17 14:16:03', 1, NULL, 1, 24, 0, 'None', '789 BLACK', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 2, 2, '35061000'),
(205, 'KEINGS PREMIUM 789 WHT', NULL, 5, 3, NULL, 0, 0, 0, 0, 3, NULL, '60382719', '2023-01-04 11:23:39', '2023-06-17 14:15:54', 1, NULL, 1, 24, 0, 'None', '789 WHITE', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 2, 2, '35061000'),
(206, 'KEINGS PREMIUM 789 CLR', NULL, 5, 3, NULL, 0, 0, 0, 0, 3, NULL, '25487391', '2023-01-04 11:24:09', '2023-06-17 14:15:41', 1, NULL, 1, 24, 0, 'None', '789 CLEAR', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 2, 2, '35061000'),
(207, 'V-BOND 789 GREY', NULL, 5, 3, NULL, 0, 0, 0, 0, 3, NULL, '25160897', '2023-01-04 11:26:04', '2023-06-17 14:15:27', 1, NULL, 1, 24, 0, 'None', 'None', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 2, 12, '35061000'),
(208, '625 BLACK TO BLACK', NULL, 8, 2, NULL, 0, 0, 0, 0, 0, NULL, '28507946', '2023-01-20 14:39:02', '2023-06-17 14:14:57', 1, NULL, 1, 3000, 0, 'None', 'None', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 6, 27, '84821020'),
(209, '14X14 BLK 3.5FT UB', NULL, 6, 6, NULL, 0, 0, 0, 0, 0, NULL, '83267941', '2023-01-26 18:03:34', '2023-06-17 14:14:48', 1, NULL, 1, 350, 0, 'None', '14X14 BLK', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 3, 31, '76169100'),
(210, '625 BLACK TO PINK', NULL, 8, 2, NULL, 0, 0, 0, 0, 0, NULL, '90537684', '2023-01-26 22:46:18', '2023-06-17 14:14:36', 1, NULL, 1, 3000, 0, 'None', 'None', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 6, 27, '84821020'),
(211, 'DOMAL LOCK 6\"', NULL, 5, 2, NULL, 0, 0, 0, 0, 0, NULL, '61237940', '2023-01-27 15:04:27', '2023-08-10 12:02:41', 1, NULL, 1, 100, 0, 'None', 'None', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 9, 32, '84821020'),
(212, '625 METAL BODY', NULL, 5, 2, NULL, 0, 0, 0, 0, 0, NULL, '60425173', '2023-02-06 13:55:34', '2023-06-17 14:14:27', 1, NULL, 1, 2500, 0, 'None', 'None', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 6, 27, '84821020'),
(213, 'EMPIRE S 14X14 BLK 3.5\"', NULL, 6, 6, NULL, 0, 0, 0, 0, 0, NULL, '83247091', '2023-02-06 15:26:58', '2023-07-07 18:32:28', 1, NULL, 1, 350, 0, 'None', '14X14 BLK', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 3, 17, '76169100'),
(214, 'EMPIRE S 14X14 BLK 3.75\"', NULL, 6, 6, NULL, 0, 0, 0, 0, 0, NULL, '89570461', '2023-02-06 15:27:46', '2023-07-07 18:32:18', 1, NULL, 1, 375, 0, 'None', '14X14 BLK', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 3, 17, '76169100'),
(215, 'EMPIRE S 14X14 BLK 4\"', NULL, 6, 6, NULL, 0, 0, 0, 0, 0, NULL, '12845639', '2023-02-06 15:28:35', '2023-07-07 18:32:08', 1, NULL, 1, 400, 0, 'None', '14X14 BLK', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 3, 17, '76169100'),
(216, 'EMPIRE S 14X14 BLK 5\"', NULL, 6, 6, NULL, 0, 0, 0, 0, 0, NULL, '10354692', '2023-02-06 15:37:35', '2023-07-07 18:31:57', 1, NULL, 1, 500, 0, 'None', '14X14 BLK', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 3, 17, '76169100'),
(217, 'INDIEURO WOOLPILE BLK L', NULL, 5, 7, NULL, 0, 0, 0, 0, 0, NULL, '20946781', '2023-03-30 13:56:10', '2023-06-17 13:45:58', 1, NULL, 1, 8, 0, 'None', 'WOOLPILE BLACK', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 5, 33, '59119090'),
(218, 'INDIEURO WOOLPILE BLK M', NULL, 5, 7, NULL, 0, 0, 0, 0, 0, NULL, '47105638', '2023-03-30 13:57:28', '2023-06-17 13:45:51', 1, NULL, 1, 8, 0, 'None', 'WOOLPILE BLACK', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 5, 33, '59119090'),
(219, 'INDIEURO WOOLPILE BLK S', NULL, 5, 7, NULL, 0, 0, 0, 0, 0, NULL, '70564923', '2023-03-30 13:58:24', '2023-06-17 13:45:24', 1, NULL, 1, 12, 0, 'None', 'WOOLPILE BLACK', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 5, 33, '59119090'),
(220, '14X14 M SS 2 FT UB', NULL, 6, 6, NULL, 0, 0, 0, 0, 0, NULL, '93058674', '2023-04-07 15:30:24', '2023-06-17 13:45:14', 1, NULL, 1, 200, 0, 'None', '14X14 SS', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 3, 31, '76169100'),
(221, '14X14 M SS 2.5 FT UB', NULL, 6, 6, NULL, 0, 0, 0, 0, 0, NULL, '53892714', '2023-04-07 15:30:59', '2023-06-17 13:45:08', 1, NULL, 1, 250, 0, 'None', '14X14 SS', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 3, 31, '76169100'),
(222, '14X14 M SS 3 FT UB', NULL, 6, 6, NULL, 0, 0, 0, 0, 0, NULL, '83947650', '2023-04-07 15:31:33', '2023-06-17 13:44:56', 1, NULL, 1, 300, 0, 'None', '14X14 SS', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 3, 31, '76169100'),
(223, '14X14 M SS 3.5 FT UB', NULL, 6, 6, NULL, 0, 0, 0, 0, 0, NULL, '74129603', '2023-04-07 15:32:03', '2023-06-17 13:44:49', 1, NULL, 1, 350, 0, 'None', '14X14 SS', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 3, 31, '76169100'),
(224, '14X14 M SS 3.75 FT UB', NULL, 6, 6, NULL, 0, 0, 0, 0, 0, NULL, '10436892', '2023-04-07 15:32:44', '2023-06-17 13:44:41', 1, NULL, 1, 375, 0, 'None', '14X14 SS', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 3, 31, '76169100'),
(225, '14X14 M SS 4 FT UB', NULL, 6, 6, NULL, 0, 0, 0, 0, 0, NULL, '39027481', '2023-04-07 15:33:14', '2023-06-17 13:44:34', 1, NULL, 1, 400, 0, 'None', '14X14 SS', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 3, 31, '76169100'),
(226, '14X14 M SS 5 FT UB', NULL, 6, 6, NULL, 0, 0, 0, 0, 0, NULL, '37694812', '2023-04-07 15:33:43', '2023-06-17 13:44:26', 1, NULL, 1, 500, 0, 'None', '14X14 SS', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 3, 31, '76169100'),
(227, '14X14 L SS 2 FT UB', NULL, 6, 6, NULL, 0, 0, 0, 0, 0, NULL, '04537196', '2023-04-07 15:34:37', '2023-06-17 13:44:19', 1, NULL, 1, 200, 0, 'None', '14X14 SS', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 3, 31, '76169100'),
(228, '14X14 L SS 2.5 FT UB', NULL, 6, 6, NULL, 0, 0, 0, 0, 0, NULL, '97650381', '2023-04-07 15:35:10', '2023-06-17 13:44:12', 1, NULL, 1, 250, 0, 'None', '14X14 SS', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 3, 31, '76169100');
INSERT INTO `product` (`id`, `name`, `group_id`, `unit_id`, `sub_unit_id`, `sales_price`, `purchase_price`, `main_rate`, `bill_rate`, `cash_rate`, `agent_rate`, `image`, `barcode`, `created_at`, `updated_at`, `user_id`, `updated_by`, `qty`, `pieces`, `min_stock_alert`, `color`, `groups`, `parcel_code`, `open_box`, `open_pieces`, `open_price`, `other_pid`, `other_pidn`, `other_pidnn`, `other_pidnnn`, `category_id`, `sub_category_id`, `hsn_code`) VALUES
(229, '14X14 L SS 3 FT UB', NULL, 6, 6, NULL, 0, 0, 0, 0, 0, NULL, '25936481', '2023-04-07 15:35:42', '2023-06-17 13:44:04', 1, NULL, 1, 300, 0, 'None', '14X14 SS', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 3, 31, '76169100'),
(230, '14X14 L SS 3.5 FT UB', NULL, 6, 6, NULL, 0, 0, 0, 0, 0, NULL, '48210973', '2023-04-07 15:36:17', '2023-06-17 13:43:56', 1, NULL, 1, 350, 0, 'None', '14X14 SS', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 3, 31, '76169100'),
(231, '14X14 L SS 3.75 FT UB', NULL, 6, 6, NULL, 0, 0, 0, 0, 0, NULL, '43129576', '2023-04-07 15:36:47', '2023-06-17 13:43:48', 1, NULL, 1, 375, 0, 'None', '14X14 SS', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 3, 31, '76169100'),
(232, '14X14 L SS 4 FT UB', NULL, 6, 6, NULL, 0, 0, 0, 0, 0, NULL, '15827043', '2023-04-07 15:37:24', '2023-06-17 13:43:41', 1, NULL, 1, 400, 0, 'None', '14X14 SS', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 3, 31, '76169100'),
(233, '14X14 L SS 5 FT UB', NULL, 6, 6, NULL, 0, 0, 0, 0, 0, NULL, '27436015', '2023-04-07 15:37:53', '2023-06-17 13:43:34', 1, NULL, 1, 500, 0, 'None', '14X14 SS', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 3, 31, '76169100'),
(234, 'SILICONE SEALANTS UB', NULL, 5, 2, NULL, 0, 0, 0, 0, 0, NULL, '91740638', '2023-04-07 15:51:20', '2023-06-17 13:43:23', 1, NULL, 1, 24, 0, 'None', 'None', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 2, 35, '35061000'),
(235, 'VCAN S 14X14  SS 2FT', NULL, 6, 6, NULL, 0, 0, 0, 0, 0, NULL, '98621573', '2023-05-22 16:32:07', '2023-06-17 13:43:11', 1, NULL, 1, 200, 0, 'None', '14X14 SS', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 3, 19, '76169100'),
(236, 'VCAN S 14X14 SS 2.5FT', NULL, 6, 6, NULL, 0, 0, 0, 0, 0, NULL, '08539612', '2023-05-22 16:32:46', '2023-06-17 13:43:02', 1, NULL, 1, 250, 0, 'None', '14X14 SS', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 3, 19, '76169100'),
(237, 'VCAN S 14X14  SS 3FT', NULL, 6, 6, NULL, 0, 0, 0, 0, 0, NULL, '74309816', '2023-05-22 16:33:35', '2023-06-17 13:42:54', 1, NULL, 1, 300, 0, 'None', '14X14 SS', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 3, 19, '76169100'),
(238, 'VCAN S 14X14  SS 3.5FT', NULL, 6, 6, NULL, 0, 0, 0, 0, 0, NULL, '96058471', '2023-05-22 16:34:09', '2023-06-17 13:42:45', 1, NULL, 1, 350, 0, 'None', '14X14 SS', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 3, 19, '76169100'),
(239, 'VCAN S 14X14  SS 3.75FT', NULL, 6, 6, NULL, 0, 0, 0, 0, 0, NULL, '57093184', '2023-05-22 16:34:44', '2023-06-17 13:42:36', 1, NULL, 1, 375, 0, 'None', '14X14 SS', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 3, 19, '76169100'),
(240, 'VCAN S 14X14  SS 4FT', NULL, 6, 6, NULL, 0, 0, 0, 0, 0, NULL, '57604981', '2023-05-22 16:35:30', '2023-06-17 13:42:26', 1, NULL, 1, 400, 0, 'None', '14X14 SS', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 3, 19, '76169100'),
(241, 'VCAN S 14X14  SS 5FT', NULL, 6, 6, NULL, 0, 0, 0, 0, 0, NULL, '20586793', '2023-05-22 16:36:11', '2023-06-17 13:42:17', 1, NULL, 1, 500, 0, 'None', '14X14 SS', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 3, 19, '76169100'),
(242, 'EMPIRE WOOLPILE BLK (M)', NULL, 5, 7, NULL, 0, 0, 0, 0, 0, NULL, '30467125', '2023-05-29 18:02:24', '2023-06-17 13:41:40', 1, NULL, 1, 8, 0, 'None', 'WOOLPILE BLACK', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 5, 33, '59119090'),
(243, 'EMPIRE WOOLPILE GREY (M)', NULL, 5, 7, NULL, 0, 0, 0, 0, 0, NULL, '16078534', '2023-05-29 18:03:09', '2023-06-17 13:41:18', 1, NULL, 1, 8, 0, 'None', 'WOOLPILE GREY', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 5, 33, '59119090'),
(244, 'VCAN M 304(A) SS 3\"', NULL, 6, 6, NULL, 0, 0, 0, 0, 0, NULL, '31946752', '2023-06-02 12:13:49', '2023-06-17 13:39:17', 1, NULL, 1, 300, 0, 'None', '304 SS', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 3, 30, '73141410'),
(245, 'VCAN M 304(A) SS 4\"', NULL, 6, 6, NULL, 0, 0, 0, 0, 0, NULL, '39215687', '2023-06-02 12:15:00', '2023-06-17 13:39:05', 1, NULL, 1, 400, 0, 'None', '304 SS', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 3, 30, '73141410'),
(246, 'VCAN M 304(A) SS 5\"', NULL, 6, 6, NULL, 0, 0, 0, 0, 0, NULL, '21793506', '2023-06-02 12:15:43', '2023-06-17 13:38:53', 1, NULL, 1, 500, 0, 'None', '304 SS', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 3, 30, '73141410'),
(247, 'VCAN M 304(A) BLK 3\"', NULL, 6, 6, NULL, 0, 0, 0, 0, 0, NULL, '24986731', '2023-06-02 12:16:39', '2023-06-17 13:38:41', 1, NULL, 1, 300, 0, 'None', '304 BLK', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 3, 30, '73141410'),
(248, 'VCAN M 304(A) BLK 4\"', NULL, 6, 6, NULL, 0, 0, 0, 0, 0, NULL, '14679058', '2023-06-02 12:17:20', '2023-06-17 13:38:15', 1, NULL, 1, 400, 0, 'None', '304 BLK', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 3, 30, '73141410'),
(249, 'VCAN M 304(A) BLK 5\"', NULL, 6, 6, NULL, 0, 0, 0, 0, 0, NULL, '37820459', '2023-06-02 12:18:25', '2023-06-17 13:38:05', 1, NULL, 1, 500, 0, 'None', '304 BLK', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 3, 30, '73141410'),
(250, 'KEINGS PVC 12X12 3 FT', NULL, 6, 7, NULL, 0, 0, 0, 0, 0, NULL, '23709451', '2023-06-03 11:55:42', '2023-06-17 13:37:52', 1, NULL, 1, 1, 0, 'None', 'PVC-FIBER', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 3, 36, '73141490'),
(251, 'KEINGS PVC 12X12 4 FT', NULL, 6, 7, NULL, 0, 0, 0, 0, 0, NULL, '24376108', '2023-06-03 11:57:33', '2023-06-17 13:37:42', 1, NULL, 1, 1, 0, 'None', 'PVC-FIBER', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 3, 36, '73141490'),
(252, 'KEINGS PVC 12X12 5 FT', NULL, 6, 7, NULL, 0, 0, 0, 0, 0, NULL, '42561908', '2023-06-03 11:59:23', '2023-06-17 13:37:33', 1, NULL, 1, 1, 0, 'None', 'PVC-FIBER', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 3, 36, '73141490'),
(253, 'KEINGS FIBER 18X16 3FT BLK', NULL, 6, 6, NULL, 0, 0, 0, 0, 0, NULL, '02759361', '2023-06-03 12:33:37', '2023-07-20 14:28:14', 1, NULL, 1, 1, 0, 'None', 'PVC-FIBER', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 3, 36, '73141490'),
(254, 'KEINGS FIBER 18X16 4 FT BLK', NULL, 6, 6, NULL, 0, 0, 0, 0, 0, NULL, '10893642', '2023-06-03 12:34:51', '2023-07-20 14:28:05', 1, NULL, 1, 1, 0, 'None', 'PVC-FIBER', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 3, 36, '73141490'),
(255, '14X14 BLK 2 FT UB', NULL, 6, 6, NULL, 0, 0, 0, 0, 0, NULL, '40216359', '2023-06-03 12:56:53', '2023-06-17 13:33:17', 1, NULL, 1, 200, 0, 'None', '14X14 BLK', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 3, 31, '76169100'),
(256, '14X14 BLK 2.5 FT UB', NULL, 6, 6, NULL, 0, 0, 0, 0, 0, NULL, '58197302', '2023-06-03 12:57:38', '2023-06-17 13:33:08', 1, NULL, 1, 250, 0, 'None', '14X14 BLK', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 3, 31, '76169100'),
(257, '14X14 BLK 3 FT UB', NULL, 6, 6, NULL, 0, 0, 0, 0, 0, NULL, '74108536', '2023-06-03 12:58:34', '2023-06-17 13:32:59', 1, NULL, 1, 300, 0, 'None', '14X14 BLK', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 3, 31, '76169100'),
(258, '14X14 BLK 3.75 FT UB', NULL, 6, 6, NULL, 0, 0, 0, 0, 0, NULL, '75246301', '2023-06-03 12:59:19', '2023-06-17 13:32:45', 1, NULL, 1, 375, 0, 'None', '14X14 BLK', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 3, 31, '76169100'),
(259, '14X14 BLK 4 FT UB', NULL, 6, 6, NULL, 0, 0, 0, 0, 0, NULL, '13870296', '2023-06-03 12:59:48', '2023-06-17 13:32:35', 1, NULL, 1, 400, 0, 'None', '14X14 BLK', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 3, 31, '76169100'),
(260, '14X14 BLK 5 FT UB', NULL, 6, 6, NULL, 0, 0, 0, 0, 0, NULL, '62175930', '2023-06-03 13:00:28', '2023-06-17 13:32:26', 1, NULL, 1, 500, 0, 'None', '14X14 BLK', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 3, 31, '76169100'),
(261, '18x16 BRT 3.5 FT', NULL, 6, 6, NULL, 0, 0, 0, 0, 0, NULL, '82610479', '2023-06-07 17:12:41', '2023-06-17 13:32:16', 1, NULL, 1, 350, 0, 'None', 'None', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 3, 31, '76169100'),
(262, '18X16 BRT 3.75 FT', NULL, 6, 6, NULL, 0, 0, 0, 0, 0, NULL, '51786403', '2023-06-07 17:13:19', '2023-06-17 13:32:07', 1, NULL, 1, 375, 0, 'None', 'None', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 3, 31, '76169100'),
(263, 'KEINGS WN 777 BLACK', NULL, 5, 3, NULL, 0, 0, 0, 0, 0, NULL, '69345178', '2023-06-10 18:13:31', '2023-06-17 13:31:55', 1, NULL, 1, 24, 0, 'None', '789 BLACK', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 2, 2, '35061000'),
(264, 'KEINGS WN 777 CLEAR', NULL, 5, 3, NULL, 0, 0, 0, 0, 0, NULL, '01853467', '2023-06-10 18:14:22', '2023-06-17 13:31:46', 1, NULL, 1, 24, 0, 'None', '789 CLEAR', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 2, 2, '35061000'),
(265, 'KEINGS WN 777 BROWN', NULL, 5, 3, NULL, 0, 0, 0, 0, 0, NULL, '90258643', '2023-06-10 18:15:57', '2023-06-17 13:31:17', 1, NULL, 1, 24, 0, 'None', 'None', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 2, 2, '35061000'),
(266, 'V-BOND ACRYLIC WHITE', NULL, 5, 3, NULL, 0, 0, 0, 0, 0, NULL, '16405327', '2023-06-10 18:17:27', '2023-06-17 13:31:05', 1, NULL, 1, 24, 0, 'None', '789 WHITE', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 2, 12, '35061000'),
(267, '18X16 SS 4FT UB', NULL, 6, 6, NULL, 0, 0, 0, 0, 0, NULL, '48137629', '2023-06-16 13:59:00', '2023-07-04 13:15:44', 1, NULL, 1, 400, 0, 'None', '18X16 SS', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 3, 31, '76169100'),
(268, '18X16 SS 5FT UB', NULL, 6, 6, NULL, 0, 0, 0, 0, 0, NULL, '60248793', '2023-06-16 13:59:47', '2023-07-04 13:16:36', 1, NULL, 1, 500, 0, 'None', '18X16 SS', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 3, 31, '76169100'),
(269, 'FSTAY UB-20\"', NULL, 5, 1, NULL, 0, 0, 0, 0, 0, NULL, '48973152', '2023-06-17 17:41:51', '2023-06-17 17:44:28', 1, NULL, 1, 50, 0, 'None', 'None', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 4, 34, ''),
(270, 'FSTAY UB-24\"', NULL, 5, 1, NULL, 0, 0, 0, 0, 0, NULL, '13682497', '2023-06-17 17:44:51', '0000-00-00 00:00:00', 1, NULL, 1, 50, 0, 'None', 'None', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 4, 34, ''),
(271, 'SILICONE GUN (30 PC)', NULL, 5, 2, NULL, 0, 0, 0, 0, 0, NULL, '26304589', '2023-06-22 13:13:23', '0000-00-00 00:00:00', 1, NULL, 1, 30, 0, 'None', 'None', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 2, 35, ''),
(272, 'KINGLOCK', NULL, 5, 2, NULL, 0, 0, 0, 0, 0, NULL, '10635927', '2023-06-23 13:09:21', '0000-00-00 00:00:00', 1, NULL, 1, 70, 0, 'None', 'None', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 9, 32, ''),
(273, '18X16 SS 304 3FT', NULL, 6, 6, NULL, 0, 0, 0, 0, 0, NULL, '64785910', '2023-06-30 14:40:10', '0000-00-00 00:00:00', 1, NULL, 1, 300, 0, 'None', '304 SS', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 3, 31, ''),
(274, '18X16 SS 304 4FT', NULL, 6, 6, NULL, 0, 0, 0, 0, 0, NULL, '31086274', '2023-06-30 14:40:51', '0000-00-00 00:00:00', 1, NULL, 1, 400, 0, 'None', '304 SS', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 3, 31, ''),
(275, '18X16 SS 304 5FT', NULL, 6, 6, NULL, 0, 0, 0, 0, 0, NULL, '08374215', '2023-06-30 14:41:19', '0000-00-00 00:00:00', 1, NULL, 1, 500, 0, 'None', '304 SS', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 3, 31, ''),
(276, '18X16 BLK 304 3FT', NULL, 6, 6, NULL, 0, 0, 0, 0, 0, NULL, '08351426', '2023-06-30 14:51:39', '0000-00-00 00:00:00', 1, NULL, 1, 300, 0, 'None', '304 BLK', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 3, 31, ''),
(277, '18X16 BLK 304 4FT', NULL, 6, 6, NULL, 0, 0, 0, 0, 0, NULL, '36071594', '2023-06-30 14:52:11', '0000-00-00 00:00:00', 1, NULL, 1, 400, 0, 'None', '304 BLK', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 3, 31, ''),
(278, '18X16 BLK 304 5FT', NULL, 6, 6, NULL, 0, 0, 0, 0, 0, NULL, '19065742', '2023-06-30 14:52:44', '0000-00-00 00:00:00', 1, NULL, 1, 500, 0, 'None', '304 BLK', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 3, 31, ''),
(279, '18X16 SS 3.5FT UB', NULL, 6, 6, NULL, 0, 0, 0, 0, 0, NULL, '89364572', '2023-07-04 13:07:27', '0000-00-00 00:00:00', 1, NULL, 1, 350, 0, 'None', '18X16 SS', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 3, 31, ''),
(280, 'EMPIRE S 14X14 BLK 2.5\"', NULL, 6, 6, NULL, 0, 0, 0, 0, 0, NULL, '10768435', '2023-07-07 18:36:02', '0000-00-00 00:00:00', 1, NULL, 1, 250, 0, 'None', '14X14 BLK', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 3, 17, ''),
(281, 'EMPIRE S 14X14 BLK 3\"', NULL, 6, 6, NULL, 0, 0, 0, 0, 0, NULL, '23407895', '2023-07-07 18:36:57', '0000-00-00 00:00:00', 1, NULL, 1, 300, 0, 'None', '14X14 BLK', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 3, 17, ''),
(282, 'BEARING 625 PREMIUM', NULL, 5, 2, NULL, 0, 0, 0, 0, 0, NULL, '29361540', '2023-07-26 15:31:40', '0000-00-00 00:00:00', 1, NULL, 1, 5000, 0, 'None', 'None', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 6, 27, ''),
(283, 'BEARING 626 PREMIUM', NULL, 5, 2, NULL, 0, 0, 0, 0, 0, NULL, '85470231', '2023-07-26 15:32:08', '0000-00-00 00:00:00', 1, NULL, 1, 3000, 0, 'None', 'None', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 6, 27, ''),
(284, 'BEARING 608 PREMIUM', NULL, 5, 2, NULL, 0, 0, 0, 0, 0, NULL, '65430298', '2023-07-26 15:32:37', '0000-00-00 00:00:00', 1, NULL, 1, 2000, 0, 'None', 'None', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 6, 27, ''),
(285, 'BEARING 695 PREMIUM', NULL, 5, 2, NULL, 0, 0, 0, 0, 0, NULL, '84512397', '2023-07-26 15:38:07', '0000-00-00 00:00:00', 1, NULL, 1, 10000, 0, 'None', 'None', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 6, 27, ''),
(286, 'CROWN 789 BLACK', NULL, 5, 3, NULL, 0, 0, 0, 0, 0, NULL, '69085731', '2023-07-28 11:58:50', '0000-00-00 00:00:00', 1, NULL, 1, 24, 0, 'None', '789 BLACK', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 2, 35, ''),
(287, 'CROWN 789 WHITE', NULL, 5, 3, NULL, 0, 0, 0, 0, 0, NULL, '32756984', '2023-07-28 12:00:19', '0000-00-00 00:00:00', 1, NULL, 1, 24, 0, 'None', '789 WHITE', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 2, 35, ''),
(288, 'CROWN 789 CLEAR', NULL, 5, 3, NULL, 0, 0, 0, 0, 0, NULL, '18249367', '2023-07-28 12:03:04', '0000-00-00 00:00:00', 1, NULL, 1, 24, 0, 'None', '789 CLEAR', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 2, 35, ''),
(289, '14X14 BRT 3FT UB', NULL, 6, 6, NULL, 0, 0, 0, 0, 0, NULL, '86302951', '2023-08-04 13:33:49', '0000-00-00 00:00:00', 1, NULL, 1, 300, 0, 'None', 'None', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 3, 31, ''),
(290, '14X14 BRT 4FT UB', NULL, 6, 6, NULL, 0, 0, 0, 0, 0, NULL, '92457103', '2023-08-04 13:34:26', '0000-00-00 00:00:00', 1, NULL, 1, 400, 0, 'None', 'None', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 3, 31, ''),
(291, '18X16 BLK 3FT UB', NULL, 6, 6, NULL, 0, 0, 0, 0, 0, NULL, '12437698', '2023-08-04 13:35:57', '0000-00-00 00:00:00', 1, NULL, 1, 300, 0, 'None', '18X16 BLK', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 3, 31, ''),
(292, '18X16 BLK 4FT UB', NULL, 6, 6, NULL, 0, 0, 0, 0, 0, NULL, '03681459', '2023-08-04 13:37:14', '0000-00-00 00:00:00', 1, NULL, 1, 400, 0, 'None', 'None', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 3, 31, ''),
(293, '18X16 BLK 5FT UB', NULL, 6, 6, NULL, 0, 0, 0, 0, 0, NULL, '59172803', '2023-08-04 13:37:43', '0000-00-00 00:00:00', 1, NULL, 1, 500, 0, 'None', '18X16 BLK', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 3, 31, ''),
(294, '626 BLACK TO PINK', NULL, 8, 2, NULL, 0, 0, 0, 0, 0, NULL, '10895327', '2023-08-07 00:26:50', '0000-00-00 00:00:00', 1, NULL, 1, 3000, 0, 'None', 'None', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 6, 27, ''),
(295, 'VCAN 14X14 SS 2FT - 30 MTR', NULL, 6, 6, NULL, 0, 0, 0, 0, 0, NULL, '78249153', '2023-08-08 12:00:04', '2023-08-10 14:07:32', 1, NULL, 1, 200, 0, 'None', '14X14 SS', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 3, 19, ''),
(296, 'VCAN 14X14 SS 2.5FT - 30 MTR', NULL, 6, 6, NULL, 0, 0, 0, 0, 0, NULL, '35981270', '2023-08-08 15:49:51', '2023-08-10 14:07:54', 1, NULL, 1, 250, 0, 'None', '14X14 SS', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 3, 19, ''),
(297, 'VCAN 14X14 SS 3FT - 30 MTR', NULL, 6, 6, NULL, 0, 0, 0, 0, 0, NULL, '48739126', '2023-08-08 15:50:22', '2023-08-10 14:08:14', 1, NULL, 1, 300, 0, 'None', '14X14 SS', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 3, 19, ''),
(298, 'VCAN 14X14 SS 3.5FT - 30 MTR', NULL, 6, 6, NULL, 0, 0, 0, 0, 0, NULL, '65721089', '2023-08-08 15:51:00', '2023-08-10 14:08:27', 1, NULL, 1, 350, 0, 'None', '14X14 SS', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 3, 21, ''),
(299, 'VCAN 14X14 SS 3.75FT - 30 MTR', NULL, 6, 6, NULL, 0, 0, 0, 0, 0, NULL, '90258314', '2023-08-08 15:51:57', '2023-08-10 14:08:38', 1, NULL, 1, 375, 0, 'None', '14X14 SS', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 3, 21, ''),
(300, 'VCAN 14X14 SS 4FT - 30 MTR', NULL, 6, 6, NULL, 0, 0, 0, 0, 0, NULL, '29103847', '2023-08-08 15:52:35', '2023-08-10 14:08:51', 1, NULL, 1, 400, 0, 'None', '14X14 SS', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 3, 19, ''),
(301, 'VCAN 14X14 SS 5FT - 30 MTR', NULL, 6, 6, NULL, 0, 0, 0, 0, 0, NULL, '54219786', '2023-08-08 15:53:02', '2023-08-10 14:09:02', 1, NULL, 1, 500, 0, 'None', '14X14 SS', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 3, 19, ''),
(302, 'VCAN 14X14 SS 4.5FT - 30 MTR', NULL, 6, 6, NULL, 0, 0, 0, 0, 0, NULL, '61245089', '2023-08-08 16:12:14', '2023-08-10 14:09:17', 1, NULL, 1, 450, 0, 'None', '14X14 SS', NULL, 0, 0, 0, NULL, NULL, NULL, NULL, 3, 19, ''),
(305, 'hetvi', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2023-10-07 17:07:20', '2023-10-07 17:32:52', 11, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 27, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sub_category`
--

CREATE TABLE `sub_category` (
  `id` int(11) NOT NULL,
  `name` varchar(555) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `client_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `status` varchar(255) DEFAULT 'show'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `sub_category`
--

INSERT INTO `sub_category` (`id`, `name`, `category_id`, `created_at`, `updated_at`, `client_id`, `user_id`, `updated_by`, `status`) VALUES
(1, 'sub cat1', 1, '2022-09-01 21:58:38', NULL, NULL, 1, NULL, 'show'),
(2, 'KEINGS SILICONE SEALANTS', 2, '2022-09-04 17:56:20', NULL, NULL, 1, NULL, 'show'),
(3, 'KEINGS ALUMINIUM WIRE MESH 14X14', 3, '2022-09-04 18:22:20', '2022-09-18 16:10:52', NULL, 1, NULL, 'show'),
(4, 'BENZZ SILICONE SEALANTS', 2, '2022-09-18 15:59:01', NULL, NULL, 1, NULL, 'show'),
(5, 'BESTON SILICONE SEALANTS', 2, '2022-09-18 15:59:36', NULL, NULL, 1, NULL, 'show'),
(6, 'EZZE SILICONE SEALANTS', 2, '2022-09-18 16:00:00', NULL, NULL, 1, NULL, 'show'),
(7, 'CUBEX SILICONE SEALANTS', 2, '2022-09-18 16:00:21', NULL, NULL, 1, NULL, 'show'),
(8, 'EMPIRE SILICONE SEALANTS', 2, '2022-09-18 16:00:39', NULL, NULL, 1, NULL, 'show'),
(9, 'KORESEAL SILICONE SEALANTS', 2, '2022-09-18 16:02:28', NULL, NULL, 1, NULL, 'show'),
(10, 'LEZONATE SILICONE SEALANTS', 2, '2022-09-18 16:02:48', NULL, NULL, 1, NULL, 'show'),
(11, 'V-CAN SILICONE SEALANTS', 2, '2022-09-18 16:03:17', NULL, NULL, 1, NULL, 'show'),
(12, 'V-BOND SILICONE SEALANTS', 2, '2022-09-18 16:03:34', NULL, NULL, 1, NULL, 'show'),
(13, 'VELFIT SILICONE SEALANTS', 2, '2022-09-18 16:03:57', NULL, NULL, 1, NULL, 'show'),
(14, 'KEINGS STAINLESS STEEL WIRE MESH', 3, '2022-09-18 16:06:26', NULL, NULL, 1, NULL, 'show'),
(15, 'CUBEX ALUMINIUM WIRE MESH', 3, '2022-09-18 16:07:40', NULL, NULL, 1, NULL, 'show'),
(16, 'KEINGS ALUMINIUM WIRE MESH 18X16', 3, '2022-09-18 16:11:49', NULL, NULL, 1, NULL, 'show'),
(17, 'EMPIRE ALUMINIUM WIRE MESH 14X14', 3, '2022-09-18 16:12:50', NULL, NULL, 1, NULL, 'show'),
(18, 'EMPIRE ALUMINIUM WIRE MESH 18X16', 3, '2022-09-18 16:13:02', NULL, NULL, 1, NULL, 'show'),
(19, 'VCAN ALUMINIUM WIRE MESH 14X14', 3, '2022-09-18 16:13:39', NULL, NULL, 1, NULL, 'show'),
(20, 'VCAN ALUMINIUM WIRE MESH 18X16', 3, '2022-09-18 16:14:03', NULL, NULL, 1, NULL, 'show'),
(21, 'VALUE ALUMINIUM WIRE MESH 14X14', 3, '2022-09-18 16:15:07', NULL, NULL, 1, NULL, 'show'),
(22, 'CUBEX DOOR CLOSER', 7, '2022-09-18 16:16:31', NULL, NULL, 1, NULL, 'show'),
(23, 'KEINGS FRICTION STAY', 4, '2022-09-18 16:17:17', NULL, NULL, 1, NULL, 'show'),
(24, 'VELFIT FRICTION STAY', 4, '2022-09-18 16:17:43', NULL, NULL, 1, NULL, 'show'),
(25, 'KEINGS WOOLPILE', 5, '2022-09-18 16:19:28', NULL, NULL, 1, NULL, 'show'),
(26, 'KEINGS DOMAL LOCK', 8, '2022-09-18 16:20:18', NULL, NULL, 1, NULL, 'show'),
(27, 'KEINGS BEARING', 6, '2022-09-18 16:20:46', NULL, NULL, 1, NULL, 'show'),
(28, 'CYCLONE ALUMINIUM WIRE MESH 14X14', 3, '2022-09-18 16:21:41', NULL, NULL, 1, NULL, 'show'),
(29, 'CYCLONE ALUMINIUM WIRE MESH 18X16', 3, '2022-09-18 16:22:13', NULL, NULL, 1, NULL, 'show'),
(30, 'VCAN STAINLESS STEEL WIRE MESH', 3, '2022-09-19 17:00:25', NULL, NULL, 1, NULL, 'show'),
(31, 'UNBRANDED WIRE MESH', 3, '2022-11-12 12:40:11', NULL, NULL, 1, NULL, 'show'),
(32, 'UNBRANDED HARDWARE', 9, '2022-11-12 13:59:50', NULL, NULL, 1, NULL, 'show'),
(33, 'FACTORY WOOLPILE', 5, '2022-12-01 12:50:32', NULL, NULL, 1, NULL, 'show'),
(34, 'UNBRANDED FRICTION STAY', 4, '2022-12-31 14:49:03', NULL, NULL, 1, NULL, 'show'),
(35, 'UNBRANDED SILICONE SEALANTS', 2, '2023-04-07 15:50:38', NULL, NULL, 1, NULL, 'show'),
(36, 'KEINGS PVC-FIBER MESH', 3, '2023-06-02 14:55:34', NULL, NULL, 1, NULL, 'show');

-- --------------------------------------------------------

--
-- Table structure for table `uploaded`
--

CREATE TABLE `uploaded` (
  `id` int(11) NOT NULL,
  `booking_id` int(11) NOT NULL,
  `document_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `uploaded`
--

INSERT INTO `uploaded` (`id`, `booking_id`, `document_id`, `name`, `created_at`, `updated_at`) VALUES
(1, 23, 1, 'istockphoto-1337232523-612x612.jpg', '2023-10-20 12:35:41', '2023-10-20 12:48:44'),
(4, 9, 1, 'istockphoto-1337232523-612x612.jpg', '2023-10-20 12:36:22', '2023-10-20 15:32:46'),
(10, 9, 2, 'istockphoto-1337232523-612x612.jpg', '2023-10-20 15:32:26', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `mobile_no` varchar(20) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `mobile_no`, `created_at`, `updated_at`) VALUES
(11, 'hetvi', '12345', '9974089992', '2023-10-06 16:23:52', '2023-10-06 17:28:41'),
(20, 'admin', '12346', '1234567890', '2023-10-06 17:12:49', '2023-10-07 17:17:00'),
(21, 'admin2', '12345', '1234567890', '2023-10-11 13:18:53', '0000-00-00 00:00:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `agent`
--
ALTER TABLE `agent`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `booking_payment`
--
ALTER TABLE `booking_payment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `company`
--
ALTER TABLE `company`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `document`
--
ALTER TABLE `document`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `party`
--
ALTER TABLE `party`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sub_category`
--
ALTER TABLE `sub_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `uploaded`
--
ALTER TABLE `uploaded`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `agent`
--
ALTER TABLE `agent`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `booking`
--
ALTER TABLE `booking`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `booking_payment`
--
ALTER TABLE `booking_payment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `company`
--
ALTER TABLE `company`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `document`
--
ALTER TABLE `document`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `party`
--
ALTER TABLE `party`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=306;

--
-- AUTO_INCREMENT for table `sub_category`
--
ALTER TABLE `sub_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `uploaded`
--
ALTER TABLE `uploaded`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th10 30, 2023 lúc 04:03 PM
-- Phiên bản máy phục vụ: 10.4.28-MariaDB
-- Phiên bản PHP: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `my-shop`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `account`
--

CREATE TABLE `account` (
  `Username` varchar(20) NOT NULL,
  `Password` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Startday` date NOT NULL DEFAULT curdate(),
  `Available` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `account`
--

INSERT INTO `account` (`Username`, `Password`, `Startday`, `Available`) VALUES
('admin', '$argon2id$v=19$m=65536,t=3,p=4$gJmbBxrKkPisdDRYz1XCYQ$Vk7+4z9rDJJJxteIouSHkoc14S4zyR24mgBq3hBJ5jI', '2023-11-20', 0),
('haonhat', '$argon2id$v=19$m=65536,t=3,p=4$vd8SwsM2ht8FLDkQR2Yy3g$/kCWWytQZ4kWuMqsSusL8RIbSSs1Jz758i/S3xGn2cg', '2023-10-14', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `code`
--

CREATE TABLE `code` (
  `id` int(11) NOT NULL AUTO_INCREMENT primary key,
  `code` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `code`
--

INSERT INTO `code` (`id`, `code`) VALUES
(1, '1234567'),
(2, '1234567');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cthd`
--

CREATE TABLE `cthd` (
  `sohd` int(11) NOT NULL,
  `masp` char(4) NOT NULL,
  `sl` int(11) NOT NULL,
  `id_cthd` int(10) NOT NULL AUTO_INCREMENT primary key
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `hoadon` (
  `sohd` int(11) NOT NULL,
  `nghd` date NOT NULL,
  `makh` char(4) NOT NULL,
  `trigia` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------
--
-- Đang đổ dữ liệu cho bảng `cthd`
--
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (3251, '9862', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (5088, '2989', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (5088, '6433', 1);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (5088, 'SP69', 1);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (5088, '3901', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (1164, '4286', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (1164, 'SP69', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (1164, '9022', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (5471, '2769', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (3435, '7492', 1);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (3435, '8114', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (4310, '7492', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (4310, '9803', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (4310, 'SP69', 1);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (5982, '4513', 1);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (5982, '3901', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (5982, '1340', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (8111, '9022', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (8111, '9775', 1);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (8111, '5047', 1);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (8021, '2145', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (8021, '8996', 1);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (8021, '0859', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (3821, '4207', 1);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (3821, '8920', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (3276, '2109', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (1954, '9937', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (1954, '5355', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (8574, '5900', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (8574, '8232', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (8574, '5794', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (8574, '1327', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (6165, '4336', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (6165, 'SP02', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (6165, '7430', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (6165, 'SP69', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (7442, '5711', 1);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (7442, '0127', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (7442, '6433', 1);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (8803, '6433', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (2931, '4207', 1);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (2931, '9298', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (2931, '9803', 1);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (2931, '0722', 1);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (6346, '5794', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (8905, 'SP01', 1);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (8905, '9201', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (8905, '5355', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (8905, '8920', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (4432, '2019', 1);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (2451, '1667', 1);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (2451, '8687', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (2451, '0127', 1);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (2451, '9022', 1);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (9965, '1667', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (9965, '5677', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (3673, '2769', 1);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (3673, '5355', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (5375, '9022', 1);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (5375, '5385', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (5375, '9389', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (5375, '6652', 1);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (2065, '7430', 1);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (2065, '9775', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (2065, '0127', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (2065, '4931', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (8951, 'SP66', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (7240, '7753', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (7240, '8026', 1);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (9510, '5355', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (9510, '2145', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (9993, '2797', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (9993, '9803', 1);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (9993, '1240', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (9993, '8375', 1);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (2138, '9298', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (2138, '4931', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (2138, '9473', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (2138, '5794', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (4748, 'SP66', 1);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (4748, '8843', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (6531, '5711', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (6531, '6433', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (6531, '8687', 1);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (8925, '5900', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (8925, '0722', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (8925, '6433', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (8925, '7430', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (6414, '4931', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (6414, '8450', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (6414, '1240', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (6414, '8843', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (5710, '8843', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (4879, 'SP02', 1);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (4879, '8687', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (2526, '5385', 1);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (3480, '5900', 1);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (3480, '2109', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (6073, '8207', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (1542, '4336', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (6698, '8450', 1);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (6698, '9803', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (6698, '5687', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (3256, '9937', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (3256, '8843', 1);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (3256, '4297', 1);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (3256, '2109', 1);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (3769, '9097', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (3769, '8232', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (3769, '4297', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (9439, '5047', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (9439, '5711', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (1378, '8996', 1);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (1378, '9201', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (1891, '9775', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (4343, '8996', 1);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (4343, '2769', 1);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (4343, '4403', 1);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (4343, '8920', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (3047, '8091', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (3047, '4403', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (3047, '1240', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (4414, '2769', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (5593, '8114', 1);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (5593, '8232', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (3107, '6433', 1);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (2207, '7492', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (2207, '1240', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (3866, '8223', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (3866, '5900', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (3866, '6454', 1);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (3918, '4931', 1);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (3918, '3901', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (3918, '9803', 1);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (3918, '5794', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (8357, '8114', 1);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (8357, '3849', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (8357, '5385', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (8974, '9022', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (2882, '3901', 1);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (1407, '5677', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (1407, '6433', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (1407, '1827', 1);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (1407, '1124', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (4544, '9022', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (4544, '9201', 1);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (7010, '8232', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (7037, '9775', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (7037, '8450', 1);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (7037, '1124', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (1027, '8026', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (1027, '7492', 1);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (1027, '4403', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (1027, '8207', 1);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (9815, '8026', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (9376, '1340', 1);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (9376, '9775', 1);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (9784, '9775', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (9784, '7586', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (9201, '9389', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (9201, '4931', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (9201, '5687', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (9201, '6107', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (9840, '2109', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (5222, '8091', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (5222, '6652', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (5222, '5047', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (3686, '6652', 1);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (3686, '9298', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (3686, '5687', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (4584, '2769', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (4584, '1340', 1);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (4584, '4207', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (4584, '9097', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (6192, '6454', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (7828, '5355', 1);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (7828, '9201', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (4055, '4286', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (4055, '5405', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (4055, 'SP02', 1);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (1011, '1827', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (1011, '9862', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (1011, '2109', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (1011, '1240', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (3822, '9937', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (3822, '8026', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (3822, '9201', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (3858, 'SP01', 1);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (3858, '1340', 1);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (3858, '2109', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (4889, '3162', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (4889, '8091', 1);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (2347, '0573', 1);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (2347, '5794', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (3225, '5900', 1);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (3225, '9298', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (3225, '2769', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (3225, '1327', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (8472, '3849', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (4039, '6944', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (1563, '8843', 1);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (1240, '0304', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (1240, '2019', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (3672, '4513', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (3672, '5711', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (3672, '2989', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (3672, '0859', 1);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (6839, '4286', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (8528, '6934', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (8528, '0722', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (8528, '3849', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (1740, '8232', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (1740, '5687', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (1740, '8364', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (2287, '9473', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (2287, '8450', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (2287, '1827', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (2287, '8114', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (9898, '5687', 1);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (9898, '0573', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (9898, '9862', 1);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (9898, '2989', 1);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (9184, '8207', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (9184, '5794', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (5169, '8207', 1);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (5169, '0304', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (5169, '9201', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (7139, '0573', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (9811, '8375', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (9811, '0304', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (9811, '1327', 1);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (3357, '5687', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (3357, '1827', 1);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (3010, '1340', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (3010, '6944', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (9602, '8207', 1);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (9602, '0573', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (9602, '5355', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (7128, '6454', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (7128, '8026', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (1001, '3162', 1);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (1001, '7586', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (1001, '5677', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (1001, '0799', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (2504, '9389', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (2504, '9862', 1);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (2504, '5677', 1);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (5270, '4403', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (5270, '8232', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (5270, '2797', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (2308, '8223', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (2308, '5385', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (5969, '6944', 1);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (9378, '9389', 1);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (8972, '0799', 1);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (8972, '7753', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (1191, '5677', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (1191, '2145', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (7766, '5385', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (8767, '2019', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (8767, '5355', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (8747, '6454', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (8747, '7492', 1);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (8747, '9022', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (6391, 'SP69', 1);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (6422, '8232', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (6422, '0127', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (6422, '2989', 1);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (6422, '4513', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (9495, '8450', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (5931, '2019', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (5931, '7586', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (4025, '2769', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (4025, '8223', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (4025, '2019', 1);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (4025, '8114', 1);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (7910, 'SP01', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (7910, '1612', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (7168, '8207', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (7168, '1340', 1);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (8066, '1327', 1);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (8066, '0127', 1);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (8066, '8920', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (7740, '7430', 1);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (7740, '0722', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (7740, '6934', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (6604, '1667', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (6604, '0304', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (9511, '9775', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (9648, '8375', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (9084, '2109', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (6054, '6944', 1);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (6054, '4207', 1);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (6054, '1827', 1);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (9494, '7586', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (6520, '9473', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (6520, '0304', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (5834, '8920', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (5834, '8364', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (5834, '5385', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (5834, '8687', 1);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (9923, '9097', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (9923, '1340', 1);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (7312, '1124', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (7312, 'SP69', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (7436, '5405', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (7436, '9097', 1);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (4538, '9803', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (1159, '1327', 1);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (1159, '4403', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (4707, '9097', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (1941, '5687', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (1941, '8375', 1);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (1941, '8920', 1);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (2917, '6934', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (7480, '4513', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (7480, '8450', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (7480, '8996', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (6389, '9473', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (6389, '5405', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (6389, '8843', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (1277, '0573', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (5735, '4286', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (2128, '7430', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (2128, '1327', 1);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (2128, 'SP66', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (2128, '7753', 1);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (1904, '0573', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (1904, '6652', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (1904, '7753', 1);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (1904, '1327', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (8903, '2019', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (9550, 'SP02', 1);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (9550, '5355', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (9550, '7753', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (9550, '4403', 1);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (8506, '0859', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (8506, '5405', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (8506, '4336', 1);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (3624, '8026', 1);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (3624, '1612', 1);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (8151, '6652', 1);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (8151, '8026', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (1516, '1612', 1);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (1516, '2145', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (1516, '0722', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (1516, '0859', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (6517, '1327', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (6517, '3849', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (1134, '5385', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (6408, '4297', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (6408, '1827', 1);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (6002, '5711', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (6002, '7753', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (6002, '8232', 1);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (6862, '3162', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (6862, '8026', 1);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (6862, '0722', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (6882, '9298', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (6882, '5047', 1);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (9486, '3849', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (9486, '0304', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (9486, '0722', 1);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (9486, 'SP66', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (5006, '8687', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (5006, '8996', 1);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (5006, '4931', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (5006, '8920', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (5845, '8920', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (1543, '8920', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (1543, '8375', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (1543, '8364', 1);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (1543, '9298', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (1846, '1240', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (1846, 'SP02', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (1846, '9298', 1);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (1846, '8114', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (9812, '6107', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (9812, '8375', 1);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (2664, '0859', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (2664, '0127', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (7250, '5677', 1);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (7250, '7753', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (7250, '5789', 1);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (7250, '8091', 1);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (3996, '8920', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (3996, '5794', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (1789, '8450', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (1789, '1124', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (1789, '9097', 1);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (1440, '8687', 1);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (1440, '2989', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (1440, '4211', 1);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (1440, '0127', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (2625, '1327', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (2625, '9862', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (2625, 'SP69', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (6492, '8232', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (6492, '9389', 1);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (6492, '8450', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (1169, '3162', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (1169, '2019', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (1169, '8450', 1);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (1169, '5385', 1);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (7094, '0573', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (7094, '3901', 1);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (5076, '9775', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (5076, '8207', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (1868, '2109', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (1868, '1327', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (1868, '0799', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (1868, '2797', 1);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (4741, '7430', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (9732, '2797', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (7311, '9473', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (8997, '1667', 1);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (8997, '3849', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (3289, '1327', 1);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (3289, '2109', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (1802, '5711', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (8213, '8232', 1);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (8213, '0859', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (8213, '3849', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (3911, '9473', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (1070, '8364', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (1070, '1240', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (3259, '8843', 1);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (1262, '2109', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (1262, '9937', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (1262, '5385', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (5371, '9775', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (5371, '5711', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (5371, '8364', 1);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (6125, 'SP02', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (6125, '5789', 1);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (4988, '7430', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (4988, '8026', 1);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (4988, '8207', 1);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (4988, '8843', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (9910, '1340', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (2469, '9298', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (2469, '5789', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (9072, '1327', 1);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (9751, 'SP66', 1);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (4812, '1667', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (4812, '2109', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (4812, '4403', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (9716, '5789', 1);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (9716, '6454', 1);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (9716, '5687', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (9716, '9389', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (1823, '8375', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (1823, '5711', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (1823, '7586', 1);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (1823, '8450', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (6650, 'SP66', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (6650, '9298', 1);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (7239, '9775', 1);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (5168, '3901', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (1527, '8114', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (1527, '8364', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (8457, '4403', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (8457, '4286', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (5229, '9022', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (5229, '2019', 1);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (6013, '8996', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (4991, '9937', 1);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (1292, '6934', 1);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (8029, '0859', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (8029, '9022', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (8029, '9775', 1);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (6553, '5047', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (6553, '7753', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (6553, '4403', 1);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (1577, '3162', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (9816, '1240', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (2689, '0859', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (2490, '0573', 1);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (2490, '6202', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (7906, '5794', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (7906, '5677', 1);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (7906, '6944', 1);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (2978, '2989', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (2978, '6202', 1);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (2104, '8207', 1);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (2104, '0573', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (2104, '5794', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (2104, '2989', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (8464, '1612', 1);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (8464, '5355', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (8464, '5900', 1);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (8464, '2145', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (3003, '6202', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (3003, '3901', 1);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (3003, '1240', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (5555, '7430', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (5555, '5900', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (5853, '6433', 1);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (5853, '0859', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (5853, '1340', 1);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (5853, '4336', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (5911, '4336', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (5911, 'SP02', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (5911, '3849', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (5911, '4286', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (5858, '3901', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (5858, 'SP01', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (3884, 'SP69', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (5307, '8996', 1);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (5307, '4336', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (5307, '8687', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (5307, '6454', 1);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (7044, 'SP02', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (7044, '8232', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (7044, '8687', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (3056, '8996', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (3056, '9937', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (3056, '0573', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (3056, '1124', 1);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (4155, '8223', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (4155, '9389', 1);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (4155, '4286', 1);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (5629, '6454', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (5629, '4286', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (5629, '9775', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (5072, '8223', 1);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (5072, '7492', 1);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (5343, '9803', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (5343, '5789', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (5343, '9862', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (5343, '8114', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (4994, '4207', 1);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (4994, '8920', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (5435, '0799', 1);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (5435, '2989', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (5067, '6944', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (5067, '7753', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (5067, '0304', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (2860, '0722', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (4507, '6107', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (4507, '8114', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (4507, '9022', 1);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (7858, '8091', 1);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (7858, '4513', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (8965, '0127', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (8965, '8026', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (8965, '2797', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (8965, '0859', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (9141, '4931', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (9141, '4211', 1);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (9141, '7492', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (1137, '2797', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (1137, '7753', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (1137, '5900', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (1137, '2019', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (7711, '4297', 1);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (3191, '2109', 1);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (3191, '5047', 1);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (3910, '7586', 1);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (3910, '9298', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (3910, '1667', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (1984, '8450', 1);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (1529, '4513', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (1529, '1240', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (1529, '8091', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (9124, '1612', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (9124, '2769', 1);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (9124, 'SP69', 1);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (1372, '5789', 1);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (7481, '9775', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (7481, '4211', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (5401, '0799', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (5401, '6454', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (5401, '8207', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (5401, '8920', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (8264, '8091', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (8264, '8375', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (8264, '0573', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (4312, '1827', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (4312, '4931', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (5035, 'SP69', 1);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (5035, 'SP01', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (5035, 'SP66', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (6459, '2109', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (7297, '8450', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (7297, '9298', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (7297, '8996', 1);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (7297, '6433', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (6481, 'SP01', 1);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (3135, '1827', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (6600, '8114', 1);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (6600, '5405', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (6600, '0722', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (6600, '9775', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (4110, '5385', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (4110, '1667', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (4110, '7492', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (4110, '9298', 1);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (1314, '8996', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (7786, '5711', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (7786, '1240', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (7786, '4211', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (4745, '5789', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (6448, '9803', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (9218, 'SP02', 1);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (4510, '5355', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (3523, '0304', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (3523, '8375', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (6770, 'SP01', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (4598, '5900', 1);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (4598, '5711', 1);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (4574, '3901', 1);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (4574, '4513', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (4957, '8450', 1);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (4957, '9775', 1);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (4957, '9298', 1);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (4957, '8114', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (5113, '4403', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (7188, '6107', 1);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (7188, '4211', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (7188, '9097', 1);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (6479, '4931', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (6479, '8364', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (6479, '9775', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (5884, '8375', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (5884, '0127', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (4347, '8996', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (8790, '5385', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (8790, 'SP69', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (8790, '4286', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (8790, '4207', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (1040, '8114', 1);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (8566, '4513', 1);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (8566, '8450', 1);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (8566, '9022', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (8566, '5687', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (4072, '0722', 1);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (4072, '2769', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (3168, '4286', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (3168, '5355', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (3168, 'SP01', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (3168, '8375', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (3258, 'SP02', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (3258, '8114', 1);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (7217, '9473', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (7217, '2145', 1);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (8048, '4513', 1);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (8048, '8843', 1);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (8048, '0127', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (8048, '8026', 1);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (2009, '2109', 1);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (7885, '6454', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (7885, '5794', 1);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (7885, '7586', 1);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (7885, '5687', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (3799, '9803', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (3799, '5789', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (7308, '8223', 1);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (7308, '1340', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (5664, '1612', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (5664, '1667', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (5664, '9097', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (5664, 'SP01', 1);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (9362, '0304', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (9362, '8450', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (9362, '0859', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (9362, 'SP02', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (2324, '4403', 1);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (2324, '9937', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (2324, '7586', 1);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (2324, '5794', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (3857, '4297', 1);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (3857, '7753', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (3857, '5900', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (2980, '7586', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (9536, '5789', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (9536, '5711', 1);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (9536, '1827', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (4968, '3901', 1);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (4968, '8091', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (4562, '4336', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (4562, '6944', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (4562, '6433', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (6166, '8364', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (7708, '0304', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (2301, '6107', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (2301, '5789', 1);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (2301, '5900', 1);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (2301, '2019', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (1937, '7430', 1);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (9963, '5900', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (6068, '7492', 1);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (6068, '5355', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (3997, '2019', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (3997, '0799', 1);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (3997, '4513', 1);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (7700, 'SP01', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (6920, '9201', 1);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (1162, '8114', 1);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (1162, '4336', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (9077, '8364', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (9077, '2109', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (9077, '8207', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (7596, '9803', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (7596, '9775', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (1753, '0722', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (1753, '0304', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (1753, '6107', 1);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (1753, '4211', 3);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (7508, '5687', 1);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (7508, '5711', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (7313, '1827', 1);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (7313, '1340', 1);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (7313, '8375', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (7313, '6202', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (7515, '0722', 2);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (7515, '9022', 1);
INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES (7515, '9862', 3);
--
-- Đang đổ dữ liệu cho bảng `hoadon`
--
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(3251, '2023-06-27', '6452', 57393900);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(5088, '2020-08-20', '3696', 66467600);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(1164, '2020-01-04', '2775', 126917200);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(5471, '2023-08-04', '8378', 75573000);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(3435, '2020-02-09', '5437', 26576900);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(4310, '2019-09-23', '0485', 26061900);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(5982, '2019-01-30', '2855', 45974000);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(8111, '2021-07-04', '4018', 67147700);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(8021, '2021-10-14', '5155', 54176100);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(3821, '2020-01-23', '0598', 45082200);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(3276, '2023-05-22', '5988', 40485000);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(1954, '2022-07-09', '4337', 33027500);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(8574, '2022-09-11', '2526', 195324400);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(6165, '2020-04-22', '1657', 176963600);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(7442, '2022-07-23', '8176', 41615900);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(8803, '2022-03-06', '4141', 65973600);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(2931, '2023-09-30', '0304', 21845700);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(6346, '2022-09-29', '8925', 59970000);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(8905, '2021-06-27', '6413', 88979700);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(4432, '2019-04-12', '1011', 9545900);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(2451, '2019-01-28', '9866', 145654300);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(9965, '2019-12-03', '5954', 23659800);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(3673, '2023-11-11', '0775', 32597000);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(5375, '2021-08-20', '0071', 110432300);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(2065, '2021-02-13', '1142', 42679400);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(8951, '2019-11-28', '8391', 10533600);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(7240, '2019-03-05', '3319', 14208700);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(9510, '2021-03-01', '7637', 30489600);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(9993, '2023-08-03', '2602', 113871000);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(2138, '2022-07-08', '1975', 156134900);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(4748, '2022-08-08', '4493', 16684800);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(6531, '2022-10-07', '6810', 114016000);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(8925, '2023-04-11', '6234', 135177900);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(6414, '2019-03-24', '1226', 96311700);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(5710, '2021-01-24', '5917', 8782400);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(4879, '2019-02-05', '3232', 138892700);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(2526, '2019-08-24', '1837', 16521300);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(3480, '2020-07-04', '1056', 82797900);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(6073, '2023-02-18', '8063', 44183000);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(1542, '2020-04-17', '6666', 134970000);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(6698, '2022-12-22', '7021', 30875800);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(3256, '2021-08-20', '6966', 44708600);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(3769, '2021-07-13', '9523', 21233500);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(9439, '2022-12-24', '4877', 48791800);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(1378, '2022-10-14', '4275', 24105600);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(1891, '2020-12-14', '6139', 11381000);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(4343, '2019-04-19', '4858', 89830800);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(3047, '2020-06-12', '1879', 90852500);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(4414, '2023-07-14', '3270', 75573000);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(5593, '2022-06-23', '9608', 23692600);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(3107, '2021-03-26', '6056', 21991200);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(2207, '2020-01-19', '3317', 64679400);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(3866, '2019-09-16', '9313', 59556600);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(3918, '2023-10-31', '6959', 78831700);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(8357, '2019-05-02', '1162', 129693100);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(8974, '2023-11-14', '9911', 52467200);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(2882, '2021-08-25', '1514', 13401000);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(1407, '2020-01-31', '4681', 95095000);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(4544, '2023-01-25', '7044', 57983700);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(7010, '2020-12-10', '6471', 8441200);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(7037, '2019-11-19', '0715', 47345000);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(1027, '2022-08-27', '9638', 86841100);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(9815, '2019-01-05', '2290', 30006900);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(9376, '2019-08-14', '6798', 13680500);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(9784, '2020-06-12', '9467', 60724200);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(9201, '2021-06-27', '7786', 92456800);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(9840, '2020-04-15', '8015', 60727500);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(5222, '2023-11-18', '3566', 56437800);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(3686, '2023-11-28', '5714', 45136200);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(4584, '2023-05-01', '1180', 95503300);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(6192, '2021-01-02', '8696', 12931200);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(7828, '2019-03-22', '6018', 20252500);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(4055, '2023-11-09', '6397', 122042000);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(1011, '2021-07-06', '5821', 157050000);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(3822, '2021-03-01', '0691', 58120900);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(3858, '2019-11-07', '3362', 67826200);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(4889, '2021-05-28', '9909', 33816400);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(2347, '2020-08-10', '5073', 43070000);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(3225, '2021-04-14', '7657', 135218800);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(8472, '2019-01-13', '3212', 46065600);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(4039, '2021-08-15', '4356', 14056600);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(1563, '2020-02-10', '5968', 4391200);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(1240, '2019-08-25', '0756', 97607700);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(3672, '2019-01-10', '9378', 47431900);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(6839, '2019-06-17', '2560', 77970000);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(8528, '2022-10-01', '7618', 106160100);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(1740, '2022-11-03', '9633', 62960800);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(2287, '2022-03-19', '0377', 106775300);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(9898, '2021-05-24', '4332', 38219300);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(9184, '2022-04-21', '2008', 84163000);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(5169, '2020-10-05', '7321', 102094500);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(7139, '2022-02-15', '2982', 6180000);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(9811, '2021-11-22', '4467', 183530800);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(3357, '2019-02-16', '5261', 36900300);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(3010, '2022-08-01', '1738', 45054900);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(9602, '2023-08-28', '6462', 39380500);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(7128, '2019-07-31', '3965', 38627700);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(1001, '2022-02-10', '5972', 86118300);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(2504, '2021-07-03', '9798', 51970800);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(5270, '2019-05-06', '4019', 86947600);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(2308, '2022-08-02', '1114', 66222000);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(5969, '2021-08-14', '2538', 7028300);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(9378, '2019-01-23', '0850', 8541000);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(8972, '2020-03-03', '7449', 11196400);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(1191, '2020-05-21', '2743', 33813600);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(7766, '2023-05-12', '2927', 49563900);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(8767, '2019-07-19', '3826', 26497800);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(8747, '2019-05-10', '3464', 91836900);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(6391, '2023-03-30', '4197', 7490000);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(6422, '2023-10-25', '6039', 31154400);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(9495, '2023-05-02', '5481', 8620800);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(5931, '2019-07-05', '2095', 57739500);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(4025, '2022-03-13', '4785', 112807800);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(7910, '2019-02-17', '3828', 64041400);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(7168, '2023-03-13', '8498', 52173000);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(8066, '2021-06-13', '2771', 58475400);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(7740, '2020-10-15', '7290', 35729600);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(6604, '2022-06-03', '3304', 55206800);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(9511, '2019-01-29', '0630', 11381000);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(9648, '2022-11-02', '7866', 57980000);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(9084, '2019-06-06', '6635', 40485000);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(6054, '2022-07-18', '3345', 18501200);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(9494, '2020-04-08', '7629', 29101800);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(6520, '2022-06-19', '8563', 128940000);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(5834, '2023-03-05', '0991', 137293500);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(9923, '2019-02-27', '4293', 13705900);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(7312, '2019-12-13', '8239', 36082400);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(7436, '2022-03-21', '0528', 18987300);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(4538, '2021-08-22', '4199', 7539000);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(1159, '2022-06-07', '8234', 57818200);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(4707, '2020-07-27', '1625', 3810600);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(1941, '2020-11-10', '2569', 71519600);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(2917, '2021-03-23', '0052', 15021200);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(7480, '2019-03-12', '3720', 45175500);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(6389, '2020-11-22', '5869', 85834400);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(1277, '2020-07-21', '4301', 9270000);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(5735, '2023-09-05', '4598', 77970000);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(2128, '2023-06-07', '0334', 50761200);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(1904, '2020-05-20', '4216', 118091000);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(8903, '2021-11-20', '2273', 19091800);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(9550, '2022-09-04', '2076', 55819300);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(8506, '2023-07-08', '8605', 88162100);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(3624, '2021-09-22', '1193', 12996200);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(8151, '2019-05-05', '5999', 29016400);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(1516, '2023-09-02', '1518', 59300500);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(6517, '2020-05-19', '2003', 101247200);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(1134, '2021-01-03', '0136', 49563900);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(6408, '2022-05-08', '7144', 17342400);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(6002, '2020-05-18', '0727', 30248800);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(6862, '2022-08-25', '4555', 47794100);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(6882, '2019-03-15', '3641', 16574800);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(9486, '2019-05-01', '0841', 126901300);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(5006, '2022-05-27', '7046', 190038900);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(5845, '2021-08-07', '8671', 41970000);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(1543, '2023-01-08', '9063', 153307200);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(1846, '2020-06-23', '0882', 113923000);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(9812, '2019-07-03', '1965', 48187300);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(2664, '2019-11-15', '4494', 20413200);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(7250, '2022-11-26', '3310', 33089600);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(3996, '2019-12-27', '2784', 67960000);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(1789, '2022-05-06', '1001', 46490100);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(1440, '2020-09-15', '0316', 59189100);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(2625, '2020-11-24', '1460', 115914200);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(6492, '2021-10-20', '7023', 29913400);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(1169, '2019-06-11', '1547', 68028700);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(7094, '2023-04-14', '3392', 22671000);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(5076, '2021-04-22', '9882', 83346000);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(1868, '2022-11-29', '2555', 152972100);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(4741, '2023-04-07', '7698', 7022400);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(9732, '2023-05-03', '4870', 32186000);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(7311, '2019-10-16', '0080', 39980000);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(8997, '2019-07-11', '9777', 73711800);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(3289, '2022-05-21', '2265', 88318300);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(1802, '2021-10-18', '0919', 21821800);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(8213, '2023-04-24', '7037', 61985600);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(3911, '2021-06-16', '1546', 59970000);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(1070, '2023-04-25', '9566', 90103500);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(3259, '2021-04-18', '0765', 4391200);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(1262, '2020-11-29', '1280', 107129900);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(5371, '2022-04-22', '4097', 51883300);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(6125, '2019-03-16', '6292', 67832300);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(4988, '2021-08-03', '0589', 55801000);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(9910, '2019-05-30', '8846', 23970000);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(2469, '2020-05-01', '6532', 49141700);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(9072, '2023-10-23', '1202', 27590800);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(9751, '2021-08-22', '5307', 3511200);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(4812, '2020-03-01', '5845', 100181700);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(9716, '2021-11-10', '3693', 72325300);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(1823, '2021-03-09', '3833', 113884400);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(6650, '2022-02-20', '3901', 14326000);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(7239, '2019-06-12', '1520', 5690500);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(5168, '2020-03-18', '2712', 26802000);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(1527, '2021-08-19', '7788', 61031600);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(8457, '2022-05-24', '6804', 123311100);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(5229, '2019-08-11', '9059', 62013100);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(6013, '2023-10-30', '3892', 15112200);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(4991, '2023-05-08', '1678', 8540500);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(1292, '2020-12-05', '7918', 7510600);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(8029, '2020-04-19', '3293', 75706800);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(6553, '2022-07-28', '0944', 48393300);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(1577, '2022-10-01', '8350', 28105200);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(9816, '2022-04-20', '4320', 51133500);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(2689, '2021-08-22', '1014', 17549100);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(2490, '2022-04-09', '1990', 22116400);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(7906, '2020-11-16', '7547', 74214800);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(2978, '2023-02-09', '9493', 16302800);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(2104, '2020-02-26', '2178', 81525900);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(8464, '2020-02-01', '6166', 65244200);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(3003, '2023-09-09', '8168', 66516400);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(5555, '2022-10-03', '4800', 73233600);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(5853, '2020-12-11', '8340', 176650600);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(5911, '2023-04-07', '4904', 267995600);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(5858, '2023-05-18', '8956', 98256600);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(3884, '2019-10-31', '7922', 14980000);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(5307, '2022-02-07', '4008', 258739200);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(7044, '2021-12-14', '4865', 178544500);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(3056, '2023-06-20', '0319', 57464900);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(4155, '2023-07-20', '9711', 51189100);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(5629, '2019-03-30', '7280', 71981800);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(5072, '2020-09-24', '2466', 10068000);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(5343, '2022-12-06', '1749', 106907100);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(4994, '2021-03-25', '8921', 31092200);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(5435, '2023-10-31', '8578', 13779600);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(5067, '2020-12-23', '8910', 64243000);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(2860, '2022-04-16', '8589', 14529900);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(4507, '2020-08-25', '8719', 78523300);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(7858, '2020-05-23', '9926', 15287200);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(8965, '2021-01-05', '9615', 88455800);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(9141, '2022-10-11', '6174', 45146000);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(1137, '2023-08-15', '3551', 117821200);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(7711, '2019-03-13', '5118', 2993900);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(3191, '2020-04-02', '6777', 29232500);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(3910, '2021-06-22', '8067', 31362500);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(1984, '2023-02-08', '5198', 4310400);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(1529, '2020-02-10', '9901', 72131900);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(9124, '2022-07-03', '2619', 41662700);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(1372, '2019-02-21', '0181', 13852300);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(7481, '2019-08-29', '1343', 26041500);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(5401, '2022-06-24', '9298', 108753800);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(8264, '2021-10-18', '7078', 113373600);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(4312, '2021-12-11', '8608', 35794800);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(5035, '2023-10-26', '6149', 53214800);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(6459, '2019-02-05', '0747', 60727500);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(7297, '2022-10-25', '4879', 72054500);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(6481, '2022-11-29', '0766', 19351200);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(3135, '2019-07-10', '3846', 25082100);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(6600, '2021-04-23', '0980', 54023700);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(4110, '2022-04-18', '6282', 55092400);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(1314, '2021-04-21', '0505', 15112200);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(7786, '2022-01-14', '7872', 61890800);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(4745, '2023-05-26', '2277', 41556900);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(6448, '2020-12-15', '8035', 5026000);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(9218, '2023-05-06', '3739', 26990000);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(4510, '2020-11-03', '6031', 11109000);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(3523, '2020-06-10', '3793', 126950000);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(6770, '2020-05-30', '4118', 58053600);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(4598, '2019-04-29', '2858', 32981300);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(4574, '2022-09-17', '6677', 19785000);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(4957, '2022-05-04', '7413', 46885700);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(5113, '2022-06-14', '7400', 30227400);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(7188, '2020-08-30', '9923', 17274400);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(6479, '2021-06-15', '4549', 78961100);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(5884, '2019-05-22', '4902', 63789200);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(4347, '2020-05-18', '3905', 15112200);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(8790, '2021-02-15', '5877', 133350500);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(1040, '2019-03-21', '3908', 11030800);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(8566, '2020-09-02', '3276', 88509200);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(4072, '2022-04-15', '4374', 55225300);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(3168, '2022-05-10', '3950', 234102600);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(3258, '2022-09-27', '1399', 65010800);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(7217, '2023-11-05', '4951', 69660300);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(8048, '2019-11-14', '3706', 26299300);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(2009, '2021-09-06', '3108', 20242500);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(7885, '2021-09-09', '0051', 62188100);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(3799, '2020-10-16', '6343', 46582900);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(7308, '2020-04-19', '4930', 29522700);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(5664, '2019-08-19', '1398', 41370300);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(9362, '2023-08-29', '8144', 124590600);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(2324, '2022-11-11', '7487', 106715600);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(3857, '2021-03-15', '0966', 51341100);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(2980, '2021-02-22', '7814', 29101800);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(9536, '2019-08-02', '1735', 63697600);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(4968, '2019-10-17', '2935', 30534600);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(4562, '2020-04-08', '8548', 222028500);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(6166, '2020-03-11', '3395', 38970000);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(7708, '2021-11-22', '7981', 45980000);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(2301, '2023-07-24', '4491', 67812700);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(1937, '2023-07-10', '2901', 3511200);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(9963, '2022-08-26', '4637', 44140800);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(6068, '2019-04-28', '0133', 15624300);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(3997, '2020-11-03', '4094', 38819700);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(7700, '2020-06-12', '9555', 38702400);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(6920, '2019-08-04', '6411', 5516500);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(1162, '2020-01-13', '9287', 146000800);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(9077, '2019-06-24', '1845', 132739500);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(7596, '2021-05-13', '4822', 18920000);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(1753, '2021-07-19', '2766', 94025700);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(7508, '2019-06-01', '3079', 31335000);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(7313, '2021-11-23', '9845', 93357100);
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES(7515, '2021-02-13', '1106', 93314100);

-- --------------------------------------------------------


--
-- Cấu trúc bảng cho bảng `khachhang`
--

CREATE TABLE `khachhang` (
  `makh` char(4) NOT NULL,
  `hoten` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `dchi` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sodt` char(12) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `ngsinh` date NOT NULL,
  `email` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `ngdk` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Đang đổ dữ liệu cho bảng `khachhang`
--

INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('6452', N'Huỳnh Hùng Thịnh', N'Xã Ea Drông, Thị xã Buôn Hồ, Tỉnh Đắk Lắk', '0509607367', '1986-01-23', 'huynhhungthinh211@gmail.com', '2014-11-21');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('3696', N'Trần Tùng Quân', N'Phường 2, Thị xã Kiến Tường, Tỉnh Long An', '0222449990', '2003-07-28', 'trantungquan756@gmail.com', '2014-09-18');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('2775', N'Nguyễn Ðức Hạnh', N'Xã Mỹ Đức, Huyện Châu Phú, Tỉnh An Giang', '0861049355', '1988-02-08', 'nguyenduchanh237@gmail.com', '2014-02-01');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('8378', N'Đỗ Ðức Duy', N'Xã Trà Vân, Huyện Nam Trà My, Tỉnh Quảng Nam', '0273590419', '1980-09-16', 'doducduy439@gmail.com', '2011-04-11');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('5437', N'Nguyễn Gia Bạch', N'Phường Cự Khối, Quận Long Biên, Thành phố Hà Nội', '0790297941', '1999-01-27', 'nguyengiabach420@gmail.com', '2014-03-30');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('0485', N'Lê Thế Vinh', N'Xã Mai Sơn, Huyện Yên Mô, Tỉnh Ninh Bình', '0387548981', '1990-09-19', 'lethevinh422@gmail.com', '2014-03-19');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('2855', N'Đoàn Mỹ Yến', N'Phường Nghĩa Tân, Quận Cầu Giấy, Thành phố Hà Nội', '0375649278', '1990-09-08', 'doanmyyen347@gmail.com', '2017-08-12');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('4018', N'Dương Duy Hiếu', N'Xã Hưng Đạo, Huyện Tiên Lữ, Tỉnh Hưng Yên', '0310826474', '1991-12-11', 'duongduyhieu597@gmail.com', '2014-08-15');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('5155', N'Phạm Nam Hưng', N'Xã Nga Liên, Huyện Nga Sơn, Tỉnh Thanh Hóa', '0188919026', '2004-04-19', 'phamnamhung853@gmail.com', '2017-01-31');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('0598', N'Hồ Ðình Dương', N'Phường 6, Thành phố Cao Lãnh, Tỉnh Đồng Tháp', '0192632585', '1993-06-01', 'hodinhduong668@gmail.com', '2013-05-22');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('5988', N'Đặng Hữu Thống', N'Phường Tân Đông Hiệp, Thành phố Dĩ An, Tỉnh Bình Dương', '0692384644', '1980-06-02', 'danghuuthong188@gmail.com', '2014-04-07');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('4337', N'Vũ Huyền Trâm', N'Xã An Ninh, Huyện Châu Thành, Tỉnh Sóc Trăng', '0531190772', '1993-07-24', 'vuhuyentram1@gmail.com', '2017-09-28');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('2526', N'Phan Trung Anh', N'Xã Khánh Hoà, Huyện Lục Yên, Tỉnh Yên Bái', '0172401766', '2002-08-21', 'phantrunganh137@gmail.com', '2011-11-28');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('1657', N'Trương Tường Lân', N'Xã Bát Tràng, Huyện Gia Lâm, Thành phố Hà Nội', '0652911539', '2004-03-10', 'truongtuonglan920@gmail.com', '2014-06-05');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('8176', N'Lê Minh Nhật', N'Xã Hồng Bạch, Huyện Đông Hưng, Tỉnh Thái Bình', '0880686707', '1983-06-26', 'leminhnhat512@gmail.com', '2018-04-02');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('4141', N'Đoàn Hồng Thu', N'Phường 12, Quận 8, Thành phố Hồ Chí Minh', '0298084417', '1999-08-18', 'doanhongthu855@gmail.com', '2015-10-23');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('0304', N'Đoàn Thiên Phương', N'Xã Bình Hòa, Huyện Krông A Na, Tỉnh Đắk Lắk', '0657643136', '1996-09-30', 'doanthienphuong828@gmail.com', '2014-03-06');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('8925', N'Hoàng Xuân Ngọc', N'Phường Tân Hưng, Quận Thốt Nốt, Thành phố Cần Thơ', '0532278891', '1993-08-25', 'hoangxuanngoc487@gmail.com', '2015-02-04');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('6413', N'Huỳnh Cương Quyết', N'Xã Gia Miễn, Huyện Văn Lãng, Tỉnh Lạng Sơn', '0402533632', '1983-08-13', 'huynhcuongquyet970@gmail.com', '2017-10-04');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('1011', N'Bùi Phú Hải', N'Xã Thanh Ngọc, Huyện Thanh Chương, Tỉnh Nghệ An', '0270560193', '1986-06-26', 'buiphuhai936@gmail.com', '2013-12-22');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('9866', N'Trương Anh Tuấn', N'Xã Đông Quan, Huyện Lộc Bình, Tỉnh Lạng Sơn', '0377312868', '2003-04-18', 'truonganhtuan166@gmail.com', '2012-06-16');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('5954', N'Hoàng Thanh Thiên', N'Xã Tân Kiều, Huyện Tháp Mười, Tỉnh Đồng Tháp', '0926249440', '2000-11-29', 'hoangthanhthien951@gmail.com', '2010-08-16');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('0775', N'Trương Linh Hà', N'Xã Vạn Long, Huyện Vạn Ninh, Tỉnh Khánh Hòa', '0341756320', '2000-09-28', 'truonglinhha888@gmail.com', '2017-02-23');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('0071', N'Phan Chi Lan', N'Xã Hà Lang, Huyện Chiêm Hóa, Tỉnh Tuyên Quang', '0382830870', '1986-12-23', 'phanchilan358@gmail.com', '2016-06-29');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('1142', N'Nguyễn Diệu Vân', N'Phường Bùi Hữu Nghĩa, Quận Bình Thuỷ, Thành phố Cần Thơ', '0437366334', '1981-12-22', 'nguyendieuvan602@gmail.com', '2011-01-02');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('8391', N'Phạm Kiên Lâm', N'Xã Hoàng Xá, Huyện Thanh Thuỷ, Tỉnh Phú Thọ', '0105637072', '2000-10-22', 'phamkienlam446@gmail.com', '2012-05-14');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('3319', N'Đỗ Tường Vinh', N'Phường 01, Quận 4, Thành phố Hồ Chí Minh', '0664502922', '1997-07-19', 'dotuongvinh373@gmail.com', '2011-10-24');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('7637', N'Nguyễn Lan Trúc', N'Xã Xuân Lộc, Huyện Can Lộc, Tỉnh Hà Tĩnh', '0718899380', '1985-06-21', 'nguyenlantruc422@gmail.com', '2018-03-02');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('2602', N'Võ Gia Minh', N'Xã Tịnh Hiệp, Huyện Sơn Tịnh, Tỉnh Quảng Ngãi', '0354413189', '1993-01-22', 'vogiaminh534@gmail.com', '2010-03-01');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('1975', N'Đặng Minh Uyên', N'Xã Đại Yên, Huyện Chương Mỹ, Thành phố Hà Nội', '0587675613', '2000-07-31', 'dangminhuyen412@gmail.com', '2011-12-10');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('4493', N'Đoàn Vi Quyên', N'Xã Tả Van, Thị xã Sa Pa, Tỉnh Lào Cai', '0111155137', '1983-11-29', 'doanviquyen849@gmail.com', '2014-10-24');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('6810', N'Võ Tấn Nam', N'Xã Tịnh Thọ, Huyện Sơn Tịnh, Tỉnh Quảng Ngãi', '0299490503', '1980-12-30', 'votannam843@gmail.com', '2015-07-13');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('6234', N'Dương Quốc Hiển', N'Xã Tam Mỹ Tây, Huyện Núi Thành, Tỉnh Quảng Nam', '0210923236', '1983-08-06', 'duongquochien170@gmail.com', '2016-03-16');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('1226', N'Dương Việt Quốc', N'Xã Lê Chánh, Thị xã Tân Châu, Tỉnh An Giang', '0382948980', '2003-08-09', 'duongvietquoc493@gmail.com', '2010-04-16');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('5917', N'Trần Tuấn Sĩ', N'Xã Đường Hoa, Huyện Hải Hà, Tỉnh Quảng Ninh', '0858870030', '1992-12-04', 'trantuansi637@gmail.com', '2016-04-30');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('3232', N'Vũ Quỳnh Tiên', N'Xã Hưng Lộc, Thành phố Vinh, Tỉnh Nghệ An', '0868801543', '1995-10-05', 'vuquynhtien246@gmail.com', '2014-01-13');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('1837', N'Phan Ngọc Thuận', N'Xã Thạch Kim, Huyện Lộc Hà, Tỉnh Hà Tĩnh', '0776203263', '1998-09-30', 'phanngocthuan989@gmail.com', '2012-06-28');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('1056', N'Phan Yên Bình', N'Xã Lộc Sơn, Huyện Hậu Lộc, Tỉnh Thanh Hóa', '0233399801', '1990-12-30', 'phanyenbinh525@gmail.com', '2011-06-26');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('8063', N'Nguyễn Mộng Giác', N'Xã Xuân Đài, Huyện Tân Sơn, Tỉnh Phú Thọ', '0452581095', '1990-01-19', 'nguyenmonggiac289@gmail.com', '2014-07-15');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('6666', N'Nguyễn Thúy Hà', N'Xã Đại Sơn, Huyện Quảng Hòa, Tỉnh Cao Bằng', '0752677781', '1989-11-08', 'nguyenthuyha447@gmail.com', '2015-08-15');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('7021', N'Dương Bảo Huy', N'Xã Phú Phương, Huyện Ba Vì, Thành phố Hà Nội', '0336599571', '1981-07-05', 'duongbaohuy272@gmail.com', '2014-07-23');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('6966', N'Dương Vĩnh Thụy', N'Xã Hưng Hòa, Huyện Bàu Bàng, Tỉnh Bình Dương', '0612296610', '1997-08-05', 'duongvinhthuy854@gmail.com', '2016-06-18');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('9523', N'Phan Lệ Quân', N'Xã Ia RSươm, Huyện Krông Pa, Tỉnh Gia Lai', '0396962340', '1988-04-04', 'phanlequan674@gmail.com', '2013-08-12');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('4877', N'Ngô Phi Nhung', N'Xã Thoại Giang, Huyện Thoại Sơn, Tỉnh An Giang', '0676954536', '1991-07-21', 'ngophinhung191@gmail.com', '2011-07-31');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('4275', N'Đặng Cẩm Thúy', N'Xã Thành Yên, Huyện Thạch Thành, Tỉnh Thanh Hóa', '0595579716', '1984-08-12', 'dangcamthuy234@gmail.com', '2014-08-23');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('6139', N'Hoàng Quang Lâm', N'Xã Phước Thành, Huyện Phước Sơn, Tỉnh Quảng Nam', '0166992086', '1994-07-07', 'hoangquanglam802@gmail.com', '2017-03-13');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('4858', N'Dương Bạch Cúc', N'Xã Bản Qua, Huyện Bát Xát, Tỉnh Lào Cai', '0607968716', '2000-11-05', 'duongbachcuc535@gmail.com', '2011-03-16');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('1879', N'Phạm Vĩnh Thụy', N'Xã Tả Ngảo, Huyện Sìn Hồ, Tỉnh Lai Châu', '0696788036', '1993-09-04', 'phamvinhthuy608@gmail.com', '2010-05-12');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('3270', N'Trương Việt Quyết', N'Xã Phong Lộc, Huyện Hậu Lộc, Tỉnh Thanh Hóa', '0624504000', '1980-01-31', 'truongvietquyet350@gmail.com', '2015-08-20');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('9608', N'Ngô Mỹ Xuân', N'Phường Yên Phụ, Quận Tây Hồ, Thành phố Hà Nội', '0393106232', '1999-02-08', 'ngomyxuan990@gmail.com', '2014-06-24');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('6056', N'Đỗ Gia Hùng', N'Phường Hàng Bột, Quận Đống Đa, Thành phố Hà Nội', '0199446387', '1982-01-19', 'dogiahung386@gmail.com', '2010-06-26');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('3317', N'Lý Yên Bằng', N'Xã Tùng Lâm, Thị xã Nghi Sơn, Tỉnh Thanh Hóa', '0995029717', '1993-03-18', 'lyyenbang767@gmail.com', '2012-02-19');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('9313', N'Nguyễn Ðinh Hương', N'Xã Ninh Phước, Huyện Nông Sơn, Tỉnh Quảng Nam', '0449476270', '1984-03-22', 'nguyendinhhuong19@gmail.com', '2011-06-07');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('6959', N'Trương Quang Huy', N'Xã Mai Đình, Huyện Hiệp Hòa, Tỉnh Bắc Giang', '0288305414', '1986-09-13', 'truongquanghuy423@gmail.com', '2017-05-15');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('1162', N'Hồ Thanh Hằng', N'Xã Liên Vị, Thị xã Quảng Yên, Tỉnh Quảng Ninh', '0754516679', '1991-02-20', 'hothanhhang868@gmail.com', '2011-02-12');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('9911', N'Huỳnh Thiên Trí', N'Thị trấn Kim Sơn, Huyện Quế Phong, Tỉnh Nghệ An', '0293174536', '1984-03-31', 'huynhthientri956@gmail.com', '2017-06-06');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('1514', N'Trần Thiên Khánh', N'Phường Thạnh Phước, Thành phố Tân Uyên, Tỉnh Bình Dương', '0796546235', '1997-09-17', 'tranthienkhanh890@gmail.com', '2010-06-16');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('4681', N'Đặng Hà Phương', N'Xã Ea Ral, Huyện Ea Hleo, Tỉnh Đắk Lắk', '0830089300', '1995-02-24', 'danghaphuong743@gmail.com', '2016-01-31');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('7044', N'Dương Việt Chính', N'Xã Vĩnh Thành, Huyện Châu Thành, Tỉnh An Giang', '0978885655', '1983-09-05', 'duongvietchinh152@gmail.com', '2018-08-30');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('6471', N'Bùi Hoàn Vũ', N'Phường Bình Trưng Đông, Thành phố Thủ Đức, Thành phố Hồ Chí Minh', '0319097410', '1986-05-05', 'buihoanvu401@gmail.com', '2013-03-11');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('0715', N'Phạm Mộng Tuyền', N'Xã Khánh Trung, Huyện Khánh Vĩnh, Tỉnh Khánh Hòa', '0492595328', '2000-12-25', 'phammongtuyen716@gmail.com', '2015-03-25');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('9638', N'Trần Hoàn Châu', N'Phường Minh Khai, Thành phố Hà Giang, Tỉnh Hà Giang', '0534308273', '1983-03-21', 'tranhoanchau175@gmail.com', '2010-09-29');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('2290', N'Huỳnh Ðan Thu', N'Thị trấn Mỹ Long, Huyện Cầu Ngang, Tỉnh Trà Vinh', '0371340139', '1994-05-24', 'huynhdanthu28@gmail.com', '2014-04-09');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('6798', N'Đỗ Anh Vũ', N'Xã Dưỡng Điềm, Huyện Châu Thành, Tỉnh Tiền Giang', '0528374041', '1997-01-09', 'doanhvu761@gmail.com', '2011-10-28');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('9467', N'Trần Ðình Kim', N'Xã Văn Vũ, Huyện Na Rì, Tỉnh Bắc Kạn', '0546541258', '1980-01-10', 'trandinhkim568@gmail.com', '2014-07-05');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('7786', N'Phạm Anh Việt', N'Xã Sơn Dung, Huyện Sơn Tây, Tỉnh Quảng Ngãi', '0856852834', '1996-10-11', 'phamanhviet694@gmail.com', '2010-05-19');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('8015', N'Đặng Mỹ Xuân', N'Xã Diễn Xuân, Huyện Diễn Châu, Tỉnh Nghệ An', '0120785456', '1985-11-27', 'dangmyxuan150@gmail.com', '2010-06-02');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('3566', N'Vũ Duy Tâm', N'Xã Thanh Lân, Huyện Cô Tô, Tỉnh Quảng Ninh', '0423886638', '1999-08-27', 'vuduytam724@gmail.com', '2012-09-12');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('5714', N'Lê Mỹ Hoàn', N'Phường 7, Thành phố Cà Mau, Tỉnh Cà Mau', '0940230221', '1998-01-31', 'lemyhoan945@gmail.com', '2014-12-07');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('1180', N'Võ Duy Hải', N'Xã Phiêng Khoài, Huyện Yên Châu, Tỉnh Sơn La', '0318865194', '1996-07-01', 'voduyhai658@gmail.com', '2016-10-29');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('8696', N'Võ Kim Xuyến', N'Xã Cao Minh, Huyện Tràng Định, Tỉnh Lạng Sơn', '0749907172', '1991-12-01', 'vokimxuyen107@gmail.com', '2012-01-29');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('6018', N'Đoàn Tiểu Bảo', N'Xã Sơn Hải, Huyện Kiên Lương, Tỉnh Kiên Giang', '0323672780', '1992-08-28', 'doantieubao218@gmail.com', '2015-12-16');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('6397', N'Đỗ Nhã Sương', N'Xã Đông Cơ, Huyện Tiền Hải, Tỉnh Thái Bình', '0688612535', '1981-08-06', 'donhasuong1@gmail.com', '2010-10-25');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('5821', N'Nguyễn Bạch Yến', N'Phường Nguyễn An Ninh, Thành phố Vũng Tàu, Tỉnh Bà Rịa - Vũng Tàu', '0931117689', '2003-09-24', 'nguyenbachyen59@gmail.com', '2015-02-06');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('0691', N'Phạm Duy Hiền', N'Xã Bình Dương, Thị xã Đông Triều, Tỉnh Quảng Ninh', '0246758582', '1989-04-23', 'phamduyhien980@gmail.com', '2018-09-17');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('3362', N'Trần Anh Ðức', N'Phường Trần Nguyên Hãn, Thành phố Bắc Giang, Tỉnh Bắc Giang', '0693616054', '1987-09-07', 'trananhduc958@gmail.com', '2013-12-28');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('9909', N'Đặng Diệu Ngọc', N'Xã Chiềng Chung, Huyện Mai Sơn, Tỉnh Sơn La', '0884684431', '1984-06-15', 'dangdieungoc871@gmail.com', '2018-04-12');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('5073', N'Đoàn Thái Nguyên', N'Xã Nậm Chua, Huyện Nậm Pồ, Tỉnh Điện Biên', '0956500872', '2001-10-25', 'doanthainguyen692@gmail.com', '2016-05-07');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('7657', N'Nguyễn Ðức Khải', N'Xã Yên Hoa, Huyện Na Hang, Tỉnh Tuyên Quang', '0673285974', '2000-06-02', 'nguyenduckhai298@gmail.com', '2014-05-07');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('3212', N'Bùi Ngân Thanh', N'Xã Xuân Lộc, Huyện Phú Lộc, Tỉnh Thừa Thiên Huế', '0254261777', '1981-01-21', 'buinganthanh683@gmail.com', '2011-05-26');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('4356', N'Đoàn Ngọc Cảnh', N'Thị trấn Mỹ An, Huyện Tháp Mười, Tỉnh Đồng Tháp', '0451749319', '2004-04-04', 'doanngoccanh848@gmail.com', '2010-02-25');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('5968', N'Dương Quốc Mạnh', N'Xã Hùng Đức, Huyện Hàm Yên, Tỉnh Tuyên Quang', '0170530781', '1980-07-07', 'duongquocmanh860@gmail.com', '2011-12-27');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('0756', N'Lý Vinh Diệu', N'Xã Nậm Tin, Huyện Nậm Pồ, Tỉnh Điện Biên', '0559724002', '1986-08-23', 'lyvinhdieu821@gmail.com', '2018-05-27');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('9378', N'Dương Trâm Anh', N'Phường Quỳnh Mai, Quận Hai Bà Trưng, Thành phố Hà Nội', '0190170634', '2004-03-06', 'duongtramanh194@gmail.com', '2011-07-10');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('2560', N'Bùi Hồng Nhuận', N'Xã Việt Dân, Thị xã Đông Triều, Tỉnh Quảng Ninh', '0909072478', '1981-03-26', 'buihongnhuan773@gmail.com', '2010-02-28');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('7618', N'Dương Nguyệt Nga', N'Xã Văn Bình, Huyện Thường Tín, Thành phố Hà Nội', '0599811723', '1995-05-08', 'duongnguyetnga735@gmail.com', '2015-07-23');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('9633', N'Lê Thúy Hương', N'Xã Ia BLứ, Huyện Chư Pưh, Tỉnh Gia Lai', '0712955024', '1987-05-18', 'lethuyhuong208@gmail.com', '2012-01-12');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('0377', N'Phan Thanh Tuyết', N'Xã Yên Hồng, Huyện Ý Yên, Tỉnh Nam Định', '0476053625', '1999-07-12', 'phanthanhtuyet5@gmail.com', '2015-10-04');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('4332', N'Đặng Nghị Lực', N'Xã Cẩm Liên, Huyện Cẩm Thủy, Tỉnh Thanh Hóa', '0588131133', '2003-12-02', 'dangnghiluc739@gmail.com', '2010-10-03');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('2008', N'Nguyễn Quốc Tiến', N'Xã Tây Vinh, Huyện Tây Sơn, Tỉnh Bình Định', '0629332462', '1990-08-11', 'nguyenquoctien135@gmail.com', '2016-03-01');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('7321', N'Nguyễn Thành Ý', N'Xã Văn Phú, Huyện Sơn Dương, Tỉnh Tuyên Quang', '0665652693', '1992-07-20', 'nguyenthanhy395@gmail.com', '2017-07-17');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('2982', N'Vũ Thành Phương', N'Xã Cán Tỷ, Huyện Quản Bạ, Tỉnh Hà Giang', '0964009467', '2000-07-28', 'vuthanhphuong324@gmail.com', '2013-12-28');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('4467', N'Lê Bảo Thúy', N'Xã Chu Hóa, Thành phố Việt Trì, Tỉnh Phú Thọ', '0604709926', '1998-07-13', 'lebaothuy773@gmail.com', '2012-06-06');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('5261', N'Hồ Bạch Liên', N'Xã Thủy Bằng, Thành phố Huế, Tỉnh Thừa Thiên Huế', '0929032170', '1982-08-03', 'hobachlien67@gmail.com', '2018-03-03');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('1738', N'Huỳnh Lam Giang', N'Xã Khánh Vân, Huyện Yên Khánh, Tỉnh Ninh Bình', '0360111173', '2004-02-04', 'huynhlamgiang509@gmail.com', '2016-01-22');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('6462', N'Hồ Công Tuấn', N'Xã Mỹ Hạnh Nam, Huyện Đức Hòa, Tỉnh Long An', '0283831013', '1981-12-08', 'hocongtuan558@gmail.com', '2014-01-21');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('3965', N'Phạm Khiết Tâm', N'Xã Cam Chính, Huyện Cam Lộ, Tỉnh Quảng Trị', '0791368155', '1993-07-07', 'phamkhiettam619@gmail.com', '2010-11-06');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('5972', N'Hoàng Trọng Dũng', N'Xã Chu Minh, Huyện Ba Vì, Thành phố Hà Nội', '0701519527', '1980-09-26', 'hoangtrongdung433@gmail.com', '2010-06-11');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('9798', N'Bùi Minh Duyên', N'Xã Thịnh Hưng, Huyện Yên Bình, Tỉnh Yên Bái', '0139565336', '1983-04-25', 'buiminhduyen309@gmail.com', '2010-06-05');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('4019', N'Đặng Xuân Hòa', N'Phường Tân An, Thành phố Thủ Dầu Một, Tỉnh Bình Dương', '0791086815', '1983-10-09', 'dangxuanhoa783@gmail.com', '2016-06-23');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('1114', N'Hồ Bích Ngọc', N'Xã Đỗ Xuyên, Huyện Thanh Ba, Tỉnh Phú Thọ', '0479359022', '1999-04-18', 'hobichngoc667@gmail.com', '2010-06-10');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('2538', N'Trần Quốc Hùng', N'Xã Định An, Huyện Dầu Tiếng, Tỉnh Bình Dương', '0805903000', '1991-03-03', 'tranquochung517@gmail.com', '2013-04-16');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('0850', N'Lý Thụy Ðào', N'Xã An Vinh, Huyện Quỳnh Phụ, Tỉnh Thái Bình', '0919991701', '1989-09-01', 'lythuydao2@gmail.com', '2012-01-20');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('7449', N'Phạm Thanh Tuấn', N'Xã Lương Sơn, Huyện Thường Xuân, Tỉnh Thanh Hóa', '0299048723', '1983-08-09', 'phamthanhtuan827@gmail.com', '2015-09-17');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('2743', N'Vũ Trà Giang', N'Thị trấn Tân Phú, Huyện Tân Phú, Tỉnh Đồng Nai', '0477740642', '1993-10-01', 'vutragiang784@gmail.com', '2015-06-01');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('2927', N'Nguyễn Bích Thủy', N'Xã Kim Sơn, Huyện Trà Cú, Tỉnh Trà Vinh', '0900002134', '1990-09-09', 'nguyenbichthuy376@gmail.com', '2017-08-07');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('3826', N'Hồ Tấn Phát', N'Xã Thạnh Tiến, Huyện Vĩnh Thạnh, Thành phố Cần Thơ', '0724926221', '1997-08-03', 'hotanphat287@gmail.com', '2018-11-01');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('3464', N'Võ Minh Huệ', N'Thị trấn Hợp Châu, Huyện Tam Đảo, Tỉnh Vĩnh Phúc', '0888799898', '1990-10-19', 'vominhhue989@gmail.com', '2017-04-11');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('4197', N'Phạm Khuê Trung', N'Xã Lùng Phình, Huyện Bắc Hà, Tỉnh Lào Cai', '0786593496', '1983-08-22', 'phamkhuetrung849@gmail.com', '2015-11-21');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('6039', N'Vũ Cẩm Nhung', N'Xã Diên Bình, Huyện Đắk Tô, Tỉnh Kon Tum', '0404015387', '2001-07-25', 'vucamnhung630@gmail.com', '2012-05-15');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('5481', N'Đoàn Chung Thủy', N'Xã Chiềng Sơ, Huyện Sông Mã, Tỉnh Sơn La', '0250360190', '1982-12-07', 'doanchungthuy169@gmail.com', '2011-04-07');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('2095', N'Ngô Tâm Hằng', N'Xã Quảng Thạch, Huyện Quảng Xương, Tỉnh Thanh Hóa', '0617913451', '1981-10-03', 'ngotamhang613@gmail.com', '2014-02-19');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('4785', N'Phan Thu Minh', N'Xã Hồng Thượng, Huyện A Lưới, Tỉnh Thừa Thiên Huế', '0751442094', '1981-08-24', 'phanthuminh402@gmail.com', '2014-12-16');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('3828', N'Dương Thiên Lạc', N'Xã Mường Mùn, Huyện Tuần Giáo, Tỉnh Điện Biên', '0227560624', '1989-03-08', 'duongthienlac214@gmail.com', '2016-09-29');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('8498', N'Đỗ Hương Thủy', N'Xã Đức Giang, Huyện Vũ Quang, Tỉnh Hà Tĩnh', '0827587450', '1988-06-22', 'dohuongthuy411@gmail.com', '2018-01-15');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('2771', N'Đoàn Bích Hải', N'Thị trấn Thạnh Mỹ, Huyện Nam Giang, Tỉnh Quảng Nam', '0338312924', '1993-08-31', 'doanbichhai229@gmail.com', '2014-05-07');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('7290', N'Nguyễn Phượng Loan', N'Xã Thiệu Giang, Huyện Thiệu Hóa, Tỉnh Thanh Hóa', '0435610744', '1996-06-29', 'nguyenphuongloan560@gmail.com', '2016-03-25');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('3304', N'Đặng Hồng Vinh', N'Xã Ea Bar, Huyện Buôn Đôn, Tỉnh Đắk Lắk', '0721056746', '1993-11-17', 'danghongvinh268@gmail.com', '2012-12-09');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('0630', N'Vũ Ðắc Thành', N'Phường Chí Minh, Thành phố Chí Linh, Tỉnh Hải Dương', '0567240872', '1996-12-24', 'vudacthanh938@gmail.com', '2011-09-02');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('7866', N'Phạm Minh Kiệt', N'Xã Mỹ Quới, Thị xã Ngã Năm, Tỉnh Sóc Trăng', '0637940977', '2002-09-01', 'phamminhkiet608@gmail.com', '2014-12-07');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('6635', N'Đoàn Tuyết Nhung', N'Xã Thọ Điền, Huyện Vũ Quang, Tỉnh Hà Tĩnh', '0103283155', '2002-10-28', 'doantuyetnhung29@gmail.com', '2016-01-14');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('3345', N'Bùi Hà Tiên', N'Xã Đồng Phúc, Huyện Yên Dũng, Tỉnh Bắc Giang', '0296160944', '1998-03-13', 'buihatien512@gmail.com', '2013-10-27');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('7629', N'Trần Tường Minh', N'Xã Xuân Vinh, Huyện Xuân Trường, Tỉnh Nam Định', '0519601000', '1999-01-19', 'trantuongminh177@gmail.com', '2010-12-31');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('8563', N'Trương Hữu Cường', N'Xã Long Tân, Huyện Đất Đỏ, Tỉnh Bà Rịa - Vũng Tàu', '0899668692', '1999-11-07', 'truonghuucuong160@gmail.com', '2016-10-21');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('0991', N'Bùi Thu Nga', N'Phường 2, Thành phố Tuy Hoà, Tỉnh Phú Yên', '0783905064', '1983-05-12', 'buithunga821@gmail.com', '2017-02-05');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('4293', N'Bùi Thu Trang', N'Xã Kim Thạch, Huyện Vĩnh Linh, Tỉnh Quảng Trị', '0925231937', '2003-04-13', 'buithutrang229@gmail.com', '2011-08-27');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('8239', N'Lý Minh Hưng', N'Xã Vĩnh Phú Tây, Huyện Phước Long, Tỉnh Bạc Liêu', '0677401221', '1981-12-03', 'lyminhhung754@gmail.com', '2014-12-03');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('0528', N'Đặng Bá Long', N'Xã Xuân Đông, Huyện Cẩm Mỹ, Tỉnh Đồng Nai', '0277415339', '1998-12-11', 'dangbalong459@gmail.com', '2014-10-29');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('4199', N'Hoàng Ðức Bình', N'Phường Ngọc Trạo, Thành phố Thanh Hóa, Tỉnh Thanh Hóa', '0415260648', '1982-05-28', 'hoangducbinh365@gmail.com', '2010-01-14');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('8234', N'Ngô Vân Ngọc', N'Xã Xuân Phong, Huyện Thọ Xuân, Tỉnh Thanh Hóa', '0351756189', '2000-05-31', 'ngovanngoc248@gmail.com', '2010-01-18');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('1625', N'Vũ Thiện Lương', N'Xã Quỳnh Mỹ, Huyện Quỳnh Phụ, Tỉnh Thái Bình', '0912639245', '1996-03-23', 'vuthienluong9@gmail.com', '2016-05-14');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('2569', N'Võ Việt Tuyết', N'Thị trấn Ia Kha, Huyện Ia Grai, Tỉnh Gia Lai', '0490777591', '2003-11-10', 'voviettuyet328@gmail.com', '2013-08-09');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('0052', N'Nguyễn Mỹ Thuận', N'Xã Tân Phú, Huyện Tân Sơn, Tỉnh Phú Thọ', '0666487440', '1990-03-11', 'nguyenmythuan364@gmail.com', '2018-04-07');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('3720', N'Lý Phước Nhân', N'Xã Trường Thọ, Huyện An Lão, Thành phố Hải Phòng', '0131957257', '1999-08-19', 'lyphuocnhan407@gmail.com', '2014-03-19');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('5869', N'Hồ Gia Cẩn', N'Xã Xuân Bắc, Huyện Xuân Trường, Tỉnh Nam Định', '0823992484', '1987-11-06', 'hogiacan196@gmail.com', '2010-10-08');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('4301', N'Võ Cao Sơn', N'Phường 6, Thành phố Mỹ Tho, Tỉnh Tiền Giang', '0106409321', '2001-06-01', 'vocaoson279@gmail.com', '2011-10-31');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('4598', N'Võ Thế Minh', N'Phường Hoài Hảo, Thị xã Hoài Nhơn, Tỉnh Bình Định', '0223058047', '1988-04-02', 'votheminh952@gmail.com', '2017-03-10');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('0334', N'Trần Hoàng Ngôn', N'Xã Châu Nhân, Huyện Hưng Nguyên, Tỉnh Nghệ An', '0568166881', '1982-04-13', 'tranhoangngon886@gmail.com', '2012-04-11');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('4216', N'Hoàng Thế Dũng', N'Xã Khánh Thượng, Huyện Yên Mô, Tỉnh Ninh Bình', '0237167419', '2002-05-30', 'hoangthedung122@gmail.com', '2017-12-27');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('2273', N'Lê Hiệp Dinh', N'Xã Nguyệt Đức, Thị xã Thuận Thành, Tỉnh Bắc Ninh', '0717746938', '1990-07-09', 'lehiepdinh731@gmail.com', '2018-09-11');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('2076', N'Phạm Hồng Việt', N'Xã Trung Lập, Huyện Vĩnh Bảo, Thành phố Hải Phòng', '0247452678', '1981-06-19', 'phamhongviet921@gmail.com', '2015-08-31');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('8605', N'Lý Hải Dương', N'Xã Thọ Ngọc, Huyện Triệu Sơn, Tỉnh Thanh Hóa', '0586345502', '1986-08-31', 'lyhaiduong204@gmail.com', '2014-06-30');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('1193', N'Vũ Nguyệt Lan', N'Xã Định Bình, Thành phố Cà Mau, Tỉnh Cà Mau', '0745100741', '1983-11-17', 'vunguyetlan464@gmail.com', '2013-08-01');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('5999', N'Võ Tiến Võ', N'Xã Vĩnh Sơn, Huyện Vĩnh Linh, Tỉnh Quảng Trị', '0260948958', '1984-04-23', 'votienvo447@gmail.com', '2014-04-05');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('1518', N'Dương Ðức Tường', N'Phường 1, Thành phố Cao Lãnh, Tỉnh Đồng Tháp', '0249194429', '1984-08-02', 'duongductuong871@gmail.com', '2010-01-24');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('2003', N'Dương Thu Hà', N'Xã Dền Thàng, Huyện Bát Xát, Tỉnh Lào Cai', '0560729929', '1994-10-09', 'duongthuha183@gmail.com', '2016-07-08');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('0136', N'Trần Hồng Khôi', N'Xã Sủng Máng, Huyện Mèo Vạc, Tỉnh Hà Giang', '0825856294', '1985-01-21', 'tranhongkhoi720@gmail.com', '2012-10-14');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('7144', N'Võ Hoa Tiên', N'Phường Phạm Ngũ Lão, Quận 1, Thành phố Hồ Chí Minh', '0321591612', '1989-08-01', 'vohoatien307@gmail.com', '2015-09-16');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('0727', N'Lý Giao Kiều', N'Xã Đại Ân 1, Huyện Cù Lao Dung, Tỉnh Sóc Trăng', '0367149015', '1990-04-16', 'lygiaokieu184@gmail.com', '2010-07-21');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('4555', N'Dương Hoàng Xuân', N'Xã Trung Mầu, Huyện Gia Lâm, Thành phố Hà Nội', '0128093081', '2004-10-16', 'duonghoangxuan751@gmail.com', '2010-10-24');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('3641', N'Hồ Thanh Dân', N'Xã A Rooi, Huyện Đông Giang, Tỉnh Quảng Nam', '0262948004', '1981-07-30', 'hothanhdan56@gmail.com', '2016-01-05');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('0841', N'Đỗ Hữu Thực', N'Xã Đạ Ploa, Huyện Đạ Huoai, Tỉnh Lâm Đồng', '0215345730', '1991-09-24', 'dohuuthuc115@gmail.com', '2018-10-11');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('7046', N'Ngô Song Thư', N'Xã An Định, Huyện Tuy An, Tỉnh Phú Yên', '0171722572', '1996-08-30', 'ngosongthu680@gmail.com', '2015-12-21');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('8671', N'Phan Hải Phong', N'Xã Bình Thành, Huyện Định Hóa, Tỉnh Thái Nguyên', '0403736231', '1995-11-17', 'phanhaiphong58@gmail.com', '2015-09-24');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('9063', N'Võ Hữu Toàn', N'Xã Hương Trà, Huyện Hương Khê, Tỉnh Hà Tĩnh', '0430635576', '1985-11-20', 'vohuutoan390@gmail.com', '2018-07-06');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('0882', N'Ngô Lưu Ly', N'Xã Minh Trí, Huyện Sóc Sơn, Thành phố Hà Nội', '0659878384', '1994-08-02', 'ngoluuly336@gmail.com', '2012-07-07');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('1965', N'Lý Hòa Thái', N'Xã Hùng Sơn, Huyện Anh Sơn, Tỉnh Nghệ An', '0695806712', '2004-08-11', 'lyhoathai86@gmail.com', '2011-01-08');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('4494', N'Vũ Như Mai', N'Xã Phú Đa, Huyện Vĩnh Tường, Tỉnh Vĩnh Phúc', '0464876349', '1997-10-27', 'vunhumai190@gmail.com', '2014-03-01');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('3310', N'Trần Song Lam', N'Xã Tiên Tân, Thành phố Phủ Lý, Tỉnh Hà Nam', '0172331355', '1992-07-06', 'transonglam452@gmail.com', '2014-02-23');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('2784', N'Hoàng Gia Lập', N'Xã Định Trung, Thành phố Vĩnh Yên, Tỉnh Vĩnh Phúc', '0761387800', '1985-11-23', 'hoanggialap401@gmail.com', '2012-02-19');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('1001', N'Trương Mỹ Phượng', N'Phường 12, Thành phố Đà Lạt, Tỉnh Lâm Đồng', '0591332910', '1999-08-16', 'truongmyphuong924@gmail.com', '2014-02-12');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('0316', N'Đoàn Ngọc Ánh', N'Xã Nghi Yên, Huyện Nghi Lộc, Tỉnh Nghệ An', '0580179511', '1990-02-11', 'doanngocanh312@gmail.com', '2018-08-05');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('1460', N'Võ Minh Hải', N'Thị trấn Chợ Mới, Huyện Chợ Mới, Tỉnh An Giang', '0859772736', '1986-04-23', 'vominhhai570@gmail.com', '2013-06-16');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('7023', N'Võ Bình Yên', N'Xã Liêm Hải, Huyện Trực Ninh, Tỉnh Nam Định', '0819594959', '1985-06-11', 'vobinhyen916@gmail.com', '2012-06-05');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('1547', N'Dương Thái Tổ', N'Phường Văn Quán, Quận Hà Đông, Thành phố Hà Nội', '0173426826', '1981-08-27', 'duongthaito866@gmail.com', '2016-12-31');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('3392', N'Hồ Bạch Loan', N'Xã Nhật Tân, Huyện Tiên Lữ, Tỉnh Hưng Yên', '0291660354', '1996-01-29', 'hobachloan683@gmail.com', '2015-11-03');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('9882', N'Huỳnh Quang Ðức', N'Xã Thành Hải, Thành phố Phan Rang-Tháp Chàm, Tỉnh Ninh Thuận', '0401021291', '1998-10-20', 'huynhquangduc851@gmail.com', '2011-01-02');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('2555', N'Huỳnh Thúy Quỳnh', N'Xã Pa Ham, Huyện Mường Chà, Tỉnh Điện Biên', '0107685753', '2003-07-25', 'huynhthuyquynh226@gmail.com', '2015-10-21');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('7698', N'Phan Hồng Thư', N'Xã Ngọc Hồi, Huyện Thanh Trì, Thành phố Hà Nội', '0130709004', '1990-03-10', 'phanhongthu573@gmail.com', '2014-04-20');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('4870', N'Phan An Bình', N'Xã Vang Quới Đông, Huyện Bình Đại, Tỉnh Bến Tre', '0119640405', '1991-03-29', 'phananbinh997@gmail.com', '2011-04-23');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('0080', N'Lê Đức Hòa', N'Xã Sơn Thành Đông, Huyện Tây Hoà, Tỉnh Phú Yên', '0903012662', '1987-01-05', 'leduchoa880@gmail.com', '2015-06-28');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('9777', N'Trần Hương Mai', N'Thị trấn An Phú, Huyện An Phú, Tỉnh An Giang', '0298939037', '1998-04-07', 'tranhuongmai58@gmail.com', '2010-10-02');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('2265', N'Bùi Hiếu Liêm', N'Xã Long Thắng, Huyện Lai Vung, Tỉnh Đồng Tháp', '0203582437', '1980-03-11', 'buihieuliem519@gmail.com', '2011-12-09');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('0919', N'Ngô Vân Khánh', N'Xã An Lạc, Huyện Hạ Lang, Tỉnh Cao Bằng', '0736742360', '1985-01-05', 'ngovankhanh817@gmail.com', '2011-11-20');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('7037', N'Đoàn Hoàng Thái', N'Xã Tàm Xá, Huyện Đông Anh, Thành phố Hà Nội', '0966385913', '1994-10-23', 'doanhoangthai201@gmail.com', '2018-12-20');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('1546', N'Lê Huy Thông', N'Xã Sông Kôn, Huyện Đông Giang, Tỉnh Quảng Nam', '0817925054', '2002-11-18', 'lehuythong208@gmail.com', '2017-05-16');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('9566', N'Nguyễn Thụy Ðào', N'Phường Ngô Mây, Thành phố Kon Tum, Tỉnh Kon Tum', '0635517977', '2002-04-08', 'nguyenthuydao54@gmail.com', '2018-10-21');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('0765', N'Đoàn Thiên Mạnh', N'Xã Tà Xùa, Huyện Bắc Yên, Tỉnh Sơn La', '0307295893', '1999-12-13', 'doanthienmanh66@gmail.com', '2011-10-22');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('1280', N'Phạm Phương Diễm', N'Xã Viên Bình, Huyện Trần Đề, Tỉnh Sóc Trăng', '0662092140', '1986-04-20', 'phamphuongdiem991@gmail.com', '2012-04-17');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('4097', N'Đoàn Kiều Mỹ', N'Xã Gia Tân, Huyện Gia Viễn, Tỉnh Ninh Bình', '0234220741', '1992-07-05', 'doankieumy556@gmail.com', '2011-05-09');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('6292', N'Phan Niệm Nhiên', N'Phường Tân Hòa, Thành phố Hòa Bình, Tỉnh Hoà Bình', '0467697797', '1986-11-14', 'phanniemnhien492@gmail.com', '2015-01-06');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('0589', N'Phạm Khắc Ninh', N'Xã Thạnh Đông, Huyện Tân Hiệp, Tỉnh Kiên Giang', '0151445918', '2002-08-02', 'phamkhacninh81@gmail.com', '2013-04-23');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('8846', N'Lý Công Phụng', N'Xã Đắk Ui, Huyện Đắk Hà, Tỉnh Kon Tum', '0152518503', '1991-12-26', 'lycongphung917@gmail.com', '2017-03-19');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('6532', N'Đặng Tiến Dũng', N'Xã Suối Trai, Huyện Sơn Hòa, Tỉnh Phú Yên', '0593593369', '1999-10-20', 'dangtiendung639@gmail.com', '2018-03-19');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('1202', N'Hồ Ðức Quảng', N'Xã Thành Sơn, Huyện Mai Châu, Tỉnh Hoà Bình', '0280498395', '1990-09-29', 'hoducquang489@gmail.com', '2010-03-07');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('5307', N'Lê Quốc Hưng', N'Phường 9, Thành phố Mỹ Tho, Tỉnh Tiền Giang', '0968545648', '1995-10-12', 'lequochung185@gmail.com', '2017-01-31');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('5845', N'Phan Thế Sơn', N'Xã Bằng Phúc, Huyện Chợ Đồn, Tỉnh Bắc Kạn', '0982239941', '1997-04-11', 'phantheson179@gmail.com', '2015-09-18');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('3693', N'Nguyễn Liên Kiệt', N'Xã Tuấn Việt, Huyện Kim Thành, Tỉnh Hải Dương', '0372538256', '1980-11-24', 'nguyenlienkiet269@gmail.com', '2011-07-21');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('3833', N'Huỳnh Ngọc Hải', N'Xã Vĩnh Phong, Huyện Vĩnh Bảo, Thành phố Hải Phòng', '0369722271', '1990-06-06', 'huynhngochai53@gmail.com', '2014-11-04');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('3901', N'Hoàng Quốc Trung', N'Xã Trung Hòa, Huyện Chiêm Hóa, Tỉnh Tuyên Quang', '0938320095', '1998-11-22', 'hoangquoctrung669@gmail.com', '2014-07-04');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('1520', N'Trương Triều Thanh', N'Xã Lai Hòa, Thị xã Vĩnh Châu, Tỉnh Sóc Trăng', '0241978146', '1986-07-10', 'truongtrieuthanh439@gmail.com', '2010-10-14');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('2712', N'Lê Khánh Văn', N'Xã Đại Thành, Thành phố Ngã Bảy, Tỉnh Hậu Giang', '0468381701', '2002-02-06', 'lekhanhvan828@gmail.com', '2012-11-12');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('7788', N'Lý Phương Thùy', N'Xã Tân Thuận, Huyện Đầm Dơi, Tỉnh Cà Mau', '0879910573', '2004-05-18', 'lyphuongthuy4@gmail.com', '2010-04-13');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('6804', N'Phạm Việt Hà', N'Xã Bình An, Huyện Thăng Bình, Tỉnh Quảng Nam', '0473556382', '2001-08-13', 'phamvietha739@gmail.com', '2016-06-21');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('9059', N'Bùi Hạnh Tường', N'Phường Bắc Sơn, Thành phố Phổ Yên, Tỉnh Thái Nguyên', '0493663428', '1993-09-04', 'buihanhtuong306@gmail.com', '2014-07-05');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('3892', N'Hồ Anh Quân', N'Phường Long Hưng, Thị xã Tân Châu, Tỉnh An Giang', '0697532230', '1988-01-17', 'hoanhquan364@gmail.com', '2017-07-14');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('1678', N'Đặng Ngọc Hoàn', N'Xã Tân Bình, Thành phố Tây Ninh, Tỉnh Tây Ninh', '0778940555', '2003-11-18', 'dangngochoan1000@gmail.com', '2012-08-11');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('7918', N'Hoàng Phi Long', N'Xã Hùng An, Huyện Kim Động, Tỉnh Hưng Yên', '0199536979', '2001-02-23', 'hoangphilong615@gmail.com', '2015-01-09');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('3293', N'Lê Trường Hiệp', N'Xã Minh Xuân, Huyện Lục Yên, Tỉnh Yên Bái', '0798946370', '1992-10-05', 'letruonghiep303@gmail.com', '2012-03-31');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('0944', N'Trương Gia Phước', N'Phường Châu Phú B, Thành phố Châu Đốc, Tỉnh An Giang', '0462125376', '1999-07-07', 'truonggiaphuoc225@gmail.com', '2012-04-15');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('8350', N'Trương Tú Trinh', N'Phường An Cựu, Thành phố Huế, Tỉnh Thừa Thiên Huế', '0722997679', '1986-05-30', 'truongtutrinh973@gmail.com', '2015-07-21');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('4320', N'Dương Thành Tín', N'Xã Tả Thanh Oai, Huyện Thanh Trì, Thành phố Hà Nội', '0256879256', '1996-07-08', 'duongthanhtin442@gmail.com', '2017-05-03');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('1014', N'Hồ Diễm Quỳnh', N'Thị trấn Vân Canh, Huyện Vân Canh, Tỉnh Bình Định', '0554142450', '1997-08-30', 'hodiemquynh710@gmail.com', '2018-04-30');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('1990', N'Lý Phúc Duy', N'Xã Nguyên Phúc, Huyện Bạch Thông, Tỉnh Bắc Kạn', '0586303373', '1987-05-27', 'lyphucduy581@gmail.com', '2012-04-29');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('7547', N'Bùi Nghị Quyền', N'Xã Nhữ Khê, Huyện Yên Sơn, Tỉnh Tuyên Quang', '0511992776', '1997-07-24', 'buinghiquyen640@gmail.com', '2013-07-15');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('9493', N'Hoàng Thiên Giang', N'Xã Xuân Lâm, Huyện Nam Đàn, Tỉnh Nghệ An', '0368850346', '2002-06-08', 'hoangthiengiang795@gmail.com', '2014-12-03');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('2178', N'Bùi Duy Hùng', N'Phường Mỹ Quý, Thành phố Long Xuyên, Tỉnh An Giang', '0869828393', '1993-01-08', 'buiduyhung724@gmail.com', '2010-06-16');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('6166', N'Vũ Hữu Ðạt', N'Xã Diễn Yên, Huyện Diễn Châu, Tỉnh Nghệ An', '0367037212', '1985-03-24', 'vuhuudat131@gmail.com', '2015-09-03');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('8168', N'Trương Tâm Trang', N'Xã Phong Thủy, Huyện Lệ Thủy, Tỉnh Quảng Bình', '0793711763', '1991-10-11', 'truongtamtrang715@gmail.com', '2010-03-23');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('4800', N'Lê Ngọc Loan', N'Xã Thạch Hải, Huyện Thạch Hà, Tỉnh Hà Tĩnh', '0820350367', '1989-06-08', 'lengocloan308@gmail.com', '2018-08-24');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('8340', N'Vũ Huy Phong', N'Thị trấn Đồng Văn, Huyện Đồng Văn, Tỉnh Hà Giang', '0301931159', '1981-10-19', 'vuhuyphong833@gmail.com', '2018-04-30');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('4904', N'Võ Hoài Hương', N'Xã Quảng Xuân, Huyện Quảng Trạch, Tỉnh Quảng Bình', '0787073690', '2002-09-21', 'vohoaihuong37@gmail.com', '2014-02-11');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('8956', N'Phạm Trung Thành', N'Xã Bình Tân Phú, Huyện Bình Sơn, Tỉnh Quảng Ngãi', '0475428128', '1996-01-22', 'phamtrungthanh347@gmail.com', '2018-05-06');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('7922', N'Hoàng Hiếu Thông', N'Xã Phú Thạnh, Huyện Nhơn Trạch, Tỉnh Đồng Nai', '0262264204', '1989-12-27', 'hoanghieuthong572@gmail.com', '2013-06-26');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('4008', N'Trương Phương Triều', N'Xã Long Giang, Thị xã Phước Long, Tỉnh Bình Phước', '0456140603', '1992-02-29', 'truongphuongtrieu123@gmail.com', '2011-09-27');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('4865', N'Nguyễn Lan Chi', N'Xã Mường Lang, Huyện Phù Yên, Tỉnh Sơn La', '0144520484', '1982-12-16', 'nguyenlanchi691@gmail.com', '2010-11-25');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('0319', N'Hồ Cẩm Nhung', N'Xã Phước Tân, Huyện Bác Ái, Tỉnh Ninh Thuận', '0445092129', '1988-07-14', 'hocamnhung632@gmail.com', '2017-01-14');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('9711', N'Hoàng Yên Ðan', N'Xã Bản Phùng, Huyện Hoàng Su Phì, Tỉnh Hà Giang', '0259541074', '1994-04-29', 'hoangyendan152@gmail.com', '2016-03-11');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('7280', N'Vũ Dạ Thi', N'Xã Thanh Sơn, Huyện Thanh Hà, Tỉnh Hải Dương', '0228655760', '1981-03-17', 'vudathi336@gmail.com', '2015-06-05');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('2466', N'Đoàn Liên Phương', N'Xã Dương Phong, Huyện Bạch Thông, Tỉnh Bắc Kạn', '0174211855', '1984-06-07', 'doanlienphuong357@gmail.com', '2010-10-02');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('1749', N'Dương Ðức Sinh', N'Xã Bình Phú, Huyện Chiêm Hóa, Tỉnh Tuyên Quang', '0722944443', '1999-02-22', 'duongducsinh236@gmail.com', '2014-02-01');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('8921', N'Hoàng Thế Anh', N'Xã Thiệu Trung, Huyện Thiệu Hóa, Tỉnh Thanh Hóa', '0310037066', '2002-12-26', 'hoangtheanh701@gmail.com', '2011-12-15');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('8578', N'Ngô Lan Anh', N'Xã Lục Ba, Huyện Đại Từ, Tỉnh Thái Nguyên', '0450801182', '1982-10-22', 'ngolananh969@gmail.com', '2017-03-01');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('8910', N'Hoàng Quỳnh Nhung', N'Xã Dũng Nghĩa, Huyện Vũ Thư, Tỉnh Thái Bình', '0974835959', '1989-03-21', 'hoangquynhnhung658@gmail.com', '2016-12-24');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('8589', N'Huỳnh Diệp Vy', N'Xã An Hiệp, Huyện Châu Thành, Tỉnh Đồng Tháp', '0386699573', '2003-07-27', 'huynhdiepvy673@gmail.com', '2011-06-13');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('8719', N'Huỳnh Bảo Thạch', N'Xã Thanh Vĩnh Đông, Huyện Châu Thành, Tỉnh Long An', '0738690256', '1998-06-01', 'huynhbaothach867@gmail.com', '2014-03-01');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('9926', N'Đoàn Ðức Quang', N'Xã Za Hung, Huyện Đông Giang, Tỉnh Quảng Nam', '0407453672', '1998-03-16', 'doanducquang555@gmail.com', '2011-04-01');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('9615', N'Ngô Hoàng Lâm', N'Xã Đắk Sắk, Huyện Đắk Mil, Tỉnh Đắk Nông', '0874206688', '1983-09-14', 'ngohoanglam535@gmail.com', '2011-05-06');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('6174', N'Ngô Cẩm Yến', N'Xã Sông Trầu, Huyện Trảng Bom, Tỉnh Đồng Nai', '0680564309', '2000-09-06', 'ngocamyen858@gmail.com', '2018-12-21');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('3551', N'Lý Bích Quyên', N'Xã Kim Song Trường, Huyện Can Lộc, Tỉnh Hà Tĩnh', '0735544550', '1996-08-31', 'lybichquyen559@gmail.com', '2015-02-11');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('5118', N'Phan Cẩm Hạnh', N'Phường Bình Thắng, Thành phố Dĩ An, Tỉnh Bình Dương', '0778980709', '1986-12-07', 'phancamhanh304@gmail.com', '2018-04-17');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('6777', N'Đoàn Thành Long', N'Xã Pa Vây Sử, Huyện Phong Thổ, Tỉnh Lai Châu', '0571479902', '1994-05-15', 'doanthanhlong215@gmail.com', '2018-08-11');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('8067', N'Đặng Trí Liên', N'Xã Long Trạch, Huyện Cần Đước, Tỉnh Long An', '0554909711', '2002-01-14', 'dangtrilien227@gmail.com', '2017-08-16');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('5198', N'Võ Trang Nhã', N'Xã Long Hòa, Huyện Châu Thành, Tỉnh Trà Vinh', '0838150027', '1997-09-22', 'votrangnha483@gmail.com', '2013-03-17');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('9901', N'Nguyễn Hiền Mai', N'Xã Thường Tân, Huyện Bắc Tân Uyên, Tỉnh Bình Dương', '0119451542', '1995-05-17', 'nguyenhienmai527@gmail.com', '2013-06-01');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('2619', N'Trần Việt Khải', N'Xã Phú Lập, Huyện Tân Phú, Tỉnh Đồng Nai', '0660732232', '1982-08-08', 'tranvietkhai646@gmail.com', '2018-08-16');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('0181', N'Trần Mai Châu', N'Xã Tứ Quận, Huyện Yên Sơn, Tỉnh Tuyên Quang', '0685394197', '2003-08-08', 'tranmaichau172@gmail.com', '2018-12-29');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('1343', N'Võ Gia Thịnh', N'Xã Nga An, Huyện Nga Sơn, Tỉnh Thanh Hóa', '0638344045', '2002-08-30', 'vogiathinh352@gmail.com', '2017-04-02');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('9298', N'Huỳnh Nam Tú', N'Xã Duy Châu, Huyện Duy Xuyên, Tỉnh Quảng Nam', '0625481834', '1990-08-18', 'huynhnamtu849@gmail.com', '2015-01-13');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('7078', N'Hồ Hùng Anh', N'Xã Chà Cang, Huyện Nậm Pồ, Tỉnh Điện Biên', '0124740530', '2004-10-22', 'hohunganh284@gmail.com', '2013-03-12');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('8608', N'Trần Nhân Từ', N'Xã Lê Ninh, Thị xã Kinh Môn, Tỉnh Hải Dương', '0520405635', '1982-01-11', 'trannhantu191@gmail.com', '2011-09-13');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('6149', N'Đặng Gia Thịnh', N'Xã Long Châu, Huyện Yên Phong, Tỉnh Bắc Ninh', '0609459571', '1986-05-09', 'danggiathinh499@gmail.com', '2018-01-19');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('0747', N'Đặng Hoàng Kim', N'Xã Hòa Chính, Huyện Chương Mỹ, Thành phố Hà Nội', '0626852318', '1998-04-06', 'danghoangkim291@gmail.com', '2015-11-04');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('4879', N'Đặng Quốc Toản', N'Thị trấn Hùng Sơn, Huyện Đại Từ, Tỉnh Thái Nguyên', '0135363518', '1995-07-08', 'dangquoctoan160@gmail.com', '2010-10-15');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('0766', N'Vũ Hoàng Hà', N'Phường Khương Mai, Quận Thanh Xuân, Thành phố Hà Nội', '0857392332', '1995-09-19', 'vuhoangha555@gmail.com', '2014-04-13');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('3846', N'Đỗ Bích Huệ', N'Phường Trường Sơn, Thành phố Sầm Sơn, Tỉnh Thanh Hóa', '0633719980', '1998-12-24', 'dobichhue511@gmail.com', '2016-03-02');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('0980', N'Hoàng Sơn Tuyền', N'Xã Căm Muộn, Huyện Quế Phong, Tỉnh Nghệ An', '0363338141', '1991-08-01', 'hoangsontuyen577@gmail.com', '2016-07-28');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('6282', N'Đỗ Cát Linh', N'Phường Nhân Hòa, Thị xã Mỹ Hào, Tỉnh Hưng Yên', '0544490379', '2003-11-05', 'docatlinh564@gmail.com', '2010-09-05');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('0505', N'Dương Phương Thủy', N'Thị trấn Nghĩa Đàn, Huyện Nghĩa Đàn, Tỉnh Nghệ An', '0955106992', '2004-09-10', 'duongphuongthuy934@gmail.com', '2015-08-15');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('7872', N'Nguyễn Hạnh Nhơn', N'Xã Đắk Long, Huyện Đắk Glei, Tỉnh Kon Tum', '0751561685', '1989-11-30', 'nguyenhanhnhon379@gmail.com', '2012-07-18');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('2277', N'Lý Tuấn Anh', N'Xã Quang Lộc, Huyện Can Lộc, Tỉnh Hà Tĩnh', '0814165807', '2002-11-28', 'lytuananh936@gmail.com', '2016-12-15');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('8035', N'Trương Ngọc Hoàn', N'Xã Đông Phương Yên, Huyện Chương Mỹ, Thành phố Hà Nội', '0211896960', '1985-02-10', 'truongngochoan291@gmail.com', '2018-04-02');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('3739', N'Ngô Bích Vân', N'Xã Phong Thạnh Đông, Thị xã Giá Rai, Tỉnh Bạc Liêu', '0283324548', '1994-08-29', 'ngobichvan114@gmail.com', '2013-12-24');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('6031', N'Đặng Khánh Ngân', N'Xã Tiên Hiệp, Thành phố Phủ Lý, Tỉnh Hà Nam', '0411585316', '1991-05-04', 'dangkhanhngan252@gmail.com', '2015-08-12');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('3793', N'Hồ Hữu Tài', N'Xã Thuận Nghĩa Hòa, Huyện Thạnh Hóa, Tỉnh Long An', '0653589234', '1994-04-18', 'hohuutai520@gmail.com', '2012-04-11');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('4118', N'Nguyễn Tấn Sinh', N'Xã Xuân Lai, Huyện Thọ Xuân, Tỉnh Thanh Hóa', '0125406709', '1993-05-13', 'nguyentansinh194@gmail.com', '2014-08-24');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('2858', N'Lê Thiện Sinh', N'Phường Thủ Thiêm, Thành phố Thủ Đức, Thành phố Hồ Chí Minh', '0222160017', '2002-11-17', 'lethiensinh84@gmail.com', '2017-07-21');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('6677', N'Ngô Quốc Bình', N'Xã Văn Khúc, Huyện Cẩm Khê, Tỉnh Phú Thọ', '0984105281', '1982-08-24', 'ngoquocbinh849@gmail.com', '2015-12-02');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('7413', N'Lý Quốc Thành', N'Xã Khánh Bình Tây, Huyện Trần Văn Thời, Tỉnh Cà Mau', '0259263917', '1985-06-21', 'lyquocthanh330@gmail.com', '2013-05-20');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('7400', N'Lê Hoàng Thái', N'Phường Lộc Hòa, Thành phố Nam Định, Tỉnh Nam Định', '0400896594', '1982-07-22', 'lehoangthai475@gmail.com', '2010-04-28');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('9923', N'Lý Gia Cần', N'Xã Nguyễn Trãi, Huyện Thường Tín, Thành phố Hà Nội', '0256130601', '1995-11-06', 'lygiacan649@gmail.com', '2013-01-31');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('4549', N'Hồ Tuấn Sĩ', N'Xã Tân Thuận, Huyện Vĩnh Thuận, Tỉnh Kiên Giang', '0694413955', '1989-11-04', 'hotuansi674@gmail.com', '2013-02-25');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('4902', N'Trần Phương Uyên', N'Phường Xuân Đài, Thị xã Sông Cầu, Tỉnh Phú Yên', '0187227800', '2002-09-16', 'tranphuonguyen780@gmail.com', '2010-06-17');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('3905', N'Lý Yên Đan', N'Xã Bình Hòa Đông, Huyện Mộc Hóa, Tỉnh Long An', '0686208345', '1995-01-24', 'lyyendan158@gmail.com', '2014-07-14');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('5877', N'Bùi Đức Hạnh', N'Xã Sơn Hiệp, Huyện Khánh Sơn, Tỉnh Khánh Hòa', '0174462553', '1981-08-01', 'buiduchanh43@gmail.com', '2016-07-08');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('3908', N'Vũ Chính Thuận', N'Xã Tân Kiên, Huyện Bình Chánh, Thành phố Hồ Chí Minh', '0892385441', '1987-07-09', 'vuchinhthuan597@gmail.com', '2017-05-11');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('3276', N'Huỳnh Mỹ Thuận', N'Xã Cái Chiên, Huyện Hải Hà, Tỉnh Quảng Ninh', '0893578738', '1987-01-02', 'huynhmythuan867@gmail.com', '2016-02-01');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('4374', N'Đoàn Hoàng Khôi', N'Xã Nậm Có, Huyện Mù Căng Chải, Tỉnh Yên Bái', '0676838680', '1992-02-17', 'doanhoangkhoi398@gmail.com', '2013-05-10');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('3950', N'Võ Quốc Khánh', N'Xã Tân Lập, Huyện Đan Phượng, Thành phố Hà Nội', '0673115742', '1997-11-06', 'voquockhanh684@gmail.com', '2010-08-27');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('1399', N'Vũ Kim Chi', N'Phường Tân Biên, Thành phố Biên Hòa, Tỉnh Đồng Nai', '0976368209', '2003-06-15', 'vukimchi516@gmail.com', '2015-11-25');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('4951', N'Trương Minh Hùng', N'Xã Tân Bình, Huyện Phụng Hiệp, Tỉnh Hậu Giang', '0220824568', '2000-12-17', 'truongminhhung584@gmail.com', '2012-07-30');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('3706', N'Vũ Như Phương', N'Thị trấn Nga Sơn, Huyện Nga Sơn, Tỉnh Thanh Hóa', '0953584960', '1988-06-01', 'vunhuphuong990@gmail.com', '2013-08-07');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('3108', N'Phạm Cẩm Hiền', N'Xã Tam Dân, Huyện Phú Ninh, Tỉnh Quảng Nam', '0315270212', '2000-08-12', 'phamcamhien98@gmail.com', '2014-12-22');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('0051', N'Huỳnh Yên Ðan', N'Thị Trấn Ngọc Lặc, Huyện Ngọc Lặc, Tỉnh Thanh Hóa', '0817249509', '1980-05-09', 'huynhyendan171@gmail.com', '2014-09-06');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('6343', N'Vũ Hải Duyên', N'Phường Trung Lương, Thị xã Hồng Lĩnh, Tỉnh Hà Tĩnh', '0131086353', '2004-05-12', 'vuhaiduyen718@gmail.com', '2014-02-21');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('4930', N'Huỳnh Ðức Bằng', N'Xã Vũ Đoài, Huyện Vũ Thư, Tỉnh Thái Bình', '0288614673', '1996-12-30', 'huynhducbang775@gmail.com', '2018-12-06');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('1398', N'Ngô Phúc Duy', N'Xã Sơn A, Thị xã Nghĩa Lộ, Tỉnh Yên Bái', '0249599155', '1985-02-28', 'ngophucduy855@gmail.com', '2017-10-04');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('8144', N'Trần Tùng Lâm', N'Xã Ngọc Phụng, Huyện Thường Xuân, Tỉnh Thanh Hóa', '0432695896', '1983-12-01', 'trantunglam218@gmail.com', '2010-11-04');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('7487', N'Phan Phước Lộc', N'Phường Hòa Hiệp Nam, Thị xã Đông Hòa, Tỉnh Phú Yên', '0319308106', '2004-06-30', 'phanphuocloc63@gmail.com', '2016-07-25');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('0966', N'Phạm Sơn Tuyền', N'Xã Khâu Vai, Huyện Mèo Vạc, Tỉnh Hà Giang', '0202950347', '1991-02-20', 'phamsontuyen503@gmail.com', '2018-07-11');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('7814', N'Huỳnh Thượng Nghị', N'Xã Đại Thắng, Huyện Tiên Lãng, Thành phố Hải Phòng', '0529231453', '1996-12-27', 'huynhthuongnghi256@gmail.com', '2010-02-12');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('1735', N'Hoàng Phương Thủy', N'Thị trấn Cầu Ngang, Huyện Cầu Ngang, Tỉnh Trà Vinh', '0809328080', '2004-11-01', 'hoangphuongthuy387@gmail.com', '2015-03-29');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('2935', N'Hồ Tấn Trương', N'Phường Quang Trung, Thành phố Quy Nhơn, Tỉnh Bình Định', '0435643319', '2001-03-30', 'hotantruong179@gmail.com', '2014-03-06');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('8548', N'Nguyễn Oanh Vũ', N'Xã Tiên Sơn, Thị xã Duy Tiên, Tỉnh Hà Nam', '0497135814', '1983-12-04', 'nguyenoanhvu947@gmail.com', '2013-12-05');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('3395', N'Đỗ Hữu Bình', N'Phường Điện Ngọc, Thị xã Điện Bàn, Tỉnh Quảng Nam', '0606522134', '1991-09-07', 'dohuubinh852@gmail.com', '2018-11-27');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('7981', N'Nguyễn Lạc Phúc', N'Xã Đồng Nai Thượng, Huyện Cát Tiên, Tỉnh Lâm Đồng', '0185567182', '1983-03-27', 'nguyenlacphuc965@gmail.com', '2010-01-05');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('4491', N'Hoàng Thuận Hòa', N'Xã Ninh Phú, Thị xã Ninh Hòa, Tỉnh Khánh Hòa', '0369126690', '1993-08-06', 'hoangthuanhoa628@gmail.com', '2018-10-30');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('2901', N'Bùi Công Thành', N'Xã Ia Lâu, Huyện Chư Prông, Tỉnh Gia Lai', '0861111588', '2003-02-08', 'buicongthanh325@gmail.com', '2018-05-29');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('4637', N'Lý Việt Sơn', N'Xã Vũ Vinh, Huyện Vũ Thư, Tỉnh Thái Bình', '0772176046', '1984-08-05', 'lyvietson711@gmail.com', '2013-05-02');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('0133', N'Trương Ðông Dương', N'Xã Tân Thanh, Huyện Cái Bè, Tỉnh Tiền Giang', '0384696275', '2003-02-19', 'truongdongduong434@gmail.com', '2018-11-06');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('4094', N'Đỗ Thảo Nghi', N'Phường 15, Quận Bình Thạnh, Thành phố Hồ Chí Minh', '0278520099', '1983-05-16', 'dothaonghi241@gmail.com', '2018-03-03');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('9555', N'Lê Khắc Công', N'Xã Yên Sơn, Huyện Hà Quảng, Tỉnh Cao Bằng', '0613306008', '1998-04-29', 'lekhaccong82@gmail.com', '2014-10-14');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('6411', N'Trương Quỳnh Trang', N'Phường 1, Thành phố Tân An, Tỉnh Long An', '0358025431', '1997-02-24', 'truongquynhtrang465@gmail.com', '2010-03-29');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('9287', N'Hoàng Diệu Ái', N'Xã Bột Xuyên, Huyện Mỹ Đức, Thành phố Hà Nội', '0522163956', '2004-11-09', 'hoangdieuai936@gmail.com', '2018-12-31');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('1845', N'Lý Giáng Uyên', N'Xã Hùng Cường, Thành phố Hưng Yên, Tỉnh Hưng Yên', '0477084063', '1992-07-03', 'lygianguyen490@gmail.com', '2017-04-16');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('4822', N'Đỗ Thu Trang', N'Xã Hương Lộc, Huyện Nam Đông, Tỉnh Thừa Thiên Huế', '0869372439', '1996-12-12', 'dothutrang923@gmail.com', '2011-11-12');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('2766', N'Nguyễn Nguyên Lộc', N'Phường Khương Trung, Quận Thanh Xuân, Thành phố Hà Nội', '0908484484', '1996-11-18', 'nguyennguyenloc14@gmail.com', '2015-10-11');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('3079', N'Bùi Hoàng Giang', N'Xã Bình Nghi, Huyện Tây Sơn, Tỉnh Bình Định', '0667904069', '1991-05-06', 'buihoanggiang510@gmail.com', '2011-04-20');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('9845', N'Huỳnh Hoàng Hải', N'Phường Đống Mác, Quận Hai Bà Trưng, Thành phố Hà Nội', '0246373059', '1997-04-20', 'huynhhoanghai61@gmail.com', '2017-03-06');
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES ('1106', N'Bùi Minh Thu', N'Xã Hàm Thạnh, Huyện Hàm Thuận Nam, Tỉnh Bình Thuận', '0903183958', '2002-04-02', 'buiminhthu20@gmail.com', '2018-02-13');
-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `loai`
--

CREATE TABLE `loai` (
  `maloai` char(4) NOT NULL,
  `tenloai` varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `loai`
--

INSERT INTO `loai` (`maloai`, `tenloai`) VALUES
('ML01', 'Apple'),
('ML02', 'Samsung'),
('ML03', 'Oppo'),
('ML04', 'Xiaomi'),
('ML05', 'Vivo');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sanpham`
--

CREATE TABLE `sanpham` (
  `masp` char(4) NOT NULL,
  `anh` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tensp` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `hangsx` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `gia_goc` int(11) NOT NULL,
  `gia` int(11) NOT NULL,
  `sl` int(11) NOT NULL,
  `maloai` char(4) NOT NULL,
  `giamgia` int(11) NOT NULL,
  `public_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `sanpham`
--

INSERT INTO `sanpham` (`masp`, `anh`, `tensp`, `hangsx`, `gia_goc`, `gia`, `sl`, `maloai`, `giamgia`, `public_id`) VALUES
('0127', 'http://res.cloudinary.com/haonhat/image/upload/v1701352568/jumzn53jdhzyrpv9wlqa.jpg', 'Xiaomi Redmi 13C', 'Xiaomi', 2060000, 3090000, 92, 'ML04', 6, 'jumzn53jdhzyrpv9wlqa'),
('0304', 'http://res.cloudinary.com/haonhat/image/upload/v1701352488/ppg9cvktbxit4hh49ufe.jpg', 'OPPO Find N3', 'Oppo', 18990000, 22990000, 31, 'ML03', 0, 'ppg9cvktbxit4hh49ufe'),
('0573', 'http://res.cloudinary.com/haonhat/image/upload/v1701352429/cpqphdamnpvfjwgvuomf.jpg', 'Samsung Galaxy A05', 'Samsung', 2060000, 3090000, 83, 'ML02', 0, 'cpqphdamnpvfjwgvuomf'),
('0722', 'http://res.cloudinary.com/haonhat/image/upload/v1701352553/mtkkfqydbhgrtzb21j5d.jpg', 'OPPO A77s', 'Oppo', 2290000, 6290000, 65, 'ML03', 23, 'mtkkfqydbhgrtzb21j5d'),
('0799', 'http://res.cloudinary.com/haonhat/image/upload/v1701352537/nnufsotmdodwz97espuj.jpg', 'OPPO A78', 'Oppo', 4990000, 6990000, 6, 'ML03', 0, 'nnufsotmdodwz97espuj'),
('0859', 'http://res.cloudinary.com/haonhat/image/upload/v1701352620/rszjpa14oxl5yjkmtwdn.jpg', 'vivo Y36', 'Vivo', 5290000, 6290000, 55, 'ML05', 7, 'rszjpa14oxl5yjkmtwdn'),
('1124', 'http://res.cloudinary.com/haonhat/image/upload/v1701352458/bgdetpvazy1q3rh4tese.jpg', 'Samsung Galaxy M54', 'Samsung', 9990000, 11990000, 22, 'ML02', 12, 'bgdetpvazy1q3rh4tese'),
('1240', 'http://res.cloudinary.com/haonhat/image/upload/v1701352450/bwy2jum41fty366arst4.jpg', 'Samsung Galaxy S22 Ultra', 'Samsung', 26990000, 30990000, 24, 'ML02', 45, 'bwy2jum41fty366arst4'),
('1327', 'http://res.cloudinary.com/haonhat/image/upload/v1700448696/ymohhj2pqqymb5wjqj1m.jpg', 'iPhone 14 Pro Max', 'Apple', 26990000, 29990000, 100, 'ML01', 8, 'ymohhj2pqqymb5wjqj1m'),
('1340', 'http://res.cloudinary.com/haonhat/image/upload/v1701352528/n4qngwr67zdlewgu7g1i.jpg', 'OPPO Reno7', 'Oppo', 4990000, 7990000, 87, 'ML03', 0, 'n4qngwr67zdlewgu7g1i'),
('1612', 'http://res.cloudinary.com/haonhat/image/upload/v1701352630/pwexlyabjohvnnwqrxvo.jpg', 'vivo Y02s', 'Vivo', 2193334, 3290000, 100, 'ML05', 9, 'pwexlyabjohvnnwqrxvo'),
('1667', 'http://res.cloudinary.com/haonhat/image/upload/v1701352623/jyvtka4i0ls1cc1xtwjd.jpg', 'vivo Y35', 'Vivo', 3990000, 6990000, 78, 'ML05', 34, 'jyvtka4i0ls1cc1xtwjd'),
('1827', 'http://res.cloudinary.com/haonhat/image/upload/v1701352618/k2qs5k73fdksod9xkneu.jpg', 'vivo V27e', 'Vivo', 6990000, 8990000, 97, 'ML05', 7, 'k2qs5k73fdksod9xkneu'),
('2019', 'http://res.cloudinary.com/haonhat/image/upload/v1701352463/dwalmukw59vzwwzoh0tb.jpg', 'Samsung Galaxy A54', 'Samsung', 7490000, 10490000, 31, 'ML02', 9, 'dwalmukw59vzwwzoh0tb'),
('2109', 'http://res.cloudinary.com/haonhat/image/upload/v1701352447/gdqonypanwswlcndethe.jpg', 'Samsung Galaxy S23+', 'Samsung', 25990000, 26990000, 90, 'ML02', 25, 'gdqonypanwswlcndethe'),
('2145', 'http://res.cloudinary.com/haonhat/image/upload/v1701352497/htfksc11pshsjub7j4nk.jpg', 'OPPO Reno10', 'Oppo', 7990000, 9990000, 34, 'ML03', 3, 'htfksc11pshsjub7j4nk'),
('2769', 'http://res.cloudinary.com/haonhat/image/upload/v1700448698/fiaekqrtxakhcm8cpvfe.jpg', 'iPhone 14 Pro', 'Apple', 26990000, 27990000, 92, 'ML01', 10, 'fiaekqrtxakhcm8cpvfe'),
('2797', 'http://res.cloudinary.com/haonhat/image/upload/v1701352452/uqgrxnhaaqtwks5tznwf.jpg', 'Samsung Galaxy S23', 'Samsung', 19990000, 22990000, 27, 'ML02', 30, 'uqgrxnhaaqtwks5tznwf'),
('2989', 'http://res.cloudinary.com/haonhat/image/upload/v1701352562/dhdr2tljw7a9rt4outy2.jpg', 'OPPO A18', 'Oppo', 2460000, 3690000, 94, 'ML03', 8, 'dhdr2tljw7a9rt4outy2'),
('3162', 'http://res.cloudinary.com/haonhat/image/upload/v1701352507/yullpd56eaphhssskluz.jpg', 'OPPO Reno8 Pro', 'Oppo', 15990000, 18990000, 80, 'ML03', 26, 'yullpd56eaphhssskluz'),
('3849', 'http://res.cloudinary.com/haonhat/image/upload/v1701352442/o0pazarp6l7kfu3mi1yi.jpg', 'Samsung Galaxy S23 Ultra', 'Samsung', 28990000, 31990000, 6, 'ML02', 28, 'o0pazarp6l7kfu3mi1yi'),
('3901', 'http://res.cloudinary.com/haonhat/image/upload/v1701352432/c7yn6yvswovjommpxsow.jpg', 'Samsung Galaxy S23 FE', 'Samsung', 12890000, 14890000, 81, 'ML02', 10, 'c7yn6yvswovjommpxsow'),
('4207', 'http://res.cloudinary.com/haonhat/image/upload/v1701352627/k8liv8vkzlhqkaxwih01.jpg', 'vivo Y16', 'Vivo', 2660000, 3990000, 76, 'ML05', 22, 'k8liv8vkzlhqkaxwih01'),
('4211', 'http://res.cloudinary.com/haonhat/image/upload/v1701352634/vxixd4qqwoqe5cwcsv6r.jpg', 'vivo Y02T', 'Vivo', 1993334, 2990000, 50, 'ML05', 0, 'vxixd4qqwoqe5cwcsv6r'),
('4286', 'http://res.cloudinary.com/haonhat/image/upload/v1700448692/qc1n598osa1guorirzp1.jpg', 'iPhone 15 Plus', 'Apple', 24990000, 25990000, 68, 'ML01', 0, 'qc1n598osa1guorirzp1'),
('4297', 'http://res.cloudinary.com/haonhat/image/upload/v1701352565/ykp6ubxcl9xe1oxgzkfm.jpg', 'OPPO A17K', 'Oppo', 2193334, 3290000, 70, 'ML03', 9, 'ykp6ubxcl9xe1oxgzkfm'),
('4336', 'http://res.cloudinary.com/haonhat/image/upload/v1701352486/blst6lqzfcmcyvngjzvs.jpg', 'OPPO Find N3', 'Oppo', 40990000, 44990000, 80, 'ML03', 0, 'blst6lqzfcmcyvngjzvs'),
('4403', 'http://res.cloudinary.com/haonhat/image/upload/v1701352455/ycxhkbuumqzt2otl1ysz.jpg', 'Samsung Galaxy Z Flip4', 'Samsung', 21990000, 23990000, 95, 'ML02', 37, 'ycxhkbuumqzt2otl1ysz'),
('4513', 'http://res.cloudinary.com/haonhat/image/upload/v1701352483/r6cbuvmfofkpqayr26wb.jpg', 'Samsung Galaxy A04s', 'Samsung', 2660000, 3990000, 38, 'ML02', 20, 'r6cbuvmfofkpqayr26wb'),
('4931', 'http://res.cloudinary.com/haonhat/image/upload/v1701352590/tjurqieev8ft56z4mful.jpg', 'Xiaomi 13 Lite', 'Xiaomi', 10490000, 11490000, 80, 'ML04', 17, 'tjurqieev8ft56z4mful'),
('5047', 'http://res.cloudinary.com/haonhat/image/upload/v1701352615/cq5shcdj6kobqmi35tcp.jpg', 'vivo V29e', 'Vivo', 5990000, 8990000, 66, 'ML05', 0, 'cq5shcdj6kobqmi35tcp'),
('5355', 'http://res.cloudinary.com/haonhat/image/upload/v1701352625/m2xljxaggpaoqd9rj2cd.jpg', 'vivo Y22s', 'Vivo', 1290000, 5290000, 14, 'ML05', 30, 'm2xljxaggpaoqd9rj2cd'),
('5385', 'http://res.cloudinary.com/haonhat/image/upload/v1700448704/vnfpkwil14kyahthjqqx.jpg', 'iPhone 13', 'Apple', 14990000, 18990000, 56, 'ML01', 13, 'vnfpkwil14kyahthjqqx'),
('5405', 'http://res.cloudinary.com/haonhat/image/upload/v1701352595/hjgabwscuhbprrbfqeua.jpg', 'Xiaomi Redmi Note 12 Pro', 'Xiaomi', 5490000, 9490000, 52, 'ML04', 10, 'hjgabwscuhbprrbfqeua'),
('5677', 'http://res.cloudinary.com/haonhat/image/upload/v1701352533/fg0hlwng0icha5tdleu0.jpg', 'OPPO Reno8 T', 'Oppo', 7490000, 8490000, 13, 'ML03', 15, 'fg0hlwng0icha5tdleu0'),
('5687', 'http://res.cloudinary.com/haonhat/image/upload/v1701352613/rq1hni16ljonazhywdk3.jpg', 'vivo V25 Pro', 'Vivo', 12990000, 13990000, 85, 'ML05', 32, 'rq1hni16ljonazhywdk3'),
('5711', 'http://res.cloudinary.com/haonhat/image/upload/v1700448709/aweftatfuuszuem4hkm7.jpg', 'iPhone 11', 'Apple', 9990000, 11990000, 98, 'ML01', 9, 'aweftatfuuszuem4hkm7'),
('5789', 'http://res.cloudinary.com/haonhat/image/upload/v1700448706/e3x4fyizhv1llcs2sxwp.jpg', 'iPhone 12', 'Apple', 14990000, 17990000, 59, 'ML01', 23, 'e3x4fyizhv1llcs2sxwp'),
('5794', 'http://res.cloudinary.com/haonhat/image/upload/v1701352499/wwkksjutvyidotckyah6.jpg', 'OPPO Reno10 Pro+', 'Oppo', 18990000, 19990000, 3, 'ML03', 0, 'wwkksjutvyidotckyah6'),
('5900', 'http://res.cloudinary.com/haonhat/image/upload/v1700448694/jdnagnar7of8yc167thk.jpg', 'iPhone 15', 'Apple', 18990000, 22990000, 1, 'ML01', 4, 'jdnagnar7of8yc167thk'),
('6107', 'http://res.cloudinary.com/haonhat/image/upload/v1701352584/x7indp45gtntsr4ag7z1.jpg', 'Xiaomi Redmi Note 12 Pro', 'Xiaomi', 5190000, 7190000, 47, 'ML04', 11, 'x7indp45gtntsr4ag7z1'),
('6202', 'http://res.cloudinary.com/haonhat/image/upload/v1701352592/ttncetzlm2x5q4v5lmie.jpg', 'Xiaomi 12', 'Xiaomi', 10990000, 13990000, 29, 'ML04', 32, 'ttncetzlm2x5q4v5lmie'),
('6433', 'http://res.cloudinary.com/haonhat/image/upload/v1700448700/phtfro4zuczu4tcoy7gq.jpg', 'iPhone 14 Plus', 'Apple', 22990000, 24990000, 73, 'ML01', 12, 'phtfro4zuczu4tcoy7gq'),
('6454', 'http://res.cloudinary.com/haonhat/image/upload/v1701352480/fjdmjkngvwknts33gqwu.jpg', 'Samsung Galaxy A05s', 'Samsung', 490000, 4490000, 80, 'ML02', 4, 'fjdmjkngvwknts33gqwu'),
('6652', 'http://res.cloudinary.com/haonhat/image/upload/v1701352515/wbyt6vhqtsslm3hvadev.jpg', 'OPPO Reno8 T', 'Oppo', 9990000, 10990000, 74, 'ML03', 18, 'wbyt6vhqtsslm3hvadev'),
('6934', 'http://res.cloudinary.com/haonhat/image/upload/v1701352468/kt6gybjqigdhruseidpw.jpg', 'Samsung Galaxy M34', 'Samsung', 4990000, 7990000, 98, 'ML02', 6, 'kt6gybjqigdhruseidpw'),
('6944', 'http://res.cloudinary.com/haonhat/image/upload/v1701352609/wtks4agvenuscjm0zwbf.jpg', 'vivo V25 series', 'Vivo', 9490000, 10490000, 94, 'ML05', 33, 'wtks4agvenuscjm0zwbf'),
('7430', 'http://res.cloudinary.com/haonhat/image/upload/v1701352560/chlxewn91jepqndei7cx.jpg', 'OPPO A17', 'Oppo', 2660000, 3990000, 42, 'ML03', 12, 'chlxewn91jepqndei7cx'),
('7492', 'http://res.cloudinary.com/haonhat/image/upload/v1701352474/wuhrvksd6fzga6nwurmz.jpg', 'Samsung Galaxy A14', 'Samsung', 4190000, 5190000, 100, 'ML02', 13, 'wuhrvksd6fzga6nwurmz'),
('7586', 'http://res.cloudinary.com/haonhat/image/upload/v1701352576/e6i9k6a062xjgqpckxml.jpg', 'Xiaomi 13T Pro', 'Xiaomi', 13990000, 15990000, 47, 'ML04', 9, 'e6i9k6a062xjgqpckxml'),
('7753', 'http://res.cloudinary.com/haonhat/image/upload/v1701352636/uc8cv37cjubpyhfkttso.jpg', 'vivo Y01', 'Vivo', 1593334, 2390000, 63, 'ML05', 12, 'uc8cv37cjubpyhfkttso'),
('8026', 'http://res.cloudinary.com/haonhat/image/upload/v1701352460/bsvwverlkitntkanpod2.jpg', 'Samsung Galaxy S21 FE', 'Samsung', 8990000, 12990000, 52, 'ML02', 23, 'bsvwverlkitntkanpod2'),
('8091', 'http://res.cloudinary.com/haonhat/image/upload/v1701352472/vi3oqxogmfg5kr7zefsi.jpg', 'Samsung Galaxy A24', 'Samsung', 4490000, 6490000, 56, 'ML02', 12, 'vi3oqxogmfg5kr7zefsi'),
('8114', 'http://res.cloudinary.com/haonhat/image/upload/v1701352573/jtnzhutqvtyjtpkml1gz.jpg', 'Xiaomi 13T', 'Xiaomi', 10990000, 11990000, 39, 'ML04', 8, 'jtnzhutqvtyjtpkml1gz'),
('8207', 'http://res.cloudinary.com/haonhat/image/upload/v1701352445/olaph3zvppoj8c89u83j.jpg', 'Samsung Galaxy Z Flip5', 'Samsung', 24990000, 25990000, 77, 'ML02', 15, 'olaph3zvppoj8c89u83j'),
('8223', 'http://res.cloudinary.com/haonhat/image/upload/v1701352601/rd9t9eup7or40obtmfkg.jpg', 'Xiaomi Redmi Note 12S', 'Xiaomi', 5690000, 6690000, 86, 'ML04', 17, 'rd9t9eup7or40obtmfkg'),
('8232', 'http://res.cloudinary.com/haonhat/image/upload/v1701352555/cofs0yhsapptta0zeoau.jpg', 'OPPO A38', 'Oppo', 3490000, 4490000, 53, 'ML03', 6, 'cofs0yhsapptta0zeoau'),
('8364', 'http://res.cloudinary.com/haonhat/image/upload/v1701352611/yckxz8u3syk0qnjpbzhj.jpg', 'vivo V29', 'Vivo', 9990000, 12990000, 35, 'ML05', 0, 'yckxz8u3syk0qnjpbzhj'),
('8375', 'http://res.cloudinary.com/haonhat/image/upload/v1700448685/kumz965lge7a5dub3tht.jpg', 'iPhone 15 Pro', 'Apple', 26990000, 28990000, 40, 'ML01', 0, 'kumz965lge7a5dub3tht'),
('8450', 'http://res.cloudinary.com/haonhat/image/upload/v1701352606/fqypxw3aohuplked8hsw.jpg', 'vivo Y17s', 'Vivo', 3490000, 4490000, 87, 'ML05', 4, 'fqypxw3aohuplked8hsw'),
('8687', 'http://res.cloudinary.com/haonhat/image/upload/v1701352434/aq5fzlrkauwgczwsitfw.jpg', 'Samsung Galaxy Z Fold5', 'Samsung', 36990000, 40990000, 18, 'ML02', 9, 'aq5fzlrkauwgczwsitfw'),
('8843', 'http://res.cloudinary.com/haonhat/image/upload/v1701352477/s2q1unrb6hdcptt1jdar.jpg', 'Samsung Galaxy A14', 'Samsung', 1990000, 4990000, 46, 'ML02', 12, 's2q1unrb6hdcptt1jdar'),
('8920', 'http://res.cloudinary.com/haonhat/image/upload/v1701352502/cjswieaoix04wjtu45ft.jpg', 'OPPO Reno10 Pro', 'Oppo', 12990000, 13990000, 91, 'ML03', 0, 'cjswieaoix04wjtu45ft'),
('8996', 'http://res.cloudinary.com/haonhat/image/upload/v1701352465/kpo1xo9av6khpezphxc5.jpg', 'Samsung Galaxy A34', 'Samsung', 5490000, 8490000, 79, 'ML02', 11, 'kpo1xo9av6khpezphxc5'),
('9022', 'http://res.cloudinary.com/haonhat/image/upload/v1701352439/t7zsza4aqyhj4bevrwyi.jpg', 'Samsung Galaxy Z Fold4', 'Samsung', 36990000, 40990000, 44, 'ML02', 36, 't7zsza4aqyhj4bevrwyi'),
('9097', 'http://res.cloudinary.com/haonhat/image/upload/v1701352604/ukfygr2t8vtmqyhrfqln.jpg', 'Xiaomi Redmi A2 series', 'Xiaomi', 1460000, 2190000, 11, 'ML04', 13, 'ukfygr2t8vtmqyhrfqln'),
('9201', 'http://res.cloudinary.com/haonhat/image/upload/v1701352581/lr00mvltzn0dnqaowfjj.jpg', 'Xiaomi Redmi Note 12', 'Xiaomi', 3490000, 6490000, 39, 'ML04', 15, 'lr00mvltzn0dnqaowfjj'),
('9298', 'http://res.cloudinary.com/haonhat/image/upload/v1701352504/dxmxoj4bqhjapbbcikzb.jpg', 'OPPO A57', 'Oppo', 1990000, 4990000, 30, 'ML03', 24, 'dxmxoj4bqhjapbbcikzb'),
('9389', 'http://res.cloudinary.com/haonhat/image/upload/v1701352598/yamamh6perby2eudbp08.jpg', 'Xiaomi Redmi Note 12 Pro Tím', 'Xiaomi', 8490000, 9490000, 96, 'ML04', 10, 'yamamh6perby2eudbp08'),
('9473', 'http://res.cloudinary.com/haonhat/image/upload/v1701352512/wu1vto4r6fzaxfwptafe.jpg', 'OPPO Find N2 Flip', 'Oppo', 17990000, 19990000, 8, 'ML03', 0, 'wu1vto4r6fzaxfwptafe'),
('9775', 'http://res.cloudinary.com/haonhat/image/upload/v1701352549/nokjcjy1lvgjmjn2bv1p.jpg', 'OPPO A58', 'Oppo', 4990000, 5990000, 47, 'ML03', 5, 'nokjcjy1lvgjmjn2bv1p'),
('9803', 'http://res.cloudinary.com/haonhat/image/upload/v1701352587/flpawvzkqifeaqbiezbf.jpg', 'Xiaomi Redmi 12C', 'Xiaomi', 2393334, 3590000, 17, 'ML04', 30, 'flpawvzkqifeaqbiezbf'),
('9862', 'http://res.cloudinary.com/haonhat/image/upload/v1700448703/evopkfxu41rjgsnmftxw.jpg', 'iPhone 14', 'Apple', 18990000, 21990000, 80, 'ML01', 13, 'evopkfxu41rjgsnmftxw'),
('9937', 'http://res.cloudinary.com/haonhat/image/upload/v1701352520/qhxi6s0kmrc7fyyhnxtx.jpg', 'OPPO A98', 'Oppo', 6990000, 8990000, 51, 'ML03', 5, 'qhxi6s0kmrc7fyyhnxtx'),
('SP01', 'http://res.cloudinary.com/haonhat/image/upload/v1697384754/xdmjbhdmanbpowgkpfnc.jpg', 'iPhone 15 Pro Max', 'Apple', 19990000, 21990000, 50, 'ML01', 12, NULL),
('SP02', 'http://res.cloudinary.com/haonhat/image/upload/v1698062899/xaxavilkca4hwnfy8olw.jpg', 'Samsung Galaxy', 'Samsung', 30000000, 26990000, 100, 'ML02', 0, NULL),
('SP66', 'http://res.cloudinary.com/haonhat/image/upload/v1700375050/gbpjujbjhu60kh8vxmfc.jpg', 'OPPO A17', 'Oppo', 3000000, 3990000, 12, 'ML03', 12, 'gbpjujbjhu60kh8vxmfc'),
('SP69', 'http://res.cloudinary.com/haonhat/image/upload/v1700375048/uqpgiurftufq5j5czah8.jpg', 'OPPO Reno7 series', 'Oppo', 7000000, 7490000, 10, 'ML03', 0, 'uqpgiurftufq5j5czah8');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`Username`);

--
-- Chỉ mục cho bảng `hoadon`
--
ALTER TABLE `hoadon`
  ADD PRIMARY KEY (`sohd`),
  ADD KEY `makh` (`makh`);

--
-- Chỉ mục cho bảng `khachhang`
--
ALTER TABLE `khachhang`
  ADD PRIMARY KEY (`makh`);

--
-- Chỉ mục cho bảng `loai`
--
ALTER TABLE `loai`
  ADD PRIMARY KEY (`maloai`);

--
-- Chỉ mục cho bảng `sanpham`
--
ALTER TABLE `sanpham`
  ADD PRIMARY KEY (`masp`),
  ADD KEY `maloai` (`maloai`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

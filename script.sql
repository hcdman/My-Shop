-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.33 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.4.0.6659
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for myshop
CREATE DATABASE IF NOT EXISTS `myshop` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `myshop`;

-- Dumping structure for table myshop.account
CREATE TABLE IF NOT EXISTS `account` (
  `Username` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `Password` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Startday` date DEFAULT NULL,
  `Available` tinyint(1) NOT NULL,
  PRIMARY KEY (`Username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table myshop.account: ~1 rows (approximately)
INSERT INTO `account` (`Username`, `Password`, `Startday`, `Available`) VALUES
	('haonhat', '$argon2id$v=19$m=65536,t=3,p=4$vd8SwsM2ht8FLDkQR2Yy3g$/kCWWytQZ4kWuMqsSusL8RIbSSs1Jz758i/S3xGn2cg', '2023-10-14', 0);

-- Dumping structure for table myshop.cthd
CREATE TABLE IF NOT EXISTS `cthd` (
  `sohd` int NOT NULL,
  `id_cthd` int NOT NULL AUTO_INCREMENT,
  `masp` char(4) COLLATE utf8mb4_general_ci NOT NULL,
  `sl` int NOT NULL,
  PRIMARY KEY (`id_cthd`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table myshop.cthd: ~6 rows (approximately)
INSERT INTO `cthd` (`sohd`, `id_cthd`, `masp`, `sl`) VALUES
	(1002, 4, 'SP01', 1),
	(1002, 5, 'SP04', 2),
	(1001, 15, 'SP02', 1),
	(1001, 16, 'SP03', 2),
	(1001, 17, 'SP02', 1),
	(1003, 18, 'SP01', 1);

-- Dumping structure for table myshop.hoadon
CREATE TABLE IF NOT EXISTS `hoadon` (
  `sohd` int NOT NULL,
  `nghd` date NOT NULL,
  `makh` char(4) COLLATE utf8mb4_general_ci NOT NULL,
  `trigia` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`sohd`),
  KEY `makh` (`makh`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table myshop.hoadon: ~4 rows (approximately)
INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES
	(1001, '2023-10-02', 'KH03', -1349500000),
	(1003, '2023-10-22', 'KH01', 21990000),
	(1005, '2023-11-11', 'KH02', 0),
	(1006, '2023-12-21', 'KH02', 0);

-- Dumping structure for table myshop.khachhang
CREATE TABLE IF NOT EXISTS `khachhang` (
  `makh` char(4) COLLATE utf8mb4_general_ci NOT NULL,
  `hoten` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `dchi` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `sodt` char(12) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `ngsinh` date NOT NULL,
  `email` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `ngdk` date NOT NULL,
  PRIMARY KEY (`makh`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table myshop.khachhang: ~3 rows (approximately)
INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES
	('KH01', 'Nguyen Van A', '23/5 Nguyen Trai, Q5, TpHCM', '0908256478', '1974-04-03', 'jsi@gmail.com', '2006-07-30'),
	('KH02', 'Tran Ngoc Linh', '45 Nguyen Canh Chan, Q1, TpHCM', '0908256478', '1980-12-06', 'jsi@gmail.com', '2006-08-05'),
	('KH03', 'Tran Thi C', 'Dong Da, Ha Noi', '0908256478', '1974-04-03', 'jsi@gmail.com', '2006-07-30');

-- Dumping structure for table myshop.loai
CREATE TABLE IF NOT EXISTS `loai` (
  `maloai` char(4) COLLATE utf8mb4_general_ci NOT NULL,
  `tenloai` varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`maloai`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table myshop.loai: ~5 rows (approximately)
INSERT INTO `loai` (`maloai`, `tenloai`) VALUES
	('ML01', 'Apple'),
	('ML02', 'Samsung'),
	('ML03', 'Oppo'),
	('ML04', 'Vivo'),
	('ML05', 'Xiaomi');

-- Dumping structure for table myshop.sanpham
CREATE TABLE IF NOT EXISTS `sanpham` (
  `masp` char(4) COLLATE utf8mb4_general_ci NOT NULL,
  `anh` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tensp` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `hangsx` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `gia_goc` int NOT NULL,
  `gia` int NOT NULL,
  `sl` int NOT NULL,
  `maloai` char(4) COLLATE utf8mb4_general_ci NOT NULL,
  `giamgia` int NOT NULL,
  `public_id` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  PRIMARY KEY (`masp`),
  KEY `maloai` (`maloai`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table myshop.sanpham: ~6 rows (approximately)
INSERT INTO `sanpham` (`masp`, `anh`, `tensp`, `hangsx`, `gia_goc`, `gia`, `sl`, `maloai`, `giamgia`, `public_id`) VALUES
	('', '', '', '', 0, 0, 0, '', 0, NULL),
	('SP01', 'http://res.cloudinary.com/haonhat/image/upload/v1697384754/xdmjbhdmanbpowgkpfnc.jpg', 'iPhone 15 Pro Max', 'Apple', 19990000, 21990000, 50, 'ML01', 12, NULL),
	('SP02', 'http://res.cloudinary.com/haonhat/image/upload/v1698062899/xaxavilkca4hwnfy8olw.jpg', 'Samsung Galaxy', 'Samsung', 30000000, 26990000, 100, 'ML02', 0, NULL),
	('SP04', 'http://res.cloudinary.com/haonhat/image/upload/v1697384807/mpc1pp6cqmzhlbpckmg5.jpg', 'iPhone 14 Plus', 'Apple', 19990000, 21990000, 50, 'ML01', 12, NULL),
	('SP09', 'http://res.cloudinary.com/haonhat/image/upload/v1697636185/qqgq2qpw9ksyoh4a3dve.jpg', 'iPhone 15 Pro Max', 'Apple', 19990000, 21990000, 50, 'ML01', 12, NULL),
	('SP10', 'http://res.cloudinary.com/haonhat/image/upload/v1697640826/eeaapv2ns4ylajdlpzt2.jpg', 'iPhone 15 Pro Max', 'Apple', 19990000, 21990000, 50, 'ML01', 12, NULL);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;

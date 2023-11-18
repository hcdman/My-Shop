-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th10 18, 2023 lúc 04:41 AM
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
('haonhat', '$argon2id$v=19$m=65536,t=3,p=4$vd8SwsM2ht8FLDkQR2Yy3g$/kCWWytQZ4kWuMqsSusL8RIbSSs1Jz758i/S3xGn2cg', '2023-10-14', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cthd`
--

CREATE TABLE `cthd` (
  `sohd` int(11) NOT NULL,
  `masp` char(4) NOT NULL,
  `sl` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `cthd`
--

INSERT INTO `cthd` (`sohd`, `masp`, `sl`) VALUES
(1001, 'SP02', 30),
(1001, 'SP04', 5),
(1001, 'SP09', 3),
(1002, 'SP01', 1),
(1002, 'SP04', 2),
(1003, 'SP10', 6),
(1004, 'SP10', 1),
(1005, 'SP09', 1),
(1006, 'SP01', 10),
(1007, 'SP04', 1),
(1008, 'SP10', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `hoadon`
--

CREATE TABLE `hoadon` (
  `sohd` int(11) NOT NULL,
  `nghd` date NOT NULL,
  `makh` char(4) NOT NULL,
  `trigia` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `hoadon`
--

INSERT INTO `hoadon` (`sohd`, `nghd`, `makh`, `trigia`) VALUES
(1001, '2023-10-02', 'KH03', 200451500),
(1002, '2023-10-22', 'KH01', 140601500),
(1003, '2023-10-22', 'KH01', 140601500),
(1004, '2023-10-31', 'KH01', 50870000),
(1005, '2023-11-01', 'KH02', 2990000),
(1006, '2023-11-02', 'KH03', 32990000),
(1007, '2023-11-03', 'KH01', 5000000),
(1008, '2023-11-04', 'KH02', 100900900);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `khachhang`
--

CREATE TABLE `khachhang` (
  `makh` char(4) NOT NULL,
  `hoten` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `dchi` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `sodt` char(12) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `ngsinh` date NOT NULL,
  `email` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `ngdk` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `khachhang`
--

INSERT INTO `khachhang` (`makh`, `hoten`, `dchi`, `sodt`, `ngsinh`, `email`, `ngdk`) VALUES
('KH01', 'Nguyen Van A', '23/5 Nguyen Trai, Q5, TpHCM', '0908256478', '1974-04-03', 'jsi@gmail.com', '2006-07-30'),
('KH02', 'Tran Ngoc Linh', '45 Nguyen Canh Chan, Q1, TpHCM', '0908256478', '1980-12-06', 'jsi@gmail.com', '2006-08-05'),
('KH03', 'Tran Thi C', 'Dong Da, Ha Noi', '0908256478', '1974-04-03', 'jsi@gmail.com', '2006-07-30');

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
('ML04', 'Vivo'),
('ML05', 'Xiaomi');

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
('', '', '', '', 0, 0, 0, '', 0, NULL),
('SP01', 'http://res.cloudinary.com/haonhat/image/upload/v1697384754/xdmjbhdmanbpowgkpfnc.jpg', 'iPhone 15 Pro Max', 'Apple', 19990000, 21990000, 50, 'ML01', 12, NULL),
('SP02', 'http://res.cloudinary.com/haonhat/image/upload/v1698062899/xaxavilkca4hwnfy8olw.jpg', 'Samsung Galaxy', 'Samsung', 30000000, 26990000, 100, 'ML02', 0, NULL),
('SP04', 'http://res.cloudinary.com/haonhat/image/upload/v1697384807/mpc1pp6cqmzhlbpckmg5.jpg', 'iPhone 14 Plus', 'Apple', 19990000, 21990000, 50, 'ML04', 12, NULL),
('SP09', 'http://res.cloudinary.com/haonhat/image/upload/v1697636185/qqgq2qpw9ksyoh4a3dve.jpg', 'iPhone 15 Pro Max', 'Apple', 19990000, 21990000, 50, 'ML05', 12, NULL),
('SP10', 'http://res.cloudinary.com/haonhat/image/upload/v1697640826/eeaapv2ns4ylajdlpzt2.jpg', 'iPhone 15 Pro Max', 'Apple', 19990000, 21990000, 50, 'ML03', 12, NULL),
('SP55', 'http://res.cloudinary.com/haonhat/image/upload/v1699533896/rl9ippj8cyi6fyh9jexa.jpg', 'OPPO Reno7 series', 'Oppo', 7000000, 7490000, 10, 'ML03', 0, 'rl9ippj8cyi6fyh9jexa'),
('SP56', 'http://res.cloudinary.com/haonhat/image/upload/v1699533901/vjvxbmblgwfbehtucyjj.jpg', 'OPPO A17', 'Oppo', 3000000, 3990000, 12, 'ML03', 12, 'vjvxbmblgwfbehtucyjj');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`Username`);

--
-- Chỉ mục cho bảng `cthd`
--
ALTER TABLE `cthd`
  ADD PRIMARY KEY (`sohd`,`masp`),
  ADD KEY `masp` (`masp`);

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
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

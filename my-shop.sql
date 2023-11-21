-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th10 21, 2023 lúc 03:37 AM
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
  `id` int(11) NOT NULL,
  `code` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `code`
--

INSERT INTO `code` (`id`, `code`) VALUES
(6, '1234567'),
(7, '1234567'),
(8, '1234567');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cthd`
--

CREATE TABLE `cthd` (
  `sohd` int(11) NOT NULL,
  `masp` char(4) NOT NULL,
  `sl` int(11) NOT NULL,
  `id_cthd` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `cthd`
--

INSERT INTO `cthd` (`sohd`, `masp`, `sl`, `id_cthd`) VALUES
(1001, 'SP02', 30, 1),
(1001, 'SP04', 5, 2),
(1001, 'SP09', 3, 3),
(1002, 'SP01', 1, 4),
(1002, 'SP04', 2, 5),
(1003, 'SP10', 6, 6),
(1004, 'SP10', 1, 7),
(1005, 'SP09', 1, 8),
(1006, 'SP01', 10, 9),
(1007, 'SP04', 1, 10),
(1008, 'SP10', 1, 11);

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
('1327', 'http://res.cloudinary.com/haonhat/image/upload/v1700448696/ymohhj2pqqymb5wjqj1m.jpg', 'iPhone 14 Pro Max', 'Apple', 26990000, 29990000, 100, 'ML01', 8, 'ymohhj2pqqymb5wjqj1m'),
('2769', 'http://res.cloudinary.com/haonhat/image/upload/v1700448698/fiaekqrtxakhcm8cpvfe.jpg', 'iPhone 14 Pro', 'Apple', 26990000, 27990000, 92, 'ML01', 10, 'fiaekqrtxakhcm8cpvfe'),
('4286', 'http://res.cloudinary.com/haonhat/image/upload/v1700448692/qc1n598osa1guorirzp1.jpg', 'iPhone 15 Plus', 'Apple', 24990000, 25990000, 68, 'ML01', 0, 'qc1n598osa1guorirzp1'),
('5385', 'http://res.cloudinary.com/haonhat/image/upload/v1700448704/vnfpkwil14kyahthjqqx.jpg', 'iPhone 13', 'Apple', 14990000, 18990000, 56, 'ML01', 13, 'vnfpkwil14kyahthjqqx'),
('5711', 'http://res.cloudinary.com/haonhat/image/upload/v1700448709/aweftatfuuszuem4hkm7.jpg', 'iPhone 11', 'Apple', 9990000, 11990000, 98, 'ML01', 9, 'aweftatfuuszuem4hkm7'),
('5789', 'http://res.cloudinary.com/haonhat/image/upload/v1700448706/e3x4fyizhv1llcs2sxwp.jpg', 'iPhone 12', 'Apple', 14990000, 17990000, 59, 'ML01', 23, 'e3x4fyizhv1llcs2sxwp'),
('5900', 'http://res.cloudinary.com/haonhat/image/upload/v1700448694/jdnagnar7of8yc167thk.jpg', 'iPhone 15', 'Apple', 18990000, 22990000, 1, 'ML01', 4, 'jdnagnar7of8yc167thk'),
('6433', 'http://res.cloudinary.com/haonhat/image/upload/v1700448700/phtfro4zuczu4tcoy7gq.jpg', 'iPhone 14 Plus', 'Apple', 22990000, 24990000, 73, 'ML01', 12, 'phtfro4zuczu4tcoy7gq'),
('8375', 'http://res.cloudinary.com/haonhat/image/upload/v1700448685/kumz965lge7a5dub3tht.jpg', 'iPhone 15 Pro', 'Apple', 26990000, 28990000, 40, 'ML01', 0, 'kumz965lge7a5dub3tht'),
('9862', 'http://res.cloudinary.com/haonhat/image/upload/v1700448703/evopkfxu41rjgsnmftxw.jpg', 'iPhone 14', 'Apple', 18990000, 21990000, 80, 'ML01', 13, 'evopkfxu41rjgsnmftxw'),
('SP01', 'http://res.cloudinary.com/haonhat/image/upload/v1697384754/xdmjbhdmanbpowgkpfnc.jpg', 'iPhone 15 Pro Max', 'Apple', 19990000, 21990000, 50, 'ML01', 12, NULL),
('SP02', 'http://res.cloudinary.com/haonhat/image/upload/v1698062899/xaxavilkca4hwnfy8olw.jpg', 'Samsung Galaxy', 'Samsung', 30000000, 26990000, 100, 'ML02', 0, NULL),
('SP04', 'http://res.cloudinary.com/haonhat/image/upload/v1697384807/mpc1pp6cqmzhlbpckmg5.jpg', 'iPhone 14 Plus', 'Apple', 19990000, 21990000, 50, 'ML04', 12, NULL),
('SP09', 'http://res.cloudinary.com/haonhat/image/upload/v1697636185/qqgq2qpw9ksyoh4a3dve.jpg', 'iPhone 15 Pro Vip', 'Apple', 19990000, 21990000, 50, 'ML05', 12, NULL),
('SP10', 'http://res.cloudinary.com/haonhat/image/upload/v1697640826/eeaapv2ns4ylajdlpzt2.jpg', 'iPhone 15 Vip Pro', 'Apple', 19990000, 21990000, 50, 'ML03', 12, NULL),
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
-- Chỉ mục cho bảng `code`
--
ALTER TABLE `code`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `cthd`
--
ALTER TABLE `cthd`
  ADD PRIMARY KEY (`id_cthd`);

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

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `code`
--
ALTER TABLE `code`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT cho bảng `cthd`
--
ALTER TABLE `cthd`
  MODIFY `id_cthd` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

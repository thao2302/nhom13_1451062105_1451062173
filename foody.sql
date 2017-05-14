-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th5 14, 2017 lúc 04:39 CH
-- Phiên bản máy phục vụ: 10.1.21-MariaDB
-- Phiên bản PHP: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `foody`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `book`
--

CREATE TABLE `book` (
  `Id` int(20) NOT NULL,
  `User-Id` int(20) NOT NULL,
  `Food_Id` int(20) NOT NULL,
  `Day` date NOT NULL,
  `Time` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Table` int(20) NOT NULL,
  `Created` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `food`
--

CREATE TABLE `food` (
  `Id` int(20) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Price` int(255) NOT NULL,
  `Category_id` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `food_category`
--

CREATE TABLE `food_category` (
  `Id` int(20) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Created` date NOT NULL,
  `Modified` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order`
--

CREATE TABLE `order` (
  `Id` int(20) NOT NULL,
  `User-Id` int(20) NOT NULL,
  `Food_Id` int(20) NOT NULL,
  `Foodcategory_Id` int(20) NOT NULL,
  `Address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Fullname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Phone number` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `Pay` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user`
--

CREATE TABLE `user` (
  `Id` int(20) NOT NULL,
  `Password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Fullname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Created` date NOT NULL,
  `Modified` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `User-Id` (`User-Id`),
  ADD KEY `Food_Id` (`Food_Id`);

--
-- Chỉ mục cho bảng `food`
--
ALTER TABLE `food`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `Category_id` (`Category_id`);

--
-- Chỉ mục cho bảng `food_category`
--
ALTER TABLE `food_category`
  ADD PRIMARY KEY (`Id`);

--
-- Chỉ mục cho bảng `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `User-Id` (`User-Id`),
  ADD KEY `Food_Id` (`Food_Id`),
  ADD KEY `Foodcategory_Id` (`Foodcategory_Id`);

--
-- Chỉ mục cho bảng `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`Id`);

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `book`
--
ALTER TABLE `book`
  ADD CONSTRAINT `book_ibfk_1` FOREIGN KEY (`User-Id`) REFERENCES `user` (`Id`),
  ADD CONSTRAINT `book_ibfk_2` FOREIGN KEY (`Food_Id`) REFERENCES `food` (`Id`);

--
-- Các ràng buộc cho bảng `food`
--
ALTER TABLE `food`
  ADD CONSTRAINT `food_ibfk_1` FOREIGN KEY (`Category_id`) REFERENCES `food_category` (`Id`),
  ADD CONSTRAINT `food_ibfk_2` FOREIGN KEY (`Id`) REFERENCES `order` (`Food_Id`);

--
-- Các ràng buộc cho bảng `food_category`
--
ALTER TABLE `food_category`
  ADD CONSTRAINT `food_category_ibfk_1` FOREIGN KEY (`Id`) REFERENCES `order` (`Foodcategory_Id`);

--
-- Các ràng buộc cho bảng `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`Id`) REFERENCES `order` (`User-Id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;


SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";

CREATE TABLE `KHOA` (
  `MaKhoa` varchar(255) NOT NULL PRIMARY KEY,
  `TenKhoa` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `NamThanhLap` int(4) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


CREATE TABLE `LOP` (
  `MaLop` varchar(20) NOT NULL PRIMARY KEY,
  `TenLop` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `MaKhoa` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  FOREIGN KEY (MaKhoa) REFERENCES KHOA(MaKhoa)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


CREATE TABLE `SINHVIEN` (
  `MaSV` varchar(20) NOT NULL PRIMARY KEY,
  `HoTen` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `NgaySinh` datetime  NOT NULL,
  `Email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `MaLop` varchar(100) NOT NULL,
  FOREIGN KEY (MaLop) REFERENCES LOP(MaLop)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `MONHOC` (
  `MaMH` varchar(20) NOT NULL PRIMARY KEY,
  `TenMon` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `SoTC` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `KETQUA` (
  `MaKQ` varchar(20) NOT NULL PRIMARY KEY,
  `MaMH` varchar(20) NOT NULL,
  `MaSV` varchar(20) NOT NULL,
  `Diem` int(2) NOT NULL,
  FOREIGN KEY (MaMH) REFERENCES MONHOC(MaMH),
  FOREIGN KEY (MaSV) REFERENCES SINHVIEN(MaSV)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";

CREATE TABLE `KHOA` (
  `MaKhoa` varchar(255) NOT NULL PRIMARY KEY,
  `TenKhoa` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `NamThanhLap` int(4) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `KHOA` (`MaKhoa`, `TenKhoa`, `NamThanhLap`) VALUES
('CNTT', 'Công nghệ thông tin', 1998),
('NNA', 'Ngôn ngữ anh', 1990),
('NNN', 'Ngôn ngữ nga', 1990),
('VNH', 'Việt Nam học', 1995),
('SPH', 'Sư phạm Hóa', 1990),
('SPA', 'Sư phạm Anh', 1990),
('SPL', 'Sư phạm Lý', 1990),
('SPT', 'Sư phạm Toán', 1990),
('SPV', 'Sư phạm Văn', 1990),
('SPS', 'Sư phạm Sử', 1990);


CREATE TABLE `LOP` (
  `MaLop` varchar(20) NOT NULL PRIMARY KEY,
  `TenLop` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `MaKhoa` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  FOREIGN KEY (MaKhoa) REFERENCES KHOA(MaKhoa)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `LOP` (`MaLop`, `TenLop`, `MaKhoa`) VALUES
('CNTT1', 'Công nghệ thông tin', 'CNTT'),
('NNA1', 'Ngôn ngữ anh', 'NNA'),
('NNN1', 'Ngôn ngữ nga', 'NNN'),
('VNH1', 'Việt Nam học', 'VNH'),
('SPH1', 'Sư phạm Hóa', 'SPH'),
('SPA1', 'Sư phạm Anh', 'SPA'),
('SPL1', 'Sư phạm Lý', 'SPL'),
('SPT1', 'Sư phạm Toán', 'SPT'),
('SPV1', 'Sư phạm Văn', 'SPV'),
('SPS1', 'Sư phạm Sử', 'SPS');


CREATE TABLE `SINHVIEN` (
  `MaSV` varchar(20) NOT NULL PRIMARY KEY,
  `HoTen` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `NgaySinh` date  NOT NULL,
  `Email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `MaLop` varchar(100) NOT NULL,
  FOREIGN KEY (MaLop) REFERENCES LOP(MaLop)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `SINHVIEN` (`MaSV`, `HoTen`, `NgaySinh`, `Email`, `MaLop`) VALUES
('CNTT01', 'Nguyễn Văn Anh', '2000-07-20', 'NVA01@gmail.com'),
('NNA01', 'Nguyễn Văn Sinh', '2000-06-10', 'NVS007@gmail.com'),
('NNN01', 'Bùi Văn Tam', '1999-01-05', 'BVT01@gmail.com'),
('VNH01', 'Trần Thị Vân', '2000-07-18', 'TTV01@gmail.com'),
('SPH01', 'Trần Quốc Huy', '2000-10-10', 'TQH01@gmail.com'),,
('SPA01', 'Nguyễn Thị Nghĩa', '2000-08-08', 'NTN01@gmail.com'),
('SPL01', 'Trần Vân Anh', '2000-02-02', 'TVA01@gmail.com'),),
('SPT01', 'Nguyễn Đức Tài', '2000-06-18', 'NDT01@gmail.com'),,
('SPV01', 'Hà Ngọc Bích', '2000-07-11', 'HNB01@gmail.com'),,
('SPS01', 'Nguyễn Tâm', '2000-02-28', 'NT01@gmail.com'),;

CREATE TABLE `MONHOC` (
  `MaMH` varchar(20) NOT NULL PRIMARY KEY,
  `TenMon` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `SoTC` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `MONHOC` (`MaMH`, `TenMon`, `SoTC`) VALUES
('LTCB', 'Lập trình cơ bản', 3),
('AV1', 'Anh văn 1', 2),
('TN1', 'Tiếng Nga 1', 3),
('LSVN', 'Lịch sử Việt Nam', 2),
('HHC', 'Hóa hữu cơ', 3),
('NVA', 'Nghe - Viết Anh Văn', 3),
('VLC', 'Vật lý cơ', 2),
('HHKG', 'Hình học không gian', 3),
('DH', 'Đọc hiểu 1', 3),
('LS1', 'Lịch sử 1', 3);

CREATE TABLE `KETQUA` (
  `MaKQ` varchar(20) NOT NULL PRIMARY KEY,
  `MaMH` varchar(20) NOT NULL,
  `MaSV` varchar(20) NOT NULL,
  `Diem` int(2) NOT NULL,
  FOREIGN KEY (MaMH) REFERENCES MONHOC(MaMH),
  FOREIGN KEY (MaSV) REFERENCES SINHVIEN(MaSV)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `KETQUA` (`MaKQ`, `MaMH`, `MaSV`, `Diem`) VALUES
('01', 'LTCB', 'CNTT01', '10'),
('02', 'AV1', 'NNA01', '9')
('03', 'TN1', 'NNN01', '8')
('04', 'LSVN', 'VNH01', '9'),
('05', 'HHC', 'SPH01', '5'),
('06', 'NVA', 'SPA01', '6'),
('07', 'VLC', 'SPL01', '10'),
('08', 'HHKG', 'SPT01', '8'),
('09', 'DH', 'SPV01', '10'),
('10', 'LS1', 'SPS01', '8');


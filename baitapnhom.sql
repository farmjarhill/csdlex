
--Tạo Database
create database QL_Ngan_Hang_Thuong_Mai
go
----------------------------------------------------------
/*tạo các table */
use QL_Ngan_Hang_Thuong_Mai
go
-- Tạo table CHINHANH
create table CHINHANH
( 
  MaCN varchar(10) primary key,
  TenCN nvarchar(100) not null,
  Taisan nvarchar(20),
  Diachi nvarchar(200)
)
go

-- Tạo table KHACHHANG
create table KHACHHANG
(
 MaKH varchar(10) primary key,
 TenKH nvarchar(50) not null,
 SDT nvarchar(20),
 Diachi nvarchar(200)
)
go

-- Tạo bảng CHUNGCHI
create table CHUNGCHI
(
  SoSR nvarchar(20) primary key,
  TenChungChi nvarchar(50) not null,
  NgayPH datetime,
  MaKH varchar(10),
  Laisuat varchar(10),
  Thoihan datetime,
  MaCN  varchar(10),
)
go

-- Tạo bảng GIAODICH
create table GIAODICH
(
 MaGD varchar(10) primary key,
 LoaiGD nvarchar(50) not null,
 NgayGD datetime,
 NguoiGD nvarchar(100),
 SotienGD int,
 MaCN varchar(10),
)
go

-- Tạo table CN_&_DN_covon
create table CN_VS_DN_covon
( 
 MaKH varchar(10) primary key,
 TenKH nvarchar(50) not null,
 TgGiaoDich datetime,
 MaGD varchar(10) not null,
)
go

-- tạo bảng KHOANVAY
create table KHOANVAY
(
 MaKV varchar(10) primary key,
 LoaiVay nvarchar(50) not null,
 Ngayvay datetime,
 Laisuat nvarchar(10),
 MaKH varchar(10) not null,
 MaCN varchar(10) not null,
)
go

-- tạo bảng KHOANGUI
create table KHOANGUI
(
 MaKG varchar(10) primary key,
 LoaiGui nvarchar(50) not null,
 Ngaygui datetime,
 Laisuat nvarchar(10),
 MaKH varchar(10) not null,
 MaCN varchar(10) not null,
)
go

-- tạo bảng TAIKHOAN
create table TAIKHOAN
(
  MaTK varchar(20) primary key,
  NgayMo datetime,
  SoDuTK int,
  MaKH varchar(10) not null,
  MaCN varchar(10) not  null,
)
go

-- tạo bảng THETD
create table THETD
(
  MatheTD varchar(20) primary key,
  Thoihan datetime,
  MaCVV nvarchar(20),
  MaTK varchar(20) not null,
)
go

-- Tạo bảng THEGN
create table THEGN
(
  MatheGN varchar(20) primary key,
  Thoihan datetime,
  MaCVV nvarchar(20),
  MaTK varchar(20) not null,
  Loaithe nvarchar(20),
)
go

-- tạo bảng HOIPHIEU
create table HOIPHIEU
(
  MaHP varchar(20) primary key,
  TenHP nvarchar(50) not null,
  TenCTphathanh nvarchar(50) not null,
  NgayPH datetime,
  NgayDH datetime,
  MaCT varchar(10) not null,
  MaCN varchar(10) not null,
)
go

-- tạo bảng CTY
create table CTY
(
  MaCT varchar(10) primary key,
  TenCT nvarchar(100) not null,
  Diachi nvarchar(200)
)
go

-- tạo bảng DICHVUTHANHTOAN
create table DICHVUTHANHTOAN
(
 MaDV varchar(10) primary key,
 TenDV nvarchar(100) not null,
 NgayPS_Dichvu datetime,
)
go

-- tạo bảng DVTHANHTOANQUATK
create table DV_THANHTOANQUATK
(
 MaLuotDV nvarchar(20) primary key,
 MaDV varchar(10) not null,
 MaKH varchar(10) not null,
 MaCN varchar(10) not null,
)
go

---------------------------------------------------------------------------

/* tạo khóa ngoại */
use QL_Ngan_Hang_Thuong_Mai
go
-- Tạo khóa ngoại FK_CHINHANH_VS_DV_THANHTOANQUATK
alter table DV_THANHTOANQUATK
add constraint FK_CHINHANH_VS_DV_THANHTOANQUATK
foreign key (MaCN)
references CHINHANH(MaCN)
go

--  Tạo khóa ngoại FK_CHINHANH_VS_CHUNGCHI
alter table CHUNGCHI
add constraint FK_CHINHANH_VS_CHUNGCHI
foreign key (MaCN)
references CHINHANH(MaCN)
go

--  Tạo khóa ngoại FK_CHINHANH_VS_GIAODICH
alter table GIAODICH
add constraint FK_CHINHANH_VS_GIAODICH
foreign key (MaCN)
references CHINHANH(MaCN)
go


--  Tạo khóa ngoại FK_CHINHANH_VS_KHOANVAY
alter table KHOANVAY
add constraint FK_CHINHANH_VS_KHOANVAY
foreign key (MaCN)
references CHINHANH(MaCN)
go

--  Tạo khóa ngoại FK_CHINHANH_VS_KHOANGUI
alter table KHOANGUI
add constraint FK_CHINHANH_VS_KHOANGUI
foreign key (MaCN)
references CHINHANH(MaCN)
go

--  Tạo khóa ngoại FK_CHINHANH_VS_TAIKHOAN
alter table TAIKHOAN
add constraint FK_CHINHANH_VS_TAIKHOAN
foreign key (MaCN)
references CHINHANH(MaCN)
go

--  Tạo khóa ngoại FK_CHINHANH_VS_HOIPHIEU
alter table HOIPHIEU
add constraint FK_CHINHANH_VS_HOIPHIEU
foreign key (MaCN)
references CHINHANH(MaCN)
go

--  Tạo khóa ngoại FK_KHACHHANG_VS_CHUNGCHI
alter table CHUNGCHI
add constraint FK_KHACHHANG_VS_CHUNGCHI
foreign key (MaKH)
references KHACHHANG(MaKH)
go

--  Tạo khóa ngoại FK_KHACHHANG_VS_CN_VS_DN_covon
alter table CN_VS_DN_covon
add constraint FK_KHACHHANG_VS_CN_VS_DN_covon
foreign key (MaKH)
references KHACHHANG(MaKH)
go


--  Tạo khóa ngoại FK_KHACHHANG_VS_KHOANVAY
alter table KHOANVAY
add constraint FK_KHACHHANG_VS_KHOANVAY
foreign key (MaKH)
references KHACHHANG(MaKH)
go

--  Tạo khóa ngoại FK_KHACHHANG_VS_KHOANGUI
alter table KHOANGUI
add constraint FK_KHACHHANG_VS_KHOANGUI
foreign key (MaKH)
references KHACHHANG(MaKH)
go

--  Tạo khóa ngoại FK_KHACHHANG_VS_TAIKHOAN
alter table TAIKHOAN
add constraint FK_KHACHHANG_VS_TAIKHOAN
foreign key (MaKH)
references KHACHHANG(MaKH)
go

--  Tạo khóa ngoại FK_KHACHHANG_VS_DV_THANHTOANQUATK
alter table DV_THANHTOANQUATK
add constraint FK_KHACHHANG_VS_DV_THANHTOANQUATK
foreign key (MaKH)
references KHACHHANG(MaKH)
go

--  Tạo khóa ngoại FK_GIAODICH_VS_CN_VS_DN_covon
alter table CN_VS_DN_covon
add constraint FK_GIAODICH_VS_CN_VS_DN_covon
foreign key (MaGD)
references GIAODICH(MaGD)
go


--  Tạo khóa ngoại FK_TAIKHOAN_VS_THETD
alter table THETD
add constraint FK_TAIKHOAN_VS_THETD
foreign key (MaTK)
references TAIKHOAN(MaTK)
go

--  Tạo khóa ngoại FK_TAIKHOAN_VS_THEGN
alter table THEGN
add constraint FK_TAIKHOAN_VS_THEGN
foreign key (MaTK)
references TAIKHOAN(MaTK)
go

--  Tạo khóa ngoại FK_CTY_VS_HOIPHIEU
alter table HOIPHIEU
add constraint FK_CTY_VS_HOIPHIEU
foreign key (MaCT)
references CTY(MaCT)
go

--  Tạo khóa ngoại FK_DICHVUTHANHTOAN_VS_DV_THANHTOANQUATK
alter table DV_THANHTOANQUATK
add constraint FK_DICHVUTHANHTOAN_VS_DV_THANHTOANQUATK
foreign key (MaDV)
references DICHVUTHANHTOAN(MaDV)
go



----------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------


alter table CHUNGCHI
add constraint FK_CHUNGCHI_VS_CN_VS_DN_covon
foreign key (MaKH)
references CN_VS_DN_covon(MaKH)
go

-- Tạo khóa ngoại FK_CHINHANH_VS_DV_THANHTOANQUATK
alter table DV_THANHTOANQUATK
add constraint FK_CHINHANH_VS_DV_THANHTOANQUATK
foreign key (MaCN)
references CHINHANH(MaCN)
go

--  Tạo khóa ngoại FK_CHINHANH_VS_CHUNGCHI
alter table CHUNGCHI
add constraint FK_CHINHANH_VS_CHUNGCHI
foreign key (MaCN)
references CHINHANH(MaCN)
go

--  Tạo khóa ngoại FK_CHINHANH_VS_GIAODICH
alter table GIAODICH
add constraint FK_CHINHANH_VS_GIAODICH
foreign key (MaCN)
references CHINHANH(MaCN)
go


--  Tạo khóa ngoại FK_CHINHANH_VS_KHOANVAY
alter table KHOANVAY
add constraint FK_CHINHANH_VS_KHOANVAY
foreign key (MaCN)
references CHINHANH(MaCN)
go

--  Tạo khóa ngoại FK_CHINHANH_VS_KHOANGUI
alter table KHOANGUI
add constraint FK_CHINHANH_VS_KHOANGUI
foreign key (MaCN)
references CHINHANH(MaCN)
go

--  Tạo khóa ngoại FK_CHINHANH_VS_TAIKHOAN
alter table TAIKHOAN
add constraint FK_CHINHANH_VS_TAIKHOAN
foreign key (MaCN)
references CHINHANH(MaCN)
go

--  Tạo khóa ngoại FK_CHINHANH_VS_HOIPHIEU
alter table HOIPHIEU
add constraint FK_CHINHANH_VS_HOIPHIEU
foreign key (MaCN)
references CHINHANH(MaCN)
go



--  Tạo khóa ngoại FK_KHACHHANG_VS_KHOANVAY
alter table KHOANVAY
add constraint FK_KHACHHANG_VS_KHOANVAY
foreign key (MaKH)
references KHACHHANG(MaKH)
go

--  Tạo khóa ngoại FK_KHACHHANG_VS_KHOANGUI
alter table KHOANGUI
add constraint FK_KHACHHANG_VS_KHOANGUI
foreign key (MaKH)
references KHACHHANG(MaKH)
go

--  Tạo khóa ngoại FK_KHACHHANG_VS_TAIKHOAN
alter table TAIKHOAN
add constraint FK_KHACHHANG_VS_TAIKHOAN
foreign key (MaKH)
references KHACHHANG(MaKH)
go

--  Tạo khóa ngoại FK_KHACHHANG_VS_DV_THANHTOANQUATK
alter table DV_THANHTOANQUATK
add constraint FK_KHACHHANG_VS_DV_THANHTOANQUATK
foreign key (MaKH)
references KHACHHANG(MaKH)
go


--  Tạo khóa ngoại FK_TAIKHOAN_VS_THETD
alter table THETD
add constraint FK_TAIKHOAN_VS_THETD
foreign key (MaTK)
references TAIKHOAN(MaTK)
go

--  Tạo khóa ngoại FK_TAIKHOAN_VS_THEGN
alter table THEGN
add constraint FK_TAIKHOAN_VS_THEGN
foreign key (MaTK)
references TAIKHOAN(MaTK)
go

--  Tạo khóa ngoại FK_CTY_VS_HOIPHIEU
alter table HOIPHIEU
add constraint FK_CTY_VS_HOIPHIEU
foreign key (MaCT)
references CTY(MaCT)
go

--  Tạo khóa ngoại FK_DICHVUTHANHTOAN_VS_DV_THANHTOANQUATK
alter table DV_THANHTOANQUATK
add constraint FK_DICHVUTHANHTOAN_VS_DV_THANHTOANQUATK
foreign key (MaDV)
references DICHVUTHANHTOAN(MaDV)
go

















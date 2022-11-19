

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
  Taisan bigint,
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
  Laisuat float,
  Thoihan int,
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
 TenKH nvarchar(100) not null,
 TgGiaoDich datetime,
 MaGD varchar(10) not null,
)
go

-- tạo bảng KHOANVAY
create table KHOANVAY
(
 MaGD varchar(10) primary key,
 LoaiVay nvarchar(50) not null,
 Laisuat float,
 MaKH varchar(10) not null,
)
go
-- tạo bảng KHOANGUI
create table KHOANGUI
(
 MaGD varchar(10) primary key,
 LoaiGui nvarchar(50) not null,
 Laisuat float,
 MaKH varchar(10) not null,
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
  Thoihan int,
  MaCVV varchar(20),
  MaTK varchar(20) not null,
)
go

-- Tạo bảng THEGN
create table THEGN
(
  MatheGN varchar(20) primary key,
  Thoihan int,
  MaCVV varchar(20),
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
-- Tạo khóa ngoại FK_CHINHANH_VS_DV_THANHTOANQUATK--
alter table DV_THANHTOANQUATK
add constraint FK_CHINHANH_VS_DV_THANHTOANQUATK
foreign key (MaCN)
references CHINHANH(MaCN)
go

--  Tạo khóa ngoại FK_CHINHANH_VS_CHUNGCHI--
alter table CHUNGCHI
add constraint FK_CHINHANH_VS_CHUNGCHI
foreign key (MaCN)
references CHINHANH(MaCN)
go

--  Tạo khóa ngoại FK_CHINHANH_VS_GIAODICH--
alter table GIAODICH
add constraint FK_CHINHANH_VS_GIAODICH
foreign key (MaCN)
references CHINHANH(MaCN)
go

--  Tạo khóa ngoại FK_CHINHANH_VS_TAIKHOAN
alter table TAIKHOAN
add constraint FK_CHINHANH_VS_TAIKHOAN
foreign key (MaCN)
references CHINHANH(MaCN)
go

--  Tạo khóa ngoại FK_CHINHANH_VS_HOIPHIEU --
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

--  Tạo khóa ngoại FK_KHACHHANG_VS_TAIKHOAN --
alter table TAIKHOAN
add constraint FK_KHACHHANG_VS_TAIKHOAN
foreign key (MaKH)
references KHACHHANG(MaKH)
go

--  Tạo khóa ngoại FK_KHACHHANG_VS_DV_THANHTOANQUATK --
alter table DV_THANHTOANQUATK
add constraint FK_KHACHHANG_VS_DV_THANHTOANQUATK
foreign key (MaKH)
references KHACHHANG(MaKH)
go

-- Tạo khóa ngoại FK_GIAODICH_VS_KHOANVAY++
alter table KHOANVAY
add constraint FK_GIAODICH_VS_KHOANVAY
foreign key (MaGD)
references GIAODICH(MaGD)
go


-- Tạo khóa ngoại FK_GIAODICH_VS_KHOANGUI++
alter table KHOANGUI
add constraint FK_GIAODICH_VS_KHOANGUI
foreign key (MaGD)
references GIAODICH(MaGD)
go

-- Tạo khóa ngoại FK_CN_VS_DN_covon_VS_CHUNGCHI
alter table CHUNGCHI
add constraint  FK_CN_VS_DN_covon_VS_CHUNGCHI
foreign key (MaKH)
references CN_VS_DN_covon(MaKH)
go

--  Tạo khóa ngoại FK_TAIKHOAN_VS_THETD
alter table THETD
add constraint FK_TAIKHOAN_VS_THETD
foreign key (MaTK)
references TAIKHOAN(MaTK)
go

--  Tạo khóa ngoại FK_TAIKHOAN_VS_THEGN --
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





-------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------


-- nhập data

-- bảng chinhanh
insert CHINHANH(MaCN,TenCN,Taisan,Diachi)
values ('MB291HĐ',N'Chi nhánh Hà Đông',N'7000 tỷ đồng',N'Q.Hà Đông, Hà Nội')
insert CHINHANH(MaCN,TenCN,Taisan,Diachi)
values ('MB296BT',N'Chi nhánh Minh Khai',N'7500 tỷ đồng',N'Q.Hai Bà Trưng, Hà Nội')
insert CHINHANH(MaCN,TenCN,Taisan,Diachi)
values ('MB298CG',N'Chi nhánh Cầu Giấy',N'6800 tỷ đồng',N'Q. Cầu Giấy, Hà Nội')
insert CHINHANH(MaCN,TenCN,Taisan,Diachi)
values ('MB170TB',N'Chi nhánh Thái Bình',N'7200 tỷ đồng',N'TP Thái Bình, Thái Bình')
insert CHINHANH(MaCN,TenCN,Taisan,Diachi)
values ('MB412SG',N'Chi nhánh Thủ Đức',N'8000 tỷ đồng',N'TP Thủ Đức, TP Hồ Chí MinH')


-- BẢNG KHACHHANG
INSERT KHACHHANG(MaKH,TenKH,SDT,Diachi)
VALUES ('291M03',N'Lê Việt Anh',N'0985634739',N'Q.Hà Đông, Hà Nội')
INSERT KHACHHANG(MaKH,TenKH,SDT,Diachi)
VALUES ('291F06',N'Nguyễn Thị Hồng',N'0896345710',N'Q. Hà Đông, Hà Nội')
INSERT KHACHHANG(MaKH,TenKH,SDT,Diachi)
VALUES ('298M26',N'Đỗ Hoàng Minh',N'0974631420',N'Q.Cầu Giấy, Hà Nội')
INSERT KHACHHANG(MaKH,TenKH,SDT,Diachi)
VALUES ('170F36',N'Vũ Thị Hoàng Hạnh',N'0963477103',N'H.Đông Hưng, Thái Bình')
INSERT KHACHHANG(MaKH,TenKH,SDT,Diachi)
VALUES ('170M82',N'Vũ Văn Khỏe',N'0896713640',N'TP.Thái Bình, Thái Bình')


-- BẢNG CHUNGCHI
INSERT CHUNGCHI(SoSR,TenChungChi,NgayPH,Laisuat,Thoihan,MaCN,MaKH)
VALUES ('1268443',N'Chứng chỉ tiền gửi ghi danh','06/18/2022',N'8.4%/năm',N'18 tháng','MB291HĐ','291DN003')
INSERT CHUNGCHI(SoSR,TenChungChi,NgayPH,Laisuat,Thoihan,MaCN,MaKH)
VALUES ('2672364',N'Chứng chỉ tiền gửi ghi danh','08/06/2022',N'7.5%/năm',N'6 tháng','MB298CG','298CN026')
INSERT CHUNGCHI(SoSR,TenChungChi,NgayPH,Laisuat,Thoihan,MaCN,MaKH)
VALUES ('3684026',N'Chứng chỉ tiền gửi vô danh','08/14/2022',N'8.2%/năm',N'15 tháng','MB170TB','170CN128')
INSERT CHUNGCHI(SoSR,TenChungChi,NgayPH,Laisuat,Thoihan,MaCN,MaKH)
VALUES ('3459145',N'Chứng chỉ tiền gửi ghi danh','08/14/2022',N'8.0%/năm',N'12 tháng','MB170TB','170CN230')
INSERT CHUNGCHI(SoSR,TenChungChi,NgayPH,Laisuat,Thoihan,MaCN,MaKH)
VALUES ('4526317',N'Chứng chỉ tiền gửi vô danh','08/26/2022',N'7.8%/năm',N'9 tháng','MB412SG','412DN320')



-- bảng cn_vs_dc_covon
insert CN_VS_DN_covon(MaKH,TenKH,TgGiaoDich,MaGD)
values ('291DN003',N'Doanh nghiệp trách nhiệm hữu hạn Lâm Quyết','06/18/2022','291180601')
insert CN_VS_DN_covon(MaKH,TenKH,TgGiaoDich,MaGD)
values ('298CN026',N'Phạm Văn Quyết','06-08-2022','298060803')
insert CN_VS_DN_covon(MaKH,TenKH,TgGiaoDich,MaGD)
values ('412DN320',N'Công ty Cổ phần sữa Mộc Châu','08/26/2022','412260896')
insert CN_VS_DN_covon(MaKH,TenKH,TgGiaoDich,MaGD)
values ('170CN128',N'Vũ Chiến Thắng','08/14/2022','0549971557')
insert CN_VS_DN_covon(MaKH,TenKH,TgGiaoDich,MaGD)
values ('170CN230',N'Phạm Thanh Tâm','08/14/2022','3478629762')


-- BẢNG GIAODICH
INSERT GIAODICH(MaGD,LoaiGD,NgayGD,NguoiGD,SotienGD,MaCN)
VALUES ('170TG001',N'Gửi tiền vào tài khoản','08/14/2022',N'Vũ Thị Hoàng Hạnh',N'7 triệu VNĐ','MB170TB')
INSERT GIAODICH(MaGD,LoaiGD,NgayGD,NguoiGD,SotienGD,MaCN)
VALUES ('298VT012',N'Vay tiền','08/16/2022',N'Đỗ Hoàng Minh',N'100 triệu VNĐ','MB298CG')
INSERT GIAODICH(MaGD,LoaiGD,NgayGD,NguoiGD,SotienGD,MaCN)
VALUES ('170VT036',N'Vay tiền','08/16/2022',N'Vũ Văn Khỏe',N'200 triệu VNĐ','MB170TB')
INSERT GIAODICH(MaGD,LoaiGD,NgayGD,NguoiGD,SotienGD,MaCN)
VALUES ('291TG063',N'Gửi tiền vào tài khoản','08/17/2022',N'Nguyễn Thị Hồng',N'18 triệu VNĐ','MB291HĐ')
INSERT GIAODICH(MaGD,LoaiGD,NgayGD,NguoiGD,SotienGD,MaCN)
VALUES ('291TG095',N'Vay tiền','08/19/2022',N'Lê Việt Anh',N'500 triệu VNĐ','MB291HĐ')



-- BẢNG KHOANVAY
INSERT KHOANVAY(MaKV,LoaiVay,Ngayvay,Laisuat,MaKH,MaCN)
VALUES ('298VT012',N'Vay tín chấp','08/16/2022',N'14.5%/năm','298M26','MB298CG')
INSERT KHOANVAY(MaKV,LoaiVay,Ngayvay,Laisuat,MaKH,MaCN)
VALUES ('170VT036',N'Vay thế chấp','08/16/2022',N'10.8%/năm','170M82','MB170TB')
INSERT KHOANVAY(MaKV,LoaiVay,Ngayvay,Laisuat,MaKH,MaCN)
VALUES ('291TG095',N'Vay thế chấp','09/18/2022',N'10.8%/năm','291M03','MB291HĐ')


-- BẢNG KHOANGUI
INSERT KHOANGUI(MaKG,LoaiGui,Ngaygui,Laisuat,MaKH,MaCN)
VALUES ('170TG001',N'Tiết kiệm không kỳ hạn','08/14/2022',N'5.5%/năm','170F36','MB170TB')
INSERT KHOANGUI(MaKG,LoaiGui,Ngaygui,Laisuat,MaKH,MaCN)
VALUES ('291TG063',N'Tiết kiệm có kỳ hạn','08/17/2022',N'6.0%/năm','291F06','MB291HĐ')


--BẢNG TAIKHOAN
INSERT TAIKHOAN(MaTK,NgayMo,SoDuTK,MaKH,MaCN)
VALUES ('291036716','05/14/2019',N'19 triệu VNĐ','291M03','MB291HĐ')
INSERT TAIKHOAN(MaTK,NgayMo,SoDuTK,MaKH,MaCN)
VALUES ('291036712','04/26/2020',N'27 triệu VNĐ','291F06','MB291HĐ')
INSERT TAIKHOAN(MaTK,NgayMo,SoDuTK,MaKH,MaCN)
VALUES ('298364135','07/14/2020',N'50 triệu VNĐ','298M26','MB298CG')
INSERT TAIKHOAN(MaTK,NgayMo,SoDuTK,MaKH,MaCN)
VALUES ('170368426','08/16/2020',N'67 triệu VNĐ','170F36','MB170TB')


-- BẢNG THETD
INSERT THETD(MatheTD,Thoihan,MaCVV,MaTK)
VALUES ('29101635',N'5 năm','096','291036716')
INSERT THETD(MatheTD,Thoihan,MaCVV,MaTK)
VALUES ('291016975',N'5 năm','082','291036712')
INSERT THETD(MatheTD,Thoihan,MaCVV,MaTK)
VALUES ('298014753',N'3 năm','365','298364135')
INSERT THETD(MatheTD,Thoihan,MaCVV,MaTK)
VALUES ('170013647',N'5 năm','475','170368426')


-- BẢNG THEGN
INSERT THEGN(MatheGN,Thoihan,MaCVV,MaTK,Loaithe)
VALUES ('291023647',N'10 năm','951','291036716',N'Nội địa')
INSERT THEGN(MatheGN,Thoihan,MaCVV,MaTK,Loaithe)
VALUES ('291023674',N'10 năm','614','291036712',N'Quốc tế')
INSERT THEGN(MatheGN,Thoihan,MaCVV,MaTK,Loaithe)
VALUES ('298022443',N'5 năm','024','298364135',N'Quốc tế')
INSERT THEGN(MatheGN,Thoihan,MaCVV,MaTK,Loaithe)
VALUES ('170023679',N'5 năm','366','170368426',N'Nội địa')



--BẢNG CTY
INSERT CTY(MaCT,TenCT,Diachi)
VALUES ('40CP003',N'Công ty cổ phần ô tô Trường Hải',N'TP. Thủ Đức, TP. HCM')
INSERT CTY(MaCT,TenCT,Diachi)
VALUES ('29TN036',N'Tập đoàn đá quý Doji',N'Q. Ba Đình, Hà Nội')
INSERT CTY(MaCT,TenCT,Diachi)
VALUES ('29CP047',N'Tập đoàn Hòa Phát',N'Q.Hai Bà Trưng. Hà Nội')
INSERT CTY(MaCT,TenCT,Diachi)
VALUES ('29TN056',N'Tập đoàn Viễn Thông Quân đội Việt Nam',N'Q.Từ Liêm, Hà Nội')


-- BẢNG HOIPHIEU
INSERT HOIPHIEU(MaHP,TenHP,TenCTphathanh,NgayPH,NgayDH,MaCT,MaCN)
VALUES ('003NH035',N'HP Ngân hàng',N'Công ty cổ phần ô tô Trường Hải','06/19/2022','09/19/2022','40CP003','MB291HĐ')
INSERT HOIPHIEU(MaHP,TenHP,TenCTphathanh,NgayPH,NgayDH,MaCT,MaCN)
VALUES ('036NH036',N'HP Ngân hàng',N'Tập đoàn đá quý Doji','06/20/2022','09/20/2022','29TN036','MB298CG')
INSERT HOIPHIEU(MaHP,TenHP,TenCTphathanh,NgayPH,NgayDH,MaCT,MaCN)
VALUES ('047NH039',N'HP Ngân hàng',N'Tập đoàn Hòa Phát','09/26/2022','12/26/2022','29CP047','MB296BT')
INSERT HOIPHIEU(MaHP,TenHP,TenCTphathanh,NgayPH,NgayDH,MaCT,MaCN)
VALUES ('056NH041',N'HP Ngân hàng',N'Tập đoàn Viễn Thông Quân đội Việt Nam','09/30/2022','12/30/2022','29TN056','MB170TB')


--BẢNG DỊCH VỤ THANH TOÁN
INSERT DICHVUTHANHTOAN(MaDV,TenDV,NgayPS_Dichvu)
VALUES('CT028',N'Chuyển tiền','10/22/2022')
INSERT DICHVUTHANHTOAN(MaDV,TenDV,NgayPS_Dichvu)
VALUES('CT029',N'Chuyển tiền','10/23/2022')
INSERT DICHVUTHANHTOAN(MaDV,TenDV,NgayPS_Dichvu)
VALUES('TT036',N'Thanh toán tiền nước','10/27/2022')

-- BẢNG  DỊCH VỤ THANH TOÁN QUA TÀI KHOẢN
INSERT DV_THANHTOANQUATK(MaLuotDV,MaDV,MaKH,MaCN)
VALUES ('291CT028','CT028','291M03','MB291HĐ')
INSERT DV_THANHTOANQUATK(MaLuotDV,MaDV,MaKH,MaCN)
VALUES ('296CT029','CT029','291F06','MB291HĐ')
INSERT DV_THANHTOANQUATK(MaLuotDV,MaDV,MaKH,MaCN)
VALUES ('298TT036','TT036','298M26','MB298CG')



--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------






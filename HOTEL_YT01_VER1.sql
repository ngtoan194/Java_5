USE MASTER
GO

DROP DATABASE HOTEL_YT01
GO

CREATE DATABASE HOTEL_YT01
GO

USE HOTEL_YT01
GO

CREATE TABLE NHAN_VIEN (
	ID_NV			INT		IDENTITY(0,1)	PRIMARY KEY,
	HO_TEN			NVARCHAR(50)			NOT NULL,
	GIOI_TINH		NVARCHAR(10)			NOT NULL,
	TUOI			INT						NOT NULL,
	ANH				NVARCHAR(MAX)			NOT NULL,
	STATUS			BIT						NOT NULL
)

CREATE TABLE TAI_KHOAN (
	ID_TK			INT		IDENTITY(0,1)	PRIMARY KEY,
	ID_NV			INT						NOT NULL,
	USER_NAME		NVARCHAR(50)			NOT NULL,
	PASS_WORD		NVARCHAR(50)			NOT NULL,
	STATUS			BIT						NOT NULL,
	
	CONSTRAINT FK_TK_NV_1 FOREIGN KEY (ID_NV) REFERENCES NHAN_VIEN(ID_NV)
)

CREATE TABLE LOAI_PHONG(
	ID_LP			INT						NOT NULL		PRIMARY KEY,
	TEN_LOAI		NVARCHAR(50)			NOT NULL,
	MO_TA			NVARCHAR(MAX)			NOT NULL,
	ANH				nvarchar(MAX)			NOT NULL,
)

CREATE TABLE PHONG(
	ID_PHONG		INT						NOT NULL		PRIMARY KEY,
	ID_LP			INT						NOT NULL,
	TEN_PHONG		NVARCHAR(50)			NOT NULL,
	ANH				nvarchar(MAX)			NOT NULL,
	GIOI_THIEU		nvarchar(MAX)			NOT NULL,
	SLPHONG			INT						NOT NULL,
	SLNGUOI			INT						NOT NULL,
	GIA_PHONG		FLOAT					NOT NULL,
	MOTA_1			nvarchar(MAX)			NULL,
	MOTA_2			nvarchar(MAX)			NULL,
	MOTA_3			nvarchar(MAX)			NULL,
	MOTA_4			nvarchar(MAX)			NULL,
	MOTA_5			nvarchar(MAX)			NULL,
	MOTA_6			nvarchar(MAX)			NULL,
	MOTA_7			nvarchar(MAX)			NULL,
	TIENICH_1		nvarchar(MAX)			NULL,
	TIENICH_2		nvarchar(MAX)			NULL,
	TIENICH_3		nvarchar(MAX)			NULL,
	TIENICH_4		nvarchar(MAX)			NULL,
	TIENICH_5		nvarchar(MAX)			NULL,
	TIENICH_6		nvarchar(MAX)			NULL,
	TIENICH_7		nvarchar(MAX)			NULL,
	TIENICH_8		nvarchar(MAX)			NULL,
	TIENICH_9		nvarchar(MAX)			NULL,
	TIENICH_10		nvarchar(MAX)			NULL,
	STATUS			BIT						NOT NULL,
	
	
	CONSTRAINT FK_LP_PHONG FOREIGN KEY (ID_LP) REFERENCES LOAI_PHONG(ID_LP)
)

CREATE TABLE DON_DAT_LOAI_PHONG(
	ID_DON_DLP VARCHAR(50) NOT NULL PRIMARY KEY,
	ID_LP INT NOT NULL,
	HO_TEN NVARCHAR(50) NOT NULL,
	EMAIL NVARCHAR(50) NOT NULL,
	SDT VARCHAR(20) NOT NULL,
	CMND VARCHAR(20) NOT NULL,
	SO_PHONG INT NOT NULL,
	NGAY_DEN DATETIME NOT NULL,
	NGAY_TRA DATETIME NOT NULL,
	GHI_CHU DATETIME NOT NULL,
	KIEU_THANH_TOAN NVARCHAR(50) NOT NULL,
	CONSTRAINT FK_DON_DAT_LOAI_PHONG_LOAI_PHONG FOREIGN KEY (ID_LP) REFERENCES LOAI_PHONG(ID_LP)
)


CREATE TABLE DICH_VU (
	ID_DV			INT IDENTITY(0,1)	PRIMARY KEY,
	TEN_DV			NVARCHAR(200)		NOT NULL,
	ANH				NVARCHAR(MAX)		NOT NULL,
	GIOI_THIEU		NVARCHAR(MAX)		NOT NULL,
	GIA				FLOAT				NOT NULL,
	MOTA_1			NVARCHAR(MAX)		NULL,
	MOTA_2			NVARCHAR(MAX)		NULL,
	MOTA_3			NVARCHAR(MAX)		NULL,
	MOTA_4			NVARCHAR(MAX)		NULL,
	MOTA_5			NVARCHAR(MAX)		NULL,

)

CREATE TABLE DAT_PHONG(
	ID_DAT_PHONG INT IDENTITY(001,1) PRIMARY KEY,
	ID_LP INT NOT NULL,
	ID_PHONG INT NOT NULL,
	ID_DON_DLP VARCHAR(50) NOT NULL,
	ID_NV INT NOT NULL,
	CODE VARCHAR(20) NOT NULL,
	
	CONSTRAINT FK_DAT_PHONG_LOAI_PHONG FOREIGN KEY (ID_LP) REFERENCES LOAI_PHONG(ID_LP),
	CONSTRAINT FK_DAT_PHONG_NHAN_VIEN FOREIGN KEY (ID_NV) REFERENCES NHAN_VIEN(ID_NV),
	CONSTRAINT FK_DAT_PHONG_PHONG FOREIGN KEY (ID_PHONG) REFERENCES PHONG(ID_PHONG),
	CONSTRAINT FK_DAT_PHONG_DON_DAT_LOAI_PHONG FOREIGN KEY (ID_DON_DLP) REFERENCES DON_DAT_LOAI_PHONG(ID_DON_DLP)
)

CREATE TABLE SU_DUNG_PHONG(
	ID INT IDENTITY(0,1) PRIMARY KEY,
	ID_DAT_PHONG INT NOT NULL,
	ID_PHONG INT NOT NULL,
	ID_DV INT NOT NULL,
	
	CONSTRAINT FK_SU_DUNG_PHONG_PHONG FOREIGN KEY (ID_PHONG) REFERENCES PHONG(ID_PHONG),
	CONSTRAINT FK_SU_DUNG_PHONG_DICH_VU FOREIGN KEY (ID_DV) REFERENCES DICH_VU(ID_DV),
	CONSTRAINT FK_SU_DUNG_PHONG_DAT_PHONG FOREIGN KEY (ID_DAT_PHONG) REFERENCES DAT_PHONG(ID_DAT_PHONG),
)

CREATE TABLE HOA_DON(
	ID_HOA_DON VARCHAR(50) NOT NULL PRIMARY KEY,
	ID_DAT_PHONG INT NOT NULL,
	CONSTRAINT FK_HOA_DON_DAT_PHONG FOREIGN KEY (ID_DAT_PHONG) REFERENCES DAT_PHONG(ID_DAT_PHONG)
)

CREATE TABLE SITE_CONFIGS(
	ID_CF INT IDENTITY(0,1) PRIMARY KEY,
	TEN_SITE NVARCHAR(50) NOT NULL,
	TEN_LOGO NVARCHAR(50) NOT NULL,
	ANH_SLIDE_1 NVARCHAR(200),
	ANH_SLIDE_2 NVARCHAR(200),
	ANH_SLIDE_3 NVARCHAR(200),
	ANH_SLIDE_4 NVARCHAR(200),
	INDEX_FOOTER_TITLE NVARCHAR(300),
	INDEX_FOOTER_SMALL_TITLE NVARCHAR(200),
	INDEX_FOOTER NVARCHAR(MAX),
	SERVICE_FOOTER_TITLE NVARCHAR(300),
	SERVICE_FOOTER_CONTENT NVARCHAR(MAX),
	BOOKING_FOOTER_TITLE_LEFT NVARCHAR(300),
	BOOKING_FOOTER_CONTENT_LEFT NVARCHAR(MAX),
	BOOKING_FOOTER_TITLE_RIGHT NVARCHAR(200),
	BOOKING_FOOTER_CONTENT_RIGHT NVARCHAR(MAX),
	CONTACT_FOOTER_TITLE_LEFT NVARCHAR(200),
	CONTACT_FOOTER_CONTENT_LEFT NVARCHAR(MAX),
	CONTACT_FOOTER_TITLE_RIGHT NVARCHAR(200),
	CONTACT_FOOTER_CONTENT_RIGHT NVARCHAR(MAX)
)

CREATE TABLE SITE_CONTACTS(
	ID_CT INT IDENTITY(0,1) PRIMARY KEY,
	TIEU_DE NVARCHAR(100) NOT NULL,
	PHONE_NUMBER VARCHAR(20),
	FAX NVARCHAR(20),
	EMAIL NVARCHAR(20)
)

CREATE TABLE PHAN_HOI (
	ID_PH INT IDENTITY(0,1) PRIMARY KEY,
	NAME NVARCHAR(100) NOT NULL,
	ADDRESS NVARCHAR(300) NOT NULL,
	EMAIL NVARCHAR(50) NOT NULL,
	CONTENT NVARCHAR(MAX) NOT NULL
)


SELECT * FROM LOAI_PHONG
INSERT INTO LOAI_PHONG VALUES (1,N'Tối cao',N'Là phòng tối cao','images/lp1.jpg')
INSERT INTO LOAI_PHONG VALUES (2,N'Cao cấp',N'Là phòng cao cấp','images/lp2.jpg')
INSERT INTO LOAI_PHONG VALUES (3,N'Sang trọng',N'Là phòng sang trọng','images/lp3.jpg')
INSERT INTO LOAI_PHONG VALUES (4,N'Gia Đình',N'Là phòng gia đình','images/lp4.jpg')
INSERT INTO LOAI_PHONG VALUES (5,N'Tiêu Chuẩn',N'Là phòng tiêu chuẩn','images/lp5.jpg')
INSERT INTO LOAI_PHONG VALUES (6,N'Thường',N'Là phòng thường','images/lp6.jpg')

SELECT * FROM PHONG WHERE ID_PHONG = 1


SELECT * FROM PHONG 
SELECT * FROM PHONG WHERE ID_PHONG = 1

INSERT INTO PHONG VALUES (1,1,N'Phòng Tối cao','images/room1.jpg',N'Là phòng Tối cao',3,1,2500000,N'Điều hòa hai chiều/Fully air-conditioned',N'Truyền hình cáp với TV 32 inch/Cab TV with TV 32 inch',N'Điện thoại gọi quôc tế/IDD Telephone',N'Wifi miễn phí/Complimentary Wi-Fi',N'Bathroom amenities',N'Tủ Mini Bar với những đồ uống để sẵn bên trong/Mini Bar',N'Két sắt an toàn cho những tài sản có giá trị/Private safety box',N'Free wi-fi',N'Hệ thống truyền hình cáp',N'Hệ thống internet không dây',N'Tắm đứng',N'Tủ chậu rửa với mặt ốp đá granite',N'Tivi LED Samsung 32-inch',N'Tủ mini bar',N'Két sắt',N'Ấm đun siêu tốc',N'Máy sấy tóc',1)
INSERT INTO PHONG VALUES (2,1,N'Phòng Tối cao','images/room1.jpg',N'Là phòng Tối cao',3,2,2300000,N'Điều hòa hai chiều/Fully air-conditioned',N'Truyền hình cáp với TV 32 inch/Cab TV with TV 32 inch',N'Điện thoại gọi quôc tế/IDD Telephone',N'Wifi miễn phí/Complimentary Wi-Fi',N'Bathroom amenities',N'Tủ Mini Bar với những đồ uống để sẵn bên trong/Mini Bar',N'Két sắt an toàn cho những tài sản có giá trị/Private safety box',N'Free wi-fi',N'Hệ thống truyền hình cáp',N'Hệ thống internet không dây',N'Tắm đứng',N'Tủ chậu rửa với mặt ốp đá granite',N'Tivi LED Samsung 32-inch',N'Tủ mini bar',N'Két sắt',N'Ấm đun siêu tốc',N'Máy sấy tóc',1)
INSERT INTO PHONG VALUES (3,1,N'Phòng Tối cao','images/room1.jpg',N'Là phòng Tối cao',3,3,2000000,N'Điều hòa hai chiều/Fully air-conditioned',N'Truyền hình cáp với TV 32 inch/Cab TV with TV 32 inch',N'Điện thoại gọi quôc tế/IDD Telephone',N'Wifi miễn phí/Complimentary Wi-Fi',N'Bathroom amenities',N'Tủ Mini Bar với những đồ uống để sẵn bên trong/Mini Bar',N'Két sắt an toàn cho những tài sản có giá trị/Private safety box',N'Free wi-fi',N'Hệ thống truyền hình cáp',N'Hệ thống internet không dây',N'Tắm đứng',N'Tủ chậu rửa với mặt ốp đá granite',N'Tivi LED Samsung 32-inch',N'Tủ mini bar',N'Két sắt',N'Ấm đun siêu tốc',N'Máy sấy tóc',1)

INSERT INTO PHONG VALUES (4,2,N'Phòng Cao cấp','images/room2.jpg',N'Là phòng Cao cấp',3,1,2000000,N'Điều hòa hai chiều/Fully air-conditioned',N'Truyền hình cáp với TV 32 inch/Cab TV with TV 32 inch',N'Điện thoại gọi quôc tế/IDD Telephone',N'Wifi miễn phí/Complimentary Wi-Fi',N'Bathroom amenities',N'Tủ Mini Bar với những đồ uống để sẵn bên trong/Mini Bar',N'Két sắt an toàn cho những tài sản có giá trị/Private safety box',N'Free wi-fi',N'Hệ thống truyền hình cáp',N'Hệ thống internet không dây',N'Tắm đứng',N'Tủ chậu rửa với mặt ốp đá granite',N'Tivi LED Samsung 32-inch',N'Tủ mini bar',N'Két sắt',N'Ấm đun siêu tốc',N'Máy sấy tóc',1)
INSERT INTO PHONG VALUES (5,2,N'Phòng Cao cấp','images/room2.jpg',N'Là phòng Cao cấp',3,2,1700000,N'Điều hòa hai chiều/Fully air-conditioned',N'Truyền hình cáp với TV 32 inch/Cab TV with TV 32 inch',N'Điện thoại gọi quôc tế/IDD Telephone',N'Wifi miễn phí/Complimentary Wi-Fi',N'Bathroom amenities',N'Tủ Mini Bar với những đồ uống để sẵn bên trong/Mini Bar',N'Két sắt an toàn cho những tài sản có giá trị/Private safety box',N'Free wi-fi',N'Hệ thống truyền hình cáp',N'Hệ thống internet không dây',N'Tắm đứng',N'Tủ chậu rửa với mặt ốp đá granite',N'Tivi LED Samsung 32-inch',N'Tủ mini bar',N'Két sắt',N'Ấm đun siêu tốc',N'Máy sấy tóc',1)
INSERT INTO PHONG VALUES (6,2,N'Phòng Cao cấp','images/room2.jpg',N'Là phòng Cao cấp',3,3,1500000,N'Điều hòa hai chiều/Fully air-conditioned',N'Truyền hình cáp với TV 32 inch/Cab TV with TV 32 inch',N'Điện thoại gọi quôc tế/IDD Telephone',N'Wifi miễn phí/Complimentary Wi-Fi',N'Bathroom amenities',N'Tủ Mini Bar với những đồ uống để sẵn bên trong/Mini Bar',N'Két sắt an toàn cho những tài sản có giá trị/Private safety box',N'Free wi-fi',N'Hệ thống truyền hình cáp',N'Hệ thống internet không dây',N'Tắm đứng',N'Tủ chậu rửa với mặt ốp đá granite',N'Tivi LED Samsung 32-inch',N'Tủ mini bar',N'Két sắt',N'Ấm đun siêu tốc',N'Máy sấy tóc',1)
INSERT INTO PHONG VALUES (7,2,N'Phòng Cao cấp','images/room2.jpg',N'Là phòng Cao cấp',3,4,1700000,N'Điều hòa hai chiều/Fully air-conditioned',N'Truyền hình cáp với TV 32 inch/Cab TV with TV 32 inch',N'Điện thoại gọi quôc tế/IDD Telephone',N'Wifi miễn phí/Complimentary Wi-Fi',N'Bathroom amenities',N'Tủ Mini Bar với những đồ uống để sẵn bên trong/Mini Bar',N'Két sắt an toàn cho những tài sản có giá trị/Private safety box',N'Free wi-fi',N'Hệ thống truyền hình cáp',N'Hệ thống internet không dây',N'Tắm đứng',N'Tủ chậu rửa với mặt ốp đá granite',N'Tivi LED Samsung 32-inch',N'Tủ mini bar',N'Két sắt',N'Ấm đun siêu tốc',N'Máy sấy tóc',1)

INSERT INTO PHONG VALUES (8,3,N'Phòng Sang trọng','images/room3.jpg',N'Là phòng Sang trọng',4,1,1700000,N'Điều hòa hai chiều/Fully air-conditioned',N'Truyền hình cáp với TV 32 inch/Cab TV with TV 32 inch',N'Điện thoại gọi quôc tế/IDD Telephone',N'Wifi miễn phí/Complimentary Wi-Fi',N'Bathroom amenities',N'Tủ Mini Bar với những đồ uống để sẵn bên trong/Mini Bar',N'Két sắt an toàn cho những tài sản có giá trị/Private safety box',N'Free wi-fi',N'Hệ thống truyền hình cáp',N'Hệ thống internet không dây',N'Tắm đứng',N'Tủ chậu rửa với mặt ốp đá granite',N'Tivi LED Samsung 32-inch',N'Tủ mini bar',N'Két sắt',N'Ấm đun siêu tốc',N'Máy sấy tóc',1)
INSERT INTO PHONG VALUES (9,3,N'Phòng Sang trọng','images/room3.jpg',N'Là phòng Sang trọng',4,2,1500000,N'Điều hòa hai chiều/Fully air-conditioned',N'Truyền hình cáp với TV 32 inch/Cab TV with TV 32 inch',N'Điện thoại gọi quôc tế/IDD Telephone',N'Wifi miễn phí/Complimentary Wi-Fi',N'Bathroom amenities',N'Tủ Mini Bar với những đồ uống để sẵn bên trong/Mini Bar',N'Két sắt an toàn cho những tài sản có giá trị/Private safety box',N'Free wi-fi',N'Hệ thống truyền hình cáp',N'Hệ thống internet không dây',N'Tắm đứng',N'Tủ chậu rửa với mặt ốp đá granite',N'Tivi LED Samsung 32-inch',N'Tủ mini bar',N'Két sắt',N'Ấm đun siêu tốc',N'Máy sấy tóc',1)
INSERT INTO PHONG VALUES (10,3,N'Phòng Sang trọng','images/room3.jpg',N'Là phòng Sang trọng',4,3,1300000,N'Điều hòa hai chiều/Fully air-conditioned',N'Truyền hình cáp với TV 32 inch/Cab TV with TV 32 inch',N'Điện thoại gọi quôc tế/IDD Telephone',N'Wifi miễn phí/Complimentary Wi-Fi',N'Bathroom amenities',N'Tủ Mini Bar với những đồ uống để sẵn bên trong/Mini Bar',N'Két sắt an toàn cho những tài sản có giá trị/Private safety box',N'Free wi-fi',N'Hệ thống truyền hình cáp',N'Hệ thống internet không dây',N'Tắm đứng',N'Tủ chậu rửa với mặt ốp đá granite',N'Tivi LED Samsung 32-inch',N'Tủ mini bar',N'Két sắt',N'Ấm đun siêu tốc',N'Máy sấy tóc',1)

INSERT INTO PHONG VALUES (11,4,N'Phòng Gia đình','images/room4.jpg',N'Là phòng Gia đình',7,3,1500000,N'Điều hòa hai chiều/Fully air-conditioned',N'Truyền hình cáp với TV 32 inch/Cab TV with TV 32 inch',N'Wifi miễn phí/Complimentary Wi-Fi',N'Bathroom amenities',N'Tủ Mini Bar với những đồ uống để sẵn bên trong/Mini Bar',N'',N'',N'Free wi-fi',N'Hệ thống truyền hình cáp',N'Hệ thống internet không dây',N'Tắm đứng',N'Tivi LED Samsung 32-inch',N'Tủ mini bar',N'Két sắt',N'Máy sấy tóc',N'',N'',1)
INSERT INTO PHONG VALUES (12,4,N'Phòng Gia đình','images/room4.jpg',N'Là phòng Gia đình',7,4,1300000,N'Điều hòa hai chiều/Fully air-conditioned',N'Truyền hình cáp với TV 32 inch/Cab TV with TV 32 inch',N'Wifi miễn phí/Complimentary Wi-Fi',N'Bathroom amenities',N'Tủ Mini Bar với những đồ uống để sẵn bên trong/Mini Bar',N'',N'',N'Free wi-fi',N'Hệ thống truyền hình cáp',N'Hệ thống internet không dây',N'Tắm đứng',N'Tivi LED Samsung 32-inch',N'Tủ mini bar',N'Két sắt',N'Máy sấy tóc',N'',N'',1)
INSERT INTO PHONG VALUES (13,4,N'Phòng Gia đình','images/room4.jpg',N'Là phòng Gia đình',7,5,1200000,N'Điều hòa hai chiều/Fully air-conditioned',N'Truyền hình cáp với TV 32 inch/Cab TV with TV 32 inch',N'Wifi miễn phí/Complimentary Wi-Fi',N'Bathroom amenities',N'Tủ Mini Bar với những đồ uống để sẵn bên trong/Mini Bar',N'',N'',N'Free wi-fi',N'Hệ thống truyền hình cáp',N'Hệ thống internet không dây',N'Tắm đứng',N'Tivi LED Samsung 32-inch',N'Tủ mini bar',N'Két sắt',N'Máy sấy tóc',N'',N'',1)

INSERT INTO PHONG VALUES (14,5,N'Phòng Tiêu chuẩn','images/room5.jpg',N'Là phòng Tiêu chuẩn',12,1,1200000,N'Điều hòa hai chiều/Fully air-conditioned',N'Truyền hình cáp với TV 32 inch/Cab TV with TV 32 inch',N'Wifi miễn phí/Complimentary Wi-Fi',N'Tủ Mini Bar với những đồ uống để sẵn bên trong/Mini Bar',N'',N'',N'',N'Free wi-fi',N'Hệ thống truyền hình cáp',N'Hệ thống internet không dây',N'Tắm đứng',N'Tivi LED Samsung 32-inch',N'Tủ mini bar',N'Máy sấy tóc',N'',N'',N'',1)
INSERT INTO PHONG VALUES (15,5,N'Phòng Tiêu chuẩn','images/room5.jpg',N'Là phòng Tiêu chuẩn',12,2,1000000,N'Điều hòa hai chiều/Fully air-conditioned',N'Truyền hình cáp với TV 32 inch/Cab TV with TV 32 inch',N'Wifi miễn phí/Complimentary Wi-Fi',N'Tủ Mini Bar với những đồ uống để sẵn bên trong/Mini Bar',N'',N'',N'',N'Free wi-fi',N'Hệ thống truyền hình cáp',N'Hệ thống internet không dây',N'Tắm đứng',N'Tivi LED Samsung 32-inch',N'Tủ mini bar',N'Máy sấy tóc',N'',N'',N'',1)
INSERT INTO PHONG VALUES (16,5,N'Phòng Tiêu chuẩn','images/room5.jpg',N'Là phòng Tiêu chuẩn',12,3,900000,N'Điều hòa hai chiều/Fully air-conditioned',N'Truyền hình cáp với TV 32 inch/Cab TV with TV 32 inch',N'Wifi miễn phí/Complimentary Wi-Fi',N'Tủ Mini Bar với những đồ uống để sẵn bên trong/Mini Bar',N'',N'',N'',N'Free wi-fi',N'Hệ thống truyền hình cáp',N'Hệ thống internet không dây',N'Tắm đứng',N'Tivi LED Samsung 32-inch',N'Tủ mini bar',N'Máy sấy tóc',N'',N'',N'',1)

INSERT INTO PHONG VALUES (17,6,N'Phòng Thường','images/room6.jpg',N'Là phòng Thường',20,1,700000,N'Điều hòa hai chiều/Fully air-conditioned',N'Truyền hình cáp với TV 32 inch/Cab TV with TV 32 inch',N'Wifi miễn phí/Complimentary Wi-Fi',N'Tủ Mini Bar với những đồ uống để sẵn bên trong/Mini Bar',N'',N'',N'',N'Free wi-fi',N'Hệ thống truyền hình cáp',N'Hệ thống internet không dây',N'Tắm đứng',N'Tivi LED Samsung 32-inch',N'Tủ mini bar',N'Máy sấy tóc',N'',N'',N'',1)
INSERT INTO PHONG VALUES (18,6,N'Phòng Thường','images/room6.jpg',N'Là phòng Thường',20,2,700000,N'Điều hòa hai chiều/Fully air-conditioned',N'Truyền hình cáp với TV 32 inch/Cab TV with TV 32 inch',N'Wifi miễn phí/Complimentary Wi-Fi',N'Tủ Mini Bar với những đồ uống để sẵn bên trong/Mini Bar',N'',N'',N'',N'Free wi-fi',N'Hệ thống truyền hình cáp',N'Hệ thống internet không dây',N'Tắm đứng',N'Tivi LED Samsung 32-inch',N'Tủ mini bar',N'Máy sấy tóc',N'',N'',N'',1)


SELECT * FROM DICH_VU
DELETE DICH_VU
INSERT INTO DICH_VU VALUES (N'Nhà hàng sang trọng','images/dv1.jpg',N'Nhà hàng trong khách sạn sẽ mang đến cho khách hàng những trải nghiệm phong cách ẩm thực khác nhau: Á, Âu...',0,N'Có phụ phí',N'Nhà hàng được trang trí một cách tao nhã và phục vụ quý khách những bữa ăn được chế biến công phu và đẹp mắt mang hương vị đặc trưng của những món ăn ngon nhất từ Âu đến Á. Đối với ẩm thực Việt, quý khách cũng có thể thưởng thức những món đặc sản của ba miền Việt Nam.',N'tầng 1',N' 6:00 sáng đến 11:00 khuya',N'300 người')
INSERT INTO DICH_VU VALUES (N'Quầy bar','images/dv2.jpg',N'Quầy bar thường là nơi khách hàng lui tới để thư giãn, trò chuyện và thưởng thức các loại rượu, cocktail…',99,N'Có phụ phí',N'Quầy bar thường là nơi khách hàng lui tới để thư giãn, trò chuyện và thưởng thức các loại rượu, cocktail…',N'tầng 15',N' 8:00 tối đến 12:00 đêm',N'100 người')
INSERT INTO DICH_VU VALUES (N'Dịch vụ Spa','images/dv3.jpg',N'Với những khách sạn tặng thêm dịch vụ Spa đi kèm với tiền phòng, sẽ khiến cho khách hàng ưu ái chọn dịch vụ của khách sạn nhiều hơn...',99,N'Có phụ phí',N'Với những khách sạn tặng thêm dịch vụ Spa đi kèm với tiền phòng, sẽ khiến cho khách hàng ưu ái chọn dịch vụ của khách sạn nhiều hơn...',N'tầng 14',N' 8:00 sáng đến 10:00 tối',N'69 người')
INSERT INTO DICH_VU VALUES (N'Fitness center','images/dv4.jpg',N'Nhiều khách hàng thường có thói quen tập thể dục để bắt đầu ngày mới hay rèn luyện như một thói quen hằng ngày, cho nên phòng tập thể dục là một dịch vụ không thể thiếu trong các khách sạn',10,N'Không có phụ phí',N'Nhiều khách hàng thường có thói quen tập thể dục để bắt đầu ngày mới hay rèn luyện như một thói quen hằng ngày, cho nên phòng tập thể dục là một dịch vụ không thể thiếu trong các khách sạn',N'tầng 13',N' 5:30 sáng đến 10:00 tối',N'100 người')
INSERT INTO DICH_VU VALUES (N'Dịch vụ hội họp','images/dv5.jpg',N'Dịch vụ hội họp với phòng họp, phòng hội nghị, phòng yến tiệc… sẽ phục vụ tốt nhu cầu của đối tượng khách là các doanh nghiệp.',300,N'Có phụ phí',N'Dịch vụ hội họp với phòng họp, phòng hội nghị, phòng yến tiệc… sẽ phục vụ tốt nhu cầu của đối tượng khách là các doanh nghiệp.',N'tầng 12',N' Có thể sắp xếp',N'300 người')
INSERT INTO DICH_VU VALUES (N'Dịch vụ văn phòng','images/dv6.jpg',N'Dịch vụ văn phòng sẽ bao gồm các tiện ích văn phòng như: máy tính kết nối Internet, máy in, máy photocopy...',0,N'Có phụ phí',N'Dịch vụ văn phòng sẽ bao gồm các tiện ích văn phòng như: máy tính kết nối Internet, máy in, máy photocopy...',N'tầng 2',N' 8:00 sáng đến 9:00 tối',N'50 người')
INSERT INTO DICH_VU VALUES (N'Dịch vụ giặt ủi quần áo','images/dv7.jpg',N'Với những khách hàng lưu trú dài ngày thì dịch vụ giặt áo quần áo là vô cùng cần thiết. Mỗi loại trang phục sẽ có một đơn giá tính phí khác nhau.',30,N'Có phụ phí',N'Với những khách hàng lưu trú dài ngày thì dịch vụ giặt áo quần áo là vô cùng cần thiết. Mỗi loại trang phục sẽ có một đơn giá tính phí khác nhau.',N'tầng hầm',N' 8:00 sáng đến 9:00 tối',N'')
INSERT INTO DICH_VU VALUES (N'Dịch vụ phòng 24/24','images/dv8.jpg',N'Khách hàng có thể gọi dịch vụ phòng 24/24 để được phục vụ thức ăn, đồ uống ngay tại phòng.',0,N'Có phụ phí',N'Khách hàng có thể gọi dịch vụ phòng 24/24 để được phục vụ thức ăn, đồ uống ngay tại phòng.',N'Khách sạn',N'24/24',N'')
INSERT INTO DICH_VU VALUES (N'Dịch vụ xe đưa đón sân bay','images/dv9.jpg',N'Nhiều khách sạn thường có dịch vụ xe đưa đón sân bay. Điều này sẽ khiến khách hàng cảm nhận được họ luôn được chào đón.',50,N'Có phụ phí',N'Nhiều khách sạn thường có dịch vụ xe đưa đón sân bay. Điều này sẽ khiến khách hàng cảm nhận được họ luôn được chào đón.',N'Khách sạn',N'24/24',N'Xe 4 chỗ, 7 chỗ, 16 chỗ')
INSERT INTO DICH_VU VALUES (N'Dịch vụ cho thuê tự lái','images/dv10.jpg',N'Đây là dịch vụ dành cho đối tượng khách muốn thuê xe để đi tham quan các điểm đến du lịch của địa phương.',99,N'Có phụ phí',N'Đây là dịch vụ dành cho đối tượng khách muốn thuê xe để đi tham quan các điểm đến du lịch của địa phương.',N'Khách sạn',N'24/24',N'Xe 4 chỗ, 7 chỗ, 16 chỗ')
INSERT INTO DICH_VU VALUES (N'Dịch vụ đặt vé máy bay, tour du lịch','images/dv11.jpg',N'Với những khách có nhu cầu đi tham quan các điểm du lịch của địa phương hay cần đặt vé máy bay để di chuyển thì hãy liên hệ nhân viên lễ tân khách sạn để được phục vụ.',99,N'Có phụ phí',N'Với những khách có nhu cầu đi tham quan các điểm du lịch của địa phương hay cần đặt vé máy bay để di chuyển thì hãy liên hệ nhân viên lễ tân khách sạn để được phục vụ.',N'Khách sạn',N'8:00 sáng đến 9:00 tối',N'')
INSERT INTO DICH_VU VALUES (N'Dịch vụ trông trẻ','images/dv12.jpg',N'Nhiều khách sạn 4 – 5 sao hiện nay đã có dịch vụ trông trẻ để hỗ trợ cho các khách hàng có con nhỏ.',99,N'Có phụ phí',N'Nhiều khách sạn 4 – 5 sao hiện nay đã có dịch vụ trông trẻ để hỗ trợ cho các khách hàng có con nhỏ.',N'Khách sạn',N'8:00 sáng đến 9:00 tối',N'')
INSERT INTO DICH_VU VALUES (N'Bể bơi 4 mùa','images/dv13.jpg',N'Bể bơi là một dịch vụ đi kèm không thể thiếu trong bất kỳ một khách sạn 4 – 5 sao nào. Bởi đây là nơi để du khách được thư giãn hay rèn luyện sức khỏe.',40,N'Không có phụ phí',N'Bể bơi là một dịch vụ đi kèm không thể thiếu trong bất kỳ một khách sạn 4 – 5 sao nào. Bởi đây là nơi để du khách được thư giãn hay rèn luyện sức khỏe.',N'Tầng 1',N'6:00 sáng đến 10:00 tối',N'69 người')
INSERT INTO DICH_VU VALUES (N'Dịch vụ karaoke','images/dv14.jpg',N'Dịch vụ này ra đời là nhằm đáp ứng nhu cầu cần không gian thư giãn, giải trí, ca hát với bạn bè, người thân của khách hàng.',20,N'Có phụ phí',N'Dịch vụ này ra đời là nhằm đáp ứng nhu cầu cần không gian thư giãn, giải trí, ca hát với bạn bè, người thân của khách hàng.',N'Tầng 11',N'8:00 sáng đến 12:00 tối',N'20 người')
INSERT INTO DICH_VU VALUES (N'Sân tennis','images/dv15.jpg',N'Nhiều khách hàng là doanh nhân thường rất thích đánh tennis cho nên đây là một dịch vụ không thể thiếu trong các khách sạn thương mại.',20,N'Có phụ phí',N'Nhiều khách hàng là doanh nhân thường rất thích đánh tennis cho nên đây là một dịch vụ không thể thiếu trong các khách sạn thương mại.',N'Sân tennis',N'5:30 sáng đến 10:00 tối',N'4 sân')




SELECT * FROM DICH_VU WHERE ID_DV = 0


SELECT * FROM NHAN_VIEN 
INSERT INTO NHAN_VIEN VALUES (N'Nguyen Toan',N'Nam',23,'images/PH04367.jpg',1)
INSERT INTO NHAN_VIEN VALUES (N'Vũ Ngọc Tuân',N'Nam',20,'images/PH04367.jpg',1)
INSERT INTO NHAN_VIEN VALUES (N'Đào Văn Thư',N'Nam',20,'images/PH04367.jpg',1)
INSERT INTO NHAN_VIEN VALUES (N'Nguyễn Hùng Mạnh',N'Nam',20,'images/PH04367.jpg',1)



SELECT * FROM TAI_KHOAN 
INSERT INTO TAI_KHOAN VALUES (0,'ngtoan','123',1)
INSERT INTO TAI_KHOAN VALUES (1,'vutuan','123',1)
INSERT INTO TAI_KHOAN VALUES (2,'daothu','123',1)
INSERT INTO TAI_KHOAN VALUES (3,'nguyenmanh','123',1)


SELECT* FROM TAI_KHOAN where USER_NAME = 'ngtoan' AND PASS_WORD = '123'




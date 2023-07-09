create database Java6
use  Java6;
create table Accounts(
Username nvarchar(20) primary key,
Password nvarchar(20) not null,
Email nvarchar(100) not null UNIQUE,
Admin bit not null,
Fullname nvarchar(100) not null,
Sdt nvarchar(11) UNIQUE,
Address nvarchar(200) not null,
Activated bit not null,
Image nvarchar(200) null,
);


insert Accounts values('admin','123','admin@gmail.com',1,N'Nguyễn Hoàng Anh Hào','0949442904',N'Kiên Giang',1,null)
insert Accounts values('dat','123','nv1@gmail.com',0,N'Dương Tấn Đạt','0949442903',N'Kiên Giang',1,null)
insert Accounts values('thien','123','nv2@gmail.com',0,N'Đoàn Minh Thiên','0949442902',N'TP.Cần Thơ',1,null)
insert Accounts values('son','123','nv3@gmail.com',0,N'Nguyễn Hoàng Sơn','0949442901',N'TP.Cần Thơ',1,null)
insert Accounts values('sang','123','nv4@gmail.com',0,N'Trần Văn Sang','0949442900',N'Hậu Giang',1,null)

create table Products(
Id bigint identity(1,1) primary key,
Name nvarchar(20) not null UNIQUE,
Quantity bigint not null,
Price float not null,
CreateDate date null,
Caterogyid bigint not null, 
Image nvarchar(500) null,
);



insert Products values(N'CÁT GỖ LOVE SAND',100,136000,null,1,null)
insert Products values(N'Lồng tĩnh điện',100,961000,null,1,null)
insert Products values(N'YẾM HỌA TIẾT CUTE',100,50000,null,1,null)
insert Products values(N'SỮA BIO MILK',100,156000,null,1,null)
insert Products values(N'GANADOR PUPPY',100,142000,null,1,null)
insert Products values(N'SỮA PREDOGEN CHO CÚN',100,190000,null,1,null)


create table Orders(
Id bigint identity(1,1) primary key,
Username nvarchar(20) not null,
Createdate date null,
Address nvarchar(200) not null,
);
insert Orders values(N'Admin',null,N'Kiên Giang')

create table OrderDetails(
Id bigint identity(1,1) primary key,
Orderid bigint  null,
Productid bigint  null,
Price float  null,
Quantity bigint  null,
Tong float  null,
);

create table Categories(
Id bigint identity(1,1) primary key,
Name nvarchar(250) null,
);
insert Categories values(N'Mèo')
insert Categories values(N'CÚN')


create table Carts(
Id bigint identity(1,1) primary key,
Username nvarchar(20) not null,
);



create table CartDetails(
Id bigint identity(1,1) primary key,
Cartid bigint not null,
Productid bigint not null,
Quantity bigint  null,
Createdate date  null,
);

create table Favorites(
Id bigint identity(1,1) primary key,
Username nvarchar(20) null,
Productid bigint null,
Createdate date  null,
);





ALTER TABLE dbo.CartDetails ADD FOREIGN KEY(Productid) REFERENCES dbo.Products(Id)
ALTER TABLE dbo.Products ADD FOREIGN KEY(Caterogyid) REFERENCES dbo.Categories(Id)
ALTER TABLE dbo.CartDetails ADD FOREIGN KEY(Cartid) REFERENCES dbo.Carts(Id)
ALTER TABLE dbo.OrderDetails ADD FOREIGN KEY(Orderid) REFERENCES dbo.Orders(Id)
ALTER TABLE dbo.Orderdetails ADD FOREIGN KEY(Productid) REFERENCES dbo.Products(Id)
ALTER TABLE dbo.Orders ADD FOREIGN KEY(Username) REFERENCES dbo.Accounts(Username)
ALTER TABLE dbo.Carts ADD FOREIGN KEY(Username) REFERENCES dbo.Accounts(Username)
ALTER TABLE dbo.Favorites ADD FOREIGN KEY(Username) REFERENCES dbo.Accounts(Username)
ALTER TABLE dbo.Favorites ADD FOREIGN KEY(Productid) REFERENCES dbo.Products(Id)



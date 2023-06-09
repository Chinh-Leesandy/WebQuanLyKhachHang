USE [master]
GO
/****** Object:  Database [QLTH_NB]    Script Date: 2023-05-11 6:42:47 PM ******/
CREATE DATABASE [QLTH_NB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QLTH_NB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.CSDLPTNHOM5\MSSQL\DATA\QLTH_NB.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'QLTH_NB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.CSDLPTNHOM5\MSSQL\DATA\QLTH_NB_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [QLTH_NB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QLTH_NB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QLTH_NB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QLTH_NB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QLTH_NB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QLTH_NB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QLTH_NB] SET ARITHABORT OFF 
GO
ALTER DATABASE [QLTH_NB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [QLTH_NB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QLTH_NB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QLTH_NB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QLTH_NB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QLTH_NB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QLTH_NB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QLTH_NB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QLTH_NB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QLTH_NB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [QLTH_NB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QLTH_NB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QLTH_NB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QLTH_NB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QLTH_NB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QLTH_NB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QLTH_NB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QLTH_NB] SET RECOVERY FULL 
GO
ALTER DATABASE [QLTH_NB] SET  MULTI_USER 
GO
ALTER DATABASE [QLTH_NB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QLTH_NB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QLTH_NB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QLTH_NB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [QLTH_NB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [QLTH_NB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'QLTH_NB', N'ON'
GO
ALTER DATABASE [QLTH_NB] SET QUERY_STORE = OFF
GO
USE [QLTH_NB]
GO
/****** Object:  User [HTKN]    Script Date: 2023-05-11 6:42:47 PM ******/
CREATE USER [HTKN] FOR LOGIN [HTKN] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [HTKN]
GO
/****** Object:  Table [dbo].[Branch]    Script Date: 2023-05-11 6:42:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Branch](
	[id_branch] [varchar](50) NOT NULL,
	[address] [nvarchar](255) NULL,
	[phoneNumber] [varchar](100) NOT NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
 CONSTRAINT [PK__Branch__ECC84CD983A49A9C] PRIMARY KEY CLUSTERED 
(
	[id_branch] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 2023-05-11 6:42:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[id] [varchar](50) NOT NULL,
	[Name] [nvarchar](250) NOT NULL,
	[phoneNumber] [varchar](100) NOT NULL,
	[Address] [nvarchar](max) NOT NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
 CONSTRAINT [PK__Customer__3213E83FB12310FA] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 2023-05-11 6:42:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[id_e] [varchar](50) NOT NULL,
	[FullName] [nvarchar](max) NOT NULL,
	[Role] [varchar](50) NOT NULL,
	[phoneNumber] [varchar](100) NOT NULL,
	[id_branch] [varchar](50) NOT NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
 CONSTRAINT [PK__Employee__9DB7D2F87E964740] PRIMARY KEY CLUSTERED 
(
	[id_e] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ticket]    Script Date: 2023-05-11 6:42:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ticket](
	[id] [varchar](50) NOT NULL,
	[ticketPrice] [float] NOT NULL,
	[discount] [float] NOT NULL,
	[seatType] [nvarchar](50) NOT NULL,
	[IdCustomer] [varchar](50) NOT NULL,
	[IdEmployee] [varchar](50) NOT NULL,
	[IdTrainRide] [varchar](50) NOT NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
 CONSTRAINT [PK__Ticket__3213E83F9A6268D2] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Branch] ([id_branch], [address], [phoneNumber], [rowguid]) VALUES (N'BNB009', N'Ninh Bình', N'0000000009', N'7fbd8061-45e8-ed11-82ab-089798af8ed5')
GO
INSERT [dbo].[Customer] ([id], [Name], [phoneNumber], [Address], [rowguid]) VALUES (N'CDB001', N'Nguyễn Minh Hiếu', N'0935251251', N'Thanh Bình-Điện Biên Phủ-Điện Biên', N'83bd8061-45e8-ed11-82ab-089798af8ed5')
INSERT [dbo].[Customer] ([id], [Name], [phoneNumber], [Address], [rowguid]) VALUES (N'CDB002', N'Trần Hoàng Long', N'0544931217', N'Minh Châu-Điện Biên Phủ-Điện Biên', N'84bd8061-45e8-ed11-82ab-089798af8ed5')
INSERT [dbo].[Customer] ([id], [Name], [phoneNumber], [Address], [rowguid]) VALUES (N'CDB003', N'Lê Trà My', N'0269475312', N'Lý Thường Kiệt-Yên Mỹ-Điện Biên', N'85bd8061-45e8-ed11-82ab-089798af8ed5')
INSERT [dbo].[Customer] ([id], [Name], [phoneNumber], [Address], [rowguid]) VALUES (N'CDB004', N'Phan Phương Anh', N'0564753126', N'Nậm Vì-Mường Nhé-Điện Biên', N'86bd8061-45e8-ed11-82ab-089798af8ed5')
INSERT [dbo].[Customer] ([id], [Name], [phoneNumber], [Address], [rowguid]) VALUES (N'CDB005', N'Lê Tấn Phát', N'0549626453', N'Quảng Lâm-Mường Nhé-Điện Biên', N'87bd8061-45e8-ed11-82ab-089798af8ed5')
INSERT [dbo].[Customer] ([id], [Name], [phoneNumber], [Address], [rowguid]) VALUES (N'CDB006', N'Bùi Thanh Trúc', N'0689463314', N'Huổi Só-Tủa Chùa-Điện Biên', N'88bd8061-45e8-ed11-82ab-089798af8ed5')
INSERT [dbo].[Customer] ([id], [Name], [phoneNumber], [Address], [rowguid]) VALUES (N'CDB007', N'Đào Trâm Anh', N'0676415414', N'Xín Chải-Tủa Chùa-Điện Biên', N'89bd8061-45e8-ed11-82ab-089798af8ed5')
INSERT [dbo].[Customer] ([id], [Name], [phoneNumber], [Address], [rowguid]) VALUES (N'CDB008', N'Huỳnh Quốc Bảo', N'0547934484', N'Tả Phình-Tủa Chùa-Điện Biên', N'8abd8061-45e8-ed11-82ab-089798af8ed5')
INSERT [dbo].[Customer] ([id], [Name], [phoneNumber], [Address], [rowguid]) VALUES (N'CDB009', N'Nguyễn Anh Tuấn', N'0679348706', N'Nà Tòng-Tuần Giáo-Điện Biên', N'8bbd8061-45e8-ed11-82ab-089798af8ed5')
INSERT [dbo].[Customer] ([id], [Name], [phoneNumber], [Address], [rowguid]) VALUES (N'CDB010', N'Phạm Hoàng Long', N'0932412651', N'Mường Thín-Tuần Giáo-Điện Biên', N'8cbd8061-45e8-ed11-82ab-089798af8ed5')
INSERT [dbo].[Customer] ([id], [Name], [phoneNumber], [Address], [rowguid]) VALUES (N'CDB011', N'Bùi Thanh Sáu', N'0689463314', N'Huổi Só-Tủa Chùa-Điện Biên', N'8dbd8061-45e8-ed11-82ab-089798af8ed5')
INSERT [dbo].[Customer] ([id], [Name], [phoneNumber], [Address], [rowguid]) VALUES (N'CDB012', N'Bùi Thanh Thảo', N'0689463314', N'Huổi Só-Tủa Chùa-Điện Biên', N'8ebd8061-45e8-ed11-82ab-089798af8ed5')
INSERT [dbo].[Customer] ([id], [Name], [phoneNumber], [Address], [rowguid]) VALUES (N'CHN001', N'Nguyễn Hoàng Nam', N'0246815489', N'Mộ Lao-Hà Đông-Hà Nội', N'8fbd8061-45e8-ed11-82ab-089798af8ed5')
INSERT [dbo].[Customer] ([id], [Name], [phoneNumber], [Address], [rowguid]) VALUES (N'CHN002', N'Nguyễn Như Ngọc', N'0544961517', N'Nguyễn Trãi-Hà Đông-Hà Nội', N'90bd8061-45e8-ed11-82ab-089798af8ed5')
INSERT [dbo].[Customer] ([id], [Name], [phoneNumber], [Address], [rowguid]) VALUES (N'CHN003', N'Nguyễn Ngọc Bảo', N'0245848789', N'Mai Dịch-Câu Giấy-Hà Nội', N'91bd8061-45e8-ed11-82ab-089798af8ed5')
INSERT [dbo].[Customer] ([id], [Name], [phoneNumber], [Address], [rowguid]) VALUES (N'CHN004', N'Hoàng Minh Hậu', N'0564754156', N'Nghĩa Đô-Cầu Giấy-Hà Nội', N'92bd8061-45e8-ed11-82ab-089798af8ed5')
INSERT [dbo].[Customer] ([id], [Name], [phoneNumber], [Address], [rowguid]) VALUES (N'CHN005', N'Lê Minh Quân', N'0545484842', N'Thanh Xuân-Hà Đông-Hà Nội', N'93bd8061-45e8-ed11-82ab-089798af8ed5')
INSERT [dbo].[Customer] ([id], [Name], [phoneNumber], [Address], [rowguid]) VALUES (N'CHN006', N'Bùi Văn Hoàng', N'0689463914', N'Ngọc Hà-Ba Đình-Hà Nội', N'94bd8061-45e8-ed11-82ab-089798af8ed5')
INSERT [dbo].[Customer] ([id], [Name], [phoneNumber], [Address], [rowguid]) VALUES (N'CHN007', N'Vũ Thị Lan', N'0654749156', N'Giảng Võ-Ba Đình-Hà Nội', N'95bd8061-45e8-ed11-82ab-089798af8ed5')
INSERT [dbo].[Customer] ([id], [Name], [phoneNumber], [Address], [rowguid]) VALUES (N'CHN008', N'Bùi Thị Ly', N'0547964484', N'Nguyễn Du-Hai Bà Trưng-Hà Nội', N'96bd8061-45e8-ed11-82ab-089798af8ed5')
INSERT [dbo].[Customer] ([id], [Name], [phoneNumber], [Address], [rowguid]) VALUES (N'CHN009', N'Nguyễn Cẩm Lan', N'0679948706', N'Minh Khai-Hai Bà Trưng-Hà Nội', N'97bd8061-45e8-ed11-82ab-089798af8ed5')
INSERT [dbo].[Customer] ([id], [Name], [phoneNumber], [Address], [rowguid]) VALUES (N'CHN010', N'Nguyễn Phú Minh', N'0947412651', N'Nhật Tân-Tây Hồ-Hà Nội', N'98bd8061-45e8-ed11-82ab-089798af8ed5')
INSERT [dbo].[Customer] ([id], [Name], [phoneNumber], [Address], [rowguid]) VALUES (N'CHN011', N'Nguyễn Phú Ninh', N'0947412651', N'Nhật Tân-Tây Hồ-Hà Nội', N'99bd8061-45e8-ed11-82ab-089798af8ed5')
INSERT [dbo].[Customer] ([id], [Name], [phoneNumber], [Address], [rowguid]) VALUES (N'CHP001', N'Chu Văn An', N'0945451251', N'An Đồng-An Dương-Hải Phòng', N'9abd8061-45e8-ed11-82ab-089798af8ed5')
INSERT [dbo].[Customer] ([id], [Name], [phoneNumber], [Address], [rowguid]) VALUES (N'CHP002', N'Phan Văn Học', N'0544961517', N'An Lư-Thủy Nguyên-Hải Phòng', N'9bbd8061-45e8-ed11-82ab-089798af8ed5')
INSERT [dbo].[Customer] ([id], [Name], [phoneNumber], [Address], [rowguid]) VALUES (N'CHP003', N'Nguyễn Minh Khôi', N'0269475415', N'An Thái-An Lão-Hải Phòng', N'9cbd8061-45e8-ed11-82ab-089798af8ed5')
INSERT [dbo].[Customer] ([id], [Name], [phoneNumber], [Address], [rowguid]) VALUES (N'CHP004', N'Hoàng Văn Nam', N'0564754156', N'Bát Tràng-An Lão-Hải Phòng', N'9dbd8061-45e8-ed11-82ab-089798af8ed5')
INSERT [dbo].[Customer] ([id], [Name], [phoneNumber], [Address], [rowguid]) VALUES (N'CHP005', N'Lê Ngọc Bảo', N'0549626456', N'Cao Nhân-Thủy Nguyên-Hải Phòng', N'9ebd8061-45e8-ed11-82ab-089798af8ed5')
INSERT [dbo].[Customer] ([id], [Name], [phoneNumber], [Address], [rowguid]) VALUES (N'CHP006', N'Bùi Minh Phương', N'0689463914', N'Cổ Am-Vĩnh Bảo-Hải Phòng', N'9fbd8061-45e8-ed11-82ab-089798af8ed5')
INSERT [dbo].[Customer] ([id], [Name], [phoneNumber], [Address], [rowguid]) VALUES (N'CHP007', N'Đào Ngọc Thảo', N'0676415414', N'Đồng Bài-Cát Hải-Hải Phòng', N'a0bd8061-45e8-ed11-82ab-089798af8ed5')
INSERT [dbo].[Customer] ([id], [Name], [phoneNumber], [Address], [rowguid]) VALUES (N'CHP008', N'Huỳnh Thúc Kháng', N'0547964484', N'Hùng Thắng-Tiên Lãng-Hải Phòng', N'a1bd8061-45e8-ed11-82ab-089798af8ed5')
INSERT [dbo].[Customer] ([id], [Name], [phoneNumber], [Address], [rowguid]) VALUES (N'CHP009', N'Nguyễn Thị Hiền', N'0679948706', N'Hữu Bằng-Kiến Thụy-Hải Phòngh', N'a2bd8061-45e8-ed11-82ab-089798af8ed5')
INSERT [dbo].[Customer] ([id], [Name], [phoneNumber], [Address], [rowguid]) VALUES (N'CHP010', N'Phạm Bảo Minh', N'0947412651', N'Lý Học-Vĩnh Bảo-Hải Phòng', N'a3bd8061-45e8-ed11-82ab-089798af8ed5')
INSERT [dbo].[Customer] ([id], [Name], [phoneNumber], [Address], [rowguid]) VALUES (N'CHT001', N'Nguyễn Minh Đức', N'0915451251', N'Đậu Liêu-Hồng Lĩnh-Hà Tĩnh', N'a4bd8061-45e8-ed11-82ab-089798af8ed5')
INSERT [dbo].[Customer] ([id], [Name], [phoneNumber], [Address], [rowguid]) VALUES (N'CHT002', N'Trần Thảo Vy', N'0544911517', N'Tây Sơn-Hương Sơn-Hà Tĩnh', N'a5bd8061-45e8-ed11-82ab-089798af8ed5')
INSERT [dbo].[Customer] ([id], [Name], [phoneNumber], [Address], [rowguid]) VALUES (N'CHT003', N'Lê Hải Đăng', N'0269475115', N'Quang Vĩnh-Đức Thọ-Hà Tĩnh', N'a6bd8061-45e8-ed11-82ab-089798af8ed5')
INSERT [dbo].[Customer] ([id], [Name], [phoneNumber], [Address], [rowguid]) VALUES (N'CHT004', N'Phan Thành Nhân', N'0564751156', N'Đức Lĩnh-Vũ Quang-Hà Tĩnh', N'a7bd8061-45e8-ed11-82ab-089798af8ed5')
INSERT [dbo].[Customer] ([id], [Name], [phoneNumber], [Address], [rowguid]) VALUES (N'CHT005', N'Lê Thanh Phong', N'0549626451', N'Xuân Phổ-Nghi Xuân-Hà Tĩnh', N'a8bd8061-45e8-ed11-82ab-089798af8ed5')
INSERT [dbo].[Customer] ([id], [Name], [phoneNumber], [Address], [rowguid]) VALUES (N'CHT006', N'Bùi Hoàng Minh', N'0689463114', N'Thuần Thiện-Can Lộc-Hà Tĩnh', N'a9bd8061-45e8-ed11-82ab-089798af8ed5')
INSERT [dbo].[Customer] ([id], [Name], [phoneNumber], [Address], [rowguid]) VALUES (N'CHT007', N'Đào Tiến Đạt', N'0676415114', N'Hà Linh-Hương Khê-Hà Tĩnh', N'aabd8061-45e8-ed11-82ab-089798af8ed5')
INSERT [dbo].[Customer] ([id], [Name], [phoneNumber], [Address], [rowguid]) VALUES (N'CHT008', N'Huỳnh Trà My', N'0547914484', N'Thạch Kênh-Thạch Hà-Hà Tĩnh', N'abbd8061-45e8-ed11-82ab-089798af8ed5')
INSERT [dbo].[Customer] ([id], [Name], [phoneNumber], [Address], [rowguid]) VALUES (N'CHT009', N'Nguyễn Thanh Ngân', N'0679148706', N'Cẩm Dương-Cẩm Xuyên-Hà Tĩnh', N'acbd8061-45e8-ed11-82ab-089798af8ed5')
INSERT [dbo].[Customer] ([id], [Name], [phoneNumber], [Address], [rowguid]) VALUES (N'CHT010', N'Phạm Gia Khang', N'0917412651', N'Kỳ Đồng-Kỳ Anh-Hà Tĩnh', N'adbd8061-45e8-ed11-82ab-089798af8ed5')
INSERT [dbo].[Customer] ([id], [Name], [phoneNumber], [Address], [rowguid]) VALUES (N'CHY001', N'Nguyễn Đức Hùng', N'0915451251', N'Việt Cường-Yên Mỹ-Hưng Yên', N'aebd8061-45e8-ed11-82ab-089798af8ed5')
INSERT [dbo].[Customer] ([id], [Name], [phoneNumber], [Address], [rowguid]) VALUES (N'CHY002', N'Trần Thị Huyền', N'0544911517', N'Minh Châu-Yên Mỹ-Hưng Yên', N'afbd8061-45e8-ed11-82ab-089798af8ed5')
INSERT [dbo].[Customer] ([id], [Name], [phoneNumber], [Address], [rowguid]) VALUES (N'CHY003', N'Lê Văn Thắng', N'0269475115', N'Lý Thường Kiệt-Yên Mỹ-Hưng Yên', N'b0bd8061-45e8-ed11-82ab-089798af8ed5')
INSERT [dbo].[Customer] ([id], [Name], [phoneNumber], [Address], [rowguid]) VALUES (N'CHY004', N'Phan Ngọc Hân', N'0564751156', N'Dương Quang-Mỹ Hào-Hưng Yên', N'b1bd8061-45e8-ed11-82ab-089798af8ed5')
INSERT [dbo].[Customer] ([id], [Name], [phoneNumber], [Address], [rowguid]) VALUES (N'CHY005', N'Lê Tường Vy', N'0549626451', N'Dị Sử-Mỹ Hào-Hưng Yên', N'b2bd8061-45e8-ed11-82ab-089798af8ed5')
INSERT [dbo].[Customer] ([id], [Name], [phoneNumber], [Address], [rowguid]) VALUES (N'CHY006', N'Bùi Anh Thư', N'0689463114', N'Bắc Sơn- n Thi-Hưng Yên', N'b3bd8061-45e8-ed11-82ab-089798af8ed5')
INSERT [dbo].[Customer] ([id], [Name], [phoneNumber], [Address], [rowguid]) VALUES (N'CHY007', N'Đào Gia Huy', N'0676415114', N'Tân Phúc- n Thi-Hưng Yên', N'b4bd8061-45e8-ed11-82ab-089798af8ed5')
INSERT [dbo].[Customer] ([id], [Name], [phoneNumber], [Address], [rowguid]) VALUES (N'CHY008', N'Huỳnh Gia Bảo', N'0547914484', N'Quang Vinh- n Thi-Hưng Yên', N'b5bd8061-45e8-ed11-82ab-089798af8ed5')
INSERT [dbo].[Customer] ([id], [Name], [phoneNumber], [Address], [rowguid]) VALUES (N'CHY009', N'Nguyễn Yến Nhi', N'0679148706', N'Tứ Dân-Khoái Châu-Hưng Yên', N'b6bd8061-45e8-ed11-82ab-089798af8ed5')
INSERT [dbo].[Customer] ([id], [Name], [phoneNumber], [Address], [rowguid]) VALUES (N'CHY010', N'Phạm Tuấn Kiệt', N'0917412651', N'Dân Tiến-Khoái Châu-Hưng Yên', N'b7bd8061-45e8-ed11-82ab-089798af8ed5')
INSERT [dbo].[Customer] ([id], [Name], [phoneNumber], [Address], [rowguid]) VALUES (N'CNB001', N'Vũ Kim Hoa', N'0945451251', N'Ninh Vân-Hoa Lư-Ninh Bình', N'b8bd8061-45e8-ed11-82ab-089798af8ed5')
INSERT [dbo].[Customer] ([id], [Name], [phoneNumber], [Address], [rowguid]) VALUES (N'CNB002', N'Phan Thanh Tùng', N'0541545415', N'Bắc Sơn-Tam Điệp-Ninh Bình', N'b9bd8061-45e8-ed11-82ab-089798af8ed5')
INSERT [dbo].[Customer] ([id], [Name], [phoneNumber], [Address], [rowguid]) VALUES (N'CNB003', N'Nguyễn Kim Chi', N'0245848789', N'Nam Thành-Ninh Bình-Ninh Bình', N'babd8061-45e8-ed11-82ab-089798af8ed5')
INSERT [dbo].[Customer] ([id], [Name], [phoneNumber], [Address], [rowguid]) VALUES (N'CNB004', N'Hoàng Văn Bách', N'0564754156', N'Ninh An-Hoa Lư-Ninh Bình', N'bbbd8061-45e8-ed11-82ab-089798af8ed5')
INSERT [dbo].[Customer] ([id], [Name], [phoneNumber], [Address], [rowguid]) VALUES (N'CNB005', N'Lê Minh Châu', N'0145489455', N'Kim Sơn-Ninh Bình-Ninh Bình', N'bcbd8061-45e8-ed11-82ab-089798af8ed5')
INSERT [dbo].[Customer] ([id], [Name], [phoneNumber], [Address], [rowguid]) VALUES (N'CNB006', N'Bùi Tú Linh', N'0689463914', N'Ninh Hải-Hoa Lư-Ninh Bình', N'bdbd8061-45e8-ed11-82ab-089798af8ed5')
INSERT [dbo].[Customer] ([id], [Name], [phoneNumber], [Address], [rowguid]) VALUES (N'CNB007', N'Đặng Nguyệt Minh', N'0654749156', N'Ninh Hải-Hoa Lư- Ninh Bình', N'bebd8061-45e8-ed11-82ab-089798af8ed5')
INSERT [dbo].[Customer] ([id], [Name], [phoneNumber], [Address], [rowguid]) VALUES (N'CNB008', N'Huỳnh Văn Phúc', N'0654846115', N'Ninh Khách-Ninh Bình-Ninh Bình', N'bfbd8061-45e8-ed11-82ab-089798af8ed5')
INSERT [dbo].[Customer] ([id], [Name], [phoneNumber], [Address], [rowguid]) VALUES (N'CNB009', N'Nguyễn Bích Ngọc', N'0948164942', N'Ninh Tiến-Hoa Lư-Ninh Bình', N'c0bd8061-45e8-ed11-82ab-089798af8ed5')
INSERT [dbo].[Customer] ([id], [Name], [phoneNumber], [Address], [rowguid]) VALUES (N'CNB010', N'Phạm Văn Hùng', N'0647456781', N'Yên Bình-Tam Điệp-Ninh Bình', N'c1bd8061-45e8-ed11-82ab-089798af8ed5')
INSERT [dbo].[Customer] ([id], [Name], [phoneNumber], [Address], [rowguid]) VALUES (N'CNB011', N'Hoàng Văn Hai', N'0564754156', N'Ninh An-Hoa Lư-Ninh Bình', N'c2bd8061-45e8-ed11-82ab-089798af8ed5')
INSERT [dbo].[Customer] ([id], [Name], [phoneNumber], [Address], [rowguid]) VALUES (N'CNB012', N'Hoàng Văn Bắc', N'0564754156', N'Ninh An-Hoa Lư-Ninh Bình', N'c3bd8061-45e8-ed11-82ab-089798af8ed5')
INSERT [dbo].[Customer] ([id], [Name], [phoneNumber], [Address], [rowguid]) VALUES (N'CNB013', N'Nguyễn Văn A', N'0948266582', N'Xuân Thành-Ninh Phong-Ninh Bình', N'59bd6c91-d1e9-ed11-b941-8f0d3c474d3c')
INSERT [dbo].[Customer] ([id], [Name], [phoneNumber], [Address], [rowguid]) VALUES (N'CNB015', N'Giang Tú Anh', N'094824182', N'Xuân Thành-Ninh Phong-Ninh Bình', N'9df852c3-1cef-ed11-b941-8f0d3c474d3c')
INSERT [dbo].[Customer] ([id], [Name], [phoneNumber], [Address], [rowguid]) VALUES (N'CNB016', N'Giang Tú Khanh', N'0948266582', N'Xuân Thành-Ninh Phong-Ninh Bình', N'e87b3524-1bef-ed11-b941-8f0d3c474d3c')
INSERT [dbo].[Customer] ([id], [Name], [phoneNumber], [Address], [rowguid]) VALUES (N'CNB017', N'Nguyễn Văn B', N'0948266582', N'Xuân Thành-Ninh Phong-Ninh Bình', N'3c52af01-cee9-ed11-b941-8f0d3c474d3c')
INSERT [dbo].[Customer] ([id], [Name], [phoneNumber], [Address], [rowguid]) VALUES (N'CND001', N'Nguyễn Châu Ninh', N'0315411251', N'Mỹ Tân-Mỹ Lộc-Nam Định', N'c4bd8061-45e8-ed11-82ab-089798af8ed5')
INSERT [dbo].[Customer] ([id], [Name], [phoneNumber], [Address], [rowguid]) VALUES (N'CND002', N'Trần Ngọc Như Ý', N'0543811517', N'Mỹ Thịnh-Mỹ Lộc-Nam Định', N'c5bd8061-45e8-ed11-82ab-089798af8ed5')
INSERT [dbo].[Customer] ([id], [Name], [phoneNumber], [Address], [rowguid]) VALUES (N'CND003', N'Lê Bảo Tân', N'0289471153', N'Cộng Hòa-Vụ Bản-Nam Định', N'c6bd8061-45e8-ed11-82ab-089798af8ed5')
INSERT [dbo].[Customer] ([id], [Name], [phoneNumber], [Address], [rowguid]) VALUES (N'CND004', N'Phan Phúc Ninh', N'0564781316', N'Trung Thành-Vụ Bản-Nam Định', N'c7bd8061-45e8-ed11-82ab-089798af8ed5')
INSERT [dbo].[Customer] ([id], [Name], [phoneNumber], [Address], [rowguid]) VALUES (N'CND005', N'Lê Nghĩa Trân', N'0549628431', N'Yên Chính-Ý Yên-Nam Định', N'c8bd8061-45e8-ed11-82ab-089798af8ed5')
INSERT [dbo].[Customer] ([id], [Name], [phoneNumber], [Address], [rowguid]) VALUES (N'CND006', N'Bùi Đạt Quốc Anh', N'0688463114', N'Yên Ninh-Ý Yên-Nam Định', N'c9bd8061-45e8-ed11-82ab-089798af8ed5')
INSERT [dbo].[Customer] ([id], [Name], [phoneNumber], [Address], [rowguid]) VALUES (N'CND007', N'Đào Hương Thảo', N'0676815314', N'Yên Nhân-Nghĩa Hưng-Nam Định', N'cabd8061-45e8-ed11-82ab-089798af8ed5')
INSERT [dbo].[Customer] ([id], [Name], [phoneNumber], [Address], [rowguid]) VALUES (N'CND008', N'Huỳnh Vân Thành', N'0487134484', N'Phúc Thắng-Nghĩa Hưng-Nam Định', N'cbbd8061-45e8-ed11-82ab-089798af8ed5')
INSERT [dbo].[Customer] ([id], [Name], [phoneNumber], [Address], [rowguid]) VALUES (N'CND009', N'Nguyễn Phương Manh', N'0673814706', N' Nam Cường-Nam Trực-Nam Định', N'ccbd8061-45e8-ed11-82ab-089798af8ed5')
INSERT [dbo].[Customer] ([id], [Name], [phoneNumber], [Address], [rowguid]) VALUES (N'CND010', N'Phạm Như Nhị', N'0917382651', N'Nam Hoa-Nam Trực-Nam Định', N'cdbd8061-45e8-ed11-82ab-089798af8ed5')
INSERT [dbo].[Customer] ([id], [Name], [phoneNumber], [Address], [rowguid]) VALUES (N'CND011', N'Phạm Như Hảo', N'0917382651', N'Nam Hoa-Nam Trực-Nam Định', N'cebd8061-45e8-ed11-82ab-089798af8ed5')
INSERT [dbo].[Customer] ([id], [Name], [phoneNumber], [Address], [rowguid]) VALUES (N'CND012', N'Phạm Như Tam', N'0917382651', N'Nam Hoa-Nam Trực-Nam Định', N'cfbd8061-45e8-ed11-82ab-089798af8ed5')
INSERT [dbo].[Customer] ([id], [Name], [phoneNumber], [Address], [rowguid]) VALUES (N'CPT001', N'Nguyễn Thùy Linh', N'0815451251', N'Dữu Lâu-Việt Trì-Phú Thọ', N'd0bd8061-45e8-ed11-82ab-089798af8ed5')
INSERT [dbo].[Customer] ([id], [Name], [phoneNumber], [Address], [rowguid]) VALUES (N'CPT002', N'Trần Lan Anh', N'0544811517', N'Phú Hộ-Phú Thọ-Phú Thọ', N'd1bd8061-45e8-ed11-82ab-089798af8ed5')
INSERT [dbo].[Customer] ([id], [Name], [phoneNumber], [Address], [rowguid]) VALUES (N'CPT003', N'Lê Tuyết Nhi', N'0289475115', N'Bằng Doãn-Đoan Hùng-Phú Thọ', N'd2bd8061-45e8-ed11-82ab-089798af8ed5')
INSERT [dbo].[Customer] ([id], [Name], [phoneNumber], [Address], [rowguid]) VALUES (N'CPT004', N'Phan Bảo Trâm', N'0564781156', N'Phương Viên-Hạ Hoà-Phú Thọ', N'd3bd8061-45e8-ed11-82ab-089798af8ed5')
INSERT [dbo].[Customer] ([id], [Name], [phoneNumber], [Address], [rowguid]) VALUES (N'CPT005', N'Lê Thảo My', N'0549628451', N'Đồng Xuân-Thanh Ba-Phú Thọ', N'd4bd8061-45e8-ed11-82ab-089798af8ed5')
INSERT [dbo].[Customer] ([id], [Name], [phoneNumber], [Address], [rowguid]) VALUES (N'CPT006', N'Bùi Thanh Vy', N'0688463114', N'Trạm Thản-Phù Ninh-Phú Thọ', N'd5bd8061-45e8-ed11-82ab-089798af8ed5')
INSERT [dbo].[Customer] ([id], [Name], [phoneNumber], [Address], [rowguid]) VALUES (N'CPT007', N'Đào Trung Kiên', N'0676815114', N'Đồng Lạc-Yên Lập-Phú Thọ', N'd6bd8061-45e8-ed11-82ab-089798af8ed5')
INSERT [dbo].[Customer] ([id], [Name], [phoneNumber], [Address], [rowguid]) VALUES (N'CPT008', N'Huỳnh Tuấn Khang', N'0487914484', N'Thụy Liễu-Cẩm Khê-Phú Thọ', N'd7bd8061-45e8-ed11-82ab-089798af8ed5')
INSERT [dbo].[Customer] ([id], [Name], [phoneNumber], [Address], [rowguid]) VALUES (N'CPT009', N'Nguyễn Nhật Huy', N'06798148706', N'Hiền Quan-Tam Nông-Phú Thọh', N'd8bd8061-45e8-ed11-82ab-089798af8ed5')
INSERT [dbo].[Customer] ([id], [Name], [phoneNumber], [Address], [rowguid]) VALUES (N'CPT010', N'Phạm Minh Khoa', N'0917482651', N'Tứ Xã-Lâm Thao-Phú Thọ', N'd9bd8061-45e8-ed11-82ab-089798af8ed5')
INSERT [dbo].[Customer] ([id], [Name], [phoneNumber], [Address], [rowguid]) VALUES (N'CPT011', N'Phạm Minh Trọng', N'0917482651', N'Tứ Xã-Lâm Thao-Phú Thọ', N'dabd8061-45e8-ed11-82ab-089798af8ed5')
INSERT [dbo].[Customer] ([id], [Name], [phoneNumber], [Address], [rowguid]) VALUES (N'CPT012', N'Phạm Minh Bùi', N'0917482651', N'Tứ Xã-Lâm Thao-Phú Thọ', N'dbbd8061-45e8-ed11-82ab-089798af8ed5')
INSERT [dbo].[Customer] ([id], [Name], [phoneNumber], [Address], [rowguid]) VALUES (N'CTB001', N'Nguyễn Châu Minh', N'0815411251', N'Quỳnh Lâm-Quỳnh Phụ-Thái Bình', N'dcbd8061-45e8-ed11-82ab-089798af8ed5')
INSERT [dbo].[Customer] ([id], [Name], [phoneNumber], [Address], [rowguid]) VALUES (N'CTB002', N'Trần Ngọc Như', N'0544811517', N'Tân Lễ-Hưng Hà-Thái Bình', N'ddbd8061-45e8-ed11-82ab-089798af8ed5')
INSERT [dbo].[Customer] ([id], [Name], [phoneNumber], [Address], [rowguid]) VALUES (N'CTB003', N'Lê Bảo Thiên', N'028947115', N'Đô Lương-Đông Hưng-Thái Bình', N'debd8061-45e8-ed11-82ab-089798af8ed5')
INSERT [dbo].[Customer] ([id], [Name], [phoneNumber], [Address], [rowguid]) VALUES (N'CTB004', N'Phan Phúc Minh', N'0564781116', N'Dương Phúc-Thái Thụy-Thái Bình', N'dfbd8061-45e8-ed11-82ab-089798af8ed5')
INSERT [dbo].[Customer] ([id], [Name], [phoneNumber], [Address], [rowguid]) VALUES (N'CTB005', N'Lê Nghĩa Trọng', N'0549628451', N'Vũ Lăng-Tiền Hải-Thái Bình', N'e0bd8061-45e8-ed11-82ab-089798af8ed5')
INSERT [dbo].[Customer] ([id], [Name], [phoneNumber], [Address], [rowguid]) VALUES (N'CTB006', N'Bùi Đạt Quốc', N'0688461114', N'Thượng Hiền-Kiến Xương-Thái Bình', N'e1bd8061-45e8-ed11-82ab-089798af8ed5')
INSERT [dbo].[Customer] ([id], [Name], [phoneNumber], [Address], [rowguid]) VALUES (N'CTB007', N'Đào Hương Quỳnh', N'0676815114', N'Tam Quang-Vũ Thư-Thái Bình', N'e2bd8061-45e8-ed11-82ab-089798af8ed5')
GO
INSERT [dbo].[Customer] ([id], [Name], [phoneNumber], [Address], [rowguid]) VALUES (N'CTB008', N'Huỳnh Vân Thanh', N'0487114484', N'An Khê-Quỳnh Phụ-Thái Bình', N'e3bd8061-45e8-ed11-82ab-089798af8ed5')
INSERT [dbo].[Customer] ([id], [Name], [phoneNumber], [Address], [rowguid]) VALUES (N'CTB009', N'Nguyễn Phương Mai', N'0679814706', N'Hòa Tiến-Hưng Hà-Thái Bình', N'e4bd8061-45e8-ed11-82ab-089798af8ed5')
INSERT [dbo].[Customer] ([id], [Name], [phoneNumber], [Address], [rowguid]) VALUES (N'CTB010', N'Phạm Như Tâm', N'0917482651', N'Liên Giang-Đông Hưng-Thái Bình', N'e5bd8061-45e8-ed11-82ab-089798af8ed5')
INSERT [dbo].[Customer] ([id], [Name], [phoneNumber], [Address], [rowguid]) VALUES (N'CTB011', N'Phạm Như Thanh', N'0917482651', N'Liên Giang-Đông Hưng-Thái Bình', N'e6bd8061-45e8-ed11-82ab-089798af8ed5')
INSERT [dbo].[Customer] ([id], [Name], [phoneNumber], [Address], [rowguid]) VALUES (N'CTB012', N'Phạm Như Khang', N'0917482651', N'Liên Giang-Đông Hưng-Thái Bình', N'e7bd8061-45e8-ed11-82ab-089798af8ed5')
GO
INSERT [dbo].[Employee] ([id_e], [FullName], [Role], [phoneNumber], [id_branch], [rowguid]) VALUES (N'E010', N'NGUYEN VAN A010', N'E', N'0000000000', N'BNB009', N'c5be8061-45e8-ed11-82ab-089798af8ed5')
INSERT [dbo].[Employee] ([id_e], [FullName], [Role], [phoneNumber], [id_branch], [rowguid]) VALUES (N'E040', N'NGUYEN VAN A040', N'E', N'0000000000', N'BNB009', N'e3be8061-45e8-ed11-82ab-089798af8ed5')
INSERT [dbo].[Employee] ([id_e], [FullName], [Role], [phoneNumber], [id_branch], [rowguid]) VALUES (N'E061', N'NGUYEN VAN A061', N'E', N'0000000000', N'BNB009', N'f8be8061-45e8-ed11-82ab-089798af8ed5')
INSERT [dbo].[Employee] ([id_e], [FullName], [Role], [phoneNumber], [id_branch], [rowguid]) VALUES (N'E098', N'NGUYEN VAN A098', N'E', N'0000000000', N'BNB009', N'1dbf8061-45e8-ed11-82ab-089798af8ed5')
INSERT [dbo].[Employee] ([id_e], [FullName], [Role], [phoneNumber], [id_branch], [rowguid]) VALUES (N'E099', N'NGUYEN VAN A099', N'E', N'0000000000', N'BNB009', N'1ebf8061-45e8-ed11-82ab-089798af8ed5')
INSERT [dbo].[Employee] ([id_e], [FullName], [Role], [phoneNumber], [id_branch], [rowguid]) VALUES (N'E100', N'NGUYEN VAN A100', N'E', N'0000000000', N'BNB009', N'1fbf8061-45e8-ed11-82ab-089798af8ed5')
GO
INSERT [dbo].[Ticket] ([id], [ticketPrice], [discount], [seatType], [IdCustomer], [IdEmployee], [IdTrainRide], [rowguid]) VALUES (N'TKBD018', 2, 0.08, N'eco', N'CHN006', N'E010', N'TrRiHP06', N'8ebf8061-45e8-ed11-82ab-089798af8ed5')
INSERT [dbo].[Ticket] ([id], [ticketPrice], [discount], [seatType], [IdCustomer], [IdEmployee], [IdTrainRide], [rowguid]) VALUES (N'TKBD040', 7, 0.02, N'eco', N'CHT007', N'E040', N'TrRiHY03', N'a4bf8061-45e8-ed11-82ab-089798af8ed5')
INSERT [dbo].[Ticket] ([id], [ticketPrice], [discount], [seatType], [IdCustomer], [IdEmployee], [IdTrainRide], [rowguid]) VALUES (N'TKBD069', 5, 0.03, N'eco', N'CND004', N'E061', N'TrRiND08', N'c1bf8061-45e8-ed11-82ab-089798af8ed5')
INSERT [dbo].[Ticket] ([id], [ticketPrice], [discount], [seatType], [IdCustomer], [IdEmployee], [IdTrainRide], [rowguid]) VALUES (N'TKBD119', 2, 0.08, N'eco', N'CHN001', N'E010', N'TrRiHP06', N'f3bf8061-45e8-ed11-82ab-089798af8ed5')
INSERT [dbo].[Ticket] ([id], [ticketPrice], [discount], [seatType], [IdCustomer], [IdEmployee], [IdTrainRide], [rowguid]) VALUES (N'TKBD141', 7, 0.02, N'eco', N'CHT004', N'E040', N'TrRiHY03', N'09c08061-45e8-ed11-82ab-089798af8ed5')
INSERT [dbo].[Ticket] ([id], [ticketPrice], [discount], [seatType], [IdCustomer], [IdEmployee], [IdTrainRide], [rowguid]) VALUES (N'TKBD170', 5, 0.03, N'eco', N'CND009', N'E061', N'TrRiND08', N'26c08061-45e8-ed11-82ab-089798af8ed5')
INSERT [dbo].[Ticket] ([id], [ticketPrice], [discount], [seatType], [IdCustomer], [IdEmployee], [IdTrainRide], [rowguid]) VALUES (N'TKBD220', 2, 0.08, N'eco', N'CHN004', N'E010', N'TrRiHP06', N'58c08061-45e8-ed11-82ab-089798af8ed5')
INSERT [dbo].[Ticket] ([id], [ticketPrice], [discount], [seatType], [IdCustomer], [IdEmployee], [IdTrainRide], [rowguid]) VALUES (N'TKBD242', 7, 0.02, N'eco', N'CHT007', N'E040', N'TrRiHY03', N'6ec08061-45e8-ed11-82ab-089798af8ed5')
INSERT [dbo].[Ticket] ([id], [ticketPrice], [discount], [seatType], [IdCustomer], [IdEmployee], [IdTrainRide], [rowguid]) VALUES (N'TKBD271', 5, 0.03, N'eco', N'CND002', N'E061', N'TrRiND08', N'8bc08061-45e8-ed11-82ab-089798af8ed5')
GO
/****** Object:  Index [MSmerge_index_933578364]    Script Date: 2023-05-11 6:42:48 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [MSmerge_index_933578364] ON [dbo].[Branch]
(
	[rowguid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [MSmerge_index_741577680]    Script Date: 2023-05-11 6:42:48 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [MSmerge_index_741577680] ON [dbo].[Customer]
(
	[rowguid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [MSmerge_index_965578478]    Script Date: 2023-05-11 6:42:48 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [MSmerge_index_965578478] ON [dbo].[Employee]
(
	[rowguid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [MSmerge_index_853578079]    Script Date: 2023-05-11 6:42:48 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [MSmerge_index_853578079] ON [dbo].[Ticket]
(
	[rowguid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Branch] ADD  CONSTRAINT [MSmerge_df_rowguid_FD621929A13C435694F8344386302A5D]  DEFAULT (newsequentialid()) FOR [rowguid]
GO
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [MSmerge_df_rowguid_2F174C74965F4603B9A91B2845D00DF8]  DEFAULT (newsequentialid()) FOR [rowguid]
GO
ALTER TABLE [dbo].[Employee] ADD  CONSTRAINT [MSmerge_df_rowguid_638B3B7695BC41DD830535651C81989F]  DEFAULT (newsequentialid()) FOR [rowguid]
GO
ALTER TABLE [dbo].[Ticket] ADD  CONSTRAINT [MSmerge_df_rowguid_45CF65FEB05F4FE2AC5E0560B56ECF6B]  DEFAULT (newsequentialid()) FOR [rowguid]
GO
ALTER TABLE [dbo].[Employee]  WITH NOCHECK ADD  CONSTRAINT [FK__Employee__id_bra__3B75D760] FOREIGN KEY([id_branch])
REFERENCES [dbo].[Branch] ([id_branch])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK__Employee__id_bra__3B75D760]
GO
ALTER TABLE [dbo].[Ticket]  WITH NOCHECK ADD  CONSTRAINT [FK__Ticket__IdCustom__34C8D9D1] FOREIGN KEY([IdCustomer])
REFERENCES [dbo].[Customer] ([id])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[Ticket] CHECK CONSTRAINT [FK__Ticket__IdCustom__34C8D9D1]
GO
ALTER TABLE [dbo].[Ticket]  WITH NOCHECK ADD  CONSTRAINT [FK__Ticket__IdEmploy__3C69FB99] FOREIGN KEY([IdEmployee])
REFERENCES [dbo].[Employee] ([id_e])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[Ticket] CHECK CONSTRAINT [FK__Ticket__IdEmploy__3C69FB99]
GO
USE [master]
GO
ALTER DATABASE [QLTH_NB] SET  READ_WRITE 
GO

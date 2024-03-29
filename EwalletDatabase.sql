USE [master]
GO
/****** Object:  Database [E_Wallet]    Script Date: 28/09/2022 01:03:52 ******/
CREATE DATABASE [E_Wallet]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'E_Wallet', FILENAME = N'D:\anh trai\SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\E_Wallet.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'E_Wallet_log', FILENAME = N'D:\anh trai\SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\E_Wallet_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [E_Wallet] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [E_Wallet].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [E_Wallet] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [E_Wallet] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [E_Wallet] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [E_Wallet] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [E_Wallet] SET ARITHABORT OFF 
GO
ALTER DATABASE [E_Wallet] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [E_Wallet] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [E_Wallet] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [E_Wallet] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [E_Wallet] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [E_Wallet] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [E_Wallet] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [E_Wallet] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [E_Wallet] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [E_Wallet] SET  DISABLE_BROKER 
GO
ALTER DATABASE [E_Wallet] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [E_Wallet] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [E_Wallet] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [E_Wallet] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [E_Wallet] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [E_Wallet] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [E_Wallet] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [E_Wallet] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [E_Wallet] SET  MULTI_USER 
GO
ALTER DATABASE [E_Wallet] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [E_Wallet] SET DB_CHAINING OFF 
GO
ALTER DATABASE [E_Wallet] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [E_Wallet] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [E_Wallet] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [E_Wallet] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [E_Wallet] SET QUERY_STORE = OFF
GO
USE [E_Wallet]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 28/09/2022 01:03:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[AccountID] [int] NOT NULL,
	[CurrentBalance] [money] NOT NULL,
	[Status] [tinyint] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[UserName] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[CustomerID] [int] NULL,
	[AccountTypeID] [tinyint] NULL,
	[ProviderID] [int] NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[AccountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AccountType]    Script Date: 28/09/2022 01:03:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccountType](
	[AccountType_ID] [tinyint] NOT NULL,
	[Description] [varchar](30) NULL,
	[AmountLimit] [money] NOT NULL,
 CONSTRAINT [PK_AccountType] PRIMARY KEY CLUSTERED 
(
	[AccountType_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BankAccount]    Script Date: 28/09/2022 01:03:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BankAccount](
	[BankCardID] [bigint] NOT NULL,
	[OwnerName] [varchar](100) NOT NULL,
	[BankID] [int] NOT NULL,
	[AccountID] [int] NOT NULL,
 CONSTRAINT [PK_BankAccount] PRIMARY KEY CLUSTERED 
(
	[BankCardID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Banks]    Script Date: 28/09/2022 01:03:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Banks](
	[BankID] [int] NOT NULL,
	[BankName] [varchar](100) NOT NULL,
	[Hotline] [nchar](12) NULL,
	[Email] [varchar](100) NULL,
 CONSTRAINT [PK_Banks] PRIMARY KEY CLUSTERED 
(
	[BankID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 28/09/2022 01:03:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[CustomerID] [int] NOT NULL,
	[CustomerName] [varchar](50) NOT NULL,
	[BirthDate] [date] NOT NULL,
	[Address] [varchar](50) NOT NULL,
	[PhoneNumber] [char](10) NOT NULL,
	[Gender] [tinyint] NOT NULL,
	[Email] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Promotion]    Script Date: 28/09/2022 01:03:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Promotion](
	[PromotionID] [int] NOT NULL,
	[ProDescription] [varchar](100) NULL,
	[AccountTypeID] [tinyint] NOT NULL,
 CONSTRAINT [PK_Promotion] PRIMARY KEY CLUSTERED 
(
	[PromotionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Provider]    Script Date: 28/09/2022 01:03:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Provider](
	[ProviderID] [int] NOT NULL,
	[ProviderName] [varchar](50) NOT NULL,
	[PhoneNumber] [varchar](10) NOT NULL,
	[Email] [varchar](50) NULL,
	[Address] [varchar](50) NULL,
	[Fax] [varchar](50) NULL,
 CONSTRAINT [PK_Provider] PRIMARY KEY CLUSTERED 
(
	[ProviderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Service]    Script Date: 28/09/2022 01:03:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Service](
	[ServiceID] [int] NOT NULL,
	[ServiceName] [varchar](50) NOT NULL,
	[Description] [varchar](100) NULL,
 CONSTRAINT [PK_Service] PRIMARY KEY CLUSTERED 
(
	[ServiceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ServiceProvider]    Script Date: 28/09/2022 01:03:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ServiceProvider](
	[ServiceID] [int] NOT NULL,
	[ProviderID] [int] NOT NULL,
 CONSTRAINT [PK_ServiceProvider] PRIMARY KEY CLUSTERED 
(
	[ServiceID] ASC,
	[ProviderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tranfers]    Script Date: 28/09/2022 01:03:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tranfers](
	[TransactionID] [int] NOT NULL,
	[TransactionDateTime] [datetime] NOT NULL,
	[AmountOfTransaction] [money] NOT NULL,
	[Status] [tinyint] NOT NULL,
	[BankCardID] [bigint] NOT NULL,
	[AccountID] [int] NOT NULL,
 CONSTRAINT [PK_Tranfers] PRIMARY KEY CLUSTERED 
(
	[TransactionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Transactions]    Script Date: 28/09/2022 01:03:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transactions](
	[TransactionID] [int] NOT NULL,
	[TransactionDateTime] [datetime] NOT NULL,
	[AmountOfTransaction] [money] NOT NULL,
	[ConfirmTime] [datetime] NULL,
	[StatusOfTransaction] [tinyint] NULL,
	[Message] [varchar](50) NULL,
	[AccountID] [int] NOT NULL,
	[ReceiverID] [int] NOT NULL,
	[TransactionTypeID] [int] NOT NULL,
	[ServiceID] [int] NULL,
 CONSTRAINT [PK_Transaction] PRIMARY KEY CLUSTERED 
(
	[TransactionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TransactionType]    Script Date: 28/09/2022 01:03:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TransactionType](
	[TransactionTypeID] [int] NOT NULL,
	[TransactionTypeName] [varchar](50) NOT NULL,
	[TransactionDescription] [varchar](50) NULL,
 CONSTRAINT [PK_TransactionType] PRIMARY KEY CLUSTERED 
(
	[TransactionTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Account] ([AccountID], [CurrentBalance], [Status], [CreateDate], [UserName], [Password], [CustomerID], [AccountTypeID], [ProviderID]) VALUES (1, 998000.0000, 1, CAST(N'2022-01-01T00:00:00.000' AS DateTime), N'vanhuynguyen152', N'Deptraicogisai152', 100000001, 1, NULL)
INSERT [dbo].[Account] ([AccountID], [CurrentBalance], [Status], [CreateDate], [UserName], [Password], [CustomerID], [AccountTypeID], [ProviderID]) VALUES (2, 1977000.0000, 1, CAST(N'2022-01-01T00:00:00.000' AS DateTime), N'namanhnguyen343', N'Deptraicogisai', 100000002, 1, NULL)
INSERT [dbo].[Account] ([AccountID], [CurrentBalance], [Status], [CreateDate], [UserName], [Password], [CustomerID], [AccountTypeID], [ProviderID]) VALUES (3, 2117000.0000, 1, CAST(N'2022-01-01T00:00:00.000' AS DateTime), N'thianh22', N'Xinhgai9980', 100000003, 1, NULL)
INSERT [dbo].[Account] ([AccountID], [CurrentBalance], [Status], [CreateDate], [UserName], [Password], [CustomerID], [AccountTypeID], [ProviderID]) VALUES (4, 3989000.0000, 1, CAST(N'2022-01-01T00:00:00.000' AS DateTime), N'tienanh1', N'123@3232', 100000004, 1, NULL)
INSERT [dbo].[Account] ([AccountID], [CurrentBalance], [Status], [CreateDate], [UserName], [Password], [CustomerID], [AccountTypeID], [ProviderID]) VALUES (5, 5079000.0000, 1, CAST(N'2022-01-01T00:00:00.000' AS DateTime), N'cuong999', N'Abc43232', 100000005, 2, NULL)
INSERT [dbo].[Account] ([AccountID], [CurrentBalance], [Status], [CreateDate], [UserName], [Password], [CustomerID], [AccountTypeID], [ProviderID]) VALUES (6, 2051000.0000, 1, CAST(N'2022-01-01T00:00:00.000' AS DateTime), N'dinhthao98', N'G3232@fd32', 100000006, 1, NULL)
INSERT [dbo].[Account] ([AccountID], [CurrentBalance], [Status], [CreateDate], [UserName], [Password], [CustomerID], [AccountTypeID], [ProviderID]) VALUES (7, 166000.0000, 1, CAST(N'2022-01-01T00:00:00.000' AS DateTime), N'namductran76', N'B@34213232', 100000007, 1, NULL)
INSERT [dbo].[Account] ([AccountID], [CurrentBalance], [Status], [CreateDate], [UserName], [Password], [CustomerID], [AccountTypeID], [ProviderID]) VALUES (8, 472000.0000, 1, CAST(N'2022-01-01T00:00:00.000' AS DateTime), N'tranthidieu2', N'1322002@3242abc', 100000008, 1, NULL)
INSERT [dbo].[Account] ([AccountID], [CurrentBalance], [Status], [CreateDate], [UserName], [Password], [CustomerID], [AccountTypeID], [ProviderID]) VALUES (9, 217000.0000, 1, CAST(N'2022-01-01T00:00:00.000' AS DateTime), N'buihoangvietanh7', N'3232@545432fgf', 100000009, 1, NULL)
INSERT [dbo].[Account] ([AccountID], [CurrentBalance], [Status], [CreateDate], [UserName], [Password], [CustomerID], [AccountTypeID], [ProviderID]) VALUES (10, 11017000.0000, 1, CAST(N'2022-01-01T00:00:00.000' AS DateTime), N'leanhtri0653', N'3232@312jyiew', 100000010, 2, NULL)
INSERT [dbo].[Account] ([AccountID], [CurrentBalance], [Status], [CreateDate], [UserName], [Password], [CustomerID], [AccountTypeID], [ProviderID]) VALUES (11, 19487000.0000, 1, CAST(N'2022-01-01T00:00:00.000' AS DateTime), N'chienthang1', N'874fav@fcas23', 100000011, 3, NULL)
INSERT [dbo].[Account] ([AccountID], [CurrentBalance], [Status], [CreateDate], [UserName], [Password], [CustomerID], [AccountTypeID], [ProviderID]) VALUES (12, 191000.0000, 1, CAST(N'2022-01-01T00:00:00.000' AS DateTime), N'phuongoanh293', N'32@543532', 100000012, 3, NULL)
INSERT [dbo].[Account] ([AccountID], [CurrentBalance], [Status], [CreateDate], [UserName], [Password], [CustomerID], [AccountTypeID], [ProviderID]) VALUES (13, 3346500.0000, 1, CAST(N'2022-01-01T00:00:00.000' AS DateTime), N'hoangthaonguyen33', N'Khongsokedichmanh322', 100000013, 3, NULL)
INSERT [dbo].[Account] ([AccountID], [CurrentBalance], [Status], [CreateDate], [UserName], [Password], [CustomerID], [AccountTypeID], [ProviderID]) VALUES (14, 259500.0000, 1, CAST(N'2022-01-01T00:00:00.000' AS DateTime), N'caokyduyen24', N'Chisodongdoiyeu87', 100000014, 1, NULL)
INSERT [dbo].[Account] ([AccountID], [CurrentBalance], [Status], [CreateDate], [UserName], [Password], [CustomerID], [AccountTypeID], [ProviderID]) VALUES (15, 18000.0000, 1, CAST(N'2022-01-01T00:00:00.000' AS DateTime), N'tronganhnguoc422', N'Cuocsongnaythatthuvi@88', 100000015, 1, NULL)
INSERT [dbo].[Account] ([AccountID], [CurrentBalance], [Status], [CreateDate], [UserName], [Password], [CustomerID], [AccountTypeID], [ProviderID]) VALUES (16, 66000.0000, 1, CAST(N'2022-01-01T00:00:00.000' AS DateTime), N'letienhoang85', N'KhongTheTinNoi@12', 100000016, 1, NULL)
INSERT [dbo].[Account] ([AccountID], [CurrentBalance], [Status], [CreateDate], [UserName], [Password], [CustomerID], [AccountTypeID], [ProviderID]) VALUES (17, 64000.0000, 1, CAST(N'2022-01-01T00:00:00.000' AS DateTime), N'hoangnamtien76', N'ThatVaySao434', 100000017, 1, NULL)
INSERT [dbo].[Account] ([AccountID], [CurrentBalance], [Status], [CreateDate], [UserName], [Password], [CustomerID], [AccountTypeID], [ProviderID]) VALUES (18, 75000.0000, 1, CAST(N'2022-01-01T00:00:00.000' AS DateTime), N'nguyentrannamanh32', N'QuaGk3Gom111', 100000018, 1, NULL)
INSERT [dbo].[Account] ([AccountID], [CurrentBalance], [Status], [CreateDate], [UserName], [Password], [CustomerID], [AccountTypeID], [ProviderID]) VALUES (19, 108000.0000, 1, CAST(N'2022-01-01T00:00:00.000' AS DateTime), N'truongquynhanh003', N'CuocSongNay@76', 100000019, 1, NULL)
INSERT [dbo].[Account] ([AccountID], [CurrentBalance], [Status], [CreateDate], [UserName], [Password], [CustomerID], [AccountTypeID], [ProviderID]) VALUES (20, 1562000.0000, 1, CAST(N'2022-01-01T00:00:00.000' AS DateTime), N'phamhau32', N'CaNhomThiTot@2022', 100000020, 3, NULL)
INSERT [dbo].[Account] ([AccountID], [CurrentBalance], [Status], [CreateDate], [UserName], [Password], [CustomerID], [AccountTypeID], [ProviderID]) VALUES (21, 80000.0000, 1, CAST(N'2022-01-01T00:00:00.000' AS DateTime), N'ViettelTelecom', N'ewallet@viettel21', NULL, 3, 1)
INSERT [dbo].[Account] ([AccountID], [CurrentBalance], [Status], [CreateDate], [UserName], [Password], [CustomerID], [AccountTypeID], [ProviderID]) VALUES (22, 100000.0000, 1, CAST(N'2022-01-01T00:00:00.000' AS DateTime), N'Mobifone', N'ewallet@Mobifone', NULL, 3, 2)
INSERT [dbo].[Account] ([AccountID], [CurrentBalance], [Status], [CreateDate], [UserName], [Password], [CustomerID], [AccountTypeID], [ProviderID]) VALUES (23, 0.0000, 1, CAST(N'2022-01-01T00:00:00.000' AS DateTime), N'Vinafone', N'ewallet@Vinafone', NULL, 3, 3)
INSERT [dbo].[Account] ([AccountID], [CurrentBalance], [Status], [CreateDate], [UserName], [Password], [CustomerID], [AccountTypeID], [ProviderID]) VALUES (24, 3000000.0000, 1, CAST(N'2022-01-01T00:00:00.000' AS DateTime), N'VietjetAir', N'ewallet@VietjetAir', NULL, 3, 4)
INSERT [dbo].[Account] ([AccountID], [CurrentBalance], [Status], [CreateDate], [UserName], [Password], [CustomerID], [AccountTypeID], [ProviderID]) VALUES (25, 0.0000, 1, CAST(N'2022-01-01T00:00:00.000' AS DateTime), N'BambooAirways', N'ewallet@BambooAirways', NULL, 3, 5)
INSERT [dbo].[Account] ([AccountID], [CurrentBalance], [Status], [CreateDate], [UserName], [Password], [CustomerID], [AccountTypeID], [ProviderID]) VALUES (26, 100000.0000, 1, CAST(N'2022-01-01T00:00:00.000' AS DateTime), N'CGVCinema', N'ewallet@CGVCinema', NULL, 3, 6)
INSERT [dbo].[Account] ([AccountID], [CurrentBalance], [Status], [CreateDate], [UserName], [Password], [CustomerID], [AccountTypeID], [ProviderID]) VALUES (27, 0.0000, 1, CAST(N'2022-01-01T00:00:00.000' AS DateTime), N'LotteCinema', N'ewallet@LotteCinema', NULL, 3, 7)
INSERT [dbo].[Account] ([AccountID], [CurrentBalance], [Status], [CreateDate], [UserName], [Password], [CustomerID], [AccountTypeID], [ProviderID]) VALUES (28, 100000.0000, 1, CAST(N'2022-01-01T00:00:00.000' AS DateTime), N'BHDCinema', N'ewallet@BHDCinema', NULL, 3, 8)
INSERT [dbo].[Account] ([AccountID], [CurrentBalance], [Status], [CreateDate], [UserName], [Password], [CustomerID], [AccountTypeID], [ProviderID]) VALUES (29, 0.0000, 1, CAST(N'2022-01-01T00:00:00.000' AS DateTime), N'GalaxyCinema', N'ewallet@GalaxyCinema', NULL, 3, 9)
INSERT [dbo].[Account] ([AccountID], [CurrentBalance], [Status], [CreateDate], [UserName], [Password], [CustomerID], [AccountTypeID], [ProviderID]) VALUES (30, 50000.0000, 1, CAST(N'2022-01-01T00:00:00.000' AS DateTime), N'Vietlott', N'ewallet@Vietlott', NULL, 3, 10)
INSERT [dbo].[Account] ([AccountID], [CurrentBalance], [Status], [CreateDate], [UserName], [Password], [CustomerID], [AccountTypeID], [ProviderID]) VALUES (31, 580000.0000, 1, CAST(N'2022-01-01T00:00:00.000' AS DateTime), N'EVN', N'ewallet@EVN', NULL, 3, 11)
INSERT [dbo].[Account] ([AccountID], [CurrentBalance], [Status], [CreateDate], [UserName], [Password], [CustomerID], [AccountTypeID], [ProviderID]) VALUES (32, 1520000.0000, 1, CAST(N'2022-01-01T00:00:00.000' AS DateTime), N'NuocsachHaNoi', N'ewallet@NuocsachHaNoi', NULL, 3, 12)
INSERT [dbo].[Account] ([AccountID], [CurrentBalance], [Status], [CreateDate], [UserName], [Password], [CustomerID], [AccountTypeID], [ProviderID]) VALUES (33, 300000.0000, 1, CAST(N'2022-01-01T00:00:00.000' AS DateTime), N'NuocsachHoChiMinh', N'ewallet@NuocsachHoChiMinh', NULL, 3, 13)
INSERT [dbo].[Account] ([AccountID], [CurrentBalance], [Status], [CreateDate], [UserName], [Password], [CustomerID], [AccountTypeID], [ProviderID]) VALUES (34, 19820000.0000, 1, CAST(N'2022-01-01T00:00:00.000' AS DateTime), N'PhamVanBach31', N'phamvanbach32', 100000021, 3, NULL)
INSERT [dbo].[Account] ([AccountID], [CurrentBalance], [Status], [CreateDate], [UserName], [Password], [CustomerID], [AccountTypeID], [ProviderID]) VALUES (35, 18900000.0000, 1, CAST(N'2022-01-01T00:00:00.000' AS DateTime), N'TranBachGiang54', N'tranbachgiangne1', 100000022, 3, NULL)
INSERT [dbo].[Account] ([AccountID], [CurrentBalance], [Status], [CreateDate], [UserName], [Password], [CustomerID], [AccountTypeID], [ProviderID]) VALUES (36, 21800000.0000, 1, CAST(N'2022-01-01T00:00:00.000' AS DateTime), N'NguyenTuanMinh223', N'nguyentuanminhdz243', 100000023, 3, NULL)
INSERT [dbo].[Account] ([AccountID], [CurrentBalance], [Status], [CreateDate], [UserName], [Password], [CustomerID], [AccountTypeID], [ProviderID]) VALUES (37, 22820000.0000, 1, CAST(N'2022-01-01T00:00:00.000' AS DateTime), N'NguyenThienThoi325', N'thienthoilatoi24', 100000024, 3, NULL)
INSERT [dbo].[Account] ([AccountID], [CurrentBalance], [Status], [CreateDate], [UserName], [Password], [CustomerID], [AccountTypeID], [ProviderID]) VALUES (38, 23580000.0000, 1, CAST(N'2022-01-01T00:00:00.000' AS DateTime), N'NguyenAnhVien464', N'anhviendang', 100000025, 3, NULL)
INSERT [dbo].[Account] ([AccountID], [CurrentBalance], [Status], [CreateDate], [UserName], [Password], [CustomerID], [AccountTypeID], [ProviderID]) VALUES (39, 24850000.0000, 1, CAST(N'2022-01-01T00:00:00.000' AS DateTime), N'TranNamCuong546', N'dangcaplanhatthoi14', 100000026, 3, NULL)
INSERT [dbo].[Account] ([AccountID], [CurrentBalance], [Status], [CreateDate], [UserName], [Password], [CustomerID], [AccountTypeID], [ProviderID]) VALUES (40, 25800000.0000, 1, CAST(N'2022-01-01T00:00:00.000' AS DateTime), N'TranThiTuyetVan123', N'khongthetinduoc12', 100000027, 3, NULL)
INSERT [dbo].[Account] ([AccountID], [CurrentBalance], [Status], [CreateDate], [UserName], [Password], [CustomerID], [AccountTypeID], [ProviderID]) VALUES (41, 26800000.0000, 1, CAST(N'2022-01-01T00:00:00.000' AS DateTime), N'NguyenTuyetNhung55', N'Oitroioi23', 100000028, 3, NULL)
INSERT [dbo].[Account] ([AccountID], [CurrentBalance], [Status], [CreateDate], [UserName], [Password], [CustomerID], [AccountTypeID], [ProviderID]) VALUES (42, 26900000.0000, 1, CAST(N'2022-01-01T00:00:00.000' AS DateTime), N'VuDucDo111', N'KhonKiep343', 100000029, 3, NULL)
INSERT [dbo].[Account] ([AccountID], [CurrentBalance], [Status], [CreateDate], [UserName], [Password], [CustomerID], [AccountTypeID], [ProviderID]) VALUES (43, 28800000.0000, 1, CAST(N'2022-01-01T00:00:00.000' AS DateTime), N'NguyenXuanPhuc', N'DauDauviNhagiau45', 100000030, 3, NULL)
INSERT [dbo].[Account] ([AccountID], [CurrentBalance], [Status], [CreateDate], [UserName], [Password], [CustomerID], [AccountTypeID], [ProviderID]) VALUES (51, 1977000.0000, 1, CAST(N'2022-02-01T00:00:00.000' AS DateTime), N'namanhnguyen343', N'Deptraicogisai', 100000002, 1, NULL)
INSERT [dbo].[Account] ([AccountID], [CurrentBalance], [Status], [CreateDate], [UserName], [Password], [CustomerID], [AccountTypeID], [ProviderID]) VALUES (52, 1977000.0000, 1, CAST(N'2022-02-01T00:00:00.000' AS DateTime), N'namanhnguyen343', N'Deptraicogisai', 100000002, 1, NULL)
INSERT [dbo].[Account] ([AccountID], [CurrentBalance], [Status], [CreateDate], [UserName], [Password], [CustomerID], [AccountTypeID], [ProviderID]) VALUES (53, 2450000.0000, 1, CAST(N'2022-03-01T00:00:00.000' AS DateTime), N'namanhnguyen343', N'Deptraicogisai', 100000002, 1, NULL)
INSERT [dbo].[Account] ([AccountID], [CurrentBalance], [Status], [CreateDate], [UserName], [Password], [CustomerID], [AccountTypeID], [ProviderID]) VALUES (54, 1977000.0000, 1, CAST(N'2022-03-01T00:00:00.000' AS DateTime), N'namanhnguyen343', N'Deptraicogisai', 100000002, 1, NULL)
INSERT [dbo].[Account] ([AccountID], [CurrentBalance], [Status], [CreateDate], [UserName], [Password], [CustomerID], [AccountTypeID], [ProviderID]) VALUES (55, 1977000.0000, 1, CAST(N'2022-04-01T00:00:00.000' AS DateTime), N'namanhnguyen343', N'Deptraicogisai', 100000002, 1, NULL)
INSERT [dbo].[Account] ([AccountID], [CurrentBalance], [Status], [CreateDate], [UserName], [Password], [CustomerID], [AccountTypeID], [ProviderID]) VALUES (56, 1977000.0000, 1, CAST(N'2022-04-01T00:00:00.000' AS DateTime), N'namanhnguyen343', N'Deptraicogisai', 100000002, 1, NULL)
INSERT [dbo].[Account] ([AccountID], [CurrentBalance], [Status], [CreateDate], [UserName], [Password], [CustomerID], [AccountTypeID], [ProviderID]) VALUES (57, 1977000.0000, 1, CAST(N'2022-05-01T00:00:00.000' AS DateTime), N'namanhnguyen343', N'Deptraicogisai', 100000002, 1, NULL)
INSERT [dbo].[Account] ([AccountID], [CurrentBalance], [Status], [CreateDate], [UserName], [Password], [CustomerID], [AccountTypeID], [ProviderID]) VALUES (58, 1977000.0000, 1, CAST(N'2022-06-01T00:00:00.000' AS DateTime), N'namanhnguyen343', N'Deptraicogisai', 100000002, 1, NULL)
INSERT [dbo].[Account] ([AccountID], [CurrentBalance], [Status], [CreateDate], [UserName], [Password], [CustomerID], [AccountTypeID], [ProviderID]) VALUES (59, 1977000.0000, 1, CAST(N'2022-07-01T00:00:00.000' AS DateTime), N'namanhnguyen343', N'Deptraicogisai', 100000002, 1, NULL)
INSERT [dbo].[Account] ([AccountID], [CurrentBalance], [Status], [CreateDate], [UserName], [Password], [CustomerID], [AccountTypeID], [ProviderID]) VALUES (60, 1977000.0000, 1, CAST(N'2022-08-01T00:00:00.000' AS DateTime), N'namanhnguyen343', N'Deptraicogisai', 100000002, 1, NULL)
INSERT [dbo].[Account] ([AccountID], [CurrentBalance], [Status], [CreateDate], [UserName], [Password], [CustomerID], [AccountTypeID], [ProviderID]) VALUES (70, 1977000.0000, 1, CAST(N'2022-02-01T00:00:00.000' AS DateTime), N'namanhnguyen343', N'Deptraicogisai', 100000002, 1, NULL)
INSERT [dbo].[Account] ([AccountID], [CurrentBalance], [Status], [CreateDate], [UserName], [Password], [CustomerID], [AccountTypeID], [ProviderID]) VALUES (71, 1977000.0000, 1, CAST(N'2022-02-01T00:00:00.000' AS DateTime), N'namanhnguyen343', N'Deptraicogisai', 100000002, 1, NULL)
INSERT [dbo].[Account] ([AccountID], [CurrentBalance], [Status], [CreateDate], [UserName], [Password], [CustomerID], [AccountTypeID], [ProviderID]) VALUES (72, 2450000.0000, 1, CAST(N'2022-03-01T00:00:00.000' AS DateTime), N'namanhnguyen343', N'Deptraicogisai', 100000002, 1, NULL)
INSERT [dbo].[Account] ([AccountID], [CurrentBalance], [Status], [CreateDate], [UserName], [Password], [CustomerID], [AccountTypeID], [ProviderID]) VALUES (73, 1977000.0000, 1, CAST(N'2022-03-01T00:00:00.000' AS DateTime), N'namanhnguyen343', N'Deptraicogisai', 100000002, 1, NULL)
INSERT [dbo].[Account] ([AccountID], [CurrentBalance], [Status], [CreateDate], [UserName], [Password], [CustomerID], [AccountTypeID], [ProviderID]) VALUES (74, 1977000.0000, 1, CAST(N'2022-04-01T00:00:00.000' AS DateTime), N'namanhnguyen343', N'Deptraicogisai', 100000002, 1, NULL)
INSERT [dbo].[Account] ([AccountID], [CurrentBalance], [Status], [CreateDate], [UserName], [Password], [CustomerID], [AccountTypeID], [ProviderID]) VALUES (75, 1977000.0000, 1, CAST(N'2022-04-01T00:00:00.000' AS DateTime), N'namanhnguyen343', N'Deptraicogisai', 100000002, 1, NULL)
INSERT [dbo].[Account] ([AccountID], [CurrentBalance], [Status], [CreateDate], [UserName], [Password], [CustomerID], [AccountTypeID], [ProviderID]) VALUES (76, 1977000.0000, 1, CAST(N'2022-05-01T00:00:00.000' AS DateTime), N'namanhnguyen343', N'Deptraicogisai', 100000002, 1, NULL)
INSERT [dbo].[Account] ([AccountID], [CurrentBalance], [Status], [CreateDate], [UserName], [Password], [CustomerID], [AccountTypeID], [ProviderID]) VALUES (77, 1977000.0000, 1, CAST(N'2022-06-01T00:00:00.000' AS DateTime), N'namanhnguyen343', N'Deptraicogisai', 100000002, 1, NULL)
INSERT [dbo].[Account] ([AccountID], [CurrentBalance], [Status], [CreateDate], [UserName], [Password], [CustomerID], [AccountTypeID], [ProviderID]) VALUES (78, 1977000.0000, 1, CAST(N'2022-07-01T00:00:00.000' AS DateTime), N'namanhnguyen343', N'Deptraicogisai', 100000002, 1, NULL)
INSERT [dbo].[Account] ([AccountID], [CurrentBalance], [Status], [CreateDate], [UserName], [Password], [CustomerID], [AccountTypeID], [ProviderID]) VALUES (79, 1977000.0000, 1, CAST(N'2022-08-01T00:00:00.000' AS DateTime), N'namanhnguyen343', N'Deptraicogisai', 100000002, 1, NULL)
INSERT [dbo].[Account] ([AccountID], [CurrentBalance], [Status], [CreateDate], [UserName], [Password], [CustomerID], [AccountTypeID], [ProviderID]) VALUES (80, 1977000.0000, 1, CAST(N'2022-02-01T00:00:00.000' AS DateTime), N'namanhnguyen343', N'Deptraicogisai', 100000002, 1, NULL)
INSERT [dbo].[Account] ([AccountID], [CurrentBalance], [Status], [CreateDate], [UserName], [Password], [CustomerID], [AccountTypeID], [ProviderID]) VALUES (81, 1977000.0000, 1, CAST(N'2022-02-01T00:00:00.000' AS DateTime), N'namanhnguyen343', N'Deptraicogisai', 100000002, 1, NULL)
INSERT [dbo].[Account] ([AccountID], [CurrentBalance], [Status], [CreateDate], [UserName], [Password], [CustomerID], [AccountTypeID], [ProviderID]) VALUES (82, 2450000.0000, 1, CAST(N'2022-03-01T00:00:00.000' AS DateTime), N'namanhnguyen343', N'Deptraicogisai', 100000002, 1, NULL)
INSERT [dbo].[Account] ([AccountID], [CurrentBalance], [Status], [CreateDate], [UserName], [Password], [CustomerID], [AccountTypeID], [ProviderID]) VALUES (83, 1977000.0000, 1, CAST(N'2022-03-01T00:00:00.000' AS DateTime), N'namanhnguyen343', N'Deptraicogisai', 100000002, 1, NULL)
INSERT [dbo].[Account] ([AccountID], [CurrentBalance], [Status], [CreateDate], [UserName], [Password], [CustomerID], [AccountTypeID], [ProviderID]) VALUES (84, 1977000.0000, 1, CAST(N'2022-04-01T00:00:00.000' AS DateTime), N'namanhnguyen343', N'Deptraicogisai', 100000002, 1, NULL)
INSERT [dbo].[Account] ([AccountID], [CurrentBalance], [Status], [CreateDate], [UserName], [Password], [CustomerID], [AccountTypeID], [ProviderID]) VALUES (85, 1977000.0000, 1, CAST(N'2022-04-01T00:00:00.000' AS DateTime), N'namanhnguyen343', N'Deptraicogisai', 100000002, 1, NULL)
INSERT [dbo].[Account] ([AccountID], [CurrentBalance], [Status], [CreateDate], [UserName], [Password], [CustomerID], [AccountTypeID], [ProviderID]) VALUES (86, 1977000.0000, 1, CAST(N'2022-05-01T00:00:00.000' AS DateTime), N'namanhnguyen343', N'Deptraicogisai', 100000002, 1, NULL)
INSERT [dbo].[Account] ([AccountID], [CurrentBalance], [Status], [CreateDate], [UserName], [Password], [CustomerID], [AccountTypeID], [ProviderID]) VALUES (87, 1977000.0000, 1, CAST(N'2022-06-01T00:00:00.000' AS DateTime), N'namanhnguyen343', N'Deptraicogisai', 100000002, 1, NULL)
INSERT [dbo].[Account] ([AccountID], [CurrentBalance], [Status], [CreateDate], [UserName], [Password], [CustomerID], [AccountTypeID], [ProviderID]) VALUES (88, 1977000.0000, 1, CAST(N'2022-07-01T00:00:00.000' AS DateTime), N'namanhnguyen343', N'Deptraicogisai', 100000002, 1, NULL)
INSERT [dbo].[Account] ([AccountID], [CurrentBalance], [Status], [CreateDate], [UserName], [Password], [CustomerID], [AccountTypeID], [ProviderID]) VALUES (89, 1977000.0000, 1, CAST(N'2022-08-01T00:00:00.000' AS DateTime), N'namanhnguyen343', N'Deptraicogisai', 100000002, 1, NULL)
INSERT [dbo].[Account] ([AccountID], [CurrentBalance], [Status], [CreateDate], [UserName], [Password], [CustomerID], [AccountTypeID], [ProviderID]) VALUES (90, 1977000.0000, 1, CAST(N'2022-02-01T00:00:00.000' AS DateTime), N'namanhnguyen343', N'Deptraicogisai', 100000002, 1, NULL)
INSERT [dbo].[Account] ([AccountID], [CurrentBalance], [Status], [CreateDate], [UserName], [Password], [CustomerID], [AccountTypeID], [ProviderID]) VALUES (91, 1977000.0000, 1, CAST(N'2022-02-01T00:00:00.000' AS DateTime), N'namanhnguyen343', N'Deptraicogisai', 100000002, 1, NULL)
INSERT [dbo].[Account] ([AccountID], [CurrentBalance], [Status], [CreateDate], [UserName], [Password], [CustomerID], [AccountTypeID], [ProviderID]) VALUES (92, 2450000.0000, 1, CAST(N'2022-03-01T00:00:00.000' AS DateTime), N'namanhnguyen343', N'Deptraicogisai', 100000002, 1, NULL)
INSERT [dbo].[Account] ([AccountID], [CurrentBalance], [Status], [CreateDate], [UserName], [Password], [CustomerID], [AccountTypeID], [ProviderID]) VALUES (93, 1977000.0000, 1, CAST(N'2022-03-01T00:00:00.000' AS DateTime), N'namanhnguyen343', N'Deptraicogisai', 100000002, 1, NULL)
INSERT [dbo].[Account] ([AccountID], [CurrentBalance], [Status], [CreateDate], [UserName], [Password], [CustomerID], [AccountTypeID], [ProviderID]) VALUES (94, 1977000.0000, 1, CAST(N'2022-04-01T00:00:00.000' AS DateTime), N'namanhnguyen343', N'Deptraicogisai', 100000002, 1, NULL)
INSERT [dbo].[Account] ([AccountID], [CurrentBalance], [Status], [CreateDate], [UserName], [Password], [CustomerID], [AccountTypeID], [ProviderID]) VALUES (95, 1977000.0000, 1, CAST(N'2022-04-01T00:00:00.000' AS DateTime), N'namanhnguyen343', N'Deptraicogisai', 100000002, 1, NULL)
INSERT [dbo].[Account] ([AccountID], [CurrentBalance], [Status], [CreateDate], [UserName], [Password], [CustomerID], [AccountTypeID], [ProviderID]) VALUES (96, 1977000.0000, 1, CAST(N'2022-05-01T00:00:00.000' AS DateTime), N'namanhnguyen343', N'Deptraicogisai', 100000002, 1, NULL)
INSERT [dbo].[Account] ([AccountID], [CurrentBalance], [Status], [CreateDate], [UserName], [Password], [CustomerID], [AccountTypeID], [ProviderID]) VALUES (97, 1977000.0000, 1, CAST(N'2022-06-01T00:00:00.000' AS DateTime), N'namanhnguyen343', N'Deptraicogisai', 100000002, 1, NULL)
INSERT [dbo].[Account] ([AccountID], [CurrentBalance], [Status], [CreateDate], [UserName], [Password], [CustomerID], [AccountTypeID], [ProviderID]) VALUES (100, 900000000000.0000, 1, CAST(N'2022-01-01T00:00:00.000' AS DateTime), N'MemeEwalletOwner', N'MemeEwallet@Owner', NULL, 3, 100)
INSERT [dbo].[Account] ([AccountID], [CurrentBalance], [Status], [CreateDate], [UserName], [Password], [CustomerID], [AccountTypeID], [ProviderID]) VALUES (110, 1977000.0000, 1, CAST(N'2022-07-01T00:00:00.000' AS DateTime), N'namanhnguyen343', N'Deptraicogisai', 100000002, 1, NULL)
INSERT [dbo].[Account] ([AccountID], [CurrentBalance], [Status], [CreateDate], [UserName], [Password], [CustomerID], [AccountTypeID], [ProviderID]) VALUES (120, 1977000.0000, 1, CAST(N'2022-08-01T00:00:00.000' AS DateTime), N'namanhnguyen343', N'Deptraicogisai', 100000002, 1, NULL)
INSERT [dbo].[Account] ([AccountID], [CurrentBalance], [Status], [CreateDate], [UserName], [Password], [CustomerID], [AccountTypeID], [ProviderID]) VALUES (130, 1977000.0000, 1, CAST(N'2022-02-01T00:00:00.000' AS DateTime), N'namanhnguyen343', N'Deptraicogisai', 100000002, 1, NULL)
INSERT [dbo].[Account] ([AccountID], [CurrentBalance], [Status], [CreateDate], [UserName], [Password], [CustomerID], [AccountTypeID], [ProviderID]) VALUES (150, 1977000.0000, 1, CAST(N'2022-02-01T00:00:00.000' AS DateTime), N'namanhnguyen343', N'Deptraicogisai', 100000002, 1, NULL)
INSERT [dbo].[Account] ([AccountID], [CurrentBalance], [Status], [CreateDate], [UserName], [Password], [CustomerID], [AccountTypeID], [ProviderID]) VALUES (151, 2450000.0000, 1, CAST(N'2022-03-01T00:00:00.000' AS DateTime), N'namanhnguyen343', N'Deptraicogisai', 100000002, 1, NULL)
INSERT [dbo].[Account] ([AccountID], [CurrentBalance], [Status], [CreateDate], [UserName], [Password], [CustomerID], [AccountTypeID], [ProviderID]) VALUES (152, 1977000.0000, 1, CAST(N'2022-03-01T00:00:00.000' AS DateTime), N'namanhnguyen343', N'Deptraicogisai', 100000002, 1, NULL)
INSERT [dbo].[Account] ([AccountID], [CurrentBalance], [Status], [CreateDate], [UserName], [Password], [CustomerID], [AccountTypeID], [ProviderID]) VALUES (153, 1977000.0000, 1, CAST(N'2022-04-01T00:00:00.000' AS DateTime), N'namanhnguyen343', N'Deptraicogisai', 100000002, 1, NULL)
INSERT [dbo].[Account] ([AccountID], [CurrentBalance], [Status], [CreateDate], [UserName], [Password], [CustomerID], [AccountTypeID], [ProviderID]) VALUES (154, 1977000.0000, 1, CAST(N'2022-04-01T00:00:00.000' AS DateTime), N'namanhnguyen343', N'Deptraicogisai', 100000002, 1, NULL)
INSERT [dbo].[Account] ([AccountID], [CurrentBalance], [Status], [CreateDate], [UserName], [Password], [CustomerID], [AccountTypeID], [ProviderID]) VALUES (155, 1977000.0000, 1, CAST(N'2022-05-01T00:00:00.000' AS DateTime), N'namanhnguyen343', N'Deptraicogisai', 100000002, 1, NULL)
INSERT [dbo].[Account] ([AccountID], [CurrentBalance], [Status], [CreateDate], [UserName], [Password], [CustomerID], [AccountTypeID], [ProviderID]) VALUES (156, 1977000.0000, 1, CAST(N'2022-06-01T00:00:00.000' AS DateTime), N'namanhnguyen343', N'Deptraicogisai', 100000002, 1, NULL)
INSERT [dbo].[Account] ([AccountID], [CurrentBalance], [Status], [CreateDate], [UserName], [Password], [CustomerID], [AccountTypeID], [ProviderID]) VALUES (157, 1977000.0000, 1, CAST(N'2022-07-01T00:00:00.000' AS DateTime), N'namanhnguyen343', N'Deptraicogisai', 100000002, 1, NULL)
INSERT [dbo].[Account] ([AccountID], [CurrentBalance], [Status], [CreateDate], [UserName], [Password], [CustomerID], [AccountTypeID], [ProviderID]) VALUES (158, 1977000.0000, 1, CAST(N'2022-08-01T00:00:00.000' AS DateTime), N'namanhnguyen343', N'Deptraicogisai', 100000002, 1, NULL)
INSERT [dbo].[Account] ([AccountID], [CurrentBalance], [Status], [CreateDate], [UserName], [Password], [CustomerID], [AccountTypeID], [ProviderID]) VALUES (159, 1977000.0000, 1, CAST(N'2022-02-01T00:00:00.000' AS DateTime), N'namanhnguyen343', N'Deptraicogisai', 100000002, 1, NULL)
INSERT [dbo].[Account] ([AccountID], [CurrentBalance], [Status], [CreateDate], [UserName], [Password], [CustomerID], [AccountTypeID], [ProviderID]) VALUES (160, 1977000.0000, 1, CAST(N'2022-02-01T00:00:00.000' AS DateTime), N'namanhnguyen343', N'Deptraicogisai', 100000002, 1, NULL)
INSERT [dbo].[Account] ([AccountID], [CurrentBalance], [Status], [CreateDate], [UserName], [Password], [CustomerID], [AccountTypeID], [ProviderID]) VALUES (161, 2450000.0000, 1, CAST(N'2022-03-01T00:00:00.000' AS DateTime), N'namanhnguyen343', N'Deptraicogisai', 100000002, 1, NULL)
INSERT [dbo].[Account] ([AccountID], [CurrentBalance], [Status], [CreateDate], [UserName], [Password], [CustomerID], [AccountTypeID], [ProviderID]) VALUES (162, 1977000.0000, 1, CAST(N'2022-03-01T00:00:00.000' AS DateTime), N'namanhnguyen343', N'Deptraicogisai', 100000002, 1, NULL)
INSERT [dbo].[Account] ([AccountID], [CurrentBalance], [Status], [CreateDate], [UserName], [Password], [CustomerID], [AccountTypeID], [ProviderID]) VALUES (163, 1977000.0000, 1, CAST(N'2022-04-01T00:00:00.000' AS DateTime), N'namanhnguyen343', N'Deptraicogisai', 100000002, 1, NULL)
INSERT [dbo].[Account] ([AccountID], [CurrentBalance], [Status], [CreateDate], [UserName], [Password], [CustomerID], [AccountTypeID], [ProviderID]) VALUES (164, 1977000.0000, 1, CAST(N'2022-04-01T00:00:00.000' AS DateTime), N'namanhnguyen343', N'Deptraicogisai', 100000002, 1, NULL)
GO
INSERT [dbo].[Account] ([AccountID], [CurrentBalance], [Status], [CreateDate], [UserName], [Password], [CustomerID], [AccountTypeID], [ProviderID]) VALUES (165, 1977000.0000, 1, CAST(N'2022-05-01T00:00:00.000' AS DateTime), N'namanhnguyen343', N'Deptraicogisai', 100000002, 1, NULL)
INSERT [dbo].[Account] ([AccountID], [CurrentBalance], [Status], [CreateDate], [UserName], [Password], [CustomerID], [AccountTypeID], [ProviderID]) VALUES (166, 1977000.0000, 1, CAST(N'2022-06-01T00:00:00.000' AS DateTime), N'namanhnguyen343', N'Deptraicogisai', 100000002, 1, NULL)
INSERT [dbo].[Account] ([AccountID], [CurrentBalance], [Status], [CreateDate], [UserName], [Password], [CustomerID], [AccountTypeID], [ProviderID]) VALUES (167, 1977000.0000, 1, CAST(N'2022-07-01T00:00:00.000' AS DateTime), N'namanhnguyen343', N'Deptraicogisai', 100000002, 1, NULL)
INSERT [dbo].[Account] ([AccountID], [CurrentBalance], [Status], [CreateDate], [UserName], [Password], [CustomerID], [AccountTypeID], [ProviderID]) VALUES (168, 1977000.0000, 1, CAST(N'2022-08-01T00:00:00.000' AS DateTime), N'namanhnguyen343', N'Deptraicogisai', 100000002, 1, NULL)
GO
INSERT [dbo].[AccountType] ([AccountType_ID], [Description], [AmountLimit]) VALUES (1, N'Bronze Member', 50000000.0000)
INSERT [dbo].[AccountType] ([AccountType_ID], [Description], [AmountLimit]) VALUES (2, N'Silver Member', 70000000.0000)
INSERT [dbo].[AccountType] ([AccountType_ID], [Description], [AmountLimit]) VALUES (3, N'Gold Member', 100000000.0000)
GO
INSERT [dbo].[BankAccount] ([BankCardID], [OwnerName], [BankID], [AccountID]) VALUES (9704012304343243, N'Nguyen Van Huy', 1, 1)
INSERT [dbo].[BankAccount] ([BankCardID], [OwnerName], [BankID], [AccountID]) VALUES (9704022304443243, N'Nguyen Thi Anh', 3, 3)
INSERT [dbo].[BankAccount] ([BankCardID], [OwnerName], [BankID], [AccountID]) VALUES (9704032303243243, N'Nguyen Tien Anh', 4, 4)
INSERT [dbo].[BankAccount] ([BankCardID], [OwnerName], [BankID], [AccountID]) VALUES (9704032435323232, N'Nguyen Nam Anh', 2, 2)
INSERT [dbo].[BankAccount] ([BankCardID], [OwnerName], [BankID], [AccountID]) VALUES (9704042301243243, N'Bui Viet Cuong', 5, 5)
INSERT [dbo].[BankAccount] ([BankCardID], [OwnerName], [BankID], [AccountID]) VALUES (9704052301243243, N'Dinh Thu Thao', 6, 6)
INSERT [dbo].[BankAccount] ([BankCardID], [OwnerName], [BankID], [AccountID]) VALUES (9704062301243243, N'Tran Duc Nam', 1, 7)
INSERT [dbo].[BankAccount] ([BankCardID], [OwnerName], [BankID], [AccountID]) VALUES (9704062301243245, N'Tran Thi Dieu', 1, 8)
INSERT [dbo].[BankAccount] ([BankCardID], [OwnerName], [BankID], [AccountID]) VALUES (9704072301243243, N'Bui Hoang Viet Anh', 2, 9)
INSERT [dbo].[BankAccount] ([BankCardID], [OwnerName], [BankID], [AccountID]) VALUES (9704082301243243, N'Nguyen Le Anh Tri', 3, 10)
INSERT [dbo].[BankAccount] ([BankCardID], [OwnerName], [BankID], [AccountID]) VALUES (9704092301243243, N'Nguyen Chien Thang', 4, 11)
INSERT [dbo].[BankAccount] ([BankCardID], [OwnerName], [BankID], [AccountID]) VALUES (9704102301243243, N'Pham Anh Thu', 5, 12)
INSERT [dbo].[BankAccount] ([BankCardID], [OwnerName], [BankID], [AccountID]) VALUES (9704112301243243, N'Nguyen Hoang Thao Nguyen', 6, 13)
INSERT [dbo].[BankAccount] ([BankCardID], [OwnerName], [BankID], [AccountID]) VALUES (9704122301243243, N'Nguyen Cao Ky Duyen', 1, 14)
INSERT [dbo].[BankAccount] ([BankCardID], [OwnerName], [BankID], [AccountID]) VALUES (9704132301243243, N'Truong Anh Ngoc', 2, 15)
INSERT [dbo].[BankAccount] ([BankCardID], [OwnerName], [BankID], [AccountID]) VALUES (9704142301243243, N'Le Tien Hoang', 3, 16)
INSERT [dbo].[BankAccount] ([BankCardID], [OwnerName], [BankID], [AccountID]) VALUES (9704152301243243, N'Hoang Nam Tien', 1, 17)
INSERT [dbo].[BankAccount] ([BankCardID], [OwnerName], [BankID], [AccountID]) VALUES (9704162301243243, N'Nguyen Tran Nam Anh', 1, 18)
INSERT [dbo].[BankAccount] ([BankCardID], [OwnerName], [BankID], [AccountID]) VALUES (9704172301243243, N'Truong Quynh Anh', 1, 19)
INSERT [dbo].[BankAccount] ([BankCardID], [OwnerName], [BankID], [AccountID]) VALUES (9704182301243243, N'Pham Van Hau', 2, 20)
INSERT [dbo].[BankAccount] ([BankCardID], [OwnerName], [BankID], [AccountID]) VALUES (9704192301243243, N'Pham Van Bach', 2, 34)
INSERT [dbo].[BankAccount] ([BankCardID], [OwnerName], [BankID], [AccountID]) VALUES (9704202301243243, N'Tran Bach Giang', 3, 35)
INSERT [dbo].[BankAccount] ([BankCardID], [OwnerName], [BankID], [AccountID]) VALUES (9704212301243243, N'Nguyen Tuan Minh', 4, 36)
INSERT [dbo].[BankAccount] ([BankCardID], [OwnerName], [BankID], [AccountID]) VALUES (9704222301243243, N'Nguyen Thi Anh Vien', 6, 38)
INSERT [dbo].[BankAccount] ([BankCardID], [OwnerName], [BankID], [AccountID]) VALUES (9704232301243243, N'Tran Nam Cuong', 1, 39)
INSERT [dbo].[BankAccount] ([BankCardID], [OwnerName], [BankID], [AccountID]) VALUES (9704242301243243, N'Tran Thi Tuyet Van', 1, 40)
INSERT [dbo].[BankAccount] ([BankCardID], [OwnerName], [BankID], [AccountID]) VALUES (9704252301243243, N'Nguyen Tuyet Nhung', 2, 41)
INSERT [dbo].[BankAccount] ([BankCardID], [OwnerName], [BankID], [AccountID]) VALUES (9704262301243243, N'Vu Duc Do', 3, 42)
INSERT [dbo].[BankAccount] ([BankCardID], [OwnerName], [BankID], [AccountID]) VALUES (9704272301243243, N'Nguyen Xuan Phuc', 3, 43)
INSERT [dbo].[BankAccount] ([BankCardID], [OwnerName], [BankID], [AccountID]) VALUES (9704282301243243, N'Nguyen Thien Thoi', 5, 37)
GO
INSERT [dbo].[Banks] ([BankID], [BankName], [Hotline], [Email]) VALUES (1, N'Vietcombank', N'1900545413  ', N'cskh@vietcombank.com.vn')
INSERT [dbo].[Banks] ([BankID], [BankName], [Hotline], [Email]) VALUES (2, N'BIDV', N'19009247    ', N'bidv247@bidv.com.vn')
INSERT [dbo].[Banks] ([BankID], [BankName], [Hotline], [Email]) VALUES (3, N'Techcombank', N'18006556    ', N'Call_Center@techcombank.com.vn')
INSERT [dbo].[Banks] ([BankID], [BankName], [Hotline], [Email]) VALUES (4, N'MBBank', N'1900545426  ', N'mb247@mbbank.com.vn')
INSERT [dbo].[Banks] ([BankID], [BankName], [Hotline], [Email]) VALUES (5, N'TPBank', N'19006036    ', N'dichvu_khachhang@tpbank.com.vn')
INSERT [dbo].[Banks] ([BankID], [BankName], [Hotline], [Email]) VALUES (6, N'ACBBank', N'1800577775  ', N'cskh@acbbank.com.vn')
GO
INSERT [dbo].[Customer] ([CustomerID], [CustomerName], [BirthDate], [Address], [PhoneNumber], [Gender], [Email]) VALUES (100000001, N'Nguyen Van Huy', CAST(N'1998-02-15' AS Date), N'Nam Tu Liem, Ha Noi', N'0354623454', 1, N'vanhuynguyen152@gmail.com')
INSERT [dbo].[Customer] ([CustomerID], [CustomerName], [BirthDate], [Address], [PhoneNumber], [Gender], [Email]) VALUES (100000002, N'Nguyen Nam Anh', CAST(N'1993-06-11' AS Date), N'Bac Tu Liem, Ha Noi', N'0365452331', 1, N'namanhnguyen343@gmail.com')
INSERT [dbo].[Customer] ([CustomerID], [CustomerName], [BirthDate], [Address], [PhoneNumber], [Gender], [Email]) VALUES (100000003, N'Nguyen Thi Anh', CAST(N'1994-05-05' AS Date), N'Dong Anh, Ha Noi', N'0654334322', 0, N'thianh22@gmail.com')
INSERT [dbo].[Customer] ([CustomerID], [CustomerName], [BirthDate], [Address], [PhoneNumber], [Gender], [Email]) VALUES (100000004, N'Nguyen Tien Anh', CAST(N'1992-02-10' AS Date), N'Hoai Duc, Ha Noi', N'0433245423', 1, N'tienanh1@gmail.com')
INSERT [dbo].[Customer] ([CustomerID], [CustomerName], [BirthDate], [Address], [PhoneNumber], [Gender], [Email]) VALUES (100000005, N'Bui Viet Cuong', CAST(N'1999-01-03' AS Date), N'Thanh Tri, Ha Noi', N'0924123226', 1, N'cuong999@gmail.com')
INSERT [dbo].[Customer] ([CustomerID], [CustomerName], [BirthDate], [Address], [PhoneNumber], [Gender], [Email]) VALUES (100000006, N'Dinh Thu Thao', CAST(N'1988-12-06' AS Date), N'Nam Tu Liem, Ha Noi', N'0886531246', 0, N'dinhthao98@gmail.com')
INSERT [dbo].[Customer] ([CustomerID], [CustomerName], [BirthDate], [Address], [PhoneNumber], [Gender], [Email]) VALUES (100000007, N'Tran Duc Nam', CAST(N'1991-02-15' AS Date), N'Hoang Mai, Ha Noi', N'5454556599', 1, N'namductran76@gmail.com')
INSERT [dbo].[Customer] ([CustomerID], [CustomerName], [BirthDate], [Address], [PhoneNumber], [Gender], [Email]) VALUES (100000008, N'Tran Thi Dieu', CAST(N'1996-11-10' AS Date), N'Dong Da, Ha Noi', N'0365243552', 0, N'tranthidieu2@gmail.com')
INSERT [dbo].[Customer] ([CustomerID], [CustomerName], [BirthDate], [Address], [PhoneNumber], [Gender], [Email]) VALUES (100000009, N'Bui Hoang Viet Anh', CAST(N'1987-06-10' AS Date), N'Hai Ba Trung, Ha Noi', N'0983237544', 1, N'buihoangvietanh7@gmail.com')
INSERT [dbo].[Customer] ([CustomerID], [CustomerName], [BirthDate], [Address], [PhoneNumber], [Gender], [Email]) VALUES (100000010, N'Nguyen Le Anh Tri', CAST(N'1990-04-20' AS Date), N'Thanh Xuan, Ha Noi', N'0464423233', 0, N'leanhtri0653@gmail.com')
INSERT [dbo].[Customer] ([CustomerID], [CustomerName], [BirthDate], [Address], [PhoneNumber], [Gender], [Email]) VALUES (100000011, N'Nguyen Chien Thang', CAST(N'1987-04-17' AS Date), N'Hoan Kiem, Ha Noi', N'0655534322', 1, N'chienthang1@gmail.com')
INSERT [dbo].[Customer] ([CustomerID], [CustomerName], [BirthDate], [Address], [PhoneNumber], [Gender], [Email]) VALUES (100000012, N'Pham Anh Thu', CAST(N'1992-03-29' AS Date), N'Hoan Kiem, Ha Noi', N'0332764224', 0, N'phuongoanh293@gmail.com')
INSERT [dbo].[Customer] ([CustomerID], [CustomerName], [BirthDate], [Address], [PhoneNumber], [Gender], [Email]) VALUES (100000013, N'Nguyen Hoang Thao Nguyen', CAST(N'2002-04-17' AS Date), N'Hoang Mai, Ha Noi', N'0644322333', 0, N'hoangthaonguyen33@gmail.com')
INSERT [dbo].[Customer] ([CustomerID], [CustomerName], [BirthDate], [Address], [PhoneNumber], [Gender], [Email]) VALUES (100000014, N'Nguyen Cao Ky Duyen', CAST(N'1996-05-16' AS Date), N'Hoan Kiem, Ha Noi', N'0332764224', 0, N'caokyduyen24@gmail.com')
INSERT [dbo].[Customer] ([CustomerID], [CustomerName], [BirthDate], [Address], [PhoneNumber], [Gender], [Email]) VALUES (100000015, N'Truong Anh Ngoc', CAST(N'1997-02-11' AS Date), N'Hoan Kiem, Ha Noi', N'0545423221', 1, N'tronganhnguoc422@gmail.com')
INSERT [dbo].[Customer] ([CustomerID], [CustomerName], [BirthDate], [Address], [PhoneNumber], [Gender], [Email]) VALUES (100000016, N'Le Tien Hoang', CAST(N'1992-03-29' AS Date), N'Hoan Kiem, Ha Noi', N'7674342323', 1, N'letienhoang85@gmail.com')
INSERT [dbo].[Customer] ([CustomerID], [CustomerName], [BirthDate], [Address], [PhoneNumber], [Gender], [Email]) VALUES (100000017, N'Hoang Nam Tien', CAST(N'1992-03-29' AS Date), N'Hoan Kiem, Ha Noi', N'0332764224', 1, N'hoangnamtien76@gmail.com')
INSERT [dbo].[Customer] ([CustomerID], [CustomerName], [BirthDate], [Address], [PhoneNumber], [Gender], [Email]) VALUES (100000018, N'Nguyen Tran Nam Anh', CAST(N'2001-11-30' AS Date), N'Dong Da, Ha Noi', N'0332764224', 1, N'nguyentrannamanh32@gmail.com')
INSERT [dbo].[Customer] ([CustomerID], [CustomerName], [BirthDate], [Address], [PhoneNumber], [Gender], [Email]) VALUES (100000019, N'Truong Quynh Anh', CAST(N'1999-02-28' AS Date), N'Thanh Xuan, Ha Noi', N'0332764224', 0, N'truongquynhanh003@gmail.com')
INSERT [dbo].[Customer] ([CustomerID], [CustomerName], [BirthDate], [Address], [PhoneNumber], [Gender], [Email]) VALUES (100000020, N'Pham Van Hau', CAST(N'2000-06-25' AS Date), N'Hau Lau, Thanh Hoa', N'0365642212', 0, N'phamhau32@gmail.com')
INSERT [dbo].[Customer] ([CustomerID], [CustomerName], [BirthDate], [Address], [PhoneNumber], [Gender], [Email]) VALUES (100000021, N'Pham Van Bach', CAST(N'2000-06-25' AS Date), N'Thanh Xuan, Ha Noi', N'0355642614', 1, N'pvb265@gmail.com')
INSERT [dbo].[Customer] ([CustomerID], [CustomerName], [BirthDate], [Address], [PhoneNumber], [Gender], [Email]) VALUES (100000022, N'Tran Bach Giang', CAST(N'1980-09-25' AS Date), N'Mong Cai, Quang Ninh', N'0126642212', 1, N'bachgiang25@gmail.com')
INSERT [dbo].[Customer] ([CustomerID], [CustomerName], [BirthDate], [Address], [PhoneNumber], [Gender], [Email]) VALUES (100000023, N'Nguyen Tuan Minh', CAST(N'1999-10-21' AS Date), N'Thu Duc, Ho Chi Minh', N'0335642212', 1, N'tuanminhhjhj2@gmail.com')
INSERT [dbo].[Customer] ([CustomerID], [CustomerName], [BirthDate], [Address], [PhoneNumber], [Gender], [Email]) VALUES (100000024, N'Nguyen Thien Thoi', CAST(N'1990-08-30' AS Date), N'Thanh Xuan, Ha Noi', N'0355325614', 1, N'thienthoi5@gmail.com')
INSERT [dbo].[Customer] ([CustomerID], [CustomerName], [BirthDate], [Address], [PhoneNumber], [Gender], [Email]) VALUES (100000025, N'Nguyen Thi Anh Vien', CAST(N'1983-09-16' AS Date), N'Mong Cai, Quang Ninh', N'0943425235', 1, N'dd32fd5@gmail.com')
INSERT [dbo].[Customer] ([CustomerID], [CustomerName], [BirthDate], [Address], [PhoneNumber], [Gender], [Email]) VALUES (100000026, N'Tran Nam Cuong', CAST(N'1992-01-31' AS Date), N'Thu Duc, Ho Chi Minh', N'0905472445', 1, N'cuongdz43@gmail.com')
INSERT [dbo].[Customer] ([CustomerID], [CustomerName], [BirthDate], [Address], [PhoneNumber], [Gender], [Email]) VALUES (100000027, N'Tran Thi Tuyet Van', CAST(N'1992-03-22' AS Date), N'Quan 1, Ho Chi Minh', N'0905443445', 0, N'tuyetvanvv@gmail.com')
INSERT [dbo].[Customer] ([CustomerID], [CustomerName], [BirthDate], [Address], [PhoneNumber], [Gender], [Email]) VALUES (100000028, N'Nguyen Tuyet Nhung', CAST(N'1996-05-17' AS Date), N'Quan 2, Ho Chi Minh', N'0845472445', 0, N'tuyetnhung24@gmail.com')
INSERT [dbo].[Customer] ([CustomerID], [CustomerName], [BirthDate], [Address], [PhoneNumber], [Gender], [Email]) VALUES (100000029, N'Vu Duc Do', CAST(N'1988-07-29' AS Date), N'Quan 3, Ho Chi Minh', N'0905424375', 1, N'ducdolaem@gmail.com')
INSERT [dbo].[Customer] ([CustomerID], [CustomerName], [BirthDate], [Address], [PhoneNumber], [Gender], [Email]) VALUES (100000030, N'Nguyen Xuan Phuc', CAST(N'1985-01-02' AS Date), N'Quan 4, Ho Chi Minh', N'0147254845', 1, N'phucdangcap3@gmail.com')
GO
INSERT [dbo].[Promotion] ([PromotionID], [ProDescription], [AccountTypeID]) VALUES (1, N'Chao thanh vien moi tang ngay goi qua tri gia 500k khi dang ky tai khoan thanh cong', 1)
INSERT [dbo].[Promotion] ([PromotionID], [ProDescription], [AccountTypeID]) VALUES (2, N'Khuyen mai 5% tren tong hoa don tien dien va nuoc', 2)
INSERT [dbo].[Promotion] ([PromotionID], [ProDescription], [AccountTypeID]) VALUES (3, N'Mien phi nap va rut tien 50 giao dich, goi qua thanh vien vip tri gia 5 trieu dong', 2)
GO
INSERT [dbo].[Provider] ([ProviderID], [ProviderName], [PhoneNumber], [Email], [Address], [Fax]) VALUES (1, N'Viettel Telecom', N'18008123', N'cskh@vietteltelecom.com.vn', NULL, NULL)
INSERT [dbo].[Provider] ([ProviderID], [ProviderName], [PhoneNumber], [Email], [Address], [Fax]) VALUES (2, N'Mobifone', N'18001090', N'cskh@mobifone.com.vn', NULL, NULL)
INSERT [dbo].[Provider] ([ProviderID], [ProviderName], [PhoneNumber], [Email], [Address], [Fax]) VALUES (3, N'Vinafone', N'18008123', N'cskh@vinafone.com.vn', NULL, NULL)
INSERT [dbo].[Provider] ([ProviderID], [ProviderName], [PhoneNumber], [Email], [Address], [Fax]) VALUES (4, N'Vietjet Air', N'19001886', N'cskh@vietjetair.com.vn', NULL, NULL)
INSERT [dbo].[Provider] ([ProviderID], [ProviderName], [PhoneNumber], [Email], [Address], [Fax]) VALUES (5, N'Bamboo Airways', N'19001166', N' info@bambooairways.com', NULL, NULL)
INSERT [dbo].[Provider] ([ProviderID], [ProviderName], [PhoneNumber], [Email], [Address], [Fax]) VALUES (6, N'CGV Cinema', N'19006017', N'hoidap@cgv.vn', NULL, NULL)
INSERT [dbo].[Provider] ([ProviderID], [ProviderName], [PhoneNumber], [Email], [Address], [Fax]) VALUES (7, N'Lotte Cinema', N'2837752524', N'hoidap@lotte.vn', NULL, NULL)
INSERT [dbo].[Provider] ([ProviderID], [ProviderName], [PhoneNumber], [Email], [Address], [Fax]) VALUES (8, N'BHD Cinema', N'19002099', N'cskh@bhdstar.vn', NULL, NULL)
INSERT [dbo].[Provider] ([ProviderID], [ProviderName], [PhoneNumber], [Email], [Address], [Fax]) VALUES (9, N'Galaxy Cinema', N'19002224', N'supports@galaxy.com.vn', NULL, NULL)
INSERT [dbo].[Provider] ([ProviderID], [ProviderName], [PhoneNumber], [Email], [Address], [Fax]) VALUES (10, N'Vietlott', N'0246268688', N'contact@vietlott.vn', NULL, NULL)
INSERT [dbo].[Provider] ([ProviderID], [ProviderName], [PhoneNumber], [Email], [Address], [Fax]) VALUES (11, N'EVN', N'0246694678', N'banbientapwebevn.eic@gmail.com', NULL, NULL)
INSERT [dbo].[Provider] ([ProviderID], [ProviderName], [PhoneNumber], [Email], [Address], [Fax]) VALUES (12, N'Nuoc sach Ha Noi', N'0242323232', N'nuocsachhanoi@gmail.com', NULL, NULL)
INSERT [dbo].[Provider] ([ProviderID], [ProviderName], [PhoneNumber], [Email], [Address], [Fax]) VALUES (13, N'Nuoc sach Ho Chi Minh', N'0324464432', N'nuocsachhcm@gmail.com', NULL, NULL)
INSERT [dbo].[Provider] ([ProviderID], [ProviderName], [PhoneNumber], [Email], [Address], [Fax]) VALUES (100, N'Vi dien tu Meme', N'1900545441', N'hotro@meme.vn', NULL, NULL)
GO
INSERT [dbo].[Service] ([ServiceID], [ServiceName], [Description]) VALUES (1, N'Nap the dien thoai', NULL)
INSERT [dbo].[Service] ([ServiceID], [ServiceName], [Description]) VALUES (2, N'Dat ve may bay', NULL)
INSERT [dbo].[Service] ([ServiceID], [ServiceName], [Description]) VALUES (3, N'Dat ve xem phim', NULL)
INSERT [dbo].[Service] ([ServiceID], [ServiceName], [Description]) VALUES (4, N'Thanh toan tien dien', NULL)
INSERT [dbo].[Service] ([ServiceID], [ServiceName], [Description]) VALUES (5, N'Thanh toan tien nuoc', NULL)
INSERT [dbo].[Service] ([ServiceID], [ServiceName], [Description]) VALUES (6, N'Mua so xo vietlott', NULL)
INSERT [dbo].[Service] ([ServiceID], [ServiceName], [Description]) VALUES (7, N'Tui than tai', N'Giong voi so tiet kiem, gui tien va nhan lai suat theo ki han len den 6.5%/nam')
GO
INSERT [dbo].[ServiceProvider] ([ServiceID], [ProviderID]) VALUES (1, 1)
INSERT [dbo].[ServiceProvider] ([ServiceID], [ProviderID]) VALUES (1, 2)
INSERT [dbo].[ServiceProvider] ([ServiceID], [ProviderID]) VALUES (1, 3)
INSERT [dbo].[ServiceProvider] ([ServiceID], [ProviderID]) VALUES (2, 4)
INSERT [dbo].[ServiceProvider] ([ServiceID], [ProviderID]) VALUES (2, 5)
INSERT [dbo].[ServiceProvider] ([ServiceID], [ProviderID]) VALUES (2, 6)
INSERT [dbo].[ServiceProvider] ([ServiceID], [ProviderID]) VALUES (3, 6)
INSERT [dbo].[ServiceProvider] ([ServiceID], [ProviderID]) VALUES (3, 7)
INSERT [dbo].[ServiceProvider] ([ServiceID], [ProviderID]) VALUES (3, 8)
INSERT [dbo].[ServiceProvider] ([ServiceID], [ProviderID]) VALUES (3, 9)
INSERT [dbo].[ServiceProvider] ([ServiceID], [ProviderID]) VALUES (4, 11)
INSERT [dbo].[ServiceProvider] ([ServiceID], [ProviderID]) VALUES (5, 12)
INSERT [dbo].[ServiceProvider] ([ServiceID], [ProviderID]) VALUES (5, 13)
INSERT [dbo].[ServiceProvider] ([ServiceID], [ProviderID]) VALUES (6, 10)
GO
INSERT [dbo].[Tranfers] ([TransactionID], [TransactionDateTime], [AmountOfTransaction], [Status], [BankCardID], [AccountID]) VALUES (1, CAST(N'2022-09-28T00:59:32.897' AS DateTime), 100000.0000, 1, 9704012304343243, 1)
INSERT [dbo].[Tranfers] ([TransactionID], [TransactionDateTime], [AmountOfTransaction], [Status], [BankCardID], [AccountID]) VALUES (2, CAST(N'2022-09-28T01:02:09.527' AS DateTime), 200000.0000, 1, 9704022304443243, 2)
INSERT [dbo].[Tranfers] ([TransactionID], [TransactionDateTime], [AmountOfTransaction], [Status], [BankCardID], [AccountID]) VALUES (3, CAST(N'2022-09-28T01:02:09.530' AS DateTime), 300000.0000, 1, 9704032303243243, 3)
INSERT [dbo].[Tranfers] ([TransactionID], [TransactionDateTime], [AmountOfTransaction], [Status], [BankCardID], [AccountID]) VALUES (4, CAST(N'2022-09-28T01:02:09.530' AS DateTime), 400000.0000, 1, 9704032435323232, 4)
INSERT [dbo].[Tranfers] ([TransactionID], [TransactionDateTime], [AmountOfTransaction], [Status], [BankCardID], [AccountID]) VALUES (5, CAST(N'2022-09-28T01:02:09.530' AS DateTime), 500000.0000, 1, 9704042301243243, 5)
INSERT [dbo].[Tranfers] ([TransactionID], [TransactionDateTime], [AmountOfTransaction], [Status], [BankCardID], [AccountID]) VALUES (6, CAST(N'2022-09-28T01:02:09.530' AS DateTime), 600000.0000, 1, 9704052301243243, 6)
INSERT [dbo].[Tranfers] ([TransactionID], [TransactionDateTime], [AmountOfTransaction], [Status], [BankCardID], [AccountID]) VALUES (7, CAST(N'2022-09-28T01:02:09.530' AS DateTime), 700000.0000, 1, 9704062301243243, 7)
INSERT [dbo].[Tranfers] ([TransactionID], [TransactionDateTime], [AmountOfTransaction], [Status], [BankCardID], [AccountID]) VALUES (8, CAST(N'2022-09-28T01:02:09.530' AS DateTime), 800000.0000, 1, 9704062301243245, 8)
INSERT [dbo].[Tranfers] ([TransactionID], [TransactionDateTime], [AmountOfTransaction], [Status], [BankCardID], [AccountID]) VALUES (9, CAST(N'2022-09-28T01:02:09.533' AS DateTime), 900000.0000, 1, 9704082301243243, 9)
INSERT [dbo].[Tranfers] ([TransactionID], [TransactionDateTime], [AmountOfTransaction], [Status], [BankCardID], [AccountID]) VALUES (10, CAST(N'2022-09-28T01:02:09.533' AS DateTime), 1000000.0000, 1, 9704092301243243, 10)
GO
INSERT [dbo].[Transactions] ([TransactionID], [TransactionDateTime], [AmountOfTransaction], [ConfirmTime], [StatusOfTransaction], [Message], [AccountID], [ReceiverID], [TransactionTypeID], [ServiceID]) VALUES (1, CAST(N'2022-09-20T00:01:52.000' AS DateTime), 20000.0000, CAST(N'2022-09-20T00:02:20.000' AS DateTime), 1, NULL, 1, 2, 1, NULL)
INSERT [dbo].[Transactions] ([TransactionID], [TransactionDateTime], [AmountOfTransaction], [ConfirmTime], [StatusOfTransaction], [Message], [AccountID], [ReceiverID], [TransactionTypeID], [ServiceID]) VALUES (2, CAST(N'2022-09-20T00:01:55.000' AS DateTime), 50000.0000, CAST(N'2022-09-20T00:02:23.000' AS DateTime), 1, NULL, 2, 3, 1, NULL)
INSERT [dbo].[Transactions] ([TransactionID], [TransactionDateTime], [AmountOfTransaction], [ConfirmTime], [StatusOfTransaction], [Message], [AccountID], [ReceiverID], [TransactionTypeID], [ServiceID]) VALUES (3, CAST(N'2022-09-20T00:02:50.000' AS DateTime), 300000.0000, CAST(N'2022-09-20T00:03:01.000' AS DateTime), 1, NULL, 7, 8, 1, NULL)
INSERT [dbo].[Transactions] ([TransactionID], [TransactionDateTime], [AmountOfTransaction], [ConfirmTime], [StatusOfTransaction], [Message], [AccountID], [ReceiverID], [TransactionTypeID], [ServiceID]) VALUES (4, CAST(N'2022-09-25T18:35:41.980' AS DateTime), 700000.0000, CAST(N'2022-09-25T18:35:51.980' AS DateTime), 0, NULL, 8, 7, 1, NULL)
INSERT [dbo].[Transactions] ([TransactionID], [TransactionDateTime], [AmountOfTransaction], [ConfirmTime], [StatusOfTransaction], [Message], [AccountID], [ReceiverID], [TransactionTypeID], [ServiceID]) VALUES (5, CAST(N'2022-09-25T18:38:48.693' AS DateTime), 150000.0000, CAST(N'2022-09-25T18:38:58.693' AS DateTime), 1, NULL, 2, 1, 1, NULL)
INSERT [dbo].[Transactions] ([TransactionID], [TransactionDateTime], [AmountOfTransaction], [ConfirmTime], [StatusOfTransaction], [Message], [AccountID], [ReceiverID], [TransactionTypeID], [ServiceID]) VALUES (6, CAST(N'2022-09-25T18:39:51.133' AS DateTime), 1000000.0000, CAST(N'2022-09-25T18:40:01.133' AS DateTime), 1, NULL, 5, 4, 1, NULL)
INSERT [dbo].[Transactions] ([TransactionID], [TransactionDateTime], [AmountOfTransaction], [ConfirmTime], [StatusOfTransaction], [Message], [AccountID], [ReceiverID], [TransactionTypeID], [ServiceID]) VALUES (7, CAST(N'2022-09-25T21:57:39.830' AS DateTime), 900000.0000, CAST(N'2022-09-25T21:57:49.830' AS DateTime), 1, NULL, 5, 32, 1, 4)
INSERT [dbo].[Transactions] ([TransactionID], [TransactionDateTime], [AmountOfTransaction], [ConfirmTime], [StatusOfTransaction], [Message], [AccountID], [ReceiverID], [TransactionTypeID], [ServiceID]) VALUES (8, CAST(N'2022-09-25T22:29:04.697' AS DateTime), 44000.0000, CAST(N'2022-09-25T22:29:14.697' AS DateTime), 1, NULL, 2, 3, 1, NULL)
INSERT [dbo].[Transactions] ([TransactionID], [TransactionDateTime], [AmountOfTransaction], [ConfirmTime], [StatusOfTransaction], [Message], [AccountID], [ReceiverID], [TransactionTypeID], [ServiceID]) VALUES (9, CAST(N'2022-09-25T22:29:04.740' AS DateTime), 72000.0000, CAST(N'2022-09-25T22:29:14.740' AS DateTime), 1, NULL, 5, 7, 1, NULL)
INSERT [dbo].[Transactions] ([TransactionID], [TransactionDateTime], [AmountOfTransaction], [ConfirmTime], [StatusOfTransaction], [Message], [AccountID], [ReceiverID], [TransactionTypeID], [ServiceID]) VALUES (10, CAST(N'2022-09-25T22:29:04.743' AS DateTime), 132000.0000, CAST(N'2022-09-25T22:29:14.743' AS DateTime), 1, NULL, 9, 12, 1, NULL)
INSERT [dbo].[Transactions] ([TransactionID], [TransactionDateTime], [AmountOfTransaction], [ConfirmTime], [StatusOfTransaction], [Message], [AccountID], [ReceiverID], [TransactionTypeID], [ServiceID]) VALUES (11, CAST(N'2022-09-26T15:45:43.673' AS DateTime), 32000.0000, CAST(N'2022-09-26T15:45:53.673' AS DateTime), 1, NULL, 3, 5, 1, NULL)
INSERT [dbo].[Transactions] ([TransactionID], [TransactionDateTime], [AmountOfTransaction], [ConfirmTime], [StatusOfTransaction], [Message], [AccountID], [ReceiverID], [TransactionTypeID], [ServiceID]) VALUES (12, CAST(N'2022-09-26T15:46:33.480' AS DateTime), 12000.0000, CAST(N'2022-09-26T15:46:43.480' AS DateTime), 1, NULL, 11, 13, 1, NULL)
INSERT [dbo].[Transactions] ([TransactionID], [TransactionDateTime], [AmountOfTransaction], [ConfirmTime], [StatusOfTransaction], [Message], [AccountID], [ReceiverID], [TransactionTypeID], [ServiceID]) VALUES (13, CAST(N'2022-09-26T15:46:33.487' AS DateTime), 13000.0000, CAST(N'2022-09-26T15:46:43.487' AS DateTime), 1, NULL, 9, 16, 1, NULL)
INSERT [dbo].[Transactions] ([TransactionID], [TransactionDateTime], [AmountOfTransaction], [ConfirmTime], [StatusOfTransaction], [Message], [AccountID], [ReceiverID], [TransactionTypeID], [ServiceID]) VALUES (14, CAST(N'2022-09-26T15:46:33.490' AS DateTime), 250000.0000, CAST(N'2022-09-26T15:46:43.490' AS DateTime), 1, NULL, 12, 9, 1, NULL)
INSERT [dbo].[Transactions] ([TransactionID], [TransactionDateTime], [AmountOfTransaction], [ConfirmTime], [StatusOfTransaction], [Message], [AccountID], [ReceiverID], [TransactionTypeID], [ServiceID]) VALUES (15, CAST(N'2022-09-26T15:46:33.490' AS DateTime), 320000.0000, CAST(N'2022-09-26T15:46:43.490' AS DateTime), 1, NULL, 1, 2, 1, NULL)
INSERT [dbo].[Transactions] ([TransactionID], [TransactionDateTime], [AmountOfTransaction], [ConfirmTime], [StatusOfTransaction], [Message], [AccountID], [ReceiverID], [TransactionTypeID], [ServiceID]) VALUES (16, CAST(N'2022-09-26T15:46:33.490' AS DateTime), 88000.0000, CAST(N'2022-09-26T15:46:43.490' AS DateTime), 1, NULL, 4, 5, 1, NULL)
INSERT [dbo].[Transactions] ([TransactionID], [TransactionDateTime], [AmountOfTransaction], [ConfirmTime], [StatusOfTransaction], [Message], [AccountID], [ReceiverID], [TransactionTypeID], [ServiceID]) VALUES (17, CAST(N'2022-09-26T15:46:33.490' AS DateTime), 98000.0000, CAST(N'2022-09-26T15:46:43.490' AS DateTime), 1, NULL, 5, 6, 1, NULL)
INSERT [dbo].[Transactions] ([TransactionID], [TransactionDateTime], [AmountOfTransaction], [ConfirmTime], [StatusOfTransaction], [Message], [AccountID], [ReceiverID], [TransactionTypeID], [ServiceID]) VALUES (18, CAST(N'2022-09-26T15:46:33.490' AS DateTime), 122000.0000, CAST(N'2022-09-26T15:46:43.490' AS DateTime), 1, NULL, 7, 8, 1, NULL)
INSERT [dbo].[Transactions] ([TransactionID], [TransactionDateTime], [AmountOfTransaction], [ConfirmTime], [StatusOfTransaction], [Message], [AccountID], [ReceiverID], [TransactionTypeID], [ServiceID]) VALUES (19, CAST(N'2022-09-26T15:46:33.490' AS DateTime), 102000.0000, CAST(N'2022-09-26T15:46:43.490' AS DateTime), 1, NULL, 9, 19, 1, NULL)
INSERT [dbo].[Transactions] ([TransactionID], [TransactionDateTime], [AmountOfTransaction], [ConfirmTime], [StatusOfTransaction], [Message], [AccountID], [ReceiverID], [TransactionTypeID], [ServiceID]) VALUES (20, CAST(N'2022-09-26T15:46:33.490' AS DateTime), 402000.0000, CAST(N'2022-09-26T15:46:43.490' AS DateTime), 1, NULL, 11, 12, 1, NULL)
INSERT [dbo].[Transactions] ([TransactionID], [TransactionDateTime], [AmountOfTransaction], [ConfirmTime], [StatusOfTransaction], [Message], [AccountID], [ReceiverID], [TransactionTypeID], [ServiceID]) VALUES (21, CAST(N'2022-09-26T15:46:33.490' AS DateTime), 302000.0000, CAST(N'2022-09-26T15:46:43.490' AS DateTime), 1, NULL, 12, 13, 1, NULL)
INSERT [dbo].[Transactions] ([TransactionID], [TransactionDateTime], [AmountOfTransaction], [ConfirmTime], [StatusOfTransaction], [Message], [AccountID], [ReceiverID], [TransactionTypeID], [ServiceID]) VALUES (22, CAST(N'2022-09-26T15:46:33.490' AS DateTime), 252000.0000, CAST(N'2022-09-26T15:46:43.490' AS DateTime), 1, NULL, 12, 13, 1, NULL)
INSERT [dbo].[Transactions] ([TransactionID], [TransactionDateTime], [AmountOfTransaction], [ConfirmTime], [StatusOfTransaction], [Message], [AccountID], [ReceiverID], [TransactionTypeID], [ServiceID]) VALUES (23, CAST(N'2022-09-26T15:46:33.493' AS DateTime), 322000.0000, CAST(N'2022-09-26T15:46:43.493' AS DateTime), 1, NULL, 12, 13, 1, NULL)
INSERT [dbo].[Transactions] ([TransactionID], [TransactionDateTime], [AmountOfTransaction], [ConfirmTime], [StatusOfTransaction], [Message], [AccountID], [ReceiverID], [TransactionTypeID], [ServiceID]) VALUES (24, CAST(N'2022-09-26T15:46:33.493' AS DateTime), 50000.0000, CAST(N'2022-09-26T15:46:43.493' AS DateTime), 1, NULL, 12, 13, 1, NULL)
INSERT [dbo].[Transactions] ([TransactionID], [TransactionDateTime], [AmountOfTransaction], [ConfirmTime], [StatusOfTransaction], [Message], [AccountID], [ReceiverID], [TransactionTypeID], [ServiceID]) VALUES (25, CAST(N'2022-09-26T15:46:33.493' AS DateTime), 62000.0000, CAST(N'2022-09-26T15:46:43.493' AS DateTime), 1, NULL, 12, 13, 1, NULL)
INSERT [dbo].[Transactions] ([TransactionID], [TransactionDateTime], [AmountOfTransaction], [ConfirmTime], [StatusOfTransaction], [Message], [AccountID], [ReceiverID], [TransactionTypeID], [ServiceID]) VALUES (26, CAST(N'2022-09-26T15:46:33.493' AS DateTime), 70000.0000, CAST(N'2022-09-26T15:46:43.493' AS DateTime), 1, NULL, 12, 13, 1, NULL)
INSERT [dbo].[Transactions] ([TransactionID], [TransactionDateTime], [AmountOfTransaction], [ConfirmTime], [StatusOfTransaction], [Message], [AccountID], [ReceiverID], [TransactionTypeID], [ServiceID]) VALUES (27, CAST(N'2022-09-26T15:46:33.493' AS DateTime), 11000.0000, CAST(N'2022-09-26T15:46:43.493' AS DateTime), 1, NULL, 12, 13, 1, NULL)
INSERT [dbo].[Transactions] ([TransactionID], [TransactionDateTime], [AmountOfTransaction], [ConfirmTime], [StatusOfTransaction], [Message], [AccountID], [ReceiverID], [TransactionTypeID], [ServiceID]) VALUES (28, CAST(N'2022-09-26T15:46:33.493' AS DateTime), 38000.0000, CAST(N'2022-09-26T15:46:43.493' AS DateTime), 1, NULL, 12, 13, 1, NULL)
INSERT [dbo].[Transactions] ([TransactionID], [TransactionDateTime], [AmountOfTransaction], [ConfirmTime], [StatusOfTransaction], [Message], [AccountID], [ReceiverID], [TransactionTypeID], [ServiceID]) VALUES (29, CAST(N'2022-09-26T15:46:33.493' AS DateTime), 39000.0000, CAST(N'2022-09-26T15:46:43.493' AS DateTime), 1, NULL, 12, 13, 1, NULL)
INSERT [dbo].[Transactions] ([TransactionID], [TransactionDateTime], [AmountOfTransaction], [ConfirmTime], [StatusOfTransaction], [Message], [AccountID], [ReceiverID], [TransactionTypeID], [ServiceID]) VALUES (30, CAST(N'2022-09-26T15:46:33.497' AS DateTime), 90000.0000, CAST(N'2022-09-26T15:46:43.497' AS DateTime), 1, NULL, 12, 13, 1, NULL)
INSERT [dbo].[Transactions] ([TransactionID], [TransactionDateTime], [AmountOfTransaction], [ConfirmTime], [StatusOfTransaction], [Message], [AccountID], [ReceiverID], [TransactionTypeID], [ServiceID]) VALUES (31, CAST(N'2022-09-26T15:46:33.497' AS DateTime), 60000.0000, CAST(N'2022-09-26T15:46:43.497' AS DateTime), 1, NULL, 12, 13, 1, NULL)
INSERT [dbo].[Transactions] ([TransactionID], [TransactionDateTime], [AmountOfTransaction], [ConfirmTime], [StatusOfTransaction], [Message], [AccountID], [ReceiverID], [TransactionTypeID], [ServiceID]) VALUES (32, CAST(N'2022-09-26T15:46:33.497' AS DateTime), 500000.0000, CAST(N'2022-09-26T15:46:43.497' AS DateTime), 1, NULL, 12, 13, 1, NULL)
INSERT [dbo].[Transactions] ([TransactionID], [TransactionDateTime], [AmountOfTransaction], [ConfirmTime], [StatusOfTransaction], [Message], [AccountID], [ReceiverID], [TransactionTypeID], [ServiceID]) VALUES (33, CAST(N'2022-08-20T00:01:52.000' AS DateTime), 55000.0000, CAST(N'2022-08-20T00:02:02.000' AS DateTime), 1, NULL, 12, 13, 1, NULL)
INSERT [dbo].[Transactions] ([TransactionID], [TransactionDateTime], [AmountOfTransaction], [ConfirmTime], [StatusOfTransaction], [Message], [AccountID], [ReceiverID], [TransactionTypeID], [ServiceID]) VALUES (34, CAST(N'2022-08-20T00:02:52.000' AS DateTime), 40000.0000, CAST(N'2022-08-20T00:03:02.000' AS DateTime), 1, NULL, 13, 14, 1, NULL)
INSERT [dbo].[Transactions] ([TransactionID], [TransactionDateTime], [AmountOfTransaction], [ConfirmTime], [StatusOfTransaction], [Message], [AccountID], [ReceiverID], [TransactionTypeID], [ServiceID]) VALUES (35, CAST(N'2022-08-20T00:02:59.000' AS DateTime), 5000.0000, CAST(N'2022-08-20T00:03:09.000' AS DateTime), 1, NULL, 14, 15, 1, NULL)
INSERT [dbo].[Transactions] ([TransactionID], [TransactionDateTime], [AmountOfTransaction], [ConfirmTime], [StatusOfTransaction], [Message], [AccountID], [ReceiverID], [TransactionTypeID], [ServiceID]) VALUES (36, CAST(N'2022-08-20T00:03:21.000' AS DateTime), 10000.0000, CAST(N'2022-08-20T00:03:31.000' AS DateTime), 1, NULL, 15, 16, 1, NULL)
INSERT [dbo].[Transactions] ([TransactionID], [TransactionDateTime], [AmountOfTransaction], [ConfirmTime], [StatusOfTransaction], [Message], [AccountID], [ReceiverID], [TransactionTypeID], [ServiceID]) VALUES (37, CAST(N'2022-08-20T00:03:36.000' AS DateTime), 25000.0000, CAST(N'2022-08-20T00:03:46.000' AS DateTime), 1, NULL, 17, 18, 1, NULL)
INSERT [dbo].[Transactions] ([TransactionID], [TransactionDateTime], [AmountOfTransaction], [ConfirmTime], [StatusOfTransaction], [Message], [AccountID], [ReceiverID], [TransactionTypeID], [ServiceID]) VALUES (38, CAST(N'2022-08-20T00:03:53.000' AS DateTime), 35000.0000, CAST(N'2022-08-20T00:04:03.000' AS DateTime), 1, NULL, 18, 19, 1, NULL)
INSERT [dbo].[Transactions] ([TransactionID], [TransactionDateTime], [AmountOfTransaction], [ConfirmTime], [StatusOfTransaction], [Message], [AccountID], [ReceiverID], [TransactionTypeID], [ServiceID]) VALUES (39, CAST(N'2022-08-20T00:03:56.000' AS DateTime), 45000.0000, CAST(N'2022-08-20T00:04:06.000' AS DateTime), 1, NULL, 19, 20, 1, NULL)
INSERT [dbo].[Transactions] ([TransactionID], [TransactionDateTime], [AmountOfTransaction], [ConfirmTime], [StatusOfTransaction], [Message], [AccountID], [ReceiverID], [TransactionTypeID], [ServiceID]) VALUES (40, CAST(N'2022-08-20T00:04:16.000' AS DateTime), 55000.0000, CAST(N'2022-08-20T00:04:26.000' AS DateTime), 1, NULL, 20, 19, 1, NULL)
INSERT [dbo].[Transactions] ([TransactionID], [TransactionDateTime], [AmountOfTransaction], [ConfirmTime], [StatusOfTransaction], [Message], [AccountID], [ReceiverID], [TransactionTypeID], [ServiceID]) VALUES (41, CAST(N'2022-08-20T00:05:06.000' AS DateTime), 65000.0000, CAST(N'2022-08-20T00:05:16.000' AS DateTime), 1, NULL, 19, 18, 1, NULL)
INSERT [dbo].[Transactions] ([TransactionID], [TransactionDateTime], [AmountOfTransaction], [ConfirmTime], [StatusOfTransaction], [Message], [AccountID], [ReceiverID], [TransactionTypeID], [ServiceID]) VALUES (42, CAST(N'2022-08-20T00:07:36.000' AS DateTime), 35000.0000, CAST(N'2022-08-20T00:07:46.000' AS DateTime), 1, NULL, 18, 17, 1, NULL)
INSERT [dbo].[Transactions] ([TransactionID], [TransactionDateTime], [AmountOfTransaction], [ConfirmTime], [StatusOfTransaction], [Message], [AccountID], [ReceiverID], [TransactionTypeID], [ServiceID]) VALUES (43, CAST(N'2022-08-20T00:08:36.000' AS DateTime), 85000.0000, CAST(N'2022-08-20T00:08:46.000' AS DateTime), 0, NULL, 17, 16, 1, NULL)
INSERT [dbo].[Transactions] ([TransactionID], [TransactionDateTime], [AmountOfTransaction], [ConfirmTime], [StatusOfTransaction], [Message], [AccountID], [ReceiverID], [TransactionTypeID], [ServiceID]) VALUES (44, CAST(N'2022-08-20T00:09:36.000' AS DateTime), 95000.0000, CAST(N'2022-08-20T00:09:46.000' AS DateTime), 0, NULL, 16, 15, 1, NULL)
INSERT [dbo].[Transactions] ([TransactionID], [TransactionDateTime], [AmountOfTransaction], [ConfirmTime], [StatusOfTransaction], [Message], [AccountID], [ReceiverID], [TransactionTypeID], [ServiceID]) VALUES (45, CAST(N'2022-08-20T00:10:36.000' AS DateTime), 105000.0000, CAST(N'2022-08-20T00:10:46.000' AS DateTime), 0, NULL, 15, 14, 1, NULL)
INSERT [dbo].[Transactions] ([TransactionID], [TransactionDateTime], [AmountOfTransaction], [ConfirmTime], [StatusOfTransaction], [Message], [AccountID], [ReceiverID], [TransactionTypeID], [ServiceID]) VALUES (46, CAST(N'2022-08-20T00:11:36.000' AS DateTime), 2500.0000, CAST(N'2022-08-20T00:11:46.000' AS DateTime), 1, NULL, 14, 13, 1, NULL)
INSERT [dbo].[Transactions] ([TransactionID], [TransactionDateTime], [AmountOfTransaction], [ConfirmTime], [StatusOfTransaction], [Message], [AccountID], [ReceiverID], [TransactionTypeID], [ServiceID]) VALUES (47, CAST(N'2022-08-20T00:12:36.000' AS DateTime), 3000.0000, CAST(N'2022-08-20T00:12:46.000' AS DateTime), 1, NULL, 13, 12, 1, NULL)
INSERT [dbo].[Transactions] ([TransactionID], [TransactionDateTime], [AmountOfTransaction], [ConfirmTime], [StatusOfTransaction], [Message], [AccountID], [ReceiverID], [TransactionTypeID], [ServiceID]) VALUES (48, CAST(N'2022-08-20T00:13:36.000' AS DateTime), 4000.0000, CAST(N'2022-08-20T00:13:46.000' AS DateTime), 1, NULL, 12, 11, 1, NULL)
INSERT [dbo].[Transactions] ([TransactionID], [TransactionDateTime], [AmountOfTransaction], [ConfirmTime], [StatusOfTransaction], [Message], [AccountID], [ReceiverID], [TransactionTypeID], [ServiceID]) VALUES (49, CAST(N'2022-08-20T00:14:36.000' AS DateTime), 6000.0000, CAST(N'2022-08-20T00:14:46.000' AS DateTime), 1, NULL, 11, 10, 1, NULL)
INSERT [dbo].[Transactions] ([TransactionID], [TransactionDateTime], [AmountOfTransaction], [ConfirmTime], [StatusOfTransaction], [Message], [AccountID], [ReceiverID], [TransactionTypeID], [ServiceID]) VALUES (50, CAST(N'2022-08-20T00:15:36.000' AS DateTime), 9000.0000, CAST(N'2022-08-20T00:15:46.000' AS DateTime), 1, NULL, 10, 9, 1, NULL)
INSERT [dbo].[Transactions] ([TransactionID], [TransactionDateTime], [AmountOfTransaction], [ConfirmTime], [StatusOfTransaction], [Message], [AccountID], [ReceiverID], [TransactionTypeID], [ServiceID]) VALUES (51, CAST(N'2022-07-17T00:10:10.000' AS DateTime), 9000.0000, CAST(N'2022-07-17T00:10:20.000' AS DateTime), 1, NULL, 9, 8, 1, NULL)
INSERT [dbo].[Transactions] ([TransactionID], [TransactionDateTime], [AmountOfTransaction], [ConfirmTime], [StatusOfTransaction], [Message], [AccountID], [ReceiverID], [TransactionTypeID], [ServiceID]) VALUES (52, CAST(N'2022-07-17T00:11:12.000' AS DateTime), 10000.0000, CAST(N'2022-07-17T00:11:22.000' AS DateTime), 1, NULL, 8, 7, 1, NULL)
INSERT [dbo].[Transactions] ([TransactionID], [TransactionDateTime], [AmountOfTransaction], [ConfirmTime], [StatusOfTransaction], [Message], [AccountID], [ReceiverID], [TransactionTypeID], [ServiceID]) VALUES (53, CAST(N'2022-07-17T00:12:12.000' AS DateTime), 11000.0000, CAST(N'2022-07-17T00:12:22.000' AS DateTime), 1, NULL, 7, 5, 1, NULL)
INSERT [dbo].[Transactions] ([TransactionID], [TransactionDateTime], [AmountOfTransaction], [ConfirmTime], [StatusOfTransaction], [Message], [AccountID], [ReceiverID], [TransactionTypeID], [ServiceID]) VALUES (54, CAST(N'2022-07-17T00:13:12.000' AS DateTime), 12000.0000, CAST(N'2022-07-17T00:13:22.000' AS DateTime), 1, NULL, 5, 6, 1, NULL)
INSERT [dbo].[Transactions] ([TransactionID], [TransactionDateTime], [AmountOfTransaction], [ConfirmTime], [StatusOfTransaction], [Message], [AccountID], [ReceiverID], [TransactionTypeID], [ServiceID]) VALUES (55, CAST(N'2022-07-17T00:14:12.000' AS DateTime), 15000.0000, CAST(N'2022-07-17T00:14:22.000' AS DateTime), 1, NULL, 7, 3, 1, NULL)
INSERT [dbo].[Transactions] ([TransactionID], [TransactionDateTime], [AmountOfTransaction], [ConfirmTime], [StatusOfTransaction], [Message], [AccountID], [ReceiverID], [TransactionTypeID], [ServiceID]) VALUES (56, CAST(N'2022-07-17T00:15:12.000' AS DateTime), 16000.0000, CAST(N'2022-07-17T00:15:22.000' AS DateTime), 1, NULL, 3, 2, 1, NULL)
INSERT [dbo].[Transactions] ([TransactionID], [TransactionDateTime], [AmountOfTransaction], [ConfirmTime], [StatusOfTransaction], [Message], [AccountID], [ReceiverID], [TransactionTypeID], [ServiceID]) VALUES (57, CAST(N'2022-07-17T00:16:12.000' AS DateTime), 18000.0000, CAST(N'2022-07-17T00:16:22.000' AS DateTime), 1, NULL, 4, 1, 1, NULL)
INSERT [dbo].[Transactions] ([TransactionID], [TransactionDateTime], [AmountOfTransaction], [ConfirmTime], [StatusOfTransaction], [Message], [AccountID], [ReceiverID], [TransactionTypeID], [ServiceID]) VALUES (58, CAST(N'2022-07-17T00:17:12.000' AS DateTime), 20000.0000, CAST(N'2022-07-17T00:17:22.000' AS DateTime), 1, NULL, 1, 8, 1, NULL)
INSERT [dbo].[Transactions] ([TransactionID], [TransactionDateTime], [AmountOfTransaction], [ConfirmTime], [StatusOfTransaction], [Message], [AccountID], [ReceiverID], [TransactionTypeID], [ServiceID]) VALUES (59, CAST(N'2022-07-17T00:18:12.000' AS DateTime), 22000.0000, CAST(N'2022-07-17T00:18:22.000' AS DateTime), 1, NULL, 12, 15, 1, NULL)
INSERT [dbo].[Transactions] ([TransactionID], [TransactionDateTime], [AmountOfTransaction], [ConfirmTime], [StatusOfTransaction], [Message], [AccountID], [ReceiverID], [TransactionTypeID], [ServiceID]) VALUES (60, CAST(N'2022-07-17T00:19:12.000' AS DateTime), 59000.0000, CAST(N'2022-07-17T00:19:22.000' AS DateTime), 1, NULL, 8, 7, 1, NULL)
INSERT [dbo].[Transactions] ([TransactionID], [TransactionDateTime], [AmountOfTransaction], [ConfirmTime], [StatusOfTransaction], [Message], [AccountID], [ReceiverID], [TransactionTypeID], [ServiceID]) VALUES (61, CAST(N'2022-06-18T00:18:06.000' AS DateTime), 18000.0000, CAST(N'2022-06-18T00:18:16.000' AS DateTime), 1, NULL, 1, 2, 1, NULL)
INSERT [dbo].[Transactions] ([TransactionID], [TransactionDateTime], [AmountOfTransaction], [ConfirmTime], [StatusOfTransaction], [Message], [AccountID], [ReceiverID], [TransactionTypeID], [ServiceID]) VALUES (62, CAST(N'2022-06-18T00:18:07.000' AS DateTime), 18000.0000, CAST(N'2022-06-18T00:18:17.000' AS DateTime), 1, NULL, 2, 3, 1, NULL)
INSERT [dbo].[Transactions] ([TransactionID], [TransactionDateTime], [AmountOfTransaction], [ConfirmTime], [StatusOfTransaction], [Message], [AccountID], [ReceiverID], [TransactionTypeID], [ServiceID]) VALUES (63, CAST(N'2022-06-18T00:18:08.000' AS DateTime), 18000.0000, CAST(N'2022-06-18T00:18:18.000' AS DateTime), 1, NULL, 3, 4, 1, NULL)
INSERT [dbo].[Transactions] ([TransactionID], [TransactionDateTime], [AmountOfTransaction], [ConfirmTime], [StatusOfTransaction], [Message], [AccountID], [ReceiverID], [TransactionTypeID], [ServiceID]) VALUES (64, CAST(N'2022-06-18T00:18:09.000' AS DateTime), 18000.0000, CAST(N'2022-06-18T00:18:19.000' AS DateTime), 1, NULL, 4, 5, 1, NULL)
INSERT [dbo].[Transactions] ([TransactionID], [TransactionDateTime], [AmountOfTransaction], [ConfirmTime], [StatusOfTransaction], [Message], [AccountID], [ReceiverID], [TransactionTypeID], [ServiceID]) VALUES (65, CAST(N'2022-06-18T00:18:10.000' AS DateTime), 18000.0000, CAST(N'2022-06-18T00:18:20.000' AS DateTime), 1, NULL, 6, 7, 1, NULL)
INSERT [dbo].[Transactions] ([TransactionID], [TransactionDateTime], [AmountOfTransaction], [ConfirmTime], [StatusOfTransaction], [Message], [AccountID], [ReceiverID], [TransactionTypeID], [ServiceID]) VALUES (66, CAST(N'2022-06-18T00:18:11.000' AS DateTime), 18000.0000, CAST(N'2022-06-18T00:18:21.000' AS DateTime), 1, NULL, 8, 9, 1, NULL)
INSERT [dbo].[Transactions] ([TransactionID], [TransactionDateTime], [AmountOfTransaction], [ConfirmTime], [StatusOfTransaction], [Message], [AccountID], [ReceiverID], [TransactionTypeID], [ServiceID]) VALUES (67, CAST(N'2022-06-18T00:18:12.000' AS DateTime), 18000.0000, CAST(N'2022-06-18T00:18:22.000' AS DateTime), 1, NULL, 7, 8, 1, NULL)
INSERT [dbo].[Transactions] ([TransactionID], [TransactionDateTime], [AmountOfTransaction], [ConfirmTime], [StatusOfTransaction], [Message], [AccountID], [ReceiverID], [TransactionTypeID], [ServiceID]) VALUES (68, CAST(N'2022-06-18T00:18:13.000' AS DateTime), 18000.0000, CAST(N'2022-06-18T00:18:23.000' AS DateTime), 1, NULL, 9, 10, 1, NULL)
INSERT [dbo].[Transactions] ([TransactionID], [TransactionDateTime], [AmountOfTransaction], [ConfirmTime], [StatusOfTransaction], [Message], [AccountID], [ReceiverID], [TransactionTypeID], [ServiceID]) VALUES (69, CAST(N'2022-06-18T00:18:14.000' AS DateTime), 18000.0000, CAST(N'2022-06-18T00:18:24.000' AS DateTime), 1, NULL, 11, 12, 1, NULL)
INSERT [dbo].[Transactions] ([TransactionID], [TransactionDateTime], [AmountOfTransaction], [ConfirmTime], [StatusOfTransaction], [Message], [AccountID], [ReceiverID], [TransactionTypeID], [ServiceID]) VALUES (70, CAST(N'2022-06-18T00:18:15.000' AS DateTime), 18000.0000, CAST(N'2022-06-18T00:18:25.000' AS DateTime), 1, NULL, 10, 11, 1, NULL)
INSERT [dbo].[Transactions] ([TransactionID], [TransactionDateTime], [AmountOfTransaction], [ConfirmTime], [StatusOfTransaction], [Message], [AccountID], [ReceiverID], [TransactionTypeID], [ServiceID]) VALUES (71, CAST(N'2022-06-18T00:18:16.000' AS DateTime), 18000.0000, CAST(N'2022-06-18T00:18:26.000' AS DateTime), 1, NULL, 12, 13, 1, NULL)
INSERT [dbo].[Transactions] ([TransactionID], [TransactionDateTime], [AmountOfTransaction], [ConfirmTime], [StatusOfTransaction], [Message], [AccountID], [ReceiverID], [TransactionTypeID], [ServiceID]) VALUES (72, CAST(N'2022-06-18T00:18:17.000' AS DateTime), 18000.0000, CAST(N'2022-06-18T00:18:27.000' AS DateTime), 1, NULL, 13, 14, 1, NULL)
INSERT [dbo].[Transactions] ([TransactionID], [TransactionDateTime], [AmountOfTransaction], [ConfirmTime], [StatusOfTransaction], [Message], [AccountID], [ReceiverID], [TransactionTypeID], [ServiceID]) VALUES (73, CAST(N'2022-06-18T00:18:18.000' AS DateTime), 18000.0000, CAST(N'2022-06-18T00:18:28.000' AS DateTime), 1, NULL, 14, 15, 1, NULL)
INSERT [dbo].[Transactions] ([TransactionID], [TransactionDateTime], [AmountOfTransaction], [ConfirmTime], [StatusOfTransaction], [Message], [AccountID], [ReceiverID], [TransactionTypeID], [ServiceID]) VALUES (74, CAST(N'2022-06-18T00:18:19.000' AS DateTime), 18000.0000, CAST(N'2022-06-18T00:18:29.000' AS DateTime), 1, NULL, 15, 16, 1, NULL)
INSERT [dbo].[Transactions] ([TransactionID], [TransactionDateTime], [AmountOfTransaction], [ConfirmTime], [StatusOfTransaction], [Message], [AccountID], [ReceiverID], [TransactionTypeID], [ServiceID]) VALUES (75, CAST(N'2022-06-19T02:02:03.000' AS DateTime), 18000.0000, CAST(N'2022-06-19T02:02:13.000' AS DateTime), 1, NULL, 16, 17, 1, NULL)
INSERT [dbo].[Transactions] ([TransactionID], [TransactionDateTime], [AmountOfTransaction], [ConfirmTime], [StatusOfTransaction], [Message], [AccountID], [ReceiverID], [TransactionTypeID], [ServiceID]) VALUES (76, CAST(N'2022-05-05T02:02:03.000' AS DateTime), 23000.0000, CAST(N'2022-05-05T02:02:13.000' AS DateTime), 1, NULL, 17, 18, 1, NULL)
INSERT [dbo].[Transactions] ([TransactionID], [TransactionDateTime], [AmountOfTransaction], [ConfirmTime], [StatusOfTransaction], [Message], [AccountID], [ReceiverID], [TransactionTypeID], [ServiceID]) VALUES (77, CAST(N'2022-05-15T02:02:03.000' AS DateTime), 24000.0000, CAST(N'2022-05-15T02:02:13.000' AS DateTime), 1, NULL, 19, 20, 1, NULL)
INSERT [dbo].[Transactions] ([TransactionID], [TransactionDateTime], [AmountOfTransaction], [ConfirmTime], [StatusOfTransaction], [Message], [AccountID], [ReceiverID], [TransactionTypeID], [ServiceID]) VALUES (78, CAST(N'2022-05-18T02:02:03.000' AS DateTime), 12000.0000, CAST(N'2022-05-18T02:02:13.000' AS DateTime), 1, NULL, 20, 17, 1, NULL)
INSERT [dbo].[Transactions] ([TransactionID], [TransactionDateTime], [AmountOfTransaction], [ConfirmTime], [StatusOfTransaction], [Message], [AccountID], [ReceiverID], [TransactionTypeID], [ServiceID]) VALUES (79, CAST(N'2022-05-11T02:02:03.000' AS DateTime), 9000.0000, CAST(N'2022-05-11T02:02:13.000' AS DateTime), 1, NULL, 15, 17, 1, NULL)
INSERT [dbo].[Transactions] ([TransactionID], [TransactionDateTime], [AmountOfTransaction], [ConfirmTime], [StatusOfTransaction], [Message], [AccountID], [ReceiverID], [TransactionTypeID], [ServiceID]) VALUES (80, CAST(N'2022-05-12T02:02:03.000' AS DateTime), 8000.0000, CAST(N'2022-05-12T02:02:13.000' AS DateTime), 1, NULL, 18, 17, 1, NULL)
INSERT [dbo].[Transactions] ([TransactionID], [TransactionDateTime], [AmountOfTransaction], [ConfirmTime], [StatusOfTransaction], [Message], [AccountID], [ReceiverID], [TransactionTypeID], [ServiceID]) VALUES (81, CAST(N'2022-05-06T02:02:03.000' AS DateTime), 32000.0000, CAST(N'2022-05-06T02:02:13.000' AS DateTime), 1, NULL, 1, 2, 1, NULL)
INSERT [dbo].[Transactions] ([TransactionID], [TransactionDateTime], [AmountOfTransaction], [ConfirmTime], [StatusOfTransaction], [Message], [AccountID], [ReceiverID], [TransactionTypeID], [ServiceID]) VALUES (82, CAST(N'2022-06-12T02:02:03.000' AS DateTime), 25000.0000, CAST(N'2022-06-12T02:02:13.000' AS DateTime), 1, NULL, 2, 7, 1, NULL)
INSERT [dbo].[Transactions] ([TransactionID], [TransactionDateTime], [AmountOfTransaction], [ConfirmTime], [StatusOfTransaction], [Message], [AccountID], [ReceiverID], [TransactionTypeID], [ServiceID]) VALUES (83, CAST(N'2022-04-03T02:02:03.000' AS DateTime), 42000.0000, CAST(N'2022-04-03T02:02:13.000' AS DateTime), 1, NULL, 1, 2, 1, NULL)
INSERT [dbo].[Transactions] ([TransactionID], [TransactionDateTime], [AmountOfTransaction], [ConfirmTime], [StatusOfTransaction], [Message], [AccountID], [ReceiverID], [TransactionTypeID], [ServiceID]) VALUES (84, CAST(N'2022-04-04T02:02:03.000' AS DateTime), 44000.0000, CAST(N'2022-04-04T02:02:13.000' AS DateTime), 1, NULL, 2, 3, 1, NULL)
INSERT [dbo].[Transactions] ([TransactionID], [TransactionDateTime], [AmountOfTransaction], [ConfirmTime], [StatusOfTransaction], [Message], [AccountID], [ReceiverID], [TransactionTypeID], [ServiceID]) VALUES (85, CAST(N'2022-04-10T02:02:03.000' AS DateTime), 32000.0000, CAST(N'2022-04-10T02:02:13.000' AS DateTime), 1, NULL, 3, 4, 1, NULL)
INSERT [dbo].[Transactions] ([TransactionID], [TransactionDateTime], [AmountOfTransaction], [ConfirmTime], [StatusOfTransaction], [Message], [AccountID], [ReceiverID], [TransactionTypeID], [ServiceID]) VALUES (86, CAST(N'2022-04-05T02:02:03.000' AS DateTime), 3000.0000, CAST(N'2022-04-05T02:02:13.000' AS DateTime), 1, NULL, 4, 5, 1, NULL)
INSERT [dbo].[Transactions] ([TransactionID], [TransactionDateTime], [AmountOfTransaction], [ConfirmTime], [StatusOfTransaction], [Message], [AccountID], [ReceiverID], [TransactionTypeID], [ServiceID]) VALUES (87, CAST(N'2022-04-06T02:02:03.000' AS DateTime), 2000.0000, CAST(N'2022-04-06T02:02:13.000' AS DateTime), 1, NULL, 5, 2, 1, NULL)
INSERT [dbo].[Transactions] ([TransactionID], [TransactionDateTime], [AmountOfTransaction], [ConfirmTime], [StatusOfTransaction], [Message], [AccountID], [ReceiverID], [TransactionTypeID], [ServiceID]) VALUES (88, CAST(N'2022-04-07T02:02:03.000' AS DateTime), 52000.0000, CAST(N'2022-04-07T02:02:13.000' AS DateTime), 1, NULL, 7, 2, 1, NULL)
INSERT [dbo].[Transactions] ([TransactionID], [TransactionDateTime], [AmountOfTransaction], [ConfirmTime], [StatusOfTransaction], [Message], [AccountID], [ReceiverID], [TransactionTypeID], [ServiceID]) VALUES (89, CAST(N'2022-04-08T02:02:03.000' AS DateTime), 110000.0000, CAST(N'2022-04-08T02:02:13.000' AS DateTime), 1, NULL, 8, 10, 1, NULL)
INSERT [dbo].[Transactions] ([TransactionID], [TransactionDateTime], [AmountOfTransaction], [ConfirmTime], [StatusOfTransaction], [Message], [AccountID], [ReceiverID], [TransactionTypeID], [ServiceID]) VALUES (90, CAST(N'2022-04-09T02:02:03.000' AS DateTime), 55000.0000, CAST(N'2022-04-09T02:02:13.000' AS DateTime), 1, NULL, 11, 12, 1, NULL)
INSERT [dbo].[Transactions] ([TransactionID], [TransactionDateTime], [AmountOfTransaction], [ConfirmTime], [StatusOfTransaction], [Message], [AccountID], [ReceiverID], [TransactionTypeID], [ServiceID]) VALUES (91, CAST(N'2022-04-10T02:02:03.000' AS DateTime), 76000.0000, CAST(N'2022-04-10T02:02:13.000' AS DateTime), 1, NULL, 13, 12, 1, NULL)
INSERT [dbo].[Transactions] ([TransactionID], [TransactionDateTime], [AmountOfTransaction], [ConfirmTime], [StatusOfTransaction], [Message], [AccountID], [ReceiverID], [TransactionTypeID], [ServiceID]) VALUES (92, CAST(N'2022-03-06T02:02:03.000' AS DateTime), 16000.0000, CAST(N'2022-03-06T02:02:13.000' AS DateTime), 1, NULL, 11, 10, 1, NULL)
INSERT [dbo].[Transactions] ([TransactionID], [TransactionDateTime], [AmountOfTransaction], [ConfirmTime], [StatusOfTransaction], [Message], [AccountID], [ReceiverID], [TransactionTypeID], [ServiceID]) VALUES (93, CAST(N'2022-03-10T02:02:03.000' AS DateTime), 106000.0000, CAST(N'2022-03-10T02:02:13.000' AS DateTime), 1, NULL, 10, 1, 1, NULL)
INSERT [dbo].[Transactions] ([TransactionID], [TransactionDateTime], [AmountOfTransaction], [ConfirmTime], [StatusOfTransaction], [Message], [AccountID], [ReceiverID], [TransactionTypeID], [ServiceID]) VALUES (94, CAST(N'2022-03-26T02:02:03.000' AS DateTime), 26000.0000, CAST(N'2022-03-26T02:02:13.000' AS DateTime), 1, NULL, 11, 1, 1, NULL)
INSERT [dbo].[Transactions] ([TransactionID], [TransactionDateTime], [AmountOfTransaction], [ConfirmTime], [StatusOfTransaction], [Message], [AccountID], [ReceiverID], [TransactionTypeID], [ServiceID]) VALUES (95, CAST(N'2022-03-10T02:02:03.000' AS DateTime), 23000.0000, CAST(N'2022-03-10T02:02:13.000' AS DateTime), 1, NULL, 14, 16, 1, NULL)
INSERT [dbo].[Transactions] ([TransactionID], [TransactionDateTime], [AmountOfTransaction], [ConfirmTime], [StatusOfTransaction], [Message], [AccountID], [ReceiverID], [TransactionTypeID], [ServiceID]) VALUES (96, CAST(N'2022-02-10T02:02:03.000' AS DateTime), 36000.0000, CAST(N'2022-02-10T02:02:13.000' AS DateTime), 1, NULL, 9, 6, 1, NULL)
INSERT [dbo].[Transactions] ([TransactionID], [TransactionDateTime], [AmountOfTransaction], [ConfirmTime], [StatusOfTransaction], [Message], [AccountID], [ReceiverID], [TransactionTypeID], [ServiceID]) VALUES (97, CAST(N'2022-02-12T02:02:03.000' AS DateTime), 44000.0000, CAST(N'2022-02-12T02:02:13.000' AS DateTime), 1, NULL, 5, 4, 1, NULL)
INSERT [dbo].[Transactions] ([TransactionID], [TransactionDateTime], [AmountOfTransaction], [ConfirmTime], [StatusOfTransaction], [Message], [AccountID], [ReceiverID], [TransactionTypeID], [ServiceID]) VALUES (98, CAST(N'2022-02-14T02:02:03.000' AS DateTime), 56000.0000, CAST(N'2022-03-06T02:02:13.000' AS DateTime), 1, NULL, 3, 2, 1, NULL)
INSERT [dbo].[Transactions] ([TransactionID], [TransactionDateTime], [AmountOfTransaction], [ConfirmTime], [StatusOfTransaction], [Message], [AccountID], [ReceiverID], [TransactionTypeID], [ServiceID]) VALUES (99, CAST(N'2022-01-16T02:02:03.000' AS DateTime), 22000.0000, CAST(N'2022-01-16T02:02:13.000' AS DateTime), 1, NULL, 5, 4, 1, NULL)
INSERT [dbo].[Transactions] ([TransactionID], [TransactionDateTime], [AmountOfTransaction], [ConfirmTime], [StatusOfTransaction], [Message], [AccountID], [ReceiverID], [TransactionTypeID], [ServiceID]) VALUES (100, CAST(N'2022-01-19T02:02:03.000' AS DateTime), 77000.0000, CAST(N'2022-01-19T02:02:13.000' AS DateTime), 1, NULL, 6, 5, 1, NULL)
GO
INSERT [dbo].[Transactions] ([TransactionID], [TransactionDateTime], [AmountOfTransaction], [ConfirmTime], [StatusOfTransaction], [Message], [AccountID], [ReceiverID], [TransactionTypeID], [ServiceID]) VALUES (101, CAST(N'2022-09-26T17:15:20.360' AS DateTime), 80000.0000, CAST(N'2022-09-26T17:15:30.360' AS DateTime), 1, NULL, 34, 21, 2, 1)
INSERT [dbo].[Transactions] ([TransactionID], [TransactionDateTime], [AmountOfTransaction], [ConfirmTime], [StatusOfTransaction], [Message], [AccountID], [ReceiverID], [TransactionTypeID], [ServiceID]) VALUES (102, CAST(N'2022-09-26T17:15:20.383' AS DateTime), 2000000.0000, CAST(N'2022-09-26T17:15:30.383' AS DateTime), 1, NULL, 35, 24, 2, 2)
INSERT [dbo].[Transactions] ([TransactionID], [TransactionDateTime], [AmountOfTransaction], [ConfirmTime], [StatusOfTransaction], [Message], [AccountID], [ReceiverID], [TransactionTypeID], [ServiceID]) VALUES (103, CAST(N'2022-09-26T17:15:20.383' AS DateTime), 100000.0000, CAST(N'2022-09-26T17:15:30.383' AS DateTime), 1, NULL, 36, 26, 2, 3)
INSERT [dbo].[Transactions] ([TransactionID], [TransactionDateTime], [AmountOfTransaction], [ConfirmTime], [StatusOfTransaction], [Message], [AccountID], [ReceiverID], [TransactionTypeID], [ServiceID]) VALUES (104, CAST(N'2022-09-26T17:15:20.383' AS DateTime), 80000.0000, CAST(N'2022-09-26T17:15:30.383' AS DateTime), 1, NULL, 37, 31, 2, 4)
INSERT [dbo].[Transactions] ([TransactionID], [TransactionDateTime], [AmountOfTransaction], [ConfirmTime], [StatusOfTransaction], [Message], [AccountID], [ReceiverID], [TransactionTypeID], [ServiceID]) VALUES (105, CAST(N'2022-09-26T17:15:20.383' AS DateTime), 320000.0000, CAST(N'2022-09-26T17:15:30.383' AS DateTime), 1, NULL, 38, 32, 2, 5)
INSERT [dbo].[Transactions] ([TransactionID], [TransactionDateTime], [AmountOfTransaction], [ConfirmTime], [StatusOfTransaction], [Message], [AccountID], [ReceiverID], [TransactionTypeID], [ServiceID]) VALUES (106, CAST(N'2022-09-26T17:15:20.383' AS DateTime), 50000.0000, CAST(N'2022-09-26T17:15:30.383' AS DateTime), 1, NULL, 39, 30, 2, 6)
INSERT [dbo].[Transactions] ([TransactionID], [TransactionDateTime], [AmountOfTransaction], [ConfirmTime], [StatusOfTransaction], [Message], [AccountID], [ReceiverID], [TransactionTypeID], [ServiceID]) VALUES (107, CAST(N'2022-09-26T17:15:20.387' AS DateTime), 100000.0000, CAST(N'2022-09-26T17:15:30.387' AS DateTime), 1, NULL, 40, 33, 2, 5)
INSERT [dbo].[Transactions] ([TransactionID], [TransactionDateTime], [AmountOfTransaction], [ConfirmTime], [StatusOfTransaction], [Message], [AccountID], [ReceiverID], [TransactionTypeID], [ServiceID]) VALUES (108, CAST(N'2022-09-26T17:15:20.387' AS DateTime), 100000.0000, CAST(N'2022-09-26T17:15:30.387' AS DateTime), 1, NULL, 41, 22, 2, 1)
INSERT [dbo].[Transactions] ([TransactionID], [TransactionDateTime], [AmountOfTransaction], [ConfirmTime], [StatusOfTransaction], [Message], [AccountID], [ReceiverID], [TransactionTypeID], [ServiceID]) VALUES (109, CAST(N'2022-09-26T17:15:20.387' AS DateTime), 1000000.0000, CAST(N'2022-09-26T17:15:30.387' AS DateTime), 1, NULL, 42, 24, 2, 2)
INSERT [dbo].[Transactions] ([TransactionID], [TransactionDateTime], [AmountOfTransaction], [ConfirmTime], [StatusOfTransaction], [Message], [AccountID], [ReceiverID], [TransactionTypeID], [ServiceID]) VALUES (110, CAST(N'2022-09-26T17:15:20.390' AS DateTime), 100000.0000, CAST(N'2022-09-26T17:15:30.390' AS DateTime), 1, NULL, 43, 28, 2, 3)
INSERT [dbo].[Transactions] ([TransactionID], [TransactionDateTime], [AmountOfTransaction], [ConfirmTime], [StatusOfTransaction], [Message], [AccountID], [ReceiverID], [TransactionTypeID], [ServiceID]) VALUES (111, CAST(N'2022-09-26T17:19:52.233' AS DateTime), 100000.0000, CAST(N'2022-09-26T17:20:02.233' AS DateTime), 1, NULL, 34, 32, 2, 5)
INSERT [dbo].[Transactions] ([TransactionID], [TransactionDateTime], [AmountOfTransaction], [ConfirmTime], [StatusOfTransaction], [Message], [AccountID], [ReceiverID], [TransactionTypeID], [ServiceID]) VALUES (112, CAST(N'2022-09-26T17:19:52.250' AS DateTime), 100000.0000, CAST(N'2022-09-26T17:20:02.250' AS DateTime), 1, NULL, 36, 33, 2, 5)
INSERT [dbo].[Transactions] ([TransactionID], [TransactionDateTime], [AmountOfTransaction], [ConfirmTime], [StatusOfTransaction], [Message], [AccountID], [ReceiverID], [TransactionTypeID], [ServiceID]) VALUES (113, CAST(N'2022-09-26T17:19:52.250' AS DateTime), 100000.0000, CAST(N'2022-09-26T17:20:02.250' AS DateTime), 1, NULL, 35, 32, 2, 5)
INSERT [dbo].[Transactions] ([TransactionID], [TransactionDateTime], [AmountOfTransaction], [ConfirmTime], [StatusOfTransaction], [Message], [AccountID], [ReceiverID], [TransactionTypeID], [ServiceID]) VALUES (114, CAST(N'2022-09-26T17:19:52.250' AS DateTime), 100000.0000, CAST(N'2022-09-26T17:20:02.250' AS DateTime), 1, NULL, 37, 33, 2, 5)
INSERT [dbo].[Transactions] ([TransactionID], [TransactionDateTime], [AmountOfTransaction], [ConfirmTime], [StatusOfTransaction], [Message], [AccountID], [ReceiverID], [TransactionTypeID], [ServiceID]) VALUES (115, CAST(N'2022-09-26T17:19:52.250' AS DateTime), 100000.0000, CAST(N'2022-09-26T17:20:02.250' AS DateTime), 1, NULL, 38, 32, 2, 5)
INSERT [dbo].[Transactions] ([TransactionID], [TransactionDateTime], [AmountOfTransaction], [ConfirmTime], [StatusOfTransaction], [Message], [AccountID], [ReceiverID], [TransactionTypeID], [ServiceID]) VALUES (116, CAST(N'2022-09-26T17:21:42.717' AS DateTime), 100000.0000, CAST(N'2022-09-26T17:21:52.717' AS DateTime), 1, NULL, 39, 31, 2, 5)
INSERT [dbo].[Transactions] ([TransactionID], [TransactionDateTime], [AmountOfTransaction], [ConfirmTime], [StatusOfTransaction], [Message], [AccountID], [ReceiverID], [TransactionTypeID], [ServiceID]) VALUES (117, CAST(N'2022-09-26T17:21:42.723' AS DateTime), 100000.0000, CAST(N'2022-09-26T17:21:52.723' AS DateTime), 1, NULL, 40, 31, 2, 5)
INSERT [dbo].[Transactions] ([TransactionID], [TransactionDateTime], [AmountOfTransaction], [ConfirmTime], [StatusOfTransaction], [Message], [AccountID], [ReceiverID], [TransactionTypeID], [ServiceID]) VALUES (118, CAST(N'2022-09-26T17:21:42.727' AS DateTime), 100000.0000, CAST(N'2022-09-26T17:21:52.727' AS DateTime), 1, NULL, 41, 31, 2, 5)
INSERT [dbo].[Transactions] ([TransactionID], [TransactionDateTime], [AmountOfTransaction], [ConfirmTime], [StatusOfTransaction], [Message], [AccountID], [ReceiverID], [TransactionTypeID], [ServiceID]) VALUES (119, CAST(N'2022-09-26T17:21:42.727' AS DateTime), 100000.0000, CAST(N'2022-09-26T17:21:52.727' AS DateTime), 1, NULL, 42, 31, 2, 5)
INSERT [dbo].[Transactions] ([TransactionID], [TransactionDateTime], [AmountOfTransaction], [ConfirmTime], [StatusOfTransaction], [Message], [AccountID], [ReceiverID], [TransactionTypeID], [ServiceID]) VALUES (120, CAST(N'2022-09-26T17:21:42.727' AS DateTime), 100000.0000, CAST(N'2022-09-26T17:21:52.727' AS DateTime), 1, NULL, 43, 31, 2, 5)
GO
INSERT [dbo].[TransactionType] ([TransactionTypeID], [TransactionTypeName], [TransactionDescription]) VALUES (1, N'Chuyen Tien', NULL)
INSERT [dbo].[TransactionType] ([TransactionTypeID], [TransactionTypeName], [TransactionDescription]) VALUES (2, N'Thanh toan', NULL)
INSERT [dbo].[TransactionType] ([TransactionTypeID], [TransactionTypeName], [TransactionDescription]) VALUES (3, N'Rut tien', NULL)
GO
/****** Object:  Index [unq_bankcard_accountid]    Script Date: 28/09/2022 01:03:52 ******/
ALTER TABLE [dbo].[BankAccount] ADD  CONSTRAINT [unq_bankcard_accountid] UNIQUE NONCLUSTERED 
(
	[BankCardID] ASC,
	[AccountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [FK_Account_AccountType] FOREIGN KEY([AccountTypeID])
REFERENCES [dbo].[AccountType] ([AccountType_ID])
GO
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [FK_Account_AccountType]
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [FK_Account_Customer] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customer] ([CustomerID])
GO
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [FK_Account_Customer]
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [FK_Account_Provider] FOREIGN KEY([ProviderID])
REFERENCES [dbo].[Provider] ([ProviderID])
GO
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [FK_Account_Provider]
GO
ALTER TABLE [dbo].[BankAccount]  WITH CHECK ADD  CONSTRAINT [FK_BankAccount_Account] FOREIGN KEY([AccountID])
REFERENCES [dbo].[Account] ([AccountID])
GO
ALTER TABLE [dbo].[BankAccount] CHECK CONSTRAINT [FK_BankAccount_Account]
GO
ALTER TABLE [dbo].[BankAccount]  WITH CHECK ADD  CONSTRAINT [FK_BankAccount_Bank] FOREIGN KEY([BankID])
REFERENCES [dbo].[Banks] ([BankID])
GO
ALTER TABLE [dbo].[BankAccount] CHECK CONSTRAINT [FK_BankAccount_Bank]
GO
ALTER TABLE [dbo].[Promotion]  WITH CHECK ADD  CONSTRAINT [FK_Promotion_AccountType] FOREIGN KEY([AccountTypeID])
REFERENCES [dbo].[AccountType] ([AccountType_ID])
GO
ALTER TABLE [dbo].[Promotion] CHECK CONSTRAINT [FK_Promotion_AccountType]
GO
ALTER TABLE [dbo].[ServiceProvider]  WITH CHECK ADD  CONSTRAINT [FK_ServiceProvider_Provider] FOREIGN KEY([ProviderID])
REFERENCES [dbo].[Provider] ([ProviderID])
GO
ALTER TABLE [dbo].[ServiceProvider] CHECK CONSTRAINT [FK_ServiceProvider_Provider]
GO
ALTER TABLE [dbo].[ServiceProvider]  WITH CHECK ADD  CONSTRAINT [FK_ServiceProvider_Service] FOREIGN KEY([ServiceID])
REFERENCES [dbo].[Service] ([ServiceID])
GO
ALTER TABLE [dbo].[ServiceProvider] CHECK CONSTRAINT [FK_ServiceProvider_Service]
GO
ALTER TABLE [dbo].[Tranfers]  WITH CHECK ADD  CONSTRAINT [FK_Tranfers_Account] FOREIGN KEY([AccountID])
REFERENCES [dbo].[Account] ([AccountID])
GO
ALTER TABLE [dbo].[Tranfers] CHECK CONSTRAINT [FK_Tranfers_Account]
GO
ALTER TABLE [dbo].[Tranfers]  WITH CHECK ADD  CONSTRAINT [FK_Tranfers_BankAccount] FOREIGN KEY([BankCardID])
REFERENCES [dbo].[BankAccount] ([BankCardID])
GO
ALTER TABLE [dbo].[Tranfers] CHECK CONSTRAINT [FK_Tranfers_BankAccount]
GO
ALTER TABLE [dbo].[Transactions]  WITH CHECK ADD  CONSTRAINT [FK_Transaction_Account] FOREIGN KEY([AccountID])
REFERENCES [dbo].[Account] ([AccountID])
GO
ALTER TABLE [dbo].[Transactions] CHECK CONSTRAINT [FK_Transaction_Account]
GO
ALTER TABLE [dbo].[Transactions]  WITH CHECK ADD  CONSTRAINT [FK_Transaction_Receiver] FOREIGN KEY([ReceiverID])
REFERENCES [dbo].[Account] ([AccountID])
GO
ALTER TABLE [dbo].[Transactions] CHECK CONSTRAINT [FK_Transaction_Receiver]
GO
ALTER TABLE [dbo].[Transactions]  WITH CHECK ADD  CONSTRAINT [FK_Transaction_Service] FOREIGN KEY([ServiceID])
REFERENCES [dbo].[Service] ([ServiceID])
GO
ALTER TABLE [dbo].[Transactions] CHECK CONSTRAINT [FK_Transaction_Service]
GO
ALTER TABLE [dbo].[Transactions]  WITH CHECK ADD  CONSTRAINT [FK_Transaction_TransactionType] FOREIGN KEY([TransactionTypeID])
REFERENCES [dbo].[TransactionType] ([TransactionTypeID])
GO
ALTER TABLE [dbo].[Transactions] CHECK CONSTRAINT [FK_Transaction_TransactionType]
GO
/****** Object:  Trigger [dbo].[trig_accountid_receiverid]    Script Date: 28/09/2022 01:03:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   TRIGGER [dbo].[trig_accountid_receiverid]
ON [dbo].[Transactions]
AFTER INSERT -- Tuong duong voi Before
AS  
BEGIN
	Declare @accountid int 
	select @accountid = AccountID from inserted
	Declare @receiverid int
	select @receiverid = ReceiverID from inserted
	Declare @transactiontypeid int
	select @transactiontypeid = TransactionTypeID from inserted
	if(@accountid = @receiverid and @transactiontypeid = 1) 
		BEGIN
			print 'Khong the gui tien den chinh minh trong giao dich'
		rollback
		END
END;
GO
ALTER TABLE [dbo].[Transactions] ENABLE TRIGGER [trig_accountid_receiverid]
GO
/****** Object:  Trigger [dbo].[trig_check_balance]    Script Date: 28/09/2022 01:03:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   TRIGGER [dbo].[trig_check_balance]
ON [dbo].[Transactions]
AFTER INSERT -- Tuong duong voi Before
AS  
BEGIN
	Declare @amount money
	select @amount = AmountOfTransaction from inserted
	Declare @accountid int 
	select @accountid = AccountID from inserted
	Declare @balance money
	select @balance = CurrentBalance from Account where AccountID = @accountid
	Declare @transactionid int
	select @transactionid = TransactionID from inserted
	IF(@balance > @amount)  
		BEGIN
			UPDATE Transactions SET StatusOfTransaction = 1 WHERE TransactionID = @transactionid
			Declare @receiverid int
			select @receiverid = ReceiverID from inserted
			UPDATE Account SET CurrentBalance = CurrentBalance - @amount WHERE AccountID = @accountid
			UPDATE Account SET CurrentBalance = CurrentBalance + @amount WHERE AccountID = @receiverid
		END
	ELSE
		BEGIN
			UPDATE Transactions SET StatusOfTransaction = 0 WHERE TransactionID = @transactionid
			PRINT 'Giao dich that bai vi so du khong du!'
		END
END;
GO
ALTER TABLE [dbo].[Transactions] ENABLE TRIGGER [trig_check_balance]
GO
USE [master]
GO
ALTER DATABASE [E_Wallet] SET  READ_WRITE 
GO

-- 4,5. Các nghiệp vụ truy vấn cơ bản và truy vấn hỗ trợ ra quyết định
--3.1. Đưa ra thông tin những khách hàng liên kết với ngân hàng 
select Customer.CustomerID,CustomerName,Address
from Customer inner join Account on Customer.CustomerID=Account.CustomerID
inner join BankAccount on Account.AccountID= BankAccount.AccountID
 inner join Banks on BankAccount.BankID=Banks.BankID
where BankName='Vietcombank'

--3.2. Đưa ra những nhà cung cấp cung cấp dịch vụ đặt vé xem phim
  select ProviderName
  from Service inner join ServiceProvider on ServiceProvider.ServiceID= Service.ServiceID
inner join Provider on ServiceProvider.ProviderID=Provider.ProviderID where ServiceName like 'Dat ve xem phim'
--3.3.  Đưa ra số lần giao dịch của từng dịch vụ
select t.ServiceID, count(t.TransactionID) as NoTransactions
from Transactions t 
join Service s
on t.ServiceID = s.ServiceID
group by t.ServiceID
--3.4. Đưa ra số tiền đã giao dịch trong từng tháng của từng tài khoản
select AccountID, year(TransactionDateTime) as year, month(TransactionDateTime) as month, sum(AmountOfTransaction) as TotalAmount
from Transactions
group by AccountID, year(TransactionDateTime), month(TransactionDateTime)
--3.5. Đưa ra ngân hàng được liên kết nhiều nhất
with most_bank_linked as(
	select BankID, count(AccountID) as NoLink,
	rank() over(order by count(AccountID) desc) as rnk
	from BankAccount
	group by BankID
)
select *
from most_bank_linked 
where rnk = 1
--3.6. Đưa ra dịch vụ được sử dụng nhiều nhất
with most_service_by_notransaction as(
	select t.ServiceID, count(t.TransactionID) as NoTransactions,
	rank() over(order by count(t.TransactionID) desc) as rnk
	from Transactions t 
	join Service s
	on t.ServiceID = s.ServiceID
	group by t.ServiceID
)
select *
from most_service_by_notransaction
where rnk = 1
--3.7. Số tiền đã giao dịch trong từng tháng của từng tài khoản theo từng dịch vụ trên tổng số tiền trong tháng đó
with amount_by_service_and_month as(
	select AccountID, year(TransactionDateTime) as year, month(TransactionDateTime) as month, serviceID, sum(AmountOfTransaction) as Amount
	from Transactions
	group by AccountID, year(TransactionDateTime), month(TransactionDateTime), serviceID
),
total_amount_by_month as(
	select AccountID, year(TransactionDateTime) as year, month(TransactionDateTime) as month, sum(AmountOfTransaction) as TotalAmount
	from Transactions
	group by AccountID,year(TransactionDateTime), month(TransactionDateTime)
)
select a.AccountID, a.year, a.month, a.Amount as ServiceAmount, b.TotalAmount, (a.Amount / b.TotalAmount)*100 as PercentOfTotalAmount
from amount_by_service_and_month a
join total_amount_by_month b
on a.AccountID = b.AccountID and a.year = b.year and a.month = b.month
--3.8. Tăng trưởng số tiền giao dịch của tháng này so với tháng trước theo từng khách hàng
select AccountID, year(TransactionDateTime) as year, month(TransactionDateTime) as month, sum(AmountOfTransaction) as TotalAmount, lead(sum(AmountOfTransaction), 1, null) over(partition by AccountID order by month(TransactionDateTime)) as TotalAmountNM, (-sum(AmountOfTransaction) +  lead(sum(AmountOfTransaction), 1, null) over(partition by AccountID order by month(TransactionDateTime))) / sum(AmountOfTransaction)*100 as PercentGrowth
from Transactions
group by AccountID, year(TransactionDateTime), month(TransactionDateTime)
--3.9. Tỉ lệ quay trở lại sử dụng nền tảng (Retention rate)
with account_first_transactions as(
	select AccountID, month(min(TransactionDateTime)) as first_month 
	from Transactions
	group by AccountID
),
new_account_by_month as(
	select first_month, count(AccountID) as new_account
	from account_first_transactions
	group by first_month
), 
account_retention_month as(
	select AccountID, month(TransactionDateTime) as retention_month
	from Transactions
	group by AccountID, month(TransactionDateTime)
),
retained_accounts_by_month as(
	select b.first_month, a.retention_month, count(a.AccountID) as retained_accounts
	from account_retention_month a
	left join account_first_transactions b
	on a.AccountID = b.AccountID
	group by b.first_month, a.retention_month
)
select r.first_month, r.retention_month, n.new_account, r.retained_accounts, 
r.retained_accounts / n.new_account as retention_rate
from retained_accounts_by_month r
left join new_account_by_month n
on r.first_month = n.first_month
order by 1,2
--3.10. Phân tích các giao dịch từ đó chia thành các nhóm khách hàng theo RFM Segment
with rfm as(
	select AccountID, cast(max(TransactionDateTime) as date) as last_active_day, 
	DATEDIFF(DAY, max(TransactionDateTime), getdate()) as recency,
	count(distinct TransactionID) as frequency,
	sum(AmountOfTransaction) as monetary
	from Transactions
	group by AccountID
),
rfm_percent_rank as(
	select *,
		PERCENT_RANK() over(order by recency) as recency_percent_rank,
		PERCENT_RANK() over(order by frequency) as frequency_percent_rank,
		PERCENT_RANK() over(order by monetary) as monetary_percent_rank
	from rfm
),
rfm_rank as(
	select *,
		case when recency_percent_rank > 0.75 then 4
		when recency_percent_rank > 0.5 then 3
		when recency_percent_rank > 0.25 then 2
		else 1
		end as recency_rank,
		case when frequency_percent_rank > 0.75 then 4
		when frequency_percent_rank > 0.5 then 3
		when frequency_percent_rank > 0.25 then 2
		else 1 end
		as frequency_rank,
		case when monetary_percent_rank > 0.75 then 4
		when monetary_percent_rank > 0.5 then 3
		when monetary_percent_rank > 0.25 then 2
		else 1 end
		as monetary_rank
	from rfm_percent_rank
),
rfm_rank_concat as(
	select *, concat(recency_rank, frequency_rank, monetary_rank) as rfm_rank
	from rfm_rank
)
select *,
case WHEN rfm_rank  =  111 THEN 'Best Customers'
        WHEN rfm_rank LIKE '[3-4][3-4][1-4]' THEN 'Lost Bad Customer'
        WHEN rfm_rank LIKE '[3-4]2[1-4]' THEN 'Lost Customers'
        WHEN rfm_rank LIKE  '21[1-4]' THEN 'Almost Lost'
        WHEN rfm_rank LIKE  '11[2-4]' THEN 'Loyal Customers'
        WHEN rfm_rank LIKE  '[1-2][1-3]1' THEN 'Big Spenders'
        WHEN rfm_rank LIKE  '[1-2]4[1-4]' THEN 'New Customers'
        WHEN rfm_rank LIKE  '[3-4]1[1-4]' THEN 'Hibernating'
        WHEN rfm_rank LIKE  '[1-2][2-3][2-4]' THEN 'Potential Loyalists'
	else 'Unknown'
end 
as rfm_segment
from rfm_rank_concat

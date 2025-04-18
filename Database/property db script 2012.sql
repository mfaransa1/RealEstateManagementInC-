USE [master]
GO
/****** Object:  Database [Propertydb]    Script Date: 5/8/2015 11:36:32 AM ******/
CREATE DATABASE [Propertydb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Propertydb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\Propertydb.mdf' , SIZE = 3136KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Propertydb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\Propertydb_log.ldf' , SIZE = 784KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Propertydb] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Propertydb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Propertydb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Propertydb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Propertydb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Propertydb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Propertydb] SET ARITHABORT OFF 
GO
ALTER DATABASE [Propertydb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Propertydb] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [Propertydb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Propertydb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Propertydb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Propertydb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Propertydb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Propertydb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Propertydb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Propertydb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Propertydb] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Propertydb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Propertydb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Propertydb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Propertydb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Propertydb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Propertydb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Propertydb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Propertydb] SET RECOVERY FULL 
GO
ALTER DATABASE [Propertydb] SET  MULTI_USER 
GO
ALTER DATABASE [Propertydb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Propertydb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Propertydb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Propertydb] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Propertydb', N'ON'
GO
USE [Propertydb]
GO
/****** Object:  Table [dbo].[tbl_Advertisement_Type]    Script Date: 5/8/2015 11:36:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_Advertisement_Type](
	[Advt_TypeId] [int] IDENTITY(1,1) NOT NULL,
	[Advt_Type] [varchar](50) NOT NULL,
	[Advt_Desc] [varchar](250) NULL,
 CONSTRAINT [PK_tbl_Advertisement_Type] PRIMARY KEY CLUSTERED 
(
	[Advt_TypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_AdvertisementDetails]    Script Date: 5/8/2015 11:36:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_AdvertisementDetails](
	[AdvtId] [int] IDENTITY(1,1) NOT NULL,
	[Advt_TypeId] [int] NOT NULL,
	[Advt_Title] [varchar](255) NOT NULL,
	[Advt_Company] [varchar](255) NOT NULL,
	[Publish_Date] [datetime] NOT NULL,
	[Expiry_Date] [datetime] NOT NULL,
	[Image] [varchar](255) NOT NULL,
	[Display_Time] [int] NULL,
	[Fee] [money] NULL,
	[Target_Url] [varchar](255) NULL,
	[Short_Desc] [varchar](255) NULL,
	[Status_Id] [int] NOT NULL,
	[Created_On] [datetime] NULL,
	[Created_By] [varchar](50) NULL,
	[Updated_On] [datetime] NULL,
	[Updated_By] [varchar](50) NULL,
 CONSTRAINT [PK_tbl_AdvertisementDetails] PRIMARY KEY CLUSTERED 
(
	[AdvtId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_BuildingType]    Script Date: 5/8/2015 11:36:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_BuildingType](
	[Building_Id] [int] IDENTITY(1,1) NOT NULL,
	[BuildingType_Name] [varchar](100) NOT NULL,
	[Description] [varchar](1000) NULL,
	[RoomType_Id] [int] NOT NULL,
	[PropertyType] [varchar](50) NULL,
 CONSTRAINT [PK_tbl_BuildingType] PRIMARY KEY CLUSTERED 
(
	[Building_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_Country]    Script Date: 5/8/2015 11:36:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_Country](
	[CountryId] [int] IDENTITY(1,1) NOT NULL,
	[CountryName] [varchar](50) NULL,
	[CountryDescription] [varchar](255) NULL,
	[StatusId] [int] NOT NULL,
 CONSTRAINT [PK_tbl_Country] PRIMARY KEY CLUSTERED 
(
	[CountryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_District]    Script Date: 5/8/2015 11:36:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_District](
	[DistrictId] [int] IDENTITY(1,1) NOT NULL,
	[DistrictName] [varchar](100) NOT NULL,
	[DistrictDescription] [varchar](100) NULL,
	[StateId] [int] NOT NULL,
	[CountryId] [int] NOT NULL,
	[StatusId] [int] NOT NULL,
 CONSTRAINT [PK_tbl_District] PRIMARY KEY CLUSTERED 
(
	[DistrictId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_Marquee]    Script Date: 5/8/2015 11:36:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_Marquee](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Text] [varchar](255) NULL,
	[Behavior] [varchar](100) NULL,
	[Direction] [varchar](50) NULL,
	[BgColor] [varchar](50) NULL,
	[TextColor] [varchar](50) NULL,
	[ScrollDelay] [int] NULL,
	[FontSize] [varchar](50) NULL,
	[RecNo] [int] NULL,
	[Flag] [tinyint] NULL,
 CONSTRAINT [PK_tbl_Marquee] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_Member_Details]    Script Date: 5/8/2015 11:36:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_Member_Details](
	[MemberId] [varchar](20) NOT NULL,
	[MemberName] [varchar](60) NOT NULL,
	[DateOfBirth] [datetime] NOT NULL,
	[ContactNo] [varchar](20) NOT NULL,
	[EmailId] [varchar](100) NOT NULL,
	[AddressLine] [varchar](250) NOT NULL,
	[CountryId] [int] NOT NULL,
	[StateId] [int] NOT NULL,
	[DistrictId] [int] NOT NULL,
	[Advertiser] [varchar](60) NOT NULL,
	[Realtor] [varchar](150) NULL,
	[MemberImage] [varchar](150) NULL,
 CONSTRAINT [PK_tbl_Member_Details] PRIMARY KEY CLUSTERED 
(
	[MemberId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_Member_Login]    Script Date: 5/8/2015 11:36:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_Member_Login](
	[MemberId] [varchar](20) NOT NULL,
	[Password] [varchar](20) NOT NULL,
 CONSTRAINT [PK_tbl_Member_Login] PRIMARY KEY CLUSTERED 
(
	[MemberId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_Property_Details]    Script Date: 5/8/2015 11:36:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_Property_Details](
	[PropertyId] [int] IDENTITY(1,1) NOT NULL,
	[PropertyType] [varchar](60) NOT NULL,
	[Sale_Rent] [varchar](50) NOT NULL,
	[RoomType] [varchar](100) NOT NULL,
	[BuildingType] [varchar](100) NOT NULL,
	[Bldg_Blk_HseNo] [varchar](100) NOT NULL,
	[Street_Name] [varchar](200) NOT NULL,
	[Unit_No] [varchar](60) NULL,
	[Building_Estate_Name] [varchar](100) NULL,
	[Postal_Code] [varchar](20) NULL,
	[CountryId] [int] NOT NULL,
	[StateId] [int] NOT NULL,
	[DistrictId] [int] NOT NULL,
	[Price] [numeric](10, 2) NOT NULL,
	[Valuation] [numeric](10, 2) NULL,
	[Built_In_Area] [numeric](10, 2) NULL,
	[Tenure] [varchar](100) NULL,
	[Age] [varchar](50) NULL,
	[No_Of_BedRooms] [int] NULL,
	[PaymentPerAd] [numeric](10, 2) NULL,
	[Summary] [varchar](255) NULL,
	[Description] [text] NULL,
	[Image1] [varchar](100) NULL,
	[Image1_Description] [varchar](255) NULL,
	[Image2] [varchar](100) NULL,
	[Image2_Description] [varchar](255) NULL,
	[Image3] [varchar](100) NULL,
	[Image3_Description] [varchar](255) NULL,
	[StartDate] [datetime] NULL,
	[ExpiryDate] [datetime] NULL,
	[AdPostedOn] [datetime] NULL,
	[LastEditedOn] [datetime] NULL,
	[MemberId] [varchar](20) NULL,
	[StatusId] [int] NOT NULL,
	[DisplayInAd_BldgHouseNo] [smallint] NULL,
	[SetAsMainPhoto] [char](1) NULL,
	[ThumbImage1] [varchar](150) NULL,
	[ThumbImage2] [varchar](150) NULL,
	[ThumbImage3] [varchar](150) NULL,
	[SmallImage1] [varchar](150) NULL,
	[SmallImage2] [varchar](150) NULL,
	[SmallImage3] [varchar](150) NULL,
 CONSTRAINT [PK_tbl_Property_Details] PRIMARY KEY CLUSTERED 
(
	[PropertyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_Renewal]    Script Date: 5/8/2015 11:36:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_Renewal](
	[MemberId] [varchar](20) NOT NULL,
	[PropertyId] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_RoomType]    Script Date: 5/8/2015 11:36:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_RoomType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoomTypeName] [varchar](100) NOT NULL,
	[TypeDescription] [varchar](255) NULL,
 CONSTRAINT [PK_tbl_RoomType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_State]    Script Date: 5/8/2015 11:36:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_State](
	[StateId] [int] IDENTITY(1,1) NOT NULL,
	[StateName] [varchar](100) NULL,
	[StateDescription] [varchar](100) NULL,
	[CountryId] [int] NULL,
	[StatusId] [int] NULL,
 CONSTRAINT [PK_tbl_State] PRIMARY KEY CLUSTERED 
(
	[StateId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_Status]    Script Date: 5/8/2015 11:36:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_Status](
	[StatusId] [int] IDENTITY(1,1) NOT NULL,
	[StatusName] [varchar](100) NOT NULL,
	[StatusDescription] [varchar](255) NULL,
 CONSTRAINT [PK_tbl_Status] PRIMARY KEY CLUSTERED 
(
	[StatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_Users]    Script Date: 5/8/2015 11:36:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_Users](
	[User_Id] [varchar](100) NOT NULL,
	[Password] [varchar](50) NOT NULL,
 CONSTRAINT [PK_tbl_Users] PRIMARY KEY CLUSTERED 
(
	[User_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_Advertisement_Type] ON 

INSERT [dbo].[tbl_Advertisement_Type] ([Advt_TypeId], [Advt_Type], [Advt_Desc]) VALUES (1, N'Banner', NULL)
INSERT [dbo].[tbl_Advertisement_Type] ([Advt_TypeId], [Advt_Type], [Advt_Desc]) VALUES (2, N'Small Ad', NULL)
SET IDENTITY_INSERT [dbo].[tbl_Advertisement_Type] OFF
SET IDENTITY_INSERT [dbo].[tbl_AdvertisementDetails] ON 

INSERT [dbo].[tbl_AdvertisementDetails] ([AdvtId], [Advt_TypeId], [Advt_Title], [Advt_Company], [Publish_Date], [Expiry_Date], [Image], [Display_Time], [Fee], [Target_Url], [Short_Desc], [Status_Id], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (1, 1, N'Banner1', N'Dhanush Technology', CAST(0x00009A1300000000 AS DateTime), CAST(0x00009A5000000000 AS DateTime), N'e_banking_pgintr.jpg', 2, 0.0000, N'', N'This is for Sample', 1, CAST(0x00009A13014AE3D0 AS DateTime), N'rakesh', CAST(0x00009A13014B1184 AS DateTime), N'rakesh')
INSERT [dbo].[tbl_AdvertisementDetails] ([AdvtId], [Advt_TypeId], [Advt_Title], [Advt_Company], [Publish_Date], [Expiry_Date], [Image], [Display_Time], [Fee], [Target_Url], [Short_Desc], [Status_Id], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (2, 1, N'Banner2', N'Satyam', CAST(0x00009A1400000000 AS DateTime), CAST(0x00009A2E00000000 AS DateTime), N'F60.gif', 2, 0.0000, N'', N'', 1, CAST(0x00009A1400DF35CC AS DateTime), N'rakesh', CAST(0x00009A1400DF35CC AS DateTime), N'rakesh')
INSERT [dbo].[tbl_AdvertisementDetails] ([AdvtId], [Advt_TypeId], [Advt_Title], [Advt_Company], [Publish_Date], [Expiry_Date], [Image], [Display_Time], [Fee], [Target_Url], [Short_Desc], [Status_Id], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (3, 1, N'Banner3', N'Infosys', CAST(0x00009A1400000000 AS DateTime), CAST(0x00009BA100000000 AS DateTime), N'banner4.jpg', 3, 0.0000, N'', N'', 1, CAST(0x00009A1400E03094 AS DateTime), N'rakesh', CAST(0x00009A4900A540B0 AS DateTime), N'rakesh')
INSERT [dbo].[tbl_AdvertisementDetails] ([AdvtId], [Advt_TypeId], [Advt_Title], [Advt_Company], [Publish_Date], [Expiry_Date], [Image], [Display_Time], [Fee], [Target_Url], [Short_Desc], [Status_Id], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (4, 2, N'ABC1', N'ABC', CAST(0x00009A1400000000 AS DateTime), CAST(0x00009B9900000000 AS DateTime), N'building2.jpg', 4, 5000.0000, N'', N'', 1, CAST(0x00009A1400E5B834 AS DateTime), N'rakesh', CAST(0x00009A4900A453F8 AS DateTime), N'rakesh')
INSERT [dbo].[tbl_AdvertisementDetails] ([AdvtId], [Advt_TypeId], [Advt_Title], [Advt_Company], [Publish_Date], [Expiry_Date], [Image], [Display_Time], [Fee], [Target_Url], [Short_Desc], [Status_Id], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (5, 2, N'ABC2', N'ABC PVT.', CAST(0x00009A1400000000 AS DateTime), CAST(0x00009B9A00000000 AS DateTime), N'building1.jpg', 3, 4500.0000, N'', N'', 1, CAST(0x00009A1400E67F6C AS DateTime), N'rakesh', CAST(0x00009A4900A46910 AS DateTime), N'rakesh')
INSERT [dbo].[tbl_AdvertisementDetails] ([AdvtId], [Advt_TypeId], [Advt_Title], [Advt_Company], [Publish_Date], [Expiry_Date], [Image], [Display_Time], [Fee], [Target_Url], [Short_Desc], [Status_Id], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (6, 1, N'Flots for Rent', N'Obli Group Company Ltd', CAST(0x00009A4A00000000 AS DateTime), CAST(0x00009BAF00000000 AS DateTime), N'si-468x60-4.gif', 5, 4500.0000, N'obli@ogc.com', N'Flots Avaliable', 1, CAST(0x00009A4800CA6C50 AS DateTime), N'rakesh', CAST(0x00009A4900A3F3E0 AS DateTime), N'rakesh')
INSERT [dbo].[tbl_AdvertisementDetails] ([AdvtId], [Advt_TypeId], [Advt_Title], [Advt_Company], [Publish_Date], [Expiry_Date], [Image], [Display_Time], [Fee], [Target_Url], [Short_Desc], [Status_Id], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (7, 1, N'Tours & Travels', N'Anji Travels', CAST(0x00009A4000000000 AS DateTime), CAST(0x00009BAE00000000 AS DateTime), N'banner_fahrni.jpg', 5, 7000.0000, N'anji@anjitravels.com', N'Best Tour Packages', 1, CAST(0x00009A4800CB12B8 AS DateTime), N'rakesh', CAST(0x00009A4800D25EB0 AS DateTime), N'rakesh')
INSERT [dbo].[tbl_AdvertisementDetails] ([AdvtId], [Advt_TypeId], [Advt_Title], [Advt_Company], [Publish_Date], [Expiry_Date], [Image], [Display_Time], [Fee], [Target_Url], [Short_Desc], [Status_Id], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (8, 2, N'Childern Welfare', N'Bajai Group', CAST(0x00009A4A00000000 AS DateTime), CAST(0x00009BB600000000 AS DateTime), N'alankar.jpg', 3, 3500.0000, N'bajaj@insure.com', N'Best Services', 1, CAST(0x00009A4800CCE19C AS DateTime), N'rakesh', CAST(0x00009A4900A614CC AS DateTime), N'rakesh')
INSERT [dbo].[tbl_AdvertisementDetails] ([AdvtId], [Advt_TypeId], [Advt_Title], [Advt_Company], [Publish_Date], [Expiry_Date], [Image], [Display_Time], [Fee], [Target_Url], [Short_Desc], [Status_Id], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (9, 2, N'WebHosting Solutions', N'Intel Group', CAST(0x00009A4B00000000 AS DateTime), CAST(0x00009BB800000000 AS DateTime), N'bus2.jpg', 5, 6000.0000, N'intel@whs.com', N'WebHosing Services', 1, CAST(0x00009A4800CD48BC AS DateTime), N'rakesh', CAST(0x00009A48011BE0A8 AS DateTime), N'rakesh')
INSERT [dbo].[tbl_AdvertisementDetails] ([AdvtId], [Advt_TypeId], [Advt_Title], [Advt_Company], [Publish_Date], [Expiry_Date], [Image], [Display_Time], [Fee], [Target_Url], [Short_Desc], [Status_Id], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (10, 1, N'Help', N'HCL', CAST(0x00009A4300000000 AS DateTime), CAST(0x00009BBE00000000 AS DateTime), N'banner21.jpg', 2, 8000.0000, N'www.hclcorporation.com', N'For Help Contact', 1, CAST(0x00009A4800CF894C AS DateTime), N'rakesh', CAST(0x00009A4900A58124 AS DateTime), N'rakesh')
INSERT [dbo].[tbl_AdvertisementDetails] ([AdvtId], [Advt_TypeId], [Advt_Title], [Advt_Company], [Publish_Date], [Expiry_Date], [Image], [Display_Time], [Fee], [Target_Url], [Short_Desc], [Status_Id], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (11, 2, N'Technical', N'MicroSoft', CAST(0x00009A4900000000 AS DateTime), CAST(0x00009BB700000000 AS DateTime), N'adview.gif', 4, 5000.0000, N'www.MicroSoft.com', N'About Asp.Net', 1, CAST(0x00009A4900A78974 AS DateTime), N'rakesh', CAST(0x00009A4900A84878 AS DateTime), N'rakesh')
INSERT [dbo].[tbl_AdvertisementDetails] ([AdvtId], [Advt_TypeId], [Advt_Title], [Advt_Company], [Publish_Date], [Expiry_Date], [Image], [Display_Time], [Fee], [Target_Url], [Short_Desc], [Status_Id], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (12, 2, N'MicroSoft', N'MicroSoft', CAST(0x00009A4900000000 AS DateTime), CAST(0x00009A4B00000000 AS DateTime), N'adview1.gif', 5, 6000.0000, N'www.MicroSoft.com', N'About Asp.Net', 1, CAST(0x00009A4900A81D1C AS DateTime), N'rakesh', CAST(0x00009A4900A84170 AS DateTime), N'rakesh')
INSERT [dbo].[tbl_AdvertisementDetails] ([AdvtId], [Advt_TypeId], [Advt_Title], [Advt_Company], [Publish_Date], [Expiry_Date], [Image], [Display_Time], [Fee], [Target_Url], [Short_Desc], [Status_Id], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (13, 2, N'Mantra', N'Mantra', CAST(0x00009A4900000000 AS DateTime), CAST(0x00009BBC00000000 AS DateTime), N'GENIE.GIF', 4, 6000.0000, N'www.mantra.com', N'House of Ghost with Cheap Cost', 1, CAST(0x00009A4900A97F04 AS DateTime), N'rakesh', CAST(0x00009A4900AA1630 AS DateTime), N'rakesh')
INSERT [dbo].[tbl_AdvertisementDetails] ([AdvtId], [Advt_TypeId], [Advt_Title], [Advt_Company], [Publish_Date], [Expiry_Date], [Image], [Display_Time], [Fee], [Target_Url], [Short_Desc], [Status_Id], [Created_On], [Created_By], [Updated_On], [Updated_By]) VALUES (14, 2, N'WebTemplate', N'GMR Group', CAST(0x00009A4900000000 AS DateTime), CAST(0x00009BAE00000000 AS DateTime), N'justwebtemplates.gif', 4, 8000.0000, N'www.gmrgroup.com', N'Large Ventures in India', 1, CAST(0x00009A4900BE9CE0 AS DateTime), N'rakesh', CAST(0x00009A4900BE9CE0 AS DateTime), N'rakesh')
SET IDENTITY_INSERT [dbo].[tbl_AdvertisementDetails] OFF
SET IDENTITY_INSERT [dbo].[tbl_BuildingType] ON 

INSERT [dbo].[tbl_BuildingType] ([Building_Id], [BuildingType_Name], [Description], [RoomType_Id], [PropertyType]) VALUES (2, N'Studio', N'Studio Type', 2, N'Residential')
INSERT [dbo].[tbl_BuildingType] ([Building_Id], [BuildingType_Name], [Description], [RoomType_Id], [PropertyType]) VALUES (3, N'HUDC', N'HUDC', 1, N'Residential')
INSERT [dbo].[tbl_BuildingType] ([Building_Id], [BuildingType_Name], [Description], [RoomType_Id], [PropertyType]) VALUES (4, N'Office Space', N'Office Purpose', 3, N'Commercial')
SET IDENTITY_INSERT [dbo].[tbl_BuildingType] OFF
SET IDENTITY_INSERT [dbo].[tbl_Country] ON 

INSERT [dbo].[tbl_Country] ([CountryId], [CountryName], [CountryDescription], [StatusId]) VALUES (1, N'India', N'this is India', 1)
INSERT [dbo].[tbl_Country] ([CountryId], [CountryName], [CountryDescription], [StatusId]) VALUES (2, N'US', N'America', 1)
SET IDENTITY_INSERT [dbo].[tbl_Country] OFF
SET IDENTITY_INSERT [dbo].[tbl_District] ON 

INSERT [dbo].[tbl_District] ([DistrictId], [DistrictName], [DistrictDescription], [StateId], [CountryId], [StatusId]) VALUES (1, N'Krishna', N'krishna', 1, 1, 1)
INSERT [dbo].[tbl_District] ([DistrictId], [DistrictName], [DistrictDescription], [StateId], [CountryId], [StatusId]) VALUES (2, N'Guntur', N'guntur', 1, 1, 1)
SET IDENTITY_INSERT [dbo].[tbl_District] OFF
SET IDENTITY_INSERT [dbo].[tbl_Marquee] ON 

INSERT [dbo].[tbl_Marquee] ([Id], [Text], [Behavior], [Direction], [BgColor], [TextColor], [ScrollDelay], [FontSize], [RecNo], [Flag]) VALUES (1, N'Welcome to Land.Net', N'Alternate', N'Left', N'#FFCCFF', N'#0000FF', 11, N'10pt', 1, 1)
INSERT [dbo].[tbl_Marquee] ([Id], [Text], [Behavior], [Direction], [BgColor], [TextColor], [ScrollDelay], [FontSize], [RecNo], [Flag]) VALUES (2, N'hai this is property search website', N'Alternate', N'Left', N'#6600FF', N'#33FF33', 10, N'20pt', 2, 0)
SET IDENTITY_INSERT [dbo].[tbl_Marquee] OFF
INSERT [dbo].[tbl_Member_Details] ([MemberId], [MemberName], [DateOfBirth], [ContactNo], [EmailId], [AddressLine], [CountryId], [StateId], [DistrictId], [Advertiser], [Realtor], [MemberImage]) VALUES (N'9989018427', N'Rakesh singh', CAST(0x0000743600000000 AS DateTime), N'9989018427', N'rakesh@yahoo.com', N'1-1-10/A/2', 1, 1, 2, N'Agent', N'', N'Target_Vic.jpg')
INSERT [dbo].[tbl_Member_Details] ([MemberId], [MemberName], [DateOfBirth], [ContactNo], [EmailId], [AddressLine], [CountryId], [StateId], [DistrictId], [Advertiser], [Realtor], [MemberImage]) VALUES (N'anji', N'Anji', CAST(0x0000781500000000 AS DateTime), N'97784754875', N'anji@gmail.com', N'Kondapalli, Vajayawada', 1, 1, 1, N'Agent', N'Yes', N'Target_Viswanath.jpg')
INSERT [dbo].[tbl_Member_Details] ([MemberId], [MemberName], [DateOfBirth], [ContactNo], [EmailId], [AddressLine], [CountryId], [StateId], [DistrictId], [Advertiser], [Realtor], [MemberImage]) VALUES (N'asd', N'Anusha', CAST(0x000099FA00000000 AS DateTime), N'898989765', N'asdfa@asd.com', N'Governorpeta, Vijayawada', 1, 1, 2, N'Owner', N'NO', N'Target_Zena.jpg')
INSERT [dbo].[tbl_Member_Details] ([MemberId], [MemberName], [DateOfBirth], [ContactNo], [EmailId], [AddressLine], [CountryId], [StateId], [DistrictId], [Advertiser], [Realtor], [MemberImage]) VALUES (N'azeem', N'pasha', CAST(0x00009A7F00000000 AS DateTime), N'9848022338', N'azeem@gmail.com', N'khamam', 1, 1, 1, N'Owner', N'ap', N'')
INSERT [dbo].[tbl_Member_Details] ([MemberId], [MemberName], [DateOfBirth], [ContactNo], [EmailId], [AddressLine], [CountryId], [StateId], [DistrictId], [Advertiser], [Realtor], [MemberImage]) VALUES (N'ganesh', N'ganesh', CAST(0x0000A47500000000 AS DateTime), N'9848022338', N'ganesh@gmail.com', N'good', 1, 1, 1, N'Owner', N'good', N'')
INSERT [dbo].[tbl_Member_Details] ([MemberId], [MemberName], [DateOfBirth], [ContactNo], [EmailId], [AddressLine], [CountryId], [StateId], [DistrictId], [Advertiser], [Realtor], [MemberImage]) VALUES (N'gopi', N'GopiKrishna', CAST(0x000076A100000000 AS DateTime), N'040343433', N'gopi@rediffmail.com', N'Kukatpalli, Hyderabad', 1, 1, 2, N'Owner', N'No', N'Target_Vincent.jpg')
INSERT [dbo].[tbl_Member_Details] ([MemberId], [MemberName], [DateOfBirth], [ContactNo], [EmailId], [AddressLine], [CountryId], [StateId], [DistrictId], [Advertiser], [Realtor], [MemberImage]) VALUES (N'kumar', N'Kumar', CAST(0x0000723A00000000 AS DateTime), N'040343433', N'kumar@hotmail.com', N'Poolapalli,Palakol', 1, 1, 1, N'Owner', N'No', N'Target_Yoko.jpg')
INSERT [dbo].[tbl_Member_Details] ([MemberId], [MemberName], [DateOfBirth], [ContactNo], [EmailId], [AddressLine], [CountryId], [StateId], [DistrictId], [Advertiser], [Realtor], [MemberImage]) VALUES (N'murthy', N'Sriram', CAST(0x0000780600000000 AS DateTime), N'97784754875', N'murthy@gmail.com', N'SR Nagar,Hyderabad', 1, 1, 1, N'Owner', N'Yes', N'Target_Vic.jpg')
INSERT [dbo].[tbl_Member_Details] ([MemberId], [MemberName], [DateOfBirth], [ContactNo], [EmailId], [AddressLine], [CountryId], [StateId], [DistrictId], [Advertiser], [Realtor], [MemberImage]) VALUES (N'rakesh', N'rakesh', CAST(0x00009A0800000000 AS DateTime), N'9090909090', N'rakesh@asd.com', N'asdf asdf', 1, 1, 1, N'Owner', N'asdf', N'Target_Winsha.jpg')
INSERT [dbo].[tbl_Member_Details] ([MemberId], [MemberName], [DateOfBirth], [ContactNo], [EmailId], [AddressLine], [CountryId], [StateId], [DistrictId], [Advertiser], [Realtor], [MemberImage]) VALUES (N'ramkrishna', N'ram', CAST(0x0000A47A00000000 AS DateTime), N'9848022338', N'ramkrishna', N'ammerpeat', 1, 1, 1, N'Owner', N'good', N'')
INSERT [dbo].[tbl_Member_Login] ([MemberId], [Password]) VALUES (N'9989018427', N'rakesh123')
INSERT [dbo].[tbl_Member_Login] ([MemberId], [Password]) VALUES (N'anji', N'anji')
INSERT [dbo].[tbl_Member_Login] ([MemberId], [Password]) VALUES (N'asd', N'asd')
INSERT [dbo].[tbl_Member_Login] ([MemberId], [Password]) VALUES (N'azeem', N'123')
INSERT [dbo].[tbl_Member_Login] ([MemberId], [Password]) VALUES (N'ganesh', N'123')
INSERT [dbo].[tbl_Member_Login] ([MemberId], [Password]) VALUES (N'gopi', N'gopi')
INSERT [dbo].[tbl_Member_Login] ([MemberId], [Password]) VALUES (N'kumar', N'kumar')
INSERT [dbo].[tbl_Member_Login] ([MemberId], [Password]) VALUES (N'murthy', N'murthy')
INSERT [dbo].[tbl_Member_Login] ([MemberId], [Password]) VALUES (N'rakesh', N'rakesh123')
INSERT [dbo].[tbl_Member_Login] ([MemberId], [Password]) VALUES (N'ramkrishna', N'ram')
SET IDENTITY_INSERT [dbo].[tbl_Property_Details] ON 

INSERT [dbo].[tbl_Property_Details] ([PropertyId], [PropertyType], [Sale_Rent], [RoomType], [BuildingType], [Bldg_Blk_HseNo], [Street_Name], [Unit_No], [Building_Estate_Name], [Postal_Code], [CountryId], [StateId], [DistrictId], [Price], [Valuation], [Built_In_Area], [Tenure], [Age], [No_Of_BedRooms], [PaymentPerAd], [Summary], [Description], [Image1], [Image1_Description], [Image2], [Image2_Description], [Image3], [Image3_Description], [StartDate], [ExpiryDate], [AdPostedOn], [LastEditedOn], [MemberId], [StatusId], [DisplayInAd_BldgHouseNo], [SetAsMainPhoto], [ThumbImage1], [ThumbImage2], [ThumbImage3], [SmallImage1], [SmallImage2], [SmallImage3]) VALUES (1, N'Residential', N'Rent', N'PRIVATE', N'Studio', N'asd', N'asd', N'asdzxc', N'asd', N'5656565656', 1, 1, 1, CAST(3434.00 AS Numeric(10, 2)), CAST(34534.00 AS Numeric(10, 2)), CAST(3434.00 AS Numeric(10, 2)), N'2', N'34', 3, NULL, N'asd', N'ass', N'Sunset.jpg', N'sunset', N'Winter.jpg', N'wintrer', N'Water lilies.jpg', N'water', CAST(0x00009A1400000000 AS DateTime), CAST(0x00009ACB00033A2C AS DateTime), CAST(0x00009A1400000000 AS DateTime), CAST(0x00009A1400000000 AS DateTime), N'rakesh', 1, NULL, N'1', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tbl_Property_Details] ([PropertyId], [PropertyType], [Sale_Rent], [RoomType], [BuildingType], [Bldg_Blk_HseNo], [Street_Name], [Unit_No], [Building_Estate_Name], [Postal_Code], [CountryId], [StateId], [DistrictId], [Price], [Valuation], [Built_In_Area], [Tenure], [Age], [No_Of_BedRooms], [PaymentPerAd], [Summary], [Description], [Image1], [Image1_Description], [Image2], [Image2_Description], [Image3], [Image3_Description], [StartDate], [ExpiryDate], [AdPostedOn], [LastEditedOn], [MemberId], [StatusId], [DisplayInAd_BldgHouseNo], [SetAsMainPhoto], [ThumbImage1], [ThumbImage2], [ThumbImage3], [SmallImage1], [SmallImage2], [SmallImage3]) VALUES (2, N'Commercial', N'Rent', N'Commercial', N'Studio', N'123', N'123', N'12345', N'123', N'234', 1, 1, 1, CAST(1234.00 AS Numeric(10, 2)), CAST(123.00 AS Numeric(10, 2)), CAST(123.00 AS Numeric(10, 2)), N'3', N'12', 2, NULL, N'adf', N'asdf', N'Sunset.jpg', N'asdf', N'Winter.jpg', N'asdf', N'Water lilies.jpg', N'asdf', CAST(0x00009A1400000000 AS DateTime), CAST(0x00009ACB00142FF8 AS DateTime), CAST(0x00009A1400000000 AS DateTime), CAST(0x00009A1400000000 AS DateTime), N'rakesh', 1, NULL, N'1', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tbl_Property_Details] ([PropertyId], [PropertyType], [Sale_Rent], [RoomType], [BuildingType], [Bldg_Blk_HseNo], [Street_Name], [Unit_No], [Building_Estate_Name], [Postal_Code], [CountryId], [StateId], [DistrictId], [Price], [Valuation], [Built_In_Area], [Tenure], [Age], [No_Of_BedRooms], [PaymentPerAd], [Summary], [Description], [Image1], [Image1_Description], [Image2], [Image2_Description], [Image3], [Image3_Description], [StartDate], [ExpiryDate], [AdPostedOn], [LastEditedOn], [MemberId], [StatusId], [DisplayInAd_BldgHouseNo], [SetAsMainPhoto], [ThumbImage1], [ThumbImage2], [ThumbImage3], [SmallImage1], [SmallImage2], [SmallImage3]) VALUES (3, N'Commercial', N'Rent', N'Commercial', N'Office Space', N'asdf', N'asdf', N'wrewer', N'wer', N'wer', 1, 1, 1, CAST(234.00 AS Numeric(10, 2)), CAST(234.00 AS Numeric(10, 2)), CAST(345.00 AS Numeric(10, 2)), N'3', N'23', 2, NULL, N'qwaer', N'asdf', N'Winter.jpg', N'asd', N'Blue hills.jpg', N'asdf', N'Water lilies.jpg', N'awdef', CAST(0x00009A1400000000 AS DateTime), CAST(0x00009ACB002945A0 AS DateTime), CAST(0x00009A1400000000 AS DateTime), CAST(0x00009A1400000000 AS DateTime), N'rakesh', 1, NULL, N'1', N'Winter.jpg', N'Winter.jpg', N'Winter.jpg', N'Winter.jpg', N'Winter.jpg', N'Winter.jpg')
INSERT [dbo].[tbl_Property_Details] ([PropertyId], [PropertyType], [Sale_Rent], [RoomType], [BuildingType], [Bldg_Blk_HseNo], [Street_Name], [Unit_No], [Building_Estate_Name], [Postal_Code], [CountryId], [StateId], [DistrictId], [Price], [Valuation], [Built_In_Area], [Tenure], [Age], [No_Of_BedRooms], [PaymentPerAd], [Summary], [Description], [Image1], [Image1_Description], [Image2], [Image2_Description], [Image3], [Image3_Description], [StartDate], [ExpiryDate], [AdPostedOn], [LastEditedOn], [MemberId], [StatusId], [DisplayInAd_BldgHouseNo], [SetAsMainPhoto], [ThumbImage1], [ThumbImage2], [ThumbImage3], [SmallImage1], [SmallImage2], [SmallImage3]) VALUES (6, N'Residential', N'Rent', N'PRIVATE', N'HUDC', N'78j89', N'87', N'78hhjhjhjk', N'yuiui', N'78787878', 1, 1, 1, CAST(7878.00 AS Numeric(10, 2)), CAST(7878.00 AS Numeric(10, 2)), CAST(7878.00 AS Numeric(10, 2)), N'2', N'7', 3, NULL, N'uyhjkhjkhjkh jkhjkhjkhjkhjkhjkhjkh', N'hjjkhjhjk jhjkhj', N'building.jpg', N'sefawerwer', N'building2.jpg', N'werqwer', N'building7.jpg', N'wqerqwerw', CAST(0x00009A1400000000 AS DateTime), CAST(0x00009ACB010BC600 AS DateTime), CAST(0x00009A1400000000 AS DateTime), CAST(0x00009A1400000000 AS DateTime), N'rakesh', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tbl_Property_Details] ([PropertyId], [PropertyType], [Sale_Rent], [RoomType], [BuildingType], [Bldg_Blk_HseNo], [Street_Name], [Unit_No], [Building_Estate_Name], [Postal_Code], [CountryId], [StateId], [DistrictId], [Price], [Valuation], [Built_In_Area], [Tenure], [Age], [No_Of_BedRooms], [PaymentPerAd], [Summary], [Description], [Image1], [Image1_Description], [Image2], [Image2_Description], [Image3], [Image3_Description], [StartDate], [ExpiryDate], [AdPostedOn], [LastEditedOn], [MemberId], [StatusId], [DisplayInAd_BldgHouseNo], [SetAsMainPhoto], [ThumbImage1], [ThumbImage2], [ThumbImage3], [SmallImage1], [SmallImage2], [SmallImage3]) VALUES (7, N'Commercial', N'Rent', N'Commercial', N'Studio', N'iouio89`iouoi`', N'hjkhkhk', N'hjhjhjh', N'jhjh', N'89080', 1, 1, 1, CAST(89080.00 AS Numeric(10, 2)), CAST(8989.00 AS Numeric(10, 2)), CAST(8989.00 AS Numeric(10, 2)), N'4', N'9', 4, NULL, N'ytuy uyuiyui', N'uiyuiyui', N'203img2.jpg', N'203image2', N'building7_Leased.jpg', N'buld7', N'', N'', CAST(0x00009A1400000000 AS DateTime), CAST(0x00009ACB010F5B94 AS DateTime), CAST(0x00009A1400000000 AS DateTime), CAST(0x00009A1400000000 AS DateTime), N'rakesh', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tbl_Property_Details] ([PropertyId], [PropertyType], [Sale_Rent], [RoomType], [BuildingType], [Bldg_Blk_HseNo], [Street_Name], [Unit_No], [Building_Estate_Name], [Postal_Code], [CountryId], [StateId], [DistrictId], [Price], [Valuation], [Built_In_Area], [Tenure], [Age], [No_Of_BedRooms], [PaymentPerAd], [Summary], [Description], [Image1], [Image1_Description], [Image2], [Image2_Description], [Image3], [Image3_Description], [StartDate], [ExpiryDate], [AdPostedOn], [LastEditedOn], [MemberId], [StatusId], [DisplayInAd_BldgHouseNo], [SetAsMainPhoto], [ThumbImage1], [ThumbImage2], [ThumbImage3], [SmallImage1], [SmallImage2], [SmallImage3]) VALUES (9, N'Residential', N'Rent', N'PRIVATE', N'HUDC', N'45/kd/98/7889', N'BK Guda', N'3490', N'My Home', N'500001', 1, 1, 1, CAST(5000.00 AS Numeric(10, 2)), CAST(150000.00 AS Numeric(10, 2)), CAST(1000.00 AS Numeric(10, 2)), N'8', N'28', 3, NULL, N'Good Furniture', N'Satisfied', N'Target_Veronica.jpg', N'Well pasted walls', N'Target_Winsha.jpg', N'Best colors', N'Target_Yumi.jpg', N'Free air passing', CAST(0x00009A4800000000 AS DateTime), CAST(0x00009AFE00BDAEFC AS DateTime), CAST(0x00009A4800000000 AS DateTime), CAST(0x00009A4800000000 AS DateTime), N'murthy', 1, NULL, NULL, N'Target_Veronica.jpg', N'Target_Winsha.jpg', N'Target_Yumi.jpg', N'Target_Veronica.jpg', N'Target_Winsha.jpg', N'Target_Yumi.jpg')
INSERT [dbo].[tbl_Property_Details] ([PropertyId], [PropertyType], [Sale_Rent], [RoomType], [BuildingType], [Bldg_Blk_HseNo], [Street_Name], [Unit_No], [Building_Estate_Name], [Postal_Code], [CountryId], [StateId], [DistrictId], [Price], [Valuation], [Built_In_Area], [Tenure], [Age], [No_Of_BedRooms], [PaymentPerAd], [Summary], [Description], [Image1], [Image1_Description], [Image2], [Image2_Description], [Image3], [Image3_Description], [StartDate], [ExpiryDate], [AdPostedOn], [LastEditedOn], [MemberId], [StatusId], [DisplayInAd_BldgHouseNo], [SetAsMainPhoto], [ThumbImage1], [ThumbImage2], [ThumbImage3], [SmallImage1], [SmallImage2], [SmallImage3]) VALUES (10, N'Commercial', N'Sale', N'Commercial', N'Office Space', N'55/89/JK/104', N'Secunderabad', N'4500', N'Navaketan Complex', N'500045', 1, 1, 1, CAST(1000000.00 AS Numeric(10, 2)), CAST(300000.00 AS Numeric(10, 2)), CAST(1500.00 AS Numeric(10, 2)), N'5', N'30', 6, NULL, N'Good', N'OK', N'Target_Susanne.jpg', N'Yes', N'Target_Yoko.jpg', N'Feel Happy', N'Target_Yumi.jpg', N'Satisfied', CAST(0x00009A4800000000 AS DateTime), CAST(0x00009AFE00BE43D0 AS DateTime), CAST(0x00009A4800000000 AS DateTime), CAST(0x00009A4800000000 AS DateTime), N'murthy', 1, NULL, NULL, N'Target_Susanne.jpg', N'Target_Yoko.jpg', N'Target_Yumi.jpg', N'Target_Susanne.jpg', N'Target_Yoko.jpg', N'Target_Yumi.jpg')
INSERT [dbo].[tbl_Property_Details] ([PropertyId], [PropertyType], [Sale_Rent], [RoomType], [BuildingType], [Bldg_Blk_HseNo], [Street_Name], [Unit_No], [Building_Estate_Name], [Postal_Code], [CountryId], [StateId], [DistrictId], [Price], [Valuation], [Built_In_Area], [Tenure], [Age], [No_Of_BedRooms], [PaymentPerAd], [Summary], [Description], [Image1], [Image1_Description], [Image2], [Image2_Description], [Image3], [Image3_Description], [StartDate], [ExpiryDate], [AdPostedOn], [LastEditedOn], [MemberId], [StatusId], [DisplayInAd_BldgHouseNo], [SetAsMainPhoto], [ThumbImage1], [ThumbImage2], [ThumbImage3], [SmallImage1], [SmallImage2], [SmallImage3]) VALUES (11, N'Commercial', N'Rent', N'Commercial', N'HUDC', N'Hyd95/78/1-56', N'Rani Gunj', N'2209', N'Amurta Estates', N'567890', 1, 1, 2, CAST(56000.00 AS Numeric(10, 2)), CAST(5000000.00 AS Numeric(10, 2)), CAST(5000000.00 AS Numeric(10, 2)), N'3', N'29', 4, NULL, N'Ok', N'No Credit', N'Target_Veronica.jpg', N'Yes', N'Target_Winsha.jpg', N'Yes', N'Target_Wenlan.jpg', N'Yes', CAST(0x00009A4800000000 AS DateTime), CAST(0x00009AFE00BFEC08 AS DateTime), CAST(0x00009A4800000000 AS DateTime), CAST(0x00009A4800000000 AS DateTime), N'anji', 1, NULL, NULL, N'Target_Veronica.jpg', N'Target_Winsha.jpg', N'Target_Wenlan.jpg', N'Target_Veronica.jpg', N'Target_Winsha.jpg', N'Target_Wenlan.jpg')
INSERT [dbo].[tbl_Property_Details] ([PropertyId], [PropertyType], [Sale_Rent], [RoomType], [BuildingType], [Bldg_Blk_HseNo], [Street_Name], [Unit_No], [Building_Estate_Name], [Postal_Code], [CountryId], [StateId], [DistrictId], [Price], [Valuation], [Built_In_Area], [Tenure], [Age], [No_Of_BedRooms], [PaymentPerAd], [Summary], [Description], [Image1], [Image1_Description], [Image2], [Image2_Description], [Image3], [Image3_Description], [StartDate], [ExpiryDate], [AdPostedOn], [LastEditedOn], [MemberId], [StatusId], [DisplayInAd_BldgHouseNo], [SetAsMainPhoto], [ThumbImage1], [ThumbImage2], [ThumbImage3], [SmallImage1], [SmallImage2], [SmallImage3]) VALUES (12, N'Commercial', N'Sale', N'Commercial', N'Office Space', N'Hu/89/1-34/p', N'BK Guda', N'3400', N'Balaji Nivas', N'500567', 1, 1, 2, CAST(500000.00 AS Numeric(10, 2)), CAST(500000.00 AS Numeric(10, 2)), CAST(1200.00 AS Numeric(10, 2)), N'7', N'30', 4, NULL, N'Good Looking', N'Nice Home', N'Target_Wenlan.jpg', N'Yes', N'Target_Winsha.jpg', N'Yes', N'Target_Yoko.jpg', N'Yes', CAST(0x00009A4800000000 AS DateTime), CAST(0x00009AFE00C832C8 AS DateTime), CAST(0x00009A4800000000 AS DateTime), CAST(0x00009A4800000000 AS DateTime), N'kumar', 1, NULL, NULL, N'Target_Wenlan.jpg', N'Target_Winsha.jpg', N'Target_Yoko.jpg', N'Target_Wenlan.jpg', N'Target_Winsha.jpg', N'Target_Yoko.jpg')
INSERT [dbo].[tbl_Property_Details] ([PropertyId], [PropertyType], [Sale_Rent], [RoomType], [BuildingType], [Bldg_Blk_HseNo], [Street_Name], [Unit_No], [Building_Estate_Name], [Postal_Code], [CountryId], [StateId], [DistrictId], [Price], [Valuation], [Built_In_Area], [Tenure], [Age], [No_Of_BedRooms], [PaymentPerAd], [Summary], [Description], [Image1], [Image1_Description], [Image2], [Image2_Description], [Image3], [Image3_Description], [StartDate], [ExpiryDate], [AdPostedOn], [LastEditedOn], [MemberId], [StatusId], [DisplayInAd_BldgHouseNo], [SetAsMainPhoto], [ThumbImage1], [ThumbImage2], [ThumbImage3], [SmallImage1], [SmallImage2], [SmallImage3]) VALUES (13, N'Residential', N'Rent', N'PRIVATE', N'HUDC', N'1234', N'ammerpeat', N'123456', N'xyz', N'534422', 1, 1, 1, CAST(50000.00 AS Numeric(10, 2)), CAST(100000.00 AS Numeric(10, 2)), CAST(35075.00 AS Numeric(10, 2)), N'8', N'26', 5, NULL, N'good', N'ok', N'', N'', N'', N'', N'', N'', CAST(0x0000A48300000000 AS DateTime), CAST(0x0000A53A00BEC134 AS DateTime), CAST(0x0000A48300000000 AS DateTime), CAST(0x0000A48300000000 AS DateTime), N'azeem', 1, NULL, NULL, N'', N'', N'', N'', N'', N'')
INSERT [dbo].[tbl_Property_Details] ([PropertyId], [PropertyType], [Sale_Rent], [RoomType], [BuildingType], [Bldg_Blk_HseNo], [Street_Name], [Unit_No], [Building_Estate_Name], [Postal_Code], [CountryId], [StateId], [DistrictId], [Price], [Valuation], [Built_In_Area], [Tenure], [Age], [No_Of_BedRooms], [PaymentPerAd], [Summary], [Description], [Image1], [Image1_Description], [Image2], [Image2_Description], [Image3], [Image3_Description], [StartDate], [ExpiryDate], [AdPostedOn], [LastEditedOn], [MemberId], [StatusId], [DisplayInAd_BldgHouseNo], [SetAsMainPhoto], [ThumbImage1], [ThumbImage2], [ThumbImage3], [SmallImage1], [SmallImage2], [SmallImage3]) VALUES (1013, N'Residential', N'Rent', N'PRIVATE', N'Office Space', N'1-140', N'ramulvari strret', N'1010', N'sai', N'534422', 1, 1, 1, CAST(50000.00 AS Numeric(10, 2)), CAST(500000.00 AS Numeric(10, 2)), CAST(2500.00 AS Numeric(10, 2)), N'4', N'25', 5, NULL, N'good', N'good', N'', N'', N'', N'', N'', N'', CAST(0x0000A48700000000 AS DateTime), CAST(0x0000A53E01081B54 AS DateTime), CAST(0x0000A48700000000 AS DateTime), CAST(0x0000A48700000000 AS DateTime), N'ganesh', 1, NULL, NULL, N'', N'', N'', N'', N'', N'')
SET IDENTITY_INSERT [dbo].[tbl_Property_Details] OFF
SET IDENTITY_INSERT [dbo].[tbl_RoomType] ON 

INSERT [dbo].[tbl_RoomType] ([Id], [RoomTypeName], [TypeDescription]) VALUES (1, N'PRIVATE', NULL)
INSERT [dbo].[tbl_RoomType] ([Id], [RoomTypeName], [TypeDescription]) VALUES (2, N'HDB', NULL)
INSERT [dbo].[tbl_RoomType] ([Id], [RoomTypeName], [TypeDescription]) VALUES (3, N'Commercial', NULL)
SET IDENTITY_INSERT [dbo].[tbl_RoomType] OFF
SET IDENTITY_INSERT [dbo].[tbl_State] ON 

INSERT [dbo].[tbl_State] ([StateId], [StateName], [StateDescription], [CountryId], [StatusId]) VALUES (1, N'Andhra Pradesh', N'This is Andhra Pradesh', 1, 1)
SET IDENTITY_INSERT [dbo].[tbl_State] OFF
SET IDENTITY_INSERT [dbo].[tbl_Status] ON 

INSERT [dbo].[tbl_Status] ([StatusId], [StatusName], [StatusDescription]) VALUES (1, N'Active', N'Active')
INSERT [dbo].[tbl_Status] ([StatusId], [StatusName], [StatusDescription]) VALUES (2, N'InActive', N'InActive')
INSERT [dbo].[tbl_Status] ([StatusId], [StatusName], [StatusDescription]) VALUES (3, N'Sold', N'Sold')
INSERT [dbo].[tbl_Status] ([StatusId], [StatusName], [StatusDescription]) VALUES (4, N'Leased', N'Leased')
SET IDENTITY_INSERT [dbo].[tbl_Status] OFF
INSERT [dbo].[tbl_Users] ([User_Id], [Password]) VALUES (N'admin', N'admin')
ALTER TABLE [dbo].[tbl_AdvertisementDetails]  WITH CHECK ADD  CONSTRAINT [FK_tbl_AdvertisementDetails_tbl_Advertisement_Type] FOREIGN KEY([Advt_TypeId])
REFERENCES [dbo].[tbl_Advertisement_Type] ([Advt_TypeId])
GO
ALTER TABLE [dbo].[tbl_AdvertisementDetails] CHECK CONSTRAINT [FK_tbl_AdvertisementDetails_tbl_Advertisement_Type]
GO
ALTER TABLE [dbo].[tbl_BuildingType]  WITH CHECK ADD  CONSTRAINT [FK_tbl_BuildingType_tbl_RoomType] FOREIGN KEY([RoomType_Id])
REFERENCES [dbo].[tbl_RoomType] ([Id])
GO
ALTER TABLE [dbo].[tbl_BuildingType] CHECK CONSTRAINT [FK_tbl_BuildingType_tbl_RoomType]
GO
ALTER TABLE [dbo].[tbl_Country]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Country_tbl_Status] FOREIGN KEY([StatusId])
REFERENCES [dbo].[tbl_Status] ([StatusId])
GO
ALTER TABLE [dbo].[tbl_Country] CHECK CONSTRAINT [FK_tbl_Country_tbl_Status]
GO
ALTER TABLE [dbo].[tbl_District]  WITH CHECK ADD  CONSTRAINT [FK_tbl_District_tbl_Country] FOREIGN KEY([CountryId])
REFERENCES [dbo].[tbl_Country] ([CountryId])
GO
ALTER TABLE [dbo].[tbl_District] CHECK CONSTRAINT [FK_tbl_District_tbl_Country]
GO
ALTER TABLE [dbo].[tbl_District]  WITH CHECK ADD  CONSTRAINT [FK_tbl_District_tbl_State] FOREIGN KEY([StateId])
REFERENCES [dbo].[tbl_State] ([StateId])
GO
ALTER TABLE [dbo].[tbl_District] CHECK CONSTRAINT [FK_tbl_District_tbl_State]
GO
ALTER TABLE [dbo].[tbl_District]  WITH CHECK ADD  CONSTRAINT [FK_tbl_District_tbl_Status] FOREIGN KEY([StatusId])
REFERENCES [dbo].[tbl_Status] ([StatusId])
GO
ALTER TABLE [dbo].[tbl_District] CHECK CONSTRAINT [FK_tbl_District_tbl_Status]
GO
ALTER TABLE [dbo].[tbl_Member_Details]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Member_Details_tbl_Country] FOREIGN KEY([CountryId])
REFERENCES [dbo].[tbl_Country] ([CountryId])
GO
ALTER TABLE [dbo].[tbl_Member_Details] CHECK CONSTRAINT [FK_tbl_Member_Details_tbl_Country]
GO
ALTER TABLE [dbo].[tbl_Member_Details]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Member_Details_tbl_District] FOREIGN KEY([DistrictId])
REFERENCES [dbo].[tbl_District] ([DistrictId])
GO
ALTER TABLE [dbo].[tbl_Member_Details] CHECK CONSTRAINT [FK_tbl_Member_Details_tbl_District]
GO
ALTER TABLE [dbo].[tbl_Member_Details]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Member_Details_tbl_State] FOREIGN KEY([StateId])
REFERENCES [dbo].[tbl_State] ([StateId])
GO
ALTER TABLE [dbo].[tbl_Member_Details] CHECK CONSTRAINT [FK_tbl_Member_Details_tbl_State]
GO
ALTER TABLE [dbo].[tbl_Property_Details]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Property_Details_tbl_Country] FOREIGN KEY([CountryId])
REFERENCES [dbo].[tbl_Country] ([CountryId])
GO
ALTER TABLE [dbo].[tbl_Property_Details] CHECK CONSTRAINT [FK_tbl_Property_Details_tbl_Country]
GO
ALTER TABLE [dbo].[tbl_Property_Details]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Property_Details_tbl_District] FOREIGN KEY([DistrictId])
REFERENCES [dbo].[tbl_District] ([DistrictId])
GO
ALTER TABLE [dbo].[tbl_Property_Details] CHECK CONSTRAINT [FK_tbl_Property_Details_tbl_District]
GO
ALTER TABLE [dbo].[tbl_Property_Details]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Property_Details_tbl_Member_Login] FOREIGN KEY([MemberId])
REFERENCES [dbo].[tbl_Member_Login] ([MemberId])
GO
ALTER TABLE [dbo].[tbl_Property_Details] CHECK CONSTRAINT [FK_tbl_Property_Details_tbl_Member_Login]
GO
ALTER TABLE [dbo].[tbl_Property_Details]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Property_Details_tbl_State] FOREIGN KEY([StateId])
REFERENCES [dbo].[tbl_State] ([StateId])
GO
ALTER TABLE [dbo].[tbl_Property_Details] CHECK CONSTRAINT [FK_tbl_Property_Details_tbl_State]
GO
ALTER TABLE [dbo].[tbl_Property_Details]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Property_Details_tbl_Status] FOREIGN KEY([StatusId])
REFERENCES [dbo].[tbl_Status] ([StatusId])
GO
ALTER TABLE [dbo].[tbl_Property_Details] CHECK CONSTRAINT [FK_tbl_Property_Details_tbl_Status]
GO
ALTER TABLE [dbo].[tbl_Renewal]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Renewal_tbl_Member_Login] FOREIGN KEY([MemberId])
REFERENCES [dbo].[tbl_Member_Login] ([MemberId])
GO
ALTER TABLE [dbo].[tbl_Renewal] CHECK CONSTRAINT [FK_tbl_Renewal_tbl_Member_Login]
GO
ALTER TABLE [dbo].[tbl_State]  WITH CHECK ADD  CONSTRAINT [FK_tbl_State_tbl_Country] FOREIGN KEY([CountryId])
REFERENCES [dbo].[tbl_Country] ([CountryId])
GO
ALTER TABLE [dbo].[tbl_State] CHECK CONSTRAINT [FK_tbl_State_tbl_Country]
GO
ALTER TABLE [dbo].[tbl_State]  WITH CHECK ADD  CONSTRAINT [FK_tbl_State_tbl_Status] FOREIGN KEY([StatusId])
REFERENCES [dbo].[tbl_Status] ([StatusId])
GO
ALTER TABLE [dbo].[tbl_State] CHECK CONSTRAINT [FK_tbl_State_tbl_Status]
GO
USE [master]
GO
ALTER DATABASE [Propertydb] SET  READ_WRITE 
GO

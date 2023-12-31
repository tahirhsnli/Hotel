USE [master]
GO
/****** Object:  Database [Hote]    Script Date: 04.07.2023 15:17:16 ******/
CREATE DATABASE [Hote]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Hote', FILENAME = N'D:\Sql\MSSQL16.MSSQLSERVER\MSSQL\DATA\Hote.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Hote_log', FILENAME = N'D:\Sql\MSSQL16.MSSQLSERVER\MSSQL\DATA\Hote_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Hote] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Hote].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Hote] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Hote] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Hote] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Hote] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Hote] SET ARITHABORT OFF 
GO
ALTER DATABASE [Hote] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Hote] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Hote] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Hote] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Hote] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Hote] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Hote] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Hote] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Hote] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Hote] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Hote] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Hote] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Hote] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Hote] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Hote] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Hote] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [Hote] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Hote] SET RECOVERY FULL 
GO
ALTER DATABASE [Hote] SET  MULTI_USER 
GO
ALTER DATABASE [Hote] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Hote] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Hote] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Hote] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Hote] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Hote] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Hote', N'ON'
GO
ALTER DATABASE [Hote] SET QUERY_STORE = ON
GO
ALTER DATABASE [Hote] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Hote]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 04.07.2023 15:17:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Abouts]    Script Date: 04.07.2023 15:17:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Abouts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Key] [nvarchar](max) NOT NULL,
	[Value] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Abouts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 04.07.2023 15:17:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoleClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 04.07.2023 15:17:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](256) NULL,
	[NormalizedName] [nvarchar](256) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 04.07.2023 15:17:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 04.07.2023 15:17:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](450) NOT NULL,
	[ProviderKey] [nvarchar](450) NOT NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 04.07.2023 15:17:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](450) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 04.07.2023 15:17:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Surname] [nvarchar](max) NOT NULL,
	[UserName] [nvarchar](256) NULL,
	[NormalizedUserName] [nvarchar](256) NULL,
	[Email] [nvarchar](256) NULL,
	[NormalizedEmail] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
 CONSTRAINT [PK_AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 04.07.2023 15:17:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserTokens](
	[UserId] [nvarchar](450) NOT NULL,
	[LoginProvider] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](450) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bookings]    Script Date: 04.07.2023 15:17:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bookings](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoomId] [int] NOT NULL,
	[StartDate] [datetime2](7) NOT NULL,
	[EndDate] [datetime2](7) NOT NULL,
	[ChildrenCount] [int] NOT NULL,
	[PeopleCount] [int] NOT NULL,
	[IsPayed] [bit] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[AppUserId] [nvarchar](450) NULL,
	[TotalPrice] [decimal](18, 2) NOT NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Bookings] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 04.07.2023 15:17:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Surname] [nvarchar](max) NULL,
	[Age] [int] NOT NULL,
	[Phone] [int] NOT NULL,
	[Image] [nvarchar](max) NOT NULL,
	[ProfessionId] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Employees] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Facilities]    Script Date: 04.07.2023 15:17:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Facilities](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](max) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[Icon] [nvarchar](max) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Facilities] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Faqs]    Script Date: 04.07.2023 15:17:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Faqs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Question] [nvarchar](max) NOT NULL,
	[Answer] [nvarchar](max) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Faqs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Professions]    Script Date: 04.07.2023 15:17:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Professions](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Professions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Restaurant]    Script Date: 04.07.2023 15:17:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Restaurant](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Key] [nvarchar](max) NOT NULL,
	[Value] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Restaurant] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RestaurantSliders]    Script Date: 04.07.2023 15:17:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RestaurantSliders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Image] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_RestaurantSliders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoomImages]    Script Date: 04.07.2023 15:17:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoomImages](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Image] [nvarchar](max) NULL,
	[IsMain] [bit] NOT NULL,
	[RoomId] [int] NOT NULL,
 CONSTRAINT [PK_RoomImages] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rooms]    Script Date: 04.07.2023 15:17:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rooms](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoomNumber] [int] NOT NULL,
	[RoomPrice] [decimal](18, 2) NOT NULL,
	[ChildrenCapacity] [int] NOT NULL,
	[PeopleCapacity] [int] NOT NULL,
	[Area] [decimal](18, 2) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[IsExist] [bit] NOT NULL,
	[IsBalcony] [bit] NOT NULL,
	[IsAnimal] [bit] NOT NULL,
	[RoomTypeId] [int] NOT NULL,
 CONSTRAINT [PK_Rooms] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoomTypes]    Script Date: 04.07.2023 15:17:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoomTypes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[Image] [nvarchar](max) NULL,
 CONSTRAINT [PK_RoomTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Services]    Script Date: 04.07.2023 15:17:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Services](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Key] [nvarchar](max) NOT NULL,
	[Value] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Services] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Settings]    Script Date: 04.07.2023 15:17:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Settings](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Key] [nvarchar](max) NOT NULL,
	[Value] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Settings] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sliders]    Script Date: 04.07.2023 15:17:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sliders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](max) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[Image] [nvarchar](max) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Sliders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Spa]    Script Date: 04.07.2023 15:17:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Spa](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Key] [nvarchar](max) NOT NULL,
	[Value] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Spa] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SpaSliders]    Script Date: 04.07.2023 15:17:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SpaSliders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Image] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_SpaSliders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230616102142_Initial', N'6.0.16')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230620160523_Addsettings', N'6.0.16')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230623200148_AddProfessionAndEmployeeTable', N'6.0.16')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230623201531_AddIsDeletedColumnEmployeeAndProfessionTable', N'6.0.16')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230624210615_hshs', N'6.0.16')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230626105440_AddSliderTable', N'6.0.16')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230626110614_AddIsDeletedColumnSliderTable', N'6.0.16')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230626134819_AddFacilityTable', N'6.0.16')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230626162603_AddAboutTable', N'6.0.16')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230626211449_AddRoomImageTable', N'6.0.16')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230627230655_AddImageColumnForRoomTypeTable', N'6.0.16')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230701114526_AddTotalPriceAndAppUserForBookingTable', N'6.0.16')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230701180402_AddStatusColumnForBookingTable', N'6.0.16')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230701182741_AddColumn', N'6.0.16')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230701183703_AddTables', N'6.0.16')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230703133925_AddRestaurantSlider', N'6.0.16')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230703144446_AddSpaSpaSliderRestaurantTables', N'6.0.16')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230703194638_AddServicesTable', N'6.0.16')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230704014550_AddFaqTable', N'6.0.16')
GO
SET IDENTITY_INSERT [dbo].[Abouts] ON 

INSERT [dbo].[Abouts] ([Id], [Key], [Value]) VALUES (1, N'Name', N'THE CAPPA LUXURY HOTEL')
INSERT [dbo].[Abouts] ([Id], [Key], [Value]) VALUES (2, N'Title', N'Enjoy a Luxury Experience')
INSERT [dbo].[Abouts] ([Id], [Key], [Value]) VALUES (3, N'Description1', N'Welcome to the best five-star deluxe hotel in New York. Hotel elementum sesue the aucan vestibulum aliquam justo in sapien rutrum volutpat. Donec in quis the pellentesque velit. Donec id velit ac arcu posuere blane.')
INSERT [dbo].[Abouts] ([Id], [Key], [Value]) VALUES (4, N'FirstImage', N'rooms/5.jpg')
INSERT [dbo].[Abouts] ([Id], [Key], [Value]) VALUES (5, N'SecondImage', N'rooms/2.jpg')
INSERT [dbo].[Abouts] ([Id], [Key], [Value]) VALUES (6, N'Description2', N'Hotel ut nisl quam nestibulum ac quam nec odio elementum sceisue the aucan ligula. Orci varius natoque penatibus et magnis dis parturient monte nascete ridiculus mus nellentesque habitant morbine.')
INSERT [dbo].[Abouts] ([Id], [Key], [Value]) VALUES (7, N'Phone', N'<span class="flaticon-call"></span>')
INSERT [dbo].[Abouts] ([Id], [Key], [Value]) VALUES (8, N'AboutUsImage', N'../../assets/img/slider/4.jpg')
SET IDENTITY_INSERT [dbo].[Abouts] OFF
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'821fdf1a-5412-4ab1-827c-2bbe6391a45e', N'admin', N'ADMIN', N'4d57785e-8760-41fc-853d-017700157f70')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'1e0d78fd-6d00-4074-822a-6fd8e59adcdc', N'821fdf1a-5412-4ab1-827c-2bbe6391a45e')
GO
INSERT [dbo].[AspNetUsers] ([Id], [Name], [Surname], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'1e0d78fd-6d00-4074-822a-6fd8e59adcdc', N'Tahir ', N'Hasanli', N'tahirhsnli246', N'TAHIRHSNLI246', N'tahirhsnli246@gmail.com', N'TAHIRHSNLI246@GMAIL.COM', 1, N'AQAAAAEAACcQAAAAEOr3uxVVSAxrLVLsJo4v1GEIJ99CB78zw5MrFZLky3cdS/i722UJIP9v/cuXLGLMlw==', N'DLAMQ5AUO7FQ7X5IHO6WLAVXPRSEVLYY', N'94e4efe2-5a35-40d6-a65e-1245373b2b96', NULL, 0, 0, NULL, 1, 0)
GO
SET IDENTITY_INSERT [dbo].[Bookings] ON 

INSERT [dbo].[Bookings] ([Id], [RoomId], [StartDate], [EndDate], [ChildrenCount], [PeopleCount], [IsPayed], [IsActive], [AppUserId], [TotalPrice], [Status]) VALUES (6, 1, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0, 0, 0, 0, N'1e0d78fd-6d00-4074-822a-6fd8e59adcdc', CAST(0.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[Bookings] ([Id], [RoomId], [StartDate], [EndDate], [ChildrenCount], [PeopleCount], [IsPayed], [IsActive], [AppUserId], [TotalPrice], [Status]) VALUES (7, 1, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0, 0, 0, 0, N'1e0d78fd-6d00-4074-822a-6fd8e59adcdc', CAST(0.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Bookings] ([Id], [RoomId], [StartDate], [EndDate], [ChildrenCount], [PeopleCount], [IsPayed], [IsActive], [AppUserId], [TotalPrice], [Status]) VALUES (8, 1, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0, 0, 0, 0, N'1e0d78fd-6d00-4074-822a-6fd8e59adcdc', CAST(0.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Bookings] ([Id], [RoomId], [StartDate], [EndDate], [ChildrenCount], [PeopleCount], [IsPayed], [IsActive], [AppUserId], [TotalPrice], [Status]) VALUES (17, 2, CAST(N'2023-11-12T00:00:00.0000000' AS DateTime2), CAST(N'2023-11-14T00:00:00.0000000' AS DateTime2), 0, 0, 0, 0, N'1e0d78fd-6d00-4074-822a-6fd8e59adcdc', CAST(0.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[Bookings] ([Id], [RoomId], [StartDate], [EndDate], [ChildrenCount], [PeopleCount], [IsPayed], [IsActive], [AppUserId], [TotalPrice], [Status]) VALUES (19, 3, CAST(N'2023-08-14T00:00:00.0000000' AS DateTime2), CAST(N'2023-08-17T00:00:00.0000000' AS DateTime2), 0, 0, 0, 0, N'1e0d78fd-6d00-4074-822a-6fd8e59adcdc', CAST(0.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[Bookings] ([Id], [RoomId], [StartDate], [EndDate], [ChildrenCount], [PeopleCount], [IsPayed], [IsActive], [AppUserId], [TotalPrice], [Status]) VALUES (20, 2, CAST(N'2023-07-18T00:00:00.0000000' AS DateTime2), CAST(N'2023-07-25T00:00:00.0000000' AS DateTime2), 0, 0, 0, 0, N'1e0d78fd-6d00-4074-822a-6fd8e59adcdc', CAST(0.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[Bookings] ([Id], [RoomId], [StartDate], [EndDate], [ChildrenCount], [PeopleCount], [IsPayed], [IsActive], [AppUserId], [TotalPrice], [Status]) VALUES (30, 5, CAST(N'2023-10-17T00:00:00.0000000' AS DateTime2), CAST(N'2023-10-24T00:00:00.0000000' AS DateTime2), 0, 0, 0, 0, N'1e0d78fd-6d00-4074-822a-6fd8e59adcdc', CAST(0.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[Bookings] ([Id], [RoomId], [StartDate], [EndDate], [ChildrenCount], [PeopleCount], [IsPayed], [IsActive], [AppUserId], [TotalPrice], [Status]) VALUES (31, 1, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0, 0, 0, 0, N'1e0d78fd-6d00-4074-822a-6fd8e59adcdc', CAST(0.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[Bookings] ([Id], [RoomId], [StartDate], [EndDate], [ChildrenCount], [PeopleCount], [IsPayed], [IsActive], [AppUserId], [TotalPrice], [Status]) VALUES (32, 2, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0, 0, 0, 0, N'1e0d78fd-6d00-4074-822a-6fd8e59adcdc', CAST(0.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[Bookings] ([Id], [RoomId], [StartDate], [EndDate], [ChildrenCount], [PeopleCount], [IsPayed], [IsActive], [AppUserId], [TotalPrice], [Status]) VALUES (33, 3, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0, 0, 0, 0, N'1e0d78fd-6d00-4074-822a-6fd8e59adcdc', CAST(0.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Bookings] ([Id], [RoomId], [StartDate], [EndDate], [ChildrenCount], [PeopleCount], [IsPayed], [IsActive], [AppUserId], [TotalPrice], [Status]) VALUES (34, 6, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0, 0, 0, 0, N'1e0d78fd-6d00-4074-822a-6fd8e59adcdc', CAST(0.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Bookings] ([Id], [RoomId], [StartDate], [EndDate], [ChildrenCount], [PeopleCount], [IsPayed], [IsActive], [AppUserId], [TotalPrice], [Status]) VALUES (35, 6, CAST(N'2024-07-04T00:00:00.0000000' AS DateTime2), CAST(N'2024-07-05T00:00:00.0000000' AS DateTime2), 0, 0, 0, 0, N'1e0d78fd-6d00-4074-822a-6fd8e59adcdc', CAST(0.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Bookings] ([Id], [RoomId], [StartDate], [EndDate], [ChildrenCount], [PeopleCount], [IsPayed], [IsActive], [AppUserId], [TotalPrice], [Status]) VALUES (36, 2, CAST(N'2024-07-04T00:00:00.0000000' AS DateTime2), CAST(N'2024-07-07T00:00:00.0000000' AS DateTime2), 0, 0, 0, 0, N'1e0d78fd-6d00-4074-822a-6fd8e59adcdc', CAST(0.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[Bookings] ([Id], [RoomId], [StartDate], [EndDate], [ChildrenCount], [PeopleCount], [IsPayed], [IsActive], [AppUserId], [TotalPrice], [Status]) VALUES (37, 3, CAST(N'2024-07-04T00:00:00.0000000' AS DateTime2), CAST(N'2024-07-07T00:00:00.0000000' AS DateTime2), 0, 0, 0, 0, N'1e0d78fd-6d00-4074-822a-6fd8e59adcdc', CAST(0.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Bookings] ([Id], [RoomId], [StartDate], [EndDate], [ChildrenCount], [PeopleCount], [IsPayed], [IsActive], [AppUserId], [TotalPrice], [Status]) VALUES (38, 2, CAST(N'2025-07-04T00:00:00.0000000' AS DateTime2), CAST(N'2025-07-05T00:00:00.0000000' AS DateTime2), 0, 0, 0, 0, N'1e0d78fd-6d00-4074-822a-6fd8e59adcdc', CAST(0.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[Bookings] ([Id], [RoomId], [StartDate], [EndDate], [ChildrenCount], [PeopleCount], [IsPayed], [IsActive], [AppUserId], [TotalPrice], [Status]) VALUES (39, 1, CAST(N'2024-06-04T00:00:00.0000000' AS DateTime2), CAST(N'2024-06-05T00:00:00.0000000' AS DateTime2), 18, 22, 0, 0, N'1e0d78fd-6d00-4074-822a-6fd8e59adcdc', CAST(0.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Bookings] ([Id], [RoomId], [StartDate], [EndDate], [ChildrenCount], [PeopleCount], [IsPayed], [IsActive], [AppUserId], [TotalPrice], [Status]) VALUES (40, 2, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 2, 2, 0, 0, N'1e0d78fd-6d00-4074-822a-6fd8e59adcdc', CAST(0.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[Bookings] ([Id], [RoomId], [StartDate], [EndDate], [ChildrenCount], [PeopleCount], [IsPayed], [IsActive], [AppUserId], [TotalPrice], [Status]) VALUES (41, 2, CAST(N'2026-07-04T00:00:00.0000000' AS DateTime2), CAST(N'2026-07-05T00:00:00.0000000' AS DateTime2), 1, 1, 0, 0, N'1e0d78fd-6d00-4074-822a-6fd8e59adcdc', CAST(0.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Bookings] ([Id], [RoomId], [StartDate], [EndDate], [ChildrenCount], [PeopleCount], [IsPayed], [IsActive], [AppUserId], [TotalPrice], [Status]) VALUES (42, 3, CAST(N'2028-07-04T00:00:00.0000000' AS DateTime2), CAST(N'2028-07-05T00:00:00.0000000' AS DateTime2), 3, 3, 0, 0, N'1e0d78fd-6d00-4074-822a-6fd8e59adcdc', CAST(0.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Bookings] ([Id], [RoomId], [StartDate], [EndDate], [ChildrenCount], [PeopleCount], [IsPayed], [IsActive], [AppUserId], [TotalPrice], [Status]) VALUES (43, 5, CAST(N'2025-07-04T00:00:00.0000000' AS DateTime2), CAST(N'2025-07-05T00:00:00.0000000' AS DateTime2), 2, 1, 0, 0, N'1e0d78fd-6d00-4074-822a-6fd8e59adcdc', CAST(0.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[Bookings] ([Id], [RoomId], [StartDate], [EndDate], [ChildrenCount], [PeopleCount], [IsPayed], [IsActive], [AppUserId], [TotalPrice], [Status]) VALUES (44, 5, CAST(N'2025-07-04T00:00:00.0000000' AS DateTime2), CAST(N'2025-07-05T00:00:00.0000000' AS DateTime2), 2, 1, 0, 0, N'1e0d78fd-6d00-4074-822a-6fd8e59adcdc', CAST(0.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[Bookings] ([Id], [RoomId], [StartDate], [EndDate], [ChildrenCount], [PeopleCount], [IsPayed], [IsActive], [AppUserId], [TotalPrice], [Status]) VALUES (45, 2, CAST(N'2024-07-04T00:00:00.0000000' AS DateTime2), CAST(N'2024-07-05T00:00:00.0000000' AS DateTime2), 1, 1, 0, 0, N'1e0d78fd-6d00-4074-822a-6fd8e59adcdc', CAST(0.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[Bookings] ([Id], [RoomId], [StartDate], [EndDate], [ChildrenCount], [PeopleCount], [IsPayed], [IsActive], [AppUserId], [TotalPrice], [Status]) VALUES (46, 5, CAST(N'2025-07-04T00:00:00.0000000' AS DateTime2), CAST(N'2026-07-05T00:00:00.0000000' AS DateTime2), 3, 1, 0, 0, N'1e0d78fd-6d00-4074-822a-6fd8e59adcdc', CAST(0.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[Bookings] ([Id], [RoomId], [StartDate], [EndDate], [ChildrenCount], [PeopleCount], [IsPayed], [IsActive], [AppUserId], [TotalPrice], [Status]) VALUES (47, 5, CAST(N'2025-07-04T00:00:00.0000000' AS DateTime2), CAST(N'2026-07-05T00:00:00.0000000' AS DateTime2), 3, 1, 0, 0, N'1e0d78fd-6d00-4074-822a-6fd8e59adcdc', CAST(0.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[Bookings] ([Id], [RoomId], [StartDate], [EndDate], [ChildrenCount], [PeopleCount], [IsPayed], [IsActive], [AppUserId], [TotalPrice], [Status]) VALUES (48, 5, CAST(N'2028-07-04T00:00:00.0000000' AS DateTime2), CAST(N'2028-07-05T00:00:00.0000000' AS DateTime2), 2, 1, 0, 0, N'1e0d78fd-6d00-4074-822a-6fd8e59adcdc', CAST(600.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[Bookings] ([Id], [RoomId], [StartDate], [EndDate], [ChildrenCount], [PeopleCount], [IsPayed], [IsActive], [AppUserId], [TotalPrice], [Status]) VALUES (49, 6, CAST(N'2026-07-04T00:00:00.0000000' AS DateTime2), CAST(N'2027-07-05T00:00:00.0000000' AS DateTime2), 2, 2, 0, 0, N'1e0d78fd-6d00-4074-822a-6fd8e59adcdc', CAST(600.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[Bookings] ([Id], [RoomId], [StartDate], [EndDate], [ChildrenCount], [PeopleCount], [IsPayed], [IsActive], [AppUserId], [TotalPrice], [Status]) VALUES (50, 6, CAST(N'2025-07-04T00:00:00.0000000' AS DateTime2), CAST(N'2025-07-05T00:00:00.0000000' AS DateTime2), 2, 2, 0, 0, N'1e0d78fd-6d00-4074-822a-6fd8e59adcdc', CAST(600.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[Bookings] ([Id], [RoomId], [StartDate], [EndDate], [ChildrenCount], [PeopleCount], [IsPayed], [IsActive], [AppUserId], [TotalPrice], [Status]) VALUES (51, 5, CAST(N'2024-07-04T00:00:00.0000000' AS DateTime2), CAST(N'2024-07-05T00:00:00.0000000' AS DateTime2), 2, 2, 0, 0, N'1e0d78fd-6d00-4074-822a-6fd8e59adcdc', CAST(600.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[Bookings] ([Id], [RoomId], [StartDate], [EndDate], [ChildrenCount], [PeopleCount], [IsPayed], [IsActive], [AppUserId], [TotalPrice], [Status]) VALUES (52, 20, CAST(N'2024-07-04T00:00:00.0000000' AS DateTime2), CAST(N'2024-07-05T00:00:00.0000000' AS DateTime2), 2, 3, 0, 0, N'1e0d78fd-6d00-4074-822a-6fd8e59adcdc', CAST(500.00 AS Decimal(18, 2)), NULL)
SET IDENTITY_INSERT [dbo].[Bookings] OFF
GO
SET IDENTITY_INSERT [dbo].[Employees] ON 

INSERT [dbo].[Employees] ([Id], [Name], [Surname], [Age], [Phone], [Image], [ProfessionId], [IsDeleted]) VALUES (1, N'George ', N'Smith', 20, 99405563, N'27194479-8a44-412e-b4ff-c46f0d6769ee_3.jpg', 2, 0)
INSERT [dbo].[Employees] ([Id], [Name], [Surname], [Age], [Phone], [Image], [ProfessionId], [IsDeleted]) VALUES (2, N'Carlo', N'jackson', 23, 99655563, N'4d37aafc-d810-46a2-8df6-c26159a91fd1_5.jpg', 4, 0)
INSERT [dbo].[Employees] ([Id], [Name], [Surname], [Age], [Phone], [Image], [ProfessionId], [IsDeleted]) VALUES (3, N'Jane', N'Evans', 22, 23123123, N'52b9d41d-7630-4636-855c-853291fa06f4_2.jpg', 2, 0)
INSERT [dbo].[Employees] ([Id], [Name], [Surname], [Age], [Phone], [Image], [ProfessionId], [IsDeleted]) VALUES (4, N'Scoot', N'brown', 23, 731231123, N'92ebe69d-1006-4388-b283-38ed77ba20db_1.jpg', 3, 0)
SET IDENTITY_INSERT [dbo].[Employees] OFF
GO
SET IDENTITY_INSERT [dbo].[Facilities] ON 

INSERT [dbo].[Facilities] ([Id], [Title], [Description], [Icon], [IsDeleted]) VALUES (1, N'Pick Up & Drop', N'We’ll pick up from airport while you comfy on your ride, mus nellentesque habitant.', N'<span class="flaticon-world"></span>', 0)
INSERT [dbo].[Facilities] ([Id], [Title], [Description], [Icon], [IsDeleted]) VALUES (2, N'Parking Space', N'Fusce tincidunt nis ace park norttito sit amet space, mus nellentesque habitant.', N'<span class="flaticon-car"></span>', 0)
INSERT [dbo].[Facilities] ([Id], [Title], [Description], [Icon], [IsDeleted]) VALUES (3, N'Room Service', N'Room tincidunt nis ace park norttito sit amet space, mus nellentesque habitant.', N'<span class="flaticon-bed"></span>', 0)
SET IDENTITY_INSERT [dbo].[Facilities] OFF
GO
SET IDENTITY_INSERT [dbo].[Professions] ON 

INSERT [dbo].[Professions] ([Id], [Name], [IsDeleted]) VALUES (1, N'Executive Chef', 0)
INSERT [dbo].[Professions] ([Id], [Name], [IsDeleted]) VALUES (2, N'Event planner', 0)
INSERT [dbo].[Professions] ([Id], [Name], [IsDeleted]) VALUES (3, N'Hotel General Manager', 0)
INSERT [dbo].[Professions] ([Id], [Name], [IsDeleted]) VALUES (4, N'FRONT OFFICE MANAGER', 0)
INSERT [dbo].[Professions] ([Id], [Name], [IsDeleted]) VALUES (5, N'Hotel receptionist', 0)
SET IDENTITY_INSERT [dbo].[Professions] OFF
GO
SET IDENTITY_INSERT [dbo].[Restaurant] ON 

INSERT [dbo].[Restaurant] ([Id], [Key], [Value]) VALUES (2, N'Title', N'AN EXPERIENCE FOR THE SENSES')
INSERT [dbo].[Restaurant] ([Id], [Key], [Value]) VALUES (3, N'Description', N'Led by Chef de Micheal Martin, The Restaurant is celebrated for its excellent cuisine and unique ambience. The gorgeous dining room features three open studio kitchens, allowing you to enjoy the sights and sounds of the culinary artistry on display. The menu showcases both Asian and European influences, with a tempting selection of classic favorites and creative dishes for you to sample. Cheese connoisseurs will be drawn to the The Wine and Cheese Cellar, housed in five-meter-high glass walls, where our knowledgeable staff can introduce you to some of New York''s greatest culinary treasures.')
INSERT [dbo].[Restaurant] ([Id], [Key], [Value]) VALUES (4, N'Breakfast', N' 7.00 am – 11.00 am (daily)')
INSERT [dbo].[Restaurant] ([Id], [Key], [Value]) VALUES (5, N'Lunch', N'12.00 noon – 2.00 pm (daily)')
INSERT [dbo].[Restaurant] ([Id], [Key], [Value]) VALUES (6, N'Dinner', N' open from 6.30 pm, last order at 10.00 pm (daily)')
INSERT [dbo].[Restaurant] ([Id], [Key], [Value]) VALUES (7, N'Title2', N'Hours')
INSERT [dbo].[Restaurant] ([Id], [Key], [Value]) VALUES (8, N'Title3', N'Dress Code')
INSERT [dbo].[Restaurant] ([Id], [Key], [Value]) VALUES (9, N'DressDescription', N'Smart casual (no shorts, hats, or sandals permitted)')
INSERT [dbo].[Restaurant] ([Id], [Key], [Value]) VALUES (10, N'Title4', N'Terrace')
INSERT [dbo].[Restaurant] ([Id], [Key], [Value]) VALUES (11, N'TerraceDescription', N'Open for drinks only')
SET IDENTITY_INSERT [dbo].[Restaurant] OFF
GO
SET IDENTITY_INSERT [dbo].[RestaurantSliders] ON 

INSERT [dbo].[RestaurantSliders] ([Id], [Image]) VALUES (1, N'247815fd-2576-44a5-9ce8-d7ce6c0460f4_3.jpg')
INSERT [dbo].[RestaurantSliders] ([Id], [Image]) VALUES (3, N'b847ce6e-e4d2-4055-9e99-575faec9eb32_1.jpg')
INSERT [dbo].[RestaurantSliders] ([Id], [Image]) VALUES (4, N'04fa344a-126a-41ce-8d15-4667e824fbe6_2.jpg')
SET IDENTITY_INSERT [dbo].[RestaurantSliders] OFF
GO
SET IDENTITY_INSERT [dbo].[RoomImages] ON 

INSERT [dbo].[RoomImages] ([Id], [Image], [IsMain], [RoomId]) VALUES (1, N'c0a8f7a9-9c20-47fc-a4fd-186ca822ed6d_8.jpg', 1, 1)
INSERT [dbo].[RoomImages] ([Id], [Image], [IsMain], [RoomId]) VALUES (2, N'f6caf166-3eb3-4525-8815-cc5686006239_1.jpg', 0, 1)
INSERT [dbo].[RoomImages] ([Id], [Image], [IsMain], [RoomId]) VALUES (3, N'725da30e-dd0e-4893-9993-5571f6e7a7ab_7.jpg', 0, 1)
INSERT [dbo].[RoomImages] ([Id], [Image], [IsMain], [RoomId]) VALUES (4, N'959ba576-de4d-4860-a730-4d514ab32266_2.jpg', 1, 2)
INSERT [dbo].[RoomImages] ([Id], [Image], [IsMain], [RoomId]) VALUES (5, N'2a03980f-7961-487d-a605-65bab6c4b08c_2.jpg', 0, 2)
INSERT [dbo].[RoomImages] ([Id], [Image], [IsMain], [RoomId]) VALUES (6, N'3b1e3d34-9415-40a0-b45d-c512d84c72ac_8.jpg', 0, 2)
INSERT [dbo].[RoomImages] ([Id], [Image], [IsMain], [RoomId]) VALUES (7, N'595e870f-e1d3-4c58-bb34-ed208147b668_8.jpg', 1, 3)
INSERT [dbo].[RoomImages] ([Id], [Image], [IsMain], [RoomId]) VALUES (8, N'2fadc019-0ebb-4206-b89b-863fd6bb0afb_4.jpg', 0, 3)
INSERT [dbo].[RoomImages] ([Id], [Image], [IsMain], [RoomId]) VALUES (9, N'cec9c8c9-947f-47f1-90d6-833d978e4fad_10.jpg', 0, 3)
INSERT [dbo].[RoomImages] ([Id], [Image], [IsMain], [RoomId]) VALUES (10, N'ae42556a-5a3a-4dda-9638-c284054043e3_9.jpg', 1, 5)
INSERT [dbo].[RoomImages] ([Id], [Image], [IsMain], [RoomId]) VALUES (11, N'f8648138-49d7-4cb1-9582-7a837017c624_6.jpg', 0, 5)
INSERT [dbo].[RoomImages] ([Id], [Image], [IsMain], [RoomId]) VALUES (12, N'759de090-a70b-4480-b210-5496c8a89d04_12.jpg', 0, 5)
INSERT [dbo].[RoomImages] ([Id], [Image], [IsMain], [RoomId]) VALUES (13, N'18764fb7-1b59-4065-b6c6-584c9d182892_5.jpg', 1, 6)
INSERT [dbo].[RoomImages] ([Id], [Image], [IsMain], [RoomId]) VALUES (14, N'7c607446-6f77-43e7-a9af-4702709c8702_1.jpg', 0, 6)
INSERT [dbo].[RoomImages] ([Id], [Image], [IsMain], [RoomId]) VALUES (15, N'ac3bacfb-51bc-4e7f-95ef-c5bdb5512c05_7.jpg', 0, 6)
INSERT [dbo].[RoomImages] ([Id], [Image], [IsMain], [RoomId]) VALUES (16, N'e1605131-0974-4371-8bf2-fb94d08de86c_3.jpg', 1, 7)
INSERT [dbo].[RoomImages] ([Id], [Image], [IsMain], [RoomId]) VALUES (17, N'6c68213d-31bd-4013-9331-88789026cfde_9.jpg', 0, 7)
INSERT [dbo].[RoomImages] ([Id], [Image], [IsMain], [RoomId]) VALUES (18, N'c4975a96-0bfe-4e12-b270-7df0c028af43_10.jpg', 0, 7)
INSERT [dbo].[RoomImages] ([Id], [Image], [IsMain], [RoomId]) VALUES (19, N'285fc540-a186-42d5-aead-882c28600d9d_11.jpg', 0, 7)
INSERT [dbo].[RoomImages] ([Id], [Image], [IsMain], [RoomId]) VALUES (20, N'e3beb7d3-588f-4882-abd3-788475961fba_photo-1615874959474-d609969a20ed.jfif', 1, 8)
INSERT [dbo].[RoomImages] ([Id], [Image], [IsMain], [RoomId]) VALUES (21, N'cb68a2f5-c625-4006-ad19-b5f930daa74f_6c68213d-31bd-4013-9331-88789026cfde_9.jpg', 0, 8)
INSERT [dbo].[RoomImages] ([Id], [Image], [IsMain], [RoomId]) VALUES (22, N'a519408e-0eae-4180-852f-35b59eb3f20e_7c607446-6f77-43e7-a9af-4702709c8702_1.jpg', 0, 8)
INSERT [dbo].[RoomImages] ([Id], [Image], [IsMain], [RoomId]) VALUES (23, N'00e73b97-7497-4ec0-adea-687cfbc8b401_7dea62ea-abe3-4713-bf5f-d38bd9cc0723_photo-1615874959474-d609969a20ed.jfif', 0, 8)
INSERT [dbo].[RoomImages] ([Id], [Image], [IsMain], [RoomId]) VALUES (24, N'dd9cf12a-ec06-4ed2-9757-5f85e6f95e91_2.jpg', 1, 9)
INSERT [dbo].[RoomImages] ([Id], [Image], [IsMain], [RoomId]) VALUES (25, N'cc689a15-007d-4c84-9386-8924169960a1_4.jpg', 0, 9)
INSERT [dbo].[RoomImages] ([Id], [Image], [IsMain], [RoomId]) VALUES (26, N'06fe61ae-ccbb-49fc-9567-8c655e84893d_5.jpg', 0, 9)
INSERT [dbo].[RoomImages] ([Id], [Image], [IsMain], [RoomId]) VALUES (27, N'9bf434a1-23d3-4ce9-90fb-c7a4d068294e_10.jpg', 0, 9)
INSERT [dbo].[RoomImages] ([Id], [Image], [IsMain], [RoomId]) VALUES (28, N'e6f794d3-d44f-48ea-8849-8abf66542296_11.jpg', 0, 9)
INSERT [dbo].[RoomImages] ([Id], [Image], [IsMain], [RoomId]) VALUES (29, N'6b5b0cc9-4d0f-4e16-aa64-49b4ba5c896d_9.jpg', 1, 10)
INSERT [dbo].[RoomImages] ([Id], [Image], [IsMain], [RoomId]) VALUES (30, N'3c66ae7e-6be0-43d8-8647-cc91b4150f0a_10.jpg', 0, 10)
INSERT [dbo].[RoomImages] ([Id], [Image], [IsMain], [RoomId]) VALUES (31, N'2cb4af95-c293-4475-bea3-579fa230b86c_11.jpg', 0, 10)
INSERT [dbo].[RoomImages] ([Id], [Image], [IsMain], [RoomId]) VALUES (32, N'436abcb7-49d2-4521-a5b3-428d0fbc8101_12.jpg', 0, 10)
INSERT [dbo].[RoomImages] ([Id], [Image], [IsMain], [RoomId]) VALUES (33, N'fd0ff97b-6f29-41f2-8b19-6a3b52128626_9.jpg', 1, 11)
INSERT [dbo].[RoomImages] ([Id], [Image], [IsMain], [RoomId]) VALUES (34, N'71495b85-15c3-45d3-bd3d-819d3381f80f_9.jpg', 0, 11)
INSERT [dbo].[RoomImages] ([Id], [Image], [IsMain], [RoomId]) VALUES (35, N'db0d50ea-d699-4c3d-a72b-9b85cbca9535_10.jpg', 0, 11)
INSERT [dbo].[RoomImages] ([Id], [Image], [IsMain], [RoomId]) VALUES (36, N'423037ea-cb19-49a2-941b-445b36d86d3d_Standard.jpg', 0, 11)
INSERT [dbo].[RoomImages] ([Id], [Image], [IsMain], [RoomId]) VALUES (37, N'03567711-502e-4ec3-bf71-d6ff13fd750a_2.jpg', 1, 12)
INSERT [dbo].[RoomImages] ([Id], [Image], [IsMain], [RoomId]) VALUES (38, N'1cdf3328-efd8-4590-9a54-361e8694a4d3_1.jpg', 0, 12)
INSERT [dbo].[RoomImages] ([Id], [Image], [IsMain], [RoomId]) VALUES (39, N'baf43f8a-fbb0-4f35-8c35-6770ebd6dca3_2.jpg', 0, 12)
INSERT [dbo].[RoomImages] ([Id], [Image], [IsMain], [RoomId]) VALUES (40, N'721b2aff-5c31-4ab7-90ed-b373b46f0e8f_3.jpg', 0, 12)
INSERT [dbo].[RoomImages] ([Id], [Image], [IsMain], [RoomId]) VALUES (41, N'444e0015-bfc1-4f9d-9cc6-cf4277be5b87_2.jpg', 1, 13)
INSERT [dbo].[RoomImages] ([Id], [Image], [IsMain], [RoomId]) VALUES (42, N'02556dfd-3496-4641-8581-5047c9a6fdd2_3.jpg', 0, 13)
INSERT [dbo].[RoomImages] ([Id], [Image], [IsMain], [RoomId]) VALUES (43, N'cd330fe7-368a-4ca6-a6d0-dbc076225a7d_4.jpg', 0, 13)
INSERT [dbo].[RoomImages] ([Id], [Image], [IsMain], [RoomId]) VALUES (44, N'49f6b734-fe99-4cdb-b948-2c893cca1cc8_5.jpg', 0, 13)
INSERT [dbo].[RoomImages] ([Id], [Image], [IsMain], [RoomId]) VALUES (45, N'e15cf674-f750-48f4-9e50-1e96dfb91034_bed-room-3d-rendering-260nw-38022538.webp', 1, 14)
INSERT [dbo].[RoomImages] ([Id], [Image], [IsMain], [RoomId]) VALUES (46, N'8243d61b-4b6c-4577-81e0-459f53956ada_9.jpg', 0, 14)
INSERT [dbo].[RoomImages] ([Id], [Image], [IsMain], [RoomId]) VALUES (47, N'c1ef4142-788f-4735-9768-c5dc235a04fa_10.jpg', 0, 14)
INSERT [dbo].[RoomImages] ([Id], [Image], [IsMain], [RoomId]) VALUES (48, N'eff46161-3c9c-4d38-b549-ab80f79b91ed_Standard.jpg', 0, 14)
INSERT [dbo].[RoomImages] ([Id], [Image], [IsMain], [RoomId]) VALUES (49, N'a3d4d25c-6dbe-482c-8daf-059d35e2b80c_4.jpg', 1, 15)
INSERT [dbo].[RoomImages] ([Id], [Image], [IsMain], [RoomId]) VALUES (50, N'5049963f-fabc-4dfe-8f8e-546ee179cb69_1.jpg', 0, 15)
INSERT [dbo].[RoomImages] ([Id], [Image], [IsMain], [RoomId]) VALUES (51, N'8400ff54-b3ce-4baa-a8ab-ef10ef88a4f0_2.jpg', 0, 15)
INSERT [dbo].[RoomImages] ([Id], [Image], [IsMain], [RoomId]) VALUES (53, N'efaff4eb-a92d-44f6-9020-c8033ba63d1c_7.jpg', 0, 15)
INSERT [dbo].[RoomImages] ([Id], [Image], [IsMain], [RoomId]) VALUES (54, N'7039a2b0-5a16-4f68-a33a-8da4e6b3f921_Standard.jpg', 1, 16)
INSERT [dbo].[RoomImages] ([Id], [Image], [IsMain], [RoomId]) VALUES (55, N'7c1f28fc-ad58-48d9-a5f8-4d16683ef4c5_9.jpg', 0, 16)
INSERT [dbo].[RoomImages] ([Id], [Image], [IsMain], [RoomId]) VALUES (56, N'd39758a3-8dc7-4722-829e-a07fdf164e86_10.jpg', 0, 16)
INSERT [dbo].[RoomImages] ([Id], [Image], [IsMain], [RoomId]) VALUES (57, N'593d82ef-9378-4546-bab6-e0f3df87f270_Standard.jpg', 0, 16)
INSERT [dbo].[RoomImages] ([Id], [Image], [IsMain], [RoomId]) VALUES (58, N'67d31136-01e9-46ba-a526-3e7f8271717f_9.jpg', 1, 17)
INSERT [dbo].[RoomImages] ([Id], [Image], [IsMain], [RoomId]) VALUES (59, N'85adf23d-5c27-4f58-b40f-024e1ee318e3_6.jpg', 0, 17)
INSERT [dbo].[RoomImages] ([Id], [Image], [IsMain], [RoomId]) VALUES (60, N'a54029d3-8229-4f36-b0dd-50c617f32d95_7.jpg', 0, 17)
INSERT [dbo].[RoomImages] ([Id], [Image], [IsMain], [RoomId]) VALUES (61, N'a518d6b8-3872-4212-86b9-56dfb37840bc_12.jpg', 0, 17)
INSERT [dbo].[RoomImages] ([Id], [Image], [IsMain], [RoomId]) VALUES (62, N'bcf095a5-b21e-45a0-9fe0-c719dc5a960e_bed-room-3d-rendering-260nw-38022538.webp', 0, 17)
INSERT [dbo].[RoomImages] ([Id], [Image], [IsMain], [RoomId]) VALUES (63, N'308a9d9e-0400-40f5-80c0-f500f8097e6c_2.jpg', 1, 18)
INSERT [dbo].[RoomImages] ([Id], [Image], [IsMain], [RoomId]) VALUES (64, N'4fe6fd33-4954-48da-bd49-a346c539b6ba_4.jpg', 0, 18)
INSERT [dbo].[RoomImages] ([Id], [Image], [IsMain], [RoomId]) VALUES (65, N'69a5419b-7bd5-406b-9738-a0398db94417_5.jpg', 0, 18)
INSERT [dbo].[RoomImages] ([Id], [Image], [IsMain], [RoomId]) VALUES (66, N'fdc22b18-2161-48b8-8f3a-ae6e21327e74_10.jpg', 0, 18)
INSERT [dbo].[RoomImages] ([Id], [Image], [IsMain], [RoomId]) VALUES (67, N'ddf4a5a5-7655-444e-adda-0af0260d2e59_11.jpg', 0, 18)
INSERT [dbo].[RoomImages] ([Id], [Image], [IsMain], [RoomId]) VALUES (68, N'5286cc0c-6309-4e68-bf10-d7ea57fb48bc_9.jpg', 1, 19)
INSERT [dbo].[RoomImages] ([Id], [Image], [IsMain], [RoomId]) VALUES (69, N'523af231-b47e-4b18-bfb4-775df46e0d7f_3 - Copy.jpg', 0, 19)
INSERT [dbo].[RoomImages] ([Id], [Image], [IsMain], [RoomId]) VALUES (70, N'1a49baab-2854-4fe2-bd8b-46ac30f6e724_6.jpg', 0, 19)
INSERT [dbo].[RoomImages] ([Id], [Image], [IsMain], [RoomId]) VALUES (71, N'cb09174d-6843-49bd-9f24-fa0a011a0806_family-room.jpg', 0, 19)
INSERT [dbo].[RoomImages] ([Id], [Image], [IsMain], [RoomId]) VALUES (72, N'8421edd5-5260-405b-97a0-7a32b272894a_bed-room-3d-rendering-260nw-38022538.webp', 1, 20)
INSERT [dbo].[RoomImages] ([Id], [Image], [IsMain], [RoomId]) VALUES (73, N'5cf98c4a-0a32-49b9-a7a4-283fbb001419_4.jpg', 0, 20)
INSERT [dbo].[RoomImages] ([Id], [Image], [IsMain], [RoomId]) VALUES (74, N'81d307b9-1db4-40f4-b649-ea0ac9a2eb13_5.jpg', 0, 20)
INSERT [dbo].[RoomImages] ([Id], [Image], [IsMain], [RoomId]) VALUES (75, N'64510440-289a-4cf4-b595-c59be1a520f3_10.jpg', 0, 20)
INSERT [dbo].[RoomImages] ([Id], [Image], [IsMain], [RoomId]) VALUES (76, N'a6484a4d-e7d1-4b28-bb9b-24658c5ecb96_4.jpg', 1, 21)
INSERT [dbo].[RoomImages] ([Id], [Image], [IsMain], [RoomId]) VALUES (77, N'bb77f60c-639e-43b9-8483-a8984efbe33f_3.jpg', 0, 21)
INSERT [dbo].[RoomImages] ([Id], [Image], [IsMain], [RoomId]) VALUES (78, N'848a3225-523b-4778-8877-1f1e164b0637_4.jpg', 0, 21)
INSERT [dbo].[RoomImages] ([Id], [Image], [IsMain], [RoomId]) VALUES (79, N'd3a8bc5e-da6b-42d7-87c1-1654ba3faab7_9.jpg', 0, 21)
INSERT [dbo].[RoomImages] ([Id], [Image], [IsMain], [RoomId]) VALUES (80, N'350d66f0-f247-4335-9e08-e2b863acbdda_10.jpg', 0, 21)
INSERT [dbo].[RoomImages] ([Id], [Image], [IsMain], [RoomId]) VALUES (81, N'76d76bc2-5b1a-493d-838a-75360eea31b1_Standard.jpg', 0, 21)
SET IDENTITY_INSERT [dbo].[RoomImages] OFF
GO
SET IDENTITY_INSERT [dbo].[Rooms] ON 

INSERT [dbo].[Rooms] ([Id], [RoomNumber], [RoomPrice], [ChildrenCapacity], [PeopleCapacity], [Area], [IsDeleted], [IsExist], [IsBalcony], [IsAnimal], [RoomTypeId]) VALUES (1, 101, CAST(300.00 AS Decimal(18, 2)), 4, 5, CAST(120.00 AS Decimal(18, 2)), 0, 0, 0, 0, 2)
INSERT [dbo].[Rooms] ([Id], [RoomNumber], [RoomPrice], [ChildrenCapacity], [PeopleCapacity], [Area], [IsDeleted], [IsExist], [IsBalcony], [IsAnimal], [RoomTypeId]) VALUES (2, 102, CAST(500.00 AS Decimal(18, 2)), 2, 5, CAST(150.00 AS Decimal(18, 2)), 0, 0, 0, 0, 3)
INSERT [dbo].[Rooms] ([Id], [RoomNumber], [RoomPrice], [ChildrenCapacity], [PeopleCapacity], [Area], [IsDeleted], [IsExist], [IsBalcony], [IsAnimal], [RoomTypeId]) VALUES (3, 103, CAST(400.00 AS Decimal(18, 2)), 5, 4, CAST(180.00 AS Decimal(18, 2)), 0, 0, 0, 0, 2)
INSERT [dbo].[Rooms] ([Id], [RoomNumber], [RoomPrice], [ChildrenCapacity], [PeopleCapacity], [Area], [IsDeleted], [IsExist], [IsBalcony], [IsAnimal], [RoomTypeId]) VALUES (5, 104, CAST(600.00 AS Decimal(18, 2)), 3, 6, CAST(200.00 AS Decimal(18, 2)), 0, 0, 0, 0, 4)
INSERT [dbo].[Rooms] ([Id], [RoomNumber], [RoomPrice], [ChildrenCapacity], [PeopleCapacity], [Area], [IsDeleted], [IsExist], [IsBalcony], [IsAnimal], [RoomTypeId]) VALUES (6, 105, CAST(600.00 AS Decimal(18, 2)), 5, 5, CAST(200.00 AS Decimal(18, 2)), 0, 0, 0, 0, 3)
INSERT [dbo].[Rooms] ([Id], [RoomNumber], [RoomPrice], [ChildrenCapacity], [PeopleCapacity], [Area], [IsDeleted], [IsExist], [IsBalcony], [IsAnimal], [RoomTypeId]) VALUES (7, 106, CAST(800.00 AS Decimal(18, 2)), 6, 4, CAST(200.00 AS Decimal(18, 2)), 0, 0, 0, 0, 3)
INSERT [dbo].[Rooms] ([Id], [RoomNumber], [RoomPrice], [ChildrenCapacity], [PeopleCapacity], [Area], [IsDeleted], [IsExist], [IsBalcony], [IsAnimal], [RoomTypeId]) VALUES (8, 201, CAST(300.00 AS Decimal(18, 2)), 3, 2, CAST(80.00 AS Decimal(18, 2)), 0, 0, 0, 0, 5)
INSERT [dbo].[Rooms] ([Id], [RoomNumber], [RoomPrice], [ChildrenCapacity], [PeopleCapacity], [Area], [IsDeleted], [IsExist], [IsBalcony], [IsAnimal], [RoomTypeId]) VALUES (9, 202, CAST(500.00 AS Decimal(18, 2)), 3, 2, CAST(100.00 AS Decimal(18, 2)), 0, 0, 0, 0, 4)
INSERT [dbo].[Rooms] ([Id], [RoomNumber], [RoomPrice], [ChildrenCapacity], [PeopleCapacity], [Area], [IsDeleted], [IsExist], [IsBalcony], [IsAnimal], [RoomTypeId]) VALUES (10, 203, CAST(750.00 AS Decimal(18, 2)), 4, 2, CAST(120.00 AS Decimal(18, 2)), 0, 0, 0, 0, 7)
INSERT [dbo].[Rooms] ([Id], [RoomNumber], [RoomPrice], [ChildrenCapacity], [PeopleCapacity], [Area], [IsDeleted], [IsExist], [IsBalcony], [IsAnimal], [RoomTypeId]) VALUES (11, 205, CAST(500.00 AS Decimal(18, 2)), 3, 2, CAST(95.00 AS Decimal(18, 2)), 0, 0, 0, 0, 3)
INSERT [dbo].[Rooms] ([Id], [RoomNumber], [RoomPrice], [ChildrenCapacity], [PeopleCapacity], [Area], [IsDeleted], [IsExist], [IsBalcony], [IsAnimal], [RoomTypeId]) VALUES (12, 204, CAST(750.00 AS Decimal(18, 2)), 3, 3, CAST(100.00 AS Decimal(18, 2)), 0, 0, 0, 0, 6)
INSERT [dbo].[Rooms] ([Id], [RoomNumber], [RoomPrice], [ChildrenCapacity], [PeopleCapacity], [Area], [IsDeleted], [IsExist], [IsBalcony], [IsAnimal], [RoomTypeId]) VALUES (13, 206, CAST(400.00 AS Decimal(18, 2)), 2, 1, CAST(65.00 AS Decimal(18, 2)), 0, 0, 0, 0, 1)
INSERT [dbo].[Rooms] ([Id], [RoomNumber], [RoomPrice], [ChildrenCapacity], [PeopleCapacity], [Area], [IsDeleted], [IsExist], [IsBalcony], [IsAnimal], [RoomTypeId]) VALUES (14, 301, CAST(700.00 AS Decimal(18, 2)), 3, 2, CAST(120.00 AS Decimal(18, 2)), 0, 0, 0, 0, 3)
INSERT [dbo].[Rooms] ([Id], [RoomNumber], [RoomPrice], [ChildrenCapacity], [PeopleCapacity], [Area], [IsDeleted], [IsExist], [IsBalcony], [IsAnimal], [RoomTypeId]) VALUES (15, 302, CAST(850.00 AS Decimal(18, 2)), 3, 3, CAST(145.00 AS Decimal(18, 2)), 0, 0, 0, 0, 4)
INSERT [dbo].[Rooms] ([Id], [RoomNumber], [RoomPrice], [ChildrenCapacity], [PeopleCapacity], [Area], [IsDeleted], [IsExist], [IsBalcony], [IsAnimal], [RoomTypeId]) VALUES (16, 303, CAST(500.00 AS Decimal(18, 2)), 2, 2, CAST(80.00 AS Decimal(18, 2)), 0, 0, 0, 0, 2)
INSERT [dbo].[Rooms] ([Id], [RoomNumber], [RoomPrice], [ChildrenCapacity], [PeopleCapacity], [Area], [IsDeleted], [IsExist], [IsBalcony], [IsAnimal], [RoomTypeId]) VALUES (17, 304, CAST(600.00 AS Decimal(18, 2)), 2, 3, CAST(130.00 AS Decimal(18, 2)), 0, 0, 0, 0, 3)
INSERT [dbo].[Rooms] ([Id], [RoomNumber], [RoomPrice], [ChildrenCapacity], [PeopleCapacity], [Area], [IsDeleted], [IsExist], [IsBalcony], [IsAnimal], [RoomTypeId]) VALUES (18, 305, CAST(900.00 AS Decimal(18, 2)), 4, 4, CAST(150.00 AS Decimal(18, 2)), 0, 0, 0, 0, 7)
INSERT [dbo].[Rooms] ([Id], [RoomNumber], [RoomPrice], [ChildrenCapacity], [PeopleCapacity], [Area], [IsDeleted], [IsExist], [IsBalcony], [IsAnimal], [RoomTypeId]) VALUES (19, 306, CAST(500.00 AS Decimal(18, 2)), 2, 2, CAST(120.00 AS Decimal(18, 2)), 0, 0, 0, 0, 2)
INSERT [dbo].[Rooms] ([Id], [RoomNumber], [RoomPrice], [ChildrenCapacity], [PeopleCapacity], [Area], [IsDeleted], [IsExist], [IsBalcony], [IsAnimal], [RoomTypeId]) VALUES (20, 401, CAST(500.00 AS Decimal(18, 2)), 2, 3, CAST(100.00 AS Decimal(18, 2)), 0, 0, 0, 0, 3)
INSERT [dbo].[Rooms] ([Id], [RoomNumber], [RoomPrice], [ChildrenCapacity], [PeopleCapacity], [Area], [IsDeleted], [IsExist], [IsBalcony], [IsAnimal], [RoomTypeId]) VALUES (21, 402, CAST(800.00 AS Decimal(18, 2)), 3, 3, CAST(120.00 AS Decimal(18, 2)), 0, 0, 0, 0, 4)
SET IDENTITY_INSERT [dbo].[Rooms] OFF
GO
SET IDENTITY_INSERT [dbo].[RoomTypes] ON 

INSERT [dbo].[RoomTypes] ([Id], [Name], [IsDeleted], [Image]) VALUES (1, N'OneBed', 0, N'a77523bc-97ab-42da-ba21-e3cfc0c92073_1.jpg')
INSERT [dbo].[RoomTypes] ([Id], [Name], [IsDeleted], [Image]) VALUES (2, N'Twobed', 0, N'bf177d88-6b9d-4b33-92d8-334fae4d131b_5.jpg')
INSERT [dbo].[RoomTypes] ([Id], [Name], [IsDeleted], [Image]) VALUES (3, N'Three Bed', 0, N'fb43a60e-e53d-4b51-9e10-58d540293b7e_6.jpg')
INSERT [dbo].[RoomTypes] ([Id], [Name], [IsDeleted], [Image]) VALUES (4, N'Deluxe ', 0, N'0a904d20-15d5-4df8-99dc-b80e4400ee49_9.jpg')
INSERT [dbo].[RoomTypes] ([Id], [Name], [IsDeleted], [Image]) VALUES (5, N'Junior Suite', 0, N'7dea62ea-abe3-4713-bf5f-d38bd9cc0723_photo-1615874959474-d609969a20ed.jfif')
INSERT [dbo].[RoomTypes] ([Id], [Name], [IsDeleted], [Image]) VALUES (6, N'Double', 0, N'ec52a6c5-64fd-4112-9822-16ba8a522d80_Standard.jpg')
INSERT [dbo].[RoomTypes] ([Id], [Name], [IsDeleted], [Image]) VALUES (7, N'Family', 0, N'f46eed68-3557-4d61-9215-8abc193fcac5_family-room.jpg')
SET IDENTITY_INSERT [dbo].[RoomTypes] OFF
GO
SET IDENTITY_INSERT [dbo].[Services] ON 

INSERT [dbo].[Services] ([Id], [Key], [Value]) VALUES (2, N'SpaTitle', N'Spa center')
INSERT [dbo].[Services] ([Id], [Key], [Value]) VALUES (4, N'SpaDescription', N'In a spa, water is normally kept at a higher temperature (35-38ºC), helping your muscles and tendons relax and getting your blood flow going through your whole body.Guests can take advantage of various beauty treatments and services at the  The Celestial Oasis hotel spa. Facials are very popular, as are manicures and pedicures.')
INSERT [dbo].[Services] ([Id], [Key], [Value]) VALUES (5, N'Feature', N'Modern')
INSERT [dbo].[Services] ([Id], [Key], [Value]) VALUES (6, N'SpaTime', N'Daily: 7.00 am to 9.00 pm')
INSERT [dbo].[Services] ([Id], [Key], [Value]) VALUES (7, N'FitnessTitle', N'Fitness Center')
INSERT [dbo].[Services] ([Id], [Key], [Value]) VALUES (8, N'FitnessDescription', N'The Celestial Oasis hotel extends access to a 24-hour fitness centre offering cardio, weight training equipment, and personal training.The hotel''s fitness center includes a new gym. You can keep fit during your stay in the hotel''s fitness center.')
INSERT [dbo].[Services] ([Id], [Key], [Value]) VALUES (9, N'FitnessTime', N' Daily: 6.00 am to 9.00 pm')
INSERT [dbo].[Services] ([Id], [Key], [Value]) VALUES (10, N'PoolTitle', N'The Health Club & Pool')
INSERT [dbo].[Services] ([Id], [Key], [Value]) VALUES (11, N'PoolDescription', N'The Celestial Oasis hotel health club  is a facility that people go to in order to do exercise and have beauty treatments. The health clubs in our hotel are full of modern exercise equipment.')
INSERT [dbo].[Services] ([Id], [Key], [Value]) VALUES (12, N'PoolTime', N'Daily: 10.00 am to 7.00 pm')
INSERT [dbo].[Services] ([Id], [Key], [Value]) VALUES (13, N'Icon', N'flaticon-clock')
INSERT [dbo].[Services] ([Id], [Key], [Value]) VALUES (14, N'Spamage', N'~/assets/img/restaurant/1.jpg')
INSERT [dbo].[Services] ([Id], [Key], [Value]) VALUES (15, N'FitnessImage', N'~/assets/img/spa/209bda8b-3d16-412e-9198-3bebfe21f6bc_3.jpg')
INSERT [dbo].[Services] ([Id], [Key], [Value]) VALUES (17, N'PoolImage', N'~/assets/img/spa/1.jpg')
INSERT [dbo].[Services] ([Id], [Key], [Value]) VALUES (18, N'RestaurantFeature', N'Discover')
INSERT [dbo].[Services] ([Id], [Key], [Value]) VALUES (19, N'RestaurantTitle', N'The Restaurant')
INSERT [dbo].[Services] ([Id], [Key], [Value]) VALUES (20, N'RestaurantDescription', N'restoran')
INSERT [dbo].[Services] ([Id], [Key], [Value]) VALUES (22, N'RestaurantTime', N'Daily: 10.00 am to 12.00 pm')
SET IDENTITY_INSERT [dbo].[Services] OFF
GO
SET IDENTITY_INSERT [dbo].[Settings] ON 

INSERT [dbo].[Settings] ([Id], [Key], [Value]) VALUES (1, N'about', N'Welcome to the best five-star deluxe hotel in New York. Hotel elementum sesue the aucan vestibulum aliquam justo in sapien rutrum ')
INSERT [dbo].[Settings] ([Id], [Key], [Value]) VALUES (2, N'gmail', N'tahirhsnli246@gmail.com')
INSERT [dbo].[Settings] ([Id], [Key], [Value]) VALUES (3, N'phone', N'+994-0506806111')
INSERT [dbo].[Settings] ([Id], [Key], [Value]) VALUES (4, N'location', N'1616 Broadway NY, New York 10001')
INSERT [dbo].[Settings] ([Id], [Key], [Value]) VALUES (5, N'country', N'Azerbaijan')
INSERT [dbo].[Settings] ([Id], [Key], [Value]) VALUES (6, N'phoneicon', N'flaticon-call')
SET IDENTITY_INSERT [dbo].[Settings] OFF
GO
SET IDENTITY_INSERT [dbo].[Sliders] ON 

INSERT [dbo].[Sliders] ([Id], [Title], [Description], [Image], [IsDeleted]) VALUES (1, N'Deluxe King size room', N'Our Deluxe king size room has a seating area', N'87ad4c6b-cdf5-41be-bd3d-c4db2193c69b_2.jpg', 0)
INSERT [dbo].[Sliders] ([Id], [Title], [Description], [Image], [IsDeleted]) VALUES (2, N'Celestial Oasis hotel sea view   ', N' Wish in the accommodation view ', N'94620477-55b0-47ec-a1e1-b6366ae2ccee_5.jpg', 0)
SET IDENTITY_INSERT [dbo].[Sliders] OFF
GO
SET IDENTITY_INSERT [dbo].[Spa] ON 

INSERT [dbo].[Spa] ([Id], [Key], [Value]) VALUES (1, N'Title', N'Spa & Wellness')
INSERT [dbo].[Spa] ([Id], [Key], [Value]) VALUES (2, N'Description', N'In a spa, water is normally kept at a higher temperature (35-38ºC), helping your muscles and tendons relax and getting your blood flow going through your whole body.Guests can take advantage of various beauty treatments and services at the  The Celestial Oasis hotel spa. Facials are very popular, as are manicures and pedicures.')
INSERT [dbo].[Spa] ([Id], [Key], [Value]) VALUES (4, N'PhoneIcon', N'flaticon-call')
INSERT [dbo].[Spa] ([Id], [Key], [Value]) VALUES (5, N'Phone', N'+994-050-680-61-11')
SET IDENTITY_INSERT [dbo].[Spa] OFF
GO
SET IDENTITY_INSERT [dbo].[SpaSliders] ON 

INSERT [dbo].[SpaSliders] ([Id], [Image]) VALUES (1, N'209bda8b-3d16-412e-9198-3bebfe21f6bc_3.jpg')
INSERT [dbo].[SpaSliders] ([Id], [Image]) VALUES (3, N'3efb2a11-b74b-4f00-bbae-9ec0d4942949_bbf50aed-f12b-406a-afec-69b4612a64ce_1.jpg')
INSERT [dbo].[SpaSliders] ([Id], [Image]) VALUES (4, N'35663801-26fe-4671-a96a-9f2c4a0af65b_4.jpg')
SET IDENTITY_INSERT [dbo].[SpaSliders] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetRoleClaims_RoleId]    Script Date: 04.07.2023 15:17:16 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetRoleClaims_RoleId] ON [dbo].[AspNetRoleClaims]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 04.07.2023 15:17:16 ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[NormalizedName] ASC
)
WHERE ([NormalizedName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserClaims_UserId]    Script Date: 04.07.2023 15:17:16 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserClaims_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserLogins_UserId]    Script Date: 04.07.2023 15:17:16 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserLogins_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserRoles_RoleId]    Script Date: 04.07.2023 15:17:16 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserRoles_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [EmailIndex]    Script Date: 04.07.2023 15:17:16 ******/
CREATE NONCLUSTERED INDEX [EmailIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UserNameIndex]    Script Date: 04.07.2023 15:17:16 ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedUserName] ASC
)
WHERE ([NormalizedUserName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Bookings_AppUserId]    Script Date: 04.07.2023 15:17:16 ******/
CREATE NONCLUSTERED INDEX [IX_Bookings_AppUserId] ON [dbo].[Bookings]
(
	[AppUserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Bookings_RoomId]    Script Date: 04.07.2023 15:17:16 ******/
CREATE NONCLUSTERED INDEX [IX_Bookings_RoomId] ON [dbo].[Bookings]
(
	[RoomId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Employees_ProfessionId]    Script Date: 04.07.2023 15:17:16 ******/
CREATE NONCLUSTERED INDEX [IX_Employees_ProfessionId] ON [dbo].[Employees]
(
	[ProfessionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_RoomImages_RoomId]    Script Date: 04.07.2023 15:17:16 ******/
CREATE NONCLUSTERED INDEX [IX_RoomImages_RoomId] ON [dbo].[RoomImages]
(
	[RoomId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Rooms_RoomTypeId]    Script Date: 04.07.2023 15:17:16 ******/
CREATE NONCLUSTERED INDEX [IX_Rooms_RoomTypeId] ON [dbo].[Rooms]
(
	[RoomTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Bookings] ADD  DEFAULT ((0.0)) FOR [TotalPrice]
GO
ALTER TABLE [dbo].[Employees] ADD  DEFAULT (N'') FOR [Image]
GO
ALTER TABLE [dbo].[Employees] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Facilities] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Faqs] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Professions] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Rooms] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Rooms] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IsExist]
GO
ALTER TABLE [dbo].[Rooms] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IsBalcony]
GO
ALTER TABLE [dbo].[Rooms] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IsAnimal]
GO
ALTER TABLE [dbo].[Sliders] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[AspNetRoleClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetRoleClaims] CHECK CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserTokens]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserTokens] CHECK CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[Bookings]  WITH CHECK ADD  CONSTRAINT [FK_Bookings_AspNetUsers_AppUserId] FOREIGN KEY([AppUserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Bookings] CHECK CONSTRAINT [FK_Bookings_AspNetUsers_AppUserId]
GO
ALTER TABLE [dbo].[Bookings]  WITH CHECK ADD  CONSTRAINT [FK_Bookings_Rooms_RoomId] FOREIGN KEY([RoomId])
REFERENCES [dbo].[Rooms] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Bookings] CHECK CONSTRAINT [FK_Bookings_Rooms_RoomId]
GO
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD  CONSTRAINT [FK_Employees_Professions_ProfessionId] FOREIGN KEY([ProfessionId])
REFERENCES [dbo].[Professions] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [FK_Employees_Professions_ProfessionId]
GO
ALTER TABLE [dbo].[RoomImages]  WITH CHECK ADD  CONSTRAINT [FK_RoomImages_Rooms_RoomId] FOREIGN KEY([RoomId])
REFERENCES [dbo].[Rooms] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[RoomImages] CHECK CONSTRAINT [FK_RoomImages_Rooms_RoomId]
GO
ALTER TABLE [dbo].[Rooms]  WITH CHECK ADD  CONSTRAINT [FK_Rooms_RoomTypes_RoomTypeId] FOREIGN KEY([RoomTypeId])
REFERENCES [dbo].[RoomTypes] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Rooms] CHECK CONSTRAINT [FK_Rooms_RoomTypes_RoomTypeId]
GO
USE [master]
GO
ALTER DATABASE [Hote] SET  READ_WRITE 
GO

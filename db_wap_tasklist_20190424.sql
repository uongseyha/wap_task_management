USE [master]
GO
/****** Object:  Database [DB_A46D82_wapproject]    Script Date: 4/24/2019 6:21:29 PM ******/
CREATE DATABASE [DB_A46D82_wapproject]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DB_A46D82_wapproject_Data', FILENAME = N'H:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\DB_A46D82_wapproject_DATA.mdf' , SIZE = 8192KB , MAXSIZE = 1024000KB , FILEGROWTH = 10%)
 LOG ON 
( NAME = N'DB_A46D82_wapproject_Log', FILENAME = N'H:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\DB_A46D82_wapproject_Log.LDF' , SIZE = 3072KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [DB_A46D82_wapproject] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DB_A46D82_wapproject].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DB_A46D82_wapproject] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DB_A46D82_wapproject] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DB_A46D82_wapproject] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DB_A46D82_wapproject] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DB_A46D82_wapproject] SET ARITHABORT OFF 
GO
ALTER DATABASE [DB_A46D82_wapproject] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DB_A46D82_wapproject] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DB_A46D82_wapproject] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DB_A46D82_wapproject] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DB_A46D82_wapproject] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DB_A46D82_wapproject] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DB_A46D82_wapproject] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DB_A46D82_wapproject] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DB_A46D82_wapproject] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DB_A46D82_wapproject] SET  ENABLE_BROKER 
GO
ALTER DATABASE [DB_A46D82_wapproject] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DB_A46D82_wapproject] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DB_A46D82_wapproject] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DB_A46D82_wapproject] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DB_A46D82_wapproject] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DB_A46D82_wapproject] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DB_A46D82_wapproject] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DB_A46D82_wapproject] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DB_A46D82_wapproject] SET  MULTI_USER 
GO
ALTER DATABASE [DB_A46D82_wapproject] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DB_A46D82_wapproject] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DB_A46D82_wapproject] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DB_A46D82_wapproject] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DB_A46D82_wapproject] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DB_A46D82_wapproject] SET QUERY_STORE = OFF
GO
USE [DB_A46D82_wapproject]
GO
/****** Object:  Table [dbo].[users]    Script Date: 4/24/2019 6:21:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[email] [nvarchar](50) NULL,
	[password] [nvarchar](50) NULL,
	[address] [nvarchar](200) NULL,
	[lat] [float] NULL,
	[lng] [float] NULL,
	[user_role] [nvarchar](50) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user_team]    Script Date: 4/24/2019 6:21:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user_team](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[team_name] [nvarchar](50) NULL,
	[user_id] [int] NULL,
 CONSTRAINT [PK_user_team] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[task]    Script Date: 4/24/2019 6:21:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[task](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](100) NULL,
	[due_date] [nvarchar](50) NULL,
	[priority] [nvarchar](50) NULL,
	[category] [nvarchar](50) NULL,
	[user_id] [int] NULL,
	[team_name] [nvarchar](50) NULL,
	[finish_date] [nvarchar](50) NULL,
	[rate_by_id] [int] NULL,
	[rate] [nvarchar](50) NULL,
	[rate_date] [nvarchar](50) NULL,
 CONSTRAINT [PK_Task] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[view_getAllUserTeam]    Script Date: 4/24/2019 6:21:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[view_getAllUserTeam] as 
select a.*,b.name,a.user_id as developer_id from task as a left join users as b on a.user_id=b.id 
union
select a.*,c.name,b.user_id as developer_id from task as a
left join user_team as b on a.team_name=b.team_name
left join users as c on b.user_id=c.id
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 4/24/2019 6:21:31 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[temp]    Script Date: 4/24/2019 6:21:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[temp](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](50) NULL
) ON [PRIMARY]
GO
USE [master]
GO
ALTER DATABASE [DB_A46D82_wapproject] SET  READ_WRITE 
GO

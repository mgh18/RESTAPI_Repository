USE [master]
GO
/****** Object:  Database [DeveloperDB]    Script Date: 22/11/21 12:24:58 AM ******/
CREATE DATABASE [DeveloperDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DeveloperDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\DeveloperDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DeveloperDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\DeveloperDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [DeveloperDB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DeveloperDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DeveloperDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DeveloperDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DeveloperDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DeveloperDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DeveloperDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [DeveloperDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DeveloperDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DeveloperDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DeveloperDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DeveloperDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DeveloperDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DeveloperDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DeveloperDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DeveloperDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DeveloperDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DeveloperDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DeveloperDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DeveloperDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DeveloperDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DeveloperDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DeveloperDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DeveloperDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DeveloperDB] SET RECOVERY FULL 
GO
ALTER DATABASE [DeveloperDB] SET  MULTI_USER 
GO
ALTER DATABASE [DeveloperDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DeveloperDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DeveloperDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DeveloperDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DeveloperDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DeveloperDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'DeveloperDB', N'ON'
GO
ALTER DATABASE [DeveloperDB] SET QUERY_STORE = OFF
GO
USE [DeveloperDB]
GO
/****** Object:  Table [dbo].[Developers]    Script Date: 22/11/21 12:24:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Developers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DeveloperName] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[GithubURL] [nvarchar](50) NULL,
	[ImageURL] [nvarchar](50) NULL,
	[Department] [nvarchar](50) NULL,
	[JoinedDate] [date] NULL,
 CONSTRAINT [PK_Developers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Developers] ON 

INSERT [dbo].[Developers] ([Id], [DeveloperName], [Email], [GithubURL], [ImageURL], [Department], [JoinedDate]) VALUES (1, N'Ti West', N'Tika@yahoo.com', N'http://www.github.com/westti', N'no photo', N'DeooeDe', CAST(N'2021-02-04' AS Date))
SET IDENTITY_INSERT [dbo].[Developers] OFF
GO
USE [master]
GO
ALTER DATABASE [DeveloperDB] SET  READ_WRITE 
GO

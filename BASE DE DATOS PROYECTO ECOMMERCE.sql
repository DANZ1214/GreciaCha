USE [master]
GO
/****** Object:  Database [E-COMMERCE_PROYECTO]    Script Date: 1/7/2025 21:32:15 ******/
CREATE DATABASE [E-COMMERCE_PROYECTO]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'E-COMMERCE_PROYECTO', FILENAME = N'C:\Users\dabet\OneDrive\Escritorio\SQL\E-COMMERCE_PROYECTO.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'E-COMMERCE_PROYECTO_log', FILENAME = N'C:\Users\dabet\OneDrive\Escritorio\SQL\E-COMMERCE_PROYECTO_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [E-COMMERCE_PROYECTO] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [E-COMMERCE_PROYECTO].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [E-COMMERCE_PROYECTO] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [E-COMMERCE_PROYECTO] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [E-COMMERCE_PROYECTO] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [E-COMMERCE_PROYECTO] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [E-COMMERCE_PROYECTO] SET ARITHABORT OFF 
GO
ALTER DATABASE [E-COMMERCE_PROYECTO] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [E-COMMERCE_PROYECTO] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [E-COMMERCE_PROYECTO] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [E-COMMERCE_PROYECTO] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [E-COMMERCE_PROYECTO] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [E-COMMERCE_PROYECTO] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [E-COMMERCE_PROYECTO] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [E-COMMERCE_PROYECTO] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [E-COMMERCE_PROYECTO] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [E-COMMERCE_PROYECTO] SET  DISABLE_BROKER 
GO
ALTER DATABASE [E-COMMERCE_PROYECTO] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [E-COMMERCE_PROYECTO] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [E-COMMERCE_PROYECTO] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [E-COMMERCE_PROYECTO] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [E-COMMERCE_PROYECTO] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [E-COMMERCE_PROYECTO] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [E-COMMERCE_PROYECTO] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [E-COMMERCE_PROYECTO] SET RECOVERY FULL 
GO
ALTER DATABASE [E-COMMERCE_PROYECTO] SET  MULTI_USER 
GO
ALTER DATABASE [E-COMMERCE_PROYECTO] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [E-COMMERCE_PROYECTO] SET DB_CHAINING OFF 
GO
ALTER DATABASE [E-COMMERCE_PROYECTO] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [E-COMMERCE_PROYECTO] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [E-COMMERCE_PROYECTO] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [E-COMMERCE_PROYECTO] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'E-COMMERCE_PROYECTO', N'ON'
GO
ALTER DATABASE [E-COMMERCE_PROYECTO] SET QUERY_STORE = OFF
GO
USE [E-COMMERCE_PROYECTO]
GO
/****** Object:  Table [dbo].[CARRITOS]    Script Date: 1/7/2025 21:32:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CARRITOS](
	[IdCar] [int] IDENTITY(1,1) NOT NULL,
	[CorUsu] [nvarchar](80) NOT NULL,
	[FecCar] [datetime] NOT NULL,
 CONSTRAINT [PK__CARRITOS__0FA780586B87838C] PRIMARY KEY CLUSTERED 
(
	[IdCar] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CATEGORIAS]    Script Date: 1/7/2025 21:32:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CATEGORIAS](
	[IdCat] [int] IDENTITY(1,1) NOT NULL,
	[NomCat] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_CATEGORIAS] PRIMARY KEY CLUSTERED 
(
	[IdCat] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DETALLESCARRITO]    Script Date: 1/7/2025 21:32:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DETALLESCARRITO](
	[IdDetCar] [int] IDENTITY(1,1) NOT NULL,
	[IdCar] [int] NOT NULL,
	[IdPro] [int] NOT NULL,
	[CanPro] [int] NOT NULL,
 CONSTRAINT [PK__DETALLES__B291EBB04321813D] PRIMARY KEY CLUSTERED 
(
	[IdDetCar] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MARCAS]    Script Date: 1/7/2025 21:32:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MARCAS](
	[IdMar] [int] IDENTITY(1,1) NOT NULL,
	[NomMar] [nvarchar](40) NOT NULL,
 CONSTRAINT [PK_MARCAS] PRIMARY KEY CLUSTERED 
(
	[IdMar] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PRODUCTOS]    Script Date: 1/7/2025 21:32:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PRODUCTOS](
	[IdPro] [int] NOT NULL,
	[NomPro] [nvarchar](70) NOT NULL,
	[DesPro] [nvarchar](100) NOT NULL,
	[PrePro] [decimal](10, 2) NOT NULL,
	[StoPro] [int] NOT NULL,
	[IdCat] [int] NOT NULL,
	[IdMar] [int] NOT NULL,
	[EstPro] [bit] NOT NULL,
	[FecAdqPro] [date] NOT NULL,
	[ImaPro] [nvarchar](200) NULL,
 CONSTRAINT [PK_PRODUCTOS] PRIMARY KEY CLUSTERED 
(
	[IdPro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[USUARIOS]    Script Date: 1/7/2025 21:32:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[USUARIOS](
	[CorUsu] [nvarchar](80) NOT NULL,
	[ConUsu] [nvarchar](30) NOT NULL,
	[RolUsu] [int] NOT NULL,
	[EstUsu] [bit] NOT NULL,
 CONSTRAINT [PK_USUARIOS] PRIMARY KEY CLUSTERED 
(
	[CorUsu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[CARRITOS] ON 
GO
INSERT [dbo].[CARRITOS] ([IdCar], [CorUsu], [FecCar]) VALUES (1, N'ferrerawilson@unicah.edu', CAST(N'2025-06-26T21:45:18.157' AS DateTime))
GO
INSERT [dbo].[CARRITOS] ([IdCar], [CorUsu], [FecCar]) VALUES (2, N'ferrerawilson@unicah.edu', CAST(N'2025-06-26T22:06:58.837' AS DateTime))
GO
INSERT [dbo].[CARRITOS] ([IdCar], [CorUsu], [FecCar]) VALUES (5, N'ferrerawilson@unicah.edu', CAST(N'2025-06-27T11:36:50.157' AS DateTime))
GO
INSERT [dbo].[CARRITOS] ([IdCar], [CorUsu], [FecCar]) VALUES (6, N'ferrerawilson@unicah.edu', CAST(N'2025-06-27T11:42:28.090' AS DateTime))
GO
INSERT [dbo].[CARRITOS] ([IdCar], [CorUsu], [FecCar]) VALUES (13, N'ferrerawilson@unicah.edu', CAST(N'2025-06-27T21:17:42.500' AS DateTime))
GO
INSERT [dbo].[CARRITOS] ([IdCar], [CorUsu], [FecCar]) VALUES (14, N'ferrerawilson@unicah.edu', CAST(N'2025-06-27T21:18:18.283' AS DateTime))
GO
INSERT [dbo].[CARRITOS] ([IdCar], [CorUsu], [FecCar]) VALUES (17, N'ferrerawilson@unicah.edu', CAST(N'2025-06-27T21:59:19.987' AS DateTime))
GO
INSERT [dbo].[CARRITOS] ([IdCar], [CorUsu], [FecCar]) VALUES (18, N'ferrerawilson@unicah.edu', CAST(N'2025-06-27T22:02:13.220' AS DateTime))
GO
INSERT [dbo].[CARRITOS] ([IdCar], [CorUsu], [FecCar]) VALUES (19, N'ferrerawilson@unicah.edu', CAST(N'2025-06-27T22:09:32.870' AS DateTime))
GO
INSERT [dbo].[CARRITOS] ([IdCar], [CorUsu], [FecCar]) VALUES (20, N'ferrerawilson@unicah.edu', CAST(N'2025-06-27T22:11:41.027' AS DateTime))
GO
INSERT [dbo].[CARRITOS] ([IdCar], [CorUsu], [FecCar]) VALUES (21, N'ferrerawilson@unicah.edu', CAST(N'2025-06-27T22:12:54.713' AS DateTime))
GO
INSERT [dbo].[CARRITOS] ([IdCar], [CorUsu], [FecCar]) VALUES (22, N'ferrerawilson@unicah.edu', CAST(N'2025-06-27T22:16:06.727' AS DateTime))
GO
INSERT [dbo].[CARRITOS] ([IdCar], [CorUsu], [FecCar]) VALUES (23, N'ferrerawilson@unicah.edu', CAST(N'2025-06-27T22:17:50.040' AS DateTime))
GO
INSERT [dbo].[CARRITOS] ([IdCar], [CorUsu], [FecCar]) VALUES (24, N'ferrerawilson@unicah.edu', CAST(N'2025-06-27T22:28:55.523' AS DateTime))
GO
INSERT [dbo].[CARRITOS] ([IdCar], [CorUsu], [FecCar]) VALUES (25, N'ferrerawilson@unicah.edu', CAST(N'2025-06-27T22:31:29.770' AS DateTime))
GO
INSERT [dbo].[CARRITOS] ([IdCar], [CorUsu], [FecCar]) VALUES (26, N'ferrerawilson@unicah.edu', CAST(N'2025-06-28T09:54:09.507' AS DateTime))
GO
INSERT [dbo].[CARRITOS] ([IdCar], [CorUsu], [FecCar]) VALUES (27, N'ferrerawilson@unicah.edu', CAST(N'2025-06-28T10:05:12.503' AS DateTime))
GO
INSERT [dbo].[CARRITOS] ([IdCar], [CorUsu], [FecCar]) VALUES (28, N'ferrerawilson@unicah.edu', CAST(N'2025-06-28T10:54:14.393' AS DateTime))
GO
INSERT [dbo].[CARRITOS] ([IdCar], [CorUsu], [FecCar]) VALUES (29, N'ferrerawilson@unicah.edu', CAST(N'2025-06-28T11:04:17.900' AS DateTime))
GO
INSERT [dbo].[CARRITOS] ([IdCar], [CorUsu], [FecCar]) VALUES (30, N'ferrerawilson@unicah.edu', CAST(N'2025-06-28T11:06:20.610' AS DateTime))
GO
INSERT [dbo].[CARRITOS] ([IdCar], [CorUsu], [FecCar]) VALUES (36, N'ferrerawilson@unicah.edu', CAST(N'2025-06-28T11:51:03.680' AS DateTime))
GO
INSERT [dbo].[CARRITOS] ([IdCar], [CorUsu], [FecCar]) VALUES (42, N'ferrerawilson@unicah.edu', CAST(N'2025-06-28T12:57:50.663' AS DateTime))
GO
INSERT [dbo].[CARRITOS] ([IdCar], [CorUsu], [FecCar]) VALUES (60, N'ferrerawilson@unicah.edu', CAST(N'2025-06-28T21:23:27.353' AS DateTime))
GO
INSERT [dbo].[CARRITOS] ([IdCar], [CorUsu], [FecCar]) VALUES (61, N'ferrerawilson@unicah.edu', CAST(N'2025-07-01T10:46:12.703' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[CARRITOS] OFF
GO
SET IDENTITY_INSERT [dbo].[CATEGORIAS] ON 
GO
INSERT [dbo].[CATEGORIAS] ([IdCat], [NomCat]) VALUES (1, N'Escritorio')
GO
INSERT [dbo].[CATEGORIAS] ([IdCat], [NomCat]) VALUES (2, N'Portátil')
GO
INSERT [dbo].[CATEGORIAS] ([IdCat], [NomCat]) VALUES (3, N'Servidor')
GO
INSERT [dbo].[CATEGORIAS] ([IdCat], [NomCat]) VALUES (4, N'All-in-One')
GO
INSERT [dbo].[CATEGORIAS] ([IdCat], [NomCat]) VALUES (5, N'Tablets')
GO
INSERT [dbo].[CATEGORIAS] ([IdCat], [NomCat]) VALUES (6, N'Dispositivo móvil')
GO
INSERT [dbo].[CATEGORIAS] ([IdCat], [NomCat]) VALUES (7, N'Periféricos')
GO
INSERT [dbo].[CATEGORIAS] ([IdCat], [NomCat]) VALUES (8, N'Otros')
GO
INSERT [dbo].[CATEGORIAS] ([IdCat], [NomCat]) VALUES (9, N'Gaming')
GO
SET IDENTITY_INSERT [dbo].[CATEGORIAS] OFF
GO
SET IDENTITY_INSERT [dbo].[DETALLESCARRITO] ON 
GO
INSERT [dbo].[DETALLESCARRITO] ([IdDetCar], [IdCar], [IdPro], [CanPro]) VALUES (1, 1, 1, 1)
GO
INSERT [dbo].[DETALLESCARRITO] ([IdDetCar], [IdCar], [IdPro], [CanPro]) VALUES (2, 1, 2, 1)
GO
INSERT [dbo].[DETALLESCARRITO] ([IdDetCar], [IdCar], [IdPro], [CanPro]) VALUES (3, 1, 1, 1)
GO
INSERT [dbo].[DETALLESCARRITO] ([IdDetCar], [IdCar], [IdPro], [CanPro]) VALUES (4, 2, 1, 1)
GO
INSERT [dbo].[DETALLESCARRITO] ([IdDetCar], [IdCar], [IdPro], [CanPro]) VALUES (5, 2, 2, 1)
GO
INSERT [dbo].[DETALLESCARRITO] ([IdDetCar], [IdCar], [IdPro], [CanPro]) VALUES (13, 5, 1, 2)
GO
INSERT [dbo].[DETALLESCARRITO] ([IdDetCar], [IdCar], [IdPro], [CanPro]) VALUES (27, 13, 1, 8)
GO
INSERT [dbo].[DETALLESCARRITO] ([IdDetCar], [IdCar], [IdPro], [CanPro]) VALUES (28, 13, 2, 5)
GO
INSERT [dbo].[DETALLESCARRITO] ([IdDetCar], [IdCar], [IdPro], [CanPro]) VALUES (29, 13, 3, 3)
GO
INSERT [dbo].[DETALLESCARRITO] ([IdDetCar], [IdCar], [IdPro], [CanPro]) VALUES (30, 13, 4, 12)
GO
INSERT [dbo].[DETALLESCARRITO] ([IdDetCar], [IdCar], [IdPro], [CanPro]) VALUES (31, 13, 5, 1)
GO
INSERT [dbo].[DETALLESCARRITO] ([IdDetCar], [IdCar], [IdPro], [CanPro]) VALUES (32, 14, 1, 8)
GO
INSERT [dbo].[DETALLESCARRITO] ([IdDetCar], [IdCar], [IdPro], [CanPro]) VALUES (45, 17, 1, 2)
GO
INSERT [dbo].[DETALLESCARRITO] ([IdDetCar], [IdCar], [IdPro], [CanPro]) VALUES (46, 17, 2, 4)
GO
INSERT [dbo].[DETALLESCARRITO] ([IdDetCar], [IdCar], [IdPro], [CanPro]) VALUES (47, 17, 3, 2)
GO
INSERT [dbo].[DETALLESCARRITO] ([IdDetCar], [IdCar], [IdPro], [CanPro]) VALUES (48, 17, 4, 2)
GO
INSERT [dbo].[DETALLESCARRITO] ([IdDetCar], [IdCar], [IdPro], [CanPro]) VALUES (49, 18, 1, 2)
GO
INSERT [dbo].[DETALLESCARRITO] ([IdDetCar], [IdCar], [IdPro], [CanPro]) VALUES (50, 18, 3, 2)
GO
INSERT [dbo].[DETALLESCARRITO] ([IdDetCar], [IdCar], [IdPro], [CanPro]) VALUES (51, 18, 2, 1)
GO
INSERT [dbo].[DETALLESCARRITO] ([IdDetCar], [IdCar], [IdPro], [CanPro]) VALUES (52, 19, 1, 5)
GO
INSERT [dbo].[DETALLESCARRITO] ([IdDetCar], [IdCar], [IdPro], [CanPro]) VALUES (53, 19, 2, 2)
GO
INSERT [dbo].[DETALLESCARRITO] ([IdDetCar], [IdCar], [IdPro], [CanPro]) VALUES (54, 19, 3, 4)
GO
INSERT [dbo].[DETALLESCARRITO] ([IdDetCar], [IdCar], [IdPro], [CanPro]) VALUES (55, 19, 4, 5)
GO
INSERT [dbo].[DETALLESCARRITO] ([IdDetCar], [IdCar], [IdPro], [CanPro]) VALUES (56, 20, 1, 7)
GO
INSERT [dbo].[DETALLESCARRITO] ([IdDetCar], [IdCar], [IdPro], [CanPro]) VALUES (57, 20, 2, 2)
GO
INSERT [dbo].[DETALLESCARRITO] ([IdDetCar], [IdCar], [IdPro], [CanPro]) VALUES (58, 20, 3, 3)
GO
INSERT [dbo].[DETALLESCARRITO] ([IdDetCar], [IdCar], [IdPro], [CanPro]) VALUES (59, 20, 4, 5)
GO
INSERT [dbo].[DETALLESCARRITO] ([IdDetCar], [IdCar], [IdPro], [CanPro]) VALUES (60, 21, 1, 3)
GO
INSERT [dbo].[DETALLESCARRITO] ([IdDetCar], [IdCar], [IdPro], [CanPro]) VALUES (61, 21, 2, 2)
GO
INSERT [dbo].[DETALLESCARRITO] ([IdDetCar], [IdCar], [IdPro], [CanPro]) VALUES (62, 21, 3, 3)
GO
INSERT [dbo].[DETALLESCARRITO] ([IdDetCar], [IdCar], [IdPro], [CanPro]) VALUES (63, 21, 4, 3)
GO
INSERT [dbo].[DETALLESCARRITO] ([IdDetCar], [IdCar], [IdPro], [CanPro]) VALUES (64, 22, 1, 2)
GO
INSERT [dbo].[DETALLESCARRITO] ([IdDetCar], [IdCar], [IdPro], [CanPro]) VALUES (65, 22, 3, 2)
GO
INSERT [dbo].[DETALLESCARRITO] ([IdDetCar], [IdCar], [IdPro], [CanPro]) VALUES (66, 22, 4, 2)
GO
INSERT [dbo].[DETALLESCARRITO] ([IdDetCar], [IdCar], [IdPro], [CanPro]) VALUES (67, 22, 2, 1)
GO
INSERT [dbo].[DETALLESCARRITO] ([IdDetCar], [IdCar], [IdPro], [CanPro]) VALUES (68, 23, 2, 1)
GO
INSERT [dbo].[DETALLESCARRITO] ([IdDetCar], [IdCar], [IdPro], [CanPro]) VALUES (69, 23, 4, 1)
GO
INSERT [dbo].[DETALLESCARRITO] ([IdDetCar], [IdCar], [IdPro], [CanPro]) VALUES (70, 23, 5, 1)
GO
INSERT [dbo].[DETALLESCARRITO] ([IdDetCar], [IdCar], [IdPro], [CanPro]) VALUES (71, 23, 3, 1)
GO
INSERT [dbo].[DETALLESCARRITO] ([IdDetCar], [IdCar], [IdPro], [CanPro]) VALUES (72, 24, 2, 6)
GO
INSERT [dbo].[DETALLESCARRITO] ([IdDetCar], [IdCar], [IdPro], [CanPro]) VALUES (73, 24, 4, 1)
GO
INSERT [dbo].[DETALLESCARRITO] ([IdDetCar], [IdCar], [IdPro], [CanPro]) VALUES (74, 24, 3, 2)
GO
INSERT [dbo].[DETALLESCARRITO] ([IdDetCar], [IdCar], [IdPro], [CanPro]) VALUES (75, 25, 2, 1)
GO
INSERT [dbo].[DETALLESCARRITO] ([IdDetCar], [IdCar], [IdPro], [CanPro]) VALUES (76, 25, 3, 1)
GO
INSERT [dbo].[DETALLESCARRITO] ([IdDetCar], [IdCar], [IdPro], [CanPro]) VALUES (77, 25, 4, 1)
GO
INSERT [dbo].[DETALLESCARRITO] ([IdDetCar], [IdCar], [IdPro], [CanPro]) VALUES (78, 26, 1, 1)
GO
INSERT [dbo].[DETALLESCARRITO] ([IdDetCar], [IdCar], [IdPro], [CanPro]) VALUES (79, 26, 2, 1)
GO
INSERT [dbo].[DETALLESCARRITO] ([IdDetCar], [IdCar], [IdPro], [CanPro]) VALUES (80, 26, 3, 1)
GO
INSERT [dbo].[DETALLESCARRITO] ([IdDetCar], [IdCar], [IdPro], [CanPro]) VALUES (81, 26, 4, 1)
GO
INSERT [dbo].[DETALLESCARRITO] ([IdDetCar], [IdCar], [IdPro], [CanPro]) VALUES (82, 27, 1, 1)
GO
INSERT [dbo].[DETALLESCARRITO] ([IdDetCar], [IdCar], [IdPro], [CanPro]) VALUES (83, 27, 2, 2)
GO
INSERT [dbo].[DETALLESCARRITO] ([IdDetCar], [IdCar], [IdPro], [CanPro]) VALUES (84, 27, 3, 1)
GO
INSERT [dbo].[DETALLESCARRITO] ([IdDetCar], [IdCar], [IdPro], [CanPro]) VALUES (85, 27, 4, 1)
GO
INSERT [dbo].[DETALLESCARRITO] ([IdDetCar], [IdCar], [IdPro], [CanPro]) VALUES (86, 28, 6, 1)
GO
INSERT [dbo].[DETALLESCARRITO] ([IdDetCar], [IdCar], [IdPro], [CanPro]) VALUES (87, 28, 9, 1)
GO
INSERT [dbo].[DETALLESCARRITO] ([IdDetCar], [IdCar], [IdPro], [CanPro]) VALUES (88, 28, 1, 1)
GO
INSERT [dbo].[DETALLESCARRITO] ([IdDetCar], [IdCar], [IdPro], [CanPro]) VALUES (89, 28, 3, 1)
GO
INSERT [dbo].[DETALLESCARRITO] ([IdDetCar], [IdCar], [IdPro], [CanPro]) VALUES (90, 28, 4, 1)
GO
INSERT [dbo].[DETALLESCARRITO] ([IdDetCar], [IdCar], [IdPro], [CanPro]) VALUES (91, 29, 1, 1)
GO
INSERT [dbo].[DETALLESCARRITO] ([IdDetCar], [IdCar], [IdPro], [CanPro]) VALUES (92, 29, 2, 1)
GO
INSERT [dbo].[DETALLESCARRITO] ([IdDetCar], [IdCar], [IdPro], [CanPro]) VALUES (93, 30, 1, 1)
GO
INSERT [dbo].[DETALLESCARRITO] ([IdDetCar], [IdCar], [IdPro], [CanPro]) VALUES (94, 30, 2, 1)
GO
INSERT [dbo].[DETALLESCARRITO] ([IdDetCar], [IdCar], [IdPro], [CanPro]) VALUES (105, 36, 2, 1)
GO
INSERT [dbo].[DETALLESCARRITO] ([IdDetCar], [IdCar], [IdPro], [CanPro]) VALUES (106, 36, 3, 1)
GO
INSERT [dbo].[DETALLESCARRITO] ([IdDetCar], [IdCar], [IdPro], [CanPro]) VALUES (116, 42, 1, 1)
GO
INSERT [dbo].[DETALLESCARRITO] ([IdDetCar], [IdCar], [IdPro], [CanPro]) VALUES (153, 60, 1, 1)
GO
INSERT [dbo].[DETALLESCARRITO] ([IdDetCar], [IdCar], [IdPro], [CanPro]) VALUES (154, 60, 2, 1)
GO
INSERT [dbo].[DETALLESCARRITO] ([IdDetCar], [IdCar], [IdPro], [CanPro]) VALUES (155, 61, 31, 1)
GO
SET IDENTITY_INSERT [dbo].[DETALLESCARRITO] OFF
GO
SET IDENTITY_INSERT [dbo].[MARCAS] ON 
GO
INSERT [dbo].[MARCAS] ([IdMar], [NomMar]) VALUES (1, N'Dell')
GO
INSERT [dbo].[MARCAS] ([IdMar], [NomMar]) VALUES (2, N'HP')
GO
INSERT [dbo].[MARCAS] ([IdMar], [NomMar]) VALUES (3, N'Apple')
GO
INSERT [dbo].[MARCAS] ([IdMar], [NomMar]) VALUES (4, N'Lenovo')
GO
INSERT [dbo].[MARCAS] ([IdMar], [NomMar]) VALUES (5, N'Acer')
GO
INSERT [dbo].[MARCAS] ([IdMar], [NomMar]) VALUES (6, N'Asus')
GO
INSERT [dbo].[MARCAS] ([IdMar], [NomMar]) VALUES (7, N'MSI')
GO
INSERT [dbo].[MARCAS] ([IdMar], [NomMar]) VALUES (8, N'ASRock')
GO
INSERT [dbo].[MARCAS] ([IdMar], [NomMar]) VALUES (9, N'Gigabyte')
GO
INSERT [dbo].[MARCAS] ([IdMar], [NomMar]) VALUES (10, N'Supermicro')
GO
INSERT [dbo].[MARCAS] ([IdMar], [NomMar]) VALUES (11, N'Tyan')
GO
INSERT [dbo].[MARCAS] ([IdMar], [NomMar]) VALUES (12, N'Razer')
GO
INSERT [dbo].[MARCAS] ([IdMar], [NomMar]) VALUES (13, N'Corsair')
GO
INSERT [dbo].[MARCAS] ([IdMar], [NomMar]) VALUES (14, N'Logitech')
GO
SET IDENTITY_INSERT [dbo].[MARCAS] OFF
GO
INSERT [dbo].[PRODUCTOS] ([IdPro], [NomPro], [DesPro], [PrePro], [StoPro], [IdCat], [IdMar], [EstPro], [FecAdqPro], [ImaPro]) VALUES (1, N'Mouse Inalámbrico Logitech M185', N'Diseño ergonómico, color amarillo, conexión USB nano receptor', CAST(4500.00 AS Decimal(10, 2)), 1, 1, 1, 1, CAST(N'2025-06-24' AS Date), N'images/mouse.jpg')
GO
INSERT [dbo].[PRODUCTOS] ([IdPro], [NomPro], [DesPro], [PrePro], [StoPro], [IdCat], [IdMar], [EstPro], [FecAdqPro], [ImaPro]) VALUES (2, N'Teclado Mecánico Redragon Kumara K552', N'Retroiluminado, switches blue, color negro, con cable USB', CAST(1300.00 AS Decimal(10, 2)), 1, 1, 2, 1, CAST(N'2025-06-24' AS Date), N'images/teclado.jpeg')
GO
INSERT [dbo].[PRODUCTOS] ([IdPro], [NomPro], [DesPro], [PrePro], [StoPro], [IdCat], [IdMar], [EstPro], [FecAdqPro], [ImaPro]) VALUES (3, N'Servidor Dell PowerEdge T40', N'Torre, Intel Xeon E-2224G, 8GB RAM, 1TB HDD, reacondicionado', CAST(20000.00 AS Decimal(10, 2)), 2, 3, 11, 1, CAST(N'2025-06-27' AS Date), N'images/Servidor Dell PowerEdge T40.jpg')
GO
INSERT [dbo].[PRODUCTOS] ([IdPro], [NomPro], [DesPro], [PrePro], [StoPro], [IdCat], [IdMar], [EstPro], [FecAdqPro], [ImaPro]) VALUES (4, N'Monitor LG UltraGear 24GN600-B', N'24 pulgadas, 144Hz, 1ms, panel IPS, ideal para gaming', CAST(4200.00 AS Decimal(10, 2)), 4, 7, 2, 1, CAST(N'2025-06-27' AS Date), N'images/Monitor LG UltraGear 24GN600-B.jpg')
GO
INSERT [dbo].[PRODUCTOS] ([IdPro], [NomPro], [DesPro], [PrePro], [StoPro], [IdCat], [IdMar], [EstPro], [FecAdqPro], [ImaPro]) VALUES (5, N'PC de Escritorio HP EliteDesk 800 G6', N'Core i5, 16GB RAM, 512GB SSD, Windows 11 Pro, torre grande', CAST(35000.00 AS Decimal(10, 2)), 8, 1, 3, 1, CAST(N'2025-06-27' AS Date), N'images/PC de Escritorio HP EliteDesk 800 G6.png')
GO
INSERT [dbo].[PRODUCTOS] ([IdPro], [NomPro], [DesPro], [PrePro], [StoPro], [IdCat], [IdMar], [EstPro], [FecAdqPro], [ImaPro]) VALUES (6, N'Laptop HP Pavilion', N'15 pulgadas, Ryzen 5', CAST(25000.00 AS Decimal(10, 2)), 5, 2, 2, 1, CAST(N'2025-06-27' AS Date), N'images/Laptop HP Pavilion.jpg')
GO
INSERT [dbo].[PRODUCTOS] ([IdPro], [NomPro], [DesPro], [PrePro], [StoPro], [IdCat], [IdMar], [EstPro], [FecAdqPro], [ImaPro]) VALUES (7, N'Tablet Samsung', N'Galaxy Tab A8', CAST(9000.00 AS Decimal(10, 2)), 10, 5, 2, 1, CAST(N'2025-06-27' AS Date), N'images/Tablet Samsung.jpg')
GO
INSERT [dbo].[PRODUCTOS] ([IdPro], [NomPro], [DesPro], [PrePro], [StoPro], [IdCat], [IdMar], [EstPro], [FecAdqPro], [ImaPro]) VALUES (8, N'Auriculares Logitech', N'Gaming G733 RGB', CAST(3200.00 AS Decimal(10, 2)), 8, 9, 14, 1, CAST(N'2025-06-27' AS Date), N'images/Auriculares Logitech.jpg')
GO
INSERT [dbo].[PRODUCTOS] ([IdPro], [NomPro], [DesPro], [PrePro], [StoPro], [IdCat], [IdMar], [EstPro], [FecAdqPro], [ImaPro]) VALUES (9, N'Tarjeta Madre', N'Z790 Gaming X', CAST(4800.00 AS Decimal(10, 2)), 6, 8, 9, 1, CAST(N'2025-06-27' AS Date), N'images/Tarjeta Madre.jpg')
GO
INSERT [dbo].[PRODUCTOS] ([IdPro], [NomPro], [DesPro], [PrePro], [StoPro], [IdCat], [IdMar], [EstPro], [FecAdqPro], [ImaPro]) VALUES (10, N'Memoria RAM', N'DDR4 16GB Corsair', CAST(2100.00 AS Decimal(10, 2)), 12, 8, 13, 1, CAST(N'2025-06-27' AS Date), N'images/Memoria RAM.jpg')
GO
INSERT [dbo].[PRODUCTOS] ([IdPro], [NomPro], [DesPro], [PrePro], [StoPro], [IdCat], [IdMar], [EstPro], [FecAdqPro], [ImaPro]) VALUES (11, N'Disco SSD', N'1TB NVMe Gen4', CAST(3800.00 AS Decimal(10, 2)), 10, 8, 2, 1, CAST(N'2025-06-27' AS Date), N'images/Disco SSD.jpg')
GO
INSERT [dbo].[PRODUCTOS] ([IdPro], [NomPro], [DesPro], [PrePro], [StoPro], [IdCat], [IdMar], [EstPro], [FecAdqPro], [ImaPro]) VALUES (12, N'Fuente Poder', N'750W 80+ Bronze', CAST(2600.00 AS Decimal(10, 2)), 7, 8, 7, 1, CAST(N'2025-06-27' AS Date), N'images/Fuente Poder.jpg')
GO
INSERT [dbo].[PRODUCTOS] ([IdPro], [NomPro], [DesPro], [PrePro], [StoPro], [IdCat], [IdMar], [EstPro], [FecAdqPro], [ImaPro]) VALUES (13, N'Gabinete Gamer', N'Con luces RGB', CAST(3400.00 AS Decimal(10, 2)), 5, 9, 7, 1, CAST(N'2025-06-27' AS Date), N'images/Gabinete Gamer.jpg')
GO
INSERT [dbo].[PRODUCTOS] ([IdPro], [NomPro], [DesPro], [PrePro], [StoPro], [IdCat], [IdMar], [EstPro], [FecAdqPro], [ImaPro]) VALUES (14, N'Teclado Mecánico', N'Retroiluminado Razer', CAST(4200.00 AS Decimal(10, 2)), 6, 7, 12, 1, CAST(N'2025-06-27' AS Date), N'images/Teclado Mecánico.jpg')
GO
INSERT [dbo].[PRODUCTOS] ([IdPro], [NomPro], [DesPro], [PrePro], [StoPro], [IdCat], [IdMar], [EstPro], [FecAdqPro], [ImaPro]) VALUES (15, N'Mouse Gamer', N'Logitech G Pro', CAST(3700.00 AS Decimal(10, 2)), 8, 9, 14, 1, CAST(N'2025-06-27' AS Date), N'images/Mouse Gamer.jpg')
GO
INSERT [dbo].[PRODUCTOS] ([IdPro], [NomPro], [DesPro], [PrePro], [StoPro], [IdCat], [IdMar], [EstPro], [FecAdqPro], [ImaPro]) VALUES (16, N'Monitor Curvo', N'27 pulgadas, 144Hz', CAST(7600.00 AS Decimal(10, 2)), 3, 7, 2, 1, CAST(N'2025-06-27' AS Date), N'images/Monitor Curvo.jpg')
GO
INSERT [dbo].[PRODUCTOS] ([IdPro], [NomPro], [DesPro], [PrePro], [StoPro], [IdCat], [IdMar], [EstPro], [FecAdqPro], [ImaPro]) VALUES (17, N'Mini PC', N'Intel NUC 11', CAST(18000.00 AS Decimal(10, 2)), 3, 1, 1, 1, CAST(N'2025-06-27' AS Date), N'images/Mini PC.jpg')
GO
INSERT [dbo].[PRODUCTOS] ([IdPro], [NomPro], [DesPro], [PrePro], [StoPro], [IdCat], [IdMar], [EstPro], [FecAdqPro], [ImaPro]) VALUES (18, N'Smartphone Asus', N'ROG Phone 6', CAST(32000.00 AS Decimal(10, 2)), 4, 6, 6, 1, CAST(N'2025-06-27' AS Date), N'images/Smartphone Asus.jpg')
GO
INSERT [dbo].[PRODUCTOS] ([IdPro], [NomPro], [DesPro], [PrePro], [StoPro], [IdCat], [IdMar], [EstPro], [FecAdqPro], [ImaPro]) VALUES (19, N'Webcam HD', N'Logitech C920', CAST(2800.00 AS Decimal(10, 2)), 4, 7, 14, 1, CAST(N'2025-06-27' AS Date), N'images/Webcam HD.jpg')
GO
INSERT [dbo].[PRODUCTOS] ([IdPro], [NomPro], [DesPro], [PrePro], [StoPro], [IdCat], [IdMar], [EstPro], [FecAdqPro], [ImaPro]) VALUES (20, N'Router Gaming', N'ASUS RT-AX82U', CAST(8900.00 AS Decimal(10, 2)), 3, 9, 6, 1, CAST(N'2025-06-27' AS Date), N'images/Router Gaming.jpg')
GO
INSERT [dbo].[PRODUCTOS] ([IdPro], [NomPro], [DesPro], [PrePro], [StoPro], [IdCat], [IdMar], [EstPro], [FecAdqPro], [ImaPro]) VALUES (21, N'Laptop Gamer', N'Dell Alienware RTX 4060', CAST(48500.00 AS Decimal(10, 2)), 4, 9, 1, 1, CAST(N'2025-06-27' AS Date), N'images/Laptop Gamer.jpg')
GO
INSERT [dbo].[PRODUCTOS] ([IdPro], [NomPro], [DesPro], [PrePro], [StoPro], [IdCat], [IdMar], [EstPro], [FecAdqPro], [ImaPro]) VALUES (22, N'All-in-One HP', N'Core i5, 8GB RAM', CAST(20000.00 AS Decimal(10, 2)), 4, 4, 2, 1, CAST(N'2025-06-27' AS Date), N'images/All-in-One HP.jpg')
GO
INSERT [dbo].[PRODUCTOS] ([IdPro], [NomPro], [DesPro], [PrePro], [StoPro], [IdCat], [IdMar], [EstPro], [FecAdqPro], [ImaPro]) VALUES (23, N'Estación Dock', N'USB-C para portátiles', CAST(3000.00 AS Decimal(10, 2)), 4, 7, 14, 1, CAST(N'2025-06-27' AS Date), N'images/Estación Dock.jpg')
GO
INSERT [dbo].[PRODUCTOS] ([IdPro], [NomPro], [DesPro], [PrePro], [StoPro], [IdCat], [IdMar], [EstPro], [FecAdqPro], [ImaPro]) VALUES (24, N'Proyector', N'4K portátil BenQ', CAST(22000.00 AS Decimal(10, 2)), 2, 8, 7, 1, CAST(N'2025-06-27' AS Date), N'images/Proyector.jpg')
GO
INSERT [dbo].[PRODUCTOS] ([IdPro], [NomPro], [DesPro], [PrePro], [StoPro], [IdCat], [IdMar], [EstPro], [FecAdqPro], [ImaPro]) VALUES (25, N'Laptop Apple M1', N'Macbook Air 13', CAST(46000.00 AS Decimal(10, 2)), 5, 2, 3, 1, CAST(N'2025-06-27' AS Date), N'images/Laptop Apple M1.jpg')
GO
INSERT [dbo].[PRODUCTOS] ([IdPro], [NomPro], [DesPro], [PrePro], [StoPro], [IdCat], [IdMar], [EstPro], [FecAdqPro], [ImaPro]) VALUES (26, N'Cámara Seguridad', N'D-Link 360 Wi-Fi', CAST(6800.00 AS Decimal(10, 2)), 4, 8, 8, 1, CAST(N'2025-06-27' AS Date), N'images/Cámara Seguridad.jpg')
GO
INSERT [dbo].[PRODUCTOS] ([IdPro], [NomPro], [DesPro], [PrePro], [StoPro], [IdCat], [IdMar], [EstPro], [FecAdqPro], [ImaPro]) VALUES (27, N'Switch Red', N'8 puertos Gigabit', CAST(4100.00 AS Decimal(10, 2)), 3, 8, 9, 1, CAST(N'2025-06-27' AS Date), N'images/Switch Red.png')
GO
INSERT [dbo].[PRODUCTOS] ([IdPro], [NomPro], [DesPro], [PrePro], [StoPro], [IdCat], [IdMar], [EstPro], [FecAdqPro], [ImaPro]) VALUES (28, N'Repetidor Wi-Fi', N'TP-Link AX1500', CAST(2300.00 AS Decimal(10, 2)), 10, 8, 9, 1, CAST(N'2025-06-27' AS Date), N'images/Repetidor Wi-Fi.jpg')
GO
INSERT [dbo].[PRODUCTOS] ([IdPro], [NomPro], [DesPro], [PrePro], [StoPro], [IdCat], [IdMar], [EstPro], [FecAdqPro], [ImaPro]) VALUES (29, N'Tablet Apple', N'iPad 9na generación', CAST(17000.00 AS Decimal(10, 2)), 4, 5, 3, 1, CAST(N'2025-06-27' AS Date), N'images/Tablet Apple.jpg')
GO
INSERT [dbo].[PRODUCTOS] ([IdPro], [NomPro], [DesPro], [PrePro], [StoPro], [IdCat], [IdMar], [EstPro], [FecAdqPro], [ImaPro]) VALUES (30, N'Laptop Asus ZenBook', N'i7, 16GB, OLED', CAST(33000.00 AS Decimal(10, 2)), 3, 2, 6, 1, CAST(N'2025-06-27' AS Date), N'images/Laptop Asus ZenBook.jpg')
GO
INSERT [dbo].[PRODUCTOS] ([IdPro], [NomPro], [DesPro], [PrePro], [StoPro], [IdCat], [IdMar], [EstPro], [FecAdqPro], [ImaPro]) VALUES (31, N'Router Gamer 640', N'Router Gamer 640 de la marca Lenovo, alta velocidad', CAST(36046.44 AS Decimal(10, 2)), 41, 6, 4, 1, CAST(N'2025-06-27' AS Date), N'images/Router Gamer 640.jpg')
GO
INSERT [dbo].[PRODUCTOS] ([IdPro], [NomPro], [DesPro], [PrePro], [StoPro], [IdCat], [IdMar], [EstPro], [FecAdqPro], [ImaPro]) VALUES (32, N'Smartphone Plus 544', N'Smartphone Plus 544 de la marca Supermicro, pantalla Full HD', CAST(28346.01 AS Decimal(10, 2)), 50, 3, 10, 1, CAST(N'2025-06-27' AS Date), N'images/Smartphone Plus 544.jpg')
GO
INSERT [dbo].[PRODUCTOS] ([IdPro], [NomPro], [DesPro], [PrePro], [StoPro], [IdCat], [IdMar], [EstPro], [FecAdqPro], [ImaPro]) VALUES (33, N'All-in-One Gamer 354', N'All-in-One Gamer 354 de la marca MSI, conectividad Wi-Fi', CAST(47739.59 AS Decimal(10, 2)), 34, 6, 7, 1, CAST(N'2025-06-27' AS Date), N'images/All-in-One Gamer 354.jpg')
GO
INSERT [dbo].[PRODUCTOS] ([IdPro], [NomPro], [DesPro], [PrePro], [StoPro], [IdCat], [IdMar], [EstPro], [FecAdqPro], [ImaPro]) VALUES (34, N'Repetidor Wi-Fi RGB 224', N'Repetidor Wi-Fi RGB 224 de la marca Tyan, pantalla Full HD', CAST(44448.97 AS Decimal(10, 2)), 28, 5, 11, 1, CAST(N'2025-06-27' AS Date), N'images/Repetidor Wi-Fi RGB 224.jpg')
GO
INSERT [dbo].[PRODUCTOS] ([IdPro], [NomPro], [DesPro], [PrePro], [StoPro], [IdCat], [IdMar], [EstPro], [FecAdqPro], [ImaPro]) VALUES (35, N'All-in-One Compacto 566', N'All-in-One Compacto 566 de la marca Supermicro, bajo consumo', CAST(53958.29 AS Decimal(10, 2)), 8, 5, 10, 1, CAST(N'2025-06-27' AS Date), N'images/All-in-One Compacto 566.jpg')
GO
INSERT [dbo].[PRODUCTOS] ([IdPro], [NomPro], [DesPro], [PrePro], [StoPro], [IdCat], [IdMar], [EstPro], [FecAdqPro], [ImaPro]) VALUES (36, N'Webcam RGB 692', N'Webcam RGB 692 de la marca Apple, ideal para oficina', CAST(49425.18 AS Decimal(10, 2)), 46, 9, 3, 1, CAST(N'2025-06-27' AS Date), N'images/Webcam RGB 692.jpg')
GO
INSERT [dbo].[PRODUCTOS] ([IdPro], [NomPro], [DesPro], [PrePro], [StoPro], [IdCat], [IdMar], [EstPro], [FecAdqPro], [ImaPro]) VALUES (37, N'Router Compacto 495', N'Router Compacto 495 de la marca Gigabyte, ideal para oficina', CAST(27166.88 AS Decimal(10, 2)), 32, 4, 9, 1, CAST(N'2025-06-27' AS Date), N'images/Router Compacto 495 de la marca Gigabyte.jpg')
GO
INSERT [dbo].[PRODUCTOS] ([IdPro], [NomPro], [DesPro], [PrePro], [StoPro], [IdCat], [IdMar], [EstPro], [FecAdqPro], [ImaPro]) VALUES (38, N'Monitor Ultra 597', N'Monitor Ultra 597 de la marca Supermicro, conectividad Wi-Fi', CAST(4617.67 AS Decimal(10, 2)), 23, 8, 10, 1, CAST(N'2025-06-27' AS Date), N'images/Monitor Ultra 597 de la marca Supermicro.jpg')
GO
INSERT [dbo].[PRODUCTOS] ([IdPro], [NomPro], [DesPro], [PrePro], [StoPro], [IdCat], [IdMar], [EstPro], [FecAdqPro], [ImaPro]) VALUES (39, N'Mouse Slim 424', N'Mouse Slim 424 de la marca Gigabyte, diseño moderno', CAST(40656.43 AS Decimal(10, 2)), 5, 1, 9, 1, CAST(N'2025-06-27' AS Date), N'images/Mouse Slim 424 de la marca Gigabyte.jpg')
GO
INSERT [dbo].[PRODUCTOS] ([IdPro], [NomPro], [DesPro], [PrePro], [StoPro], [IdCat], [IdMar], [EstPro], [FecAdqPro], [ImaPro]) VALUES (40, N'Mouse 2025 116', N'Mouse 2025 116 de la marca HP, bajo consumo', CAST(24173.37 AS Decimal(10, 2)), 6, 9, 2, 1, CAST(N'2025-06-27' AS Date), N'images/Mouse 2025 116 de la marca HP.jpg')
GO
INSERT [dbo].[PRODUCTOS] ([IdPro], [NomPro], [DesPro], [PrePro], [StoPro], [IdCat], [IdMar], [EstPro], [FecAdqPro], [ImaPro]) VALUES (41, N'Estación Dock Compacto 383', N'Estación Dock Compacto 383 de la marca Dell, bajo consumo', CAST(58204.00 AS Decimal(10, 2)), 41, 5, 1, 1, CAST(N'2025-06-27' AS Date), N'images/Estación Dock Compacto 383 de la marca Dell.jpg')
GO
INSERT [dbo].[PRODUCTOS] ([IdPro], [NomPro], [DesPro], [PrePro], [StoPro], [IdCat], [IdMar], [EstPro], [FecAdqPro], [ImaPro]) VALUES (42, N'Auriculares RGB 855', N'Auriculares RGB 855 de la marca Apple, conectividad Wi-Fi', CAST(54570.18 AS Decimal(10, 2)), 27, 7, 3, 1, CAST(N'2025-06-27' AS Date), N'images/Auriculares RGB 855 de la marca Apple.jpg')
GO
INSERT [dbo].[PRODUCTOS] ([IdPro], [NomPro], [DesPro], [PrePro], [StoPro], [IdCat], [IdMar], [EstPro], [FecAdqPro], [ImaPro]) VALUES (43, N'Gabinete RGB 723', N'Gabinete RGB 723 de la marca Dell, uso rudo', CAST(48904.70 AS Decimal(10, 2)), 7, 4, 1, 1, CAST(N'2025-06-27' AS Date), N'images/Gabinete RGB 723 de la marca Dell.jpg')
GO
INSERT [dbo].[PRODUCTOS] ([IdPro], [NomPro], [DesPro], [PrePro], [StoPro], [IdCat], [IdMar], [EstPro], [FecAdqPro], [ImaPro]) VALUES (44, N'SSD Plus 412', N'SSD Plus 412 de la marca Acer, diseño moderno', CAST(53855.49 AS Decimal(10, 2)), 10, 8, 5, 1, CAST(N'2025-06-27' AS Date), N'images/SSD Plus 412 de la marca Acer.jpg')
GO
INSERT [dbo].[PRODUCTOS] ([IdPro], [NomPro], [DesPro], [PrePro], [StoPro], [IdCat], [IdMar], [EstPro], [FecAdqPro], [ImaPro]) VALUES (45, N'All-in-One Compacto 875', N'All-in-One Compacto 875 de la marca HP, conectividad Wi-Fi', CAST(4687.80 AS Decimal(10, 2)), 18, 9, 2, 1, CAST(N'2025-06-27' AS Date), N'images/All-in-One Compacto 875 de la marca HP.jpg')
GO
INSERT [dbo].[PRODUCTOS] ([IdPro], [NomPro], [DesPro], [PrePro], [StoPro], [IdCat], [IdMar], [EstPro], [FecAdqPro], [ImaPro]) VALUES (46, N'Smartphone Deluxe 533', N'Smartphone Deluxe 533 de la marca Supermicro, procesador potente', CAST(6413.11 AS Decimal(10, 2)), 15, 3, 10, 1, CAST(N'2025-06-27' AS Date), N'images/Smartphone Deluxe 533 de la marca Supermicro.jpg')
GO
INSERT [dbo].[PRODUCTOS] ([IdPro], [NomPro], [DesPro], [PrePro], [StoPro], [IdCat], [IdMar], [EstPro], [FecAdqPro], [ImaPro]) VALUES (47, N'Laptop RGB 416', N'Laptop RGB 416 de la marca Razer, alta velocidad', CAST(57656.96 AS Decimal(10, 2)), 44, 4, 12, 1, CAST(N'2025-06-27' AS Date), N'images/Laptop RGB 416 de la marca Razer.jpg')
GO
INSERT [dbo].[PRODUCTOS] ([IdPro], [NomPro], [DesPro], [PrePro], [StoPro], [IdCat], [IdMar], [EstPro], [FecAdqPro], [ImaPro]) VALUES (48, N'Cámara 2025 825', N'Cámara 2025 825 de la marca Asus, procesador potente', CAST(57477.02 AS Decimal(10, 2)), 29, 4, 6, 1, CAST(N'2025-06-27' AS Date), N'images/Cámara 2025 825 de la marca Asus.jpg')
GO
INSERT [dbo].[PRODUCTOS] ([IdPro], [NomPro], [DesPro], [PrePro], [StoPro], [IdCat], [IdMar], [EstPro], [FecAdqPro], [ImaPro]) VALUES (49, N'Laptop 2025 381', N'Laptop 2025 381 de la marca Supermicro, conectividad Wi-Fi', CAST(25890.16 AS Decimal(10, 2)), 2, 6, 10, 1, CAST(N'2025-06-27' AS Date), N'images/Laptop 2025 381 de la marca Supermicro.jpg')
GO
INSERT [dbo].[PRODUCTOS] ([IdPro], [NomPro], [DesPro], [PrePro], [StoPro], [IdCat], [IdMar], [EstPro], [FecAdqPro], [ImaPro]) VALUES (50, N'Gabinete Compacto 205', N'Gabinete Compacto 205 de la marca Corsair, alta velocidad', CAST(26663.98 AS Decimal(10, 2)), 46, 3, 13, 1, CAST(N'2025-06-27' AS Date), N'images/Gabinete Compacto 205 de la marca Corsair.jpg')
GO
INSERT [dbo].[PRODUCTOS] ([IdPro], [NomPro], [DesPro], [PrePro], [StoPro], [IdCat], [IdMar], [EstPro], [FecAdqPro], [ImaPro]) VALUES (51, N'Laptop Pro 745', N'Laptop Pro 745 de la marca Lenovo, ideal para oficina', CAST(28500.00 AS Decimal(10, 2)), 15, 2, 4, 1, CAST(N'2025-06-27' AS Date), N'images/Laptop Pro 745 de la marca Lenovo.jpg')
GO
INSERT [dbo].[PRODUCTOS] ([IdPro], [NomPro], [DesPro], [PrePro], [StoPro], [IdCat], [IdMar], [EstPro], [FecAdqPro], [ImaPro]) VALUES (52, N'Mouse Gamer RGB 330', N'Mouse Gamer RGB 330 de la marca Razer, uso rudo', CAST(1750.00 AS Decimal(10, 2)), 30, 7, 12, 1, CAST(N'2025-06-27' AS Date), N'images/Mouse Gamer RGB 330 de la marca Razer.jpg')
GO
INSERT [dbo].[PRODUCTOS] ([IdPro], [NomPro], [DesPro], [PrePro], [StoPro], [IdCat], [IdMar], [EstPro], [FecAdqPro], [ImaPro]) VALUES (53, N'Tablet X 102', N'Tablet X 102 de la marca Apple, pantalla Full HD', CAST(16000.00 AS Decimal(10, 2)), 18, 5, 3, 1, CAST(N'2025-06-27' AS Date), N'images/Tablet X 102 de la marca Apple.jpg')
GO
INSERT [dbo].[PRODUCTOS] ([IdPro], [NomPro], [DesPro], [PrePro], [StoPro], [IdCat], [IdMar], [EstPro], [FecAdqPro], [ImaPro]) VALUES (54, N'Auriculares Pro 770', N'Auriculares Pro 770 de la marca Logitech, conectividad Wi-Fi', CAST(3200.00 AS Decimal(10, 2)), 12, 7, 14, 1, CAST(N'2025-06-27' AS Date), N'images/Auriculares Pro 770 de la marca Logitech.jpg')
GO
INSERT [dbo].[PRODUCTOS] ([IdPro], [NomPro], [DesPro], [PrePro], [StoPro], [IdCat], [IdMar], [EstPro], [FecAdqPro], [ImaPro]) VALUES (55, N'Servidor Compacto 950', N'Servidor Compacto 950 de la marca Tyan, bajo consumo', CAST(42000.00 AS Decimal(10, 2)), 4, 3, 11, 1, CAST(N'2025-06-27' AS Date), N'images/Servidor Compacto 950 de la marca Tyan.jpg')
GO
INSERT [dbo].[PRODUCTOS] ([IdPro], [NomPro], [DesPro], [PrePro], [StoPro], [IdCat], [IdMar], [EstPro], [FecAdqPro], [ImaPro]) VALUES (56, N'Monitor Gamer 165Hz 27"', N'Monitor Gamer 165Hz 27" de la marca Asus, alta velocidad', CAST(7200.00 AS Decimal(10, 2)), 9, 7, 6, 1, CAST(N'2025-06-27' AS Date), N'images/Monitor Gamer 165Hz  de la marca Asus.jpg')
GO
INSERT [dbo].[PRODUCTOS] ([IdPro], [NomPro], [DesPro], [PrePro], [StoPro], [IdCat], [IdMar], [EstPro], [FecAdqPro], [ImaPro]) VALUES (57, N'Impresora Wi-Fi 301', N'Impresora Wi-Fi 301 de la marca HP, ideal para oficina', CAST(5500.00 AS Decimal(10, 2)), 5, 8, 2, 1, CAST(N'2025-06-27' AS Date), N'images/Impresora Wi-Fi 301 de la marca HP.jpg')
GO
INSERT [dbo].[PRODUCTOS] ([IdPro], [NomPro], [DesPro], [PrePro], [StoPro], [IdCat], [IdMar], [EstPro], [FecAdqPro], [ImaPro]) VALUES (58, N'Gabinete ATX RGB 770', N'Gabinete ATX RGB 770 de la marca Corsair, diseño moderno', CAST(3700.00 AS Decimal(10, 2)), 8, 8, 13, 1, CAST(N'2025-06-27' AS Date), N'images/Gabinete ATX RGB 770 de la marca Corsair.jpg')
GO
INSERT [dbo].[PRODUCTOS] ([IdPro], [NomPro], [DesPro], [PrePro], [StoPro], [IdCat], [IdMar], [EstPro], [FecAdqPro], [ImaPro]) VALUES (59, N'Smartphone Pro 5G 420', N'Smartphone Pro 5G 420 de la marca Asus, conectividad Wi-Fi', CAST(24500.00 AS Decimal(10, 2)), 20, 6, 6, 1, CAST(N'2025-06-27' AS Date), N'images/Smartphone Pro 5G 420 de la marca Asus.jpg')
GO
INSERT [dbo].[PRODUCTOS] ([IdPro], [NomPro], [DesPro], [PrePro], [StoPro], [IdCat], [IdMar], [EstPro], [FecAdqPro], [ImaPro]) VALUES (60, N'Laptop Gamer RTX 4060', N'Laptop Gamer RTX 4060 de la marca Dell, procesador potente', CAST(48500.00 AS Decimal(10, 2)), 10, 9, 1, 1, CAST(N'2025-06-27' AS Date), N'images/Laptop Gamer RTX 4060 de la marca Dell.jpg')
GO
INSERT [dbo].[PRODUCTOS] ([IdPro], [NomPro], [DesPro], [PrePro], [StoPro], [IdCat], [IdMar], [EstPro], [FecAdqPro], [ImaPro]) VALUES (61, N'Mini PC Ultra 110', N'Mini PC Ultra 110 de la marca HP, diseño compacto', CAST(18500.00 AS Decimal(10, 2)), 7, 3, 2, 1, CAST(N'2025-06-27' AS Date), N'images/Mini PC Ultra 110 de la marca HP.jpg')
GO
INSERT [dbo].[PRODUCTOS] ([IdPro], [NomPro], [DesPro], [PrePro], [StoPro], [IdCat], [IdMar], [EstPro], [FecAdqPro], [ImaPro]) VALUES (62, N'Fuente de Poder 650W', N'Fuente de Poder 650W de la marca Gigabyte, alta eficiencia', CAST(2600.00 AS Decimal(10, 2)), 14, 8, 9, 1, CAST(N'2025-06-27' AS Date), N'images/Fuente de Poder 650W de la marca Gigabyte.jpg')
GO
INSERT [dbo].[PRODUCTOS] ([IdPro], [NomPro], [DesPro], [PrePro], [StoPro], [IdCat], [IdMar], [EstPro], [FecAdqPro], [ImaPro]) VALUES (63, N'Tarjeta Madre Z590', N'Tarjeta Madre Z590 de la marca MSI, compatibilidad Intel 10/11gen', CAST(4800.00 AS Decimal(10, 2)), 6, 8, 7, 1, CAST(N'2025-06-27' AS Date), N'images/Tarjeta Madre Z590 de la marca MSI.jpg')
GO
INSERT [dbo].[PRODUCTOS] ([IdPro], [NomPro], [DesPro], [PrePro], [StoPro], [IdCat], [IdMar], [EstPro], [FecAdqPro], [ImaPro]) VALUES (64, N'RAM DDR4 16GB 3200MHz', N'RAM DDR4 16GB 3200MHz de la marca Corsair, uso rudo', CAST(1900.00 AS Decimal(10, 2)), 25, 8, 13, 1, CAST(N'2025-06-27' AS Date), N'images/RAM DDR4 16GB 3200MHz de la marca Corsair.jpg')
GO
INSERT [dbo].[PRODUCTOS] ([IdPro], [NomPro], [DesPro], [PrePro], [StoPro], [IdCat], [IdMar], [EstPro], [FecAdqPro], [ImaPro]) VALUES (65, N'Disco SSD NVMe 1TB', N'Disco SSD NVMe 1TB de la marca Samsung, lectura ultra rápida', CAST(3500.00 AS Decimal(10, 2)), 18, 8, 8, 1, CAST(N'2025-06-27' AS Date), N'images/Disco SSD NVMe 1TB de la marca Samsung.jpg')
GO
INSERT [dbo].[PRODUCTOS] ([IdPro], [NomPro], [DesPro], [PrePro], [StoPro], [IdCat], [IdMar], [EstPro], [FecAdqPro], [ImaPro]) VALUES (66, N'Switch 8 Puertos Gigabit', N'Switch 8 Puertos Gigabit de la marca TP-Link, ideal para redes domésticas', CAST(2100.00 AS Decimal(10, 2)), 16, 8, 9, 1, CAST(N'2025-06-27' AS Date), N'images/Switch 8 Puertos Gigabit de la marca TP-Link.jpg')
GO
INSERT [dbo].[PRODUCTOS] ([IdPro], [NomPro], [DesPro], [PrePro], [StoPro], [IdCat], [IdMar], [EstPro], [FecAdqPro], [ImaPro]) VALUES (67, N'Repetidor Wi-Fi AX1500', N'Repetidor Wi-Fi AX1500 de la marca Asus, amplia cobertura', CAST(2500.00 AS Decimal(10, 2)), 11, 8, 6, 1, CAST(N'2025-06-27' AS Date), N'images/Repetidor Wi-Fi AX1500 de la marca Asus.jpg')
GO
INSERT [dbo].[PRODUCTOS] ([IdPro], [NomPro], [DesPro], [PrePro], [StoPro], [IdCat], [IdMar], [EstPro], [FecAdqPro], [ImaPro]) VALUES (68, N'Cámara IP 360° HD', N'Cámara IP 360° HD de la marca D-Link, visión nocturna', CAST(4600.00 AS Decimal(10, 2)), 8, 8, 8, 1, CAST(N'2025-06-27' AS Date), N'images/Cámara IP 360° HD de la marca D-Link.jpg')
GO
INSERT [dbo].[PRODUCTOS] ([IdPro], [NomPro], [DesPro], [PrePro], [StoPro], [IdCat], [IdMar], [EstPro], [FecAdqPro], [ImaPro]) VALUES (69, N'Proyector Full HD 4000Lm', N'Proyector Full HD 4000Lm de la marca Acer, ideal para oficinas', CAST(24000.00 AS Decimal(10, 2)), 3, 8, 5, 1, CAST(N'2025-06-27' AS Date), N'images/Proyector Full HD 4000Lm de la marca Acer.jpg')
GO
INSERT [dbo].[PRODUCTOS] ([IdPro], [NomPro], [DesPro], [PrePro], [StoPro], [IdCat], [IdMar], [EstPro], [FecAdqPro], [ImaPro]) VALUES (70, N'All-in-One HP 23.8"', N'All-in-One HP 23.8" de la marca HP, Core i5, 8GB RAM', CAST(21000.00 AS Decimal(10, 2)), 4, 4, 2, 1, CAST(N'2025-06-27' AS Date), N'images/All-in-One HP 23.8 de la marca HP, Core i5.jpg')
GO
INSERT [dbo].[PRODUCTOS] ([IdPro], [NomPro], [DesPro], [PrePro], [StoPro], [IdCat], [IdMar], [EstPro], [FecAdqPro], [ImaPro]) VALUES (71, N'Teclado Mecánico RGB 500', N'Teclado Mecánico RGB 500 de la marca Redragon, switches blue', CAST(2200.00 AS Decimal(10, 2)), 10, 7, 13, 1, CAST(N'2025-06-27' AS Date), N'images/Teclado Mecánico RGB 500 de la marca Redragon.jpg')
GO
INSERT [dbo].[PRODUCTOS] ([IdPro], [NomPro], [DesPro], [PrePro], [StoPro], [IdCat], [IdMar], [EstPro], [FecAdqPro], [ImaPro]) VALUES (72, N'Webcam Full HD 1080p', N'Webcam Full HD 1080p de la marca Logitech, micrófono integrado', CAST(1700.00 AS Decimal(10, 2)), 6, 7, 14, 1, CAST(N'2025-06-27' AS Date), N'images/Webcam Full HD 1080p de la marca Logitech.jpg')
GO
INSERT [dbo].[PRODUCTOS] ([IdPro], [NomPro], [DesPro], [PrePro], [StoPro], [IdCat], [IdMar], [EstPro], [FecAdqPro], [ImaPro]) VALUES (73, N'PC Gaming Ryzen 5 5600G', N'PC Gaming Ryzen 5 5600G de la marca MSI, 16GB RAM, SSD 512GB', CAST(39500.00 AS Decimal(10, 2)), 4, 1, 7, 1, CAST(N'2025-06-27' AS Date), N'images/PC Gaming Ryzen 5 5600G de la marca MSI, 16GB RAM.jpg')
GO
INSERT [dbo].[PRODUCTOS] ([IdPro], [NomPro], [DesPro], [PrePro], [StoPro], [IdCat], [IdMar], [EstPro], [FecAdqPro], [ImaPro]) VALUES (74, N'All-in-One Lenovo AIO 3', N'All-in-One Lenovo AIO 3, pantalla de 23.8", Ryzen 3, 8GB RAM', CAST(24800.00 AS Decimal(10, 2)), 5, 4, 4, 1, CAST(N'2025-06-27' AS Date), N'images/All-in-One Lenovo AIO 3.jpg')
GO
INSERT [dbo].[PRODUCTOS] ([IdPro], [NomPro], [DesPro], [PrePro], [StoPro], [IdCat], [IdMar], [EstPro], [FecAdqPro], [ImaPro]) VALUES (75, N'Tablet Samsung Galaxy Tab A8', N'Tablet Samsung Galaxy Tab A8, 64GB, Wi-Fi', CAST(8500.00 AS Decimal(10, 2)), 7, 5, 8, 1, CAST(N'2025-06-27' AS Date), N'images/Tablet Samsung Galaxy Tab A8.jpg')
GO
INSERT [dbo].[PRODUCTOS] ([IdPro], [NomPro], [DesPro], [PrePro], [StoPro], [IdCat], [IdMar], [EstPro], [FecAdqPro], [ImaPro]) VALUES (76, N'Router TP-Link Archer AX10', N'Router TP-Link Archer AX10, Wi-Fi 6, Dual Band', CAST(2800.00 AS Decimal(10, 2)), 9, 8, 9, 1, CAST(N'2025-06-27' AS Date), N'images/Router TP-Link Archer AX10.jpg')
GO
INSERT [dbo].[PRODUCTOS] ([IdPro], [NomPro], [DesPro], [PrePro], [StoPro], [IdCat], [IdMar], [EstPro], [FecAdqPro], [ImaPro]) VALUES (77, N'Smartphone Redmi Note 12', N'Smartphone Redmi Note 12, 128GB, 6GB RAM, cámara 50MP', CAST(6200.00 AS Decimal(10, 2)), 11, 6, 6, 1, CAST(N'2025-06-27' AS Date), N'images/Smartphone Redmi Note 12, 128GB, 6GB RAM.jpg')
GO
INSERT [dbo].[PRODUCTOS] ([IdPro], [NomPro], [DesPro], [PrePro], [StoPro], [IdCat], [IdMar], [EstPro], [FecAdqPro], [ImaPro]) VALUES (78, N'Impresora Multifuncional Epson L3250', N'Impresora Epson L3250, tinta continua, Wi-Fi', CAST(6450.00 AS Decimal(10, 2)), 3, 8, 9, 1, CAST(N'2025-06-27' AS Date), N'images/Impresora Epson L3250, tinta continua.jpg')
GO
INSERT [dbo].[PRODUCTOS] ([IdPro], [NomPro], [DesPro], [PrePro], [StoPro], [IdCat], [IdMar], [EstPro], [FecAdqPro], [ImaPro]) VALUES (79, N'Gabinete Gamer Mid-Tower RGB', N'Gabinete Gamer Mid-Tower RGB de la marca ASUS, con vidrio templado', CAST(4500.00 AS Decimal(10, 2)), 4, 8, 6, 1, CAST(N'2025-06-27' AS Date), N'images/Gabinete Gamer Mid-Tower RGB de la marca ASUS.jpg')
GO
INSERT [dbo].[PRODUCTOS] ([IdPro], [NomPro], [DesPro], [PrePro], [StoPro], [IdCat], [IdMar], [EstPro], [FecAdqPro], [ImaPro]) VALUES (80, N'Auriculares Bluetooth Sony WH-CH520', N'Auriculares Sony WH-CH520, batería de hasta 50h', CAST(3900.00 AS Decimal(10, 2)), 6, 7, 8, 1, CAST(N'2025-06-27' AS Date), N'images/Auriculares Sony WH-CH52.jpg')
GO
INSERT [dbo].[PRODUCTOS] ([IdPro], [NomPro], [DesPro], [PrePro], [StoPro], [IdCat], [IdMar], [EstPro], [FecAdqPro], [ImaPro]) VALUES (81, N'Monitor Dell 24" FHD', N'Monitor Dell de 24", panel IPS, 75Hz', CAST(5800.00 AS Decimal(10, 2)), 10, 7, 1, 1, CAST(N'2025-06-27' AS Date), N'images/Monitor Dell de 24.jpg')
GO
INSERT [dbo].[PRODUCTOS] ([IdPro], [NomPro], [DesPro], [PrePro], [StoPro], [IdCat], [IdMar], [EstPro], [FecAdqPro], [ImaPro]) VALUES (82, N'Laptop Acer Aspire 5', N'Laptop Acer Aspire 5, Intel Core i5, 8GB RAM, SSD 512GB', CAST(24500.00 AS Decimal(10, 2)), 4, 2, 5, 1, CAST(N'2025-06-27' AS Date), N'images/Laptop Acer Aspire 5.jpg')
GO
INSERT [dbo].[PRODUCTOS] ([IdPro], [NomPro], [DesPro], [PrePro], [StoPro], [IdCat], [IdMar], [EstPro], [FecAdqPro], [ImaPro]) VALUES (83, N'Disco HDD 2TB Seagate', N'Disco Duro HDD 2TB de la marca Seagate, 7200RPM', CAST(2200.00 AS Decimal(10, 2)), 14, 8, 9, 1, CAST(N'2025-06-27' AS Date), N'images/Disco Duro HDD 2TB.jpg')
GO
INSERT [dbo].[PRODUCTOS] ([IdPro], [NomPro], [DesPro], [PrePro], [StoPro], [IdCat], [IdMar], [EstPro], [FecAdqPro], [ImaPro]) VALUES (84, N'Fuente de Poder 750W 80+ Bronze', N'Fuente de Poder 750W Bronze de la marca EVGA, para gaming', CAST(3100.00 AS Decimal(10, 2)), 6, 8, 9, 1, CAST(N'2025-06-27' AS Date), N'images/Fuente de Poder 750W Bronze de la marca EVGA.jpg')
GO
INSERT [dbo].[PRODUCTOS] ([IdPro], [NomPro], [DesPro], [PrePro], [StoPro], [IdCat], [IdMar], [EstPro], [FecAdqPro], [ImaPro]) VALUES (85, N'Switch TP-Link 5 Puertos', N'Switch de red TP-Link, 5 puertos, 10/100/1000Mbps', CAST(1700.00 AS Decimal(10, 2)), 5, 8, 8, 1, CAST(N'2025-06-27' AS Date), N'images/Switch de red TP-Link.jpg')
GO
INSERT [dbo].[PRODUCTOS] ([IdPro], [NomPro], [DesPro], [PrePro], [StoPro], [IdCat], [IdMar], [EstPro], [FecAdqPro], [ImaPro]) VALUES (86, N'Tarjeta Madre ASUS TUF B550M', N'Tarjeta Madre ASUS TUF B550M, soporte Ryzen', CAST(5400.00 AS Decimal(10, 2)), 3, 8, 6, 1, CAST(N'2025-06-27' AS Date), N'images/Tarjeta Madre ASUS TUF B550M.jpg')
GO
INSERT [dbo].[PRODUCTOS] ([IdPro], [NomPro], [DesPro], [PrePro], [StoPro], [IdCat], [IdMar], [EstPro], [FecAdqPro], [ImaPro]) VALUES (87, N'Cámara Web Logitech C270', N'Cámara Logitech C270 HD 720p, micrófono incluido', CAST(2100.00 AS Decimal(10, 2)), 4, 7, 14, 1, CAST(N'2025-06-27' AS Date), N'images/Cámara Logitech C270 HD 720p.jpg')
GO
INSERT [dbo].[PRODUCTOS] ([IdPro], [NomPro], [DesPro], [PrePro], [StoPro], [IdCat], [IdMar], [EstPro], [FecAdqPro], [ImaPro]) VALUES (88, N'Mini PC Intel NUC 11', N'Mini PC Intel NUC 11, 8GB RAM, SSD 256GB, Windows 11', CAST(15900.00 AS Decimal(10, 2)), 3, 3, 1, 1, CAST(N'2025-06-27' AS Date), N'images/Mini PC Intel NUC 11, 8GB RAM, SSD 256GB.jpg')
GO
INSERT [dbo].[PRODUCTOS] ([IdPro], [NomPro], [DesPro], [PrePro], [StoPro], [IdCat], [IdMar], [EstPro], [FecAdqPro], [ImaPro]) VALUES (89, N'Proyector LED Full HD 5000Lm', N'Proyector LED Full HD, conexión HDMI/USB', CAST(29500.00 AS Decimal(10, 2)), 2, 8, 5, 1, CAST(N'2025-06-27' AS Date), N'images/Proyector LED Full HD.jpg')
GO
INSERT [dbo].[PRODUCTOS] ([IdPro], [NomPro], [DesPro], [PrePro], [StoPro], [IdCat], [IdMar], [EstPro], [FecAdqPro], [ImaPro]) VALUES (90, N'Estación Docking USB-C', N'Estación Docking USB-C, 2 HDMI, carga rápida, múltiples puertos', CAST(4800.00 AS Decimal(10, 2)), 7, 8, 9, 1, CAST(N'2025-06-27' AS Date), N'images/Estación Docking USB-C, 2 HDMI, carga rápida.jpg')
GO
INSERT [dbo].[PRODUCTOS] ([IdPro], [NomPro], [DesPro], [PrePro], [StoPro], [IdCat], [IdMar], [EstPro], [FecAdqPro], [ImaPro]) VALUES (91, N'Mouse Vertical Ergonómico', N'Mouse Vertical Ergonómico inalámbrico, batería recargable', CAST(1350.00 AS Decimal(10, 2)), 6, 7, 14, 1, CAST(N'2025-06-27' AS Date), N'images/Mouse Vertical Ergonómico inalámbrico.jpg')
GO
INSERT [dbo].[PRODUCTOS] ([IdPro], [NomPro], [DesPro], [PrePro], [StoPro], [IdCat], [IdMar], [EstPro], [FecAdqPro], [ImaPro]) VALUES (92, N'Teclado Compacto Bluetooth', N'Teclado Bluetooth compacto de la marca Logitech, ideal para tablets', CAST(1750.00 AS Decimal(10, 2)), 8, 7, 14, 1, CAST(N'2025-06-27' AS Date), N'images/Teclado Bluetooth compacto de la marca Logitech.jpg')
GO
INSERT [dbo].[PRODUCTOS] ([IdPro], [NomPro], [DesPro], [PrePro], [StoPro], [IdCat], [IdMar], [EstPro], [FecAdqPro], [ImaPro]) VALUES (93, N'SSD Kingston NV2 1TB', N'SSD Kingston NV2 NVMe 1TB, velocidad 3500MB/s', CAST(2800.00 AS Decimal(10, 2)), 13, 8, 9, 1, CAST(N'2025-06-27' AS Date), N'images/SSD Kingston NV2 NVMe 1TB.jpg')
GO
INSERT [dbo].[PRODUCTOS] ([IdPro], [NomPro], [DesPro], [PrePro], [StoPro], [IdCat], [IdMar], [EstPro], [FecAdqPro], [ImaPro]) VALUES (94, N'Tablet Huawei MatePad T10s', N'Tablet Huawei T10s, 10.1", 64GB, ideal para estudio', CAST(7400.00 AS Decimal(10, 2)), 9, 5, 8, 1, CAST(N'2025-06-27' AS Date), N'images/Tablet Huawei T10s, 10.1.jpg')
GO
INSERT [dbo].[PRODUCTOS] ([IdPro], [NomPro], [DesPro], [PrePro], [StoPro], [IdCat], [IdMar], [EstPro], [FecAdqPro], [ImaPro]) VALUES (95, N'All-in-One Dell Inspiron 5400', N'All-in-One Dell, Core i5, 8GB RAM, SSD 512GB', CAST(28900.00 AS Decimal(10, 2)), 3, 4, 1, 1, CAST(N'2025-06-27' AS Date), N'images/All-in-One Dell, Core i5, 8GB RAM.jpg')
GO
INSERT [dbo].[PRODUCTOS] ([IdPro], [NomPro], [DesPro], [PrePro], [StoPro], [IdCat], [IdMar], [EstPro], [FecAdqPro], [ImaPro]) VALUES (96, N'Auriculares JBL Tune 510BT', N'Auriculares inalámbricos JBL con Pure Bass', CAST(2800.00 AS Decimal(10, 2)), 6, 7, 8, 1, CAST(N'2025-06-27' AS Date), N'images/Auriculares inalámbricos JBL.jpg')
GO
INSERT [dbo].[PRODUCTOS] ([IdPro], [NomPro], [DesPro], [PrePro], [StoPro], [IdCat], [IdMar], [EstPro], [FecAdqPro], [ImaPro]) VALUES (97, N'Impresora Canon G2160', N'Impresora Canon G2160, tinta continua, escáner/copias', CAST(6200.00 AS Decimal(10, 2)), 4, 8, 8, 1, CAST(N'2025-06-27' AS Date), N'images/Impresora Canon G2160, tinta continua.jpg')
GO
INSERT [dbo].[PRODUCTOS] ([IdPro], [NomPro], [DesPro], [PrePro], [StoPro], [IdCat], [IdMar], [EstPro], [FecAdqPro], [ImaPro]) VALUES (98, N'Laptop Lenovo ThinkPad E14', N'Laptop ThinkPad E14, Core i7, 16GB RAM, SSD 1TB', CAST(37500.00 AS Decimal(10, 2)), 5, 2, 4, 1, CAST(N'2025-06-27' AS Date), N'images/Laptop ThinkPad E14, Core i7.jpg')
GO
INSERT [dbo].[PRODUCTOS] ([IdPro], [NomPro], [DesPro], [PrePro], [StoPro], [IdCat], [IdMar], [EstPro], [FecAdqPro], [ImaPro]) VALUES (99, N'Smartphone Moto G73 5G', N'Moto G73, 256GB, 8GB RAM, cámara 50MP Ultra Pixel', CAST(8100.00 AS Decimal(10, 2)), 7, 6, 6, 1, CAST(N'2025-06-27' AS Date), N'images/Moto G73, 256GB, 8GB RAM, cámara 50MP.jpg')
GO
INSERT [dbo].[PRODUCTOS] ([IdPro], [NomPro], [DesPro], [PrePro], [StoPro], [IdCat], [IdMar], [EstPro], [FecAdqPro], [ImaPro]) VALUES (100, N'Gabinete NZXT H510 Flow', N'Gabinete NZXT H510 Flow, vidrio templado, buena ventilación', CAST(4800.00 AS Decimal(10, 2)), 6, 8, 9, 1, CAST(N'2025-06-27' AS Date), N'images/Gabinete NZXT H510 Flow, vidrio templado.jpg')
GO
INSERT [dbo].[USUARIOS] ([CorUsu], [ConUsu], [RolUsu], [EstUsu]) VALUES (N'ferrerawilson@unicah.edu', N'1234', 1, 1)
GO
ALTER TABLE [dbo].[CARRITOS] ADD  CONSTRAINT [DF__CARRITOS__FecCar__5441852A]  DEFAULT (getdate()) FOR [FecCar]
GO
ALTER TABLE [dbo].[DETALLESCARRITO]  WITH CHECK ADD  CONSTRAINT [FK__DETALLESC__IdCar__571DF1D5] FOREIGN KEY([IdCar])
REFERENCES [dbo].[CARRITOS] ([IdCar])
GO
ALTER TABLE [dbo].[DETALLESCARRITO] CHECK CONSTRAINT [FK__DETALLESC__IdCar__571DF1D5]
GO
ALTER TABLE [dbo].[DETALLESCARRITO]  WITH CHECK ADD  CONSTRAINT [FK__DETALLESC__IdPro__5812160E] FOREIGN KEY([IdPro])
REFERENCES [dbo].[PRODUCTOS] ([IdPro])
GO
ALTER TABLE [dbo].[DETALLESCARRITO] CHECK CONSTRAINT [FK__DETALLESC__IdPro__5812160E]
GO
ALTER TABLE [dbo].[PRODUCTOS]  WITH CHECK ADD  CONSTRAINT [FK_PRODUCTOS_CATEGORIAS] FOREIGN KEY([IdCat])
REFERENCES [dbo].[CATEGORIAS] ([IdCat])
GO
ALTER TABLE [dbo].[PRODUCTOS] CHECK CONSTRAINT [FK_PRODUCTOS_CATEGORIAS]
GO
ALTER TABLE [dbo].[PRODUCTOS]  WITH CHECK ADD  CONSTRAINT [FK_PRODUCTOS_MARCAS] FOREIGN KEY([IdMar])
REFERENCES [dbo].[MARCAS] ([IdMar])
GO
ALTER TABLE [dbo].[PRODUCTOS] CHECK CONSTRAINT [FK_PRODUCTOS_MARCAS]
GO
/****** Object:  StoredProcedure [dbo].[sp_LoginUsuario]    Script Date: 1/7/2025 21:32:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_LoginUsuario]
    @CorUsu NVARCHAR(100),
    @ConUsu NVARCHAR(100)
AS
BEGIN
    SELECT CorUsu, RolUsu, EstUsu
    FROM USUARIOS
    WHERE CorUsu = @CorUsu AND ConUsu = @ConUsu AND EstUsu = 1
END
GO
USE [master]
GO
ALTER DATABASE [E-COMMERCE_PROYECTO] SET  READ_WRITE 
GO

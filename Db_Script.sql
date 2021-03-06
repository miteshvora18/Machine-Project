USE [master]
GO
/****** Object:  Database [Machine]    Script Date: 02/15/2014 19:58:14 ******/
CREATE DATABASE [Machine] ON  PRIMARY 
( NAME = N'Machine', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\Machine.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Machine_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\Machine_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Machine] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Machine].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Machine] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [Machine] SET ANSI_NULLS OFF
GO
ALTER DATABASE [Machine] SET ANSI_PADDING OFF
GO
ALTER DATABASE [Machine] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [Machine] SET ARITHABORT OFF
GO
ALTER DATABASE [Machine] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [Machine] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [Machine] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [Machine] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [Machine] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [Machine] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [Machine] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [Machine] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [Machine] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [Machine] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [Machine] SET  DISABLE_BROKER
GO
ALTER DATABASE [Machine] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [Machine] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [Machine] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [Machine] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [Machine] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [Machine] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [Machine] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [Machine] SET  READ_WRITE
GO
ALTER DATABASE [Machine] SET RECOVERY FULL
GO
ALTER DATABASE [Machine] SET  MULTI_USER
GO
ALTER DATABASE [Machine] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [Machine] SET DB_CHAINING OFF
GO
EXEC sys.sp_db_vardecimal_storage_format N'Machine', N'ON'
GO
USE [Machine]
GO
/****** Object:  Table [dbo].[roles]    Script Date: 02/15/2014 19:58:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[roles](
	[rid] [int] IDENTITY(1,1) NOT NULL,
	[rname] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[rid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[roles] ON
INSERT [dbo].[roles] ([rid], [rname]) VALUES (1, N'Admin')
INSERT [dbo].[roles] ([rid], [rname]) VALUES (2, N'Marketing')
INSERT [dbo].[roles] ([rid], [rname]) VALUES (3, N'Manufacturing')
INSERT [dbo].[roles] ([rid], [rname]) VALUES (4, N'Packaging')
INSERT [dbo].[roles] ([rid], [rname]) VALUES (5, N'Testing')
INSERT [dbo].[roles] ([rid], [rname]) VALUES (6, N'Completed')
INSERT [dbo].[roles] ([rid], [rname]) VALUES (7, N'Cancelled')
INSERT [dbo].[roles] ([rid], [rname]) VALUES (8, N'EmpMarketing')
SET IDENTITY_INSERT [dbo].[roles] OFF
/****** Object:  Table [dbo].[machine]    Script Date: 02/15/2014 19:58:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[machine](
	[mid] [int] IDENTITY(1,1) NOT NULL,
	[mname] [varchar](100) NULL,
	[mdesc] [varchar](100) NULL,
	[mimg] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[mid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[machine] ON
INSERT [dbo].[machine] ([mid], [mname], [mdesc], [mimg]) VALUES (1, N'Laser Equipment', N'', N'Image/laser.jpg')
INSERT [dbo].[machine] ([mid], [mname], [mdesc], [mimg]) VALUES (2, N'Metal machinery', N'', N'Image/Metal.jpg')
INSERT [dbo].[machine] ([mid], [mname], [mdesc], [mimg]) VALUES (3, N'Paper Converting Machinery', N'', N'Image/paper_converter.jpg')
INSERT [dbo].[machine] ([mid], [mname], [mdesc], [mimg]) VALUES (4, N'Pumps', N'', N'Image/Pumps.jpg')
INSERT [dbo].[machine] ([mid], [mname], [mdesc], [mimg]) VALUES (5, N'Printing Machinery', N'', N'Image/Printing.jpg')
INSERT [dbo].[machine] ([mid], [mname], [mdesc], [mimg]) VALUES (6, N'Air-Conditioning and Refrigeration Machinery', N'', N'Image/Refrigeration.jpg')
SET IDENTITY_INSERT [dbo].[machine] OFF
/****** Object:  Table [dbo].[login]    Script Date: 02/15/2014 19:58:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[login](
	[uid] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [varchar](50) NULL,
	[password] [varchar](40) NULL,
	[rid] [int] NULL,
	[email] [varchar](90) NULL,
PRIMARY KEY CLUSTERED 
(
	[uid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[login] ON
INSERT [dbo].[login] ([uid], [user_id], [password], [rid], [email]) VALUES (1, N'admin', N'admin', 1, NULL)
INSERT [dbo].[login] ([uid], [user_id], [password], [rid], [email]) VALUES (2, N'mark', N'mark', 2, NULL)
INSERT [dbo].[login] ([uid], [user_id], [password], [rid], [email]) VALUES (3, N'manu', N'manu', 3, NULL)
INSERT [dbo].[login] ([uid], [user_id], [password], [rid], [email]) VALUES (4, N'pack', N'pack', 4, NULL)
INSERT [dbo].[login] ([uid], [user_id], [password], [rid], [email]) VALUES (5, N'test', N'test', 5, NULL)
INSERT [dbo].[login] ([uid], [user_id], [password], [rid], [email]) VALUES (6, N'empmark', N'empmark', 8, NULL)
INSERT [dbo].[login] ([uid], [user_id], [password], [rid], [email]) VALUES (7, N'neeraj', N'neeraj', 2, N'sawant.neeraj@gmail.com')
INSERT [dbo].[login] ([uid], [user_id], [password], [rid], [email]) VALUES (8, N'MITESHmitesh', N'mitesh', 2, N'miteshvora18@gmail.com')
SET IDENTITY_INSERT [dbo].[login] OFF
/****** Object:  Table [dbo].[orders]    Script Date: 02/15/2014 19:58:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orders](
	[oid] [int] IDENTITY(1,1) NOT NULL,
	[mid] [int] NULL,
	[mquantity] [int] NULL,
	[price] [money] NULL,
	[ostartdate] [date] NULL,
	[oenddate] [date] NULL,
	[ostatus] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[oid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[orders] ON
INSERT [dbo].[orders] ([oid], [mid], [mquantity], [price], [ostartdate], [oenddate], [ostatus]) VALUES (1, 1, 1, 1233.0000, CAST(0x27380B00 AS Date), CAST(0x2E380B00 AS Date), 6)
INSERT [dbo].[orders] ([oid], [mid], [mquantity], [price], [ostartdate], [oenddate], [ostatus]) VALUES (2, 5, 1, 5856.0000, CAST(0x27380B00 AS Date), CAST(0x2E380B00 AS Date), 6)
INSERT [dbo].[orders] ([oid], [mid], [mquantity], [price], [ostartdate], [oenddate], [ostatus]) VALUES (3, 3, 1, 1230.0000, CAST(0x29380B00 AS Date), CAST(0x5B950A00 AS Date), 7)
INSERT [dbo].[orders] ([oid], [mid], [mquantity], [price], [ostartdate], [oenddate], [ostatus]) VALUES (4, 6, 2, 2000.0000, CAST(0x29380B00 AS Date), CAST(0x5B950A00 AS Date), 4)
INSERT [dbo].[orders] ([oid], [mid], [mquantity], [price], [ostartdate], [oenddate], [ostatus]) VALUES (5, 3, 5, 10000.0000, CAST(0x29380B00 AS Date), CAST(0x5B950A00 AS Date), 3)
INSERT [dbo].[orders] ([oid], [mid], [mquantity], [price], [ostartdate], [oenddate], [ostatus]) VALUES (6, 4, 2, 2000.0000, CAST(0x2B380B00 AS Date), CAST(0x5B950A00 AS Date), 3)
INSERT [dbo].[orders] ([oid], [mid], [mquantity], [price], [ostartdate], [oenddate], [ostatus]) VALUES (20, 3, 5, 29000.0000, CAST(0x2E380B00 AS Date), CAST(0x5B950A00 AS Date), 8)
INSERT [dbo].[orders] ([oid], [mid], [mquantity], [price], [ostartdate], [oenddate], [ostatus]) VALUES (21, 1, 1, 1300.0000, CAST(0x2E380B00 AS Date), CAST(0x5B950A00 AS Date), 3)
INSERT [dbo].[orders] ([oid], [mid], [mquantity], [price], [ostartdate], [oenddate], [ostatus]) VALUES (22, 1, 1, 1300.0000, CAST(0x2E380B00 AS Date), CAST(0x5B950A00 AS Date), 3)
INSERT [dbo].[orders] ([oid], [mid], [mquantity], [price], [ostartdate], [oenddate], [ostatus]) VALUES (23, 1, 1, 1300.0000, CAST(0x2E380B00 AS Date), CAST(0x5B950A00 AS Date), 8)
INSERT [dbo].[orders] ([oid], [mid], [mquantity], [price], [ostartdate], [oenddate], [ostatus]) VALUES (24, 1, 1, 1300.0000, CAST(0x2E380B00 AS Date), CAST(0x5B950A00 AS Date), 8)
INSERT [dbo].[orders] ([oid], [mid], [mquantity], [price], [ostartdate], [oenddate], [ostatus]) VALUES (25, 4, 2, 2000.0000, CAST(0x2E380B00 AS Date), CAST(0x5B950A00 AS Date), 8)
INSERT [dbo].[orders] ([oid], [mid], [mquantity], [price], [ostartdate], [oenddate], [ostatus]) VALUES (26, 2, 1, 3500.0000, CAST(0x2E380B00 AS Date), CAST(0x5B950A00 AS Date), 8)
INSERT [dbo].[orders] ([oid], [mid], [mquantity], [price], [ostartdate], [oenddate], [ostatus]) VALUES (27, 2, 2, 7000.0000, CAST(0x2E380B00 AS Date), CAST(0x2E380B00 AS Date), 6)
SET IDENTITY_INSERT [dbo].[orders] OFF
/****** Object:  ForeignKey [FK__login__rid__0CBAE877]    Script Date: 02/15/2014 19:58:14 ******/
ALTER TABLE [dbo].[login]  WITH CHECK ADD FOREIGN KEY([rid])
REFERENCES [dbo].[roles] ([rid])
GO
/****** Object:  ForeignKey [FK__orders__mid__1A14E395]    Script Date: 02/15/2014 19:58:14 ******/
ALTER TABLE [dbo].[orders]  WITH CHECK ADD FOREIGN KEY([mid])
REFERENCES [dbo].[machine] ([mid])
GO
/****** Object:  ForeignKey [FK__orders__mid__1FCDBCEB]    Script Date: 02/15/2014 19:58:14 ******/
ALTER TABLE [dbo].[orders]  WITH CHECK ADD FOREIGN KEY([mid])
REFERENCES [dbo].[machine] ([mid])
GO
/****** Object:  ForeignKey [FK__orders__ostatus__1B0907CE]    Script Date: 02/15/2014 19:58:14 ******/
ALTER TABLE [dbo].[orders]  WITH CHECK ADD FOREIGN KEY([ostatus])
REFERENCES [dbo].[roles] ([rid])
GO
/****** Object:  ForeignKey [FK__orders__ostatus__20C1E124]    Script Date: 02/15/2014 19:58:14 ******/
ALTER TABLE [dbo].[orders]  WITH CHECK ADD FOREIGN KEY([ostatus])
REFERENCES [dbo].[roles] ([rid])
GO

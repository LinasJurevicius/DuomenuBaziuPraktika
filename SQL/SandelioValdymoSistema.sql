USE [master]
GO
/****** Object:  Database [SandėlioValdymoSistema]    Script Date: 2022-06-09 16:31:52 ******/
CREATE DATABASE [SandėlioValdymoSistema]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PI20S', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\PI20S.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PI20S_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\PI20S_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [SandėlioValdymoSistema] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SandėlioValdymoSistema].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SandėlioValdymoSistema] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SandėlioValdymoSistema] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SandėlioValdymoSistema] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SandėlioValdymoSistema] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SandėlioValdymoSistema] SET ARITHABORT OFF 
GO
ALTER DATABASE [SandėlioValdymoSistema] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SandėlioValdymoSistema] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SandėlioValdymoSistema] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SandėlioValdymoSistema] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SandėlioValdymoSistema] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SandėlioValdymoSistema] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SandėlioValdymoSistema] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SandėlioValdymoSistema] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SandėlioValdymoSistema] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SandėlioValdymoSistema] SET  ENABLE_BROKER 
GO
ALTER DATABASE [SandėlioValdymoSistema] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SandėlioValdymoSistema] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SandėlioValdymoSistema] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SandėlioValdymoSistema] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SandėlioValdymoSistema] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SandėlioValdymoSistema] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SandėlioValdymoSistema] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SandėlioValdymoSistema] SET RECOVERY FULL 
GO
ALTER DATABASE [SandėlioValdymoSistema] SET  MULTI_USER 
GO
ALTER DATABASE [SandėlioValdymoSistema] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SandėlioValdymoSistema] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SandėlioValdymoSistema] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SandėlioValdymoSistema] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SandėlioValdymoSistema] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SandėlioValdymoSistema] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'SandėlioValdymoSistema', N'ON'
GO
ALTER DATABASE [SandėlioValdymoSistema] SET QUERY_STORE = OFF
GO
USE [SandėlioValdymoSistema]
GO
/****** Object:  Schema [pi20s]    Script Date: 2022-06-09 16:31:52 ******/
CREATE SCHEMA [pi20s]
GO
/****** Object:  Table [dbo].[Adresai]    Script Date: 2022-06-09 16:31:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Adresai](
	[AdresaiId] [int] IDENTITY(1,1) NOT NULL,
	[Salis] [varchar](255) NULL,
	[Miestas] [varchar](255) NULL,
	[Adresas] [varchar](255) NULL,
 CONSTRAINT [PK_adresai_AdresaiId] PRIMARY KEY CLUSTERED 
(
	[AdresaiId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OperacijuTipai]    Script Date: 2022-06-09 16:31:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OperacijuTipai](
	[OperacijuTipaiId] [int] IDENTITY(4,1) NOT NULL,
	[Pavadinimas] [varchar](255) NULL,
	[Kodas] [varchar](255) NULL,
	[Aprasymas] [varchar](255) NULL,
 CONSTRAINT [PK_operacijostipai_Id] PRIMARY KEY CLUSTERED 
(
	[OperacijuTipaiId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [operacijostipai$Kodas] UNIQUE NONCLUSTERED 
(
	[Kodas] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Partneriai]    Script Date: 2022-06-09 16:31:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Partneriai](
	[PartneriaiId] [int] IDENTITY(1,1) NOT NULL,
	[Pavadinimas] [varchar](255) NULL,
	[AdresaiId] [int] NULL,
	[ImonesKodas] [nchar](50) NULL,
	[PVMKodas] [nchar](50) NULL,
 CONSTRAINT [PK_partneriai_PartneriaiId] PRIMARY KEY CLUSTERED 
(
	[PartneriaiId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Prekes]    Script Date: 2022-06-09 16:31:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Prekes](
	[PrekesId] [int] IDENTITY(4,1) NOT NULL,
	[Kodas] [varchar](255) NULL,
	[Pavadinimas] [varchar](255) NULL,
	[Barkodas] [varchar](255) NULL,
	[PrekiuTipaiId] [int] NULL,
	[Kiekis] [float] NULL,
	[PartneriaiId] [int] NULL,
 CONSTRAINT [PK_prekes_Id] PRIMARY KEY CLUSTERED 
(
	[PrekesId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [prekes$Kodas] UNIQUE NONCLUSTERED 
(
	[Kodas] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PrekiuPartijos]    Script Date: 2022-06-09 16:31:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PrekiuPartijos](
	[PrekiuPartijosId] [int] IDENTITY(5,1) NOT NULL,
	[Kodas] [varchar](255) NULL,
	[SerijosNumeris] [int] NULL,
	[Kiekis] [float] NULL,
	[PrekesId] [int] NULL,
	[PartijosData] [date] NULL,
	[GaliojimoData] [date] NULL,
 CONSTRAINT [PK_prekes_partija_Id] PRIMARY KEY CLUSTERED 
(
	[PrekiuPartijosId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [prekes_partija$Kodas] UNIQUE NONCLUSTERED 
(
	[Kodas] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PrekiuTipai]    Script Date: 2022-06-09 16:31:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PrekiuTipai](
	[PrekiuTipaiId] [int] IDENTITY(3,1) NOT NULL,
	[Kodas] [varchar](255) NULL,
	[Pavadinimas] [varchar](255) NULL,
	[Aprasymas] [varchar](255) NULL,
 CONSTRAINT [PK_prekes_tipai_Id] PRIMARY KEY CLUSTERED 
(
	[PrekiuTipaiId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [prekes_tipai$Kodas] UNIQUE NONCLUSTERED 
(
	[Kodas] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sandeliai]    Script Date: 2022-06-09 16:31:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sandeliai](
	[SandeliaiId] [int] IDENTITY(4,1) NOT NULL,
	[Kodas] [varchar](255) NULL,
	[Pavadinimas] [varchar](255) NULL,
	[AdresaiId] [int] NULL,
	[SandeliuGrupesId] [int] NULL,
 CONSTRAINT [PK_sandelis_Id] PRIMARY KEY CLUSTERED 
(
	[SandeliaiId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [sandelis$Kodas] UNIQUE NONCLUSTERED 
(
	[Kodas] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sandelininkai]    Script Date: 2022-06-09 16:31:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sandelininkai](
	[SandelininkaiId] [int] NOT NULL,
	[Kodas] [varchar](255) NULL,
	[Pavadinimas] [varchar](255) NULL,
	[Vardas] [varchar](255) NULL,
	[Pavarde] [varchar](255) NULL,
	[SandeliuGrupesId] [int] NULL,
	[TeisesId] [int] NULL,
 CONSTRAINT [PK_sandelininkas_Id] PRIMARY KEY CLUSTERED 
(
	[SandelininkaiId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [sandelininkas$Kodas] UNIQUE NONCLUSTERED 
(
	[Kodas] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SandeliuGrupes]    Script Date: 2022-06-09 16:31:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SandeliuGrupes](
	[SandeliuGrupesId] [int] NOT NULL,
	[Kodas] [varchar](50) NULL,
	[Pavadinimas] [varchar](255) NULL,
	[Aprasymas] [varchar](500) NULL,
 CONSTRAINT [PK_sandeliu_grupe_Id] PRIMARY KEY CLUSTERED 
(
	[SandeliuGrupesId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [sandeliu_grupe$Kodas] UNIQUE NONCLUSTERED 
(
	[Kodas] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SandeliuOperacijos]    Script Date: 2022-06-09 16:31:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SandeliuOperacijos](
	[OperacijosId] [int] IDENTITY(6,1) NOT NULL,
	[SandelininkaiId] [int] NULL,
	[SandelioVietosId] [int] NULL,
	[PrekesId] [int] NULL,
	[PartijosId] [int] NULL,
	[Kiekis] [float] NULL,
	[OperacijuTipaiId] [int] NULL,
	[PartneriaiId] [int] NULL,
 CONSTRAINT [PK_sandelio_operacijos_Id] PRIMARY KEY CLUSTERED 
(
	[OperacijosId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SandeliuVietos]    Script Date: 2022-06-09 16:31:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SandeliuVietos](
	[SandeliuVietosId] [int] IDENTITY(8,1) NOT NULL,
	[Kodas] [varchar](255) NULL,
	[Pavadinimas] [varchar](255) NULL,
	[SandeliaiId] [int] NULL,
	[PrekiuPartijosId] [int] NULL,
	[SandeliuVietuTipaiId] [int] NULL,
 CONSTRAINT [PK_sandelio_vietos_Id] PRIMARY KEY CLUSTERED 
(
	[SandeliuVietosId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SandeliuVietuTipai]    Script Date: 2022-06-09 16:31:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SandeliuVietuTipai](
	[SandeliuVietuTipaiId] [int] IDENTITY(3,1) NOT NULL,
	[Kodas] [varchar](255) NULL,
	[Pavadinimas] [varchar](255) NULL,
	[Aprasymas] [varchar](255) NULL,
 CONSTRAINT [PK_sandeliovietos_tipas_Id] PRIMARY KEY CLUSTERED 
(
	[SandeliuVietuTipaiId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SndeliuGrupiuSandeliai]    Script Date: 2022-06-09 16:31:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SndeliuGrupiuSandeliai](
	[SandeliuGrupiuSandeliaiId] [int] NOT NULL,
	[SandeliuGrupiuId] [int] NULL,
	[SandeliaiId] [int] NULL,
 CONSTRAINT [PK_snd_grupes_sandeliai_Id] PRIMARY KEY CLUSTERED 
(
	[SandeliuGrupiuSandeliaiId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Teises]    Script Date: 2022-06-09 16:31:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Teises](
	[TeisesId] [int] NOT NULL,
	[Kodas] [varchar](255) NULL,
	[Pavadinimas] [varchar](255) NULL,
	[Aprasymas] [varchar](255) NULL,
 CONSTRAINT [PK_teises_Id] PRIMARY KEY CLUSTERED 
(
	[TeisesId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [teises$Kodas] UNIQUE NONCLUSTERED 
(
	[Kodas] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vartotojai]    Script Date: 2022-06-09 16:31:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vartotojai](
	[VartotojaiId] [int] NOT NULL,
	[VartotojoVardas] [nchar](50) NOT NULL,
	[SandelininkaiId] [int] NULL,
	[PartneriaiId] [int] NULL,
	[VartotojuTipaiId] [int] NULL,
	[Slaptazodis] [nvarchar](50) NULL,
 CONSTRAINT [PK_Vartotojai] PRIMARY KEY CLUSTERED 
(
	[VartotojaiId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VartotojuTipai]    Script Date: 2022-06-09 16:31:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VartotojuTipai](
	[VartotojuTipaiId] [int] NOT NULL,
	[Pavadinimai] [nchar](255) NULL,
 CONSTRAINT [PK_VartotojuTipai] PRIMARY KEY CLUSTERED 
(
	[VartotojuTipaiId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Index [FK_partneriai_adresai_AdresaiId]    Script Date: 2022-06-09 16:31:52 ******/
CREATE NONCLUSTERED INDEX [FK_partneriai_adresai_AdresaiId] ON [dbo].[Partneriai]
(
	[AdresaiId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [FK_prekes_partneriai_PartneriaiId]    Script Date: 2022-06-09 16:31:52 ******/
CREATE NONCLUSTERED INDEX [FK_prekes_partneriai_PartneriaiId] ON [dbo].[Prekes]
(
	[PartneriaiId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [FK_prekes_prekestipai_Id]    Script Date: 2022-06-09 16:31:52 ******/
CREATE NONCLUSTERED INDEX [FK_prekes_prekestipai_Id] ON [dbo].[Prekes]
(
	[PrekiuTipaiId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [FK_prekespartija_prekes_Id]    Script Date: 2022-06-09 16:31:52 ******/
CREATE NONCLUSTERED INDEX [FK_prekespartija_prekes_Id] ON [dbo].[PrekiuPartijos]
(
	[PrekesId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [FK_sandelis_adresai_AdresaiId]    Script Date: 2022-06-09 16:31:52 ******/
CREATE NONCLUSTERED INDEX [FK_sandelis_adresai_AdresaiId] ON [dbo].[Sandeliai]
(
	[AdresaiId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [FK_sandelis_sandeliugrupesandeliai_Id]    Script Date: 2022-06-09 16:31:52 ******/
CREATE NONCLUSTERED INDEX [FK_sandelis_sandeliugrupesandeliai_Id] ON [dbo].[Sandeliai]
(
	[SandeliuGrupesId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [FK_sandelininkas_sandeliu_grupe_Id]    Script Date: 2022-06-09 16:31:52 ******/
CREATE NONCLUSTERED INDEX [FK_sandelininkas_sandeliu_grupe_Id] ON [dbo].[Sandelininkai]
(
	[SandeliuGrupesId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [FK_sandelininkas_teises_Id]    Script Date: 2022-06-09 16:31:52 ******/
CREATE NONCLUSTERED INDEX [FK_sandelininkas_teises_Id] ON [dbo].[Sandelininkai]
(
	[TeisesId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [FK_sandelio_operacijos_operacijostipai_Id]    Script Date: 2022-06-09 16:31:52 ******/
CREATE NONCLUSTERED INDEX [FK_sandelio_operacijos_operacijostipai_Id] ON [dbo].[SandeliuOperacijos]
(
	[OperacijuTipaiId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [FK_sandelio_operacijos_partneriai_PartneriaiId]    Script Date: 2022-06-09 16:31:52 ******/
CREATE NONCLUSTERED INDEX [FK_sandelio_operacijos_partneriai_PartneriaiId] ON [dbo].[SandeliuOperacijos]
(
	[PartneriaiId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [FK_sandelio_operacijos_prekes_Id]    Script Date: 2022-06-09 16:31:52 ******/
CREATE NONCLUSTERED INDEX [FK_sandelio_operacijos_prekes_Id] ON [dbo].[SandeliuOperacijos]
(
	[PrekesId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [FK_sandelio_operacijos_prekes_partija_Id]    Script Date: 2022-06-09 16:31:52 ******/
CREATE NONCLUSTERED INDEX [FK_sandelio_operacijos_prekes_partija_Id] ON [dbo].[SandeliuOperacijos]
(
	[PartijosId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [FK_sandelio_operacijos_sandelininkas_Id]    Script Date: 2022-06-09 16:31:52 ******/
CREATE NONCLUSTERED INDEX [FK_sandelio_operacijos_sandelininkas_Id] ON [dbo].[SandeliuOperacijos]
(
	[SandelininkaiId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [FK_sandelio_operacijos_sandelio_vietos_Id]    Script Date: 2022-06-09 16:31:52 ******/
CREATE NONCLUSTERED INDEX [FK_sandelio_operacijos_sandelio_vietos_Id] ON [dbo].[SandeliuOperacijos]
(
	[SandelioVietosId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [FK_sandeliovietos_prekespartija_Id]    Script Date: 2022-06-09 16:31:52 ******/
CREATE NONCLUSTERED INDEX [FK_sandeliovietos_prekespartija_Id] ON [dbo].[SandeliuVietos]
(
	[PrekiuPartijosId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [FK_sandeliovietos_sandeliovietostipas_Id]    Script Date: 2022-06-09 16:31:52 ******/
CREATE NONCLUSTERED INDEX [FK_sandeliovietos_sandeliovietostipas_Id] ON [dbo].[SandeliuVietos]
(
	[SandeliuVietuTipaiId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [FK_sandeliovietos_sandelis_Id]    Script Date: 2022-06-09 16:31:52 ******/
CREATE NONCLUSTERED INDEX [FK_sandeliovietos_sandelis_Id] ON [dbo].[SandeliuVietos]
(
	[SandeliaiId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [FK_snd_grupes_sandeliai_sandelis_Id]    Script Date: 2022-06-09 16:31:52 ******/
CREATE NONCLUSTERED INDEX [FK_snd_grupes_sandeliai_sandelis_Id] ON [dbo].[SndeliuGrupiuSandeliai]
(
	[SandeliaiId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [FK_snd_grupes_sandeliai_sandeliu_grupe_Id]    Script Date: 2022-06-09 16:31:52 ******/
CREATE NONCLUSTERED INDEX [FK_snd_grupes_sandeliai_sandeliu_grupe_Id] ON [dbo].[SndeliuGrupiuSandeliai]
(
	[SandeliuGrupiuId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Adresai] ADD  DEFAULT (NULL) FOR [Salis]
GO
ALTER TABLE [dbo].[Adresai] ADD  DEFAULT (NULL) FOR [Miestas]
GO
ALTER TABLE [dbo].[Adresai] ADD  DEFAULT (NULL) FOR [Adresas]
GO
ALTER TABLE [dbo].[OperacijuTipai] ADD  DEFAULT (NULL) FOR [Pavadinimas]
GO
ALTER TABLE [dbo].[OperacijuTipai] ADD  DEFAULT (NULL) FOR [Kodas]
GO
ALTER TABLE [dbo].[OperacijuTipai] ADD  DEFAULT (NULL) FOR [Aprasymas]
GO
ALTER TABLE [dbo].[Partneriai] ADD  DEFAULT (NULL) FOR [Pavadinimas]
GO
ALTER TABLE [dbo].[Partneriai] ADD  DEFAULT (NULL) FOR [AdresaiId]
GO
ALTER TABLE [dbo].[Prekes] ADD  DEFAULT (NULL) FOR [Kodas]
GO
ALTER TABLE [dbo].[Prekes] ADD  DEFAULT (NULL) FOR [Pavadinimas]
GO
ALTER TABLE [dbo].[Prekes] ADD  DEFAULT (NULL) FOR [Barkodas]
GO
ALTER TABLE [dbo].[Prekes] ADD  DEFAULT (NULL) FOR [PrekiuTipaiId]
GO
ALTER TABLE [dbo].[Prekes] ADD  DEFAULT (NULL) FOR [Kiekis]
GO
ALTER TABLE [dbo].[Prekes] ADD  DEFAULT (NULL) FOR [PartneriaiId]
GO
ALTER TABLE [dbo].[PrekiuPartijos] ADD  DEFAULT (NULL) FOR [Kodas]
GO
ALTER TABLE [dbo].[PrekiuPartijos] ADD  DEFAULT (NULL) FOR [SerijosNumeris]
GO
ALTER TABLE [dbo].[PrekiuPartijos] ADD  DEFAULT (NULL) FOR [Kiekis]
GO
ALTER TABLE [dbo].[PrekiuPartijos] ADD  DEFAULT (NULL) FOR [PrekesId]
GO
ALTER TABLE [dbo].[PrekiuPartijos] ADD  DEFAULT (NULL) FOR [PartijosData]
GO
ALTER TABLE [dbo].[PrekiuPartijos] ADD  DEFAULT (NULL) FOR [GaliojimoData]
GO
ALTER TABLE [dbo].[PrekiuTipai] ADD  DEFAULT (NULL) FOR [Kodas]
GO
ALTER TABLE [dbo].[PrekiuTipai] ADD  DEFAULT (NULL) FOR [Pavadinimas]
GO
ALTER TABLE [dbo].[PrekiuTipai] ADD  DEFAULT (NULL) FOR [Aprasymas]
GO
ALTER TABLE [dbo].[Sandeliai] ADD  DEFAULT (NULL) FOR [Kodas]
GO
ALTER TABLE [dbo].[Sandeliai] ADD  DEFAULT (NULL) FOR [Pavadinimas]
GO
ALTER TABLE [dbo].[Sandeliai] ADD  DEFAULT (NULL) FOR [AdresaiId]
GO
ALTER TABLE [dbo].[Sandeliai] ADD  DEFAULT (NULL) FOR [SandeliuGrupesId]
GO
ALTER TABLE [dbo].[Sandelininkai] ADD  DEFAULT (NULL) FOR [Kodas]
GO
ALTER TABLE [dbo].[Sandelininkai] ADD  DEFAULT (NULL) FOR [Pavadinimas]
GO
ALTER TABLE [dbo].[Sandelininkai] ADD  DEFAULT (NULL) FOR [Vardas]
GO
ALTER TABLE [dbo].[Sandelininkai] ADD  DEFAULT (NULL) FOR [Pavarde]
GO
ALTER TABLE [dbo].[Sandelininkai] ADD  DEFAULT (NULL) FOR [SandeliuGrupesId]
GO
ALTER TABLE [dbo].[Sandelininkai] ADD  DEFAULT (NULL) FOR [TeisesId]
GO
ALTER TABLE [dbo].[SandeliuGrupes] ADD  DEFAULT (NULL) FOR [Kodas]
GO
ALTER TABLE [dbo].[SandeliuGrupes] ADD  DEFAULT (NULL) FOR [Pavadinimas]
GO
ALTER TABLE [dbo].[SandeliuGrupes] ADD  DEFAULT (NULL) FOR [Aprasymas]
GO
ALTER TABLE [dbo].[SandeliuOperacijos] ADD  DEFAULT (NULL) FOR [SandelininkaiId]
GO
ALTER TABLE [dbo].[SandeliuOperacijos] ADD  DEFAULT (NULL) FOR [SandelioVietosId]
GO
ALTER TABLE [dbo].[SandeliuOperacijos] ADD  DEFAULT (NULL) FOR [PrekesId]
GO
ALTER TABLE [dbo].[SandeliuOperacijos] ADD  DEFAULT (NULL) FOR [PartijosId]
GO
ALTER TABLE [dbo].[SandeliuOperacijos] ADD  DEFAULT (NULL) FOR [Kiekis]
GO
ALTER TABLE [dbo].[SandeliuOperacijos] ADD  DEFAULT (NULL) FOR [OperacijuTipaiId]
GO
ALTER TABLE [dbo].[SandeliuOperacijos] ADD  DEFAULT (NULL) FOR [PartneriaiId]
GO
ALTER TABLE [dbo].[SandeliuVietos] ADD  DEFAULT (NULL) FOR [Kodas]
GO
ALTER TABLE [dbo].[SandeliuVietos] ADD  DEFAULT (NULL) FOR [Pavadinimas]
GO
ALTER TABLE [dbo].[SandeliuVietos] ADD  DEFAULT (NULL) FOR [SandeliaiId]
GO
ALTER TABLE [dbo].[SandeliuVietos] ADD  DEFAULT (NULL) FOR [PrekiuPartijosId]
GO
ALTER TABLE [dbo].[SandeliuVietos] ADD  DEFAULT (NULL) FOR [SandeliuVietuTipaiId]
GO
ALTER TABLE [dbo].[SandeliuVietuTipai] ADD  DEFAULT (NULL) FOR [Kodas]
GO
ALTER TABLE [dbo].[SandeliuVietuTipai] ADD  DEFAULT (NULL) FOR [Pavadinimas]
GO
ALTER TABLE [dbo].[SandeliuVietuTipai] ADD  DEFAULT (NULL) FOR [Aprasymas]
GO
ALTER TABLE [dbo].[SndeliuGrupiuSandeliai] ADD  DEFAULT (NULL) FOR [SandeliuGrupiuId]
GO
ALTER TABLE [dbo].[SndeliuGrupiuSandeliai] ADD  DEFAULT (NULL) FOR [SandeliaiId]
GO
ALTER TABLE [dbo].[Teises] ADD  DEFAULT (NULL) FOR [Kodas]
GO
ALTER TABLE [dbo].[Teises] ADD  DEFAULT (NULL) FOR [Pavadinimas]
GO
ALTER TABLE [dbo].[Teises] ADD  DEFAULT (NULL) FOR [Aprasymas]
GO
ALTER TABLE [dbo].[Partneriai]  WITH NOCHECK ADD  CONSTRAINT [partneriai$FK_partneriai_adresai_AdresaiId] FOREIGN KEY([AdresaiId])
REFERENCES [dbo].[Adresai] ([AdresaiId])
GO
ALTER TABLE [dbo].[Partneriai] CHECK CONSTRAINT [partneriai$FK_partneriai_adresai_AdresaiId]
GO
ALTER TABLE [dbo].[Prekes]  WITH NOCHECK ADD  CONSTRAINT [prekes$FK_prekes_partneriai_PartneriaiId] FOREIGN KEY([PartneriaiId])
REFERENCES [dbo].[Partneriai] ([PartneriaiId])
GO
ALTER TABLE [dbo].[Prekes] CHECK CONSTRAINT [prekes$FK_prekes_partneriai_PartneriaiId]
GO
ALTER TABLE [dbo].[Prekes]  WITH NOCHECK ADD  CONSTRAINT [prekes$FK_prekes_prekestipai_Id] FOREIGN KEY([PrekiuTipaiId])
REFERENCES [dbo].[PrekiuTipai] ([PrekiuTipaiId])
GO
ALTER TABLE [dbo].[Prekes] CHECK CONSTRAINT [prekes$FK_prekes_prekestipai_Id]
GO
ALTER TABLE [dbo].[PrekiuPartijos]  WITH NOCHECK ADD  CONSTRAINT [prekes_partija$FK_prekespartija_prekes_Id] FOREIGN KEY([PrekesId])
REFERENCES [dbo].[Prekes] ([PrekesId])
GO
ALTER TABLE [dbo].[PrekiuPartijos] CHECK CONSTRAINT [prekes_partija$FK_prekespartija_prekes_Id]
GO
ALTER TABLE [dbo].[Sandeliai]  WITH NOCHECK ADD  CONSTRAINT [sandelis$FK_sandelis_adresai_AdresaiId] FOREIGN KEY([AdresaiId])
REFERENCES [dbo].[Adresai] ([AdresaiId])
GO
ALTER TABLE [dbo].[Sandeliai] CHECK CONSTRAINT [sandelis$FK_sandelis_adresai_AdresaiId]
GO
ALTER TABLE [dbo].[Sandelininkai]  WITH NOCHECK ADD  CONSTRAINT [sandelininkas$FK_sandelininkas_sandeliu_grupe_Id] FOREIGN KEY([SandeliuGrupesId])
REFERENCES [dbo].[SandeliuGrupes] ([SandeliuGrupesId])
GO
ALTER TABLE [dbo].[Sandelininkai] CHECK CONSTRAINT [sandelininkas$FK_sandelininkas_sandeliu_grupe_Id]
GO
ALTER TABLE [dbo].[Sandelininkai]  WITH NOCHECK ADD  CONSTRAINT [sandelininkas$FK_sandelininkas_teises_Id] FOREIGN KEY([TeisesId])
REFERENCES [dbo].[Teises] ([TeisesId])
GO
ALTER TABLE [dbo].[Sandelininkai] CHECK CONSTRAINT [sandelininkas$FK_sandelininkas_teises_Id]
GO
ALTER TABLE [dbo].[SandeliuOperacijos]  WITH NOCHECK ADD  CONSTRAINT [sandelio_operacijos$FK_sandelio_operacijos_operacijostipai_Id] FOREIGN KEY([OperacijuTipaiId])
REFERENCES [dbo].[OperacijuTipai] ([OperacijuTipaiId])
GO
ALTER TABLE [dbo].[SandeliuOperacijos] CHECK CONSTRAINT [sandelio_operacijos$FK_sandelio_operacijos_operacijostipai_Id]
GO
ALTER TABLE [dbo].[SandeliuOperacijos]  WITH NOCHECK ADD  CONSTRAINT [sandelio_operacijos$FK_sandelio_operacijos_partneriai_PartneriaiId] FOREIGN KEY([PartneriaiId])
REFERENCES [dbo].[Partneriai] ([PartneriaiId])
GO
ALTER TABLE [dbo].[SandeliuOperacijos] CHECK CONSTRAINT [sandelio_operacijos$FK_sandelio_operacijos_partneriai_PartneriaiId]
GO
ALTER TABLE [dbo].[SandeliuOperacijos]  WITH NOCHECK ADD  CONSTRAINT [sandelio_operacijos$FK_sandelio_operacijos_prekes_Id] FOREIGN KEY([PrekesId])
REFERENCES [dbo].[Prekes] ([PrekesId])
GO
ALTER TABLE [dbo].[SandeliuOperacijos] CHECK CONSTRAINT [sandelio_operacijos$FK_sandelio_operacijos_prekes_Id]
GO
ALTER TABLE [dbo].[SandeliuOperacijos]  WITH NOCHECK ADD  CONSTRAINT [sandelio_operacijos$FK_sandelio_operacijos_prekes_partija_Id] FOREIGN KEY([PartijosId])
REFERENCES [dbo].[PrekiuPartijos] ([PrekiuPartijosId])
GO
ALTER TABLE [dbo].[SandeliuOperacijos] CHECK CONSTRAINT [sandelio_operacijos$FK_sandelio_operacijos_prekes_partija_Id]
GO
ALTER TABLE [dbo].[SandeliuOperacijos]  WITH NOCHECK ADD  CONSTRAINT [sandelio_operacijos$FK_sandelio_operacijos_sandelininkas_Id] FOREIGN KEY([SandelininkaiId])
REFERENCES [dbo].[Sandelininkai] ([SandelininkaiId])
GO
ALTER TABLE [dbo].[SandeliuOperacijos] CHECK CONSTRAINT [sandelio_operacijos$FK_sandelio_operacijos_sandelininkas_Id]
GO
ALTER TABLE [dbo].[SandeliuOperacijos]  WITH NOCHECK ADD  CONSTRAINT [sandelio_operacijos$FK_sandelio_operacijos_sandelio_vietos_Id] FOREIGN KEY([SandelioVietosId])
REFERENCES [dbo].[SandeliuVietos] ([SandeliuVietosId])
GO
ALTER TABLE [dbo].[SandeliuOperacijos] CHECK CONSTRAINT [sandelio_operacijos$FK_sandelio_operacijos_sandelio_vietos_Id]
GO
ALTER TABLE [dbo].[SandeliuVietos]  WITH NOCHECK ADD  CONSTRAINT [sandelio_vietos$FK_sandeliovietos_prekespartija_Id] FOREIGN KEY([PrekiuPartijosId])
REFERENCES [dbo].[PrekiuPartijos] ([PrekiuPartijosId])
GO
ALTER TABLE [dbo].[SandeliuVietos] CHECK CONSTRAINT [sandelio_vietos$FK_sandeliovietos_prekespartija_Id]
GO
ALTER TABLE [dbo].[SandeliuVietos]  WITH NOCHECK ADD  CONSTRAINT [sandelio_vietos$FK_sandeliovietos_sandeliovietostipas_Id] FOREIGN KEY([SandeliuVietuTipaiId])
REFERENCES [dbo].[SandeliuVietuTipai] ([SandeliuVietuTipaiId])
GO
ALTER TABLE [dbo].[SandeliuVietos] CHECK CONSTRAINT [sandelio_vietos$FK_sandeliovietos_sandeliovietostipas_Id]
GO
ALTER TABLE [dbo].[SandeliuVietos]  WITH NOCHECK ADD  CONSTRAINT [sandelio_vietos$FK_sandeliovietos_sandelis_Id] FOREIGN KEY([SandeliaiId])
REFERENCES [dbo].[Sandeliai] ([SandeliaiId])
GO
ALTER TABLE [dbo].[SandeliuVietos] CHECK CONSTRAINT [sandelio_vietos$FK_sandeliovietos_sandelis_Id]
GO
ALTER TABLE [dbo].[SndeliuGrupiuSandeliai]  WITH NOCHECK ADD  CONSTRAINT [snd_grupes_sandeliai$FK_snd_grupes_sandeliai_sandelis_Id] FOREIGN KEY([SandeliaiId])
REFERENCES [dbo].[Sandeliai] ([SandeliaiId])
GO
ALTER TABLE [dbo].[SndeliuGrupiuSandeliai] CHECK CONSTRAINT [snd_grupes_sandeliai$FK_snd_grupes_sandeliai_sandelis_Id]
GO
ALTER TABLE [dbo].[SndeliuGrupiuSandeliai]  WITH NOCHECK ADD  CONSTRAINT [snd_grupes_sandeliai$FK_snd_grupes_sandeliai_sandeliu_grupe_Id] FOREIGN KEY([SandeliuGrupiuId])
REFERENCES [dbo].[SandeliuGrupes] ([SandeliuGrupesId])
GO
ALTER TABLE [dbo].[SndeliuGrupiuSandeliai] CHECK CONSTRAINT [snd_grupes_sandeliai$FK_snd_grupes_sandeliai_sandeliu_grupe_Id]
GO
ALTER TABLE [dbo].[Vartotojai]  WITH CHECK ADD  CONSTRAINT [FK_Vartotojai_partneriai] FOREIGN KEY([PartneriaiId])
REFERENCES [dbo].[Partneriai] ([PartneriaiId])
GO
ALTER TABLE [dbo].[Vartotojai] CHECK CONSTRAINT [FK_Vartotojai_partneriai]
GO
ALTER TABLE [dbo].[Vartotojai]  WITH CHECK ADD  CONSTRAINT [FK_Vartotojai_sandelininkas] FOREIGN KEY([SandelininkaiId])
REFERENCES [dbo].[Sandelininkai] ([SandelininkaiId])
GO
ALTER TABLE [dbo].[Vartotojai] CHECK CONSTRAINT [FK_Vartotojai_sandelininkas]
GO
ALTER TABLE [dbo].[Vartotojai]  WITH CHECK ADD  CONSTRAINT [FK_Vartotojai_VartotojuTipai] FOREIGN KEY([VartotojaiId])
REFERENCES [dbo].[VartotojuTipai] ([VartotojuTipaiId])
GO
ALTER TABLE [dbo].[Vartotojai] CHECK CONSTRAINT [FK_Vartotojai_VartotojuTipai]
GO
/****** Object:  StoredProcedure [dbo].[usp_Login]    Script Date: 2022-06-09 16:31:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[usp_Login]
  @poValue int = null output,
  @piVartotojoVardas nvarchar(50) = null,
  @piSlaptazodis nvarchar(255) = null,
  @poError nvarchar(max) = null output,
	@poUser nvarchar(max) = null output,
	@poUserId int = null output,
	@poAsmuoId int = null output
as

declare @vError nvarchar(max), @vVartotojuTipaiId int, @vVartotojaiId int, @vVartotojoVardas nvarchar(255)

select @poValue = -1

if not EXISTS(SELECT 1 FROM Vartotojai WHERE VartotojoVardas = @piVartotojoVardas and Slaptazodis = @piSlaptazodis)
	goto ERROR_Pass
	
select 
	@vVartotojaiId = VartotojaiId,
	@vVartotojuTipaiId = VartotojuTipaiId
from Vartotojai
where VartotojoVardas = @piVartotojoVardas and Slaptazodis = @piSlaptazodis
	
select @poValue = @vVartotojuTipaiId
select @poUser = @piVartotojoVardas
select @poUserId = @vVartotojaiId


return
	
ERROR_Pass:
  set @poError = 'Blogas vartotojo vardas arba slaptazodis'


IF @@TRANCOUNT > 0
  ROLLBACK TRANSACTION

return
GO
/****** Object:  StoredProcedure [dbo].[uspd_Adresai]    Script Date: 2022-06-09 16:31:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[uspd_Adresai] 
  @poValue int = null output,
	@piAdresaiId int = null
as

declare @vError nvarchar(max)
	
select @poValue = -1

if not exists (select 1 from Sandeliai where AdresaiId = @piAdresaiId) and not exists (select 1 from Partneriai where AdresaiId = @piAdresaiId) 
delete from Adresai where AdresaiId = @piAdresaiId
	
select @poValue = 0

return

LABEL_Return:

IF @@TRANCOUNT > 0
  ROLLBACK TRANSACTION

return
GO
/****** Object:  StoredProcedure [dbo].[uspd_OperacijuTipai]    Script Date: 2022-06-09 16:31:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[uspd_OperacijuTipai] 
  @poValue int = null output,
	@piOperacijuTipaiId int = null
as

declare @vError nvarchar(max)
	
select @poValue = -1

if not exists (select 1 from SandeliuOperacijos where OperacijuTipaiId = @piOperacijuTipaiId)
delete from OperacijuTipai where OperacijuTipaiId = @piOperacijuTipaiId
	
select @poValue = 0

return

LABEL_Return:

IF @@TRANCOUNT > 0
  ROLLBACK TRANSACTION

return
GO
/****** Object:  StoredProcedure [dbo].[uspd_Partneriai]    Script Date: 2022-06-09 16:31:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[uspd_Partneriai] 
  @poValue int = null output,
	@piPartneriaiId int = null
as

declare @vError nvarchar(max)
	
select @poValue = -1

if not exists (select 1 from SandeliuOperacijos where PartneriaiId = @piPartneriaiId) 
	and not exists (select 1 from Vartotojai where PartneriaiId = @piPartneriaiId) 
	and not exists (select 1 from Prekes where PartneriaiId = @piPartneriaiId) 
delete from Partneriai where PartneriaiId = @piPartneriaiId
	
select @poValue = 0

return

LABEL_Return:

IF @@TRANCOUNT > 0
  ROLLBACK TRANSACTION

return
GO
/****** Object:  StoredProcedure [dbo].[uspd_Prekes]    Script Date: 2022-06-09 16:31:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[uspd_Prekes] 
  @poValue int = null output,
	@piPrekesId int = null
as

declare @vError nvarchar(max)
	
select @poValue = -1

if not exists (select 1 from SandeliuOperacijos where PrekesId = @piPrekesId)
delete from Prekes where PrekesId = @piPrekesId
	
select @poValue = 0

return

LABEL_Return:

IF @@TRANCOUNT > 0
  ROLLBACK TRANSACTION

return
GO
/****** Object:  StoredProcedure [dbo].[uspd_PrekiuTipai]    Script Date: 2022-06-09 16:31:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[uspd_PrekiuTipai] 
  @poValue int = null output,
	@piPrekiuTipaiId int = null
as

declare @vError nvarchar(max)
	
select @poValue = -1

if not exists (select 1 from Prekes where PrekiuTipaiId = @piPrekiuTipaiId)
delete from PrekiuTipai where PrekiuTipaiId = @piPrekiuTipaiId
	
select @poValue = 0

return

LABEL_Return:

IF @@TRANCOUNT > 0
  ROLLBACK TRANSACTION

return
GO
/****** Object:  StoredProcedure [dbo].[uspd_SandelioOperacijos]    Script Date: 2022-06-09 16:31:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[uspd_SandelioOperacijos] 
  @poValue int = null output,
	@piOperacijosId int = null
as

declare @vError nvarchar(max)
	
select @poValue = -1

delete from SandeliuOperacijos where OperacijosId = @piOperacijosId
	
select @poValue = 0

return

LABEL_Return:

IF @@TRANCOUNT > 0
  ROLLBACK TRANSACTION

return
GO
/****** Object:  StoredProcedure [dbo].[uspd_SandeliuVietuTipai]    Script Date: 2022-06-09 16:31:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[uspd_SandeliuVietuTipai] 
  @poValue int = null output,
	@piSandeliuVietuTipuId int = null
as

declare @vError nvarchar(max)
	
select @poValue = -1

if not exists (select 1 from SandeliuVietos where SandeliuVietuTipaiId = @piSandeliuVietuTipuId)
delete from SandeliuVietos where SandeliuVietuTipaiId = @piSandeliuVietuTipuId
	
select @poValue = 0

return

LABEL_Return:

IF @@TRANCOUNT > 0
  ROLLBACK TRANSACTION

return
GO
/****** Object:  StoredProcedure [dbo].[uspd_VartotojuTipai]    Script Date: 2022-06-09 16:31:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[uspd_VartotojuTipai] 
  @poValue int = null output,
	@piVartotojuTipaiId int = null
as

declare @vError nvarchar(max)
	
select @poValue = -1

if not exists (select 1 from Vartotojai where VartotojuTipaiId = @piVartotojuTipaiId)
delete from VartotojuTipai where VartotojuTipaiId = @piVartotojuTipaiId
	
select @poValue = 0

return

LABEL_Return:

IF @@TRANCOUNT > 0
  ROLLBACK TRANSACTION

return
GO
/****** Object:  StoredProcedure [dbo].[uspi_Adresai]    Script Date: 2022-06-09 16:31:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[uspi_Adresai]
  @poValue int = null output,
	@piSalis nvarchar(255) = null,
	@piMiestas nvarchar(255) = null,
	@piAdresas nvarchar(255) = null
as

declare @vError nvarchar(max), @vNewRecId int, @vAdresaiId int
	

select @poValue = -1


select @vAdresaiId = max(AdresaiId)
from Adresai

insert into Adresai(
	--AdresaiId,
	Salis,
	Miestas,
	Adresas
)
values(
	--isnull(@vAdresaiId, 1)  + 1,
	@piSalis,
	@piMiestas,
	@piAdresas)

	
select @vNewRecId = scope_identity()

select @poValue = @vNewRecId

return

LABEL_Return:

IF @@TRANCOUNT > 0
  ROLLBACK TRANSACTION

return
GO
/****** Object:  StoredProcedure [dbo].[uspi_OperacijuTipai]    Script Date: 2022-06-09 16:31:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[uspi_OperacijuTipai]
  @poValue int = null output,
	@piKodas nvarchar(255) = null,
	@piPavadinimas nvarchar(255) = null,
	@piAprasymas nvarchar(255) = null
as

declare @vError nvarchar(max), @vNewRecId int, @vOperacijuTipaiId int
	

select @poValue = -1

if not EXISTS(SELECT 1 FROM OperacijuTipai WHERE Kodas = @piKodas)
begin
	select @vOperacijuTipaiId = max(OperacijuTipaiId)
	from OperacijuTipai

  insert into OperacijuTipai(
    Kodas,
		Pavadinimas,
		Aprasymas
  )
  values(
    @piKodas,
    @piPavadinimas,
		@piAprasymas)
end
	
select @vNewRecId = scope_identity()

select @poValue = @vNewRecId

return

LABEL_Return:

IF @@TRANCOUNT > 0
  ROLLBACK TRANSACTION

return
GO
/****** Object:  StoredProcedure [dbo].[uspi_Partneriai]    Script Date: 2022-06-09 16:31:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[uspi_Partneriai]
  @poValue int = null output,
	@piPavadinimas nvarchar(255) = null,
	@piAdresaiId int = null,
	@piImonesKodas nvarchar(50) = null,
	@piPVMKodas nvarchar(50) = null
as

declare @vError nvarchar(max), @vNewRecId int, @vPartneriaId int
	

select @poValue = -1

select @vPartneriaId = max(PartneriaiId)
from Partneriai

insert into Partneriai(
	Pavadinimas,
	AdresaiId,
	ImonesKodas,
	PVMKodas
)
values(
	@piPavadinimas,
	@piAdresaiId,
	@piImonesKodas,
	@piPVMKodas)

	
select @vNewRecId = scope_identity()

select @poValue = @vNewRecId

return

LABEL_Return:

IF @@TRANCOUNT > 0
  ROLLBACK TRANSACTION

return
GO
/****** Object:  StoredProcedure [dbo].[uspi_Prekes]    Script Date: 2022-06-09 16:31:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[uspi_Prekes]
  @poValue int = null output,
	@piKodas nvarchar(255) = null,
	@piPavadinimas nvarchar(255) = null,
	@piBarkodas nvarchar(255) = null,
	@piPrekiuTipaiId int = null,
	@piKiekis float = null,
	@piPartneriaiId int = null
as

declare @vError nvarchar(max), @vNewRecId int, @vPrekesId int
	

select @poValue = -1


select @vPrekesId = max(PrekesId)
from Prekes

insert into Prekes(
	Kodas,
	Pavadinimas,
	Barkodas,
	PrekiuTipaiId,
	Kiekis,
	PartneriaiId
)
values(
	@piKodas,
	@piPavadinimas,
	@piBarkodas,
	@piPrekiuTipaiId,
	@piKiekis,
	@piPartneriaiId)

	
select @vNewRecId = scope_identity()

select @poValue = @vNewRecId

return

LABEL_Return:

IF @@TRANCOUNT > 0
  ROLLBACK TRANSACTION

return
GO
/****** Object:  StoredProcedure [dbo].[uspi_PrekiuPartijos]    Script Date: 2022-06-09 16:31:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[uspi_PrekiuPartijos]
  @poValue int = null output,
	@piKodas nvarchar(255) = null,
	@piSerijosNumeris int = null,
	@piKiekis float = null,
	@piPrekesId int = null,
	@piGaliojimoData datetime = null
as

declare @vError nvarchar(max), @vNewRecId int, @vPrekiuPartijosId int
	

select @poValue = -1


select @vPrekiuPartijosId = max(PrekiuPartijosId)
from PrekiuPartijos

insert into PrekiuPartijos(
	Kodas,
	SerijosNumeris,
	Kiekis,
	PrekesId,
	PartijosData,
	GaliojimoData
)
values(
	@piKodas,
	@piSerijosNumeris,
	@piKiekis,
	@piPrekesId,
	getdate(),
	@piGaliojimoData)

	
select @vNewRecId = scope_identity()

select @poValue = @vNewRecId

return

LABEL_Return:

IF @@TRANCOUNT > 0
  ROLLBACK TRANSACTION

return
GO
/****** Object:  StoredProcedure [dbo].[uspi_PrekiuTipai]    Script Date: 2022-06-09 16:31:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[uspi_PrekiuTipai]
  @poValue int = null output,
	@piKodas nvarchar(255) = null,
	@piPavadinimas nvarchar(255) = null,
	@piAprasymas nvarchar(255) = null
as

declare @vError nvarchar(max), @vNewRecId int, @vPrekiuTipaiId int
	

select @poValue = -1

if not EXISTS(SELECT 1 FROM PrekiuTipai WHERE Kodas = @piKodas)
begin
	select @vPrekiuTipaiId = max(PrekiuTipaiId)
	from PrekiuTipai

  insert into PrekiuTipai(
    Kodas,
		Pavadinimas,
		Aprasymas
  )
  values(
    @piKodas,
    @piPavadinimas,
		@piAprasymas)
end
	
select @vNewRecId = scope_identity()

select @poValue = @vNewRecId

return

LABEL_Return:

IF @@TRANCOUNT > 0
  ROLLBACK TRANSACTION

return
GO
/****** Object:  StoredProcedure [dbo].[uspi_Sandeliai]    Script Date: 2022-06-09 16:31:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[uspi_Sandeliai]
  @poValue int = null output,
	@piKodas nvarchar(255) = null,
	@piPavadinimas nvarchar(255) = null,
	@piAdresaiId int = null,
	@piSandeliuGrupesId int = null
as

declare @vError nvarchar(max), @vNewRecId int, @vSandeliaiId int
	

select @poValue = -1

if not EXISTS(SELECT 1 FROM Sandeliai WHERE Kodas = @piKodas)
begin
	select @vSandeliaiId = max(SandeliaiId)
	from Sandeliai

  insert into Sandeliai(
    Kodas,
		Pavadinimas,
		AdresaiId,
		SandeliuGrupesId
  )
  values(
    @piKodas,
    @piPavadinimas,
		@piAdresaiId,
		@piSandeliuGrupesId)
end
	
select @vNewRecId = scope_identity()

select @poValue = @vNewRecId

return

LABEL_Return:

IF @@TRANCOUNT > 0
  ROLLBACK TRANSACTION

return
GO
/****** Object:  StoredProcedure [dbo].[uspi_Sandelininkai]    Script Date: 2022-06-09 16:31:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[uspi_Sandelininkai]
  @poValue int = null output,
	@piKodas nvarchar(255) = null,
	@piPavadinimas nvarchar(255) = null,
	@piVardas nvarchar(255) = null,
	@piPavarde nvarchar(255) = null,
	@piSandeliuGrupesId int = null,
	@piTeisesId int = null
as

declare @vError nvarchar(max), @vNewRecId int, @vSandelininkaiId int
	

select @poValue = -1

if not EXISTS(SELECT 1 FROM Sandelininkai WHERE Kodas = @piKodas)
begin
	select @vSandelininkaiId = max(SandelininkaiId)
	from Sandelininkai

  insert into Sandelininkai(
    SandelininkaiId,
    Kodas,
		Pavadinimas,
		Vardas,
		Pavarde,
		SandeliuGrupesId,
		TeisesId
  )
  values(
		@vSandelininkaiId + 1,
    @piKodas,
    @piPavadinimas,
		@piVardas,
		@piPavarde,
		@piSandeliuGrupesId,
		@piTeisesId)
end
	
select @vNewRecId = scope_identity()

select @poValue = @vNewRecId

return

LABEL_Return:

IF @@TRANCOUNT > 0
  ROLLBACK TRANSACTION

return
GO
/****** Object:  StoredProcedure [dbo].[uspi_SandelioOperacijos]    Script Date: 2022-06-09 16:31:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[uspi_SandelioOperacijos]
  @poValue int = null output,
  @piSandelininkaiId int = null,
	@piSandelioVietosId int = null,
	@piPrekesId int = null,
	@piPartijosId int = null,
	@piKiekis float = null,
	@piPartneriaiId int = null,
	@piOperacijuTipaiId int = null
as

declare @vError nvarchar(max), @vNewRecId int, @vOperacijosId int
	

select @poValue = -1


select @vOperacijosId = max(OperacijosId)
from SandeliuOperacijos

insert into SandeliuOperacijos(
	SandelininkaiId,
	SandelioVietosId,
	PrekesId,
	PartijosId,
	Kiekis,
	OperacijuTipaiId,
	PartneriaiId
)
values(
	@piSandelininkaiId,
	@piSandelioVietosId,
	@piPrekesId,
	@piPartijosId,
	@piKiekis,
	@piOperacijuTipaiId,
	@piPartneriaiId)
	
select @vNewRecId = scope_identity()

select @poValue = @vNewRecId

return

LABEL_Return:

IF @@TRANCOUNT > 0
  ROLLBACK TRANSACTION

return
GO
/****** Object:  StoredProcedure [dbo].[uspi_SandeliuGrupes]    Script Date: 2022-06-09 16:31:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[uspi_SandeliuGrupes]
  @poValue int = null output,
	@piKodas nvarchar(255) = null,
	@piPavadinimas nvarchar(255) = null,
	@piAprasymas nvarchar(255) = null
as

declare @vError nvarchar(max), @vNewRecId int, @vSandeliuGrupesId int
	

select @poValue = -1

if not EXISTS(SELECT 1 FROM SandeliuGrupes WHERE Kodas = @piKodas)
begin
	select @vSandeliuGrupesId = max(SandeliuGrupesId)
	from SandeliuGrupes

  insert into SandeliuGrupes(
    SandeliuGrupesId,
    Kodas,
		Pavadinimas,
		Aprasymas		
  )
  values(
		@vSandeliuGrupesId + 1,
    @piKodas,
    @piPavadinimas,
		@piAprasymas)
end
	
select @vNewRecId = scope_identity()

select @poValue = @vNewRecId

return

LABEL_Return:

IF @@TRANCOUNT > 0
  ROLLBACK TRANSACTION

return
GO
/****** Object:  StoredProcedure [dbo].[uspi_SandeliuVietos]    Script Date: 2022-06-09 16:31:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[uspi_SandeliuVietos]
  @poValue int = null output,
	@piKodas nvarchar(255) = null,
	@piPavadinimas nvarchar(255) = null,
	@piSandeliaiId int = null,
	@piPrekiuPartijosId int = null,
	@piSandeliuVietuTipaiId int = null
as

declare @vError nvarchar(max), @vNewRecId int, @vSandeliuVietosId int
	

select @poValue = -1

if not EXISTS(SELECT 1 FROM SandeliuVietos WHERE Kodas = @piKodas)
begin
	select @vSandeliuVietosId = max(SandeliuVietosId)
	from SandeliuVietos

  insert into SandeliuVietos(
    SandeliuVietosId,
    Kodas,
		Pavadinimas,
		SandeliaiId,
		PrekiuPartijosId,
		SandeliuVietuTipaiId
  )
  values(
		@vSandeliuVietosId + 1,
    @piKodas,
    @piPavadinimas,
		@piSandeliaiId,
		@piPrekiuPartijosId,
		@piSandeliuVietuTipaiId)
end
	
select @vNewRecId = scope_identity()

select @poValue = @vNewRecId

return

LABEL_Return:

IF @@TRANCOUNT > 0
  ROLLBACK TRANSACTION

return
GO
/****** Object:  StoredProcedure [dbo].[uspi_SandeliuVietuTipai]    Script Date: 2022-06-09 16:31:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[uspi_SandeliuVietuTipai]
  @poValue int = null output,
	@piKodas nvarchar(255) = null,
	@piPavadinimas nvarchar(255) = null,
	@piAprasymas nvarchar(255) = null
as

declare @vError nvarchar(max), @vNewRecId int, @vSandeliuVietuTipuId int
	

select @poValue = -1

if not EXISTS(SELECT 1 FROM SandeliuVietuTipai WHERE Kodas = @piKodas)
begin
	select @vSandeliuVietuTipuId = max(SandeliuVietuTipaiId)
	from SandeliuVietuTipai

  insert into SandeliuVietuTipai(
    SandeliuVietuTipaiId,
    Kodas,
		Pavadinimas,
		Aprasymas
  )
  values(
		@vSandeliuVietuTipuId + 1,
    @piKodas,
    @piPavadinimas,
		@piAprasymas)
end
	
select @vNewRecId = scope_identity()

select @poValue = @vNewRecId

return

LABEL_Return:

IF @@TRANCOUNT > 0
  ROLLBACK TRANSACTION

return
GO
/****** Object:  StoredProcedure [dbo].[uspi_Teises]    Script Date: 2022-06-09 16:31:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[uspi_Teises]
  @poValue int = null output,
	@piKodas nvarchar(255) = null,
	@piPavadinimas nvarchar(255) = null,
	@piAprasymas nvarchar(255) = null
as

declare @vError nvarchar(max), @vNewRecId int, @vTeisesId int
	

select @poValue = -1

if not EXISTS(SELECT 1 FROM Teises WHERE Kodas = @piKodas)
begin
	select @vTeisesId = max(TeisesId)
	from Teises

  insert into Teises(
    TeisesId,
    Kodas,
		Pavadinimas,
		Aprasymas
  )
  values(
		@vTeisesId + 1,
    @piKodas,
    @piPavadinimas,
		@piAprasymas)
end
	
select @vNewRecId = scope_identity()

select @poValue = @vNewRecId

return

LABEL_Return:

IF @@TRANCOUNT > 0
  ROLLBACK TRANSACTION

return
GO
/****** Object:  StoredProcedure [dbo].[uspi_Vartotojai]    Script Date: 2022-06-09 16:31:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[uspi_Vartotojai]
  @poValue nvarchar(255) = null output,
 	@piVartotojoVardas nvarchar(50) = null,
	@piSandelininkaiId int = null,
	@piPartneriaiId int = null,
	@piVartotojuTipaiId int = null,
	@piSlaptazodis nvarchar(255) = null
as

declare @vError nvarchar(max), @vVartotojaiId int
	

select @poValue = -1

if not EXISTS(SELECT 1 FROM Vartotojai WHERE VartotojoVardas = @piVartotojoVardas)
begin
  --https://blog.sqlauthority.com/2018/07/08/how-to-generate-random-password-in-sql-server-interview-question-of-the-week-181/
  if isnull(@piSlaptazodis, '') = ''
  begin
    DECLARE @char CHAR = ''
    DECLARE @charI INT = 0
    --DECLARE @password VARCHAR(100) = ''
    DECLARE @len INT = 12 -- Length of Password
    WHILE @len > 0
    BEGIN
      SET @charI = ROUND(RAND()*100,0)
      SET @char = CHAR(@charI)
     
    IF @charI > 48 AND @charI < 122
    BEGIN
      SET @piSlaptazodis += @char
      SET @len = @len - 1
    END
    END
      SELECT @piSlaptazodis [PassWord]
  end

	select @vVartotojaiId = max(VartotojaiId)
	from Vartotojai

  insert into Vartotojai(
		VartotojaiId,
    VartotojoVardas,
    SandelininkaiId,
    PartneriaiId,
    VartotojuTipaiId,
    Slaptazodis
  )
  values(
		@vVartotojaiId + 1,
    @piVartotojoVardas,
    @piSandelininkaiId,
    @piPartneriaiId,
    @piVartotojuTipaiId,
    @piSlaptazodis)
end
  else select @piSlaptazodis = Slaptazodis from Vartotojai where VartotojoVardas = @piVartotojoVardas

select @poValue = @piSlaptazodis

return

LABEL_Return:

IF @@TRANCOUNT > 0
  ROLLBACK TRANSACTION

return
GO
/****** Object:  StoredProcedure [dbo].[uspi_VartotojuTipai]    Script Date: 2022-06-09 16:31:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[uspi_VartotojuTipai]
  @poValue int = null output,
	@piPavadinimas nvarchar(255) = null
as

declare @vError nvarchar(max), @vNewRecId int, @vVartotojuTipaiId int
	

select @poValue = -1


select @vVartotojuTipaiId = max(VartotojuTipaiId)
from VartotojuTipai

insert into VartotojuTipai(
	VartotojuTipaiId,
	Pavadinimai
)
values(
	@vVartotojuTipaiId + 1,
	@piPavadinimas)

	
select @vNewRecId = scope_identity()

select @poValue = @vNewRecId

return

LABEL_Return:

IF @@TRANCOUNT > 0
  ROLLBACK TRANSACTION

return
GO
/****** Object:  StoredProcedure [dbo].[uspu_Adresai]    Script Date: 2022-06-09 16:31:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[uspu_Adresai]
  @poValue int = null output,
	@piAdresaiId int = null,
  @piSalis nvarchar(255) = null,
	@piMiestas nvarchar(255) = null,
	@piAdresas nvarchar(255) = null
as

declare @vError nvarchar(max), @vCurrSalis nvarchar(255), @vCurrMiestas nvarchar(255), @vCurrAdresas nvarchar(255), 
	@vCurrAsmensKodas nvarchar(255)
	

select @poValue = -1

select 
	@vCurrSalis = Salis,
	@vCurrMiestas = Miestas,
	@vCurrAdresas = Adresas
from Adresai
where AdresaiId = @piAdresaiId

update Adresai set
	Salis = @piSalis,
	Miestas = @piMiestas,
	Adresas = @piAdresas
where AdresaiId = @piAdresaiId




return

LABEL_Return:

IF @@TRANCOUNT > 0
  ROLLBACK TRANSACTION

return
GO
/****** Object:  StoredProcedure [dbo].[uspu_OperacijuTipai]    Script Date: 2022-06-09 16:31:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[uspu_OperacijuTipai]
  @poValue int = null output,
	@piOperacijuTipaiId int = null,
  @piKodas nvarchar(255) = null,
	@piPavadinimas nvarchar(255) = null,
	@piAprasymas nvarchar(255) = null
as

declare @vError nvarchar(max), @vCurrKodas nvarchar(255), @vCurrPavadinimas nvarchar(255), @vCurrAprasymas nvarchar(255)
	

select @poValue = -1

select 
	@vCurrKodas = Kodas,
	@vCurrPavadinimas = Pavadinimas,
	@vCurrAprasymas = Aprasymas
from OperacijuTipai
where OperacijuTipaiId = @piOperacijuTipaiId

update OperacijuTipai set
	Kodas = case when @piKodas is not null then @piKodas else @vCurrKodas end,
	Aprasymas = @piAprasymas,
	Pavadinimas = @piPavadinimas
where OperacijuTipaiId = @piOperacijuTipaiId




return

LABEL_Return:

IF @@TRANCOUNT > 0
  ROLLBACK TRANSACTION

return
GO
/****** Object:  StoredProcedure [dbo].[uspu_Partneriai]    Script Date: 2022-06-09 16:31:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[uspu_Partneriai]
  @poValue int = null output,
	@piPartneriaiId int = null,
  @piPavadinimas nvarchar(255) = null,
	@piAdresaiId int = null,
	@piImonesKodas nvarchar(50) = null,
	@piPVMKodas nvarchar(50) = null
as

declare @vError nvarchar(max), @vCurrKodas nvarchar(255), @vCurrPavadinimas nvarchar(255), @vCurrImonesKodas nvarchar(255), 
	@vCurrPVMKodas nvarchar(255)
	

select @poValue = -1

select 
	@vCurrPavadinimas = Pavadinimas,
	@vCurrImonesKodas = ImonesKodas,
	@vCurrPVMKodas = PVMKodas
from Partneriai
where PartneriaiId = @piPartneriaiId

update Partneriai set
	Pavadinimas = case when @piPavadinimas is not null then @piPavadinimas else @vCurrPavadinimas end,
	AdresaiId = @piAdresaiId,
	ImonesKodas = @piImonesKodas,
	PVMKodas = @piImonesKodas
where PartneriaiId = @piPartneriaiId




return

LABEL_Return:

IF @@TRANCOUNT > 0
  ROLLBACK TRANSACTION

return
GO
/****** Object:  StoredProcedure [dbo].[uspu_Prekes]    Script Date: 2022-06-09 16:31:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[uspu_Prekes]
  @poValue int = null output,
	@piPrekesId int = null,
  @piKodas nvarchar(255) = null,
	@piPavadinimas nvarchar(255) = null,
	@piBarkodas nvarchar(255) = null,
	@piPrekiuTipaiId int = null,
	@piKiekis float = null,
	@piPartneriaiId int = null
as

declare @vError nvarchar(max), @vCurrKodas nvarchar(255), @vCurrPavadinimas nvarchar(255), @vCurrBarkodas nvarchar(255), @vCurrKiekis float, @vCurrPrekiuTipaiId int, @vCurrPartneriaiId int
	

select @poValue = -1

select 
	@vCurrKodas = Kodas,
	@vCurrPavadinimas = Pavadinimas,
	@vCurrBarkodas = Barkodas,
	@vCurrPrekiuTipaiId = PrekiuTipaiId,
	@vCurrKiekis = Kiekis,
	@vCurrPartneriaiId = PartneriaiId
from Prekes
where PrekesId = @piPrekesId

update Prekes set
	Kodas = case when @piKodas is not null then @piKodas else @vCurrKodas end,
	Pavadinimas = @piPavadinimas,
	Barkodas = @piBarkodas,
	PrekiuTipaiId = @piPrekiuTipaiId,
	Kiekis = @piKiekis,
	PartneriaiId = @piPartneriaiId
where PrekesId = @piPrekesId




return

LABEL_Return:

IF @@TRANCOUNT > 0
  ROLLBACK TRANSACTION

return
GO
/****** Object:  StoredProcedure [dbo].[uspu_PrekiuPartijos]    Script Date: 2022-06-09 16:31:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[uspu_PrekiuPartijos]
  @poValue int = null output,
	@piPrekiuPartijosId int = null,
  @piKodas nvarchar(255) = null,
	@piSerijosNumeris int = null,
	@piKiekis float = null,
	@piPrekesId int = null,
	@piGaliojimoData datetime = null
as

declare @vError nvarchar(max), @vCurrKodas nvarchar(255), @vCurrPavadinimas nvarchar(255), @vCurrSerijosNumeris int, @vCurrKiekis float, @vCurrPrekesId int, @vCurrGaliojimoData datetime
	

select @poValue = -1

select 
	@vCurrKodas = Kodas,
	@vCurrSerijosNumeris = SerijosNumeris,
	@vCurrKiekis = Kiekis,
	@vCurrPrekesId = PrekesId,
	@vCurrGaliojimoData = GaliojimoData
from PrekiuPartijos
where PrekiuPartijosId = @piPrekiuPartijosId

update PrekiuPartijos set
	Kodas = case when @piKodas is not null then @piKodas else @vCurrKodas end,
	SerijosNumeris = @piSerijosNumeris,
	Kiekis = @piKiekis,
	PrekesId = @piPrekesId,
	GaliojimoData = @piGaliojimoData
where PrekiuPartijosId = @piPrekiuPartijosId




return

LABEL_Return:

IF @@TRANCOUNT > 0
  ROLLBACK TRANSACTION

return
GO
/****** Object:  StoredProcedure [dbo].[uspu_PrekiuTipai]    Script Date: 2022-06-09 16:31:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[uspu_PrekiuTipai]
  @poValue int = null output,
	@piPrekiuTipaiId int = null,
  @piKodas nvarchar(255) = null,
	@piPavadinimas nvarchar(255) = null,
	@piAprasymas nvarchar(255) = null
as

declare @vError nvarchar(max), @vCurrKodas nvarchar(255), @vCurrPavadinimas nvarchar(255), @vCurrAprasymas nvarchar(255), 
	@vCurrAsmensKodas nvarchar(255)
	

select @poValue = -1

select 
	@vCurrKodas = Kodas,
	@vCurrPavadinimas = Pavadinimas,
	@vCurrAprasymas = Aprasymas
from PrekiuTipai
where PrekiuTipaiId = @piPrekiuTipaiId

update PrekiuTipai set
	Kodas = case when @piKodas is not null then @piKodas else @vCurrKodas end,
	Aprasymas = @piAprasymas,
	Pavadinimas = @piPavadinimas
where PrekiuTipaiId = @piPrekiuTipaiId




return

LABEL_Return:

IF @@TRANCOUNT > 0
  ROLLBACK TRANSACTION

return
GO
/****** Object:  StoredProcedure [dbo].[uspu_Sandeliai]    Script Date: 2022-06-09 16:31:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[uspu_Sandeliai]
  @poValue int = null output,
	@piSandeliaiId int = null,
  @piKodas nvarchar(255) = null,
	@piPavadinimas nvarchar(255) = null,
	@piAdresaiId int = null,
	@piSandeliuGrupesId int = null
as

declare @vError nvarchar(max), @vCurrKodas nvarchar(255), @vCurrPavadinimas nvarchar(255)
	

select @poValue = -1

select 
	@vCurrKodas = Kodas,
	@vCurrPavadinimas = Pavadinimas
from SandeliuVietos
where SandeliaiId = @piSandeliaiId

update Sandeliai set
	Kodas = case when @piKodas is not null then @piKodas else @vCurrKodas end,
	Pavadinimas = @piPavadinimas,
	AdresaiId = @piAdresaiId,
	SandeliuGrupesId = @piSandeliuGrupesId
where SandeliaiId = @piSandeliaiId




return

LABEL_Return:

IF @@TRANCOUNT > 0
  ROLLBACK TRANSACTION

return
GO
/****** Object:  StoredProcedure [dbo].[uspu_Sandelininkai]    Script Date: 2022-06-09 16:31:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[uspu_Sandelininkai]
  @poValue int = null output,
	@piSandelininkaiId int = null,
  @piKodas nvarchar(255) = null,
	@piPavadinimas nvarchar(255) = null,
	@piVardas nvarchar(255) = null,
	@piPavarde nvarchar(255) = null,
	@piSandeliuGrupesId int = null,
	@piTeisesId int = null
as

declare @vError nvarchar(max), @vCurrKodas nvarchar(255), @vCurrPavadinimas nvarchar(255), @vCurrVardas nvarchar(255), @vCurrPavarde nvarchar(255), @vCurrSandeliuGrupesId int,
	@vCurrTeisesId int
	

select @poValue = -1

select 
	@vCurrKodas = Kodas,
	@vCurrPavadinimas = Pavadinimas,
	@vCurrVardas = Vardas,
	@vCurrPavarde = Pavarde,
	@vCurrSandeliuGrupesId = SandeliuGrupesId,
	@vCurrTeisesId = TeisesId
from Sandelininkai
where SandelininkaiId = @piSandelininkaiId

update Sandelininkai set
	Kodas = case when @piKodas is not null then @piKodas else @vCurrKodas end,
	Pavadinimas = @piPavadinimas,
	Vardas = @piVardas,
	Pavarde = @piPavarde,
	SandeliuGrupesId = @piSandeliuGrupesId,
	TeisesId = @piTeisesId
where SandelininkaiId = @piSandelininkaiId




return

LABEL_Return:

IF @@TRANCOUNT > 0
  ROLLBACK TRANSACTION

return
GO
/****** Object:  StoredProcedure [dbo].[uspu_SandelioOperacijos]    Script Date: 2022-06-09 16:31:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[uspu_SandelioOperacijos]
  @poValue int = null output,
	@piOperacijosId int = null,
  @piSandelininkaiId int = null,
	@piSandelioVietosId int = null,
	@piPrekesId int = null,
	@piPartijosId int = null,
	@piKiekis float = null,
	@piPartneriaiId int = null
as

declare @vError nvarchar(max)
	

select @poValue = -1


update SandeliuOperacijos set
	SandelininkaiId = @piSandelininkaiId,
	SandelioVietosId = @piSandelioVietosId,
	PrekesId = @piPrekesId,
	PartijosId = @piPartijosId,
	Kiekis = @piKiekis,
	PartneriaiId = @piPartneriaiId
where OperacijosId = @piOperacijosId




return

LABEL_Return:

IF @@TRANCOUNT > 0
  ROLLBACK TRANSACTION

return
GO
/****** Object:  StoredProcedure [dbo].[uspu_SandeliuGrupes]    Script Date: 2022-06-09 16:31:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[uspu_SandeliuGrupes]
  @poValue int = null output,
	@piSandeliuGrupesId int = null,
  @piKodas nvarchar(255) = null,
	@piPavadinimas nvarchar(255) = null,
	@piAprasymas nvarchar(255) = null
as

declare @vError nvarchar(max), @vCurrKodas nvarchar(255), @vCurrPavadinimas nvarchar(255), @vCurrAprasymas nvarchar(255), 
	@vCurrAsmensKodas nvarchar(255)
	

select @poValue = -1

select 
	@vCurrKodas = Kodas,
	@vCurrPavadinimas = Pavadinimas,
	@vCurrAprasymas = Aprasymas
from SandeliuGrupes
where SandeliuGrupesId = @piSandeliuGrupesId

update SandeliuGrupes set
	Kodas = case when @piKodas is not null then @piKodas else @vCurrKodas end,
	Aprasymas = @piAprasymas,
	Pavadinimas = @piPavadinimas
where SandeliuGrupesId = @piSandeliuGrupesId




return

LABEL_Return:

IF @@TRANCOUNT > 0
  ROLLBACK TRANSACTION

return
GO
/****** Object:  StoredProcedure [dbo].[uspu_SandeliuVietos]    Script Date: 2022-06-09 16:31:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[uspu_SandeliuVietos]
  @poValue int = null output,
	@piSandeliuVietosId int = null,
  @piKodas nvarchar(255) = null,
	@piPavadinimas nvarchar(255) = null,
	@piSandeliaiId int = null,
	@piPrekiuPartijosId int = null,
	@piSandeliuVietuTipuId int = null
as

declare @vError nvarchar(max), @vCurrKodas nvarchar(255), @vCurrPavadinimas nvarchar(255)
	

select @poValue = -1

select 
	@vCurrKodas = Kodas,
	@vCurrPavadinimas = Pavadinimas
from SandeliuVietos
where SandeliuVietosId = @piSandeliuVietosId

update SandeliuVietos set
	Kodas = case when @piKodas is not null then @piKodas else @vCurrKodas end,
	Pavadinimas = @piPavadinimas,
	SandeliaiId = @piSandeliaiId,
	PrekiuPartijosId = @piPrekiuPartijosId,
	SandeliuVietuTipaiId = @piSandeliuVietuTipuId
where SandeliuVietosId = @piSandeliuVietosId




return

LABEL_Return:

IF @@TRANCOUNT > 0
  ROLLBACK TRANSACTION

return
GO
/****** Object:  StoredProcedure [dbo].[uspu_SandeliuVietuTipai]    Script Date: 2022-06-09 16:31:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[uspu_SandeliuVietuTipai]
  @poValue int = null output,
	@piSandeliuVietuTipuId int = null,
  @piKodas nvarchar(255) = null,
	@piPavadinimas nvarchar(255) = null,
	@piAprasymas nvarchar(255) = null
as

declare @vError nvarchar(max), @vCurrKodas nvarchar(255), @vCurrPavadinimas nvarchar(255), @vCurrAprasymas nvarchar(255), 
	@vCurrAsmensKodas nvarchar(255)
	

select @poValue = -1

select 
	@vCurrKodas = Kodas,
	@vCurrPavadinimas = Pavadinimas,
	@vCurrAprasymas = Aprasymas
from SandeliuVietuTipai
where SandeliuVietuTipaiId = @piSandeliuVietuTipuId

update SandeliuVietuTipai set
	Kodas = case when @piKodas is not null then @piKodas else @vCurrKodas end,
	Aprasymas = @piAprasymas,
	Pavadinimas = @piPavadinimas
where SandeliuVietuTipaiId = @piSandeliuVietuTipuId




return

LABEL_Return:

IF @@TRANCOUNT > 0
  ROLLBACK TRANSACTION

return
GO
/****** Object:  StoredProcedure [dbo].[uspu_Teises]    Script Date: 2022-06-09 16:31:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[uspu_Teises]
  @poValue int = null output,
	@piTeisesId int = null,
  @piKodas nvarchar(255) = null,
	@piPavadinimas nvarchar(255) = null,
	@piAprasymas nvarchar(255) = null
as

declare @vError nvarchar(max), @vCurrKodas nvarchar(255), @vCurrPavadinimas nvarchar(255), @vCurrAprasymas nvarchar(255)
	

select @poValue = -1

select 
	@vCurrKodas = Kodas,
	@vCurrPavadinimas = Pavadinimas,
	@vCurrAprasymas = Aprasymas
from Teises
where TeisesId = @piTeisesId

update Teises set
	Kodas = case when @piKodas is not null then @piKodas else @vCurrKodas end,
	Aprasymas = @piAprasymas,
	Pavadinimas = @piPavadinimas
where TeisesId = @piTeisesId




return

LABEL_Return:

IF @@TRANCOUNT > 0
  ROLLBACK TRANSACTION

return
GO
/****** Object:  StoredProcedure [dbo].[uspu_Vartotojai]    Script Date: 2022-06-09 16:31:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[uspu_Vartotojai]
  @poValue int = null output,
	@piVartotojaiId int = null,
	@piSandelininkaiId int = null,
	@piPartneriaiId int = null,
	@piVartotojuTipaiId int = null,
	@piSlaptazodis nvarchar(50) = null
as

declare @vError nvarchar(max)
	

select @poValue = -1


update Vartotojai set
	SandelininkaiId = @piSandelininkaiId,
	PartneriaiId = @piPartneriaiId,
	VartotojuTipaiId = @piVartotojuTipaiId,
	Slaptazodis = @piSlaptazodis
where VartotojaiId = @piVartotojaiId


return

LABEL_Return:

IF @@TRANCOUNT > 0
  ROLLBACK TRANSACTION

return
GO
/****** Object:  StoredProcedure [dbo].[uspu_VartotojuTipai]    Script Date: 2022-06-09 16:31:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[uspu_VartotojuTipai]
  @poValue int = null output,
	@piVartotojuTipaiId int = null,
	@piPavadinimas nvarchar(255) = null
as

declare @vError nvarchar(max), @vCurrKodas nvarchar(255), @vCurrPavadinimas nvarchar(255), @vCurrAprasymas nvarchar(255), 
	@vCurrAsmensKodas nvarchar(255)
	

select @poValue = -1

update VartotojuTipai set
	Pavadinimai = @piPavadinimas
where VartotojuTipaiId = @piVartotojuTipaiId




return

LABEL_Return:

IF @@TRANCOUNT > 0
  ROLLBACK TRANSACTION

return
GO
/****** Object:  StoredProcedure [dbo].[uspv_Adresai]    Script Date: 2022-06-09 16:31:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[uspv_Adresai]
  @poValue int = null output,
	@piAdresaiId int = null,
	@piEditForm int = null
as

declare @vError nvarchar(max)

select @poValue = -1

select @piEditForm = isnull(@piEditForm, 0) 

if @piEditForm = 0
	select 
		AdresaiId = AdresaiId,
		Salis = Salis,
		Miestas = Miestas,
		Adresas = Adresas
	from Adresai

if @piEditForm = 1
	select 
		AdresaiId = AdresaiId,
		Salis = Salis,
		Miestas = Miestas,
		Adresas = Adresas
	from Adresai
	where AdresaiId = @piAdresaiId

return

LABEL_Return:

IF @@TRANCOUNT > 0
  ROLLBACK TRANSACTION

return
GO
/****** Object:  StoredProcedure [dbo].[uspv_OperacijuTipai]    Script Date: 2022-06-09 16:31:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[uspv_OperacijuTipai]
  @poValue int = null output,
	@piOperacijuTipaiId int = null,
	@piEditForm int = null
as

declare @vError nvarchar(max)

select @poValue = -1

select @piEditForm = isnull(@piEditForm, 0) 

if @piEditForm = 0
	select 
		OperacijuTipaiId = OperacijuTipaiId,
		Kodas = Kodas,
		Pavadinimas = Pavadinimas,
		Aprasymas = Aprasymas
	from OperacijuTipai

if @piEditForm = 1
	select 
		OperacijuTipaiId = OperacijuTipaiId,
		Kodas = Kodas,
		Pavadinimas = Pavadinimas,
		Aprasymas = Aprasymas
	from OperacijuTipai
	where OperacijuTipaiId = @piOperacijuTipaiId

return

LABEL_Return:

IF @@TRANCOUNT > 0
  ROLLBACK TRANSACTION

return
GO
/****** Object:  StoredProcedure [dbo].[uspv_Partneriai]    Script Date: 2022-06-09 16:31:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[uspv_Partneriai]
  @poValue int = null output,
	@piPartneriaiId int = null,
	@piEditForm int = null
as

declare @vError nvarchar(max)

select @poValue = -1

select @piEditForm = isnull(@piEditForm, 0) 

if @piEditForm = 0
	select 
		PartneriaiId = p.PartneriaiId,
		Pavadinimas = p.Pavadinimas,
		Adresas = a.Adresas,
		Miestas = a.Miestas,
		Salis = a.Salis,
		ImonesKodas = p.ImonesKodas,
		PVMKodas = p.PVMKodas
	from Partneriai p
		left join Adresai a on a.AdresaiId = p.AdresaiId


if @piEditForm = 1
	select 
		PartneriaiId = p.PartneriaiId,
		Pavadinimas = p.Pavadinimas,
		Adresas = a.Adresas,
		Miestas = a.Miestas,
		Salis = a.Salis,
		ImonesKodas = p.ImonesKodas,
		PVMKodas = p.PVMKodas
	from Partneriai p
		left join Adresai a on a.AdresaiId = p.AdresaiId
	where p.PartneriaiId = @piPartneriaiId

return

LABEL_Return:

IF @@TRANCOUNT > 0
  ROLLBACK TRANSACTION

return
GO
/****** Object:  StoredProcedure [dbo].[uspv_Prekes]    Script Date: 2022-06-09 16:31:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[uspv_Prekes]
  @poValue int = null output,
	@piPrekesId int = null,
	@piPartneriaiId int = null,
	@piEditForm int = null
as

declare @vError nvarchar(max)

select @poValue = -1

select @piEditForm = isnull(@piEditForm, 0) 

if @piEditForm = 0
	select 
		PrekesId = p.PrekesId,
		PrKodas = p.Kodas,
		PrPavadinimas = p.Pavadinimas,
		PrBarkodas = p.Barkodas,
		Kiekis = p.Kiekis,
		PTPavadinimas = pt.Pavadinimas,
		PrekiuTipaiId = pt.PrekiuTipaiId
	from Prekes p
		left join Partneriai part on part.PartneriaiId = p.PartneriaiId
		inner join PrekiuTipai pt on pt.PrekiuTipaiId = p.PrekiuTipaiId
	--where part.PartneriaiId = case when isnull(@piPartneriaiId, 0) > 0 then @piPartneriaiId else part.PartneriaiId end

if @piEditForm = 1
	select distinct
		PrekesId = p.PrekesId,
		PrKodas = p.Kodas,
		PrPavadinimas = p.Pavadinimas,
		PrBarkodas = p.Barkodas,
		Kiekis = p.Kiekis,
		PTPavadinimas = pt.Pavadinimas,
		PrekiuTipaiId = pt.PrekiuTipaiId
	from Prekes p
		inner join PrekiuPartijos pp on pp.PrekesId = pp.Prekesid
		left join Partneriai part on part.PartneriaiId = p.PartneriaiId
		inner join PrekiuTipai pt on pt.PrekiuTipaiId = p.PrekiuTipaiId
	where p.PrekesId = @piPrekesId

return

LABEL_Return:

IF @@TRANCOUNT > 0
  ROLLBACK TRANSACTION

return
GO
/****** Object:  StoredProcedure [dbo].[uspv_PrekiuPartijos]    Script Date: 2022-06-09 16:31:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[uspv_PrekiuPartijos]
  @poValue int = null output,
	@piPrekiuPartijosId int = null,
	@piPrekesId int = null,
	@piEditForm int = null
as

declare @vError nvarchar(max)

select @poValue = -1

select @piEditForm = isnull(@piEditForm, 0) 

if @piEditForm = 0
	select 
		PrekiuPartijosId = pp.PrekiuPartijosId,
		Kodas = pp.Kodas,
		SerijosNumeris = pp.SerijosNumeris,
		PrekesId = pp.PrekesId,
		GaliojimoData = pp.GaliojimoData,
		PartijosData = pp.PartijosData,
		PrKodas = p.Kodas,
		PrPavadinimas = p.Pavadinimas,
		PrBarkodas = p.Barkodas,
		PartPavas = part.Pavadinimas
	from PrekiuPartijos pp
		inner join Prekes p on p.PrekesId = pp.Prekesid
		left join Partneriai part on part.PartneriaiId = p.PartneriaiId
	where p.PrekesId = case when isnull(@piPrekesId, 0) != 0 then @piPrekesId else p.PrekesId end

if @piEditForm = 1
	select 
		PrekiuPartijosId = pp.PrekiuPartijosId,
		Kodas = pp.Kodas,
		SerijosNumeris = pp.SerijosNumeris,
		PrekesId = pp.PrekesId,
		GaliojimoData = pp.GaliojimoData,
		PartijosData = pp.PartijosData,
		PrKodas = p.Kodas,
		PrPavadinimas = p.Pavadinimas,
		PrBarkodas = p.Barkodas,
		PartPavas = part.Pavadinimas
	from PrekiuPartijos pp
		inner join Prekes p on p.PrekesId = pp.Prekesid
		left join Partneriai part on part.PartneriaiId = p.PartneriaiId
	where pp.PrekiuPartijosId = @piPrekiuPartijosId

return

LABEL_Return:

IF @@TRANCOUNT > 0
  ROLLBACK TRANSACTION

return
GO
/****** Object:  StoredProcedure [dbo].[uspv_PrekiuTipai]    Script Date: 2022-06-09 16:31:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[uspv_PrekiuTipai]
  @poValue int = null output,
	@piPrekiuTipaiId int = null,
	@piEditForm int = null
as

declare @vError nvarchar(max)

select @poValue = -1

select @piEditForm = isnull(@piEditForm, 0) 

if @piEditForm = 0
	select 
		PrekiuTipaiId = PrekiuTipaiId,
		Kodas = Kodas,
		Pavadinimas = Pavadinimas,
		Aprasymas = Aprasymas
	from PrekiuTipai

if @piEditForm = 1
	select 
		PrekiuTipaiId = PrekiuTipaiId,
		Kodas = Kodas,
		Pavadinimas = Pavadinimas,
		Aprasymas = Aprasymas
	from PrekiuTipai
	where PrekiuTipaiId = @piPrekiuTipaiId

return

LABEL_Return:

IF @@TRANCOUNT > 0
  ROLLBACK TRANSACTION

return
GO
/****** Object:  StoredProcedure [dbo].[uspv_Sandeliai]    Script Date: 2022-06-09 16:31:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[uspv_Sandeliai]
  @poValue int = null output,
	@piSandeliaiId int = null,
	@piEditForm int = null
as

declare @vError nvarchar(max)

select @poValue = -1

select @piEditForm = isnull(@piEditForm, 0) 

if @piEditForm = 0
	select 
		SandeliaiId = s.SandeliaiId,
		Kodas = s.Kodas,
		Pavadinimas = s.Pavadinimas,
		Adresas = a.Adresas,
		Miestas = a.Miestas,
		Salis = a.Salis,
		SandeliuGrupe = sg.Pavadinimas
	from Sandeliai s
		left join Adresai a on a.AdresaiId = s.AdresaiId
		left join SandeliuGrupes sg on sg.SandeliuGrupesId = s.SandeliuGrupesId
	

if @piEditForm = 1
	select 
		SandeliaiId = s.SandeliaiId,
		Kodas = s.Kodas,
		Pavadinimas = s.Pavadinimas,
		Adresas = a.Adresas,
		Miestas = a.Miestas,
		Salis = a.Salis,
		SandeliuGrupe = sg.Pavadinimas,
		AdresaiId = isnull(s.AdresaiId, 1),
		SandeliuGrupesId = isnull(sg.SandeliuGrupesId, 1)
	from Sandeliai s
		left join Adresai a on a.AdresaiId = s.AdresaiId
		left join SandeliuGrupes sg on sg.SandeliuGrupesId = s.SandeliuGrupesId
	where SandeliaiId = @piSandeliaiId

return

LABEL_Return:

IF @@TRANCOUNT > 0
  ROLLBACK TRANSACTION

return
GO
/****** Object:  StoredProcedure [dbo].[uspv_Sandelininkai]    Script Date: 2022-06-09 16:31:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[uspv_Sandelininkai]
  @poValue int = null output,
	@piSandelininkaiId int = null,
	@piEditForm int = null
as

declare @vError nvarchar(max)

select @poValue = -1

select @piEditForm = isnull(@piEditForm, 0) 

if @piEditForm = 0
	select 
		SandelininkaiId = s.SandelininkaiId,
		Kodas = s.Kodas,
		Pavadinimas = s.Pavadinimas,
		Asmuo = s.Vardas + ' ' + s.Pavarde,
		SGPavadinimas = sg.Pavadinimas,
		TeisesPavad = t.Pavadinimas,
		TeisesAprasymas = t.Aprasymas
	from Sandelininkai s
		left join SandeliuGrupes sg on sg.SandeliuGrupesId = s.SandeliuGrupesId
		left join Teises t on t.TeisesId = s.TeisesId
	

if @piEditForm = 1
	select 
		SandelininkaiId = s.SandelininkaiId,
		Kodas = s.Kodas,
		Pavadinimas = s.Pavadinimas,
		Asmuo = s.Vardas + ' ' + s.Pavarde,
		SGPavadinimas = sg.Pavadinimas,
		TeisesPavad = t.Pavadinimas,
		TeisesAprasymas = t.Aprasymas
	from Sandelininkai s
		left join SandeliuGrupes sg on sg.SandeliuGrupesId = s.SandeliuGrupesId
		left join Teises t on t.TeisesId = s.TeisesId
	where SandelininkaiId = @piSandelininkaiId

return

LABEL_Return:

IF @@TRANCOUNT > 0
  ROLLBACK TRANSACTION

return
GO
/****** Object:  StoredProcedure [dbo].[uspv_SandeliuGrupes]    Script Date: 2022-06-09 16:31:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[uspv_SandeliuGrupes]
  @poValue int = null output,
	@piSandeliuGrupesId int = null,
	@piEditForm int = null
as

declare @vError nvarchar(max)

select @poValue = -1

select @piEditForm = isnull(@piEditForm, 0) 

if @piEditForm = 0
	select 
		SandeliuGrupesId = SandeliuGrupesId,
		Kodas = Kodas,
		Pavadinimas = Pavadinimas,
		Aprasymas = Aprasymas
	from SandeliuGrupes

if @piEditForm = 1
	select 
		SandeliuGrupesId = SandeliuGrupesId,
		Kodas = Kodas,
		Pavadinimas = Pavadinimas,
		Aprasymas = Aprasymas
	from SandeliuGrupes
	where SandeliuGrupesId = @piSandeliuGrupesId

return

LABEL_Return:

IF @@TRANCOUNT > 0
  ROLLBACK TRANSACTION

return
GO
/****** Object:  StoredProcedure [dbo].[uspv_SandeliuOperacijos]    Script Date: 2022-06-09 16:31:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[uspv_SandeliuOperacijos]
  @poValue int = null output,
	@piOparacijosId int = null,
	@piSandelininkaiId int = null,
	@piSandelioVietosId int = null,
	@piPrekesId int = null,
	@piPartijosId int = null,
	@piOperacijuTipaiId int = null,
	@piPartneriaiId int = null,
	@piEditForm int = null
as

declare @vError nvarchar(max)

select @poValue = -1

select @piEditForm = isnull(@piEditForm, 0) 

if @piEditForm = 0
	select 
		so.OperacijosId,
		so.Kiekis,
		s.Vardas + ' ' + s.Pavarde,
		sv.Pavadinimas,
		p.Pavadinimas,
		p.Barkodas,
		p.Kodas,
		pp.Kodas,
		pp.SerijosNumeris,
		pp.PartijosData,
		pp.GaliojimoData,
		ot.Pavadinimas,
		p.Pavadinimas
	from SandeliuOperacijos so
		left join Sandelininkai s on s.SandelininkaiId = so.SandelininkaiId
		left join SandeliuVietos sv on sv.SandeliuVietosId = so.SandelioVietosId
		left join Prekes p on p.PrekesId = so.PrekesId
		left join PrekiuPartijos pp on pp.PrekiuPartijosId = so.PartijosId
		inner join OperacijuTipai ot on ot.OperacijuTipaiId = so.OperacijuTipaiId
		left join Partneriai part on part.PartneriaiId = so.PartneriaiId
	where 
		so.SandelininkaiId = case when isnull(@piSandelininkaiId, 0) != 0 then @piSandelininkaiId else so.SandelininkaiId end
		and so.SandelioVietosId = case when isnull(@piSandelioVietosId, 0) != 0 then @piSandelioVietosId else so.SandelioVietosId end
		and so.PrekesId = case when isnull(@piPrekesId, 0) != 0 then @piPrekesId else so.PrekesId end
		and so.PartijosId = case when isnull(@piPartijosId, 0) != 0 then @piPartijosId else so.PartijosId end
		and so.OperacijuTipaiId = case when isnull(@piOperacijuTipaiId, 0) != 0 then @piOperacijuTipaiId else so.OperacijuTipaiId end
		and so.PartneriaiId = case when isnull(@piPartneriaiId, 0) != 0 then @piPartneriaiId else so.PartneriaiId end
	

if @piEditForm = 1
	select 
		so.OperacijosId,
		so.Kiekis,
		s.Vardas + ' ' + s.Pavarde,
		sv.Pavadinimas,
		p.Pavadinimas,
		p.Barkodas,
		p.Kodas,
		pp.Kodas,
		pp.SerijosNumeris,
		pp.PartijosData,
		pp.GaliojimoData,
		ot.Pavadinimas,
		p.Pavadinimas
	from SandeliuOperacijos so
		left join Sandelininkai s on s.SandelininkaiId = so.SandelininkaiId
		left join SandeliuVietos sv on sv.SandeliuVietosId = so.SandelioVietosId
		left join Prekes p on p.PrekesId = so.PrekesId
		left join PrekiuPartijos pp on pp.PrekiuPartijosId = so.PartijosId
		inner join OperacijuTipai ot on ot.OperacijuTipaiId = so.OperacijuTipaiId
		left join Partneriai part on part.PartneriaiId = so.PartneriaiId
	where so.OperacijosId = @piOparacijosId

return

LABEL_Return:

IF @@TRANCOUNT > 0
  ROLLBACK TRANSACTION

return
GO
/****** Object:  StoredProcedure [dbo].[uspv_SandeliuVietos]    Script Date: 2022-06-09 16:31:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[uspv_SandeliuVietos]
  @poValue int = null output,
	@piSandeliuVietosId int = null,
	@piEditForm int = null
as

declare @vError nvarchar(max)

select @poValue = -1

select @piEditForm = isnull(@piEditForm, 0) 

if @piEditForm = 0
	select 
		SandeliuVietosId = sv.SandeliuVietosId,
		Kodas = sv.Kodas,
		Pavadinimas = sv.Pavadinimas,
		Sandelis = s.Pavadinimas,
		SandelioVietosTipas = svt.Pavadinimas
	from SandeliuVietos sv
		inner join Sandeliai s on s.SandeliaiId = sv.SandeliaiId
		inner join SandeliuVietuTipai svt on svt.SandeliuVietuTipaiId = sv.SandeliuVietuTipaiId
	

if @piEditForm = 1
	select 
		SandeliuVietosId = sv.SandeliuVietosId,
		Kodas = sv.Kodas,
		Pavadinimas = sv.Pavadinimas,
		Sandelis = s.Pavadinimas,
		SandelioVietosTipas = svt.Pavadinimas
	from SandeliuVietos sv
		inner join Sandeliai s on s.SandeliaiId = sv.SandeliaiId
		inner join SandeliuVietuTipai svt on svt.SandeliuVietuTipaiId = sv.SandeliuVietuTipaiId
	where SandeliuVietosId = @piSandeliuVietosId

return

LABEL_Return:

IF @@TRANCOUNT > 0
  ROLLBACK TRANSACTION

return
GO
/****** Object:  StoredProcedure [dbo].[uspv_SandeliuVietuTipai]    Script Date: 2022-06-09 16:31:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[uspv_SandeliuVietuTipai]
  @poValue int = null output,
	@piSandeliuVietuTipuId int = null,
	@piEditForm int = null
as

declare @vError nvarchar(max)

select @poValue = -1

select @piEditForm = isnull(@piEditForm, 0) 

if @piEditForm = 0
	select 
		SandeliuVietuTipuId = SandeliuVietuTipaiId,
		Kodas = Kodas,
		Pavadinimas = Pavadinimas,
		Aprasymas = Aprasymas
	from SandeliuVietuTipai

if @piEditForm = 1
	select 
		SandeliuVietuTipuId = SandeliuVietuTipaiId,
		Kodas = Kodas,
		Pavadinimas = Pavadinimas,
		Aprasymas = Aprasymas
	from SandeliuVietuTipai
	where SandeliuVietuTipaiId = @piSandeliuVietuTipuId

return

LABEL_Return:

IF @@TRANCOUNT > 0
  ROLLBACK TRANSACTION

return
GO
/****** Object:  StoredProcedure [dbo].[uspv_Teises]    Script Date: 2022-06-09 16:31:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[uspv_Teises]
  @poValue int = null output,
	@piTeisesId int = null,
	@piEditForm int = null
as

declare @vError nvarchar(max)

select @poValue = -1

select @piEditForm = isnull(@piEditForm, 0) 

if @piEditForm = 0
	select 
		TeisesId = TeisesId,
		Kodas = Kodas,
		Pavadinimas = Pavadinimas,
		Aprasymas = Aprasymas
	from Teises

if @piEditForm = 1
	select 
		TeisesId = TeisesId,
		Kodas = Kodas,
		Pavadinimas = Pavadinimas,
		Aprasymas = Aprasymas
	from Teises
	where TeisesId = @piTeisesId

return

LABEL_Return:

IF @@TRANCOUNT > 0
  ROLLBACK TRANSACTION

return
GO
/****** Object:  StoredProcedure [dbo].[uspv_Vartotojai]    Script Date: 2022-06-09 16:31:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[uspv_Vartotojai]
  @poValue int = null output,
	@piVartotojaiId int = null,
	@piEditForm int = null
as

declare @vError nvarchar(max)

select @poValue = -1

select @piEditForm = isnull(@piEditForm, 0) 

if @piEditForm = 0
	select 
		VartotojaiId = v.VartotojaiId,
		VartotojoVardas = v.VartotojoVardas,
		Asmuo = s.Vardas + ' ' + s.Pavarde,
		Partneris = p.Pavadinimas,
		VartotojoTipas = vt.Pavadinimai
	from Vartotojai v
		left join Sandelininkai s on s.SandelininkaiId = v.SandelininkaiId
		left join Partneriai p on p.PartneriaiId = p.PartneriaiId
		inner join VartotojuTipai vt on vt.VartotojuTipaiId = v.VartotojuTipaiId

if @piEditForm = 1
	select 
		VartotojaiId = v.VartotojaiId,
		VartotojoVardas = v.VartotojoVardas,
		Asmuo = s.Vardas + ' ' + s.Pavarde,
		Partneris = p.Pavadinimas,
		VartotojoTipas = vt.Pavadinimai
	from Vartotojai v
		left join Sandelininkai s on s.SandelininkaiId = v.SandelininkaiId
		left join Partneriai p on p.PartneriaiId = p.PartneriaiId
		inner join VartotojuTipai vt on vt.VartotojuTipaiId = v.VartotojuTipaiId
	where VartotojaiId = @piVartotojaiId

return

LABEL_Return:

IF @@TRANCOUNT > 0
  ROLLBACK TRANSACTION

return
GO
/****** Object:  StoredProcedure [dbo].[uspv_VartotojuTipai]    Script Date: 2022-06-09 16:31:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[uspv_VartotojuTipai]
  @poValue int = null output,
	@piVartotojuTipaiId int = null,
	@piEditForm int = null
as

declare @vError nvarchar(max)

select @poValue = -1

select @piEditForm = isnull(@piEditForm, 0) 

if @piEditForm = 0
	select 
		VartotojuTipaiId = VartotojuTipaiId,
		Pavadinimas = Pavadinimai
	from VartotojuTipai

if @piEditForm = 1
	select 
		VartotojuTipaiId = VartotojuTipaiId,
		Pavadinimas = Pavadinimai
	from VartotojuTipai
	where VartotojuTipaiId = @piVartotojuTipaiId

return

LABEL_Return:

IF @@TRANCOUNT > 0
  ROLLBACK TRANSACTION

return
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'pi20s.adresai' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Adresai'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'pi20s.operacijostipai' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OperacijuTipai'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'pi20s.partneriai' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Partneriai'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'pi20s.prekes' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Prekes'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'pi20s.prekes_partija' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PrekiuPartijos'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'pi20s.prekes_tipai' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PrekiuTipai'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'pi20s.sandelis' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sandeliai'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'pi20s.sandelininkas' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sandelininkai'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'pi20s.sandeliu_grupe' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SandeliuGrupes'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'pi20s.sandelio_operacijos' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SandeliuOperacijos'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'pi20s.sandelio_vietos' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SandeliuVietos'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'pi20s.sandeliovietos_tipas' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SandeliuVietuTipai'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'pi20s.snd_grupes_sandeliai' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SndeliuGrupiuSandeliai'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'pi20s.teises' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Teises'
GO
USE [master]
GO
ALTER DATABASE [SandėlioValdymoSistema] SET  READ_WRITE 
GO

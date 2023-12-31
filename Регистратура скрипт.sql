USE [master]
GO
/****** Object:  Database [Регистратура]    Script Date: 30.06.2022 6:59:20 ******/
CREATE DATABASE [Регистратура]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Регистратура', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Регистратура.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Регистратура_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Регистратура_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Регистратура] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Регистратура].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Регистратура] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Регистратура] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Регистратура] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Регистратура] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Регистратура] SET ARITHABORT OFF 
GO
ALTER DATABASE [Регистратура] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Регистратура] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Регистратура] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Регистратура] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Регистратура] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Регистратура] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Регистратура] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Регистратура] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Регистратура] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Регистратура] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Регистратура] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Регистратура] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Регистратура] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Регистратура] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Регистратура] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Регистратура] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Регистратура] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Регистратура] SET RECOVERY FULL 
GO
ALTER DATABASE [Регистратура] SET  MULTI_USER 
GO
ALTER DATABASE [Регистратура] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Регистратура] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Регистратура] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Регистратура] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Регистратура] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Регистратура] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Регистратура', N'ON'
GO
ALTER DATABASE [Регистратура] SET QUERY_STORE = OFF
GO
USE [Регистратура]
GO
/****** Object:  Table [dbo].[Врач]    Script Date: 30.06.2022 6:59:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Врач](
	[Код_врача] [int] NOT NULL,
	[Фамилия] [nchar](20) NULL,
	[Имя] [nchar](20) NULL,
	[Отчество] [nchar](20) NULL,
	[Начало_приёма] [time](7) NULL,
	[Конец_приёма] [time](7) NULL,
	[Номер_кабинета] [int] NULL,
 CONSTRAINT [PK_Врач] PRIMARY KEY CLUSTERED 
(
	[Код_врача] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Кабинет]    Script Date: 30.06.2022 6:59:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Кабинет](
	[Номер_кабинета] [int] NOT NULL,
	[Назначение] [nchar](30) NULL,
 CONSTRAINT [PK_Кабинет] PRIMARY KEY CLUSTERED 
(
	[Номер_кабинета] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[Кабинет_врач]    Script Date: 30.06.2022 6:59:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[Кабинет_врач]
as
select Врач.Фамилия, Врач.Имя, Врач.Отчество, Кабинет.Номер_кабинета, Кабинет.Назначение
from Врач, Кабинет
where Врач.Номер_кабинета=Кабинет.Номер_кабинета
GO
/****** Object:  Table [dbo].[История_добавления_пациентов]    Script Date: 30.06.2022 6:59:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[История_добавления_пациентов](
	[Номер_полиса] [nchar](16) NOT NULL,
	[Дата_добавления] [datetime] NULL,
 CONSTRAINT [PK_История_добавления_пациентов] PRIMARY KEY CLUSTERED 
(
	[Номер_полиса] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Карта_больного]    Script Date: 30.06.2022 6:59:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Карта_больного](
	[Номер_карты] [nchar](20) NOT NULL,
	[Диагноз] [nchar](20) NULL,
	[Симптомы] [nchar](50) NULL,
	[Лекарство] [nchar](20) NULL,
 CONSTRAINT [PK_Карта_больного] PRIMARY KEY CLUSTERED 
(
	[Номер_карты] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Пациент]    Script Date: 30.06.2022 6:59:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Пациент](
	[Номер_полиса] [nchar](16) NOT NULL,
	[Фамилия] [nchar](20) NULL,
	[Имя] [nchar](20) NULL,
	[Отчество] [nchar](20) NULL,
	[Адрес] [nchar](50) NULL,
	[Дата_рождения] [date] NULL,
	[Номер_карты] [nchar](20) NULL,
 CONSTRAINT [PK_Пациент] PRIMARY KEY CLUSTERED 
(
	[Номер_полиса] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Приём]    Script Date: 30.06.2022 6:59:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Приём](
	[Код_врача] [int] NOT NULL,
	[Номер_кабинета] [int] NULL,
	[Время_приёма] [datetime] NULL,
	[Номер_полиса] [nchar](16) NULL,
 CONSTRAINT [PK_Приём] PRIMARY KEY CLUSTERED 
(
	[Код_врача] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Врач]  WITH CHECK ADD  CONSTRAINT [FK_Врач_Приём] FOREIGN KEY([Код_врача])
REFERENCES [dbo].[Приём] ([Код_врача])
GO
ALTER TABLE [dbo].[Врач] CHECK CONSTRAINT [FK_Врач_Приём]
GO
ALTER TABLE [dbo].[Пациент]  WITH CHECK ADD  CONSTRAINT [FK_Пациент_Карта_больного] FOREIGN KEY([Номер_карты])
REFERENCES [dbo].[Карта_больного] ([Номер_карты])
GO
ALTER TABLE [dbo].[Пациент] CHECK CONSTRAINT [FK_Пациент_Карта_больного]
GO
ALTER TABLE [dbo].[Приём]  WITH CHECK ADD  CONSTRAINT [FK_Приём_Кабинет] FOREIGN KEY([Номер_кабинета])
REFERENCES [dbo].[Кабинет] ([Номер_кабинета])
GO
ALTER TABLE [dbo].[Приём] CHECK CONSTRAINT [FK_Приём_Кабинет]
GO
ALTER TABLE [dbo].[Приём]  WITH CHECK ADD  CONSTRAINT [FK_Приём_Пациент] FOREIGN KEY([Номер_полиса])
REFERENCES [dbo].[Пациент] ([Номер_полиса])
GO
ALTER TABLE [dbo].[Приём] CHECK CONSTRAINT [FK_Приём_Пациент]
GO
USE [master]
GO
ALTER DATABASE [Регистратура] SET  READ_WRITE 
GO

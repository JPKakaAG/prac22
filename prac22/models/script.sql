USE [master]
GO
/****** Object:  Database [prac22]    Script Date: 14.06.2024 10:41:10 ******/
CREATE DATABASE [prac22]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'prac22', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER01\MSSQL\DATA\prac22.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'prac22_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER01\MSSQL\DATA\prac22_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [prac22] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [prac22].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [prac22] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [prac22] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [prac22] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [prac22] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [prac22] SET ARITHABORT OFF 
GO
ALTER DATABASE [prac22] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [prac22] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [prac22] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [prac22] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [prac22] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [prac22] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [prac22] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [prac22] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [prac22] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [prac22] SET  DISABLE_BROKER 
GO
ALTER DATABASE [prac22] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [prac22] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [prac22] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [prac22] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [prac22] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [prac22] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [prac22] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [prac22] SET RECOVERY FULL 
GO
ALTER DATABASE [prac22] SET  MULTI_USER 
GO
ALTER DATABASE [prac22] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [prac22] SET DB_CHAINING OFF 
GO
ALTER DATABASE [prac22] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [prac22] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [prac22] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [prac22] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'prac22', N'ON'
GO
ALTER DATABASE [prac22] SET QUERY_STORE = ON
GO
ALTER DATABASE [prac22] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [prac22]
GO
/****** Object:  Table [dbo].[Filtr]    Script Date: 14.06.2024 10:41:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Filtr](
	[Год] [int] NOT NULL,
	[Код_языка] [varchar](10) NOT NULL,
	[Код_страны] [varchar](10) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 14.06.2024 10:41:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[Idrole] [int] NOT NULL,
	[Role1] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Idrole] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 14.06.2024 10:41:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Iduser] [int] NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Surname] [varchar](50) NOT NULL,
	[Patronymic] [varchar](50) NULL,
	[Idrole] [int] NOT NULL,
	[Password] [varchar](255) NOT NULL,
	[Login] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Iduser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Страны]    Script Date: 14.06.2024 10:41:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Страны](
	[Код_страны] [varchar](10) NOT NULL,
	[Название_страны] [varchar](100) NOT NULL,
	[Материк] [varchar](50) NULL,
	[Столица] [varchar](100) NULL,
	[Население] [int] NULL,
	[Фото] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[Код_страны] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Этнический_состав]    Script Date: 14.06.2024 10:41:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Этнический_состав](
	[Код_страны] [varchar](10) NOT NULL,
	[Год] [int] NOT NULL,
	[Код_языка] [varchar](10) NOT NULL,
	[Население_говорящих_на_языке] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Код_страны] ASC,
	[Год] ASC,
	[Код_языка] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Языки]    Script Date: 14.06.2024 10:41:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Языки](
	[Код_языка] [varchar](10) NOT NULL,
	[Название_языка] [varchar](100) NOT NULL,
	[Языковая_группа] [varchar](50) NULL,
	[Вид_знаковой_системы] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Код_языка] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Roles] ([Idrole], [Role1]) VALUES (1, N'Клиент')
INSERT [dbo].[Roles] ([Idrole], [Role1]) VALUES (2, N'Менеджер')
INSERT [dbo].[Roles] ([Idrole], [Role1]) VALUES (3, N'Администратор')
GO
INSERT [dbo].[Users] ([Iduser], [Name], [Surname], [Patronymic], [Idrole], [Password], [Login]) VALUES (1, N'Вадим', N'Девяткин', N'Евгеньевич', 3, N'1234567890', N'admin')
INSERT [dbo].[Users] ([Iduser], [Name], [Surname], [Patronymic], [Idrole], [Password], [Login]) VALUES (2, N'Пётр', N'Петров', N'Петрович', 2, N'1234567890', N'manager')
INSERT [dbo].[Users] ([Iduser], [Name], [Surname], [Patronymic], [Idrole], [Password], [Login]) VALUES (3, N'Иван', N'Иванов', N'Иванович', 1, N'1234567890', N'Client')
GO
INSERT [dbo].[Страны] ([Код_страны], [Название_страны], [Материк], [Столица], [Население], [Фото]) VALUES (N'BR', N'Бразилия', N'Южная Америка', N'Бразилиа', 212, NULL)
INSERT [dbo].[Страны] ([Код_страны], [Название_страны], [Материк], [Столица], [Население], [Фото]) VALUES (N'CN', N'Китай', N'Азия', N'Пекин', 1441, NULL)
INSERT [dbo].[Страны] ([Код_страны], [Название_страны], [Материк], [Столица], [Население], [Фото]) VALUES (N'DE', N'Германия', N'Европа', N'Берлин', 83, NULL)
INSERT [dbo].[Страны] ([Код_страны], [Название_страны], [Материк], [Столица], [Население], [Фото]) VALUES (N'FR', N'Франция', N'Европа', N'Париж', 67, NULL)
INSERT [dbo].[Страны] ([Код_страны], [Название_страны], [Материк], [Столица], [Население], [Фото]) VALUES (N'GB', N'Великобритания', N'Европа', N'Лондон', 66, NULL)
INSERT [dbo].[Страны] ([Код_страны], [Название_страны], [Материк], [Столица], [Население], [Фото]) VALUES (N'IN', N'Индия', N'Азия', N'Нью-Дели', 1390, NULL)
INSERT [dbo].[Страны] ([Код_страны], [Название_страны], [Материк], [Столица], [Население], [Фото]) VALUES (N'IT', N'Италия', N'Европа', N'Рим', 60, NULL)
INSERT [dbo].[Страны] ([Код_страны], [Название_страны], [Материк], [Столица], [Население], [Фото]) VALUES (N'JP', N'Япония', N'Азия', N'Токио', 126, NULL)
INSERT [dbo].[Страны] ([Код_страны], [Название_страны], [Материк], [Столица], [Население], [Фото]) VALUES (N'RU', N'Россия', N'Евразия', N'Москва', 146, NULL)
INSERT [dbo].[Страны] ([Код_страны], [Название_страны], [Материк], [Столица], [Население], [Фото]) VALUES (N'US', N'Соединенные Штаты Америки', N'Северная Америка', N'Вашингтон', 331, NULL)
GO
INSERT [dbo].[Этнический_состав] ([Код_страны], [Год], [Код_языка], [Население_говорящих_на_языке]) VALUES (N'CN', 2020, N'EN', 20)
INSERT [dbo].[Этнический_состав] ([Код_страны], [Год], [Код_языка], [Население_говорящих_на_языке]) VALUES (N'CN', 2020, N'ZH', 1300)
INSERT [dbo].[Этнический_состав] ([Код_страны], [Год], [Код_языка], [Население_говорящих_на_языке]) VALUES (N'CN', 2021, N'EN', 25)
INSERT [dbo].[Этнический_состав] ([Код_страны], [Год], [Код_языка], [Население_говорящих_на_языке]) VALUES (N'CN', 2021, N'ZH', 1320)
INSERT [dbo].[Этнический_состав] ([Код_страны], [Год], [Код_языка], [Население_говорящих_на_языке]) VALUES (N'RU', 2020, N'EN', 30)
INSERT [dbo].[Этнический_состав] ([Код_страны], [Год], [Код_языка], [Население_говорящих_на_языке]) VALUES (N'RU', 2020, N'RU', 100)
INSERT [dbo].[Этнический_состав] ([Код_страны], [Год], [Код_языка], [Население_говорящих_на_языке]) VALUES (N'RU', 2021, N'EN', 35)
INSERT [dbo].[Этнический_состав] ([Код_страны], [Год], [Код_языка], [Население_говорящих_на_языке]) VALUES (N'RU', 2021, N'RU', 105)
INSERT [dbo].[Этнический_состав] ([Код_страны], [Год], [Код_языка], [Население_говорящих_на_языке]) VALUES (N'US', 2020, N'EN', 231)
INSERT [dbo].[Этнический_состав] ([Код_страны], [Год], [Код_языка], [Население_говорящих_на_языке]) VALUES (N'US', 2020, N'ES', 40)
GO
INSERT [dbo].[Языки] ([Код_языка], [Название_языка], [Языковая_группа], [Вид_знаковой_системы]) VALUES (N'DE', N'Немецкий', N'Германская', N'Латиница')
INSERT [dbo].[Языки] ([Код_языка], [Название_языка], [Языковая_группа], [Вид_знаковой_системы]) VALUES (N'EN', N'Английский', N'Германская', N'Латиница')
INSERT [dbo].[Языки] ([Код_языка], [Название_языка], [Языковая_группа], [Вид_знаковой_системы]) VALUES (N'ES', N'Испанский', N'Романская', N'Латиница')
INSERT [dbo].[Языки] ([Код_языка], [Название_языка], [Языковая_группа], [Вид_знаковой_системы]) VALUES (N'FR', N'Французский', N'Романская', N'Латиница')
INSERT [dbo].[Языки] ([Код_языка], [Название_языка], [Языковая_группа], [Вид_знаковой_системы]) VALUES (N'HI', N'Хинди', N'Индо-европейская', N'Деванагари')
INSERT [dbo].[Языки] ([Код_языка], [Название_языка], [Языковая_группа], [Вид_знаковой_системы]) VALUES (N'IT', N'Итальянский', N'Романская', N'Латиница')
INSERT [dbo].[Языки] ([Код_языка], [Название_языка], [Языковая_группа], [Вид_знаковой_системы]) VALUES (N'JA', N'Японский', N'Японская', N'Иероглифы')
INSERT [dbo].[Языки] ([Код_языка], [Название_языка], [Языковая_группа], [Вид_знаковой_системы]) VALUES (N'PT', N'Португальский', N'Романская', N'Латиница')
INSERT [dbo].[Языки] ([Код_языка], [Название_языка], [Языковая_группа], [Вид_знаковой_системы]) VALUES (N'RU', N'Русский', N'Славянская', N'Кириллица')
INSERT [dbo].[Языки] ([Код_языка], [Название_языка], [Языковая_группа], [Вид_знаковой_системы]) VALUES (N'ZH', N'Китайский', N'Сино-тибетская', N'Иероглифы')
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD FOREIGN KEY([Idrole])
REFERENCES [dbo].[Roles] ([Idrole])
GO
ALTER TABLE [dbo].[Этнический_состав]  WITH CHECK ADD FOREIGN KEY([Код_страны])
REFERENCES [dbo].[Страны] ([Код_страны])
GO
ALTER TABLE [dbo].[Этнический_состав]  WITH CHECK ADD FOREIGN KEY([Код_языка])
REFERENCES [dbo].[Языки] ([Код_языка])
GO
USE [master]
GO
ALTER DATABASE [prac22] SET  READ_WRITE 
GO

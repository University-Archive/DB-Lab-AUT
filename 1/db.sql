USE [master]
GO
/****** Object:  Database [session1]    Script Date: 3/14/2021 12:45:44 AM ******/
CREATE DATABASE [session1]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'session1', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\session1.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'session1_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\session1_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [session1] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [session1].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [session1] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [session1] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [session1] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [session1] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [session1] SET ARITHABORT OFF 
GO
ALTER DATABASE [session1] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [session1] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [session1] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [session1] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [session1] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [session1] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [session1] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [session1] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [session1] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [session1] SET  DISABLE_BROKER 
GO
ALTER DATABASE [session1] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [session1] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [session1] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [session1] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [session1] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [session1] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [session1] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [session1] SET RECOVERY FULL 
GO
ALTER DATABASE [session1] SET  MULTI_USER 
GO
ALTER DATABASE [session1] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [session1] SET DB_CHAINING OFF 
GO
ALTER DATABASE [session1] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [session1] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [session1] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [session1] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'session1', N'ON'
GO
ALTER DATABASE [session1] SET QUERY_STORE = OFF
GO
USE [session1]
GO
/****** Object:  Table [dbo].[class]    Script Date: 3/14/2021 12:45:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[class](
	[course_name] [varchar](50) NOT NULL,
	[course_number] [char](8) NULL,
	[section_number] [varchar](10) NOT NULL,
	[num_registered] [int] NOT NULL,
	[class_date_time] [datetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[course]    Script Date: 3/14/2021 12:45:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[course](
	[course_name] [varchar](50) NOT NULL,
	[course_number] [char](8) NOT NULL,
	[instructor_no] [varchar](10) NOT NULL,
 CONSTRAINT [PK_course] PRIMARY KEY CLUSTERED 
(
	[course_name] ASC,
	[course_number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[instructor]    Script Date: 3/14/2021 12:45:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[instructor](
	[instructor_no] [varchar](10) NOT NULL,
	[instructor_name] [varchar](50) NOT NULL,
	[instructor_faculty] [varchar](50) NULL,
 CONSTRAINT [PK_instructor] PRIMARY KEY CLUSTERED 
(
	[instructor_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[professor]    Script Date: 3/14/2021 12:45:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[professor](
	[professor_id] [varchar](10) NOT NULL,
	[professor_name] [varchar](50) NOT NULL,
	[professor_faculty] [varchar](50) NULL,
 CONSTRAINT [PK_professor] PRIMARY KEY CLUSTERED 
(
	[professor_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[seat]    Script Date: 3/14/2021 12:45:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[seat](
	[seat_no] [varchar](10) NOT NULL,
	[seat_position] [varchar](50) NOT NULL,
	[student_id] [varchar](10) NOT NULL,
 CONSTRAINT [PK_seat] PRIMARY KEY CLUSTERED 
(
	[seat_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[section]    Script Date: 3/14/2021 12:45:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[section](
	[section_number] [varchar](10) NOT NULL,
	[professor_id] [varchar](10) NULL,
 CONSTRAINT [PK_section] PRIMARY KEY CLUSTERED 
(
	[section_number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[student]    Script Date: 3/14/2021 12:45:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[student](
	[student_id] [varchar](10) NOT NULL,
	[student_name] [varchar](50) NOT NULL,
	[student_address] [varchar](150) NULL,
 CONSTRAINT [PK_student] PRIMARY KEY CLUSTERED 
(
	[student_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[student_course]    Script Date: 3/14/2021 12:45:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[student_course](
	[student_id] [varchar](10) NOT NULL,
	[course_name] [varchar](50) NOT NULL,
	[course_number] [char](8) NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_class]    Script Date: 3/14/2021 12:45:44 AM ******/
CREATE NONCLUSTERED INDEX [IX_class] ON [dbo].[class]
(
	[course_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[class]  WITH CHECK ADD  CONSTRAINT [FK_class_course] FOREIGN KEY([course_name], [course_number])
REFERENCES [dbo].[course] ([course_name], [course_number])
GO
ALTER TABLE [dbo].[class] CHECK CONSTRAINT [FK_class_course]
GO
ALTER TABLE [dbo].[class]  WITH CHECK ADD  CONSTRAINT [FK_class_section] FOREIGN KEY([section_number])
REFERENCES [dbo].[section] ([section_number])
GO
ALTER TABLE [dbo].[class] CHECK CONSTRAINT [FK_class_section]
GO
ALTER TABLE [dbo].[course]  WITH CHECK ADD  CONSTRAINT [FK_course_instructor] FOREIGN KEY([instructor_no])
REFERENCES [dbo].[instructor] ([instructor_no])
GO
ALTER TABLE [dbo].[course] CHECK CONSTRAINT [FK_course_instructor]
GO
ALTER TABLE [dbo].[seat]  WITH CHECK ADD  CONSTRAINT [FK_seat_student] FOREIGN KEY([student_id])
REFERENCES [dbo].[student] ([student_id])
GO
ALTER TABLE [dbo].[seat] CHECK CONSTRAINT [FK_seat_student]
GO
ALTER TABLE [dbo].[section]  WITH CHECK ADD  CONSTRAINT [FK_section_professor] FOREIGN KEY([professor_id])
REFERENCES [dbo].[professor] ([professor_id])
GO
ALTER TABLE [dbo].[section] CHECK CONSTRAINT [FK_section_professor]
GO
ALTER TABLE [dbo].[student_course]  WITH CHECK ADD  CONSTRAINT [FK_student_course_course] FOREIGN KEY([course_name], [course_number])
REFERENCES [dbo].[course] ([course_name], [course_number])
GO
ALTER TABLE [dbo].[student_course] CHECK CONSTRAINT [FK_student_course_course]
GO
ALTER TABLE [dbo].[student_course]  WITH CHECK ADD  CONSTRAINT [FK_student_course_student] FOREIGN KEY([student_id])
REFERENCES [dbo].[student] ([student_id])
GO
ALTER TABLE [dbo].[student_course] CHECK CONSTRAINT [FK_student_course_student]
GO
USE [master]
GO
ALTER DATABASE [session1] SET  READ_WRITE 
GO

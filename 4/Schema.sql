USE [master]
GO
/****** Object:  Database [Session-4]    Script Date: 4/27/2021 1:29:29 AM ******/
CREATE DATABASE [Session-4]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Session-4', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Session-4.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Session-4_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Session-4_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Session-4] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Session-4].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Session-4] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Session-4] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Session-4] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Session-4] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Session-4] SET ARITHABORT OFF 
GO
ALTER DATABASE [Session-4] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Session-4] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Session-4] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Session-4] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Session-4] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Session-4] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Session-4] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Session-4] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Session-4] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Session-4] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Session-4] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Session-4] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Session-4] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Session-4] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Session-4] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Session-4] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Session-4] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Session-4] SET RECOVERY FULL 
GO
ALTER DATABASE [Session-4] SET  MULTI_USER 
GO
ALTER DATABASE [Session-4] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Session-4] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Session-4] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Session-4] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Session-4] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Session-4] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Session-4', N'ON'
GO
ALTER DATABASE [Session-4] SET QUERY_STORE = OFF
GO
USE [Session-4]
GO
/****** Object:  UserDefinedFunction [dbo].[Q4]    Script Date: 4/27/2021 1:29:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[Q4] (@name VARCHAR(50))
RETURNS FLOAT
AS
BEGIN
	DECLARE @temp AS FLOAT = (SELECT AVG(stuGrade) FROM tblStudent WHERE stuName = @name)
	RETURN @temp
END
GO
/****** Object:  UserDefinedFunction [dbo].[Q6]    Script Date: 4/27/2021 1:29:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[Q6] (@date DATETIME)
RETURNS VARCHAR(10)
AS
BEGIN
	DECLARE @Res AS VARCHAR(10) = DATENAME(day, DATEADD(day, 4, CONVERT(VARCHAR(100), @date)))
	RETURN @Res
END
GO
/****** Object:  Table [dbo].[question_5]    Script Date: 4/27/2021 1:29:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[question_5](
	[FirstName] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
	[PostalCode] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblStudent]    Script Date: 4/27/2021 1:29:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblStudent](
	[stuID] [int] IDENTITY(1,1) NOT NULL,
	[stuName] [varchar](50) NOT NULL,
	[stuGrade] [float] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[stuID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[Q1]    Script Date: 4/27/2021 1:29:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Q1]
@Status VARCHAR(10) OUTPUT
AS
	DECLARE @temp AS INT = (SELECT COUNT(*) FROM tblStudent WHERE stuGrade < 10)
	IF @temp <= 1
		SET @Status = 'GOOD'
	ELSE
		IF @temp <= 3
			SET @Status = 'NORMAL'
		ELSE
			SET @Status = 'BAD'
GO
/****** Object:  StoredProcedure [dbo].[Q2]    Script Date: 4/27/2021 1:29:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Q2]
@num INT
AS
	DECLARE @temp AS INT = (SELECT COUNT(*) FROM tblStudent WHERE stuGrade < 10)
	IF @temp < @num
		UPDATE tblStudent
		SET stuGrade = stuGrade + 1
		WHERE stuGrade < 10 AND stuGrade > 9
	ELSE
		UPDATE tblStudent
		SET stuGrade = stuGrade + 0.5
		WHERE stuGrade < 10 AND stuGrade > 9.5
GO
/****** Object:  StoredProcedure [dbo].[Q3]    Script Date: 4/27/2021 1:29:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Q3]
@a INT OUTPUT, @b INT OUTPUT
AS
	DECLARE @temp AS INT = @a
	SET @a = @b
	SET @b = @temp
GO
USE [master]
GO
ALTER DATABASE [Session-4] SET  READ_WRITE 
GO

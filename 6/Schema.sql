USE [master]
GO
/****** Object:  Database [Session-6]    Script Date: 5/23/2021 10:51:14 PM ******/
CREATE DATABASE [Session-6]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Session-6', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Session-6.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Session-6_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Session-6_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Session-6] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Session-6].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Session-6] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Session-6] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Session-6] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Session-6] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Session-6] SET ARITHABORT OFF 
GO
ALTER DATABASE [Session-6] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Session-6] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Session-6] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Session-6] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Session-6] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Session-6] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Session-6] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Session-6] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Session-6] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Session-6] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Session-6] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Session-6] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Session-6] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Session-6] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Session-6] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Session-6] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Session-6] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Session-6] SET RECOVERY FULL 
GO
ALTER DATABASE [Session-6] SET  MULTI_USER 
GO
ALTER DATABASE [Session-6] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Session-6] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Session-6] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Session-6] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Session-6] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Session-6] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Session-6', N'ON'
GO
ALTER DATABASE [Session-6] SET QUERY_STORE = OFF
GO
USE [Session-6]
GO
/****** Object:  UserDefinedFunction [dbo].[get_employee_dep]    Script Date: 5/23/2021 10:51:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[get_employee_dep] (@employee_id INT)
RETURNS VARCHAR(50)
AS
BEGIN
    DECLARE @tmp AS VARCHAR(50) = (SELECT DISTINCT(dependent_name)
									FROM Employee
									WHERE employee_id = @employee_id)
    RETURN @tmp
END
GO
/****** Object:  UserDefinedFunction [dbo].[get_highest_interest]    Script Date: 5/23/2021 10:51:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[get_highest_interest]()
RETURNS INT
AS
BEGIN
	DECLARE @tmp AS INT = (SELECT AVG(Account.account_number)
							FROM Account JOIN SavingAccount 
							ON Account.account_number = SavingAccount.account_number
							WHERE interest_rate = (SELECT MAX(interest_rate) 
													FROM Account JOIN SavingAccount 
													ON Account.account_number = SavingAccount.account_number))
	RETURN @tmp
END


GO
/****** Object:  Table [dbo].[Customer]    Script Date: 5/23/2021 10:51:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[customer_id] [int] NOT NULL,
	[customer_name] [varchar](50) NULL,
	[customer_street] [varchar](50) NULL,
	[customer_city] [varchar](50) NULL,
	[employee_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[customer_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Loan]    Script Date: 5/23/2021 10:51:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Loan](
	[loan_number] [int] NOT NULL,
	[amount] [int] NULL,
	[branch_name] [varchar](50) NULL,
	[customer_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[loan_number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[borrower_view]    Script Date: 5/23/2021 10:51:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[borrower_view] AS
SELECT Customer.customer_name, Customer.customer_id, Loan.amount, Loan.branch_name
FROM Customer JOIN Loan ON Loan.customer_id = Customer.customer_id
GO
/****** Object:  Table [dbo].[Account]    Script Date: 5/23/2021 10:51:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[account_number] [int] NOT NULL,
	[balance] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[account_number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Branch]    Script Date: 5/23/2021 10:51:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Branch](
	[branch_name] [varchar](50) NOT NULL,
	[branch_city] [varchar](50) NULL,
	[assets] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[branch_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CheckingAccount]    Script Date: 5/23/2021 10:51:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CheckingAccount](
	[overdraft_amount] [int] NULL,
	[account_number] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Depositor]    Script Date: 5/23/2021 10:51:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Depositor](
	[depositor_id] [int] NOT NULL,
	[customer_id] [int] NULL,
	[account_number] [int] NULL,
	[access_date] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[depositor_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 5/23/2021 10:51:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[employee_id] [int] NOT NULL,
	[dependent_name] [varchar](50) NULL,
	[employment_length] [int] NULL,
	[start_date] [date] NULL,
	[telephone_number] [varchar](20) NULL,
	[employee_name] [varchar](50) NULL,
	[manager_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[employee_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payment]    Script Date: 5/23/2021 10:51:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payment](
	[payment_number] [int] NOT NULL,
	[payment_date] [date] NULL,
	[payment_amount] [int] NULL,
	[loan_number] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[payment_number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PaymentLogs]    Script Date: 5/23/2021 10:51:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaymentLogs](
	[payment_number] [int] NOT NULL,
	[change_date] [datetime] NOT NULL,
	[command] [varchar](6) NOT NULL,
	[payment_date] [date] NULL,
	[payment_amount] [int] NULL,
	[loan_number] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SavingAccount]    Script Date: 5/23/2021 10:51:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SavingAccount](
	[interest_rate] [int] NULL,
	[account_number] [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[PaymentLogs] ADD  DEFAULT (getdate()) FOR [change_date]
GO
ALTER TABLE [dbo].[CheckingAccount]  WITH CHECK ADD FOREIGN KEY([account_number])
REFERENCES [dbo].[Account] ([account_number])
GO
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD FOREIGN KEY([employee_id])
REFERENCES [dbo].[Employee] ([employee_id])
GO
ALTER TABLE [dbo].[Depositor]  WITH CHECK ADD FOREIGN KEY([account_number])
REFERENCES [dbo].[Account] ([account_number])
GO
ALTER TABLE [dbo].[Depositor]  WITH CHECK ADD FOREIGN KEY([customer_id])
REFERENCES [dbo].[Customer] ([customer_id])
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD FOREIGN KEY([manager_id])
REFERENCES [dbo].[Employee] ([employee_id])
GO
ALTER TABLE [dbo].[Loan]  WITH CHECK ADD FOREIGN KEY([branch_name])
REFERENCES [dbo].[Branch] ([branch_name])
GO
ALTER TABLE [dbo].[Loan]  WITH CHECK ADD FOREIGN KEY([customer_id])
REFERENCES [dbo].[Customer] ([customer_id])
GO
ALTER TABLE [dbo].[Payment]  WITH CHECK ADD FOREIGN KEY([loan_number])
REFERENCES [dbo].[Loan] ([loan_number])
GO
ALTER TABLE [dbo].[SavingAccount]  WITH CHECK ADD FOREIGN KEY([account_number])
REFERENCES [dbo].[Account] ([account_number])
GO
/****** Object:  StoredProcedure [dbo].[get_customer_balance]    Script Date: 5/23/2021 10:51:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[get_customer_balance]
@name VARCHAR(50)
AS
SELECT Account.account_number, Account.balance
FROM Customer JOIN Depositor ON Depositor.customer_id = Customer.customer_id 
JOIN Account ON Depositor.account_number = Account.account_number
WHERE Customer.customer_name = @name

-- EXEC get_customer_balance 'Hasan'
GO
/****** Object:  StoredProcedure [dbo].[get_customer_data]    Script Date: 5/23/2021 10:51:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[get_customer_data]
@account_number INT
AS
BEGIN
WAITFOR DELAY '00:00:10'
SELECT Account.account_number, Account.balance, Customer.customer_id, 
	Customer.customer_name, Customer.customer_street, Customer.customer_city, Depositor.access_date
FROM Account JOIN Depositor on Account.account_number = Depositor.account_number 
JOIN Customer ON Depositor.customer_id = Customer.customer_id
WHERE Account.account_number = @account_number
END

-- EXEC get_customer_data 1
GO
/****** Object:  StoredProcedure [dbo].[get_payment_branch]    Script Date: 5/23/2021 10:51:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[get_payment_branch]
@payment_number INT, @branch_name VARCHAR(50) OUTPUT
AS
SET @branch_name = (SELECT Branch.branch_name
FROM Payment JOIN Loan ON Payment.loan_number = Loan.loan_number 
JOIN Branch ON Branch.branch_name = Loan.branch_name
WHERE Payment.payment_number = @payment_number)

GO
USE [master]
GO
ALTER DATABASE [Session-6] SET  READ_WRITE 
GO

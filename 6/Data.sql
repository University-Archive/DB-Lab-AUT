USE [Session-6]
GO
INSERT [dbo].[Branch] ([branch_name], [branch_city], [assets]) VALUES (N'Rey', N'Tehran', 1000)
INSERT [dbo].[Branch] ([branch_name], [branch_city], [assets]) VALUES (N'Vanak', N'Tehran', 1000)
GO
INSERT [dbo].[Employee] ([employee_id], [dependent_name], [employment_length], [start_date], [telephone_number], [employee_name], [manager_id]) VALUES (1, N'Dep1', 1, CAST(N'2020-02-15' AS Date), N'09193381248', N'Ali', NULL)
INSERT [dbo].[Employee] ([employee_id], [dependent_name], [employment_length], [start_date], [telephone_number], [employee_name], [manager_id]) VALUES (2, N'Dep2', 3, CAST(N'2020-02-25' AS Date), N'09123399248', N'Zahra', NULL)
GO
INSERT [dbo].[Customer] ([customer_id], [customer_name], [customer_street], [customer_city], [employee_id]) VALUES (1, N'Hasan', N'Artesh', N'Esfahan', 1)
INSERT [dbo].[Customer] ([customer_id], [customer_name], [customer_street], [customer_city], [employee_id]) VALUES (2, N'Fatemeh', N'Azadi', N'Tehran', 2)
GO
INSERT [dbo].[Loan] ([loan_number], [amount], [branch_name], [customer_id]) VALUES (1, 400, N'Vanak', 1)
GO
INSERT [dbo].[Account] ([account_number], [balance]) VALUES (1, 100)
INSERT [dbo].[Account] ([account_number], [balance]) VALUES (2, 150)
INSERT [dbo].[Account] ([account_number], [balance]) VALUES (3, 200)
GO
INSERT [dbo].[Depositor] ([depositor_id], [customer_id], [account_number], [access_date]) VALUES (1, 1, 1, CAST(N'2017-02-21' AS Date))
INSERT [dbo].[Depositor] ([depositor_id], [customer_id], [account_number], [access_date]) VALUES (2, 2, 2, CAST(N'2018-02-21' AS Date))
GO
INSERT [dbo].[Payment] ([payment_number], [payment_date], [payment_amount], [loan_number]) VALUES (1, CAST(N'2019-05-11' AS Date), 250, 1)
GO
INSERT [dbo].[SavingAccount] ([interest_rate], [account_number]) VALUES (40, 1)
INSERT [dbo].[SavingAccount] ([interest_rate], [account_number]) VALUES (60, 2)
GO
INSERT [dbo].[CheckingAccount] ([overdraft_amount], [account_number]) VALUES (200, 3)
GO

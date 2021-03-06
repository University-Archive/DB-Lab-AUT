USE [Session2-2]
GO
INSERT [dbo].[Dept] ([DeptNo], [Name]) VALUES (31, N'CE')
GO
SET IDENTITY_INSERT [dbo].[Emp] ON 

INSERT [dbo].[Emp] ([Emp_id], [Name], [Salary], [DeptNo]) VALUES (1, N'manager', 5000000, 31)
INSERT [dbo].[Emp] ([Emp_id], [Name], [Salary], [DeptNo]) VALUES (2, N'd', 4000000, 31)
INSERT [dbo].[Emp] ([Emp_id], [Name], [Salary], [DeptNo]) VALUES (3, N'o', 4000000, 31)
INSERT [dbo].[Emp] ([Emp_id], [Name], [Salary], [DeptNo]) VALUES (5, N'a', 4000000, 31)
INSERT [dbo].[Emp] ([Emp_id], [Name], [Salary], [DeptNo]) VALUES (6, N'b', 4000000, 31)
INSERT [dbo].[Emp] ([Emp_id], [Name], [Salary], [DeptNo]) VALUES (10, N'c', 4000000, 31)
INSERT [dbo].[Emp] ([Emp_id], [Name], [Salary], [DeptNo]) VALUES (11, N'e', 4000000, 31)
INSERT [dbo].[Emp] ([Emp_id], [Name], [Salary], [DeptNo]) VALUES (12, N'f', 4000000, 31)
INSERT [dbo].[Emp] ([Emp_id], [Name], [Salary], [DeptNo]) VALUES (13, N'g', 4000000, 31)
INSERT [dbo].[Emp] ([Emp_id], [Name], [Salary], [DeptNo]) VALUES (14, N'h', 4000000, 31)
INSERT [dbo].[Emp] ([Emp_id], [Name], [Salary], [DeptNo]) VALUES (15, N'k', 4000000, 31)
INSERT [dbo].[Emp] ([Emp_id], [Name], [Salary], [DeptNo]) VALUES (16, N'i', 4000000, 31)
SET IDENTITY_INSERT [dbo].[Emp] OFF
GO
SET IDENTITY_INSERT [dbo].[PrjDef] ON 

INSERT [dbo].[PrjDef] ([PrjDef_id], [Prj_Name], [profit], [deadline]) VALUES (1, N'A', 1, CAST(N'2020-01-12' AS Date))
INSERT [dbo].[PrjDef] ([PrjDef_id], [Prj_Name], [profit], [deadline]) VALUES (2, N'B', 2, CAST(N'2020-02-12' AS Date))
INSERT [dbo].[PrjDef] ([PrjDef_id], [Prj_Name], [profit], [deadline]) VALUES (3, N'C', 1, CAST(N'2020-04-15' AS Date))
INSERT [dbo].[PrjDef] ([PrjDef_id], [Prj_Name], [profit], [deadline]) VALUES (4, N'D', 3, CAST(N'2020-05-01' AS Date))
SET IDENTITY_INSERT [dbo].[PrjDef] OFF
GO
SET IDENTITY_INSERT [dbo].[Prj] ON 

INSERT [dbo].[Prj] ([Prj_id], [Emp_id], [PrjDef_id], [duration]) VALUES (1, 1, 1, 1)
INSERT [dbo].[Prj] ([Prj_id], [Emp_id], [PrjDef_id], [duration]) VALUES (2, 6, 1, 2)
INSERT [dbo].[Prj] ([Prj_id], [Emp_id], [PrjDef_id], [duration]) VALUES (3, 3, 1, 2)
INSERT [dbo].[Prj] ([Prj_id], [Emp_id], [PrjDef_id], [duration]) VALUES (4, 10, 2, 3)
INSERT [dbo].[Prj] ([Prj_id], [Emp_id], [PrjDef_id], [duration]) VALUES (5, 2, 2, 3)
INSERT [dbo].[Prj] ([Prj_id], [Emp_id], [PrjDef_id], [duration]) VALUES (6, 5, 2, 2)
INSERT [dbo].[Prj] ([Prj_id], [Emp_id], [PrjDef_id], [duration]) VALUES (7, 11, 2, 2)
INSERT [dbo].[Prj] ([Prj_id], [Emp_id], [PrjDef_id], [duration]) VALUES (8, 6, 2, 1)
INSERT [dbo].[Prj] ([Prj_id], [Emp_id], [PrjDef_id], [duration]) VALUES (9, 5, 3, 1)
INSERT [dbo].[Prj] ([Prj_id], [Emp_id], [PrjDef_id], [duration]) VALUES (10, 12, 3, 2)
INSERT [dbo].[Prj] ([Prj_id], [Emp_id], [PrjDef_id], [duration]) VALUES (11, 1, 4, 1)
INSERT [dbo].[Prj] ([Prj_id], [Emp_id], [PrjDef_id], [duration]) VALUES (12, 12, 4, 2)
INSERT [dbo].[Prj] ([Prj_id], [Emp_id], [PrjDef_id], [duration]) VALUES (13, 14, 4, 3)
INSERT [dbo].[Prj] ([Prj_id], [Emp_id], [PrjDef_id], [duration]) VALUES (14, 16, 4, 4)
INSERT [dbo].[Prj] ([Prj_id], [Emp_id], [PrjDef_id], [duration]) VALUES (15, 13, 4, 2)
INSERT [dbo].[Prj] ([Prj_id], [Emp_id], [PrjDef_id], [duration]) VALUES (16, 15, 4, 3)
SET IDENTITY_INSERT [dbo].[Prj] OFF
GO

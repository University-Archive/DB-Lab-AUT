USE [Session3-1]
GO
SET IDENTITY_INSERT [dbo].[persons] ON 

INSERT [dbo].[persons] ([P_Id], [LastName], [FirstName], [Address], [City]) VALUES (1, N'Hansen', N'Ola', N'Timoteivn 10', N'Sandnes')
INSERT [dbo].[persons] ([P_Id], [LastName], [FirstName], [Address], [City]) VALUES (2, N'Svendson', N'Tove', N'Borgvn 23', N'Sandnes')
INSERT [dbo].[persons] ([P_Id], [LastName], [FirstName], [Address], [City]) VALUES (3, N'Pettersen', N'Kari', N'Storgt 20', N'Stavanger')
INSERT [dbo].[persons] ([P_Id], [LastName], [FirstName], [Address], [City]) VALUES (4, N'Nilsen', N'Tom', N'Vingvn 23', N'Stavanger')
SET IDENTITY_INSERT [dbo].[persons] OFF
GO

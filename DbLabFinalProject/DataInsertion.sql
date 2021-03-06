USE [digikala]
GO
SET IDENTITY_INSERT [dbo].[Customer] ON 

INSERT [dbo].[Customer] ([UUId], [UserName], [Password], [PhoneNumber], [Reference], [Score]) VALUES (1, N'Ali', N'123', N'234', 0, 5)
INSERT [dbo].[Customer] ([UUId], [UserName], [Password], [PhoneNumber], [Reference], [Score]) VALUES (2, N'MohammadAli', N'123', N'234', NULL, 0)
INSERT [dbo].[Customer] ([UUId], [UserName], [Password], [PhoneNumber], [Reference], [Score]) VALUES (3, N'Dr.Zare', N'123', N'234', NULL, 0)
SET IDENTITY_INSERT [dbo].[Customer] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ProductId], [RemainingCount], [Price], [Categoty], [ProductName]) VALUES (1, 9, 1000, 1, N'Pizza')
INSERT [dbo].[Product] ([ProductId], [RemainingCount], [Price], [Categoty], [ProductName]) VALUES (2, 10, 2000, 1, N'Pizza-super')
INSERT [dbo].[Product] ([ProductId], [RemainingCount], [Price], [Categoty], [ProductName]) VALUES (3, 9, 2000, 2, N'Apple')
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
INSERT [dbo].[Comment] ([UUId], [ProductId], [Text], [Score]) VALUES (1, 1, N'Very bad!', 1)
GO
SET IDENTITY_INSERT [dbo].[Discount] ON 

INSERT [dbo].[Discount] ([DiscountId], [UUId], [Code], [Amount], [IsActive]) VALUES (1, 1, N'00000000-0000-0000-0000-000000000000', 1000, 0)
SET IDENTITY_INSERT [dbo].[Discount] OFF
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([OrderId], [UUId], [DiscountId], [TotalPrice], [CreationTime], [PaidAmount]) VALUES (2, 1, NULL, 2000, CAST(N'2021-07-16T17:48:28.413' AS DateTime), 2000)
INSERT [dbo].[Order] ([OrderId], [UUId], [DiscountId], [TotalPrice], [CreationTime], [PaidAmount]) VALUES (3, 1, 1, 3000, CAST(N'2021-07-16T18:07:50.047' AS DateTime), 2000)
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderItem] ON 

INSERT [dbo].[OrderItem] ([ItemId], [ProductId], [OrderId], [Fee], [Count]) VALUES (2, 1, 2, 1000, 2)
INSERT [dbo].[OrderItem] ([ItemId], [ProductId], [OrderId], [Fee], [Count]) VALUES (3, 1, 3, 1000, 1)
INSERT [dbo].[OrderItem] ([ItemId], [ProductId], [OrderId], [Fee], [Count]) VALUES (4, 3, 3, 2000, 1)
SET IDENTITY_INSERT [dbo].[OrderItem] OFF
GO

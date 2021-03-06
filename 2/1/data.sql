USE [Session2-1]
GO
INSERT [dbo].[Boat] ([Boat_name], [Boat_color], [Boat_rank]) VALUES (N'Heydar', N'Black', N'90')
INSERT [dbo].[Boat] ([Boat_name], [Boat_color], [Boat_rank]) VALUES (N'Karar', N'Green', N'85')
INSERT [dbo].[Boat] ([Boat_name], [Boat_color], [Boat_rank]) VALUES (N'Salar', N'Blue', N'80')
INSERT [dbo].[Boat] ([Boat_name], [Boat_color], [Boat_rank]) VALUES (N'Zolfaqar', N'Red', N'75')
GO
SET IDENTITY_INSERT [dbo].[Sailor] ON 

INSERT [dbo].[Sailor] ([Sailor_name], [Sailor_rank]) VALUES (N'Ali', 300)
INSERT [dbo].[Sailor] ([Sailor_name], [Sailor_rank]) VALUES (N'Hasan', 301)
INSERT [dbo].[Sailor] ([Sailor_name], [Sailor_rank]) VALUES (N'Matin', 303)
INSERT [dbo].[Sailor] ([Sailor_name], [Sailor_rank]) VALUES (N'Mohamad', 302)
SET IDENTITY_INSERT [dbo].[Sailor] OFF
GO
INSERT [dbo].[Reserve] ([Sailor_name], [Boat_name], [Weekday]) VALUES (N'Ali', N'Zolfaqar', N'Sat')
INSERT [dbo].[Reserve] ([Sailor_name], [Boat_name], [Weekday]) VALUES (N'Hasan', N'Heydar', N'Sat')
INSERT [dbo].[Reserve] ([Sailor_name], [Boat_name], [Weekday]) VALUES (N'Matin', N'Salar', N'Tue')
INSERT [dbo].[Reserve] ([Sailor_name], [Boat_name], [Weekday]) VALUES (N'Mohamad', N'Heydar', N'Sun')
GO

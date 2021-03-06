USE [session1]
GO
INSERT [dbo].[instructor] ([instructor_no], [instructor_name], [instructor_faculty]) VALUES (N'3003', N'Sediqi', N'CE')
INSERT [dbo].[instructor] ([instructor_no], [instructor_name], [instructor_faculty]) VALUES (N'4003', N'Mohades', N'CS')
GO
INSERT [dbo].[course] ([course_name], [course_number], [instructor_no]) VALUES (N'Logical Circuits', N'1234    ', N'3003')
INSERT [dbo].[course] ([course_name], [course_number], [instructor_no]) VALUES (N'Startup', N'2345    ', N'4003')
GO
INSERT [dbo].[professor] ([professor_id], [professor_name], [professor_faculty]) VALUES (N'134', N'Homayoun', N'CE')
INSERT [dbo].[professor] ([professor_id], [professor_name], [professor_faculty]) VALUES (N'223', N'Pedram', N'CE')
GO
INSERT [dbo].[section] ([section_number], [professor_id]) VALUES (N'2', N'134')
INSERT [dbo].[section] ([section_number], [professor_id]) VALUES (N'5', N'223')
GO
INSERT [dbo].[class] ([course_name], [course_number], [section_number], [num_registered], [class_date_time]) VALUES (N'Logical Circuits', N'1234    ', N'2', 23, CAST(N'2021-01-12T00:00:00.000' AS DateTime))
INSERT [dbo].[class] ([course_name], [course_number], [section_number], [num_registered], [class_date_time]) VALUES (N'Startup', N'2345    ', N'5', 30, CAST(N'2021-01-12T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[student] ([student_id], [student_name], [student_address]) VALUES (N'9431032', N'Zahra', N'Yazd')
INSERT [dbo].[student] ([student_id], [student_name], [student_address]) VALUES (N'9631075', N'Ali', N'Tehran')
GO
INSERT [dbo].[seat] ([seat_no], [seat_position], [student_id]) VALUES (N'1', N'Khayam03', N'9631075')
INSERT [dbo].[seat] ([seat_no], [seat_position], [student_id]) VALUES (N'2', N'Darya', N'9431032')
GO
INSERT [dbo].[student_course] ([student_id], [course_name], [course_number]) VALUES (N'9631075', N'Logical Circuits', N'1234    ')
INSERT [dbo].[student_course] ([student_id], [course_name], [course_number]) VALUES (N'9431032', N'Startup', N'2345    ')
GO

USE [bocra_hackathon]
GO
/****** Object:  Table [dbo].[complaints]    Script Date: 26/03/2026 05:59:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[complaints](
	[complaint_id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NOT NULL,
	[service_provider] [nvarchar](150) NOT NULL,
	[complaint_type] [nvarchar](50) NOT NULL,
	[description] [nvarchar](max) NOT NULL,
	[status] [nvarchar](30) NOT NULL,
	[submission_date] [date] NOT NULL,
	[resolution_date] [date] NULL,
	[resolution_notes] [nvarchar](max) NULL,
	[created_at] [datetime2](7) NULL,
	[updated_at] [datetime2](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[complaint_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[documents]    Script Date: 26/03/2026 05:59:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[documents](
	[doc_id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](200) NOT NULL,
	[category] [nvarchar](50) NOT NULL,
	[file_path] [nvarchar](255) NOT NULL,
	[upload_date] [date] NOT NULL,
	[created_at] [datetime2](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[doc_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[equipment_approvals]    Script Date: 26/03/2026 05:59:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[equipment_approvals](
	[approval_id] [int] IDENTITY(1,1) NOT NULL,
	[ta_number] [nvarchar](50) NOT NULL,
	[applicant_name] [nvarchar](200) NOT NULL,
	[manufacturer] [nvarchar](150) NOT NULL,
	[model] [nvarchar](100) NOT NULL,
	[description] [nvarchar](max) NULL,
	[expiry_date] [date] NULL,
	[status] [nvarchar](20) NOT NULL,
	[user_id] [int] NULL,
	[created_at] [datetime2](7) NULL,
	[updated_at] [datetime2](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[approval_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[license_applications]    Script Date: 26/03/2026 05:59:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[license_applications](
	[application_id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NOT NULL,
	[license_type_id] [int] NOT NULL,
	[status] [nvarchar](30) NOT NULL,
	[application_date] [date] NOT NULL,
	[submitted_documents] [nvarchar](max) NULL,
	[notes] [nvarchar](max) NULL,
	[created_at] [datetime2](7) NULL,
	[updated_at] [datetime2](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[application_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[license_types]    Script Date: 26/03/2026 05:59:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[license_types](
	[type_id] [int] IDENTITY(1,1) NOT NULL,
	[category] [nvarchar](20) NOT NULL,
	[type_name] [nvarchar](150) NOT NULL,
	[description] [nvarchar](max) NULL,
	[typical_duration_years] [int] NULL,
	[created_at] [datetime2](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[type_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[licenses]    Script Date: 26/03/2026 05:59:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[licenses](
	[license_id] [int] IDENTITY(1,1) NOT NULL,
	[application_id] [int] NULL,
	[user_id] [int] NOT NULL,
	[license_number] [nvarchar](50) NOT NULL,
	[license_type_id] [int] NOT NULL,
	[issue_date] [date] NOT NULL,
	[expiry_date] [date] NOT NULL,
	[status] [nvarchar](20) NOT NULL,
	[created_at] [datetime2](7) NULL,
	[updated_at] [datetime2](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[license_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 26/03/2026 05:59:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[user_id] [int] IDENTITY(1,1) NOT NULL,
	[full_name] [nvarchar](150) NOT NULL,
	[email] [nvarchar](150) NOT NULL,
	[phone] [nvarchar](20) NULL,
	[password_hash] [nvarchar](255) NOT NULL,
	[role] [nvarchar](20) NOT NULL,
	[is_company] [bit] NULL,
	[company_name] [nvarchar](200) NULL,
	[created_at] [datetime2](7) NULL,
	[updated_at] [datetime2](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[complaints] ON 
GO
INSERT [dbo].[complaints] ([complaint_id], [user_id], [service_provider], [complaint_type], [description], [status], [submission_date], [resolution_date], [resolution_notes], [created_at], [updated_at]) VALUES (1, 2, N'BTC', N'Billing', N'Overcharged for data bundle I never used.', N'Under_Investigation', CAST(N'2026-03-10' AS Date), NULL, NULL, CAST(N'2026-03-26T05:39:50.8200000' AS DateTime2), CAST(N'2026-03-26T05:39:50.8200000' AS DateTime2))
GO
INSERT [dbo].[complaints] ([complaint_id], [user_id], [service_provider], [complaint_type], [description], [status], [submission_date], [resolution_date], [resolution_notes], [created_at], [updated_at]) VALUES (2, 1, N'Mascom', N'Internet_Access_Contract', N'Customer complaint #147 for hackathon testing', N'Pending', CAST(N'2025-11-21' AS Date), NULL, NULL, CAST(N'2026-03-26T05:48:25.5533333' AS DateTime2), CAST(N'2026-03-26T05:48:25.5533333' AS DateTime2))
GO
INSERT [dbo].[complaints] ([complaint_id], [user_id], [service_provider], [complaint_type], [description], [status], [submission_date], [resolution_date], [resolution_notes], [created_at], [updated_at]) VALUES (3, 25, N'beMobile', N'Internet_Access_Contract', N'Customer complaint #77 for hackathon testing', N'Pending', CAST(N'2026-01-20' AS Date), NULL, NULL, CAST(N'2026-03-26T05:48:25.5533333' AS DateTime2), CAST(N'2026-03-26T05:48:25.5533333' AS DateTime2))
GO
INSERT [dbo].[complaints] ([complaint_id], [user_id], [service_provider], [complaint_type], [description], [status], [submission_date], [resolution_date], [resolution_notes], [created_at], [updated_at]) VALUES (4, 21, N'Orange', N'Internet_Access_Contract', N'Customer complaint #159 for hackathon testing', N'Pending', CAST(N'2025-12-03' AS Date), NULL, NULL, CAST(N'2026-03-26T05:48:25.5533333' AS DateTime2), CAST(N'2026-03-26T05:48:25.5533333' AS DateTime2))
GO
INSERT [dbo].[complaints] ([complaint_id], [user_id], [service_provider], [complaint_type], [description], [status], [submission_date], [resolution_date], [resolution_notes], [created_at], [updated_at]) VALUES (5, 17, N'Airtel', N'Internet_Access_Contract', N'Customer complaint #155 for hackathon testing', N'Resolved', CAST(N'2025-12-21' AS Date), NULL, NULL, CAST(N'2026-03-26T05:48:25.5533333' AS DateTime2), CAST(N'2026-03-26T05:48:25.5533333' AS DateTime2))
GO
INSERT [dbo].[complaints] ([complaint_id], [user_id], [service_provider], [complaint_type], [description], [status], [submission_date], [resolution_date], [resolution_notes], [created_at], [updated_at]) VALUES (6, 22, N'Mascom', N'Internet_Access_Contract', N'Customer complaint #138 for hackathon testing', N'Pending', CAST(N'2025-12-11' AS Date), NULL, NULL, CAST(N'2026-03-26T05:48:25.5533333' AS DateTime2), CAST(N'2026-03-26T05:48:25.5533333' AS DateTime2))
GO
INSERT [dbo].[complaints] ([complaint_id], [user_id], [service_provider], [complaint_type], [description], [status], [submission_date], [resolution_date], [resolution_notes], [created_at], [updated_at]) VALUES (7, 26, N'BTC', N'Internet_Access_Contract', N'Customer complaint #145 for hackathon testing', N'Pending', CAST(N'2026-02-09' AS Date), NULL, NULL, CAST(N'2026-03-26T05:48:25.5533333' AS DateTime2), CAST(N'2026-03-26T05:48:25.5533333' AS DateTime2))
GO
INSERT [dbo].[complaints] ([complaint_id], [user_id], [service_provider], [complaint_type], [description], [status], [submission_date], [resolution_date], [resolution_notes], [created_at], [updated_at]) VALUES (8, 16, N'BTC', N'Internet_Access_Contract', N'Customer complaint #154 for hackathon testing', N'Pending', CAST(N'2026-02-16' AS Date), NULL, NULL, CAST(N'2026-03-26T05:48:25.5533333' AS DateTime2), CAST(N'2026-03-26T05:48:25.5533333' AS DateTime2))
GO
INSERT [dbo].[complaints] ([complaint_id], [user_id], [service_provider], [complaint_type], [description], [status], [submission_date], [resolution_date], [resolution_notes], [created_at], [updated_at]) VALUES (9, 27, N'Airtel', N'Service_Failure_Repair', N'Customer complaint #119 for hackathon testing', N'Resolved', CAST(N'2026-03-23' AS Date), NULL, NULL, CAST(N'2026-03-26T05:48:25.5533333' AS DateTime2), CAST(N'2026-03-26T05:48:25.5533333' AS DateTime2))
GO
INSERT [dbo].[complaints] ([complaint_id], [user_id], [service_provider], [complaint_type], [description], [status], [submission_date], [resolution_date], [resolution_notes], [created_at], [updated_at]) VALUES (10, 2, N'Mascom', N'Billing', N'Customer complaint #104 for hackathon testing', N'Pending', CAST(N'2026-02-13' AS Date), NULL, NULL, CAST(N'2026-03-26T05:48:25.5533333' AS DateTime2), CAST(N'2026-03-26T05:48:25.5533333' AS DateTime2))
GO
INSERT [dbo].[complaints] ([complaint_id], [user_id], [service_provider], [complaint_type], [description], [status], [submission_date], [resolution_date], [resolution_notes], [created_at], [updated_at]) VALUES (11, 13, N'beMobile', N'Internet_Access_Contract', N'Customer complaint #29 for hackathon testing', N'Pending', CAST(N'2025-11-08' AS Date), NULL, NULL, CAST(N'2026-03-26T05:48:25.5533333' AS DateTime2), CAST(N'2026-03-26T05:48:25.5533333' AS DateTime2))
GO
INSERT [dbo].[complaints] ([complaint_id], [user_id], [service_provider], [complaint_type], [description], [status], [submission_date], [resolution_date], [resolution_notes], [created_at], [updated_at]) VALUES (12, 4, N'Orange', N'Internet_Access_Contract', N'Customer complaint #121 for hackathon testing', N'Pending', CAST(N'2025-11-28' AS Date), NULL, NULL, CAST(N'2026-03-26T05:48:25.5533333' AS DateTime2), CAST(N'2026-03-26T05:48:25.5533333' AS DateTime2))
GO
INSERT [dbo].[complaints] ([complaint_id], [user_id], [service_provider], [complaint_type], [description], [status], [submission_date], [resolution_date], [resolution_notes], [created_at], [updated_at]) VALUES (13, 7, N'beMobile', N'Internet_Access_Contract', N'Customer complaint #123 for hackathon testing', N'Resolved', CAST(N'2026-03-25' AS Date), NULL, NULL, CAST(N'2026-03-26T05:48:25.5533333' AS DateTime2), CAST(N'2026-03-26T05:48:25.5533333' AS DateTime2))
GO
INSERT [dbo].[complaints] ([complaint_id], [user_id], [service_provider], [complaint_type], [description], [status], [submission_date], [resolution_date], [resolution_notes], [created_at], [updated_at]) VALUES (14, 4, N'BTC', N'Billing', N'Customer complaint #7 for hackathon testing', N'Pending', CAST(N'2026-01-13' AS Date), NULL, NULL, CAST(N'2026-03-26T05:48:25.5533333' AS DateTime2), CAST(N'2026-03-26T05:48:25.5533333' AS DateTime2))
GO
INSERT [dbo].[complaints] ([complaint_id], [user_id], [service_provider], [complaint_type], [description], [status], [submission_date], [resolution_date], [resolution_notes], [created_at], [updated_at]) VALUES (15, 1, N'beMobile', N'Internet_Access_Contract', N'Customer complaint #27 for hackathon testing', N'Pending', CAST(N'2025-11-03' AS Date), NULL, NULL, CAST(N'2026-03-26T05:48:25.5533333' AS DateTime2), CAST(N'2026-03-26T05:48:25.5533333' AS DateTime2))
GO
INSERT [dbo].[complaints] ([complaint_id], [user_id], [service_provider], [complaint_type], [description], [status], [submission_date], [resolution_date], [resolution_notes], [created_at], [updated_at]) VALUES (16, 29, N'beMobile', N'Internet_Access_Contract', N'Customer complaint #156 for hackathon testing', N'Pending', CAST(N'2025-12-26' AS Date), NULL, NULL, CAST(N'2026-03-26T05:48:25.5533333' AS DateTime2), CAST(N'2026-03-26T05:48:25.5533333' AS DateTime2))
GO
INSERT [dbo].[complaints] ([complaint_id], [user_id], [service_provider], [complaint_type], [description], [status], [submission_date], [resolution_date], [resolution_notes], [created_at], [updated_at]) VALUES (17, 21, N'Airtel', N'Internet_Access_Contract', N'Customer complaint #14 for hackathon testing', N'Resolved', CAST(N'2026-01-18' AS Date), NULL, NULL, CAST(N'2026-03-26T05:48:25.5533333' AS DateTime2), CAST(N'2026-03-26T05:48:25.5533333' AS DateTime2))
GO
INSERT [dbo].[complaints] ([complaint_id], [user_id], [service_provider], [complaint_type], [description], [status], [submission_date], [resolution_date], [resolution_notes], [created_at], [updated_at]) VALUES (18, 22, N'BTC', N'Service_Failure_Repair', N'Customer complaint #133 for hackathon testing', N'Pending', CAST(N'2026-01-12' AS Date), NULL, NULL, CAST(N'2026-03-26T05:48:25.5533333' AS DateTime2), CAST(N'2026-03-26T05:48:25.5533333' AS DateTime2))
GO
INSERT [dbo].[complaints] ([complaint_id], [user_id], [service_provider], [complaint_type], [description], [status], [submission_date], [resolution_date], [resolution_notes], [created_at], [updated_at]) VALUES (19, 16, N'BTC', N'Internet_Access_Contract', N'Customer complaint #89 for hackathon testing', N'Pending', CAST(N'2026-03-20' AS Date), NULL, NULL, CAST(N'2026-03-26T05:48:25.5533333' AS DateTime2), CAST(N'2026-03-26T05:48:25.5533333' AS DateTime2))
GO
INSERT [dbo].[complaints] ([complaint_id], [user_id], [service_provider], [complaint_type], [description], [status], [submission_date], [resolution_date], [resolution_notes], [created_at], [updated_at]) VALUES (20, 25, N'beMobile', N'Internet_Access_Contract', N'Customer complaint #60 for hackathon testing', N'Pending', CAST(N'2026-03-24' AS Date), NULL, NULL, CAST(N'2026-03-26T05:48:25.5533333' AS DateTime2), CAST(N'2026-03-26T05:48:25.5533333' AS DateTime2))
GO
INSERT [dbo].[complaints] ([complaint_id], [user_id], [service_provider], [complaint_type], [description], [status], [submission_date], [resolution_date], [resolution_notes], [created_at], [updated_at]) VALUES (21, 20, N'Mascom', N'Internet_Access_Contract', N'Customer complaint #94 for hackathon testing', N'Resolved', CAST(N'2025-10-14' AS Date), NULL, NULL, CAST(N'2026-03-26T05:48:25.5533333' AS DateTime2), CAST(N'2026-03-26T05:48:25.5533333' AS DateTime2))
GO
INSERT [dbo].[complaints] ([complaint_id], [user_id], [service_provider], [complaint_type], [description], [status], [submission_date], [resolution_date], [resolution_notes], [created_at], [updated_at]) VALUES (22, 13, N'beMobile', N'Internet_Access_Contract', N'Customer complaint #115 for hackathon testing', N'Pending', CAST(N'2026-02-03' AS Date), NULL, NULL, CAST(N'2026-03-26T05:48:25.5533333' AS DateTime2), CAST(N'2026-03-26T05:48:25.5533333' AS DateTime2))
GO
INSERT [dbo].[complaints] ([complaint_id], [user_id], [service_provider], [complaint_type], [description], [status], [submission_date], [resolution_date], [resolution_notes], [created_at], [updated_at]) VALUES (23, 19, N'beMobile', N'Billing', N'Customer complaint #42 for hackathon testing', N'Pending', CAST(N'2026-02-17' AS Date), NULL, NULL, CAST(N'2026-03-26T05:48:25.5533333' AS DateTime2), CAST(N'2026-03-26T05:48:25.5533333' AS DateTime2))
GO
INSERT [dbo].[complaints] ([complaint_id], [user_id], [service_provider], [complaint_type], [description], [status], [submission_date], [resolution_date], [resolution_notes], [created_at], [updated_at]) VALUES (24, 16, N'Orange', N'Internet_Access_Contract', N'Customer complaint #139 for hackathon testing', N'Pending', CAST(N'2026-02-01' AS Date), NULL, NULL, CAST(N'2026-03-26T05:48:25.5533333' AS DateTime2), CAST(N'2026-03-26T05:48:25.5533333' AS DateTime2))
GO
INSERT [dbo].[complaints] ([complaint_id], [user_id], [service_provider], [complaint_type], [description], [status], [submission_date], [resolution_date], [resolution_notes], [created_at], [updated_at]) VALUES (25, 2, N'beMobile', N'Internet_Access_Contract', N'Customer complaint #5 for hackathon testing', N'Resolved', CAST(N'2026-02-15' AS Date), NULL, NULL, CAST(N'2026-03-26T05:48:25.5533333' AS DateTime2), CAST(N'2026-03-26T05:48:25.5533333' AS DateTime2))
GO
INSERT [dbo].[complaints] ([complaint_id], [user_id], [service_provider], [complaint_type], [description], [status], [submission_date], [resolution_date], [resolution_notes], [created_at], [updated_at]) VALUES (26, 14, N'beMobile', N'Internet_Access_Contract', N'Customer complaint #135 for hackathon testing', N'Pending', CAST(N'2026-03-20' AS Date), NULL, NULL, CAST(N'2026-03-26T05:48:25.5533333' AS DateTime2), CAST(N'2026-03-26T05:48:25.5533333' AS DateTime2))
GO
INSERT [dbo].[complaints] ([complaint_id], [user_id], [service_provider], [complaint_type], [description], [status], [submission_date], [resolution_date], [resolution_notes], [created_at], [updated_at]) VALUES (27, 8, N'beMobile', N'Billing', N'Customer complaint #162 for hackathon testing', N'Pending', CAST(N'2026-02-17' AS Date), NULL, NULL, CAST(N'2026-03-26T05:48:25.5533333' AS DateTime2), CAST(N'2026-03-26T05:48:25.5533333' AS DateTime2))
GO
INSERT [dbo].[complaints] ([complaint_id], [user_id], [service_provider], [complaint_type], [description], [status], [submission_date], [resolution_date], [resolution_notes], [created_at], [updated_at]) VALUES (28, 21, N'beMobile', N'Internet_Access_Contract', N'Customer complaint #12 for hackathon testing', N'Pending', CAST(N'2025-11-21' AS Date), NULL, NULL, CAST(N'2026-03-26T05:48:25.5533333' AS DateTime2), CAST(N'2026-03-26T05:48:25.5533333' AS DateTime2))
GO
INSERT [dbo].[complaints] ([complaint_id], [user_id], [service_provider], [complaint_type], [description], [status], [submission_date], [resolution_date], [resolution_notes], [created_at], [updated_at]) VALUES (29, 5, N'beMobile', N'Billing', N'Customer complaint #132 for hackathon testing', N'Resolved', CAST(N'2026-02-10' AS Date), NULL, NULL, CAST(N'2026-03-26T05:48:25.5533333' AS DateTime2), CAST(N'2026-03-26T05:48:25.5533333' AS DateTime2))
GO
INSERT [dbo].[complaints] ([complaint_id], [user_id], [service_provider], [complaint_type], [description], [status], [submission_date], [resolution_date], [resolution_notes], [created_at], [updated_at]) VALUES (30, 29, N'Orange', N'Internet_Access_Contract', N'Customer complaint #8 for hackathon testing', N'Pending', CAST(N'2025-11-12' AS Date), NULL, NULL, CAST(N'2026-03-26T05:48:25.5533333' AS DateTime2), CAST(N'2026-03-26T05:48:25.5533333' AS DateTime2))
GO
INSERT [dbo].[complaints] ([complaint_id], [user_id], [service_provider], [complaint_type], [description], [status], [submission_date], [resolution_date], [resolution_notes], [created_at], [updated_at]) VALUES (31, 1, N'Orange', N'Internet_Access_Contract', N'Customer complaint #111 for hackathon testing', N'Pending', CAST(N'2025-12-21' AS Date), NULL, NULL, CAST(N'2026-03-26T05:48:25.5533333' AS DateTime2), CAST(N'2026-03-26T05:48:25.5533333' AS DateTime2))
GO
SET IDENTITY_INSERT [dbo].[complaints] OFF
GO
SET IDENTITY_INSERT [dbo].[documents] ON 
GO
INSERT [dbo].[documents] ([doc_id], [title], [category], [file_path], [upload_date], [created_at]) VALUES (1, N'Telecommunications Act 2012', N'Legislation', N'/docs/Telecom_Act_2012.pdf', CAST(N'2025-01-15' AS Date), CAST(N'2026-03-26T05:48:25.5600000' AS DateTime2))
GO
INSERT [dbo].[documents] ([doc_id], [title], [category], [file_path], [upload_date], [created_at]) VALUES (2, N'Type Approval Guidelines 2024', N'Guideline', N'/docs/Type_Approval_2024.pdf', CAST(N'2025-02-10' AS Date), CAST(N'2026-03-26T05:48:25.5600000' AS DateTime2))
GO
INSERT [dbo].[documents] ([doc_id], [title], [category], [file_path], [upload_date], [created_at]) VALUES (3, N'Spectrum Management Plan 2026-2030', N'Report', N'/docs/Spectrum_Plan_2026.pdf', CAST(N'2026-01-05' AS Date), CAST(N'2026-03-26T05:48:25.5600000' AS DateTime2))
GO
INSERT [dbo].[documents] ([doc_id], [title], [category], [file_path], [upload_date], [created_at]) VALUES (4, N'Consumer Complaints Procedure', N'Guideline', N'/docs/Complaints_Procedure.pdf', CAST(N'2025-03-01' AS Date), CAST(N'2026-03-26T05:48:25.5600000' AS DateTime2))
GO
INSERT [dbo].[documents] ([doc_id], [title], [category], [file_path], [upload_date], [created_at]) VALUES (5, N'National Numbering Plan', N'Legislation', N'/docs/Numbering_Plan.pdf', CAST(N'2024-11-20' AS Date), CAST(N'2026-03-26T05:48:25.5600000' AS DateTime2))
GO
INSERT [dbo].[documents] ([doc_id], [title], [category], [file_path], [upload_date], [created_at]) VALUES (6, N'Broadcasting Code of Conduct', N'Guideline', N'/docs/Broadcast_Code.pdf', CAST(N'2025-06-12' AS Date), CAST(N'2026-03-26T05:48:25.5600000' AS DateTime2))
GO
INSERT [dbo].[documents] ([doc_id], [title], [category], [file_path], [upload_date], [created_at]) VALUES (7, N'Cybersecurity Framework 2025', N'Report', N'/docs/Cyber_Framework.pdf', CAST(N'2025-09-08' AS Date), CAST(N'2026-03-26T05:48:25.5600000' AS DateTime2))
GO
INSERT [dbo].[documents] ([doc_id], [title], [category], [file_path], [upload_date], [created_at]) VALUES (8, N'Universal Service Fund Report', N'Report', N'/docs/USF_Report_2025.pdf', CAST(N'2026-02-28' AS Date), CAST(N'2026-03-26T05:48:25.5600000' AS DateTime2))
GO
INSERT [dbo].[documents] ([doc_id], [title], [category], [file_path], [upload_date], [created_at]) VALUES (9, N'License Application Form NFP', N'Application_Form', N'/docs/Form_NFP.pdf', CAST(N'2025-03-15' AS Date), CAST(N'2026-03-26T05:48:25.5600000' AS DateTime2))
GO
INSERT [dbo].[documents] ([doc_id], [title], [category], [file_path], [upload_date], [created_at]) VALUES (10, N'License Application Form SAP', N'Application_Form', N'/docs/Form_SAP.pdf', CAST(N'2025-03-15' AS Date), CAST(N'2026-03-26T05:48:25.5600000' AS DateTime2))
GO
INSERT [dbo].[documents] ([doc_id], [title], [category], [file_path], [upload_date], [created_at]) VALUES (11, N'License Application Form CSP', N'Application_Form', N'/docs/Form_CSP.pdf', CAST(N'2025-03-15' AS Date), CAST(N'2026-03-26T05:48:25.5600000' AS DateTime2))
GO
INSERT [dbo].[documents] ([doc_id], [title], [category], [file_path], [upload_date], [created_at]) VALUES (12, N'License Application Form Postal', N'Application_Form', N'/docs/Form_Postal.pdf', CAST(N'2025-03-15' AS Date), CAST(N'2026-03-26T05:48:25.5600000' AS DateTime2))
GO
INSERT [dbo].[documents] ([doc_id], [title], [category], [file_path], [upload_date], [created_at]) VALUES (13, N'Annual Report 2024-2025', N'Report', N'/docs/Annual_Report_2025.pdf', CAST(N'2025-12-20' AS Date), CAST(N'2026-03-26T05:48:25.5600000' AS DateTime2))
GO
INSERT [dbo].[documents] ([doc_id], [title], [category], [file_path], [upload_date], [created_at]) VALUES (14, N'Consultation Paper on 5G', N'Guideline', N'/docs/5G_Consultation.pdf', CAST(N'2026-01-10' AS Date), CAST(N'2026-03-26T05:48:25.5600000' AS DateTime2))
GO
INSERT [dbo].[documents] ([doc_id], [title], [category], [file_path], [upload_date], [created_at]) VALUES (15, N'Quality of Service Regulations', N'Legislation', N'/docs/QoS_Regulations.pdf', CAST(N'2025-04-05' AS Date), CAST(N'2026-03-26T05:48:25.5600000' AS DateTime2))
GO
INSERT [dbo].[documents] ([doc_id], [title], [category], [file_path], [upload_date], [created_at]) VALUES (16, N'Data Protection Guidelines', N'Guideline', N'/docs/Data_Protection.pdf', CAST(N'2025-07-22' AS Date), CAST(N'2026-03-26T05:48:25.5600000' AS DateTime2))
GO
INSERT [dbo].[documents] ([doc_id], [title], [category], [file_path], [upload_date], [created_at]) VALUES (17, N'Tariff Approval Procedure', N'Guideline', N'/docs/Tariff_Procedure.pdf', CAST(N'2025-05-18' AS Date), CAST(N'2026-03-26T05:48:25.5600000' AS DateTime2))
GO
INSERT [dbo].[documents] ([doc_id], [title], [category], [file_path], [upload_date], [created_at]) VALUES (18, N'Interconnection Guidelines', N'Guideline', N'/docs/Interconnection.pdf', CAST(N'2025-08-30' AS Date), CAST(N'2026-03-26T05:48:25.5600000' AS DateTime2))
GO
INSERT [dbo].[documents] ([doc_id], [title], [category], [file_path], [upload_date], [created_at]) VALUES (19, N'Equipment Type Approval List Q1 2026', N'Report', N'/docs/TA_List_Q1_2026.pdf', CAST(N'2026-03-01' AS Date), CAST(N'2026-03-26T05:48:25.5600000' AS DateTime2))
GO
INSERT [dbo].[documents] ([doc_id], [title], [category], [file_path], [upload_date], [created_at]) VALUES (20, N'Consumer Rights Charter', N'Guideline', N'/docs/Consumer_Rights.pdf', CAST(N'2025-11-12' AS Date), CAST(N'2026-03-26T05:48:25.5600000' AS DateTime2))
GO
INSERT [dbo].[documents] ([doc_id], [title], [category], [file_path], [upload_date], [created_at]) VALUES (21, N'Postal Services Standards', N'Guideline', N'/docs/Postal_Standards.pdf', CAST(N'2025-10-05' AS Date), CAST(N'2026-03-26T05:48:25.5600000' AS DateTime2))
GO
INSERT [dbo].[documents] ([doc_id], [title], [category], [file_path], [upload_date], [created_at]) VALUES (22, N'Broadcasting Licence Conditions', N'Legislation', N'/docs/Broadcast_Licence.pdf', CAST(N'2025-02-28' AS Date), CAST(N'2026-03-26T05:48:25.5600000' AS DateTime2))
GO
INSERT [dbo].[documents] ([doc_id], [title], [category], [file_path], [upload_date], [created_at]) VALUES (23, N'Spectrum Auction Results 2025', N'Report', N'/docs/Spectrum_Auction.pdf', CAST(N'2025-09-15' AS Date), CAST(N'2026-03-26T05:48:25.5600000' AS DateTime2))
GO
INSERT [dbo].[documents] ([doc_id], [title], [category], [file_path], [upload_date], [created_at]) VALUES (24, N'Regulatory Impact Assessment 2026', N'Report', N'/docs/RIA_2026.pdf', CAST(N'2026-03-10' AS Date), CAST(N'2026-03-26T05:48:25.5600000' AS DateTime2))
GO
INSERT [dbo].[documents] ([doc_id], [title], [category], [file_path], [upload_date], [created_at]) VALUES (25, N'Digital Economy Strategy', N'Report', N'/docs/Digital_Economy.pdf', CAST(N'2025-12-01' AS Date), CAST(N'2026-03-26T05:48:25.5600000' AS DateTime2))
GO
SET IDENTITY_INSERT [dbo].[documents] OFF
GO
SET IDENTITY_INSERT [dbo].[equipment_approvals] ON 
GO
INSERT [dbo].[equipment_approvals] ([approval_id], [ta_number], [applicant_name], [manufacturer], [model], [description], [expiry_date], [status], [user_id], [created_at], [updated_at]) VALUES (1, N'BOCRA/TA/2016/2741', N'ZTE Botswana (Pty) Ltd', N'ZTE', N'V7 LITE', N'Computer', CAST(N'2017-07-31' AS Date), N'Approved', NULL, CAST(N'2026-03-26T05:39:50.8166667' AS DateTime2), CAST(N'2026-03-26T05:39:50.8166667' AS DateTime2))
GO
INSERT [dbo].[equipment_approvals] ([approval_id], [ta_number], [applicant_name], [manufacturer], [model], [description], [expiry_date], [status], [user_id], [created_at], [updated_at]) VALUES (2, N'BOCRA/TA/2013/413', N'ZTE Botswana (Pty) Ltd', N'ZTE', N'ZXHN H108N', N'Advanced ADSL2+ Gateway Modem', CAST(N'2014-04-30' AS Date), N'Approved', NULL, CAST(N'2026-03-26T05:39:50.8166667' AS DateTime2), CAST(N'2026-03-26T05:39:50.8166667' AS DateTime2))
GO
INSERT [dbo].[equipment_approvals] ([approval_id], [ta_number], [applicant_name], [manufacturer], [model], [description], [expiry_date], [status], [user_id], [created_at], [updated_at]) VALUES (3, N'BOCRA/TA/2026/0001', N'Mascom Wireless', N'Samsung', N'Galaxy A56', N'5G Smartphone', CAST(N'2028-12-31' AS Date), N'Approved', 3, CAST(N'2026-03-26T05:48:25.5500000' AS DateTime2), CAST(N'2026-03-26T05:48:25.5500000' AS DateTime2))
GO
INSERT [dbo].[equipment_approvals] ([approval_id], [ta_number], [applicant_name], [manufacturer], [model], [description], [expiry_date], [status], [user_id], [created_at], [updated_at]) VALUES (4, N'BOCRA/TA/2026/0002', N'Orange Botswana', N'Huawei', N'Mate 70', N'Smartphone', NULL, N'Approved', 5, CAST(N'2026-03-26T05:48:25.5500000' AS DateTime2), CAST(N'2026-03-26T05:48:25.5500000' AS DateTime2))
GO
INSERT [dbo].[equipment_approvals] ([approval_id], [ta_number], [applicant_name], [manufacturer], [model], [description], [expiry_date], [status], [user_id], [created_at], [updated_at]) VALUES (5, N'BOCRA/TA/2026/0003', N'BTC', N'ZTE', N'Blade V60', N'5G Router', CAST(N'2029-06-30' AS Date), N'Approved', 1, CAST(N'2026-03-26T05:48:25.5500000' AS DateTime2), CAST(N'2026-03-26T05:48:25.5500000' AS DateTime2))
GO
INSERT [dbo].[equipment_approvals] ([approval_id], [ta_number], [applicant_name], [manufacturer], [model], [description], [expiry_date], [status], [user_id], [created_at], [updated_at]) VALUES (6, N'BOCRA/TA/2025/1542', N'Airtel', N'Apple', N'iPhone 17 Pro', N'Smartphone', NULL, N'Approved', 6, CAST(N'2026-03-26T05:48:25.5500000' AS DateTime2), CAST(N'2026-03-26T05:48:25.5500000' AS DateTime2))
GO
INSERT [dbo].[equipment_approvals] ([approval_id], [ta_number], [applicant_name], [manufacturer], [model], [description], [expiry_date], [status], [user_id], [created_at], [updated_at]) VALUES (7, N'BOCRA/TA/2025/1543', N'beMobile', N'Motorola', N'Edge 60', N'Feature Phone', CAST(N'2027-03-15' AS Date), N'Approved', 8, CAST(N'2026-03-26T05:48:25.5500000' AS DateTime2), CAST(N'2026-03-26T05:48:25.5500000' AS DateTime2))
GO
INSERT [dbo].[equipment_approvals] ([approval_id], [ta_number], [applicant_name], [manufacturer], [model], [description], [expiry_date], [status], [user_id], [created_at], [updated_at]) VALUES (8, N'BOCRA/TA/2025/1544', N'ZTE Botswana', N'ZTE', N'AXON 60', N'5G Phone', NULL, N'Approved', 11, CAST(N'2026-03-26T05:48:25.5500000' AS DateTime2), CAST(N'2026-03-26T05:48:25.5500000' AS DateTime2))
GO
INSERT [dbo].[equipment_approvals] ([approval_id], [ta_number], [applicant_name], [manufacturer], [model], [description], [expiry_date], [status], [user_id], [created_at], [updated_at]) VALUES (9, N'BOCRA/TA/2025/1545', N'Huawei', N'Huawei', N'P70', N'Flagship Phone', CAST(N'2028-11-20' AS Date), N'Approved', 12, CAST(N'2026-03-26T05:48:25.5500000' AS DateTime2), CAST(N'2026-03-26T05:48:25.5500000' AS DateTime2))
GO
INSERT [dbo].[equipment_approvals] ([approval_id], [ta_number], [applicant_name], [manufacturer], [model], [description], [expiry_date], [status], [user_id], [created_at], [updated_at]) VALUES (10, N'BOCRA/TA/2025/1546', N'Vodacom', N'Nokia', N'G60', N'Budget Phone', NULL, N'Approved', 16, CAST(N'2026-03-26T05:48:25.5500000' AS DateTime2), CAST(N'2026-03-26T05:48:25.5500000' AS DateTime2))
GO
INSERT [dbo].[equipment_approvals] ([approval_id], [ta_number], [applicant_name], [manufacturer], [model], [description], [expiry_date], [status], [user_id], [created_at], [updated_at]) VALUES (11, N'BOCRA/TA/2025/1547', N'MTC', N'Samsung', N'Galaxy S25', N'Premium Phone', CAST(N'2029-01-10' AS Date), N'Approved', 14, CAST(N'2026-03-26T05:48:25.5500000' AS DateTime2), CAST(N'2026-03-26T05:48:25.5500000' AS DateTime2))
GO
INSERT [dbo].[equipment_approvals] ([approval_id], [ta_number], [applicant_name], [manufacturer], [model], [description], [expiry_date], [status], [user_id], [created_at], [updated_at]) VALUES (12, N'BOCRA/TA/2025/1548', N'Mascom', N'OnePlus', N'12R', N'Mid-range Phone', NULL, N'Approved', 3, CAST(N'2026-03-26T05:48:25.5500000' AS DateTime2), CAST(N'2026-03-26T05:48:25.5500000' AS DateTime2))
GO
INSERT [dbo].[equipment_approvals] ([approval_id], [ta_number], [applicant_name], [manufacturer], [model], [description], [expiry_date], [status], [user_id], [created_at], [updated_at]) VALUES (13, N'BOCRA/TA/2025/1549', N'Orange', N'Xiaomi', N'14T', N'Camera Phone', CAST(N'2027-08-05' AS Date), N'Approved', 5, CAST(N'2026-03-26T05:48:25.5500000' AS DateTime2), CAST(N'2026-03-26T05:48:25.5500000' AS DateTime2))
GO
INSERT [dbo].[equipment_approvals] ([approval_id], [ta_number], [applicant_name], [manufacturer], [model], [description], [expiry_date], [status], [user_id], [created_at], [updated_at]) VALUES (14, N'BOCRA/TA/2025/1550', N'BTC', N'Sony', N'Xperia 5 VI', N'Pro Camera', NULL, N'Approved', 1, CAST(N'2026-03-26T05:48:25.5500000' AS DateTime2), CAST(N'2026-03-26T05:48:25.5500000' AS DateTime2))
GO
INSERT [dbo].[equipment_approvals] ([approval_id], [ta_number], [applicant_name], [manufacturer], [model], [description], [expiry_date], [status], [user_id], [created_at], [updated_at]) VALUES (15, N'BOCRA/TA/2025/1551', N'Airtel', N'Oppo', N'Find X8', N'Foldable', CAST(N'2028-04-22' AS Date), N'Approved', 6, CAST(N'2026-03-26T05:48:25.5500000' AS DateTime2), CAST(N'2026-03-26T05:48:25.5500000' AS DateTime2))
GO
INSERT [dbo].[equipment_approvals] ([approval_id], [ta_number], [applicant_name], [manufacturer], [model], [description], [expiry_date], [status], [user_id], [created_at], [updated_at]) VALUES (16, N'BOCRA/TA/2025/1552', N'beMobile', N'Realme', N'GT 7', N'Gaming Phone', NULL, N'Approved', 8, CAST(N'2026-03-26T05:48:25.5500000' AS DateTime2), CAST(N'2026-03-26T05:48:25.5500000' AS DateTime2))
GO
INSERT [dbo].[equipment_approvals] ([approval_id], [ta_number], [applicant_name], [manufacturer], [model], [description], [expiry_date], [status], [user_id], [created_at], [updated_at]) VALUES (17, N'BOCRA/TA/2025/1553', N'ZTE', N'ZTE', N'Nubia Z70', N'Gaming', CAST(N'2029-02-28' AS Date), N'Approved', 11, CAST(N'2026-03-26T05:48:25.5500000' AS DateTime2), CAST(N'2026-03-26T05:48:25.5500000' AS DateTime2))
GO
INSERT [dbo].[equipment_approvals] ([approval_id], [ta_number], [applicant_name], [manufacturer], [model], [description], [expiry_date], [status], [user_id], [created_at], [updated_at]) VALUES (18, N'BOCRA/TA/2025/1554', N'Huawei', N'Honor', N'Magic 7', N'AI Phone', NULL, N'Approved', 12, CAST(N'2026-03-26T05:48:25.5500000' AS DateTime2), CAST(N'2026-03-26T05:48:25.5500000' AS DateTime2))
GO
INSERT [dbo].[equipment_approvals] ([approval_id], [ta_number], [applicant_name], [manufacturer], [model], [description], [expiry_date], [status], [user_id], [created_at], [updated_at]) VALUES (19, N'BOCRA/TA/2025/1555', N'Vodacom', N'Google', N'Pixel 10', N'Android Pure', CAST(N'2028-09-15' AS Date), N'Approved', 16, CAST(N'2026-03-26T05:48:25.5500000' AS DateTime2), CAST(N'2026-03-26T05:48:25.5500000' AS DateTime2))
GO
INSERT [dbo].[equipment_approvals] ([approval_id], [ta_number], [applicant_name], [manufacturer], [model], [description], [expiry_date], [status], [user_id], [created_at], [updated_at]) VALUES (20, N'BOCRA/TA/2025/1556', N'MTC', N'Nothing', N'Phone 3a', N'Unique Design', NULL, N'Approved', 14, CAST(N'2026-03-26T05:48:25.5500000' AS DateTime2), CAST(N'2026-03-26T05:48:25.5500000' AS DateTime2))
GO
INSERT [dbo].[equipment_approvals] ([approval_id], [ta_number], [applicant_name], [manufacturer], [model], [description], [expiry_date], [status], [user_id], [created_at], [updated_at]) VALUES (21, N'BOCRA/TA/2025/1557', N'Mascom', N'Fairphone', N'Fairphone 6', N'Sustainable', CAST(N'2027-12-01' AS Date), N'Approved', 3, CAST(N'2026-03-26T05:48:25.5500000' AS DateTime2), CAST(N'2026-03-26T05:48:25.5500000' AS DateTime2))
GO
INSERT [dbo].[equipment_approvals] ([approval_id], [ta_number], [applicant_name], [manufacturer], [model], [description], [expiry_date], [status], [user_id], [created_at], [updated_at]) VALUES (22, N'BOCRA/TA/2025/1558', N'Orange', N'Cat', N'S62', N'Rugged Phone', NULL, N'Approved', 5, CAST(N'2026-03-26T05:48:25.5500000' AS DateTime2), CAST(N'2026-03-26T05:48:25.5500000' AS DateTime2))
GO
INSERT [dbo].[equipment_approvals] ([approval_id], [ta_number], [applicant_name], [manufacturer], [model], [description], [expiry_date], [status], [user_id], [created_at], [updated_at]) VALUES (23, N'BOCRA/TA/2025/1559', N'BTC', N'Kyocera', N'DuraForce', N'Rugged', CAST(N'2028-07-10' AS Date), N'Approved', 1, CAST(N'2026-03-26T05:48:25.5500000' AS DateTime2), CAST(N'2026-03-26T05:48:25.5500000' AS DateTime2))
GO
INSERT [dbo].[equipment_approvals] ([approval_id], [ta_number], [applicant_name], [manufacturer], [model], [description], [expiry_date], [status], [user_id], [created_at], [updated_at]) VALUES (24, N'BOCRA/TA/2025/1560', N'Airtel', N'Ulefone', N'Armor 27', N'Rugged', NULL, N'Approved', 6, CAST(N'2026-03-26T05:48:25.5500000' AS DateTime2), CAST(N'2026-03-26T05:48:25.5500000' AS DateTime2))
GO
INSERT [dbo].[equipment_approvals] ([approval_id], [ta_number], [applicant_name], [manufacturer], [model], [description], [expiry_date], [status], [user_id], [created_at], [updated_at]) VALUES (25, N'BOCRA/TA/2025/1561', N'beMobile', N'Doogee', N'V Max', N'Battery King', CAST(N'2029-05-20' AS Date), N'Approved', 8, CAST(N'2026-03-26T05:48:25.5500000' AS DateTime2), CAST(N'2026-03-26T05:48:25.5500000' AS DateTime2))
GO
INSERT [dbo].[equipment_approvals] ([approval_id], [ta_number], [applicant_name], [manufacturer], [model], [description], [expiry_date], [status], [user_id], [created_at], [updated_at]) VALUES (26, N'BOCRA/TA/2025/1562', N'ZTE', N'ZTE', N'Blade V50', N'Mid-range', NULL, N'Approved', 11, CAST(N'2026-03-26T05:48:25.5500000' AS DateTime2), CAST(N'2026-03-26T05:48:25.5500000' AS DateTime2))
GO
INSERT [dbo].[equipment_approvals] ([approval_id], [ta_number], [applicant_name], [manufacturer], [model], [description], [expiry_date], [status], [user_id], [created_at], [updated_at]) VALUES (27, N'BOCRA/TA/2025/1563', N'Huawei', N'Huawei', N'Nova 13', N'Selfie King', CAST(N'2028-10-30' AS Date), N'Approved', 12, CAST(N'2026-03-26T05:48:25.5500000' AS DateTime2), CAST(N'2026-03-26T05:48:25.5500000' AS DateTime2))
GO
INSERT [dbo].[equipment_approvals] ([approval_id], [ta_number], [applicant_name], [manufacturer], [model], [description], [expiry_date], [status], [user_id], [created_at], [updated_at]) VALUES (28, N'BOCRA/TA/2025/1564', N'Vodacom', N'Tecno', N'Camon 30', N'Camera', NULL, N'Approved', 16, CAST(N'2026-03-26T05:48:25.5500000' AS DateTime2), CAST(N'2026-03-26T05:48:25.5500000' AS DateTime2))
GO
INSERT [dbo].[equipment_approvals] ([approval_id], [ta_number], [applicant_name], [manufacturer], [model], [description], [expiry_date], [status], [user_id], [created_at], [updated_at]) VALUES (29, N'BOCRA/TA/2025/1565', N'MTC', N'Infinix', N'GT 20', N'Gaming', CAST(N'2027-06-15' AS Date), N'Approved', 14, CAST(N'2026-03-26T05:48:25.5500000' AS DateTime2), CAST(N'2026-03-26T05:48:25.5500000' AS DateTime2))
GO
INSERT [dbo].[equipment_approvals] ([approval_id], [ta_number], [applicant_name], [manufacturer], [model], [description], [expiry_date], [status], [user_id], [created_at], [updated_at]) VALUES (30, N'BOCRA/TA/2025/1566', N'Mascom', N'Itel', N'S24', N'Budget', NULL, N'Approved', 3, CAST(N'2026-03-26T05:48:25.5500000' AS DateTime2), CAST(N'2026-03-26T05:48:25.5500000' AS DateTime2))
GO
INSERT [dbo].[equipment_approvals] ([approval_id], [ta_number], [applicant_name], [manufacturer], [model], [description], [expiry_date], [status], [user_id], [created_at], [updated_at]) VALUES (31, N'BOCRA/TA/2025/1567', N'Orange', N'Sparx', N'Neo 9', N'Entry level', CAST(N'2029-03-05' AS Date), N'Approved', 5, CAST(N'2026-03-26T05:48:25.5500000' AS DateTime2), CAST(N'2026-03-26T05:48:25.5500000' AS DateTime2))
GO
INSERT [dbo].[equipment_approvals] ([approval_id], [ta_number], [applicant_name], [manufacturer], [model], [description], [expiry_date], [status], [user_id], [created_at], [updated_at]) VALUES (32, N'BOCRA/TA/2025/1568', N'BTC', N'Nokia', N'3310 4G', N'Feature', NULL, N'Approved', 1, CAST(N'2026-03-26T05:48:25.5500000' AS DateTime2), CAST(N'2026-03-26T05:48:25.5500000' AS DateTime2))
GO
INSERT [dbo].[equipment_approvals] ([approval_id], [ta_number], [applicant_name], [manufacturer], [model], [description], [expiry_date], [status], [user_id], [created_at], [updated_at]) VALUES (33, N'BOCRA/TA/2025/1569', N'Airtel', N'Nokia', N'225 4G', N'Feature', CAST(N'2028-01-25' AS Date), N'Approved', 6, CAST(N'2026-03-26T05:48:25.5500000' AS DateTime2), CAST(N'2026-03-26T05:48:25.5500000' AS DateTime2))
GO
INSERT [dbo].[equipment_approvals] ([approval_id], [ta_number], [applicant_name], [manufacturer], [model], [description], [expiry_date], [status], [user_id], [created_at], [updated_at]) VALUES (34, N'BOCRA/TA/2025/1570', N'beMobile', N'Alcatel', N'3H', N'Mid-range', NULL, N'Approved', 8, CAST(N'2026-03-26T05:48:25.5500000' AS DateTime2), CAST(N'2026-03-26T05:48:25.5500000' AS DateTime2))
GO
SET IDENTITY_INSERT [dbo].[equipment_approvals] OFF
GO
SET IDENTITY_INSERT [dbo].[license_applications] ON 
GO
INSERT [dbo].[license_applications] ([application_id], [user_id], [license_type_id], [status], [application_date], [submitted_documents], [notes], [created_at], [updated_at]) VALUES (1, 1, 1, N'Approved', CAST(N'2025-06-15' AS Date), N'{"id_copy":"doc1.pdf", "business_reg":"doc2.pdf"}', N'BTC national network renewal', CAST(N'2026-03-26T05:39:50.8133333' AS DateTime2), CAST(N'2026-03-26T05:39:50.8133333' AS DateTime2))
GO
INSERT [dbo].[license_applications] ([application_id], [user_id], [license_type_id], [status], [application_date], [submitted_documents], [notes], [created_at], [updated_at]) VALUES (2, 30, 4, N'Pending', CAST(N'2025-08-09' AS Date), N'{"id":"doc1.pdf"}', N'Sample application for hackathon demo', CAST(N'2026-03-26T05:48:25.5400000' AS DateTime2), CAST(N'2026-03-26T05:48:25.5400000' AS DateTime2))
GO
INSERT [dbo].[license_applications] ([application_id], [user_id], [license_type_id], [status], [application_date], [submitted_documents], [notes], [created_at], [updated_at]) VALUES (3, 12, 8, N'Pending', CAST(N'2025-04-29' AS Date), N'{"id":"doc2.pdf"}', N'Sample application for hackathon demo', CAST(N'2026-03-26T05:48:25.5400000' AS DateTime2), CAST(N'2026-03-26T05:48:25.5400000' AS DateTime2))
GO
INSERT [dbo].[license_applications] ([application_id], [user_id], [license_type_id], [status], [application_date], [submitted_documents], [notes], [created_at], [updated_at]) VALUES (4, 21, 9, N'Pending', CAST(N'2025-05-01' AS Date), N'{"id":"doc3.pdf"}', N'Sample application for hackathon demo', CAST(N'2026-03-26T05:48:25.5400000' AS DateTime2), CAST(N'2026-03-26T05:48:25.5400000' AS DateTime2))
GO
INSERT [dbo].[license_applications] ([application_id], [user_id], [license_type_id], [status], [application_date], [submitted_documents], [notes], [created_at], [updated_at]) VALUES (5, 27, 3, N'Pending', CAST(N'2025-08-25' AS Date), N'{"id":"doc4.pdf"}', N'Sample application for hackathon demo', CAST(N'2026-03-26T05:48:25.5400000' AS DateTime2), CAST(N'2026-03-26T05:48:25.5400000' AS DateTime2))
GO
INSERT [dbo].[license_applications] ([application_id], [user_id], [license_type_id], [status], [application_date], [submitted_documents], [notes], [created_at], [updated_at]) VALUES (6, 3, 3, N'Pending', CAST(N'2025-03-30' AS Date), N'{"id":"doc5.pdf"}', N'Sample application for hackathon demo', CAST(N'2026-03-26T05:48:25.5400000' AS DateTime2), CAST(N'2026-03-26T05:48:25.5400000' AS DateTime2))
GO
INSERT [dbo].[license_applications] ([application_id], [user_id], [license_type_id], [status], [application_date], [submitted_documents], [notes], [created_at], [updated_at]) VALUES (7, 17, 2, N'Pending', CAST(N'2025-08-13' AS Date), N'{"id":"doc6.pdf"}', N'Sample application for hackathon demo', CAST(N'2026-03-26T05:48:25.5400000' AS DateTime2), CAST(N'2026-03-26T05:48:25.5400000' AS DateTime2))
GO
INSERT [dbo].[license_applications] ([application_id], [user_id], [license_type_id], [status], [application_date], [submitted_documents], [notes], [created_at], [updated_at]) VALUES (8, 25, 4, N'Pending', CAST(N'2025-12-21' AS Date), N'{"id":"doc7.pdf"}', N'Sample application for hackathon demo', CAST(N'2026-03-26T05:48:25.5400000' AS DateTime2), CAST(N'2026-03-26T05:48:25.5400000' AS DateTime2))
GO
INSERT [dbo].[license_applications] ([application_id], [user_id], [license_type_id], [status], [application_date], [submitted_documents], [notes], [created_at], [updated_at]) VALUES (9, 24, 7, N'Approved', CAST(N'2026-01-29' AS Date), N'{"id":"doc8.pdf"}', N'Sample application for hackathon demo', CAST(N'2026-03-26T05:48:25.5400000' AS DateTime2), CAST(N'2026-03-26T05:48:25.5400000' AS DateTime2))
GO
INSERT [dbo].[license_applications] ([application_id], [user_id], [license_type_id], [status], [application_date], [submitted_documents], [notes], [created_at], [updated_at]) VALUES (10, 30, 9, N'Approved', CAST(N'2025-05-26' AS Date), N'{"id":"doc9.pdf"}', N'Sample application for hackathon demo', CAST(N'2026-03-26T05:48:25.5400000' AS DateTime2), CAST(N'2026-03-26T05:48:25.5400000' AS DateTime2))
GO
INSERT [dbo].[license_applications] ([application_id], [user_id], [license_type_id], [status], [application_date], [submitted_documents], [notes], [created_at], [updated_at]) VALUES (11, 18, 7, N'Pending', CAST(N'2026-03-01' AS Date), N'{"id":"doc10.pdf"}', N'Sample application for hackathon demo', CAST(N'2026-03-26T05:48:25.5400000' AS DateTime2), CAST(N'2026-03-26T05:48:25.5400000' AS DateTime2))
GO
INSERT [dbo].[license_applications] ([application_id], [user_id], [license_type_id], [status], [application_date], [submitted_documents], [notes], [created_at], [updated_at]) VALUES (12, 11, 5, N'Pending', CAST(N'2026-01-09' AS Date), N'{"id":"doc11.pdf"}', N'Sample application for hackathon demo', CAST(N'2026-03-26T05:48:25.5400000' AS DateTime2), CAST(N'2026-03-26T05:48:25.5400000' AS DateTime2))
GO
INSERT [dbo].[license_applications] ([application_id], [user_id], [license_type_id], [status], [application_date], [submitted_documents], [notes], [created_at], [updated_at]) VALUES (13, 13, 1, N'Pending', CAST(N'2025-11-22' AS Date), N'{"id":"doc12.pdf"}', N'Sample application for hackathon demo', CAST(N'2026-03-26T05:48:25.5400000' AS DateTime2), CAST(N'2026-03-26T05:48:25.5400000' AS DateTime2))
GO
INSERT [dbo].[license_applications] ([application_id], [user_id], [license_type_id], [status], [application_date], [submitted_documents], [notes], [created_at], [updated_at]) VALUES (14, 25, 9, N'Approved', CAST(N'2025-04-19' AS Date), N'{"id":"doc13.pdf"}', N'Sample application for hackathon demo', CAST(N'2026-03-26T05:48:25.5400000' AS DateTime2), CAST(N'2026-03-26T05:48:25.5400000' AS DateTime2))
GO
INSERT [dbo].[license_applications] ([application_id], [user_id], [license_type_id], [status], [application_date], [submitted_documents], [notes], [created_at], [updated_at]) VALUES (15, 27, 7, N'Pending', CAST(N'2025-09-05' AS Date), N'{"id":"doc14.pdf"}', N'Sample application for hackathon demo', CAST(N'2026-03-26T05:48:25.5400000' AS DateTime2), CAST(N'2026-03-26T05:48:25.5400000' AS DateTime2))
GO
INSERT [dbo].[license_applications] ([application_id], [user_id], [license_type_id], [status], [application_date], [submitted_documents], [notes], [created_at], [updated_at]) VALUES (16, 30, 7, N'Pending', CAST(N'2025-08-01' AS Date), N'{"id":"doc15.pdf"}', N'Sample application for hackathon demo', CAST(N'2026-03-26T05:48:25.5400000' AS DateTime2), CAST(N'2026-03-26T05:48:25.5400000' AS DateTime2))
GO
INSERT [dbo].[license_applications] ([application_id], [user_id], [license_type_id], [status], [application_date], [submitted_documents], [notes], [created_at], [updated_at]) VALUES (17, 26, 8, N'Pending', CAST(N'2025-08-19' AS Date), N'{"id":"doc16.pdf"}', N'Sample application for hackathon demo', CAST(N'2026-03-26T05:48:25.5400000' AS DateTime2), CAST(N'2026-03-26T05:48:25.5400000' AS DateTime2))
GO
INSERT [dbo].[license_applications] ([application_id], [user_id], [license_type_id], [status], [application_date], [submitted_documents], [notes], [created_at], [updated_at]) VALUES (18, 13, 7, N'Approved', CAST(N'2025-11-22' AS Date), N'{"id":"doc17.pdf"}', N'Sample application for hackathon demo', CAST(N'2026-03-26T05:48:25.5400000' AS DateTime2), CAST(N'2026-03-26T05:48:25.5400000' AS DateTime2))
GO
INSERT [dbo].[license_applications] ([application_id], [user_id], [license_type_id], [status], [application_date], [submitted_documents], [notes], [created_at], [updated_at]) VALUES (19, 12, 7, N'Approved', CAST(N'2025-09-09' AS Date), N'{"id":"doc18.pdf"}', N'Sample application for hackathon demo', CAST(N'2026-03-26T05:48:25.5400000' AS DateTime2), CAST(N'2026-03-26T05:48:25.5400000' AS DateTime2))
GO
INSERT [dbo].[license_applications] ([application_id], [user_id], [license_type_id], [status], [application_date], [submitted_documents], [notes], [created_at], [updated_at]) VALUES (20, 24, 2, N'Under_Review', CAST(N'2025-06-20' AS Date), N'{"id":"doc19.pdf"}', N'Sample application for hackathon demo', CAST(N'2026-03-26T05:48:25.5400000' AS DateTime2), CAST(N'2026-03-26T05:48:25.5400000' AS DateTime2))
GO
INSERT [dbo].[license_applications] ([application_id], [user_id], [license_type_id], [status], [application_date], [submitted_documents], [notes], [created_at], [updated_at]) VALUES (21, 5, 5, N'Approved', CAST(N'2026-01-19' AS Date), N'{"id":"doc20.pdf"}', N'Sample application for hackathon demo', CAST(N'2026-03-26T05:48:25.5400000' AS DateTime2), CAST(N'2026-03-26T05:48:25.5400000' AS DateTime2))
GO
INSERT [dbo].[license_applications] ([application_id], [user_id], [license_type_id], [status], [application_date], [submitted_documents], [notes], [created_at], [updated_at]) VALUES (22, 28, 10, N'Pending', CAST(N'2025-09-28' AS Date), N'{"id":"doc21.pdf"}', N'Sample application for hackathon demo', CAST(N'2026-03-26T05:48:25.5400000' AS DateTime2), CAST(N'2026-03-26T05:48:25.5400000' AS DateTime2))
GO
INSERT [dbo].[license_applications] ([application_id], [user_id], [license_type_id], [status], [application_date], [submitted_documents], [notes], [created_at], [updated_at]) VALUES (23, 3, 6, N'Approved', CAST(N'2025-07-31' AS Date), N'{"id":"doc22.pdf"}', N'Sample application for hackathon demo', CAST(N'2026-03-26T05:48:25.5400000' AS DateTime2), CAST(N'2026-03-26T05:48:25.5400000' AS DateTime2))
GO
INSERT [dbo].[license_applications] ([application_id], [user_id], [license_type_id], [status], [application_date], [submitted_documents], [notes], [created_at], [updated_at]) VALUES (24, 4, 7, N'Pending', CAST(N'2026-01-18' AS Date), N'{"id":"doc23.pdf"}', N'Sample application for hackathon demo', CAST(N'2026-03-26T05:48:25.5400000' AS DateTime2), CAST(N'2026-03-26T05:48:25.5400000' AS DateTime2))
GO
INSERT [dbo].[license_applications] ([application_id], [user_id], [license_type_id], [status], [application_date], [submitted_documents], [notes], [created_at], [updated_at]) VALUES (25, 27, 10, N'Approved', CAST(N'2026-02-17' AS Date), N'{"id":"doc24.pdf"}', N'Sample application for hackathon demo', CAST(N'2026-03-26T05:48:25.5400000' AS DateTime2), CAST(N'2026-03-26T05:48:25.5400000' AS DateTime2))
GO
INSERT [dbo].[license_applications] ([application_id], [user_id], [license_type_id], [status], [application_date], [submitted_documents], [notes], [created_at], [updated_at]) VALUES (26, 13, 1, N'Pending', CAST(N'2025-11-16' AS Date), N'{"id":"doc25.pdf"}', N'Sample application for hackathon demo', CAST(N'2026-03-26T05:48:25.5400000' AS DateTime2), CAST(N'2026-03-26T05:48:25.5400000' AS DateTime2))
GO
INSERT [dbo].[license_applications] ([application_id], [user_id], [license_type_id], [status], [application_date], [submitted_documents], [notes], [created_at], [updated_at]) VALUES (27, 15, 5, N'Pending', CAST(N'2025-11-18' AS Date), N'{"id":"doc26.pdf"}', N'Sample application for hackathon demo', CAST(N'2026-03-26T05:48:25.5400000' AS DateTime2), CAST(N'2026-03-26T05:48:25.5400000' AS DateTime2))
GO
INSERT [dbo].[license_applications] ([application_id], [user_id], [license_type_id], [status], [application_date], [submitted_documents], [notes], [created_at], [updated_at]) VALUES (28, 7, 2, N'Approved', CAST(N'2025-12-29' AS Date), N'{"id":"doc27.pdf"}', N'Sample application for hackathon demo', CAST(N'2026-03-26T05:48:25.5400000' AS DateTime2), CAST(N'2026-03-26T05:48:25.5400000' AS DateTime2))
GO
INSERT [dbo].[license_applications] ([application_id], [user_id], [license_type_id], [status], [application_date], [submitted_documents], [notes], [created_at], [updated_at]) VALUES (29, 4, 6, N'Pending', CAST(N'2025-12-01' AS Date), N'{"id":"doc28.pdf"}', N'Sample application for hackathon demo', CAST(N'2026-03-26T05:48:25.5400000' AS DateTime2), CAST(N'2026-03-26T05:48:25.5400000' AS DateTime2))
GO
INSERT [dbo].[license_applications] ([application_id], [user_id], [license_type_id], [status], [application_date], [submitted_documents], [notes], [created_at], [updated_at]) VALUES (30, 4, 6, N'Pending', CAST(N'2025-11-01' AS Date), N'{"id":"doc29.pdf"}', N'Sample application for hackathon demo', CAST(N'2026-03-26T05:48:25.5400000' AS DateTime2), CAST(N'2026-03-26T05:48:25.5400000' AS DateTime2))
GO
INSERT [dbo].[license_applications] ([application_id], [user_id], [license_type_id], [status], [application_date], [submitted_documents], [notes], [created_at], [updated_at]) VALUES (31, 7, 4, N'Under_Review', CAST(N'2025-10-16' AS Date), N'{"id":"doc30.pdf"}', N'Sample application for hackathon demo', CAST(N'2026-03-26T05:48:25.5400000' AS DateTime2), CAST(N'2026-03-26T05:48:25.5400000' AS DateTime2))
GO
SET IDENTITY_INSERT [dbo].[license_applications] OFF
GO
SET IDENTITY_INSERT [dbo].[license_types] ON 
GO
INSERT [dbo].[license_types] ([type_id], [category], [type_name], [description], [typical_duration_years], [created_at]) VALUES (1, N'NFP', N'National Network Facilities', N'Public Land Mobile Cellular Systems, Fixed Systems, etc.', 15, CAST(N'2026-03-26T05:39:50.8133333' AS DateTime2))
GO
INSERT [dbo].[license_types] ([type_id], [category], [type_name], [description], [typical_duration_years], [created_at]) VALUES (2, N'SAP', N'Cellular Services and Applications', N'Voice/Data/Text on cellular networks', 15, CAST(N'2026-03-26T05:39:50.8133333' AS DateTime2))
GO
INSERT [dbo].[license_types] ([type_id], [category], [type_name], [description], [typical_duration_years], [created_at]) VALUES (3, N'NFP', N'National Network Facilities', N'Fixed and mobile networks', 15, CAST(N'2026-03-26T05:48:25.5400000' AS DateTime2))
GO
INSERT [dbo].[license_types] ([type_id], [category], [type_name], [description], [typical_duration_years], [created_at]) VALUES (4, N'NFP', N'Regional Network Facilities', N'Local loops and internet networks', 15, CAST(N'2026-03-26T05:48:25.5400000' AS DateTime2))
GO
INSERT [dbo].[license_types] ([type_id], [category], [type_name], [description], [typical_duration_years], [created_at]) VALUES (5, N'SAP', N'Cellular Services and Applications', N'Voice, data and SMS', 15, CAST(N'2026-03-26T05:48:25.5400000' AS DateTime2))
GO
INSERT [dbo].[license_types] ([type_id], [category], [type_name], [description], [typical_duration_years], [created_at]) VALUES (6, N'SAP', N'Value Added Services', N'VOIP and premium rate services', 15, CAST(N'2026-03-26T05:48:25.5400000' AS DateTime2))
GO
INSERT [dbo].[license_types] ([type_id], [category], [type_name], [description], [typical_duration_years], [created_at]) VALUES (7, N'CSP', N'Broadcasting - Radio', N'FM and community radio', 10, CAST(N'2026-03-26T05:48:25.5400000' AS DateTime2))
GO
INSERT [dbo].[license_types] ([type_id], [category], [type_name], [description], [typical_duration_years], [created_at]) VALUES (8, N'CSP', N'Broadcasting - Television', N'Free-to-air TV', 10, CAST(N'2026-03-26T05:48:25.5400000' AS DateTime2))
GO
INSERT [dbo].[license_types] ([type_id], [category], [type_name], [description], [typical_duration_years], [created_at]) VALUES (9, N'Postal', N'Designated Postal Operator', N'Universal postal service', 10, CAST(N'2026-03-26T05:48:25.5400000' AS DateTime2))
GO
INSERT [dbo].[license_types] ([type_id], [category], [type_name], [description], [typical_duration_years], [created_at]) VALUES (10, N'CSP', N'Subscription Broadcasting', N'Pay-TV and satellite', 15, CAST(N'2026-03-26T05:48:25.5400000' AS DateTime2))
GO
INSERT [dbo].[license_types] ([type_id], [category], [type_name], [description], [typical_duration_years], [created_at]) VALUES (11, N'SAP', N'Internet Service Provider', N'Broadband and fibre', 15, CAST(N'2026-03-26T05:48:25.5400000' AS DateTime2))
GO
INSERT [dbo].[license_types] ([type_id], [category], [type_name], [description], [typical_duration_years], [created_at]) VALUES (12, N'NFP', N'Satellite Earth Station', N'VSAT and satellite services', 15, CAST(N'2026-03-26T05:48:25.5400000' AS DateTime2))
GO
SET IDENTITY_INSERT [dbo].[license_types] OFF
GO
SET IDENTITY_INSERT [dbo].[licenses] ON 
GO
INSERT [dbo].[licenses] ([license_id], [application_id], [user_id], [license_number], [license_type_id], [issue_date], [expiry_date], [status], [created_at], [updated_at]) VALUES (1, 1, 1, N'BOCRA/NFP/2026/001', 1, CAST(N'2026-01-01' AS Date), CAST(N'2041-01-01' AS Date), N'Active', CAST(N'2026-03-26T05:39:50.8166667' AS DateTime2), CAST(N'2026-03-26T05:39:50.8166667' AS DateTime2))
GO
INSERT [dbo].[licenses] ([license_id], [application_id], [user_id], [license_number], [license_type_id], [issue_date], [expiry_date], [status], [created_at], [updated_at]) VALUES (2, NULL, 22, N'BOCRA/SAP/2026/068', 1, CAST(N'2025-05-21' AS Date), CAST(N'2041-01-13' AS Date), N'Expired', CAST(N'2026-03-26T05:48:25.5433333' AS DateTime2), CAST(N'2026-03-26T05:48:25.5433333' AS DateTime2))
GO
INSERT [dbo].[licenses] ([license_id], [application_id], [user_id], [license_number], [license_type_id], [issue_date], [expiry_date], [status], [created_at], [updated_at]) VALUES (3, 5, 6, N'BOCRA/SAP/2026/013', 7, CAST(N'2025-05-07' AS Date), CAST(N'2039-12-18' AS Date), N'Expired', CAST(N'2026-03-26T05:48:25.5433333' AS DateTime2), CAST(N'2026-03-26T05:48:25.5433333' AS DateTime2))
GO
INSERT [dbo].[licenses] ([license_id], [application_id], [user_id], [license_number], [license_type_id], [issue_date], [expiry_date], [status], [created_at], [updated_at]) VALUES (4, 18, 8, N'BOCRA/SAP/2026/085', 2, CAST(N'2025-01-18' AS Date), CAST(N'2039-08-05' AS Date), N'Expired', CAST(N'2026-03-26T05:48:25.5433333' AS DateTime2), CAST(N'2026-03-26T05:48:25.5433333' AS DateTime2))
GO
INSERT [dbo].[licenses] ([license_id], [application_id], [user_id], [license_number], [license_type_id], [issue_date], [expiry_date], [status], [created_at], [updated_at]) VALUES (5, 26, 20, N'BOCRA/SAP/2026/039', 4, CAST(N'2024-10-16' AS Date), CAST(N'2041-02-03' AS Date), N'Active', CAST(N'2026-03-26T05:48:25.5433333' AS DateTime2), CAST(N'2026-03-26T05:48:25.5433333' AS DateTime2))
GO
INSERT [dbo].[licenses] ([license_id], [application_id], [user_id], [license_number], [license_type_id], [issue_date], [expiry_date], [status], [created_at], [updated_at]) VALUES (6, 18, 3, N'BOCRA/NFP/2026/107', 5, CAST(N'2025-12-30' AS Date), CAST(N'2040-11-05' AS Date), N'Expired', CAST(N'2026-03-26T05:48:25.5433333' AS DateTime2), CAST(N'2026-03-26T05:48:25.5433333' AS DateTime2))
GO
INSERT [dbo].[licenses] ([license_id], [application_id], [user_id], [license_number], [license_type_id], [issue_date], [expiry_date], [status], [created_at], [updated_at]) VALUES (7, NULL, 12, N'BOCRA/SAP/2026/112', 6, CAST(N'2024-06-06' AS Date), CAST(N'2040-01-20' AS Date), N'Expired', CAST(N'2026-03-26T05:48:25.5433333' AS DateTime2), CAST(N'2026-03-26T05:48:25.5433333' AS DateTime2))
GO
INSERT [dbo].[licenses] ([license_id], [application_id], [user_id], [license_number], [license_type_id], [issue_date], [expiry_date], [status], [created_at], [updated_at]) VALUES (8, 7, 14, N'BOCRA/SAP/2026/139', 9, CAST(N'2025-04-17' AS Date), CAST(N'2039-06-28' AS Date), N'Expired', CAST(N'2026-03-26T05:48:25.5433333' AS DateTime2), CAST(N'2026-03-26T05:48:25.5433333' AS DateTime2))
GO
INSERT [dbo].[licenses] ([license_id], [application_id], [user_id], [license_number], [license_type_id], [issue_date], [expiry_date], [status], [created_at], [updated_at]) VALUES (9, NULL, 22, N'BOCRA/SAP/2026/023', 3, CAST(N'2025-06-18' AS Date), CAST(N'2040-01-13' AS Date), N'Active', CAST(N'2026-03-26T05:48:25.5433333' AS DateTime2), CAST(N'2026-03-26T05:48:25.5433333' AS DateTime2))
GO
INSERT [dbo].[licenses] ([license_id], [application_id], [user_id], [license_number], [license_type_id], [issue_date], [expiry_date], [status], [created_at], [updated_at]) VALUES (10, 12, 7, N'BOCRA/NFP/2026/095', 7, CAST(N'2024-07-04' AS Date), CAST(N'2040-04-23' AS Date), N'Expired', CAST(N'2026-03-26T05:48:25.5433333' AS DateTime2), CAST(N'2026-03-26T05:48:25.5433333' AS DateTime2))
GO
INSERT [dbo].[licenses] ([license_id], [application_id], [user_id], [license_number], [license_type_id], [issue_date], [expiry_date], [status], [created_at], [updated_at]) VALUES (11, 24, 5, N'BOCRA/NFP/2026/079', 4, CAST(N'2026-01-27' AS Date), CAST(N'2040-03-28' AS Date), N'Expired', CAST(N'2026-03-26T05:48:25.5433333' AS DateTime2), CAST(N'2026-03-26T05:48:25.5433333' AS DateTime2))
GO
INSERT [dbo].[licenses] ([license_id], [application_id], [user_id], [license_number], [license_type_id], [issue_date], [expiry_date], [status], [created_at], [updated_at]) VALUES (12, NULL, 27, N'BOCRA/SAP/2026/088', 8, CAST(N'2025-05-11' AS Date), CAST(N'2040-06-25' AS Date), N'Expired', CAST(N'2026-03-26T05:48:25.5433333' AS DateTime2), CAST(N'2026-03-26T05:48:25.5433333' AS DateTime2))
GO
INSERT [dbo].[licenses] ([license_id], [application_id], [user_id], [license_number], [license_type_id], [issue_date], [expiry_date], [status], [created_at], [updated_at]) VALUES (13, 11, 13, N'BOCRA/NFP/2026/032', 7, CAST(N'2025-06-18' AS Date), CAST(N'2039-06-14' AS Date), N'Active', CAST(N'2026-03-26T05:48:25.5433333' AS DateTime2), CAST(N'2026-03-26T05:48:25.5433333' AS DateTime2))
GO
INSERT [dbo].[licenses] ([license_id], [application_id], [user_id], [license_number], [license_type_id], [issue_date], [expiry_date], [status], [created_at], [updated_at]) VALUES (14, 7, 30, N'BOCRA/SAP/2026/124', 1, CAST(N'2024-10-06' AS Date), CAST(N'2040-06-10' AS Date), N'Expired', CAST(N'2026-03-26T05:48:25.5433333' AS DateTime2), CAST(N'2026-03-26T05:48:25.5433333' AS DateTime2))
GO
INSERT [dbo].[licenses] ([license_id], [application_id], [user_id], [license_number], [license_type_id], [issue_date], [expiry_date], [status], [created_at], [updated_at]) VALUES (15, 7, 27, N'BOCRA/NFP/2026/014', 9, CAST(N'2024-08-11' AS Date), CAST(N'2039-09-25' AS Date), N'Expired', CAST(N'2026-03-26T05:48:25.5433333' AS DateTime2), CAST(N'2026-03-26T05:48:25.5433333' AS DateTime2))
GO
INSERT [dbo].[licenses] ([license_id], [application_id], [user_id], [license_number], [license_type_id], [issue_date], [expiry_date], [status], [created_at], [updated_at]) VALUES (16, 20, 12, N'BOCRA/SAP/2026/030', 9, CAST(N'2024-09-19' AS Date), CAST(N'2041-02-05' AS Date), N'Expired', CAST(N'2026-03-26T05:48:25.5433333' AS DateTime2), CAST(N'2026-03-26T05:48:25.5433333' AS DateTime2))
GO
INSERT [dbo].[licenses] ([license_id], [application_id], [user_id], [license_number], [license_type_id], [issue_date], [expiry_date], [status], [created_at], [updated_at]) VALUES (17, NULL, 26, N'BOCRA/NFP/2026/076', 5, CAST(N'2025-01-11' AS Date), CAST(N'2039-10-23' AS Date), N'Active', CAST(N'2026-03-26T05:48:25.5433333' AS DateTime2), CAST(N'2026-03-26T05:48:25.5433333' AS DateTime2))
GO
INSERT [dbo].[licenses] ([license_id], [application_id], [user_id], [license_number], [license_type_id], [issue_date], [expiry_date], [status], [created_at], [updated_at]) VALUES (18, 19, 27, N'BOCRA/SAP/2026/147', 1, CAST(N'2025-02-06' AS Date), CAST(N'2039-07-29' AS Date), N'Expired', CAST(N'2026-03-26T05:48:25.5433333' AS DateTime2), CAST(N'2026-03-26T05:48:25.5433333' AS DateTime2))
GO
INSERT [dbo].[licenses] ([license_id], [application_id], [user_id], [license_number], [license_type_id], [issue_date], [expiry_date], [status], [created_at], [updated_at]) VALUES (19, 5, 14, N'BOCRA/NFP/2026/091', 8, CAST(N'2024-10-21' AS Date), CAST(N'2040-05-12' AS Date), N'Expired', CAST(N'2026-03-26T05:48:25.5433333' AS DateTime2), CAST(N'2026-03-26T05:48:25.5433333' AS DateTime2))
GO
INSERT [dbo].[licenses] ([license_id], [application_id], [user_id], [license_number], [license_type_id], [issue_date], [expiry_date], [status], [created_at], [updated_at]) VALUES (20, NULL, 14, N'BOCRA/NFP/2026/009', 8, CAST(N'2025-03-16' AS Date), CAST(N'2039-08-30' AS Date), N'Expired', CAST(N'2026-03-26T05:48:25.5433333' AS DateTime2), CAST(N'2026-03-26T05:48:25.5433333' AS DateTime2))
GO
INSERT [dbo].[licenses] ([license_id], [application_id], [user_id], [license_number], [license_type_id], [issue_date], [expiry_date], [status], [created_at], [updated_at]) VALUES (21, 22, 20, N'BOCRA/SAP/2026/143', 4, CAST(N'2025-12-16' AS Date), CAST(N'2040-02-07' AS Date), N'Active', CAST(N'2026-03-26T05:48:25.5433333' AS DateTime2), CAST(N'2026-03-26T05:48:25.5433333' AS DateTime2))
GO
INSERT [dbo].[licenses] ([license_id], [application_id], [user_id], [license_number], [license_type_id], [issue_date], [expiry_date], [status], [created_at], [updated_at]) VALUES (22, 29, 6, N'BOCRA/NFP/2026/129', 8, CAST(N'2025-08-27' AS Date), CAST(N'2040-10-11' AS Date), N'Expired', CAST(N'2026-03-26T05:48:25.5433333' AS DateTime2), CAST(N'2026-03-26T05:48:25.5433333' AS DateTime2))
GO
INSERT [dbo].[licenses] ([license_id], [application_id], [user_id], [license_number], [license_type_id], [issue_date], [expiry_date], [status], [created_at], [updated_at]) VALUES (23, NULL, 21, N'BOCRA/SAP/2026/075', 2, CAST(N'2026-03-08' AS Date), CAST(N'2040-06-21' AS Date), N'Expired', CAST(N'2026-03-26T05:48:25.5433333' AS DateTime2), CAST(N'2026-03-26T05:48:25.5433333' AS DateTime2))
GO
INSERT [dbo].[licenses] ([license_id], [application_id], [user_id], [license_number], [license_type_id], [issue_date], [expiry_date], [status], [created_at], [updated_at]) VALUES (24, 17, 15, N'BOCRA/NFP/2026/155', 6, CAST(N'2025-07-21' AS Date), CAST(N'2040-10-20' AS Date), N'Expired', CAST(N'2026-03-26T05:48:25.5433333' AS DateTime2), CAST(N'2026-03-26T05:48:25.5433333' AS DateTime2))
GO
INSERT [dbo].[licenses] ([license_id], [application_id], [user_id], [license_number], [license_type_id], [issue_date], [expiry_date], [status], [created_at], [updated_at]) VALUES (25, NULL, 27, N'BOCRA/SAP/2026/142', 6, CAST(N'2025-03-16' AS Date), CAST(N'2040-02-28' AS Date), N'Active', CAST(N'2026-03-26T05:48:25.5433333' AS DateTime2), CAST(N'2026-03-26T05:48:25.5433333' AS DateTime2))
GO
INSERT [dbo].[licenses] ([license_id], [application_id], [user_id], [license_number], [license_type_id], [issue_date], [expiry_date], [status], [created_at], [updated_at]) VALUES (26, NULL, 23, N'BOCRA/SAP/2026/048', 7, CAST(N'2024-07-15' AS Date), CAST(N'2040-11-01' AS Date), N'Expired', CAST(N'2026-03-26T05:48:25.5433333' AS DateTime2), CAST(N'2026-03-26T05:48:25.5433333' AS DateTime2))
GO
SET IDENTITY_INSERT [dbo].[licenses] OFF
GO
SET IDENTITY_INSERT [dbo].[users] ON 
GO
INSERT [dbo].[users] ([user_id], [full_name], [email], [phone], [password_hash], [role], [is_company], [company_name], [created_at], [updated_at]) VALUES (1, N'John Doe', N'john@btc.bw', N'+267 71234567', N'hashedpassword1', N'company_rep', 1, N'Botswana Telecommunications Corporation', CAST(N'2026-03-26T05:39:50.8066667' AS DateTime2), CAST(N'2026-03-26T05:39:50.8066667' AS DateTime2))
GO
INSERT [dbo].[users] ([user_id], [full_name], [email], [phone], [password_hash], [role], [is_company], [company_name], [created_at], [updated_at]) VALUES (2, N'Jane Smith', N'jane@gmail.com', N'+267 72345678', N'hashedpassword2', N'applicant', 0, NULL, CAST(N'2026-03-26T05:39:50.8066667' AS DateTime2), CAST(N'2026-03-26T05:39:50.8066667' AS DateTime2))
GO
INSERT [dbo].[users] ([user_id], [full_name], [email], [phone], [password_hash], [role], [is_company], [company_name], [created_at], [updated_at]) VALUES (3, N'Thabo Kgosi', N'thabo@mascom.bw', N'+267 71234567', N'hash1', N'company_rep', 1, N'Mascom Wireless', CAST(N'2026-03-26T05:48:25.5366667' AS DateTime2), CAST(N'2026-03-26T05:48:25.5366667' AS DateTime2))
GO
INSERT [dbo].[users] ([user_id], [full_name], [email], [phone], [password_hash], [role], [is_company], [company_name], [created_at], [updated_at]) VALUES (4, N'Keabetswe Modise', N'kea@gmail.com', N'+267 72345678', N'hash2', N'applicant', 0, NULL, CAST(N'2026-03-26T05:48:25.5366667' AS DateTime2), CAST(N'2026-03-26T05:48:25.5366667' AS DateTime2))
GO
INSERT [dbo].[users] ([user_id], [full_name], [email], [phone], [password_hash], [role], [is_company], [company_name], [created_at], [updated_at]) VALUES (5, N'Lesego Tau', N'lesego@orange.bw', N'+267 73456789', N'hash3', N'company_rep', 1, N'Orange Botswana', CAST(N'2026-03-26T05:48:25.5366667' AS DateTime2), CAST(N'2026-03-26T05:48:25.5366667' AS DateTime2))
GO
INSERT [dbo].[users] ([user_id], [full_name], [email], [phone], [password_hash], [role], [is_company], [company_name], [created_at], [updated_at]) VALUES (6, N'Kagiso Phiri', N'kagiso@btcl.bw', N'+267 74567890', N'hash4', N'company_rep', 1, N'Botswana Telecom Ltd', CAST(N'2026-03-26T05:48:25.5366667' AS DateTime2), CAST(N'2026-03-26T05:48:25.5366667' AS DateTime2))
GO
INSERT [dbo].[users] ([user_id], [full_name], [email], [phone], [password_hash], [role], [is_company], [company_name], [created_at], [updated_at]) VALUES (7, N'Mpho Ntsima', N'mpho@yahoo.com', N'+267 75678901', N'hash5', N'applicant', 0, NULL, CAST(N'2026-03-26T05:48:25.5366667' AS DateTime2), CAST(N'2026-03-26T05:48:25.5366667' AS DateTime2))
GO
INSERT [dbo].[users] ([user_id], [full_name], [email], [phone], [password_hash], [role], [is_company], [company_name], [created_at], [updated_at]) VALUES (8, N'Tshepo Molefe', N'tshepo@airtel.bw', N'+267 76789012', N'hash6', N'company_rep', 1, N'Airtel Botswana', CAST(N'2026-03-26T05:48:25.5366667' AS DateTime2), CAST(N'2026-03-26T05:48:25.5366667' AS DateTime2))
GO
INSERT [dbo].[users] ([user_id], [full_name], [email], [phone], [password_hash], [role], [is_company], [company_name], [created_at], [updated_at]) VALUES (9, N'Refilwe Dube', N'refilwe@gmail.com', N'+267 77890123', N'hash7', N'applicant', 0, NULL, CAST(N'2026-03-26T05:48:25.5366667' AS DateTime2), CAST(N'2026-03-26T05:48:25.5366667' AS DateTime2))
GO
INSERT [dbo].[users] ([user_id], [full_name], [email], [phone], [password_hash], [role], [is_company], [company_name], [created_at], [updated_at]) VALUES (10, N'Oabile Matlhabaphiri', N'oabile@btc.bw', N'+267 78901234', N'hash8', N'company_rep', 1, N'BTC', CAST(N'2026-03-26T05:48:25.5366667' AS DateTime2), CAST(N'2026-03-26T05:48:25.5366667' AS DateTime2))
GO
INSERT [dbo].[users] ([user_id], [full_name], [email], [phone], [password_hash], [role], [is_company], [company_name], [created_at], [updated_at]) VALUES (11, N'Neo Setlhare', N'neo@be-mobile.bw', N'+267 79012345', N'hash9', N'company_rep', 1, N'beMobile', CAST(N'2026-03-26T05:48:25.5366667' AS DateTime2), CAST(N'2026-03-26T05:48:25.5366667' AS DateTime2))
GO
INSERT [dbo].[users] ([user_id], [full_name], [email], [phone], [password_hash], [role], [is_company], [company_name], [created_at], [updated_at]) VALUES (12, N'Keneilwe Ramokgadi', N'keneilwe@gmail.com', N'+267 70123456', N'hash10', N'applicant', 0, NULL, CAST(N'2026-03-26T05:48:25.5366667' AS DateTime2), CAST(N'2026-03-26T05:48:25.5366667' AS DateTime2))
GO
INSERT [dbo].[users] ([user_id], [full_name], [email], [phone], [password_hash], [role], [is_company], [company_name], [created_at], [updated_at]) VALUES (13, N'Tiro Kgatlhe', N'tiro@zte.co.bw', N'+267 71234567', N'hash11', N'company_rep', 1, N'ZTE Botswana', CAST(N'2026-03-26T05:48:25.5366667' AS DateTime2), CAST(N'2026-03-26T05:48:25.5366667' AS DateTime2))
GO
INSERT [dbo].[users] ([user_id], [full_name], [email], [phone], [password_hash], [role], [is_company], [company_name], [created_at], [updated_at]) VALUES (14, N'Bontle Selebogo', N'bontle@huawei.bw', N'+267 72345678', N'hash12', N'company_rep', 1, N'Huawei Technologies', CAST(N'2026-03-26T05:48:25.5366667' AS DateTime2), CAST(N'2026-03-26T05:48:25.5366667' AS DateTime2))
GO
INSERT [dbo].[users] ([user_id], [full_name], [email], [phone], [password_hash], [role], [is_company], [company_name], [created_at], [updated_at]) VALUES (15, N'Kabo Motsumi', N'kabo@gmail.com', N'+267 73456789', N'hash13', N'applicant', 0, NULL, CAST(N'2026-03-26T05:48:25.5366667' AS DateTime2), CAST(N'2026-03-26T05:48:25.5366667' AS DateTime2))
GO
INSERT [dbo].[users] ([user_id], [full_name], [email], [phone], [password_hash], [role], [is_company], [company_name], [created_at], [updated_at]) VALUES (16, N'Dineo Makgabenyane', N'dineo@mtc.bw', N'+267 74567890', N'hash14', N'company_rep', 1, N'MTC', CAST(N'2026-03-26T05:48:25.5366667' AS DateTime2), CAST(N'2026-03-26T05:48:25.5366667' AS DateTime2))
GO
INSERT [dbo].[users] ([user_id], [full_name], [email], [phone], [password_hash], [role], [is_company], [company_name], [created_at], [updated_at]) VALUES (17, N'Kagiso Tshiamo', N'kagiso.t@gmail.com', N'+267 75678901', N'hash15', N'applicant', 0, NULL, CAST(N'2026-03-26T05:48:25.5366667' AS DateTime2), CAST(N'2026-03-26T05:48:25.5366667' AS DateTime2))
GO
INSERT [dbo].[users] ([user_id], [full_name], [email], [phone], [password_hash], [role], [is_company], [company_name], [created_at], [updated_at]) VALUES (18, N'Masego Rammala', N'masego@vodacom.bw', N'+267 76789012', N'hash16', N'company_rep', 1, N'Vodacom', CAST(N'2026-03-26T05:48:25.5366667' AS DateTime2), CAST(N'2026-03-26T05:48:25.5366667' AS DateTime2))
GO
INSERT [dbo].[users] ([user_id], [full_name], [email], [phone], [password_hash], [role], [is_company], [company_name], [created_at], [updated_at]) VALUES (19, N'Otsile Motswagole', N'otsile@gmail.com', N'+267 77890123', N'hash17', N'applicant', 0, NULL, CAST(N'2026-03-26T05:48:25.5366667' AS DateTime2), CAST(N'2026-03-26T05:48:25.5366667' AS DateTime2))
GO
INSERT [dbo].[users] ([user_id], [full_name], [email], [phone], [password_hash], [role], [is_company], [company_name], [created_at], [updated_at]) VALUES (20, N'Tumelo Mokgosi', N'tumelo@orange.bw', N'+267 78901234', N'hash18', N'company_rep', 1, N'Orange', CAST(N'2026-03-26T05:48:25.5366667' AS DateTime2), CAST(N'2026-03-26T05:48:25.5366667' AS DateTime2))
GO
INSERT [dbo].[users] ([user_id], [full_name], [email], [phone], [password_hash], [role], [is_company], [company_name], [created_at], [updated_at]) VALUES (21, N'Gontse Kgosietsile', N'gontse@gmail.com', N'+267 79012345', N'hash19', N'applicant', 0, NULL, CAST(N'2026-03-26T05:48:25.5366667' AS DateTime2), CAST(N'2026-03-26T05:48:25.5366667' AS DateTime2))
GO
INSERT [dbo].[users] ([user_id], [full_name], [email], [phone], [password_hash], [role], [is_company], [company_name], [created_at], [updated_at]) VALUES (22, N'Boitumelo Phiri', N'boi@btcl.bw', N'+267 70123456', N'hash20', N'company_rep', 1, N'BTCL', CAST(N'2026-03-26T05:48:25.5366667' AS DateTime2), CAST(N'2026-03-26T05:48:25.5366667' AS DateTime2))
GO
INSERT [dbo].[users] ([user_id], [full_name], [email], [phone], [password_hash], [role], [is_company], [company_name], [created_at], [updated_at]) VALUES (23, N'Kaboentle Tau', N'kaboentle@gmail.com', N'+267 71234567', N'hash21', N'applicant', 0, NULL, CAST(N'2026-03-26T05:48:25.5366667' AS DateTime2), CAST(N'2026-03-26T05:48:25.5366667' AS DateTime2))
GO
INSERT [dbo].[users] ([user_id], [full_name], [email], [phone], [password_hash], [role], [is_company], [company_name], [created_at], [updated_at]) VALUES (24, N'Refentse Modise', N'refentse@airtel.bw', N'+267 72345678', N'hash22', N'company_rep', 1, N'Airtel', CAST(N'2026-03-26T05:48:25.5366667' AS DateTime2), CAST(N'2026-03-26T05:48:25.5366667' AS DateTime2))
GO
INSERT [dbo].[users] ([user_id], [full_name], [email], [phone], [password_hash], [role], [is_company], [company_name], [created_at], [updated_at]) VALUES (25, N'Lesedi Ntsima', N'lesedi@gmail.com', N'+267 73456789', N'hash23', N'applicant', 0, NULL, CAST(N'2026-03-26T05:48:25.5366667' AS DateTime2), CAST(N'2026-03-26T05:48:25.5366667' AS DateTime2))
GO
INSERT [dbo].[users] ([user_id], [full_name], [email], [phone], [password_hash], [role], [is_company], [company_name], [created_at], [updated_at]) VALUES (26, N'Tshegofatso Molefe', N'tshego@mascom.bw', N'+267 74567890', N'hash24', N'company_rep', 1, N'Mascom', CAST(N'2026-03-26T05:48:25.5366667' AS DateTime2), CAST(N'2026-03-26T05:48:25.5366667' AS DateTime2))
GO
INSERT [dbo].[users] ([user_id], [full_name], [email], [phone], [password_hash], [role], [is_company], [company_name], [created_at], [updated_at]) VALUES (27, N'Mphoentle Dube', N'mphoentle@gmail.com', N'+267 75678901', N'hash25', N'applicant', 0, NULL, CAST(N'2026-03-26T05:48:25.5366667' AS DateTime2), CAST(N'2026-03-26T05:48:25.5366667' AS DateTime2))
GO
INSERT [dbo].[users] ([user_id], [full_name], [email], [phone], [password_hash], [role], [is_company], [company_name], [created_at], [updated_at]) VALUES (28, N'Oabile Matlhabaphiri Jr', N'oabile.jr@gmail.com', N'+267 76789012', N'hash26', N'applicant', 0, NULL, CAST(N'2026-03-26T05:48:25.5366667' AS DateTime2), CAST(N'2026-03-26T05:48:25.5366667' AS DateTime2))
GO
INSERT [dbo].[users] ([user_id], [full_name], [email], [phone], [password_hash], [role], [is_company], [company_name], [created_at], [updated_at]) VALUES (29, N'Neo Setlhare II', N'neo2@be-mobile.bw', N'+267 77890123', N'hash27', N'company_rep', 1, N'beMobile', CAST(N'2026-03-26T05:48:25.5366667' AS DateTime2), CAST(N'2026-03-26T05:48:25.5366667' AS DateTime2))
GO
INSERT [dbo].[users] ([user_id], [full_name], [email], [phone], [password_hash], [role], [is_company], [company_name], [created_at], [updated_at]) VALUES (30, N'Keneilwe Ramokgadi', N'keneilwe2@gmail.com', N'+267 78901234', N'hash28', N'applicant', 0, NULL, CAST(N'2026-03-26T05:48:25.5366667' AS DateTime2), CAST(N'2026-03-26T05:48:25.5366667' AS DateTime2))
GO
INSERT [dbo].[users] ([user_id], [full_name], [email], [phone], [password_hash], [role], [is_company], [company_name], [created_at], [updated_at]) VALUES (31, N'Tiro Kgatlhe', N'tiro2@zte.co.bw', N'+267 79012345', N'hash29', N'company_rep', 1, N'ZTE', CAST(N'2026-03-26T05:48:25.5366667' AS DateTime2), CAST(N'2026-03-26T05:48:25.5366667' AS DateTime2))
GO
INSERT [dbo].[users] ([user_id], [full_name], [email], [phone], [password_hash], [role], [is_company], [company_name], [created_at], [updated_at]) VALUES (32, N'Bontle Selebogo', N'bontle2@huawei.bw', N'+267 70123456', N'hash30', N'company_rep', 1, N'Huawei', CAST(N'2026-03-26T05:48:25.5366667' AS DateTime2), CAST(N'2026-03-26T05:48:25.5366667' AS DateTime2))
GO
SET IDENTITY_INSERT [dbo].[users] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__equipmen__3960AC691839CD74]    Script Date: 26/03/2026 05:59:22 ******/
ALTER TABLE [dbo].[equipment_approvals] ADD UNIQUE NONCLUSTERED 
(
	[ta_number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__licenses__D482A0033F028D9C]    Script Date: 26/03/2026 05:59:22 ******/
ALTER TABLE [dbo].[licenses] ADD UNIQUE NONCLUSTERED 
(
	[license_number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__users__AB6E6164521E5E7F]    Script Date: 26/03/2026 05:59:22 ******/
ALTER TABLE [dbo].[users] ADD UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[complaints] ADD  DEFAULT ('Pending') FOR [status]
GO
ALTER TABLE [dbo].[complaints] ADD  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[complaints] ADD  DEFAULT (getdate()) FOR [updated_at]
GO
ALTER TABLE [dbo].[documents] ADD  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[equipment_approvals] ADD  DEFAULT ('Approved') FOR [status]
GO
ALTER TABLE [dbo].[equipment_approvals] ADD  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[equipment_approvals] ADD  DEFAULT (getdate()) FOR [updated_at]
GO
ALTER TABLE [dbo].[license_applications] ADD  DEFAULT ('Pending') FOR [status]
GO
ALTER TABLE [dbo].[license_applications] ADD  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[license_applications] ADD  DEFAULT (getdate()) FOR [updated_at]
GO
ALTER TABLE [dbo].[license_types] ADD  DEFAULT ((15)) FOR [typical_duration_years]
GO
ALTER TABLE [dbo].[license_types] ADD  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[licenses] ADD  DEFAULT ('Active') FOR [status]
GO
ALTER TABLE [dbo].[licenses] ADD  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[licenses] ADD  DEFAULT (getdate()) FOR [updated_at]
GO
ALTER TABLE [dbo].[users] ADD  DEFAULT ('applicant') FOR [role]
GO
ALTER TABLE [dbo].[users] ADD  DEFAULT ((0)) FOR [is_company]
GO
ALTER TABLE [dbo].[users] ADD  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[users] ADD  DEFAULT (getdate()) FOR [updated_at]
GO
ALTER TABLE [dbo].[complaints]  WITH CHECK ADD  CONSTRAINT [fk_complaints_user] FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([user_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[complaints] CHECK CONSTRAINT [fk_complaints_user]
GO
ALTER TABLE [dbo].[equipment_approvals]  WITH CHECK ADD  CONSTRAINT [fk_ea_user] FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([user_id])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[equipment_approvals] CHECK CONSTRAINT [fk_ea_user]
GO
ALTER TABLE [dbo].[license_applications]  WITH CHECK ADD  CONSTRAINT [fk_la_type] FOREIGN KEY([license_type_id])
REFERENCES [dbo].[license_types] ([type_id])
GO
ALTER TABLE [dbo].[license_applications] CHECK CONSTRAINT [fk_la_type]
GO
ALTER TABLE [dbo].[license_applications]  WITH CHECK ADD  CONSTRAINT [fk_la_user] FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([user_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[license_applications] CHECK CONSTRAINT [fk_la_user]
GO
ALTER TABLE [dbo].[licenses]  WITH CHECK ADD  CONSTRAINT [fk_licenses_application] FOREIGN KEY([application_id])
REFERENCES [dbo].[license_applications] ([application_id])
GO
ALTER TABLE [dbo].[licenses] CHECK CONSTRAINT [fk_licenses_application]
GO
ALTER TABLE [dbo].[licenses]  WITH CHECK ADD  CONSTRAINT [fk_licenses_user] FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([user_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[licenses] CHECK CONSTRAINT [fk_licenses_user]
GO
ALTER TABLE [dbo].[complaints]  WITH CHECK ADD  CONSTRAINT [chk_complaint_status] CHECK  (([status]='Rejected' OR [status]='Closed' OR [status]='Resolved' OR [status]='Under_Investigation' OR [status]='Pending'))
GO
ALTER TABLE [dbo].[complaints] CHECK CONSTRAINT [chk_complaint_status]
GO
ALTER TABLE [dbo].[complaints]  WITH CHECK ADD  CONSTRAINT [chk_complaint_type] CHECK  (([complaint_type]='Other' OR [complaint_type]='Internet_Access_Contract' OR [complaint_type]='Mobile_Phone_Issue' OR [complaint_type]='Fault_Repair' OR [complaint_type]='Repair_Delay' OR [complaint_type]='Interconnection' OR [complaint_type]='Service_Failure_Repair' OR [complaint_type]='Billing'))
GO
ALTER TABLE [dbo].[complaints] CHECK CONSTRAINT [chk_complaint_type]
GO
ALTER TABLE [dbo].[documents]  WITH CHECK ADD  CONSTRAINT [chk_doc_category] CHECK  (([category]='Application_Form' OR [category]='Report' OR [category]='Guideline' OR [category]='Legislation'))
GO
ALTER TABLE [dbo].[documents] CHECK CONSTRAINT [chk_doc_category]
GO
ALTER TABLE [dbo].[equipment_approvals]  WITH CHECK ADD  CONSTRAINT [chk_equipment_status] CHECK  (([status]='Expired' OR [status]='Rejected' OR [status]='Pending' OR [status]='Approved'))
GO
ALTER TABLE [dbo].[equipment_approvals] CHECK CONSTRAINT [chk_equipment_status]
GO
ALTER TABLE [dbo].[license_applications]  WITH CHECK ADD  CONSTRAINT [chk_application_status] CHECK  (([status]='Suspended' OR [status]='Expired' OR [status]='Rejected' OR [status]='Approved' OR [status]='Under_Review' OR [status]='Pending'))
GO
ALTER TABLE [dbo].[license_applications] CHECK CONSTRAINT [chk_application_status]
GO
ALTER TABLE [dbo].[license_types]  WITH CHECK ADD  CONSTRAINT [chk_license_category] CHECK  (([category]='Postal' OR [category]='CSP' OR [category]='SAP' OR [category]='NFP'))
GO
ALTER TABLE [dbo].[license_types] CHECK CONSTRAINT [chk_license_category]
GO
ALTER TABLE [dbo].[licenses]  WITH CHECK ADD  CONSTRAINT [chk_license_status] CHECK  (([status]='Revoked' OR [status]='Suspended' OR [status]='Expired' OR [status]='Active'))
GO
ALTER TABLE [dbo].[licenses] CHECK CONSTRAINT [chk_license_status]
GO
ALTER TABLE [dbo].[users]  WITH CHECK ADD  CONSTRAINT [chk_users_role] CHECK  (([role]='admin' OR [role]='company_rep' OR [role]='applicant'))
GO
ALTER TABLE [dbo].[users] CHECK CONSTRAINT [chk_users_role]
GO

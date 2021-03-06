USE [MRP]
GO
/****** Object:  Table [dbo].[Process]    Script Date: 2021-07-01 오후 2:02:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Process](
	[PrcIdx] [int] IDENTITY(1,1) NOT NULL,
	[SchIdx] [int] NOT NULL,
	[PrcCD] [char](14) NOT NULL,
	[PrcDate] [date] NOT NULL,
	[PrcLoadTime] [int] NULL,
	[PrcStartTime] [time](7) NULL,
	[PrcEndTime] [time](7) NULL,
	[PrcFacilityID] [char](8) NULL,
	[PrcResult] [bit] NOT NULL,
	[RegDate] [datetime] NULL,
	[RegID] [varchar](20) NULL,
	[ModDate] [datetime] NULL,
	[ModID] [varchar](20) NULL,
 CONSTRAINT [PK_Process] PRIMARY KEY CLUSTERED 
(
	[PrcIdx] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Schedules]    Script Date: 2021-07-01 오후 2:02:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Schedules](
	[SchIdx] [int] IDENTITY(1,1) NOT NULL,
	[PlantCode] [char](8) NOT NULL,
	[SchDate] [date] NOT NULL,
	[SchLoadTime] [int] NOT NULL,
	[SchStartTime] [time](7) NULL,
	[SchEndTime] [time](7) NULL,
	[SchFacilityID] [char](8) NULL,
	[SchAmount] [int] NULL,
	[RegDate] [datetime] NULL,
	[RegID] [varchar](20) NULL,
	[ModDate] [datetime] NULL,
	[ModID] [varchar](20) NULL,
 CONSTRAINT [PK_Schedules] PRIMARY KEY CLUSTERED 
(
	[SchIdx] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Settings]    Script Date: 2021-07-01 오후 2:02:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Settings](
	[BasicCode] [char](8) NOT NULL,
	[CodeName] [nvarchar](100) NOT NULL,
	[CodeDesc] [nvarchar](max) NULL,
	[RegDate] [datetime] NULL,
	[RegID] [varchar](20) NULL,
	[ModDate] [datetime] NULL,
	[ModID] [varchar](20) NULL,
 CONSTRAINT [PK_Settings] PRIMARY KEY CLUSTERED 
(
	[BasicCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Process] ON 

INSERT [dbo].[Process] ([PrcIdx], [SchIdx], [PrcCD], [PrcDate], [PrcLoadTime], [PrcStartTime], [PrcEndTime], [PrcFacilityID], [PrcResult], [RegDate], [RegID], [ModDate], [ModID]) VALUES (4, 4, N'PRC20210629001', CAST(N'2021-06-29' AS Date), 5, NULL, NULL, N'FAC10002', 1, CAST(N'2021-06-29T10:48:53.340' AS DateTime), N'MRP', NULL, NULL)
INSERT [dbo].[Process] ([PrcIdx], [SchIdx], [PrcCD], [PrcDate], [PrcLoadTime], [PrcStartTime], [PrcEndTime], [PrcFacilityID], [PrcResult], [RegDate], [RegID], [ModDate], [ModID]) VALUES (5, 4, N'PRC20210629002', CAST(N'2021-06-29' AS Date), 5, NULL, NULL, N'FAC10002', 1, CAST(N'2021-06-29T10:49:34.350' AS DateTime), N'MRP', CAST(N'2021-06-29T11:20:11.000' AS DateTime), N'SYS')
INSERT [dbo].[Process] ([PrcIdx], [SchIdx], [PrcCD], [PrcDate], [PrcLoadTime], [PrcStartTime], [PrcEndTime], [PrcFacilityID], [PrcResult], [RegDate], [RegID], [ModDate], [ModID]) VALUES (6, 4, N'PRC20210629003', CAST(N'2021-06-29' AS Date), 5, NULL, NULL, N'FAC10002', 1, CAST(N'2021-06-29T12:23:00.430' AS DateTime), N'MRP', CAST(N'2021-06-29T12:23:13.000' AS DateTime), N'SYS')
INSERT [dbo].[Process] ([PrcIdx], [SchIdx], [PrcCD], [PrcDate], [PrcLoadTime], [PrcStartTime], [PrcEndTime], [PrcFacilityID], [PrcResult], [RegDate], [RegID], [ModDate], [ModID]) VALUES (7, 5, N'PRC20210630001', CAST(N'2021-06-30' AS Date), 15, NULL, NULL, N'FAC10002', 1, CAST(N'2021-06-30T09:36:44.097' AS DateTime), N'MRP', CAST(N'2021-06-30T09:37:10.000' AS DateTime), N'SYS')
INSERT [dbo].[Process] ([PrcIdx], [SchIdx], [PrcCD], [PrcDate], [PrcLoadTime], [PrcStartTime], [PrcEndTime], [PrcFacilityID], [PrcResult], [RegDate], [RegID], [ModDate], [ModID]) VALUES (8, 5, N'PRC20210630002', CAST(N'2021-06-30' AS Date), 15, NULL, NULL, N'FAC10002', 1, CAST(N'2021-06-30T09:44:46.840' AS DateTime), N'MRP', NULL, NULL)
INSERT [dbo].[Process] ([PrcIdx], [SchIdx], [PrcCD], [PrcDate], [PrcLoadTime], [PrcStartTime], [PrcEndTime], [PrcFacilityID], [PrcResult], [RegDate], [RegID], [ModDate], [ModID]) VALUES (9, 5, N'PRC20210630003', CAST(N'2021-06-30' AS Date), 15, NULL, NULL, N'FAC10002', 1, CAST(N'2021-06-30T10:03:11.560' AS DateTime), N'MRP', CAST(N'2021-06-30T10:05:05.000' AS DateTime), N'SYS')
INSERT [dbo].[Process] ([PrcIdx], [SchIdx], [PrcCD], [PrcDate], [PrcLoadTime], [PrcStartTime], [PrcEndTime], [PrcFacilityID], [PrcResult], [RegDate], [RegID], [ModDate], [ModID]) VALUES (10, 5, N'PRC20210630004', CAST(N'2021-06-30' AS Date), 15, NULL, NULL, N'FAC10002', 0, CAST(N'2021-06-30T10:05:17.590' AS DateTime), N'MRP', CAST(N'2021-06-30T10:05:58.000' AS DateTime), N'SYS')
INSERT [dbo].[Process] ([PrcIdx], [SchIdx], [PrcCD], [PrcDate], [PrcLoadTime], [PrcStartTime], [PrcEndTime], [PrcFacilityID], [PrcResult], [RegDate], [RegID], [ModDate], [ModID]) VALUES (11, 5, N'PRC20210630005', CAST(N'2021-06-30' AS Date), 15, NULL, NULL, N'FAC10002', 0, CAST(N'2021-06-30T10:09:58.857' AS DateTime), N'MRP', CAST(N'2021-06-30T10:10:33.000' AS DateTime), N'SYS')
INSERT [dbo].[Process] ([PrcIdx], [SchIdx], [PrcCD], [PrcDate], [PrcLoadTime], [PrcStartTime], [PrcEndTime], [PrcFacilityID], [PrcResult], [RegDate], [RegID], [ModDate], [ModID]) VALUES (12, 5, N'PRC20210630006', CAST(N'2021-06-30' AS Date), 15, NULL, NULL, N'FAC10002', 0, CAST(N'2021-06-30T10:36:03.887' AS DateTime), N'MRP', CAST(N'2021-06-30T10:36:55.000' AS DateTime), N'SYS')
INSERT [dbo].[Process] ([PrcIdx], [SchIdx], [PrcCD], [PrcDate], [PrcLoadTime], [PrcStartTime], [PrcEndTime], [PrcFacilityID], [PrcResult], [RegDate], [RegID], [ModDate], [ModID]) VALUES (13, 5, N'PRC20210630007', CAST(N'2021-06-30' AS Date), 15, NULL, NULL, N'FAC10002', 1, CAST(N'2021-06-30T10:37:03.020' AS DateTime), N'MRP', CAST(N'2021-06-30T10:37:22.000' AS DateTime), N'SYS')
INSERT [dbo].[Process] ([PrcIdx], [SchIdx], [PrcCD], [PrcDate], [PrcLoadTime], [PrcStartTime], [PrcEndTime], [PrcFacilityID], [PrcResult], [RegDate], [RegID], [ModDate], [ModID]) VALUES (14, 5, N'PRC20210630008', CAST(N'2021-06-30' AS Date), 15, NULL, NULL, N'FAC10002', 1, CAST(N'2021-06-30T10:50:16.727' AS DateTime), N'MRP', NULL, NULL)
INSERT [dbo].[Process] ([PrcIdx], [SchIdx], [PrcCD], [PrcDate], [PrcLoadTime], [PrcStartTime], [PrcEndTime], [PrcFacilityID], [PrcResult], [RegDate], [RegID], [ModDate], [ModID]) VALUES (15, 5, N'PRC20210630009', CAST(N'2021-06-30' AS Date), 15, NULL, NULL, N'FAC10002', 0, CAST(N'2021-06-30T10:50:43.167' AS DateTime), N'MRP', CAST(N'2021-06-30T11:04:14.000' AS DateTime), N'SYS')
INSERT [dbo].[Process] ([PrcIdx], [SchIdx], [PrcCD], [PrcDate], [PrcLoadTime], [PrcStartTime], [PrcEndTime], [PrcFacilityID], [PrcResult], [RegDate], [RegID], [ModDate], [ModID]) VALUES (16, 5, N'PRC20210630010', CAST(N'2021-06-30' AS Date), 15, NULL, NULL, N'FAC10002', 1, CAST(N'2021-06-30T11:10:11.373' AS DateTime), N'MRP', CAST(N'2021-06-30T11:11:08.000' AS DateTime), N'SYS')
INSERT [dbo].[Process] ([PrcIdx], [SchIdx], [PrcCD], [PrcDate], [PrcLoadTime], [PrcStartTime], [PrcEndTime], [PrcFacilityID], [PrcResult], [RegDate], [RegID], [ModDate], [ModID]) VALUES (17, 7, N'PRC20210701001', CAST(N'2021-07-01' AS Date), 5, NULL, NULL, N'FAC10002', 1, CAST(N'2021-07-01T09:09:00.450' AS DateTime), N'MRP', CAST(N'2021-07-01T09:09:34.000' AS DateTime), N'SYS')
INSERT [dbo].[Process] ([PrcIdx], [SchIdx], [PrcCD], [PrcDate], [PrcLoadTime], [PrcStartTime], [PrcEndTime], [PrcFacilityID], [PrcResult], [RegDate], [RegID], [ModDate], [ModID]) VALUES (18, 7, N'PRC20210701002', CAST(N'2021-07-01' AS Date), 5, NULL, NULL, N'FAC10002', 1, CAST(N'2021-07-01T09:09:49.023' AS DateTime), N'MRP', CAST(N'2021-07-01T09:09:59.000' AS DateTime), N'SYS')
INSERT [dbo].[Process] ([PrcIdx], [SchIdx], [PrcCD], [PrcDate], [PrcLoadTime], [PrcStartTime], [PrcEndTime], [PrcFacilityID], [PrcResult], [RegDate], [RegID], [ModDate], [ModID]) VALUES (19, 7, N'PRC20210701003', CAST(N'2021-07-01' AS Date), 5, NULL, NULL, N'FAC10002', 1, CAST(N'2021-07-01T09:10:04.087' AS DateTime), N'MRP', NULL, NULL)
SET IDENTITY_INSERT [dbo].[Process] OFF
GO
SET IDENTITY_INSERT [dbo].[Schedules] ON 

INSERT [dbo].[Schedules] ([SchIdx], [PlantCode], [SchDate], [SchLoadTime], [SchStartTime], [SchEndTime], [SchFacilityID], [SchAmount], [RegDate], [RegID], [ModDate], [ModID]) VALUES (1, N'PC010002', CAST(N'2021-06-24' AS Date), 15, CAST(N'10:00:00' AS Time), CAST(N'18:00:00' AS Time), N'FAC10001', 25, CAST(N'2021-06-24T18:00:00.000' AS DateTime), N'SYS', CAST(N'2021-06-25T14:01:32.617' AS DateTime), N'MRP')
INSERT [dbo].[Schedules] ([SchIdx], [PlantCode], [SchDate], [SchLoadTime], [SchStartTime], [SchEndTime], [SchFacilityID], [SchAmount], [RegDate], [RegID], [ModDate], [ModID]) VALUES (2, N'PC010001', CAST(N'2021-06-23' AS Date), 10, CAST(N'09:00:00' AS Time), CAST(N'05:00:00' AS Time), N'FAC10001', 20, CAST(N'2021-06-25T14:18:26.423' AS DateTime), N'MRP', NULL, NULL)
INSERT [dbo].[Schedules] ([SchIdx], [PlantCode], [SchDate], [SchLoadTime], [SchStartTime], [SchEndTime], [SchFacilityID], [SchAmount], [RegDate], [RegID], [ModDate], [ModID]) VALUES (3, N'PC010002', CAST(N'2021-06-28' AS Date), 10, NULL, NULL, N'FAC10002', 40, CAST(N'2021-06-28T09:21:06.007' AS DateTime), N'MRP', CAST(N'2021-06-28T09:33:53.170' AS DateTime), N'MRP')
INSERT [dbo].[Schedules] ([SchIdx], [PlantCode], [SchDate], [SchLoadTime], [SchStartTime], [SchEndTime], [SchFacilityID], [SchAmount], [RegDate], [RegID], [ModDate], [ModID]) VALUES (4, N'PC010002', CAST(N'2021-06-29' AS Date), 5, NULL, NULL, N'FAC10002', 30, CAST(N'2021-06-29T09:14:37.283' AS DateTime), N'MRP', NULL, NULL)
INSERT [dbo].[Schedules] ([SchIdx], [PlantCode], [SchDate], [SchLoadTime], [SchStartTime], [SchEndTime], [SchFacilityID], [SchAmount], [RegDate], [RegID], [ModDate], [ModID]) VALUES (5, N'PC010002', CAST(N'2021-06-30' AS Date), 15, NULL, NULL, N'FAC10002', 30, CAST(N'2021-06-30T09:20:56.450' AS DateTime), N'MRP', NULL, NULL)
INSERT [dbo].[Schedules] ([SchIdx], [PlantCode], [SchDate], [SchLoadTime], [SchStartTime], [SchEndTime], [SchFacilityID], [SchAmount], [RegDate], [RegID], [ModDate], [ModID]) VALUES (6, N'PC010001', CAST(N'2021-06-30' AS Date), 10, NULL, NULL, N'FAC10002', 20, CAST(N'2021-06-30T11:56:57.790' AS DateTime), N'MRP', NULL, NULL)
INSERT [dbo].[Schedules] ([SchIdx], [PlantCode], [SchDate], [SchLoadTime], [SchStartTime], [SchEndTime], [SchFacilityID], [SchAmount], [RegDate], [RegID], [ModDate], [ModID]) VALUES (7, N'PC010002', CAST(N'2021-07-01' AS Date), 5, NULL, NULL, N'FAC10002', 20, CAST(N'2021-07-01T09:07:49.697' AS DateTime), N'MRP', NULL, NULL)
SET IDENTITY_INSERT [dbo].[Schedules] OFF
GO
INSERT [dbo].[Settings] ([BasicCode], [CodeName], [CodeDesc], [RegDate], [RegID], [ModDate], [ModID]) VALUES (N'FAC10001', N'설비1', N'생산설비1', CAST(N'2021-06-24T14:07:30.750' AS DateTime), N'MRP', CAST(N'2021-06-24T14:09:12.103' AS DateTime), N'MRP')
INSERT [dbo].[Settings] ([BasicCode], [CodeName], [CodeDesc], [RegDate], [RegID], [ModDate], [ModID]) VALUES (N'FAC10002', N'설비2', N'생산설비2', CAST(N'2021-06-24T14:09:03.597' AS DateTime), N'MRP', NULL, NULL)
INSERT [dbo].[Settings] ([BasicCode], [CodeName], [CodeDesc], [RegDate], [RegID], [ModDate], [ModID]) VALUES (N'PC010001', N'수원공장', N'수원공장(코드)11', CAST(N'2012-06-24T00:00:00.000' AS DateTime), N'SYS', CAST(N'2021-06-28T10:45:09.510' AS DateTime), N'MRP')
INSERT [dbo].[Settings] ([BasicCode], [CodeName], [CodeDesc], [RegDate], [RegID], [ModDate], [ModID]) VALUES (N'PC010002', N'부산공장', N'부산공장', CAST(N'2021-06-24T13:58:09.990' AS DateTime), N'MRP', CAST(N'2021-06-28T10:45:04.157' AS DateTime), N'MRP')
INSERT [dbo].[Settings] ([BasicCode], [CodeName], [CodeDesc], [RegDate], [RegID], [ModDate], [ModID]) VALUES (N'PC010004', N'대전공장', N'대전공장', CAST(N'2021-06-24T13:57:23.303' AS DateTime), N'MRP', CAST(N'2021-06-28T10:45:19.573' AS DateTime), N'MRP')
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UK_Process_PrcCD]    Script Date: 2021-07-01 오후 2:02:05 ******/
ALTER TABLE [dbo].[Process] ADD  CONSTRAINT [UK_Process_PrcCD] UNIQUE NONCLUSTERED 
(
	[PrcCD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Process]  WITH NOCHECK ADD  CONSTRAINT [FK_Process_Schedules] FOREIGN KEY([SchIdx])
REFERENCES [dbo].[Schedules] ([SchIdx])
GO
ALTER TABLE [dbo].[Process] NOCHECK CONSTRAINT [FK_Process_Schedules]
GO
ALTER TABLE [dbo].[Process]  WITH NOCHECK ADD  CONSTRAINT [FK_Process_Settings] FOREIGN KEY([PrcFacilityID])
REFERENCES [dbo].[Settings] ([BasicCode])
GO
ALTER TABLE [dbo].[Process] NOCHECK CONSTRAINT [FK_Process_Settings]
GO
ALTER TABLE [dbo].[Schedules]  WITH NOCHECK ADD  CONSTRAINT [FK_Schedules_Settings] FOREIGN KEY([PlantCode])
REFERENCES [dbo].[Settings] ([BasicCode])
GO
ALTER TABLE [dbo].[Schedules] NOCHECK CONSTRAINT [FK_Schedules_Settings]
GO
ALTER TABLE [dbo].[Schedules]  WITH NOCHECK ADD  CONSTRAINT [FK_Schedules_Settings1] FOREIGN KEY([SchFacilityID])
REFERENCES [dbo].[Settings] ([BasicCode])
GO
ALTER TABLE [dbo].[Schedules] NOCHECK CONSTRAINT [FK_Schedules_Settings1]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'공정계획 순번' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Schedules', @level2type=N'COLUMN',@level2name=N'SchIdx'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'공장코드' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Schedules', @level2type=N'COLUMN',@level2name=N'PlantCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'공정계획일' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Schedules', @level2type=N'COLUMN',@level2name=N'SchDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'로드타임(초)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Schedules', @level2type=N'COLUMN',@level2name=N'SchLoadTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'시작시간(계획)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Schedules', @level2type=N'COLUMN',@level2name=N'SchStartTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'종료시간(계획)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Schedules', @level2type=N'COLUMN',@level2name=N'SchEndTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'생산설비ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Schedules', @level2type=N'COLUMN',@level2name=N'SchFacilityID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'목표수량(계획)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Schedules', @level2type=N'COLUMN',@level2name=N'SchAmount'
GO

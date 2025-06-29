USE [master]
GO
/****** Object:  Database [BridgeScales]    Script Date: 26.06.2025 19:16:45 ******/
CREATE DATABASE [BridgeScales]
GO
USE [BridgeScales]
GO
/****** Object:  Table [dbo].[Clients]    Script Date: 26.06.2025 19:16:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clients](
	[ClientID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Phone] [nvarchar](20) NULL,
	[Email] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ClientID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Maintenance]    Script Date: 26.06.2025 19:16:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Maintenance](
	[MaintenanceID] [int] IDENTITY(1,1) NOT NULL,
	[ScaleID] [int] NOT NULL,
	[MaintenanceDate] [date] NOT NULL,
	[MaintenanceType] [nvarchar](50) NOT NULL,
	[TechnicianID] [int] NOT NULL,
	[Description] [nvarchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaintenanceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Scales]    Script Date: 26.06.2025 19:16:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Scales](
	[ScaleID] [int] IDENTITY(1,1) NOT NULL,
	[Model] [nvarchar](50) NOT NULL,
	[SerialNumber] [nvarchar](50) NOT NULL,
	[MaxCapacity] [decimal](10, 2) NOT NULL,
	[InstallationDate] [date] NULL,
	[LastCalibrationDate] [date] NULL,
	[Location] [nvarchar](100) NULL,
	[IsActive] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[ScaleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 26.06.2025 19:16:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](100) NOT NULL,
	[FullName] [nvarchar](100) NOT NULL,
	[Role] [nvarchar](50) NOT NULL,
	[IsActive] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Weighings]    Script Date: 26.06.2025 19:16:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Weighings](
	[WeighingID] [int] IDENTITY(1,1) NOT NULL,
	[ScaleID] [int] NOT NULL,
	[ClientID] [int] NULL,
	[VehicleNumber] [nvarchar](20) NULL,
	[GrossWeight] [decimal](10, 2) NULL,
	[TareWeight] [decimal](10, 2) NULL,
	[WeighingDateTime] [datetime] NOT NULL,
	[OperatorID] [int] NOT NULL,
	[Notes] [nvarchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[WeighingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Clients] ON 

INSERT [dbo].[Clients] ([ClientID], [Name], [Phone], [Email]) VALUES (1, N'ООО "СтройМатериалы"', N'+74951234567', N'info@stroymat.ru')
INSERT [dbo].[Clients] ([ClientID], [Name], [Phone], [Email]) VALUES (2, N'ЗАО "АгроПром"', N'+74957654321', N'agro@agroprom.ru')
INSERT [dbo].[Clients] ([ClientID], [Name], [Phone], [Email]) VALUES (3, N'ИП Петров А.В.', N'+74953334455', N'petrov@mail.ru')
INSERT [dbo].[Clients] ([ClientID], [Name], [Phone], [Email]) VALUES (4, N'ООО "МеталлТрейд"', N'+74842223344', N'metal@metalltrade.ru')
INSERT [dbo].[Clients] ([ClientID], [Name], [Phone], [Email]) VALUES (5, N'АО "ТрансГруз"', N'+74956667788', N'transport@transgruz.ru')
SET IDENTITY_INSERT [dbo].[Clients] OFF
GO
SET IDENTITY_INSERT [dbo].[Maintenance] ON 

INSERT [dbo].[Maintenance] ([MaintenanceID], [ScaleID], [MaintenanceDate], [MaintenanceType], [TechnicianID], [Description]) VALUES (1, 1, CAST(N'2023-03-20' AS Date), N'Поверка', 4, N'Плановое ежегодное техническое обслуживание и поверка')
INSERT [dbo].[Maintenance] ([MaintenanceID], [ScaleID], [MaintenanceDate], [MaintenanceType], [TechnicianID], [Description]) VALUES (2, 2, CAST(N'2023-05-15' AS Date), N'Поверка', 4, N'Поверка весов с заменой датчиков')
INSERT [dbo].[Maintenance] ([MaintenanceID], [ScaleID], [MaintenanceDate], [MaintenanceType], [TechnicianID], [Description]) VALUES (3, 5, CAST(N'2023-07-20' AS Date), N'Ремонт', 4, N'Замена платформы и ремонт электроники')
INSERT [dbo].[Maintenance] ([MaintenanceID], [ScaleID], [MaintenanceDate], [MaintenanceType], [TechnicianID], [Description]) VALUES (4, 3, CAST(N'2023-11-25' AS Date), N'Поверка', 4, N'Плановая поверка железнодорожных весов')
INSERT [dbo].[Maintenance] ([MaintenanceID], [ScaleID], [MaintenanceDate], [MaintenanceType], [TechnicianID], [Description]) VALUES (5, 1, CAST(N'2023-09-10' AS Date), N'Техобслуживание', 4, N'Чистка и регулировка датчиков')
SET IDENTITY_INSERT [dbo].[Maintenance] OFF
GO
SET IDENTITY_INSERT [dbo].[Scales] ON 

INSERT [dbo].[Scales] ([ScaleID], [Model], [SerialNumber], [MaxCapacity], [InstallationDate], [LastCalibrationDate], [Location], [IsActive]) VALUES (1, N'Весы мостовые 30т', N'BS-2021-001', CAST(30000.00 AS Decimal(10, 2)), CAST(N'2021-03-15' AS Date), CAST(N'2023-03-20' AS Date), N'Склад №1', 1)
INSERT [dbo].[Scales] ([ScaleID], [Model], [SerialNumber], [MaxCapacity], [InstallationDate], [LastCalibrationDate], [Location], [IsActive]) VALUES (2, N'Весы мостовые 80т', N'BS-2022-005', CAST(80000.00 AS Decimal(10, 2)), CAST(N'2022-05-10' AS Date), CAST(N'2023-05-15' AS Date), N'Склад №2', 1)
INSERT [dbo].[Scales] ([ScaleID], [Model], [SerialNumber], [MaxCapacity], [InstallationDate], [LastCalibrationDate], [Location], [IsActive]) VALUES (3, N'Весы ж/д 100т', N'BS-2020-003', CAST(100000.00 AS Decimal(10, 2)), CAST(N'2020-11-22' AS Date), CAST(N'2023-11-25' AS Date), N'Железнодорожная ветка', 1)
INSERT [dbo].[Scales] ([ScaleID], [Model], [SerialNumber], [MaxCapacity], [InstallationDate], [LastCalibrationDate], [Location], [IsActive]) VALUES (4, N'Весы мостовые 60т', N'BS-2023-002', CAST(60000.00 AS Decimal(10, 2)), CAST(N'2023-01-30' AS Date), CAST(N'2023-02-05' AS Date), N'Склад №3', 1)
INSERT [dbo].[Scales] ([ScaleID], [Model], [SerialNumber], [MaxCapacity], [InstallationDate], [LastCalibrationDate], [Location], [IsActive]) VALUES (5, N'Весы ж/д 150т', N'BS-2019-007', CAST(150000.00 AS Decimal(10, 2)), CAST(N'2019-07-18' AS Date), CAST(N'2023-07-20' AS Date), N'Терминал А', 0)
SET IDENTITY_INSERT [dbo].[Scales] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([UserID], [Username], [Password], [FullName], [Role], [IsActive]) VALUES (1, N'admin', N'EF92B778BAFE771E89245B89ECBC08A44A4E166C06659911881F383D4473E94F', N'Администратор Системы', N'Admin', 1)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [FullName], [Role], [IsActive]) VALUES (2, N'operator1', N'EF92B778BAFE771E89245B89ECBC08A44A4E166C06659911881F383D4473E94F', N'Петрова Анна Николаевна', N'Operator', 1)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [FullName], [Role], [IsActive]) VALUES (3, N'operator2', N'EF92B778BAFE771E89245B89ECBC08A44A4E166C06659911881F383D4473E94F', N'Иванов Дмитрий Сергеевич', N'Operator', 1)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [FullName], [Role], [IsActive]) VALUES (4, N'technician1', N'EF92B778BAFE771E89245B89ECBC08A44A4E166C06659911881F383D4473E94F', N'Сергеев Алексей Петрович', N'Technician', 1)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [FullName], [Role], [IsActive]) VALUES (5, N'manager', N'EF92B778BAFE771E89245B89ECBC08A44A4E166C06659911881F383D4473E94F', N'Смирнова Ольга Владимировна', N'Manager', 1)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET IDENTITY_INSERT [dbo].[Weighings] ON 

INSERT [dbo].[Weighings] ([WeighingID], [ScaleID], [ClientID], [VehicleNumber], [GrossWeight], [TareWeight], [WeighingDateTime], [OperatorID], [Notes]) VALUES (1, 1, 1, N'А123БВ777', CAST(42500.00 AS Decimal(10, 2)), CAST(12500.00 AS Decimal(10, 2)), CAST(N'2023-10-15T09:23:45.000' AS DateTime), 2, N'Песок строительный')
INSERT [dbo].[Weighings] ([WeighingID], [ScaleID], [ClientID], [VehicleNumber], [GrossWeight], [TareWeight], [WeighingDateTime], [OperatorID], [Notes]) VALUES (2, 1, 2, N'В456ТУ777', CAST(38500.00 AS Decimal(10, 2)), CAST(13500.00 AS Decimal(10, 2)), CAST(N'2023-10-15T10:45:12.000' AS DateTime), 2, N'Зерно пшеницы')
INSERT [dbo].[Weighings] ([WeighingID], [ScaleID], [ClientID], [VehicleNumber], [GrossWeight], [TareWeight], [WeighingDateTime], [OperatorID], [Notes]) VALUES (3, 3, 4, N'Вагон 745632', CAST(98500.00 AS Decimal(10, 2)), CAST(28500.00 AS Decimal(10, 2)), CAST(N'2023-10-16T11:30:00.000' AS DateTime), 3, N'Металлопрокат')
INSERT [dbo].[Weighings] ([WeighingID], [ScaleID], [ClientID], [VehicleNumber], [GrossWeight], [TareWeight], [WeighingDateTime], [OperatorID], [Notes]) VALUES (4, 2, 3, N'С789КХ777', CAST(72500.00 AS Decimal(10, 2)), CAST(14500.00 AS Decimal(10, 2)), CAST(N'2023-10-17T14:15:33.000' AS DateTime), 2, N'Щебень гранитный')
INSERT [dbo].[Weighings] ([WeighingID], [ScaleID], [ClientID], [VehicleNumber], [GrossWeight], [TareWeight], [WeighingDateTime], [OperatorID], [Notes]) VALUES (5, 1, 5, N'Т321УК777', CAST(48200.00 AS Decimal(10, 2)), CAST(13200.00 AS Decimal(10, 2)), CAST(N'2023-10-18T16:40:21.000' AS DateTime), 2, N'Бетонные блоки')
INSERT [dbo].[Weighings] ([WeighingID], [ScaleID], [ClientID], [VehicleNumber], [GrossWeight], [TareWeight], [WeighingDateTime], [OperatorID], [Notes]) VALUES (7, 1, 1, N'С065МК 78', CAST(10010.00 AS Decimal(10, 2)), CAST(1228.00 AS Decimal(10, 2)), CAST(N'2025-06-25T21:01:13.730' AS DateTime), 2, N'Примечание')
INSERT [dbo].[Weighings] ([WeighingID], [ScaleID], [ClientID], [VehicleNumber], [GrossWeight], [TareWeight], [WeighingDateTime], [OperatorID], [Notes]) VALUES (8, 1, 1, N'8564', CAST(30020.00 AS Decimal(10, 2)), CAST(1242.00 AS Decimal(10, 2)), CAST(N'2025-06-25T21:03:27.597' AS DateTime), 2, N'')
SET IDENTITY_INSERT [dbo].[Weighings] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Scales__048A00080458EE54]    Script Date: 26.06.2025 19:16:46 ******/
ALTER TABLE [dbo].[Scales] ADD UNIQUE NONCLUSTERED 
(
	[SerialNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Users__536C85E40DD836F8]    Script Date: 26.06.2025 19:16:46 ******/
ALTER TABLE [dbo].[Users] ADD UNIQUE NONCLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Scales] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Weighings] ADD  DEFAULT (getdate()) FOR [WeighingDateTime]
GO
ALTER TABLE [dbo].[Maintenance]  WITH CHECK ADD  CONSTRAINT [FK_Maintenance_Scale] FOREIGN KEY([ScaleID])
REFERENCES [dbo].[Scales] ([ScaleID])
GO
ALTER TABLE [dbo].[Maintenance] CHECK CONSTRAINT [FK_Maintenance_Scale]
GO
ALTER TABLE [dbo].[Maintenance]  WITH CHECK ADD  CONSTRAINT [FK_Maintenance_Technician] FOREIGN KEY([TechnicianID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Maintenance] CHECK CONSTRAINT [FK_Maintenance_Technician]
GO
ALTER TABLE [dbo].[Weighings]  WITH CHECK ADD  CONSTRAINT [FK_Weighings_Client] FOREIGN KEY([ClientID])
REFERENCES [dbo].[Clients] ([ClientID])
GO
ALTER TABLE [dbo].[Weighings] CHECK CONSTRAINT [FK_Weighings_Client]
GO
ALTER TABLE [dbo].[Weighings]  WITH CHECK ADD  CONSTRAINT [FK_Weighings_Operator] FOREIGN KEY([OperatorID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Weighings] CHECK CONSTRAINT [FK_Weighings_Operator]
GO
ALTER TABLE [dbo].[Weighings]  WITH CHECK ADD  CONSTRAINT [FK_Weighings_Scale] FOREIGN KEY([ScaleID])
REFERENCES [dbo].[Scales] ([ScaleID])
GO
ALTER TABLE [dbo].[Weighings] CHECK CONSTRAINT [FK_Weighings_Scale]
GO
USE [master]
GO
ALTER DATABASE [BridgeScales] SET  READ_WRITE 
GO

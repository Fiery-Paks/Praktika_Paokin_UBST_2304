USE [master]
GO
/****** Object:  Database [BridgeScales]    Script Date: 02.07.2025 21:53:26 ******/
CREATE DATABASE [BridgeScales]
GO
USE [BridgeScales]
GO
/****** Object:  Table [dbo].[Clients]    Script Date: 02.07.2025 21:53:26 ******/
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
/****** Object:  Table [dbo].[Maintenance]    Script Date: 02.07.2025 21:53:26 ******/
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
/****** Object:  Table [dbo].[Scales]    Script Date: 02.07.2025 21:53:26 ******/
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
/****** Object:  Table [dbo].[TypeVehicle]    Script Date: 02.07.2025 21:53:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TypeVehicle](
	[TypeID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](70) NOT NULL,
	[MaxWeight] [float] NOT NULL,
	[Description] [nvarchar](255) NULL,
 CONSTRAINT [PK_Type] PRIMARY KEY CLUSTERED 
(
	[TypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 02.07.2025 21:53:26 ******/
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
/****** Object:  Table [dbo].[Weighings]    Script Date: 02.07.2025 21:53:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Weighings](
	[WeighingID] [int] IDENTITY(1,1) NOT NULL,
	[ScaleID] [int] NOT NULL,
	[ClientID] [int] NULL,
	[VehicleNumber] [nvarchar](20) NULL,
	[TypeVehicleID] [int] NULL,
	[GrossWeight] [decimal](10, 2) NULL,
	[TareWeight] [decimal](10, 2) NULL,
	[WeighingDateTime] [datetime] NOT NULL,
	[OperatorID] [int] NOT NULL,
	[Notes] [nvarchar](500) NULL,
 CONSTRAINT [PK__Weighing__86EA6967AFEFA7DB] PRIMARY KEY CLUSTERED 
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
SET IDENTITY_INSERT [dbo].[TypeVehicle] ON 

INSERT [dbo].[TypeVehicle] ([TypeID], [Name], [MaxWeight], [Description]) VALUES (1, N'Легковой автомобиль', 3000, N'Масса до 3 тонн')
INSERT [dbo].[TypeVehicle] ([TypeID], [Name], [MaxWeight], [Description]) VALUES (2, N'Грузовой автомобиль 1 класс', 15000, N'До 15 тонн')
INSERT [dbo].[TypeVehicle] ([TypeID], [Name], [MaxWeight], [Description]) VALUES (3, N'Грузовой автомобиль 2 класс', 40000, N'Тяжелые грузовики до 40 тонн')
INSERT [dbo].[TypeVehicle] ([TypeID], [Name], [MaxWeight], [Description]) VALUES (6, N'Грузовой автомобиль 3 класс', 95000, N'Сверх тяжелые грузовики до 95 тонн')
SET IDENTITY_INSERT [dbo].[TypeVehicle] OFF
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

INSERT [dbo].[Weighings] ([WeighingID], [ScaleID], [ClientID], [VehicleNumber], [TypeVehicleID], [GrossWeight], [TareWeight], [WeighingDateTime], [OperatorID], [Notes]) VALUES (1, 1, 1, N'А123БВ777', 3, CAST(23500.00 AS Decimal(10, 2)), CAST(12500.00 AS Decimal(10, 2)), CAST(N'2024-10-15T09:23:45.000' AS DateTime), 2, N'Песок строительный')
INSERT [dbo].[Weighings] ([WeighingID], [ScaleID], [ClientID], [VehicleNumber], [TypeVehicleID], [GrossWeight], [TareWeight], [WeighingDateTime], [OperatorID], [Notes]) VALUES (2, 1, 2, N'В456ТУ777', 3, CAST(23500.00 AS Decimal(10, 2)), CAST(11500.00 AS Decimal(10, 2)), CAST(N'2024-10-15T10:45:12.000' AS DateTime), 2, N'Зерно пшеницы')
INSERT [dbo].[Weighings] ([WeighingID], [ScaleID], [ClientID], [VehicleNumber], [TypeVehicleID], [GrossWeight], [TareWeight], [WeighingDateTime], [OperatorID], [Notes]) VALUES (4, 1, 3, N'С789КХ777', 2, CAST(12500.00 AS Decimal(10, 2)), CAST(6000.00 AS Decimal(10, 2)), CAST(N'2024-10-17T14:15:33.000' AS DateTime), 2, N'Щебень гранитный')
INSERT [dbo].[Weighings] ([WeighingID], [ScaleID], [ClientID], [VehicleNumber], [TypeVehicleID], [GrossWeight], [TareWeight], [WeighingDateTime], [OperatorID], [Notes]) VALUES (5, 2, 5, N'Т321УК777', 6, CAST(48200.00 AS Decimal(10, 2)), CAST(13200.00 AS Decimal(10, 2)), CAST(N'2024-10-18T16:40:21.000' AS DateTime), 2, N'Бетонные блоки')
INSERT [dbo].[Weighings] ([WeighingID], [ScaleID], [ClientID], [VehicleNumber], [TypeVehicleID], [GrossWeight], [TareWeight], [WeighingDateTime], [OperatorID], [Notes]) VALUES (7, 1, 1, N'С065МК 78', 1, CAST(1000.00 AS Decimal(10, 2)), CAST(150.00 AS Decimal(10, 2)), CAST(N'2024-10-25T21:01:13.730' AS DateTime), 2, N'Инструменты')
INSERT [dbo].[Weighings] ([WeighingID], [ScaleID], [ClientID], [VehicleNumber], [TypeVehicleID], [GrossWeight], [TareWeight], [WeighingDateTime], [OperatorID], [Notes]) VALUES (11, 2, 2, N'АС605М13', 1, CAST(1500.00 AS Decimal(10, 2)), CAST(200.00 AS Decimal(10, 2)), CAST(N'2025-06-27T23:26:13.403' AS DateTime), 2, N'Мешки с картошкой')
INSERT [dbo].[Weighings] ([WeighingID], [ScaleID], [ClientID], [VehicleNumber], [TypeVehicleID], [GrossWeight], [TareWeight], [WeighingDateTime], [OperatorID], [Notes]) VALUES (12, 1, 1, N'АО010Т77', 1, CAST(2700.00 AS Decimal(10, 2)), CAST(300.00 AS Decimal(10, 2)), CAST(N'2025-06-27T23:28:30.567' AS DateTime), 2, N'Бутылки с водой')
INSERT [dbo].[Weighings] ([WeighingID], [ScaleID], [ClientID], [VehicleNumber], [TypeVehicleID], [GrossWeight], [TareWeight], [WeighingDateTime], [OperatorID], [Notes]) VALUES (13, 1, 4, N'М123АВ777', 1, CAST(2800.00 AS Decimal(10, 2)), CAST(1500.00 AS Decimal(10, 2)), CAST(N'2024-10-19T08:15:22.000' AS DateTime), 3, N'Строительные инструменты')
INSERT [dbo].[Weighings] ([WeighingID], [ScaleID], [ClientID], [VehicleNumber], [TypeVehicleID], [GrossWeight], [TareWeight], [WeighingDateTime], [OperatorID], [Notes]) VALUES (14, 2, 5, N'Н456СД777', 1, CAST(2900.00 AS Decimal(10, 2)), CAST(1400.00 AS Decimal(10, 2)), CAST(N'2024-10-20T11:30:45.000' AS DateTime), 2, N'Отделочные материалы')
INSERT [dbo].[Weighings] ([WeighingID], [ScaleID], [ClientID], [VehicleNumber], [TypeVehicleID], [GrossWeight], [TareWeight], [WeighingDateTime], [OperatorID], [Notes]) VALUES (15, 3, 2, N'Р654МН777', 2, CAST(14500.00 AS Decimal(10, 2)), CAST(7000.00 AS Decimal(10, 2)), CAST(N'2024-10-21T14:45:10.000' AS DateTime), 3, N'Пищевая продукция')
INSERT [dbo].[Weighings] ([WeighingID], [ScaleID], [ClientID], [VehicleNumber], [TypeVehicleID], [GrossWeight], [TareWeight], [WeighingDateTime], [OperatorID], [Notes]) VALUES (16, 4, 1, N'Е789ФГ777', 2, CAST(14800.00 AS Decimal(10, 2)), CAST(6800.00 AS Decimal(10, 2)), CAST(N'2024-10-22T09:20:33.000' AS DateTime), 2, N'Сухие смеси')
INSERT [dbo].[Weighings] ([WeighingID], [ScaleID], [ClientID], [VehicleNumber], [TypeVehicleID], [GrossWeight], [TareWeight], [WeighingDateTime], [OperatorID], [Notes]) VALUES (17, 1, 3, N'К321ЛМ777', 3, CAST(38500.00 AS Decimal(10, 2)), CAST(12500.00 AS Decimal(10, 2)), CAST(N'2024-10-23T16:10:18.000' AS DateTime), 3, N'Щебень')
INSERT [dbo].[Weighings] ([WeighingID], [ScaleID], [ClientID], [VehicleNumber], [TypeVehicleID], [GrossWeight], [TareWeight], [WeighingDateTime], [OperatorID], [Notes]) VALUES (18, 2, 4, N'О654НП777', 3, CAST(39500.00 AS Decimal(10, 2)), CAST(13000.00 AS Decimal(10, 2)), CAST(N'2024-10-24T10:35:27.000' AS DateTime), 2, N'Металлопрокат')
INSERT [dbo].[Weighings] ([WeighingID], [ScaleID], [ClientID], [VehicleNumber], [TypeVehicleID], [GrossWeight], [TareWeight], [WeighingDateTime], [OperatorID], [Notes]) VALUES (19, 3, 5, N'РЖД987654', 6, CAST(85000.00 AS Decimal(10, 2)), CAST(25000.00 AS Decimal(10, 2)), CAST(N'2024-10-25T13:40:55.000' AS DateTime), 3, N'Железнодорожный состав с углем')
INSERT [dbo].[Weighings] ([WeighingID], [ScaleID], [ClientID], [VehicleNumber], [TypeVehicleID], [GrossWeight], [TareWeight], [WeighingDateTime], [OperatorID], [Notes]) VALUES (20, 3, 1, N'РЖД123456', 6, CAST(92000.00 AS Decimal(10, 2)), CAST(27000.00 AS Decimal(10, 2)), CAST(N'2024-10-26T15:25:40.000' AS DateTime), 2, N'Железнодорожный состав с зерном')
INSERT [dbo].[Weighings] ([WeighingID], [ScaleID], [ClientID], [VehicleNumber], [TypeVehicleID], [GrossWeight], [TareWeight], [WeighingDateTime], [OperatorID], [Notes]) VALUES (21, 4, 3, N'Ф321ХЦ777', 2, CAST(14200.00 AS Decimal(10, 2)), CAST(6500.00 AS Decimal(10, 2)), CAST(N'2024-10-27T12:15:30.000' AS DateTime), 2, N'Кирпич')
INSERT [dbo].[Weighings] ([WeighingID], [ScaleID], [ClientID], [VehicleNumber], [TypeVehicleID], [GrossWeight], [TareWeight], [WeighingDateTime], [OperatorID], [Notes]) VALUES (22, 1, 4, N'Ц654ЧШ777', 1, CAST(2700.00 AS Decimal(10, 2)), CAST(1400.00 AS Decimal(10, 2)), CAST(N'2024-10-28T11:05:20.000' AS DateTime), 3, N'Сантехника')
INSERT [dbo].[Weighings] ([WeighingID], [ScaleID], [ClientID], [VehicleNumber], [TypeVehicleID], [GrossWeight], [TareWeight], [WeighingDateTime], [OperatorID], [Notes]) VALUES (23, 2, 5, N'Ш987ЩЫ777', 3, CAST(38000.00 AS Decimal(10, 2)), CAST(12000.00 AS Decimal(10, 2)), CAST(N'2024-10-29T14:50:10.000' AS DateTime), 2, N'Бетонные изделия')
INSERT [dbo].[Weighings] ([WeighingID], [ScaleID], [ClientID], [VehicleNumber], [TypeVehicleID], [GrossWeight], [TareWeight], [WeighingDateTime], [OperatorID], [Notes]) VALUES (24, 4, 1, N'Щ321ЭЮ777', 2, CAST(14300.00 AS Decimal(10, 2)), CAST(7000.00 AS Decimal(10, 2)), CAST(N'2024-10-30T09:30:45.000' AS DateTime), 3, N'Гипсокартон')
INSERT [dbo].[Weighings] ([WeighingID], [ScaleID], [ClientID], [VehicleNumber], [TypeVehicleID], [GrossWeight], [TareWeight], [WeighingDateTime], [OperatorID], [Notes]) VALUES (25, 3, 2, N'РЖД654321', 6, CAST(88000.00 AS Decimal(10, 2)), CAST(26000.00 AS Decimal(10, 2)), CAST(N'2024-10-31T16:20:35.000' AS DateTime), 2, N'Железнодорожный состав с песком')
INSERT [dbo].[Weighings] ([WeighingID], [ScaleID], [ClientID], [VehicleNumber], [TypeVehicleID], [GrossWeight], [TareWeight], [WeighingDateTime], [OperatorID], [Notes]) VALUES (26, 1, 3, N'Ю654ЯА777', 1, CAST(2500.00 AS Decimal(10, 2)), CAST(1300.00 AS Decimal(10, 2)), CAST(N'2024-11-01T10:45:25.000' AS DateTime), 3, N'Отделочные материалы')
INSERT [dbo].[Weighings] ([WeighingID], [ScaleID], [ClientID], [VehicleNumber], [TypeVehicleID], [GrossWeight], [TareWeight], [WeighingDateTime], [OperatorID], [Notes]) VALUES (27, 2, 4, N'Я987АБ777', 3, CAST(39000.00 AS Decimal(10, 2)), CAST(12500.00 AS Decimal(10, 2)), CAST(N'2024-11-02T13:15:15.000' AS DateTime), 2, N'Металлические конструкции')
INSERT [dbo].[Weighings] ([WeighingID], [ScaleID], [ClientID], [VehicleNumber], [TypeVehicleID], [GrossWeight], [TareWeight], [WeighingDateTime], [OperatorID], [Notes]) VALUES (28, 1, 3, N'А001АА777', 1, CAST(1200.00 AS Decimal(10, 2)), CAST(800.00 AS Decimal(10, 2)), CAST(N'2025-01-05T08:15:00.000' AS DateTime), 2, N'Офисная мебель')
INSERT [dbo].[Weighings] ([WeighingID], [ScaleID], [ClientID], [VehicleNumber], [TypeVehicleID], [GrossWeight], [TareWeight], [WeighingDateTime], [OperatorID], [Notes]) VALUES (29, 1, 5, N'В002ВВ777', 1, CAST(1800.00 AS Decimal(10, 2)), CAST(1100.00 AS Decimal(10, 2)), CAST(N'2025-01-05T09:30:00.000' AS DateTime), 3, N'Компьютерная техника')
INSERT [dbo].[Weighings] ([WeighingID], [ScaleID], [ClientID], [VehicleNumber], [TypeVehicleID], [GrossWeight], [TareWeight], [WeighingDateTime], [OperatorID], [Notes]) VALUES (30, 1, 2, N'С003СС777', 1, CAST(2200.00 AS Decimal(10, 2)), CAST(1400.00 AS Decimal(10, 2)), CAST(N'2025-01-06T10:45:00.000' AS DateTime), 2, N'Бытовая электроника')
INSERT [dbo].[Weighings] ([WeighingID], [ScaleID], [ClientID], [VehicleNumber], [TypeVehicleID], [GrossWeight], [TareWeight], [WeighingDateTime], [OperatorID], [Notes]) VALUES (31, 1, 4, N'Е004ЕЕ777', 1, CAST(1900.00 AS Decimal(10, 2)), CAST(1200.00 AS Decimal(10, 2)), CAST(N'2025-01-07T12:00:00.000' AS DateTime), 3, N'Хозяйственные товары')
INSERT [dbo].[Weighings] ([WeighingID], [ScaleID], [ClientID], [VehicleNumber], [TypeVehicleID], [GrossWeight], [TareWeight], [WeighingDateTime], [OperatorID], [Notes]) VALUES (32, 1, 1, N'Н005НН777', 1, CAST(2500.00 AS Decimal(10, 2)), CAST(1600.00 AS Decimal(10, 2)), CAST(N'2025-01-08T13:15:00.000' AS DateTime), 2, N'Строительный инструмент')
INSERT [dbo].[Weighings] ([WeighingID], [ScaleID], [ClientID], [VehicleNumber], [TypeVehicleID], [GrossWeight], [TareWeight], [WeighingDateTime], [OperatorID], [Notes]) VALUES (33, 1, 3, N'К006КК777', 1, CAST(2700.00 AS Decimal(10, 2)), CAST(1500.00 AS Decimal(10, 2)), CAST(N'2025-01-09T14:30:00.000' AS DateTime), 3, N'Электроинструменты')
INSERT [dbo].[Weighings] ([WeighingID], [ScaleID], [ClientID], [VehicleNumber], [TypeVehicleID], [GrossWeight], [TareWeight], [WeighingDateTime], [OperatorID], [Notes]) VALUES (34, 1, 5, N'М007ММ777', 1, CAST(2300.00 AS Decimal(10, 2)), CAST(1400.00 AS Decimal(10, 2)), CAST(N'2025-01-10T15:45:00.000' AS DateTime), 2, N'Сантехнические материалы')
INSERT [dbo].[Weighings] ([WeighingID], [ScaleID], [ClientID], [VehicleNumber], [TypeVehicleID], [GrossWeight], [TareWeight], [WeighingDateTime], [OperatorID], [Notes]) VALUES (35, 1, 2, N'О008ОО777', 1, CAST(2100.00 AS Decimal(10, 2)), CAST(1300.00 AS Decimal(10, 2)), CAST(N'2025-01-11T16:00:00.000' AS DateTime), 3, N'Осветительные приборы')
INSERT [dbo].[Weighings] ([WeighingID], [ScaleID], [ClientID], [VehicleNumber], [TypeVehicleID], [GrossWeight], [TareWeight], [WeighingDateTime], [OperatorID], [Notes]) VALUES (36, 1, 4, N'Р009РР777', 1, CAST(2400.00 AS Decimal(10, 2)), CAST(1500.00 AS Decimal(10, 2)), CAST(N'2025-01-12T09:15:00.000' AS DateTime), 2, N'Отделочные материалы')
INSERT [dbo].[Weighings] ([WeighingID], [ScaleID], [ClientID], [VehicleNumber], [TypeVehicleID], [GrossWeight], [TareWeight], [WeighingDateTime], [OperatorID], [Notes]) VALUES (37, 1, 1, N'Т010ТТ777', 1, CAST(2600.00 AS Decimal(10, 2)), CAST(1600.00 AS Decimal(10, 2)), CAST(N'2025-01-13T10:30:00.000' AS DateTime), 3, N'Садовый инвентарь')
INSERT [dbo].[Weighings] ([WeighingID], [ScaleID], [ClientID], [VehicleNumber], [TypeVehicleID], [GrossWeight], [TareWeight], [WeighingDateTime], [OperatorID], [Notes]) VALUES (38, 1, 3, N'Х011ХХ777', 1, CAST(2800.00 AS Decimal(10, 2)), CAST(1700.00 AS Decimal(10, 2)), CAST(N'2025-01-14T11:45:00.000' AS DateTime), 2, N'Автозапчасти')
INSERT [dbo].[Weighings] ([WeighingID], [ScaleID], [ClientID], [VehicleNumber], [TypeVehicleID], [GrossWeight], [TareWeight], [WeighingDateTime], [OperatorID], [Notes]) VALUES (39, 1, 5, N'Ц012ЦЦ777', 1, CAST(2900.00 AS Decimal(10, 2)), CAST(1800.00 AS Decimal(10, 2)), CAST(N'2025-01-15T12:00:00.000' AS DateTime), 3, N'Медицинское оборудование')
INSERT [dbo].[Weighings] ([WeighingID], [ScaleID], [ClientID], [VehicleNumber], [TypeVehicleID], [GrossWeight], [TareWeight], [WeighingDateTime], [OperatorID], [Notes]) VALUES (40, 1, 2, N'Ч013ЧЧ777', 1, CAST(2000.00 AS Decimal(10, 2)), CAST(1200.00 AS Decimal(10, 2)), CAST(N'2025-02-01T13:15:00.000' AS DateTime), 2, N'Офисные принадлежности')
INSERT [dbo].[Weighings] ([WeighingID], [ScaleID], [ClientID], [VehicleNumber], [TypeVehicleID], [GrossWeight], [TareWeight], [WeighingDateTime], [OperatorID], [Notes]) VALUES (41, 1, 4, N'Ш014ШШ777', 1, CAST(2200.00 AS Decimal(10, 2)), CAST(1400.00 AS Decimal(10, 2)), CAST(N'2025-02-02T14:30:00.000' AS DateTime), 3, N'Бытовая химия')
INSERT [dbo].[Weighings] ([WeighingID], [ScaleID], [ClientID], [VehicleNumber], [TypeVehicleID], [GrossWeight], [TareWeight], [WeighingDateTime], [OperatorID], [Notes]) VALUES (42, 1, 1, N'Щ015ЩЩ777', 1, CAST(2400.00 AS Decimal(10, 2)), CAST(1500.00 AS Decimal(10, 2)), CAST(N'2025-02-03T15:45:00.000' AS DateTime), 2, N'Упаковочные материалы')
INSERT [dbo].[Weighings] ([WeighingID], [ScaleID], [ClientID], [VehicleNumber], [TypeVehicleID], [GrossWeight], [TareWeight], [WeighingDateTime], [OperatorID], [Notes]) VALUES (43, 1, 3, N'Ю016ЮЮ777', 1, CAST(2600.00 AS Decimal(10, 2)), CAST(1600.00 AS Decimal(10, 2)), CAST(N'2025-02-04T16:00:00.000' AS DateTime), 3, N'Канцелярские товары')
INSERT [dbo].[Weighings] ([WeighingID], [ScaleID], [ClientID], [VehicleNumber], [TypeVehicleID], [GrossWeight], [TareWeight], [WeighingDateTime], [OperatorID], [Notes]) VALUES (44, 1, 5, N'Я017ЯЯ777', 1, CAST(2800.00 AS Decimal(10, 2)), CAST(1700.00 AS Decimal(10, 2)), CAST(N'2025-02-05T09:15:00.000' AS DateTime), 2, N'Фурнитура')
INSERT [dbo].[Weighings] ([WeighingID], [ScaleID], [ClientID], [VehicleNumber], [TypeVehicleID], [GrossWeight], [TareWeight], [WeighingDateTime], [OperatorID], [Notes]) VALUES (45, 1, 2, N'А018АА777', 1, CAST(2500.00 AS Decimal(10, 2)), CAST(1600.00 AS Decimal(10, 2)), CAST(N'2025-02-06T10:30:00.000' AS DateTime), 3, N'Хозтовары')
INSERT [dbo].[Weighings] ([WeighingID], [ScaleID], [ClientID], [VehicleNumber], [TypeVehicleID], [GrossWeight], [TareWeight], [WeighingDateTime], [OperatorID], [Notes]) VALUES (46, 1, 4, N'В019ВВ777', 1, CAST(2300.00 AS Decimal(10, 2)), CAST(1400.00 AS Decimal(10, 2)), CAST(N'2025-02-07T11:45:00.000' AS DateTime), 2, N'Строительные материалы')
INSERT [dbo].[Weighings] ([WeighingID], [ScaleID], [ClientID], [VehicleNumber], [TypeVehicleID], [GrossWeight], [TareWeight], [WeighingDateTime], [OperatorID], [Notes]) VALUES (47, 1, 1, N'С020СС777', 1, CAST(2100.00 AS Decimal(10, 2)), CAST(1300.00 AS Decimal(10, 2)), CAST(N'2025-02-08T12:00:00.000' AS DateTime), 3, N'Электротовары')
INSERT [dbo].[Weighings] ([WeighingID], [ScaleID], [ClientID], [VehicleNumber], [TypeVehicleID], [GrossWeight], [TareWeight], [WeighingDateTime], [OperatorID], [Notes]) VALUES (48, 1, 3, N'Е021ЕЕ777', 1, CAST(1900.00 AS Decimal(10, 2)), CAST(1200.00 AS Decimal(10, 2)), CAST(N'2025-02-09T13:15:00.000' AS DateTime), 2, N'Инструменты')
INSERT [dbo].[Weighings] ([WeighingID], [ScaleID], [ClientID], [VehicleNumber], [TypeVehicleID], [GrossWeight], [TareWeight], [WeighingDateTime], [OperatorID], [Notes]) VALUES (49, 1, 5, N'Н022НН777', 1, CAST(1700.00 AS Decimal(10, 2)), CAST(1100.00 AS Decimal(10, 2)), CAST(N'2025-02-10T14:30:00.000' AS DateTime), 3, N'Стройматериалы')
INSERT [dbo].[Weighings] ([WeighingID], [ScaleID], [ClientID], [VehicleNumber], [TypeVehicleID], [GrossWeight], [TareWeight], [WeighingDateTime], [OperatorID], [Notes]) VALUES (50, 1, 2, N'К023КК777', 1, CAST(1500.00 AS Decimal(10, 2)), CAST(1000.00 AS Decimal(10, 2)), CAST(N'2025-02-11T15:45:00.000' AS DateTime), 2, N'Товары для дома')
INSERT [dbo].[Weighings] ([WeighingID], [ScaleID], [ClientID], [VehicleNumber], [TypeVehicleID], [GrossWeight], [TareWeight], [WeighingDateTime], [OperatorID], [Notes]) VALUES (51, 1, 4, N'М024ММ777', 1, CAST(1300.00 AS Decimal(10, 2)), CAST(900.00 AS Decimal(10, 2)), CAST(N'2025-02-12T16:00:00.000' AS DateTime), 3, N'Оборудование')
INSERT [dbo].[Weighings] ([WeighingID], [ScaleID], [ClientID], [VehicleNumber], [TypeVehicleID], [GrossWeight], [TareWeight], [WeighingDateTime], [OperatorID], [Notes]) VALUES (52, 1, 1, N'О025ОО777', 1, CAST(1100.00 AS Decimal(10, 2)), CAST(800.00 AS Decimal(10, 2)), CAST(N'2025-02-13T09:15:00.000' AS DateTime), 2, N'Техника')
INSERT [dbo].[Weighings] ([WeighingID], [ScaleID], [ClientID], [VehicleNumber], [TypeVehicleID], [GrossWeight], [TareWeight], [WeighingDateTime], [OperatorID], [Notes]) VALUES (53, 2, 1, N'Р026РР777', 2, CAST(8500.00 AS Decimal(10, 2)), CAST(4500.00 AS Decimal(10, 2)), CAST(N'2025-03-01T08:30:00.000' AS DateTime), 3, N'Песок строительный')
INSERT [dbo].[Weighings] ([WeighingID], [ScaleID], [ClientID], [VehicleNumber], [TypeVehicleID], [GrossWeight], [TareWeight], [WeighingDateTime], [OperatorID], [Notes]) VALUES (54, 2, 3, N'Т027ТТ777', 2, CAST(12500.00 AS Decimal(10, 2)), CAST(6500.00 AS Decimal(10, 2)), CAST(N'2025-03-02T10:00:00.000' AS DateTime), 2, N'Щебень гранитный')
INSERT [dbo].[Weighings] ([WeighingID], [ScaleID], [ClientID], [VehicleNumber], [TypeVehicleID], [GrossWeight], [TareWeight], [WeighingDateTime], [OperatorID], [Notes]) VALUES (55, 4, 2, N'Х028ХХ777', 2, CAST(14200.00 AS Decimal(10, 2)), CAST(7200.00 AS Decimal(10, 2)), CAST(N'2025-03-03T11:30:00.000' AS DateTime), 3, N'Кирпич строительный')
INSERT [dbo].[Weighings] ([WeighingID], [ScaleID], [ClientID], [VehicleNumber], [TypeVehicleID], [GrossWeight], [TareWeight], [WeighingDateTime], [OperatorID], [Notes]) VALUES (56, 4, 5, N'Ц029ЦЦ777', 2, CAST(11000.00 AS Decimal(10, 2)), CAST(5800.00 AS Decimal(10, 2)), CAST(N'2025-03-04T13:00:00.000' AS DateTime), 2, N'Сухие смеси')
INSERT [dbo].[Weighings] ([WeighingID], [ScaleID], [ClientID], [VehicleNumber], [TypeVehicleID], [GrossWeight], [TareWeight], [WeighingDateTime], [OperatorID], [Notes]) VALUES (57, 2, 4, N'Ч030ЧЧ777', 2, CAST(13500.00 AS Decimal(10, 2)), CAST(7000.00 AS Decimal(10, 2)), CAST(N'2025-03-05T14:30:00.000' AS DateTime), 3, N'Гипсокартон')
INSERT [dbo].[Weighings] ([WeighingID], [ScaleID], [ClientID], [VehicleNumber], [TypeVehicleID], [GrossWeight], [TareWeight], [WeighingDateTime], [OperatorID], [Notes]) VALUES (58, 4, 1, N'Ш031ШШ777', 2, CAST(12500.00 AS Decimal(10, 2)), CAST(6200.00 AS Decimal(10, 2)), CAST(N'2025-03-06T10:30:00.000' AS DateTime), 2, N'Цемент в мешках')
INSERT [dbo].[Weighings] ([WeighingID], [ScaleID], [ClientID], [VehicleNumber], [TypeVehicleID], [GrossWeight], [TareWeight], [WeighingDateTime], [OperatorID], [Notes]) VALUES (59, 4, 3, N'Щ032ЩЩ777', 2, CAST(14200.00 AS Decimal(10, 2)), CAST(7100.00 AS Decimal(10, 2)), CAST(N'2025-03-07T15:00:00.000' AS DateTime), 3, N'Гипсовые плиты')
INSERT [dbo].[Weighings] ([WeighingID], [ScaleID], [ClientID], [VehicleNumber], [TypeVehicleID], [GrossWeight], [TareWeight], [WeighingDateTime], [OperatorID], [Notes]) VALUES (60, 2, 2, N'Ю033ЮЮ777', 2, CAST(13200.00 AS Decimal(10, 2)), CAST(6800.00 AS Decimal(10, 2)), CAST(N'2025-03-08T11:45:00.000' AS DateTime), 2, N'Плиты OSB')
INSERT [dbo].[Weighings] ([WeighingID], [ScaleID], [ClientID], [VehicleNumber], [TypeVehicleID], [GrossWeight], [TareWeight], [WeighingDateTime], [OperatorID], [Notes]) VALUES (61, 2, 4, N'Я034ЯЯ777', 2, CAST(14800.00 AS Decimal(10, 2)), CAST(7500.00 AS Decimal(10, 2)), CAST(N'2025-03-09T13:15:00.000' AS DateTime), 3, N'Фанера')
INSERT [dbo].[Weighings] ([WeighingID], [ScaleID], [ClientID], [VehicleNumber], [TypeVehicleID], [GrossWeight], [TareWeight], [WeighingDateTime], [OperatorID], [Notes]) VALUES (62, 4, 5, N'А035АА777', 2, CAST(13800.00 AS Decimal(10, 2)), CAST(7000.00 AS Decimal(10, 2)), CAST(N'2025-03-10T14:45:00.000' AS DateTime), 2, N'ДВП плиты')
INSERT [dbo].[Weighings] ([WeighingID], [ScaleID], [ClientID], [VehicleNumber], [TypeVehicleID], [GrossWeight], [TareWeight], [WeighingDateTime], [OperatorID], [Notes]) VALUES (63, 2, 1, N'В036ВВ777', 2, CAST(12500.00 AS Decimal(10, 2)), CAST(6500.00 AS Decimal(10, 2)), CAST(N'2025-04-01T09:00:00.000' AS DateTime), 3, N'Газобетонные блоки')
INSERT [dbo].[Weighings] ([WeighingID], [ScaleID], [ClientID], [VehicleNumber], [TypeVehicleID], [GrossWeight], [TareWeight], [WeighingDateTime], [OperatorID], [Notes]) VALUES (64, 4, 3, N'С037СС777', 2, CAST(14200.00 AS Decimal(10, 2)), CAST(7200.00 AS Decimal(10, 2)), CAST(N'2025-04-02T10:30:00.000' AS DateTime), 2, N'Керамическая плитка')
INSERT [dbo].[Weighings] ([WeighingID], [ScaleID], [ClientID], [VehicleNumber], [TypeVehicleID], [GrossWeight], [TareWeight], [WeighingDateTime], [OperatorID], [Notes]) VALUES (65, 2, 2, N'Е038ЕЕ777', 2, CAST(13200.00 AS Decimal(10, 2)), CAST(6800.00 AS Decimal(10, 2)), CAST(N'2025-04-03T12:00:00.000' AS DateTime), 3, N'Сэндвич-панели')
INSERT [dbo].[Weighings] ([WeighingID], [ScaleID], [ClientID], [VehicleNumber], [TypeVehicleID], [GrossWeight], [TareWeight], [WeighingDateTime], [OperatorID], [Notes]) VALUES (66, 4, 4, N'Н039НН777', 2, CAST(14800.00 AS Decimal(10, 2)), CAST(7500.00 AS Decimal(10, 2)), CAST(N'2025-04-04T13:30:00.000' AS DateTime), 2, N'Металлочерепица')
INSERT [dbo].[Weighings] ([WeighingID], [ScaleID], [ClientID], [VehicleNumber], [TypeVehicleID], [GrossWeight], [TareWeight], [WeighingDateTime], [OperatorID], [Notes]) VALUES (67, 2, 5, N'К040КК777', 2, CAST(13800.00 AS Decimal(10, 2)), CAST(7000.00 AS Decimal(10, 2)), CAST(N'2025-04-05T15:00:00.000' AS DateTime), 3, N'Профнастил')
INSERT [dbo].[Weighings] ([WeighingID], [ScaleID], [ClientID], [VehicleNumber], [TypeVehicleID], [GrossWeight], [TareWeight], [WeighingDateTime], [OperatorID], [Notes]) VALUES (68, 4, 1, N'М041ММ777', 2, CAST(12500.00 AS Decimal(10, 2)), CAST(6500.00 AS Decimal(10, 2)), CAST(N'2025-04-06T09:15:00.000' AS DateTime), 2, N'Утеплитель')
INSERT [dbo].[Weighings] ([WeighingID], [ScaleID], [ClientID], [VehicleNumber], [TypeVehicleID], [GrossWeight], [TareWeight], [WeighingDateTime], [OperatorID], [Notes]) VALUES (69, 2, 3, N'О042ОО777', 2, CAST(14200.00 AS Decimal(10, 2)), CAST(7200.00 AS Decimal(10, 2)), CAST(N'2025-04-07T10:45:00.000' AS DateTime), 3, N'Гидроизоляция')
INSERT [dbo].[Weighings] ([WeighingID], [ScaleID], [ClientID], [VehicleNumber], [TypeVehicleID], [GrossWeight], [TareWeight], [WeighingDateTime], [OperatorID], [Notes]) VALUES (70, 4, 2, N'Р043РР777', 2, CAST(13200.00 AS Decimal(10, 2)), CAST(6800.00 AS Decimal(10, 2)), CAST(N'2025-04-08T12:15:00.000' AS DateTime), 2, N'Кровельные материалы')
INSERT [dbo].[Weighings] ([WeighingID], [ScaleID], [ClientID], [VehicleNumber], [TypeVehicleID], [GrossWeight], [TareWeight], [WeighingDateTime], [OperatorID], [Notes]) VALUES (71, 2, 4, N'Т044ТТ777', 2, CAST(14800.00 AS Decimal(10, 2)), CAST(7500.00 AS Decimal(10, 2)), CAST(N'2025-04-09T13:45:00.000' AS DateTime), 3, N'Сайдинг')
INSERT [dbo].[Weighings] ([WeighingID], [ScaleID], [ClientID], [VehicleNumber], [TypeVehicleID], [GrossWeight], [TareWeight], [WeighingDateTime], [OperatorID], [Notes]) VALUES (72, 4, 5, N'Х045ХХ777', 2, CAST(13800.00 AS Decimal(10, 2)), CAST(7000.00 AS Decimal(10, 2)), CAST(N'2025-04-10T15:15:00.000' AS DateTime), 2, N'Лакокрасочные материалы')
INSERT [dbo].[Weighings] ([WeighingID], [ScaleID], [ClientID], [VehicleNumber], [TypeVehicleID], [GrossWeight], [TareWeight], [WeighingDateTime], [OperatorID], [Notes]) VALUES (73, 2, 1, N'Ц046ЦЦ777', 2, CAST(12500.00 AS Decimal(10, 2)), CAST(6500.00 AS Decimal(10, 2)), CAST(N'2025-05-01T09:30:00.000' AS DateTime), 3, N'Стекло')
INSERT [dbo].[Weighings] ([WeighingID], [ScaleID], [ClientID], [VehicleNumber], [TypeVehicleID], [GrossWeight], [TareWeight], [WeighingDateTime], [OperatorID], [Notes]) VALUES (74, 4, 3, N'Ч047ЧЧ777', 2, CAST(14200.00 AS Decimal(10, 2)), CAST(7200.00 AS Decimal(10, 2)), CAST(N'2025-05-02T11:00:00.000' AS DateTime), 2, N'Двери')
INSERT [dbo].[Weighings] ([WeighingID], [ScaleID], [ClientID], [VehicleNumber], [TypeVehicleID], [GrossWeight], [TareWeight], [WeighingDateTime], [OperatorID], [Notes]) VALUES (75, 2, 2, N'Ш048ШШ777', 2, CAST(13200.00 AS Decimal(10, 2)), CAST(6800.00 AS Decimal(10, 2)), CAST(N'2025-05-03T12:30:00.000' AS DateTime), 3, N'Окна')
INSERT [dbo].[Weighings] ([WeighingID], [ScaleID], [ClientID], [VehicleNumber], [TypeVehicleID], [GrossWeight], [TareWeight], [WeighingDateTime], [OperatorID], [Notes]) VALUES (76, 4, 4, N'Щ049ЩЩ777', 2, CAST(14800.00 AS Decimal(10, 2)), CAST(7500.00 AS Decimal(10, 2)), CAST(N'2025-05-04T14:00:00.000' AS DateTime), 2, N'Сантехника')
INSERT [dbo].[Weighings] ([WeighingID], [ScaleID], [ClientID], [VehicleNumber], [TypeVehicleID], [GrossWeight], [TareWeight], [WeighingDateTime], [OperatorID], [Notes]) VALUES (77, 2, 5, N'Ю050ЮЮ777', 2, CAST(13800.00 AS Decimal(10, 2)), CAST(7000.00 AS Decimal(10, 2)), CAST(N'2025-05-05T15:30:00.000' AS DateTime), 3, N'Электрооборудование')
INSERT [dbo].[Weighings] ([WeighingID], [ScaleID], [ClientID], [VehicleNumber], [TypeVehicleID], [GrossWeight], [TareWeight], [WeighingDateTime], [OperatorID], [Notes]) VALUES (78, 1, 5, N'Я051ЯЯ777', 3, CAST(28500.00 AS Decimal(10, 2)), CAST(12500.00 AS Decimal(10, 2)), CAST(N'2025-06-01T09:00:00.000' AS DateTime), 2, N'ЖБИ конструкции')
INSERT [dbo].[Weighings] ([WeighingID], [ScaleID], [ClientID], [VehicleNumber], [TypeVehicleID], [GrossWeight], [TareWeight], [WeighingDateTime], [OperatorID], [Notes]) VALUES (79, 2, 1, N'А052АА777', 3, CAST(36500.00 AS Decimal(10, 2)), CAST(13500.00 AS Decimal(10, 2)), CAST(N'2025-06-02T10:30:00.000' AS DateTime), 3, N'Металлопрокат')
INSERT [dbo].[Weighings] ([WeighingID], [ScaleID], [ClientID], [VehicleNumber], [TypeVehicleID], [GrossWeight], [TareWeight], [WeighingDateTime], [OperatorID], [Notes]) VALUES (80, 2, 2, N'В053ВВ777', 3, CAST(32500.00 AS Decimal(10, 2)), CAST(13000.00 AS Decimal(10, 2)), CAST(N'2025-06-03T12:00:00.000' AS DateTime), 2, N'Бетонные блоки')
INSERT [dbo].[Weighings] ([WeighingID], [ScaleID], [ClientID], [VehicleNumber], [TypeVehicleID], [GrossWeight], [TareWeight], [WeighingDateTime], [OperatorID], [Notes]) VALUES (81, 1, 3, N'С054СС777', 3, CAST(29500.00 AS Decimal(10, 2)), CAST(12500.00 AS Decimal(10, 2)), CAST(N'2025-06-04T13:30:00.000' AS DateTime), 3, N'Асфальтовая смесь')
INSERT [dbo].[Weighings] ([WeighingID], [ScaleID], [ClientID], [VehicleNumber], [TypeVehicleID], [GrossWeight], [TareWeight], [WeighingDateTime], [OperatorID], [Notes]) VALUES (82, 2, 4, N'Е055ЕЕ777', 3, CAST(38500.00 AS Decimal(10, 2)), CAST(13500.00 AS Decimal(10, 2)), CAST(N'2025-06-05T15:00:00.000' AS DateTime), 2, N'Трубы стальные')
INSERT [dbo].[Weighings] ([WeighingID], [ScaleID], [ClientID], [VehicleNumber], [TypeVehicleID], [GrossWeight], [TareWeight], [WeighingDateTime], [OperatorID], [Notes]) VALUES (83, 2, 5, N'Н056НН777', 3, CAST(35500.00 AS Decimal(10, 2)), CAST(13500.00 AS Decimal(10, 2)), CAST(N'2025-06-06T09:15:00.000' AS DateTime), 3, N'Кирпич огнеупорный')
INSERT [dbo].[Weighings] ([WeighingID], [ScaleID], [ClientID], [VehicleNumber], [TypeVehicleID], [GrossWeight], [TareWeight], [WeighingDateTime], [OperatorID], [Notes]) VALUES (84, 1, 1, N'К057КК777', 3, CAST(31500.00 AS Decimal(10, 2)), CAST(13000.00 AS Decimal(10, 2)), CAST(N'2025-06-07T10:45:00.000' AS DateTime), 2, N'Железобетонные изделия')
INSERT [dbo].[Weighings] ([WeighingID], [ScaleID], [ClientID], [VehicleNumber], [TypeVehicleID], [GrossWeight], [TareWeight], [WeighingDateTime], [OperatorID], [Notes]) VALUES (85, 2, 2, N'М058ММ777', 3, CAST(37500.00 AS Decimal(10, 2)), CAST(13500.00 AS Decimal(10, 2)), CAST(N'2025-06-08T12:15:00.000' AS DateTime), 3, N'Металлические конструкции')
INSERT [dbo].[Weighings] ([WeighingID], [ScaleID], [ClientID], [VehicleNumber], [TypeVehicleID], [GrossWeight], [TareWeight], [WeighingDateTime], [OperatorID], [Notes]) VALUES (86, 1, 3, N'О059ОО777', 3, CAST(33500.00 AS Decimal(10, 2)), CAST(13000.00 AS Decimal(10, 2)), CAST(N'2025-06-09T13:45:00.000' AS DateTime), 2, N'Балки металлические')
INSERT [dbo].[Weighings] ([WeighingID], [ScaleID], [ClientID], [VehicleNumber], [TypeVehicleID], [GrossWeight], [TareWeight], [WeighingDateTime], [OperatorID], [Notes]) VALUES (87, 2, 4, N'Р060РР777', 3, CAST(39500.00 AS Decimal(10, 2)), CAST(13500.00 AS Decimal(10, 2)), CAST(N'2025-06-10T15:15:00.000' AS DateTime), 3, N'Арматура')
INSERT [dbo].[Weighings] ([WeighingID], [ScaleID], [ClientID], [VehicleNumber], [TypeVehicleID], [GrossWeight], [TareWeight], [WeighingDateTime], [OperatorID], [Notes]) VALUES (88, 1, 5, N'Т061ТТ777', 3, CAST(28500.00 AS Decimal(10, 2)), CAST(12500.00 AS Decimal(10, 2)), CAST(N'2025-07-01T09:30:00.000' AS DateTime), 2, N'ЖБИ кольца')
INSERT [dbo].[Weighings] ([WeighingID], [ScaleID], [ClientID], [VehicleNumber], [TypeVehicleID], [GrossWeight], [TareWeight], [WeighingDateTime], [OperatorID], [Notes]) VALUES (89, 2, 1, N'Х062ХХ777', 3, CAST(36500.00 AS Decimal(10, 2)), CAST(13500.00 AS Decimal(10, 2)), CAST(N'2025-07-02T11:00:00.000' AS DateTime), 3, N'Листовой металл')
INSERT [dbo].[Weighings] ([WeighingID], [ScaleID], [ClientID], [VehicleNumber], [TypeVehicleID], [GrossWeight], [TareWeight], [WeighingDateTime], [OperatorID], [Notes]) VALUES (90, 1, 2, N'Ц063ЦЦ777', 3, CAST(30500.00 AS Decimal(10, 2)), CAST(13000.00 AS Decimal(10, 2)), CAST(N'2025-07-03T12:30:00.000' AS DateTime), 2, N'Трубы большого диаметра')
INSERT [dbo].[Weighings] ([WeighingID], [ScaleID], [ClientID], [VehicleNumber], [TypeVehicleID], [GrossWeight], [TareWeight], [WeighingDateTime], [OperatorID], [Notes]) VALUES (91, 2, 3, N'Ч064ЧЧ777', 3, CAST(37500.00 AS Decimal(10, 2)), CAST(13500.00 AS Decimal(10, 2)), CAST(N'2025-07-04T14:00:00.000' AS DateTime), 3, N'Металлоконструкции')
INSERT [dbo].[Weighings] ([WeighingID], [ScaleID], [ClientID], [VehicleNumber], [TypeVehicleID], [GrossWeight], [TareWeight], [WeighingDateTime], [OperatorID], [Notes]) VALUES (92, 1, 4, N'Ш065ШШ777', 3, CAST(29500.00 AS Decimal(10, 2)), CAST(12500.00 AS Decimal(10, 2)), CAST(N'2025-07-05T15:30:00.000' AS DateTime), 2, N'Фундаментные блоки')
INSERT [dbo].[Weighings] ([WeighingID], [ScaleID], [ClientID], [VehicleNumber], [TypeVehicleID], [GrossWeight], [TareWeight], [WeighingDateTime], [OperatorID], [Notes]) VALUES (93, 2, 5, N'Щ066ЩЩ777', 3, CAST(38500.00 AS Decimal(10, 2)), CAST(13500.00 AS Decimal(10, 2)), CAST(N'2025-07-06T10:00:00.000' AS DateTime), 3, N'Балки перекрытия')
INSERT [dbo].[Weighings] ([WeighingID], [ScaleID], [ClientID], [VehicleNumber], [TypeVehicleID], [GrossWeight], [TareWeight], [WeighingDateTime], [OperatorID], [Notes]) VALUES (94, 1, 1, N'Ю067ЮЮ777', 3, CAST(31500.00 AS Decimal(10, 2)), CAST(13000.00 AS Decimal(10, 2)), CAST(N'2025-07-07T11:30:00.000' AS DateTime), 2, N'Колонны железобетонные')
INSERT [dbo].[Weighings] ([WeighingID], [ScaleID], [ClientID], [VehicleNumber], [TypeVehicleID], [GrossWeight], [TareWeight], [WeighingDateTime], [OperatorID], [Notes]) VALUES (95, 2, 2, N'Я068ЯЯ777', 3, CAST(35500.00 AS Decimal(10, 2)), CAST(13500.00 AS Decimal(10, 2)), CAST(N'2025-07-08T13:00:00.000' AS DateTime), 3, N'Плиты перекрытия')
INSERT [dbo].[Weighings] ([WeighingID], [ScaleID], [ClientID], [VehicleNumber], [TypeVehicleID], [GrossWeight], [TareWeight], [WeighingDateTime], [OperatorID], [Notes]) VALUES (96, 1, 3, N'А069АА777', 3, CAST(27500.00 AS Decimal(10, 2)), CAST(12500.00 AS Decimal(10, 2)), CAST(N'2025-07-09T14:30:00.000' AS DateTime), 2, N'Лестничные марши')
INSERT [dbo].[Weighings] ([WeighingID], [ScaleID], [ClientID], [VehicleNumber], [TypeVehicleID], [GrossWeight], [TareWeight], [WeighingDateTime], [OperatorID], [Notes]) VALUES (97, 2, 4, N'В070ВВ777', 3, CAST(36500.00 AS Decimal(10, 2)), CAST(13500.00 AS Decimal(10, 2)), CAST(N'2025-07-10T16:00:00.000' AS DateTime), 3, N'Фермы металлические')
INSERT [dbo].[Weighings] ([WeighingID], [ScaleID], [ClientID], [VehicleNumber], [TypeVehicleID], [GrossWeight], [TareWeight], [WeighingDateTime], [OperatorID], [Notes]) VALUES (98, 1, 5, N'С071СС777', 3, CAST(30500.00 AS Decimal(10, 2)), CAST(13000.00 AS Decimal(10, 2)), CAST(N'2025-07-11T09:15:00.000' AS DateTime), 2, N'Ригели')
INSERT [dbo].[Weighings] ([WeighingID], [ScaleID], [ClientID], [VehicleNumber], [TypeVehicleID], [GrossWeight], [TareWeight], [WeighingDateTime], [OperatorID], [Notes]) VALUES (99, 2, 1, N'Е072ЕЕ777', 3, CAST(37500.00 AS Decimal(10, 2)), CAST(13500.00 AS Decimal(10, 2)), CAST(N'2025-07-12T10:45:00.000' AS DateTime), 3, N'Колонны металлические')
INSERT [dbo].[Weighings] ([WeighingID], [ScaleID], [ClientID], [VehicleNumber], [TypeVehicleID], [GrossWeight], [TareWeight], [WeighingDateTime], [OperatorID], [Notes]) VALUES (100, 1, 2, N'Н073НН777', 3, CAST(28500.00 AS Decimal(10, 2)), CAST(12500.00 AS Decimal(10, 2)), CAST(N'2025-07-13T12:15:00.000' AS DateTime), 2, N'Плиты дорожные')
INSERT [dbo].[Weighings] ([WeighingID], [ScaleID], [ClientID], [VehicleNumber], [TypeVehicleID], [GrossWeight], [TareWeight], [WeighingDateTime], [OperatorID], [Notes]) VALUES (101, 2, 3, N'К074КК777', 3, CAST(39500.00 AS Decimal(10, 2)), CAST(13500.00 AS Decimal(10, 2)), CAST(N'2025-07-14T13:45:00.000' AS DateTime), 3, N'Ограждения металлические')
INSERT [dbo].[Weighings] ([WeighingID], [ScaleID], [ClientID], [VehicleNumber], [TypeVehicleID], [GrossWeight], [TareWeight], [WeighingDateTime], [OperatorID], [Notes]) VALUES (102, 1, 4, N'М075ММ777', 3, CAST(31500.00 AS Decimal(10, 2)), CAST(13000.00 AS Decimal(10, 2)), CAST(N'2025-07-15T15:15:00.000' AS DateTime), 2, N'Блоки строительные')
INSERT [dbo].[Weighings] ([WeighingID], [ScaleID], [ClientID], [VehicleNumber], [TypeVehicleID], [GrossWeight], [TareWeight], [WeighingDateTime], [OperatorID], [Notes]) VALUES (103, 3, 1, N'РЖД076777', 6, CAST(75000.00 AS Decimal(10, 2)), CAST(22000.00 AS Decimal(10, 2)), CAST(N'2025-08-01T08:45:00.000' AS DateTime), 3, N'Уголь каменный')
INSERT [dbo].[Weighings] ([WeighingID], [ScaleID], [ClientID], [VehicleNumber], [TypeVehicleID], [GrossWeight], [TareWeight], [WeighingDateTime], [OperatorID], [Notes]) VALUES (104, 3, 2, N'РЖД077777', 6, CAST(92000.00 AS Decimal(10, 2)), CAST(27000.00 AS Decimal(10, 2)), CAST(N'2025-08-02T11:15:00.000' AS DateTime), 2, N'Зерно пшеницы')
GO
INSERT [dbo].[Weighings] ([WeighingID], [ScaleID], [ClientID], [VehicleNumber], [TypeVehicleID], [GrossWeight], [TareWeight], [WeighingDateTime], [OperatorID], [Notes]) VALUES (105, 3, 5, N'РЖД078777', 6, CAST(85000.00 AS Decimal(10, 2)), CAST(25000.00 AS Decimal(10, 2)), CAST(N'2025-08-03T13:45:00.000' AS DateTime), 3, N'Руда железная')
INSERT [dbo].[Weighings] ([WeighingID], [ScaleID], [ClientID], [VehicleNumber], [TypeVehicleID], [GrossWeight], [TareWeight], [WeighingDateTime], [OperatorID], [Notes]) VALUES (106, 3, 3, N'РЖД079777', 6, CAST(78000.00 AS Decimal(10, 2)), CAST(23000.00 AS Decimal(10, 2)), CAST(N'2025-08-04T16:15:00.000' AS DateTime), 2, N'Удобрения минеральные')
INSERT [dbo].[Weighings] ([WeighingID], [ScaleID], [ClientID], [VehicleNumber], [TypeVehicleID], [GrossWeight], [TareWeight], [WeighingDateTime], [OperatorID], [Notes]) VALUES (107, 3, 4, N'РЖД080777', 6, CAST(88000.00 AS Decimal(10, 2)), CAST(26000.00 AS Decimal(10, 2)), CAST(N'2025-08-05T09:00:00.000' AS DateTime), 3, N'Песок строительный')
INSERT [dbo].[Weighings] ([WeighingID], [ScaleID], [ClientID], [VehicleNumber], [TypeVehicleID], [GrossWeight], [TareWeight], [WeighingDateTime], [OperatorID], [Notes]) VALUES (108, 3, 1, N'РЖД081777', 6, CAST(82000.00 AS Decimal(10, 2)), CAST(24000.00 AS Decimal(10, 2)), CAST(N'2025-08-06T11:30:00.000' AS DateTime), 2, N'Щебень гранитный')
INSERT [dbo].[Weighings] ([WeighingID], [ScaleID], [ClientID], [VehicleNumber], [TypeVehicleID], [GrossWeight], [TareWeight], [WeighingDateTime], [OperatorID], [Notes]) VALUES (109, 3, 2, N'РЖД082777', 6, CAST(79000.00 AS Decimal(10, 2)), CAST(23000.00 AS Decimal(10, 2)), CAST(N'2025-08-07T14:00:00.000' AS DateTime), 3, N'Кокс')
INSERT [dbo].[Weighings] ([WeighingID], [ScaleID], [ClientID], [VehicleNumber], [TypeVehicleID], [GrossWeight], [TareWeight], [WeighingDateTime], [OperatorID], [Notes]) VALUES (110, 3, 5, N'РЖД083777', 6, CAST(86000.00 AS Decimal(10, 2)), CAST(25000.00 AS Decimal(10, 2)), CAST(N'2025-08-08T16:30:00.000' AS DateTime), 2, N'Глина')
INSERT [dbo].[Weighings] ([WeighingID], [ScaleID], [ClientID], [VehicleNumber], [TypeVehicleID], [GrossWeight], [TareWeight], [WeighingDateTime], [OperatorID], [Notes]) VALUES (111, 3, 3, N'РЖД084777', 6, CAST(90000.00 AS Decimal(10, 2)), CAST(26000.00 AS Decimal(10, 2)), CAST(N'2025-08-09T09:15:00.000' AS DateTime), 3, N'Известняк')
INSERT [dbo].[Weighings] ([WeighingID], [ScaleID], [ClientID], [VehicleNumber], [TypeVehicleID], [GrossWeight], [TareWeight], [WeighingDateTime], [OperatorID], [Notes]) VALUES (112, 3, 4, N'РЖД085777', 6, CAST(83000.00 AS Decimal(10, 2)), CAST(24000.00 AS Decimal(10, 2)), CAST(N'2025-08-10T11:45:00.000' AS DateTime), 2, N'Гипс')
INSERT [dbo].[Weighings] ([WeighingID], [ScaleID], [ClientID], [VehicleNumber], [TypeVehicleID], [GrossWeight], [TareWeight], [WeighingDateTime], [OperatorID], [Notes]) VALUES (113, 3, 1, N'РЖД086777', 6, CAST(87000.00 AS Decimal(10, 2)), CAST(25000.00 AS Decimal(10, 2)), CAST(N'2025-09-01T08:30:00.000' AS DateTime), 3, N'Цемент')
INSERT [dbo].[Weighings] ([WeighingID], [ScaleID], [ClientID], [VehicleNumber], [TypeVehicleID], [GrossWeight], [TareWeight], [WeighingDateTime], [OperatorID], [Notes]) VALUES (114, 3, 2, N'РЖД087777', 6, CAST(89000.00 AS Decimal(10, 2)), CAST(26000.00 AS Decimal(10, 2)), CAST(N'2025-09-02T11:00:00.000' AS DateTime), 2, N'Бокситы')
INSERT [dbo].[Weighings] ([WeighingID], [ScaleID], [ClientID], [VehicleNumber], [TypeVehicleID], [GrossWeight], [TareWeight], [WeighingDateTime], [OperatorID], [Notes]) VALUES (115, 3, 5, N'РЖД088777', 6, CAST(84000.00 AS Decimal(10, 2)), CAST(24000.00 AS Decimal(10, 2)), CAST(N'2025-09-03T13:30:00.000' AS DateTime), 3, N'Фосфориты')
INSERT [dbo].[Weighings] ([WeighingID], [ScaleID], [ClientID], [VehicleNumber], [TypeVehicleID], [GrossWeight], [TareWeight], [WeighingDateTime], [OperatorID], [Notes]) VALUES (116, 3, 3, N'РЖД089777', 6, CAST(91000.00 AS Decimal(10, 2)), CAST(27000.00 AS Decimal(10, 2)), CAST(N'2025-09-04T16:00:00.000' AS DateTime), 2, N'Сера')
INSERT [dbo].[Weighings] ([WeighingID], [ScaleID], [ClientID], [VehicleNumber], [TypeVehicleID], [GrossWeight], [TareWeight], [WeighingDateTime], [OperatorID], [Notes]) VALUES (117, 3, 4, N'РЖД090777', 6, CAST(85000.00 AS Decimal(10, 2)), CAST(25000.00 AS Decimal(10, 2)), CAST(N'2025-09-05T08:45:00.000' AS DateTime), 3, N'Калийные соли')
INSERT [dbo].[Weighings] ([WeighingID], [ScaleID], [ClientID], [VehicleNumber], [TypeVehicleID], [GrossWeight], [TareWeight], [WeighingDateTime], [OperatorID], [Notes]) VALUES (118, 3, 1, N'РЖД091777', 6, CAST(88000.00 AS Decimal(10, 2)), CAST(26000.00 AS Decimal(10, 2)), CAST(N'2025-09-06T11:15:00.000' AS DateTime), 2, N'Апатиты')
INSERT [dbo].[Weighings] ([WeighingID], [ScaleID], [ClientID], [VehicleNumber], [TypeVehicleID], [GrossWeight], [TareWeight], [WeighingDateTime], [OperatorID], [Notes]) VALUES (119, 3, 2, N'РЖД092777', 6, CAST(82000.00 AS Decimal(10, 2)), CAST(24000.00 AS Decimal(10, 2)), CAST(N'2025-09-07T13:45:00.000' AS DateTime), 3, N'Нефтепродукты')
INSERT [dbo].[Weighings] ([WeighingID], [ScaleID], [ClientID], [VehicleNumber], [TypeVehicleID], [GrossWeight], [TareWeight], [WeighingDateTime], [OperatorID], [Notes]) VALUES (120, 3, 5, N'РЖД093777', 6, CAST(79000.00 AS Decimal(10, 2)), CAST(23000.00 AS Decimal(10, 2)), CAST(N'2025-09-08T16:15:00.000' AS DateTime), 2, N'Мазут')
INSERT [dbo].[Weighings] ([WeighingID], [ScaleID], [ClientID], [VehicleNumber], [TypeVehicleID], [GrossWeight], [TareWeight], [WeighingDateTime], [OperatorID], [Notes]) VALUES (121, 3, 3, N'РЖД094777', 6, CAST(86000.00 AS Decimal(10, 2)), CAST(25000.00 AS Decimal(10, 2)), CAST(N'2025-09-09T09:00:00.000' AS DateTime), 3, N'Битум')
INSERT [dbo].[Weighings] ([WeighingID], [ScaleID], [ClientID], [VehicleNumber], [TypeVehicleID], [GrossWeight], [TareWeight], [WeighingDateTime], [OperatorID], [Notes]) VALUES (122, 3, 4, N'РЖД095777', 6, CAST(90000.00 AS Decimal(10, 2)), CAST(26000.00 AS Decimal(10, 2)), CAST(N'2025-09-10T11:30:00.000' AS DateTime), 2, N'Асфальт')
INSERT [dbo].[Weighings] ([WeighingID], [ScaleID], [ClientID], [VehicleNumber], [TypeVehicleID], [GrossWeight], [TareWeight], [WeighingDateTime], [OperatorID], [Notes]) VALUES (123, 3, 1, N'РЖД096777', 6, CAST(83000.00 AS Decimal(10, 2)), CAST(24000.00 AS Decimal(10, 2)), CAST(N'2025-09-11T14:00:00.000' AS DateTime), 3, N'Гудрон')
INSERT [dbo].[Weighings] ([WeighingID], [ScaleID], [ClientID], [VehicleNumber], [TypeVehicleID], [GrossWeight], [TareWeight], [WeighingDateTime], [OperatorID], [Notes]) VALUES (124, 3, 2, N'РЖД097777', 6, CAST(87000.00 AS Decimal(10, 2)), CAST(25000.00 AS Decimal(10, 2)), CAST(N'2025-09-12T16:30:00.000' AS DateTime), 2, N'Кокс неф')
INSERT [dbo].[Weighings] ([WeighingID], [ScaleID], [ClientID], [VehicleNumber], [TypeVehicleID], [GrossWeight], [TareWeight], [WeighingDateTime], [OperatorID], [Notes]) VALUES (126, 1, 1, N'УА856У7 66', 3, CAST(24100.00 AS Decimal(10, 2)), CAST(5250.00 AS Decimal(10, 2)), CAST(N'2025-07-01T22:50:04.857' AS DateTime), 2, N'Зерно')
INSERT [dbo].[Weighings] ([WeighingID], [ScaleID], [ClientID], [VehicleNumber], [TypeVehicleID], [GrossWeight], [TareWeight], [WeighingDateTime], [OperatorID], [Notes]) VALUES (134, 1, 1, N'Н778ЕМ 799', 3, CAST(23660.00 AS Decimal(10, 2)), CAST(9000.00 AS Decimal(10, 2)), CAST(N'2025-07-02T21:24:10.357' AS DateTime), 2, N'Песок')
INSERT [dbo].[Weighings] ([WeighingID], [ScaleID], [ClientID], [VehicleNumber], [TypeVehicleID], [GrossWeight], [TareWeight], [WeighingDateTime], [OperatorID], [Notes]) VALUES (135, 1, 1, N'В030КК 79', 2, CAST(10330.00 AS Decimal(10, 2)), CAST(5000.00 AS Decimal(10, 2)), CAST(N'2025-07-02T21:25:32.673' AS DateTime), 2, N'Мешки гречки')
SET IDENTITY_INSERT [dbo].[Weighings] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Scales__048A00080458EE54]    Script Date: 02.07.2025 21:53:26 ******/
ALTER TABLE [dbo].[Scales] ADD UNIQUE NONCLUSTERED 
(
	[SerialNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Users__536C85E40DD836F8]    Script Date: 02.07.2025 21:53:26 ******/
ALTER TABLE [dbo].[Users] ADD UNIQUE NONCLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Scales] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Weighings] ADD  CONSTRAINT [DF__Weighings__Weigh__412EB0B6]  DEFAULT (getdate()) FOR [WeighingDateTime]
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
ALTER TABLE [dbo].[Weighings]  WITH CHECK ADD  CONSTRAINT [FK_Weighings_TypeVehicle] FOREIGN KEY([TypeVehicleID])
REFERENCES [dbo].[TypeVehicle] ([TypeID])
GO
ALTER TABLE [dbo].[Weighings] CHECK CONSTRAINT [FK_Weighings_TypeVehicle]
GO
USE [master]
GO
ALTER DATABASE [BridgeScales] SET  READ_WRITE 
GO

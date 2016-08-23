USE [ALT + F4]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 12 Aug 2015 8:28:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Categories](
	[CatID] [int] IDENTITY(1,1) NOT NULL,
	[Category] [varchar](50) NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[CatID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Deliveries]    Script Date: 12 Aug 2015 8:28:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Deliveries](
	[DeliveryNo] [int] IDENTITY(1,1) NOT NULL,
	[OrderNo] [int] NULL,
	[Deadline] [datetime] NULL,
	[DateDelivered] [datetime] NULL,
	[Status] [varchar](20) NULL,
 CONSTRAINT [PK_Deliveries] PRIMARY KEY CLUSTERED 
(
	[DeliveryNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Feedback]    Script Date: 12 Aug 2015 8:28:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Feedback](
	[FeebackID] [int] IDENTITY(1,1) NOT NULL,
	[DateCreated] [datetime] NULL,
	[DateResponded] [datetime] NULL,
	[UserID] [int] NULL,
	[Feedback] [varchar](200) NULL,
	[Response] [varchar](200) NULL,
	[Status] [varchar](20) NULL,
 CONSTRAINT [PK_Feedback] PRIMARY KEY CLUSTERED 
(
	[FeebackID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Logs]    Script Date: 12 Aug 2015 8:28:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Logs](
	[LogID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[LogType] [varchar](20) NULL,
	[Description] [varchar](max) NULL,
	[Timestamp] [datetime] NULL,
 CONSTRAINT [PK_Logs] PRIMARY KEY CLUSTERED 
(
	[LogID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 12 Aug 2015 8:28:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[RefNo] [int] IDENTITY(1,1) NOT NULL,
	[OrderNo] [int] NULL,
	[UserID] [int] NULL,
	[ProductID] [int] NULL,
	[Quantity] [int] NULL,
	[Amount] [decimal](18, 2) NULL,
	[Status] [varchar](20) NULL,
 CONSTRAINT [PK_OrderDetails] PRIMARY KEY CLUSTERED 
(
	[RefNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 12 Aug 2015 8:28:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderNo] [int] IDENTITY(1,1) NOT NULL,
	[DateOrdered] [datetime] NULL,
	[PaymentMethod] [varchar](50) NULL,
	[Status] [varchar](20) NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[OrderNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Products]    Script Date: 12 Aug 2015 8:28:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Products](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NULL,
	[CatID] [int] NULL,
	[Code] [varchar](20) NULL,
	[Description] [varchar](max) NULL,
	[Image] [varchar](max) NULL,
	[Price] [decimal](18, 2) NULL,
	[IsFeatured] [varchar](3) NULL,
	[Available] [int] NULL,
	[Criticallevel] [int] NULL,
	[Maximum] [int] NULL,
	[Status] [varchar](20) NULL,
	[DateAdded] [datetime] NULL,
	[DateModified] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PurchaseDetails]    Script Date: 12 Aug 2015 8:28:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PurchaseDetails](
	[RefNo] [int] IDENTITY(1,1) NOT NULL,
	[PurchaseNo] [int] NULL,
	[ProductID] [int] NULL,
	[Quantity] [int] NULL,
 CONSTRAINT [PK_PurchaseDetails] PRIMARY KEY CLUSTERED 
(
	[RefNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Purchases]    Script Date: 12 Aug 2015 8:28:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Purchases](
	[PurchaseNo] [int] NULL,
	[SupplierID] [int] NULL,
	[DatePurchased] [datetime] NULL,
	[DateReceived] [datetime] NULL,
	[ReceiptNo] [int] NULL,
	[Status] [varchar](20) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Receiving]    Script Date: 12 Aug 2015 8:28:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Receiving](
	[ReceivingNo] [int] IDENTITY(1,1) NOT NULL,
	[DateReceived] [int] NULL,
	[UserID] [int] NULL,
	[PurchaseNo] [int] NULL,
	[ProductID] [int] NULL,
	[Quantity] [int] NULL,
 CONSTRAINT [PK_Receiving] PRIMARY KEY CLUSTERED 
(
	[ReceivingNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Releasing]    Script Date: 12 Aug 2015 8:28:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Releasing](
	[ReleasingNo] [int] NULL,
	[DateReleased] [datetime] NULL,
	[UserID] [int] NULL,
	[OrderNo] [int] NULL,
	[ProductID] [int] NULL,
	[Quantity] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Reviews]    Script Date: 12 Aug 2015 8:28:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Reviews](
	[ReviewID] [int] IDENTITY(1,1) NOT NULL,
	[DateReviewed] [datetime] NULL,
	[UserID] [int] NULL,
	[ProductID] [int] NULL,
	[Rating] [int] NULL,
	[Review] [varchar](200) NULL,
	[Status] [varchar](20) NULL,
 CONSTRAINT [PK_Reviews] PRIMARY KEY CLUSTERED 
(
	[ReviewID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SupplierItems]    Script Date: 12 Aug 2015 8:28:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SupplierItems](
	[RefNo] [int] IDENTITY(1,1) NOT NULL,
	[SupplierID] [int] NULL,
	[ProductID] [int] NULL,
 CONSTRAINT [PK_SupplierItems] PRIMARY KEY CLUSTERED 
(
	[RefNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Suppliers]    Script Date: 12 Aug 2015 8:28:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Suppliers](
	[SupplierID] [int] IDENTITY(1,1) NOT NULL,
	[CompanyName] [varchar](200) NULL,
	[ContactPerson] [varchar](100) NULL,
	[Address] [varchar](max) NULL,
	[Phone] [varchar](12) NULL,
	[Mobile] [varchar](12) NULL,
	[Status] [varchar](20) NULL,
	[DateAdded] [datetime] NULL,
	[DateModified] [datetime] NULL,
 CONSTRAINT [PK_Suppliers] PRIMARY KEY CLUSTERED 
(
	[SupplierID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Types]    Script Date: 12 Aug 2015 8:28:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Types](
	[TypeID] [int] IDENTITY(1,1) NOT NULL,
	[UserType] [varchar](30) NULL,
 CONSTRAINT [PK_Types] PRIMARY KEY CLUSTERED 
(
	[TypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Users]    Script Date: 12 Aug 2015 8:28:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[TypeID] [int] NULL,
	[Email] [varchar](100) NULL,
	[Password] [varchar](max) NULL,
	[FirstName] [varchar](80) NULL,
	[LastName] [varchar](80) NULL,
	[Street] [varchar](50) NULL,
	[Municipality] [varchar](80) NULL,
	[City] [varchar](50) NULL,
	[Phone] [varchar](12) NULL,
	[Mobile] [varchar](12) NULL,
	[Status] [varchar](20) NULL,
	[DateAdded] [datetime] NULL,
	[DateModified] [datetime] NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([CatID], [Category]) VALUES (1, N'Drums')
INSERT [dbo].[Categories] ([CatID], [Category]) VALUES (2, N'Guitar')
INSERT [dbo].[Categories] ([CatID], [Category]) VALUES (3, N'Launchpad')
INSERT [dbo].[Categories] ([CatID], [Category]) VALUES (4, N'Piano')
INSERT [dbo].[Categories] ([CatID], [Category]) VALUES (5, N'Violin')
SET IDENTITY_INSERT [dbo].[Categories] OFF
SET IDENTITY_INSERT [dbo].[Deliveries] ON 

INSERT [dbo].[Deliveries] ([DeliveryNo], [OrderNo], [Deadline], [DateDelivered], [Status]) VALUES (1, 1, CAST(N'2015-08-13 16:41:05.137' AS DateTime), CAST(N'2015-08-07 17:46:23.430' AS DateTime), N'Delivered')
INSERT [dbo].[Deliveries] ([DeliveryNo], [OrderNo], [Deadline], [DateDelivered], [Status]) VALUES (2, 2, CAST(N'2015-08-13 16:42:16.187' AS DateTime), NULL, N'Pending')
INSERT [dbo].[Deliveries] ([DeliveryNo], [OrderNo], [Deadline], [DateDelivered], [Status]) VALUES (3, 3, CAST(N'2015-08-13 16:43:12.777' AS DateTime), NULL, N'Pending')
INSERT [dbo].[Deliveries] ([DeliveryNo], [OrderNo], [Deadline], [DateDelivered], [Status]) VALUES (4, 4, CAST(N'2015-08-13 17:13:23.113' AS DateTime), NULL, N'Pending')
INSERT [dbo].[Deliveries] ([DeliveryNo], [OrderNo], [Deadline], [DateDelivered], [Status]) VALUES (5, 5, CAST(N'2015-08-13 17:27:49.070' AS DateTime), NULL, N'Delivered')
INSERT [dbo].[Deliveries] ([DeliveryNo], [OrderNo], [Deadline], [DateDelivered], [Status]) VALUES (6, 6, CAST(N'2015-08-13 17:30:21.050' AS DateTime), NULL, N'Pending')
INSERT [dbo].[Deliveries] ([DeliveryNo], [OrderNo], [Deadline], [DateDelivered], [Status]) VALUES (7, 7, CAST(N'2015-08-13 17:34:26.830' AS DateTime), NULL, N'Pending')
INSERT [dbo].[Deliveries] ([DeliveryNo], [OrderNo], [Deadline], [DateDelivered], [Status]) VALUES (8, 8, CAST(N'2015-08-13 17:47:55.330' AS DateTime), CAST(N'2014-12-12 00:00:00.000' AS DateTime), N'Delivered')
INSERT [dbo].[Deliveries] ([DeliveryNo], [OrderNo], [Deadline], [DateDelivered], [Status]) VALUES (9, 9, CAST(N'2015-08-13 17:54:01.017' AS DateTime), NULL, N'Pending')
INSERT [dbo].[Deliveries] ([DeliveryNo], [OrderNo], [Deadline], [DateDelivered], [Status]) VALUES (10, 10, CAST(N'2015-08-13 19:22:09.687' AS DateTime), NULL, N'Pending')
INSERT [dbo].[Deliveries] ([DeliveryNo], [OrderNo], [Deadline], [DateDelivered], [Status]) VALUES (11, 11, CAST(N'2015-08-14 11:41:33.200' AS DateTime), NULL, N'Pending')
INSERT [dbo].[Deliveries] ([DeliveryNo], [OrderNo], [Deadline], [DateDelivered], [Status]) VALUES (12, 12, CAST(N'2015-08-14 11:57:01.457' AS DateTime), NULL, N'Pending')
INSERT [dbo].[Deliveries] ([DeliveryNo], [OrderNo], [Deadline], [DateDelivered], [Status]) VALUES (13, 13, CAST(N'2015-08-14 13:59:33.237' AS DateTime), CAST(N'2015-08-12 11:28:32.193' AS DateTime), N'Delivered')
INSERT [dbo].[Deliveries] ([DeliveryNo], [OrderNo], [Deadline], [DateDelivered], [Status]) VALUES (14, 14, CAST(N'2015-08-14 13:59:44.653' AS DateTime), CAST(N'2015-08-07 17:49:01.097' AS DateTime), N'Delivered')
INSERT [dbo].[Deliveries] ([DeliveryNo], [OrderNo], [Deadline], [DateDelivered], [Status]) VALUES (15, 15, CAST(N'2015-08-14 16:52:01.153' AS DateTime), CAST(N'2015-08-07 17:48:57.097' AS DateTime), N'Delivered')
INSERT [dbo].[Deliveries] ([DeliveryNo], [OrderNo], [Deadline], [DateDelivered], [Status]) VALUES (16, 16, CAST(N'2015-08-14 17:35:48.400' AS DateTime), CAST(N'2015-08-07 17:48:48.680' AS DateTime), N'Delivered')
INSERT [dbo].[Deliveries] ([DeliveryNo], [OrderNo], [Deadline], [DateDelivered], [Status]) VALUES (17, 17, CAST(N'2015-08-14 17:40:16.010' AS DateTime), CAST(N'2015-08-07 17:48:24.713' AS DateTime), N'Delivered')
SET IDENTITY_INSERT [dbo].[Deliveries] OFF
SET IDENTITY_INSERT [dbo].[OrderDetails] ON 

INSERT [dbo].[OrderDetails] ([RefNo], [OrderNo], [UserID], [ProductID], [Quantity], [Amount], [Status]) VALUES (1, 1, 1, 3, 2, CAST(96.52 AS Decimal(18, 2)), N'Prossesing')
INSERT [dbo].[OrderDetails] ([RefNo], [OrderNo], [UserID], [ProductID], [Quantity], [Amount], [Status]) VALUES (2, 1, 1, 5, 1, CAST(149.68 AS Decimal(18, 2)), N'Prossesing')
INSERT [dbo].[OrderDetails] ([RefNo], [OrderNo], [UserID], [ProductID], [Quantity], [Amount], [Status]) VALUES (3, 1, 1, 6, 1, CAST(107.72 AS Decimal(18, 2)), N'Prossesing')
INSERT [dbo].[OrderDetails] ([RefNo], [OrderNo], [UserID], [ProductID], [Quantity], [Amount], [Status]) VALUES (4, 2, 1, 3, 1, CAST(48.26 AS Decimal(18, 2)), N'Prossesing')
INSERT [dbo].[OrderDetails] ([RefNo], [OrderNo], [UserID], [ProductID], [Quantity], [Amount], [Status]) VALUES (5, 2, 1, 5, 2, CAST(299.36 AS Decimal(18, 2)), N'Prossesing')
INSERT [dbo].[OrderDetails] ([RefNo], [OrderNo], [UserID], [ProductID], [Quantity], [Amount], [Status]) VALUES (6, 2, 1, 6, 1, CAST(107.72 AS Decimal(18, 2)), N'Prossesing')
INSERT [dbo].[OrderDetails] ([RefNo], [OrderNo], [UserID], [ProductID], [Quantity], [Amount], [Status]) VALUES (7, 2, 1, 8, 1, CAST(309.95 AS Decimal(18, 2)), N'Prossesing')
INSERT [dbo].[OrderDetails] ([RefNo], [OrderNo], [UserID], [ProductID], [Quantity], [Amount], [Status]) VALUES (8, 3, 1, 1, 1, CAST(825.00 AS Decimal(18, 2)), N'Prossesing')
INSERT [dbo].[OrderDetails] ([RefNo], [OrderNo], [UserID], [ProductID], [Quantity], [Amount], [Status]) VALUES (9, 3, 1, 2, 1, CAST(199.99 AS Decimal(18, 2)), N'Prossesing')
INSERT [dbo].[OrderDetails] ([RefNo], [OrderNo], [UserID], [ProductID], [Quantity], [Amount], [Status]) VALUES (10, 3, 1, 3, 1, CAST(48.26 AS Decimal(18, 2)), N'Prossesing')
INSERT [dbo].[OrderDetails] ([RefNo], [OrderNo], [UserID], [ProductID], [Quantity], [Amount], [Status]) VALUES (11, 4, 1, 2, 1, CAST(199.99 AS Decimal(18, 2)), N'Processing')
INSERT [dbo].[OrderDetails] ([RefNo], [OrderNo], [UserID], [ProductID], [Quantity], [Amount], [Status]) VALUES (12, 4, 1, 3, 1, CAST(48.26 AS Decimal(18, 2)), N'Processing')
INSERT [dbo].[OrderDetails] ([RefNo], [OrderNo], [UserID], [ProductID], [Quantity], [Amount], [Status]) VALUES (13, 4, 1, 1, 1, CAST(825.00 AS Decimal(18, 2)), N'Processing')
INSERT [dbo].[OrderDetails] ([RefNo], [OrderNo], [UserID], [ProductID], [Quantity], [Amount], [Status]) VALUES (14, 5, 1, 3, 1, CAST(48.26 AS Decimal(18, 2)), N'Processing')
INSERT [dbo].[OrderDetails] ([RefNo], [OrderNo], [UserID], [ProductID], [Quantity], [Amount], [Status]) VALUES (15, 5, 1, 2, 1, CAST(199.99 AS Decimal(18, 2)), N'Processing')
INSERT [dbo].[OrderDetails] ([RefNo], [OrderNo], [UserID], [ProductID], [Quantity], [Amount], [Status]) VALUES (16, 6, 1, 2, 3, CAST(599.97 AS Decimal(18, 2)), N'Processing')
INSERT [dbo].[OrderDetails] ([RefNo], [OrderNo], [UserID], [ProductID], [Quantity], [Amount], [Status]) VALUES (17, 6, 1, 3, 1, CAST(48.26 AS Decimal(18, 2)), N'Processing')
INSERT [dbo].[OrderDetails] ([RefNo], [OrderNo], [UserID], [ProductID], [Quantity], [Amount], [Status]) VALUES (18, 7, 1, 1, 1, CAST(825.00 AS Decimal(18, 2)), N'Prossesing')
INSERT [dbo].[OrderDetails] ([RefNo], [OrderNo], [UserID], [ProductID], [Quantity], [Amount], [Status]) VALUES (19, 7, 1, 2, 1, CAST(199.99 AS Decimal(18, 2)), N'Prossesing')
INSERT [dbo].[OrderDetails] ([RefNo], [OrderNo], [UserID], [ProductID], [Quantity], [Amount], [Status]) VALUES (20, 7, 1, 3, 1, CAST(48.26 AS Decimal(18, 2)), N'Prossesing')
INSERT [dbo].[OrderDetails] ([RefNo], [OrderNo], [UserID], [ProductID], [Quantity], [Amount], [Status]) VALUES (21, 7, 1, 5, 1, CAST(149.68 AS Decimal(18, 2)), N'Prossesing')
INSERT [dbo].[OrderDetails] ([RefNo], [OrderNo], [UserID], [ProductID], [Quantity], [Amount], [Status]) VALUES (22, 8, 1, 2, 1, CAST(199.99 AS Decimal(18, 2)), N'Processing')
INSERT [dbo].[OrderDetails] ([RefNo], [OrderNo], [UserID], [ProductID], [Quantity], [Amount], [Status]) VALUES (23, 8, 1, 3, 1, CAST(48.26 AS Decimal(18, 2)), N'Processing')
INSERT [dbo].[OrderDetails] ([RefNo], [OrderNo], [UserID], [ProductID], [Quantity], [Amount], [Status]) VALUES (24, 8, 1, 10, 1, CAST(1000.00 AS Decimal(18, 2)), N'Processing')
INSERT [dbo].[OrderDetails] ([RefNo], [OrderNo], [UserID], [ProductID], [Quantity], [Amount], [Status]) VALUES (25, 9, 1, 1, 1, CAST(825.00 AS Decimal(18, 2)), N'Prossesing')
INSERT [dbo].[OrderDetails] ([RefNo], [OrderNo], [UserID], [ProductID], [Quantity], [Amount], [Status]) VALUES (26, 9, 1, 2, 2, CAST(399.98 AS Decimal(18, 2)), N'Prossesing')
INSERT [dbo].[OrderDetails] ([RefNo], [OrderNo], [UserID], [ProductID], [Quantity], [Amount], [Status]) VALUES (27, 9, 1, 4, 1, CAST(1120.00 AS Decimal(18, 2)), N'Prossesing')
INSERT [dbo].[OrderDetails] ([RefNo], [OrderNo], [UserID], [ProductID], [Quantity], [Amount], [Status]) VALUES (28, 10, 1, 1, 1, CAST(825.00 AS Decimal(18, 2)), N'Processing')
INSERT [dbo].[OrderDetails] ([RefNo], [OrderNo], [UserID], [ProductID], [Quantity], [Amount], [Status]) VALUES (29, 10, 1, 2, 1, CAST(199.99 AS Decimal(18, 2)), N'Processing')
INSERT [dbo].[OrderDetails] ([RefNo], [OrderNo], [UserID], [ProductID], [Quantity], [Amount], [Status]) VALUES (30, 10, 1, 3, 1, CAST(48.26 AS Decimal(18, 2)), N'Processing')
INSERT [dbo].[OrderDetails] ([RefNo], [OrderNo], [UserID], [ProductID], [Quantity], [Amount], [Status]) VALUES (31, 11, 1, 1, 1, CAST(825.00 AS Decimal(18, 2)), N'Processing')
INSERT [dbo].[OrderDetails] ([RefNo], [OrderNo], [UserID], [ProductID], [Quantity], [Amount], [Status]) VALUES (32, 12, 1, 1, 1, CAST(825.00 AS Decimal(18, 2)), N'Prossesing')
INSERT [dbo].[OrderDetails] ([RefNo], [OrderNo], [UserID], [ProductID], [Quantity], [Amount], [Status]) VALUES (33, 13, 1, 3, 1, CAST(48.26 AS Decimal(18, 2)), N'Prossesing')
INSERT [dbo].[OrderDetails] ([RefNo], [OrderNo], [UserID], [ProductID], [Quantity], [Amount], [Status]) VALUES (34, 13, 1, 2, 1, CAST(199.99 AS Decimal(18, 2)), N'Prossesing')
INSERT [dbo].[OrderDetails] ([RefNo], [OrderNo], [UserID], [ProductID], [Quantity], [Amount], [Status]) VALUES (35, 13, 1, 1, 1, CAST(825.00 AS Decimal(18, 2)), N'Prossesing')
INSERT [dbo].[OrderDetails] ([RefNo], [OrderNo], [UserID], [ProductID], [Quantity], [Amount], [Status]) VALUES (36, 15, 1, 1, 2, CAST(1650.00 AS Decimal(18, 2)), N'Prossesing')
INSERT [dbo].[OrderDetails] ([RefNo], [OrderNo], [UserID], [ProductID], [Quantity], [Amount], [Status]) VALUES (37, 15, 1, 2, 1, CAST(199.99 AS Decimal(18, 2)), N'Prossesing')
INSERT [dbo].[OrderDetails] ([RefNo], [OrderNo], [UserID], [ProductID], [Quantity], [Amount], [Status]) VALUES (38, 15, 1, 4, 1, CAST(1120.00 AS Decimal(18, 2)), N'Prossesing')
INSERT [dbo].[OrderDetails] ([RefNo], [OrderNo], [UserID], [ProductID], [Quantity], [Amount], [Status]) VALUES (39, 15, 1, 3, 1, CAST(48.26 AS Decimal(18, 2)), N'Prossesing')
INSERT [dbo].[OrderDetails] ([RefNo], [OrderNo], [UserID], [ProductID], [Quantity], [Amount], [Status]) VALUES (40, 16, 1, 1, 1, CAST(825.00 AS Decimal(18, 2)), N'Prossesing')
INSERT [dbo].[OrderDetails] ([RefNo], [OrderNo], [UserID], [ProductID], [Quantity], [Amount], [Status]) VALUES (41, 16, 1, 2, 1, CAST(199.99 AS Decimal(18, 2)), N'Prossesing')
INSERT [dbo].[OrderDetails] ([RefNo], [OrderNo], [UserID], [ProductID], [Quantity], [Amount], [Status]) VALUES (42, 16, 1, 3, 1, CAST(48.26 AS Decimal(18, 2)), N'Prossesing')
INSERT [dbo].[OrderDetails] ([RefNo], [OrderNo], [UserID], [ProductID], [Quantity], [Amount], [Status]) VALUES (43, 16, 1, 4, 1, CAST(1120.00 AS Decimal(18, 2)), N'Prossesing')
INSERT [dbo].[OrderDetails] ([RefNo], [OrderNo], [UserID], [ProductID], [Quantity], [Amount], [Status]) VALUES (44, 17, 1, 1, 1, CAST(825.00 AS Decimal(18, 2)), N'Prossesing')
INSERT [dbo].[OrderDetails] ([RefNo], [OrderNo], [UserID], [ProductID], [Quantity], [Amount], [Status]) VALUES (45, 17, 1, 2, 1, CAST(199.99 AS Decimal(18, 2)), N'Prossesing')
INSERT [dbo].[OrderDetails] ([RefNo], [OrderNo], [UserID], [ProductID], [Quantity], [Amount], [Status]) VALUES (46, 17, 1, 3, 1, CAST(48.26 AS Decimal(18, 2)), N'Prossesing')
INSERT [dbo].[OrderDetails] ([RefNo], [OrderNo], [UserID], [ProductID], [Quantity], [Amount], [Status]) VALUES (47, 17, 1, 4, 1, CAST(1120.00 AS Decimal(18, 2)), N'Prossesing')
INSERT [dbo].[OrderDetails] ([RefNo], [OrderNo], [UserID], [ProductID], [Quantity], [Amount], [Status]) VALUES (48, 0, 1, 1, 1, CAST(825.00 AS Decimal(18, 2)), N'InCart')
INSERT [dbo].[OrderDetails] ([RefNo], [OrderNo], [UserID], [ProductID], [Quantity], [Amount], [Status]) VALUES (49, 0, 1014, 55, 5, CAST(5372.50 AS Decimal(18, 2)), N'InCart')
SET IDENTITY_INSERT [dbo].[OrderDetails] OFF
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([OrderNo], [DateOrdered], [PaymentMethod], [Status]) VALUES (1, CAST(N'2015-08-06 16:41:05.130' AS DateTime), N'Cash Deposit', N'Approve')
INSERT [dbo].[Orders] ([OrderNo], [DateOrdered], [PaymentMethod], [Status]) VALUES (2, CAST(N'2015-08-06 16:42:16.160' AS DateTime), N'Cash Deposit', N'Reject')
INSERT [dbo].[Orders] ([OrderNo], [DateOrdered], [PaymentMethod], [Status]) VALUES (3, CAST(N'2015-08-06 16:43:12.773' AS DateTime), N'Cash Deposit', N'Approve')
INSERT [dbo].[Orders] ([OrderNo], [DateOrdered], [PaymentMethod], [Status]) VALUES (4, CAST(N'2015-08-06 17:13:23.103' AS DateTime), N'Cash Deposit', N'Approve')
INSERT [dbo].[Orders] ([OrderNo], [DateOrdered], [PaymentMethod], [Status]) VALUES (5, CAST(N'2015-08-06 17:27:49.063' AS DateTime), N'Cash Deposit', N'Approve')
INSERT [dbo].[Orders] ([OrderNo], [DateOrdered], [PaymentMethod], [Status]) VALUES (6, CAST(N'2015-08-06 17:30:21.043' AS DateTime), N'Cash Deposit', N'Pending')
INSERT [dbo].[Orders] ([OrderNo], [DateOrdered], [PaymentMethod], [Status]) VALUES (7, CAST(N'2015-08-06 17:34:26.813' AS DateTime), N'Cash Deposit', N'Pending')
INSERT [dbo].[Orders] ([OrderNo], [DateOrdered], [PaymentMethod], [Status]) VALUES (8, CAST(N'2015-08-06 17:47:55.287' AS DateTime), N'Cash Deposit', N'Pending')
INSERT [dbo].[Orders] ([OrderNo], [DateOrdered], [PaymentMethod], [Status]) VALUES (9, CAST(N'2015-08-06 17:54:01.013' AS DateTime), N'Cash Deposit', N'Pending')
INSERT [dbo].[Orders] ([OrderNo], [DateOrdered], [PaymentMethod], [Status]) VALUES (10, CAST(N'2015-08-06 19:22:09.650' AS DateTime), N'Cash Deposit', N'Pending')
INSERT [dbo].[Orders] ([OrderNo], [DateOrdered], [PaymentMethod], [Status]) VALUES (11, CAST(N'2015-08-07 11:41:33.163' AS DateTime), N'Cash Deposit', N'Pending')
INSERT [dbo].[Orders] ([OrderNo], [DateOrdered], [PaymentMethod], [Status]) VALUES (12, CAST(N'2015-08-07 11:57:01.453' AS DateTime), N'Cash on Delivery', N'Pending')
INSERT [dbo].[Orders] ([OrderNo], [DateOrdered], [PaymentMethod], [Status]) VALUES (13, CAST(N'2015-08-07 13:59:33.160' AS DateTime), N'Cash Deposit', N'Approve')
INSERT [dbo].[Orders] ([OrderNo], [DateOrdered], [PaymentMethod], [Status]) VALUES (14, CAST(N'2015-08-07 13:59:44.653' AS DateTime), N'Cash Deposit', N'Approve')
INSERT [dbo].[Orders] ([OrderNo], [DateOrdered], [PaymentMethod], [Status]) VALUES (15, CAST(N'2015-08-07 16:52:01.147' AS DateTime), N'Cash Deposit', N'Approve')
INSERT [dbo].[Orders] ([OrderNo], [DateOrdered], [PaymentMethod], [Status]) VALUES (16, CAST(N'2015-08-07 17:35:48.250' AS DateTime), N'Check Deposit', N'Approve')
INSERT [dbo].[Orders] ([OrderNo], [DateOrdered], [PaymentMethod], [Status]) VALUES (17, CAST(N'2015-08-07 17:40:15.903' AS DateTime), N'Cash Deposit', N'Approve')
SET IDENTITY_INSERT [dbo].[Orders] OFF
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([ProductID], [Name], [CatID], [Code], [Description], [Image], [Price], [IsFeatured], [Available], [Criticallevel], [Maximum], [Status], [DateAdded], [DateModified]) VALUES (1, N'Sebastian Klotz Baroque Violin Dominique Music', 5, N'B005E935BI', N'100% Handmade, 100% hand oil varnished
Selected Seasoned Spruce Top, naturally air dried (over 20 years)
Selected Seasoned Flamed Maple Back, Ribs & Scroll, naturally air dried (over 20 years)
Maple Fingerboard
Hard-carved pegs, tailpiece and chinrest', N'52fae8ca-8a77-4fbf-8eda-3b64cc8361cf.jpg', CAST(825.00 AS Decimal(18, 2)), N'Yes', 56, 10, 100, N'Active', CAST(N'2015-07-14 21:07:38.920' AS DateTime), NULL)
INSERT [dbo].[Products] ([ProductID], [Name], [CatID], [Code], [Description], [Image], [Price], [IsFeatured], [Available], [Criticallevel], [Maximum], [Status], [DateAdded], [DateModified]) VALUES (2, N'Stentor 1500 4/4 Violin', 5, N'B002021HIK', N'Hand crafted with fine-grained solid spruce top
Solid maple back
Full ebony fittings', N'b904b120-22f5-44f2-bc5d-ba1be9bfb25a.jpg', CAST(199.99 AS Decimal(18, 2)), N'Yes', 43, 10, 150, N'Active', CAST(N'2015-07-14 21:08:59.927' AS DateTime), NULL)
INSERT [dbo].[Products] ([ProductID], [Name], [CatID], [Code], [Description], [Image], [Price], [IsFeatured], [Available], [Criticallevel], [Maximum], [Status], [DateAdded], [DateModified]) VALUES (3, N'ADM Handcrafted Solid Wood Student Violin 4/4', 5, N'B008MZQW20', N'Hand carved solid spruce top; rosewood fingerboard, pegs and chin rest alloy tailpiece with 4 integrated fine tuners;
Handcrafted maple wooden neck, solid back and sides to strengthen the stability of these parts and offers excellent acoustical properties and good response
Includes: shaped foam carrying case with a durable luggage-grade nylon exterior and padded plush interior, Brazil wood stick violin bow with ebont frog and unbleached white horse hair, rosin, two bridges, an extra set of strings(wound together or wrapped separately) and shoulder strap
1 year warranty against manufacturer''s defects
Perfect for the beginner or student violinist', N'e36f15cf-6292-4603-90f6-7407a6696a39.jpg', CAST(48.26 AS Decimal(18, 2)), N'Yes', 34, 30, 120, N'Active', CAST(N'2015-07-14 21:10:58.263' AS DateTime), CAST(N'2015-07-14 21:49:13.010' AS DateTime))
INSERT [dbo].[Products] ([ProductID], [Name], [CatID], [Code], [Description], [Image], [Price], [IsFeatured], [Available], [Criticallevel], [Maximum], [Status], [DateAdded], [DateModified]) VALUES (4, N'Yamaha SV-150 Silent Practice Violin', 5, N'B0041D0PXY', N'Music Player: SD-Card Function - mp3, m4a, MIDI & WAV files
25 Digital Effects with adjustible parameters
Digital Metronome & Tuner
Standard 1/8" connections to headphones or speakers
Includes Control box, Headphones and SD card.', N'71efa634-a076-40e9-9016-c28801793e80.jpg', CAST(1120.00 AS Decimal(18, 2)), N'Yes', 23, 15, 1000, N'Active', CAST(N'2015-07-14 22:12:03.457' AS DateTime), CAST(N'2015-07-14 22:25:54.660' AS DateTime))
INSERT [dbo].[Products] ([ProductID], [Name], [CatID], [Code], [Description], [Image], [Price], [IsFeatured], [Available], [Criticallevel], [Maximum], [Status], [DateAdded], [DateModified]) VALUES (5, N'Cecilio CVN-300 with D''Addario Prelude Strings', 5, N'B00EOYKGH0', N'Size 4/4 (full size) violin with solid spruce wood top, maple back, neck and sides with inlaid purfling in antique varnish
Ebony fingerboard, pegs chinrest, and tailpiece with 4 detachable nickel plated fine tuners
Strung with D''Addario Prelude Strings
Includes: Cecilio chromatic tuner, lesson book, lightweight hard case, 2 x Brazilwood bows with unbleached genuine Mongolian horsehair, quality rosin cake, adjustable shoulder rest, and an extra bridge
1 Year Warranty against Manufacturer''s Defects', N'54de74ec-42e3-40f5-80f4-131b0781b78b.jpg', CAST(149.68 AS Decimal(18, 2)), N'Yes', 23, 37, 214, N'Active', CAST(N'2015-07-14 22:16:10.380' AS DateTime), NULL)
INSERT [dbo].[Products] ([ProductID], [Name], [CatID], [Code], [Description], [Image], [Price], [IsFeatured], [Available], [Criticallevel], [Maximum], [Status], [DateAdded], [DateModified]) VALUES (6, N'Cremona SV-75 Premier Novice Violin Outfit ', 5, N'B0026IC6WY', N'Every Cremona student violin comes with US-made Prelude strings, the educator''s preferred strings for students
Properly fitted hardwood pegs and quality lightweight composite tailpiece with 4 smooth fine tuners for easy tuning
Low profile Kaufman-style chinrest, oiled neck for better feel and well balanced bow for ease of playing
Correct string height and string spacing for accurate finger positioning and intonation
Hardwood fittings, hand carved solid spruce and solid maple body, lightweight construction means quality workmanship
', N'1b671eab-9122-4d61-a016-8b5b9720bc27.jpg', CAST(107.72 AS Decimal(18, 2)), N'Yes', 23, 30, 355, N'Active', CAST(N'2015-07-14 22:17:26.330' AS DateTime), NULL)
INSERT [dbo].[Products] ([ProductID], [Name], [CatID], [Code], [Description], [Image], [Price], [IsFeatured], [Available], [Criticallevel], [Maximum], [Status], [DateAdded], [DateModified]) VALUES (7, N'Scott Cao Violin Outfit 3/4 Size Model STV017', 5, N'B00IX401EA', N'Ebony fingerboard
Ebony chinrest
Ebony pegs
Fully-carved', N'9457abc8-0828-40f5-9d1a-dcdfea38a013.jpg', CAST(549.00 AS Decimal(18, 2)), N'Yes', 23, 15, 200, N'Active', CAST(N'2015-07-14 22:18:13.780' AS DateTime), NULL)
INSERT [dbo].[Products] ([ProductID], [Name], [CatID], [Code], [Description], [Image], [Price], [IsFeatured], [Available], [Criticallevel], [Maximum], [Status], [DateAdded], [DateModified]) VALUES (8, N'Knilling School Model 4/4', 5, N'B002MZYH0A', N'Even grain spruce top; solid maple back
Solid carved throughout and graduated; inlaid purfling
Ebony fingerboard and saddle; Perfection planetary micro-geared pegs AND synthetic tailpiece with built-in tuners; Guarneri-style chinrest; shop adjusted in USA; quality maple bridge; D''Addario Prelude steelcore strings
Shaped case with cover; fully lined interior with matching blanket; two bow holders; accessory compartment
Half-lined brazilwood bow with ebony frog; genuine white horsehair', N'e014b8c9-5a97-4a6f-b573-a15d6dbf9be4.jpg', CAST(309.95 AS Decimal(18, 2)), N'Yes', 2, 28, 378, N'Active', CAST(N'2015-07-14 22:19:14.600' AS DateTime), CAST(N'2015-07-14 22:58:54.037' AS DateTime))
INSERT [dbo].[Products] ([ProductID], [Name], [CatID], [Code], [Description], [Image], [Price], [IsFeatured], [Available], [Criticallevel], [Maximum], [Status], [DateAdded], [DateModified]) VALUES (9, N'Strunal 260 Student Violin Outfit ', 5, N'B0002I6LWQ', N'Solid Spruce top, solid Maple back and sides
Ebony trimmings and inlaid purflings
Highly polished, chestnut-brown color
Four string adjusters and plastic chinrest
Thermoplastic molded case, Glasser fiberglass horsehair bow and rosin', N'a882a694-a427-4b64-b3bd-a9af16eafd92.jpg', CAST(140.00 AS Decimal(18, 2)), N'Yes', 23, 19, 375, N'Active', CAST(N'2015-07-14 22:21:14.900' AS DateTime), CAST(N'2015-07-14 22:25:30.117' AS DateTime))
INSERT [dbo].[Products] ([ProductID], [Name], [CatID], [Code], [Description], [Image], [Price], [IsFeatured], [Available], [Criticallevel], [Maximum], [Status], [DateAdded], [DateModified]) VALUES (10, N'Franz Werner Concert Violin', 5, N'B003FL71LC', N'Setting a precedence for the German tradition, the Concert instruments combine excellent craftsmanship with a warm, well-balanced tone. 
Carved from quality tone-woods. 
Spruce top of medium grain. 
Two piece back of light, narrow to broad flame.', N'ad68cca7-2069-44cc-93d2-ccd8895a729b.jpg', CAST(1000.00 AS Decimal(18, 2)), N'Yes', 3, 15, 854, N'Active', CAST(N'2015-07-14 22:29:27.157' AS DateTime), CAST(N'2015-07-14 23:10:54.537' AS DateTime))
INSERT [dbo].[Products] ([ProductID], [Name], [CatID], [Code], [Description], [Image], [Price], [IsFeatured], [Available], [Criticallevel], [Maximum], [Status], [DateAdded], [DateModified]) VALUES (11, N'Kinglos Size Solid Wood Carving', 5, N'B005M05COC', N'With the latest painting technology based on positioning and docking the branch of color and wood, up to 50 procedures of coloring, Kinglos Visual Art Violins highly guarantee violin''s resonance and tone intact, to endow the violin with stylish and personalized visual effect.
Materials: solid spruce top, solid maple back & side, ebony fittings; jujube tailpiece with 4 fine tuners, aluminum-magnesium alloy string
Outfit Includes: case, bow, rosin
Series: Carving
We are China sellers, so you might be charged for the import taxes during the customs clearance!!!', N'2b557e69-100e-4ed4-943c-2b5bf8afeb49.jpg', CAST(119.99 AS Decimal(18, 2)), N'Yes', 12, 21, 654, N'Active', CAST(N'2015-07-14 22:31:13.073' AS DateTime), CAST(N'2015-07-14 23:09:51.307' AS DateTime))
INSERT [dbo].[Products] ([ProductID], [Name], [CatID], [Code], [Description], [Image], [Price], [IsFeatured], [Available], [Criticallevel], [Maximum], [Status], [DateAdded], [DateModified]) VALUES (12, N'Toy Violin -- Electronic Toy Violin for Kids', 5, N'B005UPZ4WY', N'16" tall Realistic Toy Violin
Plays 25 Melodies
2 AA Batteries Included
Easy to use.
Ages 3 and up', N'0fdf67bb-9047-445a-8b72-a6d2c789905d.jpg', CAST(11.98 AS Decimal(18, 2)), N'Yes', 43, 21, 652, N'Active', CAST(N'2015-07-14 22:32:21.047' AS DateTime), NULL)
INSERT [dbo].[Products] ([ProductID], [Name], [CatID], [Code], [Description], [Image], [Price], [IsFeatured], [Available], [Criticallevel], [Maximum], [Status], [DateAdded], [DateModified]) VALUES (13, N'Hans Kroger Caprice Violin ', 5, N'B003FL6YKQ', N'The Caprice is an excellent mid-priced instrument that features a warm, well-balanced tone with excellent playability.
Hand-carved from naturally seasoned European tone-woods. 
Spruce top of medium to wide grain. Inlaid purfling. 
Two piece maple', N'2c87f34b-79c0-4baa-a46d-c59e451370b7.jpg', CAST(549.00 AS Decimal(18, 2)), N'Yes', 3, 12, 432, N'Active', CAST(N'2015-07-14 22:34:05.873' AS DateTime), CAST(N'2015-07-14 23:00:22.900' AS DateTime))
INSERT [dbo].[Products] ([ProductID], [Name], [CatID], [Code], [Description], [Image], [Price], [IsFeatured], [Available], [Criticallevel], [Maximum], [Status], [DateAdded], [DateModified]) VALUES (14, N'Knilling School Model 1/4 Violin Outfit', 5, N'B002MZYGZG', N'Even grain spruce top; solid maple back
Solid carved throughout and graduated; inlaid purfling
Ebony pegs, nut, fingboard and saddle; Guarneri-style chinrest; shop adjusted in USA; quality maple bridge; synthetic tailpiece with built-in tuners; D''Addario Prelude steelcore strings
Shaped case with cover; fully lined interior with matching blanket; two bow holders; accessory compartment
Half-lined brazilwood bow with ebony frog; genuine white horsehair', N'ce77f16a-928b-40e0-bff5-3a62d6d9d7fc.jpg', CAST(240.32 AS Decimal(18, 2)), N'Yes', 34, 15, 543, N'Active', CAST(N'2015-07-14 22:36:00.357' AS DateTime), CAST(N'2015-07-14 22:47:08.803' AS DateTime))
INSERT [dbo].[Products] ([ProductID], [Name], [CatID], [Code], [Description], [Image], [Price], [IsFeatured], [Available], [Criticallevel], [Maximum], [Status], [DateAdded], [DateModified]) VALUES (24, N'Akai Professional MPD18 Compact Pad Controller', 3, N'B002LNBG1Q', N'16 velocity and pressure sensitive pads
Note Repeat enables you to quickly input patterns such as hi-hat parts or drum rolls', N'10ee7961-70b3-4395-b2a7-2867462bd94c.jpg', CAST(69.99 AS Decimal(18, 2)), N'Yes', 3, 25, 664, N'Active', CAST(N'2015-07-15 07:00:03.817' AS DateTime), NULL)
INSERT [dbo].[Products] ([ProductID], [Name], [CatID], [Code], [Description], [Image], [Price], [IsFeatured], [Available], [Criticallevel], [Maximum], [Status], [DateAdded], [DateModified]) VALUES (40, N'CX Series', 4, N'C5X', N'The voice of a piano has a limitless facility for expression, shifting with the melody and overlaying notes into a wonderful harmony. 
CX Series pianos are high-grade grand pianos, possessing both power and subtlety.', N'70c08996-2708-486f-897f-863496e86ddd.jpg', CAST(61639.00 AS Decimal(18, 2)), N'Yes', 34, 30, 900, N'Active', CAST(N'2015-07-15 08:15:44.443' AS DateTime), NULL)
INSERT [dbo].[Products] ([ProductID], [Name], [CatID], [Code], [Description], [Image], [Price], [IsFeatured], [Available], [Criticallevel], [Maximum], [Status], [DateAdded], [DateModified]) VALUES (44, N'TransAcoustic™', 4, N'GC1TA', N'A New Breed of Piano. An acoustic piano with volume control, or a digital piano with strings? Yamaha''s latest development stretches the imagination and opens up a whole new world of possibilities.', N'c14d6051-54ff-4732-8026-3a7e14cc1654.jpg', CAST(31579.00 AS Decimal(18, 2)), N'Yes', 3, 34, 762, N'Active', CAST(N'2015-07-15 08:33:51.890' AS DateTime), NULL)
INSERT [dbo].[Products] ([ProductID], [Name], [CatID], [Code], [Description], [Image], [Price], [IsFeatured], [Available], [Criticallevel], [Maximum], [Status], [DateAdded], [DateModified]) VALUES (41, N'Cable Nelson Grand Piano', 4, N'CN151PE', N'The Cable-Nelson brand traces its roots to 1903 in Chicago, when Fayette S. Cable purchased two small piano companies. 
These companies, Lakeside Piano Company and Sweetland Piano Company, then became the Fayette S. Cable Piano Company. 
The Cable-Nelson brand resulted from a merger with the Nelson Piano Company in 1905. 
The Everett Piano Company bought Cable-Nelson in the late 1920s, moving its manufacturing operation to South Haven, Michigan. 
In 1954, the Hammond Organ company acquired both Everett Piano and Cable-Nelson. Yamaha purchased both Everett and Cable-Nelson in 1973. 
Now, 105 years after its beginnings, Cable-Nelson resumes its tradition as a great piano at a modest price. 
Now, virtually anyone can own a quality instrument designed and built by Yamaha. 
These Cable-Nelson pianos are perfectly suited for home piano players who desire Yamaha quality at a more affordable price. 
They live up to the company''s worldwide reputation for outstanding service, exceptional value and reliable customer support. 
This expressive instrument is designed by Yamaha master craftsmen, prepared by Yamaha engineers and built by Yamaha specialists—using world-renowned manufacturing processes. The piano includes top quality parts, premium woods, extruded aluminum alloy action rails, V-Pro plates and copper wound bass strings – all features found in Yamaha brand pianos. 
The Cable-Nelson line also offers an extensive 10-year warranty and the support of Yamaha Piano Service.', N'1dfcfa9f-623c-48d9-8883-f0cf89e71081.jpg', CAST(9399.00 AS Decimal(18, 2)), N'Yes', 0, 10, 432, N'Active', CAST(N'2015-07-15 08:19:26.597' AS DateTime), CAST(N'2015-07-15 08:30:16.043' AS DateTime))
INSERT [dbo].[Products] ([ProductID], [Name], [CatID], [Code], [Description], [Image], [Price], [IsFeatured], [Available], [Criticallevel], [Maximum], [Status], [DateAdded], [DateModified]) VALUES (15, N'Mendini 4/4 MV400 Ebony Fitted Solid Wood Violin', 5, N'B0020288RI', N'4/4 (Full Size) violin with solid wood spruce top, maple back, neck and sides with beautiful varnish finish & inlaid purfling
Ebony fingerboard, pegs chin rest, and tailpiece with 4 detachable fine tuners
2 x Brazil wood bows with unbleached genuine Mongolian horsehair
Includes: Lightweight hard case, adjustable shoulder rest, 2 bridges, quality rosin cake, and an extra set of violin strings.
1 Year Warranty against Manufacturer''s Defects', N'26238c9d-9055-4232-982e-4b92e17d3b6a.jpg', CAST(109.99 AS Decimal(18, 2)), N'Yes', 3, 21, 345, N'Active', CAST(N'2015-07-14 22:36:44.813' AS DateTime), NULL)
INSERT [dbo].[Products] ([ProductID], [Name], [CatID], [Code], [Description], [Image], [Price], [IsFeatured], [Available], [Criticallevel], [Maximum], [Status], [DateAdded], [DateModified]) VALUES (17, N'Novation Launchpad S 64-Button Ableton Controller', 3, N'B00CDINK72', N'This new 64-button grid music controller has all the features of the original but with much brighter buttons, faster refresh and expanded app/system support
Made for Ableton Live (Lite version included) and compatible with FL Studio, BitWig, Reason and many other DAWs
Can be powered directly from your iPad or USB port
Controls your mix with volume, pans, sends, track arming, soloing and muting while jumping to different levels across eight channels at once
Trigger loops and effects using the Launchpad app on iPad', N'34a7c969-129c-4bb4-98e6-4bb632edab65.jpg', CAST(99.00 AS Decimal(18, 2)), N'Yes', 24, 19, 345, N'Active', CAST(N'2015-07-14 22:39:52.543' AS DateTime), CAST(N'2015-07-14 23:26:38.627' AS DateTime))
INSERT [dbo].[Products] ([ProductID], [Name], [CatID], [Code], [Description], [Image], [Price], [IsFeatured], [Available], [Criticallevel], [Maximum], [Status], [DateAdded], [DateModified]) VALUES (18, N'Novation Launchpad Mini USB Midi', 3, N'B00F9SWK9M', N'The 64 mini-pad music controller
New #1 Novation Launchpad app for iPad
Connects to any iPad via the camera kit (not included) and is powered from an iPad
Combine with Launch key, Launch Control or Launchpad S for even deeper integration with your software
Use 1, 2, 8, or even 16 Launchpad Minis connected to a PC or Mac for ultimate control over your favorite software', N'ba1d0490-9023-4d0c-9426-e08b95cac0e5.jpg', CAST(74.99 AS Decimal(18, 2)), N'Yes', 24, 25, 961, N'Active', CAST(N'2015-07-14 22:41:41.770' AS DateTime), NULL)
INSERT [dbo].[Products] ([ProductID], [Name], [CatID], [Code], [Description], [Image], [Price], [IsFeatured], [Available], [Criticallevel], [Maximum], [Status], [DateAdded], [DateModified]) VALUES (19, N'Novation Launchpad Pro Professional 64-Pad Grid', 3, N'B00SMKSHGY', N'Enhance your live performance with hands-on control of clips and tracks using four simple modes
Plug it straight into Logic Pro and play it like a keyboard, or connect the MIDI ports to Bass Station II and play riffs on your grid
The 8x8 grid of RGB pads light up to match the color of your clips in Ableton, so you can concentrate on triggering and combining your loops and ideas
Make dynamic beats, play like an instrument and mix without losing focus
Control any effect or instrument mid-performance to add expressive effects like reverb or filters', N'389d85fe-3c1f-44b7-bc77-2d8142e3666e.jpg', CAST(299.99 AS Decimal(18, 2)), N'Yes', 0, 13, 222, N'Active', CAST(N'2015-07-14 22:42:51.067' AS DateTime), NULL)
INSERT [dbo].[Products] ([ProductID], [Name], [CatID], [Code], [Description], [Image], [Price], [IsFeatured], [Available], [Criticallevel], [Maximum], [Status], [DateAdded], [DateModified]) VALUES (20, N'Novation Launchpad Ableton Live Controller', 3, N'B00YR47GQQ', N'Integrate immediately and seamlessly with Ableton Live, without any setup whatsoever
64 RGB pads light up to match the color of your clips in Live; see at a glance what''s loaded, playing, and recording
Bright, colorful pads make the unit stand out just from USB power - when you''re on stage or creating an exciting Launchpad light show video for YouTube
Use the grid to play drums and samples with pads pre-mapped to Ableton Lives drum rack
Start and stop loops, arm tracks, and control volumes, pans and sends', N'1c60f9c1-8b4d-4b17-9221-01ab9dfd213f.jpg', CAST(169.99 AS Decimal(18, 2)), N'Yes', 0, 23, 543, N'Active', CAST(N'2015-07-14 23:13:24.503' AS DateTime), NULL)
INSERT [dbo].[Products] ([ProductID], [Name], [CatID], [Code], [Description], [Image], [Price], [IsFeatured], [Available], [Criticallevel], [Maximum], [Status], [DateAdded], [DateModified]) VALUES (21, N'Behringer CMD TOUCH TC64 DJ Controller', 3, N'B00SWDKN2W', N'Clip launch controller for triggering audio clips and MIDI events
Intuitive 8x8 clip launch grid with navigation, mix and track control buttons
High visibility multi-color LED feedback shows status of each button
For use with Ableton Live or other music production software
Novation Launchpad compatibility mode', N'9960dcb8-cc58-4f68-802e-74cca2dd5f7e.jpg', CAST(75.26 AS Decimal(18, 2)), N'Yes', 0, 20, 400, N'Active', CAST(N'2015-07-15 06:54:58.723' AS DateTime), NULL)
INSERT [dbo].[Products] ([ProductID], [Name], [CatID], [Code], [Description], [Image], [Price], [IsFeatured], [Available], [Criticallevel], [Maximum], [Status], [DateAdded], [DateModified]) VALUES (22, N'Novation Launchpad Mini Compact USB Grid ', 3, N'B00W5F3GJ0', N'MK2 version of Novation''s compact USB grid controller designed for Ableton Live
64 multi-colored backlit pads
Software for Mac and PC, including Ableton Live Lite
Integrates with your iPad via a Camera Connection Kit or Lightning -to-USB camera adapter (sold separately)
Compact, lightweight and USB bus-powered', N'c5936b81-3ac0-4abd-aadb-f285b91d9757.jpg', CAST(97.03 AS Decimal(18, 2)), N'Yes', 0, 25, 154, N'Active', CAST(N'2015-07-15 06:57:58.777' AS DateTime), NULL)
INSERT [dbo].[Products] ([ProductID], [Name], [CatID], [Code], [Description], [Image], [Price], [IsFeatured], [Available], [Criticallevel], [Maximum], [Status], [DateAdded], [DateModified]) VALUES (23, N'Novation Launchpad S Control Pack', 3, N'B00J57IJD4', N'Includes Launchpad S, the number one live controller, and Launch Control, a robust, compact software controller with 16 assignable knobs, 8 three color launch pads and four function keys
Includes custom cases designed to keep your Launchpad S and Launch Control tidy and secure in your gig bag
Includes authorization code for free Ableton Live Lite 9 music production software and 1GB of professional sounds from Loop masters
Made for Ableton Live, compatible with FL Studio and other software, and works with all major music software on Mac and PC
Launchpad S and Launch Control are fully class-compliant plug and play devices with no drivers required', N'db69cab5-8521-45fc-acae-09b0512db213.jpg', CAST(179.99 AS Decimal(18, 2)), N'Yes', 0, 15, 254, N'Active', CAST(N'2015-07-15 06:59:19.960' AS DateTime), NULL)
INSERT [dbo].[Products] ([ProductID], [Name], [CatID], [Code], [Description], [Image], [Price], [IsFeatured], [Available], [Criticallevel], [Maximum], [Status], [DateAdded], [DateModified]) VALUES (25, N'Akai APC Mini Ableton Performance Controller', 3, N'B00J3ZCVCS', N'Ultra-portable all-in-one Ableton Live controller
Seamlessly integrates 1 to 1 with Ableton Live
8x8 clip-launch matrix with tri-color lighting displays current clip status
8 assignable faders + 1 master fader for hands-on control of Ableton Live
USB-powered and plug-in-play setup for maximum portability', N'951ffccc-c2f3-473a-aed6-4ded9c9a7a2a.jpg', CAST(99.00 AS Decimal(18, 2)), N'Yes', 0, 30, 542, N'Active', CAST(N'2015-07-15 07:00:44.327' AS DateTime), NULL)
INSERT [dbo].[Products] ([ProductID], [Name], [CatID], [Code], [Description], [Image], [Price], [IsFeatured], [Available], [Criticallevel], [Maximum], [Status], [DateAdded], [DateModified]) VALUES (26, N'Akai Pro APC40 Ableton Controller', 3, N'B001T9O60Q', N'Stage and studio-worthy MIDI pad controller with metal non-slip chassis designed in partnership with Ableton
40 premium illuminated pad triggers and 16 LED rotary encoders that provide realtime control and feedback of musical activity
Exclusive bi-directional communication between the APC40 and Ableton Live
Comes with Ableton Live Akai Professional APC Edition, compatible with all versions of Ableton Live
No mapping required, USB plug-and-play operation with Ableton on Mac or PC
Customizable controls that adapt to your workflow, perform and create without limits', N'455670d8-5b13-4796-b7c3-f5b1ee4528e0.jpg', CAST(406.00 AS Decimal(18, 2)), N'Yes', 0, 50, 853, N'Active', CAST(N'2015-07-15 07:01:23.393' AS DateTime), NULL)
INSERT [dbo].[Products] ([ProductID], [Name], [CatID], [Code], [Description], [Image], [Price], [IsFeatured], [Available], [Criticallevel], [Maximum], [Status], [DateAdded], [DateModified]) VALUES (32, N'Lighted Key/Lighted Fret', 4, N'EZ-220', N'EZ-220 is a 61 touch-sensitive keyboard with lighted keys, built-in wireless connectivity to the free Page Turner iPad app and 100 preset songs with digital score make Yamaha''s EZ-220 the perfect learn-to-play keyboard. 
A USB TO HOST port lets you connect the keyboard to your computer for use with a wide range of music programs for both education and entertainment.
A wide variety of 392 built-in Voices let you play strings, guitars, brass, synthesizers, drums and more. 
The built-in Yamaha Education Suite provides even more ways to learn how to play. 
Finally, 100 preset Styles act as virtual bands that are always ready to jam with you.', N'1bf14678-2f85-49b7-91a2-c61ee9c31098.jpg', CAST(299.00 AS Decimal(18, 2)), N'Yes', 0, 54, 234, N'Active', CAST(N'2015-07-15 07:54:44.063' AS DateTime), NULL)
INSERT [dbo].[Products] ([ProductID], [Name], [CatID], [Code], [Description], [Image], [Price], [IsFeatured], [Available], [Criticallevel], [Maximum], [Status], [DateAdded], [DateModified]) VALUES (42, N'Disklavier™ E3', 4, N'DCFXE3PRO', N'This Disklavier™ E3 model is the flagship of the CF series. 
The CFX Concert Grand Piano represents the pinnacle of Yamaha''s tradition of piano crafting. 
Beautifully made and with an exquisite tone across the entire dynamic range, the CFX has the power to project its sound to the furthest reaches of any concert hall. 
This piano also incorporates a highly accurate record-capable reproducing player system for entertainment and educational uses.', N'd08bf580-b49e-48e9-9e53-458142515370.jpg', CAST(259999.00 AS Decimal(18, 2)), N'Yes', 0, 10, 430, N'Active', CAST(N'2015-07-15 08:22:34.337' AS DateTime), CAST(N'2015-07-15 08:31:09.033' AS DateTime))
INSERT [dbo].[Products] ([ProductID], [Name], [CatID], [Code], [Description], [Image], [Price], [IsFeatured], [Available], [Criticallevel], [Maximum], [Status], [DateAdded], [DateModified]) VALUES (43, N'YUS Series', 4, N'YUS5', N'Designed for the experienced pianist and professional musician. 
Meticulously crafted from the finest materials, the YUS5 offers a refined look in an elegant upright design that delivers expressive control, superb sound and natural touch through Yamaha''s own Ivorite keyboard.', N'265ea281-08ad-4371-b38e-432243c6f887.jpg', CAST(20349.00 AS Decimal(18, 2)), N'Yes', 0, 23, 543, N'Active', CAST(N'2015-07-15 08:23:50.400' AS DateTime), CAST(N'2015-07-15 08:33:02.870' AS DateTime))
INSERT [dbo].[Products] ([ProductID], [Name], [CatID], [Code], [Description], [Image], [Price], [IsFeatured], [Available], [Criticallevel], [Maximum], [Status], [DateAdded], [DateModified]) VALUES (27, N'Native Instruments Maschine MK2 Groove Production ', 3, N'B0093UPG48', N'Easily browse, load, tweak, play, arrange, and automate all sampler, plug-in and effect parameters
Control and sequence all of your external hardware instruments, or switch to MIDI mode to control other software
Multicolored pads allow you to assign colors to the groups, sounds, patterns, and scenes, and see the pads and group buttons light up in the same colors
Pads feature increased sensitivity for much more precision
The redesigned Master section allows you to select modes with the toggle buttons and click through values without the need to look at the screen', N'1c55ee00-569c-4baa-92f8-42804d2084ce.jpg', CAST(599.00 AS Decimal(18, 2)), N'Yes', 0, 12, 612, N'Active', CAST(N'2015-07-15 07:05:22.680' AS DateTime), NULL)
INSERT [dbo].[Products] ([ProductID], [Name], [CatID], [Code], [Description], [Image], [Price], [IsFeatured], [Available], [Criticallevel], [Maximum], [Status], [DateAdded], [DateModified]) VALUES (28, N'Ableton Push Controller w/ Touch-Sensitive Encoder', 3, N'B00AZ98TVS', N'64 velocity and pressure-sensitive multi colored pads to play and sequence beats
A new way to play notes and chords. Play melody and harmony in any key.
Improvise and play with loops. Trigger and re-arrange your ideas at any tempo.
Hands-on control with 11 touch-sensitive encoders.
Includes Ableton Live 9 Intro and works with any edition of Ableton Live 9', N'f7de2ddb-c18e-4ffb-9a8e-f6e1eeae1c54.jpg', CAST(559.99 AS Decimal(18, 2)), N'Yes', 0, 20, 742, N'Active', CAST(N'2015-07-15 07:07:18.397' AS DateTime), NULL)
INSERT [dbo].[Products] ([ProductID], [Name], [CatID], [Code], [Description], [Image], [Price], [IsFeatured], [Available], [Criticallevel], [Maximum], [Status], [DateAdded], [DateModified]) VALUES (29, N'Native Instruments Traktor control DJ Controller', 3, N'B00E9H3EQC', N'Hardware for controlling the powerful Remix Decks in Traktor Pro 2.5
Switch between up to 64 tracks, loops and one-shot samples on each deck
Includes around 2 GB of premium grade sound, pre-loaded as Remix Sets
Sounds include beats, basses, leads, and more, spanning ten musical genres, including House, Techno, Dubstep, Hip Hop, Tech House and Drum''n''Bass
Import your own samples, and even capture loops and sounds live', N'b105b86b-4b6f-49b4-b8c7-dc63cd5eb292.jpg', CAST(199.00 AS Decimal(18, 2)), N'Yes', 0, 10, 758, N'Active', CAST(N'2015-07-15 07:08:08.497' AS DateTime), NULL)
INSERT [dbo].[Products] ([ProductID], [Name], [CatID], [Code], [Description], [Image], [Price], [IsFeatured], [Available], [Criticallevel], [Maximum], [Status], [DateAdded], [DateModified]) VALUES (30, N'Akai Professional LPD8 Ultra-Portable USB Pad', 3, N'B002M8EEW8', N'USB Pad Controller for laptops gives you percussive performance with digital audio workstations, sequencers, DJ software and more
8 backlit, velocity-sensitive drum pads send MIDI data such as notes and program changes
Eight Q-Link knobs for controlling virtually any parameters in software
Plug-and-play USB connection for Mac and PC; no driver installation required. Perfect for Pro Tools, Logic, Cubase, Studio One, Reaper, Digital Performer, Ableton, etc
USB-powered; no additional power cable needed
4 programmable memory banks
Includes editing software for Mac and PC; easily customize the controllers'' MIDI commands to fit your workflow', N'd8bd5da8-a9df-4961-b415-d83b362df4b8.jpg', CAST(69.00 AS Decimal(18, 2)), N'Yes', 0, 90, 600, N'Active', CAST(N'2015-07-15 07:08:56.007' AS DateTime), NULL)
INSERT [dbo].[Products] ([ProductID], [Name], [CatID], [Code], [Description], [Image], [Price], [IsFeatured], [Available], [Criticallevel], [Maximum], [Status], [DateAdded], [DateModified]) VALUES (31, N'Akai APC40 MKII Ableton Performance Controller', 3, N'B00J3YYSUW', N'Provides hands-on control of Ableton Live with visual feedback
Seamlessly integrates 1 to 1 with Ableton Live
5x8 clip-launch matrix with RGB feedback for clip status, color coding, and more
8 channel faders, 1 master fader, and 8 device controls map to Ableton directly
USB-powered and plug-and-play setup for maximum portability', N'ce36570e-fd9c-42a6-bca3-ac8946736d14.jpg', CAST(399.00 AS Decimal(18, 2)), N'Yes', 0, 33, 235, N'Active', CAST(N'2015-07-15 07:09:36.077' AS DateTime), NULL)
INSERT [dbo].[Products] ([ProductID], [Name], [CatID], [Code], [Description], [Image], [Price], [IsFeatured], [Available], [Criticallevel], [Maximum], [Status], [DateAdded], [DateModified]) VALUES (52, N'Yamaha CGX Series CGX102 Classical Electric Guitar', 2, N'', N'18 frets
nut width 52mm
scale thomann 650mm
68N pickup system with tuner
color: natural
Traditonal style with modern playability
Spruce top
Nato back and sides
Mahogany neck
Rosewood Upgraded Tuners
fingerboard and bridge
Nylon Strings', N'c476ba18-f3b7-4120-b13d-9dbd5d11f941.jpg', CAST(324.33 AS Decimal(18, 2)), N'Yes', 0, 20, 923, N'Active', CAST(N'2015-07-15 13:57:45.633' AS DateTime), NULL)
INSERT [dbo].[Products] ([ProductID], [Name], [CatID], [Code], [Description], [Image], [Price], [IsFeatured], [Available], [Criticallevel], [Maximum], [Status], [DateAdded], [DateModified]) VALUES (77, N'CRYSTAL BEAT Drumsets', 1, N'CRB 525FP/', N'The Original Seamless Acrylic Drum Set. Not just another transparent trap kit for the hipster set, Crystal Beat''s original seamless shell is back, upgraded, and fortified for today''s power player.', N'd72c3dde-2146-4028-b680-5554243abb06.jpg', CAST(2165.00 AS Decimal(18, 2)), N'Yes', 0, 27, 654, N'Active', CAST(N'2015-07-15 14:23:27.963' AS DateTime), NULL)
INSERT [dbo].[Products] ([ProductID], [Name], [CatID], [Code], [Description], [Image], [Price], [IsFeatured], [Available], [Criticallevel], [Maximum], [Status], [DateAdded], [DateModified]) VALUES (53, N'Regal RC-58 Resonator Guitar', 2, N'', N'Pellet-blasted, oil-rubbed brass body
Traditional art deco body design
Slim mahogany neck with adjustable truss rod
15:1 ratio cast sealed tuners
Spun aluminum cones
Exquisite mother-of-pearl peghead overlay
"Texas Tea" black powder-coated finish
Shop adjusted', N'f8af6c2d-2bdc-4ec2-a31c-d4d7923d0d9e.jpg', CAST(755.00 AS Decimal(18, 2)), N'Yes', 0, 12, 543, N'Active', CAST(N'2015-07-15 13:59:47.480' AS DateTime), NULL)
INSERT [dbo].[Products] ([ProductID], [Name], [CatID], [Code], [Description], [Image], [Price], [IsFeatured], [Available], [Criticallevel], [Maximum], [Status], [DateAdded], [DateModified]) VALUES (54, N' Yamaha SLG130NW Classical Style Silent Guitar', 2, N'', N'Bridge: Rosewood
Frame Unit: Maple
Strings: Nylon Guitar Strings
Sensors: B-BAND
Connectors/Controls
AUX IN
AUX IN Level Control
LINE OUT jack (monaural)
PHONES jack (stereo)
Volume
BASS control
TREBLE control
REVERB switch (OFF/1/2)
PHONES switch (ON/OFF)
LINE OUT Jack with POWER Switch (Inserting a plug into the jack switches the poweron).
Power Supply AC Adaptor/6F22 (S-006P) battery x1 dual power source. (Recommended AC Adaptors: PA-D09,PA-1E,PA-3B)
String Length 650 mm (25-9/16").
Dimensions 965 x 365 x 80 mm (38" x 14-3/8" x 3-1/8") (with the left frame attached and to the end of the strap pin)
Weight approximately 1.8 kg (3 lbs.15 oz.)
Standard Accessories Stereo Earphones/AC adapter PA-D09/Soft Case
', N'0b51a12a-1246-4d45-8685-82e3f65e6cdb.jpg', CAST(740.00 AS Decimal(18, 2)), N'Yes', 0, 40, 500, N'Active', CAST(N'2015-07-15 14:00:58.107' AS DateTime), NULL)
INSERT [dbo].[Products] ([ProductID], [Name], [CatID], [Code], [Description], [Image], [Price], [IsFeatured], [Available], [Criticallevel], [Maximum], [Status], [DateAdded], [DateModified]) VALUES (55, N'Epiphone g-1275 Double Neck Electric Guitar', 2, N'', N'Body: mahogany
Top: Flame maple
Necks: mahogany, glued-in (6-and 12-string)
Scale: 24.75" (12-string), 24.75" (6-string)
Neck Profiles: SlimTaper "D" (6-and 12-string)
Nut width: 12-string: 1.85" / 6-string: 1.68"
Fingerboard: rosewood medium jumbo frets with pearloid parallelogram (6-and 12-string)
Fingerboard Radius: 12" (6-and 12-string)
Pickup (12-string) Neck: Alnico Classic humbucker/Bridge: Alnico Classic Plus humbucker
Pickup (6-string) Neck: Open coil Alnico Classic humbucker /Bridge: Open coil Alnico Classic Plus humbucker
Bridge: LockTone Tune-O-Matic (6-and 12-string)
Tailpiece: Claw/ABS style (6-and 12-string)
Controls: Neck pickup (6-and 12-string): 1-Volume, 1-Tone /Bridge pickup(6-and 12-string): 1-Volume, 1-Tone Individual 3-way toggle switch for 6-string and 12-string bodies Master 3-way toggle activates 6-string, 12-string, or combination 6-and 12-string. All controls feature full-size 500K O potentiometers
Hardware: Nickel
Case sold separately', N'e97fb87b-1f5c-4072-9e58-1fd3994d08d0.jpg', CAST(1074.50 AS Decimal(18, 2)), N'Yes', 0, 60, 400, N'Active', CAST(N'2015-07-15 14:02:08.027' AS DateTime), NULL)
INSERT [dbo].[Products] ([ProductID], [Name], [CatID], [Code], [Description], [Image], [Price], [IsFeatured], [Available], [Criticallevel], [Maximum], [Status], [DateAdded], [DateModified]) VALUES (56, N'Washburn WD10S Acoustic Guitar', 2, N'', N'
Style: Dreadnought
Top: Solid Alaskan Sitka Spruce
Bracing: Quarter sawn scalloped
Back and Sides: Mahogany
Bridge: Rosewood
Neck: Mahogany (Satin Finish)
Trussrod: Two-Way
Fingerboard: Rosewood
Nut: Bone
Saddle: Bone
Headstock: Rosewood capped with MOP Washburn logo & stylized W inlay
Tuners: Die cast chrome', N'ee269da5-b820-44fc-8381-4afcf35de2c6.jpg', CAST(145.00 AS Decimal(18, 2)), N'Yes', 0, 43, 453, N'Active', CAST(N'2015-07-15 14:02:57.523' AS DateTime), NULL)
INSERT [dbo].[Products] ([ProductID], [Name], [CatID], [Code], [Description], [Image], [Price], [IsFeatured], [Available], [Criticallevel], [Maximum], [Status], [DateAdded], [DateModified]) VALUES (33, N'Lighted Key/Lighted Fret', 4, N'EZ-220', N'EZ-220 is a 61 touch-sensitive keyboard with lighted keys, built-in wireless connectivity to the free Page Turner iPad app and 100 preset songs with digital score make Yamaha''s EZ-220 the perfect learn-to-play keyboard. 
A USB TO HOST port lets you connect the keyboard to your computer for use with a wide range of music programs for both education and entertainment. 
A wide variety of 392 built-in Voices let you play strings, guitars, brass, synthesizers, drums and more. 
The built-in Yamaha Education Suite provides even more ways to learn how to play. 
Finally, 100 preset Styles act as virtual bands that are always ready to jam with you.', N'fe0a1ffe-801c-496b-a6e8-7a0b68187532.jpg', CAST(299.00 AS Decimal(18, 2)), N'Yes', 0, 54, 654, N'Active', CAST(N'2015-07-15 07:57:23.310' AS DateTime), CAST(N'2015-07-15 08:08:22.900' AS DateTime))
INSERT [dbo].[Products] ([ProductID], [Name], [CatID], [Code], [Description], [Image], [Price], [IsFeatured], [Available], [Criticallevel], [Maximum], [Status], [DateAdded], [DateModified]) VALUES (34, N'Piaggero', 4, N'NP-31', N'The new Piaggero NP series gives you classic Yamaha piano tone and 76 full-sized keys in an ultra-portable package weighing in at just 12 pounds (NP-31). 
Operating on just 6 AA batteries, you don''t even need a power outlet to play your piano anywhere your music takes you. 
Yamaha has added a new 61-key model (NP11) and an easy to use panel design with dedicated voice-select buttons. 
Built-in metronome with adjustable tempo and time signature appeals to the pianist who knows that practice makes perfect. 
The NP31''s Graded Soft Touch Action emulates the graded resistance of an acoustic piano without the added weight of hammers.', N'76f805d4-0283-4bd4-827b-320948be8e8c.jpg', CAST(399.00 AS Decimal(18, 2)), N'Yes', 0, 43, 987, N'Active', CAST(N'2015-07-15 08:09:15.920' AS DateTime), NULL)
INSERT [dbo].[Products] ([ProductID], [Name], [CatID], [Code], [Description], [Image], [Price], [IsFeatured], [Available], [Criticallevel], [Maximum], [Status], [DateAdded], [DateModified]) VALUES (35, N'MX Series', 4, N'MX61', N'•	Motif Sounds for Inspiration, Xtensive Controller Integration. It doesn''t get better than this. MX61 is a 61 key music synthesizer which combines Motif XS sounds, USB Audio/MIDI connectivity and advanced DAW/VST controller features at a groundbreaking level of affordability.', N'4edb6cfe-e28d-4eea-a85f-08b8c79f521f.jpg', CAST(999.00 AS Decimal(18, 2)), N'Yes', 0, 25, 765, N'Active', CAST(N'2015-07-15 08:10:05.840' AS DateTime), NULL)
INSERT [dbo].[Products] ([ProductID], [Name], [CatID], [Code], [Description], [Image], [Price], [IsFeatured], [Available], [Criticallevel], [Maximum], [Status], [DateAdded], [DateModified]) VALUES (36, N'MOTIF XF', 4, N'MOTIF XF8', N'Soon after the original MOTIF was released in 2001, it was recognized as the best sounding, top selling and most requested music workstation on the market. 
Over time, it has continued to evolve and improve its expressiveness and functionality. 
At the same time, the online community of end users, sound programmers, software developers and product support specialists at www.yamahasynth.com has expanded into a vibrant online music production community. 
The MOTIF breathes new life into live performances with its expressive sounds and intuitive control. 
In music creation, the MOTIF not only offers its own music creation capabilities, it also offers a system for integrating those capabilities with a variety of software applications. 
And now, the next generation XF builds on the decade-long heritage of MOTIF, and provides groundbreaking expansion capabilities with flash memory that will set a new standard for keyboard workstations for years to come.', N'a2cb013f-60ad-4a58-a0ea-a3f82ac1a58e.jpg', CAST(4039.00 AS Decimal(18, 2)), N'Yes', 0, 32, 453, N'Active', CAST(N'2015-07-15 08:11:24.810' AS DateTime), NULL)
INSERT [dbo].[Products] ([ProductID], [Name], [CatID], [Code], [Description], [Image], [Price], [IsFeatured], [Available], [Criticallevel], [Maximum], [Status], [DateAdded], [DateModified]) VALUES (37, N'Contemporary Digital Piano', 4, N'DGX-650', N'Classic piano touch. Contemporary music experience. 
The DGX-650 is Yamaha’s newest ensemble digital piano to feature a variety of interactive features that make learning, playing and sharing music fun for everyone. 
Acoustic piano touch and tone come first via the Graded Hammer Standard action and PureCF sampling, which includes recordings of a Yamaha concert grand piano. 
But when learning to play your favorite songs, why stop at the piano features? The XG sound set lets aspiring pianists play along with professionally-arranged recordings of songs made famous by artists like Coldplay, Elton John, Adele and more. 
The optional You Are the Artist Series combines best-selling Hal Leonard song books with play-along XG song files for the DGX-650. 
And finally, when you’re ready to share your musical achievements, the new USB Audio Recorder creates a CD-quality audio file on any USB device.', N'1b3c8bcf-9c5a-4953-ab6d-ad19b2573643.jpg', CAST(1299.00 AS Decimal(18, 2)), N'Yes', 0, 32, 343, N'Active', CAST(N'2015-07-15 08:12:43.713' AS DateTime), NULL)
INSERT [dbo].[Products] ([ProductID], [Name], [CatID], [Code], [Description], [Image], [Price], [IsFeatured], [Available], [Criticallevel], [Maximum], [Status], [DateAdded], [DateModified]) VALUES (38, N'Clavinova Grands', 4, N'CVP-609GP', N'With its large cover, beautiful curves and other styling accents, the CVP-609GP has a grand piano-like presence that will take your breath away. 
The NW (Natural Wood) keyboad is finished with synthetic ivory keytops for an outstanding tactile touch response. Its sound is impressive, thanks to an exclusive acoustic design that achieves grand piano-like tonal resonance. 
And of course it includes many of the unique CVP Series features.', N'0a0098d5-aba2-402b-8328-97fa89cc13b5.jpg', CAST(19999.00 AS Decimal(18, 2)), N'Yes', 0, 23, 432, N'Active', CAST(N'2015-07-15 08:13:39.303' AS DateTime), NULL)
INSERT [dbo].[Products] ([ProductID], [Name], [CatID], [Code], [Description], [Image], [Price], [IsFeatured], [Available], [Criticallevel], [Maximum], [Status], [DateAdded], [DateModified]) VALUES (39, N'MODUS Series Designer Pianos', 4, N'R01', N'The R01 digital piano features a new modern, precise design with a misty white finish, with both high-quality sound and keyboard action. 
Its 4-legged design allows for the piano to fit comfortably into a home as a piece of furniture, and its transparent acrylic cover enhances the ''aura'' of this musical instrument. 
Thanks to the new Natural Wood (NW) keys with their synthetic ivory keytops, the keyboard action is virtually indistinguishable from that of a real concert grand piano. 
The new grand piano sound is unparalleled in its expressive capabilities, thanks to Yamaha''s new 4-level, pure CF, dynamic stereo sampling technology. 
Experience maximum sound quality by using its special bench.', N'adb63e5b-409e-495c-9e92-86bfe9d5b630.jpg', CAST(7199.00 AS Decimal(18, 2)), N'Yes', 0, 43, 654, N'Active', CAST(N'2015-07-15 08:15:02.913' AS DateTime), NULL)
INSERT [dbo].[Products] ([ProductID], [Name], [CatID], [Code], [Description], [Image], [Price], [IsFeatured], [Available], [Criticallevel], [Maximum], [Status], [DateAdded], [DateModified]) VALUES (45, N'Silent Piano', 4, N'C7X SH', N'
A piano you can play any time you want, with the natural touch of an acoustic grand piano. 
The new Silent Piano™ from Yamaha, offering enhanced Silent functions and an even richer sound. 
Silent functionality has been added to the C7X, the top model in the CX Series, which is very close to a concert grand, and “sings” with a voice of refined grace. 
This is an SH-type Silent piano™ featuring a CFX sound source.', N'3b20e588-5e65-4f7b-b066-c900a9ba446c.jpg', CAST(82499.00 AS Decimal(18, 2)), N'Yes', 0, 20, 654, N'Active', CAST(N'2015-07-15 08:35:19.473' AS DateTime), NULL)
INSERT [dbo].[Products] ([ProductID], [Name], [CatID], [Code], [Description], [Image], [Price], [IsFeatured], [Available], [Criticallevel], [Maximum], [Status], [DateAdded], [DateModified]) VALUES (46, N'AvantGrand', 4, N'N1', N'As the newest addition to the AvantGrand lineup, the N1 delivers the captivating sound of this hybrid piano series in its simplest form. 
The N1 easily does justice to the grand piano in terms of playing feel and responsive action, setting a new standard with its perfect integration of acoustic and digital technologies.', N'43371fc3-a67f-402c-bad6-ee7c619c10b2.jpg', CAST(9999.00 AS Decimal(18, 2)), N'Yes', 0, 45, 232, N'Active', CAST(N'2015-07-15 08:38:05.497' AS DateTime), NULL)
INSERT [dbo].[Products] ([ProductID], [Name], [CatID], [Code], [Description], [Image], [Price], [IsFeatured], [Available], [Criticallevel], [Maximum], [Status], [DateAdded], [DateModified]) VALUES (47, N'S-Series', 4, N'PSR-S650', N'Expand Your Musical World with high quality and wide variety of Voices and Styles plus FlashROM expansion to add even more, the PSR-S650 gives you all you need for performance and music creation. 
The PSR-S650 boasts a newly-enhanced Style performance engine with MegaVoice technology for ultra-realistic instrumental Style backing - especially with guitar sounds. 
It also features FlashROM Expansion to load Expansion Packs containing new audio samples, Voices, Drum Kits and Styles, a great way to expand your creative possibilities.', N'7bf880d2-8f6c-4e2b-b065-d9ff8020dc66.jpg', CAST(999.00 AS Decimal(18, 2)), N'Yes', 0, 20, 100, N'Active', CAST(N'2015-07-15 08:39:17.330' AS DateTime), NULL)
INSERT [dbo].[Products] ([ProductID], [Name], [CatID], [Code], [Description], [Image], [Price], [IsFeatured], [Available], [Criticallevel], [Maximum], [Status], [DateAdded], [DateModified]) VALUES (48, N'Fender Stratocaster Electric Guitar(Eric Clapton)', 2, N'0117602806', N'Series:	Artist
Color:	Black
Neck Material:	Maple
Neck Finish:	Satin Urethane
Neck Shape:	Soft "V"
Scale Length:	25.5" (648 mm)
Fingerboard:	Maple
Fingerboard Radius:	9.5" (241 mm)
Number of Frets:	22
Fret Size:	Vintage-Style
String Nut:	Synthetic Bone
Nut Width:	1.650" (42 mm)
Position Inlays:	Black Dot
Truss Rod Nut:	1/8" American Series
Headstock:	Artist Signature on Headstock
Neck Plate:	4-Bolt with Micro-Tilt™
Body Material:	Alder
Body Finish:	Urethane
Body Shape:	Stratocaster®', N'bdd010b9-34b7-49f3-b444-6352c10d728d.png', CAST(1599.99 AS Decimal(18, 2)), N'Yes', 0, 10, 40, N'Active', CAST(N'2015-07-15 09:10:06.127' AS DateTime), NULL)
INSERT [dbo].[Products] ([ProductID], [Name], [CatID], [Code], [Description], [Image], [Price], [IsFeatured], [Available], [Criticallevel], [Maximum], [Status], [DateAdded], [DateModified]) VALUES (49, N'Fender Standard Telecaster Electric Guitar', 2, N'0145102502', N'Series:	Standard
Color:	Lake Placid Blue
Body Material:	Alder
Body Finish:	Polyester
Body Shape:	Telecaster®
Neck Material:	Maple
Neck Finish:	Satin Urethane Finish on Back of Neck with Gloss Urethane Headstock Face
Neck Shape:	Modern "C"
Scale Length:	25.5" (648 mm)
Fingerboard:	Maple
Fingerboard Radius:	9.5" (241 mm)
Number of Frets:	21
Fret Size:	Medium Jumbo
String Nut:	Synthetic Bone
Nut Width:	1.650" (42 mm)
Position Inlays:	Black Dot
Truss Rod Nut:	3/16" Hex Adjustment
Neck Plate:	4-Bolt Standard
Bridge Pickup:	Standard Single-Coil Tele
Neck Pickup:	Standard Single-Coil Tele
Controls:	Master Volume, Master Tone
Pickup Switching:	3-Position Blade: Position 1. Bridge Pickup, Position 2. Bridge and Neck Pickups, Position 3. Neck Pickup
Pickup Configuration:	SS
Bridge:	6-Saddle Standard Strings-Through-Body Tele with Block Saddles
Hardware Finish:	Chrome
Tuning Machines:	Fender Standard Cast/Sealed
Pickguard:	3-Ply Parchment
Control Knobs:	Knurled Flat-Top
Switch Tips:	Barrel Style
Strings:	Fender® USA 250L, NPS (.009-.042 Gauges)
', N'e5646e0d-e29f-45d5-81d1-419dbaad57d0.png', CAST(499.00 AS Decimal(18, 2)), N'Yes', 0, 20, 900, N'Active', CAST(N'2015-07-15 09:11:51.590' AS DateTime), NULL)
INSERT [dbo].[Products] ([ProductID], [Name], [CatID], [Code], [Description], [Image], [Price], [IsFeatured], [Available], [Criticallevel], [Maximum], [Status], [DateAdded], [DateModified]) VALUES (50, N'Epiphone Les Paul Standard Electric Guitar', 2, N'0145102502', N'Body:	mahogany
Neck:	Hand-set, mahogany
Scale:	24.75”
Fingerboard:	rosewood
Fingerboard Inlay:	Trapezoid
Nut Width:	1.68”
Neck Pickup:	Alnico humbuckers
Bridge Pickup:	Alnico Classic™ humbuckers
Tailpiece:	Locking Tune-o-matic™ Stopbar
Machine Heads: 	Grover®
Color:	Ebony (EB), Metallic Goldtop (MG), Pelham Blue (PE), Cardinal Red (RC)
Typical Weight:  (+/- 5%)	8.5 lbs
Strings:  	D’Addario® 10, 13, 17, 26, 36, 46', N'0d1062a1-cf7f-44b0-ae18-aa671ccebe9c.jpg', CAST(2999.00 AS Decimal(18, 2)), N'Yes', 0, 20, 200, N'Active', CAST(N'2015-07-15 09:13:34.190' AS DateTime), NULL)
INSERT [dbo].[Products] ([ProductID], [Name], [CatID], [Code], [Description], [Image], [Price], [IsFeatured], [Available], [Criticallevel], [Maximum], [Status], [DateAdded], [DateModified]) VALUES (51, N'Taylor PS56ce 12 Stringed Acoustic Guitar', 2, N'B907EX2', N'Shape: Grand Symphony
Number of Strings: 12
Back/Side Wood: Cocobolo
Scale length: 25-1/2"
Top Wood: Sitka Spruce
Body Length: 20"
Electronics: Expression System 2®
Body Width: 16 1/4"
Cutaway: Venetian
Body Depth: 4 5/8"
Nut & Saddle: Bone
Neck Width: 1-7/8"
Neck/Heel: Tropical Mahogany
Bracing: 12-String Bracing with Relief Rout
Fretboard Wood: Ebony
Fretboard Inlay: Nouveau
Headstock Overlay: Ebony
Binding: Ebony
Bridge Inlay: Nouveau
Bridge Pins: Ebony with Abalone Dots
Tuners: Gotoh
Truss Rod Cover: Ebony
Back/Side Finish: Gloss
Top Finish: Gloss
Neck Finish: Satin
Pickguard: None
Case: Taylor Deluxe Hardshell Brown
Number of Frets: 20
Armrest Binding: Ebony
Back Config: 2-piece No Wedge
Backstrap Wood: Same as Body
Backstrap Finish: None
Brand of Strings: Elixir Phosphor Bronze Light
Buttons: Gold
Edge TrimPaua
Fingerboard Ext: Paua
Fretboard Binding: Ebony
Heel Cap Binding: Ebony
Heel length: 3-1/2"
Peghead Finish: Gloss
Peghead Inlay: Nouveau
Peghead Binding: Ebony
Peghead Logo: Taylor Mother of Pearl
Peghead Type: Standard
Rosette Mat.: Paua
Rosette Size: Single Ring 900 Series Bound
Stain/Sunburst: None
Type of Neck Joint: Scarf
', N'7405dd7b-6a1c-4469-ad01-038052f98df7.jpg', CAST(9458.00 AS Decimal(18, 2)), N'Yes', 0, 20, 577, N'Active', CAST(N'2015-07-15 09:16:56.723' AS DateTime), NULL)
INSERT [dbo].[Products] ([ProductID], [Name], [CatID], [Code], [Description], [Image], [Price], [IsFeatured], [Available], [Criticallevel], [Maximum], [Status], [DateAdded], [DateModified]) VALUES (57, N'Taylor T5 Standard Archtop Acoustic Guitar', 2, N'', N'Body Type	Semi-hollowbody
Body Shape	T5
Left-/Right-handed	Right-handed
Number of Strings	6
Body Material	Sapele
Top Material	Spruce
Body Finish	Polyurethane
Color	Tobacco Sunburst
Neck Material	Mahogany, Bolt-on
Neck Shape	T5
Scale Length	24.875"
Fingerboard Material	Ebony, 15" Radius
Fingerboard Inlay	Micro Dots
Number of Frets	21, Standard
Nut Width	1.6875"
Bridge/Tailpiece	Ebony/Saddle, Compensated Acoustic
Tuners	Chrome-plated
Number of Pickups	3
Neck Pickup	Hidden Samarium Cobalt Humbucker
Middle Pickup	Dynamic Body Sensor
Bridge Pickup	Samarium Cobalt Humbucker
Controls	1 x Volume, 2 x Tone, 5-way Pickup Switch
Strings	Elixir NANOWEB Electric Medium Gauge (.011-.049)
Case Included	Hardshell', N'33a99d9c-90b2-4f0d-997f-62a130f48678.jpg', CAST(2299.00 AS Decimal(18, 2)), N'Yes', 0, 23, 452, N'Active', CAST(N'2015-07-15 14:04:06.973' AS DateTime), NULL)
INSERT [dbo].[Products] ([ProductID], [Name], [CatID], [Code], [Description], [Image], [Price], [IsFeatured], [Available], [Criticallevel], [Maximum], [Status], [DateAdded], [DateModified]) VALUES (58, N' Gibson SG Standard Electric Guitar', 2, N'', N'Body: Mahogany
Neck: Mahogany, SG slim profile
Fingerboard: Undercut fret over binding bound rosewood with trapezoid inlays and 120th anniversary banner
Hardware: Min-ETune system , Chrome tune-o-matic,
Electronics: 57 classic pickups with coil splitting.
Plastics: Black graph tech nut, small pick guard
Case: Vintage brown hardshell', N'444b433e-c166-4bf6-9099-ec9e012a719a.jpg', CAST(1590.44 AS Decimal(18, 2)), N'Yes', 0, 32, 543, N'Active', CAST(N'2015-07-15 14:05:35.987' AS DateTime), NULL)
INSERT [dbo].[Products] ([ProductID], [Name], [CatID], [Code], [Description], [Image], [Price], [IsFeatured], [Available], [Criticallevel], [Maximum], [Status], [DateAdded], [DateModified]) VALUES (59, N'Gibson Flying V Electric Guitar  ', 2, N'', N'Solid mahogany body
Premium nitrocellulose finish
Set neck construction
Extended neck joint
V-Factor X Neck profile: Hybrid ''50s rounded/''60s slim taper neck
17 degree angled headstock
22 fret, American rosewood fretboard
Nickel and silver alloy fret wire
Classic dot inlays
496R Hot Ceramic pickup in the neck
500T Super Ceramic in the bridge
2 volume, 1 tone control
Tune-O-Matic bridge
Stopbar tailpiece
Includes hardshell case
', N'98d2ab4c-bf85-42c5-947c-0cf25b2c5e83.jpg', CAST(1590.44 AS Decimal(18, 2)), N'Yes', 0, 23, 454, N'Active', CAST(N'2015-07-15 14:06:41.583' AS DateTime), NULL)
INSERT [dbo].[Products] ([ProductID], [Name], [CatID], [Code], [Description], [Image], [Price], [IsFeatured], [Available], [Criticallevel], [Maximum], [Status], [DateAdded], [DateModified]) VALUES (60, N'Gibson USA Explorer Electric Guitar  ', 2, N'', N'Body Style	Explorer
Body Species	Mahogany
Plating Finish	Chrome
Tailpiece	Gibson Stop Bar
Bridge	Gibson Tune-O-Matic
Tuners	Mini Grovers
Neck Pickup	496R
Bridge Pickup	500T
Pickup Covers	No
Controls	2 Volume - 1 Tone - 3-Way Toggle
Control Knobs	Black Speed
Control Pocket Cover	Black Plastic
Species	Mahogany
Nut	Corian
Nut Width	Standard Gibson: 1.695" +/- .050"
Headstock Inlay	Gibson Logo
Truss Rod	Gibson Adjustable Truss Rod
Truss Rod Cover	Bell-shaped cover
Fingerboard Species	Granadillo Fingerboard
Inlays	Acrylic dot
Number of Frets	22
Scale Length	24 - 3/4"
Type	Gibson Hardshell
Case Interior	White
Case Exterior	Black
Silkscreen	Gibson USA Logo
', N'8e682015-610b-4a2a-92c6-8f67dd52ea45.jpg', CAST(2399.00 AS Decimal(18, 2)), N'Yes', 0, 47, 765, N'Active', CAST(N'2015-07-15 14:07:44.567' AS DateTime), NULL)
INSERT [dbo].[Products] ([ProductID], [Name], [CatID], [Code], [Description], [Image], [Price], [IsFeatured], [Available], [Criticallevel], [Maximum], [Status], [DateAdded], [DateModified]) VALUES (61, N'Fender Jazzmaster Electric Guitar  ', 2, N'', N'Series:	Standard
Color:	Olympic White
Body Material:	Alder
Body Finish:	Gloss Polyester
Body Shape:	Jazzmaster®
Neck Material:	Maple
Neck Finish:	Satin Urethane
Neck Shape:	Modern "C"
Scale Length:	25.5" (64.8 cm)
Fingerboard:	Rosewood
Fingerboard Radius:	9.5" (241 mm)
Number of Frets:	21
Fret Size:	Medium Jumbo
String Nut:	Synthetic Bone
Nut Width:	1.650" (42 mm)
Position Inlays:	White Dot
Truss Rod Nut:	3/16" Hex Adjustment
Neck Plate:	4-Bolt
Bridge:	6-Saddle Vintage-Style Adjustable with “Floating” Tremolo Tailpiece
Hardware Finish:	Nickel/Chrome
Tuning Machines:	Standard Cast/Sealed
Pickguard:	3-Ply Black/White/Black
Control Knobs:	Black Plastic', N'9aa90815-7ab9-42ff-91c7-c95aa54025a6.jpg', CAST(725.00 AS Decimal(18, 2)), N'Yes', 0, 12, 453, N'Active', CAST(N'2015-07-15 14:09:21.413' AS DateTime), NULL)
INSERT [dbo].[Products] ([ProductID], [Name], [CatID], [Code], [Description], [Image], [Price], [IsFeatured], [Available], [Criticallevel], [Maximum], [Status], [DateAdded], [DateModified]) VALUES (62, N'Ibanez RG9 9 Stringed Electric Guitar', 2, N'', N'neck type	Wizard-9 5pc Maple/Bubinga neck
body	Basswood body
fretboard	Rosewood fretboard w/White dot inlay
fret	Jumbo frets
bridge	Gibraltar Standard II-9 bridge
neck pickup	Quantum (H) neck pickup (Passive/Ceramic)
bridge pickup	Quantum (H) neck pickup (Passive/Ceramic)
factory tuning	1E, 2B, 3G, 4D, 5A, 6E, 7B, 8F#, 9C#
hardware color	Cosmo black
', N'dec951a9-a07a-4932-9073-2a5414f176fa.png', CAST(799.99 AS Decimal(18, 2)), N'Yes', 0, 12, 454, N'Active', CAST(N'2015-07-15 14:10:08.493' AS DateTime), CAST(N'2015-07-15 14:12:32.017' AS DateTime))
INSERT [dbo].[Products] ([ProductID], [Name], [CatID], [Code], [Description], [Image], [Price], [IsFeatured], [Available], [Criticallevel], [Maximum], [Status], [DateAdded], [DateModified]) VALUES (63, N'TRANS SATIN GREY CRYSTAL BEAT SERIES', 1, N'CRB524PD', N'These limited production Crystal Beat kits will be released in manufacturing lots of 12 shell packs. Each lot will feature a different translucent drum wrap over Ultra Clear acrylic, hand-applied and customized at Pearl USA in Nashville, TN. Each kit will come in a pre-configured 22/16/12/10 shell pack with Black Hardware.

The Drumlites Dual-LED lighting package comes pre-installed in each drum, with Power Supply, 5-channel XLR Cable snake, and 8-Color, 4-program wireless remote. The first lot of 12 Limited Edition kits will feature this positional-shifting Trans Satin Grey finish that acts as a diffuser for any color LED you choose.
', N'2535bff3-c7ea-44cb-985b-70a2593d5643.jpg', CAST(1799.00 AS Decimal(18, 2)), N'Yes', 0, 14, 543, N'Active', CAST(N'2015-07-15 14:14:50.593' AS DateTime), NULL)
INSERT [dbo].[Products] ([ProductID], [Name], [CatID], [Code], [Description], [Image], [Price], [IsFeatured], [Available], [Criticallevel], [Maximum], [Status], [DateAdded], [DateModified]) VALUES (64, N'Rocket Tom Large Set - 6"x18" & 6"x21" with T-890', 1, N'ALX-1821', N'Pearl''s Rocket Toms are perfectly pitched and will greatly expand the sound palette of any drum kit. They allow the drummer to produce melody and rhythm simultaneously and will fit in a variety of playing situations. The shells are made of heavy gauge aluminum, beautifully finished, and available in Piano Black lacquer and Arctic White lacquer.

 Rocket Toms are available in a variety of lengths all with 6" diameter batter heads. The two pre-packaged sets are accompanied by a T-890 Double Tom Stand.
', N'bd54e376-dcb0-4067-83c5-d9e1b457c75b.jpg', CAST(639.00 AS Decimal(18, 2)), N'Yes', 0, 43, 655, N'Active', CAST(N'2015-07-15 14:15:21.827' AS DateTime), NULL)
INSERT [dbo].[Products] ([ProductID], [Name], [CatID], [Code], [Description], [Image], [Price], [IsFeatured], [Available], [Criticallevel], [Maximum], [Status], [DateAdded], [DateModified]) VALUES (65, N'GONG DRUM W/ 2 X BB-3', 1, N'RF 2014G', N'Masterworks Series, Reference Pure, and Reference Series offer you the choice of adding a Gong Bass Drum to your arsenal. This drum is visually striking and guarantees to shake the foundation of any venue you play. 
The 20x14 single headed gong drums are mounted by BT-3 Tom Mounts located on each side of the drum. Any Pearl Tom Holder or accessory (like a UX-80 Universal Adapter) with a 7/8 post can be used to mount the drum. Available in high gloss and sparkle lacquer finishes, fit with a Remo Power stroke Head, and comes with the legendary Pearl Lifetime Warranty. 

Gong Drums are exceptionally perfect for live and in the studio when you need the next dimension of low end after your floor toms. Split intricate patterns between the bass drum and gong drum or use it sparingly for that massive explosion at the end of a musical phrase.', N'45f71f92-d353-451e-be58-c61f2b7dba2b.jpg', CAST(1565.00 AS Decimal(18, 2)), N'Yes', 0, 12, 654, N'Active', CAST(N'2015-07-15 14:16:28.570' AS DateTime), NULL)
INSERT [dbo].[Products] ([ProductID], [Name], [CatID], [Code], [Description], [Image], [Price], [IsFeatured], [Available], [Criticallevel], [Maximum], [Status], [DateAdded], [DateModified]) VALUES (66, N'TENOR DRUMS| TDP TUBE LUG TENOR ', 1, N'TDP-1412', N'The Pearl TDP Tenor Pipe Drum feature a 4 ply Maple shell w/ reinforcement rings, 6 ply Maple hoops, and new aluminum tube lugs for better tone and lighter weight. The case-hardened tension rods provide consistent head tensioning and the top and bottom heads are independently adjustable. Available in 4 sizes for a wide range of voicing.', N'1bd0d4e7-e621-4c3c-a58f-9fc5173359f9.jpg', CAST(886.00 AS Decimal(18, 2)), N'Yes', 0, 23, 543, N'Active', CAST(N'2015-07-15 14:17:06.777' AS DateTime), NULL)
INSERT [dbo].[Products] ([ProductID], [Name], [CatID], [Code], [Description], [Image], [Price], [IsFeatured], [Available], [Criticallevel], [Maximum], [Status], [DateAdded], [DateModified]) VALUES (67, N'BASS DRUMS | BDP TUBE LUG BASS', 1, N'BDP-2612', N'These drums offer huge low frequencies with resounding warmth. The 4 Ply Maple shells with 1.5” Maple hoops have aluminum tube lugs for maximum resonance and reduced weight. These drums are scientifically engineered to provide the ultimate in bass response.', N'dd9008cb-b716-4980-816a-445a1dd78acc.jpg', CAST(1283.00 AS Decimal(18, 2)), N'Yes', 0, 25, 765, N'Active', CAST(N'2015-07-15 14:17:37.407' AS DateTime), NULL)
INSERT [dbo].[Products] ([ProductID], [Name], [CatID], [Code], [Description], [Image], [Price], [IsFeatured], [Available], [Criticallevel], [Maximum], [Status], [DateAdded], [DateModified]) VALUES (68, N'SNARE DRUMS MEDALIST PIPE SNARE', 1, N'PHF-1412', N'The FFXPMD1412 Championship Medalist Pipe Snare Drum is the new light-weight envy of the Pipe Snare Drum Market. Weighing in at only 13.8 pounds, this is lightest professional grade Pipe snare on the market. Featuring a 4-ply Birch shell with 2-ply reinforcement rings, the tone production is brilliant and the Medalist’s precession cut snare beds provide unmatched crack and snare response.', N'9e7125bd-26c2-4ec2-a4bb-355ca2cb83b3.jpg', CAST(1435.00 AS Decimal(18, 2)), N'Yes', 0, 32, 653, N'Active', CAST(N'2015-07-15 14:18:06.650' AS DateTime), NULL)
INSERT [dbo].[Products] ([ProductID], [Name], [CatID], [Code], [Description], [Image], [Price], [IsFeatured], [Available], [Criticallevel], [Maximum], [Status], [DateAdded], [DateModified]) VALUES (69, N'TIMPANI| UNIVERSAL FIBERGLASS w/FINE TUNER', 1, N'RVFISET5FT', N'Adams Universal Series Timpani were designed to meet the demand for an extremely high quality, yet highly portable instrument, priced well within reach of today’s performing professional. Their parabolic shaped bowl, available in either copper or fiberglass, rests inside an aluminum shelf, greatly contributing to the instruments stability and outstanding tonal quality and excellent resonance.', N'9122be66-9481-4c6f-bcf7-4d0be92baf16.jpg', CAST(16958.00 AS Decimal(18, 2)), N'Yes', 0, 26, 543, N'Active', CAST(N'2015-07-15 14:18:42.820' AS DateTime), NULL)
INSERT [dbo].[Products] ([ProductID], [Name], [CatID], [Code], [Description], [Image], [Price], [IsFeatured], [Available], [Criticallevel], [Maximum], [Status], [DateAdded], [DateModified]) VALUES (70, N'DJEMBE Field Percussion 14" Fiberglass Djembe', 1, N'PJF-350FP6', N'The Pearl Field Percussion Djembe has been built to be used out in the elements on the field. It''s Black Weather resistant Fiberglass shell will produce a thunderous low end with crisp defined highs and overtones. This sound will blend and be heard well with the other instruments in the drum corps.

A 14" Remo Nuskyn head will maintain its sound and integrity in any weather related environment. It can be tuned with wrench or pliers and will stay in tune.
', N'985c5506-c253-47ac-ae07-1c2eec8a8170.jpg', CAST(640.00 AS Decimal(18, 2)), N'Yes', 0, 26, 668, N'Active', CAST(N'2015-07-15 14:19:31.583' AS DateTime), NULL)
INSERT [dbo].[Products] ([ProductID], [Name], [CatID], [Code], [Description], [Image], [Price], [IsFeatured], [Available], [Criticallevel], [Maximum], [Status], [DateAdded], [DateModified]) VALUES (71, N'FIELD PERCUSSION SHIME TAIKO', 1, N'WST-20FP', N'The Pearl Field Percussion Shime Taiko is designed to taken outside into the elements and still perform and sound great. In fact this Shime Taiko has been to design to perform on the field and cut through the other instruments and project all the way to the top rows of the bleachers.', N'e9ec1d6f-f571-4f8d-9079-e64d3f66fcd2.jpg', CAST(640.00 AS Decimal(18, 2)), N'Yes', 0, 12, 542, N'Active', CAST(N'2015-07-15 14:19:58.483' AS DateTime), NULL)
INSERT [dbo].[Products] ([ProductID], [Name], [CatID], [Code], [Description], [Image], [Price], [IsFeatured], [Available], [Criticallevel], [Maximum], [Status], [DateAdded], [DateModified]) VALUES (72, N'Field Percussion 10”/11” Fiberglass Conga Set', 1, N'PFC-202EDU', N'The Pearl Field Percussion Conga Set is designed to perform and sound great under any weather condition. The Black Fiberglass shells will project a big monstrous low end but still blend with the rich over tones and accents. Pearl chose black so that they will match any drum corps color scheme. 

The Remo Fiberskyn head will stay in tune in any weather. The Field Conga Set comes in 10" and 11" head diameters.
', N'fb5ba246-598f-4735-b8a5-ff64c6621b93.jpg', CAST(640.00 AS Decimal(18, 2)), N'Yes', 0, 24, 543, N'Active', CAST(N'2015-07-15 14:20:41.643' AS DateTime), NULL)
INSERT [dbo].[Products] ([ProductID], [Name], [CatID], [Code], [Description], [Image], [Price], [IsFeatured], [Available], [Criticallevel], [Maximum], [Status], [DateAdded], [DateModified]) VALUES (73, N'MARC QUINONES SIGNATURE ELITE TIMBALES', 1, N'ETE-1415MQ', N'Designed in conjunction with one of today''s premier percussionists, Marc''s timbale set consists of standard 14 and 15 inch drums fitted with Remo Clear Ambassador heads, and packed with a ton of innovative features that only Pearl can deliver. 

The Polished Steel Shells have two inverse beads that not only add strength, but also produce a cutting "cascara" sound (side of the shell) not hindered normally by outward facing beads. To further the "cascara" striking area, this set features a 5-Lug Design, which is proportioned perfectly for leaving maximum shell space and less lug interference. Tuning is easier than any other timbale on the market utilizing a top tuning lug design with included socket wrench. This exclusive Pearl design, cuts the time changing heads in half – No more nuts and washers falling on the floor! 

The cowbell post features a Sympathetic Sound Dampening sleeve so your cowbells and blocks do not ring through the stand, and the whole unit can be mounted in seconds using a one wing-nut design. A double braced tilting stand, and our top-selling PBL-20 Clave Block is included at no extra charge.', N'993f93a2-dcf6-4d53-a7aa-b086dd12a17d.jpg', CAST(880.00 AS Decimal(18, 2)), N'Yes', 0, 20, 547, N'Active', CAST(N'2015-07-15 14:21:12.067' AS DateTime), NULL)
INSERT [dbo].[Products] ([ProductID], [Name], [CatID], [Code], [Description], [Image], [Price], [IsFeatured], [Available], [Criticallevel], [Maximum], [Status], [DateAdded], [DateModified]) VALUES (74, N'Mach 3 Cajon w/ 3 isolated playing zone', 1, N'PBC-1914M3', N'The Mach 3 Cajon is the newest addition to the Sonic Boom cajon family and features a 100% Birch body with three isolated playing zones that simulate snare, bass and tom sounds. Internal chambers isolate these playing zones and prevent any cross-talk. Each chambers has a designated port on the rear of the cajon wih any additional port for increased bass.

Like other cajons in the Sonic Boom family, the Mach 3 Cajon features a backwards tilted front plate to provide the player with a comfortable playing position, eliminating the need to hunch over or rock the cajon backwards to strike the face.

This Made-in-America beauty has a multi-tonal impact like no other cajon on the market and is perfect for the small acoustic setting or larger amplified venues.
', N'5fa2089c-e57b-41de-89f7-6f04ddb7eed6.jpg', CAST(759.00 AS Decimal(18, 2)), N'Yes', 0, 23, 654, N'Active', CAST(N'2015-07-15 14:21:44.623' AS DateTime), NULL)
INSERT [dbo].[Products] ([ProductID], [Name], [CatID], [Code], [Description], [Image], [Price], [IsFeatured], [Available], [Criticallevel], [Maximum], [Status], [DateAdded], [DateModified]) VALUES (75, N'EPRO COCKTAIL KIT', 1, N'EPCTK1424/', N'The ePro Cocktail Kit a new electronic drumset designed for today’s drummer/percussionist! This kit is a modern version of an old school design with unlimited sound possibilities.
This kit is the first multi-zone electronic Cocktail Kit utilizing seven programmable triggers that can be assigned with any of the 1000 HD sounds found in the Pearl r.e.d.box module. The layering capability of the r.e.d.box can produce endless possibilities for percussion and drumset design. The e-Pro Cocktail Kit is specially designed for drummers and percussionists who want to have a distinctive look on stage while
equipped with an endless arsenal of sound.
', N'49c58659-5ec2-43e8-972f-361924e698cf.jpg', CAST(3299.00 AS Decimal(18, 2)), N'Yes', 0, 30, 400, N'Active', CAST(N'2015-07-15 14:22:25.733' AS DateTime), NULL)
INSERT [dbo].[Products] ([ProductID], [Name], [CatID], [Code], [Description], [Image], [Price], [IsFeatured], [Available], [Criticallevel], [Maximum], [Status], [DateAdded], [DateModified]) VALUES (76, N'Honey Amber ePro Live Electronic Drum Kit', 1, N'EPEXL 725S', N'ePro Powered by Export is the new generation of electronic drums from Pearl. We have combined the power of E Pro Live with our Export series to give you the real look and feel that today’s drummer demands. ePro Powered by Export is available in both Lacquer and Wrap finishes and includes the new EHH-2 Hi Hat controller. Never before has today''s drummer been offered the limitless sonic capability and realistic feel of electronic drums on a drumset built with real drum shells, plastic cymbals, and real drumset hardware, all from the percussion industry''s leader, Pearl.', N'28e3b576-5c93-466c-a185-580db512752e.jpg', CAST(4758.00 AS Decimal(18, 2)), N'Yes', 0, 20, 543, N'Active', CAST(N'2015-07-15 14:22:54.930' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[Products] OFF
INSERT [dbo].[Releasing] ([ReleasingNo], [DateReleased], [UserID], [OrderNo], [ProductID], [Quantity]) VALUES (1, CAST(N'2012-12-12 00:00:00.000' AS DateTime), 1, 1, 1, 12)
INSERT [dbo].[Releasing] ([ReleasingNo], [DateReleased], [UserID], [OrderNo], [ProductID], [Quantity]) VALUES (2, CAST(N'2012-08-12 00:00:00.000' AS DateTime), 1, 2, 2, 1)
INSERT [dbo].[Releasing] ([ReleasingNo], [DateReleased], [UserID], [OrderNo], [ProductID], [Quantity]) VALUES (3, CAST(N'2012-08-12 00:00:00.000' AS DateTime), 1, 5, 5, 1)
INSERT [dbo].[Releasing] ([ReleasingNo], [DateReleased], [UserID], [OrderNo], [ProductID], [Quantity]) VALUES (3, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Reviews] ON 

INSERT [dbo].[Reviews] ([ReviewID], [DateReviewed], [UserID], [ProductID], [Rating], [Review], [Status]) VALUES (1, CAST(N'2015-08-12 14:49:32.943' AS DateTime), 1, 1, 5, N'nice', N'Pending')
INSERT [dbo].[Reviews] ([ReviewID], [DateReviewed], [UserID], [ProductID], [Rating], [Review], [Status]) VALUES (2, CAST(N'2015-08-12 14:49:40.957' AS DateTime), 1, 1, 5, N'niceasd', N'Pending')
INSERT [dbo].[Reviews] ([ReviewID], [DateReviewed], [UserID], [ProductID], [Rating], [Review], [Status]) VALUES (3, CAST(N'2015-08-12 14:58:44.013' AS DateTime), 1, 1, 5, N'niceasd', N'Pending')
INSERT [dbo].[Reviews] ([ReviewID], [DateReviewed], [UserID], [ProductID], [Rating], [Review], [Status]) VALUES (4, CAST(N'2015-08-12 15:00:44.363' AS DateTime), 1, 1, 5, N'niceasd', N'Pending')
INSERT [dbo].[Reviews] ([ReviewID], [DateReviewed], [UserID], [ProductID], [Rating], [Review], [Status]) VALUES (5, CAST(N'2015-08-12 15:00:49.517' AS DateTime), 1, 1, 5, N'niceasd', N'Pending')
INSERT [dbo].[Reviews] ([ReviewID], [DateReviewed], [UserID], [ProductID], [Rating], [Review], [Status]) VALUES (6, CAST(N'2015-08-12 15:01:18.050' AS DateTime), 1, 1, 5, N'niceasd', N'Pending')
INSERT [dbo].[Reviews] ([ReviewID], [DateReviewed], [UserID], [ProductID], [Rating], [Review], [Status]) VALUES (7, CAST(N'2015-08-12 15:19:25.087' AS DateTime), 1, 1, 1, N'jijiji', N'Pending')
INSERT [dbo].[Reviews] ([ReviewID], [DateReviewed], [UserID], [ProductID], [Rating], [Review], [Status]) VALUES (8, CAST(N'2015-08-12 20:19:03.647' AS DateTime), 2013, 1, 1, N'vsfvsfvfs', N'Pending')
INSERT [dbo].[Reviews] ([ReviewID], [DateReviewed], [UserID], [ProductID], [Rating], [Review], [Status]) VALUES (9, CAST(N'2015-08-12 20:19:17.237' AS DateTime), 2013, 1, 1, N'vsfvsfvfs', N'Pending')
INSERT [dbo].[Reviews] ([ReviewID], [DateReviewed], [UserID], [ProductID], [Rating], [Review], [Status]) VALUES (10, CAST(N'2015-08-12 20:20:27.707' AS DateTime), 2015, 1, 1, N'cvsdfvcdfs', N'Pending')
INSERT [dbo].[Reviews] ([ReviewID], [DateReviewed], [UserID], [ProductID], [Rating], [Review], [Status]) VALUES (11, CAST(N'2015-08-12 20:21:15.013' AS DateTime), 2015, 1, 1, N'cvsdfvcdfs', N'Pending')
SET IDENTITY_INSERT [dbo].[Reviews] OFF
SET IDENTITY_INSERT [dbo].[SupplierItems] ON 

INSERT [dbo].[SupplierItems] ([RefNo], [SupplierID], [ProductID]) VALUES (3, 1, 0)
INSERT [dbo].[SupplierItems] ([RefNo], [SupplierID], [ProductID]) VALUES (5, 1, 7)
SET IDENTITY_INSERT [dbo].[SupplierItems] OFF
SET IDENTITY_INSERT [dbo].[Suppliers] ON 

INSERT [dbo].[Suppliers] ([SupplierID], [CompanyName], [ContactPerson], [Address], [Phone], [Mobile], [Status], [DateAdded], [DateModified]) VALUES (1, N'Pearl', N'Jonathan Bautista', N'Taft Ave. Manila', N'3243254', N'25353', N'Active', CAST(N'2012-01-12 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Suppliers] ([SupplierID], [CompanyName], [ContactPerson], [Address], [Phone], [Mobile], [Status], [DateAdded], [DateModified]) VALUES (2, N'regrg', N'grg', N'gdfg', N'grg', N'435435', N'Active', CAST(N'2015-08-07 18:15:46.933' AS DateTime), NULL)
INSERT [dbo].[Suppliers] ([SupplierID], [CompanyName], [ContactPerson], [Address], [Phone], [Mobile], [Status], [DateAdded], [DateModified]) VALUES (3, N'dfgdf', N'hdfh', N'4gdfhd', N'hdfh', N'436463', N'Active', CAST(N'2015-08-07 18:20:38.153' AS DateTime), NULL)
INSERT [dbo].[Suppliers] ([SupplierID], [CompanyName], [ContactPerson], [Address], [Phone], [Mobile], [Status], [DateAdded], [DateModified]) VALUES (4, N'fgdfgf', N'gdsfgdf', N'fdgfghd', N'32545324', N'2346343463', N'Active', CAST(N'2015-08-07 18:28:25.160' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[Suppliers] OFF
SET IDENTITY_INSERT [dbo].[Types] ON 

INSERT [dbo].[Types] ([TypeID], [UserType]) VALUES (1, N'Administrator')
INSERT [dbo].[Types] ([TypeID], [UserType]) VALUES (2, N'Sales Personnel')
INSERT [dbo].[Types] ([TypeID], [UserType]) VALUES (3, N'Inventory Clerk')
INSERT [dbo].[Types] ([TypeID], [UserType]) VALUES (4, N'Delivery Personnel')
INSERT [dbo].[Types] ([TypeID], [UserType]) VALUES (5, N'Customers')
SET IDENTITY_INSERT [dbo].[Types] OFF
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([UserID], [TypeID], [Email], [Password], [FirstName], [LastName], [Street], [Municipality], [City], [Phone], [Mobile], [Status], [DateAdded], [DateModified]) VALUES (9, 2, N'patrickjohn012@yahoo.com.ph', N'ErAyJqbYvpxujNXlXcbHkgyqo53xSquS1ePqk0DRyKTT0LjkMU8fbvExukvxzrkYarh8gBrw1clbG++4ztriuQ==', N'Gabriel', N'Felipe', N'manila', N'rtghbvcxserthjn', N'bvcswerthnbvcxs', N'0987654567', N'0987654321', N'Active', CAST(N'2015-06-16 20:36:52.863' AS DateTime), CAST(N'2015-06-17 15:42:07.313' AS DateTime))
INSERT [dbo].[Users] ([UserID], [TypeID], [Email], [Password], [FirstName], [LastName], [Street], [Municipality], [City], [Phone], [Mobile], [Status], [DateAdded], [DateModified]) VALUES (2012, 1, N'j@y.com', N'tsyVyNepjX4qk+d26E1fF9KFoEWSZxvr8ltbsiygc59Rd07ORS5VZ7NDS6DEzZK1MOkWPrcr6kRrYgXCW7xi7w==', N'', N'', NULL, NULL, NULL, NULL, NULL, N'Active', CAST(N'2015-08-12 05:36:54.897' AS DateTime), NULL)
INSERT [dbo].[Users] ([UserID], [TypeID], [Email], [Password], [FirstName], [LastName], [Street], [Municipality], [City], [Phone], [Mobile], [Status], [DateAdded], [DateModified]) VALUES (2013, 5, N'bautista@yahoo.com', N'T8vmfVAZMvAqgJQDEGB0s3R87gtOESWb6BagXvPHm9/YfyeYNCqI5zVEecoWpkmBnsfsQemM2xwxuaXopsvQ6A==', N'Jonathan', N'Bautista', NULL, NULL, NULL, NULL, NULL, N'Active', CAST(N'2015-08-12 14:17:51.920' AS DateTime), NULL)
INSERT [dbo].[Users] ([UserID], [TypeID], [Email], [Password], [FirstName], [LastName], [Street], [Municipality], [City], [Phone], [Mobile], [Status], [DateAdded], [DateModified]) VALUES (2014, 1, N'jonathan@yahoo.com', N'thCKDdkBwIRcaXAs3j4KcSw+vZHYulCUdPxWVW8hlQ47GQaSi5ZXsgsAWtIbwxpcAaDFJVMCD+6naQMTBMWY3g==', N'Jonathan', N'Bautista', N'114 Upper Banlat, ', N'Tandang Sora', N'Quezon City', N'09058472852', N'09058472852', N'Active', CAST(N'2015-08-12 14:21:12.003' AS DateTime), NULL)
INSERT [dbo].[Users] ([UserID], [TypeID], [Email], [Password], [FirstName], [LastName], [Street], [Municipality], [City], [Phone], [Mobile], [Status], [DateAdded], [DateModified]) VALUES (2015, 5, N'j@yahoo.com', N'/Nh4BJPZ0R0pAxuSip2jWKb0hif/8Mt+gPuBB96G4MNl3Jz4/i/AWmzm11gDt4rIlNgqOWBCMSqZXvY7XdTdEQ==', N'fdsfdv', N'fvsfv', NULL, NULL, NULL, NULL, NULL, N'Active', CAST(N'2015-08-12 20:20:14.577' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[Users] OFF

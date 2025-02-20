USE [ecommerce]
GO
/****** Object:  Table [dbo].[Address]    Script Date: 10-12-2023 16:18:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Address](
	[AddressID] [varchar](8) NOT NULL,
	[UserID] [varchar](8) NOT NULL,
	[Address_Type] [varchar](20) NOT NULL,
	[AddressLine1] [varchar](45) NULL,
	[City] [varchar](45) NULL,
	[Province] [varchar](45) NULL,
	[Country] [varchar](45) NULL,
	[PostalCode] [varchar](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[AddressID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Buyers]    Script Date: 10-12-2023 16:18:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Buyers](
	[BuyerID] [varchar](8) NOT NULL,
	[UserID] [varchar](8) NOT NULL,
	[USER_TYPE] [varchar](1) NOT NULL,
	[MembershipID] [varchar](8) NULL,
	[Phone] [varchar](15) NOT NULL,
	[Email] [varchar](45) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC,
	[USER_TYPE] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 10-12-2023 16:18:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryID] [varchar](8) NOT NULL,
	[MainCategory] [varchar](45) NOT NULL,
	[Category] [varchar](45) NOT NULL,
	[SubCategory] [varchar](45) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Discount]    Script Date: 10-12-2023 16:18:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Discount](
	[DiscountID] [varchar](8) NOT NULL,
	[DiscountPrecent] [decimal](5, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[DiscountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Membership]    Script Date: 10-12-2023 16:18:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Membership](
	[MembershipID] [varchar](8) NOT NULL,
	[MembershipType] [varchar](45) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MembershipID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Offer]    Script Date: 10-12-2023 16:18:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Offer](
	[OfferID] [varchar](8) NOT NULL,
	[ProductID] [varchar](8) NULL,
	[DiscountID] [varchar](8) NULL,
PRIMARY KEY CLUSTERED 
(
	[OfferID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 10-12-2023 16:18:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderID] [varchar](8) NOT NULL,
	[UserID] [varchar](8) NOT NULL,
	[ShipperID] [varchar](8) NOT NULL,
	[ShoppingCartID] [varchar](8) NOT NULL,
	[OrderDate] [date] NOT NULL,
	[OrderStatus] [varchar](25) NOT NULL,
	[Amount] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payment]    Script Date: 10-12-2023 16:18:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payment](
	[PaymentID] [varchar](8) NOT NULL,
	[OrderID] [varchar](8) NOT NULL,
	[Payment_Type] [varchar](4) NOT NULL,
	[OfferID] [varchar](8) NOT NULL,
	[InvoiceAmount] [decimal](18, 2) NOT NULL,
	[PaymentStatus] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PaymentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 10-12-2023 16:18:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductID] [varchar](8) NOT NULL,
	[CategoryID] [varchar](8) NOT NULL,
	[ProductName] [varchar](45) NOT NULL,
	[Quantity] [int] NOT NULL,
	[UnitPrice] [decimal](18, 2) NOT NULL,
	[UnitsInStock] [int] NOT NULL,
	[UnitsInOrder] [int] NOT NULL,
	[Date] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rating]    Script Date: 10-12-2023 16:18:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rating](
	[RatingID] [varchar](8) NOT NULL,
	[UserID] [varchar](8) NOT NULL,
	[ProductID] [varchar](8) NOT NULL,
	[Rating] [tinyint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RatingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sellers]    Script Date: 10-12-2023 16:18:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sellers](
	[SellerID] [varchar](8) NOT NULL,
	[UserID] [varchar](8) NOT NULL,
	[USER_TYPE] [varchar](1) NOT NULL,
	[CompanyName] [varchar](45) NOT NULL,
	[Phone] [varchar](15) NOT NULL,
	[Email] [varchar](45) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC,
	[USER_TYPE] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Shipper]    Script Date: 10-12-2023 16:18:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shipper](
	[ShipperID] [varchar](8) NOT NULL,
	[ShipperName] [varchar](45) NULL,
	[ContactName] [varchar](45) NULL,
	[Phone] [varchar](15) NULL,
PRIMARY KEY CLUSTERED 
(
	[ShipperID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ShoppingCart]    Script Date: 10-12-2023 16:18:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShoppingCart](
	[ShoppingCartID] [varchar](8) NOT NULL,
	[UserID] [varchar](8) NOT NULL,
	[ProductID] [varchar](8) NOT NULL,
	[ItemQuantity] [int] NOT NULL,
	[ItemStatus] [varchar](45) NULL,
	[ShoppingStatus] [varchar](45) NULL,
PRIMARY KEY CLUSTERED 
(
	[ShoppingCartID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 10-12-2023 16:18:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [varchar](8) NOT NULL,
	[UserFName] [varchar](45) NOT NULL,
	[UserLName] [varchar](45) NOT NULL,
	[USER_TYPE] [varchar](1) NOT NULL,
	[Password] [varchar](45) NOT NULL,
	[DateCreated] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Wishlist]    Script Date: 10-12-2023 16:18:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Wishlist](
	[WishlistID] [varchar](8) NOT NULL,
	[UserID] [varchar](8) NOT NULL,
	[ProductID] [varchar](8) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[WishlistID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Buyers] ([BuyerID], [UserID], [USER_TYPE], [MembershipID], [Phone], [Email]) VALUES (N'BUWIF0IX', N'US1RRDPX', N'B', N'MEJLNKLN', N'(478)297-9233x9', N'patriciacarpenter@example.org')
INSERT [dbo].[Buyers] ([BuyerID], [UserID], [USER_TYPE], [MembershipID], [Phone], [Email]) VALUES (N'BUF83FD5', N'US2B02HO', N'B', N'MEX29GIH', N'001-646-241-768', N'michellealexander@example.com')
INSERT [dbo].[Buyers] ([BuyerID], [UserID], [USER_TYPE], [MembershipID], [Phone], [Email]) VALUES (N'BUS7CYQC', N'US4PUF90', N'B', N'MEDL5INV', N'704-958-2989x16', N'hwilliams@example.org')
INSERT [dbo].[Buyers] ([BuyerID], [UserID], [USER_TYPE], [MembershipID], [Phone], [Email]) VALUES (N'BU5SY6WX', N'US4WLX8G', N'B', N'ME636P45', N'+1-402-607-4385', N'duffyjoe@example.org')
INSERT [dbo].[Buyers] ([BuyerID], [UserID], [USER_TYPE], [MembershipID], [Phone], [Email]) VALUES (N'BULM3MDD', N'US591HMK', N'B', N'MESRKAW5', N'703-487-9725', N'kingbradley@example.org')
INSERT [dbo].[Buyers] ([BuyerID], [UserID], [USER_TYPE], [MembershipID], [Phone], [Email]) VALUES (N'BU8XV1WY', N'US5RC0EJ', N'B', N'MEMB6BVQ', N'8999211058', N'andrew13@example.org')
INSERT [dbo].[Buyers] ([BuyerID], [UserID], [USER_TYPE], [MembershipID], [Phone], [Email]) VALUES (N'BUBK33SB', N'US5UUVHJ', N'B', N'MEAZE2AT', N'(712)902-6494x9', N'llawson@example.net')
INSERT [dbo].[Buyers] ([BuyerID], [UserID], [USER_TYPE], [MembershipID], [Phone], [Email]) VALUES (N'BU7TJJ6J', N'USAELGX3', N'B', N'ME5XE6LB', N'8717556165', N'sprice@example.net')
INSERT [dbo].[Buyers] ([BuyerID], [UserID], [USER_TYPE], [MembershipID], [Phone], [Email]) VALUES (N'BUCHW4PX', N'USB638A9', N'B', N'MEAUOPZD', N'291.745.2211x71', N'pamela30@example.com')
INSERT [dbo].[Buyers] ([BuyerID], [UserID], [USER_TYPE], [MembershipID], [Phone], [Email]) VALUES (N'BUOH3QLK', N'USC2MGYF', N'B', N'MEUMOJEZ', N'001-850-833-170', N'zray@example.org')
INSERT [dbo].[Buyers] ([BuyerID], [UserID], [USER_TYPE], [MembershipID], [Phone], [Email]) VALUES (N'BU6PUSJP', N'USD2STY0', N'B', NULL, N'8879627864', N'cynthiabarrett@example.com')
INSERT [dbo].[Buyers] ([BuyerID], [UserID], [USER_TYPE], [MembershipID], [Phone], [Email]) VALUES (N'BUD4PP5R', N'USDWIVF0', N'B', N'MEKH4M9X', N'253.981.4743', N'josephdixon@example.org')
INSERT [dbo].[Buyers] ([BuyerID], [UserID], [USER_TYPE], [MembershipID], [Phone], [Email]) VALUES (N'BUZLEHB8', N'USEFLEY3', N'B', N'ME2YUNL4', N'801-853-7755x01', N'wilsontimothy@example.com')
INSERT [dbo].[Buyers] ([BuyerID], [UserID], [USER_TYPE], [MembershipID], [Phone], [Email]) VALUES (N'BU018CSS', N'USFO2JR5', N'B', N'MED0RIRD', N'226.525.1558', N'nicole73@example.com')
INSERT [dbo].[Buyers] ([BuyerID], [UserID], [USER_TYPE], [MembershipID], [Phone], [Email]) VALUES (N'BUL1HIJP', N'USFV4GT4', N'B', N'MEX29GIH', N'374-966-9144x99', N'peterfuller@example.net')
INSERT [dbo].[Buyers] ([BuyerID], [UserID], [USER_TYPE], [MembershipID], [Phone], [Email]) VALUES (N'BUIU9OZ9', N'USFXY3CZ', N'B', N'ME636P45', N'9635026828', N'wmay@example.com')
INSERT [dbo].[Buyers] ([BuyerID], [UserID], [USER_TYPE], [MembershipID], [Phone], [Email]) VALUES (N'BUO0AB77', N'USI41D9M', N'B', N'ME92ZM76', N'885.439.4658x65', N'mark79@example.net')
INSERT [dbo].[Buyers] ([BuyerID], [UserID], [USER_TYPE], [MembershipID], [Phone], [Email]) VALUES (N'BUVLRK16', N'USIUO465', N'B', N'MEE5X8WI', N'001-919-691-868', N'barbara87@example.org')
INSERT [dbo].[Buyers] ([BuyerID], [UserID], [USER_TYPE], [MembershipID], [Phone], [Email]) VALUES (N'BUIK9HBF', N'USJ37IRI', N'B', N'MEX29GIH', N'001-472-687-534', N'richardhampton@example.net')
INSERT [dbo].[Buyers] ([BuyerID], [UserID], [USER_TYPE], [MembershipID], [Phone], [Email]) VALUES (N'BUKQMBDC', N'USKGLUVC', N'B', N'MEHI94TY', N'001-268-795-077', N'james86@example.net')
INSERT [dbo].[Buyers] ([BuyerID], [UserID], [USER_TYPE], [MembershipID], [Phone], [Email]) VALUES (N'BU2VHNN1', N'USLRIZE8', N'B', N'MEA6IW5J', N'3289210755', N'ashleelowery@example.org')
INSERT [dbo].[Buyers] ([BuyerID], [UserID], [USER_TYPE], [MembershipID], [Phone], [Email]) VALUES (N'BU1XML1G', N'USNXP9DZ', N'B', N'MELSDRXR', N'(883)277-8226x9', N'james79@example.com')
INSERT [dbo].[Buyers] ([BuyerID], [UserID], [USER_TYPE], [MembershipID], [Phone], [Email]) VALUES (N'BUSE8HF2', N'USO1D500', N'B', N'MESRKAW5', N'(793)840-4868', N'mpalmer@example.com')
INSERT [dbo].[Buyers] ([BuyerID], [UserID], [USER_TYPE], [MembershipID], [Phone], [Email]) VALUES (N'BU4H8QX6', N'USRX8MP4', N'B', N'MEJLNKLN', N'+1-381-716-0203', N'brendanruiz@example.com')
INSERT [dbo].[Buyers] ([BuyerID], [UserID], [USER_TYPE], [MembershipID], [Phone], [Email]) VALUES (N'BUQ49HGQ', N'USS1RP4T', N'B', N'MEMGKMQZ', N'001-743-640-958', N'john82@example.org')
INSERT [dbo].[Buyers] ([BuyerID], [UserID], [USER_TYPE], [MembershipID], [Phone], [Email]) VALUES (N'BUYPKLC5', N'USSDDXL7', N'B', N'MEUMOJEZ', N'351.679.9422', N'virginia61@example.org')
INSERT [dbo].[Buyers] ([BuyerID], [UserID], [USER_TYPE], [MembershipID], [Phone], [Email]) VALUES (N'BU9RTF91', N'USSO2CX0', N'B', N'MEJLNKLN', N'626.501.3907x57', N'martinezhenry@example.org')
INSERT [dbo].[Buyers] ([BuyerID], [UserID], [USER_TYPE], [MembershipID], [Phone], [Email]) VALUES (N'BUJ20M1V', N'USTBOTN3', N'B', N'MED0RIRD', N'683-442-2010', N'josephbauer@example.com')
INSERT [dbo].[Buyers] ([BuyerID], [UserID], [USER_TYPE], [MembershipID], [Phone], [Email]) VALUES (N'BU2RG2UN', N'USVPLYSK', N'B', N'MECT45JB', N'406.394.4112', N'fitzpatricknicholas@example.com')
INSERT [dbo].[Buyers] ([BuyerID], [UserID], [USER_TYPE], [MembershipID], [Phone], [Email]) VALUES (N'BUWP5HA0', N'USWTGOP2', N'B', N'MEHI94TY', N'554-616-6230', N'johnelliott@example.org')
INSERT [dbo].[Buyers] ([BuyerID], [UserID], [USER_TYPE], [MembershipID], [Phone], [Email]) VALUES (N'BUG3ZCAJ', N'USYDP80R', N'B', NULL, N'493.524.7390x81', N'jasongarcia@example.org')
INSERT [dbo].[Buyers] ([BuyerID], [UserID], [USER_TYPE], [MembershipID], [Phone], [Email]) VALUES (N'BUF4IAZZ', N'USYF05XO', N'B', N'MEV6TXK7', N'(452)386-2926', N'jennifermendoza@example.com')
INSERT [dbo].[Buyers] ([BuyerID], [UserID], [USER_TYPE], [MembershipID], [Phone], [Email]) VALUES (N'BUMCOX2U', N'USYWBRQE', N'B', N'ME724EOS', N'+1-348-301-6924', N'kenneth62@example.net')
GO
INSERT [dbo].[Category] ([CategoryID], [MainCategory], [Category], [SubCategory]) VALUES (N'CA0NOPDA', N'Women', N'Western Wear', N'Trousers & Capris')
INSERT [dbo].[Category] ([CategoryID], [MainCategory], [Category], [SubCategory]) VALUES (N'CA0TZCKH', N'Men', N'Footwear', N'Formal Shoes')
INSERT [dbo].[Category] ([CategoryID], [MainCategory], [Category], [SubCategory]) VALUES (N'CA1B58QS', N'Men', N'Footwear', N'Sports Shoes')
INSERT [dbo].[Category] ([CategoryID], [MainCategory], [Category], [SubCategory]) VALUES (N'CA1BZVHM', N'Women', N'Western Wear', N'Sweaters & Sweatshirts')
INSERT [dbo].[Category] ([CategoryID], [MainCategory], [Category], [SubCategory]) VALUES (N'CA1IQ82F', N'Women', N'Western Wear', N'Jeans')
INSERT [dbo].[Category] ([CategoryID], [MainCategory], [Category], [SubCategory]) VALUES (N'CA1K7260', N'Men', N'Footwear', N'Sports Shoes')
INSERT [dbo].[Category] ([CategoryID], [MainCategory], [Category], [SubCategory]) VALUES (N'CA1KL5FW', N'Women', N'Western Wear', N'Shrugs')
INSERT [dbo].[Category] ([CategoryID], [MainCategory], [Category], [SubCategory]) VALUES (N'CA1O6YI5', N'Women', N'Lingerie & Sleepwear', N'Bra')
INSERT [dbo].[Category] ([CategoryID], [MainCategory], [Category], [SubCategory]) VALUES (N'CA1OHC3D', N'Women', N'Western Wear', N'Tshirts')
INSERT [dbo].[Category] ([CategoryID], [MainCategory], [Category], [SubCategory]) VALUES (N'CA21JNER', N'Women', N'Lingerie & Sleepwear', N'Shapewear')
INSERT [dbo].[Category] ([CategoryID], [MainCategory], [Category], [SubCategory]) VALUES (N'CA3M7YTK', N'Men', N'Bottomwear', N'Formal Trousers')
INSERT [dbo].[Category] ([CategoryID], [MainCategory], [Category], [SubCategory]) VALUES (N'CA4Q0X75', N'Men', N'Footwear', N'Flip Flops')
INSERT [dbo].[Category] ([CategoryID], [MainCategory], [Category], [SubCategory]) VALUES (N'CA5RF872', N'Men', N'Bottomwear', N'Casual Trousers')
INSERT [dbo].[Category] ([CategoryID], [MainCategory], [Category], [SubCategory]) VALUES (N'CA6158RV', N'Women', N'Western Wear', N'Jeans')
INSERT [dbo].[Category] ([CategoryID], [MainCategory], [Category], [SubCategory]) VALUES (N'CA670RTS', N'Women', N'Western Wear', N'Trousers & Capris')
INSERT [dbo].[Category] ([CategoryID], [MainCategory], [Category], [SubCategory]) VALUES (N'CA6MB0BH', N'Men', N'Innerwear & Sleepwear', N'Sleepwear & Loungewear')
INSERT [dbo].[Category] ([CategoryID], [MainCategory], [Category], [SubCategory]) VALUES (N'CA76S287', N'Men', N'Footwear', N'Formal Shoes')
INSERT [dbo].[Category] ([CategoryID], [MainCategory], [Category], [SubCategory]) VALUES (N'CAADGKGU', N'Men', N'Footwear', N'Flip Flops')
INSERT [dbo].[Category] ([CategoryID], [MainCategory], [Category], [SubCategory]) VALUES (N'CAAYXRQ1', N'Men', N'Footwear', N'Sneakers')
INSERT [dbo].[Category] ([CategoryID], [MainCategory], [Category], [SubCategory]) VALUES (N'CABKPL2E', N'Men', N'Innerwear & Sleepwear', N'Briefs & Trunks')
INSERT [dbo].[Category] ([CategoryID], [MainCategory], [Category], [SubCategory]) VALUES (N'CABTJ9S8', N'Men', N'Footwear', N'Socks')
INSERT [dbo].[Category] ([CategoryID], [MainCategory], [Category], [SubCategory]) VALUES (N'CAC1TK2C', N'Men', N'Footwear', N'Casual Shoes')
INSERT [dbo].[Category] ([CategoryID], [MainCategory], [Category], [SubCategory]) VALUES (N'CAC7NN5U', N'Men', N'Innerwear & Sleepwear', N'Vests')
INSERT [dbo].[Category] ([CategoryID], [MainCategory], [Category], [SubCategory]) VALUES (N'CACLPUC3', N'Men', N'Footwear', N'Casual Shoes')
INSERT [dbo].[Category] ([CategoryID], [MainCategory], [Category], [SubCategory]) VALUES (N'CAD09HX5', N'Women', N'Western Wear', N'Jackets & Coats')
INSERT [dbo].[Category] ([CategoryID], [MainCategory], [Category], [SubCategory]) VALUES (N'CAD4OL4W', N'Men', N'Innerwear & Sleepwear', N'Thermals')
INSERT [dbo].[Category] ([CategoryID], [MainCategory], [Category], [SubCategory]) VALUES (N'CADBGQ2I', N'Women', N'Lingerie & Sleepwear', N'Swimwear')
INSERT [dbo].[Category] ([CategoryID], [MainCategory], [Category], [SubCategory]) VALUES (N'CADDLSWO', N'Women', N'Lingerie & Sleepwear', N'Sleepwear & Loungewear')
INSERT [dbo].[Category] ([CategoryID], [MainCategory], [Category], [SubCategory]) VALUES (N'CADXA5ZO', N'Women', N'Lingerie & Sleepwear', N'Bra')
INSERT [dbo].[Category] ([CategoryID], [MainCategory], [Category], [SubCategory]) VALUES (N'CAE7FH0D', N'Women', N'Western Wear', N'Shorts & Skirts')
INSERT [dbo].[Category] ([CategoryID], [MainCategory], [Category], [SubCategory]) VALUES (N'CAERO5S1', N'Women', N'Western Wear', N'Tops')
INSERT [dbo].[Category] ([CategoryID], [MainCategory], [Category], [SubCategory]) VALUES (N'CAF57N48', N'Men', N'Footwear', N'Formal Shoes')
INSERT [dbo].[Category] ([CategoryID], [MainCategory], [Category], [SubCategory]) VALUES (N'CAF9R2SK', N'Men', N'Innerwear & Sleepwear', N'Briefs & Trunks')
INSERT [dbo].[Category] ([CategoryID], [MainCategory], [Category], [SubCategory]) VALUES (N'CAFE7U9L', N'Men', N'Bottomwear', N'Jeans')
INSERT [dbo].[Category] ([CategoryID], [MainCategory], [Category], [SubCategory]) VALUES (N'CAFVZDYQ', N'Women', N'Lingerie & Sleepwear', N'Briefs')
INSERT [dbo].[Category] ([CategoryID], [MainCategory], [Category], [SubCategory]) VALUES (N'CAGLL7X4', N'Men', N'Footwear', N'Socks')
INSERT [dbo].[Category] ([CategoryID], [MainCategory], [Category], [SubCategory]) VALUES (N'CAH5D5KR', N'Men', N'Footwear', N'Sports Shoes')
INSERT [dbo].[Category] ([CategoryID], [MainCategory], [Category], [SubCategory]) VALUES (N'CAI2146S', N'Men', N'Footwear', N'Casual Shoes')
INSERT [dbo].[Category] ([CategoryID], [MainCategory], [Category], [SubCategory]) VALUES (N'CAIBR4E1', N'Men', N'Footwear', N'Socks')
INSERT [dbo].[Category] ([CategoryID], [MainCategory], [Category], [SubCategory]) VALUES (N'CAIYJWES', N'Women', N'Western Wear', N'Dresses')
INSERT [dbo].[Category] ([CategoryID], [MainCategory], [Category], [SubCategory]) VALUES (N'CAJP736Y', N'Women', N'Lingerie & Sleepwear', N'Shapewear')
INSERT [dbo].[Category] ([CategoryID], [MainCategory], [Category], [SubCategory]) VALUES (N'CAJWLOW8', N'Men', N'Innerwear & Sleepwear', N'Boxers')
INSERT [dbo].[Category] ([CategoryID], [MainCategory], [Category], [SubCategory]) VALUES (N'CAKUWXTC', N'Women', N'Western Wear', N'Jumpsuits')
INSERT [dbo].[Category] ([CategoryID], [MainCategory], [Category], [SubCategory]) VALUES (N'CAKW1YEG', N'Women', N'Western Wear', N'Shrugs')
INSERT [dbo].[Category] ([CategoryID], [MainCategory], [Category], [SubCategory]) VALUES (N'CAKXO4M0', N'Men', N'Innerwear & Sleepwear', N'Vests')
INSERT [dbo].[Category] ([CategoryID], [MainCategory], [Category], [SubCategory]) VALUES (N'CALC9C92', N'Women', N'Western Wear', N'Blazers & Waistcoats')
INSERT [dbo].[Category] ([CategoryID], [MainCategory], [Category], [SubCategory]) VALUES (N'CALOY9OJ', N'Women', N'Western Wear', N'Jackets & Coats')
INSERT [dbo].[Category] ([CategoryID], [MainCategory], [Category], [SubCategory]) VALUES (N'CAM0N545', N'Women', N'Lingerie & Sleepwear', N'Camisoles & Thermals')
INSERT [dbo].[Category] ([CategoryID], [MainCategory], [Category], [SubCategory]) VALUES (N'CAM6KXZZ', N'Men', N'Footwear', N'Sandals & Floaters')
INSERT [dbo].[Category] ([CategoryID], [MainCategory], [Category], [SubCategory]) VALUES (N'CAMJ61CX', N'Women', N'Western Wear', N'Tshirts')
INSERT [dbo].[Category] ([CategoryID], [MainCategory], [Category], [SubCategory]) VALUES (N'CAP75RC5', N'Women', N'Western Wear', N'Sweaters & Sweatshirts')
INSERT [dbo].[Category] ([CategoryID], [MainCategory], [Category], [SubCategory]) VALUES (N'CAPNSM6N', N'Women', N'Lingerie & Sleepwear', N'Swimwear')
INSERT [dbo].[Category] ([CategoryID], [MainCategory], [Category], [SubCategory]) VALUES (N'CAQBTBHZ', N'Men', N'Footwear', N'Sneakers')
INSERT [dbo].[Category] ([CategoryID], [MainCategory], [Category], [SubCategory]) VALUES (N'CAQC9KCY', N'Women', N'Western Wear', N'Dresses')
INSERT [dbo].[Category] ([CategoryID], [MainCategory], [Category], [SubCategory]) VALUES (N'CAQCZEXY', N'Women', N'Western Wear', N'Co-ordsPlaysuits')
INSERT [dbo].[Category] ([CategoryID], [MainCategory], [Category], [SubCategory]) VALUES (N'CAQT2205', N'Men', N'Footwear', N'Sneakers')
INSERT [dbo].[Category] ([CategoryID], [MainCategory], [Category], [SubCategory]) VALUES (N'CAR7JFQP', N'Women', N'Lingerie & Sleepwear', N'Briefs')
INSERT [dbo].[Category] ([CategoryID], [MainCategory], [Category], [SubCategory]) VALUES (N'CARCM2ZZ', N'Men', N'Bottomwear', N'Track Pants & Joggers')
INSERT [dbo].[Category] ([CategoryID], [MainCategory], [Category], [SubCategory]) VALUES (N'CARH5VZJ', N'Men', N'Footwear', N'Sandals & Floaters')
INSERT [dbo].[Category] ([CategoryID], [MainCategory], [Category], [SubCategory]) VALUES (N'CARQIDJV', N'Women', N'Lingerie & Sleepwear', N'Camisoles & Thermals')
INSERT [dbo].[Category] ([CategoryID], [MainCategory], [Category], [SubCategory]) VALUES (N'CARYRI9F', N'Women', N'Western Wear', N'Blazers & Waistcoats')
INSERT [dbo].[Category] ([CategoryID], [MainCategory], [Category], [SubCategory]) VALUES (N'CASAL13H', N'Men', N'Footwear', N'Flip Flops')
INSERT [dbo].[Category] ([CategoryID], [MainCategory], [Category], [SubCategory]) VALUES (N'CAU0F2HY', N'Men', N'Bottomwear', N'Shorts')
INSERT [dbo].[Category] ([CategoryID], [MainCategory], [Category], [SubCategory]) VALUES (N'CAVKTJI5', N'Women', N'Lingerie & Sleepwear', N'Sleepwear & Loungewear')
INSERT [dbo].[Category] ([CategoryID], [MainCategory], [Category], [SubCategory]) VALUES (N'CAW27LQV', N'Men', N'Innerwear & Sleepwear', N'Thermals')
INSERT [dbo].[Category] ([CategoryID], [MainCategory], [Category], [SubCategory]) VALUES (N'CAW66OHS', N'Men', N'Innerwear & Sleepwear', N'Sleepwear & Loungewear')
INSERT [dbo].[Category] ([CategoryID], [MainCategory], [Category], [SubCategory]) VALUES (N'CAW7LHXG', N'Women', N'Western Wear', N'Shorts & Skirts')
INSERT [dbo].[Category] ([CategoryID], [MainCategory], [Category], [SubCategory]) VALUES (N'CAWJ484E', N'Women', N'Western Wear', N'Co-ordsPlaysuits')
INSERT [dbo].[Category] ([CategoryID], [MainCategory], [Category], [SubCategory]) VALUES (N'CAX12I1J', N'Men', N'Innerwear & Sleepwear', N'Boxers')
INSERT [dbo].[Category] ([CategoryID], [MainCategory], [Category], [SubCategory]) VALUES (N'CAZ7YBKG', N'Women', N'Western Wear', N'Jumpsuits')
INSERT [dbo].[Category] ([CategoryID], [MainCategory], [Category], [SubCategory]) VALUES (N'CAZDG3EO', N'Men', N'Footwear', N'Sandals & Floaters')
INSERT [dbo].[Category] ([CategoryID], [MainCategory], [Category], [SubCategory]) VALUES (N'CAZSBMO9', N'Women', N'Western Wear', N'Tops')
GO
INSERT [dbo].[Discount] ([DiscountID], [DiscountPrecent]) VALUES (N'DI0GI9YQ', CAST(62.11 AS Decimal(5, 2)))
INSERT [dbo].[Discount] ([DiscountID], [DiscountPrecent]) VALUES (N'DI0GQ51C', CAST(59.65 AS Decimal(5, 2)))
INSERT [dbo].[Discount] ([DiscountID], [DiscountPrecent]) VALUES (N'DI1MKOQJ', CAST(19.38 AS Decimal(5, 2)))
INSERT [dbo].[Discount] ([DiscountID], [DiscountPrecent]) VALUES (N'DI2CSCSD', CAST(57.27 AS Decimal(5, 2)))
INSERT [dbo].[Discount] ([DiscountID], [DiscountPrecent]) VALUES (N'DI2LG2FZ', CAST(48.53 AS Decimal(5, 2)))
INSERT [dbo].[Discount] ([DiscountID], [DiscountPrecent]) VALUES (N'DI2NHLV4', CAST(7.44 AS Decimal(5, 2)))
INSERT [dbo].[Discount] ([DiscountID], [DiscountPrecent]) VALUES (N'DI3O455B', CAST(88.07 AS Decimal(5, 2)))
INSERT [dbo].[Discount] ([DiscountID], [DiscountPrecent]) VALUES (N'DI4FF649', CAST(20.63 AS Decimal(5, 2)))
INSERT [dbo].[Discount] ([DiscountID], [DiscountPrecent]) VALUES (N'DI4GAJEY', CAST(86.70 AS Decimal(5, 2)))
INSERT [dbo].[Discount] ([DiscountID], [DiscountPrecent]) VALUES (N'DI4MK59E', CAST(53.72 AS Decimal(5, 2)))
INSERT [dbo].[Discount] ([DiscountID], [DiscountPrecent]) VALUES (N'DI56YU29', CAST(74.19 AS Decimal(5, 2)))
INSERT [dbo].[Discount] ([DiscountID], [DiscountPrecent]) VALUES (N'DI59FA0Y', CAST(6.59 AS Decimal(5, 2)))
INSERT [dbo].[Discount] ([DiscountID], [DiscountPrecent]) VALUES (N'DI5C9XP6', CAST(82.08 AS Decimal(5, 2)))
INSERT [dbo].[Discount] ([DiscountID], [DiscountPrecent]) VALUES (N'DI5XCIAZ', CAST(87.08 AS Decimal(5, 2)))
INSERT [dbo].[Discount] ([DiscountID], [DiscountPrecent]) VALUES (N'DI708NOR', CAST(64.70 AS Decimal(5, 2)))
INSERT [dbo].[Discount] ([DiscountID], [DiscountPrecent]) VALUES (N'DI786MIQ', CAST(60.91 AS Decimal(5, 2)))
INSERT [dbo].[Discount] ([DiscountID], [DiscountPrecent]) VALUES (N'DI7IZO84', CAST(32.02 AS Decimal(5, 2)))
INSERT [dbo].[Discount] ([DiscountID], [DiscountPrecent]) VALUES (N'DI7SD7G1', CAST(17.35 AS Decimal(5, 2)))
INSERT [dbo].[Discount] ([DiscountID], [DiscountPrecent]) VALUES (N'DI7XDZNM', CAST(20.64 AS Decimal(5, 2)))
INSERT [dbo].[Discount] ([DiscountID], [DiscountPrecent]) VALUES (N'DI86EQC8', CAST(60.27 AS Decimal(5, 2)))
INSERT [dbo].[Discount] ([DiscountID], [DiscountPrecent]) VALUES (N'DI8XIXUB', CAST(44.89 AS Decimal(5, 2)))
INSERT [dbo].[Discount] ([DiscountID], [DiscountPrecent]) VALUES (N'DI9ZCE0K', CAST(77.03 AS Decimal(5, 2)))
INSERT [dbo].[Discount] ([DiscountID], [DiscountPrecent]) VALUES (N'DICM3VWU', CAST(76.92 AS Decimal(5, 2)))
INSERT [dbo].[Discount] ([DiscountID], [DiscountPrecent]) VALUES (N'DICRHD65', CAST(69.80 AS Decimal(5, 2)))
INSERT [dbo].[Discount] ([DiscountID], [DiscountPrecent]) VALUES (N'DIDS3TJ0', CAST(21.50 AS Decimal(5, 2)))
INSERT [dbo].[Discount] ([DiscountID], [DiscountPrecent]) VALUES (N'DIFFHJ23', CAST(34.15 AS Decimal(5, 2)))
INSERT [dbo].[Discount] ([DiscountID], [DiscountPrecent]) VALUES (N'DIG8QVNW', CAST(50.05 AS Decimal(5, 2)))
INSERT [dbo].[Discount] ([DiscountID], [DiscountPrecent]) VALUES (N'DIGEOUX5', CAST(32.00 AS Decimal(5, 2)))
INSERT [dbo].[Discount] ([DiscountID], [DiscountPrecent]) VALUES (N'DIGWVWQA', CAST(45.67 AS Decimal(5, 2)))
INSERT [dbo].[Discount] ([DiscountID], [DiscountPrecent]) VALUES (N'DIHQXCJ6', CAST(49.63 AS Decimal(5, 2)))
INSERT [dbo].[Discount] ([DiscountID], [DiscountPrecent]) VALUES (N'DIJA2RLY', CAST(11.29 AS Decimal(5, 2)))
INSERT [dbo].[Discount] ([DiscountID], [DiscountPrecent]) VALUES (N'DIKV9AAO', CAST(38.74 AS Decimal(5, 2)))
INSERT [dbo].[Discount] ([DiscountID], [DiscountPrecent]) VALUES (N'DIMH9Z3S', CAST(59.84 AS Decimal(5, 2)))
INSERT [dbo].[Discount] ([DiscountID], [DiscountPrecent]) VALUES (N'DIMM5VC4', CAST(70.46 AS Decimal(5, 2)))
INSERT [dbo].[Discount] ([DiscountID], [DiscountPrecent]) VALUES (N'DIMOM4ET', CAST(68.29 AS Decimal(5, 2)))
INSERT [dbo].[Discount] ([DiscountID], [DiscountPrecent]) VALUES (N'DIN4F84A', CAST(9.30 AS Decimal(5, 2)))
INSERT [dbo].[Discount] ([DiscountID], [DiscountPrecent]) VALUES (N'DIN8VMOU', CAST(0.34 AS Decimal(5, 2)))
INSERT [dbo].[Discount] ([DiscountID], [DiscountPrecent]) VALUES (N'DIPISS4M', CAST(74.80 AS Decimal(5, 2)))
INSERT [dbo].[Discount] ([DiscountID], [DiscountPrecent]) VALUES (N'DIPQ3SI9', CAST(79.45 AS Decimal(5, 2)))
INSERT [dbo].[Discount] ([DiscountID], [DiscountPrecent]) VALUES (N'DIPV8MME', CAST(49.59 AS Decimal(5, 2)))
INSERT [dbo].[Discount] ([DiscountID], [DiscountPrecent]) VALUES (N'DIQFEL05', CAST(12.90 AS Decimal(5, 2)))
INSERT [dbo].[Discount] ([DiscountID], [DiscountPrecent]) VALUES (N'DIT44O69', CAST(65.86 AS Decimal(5, 2)))
INSERT [dbo].[Discount] ([DiscountID], [DiscountPrecent]) VALUES (N'DITN4O27', CAST(89.71 AS Decimal(5, 2)))
INSERT [dbo].[Discount] ([DiscountID], [DiscountPrecent]) VALUES (N'DIWD2QSA', CAST(78.02 AS Decimal(5, 2)))
INSERT [dbo].[Discount] ([DiscountID], [DiscountPrecent]) VALUES (N'DIWIPJ66', CAST(62.85 AS Decimal(5, 2)))
INSERT [dbo].[Discount] ([DiscountID], [DiscountPrecent]) VALUES (N'DIWLCKK7', CAST(82.76 AS Decimal(5, 2)))
INSERT [dbo].[Discount] ([DiscountID], [DiscountPrecent]) VALUES (N'DIWMVH9L', CAST(23.92 AS Decimal(5, 2)))
INSERT [dbo].[Discount] ([DiscountID], [DiscountPrecent]) VALUES (N'DIXB1XLY', CAST(80.15 AS Decimal(5, 2)))
INSERT [dbo].[Discount] ([DiscountID], [DiscountPrecent]) VALUES (N'DIYI7JSQ', CAST(14.37 AS Decimal(5, 2)))
INSERT [dbo].[Discount] ([DiscountID], [DiscountPrecent]) VALUES (N'DIZ8HDB5', CAST(10.57 AS Decimal(5, 2)))
GO
INSERT [dbo].[Membership] ([MembershipID], [MembershipType]) VALUES (N'ME2G3340', N'Gold')
INSERT [dbo].[Membership] ([MembershipID], [MembershipType]) VALUES (N'ME2YUNL4', N'Platinum')
INSERT [dbo].[Membership] ([MembershipID], [MembershipType]) VALUES (N'ME4HT5LV', N'Gold')
INSERT [dbo].[Membership] ([MembershipID], [MembershipType]) VALUES (N'ME5MVFEV', N'Student')
INSERT [dbo].[Membership] ([MembershipID], [MembershipType]) VALUES (N'ME5XE6LB', N'Gold')
INSERT [dbo].[Membership] ([MembershipID], [MembershipType]) VALUES (N'ME636P45', N'Platinum')
INSERT [dbo].[Membership] ([MembershipID], [MembershipType]) VALUES (N'ME65C3JR', N'Student')
INSERT [dbo].[Membership] ([MembershipID], [MembershipType]) VALUES (N'ME6GTA8K', N'Gold')
INSERT [dbo].[Membership] ([MembershipID], [MembershipType]) VALUES (N'ME6H0PSQ', N'Platinum')
INSERT [dbo].[Membership] ([MembershipID], [MembershipType]) VALUES (N'ME724EOS', N'Platinum')
INSERT [dbo].[Membership] ([MembershipID], [MembershipType]) VALUES (N'ME8G7NMQ', N'Platinum')
INSERT [dbo].[Membership] ([MembershipID], [MembershipType]) VALUES (N'ME92ZM76', N'Platinum')
INSERT [dbo].[Membership] ([MembershipID], [MembershipType]) VALUES (N'ME96F5CZ', N'Platinum')
INSERT [dbo].[Membership] ([MembershipID], [MembershipType]) VALUES (N'ME97LOQ7', N'Student')
INSERT [dbo].[Membership] ([MembershipID], [MembershipType]) VALUES (N'ME9Y0TDW', N'Student')
INSERT [dbo].[Membership] ([MembershipID], [MembershipType]) VALUES (N'MEA6IW5J', N'Student')
INSERT [dbo].[Membership] ([MembershipID], [MembershipType]) VALUES (N'MEAUOPZD', N'Gold')
INSERT [dbo].[Membership] ([MembershipID], [MembershipType]) VALUES (N'MEAZE2AT', N'Platinum')
INSERT [dbo].[Membership] ([MembershipID], [MembershipType]) VALUES (N'MECT45JB', N'Student')
INSERT [dbo].[Membership] ([MembershipID], [MembershipType]) VALUES (N'MED0RIRD', N'Student')
INSERT [dbo].[Membership] ([MembershipID], [MembershipType]) VALUES (N'MEDL5INV', N'Platinum')
INSERT [dbo].[Membership] ([MembershipID], [MembershipType]) VALUES (N'MEDY85UF', N'Gold')
INSERT [dbo].[Membership] ([MembershipID], [MembershipType]) VALUES (N'MEE5X8WI', N'Platinum')
INSERT [dbo].[Membership] ([MembershipID], [MembershipType]) VALUES (N'MEF94PMS', N'Gold')
INSERT [dbo].[Membership] ([MembershipID], [MembershipType]) VALUES (N'MEFO59BF', N'Platinum')
INSERT [dbo].[Membership] ([MembershipID], [MembershipType]) VALUES (N'MEH5QIJS', N'Student')
INSERT [dbo].[Membership] ([MembershipID], [MembershipType]) VALUES (N'MEHI94TY', N'Gold')
INSERT [dbo].[Membership] ([MembershipID], [MembershipType]) VALUES (N'MEI64WX3', N'Student')
INSERT [dbo].[Membership] ([MembershipID], [MembershipType]) VALUES (N'MEJLNKLN', N'Gold')
INSERT [dbo].[Membership] ([MembershipID], [MembershipType]) VALUES (N'MEJOOHSM', N'Platinum')
INSERT [dbo].[Membership] ([MembershipID], [MembershipType]) VALUES (N'MEJQW3PM', N'Student')
INSERT [dbo].[Membership] ([MembershipID], [MembershipType]) VALUES (N'MEKH4M9X', N'Student')
INSERT [dbo].[Membership] ([MembershipID], [MembershipType]) VALUES (N'MEKIGZLQ', N'Student')
INSERT [dbo].[Membership] ([MembershipID], [MembershipType]) VALUES (N'MELSDRXR', N'Platinum')
INSERT [dbo].[Membership] ([MembershipID], [MembershipType]) VALUES (N'MEM3MPD3', N'Student')
INSERT [dbo].[Membership] ([MembershipID], [MembershipType]) VALUES (N'MEMB6BVQ', N'Student')
INSERT [dbo].[Membership] ([MembershipID], [MembershipType]) VALUES (N'MEMGKMQZ', N'Student')
INSERT [dbo].[Membership] ([MembershipID], [MembershipType]) VALUES (N'MEN6TSCL', N'Student')
INSERT [dbo].[Membership] ([MembershipID], [MembershipType]) VALUES (N'MEPUE1EK', N'Student')
INSERT [dbo].[Membership] ([MembershipID], [MembershipType]) VALUES (N'MEPUZIO1', N'Student')
INSERT [dbo].[Membership] ([MembershipID], [MembershipType]) VALUES (N'MEPXMNCL', N'Student')
INSERT [dbo].[Membership] ([MembershipID], [MembershipType]) VALUES (N'MERMACFH', N'Student')
INSERT [dbo].[Membership] ([MembershipID], [MembershipType]) VALUES (N'MESRKAW5', N'Student')
INSERT [dbo].[Membership] ([MembershipID], [MembershipType]) VALUES (N'MESTMJB6', N'Student')
INSERT [dbo].[Membership] ([MembershipID], [MembershipType]) VALUES (N'MEUMOJEZ', N'Gold')
INSERT [dbo].[Membership] ([MembershipID], [MembershipType]) VALUES (N'MEV6TXK7', N'Gold')
INSERT [dbo].[Membership] ([MembershipID], [MembershipType]) VALUES (N'MEVBFBYO', N'Gold')
INSERT [dbo].[Membership] ([MembershipID], [MembershipType]) VALUES (N'MEVVXPRV', N'Student')
INSERT [dbo].[Membership] ([MembershipID], [MembershipType]) VALUES (N'MEX29GIH', N'Student')
INSERT [dbo].[Membership] ([MembershipID], [MembershipType]) VALUES (N'MEXDAJFJ', N'Platinum')
GO
INSERT [dbo].[Offer] ([OfferID], [ProductID], [DiscountID]) VALUES (N'OF0XJFMO', N'PR4DQ9LA', N'DI4FF649')
INSERT [dbo].[Offer] ([OfferID], [ProductID], [DiscountID]) VALUES (N'OF2KLHA2', N'PRYDX80X', N'DI0GI9YQ')
INSERT [dbo].[Offer] ([OfferID], [ProductID], [DiscountID]) VALUES (N'OF3B0QVY', N'PRMYSLJ4', N'DIN8VMOU')
INSERT [dbo].[Offer] ([OfferID], [ProductID], [DiscountID]) VALUES (N'OF439U29', N'PRBNTED2', N'DITN4O27')
INSERT [dbo].[Offer] ([OfferID], [ProductID], [DiscountID]) VALUES (N'OF5LM0TN', N'PRQZO17Z', N'DI0GI9YQ')
INSERT [dbo].[Offer] ([OfferID], [ProductID], [DiscountID]) VALUES (N'OF6GBH7B', N'PRZ3MW6R', N'DI7SD7G1')
INSERT [dbo].[Offer] ([OfferID], [ProductID], [DiscountID]) VALUES (N'OF6TPG2I', N'PRKHW06Y', N'DIPV8MME')
INSERT [dbo].[Offer] ([OfferID], [ProductID], [DiscountID]) VALUES (N'OF7VNHOU', N'PR3X1NW2', N'DIT44O69')
INSERT [dbo].[Offer] ([OfferID], [ProductID], [DiscountID]) VALUES (N'OF89RYGR', N'PR3IJF88', N'DI4MK59E')
INSERT [dbo].[Offer] ([OfferID], [ProductID], [DiscountID]) VALUES (N'OFAQ0N8P', N'PRRQFBOD', N'DI56YU29')
INSERT [dbo].[Offer] ([OfferID], [ProductID], [DiscountID]) VALUES (N'OFB38BD3', N'PR2RI8VD', N'DIMM5VC4')
INSERT [dbo].[Offer] ([OfferID], [ProductID], [DiscountID]) VALUES (N'OFBFGCDE', N'PRKHW06Y', N'DIDS3TJ0')
INSERT [dbo].[Offer] ([OfferID], [ProductID], [DiscountID]) VALUES (N'OFD0JR7U', N'PROLT4ZP', N'DI3O455B')
INSERT [dbo].[Offer] ([OfferID], [ProductID], [DiscountID]) VALUES (N'OFDXYX1L', N'PR3IJF88', N'DI786MIQ')
INSERT [dbo].[Offer] ([OfferID], [ProductID], [DiscountID]) VALUES (N'OFDZ20FG', N'PRHJHT1R', N'DIGEOUX5')
INSERT [dbo].[Offer] ([OfferID], [ProductID], [DiscountID]) VALUES (N'OFGN8NXM', N'PRKHW06Y', N'DIFFHJ23')
INSERT [dbo].[Offer] ([OfferID], [ProductID], [DiscountID]) VALUES (N'OFHQ53RL', N'PRF5VHY3', N'DIGWVWQA')
INSERT [dbo].[Offer] ([OfferID], [ProductID], [DiscountID]) VALUES (N'OFIDSQ9D', N'PRHJHT1R', NULL)
INSERT [dbo].[Offer] ([OfferID], [ProductID], [DiscountID]) VALUES (N'OFJ0OIEH', N'PRIG69SE', N'DI0GQ51C')
INSERT [dbo].[Offer] ([OfferID], [ProductID], [DiscountID]) VALUES (N'OFL2GFZJ', N'PR4MLJT1', N'DIWLCKK7')
INSERT [dbo].[Offer] ([OfferID], [ProductID], [DiscountID]) VALUES (N'OFNK54AZ', N'PRJJEVTF', N'DIXB1XLY')
INSERT [dbo].[Offer] ([OfferID], [ProductID], [DiscountID]) VALUES (N'OFOGQS4H', N'PRIG69SE', N'DI7SD7G1')
INSERT [dbo].[Offer] ([OfferID], [ProductID], [DiscountID]) VALUES (N'OFROAK9D', N'PRMLKVBQ', N'DI0GI9YQ')
INSERT [dbo].[Offer] ([OfferID], [ProductID], [DiscountID]) VALUES (N'OFRS2NVJ', N'PRBXFCD2', N'DI2NHLV4')
INSERT [dbo].[Offer] ([OfferID], [ProductID], [DiscountID]) VALUES (N'OFTUNIWO', N'PRHFWUM4', N'DIGEOUX5')
INSERT [dbo].[Offer] ([OfferID], [ProductID], [DiscountID]) VALUES (N'OFWVLR35', N'PR2YCZZB', N'DI4GAJEY')
INSERT [dbo].[Offer] ([OfferID], [ProductID], [DiscountID]) VALUES (N'OFX2XTEP', N'PRIG69SE', N'DIPISS4M')
INSERT [dbo].[Offer] ([OfferID], [ProductID], [DiscountID]) VALUES (N'OFX88N9G', N'PRQZO17Z', N'DIZ8HDB5')
INSERT [dbo].[Offer] ([OfferID], [ProductID], [DiscountID]) VALUES (N'OFY53LWJ', N'PR3X1NW2', N'DIDS3TJ0')
INSERT [dbo].[Offer] ([OfferID], [ProductID], [DiscountID]) VALUES (N'OFZXNMLI', N'PRMYSLJ4', N'DIWLCKK7')
GO
INSERT [dbo].[Orders] ([OrderID], [UserID], [ShipperID], [ShoppingCartID], [OrderDate], [OrderStatus], [Amount]) VALUES (N'OR02GEYP', N'USWIWNFD', N'SHTHDWTK', N'SCYAJ7JW', CAST(N'2023-01-30' AS Date), N'Completed', 3090)
INSERT [dbo].[Orders] ([OrderID], [UserID], [ShipperID], [ShoppingCartID], [OrderDate], [OrderStatus], [Amount]) VALUES (N'OR0NNAIN', N'USZHEYT5', N'SH0BPEJ2', N'SCVO8OZ2', CAST(N'2022-12-17' AS Date), N'Pending', 572)
INSERT [dbo].[Orders] ([OrderID], [UserID], [ShipperID], [ShoppingCartID], [OrderDate], [OrderStatus], [Amount]) VALUES (N'OR18KQJM', N'USD2STY0', N'SHPKFYJW', N'SCO72COB', CAST(N'2023-12-01' AS Date), N'Pending', 763)
INSERT [dbo].[Orders] ([OrderID], [UserID], [ShipperID], [ShoppingCartID], [OrderDate], [OrderStatus], [Amount]) VALUES (N'OR1ICZA4', N'USXBDVU0', N'SHBYN0S0', N'SCVYOYLM', CAST(N'2023-10-12' AS Date), N'Completed', 3669)
INSERT [dbo].[Orders] ([OrderID], [UserID], [ShipperID], [ShoppingCartID], [OrderDate], [OrderStatus], [Amount]) VALUES (N'OR1Y3N0O', N'US9BC5OH', N'SHWCS99F', N'SC1UAO5B', CAST(N'2023-07-04' AS Date), N'Cancelled', 1185)
INSERT [dbo].[Orders] ([OrderID], [UserID], [ShipperID], [ShoppingCartID], [OrderDate], [OrderStatus], [Amount]) VALUES (N'OR2224XB', N'USM4IBC1', N'SHBZ0BM7', N'SC9S0V67', CAST(N'2023-02-08' AS Date), N'Completed', 4144)
INSERT [dbo].[Orders] ([OrderID], [UserID], [ShipperID], [ShoppingCartID], [OrderDate], [OrderStatus], [Amount]) VALUES (N'OR291AE2', N'USMA0P2D', N'SHW1T12A', N'SCBNCZAB', CAST(N'2023-07-31' AS Date), N'Cancelled', 1934)
INSERT [dbo].[Orders] ([OrderID], [UserID], [ShipperID], [ShoppingCartID], [OrderDate], [OrderStatus], [Amount]) VALUES (N'OR3MVAW7', N'USLG0J3H', N'SHSQUVIX', N'SCID696O', CAST(N'2023-01-29' AS Date), N'Cancelled', 4222)
INSERT [dbo].[Orders] ([OrderID], [UserID], [ShipperID], [ShoppingCartID], [OrderDate], [OrderStatus], [Amount]) VALUES (N'OR56IBT6', N'USO1D500', N'SHSQUVIX', N'SCLF68DR', CAST(N'2023-05-22' AS Date), N'Pending', 990)
INSERT [dbo].[Orders] ([OrderID], [UserID], [ShipperID], [ShoppingCartID], [OrderDate], [OrderStatus], [Amount]) VALUES (N'OR6YPXE4', N'USRX8MP4', N'SH0BPEJ2', N'SCVO8OZ2', CAST(N'2023-02-25' AS Date), N'Pending', 3820)
INSERT [dbo].[Orders] ([OrderID], [UserID], [ShipperID], [ShoppingCartID], [OrderDate], [OrderStatus], [Amount]) VALUES (N'OR7NOQIW', N'US5D70P2', N'SHTPICM2', N'SC5N24G8', CAST(N'2023-11-06' AS Date), N'Pending', 546)
INSERT [dbo].[Orders] ([OrderID], [UserID], [ShipperID], [ShoppingCartID], [OrderDate], [OrderStatus], [Amount]) VALUES (N'OR8BUDC2', N'USNV9MVH', N'SHWCS99F', N'SC3OJBI2', CAST(N'2023-06-23' AS Date), N'Completed', 2035)
INSERT [dbo].[Orders] ([OrderID], [UserID], [ShipperID], [ShoppingCartID], [OrderDate], [OrderStatus], [Amount]) VALUES (N'OR8QGZP5', N'USNV9MVH', N'SHGNGWPM', N'SCVYOYLM', CAST(N'2023-03-24' AS Date), N'Pending', 4971)
INSERT [dbo].[Orders] ([OrderID], [UserID], [ShipperID], [ShoppingCartID], [OrderDate], [OrderStatus], [Amount]) VALUES (N'OR96M1YA', N'USFO2JR5', N'SHBYN0S0', N'SCVO8OZ2', CAST(N'2023-09-23' AS Date), N'Cancelled', 4306)
INSERT [dbo].[Orders] ([OrderID], [UserID], [ShipperID], [ShoppingCartID], [OrderDate], [OrderStatus], [Amount]) VALUES (N'OR9GFU08', N'USM99NIG', N'SHBYN0S0', N'SCHEF261', CAST(N'2023-07-14' AS Date), N'Completed', 4325)
INSERT [dbo].[Orders] ([OrderID], [UserID], [ShipperID], [ShoppingCartID], [OrderDate], [OrderStatus], [Amount]) VALUES (N'OR9KT3AV', N'USJ37IRI', N'SHTPICM2', N'SCWVBQ31', CAST(N'2023-03-12' AS Date), N'Cancelled', 4907)
INSERT [dbo].[Orders] ([OrderID], [UserID], [ShipperID], [ShoppingCartID], [OrderDate], [OrderStatus], [Amount]) VALUES (N'OR9Y0HII', N'USB9DZ0P', N'SHGNGWPM', N'SCWIDC3Q', CAST(N'2023-03-30' AS Date), N'Cancelled', 3084)
INSERT [dbo].[Orders] ([OrderID], [UserID], [ShipperID], [ShoppingCartID], [OrderDate], [OrderStatus], [Amount]) VALUES (N'ORA5DYVH', N'USB0RVQ5', N'SHIDEJUW', N'SC3OJBI2', CAST(N'2023-07-28' AS Date), N'Completed', 3383)
INSERT [dbo].[Orders] ([OrderID], [UserID], [ShipperID], [ShoppingCartID], [OrderDate], [OrderStatus], [Amount]) VALUES (N'ORB5OG3F', N'USZ6M1UW', N'SHZ41CE4', N'SCVTLEQF', CAST(N'2023-02-18' AS Date), N'Pending', 4622)
INSERT [dbo].[Orders] ([OrderID], [UserID], [ShipperID], [ShoppingCartID], [OrderDate], [OrderStatus], [Amount]) VALUES (N'ORBW6R15', N'USC2MGYF', N'SHIDEJUW', N'SCJY8RGZ', CAST(N'2023-03-06' AS Date), N'Cancelled', 4860)
INSERT [dbo].[Orders] ([OrderID], [UserID], [ShipperID], [ShoppingCartID], [OrderDate], [OrderStatus], [Amount]) VALUES (N'ORCCAK6L', N'USVPLYSK', N'SHBZ0BM7', N'SCD47L8K', CAST(N'2023-09-08' AS Date), N'Pending', 1398)
INSERT [dbo].[Orders] ([OrderID], [UserID], [ShipperID], [ShoppingCartID], [OrderDate], [OrderStatus], [Amount]) VALUES (N'ORCJQ4CT', N'USGAX5IO', N'SHPKFYJW', N'SCD47L8K', CAST(N'2023-09-17' AS Date), N'Completed', 4605)
INSERT [dbo].[Orders] ([OrderID], [UserID], [ShipperID], [ShoppingCartID], [OrderDate], [OrderStatus], [Amount]) VALUES (N'ORCNWD0F', N'USYF05XO', N'SHY1QWUY', N'SC8ANHO6', CAST(N'2023-03-04' AS Date), N'Cancelled', 4535)
INSERT [dbo].[Orders] ([OrderID], [UserID], [ShipperID], [ShoppingCartID], [OrderDate], [OrderStatus], [Amount]) VALUES (N'ORF2Z4LW', N'USF4XVT4', N'SHTPICM2', N'SCKF7R05', CAST(N'2023-08-07' AS Date), N'Cancelled', 4635)
INSERT [dbo].[Orders] ([OrderID], [UserID], [ShipperID], [ShoppingCartID], [OrderDate], [OrderStatus], [Amount]) VALUES (N'ORF56CA3', N'US5RC0EJ', N'SHGNGWPM', N'SCYOQZLU', CAST(N'2023-08-15' AS Date), N'Pending', 432)
INSERT [dbo].[Orders] ([OrderID], [UserID], [ShipperID], [ShoppingCartID], [OrderDate], [OrderStatus], [Amount]) VALUES (N'ORGZMXUJ', N'US7UZICF', N'SHBZ0BM7', N'SCVYOYLM', CAST(N'2023-03-05' AS Date), N'Pending', 1239)
INSERT [dbo].[Orders] ([OrderID], [UserID], [ShipperID], [ShoppingCartID], [OrderDate], [OrderStatus], [Amount]) VALUES (N'ORHXG7IT', N'USWTGCYC', N'SHTPICM2', N'SCVL9FJN', CAST(N'2023-03-23' AS Date), N'Cancelled', 365)
INSERT [dbo].[Orders] ([OrderID], [UserID], [ShipperID], [ShoppingCartID], [OrderDate], [OrderStatus], [Amount]) VALUES (N'ORIF1KSO', N'USVPLYSK', N'SHTHDWTK', N'SCVL9FJN', CAST(N'2023-09-23' AS Date), N'Pending', 112)
INSERT [dbo].[Orders] ([OrderID], [UserID], [ShipperID], [ShoppingCartID], [OrderDate], [OrderStatus], [Amount]) VALUES (N'ORIKTFVS', N'USB638A9', N'SHTHDWTK', N'SCTCGC95', CAST(N'2023-07-10' AS Date), N'Completed', 3639)
INSERT [dbo].[Orders] ([OrderID], [UserID], [ShipperID], [ShoppingCartID], [OrderDate], [OrderStatus], [Amount]) VALUES (N'ORJ58PEA', N'USAELGX3', N'SHE2NQX4', N'SCVL9FJN', CAST(N'2023-12-04' AS Date), N'Cancelled', 4101)
INSERT [dbo].[Orders] ([OrderID], [UserID], [ShipperID], [ShoppingCartID], [OrderDate], [OrderStatus], [Amount]) VALUES (N'ORK5MJZF', N'USNV9MVH', N'SHBYN0S0', N'SC9S0V67', CAST(N'2023-11-04' AS Date), N'Pending', 216)
INSERT [dbo].[Orders] ([OrderID], [UserID], [ShipperID], [ShoppingCartID], [OrderDate], [OrderStatus], [Amount]) VALUES (N'ORK7CCD6', N'USAELGX3', N'SH0BPEJ2', N'SC3K6EC8', CAST(N'2023-01-21' AS Date), N'Cancelled', 4339)
INSERT [dbo].[Orders] ([OrderID], [UserID], [ShipperID], [ShoppingCartID], [OrderDate], [OrderStatus], [Amount]) VALUES (N'ORKIY2BV', N'USWTGOP2', N'SHBZ0BM7', N'SC3OJBI2', CAST(N'2023-01-13' AS Date), N'Cancelled', 1770)
INSERT [dbo].[Orders] ([OrderID], [UserID], [ShipperID], [ShoppingCartID], [OrderDate], [OrderStatus], [Amount]) VALUES (N'ORKLTGJ9', N'US5D70P2', N'SHTHDWTK', N'SCQ5K4PL', CAST(N'2023-10-24' AS Date), N'Cancelled', 2894)
INSERT [dbo].[Orders] ([OrderID], [UserID], [ShipperID], [ShoppingCartID], [OrderDate], [OrderStatus], [Amount]) VALUES (N'ORKRPT5T', N'USXBDVU0', N'SHSQUVIX', N'SC3OJBI2', CAST(N'2023-06-01' AS Date), N'Cancelled', 1407)
INSERT [dbo].[Orders] ([OrderID], [UserID], [ShipperID], [ShoppingCartID], [OrderDate], [OrderStatus], [Amount]) VALUES (N'ORKYDOQ6', N'USGAX5IO', N'SHY5PSPQ', N'SCJN9PBN', CAST(N'2023-05-31' AS Date), N'Pending', 2775)
INSERT [dbo].[Orders] ([OrderID], [UserID], [ShipperID], [ShoppingCartID], [OrderDate], [OrderStatus], [Amount]) VALUES (N'ORM8TLHU', N'USDWIVF0', N'SH0BPEJ2', N'SC3OJBI2', CAST(N'2023-11-05' AS Date), N'Pending', 3392)
INSERT [dbo].[Orders] ([OrderID], [UserID], [ShipperID], [ShoppingCartID], [OrderDate], [OrderStatus], [Amount]) VALUES (N'ORNHS6IV', N'USMQ5KAL', N'SHE2NQX4', N'SCYAJ7JW', CAST(N'2023-08-01' AS Date), N'Pending', 3496)
INSERT [dbo].[Orders] ([OrderID], [UserID], [ShipperID], [ShoppingCartID], [OrderDate], [OrderStatus], [Amount]) VALUES (N'ORNLNA5Z', N'USWTGCYC', N'SH5DUUV4', N'SCHGQQ83', CAST(N'2023-07-21' AS Date), N'Cancelled', 277)
INSERT [dbo].[Orders] ([OrderID], [UserID], [ShipperID], [ShoppingCartID], [OrderDate], [OrderStatus], [Amount]) VALUES (N'OROVDRZW', N'USKLRC39', N'SH2NJUTD', N'SCWLGCI1', CAST(N'2023-05-29' AS Date), N'Cancelled', 2388)
INSERT [dbo].[Orders] ([OrderID], [UserID], [ShipperID], [ShoppingCartID], [OrderDate], [OrderStatus], [Amount]) VALUES (N'ORPNNS19', N'USNV9MVH', N'SHBYN0S0', N'SCK9H1FX', CAST(N'2023-07-08' AS Date), N'Pending', 381)
INSERT [dbo].[Orders] ([OrderID], [UserID], [ShipperID], [ShoppingCartID], [OrderDate], [OrderStatus], [Amount]) VALUES (N'ORR742Z6', N'USXJ7SZ3', N'SHIDEJUW', N'SCHGQQ83', CAST(N'2023-03-05' AS Date), N'Pending', 1512)
INSERT [dbo].[Orders] ([OrderID], [UserID], [ShipperID], [ShoppingCartID], [OrderDate], [OrderStatus], [Amount]) VALUES (N'ORU91EWF', N'US4O0RDT', N'SHSQUVIX', N'SCEDDJ2Y', CAST(N'2023-01-08' AS Date), N'Pending', 2604)
INSERT [dbo].[Orders] ([OrderID], [UserID], [ShipperID], [ShoppingCartID], [OrderDate], [OrderStatus], [Amount]) VALUES (N'ORV57C3E', N'USB638A9', N'SHTPICM2', N'SCID696O', CAST(N'2023-02-27' AS Date), N'Completed', 2997)
INSERT [dbo].[Orders] ([OrderID], [UserID], [ShipperID], [ShoppingCartID], [OrderDate], [OrderStatus], [Amount]) VALUES (N'ORV9TKOO', N'USSULU9I', N'SHY1QWUY', N'SCWLGCI1', CAST(N'2023-04-27' AS Date), N'Cancelled', 2870)
INSERT [dbo].[Orders] ([OrderID], [UserID], [ShipperID], [ShoppingCartID], [OrderDate], [OrderStatus], [Amount]) VALUES (N'ORVO2XQ2', N'USS1RP4T', N'SHWCS99F', N'SCQ02K0J', CAST(N'2023-02-08' AS Date), N'Pending', 465)
INSERT [dbo].[Orders] ([OrderID], [UserID], [ShipperID], [ShoppingCartID], [OrderDate], [OrderStatus], [Amount]) VALUES (N'ORWKJAUM', N'USBHVX1L', N'SHEX1NRH', N'SCRTP724', CAST(N'2023-10-28' AS Date), N'Completed', 1542)
INSERT [dbo].[Orders] ([OrderID], [UserID], [ShipperID], [ShoppingCartID], [OrderDate], [OrderStatus], [Amount]) VALUES (N'ORX3SPOR', N'USMPXUMS', N'SHWCS99F', N'SCJY8RGZ', CAST(N'2023-08-29' AS Date), N'Pending', 3660)
INSERT [dbo].[Orders] ([OrderID], [UserID], [ShipperID], [ShoppingCartID], [OrderDate], [OrderStatus], [Amount]) VALUES (N'ORXSPK1Q', N'USQRAS8P', N'SHEX1NRH', N'SCO72COB', CAST(N'2023-04-14' AS Date), N'Completed', 1986)
INSERT [dbo].[Orders] ([OrderID], [UserID], [ShipperID], [ShoppingCartID], [OrderDate], [OrderStatus], [Amount]) VALUES (N'ORZ3C8UY', N'USMA0P2D', N'SHWCS99F', N'SCK9H1FX', CAST(N'2023-09-03' AS Date), N'Cancelled', 4036)
GO
INSERT [dbo].[Payment] ([PaymentID], [OrderID], [Payment_Type], [OfferID], [InvoiceAmount], [PaymentStatus]) VALUES (N'PA0OXD47', N'ORK7CCD6', N'Cash', N'OF7VNHOU', CAST(697.30 AS Decimal(18, 2)), N'Delivered')
INSERT [dbo].[Payment] ([PaymentID], [OrderID], [Payment_Type], [OfferID], [InvoiceAmount], [PaymentStatus]) VALUES (N'PA1NNUTD', N'OR9Y0HII', N'Cash', N'OFZXNMLI', CAST(313.14 AS Decimal(18, 2)), N'In Transit')
INSERT [dbo].[Payment] ([PaymentID], [OrderID], [Payment_Type], [OfferID], [InvoiceAmount], [PaymentStatus]) VALUES (N'PA1WSAUJ', N'ORB5OG3F', N'Cash', N'OFDXYX1L', CAST(258.40 AS Decimal(18, 2)), N'Processing')
INSERT [dbo].[Payment] ([PaymentID], [OrderID], [Payment_Type], [OfferID], [InvoiceAmount], [PaymentStatus]) VALUES (N'PA33YQGQ', N'ORVO2XQ2', N'Cash', N'OFJ0OIEH', CAST(593.39 AS Decimal(18, 2)), N'Payment Received')
INSERT [dbo].[Payment] ([PaymentID], [OrderID], [Payment_Type], [OfferID], [InvoiceAmount], [PaymentStatus]) VALUES (N'PA3P5VMM', N'ORF56CA3', N'Cash', N'OFBFGCDE', CAST(490.11 AS Decimal(18, 2)), N'Cancelled')
INSERT [dbo].[Payment] ([PaymentID], [OrderID], [Payment_Type], [OfferID], [InvoiceAmount], [PaymentStatus]) VALUES (N'PA5EN7FE', N'ORM8TLHU', N'Card', N'OF0XJFMO', CAST(841.62 AS Decimal(18, 2)), N'Payment Received')
INSERT [dbo].[Payment] ([PaymentID], [OrderID], [Payment_Type], [OfferID], [InvoiceAmount], [PaymentStatus]) VALUES (N'PA5FXJ1D', N'ORZ3C8UY', N'Cash', N'OFGN8NXM', CAST(791.51 AS Decimal(18, 2)), N'In Transit')
INSERT [dbo].[Payment] ([PaymentID], [OrderID], [Payment_Type], [OfferID], [InvoiceAmount], [PaymentStatus]) VALUES (N'PA66R3MO', N'ORR742Z6', N'Card', N'OFDZ20FG', CAST(386.77 AS Decimal(18, 2)), N'Out for Delivery')
INSERT [dbo].[Payment] ([PaymentID], [OrderID], [Payment_Type], [OfferID], [InvoiceAmount], [PaymentStatus]) VALUES (N'PA6CLWSJ', N'ORV57C3E', N'Cash', N'OFDXYX1L', CAST(501.50 AS Decimal(18, 2)), N'Processing')
INSERT [dbo].[Payment] ([PaymentID], [OrderID], [Payment_Type], [OfferID], [InvoiceAmount], [PaymentStatus]) VALUES (N'PA6CR0P7', N'OR96M1YA', N'Cash', N'OFD0JR7U', CAST(733.51 AS Decimal(18, 2)), N'Cancelled')
INSERT [dbo].[Payment] ([PaymentID], [OrderID], [Payment_Type], [OfferID], [InvoiceAmount], [PaymentStatus]) VALUES (N'PA6HE7VR', N'ORXSPK1Q', N'Cash', N'OF6GBH7B', CAST(5.50 AS Decimal(18, 2)), N'In Transit')
INSERT [dbo].[Payment] ([PaymentID], [OrderID], [Payment_Type], [OfferID], [InvoiceAmount], [PaymentStatus]) VALUES (N'PA7RT2H4', N'ORX3SPOR', N'Cash', N'OFIDSQ9D', CAST(580.80 AS Decimal(18, 2)), N'In Transit')
INSERT [dbo].[Payment] ([PaymentID], [OrderID], [Payment_Type], [OfferID], [InvoiceAmount], [PaymentStatus]) VALUES (N'PA88TNTG', N'ORKYDOQ6', N'Cash', N'OFB38BD3', CAST(997.99 AS Decimal(18, 2)), N'Delivered')
INSERT [dbo].[Payment] ([PaymentID], [OrderID], [Payment_Type], [OfferID], [InvoiceAmount], [PaymentStatus]) VALUES (N'PA909KX0', N'ORIF1KSO', N'Card', N'OFROAK9D', CAST(649.98 AS Decimal(18, 2)), N'Processing')
INSERT [dbo].[Payment] ([PaymentID], [OrderID], [Payment_Type], [OfferID], [InvoiceAmount], [PaymentStatus]) VALUES (N'PAAM1W2B', N'OR9KT3AV', N'Cash', N'OFJ0OIEH', CAST(622.53 AS Decimal(18, 2)), N'Payment Received')
INSERT [dbo].[Payment] ([PaymentID], [OrderID], [Payment_Type], [OfferID], [InvoiceAmount], [PaymentStatus]) VALUES (N'PAAQOERX', N'OR9GFU08', N'Card', N'OFOGQS4H', CAST(801.96 AS Decimal(18, 2)), N'Shipped')
INSERT [dbo].[Payment] ([PaymentID], [OrderID], [Payment_Type], [OfferID], [InvoiceAmount], [PaymentStatus]) VALUES (N'PAAWH3X0', N'ORCJQ4CT', N'Card', N'OFX2XTEP', CAST(14.58 AS Decimal(18, 2)), N'Payment Received')
INSERT [dbo].[Payment] ([PaymentID], [OrderID], [Payment_Type], [OfferID], [InvoiceAmount], [PaymentStatus]) VALUES (N'PAB1M6UD', N'ORPNNS19', N'Cash', N'OF5LM0TN', CAST(368.64 AS Decimal(18, 2)), N'Awaiting Payment')
INSERT [dbo].[Payment] ([PaymentID], [OrderID], [Payment_Type], [OfferID], [InvoiceAmount], [PaymentStatus]) VALUES (N'PABK02VW', N'ORWKJAUM', N'Card', N'OFZXNMLI', CAST(140.77 AS Decimal(18, 2)), N'Cancelled')
INSERT [dbo].[Payment] ([PaymentID], [OrderID], [Payment_Type], [OfferID], [InvoiceAmount], [PaymentStatus]) VALUES (N'PABVH090', N'OR8QGZP5', N'Cash', N'OFZXNMLI', CAST(246.35 AS Decimal(18, 2)), N'Cancelled')
INSERT [dbo].[Payment] ([PaymentID], [OrderID], [Payment_Type], [OfferID], [InvoiceAmount], [PaymentStatus]) VALUES (N'PAE85NVY', N'ORHXG7IT', N'Card', N'OFB38BD3', CAST(263.57 AS Decimal(18, 2)), N'Shipped')
INSERT [dbo].[Payment] ([PaymentID], [OrderID], [Payment_Type], [OfferID], [InvoiceAmount], [PaymentStatus]) VALUES (N'PAFG4RH8', N'OR7NOQIW', N'Cash', N'OFROAK9D', CAST(380.47 AS Decimal(18, 2)), N'Cancelled')
INSERT [dbo].[Payment] ([PaymentID], [OrderID], [Payment_Type], [OfferID], [InvoiceAmount], [PaymentStatus]) VALUES (N'PAFVB2E2', N'ORJ58PEA', N'Card', N'OF0XJFMO', CAST(931.78 AS Decimal(18, 2)), N'In Transit')
INSERT [dbo].[Payment] ([PaymentID], [OrderID], [Payment_Type], [OfferID], [InvoiceAmount], [PaymentStatus]) VALUES (N'PAGJX887', N'ORF2Z4LW', N'Cash', N'OFJ0OIEH', CAST(978.90 AS Decimal(18, 2)), N'Processing')
INSERT [dbo].[Payment] ([PaymentID], [OrderID], [Payment_Type], [OfferID], [InvoiceAmount], [PaymentStatus]) VALUES (N'PAH0RCBO', N'OR2224XB', N'Cash', N'OFBFGCDE', CAST(96.59 AS Decimal(18, 2)), N'Out for Delivery')
INSERT [dbo].[Payment] ([PaymentID], [OrderID], [Payment_Type], [OfferID], [InvoiceAmount], [PaymentStatus]) VALUES (N'PAHB318B', N'ORA5DYVH', N'Cash', N'OFJ0OIEH', CAST(753.87 AS Decimal(18, 2)), N'In Transit')
INSERT [dbo].[Payment] ([PaymentID], [OrderID], [Payment_Type], [OfferID], [InvoiceAmount], [PaymentStatus]) VALUES (N'PAIV4ETB', N'ORCCAK6L', N'Card', N'OF7VNHOU', CAST(20.83 AS Decimal(18, 2)), N'Delivered')
INSERT [dbo].[Payment] ([PaymentID], [OrderID], [Payment_Type], [OfferID], [InvoiceAmount], [PaymentStatus]) VALUES (N'PAJY0QRS', N'OR3MVAW7', N'Cash', N'OFDXYX1L', CAST(550.41 AS Decimal(18, 2)), N'Processing')
INSERT [dbo].[Payment] ([PaymentID], [OrderID], [Payment_Type], [OfferID], [InvoiceAmount], [PaymentStatus]) VALUES (N'PAKWR2K7', N'ORKIY2BV', N'Card', N'OF89RYGR', CAST(760.66 AS Decimal(18, 2)), N'Shipped')
INSERT [dbo].[Payment] ([PaymentID], [OrderID], [Payment_Type], [OfferID], [InvoiceAmount], [PaymentStatus]) VALUES (N'PALOQSHS', N'OR0NNAIN', N'Card', N'OFIDSQ9D', CAST(904.16 AS Decimal(18, 2)), N'Delivered')
INSERT [dbo].[Payment] ([PaymentID], [OrderID], [Payment_Type], [OfferID], [InvoiceAmount], [PaymentStatus]) VALUES (N'PAMNQXC9', N'ORKRPT5T', N'Cash', N'OFX2XTEP', CAST(822.61 AS Decimal(18, 2)), N'Payment Received')
INSERT [dbo].[Payment] ([PaymentID], [OrderID], [Payment_Type], [OfferID], [InvoiceAmount], [PaymentStatus]) VALUES (N'PAN5U31L', N'ORU91EWF', N'Cash', N'OFY53LWJ', CAST(744.06 AS Decimal(18, 2)), N'Awaiting Payment')
INSERT [dbo].[Payment] ([PaymentID], [OrderID], [Payment_Type], [OfferID], [InvoiceAmount], [PaymentStatus]) VALUES (N'PAOZ3Q12', N'ORIKTFVS', N'Card', N'OFY53LWJ', CAST(186.58 AS Decimal(18, 2)), N'Delivered')
INSERT [dbo].[Payment] ([PaymentID], [OrderID], [Payment_Type], [OfferID], [InvoiceAmount], [PaymentStatus]) VALUES (N'PAPCQTXN', N'OR8BUDC2', N'Cash', N'OF5LM0TN', CAST(795.97 AS Decimal(18, 2)), N'Processing')
INSERT [dbo].[Payment] ([PaymentID], [OrderID], [Payment_Type], [OfferID], [InvoiceAmount], [PaymentStatus]) VALUES (N'PAQ71LSQ', N'OR1Y3N0O', N'Card', N'OF0XJFMO', CAST(717.32 AS Decimal(18, 2)), N'Shipped')
INSERT [dbo].[Payment] ([PaymentID], [OrderID], [Payment_Type], [OfferID], [InvoiceAmount], [PaymentStatus]) VALUES (N'PAQEMLAM', N'ORKLTGJ9', N'Cash', N'OF439U29', CAST(168.01 AS Decimal(18, 2)), N'Awaiting Payment')
INSERT [dbo].[Payment] ([PaymentID], [OrderID], [Payment_Type], [OfferID], [InvoiceAmount], [PaymentStatus]) VALUES (N'PAR42UNG', N'OR02GEYP', N'Card', N'OFOGQS4H', CAST(472.84 AS Decimal(18, 2)), N'Delivered')
INSERT [dbo].[Payment] ([PaymentID], [OrderID], [Payment_Type], [OfferID], [InvoiceAmount], [PaymentStatus]) VALUES (N'PARLBC05', N'OR6YPXE4', N'Cash', N'OFBFGCDE', CAST(527.76 AS Decimal(18, 2)), N'In Transit')
INSERT [dbo].[Payment] ([PaymentID], [OrderID], [Payment_Type], [OfferID], [InvoiceAmount], [PaymentStatus]) VALUES (N'PARPLN4C', N'OROVDRZW', N'Cash', N'OFJ0OIEH', CAST(596.54 AS Decimal(18, 2)), N'Awaiting Payment')
INSERT [dbo].[Payment] ([PaymentID], [OrderID], [Payment_Type], [OfferID], [InvoiceAmount], [PaymentStatus]) VALUES (N'PASRUHGQ', N'ORBW6R15', N'Cash', N'OFWVLR35', CAST(981.47 AS Decimal(18, 2)), N'Cancelled')
INSERT [dbo].[Payment] ([PaymentID], [OrderID], [Payment_Type], [OfferID], [InvoiceAmount], [PaymentStatus]) VALUES (N'PAV0YWIX', N'ORK5MJZF', N'Cash', N'OFOGQS4H', CAST(389.07 AS Decimal(18, 2)), N'Payment Received')
INSERT [dbo].[Payment] ([PaymentID], [OrderID], [Payment_Type], [OfferID], [InvoiceAmount], [PaymentStatus]) VALUES (N'PAVR2PX7', N'ORNHS6IV', N'Cash', N'OF0XJFMO', CAST(495.37 AS Decimal(18, 2)), N'Awaiting Payment')
INSERT [dbo].[Payment] ([PaymentID], [OrderID], [Payment_Type], [OfferID], [InvoiceAmount], [PaymentStatus]) VALUES (N'PAVYELNH', N'ORGZMXUJ', N'Card', N'OFTUNIWO', CAST(106.53 AS Decimal(18, 2)), N'Cancelled')
INSERT [dbo].[Payment] ([PaymentID], [OrderID], [Payment_Type], [OfferID], [InvoiceAmount], [PaymentStatus]) VALUES (N'PAWTC2M2', N'ORCNWD0F', N'Card', N'OFAQ0N8P', CAST(609.93 AS Decimal(18, 2)), N'Shipped')
INSERT [dbo].[Payment] ([PaymentID], [OrderID], [Payment_Type], [OfferID], [InvoiceAmount], [PaymentStatus]) VALUES (N'PAX4KL51', N'OR56IBT6', N'Card', N'OF2KLHA2', CAST(827.25 AS Decimal(18, 2)), N'Awaiting Payment')
INSERT [dbo].[Payment] ([PaymentID], [OrderID], [Payment_Type], [OfferID], [InvoiceAmount], [PaymentStatus]) VALUES (N'PAXG7W34', N'ORV9TKOO', N'Cash', N'OFNK54AZ', CAST(921.80 AS Decimal(18, 2)), N'Delivered')
INSERT [dbo].[Payment] ([PaymentID], [OrderID], [Payment_Type], [OfferID], [InvoiceAmount], [PaymentStatus]) VALUES (N'PAXH0Y14', N'OR18KQJM', N'Card', N'OFRS2NVJ', CAST(927.07 AS Decimal(18, 2)), N'Awaiting Payment')
INSERT [dbo].[Payment] ([PaymentID], [OrderID], [Payment_Type], [OfferID], [InvoiceAmount], [PaymentStatus]) VALUES (N'PAY9GGSH', N'OR1ICZA4', N'Card', N'OFX88N9G', CAST(369.63 AS Decimal(18, 2)), N'In Transit')
INSERT [dbo].[Payment] ([PaymentID], [OrderID], [Payment_Type], [OfferID], [InvoiceAmount], [PaymentStatus]) VALUES (N'PAYDFU6N', N'ORNLNA5Z', N'Card', N'OF0XJFMO', CAST(180.89 AS Decimal(18, 2)), N'Shipped')
INSERT [dbo].[Payment] ([PaymentID], [OrderID], [Payment_Type], [OfferID], [InvoiceAmount], [PaymentStatus]) VALUES (N'PAZR2OSI', N'OR291AE2', N'Card', N'OFAQ0N8P', CAST(985.50 AS Decimal(18, 2)), N'Cancelled')
GO
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Quantity], [UnitPrice], [UnitsInStock], [UnitsInOrder], [Date]) VALUES (N'PR08N1DN', N'CA1BZVHM', N'exploit end-to-end communities', 84, CAST(259.35 AS Decimal(18, 2)), 1, 8, CAST(N'2023-12-09' AS Date))
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Quantity], [UnitPrice], [UnitsInStock], [UnitsInOrder], [Date]) VALUES (N'PR0B53W7', N'CA0NOPDA', N'brand one-to-one functionalities', 94, CAST(52.94 AS Decimal(18, 2)), 29, 19, CAST(N'2023-12-09' AS Date))
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Quantity], [UnitPrice], [UnitsInStock], [UnitsInOrder], [Date]) VALUES (N'PR0S237E', N'CAKW1YEG', N'drive extensible models', 72, CAST(65.09 AS Decimal(18, 2)), 32, 14, CAST(N'2023-12-09' AS Date))
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Quantity], [UnitPrice], [UnitsInStock], [UnitsInOrder], [Date]) VALUES (N'PR2QE0W5', N'CA76S287', N'target revolutionary e-services', 45, CAST(136.74 AS Decimal(18, 2)), 27, 7, CAST(N'2023-12-09' AS Date))
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Quantity], [UnitPrice], [UnitsInStock], [UnitsInOrder], [Date]) VALUES (N'PR2RI8VD', N'CA6158RV', N'grow sticky vortals', 15, CAST(406.21 AS Decimal(18, 2)), 15, 7, CAST(N'2023-12-09' AS Date))
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Quantity], [UnitPrice], [UnitsInStock], [UnitsInOrder], [Date]) VALUES (N'PR2YCZZB', N'CAKXO4M0', N'revolutionize real-time metrics', 75, CAST(306.92 AS Decimal(18, 2)), 9, 2, CAST(N'2023-12-09' AS Date))
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Quantity], [UnitPrice], [UnitsInStock], [UnitsInOrder], [Date]) VALUES (N'PR3IJF88', N'CAERO5S1', N'streamline value-added web-readiness', 83, CAST(469.45 AS Decimal(18, 2)), 43, 5, CAST(N'2023-12-09' AS Date))
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Quantity], [UnitPrice], [UnitsInStock], [UnitsInOrder], [Date]) VALUES (N'PR3X1NW2', N'CAX12I1J', N'enable scalable communities', 85, CAST(909.54 AS Decimal(18, 2)), 48, 20, CAST(N'2023-12-09' AS Date))
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Quantity], [UnitPrice], [UnitsInStock], [UnitsInOrder], [Date]) VALUES (N'PR47SFVF', N'CAQT2205', N'generate world-class initiatives', 61, CAST(796.29 AS Decimal(18, 2)), 48, 10, CAST(N'2023-12-09' AS Date))
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Quantity], [UnitPrice], [UnitsInStock], [UnitsInOrder], [Date]) VALUES (N'PR48S905', N'CAIBR4E1', N'exploit cross-platform portals', 93, CAST(336.96 AS Decimal(18, 2)), 20, 3, CAST(N'2023-12-09' AS Date))
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Quantity], [UnitPrice], [UnitsInStock], [UnitsInOrder], [Date]) VALUES (N'PR4DQ9LA', N'CA670RTS', N'orchestrate B2B solutions', 54, CAST(970.67 AS Decimal(18, 2)), 30, 10, CAST(N'2023-12-09' AS Date))
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Quantity], [UnitPrice], [UnitsInStock], [UnitsInOrder], [Date]) VALUES (N'PR4MLJT1', N'CABKPL2E', N'maximize compelling vortals', 64, CAST(253.51 AS Decimal(18, 2)), 46, 18, CAST(N'2023-12-09' AS Date))
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Quantity], [UnitPrice], [UnitsInStock], [UnitsInOrder], [Date]) VALUES (N'PR55HR6V', N'CADDLSWO', N'deploy efficient e-tailers', 37, CAST(404.87 AS Decimal(18, 2)), 4, 12, CAST(N'2023-12-09' AS Date))
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Quantity], [UnitPrice], [UnitsInStock], [UnitsInOrder], [Date]) VALUES (N'PR6CUFDD', N'CAKW1YEG', N'facilitate bleeding-edge partnerships', 43, CAST(863.63 AS Decimal(18, 2)), 33, 4, CAST(N'2023-12-09' AS Date))
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Quantity], [UnitPrice], [UnitsInStock], [UnitsInOrder], [Date]) VALUES (N'PR6QOUSW', N'CA6MB0BH', N'matrix dynamic eyeballs', 78, CAST(485.36 AS Decimal(18, 2)), 46, 9, CAST(N'2023-12-09' AS Date))
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Quantity], [UnitPrice], [UnitsInStock], [UnitsInOrder], [Date]) VALUES (N'PR6R65B4', N'CAU0F2HY', N're-intermediate front-end niches', 53, CAST(916.39 AS Decimal(18, 2)), 29, 9, CAST(N'2023-12-09' AS Date))
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Quantity], [UnitPrice], [UnitsInStock], [UnitsInOrder], [Date]) VALUES (N'PR72YDWG', N'CAFE7U9L', N'evolve turn-key communities', 80, CAST(430.52 AS Decimal(18, 2)), 33, 14, CAST(N'2023-12-09' AS Date))
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Quantity], [UnitPrice], [UnitsInStock], [UnitsInOrder], [Date]) VALUES (N'PR7YQX96', N'CARQIDJV', N'drive frictionless bandwidth', 90, CAST(818.33 AS Decimal(18, 2)), 19, 16, CAST(N'2023-12-09' AS Date))
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Quantity], [UnitPrice], [UnitsInStock], [UnitsInOrder], [Date]) VALUES (N'PR9Y8QAW', N'CAADGKGU', N'seize clicks-and-mortar e-business', 39, CAST(620.54 AS Decimal(18, 2)), 36, 9, CAST(N'2023-12-09' AS Date))
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Quantity], [UnitPrice], [UnitsInStock], [UnitsInOrder], [Date]) VALUES (N'PRBNTED2', N'CAQBTBHZ', N'engage distributed e-commerce', 74, CAST(831.01 AS Decimal(18, 2)), 41, 18, CAST(N'2023-12-09' AS Date))
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Quantity], [UnitPrice], [UnitsInStock], [UnitsInOrder], [Date]) VALUES (N'PRBXFCD2', N'CARYRI9F', N'morph interactive eyeballs', 100, CAST(533.71 AS Decimal(18, 2)), 6, 2, CAST(N'2023-12-09' AS Date))
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Quantity], [UnitPrice], [UnitsInStock], [UnitsInOrder], [Date]) VALUES (N'PRCA40QD', N'CAZDG3EO', N'productize web-enabled technologies', 8, CAST(768.83 AS Decimal(18, 2)), 37, 13, CAST(N'2023-12-09' AS Date))
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Quantity], [UnitPrice], [UnitsInStock], [UnitsInOrder], [Date]) VALUES (N'PRCT68ZT', N'CAU0F2HY', N'evolve cross-media methodologies', 57, CAST(426.18 AS Decimal(18, 2)), 18, 11, CAST(N'2023-12-09' AS Date))
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Quantity], [UnitPrice], [UnitsInStock], [UnitsInOrder], [Date]) VALUES (N'PRDTPTL5', N'CA1IQ82F', N'utilize cross-media e-commerce', 30, CAST(228.13 AS Decimal(18, 2)), 46, 7, CAST(N'2023-12-09' AS Date))
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Quantity], [UnitPrice], [UnitsInStock], [UnitsInOrder], [Date]) VALUES (N'PREEMXXI', N'CAC7NN5U', N'strategize next-generation supply-chains', 33, CAST(740.94 AS Decimal(18, 2)), 50, 0, CAST(N'2023-12-09' AS Date))
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Quantity], [UnitPrice], [UnitsInStock], [UnitsInOrder], [Date]) VALUES (N'PREQ6XZM', N'CAH5D5KR', N'utilize enterprise communities', 44, CAST(826.00 AS Decimal(18, 2)), 24, 11, CAST(N'2023-12-09' AS Date))
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Quantity], [UnitPrice], [UnitsInStock], [UnitsInOrder], [Date]) VALUES (N'PRF5VHY3', N'CAGLL7X4', N'revolutionize rich e-commerce', 63, CAST(936.77 AS Decimal(18, 2)), 8, 10, CAST(N'2023-12-09' AS Date))
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Quantity], [UnitPrice], [UnitsInStock], [UnitsInOrder], [Date]) VALUES (N'PRH1NH8R', N'CALC9C92', N'whiteboard magnetic platforms', 37, CAST(202.67 AS Decimal(18, 2)), 2, 12, CAST(N'2023-12-09' AS Date))
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Quantity], [UnitPrice], [UnitsInStock], [UnitsInOrder], [Date]) VALUES (N'PRH255HD', N'CADBGQ2I', N'strategize proactive initiatives', 93, CAST(338.80 AS Decimal(18, 2)), 48, 6, CAST(N'2023-12-09' AS Date))
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Quantity], [UnitPrice], [UnitsInStock], [UnitsInOrder], [Date]) VALUES (N'PRHFWUM4', N'CAR7JFQP', N'target bleeding-edge channels', 38, CAST(194.13 AS Decimal(18, 2)), 29, 11, CAST(N'2023-12-09' AS Date))
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Quantity], [UnitPrice], [UnitsInStock], [UnitsInOrder], [Date]) VALUES (N'PRHJHT1R', N'CA21JNER', N'morph e-business e-markets', 95, CAST(543.90 AS Decimal(18, 2)), 25, 1, CAST(N'2023-12-09' AS Date))
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Quantity], [UnitPrice], [UnitsInStock], [UnitsInOrder], [Date]) VALUES (N'PRI7GUPP', N'CA6158RV', N'enable B2B infrastructures', 33, CAST(379.00 AS Decimal(18, 2)), 4, 7, CAST(N'2023-12-09' AS Date))
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Quantity], [UnitPrice], [UnitsInStock], [UnitsInOrder], [Date]) VALUES (N'PRIG69SE', N'CAMJ61CX', N'seize transparent e-business', 60, CAST(945.86 AS Decimal(18, 2)), 6, 17, CAST(N'2023-12-09' AS Date))
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Quantity], [UnitPrice], [UnitsInStock], [UnitsInOrder], [Date]) VALUES (N'PRIZNA5H', N'CAERO5S1', N'facilitate visionary e-tailers', 94, CAST(9.50 AS Decimal(18, 2)), 14, 19, CAST(N'2023-12-09' AS Date))
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Quantity], [UnitPrice], [UnitsInStock], [UnitsInOrder], [Date]) VALUES (N'PRJD2LB3', N'CAJP736Y', N'harness leading-edge paradigms', 84, CAST(534.04 AS Decimal(18, 2)), 2, 0, CAST(N'2023-12-09' AS Date))
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Quantity], [UnitPrice], [UnitsInStock], [UnitsInOrder], [Date]) VALUES (N'PRJJEVTF', N'CAFVZDYQ', N'brand dot-com portals', 11, CAST(338.47 AS Decimal(18, 2)), 19, 18, CAST(N'2023-12-09' AS Date))
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Quantity], [UnitPrice], [UnitsInStock], [UnitsInOrder], [Date]) VALUES (N'PRKHW06Y', N'CA0NOPDA', N'evolve one-to-one communities', 77, CAST(996.56 AS Decimal(18, 2)), 37, 9, CAST(N'2023-12-09' AS Date))
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Quantity], [UnitPrice], [UnitsInStock], [UnitsInOrder], [Date]) VALUES (N'PRLCSW8H', N'CAERO5S1', N'e-enable plug-and-play ROI', 48, CAST(837.61 AS Decimal(18, 2)), 48, 16, CAST(N'2023-12-09' AS Date))
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Quantity], [UnitPrice], [UnitsInStock], [UnitsInOrder], [Date]) VALUES (N'PRMLKVBQ', N'CADXA5ZO', N'architect compelling solutions', 54, CAST(872.57 AS Decimal(18, 2)), 39, 19, CAST(N'2023-12-09' AS Date))
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Quantity], [UnitPrice], [UnitsInStock], [UnitsInOrder], [Date]) VALUES (N'PRMQ05LR', N'CAFE7U9L', N'reinvent interactive content', 4, CAST(120.50 AS Decimal(18, 2)), 27, 4, CAST(N'2023-12-09' AS Date))
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Quantity], [UnitPrice], [UnitsInStock], [UnitsInOrder], [Date]) VALUES (N'PRMYSLJ4', N'CASAL13H', N'aggregate collaborative applications', 15, CAST(203.36 AS Decimal(18, 2)), 2, 9, CAST(N'2023-12-09' AS Date))
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Quantity], [UnitPrice], [UnitsInStock], [UnitsInOrder], [Date]) VALUES (N'PROLT4ZP', N'CA4Q0X75', N'deliver 24/7 niches', 2, CAST(335.26 AS Decimal(18, 2)), 6, 5, CAST(N'2023-12-09' AS Date))
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Quantity], [UnitPrice], [UnitsInStock], [UnitsInOrder], [Date]) VALUES (N'PRPFVVY7', N'CA0TZCKH', N'envisioneer revolutionary e-services', 46, CAST(271.83 AS Decimal(18, 2)), 31, 16, CAST(N'2023-12-09' AS Date))
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Quantity], [UnitPrice], [UnitsInStock], [UnitsInOrder], [Date]) VALUES (N'PRQFVIPE', N'CA76S287', N'morph web-enabled content', 88, CAST(372.66 AS Decimal(18, 2)), 48, 12, CAST(N'2023-12-09' AS Date))
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Quantity], [UnitPrice], [UnitsInStock], [UnitsInOrder], [Date]) VALUES (N'PRQZO17Z', N'CAI2146S', N'synergize synergistic technologies', 86, CAST(840.14 AS Decimal(18, 2)), 15, 6, CAST(N'2023-12-09' AS Date))
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Quantity], [UnitPrice], [UnitsInStock], [UnitsInOrder], [Date]) VALUES (N'PRRQFBOD', N'CA21JNER', N'incentivize transparent vortals', 41, CAST(631.66 AS Decimal(18, 2)), 16, 12, CAST(N'2023-12-09' AS Date))
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Quantity], [UnitPrice], [UnitsInStock], [UnitsInOrder], [Date]) VALUES (N'PRVBE7EF', N'CAZ7YBKG', N'benchmark rich architectures', 12, CAST(947.39 AS Decimal(18, 2)), 28, 8, CAST(N'2023-12-09' AS Date))
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Quantity], [UnitPrice], [UnitsInStock], [UnitsInOrder], [Date]) VALUES (N'PRWU5ETZ', N'CAC7NN5U', N'whiteboard visionary ROI', 12, CAST(296.35 AS Decimal(18, 2)), 39, 20, CAST(N'2023-12-09' AS Date))
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Quantity], [UnitPrice], [UnitsInStock], [UnitsInOrder], [Date]) VALUES (N'PRYDX80X', N'CA6MB0BH', N'evolve extensible bandwidth', 96, CAST(158.40 AS Decimal(18, 2)), 44, 5, CAST(N'2023-12-09' AS Date))
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Quantity], [UnitPrice], [UnitsInStock], [UnitsInOrder], [Date]) VALUES (N'PRZ3MW6R', N'CAZDG3EO', N'optimize next-generation mindshare', 52, CAST(512.90 AS Decimal(18, 2)), 32, 15, CAST(N'2023-12-09' AS Date))
GO
INSERT [dbo].[Rating] ([RatingID], [UserID], [ProductID], [Rating]) VALUES (N'RA04HSHC', N'US4O0RDT', N'PRBXFCD2', 2)
INSERT [dbo].[Rating] ([RatingID], [UserID], [ProductID], [Rating]) VALUES (N'RA04XSJ7', N'USMGYCUT', N'PRQFVIPE', 3)
INSERT [dbo].[Rating] ([RatingID], [UserID], [ProductID], [Rating]) VALUES (N'RA187JAO', N'USB9DZ0P', N'PRBXFCD2', 5)
INSERT [dbo].[Rating] ([RatingID], [UserID], [ProductID], [Rating]) VALUES (N'RA1OLFAA', N'USZHEYT5', N'PR47SFVF', 2)
INSERT [dbo].[Rating] ([RatingID], [UserID], [ProductID], [Rating]) VALUES (N'RA1VRYKJ', N'USKLRC39', N'PRPFVVY7', 1)
INSERT [dbo].[Rating] ([RatingID], [UserID], [ProductID], [Rating]) VALUES (N'RA222R5S', N'USBHVX1L', N'PR6R65B4', 4)
INSERT [dbo].[Rating] ([RatingID], [UserID], [ProductID], [Rating]) VALUES (N'RA22D81Z', N'US9BC5OH', N'PRHFWUM4', 3)
INSERT [dbo].[Rating] ([RatingID], [UserID], [ProductID], [Rating]) VALUES (N'RA2F3I50', N'US6Y55BI', N'PRPFVVY7', 3)
INSERT [dbo].[Rating] ([RatingID], [UserID], [ProductID], [Rating]) VALUES (N'RA2QPFFN', N'USO1D500', N'PR4MLJT1', 3)
INSERT [dbo].[Rating] ([RatingID], [UserID], [ProductID], [Rating]) VALUES (N'RA3G6W9W', N'USBIOK0G', N'PRMYSLJ4', 5)
INSERT [dbo].[Rating] ([RatingID], [UserID], [ProductID], [Rating]) VALUES (N'RA4222NN', N'US591HMK', N'PR9Y8QAW', 1)
INSERT [dbo].[Rating] ([RatingID], [UserID], [ProductID], [Rating]) VALUES (N'RA4718YO', N'USFV4GT4', N'PRLCSW8H', 3)
INSERT [dbo].[Rating] ([RatingID], [UserID], [ProductID], [Rating]) VALUES (N'RA52ELL3', N'US4PUF90', N'PRYDX80X', 4)
INSERT [dbo].[Rating] ([RatingID], [UserID], [ProductID], [Rating]) VALUES (N'RA536I4T', N'USMPXUMS', N'PRMLKVBQ', 4)
INSERT [dbo].[Rating] ([RatingID], [UserID], [ProductID], [Rating]) VALUES (N'RA55WO2K', N'USMQ5KAL', N'PRRQFBOD', 4)
INSERT [dbo].[Rating] ([RatingID], [UserID], [ProductID], [Rating]) VALUES (N'RA57O4YK', N'USEP8FUE', N'PR6R65B4', 4)
INSERT [dbo].[Rating] ([RatingID], [UserID], [ProductID], [Rating]) VALUES (N'RA5K2CTC', N'USB0RVQ5', N'PR6QOUSW', 4)
INSERT [dbo].[Rating] ([RatingID], [UserID], [ProductID], [Rating]) VALUES (N'RA5SC9M7', N'US2C94LN', N'PRIZNA5H', 1)
INSERT [dbo].[Rating] ([RatingID], [UserID], [ProductID], [Rating]) VALUES (N'RA6BS00K', N'USFXY3CZ', N'PRRQFBOD', 5)
INSERT [dbo].[Rating] ([RatingID], [UserID], [ProductID], [Rating]) VALUES (N'RA6UOCW5', N'USZHEYT5', N'PR6QOUSW', 5)
INSERT [dbo].[Rating] ([RatingID], [UserID], [ProductID], [Rating]) VALUES (N'RA76MNW0', N'US2B02HO', N'PRDTPTL5', 4)
INSERT [dbo].[Rating] ([RatingID], [UserID], [ProductID], [Rating]) VALUES (N'RA7GJTFE', N'USFXY3CZ', N'PR3X1NW2', 3)
INSERT [dbo].[Rating] ([RatingID], [UserID], [ProductID], [Rating]) VALUES (N'RA7S0N4Q', N'USWGJAED', N'PRCA40QD', 5)
INSERT [dbo].[Rating] ([RatingID], [UserID], [ProductID], [Rating]) VALUES (N'RA7UA7NK', N'US591HMK', N'PRVBE7EF', 4)
INSERT [dbo].[Rating] ([RatingID], [UserID], [ProductID], [Rating]) VALUES (N'RA8DMJFM', N'US2UYRMB', N'PRQFVIPE', 2)
INSERT [dbo].[Rating] ([RatingID], [UserID], [ProductID], [Rating]) VALUES (N'RA8EBMDX', N'USWIWNFD', N'PR72YDWG', 3)
INSERT [dbo].[Rating] ([RatingID], [UserID], [ProductID], [Rating]) VALUES (N'RA92KMX4', N'USD26UJU', N'PRYDX80X', 2)
INSERT [dbo].[Rating] ([RatingID], [UserID], [ProductID], [Rating]) VALUES (N'RAA41MVK', N'US4O0RDT', N'PR2YCZZB', 1)
INSERT [dbo].[Rating] ([RatingID], [UserID], [ProductID], [Rating]) VALUES (N'RAA5FJ1R', N'US2B02HO', N'PRZ3MW6R', 2)
INSERT [dbo].[Rating] ([RatingID], [UserID], [ProductID], [Rating]) VALUES (N'RAA90GAT', N'US5RC0EJ', N'PR47SFVF', 4)
INSERT [dbo].[Rating] ([RatingID], [UserID], [ProductID], [Rating]) VALUES (N'RAAHC8W9', N'US5B1OH6', N'PRQZO17Z', 4)
INSERT [dbo].[Rating] ([RatingID], [UserID], [ProductID], [Rating]) VALUES (N'RAALION5', N'USAELGX3', N'PR55HR6V', 1)
INSERT [dbo].[Rating] ([RatingID], [UserID], [ProductID], [Rating]) VALUES (N'RAAM8XP5', N'USLG0J3H', N'PR48S905', 3)
INSERT [dbo].[Rating] ([RatingID], [UserID], [ProductID], [Rating]) VALUES (N'RAASHXUA', N'USKGLUVC', N'PRQZO17Z', 3)
INSERT [dbo].[Rating] ([RatingID], [UserID], [ProductID], [Rating]) VALUES (N'RAB714EX', N'US5UUVHJ', N'PREQ6XZM', 1)
INSERT [dbo].[Rating] ([RatingID], [UserID], [ProductID], [Rating]) VALUES (N'RABEU612', N'USNV9MVH', N'PRH1NH8R', 1)
INSERT [dbo].[Rating] ([RatingID], [UserID], [ProductID], [Rating]) VALUES (N'RABQEU9C', N'USJ37IRI', N'PR6R65B4', 5)
INSERT [dbo].[Rating] ([RatingID], [UserID], [ProductID], [Rating]) VALUES (N'RABRPY0T', N'USMGYCUT', N'PRH1NH8R', 4)
INSERT [dbo].[Rating] ([RatingID], [UserID], [ProductID], [Rating]) VALUES (N'RAC0594C', N'US5RC0EJ', N'PROLT4ZP', 5)
INSERT [dbo].[Rating] ([RatingID], [UserID], [ProductID], [Rating]) VALUES (N'RACD0XPR', N'USD26UJU', N'PRPFVVY7', 1)
INSERT [dbo].[Rating] ([RatingID], [UserID], [ProductID], [Rating]) VALUES (N'RAD2EARO', N'USS1RP4T', N'PR3IJF88', 2)
INSERT [dbo].[Rating] ([RatingID], [UserID], [ProductID], [Rating]) VALUES (N'RADBVN5X', N'USTBOTN3', N'PR7YQX96', 3)
INSERT [dbo].[Rating] ([RatingID], [UserID], [ProductID], [Rating]) VALUES (N'RADDK2EV', N'US7UZICF', N'PRVBE7EF', 3)
INSERT [dbo].[Rating] ([RatingID], [UserID], [ProductID], [Rating]) VALUES (N'RAE3W38H', N'USZYR7VG', N'PR48S905', 5)
INSERT [dbo].[Rating] ([RatingID], [UserID], [ProductID], [Rating]) VALUES (N'RAE5W1BU', N'USZHEYT5', N'PRQFVIPE', 3)
INSERT [dbo].[Rating] ([RatingID], [UserID], [ProductID], [Rating]) VALUES (N'RAEM1XG0', N'USNXP9DZ', N'PRMYSLJ4', 2)
INSERT [dbo].[Rating] ([RatingID], [UserID], [ProductID], [Rating]) VALUES (N'RAEVULG6', N'USWTGCYC', N'PRF5VHY3', 1)
INSERT [dbo].[Rating] ([RatingID], [UserID], [ProductID], [Rating]) VALUES (N'RAEX8RK8', N'USRX8MP4', N'PRIZNA5H', 4)
INSERT [dbo].[Rating] ([RatingID], [UserID], [ProductID], [Rating]) VALUES (N'RAFLWX9U', N'USD26UJU', N'PR9Y8QAW', 5)
INSERT [dbo].[Rating] ([RatingID], [UserID], [ProductID], [Rating]) VALUES (N'RAFS7UWH', N'USWK41BH', N'PRMLKVBQ', 1)
INSERT [dbo].[Rating] ([RatingID], [UserID], [ProductID], [Rating]) VALUES (N'RAG0J9DN', N'USWTGCYC', N'PR3X1NW2', 4)
INSERT [dbo].[Rating] ([RatingID], [UserID], [ProductID], [Rating]) VALUES (N'RAGLPN7Z', N'USFV4GT4', N'PRBXFCD2', 5)
INSERT [dbo].[Rating] ([RatingID], [UserID], [ProductID], [Rating]) VALUES (N'RAGV57EI', N'USTRTN0D', N'PR3IJF88', 2)
INSERT [dbo].[Rating] ([RatingID], [UserID], [ProductID], [Rating]) VALUES (N'RAH3JCIA', N'USMA0P2D', N'PR6CUFDD', 5)
INSERT [dbo].[Rating] ([RatingID], [UserID], [ProductID], [Rating]) VALUES (N'RAHDT0HP', N'USMGYCUT', N'PRQFVIPE', 1)
INSERT [dbo].[Rating] ([RatingID], [UserID], [ProductID], [Rating]) VALUES (N'RAHV9C9V', N'USSO2CX0', N'PRYDX80X', 1)
INSERT [dbo].[Rating] ([RatingID], [UserID], [ProductID], [Rating]) VALUES (N'RAHXLK0C', N'US2B02HO', N'PR4MLJT1', 3)
INSERT [dbo].[Rating] ([RatingID], [UserID], [ProductID], [Rating]) VALUES (N'RAI0SNZR', N'US99BPDK', N'PR08N1DN', 4)
INSERT [dbo].[Rating] ([RatingID], [UserID], [ProductID], [Rating]) VALUES (N'RAIP72PE', N'USKLRC39', N'PR47SFVF', 1)
INSERT [dbo].[Rating] ([RatingID], [UserID], [ProductID], [Rating]) VALUES (N'RAIUO68Z', N'USWGJAED', N'PRQFVIPE', 5)
INSERT [dbo].[Rating] ([RatingID], [UserID], [ProductID], [Rating]) VALUES (N'RAJ3A6CT', N'USJ37IRI', N'PR6CUFDD', 1)
INSERT [dbo].[Rating] ([RatingID], [UserID], [ProductID], [Rating]) VALUES (N'RAJEBSTE', N'US00GOAJ', N'PR7YQX96', 5)
INSERT [dbo].[Rating] ([RatingID], [UserID], [ProductID], [Rating]) VALUES (N'RAJURXYB', N'USDWIVF0', N'PR08N1DN', 4)
INSERT [dbo].[Rating] ([RatingID], [UserID], [ProductID], [Rating]) VALUES (N'RAKBRVPZ', N'US591HMK', N'PRF5VHY3', 1)
INSERT [dbo].[Rating] ([RatingID], [UserID], [ProductID], [Rating]) VALUES (N'RAKXNUEH', N'USRX8MP4', N'PR3IJF88', 5)
INSERT [dbo].[Rating] ([RatingID], [UserID], [ProductID], [Rating]) VALUES (N'RALF0L2O', N'USZHEYT5', N'PRJJEVTF', 3)
INSERT [dbo].[Rating] ([RatingID], [UserID], [ProductID], [Rating]) VALUES (N'RALR6JWD', N'USD26UJU', N'PRMLKVBQ', 2)
INSERT [dbo].[Rating] ([RatingID], [UserID], [ProductID], [Rating]) VALUES (N'RALSPDPC', N'USRX8MP4', N'PR47SFVF', 1)
INSERT [dbo].[Rating] ([RatingID], [UserID], [ProductID], [Rating]) VALUES (N'RAM9EZNR', N'USYSK3L2', N'PR4MLJT1', 1)
INSERT [dbo].[Rating] ([RatingID], [UserID], [ProductID], [Rating]) VALUES (N'RAMXJNL9', N'USMGYCUT', N'PR3X1NW2', 1)
INSERT [dbo].[Rating] ([RatingID], [UserID], [ProductID], [Rating]) VALUES (N'RAMXPFSJ', N'USM99NIG', N'PR3X1NW2', 3)
INSERT [dbo].[Rating] ([RatingID], [UserID], [ProductID], [Rating]) VALUES (N'RANJE04T', N'USB9DZ0P', N'PR2RI8VD', 5)
INSERT [dbo].[Rating] ([RatingID], [UserID], [ProductID], [Rating]) VALUES (N'RAO3NBQY', N'USF4XVT4', N'PR47SFVF', 3)
INSERT [dbo].[Rating] ([RatingID], [UserID], [ProductID], [Rating]) VALUES (N'RAONBTRX', N'USS7U4WD', N'PRCA40QD', 4)
INSERT [dbo].[Rating] ([RatingID], [UserID], [ProductID], [Rating]) VALUES (N'RAOOVJBZ', N'US5RC0EJ', N'PRI7GUPP', 1)
INSERT [dbo].[Rating] ([RatingID], [UserID], [ProductID], [Rating]) VALUES (N'RAP9OHJR', N'USDWIVF0', N'PR4MLJT1', 2)
INSERT [dbo].[Rating] ([RatingID], [UserID], [ProductID], [Rating]) VALUES (N'RAPQOJJO', N'USMGYCUT', N'PR08N1DN', 5)
INSERT [dbo].[Rating] ([RatingID], [UserID], [ProductID], [Rating]) VALUES (N'RAQ1C17X', N'USN1TV67', N'PR6CUFDD', 2)
INSERT [dbo].[Rating] ([RatingID], [UserID], [ProductID], [Rating]) VALUES (N'RAQ3YKWA', N'US9BC5OH', N'PR72YDWG', 5)
INSERT [dbo].[Rating] ([RatingID], [UserID], [ProductID], [Rating]) VALUES (N'RAQQVMIL', N'USLG0J3H', N'PR48S905', 5)
INSERT [dbo].[Rating] ([RatingID], [UserID], [ProductID], [Rating]) VALUES (N'RAQXB0TX', N'US92ZG03', N'PR48S905', 2)
INSERT [dbo].[Rating] ([RatingID], [UserID], [ProductID], [Rating]) VALUES (N'RAQXNR2K', N'US7UZICF', N'PR08N1DN', 2)
INSERT [dbo].[Rating] ([RatingID], [UserID], [ProductID], [Rating]) VALUES (N'RARWIYZ7', N'USZHEYT5', N'PRMLKVBQ', 4)
INSERT [dbo].[Rating] ([RatingID], [UserID], [ProductID], [Rating]) VALUES (N'RASHVFHP', N'USGAX5IO', N'PR72YDWG', 1)
INSERT [dbo].[Rating] ([RatingID], [UserID], [ProductID], [Rating]) VALUES (N'RASJNDWF', N'USGNA1R1', N'PR0S237E', 5)
INSERT [dbo].[Rating] ([RatingID], [UserID], [ProductID], [Rating]) VALUES (N'RAT92NF0', N'USXBDVU0', N'PREEMXXI', 4)
INSERT [dbo].[Rating] ([RatingID], [UserID], [ProductID], [Rating]) VALUES (N'RAU4SMCE', N'USIUACRG', N'PRLCSW8H', 5)
INSERT [dbo].[Rating] ([RatingID], [UserID], [ProductID], [Rating]) VALUES (N'RAUKGDVP', N'USBHVX1L', N'PR0B53W7', 1)
INSERT [dbo].[Rating] ([RatingID], [UserID], [ProductID], [Rating]) VALUES (N'RAVDTW5V', N'USFKJ0V7', N'PR2QE0W5', 3)
INSERT [dbo].[Rating] ([RatingID], [UserID], [ProductID], [Rating]) VALUES (N'RAVT3EG6', N'USTBOTN3', N'PREEMXXI', 5)
INSERT [dbo].[Rating] ([RatingID], [UserID], [ProductID], [Rating]) VALUES (N'RAWAEXA2', N'USYF05XO', N'PR2YCZZB', 3)
INSERT [dbo].[Rating] ([RatingID], [UserID], [ProductID], [Rating]) VALUES (N'RAWY4L3A', N'USS1RP4T', N'PRMQ05LR', 3)
INSERT [dbo].[Rating] ([RatingID], [UserID], [ProductID], [Rating]) VALUES (N'RAXI1JYV', N'USC1UWWQ', N'PRPFVVY7', 2)
INSERT [dbo].[Rating] ([RatingID], [UserID], [ProductID], [Rating]) VALUES (N'RAXYU3B8', N'USTRTN0D', N'PRBNTED2', 3)
INSERT [dbo].[Rating] ([RatingID], [UserID], [ProductID], [Rating]) VALUES (N'RAYR0PA2', N'US4PUF90', N'PRLCSW8H', 3)
INSERT [dbo].[Rating] ([RatingID], [UserID], [ProductID], [Rating]) VALUES (N'RAYXKXC7', N'USF959FG', N'PRHJHT1R', 4)
INSERT [dbo].[Rating] ([RatingID], [UserID], [ProductID], [Rating]) VALUES (N'RAYZEST3', N'USKGLUVC', N'PR3X1NW2', 3)
INSERT [dbo].[Rating] ([RatingID], [UserID], [ProductID], [Rating]) VALUES (N'RAZCUIOX', N'US2C94LN', N'PRBXFCD2', 1)
INSERT [dbo].[Rating] ([RatingID], [UserID], [ProductID], [Rating]) VALUES (N'RAZQ2XW1', N'US7UZICF', N'PRKHW06Y', 5)
INSERT [dbo].[Rating] ([RatingID], [UserID], [ProductID], [Rating]) VALUES (N'RAZXMB54', N'USS7U4WD', N'PR6CUFDD', 3)
GO
INSERT [dbo].[Sellers] ([SellerID], [UserID], [USER_TYPE], [CompanyName], [Phone], [Email]) VALUES (N'SEC5R4Z9', N'US356HAX', N'S', N'Jordan LLC', N'001-982-859-520', N'zcosta@example.com')
INSERT [dbo].[Sellers] ([SellerID], [UserID], [USER_TYPE], [CompanyName], [Phone], [Email]) VALUES (N'SEZ45EN6', N'US4O0RDT', N'S', N'Mendoza LLC', N'001-332-528-008', N'hendersonangela@example.org')
INSERT [dbo].[Sellers] ([SellerID], [UserID], [USER_TYPE], [CompanyName], [Phone], [Email]) VALUES (N'SEDJY6ED', N'US5D70P2', N'S', N'Brady-Graham', N'850-229-5879', N'pateltyrone@example.com')
INSERT [dbo].[Sellers] ([SellerID], [UserID], [USER_TYPE], [CompanyName], [Phone], [Email]) VALUES (N'SEAUUIQK', N'US6Y55BI', N'S', N'Allen Inc', N'001-383-964-231', N'susansnow@example.org')
INSERT [dbo].[Sellers] ([SellerID], [UserID], [USER_TYPE], [CompanyName], [Phone], [Email]) VALUES (N'SEV1CAOA', N'US7UZICF', N'S', N'Davis-Potter', N'655.811.8620', N'stephanie82@example.com')
INSERT [dbo].[Sellers] ([SellerID], [UserID], [USER_TYPE], [CompanyName], [Phone], [Email]) VALUES (N'SEWX8J1O', N'US92ZG03', N'S', N'Stevenson-Kelly', N'282.668.4281x94', N'nicole74@example.net')
INSERT [dbo].[Sellers] ([SellerID], [UserID], [USER_TYPE], [CompanyName], [Phone], [Email]) VALUES (N'SE7PPF2C', N'US9BC5OH', N'S', N'Long Ltd', N'001-450-825-608', N'fbrown@example.org')
INSERT [dbo].[Sellers] ([SellerID], [UserID], [USER_TYPE], [CompanyName], [Phone], [Email]) VALUES (N'SE6QDJ6P', N'USB0RVQ5', N'S', N'Rivera-Hernandez', N'+1-659-598-5399', N'lisapeterson@example.net')
INSERT [dbo].[Sellers] ([SellerID], [UserID], [USER_TYPE], [CompanyName], [Phone], [Email]) VALUES (N'SEYR5BPU', N'USB9DZ0P', N'S', N'Ferrell-Burke', N'001-562-275-963', N'dmueller@example.com')
INSERT [dbo].[Sellers] ([SellerID], [UserID], [USER_TYPE], [CompanyName], [Phone], [Email]) VALUES (N'SEVP9HD8', N'USBHVX1L', N'S', N'Adams Ltd', N'418.590.4605', N'mccormickchristopher@example.org')
INSERT [dbo].[Sellers] ([SellerID], [UserID], [USER_TYPE], [CompanyName], [Phone], [Email]) VALUES (N'SEJ86A36', N'USD4DQ4O', N'S', N'Daniels, Bowman and Wilkerson', N'001-542-650-287', N'bfoster@example.com')
INSERT [dbo].[Sellers] ([SellerID], [UserID], [USER_TYPE], [CompanyName], [Phone], [Email]) VALUES (N'SEQE5FAR', N'USEP8FUE', N'S', N'Meadows, Lopez and Golden', N'331.922.1401', N'alexischase@example.org')
INSERT [dbo].[Sellers] ([SellerID], [UserID], [USER_TYPE], [CompanyName], [Phone], [Email]) VALUES (N'SEOIXBGA', N'USF4XVT4', N'S', N'Montoya Group', N'001-261-606-011', N'joshuacunningham@example.net')
INSERT [dbo].[Sellers] ([SellerID], [UserID], [USER_TYPE], [CompanyName], [Phone], [Email]) VALUES (N'SEXVJYZ5', N'USFO2TNF', N'S', N'Murphy-Williams', N'793-536-6926x24', N'davislinda@example.org')
INSERT [dbo].[Sellers] ([SellerID], [UserID], [USER_TYPE], [CompanyName], [Phone], [Email]) VALUES (N'SEYW5NDP', N'USGNA1R1', N'S', N'Shaw, Whitaker and Fitzpatrick', N'+1-210-834-3672', N'lbaker@example.net')
INSERT [dbo].[Sellers] ([SellerID], [UserID], [USER_TYPE], [CompanyName], [Phone], [Email]) VALUES (N'SETS1RW4', N'USIQTJHO', N'S', N'Montoya Group', N'2198022492', N'dreese@example.net')
INSERT [dbo].[Sellers] ([SellerID], [UserID], [USER_TYPE], [CompanyName], [Phone], [Email]) VALUES (N'SEXEMLRS', N'USIUACRG', N'S', N'Saunders-Williams', N'(479)262-4103', N'wrightsavannah@example.org')
INSERT [dbo].[Sellers] ([SellerID], [UserID], [USER_TYPE], [CompanyName], [Phone], [Email]) VALUES (N'SEEP1VPR', N'USLG0J3H', N'S', N'Roberts Ltd', N'8303069949', N'dianelee@example.com')
INSERT [dbo].[Sellers] ([SellerID], [UserID], [USER_TYPE], [CompanyName], [Phone], [Email]) VALUES (N'SEPK9E6S', N'USM4IBC1', N'S', N'Riddle PLC', N'915-545-2885', N'qmiller@example.org')
INSERT [dbo].[Sellers] ([SellerID], [UserID], [USER_TYPE], [CompanyName], [Phone], [Email]) VALUES (N'SEIL5LA5', N'USN1TV67', N'S', N'Bennett, Allen and Anderson', N'001-968-505-859', N'jessica06@example.com')
INSERT [dbo].[Sellers] ([SellerID], [UserID], [USER_TYPE], [CompanyName], [Phone], [Email]) VALUES (N'SEHW14BW', N'USORZ3PS', N'S', N'Murphy, Williams and Cook', N'4795025279', N'meganmartinez@example.org')
INSERT [dbo].[Sellers] ([SellerID], [UserID], [USER_TYPE], [CompanyName], [Phone], [Email]) VALUES (N'SEPLIPXD', N'USQRAS8P', N'S', N'Hernandez Ltd', N'4714246598', N'owenjacqueline@example.org')
INSERT [dbo].[Sellers] ([SellerID], [UserID], [USER_TYPE], [CompanyName], [Phone], [Email]) VALUES (N'SE35VG0R', N'USS7U4WD', N'S', N'Smith, Martin and Hall', N'788-595-6502x08', N'munozerik@example.net')
INSERT [dbo].[Sellers] ([SellerID], [UserID], [USER_TYPE], [CompanyName], [Phone], [Email]) VALUES (N'SE32HERQ', N'USTRTN0D', N'S', N'Jones-Silva', N'(349)741-5241x0', N'yvillarreal@example.org')
INSERT [dbo].[Sellers] ([SellerID], [UserID], [USER_TYPE], [CompanyName], [Phone], [Email]) VALUES (N'SE2WQ25K', N'USW14XAB', N'S', N'Manning-Patton', N'+1-763-502-5681', N'ttorres@example.org')
INSERT [dbo].[Sellers] ([SellerID], [UserID], [USER_TYPE], [CompanyName], [Phone], [Email]) VALUES (N'SEI4JZ5O', N'USW3IO6P', N'S', N'Shelton and Sons', N'7539947448', N'jessicamartin@example.net')
INSERT [dbo].[Sellers] ([SellerID], [UserID], [USER_TYPE], [CompanyName], [Phone], [Email]) VALUES (N'SE3XK4Y6', N'USWDZFQX', N'S', N'Schmitt, Mata and King', N'001-365-650-056', N'kimberly90@example.net')
INSERT [dbo].[Sellers] ([SellerID], [UserID], [USER_TYPE], [CompanyName], [Phone], [Email]) VALUES (N'SE6XXRBE', N'USWGJAED', N'S', N'Roach, Wilson and Johnson', N'(568)440-4964', N'christineblanchard@example.com')
INSERT [dbo].[Sellers] ([SellerID], [UserID], [USER_TYPE], [CompanyName], [Phone], [Email]) VALUES (N'SEF18N69', N'USWIWNFD', N'S', N'Carey-Roberts', N'557-855-3558x60', N'christina42@example.net')
INSERT [dbo].[Sellers] ([SellerID], [UserID], [USER_TYPE], [CompanyName], [Phone], [Email]) VALUES (N'SENYEC5S', N'USWK41BH', N'S', N'Brown LLC', N'8379397714', N'wallacenoah@example.org')
INSERT [dbo].[Sellers] ([SellerID], [UserID], [USER_TYPE], [CompanyName], [Phone], [Email]) VALUES (N'SE570WRZ', N'USXBDVU0', N'S', N'Moore-Moore', N'597-851-1396x75', N'lawrencebell@example.net')
INSERT [dbo].[Sellers] ([SellerID], [UserID], [USER_TYPE], [CompanyName], [Phone], [Email]) VALUES (N'SECKWPYK', N'USYSK3L2', N'S', N'Berg-Lewis', N'836-837-6119', N'judy91@example.org')
GO
INSERT [dbo].[Shipper] ([ShipperID], [ShipperName], [ContactName], [Phone]) VALUES (N'SH0BPEJ2', N'Herrera, Moore and Carter', N'Matthew Sullivan', N'001-273-551-313')
INSERT [dbo].[Shipper] ([ShipperID], [ShipperName], [ContactName], [Phone]) VALUES (N'SH2NJUTD', N'Miller-Banks', N'Ryan Marquez', N'+1-303-716-0916')
INSERT [dbo].[Shipper] ([ShipperID], [ShipperName], [ContactName], [Phone]) VALUES (N'SH32696O', N'Barnett, Pugh and Whitaker', N'Austin Benton', N'525-981-4475x71')
INSERT [dbo].[Shipper] ([ShipperID], [ShipperName], [ContactName], [Phone]) VALUES (N'SH5DUUV4', N'Copeland, Grant and Franklin', N'Jose Flores', N'+1-769-574-5513')
INSERT [dbo].[Shipper] ([ShipperID], [ShipperName], [ContactName], [Phone]) VALUES (N'SHBYN0S0', N'Sharp-Clark', N'Jennifer Edwards', N'+1-874-374-7370')
INSERT [dbo].[Shipper] ([ShipperID], [ShipperName], [ContactName], [Phone]) VALUES (N'SHBZ0BM7', N'Carr LLC', N'Christopher Andrade', N'(589)233-5119x2')
INSERT [dbo].[Shipper] ([ShipperID], [ShipperName], [ContactName], [Phone]) VALUES (N'SHE2NQX4', N'Foley-Webb', N'Jill Kim', N'(699)752-1982')
INSERT [dbo].[Shipper] ([ShipperID], [ShipperName], [ContactName], [Phone]) VALUES (N'SHEX1NRH', N'Atkinson Inc', N'Katherine Lawson', N'(857)302-1004')
INSERT [dbo].[Shipper] ([ShipperID], [ShipperName], [ContactName], [Phone]) VALUES (N'SHGNGWPM', N'Robertson, Castillo and Shaw', N'Ronald Myers', N'880.573.2272x86')
INSERT [dbo].[Shipper] ([ShipperID], [ShipperName], [ContactName], [Phone]) VALUES (N'SHIDEJUW', N'Oliver, Pruitt and Hampton', N'Erin Wells', N'466.861.6643')
INSERT [dbo].[Shipper] ([ShipperID], [ShipperName], [ContactName], [Phone]) VALUES (N'SHMOCTNT', N'Oliver Group', N'Shawna Johnson', N'527-642-5833x06')
INSERT [dbo].[Shipper] ([ShipperID], [ShipperName], [ContactName], [Phone]) VALUES (N'SHPKFYJW', N'Whitaker-Brown', N'Tony Weaver', N'619.324.2552')
INSERT [dbo].[Shipper] ([ShipperID], [ShipperName], [ContactName], [Phone]) VALUES (N'SHSQUVIX', N'Castillo, Willis and Thomas', N'Brittany Hood', N'354.329.1572x49')
INSERT [dbo].[Shipper] ([ShipperID], [ShipperName], [ContactName], [Phone]) VALUES (N'SHTHDWTK', N'Rivers PLC', N'Alyssa Myers', N'737-503-0972')
INSERT [dbo].[Shipper] ([ShipperID], [ShipperName], [ContactName], [Phone]) VALUES (N'SHTPICM2', N'Kelly Inc', N'Jonathan Love MD', N'809.764.1242x67')
INSERT [dbo].[Shipper] ([ShipperID], [ShipperName], [ContactName], [Phone]) VALUES (N'SHW1T12A', N'Adams PLC', N'Christine Welch', N'848.971.1565x01')
INSERT [dbo].[Shipper] ([ShipperID], [ShipperName], [ContactName], [Phone]) VALUES (N'SHWCS99F', N'Arnold, Edwards and Dixon', N'Roy Dickson', N'(593)281-3711x0')
INSERT [dbo].[Shipper] ([ShipperID], [ShipperName], [ContactName], [Phone]) VALUES (N'SHY1QWUY', N'Carter LLC', N'Timothy Turner', N'6274072660')
INSERT [dbo].[Shipper] ([ShipperID], [ShipperName], [ContactName], [Phone]) VALUES (N'SHY5PSPQ', N'Orr and Sons', N'Kristopher Jones', N'001-685-511-113')
INSERT [dbo].[Shipper] ([ShipperID], [ShipperName], [ContactName], [Phone]) VALUES (N'SHZ41CE4', N'Grimes LLC', N'Jose Estes', N'+1-308-564-9785')
GO
INSERT [dbo].[ShoppingCart] ([ShoppingCartID], [UserID], [ProductID], [ItemQuantity], [ItemStatus], [ShoppingStatus]) VALUES (N'SC04345X', N'USXBDVU0', N'PR55HR6V', 63, N'Out of Stock', N'Order Pending')
INSERT [dbo].[ShoppingCart] ([ShoppingCartID], [UserID], [ProductID], [ItemQuantity], [ItemStatus], [ShoppingStatus]) VALUES (N'SC0SFUZV', N'USA32O5E', N'PR3X1NW2', 65, N'Available', N'Order Placed')
INSERT [dbo].[ShoppingCart] ([ShoppingCartID], [UserID], [ProductID], [ItemQuantity], [ItemStatus], [ShoppingStatus]) VALUES (N'SC1UAO5B', N'USC2MGYF', N'PRJJEVTF', 81, N'Available', N'Order Pending')
INSERT [dbo].[ShoppingCart] ([ShoppingCartID], [UserID], [ProductID], [ItemQuantity], [ItemStatus], [ShoppingStatus]) VALUES (N'SC201N0M', N'US00GOAJ', N'PR9Y8QAW', 78, N'Out of Stock', N'Order Pending')
INSERT [dbo].[ShoppingCart] ([ShoppingCartID], [UserID], [ProductID], [ItemQuantity], [ItemStatus], [ShoppingStatus]) VALUES (N'SC32KQF8', N'US5D70P2', N'PRHFWUM4', 77, N'Out of Stock', N'Order Pending')
INSERT [dbo].[ShoppingCart] ([ShoppingCartID], [UserID], [ProductID], [ItemQuantity], [ItemStatus], [ShoppingStatus]) VALUES (N'SC3K6EC8', N'USS1RP4T', N'PR55HR6V', 72, N'Out of Stock', N'Order Pending')
INSERT [dbo].[ShoppingCart] ([ShoppingCartID], [UserID], [ProductID], [ItemQuantity], [ItemStatus], [ShoppingStatus]) VALUES (N'SC3OJBI2', N'US6Y55BI', N'PR55HR6V', 20, N'Out of Stock', N'Order Placed')
INSERT [dbo].[ShoppingCart] ([ShoppingCartID], [UserID], [ProductID], [ItemQuantity], [ItemStatus], [ShoppingStatus]) VALUES (N'SC5MRY75', N'USF4XVT4', N'PRI7GUPP', 52, N'Available', N'Order Placed')
INSERT [dbo].[ShoppingCart] ([ShoppingCartID], [UserID], [ProductID], [ItemQuantity], [ItemStatus], [ShoppingStatus]) VALUES (N'SC5N24G8', N'USA32O5E', N'PRCT68ZT', 88, N'Available', N'Order Pending')
INSERT [dbo].[ShoppingCart] ([ShoppingCartID], [UserID], [ProductID], [ItemQuantity], [ItemStatus], [ShoppingStatus]) VALUES (N'SC8ANHO6', N'USC1UWWQ', N'PREEMXXI', 62, N'Available', N'Order Placed')
INSERT [dbo].[ShoppingCart] ([ShoppingCartID], [UserID], [ProductID], [ItemQuantity], [ItemStatus], [ShoppingStatus]) VALUES (N'SC8TYXNU', N'USWGJAED', N'PRMYSLJ4', 24, N'Available', N'Order Placed')
INSERT [dbo].[ShoppingCart] ([ShoppingCartID], [UserID], [ProductID], [ItemQuantity], [ItemStatus], [ShoppingStatus]) VALUES (N'SC9S0V67', N'USO1D500', N'PRKHW06Y', 20, N'Available', N'Order Placed')
INSERT [dbo].[ShoppingCart] ([ShoppingCartID], [UserID], [ProductID], [ItemQuantity], [ItemStatus], [ShoppingStatus]) VALUES (N'SCAPIEQF', N'USWGJAED', N'PRH255HD', 50, N'Available', N'Order Pending')
INSERT [dbo].[ShoppingCart] ([ShoppingCartID], [UserID], [ProductID], [ItemQuantity], [ItemStatus], [ShoppingStatus]) VALUES (N'SCBNCZAB', N'USB0RVQ5', N'PRI7GUPP', 17, N'Available', N'Order Placed')
INSERT [dbo].[ShoppingCart] ([ShoppingCartID], [UserID], [ProductID], [ItemQuantity], [ItemStatus], [ShoppingStatus]) VALUES (N'SCD47L8K', N'USSO2CX0', N'PRJD2LB3', 67, N'Available', N'Order Placed')
INSERT [dbo].[ShoppingCart] ([ShoppingCartID], [UserID], [ProductID], [ItemQuantity], [ItemStatus], [ShoppingStatus]) VALUES (N'SCD78C7X', N'USXBDVU0', N'PR6CUFDD', 46, N'Out of Stock', N'Order Placed')
INSERT [dbo].[ShoppingCart] ([ShoppingCartID], [UserID], [ProductID], [ItemQuantity], [ItemStatus], [ShoppingStatus]) VALUES (N'SCDZYFUB', N'US1RRDPX', N'PRRQFBOD', 11, N'Available', N'Order Placed')
INSERT [dbo].[ShoppingCart] ([ShoppingCartID], [UserID], [ProductID], [ItemQuantity], [ItemStatus], [ShoppingStatus]) VALUES (N'SCEDDJ2Y', N'USKGK5J9', N'PRPFVVY7', 23, N'Out of Stock', N'Order Pending')
INSERT [dbo].[ShoppingCart] ([ShoppingCartID], [UserID], [ProductID], [ItemQuantity], [ItemStatus], [ShoppingStatus]) VALUES (N'SCF8YLD1', N'USR3IIE1', N'PR55HR6V', 7, N'Available', N'Order Placed')
INSERT [dbo].[ShoppingCart] ([ShoppingCartID], [UserID], [ProductID], [ItemQuantity], [ItemStatus], [ShoppingStatus]) VALUES (N'SCHEF261', N'USWK41BH', N'PR2RI8VD', 89, N'Out of Stock', N'Order Pending')
INSERT [dbo].[ShoppingCart] ([ShoppingCartID], [UserID], [ProductID], [ItemQuantity], [ItemStatus], [ShoppingStatus]) VALUES (N'SCHGQQ83', N'USA32O5E', N'PRMQ05LR', 42, N'Available', N'Order Placed')
INSERT [dbo].[ShoppingCart] ([ShoppingCartID], [UserID], [ProductID], [ItemQuantity], [ItemStatus], [ShoppingStatus]) VALUES (N'SCHXR4JC', N'USYSK3L2', N'PR0B53W7', 11, N'Available', N'Order Placed')
INSERT [dbo].[ShoppingCart] ([ShoppingCartID], [UserID], [ProductID], [ItemQuantity], [ItemStatus], [ShoppingStatus]) VALUES (N'SCID696O', N'US4O0RDT', N'PRMQ05LR', 78, N'Out of Stock', N'Order Placed')
INSERT [dbo].[ShoppingCart] ([ShoppingCartID], [UserID], [ProductID], [ItemQuantity], [ItemStatus], [ShoppingStatus]) VALUES (N'SCJN9PBN', N'USB0RVQ5', N'PR2QE0W5', 63, N'Out of Stock', N'Order Pending')
INSERT [dbo].[ShoppingCart] ([ShoppingCartID], [UserID], [ProductID], [ItemQuantity], [ItemStatus], [ShoppingStatus]) VALUES (N'SCJY8RGZ', N'US0LGEXF', N'PREQ6XZM', 35, N'Available', N'Order Pending')
INSERT [dbo].[ShoppingCart] ([ShoppingCartID], [UserID], [ProductID], [ItemQuantity], [ItemStatus], [ShoppingStatus]) VALUES (N'SCK9H1FX', N'USLG0J3H', N'PRRQFBOD', 2, N'Out of Stock', N'Order Placed')
INSERT [dbo].[ShoppingCart] ([ShoppingCartID], [UserID], [ProductID], [ItemQuantity], [ItemStatus], [ShoppingStatus]) VALUES (N'SCKF7R05', N'USB9DZ0P', N'PRI7GUPP', 16, N'Available', N'Order Placed')
INSERT [dbo].[ShoppingCart] ([ShoppingCartID], [UserID], [ProductID], [ItemQuantity], [ItemStatus], [ShoppingStatus]) VALUES (N'SCKW45BZ', N'USB638A9', N'PR2YCZZB', 9, N'Out of Stock', N'Order Pending')
INSERT [dbo].[ShoppingCart] ([ShoppingCartID], [UserID], [ProductID], [ItemQuantity], [ItemStatus], [ShoppingStatus]) VALUES (N'SCL8QLGU', N'USIUO465', N'PRJD2LB3', 80, N'Out of Stock', N'Order Pending')
INSERT [dbo].[ShoppingCart] ([ShoppingCartID], [UserID], [ProductID], [ItemQuantity], [ItemStatus], [ShoppingStatus]) VALUES (N'SCLF68DR', N'USN1TV67', N'PR3X1NW2', 33, N'Out of Stock', N'Order Placed')
INSERT [dbo].[ShoppingCart] ([ShoppingCartID], [UserID], [ProductID], [ItemQuantity], [ItemStatus], [ShoppingStatus]) VALUES (N'SCM0B0BG', N'US5RC0EJ', N'PRPFVVY7', 77, N'Out of Stock', N'Order Placed')
INSERT [dbo].[ShoppingCart] ([ShoppingCartID], [UserID], [ProductID], [ItemQuantity], [ItemStatus], [ShoppingStatus]) VALUES (N'SCM8O55W', N'USMPXUMS', N'PRHFWUM4', 53, N'Available', N'Order Pending')
INSERT [dbo].[ShoppingCart] ([ShoppingCartID], [UserID], [ProductID], [ItemQuantity], [ItemStatus], [ShoppingStatus]) VALUES (N'SCO72COB', N'US0LGEXF', N'PRQZO17Z', 9, N'Out of Stock', N'Order Placed')
INSERT [dbo].[ShoppingCart] ([ShoppingCartID], [UserID], [ProductID], [ItemQuantity], [ItemStatus], [ShoppingStatus]) VALUES (N'SCOWXAMC', N'US2C94LN', N'PR08N1DN', 79, N'Available', N'Order Pending')
INSERT [dbo].[ShoppingCart] ([ShoppingCartID], [UserID], [ProductID], [ItemQuantity], [ItemStatus], [ShoppingStatus]) VALUES (N'SCQ02K0J', N'US1QRY8A', N'PR4DQ9LA', 43, N'Available', N'Order Placed')
INSERT [dbo].[ShoppingCart] ([ShoppingCartID], [UserID], [ProductID], [ItemQuantity], [ItemStatus], [ShoppingStatus]) VALUES (N'SCQ5K4PL', N'US356HAX', N'PRCA40QD', 37, N'Out of Stock', N'Order Pending')
INSERT [dbo].[ShoppingCart] ([ShoppingCartID], [UserID], [ProductID], [ItemQuantity], [ItemStatus], [ShoppingStatus]) VALUES (N'SCQXL9SD', N'USKGLUVC', N'PRRQFBOD', 13, N'Available', N'Order Placed')
INSERT [dbo].[ShoppingCart] ([ShoppingCartID], [UserID], [ProductID], [ItemQuantity], [ItemStatus], [ShoppingStatus]) VALUES (N'SCRTP724', N'US56W6GR', N'PRF5VHY3', 91, N'Available', N'Order Placed')
INSERT [dbo].[ShoppingCart] ([ShoppingCartID], [UserID], [ProductID], [ItemQuantity], [ItemStatus], [ShoppingStatus]) VALUES (N'SCRXW8G4', N'USO1D500', N'PRBXFCD2', 35, N'Available', N'Order Placed')
INSERT [dbo].[ShoppingCart] ([ShoppingCartID], [UserID], [ProductID], [ItemQuantity], [ItemStatus], [ShoppingStatus]) VALUES (N'SCTCGC95', N'US0LGEXF', N'PRVBE7EF', 74, N'Available', N'Order Pending')
INSERT [dbo].[ShoppingCart] ([ShoppingCartID], [UserID], [ProductID], [ItemQuantity], [ItemStatus], [ShoppingStatus]) VALUES (N'SCVL9FJN', N'US4PUF90', N'PRHFWUM4', 87, N'Available', N'Order Pending')
INSERT [dbo].[ShoppingCart] ([ShoppingCartID], [UserID], [ProductID], [ItemQuantity], [ItemStatus], [ShoppingStatus]) VALUES (N'SCVO8OZ2', N'USYDP80R', N'PRMQ05LR', 100, N'Out of Stock', N'Order Placed')
INSERT [dbo].[ShoppingCart] ([ShoppingCartID], [UserID], [ProductID], [ItemQuantity], [ItemStatus], [ShoppingStatus]) VALUES (N'SCVTLEQF', N'USIUO465', N'PRF5VHY3', 72, N'Out of Stock', N'Order Pending')
INSERT [dbo].[ShoppingCart] ([ShoppingCartID], [UserID], [ProductID], [ItemQuantity], [ItemStatus], [ShoppingStatus]) VALUES (N'SCVYOYLM', N'USF959FG', N'PRJD2LB3', 72, N'Out of Stock', N'Order Placed')
INSERT [dbo].[ShoppingCart] ([ShoppingCartID], [UserID], [ProductID], [ItemQuantity], [ItemStatus], [ShoppingStatus]) VALUES (N'SCWIDC3Q', N'USC2MGYF', N'PRDTPTL5', 28, N'Out of Stock', N'Order Pending')
INSERT [dbo].[ShoppingCart] ([ShoppingCartID], [UserID], [ProductID], [ItemQuantity], [ItemStatus], [ShoppingStatus]) VALUES (N'SCWLGCI1', N'USD2STY0', N'PRRQFBOD', 3, N'Out of Stock', N'Order Pending')
INSERT [dbo].[ShoppingCart] ([ShoppingCartID], [UserID], [ProductID], [ItemQuantity], [ItemStatus], [ShoppingStatus]) VALUES (N'SCWVBQ31', N'USKLRC39', N'PRHJHT1R', 17, N'Out of Stock', N'Order Pending')
INSERT [dbo].[ShoppingCart] ([ShoppingCartID], [UserID], [ProductID], [ItemQuantity], [ItemStatus], [ShoppingStatus]) VALUES (N'SCWVCT83', N'US591HMK', N'PR3IJF88', 53, N'Available', N'Order Pending')
INSERT [dbo].[ShoppingCart] ([ShoppingCartID], [UserID], [ProductID], [ItemQuantity], [ItemStatus], [ShoppingStatus]) VALUES (N'SCYAJ7JW', N'USB638A9', N'PR9Y8QAW', 49, N'Out of Stock', N'Order Pending')
INSERT [dbo].[ShoppingCart] ([ShoppingCartID], [UserID], [ProductID], [ItemQuantity], [ItemStatus], [ShoppingStatus]) VALUES (N'SCYOQZLU', N'USKGK5J9', N'PR08N1DN', 79, N'Available', N'Order Pending')
GO
INSERT [dbo].[Users] ([UserID], [UserFName], [UserLName], [USER_TYPE], [Password], [DateCreated]) VALUES (N'US00GOAJ', N'Rachel', N'Bell', N'C', N'3)fkDbns^G', CAST(N'2021-01-01' AS Date))
INSERT [dbo].[Users] ([UserID], [UserFName], [UserLName], [USER_TYPE], [Password], [DateCreated]) VALUES (N'US0LGEXF', N'Angela', N'Ortiz', N'C', N'Q^XqQE_9(0', CAST(N'2021-02-23' AS Date))
INSERT [dbo].[Users] ([UserID], [UserFName], [UserLName], [USER_TYPE], [Password], [DateCreated]) VALUES (N'US0ZQQQS', N'Karen', N'Hawkins', N'C', N'1+deM8Zg$U', CAST(N'2021-07-17' AS Date))
INSERT [dbo].[Users] ([UserID], [UserFName], [UserLName], [USER_TYPE], [Password], [DateCreated]) VALUES (N'US1QRY8A', N'Jon', N'Shepard', N'C', N'QkXhqh5c)0', CAST(N'2021-07-15' AS Date))
INSERT [dbo].[Users] ([UserID], [UserFName], [UserLName], [USER_TYPE], [Password], [DateCreated]) VALUES (N'US1RRDPX', N'Russell', N'Kim', N'B', N'&ILWo8HNC0', CAST(N'2020-11-07' AS Date))
INSERT [dbo].[Users] ([UserID], [UserFName], [UserLName], [USER_TYPE], [Password], [DateCreated]) VALUES (N'US2B02HO', N'Daniel', N'Schmidt', N'B', N'#4Qn*8JW1c', CAST(N'2023-10-29' AS Date))
INSERT [dbo].[Users] ([UserID], [UserFName], [UserLName], [USER_TYPE], [Password], [DateCreated]) VALUES (N'US2C94LN', N'Heather', N'Monroe', N'C', N't6*7lRg&+x', CAST(N'2021-01-17' AS Date))
INSERT [dbo].[Users] ([UserID], [UserFName], [UserLName], [USER_TYPE], [Password], [DateCreated]) VALUES (N'US2UYRMB', N'Jack', N'Anderson', N'C', N'#X9E$Lrzi2', CAST(N'2023-12-02' AS Date))
INSERT [dbo].[Users] ([UserID], [UserFName], [UserLName], [USER_TYPE], [Password], [DateCreated]) VALUES (N'US356HAX', N'Regina', N'Mitchell', N'S', N'N8T7TKuJN_', CAST(N'2020-12-08' AS Date))
INSERT [dbo].[Users] ([UserID], [UserFName], [UserLName], [USER_TYPE], [Password], [DateCreated]) VALUES (N'US4O0RDT', N'William', N'Deleon', N'S', N'*wTxxntJc2', CAST(N'2021-02-05' AS Date))
INSERT [dbo].[Users] ([UserID], [UserFName], [UserLName], [USER_TYPE], [Password], [DateCreated]) VALUES (N'US4PUF90', N'Rachael', N'Soto', N'B', N't1YWMRzf+E', CAST(N'2021-08-08' AS Date))
INSERT [dbo].[Users] ([UserID], [UserFName], [UserLName], [USER_TYPE], [Password], [DateCreated]) VALUES (N'US4WLX8G', N'Evan', N'Jones', N'B', N'bX3EYYTk_Z', CAST(N'2021-02-14' AS Date))
INSERT [dbo].[Users] ([UserID], [UserFName], [UserLName], [USER_TYPE], [Password], [DateCreated]) VALUES (N'US56W6GR', N'Isaac', N'Brennan', N'C', N'_xAd1isH$9', CAST(N'2019-08-17' AS Date))
INSERT [dbo].[Users] ([UserID], [UserFName], [UserLName], [USER_TYPE], [Password], [DateCreated]) VALUES (N'US591HMK', N'Lauren', N'Perez', N'B', N'WE_4MaIz8Z', CAST(N'2023-03-19' AS Date))
INSERT [dbo].[Users] ([UserID], [UserFName], [UserLName], [USER_TYPE], [Password], [DateCreated]) VALUES (N'US5B1OH6', N'Dennis', N'Summers', N'C', N'&hQj^*^gO3', CAST(N'2023-11-01' AS Date))
INSERT [dbo].[Users] ([UserID], [UserFName], [UserLName], [USER_TYPE], [Password], [DateCreated]) VALUES (N'US5D70P2', N'Philip', N'Bell', N'S', N')7kHYZTf0S', CAST(N'2019-10-01' AS Date))
INSERT [dbo].[Users] ([UserID], [UserFName], [UserLName], [USER_TYPE], [Password], [DateCreated]) VALUES (N'US5RC0EJ', N'Michael', N'Alexander', N'B', N'4aCaXl5i!4', CAST(N'2023-11-30' AS Date))
INSERT [dbo].[Users] ([UserID], [UserFName], [UserLName], [USER_TYPE], [Password], [DateCreated]) VALUES (N'US5UUVHJ', N'Brent', N'Henry', N'B', N'7_9%4sFv63', CAST(N'2021-08-17' AS Date))
INSERT [dbo].[Users] ([UserID], [UserFName], [UserLName], [USER_TYPE], [Password], [DateCreated]) VALUES (N'US6Y55BI', N'Jeffrey', N'English', N'S', N'fSTyXis&#9', CAST(N'2019-01-05' AS Date))
INSERT [dbo].[Users] ([UserID], [UserFName], [UserLName], [USER_TYPE], [Password], [DateCreated]) VALUES (N'US7CEEHO', N'Kevin', N'Johnson', N'C', N'(9sfrM(c36', CAST(N'2021-09-26' AS Date))
INSERT [dbo].[Users] ([UserID], [UserFName], [UserLName], [USER_TYPE], [Password], [DateCreated]) VALUES (N'US7UZICF', N'Diana', N'Roth', N'S', N'Z##jB5Zitt', CAST(N'2023-01-30' AS Date))
INSERT [dbo].[Users] ([UserID], [UserFName], [UserLName], [USER_TYPE], [Password], [DateCreated]) VALUES (N'US92ZG03', N'Sandra', N'Morgan', N'S', N'hPNip9%1&7', CAST(N'2023-06-10' AS Date))
INSERT [dbo].[Users] ([UserID], [UserFName], [UserLName], [USER_TYPE], [Password], [DateCreated]) VALUES (N'US99BPDK', N'Amanda', N'Sanchez', N'C', N'pf_3Z)Jn@+', CAST(N'2021-08-22' AS Date))
INSERT [dbo].[Users] ([UserID], [UserFName], [UserLName], [USER_TYPE], [Password], [DateCreated]) VALUES (N'US9BC5OH', N'Cindy', N'Ryan', N'S', N'(l0x^0NgjY', CAST(N'2020-06-17' AS Date))
INSERT [dbo].[Users] ([UserID], [UserFName], [UserLName], [USER_TYPE], [Password], [DateCreated]) VALUES (N'USA32O5E', N'Zachary', N'Holt', N'C', N'Mej8dOEqG)', CAST(N'2021-01-20' AS Date))
INSERT [dbo].[Users] ([UserID], [UserFName], [UserLName], [USER_TYPE], [Password], [DateCreated]) VALUES (N'USAELGX3', N'Kristen', N'Carter', N'B', N's99VHY5g@x', CAST(N'2020-12-31' AS Date))
INSERT [dbo].[Users] ([UserID], [UserFName], [UserLName], [USER_TYPE], [Password], [DateCreated]) VALUES (N'USB0RVQ5', N'Rhonda', N'Casey', N'S', N'47Y7Z8nb!^', CAST(N'2019-12-12' AS Date))
INSERT [dbo].[Users] ([UserID], [UserFName], [UserLName], [USER_TYPE], [Password], [DateCreated]) VALUES (N'USB638A9', N'Rhonda', N'Campbell', N'B', N'!bg5MiToNt', CAST(N'2023-02-04' AS Date))
INSERT [dbo].[Users] ([UserID], [UserFName], [UserLName], [USER_TYPE], [Password], [DateCreated]) VALUES (N'USB9DZ0P', N'Shaun', N'Walters', N'S', N'v!3jVvP!Vq', CAST(N'2022-09-07' AS Date))
INSERT [dbo].[Users] ([UserID], [UserFName], [UserLName], [USER_TYPE], [Password], [DateCreated]) VALUES (N'USBHVX1L', N'Nicholas', N'West', N'S', N'*s)N60+UU5', CAST(N'2022-11-16' AS Date))
INSERT [dbo].[Users] ([UserID], [UserFName], [UserLName], [USER_TYPE], [Password], [DateCreated]) VALUES (N'USBIOK0G', N'Lauren', N'Reyes', N'C', N'^7R(*jJncw', CAST(N'2023-03-14' AS Date))
INSERT [dbo].[Users] ([UserID], [UserFName], [UserLName], [USER_TYPE], [Password], [DateCreated]) VALUES (N'USC1UWWQ', N'Stacey', N'Arnold', N'C', N'Jg712C!i*w', CAST(N'2023-04-06' AS Date))
INSERT [dbo].[Users] ([UserID], [UserFName], [UserLName], [USER_TYPE], [Password], [DateCreated]) VALUES (N'USC2MGYF', N'Robert', N'Mullins', N'B', N'#!Kq9Y4r9F', CAST(N'2022-02-15' AS Date))
INSERT [dbo].[Users] ([UserID], [UserFName], [UserLName], [USER_TYPE], [Password], [DateCreated]) VALUES (N'USD26UJU', N'Tonya', N'Duncan', N'C', N'$(ZlmfiK&8', CAST(N'2022-02-04' AS Date))
INSERT [dbo].[Users] ([UserID], [UserFName], [UserLName], [USER_TYPE], [Password], [DateCreated]) VALUES (N'USD2STY0', N'Alexander', N'Watson', N'B', N'X@9)Thj0XZ', CAST(N'2021-01-07' AS Date))
INSERT [dbo].[Users] ([UserID], [UserFName], [UserLName], [USER_TYPE], [Password], [DateCreated]) VALUES (N'USD4DQ4O', N'Abigail', N'Moses', N'S', N'm5FY05td$P', CAST(N'2022-04-14' AS Date))
INSERT [dbo].[Users] ([UserID], [UserFName], [UserLName], [USER_TYPE], [Password], [DateCreated]) VALUES (N'USDWIVF0', N'Maria', N'Fisher', N'B', N'qw4U9On(_^', CAST(N'2020-09-21' AS Date))
INSERT [dbo].[Users] ([UserID], [UserFName], [UserLName], [USER_TYPE], [Password], [DateCreated]) VALUES (N'USEFLEY3', N'Andrew', N'Obrien', N'B', N'*GNriF_dr1', CAST(N'2022-02-09' AS Date))
INSERT [dbo].[Users] ([UserID], [UserFName], [UserLName], [USER_TYPE], [Password], [DateCreated]) VALUES (N'USEP8FUE', N'David', N'Watkins', N'S', N'u&Ih7r01*6', CAST(N'2022-07-24' AS Date))
INSERT [dbo].[Users] ([UserID], [UserFName], [UserLName], [USER_TYPE], [Password], [DateCreated]) VALUES (N'USF4XVT4', N'Katherine', N'Vargas', N'S', N'*QH2XZHzmL', CAST(N'2019-04-16' AS Date))
INSERT [dbo].[Users] ([UserID], [UserFName], [UserLName], [USER_TYPE], [Password], [DateCreated]) VALUES (N'USF959FG', N'John', N'Calhoun', N'C', N'D3Nk$7JkXS', CAST(N'2022-04-10' AS Date))
INSERT [dbo].[Users] ([UserID], [UserFName], [UserLName], [USER_TYPE], [Password], [DateCreated]) VALUES (N'USFKJ0V7', N'Amy', N'Zavala', N'C', N'DUKS@c&R)8', CAST(N'2019-05-23' AS Date))
INSERT [dbo].[Users] ([UserID], [UserFName], [UserLName], [USER_TYPE], [Password], [DateCreated]) VALUES (N'USFO2JR5', N'Sarah', N'Snyder', N'B', N'7+S2JsbfOw', CAST(N'2023-11-01' AS Date))
INSERT [dbo].[Users] ([UserID], [UserFName], [UserLName], [USER_TYPE], [Password], [DateCreated]) VALUES (N'USFO2TNF', N'Tiffany', N'Jacobs', N'S', N'E9NiwSAz(t', CAST(N'2021-10-08' AS Date))
INSERT [dbo].[Users] ([UserID], [UserFName], [UserLName], [USER_TYPE], [Password], [DateCreated]) VALUES (N'USFV4GT4', N'Lisa', N'Gregory', N'B', N'K@94T@J&Sq', CAST(N'2019-09-03' AS Date))
INSERT [dbo].[Users] ([UserID], [UserFName], [UserLName], [USER_TYPE], [Password], [DateCreated]) VALUES (N'USFXY3CZ', N'Natasha', N'Chang', N'B', N'+xNQcMPBw0', CAST(N'2021-11-19' AS Date))
INSERT [dbo].[Users] ([UserID], [UserFName], [UserLName], [USER_TYPE], [Password], [DateCreated]) VALUES (N'USGAX5IO', N'Jennifer', N'Swanson', N'C', N'+3KVJdHGxg', CAST(N'2020-07-31' AS Date))
INSERT [dbo].[Users] ([UserID], [UserFName], [UserLName], [USER_TYPE], [Password], [DateCreated]) VALUES (N'USGNA1R1', N'Mia', N'Obrien', N'S', N'59!2K0DqrJ', CAST(N'2023-01-10' AS Date))
INSERT [dbo].[Users] ([UserID], [UserFName], [UserLName], [USER_TYPE], [Password], [DateCreated]) VALUES (N'USI41D9M', N'Nancy', N'Shaffer', N'B', N'(hIJ*E!!7%', CAST(N'2020-01-18' AS Date))
INSERT [dbo].[Users] ([UserID], [UserFName], [UserLName], [USER_TYPE], [Password], [DateCreated]) VALUES (N'USIQTJHO', N'Kristen', N'Taylor', N'S', N'nwe1M1ib@7', CAST(N'2022-05-23' AS Date))
INSERT [dbo].[Users] ([UserID], [UserFName], [UserLName], [USER_TYPE], [Password], [DateCreated]) VALUES (N'USIUACRG', N'Keith', N'Wolfe', N'S', N't+fg4QZO(5', CAST(N'2020-05-22' AS Date))
INSERT [dbo].[Users] ([UserID], [UserFName], [UserLName], [USER_TYPE], [Password], [DateCreated]) VALUES (N'USIUO465', N'David', N'Woodward', N'B', N'*GRaQYl^1$', CAST(N'2023-05-27' AS Date))
INSERT [dbo].[Users] ([UserID], [UserFName], [UserLName], [USER_TYPE], [Password], [DateCreated]) VALUES (N'USJ37IRI', N'Timothy', N'Lawrence', N'B', N'o_OJO7Xc$7', CAST(N'2023-07-20' AS Date))
INSERT [dbo].[Users] ([UserID], [UserFName], [UserLName], [USER_TYPE], [Password], [DateCreated]) VALUES (N'USKGK5J9', N'Bill', N'Mitchell', N'C', N'@uTISSNeV0', CAST(N'2021-06-27' AS Date))
INSERT [dbo].[Users] ([UserID], [UserFName], [UserLName], [USER_TYPE], [Password], [DateCreated]) VALUES (N'USKGLUVC', N'Eric', N'Roberts', N'B', N'5(*q1C@q0F', CAST(N'2020-09-03' AS Date))
INSERT [dbo].[Users] ([UserID], [UserFName], [UserLName], [USER_TYPE], [Password], [DateCreated]) VALUES (N'USKLRC39', N'Kenneth', N'Johnson', N'C', N'qc@2MVqmrm', CAST(N'2021-04-30' AS Date))
INSERT [dbo].[Users] ([UserID], [UserFName], [UserLName], [USER_TYPE], [Password], [DateCreated]) VALUES (N'USLG0J3H', N'Eric', N'Joseph', N'S', N'$3PqGIgK8d', CAST(N'2020-08-27' AS Date))
INSERT [dbo].[Users] ([UserID], [UserFName], [UserLName], [USER_TYPE], [Password], [DateCreated]) VALUES (N'USLRIZE8', N'James', N'Jenkins', N'B', N'_nCm1ddi$7', CAST(N'2020-03-05' AS Date))
INSERT [dbo].[Users] ([UserID], [UserFName], [UserLName], [USER_TYPE], [Password], [DateCreated]) VALUES (N'USM4IBC1', N'Yolanda', N'Wood', N'S', N'^vxCu*)nc9', CAST(N'2023-04-11' AS Date))
INSERT [dbo].[Users] ([UserID], [UserFName], [UserLName], [USER_TYPE], [Password], [DateCreated]) VALUES (N'USM99NIG', N'Michael', N'Stanley', N'C', N'4)4wyOJvWj', CAST(N'2020-07-08' AS Date))
INSERT [dbo].[Users] ([UserID], [UserFName], [UserLName], [USER_TYPE], [Password], [DateCreated]) VALUES (N'USMA0P2D', N'Tamara', N'George', N'C', N'2@2zK)ruD(', CAST(N'2023-08-03' AS Date))
INSERT [dbo].[Users] ([UserID], [UserFName], [UserLName], [USER_TYPE], [Password], [DateCreated]) VALUES (N'USMGYCUT', N'Joshua', N'Parrish', N'C', N'h@M8P0FlsE', CAST(N'2021-10-06' AS Date))
INSERT [dbo].[Users] ([UserID], [UserFName], [UserLName], [USER_TYPE], [Password], [DateCreated]) VALUES (N'USMPXUMS', N'Christopher', N'Lee', N'C', N'g7WvRw#e(Z', CAST(N'2022-08-05' AS Date))
INSERT [dbo].[Users] ([UserID], [UserFName], [UserLName], [USER_TYPE], [Password], [DateCreated]) VALUES (N'USMQ5KAL', N'Randy', N'Larson', N'C', N's*88QrMl%m', CAST(N'2021-05-23' AS Date))
INSERT [dbo].[Users] ([UserID], [UserFName], [UserLName], [USER_TYPE], [Password], [DateCreated]) VALUES (N'USN1TV67', N'Shawn', N'Kelly', N'S', N'E$o3mSePV(', CAST(N'2019-01-18' AS Date))
INSERT [dbo].[Users] ([UserID], [UserFName], [UserLName], [USER_TYPE], [Password], [DateCreated]) VALUES (N'USN58M25', N'Sandra', N'Gomez', N'C', N'__1EZ%@k+0', CAST(N'2021-04-03' AS Date))
INSERT [dbo].[Users] ([UserID], [UserFName], [UserLName], [USER_TYPE], [Password], [DateCreated]) VALUES (N'USNV9MVH', N'Peter', N'Smith', N'C', N'Tr+B7Eby0x', CAST(N'2023-06-14' AS Date))
INSERT [dbo].[Users] ([UserID], [UserFName], [UserLName], [USER_TYPE], [Password], [DateCreated]) VALUES (N'USNXP9DZ', N'Patricia', N'Powers', N'B', N'WCt#M2qWf*', CAST(N'2020-11-24' AS Date))
INSERT [dbo].[Users] ([UserID], [UserFName], [UserLName], [USER_TYPE], [Password], [DateCreated]) VALUES (N'USO1D500', N'Jack', N'Cooper', N'B', N'Zy%1ICbN55', CAST(N'2020-11-24' AS Date))
INSERT [dbo].[Users] ([UserID], [UserFName], [UserLName], [USER_TYPE], [Password], [DateCreated]) VALUES (N'USORZ3PS', N'Gregory', N'Salazar', N'S', N'H*h1XVJqDA', CAST(N'2019-06-19' AS Date))
INSERT [dbo].[Users] ([UserID], [UserFName], [UserLName], [USER_TYPE], [Password], [DateCreated]) VALUES (N'USQRAS8P', N'Tony', N'Parker', N'S', N'6*6AZqed#c', CAST(N'2021-11-17' AS Date))
INSERT [dbo].[Users] ([UserID], [UserFName], [UserLName], [USER_TYPE], [Password], [DateCreated]) VALUES (N'USR3IIE1', N'Emily', N'Parker', N'C', N'w@DN2Osb*s', CAST(N'2023-02-26' AS Date))
INSERT [dbo].[Users] ([UserID], [UserFName], [UserLName], [USER_TYPE], [Password], [DateCreated]) VALUES (N'USRX8MP4', N'Nicole', N'Howard', N'B', N'3RUVFM+k(8', CAST(N'2023-08-01' AS Date))
INSERT [dbo].[Users] ([UserID], [UserFName], [UserLName], [USER_TYPE], [Password], [DateCreated]) VALUES (N'USS1RP4T', N'Kevin', N'Webster', N'B', N'g9EYNHsV#w', CAST(N'2019-08-06' AS Date))
INSERT [dbo].[Users] ([UserID], [UserFName], [UserLName], [USER_TYPE], [Password], [DateCreated]) VALUES (N'USS7U4WD', N'James', N'Morrison', N'S', N'@Bh6HTpX+^', CAST(N'2019-01-15' AS Date))
INSERT [dbo].[Users] ([UserID], [UserFName], [UserLName], [USER_TYPE], [Password], [DateCreated]) VALUES (N'USSDDXL7', N'Lisa', N'Paul', N'B', N')28Y6m2jxk', CAST(N'2023-09-29' AS Date))
INSERT [dbo].[Users] ([UserID], [UserFName], [UserLName], [USER_TYPE], [Password], [DateCreated]) VALUES (N'USSNEUJQ', N'Colton', N'Lopez', N'C', N'7%r7NV+oQg', CAST(N'2023-10-06' AS Date))
INSERT [dbo].[Users] ([UserID], [UserFName], [UserLName], [USER_TYPE], [Password], [DateCreated]) VALUES (N'USSO2CX0', N'John', N'Herring', N'B', N'8#3Aeke_PS', CAST(N'2022-02-20' AS Date))
INSERT [dbo].[Users] ([UserID], [UserFName], [UserLName], [USER_TYPE], [Password], [DateCreated]) VALUES (N'USSULU9I', N'Dawn', N'Orozco', N'C', N'%S7YwkU9qM', CAST(N'2023-10-15' AS Date))
INSERT [dbo].[Users] ([UserID], [UserFName], [UserLName], [USER_TYPE], [Password], [DateCreated]) VALUES (N'USSXXNX8', N'Ashley', N'Williams', N'C', N'$01Gq7i15N', CAST(N'2023-05-12' AS Date))
INSERT [dbo].[Users] ([UserID], [UserFName], [UserLName], [USER_TYPE], [Password], [DateCreated]) VALUES (N'USTBOTN3', N'Ashley', N'Walker', N'B', N'^XMwkEcI22', CAST(N'2020-02-27' AS Date))
INSERT [dbo].[Users] ([UserID], [UserFName], [UserLName], [USER_TYPE], [Password], [DateCreated]) VALUES (N'USTRTN0D', N'Patrick', N'Farmer', N'S', N'@u&xA6Ea7A', CAST(N'2019-08-30' AS Date))
INSERT [dbo].[Users] ([UserID], [UserFName], [UserLName], [USER_TYPE], [Password], [DateCreated]) VALUES (N'USVPLYSK', N'Ashley', N'Castillo', N'B', N'^IM5Hb5bNn', CAST(N'2020-03-31' AS Date))
INSERT [dbo].[Users] ([UserID], [UserFName], [UserLName], [USER_TYPE], [Password], [DateCreated]) VALUES (N'USW14XAB', N'Amanda', N'Coffey', N'S', N'p1q&3SWxZ7', CAST(N'2023-11-14' AS Date))
INSERT [dbo].[Users] ([UserID], [UserFName], [UserLName], [USER_TYPE], [Password], [DateCreated]) VALUES (N'USW3IO6P', N'Lance', N'Payne', N'S', N'9+4USrdu%N', CAST(N'2021-08-17' AS Date))
INSERT [dbo].[Users] ([UserID], [UserFName], [UserLName], [USER_TYPE], [Password], [DateCreated]) VALUES (N'USWDZFQX', N'Bridget', N'Harper', N'S', N'%QV4sZoax#', CAST(N'2019-10-17' AS Date))
INSERT [dbo].[Users] ([UserID], [UserFName], [UserLName], [USER_TYPE], [Password], [DateCreated]) VALUES (N'USWGJAED', N'Paul', N'Crawford', N'S', N'$a3aH_r^7R', CAST(N'2019-06-22' AS Date))
INSERT [dbo].[Users] ([UserID], [UserFName], [UserLName], [USER_TYPE], [Password], [DateCreated]) VALUES (N'USWIWNFD', N'Marc', N'Lin', N'S', N'H839F+ng&8', CAST(N'2022-02-16' AS Date))
INSERT [dbo].[Users] ([UserID], [UserFName], [UserLName], [USER_TYPE], [Password], [DateCreated]) VALUES (N'USWK41BH', N'Ashley', N'Burgess', N'S', N'*FA2e+Wlrm', CAST(N'2020-02-12' AS Date))
INSERT [dbo].[Users] ([UserID], [UserFName], [UserLName], [USER_TYPE], [Password], [DateCreated]) VALUES (N'USWTGCYC', N'Adam', N'Brown', N'C', N'nu28EMxh^8', CAST(N'2020-01-31' AS Date))
INSERT [dbo].[Users] ([UserID], [UserFName], [UserLName], [USER_TYPE], [Password], [DateCreated]) VALUES (N'USWTGOP2', N'Brianna', N'Velazquez', N'B', N'ci6n1LUk(O', CAST(N'2019-08-07' AS Date))
INSERT [dbo].[Users] ([UserID], [UserFName], [UserLName], [USER_TYPE], [Password], [DateCreated]) VALUES (N'USXBDVU0', N'Alyssa', N'Peck', N'S', N')6N+EJWz3m', CAST(N'2020-01-09' AS Date))
INSERT [dbo].[Users] ([UserID], [UserFName], [UserLName], [USER_TYPE], [Password], [DateCreated]) VALUES (N'USXJ7SZ3', N'Crystal', N'Romero', N'C', N'X6EUJjCc_k', CAST(N'2023-06-02' AS Date))
INSERT [dbo].[Users] ([UserID], [UserFName], [UserLName], [USER_TYPE], [Password], [DateCreated]) VALUES (N'USYDP80R', N'Russell', N'Maxwell', N'B', N'7l+5XLWac*', CAST(N'2020-05-18' AS Date))
INSERT [dbo].[Users] ([UserID], [UserFName], [UserLName], [USER_TYPE], [Password], [DateCreated]) VALUES (N'USYF05XO', N'Kaitlyn', N'Ramos', N'B', N'#1ma$XHq^e', CAST(N'2022-01-31' AS Date))
INSERT [dbo].[Users] ([UserID], [UserFName], [UserLName], [USER_TYPE], [Password], [DateCreated]) VALUES (N'USYSK3L2', N'Heather', N'Phillips', N'S', N'FE3THFwQG*', CAST(N'2022-07-13' AS Date))
INSERT [dbo].[Users] ([UserID], [UserFName], [UserLName], [USER_TYPE], [Password], [DateCreated]) VALUES (N'USYWBRQE', N'Christine', N'Clay', N'B', N'SGu%6TOqkY', CAST(N'2019-07-14' AS Date))
INSERT [dbo].[Users] ([UserID], [UserFName], [UserLName], [USER_TYPE], [Password], [DateCreated]) VALUES (N'USZ6M1UW', N'Sean', N'Hall', N'C', N'%URv1_QivI', CAST(N'2020-03-26' AS Date))
INSERT [dbo].[Users] ([UserID], [UserFName], [UserLName], [USER_TYPE], [Password], [DateCreated]) VALUES (N'USZHEYT5', N'Brian', N'Palmer', N'C', N'4GYSvBbw@F', CAST(N'2021-03-11' AS Date))
INSERT [dbo].[Users] ([UserID], [UserFName], [UserLName], [USER_TYPE], [Password], [DateCreated]) VALUES (N'USZYR7VG', N'David', N'Rodriguez', N'C', N'%eX_2wUzbd', CAST(N'2022-09-26' AS Date))
GO
INSERT [dbo].[Wishlist] ([WishlistID], [UserID], [ProductID]) VALUES (N'WL0I972V', N'USKLRC39', N'PR4MLJT1')
INSERT [dbo].[Wishlist] ([WishlistID], [UserID], [ProductID]) VALUES (N'WL1EANZB', N'USMA0P2D', N'PRYDX80X')
INSERT [dbo].[Wishlist] ([WishlistID], [UserID], [ProductID]) VALUES (N'WL1G23J4', N'USIUACRG', N'PRI7GUPP')
INSERT [dbo].[Wishlist] ([WishlistID], [UserID], [ProductID]) VALUES (N'WL1I6FUW', N'US4O0RDT', N'PRPFVVY7')
INSERT [dbo].[Wishlist] ([WishlistID], [UserID], [ProductID]) VALUES (N'WL2B2MAM', N'USI41D9M', N'PROLT4ZP')
INSERT [dbo].[Wishlist] ([WishlistID], [UserID], [ProductID]) VALUES (N'WL2C1F16', N'USFKJ0V7', N'PR0B53W7')
INSERT [dbo].[Wishlist] ([WishlistID], [UserID], [ProductID]) VALUES (N'WL41VHKV', N'US5D70P2', N'PRWU5ETZ')
INSERT [dbo].[Wishlist] ([WishlistID], [UserID], [ProductID]) VALUES (N'WL46KC7K', N'USLRIZE8', N'PR3X1NW2')
INSERT [dbo].[Wishlist] ([WishlistID], [UserID], [ProductID]) VALUES (N'WL4VIJ5W', N'USSDDXL7', N'PR7YQX96')
INSERT [dbo].[Wishlist] ([WishlistID], [UserID], [ProductID]) VALUES (N'WL4W2R1Y', N'USB0RVQ5', N'PRQZO17Z')
INSERT [dbo].[Wishlist] ([WishlistID], [UserID], [ProductID]) VALUES (N'WL4ZHQW2', N'USXBDVU0', N'PRI7GUPP')
INSERT [dbo].[Wishlist] ([WishlistID], [UserID], [ProductID]) VALUES (N'WL5P66M4', N'USD26UJU', N'PRMQ05LR')
INSERT [dbo].[Wishlist] ([WishlistID], [UserID], [ProductID]) VALUES (N'WL5UIWB9', N'USGAX5IO', N'PR3X1NW2')
INSERT [dbo].[Wishlist] ([WishlistID], [UserID], [ProductID]) VALUES (N'WL600QAF', N'US7CEEHO', N'PREEMXXI')
INSERT [dbo].[Wishlist] ([WishlistID], [UserID], [ProductID]) VALUES (N'WL65E7BR', N'USYWBRQE', N'PR72YDWG')
INSERT [dbo].[Wishlist] ([WishlistID], [UserID], [ProductID]) VALUES (N'WL6DB2ZO', N'USLG0J3H', N'PR48S905')
INSERT [dbo].[Wishlist] ([WishlistID], [UserID], [ProductID]) VALUES (N'WL6ISRCR', N'USW14XAB', N'PRH1NH8R')
INSERT [dbo].[Wishlist] ([WishlistID], [UserID], [ProductID]) VALUES (N'WL6SWXMK', N'USD26UJU', N'PRJJEVTF')
INSERT [dbo].[Wishlist] ([WishlistID], [UserID], [ProductID]) VALUES (N'WL71ZR2R', N'USKLRC39', N'PRF5VHY3')
INSERT [dbo].[Wishlist] ([WishlistID], [UserID], [ProductID]) VALUES (N'WL7QU3V0', N'US7CEEHO', N'PRZ3MW6R')
INSERT [dbo].[Wishlist] ([WishlistID], [UserID], [ProductID]) VALUES (N'WL7U21KN', N'US92ZG03', N'PRZ3MW6R')
INSERT [dbo].[Wishlist] ([WishlistID], [UserID], [ProductID]) VALUES (N'WL8KKXYG', N'US2B02HO', N'PRDTPTL5')
INSERT [dbo].[Wishlist] ([WishlistID], [UserID], [ProductID]) VALUES (N'WL8T13YB', N'US9BC5OH', N'PRQFVIPE')
INSERT [dbo].[Wishlist] ([WishlistID], [UserID], [ProductID]) VALUES (N'WL8U82S8', N'USBIOK0G', N'PR3X1NW2')
INSERT [dbo].[Wishlist] ([WishlistID], [UserID], [ProductID]) VALUES (N'WL8X6WJF', N'USEFLEY3', N'PR6QOUSW')
INSERT [dbo].[Wishlist] ([WishlistID], [UserID], [ProductID]) VALUES (N'WL9EGLGP', N'USA32O5E', N'PR2RI8VD')
INSERT [dbo].[Wishlist] ([WishlistID], [UserID], [ProductID]) VALUES (N'WL9S1GIF', N'US2UYRMB', N'PRJJEVTF')
INSERT [dbo].[Wishlist] ([WishlistID], [UserID], [ProductID]) VALUES (N'WLAKY702', N'USF959FG', N'PR2YCZZB')
INSERT [dbo].[Wishlist] ([WishlistID], [UserID], [ProductID]) VALUES (N'WLB75ERY', N'USFO2TNF', N'PRPFVVY7')
INSERT [dbo].[Wishlist] ([WishlistID], [UserID], [ProductID]) VALUES (N'WLBN99UG', N'USSNEUJQ', N'PR3X1NW2')
INSERT [dbo].[Wishlist] ([WishlistID], [UserID], [ProductID]) VALUES (N'WLBNWEFI', N'USBHVX1L', N'PR08N1DN')
INSERT [dbo].[Wishlist] ([WishlistID], [UserID], [ProductID]) VALUES (N'WLBZNZ7R', N'USC2MGYF', N'PRQZO17Z')
INSERT [dbo].[Wishlist] ([WishlistID], [UserID], [ProductID]) VALUES (N'WLCL8FWR', N'USD26UJU', N'PRHFWUM4')
INSERT [dbo].[Wishlist] ([WishlistID], [UserID], [ProductID]) VALUES (N'WLCUCP6U', N'US4O0RDT', N'PR6R65B4')
INSERT [dbo].[Wishlist] ([WishlistID], [UserID], [ProductID]) VALUES (N'WLDL74P6', N'USMPXUMS', N'PRHJHT1R')
INSERT [dbo].[Wishlist] ([WishlistID], [UserID], [ProductID]) VALUES (N'WLEBENP5', N'USWTGOP2', N'PRI7GUPP')
INSERT [dbo].[Wishlist] ([WishlistID], [UserID], [ProductID]) VALUES (N'WLF2PYQP', N'USXBDVU0', N'PR4MLJT1')
INSERT [dbo].[Wishlist] ([WishlistID], [UserID], [ProductID]) VALUES (N'WLF8G80N', N'USAELGX3', N'PR4DQ9LA')
INSERT [dbo].[Wishlist] ([WishlistID], [UserID], [ProductID]) VALUES (N'WLF9Z5QW', N'USR3IIE1', N'PR2RI8VD')
INSERT [dbo].[Wishlist] ([WishlistID], [UserID], [ProductID]) VALUES (N'WLG6XOIZ', N'USFKJ0V7', N'PR55HR6V')
INSERT [dbo].[Wishlist] ([WishlistID], [UserID], [ProductID]) VALUES (N'WLHB5EV9', N'USGAX5IO', N'PRWU5ETZ')
INSERT [dbo].[Wishlist] ([WishlistID], [UserID], [ProductID]) VALUES (N'WLHR2Z0G', N'USTBOTN3', N'PR4MLJT1')
INSERT [dbo].[Wishlist] ([WishlistID], [UserID], [ProductID]) VALUES (N'WLHWSWFD', N'USYDP80R', N'PR9Y8QAW')
INSERT [dbo].[Wishlist] ([WishlistID], [UserID], [ProductID]) VALUES (N'WLI8KEZ3', N'USIUACRG', N'PRVBE7EF')
INSERT [dbo].[Wishlist] ([WishlistID], [UserID], [ProductID]) VALUES (N'WLIQAF5O', N'USEP8FUE', N'PRCA40QD')
INSERT [dbo].[Wishlist] ([WishlistID], [UserID], [ProductID]) VALUES (N'WLJMU0RZ', N'USNV9MVH', N'PR55HR6V')
INSERT [dbo].[Wishlist] ([WishlistID], [UserID], [ProductID]) VALUES (N'WLJVSWHT', N'USI41D9M', N'PR4DQ9LA')
INSERT [dbo].[Wishlist] ([WishlistID], [UserID], [ProductID]) VALUES (N'WLK6QQX0', N'USZ6M1UW', N'PRH255HD')
INSERT [dbo].[Wishlist] ([WishlistID], [UserID], [ProductID]) VALUES (N'WLK9HLB8', N'US0ZQQQS', N'PREQ6XZM')
INSERT [dbo].[Wishlist] ([WishlistID], [UserID], [ProductID]) VALUES (N'WLKQ9PJX', N'US6Y55BI', N'PR6CUFDD')
INSERT [dbo].[Wishlist] ([WishlistID], [UserID], [ProductID]) VALUES (N'WLL5IUK9', N'USMA0P2D', N'PR9Y8QAW')
INSERT [dbo].[Wishlist] ([WishlistID], [UserID], [ProductID]) VALUES (N'WLLORXO3', N'USB638A9', N'PRZ3MW6R')
INSERT [dbo].[Wishlist] ([WishlistID], [UserID], [ProductID]) VALUES (N'WLLWH1TL', N'USN58M25', N'PRMYSLJ4')
INSERT [dbo].[Wishlist] ([WishlistID], [UserID], [ProductID]) VALUES (N'WLM7F29Q', N'USZ6M1UW', N'PRF5VHY3')
INSERT [dbo].[Wishlist] ([WishlistID], [UserID], [ProductID]) VALUES (N'WLMFXYUS', N'USIUACRG', N'PRH1NH8R')
INSERT [dbo].[Wishlist] ([WishlistID], [UserID], [ProductID]) VALUES (N'WLMP3NXA', N'USC1UWWQ', N'PRKHW06Y')
INSERT [dbo].[Wishlist] ([WishlistID], [UserID], [ProductID]) VALUES (N'WLMUX3UE', N'USC1UWWQ', N'PR6CUFDD')
INSERT [dbo].[Wishlist] ([WishlistID], [UserID], [ProductID]) VALUES (N'WLN6W62O', N'US1RRDPX', N'PRZ3MW6R')
INSERT [dbo].[Wishlist] ([WishlistID], [UserID], [ProductID]) VALUES (N'WLN7XWIQ', N'US591HMK', N'PRQZO17Z')
INSERT [dbo].[Wishlist] ([WishlistID], [UserID], [ProductID]) VALUES (N'WLN8HF2K', N'US4WLX8G', N'PRMYSLJ4')
INSERT [dbo].[Wishlist] ([WishlistID], [UserID], [ProductID]) VALUES (N'WLO0G0O8', N'USNV9MVH', N'PRIZNA5H')
INSERT [dbo].[Wishlist] ([WishlistID], [UserID], [ProductID]) VALUES (N'WLOK9BD7', N'USMGYCUT', N'PRQZO17Z')
INSERT [dbo].[Wishlist] ([WishlistID], [UserID], [ProductID]) VALUES (N'WLOQIEQ8', N'USLG0J3H', N'PR9Y8QAW')
INSERT [dbo].[Wishlist] ([WishlistID], [UserID], [ProductID]) VALUES (N'WLOUPJ48', N'USZ6M1UW', N'PRVBE7EF')
INSERT [dbo].[Wishlist] ([WishlistID], [UserID], [ProductID]) VALUES (N'WLPBOOIY', N'USS1RP4T', N'PROLT4ZP')
INSERT [dbo].[Wishlist] ([WishlistID], [UserID], [ProductID]) VALUES (N'WLQGYU8V', N'USWTGCYC', N'PR4DQ9LA')
INSERT [dbo].[Wishlist] ([WishlistID], [UserID], [ProductID]) VALUES (N'WLQQGO44', N'US5D70P2', N'PRHJHT1R')
INSERT [dbo].[Wishlist] ([WishlistID], [UserID], [ProductID]) VALUES (N'WLR54Q11', N'USWIWNFD', N'PR0B53W7')
INSERT [dbo].[Wishlist] ([WishlistID], [UserID], [ProductID]) VALUES (N'WLRPJZO8', N'USWGJAED', N'PR72YDWG')
INSERT [dbo].[Wishlist] ([WishlistID], [UserID], [ProductID]) VALUES (N'WLRPOEB5', N'USQRAS8P', N'PROLT4ZP')
INSERT [dbo].[Wishlist] ([WishlistID], [UserID], [ProductID]) VALUES (N'WLRT7JH9', N'USR3IIE1', N'PRI7GUPP')
INSERT [dbo].[Wishlist] ([WishlistID], [UserID], [ProductID]) VALUES (N'WLRZY4TP', N'USFV4GT4', N'PREEMXXI')
INSERT [dbo].[Wishlist] ([WishlistID], [UserID], [ProductID]) VALUES (N'WLS5ZGJM', N'USFKJ0V7', N'PRQZO17Z')
INSERT [dbo].[Wishlist] ([WishlistID], [UserID], [ProductID]) VALUES (N'WLS7WNS1', N'US0ZQQQS', N'PRHFWUM4')
INSERT [dbo].[Wishlist] ([WishlistID], [UserID], [ProductID]) VALUES (N'WLSA500R', N'USNV9MVH', N'PRQZO17Z')
INSERT [dbo].[Wishlist] ([WishlistID], [UserID], [ProductID]) VALUES (N'WLSHHXVF', N'US7CEEHO', N'PR6CUFDD')
INSERT [dbo].[Wishlist] ([WishlistID], [UserID], [ProductID]) VALUES (N'WLSIPU0G', N'USSO2CX0', N'PRMYSLJ4')
INSERT [dbo].[Wishlist] ([WishlistID], [UserID], [ProductID]) VALUES (N'WLTCZAIK', N'USB9DZ0P', N'PR9Y8QAW')
INSERT [dbo].[Wishlist] ([WishlistID], [UserID], [ProductID]) VALUES (N'WLTJ53XH', N'USSULU9I', N'PR3IJF88')
INSERT [dbo].[Wishlist] ([WishlistID], [UserID], [ProductID]) VALUES (N'WLTLLNQ0', N'USR3IIE1', N'PRLCSW8H')
INSERT [dbo].[Wishlist] ([WishlistID], [UserID], [ProductID]) VALUES (N'WLTR3KES', N'US00GOAJ', N'PR47SFVF')
INSERT [dbo].[Wishlist] ([WishlistID], [UserID], [ProductID]) VALUES (N'WLTZQ2EB', N'USN1TV67', N'PRMLKVBQ')
INSERT [dbo].[Wishlist] ([WishlistID], [UserID], [ProductID]) VALUES (N'WLUPK7IO', N'USKLRC39', N'PRH255HD')
INSERT [dbo].[Wishlist] ([WishlistID], [UserID], [ProductID]) VALUES (N'WLVCORTP', N'US99BPDK', N'PR72YDWG')
INSERT [dbo].[Wishlist] ([WishlistID], [UserID], [ProductID]) VALUES (N'WLVZDKQL', N'USMQ5KAL', N'PR6R65B4')
INSERT [dbo].[Wishlist] ([WishlistID], [UserID], [ProductID]) VALUES (N'WLW1HOOT', N'US7CEEHO', N'PREEMXXI')
INSERT [dbo].[Wishlist] ([WishlistID], [UserID], [ProductID]) VALUES (N'WLWAFMVX', N'US99BPDK', N'PR9Y8QAW')
INSERT [dbo].[Wishlist] ([WishlistID], [UserID], [ProductID]) VALUES (N'WLWOFUNW', N'USJ37IRI', N'PRDTPTL5')
INSERT [dbo].[Wishlist] ([WishlistID], [UserID], [ProductID]) VALUES (N'WLWQ2JZ6', N'USFV4GT4', N'PRMLKVBQ')
INSERT [dbo].[Wishlist] ([WishlistID], [UserID], [ProductID]) VALUES (N'WLWZA0FQ', N'USYF05XO', N'PRYDX80X')
INSERT [dbo].[Wishlist] ([WishlistID], [UserID], [ProductID]) VALUES (N'WLX9L5L5', N'USBHVX1L', N'PRMQ05LR')
INSERT [dbo].[Wishlist] ([WishlistID], [UserID], [ProductID]) VALUES (N'WLX9XSW8', N'USYDP80R', N'PRQZO17Z')
INSERT [dbo].[Wishlist] ([WishlistID], [UserID], [ProductID]) VALUES (N'WLXCBH95', N'USYF05XO', N'PR0S237E')
INSERT [dbo].[Wishlist] ([WishlistID], [UserID], [ProductID]) VALUES (N'WLXDL61S', N'USQRAS8P', N'PRRQFBOD')
INSERT [dbo].[Wishlist] ([WishlistID], [UserID], [ProductID]) VALUES (N'WLY2WZCQ', N'USVPLYSK', N'PR6R65B4')
INSERT [dbo].[Wishlist] ([WishlistID], [UserID], [ProductID]) VALUES (N'WLYGKIJE', N'USVPLYSK', N'PRMLKVBQ')
INSERT [dbo].[Wishlist] ([WishlistID], [UserID], [ProductID]) VALUES (N'WLYLEJWZ', N'USFO2JR5', N'PREEMXXI')
INSERT [dbo].[Wishlist] ([WishlistID], [UserID], [ProductID]) VALUES (N'WLZ0LW3G', N'US356HAX', N'PRCA40QD')
INSERT [dbo].[Wishlist] ([WishlistID], [UserID], [ProductID]) VALUES (N'WLZDSATY', N'USZYR7VG', N'PRIZNA5H')
INSERT [dbo].[Wishlist] ([WishlistID], [UserID], [ProductID]) VALUES (N'WLZLZ5BV', N'USFKJ0V7', N'PRIG69SE')
GO
ALTER TABLE [dbo].[Buyers] ADD  DEFAULT ('xxx-xxx-xxxx') FOR [Phone]
GO
ALTER TABLE [dbo].[Sellers] ADD  DEFAULT ('xxx-xxx-xxxx') FOR [Phone]
GO
ALTER TABLE [dbo].[Address]  WITH CHECK ADD  CONSTRAINT [FK_Address_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Address] CHECK CONSTRAINT [FK_Address_Users]
GO
ALTER TABLE [dbo].[Buyers]  WITH CHECK ADD  CONSTRAINT [FK_Buyers_Membership] FOREIGN KEY([MembershipID])
REFERENCES [dbo].[Membership] ([MembershipID])
GO
ALTER TABLE [dbo].[Buyers] CHECK CONSTRAINT [FK_Buyers_Membership]
GO
ALTER TABLE [dbo].[Buyers]  WITH CHECK ADD  CONSTRAINT [FK_Buyers_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Buyers] CHECK CONSTRAINT [FK_Buyers_Users]
GO
ALTER TABLE [dbo].[Offer]  WITH CHECK ADD  CONSTRAINT [FK_Offer_Discount] FOREIGN KEY([DiscountID])
REFERENCES [dbo].[Discount] ([DiscountID])
GO
ALTER TABLE [dbo].[Offer] CHECK CONSTRAINT [FK_Offer_Discount]
GO
ALTER TABLE [dbo].[Offer]  WITH CHECK ADD  CONSTRAINT [FK_Offer_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductID])
GO
ALTER TABLE [dbo].[Offer] CHECK CONSTRAINT [FK_Offer_Product]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Shipper] FOREIGN KEY([ShipperID])
REFERENCES [dbo].[Shipper] ([ShipperID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Shipper]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Users]
GO
ALTER TABLE [dbo].[Payment]  WITH CHECK ADD  CONSTRAINT [FK_Payment_offers] FOREIGN KEY([OfferID])
REFERENCES [dbo].[Offer] ([OfferID])
GO
ALTER TABLE [dbo].[Payment] CHECK CONSTRAINT [FK_Payment_offers]
GO
ALTER TABLE [dbo].[Payment]  WITH CHECK ADD  CONSTRAINT [FK_Payment_Orders] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders] ([OrderID])
GO
ALTER TABLE [dbo].[Payment] CHECK CONSTRAINT [FK_Payment_Orders]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Category] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Category] ([CategoryID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Category]
GO
ALTER TABLE [dbo].[Rating]  WITH CHECK ADD  CONSTRAINT [FK_Rating_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductID])
GO
ALTER TABLE [dbo].[Rating] CHECK CONSTRAINT [FK_Rating_Product]
GO
ALTER TABLE [dbo].[Rating]  WITH CHECK ADD  CONSTRAINT [FK_Rating_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Rating] CHECK CONSTRAINT [FK_Rating_Users]
GO
ALTER TABLE [dbo].[Sellers]  WITH CHECK ADD  CONSTRAINT [FK_Sellers_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Sellers] CHECK CONSTRAINT [FK_Sellers_Users]
GO
ALTER TABLE [dbo].[ShoppingCart]  WITH CHECK ADD  CONSTRAINT [FK_ShoppingCart_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductID])
GO
ALTER TABLE [dbo].[ShoppingCart] CHECK CONSTRAINT [FK_ShoppingCart_Product]
GO
ALTER TABLE [dbo].[ShoppingCart]  WITH CHECK ADD  CONSTRAINT [FK_ShoppingCart_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[ShoppingCart] CHECK CONSTRAINT [FK_ShoppingCart_Users]
GO
ALTER TABLE [dbo].[Wishlist]  WITH CHECK ADD  CONSTRAINT [FK_Wishlist_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductID])
GO
ALTER TABLE [dbo].[Wishlist] CHECK CONSTRAINT [FK_Wishlist_Product]
GO
ALTER TABLE [dbo].[Wishlist]  WITH CHECK ADD  CONSTRAINT [FK_Wishlist_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Wishlist] CHECK CONSTRAINT [FK_Wishlist_Users]
GO
ALTER TABLE [dbo].[Buyers]  WITH CHECK ADD CHECK  (([USER_TYPE]='B'))
GO
ALTER TABLE [dbo].[Sellers]  WITH CHECK ADD CHECK  (([USER_TYPE]='S'))
GO

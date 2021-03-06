USE [Magazyn]
GO
/****** Object:  Table [dbo].[Klienci]    Script Date: 13.02.2020 08:21:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Klienci](
	[ID_Klienta] [int] IDENTITY(1,1) NOT NULL,
	[Nazwa_Klienta] [nvarchar](50) NULL,
	[Numer_Kontaktowy] [nvarchar](50) NULL,
	[Adres] [nvarchar](50) NULL,
 CONSTRAINT [PK_Klienci] PRIMARY KEY CLUSTERED 
(
	[ID_Klienta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Kraje]    Script Date: 13.02.2020 08:21:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kraje](
	[ID_Kraju] [int] NOT NULL,
	[Nazwa_Kraju] [nvarchar](50) NULL,
 CONSTRAINT [PK_Kraje] PRIMARY KEY CLUSTERED 
(
	[ID_Kraju] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Opisy_zamowien]    Script Date: 13.02.2020 08:21:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Opisy_zamowien](
	[ID_Zamowienia] [int] NOT NULL,
	[ID_Produktu] [int] NOT NULL,
	[Ilosc] [int] NULL,
	[Cena] [decimal](18, 2) NULL,
	[ID_Opisu_Zamowien] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Opisy_zamowien] PRIMARY KEY CLUSTERED 
(
	[ID_Opisu_Zamowien] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Producenci]    Script Date: 13.02.2020 08:21:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Producenci](
	[ID_Producenta] [int] NOT NULL,
	[Nazwa_Producenta] [nvarchar](50) NULL,
	[ID_Kraju] [int] NULL,
 CONSTRAINT [PK_Producenci] PRIMARY KEY CLUSTERED 
(
	[ID_Producenta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Produkt]    Script Date: 13.02.2020 08:21:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Produkt](
	[ID_Produktu] [int] NOT NULL,
	[Nazwa_Produktu] [nvarchar](50) NULL,
	[ID_Producenta] [int] NULL,
	[ID_Typu] [int] NULL,
 CONSTRAINT [PK_Produkt] PRIMARY KEY CLUSTERED 
(
	[ID_Produktu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Towary]    Script Date: 13.02.2020 08:21:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Towary](
	[ID_Produktu] [int] NOT NULL,
	[Data] [date] NULL,
	[Ilosc] [int] NULL,
	[Cena] [decimal](18, 2) NULL,
	[ID_Towaru] [int] NOT NULL,
 CONSTRAINT [PK_Towary] PRIMARY KEY CLUSTERED 
(
	[ID_Towaru] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Typy]    Script Date: 13.02.2020 08:21:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Typy](
	[ID_Typu] [int] NOT NULL,
	[Nazwa_Typu] [varchar](50) NULL,
 CONSTRAINT [PK_Typy] PRIMARY KEY CLUSTERED 
(
	[ID_Typu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Uzytkownicy]    Script Date: 13.02.2020 08:21:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Uzytkownicy](
	[ID_Uzytkownika] [int] NOT NULL,
	[Login] [nvarchar](50) NOT NULL,
	[Password] [nchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Uzytkownika] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Zamowienia]    Script Date: 13.02.2020 08:21:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Zamowienia](
	[ID_Zamowienia] [int] NOT NULL,
	[ID_Klienta] [int] NULL,
	[Rabat] [int] NOT NULL,
 CONSTRAINT [PK_Zamowienia] PRIMARY KEY CLUSTERED 
(
	[ID_Zamowienia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Klienci] ON 

INSERT [dbo].[Klienci] ([ID_Klienta], [Nazwa_Klienta], [Numer_Kontaktowy], [Adres]) VALUES (1, N'Pierwszy', N'+48123456789', N'Cieszyn ul. Szkolna 123')
INSERT [dbo].[Klienci] ([ID_Klienta], [Nazwa_Klienta], [Numer_Kontaktowy], [Adres]) VALUES (36, N'klient1', N'+48111111111', N'Warszawa ul. Testowa 1')
INSERT [dbo].[Klienci] ([ID_Klienta], [Nazwa_Klienta], [Numer_Kontaktowy], [Adres]) VALUES (37, N'klient2', N'+33789456123', N'Kraków ul. Zawiła 123')
INSERT [dbo].[Klienci] ([ID_Klienta], [Nazwa_Klienta], [Numer_Kontaktowy], [Adres]) VALUES (38, N'klient3', N'+77222222222', N'Cieszyn ul. Bielska 165B')
INSERT [dbo].[Klienci] ([ID_Klienta], [Nazwa_Klienta], [Numer_Kontaktowy], [Adres]) VALUES (39, N'klient4', N'+48517559123', N'Koszalin ul. Borowików 14')
INSERT [dbo].[Klienci] ([ID_Klienta], [Nazwa_Klienta], [Numer_Kontaktowy], [Adres]) VALUES (40, N'Lidl', N'+99888777666', N'Szczecin ul. Wesoła 55')
INSERT [dbo].[Klienci] ([ID_Klienta], [Nazwa_Klienta], [Numer_Kontaktowy], [Adres]) VALUES (41, N'Kaufland', N'+33444444444', N'Cieszyn ul. Kopernika 14')
INSERT [dbo].[Klienci] ([ID_Klienta], [Nazwa_Klienta], [Numer_Kontaktowy], [Adres]) VALUES (42, N'Biedronka', N'+66555444333', N'Poznań ul. Wiosenna 78')
INSERT [dbo].[Klienci] ([ID_Klienta], [Nazwa_Klienta], [Numer_Kontaktowy], [Adres]) VALUES (43, N'Aldi', N'+33444666222', N'Białystok ul. testowa 2')
INSERT [dbo].[Klienci] ([ID_Klienta], [Nazwa_Klienta], [Numer_Kontaktowy], [Adres]) VALUES (44, N'Żabka', N'+48777777777', N'Warszawa ul. Frysztacka78')
INSERT [dbo].[Klienci] ([ID_Klienta], [Nazwa_Klienta], [Numer_Kontaktowy], [Adres]) VALUES (45, N'test test', N'+48333222111', N'Cieszyn ul. Bielska 100')
INSERT [dbo].[Klienci] ([ID_Klienta], [Nazwa_Klienta], [Numer_Kontaktowy], [Adres]) VALUES (46, N'test12', N'+48123456789', N'Cieszyn ul. Zawiła 55')
INSERT [dbo].[Klienci] ([ID_Klienta], [Nazwa_Klienta], [Numer_Kontaktowy], [Adres]) VALUES (47, N'test klient', N'+48123456789', N'test')
INSERT [dbo].[Klienci] ([ID_Klienta], [Nazwa_Klienta], [Numer_Kontaktowy], [Adres]) VALUES (48, N' ', N'+55555555555', N' ')
INSERT [dbo].[Klienci] ([ID_Klienta], [Nazwa_Klienta], [Numer_Kontaktowy], [Adres]) VALUES (49, N'   ', N'+55555555555', N'   ')
INSERT [dbo].[Klienci] ([ID_Klienta], [Nazwa_Klienta], [Numer_Kontaktowy], [Adres]) VALUES (50, N'     ', N'+55555555555', N'     ')
INSERT [dbo].[Klienci] ([ID_Klienta], [Nazwa_Klienta], [Numer_Kontaktowy], [Adres]) VALUES (51, N'a', N'+55555555555', N'12')
SET IDENTITY_INSERT [dbo].[Klienci] OFF
INSERT [dbo].[Kraje] ([ID_Kraju], [Nazwa_Kraju]) VALUES (1, N'Polska')
INSERT [dbo].[Kraje] ([ID_Kraju], [Nazwa_Kraju]) VALUES (2, N'Niemcy')
INSERT [dbo].[Kraje] ([ID_Kraju], [Nazwa_Kraju]) VALUES (3, N'Francja')
INSERT [dbo].[Kraje] ([ID_Kraju], [Nazwa_Kraju]) VALUES (4, N'Belgi')
INSERT [dbo].[Kraje] ([ID_Kraju], [Nazwa_Kraju]) VALUES (5, N'Rosja')
INSERT [dbo].[Kraje] ([ID_Kraju], [Nazwa_Kraju]) VALUES (6, N'Włochy')
INSERT [dbo].[Kraje] ([ID_Kraju], [Nazwa_Kraju]) VALUES (7, N'Hiszpania')
INSERT [dbo].[Kraje] ([ID_Kraju], [Nazwa_Kraju]) VALUES (8, N'Ukrain')
INSERT [dbo].[Kraje] ([ID_Kraju], [Nazwa_Kraju]) VALUES (9, N'USA')
INSERT [dbo].[Kraje] ([ID_Kraju], [Nazwa_Kraju]) VALUES (10, N'RPA')
SET IDENTITY_INSERT [dbo].[Opisy_zamowien] ON 

INSERT [dbo].[Opisy_zamowien] ([ID_Zamowienia], [ID_Produktu], [Ilosc], [Cena], [ID_Opisu_Zamowien]) VALUES (1, 1, 1, CAST(0.00 AS Decimal(18, 2)), 19)
INSERT [dbo].[Opisy_zamowien] ([ID_Zamowienia], [ID_Produktu], [Ilosc], [Cena], [ID_Opisu_Zamowien]) VALUES (2, 1, 1, CAST(5.90 AS Decimal(18, 2)), 156)
INSERT [dbo].[Opisy_zamowien] ([ID_Zamowienia], [ID_Produktu], [Ilosc], [Cena], [ID_Opisu_Zamowien]) VALUES (2, 2, 20, CAST(39.80 AS Decimal(18, 2)), 157)
INSERT [dbo].[Opisy_zamowien] ([ID_Zamowienia], [ID_Produktu], [Ilosc], [Cena], [ID_Opisu_Zamowien]) VALUES (2, 4, 100, CAST(830.00 AS Decimal(18, 2)), 158)
INSERT [dbo].[Opisy_zamowien] ([ID_Zamowienia], [ID_Produktu], [Ilosc], [Cena], [ID_Opisu_Zamowien]) VALUES (2, 6, 3, CAST(266.64 AS Decimal(18, 2)), 159)
INSERT [dbo].[Opisy_zamowien] ([ID_Zamowienia], [ID_Produktu], [Ilosc], [Cena], [ID_Opisu_Zamowien]) VALUES (3, 2, 10, CAST(19.90 AS Decimal(18, 2)), 160)
INSERT [dbo].[Opisy_zamowien] ([ID_Zamowienia], [ID_Produktu], [Ilosc], [Cena], [ID_Opisu_Zamowien]) VALUES (4, 1, 10, CAST(59.00 AS Decimal(18, 2)), 161)
INSERT [dbo].[Opisy_zamowien] ([ID_Zamowienia], [ID_Produktu], [Ilosc], [Cena], [ID_Opisu_Zamowien]) VALUES (4, 2, 5, CAST(9.95 AS Decimal(18, 2)), 162)
INSERT [dbo].[Opisy_zamowien] ([ID_Zamowienia], [ID_Produktu], [Ilosc], [Cena], [ID_Opisu_Zamowien]) VALUES (4, 6, 1, CAST(88.88 AS Decimal(18, 2)), 163)
INSERT [dbo].[Opisy_zamowien] ([ID_Zamowienia], [ID_Produktu], [Ilosc], [Cena], [ID_Opisu_Zamowien]) VALUES (4, 6, 1, CAST(88.88 AS Decimal(18, 2)), 164)
INSERT [dbo].[Opisy_zamowien] ([ID_Zamowienia], [ID_Produktu], [Ilosc], [Cena], [ID_Opisu_Zamowien]) VALUES (5, 1, 1, CAST(5.90 AS Decimal(18, 2)), 165)
INSERT [dbo].[Opisy_zamowien] ([ID_Zamowienia], [ID_Produktu], [Ilosc], [Cena], [ID_Opisu_Zamowien]) VALUES (6, 1, 20, CAST(118.00 AS Decimal(18, 2)), 166)
INSERT [dbo].[Opisy_zamowien] ([ID_Zamowienia], [ID_Produktu], [Ilosc], [Cena], [ID_Opisu_Zamowien]) VALUES (7, 1, 12, CAST(70.80 AS Decimal(18, 2)), 167)
INSERT [dbo].[Opisy_zamowien] ([ID_Zamowienia], [ID_Produktu], [Ilosc], [Cena], [ID_Opisu_Zamowien]) VALUES (7, 1, 12, CAST(70.80 AS Decimal(18, 2)), 168)
INSERT [dbo].[Opisy_zamowien] ([ID_Zamowienia], [ID_Produktu], [Ilosc], [Cena], [ID_Opisu_Zamowien]) VALUES (8, 1, 10, CAST(59.00 AS Decimal(18, 2)), 169)
INSERT [dbo].[Opisy_zamowien] ([ID_Zamowienia], [ID_Produktu], [Ilosc], [Cena], [ID_Opisu_Zamowien]) VALUES (9, 6, 5, CAST(444.40 AS Decimal(18, 2)), 170)
INSERT [dbo].[Opisy_zamowien] ([ID_Zamowienia], [ID_Produktu], [Ilosc], [Cena], [ID_Opisu_Zamowien]) VALUES (10, 1, 2, CAST(11.80 AS Decimal(18, 2)), 171)
INSERT [dbo].[Opisy_zamowien] ([ID_Zamowienia], [ID_Produktu], [Ilosc], [Cena], [ID_Opisu_Zamowien]) VALUES (10, 1, 1, CAST(5.90 AS Decimal(18, 2)), 172)
INSERT [dbo].[Opisy_zamowien] ([ID_Zamowienia], [ID_Produktu], [Ilosc], [Cena], [ID_Opisu_Zamowien]) VALUES (10, 1, 1, CAST(5.90 AS Decimal(18, 2)), 173)
INSERT [dbo].[Opisy_zamowien] ([ID_Zamowienia], [ID_Produktu], [Ilosc], [Cena], [ID_Opisu_Zamowien]) VALUES (10, 1, 1, CAST(5.90 AS Decimal(18, 2)), 174)
INSERT [dbo].[Opisy_zamowien] ([ID_Zamowienia], [ID_Produktu], [Ilosc], [Cena], [ID_Opisu_Zamowien]) VALUES (11, 1, 1, CAST(5.90 AS Decimal(18, 2)), 175)
INSERT [dbo].[Opisy_zamowien] ([ID_Zamowienia], [ID_Produktu], [Ilosc], [Cena], [ID_Opisu_Zamowien]) VALUES (12, 2, 12, CAST(23.88 AS Decimal(18, 2)), 176)
INSERT [dbo].[Opisy_zamowien] ([ID_Zamowienia], [ID_Produktu], [Ilosc], [Cena], [ID_Opisu_Zamowien]) VALUES (13, 2, 7, CAST(14.70 AS Decimal(18, 2)), 177)
INSERT [dbo].[Opisy_zamowien] ([ID_Zamowienia], [ID_Produktu], [Ilosc], [Cena], [ID_Opisu_Zamowien]) VALUES (14, 2, 20, CAST(42.00 AS Decimal(18, 2)), 178)
INSERT [dbo].[Opisy_zamowien] ([ID_Zamowienia], [ID_Produktu], [Ilosc], [Cena], [ID_Opisu_Zamowien]) VALUES (14, 4, 2, CAST(16.60 AS Decimal(18, 2)), 179)
SET IDENTITY_INSERT [dbo].[Opisy_zamowien] OFF
INSERT [dbo].[Producenci] ([ID_Producenta], [Nazwa_Producenta], [ID_Kraju]) VALUES (1, N'Wolski zajazd', 1)
INSERT [dbo].[Producenci] ([ID_Producenta], [Nazwa_Producenta], [ID_Kraju]) VALUES (2, N'TransPol', 1)
INSERT [dbo].[Producenci] ([ID_Producenta], [Nazwa_Producenta], [ID_Kraju]) VALUES (3, N'producent1', 1)
INSERT [dbo].[Producenci] ([ID_Producenta], [Nazwa_Producenta], [ID_Kraju]) VALUES (4, N'producent2', 1)
INSERT [dbo].[Producenci] ([ID_Producenta], [Nazwa_Producenta], [ID_Kraju]) VALUES (5, N'producent3', 1)
INSERT [dbo].[Producenci] ([ID_Producenta], [Nazwa_Producenta], [ID_Kraju]) VALUES (6, N'producent4', 1)
INSERT [dbo].[Producenci] ([ID_Producenta], [Nazwa_Producenta], [ID_Kraju]) VALUES (7, N'proucent5', 2)
INSERT [dbo].[Producenci] ([ID_Producenta], [Nazwa_Producenta], [ID_Kraju]) VALUES (8, N'producent_test', 2)
INSERT [dbo].[Producenci] ([ID_Producenta], [Nazwa_Producenta], [ID_Kraju]) VALUES (9, N'Olza', 1)
INSERT [dbo].[Producenci] ([ID_Producenta], [Nazwa_Producenta], [ID_Kraju]) VALUES (10, N'Mondelez', 1)
INSERT [dbo].[Produkt] ([ID_Produktu], [Nazwa_Produktu], [ID_Producenta], [ID_Typu]) VALUES (1, N'test', 9, 1)
INSERT [dbo].[Produkt] ([ID_Produktu], [Nazwa_Produktu], [ID_Producenta], [ID_Typu]) VALUES (2, N'Coca-Cola', 3, 1)
INSERT [dbo].[Produkt] ([ID_Produktu], [Nazwa_Produktu], [ID_Producenta], [ID_Typu]) VALUES (3, N'Pepsi', 1, 1)
INSERT [dbo].[Produkt] ([ID_Produktu], [Nazwa_Produktu], [ID_Producenta], [ID_Typu]) VALUES (4, N'Cappy', 2, 1)
INSERT [dbo].[Produkt] ([ID_Produktu], [Nazwa_Produktu], [ID_Producenta], [ID_Typu]) VALUES (5, N'Żubrówka', 2, 1)
INSERT [dbo].[Produkt] ([ID_Produktu], [Nazwa_Produktu], [ID_Producenta], [ID_Typu]) VALUES (6, N'Brackie', 2, 1)
INSERT [dbo].[Produkt] ([ID_Produktu], [Nazwa_Produktu], [ID_Producenta], [ID_Typu]) VALUES (7, N'Mirinda', 1, 1)
INSERT [dbo].[Produkt] ([ID_Produktu], [Nazwa_Produktu], [ID_Producenta], [ID_Typu]) VALUES (8, N'Sprite', 3, 1)
INSERT [dbo].[Produkt] ([ID_Produktu], [Nazwa_Produktu], [ID_Producenta], [ID_Typu]) VALUES (9, N'Żywiec zdrój', 2, 1)
INSERT [dbo].[Produkt] ([ID_Produktu], [Nazwa_Produktu], [ID_Producenta], [ID_Typu]) VALUES (10, N'Ice Tea', 1, 1)
INSERT [dbo].[Towary] ([ID_Produktu], [Data], [Ilosc], [Cena], [ID_Towaru]) VALUES (1, CAST(N'2020-12-12' AS Date), 50, CAST(5.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Towary] ([ID_Produktu], [Data], [Ilosc], [Cena], [ID_Towaru]) VALUES (2, CAST(N'2020-01-01' AS Date), 100, CAST(100.00 AS Decimal(18, 2)), 2)
INSERT [dbo].[Typy] ([ID_Typu], [Nazwa_Typu]) VALUES (1, N'Woda')
INSERT [dbo].[Typy] ([ID_Typu], [Nazwa_Typu]) VALUES (2, N'Sok')
INSERT [dbo].[Typy] ([ID_Typu], [Nazwa_Typu]) VALUES (3, N'Alkohol')
INSERT [dbo].[Uzytkownicy] ([ID_Uzytkownika], [Login], [Password]) VALUES (1, N'admin', N'123       ')
INSERT [dbo].[Uzytkownicy] ([ID_Uzytkownika], [Login], [Password]) VALUES (2, N'majkel', N'123       ')
INSERT [dbo].[Uzytkownicy] ([ID_Uzytkownika], [Login], [Password]) VALUES (3, N'testowy', N'test      ')
INSERT [dbo].[Zamowienia] ([ID_Zamowienia], [ID_Klienta], [Rabat]) VALUES (1, 1, 1)
INSERT [dbo].[Zamowienia] ([ID_Zamowienia], [ID_Klienta], [Rabat]) VALUES (2, 41, 10)
INSERT [dbo].[Zamowienia] ([ID_Zamowienia], [ID_Klienta], [Rabat]) VALUES (3, 1, 0)
INSERT [dbo].[Zamowienia] ([ID_Zamowienia], [ID_Klienta], [Rabat]) VALUES (4, 44, 15)
INSERT [dbo].[Zamowienia] ([ID_Zamowienia], [ID_Klienta], [Rabat]) VALUES (5, 1, 0)
INSERT [dbo].[Zamowienia] ([ID_Zamowienia], [ID_Klienta], [Rabat]) VALUES (6, 1, 0)
INSERT [dbo].[Zamowienia] ([ID_Zamowienia], [ID_Klienta], [Rabat]) VALUES (7, 1, 0)
INSERT [dbo].[Zamowienia] ([ID_Zamowienia], [ID_Klienta], [Rabat]) VALUES (8, 45, 3)
INSERT [dbo].[Zamowienia] ([ID_Zamowienia], [ID_Klienta], [Rabat]) VALUES (9, 1, 0)
INSERT [dbo].[Zamowienia] ([ID_Zamowienia], [ID_Klienta], [Rabat]) VALUES (10, 1, 10)
INSERT [dbo].[Zamowienia] ([ID_Zamowienia], [ID_Klienta], [Rabat]) VALUES (11, 1, 0)
INSERT [dbo].[Zamowienia] ([ID_Zamowienia], [ID_Klienta], [Rabat]) VALUES (12, 44, 10)
INSERT [dbo].[Zamowienia] ([ID_Zamowienia], [ID_Klienta], [Rabat]) VALUES (13, 1, 2)
INSERT [dbo].[Zamowienia] ([ID_Zamowienia], [ID_Klienta], [Rabat]) VALUES (14, 47, 10)

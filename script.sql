USE [master]
GO
/****** Object:  Database [RentingStore]    Script Date: 24/02/2020 1:52:35 PM ******/
CREATE DATABASE [RentingStore]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'RentingStore', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\RentingStore.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'RentingStore_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\RentingStore_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [RentingStore] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [RentingStore].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [RentingStore] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [RentingStore] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [RentingStore] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [RentingStore] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [RentingStore] SET ARITHABORT OFF 
GO
ALTER DATABASE [RentingStore] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [RentingStore] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [RentingStore] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [RentingStore] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [RentingStore] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [RentingStore] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [RentingStore] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [RentingStore] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [RentingStore] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [RentingStore] SET  DISABLE_BROKER 
GO
ALTER DATABASE [RentingStore] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [RentingStore] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [RentingStore] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [RentingStore] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [RentingStore] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [RentingStore] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [RentingStore] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [RentingStore] SET RECOVERY FULL 
GO
ALTER DATABASE [RentingStore] SET  MULTI_USER 
GO
ALTER DATABASE [RentingStore] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [RentingStore] SET DB_CHAINING OFF 
GO
ALTER DATABASE [RentingStore] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [RentingStore] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [RentingStore] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [RentingStore] SET QUERY_STORE = OFF
GO
USE [RentingStore]
GO
/****** Object:  Table [dbo].[Rented]    Script Date: 24/02/2020 1:52:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rented](
	[RentalID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NOT NULL,
	[MovieID] [int] NOT NULL,
	[RentFrom] [datetime] NOT NULL,
	[RentTill] [datetime] NOT NULL,
 CONSTRAINT [PK_Rented] PRIMARY KEY CLUSTERED 
(
	[RentalID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[Top_Customer_View]    Script Date: 24/02/2020 1:52:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Top_Customer_View]
AS
SELECT        COUNT(MovieID) AS top_customer
FROM            dbo.Rented
GROUP BY CustomerID
GO
/****** Object:  View [dbo].[topmovie]    Script Date: 24/02/2020 1:52:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[topmovie]
AS
SELECT        TOP (100) COUNT(*) AS tm
FROM            dbo.Rented
GROUP BY MovieID
ORDER BY tm DESC
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 24/02/2020 1:52:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[CustomerID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
	[Address] [text] NOT NULL,
	[PhoneNumber] [varchar](10) NOT NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Movies]    Script Date: 24/02/2020 1:52:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Movies](
	[MovieID] [int] IDENTITY(1,1) NOT NULL,
	[MovieTitle] [varchar](100) NOT NULL,
	[MovieReleaseDate] [datetime] NOT NULL,
	[MovieRatings] [int] NOT NULL,
	[MovieCopies] [int] NOT NULL,
	[MovieRentingCost] [varchar](50) NOT NULL,
	[MovieGenre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Movies] PRIMARY KEY CLUSTERED 
(
	[MovieID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Customers] ON 


INSERT [dbo].[Customers] ([CustomerID], [FirstName], [LastName], [Address], [PhoneNumber]) VALUES (15, N'Sima', N'singh', N'Manukau', N'54789652')
INSERT [dbo].[Customers] ([CustomerID], [FirstName], [LastName], [Address], [PhoneNumber]) VALUES (16, N'Raju', N'Singh', N'Manurewa', N'45879621')
INSERT [dbo].[Customers] ([CustomerID], [FirstName], [LastName], [Address], [PhoneNumber]) VALUES (17, N'Nikhil', N'Brar', N'manurewa', N'24667632')
INSERT [dbo].[Customers] ([CustomerID], [FirstName], [LastName], [Address], [PhoneNumber]) VALUES (18, N'Simmi ', N'Kaur', N'Mount Eden', N'54798426')
INSERT [dbo].[Customers] ([CustomerID], [FirstName], [LastName], [Address], [PhoneNumber]) VALUES (19, N'Pinky', N'Patel', N'Takanini', N'55463231')
SET IDENTITY_INSERT [dbo].[Customers] OFF
SET IDENTITY_INSERT [dbo].[Movies] ON 

INSERT [dbo].[Movies] ([MovieID], [MovieTitle], [MovieReleaseDate], [MovieRatings], [MovieCopies], [MovieRentingCost], [MovieGenre]) VALUES (1, N'Supna', CAST(N'2019-07-12T00:00:00.000' AS DateTime), 8, 2, N'20', N'abc')
INSERT [dbo].[Movies] ([MovieID], [MovieTitle], [MovieReleaseDate], [MovieRatings], [MovieCopies], [MovieRentingCost], [MovieGenre]) VALUES (4, N'mubarak', CAST(N'2019-08-14T00:00:00.000' AS DateTime), 3, 3, N'60', N'def')
INSERT [dbo].[Movies] ([MovieID], [MovieTitle], [MovieReleaseDate], [MovieRatings], [MovieCopies], [MovieRentingCost], [MovieGenre]) VALUES (5, N'notebook', CAST(N'2017-08-02T00:00:00.000' AS DateTime), 4, 5, N'35', N'klm')
INSERT [dbo].[Movies] ([MovieID], [MovieTitle], [MovieReleaseDate], [MovieRatings], [MovieCopies], [MovieRentingCost], [MovieGenre]) VALUES (6, N'Beautiful', CAST(N'2018-07-04T00:00:00.000' AS DateTime), 6, 2, N'20', N'tyu')
INSERT [dbo].[Movies] ([MovieID], [MovieTitle], [MovieReleaseDate], [MovieRatings], [MovieCopies], [MovieRentingCost], [MovieGenre]) VALUES (7, N'Easy Things', CAST(N'2018-05-09T00:00:00.000' AS DateTime), 5, 4, N'45', N'dfg')
INSERT [dbo].[Movies] ([MovieID], [MovieTitle], [MovieReleaseDate], [MovieRatings], [MovieCopies], [MovieRentingCost], [MovieGenre]) VALUES (8, N'Little things', CAST(N'2019-07-05T00:00:00.000' AS DateTime), 7, 3, N'36', N'mkl')
INSERT [dbo].[Movies] ([MovieID], [MovieTitle], [MovieReleaseDate], [MovieRatings], [MovieCopies], [MovieRentingCost], [MovieGenre]) VALUES (9, N'Jumanji', CAST(N'2017-07-12T00:00:00.000' AS DateTime), 8, 2, N'67', N'rtu')
INSERT [dbo].[Movies] ([MovieID], [MovieTitle], [MovieReleaseDate], [MovieRatings], [MovieCopies], [MovieRentingCost], [MovieGenre]) VALUES (10, N'Monster', CAST(N'2018-06-03T00:00:00.000' AS DateTime), 7, 5, N'20', N'lkj')
INSERT [dbo].[Movies] ([MovieID], [MovieTitle], [MovieReleaseDate], [MovieRatings], [MovieCopies], [MovieRentingCost], [MovieGenre]) VALUES (11, N'The Last Date', CAST(N'2019-12-03T00:00:00.000' AS DateTime), 6, 4, N'13', N'pli')
SET IDENTITY_INSERT [dbo].[Movies] OFF
SET IDENTITY_INSERT [dbo].[Rented] ON 

INSERT [dbo].[Rented] ([RentalID], [CustomerID], [MovieID], [RentFrom], [RentTill]) VALUES (3, 5, 1, CAST(N'2017-06-03T00:00:00.000' AS DateTime), CAST(N'2017-06-18T00:00:00.000' AS DateTime))
INSERT [dbo].[Rented] ([RentalID], [CustomerID], [MovieID], [RentFrom], [RentTill]) VALUES (12, 12, 4, CAST(N'2017-03-14T00:00:00.000' AS DateTime), CAST(N'2017-08-03T00:00:00.000' AS DateTime))
INSERT [dbo].[Rented] ([RentalID], [CustomerID], [MovieID], [RentFrom], [RentTill]) VALUES (14, 13, 5, CAST(N'2018-04-13T00:00:00.000' AS DateTime), CAST(N'2018-05-02T00:00:00.000' AS DateTime))
INSERT [dbo].[Rented] ([RentalID], [CustomerID], [MovieID], [RentFrom], [RentTill]) VALUES (15, 14, 6, CAST(N'2017-04-05T00:00:00.000' AS DateTime), CAST(N'2017-04-18T00:00:00.000' AS DateTime))
INSERT [dbo].[Rented] ([RentalID], [CustomerID], [MovieID], [RentFrom], [RentTill]) VALUES (16, 15, 7, CAST(N'2018-06-17T00:00:00.000' AS DateTime), CAST(N'2018-06-25T00:00:00.000' AS DateTime))
INSERT [dbo].[Rented] ([RentalID], [CustomerID], [MovieID], [RentFrom], [RentTill]) VALUES (17, 16, 8, CAST(N'2018-12-08T00:00:00.000' AS DateTime), CAST(N'2018-12-20T00:00:00.000' AS DateTime))
INSERT [dbo].[Rented] ([RentalID], [CustomerID], [MovieID], [RentFrom], [RentTill]) VALUES (18, 17, 9, CAST(N'2019-03-10T00:00:00.000' AS DateTime), CAST(N'2019-03-15T00:00:00.000' AS DateTime))
INSERT [dbo].[Rented] ([RentalID], [CustomerID], [MovieID], [RentFrom], [RentTill]) VALUES (19, 18, 10, CAST(N'2019-08-12T00:00:00.000' AS DateTime), CAST(N'2019-09-13T00:00:00.000' AS DateTime))
INSERT [dbo].[Rented] ([RentalID], [CustomerID], [MovieID], [RentFrom], [RentTill]) VALUES (23, 5, 4, CAST(N'2019-08-12T00:00:00.000' AS DateTime), CAST(N'2019-08-13T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Rented] OFF
ALTER TABLE [dbo].[Rented]  WITH CHECK ADD  CONSTRAINT [FK_Rented_Customers] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customers] ([CustomerID])
GO
ALTER TABLE [dbo].[Rented] CHECK CONSTRAINT [FK_Rented_Customers]
GO
ALTER TABLE [dbo].[Rented]  WITH CHECK ADD  CONSTRAINT [FK_Rented_Movies] FOREIGN KEY([MovieID])
REFERENCES [dbo].[Movies] ([MovieID])
GO
ALTER TABLE [dbo].[Rented] CHECK CONSTRAINT [FK_Rented_Movies]
GO
/****** Object:  StoredProcedure [dbo].[GetAllData]    Script Date: 24/02/2020 1:52:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAllData]
	@ID int
AS
	SET NOCOUNT ON;
		SELECT * FROM Movies WHERE MovieID = @ID
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Rented"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 161
               Right = 272
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Top_Customer_View'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Top_Customer_View'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Rented"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'topmovie'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'topmovie'
GO
USE [master]
GO
ALTER DATABASE [RentingStore] SET  READ_WRITE 
GO

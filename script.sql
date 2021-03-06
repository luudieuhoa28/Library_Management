USE [master]
GO
/****** Object:  Database [LibraryManagement]    Script Date: 7/16/2020 4:47:39 PM ******/
CREATE DATABASE [LibraryManagement]
GO
ALTER DATABASE [LibraryManagement] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [LibraryManagement] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [LibraryManagement] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [LibraryManagement] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [LibraryManagement] SET ARITHABORT OFF 
GO
ALTER DATABASE [LibraryManagement] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [LibraryManagement] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [LibraryManagement] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [LibraryManagement] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [LibraryManagement] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [LibraryManagement] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [LibraryManagement] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [LibraryManagement] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [LibraryManagement] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [LibraryManagement] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [LibraryManagement] SET  DISABLE_BROKER 
GO
ALTER DATABASE [LibraryManagement] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [LibraryManagement] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [LibraryManagement] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [LibraryManagement] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [LibraryManagement] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [LibraryManagement] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [LibraryManagement] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [LibraryManagement] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [LibraryManagement] SET  MULTI_USER 
GO
ALTER DATABASE [LibraryManagement] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [LibraryManagement] SET DB_CHAINING OFF 
GO
ALTER DATABASE [LibraryManagement] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [LibraryManagement] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [LibraryManagement]
GO
/****** Object:  Table [dbo].[Book]    Script Date: 7/16/2020 4:47:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Book](
	[book_id] [nvarchar](10) NOT NULL,
	[book_name] [nvarchar](50) NULL,
	[author] [nvarchar](50) NULL,
	[publisher] [nvarchar](50) NULL,
	[total_books] [int] NULL,
	[available_books] [int] NULL,
	[year_export] [nvarchar](10) NULL,
	[status] [bit] NULL,
 CONSTRAINT [PK_Book] PRIMARY KEY CLUSTERED 
(
	[book_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Borrow_Order]    Script Date: 7/16/2020 4:47:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Borrow_Order](
	[borrow_order_id] [int] IDENTITY(1,1) NOT NULL,
	[library_user_id] [nvarchar](50) NULL,
	[borrow_date] [date] NULL,
	[return_date] [date] NULL,
	[is_returned] [bit] NULL,
 CONSTRAINT [PK_Borrow_Order] PRIMARY KEY CLUSTERED 
(
	[borrow_order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Library_User]    Script Date: 7/16/2020 4:47:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Library_User](
	[library_user_id] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NULL,
	[role_id] [nvarchar](10) NULL,
	[name] [nvarchar](100) NULL,
	[gender] [nvarchar](10) NULL,
	[phone] [nvarchar](10) NULL,
	[address] [nvarchar](200) NULL,
	[status] [bit] NOT NULL,
 CONSTRAINT [PK_Library_User] PRIMARY KEY CLUSTERED 
(
	[library_user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Order_Detail]    Script Date: 7/16/2020 4:47:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order_Detail](
	[borrow_order_id] [int] NOT NULL,
	[book_id] [nvarchar](10) NOT NULL,
	[quantity] [int] NULL,
 CONSTRAINT [PK_Order_Detail] PRIMARY KEY CLUSTERED 
(
	[borrow_order_id] ASC,
	[book_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Role_User]    Script Date: 7/16/2020 4:47:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role_User](
	[role_id] [nvarchar](10) NOT NULL,
	[role_name] [nvarchar](10) NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[role_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[Book] ([book_id], [book_name], [author], [publisher], [total_books], [available_books], [year_export], [status]) VALUES (N'2123', N'132', N'123', N'123', 12, 12, N'11212', 0)
INSERT [dbo].[Book] ([book_id], [book_name], [author], [publisher], [total_books], [available_books], [year_export], [status]) VALUES (N'B1', N'Zen and the Art of Motorcycle Maintenance', N'Robert M. Pirsig', N'', 20, 20, N'1974', 1)
INSERT [dbo].[Book] ([book_id], [book_name], [author], [publisher], [total_books], [available_books], [year_export], [status]) VALUES (N'B10', N'Think Java', N'Allen B. Downey', N'', 4, 4, N'1999', 0)
INSERT [dbo].[Book] ([book_id], [book_name], [author], [publisher], [total_books], [available_books], [year_export], [status]) VALUES (N'B11', N'Nhà giả kim', N'Paulo Coelho', N'', 10, 10, N'1988', 1)
INSERT [dbo].[Book] ([book_id], [book_name], [author], [publisher], [total_books], [available_books], [year_export], [status]) VALUES (N'B2', N'Watership Down', N'Richard Adams', N'Rex Collings', 30, 30, N'1978', 1)
INSERT [dbo].[Book] ([book_id], [book_name], [author], [publisher], [total_books], [available_books], [year_export], [status]) VALUES (N'B3', N'Tôi thấy hoa vàng trên cỏ xanh', N'Nguyễn Nhật Ánh', N'NXB Trẻ', 4, 4, N'2020', 1)
INSERT [dbo].[Book] ([book_id], [book_name], [author], [publisher], [total_books], [available_books], [year_export], [status]) VALUES (N'B4', N'Làm bạn với bầu trời', N'Nguyễn Nhật Ánh', N'NXB Trẻ', 30, 30, N'2019', 1)
INSERT [dbo].[Book] ([book_id], [book_name], [author], [publisher], [total_books], [available_books], [year_export], [status]) VALUES (N'B5', N'Doraemon', N'Fujiko Fujio', N'Kim Đồng', 70, 70, NULL, 1)
INSERT [dbo].[Book] ([book_id], [book_name], [author], [publisher], [total_books], [available_books], [year_export], [status]) VALUES (N'B6', N'Thần đồng đất Việt', N'Lê Linh', N'Kim Đồng', 30, 30, N'0', 1)
INSERT [dbo].[Book] ([book_id], [book_name], [author], [publisher], [total_books], [available_books], [year_export], [status]) VALUES (N'B7', N'Hạt giống tâm hồn', N'Jack Canfield', N'First News', 17, 17, NULL, 1)
INSERT [dbo].[Book] ([book_id], [book_name], [author], [publisher], [total_books], [available_books], [year_export], [status]) VALUES (N'B8', N'Cafe cùng Tony', N'Tony Buổi Sáng', N'NXB Trẻ', 25, 25, N'2014', 1)
INSERT [dbo].[Book] ([book_id], [book_name], [author], [publisher], [total_books], [available_books], [year_export], [status]) VALUES (N'B9', N'One Piece', N'Oda Eiichiro', N'Kim Đồng', 40, 40, NULL, 1)
INSERT [dbo].[Book] ([book_id], [book_name], [author], [publisher], [total_books], [available_books], [year_export], [status]) VALUES (N'C2', N'Tokuda and friends', N'Natabong', N'FPT U', 20, 20, N'2010', 1)
SET IDENTITY_INSERT [dbo].[Borrow_Order] ON 

INSERT [dbo].[Borrow_Order] ([borrow_order_id], [library_user_id], [borrow_date], [return_date], [is_returned]) VALUES (274, N'giangxyz', CAST(0x55410B00 AS Date), CAST(0x74410B00 AS Date), 1)
INSERT [dbo].[Borrow_Order] ([borrow_order_id], [library_user_id], [borrow_date], [return_date], [is_returned]) VALUES (275, N'nam123', CAST(0x55410B00 AS Date), CAST(0x74410B00 AS Date), 1)
SET IDENTITY_INSERT [dbo].[Borrow_Order] OFF
INSERT [dbo].[Library_User] ([library_user_id], [password], [role_id], [name], [gender], [phone], [address], [status]) VALUES (N'asd', N'asd', N'US', N'123', N'male', N'0123123', N'asd', 0)
INSERT [dbo].[Library_User] ([library_user_id], [password], [role_id], [name], [gender], [phone], [address], [status]) VALUES (N'duyabc', N'duyabc', N'US        ', N'Tran Le Duy', N'male      ', N'1231231234', N'123 Tang Nhon Phu', 1)
INSERT [dbo].[Library_User] ([library_user_id], [password], [role_id], [name], [gender], [phone], [address], [status]) VALUES (N'giangxyz', N'giangxyz', N'US        ', N'Vũ Thu Giang', N'male', N'1234561234', N'105 duong so 144444', 1)
INSERT [dbo].[Library_User] ([library_user_id], [password], [role_id], [name], [gender], [phone], [address], [status]) VALUES (N'hoa', N'hoa', N'AD        ', N'Lưu Diệu Hoa', N'female', N'0964099648', N'103 duong so 111111', 1)
INSERT [dbo].[Library_User] ([library_user_id], [password], [role_id], [name], [gender], [phone], [address], [status]) VALUES (N'hoaldse140830@fpt.edu.vn', N'Q:nC3$v~]/''.R`kc', N'US', N'Lưu Diệu Hoa', N'male', N'1231234121', N'', 1)
INSERT [dbo].[Library_User] ([library_user_id], [password], [role_id], [name], [gender], [phone], [address], [status]) VALUES (N'HongNgoc', N'ngoc', N'US', N'Ngọc', N'female    ', N'1231231231', N'', 1)
INSERT [dbo].[Library_User] ([library_user_id], [password], [role_id], [name], [gender], [phone], [address], [status]) VALUES (N'luudieuhoa28@gmail.com', N'Q:nC3$v~]/''.R`kc', N'US        ', N'luudieuhoa28', N'          ', N'', N'', 1)
INSERT [dbo].[Library_User] ([library_user_id], [password], [role_id], [name], [gender], [phone], [address], [status]) VALUES (N'mauhieu', N'1', N'US', N'mauhieu', N'male', N'1234123487', N'i4y7128341234', 1)
INSERT [dbo].[Library_User] ([library_user_id], [password], [role_id], [name], [gender], [phone], [address], [status]) VALUES (N'nam', N'1', N'US', N'nam', N'female', N'123123', N'', 1)
INSERT [dbo].[Library_User] ([library_user_id], [password], [role_id], [name], [gender], [phone], [address], [status]) VALUES (N'nam123', N'1', N'US        ', N'Nam Ngg', N'female', N'', N'', 1)
INSERT [dbo].[Library_User] ([library_user_id], [password], [role_id], [name], [gender], [phone], [address], [status]) VALUES (N'phuong456', N'phuong456', N'US        ', N'Phạm Thanh Phương', N'male      ', N'3232322323', N'104 duong so 12', 1)
INSERT [dbo].[Order_Detail] ([borrow_order_id], [book_id], [quantity]) VALUES (274, N'B1', 18)
INSERT [dbo].[Order_Detail] ([borrow_order_id], [book_id], [quantity]) VALUES (275, N'B1', 9)
INSERT [dbo].[Order_Detail] ([borrow_order_id], [book_id], [quantity]) VALUES (275, N'B2', 3)
INSERT [dbo].[Order_Detail] ([borrow_order_id], [book_id], [quantity]) VALUES (275, N'B3', 4)
INSERT [dbo].[Role_User] ([role_id], [role_name]) VALUES (N'AD        ', N'admin     ')
INSERT [dbo].[Role_User] ([role_id], [role_name]) VALUES (N'US        ', N'user      ')
ALTER TABLE [dbo].[Borrow_Order]  WITH CHECK ADD  CONSTRAINT [FK__Borrow_Or__libra__403A8C7D] FOREIGN KEY([library_user_id])
REFERENCES [dbo].[Library_User] ([library_user_id])
GO
ALTER TABLE [dbo].[Borrow_Order] CHECK CONSTRAINT [FK__Borrow_Or__libra__403A8C7D]
GO
ALTER TABLE [dbo].[Library_User]  WITH CHECK ADD  CONSTRAINT [FK__Library_U__role___1B0907CE] FOREIGN KEY([role_id])
REFERENCES [dbo].[Role_User] ([role_id])
GO
ALTER TABLE [dbo].[Library_User] CHECK CONSTRAINT [FK__Library_U__role___1B0907CE]
GO
ALTER TABLE [dbo].[Order_Detail]  WITH CHECK ADD  CONSTRAINT [FK__Order_Det__book___20C1E124] FOREIGN KEY([book_id])
REFERENCES [dbo].[Book] ([book_id])
GO
ALTER TABLE [dbo].[Order_Detail] CHECK CONSTRAINT [FK__Order_Det__book___20C1E124]
GO
ALTER TABLE [dbo].[Order_Detail]  WITH CHECK ADD  CONSTRAINT [FK__Order_Det__borro__3A81B327] FOREIGN KEY([borrow_order_id])
REFERENCES [dbo].[Borrow_Order] ([borrow_order_id])
GO
ALTER TABLE [dbo].[Order_Detail] CHECK CONSTRAINT [FK__Order_Det__borro__3A81B327]
GO
USE [master]
GO
ALTER DATABASE [LibraryManagement] SET  READ_WRITE 
GO

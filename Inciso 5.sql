USE [master]
GO
/****** Object:  Database [CanjePuntos]    Script Date: 5/08/2023 18:14:34 ******/
CREATE DATABASE [CanjePuntos]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CanjePuntos', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\CanjePuntos.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'CanjePuntos_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\CanjePuntos_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [CanjePuntos] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CanjePuntos].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CanjePuntos] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CanjePuntos] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CanjePuntos] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CanjePuntos] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CanjePuntos] SET ARITHABORT OFF 
GO
ALTER DATABASE [CanjePuntos] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CanjePuntos] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CanjePuntos] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CanjePuntos] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CanjePuntos] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CanjePuntos] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CanjePuntos] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CanjePuntos] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CanjePuntos] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CanjePuntos] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CanjePuntos] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CanjePuntos] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CanjePuntos] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CanjePuntos] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CanjePuntos] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CanjePuntos] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CanjePuntos] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CanjePuntos] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [CanjePuntos] SET  MULTI_USER 
GO
ALTER DATABASE [CanjePuntos] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CanjePuntos] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CanjePuntos] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CanjePuntos] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CanjePuntos] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [CanjePuntos] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [CanjePuntos] SET QUERY_STORE = OFF
GO
USE [CanjePuntos]
GO
/****** Object:  Table [dbo].[articulo]    Script Date: 5/08/2023 18:14:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[articulo](
	[idArticulo] [int] NOT NULL,
	[codigo] [int] NULL,
	[idTipo] [int] NULL,
	[idSubTipo] [int] NULL,
	[Nombre] [varchar](50) NULL,
	[PrecioCosto] [numeric](18, 2) NULL,
	[PrecioVenta] [numeric](18, 2) NULL,
 CONSTRAINT [PK_articulo] PRIMARY KEY CLUSTERED 
(
	[idArticulo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Articulo_Promocion]    Script Date: 5/08/2023 18:14:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Articulo_Promocion](
	[idArticuloPromocion] [int] NOT NULL,
	[idArticulo] [int] NULL,
	[idPromocion] [int] NULL,
	[PrecioPromocion] [numeric](18, 2) NULL,
 CONSTRAINT [PK_ArticuloPromocion] PRIMARY KEY CLUSTERED 
(
	[idArticuloPromocion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Canje]    Script Date: 5/08/2023 18:14:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Canje](
	[id] [int] NOT NULL,
	[idArticuloPromocion] [int] NULL,
	[idArticulo] [int] NULL,
	[Cantidad] [int] NULL,
	[PrecioCosto] [numeric](18, 2) NULL,
	[PrecioVenta] [numeric](18, 2) NULL,
	[Observaciones] [varchar](250) NULL,
	[NombreVendedor] [varchar](250) NULL,
	[FechaHoraVenta] [datetime] NULL,
 CONSTRAINT [PK_Canje] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Promociones]    Script Date: 5/08/2023 18:14:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Promociones](
	[idPromocion] [int] NOT NULL,
	[FechaInicio] [date] NULL,
	[FechaVencimiento] [date] NULL,
	[CostoPuntos] [numeric](18, 2) NULL,
 CONSTRAINT [PK_Promociones] PRIMARY KEY CLUSTERED 
(
	[idPromocion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Stock]    Script Date: 5/08/2023 18:14:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stock](
	[id] [int] NOT NULL,
	[idArticulo] [int] NULL,
	[idSucursal] [int] NULL,
	[Existencia] [int] NULL,
 CONSTRAINT [PK_Stock] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sub_Tipo]    Script Date: 5/08/2023 18:14:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sub_Tipo](
	[idSubTipo] [int] NOT NULL,
	[Descripcion] [varchar](50) NULL,
 CONSTRAINT [PK_Sub_Tipo] PRIMARY KEY CLUSTERED 
(
	[idSubTipo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sucursal]    Script Date: 5/08/2023 18:14:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sucursal](
	[idSucursal] [int] NOT NULL,
	[Descripcion] [varchar](50) NULL,
	[Direccion] [varchar](150) NULL,
	[Telefono] [varchar](20) NULL,
 CONSTRAINT [PK_Sucursal] PRIMARY KEY CLUSTERED 
(
	[idSucursal] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tipo]    Script Date: 5/08/2023 18:14:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tipo](
	[idTipo] [int] NOT NULL,
	[Descripcion] [varchar](50) NULL,
 CONSTRAINT [PK_Tipo] PRIMARY KEY CLUSTERED 
(
	[idTipo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Canje] ADD  CONSTRAINT [DF_Canje_FechaHoraVenta]  DEFAULT (getdate()) FOR [FechaHoraVenta]
GO
ALTER TABLE [dbo].[articulo]  WITH CHECK ADD  CONSTRAINT [FK_articulo_Sub_Tipo] FOREIGN KEY([idSubTipo])
REFERENCES [dbo].[Sub_Tipo] ([idSubTipo])
GO
ALTER TABLE [dbo].[articulo] CHECK CONSTRAINT [FK_articulo_Sub_Tipo]
GO
ALTER TABLE [dbo].[articulo]  WITH CHECK ADD  CONSTRAINT [FK_articulo_Tipo] FOREIGN KEY([idTipo])
REFERENCES [dbo].[Tipo] ([idTipo])
GO
ALTER TABLE [dbo].[articulo] CHECK CONSTRAINT [FK_articulo_Tipo]
GO
ALTER TABLE [dbo].[Articulo_Promocion]  WITH CHECK ADD  CONSTRAINT [FK_Articulo_Promocion_articulo] FOREIGN KEY([idArticulo])
REFERENCES [dbo].[articulo] ([idArticulo])
GO
ALTER TABLE [dbo].[Articulo_Promocion] CHECK CONSTRAINT [FK_Articulo_Promocion_articulo]
GO
ALTER TABLE [dbo].[Articulo_Promocion]  WITH CHECK ADD  CONSTRAINT [FK_Articulo_Promocion_Promociones] FOREIGN KEY([idPromocion])
REFERENCES [dbo].[Promociones] ([idPromocion])
GO
ALTER TABLE [dbo].[Articulo_Promocion] CHECK CONSTRAINT [FK_Articulo_Promocion_Promociones]
GO
ALTER TABLE [dbo].[Canje]  WITH CHECK ADD  CONSTRAINT [FK_Canje_articulo] FOREIGN KEY([idArticulo])
REFERENCES [dbo].[articulo] ([idArticulo])
GO
ALTER TABLE [dbo].[Canje] CHECK CONSTRAINT [FK_Canje_articulo]
GO
ALTER TABLE [dbo].[Canje]  WITH CHECK ADD  CONSTRAINT [FK_Canje_Articulo_Promocion] FOREIGN KEY([idArticuloPromocion])
REFERENCES [dbo].[Articulo_Promocion] ([idArticuloPromocion])
GO
ALTER TABLE [dbo].[Canje] CHECK CONSTRAINT [FK_Canje_Articulo_Promocion]
GO
ALTER TABLE [dbo].[Stock]  WITH CHECK ADD  CONSTRAINT [FK_Stock_articulo] FOREIGN KEY([idArticulo])
REFERENCES [dbo].[articulo] ([idArticulo])
GO
ALTER TABLE [dbo].[Stock] CHECK CONSTRAINT [FK_Stock_articulo]
GO
ALTER TABLE [dbo].[Stock]  WITH CHECK ADD  CONSTRAINT [FK_Stock_Sucursal] FOREIGN KEY([idSucursal])
REFERENCES [dbo].[Sucursal] ([idSucursal])
GO
ALTER TABLE [dbo].[Stock] CHECK CONSTRAINT [FK_Stock_Sucursal]
GO
USE [master]
GO
ALTER DATABASE [CanjePuntos] SET  READ_WRITE 
GO

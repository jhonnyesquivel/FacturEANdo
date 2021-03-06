USE [master]
GO
/****** Object:  Database [Factureando]    Script Date: 13/06/2016 12:06:42 a. m. ******/
CREATE DATABASE [Factureando]
 CONTAINMENT = NONE
 ON  PRIMARY 
GO
ALTER DATABASE [Factureando] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Factureando].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Factureando] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Factureando] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Factureando] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Factureando] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Factureando] SET ARITHABORT OFF 
GO
ALTER DATABASE [Factureando] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Factureando] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Factureando] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Factureando] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Factureando] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Factureando] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Factureando] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Factureando] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Factureando] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Factureando] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Factureando] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Factureando] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Factureando] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Factureando] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Factureando] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Factureando] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Factureando] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Factureando] SET RECOVERY FULL 
GO
ALTER DATABASE [Factureando] SET  MULTI_USER 
GO
ALTER DATABASE [Factureando] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Factureando] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Factureando] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Factureando] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Factureando] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Factureando] SET QUERY_STORE = OFF
GO
USE [Factureando]
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [Factureando]
GO
/****** Object:  Table [dbo].[Clientes]    Script Date: 13/06/2016 12:06:42 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Clientes](
	[IdCliente] [int] IDENTITY(1,1) NOT NULL,
	[TipoIdentificacion] [varchar](5) NOT NULL,
	[NumeroIdentificacion] [varchar](22) NOT NULL,
	[PrimerNombre] [varchar](100) NULL,
	[SegundoNombre] [varchar](100) NULL,
	[PrimerApellido] [varchar](100) NULL,
	[SegundoApellido] [varchar](100) NULL,
	[RazonSocial] [varchar](400) NOT NULL,
	[IdEstrato] [tinyint] NOT NULL,
 CONSTRAINT [PK_Clientes] PRIMARY KEY CLUSTERED 
(
	[IdCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DetalleFactura]    Script Date: 13/06/2016 12:06:43 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetalleFactura](
	[IdDetalleFactura] [int] IDENTITY(1,1) NOT NULL,
	[IdFactura] [int] NOT NULL,
	[IdServicio] [smallint] NOT NULL,
	[CantidadConsumo] [int] NOT NULL,
	[ValorConsumo] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_DetalleFactura] PRIMARY KEY CLUSTERED 
(
	[IdDetalleFactura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Estratos]    Script Date: 13/06/2016 12:06:43 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Estratos](
	[IdEstrato] [tinyint] IDENTITY(1,1) NOT NULL,
	[NombreEstrato] [varchar](50) NOT NULL,
	[NivelEstrato] [char](1) NOT NULL,
	[ValorEstrato] [decimal](18, 2) NOT NULL,
	[CargoFijo] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_Estratos] PRIMARY KEY CLUSTERED 
(
	[IdEstrato] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Facturas]    Script Date: 13/06/2016 12:06:43 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Facturas](
	[IdFactura] [int] IDENTITY(1,1) NOT NULL,
	[Consecutivo] [varchar](10) NOT NULL,
	[IdCliente] [int] NOT NULL,
	[Fecha] [datetime] NOT NULL,
 CONSTRAINT [PK_Facturas] PRIMARY KEY CLUSTERED 
(
	[IdFactura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Servicios]    Script Date: 13/06/2016 12:06:43 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Servicios](
	[IdServicio] [smallint] IDENTITY(1,1) NOT NULL,
	[NombreServicio] [varchar](100) NOT NULL,
	[Descripcion] [varchar](400) NOT NULL,
 CONSTRAINT [PK_Servicios] PRIMARY KEY CLUSTERED 
(
	[IdServicio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TarifasServicios]    Script Date: 13/06/2016 12:06:43 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TarifasServicios](
	[IdTarifaServicio] [int] IDENTITY(1,1) NOT NULL,
	[IdServicio] [smallint] NOT NULL,
	[IdEstrato] [tinyint] NOT NULL,
	[IdUnidad] [tinyint] NOT NULL,
	[ValorServicio] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_TarifasServicios] PRIMARY KEY CLUSTERED 
(
	[IdTarifaServicio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UnidadesTarifas]    Script Date: 13/06/2016 12:06:43 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UnidadesTarifas](
	[IdUnidad] [tinyint] IDENTITY(1,1) NOT NULL,
	[NombreUnidad] [varchar](50) NOT NULL,
 CONSTRAINT [PK_UnidadesTarifas] PRIMARY KEY CLUSTERED 
(
	[IdUnidad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Clientes] ON 

INSERT [dbo].[Clientes] ([IdCliente], [TipoIdentificacion], [NumeroIdentificacion], [PrimerNombre], [SegundoNombre], [PrimerApellido], [SegundoApellido], [RazonSocial], [IdEstrato]) VALUES (2062, N'CC', N'1022402101', N'Luis', N'CARLOS', N'mejia', N'Garcia', N'Luis CARLOS mejia Garcia', 6)
INSERT [dbo].[Clientes] ([IdCliente], [TipoIdentificacion], [NumeroIdentificacion], [PrimerNombre], [SegundoNombre], [PrimerApellido], [SegundoApellido], [RazonSocial], [IdEstrato]) VALUES (2063, N'NIT', N'01289371293', N'', N'', N'', N'', N'MargenCero', 5)
INSERT [dbo].[Clientes] ([IdCliente], [TipoIdentificacion], [NumeroIdentificacion], [PrimerNombre], [SegundoNombre], [PrimerApellido], [SegundoApellido], [RazonSocial], [IdEstrato]) VALUES (2064, N'NIT', N'409823049238', N'', N'', N'', N'', N'empresa prueba', 1)
INSERT [dbo].[Clientes] ([IdCliente], [TipoIdentificacion], [NumeroIdentificacion], [PrimerNombre], [SegundoNombre], [PrimerApellido], [SegundoApellido], [RazonSocial], [IdEstrato]) VALUES (2065, N'NIT', N'788726', N'', N'', N'', N'', N'Comcel SA', 6)
INSERT [dbo].[Clientes] ([IdCliente], [TipoIdentificacion], [NumeroIdentificacion], [PrimerNombre], [SegundoNombre], [PrimerApellido], [SegundoApellido], [RazonSocial], [IdEstrato]) VALUES (2066, N'CC', N'3242323423423', N'', N'', N'', N'', N'  ', 1)
INSERT [dbo].[Clientes] ([IdCliente], [TipoIdentificacion], [NumeroIdentificacion], [PrimerNombre], [SegundoNombre], [PrimerApellido], [SegundoApellido], [RazonSocial], [IdEstrato]) VALUES (2067, N'NIT', N'520335781', N'', N'', N'', N'', N'Industrias Caramelo', 5)
INSERT [dbo].[Clientes] ([IdCliente], [TipoIdentificacion], [NumeroIdentificacion], [PrimerNombre], [SegundoNombre], [PrimerApellido], [SegundoApellido], [RazonSocial], [IdEstrato]) VALUES (2068, N'NIT', N'492828493', N'', N'', N'', N'', N'Microsoft ', 6)
INSERT [dbo].[Clientes] ([IdCliente], [TipoIdentificacion], [NumeroIdentificacion], [PrimerNombre], [SegundoNombre], [PrimerApellido], [SegundoApellido], [RazonSocial], [IdEstrato]) VALUES (2070, N'NIT', N'345973848534', N'', N'', N'', N'', N'Oracle', 3)
INSERT [dbo].[Clientes] ([IdCliente], [TipoIdentificacion], [NumeroIdentificacion], [PrimerNombre], [SegundoNombre], [PrimerApellido], [SegundoApellido], [RazonSocial], [IdEstrato]) VALUES (2071, N'CC', N'9733675', N'JAIME', N'ALBERTO', N'GUTIERREZ', N'MEJÍA', N'JAIME ALBERTO GUTIERREZ MEJÍA', 4)
INSERT [dbo].[Clientes] ([IdCliente], [TipoIdentificacion], [NumeroIdentificacion], [PrimerNombre], [SegundoNombre], [PrimerApellido], [SegundoApellido], [RazonSocial], [IdEstrato]) VALUES (2072, N'NIT', N'8006003001', N'', N'', N'', N'', N'EMPRESA AQUILES BAILO YO', 13)
SET IDENTITY_INSERT [dbo].[Clientes] OFF
SET IDENTITY_INSERT [dbo].[DetalleFactura] ON 

INSERT [dbo].[DetalleFactura] ([IdDetalleFactura], [IdFactura], [IdServicio], [CantidadConsumo], [ValorConsumo]) VALUES (1014, 1015, 1, 12, CAST(180000.00 AS Decimal(18, 2)))
INSERT [dbo].[DetalleFactura] ([IdDetalleFactura], [IdFactura], [IdServicio], [CantidadConsumo], [ValorConsumo]) VALUES (1015, 1015, 2, 5, CAST(10000.00 AS Decimal(18, 2)))
INSERT [dbo].[DetalleFactura] ([IdDetalleFactura], [IdFactura], [IdServicio], [CantidadConsumo], [ValorConsumo]) VALUES (1016, 1015, 3, 10, CAST(4800.00 AS Decimal(18, 2)))
INSERT [dbo].[DetalleFactura] ([IdDetalleFactura], [IdFactura], [IdServicio], [CantidadConsumo], [ValorConsumo]) VALUES (1017, 1016, 1, 23500, CAST(352500000.00 AS Decimal(18, 2)))
INSERT [dbo].[DetalleFactura] ([IdDetalleFactura], [IdFactura], [IdServicio], [CantidadConsumo], [ValorConsumo]) VALUES (1018, 1016, 2, 23482, CAST(46964000.00 AS Decimal(18, 2)))
INSERT [dbo].[DetalleFactura] ([IdDetalleFactura], [IdFactura], [IdServicio], [CantidadConsumo], [ValorConsumo]) VALUES (1019, 1016, 3, 192384, CAST(92344320.00 AS Decimal(18, 2)))
INSERT [dbo].[DetalleFactura] ([IdDetalleFactura], [IdFactura], [IdServicio], [CantidadConsumo], [ValorConsumo]) VALUES (1020, 1017, 1, 10000, CAST(80000000.00 AS Decimal(18, 2)))
INSERT [dbo].[DetalleFactura] ([IdDetalleFactura], [IdFactura], [IdServicio], [CantidadConsumo], [ValorConsumo]) VALUES (1021, 1017, 2, 3000, CAST(1200000.00 AS Decimal(18, 2)))
INSERT [dbo].[DetalleFactura] ([IdDetalleFactura], [IdFactura], [IdServicio], [CantidadConsumo], [ValorConsumo]) VALUES (1022, 1017, 3, 5000, CAST(1100000.00 AS Decimal(18, 2)))
INSERT [dbo].[DetalleFactura] ([IdDetalleFactura], [IdFactura], [IdServicio], [CantidadConsumo], [ValorConsumo]) VALUES (1023, 1018, 1, 100, CAST(300000.00 AS Decimal(18, 2)))
INSERT [dbo].[DetalleFactura] ([IdDetalleFactura], [IdFactura], [IdServicio], [CantidadConsumo], [ValorConsumo]) VALUES (1024, 1018, 2, 200, CAST(400000.00 AS Decimal(18, 2)))
INSERT [dbo].[DetalleFactura] ([IdDetalleFactura], [IdFactura], [IdServicio], [CantidadConsumo], [ValorConsumo]) VALUES (1025, 1018, 3, 300, CAST(1500000.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[DetalleFactura] OFF
SET IDENTITY_INSERT [dbo].[Estratos] ON 

INSERT [dbo].[Estratos] ([IdEstrato], [NombreEstrato], [NivelEstrato], [ValorEstrato], [CargoFijo]) VALUES (1, N'Estrato 1', N'1', CAST(100.00 AS Decimal(18, 2)), CAST(20000.00 AS Decimal(18, 2)))
INSERT [dbo].[Estratos] ([IdEstrato], [NombreEstrato], [NivelEstrato], [ValorEstrato], [CargoFijo]) VALUES (2, N'Estrato 2', N'2', CAST(200.00 AS Decimal(18, 2)), CAST(20000.00 AS Decimal(18, 2)))
INSERT [dbo].[Estratos] ([IdEstrato], [NombreEstrato], [NivelEstrato], [ValorEstrato], [CargoFijo]) VALUES (3, N'Estrato 3', N'3', CAST(300.00 AS Decimal(18, 2)), CAST(20000.00 AS Decimal(18, 2)))
INSERT [dbo].[Estratos] ([IdEstrato], [NombreEstrato], [NivelEstrato], [ValorEstrato], [CargoFijo]) VALUES (4, N'Estrato 4', N'4', CAST(450.00 AS Decimal(18, 2)), CAST(20000.00 AS Decimal(18, 2)))
INSERT [dbo].[Estratos] ([IdEstrato], [NombreEstrato], [NivelEstrato], [ValorEstrato], [CargoFijo]) VALUES (5, N'Estrato 5', N'5', CAST(600.00 AS Decimal(18, 2)), CAST(20000.00 AS Decimal(18, 2)))
INSERT [dbo].[Estratos] ([IdEstrato], [NombreEstrato], [NivelEstrato], [ValorEstrato], [CargoFijo]) VALUES (6, N'Estrato 6', N'6', CAST(1000.00 AS Decimal(18, 2)), CAST(20000.00 AS Decimal(18, 2)))
INSERT [dbo].[Estratos] ([IdEstrato], [NombreEstrato], [NivelEstrato], [ValorEstrato], [CargoFijo]) VALUES (11, N'Estrato 7', N'7', CAST(1500.00 AS Decimal(18, 2)), CAST(20000.00 AS Decimal(18, 2)))
INSERT [dbo].[Estratos] ([IdEstrato], [NombreEstrato], [NivelEstrato], [ValorEstrato], [CargoFijo]) VALUES (12, N'Estrato 8', N'8', CAST(223847.00 AS Decimal(18, 2)), CAST(984375983.00 AS Decimal(18, 2)))
INSERT [dbo].[Estratos] ([IdEstrato], [NombreEstrato], [NivelEstrato], [ValorEstrato], [CargoFijo]) VALUES (13, N'Estrato 9', N'9', CAST(100.00 AS Decimal(18, 2)), CAST(4000.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[Estratos] OFF
SET IDENTITY_INSERT [dbo].[Facturas] ON 

INSERT [dbo].[Facturas] ([IdFactura], [Consecutivo], [IdCliente], [Fecha]) VALUES (1015, N'0000000001', 2062, CAST(N'2016-06-10T20:09:32.523' AS DateTime))
INSERT [dbo].[Facturas] ([IdFactura], [Consecutivo], [IdCliente], [Fecha]) VALUES (1016, N'0000000002', 2068, CAST(N'2016-06-10T20:38:32.290' AS DateTime))
INSERT [dbo].[Facturas] ([IdFactura], [Consecutivo], [IdCliente], [Fecha]) VALUES (1017, N'0000000003', 2071, CAST(N'2016-06-10T20:56:17.513' AS DateTime))
INSERT [dbo].[Facturas] ([IdFactura], [Consecutivo], [IdCliente], [Fecha]) VALUES (1018, N'0000000004', 2072, CAST(N'2016-06-10T20:59:40.813' AS DateTime))
SET IDENTITY_INSERT [dbo].[Facturas] OFF
SET IDENTITY_INSERT [dbo].[Servicios] ON 

INSERT [dbo].[Servicios] ([IdServicio], [NombreServicio], [Descripcion]) VALUES (1, N'Television', N'Servicio de televisión')
INSERT [dbo].[Servicios] ([IdServicio], [NombreServicio], [Descripcion]) VALUES (2, N'Telefonía', N'Servicio de Telefonía')
INSERT [dbo].[Servicios] ([IdServicio], [NombreServicio], [Descripcion]) VALUES (3, N'Internet', N'Servicio de Internet')
SET IDENTITY_INSERT [dbo].[Servicios] OFF
SET IDENTITY_INSERT [dbo].[TarifasServicios] ON 

INSERT [dbo].[TarifasServicios] ([IdTarifaServicio], [IdServicio], [IdEstrato], [IdUnidad], [ValorServicio]) VALUES (1, 1, 1, 1, CAST(200.00 AS Decimal(18, 2)))
INSERT [dbo].[TarifasServicios] ([IdTarifaServicio], [IdServicio], [IdEstrato], [IdUnidad], [ValorServicio]) VALUES (2, 1, 2, 1, CAST(1000.00 AS Decimal(18, 2)))
INSERT [dbo].[TarifasServicios] ([IdTarifaServicio], [IdServicio], [IdEstrato], [IdUnidad], [ValorServicio]) VALUES (3, 1, 3, 1, CAST(4000.00 AS Decimal(18, 2)))
INSERT [dbo].[TarifasServicios] ([IdTarifaServicio], [IdServicio], [IdEstrato], [IdUnidad], [ValorServicio]) VALUES (4, 1, 4, 1, CAST(8000.00 AS Decimal(18, 2)))
INSERT [dbo].[TarifasServicios] ([IdTarifaServicio], [IdServicio], [IdEstrato], [IdUnidad], [ValorServicio]) VALUES (5, 1, 5, 1, CAST(12000.00 AS Decimal(18, 2)))
INSERT [dbo].[TarifasServicios] ([IdTarifaServicio], [IdServicio], [IdEstrato], [IdUnidad], [ValorServicio]) VALUES (6, 1, 6, 1, CAST(15000.00 AS Decimal(18, 2)))
INSERT [dbo].[TarifasServicios] ([IdTarifaServicio], [IdServicio], [IdEstrato], [IdUnidad], [ValorServicio]) VALUES (7, 2, 1, 2, CAST(5.00 AS Decimal(18, 2)))
INSERT [dbo].[TarifasServicios] ([IdTarifaServicio], [IdServicio], [IdEstrato], [IdUnidad], [ValorServicio]) VALUES (8, 2, 2, 2, CAST(20.00 AS Decimal(18, 2)))
INSERT [dbo].[TarifasServicios] ([IdTarifaServicio], [IdServicio], [IdEstrato], [IdUnidad], [ValorServicio]) VALUES (9, 2, 3, 2, CAST(100.00 AS Decimal(18, 2)))
INSERT [dbo].[TarifasServicios] ([IdTarifaServicio], [IdServicio], [IdEstrato], [IdUnidad], [ValorServicio]) VALUES (10, 2, 4, 2, CAST(400.00 AS Decimal(18, 2)))
INSERT [dbo].[TarifasServicios] ([IdTarifaServicio], [IdServicio], [IdEstrato], [IdUnidad], [ValorServicio]) VALUES (11, 2, 5, 2, CAST(1000.00 AS Decimal(18, 2)))
INSERT [dbo].[TarifasServicios] ([IdTarifaServicio], [IdServicio], [IdEstrato], [IdUnidad], [ValorServicio]) VALUES (12, 2, 6, 2, CAST(2000.00 AS Decimal(18, 2)))
INSERT [dbo].[TarifasServicios] ([IdTarifaServicio], [IdServicio], [IdEstrato], [IdUnidad], [ValorServicio]) VALUES (13, 3, 1, 3, CAST(20.00 AS Decimal(18, 2)))
INSERT [dbo].[TarifasServicios] ([IdTarifaServicio], [IdServicio], [IdEstrato], [IdUnidad], [ValorServicio]) VALUES (14, 3, 2, 3, CAST(80.00 AS Decimal(18, 2)))
INSERT [dbo].[TarifasServicios] ([IdTarifaServicio], [IdServicio], [IdEstrato], [IdUnidad], [ValorServicio]) VALUES (15, 3, 3, 3, CAST(150.00 AS Decimal(18, 2)))
INSERT [dbo].[TarifasServicios] ([IdTarifaServicio], [IdServicio], [IdEstrato], [IdUnidad], [ValorServicio]) VALUES (16, 3, 4, 3, CAST(220.00 AS Decimal(18, 2)))
INSERT [dbo].[TarifasServicios] ([IdTarifaServicio], [IdServicio], [IdEstrato], [IdUnidad], [ValorServicio]) VALUES (17, 3, 5, 3, CAST(350.00 AS Decimal(18, 2)))
INSERT [dbo].[TarifasServicios] ([IdTarifaServicio], [IdServicio], [IdEstrato], [IdUnidad], [ValorServicio]) VALUES (18, 3, 6, 3, CAST(480.00 AS Decimal(18, 2)))
INSERT [dbo].[TarifasServicios] ([IdTarifaServicio], [IdServicio], [IdEstrato], [IdUnidad], [ValorServicio]) VALUES (22, 1, 12, 1, CAST(9827897.00 AS Decimal(18, 2)))
INSERT [dbo].[TarifasServicios] ([IdTarifaServicio], [IdServicio], [IdEstrato], [IdUnidad], [ValorServicio]) VALUES (23, 2, 12, 2, CAST(934234.00 AS Decimal(18, 2)))
INSERT [dbo].[TarifasServicios] ([IdTarifaServicio], [IdServicio], [IdEstrato], [IdUnidad], [ValorServicio]) VALUES (24, 3, 12, 3, CAST(79234234.00 AS Decimal(18, 2)))
INSERT [dbo].[TarifasServicios] ([IdTarifaServicio], [IdServicio], [IdEstrato], [IdUnidad], [ValorServicio]) VALUES (25, 1, 13, 1, CAST(3000.00 AS Decimal(18, 2)))
INSERT [dbo].[TarifasServicios] ([IdTarifaServicio], [IdServicio], [IdEstrato], [IdUnidad], [ValorServicio]) VALUES (26, 2, 13, 2, CAST(2000.00 AS Decimal(18, 2)))
INSERT [dbo].[TarifasServicios] ([IdTarifaServicio], [IdServicio], [IdEstrato], [IdUnidad], [ValorServicio]) VALUES (27, 3, 13, 3, CAST(5000.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[TarifasServicios] OFF
SET IDENTITY_INSERT [dbo].[UnidadesTarifas] ON 

INSERT [dbo].[UnidadesTarifas] ([IdUnidad], [NombreUnidad]) VALUES (1, N'Hora')
INSERT [dbo].[UnidadesTarifas] ([IdUnidad], [NombreUnidad]) VALUES (2, N'Minuto')
INSERT [dbo].[UnidadesTarifas] ([IdUnidad], [NombreUnidad]) VALUES (3, N'Kilobyte')
SET IDENTITY_INSERT [dbo].[UnidadesTarifas] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Clientes]    Script Date: 13/06/2016 12:06:43 a. m. ******/
ALTER TABLE [dbo].[Clientes] ADD  CONSTRAINT [IX_Clientes] UNIQUE NONCLUSTERED 
(
	[TipoIdentificacion] ASC,
	[NumeroIdentificacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Estratos]    Script Date: 13/06/2016 12:06:43 a. m. ******/
ALTER TABLE [dbo].[Estratos] ADD  CONSTRAINT [IX_Estratos] UNIQUE NONCLUSTERED 
(
	[NivelEstrato] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Facturas]    Script Date: 13/06/2016 12:06:43 a. m. ******/
ALTER TABLE [dbo].[Facturas] ADD  CONSTRAINT [IX_Facturas] UNIQUE NONCLUSTERED 
(
	[Consecutivo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[DetalleFactura]  WITH CHECK ADD  CONSTRAINT [FK_DetalleFactura_Facturas] FOREIGN KEY([IdFactura])
REFERENCES [dbo].[Facturas] ([IdFactura])
GO
ALTER TABLE [dbo].[DetalleFactura] CHECK CONSTRAINT [FK_DetalleFactura_Facturas]
GO
ALTER TABLE [dbo].[DetalleFactura]  WITH CHECK ADD  CONSTRAINT [FK_DetalleFactura_Servicios] FOREIGN KEY([IdServicio])
REFERENCES [dbo].[Servicios] ([IdServicio])
GO
ALTER TABLE [dbo].[DetalleFactura] CHECK CONSTRAINT [FK_DetalleFactura_Servicios]
GO
ALTER TABLE [dbo].[Facturas]  WITH CHECK ADD  CONSTRAINT [FK_Facturas_Clientes] FOREIGN KEY([IdCliente])
REFERENCES [dbo].[Clientes] ([IdCliente])
GO
ALTER TABLE [dbo].[Facturas] CHECK CONSTRAINT [FK_Facturas_Clientes]
GO
ALTER TABLE [dbo].[TarifasServicios]  WITH CHECK ADD  CONSTRAINT [FK_TarifasServicios_Estratos] FOREIGN KEY([IdEstrato])
REFERENCES [dbo].[Estratos] ([IdEstrato])
GO
ALTER TABLE [dbo].[TarifasServicios] CHECK CONSTRAINT [FK_TarifasServicios_Estratos]
GO
ALTER TABLE [dbo].[TarifasServicios]  WITH CHECK ADD  CONSTRAINT [FK_TarifasServicios_Servicios] FOREIGN KEY([IdServicio])
REFERENCES [dbo].[Servicios] ([IdServicio])
GO
ALTER TABLE [dbo].[TarifasServicios] CHECK CONSTRAINT [FK_TarifasServicios_Servicios]
GO
ALTER TABLE [dbo].[TarifasServicios]  WITH CHECK ADD  CONSTRAINT [FK_TarifasServicios_UnidadesTarifas] FOREIGN KEY([IdUnidad])
REFERENCES [dbo].[UnidadesTarifas] ([IdUnidad])
GO
ALTER TABLE [dbo].[TarifasServicios] CHECK CONSTRAINT [FK_TarifasServicios_UnidadesTarifas]
GO
/****** Object:  StoredProcedure [dbo].[proClientesInsertar]    Script Date: 13/06/2016 12:06:43 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[proClientesInsertar]	
	-- Add the parameters for the stored procedure here
	 @IdCliente int out
	,@TipoIdentificacion varchar(5)
	,@NumeroIdentificacion varchar(22)
	,@PrimerNombre varchar(100)
	,@SegundoNombre varchar(100)
	,@PrimerApellido varchar(100)
	,@SegundoApellido varchar(100)
	,@RazonSocial varchar(400)
	,@IdEstrato tinyint
	
AS
BEGIN


INSERT INTO [dbo].[Clientes]
           ([TipoIdentificacion]
           ,[NumeroIdentificacion]
           ,[PrimerNombre]
           ,[SegundoNombre]
           ,[PrimerApellido]
           ,[SegundoApellido]
           ,[RazonSocial]
           ,[IdEstrato])
     VALUES
           (@TipoIdentificacion
           ,@NumeroIdentificacion
           ,@PrimerNombre
           ,@SegundoNombre
           ,@PrimerApellido
           ,@SegundoApellido
           ,@RazonSocial
           ,@IdEstrato)

set @IdCliente = @@IDENTITY


END


GO
/****** Object:  StoredProcedure [dbo].[proClientesSeleccionarId]    Script Date: 13/06/2016 12:06:43 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[proClientesSeleccionarId]	
	@IdCliente INT
AS
BEGIN

SELECT [IdCliente]
      ,[TipoIdentificacion]
      ,[NumeroIdentificacion]
      ,[PrimerNombre]
      ,[SegundoNombre]
      ,[PrimerApellido]
      ,[SegundoApellido]
      ,[RazonSocial]
      ,[IdEstrato]
  FROM [dbo].[Clientes]
  WHERE IdCliente = @IdCliente

END


GO
/****** Object:  StoredProcedure [dbo].[proClientesSeleccionarTodos]    Script Date: 13/06/2016 12:06:43 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[proClientesSeleccionarTodos]	
	
AS
BEGIN

SELECT [IdCliente]
      ,[TipoIdentificacion]
      ,[NumeroIdentificacion]
      ,[PrimerNombre]
      ,[SegundoNombre]
      ,[PrimerApellido]
      ,[SegundoApellido]
      ,[RazonSocial]
      ,[IdEstrato]
  FROM [dbo].[Clientes]
  ORDER BY PrimerNombre

END


GO
/****** Object:  StoredProcedure [dbo].[proDetalleFacturaInsertar]    Script Date: 13/06/2016 12:06:43 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[proDetalleFacturaInsertar]	

	@IdDetalleFactura  int out,
	@IdFactura		  int,
	@IdServicio		  smallint,
	@CantidadConsumo	  int,
	@ValorConsumo	  decimal
	
AS
BEGIN

	INSERT INTO [dbo].[DetalleFactura]
           ([IdFactura]
           ,[IdServicio]
           ,[CantidadConsumo]
           ,[ValorConsumo])
     VALUES
           (@IdFactura, @IdServicio, @CantidadConsumo, @ValorConsumo)

SET @IdDetalleFactura = @@IDENTITY
END






GO
/****** Object:  StoredProcedure [dbo].[proDetalleFacturasSeleccionarId]    Script Date: 13/06/2016 12:06:43 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[proDetalleFacturasSeleccionarId]	
	@IdFactura int
AS
BEGIN

SELECT [IdDetalleFactura]
      ,F.[IdFactura]
      ,S.[IdServicio]
      ,[CantidadConsumo]
      ,[ValorConsumo]
	  ,S.Descripcion
	  ,S.NombreServicio
	  --,S.ValorBase
	  ,IdTarifaServicio
      ,IdUnidad
	  ,TS.ValorServicio AS Tarifa
  FROM [dbo].[DetalleFactura] DF
  INNER JOIN Servicios S ON S.IdServicio = DF.IdServicio
   INNER JOIN Facturas F ON F.IdFactura = DF.IdFactura
  INNER JOIN Clientes C ON C.IdCliente = F.IdCliente
  INNER JOIN TarifasServicios TS ON TS.IdServicio = S.IdServicio AND TS.IdEstrato = C.IdEstrato
 WHERE	F.IdFactura = @IdFactura

END


GO
/****** Object:  StoredProcedure [dbo].[proEstratosInsertar]    Script Date: 13/06/2016 12:06:43 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[proEstratosInsertar]	
	-- Add the parameters for the stored procedure here
	@IdEstrato tinyint OUT,
	@NombreEstrato varchar(50),
	@NivelEstrato char(1),
	@ValorEstrato decimal(18,2),
	@CargoFijo decimal(18,2)

	
AS
BEGIN



INSERT INTO [dbo].[Estratos]
           ([NombreEstrato]
           ,[NivelEstrato]
		   ,[ValorEstrato]
		   ,[CargoFijo])
     VALUES
           (@NombreEstrato,@NivelEstrato,@ValorEstrato,@CargoFijo)

set @IdEstrato = @@IDENTITY


END


GO
/****** Object:  StoredProcedure [dbo].[proEstratosSeleccionarId]    Script Date: 13/06/2016 12:06:43 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[proEstratosSeleccionarId]	
	@IdEstrato tinyint 
AS
BEGIN

SELECT [IdEstrato]
      ,[NombreEstrato]
      ,[NivelEstrato]
	  ,[ValorEstrato]
	  ,[CargoFijo]
 FROM [dbo].[Estratos]
 WHERE IdEstrato = @IdEstrato

END


GO
/****** Object:  StoredProcedure [dbo].[proEstratosSeleccionarTodos]    Script Date: 13/06/2016 12:06:43 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[proEstratosSeleccionarTodos]	
	
AS
BEGIN

SELECT [IdEstrato]
      ,[NombreEstrato]
      ,[NivelEstrato]
	  ,[ValorEstrato]
	  ,[CargoFijo]
 FROM [dbo].[Estratos]


END


GO
/****** Object:  StoredProcedure [dbo].[proFacturasInsertar]    Script Date: 13/06/2016 12:06:43 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[proFacturasInsertar]	
	@IdFactura int out,	
	@IdCliente int,
	@Fecha datetime	
AS
BEGIN

declare @consecutivo_actual int =0, @Consecutivo varchar(10)


select top 1 @consecutivo_actual = convert(int, Consecutivo) from Facturas
order by IdFactura desc 

set @Consecutivo = right('000000000' + cast(isnull(@consecutivo_actual+1,0) as varchar(10)), 10)


INSERT INTO [dbo].[Facturas]
           ([Consecutivo]
           ,[IdCliente]
           ,[Fecha])
     VALUES
           (@Consecutivo, @IdCliente, @Fecha)

set @IdFactura = @@IDENTITY


END


GO
/****** Object:  StoredProcedure [dbo].[proFacturasSeleccionarId]    Script Date: 13/06/2016 12:06:43 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[proFacturasSeleccionarId]	
	@IdFactura int
AS
BEGIN


SELECT [IdFactura]
      ,[Consecutivo]
      ,[IdCliente]
      ,[Fecha]
  FROM [dbo].[Facturas]
  WHERE	IdFactura = @IdFactura

END


GO
/****** Object:  StoredProcedure [dbo].[proFacturasSeleccionarTodos]    Script Date: 13/06/2016 12:06:43 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[proFacturasSeleccionarTodos]	

AS
BEGIN


SELECT [IdFactura]
      ,[Consecutivo]
      ,[IdCliente]
      ,[Fecha]
  FROM [dbo].[Facturas]
  order by [IdFactura] desc
END


GO
/****** Object:  StoredProcedure [dbo].[proFacturassSeleccionarPorMes]    Script Date: 13/06/2016 12:06:43 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[proFacturassSeleccionarPorMes]	
	@MES INT
AS
BEGIN

DECLARE @ANIO VARCHAR(4)  

SELECT @ANIO = YEAR(GETDATE())

SELECT [IdFactura]
      ,[Consecutivo]
      ,[IdCliente]
      ,[Fecha]
  FROM [dbo].[Facturas] 
  WHERE MONTH(Fecha) = @MES AND YEAR(Fecha) =@ANIO
  ORDER BY IdFactura


END


GO
/****** Object:  StoredProcedure [dbo].[proTarifasConsultar]    Script Date: 13/06/2016 12:06:43 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[proTarifasConsultar]
	@IdServicio smallint,
	@IdEstrato tinyint
AS
BEGIN


SELECT 
	IdTarifaServicio
	,IdServicio
	,S.IdEstrato
	,u.IdUnidad
	,ValorServicio 
	,u.NombreUnidad
	
FROM TarifasServicios s 
INNER JOIN UnidadesTarifas U ON U.IdUnidad = S.IdUnidad	
WHERE IdServicio =@IdServicio AND IdEstrato = @IdEstrato

END


GO
/****** Object:  StoredProcedure [dbo].[proTarifaServicioInsertar]    Script Date: 13/06/2016 12:06:43 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[proTarifaServicioInsertar]	

 @IdTarifaServicio	int out
,@IdServicio	smallint
,@IdEstrato	tinyint
,@IdUnidad	tinyint
,@ValorServicio	decimal
	
AS
BEGIN

INSERT INTO [dbo].[TarifasServicios]
           ([IdServicio]
           ,[IdEstrato]
           ,[IdUnidad]
           ,[ValorServicio])
     VALUES
           (@IdServicio
           ,@IdEstrato
           ,@IdUnidad
           ,@ValorServicio)


SET @IdTarifaServicio = @@IDENTITY


END






GO
USE [master]
GO
ALTER DATABASE [Factureando] SET  READ_WRITE 
GO

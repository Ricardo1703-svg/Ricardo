USE [master]
GO
/****** Object:  Database [TiendaRicardo]    Script Date: 01/10/2023 05:04:42 ******/
CREATE DATABASE [TiendaRicardo]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TiendaRicardo', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.RMC\MSSQL\DATA\TiendaRicardo.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TiendaRicardo_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.RMC\MSSQL\DATA\TiendaRicardo_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [TiendaRicardo] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TiendaRicardo].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TiendaRicardo] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TiendaRicardo] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TiendaRicardo] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TiendaRicardo] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TiendaRicardo] SET ARITHABORT OFF 
GO
ALTER DATABASE [TiendaRicardo] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [TiendaRicardo] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TiendaRicardo] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TiendaRicardo] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TiendaRicardo] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TiendaRicardo] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TiendaRicardo] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TiendaRicardo] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TiendaRicardo] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TiendaRicardo] SET  ENABLE_BROKER 
GO
ALTER DATABASE [TiendaRicardo] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TiendaRicardo] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TiendaRicardo] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TiendaRicardo] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TiendaRicardo] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TiendaRicardo] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TiendaRicardo] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TiendaRicardo] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [TiendaRicardo] SET  MULTI_USER 
GO
ALTER DATABASE [TiendaRicardo] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TiendaRicardo] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TiendaRicardo] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TiendaRicardo] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TiendaRicardo] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [TiendaRicardo] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [TiendaRicardo] SET QUERY_STORE = OFF
GO
USE [TiendaRicardo]
GO
/****** Object:  Table [dbo].[clientes]    Script Date: 01/10/2023 05:04:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[clientes](
	[id_cliente] [int] IDENTITY(1,1) NOT NULL,
	[nombre_cliente] [varchar](50) NOT NULL,
	[correo_electronico] [varchar](50) NOT NULL,
	[telefono] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_cliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[detalle_pedido]    Script Date: 01/10/2023 05:04:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[detalle_pedido](
	[id_detalle] [int] IDENTITY(1,1) NOT NULL,
	[id_pedido] [int] NOT NULL,
	[id_producto] [int] NOT NULL,
	[cantidad] [int] NOT NULL,
	[precio_unitario] [decimal](10, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_detalle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[empleados]    Script Date: 01/10/2023 05:04:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[empleados](
	[id_empleado] [int] IDENTITY(1,1) NOT NULL,
	[nombre_empleado] [varchar](50) NOT NULL,
	[apellido_empleado] [varchar](50) NOT NULL,
	[fecha_nacimiento] [date] NOT NULL,
	[fecha_contratacion] [date] NOT NULL,
	[salario] [decimal](10, 2) NOT NULL,
	[departamento] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_empleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pedidos]    Script Date: 01/10/2023 05:04:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pedidos](
	[id_pedido] [int] IDENTITY(1,1) NOT NULL,
	[id_cliente] [int] NOT NULL,
	[fecha_pedido] [date] NOT NULL,
	[total] [decimal](10, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_pedido] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[productos]    Script Date: 01/10/2023 05:04:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[productos](
	[id_producto] [int] IDENTITY(1,1) NOT NULL,
	[nombre_producto] [varchar](50) NOT NULL,
	[precio_producto] [decimal](10, 2) NOT NULL,
	[stock] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_producto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[detalle_pedido]  WITH CHECK ADD FOREIGN KEY([id_pedido])
REFERENCES [dbo].[pedidos] ([id_pedido])
GO
ALTER TABLE [dbo].[detalle_pedido]  WITH CHECK ADD FOREIGN KEY([id_producto])
REFERENCES [dbo].[productos] ([id_producto])
GO
ALTER TABLE [dbo].[pedidos]  WITH CHECK ADD FOREIGN KEY([id_cliente])
REFERENCES [dbo].[clientes] ([id_cliente])
GO
USE [master]
GO
ALTER DATABASE [TiendaRicardo] SET  READ_WRITE 
GO

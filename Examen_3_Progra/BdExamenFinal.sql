USE [master]
GO
/****** Object:  Database [Vehiculos]    Script Date: 13/12/2022 21:11:50 ******/
CREATE DATABASE [Vehiculos]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Vehiculos', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Vehiculos.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Vehiculos_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Vehiculos_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Vehiculos] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Vehiculos].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Vehiculos] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Vehiculos] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Vehiculos] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Vehiculos] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Vehiculos] SET ARITHABORT OFF 
GO
ALTER DATABASE [Vehiculos] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Vehiculos] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Vehiculos] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Vehiculos] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Vehiculos] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Vehiculos] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Vehiculos] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Vehiculos] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Vehiculos] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Vehiculos] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Vehiculos] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Vehiculos] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Vehiculos] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Vehiculos] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Vehiculos] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Vehiculos] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Vehiculos] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Vehiculos] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Vehiculos] SET  MULTI_USER 
GO
ALTER DATABASE [Vehiculos] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Vehiculos] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Vehiculos] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Vehiculos] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Vehiculos] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Vehiculos] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Vehiculos] SET QUERY_STORE = OFF
GO
USE [Vehiculos]
GO
/****** Object:  Table [dbo].[TbPlaca]    Script Date: 13/12/2022 21:11:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TbPlaca](
	[IdPlaca] [int] IDENTITY(1,1) NOT NULL,
	[NumPlaca] [varchar](7) NULL,
	[IdUsuario] [int] NULL,
	[Monto] [money] NULL,
 CONSTRAINT [PK_TbPlaca] PRIMARY KEY CLUSTERED 
(
	[IdPlaca] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TbUsuarios]    Script Date: 13/12/2022 21:11:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TbUsuarios](
	[IdUsuario] [int] IDENTITY(1,1) NOT NULL,
	[Usuario] [nchar](10) NOT NULL,
	[Clave] [varchar](30) NULL,
	[Nombre] [varchar](50) NULL,
	[Apellido] [varchar](50) NULL,
 CONSTRAINT [PK_TbUsuarios] PRIMARY KEY CLUSTERED 
(
	[IdUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TbPlaca] ADD  CONSTRAINT [DF_TbPlaca_Monto]  DEFAULT ((0)) FOR [Monto]
GO
/****** Object:  StoredProcedure [dbo].[ActualizarPlaca]    Script Date: 13/12/2022 21:11:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ActualizarPlaca]
	@IdPlaca int,
	@NumPlaca varchar(6),
	@IdUsuario int,
	@Monto money

AS
BEGIN
	update TbPlaca set NumPlaca=@NumPlaca,IdUsuario=@IdUsuario,Monto=@Monto where IdPlaca=@IdPlaca
END
GO
/****** Object:  StoredProcedure [dbo].[ActualizarUsuario]    Script Date: 13/12/2022 21:11:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ActualizarUsuario] 
	@IdUsuario int,
	@Clave varchar(30),
	@Nombre varchar(50),
	@Apellido varchar(50)

AS
BEGIN
	update TbUsuarios set Clave=@Clave,Nombre=@Nombre,Apellido=@Apellido where IdUsuario=@IdUsuario
END
GO
/****** Object:  StoredProcedure [dbo].[AgregarPlaca]    Script Date: 13/12/2022 21:11:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[AgregarPlaca]

	@NumPlaca varchar(6),
	@IdUsuario int,
	@Monto money

AS
BEGIN
	insert into TbPlaca (NumPlaca,IdUsuario,Monto) values (@NumPlaca,@IdUsuario,@Monto)
END
GO
/****** Object:  StoredProcedure [dbo].[AgregarUsuario]    Script Date: 13/12/2022 21:11:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[AgregarUsuario] 
	@Usuario varchar(50),
	@Clave varchar(30),
	@Nombre varchar(50),
	@Apellido varchar(50)

AS
BEGIN
	insert into TbUsuarios(Usuario,Clave,Nombre,Apellido) values (@Usuario,@clave,@Nombre,@Apellido)
END
GO
/****** Object:  StoredProcedure [dbo].[BorrarPlaca]    Script Date: 13/12/2022 21:11:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[BorrarPlaca]
	@IdPlaca int

AS
BEGIN
	delete from TbPlaca where IdPlaca=@IdPlaca
END
GO
/****** Object:  StoredProcedure [dbo].[BorrarUsuario]    Script Date: 13/12/2022 21:11:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[BorrarUsuario] 
	@IdUsuario int

AS
BEGIN
	delete from TbUsuarios where IdUsuario=@IdUsuario
END
GO
/****** Object:  StoredProcedure [dbo].[BuscarPlaca]    Script Date: 13/12/2022 21:11:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [dbo].[BuscarPlaca]
@Placa varchar(6)

AS
BEGIN
	SELECT        dbo.TbUsuarios.Nombre, dbo.TbUsuarios.Apellido, dbo.TbPlaca.NumPlaca, dbo.TbPlaca.Monto, TbPlaca.Monto*0.13 as Iva, (Monto*0.13)+Monto as Total
FROM            dbo.TbPlaca INNER JOIN
                         dbo.TbUsuarios ON dbo.TbPlaca.IdUsuario = dbo.TbUsuarios.IdUsuario where TbPlaca.NumPlaca='kkk789'

END
GO
/****** Object:  StoredProcedure [dbo].[Login]    Script Date: 13/12/2022 21:11:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Login]

	@Usuario varchar(50),
	@Clave varchar(30)

AS
BEGIN
	select * from TbUsuarios where Usuario=@Usuario and Clave=@Clave
END
GO
/****** Object:  StoredProcedure [dbo].[SeleccionarPlacas]    Script Date: 13/12/2022 21:11:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SeleccionarPlacas]


AS
BEGIN
	SELECT        dbo.TbPlaca.IdPlaca, dbo.TbPlaca.NumPlaca, dbo.TbPlaca.Monto, dbo.TbPlaca.IdUsuario, dbo.TbUsuarios.Nombre
FROM            dbo.TbPlaca INNER JOIN
                         dbo.TbUsuarios ON dbo.TbPlaca.IdUsuario = dbo.TbUsuarios.IdUsuario
END
GO
/****** Object:  StoredProcedure [dbo].[SeleccionarUsuarios]    Script Date: 13/12/2022 21:11:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SeleccionarUsuarios]


AS
BEGIN
	select * from TbUsuarios 
END
GO
USE [master]
GO
ALTER DATABASE [Vehiculos] SET  READ_WRITE 
GO

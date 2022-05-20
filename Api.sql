USE [Api]
GO
/****** Object:  Table [dbo].[Mascotas]    Script Date: 18/5/2022 16:10:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Mascotas](
	[IdMascotas] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[AnoNac] [int] NOT NULL,
	[Estado] [varchar](50) NOT NULL,
	[Raza] [varchar](50) NOT NULL,
	[Vacunas] [varchar](150) NOT NULL,
	[Castrado] [bit] NOT NULL,
	[Foto] [varchar](150) NOT NULL,
	[IdRefugios] [int] NOT NULL,
 CONSTRAINT [PK_Mascotas] PRIMARY KEY CLUSTERED 
(
	[IdMascotas] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Refugios]    Script Date: 18/5/2022 16:10:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Refugios](
	[IdRefugios] [int] IDENTITY(1,1) NOT NULL,
	[IdMascota] [int] NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Direccion] [varchar](70) NOT NULL,
	[Telefono] [int] NOT NULL,
	[Descripcion] [varchar](550) NOT NULL,
	[Foto] [varchar](150) NOT NULL,
	[Email] [varchar](350) NOT NULL,
	[IdUsuarios] [int] NOT NULL,
 CONSTRAINT [PK_Refugios] PRIMARY KEY CLUSTERED 
(
	[IdRefugios] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoUsuario]    Script Date: 18/5/2022 16:10:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoUsuario](
	[IdTipoUsuario] [int] IDENTITY(1,1) NOT NULL,
	[TipoRefugio] [bit] NOT NULL,
	[TipoUsuario] [bit] NOT NULL,
 CONSTRAINT [PK_TipoUsuario] PRIMARY KEY CLUSTERED 
(
	[IdTipoUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 18/5/2022 16:10:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[IdUsuario] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Apellido] [varchar](150) NOT NULL,
	[Foto] [varchar](450) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[Password] [varchar](550) NOT NULL,
	[IdMascota] [int] NOT NULL,
	[IdTipoUsuario] [int] NOT NULL,
 CONSTRAINT [PK_Usuarios] PRIMARY KEY CLUSTERED 
(
	[IdUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[TipoUsuario] ON 

INSERT [dbo].[TipoUsuario] ([IdTipoUsuario], [TipoRefugio], [TipoUsuario]) VALUES (1, 1, 0)
SET IDENTITY_INSERT [dbo].[TipoUsuario] OFF
GO
ALTER TABLE [dbo].[Mascotas]  WITH CHECK ADD  CONSTRAINT [FK_Mascotas_Refugios] FOREIGN KEY([IdRefugios])
REFERENCES [dbo].[Refugios] ([IdRefugios])
GO
ALTER TABLE [dbo].[Mascotas] CHECK CONSTRAINT [FK_Mascotas_Refugios]
GO
ALTER TABLE [dbo].[Refugios]  WITH CHECK ADD  CONSTRAINT [FK_Refugios_Usuarios] FOREIGN KEY([IdUsuarios])
REFERENCES [dbo].[Usuarios] ([IdUsuario])
GO
ALTER TABLE [dbo].[Refugios] CHECK CONSTRAINT [FK_Refugios_Usuarios]
GO
ALTER TABLE [dbo].[Usuarios]  WITH CHECK ADD  CONSTRAINT [FK_Usuarios_Mascotas] FOREIGN KEY([IdMascota])
REFERENCES [dbo].[Mascotas] ([IdMascotas])
GO
ALTER TABLE [dbo].[Usuarios] CHECK CONSTRAINT [FK_Usuarios_Mascotas]
GO
ALTER TABLE [dbo].[Usuarios]  WITH CHECK ADD  CONSTRAINT [FK_Usuarios_TipoUsuario] FOREIGN KEY([IdTipoUsuario])
REFERENCES [dbo].[TipoUsuario] ([IdTipoUsuario])
GO
ALTER TABLE [dbo].[Usuarios] CHECK CONSTRAINT [FK_Usuarios_TipoUsuario]
GO

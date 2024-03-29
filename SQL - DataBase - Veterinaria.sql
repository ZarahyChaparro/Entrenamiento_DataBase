USE [Veterinaria]
GO
/****** Object:  Table [dbo].[Animal]    Script Date: 5/01/2024 3:57:54 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Animal](
	[id] [int] NOT NULL,
	[Nombre] [varchar](50) NULL,
	[Especie] [varchar](50) NULL,
	[Raza] [varchar](50) NULL,
	[Edad] [int] NULL,
	[Sexo] [varchar](15) NULL,
	[HistorialMedico] [varchar](50) NULL,
	[idPropietario] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cita]    Script Date: 5/01/2024 3:57:54 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cita](
	[id] [int] NOT NULL,
	[FechaCita] [datetime] NULL,
	[DetallesCita] [varchar](50) NULL,
	[idAnimal] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HistorialMedico]    Script Date: 5/01/2024 3:57:54 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HistorialMedico](
	[id] [int] NOT NULL,
	[Enfermedades] [varchar](50) NULL,
	[UltimosTratamientos] [varchar](50) NULL,
	[Cirugias] [varchar](50) NULL,
	[ExamenesLaboratorio] [varchar](50) NULL,
	[DiagnosticoPorImagen] [varchar](50) NULL,
	[idAnimal] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pago]    Script Date: 5/01/2024 3:57:54 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pago](
	[id] [int] NOT NULL,
	[Servicio] [varchar](50) NULL,
	[Costo] [varchar](50) NULL,
	[FacturaFecha] [date] NULL,
	[idAnimal] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProgramaVacunacion]    Script Date: 5/01/2024 3:57:54 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProgramaVacunacion](
	[id] [int] NOT NULL,
	[Fecha] [date] NULL,
	[Tipo] [varchar](50) NULL,
	[Dosis] [varchar](50) NULL,
	[idAnimal] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Propietario]    Script Date: 5/01/2024 3:57:54 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Propietario](
	[idPropietario] [int] NOT NULL,
	[Nombre] [varchar](50) NULL,
	[Direccion] [varchar](100) NULL,
	[Telefono] [varchar](20) NULL,
	[CorreoElectronico] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[idPropietario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Recomendacion]    Script Date: 5/01/2024 3:57:54 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Recomendacion](
	[id] [int] NOT NULL,
	[Recomendacion] [varchar](50) NULL,
	[TratamientoRecomendado] [varchar](50) NULL,
	[idAnimal] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Animal]  WITH CHECK ADD FOREIGN KEY([idPropietario])
REFERENCES [dbo].[Propietario] ([idPropietario])
GO
ALTER TABLE [dbo].[Cita]  WITH CHECK ADD FOREIGN KEY([idAnimal])
REFERENCES [dbo].[Animal] ([id])
GO
ALTER TABLE [dbo].[HistorialMedico]  WITH CHECK ADD FOREIGN KEY([idAnimal])
REFERENCES [dbo].[Animal] ([id])
GO
ALTER TABLE [dbo].[Pago]  WITH CHECK ADD FOREIGN KEY([idAnimal])
REFERENCES [dbo].[Animal] ([id])
GO
ALTER TABLE [dbo].[ProgramaVacunacion]  WITH CHECK ADD  CONSTRAINT [FK_ProgramaVacunacion_Animal] FOREIGN KEY([idAnimal])
REFERENCES [dbo].[Animal] ([id])
GO
ALTER TABLE [dbo].[ProgramaVacunacion] CHECK CONSTRAINT [FK_ProgramaVacunacion_Animal]
GO
ALTER TABLE [dbo].[Recomendacion]  WITH CHECK ADD FOREIGN KEY([idAnimal])
REFERENCES [dbo].[Animal] ([id])
GO

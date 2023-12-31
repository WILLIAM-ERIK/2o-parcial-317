USE [master]
GO
/****** Object:  Database [academico]    Script Date: 11/6/2023 22:56:51 ******/
CREATE DATABASE [academico]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'academico', FILENAME = N'D:\sql server\MSSQL15.MSSQLSERVER\MSSQL\DATA\academico.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'academico_log', FILENAME = N'D:\sql server\MSSQL15.MSSQLSERVER\MSSQL\DATA\academico_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [academico] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [academico].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [academico] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [academico] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [academico] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [academico] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [academico] SET ARITHABORT OFF 
GO
ALTER DATABASE [academico] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [academico] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [academico] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [academico] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [academico] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [academico] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [academico] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [academico] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [academico] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [academico] SET  DISABLE_BROKER 
GO
ALTER DATABASE [academico] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [academico] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [academico] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [academico] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [academico] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [academico] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [academico] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [academico] SET RECOVERY FULL 
GO
ALTER DATABASE [academico] SET  MULTI_USER 
GO
ALTER DATABASE [academico] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [academico] SET DB_CHAINING OFF 
GO
ALTER DATABASE [academico] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [academico] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [academico] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [academico] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'academico', N'ON'
GO
ALTER DATABASE [academico] SET QUERY_STORE = OFF
GO
USE [academico]
GO
/****** Object:  Table [dbo].[Asignaciones]    Script Date: 11/6/2023 22:56:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Asignaciones](
	[ProfesorID] [int] NOT NULL,
	[CursoID] [int] NOT NULL,
	[DepartamentoID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ProfesorID] ASC,
	[CursoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Calificaciones]    Script Date: 11/6/2023 22:56:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Calificaciones](
	[EstudianteID] [int] NOT NULL,
	[CursoID] [int] NOT NULL,
	[Calificacion] [decimal](4, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[EstudianteID] ASC,
	[CursoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cursos]    Script Date: 11/6/2023 22:56:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cursos](
	[ID] [int] NOT NULL,
	[Nombre] [varchar](50) NULL,
	[Descripcion] [varchar](100) NULL,
	[Creditos] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Departamentos]    Script Date: 11/6/2023 22:56:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Departamentos](
	[ID] [int] NOT NULL,
	[Nombre] [varchar](50) NULL,
	[Ubicacion] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DIMprofesores]    Script Date: 11/6/2023 22:56:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DIMprofesores](
	[ID] [int] NULL,
	[Nombre] [varchar](50) NULL,
	[Apellido] [varchar](50) NULL,
	[Edad] [int] NULL,
	[Genero] [varchar](20) NULL,
	[Direccion] [varchar](100) NULL,
	[Telefono] [varchar](20) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Estudiantes]    Script Date: 11/6/2023 22:56:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Estudiantes](
	[ID] [int] NOT NULL,
	[Nombre] [varchar](50) NULL,
	[Apellido] [varchar](50) NULL,
	[Edad] [int] NULL,
	[Genero] [varchar](20) NULL,
	[Direccion] [varchar](100) NULL,
	[Telefono] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Inscripciones]    Script Date: 11/6/2023 22:56:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inscripciones](
	[EstudianteID] [int] NOT NULL,
	[CursoID] [int] NOT NULL,
	[FechaInscripcion] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[EstudianteID] ASC,
	[CursoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Profesores]    Script Date: 11/6/2023 22:56:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Profesores](
	[ID] [int] NOT NULL,
	[Nombre] [varchar](50) NULL,
	[Apellido] [varchar](50) NULL,
	[Edad] [int] NULL,
	[Genero] [varchar](20) NULL,
	[Direccion] [varchar](100) NULL,
	[Telefono] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Asignaciones] ([ProfesorID], [CursoID], [DepartamentoID]) VALUES (1, 1, 1)
INSERT [dbo].[Asignaciones] ([ProfesorID], [CursoID], [DepartamentoID]) VALUES (2, 2, 2)
INSERT [dbo].[Asignaciones] ([ProfesorID], [CursoID], [DepartamentoID]) VALUES (3, 3, 3)
INSERT [dbo].[Asignaciones] ([ProfesorID], [CursoID], [DepartamentoID]) VALUES (4, 4, 4)
INSERT [dbo].[Asignaciones] ([ProfesorID], [CursoID], [DepartamentoID]) VALUES (5, 5, 5)
INSERT [dbo].[Asignaciones] ([ProfesorID], [CursoID], [DepartamentoID]) VALUES (6, 6, 6)
INSERT [dbo].[Asignaciones] ([ProfesorID], [CursoID], [DepartamentoID]) VALUES (7, 7, 7)
INSERT [dbo].[Asignaciones] ([ProfesorID], [CursoID], [DepartamentoID]) VALUES (8, 8, 8)
INSERT [dbo].[Asignaciones] ([ProfesorID], [CursoID], [DepartamentoID]) VALUES (9, 9, 9)
INSERT [dbo].[Asignaciones] ([ProfesorID], [CursoID], [DepartamentoID]) VALUES (10, 10, 10)
GO
INSERT [dbo].[Calificaciones] ([EstudianteID], [CursoID], [Calificacion]) VALUES (1, 1, CAST(8.50 AS Decimal(4, 2)))
INSERT [dbo].[Calificaciones] ([EstudianteID], [CursoID], [Calificacion]) VALUES (1, 2, CAST(9.00 AS Decimal(4, 2)))
INSERT [dbo].[Calificaciones] ([EstudianteID], [CursoID], [Calificacion]) VALUES (2, 2, CAST(7.50 AS Decimal(4, 2)))
INSERT [dbo].[Calificaciones] ([EstudianteID], [CursoID], [Calificacion]) VALUES (3, 3, CAST(8.00 AS Decimal(4, 2)))
INSERT [dbo].[Calificaciones] ([EstudianteID], [CursoID], [Calificacion]) VALUES (4, 4, CAST(9.50 AS Decimal(4, 2)))
INSERT [dbo].[Calificaciones] ([EstudianteID], [CursoID], [Calificacion]) VALUES (5, 5, CAST(7.00 AS Decimal(4, 2)))
INSERT [dbo].[Calificaciones] ([EstudianteID], [CursoID], [Calificacion]) VALUES (6, 6, CAST(8.00 AS Decimal(4, 2)))
INSERT [dbo].[Calificaciones] ([EstudianteID], [CursoID], [Calificacion]) VALUES (7, 7, CAST(9.00 AS Decimal(4, 2)))
INSERT [dbo].[Calificaciones] ([EstudianteID], [CursoID], [Calificacion]) VALUES (8, 8, CAST(7.50 AS Decimal(4, 2)))
INSERT [dbo].[Calificaciones] ([EstudianteID], [CursoID], [Calificacion]) VALUES (9, 9, CAST(8.50 AS Decimal(4, 2)))
INSERT [dbo].[Calificaciones] ([EstudianteID], [CursoID], [Calificacion]) VALUES (10, 10, CAST(9.50 AS Decimal(4, 2)))
GO
INSERT [dbo].[Cursos] ([ID], [Nombre], [Descripcion], [Creditos]) VALUES (1, N'Matemáticas', N'Curso de matemáticas avanzadas', 5)
INSERT [dbo].[Cursos] ([ID], [Nombre], [Descripcion], [Creditos]) VALUES (2, N'Historia', N'Curso de historia mundial', 4)
INSERT [dbo].[Cursos] ([ID], [Nombre], [Descripcion], [Creditos]) VALUES (3, N'Programación', N'Curso de programación en C++', 6)
INSERT [dbo].[Cursos] ([ID], [Nombre], [Descripcion], [Creditos]) VALUES (4, N'Literatura', N'Curso de literatura latinoamericana', 3)
INSERT [dbo].[Cursos] ([ID], [Nombre], [Descripcion], [Creditos]) VALUES (5, N'Física', N'Curso de física moderna', 5)
INSERT [dbo].[Cursos] ([ID], [Nombre], [Descripcion], [Creditos]) VALUES (6, N'Inglés', N'Curso de inglés avanzado', 4)
INSERT [dbo].[Cursos] ([ID], [Nombre], [Descripcion], [Creditos]) VALUES (7, N'Economía', N'Curso de principios de economía', 4)
INSERT [dbo].[Cursos] ([ID], [Nombre], [Descripcion], [Creditos]) VALUES (8, N'Biología', N'Curso de biología celular', 5)
INSERT [dbo].[Cursos] ([ID], [Nombre], [Descripcion], [Creditos]) VALUES (9, N'Química', N'Curso de química orgánica', 4)
INSERT [dbo].[Cursos] ([ID], [Nombre], [Descripcion], [Creditos]) VALUES (10, N'Arte', N'Curso de historia del arte', 3)
GO
INSERT [dbo].[Departamentos] ([ID], [Nombre], [Ubicacion]) VALUES (1, N'Departamento de Matemáticas', N'Edificio A, Ciudad Universitaria')
INSERT [dbo].[Departamentos] ([ID], [Nombre], [Ubicacion]) VALUES (2, N'Departamento de Historia', N'Edificio B, Ciudad Universitaria')
INSERT [dbo].[Departamentos] ([ID], [Nombre], [Ubicacion]) VALUES (3, N'Departamento de Ciencias de la Computación', N'Edificio C, Ciudad Universitaria')
INSERT [dbo].[Departamentos] ([ID], [Nombre], [Ubicacion]) VALUES (4, N'Departamento de Biología', N'Edificio D, Ciudad Universitaria')
INSERT [dbo].[Departamentos] ([ID], [Nombre], [Ubicacion]) VALUES (5, N'Departamento de Física', N'Edificio E, Ciudad Universitaria')
INSERT [dbo].[Departamentos] ([ID], [Nombre], [Ubicacion]) VALUES (6, N'Departamento de Idiomas', N'Edificio F, Ciudad Universitaria')
INSERT [dbo].[Departamentos] ([ID], [Nombre], [Ubicacion]) VALUES (7, N'Departamento de Economía', N'Edificio G, Ciudad Universitaria')
INSERT [dbo].[Departamentos] ([ID], [Nombre], [Ubicacion]) VALUES (8, N'Departamento de Artes', N'Edificio H, Ciudad Universitaria')
INSERT [dbo].[Departamentos] ([ID], [Nombre], [Ubicacion]) VALUES (9, N'Departamento de Química', N'Edificio I, Ciudad Universitaria')
INSERT [dbo].[Departamentos] ([ID], [Nombre], [Ubicacion]) VALUES (10, N'Departamento de Educación Física', N'Edificio J, Ciudad Universitaria')
GO
INSERT [dbo].[DIMprofesores] ([ID], [Nombre], [Apellido], [Edad], [Genero], [Direccion], [Telefono]) VALUES (1, N'Luis', N'Martínez', 35, N'Masculino', N'Calle X, Ciudad A', N'555-5555')
INSERT [dbo].[DIMprofesores] ([ID], [Nombre], [Apellido], [Edad], [Genero], [Direccion], [Telefono]) VALUES (2, N'Ana', N'González', 40, N'Femenino', N'Avenida Y, Ciudad B', N'555-6666')
INSERT [dbo].[DIMprofesores] ([ID], [Nombre], [Apellido], [Edad], [Genero], [Direccion], [Telefono]) VALUES (3, N'Pedro', N'Hernández', 38, N'Masculino', N'Calle Z, Ciudad C', N'555-7777')
INSERT [dbo].[DIMprofesores] ([ID], [Nombre], [Apellido], [Edad], [Genero], [Direccion], [Telefono]) VALUES (4, N'María', N'López', 37, N'Femenino', N'Avenida X, Ciudad A', N'555-8888')
INSERT [dbo].[DIMprofesores] ([ID], [Nombre], [Apellido], [Edad], [Genero], [Direccion], [Telefono]) VALUES (5, N'Carlos', N'Gómez', 42, N'Masculino', N'Calle Y, Ciudad B', N'555-9999')
INSERT [dbo].[DIMprofesores] ([ID], [Nombre], [Apellido], [Edad], [Genero], [Direccion], [Telefono]) VALUES (6, N'Laura', N'Ramírez', 39, N'Femenino', N'Avenida Z, Ciudad C', N'555-0000')
INSERT [dbo].[DIMprofesores] ([ID], [Nombre], [Apellido], [Edad], [Genero], [Direccion], [Telefono]) VALUES (7, N'Gabriel', N'Sánchez', 36, N'Masculino', N'Calle 123, Ciudad A', N'555-1111')
INSERT [dbo].[DIMprofesores] ([ID], [Nombre], [Apellido], [Edad], [Genero], [Direccion], [Telefono]) VALUES (8, N'Valentina', N'Torres', 41, N'Femenino', N'Avenida 456, Ciudad B', N'555-2222')
INSERT [dbo].[DIMprofesores] ([ID], [Nombre], [Apellido], [Edad], [Genero], [Direccion], [Telefono]) VALUES (9, N'Diego', N'González', 38, N'Masculino', N'Calle 789, Ciudad C', N'555-3333')
INSERT [dbo].[DIMprofesores] ([ID], [Nombre], [Apellido], [Edad], [Genero], [Direccion], [Telefono]) VALUES (10, N'Sofía', N'Hernández', 37, N'Femenino', N'Avenida 123, Ciudad A', N'555-4444')
GO
INSERT [dbo].[Estudiantes] ([ID], [Nombre], [Apellido], [Edad], [Genero], [Direccion], [Telefono]) VALUES (1, N'Juan', N'Pérez', 20, N'Masculino', N'Calle 123, Ciudad A', N'555-1234')
INSERT [dbo].[Estudiantes] ([ID], [Nombre], [Apellido], [Edad], [Genero], [Direccion], [Telefono]) VALUES (2, N'María', N'López', 22, N'Femenino', N'Avenida 456, Ciudad B', N'555-5678')
INSERT [dbo].[Estudiantes] ([ID], [Nombre], [Apellido], [Edad], [Genero], [Direccion], [Telefono]) VALUES (3, N'Carlos', N'Rodríguez', 21, N'Masculino', N'Calle 789, Ciudad C', N'555-9012')
INSERT [dbo].[Estudiantes] ([ID], [Nombre], [Apellido], [Edad], [Genero], [Direccion], [Telefono]) VALUES (4, N'Ana', N'Gómez', 19, N'Femenino', N'Avenida X, Ciudad A', N'555-4321')
INSERT [dbo].[Estudiantes] ([ID], [Nombre], [Apellido], [Edad], [Genero], [Direccion], [Telefono]) VALUES (5, N'Pedro', N'Martínez', 23, N'Masculino', N'Calle Y, Ciudad B', N'555-8765')
INSERT [dbo].[Estudiantes] ([ID], [Nombre], [Apellido], [Edad], [Genero], [Direccion], [Telefono]) VALUES (6, N'Laura', N'Hernández', 20, N'Femenino', N'Avenida Z, Ciudad C', N'555-2109')
INSERT [dbo].[Estudiantes] ([ID], [Nombre], [Apellido], [Edad], [Genero], [Direccion], [Telefono]) VALUES (7, N'Sofía', N'Torres', 21, N'Femenino', N'Calle 789, Ciudad A', N'555-1111')
INSERT [dbo].[Estudiantes] ([ID], [Nombre], [Apellido], [Edad], [Genero], [Direccion], [Telefono]) VALUES (8, N'Gabriel', N'Ramírez', 22, N'Masculino', N'Avenida 123, Ciudad B', N'555-2222')
INSERT [dbo].[Estudiantes] ([ID], [Nombre], [Apellido], [Edad], [Genero], [Direccion], [Telefono]) VALUES (9, N'Valentina', N'Sánchez', 20, N'Femenino', N'Calle 456, Ciudad C', N'555-3333')
INSERT [dbo].[Estudiantes] ([ID], [Nombre], [Apellido], [Edad], [Genero], [Direccion], [Telefono]) VALUES (10, N'Diego', N'González', 21, N'Masculino', N'Avenida 789, Ciudad A', N'555-4444')
GO
INSERT [dbo].[Inscripciones] ([EstudianteID], [CursoID], [FechaInscripcion]) VALUES (1, 1, CAST(N'2023-01-01' AS Date))
INSERT [dbo].[Inscripciones] ([EstudianteID], [CursoID], [FechaInscripcion]) VALUES (1, 2, CAST(N'2023-01-01' AS Date))
INSERT [dbo].[Inscripciones] ([EstudianteID], [CursoID], [FechaInscripcion]) VALUES (2, 2, CAST(N'2023-01-02' AS Date))
INSERT [dbo].[Inscripciones] ([EstudianteID], [CursoID], [FechaInscripcion]) VALUES (3, 3, CAST(N'2023-01-03' AS Date))
INSERT [dbo].[Inscripciones] ([EstudianteID], [CursoID], [FechaInscripcion]) VALUES (4, 4, CAST(N'2023-01-04' AS Date))
INSERT [dbo].[Inscripciones] ([EstudianteID], [CursoID], [FechaInscripcion]) VALUES (5, 5, CAST(N'2023-01-05' AS Date))
INSERT [dbo].[Inscripciones] ([EstudianteID], [CursoID], [FechaInscripcion]) VALUES (6, 6, CAST(N'2023-01-06' AS Date))
INSERT [dbo].[Inscripciones] ([EstudianteID], [CursoID], [FechaInscripcion]) VALUES (7, 7, CAST(N'2023-01-07' AS Date))
INSERT [dbo].[Inscripciones] ([EstudianteID], [CursoID], [FechaInscripcion]) VALUES (8, 8, CAST(N'2023-01-08' AS Date))
INSERT [dbo].[Inscripciones] ([EstudianteID], [CursoID], [FechaInscripcion]) VALUES (9, 9, CAST(N'2023-01-09' AS Date))
INSERT [dbo].[Inscripciones] ([EstudianteID], [CursoID], [FechaInscripcion]) VALUES (10, 10, CAST(N'2023-01-10' AS Date))
GO
INSERT [dbo].[Profesores] ([ID], [Nombre], [Apellido], [Edad], [Genero], [Direccion], [Telefono]) VALUES (1, N'Luis', N'Martínez', 35, N'Masculino', N'Calle X, Ciudad A', N'555-5555')
INSERT [dbo].[Profesores] ([ID], [Nombre], [Apellido], [Edad], [Genero], [Direccion], [Telefono]) VALUES (2, N'Ana', N'González', 40, N'Femenino', N'Avenida Y, Ciudad B', N'555-6666')
INSERT [dbo].[Profesores] ([ID], [Nombre], [Apellido], [Edad], [Genero], [Direccion], [Telefono]) VALUES (3, N'Pedro', N'Hernández', 38, N'Masculino', N'Calle Z, Ciudad C', N'555-7777')
INSERT [dbo].[Profesores] ([ID], [Nombre], [Apellido], [Edad], [Genero], [Direccion], [Telefono]) VALUES (4, N'María', N'López', 37, N'Femenino', N'Avenida X, Ciudad A', N'555-8888')
INSERT [dbo].[Profesores] ([ID], [Nombre], [Apellido], [Edad], [Genero], [Direccion], [Telefono]) VALUES (5, N'Carlos', N'Gómez', 42, N'Masculino', N'Calle Y, Ciudad B', N'555-9999')
INSERT [dbo].[Profesores] ([ID], [Nombre], [Apellido], [Edad], [Genero], [Direccion], [Telefono]) VALUES (6, N'Laura', N'Ramírez', 39, N'Femenino', N'Avenida Z, Ciudad C', N'555-0000')
INSERT [dbo].[Profesores] ([ID], [Nombre], [Apellido], [Edad], [Genero], [Direccion], [Telefono]) VALUES (7, N'Gabriel', N'Sánchez', 36, N'Masculino', N'Calle 123, Ciudad A', N'555-1111')
INSERT [dbo].[Profesores] ([ID], [Nombre], [Apellido], [Edad], [Genero], [Direccion], [Telefono]) VALUES (8, N'Valentina', N'Torres', 41, N'Femenino', N'Avenida 456, Ciudad B', N'555-2222')
INSERT [dbo].[Profesores] ([ID], [Nombre], [Apellido], [Edad], [Genero], [Direccion], [Telefono]) VALUES (9, N'Diego', N'González', 38, N'Masculino', N'Calle 789, Ciudad C', N'555-3333')
INSERT [dbo].[Profesores] ([ID], [Nombre], [Apellido], [Edad], [Genero], [Direccion], [Telefono]) VALUES (10, N'Sofía', N'Hernández', 37, N'Femenino', N'Avenida 123, Ciudad A', N'555-4444')
GO
ALTER TABLE [dbo].[Asignaciones]  WITH CHECK ADD FOREIGN KEY([CursoID])
REFERENCES [dbo].[Cursos] ([ID])
GO
ALTER TABLE [dbo].[Asignaciones]  WITH CHECK ADD FOREIGN KEY([DepartamentoID])
REFERENCES [dbo].[Departamentos] ([ID])
GO
ALTER TABLE [dbo].[Asignaciones]  WITH CHECK ADD FOREIGN KEY([ProfesorID])
REFERENCES [dbo].[Profesores] ([ID])
GO
ALTER TABLE [dbo].[Calificaciones]  WITH CHECK ADD FOREIGN KEY([CursoID])
REFERENCES [dbo].[Cursos] ([ID])
GO
ALTER TABLE [dbo].[Calificaciones]  WITH CHECK ADD FOREIGN KEY([EstudianteID])
REFERENCES [dbo].[Estudiantes] ([ID])
GO
ALTER TABLE [dbo].[Inscripciones]  WITH CHECK ADD FOREIGN KEY([CursoID])
REFERENCES [dbo].[Cursos] ([ID])
GO
ALTER TABLE [dbo].[Inscripciones]  WITH CHECK ADD FOREIGN KEY([EstudianteID])
REFERENCES [dbo].[Estudiantes] ([ID])
GO
USE [master]
GO
ALTER DATABASE [academico] SET  READ_WRITE 
GO

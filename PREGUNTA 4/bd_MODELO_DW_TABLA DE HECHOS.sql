USE [master]
GO
/****** Object:  Database [academicoTH]    Script Date: 11/6/2023 23:04:57 ******/
CREATE DATABASE [academicoTH]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'academicoTH', FILENAME = N'D:\sql server\MSSQL15.MSSQLSERVER\MSSQL\DATA\academicoTH.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'academicoTH_log', FILENAME = N'D:\sql server\MSSQL15.MSSQLSERVER\MSSQL\DATA\academicoTH_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [academicoTH] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [academicoTH].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [academicoTH] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [academicoTH] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [academicoTH] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [academicoTH] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [academicoTH] SET ARITHABORT OFF 
GO
ALTER DATABASE [academicoTH] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [academicoTH] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [academicoTH] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [academicoTH] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [academicoTH] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [academicoTH] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [academicoTH] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [academicoTH] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [academicoTH] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [academicoTH] SET  DISABLE_BROKER 
GO
ALTER DATABASE [academicoTH] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [academicoTH] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [academicoTH] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [academicoTH] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [academicoTH] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [academicoTH] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [academicoTH] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [academicoTH] SET RECOVERY FULL 
GO
ALTER DATABASE [academicoTH] SET  MULTI_USER 
GO
ALTER DATABASE [academicoTH] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [academicoTH] SET DB_CHAINING OFF 
GO
ALTER DATABASE [academicoTH] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [academicoTH] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [academicoTH] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [academicoTH] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'academicoTH', N'ON'
GO
ALTER DATABASE [academicoTH] SET QUERY_STORE = OFF
GO
USE [academicoTH]
GO
/****** Object:  User [NT Service\MSSQLSERVER]    Script Date: 11/6/2023 23:04:57 ******/
CREATE USER [NT Service\MSSQLSERVER] FOR LOGIN [NT Service\MSSQLSERVER] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [NT Service\MSSQLSERVER]
GO
/****** Object:  Table [dbo].[Biblioteca]    Script Date: 11/6/2023 23:04:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Biblioteca](
	[LibroID] [int] NOT NULL,
	[Titulo] [varchar](100) NULL,
	[Autor] [varchar](50) NULL,
	[DepartamentoID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[LibroID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cursos]    Script Date: 11/6/2023 23:04:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cursos](
	[CursoID] [int] NOT NULL,
	[Nombre] [varchar](50) NULL,
	[Creditos] [int] NULL,
	[ProfesorID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[CursoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Departamentos]    Script Date: 11/6/2023 23:04:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Departamentos](
	[DepartamentoID] [int] NOT NULL,
	[Nombre] [varchar](50) NULL,
	[DirectorID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[DepartamentoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Estudiantes]    Script Date: 11/6/2023 23:04:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Estudiantes](
	[EstudianteID] [int] NOT NULL,
	[Nombre] [varchar](50) NULL,
	[Edad] [int] NULL,
	[Carrera] [varchar](50) NULL,
	[FechaIngreso] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[EstudianteID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HechoAsistenciaClases]    Script Date: 11/6/2023 23:04:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HechoAsistenciaClases](
	[AsistenciaID] [int] NOT NULL,
	[EstudianteID] [int] NULL,
	[CursoID] [int] NULL,
	[FechaAsistencia] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[AsistenciaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HechoCalificaciones]    Script Date: 11/6/2023 23:04:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HechoCalificaciones](
	[CalificacionID] [int] NOT NULL,
	[EstudianteID] [int] NULL,
	[CursoID] [int] NULL,
	[Calificacion] [decimal](4, 2) NULL,
	[FechaCalificacion] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[CalificacionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HechoPrestamosLibros]    Script Date: 11/6/2023 23:04:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HechoPrestamosLibros](
	[PrestamoID] [int] NOT NULL,
	[EstudianteID] [int] NULL,
	[LibroID] [int] NULL,
	[FechaPrestamo] [date] NULL,
	[FechaDevolucion] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[PrestamoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Notas]    Script Date: 11/6/2023 23:04:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Notas](
	[NotaID] [int] NOT NULL,
	[EstudianteID] [int] NULL,
	[CursoID] [int] NULL,
	[Calificacion] [decimal](4, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[NotaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Prestamos]    Script Date: 11/6/2023 23:04:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Prestamos](
	[PrestamoID] [int] NOT NULL,
	[EstudianteID] [int] NULL,
	[LibroID] [int] NULL,
	[FechaPrestamo] [date] NULL,
	[FechaDevolucion] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[PrestamoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Profesores]    Script Date: 11/6/2023 23:04:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Profesores](
	[ProfesorID] [int] NOT NULL,
	[Nombre] [varchar](50) NULL,
	[Especialidad] [varchar](50) NULL,
	[FechaContratacion] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[ProfesorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Biblioteca] ([LibroID], [Titulo], [Autor], [DepartamentoID]) VALUES (1, N'Cálculo: Una y varias variables', N'Salas, Hille, Etgen', 1)
INSERT [dbo].[Biblioteca] ([LibroID], [Titulo], [Autor], [DepartamentoID]) VALUES (2, N'Mecánica Clásica', N'John R. Taylor', 2)
INSERT [dbo].[Biblioteca] ([LibroID], [Titulo], [Autor], [DepartamentoID]) VALUES (3, N'Historia Universal', N'César Cantú', 3)
INSERT [dbo].[Biblioteca] ([LibroID], [Titulo], [Autor], [DepartamentoID]) VALUES (4, N'Inglés para principiantes', N'Karen Smith', 4)
INSERT [dbo].[Biblioteca] ([LibroID], [Titulo], [Autor], [DepartamentoID]) VALUES (5, N'Química General', N'Raymond Chang', 5)
GO
INSERT [dbo].[Cursos] ([CursoID], [Nombre], [Creditos], [ProfesorID]) VALUES (1, N'Cálculo I', 4, 1)
INSERT [dbo].[Cursos] ([CursoID], [Nombre], [Creditos], [ProfesorID]) VALUES (2, N'Física I', 3, 2)
INSERT [dbo].[Cursos] ([CursoID], [Nombre], [Creditos], [ProfesorID]) VALUES (3, N'Historia del Arte', 2, 3)
INSERT [dbo].[Cursos] ([CursoID], [Nombre], [Creditos], [ProfesorID]) VALUES (4, N'Inglés Avanzado', 3, 4)
INSERT [dbo].[Cursos] ([CursoID], [Nombre], [Creditos], [ProfesorID]) VALUES (5, N'Química Orgánica', 4, 5)
GO
INSERT [dbo].[Departamentos] ([DepartamentoID], [Nombre], [DirectorID]) VALUES (1, N'Departamento de Matemáticas', 1)
INSERT [dbo].[Departamentos] ([DepartamentoID], [Nombre], [DirectorID]) VALUES (2, N'Departamento de Física', 2)
INSERT [dbo].[Departamentos] ([DepartamentoID], [Nombre], [DirectorID]) VALUES (3, N'Departamento de Historia', 3)
INSERT [dbo].[Departamentos] ([DepartamentoID], [Nombre], [DirectorID]) VALUES (4, N'Departamento de Idiomas', 4)
INSERT [dbo].[Departamentos] ([DepartamentoID], [Nombre], [DirectorID]) VALUES (5, N'Departamento de Química', 5)
GO
INSERT [dbo].[Estudiantes] ([EstudianteID], [Nombre], [Edad], [Carrera], [FechaIngreso]) VALUES (1, N'Juan Perez', 20, N'Ingeniería de Sistemas', CAST(N'2020-09-01' AS Date))
INSERT [dbo].[Estudiantes] ([EstudianteID], [Nombre], [Edad], [Carrera], [FechaIngreso]) VALUES (2, N'María López', 22, N'Medicina', CAST(N'2019-08-15' AS Date))
INSERT [dbo].[Estudiantes] ([EstudianteID], [Nombre], [Edad], [Carrera], [FechaIngreso]) VALUES (3, N'Pedro Ramirez', 19, N'Derecho', CAST(N'2021-01-10' AS Date))
INSERT [dbo].[Estudiantes] ([EstudianteID], [Nombre], [Edad], [Carrera], [FechaIngreso]) VALUES (4, N'Ana Martinez', 21, N'Arquitectura', CAST(N'2020-03-05' AS Date))
INSERT [dbo].[Estudiantes] ([EstudianteID], [Nombre], [Edad], [Carrera], [FechaIngreso]) VALUES (5, N'Luisa Garcia', 20, N'Psicología', CAST(N'2019-09-20' AS Date))
GO
INSERT [dbo].[HechoAsistenciaClases] ([AsistenciaID], [EstudianteID], [CursoID], [FechaAsistencia]) VALUES (1, 1, 1, CAST(N'2023-06-11' AS Date))
INSERT [dbo].[HechoAsistenciaClases] ([AsistenciaID], [EstudianteID], [CursoID], [FechaAsistencia]) VALUES (2, 1, 2, CAST(N'2023-06-11' AS Date))
INSERT [dbo].[HechoAsistenciaClases] ([AsistenciaID], [EstudianteID], [CursoID], [FechaAsistencia]) VALUES (3, 1, 3, CAST(N'2023-06-11' AS Date))
INSERT [dbo].[HechoAsistenciaClases] ([AsistenciaID], [EstudianteID], [CursoID], [FechaAsistencia]) VALUES (4, 1, 4, CAST(N'2023-06-11' AS Date))
INSERT [dbo].[HechoAsistenciaClases] ([AsistenciaID], [EstudianteID], [CursoID], [FechaAsistencia]) VALUES (5, 1, 5, CAST(N'2023-06-11' AS Date))
INSERT [dbo].[HechoAsistenciaClases] ([AsistenciaID], [EstudianteID], [CursoID], [FechaAsistencia]) VALUES (6, 2, 1, CAST(N'2023-06-11' AS Date))
INSERT [dbo].[HechoAsistenciaClases] ([AsistenciaID], [EstudianteID], [CursoID], [FechaAsistencia]) VALUES (7, 2, 2, CAST(N'2023-06-11' AS Date))
INSERT [dbo].[HechoAsistenciaClases] ([AsistenciaID], [EstudianteID], [CursoID], [FechaAsistencia]) VALUES (8, 2, 3, CAST(N'2023-06-11' AS Date))
INSERT [dbo].[HechoAsistenciaClases] ([AsistenciaID], [EstudianteID], [CursoID], [FechaAsistencia]) VALUES (9, 2, 4, CAST(N'2023-06-11' AS Date))
INSERT [dbo].[HechoAsistenciaClases] ([AsistenciaID], [EstudianteID], [CursoID], [FechaAsistencia]) VALUES (10, 2, 5, CAST(N'2023-06-11' AS Date))
INSERT [dbo].[HechoAsistenciaClases] ([AsistenciaID], [EstudianteID], [CursoID], [FechaAsistencia]) VALUES (11, 3, 1, CAST(N'2023-06-11' AS Date))
INSERT [dbo].[HechoAsistenciaClases] ([AsistenciaID], [EstudianteID], [CursoID], [FechaAsistencia]) VALUES (12, 3, 2, CAST(N'2023-06-11' AS Date))
INSERT [dbo].[HechoAsistenciaClases] ([AsistenciaID], [EstudianteID], [CursoID], [FechaAsistencia]) VALUES (13, 3, 3, CAST(N'2023-06-11' AS Date))
INSERT [dbo].[HechoAsistenciaClases] ([AsistenciaID], [EstudianteID], [CursoID], [FechaAsistencia]) VALUES (14, 3, 4, CAST(N'2023-06-11' AS Date))
INSERT [dbo].[HechoAsistenciaClases] ([AsistenciaID], [EstudianteID], [CursoID], [FechaAsistencia]) VALUES (15, 3, 5, CAST(N'2023-06-11' AS Date))
INSERT [dbo].[HechoAsistenciaClases] ([AsistenciaID], [EstudianteID], [CursoID], [FechaAsistencia]) VALUES (16, 4, 1, CAST(N'2023-06-11' AS Date))
INSERT [dbo].[HechoAsistenciaClases] ([AsistenciaID], [EstudianteID], [CursoID], [FechaAsistencia]) VALUES (17, 4, 2, CAST(N'2023-06-11' AS Date))
INSERT [dbo].[HechoAsistenciaClases] ([AsistenciaID], [EstudianteID], [CursoID], [FechaAsistencia]) VALUES (18, 4, 3, CAST(N'2023-06-11' AS Date))
INSERT [dbo].[HechoAsistenciaClases] ([AsistenciaID], [EstudianteID], [CursoID], [FechaAsistencia]) VALUES (19, 4, 4, CAST(N'2023-06-11' AS Date))
INSERT [dbo].[HechoAsistenciaClases] ([AsistenciaID], [EstudianteID], [CursoID], [FechaAsistencia]) VALUES (20, 4, 5, CAST(N'2023-06-11' AS Date))
INSERT [dbo].[HechoAsistenciaClases] ([AsistenciaID], [EstudianteID], [CursoID], [FechaAsistencia]) VALUES (21, 5, 1, CAST(N'2023-06-11' AS Date))
INSERT [dbo].[HechoAsistenciaClases] ([AsistenciaID], [EstudianteID], [CursoID], [FechaAsistencia]) VALUES (22, 5, 2, CAST(N'2023-06-11' AS Date))
INSERT [dbo].[HechoAsistenciaClases] ([AsistenciaID], [EstudianteID], [CursoID], [FechaAsistencia]) VALUES (23, 5, 3, CAST(N'2023-06-11' AS Date))
INSERT [dbo].[HechoAsistenciaClases] ([AsistenciaID], [EstudianteID], [CursoID], [FechaAsistencia]) VALUES (24, 5, 4, CAST(N'2023-06-11' AS Date))
INSERT [dbo].[HechoAsistenciaClases] ([AsistenciaID], [EstudianteID], [CursoID], [FechaAsistencia]) VALUES (25, 5, 5, CAST(N'2023-06-11' AS Date))
GO
INSERT [dbo].[HechoCalificaciones] ([CalificacionID], [EstudianteID], [CursoID], [Calificacion], [FechaCalificacion]) VALUES (1, 1, 1, CAST(4.50 AS Decimal(4, 2)), CAST(N'2023-06-11' AS Date))
INSERT [dbo].[HechoCalificaciones] ([CalificacionID], [EstudianteID], [CursoID], [Calificacion], [FechaCalificacion]) VALUES (2, 1, 2, CAST(3.80 AS Decimal(4, 2)), CAST(N'2023-06-11' AS Date))
INSERT [dbo].[HechoCalificaciones] ([CalificacionID], [EstudianteID], [CursoID], [Calificacion], [FechaCalificacion]) VALUES (3, 2, 3, CAST(4.20 AS Decimal(4, 2)), CAST(N'2023-06-11' AS Date))
INSERT [dbo].[HechoCalificaciones] ([CalificacionID], [EstudianteID], [CursoID], [Calificacion], [FechaCalificacion]) VALUES (4, 2, 4, CAST(4.00 AS Decimal(4, 2)), CAST(N'2023-06-11' AS Date))
INSERT [dbo].[HechoCalificaciones] ([CalificacionID], [EstudianteID], [CursoID], [Calificacion], [FechaCalificacion]) VALUES (5, 3, 5, CAST(3.70 AS Decimal(4, 2)), CAST(N'2023-06-11' AS Date))
GO
INSERT [dbo].[HechoPrestamosLibros] ([PrestamoID], [EstudianteID], [LibroID], [FechaPrestamo], [FechaDevolucion]) VALUES (1, 1, 1, CAST(N'2023-05-15' AS Date), CAST(N'2023-05-30' AS Date))
INSERT [dbo].[HechoPrestamosLibros] ([PrestamoID], [EstudianteID], [LibroID], [FechaPrestamo], [FechaDevolucion]) VALUES (2, 2, 2, CAST(N'2023-05-20' AS Date), CAST(N'2023-06-10' AS Date))
INSERT [dbo].[HechoPrestamosLibros] ([PrestamoID], [EstudianteID], [LibroID], [FechaPrestamo], [FechaDevolucion]) VALUES (3, 3, 3, CAST(N'2023-06-01' AS Date), CAST(N'2023-06-15' AS Date))
INSERT [dbo].[HechoPrestamosLibros] ([PrestamoID], [EstudianteID], [LibroID], [FechaPrestamo], [FechaDevolucion]) VALUES (4, 4, 4, CAST(N'2023-05-25' AS Date), CAST(N'2023-06-05' AS Date))
INSERT [dbo].[HechoPrestamosLibros] ([PrestamoID], [EstudianteID], [LibroID], [FechaPrestamo], [FechaDevolucion]) VALUES (5, 5, 5, CAST(N'2023-06-03' AS Date), CAST(N'2023-06-18' AS Date))
GO
INSERT [dbo].[Notas] ([NotaID], [EstudianteID], [CursoID], [Calificacion]) VALUES (1, 1, 1, CAST(4.50 AS Decimal(4, 2)))
INSERT [dbo].[Notas] ([NotaID], [EstudianteID], [CursoID], [Calificacion]) VALUES (2, 1, 2, CAST(3.80 AS Decimal(4, 2)))
INSERT [dbo].[Notas] ([NotaID], [EstudianteID], [CursoID], [Calificacion]) VALUES (3, 2, 3, CAST(4.20 AS Decimal(4, 2)))
INSERT [dbo].[Notas] ([NotaID], [EstudianteID], [CursoID], [Calificacion]) VALUES (4, 2, 4, CAST(4.00 AS Decimal(4, 2)))
INSERT [dbo].[Notas] ([NotaID], [EstudianteID], [CursoID], [Calificacion]) VALUES (5, 3, 5, CAST(3.70 AS Decimal(4, 2)))
GO
INSERT [dbo].[Prestamos] ([PrestamoID], [EstudianteID], [LibroID], [FechaPrestamo], [FechaDevolucion]) VALUES (1, 1, 1, CAST(N'2023-05-15' AS Date), CAST(N'2023-05-30' AS Date))
INSERT [dbo].[Prestamos] ([PrestamoID], [EstudianteID], [LibroID], [FechaPrestamo], [FechaDevolucion]) VALUES (2, 2, 2, CAST(N'2023-05-20' AS Date), CAST(N'2023-06-10' AS Date))
INSERT [dbo].[Prestamos] ([PrestamoID], [EstudianteID], [LibroID], [FechaPrestamo], [FechaDevolucion]) VALUES (3, 3, 3, CAST(N'2023-06-01' AS Date), CAST(N'2023-06-15' AS Date))
INSERT [dbo].[Prestamos] ([PrestamoID], [EstudianteID], [LibroID], [FechaPrestamo], [FechaDevolucion]) VALUES (4, 4, 4, CAST(N'2023-05-25' AS Date), CAST(N'2023-06-05' AS Date))
INSERT [dbo].[Prestamos] ([PrestamoID], [EstudianteID], [LibroID], [FechaPrestamo], [FechaDevolucion]) VALUES (5, 5, 5, CAST(N'2023-06-03' AS Date), CAST(N'2023-06-18' AS Date))
GO
INSERT [dbo].[Profesores] ([ProfesorID], [Nombre], [Especialidad], [FechaContratacion]) VALUES (1, N'Carlos Rodriguez', N'Matemáticas', CAST(N'2010-05-15' AS Date))
INSERT [dbo].[Profesores] ([ProfesorID], [Nombre], [Especialidad], [FechaContratacion]) VALUES (2, N'Laura Gómez', N'Física', CAST(N'2015-01-20' AS Date))
INSERT [dbo].[Profesores] ([ProfesorID], [Nombre], [Especialidad], [FechaContratacion]) VALUES (3, N'Roberto Morales', N'Historia', CAST(N'2019-09-05' AS Date))
INSERT [dbo].[Profesores] ([ProfesorID], [Nombre], [Especialidad], [FechaContratacion]) VALUES (4, N'Carmen Torres', N'Idiomas', CAST(N'2018-03-10' AS Date))
INSERT [dbo].[Profesores] ([ProfesorID], [Nombre], [Especialidad], [FechaContratacion]) VALUES (5, N'Miguel Sánchez', N'Química', CAST(N'2013-11-22' AS Date))
GO
ALTER TABLE [dbo].[Biblioteca]  WITH CHECK ADD FOREIGN KEY([DepartamentoID])
REFERENCES [dbo].[Departamentos] ([DepartamentoID])
GO
ALTER TABLE [dbo].[Cursos]  WITH CHECK ADD FOREIGN KEY([ProfesorID])
REFERENCES [dbo].[Profesores] ([ProfesorID])
GO
ALTER TABLE [dbo].[Departamentos]  WITH CHECK ADD FOREIGN KEY([DirectorID])
REFERENCES [dbo].[Profesores] ([ProfesorID])
GO
ALTER TABLE [dbo].[HechoAsistenciaClases]  WITH CHECK ADD FOREIGN KEY([CursoID])
REFERENCES [dbo].[Cursos] ([CursoID])
GO
ALTER TABLE [dbo].[HechoAsistenciaClases]  WITH CHECK ADD FOREIGN KEY([EstudianteID])
REFERENCES [dbo].[Estudiantes] ([EstudianteID])
GO
ALTER TABLE [dbo].[HechoCalificaciones]  WITH CHECK ADD FOREIGN KEY([CursoID])
REFERENCES [dbo].[Cursos] ([CursoID])
GO
ALTER TABLE [dbo].[HechoCalificaciones]  WITH CHECK ADD FOREIGN KEY([EstudianteID])
REFERENCES [dbo].[Estudiantes] ([EstudianteID])
GO
ALTER TABLE [dbo].[HechoPrestamosLibros]  WITH CHECK ADD FOREIGN KEY([EstudianteID])
REFERENCES [dbo].[Estudiantes] ([EstudianteID])
GO
ALTER TABLE [dbo].[HechoPrestamosLibros]  WITH CHECK ADD FOREIGN KEY([LibroID])
REFERENCES [dbo].[Biblioteca] ([LibroID])
GO
ALTER TABLE [dbo].[Notas]  WITH CHECK ADD FOREIGN KEY([CursoID])
REFERENCES [dbo].[Cursos] ([CursoID])
GO
ALTER TABLE [dbo].[Notas]  WITH CHECK ADD FOREIGN KEY([EstudianteID])
REFERENCES [dbo].[Estudiantes] ([EstudianteID])
GO
ALTER TABLE [dbo].[Prestamos]  WITH CHECK ADD FOREIGN KEY([EstudianteID])
REFERENCES [dbo].[Estudiantes] ([EstudianteID])
GO
ALTER TABLE [dbo].[Prestamos]  WITH CHECK ADD FOREIGN KEY([LibroID])
REFERENCES [dbo].[Biblioteca] ([LibroID])
GO
USE [master]
GO
ALTER DATABASE [academicoTH] SET  READ_WRITE 
GO

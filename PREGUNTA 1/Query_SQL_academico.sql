CREATE TABLE Estudiantes (
    EstudianteID INT PRIMARY KEY,
    Nombre VARCHAR(50),
    Edad INT,
    Carrera VARCHAR(50),
    FechaIngreso DATE
);

-- Registros de ejemplo
INSERT INTO Estudiantes (EstudianteID, Nombre, Edad, Carrera, FechaIngreso)
VALUES
    (1, 'Juan Perez', 20, 'Ingeniería de Sistemas', '2020-09-01'),
    (2, 'María López', 22, 'Medicina', '2019-08-15'),
    (3, 'Pedro Ramirez', 19, 'Derecho', '2021-01-10'),
    (4, 'Ana Martinez', 21, 'Arquitectura', '2020-03-05'),
    (5, 'Luisa Garcia', 20, 'Psicología', '2019-09-20');

CREATE TABLE Profesores (
    ProfesorID INT PRIMARY KEY,
    Nombre VARCHAR(50),
    Especialidad VARCHAR(50),
    FechaContratacion DATE
);

-- Registros de ejemplo
INSERT INTO Profesores (ProfesorID, Nombre, Especialidad, FechaContratacion)
VALUES
    (1, 'Carlos Rodriguez', 'Matemáticas', '2010-05-15'),
    (2, 'Laura Gómez', 'Física', '2015-01-20'),
    (3, 'Roberto Morales', 'Historia', '2019-09-05'),
    (4, 'Carmen Torres', 'Idiomas', '2018-03-10'),
    (5, 'Miguel Sánchez', 'Química', '2013-11-22');

CREATE TABLE Cursos (
    CursoID INT PRIMARY KEY,
    Nombre VARCHAR(50),
    Creditos INT,
    ProfesorID INT,
    FOREIGN KEY (ProfesorID) REFERENCES Profesores(ProfesorID)
);

-- Registros de ejemplo
INSERT INTO Cursos (CursoID, Nombre, Creditos, ProfesorID)
VALUES
    (1, 'Cálculo I', 4, 1),
    (2, 'Física I', 3, 2),
    (3, 'Historia del Arte', 2, 3),
    (4, 'Inglés Avanzado', 3, 4),
    (5, 'Química Orgánica', 4, 5);

CREATE TABLE Notas (
    NotaID INT PRIMARY KEY,
    EstudianteID INT,
    CursoID INT,
    Calificacion DECIMAL(4,2),
    FOREIGN KEY (EstudianteID) REFERENCES Estudiantes(EstudianteID),
    FOREIGN KEY (CursoID) REFERENCES Cursos(CursoID)
);

-- Registros de ejemplo
INSERT INTO Notas (NotaID, EstudianteID, CursoID, Calificacion)
VALUES
    (1, 1, 1, 4.5),
    (2, 1, 2, 3.8),
    (3, 2, 3, 4.2),
    (4, 2, 4, 4.0),
    (5, 3, 5, 3.7);

CREATE TABLE Departamentos (
    DepartamentoID INT PRIMARY KEY,
    Nombre VARCHAR(50),
    DirectorID INT,
    FOREIGN KEY (DirectorID) REFERENCES Profesores(ProfesorID)
);

-- Registros de ejemplo
INSERT INTO Departamentos (DepartamentoID, Nombre, DirectorID)
VALUES
    (1, 'Departamento de Matemáticas', 1),
    (2, 'Departamento de Física', 2),
    (3, 'Departamento de Historia', 3),
    (4, 'Departamento de Idiomas', 4),
    (5, 'Departamento de Química', 5);

CREATE TABLE Biblioteca (
    LibroID INT PRIMARY KEY,
    Titulo VARCHAR(100),
    Autor VARCHAR(50),
    DepartamentoID INT,
    FOREIGN KEY (DepartamentoID) REFERENCES Departamentos(DepartamentoID)
);

-- Registros de ejemplo
INSERT INTO Biblioteca (LibroID, Titulo, Autor, DepartamentoID)
VALUES
    (1, 'Cálculo: Una y varias variables', 'Salas, Hille, Etgen', 1),
    (2, 'Mecánica Clásica', 'John R. Taylor', 2),
    (3, 'Historia Universal', 'César Cantú', 3),
    (4, 'Inglés para principiantes', 'Karen Smith', 4),
    (5, 'Química General', 'Raymond Chang', 5);

CREATE TABLE Prestamos (
    PrestamoID INT PRIMARY KEY,
    EstudianteID INT,
    LibroID INT,
    FechaPrestamo DATE,
    FechaDevolucion DATE,
    FOREIGN KEY (EstudianteID) REFERENCES Estudiantes(EstudianteID),
    FOREIGN KEY (LibroID) REFERENCES Biblioteca(LibroID)
);

-- Registros de ejemplo
INSERT INTO Prestamos (PrestamoID, EstudianteID, LibroID, FechaPrestamo, FechaDevolucion)
VALUES
    (1, 1, 1, '2023-05-15', '2023-05-30'),
    (2, 2, 2, '2023-05-20', '2023-06-10'),
    (3, 3, 3, '2023-06-01', '2023-06-15'),
    (4, 4, 4, '2023-05-25', '2023-06-05'),
    (5, 5, 5, '2023-06-03', '2023-06-18');

CREATE TABLE HechoCalificaciones (
    CalificacionID INT PRIMARY KEY,
    EstudianteID INT,
    CursoID INT,
    Calificacion DECIMAL(4,2),
    FechaCalificacion DATE,
    FOREIGN KEY (EstudianteID) REFERENCES Estudiantes(EstudianteID),
    FOREIGN KEY (CursoID) REFERENCES Cursos(CursoID)
);

-- Insertar registros de ejemplo
INSERT INTO HechoCalificaciones (CalificacionID, EstudianteID, CursoID, Calificacion, FechaCalificacion)
SELECT
    N.NotaID,
    N.EstudianteID,
    N.CursoID,
    N.Calificacion,
    GETDATE() AS FechaCalificacion
FROM Notas N;

CREATE TABLE HechoPrestamosLibros (
    PrestamoID INT PRIMARY KEY,
    EstudianteID INT,
    LibroID INT,
    FechaPrestamo DATE,
    FechaDevolucion DATE,
    FOREIGN KEY (EstudianteID) REFERENCES Estudiantes(EstudianteID),
    FOREIGN KEY (LibroID) REFERENCES Biblioteca(LibroID)
);

-- Insertar registros de ejemplo
INSERT INTO HechoPrestamosLibros (PrestamoID, EstudianteID, LibroID, FechaPrestamo, FechaDevolucion)
SELECT
    P.PrestamoID,
    P.EstudianteID,
    P.LibroID,
    P.FechaPrestamo,
    P.FechaDevolucion
FROM Prestamos P;

CREATE TABLE HechoAsistenciaClases (
    AsistenciaID INT PRIMARY KEY,
    EstudianteID INT,
    CursoID INT,
    FechaAsistencia DATE,
    FOREIGN KEY (EstudianteID) REFERENCES Estudiantes(EstudianteID),
    FOREIGN KEY (CursoID) REFERENCES Cursos(CursoID)
);

-- Insertar registros de ejemplo
INSERT INTO HechoAsistenciaClases (AsistenciaID, EstudianteID, CursoID, FechaAsistencia)
SELECT
    ROW_NUMBER() OVER (ORDER BY E.EstudianteID, C.CursoID) AS AsistenciaID,
    E.EstudianteID,
    C.CursoID,
    GETDATE() AS FechaAsistencia
FROM Estudiantes E
CROSS JOIN Cursos C;

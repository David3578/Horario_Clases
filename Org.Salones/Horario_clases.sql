DROP DATABASE IF EXISTS Horario_clases;
CREATE DATABASE Horario_clases CHARACTER SET UTF8;
USE Horario_clases;

-- Tabla Aulas
CREATE TABLE Aulas (
    IdAula INT PRIMARY KEY,
    Anicio INT,
    CantidadComputadoras INT,
    Ubicacion VARCHAR(45),
    Division INT,
    CantidadAlumnos VARCHAR(45)
);
-- Tabla Materia
CREATE TABLE Materia (
    idMateria INT PRIMARY KEY,
    NombreMateria VARCHAR(45),
    DescripcionMateria TEXT,
    Anio INT,
    Division INT
);
-- Tabla Profesor
CREATE TABLE Profesor (
    idProfesor INT PRIMARY KEY,
    NombreProfesor VARCHAR(45),
    Especialidad VARCHAR(45),
    Email VARCHAR(45)
);

-- Tabla Materia_has_Profesores
CREATE TABLE Materia_has_Profesores (
    Materia_idMateria INT,
    Profesores_idProfesores INT,
    PRIMARY KEY (Materia_idMateria, Profesores_idProfesores),
    FOREIGN KEY (Materia_idMateria) REFERENCES Materia(idMateria),
    FOREIGN KEY (Profesores_idProfesores) REFERENCES Profesor(idProfesor)
);
-- Tabla Curso
CREATE TABLE Curso (
    idCurso INT PRIMARY KEY,
    NombreCurso VARCHAR(45),
    DescripcionCurso TEXT,
    Profesores_idProfesores INT,
    Anio INT,
    Division INT,
    FOREIGN KEY (Profesores_idProfesores) REFERENCES Profesor(idProfesor)
);



-- Tabla Horario
CREATE TABLE Horario (
    idHorario INT PRIMARY KEY,
    DiaSemana VARCHAR(10),
    HoraInicio TIME,
    HoraFin TIME,
    Aulas_IdAula INT,
    Curso_idCurso INT,
    Materia_idMateria INT,
    FOREIGN KEY (Aulas_IdAula) REFERENCES Aulas(IdAula),
    FOREIGN KEY (Curso_idCurso) REFERENCES Curso(idCurso),
    FOREIGN KEY (Materia_idMateria) REFERENCES Materia(idMateria)
);




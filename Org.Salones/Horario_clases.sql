-- Crear el esquema si no existe
Drop database if exists horario_clases_1;
CREATE SCHEMA IF NOT EXISTS Horario_clases_1 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
-- Usar el esquema creado
USE Horario_clases_1;
-- Crear la tabla Aula
CREATE TABLE Aula (
  IdAula INT NOT NULL AUTO_INCREMENT,
  inicio INT NULL DEFAULT NULL,
  CantidadComputadoras INT NULL DEFAULT NULL,
  Ubicacion VARCHAR(45) NULL DEFAULT NULL,
  Division INT NULL DEFAULT NULL,
  CantidadAlumnos VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (IdAula)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Crear la tabla Profesor
CREATE TABLE Profesor (
  idProfesor INT NOT NULL,
  Nombre VARCHAR(45) NULL DEFAULT NULL,
  Especialidad VARCHAR(45) NULL DEFAULT NULL,
  Email VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (idProfesor)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Crear la tabla Turno
CREATE TABLE Turno (
  idTurno INT NOT NULL,
  Año DATE NULL DEFAULT NULL,
  PRIMARY KEY (idTurno)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Crear la tabla Curso
CREATE TABLE Curso (
  idCurso INT NOT NULL,
  Nombre VARCHAR(45) NULL DEFAULT NULL,
  Descripcion TEXT NULL DEFAULT NULL,
  Profesores_idProfesores INT NULL DEFAULT NULL,
  Anio INT NULL DEFAULT NULL,
  Division INT NULL DEFAULT NULL,
  Turno_idTurno INT NOT NULL,
  CicloColectivo DATE NULL,
  PRIMARY KEY (idCurso),
  INDEX Profesores_idProfesores (Profesores_idProfesores ASC),
  CONSTRAINT Curso_ibfk_1
    FOREIGN KEY (Profesores_idProfesores)
    REFERENCES Profesor (idProfesor),
  CONSTRAINT fk_Curso_Turno1
    FOREIGN KEY (Turno_idTurno)
    REFERENCES Turno (idTurno)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Crear la tabla Materia
CREATE TABLE Materia (
  idMateria INT NOT NULL,
  Nombre VARCHAR(45) NULL DEFAULT NULL,
  Descripcion TEXT NULL DEFAULT NULL,
  Año DATE NULL DEFAULT NULL,
  PRIMARY KEY (idMateria)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Crear la tabla Horario
CREATE TABLE Horario (
  idHorario INT NOT NULL,
  DiaSemana VARCHAR(10) NULL DEFAULT NULL,
  HoraInicio TIME NULL DEFAULT NULL,
  HoraFin TIME NULL DEFAULT NULL,
  Aulas_IdAula INT NULL DEFAULT NULL,
  Curso_idCurso INT NULL DEFAULT NULL,
  Materia_idMateria INT NULL DEFAULT NULL,
  PRIMARY KEY (idHorario),
  INDEX Aulas_IdAula (Aulas_IdAula ASC),
  INDEX Curso_idCurso (Curso_idCurso ASC),
  INDEX Materia_idMateria (Materia_idMateria ASC),
  CONSTRAINT Horario_ibfk_1
    FOREIGN KEY (Aulas_IdAula)
    REFERENCES Aula (IdAula),
  CONSTRAINT Horario_ibfk_2
    FOREIGN KEY (Curso_idCurso)
    REFERENCES Curso (idCurso),
  CONSTRAINT Horario_ibfk_3
    FOREIGN KEY (Materia_idMateria)
    REFERENCES Materia (idMateria)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Crear la tabla Materia_has_Profesores
CREATE TABLE Materia_has_Profesores (
  Materia_idMateria INT NOT NULL,
  Profesores_idProfesores INT NOT NULL,
  PRIMARY KEY (Materia_idMateria, Profesores_idProfesores),
  INDEX Profesores_idProfesores (Profesores_idProfesores ASC),
  CONSTRAINT Materia_has_Profesores_ibfk_1
    FOREIGN KEY (Materia_idMateria)
    REFERENCES Materia (idMateria),
  CONSTRAINT Materia_has_Profesores_ibfk_2
    FOREIGN KEY (Profesores_idProfesores)
    REFERENCES Profesor (idProfesor)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

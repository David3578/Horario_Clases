-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema Horario_clases
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Horario_clases
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Horario_clases` DEFAULT CHARACTER SET utf8mb3 ;
USE `Horario_clases` ;

-- -----------------------------------------------------
-- Table `Horario_clases`.`Aulas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Horario_clases`.`Aulas` (
  `IdAula` INT NOT NULL,
  `Anicio` INT NULL DEFAULT NULL,
  `CantidadComputadoras` INT NULL DEFAULT NULL,
  `Ubicacion` VARCHAR(45) NULL DEFAULT NULL,
  `Division` INT NULL DEFAULT NULL,
  `CantidadAlumnos` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`IdAula`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `Horario_clases`.`Profesor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Horario_clases`.`Profesor` (
  `idProfesor` INT NOT NULL,
  `Nombre` VARCHAR(45) NULL DEFAULT NULL,
  `Especialidad` VARCHAR(45) NULL DEFAULT NULL,
  `Email` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idProfesor`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `Horario_clases`.`Turno`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Horario_clases`.`Turno` (
  `idTurno` INT NOT NULL,
  `Nombre` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idTurno`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `Horario_clases`.`Curso`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Horario_clases`.`Curso` (
  `idCurso` INT NOT NULL,
  `Nombre` VARCHAR(45) NULL DEFAULT NULL,
  `Descripcion` TEXT NULL DEFAULT NULL,
  `Profesores_idProfesores` INT NULL DEFAULT NULL,
  `Año` DATE NULL DEFAULT NULL,
  `Division` INT NULL DEFAULT NULL,
  `Turno_idTurno` INT NOT NULL,
  PRIMARY KEY (`idCurso`),
  INDEX `Profesores_idProfesores` (`Profesores_idProfesores` ASC) VISIBLE,
  INDEX `fk_Curso_Turno1_idx` (`Turno_idTurno` ASC) VISIBLE,
  CONSTRAINT `Curso_ibfk_1`
    FOREIGN KEY (`Profesores_idProfesores`)
    REFERENCES `Horario_clases`.`Profesor` (`idProfesor`),
  CONSTRAINT `fk_Curso_Turno1`
    FOREIGN KEY (`Turno_idTurno`)
    REFERENCES `Horario_clases`.`Turno` (`idTurno`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `Horario_clases`.`Materia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Horario_clases`.`Materia` (
  `idMateria` INT NOT NULL,
  `Nombre` VARCHAR(45) NULL DEFAULT NULL,
  `Descripcion` TEXT NULL DEFAULT NULL,
  `Año` DATE NULL DEFAULT NULL,
  `Division` INT NULL DEFAULT NULL,
  PRIMARY KEY (`idMateria`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `Horario_clases`.`Horario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Horario_clases`.`Horario` (
  `idHorario` INT NOT NULL,
  `DiaSemana` VARCHAR(10) NULL DEFAULT NULL,
  `HoraInicio` TIME NULL DEFAULT NULL,
  `HoraFin` TIME NULL DEFAULT NULL,
  `Aulas_IdAula` INT NULL DEFAULT NULL,
  `Curso_idCurso` INT NULL DEFAULT NULL,
  `Materia_idMateria` INT NULL DEFAULT NULL,
  PRIMARY KEY (`idHorario`),
  INDEX `Aulas_IdAula` (`Aulas_IdAula` ASC) VISIBLE,
  INDEX `Curso_idCurso` (`Curso_idCurso` ASC) VISIBLE,
  INDEX `Materia_idMateria` (`Materia_idMateria` ASC) VISIBLE,
  CONSTRAINT `Horario_ibfk_1`
    FOREIGN KEY (`Aulas_IdAula`)
    REFERENCES `Horario_clases`.`Aulas` (`IdAula`),
  CONSTRAINT `Horario_ibfk_2`
    FOREIGN KEY (`Curso_idCurso`)
    REFERENCES `Horario_clases`.`Curso` (`idCurso`),
  CONSTRAINT `Horario_ibfk_3`
    FOREIGN KEY (`Materia_idMateria`)
    REFERENCES `Horario_clases`.`Materia` (`idMateria`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `Horario_clases`.`Materia_has_Profesores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Horario_clases`.`Materia_has_Profesores` (
  `Materia_idMateria` INT NOT NULL,
  `Profesores_idProfesores` INT NOT NULL,
  PRIMARY KEY (`Materia_idMateria`, `Profesores_idProfesores`),
  INDEX `Profesores_idProfesores` (`Profesores_idProfesores` ASC) VISIBLE,
  CONSTRAINT `Materia_has_Profesores_ibfk_1`
    FOREIGN KEY (`Materia_idMateria`)
    REFERENCES `Horario_clases`.`Materia` (`idMateria`),
  CONSTRAINT `Materia_has_Profesores_ibfk_2`
    FOREIGN KEY (`Profesores_idProfesores`)
    REFERENCES `Horario_clases`.`Profesor` (`idProfesor`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

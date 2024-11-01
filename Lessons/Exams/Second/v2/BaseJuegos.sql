-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema Juegos
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Juegos
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Juegos` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `Juegos` ;

-- -----------------------------------------------------
-- Table `Juegos`.`Desarrollador`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Juegos`.`Desarrollador` (
  `ID` INT NOT NULL,
  `Desarrollador` TEXT NULL DEFAULT NULL,
  `Sede` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `Juegos`.`Genero`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Juegos`.`Genero` (
  `ID` INT NOT NULL,
  `Género` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `Juegos`.`Juego`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Juegos`.`Juego` (
  `ID` INT NOT NULL,
  `Título del Juego` TEXT NULL DEFAULT NULL,
  `Año de Lanzamiento` INT NULL DEFAULT NULL,
  `ID_Desarrollador` INT NULL DEFAULT NULL,
  `Calificación` DOUBLE NULL DEFAULT NULL,
  PRIMARY KEY (`ID`),
  INDEX `ID_Desarrollador_idx` (`ID_Desarrollador` ASC) VISIBLE,
  CONSTRAINT `ID`
    FOREIGN KEY (`ID_Desarrollador`)
    REFERENCES `Juegos`.`Desarrollador` (`ID`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `Juegos`.`GeneroJuego`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Juegos`.`GeneroJuego` (
  `ID_Genero` INT NULL DEFAULT NULL,
  `ID_Juego` INT NULL DEFAULT NULL,
  INDEX `ID_idx` (`ID_Genero` ASC) VISIBLE,
  INDEX `ID_idx1` (`ID_Juego` ASC) VISIBLE,
  CONSTRAINT `fk_GeneroJuego_Juego1`
    FOREIGN KEY (`ID_Juego`)
    REFERENCES `Juegos`.`Juego` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_GeneroJuego_Genero1`
    FOREIGN KEY (`ID_Genero`)
    REFERENCES `Juegos`.`Genero` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `Juegos`.`Personaje`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Juegos`.`Personaje` (
  `ID` INT NOT NULL,
  `Nombre` TEXT NULL,
  `ID_Juego` INT NOT NULL,
  PRIMARY KEY (`ID`, `ID_Juego`),
  INDEX `ID_idx` (`ID_Juego` ASC) VISIBLE,
  CONSTRAINT `fk_Personaje_Juego1`
    FOREIGN KEY (`ID_Juego`)
    REFERENCES `Juegos`.`Juego` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `Juegos`.`Plataforma`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Juegos`.`Plataforma` (
  `ID` TEXT NOT NULL,
  `Plataforma` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `Juegos`.`PlataformaJuego`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Juegos`.`PlataformaJuego` (
  `ID_Plataforma` TEXT NOT NULL,
  `ID_Juego` INT NOT NULL,
  INDEX `fk_PlataformaJuego_Juego1_idx` (`ID_Juego` ASC) VISIBLE,
  INDEX `fk_PlataformaJuego_Plataforma1_idx` (`ID_Plataforma` ASC) VISIBLE,
  PRIMARY KEY (`ID_Juego`, `ID_Plataforma`),
  CONSTRAINT `fk_PlataformaJuego_Juego1`
    FOREIGN KEY (`ID_Juego`)
    REFERENCES `Juegos`.`Juego` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_PlataformaJuego_Plataforma1`
    FOREIGN KEY (`ID_Plataforma`)
    REFERENCES `Juegos`.`Plataforma` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;


-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema MER2C
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema MER2C
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `MER2C` ;
USE `MER2C` ;

-- -----------------------------------------------------
-- Table `MER2C`.`Departament`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER2C`.`Departament` (
  `ID` INT NOT NULL,
  `Nom` VARCHAR(45) NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MER2C`.`Professor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER2C`.`Professor` (
  `DNI` INT NOT NULL,
  `Nom` VARCHAR(45) NOT NULL,
  `Cognoms` VARCHAR(45) NOT NULL,
  `Titulacio` VARCHAR(45) NOT NULL,
  `Departament` VARCHAR(45) NOT NULL,
  `Es_cap_de_departament` VARCHAR(45) NOT NULL,
  `Departament_ID` INT NOT NULL,
  PRIMARY KEY (`DNI`),
  INDEX `fk_Professor_Departament1_idx` (`Departament_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Professor_Departament1`
    FOREIGN KEY (`Departament_ID`)
    REFERENCES `MER2C`.`Departament` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MER2C`.`Alumne`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER2C`.`Alumne` (
  `DNI` INT NULL,
  `Nom` VARCHAR(45) NOT NULL,
  `Cognoms` VARCHAR(100) NOT NULL,
  `Email` VARCHAR(100) NULL,
  `Telefon` INT(11) NULL,
  `Direccio` VARCHAR(45) NOT NULL,
  `Expedient` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Expedient`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MER2C`.`Matricula`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER2C`.`Matricula` (
  `Data` INT NOT NULL,
  `Alumne` VARCHAR(45) NOT NULL,
  `Asignatura` VARCHAR(45) NOT NULL,
  `Curs` VARCHAR(45) NOT NULL,
  `Alumne_Expedient` VARCHAR(45) NOT NULL,
  `Nivell` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Alumne`),
  INDEX `fk_Matricula_Alumne1_idx` (`Alumne_Expedient` ASC) VISIBLE,
  CONSTRAINT `fk_Matricula_Alumne1`
    FOREIGN KEY (`Alumne_Expedient`)
    REFERENCES `MER2C`.`Alumne` (`Expedient`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MER2C`.`Asignatura`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER2C`.`Asignatura` (
  `Nom` INT NOT NULL,
  `Credits` VARCHAR(45) NOT NULL,
  `Departament` VARCHAR(45) NOT NULL,
  `Professor` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Nom`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MER2C`.`Assignatura_Matricula`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER2C`.`Assignatura_Matricula` (
  `ID` INT NOT NULL,
  `Nom` VARCHAR(45) NOT NULL,
  `Aula` VARCHAR(45) NOT NULL,
  `Calendari` VARCHAR(45) NOT NULL,
  `Matricula_Alumne` VARCHAR(45) NOT NULL,
  `Asignatura_Nom` INT NOT NULL,
  `Professor_DNI` INT NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `fk_Assignatura_Matricula_Matricula1_idx` (`Matricula_Alumne` ASC) VISIBLE,
  INDEX `fk_Assignatura_Matricula_Asignatura1_idx` (`Asignatura_Nom` ASC) VISIBLE,
  INDEX `fk_Assignatura_Matricula_Professor1_idx` (`Professor_DNI` ASC) VISIBLE,
  CONSTRAINT `fk_Assignatura_Matricula_Matricula1`
    FOREIGN KEY (`Matricula_Alumne`)
    REFERENCES `MER2C`.`Matricula` (`Alumne`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Assignatura_Matricula_Asignatura1`
    FOREIGN KEY (`Asignatura_Nom`)
    REFERENCES `MER2C`.`Asignatura` (`Nom`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Assignatura_Matricula_Professor1`
    FOREIGN KEY (`Professor_DNI`)
    REFERENCES `MER2C`.`Professor` (`DNI`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

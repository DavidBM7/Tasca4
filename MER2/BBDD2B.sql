-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema MER2B
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema MER2B
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `MER2B` ;
USE `MER2B` ;

-- -----------------------------------------------------
-- Table `MER2B`.`Cine`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER2B`.`Cine` (
  `NIF` INT NOT NULL,
  `Nom` VARCHAR(45) NULL,
  `Ubicacio` VARCHAR(45) NULL,
  `NSales` VARCHAR(45) NULL,
  `Codi_Postal` VARCHAR(45) NULL,
  `Horari` VARCHAR(45) NULL,
  PRIMARY KEY (`NIF`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MER2B`.`Pelicules`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER2B`.`Pelicules` (
  `ISBN` INT NOT NULL,
  `Nom` VARCHAR(45) NULL,
  `Director` VARCHAR(45) NULL,
  `Protragonista` VARCHAR(45) NULL,
  `Actor_secundari` VARCHAR(45) NULL,
  `Duracio` VARCHAR(45) NULL,
  `Any` VARCHAR(45) NULL,
  PRIMARY KEY (`ISBN`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MER2B`.`Tarifa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER2B`.`Tarifa` (
  `ID` INT NOT NULL,
  `Nom` VARCHAR(45) NULL,
  `Preu` VARCHAR(45) NULL,
  `Descripcio` VARCHAR(45) NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MER2B`.`Projeccions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER2B`.`Projeccions` (
  `Sala` INT NOT NULL,
  `Hora_inici` VARCHAR(45) NULL,
  `Hora_fi` VARCHAR(45) NULL,
  `Cine_NIF` INT NOT NULL,
  `Pelicules_ISBN` INT NOT NULL,
  `Tarifa_ID` INT NOT NULL,
  INDEX `fk_Projeccions_Cine_idx` (`Cine_NIF` ASC) VISIBLE,
  INDEX `fk_Projeccions_Pelicules1_idx` (`Pelicules_ISBN` ASC) VISIBLE,
  INDEX `fk_Projeccions_Tarifa1_idx` (`Tarifa_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Projeccions_Cine`
    FOREIGN KEY (`Cine_NIF`)
    REFERENCES `MER2B`.`Cine` (`NIF`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Projeccions_Pelicules1`
    FOREIGN KEY (`Pelicules_ISBN`)
    REFERENCES `MER2B`.`Pelicules` (`ISBN`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Projeccions_Tarifa1`
    FOREIGN KEY (`Tarifa_ID`)
    REFERENCES `MER2B`.`Tarifa` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

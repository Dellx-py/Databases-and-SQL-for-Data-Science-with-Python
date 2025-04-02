-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema universitate
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema universitate
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `universitate` DEFAULT CHARACTER SET utf8 ;
USE `universitate` ;

-- -----------------------------------------------------
-- Table `universitate`.`adresa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `universitate`.`adresa` (
  `idadresa` INT NOT NULL AUTO_INCREMENT,
  `strada` VARCHAR(255) NOT NULL,
  `numar` INT NULL,
  `zip` VARCHAR(6) NULL,
  PRIMARY KEY (`idadresa`),
  UNIQUE INDEX `strada_UNIQUE` (`strada` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `universitate`.`cladire`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `universitate`.`cladire` (
  `idcladire` INT NOT NULL AUTO_INCREMENT,
  `etaje` INT NOT NULL DEFAULT '1',
  `denumire` VARCHAR(45) NULL,
  `adresa_idadresa` INT NOT NULL,
  PRIMARY KEY (`idcladire`),
  UNIQUE INDEX `denumire_UNIQUE` (`denumire` ASC) VISIBLE,
  INDEX `fk_cladire_adresa_idx` (`adresa_idadresa` ASC) VISIBLE,
  CONSTRAINT `fk_cladire_adresa`
    FOREIGN KEY (`adresa_idadresa`)
    REFERENCES `universitate`.`adresa` (`idadresa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `universitate`.`profesor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `universitate`.`profesor` (
  `idprofesor` INT NOT NULL AUTO_INCREMENT,
  `nume` VARCHAR(255) NOT NULL,
  `prenume` VARCHAR(255) NOT NULL,
  `adresa` INT NOT NULL,
  `data_nasterii` DATE NULL,
  `grad` ENUM('I', 'II', 'III') NULL DEFAULT '1',
  PRIMARY KEY (`idprofesor`),
  INDEX `adresa_foreign_key_idx` (`adresa` ASC) VISIBLE,
  CONSTRAINT `adresa_foreign_key`
    FOREIGN KEY (`adresa`)
    REFERENCES `universitate`.`adresa` (`idadresa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `universitate`.`student`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `universitate`.`student` (
  `idstudent` INT NOT NULL AUTO_INCREMENT,
  `nume` VARCHAR(255) NULL,
  `prenume` VARCHAR(255) NULL,
  `gen` ENUM('M', 'F') NULL,
  `an` INT NULL,
  `grupa` INT NULL,
  `bursa` INT NULL,
  `status` ENUM('restantier', 'bursier', 'admis') NOT NULL,
  PRIMARY KEY (`idstudent`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `universitate`.`curs`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `universitate`.`curs` (
  `idcurs` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(255) NULL,
  `an` INT NULL,
  `semestru` ENUM('I', 'II') NULL,
  `credite` INT NULL,
  PRIMARY KEY (`idcurs`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `universitate`.`predare`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `universitate`.`predare` (
  `profesor_idprofesor` INT NOT NULL,
  `curs_idcurs` INT NOT NULL,
  INDEX `fk_predare_profesor1_idx` (`profesor_idprofesor` ASC) VISIBLE,
  INDEX `fk_predare_curs1_idx` (`curs_idcurs` ASC) VISIBLE,
  PRIMARY KEY (`profesor_idprofesor`, `curs_idcurs`),
  CONSTRAINT `fk_predare_profesor1`
    FOREIGN KEY (`profesor_idprofesor`)
    REFERENCES `universitate`.`profesor` (`idprofesor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_predare_curs1`
    FOREIGN KEY (`curs_idcurs`)
    REFERENCES `universitate`.`curs` (`idcurs`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `universitate`.`nota`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `universitate`.`nota` (
  `idnote` INT NOT NULL AUTO_INCREMENT,
  `student_idstudent` INT NOT NULL,
  `curs_idcurs` INT NOT NULL,
  `valoare` INT NULL,
  `data_notare` DATE NULL,
  PRIMARY KEY (`idnote`),
  INDEX `fk_note_student1_idx` (`student_idstudent` ASC) VISIBLE,
  INDEX `fk_nota_curs1_idx` (`curs_idcurs` ASC) VISIBLE,
  CONSTRAINT `fk_note_student1`
    FOREIGN KEY (`student_idstudent`)
    REFERENCES `universitate`.`student` (`idstudent`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_nota_curs1`
    FOREIGN KEY (`curs_idcurs`)
    REFERENCES `universitate`.`curs` (`idcurs`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

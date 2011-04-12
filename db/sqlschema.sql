SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

CREATE SCHEMA IF NOT EXISTS `kafedra` DEFAULT CHARACTER SET utf8 ;
USE `kafedra` ;

-- -----------------------------------------------------
-- Table `kafedra`.`persons`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `kafedra`.`persons` (
  `person_id` INT NOT NULL AUTO_INCREMENT ,
  `last_name` VARCHAR(63) NOT NULL ,
  `first_name` VARCHAR(63) NOT NULL ,
  `patronymic_name` VARCHAR(63) NULL ,
  `birthday` DATE NULL ,
  `phone` VARCHAR(63) NULL ,
  `email` VARCHAR(63) NULL ,
  `nature` CHAR(1) NOT NULL ,
  `photo` VARCHAR(255) NULL ,
  PRIMARY KEY (`person_id`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `kafedra`.`specialities`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `kafedra`.`specialities` (
  `speciality_id` INT NOT NULL AUTO_INCREMENT ,
  `code` VARCHAR(63) NULL ,
  `name_speciality` VARCHAR(127) NULL ,
  `short_name` VARCHAR(63) NULL ,
  `count_years` INT NULL ,
  `in_diploma` VARCHAR(127) NULL ,
  PRIMARY KEY (`speciality_id`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `kafedra`.`students`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `kafedra`.`students` (
  `person_id` INT NOT NULL ,
  `course` INT NULL ,
  `info` TEXT NULL ,
  `year_income` INT NULL ,
  `speciality_id` INT NOT NULL ,
  PRIMARY KEY (`person_id`) ,
  INDEX `fk_students_specialities` (`speciality_id` ASC) ,
  CONSTRAINT `fk_students_persons`
    FOREIGN KEY (`person_id` )
    REFERENCES `kafedra`.`persons` (`person_id` )
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_students_specialities`
    FOREIGN KEY (`speciality_id` )
    REFERENCES `kafedra`.`specialities` (`speciality_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `kafedra`.`teachers`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `kafedra`.`teachers` (
  `person_id` INT NOT NULL ,
  `position` VARCHAR(63) NULL ,
  `degree` VARCHAR(127) NULL ,
  `info` TEXT NULL ,
  PRIMARY KEY (`person_id`) ,
  CONSTRAINT `fk_teachers_persons1`
    FOREIGN KEY (`person_id` )
    REFERENCES `kafedra`.`persons` (`person_id` )
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `kafedra`.`articles`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `kafedra`.`articles` (
  `article_id` INT NOT NULL AUTO_INCREMENT ,
  `title` VARCHAR(255) NOT NULL ,
  `text_article` TEXT NOT NULL ,
  `publicated_date` DATETIME NOT NULL ,
  `priority` INT NULL ,
  `image` VARCHAR(255) NULL ,
  PRIMARY KEY (`article_id`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `kafedra`.`disciplines`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `kafedra`.`disciplines` (
  `discipline_id` INT NOT NULL AUTO_INCREMENT ,
  `name_discipline` VARCHAR(127) NOT NULL ,
  PRIMARY KEY (`discipline_id`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `kafedra`.`urls`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `kafedra`.`urls` (
  `url_id` INT NOT NULL AUTO_INCREMENT ,
  `url_link` VARCHAR(255) NOT NULL ,
  `url_text` TEXT NULL ,
  PRIMARY KEY (`url_id`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `kafedra`.`diplomas`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `kafedra`.`diplomas` (
  `name_diploma` VARCHAR(255) NULL ,
  `protection_year` INT NULL )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `kafedra`.`contacts`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `kafedra`.`contacts` (
  `contact_id` INT NOT NULL AUTO_INCREMENT ,
  `address` VARCHAR(255) NULL ,
  `phones` VARCHAR(255) NULL ,
  `email` VARCHAR(255) NULL ,
  `url` VARCHAR(255) NULL ,
  `image` VARCHAR(255) NULL ,
  PRIMARY KEY (`contact_id`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `kafedra`.`histories`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `kafedra`.`histories` (
  `history_id` INT NOT NULL AUTO_INCREMENT ,
  `text_history` TEXT NOT NULL ,
  `image` VARCHAR(255) NULL ,
  PRIMARY KEY (`history_id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `kafedra`.`comments`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `kafedra`.`comments` (
  `comment_id` INT NOT NULL AUTO_INCREMENT ,
  `text_comment` TEXT NOT NULL ,
  `name_author` VARCHAR(63) NULL ,
  `email_author` VARCHAR(63) NULL ,
  PRIMARY KEY (`comment_id`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

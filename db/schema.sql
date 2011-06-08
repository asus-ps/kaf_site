SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

CREATE SCHEMA IF NOT EXISTS `kafedra` DEFAULT CHARACTER SET utf8 ;
USE `kafedra` ;

-- -----------------------------------------------------
-- Table `kafedra`.`people`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `kafedra`.`people` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `last_name` VARCHAR(63) NOT NULL ,
  `first_name` VARCHAR(63) NOT NULL ,
  `patronymic_name` VARCHAR(63) NOT NULL ,
  `birthday` DATE NOT NULL ,
  `phone` VARCHAR(63) NULL DEFAULT NULL ,
  `email` VARCHAR(63) NULL DEFAULT NULL ,
  `nature` CHAR(1) NOT NULL ,
  `info` TEXT NULL DEFAULT NULL ,
  `picture_ext` VARCHAR(15) NULL DEFAULT NULL ,
  `picture_name` VARCHAR(63) NULL DEFAULT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `kafedra`.`specialities`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `kafedra`.`specialities` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `code` VARCHAR(63) NOT NULL ,
  `name` VARCHAR(127) NOT NULL ,
  `short_name` VARCHAR(63) NULL ,
  `count_years` INT NOT NULL ,
  `in_diploma` VARCHAR(127) NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `kafedra`.`students`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `kafedra`.`students` (
  `person_id` INT NOT NULL ,
  `year_income` INT NOT NULL ,
  `speciality_id` INT NOT NULL ,
  INDEX `fk_students_persons1` (`person_id` ASC) ,
  INDEX `fk_students_specialities1` (`speciality_id` ASC) ,
  PRIMARY KEY (`person_id`) ,
  CONSTRAINT `fk_students_persons1`
    FOREIGN KEY (`person_id` )
    REFERENCES `kafedra`.`people` (`id` )
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_students_specialities1`
    FOREIGN KEY (`speciality_id` )
    REFERENCES `kafedra`.`specialities` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `kafedra`.`positions`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `kafedra`.`positions` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `name` VARCHAR(127) NOT NULL ,
  `short_name` VARCHAR(63) NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `kafedra`.`degrees`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `kafedra`.`degrees` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `name` VARCHAR(127) NOT NULL ,
  `short_name` VARCHAR(63) NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `kafedra`.`teachers`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `kafedra`.`teachers` (
  `person_id` INT NOT NULL ,
  `position_id` INT NOT NULL ,
  `degree_id` INT NOT NULL ,
  INDEX `fk_teachers_persons1` (`person_id` ASC) ,
  PRIMARY KEY (`person_id`) ,
  INDEX `fk_teachers_positions1` (`position_id` ASC) ,
  INDEX `fk_teachers_degrees1` (`degree_id` ASC) ,
  CONSTRAINT `fk_teachers_persons1`
    FOREIGN KEY (`person_id` )
    REFERENCES `kafedra`.`people` (`id` )
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_teachers_positions1`
    FOREIGN KEY (`position_id` )
    REFERENCES `kafedra`.`positions` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_teachers_degrees1`
    FOREIGN KEY (`degree_id` )
    REFERENCES `kafedra`.`degrees` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `kafedra`.`articles`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `kafedra`.`articles` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `title` VARCHAR(255) NOT NULL ,
  `body` TEXT NOT NULL ,
  `created_at` DATETIME NOT NULL ,
  `priority` INT NULL DEFAULT NULL ,
  `picture_ext` VARCHAR(15) NULL DEFAULT NULL ,
  `picture_name` VARCHAR(63) NULL DEFAULT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `kafedra`.`disciplines`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `kafedra`.`disciplines` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `name` VARCHAR(127) NOT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `kafedra`.`links`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `kafedra`.`links` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `url` VARCHAR(255) NOT NULL ,
  `description` TEXT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `kafedra`.`diplomas`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `kafedra`.`diplomas` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `name` VARCHAR(255) NOT NULL ,
  `protection_year` INT NOT NULL ,
  `summary` TEXT NULL ,
  `student_id` INT NOT NULL ,
  `teacher_id` INT NOT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_diplomas_students1` (`student_id` ASC) ,
  INDEX `fk_diplomas_teachers1` (`teacher_id` ASC) ,
  CONSTRAINT `fk_diplomas_students1`
    FOREIGN KEY (`student_id` )
    REFERENCES `kafedra`.`students` (`person_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_diplomas_teachers1`
    FOREIGN KEY (`teacher_id` )
    REFERENCES `kafedra`.`teachers` (`person_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `kafedra`.`contacts`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `kafedra`.`contacts` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `address` VARCHAR(255) NOT NULL ,
  `phones` VARCHAR(255) NOT NULL ,
  `email` VARCHAR(255) NULL DEFAULT NULL ,
  `url` VARCHAR(255) NULL DEFAULT NULL ,
  `picture_ext` VARCHAR(15) NULL DEFAULT NULL ,
  `picture_name` VARCHAR(63) NULL DEFAULT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `kafedra`.`histories`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `kafedra`.`histories` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `body` TEXT NOT NULL ,
  `picture_ext` VARCHAR(15) NULL DEFAULT NULL ,
  `picture_name` VARCHAR(63) NULL DEFAULT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `kafedra`.`comments`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `kafedra`.`comments` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `body` TEXT NOT NULL ,
  `author_name` VARCHAR(63) NOT NULL ,
  `author_email` VARCHAR(63) NOT NULL ,
  `created_at` DATETIME NOT NULL ,
  `article_id` INT NOT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_comments_articles1` (`article_id` ASC) ,
  CONSTRAINT `fk_comments_articles1`
    FOREIGN KEY (`article_id` )
    REFERENCES `kafedra`.`articles` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `kafedra`.`disciplines_teachers`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `kafedra`.`disciplines_teachers` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `discipline_id` INT NOT NULL ,
  `teacher_id` INT NOT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_teachers_disciplines_disciplines` (`discipline_id` ASC) ,
  INDEX `fk_disciplines_teachers_teachers1` (`teacher_id` ASC) ,
  CONSTRAINT `fk_teachers_disciplines_disciplines`
    FOREIGN KEY (`discipline_id` )
    REFERENCES `kafedra`.`disciplines` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_disciplines_teachers_teachers1`
    FOREIGN KEY (`teacher_id` )
    REFERENCES `kafedra`.`teachers` (`person_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;


INSERT INTO `positions` (id,name,short_name) VALUES (1,'Р·Р°РІРµРґСѓСЋС‰РёР№ РєР°С„РµРґСЂРѕР№','Р·Р°РІ. РєР°С„.');
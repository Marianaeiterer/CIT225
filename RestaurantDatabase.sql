-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema restaurant
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema restaurant
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `restaurant` DEFAULT CHARACTER SET utf8 ;
USE `restaurant` ;

-- -----------------------------------------------------
-- Table `restaurant`.`restaurant`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `restaurant`.`restaurant` (
  `restaurant_id` INT NOT NULL,
  `restaurant_name` VARCHAR(45) NOT NULL,
  `street_address` VARCHAR(45) NOT NULL,
  `city` VARCHAR(45) NOT NULL,
  `state` VARCHAR(45) NOT NULL,
  `country` VARCHAR(45) NOT NULL,
  `zip_code` VARCHAR(10) NOT NULL,
  `phone` VARCHAR(45) NOT NULL,
  `phone2` VARCHAR(45) NULL,
  `email` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`restaurant_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `restaurant`.`staff`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `restaurant`.`staff` (
  `staff_id` INT NOT NULL,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `street_address` VARCHAR(45) NOT NULL,
  `city` VARCHAR(45) NOT NULL,
  `state` VARCHAR(45) NOT NULL,
  `country` VARCHAR(45) NOT NULL,
  `zip_code` VARCHAR(10) NOT NULL,
  `phone` VARCHAR(45) NOT NULL,
  `active` TINYINT NOT NULL,
  PRIMARY KEY (`staff_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `restaurant`.`_table`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `restaurant`.`_table` (
  `table_id` INT NOT NULL,
  `chairs` INT NOT NULL,
  `section` ENUM('WINDOW', 'MIDDLE', 'COUNTER') NOT NULL,
  `status` ENUM('FREE', 'RESERVED', 'OCCUPIED') NULL,
  PRIMARY KEY (`table_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `restaurant`.`food_category`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `restaurant`.`food_category` (
  `food_id` INT NOT NULL,
  `food_category` ENUM('APPETIZERS', 'ENTREES', 'DESSERT') NOT NULL,
  PRIMARY KEY (`food_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `restaurant`.`food`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `restaurant`.`food` (
  `food_id` INT NOT NULL,
  `food_name` VARCHAR(45) NOT NULL,
  `food_description` VARCHAR(125) NULL,
  `food_category_id` INT NOT NULL,
  PRIMARY KEY (`food_id`),
  INDEX `fk_food_food_category1_idx` (`food_category_id` ASC) VISIBLE,
  CONSTRAINT `fk_food_food_category1`
    FOREIGN KEY (`food_category_id`)
    REFERENCES `restaurant`.`food_category` (`food_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `restaurant`.`restaurant_has_food`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `restaurant`.`restaurant_has_food` (
  `restaurant_id` INT NOT NULL,
  `food_id` INT NOT NULL,
  `food_price` DECIMAL(5,2) NOT NULL,
  PRIMARY KEY (`restaurant_id`, `food_id`),
  INDEX `fk_restaurant_has_food_food1_idx` (`food_id` ASC) VISIBLE,
  INDEX `fk_restaurant_has_food_restaurant1_idx` (`restaurant_id` ASC) VISIBLE,
  CONSTRAINT `fk_restaurant_has_food_restaurant1`
    FOREIGN KEY (`restaurant_id`)
    REFERENCES `restaurant`.`restaurant` (`restaurant_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_restaurant_has_food_food1`
    FOREIGN KEY (`food_id`)
    REFERENCES `restaurant`.`food` (`food_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `restaurant`.`beverage`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `restaurant`.`beverage` (
  `beverage_id` INT NOT NULL,
  `beverage_name` VARCHAR(45) NOT NULL,
  `beverage_description` VARCHAR(45) NULL,
  PRIMARY KEY (`beverage_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `restaurant`.`restaurant_has_beverage`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `restaurant`.`restaurant_has_beverage` (
  `restaurant_id` INT NOT NULL,
  `beverage_id` INT NOT NULL,
  `bevarage_price` DECIMAL(5,2) NOT NULL,
  PRIMARY KEY (`restaurant_id`, `beverage_id`),
  INDEX `fk_restaurant_has_beverage_beverage1_idx` (`beverage_id` ASC) VISIBLE,
  INDEX `fk_restaurant_has_beverage_restaurant1_idx` (`restaurant_id` ASC) VISIBLE,
  CONSTRAINT `fk_restaurant_has_beverage_restaurant1`
    FOREIGN KEY (`restaurant_id`)
    REFERENCES `restaurant`.`restaurant` (`restaurant_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_restaurant_has_beverage_beverage1`
    FOREIGN KEY (`beverage_id`)
    REFERENCES `restaurant`.`beverage` (`beverage_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `restaurant`.`restaurant_has_staff`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `restaurant`.`restaurant_has_staff` (
  `restaurant_id` INT NOT NULL,
  `staff_id` INT NOT NULL,
  PRIMARY KEY (`restaurant_id`, `staff_id`),
  INDEX `fk_restaurant_has_staff_staff1_idx` (`staff_id` ASC) VISIBLE,
  INDEX `fk_restaurant_has_staff_restaurant1_idx` (`restaurant_id` ASC) VISIBLE,
  CONSTRAINT `fk_restaurant_has_staff_restaurant1`
    FOREIGN KEY (`restaurant_id`)
    REFERENCES `restaurant`.`restaurant` (`restaurant_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_restaurant_has_staff_staff1`
    FOREIGN KEY (`staff_id`)
    REFERENCES `restaurant`.`staff` (`staff_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `restaurant`.`restaurant_has_table`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `restaurant`.`restaurant_has_table` (
  `restaurant_id` INT NOT NULL,
  `table_id` INT NOT NULL,
  PRIMARY KEY (`restaurant_id`, `table_id`),
  INDEX `fk_restaurant_has_table_table1_idx` (`table_id` ASC) VISIBLE,
  INDEX `fk_restaurant_has_table_restaurant1_idx` (`restaurant_id` ASC) VISIBLE,
  CONSTRAINT `fk_restaurant_has_table_restaurant1`
    FOREIGN KEY (`restaurant_id`)
    REFERENCES `restaurant`.`restaurant` (`restaurant_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_restaurant_has_table_table1`
    FOREIGN KEY (`table_id`)
    REFERENCES `restaurant`.`_table` (`table_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

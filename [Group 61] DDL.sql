-- MySQL Workbench Forward Engineering

-- Project 61
-- Haley Leavitt & Kenny Igbechi
 

SET FOREIGN_KEY_CHECKS=0;

-- -----------------------------------------------------
-- Schema PlanetFitness
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema PlanetFitness
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `PlanetFitness` DEFAULT CHARACTER SET utf8 ;
USE `PlanetFitness` ;

-- -----------------------------------------------------
-- Table `PlanetFitness`.`Customers`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `PlanetFitness`.`Customers` ;

CREATE TABLE IF NOT EXISTS `PlanetFitness`.`Customers` (
  `customerID` INT NOT NULL AUTO_INCREMENT,
  `fname` VARCHAR(50) NOT NULL,
  `lname` VARCHAR(50) NOT NULL,
  `pronouns` VARCHAR(20) NOT NULL,
  `age` INT NOT NULL,
  `customerAddress` VARCHAR(100) NOT NULL,
  `email` VARCHAR(50) NOT NULL,
  `membershipType` VARCHAR(20) NOT NULL,
  `hasActiveMembership` TINYINT NOT NULL,
  PRIMARY KEY (`customerID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PlanetFitness`.`Trainers`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `PlanetFitness`.`Trainers` ;

CREATE TABLE IF NOT EXISTS `PlanetFitness`.`Trainers` (
  `trainerID` INT NOT NULL AUTO_INCREMENT,
  `trainerName` VARCHAR(50) NOT NULL,
  `salary` DECIMAL(10,2) NOT NULL,
  `email` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`trainerID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PlanetFitness`.`Locations`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `PlanetFitness`.`Locations` ;

CREATE TABLE IF NOT EXISTS `PlanetFitness`.`Locations` (
  `locationID` INT NOT NULL AUTO_INCREMENT,
  `locationAddress` VARCHAR(100) NOT NULL,
  `manager` VARCHAR(50) NULL,
  PRIMARY KEY (`locationID`),
  UNIQUE INDEX `locationAddress_UNIQUE` (`locationAddress` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PlanetFitness`.`Schedules`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `PlanetFitness`.`Schedules` ;

CREATE TABLE IF NOT EXISTS `PlanetFitness`.`Schedules` (
  `scheduleID` INT NOT NULL AUTO_INCREMENT,
  `trainerID` INT NOT NULL,
  `activity` VARCHAR(50) NOT NULL,
  `activityDays` VARCHAR(50) NOT NULL,
  `startTime` TIME NOT NULL,
  `duration` VARCHAR(50) NULL,
  `locationID` INT NOT NULL,
  PRIMARY KEY (`scheduleID`, `trainerID`, `locationID`),
  INDEX `fk_Schedules_Trainers1_idx` (`trainerID` ASC) ,
  INDEX `fk_Schedules_Locations1_idx` (`locationID` ASC) ,
  CONSTRAINT `fk_Schedules_Trainers1`
    FOREIGN KEY (`trainerID`)
    REFERENCES `PlanetFitness`.`Trainers` (`trainerID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Schedules_Locations1`
    FOREIGN KEY (`locationID`)
    REFERENCES `PlanetFitness`.`Locations` (`locationID`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PlanetFitness`.`Equipment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `PlanetFitness`.`Equipment` ;

CREATE TABLE IF NOT EXISTS `PlanetFitness`.`Equipment` (
  `equipmentID` INT NOT NULL AUTO_INCREMENT,
  `equipmentType` VARCHAR(250) NOT NULL,
  `equipmentName` VARCHAR(250) NOT NULL,
  PRIMARY KEY (`equipmentID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PlanetFitness`.`Transactions`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `PlanetFitness`.`Transactions` ;

CREATE TABLE IF NOT EXISTS `PlanetFitness`.`Transactions` (
  `transactionID` INT NOT NULL AUTO_INCREMENT,
  `CustomerID` INT NOT NULL,
  `amount` DECIMAL(12,5) NOT NULL,
  `transactionDate` DATETIME NOT NULL,
  PRIMARY KEY (`transactionID`, `CustomerID`),
  INDEX `fk_transactions_Customer1_idx` (`CustomerID` ASC) ,
  CONSTRAINT `fk_transactions_Customer1`
    FOREIGN KEY (`CustomerID`)
    REFERENCES `PlanetFitness`.`Customers` (`customerID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PlanetFitness`.`Inventory`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `PlanetFitness`.`Inventory` ;

CREATE TABLE IF NOT EXISTS `PlanetFitness`.`Inventory` (
  `locationID` INT NOT NULL,
  `equipmentID` INT NOT NULL,
  `equipmentQuantity` INT(12) NULL,
  PRIMARY KEY (`locationID`, `equipmentID`),
  INDEX `fk_Locations_has_Equipment_Equipment1_idx` (`equipmentID` ASC) ,
  INDEX `fk_Locations_has_Equipment_Locations1_idx` (`locationID` ASC) ,
  CONSTRAINT `fk_Locations_has_Equipment_Locations1`
    FOREIGN KEY (`locationID`)
    REFERENCES `PlanetFitness`.`Locations` (`locationID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Locations_has_Equipment_Equipment1`
    FOREIGN KEY (`equipmentID`)
    REFERENCES `PlanetFitness`.`Equipment` (`equipmentID`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;





insert into Customers (fname, lname, email, customerAddress, pronouns, age, membershipType, hasActiveMembership)
values ('Zed', 'Dudin', 'zdudin0@marketwatch.com', '11864 Dayton Park', 'Male', 21, 'Executive', false),
       ('Verina', 'Gilardoni', 'vgilardoni1@sogou.com', '83 Hanson Point', 'Female', 21, 'Basic', true),
       ('Yorgos', 'Quilliam', 'yquilliam2@dedecms.com', '798 Paget Road', 'Male', 21, 'Basic', false),
       ('Urbain', 'Casbon', 'ucasbon3@macromedia.com', '1 Moose Avenue', 'Male', 22, 'Pro', true),
       ('Marsh', 'Alderson', 'malderson4@spiegel.de', '371 Hermina Avenue', 'Male', 22, 'Basic', false),
       ('Ilysa', 'Croutear', 'icroutear5@myspace.com', '37 Clove Avenue', 'Non-binary', 23, 'Pro', true),
       ('Aldin', 'Dunbleton', 'adunbleton6@uol.com.br', '2 Kennedy Drive', 'Male', 23, 'Executive', true),
       ('Pam', 'Pettengell', 'ppettengell7@japanpost.jp', '79744 Arizona Avenue', 'Female', 23, 'Pro', false),
       ('Faulkner', 'Strettle', 'fstrettle8@ihg.com', '9505 Everett Circle', 'Polygender', 24, 'Executive', true),
       ('Tamar', 'Cokayne', 'tcokayne9@php.net', '4669 Burning Wood Crossing', 'Polygender', 24, 'Executive', true),
       ('Angelo', 'Kulver', 'akulvera@odnoklassniki.ru', '1457 Rowland Park', 'Male', 25, 'Pro', false),
       ('Iggy', 'Cranna', 'icrannab@163.com', '259 Columbus Parkway', 'Male', 25, 'Executive', false),
       ('Vitoria', 'Keel', 'vkeelc@soup.io', '51 Declaration Terrace', 'Female', 25, 'Basic', true),
       ('Tawsha', 'Greader', 'tgreaderd@unesco.org', '4 Stang Crossing', 'Polygender', 26, 'Pro', true),
       ('Jeramie', 'Abramovici', 'jabramovicie@phoca.cz', '09 Burrows Court', 'Male', 26, 'Pro', false),
       ('Ross', 'Keenleyside', 'rkeenleysidef@barnesandnoble.com', '92 Reindahl Place', 'Male', 27, 'Pro', false),
       ('Selestina', 'Nisius', 'snisiusg@whitehouse.gov', '22 New Castle Park', 'Female', 27, 'Executive', true),
       ('Magdalena', 'Winspar', 'mwinsparh@comcast.net', '00012 Center Plaza', 'Female', 27, 'Pro', true),
       ('Carry', 'Walter', 'cwalteri@posterous.com', '859 Havey Drive', 'Female', 28, 'Basic', false),
       ('Nike', 'Algeo', 'nalgeoj@nature.com', '20 Bunker Hill Center', 'Female', 28, 'Pro', false);


insert into Trainers (trainerName, salary, email)
values ('Rosamond Croshaw', 3500, 'rcroshaw0@ustream.tv'),
       ('Ingmar Joannet', 3500, 'ijoannet1@guardian.co.uk'),
       ('Jehu Whiteley', 3500, 'jwhiteley2@creativecommons.org'),
       ('Clive Nossent', 3500, 'cnossent3@people.com.cn'),
       ('Bartholomew Terrelly', 3500, 'bterrelly4@biblegateway.com'),
       ('Farrell Blackhurst', 3500, 'fblackhurst5@phoca.cz');

insert into Locations (locationAddress, manager)
values ('0 Browning Street', 'Thain Edens'),
       ('6165 Acker Point', 'Pamelina Klemmt'),
       ('43 Michigan Crossing', 'Loree Littell'),
       ('14216 Monica Way', 'Nial Bleackly');


insert into Schedules (trainerID, activity, activityDays, startTime, duration, locationID)
values (1, 'Dance Class', 'Tuesday', '7:59', '2 Hours', 1),
        (2, 'Swimming', 'Saturday', '7:18', '2 Hours', 2),
        (3, 'Arms', 'Saturday', '7:54', '2 Hours', 3),
       (4, 'Dance Class', 'Wednessday & Thursday', '7:08', '2 Hours', 4);

insert into Equipment (equipmentType, equipmentName)
values ('Squat rack', 'Fitness Gear Pro Half Rack'),
       ('Barbells', 'Rogue'),
       ('Cables and pulleys', 'Weights'),
       ('Dumbbells', 'Weider Rubber Hex Dumbbell'),
       ('Squat rack', 'Fitness Gear Pro Half Rack'),
       ('Barbells', 'Rogue'),
       ('Cables and pulleys', 'Weights'),
       ('Dumbbells', 'Weider Rubber Hex Dumbbell');


insert into Transactions (CustomerID, amount, transactionDate)
values (1, 329.115, '2022-05-08 02:33:30'),
       (2, 381.737, '2022-09-25 03:05:46'),
       (3, 421.982, '2022-03-11 07:01:37'),
       (4, 227.817, '2022-05-18 18:00:05'),
       (5, 338.84, '2021-08-06 23:24:53'),
       (6, 442.715, '2022-06-20 17:43:25'),
       (7, 487.925, '2021-12-04 01:59:49'),
       (8, 223.566, '2022-08-01 01:04:24'),
       (9, 265.51, '2022-04-17 17:46:10'),
       (10, 247.284, '2022-05-08 09:22:27'),
       (2, 381.737, '2022-09-25 03:05:46'),
       (3, 421.982, '2022-03-11 07:01:37'),
       (4, 227.817, '2022-05-18 18:00:05'),
       (5, 338.84, '2021-08-06 23:24:53'),
       (6, 442.715, '2022-06-20 17:43:25'),
       (3, 421.982, '2022-03-11 07:01:37'),
       (4, 227.817, '2022-05-18 18:00:05'),
       (5, 338.84, '2021-08-06 23:24:53'),
       (6, 442.715, '2022-06-20 17:43:25'),
       (7, 487.925, '2021-12-04 01:59:49'),
       (8, 223.566, '2022-08-01 01:04:24'),
       (9, 265.51, '2022-04-17 17:46:10'),
       (10, 247.284, '2022-05-08 09:22:27');


insert into Inventory (locationID, equipmentID, equipmentQuantity)
values (5, 1, 9),
       (5, 10, 6),
       (4, 18, 14),
       (2, 11, 5),
       (5, 13, 2),
       (3, 19, 6),
       (3, 1, 9),
       (4, 19, 7),
       (5, 20, 7),
       (1, 15, 10);
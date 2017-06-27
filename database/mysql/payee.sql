-- MySQL Script generated by MySQL Workbench
-- Tue Jun 27 10:43:01 2017
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema payee
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `payee` ;

-- -----------------------------------------------------
-- Schema payee
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `payee` DEFAULT CHARACTER SET utf8mb4 ;
USE `payee` ;

-- -----------------------------------------------------
-- Table `payee`.`od_pay`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `payee`.`od_pay` ;

CREATE TABLE IF NOT EXISTS `payee`.`od_pay` (
  `pay_no` BIGINT UNSIGNED NOT NULL COMMENT 'payee internal payNo',
  `pay_status` TINYINT UNSIGNED NOT NULL DEFAULT 0 COMMENT 'pay status ',
  `pay_type` INT NULL COMMENT '',
  `pay_amount` DECIMAL(18,6) NULL COMMENT '',
  `pay_start_time` DATETIME NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'paying time',
  `pay_end_time` DATETIME NULL COMMENT 'payed time',
  `group_no` BIGINT NULL COMMENT '',
  `order_no` VARCHAR(64) NULL COMMENT 'external orderNo',
  `order_amount` DECIMAL(18,6) NULL COMMENT '',
  `currency` VARCHAR(6) NULL DEFAULT 'CNY' COMMENT '',
  `order_name` VARCHAR(45) NULL COMMENT '',
  `order_time` DATETIME NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'order created time',
  `account_id` BIGINT UNSIGNED NULL COMMENT 'accountId payed',
  `pay_id` BIGINT NULL COMMENT '',
  `create_time` DATETIME NULL DEFAULT CURRENT_TIMESTAMP COMMENT '',
  `update_time` DATETIME NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '',
  `is_delete` TINYINT NULL DEFAULT 0 COMMENT '',
  PRIMARY KEY (`pay_no`)  COMMENT '')
ENGINE = InnoDB
COMMENT = 'atomic basic order data' PARTITION BY RANGE() PARTITIONS 1() ;


-- -----------------------------------------------------
-- Table `payee`.`od_detail`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `payee`.`od_detail` ;

CREATE TABLE IF NOT EXISTS `payee`.`od_detail` (
  `detail_no` BIGINT NOT NULL COMMENT '',
  `pay_no` BIGINT NULL COMMENT '',
  `detail_type` INT NULL COMMENT '',
  `detail_name` VARCHAR(45) NULL COMMENT '',
  `detail_amount` DECIMAL(18,6) NULL DEFAULT 0 COMMENT '',
  `account_out` BIGINT UNSIGNED NULL COMMENT 'accountId payed',
  `account_rec` BIGINT UNSIGNED NULL COMMENT 'accountId received amount ',
  `create_time` DATETIME NULL DEFAULT CURRENT_TIMESTAMP COMMENT '',
  `update_time` DATETIME NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '',
  `is_delete` TINYINT NULL DEFAULT 0 COMMENT '',
  PRIMARY KEY (`detail_no`)  COMMENT '',
  INDEX `pay_no` (`pay_no` ASC)  COMMENT '')
ENGINE = InnoDB
COMMENT = 'order detail';


-- -----------------------------------------------------
-- Table `payee`.`od_group`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `payee`.`od_group` ;

CREATE TABLE IF NOT EXISTS `payee`.`od_group` (
  `group_no` BIGINT UNSIGNED NOT NULL COMMENT '',
  `group_name` VARCHAR(45) NULL COMMENT '',
  `pay_no` BIGINT NULL COMMENT '',
  `create_time` DATETIME NULL DEFAULT CURRENT_TIMESTAMP COMMENT '',
  `update_time` DATETIME NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '',
  `is_delete` TINYINT NULL DEFAULT 0 COMMENT '',
  PRIMARY KEY (`group_no`)  COMMENT '')
ENGINE = InnoDB
COMMENT = 'group paying feature';


-- -----------------------------------------------------
-- Table `payee`.`acc_info`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `payee`.`acc_info` ;

CREATE TABLE IF NOT EXISTS `payee`.`acc_info` (
  `account_id` BIGINT UNSIGNED NOT NULL COMMENT '',
  `name` VARCHAR(45) NULL COMMENT '',
  `amount` DECIMAL(18,6) NULL DEFAULT 0 COMMENT 'total amount',
  `frozen` DECIMAL(18,6) NULL DEFAULT 0 COMMENT 'frozen amount',
  `status` INT UNSIGNED NULL DEFAULT 0 COMMENT '账户状态',
  `create_time` DATETIME NULL DEFAULT CURRENT_TIMESTAMP COMMENT '',
  `update_time` DATETIME NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '',
  `is_delete` TINYINT NULL DEFAULT 0 COMMENT '',
  PRIMARY KEY (`account_id`)  COMMENT '')
ENGINE = InnoDB
COMMENT = 'account information';


-- -----------------------------------------------------
-- Table `payee`.`usr_info`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `payee`.`usr_info` ;

CREATE TABLE IF NOT EXISTS `payee`.`usr_info` (
  `usr_id` BIGINT UNSIGNED NOT NULL COMMENT '',
  `name` VARCHAR(45) NULL COMMENT '',
  `nickname` VARCHAR(45) NULL COMMENT '',
  `mobile` VARCHAR(45) NULL COMMENT '',
  `phone` VARCHAR(45) NULL COMMENT 'fixed phone',
  `email` VARCHAR(45) NULL COMMENT '',
  `sex` TINYINT NULL DEFAULT 0 COMMENT '0-unknown 1-man 2-woman',
  `birthday` DATETIME NULL COMMENT '',
  `passwd` VARCHAR(255) NULL COMMENT '',
  `register_time` DATETIME NULL DEFAULT CURRENT_TIMESTAMP COMMENT '',
  `usr_ext` VARCHAR(10) NULL COMMENT 'wechat ali',
  `parent_id` BIGINT NULL COMMENT 'parent usrid',
  `create_time` DATETIME NULL DEFAULT CURRENT_TIMESTAMP COMMENT '',
  `update_time` DATETIME NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '',
  `is_delete` TINYINT NULL DEFAULT 0 COMMENT '',
  PRIMARY KEY (`usr_id`)  COMMENT '',
  INDEX `parent_id` (`parent_id` ASC)  COMMENT '')
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `payee`.`acc_flow`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `payee`.`acc_flow` ;

CREATE TABLE IF NOT EXISTS `payee`.`acc_flow` (
  `flow_no` BIGINT UNSIGNED NOT NULL COMMENT '',
  `account_id` BIGINT NOT NULL COMMENT '',
  `flow_status` TINYINT UNSIGNED NULL COMMENT '',
  `flow_type` INT UNSIGNED NULL DEFAULT 0 COMMENT '',
  `flow_time` DATETIME NOT NULL COMMENT 'finished time',
  `pay_no` BIGINT NULL COMMENT '',
  `pay_amount` DECIMAL(18,6) NULL DEFAULT 0 COMMENT '',
  `order_no` VARCHAR(64) NULL COMMENT '',
  `create_time` DATETIME NULL DEFAULT CURRENT_TIMESTAMP COMMENT '',
  `update_time` DATETIME NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '',
  `is_delete` TINYINT NULL DEFAULT 0 COMMENT '',
  PRIMARY KEY (`flow_no`)  COMMENT '',
  INDEX `account_id` (`account_id` ASC)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `payee`.`usr_ext_wechat`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `payee`.`usr_ext_wechat` ;

CREATE TABLE IF NOT EXISTS `payee`.`usr_ext_wechat` (
  `id` BIGINT NOT NULL COMMENT '',
  `usr_id` BIGINT NOT NULL COMMENT '',
  `appid` VARCHAR(45) NULL DEFAULT NULL COMMENT '公众号ip',
  `unionid` VARCHAR(45) NULL DEFAULT NULL COMMENT '唯一标识',
  `openid` VARCHAR(45) NULL DEFAULT NULL COMMENT '用户标识',
  `nickname` VARCHAR(20) NULL DEFAULT NULL COMMENT '昵称',
  `language` VARCHAR(10) NULL DEFAULT NULL COMMENT '',
  `sex` TINYINT(4) NULL DEFAULT '0' COMMENT '性别',
  `city` VARCHAR(10) NULL DEFAULT NULL COMMENT '',
  `country` VARCHAR(45) NULL DEFAULT NULL COMMENT '',
  `province` VARCHAR(45) NULL DEFAULT NULL COMMENT '',
  `headimgurl` VARCHAR(255) NULL DEFAULT NULL COMMENT '',
  `create_time` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP COMMENT '',
  `hash_appopenid` INT(11) NULL COMMENT '',
  `update_time` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '',
  `is_delete` TINYINT(4) NULL DEFAULT '0' COMMENT '0-valid 1-deleted',
  PRIMARY KEY (`id`)  COMMENT '',
  UNIQUE INDEX `unionid_UNIQUE` (`unionid` ASC)  COMMENT '',
  INDEX `hash_appopenid` (`hash_appopenid` ASC)  COMMENT '')
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COMMENT = 'usr wechat info';


-- -----------------------------------------------------
-- Table `payee`.`usr_online`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `payee`.`usr_online` ;

CREATE TABLE IF NOT EXISTS `payee`.`usr_online` (
  `usr_id` BIGINT UNSIGNED NOT NULL COMMENT '',
  `status` TINYINT NOT NULL DEFAULT 0 COMMENT '0-online 1-offline',
  `login_time` DATETIME NULL COMMENT '',
  `logout_time` DATETIME NULL COMMENT '',
  `ip` VARCHAR(30) NULL COMMENT '',
  `language` VARCHAR(45) NULL COMMENT '',
  `browser` VARCHAR(255) NULL COMMENT 'user-agent',
  `dev_id` VARCHAR(45) NULL COMMENT '',
  `dev_os` VARCHAR(45) NULL COMMENT '',
  `dev_token` VARCHAR(255) NULL COMMENT '',
  `lon` DOUBLE NULL COMMENT '',
  `lat` DOUBLE NULL COMMENT '',
  `create_time` DATETIME NULL DEFAULT CURRENT_TIMESTAMP COMMENT '',
  `update_time` DATETIME NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '',
  `is_delete` TINYINT NULL DEFAULT 0 COMMENT '',
  PRIMARY KEY (`usr_id`)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `payee`.`usr_online_log`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `payee`.`usr_online_log` ;

CREATE TABLE IF NOT EXISTS `payee`.`usr_online_log` (
  `id` BIGINT NOT NULL AUTO_INCREMENT COMMENT '',
  `status` TINYINT NOT NULL DEFAULT 0 COMMENT '0-online 1-offline',
  `time` DATETIME NULL COMMENT 'login or logout time',
  `ip` VARCHAR(30) NULL COMMENT '',
  `language` VARCHAR(45) NULL COMMENT '',
  `dev_id` VARCHAR(45) NULL COMMENT '',
  `browser` VARCHAR(255) NULL COMMENT 'user-agent',
  `dev_os` VARCHAR(45) NULL COMMENT '',
  `dev_token` VARCHAR(255) NULL COMMENT '',
  `lon` DOUBLE NULL COMMENT '',
  `lat` DOUBLE NULL COMMENT '',
  `create_time` DATETIME NULL DEFAULT CURRENT_TIMESTAMP COMMENT '',
  `update_time` DATETIME NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '',
  `is_delete` TINYINT NULL DEFAULT 0 COMMENT '',
  PRIMARY KEY (`id`)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `payee`.`cnf_pay_company`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `payee`.`cnf_pay_company` ;

CREATE TABLE IF NOT EXISTS `payee`.`cnf_pay_company` (
  `company_id` BIGINT UNSIGNED NOT NULL COMMENT '',
  `name` VARCHAR(45) NULL COMMENT '',
  `desc` VARCHAR(45) NULL DEFAULT NULL COMMENT '',
  `create_time` DATETIME NULL DEFAULT CURRENT_TIMESTAMP COMMENT '',
  `update_time` DATETIME NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '',
  `is_delete` TINYINT(4) NULL DEFAULT '0' COMMENT '',
  PRIMARY KEY (`company_id`)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `payee`.`usr_acc`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `payee`.`usr_acc` ;

CREATE TABLE IF NOT EXISTS `payee`.`usr_acc` (
  `id` BIGINT NOT NULL AUTO_INCREMENT COMMENT '',
  `usr_id` BIGINT NOT NULL COMMENT '',
  `account_id` BIGINT NOT NULL COMMENT '',
  `create_time` DATETIME NULL DEFAULT CURRENT_TIMESTAMP COMMENT '',
  `update_time` DATETIME NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '',
  `is_delete` TINYINT NULL DEFAULT 0 COMMENT '',
  PRIMARY KEY (`id`)  COMMENT '',
  INDEX `usr_id` (`usr_id` ASC)  COMMENT '')
ENGINE = InnoDB
COMMENT = 'usr account';


-- -----------------------------------------------------
-- Table `payee`.`cnf_pay_scene`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `payee`.`cnf_pay_scene` ;

CREATE TABLE IF NOT EXISTS `payee`.`cnf_pay_scene` (
  `scene_id` BIGINT UNSIGNED NOT NULL COMMENT 'company id',
  `name` VARCHAR(45) NULL DEFAULT NULL COMMENT 'scene name\n',
  `desc` VARCHAR(45) NULL DEFAULT NULL COMMENT '',
  `pay_id` BIGINT NOT NULL COMMENT '',
  `company_id` BIGINT NOT NULL COMMENT '',
  `create_time` DATETIME NULL DEFAULT CURRENT_TIMESTAMP COMMENT '',
  `update_time` DATETIME NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '',
  `is_delete` TINYINT(4) NULL DEFAULT 0 COMMENT '',
  PRIMARY KEY (`scene_id`)  COMMENT '',
  INDEX `company_id` (`company_id` ASC)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `payee`.`cnf_pay`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `payee`.`cnf_pay` ;

CREATE TABLE IF NOT EXISTS `payee`.`cnf_pay` (
  `pay_id` BIGINT UNSIGNED NOT NULL COMMENT '',
  `name` VARCHAR(45) NULL COMMENT '',
  `desc` VARCHAR(45) NULL COMMENT '',
  `data` TEXT NULL COMMENT 'pay config data',
  `template_id` INT NULL COMMENT '',
  `create_time` DATETIME NULL DEFAULT CURRENT_TIMESTAMP COMMENT '',
  `update_time` DATETIME NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '',
  `is_delete` TINYINT(4) NULL DEFAULT '0' COMMENT '',
  PRIMARY KEY (`pay_id`)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `payee`.`cnf_pay_template`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `payee`.`cnf_pay_template` ;

CREATE TABLE IF NOT EXISTS `payee`.`cnf_pay_template` (
  `template_id` INT UNSIGNED NOT NULL COMMENT '',
  `type` INT NULL COMMENT '',
  `name` VARCHAR(45) NULL COMMENT '',
  `data` TEXT NULL COMMENT '',
  `create_time` DATETIME NULL DEFAULT CURRENT_TIMESTAMP COMMENT '',
  `update_time` DATETIME NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '',
  `is_delete` TINYINT(4) NULL DEFAULT '0' COMMENT '',
  PRIMARY KEY (`template_id`)  COMMENT '')
ENGINE = InnoDB;

SET SQL_MODE = '';
GRANT USAGE ON *.* TO payee;
 DROP USER payee;
SET SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';
CREATE USER 'payee' IDENTIFIED BY 'payee2017';

GRANT ALL ON `payee`.* TO 'payee';

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

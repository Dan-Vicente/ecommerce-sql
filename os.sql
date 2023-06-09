-- MySQL Script generated by MySQL Workbench
-- sex 17 mar 2023 10:18:25
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Ordem de serviço`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Ordem de serviço` (
  `idOrdem de serviço` INT NOT NULL,
  `Status da os` VARCHAR(45) NULL,
  PRIMARY KEY (`idOrdem de serviço`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Pedidos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Pedidos` (
  `idPedidos` INT NOT NULL,
  `serviços` VARCHAR(45) NULL,
  `Descrição` VARCHAR(45) NULL,
  `Data da solicitação` DATETIME NULL,
  `Liberado` TINYINT NULL,
  `Ordem de serviço_idOrdem de serviço` INT NOT NULL,
  PRIMARY KEY (`idPedidos`, `Ordem de serviço_idOrdem de serviço`),
  INDEX `fk_Pedidos_Ordem de serviço1_idx` (`Ordem de serviço_idOrdem de serviço` ASC) VISIBLE,
  CONSTRAINT `fk_Pedidos_Ordem de serviço1`
    FOREIGN KEY (`Ordem de serviço_idOrdem de serviço`)
    REFERENCES `mydb`.`Ordem de serviço` (`idOrdem de serviço`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Cliente` (
  `idCliente` INT NOT NULL,
  `Nome` VARCHAR(45) NULL,
  `Cpf` VARCHAR(45) NULL,
  `Pedidos_idPedidos1` INT NOT NULL,
  PRIMARY KEY (`idCliente`),
  INDEX `fk_Cliente_Pedidos1_idx` (`Pedidos_idPedidos1` ASC) VISIBLE,
  CONSTRAINT `fk_Cliente_Pedidos1`
    FOREIGN KEY (`Pedidos_idPedidos1`)
    REFERENCES `mydb`.`Pedidos` (`idPedidos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Analise do pedido`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Analise do pedido` (
  `Responsável_idResponsável` INT NOT NULL,
  `Pedido_idpedido` INT NULL,
  `` INT NULL,
  `Pedidos_idPedidos` INT NOT NULL,
  PRIMARY KEY (`Responsável_idResponsável`),
  INDEX `fk_Analise do pedido_Pedidos1_idx` (`Pedidos_idPedidos` ASC) VISIBLE,
  CONSTRAINT `fk_Analise do pedido_Pedidos1`
    FOREIGN KEY (`Pedidos_idPedidos`)
    REFERENCES `mydb`.`Pedidos` (`idPedidos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Responsável`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Responsável` (
  `idResponsável` INT NOT NULL,
  `Nívelhelpdesk` INT NULL,
  `Nome` VARCHAR(45) NULL,
  `Departamento` VARCHAR(45) NULL,
  `Analise do pedido_Responsável_idResponsável` INT NOT NULL,
  PRIMARY KEY (`idResponsável`),
  INDEX `fk_Responsável_Analise do pedido1_idx` (`Analise do pedido_Responsável_idResponsável` ASC) VISIBLE,
  CONSTRAINT `fk_Responsável_Analise do pedido1`
    FOREIGN KEY (`Analise do pedido_Responsável_idResponsável`)
    REFERENCES `mydb`.`Analise do pedido` (`Responsável_idResponsável`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

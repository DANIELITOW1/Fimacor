-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema FIMACOR
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema FIMACOR
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `FIMACOR` DEFAULT CHARACTER SET utf8 ;
USE `FIMACOR` ;

-- -----------------------------------------------------
-- Table `FIMACOR`.`Estado_de_Maquina`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `FIMACOR`.`Estado_de_Maquina` (
  `idEstado_de_Maquina` INT NOT NULL,
  `nombre_tipo` VARCHAR(45) NOT NULL,
  `descripcion_estado` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idEstado_de_Maquina`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `FIMACOR`.`Tipo_Maquina`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `FIMACOR`.`Tipo_Maquina` (
  `idTipo_Maquina` INT NOT NULL,
  `descripcion_maquina` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idTipo_Maquina`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `FIMACOR`.`Reubicacion_Maquina`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `FIMACOR`.`Reubicacion_Maquina` (
  `idRehubicacion_Maquina` INT NOT NULL AUTO_INCREMENT,
  `fecha` VARCHAR(45) NOT NULL,
  `ambiente` VARCHAR(45) NOT NULL,
  `descripcion_rehubicacion` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idRehubicacion_Maquina`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `FIMACOR`.`Ubicacion_Maquina`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `FIMACOR`.`Ubicacion_Maquina` (
  `idUbicacion_Maquina` INT NOT NULL AUTO_INCREMENT,
  `Fecha` VARCHAR(45) NOT NULL,
  `Ambiente` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idUbicacion_Maquina`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `FIMACOR`.`Ambientes_Aprendizaje`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `FIMACOR`.`Ambientes_Aprendizaje` (
  `idAmbientes_de_aprendizaje` INT NOT NULL,
  `descripcion_ambiente` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idAmbientes_de_aprendizaje`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `FIMACOR`.`Modelo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `FIMACOR`.`Modelo` (
  `idModelo` INT NOT NULL AUTO_INCREMENT,
  `descripcion_modelo` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idModelo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `FIMACOR`.`Marca`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `FIMACOR`.`Marca` (
  `idMarca` INT NOT NULL AUTO_INCREMENT,
  `descripcion_marca` VARCHAR(45) NOT NULL,
  `Modelo_idModelo` INT NOT NULL,
  PRIMARY KEY (`idMarca`),
  INDEX `fk_Marca_Modelo1_idx` (`Modelo_idModelo` ASC) ,
  CONSTRAINT `fk_Marca_Modelo1`
    FOREIGN KEY (`Modelo_idModelo`)
    REFERENCES `FIMACOR`.`Modelo` (`idModelo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `FIMACOR`.`Ficha_Maquina`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `FIMACOR`.`Ficha_Maquina` (
  `idMaquinas` INT NOT NULL,
  `descripcion` VARCHAR(45) NOT NULL,
  `informacion_adicional` VARCHAR(45) NOT NULL,
  `caracteristicas` VARCHAR(45) NOT NULL,
  `aplicaciones` VARCHAR(45) NOT NULL,
  `Estado_de_Maquina_idEstado_de_Maquina` INT NOT NULL,
  `Tipo_Maquina_idTipo_Maquina` INT NOT NULL,
  `Reubicacion_Maquina_idRehubicacion_Maquina` INT NOT NULL,
  `Ubicacion_Maquina_idUbicacion_Maquina` INT NOT NULL,
  `Ambientes_Aprendizaje_idAmbientes_de_aprendizaje` INT NOT NULL,
  `Marca_idMarca` INT NOT NULL,
  PRIMARY KEY (`idMaquinas`),
  INDEX `fk_Ficha_Maquina_Estado_de_Maquina1_idx` (`Estado_de_Maquina_idEstado_de_Maquina` ASC) ,
  INDEX `fk_Ficha_Maquina_Tipo_Maquina1_idx` (`Tipo_Maquina_idTipo_Maquina` ASC) ,
  INDEX `fk_Ficha_Maquina_Reubicacion_Maquina1_idx` (`Reubicacion_Maquina_idRehubicacion_Maquina` ASC) ,
  INDEX `fk_Ficha_Maquina_Ubicacion_Maquina1_idx` (`Ubicacion_Maquina_idUbicacion_Maquina` ASC) ,
  INDEX `fk_Ficha_Maquina_Ambientes_Aprendizaje1_idx` (`Ambientes_Aprendizaje_idAmbientes_de_aprendizaje` ASC) ,
  INDEX `fk_Ficha_Maquina_Marca1_idx` (`Marca_idMarca` ASC) ,
  CONSTRAINT `fk_Ficha_Maquina_Estado_de_Maquina1`
    FOREIGN KEY (`Estado_de_Maquina_idEstado_de_Maquina`)
    REFERENCES `FIMACOR`.`Estado_de_Maquina` (`idEstado_de_Maquina`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Ficha_Maquina_Tipo_Maquina1`
    FOREIGN KEY (`Tipo_Maquina_idTipo_Maquina`)
    REFERENCES `FIMACOR`.`Tipo_Maquina` (`idTipo_Maquina`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Ficha_Maquina_Reubicacion_Maquina1`
    FOREIGN KEY (`Reubicacion_Maquina_idRehubicacion_Maquina`)
    REFERENCES `FIMACOR`.`Reubicacion_Maquina` (`idRehubicacion_Maquina`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Ficha_Maquina_Ubicacion_Maquina1`
    FOREIGN KEY (`Ubicacion_Maquina_idUbicacion_Maquina`)
    REFERENCES `FIMACOR`.`Ubicacion_Maquina` (`idUbicacion_Maquina`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Ficha_Maquina_Ambientes_Aprendizaje1`
    FOREIGN KEY (`Ambientes_Aprendizaje_idAmbientes_de_aprendizaje`)
    REFERENCES `FIMACOR`.`Ambientes_Aprendizaje` (`idAmbientes_de_aprendizaje`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Ficha_Maquina_Marca1`
    FOREIGN KEY (`Marca_idMarca`)
    REFERENCES `FIMACOR`.`Marca` (`idMarca`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `FIMACOR`.`Rol`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `FIMACOR`.`Rol` (
  `idRol` INT NOT NULL AUTO_INCREMENT,
  `descripcion_rol` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idRol`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `FIMACOR`.`Documento_Identidad`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `FIMACOR`.`Documento_Identidad` (
  `idDocumento_Identidad` INT NOT NULL AUTO_INCREMENT,
  `descripcion_Documento` VARCHAR(45) NOT NULL,
  `numero_documento` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idDocumento_Identidad`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `FIMACOR`.`Usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `FIMACOR`.`Usuario` (
  `idUsuario` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `apellido` VARCHAR(45) NOT NULL,
  `documento_identidad` VARCHAR(45) NOT NULL,
  `numero_telefono` VARCHAR(45) NOT NULL,
  `correo` VARCHAR(45) NOT NULL,
  `contraseña_usuario` VARCHAR(45) NOT NULL,
  `Rol_idRol` INT NOT NULL,
  `Documento_Identidad_idDocumento_Identidad` INT NOT NULL,
  PRIMARY KEY (`idUsuario`),
  INDEX `fk_Usuario_Rol1_idx` (`Rol_idRol` ASC) ,
  INDEX `fk_Usuario_Documento_Identidad1_idx` (`Documento_Identidad_idDocumento_Identidad` ASC) ,
  UNIQUE INDEX `idUsuario_UNIQUE` (`idUsuario` ASC) ,
  CONSTRAINT `fk_Usuario_Rol1`
    FOREIGN KEY (`Rol_idRol`)
    REFERENCES `FIMACOR`.`Rol` (`idRol`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Usuario_Documento_Identidad1`
    FOREIGN KEY (`Documento_Identidad_idDocumento_Identidad`)
    REFERENCES `FIMACOR`.`Documento_Identidad` (`idDocumento_Identidad`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `FIMACOR`.`Tipo_Manteniento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `FIMACOR`.`Tipo_Manteniento` (
  `idTipo_Manteniento` INT NOT NULL AUTO_INCREMENT,
  `descripcion_matenimiento` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idTipo_Manteniento`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `FIMACOR`.`Mantenimiento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `FIMACOR`.`Mantenimiento` (
  `idMantenimiento` INT NOT NULL AUTO_INCREMENT,
  `fecha_mantenimiento` VARCHAR(45) NOT NULL,
  `fecha_proximo_mantenimiento` VARCHAR(45) NOT NULL,
  `descripcion_Mantenimiento` VARCHAR(45) NOT NULL,
  `Tipo_Manteniento_idTipo_Manteniento` INT NOT NULL,
  `Ficha_Maquina_idMaquinas` INT NOT NULL,
  PRIMARY KEY (`idMantenimiento`),
  INDEX `fk_Mantenimiento_Tipo_Manteniento1_idx` (`Tipo_Manteniento_idTipo_Manteniento` ASC) ,
  INDEX `fk_Mantenimiento_Ficha_Maquina1_idx` (`Ficha_Maquina_idMaquinas` ASC) ,
  CONSTRAINT `fk_Mantenimiento_Tipo_Manteniento1`
    FOREIGN KEY (`Tipo_Manteniento_idTipo_Manteniento`)
    REFERENCES `FIMACOR`.`Tipo_Manteniento` (`idTipo_Manteniento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Mantenimiento_Ficha_Maquina1`
    FOREIGN KEY (`Ficha_Maquina_idMaquinas`)
    REFERENCES `FIMACOR`.`Ficha_Maquina` (`idMaquinas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `FIMACOR`.`Tipos_Manuales`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `FIMACOR`.`Tipos_Manuales` (
  `idTipos_Manuales` INT NOT NULL AUTO_INCREMENT,
  `descripcion_manual` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idTipos_Manuales`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `FIMACOR`.`Manuales`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `FIMACOR`.`Manuales` (
  `idManuales` INT NOT NULL,
  `nombre_del_manual` VARCHAR(45) NOT NULL,
  `descripcion_manual` VARCHAR(45) NOT NULL,
  `Tipos_Manuales_idTipos_Manuales` INT NOT NULL,
  `Ficha_Maquina_idMaquinas` INT NOT NULL,
  PRIMARY KEY (`idManuales`),
  INDEX `fk_Manuales_Tipos_Manuales1_idx` (`Tipos_Manuales_idTipos_Manuales` ASC) ,
  INDEX `fk_Manuales_Ficha_Maquina1_idx` (`Ficha_Maquina_idMaquinas` ASC) ,
  CONSTRAINT `fk_Manuales_Tipos_Manuales1`
    FOREIGN KEY (`Tipos_Manuales_idTipos_Manuales`)
    REFERENCES `FIMACOR`.`Tipos_Manuales` (`idTipos_Manuales`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Manuales_Ficha_Maquina1`
    FOREIGN KEY (`Ficha_Maquina_idMaquinas`)
    REFERENCES `FIMACOR`.`Ficha_Maquina` (`idMaquinas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `FIMACOR`.`novedades`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `FIMACOR`.`novedades` (
  `idnovedades` INT NOT NULL AUTO_INCREMENT,
  `fecha_novedad` VARCHAR(45) NOT NULL,
  `hora_novedad` VARCHAR(45) NOT NULL,
  `descripcion_novedad` VARCHAR(45) NOT NULL,
  `Usuario_idUsuario` INT NOT NULL,
  `Ficha_Maquina_idMaquinas` INT NOT NULL,
  PRIMARY KEY (`idnovedades`),
  INDEX `fk_novedades_Usuario1_idx` (`Usuario_idUsuario` ASC) ,
  INDEX `fk_novedades_Ficha_Maquina1_idx` (`Ficha_Maquina_idMaquinas` ASC) ,
  CONSTRAINT `fk_novedades_Usuario1`
    FOREIGN KEY (`Usuario_idUsuario`)
    REFERENCES `FIMACOR`.`Usuario` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_novedades_Ficha_Maquina1`
    FOREIGN KEY (`Ficha_Maquina_idMaquinas`)
    REFERENCES `FIMACOR`.`Ficha_Maquina` (`idMaquinas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `FIMACOR`.`Registro_Asistencia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `FIMACOR`.`Registro_Asistencia` (
  `idRegistro_Asistencia` INT NOT NULL,
  `descripcion_registro` VARCHAR(45) NOT NULL,
  `Ambientes_Aprendizaje_idAmbientes de aprendizaje` INT NOT NULL,
  PRIMARY KEY (`idRegistro_Asistencia`),
  INDEX `fk_Registro_Asistencia_Ambientes_Aprendizaje1_idx` (`Ambientes_Aprendizaje_idAmbientes de aprendizaje` ASC) ,
  CONSTRAINT `fk_Registro_Asistencia_Ambientes_Aprendizaje1`
    FOREIGN KEY (`Ambientes_Aprendizaje_idAmbientes de aprendizaje`)
    REFERENCES `FIMACOR`.`Ambientes_Aprendizaje` (`idAmbientes_de_aprendizaje`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `FIMACOR`.`Codigo_Registro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `FIMACOR`.`Codigo_Registro` (
  `idCodigoRegistro` INT NOT NULL,
  `correo` VARCHAR(45) NOT NULL,
  `codigo` VARCHAR(45) NOT NULL,
  `fecha_creacion` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idCodigoRegistro`, `correo`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

create  database gymsis;
use gymsis;

CREATE TABLE `Usuario` (
	`IdUsuario` INT NOT NULL AUTO_INCREMENT,
	`Nombre` varchar(50) NOT NULL,
	`Apellidos` varchar(50) NOT NULL,
	`Documento` INT NOT NULL,
	`CorreoElectronico` varchar(50) NOT NULL,
	`Estado` varchar(20) NOT NULL,
	`Telefono` INT(0) NOT NULL,
	PRIMARY KEY (`IdUsuario`)
);

CREATE TABLE `Pagos` (
	`IdPago` INT NOT NULL AUTO_INCREMENT,
	`FechaPago` DATE NOT NULL,
	`TipoPago` VARCHAR(255) NOT NULL,
	`ValorPago` DECIMAL NOT NULL,
	`IdUsuario` INT NOT NULL,
	PRIMARY KEY (`IdPago`)
);

CREATE TABLE `Rol` (
	`IdRol` INT NOT NULL AUTO_INCREMENT,
	`RolNombre` varchar(50) NOT NULL,
	`IdUsuario` int NOT NULL,
	PRIMARY KEY (`IdRol`)
);

CREATE TABLE `Plan` (
	`IdPlan` INT NOT NULL AUTO_INCREMENT,
	`PlanNombre` varchar(50) NOT NULL,
	`PlanCosto` DECIMAL NOT NULL,
	`PlanPeriodo` INT NOT NULL,
	`IdUsuario` INT NOT NULL,
	PRIMARY KEY (`IdPlan`)
);

CREATE TABLE `Especialista` (
	`IdEspecialista` INT NOT NULL AUTO_INCREMENT,
	`EspecialistaNombre` varchar(100) NOT NULL,
	`EspecialistaTipo` varchar(100) NOT NULL,
	`Estado` varchar(100) NOT NULL,
	PRIMARY KEY (`IdEspecialista`)
);

CREATE TABLE `Cita` (
	`IdCita` INT NOT NULL AUTO_INCREMENT,
	`CitaName` varchar(50) NOT NULL,
	`CitaDescripcion` varchar(100) NOT NULL,
	`Fecha` varchar(100) NOT NULL,
	`Hora` varchar(100) NOT NULL,
	`CitaEstado` varchar(100) NOT NULL,
	`IdUsuario` INT NOT NULL,
	`IdEspecialista` INT NOT NULL,
	PRIMARY KEY (`IdCita`)
);

ALTER TABLE `Pagos` ADD CONSTRAINT `Pagos_fk0` FOREIGN KEY (`IdUsuario`) REFERENCES `Usuario`(`IdUsuario`);

ALTER TABLE `Rol` ADD CONSTRAINT `Rol_fk0` FOREIGN KEY (`IdUsuario`) REFERENCES `Usuario`(`IdUsuario`);

ALTER TABLE `Plan` ADD CONSTRAINT `Plan_fk0` FOREIGN KEY (`IdUsuario`) REFERENCES `Usuario`(`IdUsuario`);

ALTER TABLE `Cita` ADD CONSTRAINT `Cita_fk0` FOREIGN KEY (`IdUsuario`) REFERENCES `Usuario`(`IdUsuario`);

ALTER TABLE `Cita` ADD CONSTRAINT `Cita_fk1` FOREIGN KEY (`IdEspecialista`) REFERENCES `Especialista`(`IdEspecialista`);
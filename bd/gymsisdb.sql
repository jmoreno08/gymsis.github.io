-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 31-05-2023 a las 18:07:21
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `gymsisdb`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cita`
--

CREATE TABLE `cita` (
  `IdCita` int(11) NOT NULL,
  `CitaName` varchar(50) NOT NULL,
  `CitaDescripcion` varchar(100) NOT NULL,
  `Fecha` date NOT NULL,
  `Hora` time NOT NULL,
  `CitaEstado` varchar(20) NOT NULL,
  `IdUsuario` int(11) NOT NULL,
  `IdEspecialista` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `cita`
--

INSERT INTO `cita` (`IdCita`, `CitaName`, `CitaDescripcion`, `Fecha`, `Hora`, `CitaEstado`, `IdUsuario`, `IdEspecialista`) VALUES
(1, 'Revisión nutricionista', 'Revisar estado actual de la dieta', '2023-05-19', '12:12:58', 'activa', 2, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contactanos`
--

CREATE TABLE `contactanos` (
  `idcontactanos` int(11) NOT NULL,
  `nombre` varchar(40) NOT NULL,
  `apellidos` varchar(40) NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `correo` int(11) NOT NULL,
  `mensaje` int(11) NOT NULL,
  `fecha` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ejercicio`
--

CREATE TABLE `ejercicio` (
  `idejercicio` int(11) NOT NULL,
  `tipoejercicio` varchar(20) NOT NULL,
  `nombreejercicio` varchar(20) NOT NULL,
  `descripcion` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `ejercicio`
--

INSERT INTO `ejercicio` (`idejercicio`, `tipoejercicio`, `nombreejercicio`, `descripcion`) VALUES
(1, 'pierna', 'sentadilla trasera', ''),
(2, 'pierna', 'extensión cuádriceps', ''),
(3, 'pecho', 'press banca', ''),
(4, 'espalda', 'peso muerto', ''),
(5, 'biceps', 'curl biceps mancuern', ''),
(6, 'triceps', 'press francés', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `especialista`
--

CREATE TABLE `especialista` (
  `IdEspecialista` int(11) NOT NULL,
  `EspecialistaNombre` varchar(20) NOT NULL,
  `EspecialistaTipo` varchar(20) NOT NULL,
  `Estado` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `especialista`
--

INSERT INTO `especialista` (`IdEspecialista`, `EspecialistaNombre`, `EspecialistaTipo`, `Estado`) VALUES
(1, 'Juan Esteban Cardona', 'Nutricionista', 'Activo'),
(2, 'Luis Mariano Lopez', 'Fisioterapeuta', 'Activo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inscripciones`
--

CREATE TABLE `inscripciones` (
  `IdInscripcion` int(11) NOT NULL,
  `IdUsuario` int(11) NOT NULL,
  `IdPlan` int(11) NOT NULL,
  `FechaInicio` date NOT NULL,
  `FechaFin` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `inscripciones`
--

INSERT INTO `inscripciones` (`IdInscripcion`, `IdUsuario`, `IdPlan`, `FechaInicio`, `FechaFin`) VALUES
(1, 1, 2, '2023-05-01', '2023-05-31');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `newsletter`
--

CREATE TABLE `newsletter` (
  `idnewsletter` int(11) NOT NULL,
  `correonewsletter` int(50) NOT NULL,
  `fecha` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pagos`
--

CREATE TABLE `pagos` (
  `IdPago` int(11) NOT NULL,
  `FechaPago` date NOT NULL,
  `IdUsuario` int(11) NOT NULL,
  `IdPlan` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `pagos`
--

INSERT INTO `pagos` (`IdPago`, `FechaPago`, `IdUsuario`, `IdPlan`) VALUES
(1, '2023-05-19', 4, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `plan`
--

CREATE TABLE `plan` (
  `IdPlan` int(11) NOT NULL,
  `PlanNombre` varchar(50) NOT NULL,
  `PlanCosto` decimal(10,0) NOT NULL,
  `PlanPeriodo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `plan`
--

INSERT INTO `plan` (`IdPlan`, `PlanNombre`, `PlanCosto`, `PlanPeriodo`) VALUES
(1, 'black', '80000', 30),
(2, 'Amatista', '120000', 30),
(3, 'Diamante', '150000', 30);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `planrutina`
--

CREATE TABLE `planrutina` (
  `idplanrutina` int(11) NOT NULL,
  `idusuario` int(11) NOT NULL,
  `idejercicio` int(11) NOT NULL,
  `serie` int(11) NOT NULL,
  `repeticiones` int(11) NOT NULL,
  `descanso` int(11) NOT NULL,
  `fecha` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE `rol` (
  `IdRol` int(11) NOT NULL,
  `IdRoles` int(11) NOT NULL,
  `IdUsuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `rol`
--

INSERT INTO `rol` (`IdRol`, `IdRoles`, `IdUsuario`) VALUES
(2, 1, 1),
(3, 2, 2),
(4, 2, 3),
(5, 2, 4),
(6, 2, 6),
(11, 2, 5),
(12, 2, 7),
(13, 2, 8),
(14, 2, 9),
(15, 2, 10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `IdRoles` int(11) NOT NULL,
  `RolesNombre` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`IdRoles`, `RolesNombre`) VALUES
(1, 'Administrador'),
(2, 'Usuario');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `IdUsuario` int(11) NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `Apellidos` varchar(50) NOT NULL,
  `Documento` varchar(50) NOT NULL,
  `contrasena` varchar(50) NOT NULL,
  `CorreoElectronico` varchar(50) NOT NULL,
  `Estado` varchar(20) NOT NULL,
  `Telefono` varchar(50) NOT NULL,
  `Sexo` varchar(20) NOT NULL,
  `FechaNacimiento` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`IdUsuario`, `Nombre`, `Apellidos`, `Documento`, `contrasena`, `CorreoElectronico`, `Estado`, `Telefono`, `Sexo`, `FechaNacimiento`) VALUES
(1, 'Jonathan', 'Moreno Nuñez', '98717046', '*12345$', 'morenoelectro@gmail.com', 'registrado', '3122946757', 'Masculino', '1986-02-08'),
(2, 'Johanna', 'Moreno Nuñez', '28965758', '*12345$', 'johamoreno@gmail.com', 'registrado', '3122946757', 'Femenino', '1986-02-08'),
(3, 'carolina', 'posada', '12345678', 'P@ssw0rd', ' emily.johnson@gmail.com', 'registrado', '3148956289', 'Masculino', '1984-02-12'),
(4, 'Catalina', 'Lopez', '8457695', '*123456879#', ' catalina.lopez@gmail.com', 'registrado', '3148956289', 'Masculino', '1980-04-24'),
(5, 'Viviana', 'Mesa Delgado', '75963248', '75963248*', 'viviana.mesa@gmail.com', 'registrado', '3125478965', 'Femenino', '1990-08-14'),
(6, 'Juan Carlos', 'Lopera', '34567890', '34567890*', 'juan.carlos@gmail.com', 'registrado', '314859624', 'Masculino', '1986-10-18'),
(7, 'Juan Armando', 'Posada Lopez', '846259763', '846259763*', 'juan.armando@gmail.com', 'registrado', '3002845967', 'Masculino', '1986-05-14'),
(8, 'María Lorena ', 'Muñoz cardona', '489563872', '489563872*', 'maria.lorena@gmail.com', 'registrado', '3127956345', 'Femenino', '1984-02-25'),
(9, 'Maria nataly', 'Mesa', '486953793', '486953793*', 'marianataly@gmail.com', 'registrado', '3127589645', 'Femenino', '1991-06-12'),
(10, 'Ivan ', 'Foronda Gomez', '485937895', '485937895*', 'ivanforonda@gmail.com', 'registrado', '31224897562', 'Masculino', '1986-02-10');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cita`
--
ALTER TABLE `cita`
  ADD PRIMARY KEY (`IdCita`),
  ADD KEY `Cita_fk0` (`IdUsuario`),
  ADD KEY `Cita_fk1` (`IdEspecialista`);

--
-- Indices de la tabla `contactanos`
--
ALTER TABLE `contactanos`
  ADD PRIMARY KEY (`idcontactanos`);

--
-- Indices de la tabla `ejercicio`
--
ALTER TABLE `ejercicio`
  ADD PRIMARY KEY (`idejercicio`);

--
-- Indices de la tabla `especialista`
--
ALTER TABLE `especialista`
  ADD PRIMARY KEY (`IdEspecialista`);

--
-- Indices de la tabla `inscripciones`
--
ALTER TABLE `inscripciones`
  ADD PRIMARY KEY (`IdInscripcion`),
  ADD KEY `fkinscripcionesusuario` (`IdUsuario`),
  ADD KEY `fkinscripcionesplan` (`IdPlan`);

--
-- Indices de la tabla `newsletter`
--
ALTER TABLE `newsletter`
  ADD PRIMARY KEY (`idnewsletter`);

--
-- Indices de la tabla `pagos`
--
ALTER TABLE `pagos`
  ADD PRIMARY KEY (`IdPago`),
  ADD KEY `Pagos_fk0` (`IdUsuario`),
  ADD KEY `fkPagoPlan` (`IdPlan`);

--
-- Indices de la tabla `plan`
--
ALTER TABLE `plan`
  ADD PRIMARY KEY (`IdPlan`);

--
-- Indices de la tabla `planrutina`
--
ALTER TABLE `planrutina`
  ADD PRIMARY KEY (`idplanrutina`),
  ADD KEY `fkrutinausuario` (`idusuario`),
  ADD KEY `fkrutinaejercicio` (`idejercicio`);

--
-- Indices de la tabla `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`IdRol`),
  ADD UNIQUE KEY `IdUsuario` (`IdUsuario`),
  ADD KEY `IdRoles` (`IdRoles`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`IdRoles`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`IdUsuario`),
  ADD UNIQUE KEY `Documento` (`Documento`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cita`
--
ALTER TABLE `cita`
  MODIFY `IdCita` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `contactanos`
--
ALTER TABLE `contactanos`
  MODIFY `idcontactanos` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ejercicio`
--
ALTER TABLE `ejercicio`
  MODIFY `idejercicio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `especialista`
--
ALTER TABLE `especialista`
  MODIFY `IdEspecialista` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `inscripciones`
--
ALTER TABLE `inscripciones`
  MODIFY `IdInscripcion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `newsletter`
--
ALTER TABLE `newsletter`
  MODIFY `idnewsletter` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pagos`
--
ALTER TABLE `pagos`
  MODIFY `IdPago` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `plan`
--
ALTER TABLE `plan`
  MODIFY `IdPlan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `planrutina`
--
ALTER TABLE `planrutina`
  MODIFY `idplanrutina` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `rol`
--
ALTER TABLE `rol`
  MODIFY `IdRol` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `IdRoles` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `IdUsuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cita`
--
ALTER TABLE `cita`
  ADD CONSTRAINT `Cita_fk0` FOREIGN KEY (`IdUsuario`) REFERENCES `usuario` (`IdUsuario`),
  ADD CONSTRAINT `Cita_fk1` FOREIGN KEY (`IdEspecialista`) REFERENCES `especialista` (`IdEspecialista`);

--
-- Filtros para la tabla `inscripciones`
--
ALTER TABLE `inscripciones`
  ADD CONSTRAINT `fkinscripcionesplan` FOREIGN KEY (`IdPlan`) REFERENCES `plan` (`IdPlan`),
  ADD CONSTRAINT `fkinscripcionesusuario` FOREIGN KEY (`IdUsuario`) REFERENCES `usuario` (`IdUsuario`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `pagos`
--
ALTER TABLE `pagos`
  ADD CONSTRAINT `Pagos_fk0` FOREIGN KEY (`IdUsuario`) REFERENCES `usuario` (`IdUsuario`),
  ADD CONSTRAINT `fkPagoPlan` FOREIGN KEY (`IdPlan`) REFERENCES `plan` (`IdPlan`);

--
-- Filtros para la tabla `planrutina`
--
ALTER TABLE `planrutina`
  ADD CONSTRAINT `fkrutinaejercicio` FOREIGN KEY (`idejercicio`) REFERENCES `ejercicio` (`idejercicio`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fkrutinausuario` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`IdUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `rol`
--
ALTER TABLE `rol`
  ADD CONSTRAINT `Rol_fk0` FOREIGN KEY (`IdUsuario`) REFERENCES `usuario` (`IdUsuario`),
  ADD CONSTRAINT `rol_ibfk_1` FOREIGN KEY (`IdRoles`) REFERENCES `roles` (`IdRoles`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

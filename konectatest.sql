-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 14-08-2020 a las 10:23:39
-- Versión del servidor: 10.4.11-MariaDB
-- Versión de PHP: 7.2.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `konectatest`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `idCategoria` int(11) NOT NULL,
  `nombreCategoria` varchar(100) DEFAULT NULL,
  `nombreCategoriaPadre` varchar(100) DEFAULT NULL,
  `descripcion` varchar(1000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`idCategoria`, `nombreCategoria`, `nombreCategoriaPadre`, `descripcion`) VALUES
(1, 'Electronica', 'Tecnologia', 'robots'),
(2, 'Mecanica', 'Tecnologia', 'Montajes'),
(3, 'Naturales', 'Ciencia', 'Estudio naturaleza'),
(4, 'deporte', 'Educacion', 'Actividades fisicas');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuestionario`
--

CREATE TABLE `cuestionario` (
  `idCuestionario` int(11) NOT NULL,
  `nombreCuestionario` varchar(100) DEFAULT NULL,
  `descripcion` varchar(1000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `cuestionario`
--

INSERT INTO `cuestionario` (`idCuestionario`, `nombreCuestionario`, `descripcion`) VALUES
(1, 'Ciencias', 'Naturales'),
(2, 'Sociales', 'Geografia'),
(3, 'Matematicas', 'Geometria'),
(4, 'Fisica', 'Mecanica');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `curso`
--

CREATE TABLE `curso` (
  `idCurso` int(11) NOT NULL,
  `nombreCurso` varchar(100) DEFAULT NULL,
  `visible` varchar(2) DEFAULT NULL,
  `fechaIngreso` date DEFAULT NULL,
  `descripcion` varchar(1000) DEFAULT NULL,
  `idCategoria` int(11) DEFAULT NULL,
  `idGrupo` int(11) DEFAULT NULL,
  `idCuestionario` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `curso`
--

INSERT INTO `curso` (`idCurso`, `nombreCurso`, `visible`, `fechaIngreso`, `descripcion`, `idCategoria`, `idGrupo`, `idCuestionario`) VALUES
(1, 'Matematicas', 'SI', '2020-08-15', 'Basicas', 1, 1, 3),
(2, 'Ciencias Sociales', 'SI', '2020-08-16', 'Estudio de la ciencias politicas', 2, 2, 2),
(3, 'Fisica Cuantica', 'SI', '2020-08-17', 'Estudio de cuerpos negros', 3, 4, 4),
(4, 'Educacion Fisica', 'NO', '2020-08-19', 'Educacion deportiva', 4, 1, 1),
(5, 'Alternativo', 'SI', '2020-08-20', 'Prueba', NULL, 4, 4),
(6, 'Tester', 'NO', '2020-08-20', 'Pruebas piloto', NULL, 4, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grupo`
--

CREATE TABLE `grupo` (
  `idGrupo` int(11) NOT NULL,
  `nombreGrupo` varchar(100) DEFAULT NULL,
  `descripcion` varchar(1000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `grupo`
--

INSERT INTO `grupo` (`idGrupo`, `nombreGrupo`, `descripcion`) VALUES
(1, 'Grupo 1', 'Alegres'),
(2, 'Grupo 2', 'Amargados'),
(3, 'Grupo 3', 'Comicos'),
(4, 'Grupo 4', 'Inteligentes');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `preguntas`
--

CREATE TABLE `preguntas` (
  `idPreguntas` int(11) NOT NULL,
  `pregunta` varchar(100) DEFAULT NULL,
  `solucion` varchar(500) DEFAULT NULL,
  `observarciones` varchar(1000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `preguntas`
--

INSERT INTO `preguntas` (`idPreguntas`, `pregunta`, `solucion`, `observarciones`) VALUES
(1, 'Numero 1', 'Solucion 1', 'Responder'),
(2, 'Numero 2', 'Solucion 2', 'Responder'),
(3, 'Numero 3', 'Solucion 3', 'Resolver'),
(4, 'Numero 4', 'Solucion 4', 'Responder');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `idUsuario` int(11) NOT NULL,
  `fechaRegistro` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `nombreUsuario` varchar(30) DEFAULT NULL,
  `apellidoUsuario` varchar(30) DEFAULT NULL,
  `direccion` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `idGrupo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`idUsuario`, `fechaRegistro`, `nombreUsuario`, `apellidoUsuario`, `direccion`, `email`, `idGrupo`) VALUES
(1, '2020-08-14 07:59:00', 'Jorge', 'Garcia', 'Calle 123', 'jorge@hotmail.com', 1),
(2, '2020-08-14 07:59:00', 'Sandra', 'Jaramillo', 'calle 456', 'sandra@hotmail.com', 3),
(3, '2020-08-14 08:00:13', 'David', 'Perez', 'Calle 789', 'david@hotmail.com', 1),
(4, '2020-08-14 08:00:13', 'Jair', 'Rodriguez', 'calle 324', 'jair@gmail.com', 3),
(5, '2020-08-14 08:01:20', 'Camilo', 'Fajardo', 'Cra 1', 'camilo@yahoo.es', 4),
(6, '2020-08-14 08:01:20', 'Tatina', 'Casas', 'Cra 87', 'tatiana@hotmail.com', 4);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`idCategoria`);

--
-- Indices de la tabla `cuestionario`
--
ALTER TABLE `cuestionario`
  ADD PRIMARY KEY (`idCuestionario`);

--
-- Indices de la tabla `curso`
--
ALTER TABLE `curso`
  ADD PRIMARY KEY (`idCurso`),
  ADD KEY `idCuestionario` (`idCuestionario`),
  ADD KEY `idCategoria` (`idCategoria`),
  ADD KEY `idGrupo` (`idGrupo`);

--
-- Indices de la tabla `grupo`
--
ALTER TABLE `grupo`
  ADD PRIMARY KEY (`idGrupo`);

--
-- Indices de la tabla `preguntas`
--
ALTER TABLE `preguntas`
  ADD PRIMARY KEY (`idPreguntas`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`idUsuario`),
  ADD KEY `idGrupo` (`idGrupo`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `idCategoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `cuestionario`
--
ALTER TABLE `cuestionario`
  MODIFY `idCuestionario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `curso`
--
ALTER TABLE `curso`
  MODIFY `idCurso` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `grupo`
--
ALTER TABLE `grupo`
  MODIFY `idGrupo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `preguntas`
--
ALTER TABLE `preguntas`
  MODIFY `idPreguntas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `idUsuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `curso`
--
ALTER TABLE `curso`
  ADD CONSTRAINT `curso_ibfk_1` FOREIGN KEY (`idCuestionario`) REFERENCES `cuestionario` (`idCuestionario`),
  ADD CONSTRAINT `curso_ibfk_2` FOREIGN KEY (`idCategoria`) REFERENCES `categoria` (`idCategoria`),
  ADD CONSTRAINT `curso_ibfk_3` FOREIGN KEY (`idGrupo`) REFERENCES `grupo` (`idGrupo`);

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`idGrupo`) REFERENCES `grupo` (`idGrupo`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

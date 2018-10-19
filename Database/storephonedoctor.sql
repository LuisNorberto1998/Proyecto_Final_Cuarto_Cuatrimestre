-- phpMyAdmin SQL Dump
-- version 4.8.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 20-10-2018 a las 01:39:22
-- Versión del servidor: 10.1.33-MariaDB
-- Versión de PHP: 7.2.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `storephonedoctor`
--
CREATE DATABASE IF NOT EXISTS `storephonedoctor` DEFAULT CHARACTER SET latin2 COLLATE latin2_bin;
USE `storephonedoctor`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `USERNAME_CL` varchar(20) COLLATE latin2_bin NOT NULL,
  `EMAIL_CL` varchar(50) COLLATE latin2_bin NOT NULL,
  `CONTRASENA_CL` varchar(255) COLLATE latin2_bin NOT NULL,
  `NOMBRE_CL` varchar(30) COLLATE latin2_bin NOT NULL,
  `AP_CL` varchar(30) COLLATE latin2_bin NOT NULL,
  `AM_CL` varchar(30) COLLATE latin2_bin NOT NULL,
  `TEL_CL` varchar(15) COLLATE latin2_bin NOT NULL,
  `MUN_CL` varchar(20) COLLATE latin2_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin2 COLLATE=latin2_bin COMMENT='REGISTRO DE CLIENTES FRECUENTES';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compras`
--

CREATE TABLE `compras` (
  `FOLIO_CO` varchar(10) COLLATE latin2_bin NOT NULL,
  `FECHA_CO` varchar(15) COLLATE latin2_bin NOT NULL,
  `IMPORTE_CO` double(255,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin2 COLLATE=latin2_bin COMMENT='REGISTRO DE COMPRAS';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compras_productos`
--

CREATE TABLE `compras_productos` (
  `ID_CP` varchar(10) COLLATE latin2_bin NOT NULL,
  `FOLIO_CO` varchar(10) COLLATE latin2_bin NOT NULL,
  `CODIGO_P` varchar(13) COLLATE latin2_bin NOT NULL,
  `PRECIO_C_CP` double(255,0) NOT NULL,
  `CANTIDAD_P_CP` int(255) NOT NULL,
  `SUBTOTAL_CP` double(255,0) NOT NULL,
  `PROVEEDOR_CP` varchar(50) COLLATE latin2_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin2 COLLATE=latin2_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `garantias`
--

CREATE TABLE `garantias` (
  `FOLIO_G` varchar(13) COLLATE latin2_bin NOT NULL,
  `CODIGO_P` varchar(13) COLLATE latin2_bin NOT NULL,
  `FECHA_G` varchar(15) COLLATE latin2_bin NOT NULL,
  `CANTIDAD_PG` int(11) NOT NULL,
  `USERNAME_US` varchar(20) COLLATE latin2_bin NOT NULL,
  `DESCRIPCION_G` varchar(255) COLLATE latin2_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin2 COLLATE=latin2_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `CODIGO_P` varchar(13) COLLATE latin2_bin NOT NULL,
  `NOMBRE_P` varchar(50) COLLATE latin2_bin NOT NULL,
  `CATEGORIA_P` varchar(30) COLLATE latin2_bin NOT NULL,
  `MARCA_P` varchar(30) COLLATE latin2_bin NOT NULL,
  `CANTIDAD_P` int(255) NOT NULL,
  `PRECIO_VENTA_P` double(255,0) NOT NULL,
  `IMG_P` text COLLATE latin2_bin,
  `DESCRIPCION_P` text COLLATE latin2_bin
) ENGINE=InnoDB DEFAULT CHARSET=latin2 COLLATE=latin2_bin COMMENT='INVENTARIO DE PRODUCTOS';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicios`
--

CREATE TABLE `servicios` (
  `FOLIO_S` varchar(13) COLLATE latin2_bin NOT NULL,
  `USERNAME_US` varchar(20) COLLATE latin2_bin NOT NULL,
  `USERNAME_CL` varchar(20) COLLATE latin2_bin NOT NULL,
  `FECHALLEGADA_S` varchar(15) COLLATE latin2_bin NOT NULL,
  `FECHASALIDA_S` varchar(15) COLLATE latin2_bin NOT NULL,
  `NOMBRECLIENTE_S` varchar(255) COLLATE latin2_bin NOT NULL,
  `TELEFONOCLIENTE_S` varchar(20) COLLATE latin2_bin NOT NULL,
  `DESCRIPCION_S` text COLLATE latin2_bin NOT NULL,
  `PRECIO_S` double(255,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin2 COLLATE=latin2_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `USERNAME_US` varchar(20) COLLATE latin2_bin NOT NULL,
  `EMAIL_US` varchar(50) COLLATE latin2_bin NOT NULL,
  `CONTRASENA_US` varchar(50) COLLATE latin2_bin NOT NULL,
  `NOMBRE_US` varchar(30) COLLATE latin2_bin NOT NULL,
  `AP_US` varchar(30) COLLATE latin2_bin NOT NULL,
  `AM_US` varchar(30) COLLATE latin2_bin NOT NULL,
  `TIPO_US` varchar(20) COLLATE latin2_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin2 COLLATE=latin2_bin COMMENT='REGISTRO DE USUARIOS DE SISTEMA';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `FOLIO_V` varchar(13) COLLATE latin2_bin NOT NULL,
  `USERNAME_US` varchar(20) COLLATE latin2_bin NOT NULL,
  `USERNAME_CL` varchar(50) COLLATE latin2_bin NOT NULL,
  `FECHA_V` varchar(15) COLLATE latin2_bin NOT NULL,
  `IMPORTE_V` double(255,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin2 COLLATE=latin2_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas_productos`
--

CREATE TABLE `ventas_productos` (
  `ID_VP` int(255) NOT NULL,
  `FOLIO_V` varchar(13) COLLATE latin2_bin NOT NULL,
  `CODIGO_P` varchar(13) COLLATE latin2_bin NOT NULL,
  `PRECIO_VP` double(255,0) NOT NULL,
  `SUBTOTAL_VP` double(255,0) NOT NULL,
  `CANTIDAD_VP` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin2 COLLATE=latin2_bin;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`USERNAME_CL`);

--
-- Indices de la tabla `compras`
--
ALTER TABLE `compras`
  ADD PRIMARY KEY (`FOLIO_CO`);

--
-- Indices de la tabla `compras_productos`
--
ALTER TABLE `compras_productos`
  ADD PRIMARY KEY (`ID_CP`),
  ADD KEY `FOLIO_CO` (`FOLIO_CO`),
  ADD KEY `CODIGO_P` (`CODIGO_P`);

--
-- Indices de la tabla `garantias`
--
ALTER TABLE `garantias`
  ADD PRIMARY KEY (`FOLIO_G`),
  ADD KEY `CODIGO_P_` (`CODIGO_P`),
  ADD KEY `USERNAME_US_` (`USERNAME_US`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`CODIGO_P`);

--
-- Indices de la tabla `servicios`
--
ALTER TABLE `servicios`
  ADD PRIMARY KEY (`FOLIO_S`),
  ADD KEY `USERNAME_US_S` (`USERNAME_US`),
  ADD KEY `USERNAME_CL_S` (`USERNAME_CL`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`USERNAME_US`);

--
-- Indices de la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`FOLIO_V`),
  ADD KEY `USERNAME_US_V` (`USERNAME_US`),
  ADD KEY `USERNAME_CL_V` (`USERNAME_CL`);

--
-- Indices de la tabla `ventas_productos`
--
ALTER TABLE `ventas_productos`
  ADD PRIMARY KEY (`ID_VP`),
  ADD KEY `FOLIO_V_VP` (`FOLIO_V`),
  ADD KEY `CODIGO_P_VP` (`CODIGO_P`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `ventas_productos`
--
ALTER TABLE `ventas_productos`
  MODIFY `ID_VP` int(255) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `compras_productos`
--
ALTER TABLE `compras_productos`
  ADD CONSTRAINT `CODIGO_P` FOREIGN KEY (`CODIGO_P`) REFERENCES `productos` (`CODIGO_P`),
  ADD CONSTRAINT `FOLIO_CO` FOREIGN KEY (`FOLIO_CO`) REFERENCES `compras` (`FOLIO_CO`);

--
-- Filtros para la tabla `garantias`
--
ALTER TABLE `garantias`
  ADD CONSTRAINT `CODIGO_P_` FOREIGN KEY (`CODIGO_P`) REFERENCES `productos` (`CODIGO_P`),
  ADD CONSTRAINT `USERNAME_US_` FOREIGN KEY (`USERNAME_US`) REFERENCES `usuarios` (`USERNAME_US`);

--
-- Filtros para la tabla `servicios`
--
ALTER TABLE `servicios`
  ADD CONSTRAINT `USERNAME_CL_S` FOREIGN KEY (`USERNAME_CL`) REFERENCES `clientes` (`USERNAME_CL`),
  ADD CONSTRAINT `USERNAME_US_S` FOREIGN KEY (`USERNAME_US`) REFERENCES `usuarios` (`USERNAME_US`);

--
-- Filtros para la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD CONSTRAINT `USERNAME_CL_V` FOREIGN KEY (`USERNAME_CL`) REFERENCES `clientes` (`USERNAME_CL`),
  ADD CONSTRAINT `USERNAME_US_V` FOREIGN KEY (`USERNAME_US`) REFERENCES `usuarios` (`USERNAME_US`);

--
-- Filtros para la tabla `ventas_productos`
--
ALTER TABLE `ventas_productos`
  ADD CONSTRAINT `CODIGO_P_VP` FOREIGN KEY (`CODIGO_P`) REFERENCES `productos` (`CODIGO_P`),
  ADD CONSTRAINT `FOLIO_V_VP` FOREIGN KEY (`FOLIO_V`) REFERENCES `ventas` (`FOLIO_V`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

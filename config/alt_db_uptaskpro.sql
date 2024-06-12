-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 10-06-2024 a las 19:08:00
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `db_uptaskpro`
--
DROP DATABASE IF EXISTS db_uptaskpro;
CREATE DATABASE db_uptaskpro
CHARACTER SET utf8mb4
COLLATE utf8mb4_spanish2_ci;
USE db_uptaskpro;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(100) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id`, `nombre`, `fecha`) VALUES
(1, 'Abarrote', '2024-06-09 18:57:07'),
(2, 'Sin Asignar', '2024-06-09 18:57:16'),
(3, 'Cliente', '2024-06-09 16:54:18'),
(4, 'Empleado', '2024-06-09 16:54:18'),
(5, 'Proveedor', '2024-06-09 16:54:18'),
(6, 'Familiar', '2024-06-09 16:54:18');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `entradap`
--

CREATE TABLE `entradap` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` int(11) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `nombrecategoria` int(11) NOT NULL,
  `entrada` int(11) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  FOREIGN KEY (`nombrecategoria`) REFERENCES `categorias` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `entradap`
--

INSERT INTO `entradap` (`id`, `codigo`, `descripcion`, `nombrecategoria`, `entrada`, `fecha`) VALUES
(1, 201, 'ProdOne', 1, 12, '2024-06-14 15:25:15'),
(2, 201, 'ProdOne', 1, 10, '2024-06-14 15:51:25'),
(3, 201, 'ProdOne', 1, 10, '2024-06-14 16:02:18'),
(4, 201, 'ProdFour', 2, 15, '2024-06-14 16:04:23'),
(5, 201, 'ProdOne', 1, 10, '2024-06-17 01:42:46'),
(6, 201, 'ProdOne', 1, 10, '2024-07-08 16:55:33');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idcategoria` int(11) NOT NULL,
  `codigo` varchar(100) NOT NULL,
  `descripcion` varchar(255) NOT NULL,
  `stock` int(11) NOT NULL,
  `precio` float NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  FOREIGN KEY (`idcategoria`) REFERENCES `categorias` (`id`),
  UNIQUE KEY `codigo` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `idcategoria`, `codigo`, `descripcion`, `stock`, `precio`, `fecha`) VALUES
(1, 1, '201', 'ProdOne', 50, 100.6,'2024-07-08 16:55:33'),
(2, 2, '76676878', 'ProdFour', 20,108.6,'2024-07-08 16:55:55');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `salidap`
--

CREATE TABLE `salidap` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(100) NOT NULL,
  `descripcion` varchar(255) NOT NULL,
  `nombrecategoria` int(11) NOT NULL,
  `salida` int(11) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  FOREIGN KEY (`nombrecategoria`) REFERENCES `categorias` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `salidap`
--

INSERT INTO `salidap` (`id`, `codigo`, `descripcion`, `nombrecategoria`, `salida`, `fecha`) VALUES
(1, '76676878', 'ProdFour', 2, 105.6, '2024-06-14 16:23:20'),
(2, '76676878', 'ProdFour', 2, 100.6, '2024-06-17 01:43:02'),
(3, '76676878', 'ProdFour', 2, 100.6, '2024-07-08 16:55:55');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(150) NOT NULL,
  `usuario` varchar(60) NOT NULL,
  `password` varchar(300) NOT NULL,
  `perfil` varchar(60) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `usuario` (`usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre`, `usuario`, `password`, `perfil`, `fecha`) VALUES
(1, 'Juan Lezana', 'admin', '$2a$07$asxx54ahjppf45sd87a5au1mMwPFOiFOa2BiMswhkNpbB7hBZc6pa', 'Administrador', '2024-06-01 17:12:46'),
(3, 'Logistica', 'logistica', '$2a$07$asxx54ahjppf45sd87a5auXBm1Vr2M1NV5t/zNQtGHGpS5fFirrbG', 'Logistica', '2024-06-01 18:17:38'),
(4, 'Ecommerce', 'ecommerce', '$2a$07$asxx54ahjppf45sd87a5au1mMwPFOiFOa2BiMswhkNpbB7hBZc6pa', 'Ecommerce', '2024-06-01 17:30:58'),
(5, 'Marketing', 'marketing', '$2a$07$asxx54ahjppf45sd87a5auEKl984fID33lyBClW7OSuuQkFCZQT9a', 'Marketing', '2024-06-01 17:31:17');

-- --------------------------------------------------------
--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(150) NOT NULL,
  `direccion` varchar(150) DEFAULT NULL,
  `telefono` varchar(25) DEFAULT NULL,
  `email` varchar(60) DEFAULT NULL,
  `transporte` text DEFAULT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `estado` ENUM('0', '1') DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id`, `nombre`, `direccion`, `telefono`, `email`, `transporte`, `fecha`, `estado`) VALUES
(1, 'Consumidor Final', 'Anonima', '00000000', 'mail@mail.com', 'Sin Asignar', '2024-06-09 18:57:07', '1'),
(2, 'Juan Lezana', 'Buenos Aires, Argentina', '1166376200', 'juan@gmail.com', 'Sin Asignar', '2024-06-09 18:57:07', '1');

-- --------------------------------------------------------
--
-- Estructura de tabla para la tabla `proveedores`
--

CREATE TABLE `proveedores` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(150) NOT NULL,
  `direccion` varchar(150) DEFAULT NULL,
  `telefono` varchar(25) DEFAULT NULL,
  `email` varchar(60) DEFAULT NULL,
  `pagina_web` varchar(150) DEFAULT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `estado` ENUM('0', '1') DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `proveedores`
--

INSERT INTO `proveedores` (`id`, `nombre`, `direccion`, `telefono`, `email`, `pagina_web`, `fecha`, `estado`) VALUES
(1, 'LezanaTech', 'Anonima', '00000000', 'mail@mail.com', 'www.lezanatech.com', '2024-06-09 18:57:07', '1');

--
--
--

-- --------------------------------------------------------

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

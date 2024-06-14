-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 14-06-2024 a las 14:07:49
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `db_estacion`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `table_cierre`
--

CREATE TABLE `table_cierre` (
  `id_table_cierre` int(11) NOT NULL,
  `tipo_cierre` varchar(10) DEFAULT NULL,
  `cant_cierre` varchar(10) DEFAULT NULL,
  `monto_cierre` varchar(10) DEFAULT NULL,
  `tasa_dia` varchar(10) DEFAULT NULL,
  `fecha_cierre` varchar(10) DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `table_cierre`
--

INSERT INTO `table_cierre` (`id_table_cierre`, `tipo_cierre`, `cant_cierre`, `monto_cierre`, `tasa_dia`, `fecha_cierre`, `id_user`) VALUES
(1, '1', '5', '204', '36.6', '13-05-24', 12),
(2, '2', '2', '20', '36.6', '13-05-24', 12),
(3, '3', '3', '24', '36.6', '13-05-24', 12),
(4, '4', '6', '84', '36.6', '13-05-24', 12),
(5, '5', '3', '35', '36.6', '13-05-24', 12),
(6, '6', '1', '5', '36.6', '13-05-24', 12),
(7, '1', '3', '119', '37.4', '14-05-24', 12),
(8, '2', '1', '10', '37.4', '14-05-24', 12),
(9, '3', '3', '42', '37.4', '14-05-24', 12),
(10, '4', '6', '63', '37.4', '14-05-24', 12),
(11, '5', '1', '22.5', '37.4', '14-05-24', 12),
(12, '1', '9', '357', '38.5', '15-05-24', 12),
(13, '2', '3', '30', '38.5', '15-05-24', 12),
(14, '3', '5', '46', '38.5', '15-05-24', 12),
(15, '4', '12', '146', '38.5', '15-05-24', 12),
(16, '5', '5', '70.5', '38.5', '15-05-24', 12),
(17, '1', '15', '595', '36.4', '16-05-24', 12),
(18, '2', '5', '50', '36.4', '16-05-24', 12),
(19, '3', '9', '108', '36.4', '16-05-24', 12),
(20, '4', '23', '286', '36.4', '16-05-24', 12),
(21, '5', '2', '18', '36.4', '16-05-24', 12),
(22, '6', '4', '72.5', '36.4', '16-05-24', 12),
(23, '1', '5', '204', '36.6', '13-05-24', 12),
(24, '2', '2', '20', '36.6', '13-05-24', 12),
(25, '3', '3', '24', '36.6', '13-05-24', 12),
(26, '4', '6', '84', '36.6', '13-05-24', 12),
(27, '5', '3', '35', '36.6', '13-05-24', 12),
(28, '6', '1', '5', '36.6', '13-05-24', 12);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `table_log`
--

CREATE TABLE `table_log` (
  `log_id` int(11) NOT NULL,
  `log_idUser` int(11) DEFAULT NULL,
  `log_descripcion` text DEFAULT NULL,
  `log_comando` text DEFAULT NULL,
  `log_fecha` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `table_log`
--

INSERT INTO `table_log` (`log_id`, `log_idUser`, `log_descripcion`, `log_comando`, `log_fecha`) VALUES
(1, 1, '/Busyaracuy/index.php1', 'UPDATE table_user SET user_status = ? WHERE user_id = 6', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `table_menu`
--

CREATE TABLE `table_menu` (
  `id_menu` int(11) NOT NULL,
  `nombre_menu` varchar(45) DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `icono` text DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `page_menu_open` varchar(20) DEFAULT NULL,
  `page_link` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `table_menu`
--

INSERT INTO `table_menu` (`id_menu`, `nombre_menu`, `descripcion`, `icono`, `status`, `page_menu_open`, `page_link`) VALUES
(1, 'Usuario', NULL, 'far fa-user', 1, 'usuario', 'usuarios'),
(2, 'Menu', NULL, 'fas fa-list-ul', 1, 'menu', 'menus'),
(3, 'Timeline', NULL, 'far fa-clock', 1, 'timelines', 'times');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `table_menu_sub_menu`
--

CREATE TABLE `table_menu_sub_menu` (
  `id_menu_sub_menu` int(11) NOT NULL,
  `id_menu` int(11) DEFAULT NULL,
  `id_sub_menu` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `table_menu_sub_menu`
--

INSERT INTO `table_menu_sub_menu` (`id_menu_sub_menu`, `id_menu`, `id_sub_menu`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 2, 4),
(5, 3, 5),
(15, 2, 8);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `table_roles`
--

CREATE TABLE `table_roles` (
  `rol_id` int(11) NOT NULL,
  `rol_name` varchar(45) DEFAULT NULL,
  `rol_descripcion` text DEFAULT NULL,
  `rol_status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `table_roles`
--

INSERT INTO `table_roles` (`rol_id`, `rol_name`, `rol_descripcion`, `rol_status`) VALUES
(1, 'Administrador', 'administrador', 1),
(2, 'Encargado', 'encargado del sistema', 1),
(3, 'Provicional', 'Provicional', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `table_roles_sub_menu`
--

CREATE TABLE `table_roles_sub_menu` (
  `id_rol_sub_menu` int(11) NOT NULL,
  `id_rol` int(11) DEFAULT NULL,
  `id_sub_menu` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `table_roles_sub_menu`
--

INSERT INTO `table_roles_sub_menu` (`id_rol_sub_menu`, `id_rol`, `id_sub_menu`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 1, 4),
(5, 1, 5),
(16, 1, 8);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `table_tasa_dia`
--

CREATE TABLE `table_tasa_dia` (
  `id_tasa_dia` int(11) NOT NULL,
  `tasa_dia` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `table_tasa_dia`
--

INSERT INTO `table_tasa_dia` (`id_tasa_dia`, `tasa_dia`) VALUES
(1, 36.5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `table_ticket_venta`
--

CREATE TABLE `table_ticket_venta` (
  `id_ticket_venta` int(10) NOT NULL,
  `nombre_ticket` varchar(80) NOT NULL,
  `ci_ticket` varchar(15) NOT NULL,
  `tipo_vehiculo_ticket` int(1) NOT NULL,
  `placa_ticket` varchar(10) DEFAULT NULL,
  `lts_ticket` int(5) NOT NULL,
  `tipo_pago_ticket` int(1) NOT NULL,
  `monto_ticket` varchar(10) DEFAULT NULL,
  `tasa_dia` varchar(10) DEFAULT NULL,
  `fecha_ticket` varchar(12) NOT NULL,
  `hora_ticket` varchar(10) NOT NULL,
  `id_user` int(1) NOT NULL,
  `status_ticket` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `table_ticket_venta`
--

INSERT INTO `table_ticket_venta` (`id_ticket_venta`, `nombre_ticket`, `ci_ticket`, `tipo_vehiculo_ticket`, `placa_ticket`, `lts_ticket`, `tipo_pago_ticket`, `monto_ticket`, `tasa_dia`, `fecha_ticket`, `hora_ticket`, `id_user`, `status_ticket`) VALUES
(1, 'william enrique', '14607920', 1, 'g14521', 45, 4, '22.5', '36.6', '13-05-24', '16:47:28', 12, 0),
(2, 'oswaldo de jesus', '12521452', 1, '1254kjj', 40, 5, '20', '36.6', '13-05-24', '08:35:03', 12, 0),
(3, 'william enrique', '14607920', 2, '125jk', 10, 6, '5', '36.6', '13-05-24', '08:41:22', 12, 0),
(4, 'william enrique', '435435', 3, 'N/A', 2, 4, '1', '36.6', '13-05-24', '08:42:48', 12, 0),
(5, 'jjbj', '546', 3, 'N/A', 20, 5, '10', '36.6', '13-05-24', '08:44:33', 12, 0),
(6, 'william infante', '546', 1, 'jkkj412', 34, 4, '17', '36.6', '13-05-24', '16:33:07', 12, 0),
(7, 'william enrique', '14607920', 1, 'N/A', 45, 4, '22.5', '36.6', '13-05-24', '16:47:28', 12, 0),
(8, 'oswaldo de jesus', '12521452', 1, 'N/A', 40, 4, '20', '36.6', '13-05-24', '08:35:03', 12, 0),
(9, 'william enrique', '14607920', 2, 'N/A', 10, 5, '5', '36.6', '13-05-24', '08:41:22', 12, 0),
(10, 'william enrique', '435435', 3, 'N/A', 2, 4, '1', '36.6', '13-05-24', '08:42:48', 12, 0),
(11, 'jjbj', '546', 3, 'N/A', 20, 4, '10', '37.4', '14-05-24', '08:44:33', 12, 0),
(12, 'william infante', '546', 1, 'jkkj412', 34, 4, '17', '37.4', '14-05-24', '16:33:07', 12, 1),
(13, 'william enrique', '14607920', 1, 'N/A', 45, 5, '22.5', '37.4', '14-05-24', '16:47:28', 12, 0),
(14, 'oswaldo de jesus', '12521452', 1, 'hhg45', 40, 4, '20', '37.4', '14-05-24', '08:35:03', 12, 0),
(15, 'william enrique', '14607920', 2, 'kljuj45', 10, 4, '5', '37.4', '14-05-24', '08:41:22', 12, 0),
(16, 'william enrique', '435435', 3, 'N/A', 2, 4, '1', '37.4', '14-05-24', '08:42:48', 12, 0),
(17, 'jjbj', '546', 3, 'N/A', 20, 4, '10', '37.4', '14-05-24', '08:44:33', 12, 0),
(18, 'william infante', '546', 1, 'jkkj412', 34, 5, '17', '38.5', '15-05-24', '16:33:07', 12, 0),
(19, 'william enrique', '14607920', 1, 'N/A', 45, 4, '22.5', '38.5', '15-05-24', '16:47:28', 12, 0),
(20, 'oswaldo de jesus', '12521452', 1, 'N/A', 40, 4, '20', '38.5', '15-05-24', '08:35:03', 12, 0),
(21, 'william enrique', '14607920', 2, 'ffgf452', 10, 4, '5', '38.5', '15-05-24', '08:41:22', 12, 0),
(22, 'william enrique', '435435', 3, 'hghg12', 2, 5, '1', '38.5', '15-05-24', '08:42:48', 12, 0),
(23, 'jjbj', '546', 3, 'N/A', 20, 4, '10', '38.5', '15-05-24', '08:44:33', 12, 0),
(24, 'william infante', '546', 1, 'jkkj412', 34, 4, '17', '38.5', '15-05-24', '16:33:07', 12, 0),
(25, 'william enrique', '14607920', 1, 'N/A', 45, 5, '22.5', '38.5', '15-05-24', '16:47:28', 12, 0),
(26, 'oswaldo de jesus', '12521452', 1, 'N/A', 40, 4, '20', '38.5', '15-05-24', '08:35:03', 12, 0),
(27, 'william enrique', '14607920', 2, '1254kj', 10, 4, '5', '38.5', '15-05-24', '08:41:22', 12, 0),
(28, 'william enrique', '435435', 3, 'fgbh74', 2, 4, '1', '38.5', '15-05-24', '08:42:48', 12, 0),
(29, 'jjbj', '546', 3, 'N/A', 20, 5, '10', '38.5', '15-05-24', '08:44:33', 12, 0),
(30, 'william infante', '546', 1, 'jkkj412', 34, 4, '17', '38.5', '15-05-24', '16:33:07', 12, 0),
(31, 'william enrique', '14607920', 1, 'N/A', 45, 4, '22.5', '38.5', '15-05-24', '16:47:28', 12, 0),
(32, 'oswaldo de jesus', '12521452', 1, 'N/A', 40, 5, '20', '38.5', '15-05-24', '08:35:03', 12, 0),
(33, 'william enrique', '14607920', 2, 'fgbh745', 10, 4, '5', '38.5', '15-05-24', '08:41:22', 12, 0),
(34, 'william enrique', '435435', 3, 'fdcv48', 2, 4, '1', '38.5', '15-05-24', '08:42:48', 12, 0),
(35, 'jjbj', '546', 3, 'N/A', 20, 4, '10', '36.4', '16-05-24', '08:44:33', 12, 0),
(36, 'william infante', '546', 1, 'jkkj412', 34, 4, '17', '36.4', '16-05-24', '16:33:07', 12, 0),
(37, 'william enrique', '14607920', 1, 'N/A', 45, 6, '22.5', '36.4', '16-05-24', '16:47:28', 12, 0),
(38, 'oswaldo de jesus', '12521452', 1, '12-ñlk', 40, 6, '20', '36.4', '16-05-24', '08:35:03', 12, 0),
(39, 'william enrique', '14607920', 2, 'N/A', 10, 4, '5', '36.4', '16-05-24', '08:41:22', 12, 0),
(40, 'william enrique', '435435', 3, 'N/A', 2, 4, '1', '36.4', '16-05-24', '08:42:48', 12, 0),
(41, 'jjbj', '546', 3, 'N/A', 20, 4, '10', '36.4', '16-05-24', '08:44:33', 12, 0),
(42, 'william infante', '546', 1, 'jkkj412', 34, 4, '17', '36.4', '16-05-24', '16:33:07', 12, 0),
(43, 'william enrique', '14607920', 1, 'N/A', 45, 4, '22.5', '36.4', '16-05-24', '16:47:28', 12, 0),
(44, 'oswaldo de jesus', '12521452', 1, '12-ñlk', 40, 6, '20', '36.4', '16-05-24', '08:35:03', 12, 0),
(45, 'william enrique', '14607920', 2, 'N/A', 10, 4, '5', '36.4', '16-05-24', '08:41:22', 12, 0),
(46, 'william enrique', '435435', 3, 'N/A', 2, 4, '1', '36.4', '16-05-24', '08:42:48', 12, 0),
(47, 'jjbj', '546', 3, 'N/A', 20, 6, '10', '36.4', '16-05-24', '08:44:33', 12, 0),
(48, 'william infante', '546', 1, 'jkkj412', 34, 4, '17', '36.4', '16-05-24', '16:33:07', 12, 0),
(49, 'william enrique', '14607920', 1, 'fdg4521', 45, 4, '22.5', '36.4', '16-05-24', '16:47:28', 12, 0),
(50, 'oswaldo de jesus', '12521452', 1, '12-ñlk', 40, 4, '20', '36.4', '16-05-24', '08:35:03', 12, 0),
(51, 'william enrique', '14607920', 2, 'N/A', 10, 4, '5', '36.4', '16-05-24', '08:41:22', 12, 0),
(52, 'william enrique', '435435', 3, 'N/A', 2, 5, '1', '36.4', '16-05-24', '08:42:48', 12, 0),
(53, 'jjbj', '546', 3, 'N/A', 20, 4, '10', '36.4', '16-05-24', '08:44:33', 12, 0),
(54, 'william infante', '546', 1, 'jkkj412', 34, 5, '17', '36.4', '16-05-24', '16:33:07', 12, 0),
(55, 'william enrique', '14607920', 1, 'N/A', 45, 4, '22.5', '36.4', '16-05-24', '16:47:28', 12, 0),
(56, 'oswaldo de jesus', '12521452', 1, 'N/A', 40, 4, '20', '36.4', '16-05-24', '08:35:03', 12, 0),
(57, 'william enrique', '14607920', 2, '4251lk', 10, 4, '5', '36.4', '16-05-24', '08:41:22', 12, 0),
(58, 'william enrique', '435435', 3, 'N/A', 2, 4, '1', '36.4', '16-05-24', '08:42:48', 12, 0),
(59, 'jjbj', '546', 3, 'N/A', 20, 4, '10', '36.4', '16-05-24', '08:44:33', 12, 0),
(60, 'william infante', '546', 1, 'jkkj412', 34, 4, '17', '36.4', '16-05-24', '16:33:07', 12, 0),
(61, 'william enrique', '14607920', 1, 'N/A', 45, 4, '22.5', '36.6', '16-05-24', '16:47:28', 12, 0),
(62, 'oswaldo de jesus', '12521452', 1, 'N/A', 40, 4, '20', '36.4', '16-05-24', '08:35:03', 12, 0),
(63, 'william enrique', '14607920', 2, 'fgfdg541', 10, 4, '5', '36.4', '16-05-24', '08:41:22', 12, 0),
(64, 'william enrique', '435435', 3, 'N/A', 2, 5, '1', '36.4', '17-05-24', '08:42:48', 12, 0),
(65, 'jjbj', '546', 3, 'N/A', 20, 5, '10', '36.4', '17-05-24', '08:44:33', 12, 0),
(66, 'william infante', '546', 1, 'jkkj412', 34, 4, '17', '36.4', '17-05-24', '16:33:07', 12, 0),
(67, 'william enrique', '14607920', 1, 'N/A', 45, 4, '22.5', '36.4', '17-05-24', '16:47:28', 12, 0),
(68, 'oswaldo de jesus', '12521452', 1, 'N/A', 40, 4, '20', '36.4', '17-05-24', '08:35:03', 12, 0),
(69, 'william enrique', '14607920', 2, 'fgb412', 10, 4, '5', '36.4', '17-05-24', '08:41:22', 12, 0),
(70, 'william enrique', '435435', 3, '12514lk', 2, 6, '1', '36.4', '17-05-24', '08:42:48', 12, 0),
(71, 'jjbj', '546', 3, 'N/A', 20, 4, '10', '36.4', '17-05-24', '08:44:33', 12, 0),
(72, 'william infante', '546', 1, 'jkkj412', 34, 6, '17', '36.4', '17-05-24', '16:33:07', 12, 0),
(73, 'william enrique', '14607920', 1, 'N/A', 45, 4, '22.5', '36.4', '17-05-24', '16:47:28', 12, 0),
(74, 'oswaldo de jesus', '12521452', 1, 'N/A', 40, 4, '20', '36.4', '17-05-24', '08:35:03', 12, 0),
(75, 'william enrique', '14607920', 2, 'N/A', 10, 4, '5', '36.4', '17-05-24', '08:41:22', 12, 0),
(76, 'william enrique', '435435', 3, 'N/A', 2, 4, '1', '36.4', '17-05-24', '08:42:48', 12, 0),
(77, 'jjbj', '546', 3, 'N/A', 20, 5, '10', '36.4', '17-05-24', '08:44:33', 12, 0),
(78, 'william infante', '546', 1, 'jkkj412', 34, 5, '17', '36.4', '17-05-24', '16:33:07', 12, 0),
(83, 'william', '14607920', 3, 'N/A', 15, 5, '274.5', '36.6', '17-05-24', '16:52:19', 12, 0),
(84, 'william infante', '355', 1, 'bbg-04p', 40, 4, '20', '36.6', '20-05-24', '08:12:54', 12, 0),
(85, 'oswaldo de jesus', '12521452', 3, 'kbl-54l', 10, 5, '183', '36.6', '20-05-24', '08:13:35', 12, 0),
(86, 'oswaldo de jesus', '12521452', 3, 'bbg-04p', 2, 4, '1', '36.6', '20-05-24', '08:18:45', 12, 0),
(87, 'william enrique', '12521452', 2, 'bbg-04p', 40, 4, '20', '36.6', '20-05-24', '08:19:37', 12, 0),
(88, 'william enrique', '14607920', 1, 'bbg-04p', 10, 5, '183', '36.6', '20-05-24', '09:00:36', 12, 0),
(89, 'william infante', '12521452', 2, 'jkkj412', 10, 4, '5', '36.6', '20-05-24', '09:01:12', 12, 0),
(90, 'carlos luis', '15769775', 2, 'N/A', 40, 5, '732', '36.6', '20-05-24', '09:03:23', 12, 0),
(91, 'william enrique', '14607920', 2, '12-ñlk', 25, 4, '12.5', '36.6', '20-05-24', '09:24:11', 12, 0),
(92, 'oswaldo de jesus', '14607920', 3, 'bbg-04p', 5, 5, '91.5', '36.6', '20-05-24', '10:32:19', 12, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `table_timeline`
--

CREATE TABLE `table_timeline` (
  `time_id` int(11) NOT NULL,
  `time_idUser` int(11) DEFAULT NULL,
  `time_codigo` varchar(45) DEFAULT NULL,
  `time_fecha` varchar(20) DEFAULT NULL,
  `time_inicio` varchar(20) DEFAULT NULL,
  `time_fin` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `table_timeline`
--

INSERT INTO `table_timeline` (`time_id`, `time_idUser`, `time_codigo`, `time_fecha`, `time_inicio`, `time_fin`) VALUES
(0, 6, 'biCod-6-KCHj', '2024-03-31', '6:59 pm', '9:32 pm'),
(0, 1, 'biCod-1-lpga', '2024-04-01', '6:44 am', '6:47 am'),
(0, 1, 'biCod-1-jJ7P', '2024-04-01', '6:38 pm', '8:44 pm'),
(0, 1, 'biCod-1-ebEw', '2024-04-01', '8:52 pm', '9:01 pm'),
(0, 1, 'biCod-1-McXm', '2024-04-02', '7:33 pm', '7:34 pm'),
(0, 1, 'biCod-1-0v7K', '2024-04-02', '7:46 pm', '7:47 pm'),
(0, 1, 'biCod-1-deUw', '2024-04-02', '7:50 pm', '7:50 pm'),
(0, 1, 'biCod-1-vQHd', '2024-04-02', '8:00 pm', '8:13 pm'),
(0, 1, 'biCod-1-Vhap', '2024-04-02', '8:13 pm', NULL),
(0, 1, 'biCod-1-7Cyb', '2024-04-03', '6:39 pm', NULL),
(0, 1, 'biCod-1-mqFm', '2024-04-04', '6:10 pm', NULL),
(0, 1, 'biCod-1-CBhe', '2024-04-11', '4:47 pm', '4:50 pm'),
(0, 1, 'biCod-1-jpYV', '2024-04-11', '4:51 pm', '5:02 pm'),
(0, 1, 'biCod-1-Edmo', '2024-04-11', '5:03 pm', NULL),
(0, 1, 'biCod-1-lXNN', '2024-04-11', '5:06 pm', NULL),
(0, 1, 'biCod-1-WV8a', '2024-04-12', '4:50 pm', '4:54 pm'),
(0, 7, 'biCod-7-AjGD', '2024-04-12', '4:55 pm', '4:55 pm'),
(0, 1, 'biCod-1-tece', '2024-04-15', '8:26 am', '8:26 am'),
(0, 5, 'biCod-5-yhiW', '2024-04-15', '8:42 am', '8:42 am'),
(0, 5, 'biCod-5-fo2n', '2024-04-15', '2:38 pm', '2:39 pm'),
(0, 5, 'biCod-5-qU4T', '2024-04-15', '2:39 pm', '2:39 pm'),
(0, 5, 'biCod-5-xboz', '2024-04-15', '2:44 pm', '2:47 pm'),
(0, 5, 'biCod-5-4DOq', '2024-04-15', '2:49 pm', '2:50 pm'),
(0, 1, 'biCod-1-qT6Q', '2024-04-17', '10:23 am', '10:24 am'),
(0, 1, 'biCod-1-fefH', '2024-04-17', '10:24 am', '10:25 am'),
(0, 2, 'biCod-2-V5OM', '2024-04-17', '10:25 am', NULL),
(0, 1, 'biCod-1-Mzo9', '2024-04-17', '10:29 am', NULL),
(0, 2, 'biCod-2-KeqA', '2024-04-18', '7:55 am', NULL),
(0, 1, 'biCod-1-FVwZ', '2024-04-18', '10:04 am', '10:05 am'),
(0, 1, 'biCod-1-rc7P', '2024-04-18', '10:17 am', '10:19 am'),
(0, 1, 'biCod-1-W8pf', '2024-04-18', '10:19 am', '10:19 am'),
(0, 2, 'biCod-2-QqcQ', '2024-04-18', '10:19 am', '11:19 am'),
(0, 1, 'biCod-1-AlSH', '2024-04-18', '11:19 am', '11:31 am'),
(0, 6, 'biCod-6-7lX6', '2024-04-18', '11:22 am', NULL),
(0, 7, 'biCod-7-ntmC', '2024-04-18', '11:26 am', NULL),
(0, 8, 'biCod-8-Zxzp', '2024-04-18', '11:29 am', NULL),
(0, 1, 'biCod-1-C3GV', '2024-04-18', '11:32 am', NULL),
(0, 1, 'biCod-1-Axax', '2024-04-18', '11:33 am', NULL),
(0, 6, 'biCod-6-irkA', '2024-04-18', '11:46 am', NULL),
(0, 1, 'biCod-1-aGej', '2024-04-18', '2:19 pm', '04:38:14'),
(0, 1, 'biCod-1-GqCU', '2024-04-18', '4:39 pm', NULL),
(0, 1, 'biCod-1-ufrZ', '2024-04-22', '11:17 am', '11:17 am'),
(0, 5, 'biCod-5-GNqb', '2024-04-22', '2:16 pm', '2:18 pm'),
(0, 5, 'biCod-5-sppq', '2024-04-22', '3:07 pm', '3:09 pm'),
(0, 6, 'biCod-6-9zSm', '2024-04-22', '3:16 pm', NULL),
(0, 6, 'biCod-6-LhDG', '2024-04-22', '4:50 pm', '5:06 pm'),
(0, 6, 'biCod-6-9ZHE', '2024-04-22', '5:04 pm', '5:08 pm'),
(0, 5, 'biCod-5-l6RJ', '2024-04-23', '7:59 am', '8:04 am'),
(0, 1, 'biCod-1-WRs1', '2024-04-23', '5:15 pm', NULL),
(0, 1, 'biCod-1-b8ip', '2024-04-23', '5:15 pm', NULL),
(0, 6, 'biCod-6-e8bA', '2024-04-24', '8:12 am', NULL),
(0, 5, 'biCod-5-3Zp8', '2024-04-24', '8:14 am', '8:14 am'),
(0, 5, 'biCod-5-vLrS', '2024-04-24', '10:11 am', '10:12 am'),
(0, 6, 'biCod-6-bN4j', '2024-04-24', '12:25 pm', '1:23 pm'),
(0, 6, 'biCod-6-gVLL', '2024-04-24', '1:23 pm', NULL),
(0, 5, 'biCod-5-7qcm', '2024-04-24', '2:47 pm', '2:48 pm'),
(0, 5, 'biCod-5-A3Jv', '2024-04-24', '2:49 pm', '2:55 pm'),
(0, 2, 'biCod-2-Z8NF', '2024-04-24', '4:42 pm', '5:03 pm'),
(0, 6, 'biCod-6-YbzP', '2024-04-24', '5:34 pm', NULL),
(0, 6, 'biCod-6-o67L', '2024-04-25', '8:52 am', NULL),
(0, 5, 'biCod-5-ti8j', '2024-04-25', '5:01 pm', '5:02 pm'),
(0, 5, 'biCod-5-CMN8', '2024-04-26', '7:56 am', '7:57 am'),
(0, 6, 'biCod-6-HeUk', '2024-04-26', '8:53 am', NULL),
(0, 5, 'biCod-5-60oU', '2024-04-26', '8:53 am', '10:25 am'),
(0, 5, 'biCod-5-Bv8T', '2024-04-26', '11:30 am', NULL),
(0, 5, 'biCod-5-snV4', '2024-04-26', '3:35 pm', '3:36 pm'),
(0, 6, 'biCod-6-96UA', '2024-04-27', '1:07 pm', NULL),
(0, 5, 'biCod-5-VYcP', '2024-04-28', '1:38 pm', '1:38 pm'),
(0, 5, 'biCod-5-Icr5', '2024-04-28', '2:11 pm', '2:13 pm'),
(0, 5, 'biCod-5-7Clb', '2024-04-29', '3:27 pm', '3:31 pm'),
(0, 9, 'biCod-9-o4Fs', '2024-04-29', '3:29 pm', NULL),
(0, 5, 'biCod-5-Jrxx', '2024-04-29', '3:53 pm', '3:59 pm'),
(0, 9, 'biCod-9-Rw5g', '2024-04-30', '9:12 am', NULL),
(0, 9, 'biCod-9-GJa9', '2024-05-01', '2:10 pm', NULL),
(0, 9, 'biCod-9-hITp', '2024-05-01', '4:32 pm', NULL),
(0, 9, 'biCod-9-g8FW', '2024-05-02', '6:02 am', NULL),
(0, 9, 'biCod-9-P6QF', '2024-05-02', '6:02 am', NULL),
(0, 5, 'biCod-5-wCOi', '2024-05-02', '6:58 am', '7:04 am'),
(0, 5, 'biCod-5-Nbiv', '2024-05-02', '2:18 pm', '2:42 pm'),
(0, 8, 'biCod-8-BSMS', '2024-05-02', '2:19 pm', NULL),
(0, 8, 'biCod-8-g7aZ', '2024-05-02', '2:21 pm', '2:22 pm'),
(0, 2, 'biCod-2-OqPx', '2024-05-02', '4:30 pm', NULL),
(0, 8, 'biCod-8-djjD', '2024-05-02', '5:06 pm', NULL),
(0, 8, 'biCod-8-16Gm', '2024-05-02', '5:06 pm', NULL),
(0, 8, 'biCod-8-AaEt', '2024-05-02', '5:06 pm', '5:37 pm'),
(0, 8, 'biCod-8-WjuR', '2024-05-03', '8:13 am', NULL),
(0, 8, 'biCod-8-4PnS', '2024-05-03', '8:13 am', NULL),
(0, 8, 'biCod-8-8pbl', '2024-05-03', '8:13 am', '8:22 am'),
(0, 8, 'biCod-8-qZtn', '2024-05-03', '9:01 am', '9:41 am'),
(0, 8, 'biCod-8-HVyF', '2024-05-03', '10:02 am', '10:21 am'),
(0, 9, 'biCod-9-zVkY', '2024-05-03', '3:20 pm', NULL),
(0, 8, 'biCod-8-SHJp', '2024-05-05', '11:26 am', '11:34 am'),
(0, 6, 'biCod-6-icrQ', '2024-05-06', '1:48 pm', NULL),
(0, 1, 'biCod-1-mBQm', '2024-05-07', '3:49 pm', NULL),
(0, 1, 'biCod-1-Km59', '2024-05-07', '3:49 pm', '3:49 pm'),
(0, 1, 'biCod-1-bVZd', '2024-05-07', '3:50 pm', '4:36 pm'),
(0, 1, 'biCod-1-wWbU', '2024-05-07', '4:37 pm', '5:02 pm'),
(0, 1, 'biCod-1-XGGw', '2024-05-07', '5:02 pm', NULL),
(0, 1, 'biCod-1-IabH', '2024-05-08', '8:03 am', NULL),
(0, 1, 'biCod-1-0QjT', '2024-05-08', '8:29 am', NULL),
(0, 1, 'biCod-1-1Dzp', '2024-05-09', '2:06 pm', NULL),
(0, 1, 'biCod-1-QzVq', '2024-05-09', '2:06 pm', '5:16 pm'),
(0, 1, 'biCod-1-XCrj', '2024-05-10', '8:05 am', '10:50 am'),
(0, 1, 'biCod-1-fN5q', '2024-05-10', '10:51 am', '11:11 am'),
(0, 1, 'biCod-1-cXfQ', '2024-05-10', '11:11 am', NULL),
(0, 1, 'biCod-1-4ATa', '2024-05-10', '12:51 pm', '12:52 pm'),
(0, 1, 'biCod-1-7mh7', '2024-05-10', '12:52 pm', '12:53 pm'),
(0, 1, 'biCod-1-l3Op', '2024-05-10', '12:53 pm', '1:07 pm'),
(0, 1, 'biCod-1-oWWj', '2024-05-13', '8:09 am', NULL),
(0, 1, 'biCod-1-3kwr', '2024-05-13', '8:09 am', '9:38 am'),
(0, 13, 'biCod-13-XP7U', '2024-05-13', '9:39 am', '10:51 am'),
(0, 13, 'biCod-13-LEJc', '2024-05-13', '10:53 am', '10:56 am'),
(0, 1, 'biCod-1-jRtz', '2024-05-13', '4:10 pm', NULL),
(0, 1, 'biCod-1-5Y4k', '2024-05-13', '4:15 pm', '5:03 pm'),
(0, 1, 'biCod-1-w6AC', '2024-05-13', '5:05 pm', NULL),
(0, 1, 'biCod-1-dIpO', '2024-05-14', '9:15 am', '9:16 am'),
(0, 1, 'biCod-1-ljyK', '2024-05-14', '9:17 am', '9:18 am'),
(0, 12, 'biCod-12-QItq', '2024-05-14', '9:18 am', '9:18 am'),
(0, 12, 'biCod-12-iZGa', '2024-05-14', '9:18 am', NULL),
(0, 12, 'biCod-12-H1y1', '2024-05-14', '9:25 am', '11:06 am'),
(0, 12, 'biCod-12-xJ6d', '2024-05-14', '11:06 am', '12:09 pm'),
(0, 12, 'biCod-12-x0A6', '2024-05-14', '2:00 pm', NULL),
(0, 12, 'biCod-12-V684', '2024-05-14', '2:00 pm', NULL),
(0, 12, 'biCod-12-RmPe', '2024-05-14', '4:15 pm', NULL),
(0, 12, 'biCod-12-6tmw', '2024-05-14', '4:15 pm', '5:05 pm'),
(0, 12, 'biCod-12-YOj1', '2024-05-15', '7:57 am', '8:21 am'),
(0, 1, 'biCod-1-ZUjL', '2024-05-15', '8:32 am', '8:33 am'),
(0, 12, 'biCod-12-lckQ', '2024-05-15', '8:33 am', NULL),
(0, 12, 'biCod-12-LzZg', '2024-05-15', '9:35 am', '10:02 am'),
(0, 12, 'biCod-12-BSDv', '2024-05-15', '10:02 am', '11:58 am'),
(0, 12, 'biCod-12-bu9L', '2024-05-15', '11:59 am', NULL),
(0, 12, 'biCod-12-gqfZ', '2024-05-15', '2:00 pm', NULL),
(0, 12, 'biCod-12-U5Kl', '2024-05-16', '8:23 am', '11:37 am'),
(0, 12, 'biCod-12-MEJH', '2024-05-16', '11:37 am', '3:47 pm'),
(0, 12, 'biCod-12-fY3j', '2024-05-16', '3:49 pm', NULL),
(0, 12, 'biCod-12-xeGs', '2024-05-16', '4:13 pm', NULL),
(0, 12, 'biCod-12-ghhP', '2024-05-17', '8:02 am', '12:05 pm'),
(0, 12, 'biCod-12-wI8U', '2024-05-17', '3:38 pm', '5:02 pm'),
(0, 12, 'biCod-12-JNkO', '2024-05-17', '4:37 pm', NULL),
(0, 12, 'biCod-12-LCFE', '2024-05-20', '7:58 am', '4:39 pm'),
(0, 12, 'biCod-12-ZsOt', '2024-05-20', '3:50 pm', '4:42 pm'),
(0, 12, 'biCod-12-IW4d', '2024-05-21', '10:11 am', '10:16 am'),
(0, 12, 'biCod-12-hrVZ', '2024-05-21', '10:16 am', '10:52 am'),
(0, 12, 'biCod-12-WpA5', '2024-05-21', '3:23 pm', '3:24 pm'),
(0, 12, 'biCod-12-7Oac', '2024-05-21', '4:22 pm', NULL),
(0, 12, 'biCod-12-KjT5', '2024-05-22', '8:11 am', '9:48 am'),
(0, 12, 'biCod-12-1EmU', '2024-05-22', '9:51 am', '11:36 am'),
(0, 12, 'biCod-12-GpZ6', '2024-05-22', '2:00 pm', '2:23 pm'),
(0, 12, 'biCod-12-YUBq', '2024-05-22', '2:24 pm', '2:44 pm'),
(0, 12, 'biCod-12-xrVd', '2024-05-22', '2:44 pm', '2:45 pm');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `table_user`
--

CREATE TABLE `table_user` (
  `user_id` int(11) NOT NULL,
  `user_ci` int(11) DEFAULT NULL,
  `user_nick` varchar(50) DEFAULT NULL,
  `user_pass` text DEFAULT NULL,
  `user_nombres` varchar(50) DEFAULT NULL,
  `user_apellidos` varchar(50) DEFAULT NULL,
  `user_email` varchar(100) DEFAULT NULL,
  `user_tlf` varchar(20) DEFAULT NULL,
  `user_rol` int(11) DEFAULT NULL,
  `user_status` int(11) DEFAULT NULL,
  `user_img` text DEFAULT NULL,
  `user_registro` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `user_ruta` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `table_user`
--

INSERT INTO `table_user` (`user_id`, `user_ci`, `user_nick`, `user_pass`, `user_nombres`, `user_apellidos`, `user_email`, `user_tlf`, `user_rol`, `user_status`, `user_img`, `user_registro`, `user_ruta`) VALUES
(1, 2000000, 'ADMIN', 'ODEvZ0hkUFRKQkkyenppY2puNXFKQT09', 'Admin', 'Admin', 'admin@admin', '5555555555', 1, 1, 'storage/ADMIN/default.png', '2024-04-15 12:29:22', 'system/app/Views/Docs/AUN-01/'),
(12, 14607920, 'will', 'OCs4Z1hFT083MklFOU15V1NpMS9jdz09', 'Wiliam', 'Infante', 'william21enrique@gmail.com', '4125181629', 1, 1, 'storage/WI-012/default.png', '2024-05-15 15:58:37', 'storage/WI-012/'),
(13, 15769775, 'YN-013', 'OCs4Z1hFT083MklFOU15V1NpMS9jdz09', 'Ybet', 'Nacari', 'ybet.naca@gmail.com', '4120586480', 2, 1, 'storage/YN-013/default.png', '2024-05-13 14:49:34', 'storage/YN-013/');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `table_user_rol`
--

CREATE TABLE `table_user_rol` (
  `id_usuario_rol` int(11) NOT NULL,
  `user_nick` varchar(45) DEFAULT NULL,
  `id_rol` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `table_user_rol`
--

INSERT INTO `table_user_rol` (`id_usuario_rol`, `user_nick`, `id_rol`) VALUES
(1, 'ADMIN', 1),
(17, 'WI-011', 1),
(18, 'will', 1),
(19, 'YN-013', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `v_timeline`
--

CREATE TABLE `v_timeline` (
  `login` varchar(50) DEFAULT NULL,
  `nombres` varchar(50) DEFAULT NULL,
  `apellidos` varchar(50) DEFAULT NULL,
  `rol` varchar(45) DEFAULT NULL,
  `id` int(11) DEFAULT NULL,
  `codigo` varchar(45) DEFAULT NULL,
  `fecha` varchar(20) DEFAULT NULL,
  `inicio` varchar(20) DEFAULT NULL,
  `fin` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `table_cierre`
--
ALTER TABLE `table_cierre`
  ADD PRIMARY KEY (`id_table_cierre`);

--
-- Indices de la tabla `table_log`
--
ALTER TABLE `table_log`
  ADD PRIMARY KEY (`log_id`),
  ADD KEY `log_idUser_idx` (`log_idUser`);

--
-- Indices de la tabla `table_tasa_dia`
--
ALTER TABLE `table_tasa_dia`
  ADD PRIMARY KEY (`id_tasa_dia`);

--
-- Indices de la tabla `table_ticket_venta`
--
ALTER TABLE `table_ticket_venta`
  ADD PRIMARY KEY (`id_ticket_venta`);

--
-- Indices de la tabla `table_user`
--
ALTER TABLE `table_user`
  ADD PRIMARY KEY (`user_id`);

--
-- Indices de la tabla `table_user_rol`
--
ALTER TABLE `table_user_rol`
  ADD PRIMARY KEY (`id_usuario_rol`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `table_cierre`
--
ALTER TABLE `table_cierre`
  MODIFY `id_table_cierre` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT de la tabla `table_log`
--
ALTER TABLE `table_log`
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `table_tasa_dia`
--
ALTER TABLE `table_tasa_dia`
  MODIFY `id_tasa_dia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `table_ticket_venta`
--
ALTER TABLE `table_ticket_venta`
  MODIFY `id_ticket_venta` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=93;

--
-- AUTO_INCREMENT de la tabla `table_user`
--
ALTER TABLE `table_user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `table_user_rol`
--
ALTER TABLE `table_user_rol`
  MODIFY `id_usuario_rol` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `table_log`
--
ALTER TABLE `table_log`
  ADD CONSTRAINT `log_idUser` FOREIGN KEY (`log_idUser`) REFERENCES `table_user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

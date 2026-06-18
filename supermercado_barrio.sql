-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 16-06-2026 a las 15:41:12
-- Versión del servidor: 8.0.30
-- Versión de PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `supermercado_barrio`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id_cliente` int NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `numero_cliente` varchar(20) DEFAULT NULL,
  `cedula` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id_cliente`, `nombre`, `numero_cliente`, `cedula`) VALUES
(1, 'Juan David Perez', '3004567891', '1001234561'),
(2, 'Maria Fernanda Lopez', '3015678923', '1001234562'),
(3, 'Carlos Andres Diaz', '3026789456', '1001234563'),
(4, 'Luisa Fernanda Ruiz', '3037891234', '1001234564'),
(5, 'Andres Felipe Gomez', '3048912345', '1001234565'),
(6, 'Valeria Martinez', '3059123456', '1001234566'),
(7, 'Camilo Torres', '3101234567', '1001234567'),
(8, 'Paola Rojas', '3112345678', '1001234568'),
(9, 'Jhonatan Silva', '3123456789', '1001234569'),
(10, 'Natalia Herrera', '3134567890', '1001234570'),
(11, 'Sergio Castro', '3145678901', '1001234571'),
(12, 'Laura Mendoza', '3156789012', '1001234572'),
(13, 'Felipe Vargas', '3167890123', '1001234573'),
(14, 'Daniela Acosta', '3178901234', '1001234574'),
(15, 'Sebastian Moreno', '3189012345', '1001234575'),
(16, 'Carolina Pardo', '3190123456', '1001234576'),
(17, 'Miguel Leon', '3201234567', '1001234577'),
(18, 'Andrea Suarez', '3212345678', '1001234578'),
(19, 'Jorge Jimenez', '3223456789', '1001234579'),
(20, 'Tatiana Reyes', '3234567890', '1001234580'),
(21, 'Kevin Ortiz', '3245678901', '1001234581'),
(22, 'Sara Navarro', '3256789012', '1001234582'),
(23, 'Oscar Molina', '3267890123', '1001234583'),
(24, 'Monica Valencia', '3278901234', '1001234584'),
(25, 'Ricardo Romero', '3009876543', '1001234585'),
(26, 'Patricia Vega', '3018765432', '1001234586'),
(27, 'David Cifuentes', '3027654321', '1001234587'),
(28, 'Angela Parra', '3036543210', '1001234588'),
(29, 'Cristian Fuentes', '3045432109', '1001234589'),
(30, 'Karen Guerrero', '3054321098', '1001234590'),
(31, 'Mauricio Salazar', '3107654321', '1001234591'),
(32, 'Gabriela Cano', '3118765432', '1001234592'),
(33, 'Fernando Peña', '3129876543', '1001234593'),
(34, 'Catalina Arias', '3130987654', '1001234594'),
(35, 'Ivan Lozano', '3141098765', '1001234595'),
(100, 'Cliente_externo', '123', '123');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleados`
--

CREATE TABLE `empleados` (
  `id_empleado` int NOT NULL,
  `nombre_empleado` varchar(50) DEFAULT NULL,
  `correo_empleado` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `empleados`
--

INSERT INTO `empleados` (`id_empleado`, `nombre_empleado`, `correo_empleado`) VALUES
(1, 'Carlos Ramirez', 'carram@supermercado.com'),
(2, 'Laura Gomez', 'laugom@supermercado.com'),
(3, 'Andres Martinez', 'andmar@supermercado.com'),
(4, 'Sofia Herrera', 'sofher@supermercado.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inventario`
--

CREATE TABLE `inventario` (
  `id_inventario` int NOT NULL,
  `id_producto` int DEFAULT NULL,
  `cantidad_stock` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `inventario`
--

INSERT INTO `inventario` (`id_inventario`, `id_producto`, `cantidad_stock`) VALUES
(1, 1, 120),
(2, 2, 45),
(3, 3, 90),
(4, 4, 60),
(5, 5, 40),
(6, 6, 97),
(7, 7, 40),
(8, 8, 80),
(9, 9, 95),
(10, 10, 60),
(11, 11, 75),
(12, 12, 55),
(13, 13, 65),
(14, 14, 150),
(15, 15, 110),
(16, 16, 35),
(17, 17, 85),
(18, 18, 48),
(19, 19, 36),
(20, 20, 78),
(21, 21, 67),
(22, 22, 52),
(23, 23, 30),
(24, 24, 25),
(25, 25, 58),
(26, 26, 95),
(27, 27, 73),
(28, 28, 88),
(29, 29, 62),
(30, 30, 23),
(31, 31, 57),
(32, 32, 20),
(33, 33, 140),
(34, 34, 38),
(35, 35, 46),
(36, 36, 66),
(37, 37, 54),
(38, 38, 61),
(39, 39, 44),
(40, 40, 49),
(41, 41, 18),
(42, 42, 36),
(43, 43, 28),
(44, 44, 39),
(45, 45, 22),
(46, 46, 200),
(47, 47, 120),
(48, 48, 170),
(49, 49, 31),
(50, 50, 145),
(51, 51, 120),
(52, 52, 100),
(53, 53, 90),
(54, 54, 80),
(55, 55, 70),
(56, 56, 60),
(57, 57, 50),
(58, 58, 40),
(59, 59, 30),
(60, 60, 20);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id_producto` int NOT NULL,
  `nombre_producto` varchar(50) DEFAULT NULL,
  `precio` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id_producto`, `nombre_producto`, `precio`) VALUES
(1, 'Arroz Diana 1Kg', 4500.00),
(2, 'Aceite Gourmet 1L', 18500.00),
(3, 'Leche Alqueria 1L', 4200.00),
(4, 'Huevos AA x12', 12000.00),
(5, 'Pan Bimbo Blanco', 7500.00),
(6, 'Azucar Manuelita 1Kg', 4800.00),
(7, 'Cafe Aguila Roja 500g', 14500.00),
(8, 'Sal Refisal 500g', 2500.00),
(9, 'Pasta Doria 250g', 3200.00),
(10, 'Atun Van Camps', 6500.00),
(11, 'Gaseosa Coca Cola 1.5L', 7200.00),
(12, 'Jugo Hit Mango 1L', 5500.00),
(13, 'Papas Margarita', 4800.00),
(14, 'Chocolate Jet', 2500.00),
(15, 'Galletas Oreo', 4200.00),
(16, 'Detergente Ariel 1Kg', 18500.00),
(17, 'Jabon Rey', 3500.00),
(18, 'Papel Higienico Familia x4', 9800.00),
(19, 'Shampoo Sedal', 14500.00),
(20, 'Crema Dental Colgate', 6200.00),
(21, 'Cepillo Oral B', 8500.00),
(22, 'Desodorante Rexona', 11800.00),
(23, 'Pollo Entero Kg', 14500.00),
(24, 'Carne Molida Kg', 24000.00),
(25, 'Manzanas Kg', 7800.00),
(26, 'Banano Kg', 3200.00),
(27, 'Tomate Kg', 4500.00),
(28, 'Papa Pastusa Kg', 2800.00),
(29, 'Cebolla Cabezona Kg', 3600.00),
(30, 'Queso Campesino Kg', 18500.00),
(31, 'Yogurt Alpina', 4200.00),
(32, 'Helado Popsy', 8500.00),
(33, 'Agua Cristal 600ml', 2500.00),
(34, 'Cereal Zucaritas', 16500.00),
(35, 'Mantequilla Rama', 6200.00),
(36, 'Harina PAN 1Kg', 5800.00),
(37, 'Frijol Cargamanto 1Kg', 9200.00),
(38, 'Lentejas 1Kg', 6800.00),
(39, 'Mayonesa Fruco', 8900.00),
(40, 'Salsa de Tomate Fruco', 7600.00),
(41, 'Pizza Congelada', 22000.00),
(42, 'Salchichas Zenú', 9800.00),
(43, 'Jamón Pietrán', 12500.00),
(44, 'Avena Quaker', 7800.00),
(45, 'Cafe Juan Valdez 340g', 28500.00),
(46, 'Cerveza Poker Lata', 3800.00),
(47, 'Energizante Vive100', 3200.00),
(48, 'Chocoramo', 2800.00),
(49, 'Helado Crem Helado', 6500.00),
(50, 'Gomitas Trululu', 2500.00),
(51, 'Arroz Integral', 4500.00),
(52, 'Pasta Espagueti', 3200.00),
(53, 'Leche Deslactosada', 5500.00),
(54, 'Atun Enlatado', 6800.00),
(55, 'Aceite Vegetal', 12000.00),
(56, 'Detergente Liquido', 14500.00),
(57, 'Jabon Antibacterial', 3800.00),
(58, 'Limpiador Multiusos', 8900.00),
(59, 'Suavizante Ropa', 13500.00),
(60, 'Desinfectante Piso', 7600.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `id_venta` int NOT NULL,
  `id_producto` int DEFAULT NULL,
  `id_cliente` int DEFAULT NULL,
  `id_empleado` int DEFAULT NULL,
  `fecha_venta` date DEFAULT NULL,
  `cantidad` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `ventas`
--

INSERT INTO `ventas` (`id_venta`, `id_producto`, `id_cliente`, `id_empleado`, `fecha_venta`, `cantidad`) VALUES
(1, 5, 12, 1, '2026-05-01', 2),
(2, 18, 3, 2, '2026-05-01', 1),
(3, 5, 20, 3, '2026-05-02', 4),
(4, 31, 7, 4, '2026-05-02', 2),
(5, 12, 15, 1, '2026-05-03', 1),
(6, 8, 22, 2, '2026-05-03', 3),
(7, 25, 9, 3, '2026-05-04', 2),
(8, 14, 30, 4, '2026-05-04', 1),
(9, 41, 11, 1, '2026-05-05', 5),
(10, 6, 18, 2, '2026-05-05', 2),
(11, 33, 25, 3, '2026-05-06', 1),
(12, 9, 14, 4, '2026-05-06', 3),
(13, 27, 4, 1, '2026-05-07', 2),
(14, 19, 31, 2, '2026-05-07', 1),
(15, 2, 8, 3, '2026-05-08', 4),
(16, 44, 21, 4, '2026-05-08', 2),
(17, 15, 10, 1, '2026-05-09', 3),
(18, 38, 17, 2, '2026-05-09', 1),
(19, 22, 24, 3, '2026-05-10', 2),
(20, 7, 13, 4, '2026-05-10', 1),
(21, 48, 2, 1, '2026-05-11', 4),
(22, 11, 19, 2, '2026-05-11', 2),
(23, 29, 6, 3, '2026-05-12', 1),
(24, 17, 28, 4, '2026-05-12', 3),
(25, 36, 5, 1, '2026-05-13', 2),
(26, 4, 16, 2, '2026-05-13', 1),
(27, 21, 35, 3, '2026-05-14', 5),
(28, 13, 1, 4, '2026-05-14', 2),
(29, 52, 23, 1, '2026-05-15', 1),
(30, 10, 27, 2, '2026-05-15', 3),
(31, 30, 12, 3, '2026-05-16', 2),
(32, 24, 20, 4, '2026-05-16', 1),
(33, 3, 9, 1, '2026-05-17', 4),
(34, 42, 14, 2, '2026-05-17', 2),
(35, 16, 32, 3, '2026-05-18', 1),
(36, 20, 18, 4, '2026-05-18', 3),
(37, 35, 7, 1, '2026-05-19', 2),
(38, 45, 22, 2, '2026-05-19', 1),
(39, 28, 3, 3, '2026-05-20', 4),
(40, 8, 25, 4, '2026-05-20', 2),
(41, 54, 11, 1, '2026-05-21', 1),
(42, 23, 15, 2, '2026-05-21', 3),
(43, 12, 5, 3, '2026-05-22', 2),
(44, 47, 30, 4, '2026-05-22', 1),
(45, 26, 17, 1, '2026-05-23', 5),
(46, 18, 8, 2, '2026-05-23', 2),
(47, 6, 21, 3, '2026-05-24', 1),
(48, 37, 10, 4, '2026-05-24', 3),
(49, 55, 13, 1, '2026-05-25', 2),
(50, 32, 24, 2, '2026-05-25', 1),
(51, 14, 2, 3, '2026-05-26', 4),
(52, 40, 34, 4, '2026-05-26', 2),
(53, 11, 19, 1, '2026-05-27', 1),
(54, 59, 6, 2, '2026-05-27', 3),
(55, 22, 29, 3, '2026-05-28', 2),
(56, 7, 16, 4, '2026-05-28', 1),
(57, 49, 4, 1, '2026-05-29', 5),
(58, 15, 26, 2, '2026-05-29', 2),
(59, 34, 1, 3, '2026-05-30', 1),
(60, 9, 35, 4, '2026-05-30', 3),
(61, 53, 12, 1, '2026-06-01', 2),
(62, 20, 23, 2, '2026-06-01', 1),
(63, 43, 7, 3, '2026-06-02', 4),
(64, 17, 18, 4, '2026-06-02', 2),
(65, 60, 27, 1, '2026-06-03', 1),
(66, 5, 31, 2, '2026-06-03', 3),
(67, 25, 14, 3, '2026-06-04', 2),
(68, 38, 9, 4, '2026-06-04', 1),
(69, 12, 20, 1, '2026-06-05', 4),
(70, 57, 11, 2, '2026-06-05', 2),
(71, 30, 5, 3, '2026-06-06', 1),
(72, 21, 22, 4, '2026-06-06', 3),
(73, 46, 3, 1, '2026-06-07', 2),
(74, 16, 28, 2, '2026-06-07', 1),
(76, 6, 100, 3, '2026-06-13', 3),
(77, 19, 100, 1, '2026-06-13', 6);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id_cliente`);

--
-- Indices de la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD PRIMARY KEY (`id_empleado`);

--
-- Indices de la tabla `inventario`
--
ALTER TABLE `inventario`
  ADD PRIMARY KEY (`id_inventario`),
  ADD KEY `id_producto` (`id_producto`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id_producto`);

--
-- Indices de la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`id_venta`),
  ADD KEY `id_producto` (`id_producto`),
  ADD KEY `id_empleado` (`id_empleado`),
  ADD KEY `id_cliente` (`id_cliente`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id_cliente` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT de la tabla `empleados`
--
ALTER TABLE `empleados`
  MODIFY `id_empleado` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT de la tabla `inventario`
--
ALTER TABLE `inventario`
  MODIFY `id_inventario` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id_producto` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT de la tabla `ventas`
--
ALTER TABLE `ventas`
  MODIFY `id_venta` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `inventario`
--
ALTER TABLE `inventario`
  ADD CONSTRAINT `inventario_ibfk_1` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`);

--
-- Filtros para la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD CONSTRAINT `ventas_ibfk_1` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`),
  ADD CONSTRAINT `ventas_ibfk_2` FOREIGN KEY (`id_empleado`) REFERENCES `empleados` (`id_empleado`),
  ADD CONSTRAINT `ventas_ibfk_3` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

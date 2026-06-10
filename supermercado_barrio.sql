-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 14-05-2026 a las 03:44:59
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
  `numero_cliente` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id_cliente`, `nombre`, `numero_cliente`) VALUES
(1, 'Juan David Perez', '3004567891'),
(2, 'Maria Fernanda Lopez', '3015678923'),
(3, 'Carlos Andres Diaz', '3026789456'),
(4, 'Luisa Fernanda Ruiz', '3037891234'),
(5, 'Andres Felipe Gomez', '3048912345'),
(6, 'Valeria Martinez', '3059123456'),
(7, 'Camilo Torres', '3101234567'),
(8, 'Paola Rojas', '3112345678'),
(9, 'Jhonatan Silva', '3123456789'),
(10, 'Natalia Herrera', '3134567890'),
(11, 'Sergio Castro', '3145678901'),
(12, 'Laura Mendoza', '3156789012'),
(13, 'Felipe Vargas', '3167890123'),
(14, 'Daniela Acosta', '3178901234'),
(15, 'Sebastian Moreno', '3189012345'),
(16, 'Carolina Pardo', '3190123456'),
(17, 'Miguel Leon', '3201234567'),
(18, 'Andrea Suarez', '3212345678'),
(19, 'Jorge Jimenez', '3223456789'),
(20, 'Tatiana Reyes', '3234567890'),
(21, 'Kevin Ortiz', '3245678901'),
(22, 'Sara Navarro', '3256789012'),
(23, 'Oscar Molina', '3267890123'),
(24, 'Monica Valencia', '3278901234'),
(25, 'Ricardo Romero', '3009876543'),
(26, 'Patricia Vega', '3018765432'),
(27, 'David Cifuentes', '3027654321'),
(28, 'Angela Parra', '3036543210'),
(29, 'Cristian Fuentes', '3045432109'),
(30, 'Karen Guerrero', '3054321098'),
(31, 'Mauricio Salazar', '3107654321'),
(32, 'Gabriela Cano', '3118765432'),
(33, 'Fernando Peña', '3129876543'),
(34, 'Catalina Arias', '3130987654'),
(35, 'Ivan Lozano', '3141098765'),
(36, 'Melissa Cardona', '3152109876'),
(37, 'Samuel Mejia', '3163210987'),
(38, 'Viviana Ospina', '3174321098'),
(39, 'Hector Giraldo', '3185432109'),
(40, 'Liliana Cabrera', '3196543210'),
(41, 'Brayan Prieto', '3207654981'),
(42, 'Yesica Medina', '3218765492'),
(43, 'Jonathan Bonilla', '3229876503'),
(44, 'Carolina Delgado', '3231987614'),
(45, 'Mateo Franco', '3242098725'),
(46, 'Juliana Quintero', '3253109836'),
(47, 'Alejandro Rincon', '3264210947'),
(48, 'Camila Beltran', '3275321058'),
(49, 'Sofia Nieto', '3286432169'),
(50, 'Nicolas Gallego', '3297543270');

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
(4, 'Sofia Herrera', 'sofher@supermercado.com'),
(5, 'Juan Torres', 'juator@supermercado.com'),
(6, 'Valentina Castro', 'valcas@supermercado.com'),
(7, 'Miguel Rojas', 'migroj@supermercado.com'),
(8, 'Daniela Vargas', 'danvar@supermercado.com'),
(9, 'Felipe Moreno', 'felmor@supermercado.com'),
(10, 'Camila Ruiz', 'camrui@supermercado.com'),
(11, 'Sebastian Diaz', 'sebdia@supermercado.com'),
(12, 'Paula Mendoza', 'paumen@supermercado.com'),
(13, 'Nicolas Silva', 'nicsil@supermercado.com'),
(14, 'Mariana Pardo', 'marpar@supermercado.com'),
(15, 'Alejandro Leon', 'aleleo@supermercado.com'),
(16, 'Natalia Suarez', 'natsua@supermercado.com'),
(17, 'David Jimenez', 'davjim@supermercado.com'),
(18, 'Juliana Reyes', 'julrey@supermercado.com'),
(19, 'Kevin Ortiz', 'kevort@supermercado.com'),
(20, 'Sara Navarro', 'sarnav@supermercado.com'),
(21, 'Esteban Acosta', 'estaco@supermercado.com'),
(22, 'Luisa Molina', 'luimol@supermercado.com'),
(23, 'Jorge Valencia', 'jorval@supermercado.com'),
(24, 'Tatiana Romero', 'tatrom@supermercado.com'),
(25, 'Cristian Vega', 'criveg@supermercado.com'),
(26, 'Karen Cifuentes', 'karcif@supermercado.com'),
(27, 'Diego Parra', 'diepar@supermercado.com'),
(28, 'Angela Fuentes', 'angfue@supermercado.com'),
(29, 'Oscar Guerrero', 'oscgue@supermercado.com'),
(30, 'Monica Salazar', 'monsal@supermercado.com'),
(31, 'Ricardo Cano', 'riccan@supermercado.com'),
(32, 'Andrea Peña', 'andpen@supermercado.com'),
(33, 'Santiago Arias', 'sanaar@supermercado.com'),
(34, 'Patricia Lozano', 'patloz@supermercado.com'),
(35, 'Mauricio Cardona', 'maucar@supermercado.com'),
(36, 'Gabriela Mejia', 'gabmej@supermercado.com'),
(37, 'Fernando Ospina', 'ferosp@supermercado.com'),
(38, 'Catalina Giraldo', 'catgir@supermercado.com'),
(39, 'Ivan Cabrera', 'ivacab@supermercado.com'),
(40, 'Melissa Prieto', 'melpri@supermercado.com'),
(41, 'Samuel Medina', 'sammed@supermercado.com'),
(42, 'Viviana Bonilla', 'vivbon@supermercado.com'),
(43, 'Hector Delgado', 'hecdel@supermercado.com'),
(44, 'Daniel Perez', 'danper@supermercado.com'),
(45, 'Liliana Franco', 'lifran@supermercado.com'),
(46, 'Brayan Quintero', 'braqui@supermercado.com'),
(47, 'Yesica Rincon', 'yesrin@supermercado.com'),
(48, 'Jonathan Beltran', 'jonbel@supermercado.com'),
(49, 'Carolina Nieto', 'carnie@supermercado.com'),
(50, 'Mateo Gallego', 'matgal@supermercado.com');

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
(6, 6, 100),
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
(19, 19, 42),
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
(50, 50, 145);

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
(50, 'Gomitas Trululu', 2500.00);

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
(1, 1, 5, 3, '2026-04-20', 0),
(2, 2, 10, 7, '2026-05-01', 1),
(3, 3, 15, 12, '2026-05-02', 4),
(4, 4, 20, 5, '2026-05-02', 2),
(5, 5, 25, 9, '2026-04-20', 0),
(6, 6, 30, 14, '2026-05-03', 2),
(7, 7, 35, 8, '2026-04-20', 1),
(8, 8, 40, 11, '2026-05-04', 3),
(9, 9, 45, 2, '2026-05-05', 5),
(10, 10, 50, 6, '2026-05-05', 2),
(11, 11, 1, 15, '2026-05-06', 4),
(12, 12, 2, 4, '2026-05-06', 0),
(13, 13, 3, 18, '2026-05-07', 3),
(14, 14, 4, 20, '2026-05-07', 2),
(15, 15, 5, 1, '2026-05-08', 6),
(16, 16, 6, 13, '2026-05-08', 1),
(17, 17, 7, 16, '2026-05-09', 2),
(18, 18, 8, 10, '2026-05-09', 3),
(19, 19, 9, 19, '2026-05-10', 1),
(20, 20, 10, 1, '2026-05-10', 0),
(21, 21, 11, 17, '2026-05-11', 1),
(22, 22, 12, 22, '2026-04-20', 4),
(23, 23, 13, 25, '2026-05-12', 2),
(24, 24, 14, 24, '2026-05-12', 1),
(25, 25, 15, 27, '2026-05-13', 3),
(26, 26, 16, 29, '2026-05-13', 5),
(27, 27, 17, 30, '2026-05-14', 2),
(28, 28, 18, 31, '2026-05-14', 1),
(29, 29, 19, 32, '2026-05-15', 2),
(30, 30, 20, 33, '2026-05-15', 4),
(31, 31, 21, 34, '2026-05-16', 3),
(32, 32, 22, 35, '2026-05-16', 1),
(33, 33, 23, 36, '2026-05-17', 2),
(34, 34, 24, 37, '2026-05-17', 1),
(35, 35, 25, 38, '2026-05-18', 2),
(36, 36, 26, 39, '2026-05-18', 3),
(37, 37, 27, 40, '2026-05-19', 1),
(38, 38, 28, 41, '2026-05-19', 2),
(39, 39, 29, 42, '2026-05-20', 4),
(40, 40, 30, 43, '2026-05-20', 1),
(41, 41, 31, 44, '2026-05-21', 2),
(42, 42, 32, 45, '2026-05-21', 1),
(43, 43, 33, 46, '2026-05-22', 3),
(44, 44, 34, 47, '2026-05-22', 2),
(45, 45, 35, 48, '2026-05-23', 1),
(46, 46, 36, 49, '2026-05-23', 6),
(47, 47, 37, 50, '2026-05-24', 3),
(48, 48, 38, 5, '2026-05-24', 0),
(49, 49, 39, 8, '2026-05-25', 2),
(50, 50, 40, 11, '2026-05-25', 4);

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
  MODIFY `id_cliente` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT de la tabla `empleados`
--
ALTER TABLE `empleados`
  MODIFY `id_empleado` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT de la tabla `inventario`
--
ALTER TABLE `inventario`
  MODIFY `id_inventario` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id_producto` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT de la tabla `ventas`
--
ALTER TABLE `ventas`
  MODIFY `id_venta` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

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

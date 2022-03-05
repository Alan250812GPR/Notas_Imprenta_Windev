-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.6.5-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para imprenta
CREATE DATABASE IF NOT EXISTS `imprenta` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `imprenta`;

-- Volcando estructura para tabla imprenta.clientes
CREATE TABLE IF NOT EXISTS `clientes` (
  `IdCliente` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(200) NOT NULL DEFAULT 'Sin Nombre',
  `Domicilio` varchar(200) NOT NULL DEFAULT 'Sin domicilio',
  `Ciudad` varchar(50) NOT NULL DEFAULT 'Sin Ciudad',
  `Estado` varchar(50) NOT NULL DEFAULT 'Jalisco',
  `Pais` varchar(50) NOT NULL DEFAULT 'Mexico',
  `Cell` varchar(15) DEFAULT NULL,
  `Telefono` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`IdCliente`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla imprenta.clientes: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT IGNORE INTO `clientes` (`IdCliente`, `Nombre`, `Domicilio`, `Ciudad`, `Estado`, `Pais`, `Cell`, `Telefono`) VALUES
	(1, 'Alan Parra', 'Agustin ibarra 24', 'Ahualulco', 'Jalisco', 'Mexico', '7778289002', NULL),
	(2, 'Alexia Carrillo', 'Prolongacion 5 de mayo 96', 'Ahualulco', 'Jalisco', 'Mexico', '3328912491', '0000000000');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;

-- Volcando estructura para tabla imprenta.entradas_y_salidas
CREATE TABLE IF NOT EXISTS `entradas_y_salidas` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Cantidad` decimal(20,2) NOT NULL DEFAULT 0.00,
  `Entrada_Salida` varchar(1) NOT NULL DEFAULT '0',
  `Fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `Motivo` varchar(50) DEFAULT 'Ingreso',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla imprenta.entradas_y_salidas: ~6 rows (aproximadamente)
/*!40000 ALTER TABLE `entradas_y_salidas` DISABLE KEYS */;
INSERT IGNORE INTO `entradas_y_salidas` (`Id`, `Cantidad`, `Entrada_Salida`, `Fecha`, `Motivo`) VALUES
	(9, 200.00, 'E', '2022-02-07 15:28:23', 'Ingreso'),
	(10, 300.00, 'S', '2022-02-07 15:28:41', 'Egreso'),
	(11, 1750.00, 'E', '2022-02-07 15:33:00', ''),
	(12, 100.00, 'E', '2022-02-07 16:38:37', '250815'),
	(13, 400.00, 'E', '2022-02-07 21:58:50', '250816'),
	(14, 0.00, 'E', '2022-02-07 22:21:56', '250817');
/*!40000 ALTER TABLE `entradas_y_salidas` ENABLE KEYS */;

-- Volcando estructura para vista imprenta.notas_clientes
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `notas_clientes` (
	`Folio` VARCHAR(50) NOT NULL COLLATE 'latin1_swedish_ci',
	`Cliente` VARCHAR(200) NULL COLLATE 'latin1_swedish_ci',
	`Total_Pedido` DECIMAL(20,2) NOT NULL,
	`Anticipo` DECIMAL(20,2) NOT NULL,
	`Restante` DECIMAL(20,2) NOT NULL,
	`Fecha` TIMESTAMP NOT NULL,
	`Pagado` VARCHAR(6) NULL COLLATE 'utf8mb4_general_ci'
) ENGINE=MyISAM;

-- Volcando estructura para tabla imprenta.notas_contenido
CREATE TABLE IF NOT EXISTS `notas_contenido` (
  `IdControl` int(11) NOT NULL AUTO_INCREMENT,
  `Folio` varchar(50) NOT NULL DEFAULT 'Folio',
  `Renglon` int(11) NOT NULL DEFAULT 1,
  `Descripcion` varchar(50) DEFAULT NULL,
  `Cantidad` int(11) NOT NULL DEFAULT 1,
  `Precio` decimal(20,2) NOT NULL DEFAULT 0.00,
  `Codigo_Producto` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`IdControl`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla imprenta.notas_contenido: ~6 rows (aproximadamente)
/*!40000 ALTER TABLE `notas_contenido` DISABLE KEYS */;
INSERT IGNORE INTO `notas_contenido` (`IdControl`, `Folio`, `Renglon`, `Descripcion`, `Cantidad`, `Precio`, `Codigo_Producto`) VALUES
	(8, '250813', 1, 'Millar Tarjetas', 2, 500.00, '1'),
	(9, '250814', 1, 'Millar Tarjetas', 5, 1250.00, '1'),
	(10, '250814', 2, 'Millar Tarjetas', 3, 750.00, '1'),
	(11, '250815', 1, 'Millar Tarjetas', 2, 500.00, '1'),
	(12, '250816', 1, 'Millar Tarjetas', 1, 250.00, '1'),
	(13, '250816', 2, '1000 Notas Original y Copia', 1, 500.00, '2'),
	(14, '250817', 1, 'Millar Tarjetas', 2, 500.00, '1');
/*!40000 ALTER TABLE `notas_contenido` ENABLE KEYS */;

-- Volcando estructura para tabla imprenta.notas_encabezado
CREATE TABLE IF NOT EXISTS `notas_encabezado` (
  `Folio` varchar(50) NOT NULL DEFAULT '0',
  `IdCliente` int(11) DEFAULT NULL,
  `Total_Pedido` decimal(20,2) NOT NULL DEFAULT 0.00,
  `Anticipo` decimal(20,2) NOT NULL DEFAULT 0.00,
  `Restante` decimal(20,2) NOT NULL DEFAULT 0.00,
  `Fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `Pagado` int(1) DEFAULT NULL,
  PRIMARY KEY (`Folio`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla imprenta.notas_encabezado: ~6 rows (aproximadamente)
/*!40000 ALTER TABLE `notas_encabezado` DISABLE KEYS */;
INSERT IGNORE INTO `notas_encabezado` (`Folio`, `IdCliente`, `Total_Pedido`, `Anticipo`, `Restante`, `Fecha`, `Pagado`) VALUES
	('250812', 1, 35.00, 0.00, 0.00, '2022-01-29 19:03:24', 1),
	('250813', 1, 500.00, 0.00, 0.00, '2022-02-06 21:16:12', 1),
	('250814', 1, 2000.00, 0.00, 0.00, '2022-02-06 21:41:24', 1),
	('250815', 1, 500.00, 100.00, 400.00, '2022-02-07 16:38:37', 0),
	('250816', 1, 1250.00, 400.00, 1250.00, '2022-02-07 21:58:50', 0),
	('250817', 1, 500.00, 0.00, 500.00, '2022-02-07 22:21:57', 0);
/*!40000 ALTER TABLE `notas_encabezado` ENABLE KEYS */;

-- Volcando estructura para tabla imprenta.productos
CREATE TABLE IF NOT EXISTS `productos` (
  `IdProducto` int(11) NOT NULL AUTO_INCREMENT,
  `Descripcion` varchar(50) DEFAULT NULL,
  `Costo` decimal(20,2) NOT NULL DEFAULT 0.00,
  `Costo_Venta` decimal(20,2) NOT NULL DEFAULT 0.00,
  PRIMARY KEY (`IdProducto`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla imprenta.productos: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT IGNORE INTO `productos` (`IdProducto`, `Descripcion`, `Costo`, `Costo_Venta`) VALUES
	(1, 'Millar Tarjetas', 150.00, 250.00),
	(2, '1000 Notas Original y Copia', 300.00, 500.00);
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;

-- Volcando estructura para procedimiento imprenta.Trae_Nota
DELIMITER //
CREATE PROCEDURE `Trae_Nota`(
	IN ParamFolio VARCHAR(255)
)
BEGIN
	SELECT * FROM notas_encabezado 
INNER JOIN notas_contenido ON notas_encabezado.Folio = notas_contenido.Folio 
WHERE notas_encabezado.Folio = ParamFolio;
END//
DELIMITER ;

-- Volcando estructura para vista imprenta.ultimo_folio
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `ultimo_folio` (
	`Folio` BIGINT(52) NOT NULL
) ENGINE=MyISAM;

-- Volcando estructura para tabla imprenta.usuarios
CREATE TABLE IF NOT EXISTS `usuarios` (
  `IdUsuario` int(11) NOT NULL AUTO_INCREMENT,
  `Usuario` varchar(50) NOT NULL,
  `passworded` varchar(200) NOT NULL,
  `Nombre` varchar(200) NOT NULL,
  `estatus` bit(1) NOT NULL,
  PRIMARY KEY (`IdUsuario`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla imprenta.usuarios: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT IGNORE INTO `usuarios` (`IdUsuario`, `Usuario`, `passworded`, `Nombre`, `estatus`) VALUES
	(1, 'ALAN', 'cXdlcnR5MTIz', 'Alan Parra', b'1'),
	(2, 'ALEXIA', 'YWxhbjEyMw==', 'Alexia Carrillo', b'1');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;

-- Volcando estructura para vista imprenta.notas_clientes
-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `notas_clientes`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `notas_clientes` AS SELECT Folio,
(SELECT C.Nombre FROM clientes C WHERE C.IdCliente = N.IdCliente) AS Cliente,
Total_Pedido,
Anticipo,
Restante,
Fecha,
IF(Pagado = 0,'Adeudo','Pagado')  AS Pagado
FROM notas_encabezado N
ORDER BY Fecha DESC ;

-- Volcando estructura para vista imprenta.ultimo_folio
-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `ultimo_folio`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `ultimo_folio` AS SELECT CAST(Folio AS INT) + 1 AS Folio FROM notas_encabezado ORDER BY notas_encabezado.Fecha DESC LIMIT 1 ;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;

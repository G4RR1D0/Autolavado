-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: localhost    Database: db_autolavado
-- ------------------------------------------------------
-- Server version	8.0.42

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `tb_cliente`
--

DROP TABLE IF EXISTS `tb_cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_cliente` (
  `idCliente` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `primerApellido` varchar(45) NOT NULL,
  `segundoApellido` varchar(45) DEFAULT NULL,
  `direccion` varchar(90) NOT NULL,
  `telefono` varchar(12) NOT NULL,
  `correo` varchar(60) NOT NULL,
  `fechaNacimiento` date NOT NULL,
  `password` varchar(45) NOT NULL,
  PRIMARY KEY (`idCliente`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_cliente`
--

LOCK TABLES `tb_cliente` WRITE;
/*!40000 ALTER TABLE `tb_cliente` DISABLE KEYS */;
INSERT INTO `tb_cliente` VALUES (1,'Juan','Pérez','López','Calle Falsa 123','5512345678','juan.perez@email.com','1990-05-20','miPassword123'),(2,'Ana','García','Soto','Av. Central 45','5598765432','ana.garcia@email.com','1992-08-15','passAna456'),(3,'Luis','Martínez','Ruiz','Calle 7 890','5511223344','luis.martinez@email.com','1988-12-10','passLuis789');
/*!40000 ALTER TABLE `tb_cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_rol`
--

DROP TABLE IF EXISTS `tb_rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_rol` (
  `idRol` int NOT NULL AUTO_INCREMENT,
  `nombreRol` varchar(45) NOT NULL,
  PRIMARY KEY (`idRol`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_rol`
--

LOCK TABLES `tb_rol` WRITE;
/*!40000 ALTER TABLE `tb_rol` DISABLE KEYS */;
INSERT INTO `tb_rol` VALUES (1,'Adminitrador'),(2,'Lavador'),(8,'Cajero'),(9,'Contador'),(13,'Limpiador'),(14,'Empleado');
/*!40000 ALTER TABLE `tb_rol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_servicios`
--

DROP TABLE IF EXISTS `tb_servicios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_servicios` (
  `idServicio` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `descripcion` varchar(90) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `estatus` varchar(20) DEFAULT '1',
  PRIMARY KEY (`idServicio`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_servicios`
--

LOCK TABLES `tb_servicios` WRITE;
/*!40000 ALTER TABLE `tb_servicios` DISABLE KEYS */;
INSERT INTO `tb_servicios` VALUES (1,'Lavado Básico','Lavado exterior e interior básico',150.00,'Activo'),(2,'Lavado Completo','Lavado completo con encerado',300.00,'Activo'),(3,'Pulido','Pulido de carrocería y limpieza de faros',500.00,'Activo'),(4,'Desinfección Interior','Limpieza y desinfección de tapicería',200.00,'Inactivo');
/*!40000 ALTER TABLE `tb_servicios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_usuarios`
--

DROP TABLE IF EXISTS `tb_usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_usuarios` (
  `idUsuario` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `primerApellido` varchar(45) NOT NULL,
  `segundoApellido` varchar(45) DEFAULT NULL,
  `direccion` varchar(90) NOT NULL,
  `telefono` varchar(12) NOT NULL,
  `correo` varchar(60) NOT NULL,
  `usuario` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `fechaNacimiento` date NOT NULL,
  `idRol` int NOT NULL,
  PRIMARY KEY (`idUsuario`),
  KEY `fk_rols_idx` (`idRol`),
  CONSTRAINT `fk_rols` FOREIGN KEY (`idRol`) REFERENCES `tb_rol` (`idRol`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_usuarios`
--

LOCK TABLES `tb_usuarios` WRITE;
/*!40000 ALTER TABLE `tb_usuarios` DISABLE KEYS */;
INSERT INTO `tb_usuarios` VALUES (1,'yane','garrido','hernandez','2deMarzo','764 109 8593','yanethgarrido027@gmail.com','yane','1234','2006-03-02',1),(2,'Aurora','cruz','cruz','tabacal','764 122 4567','aurora12@gmail.com','aurora','12324','2009-06-13',2),(3,'luis','garrido','fernandez','monte','565878989','luis@gmail.com','luis','12345','2001-09-16',8),(5,'lupita','hernadez','cruz','2 de abril','25346486','lupita@gmail.com','lupita','123457','2003-10-06',8),(10,'yami','garrido','hernadez','23demayo','325325436','yami@gmail.com','yami','1234','2000-09-08',2);
/*!40000 ALTER TABLE `tb_usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_vehiculo`
--

DROP TABLE IF EXISTS `tb_vehiculo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_vehiculo` (
  `idVehiculo` int NOT NULL AUTO_INCREMENT,
  `matricula` varchar(10) NOT NULL,
  `modelo` varchar(45) NOT NULL,
  `color` varchar(45) NOT NULL,
  `marca` varchar(45) NOT NULL,
  `anio` int NOT NULL,
  `tipo` varchar(45) NOT NULL,
  `idCliente` int NOT NULL,
  PRIMARY KEY (`idVehiculo`),
  KEY `fk_clientes_idx` (`idCliente`),
  CONSTRAINT `fk_clientes` FOREIGN KEY (`idCliente`) REFERENCES `tb_cliente` (`idCliente`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_vehiculo`
--

LOCK TABLES `tb_vehiculo` WRITE;
/*!40000 ALTER TABLE `tb_vehiculo` DISABLE KEYS */;
INSERT INTO `tb_vehiculo` VALUES (1,'ABC123','Corolla','Blanco','Toyota',2020,'Sedán',1),(2,'DEF456','Civic','Negro','Honda',2019,'Sedán',2),(3,'GHI789','Mustang','Rojo','Ford',2021,'Coupe',1),(4,'JKL012','Camry','Gris','Toyota',2022,'Sedán',2);
/*!40000 ALTER TABLE `tb_vehiculo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_ventas`
--

DROP TABLE IF EXISTS `tb_ventas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_ventas` (
  `idVenta` int NOT NULL AUTO_INCREMENT,
  `idUsuarioC` int NOT NULL,
  `idUsuarioL` int NOT NULL,
  `idServicio` int NOT NULL,
  `idVehiculo` int NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `estatus` varchar(45) NOT NULL,
  `pagado` varchar(10) NOT NULL DEFAULT '1',
  PRIMARY KEY (`idVenta`),
  KEY `fk_servicios_idx` (`idServicio`),
  KEY `fk_usuariosC_idx` (`idUsuarioC`),
  KEY `fk_usuariosL_idx` (`idUsuarioL`),
  KEY `fk_vehiculo_idx` (`idVehiculo`),
  CONSTRAINT `fk_servicios` FOREIGN KEY (`idServicio`) REFERENCES `tb_servicios` (`idServicio`),
  CONSTRAINT `fk_usuariosC` FOREIGN KEY (`idUsuarioC`) REFERENCES `tb_usuarios` (`idUsuario`),
  CONSTRAINT `fk_usuariosL` FOREIGN KEY (`idUsuarioL`) REFERENCES `tb_usuarios` (`idUsuario`),
  CONSTRAINT `fk_vehiculo` FOREIGN KEY (`idVehiculo`) REFERENCES `tb_vehiculo` (`idVehiculo`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_ventas`
--

LOCK TABLES `tb_ventas` WRITE;
/*!40000 ALTER TABLE `tb_ventas` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_ventas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-08-20 17:23:46

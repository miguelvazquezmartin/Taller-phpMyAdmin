-- MySQL dump 10.13  Distrib 8.0.23, for Win64 (x86_64)
--
-- Host: localhost    Database: explosivos_php
-- ------------------------------------------------------
-- Server version	8.0.23

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
-- Table structure for table `administrativos`
--

DROP TABLE IF EXISTS `administrativos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `administrativos` (
  `idAdministrativo` int NOT NULL AUTO_INCREMENT,
  `juniorAdministrativo` varchar(45) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `seniorAdministrativo` varchar(45) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `idEmpleadoFK` int NOT NULL,
  PRIMARY KEY (`idAdministrativo`),
  KEY `idEmpleadoFK` (`idEmpleadoFK`),
  CONSTRAINT `administrativos_ibfk_1` FOREIGN KEY (`idEmpleadoFK`) REFERENCES `empleados` (`idEmpleado`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administrativos`
--

LOCK TABLES `administrativos` WRITE;
/*!40000 ALTER TABLE `administrativos` DISABLE KEYS */;
INSERT INTO `administrativos` VALUES (1,'Rodrigo','Rodrigo',1),(2,'Laura','Laura',2);
/*!40000 ALTER TABLE `administrativos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `camiones`
--

DROP TABLE IF EXISTS `camiones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `camiones` (
  `idCamion` int NOT NULL AUTO_INCREMENT,
  `capacidadCamion` int NOT NULL,
  `marcaCamion` varchar(15) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `anioCompraCamion` int NOT NULL,
  `matriculaCamion` varchar(10) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `modeloCamion` varchar(20) COLLATE utf8mb4_spanish2_ci NOT NULL,
  PRIMARY KEY (`idCamion`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `camiones`
--

LOCK TABLES `camiones` WRITE;
/*!40000 ALTER TABLE `camiones` DISABLE KEYS */;
INSERT INTO `camiones` VALUES (1,5000,'Scania',2015,'4856FGP','Serie L'),(2,10000,'Scania',2018,'7456LKM','Serie S');
/*!40000 ALTER TABLE `camiones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carga`
--

DROP TABLE IF EXISTS `carga`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carga` (
  `idCamionFK` int NOT NULL,
  `idExplosivoFK` int NOT NULL,
  PRIMARY KEY (`idCamionFK`,`idExplosivoFK`),
  KEY `idCamionFK` (`idCamionFK`) USING BTREE,
  KEY `idExplosivoFK` (`idExplosivoFK`,`idCamionFK`) USING BTREE,
  CONSTRAINT `carga_ibfk_1` FOREIGN KEY (`idCamionFK`) REFERENCES `camiones` (`idCamion`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `carga_ibfk_2` FOREIGN KEY (`idExplosivoFK`) REFERENCES `explosivos` (`idExplosivo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carga`
--

LOCK TABLES `carga` WRITE;
/*!40000 ALTER TABLE `carga` DISABLE KEYS */;
/*!40000 ALTER TABLE `carga` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `idCliente` int NOT NULL AUTO_INCREMENT,
  `direccionCliente` varchar(50) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `nombreCliente` varchar(15) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `correoElectronicoCliente` varchar(45) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `telefonoCliente` int NOT NULL,
  `codigoPostalCliente` int NOT NULL,
  PRIMARY KEY (`idCliente`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'Calle Fenicios','Roberto','roberto@gmail.com',658963112,47200),(2,'Avenida Andalucía ','Julia','julia@gmail.com',678145789,21400);
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conduccion`
--

DROP TABLE IF EXISTS `conduccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conduccion` (
  `idEmpleadoFK` int NOT NULL,
  `idCamionFK` int NOT NULL,
  PRIMARY KEY (`idEmpleadoFK`,`idCamionFK`),
  KEY `idEmpleadoFK` (`idEmpleadoFK`,`idCamionFK`),
  KEY `idCamionFK` (`idCamionFK`),
  CONSTRAINT `conduccion_ibfk_1` FOREIGN KEY (`idCamionFK`) REFERENCES `camiones` (`idCamion`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `conduccion_ibfk_2` FOREIGN KEY (`idEmpleadoFK`) REFERENCES `empleados` (`idEmpleado`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conduccion`
--

LOCK TABLES `conduccion` WRITE;
/*!40000 ALTER TABLE `conduccion` DISABLE KEYS */;
/*!40000 ALTER TABLE `conduccion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conductores`
--

DROP TABLE IF EXISTS `conductores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conductores` (
  `idConductor` int NOT NULL AUTO_INCREMENT,
  `carnetConducirConductor` varchar(45) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `idEmpleadoFK` int NOT NULL,
  PRIMARY KEY (`idConductor`),
  KEY `idEmpleadoFK` (`idEmpleadoFK`),
  CONSTRAINT `conductores_ibfk_1` FOREIGN KEY (`idEmpleadoFK`) REFERENCES `empleados` (`idEmpleado`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conductores`
--

LOCK TABLES `conductores` WRITE;
/*!40000 ALTER TABLE `conductores` DISABLE KEYS */;
INSERT INTO `conductores` VALUES (1,'Carnet C',6),(2,'Carnet C',5);
/*!40000 ALTER TABLE `conductores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleados`
--

DROP TABLE IF EXISTS `empleados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleados` (
  `idEmpleado` int NOT NULL AUTO_INCREMENT,
  `telefonoEmpleado` int NOT NULL,
  `dniEmpleado` varchar(9) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `nombreEmpleado` varchar(20) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `direccionEmpleado` varchar(45) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `apellidosEmpleado` varchar(45) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `idEmpleadoFK` int NOT NULL,
  PRIMARY KEY (`idEmpleado`),
  KEY `idEmpleadoFK` (`idEmpleadoFK`),
  CONSTRAINT `empleados_ibfk_1` FOREIGN KEY (`idEmpleadoFK`) REFERENCES `empleados` (`idEmpleado`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleados`
--

LOCK TABLES `empleados` WRITE;
/*!40000 ALTER TABLE `empleados` DISABLE KEYS */;
INSERT INTO `empleados` VALUES (1,959321715,'48755521A','Rodrigo','Calle Punta','Rodríguez',1),(2,959897452,'48967413D','Laura','Calle Manzanares','Romero',1),(5,789654231,'35674159H','Adrián','Calle Palacios','Domínguez ',1),(6,95924584,'63977841E','José','Avenida Alemania','Cervantes',1);
/*!40000 ALTER TABLE `empleados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `explosivos`
--

DROP TABLE IF EXISTS `explosivos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `explosivos` (
  `idExplosivo` int NOT NULL AUTO_INCREMENT,
  `tonelajeExplosivo` int NOT NULL,
  `tipoExplosivo` varchar(20) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `precioExplosivo` decimal(6,2) NOT NULL,
  `idClienteFK` int NOT NULL,
  PRIMARY KEY (`idExplosivo`),
  KEY `idClienteFK` (`idClienteFK`),
  CONSTRAINT `explosivos_ibfk_1` FOREIGN KEY (`idClienteFK`) REFERENCES `clientes` (`idCliente`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `explosivos`
--

LOCK TABLES `explosivos` WRITE;
/*!40000 ALTER TABLE `explosivos` DISABLE KEYS */;
INSERT INTO `explosivos` VALUES (1,30,'Nagolita',45.50,1),(2,23,'C4',50.00,2);
/*!40000 ALTER TABLE `explosivos` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-05-09 19:15:09

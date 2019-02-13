-- MySQL dump 10.13  Distrib 5.5.61, for Win64 (AMD64)
--
-- Host: localhost    Database: aspirante_ventas
-- ------------------------------------------------------
-- Server version	5.5.61

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `hibernate_sequence`
--

DROP TABLE IF EXISTS `hibernate_sequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hibernate_sequence` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hibernate_sequence`
--

LOCK TABLES `hibernate_sequence` WRITE;
/*!40000 ALTER TABLE `hibernate_sequence` DISABLE KEYS */;
INSERT INTO `hibernate_sequence` VALUES (1),(1),(1),(1),(1),(1);
/*!40000 ALTER TABLE `hibernate_sequence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student` (
  `id` int(11) NOT NULL,
  `country` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `first_name` varchar(30) DEFAULT NULL,
  `last_name` varchar(30) DEFAULT NULL,
  `section` varchar(255) DEFAULT NULL,
  `sex` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (1,'dfds',NULL,'dsf','dfds','dsfd','dfd','df');
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblc_categoria`
--

DROP TABLE IF EXISTS `tblc_categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblc_categoria` (
  `id_categoria` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  `activo` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id_categoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblc_categoria`
--

LOCK TABLES `tblc_categoria` WRITE;
/*!40000 ALTER TABLE `tblc_categoria` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblc_categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblc_producto_categoria`
--

DROP TABLE IF EXISTS `tblc_producto_categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblc_producto_categoria` (
  `id_producto_categoria` int(11) NOT NULL AUTO_INCREMENT,
  `id_producto` int(11) NOT NULL,
  `id_categoria` int(11) NOT NULL,
  PRIMARY KEY (`id_producto_categoria`),
  UNIQUE KEY `tblc_producto_categoria_un` (`id_producto`,`id_categoria`),
  KEY `tblc_producto_categoria_tblc_categoria_fk` (`id_categoria`),
  CONSTRAINT `tblc_producto_categoria_tblc_categoria_fk` FOREIGN KEY (`id_categoria`) REFERENCES `tblc_categoria` (`id_categoria`),
  CONSTRAINT `tblc_producto_categoria_tblt_productos_fk` FOREIGN KEY (`id_producto`) REFERENCES `tblt_productos` (`id_producto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblc_producto_categoria`
--

LOCK TABLES `tblc_producto_categoria` WRITE;
/*!40000 ALTER TABLE `tblc_producto_categoria` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblc_producto_categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblt_productos`
--

DROP TABLE IF EXISTS `tblt_productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblt_productos` (
  `id_producto` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  `clave` varchar(100) DEFAULT NULL,
  `precio_unitario` double DEFAULT NULL,
  `stock` int(11) DEFAULT NULL,
  `activo` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id_producto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblt_productos`
--

LOCK TABLES `tblt_productos` WRITE;
/*!40000 ALTER TABLE `tblt_productos` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblt_productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblt_venta_detalle`
--

DROP TABLE IF EXISTS `tblt_venta_detalle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblt_venta_detalle` (
  `id_venta_detalle` int(11) NOT NULL AUTO_INCREMENT,
  `id_venta` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `precio` double DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_venta_detalle`),
  UNIQUE KEY `tblc_venta_detalle_un` (`id_venta`,`id_producto`),
  KEY `tblc_venta_detalle_tblt_productos_fk` (`id_producto`),
  CONSTRAINT `tblc_venta_detalle_tblt_ventas_fk` FOREIGN KEY (`id_venta`) REFERENCES `tblt_ventas` (`id_venta`),
  CONSTRAINT `tblc_venta_detalle_tblt_productos_fk` FOREIGN KEY (`id_producto`) REFERENCES `tblt_productos` (`id_producto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblt_venta_detalle`
--

LOCK TABLES `tblt_venta_detalle` WRITE;
/*!40000 ALTER TABLE `tblt_venta_detalle` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblt_venta_detalle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblt_ventas`
--

DROP TABLE IF EXISTS `tblt_ventas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblt_ventas` (
  `id_venta` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` date DEFAULT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  `generar_factura` tinyint(1) DEFAULT NULL,
  `cupo_descuento` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_venta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblt_ventas`
--

LOCK TABLES `tblt_ventas` WRITE;
/*!40000 ALTER TABLE `tblt_ventas` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblt_ventas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'aspirante_ventas'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-02-13  5:01:44

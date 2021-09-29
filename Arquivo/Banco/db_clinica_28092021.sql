CREATE DATABASE  IF NOT EXISTS `db_clinica` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `db_clinica`;
-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: localhost    Database: db_clinica
-- ------------------------------------------------------
-- Server version	8.0.26

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `tb_configuracao`
--

DROP TABLE IF EXISTS `tb_configuracao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_configuracao` (
  `idconfiguracao` int NOT NULL AUTO_INCREMENT,
  `con_local_foto` varchar(200) NOT NULL,
  PRIMARY KEY (`idconfiguracao`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_configuracao`
--

LOCK TABLES `tb_configuracao` WRITE;
/*!40000 ALTER TABLE `tb_configuracao` DISABLE KEYS */;
INSERT INTO `tb_configuracao` VALUES (1,'C:\\Projetos\\DELPHI\\Aplicativo\\Arquivo\\Imagens\\Jpg\\');
/*!40000 ALTER TABLE `tb_configuracao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_log`
--

DROP TABLE IF EXISTS `tb_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_log` (
  `idlog` int NOT NULL AUTO_INCREMENT,
  `log_idusuario` int NOT NULL,
  `log_operacao` varchar(20) NOT NULL,
  `log_tabela` varchar(50) NOT NULL,
  `log_data` date NOT NULL,
  `log_hora` time NOT NULL,
  `log_registro` varchar(1000) NOT NULL,
  PRIMARY KEY (`idlog`),
  KEY `fk_tb_idusuario_idx` (`log_idusuario`),
  CONSTRAINT `fk_tb_idusuario` FOREIGN KEY (`log_idusuario`) REFERENCES `tb_usuario` (`idusuario`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_log`
--

LOCK TABLES `tb_log` WRITE;
/*!40000 ALTER TABLE `tb_log` DISABLE KEYS */;
INSERT INTO `tb_log` VALUES (1,14,'INS','tb_usuario','2021-09-26','23:07:27','usu_usuario (marcela)'),(2,15,'INSERT','tb_usuario','2021-09-27','23:40:32','usu_usuario (rebequinha)'),(3,16,'INSERT','tb_usuario','2021-09-27','23:42:32','usu_usuario (luciana.silva)'),(4,17,'INSERT','tb_usuario','2021-09-28','11:41:02','usu_usuario (vagner.moura)'),(5,18,'18 / tanus.oliver','tb_usuario','2021-09-28','17:12:11',''),(6,19,'19 / juliete.bbb','tb_usuario','2021-09-28','17:13:33',''),(7,20,'INSERT','tb_usuario','2021-09-28','17:16:18','20 / '),(8,21,'INSERT','tb_usuario','2021-09-28','17:16:41','21 / vera.luciamartis'),(9,22,'INSERT','tb_usuario','2021-09-28','21:58:27','22 / juliana.tiririca');
/*!40000 ALTER TABLE `tb_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_usuario`
--

DROP TABLE IF EXISTS `tb_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_usuario` (
  `idusuario` int NOT NULL AUTO_INCREMENT,
  `usu_usuario` varchar(20) NOT NULL,
  `usu_senha` varchar(10) NOT NULL,
  `usu_status` int NOT NULL COMMENT '0 Inativo 1 Ativo',
  PRIMARY KEY (`idusuario`),
  UNIQUE KEY `usu_usuario_UNIQUE` (`usu_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_usuario`
--

LOCK TABLES `tb_usuario` WRITE;
/*!40000 ALTER TABLE `tb_usuario` DISABLE KEYS */;
INSERT INTO `tb_usuario` VALUES (1,'admin','1234',1),(2,'JORGE','1234',1),(3,'rogerio','1234',1),(4,'josue','1234',1),(5,'regina','1234',1),(6,'tatiane.coelho','1234',1),(7,'ricador.coelho','1234',1),(8,'jorge.antunino','1234',1),(9,'alexandre','1234',1),(10,'micarla','1234',0),(11,'erivaldo.luciano','1234',1),(12,'ribeiro','1234',1),(13,'andreza','1234',1),(14,'marcela','54321',1),(15,'rebequinha','1234',0),(16,'luciana.silva','1234',1),(17,'vagner.moura','1234',1),(18,'tanus.oliver','1234',1),(19,'juliete.bbb','1234',1),(20,'','',1),(21,'vera.luciamartis','1234',1),(22,'juliana.tiririca','1234',1);
/*!40000 ALTER TABLE `tb_usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-09-28 22:21:11

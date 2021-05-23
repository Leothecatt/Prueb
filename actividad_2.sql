CREATE DATABASE  IF NOT EXISTS `actividad2` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `actividad2`;
-- MySQL dump 10.13  Distrib 8.0.25, for Win64 (x86_64)
--
-- Host: localhost    Database: actividad2
-- ------------------------------------------------------
-- Server version	8.0.25

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
-- Table structure for table `actividad_planeacion`
--

DROP TABLE IF EXISTS `actividad_planeacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `actividad_planeacion` (
  `id` int NOT NULL,
  `id_actividad_proyecto` int NOT NULL,
  `id_programacion_trimestre` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_actividad_proyecto` (`id_actividad_proyecto`),
  UNIQUE KEY `id_programacion_trimestre` (`id_programacion_trimestre`),
  CONSTRAINT `fk_acpr_acpl` FOREIGN KEY (`id_actividad_proyecto`) REFERENCES `actividad_proyecto` (`id`),
  CONSTRAINT `fk_prtr_acpl` FOREIGN KEY (`id_programacion_trimestre`) REFERENCES `programacion_trimestre` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actividad_planeacion`
--

LOCK TABLES `actividad_planeacion` WRITE;
/*!40000 ALTER TABLE `actividad_planeacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `actividad_planeacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `actividad_proyecto`
--

DROP TABLE IF EXISTS `actividad_proyecto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `actividad_proyecto` (
  `id` int NOT NULL,
  `id_fase` int NOT NULL,
  `numero_actividad` int NOT NULL,
  `descripcion_actividad` varchar(400) DEFAULT NULL,
  `estado` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_fase` (`id_fase`),
  UNIQUE KEY `numero_actividad` (`numero_actividad`),
  CONSTRAINT `fk_fa_acpro` FOREIGN KEY (`id_fase`) REFERENCES `fase` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actividad_proyecto`
--

LOCK TABLES `actividad_proyecto` WRITE;
/*!40000 ALTER TABLE `actividad_proyecto` DISABLE KEYS */;
/*!40000 ALTER TABLE `actividad_proyecto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ambiente`
--

DROP TABLE IF EXISTS `ambiente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ambiente` (
  `id` int NOT NULL,
  `id_sede` int NOT NULL,
  `numero_ambiente` varchar(50) NOT NULL,
  `descripcion` varchar(1000) NOT NULL,
  `estado` varchar(40) NOT NULL,
  `limitacion` varchar(40) NOT NULL,
  `id_tipo_ambiente` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_sede` (`id_sede`),
  UNIQUE KEY `numero_ambiente` (`numero_ambiente`),
  KEY `fk_tiam_amb` (`id_tipo_ambiente`),
  CONSTRAINT `fk_se_amb` FOREIGN KEY (`id_sede`) REFERENCES `sede` (`id`),
  CONSTRAINT `fk_tiam_amb` FOREIGN KEY (`id_tipo_ambiente`) REFERENCES `tipo_ambiente` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ambiente`
--

LOCK TABLES `ambiente` WRITE;
/*!40000 ALTER TABLE `ambiente` DISABLE KEYS */;
/*!40000 ALTER TABLE `ambiente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `anio`
--

DROP TABLE IF EXISTS `anio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `anio` (
  `id` int NOT NULL,
  `number_year` int NOT NULL,
  `estado` varchar(40) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `number_year` (`number_year`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `anio`
--

LOCK TABLES `anio` WRITE;
/*!40000 ALTER TABLE `anio` DISABLE KEYS */;
/*!40000 ALTER TABLE `anio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aprendiz`
--

DROP TABLE IF EXISTS `aprendiz`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aprendiz` (
  `id` int NOT NULL,
  `id_cliente` int NOT NULL,
  `id_ficha` int NOT NULL,
  `id_estado_formacion` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_cliente` (`id_cliente`),
  UNIQUE KEY `id_ficha` (`id_ficha`),
  KEY `fk_esfo_apr` (`id_estado_formacion`),
  CONSTRAINT `fk_cli_apr` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id`),
  CONSTRAINT `fk_esfo_apr` FOREIGN KEY (`id_estado_formacion`) REFERENCES `estado_formacion` (`id`),
  CONSTRAINT `fk_fi_apr` FOREIGN KEY (`id_ficha`) REFERENCES `ficha` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aprendiz`
--

LOCK TABLES `aprendiz` WRITE;
/*!40000 ALTER TABLE `aprendiz` DISABLE KEYS */;
/*!40000 ALTER TABLE `aprendiz` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `area`
--

DROP TABLE IF EXISTS `area`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `area` (
  `id` int NOT NULL,
  `nombre_area` varchar(40) NOT NULL,
  `estado` varchar(40) NOT NULL,
  `url_logo` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre_area` (`nombre_area`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `area`
--

LOCK TABLES `area` WRITE;
/*!40000 ALTER TABLE `area` DISABLE KEYS */;
/*!40000 ALTER TABLE `area` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `area_instructor`
--

DROP TABLE IF EXISTS `area_instructor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `area_instructor` (
  `id` int NOT NULL,
  `id_area` int NOT NULL,
  `id_instructor` int NOT NULL,
  `estado` varchar(40) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_area` (`id_area`),
  UNIQUE KEY `id_instructor` (`id_instructor`),
  CONSTRAINT `fk_are_areins` FOREIGN KEY (`id_area`) REFERENCES `area` (`id`),
  CONSTRAINT `fk_are_ins` FOREIGN KEY (`id_instructor`) REFERENCES `instructor` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `area_instructor`
--

LOCK TABLES `area_instructor` WRITE;
/*!40000 ALTER TABLE `area_instructor` DISABLE KEYS */;
/*!40000 ALTER TABLE `area_instructor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `autorithy`
--

DROP TABLE IF EXISTS `autorithy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `autorithy` (
  `nombre` varchar(50) NOT NULL,
  PRIMARY KEY (`nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `autorithy`
--

LOCK TABLES `autorithy` WRITE;
/*!40000 ALTER TABLE `autorithy` DISABLE KEYS */;
/*!40000 ALTER TABLE `autorithy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `id` int NOT NULL,
  `id_tipo_documento` int NOT NULL,
  `numero_documento` varchar(50) NOT NULL,
  `primer_nombre` varchar(50) NOT NULL,
  `segundo_nombre` varchar(50) DEFAULT NULL,
  `primer_apellido` varchar(50) NOT NULL,
  `segundo_apellido` varchar(50) DEFAULT NULL,
  `id_user` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_tipo_documento` (`id_tipo_documento`),
  UNIQUE KEY `numero_documento` (`numero_documento`),
  UNIQUE KEY `id_user` (`id_user`),
  CONSTRAINT `fk_idus_cli` FOREIGN KEY (`id_user`) REFERENCES `system_user` (`id`),
  CONSTRAINT `fk_tido_cli` FOREIGN KEY (`id_tipo_documento`) REFERENCES `tipo_document` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `competencia`
--

DROP TABLE IF EXISTS `competencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `competencia` (
  `id` int NOT NULL,
  `id_programa` int NOT NULL,
  `codigo_competencia` varchar(50) NOT NULL,
  `denominacion` varchar(1000) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_programa` (`id_programa`),
  UNIQUE KEY `codigo_competencia` (`codigo_competencia`),
  CONSTRAINT `fk_pr_com` FOREIGN KEY (`id_programa`) REFERENCES `programa` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `competencia`
--

LOCK TABLES `competencia` WRITE;
/*!40000 ALTER TABLE `competencia` DISABLE KEYS */;
/*!40000 ALTER TABLE `competencia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dia`
--

DROP TABLE IF EXISTS `dia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dia` (
  `id` int NOT NULL,
  `nombre_dia` varchar(40) NOT NULL,
  `estado` varchar(40) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre_dia` (`nombre_dia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dia`
--

LOCK TABLES `dia` WRITE;
/*!40000 ALTER TABLE `dia` DISABLE KEYS */;
/*!40000 ALTER TABLE `dia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dia_jornada`
--

DROP TABLE IF EXISTS `dia_jornada`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dia_jornada` (
  `id` int NOT NULL,
  `id_jornada_instructor` int NOT NULL,
  `id_dia` int NOT NULL,
  `hora_inicio` int NOT NULL,
  `hora_fin` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_jornada_instructor` (`id_jornada_instructor`),
  UNIQUE KEY `id_dia` (`id_dia`),
  UNIQUE KEY `hora_inicio` (`hora_inicio`),
  UNIQUE KEY `hora_fin` (`hora_fin`),
  CONSTRAINT `fk_di_dijor` FOREIGN KEY (`id_dia`) REFERENCES `dia` (`id`),
  CONSTRAINT `fk_jorins_dijor` FOREIGN KEY (`id_jornada_instructor`) REFERENCES `jornada_instructor` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dia_jornada`
--

LOCK TABLES `dia_jornada` WRITE;
/*!40000 ALTER TABLE `dia_jornada` DISABLE KEYS */;
/*!40000 ALTER TABLE `dia_jornada` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `disponibilidad_competencias`
--

DROP TABLE IF EXISTS `disponibilidad_competencias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `disponibilidad_competencias` (
  `id` int NOT NULL,
  `id_competencia` int NOT NULL,
  `id_vinculacion_instructor` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_competencia` (`id_competencia`),
  UNIQUE KEY `id_vinculacion_instructor` (`id_vinculacion_instructor`),
  CONSTRAINT `fk_comp_discom` FOREIGN KEY (`id_competencia`) REFERENCES `competencia` (`id`),
  CONSTRAINT `fk_vinins_discom` FOREIGN KEY (`id_vinculacion_instructor`) REFERENCES `vinculacion_instructor` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `disponibilidad_competencias`
--

LOCK TABLES `disponibilidad_competencias` WRITE;
/*!40000 ALTER TABLE `disponibilidad_competencias` DISABLE KEYS */;
/*!40000 ALTER TABLE `disponibilidad_competencias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `disponibilidad_horaria`
--

DROP TABLE IF EXISTS `disponibilidad_horaria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `disponibilidad_horaria` (
  `id` int NOT NULL,
  `id_jornada_instructor` int NOT NULL,
  `id_vinculacion_instructor` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_jornada_instructor` (`id_jornada_instructor`),
  UNIQUE KEY `id_vinculacion_instructor` (`id_vinculacion_instructor`),
  CONSTRAINT `fk_jorins_dishor` FOREIGN KEY (`id_jornada_instructor`) REFERENCES `jornada_instructor` (`id`),
  CONSTRAINT `fk_vinins_dishor` FOREIGN KEY (`id_vinculacion_instructor`) REFERENCES `vinculacion_instructor` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `disponibilidad_horaria`
--

LOCK TABLES `disponibilidad_horaria` WRITE;
/*!40000 ALTER TABLE `disponibilidad_horaria` DISABLE KEYS */;
/*!40000 ALTER TABLE `disponibilidad_horaria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estado_ficha`
--

DROP TABLE IF EXISTS `estado_ficha`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estado_ficha` (
  `id` int NOT NULL,
  `nombre_estado` varchar(20) NOT NULL,
  `estado` smallint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre_estado` (`nombre_estado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estado_ficha`
--

LOCK TABLES `estado_ficha` WRITE;
/*!40000 ALTER TABLE `estado_ficha` DISABLE KEYS */;
/*!40000 ALTER TABLE `estado_ficha` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estado_formacion`
--

DROP TABLE IF EXISTS `estado_formacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estado_formacion` (
  `id` int NOT NULL,
  `nombre_estado` varchar(40) NOT NULL,
  `estado` varchar(40) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre_estado` (`nombre_estado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estado_formacion`
--

LOCK TABLES `estado_formacion` WRITE;
/*!40000 ALTER TABLE `estado_formacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `estado_formacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fase`
--

DROP TABLE IF EXISTS `fase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fase` (
  `id` int NOT NULL,
  `id_proyecto` int NOT NULL,
  `nombre` varchar(40) NOT NULL,
  `estado` varchar(40) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_proyecto` (`id_proyecto`),
  UNIQUE KEY `nombre` (`nombre`),
  CONSTRAINT `fk_pro_fa` FOREIGN KEY (`id_proyecto`) REFERENCES `proyecto` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fase`
--

LOCK TABLES `fase` WRITE;
/*!40000 ALTER TABLE `fase` DISABLE KEYS */;
/*!40000 ALTER TABLE `fase` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ficha`
--

DROP TABLE IF EXISTS `ficha`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ficha` (
  `id` int NOT NULL,
  `id_programa` int NOT NULL,
  `numero_ficha` varchar(100) NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date NOT NULL,
  `ruta` varchar(40) NOT NULL,
  `id_estado_ficha` int NOT NULL,
  `id_jornada` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `numero_ficha` (`numero_ficha`),
  KEY `fk_pro_fi` (`id_programa`),
  KEY `fk_esfi_fi` (`id_estado_ficha`),
  KEY `fk_jor_fi` (`id_jornada`),
  CONSTRAINT `fk_esfi_fi` FOREIGN KEY (`id_estado_ficha`) REFERENCES `estado_ficha` (`id`),
  CONSTRAINT `fk_jor_fi` FOREIGN KEY (`id_jornada`) REFERENCES `jornada` (`id`),
  CONSTRAINT `fk_pro_fi` FOREIGN KEY (`id_programa`) REFERENCES `programa` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ficha`
--

LOCK TABLES `ficha` WRITE;
/*!40000 ALTER TABLE `ficha` DISABLE KEYS */;
/*!40000 ALTER TABLE `ficha` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ficha_has_trimestre`
--

DROP TABLE IF EXISTS `ficha_has_trimestre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ficha_has_trimestre` (
  `id` int NOT NULL,
  `id_ficha` int NOT NULL,
  `id_trimestre` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_ficha` (`id_ficha`),
  UNIQUE KEY `id_trimestre` (`id_trimestre`),
  CONSTRAINT `fk_fi_fitr` FOREIGN KEY (`id_ficha`) REFERENCES `ficha` (`id`),
  CONSTRAINT `fk_tri_fitr` FOREIGN KEY (`id_trimestre`) REFERENCES `trimestre` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ficha_has_trimestre`
--

LOCK TABLES `ficha_has_trimestre` WRITE;
/*!40000 ALTER TABLE `ficha_has_trimestre` DISABLE KEYS */;
/*!40000 ALTER TABLE `ficha_has_trimestre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ficha_planeacion`
--

DROP TABLE IF EXISTS `ficha_planeacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ficha_planeacion` (
  `id` int NOT NULL,
  `id_ficha` int NOT NULL,
  `id_planeacion` int NOT NULL,
  `estado` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_ficha` (`id_ficha`),
  UNIQUE KEY `id_planeacion` (`id_planeacion`),
  CONSTRAINT `fk_fi_fipl` FOREIGN KEY (`id_ficha`) REFERENCES `ficha` (`id`),
  CONSTRAINT `fk_pl_fipl` FOREIGN KEY (`id_planeacion`) REFERENCES `planeacion` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ficha_planeacion`
--

LOCK TABLES `ficha_planeacion` WRITE;
/*!40000 ALTER TABLE `ficha_planeacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `ficha_planeacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grupo_proyecto`
--

DROP TABLE IF EXISTS `grupo_proyecto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `grupo_proyecto` (
  `id` int NOT NULL,
  `id_ficha` int NOT NULL,
  `numero_grupo` int NOT NULL,
  `nombre_proyecto` varchar(300) NOT NULL,
  `estado_proyecto` varchar(40) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_ficha` (`id_ficha`),
  UNIQUE KEY `numero_grupo` (`numero_grupo`),
  CONSTRAINT `fk_fi_grpr` FOREIGN KEY (`id_ficha`) REFERENCES `ficha` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grupo_proyecto`
--

LOCK TABLES `grupo_proyecto` WRITE;
/*!40000 ALTER TABLE `grupo_proyecto` DISABLE KEYS */;
/*!40000 ALTER TABLE `grupo_proyecto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `horario`
--

DROP TABLE IF EXISTS `horario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `horario` (
  `id` int NOT NULL,
  `hora_inicio` time NOT NULL,
  `id_ficha_has_trimestre` int NOT NULL,
  `id_instructor` int NOT NULL,
  `id_dia` int NOT NULL,
  `id_ambiente` int NOT NULL,
  `id_version_horario` int NOT NULL,
  `hora_fin` date NOT NULL,
  `id_modalidad` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `hora_inicio` (`hora_inicio`),
  UNIQUE KEY `id_ficha_has_trimestre` (`id_ficha_has_trimestre`),
  UNIQUE KEY `id_instructor` (`id_instructor`),
  UNIQUE KEY `id_dia` (`id_dia`),
  UNIQUE KEY `id_ambiente` (`id_ambiente`),
  UNIQUE KEY `id_version_horario` (`id_version_horario`),
  UNIQUE KEY `hora_fin` (`hora_fin`),
  KEY `fk_mod_hor` (`id_modalidad`),
  CONSTRAINT `fk_ambi_hor` FOREIGN KEY (`id_ambiente`) REFERENCES `ambiente` (`id`),
  CONSTRAINT `fk_di_hor` FOREIGN KEY (`id_dia`) REFERENCES `dia` (`id`),
  CONSTRAINT `fk_fitri_hor` FOREIGN KEY (`id_ficha_has_trimestre`) REFERENCES `ficha_has_trimestre` (`id`),
  CONSTRAINT `fk_ins_hor` FOREIGN KEY (`id_instructor`) REFERENCES `instructor` (`id`),
  CONSTRAINT `fk_mod_hor` FOREIGN KEY (`id_modalidad`) REFERENCES `modalidad` (`id`),
  CONSTRAINT `fk_verhor_hor` FOREIGN KEY (`id_version_horario`) REFERENCES `version_horario` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `horario`
--

LOCK TABLES `horario` WRITE;
/*!40000 ALTER TABLE `horario` DISABLE KEYS */;
/*!40000 ALTER TABLE `horario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `instructor`
--

DROP TABLE IF EXISTS `instructor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `instructor` (
  `id` int NOT NULL,
  `id_cliente` int NOT NULL,
  `estado` varchar(40) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_cliente` (`id_cliente`),
  CONSTRAINT `fk_cli_ins` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instructor`
--

LOCK TABLES `instructor` WRITE;
/*!40000 ALTER TABLE `instructor` DISABLE KEYS */;
/*!40000 ALTER TABLE `instructor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `integrantes_grupo`
--

DROP TABLE IF EXISTS `integrantes_grupo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `integrantes_grupo` (
  `id` int NOT NULL,
  `id_aprendiz` int NOT NULL,
  `id_grupo_proyecto` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_aprendiz` (`id_aprendiz`),
  UNIQUE KEY `id_grupo_proyecto` (`id_grupo_proyecto`),
  CONSTRAINT `fk_apr_obge` FOREIGN KEY (`id_aprendiz`) REFERENCES `aprendiz` (`id`),
  CONSTRAINT `fk_grpro_obge` FOREIGN KEY (`id_grupo_proyecto`) REFERENCES `grupo_proyecto` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `integrantes_grupo`
--

LOCK TABLES `integrantes_grupo` WRITE;
/*!40000 ALTER TABLE `integrantes_grupo` DISABLE KEYS */;
/*!40000 ALTER TABLE `integrantes_grupo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_lista`
--

DROP TABLE IF EXISTS `item_lista`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item_lista` (
  `id` int NOT NULL,
  `id_lista_chequeo` int NOT NULL,
  `numero_item` int NOT NULL,
  `pregunta` varchar(1000) NOT NULL,
  `id_resultado_aprendizaje` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_lista_chequeo` (`id_lista_chequeo`),
  UNIQUE KEY `numero_item` (`numero_item`),
  KEY `fk_reapre_itlis` (`id_resultado_aprendizaje`),
  CONSTRAINT `fk_lische_itlis` FOREIGN KEY (`id_lista_chequeo`) REFERENCES `lista_chequeo` (`id`),
  CONSTRAINT `fk_reapre_itlis` FOREIGN KEY (`id_resultado_aprendizaje`) REFERENCES `resultado_aprendizaje` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_lista`
--

LOCK TABLES `item_lista` WRITE;
/*!40000 ALTER TABLE `item_lista` DISABLE KEYS */;
/*!40000 ALTER TABLE `item_lista` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jornada`
--

DROP TABLE IF EXISTS `jornada`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jornada` (
  `id` int NOT NULL,
  `sigla_jornada` varchar(20) NOT NULL,
  `nombre_jornada` varchar(40) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `imagen_url` varchar(1000) DEFAULT NULL,
  `estado` varchar(40) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sigla_jornada` (`sigla_jornada`),
  UNIQUE KEY `nombre_jornada` (`nombre_jornada`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jornada`
--

LOCK TABLES `jornada` WRITE;
/*!40000 ALTER TABLE `jornada` DISABLE KEYS */;
/*!40000 ALTER TABLE `jornada` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jornada_instructor`
--

DROP TABLE IF EXISTS `jornada_instructor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jornada_instructor` (
  `id` int NOT NULL,
  `nombre_jornada` varchar(80) NOT NULL,
  `descripcion` varchar(200) NOT NULL,
  `estado` varchar(40) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre_jornada` (`nombre_jornada`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jornada_instructor`
--

LOCK TABLES `jornada_instructor` WRITE;
/*!40000 ALTER TABLE `jornada_instructor` DISABLE KEYS */;
/*!40000 ALTER TABLE `jornada_instructor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `limitacion_ambiente`
--

DROP TABLE IF EXISTS `limitacion_ambiente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `limitacion_ambiente` (
  `id` int NOT NULL,
  `id_resultado_aprendizaje` int NOT NULL,
  `id_ambiente` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_resultado_aprendizaje` (`id_resultado_aprendizaje`),
  UNIQUE KEY `id_ambiente` (`id_ambiente`),
  CONSTRAINT `fk_am_limamb` FOREIGN KEY (`id_ambiente`) REFERENCES `ambiente` (`id`),
  CONSTRAINT `fk_reapr_limamb` FOREIGN KEY (`id_resultado_aprendizaje`) REFERENCES `resultado_aprendizaje` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `limitacion_ambiente`
--

LOCK TABLES `limitacion_ambiente` WRITE;
/*!40000 ALTER TABLE `limitacion_ambiente` DISABLE KEYS */;
/*!40000 ALTER TABLE `limitacion_ambiente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lista_chequeo`
--

DROP TABLE IF EXISTS `lista_chequeo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lista_chequeo` (
  `id` int NOT NULL,
  `id_programa` int NOT NULL,
  `lista` varchar(50) NOT NULL,
  `estado` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `lista` (`lista`),
  KEY `fk_pro_lisch` (`id_programa`),
  CONSTRAINT `fk_pro_lisch` FOREIGN KEY (`id_programa`) REFERENCES `programa` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lista_chequeo`
--

LOCK TABLES `lista_chequeo` WRITE;
/*!40000 ALTER TABLE `lista_chequeo` DISABLE KEYS */;
/*!40000 ALTER TABLE `lista_chequeo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lista_ficha`
--

DROP TABLE IF EXISTS `lista_ficha`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lista_ficha` (
  `id` int NOT NULL,
  `id_ficha` int NOT NULL,
  `id_lista_chequeo` int NOT NULL,
  `estado` varchar(40) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_ficha` (`id_ficha`),
  UNIQUE KEY `id_lista_chequeo` (`id_lista_chequeo`),
  CONSTRAINT `fk_fi_lisfi` FOREIGN KEY (`id_ficha`) REFERENCES `ficha` (`id`),
  CONSTRAINT `fk_lisch_lisfi` FOREIGN KEY (`id_lista_chequeo`) REFERENCES `lista_chequeo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lista_ficha`
--

LOCK TABLES `lista_ficha` WRITE;
/*!40000 ALTER TABLE `lista_ficha` DISABLE KEYS */;
/*!40000 ALTER TABLE `lista_ficha` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_auditoria`
--

DROP TABLE IF EXISTS `log_auditoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `log_auditoria` (
  `id` int NOT NULL,
  `nivel` varchar(400) NOT NULL,
  `log_name` varchar(400) NOT NULL,
  `mensaje` varchar(400) NOT NULL,
  `fecha` date NOT NULL,
  `id_cliente` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_cli_logaud` (`id_cliente`),
  CONSTRAINT `fk_cli_logaud` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_auditoria`
--

LOCK TABLES `log_auditoria` WRITE;
/*!40000 ALTER TABLE `log_auditoria` DISABLE KEYS */;
/*!40000 ALTER TABLE `log_auditoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_errores`
--

DROP TABLE IF EXISTS `log_errores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `log_errores` (
  `id` int NOT NULL,
  `nivel` varchar(400) NOT NULL,
  `log_name` varchar(400) NOT NULL,
  `mensaje` varchar(400) NOT NULL,
  `fecha` date NOT NULL,
  `id_cliente` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_cli_logerr` (`id_cliente`),
  CONSTRAINT `fk_cli_logerr` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_errores`
--

LOCK TABLES `log_errores` WRITE;
/*!40000 ALTER TABLE `log_errores` DISABLE KEYS */;
/*!40000 ALTER TABLE `log_errores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modalidad`
--

DROP TABLE IF EXISTS `modalidad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `modalidad` (
  `id` int NOT NULL,
  `nombre_modalidad` varchar(40) NOT NULL,
  `color` varchar(50) NOT NULL,
  `estado` varchar(40) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre_modalidad` (`nombre_modalidad`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modalidad`
--

LOCK TABLES `modalidad` WRITE;
/*!40000 ALTER TABLE `modalidad` DISABLE KEYS */;
/*!40000 ALTER TABLE `modalidad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nivel_formacion`
--

DROP TABLE IF EXISTS `nivel_formacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nivel_formacion` (
  `id` int NOT NULL,
  `nivel` varchar(40) NOT NULL,
  `estado` varchar(40) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nivel` (`nivel`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nivel_formacion`
--

LOCK TABLES `nivel_formacion` WRITE;
/*!40000 ALTER TABLE `nivel_formacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `nivel_formacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `observacion_general`
--

DROP TABLE IF EXISTS `observacion_general`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `observacion_general` (
  `id` int NOT NULL,
  `numero` int NOT NULL,
  `id_grupo_proyecto` int NOT NULL,
  `observacion` varchar(500) NOT NULL,
  `jurado` varchar(500) NOT NULL,
  `fecha` timestamp NULL DEFAULT NULL,
  `id_cliente` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `numero` (`numero`),
  UNIQUE KEY `id_grupo_proyecto` (`id_grupo_proyecto`),
  KEY `fk_cli_obge` (`id_cliente`),
  CONSTRAINT `fk_cli_obge` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id`),
  CONSTRAINT `fk_grpr_obge` FOREIGN KEY (`id_grupo_proyecto`) REFERENCES `grupo_proyecto` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `observacion_general`
--

LOCK TABLES `observacion_general` WRITE;
/*!40000 ALTER TABLE `observacion_general` DISABLE KEYS */;
/*!40000 ALTER TABLE `observacion_general` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `observacion_respuesta`
--

DROP TABLE IF EXISTS `observacion_respuesta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `observacion_respuesta` (
  `id` int NOT NULL,
  `numero_obsercacion` int NOT NULL,
  `id_respuesta_grupo` int NOT NULL,
  `observacion` varchar(400) NOT NULL,
  `juradod` varchar(400) NOT NULL,
  `fecha` timestamp NULL DEFAULT NULL,
  `id_cliente` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `numero_obsercacion` (`numero_obsercacion`),
  UNIQUE KEY `id_respuesta_grupo` (`id_respuesta_grupo`),
  UNIQUE KEY `id_cliente` (`id_cliente`),
  CONSTRAINT `fk_cli_obre` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id`),
  CONSTRAINT `fk_regr_obre` FOREIGN KEY (`id_respuesta_grupo`) REFERENCES `respuesta_grupo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `observacion_respuesta`
--

LOCK TABLES `observacion_respuesta` WRITE;
/*!40000 ALTER TABLE `observacion_respuesta` DISABLE KEYS */;
/*!40000 ALTER TABLE `observacion_respuesta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `planeacion`
--

DROP TABLE IF EXISTS `planeacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `planeacion` (
  `id` int NOT NULL,
  `codigo` varchar(40) NOT NULL,
  `fecha` date DEFAULT NULL,
  `estado` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `codigo` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `planeacion`
--

LOCK TABLES `planeacion` WRITE;
/*!40000 ALTER TABLE `planeacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `planeacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `programa`
--

DROP TABLE IF EXISTS `programa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `programa` (
  `id` int NOT NULL,
  `codigo` varchar(50) NOT NULL,
  `version` varchar(40) NOT NULL,
  `nombre` varchar(500) NOT NULL,
  `sigla` varchar(40) NOT NULL,
  `estado` varchar(40) NOT NULL,
  `id_nivel_formacion` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `codigo` (`codigo`),
  UNIQUE KEY `version` (`version`),
  KEY `fk_nifo_pro` (`id_nivel_formacion`),
  CONSTRAINT `fk_nifo_pro` FOREIGN KEY (`id_nivel_formacion`) REFERENCES `nivel_formacion` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `programa`
--

LOCK TABLES `programa` WRITE;
/*!40000 ALTER TABLE `programa` DISABLE KEYS */;
/*!40000 ALTER TABLE `programa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `programacion_trimestre`
--

DROP TABLE IF EXISTS `programacion_trimestre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `programacion_trimestre` (
  `id` int NOT NULL,
  `id_resultado_aprendizaje` int NOT NULL,
  `id_trimestre` int NOT NULL,
  `id_planeacion` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_resultado_aprendizaje` (`id_resultado_aprendizaje`),
  UNIQUE KEY `id_trimestre` (`id_trimestre`),
  UNIQUE KEY `id_planeacion` (`id_planeacion`),
  CONSTRAINT `fk_pla_prtr` FOREIGN KEY (`id_planeacion`) REFERENCES `planeacion` (`id`),
  CONSTRAINT `fk_reapr_prtr` FOREIGN KEY (`id_resultado_aprendizaje`) REFERENCES `resultado_aprendizaje` (`id`),
  CONSTRAINT `fk_tri_prtr` FOREIGN KEY (`id_trimestre`) REFERENCES `trimestre` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `programacion_trimestre`
--

LOCK TABLES `programacion_trimestre` WRITE;
/*!40000 ALTER TABLE `programacion_trimestre` DISABLE KEYS */;
/*!40000 ALTER TABLE `programacion_trimestre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proyecto`
--

DROP TABLE IF EXISTS `proyecto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proyecto` (
  `id` int NOT NULL,
  `codigo` varchar(40) NOT NULL,
  `nombre` varchar(500) NOT NULL,
  `estado` varchar(40) NOT NULL,
  `id_programa` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `codigo` (`codigo`),
  KEY `fk_pro_proy` (`id_programa`),
  CONSTRAINT `fk_pro_proy` FOREIGN KEY (`id_programa`) REFERENCES `programa` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proyecto`
--

LOCK TABLES `proyecto` WRITE;
/*!40000 ALTER TABLE `proyecto` DISABLE KEYS */;
/*!40000 ALTER TABLE `proyecto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `respuesta_grupo`
--

DROP TABLE IF EXISTS `respuesta_grupo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `respuesta_grupo` (
  `id` int NOT NULL,
  `id_item_lista` int NOT NULL,
  `id_grupo_proyecto` int NOT NULL,
  `id_valoracion` int NOT NULL,
  `fecha` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_item_lista` (`id_item_lista`),
  UNIQUE KEY `id_grupo_proyecto` (`id_grupo_proyecto`),
  KEY `fk_val_regr` (`id_valoracion`),
  CONSTRAINT `fk_grpro_regr` FOREIGN KEY (`id_grupo_proyecto`) REFERENCES `grupo_proyecto` (`id`),
  CONSTRAINT `fk_itlis_regr` FOREIGN KEY (`id_item_lista`) REFERENCES `item_lista` (`id`),
  CONSTRAINT `fk_val_regr` FOREIGN KEY (`id_valoracion`) REFERENCES `valoracion` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `respuesta_grupo`
--

LOCK TABLES `respuesta_grupo` WRITE;
/*!40000 ALTER TABLE `respuesta_grupo` DISABLE KEYS */;
/*!40000 ALTER TABLE `respuesta_grupo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resultado_aprendizaje`
--

DROP TABLE IF EXISTS `resultado_aprendizaje`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `resultado_aprendizaje` (
  `id` int NOT NULL,
  `codigo_resultado` varchar(40) NOT NULL,
  `id_competencia` int NOT NULL,
  `denominacion` varchar(1000) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `codigo_resultado` (`codigo_resultado`),
  UNIQUE KEY `id_competencia` (`id_competencia`),
  CONSTRAINT `fk_com_reapr` FOREIGN KEY (`id_competencia`) REFERENCES `competencia` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resultado_aprendizaje`
--

LOCK TABLES `resultado_aprendizaje` WRITE;
/*!40000 ALTER TABLE `resultado_aprendizaje` DISABLE KEYS */;
/*!40000 ALTER TABLE `resultado_aprendizaje` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resultados_vistos`
--

DROP TABLE IF EXISTS `resultados_vistos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `resultados_vistos` (
  `id` int NOT NULL,
  `id_resultado_aprendizaje` int NOT NULL,
  `id_ficha_has_trimestre` int NOT NULL,
  `id_planeacion` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_resultado_aprendizaje` (`id_resultado_aprendizaje`),
  UNIQUE KEY `id_ficha_has_trimestre` (`id_ficha_has_trimestre`),
  UNIQUE KEY `id_planeacion` (`id_planeacion`),
  CONSTRAINT `fk_fitri_revi` FOREIGN KEY (`id_ficha_has_trimestre`) REFERENCES `ficha_has_trimestre` (`id`),
  CONSTRAINT `fk_pla_revi` FOREIGN KEY (`id_planeacion`) REFERENCES `planeacion` (`id`),
  CONSTRAINT `fk_reapr_revis` FOREIGN KEY (`id_resultado_aprendizaje`) REFERENCES `resultado_aprendizaje` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resultados_vistos`
--

LOCK TABLES `resultados_vistos` WRITE;
/*!40000 ALTER TABLE `resultados_vistos` DISABLE KEYS */;
/*!40000 ALTER TABLE `resultados_vistos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sede`
--

DROP TABLE IF EXISTS `sede`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sede` (
  `id` int NOT NULL,
  `nombre_sede` varchar(50) NOT NULL,
  `direccion` varchar(400) NOT NULL,
  `estado` varchar(40) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre_sede` (`nombre_sede`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sede`
--

LOCK TABLES `sede` WRITE;
/*!40000 ALTER TABLE `sede` DISABLE KEYS */;
/*!40000 ALTER TABLE `sede` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_user`
--

DROP TABLE IF EXISTS `system_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_user` (
  `id` int NOT NULL,
  `login` varchar(50) NOT NULL,
  `pass` varchar(50) NOT NULL,
  `email` varchar(254) NOT NULL,
  `activated` int DEFAULT NULL,
  `long_key` varchar(6) NOT NULL,
  `image_url` varchar(256) DEFAULT NULL,
  `activation_key` varchar(20) DEFAULT NULL,
  `reset_key` varchar(20) DEFAULT NULL,
  `reset_date` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `login` (`login`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_user`
--

LOCK TABLES `system_user` WRITE;
/*!40000 ALTER TABLE `system_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `system_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_ambiente`
--

DROP TABLE IF EXISTS `tipo_ambiente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_ambiente` (
  `id` int NOT NULL,
  `tipo` varchar(40) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `estado` varchar(40) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tipo` (`tipo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_ambiente`
--

LOCK TABLES `tipo_ambiente` WRITE;
/*!40000 ALTER TABLE `tipo_ambiente` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipo_ambiente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_document`
--

DROP TABLE IF EXISTS `tipo_document`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_document` (
  `id` int NOT NULL,
  `sigla` varchar(10) NOT NULL,
  `nombre_documento` varchar(100) NOT NULL,
  `estado` varchar(40) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sigla` (`sigla`),
  UNIQUE KEY `nombre_documento` (`nombre_documento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_document`
--

LOCK TABLES `tipo_document` WRITE;
/*!40000 ALTER TABLE `tipo_document` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipo_document` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trimestre`
--

DROP TABLE IF EXISTS `trimestre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trimestre` (
  `id` int NOT NULL,
  `nombre_trimestre` int NOT NULL,
  `id_jornada` int NOT NULL,
  `id_nivel_formacion` int NOT NULL,
  `estado` varchar(40) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre_trimestre` (`nombre_trimestre`),
  UNIQUE KEY `id_jornada` (`id_jornada`),
  UNIQUE KEY `id_nivel_formacion` (`id_nivel_formacion`),
  CONSTRAINT `fk_jor_tri` FOREIGN KEY (`id_jornada`) REFERENCES `jornada` (`id`),
  CONSTRAINT `fk_nifo_tri` FOREIGN KEY (`id_nivel_formacion`) REFERENCES `nivel_formacion` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trimestre`
--

LOCK TABLES `trimestre` WRITE;
/*!40000 ALTER TABLE `trimestre` DISABLE KEYS */;
/*!40000 ALTER TABLE `trimestre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trimestre_vigente`
--

DROP TABLE IF EXISTS `trimestre_vigente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trimestre_vigente` (
  `id` int NOT NULL,
  `id_anio` int NOT NULL,
  `trimestre_programado` int NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date NOT NULL,
  `estado` varchar(40) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_anio` (`id_anio`),
  UNIQUE KEY `trimestre_programado` (`trimestre_programado`),
  CONSTRAINT `fk_ani_trvig` FOREIGN KEY (`id_anio`) REFERENCES `anio` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trimestre_vigente`
--

LOCK TABLES `trimestre_vigente` WRITE;
/*!40000 ALTER TABLE `trimestre_vigente` DISABLE KEYS */;
/*!40000 ALTER TABLE `trimestre_vigente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_autorithy`
--

DROP TABLE IF EXISTS `user_autorithy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_autorithy` (
  `name_rol` varchar(50) NOT NULL,
  `id_system_user` int NOT NULL,
  PRIMARY KEY (`name_rol`,`id_system_user`),
  KEY `fk_sys_usau` (`id_system_user`),
  CONSTRAINT `fk_au_usau` FOREIGN KEY (`name_rol`) REFERENCES `autorithy` (`nombre`),
  CONSTRAINT `fk_sys_usau` FOREIGN KEY (`id_system_user`) REFERENCES `system_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_autorithy`
--

LOCK TABLES `user_autorithy` WRITE;
/*!40000 ALTER TABLE `user_autorithy` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_autorithy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `valoracion`
--

DROP TABLE IF EXISTS `valoracion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `valoracion` (
  `id` int NOT NULL,
  `tipo_valoracion` varchar(50) NOT NULL,
  `estado` varchar(40) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tipo_valoracion` (`tipo_valoracion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `valoracion`
--

LOCK TABLES `valoracion` WRITE;
/*!40000 ALTER TABLE `valoracion` DISABLE KEYS */;
/*!40000 ALTER TABLE `valoracion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `version_horario`
--

DROP TABLE IF EXISTS `version_horario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `version_horario` (
  `id` int NOT NULL,
  `numero_version` varchar(40) NOT NULL,
  `id_trimestre_vigente` int NOT NULL,
  `estado` varchar(40) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `numero_version` (`numero_version`),
  UNIQUE KEY `id_trimestre_vigente` (`id_trimestre_vigente`),
  CONSTRAINT `fk_trvig_verhor` FOREIGN KEY (`id_trimestre_vigente`) REFERENCES `trimestre_vigente` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `version_horario`
--

LOCK TABLES `version_horario` WRITE;
/*!40000 ALTER TABLE `version_horario` DISABLE KEYS */;
/*!40000 ALTER TABLE `version_horario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vinculacion`
--

DROP TABLE IF EXISTS `vinculacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vinculacion` (
  `id` int NOT NULL,
  `tipo_vinculacion` varchar(40) NOT NULL,
  `horas` int NOT NULL,
  `estado` varchar(40) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tipo_vinculacion` (`tipo_vinculacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vinculacion`
--

LOCK TABLES `vinculacion` WRITE;
/*!40000 ALTER TABLE `vinculacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `vinculacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vinculacion_instructor`
--

DROP TABLE IF EXISTS `vinculacion_instructor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vinculacion_instructor` (
  `id` int NOT NULL,
  `id_anio` int NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date NOT NULL,
  `id_vinculacion` int NOT NULL,
  `id_instructor` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_anio` (`id_anio`),
  UNIQUE KEY `fecha_inicio` (`fecha_inicio`),
  UNIQUE KEY `fecha_fin` (`fecha_fin`),
  UNIQUE KEY `id_vinculacion` (`id_vinculacion`),
  UNIQUE KEY `id_instructor` (`id_instructor`),
  CONSTRAINT `fk_ani_viins` FOREIGN KEY (`id_anio`) REFERENCES `anio` (`id`),
  CONSTRAINT `fk_ins_vinins` FOREIGN KEY (`id_instructor`) REFERENCES `instructor` (`id`),
  CONSTRAINT `fk_vin_vinisn` FOREIGN KEY (`id_vinculacion`) REFERENCES `vinculacion` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vinculacion_instructor`
--

LOCK TABLES `vinculacion_instructor` WRITE;
/*!40000 ALTER TABLE `vinculacion_instructor` DISABLE KEYS */;
/*!40000 ALTER TABLE `vinculacion_instructor` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-05-23 12:21:43

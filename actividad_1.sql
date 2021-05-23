CREATE DATABASE  IF NOT EXISTS `actividad1` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `actividad1`;
-- MySQL dump 10.13  Distrib 8.0.24, for Win64 (x86_64)
--
-- Host: localhost    Database: actividad1
-- ------------------------------------------------------
-- Server version	8.0.24

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
  `codigo_resultado` varchar(40) NOT NULL,
  `codigo_competencia` varchar(40) NOT NULL,
  `programa_codigo` varchar(50) NOT NULL,
  `programa_version` varchar(40) NOT NULL,
  `codigo_planeacion` varchar(40) NOT NULL,
  `nombre_trimestre` int NOT NULL,
  `sigla_jornada` varchar(20) NOT NULL,
  `nivel` varchar(40) NOT NULL,
  `numero_actividad` int NOT NULL,
  `nombre_fase` varchar(40) NOT NULL,
  `proyecto_codigo` varchar(40) NOT NULL,
  PRIMARY KEY (`codigo_resultado`,`codigo_competencia`,`programa_codigo`,`programa_version`,`codigo_planeacion`,`nombre_trimestre`,`sigla_jornada`,`nivel`,`numero_actividad`,`nombre_fase`,`proyecto_codigo`),
  KEY `fk_acti_acpl` (`numero_actividad`,`nombre_fase`,`proyecto_codigo`),
  CONSTRAINT `fk_acti_acpl` FOREIGN KEY (`numero_actividad`, `nombre_fase`, `proyecto_codigo`) REFERENCES `actividad_proyecto` (`numero_actividad`, `nombre`, `proyecto_codigo`),
  CONSTRAINT `fk_pltr_acpl` FOREIGN KEY (`codigo_resultado`, `codigo_competencia`, `programa_codigo`, `programa_version`, `codigo_planeacion`, `nombre_trimestre`, `sigla_jornada`, `nivel`) REFERENCES `planeacion_trimestre` (`codigo_resultado`, `codigo_competencia`, `programa_codigo`, `programa_version`, `codigo_planeacion`, `nombre_trimestre`, `sigla_jornada`, `nivel`)
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
  `numero_actividad` int NOT NULL,
  `descripcion_actividad` varchar(400) NOT NULL,
  `estado` varchar(40) NOT NULL,
  `nombre` varchar(40) NOT NULL,
  `proyecto_codigo` varchar(40) NOT NULL,
  PRIMARY KEY (`numero_actividad`,`nombre`,`proyecto_codigo`),
  KEY `fk_fase_acti` (`nombre`,`proyecto_codigo`),
  CONSTRAINT `fk_fase_acti` FOREIGN KEY (`nombre`, `proyecto_codigo`) REFERENCES `fase` (`nombre`, `proyecto_codigo`)
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
  `numero_ambiente` varchar(50) NOT NULL,
  `nombre_sede` varchar(50) NOT NULL,
  `descripcion` varchar(1000) NOT NULL,
  `estado` varchar(40) NOT NULL,
  `limitacion` varchar(40) NOT NULL,
  `tipo` varchar(50) NOT NULL,
  PRIMARY KEY (`numero_ambiente`,`nombre_sede`),
  KEY `fk_tiam_am` (`tipo`),
  KEY `fk_se_am` (`nombre_sede`),
  CONSTRAINT `fk_se_am` FOREIGN KEY (`nombre_sede`) REFERENCES `sede` (`nombre_sede`),
  CONSTRAINT `fk_tiam_am` FOREIGN KEY (`tipo`) REFERENCES `tip_ambiente` (`tipo`)
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
-- Table structure for table `aprendiz`
--

DROP TABLE IF EXISTS `aprendiz`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aprendiz` (
  `numero_documento` varchar(50) NOT NULL,
  `sigla` varchar(10) NOT NULL,
  `numero_ficha` varchar(100) NOT NULL,
  `nombre_estado` varchar(40) NOT NULL,
  PRIMARY KEY (`numero_documento`,`sigla`,`numero_ficha`),
  UNIQUE KEY `numero_ficha_UNIQUE` (`numero_ficha`),
  KEY `FKaprendiz101644` (`nombre_estado`),
  CONSTRAINT `fk_fich_apre` FOREIGN KEY (`numero_ficha`) REFERENCES `ficha` (`numero_ficha`),
  CONSTRAINT `FKaprendiz101644` FOREIGN KEY (`nombre_estado`) REFERENCES `estado_formacion` (`nombre_estado`)
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
  `nombre_area` varchar(40) NOT NULL,
  `estado` varchar(40) NOT NULL,
  `url_logo` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`nombre_area`)
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
  `nombre_area` varchar(40) NOT NULL,
  `numero_documento` varchar(50) NOT NULL,
  `sigla` varchar(10) NOT NULL,
  `estado` varchar(40) NOT NULL,
  PRIMARY KEY (`nombre_area`,`numero_documento`,`sigla`),
  KEY `fk_ins_arin` (`numero_documento`,`sigla`),
  CONSTRAINT `fk_area_arin` FOREIGN KEY (`nombre_area`) REFERENCES `area` (`nombre_area`),
  CONSTRAINT `fk_ins_arin` FOREIGN KEY (`numero_documento`, `sigla`) REFERENCES `instructor` (`numero_documento`, `sigla`)
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
-- Table structure for table `año`
--

DROP TABLE IF EXISTS `año`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `año` (
  `numero_año` int NOT NULL,
  `estado` varchar(40) NOT NULL,
  PRIMARY KEY (`numero_año`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `año`
--

LOCK TABLES `año` WRITE;
/*!40000 ALTER TABLE `año` DISABLE KEYS */;
/*!40000 ALTER TABLE `año` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `numero_documento` varchar(50) NOT NULL,
  `primer_nombre` varchar(50) NOT NULL,
  `segundo_nombre` varchar(50) DEFAULT NULL,
  `primer_apellido` varchar(50) NOT NULL,
  `segundo_apellido` varchar(50) DEFAULT NULL,
  `sigla` varchar(10) NOT NULL,
  `login` varchar(50) NOT NULL,
  PRIMARY KEY (`sigla`,`login`,`numero_documento`),
  UNIQUE KEY `login` (`login`),
  CONSTRAINT `fk_tido_clie` FOREIGN KEY (`sigla`) REFERENCES `tipo_documento` (`sigla`),
  CONSTRAINT `fk_usu_clie` FOREIGN KEY (`login`) REFERENCES `usuario` (`login`)
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
-- Table structure for table `competencias`
--

DROP TABLE IF EXISTS `competencias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `competencias` (
  `codigo_competencia` varchar(40) NOT NULL,
  `denominacion` varchar(1000) NOT NULL,
  `programa_codigo` varchar(50) NOT NULL,
  `programa_version` varchar(40) NOT NULL,
  PRIMARY KEY (`codigo_competencia`,`programa_codigo`,`programa_version`),
  KEY `fk_prog_comp` (`programa_codigo`,`programa_version`),
  CONSTRAINT `fk_prog_comp` FOREIGN KEY (`programa_codigo`, `programa_version`) REFERENCES `programa` (`codigo`, `version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `competencias`
--

LOCK TABLES `competencias` WRITE;
/*!40000 ALTER TABLE `competencias` DISABLE KEYS */;
/*!40000 ALTER TABLE `competencias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dia`
--

DROP TABLE IF EXISTS `dia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dia` (
  `nombre_dia` varchar(40) NOT NULL,
  `estado` varchar(40) NOT NULL,
  PRIMARY KEY (`nombre_dia`)
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
  `hora_inicio` int NOT NULL,
  `hora_fin` int NOT NULL,
  `nombre_jornada` varchar(40) NOT NULL,
  `nombre_dia` varchar(40) NOT NULL,
  PRIMARY KEY (`hora_inicio`,`hora_fin`,`nombre_jornada`,`nombre_dia`),
  KEY `fk_join_diaj` (`nombre_jornada`),
  KEY `fk_dia_dij` (`nombre_dia`),
  CONSTRAINT `fk_dia_dij` FOREIGN KEY (`nombre_dia`) REFERENCES `dia` (`nombre_dia`),
  CONSTRAINT `fk_join_diaj` FOREIGN KEY (`nombre_jornada`) REFERENCES `jornada_instructor` (`nombre_jornada`)
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
  `fecha_inicio` date NOT NULL,
  `numero_documento` varchar(50) NOT NULL,
  `sigla` varchar(10) NOT NULL,
  `numero_año` int NOT NULL,
  `tipo_vinculacion` varchar(40) NOT NULL,
  `nombre_jornada` varchar(40) NOT NULL,
  `codigo_competencia` varchar(40) NOT NULL,
  `programa_codigo` varchar(50) NOT NULL,
  `programa_version` varchar(40) NOT NULL,
  PRIMARY KEY (`fecha_inicio`,`numero_documento`,`sigla`,`numero_año`,`tipo_vinculacion`,`nombre_jornada`,`codigo_competencia`,`programa_codigo`,`programa_version`),
  KEY `fk_comp_discom` (`codigo_competencia`,`programa_codigo`,`programa_version`),
  CONSTRAINT `fk_comp_discom` FOREIGN KEY (`codigo_competencia`, `programa_codigo`, `programa_version`) REFERENCES `competencias` (`codigo_competencia`, `programa_codigo`, `programa_version`),
  CONSTRAINT `fk_diho_dico` FOREIGN KEY (`fecha_inicio`, `numero_documento`, `sigla`, `numero_año`, `tipo_vinculacion`, `nombre_jornada`) REFERENCES `disponibilidad_horaria` (`fecha_inicio`, `numero_documento`, `sigla`, `numero_año`, `tipo_vinculacion`, `nombre_jornada`)
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
  `fecha_inicio` date NOT NULL,
  `numero_documento` varchar(50) NOT NULL,
  `sigla` varchar(10) NOT NULL,
  `numero_año` int NOT NULL,
  `tipo_vinculacion` varchar(40) NOT NULL,
  `nombre_jornada` varchar(40) NOT NULL,
  PRIMARY KEY (`fecha_inicio`,`numero_documento`,`sigla`,`numero_año`,`tipo_vinculacion`,`nombre_jornada`),
  KEY `fk_join_diho` (`nombre_jornada`),
  CONSTRAINT `fk_join_diho` FOREIGN KEY (`nombre_jornada`) REFERENCES `jornada_instructor` (`nombre_jornada`),
  CONSTRAINT `fk_viin_diho` FOREIGN KEY (`fecha_inicio`, `numero_documento`, `sigla`, `numero_año`, `tipo_vinculacion`) REFERENCES `vinculacion_instructor` (`fecha_inicio`, `numero_documento`, `sigla`, `numero_año`, `tipo_vinculacion`)
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
  `nombre_estado` varchar(20) NOT NULL,
  `estado` int NOT NULL,
  PRIMARY KEY (`nombre_estado`)
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
  `nombre_estado` varchar(40) NOT NULL,
  `estado` varchar(40) NOT NULL,
  PRIMARY KEY (`nombre_estado`)
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
  `nombre` varchar(40) NOT NULL,
  `estado` varchar(40) NOT NULL,
  `proyecto_codigo` varchar(40) NOT NULL,
  PRIMARY KEY (`nombre`,`proyecto_codigo`),
  KEY `fk_pory_fase` (`proyecto_codigo`),
  CONSTRAINT `fk_pory_fase` FOREIGN KEY (`proyecto_codigo`) REFERENCES `proyecto` (`codigo`)
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
  `numero_ficha` varchar(100) NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date NOT NULL,
  `ruta` varchar(40) NOT NULL,
  `nombre_estado` varchar(20) NOT NULL,
  `sigla_jornada` varchar(20) NOT NULL,
  `codigo` varchar(50) NOT NULL,
  `version` varchar(40) NOT NULL,
  PRIMARY KEY (`numero_ficha`),
  KEY `fk_exfi_fich` (`nombre_estado`),
  KEY `fk_jor_fich` (`sigla_jornada`),
  KEY `fk_prog_fich` (`codigo`,`version`),
  CONSTRAINT `fk_exfi_fich` FOREIGN KEY (`nombre_estado`) REFERENCES `estado_ficha` (`nombre_estado`),
  CONSTRAINT `fk_jor_fich` FOREIGN KEY (`sigla_jornada`) REFERENCES `jornada` (`sigla_jornada`),
  CONSTRAINT `fk_prog_fich` FOREIGN KEY (`codigo`, `version`) REFERENCES `programa` (`codigo`, `version`)
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
  `numero_ficha` varchar(100) NOT NULL,
  `sigla_jornada` varchar(20) NOT NULL,
  `nivel` varchar(40) NOT NULL,
  `nombre_trimestre` int NOT NULL,
  PRIMARY KEY (`numero_ficha`,`sigla_jornada`,`nivel`,`nombre_trimestre`),
  KEY `fk_trim_fitri` (`nombre_trimestre`,`sigla_jornada`,`nivel`),
  CONSTRAINT `fk_fich_fitri` FOREIGN KEY (`numero_ficha`) REFERENCES `ficha` (`numero_ficha`),
  CONSTRAINT `fk_trim_fitri` FOREIGN KEY (`nombre_trimestre`, `sigla_jornada`, `nivel`) REFERENCES `trimestre` (`nombre_trimestre`, `sigla_jornada`, `nivel`)
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
-- Table structure for table `ficha_planacion`
--

DROP TABLE IF EXISTS `ficha_planacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ficha_planacion` (
  `estado` varchar(40) NOT NULL,
  `codigo_planeacion` varchar(40) NOT NULL,
  `numero_ficha` varchar(100) NOT NULL,
  PRIMARY KEY (`codigo_planeacion`,`numero_ficha`),
  KEY `fk_ficha_fipl` (`numero_ficha`),
  CONSTRAINT `fk_ficha_fipl` FOREIGN KEY (`numero_ficha`) REFERENCES `ficha` (`numero_ficha`),
  CONSTRAINT `fk_pla_fipl` FOREIGN KEY (`codigo_planeacion`) REFERENCES `planeacion` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ficha_planacion`
--

LOCK TABLES `ficha_planacion` WRITE;
/*!40000 ALTER TABLE `ficha_planacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `ficha_planacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grupo_proyecto`
--

DROP TABLE IF EXISTS `grupo_proyecto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `grupo_proyecto` (
  `numero_grupo` int NOT NULL,
  `nombre_proyecto` varchar(300) NOT NULL,
  `estado` varchar(40) NOT NULL,
  `numero_ficha` varchar(100) NOT NULL,
  PRIMARY KEY (`numero_grupo`,`numero_ficha`),
  KEY `fk_ficha_grpo` (`numero_ficha`),
  CONSTRAINT `fk_ficha_grpo` FOREIGN KEY (`numero_ficha`) REFERENCES `ficha` (`numero_ficha`)
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
  `hora_inicio` time NOT NULL,
  `hora_fin` time NOT NULL,
  `nombre_dia` varchar(40) NOT NULL,
  `numero_ambiente` varchar(50) NOT NULL,
  `nombre_sede` varchar(50) NOT NULL,
  `nombre_modalidad` varchar(40) NOT NULL,
  `numero_ficha` varchar(100) NOT NULL,
  `sigla_jornada` varchar(20) NOT NULL,
  `nivel` varchar(40) NOT NULL,
  `nombre_trimestre` int NOT NULL,
  `numero_documento` varchar(50) NOT NULL,
  `instructorsigla` varchar(10) NOT NULL,
  PRIMARY KEY (`hora_inicio`,`nombre_dia`,`numero_ambiente`,`nombre_sede`,`numero_ficha`,`sigla_jornada`,`nivel`,`nombre_trimestre`,`numero_documento`,`instructorsigla`),
  KEY `fk_ambi_hora` (`numero_ambiente`,`nombre_sede`),
  KEY `fk_dia_hora` (`nombre_dia`),
  KEY `fk_fich_hora` (`numero_ficha`,`sigla_jornada`,`nivel`,`nombre_trimestre`),
  KEY `fk_hora_ins` (`numero_documento`,`instructorsigla`),
  KEY `fk_moda_hora` (`nombre_modalidad`),
  CONSTRAINT `fk_ambi_hora` FOREIGN KEY (`numero_ambiente`, `nombre_sede`) REFERENCES `ambiente` (`numero_ambiente`, `nombre_sede`),
  CONSTRAINT `fk_dia_hora` FOREIGN KEY (`nombre_dia`) REFERENCES `dia` (`nombre_dia`),
  CONSTRAINT `fk_fich_hora` FOREIGN KEY (`numero_ficha`, `sigla_jornada`, `nivel`, `nombre_trimestre`) REFERENCES `ficha_has_trimestre` (`numero_ficha`, `sigla_jornada`, `nivel`, `nombre_trimestre`),
  CONSTRAINT `fk_hora_ins` FOREIGN KEY (`numero_documento`, `instructorsigla`) REFERENCES `instructor` (`numero_documento`, `sigla`),
  CONSTRAINT `fk_moda_hora` FOREIGN KEY (`nombre_modalidad`) REFERENCES `modalidad` (`nombre_modalidad`)
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
  `estado` varchar(40) NOT NULL,
  `numero_documento` varchar(50) NOT NULL,
  `sigla` varchar(10) NOT NULL,
  PRIMARY KEY (`numero_documento`,`sigla`)
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
  `numero_documento` varchar(50) NOT NULL,
  `sigla` varchar(10) NOT NULL,
  `numero_ficha` varchar(100) NOT NULL,
  `numero_grupo` int NOT NULL,
  `numero_ficha2` varchar(100) NOT NULL,
  PRIMARY KEY (`numero_documento`,`sigla`,`numero_ficha`,`numero_grupo`,`numero_ficha2`),
  KEY `fk_grpr_ingr` (`numero_grupo`,`numero_ficha2`),
  CONSTRAINT `fk_apre_ingr` FOREIGN KEY (`numero_documento`, `sigla`, `numero_ficha`) REFERENCES `aprendiz` (`numero_documento`, `sigla`, `numero_ficha`),
  CONSTRAINT `fk_grpr_ingr` FOREIGN KEY (`numero_grupo`, `numero_ficha2`) REFERENCES `grupo_proyecto` (`numero_grupo`, `numero_ficha`)
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
  `numero_item` int NOT NULL,
  `pregunta` varchar(1000) NOT NULL,
  `id_resultado_aprendizaje` int NOT NULL,
  `codigo_resultado` varchar(40) NOT NULL,
  `codigo_competencia` varchar(40) NOT NULL,
  `programa_codigo` varchar(50) NOT NULL,
  `programa_version` varchar(40) NOT NULL,
  PRIMARY KEY (`numero_item`),
  KEY `fk_reap_itli` (`codigo_resultado`,`codigo_competencia`,`programa_codigo`,`programa_version`),
  CONSTRAINT `fk_reap_itli` FOREIGN KEY (`codigo_resultado`, `codigo_competencia`, `programa_codigo`, `programa_version`) REFERENCES `resultado_aprendizaje` (`codigo_resultado`, `codigo_competencia`, `programa_codigo`, `programa_version`)
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
  `sigla_jornada` varchar(20) NOT NULL,
  `nombre_jornada` varchar(40) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `imagen_url` varchar(1000) DEFAULT NULL,
  `estado` varchar(40) NOT NULL,
  PRIMARY KEY (`sigla_jornada`),
  UNIQUE KEY `nombre_jornada_UNIQUE` (`nombre_jornada`)
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
  `nombre_jornada` varchar(40) NOT NULL,
  `descripcion` varchar(200) NOT NULL,
  `estado` varchar(40) NOT NULL,
  PRIMARY KEY (`nombre_jornada`)
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
  `numero_ambiente` varchar(50) NOT NULL,
  `nombre_sede` varchar(50) NOT NULL,
  `codigo_resultado` varchar(40) NOT NULL,
  `codigo_competencia` varchar(40) NOT NULL,
  `programa_codigo` varchar(50) NOT NULL,
  `programa_version` varchar(40) NOT NULL,
  PRIMARY KEY (`numero_ambiente`,`nombre_sede`,`codigo_resultado`,`codigo_competencia`,`programa_codigo`,`programa_version`),
  KEY `fk_reap_liam` (`codigo_resultado`,`codigo_competencia`,`programa_codigo`,`programa_version`),
  CONSTRAINT `fk_ambi_liam` FOREIGN KEY (`numero_ambiente`, `nombre_sede`) REFERENCES `ambiente` (`numero_ambiente`, `nombre_sede`),
  CONSTRAINT `fk_reap_liam` FOREIGN KEY (`codigo_resultado`, `codigo_competencia`, `programa_codigo`, `programa_version`) REFERENCES `resultado_aprendizaje` (`codigo_resultado`, `codigo_competencia`, `programa_codigo`, `programa_version`)
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
  `lista` varchar(50) NOT NULL,
  `estado` int NOT NULL,
  `programa_codigo` varchar(50) NOT NULL,
  `programa_version` varchar(40) NOT NULL,
  PRIMARY KEY (`lista`),
  KEY `fk_pro_lich` (`programa_codigo`,`programa_version`),
  CONSTRAINT `fk_pro_lich` FOREIGN KEY (`programa_codigo`, `programa_version`) REFERENCES `programa` (`codigo`, `version`)
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
  `numero_ficha` varchar(100) NOT NULL,
  `lista` varchar(50) NOT NULL,
  PRIMARY KEY (`numero_ficha`),
  UNIQUE KEY `lista` (`lista`),
  CONSTRAINT `fk_fich_lifh` FOREIGN KEY (`numero_ficha`) REFERENCES `ficha` (`numero_ficha`),
  CONSTRAINT `fk_lich_lifh` FOREIGN KEY (`lista`) REFERENCES `lista_chequeo` (`lista`)
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
  `numero_documento` varchar(50) NOT NULL,
  `sigla` varchar(10) NOT NULL,
  PRIMARY KEY (`id`,`numero_documento`,`sigla`)
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
  `numero_documento` varchar(50) NOT NULL,
  `sigla` varchar(10) NOT NULL,
  PRIMARY KEY (`id`,`numero_documento`,`sigla`)
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
  `nombre_modalidad` varchar(40) NOT NULL,
  `color` varchar(50) NOT NULL,
  `estado` varchar(40) NOT NULL,
  PRIMARY KEY (`nombre_modalidad`)
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
  `nivel` varchar(40) NOT NULL,
  `estado` varchar(40) NOT NULL,
  PRIMARY KEY (`nivel`)
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
  `numero` int NOT NULL,
  `observacion` varchar(500) NOT NULL,
  `jurado` varchar(500) NOT NULL,
  `fecha` timestamp NOT NULL,
  `numero_documento` varchar(50) NOT NULL,
  `sigla` varchar(10) NOT NULL,
  `numero_grupo` int NOT NULL,
  `numero_ficha` varchar(100) NOT NULL,
  PRIMARY KEY (`numero`,`numero_grupo`,`numero_ficha`),
  KEY `fk_grpr_obge` (`numero_grupo`,`numero_ficha`) /*!80000 INVISIBLE */,
  KEY `fk_clie_obge` (`numero_documento`,`sigla`) /*!80000 INVISIBLE */,
  CONSTRAINT `fk_grpr_obge` FOREIGN KEY (`numero_grupo`, `numero_ficha`) REFERENCES `grupo_proyecto` (`numero_grupo`, `numero_ficha`)
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
  `numero_observacion` int NOT NULL,
  `observacion` varchar(400) NOT NULL,
  `jurados` varchar(400) NOT NULL,
  `fecha` timestamp NOT NULL,
  `numero_documento` varchar(50) DEFAULT NULL,
  `sigla` varchar(10) DEFAULT NULL,
  `numero_grupo` int NOT NULL,
  `numero_ficha` varchar(100) NOT NULL,
  `numero_item` int NOT NULL,
  PRIMARY KEY (`numero_observacion`,`numero_grupo`,`numero_ficha`,`numero_item`),
  KEY `numero_observacion` (`numero_observacion`),
  KEY `fk_regr_obre` (`numero_grupo`,`numero_ficha`,`numero_item`) /*!80000 INVISIBLE */,
  KEY `fk_clie_obre` (`numero_documento`,`sigla`),
  CONSTRAINT `fk_regr_obre` FOREIGN KEY (`numero_grupo`, `numero_ficha`, `numero_item`) REFERENCES `respuesta_grupo` (`numero_grupo`, `numero_ficha`, `numero_item`)
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
  `codigo` varchar(40) NOT NULL,
  `estado` varchar(40) NOT NULL,
  `fecha` date NOT NULL,
  PRIMARY KEY (`codigo`)
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
-- Table structure for table `planeacion_trimestre`
--

DROP TABLE IF EXISTS `planeacion_trimestre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `planeacion_trimestre` (
  `codigo_resultado` varchar(40) NOT NULL,
  `codigo_competencia` varchar(40) NOT NULL,
  `programa_codigo` varchar(50) NOT NULL,
  `programa_version` varchar(40) NOT NULL,
  `codigo_planeacion` varchar(40) NOT NULL,
  `nombre_trimestre` int NOT NULL,
  `sigla_jornada` varchar(20) NOT NULL,
  `nivel` varchar(40) NOT NULL,
  PRIMARY KEY (`codigo_resultado`,`codigo_competencia`,`programa_codigo`,`programa_version`,`codigo_planeacion`,`nombre_trimestre`,`sigla_jornada`,`nivel`),
  KEY `fk_pla_pltr` (`codigo_planeacion`),
  KEY `fk_tri_pltr` (`nombre_trimestre`,`sigla_jornada`,`nivel`),
  CONSTRAINT `fk_pla_pltr` FOREIGN KEY (`codigo_planeacion`) REFERENCES `planeacion` (`codigo`),
  CONSTRAINT `fk_reap_pltr` FOREIGN KEY (`codigo_resultado`, `codigo_competencia`, `programa_codigo`, `programa_version`) REFERENCES `resultado_aprendizaje` (`codigo_resultado`, `codigo_competencia`, `programa_codigo`, `programa_version`),
  CONSTRAINT `fk_tri_pltr` FOREIGN KEY (`nombre_trimestre`, `sigla_jornada`, `nivel`) REFERENCES `trimestre` (`nombre_trimestre`, `sigla_jornada`, `nivel`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `planeacion_trimestre`
--

LOCK TABLES `planeacion_trimestre` WRITE;
/*!40000 ALTER TABLE `planeacion_trimestre` DISABLE KEYS */;
/*!40000 ALTER TABLE `planeacion_trimestre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `programa`
--

DROP TABLE IF EXISTS `programa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `programa` (
  `codigo` varchar(50) NOT NULL,
  `version` varchar(40) NOT NULL,
  `nombre` varchar(500) NOT NULL,
  `sigla` varchar(40) NOT NULL,
  `estado` varchar(40) NOT NULL,
  `nivel` varchar(40) NOT NULL,
  PRIMARY KEY (`codigo`,`version`),
  KEY `fk_nifo_prog` (`nivel`),
  CONSTRAINT `fk_nifo_prog` FOREIGN KEY (`nivel`) REFERENCES `nivel_formacion` (`nivel`)
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
-- Table structure for table `proyecto`
--

DROP TABLE IF EXISTS `proyecto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proyecto` (
  `codigo` varchar(40) NOT NULL,
  `nombre` varchar(1000) NOT NULL,
  `estado` varchar(40) NOT NULL,
  `programa_codigo` varchar(50) NOT NULL,
  `programa_version` varchar(40) NOT NULL,
  PRIMARY KEY (`codigo`),
  KEY `fk_prog_proy` (`programa_codigo`,`programa_version`),
  CONSTRAINT `fk_prog_proy` FOREIGN KEY (`programa_codigo`, `programa_version`) REFERENCES `programa` (`codigo`, `version`)
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
  `fecha` timestamp NOT NULL,
  `tipo_valoracion` varchar(50) NOT NULL,
  `numero_grupo` int NOT NULL,
  `numero_ficha` varchar(100) NOT NULL,
  `numero_item` int NOT NULL,
  PRIMARY KEY (`numero_grupo`,`numero_ficha`,`numero_item`),
  KEY `fk_itli_regr` (`numero_item`),
  KEY `fk_va_regr` (`tipo_valoracion`),
  CONSTRAINT `fk_grpr_regr` FOREIGN KEY (`numero_grupo`, `numero_ficha`) REFERENCES `grupo_proyecto` (`numero_grupo`, `numero_ficha`),
  CONSTRAINT `fk_itli_regr` FOREIGN KEY (`numero_item`) REFERENCES `item_lista` (`numero_item`),
  CONSTRAINT `fk_va_regr` FOREIGN KEY (`tipo_valoracion`) REFERENCES `valoracion` (`tipo_valoracion`)
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
  `codigo_resultado` varchar(40) NOT NULL,
  `denominacion` varchar(1000) NOT NULL,
  `codigo_competencia` varchar(40) NOT NULL,
  `programa_codigo` varchar(50) NOT NULL,
  `programa_version` varchar(40) NOT NULL,
  PRIMARY KEY (`codigo_resultado`,`codigo_competencia`,`programa_codigo`,`programa_version`),
  KEY `fk_comp_reap` (`codigo_competencia`,`programa_codigo`,`programa_version`),
  CONSTRAINT `fk_comp_reap` FOREIGN KEY (`codigo_competencia`, `programa_codigo`, `programa_version`) REFERENCES `competencias` (`codigo_competencia`, `programa_codigo`, `programa_version`)
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
-- Table structure for table `resultado_vistos`
--

DROP TABLE IF EXISTS `resultado_vistos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `resultado_vistos` (
  `codigo` varchar(40) NOT NULL,
  `codigo_resultado` varchar(40) NOT NULL,
  `codigo_competencia` varchar(40) NOT NULL,
  `programa_codigo` varchar(50) NOT NULL,
  `programa_version` varchar(40) NOT NULL,
  `nombre_trimestre` int NOT NULL,
  `nivel` varchar(40) NOT NULL,
  `numero_ficha` varchar(100) NOT NULL,
  `sigla_jornada` varchar(20) NOT NULL,
  PRIMARY KEY (`codigo`,`codigo_resultado`,`codigo_competencia`,`programa_codigo`,`programa_version`,`nombre_trimestre`,`nivel`,`numero_ficha`,`sigla_jornada`),
  KEY `fk_fitr_revi` (`numero_ficha`,`sigla_jornada`,`nivel`,`nombre_trimestre`),
  KEY `fk_reap_revi` (`codigo_resultado`,`codigo_competencia`,`programa_codigo`,`programa_version`),
  CONSTRAINT `fk_fitr_revi` FOREIGN KEY (`numero_ficha`, `sigla_jornada`, `nivel`, `nombre_trimestre`) REFERENCES `ficha_has_trimestre` (`numero_ficha`, `sigla_jornada`, `nivel`, `nombre_trimestre`),
  CONSTRAINT `fk_pla_revi` FOREIGN KEY (`codigo`) REFERENCES `planeacion` (`codigo`),
  CONSTRAINT `fk_reap_revi` FOREIGN KEY (`codigo_resultado`, `codigo_competencia`, `programa_codigo`, `programa_version`) REFERENCES `resultado_aprendizaje` (`codigo_resultado`, `codigo_competencia`, `programa_codigo`, `programa_version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resultado_vistos`
--

LOCK TABLES `resultado_vistos` WRITE;
/*!40000 ALTER TABLE `resultado_vistos` DISABLE KEYS */;
/*!40000 ALTER TABLE `resultado_vistos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rol`
--

DROP TABLE IF EXISTS `rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rol` (
  `nombre` varchar(50) NOT NULL,
  PRIMARY KEY (`nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rol`
--

LOCK TABLES `rol` WRITE;
/*!40000 ALTER TABLE `rol` DISABLE KEYS */;
/*!40000 ALTER TABLE `rol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sede`
--

DROP TABLE IF EXISTS `sede`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sede` (
  `nombre_sede` varchar(50) NOT NULL,
  `direccion` varchar(400) NOT NULL,
  `estado` varchar(40) NOT NULL,
  PRIMARY KEY (`nombre_sede`)
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
-- Table structure for table `tip_ambiente`
--

DROP TABLE IF EXISTS `tip_ambiente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tip_ambiente` (
  `tipo` varchar(50) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `estado` varchar(40) NOT NULL,
  PRIMARY KEY (`tipo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tip_ambiente`
--

LOCK TABLES `tip_ambiente` WRITE;
/*!40000 ALTER TABLE `tip_ambiente` DISABLE KEYS */;
/*!40000 ALTER TABLE `tip_ambiente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_documento`
--

DROP TABLE IF EXISTS `tipo_documento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_documento` (
  `sigla` varchar(10) NOT NULL,
  `nombre_documento` varchar(100) NOT NULL,
  `estado` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`sigla`),
  UNIQUE KEY `nombre_documento` (`nombre_documento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_documento`
--

LOCK TABLES `tipo_documento` WRITE;
/*!40000 ALTER TABLE `tipo_documento` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipo_documento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trimestre`
--

DROP TABLE IF EXISTS `trimestre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trimestre` (
  `nombre_trimestre` int NOT NULL,
  `estado` varchar(10) NOT NULL,
  `sigla_jornada` varchar(20) NOT NULL,
  `nivel` varchar(40) NOT NULL,
  PRIMARY KEY (`nombre_trimestre`,`sigla_jornada`,`nivel`),
  KEY `fk_jorn_trim` (`sigla_jornada`),
  KEY `fk_nifo_trim` (`nivel`),
  CONSTRAINT `fk_jorn_trim` FOREIGN KEY (`sigla_jornada`) REFERENCES `jornada` (`sigla_jornada`),
  CONSTRAINT `fk_nifo_trim` FOREIGN KEY (`nivel`) REFERENCES `nivel_formacion` (`nivel`)
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
  `trimestre_programado` int NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date NOT NULL,
  `estado` varchar(40) NOT NULL,
  `numero_año` int NOT NULL,
  PRIMARY KEY (`trimestre_programado`,`numero_año`),
  KEY `fk_trivi_año` (`numero_año`),
  CONSTRAINT `fk_trivi_año` FOREIGN KEY (`numero_año`) REFERENCES `año` (`numero_año`)
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
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `login` varchar(50) NOT NULL,
  `contraseña` varchar(60) NOT NULL,
  `email` varchar(255) NOT NULL,
  `actividad` int NOT NULL,
  `lang_key` varchar(6) NOT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `activation_key` varchar(20) DEFAULT NULL,
  `reset_key` varchar(20) DEFAULT NULL,
  `reset_date` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`login`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario_authority`
--

DROP TABLE IF EXISTS `usuario_authority`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario_authority` (
  `nombre_rol` varchar(50) NOT NULL,
  `login` varchar(50) NOT NULL,
  PRIMARY KEY (`nombre_rol`,`login`),
  KEY `fk_usu_usut` (`login`),
  CONSTRAINT `fk_rol_usut` FOREIGN KEY (`nombre_rol`) REFERENCES `rol` (`nombre`),
  CONSTRAINT `fk_usu_usut` FOREIGN KEY (`login`) REFERENCES `usuario` (`login`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario_authority`
--

LOCK TABLES `usuario_authority` WRITE;
/*!40000 ALTER TABLE `usuario_authority` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuario_authority` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `valoracion`
--

DROP TABLE IF EXISTS `valoracion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `valoracion` (
  `tipo_valoracion` varchar(50) NOT NULL,
  `estado` varchar(40) NOT NULL,
  PRIMARY KEY (`tipo_valoracion`)
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
  `numero_version` varchar(10) NOT NULL,
  `estado` varchar(40) NOT NULL,
  `trimestre_programado` int NOT NULL,
  `numero_año` int NOT NULL,
  PRIMARY KEY (`numero_version`,`trimestre_programado`,`numero_año`),
  KEY `numero_version` (`numero_version`),
  KEY `fk_trivi_viho` (`trimestre_programado`,`numero_año`),
  CONSTRAINT `fk_trivi_viho` FOREIGN KEY (`trimestre_programado`, `numero_año`) REFERENCES `trimestre_vigente` (`trimestre_programado`, `numero_año`)
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
  `tipo_vinculacion` varchar(40) NOT NULL,
  `hora` int NOT NULL,
  `estado` varchar(40) NOT NULL,
  PRIMARY KEY (`tipo_vinculacion`)
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
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date NOT NULL,
  `numero_documento` varchar(50) NOT NULL,
  `sigla` varchar(10) NOT NULL,
  `numero_año` int NOT NULL,
  `tipo_vinculacion` varchar(40) NOT NULL,
  PRIMARY KEY (`fecha_inicio`,`numero_documento`,`sigla`,`numero_año`,`tipo_vinculacion`),
  KEY `fk_ins_viin` (`numero_documento`,`sigla`),
  KEY `fk_año_viins` (`numero_año`),
  KEY `fk_vi_viin` (`tipo_vinculacion`),
  CONSTRAINT `fk_año_viins` FOREIGN KEY (`numero_año`) REFERENCES `año` (`numero_año`),
  CONSTRAINT `fk_ins_viin` FOREIGN KEY (`numero_documento`, `sigla`) REFERENCES `instructor` (`numero_documento`, `sigla`),
  CONSTRAINT `fk_vi_viin` FOREIGN KEY (`tipo_vinculacion`) REFERENCES `vinculacion` (`tipo_vinculacion`)
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

-- Dump completed on 2021-05-20 17:34:55

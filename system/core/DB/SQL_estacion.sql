CREATE DATABASE  IF NOT EXISTS `db_estacion` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish_ci */;
USE `db_estacion`;
-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: db_estacion
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.32-MariaDB

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
-- Table structure for table `table_cierre`
--

DROP TABLE IF EXISTS `table_cierre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `table_cierre` (
  `id_table_cierre` int(11) NOT NULL AUTO_INCREMENT,
  `tipo_cierre` varchar(45) DEFAULT NULL,
  `cant_cierre` varchar(45) DEFAULT NULL,
  `monto_cierre` varchar(45) DEFAULT NULL,
  `fecha_cierre` varchar(45) DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_table_cierre`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `table_cierre`
--

LOCK TABLES `table_cierre` WRITE;
/*!40000 ALTER TABLE `table_cierre` DISABLE KEYS */;
INSERT INTO `table_cierre` VALUES (1,'1','2','85','16-05-24',12),(2,'4','1','20','17-05-24',12),(3,'1','2','85','16-05-24',12),(4,'2','1','10','17-05-24',12),(5,'3','2','22','17-05-24',12),(6,'4','4','36','17-05-24',12);
/*!40000 ALTER TABLE `table_cierre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `table_log`
--

DROP TABLE IF EXISTS `table_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `table_log` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT,
  `log_idUser` int(11) DEFAULT NULL,
  `log_descripcion` text DEFAULT NULL,
  `log_comando` text DEFAULT NULL,
  `log_fecha` date DEFAULT NULL,
  PRIMARY KEY (`log_id`),
  KEY `log_idUser_idx` (`log_idUser`),
  CONSTRAINT `log_idUser` FOREIGN KEY (`log_idUser`) REFERENCES `table_user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `table_log`
--

LOCK TABLES `table_log` WRITE;
/*!40000 ALTER TABLE `table_log` DISABLE KEYS */;
INSERT INTO `table_log` VALUES (1,1,'/Busyaracuy/index.php1','UPDATE table_user SET user_status = ? WHERE user_id = 6',NULL);
/*!40000 ALTER TABLE `table_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `table_menu`
--

DROP TABLE IF EXISTS `table_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `table_menu` (
  `id_menu` int(11) NOT NULL,
  `nombre_menu` varchar(45) DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `icono` text DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `page_menu_open` varchar(20) DEFAULT NULL,
  `page_link` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `table_menu`
--

LOCK TABLES `table_menu` WRITE;
/*!40000 ALTER TABLE `table_menu` DISABLE KEYS */;
INSERT INTO `table_menu` VALUES (1,'Usuario',NULL,'far fa-user',1,'usuario','usuarios'),(2,'Menu',NULL,'fas fa-list-ul',1,'menu','menus'),(3,'Timeline',NULL,'far fa-clock',1,'timelines','times');
/*!40000 ALTER TABLE `table_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `table_menu_sub_menu`
--

DROP TABLE IF EXISTS `table_menu_sub_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `table_menu_sub_menu` (
  `id_menu_sub_menu` int(11) NOT NULL,
  `id_menu` int(11) DEFAULT NULL,
  `id_sub_menu` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `table_menu_sub_menu`
--

LOCK TABLES `table_menu_sub_menu` WRITE;
/*!40000 ALTER TABLE `table_menu_sub_menu` DISABLE KEYS */;
INSERT INTO `table_menu_sub_menu` VALUES (1,1,1),(2,1,2),(3,1,3),(4,2,4),(5,3,5),(15,2,8);
/*!40000 ALTER TABLE `table_menu_sub_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `table_roles`
--

DROP TABLE IF EXISTS `table_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `table_roles` (
  `rol_id` int(11) NOT NULL,
  `rol_name` varchar(45) DEFAULT NULL,
  `rol_descripcion` text DEFAULT NULL,
  `rol_status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `table_roles`
--

LOCK TABLES `table_roles` WRITE;
/*!40000 ALTER TABLE `table_roles` DISABLE KEYS */;
INSERT INTO `table_roles` VALUES (1,'Administrador','administrador',1),(2,'Encargado','encargado del sistema',1),(3,'Provicional','Provicional',2);
/*!40000 ALTER TABLE `table_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `table_roles_sub_menu`
--

DROP TABLE IF EXISTS `table_roles_sub_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `table_roles_sub_menu` (
  `id_rol_sub_menu` int(11) NOT NULL,
  `id_rol` int(11) DEFAULT NULL,
  `id_sub_menu` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `table_roles_sub_menu`
--

LOCK TABLES `table_roles_sub_menu` WRITE;
/*!40000 ALTER TABLE `table_roles_sub_menu` DISABLE KEYS */;
INSERT INTO `table_roles_sub_menu` VALUES (1,1,1),(2,1,2),(3,1,3),(4,1,4),(5,1,5),(16,1,8);
/*!40000 ALTER TABLE `table_roles_sub_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `table_tasa_dia`
--

DROP TABLE IF EXISTS `table_tasa_dia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `table_tasa_dia` (
  `id_tasa_dia` int(11) NOT NULL AUTO_INCREMENT,
  `tasa_dia` double DEFAULT NULL,
  PRIMARY KEY (`id_tasa_dia`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `table_tasa_dia`
--

LOCK TABLES `table_tasa_dia` WRITE;
/*!40000 ALTER TABLE `table_tasa_dia` DISABLE KEYS */;
INSERT INTO `table_tasa_dia` VALUES (1,36.6);
/*!40000 ALTER TABLE `table_tasa_dia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `table_ticket_venta`
--

DROP TABLE IF EXISTS `table_ticket_venta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `table_ticket_venta` (
  `id_ticket_venta` int(10) NOT NULL AUTO_INCREMENT,
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
  `status_ticket` int(1) DEFAULT NULL,
  PRIMARY KEY (`id_ticket_venta`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `table_ticket_venta`
--

LOCK TABLES `table_ticket_venta` WRITE;
/*!40000 ALTER TABLE `table_ticket_venta` DISABLE KEYS */;
INSERT INTO `table_ticket_venta` VALUES (1,'william enrique','14607920',1,NULL,45,4,'22.5','36.6','16-05-24','16:47:28',12,1),(2,'oswaldo de jesus','12521452',1,'12-ñlk',40,4,'20',NULL,'17-05-24','08:35:03',12,0),(3,'william enrique','14607920',2,'',10,4,'5',NULL,'17-05-24','08:41:22',12,0),(4,'william enrique','435435',3,'',2,4,'1',NULL,'17-05-24','08:42:48',12,0),(5,'jjbj','546',3,'N/A',20,4,'10',NULL,'17-05-24','08:44:33',12,0);
/*!40000 ALTER TABLE `table_ticket_venta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `table_timeline`
--

DROP TABLE IF EXISTS `table_timeline`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `table_timeline` (
  `time_id` int(11) NOT NULL,
  `time_idUser` int(11) DEFAULT NULL,
  `time_codigo` varchar(45) DEFAULT NULL,
  `time_fecha` varchar(20) DEFAULT NULL,
  `time_inicio` varchar(20) DEFAULT NULL,
  `time_fin` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `table_timeline`
--

LOCK TABLES `table_timeline` WRITE;
/*!40000 ALTER TABLE `table_timeline` DISABLE KEYS */;
INSERT INTO `table_timeline` VALUES (0,6,'biCod-6-KCHj','2024-03-31','6:59 pm','9:32 pm'),(0,1,'biCod-1-lpga','2024-04-01','6:44 am','6:47 am'),(0,1,'biCod-1-jJ7P','2024-04-01','6:38 pm','8:44 pm'),(0,1,'biCod-1-ebEw','2024-04-01','8:52 pm','9:01 pm'),(0,1,'biCod-1-McXm','2024-04-02','7:33 pm','7:34 pm'),(0,1,'biCod-1-0v7K','2024-04-02','7:46 pm','7:47 pm'),(0,1,'biCod-1-deUw','2024-04-02','7:50 pm','7:50 pm'),(0,1,'biCod-1-vQHd','2024-04-02','8:00 pm','8:13 pm'),(0,1,'biCod-1-Vhap','2024-04-02','8:13 pm',NULL),(0,1,'biCod-1-7Cyb','2024-04-03','6:39 pm',NULL),(0,1,'biCod-1-mqFm','2024-04-04','6:10 pm',NULL),(0,1,'biCod-1-CBhe','2024-04-11','4:47 pm','4:50 pm'),(0,1,'biCod-1-jpYV','2024-04-11','4:51 pm','5:02 pm'),(0,1,'biCod-1-Edmo','2024-04-11','5:03 pm',NULL),(0,1,'biCod-1-lXNN','2024-04-11','5:06 pm',NULL),(0,1,'biCod-1-WV8a','2024-04-12','4:50 pm','4:54 pm'),(0,7,'biCod-7-AjGD','2024-04-12','4:55 pm','4:55 pm'),(0,1,'biCod-1-tece','2024-04-15','8:26 am','8:26 am'),(0,5,'biCod-5-yhiW','2024-04-15','8:42 am','8:42 am'),(0,5,'biCod-5-fo2n','2024-04-15','2:38 pm','2:39 pm'),(0,5,'biCod-5-qU4T','2024-04-15','2:39 pm','2:39 pm'),(0,5,'biCod-5-xboz','2024-04-15','2:44 pm','2:47 pm'),(0,5,'biCod-5-4DOq','2024-04-15','2:49 pm','2:50 pm'),(0,1,'biCod-1-qT6Q','2024-04-17','10:23 am','10:24 am'),(0,1,'biCod-1-fefH','2024-04-17','10:24 am','10:25 am'),(0,2,'biCod-2-V5OM','2024-04-17','10:25 am',NULL),(0,1,'biCod-1-Mzo9','2024-04-17','10:29 am',NULL),(0,2,'biCod-2-KeqA','2024-04-18','7:55 am',NULL),(0,1,'biCod-1-FVwZ','2024-04-18','10:04 am','10:05 am'),(0,1,'biCod-1-rc7P','2024-04-18','10:17 am','10:19 am'),(0,1,'biCod-1-W8pf','2024-04-18','10:19 am','10:19 am'),(0,2,'biCod-2-QqcQ','2024-04-18','10:19 am','11:19 am'),(0,1,'biCod-1-AlSH','2024-04-18','11:19 am','11:31 am'),(0,6,'biCod-6-7lX6','2024-04-18','11:22 am',NULL),(0,7,'biCod-7-ntmC','2024-04-18','11:26 am',NULL),(0,8,'biCod-8-Zxzp','2024-04-18','11:29 am',NULL),(0,1,'biCod-1-C3GV','2024-04-18','11:32 am',NULL),(0,1,'biCod-1-Axax','2024-04-18','11:33 am',NULL),(0,6,'biCod-6-irkA','2024-04-18','11:46 am',NULL),(0,1,'biCod-1-aGej','2024-04-18','2:19 pm','04:38:14'),(0,1,'biCod-1-GqCU','2024-04-18','4:39 pm',NULL),(0,1,'biCod-1-ufrZ','2024-04-22','11:17 am','11:17 am'),(0,5,'biCod-5-GNqb','2024-04-22','2:16 pm','2:18 pm'),(0,5,'biCod-5-sppq','2024-04-22','3:07 pm','3:09 pm'),(0,6,'biCod-6-9zSm','2024-04-22','3:16 pm',NULL),(0,6,'biCod-6-LhDG','2024-04-22','4:50 pm','5:06 pm'),(0,6,'biCod-6-9ZHE','2024-04-22','5:04 pm','5:08 pm'),(0,5,'biCod-5-l6RJ','2024-04-23','7:59 am','8:04 am'),(0,1,'biCod-1-WRs1','2024-04-23','5:15 pm',NULL),(0,1,'biCod-1-b8ip','2024-04-23','5:15 pm',NULL),(0,6,'biCod-6-e8bA','2024-04-24','8:12 am',NULL),(0,5,'biCod-5-3Zp8','2024-04-24','8:14 am','8:14 am'),(0,5,'biCod-5-vLrS','2024-04-24','10:11 am','10:12 am'),(0,6,'biCod-6-bN4j','2024-04-24','12:25 pm','1:23 pm'),(0,6,'biCod-6-gVLL','2024-04-24','1:23 pm',NULL),(0,5,'biCod-5-7qcm','2024-04-24','2:47 pm','2:48 pm'),(0,5,'biCod-5-A3Jv','2024-04-24','2:49 pm','2:55 pm'),(0,2,'biCod-2-Z8NF','2024-04-24','4:42 pm','5:03 pm'),(0,6,'biCod-6-YbzP','2024-04-24','5:34 pm',NULL),(0,6,'biCod-6-o67L','2024-04-25','8:52 am',NULL),(0,5,'biCod-5-ti8j','2024-04-25','5:01 pm','5:02 pm'),(0,5,'biCod-5-CMN8','2024-04-26','7:56 am','7:57 am'),(0,6,'biCod-6-HeUk','2024-04-26','8:53 am',NULL),(0,5,'biCod-5-60oU','2024-04-26','8:53 am','10:25 am'),(0,5,'biCod-5-Bv8T','2024-04-26','11:30 am',NULL),(0,5,'biCod-5-snV4','2024-04-26','3:35 pm','3:36 pm'),(0,6,'biCod-6-96UA','2024-04-27','1:07 pm',NULL),(0,5,'biCod-5-VYcP','2024-04-28','1:38 pm','1:38 pm'),(0,5,'biCod-5-Icr5','2024-04-28','2:11 pm','2:13 pm'),(0,5,'biCod-5-7Clb','2024-04-29','3:27 pm','3:31 pm'),(0,9,'biCod-9-o4Fs','2024-04-29','3:29 pm',NULL),(0,5,'biCod-5-Jrxx','2024-04-29','3:53 pm','3:59 pm'),(0,9,'biCod-9-Rw5g','2024-04-30','9:12 am',NULL),(0,9,'biCod-9-GJa9','2024-05-01','2:10 pm',NULL),(0,9,'biCod-9-hITp','2024-05-01','4:32 pm',NULL),(0,9,'biCod-9-g8FW','2024-05-02','6:02 am',NULL),(0,9,'biCod-9-P6QF','2024-05-02','6:02 am',NULL),(0,5,'biCod-5-wCOi','2024-05-02','6:58 am','7:04 am'),(0,5,'biCod-5-Nbiv','2024-05-02','2:18 pm','2:42 pm'),(0,8,'biCod-8-BSMS','2024-05-02','2:19 pm',NULL),(0,8,'biCod-8-g7aZ','2024-05-02','2:21 pm','2:22 pm'),(0,2,'biCod-2-OqPx','2024-05-02','4:30 pm',NULL),(0,8,'biCod-8-djjD','2024-05-02','5:06 pm',NULL),(0,8,'biCod-8-16Gm','2024-05-02','5:06 pm',NULL),(0,8,'biCod-8-AaEt','2024-05-02','5:06 pm','5:37 pm'),(0,8,'biCod-8-WjuR','2024-05-03','8:13 am',NULL),(0,8,'biCod-8-4PnS','2024-05-03','8:13 am',NULL),(0,8,'biCod-8-8pbl','2024-05-03','8:13 am','8:22 am'),(0,8,'biCod-8-qZtn','2024-05-03','9:01 am','9:41 am'),(0,8,'biCod-8-HVyF','2024-05-03','10:02 am','10:21 am'),(0,9,'biCod-9-zVkY','2024-05-03','3:20 pm',NULL),(0,8,'biCod-8-SHJp','2024-05-05','11:26 am','11:34 am'),(0,6,'biCod-6-icrQ','2024-05-06','1:48 pm',NULL),(0,1,'biCod-1-mBQm','2024-05-07','3:49 pm',NULL),(0,1,'biCod-1-Km59','2024-05-07','3:49 pm','3:49 pm'),(0,1,'biCod-1-bVZd','2024-05-07','3:50 pm','4:36 pm'),(0,1,'biCod-1-wWbU','2024-05-07','4:37 pm','5:02 pm'),(0,1,'biCod-1-XGGw','2024-05-07','5:02 pm',NULL),(0,1,'biCod-1-IabH','2024-05-08','8:03 am',NULL),(0,1,'biCod-1-0QjT','2024-05-08','8:29 am',NULL),(0,1,'biCod-1-1Dzp','2024-05-09','2:06 pm',NULL),(0,1,'biCod-1-QzVq','2024-05-09','2:06 pm','5:16 pm'),(0,1,'biCod-1-XCrj','2024-05-10','8:05 am','10:50 am'),(0,1,'biCod-1-fN5q','2024-05-10','10:51 am','11:11 am'),(0,1,'biCod-1-cXfQ','2024-05-10','11:11 am',NULL),(0,1,'biCod-1-4ATa','2024-05-10','12:51 pm','12:52 pm'),(0,1,'biCod-1-7mh7','2024-05-10','12:52 pm','12:53 pm'),(0,1,'biCod-1-l3Op','2024-05-10','12:53 pm','1:07 pm'),(0,1,'biCod-1-oWWj','2024-05-13','8:09 am',NULL),(0,1,'biCod-1-3kwr','2024-05-13','8:09 am','9:38 am'),(0,13,'biCod-13-XP7U','2024-05-13','9:39 am','10:51 am'),(0,13,'biCod-13-LEJc','2024-05-13','10:53 am','10:56 am'),(0,1,'biCod-1-jRtz','2024-05-13','4:10 pm',NULL),(0,1,'biCod-1-5Y4k','2024-05-13','4:15 pm','5:03 pm'),(0,1,'biCod-1-w6AC','2024-05-13','5:05 pm',NULL),(0,1,'biCod-1-dIpO','2024-05-14','9:15 am','9:16 am'),(0,1,'biCod-1-ljyK','2024-05-14','9:17 am','9:18 am'),(0,12,'biCod-12-QItq','2024-05-14','9:18 am','9:18 am'),(0,12,'biCod-12-iZGa','2024-05-14','9:18 am',NULL),(0,12,'biCod-12-H1y1','2024-05-14','9:25 am','11:06 am'),(0,12,'biCod-12-xJ6d','2024-05-14','11:06 am','12:09 pm'),(0,12,'biCod-12-x0A6','2024-05-14','2:00 pm',NULL),(0,12,'biCod-12-V684','2024-05-14','2:00 pm',NULL),(0,12,'biCod-12-RmPe','2024-05-14','4:15 pm',NULL),(0,12,'biCod-12-6tmw','2024-05-14','4:15 pm','5:05 pm'),(0,12,'biCod-12-YOj1','2024-05-15','7:57 am','8:21 am'),(0,1,'biCod-1-ZUjL','2024-05-15','8:32 am','8:33 am'),(0,12,'biCod-12-lckQ','2024-05-15','8:33 am',NULL),(0,12,'biCod-12-LzZg','2024-05-15','9:35 am','10:02 am'),(0,12,'biCod-12-BSDv','2024-05-15','10:02 am','11:58 am'),(0,12,'biCod-12-bu9L','2024-05-15','11:59 am',NULL),(0,12,'biCod-12-gqfZ','2024-05-15','2:00 pm',NULL),(0,12,'biCod-12-U5Kl','2024-05-16','8:23 am','11:37 am'),(0,12,'biCod-12-MEJH','2024-05-16','11:37 am','3:47 pm'),(0,12,'biCod-12-fY3j','2024-05-16','3:49 pm',NULL),(0,12,'biCod-12-xeGs','2024-05-16','4:13 pm',NULL),(0,12,'biCod-12-ghhP','2024-05-17','8:02 am',NULL);
/*!40000 ALTER TABLE `table_timeline` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `table_user`
--

DROP TABLE IF EXISTS `table_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `table_user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
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
  `user_ruta` text DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `table_user`
--

LOCK TABLES `table_user` WRITE;
/*!40000 ALTER TABLE `table_user` DISABLE KEYS */;
INSERT INTO `table_user` VALUES (1,2000000,'ADMIN','ODEvZ0hkUFRKQkkyenppY2puNXFKQT09','Admin','Admin','admin@admin','5555555555',1,1,'storage/ADMIN/default.png','2024-04-15 12:29:22','system/app/Views/Docs/AUN-01/'),(12,14607920,'will','OCs4Z1hFT083MklFOU15V1NpMS9jdz09','Wiliam','Infante','william21enrique@gmail.com','4125181629',1,1,'storage/WI-012/default.png','2024-05-15 15:58:37','storage/WI-012/'),(13,15769775,'YN-013','OCs4Z1hFT083MklFOU15V1NpMS9jdz09','Ybet','Nacari','ybet.naca@gmail.com','4120586480',2,1,'storage/YN-013/default.png','2024-05-13 14:49:34','storage/YN-013/');
/*!40000 ALTER TABLE `table_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `table_user_rol`
--

DROP TABLE IF EXISTS `table_user_rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `table_user_rol` (
  `id_usuario_rol` int(11) NOT NULL AUTO_INCREMENT,
  `user_nick` varchar(45) DEFAULT NULL,
  `id_rol` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_usuario_rol`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `table_user_rol`
--

LOCK TABLES `table_user_rol` WRITE;
/*!40000 ALTER TABLE `table_user_rol` DISABLE KEYS */;
INSERT INTO `table_user_rol` VALUES (1,'ADMIN',1),(17,'WI-011',1),(18,'will',1),(19,'YN-013',2);
/*!40000 ALTER TABLE `table_user_rol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `v_timeline`
--

DROP TABLE IF EXISTS `v_timeline`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `v_timeline`
--

LOCK TABLES `v_timeline` WRITE;
/*!40000 ALTER TABLE `v_timeline` DISABLE KEYS */;
/*!40000 ALTER TABLE `v_timeline` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-17  9:16:03

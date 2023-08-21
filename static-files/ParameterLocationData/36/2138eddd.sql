-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: localhost    Database: ncc-dsn-db
-- ------------------------------------------------------
-- Server version	8.0.21

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
-- Table structure for table `climate_change_data_category`
--

DROP TABLE IF EXISTS `climate_change_data_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `climate_change_data_category` (
  `createdBy` varchar(255) NOT NULL,
  `createdOn` datetime NOT NULL,
  `editedBy` varchar(255) NOT NULL,
  `editedOn` datetime NOT NULL,
  `status` int NOT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `sortOrder` int NOT NULL,
  `description` varchar(2500) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `climate_change_data_category`
--

LOCK TABLES `climate_change_data_category` WRITE;
/*!40000 ALTER TABLE `climate_change_data_category` DISABLE KEYS */;
INSERT INTO `climate_change_data_category` VALUES (' ','2020-11-14 00:00:00',' ','2020-11-14 00:00:00',0,1,'Weather & Climatic Data',1,''),(' ','2020-11-14 00:00:00',' ','2020-11-14 00:00:00',0,2,'Mitigation data',1,''),(' ','2020-11-14 00:00:00',' ','2020-11-14 00:00:00',0,3,'Adaptation Data',1,''),(' ','2020-11-14 00:00:00',' ','2020-11-14 00:00:00',0,4,'Disaster Data',1,''),(' ','2020-11-14 00:00:00',' ','2020-11-14 00:00:00',0,5,'Information on Policies and Regulations',1,'');
/*!40000 ALTER TABLE `climate_change_data_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `climate_impact`
--

DROP TABLE IF EXISTS `climate_impact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `climate_impact` (
  `createdBy` varchar(255) NOT NULL,
  `createdOn` datetime NOT NULL,
  `editedBy` varchar(255) NOT NULL,
  `editedOn` datetime NOT NULL,
  `status` int NOT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(2500) NOT NULL,
  `sortOrder` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `climate_impact`
--

LOCK TABLES `climate_impact` WRITE;
/*!40000 ALTER TABLE `climate_impact` DISABLE KEYS */;
INSERT INTO `climate_impact` VALUES (' ','2020-11-15 00:00:00',' ','2020-11-15 00:00:00',1,1,'Extreme heat','Extreme heat',1),(' ','2020-11-15 00:00:00',' ','2020-11-15 00:00:00',1,2,'Respirotory disorders','Respirotory disorders',2),(' ','2020-11-15 00:00:00',' ','2020-11-15 00:00:00',1,3,'Sea level rise','sea level rise',3);
/*!40000 ALTER TABLE `climate_impact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `currency`
--

DROP TABLE IF EXISTS `currency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `currency` (
  `createdBy` varchar(255) NOT NULL,
  `createdOn` datetime NOT NULL,
  `editedBy` varchar(255) NOT NULL,
  `editedOn` datetime NOT NULL,
  `status` int NOT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `sortOrder` int NOT NULL,
  `multificationFactor` int NOT NULL,
  `description` varchar(2500) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `currency`
--

LOCK TABLES `currency` WRITE;
/*!40000 ALTER TABLE `currency` DISABLE KEYS */;
INSERT INTO `currency` VALUES ('2020-11-15 00:00:00','2020-11-15 00:00:00','2020-11-15 00:00:00','2020-11-15 00:00:00',1,1,'Rs',1,1,''),('2020-11-15 00:00:00','2020-11-15 00:00:00','2020-11-15 00:00:00','2020-11-15 00:00:00',1,2,'Million Rs',1,1000000,''),('2020-11-15 00:00:00','2020-11-15 00:00:00','2020-11-15 00:00:00','2020-11-15 00:00:00',1,3,'Billion Rs',1,10000000,''),('2020-11-15 00:00:00','2020-11-15 00:00:00','2020-11-15 00:00:00','2020-11-15 00:00:00',1,4,'USD',1,1,''),('2020-11-15 00:00:00','2020-11-15 00:00:00','2020-11-15 00:00:00','2020-11-15 00:00:00',1,5,'Million USD',1,1000000,''),('2020-11-15 00:00:00','2020-11-15 00:00:00','2020-11-15 00:00:00','2020-11-15 00:00:00',1,6,'Billion USD',1,10000000,'');
/*!40000 ALTER TABLE `currency` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `currency_type`
--

DROP TABLE IF EXISTS `currency_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `currency_type` (
  `createdBy` varchar(255) NOT NULL,
  `createdOn` datetime NOT NULL,
  `editedBy` varchar(255) NOT NULL,
  `editedOn` datetime NOT NULL,
  `status` int NOT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `sortOrder` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `currency_type`
--

LOCK TABLES `currency_type` WRITE;
/*!40000 ALTER TABLE `currency_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `currency_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_request_status`
--

DROP TABLE IF EXISTS `data_request_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `data_request_status` (
  `createdBy` varchar(255) NOT NULL,
  `createdOn` datetime NOT NULL,
  `editedBy` varchar(255) NOT NULL,
  `editedOn` datetime NOT NULL,
  `status` int NOT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `sortOrder` int NOT NULL,
  `description` varchar(2500) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_request_status`
--

LOCK TABLES `data_request_status` WRITE;
/*!40000 ALTER TABLE `data_request_status` DISABLE KEYS */;
INSERT INTO `data_request_status` VALUES ('test','2020-12-01 23:22:26','test','2020-12-01 23:22:26',1,1,'Need to assign ',1,''),('test','2020-12-01 23:22:26','test','2020-12-01 23:22:26',1,2,'Submitted to CCS',1,''),('test','2020-12-01 23:22:26','test','2020-12-01 23:22:26',1,3,'Pending Data Entry',1,''),('test','2020-12-01 23:22:26','test','2020-12-01 23:22:26',1,4,'Rejected and reassigned ',1,''),('test','2020-12-01 23:22:26','test','2020-12-01 23:22:26',1,5,'Rejected from the CCS',1,''),('test','2020-12-01 23:22:26','test','2020-12-01 23:22:26',1,6,'Need to review',1,''),('test','2020-12-01 23:22:26','test','2020-12-01 23:22:26',1,7,'Publish',1,'');
/*!40000 ALTER TABLE `data_request_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_request_status_history`
--

DROP TABLE IF EXISTS `data_request_status_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `data_request_status_history` (
  `createdBy` varchar(255) NOT NULL,
  `createdOn` datetime NOT NULL,
  `editedBy` varchar(255) NOT NULL,
  `editedOn` datetime NOT NULL,
  `status` int NOT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `sortOrder` int NOT NULL,
  `comment` varchar(255) NOT NULL,
  `parameterLocationDataId` int DEFAULT NULL,
  `userId` int NOT NULL,
  `userName` varchar(255) NOT NULL,
  `statusId` int NOT NULL,
  `statusText` varchar(255) NOT NULL,
  `parameterId` int DEFAULT NULL,
  `projectProgramDataId` int DEFAULT NULL,
  `description` varchar(2500) NOT NULL,
  `policyDataId` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_a9f0701e5e05574c1083e209c2e` (`parameterLocationDataId`),
  KEY `FK_5197e84df11560f5b034ad3d063` (`projectProgramDataId`),
  KEY `FK_9352d700e9cc891da369a854f7e` (`policyDataId`),
  CONSTRAINT `FK_5197e84df11560f5b034ad3d063` FOREIGN KEY (`projectProgramDataId`) REFERENCES `project_program_data` (`id`),
  CONSTRAINT `FK_9352d700e9cc891da369a854f7e` FOREIGN KEY (`policyDataId`) REFERENCES `policy_data` (`id`),
  CONSTRAINT `FK_a9f0701e5e05574c1083e209c2e` FOREIGN KEY (`parameterLocationDataId`) REFERENCES `parameter_location_data` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=263 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_request_status_history`
--

LOCK TABLES `data_request_status_history` WRITE;
/*!40000 ALTER TABLE `data_request_status_history` DISABLE KEYS */;
INSERT INTO `data_request_status_history` VALUES ('-','2020-12-04 00:23:07','-','2020-12-04 00:23:07',0,1,'',1,'Need to assign ',25,1,'Amal12 Kumara',1,'Need to assign ',17,NULL,'',NULL),('-','2020-12-04 00:37:12','-','2020-12-04 00:37:12',0,2,'',1,'Need to assign ',26,1,'Amal12 Kumara',1,'Need to assign ',17,NULL,'',NULL),('-','2020-12-04 21:06:22','-','2020-12-04 21:06:22',0,3,'',1,'Pending Data Entry',10,1,'Amal12 Kumara',3,'Pending Data Entry',0,NULL,'',NULL),('-','2020-12-04 21:15:50','-','2020-12-04 21:15:50',0,4,'',1,'Pending Data Entry',10,1,'Amal12 Kumara',3,'Pending Data Entry',0,NULL,'',NULL),('-','2020-12-04 21:36:17','-','2020-12-04 21:36:17',0,5,'',1,'Pending Data Entry',17,1,'Amal12 Kumara',3,'Pending Data Entry',0,NULL,'',NULL),('-','2020-12-04 21:36:29','-','2020-12-04 21:36:29',0,6,'',1,'Pending Data Entry',17,1,'Amal12 Kumara',3,'Pending Data Entry',0,NULL,'',NULL),('-','2020-12-04 21:39:14','-','2020-12-04 21:39:14',0,7,'',1,'Pending Data Entry',21,1,'Amal12 Kumara',3,'Pending Data Entry',0,NULL,'',NULL),('-','2020-12-04 21:39:14','-','2020-12-04 21:39:14',0,8,'',1,'Pending Data Entry',17,1,'Amal12 Kumara',3,'Pending Data Entry',0,NULL,'',NULL),('-','2020-12-04 22:21:47','-','2020-12-04 22:21:47',0,9,'',1,'Pending Data Entry',24,1,'Amal12 Kumara',3,'Pending Data Entry',0,NULL,'',NULL),('-','2020-12-05 13:37:44','-','2020-12-05 13:37:44',0,10,'',1,'Pending Data Entry',17,1,'Amal12 Kumara',3,'Pending Data Entry',0,NULL,'',NULL),('-','2020-12-05 13:38:32','-','2020-12-05 13:38:32',0,11,'',1,'Pending Data Entry',17,1,'Amal12 Kumara',3,'Pending Data Entry',0,NULL,'',NULL),('-','2020-12-05 13:43:10','-','2020-12-05 13:43:10',0,12,'',1,'Need to review',21,1,'Amal12 Kumara',6,'Need to review',0,NULL,'',NULL),('-','2020-12-05 13:48:53','-','2020-12-05 13:48:53',0,13,'',1,'Need to review',17,1,'Amal12 Kumara',6,'Need to review',0,NULL,'',NULL),('-','2020-12-05 13:55:30','-','2020-12-05 13:55:30',0,14,'',1,'entered value : test comment',17,1,'Amal12 Kumara',6,'Need to review',0,NULL,'',NULL),('-','2020-12-06 22:32:41','-','2020-12-06 22:32:41',0,15,'',1,'entered value : test comment',17,1,'Amal12 Kumara',6,'Need to review',0,NULL,'',NULL),('-','2020-12-06 22:33:37','-','2020-12-06 22:33:37',0,16,'',1,'Reject from institution admin.',17,1,'Amal12 Kumara',4,'Rejected and reassigned ',0,NULL,'',NULL),('-','2020-12-06 22:35:00','-','2020-12-06 22:35:00',0,17,'',1,'entered value : Data from Data Entry ',21,1,'Amal12 Kumara',6,'Need to review',0,NULL,'',NULL),('-','2020-12-06 22:35:00','-','2020-12-06 22:35:00',0,18,'',1,'entered value : correct Value',17,1,'Amal12 Kumara',6,'Need to review',0,NULL,'',NULL),('-','2020-12-06 22:35:31','-','2020-12-06 22:35:31',0,19,'',1,'Submitted to CCS',21,1,'Amal12 Kumara',2,'Submitted to CCS',0,NULL,'',NULL),('-','2020-12-06 22:36:21','-','2020-12-06 22:36:21',0,20,'',1,'Reject from institution admin.',17,1,'Amal12 Kumara',4,'Rejected and reassigned ',0,NULL,'',NULL),('-','2020-12-06 22:38:21','-','2020-12-06 22:38:21',0,21,'',1,'entered value : correct Value -2',17,1,'Amal12 Kumara',6,'Need to review',0,NULL,'',NULL),('-','2020-12-06 22:38:34','-','2020-12-06 22:38:34',0,22,'',1,'Submitted to CCS',17,1,'Amal12 Kumara',2,'Submitted to CCS',0,NULL,'',NULL),('-','2020-12-09 20:31:00','-','2020-12-09 20:31:00',0,23,'',1,'entered value : correct Value -2',17,1,'Amal12 Kumara',6,'Need to review',0,NULL,'',NULL),('-','2020-12-09 20:33:40','-','2020-12-09 20:33:40',0,24,'',1,'Submitted to CCS',17,1,'Amal12 Kumara',2,'Submitted to CCS',0,NULL,'',NULL),('-','2020-12-09 20:37:46','-','2020-12-09 20:37:46',0,25,'',1,' ',17,1,'Amal12 Kumara',5,'Rejected from the CCS',0,NULL,'',NULL),('-','2020-12-09 20:53:45','-','2020-12-09 20:53:45',0,26,'',1,'Pending Data Entry',17,1,'Amal12 Kumara',3,'Pending Data Entry',0,NULL,'',NULL),('-','2020-12-09 20:54:04','-','2020-12-09 20:54:04',0,27,'',1,'entered value : correct Value -2',17,1,'Amal12 Kumara',6,'Need to review',0,NULL,'',NULL),('-','2020-12-09 20:54:17','-','2020-12-09 20:54:17',0,28,'',1,'Submitted to CCS',17,1,'Amal12 Kumara',2,'Submitted to CCS',0,NULL,'',NULL),('-','2020-12-09 20:54:35','-','2020-12-09 20:54:35',0,29,'',1,'entered value : correct Value -2',17,1,'Amal12 Kumara',6,'Need to review',0,NULL,'',NULL),('-','2020-12-09 20:56:33','-','2020-12-09 20:56:33',0,30,'',1,'Pending Data Entry',21,1,'Amal12 Kumara',3,'Pending Data Entry',0,NULL,'',NULL),('-','2020-12-09 20:56:40','-','2020-12-09 20:56:40',0,31,'',1,'entered value : Data from Data Entry ',21,1,'Amal12 Kumara',6,'Need to review',0,NULL,'',NULL),('-','2020-12-09 20:57:18','-','2020-12-09 20:57:18',0,32,'',1,'Submitted to CCS',17,1,'Amal12 Kumara',2,'Submitted to CCS',0,NULL,'',NULL),('-','2020-12-09 20:57:18','-','2020-12-09 20:57:18',0,33,'',1,'Submitted to CCS',21,1,'Amal12 Kumara',2,'Submitted to CCS',0,NULL,'',NULL),('-','2020-12-09 20:57:29','-','2020-12-09 20:57:29',0,34,'',1,'entered value : correct Value -2',17,1,'Amal12 Kumara',6,'Need to review',0,NULL,'',NULL),('-','2020-12-09 20:58:38','-','2020-12-09 20:58:38',0,35,'',1,'Publish',21,1,'Amal12 Kumara',7,'Publish',0,NULL,'',NULL),('-','2020-12-09 21:00:27','-','2020-12-09 21:00:27',0,36,'',1,'Submitted to CCS',17,1,'Amal12 Kumara',2,'Submitted to CCS',0,NULL,'',NULL),('-','2020-12-09 21:00:46','-','2020-12-09 21:00:46',0,37,'',1,'Publish',17,1,'Amal12 Kumara',7,'Publish',17,NULL,'',NULL),('-','2020-12-10 11:34:40','-','2020-12-10 11:34:40',0,38,'',1,'Need to assign ',27,1,'Amal12 Kumara',1,'Need to assign ',13,NULL,'',NULL),('-','2020-12-10 11:34:55','-','2020-12-10 11:34:55',0,39,'',1,'Need to assign ',28,1,'Amal12 Kumara',1,'Need to assign ',4,NULL,'',NULL),('-','2020-12-10 11:56:30','-','2020-12-10 11:56:30',0,40,'',1,'Need to assign ',29,1,'Amal12 Kumara',1,'Need to assign ',4,NULL,'',NULL),('-','2020-12-10 12:42:33','-','2020-12-10 12:42:33',0,41,'',1,'Pending Data Entry',28,1,'Amal12 Kumara',3,'Pending Data Entry',4,NULL,'',NULL),('-','2020-12-10 12:51:55','-','2020-12-10 12:51:55',0,42,'',1,'Pending Data Entry',29,1,'Amal12 Kumara',3,'Pending Data Entry',4,NULL,'',NULL),('-','2020-12-10 12:52:15','-','2020-12-10 12:52:15',0,43,'',1,'entered value : 1234',29,1,'Amal12 Kumara',6,'Need to review',4,NULL,'',NULL),('-','2020-12-10 12:52:28','-','2020-12-10 12:52:28',0,44,'',1,'Reject from institution admin.',29,1,'Amal12 Kumara',4,'Rejected and reassigned ',4,NULL,'',NULL),('-','2020-12-10 12:52:44','-','2020-12-10 12:52:44',0,45,'',1,'entered value : 1234 - Update',29,1,'Amal12 Kumara',6,'Need to review',4,NULL,'',NULL),('-','2020-12-10 12:52:55','-','2020-12-10 12:52:55',0,46,'',1,'Submitted to CCS',29,1,'Amal12 Kumara',2,'Submitted to CCS',4,NULL,'',NULL),('-','2020-12-10 12:54:08','-','2020-12-10 12:54:08',0,47,'',1,'Publish',29,1,'Amal12 Kumara',7,'Publish',4,NULL,'',NULL),('-','2020-12-10 17:06:02','-','2020-12-10 17:06:02',0,48,'',1,'Need to assign ',30,1,'Amal12 Kumara',1,'Need to assign ',4,NULL,'',NULL),('-','2020-12-10 17:06:02','-','2020-12-10 17:06:02',0,49,'',1,'Need to assign ',31,1,'Amal12 Kumara',1,'Need to assign ',13,NULL,'',NULL),('-','2020-12-10 17:06:30','-','2020-12-10 17:06:30',0,50,'',1,'Pending Data Entry',30,1,'Amal12 Kumara',3,'Pending Data Entry',4,NULL,'',NULL),('-','2020-12-10 17:06:39','-','2020-12-10 17:06:39',0,51,'',1,'entered value : 1',30,1,'Amal12 Kumara',6,'Need to review',4,NULL,'',NULL),('-','2020-12-10 17:06:48','-','2020-12-10 17:06:48',0,52,'',1,'Submitted to CCS',30,1,'Amal12 Kumara',2,'Submitted to CCS',4,NULL,'',NULL),('-','2020-12-10 17:18:39','-','2020-12-10 17:18:39',0,53,'',1,'Need to assign ',32,1,'Amal12 Kumara',1,'Need to assign ',4,NULL,'',NULL),('-','2020-12-10 17:19:10','-','2020-12-10 17:19:10',0,54,'',1,'Pending Data Entry',32,1,'Amal12 Kumara',3,'Pending Data Entry',4,NULL,'',NULL),('-','2020-12-10 17:19:27','-','2020-12-10 17:19:27',0,55,'',1,'entered value : 1',32,1,'Amal12 Kumara',6,'Need to review',4,NULL,'',NULL),('-','2020-12-10 17:22:12','-','2020-12-10 17:22:12',0,56,'',1,'Reject from institution admin.',32,1,'Amal12 Kumara',4,'Rejected and reassigned ',4,NULL,'',NULL),('-','2020-12-11 09:45:16','-','2020-12-11 09:45:16',0,57,'',1,'Need to assign ',NULL,1,'Amal12 Kumara',1,'Need to assign ',NULL,2,'',NULL),('-','2020-12-11 09:54:51','-','2020-12-11 09:54:51',0,58,'',1,'Pending Data Entry',NULL,2,'Kamal Perera',3,'Pending Data Entry',NULL,1,'',NULL),('-','2020-12-11 11:57:24','-','2020-12-11 11:57:24',0,59,'',1,'test reject comment from UI ',30,1,'Amal12 Kumara',5,'Rejected from the CCS',4,NULL,'',NULL),('-','2020-12-11 12:02:45','-','2020-12-11 12:02:45',0,60,'',1,'entered value : 1-00',32,1,'Amal12 Kumara',6,'Need to review',4,NULL,'',NULL),('-','2020-12-11 12:03:00','-','2020-12-11 12:03:00',0,61,'',1,'Submitted to CCS',32,1,'Amal12 Kumara',2,'Submitted to CCS',4,NULL,'',NULL),('-','2020-12-11 12:29:55','-','2020-12-11 12:29:55',0,62,'',1,'Pending Data Entry',30,1,'Amal12 Kumara',3,'Pending Data Entry',4,NULL,'',NULL),('-','2020-12-11 12:32:03','-','2020-12-11 12:32:03',0,63,'',1,'entered value : 1 - 000',30,1,'Amal12 Kumara',6,'Need to review',4,NULL,'',NULL),('-','2020-12-11 12:40:30','-','2020-12-11 12:40:30',0,64,'',1,'test comment from IN Admin ',30,1,'Amal12 Kumara',4,'Rejected and reassigned ',4,NULL,'',NULL),('-','2020-12-11 12:41:08','-','2020-12-11 12:41:08',0,65,'',1,'entered value : 1 - 000',30,1,'Amal12 Kumara',6,'Need to review',4,NULL,'',NULL),('-','2020-12-11 12:41:20','-','2020-12-11 12:41:20',0,66,'',1,'Submitted to CCS',30,1,'Amal12 Kumara',2,'Submitted to CCS',4,NULL,'',NULL),('-','2020-12-11 12:42:05','-','2020-12-11 12:42:05',0,67,'',1,'same value, please update',32,1,'Amal12 Kumara',5,'Rejected from the CCS',4,NULL,'',NULL),('-','2020-12-11 12:42:11','-','2020-12-11 12:42:11',0,68,'',1,'Publish',30,1,'Amal12 Kumara',7,'Publish',4,NULL,'',NULL),('-','2020-12-11 20:31:34','-','2020-12-11 20:31:34',0,69,'',1,'Need to assign ',33,1,'Amal12 Kumara',1,'Need to assign ',14,NULL,'',NULL),('-','2020-12-11 20:31:34','-','2020-12-11 20:31:34',0,70,'',1,'Need to assign ',34,1,'Amal12 Kumara',1,'Need to assign ',14,NULL,'',NULL),('-','2020-12-11 20:31:34','-','2020-12-11 20:31:34',0,71,'',1,'Need to assign ',38,1,'Amal12 Kumara',1,'Need to assign ',14,NULL,'',NULL),('-','2020-12-11 20:31:34','-','2020-12-11 20:31:34',0,72,'',1,'Need to assign ',35,1,'Amal12 Kumara',1,'Need to assign ',14,NULL,'',NULL),('-','2020-12-11 20:31:34','-','2020-12-11 20:31:34',0,73,'',1,'Need to assign ',36,1,'Amal12 Kumara',1,'Need to assign ',14,NULL,'',NULL),('-','2020-12-11 20:31:34','-','2020-12-11 20:31:34',0,74,'',1,'Need to assign ',37,1,'Amal12 Kumara',1,'Need to assign ',14,NULL,'',NULL),('-','2020-12-11 20:31:34','-','2020-12-11 20:31:34',0,75,'',1,'Need to assign ',39,1,'Amal12 Kumara',1,'Need to assign ',14,NULL,'',NULL),('-','2020-12-11 20:37:57','-','2020-12-11 20:37:57',0,76,'',1,'Need to assign ',40,1,'Amal12 Kumara',1,'Need to assign ',15,NULL,'',NULL),('-','2020-12-11 20:37:57','-','2020-12-11 20:37:57',0,77,'',1,'Need to assign ',42,1,'Amal12 Kumara',1,'Need to assign ',15,NULL,'',NULL),('-','2020-12-11 20:37:57','-','2020-12-11 20:37:57',0,78,'',1,'Need to assign ',41,1,'Amal12 Kumara',1,'Need to assign ',15,NULL,'',NULL),('-','2020-12-11 20:39:07','-','2020-12-11 20:39:07',0,79,'',1,'Pending Data Entry',40,1,'Amal12 Kumara',3,'Pending Data Entry',15,NULL,'',NULL),('-','2020-12-11 20:39:07','-','2020-12-11 20:39:07',0,80,'',1,'Pending Data Entry',41,1,'Amal12 Kumara',3,'Pending Data Entry',15,NULL,'',NULL),('-','2020-12-11 20:39:59','-','2020-12-11 20:39:59',0,81,'',1,'Pending Data Entry',42,1,'Amal12 Kumara',3,'Pending Data Entry',15,NULL,'',NULL),('-','2020-12-15 09:54:42','-','2020-12-15 09:54:42',0,82,'',1,'Need to assign ',44,1,'Amal12 Kumara',1,'Need to assign ',13,NULL,'',NULL),('-','2020-12-15 09:54:42','-','2020-12-15 09:54:42',0,83,'',1,'Need to assign ',43,1,'Amal12 Kumara',1,'Need to assign ',4,NULL,'',NULL),('-','2020-12-16 13:37:11','-','2020-12-16 13:37:11',0,84,'',1,'Need to assign ',NULL,1,'Amal12 Kumara',1,'Need to assign ',NULL,3,'',NULL),('-','2020-12-16 13:40:13','-','2020-12-16 13:40:13',0,85,'',1,'Pending Data Entry',NULL,2,'Kamal Perera',3,'Pending Data Entry',NULL,3,'',NULL),('-','2020-12-16 13:44:57','-','2020-12-16 13:44:57',0,86,'',1,'Need to review',NULL,2,'Kamal Perera',6,'Need to review',NULL,3,'',NULL),('-','2020-12-16 13:47:27','-','2020-12-16 13:47:27',0,87,'',1,'Submitted to CCS',NULL,2,'Kamal Perera',2,'Submitted to CCS',NULL,3,'',NULL),('-','2020-12-16 13:50:31','-','2020-12-16 13:50:31',0,88,'',1,'Publish',NULL,1,'Amal12 Kumara',7,'Publish',NULL,3,'',NULL),('-','2020-12-21 08:44:24','-','2020-12-21 08:44:24',0,89,'',1,'Need to assign ',45,1,'Amal12 Kumara',1,'Need to assign ',4,NULL,'',NULL),('-','2020-12-21 08:44:54','-','2020-12-21 08:44:54',0,90,'',1,'Pending Data Entry',43,1,'Amal12 Kumara',3,'Pending Data Entry',4,NULL,'',NULL),('-','2020-12-21 10:21:56','-','2020-12-21 10:21:56',0,91,'',1,'Need to assign ',NULL,1,'Amal12 Kumara',1,'Need to assign ',NULL,NULL,'',1),('-','2020-12-21 10:22:31','-','2020-12-21 10:22:31',0,92,'',1,'Need to assign ',NULL,1,'Amal12 Kumara',1,'Need to assign ',NULL,NULL,'',2),('-','2020-12-22 08:04:44','-','2020-12-22 08:04:44',0,93,'',1,'Need to assign ',NULL,1,'Amal12 Kumara',1,'Need to assign ',NULL,NULL,'',3),('-','2020-12-27 11:13:01','-','2020-12-27 11:13:01',0,94,'',1,'Need to assign ',46,1,'Amal12 Kumara',1,'Need to assign ',22,NULL,'',NULL),('-','2020-12-27 11:15:56','-','2020-12-27 11:15:56',0,95,'',1,'Need to assign ',47,1,'Amal12 Kumara',1,'Need to assign ',22,NULL,'',NULL),('-','2020-12-27 11:21:08','-','2020-12-27 11:21:08',0,96,'',1,'Pending Data Entry',47,1,'Amal12 Kumara',3,'Pending Data Entry',22,NULL,'',NULL),('-','2020-12-27 11:21:08','-','2020-12-27 11:21:08',0,97,'',1,'Pending Data Entry',46,1,'Amal12 Kumara',3,'Pending Data Entry',22,NULL,'',NULL),('-','2020-12-27 11:22:43','-','2020-12-27 11:22:43',0,98,'',1,'entered value : 100',46,2,'Kamal Perera',6,'Need to review',22,NULL,'',NULL),('-','2020-12-27 11:22:43','-','2020-12-27 11:22:43',0,99,'',1,'entered value : 300',47,2,'Kamal Perera',6,'Need to review',22,NULL,'',NULL),('-','2020-12-27 11:23:05','-','2020-12-27 11:23:05',0,100,'',1,'Submitted to CCS',46,1,'Amal12 Kumara',2,'Submitted to CCS',22,NULL,'',NULL),('-','2020-12-27 11:23:05','-','2020-12-27 11:23:05',0,101,'',1,'Submitted to CCS',47,1,'Amal12 Kumara',2,'Submitted to CCS',22,NULL,'',NULL),('-','2020-12-27 11:24:04','-','2020-12-27 11:24:04',0,102,'',1,'Publish',46,1,'Amal12 Kumara',7,'Publish',22,NULL,'',NULL),('-','2020-12-27 11:24:17','-','2020-12-27 11:24:17',0,103,'',1,'Publish',47,1,'Amal12 Kumara',7,'Publish',22,NULL,'',NULL),('-','2020-12-29 11:34:33','-','2020-12-29 11:34:33',0,104,'',1,'Pending Data Entry',33,1,'Amal12 Kumara',3,'Pending Data Entry',14,NULL,'',NULL),('-','2020-12-29 11:35:29','-','2020-12-29 11:35:29',0,105,'',1,'entered value : 1000',33,2,'Kamal Perera',6,'Need to review',14,NULL,'',NULL),('-','2020-12-29 11:35:52','-','2020-12-29 11:35:52',0,106,'',1,'aaaaaaaaaaa',33,1,'Amal12 Kumara',4,'Rejected and reassigned ',14,NULL,'',NULL),('-','2020-12-31 19:15:19','-','2020-12-31 19:15:19',0,107,'',1,'Need to assign ',NULL,1,'Amal12 Kumara',1,'Need to assign ',NULL,NULL,'',4),('-','2020-12-31 19:16:10','-','2020-12-31 19:16:10',0,108,'',1,'Pending Data Entry',NULL,2,'Kamal Perera',3,'Pending Data Entry',NULL,NULL,'',4),('-','2020-12-31 19:17:24','-','2020-12-31 19:17:24',0,109,'',1,'Need to review',NULL,2,'Kamal Perera',6,'Need to review',NULL,NULL,'',4),('-','2020-12-31 19:17:43','-','2020-12-31 19:17:43',0,110,'',1,'Submitted to CCS',NULL,2,'Kamal Perera',2,'Submitted to CCS',NULL,NULL,'',4),('-','2020-12-31 19:18:15','-','2020-12-31 19:18:15',0,111,'',1,'Publish',NULL,1,'Amal12 Kumara',7,'Publish',NULL,NULL,'',4),('-','2020-12-31 19:40:11','-','2020-12-31 19:40:11',0,112,'',1,'Need to assign ',48,1,'Amal12 Kumara',1,'Need to assign ',13,NULL,'',NULL),('-','2020-12-31 19:40:11','-','2020-12-31 19:40:11',0,113,'',1,'Need to assign ',49,1,'Amal12 Kumara',1,'Need to assign ',21,NULL,'',NULL),('-','2020-12-31 19:41:03','-','2020-12-31 19:41:03',0,114,'',1,'Need to assign ',NULL,1,'Amal12 Kumara',1,'Need to assign ',NULL,4,'',NULL),('-','2020-12-31 19:41:40','-','2020-12-31 19:41:40',0,115,'',1,'Pending Data Entry',NULL,2,'Kamal Perera',3,'Pending Data Entry',NULL,4,'',NULL),('-','2020-12-31 19:42:43','-','2020-12-31 19:42:43',0,116,'',1,'Need to review',NULL,3,'Sapumal Disanayake',6,'Need to review',NULL,4,'',NULL),('-','2020-12-31 19:43:04','-','2020-12-31 19:43:04',0,117,'',1,'Submitted to CCS',NULL,2,'Kamal Perera',2,'Submitted to CCS',NULL,4,'',NULL),('-','2021-01-02 18:08:06','-','2021-01-02 18:08:06',0,118,'',1,'Need to assign ',NULL,1,'Amal12 Kumara',1,'Need to assign ',NULL,5,'',NULL),('-','2021-01-02 18:21:32','-','2021-01-02 18:21:32',0,119,'',1,'Pending Data Entry',NULL,1,'Amal12 Kumara',3,'Pending Data Entry',NULL,5,'',NULL),('-','2021-01-02 18:27:37','-','2021-01-02 18:27:37',0,120,'',1,'Pending Data Entry',NULL,1,'Amal12 Kumara',3,'Pending Data Entry',NULL,5,'',NULL),('-','2021-01-02 19:45:00','-','2021-01-02 19:45:00',0,121,'',1,'Need to review',NULL,42,'Rohan DEO',6,'Need to review',NULL,5,'',NULL),('-','2021-01-02 19:52:08','-','2021-01-02 19:52:08',0,122,'',1,'No proper data',NULL,1,'Amal12 Kumara',4,'Rejected and reassigned ',NULL,5,'',NULL),('-','2021-01-02 19:53:12','-','2021-01-02 19:53:12',0,123,'',1,'Need to review',NULL,42,'Rohan DEO',6,'Need to review',NULL,5,'',NULL),('-','2021-01-02 19:53:53','-','2021-01-02 19:53:53',0,124,'',1,'aaaaaaaaa',NULL,1,'Amal12 Kumara',4,'Rejected and reassigned ',NULL,5,'',NULL),('-','2021-01-02 19:54:31','-','2021-01-02 19:54:31',0,125,'',1,'Need to review',NULL,42,'Rohan DEO',6,'Need to review',NULL,5,'',NULL),('-','2021-01-02 19:58:46','-','2021-01-02 19:58:46',0,126,'',1,'aaa',NULL,1,'Amal12 Kumara',4,'Rejected and reassigned ',NULL,5,'',NULL),('-','2021-01-02 20:00:00','-','2021-01-02 20:00:00',0,127,'',1,'Need to review',NULL,42,'Rohan DEO',6,'Need to review',NULL,5,'',NULL),('-','2021-01-02 20:00:42','-','2021-01-02 20:00:42',0,128,'',1,'Submitted to CCS',NULL,1,'Amal12 Kumara',2,'Submitted to CCS',NULL,5,'',NULL),('-','2021-01-02 20:03:16','-','2021-01-02 20:03:16',0,129,'',1,'aaaaaaaaaaaa\nbbbbbbbbbbbbbbbbbb',NULL,1,'Amal12 Kumara',5,'Rejected from the CCS',NULL,5,'',NULL),('-','2021-01-02 20:06:19','-','2021-01-02 20:06:19',0,130,'',1,'Pending Data Entry',NULL,1,'Amal12 Kumara',3,'Pending Data Entry',NULL,5,'',NULL),('-','2021-01-02 20:07:15','-','2021-01-02 20:07:15',0,131,'',1,'Need to review',NULL,42,'Rohan DEO',6,'Need to review',NULL,5,'',NULL),('-','2021-01-02 20:08:07','-','2021-01-02 20:08:07',0,132,'',1,'Submitted to CCS',NULL,1,'Amal12 Kumara',2,'Submitted to CCS',NULL,5,'',NULL),('-','2021-01-02 20:08:52','-','2021-01-02 20:08:52',0,133,'',1,'',NULL,1,'Amal12 Kumara',5,'Rejected from the CCS',NULL,5,'',NULL),('-','2021-01-02 20:23:36','-','2021-01-02 20:23:36',0,134,'',1,'Need to assign ',NULL,1,'Amal12 Kumara',1,'Need to assign ',NULL,NULL,'',5),('-','2021-01-02 22:05:33','-','2021-01-02 22:05:33',0,135,'',1,'Pending Data Entry',NULL,45,'Rohan Map',3,'Pending Data Entry',NULL,NULL,'',1),('-','2021-01-02 22:10:20','-','2021-01-02 22:10:20',0,136,'',1,'Need to review',NULL,42,'Rohan DEO',6,'Need to review',NULL,NULL,'',1),('-','2021-01-02 22:11:42','-','2021-01-02 22:11:42',0,137,'',1,'Need to review',NULL,42,'Rohan DEO',6,'Need to review',NULL,NULL,'',5),('-','2021-01-02 22:28:40','-','2021-01-02 22:28:40',0,138,'',1,'Submitted to CCS',NULL,45,'Rohan Map',2,'Submitted to CCS',NULL,NULL,'',1),('-','2021-01-02 22:35:04','-','2021-01-02 22:35:04',0,139,'',1,'Submitted to CCS',NULL,45,'Rohan Map',2,'Submitted to CCS',NULL,NULL,'',5),('-','2021-01-02 22:35:57','-','2021-01-02 22:35:57',0,140,'',1,'Publish',NULL,1,'Amal12 Kumara',7,'Publish',NULL,NULL,'',2),('-','2021-01-02 22:36:18','-','2021-01-02 22:36:18',0,141,'',1,'Publish',NULL,1,'Amal12 Kumara',7,'Publish',NULL,NULL,'',5),('-','2021-01-03 06:40:08','-','2021-01-03 06:40:08',0,142,'',1,'Need to assign ',50,1,'Amal12 Kumara',1,'Need to assign ',25,NULL,'',NULL),('-','2021-01-03 06:42:16','-','2021-01-03 06:42:16',0,143,'',1,'Pending Data Entry',50,1,'Amal12 Kumara',3,'Pending Data Entry',25,NULL,'',NULL),('-','2021-01-03 06:59:41','-','2021-01-03 06:59:41',0,144,'',1,'entered value : 102',50,42,'Rohan DEO',6,'Need to review',25,NULL,'',NULL),('-','2021-01-03 07:00:01','-','2021-01-03 07:00:01',0,145,'',1,'entered value : 100',50,42,'Rohan DEO',6,'Need to review',25,NULL,'',NULL),('-','2021-01-03 07:02:56','-','2021-01-03 07:02:56',0,146,'',1,'entered value : 100',50,42,'Rohan DEO',6,'Need to review',25,NULL,'',NULL),('-','2021-01-03 07:06:18','-','2021-01-03 07:06:18',0,147,'',1,'aaaaaaaaa',50,1,'Amal12 Kumara',4,'Rejected and reassigned ',25,NULL,'',NULL),('-','2021-01-03 07:07:49','-','2021-01-03 07:07:49',0,148,'',1,'entered value : 101',50,42,'Rohan DEO',6,'Need to review',25,NULL,'',NULL),('-','2021-01-03 07:08:13','-','2021-01-03 07:08:13',0,149,'',1,'aaaaaaaaaaa\nbbbbbbbbbbbbbbbb',50,1,'Amal12 Kumara',4,'Rejected and reassigned ',25,NULL,'',NULL),('-','2021-01-03 07:09:15','-','2021-01-03 07:09:15',0,150,'',1,'entered value : 102',50,42,'Rohan DEO',6,'Need to review',25,NULL,'',NULL),('-','2021-01-03 07:09:34','-','2021-01-03 07:09:34',0,151,'',1,'Submitted to CCS',50,1,'Amal12 Kumara',2,'Submitted to CCS',25,NULL,'',NULL),('-','2021-01-03 07:10:12','-','2021-01-03 07:10:12',0,152,'',1,'aaacccccccc\ncccccccccccccc',50,1,'Amal12 Kumara',5,'Rejected from the CCS',25,NULL,'',NULL),('-','2021-01-03 07:12:05','-','2021-01-03 07:12:05',0,153,'',1,'aaa\n\naaaaaaaaaaaaaa',50,1,'Amal12 Kumara',5,'Rejected from the CCS',25,NULL,'',NULL),('-','2021-01-03 07:12:53','-','2021-01-03 07:12:53',0,154,'',1,'Publish',50,1,'Amal12 Kumara',7,'Publish',25,NULL,'',NULL),('-','2021-01-09 00:35:56','-','2021-01-09 00:35:56',0,155,'',1,'Need to assign ',51,47,'Rohan Map',1,'Need to assign ',4,NULL,'',NULL),('-','2021-01-09 00:42:07','-','2021-01-09 00:42:07',0,156,'',1,'Pending Data Entry',51,62,'Rohan Map',3,'Pending Data Entry',4,NULL,'',NULL),('-','2021-01-09 00:52:33','-','2021-01-09 00:52:33',0,157,'',1,'Abc value not available',51,65,'Rohan Map',6,'Need to review',4,NULL,'',NULL),('-','2021-01-09 00:54:18','-','2021-01-09 00:54:18',0,158,'',1,'Over valued',51,62,'Rohan Map',4,'Rejected and reassigned ',4,NULL,'',NULL),('-','2021-01-09 00:57:47','-','2021-01-09 00:57:47',0,159,'',1,'entered value : 123123.123123',51,65,'Rohan Map',6,'Need to review',4,NULL,'',NULL),('-','2021-01-09 01:30:16','-','2021-01-09 01:30:16',0,160,'',1,'aaaa\naaaaaaaaaaaaaaaaa ssssssssssssssssss\n\naaaaaaaaaaaaaaaa',51,62,'Rohan Map',4,'Rejected and reassigned ',4,NULL,'',NULL),('-','2021-01-09 01:42:17','-','2021-01-09 01:42:17',0,161,'',1,'entered value : 1234.4321',51,65,'Rohan Map',6,'Need to review',4,NULL,'',NULL),('-','2021-01-09 02:39:55','-','2021-01-09 02:39:55',0,162,'',1,'Reject reason 2',51,62,'Rohan Map',4,'Rejected and reassigned ',4,NULL,'',NULL),('-','2021-01-09 02:49:18','-','2021-01-09 02:49:18',0,163,'',1,'entered value : 321.123',51,65,'Rohan Map',6,'Need to review',4,NULL,'',NULL),('-','2021-01-09 03:02:43','-','2021-01-09 03:02:43',0,164,'',1,'asas\nasas',51,62,'Rohan Map',4,'Rejected and reassigned ',4,NULL,'',NULL),('-','2021-01-09 03:03:33','-','2021-01-09 03:03:33',0,165,'',1,'undefined',51,65,'Rohan Map',6,'Need to review',4,NULL,'',NULL),('-','2021-01-09 03:05:19','-','2021-01-09 03:05:19',0,166,'',1,'aaaaaaa\n\nbbbbbbbbbbb',51,62,'Rohan Map',4,'Rejected and reassigned ',4,NULL,'',NULL),('-','2021-01-09 03:06:21','-','2021-01-09 03:06:21',0,167,'',1,'entered value : 567.12',51,65,'Rohan Map',6,'Need to review',4,NULL,'',NULL),('-','2021-01-09 03:07:09','-','2021-01-09 03:07:09',0,168,'',1,'entered value : 567.12',51,65,'Rohan Map',6,'Need to review',4,NULL,'',NULL),('-','2021-01-09 03:10:50','-','2021-01-09 03:10:50',0,169,'',1,'aaaaaaaaaaa\nbbbbbbbbbbbbbbbbbbb',51,62,'Rohan Map',4,'Rejected and reassigned ',4,NULL,'',NULL),('-','2021-01-09 03:12:28','-','2021-01-09 03:12:28',0,170,'',1,'Need to assign ',52,47,'Rohan Map',1,'Need to assign ',15,NULL,'',NULL),('-','2021-01-09 03:12:28','-','2021-01-09 03:12:28',0,171,'',1,'Need to assign ',55,47,'Rohan Map',1,'Need to assign ',15,NULL,'',NULL),('-','2021-01-09 03:12:28','-','2021-01-09 03:12:28',0,172,'',1,'Need to assign ',54,47,'Rohan Map',1,'Need to assign ',15,NULL,'',NULL),('-','2021-01-09 03:12:28','-','2021-01-09 03:12:28',0,173,'',1,'Need to assign ',53,47,'Rohan Map',1,'Need to assign ',15,NULL,'',NULL),('-','2021-01-09 03:13:29','-','2021-01-09 03:13:29',0,174,'',1,'Pending Data Entry',52,62,'Rohan Map',3,'Pending Data Entry',15,NULL,'',NULL),('-','2021-01-09 03:13:29','-','2021-01-09 03:13:29',0,175,'',1,'Pending Data Entry',54,62,'Rohan Map',3,'Pending Data Entry',15,NULL,'',NULL),('-','2021-01-09 03:13:29','-','2021-01-09 03:13:29',0,176,'',1,'Pending Data Entry',55,62,'Rohan Map',3,'Pending Data Entry',15,NULL,'',NULL),('-','2021-01-09 03:13:29','-','2021-01-09 03:13:29',0,177,'',1,'Pending Data Entry',53,62,'Rohan Map',3,'Pending Data Entry',15,NULL,'',NULL),('-','2021-01-09 03:13:29','-','2021-01-09 03:13:29',0,178,'',1,'Pending Data Entry',45,62,'Rohan Map',3,'Pending Data Entry',4,NULL,'',NULL),('-','2021-01-09 03:16:16','-','2021-01-09 03:16:16',0,179,'',1,'entered value : 123.45',52,65,'Rohan Map',6,'Need to review',15,NULL,'',NULL),('-','2021-01-09 03:16:16','-','2021-01-09 03:16:16',0,180,'',1,'entered value : 45612.12',55,65,'Rohan Map',6,'Need to review',15,NULL,'',NULL),('-','2021-01-09 03:16:16','-','2021-01-09 03:16:16',0,181,'',1,'entered value : 34567.12',54,65,'Rohan Map',6,'Need to review',15,NULL,'',NULL),('-','2021-01-09 03:16:16','-','2021-01-09 03:16:16',0,182,'',1,'entered value : 2345.12',53,65,'Rohan Map',6,'Need to review',15,NULL,'',NULL),('-','2021-01-09 03:22:59','-','2021-01-09 03:22:59',0,183,'',1,'aaa',52,62,'Rohan Map',4,'Rejected and reassigned ',15,NULL,'',NULL),('-','2021-01-09 03:22:59','-','2021-01-09 03:22:59',0,184,'',1,'aaa',53,62,'Rohan Map',4,'Rejected and reassigned ',15,NULL,'',NULL),('-','2021-01-09 03:22:59','-','2021-01-09 03:22:59',0,185,'',1,'aaa',54,62,'Rohan Map',4,'Rejected and reassigned ',15,NULL,'',NULL),('-','2021-01-09 03:23:08','-','2021-01-09 03:23:08',0,186,'',1,'ccc',55,62,'Rohan Map',4,'Rejected and reassigned ',15,NULL,'',NULL),('-','2021-01-09 03:24:25','-','2021-01-09 03:24:25',0,187,'',1,'entered value : 2233',53,65,'Rohan Map',6,'Need to review',15,NULL,'',NULL),('-','2021-01-09 03:24:25','-','2021-01-09 03:24:25',0,188,'',1,'entered value : 1122',52,65,'Rohan Map',6,'Need to review',15,NULL,'',NULL),('-','2021-01-09 03:24:25','-','2021-01-09 03:24:25',0,189,'',1,'entered value : 5566',55,65,'Rohan Map',6,'Need to review',15,NULL,'',NULL),('-','2021-01-09 03:27:30','-','2021-01-09 03:27:30',0,190,'',1,'aaaaaaaaa',52,62,'Rohan Map',4,'Rejected and reassigned ',15,NULL,'',NULL),('-','2021-01-09 03:27:30','-','2021-01-09 03:27:30',0,191,'',1,'aaaaaaaaa',53,62,'Rohan Map',4,'Rejected and reassigned ',15,NULL,'',NULL),('-','2021-01-09 03:27:30','-','2021-01-09 03:27:30',0,192,'',1,'aaaaaaaaa',55,62,'Rohan Map',4,'Rejected and reassigned ',15,NULL,'',NULL),('-','2021-01-09 03:28:40','-','2021-01-09 03:28:40',0,193,'',1,'entered value : 2233',52,65,'Rohan Map',6,'Need to review',15,NULL,'',NULL),('-','2021-01-09 03:28:40','-','2021-01-09 03:28:40',0,194,'',1,'entered value : 3322',54,65,'Rohan Map',6,'Need to review',15,NULL,'',NULL),('-','2021-01-09 03:28:40','-','2021-01-09 03:28:40',0,195,'',1,'entered value : 1122',51,65,'Rohan Map',6,'Need to review',4,NULL,'',NULL),('-','2021-01-09 03:33:18','-','2021-01-09 03:33:18',0,196,'',1,'entered value : 1233',53,65,'Rohan Map',6,'Need to review',15,NULL,'',NULL),('-','2021-01-09 03:33:18','-','2021-01-09 03:33:18',0,197,'',1,'entered value : 1144',55,65,'Rohan Map',6,'Need to review',15,NULL,'',NULL),('-','2021-01-09 03:34:29','-','2021-01-09 03:34:29',0,198,'',1,'sadf;as\ns;dk;daslfd',51,62,'Rohan Map',4,'Rejected and reassigned ',4,NULL,'',NULL),('-','2021-01-09 03:34:29','-','2021-01-09 03:34:29',0,199,'',1,'sadf;as\ns;dk;daslfd',53,62,'Rohan Map',4,'Rejected and reassigned ',15,NULL,'',NULL),('-','2021-01-09 03:34:29','-','2021-01-09 03:34:29',0,200,'',1,'sadf;as\ns;dk;daslfd',54,62,'Rohan Map',4,'Rejected and reassigned ',15,NULL,'',NULL),('-','2021-01-09 03:34:29','-','2021-01-09 03:34:29',0,201,'',1,'sadf;as\ns;dk;daslfd',52,62,'Rohan Map',4,'Rejected and reassigned ',15,NULL,'',NULL),('-','2021-01-09 03:35:15','-','2021-01-09 03:35:15',0,202,'',1,'abc rason',53,65,'Rohan Map',6,'Need to review',15,NULL,'',NULL),('-','2021-01-09 03:35:15','-','2021-01-09 03:35:15',0,203,'',1,'abc rason',52,65,'Rohan Map',6,'Need to review',15,NULL,'',NULL),('-','2021-01-09 03:36:26','-','2021-01-09 03:36:26',0,204,'',1,'entered value : 234.56',51,65,'Rohan Map',6,'Need to review',4,NULL,'',NULL),('-','2021-01-09 03:36:26','-','2021-01-09 03:36:26',0,205,'',1,'entered value : 123.456',54,65,'Rohan Map',6,'Need to review',15,NULL,'',NULL),('-','2021-01-09 03:46:45','-','2021-01-09 03:46:45',0,206,'',1,'rrejected',51,62,'Rohan Map',4,'Rejected and reassigned ',4,NULL,'',NULL),('-','2021-01-09 03:46:45','-','2021-01-09 03:46:45',0,207,'',1,'rrejected',52,62,'Rohan Map',4,'Rejected and reassigned ',15,NULL,'',NULL),('-','2021-01-09 03:47:03','-','2021-01-09 03:47:03',0,208,'',1,'Submitted to CCS',54,62,'Rohan Map',2,'Submitted to CCS',15,NULL,'',NULL),('-','2021-01-09 03:47:03','-','2021-01-09 03:47:03',0,209,'',1,'Submitted to CCS',53,62,'Rohan Map',2,'Submitted to CCS',15,NULL,'',NULL),('-','2021-01-09 03:47:03','-','2021-01-09 03:47:03',0,210,'',1,'Submitted to CCS',55,62,'Rohan Map',2,'Submitted to CCS',15,NULL,'',NULL),('-','2021-01-09 04:00:06','-','2021-01-09 04:00:06',0,211,'',1,'Publish',53,47,'Rohan Map',7,'Publish',15,NULL,'',NULL),('-','2021-01-09 04:00:06','-','2021-01-09 04:00:06',0,212,'',1,'Publish',54,47,'Rohan Map',7,'Publish',15,NULL,'',NULL),('-','2021-01-11 16:07:03','-','2021-01-11 16:07:03',0,213,'',1,'Need to assign ',56,47,'Rohan Map',1,'Need to assign ',47,NULL,'',NULL),('-','2021-01-11 16:21:46','-','2021-01-11 16:21:46',0,214,'',1,'entered value : 2110111',33,45,'Rohan Map',6,'Need to review',14,NULL,'',NULL),('-','2021-01-11 17:04:15','-','2021-01-11 17:04:15',0,215,'',1,'Test treject msg',33,45,'Rohan Map',4,'Rejected and reassigned ',14,NULL,'',NULL),('-','2021-01-11 17:07:16','-','2021-01-11 17:07:16',0,216,'',1,'Need to assign ',57,47,'Rohan Map',1,'Need to assign ',47,NULL,'',NULL),('-','2021-01-11 17:08:55','-','2021-01-11 17:08:55',0,217,'',1,'Pending Data Entry',57,45,'Rohan Map',3,'Pending Data Entry',47,NULL,'',NULL),('-','2021-01-11 18:59:09','-','2021-01-11 18:59:09',0,218,'',1,'Need to assign ',58,47,'Rohan Map',1,'Need to assign ',47,NULL,'',NULL),('-','2021-01-11 19:03:42','-','2021-01-11 19:03:42',0,219,'',1,'entered value : 11',33,45,'Rohan Map',6,'Need to review',14,NULL,'',NULL),('-','2021-01-11 19:03:42','-','2021-01-11 19:03:42',0,220,'',1,'entered value : 1110.12345',57,45,'Rohan Map',6,'Need to review',47,NULL,'',NULL),('-','2021-01-11 19:04:07','-','2021-01-11 19:04:07',0,221,'',1,'Submitted to CCS',33,45,'Rohan Map',2,'Submitted to CCS',14,NULL,'',NULL),('-','2021-01-11 19:04:07','-','2021-01-11 19:04:07',0,222,'',1,'Submitted to CCS',57,45,'Rohan Map',2,'Submitted to CCS',47,NULL,'',NULL),('-','2021-01-11 19:15:42','-','2021-01-11 19:15:42',0,223,'',1,'Need to review',NULL,45,'Rohan Map',6,'Need to review',NULL,NULL,'',1),('-','2021-01-11 19:15:56','-','2021-01-11 19:15:56',0,224,'',1,'Need to review',NULL,45,'Rohan Map',6,'Need to review',NULL,NULL,'',3),('-','2021-01-12 05:42:43','-','2021-01-12 05:42:43',0,225,'',1,'Need to assign ',59,47,'Rohan Map',1,'Need to assign ',48,NULL,'',NULL),('-','2021-01-12 05:44:05','-','2021-01-12 05:44:05',0,226,'',1,'entered value : 110',59,45,'Rohan Map',6,'Need to review',48,NULL,'',NULL),('-','2021-01-12 05:46:18','-','2021-01-12 05:46:18',0,227,'',1,'Submitted to CCS',59,45,'Rohan Map',2,'Submitted to CCS',48,NULL,'',NULL),('-','2021-01-12 05:47:57','-','2021-01-12 05:47:57',0,228,'',1,'Publish',59,47,'Rohan Map',7,'Publish',48,NULL,'',NULL),('-','2021-01-17 10:15:34','-','2021-01-17 10:15:34',0,229,'',1,'Need to assign ',60,47,'Rohan Map',1,'Need to assign ',40,NULL,'',NULL),('-','2021-01-17 10:16:20','-','2021-01-17 10:16:20',0,230,'',1,'Need to assign ',61,47,'Rohan Map',1,'Need to assign ',38,NULL,'',NULL),('-','2021-01-17 10:33:01','-','2021-01-17 10:33:01',0,231,'',1,'Need to assign ',62,47,'Rohan Map',1,'Need to assign ',30,NULL,'',NULL),('-','2021-01-17 11:28:13','-','2021-01-17 11:28:13',0,232,'',1,'Need to assign ',64,47,'Rohan Map',1,'Need to assign ',13,NULL,'',NULL),('-','2021-01-17 11:29:01','-','2021-01-17 11:29:01',0,233,'',1,'Need to assign ',65,47,'Rohan Map',1,'Need to assign ',13,NULL,'',NULL),('-','2021-01-17 11:29:02','-','2021-01-17 11:29:02',0,234,'',1,'Need to assign ',66,47,'Rohan Map',1,'Need to assign ',13,NULL,'',NULL),('-','2021-01-17 11:29:02','-','2021-01-17 11:29:02',0,235,'',1,'Need to assign ',67,47,'Rohan Map',1,'Need to assign ',13,NULL,'',NULL),('-','2021-01-17 11:29:02','-','2021-01-17 11:29:02',0,236,'',1,'Need to assign ',68,47,'Rohan Map',1,'Need to assign ',13,NULL,'',NULL),('-','2021-01-17 11:57:32','-','2021-01-17 11:57:32',0,237,'',1,'Need to assign ',70,47,'Rohan Map',1,'Need to assign ',13,NULL,'',NULL),('-','2021-01-17 11:57:32','-','2021-01-17 11:57:32',0,238,'',1,'Need to assign ',69,47,'Rohan Map',1,'Need to assign ',40,NULL,'',NULL),('-','2021-01-17 11:57:32','-','2021-01-17 11:57:32',0,239,'',1,'Need to assign ',72,47,'Rohan Map',1,'Need to assign ',13,NULL,'',NULL),('-','2021-01-17 11:57:32','-','2021-01-17 11:57:32',0,240,'',1,'Need to assign ',71,47,'Rohan Map',1,'Need to assign ',13,NULL,'',NULL),('-','2021-01-17 12:08:19','-','2021-01-17 12:08:19',0,241,'',1,'Need to assign ',73,47,'Rohan Map',1,'Need to assign ',13,NULL,'',NULL),('-','2021-01-17 12:08:19','-','2021-01-17 12:08:19',0,242,'',1,'Need to assign ',75,47,'Rohan Map',1,'Need to assign ',38,NULL,'',NULL),('-','2021-01-17 12:08:19','-','2021-01-17 12:08:19',0,243,'',1,'Need to assign ',74,47,'Rohan Map',1,'Need to assign ',13,NULL,'',NULL),('-','2021-01-17 12:08:19','-','2021-01-17 12:08:19',0,244,'',1,'Need to assign ',76,47,'Rohan Map',1,'Need to assign ',30,NULL,'',NULL),('-','2021-01-17 12:10:17','-','2021-01-17 12:10:17',0,245,'',1,'Need to assign ',77,47,'Rohan Map',1,'Need to assign ',47,NULL,'',NULL),('-','2021-01-17 12:10:17','-','2021-01-17 12:10:17',0,246,'',1,'Need to assign ',78,47,'Rohan Map',1,'Need to assign ',48,NULL,'',NULL),('-','2021-01-17 12:29:58','-','2021-01-17 12:29:58',0,247,'',1,'Pending Data Entry',70,45,'Rohan Map',3,'Pending Data Entry',13,NULL,'',NULL),('-','2021-01-17 12:29:58','-','2021-01-17 12:29:58',0,248,'',1,'Pending Data Entry',71,45,'Rohan Map',3,'Pending Data Entry',13,NULL,'',NULL),('-','2021-01-17 12:29:58','-','2021-01-17 12:29:58',0,249,'',1,'Pending Data Entry',72,45,'Rohan Map',3,'Pending Data Entry',13,NULL,'',NULL),('-','2021-01-23 11:50:02','-','2021-01-23 11:50:02',0,250,'',1,'Need to assign ',79,47,'Rohan Map',1,'Need to assign ',48,NULL,'',NULL),('-','2021-01-23 11:50:02','-','2021-01-23 11:50:02',0,251,'',1,'Need to assign ',80,47,'Rohan Map',1,'Need to assign ',38,NULL,'',NULL),('-','2021-01-23 11:50:02','-','2021-01-23 11:50:02',0,252,'',1,'Need to assign ',81,47,'Rohan Map',1,'Need to assign ',40,NULL,'',NULL),('-','2021-01-23 20:11:56','-','2021-01-23 20:11:56',0,253,'',1,'Need to assign ',82,47,'Rohan Map',1,'Need to assign ',30,NULL,'',NULL),('-','2021-01-23 20:11:56','-','2021-01-23 20:11:56',0,254,'',1,'Need to assign ',83,47,'Rohan Map',1,'Need to assign ',13,NULL,'',NULL),('-','2021-01-23 20:22:45','-','2021-01-23 20:22:45',0,255,'',1,'Data Entry Unit : Number,\n             Data Entry Value : 10001,\n             Multiplication Factor : 10.000000\n             Requested Unit : gram, \n             Requested Value : 100010',70,45,'Rohan Map',6,'Need to review',13,NULL,'',NULL),('-','2021-01-24 15:30:30','-','2021-01-24 15:30:30',0,256,'',1,'Data Entry Unit : Number,\n             Data Entry Value : 10001,\n             Multiplication Factor : 100.000000\n             Requested Unit : gram, \n             Requested Value : 100.01',71,45,'Rohan Map',6,'Need to review',13,NULL,'',NULL),('-','2021-01-24 15:58:36','-','2021-01-24 15:58:36',0,257,'',1,'test',70,45,'Rohan Map',4,'Rejected and reassigned ',13,NULL,'',NULL),('-','2021-01-24 16:01:06','-','2021-01-24 16:01:06',0,258,'',1,'Data Entry Unit : gram,\n             Data Entry Value : 102,\n             Multiplication Factor : 1.000000\n             Requested Unit : gram, \n             Requested Value : 102',70,45,'Rohan Map',6,'Need to review',13,NULL,'',NULL),('-','2021-01-24 16:01:31','-','2021-01-24 16:01:31',0,259,'',1,'100',70,45,'Rohan Map',4,'Rejected and reassigned ',13,NULL,'',NULL),('-','2021-01-24 16:01:51','-','2021-01-24 16:01:51',0,260,'',1,'Data Entry Unit : Number,\n             Data Entry Value : 10002,\n             Multiplication Factor : 100.000000\n             Requested Unit : gram, \n             Requested Value : 100.02',70,45,'Rohan Map',6,'Need to review',13,NULL,'',NULL),('-','2021-01-24 16:02:15','-','2021-01-24 16:02:15',0,261,'',1,'aaa',70,45,'Rohan Map',4,'Rejected and reassigned ',13,NULL,'',NULL),('-','2021-01-24 16:02:59','-','2021-01-24 16:02:59',0,262,'',1,'Data Entry Unit : Number,\n             Data Entry Value : 10003,\n             Multiplication Factor : 100.000000\n             Requested Unit : gram, \n             Requested Value : 100.03',70,45,'Rohan Map',6,'Need to review',13,NULL,'',NULL);
/*!40000 ALTER TABLE `data_request_status_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deadline`
--

DROP TABLE IF EXISTS `deadline`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `deadline` (
  `createdBy` varchar(255) NOT NULL,
  `createdOn` datetime NOT NULL,
  `editedBy` varchar(255) NOT NULL,
  `editedOn` datetime NOT NULL,
  `status` int NOT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(2500) NOT NULL,
  `sortOrder` int NOT NULL,
  `addAmount` int NOT NULL,
  `addType` varchar(255) NOT NULL,
  `notifyBefore` int NOT NULL,
  `numberOfDays` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deadline`
--

LOCK TABLES `deadline` WRITE;
/*!40000 ALTER TABLE `deadline` DISABLE KEYS */;
INSERT INTO `deadline` VALUES (' ','2020-11-15 00:00:00',' ','2020-11-15 00:00:00',1,1,'31st Jan','31st Jan',1,1,'M',5,30),(' ','2020-11-15 00:00:00',' ','2020-11-15 00:00:00',1,2,'31st Aug /31st Jan','31st Aug /31st Jan',1,1,'Q',5,5),(' ','2020-11-15 00:00:00',' ','2020-11-15 00:00:00',1,3,'7th Month','7th Month',1,1,'M',5,5),(' ','2020-11-15 00:00:00',' ','2020-11-15 00:00:00',1,4,'1st day of the week','1st day of the week',1,1,'d',5,5),(' ','2020-11-15 00:00:00',' ','2020-11-15 00:00:00',1,5,'Same day','Same day',1,0,'d',5,5);
/*!40000 ALTER TABLE `deadline` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `district`
--

DROP TABLE IF EXISTS `district`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `district` (
  `createdBy` varchar(255) NOT NULL,
  `createdOn` datetime NOT NULL,
  `editedBy` varchar(255) NOT NULL,
  `editedOn` datetime NOT NULL,
  `status` int NOT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `sortOrder` int NOT NULL,
  `provinceId` int DEFAULT NULL,
  `description` varchar(2500) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_23a21b38208367a242b1dd3a424` (`provinceId`),
  CONSTRAINT `FK_23a21b38208367a242b1dd3a424` FOREIGN KEY (`provinceId`) REFERENCES `province` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `district`
--

LOCK TABLES `district` WRITE;
/*!40000 ALTER TABLE `district` DISABLE KEYS */;
INSERT INTO `district` VALUES ('','0000-00-00 00:00:00','','0000-00-00 00:00:00',0,1,'Kandy',1,1,''),('','0000-00-00 00:00:00','','0000-00-00 00:00:00',0,2,'Matale',2,1,''),('','0000-00-00 00:00:00','','0000-00-00 00:00:00',0,3,'Nuwara Eliya',3,1,''),('','0000-00-00 00:00:00','','0000-00-00 00:00:00',0,4,'Ampara',4,2,''),('','0000-00-00 00:00:00','','0000-00-00 00:00:00',0,5,'Batticaloa',5,2,''),('','0000-00-00 00:00:00','','0000-00-00 00:00:00',0,6,'Trincomalee',6,2,''),('','0000-00-00 00:00:00','','0000-00-00 00:00:00',0,7,'Anuradhapura',7,3,''),('','0000-00-00 00:00:00','','0000-00-00 00:00:00',0,8,'Polonnaruwa',8,3,''),('','0000-00-00 00:00:00','','0000-00-00 00:00:00',0,9,'Kurunegala',9,4,''),('','0000-00-00 00:00:00','','0000-00-00 00:00:00',0,10,'Puttalam',10,4,''),('','0000-00-00 00:00:00','','0000-00-00 00:00:00',0,11,'Jaffna',11,5,''),('','0000-00-00 00:00:00','','0000-00-00 00:00:00',0,12,'Kilinochchi',12,5,''),('','0000-00-00 00:00:00','','0000-00-00 00:00:00',0,13,'Mannar',13,5,''),('','0000-00-00 00:00:00','','0000-00-00 00:00:00',0,14,'Mullaitivu',14,5,''),('','0000-00-00 00:00:00','','0000-00-00 00:00:00',0,15,'Vavuniya',15,5,''),('','0000-00-00 00:00:00','','0000-00-00 00:00:00',0,16,'Kegalle',16,6,''),('','0000-00-00 00:00:00','','0000-00-00 00:00:00',0,17,'Ratnapura',17,6,''),('','0000-00-00 00:00:00','','0000-00-00 00:00:00',0,18,'Galle',18,7,''),('','0000-00-00 00:00:00','','0000-00-00 00:00:00',0,19,'Hambantota',19,7,''),('','0000-00-00 00:00:00','','0000-00-00 00:00:00',0,20,'Matara',20,7,''),('','0000-00-00 00:00:00','','0000-00-00 00:00:00',0,21,'Badulla',21,8,''),('','0000-00-00 00:00:00','','0000-00-00 00:00:00',0,22,'Moneragala',22,8,''),('','0000-00-00 00:00:00','','0000-00-00 00:00:00',0,23,'Colombo',23,9,''),('','0000-00-00 00:00:00','','0000-00-00 00:00:00',0,24,'Gampaha',24,9,''),('','0000-00-00 00:00:00','','0000-00-00 00:00:00',0,25,'Kalutara',25,9,'');
/*!40000 ALTER TABLE `district` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `divisional_secretariat`
--

DROP TABLE IF EXISTS `divisional_secretariat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `divisional_secretariat` (
  `createdBy` varchar(255) NOT NULL,
  `createdOn` datetime NOT NULL,
  `editedBy` varchar(255) NOT NULL,
  `editedOn` datetime NOT NULL,
  `status` int NOT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `sortOrder` int NOT NULL,
  `districtId` int DEFAULT NULL,
  `description` varchar(2500) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_53eddeff72614190997c534eefe` (`districtId`),
  CONSTRAINT `FK_53eddeff72614190997c534eefe` FOREIGN KEY (`districtId`) REFERENCES `district` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=333 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `divisional_secretariat`
--

LOCK TABLES `divisional_secretariat` WRITE;
/*!40000 ALTER TABLE `divisional_secretariat` DISABLE KEYS */;
INSERT INTO `divisional_secretariat` VALUES ('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,1,'Sammanthurai',1,4,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,2,'Addalaichenai',1,4,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,3,'Nintavur',1,4,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,4,'Damana',1,4,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,5,'Alaiyadivembu',1,4,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,6,'Lahugala',1,4,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,7,'Irakkamam',1,4,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,8,'Saindamarudu',1,4,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,9,'Padiyathalawa',1,4,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,10,'Karaitivu',1,4,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,11,'Kalmunai',1,4,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,12,'Dehiaththa',1,4,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,13,'Akkaraipattu',1,4,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,14,'Navithanveli',1,4,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,15,'Uhana',1,4,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,16,'Mahaoya',1,4,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,17,'Ampara',1,4,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,18,'Kalmunai',1,4,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,19,'Pothuwil',1,4,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,20,'Thirukkowil',1,4,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,21,'Rambewa',1,7,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,22,'Galenbindunuwewa',1,7,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,23,'Nuwaragam',1,7,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,24,'Nochchiyagama',1,7,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,25,'Horowpothana',1,7,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,26,'Rajanganaya',1,7,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,27,'Nuwaragam',1,7,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,28,'Nachchaduwa',1,7,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,29,'Thambutthegama',1,7,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,30,'Kekirawa',1,7,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,31,'Medawachchiya',1,7,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,32,'Mahawilachchiya',1,7,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,33,'Mihinthale',1,7,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,34,'Ipalogama',1,7,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,35,'Thirappane',1,7,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,36,'Kahatagasdigiliya',1,7,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,37,'Thalawa',1,7,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,38,'Kebithigollewa',1,7,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,39,'Galnewa',1,7,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,40,'Padaviya',1,7,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,41,'Palagala',1,7,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,42,'Palugaswewa',1,7,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,43,'Badulla',1,21,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,44,'Kandaketiya',1,21,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,45,'Bandarawela',1,21,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,46,'Haputale',1,21,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,47,'Soranathota',1,21,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,48,'Meegahakiula',1,21,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,49,'Rideemaliyadda',1,21,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,50,'Passara',1,21,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,51,'Lunugala',1,21,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,52,'Ella',1,21,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,53,'Welimada',1,21,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,54,'Uva',1,21,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,55,'Haliela',1,21,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,56,'Haldunmulla',1,21,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,57,'Mahiyanganaya',1,21,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,58,'Manmunai',1,5,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,59,'Koralaipattu',1,5,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,60,'Koralaipattu',1,5,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,61,'Manmunaipattu',1,5,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,62,'Eravurpattu',1,5,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,63,'Manmunai',1,5,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,64,'Manmunai',1,5,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,65,'Kaththankudy',1,5,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,66,'Manmunai',1,5,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,67,'Porativu',1,5,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,68,'Koralaipattu',1,5,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,69,'Koralaipattu',1,5,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,70,'Koralaipattu',1,5,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,71,'Eravur',1,5,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,72,'Maharagama',1,23,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,73,'Thimbirigasyaya',1,23,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,74,'Kesbewa',1,23,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,75,'Sri',1,23,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,76,'Colombo',1,23,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,77,'Padukka',1,23,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,78,'Ratmalana',1,23,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,79,'Homagama',1,23,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,80,'Kolonnawa',1,23,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,81,'Kaduwela',1,23,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,82,'Seethawaka-Hanwella',1,23,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,83,'Dehiwala',1,23,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,84,'Moratuwa',1,23,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,85,'Balapitiya',1,18,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,86,'Thawalama',1,18,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,87,'Yakkalamulla',1,18,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,88,'Akmeemana',1,18,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,89,'Elpitiya',1,18,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,90,'Ambalangoda',1,18,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,91,'Karandeniya',1,18,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,92,'Nagoda',1,18,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,93,'Galle',1,18,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,94,'Bope-Poddala',1,18,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,95,'Habaraduwa',1,18,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,96,'Baddegama',1,18,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,97,'Hikkaduwa',1,18,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,98,'Gonapinuwala',1,18,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,99,'Valivitiya-Divithura',1,18,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,100,'Bentota',1,18,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,101,'Niyagama',1,18,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,102,'Imaduwa',1,18,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,103,'Neluwa',1,18,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,104,'Gampaha',1,24,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,105,'Attanagalla',1,24,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,106,'Biyagama',1,24,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,107,'Divulapitiya',1,24,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,108,'Negombo',1,24,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,109,'Dompe/Weke/Kirindiwala',1,24,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,110,'Katana',1,24,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,111,'Wattala',1,24,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,112,'Kelaniya',1,24,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,113,'Ja-Ela',1,24,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,114,'Mirigama',1,24,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,115,'Minuwangoda',1,24,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,116,'Mahara',1,24,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,117,'Beliatta',1,19,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,118,'Hambantota',1,19,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,119,'Tangalle',1,19,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,120,'Walasmulla',1,19,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,121,'Weeraketiya',1,19,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,122,'Lunugamwehera',1,19,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,123,'Okewela',1,19,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,124,'Angunakolapelessa',1,19,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,125,'Katuwana',1,19,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,126,'Sooriyawewa',1,19,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,127,'Tissamaharamaya',1,19,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,128,'Ambalantota',1,19,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,129,'Karainagar',1,11,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,130,'Valikamam',1,11,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,131,'Valikamam',1,11,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,132,'Valikamam',1,11,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,133,'Valikamam',1,11,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,134,'Valikamam',1,11,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,135,'Nallur',1,11,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,136,'Thenmaradchi',1,11,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,137,'Wadamarachchi',1,11,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,138,'Wadamarachchi',1,11,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,139,'Wadamarachchi',1,11,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,140,'Jaffna',1,11,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,141,'Island',1,11,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,142,'Island',1,11,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,143,'Delft',1,11,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,144,'Baduraliya-PalindaNuwara',1,25,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,145,'Millaniya',1,25,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,146,'Mathugama',1,25,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,147,'Panadura',1,25,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,148,'Bandaragama',1,25,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,149,'Horana',1,25,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,150,'Madurawala',1,25,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,151,'Beruwala',1,25,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,152,'Walallawita',1,25,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,153,'Dodangoda',1,25,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,154,'Kalutara',1,25,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,155,'Ingiriya',1,25,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,156,'Bulathsinhala',1,25,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,157,'Agalawatta',1,25,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,158,'Deltota',1,1,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,159,'Thumpane',1,1,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,160,'Kundasale',1,1,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,161,'Udunuwara',1,1,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,162,'Gangawatakorale',1,1,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,163,'Pathahewaheta',1,1,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,164,'Harispattuwa',1,1,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,165,'Akurana',1,1,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,166,'Hatharaliyadda',1,1,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,167,'Pasbage',1,1,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,168,'Panwila',1,1,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,169,'Doluwa',1,1,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,170,'Poojapitiya',1,1,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,171,'Pathadumbara',1,1,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,172,'Udapalatha',1,1,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,173,'Ganga',1,1,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,174,'Udadumbara',1,1,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,175,'Yatinuwara',1,1,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,176,'Medadumbara',1,1,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,177,'Minipe',1,1,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,178,'Galigamuwa',1,16,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,179,'Kegalle',1,16,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,180,'Aranayake',1,16,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,181,'Dehiowita',1,16,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,182,'Warakapola',1,16,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,183,'Rambukkana',1,16,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,184,'Yatiyantota',1,16,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,185,'Bulathkohupitiya',1,16,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,186,'Mawanella',1,16,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,187,'Deraniyagala',1,16,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,188,'Ruwanwella',1,16,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,189,'Pachchilaipallai',1,12,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,190,'Karachchi',1,12,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,191,'Kandawalai',1,12,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,192,'Poonakary',1,12,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,193,'Maspotha',1,9,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,194,'Kuliyapitiya',1,9,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,195,'Polgahawela',1,9,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,196,'Polpithigama',1,9,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,197,'Mallawapitiya',1,9,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,198,'Bmunakotuwa',1,9,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,199,'Kuliyapitiya',1,9,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,200,'Alwwa',1,9,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,201,'Udubaddawa',1,9,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,202,'Kotawehera',1,9,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,203,'Bingiriya',1,9,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,204,'Ambanpola',1,9,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,205,'Nikaweratiya',1,9,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,206,'Mawathagama',1,9,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,207,'Narammala',1,9,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,208,'Kurunagala',1,9,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,209,'Ganewatta',1,9,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,210,'Wariyapola',1,9,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,211,'Ibbagamuwa',1,9,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,212,'Panduwasnuwara',1,9,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,213,'Pannala',1,9,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,214,'Panduwasnuwara',1,9,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,215,'Rasnayakapura',1,9,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,216,'Giribawa',1,9,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,217,'Mahawa',1,9,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,218,'Weerambugedara',1,9,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,219,'Kobeigane',1,9,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,220,'Ridigama',1,9,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,221,'Ehetuwewa',1,9,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,222,'Galgamuwa',1,9,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,223,'Mannar',1,13,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,224,'Nanattan',1,13,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,225,'Manthai',1,13,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,226,'Madhu',1,13,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,227,'Musali',1,13,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,228,'Laggala',1,2,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,229,'Naula',1,2,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,230,'Ukuwela',1,2,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,231,'Yatawatta',1,2,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,232,'Dambulla',1,2,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,233,'Pallepola',1,2,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,234,'Galewela',1,2,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,235,'Wilgamuwa',1,2,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,236,'Matale',1,2,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,237,'Ambangaga',1,2,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,238,'Rathtota',1,2,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,239,'Matara(Four',1,20,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,240,'Devinuwara',1,20,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,241,'Kamburupitiya',1,20,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,242,'Akuressa',1,20,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,243,'Athuraliya',1,20,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,244,'Malimbada',1,20,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,245,'Kotapola',1,20,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,246,'Kirinda',1,20,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,247,'Dikwella',1,20,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,248,'Weligama',1,20,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,249,'Hakmana',1,20,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,250,'Thihagoda',1,20,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,251,'Pitabeddara',1,20,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,252,'Mulatiyana',1,20,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,253,'Pasgoda',1,20,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,254,'Welipitiya',1,20,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,255,'Badalkumbura',1,22,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,256,'Wellawaya',1,22,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,257,'Monaragala',1,22,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,258,'Buththala',1,22,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,259,'Katharagama',1,22,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,260,'Bibile',1,22,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,261,'Medagama',1,22,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,262,'Thanamalwila',1,22,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,263,'Sewanagala',1,22,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,264,'Madulla',1,22,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,265,'Siyabalanduwa',1,22,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,266,'Maritime',1,14,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,267,'Manthei',1,14,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,268,'Pudukudirippu',1,14,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,269,'Oddusudan',1,14,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,270,'Welioya',1,14,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,271,'Thunukkai',1,14,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,272,'Eliya',1,3,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,273,'Eliya',1,3,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,274,'Eliya',1,3,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,275,'Eliya',1,3,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,276,'Eliya',1,3,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,277,'Dimbulagala',1,8,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,278,'Hingurakgoda',1,8,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,279,'Elahera',1,8,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,280,'Thamankaduwa',1,8,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,281,'Welikanda',1,8,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,282,'Lankapura',1,8,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,283,'Madirigiriya',1,8,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,284,'Madampe',1,10,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,285,'Anamaduwa',1,10,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,286,'Dankotuwa',1,10,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,287,'Nattandiya',1,10,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,288,'Wennappuwa',1,10,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,289,'Chilaw/Halawatha',1,10,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,290,'Arachchikattuwa',1,10,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,291,'Mahakumbukkadawala',1,10,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,292,'Wanathavilluwa',1,10,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,293,'Nawagaththegama',1,10,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,294,'Karuwalagaswewa',1,10,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,295,'Mahawewa',1,10,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,296,'Mundalama',1,10,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,297,'Pallama',1,10,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,298,'Kalpitiya',1,10,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,299,'Putthalam',1,10,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,300,'Kahawatta',1,17,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,301,'Embilipitiya',1,17,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,302,'Niwithigala',1,17,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,303,'Kolonna',1,17,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,304,'Eheliyagoda',1,17,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,305,'Kuruwita',1,17,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,306,'Ratnapura',1,17,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,307,'Elapatha',1,17,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,308,'Weligepola',1,17,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,309,'Kalawana',1,17,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,310,'Pelmadulla',1,17,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,311,'Opanayaka',1,17,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,312,'Godakawela',1,17,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,313,'Balangoda',1,17,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,314,'Imbulpe',1,17,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,315,'Kiriella',1,17,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,316,'Ayagama',1,17,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,317,'Trincomalee',1,6,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,318,'Muthur',1,6,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,319,'Verugal',1,6,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,320,'Seruwila',1,6,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,321,'Padavisripura',1,6,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,322,'Kuchchaweli',1,6,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,323,'Thambalagamuwa',1,6,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,324,'Morawewa',1,6,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,325,'Gomarankadawala',1,6,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,326,'Kinniya',1,6,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,327,'Kantale',1,6,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,328,'Thoppur',1,6,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,329,'Vavuniya',1,15,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,330,'Vengalacheddikulam',1,15,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,331,'Vavuniya',1,15,''),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,332,'Vavuniya',1,15,'');
/*!40000 ALTER TABLE `divisional_secretariat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `document`
--

DROP TABLE IF EXISTS `document`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `document` (
  `createdBy` varchar(255) NOT NULL,
  `createdOn` datetime NOT NULL,
  `editedBy` varchar(255) NOT NULL,
  `editedOn` datetime NOT NULL,
  `status` int NOT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  `documentOwner` int NOT NULL,
  `fileName` varchar(255) NOT NULL,
  `relativePath` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `document`
--

LOCK TABLES `document` WRITE;
/*!40000 ALTER TABLE `document` DISABLE KEYS */;
/*!40000 ALTER TABLE `document` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documents`
--

DROP TABLE IF EXISTS `documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `documents` (
  `createdBy` varchar(255) NOT NULL,
  `createdOn` datetime NOT NULL,
  `editedBy` varchar(255) NOT NULL,
  `editedOn` datetime NOT NULL,
  `status` int NOT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  `documentOwner` int NOT NULL,
  `fileName` varchar(255) NOT NULL,
  `relativePath` varchar(255) NOT NULL,
  `documentOwnerId` int NOT NULL,
  `mimeType` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documents`
--

LOCK TABLES `documents` WRITE;
/*!40000 ALTER TABLE `documents` DISABLE KEYS */;
INSERT INTO `documents` VALUES ('','2020-11-25 13:28:29','','2020-11-25 13:28:29',0,5,1,'hiv.png','files\\ProjectProgramme\\2\\63d10533a.png',2,'image/png'),('','2020-11-25 20:15:55','','2020-11-25 20:15:55',0,6,1,'Hopstarter-Puck-McAfee-Virus-Scan.ico','files\\ProjectProgramme\\2\\936515ee.ico',2,'image/x-icon'),('','2020-11-25 22:04:29','','2020-11-25 22:04:29',0,28,1,'house.xlsx','files\\ProjectProgramme\\2\\f2cb80b3.xlsx',2,'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet'),('','2020-11-25 22:04:47','','2020-11-25 22:04:47',0,29,1,'LaborRate.xlsx','files\\ProjectProgramme\\2\\412da3a2.xlsx',2,'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet'),('','2020-11-25 22:05:43','','2020-11-25 22:05:43',0,30,1,'4K 1.jpg','files\\ProjectProgramme\\2\\1b5b7a9c.jpg',2,'image/jpeg'),('','2020-11-25 22:17:55','','2020-11-25 22:17:55',0,32,1,'housesample.png','files\\ProjectProgramme\\2\\eca715cb.png',2,'image/png'),('','2020-11-25 22:19:18','','2020-11-25 22:19:18',0,33,1,'IMG_6635.MOV','files\\ProjectProgramme\\4\\a109a36b5.MOV',4,'video/quicktime'),('','2020-11-26 19:57:58','','2020-11-26 19:57:58',0,36,1,'kUAMARAIAYABASS.txt','ProjectProgramme\\5\\kUAMARAIAYABASS.txt',5,'text/plain'),('','2020-11-26 20:33:35','','2020-11-26 20:33:35',0,37,1,'housesample.png','ProjectProgramme\\5\\housesample.png',5,'image/png'),('-','2020-12-07 22:08:15','-','2020-12-07 22:08:15',0,60,1,'ncc-dsn-db_project_status.sql','ProjectProgramme\\10\\8be90110c.sql',10,'application/octet-stream'),('-','2020-12-07 22:14:51','-','2020-12-07 22:14:51',0,62,2,'ncc-dsn-db_project_type.sql','Policy\\2\\cd077c77.sql',2,'application/octet-stream'),('-','2020-12-21 09:14:48','-','2020-12-21 09:14:48',0,69,2,'Screenshot (1) - Copy.png','Policy\\2\\a5325c78.png',2,'image/png'),('-','2020-12-28 13:41:09','-','2020-12-28 13:41:09',0,73,1,'i pad 1.png','ProjectProgramme\\1\\8cae992d.png',1,'image/png'),('-','2020-12-28 14:01:41','-','2020-12-28 14:01:41',0,74,2,'rpm.png','Policy\\3\\10dd5f4a3.png',3,'image/png'),('-','2020-12-28 14:01:53','-','2020-12-28 14:01:53',0,75,2,'rpm2.jpg','Policy\\4\\01daceb9.jpg',4,'image/jpeg'),('-','2020-12-31 19:09:45','-','2020-12-31 19:09:45',0,76,2,'i pad 1.png','Policy\\5\\ec761e7d.png',5,'image/png'),('-','2020-12-31 19:09:52','-','2020-12-31 19:09:52',0,77,2,'rpm2.jpg','Policy\\5\\57e4da20.jpg',5,'image/jpeg'),('-','2020-12-31 19:17:20','-','2020-12-31 19:17:20',0,78,4,'rpm.png','PolicyData\\4\\2281b102b.png',4,'image/png'),('-','2020-12-31 19:17:23','-','2020-12-31 19:17:23',0,79,4,'rpm2.jpg','PolicyData\\4\\185d1ef3.jpg',4,'image/jpeg'),('-','2020-12-31 19:42:30','-','2020-12-31 19:42:30',0,80,3,'rpm.png','ProjectProgramData\\4\\c53c22c5.png',4,'image/png'),('-','2020-12-31 19:42:33','-','2020-12-31 19:42:33',0,81,3,'rpm2.jpg','ProjectProgramData\\4\\32eb83bb.jpg',4,'image/jpeg'),('-','2020-12-31 19:43:45','-','2020-12-31 19:43:45',0,82,3,'rpm2.jpg','ProjectProgramData\\3\\10bd2d68.jpg',3,'image/jpeg'),('-','2020-12-31 19:48:49','-','2020-12-31 19:48:49',0,83,1,'rpm2.jpg','ProjectProgramme\\8\\f887a784.jpg',8,'image/jpeg'),('-','2021-01-02 19:44:56','-','2021-01-02 19:44:56',0,84,3,'i pad 1.png','ProjectProgramData\\5\\d22a9818.png',5,'image/png'),('-','2021-01-02 22:10:14','-','2021-01-02 22:10:14',0,85,4,'i pad 1.png','PolicyData\\1\\92f8b17b.png',1,'image/png'),('-','2021-01-02 22:11:40','-','2021-01-02 22:11:40',0,86,4,'header.png','PolicyData\\5\\e6e9119a.png',5,'image/png');
/*!40000 ALTER TABLE `documents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `financing_scheme`
--

DROP TABLE IF EXISTS `financing_scheme`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `financing_scheme` (
  `createdBy` varchar(255) NOT NULL,
  `createdOn` datetime NOT NULL,
  `editedBy` varchar(255) NOT NULL,
  `editedOn` datetime NOT NULL,
  `status` int NOT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `sortOrder` int NOT NULL,
  `description` varchar(2500) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `financing_scheme`
--

LOCK TABLES `financing_scheme` WRITE;
/*!40000 ALTER TABLE `financing_scheme` DISABLE KEYS */;
INSERT INTO `financing_scheme` VALUES (' ','2020-11-15 00:00:00',' ','2020-11-15 00:00:00',0,1,'Loan',1,''),(' ','2020-11-15 00:00:00',' ','2020-11-15 00:00:00',0,2,'Grant',2,'');
/*!40000 ALTER TABLE `financing_scheme` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `frequency`
--

DROP TABLE IF EXISTS `frequency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `frequency` (
  `createdBy` varchar(255) NOT NULL,
  `createdOn` datetime NOT NULL,
  `editedBy` varchar(255) NOT NULL,
  `editedOn` datetime NOT NULL,
  `status` int NOT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `sortOrder` int NOT NULL,
  `description` varchar(2500) NOT NULL,
  `deadlineId` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_77303480849f21abb3dff4e4ebf` (`deadlineId`),
  CONSTRAINT `FK_77303480849f21abb3dff4e4ebf` FOREIGN KEY (`deadlineId`) REFERENCES `deadline` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `frequency`
--

LOCK TABLES `frequency` WRITE;
/*!40000 ALTER TABLE `frequency` DISABLE KEYS */;
INSERT INTO `frequency` VALUES ('test','2020-11-15 00:00:00','test','2020-11-15 00:00:00',1,1,'Daily',1,'',1),('test','2020-11-15 00:00:00','test','2020-11-15 00:00:00',1,2,'Weekly',1,'',1),('test','2020-11-15 00:00:00','test','2020-11-15 00:00:00',1,3,'Monthly',1,'',1),('test','2020-11-15 00:00:00','test','2020-11-15 00:00:00',1,4,'Annualy',1,'',1),('test','2020-11-15 00:00:00','test','2020-11-15 00:00:00',1,5,'Quarterly',1,'',1),(' ','2020-11-15 00:00:00',' ','2020-11-15 00:00:00',1,6,'Biannual',1,'',1);
/*!40000 ALTER TABLE `frequency` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `frequency_detail`
--

DROP TABLE IF EXISTS `frequency_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `frequency_detail` (
  `createdBy` varchar(255) NOT NULL,
  `createdOn` datetime NOT NULL,
  `editedBy` varchar(255) NOT NULL,
  `editedOn` datetime NOT NULL,
  `status` int NOT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `sortOrder` int NOT NULL,
  `numberOfDate` int NOT NULL,
  `frequencyId` int DEFAULT NULL,
  `numberofMonth` int NOT NULL,
  `numberOfYear` int NOT NULL,
  `description` varchar(2500) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_87b2f7bf48ba3169fe857b372bc` (`frequencyId`),
  CONSTRAINT `FK_87b2f7bf48ba3169fe857b372bc` FOREIGN KEY (`frequencyId`) REFERENCES `frequency` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `frequency_detail`
--

LOCK TABLES `frequency_detail` WRITE;
/*!40000 ALTER TABLE `frequency_detail` DISABLE KEYS */;
INSERT INTO `frequency_detail` VALUES ('test','2020-11-15 00:00:00','test','2020-11-15 00:00:00',1,1,'1',1,1,1,0,0,''),('test','2020-11-15 00:00:00','test','2020-11-15 00:00:00',1,2,'Week',1,7,2,0,0,''),('test','2020-11-15 00:00:00','test','2020-11-15 00:00:00',1,3,'January',1,31,3,1,0,''),('test','2020-11-15 00:00:00','test','2020-11-15 00:00:00',1,4,'Febuary',1,28,3,1,0,''),('test','2020-11-15 00:00:00','test','2020-11-15 00:00:00',1,5,'March',1,31,3,1,0,''),('test','2020-11-15 00:00:00','test','2020-11-15 00:00:00',1,6,'Aprial',1,30,3,1,0,''),('test','2020-11-15 00:00:00','test','2020-11-15 00:00:00',1,7,'May',1,31,3,1,0,''),('test','2020-11-15 00:00:00','test','2020-11-15 00:00:00',1,8,'June',1,30,3,1,0,''),('test','2020-11-15 00:00:00','test','2020-11-15 00:00:00',1,9,'July',1,31,3,1,0,''),('test','2020-11-15 00:00:00','test','2020-11-15 00:00:00',1,10,'Augest',1,31,3,1,0,''),('test','2020-11-15 00:00:00','test','2020-11-15 00:00:00',1,11,'September',1,30,3,1,0,''),('test','2020-11-15 00:00:00','test','2020-11-15 00:00:00',1,12,'October',1,31,3,1,0,''),('test','2020-11-15 00:00:00','test','2020-11-15 00:00:00',1,13,'November',1,30,3,1,0,''),('test','2020-11-15 00:00:00','test','2020-11-15 00:00:00',1,14,'December',1,31,3,1,0,''),('test','2020-11-15 00:00:00','test','2020-11-15 00:00:00',1,15,'2',1,1,1,0,0,''),('test','2020-11-15 00:00:00','test','2020-11-15 00:00:00',1,16,'3',1,1,1,0,0,''),('test','2020-11-15 00:00:00','test','2020-11-15 00:00:00',1,17,'4',1,1,1,0,0,''),('test','2020-11-15 00:00:00','test','2020-11-15 00:00:00',1,18,'5',1,1,1,0,0,''),('test','2020-11-15 00:00:00','test','2020-11-15 00:00:00',1,19,'6',1,1,1,0,0,''),('test','2020-11-15 00:00:00','test','2020-11-15 00:00:00',1,20,'7',1,1,1,0,0,''),('test','2020-11-15 00:00:00','test','2020-11-15 00:00:00',1,21,'8',1,1,1,0,0,''),('test','2020-11-15 00:00:00','test','2020-11-15 00:00:00',1,22,'9',1,1,1,0,0,''),('test','2020-11-15 00:00:00','test','2020-11-15 00:00:00',1,23,'10',1,1,1,0,0,''),('test','2020-11-15 00:00:00','test','2020-11-15 00:00:00',1,24,'11',1,1,1,0,0,''),('test','2020-11-15 00:00:00','test','2020-11-15 00:00:00',1,25,'12',1,1,1,0,0,''),('test','2020-11-15 00:00:00','test','2020-11-15 00:00:00',1,26,'13',1,1,1,0,0,''),('test','2020-11-15 00:00:00','test','2020-11-15 00:00:00',1,27,'14',1,1,1,0,0,''),('test','2020-11-15 00:00:00','test','2020-11-15 00:00:00',1,28,'15',1,1,1,0,0,''),('test','2020-11-15 00:00:00','test','2020-11-15 00:00:00',1,29,'16',1,1,1,0,0,''),('test','2020-11-15 00:00:00','test','2020-11-15 00:00:00',1,30,'17',1,1,1,0,0,''),('test','2020-11-15 00:00:00','test','2020-11-15 00:00:00',1,31,'18',1,1,1,0,0,''),('test','2020-11-15 00:00:00','test','2020-11-15 00:00:00',1,32,'19',1,1,1,0,0,''),('test','2020-11-15 00:00:00','test','2020-11-15 00:00:00',1,33,'20',1,1,1,0,0,''),('test','2020-11-15 00:00:00','test','2020-11-15 00:00:00',1,34,'21',1,1,1,0,0,''),('test','2020-11-15 00:00:00','test','2020-11-15 00:00:00',1,35,'22',1,1,1,0,0,''),('test','2020-11-15 00:00:00','test','2020-11-15 00:00:00',1,36,'23',1,1,1,0,0,''),('test','2020-11-15 00:00:00','test','2020-11-15 00:00:00',1,37,'24',1,1,1,0,0,''),('test','2020-11-15 00:00:00','test','2020-11-15 00:00:00',1,38,'25',1,1,1,0,0,''),('test','2020-11-15 00:00:00','test','2020-11-15 00:00:00',1,39,'26',1,1,1,0,0,''),('test','2020-11-15 00:00:00','test','2020-11-15 00:00:00',1,40,'27',1,1,1,0,0,''),('test','2020-11-15 00:00:00','test','2020-11-15 00:00:00',1,41,'28',1,1,1,0,0,''),('test','2020-11-15 00:00:00','test','2020-11-15 00:00:00',1,42,'29',1,1,1,0,0,''),('test','2020-11-15 00:00:00','test','2020-11-15 00:00:00',1,43,'30',1,1,1,0,0,''),('test','2020-11-15 00:00:00','test','2020-11-15 00:00:00',1,44,'31',1,1,1,0,0,''),('test','2020-11-15 00:00:00','test','2020-11-15 00:00:00',1,45,'2020',1,360,4,0,0,''),('test','2020-11-15 00:00:00','test','2020-11-15 00:00:00',1,46,'2021',1,360,4,0,0,''),('test','2020-11-15 00:00:00','test','2020-11-15 00:00:00',1,47,'1 st Quarter',1,180,5,0,0,''),('test','2020-11-15 00:00:00','test','2020-11-15 00:00:00',1,48,'2 nd Quarter',1,180,5,0,0,'');
/*!40000 ALTER TABLE `frequency_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hierarchy`
--

DROP TABLE IF EXISTS `hierarchy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hierarchy` (
  `createdBy` varchar(255) NOT NULL,
  `createdOn` datetime NOT NULL,
  `editedBy` varchar(255) NOT NULL,
  `editedOn` datetime NOT NULL,
  `status` int NOT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(2500) NOT NULL,
  `sortOrder` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hierarchy`
--

LOCK TABLES `hierarchy` WRITE;
/*!40000 ALTER TABLE `hierarchy` DISABLE KEYS */;
INSERT INTO `hierarchy` VALUES (' ','2020-12-11 23:29:13',' ','2020-12-11 23:29:13',1,1,'National','National',1),(' ','2020-12-11 23:29:13',' ','2020-12-11 23:29:13',1,2,'Provincial','Provincial',1),(' ','2020-12-11 23:29:13',' ','2020-12-11 23:29:13',1,3,'District level','District level',1),(' ','2020-12-11 23:29:13',' ','2020-12-11 23:29:13',1,4,'Divisional Secretariat level','Divisional Secretariat level',1);
/*!40000 ALTER TABLE `hierarchy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `institution`
--

DROP TABLE IF EXISTS `institution`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `institution` (
  `createdBy` varchar(255) NOT NULL,
  `createdOn` datetime NOT NULL,
  `editedBy` varchar(255) NOT NULL,
  `editedOn` datetime NOT NULL,
  `status` int NOT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `sortOrder` int NOT NULL,
  `categoryId` int DEFAULT NULL,
  `provinceId` int DEFAULT NULL,
  `districtId` int DEFAULT NULL,
  `divisionalSecretariatId` int DEFAULT NULL,
  `parentInstitutionId` int DEFAULT NULL,
  `isNational` tinyint NOT NULL,
  `typeId` int DEFAULT NULL,
  `description` varchar(2500) NOT NULL,
  `hierarchyId` int DEFAULT NULL,
  `deletedAt` datetime(6) DEFAULT NULL,
  `canNotDelete` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `IDX_d218ad3566afa9e396f184fd7d` (`name`),
  KEY `FK_624b822b4a45197c6f0b88051bc` (`categoryId`),
  KEY `FK_3a8f2259e033ac457dee8b8a3ec` (`provinceId`),
  KEY `FK_354629b256d0b036bbddb67278e` (`districtId`),
  KEY `FK_f09f60c0ceb33b7c7af38eacecb` (`divisionalSecretariatId`),
  KEY `FK_3ca64cf0f964345e07b4c469bbe` (`parentInstitutionId`),
  KEY `FK_4893e540d687978250eb88fa2dc` (`typeId`),
  KEY `FK_3fe9d6b9395aec36ea9b417b8fe` (`hierarchyId`),
  CONSTRAINT `FK_354629b256d0b036bbddb67278e` FOREIGN KEY (`districtId`) REFERENCES `district` (`id`),
  CONSTRAINT `FK_3a8f2259e033ac457dee8b8a3ec` FOREIGN KEY (`provinceId`) REFERENCES `province` (`id`),
  CONSTRAINT `FK_3ca64cf0f964345e07b4c469bbe` FOREIGN KEY (`parentInstitutionId`) REFERENCES `institution` (`id`),
  CONSTRAINT `FK_3fe9d6b9395aec36ea9b417b8fe` FOREIGN KEY (`hierarchyId`) REFERENCES `hierarchy` (`id`),
  CONSTRAINT `FK_4893e540d687978250eb88fa2dc` FOREIGN KEY (`typeId`) REFERENCES `institution_type` (`id`),
  CONSTRAINT `FK_624b822b4a45197c6f0b88051bc` FOREIGN KEY (`categoryId`) REFERENCES `institution_category` (`id`),
  CONSTRAINT `FK_f09f60c0ceb33b7c7af38eacecb` FOREIGN KEY (`divisionalSecretariatId`) REFERENCES `divisional_secretariat` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `institution`
--

LOCK TABLES `institution` WRITE;
/*!40000 ALTER TABLE `institution` DISABLE KEYS */;
INSERT INTO `institution` VALUES ('','2020-11-08 17:52:42','','2020-11-08 17:52:42',0,1,'Ministry of Energy',1,1,9,23,NULL,NULL,0,1,'Ministry of Energy.',1,NULL,0),('','2020-12-13 00:38:21','','2020-12-13 00:38:21',0,2,'Ministry of health',1,1,2,23,NULL,1,0,1,'Ministry of health',2,NULL,1),('','2020-11-08 17:47:56','','2020-11-08 17:47:56',0,3,'Sri Lanka Railways',0,3,NULL,23,NULL,NULL,0,1,'aaa',3,NULL,0),('-','2020-12-07 20:24:50','-','2020-12-07 20:24:50',0,13,'test Mithun',0,1,1,1,165,1,0,1,'',NULL,'2021-01-09 00:02:09.000000',0),('-','2020-12-11 19:59:22','-','2020-12-11 19:59:22',0,14,'Ministry of Inovation',0,3,1,4,165,19,0,2,'Ministry of inovation.',3,NULL,0),('-','2021-01-06 16:29:57','-','2021-01-06 16:29:57',0,17,'1200gg',0,3,NULL,NULL,NULL,3,0,1,'bbbbbbbb',1,NULL,0),('-','2021-01-08 23:49:36','-','2021-01-08 23:49:36',0,18,'test ins 2101081',0,3,NULL,4,NULL,13,0,1,'as\nssss',3,'2021-01-08 23:56:21.000000',0),('-','2021-01-09 00:01:55','-','2021-01-09 00:01:55',0,19,'Ministry of Energy2',0,3,NULL,4,NULL,13,0,1,'ministring ee',3,NULL,0),('-','2021-01-09 00:02:47','-','2021-01-09 00:02:47',0,20,'TI 1',0,3,NULL,4,NULL,14,0,1,'aa',3,'2021-01-09 00:03:18.000000',0),('-','2021-01-09 00:03:10','-','2021-01-09 00:03:10',0,21,'TI 11',0,3,NULL,4,NULL,1,0,1,'ggaa',3,NULL,0),('-','2021-01-09 00:06:59','-','2021-01-09 00:06:59',0,22,'TI 2',0,3,NULL,NULL,NULL,21,0,1,'ti2',1,'2021-01-09 00:12:12.000000',0),('-','2021-01-09 00:08:45','-','2021-01-09 00:08:45',0,23,'T3',0,2,NULL,4,NULL,22,0,2,'aaa',3,NULL,0),('-','2021-01-09 19:06:06','-','2021-01-09 19:06:06',0,25,'sdkafj;a',0,3,NULL,4,NULL,1,0,1,';lksadk;lka',3,NULL,0),('-','2021-01-14 11:30:42','-','2021-01-14 11:30:42',0,26,'ins 123',0,3,NULL,4,NULL,17,0,1,'sss',3,NULL,0);
/*!40000 ALTER TABLE `institution` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `institution_category`
--

DROP TABLE IF EXISTS `institution_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `institution_category` (
  `createdBy` varchar(255) NOT NULL,
  `createdOn` datetime NOT NULL,
  `editedBy` varchar(255) NOT NULL,
  `editedOn` datetime NOT NULL,
  `status` int NOT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `sortOrder` int NOT NULL,
  `description` varchar(2500) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `institution_category`
--

LOCK TABLES `institution_category` WRITE;
/*!40000 ALTER TABLE `institution_category` DISABLE KEYS */;
INSERT INTO `institution_category` VALUES ('','0000-00-00 00:00:00','','0000-00-00 00:00:00',0,1,'Semi-Givernment',2,''),('','0000-00-00 00:00:00','','0000-00-00 00:00:00',0,2,'Private',2,''),('','0000-00-00 00:00:00','','0000-00-00 00:00:00',0,3,'Government',1,'');
/*!40000 ALTER TABLE `institution_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `institution_type`
--

DROP TABLE IF EXISTS `institution_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `institution_type` (
  `createdBy` varchar(255) NOT NULL,
  `createdOn` datetime NOT NULL,
  `editedBy` varchar(255) NOT NULL,
  `editedOn` datetime NOT NULL,
  `status` int NOT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `sortOrder` int NOT NULL,
  `description` varchar(2500) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `institution_type`
--

LOCK TABLES `institution_type` WRITE;
/*!40000 ALTER TABLE `institution_type` DISABLE KEYS */;
INSERT INTO `institution_type` VALUES (' ','2020-11-01 00:00:00',' ','2020-11-01 00:00:00',0,1,'Data Provider',1,''),(' ','2020-11-01 00:00:00',' ','2020-11-01 00:00:00',0,2,'Management',2,''),(' ','2020-11-01 00:00:00',' ','2020-11-01 00:00:00',0,3,'Verifiers',3,''),(' ','2020-11-01 00:00:00',' ','2020-11-01 00:00:00',0,4,'Other',4,'');
/*!40000 ALTER TABLE `institution_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mitigation`
--

DROP TABLE IF EXISTS `mitigation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mitigation` (
  `createdBy` varchar(255) NOT NULL,
  `createdOn` datetime NOT NULL,
  `editedBy` varchar(255) NOT NULL,
  `editedOn` datetime NOT NULL,
  `status` int NOT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(2500) NOT NULL,
  `sortOrder` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mitigation`
--

LOCK TABLES `mitigation` WRITE;
/*!40000 ALTER TABLE `mitigation` DISABLE KEYS */;
/*!40000 ALTER TABLE `mitigation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `parameter`
--

DROP TABLE IF EXISTS `parameter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `parameter` (
  `createdBy` varchar(255) NOT NULL,
  `createdOn` datetime NOT NULL,
  `editedBy` varchar(255) NOT NULL,
  `editedOn` datetime NOT NULL,
  `status` int NOT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `sampleParamterReading` varchar(255) NOT NULL,
  `isProject` tinyint NOT NULL,
  `isProgramme` tinyint NOT NULL,
  `isPolicy` tinyint NOT NULL,
  `isOther` tinyint NOT NULL,
  `dataCollectionLocation` int NOT NULL,
  `dataCollectionGeography` int NOT NULL,
  `unitOfMeasureId` int DEFAULT NULL,
  `climateChangeDataCategoryId` int DEFAULT NULL,
  `sectorId` int DEFAULT NULL,
  `subSectorId` int DEFAULT NULL,
  `projectId` int DEFAULT NULL,
  `programmeId` int DEFAULT NULL,
  `policyId` int DEFAULT NULL,
  `isPublicData` tinyint DEFAULT NULL,
  `commercialValue` int NOT NULL,
  `institutionId` int DEFAULT NULL,
  `frequencyId` int DEFAULT NULL,
  `description` varchar(2500) NOT NULL,
  `minSampleValue` varchar(255) DEFAULT NULL,
  `maxSampleValue` varchar(255) DEFAULT NULL,
  `deadlineId` int DEFAULT NULL,
  `climateImpactId` int DEFAULT NULL,
  `deletedAt` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_57a80e11bc6a43e88b4f5f4dcc9` (`unitOfMeasureId`),
  KEY `FK_1391fff8fea9487096f3c512808` (`climateChangeDataCategoryId`),
  KEY `FK_4057f643789f15dbd9da9f0cadc` (`sectorId`),
  KEY `FK_0422162f35e8064ddfb7f69bd9f` (`subSectorId`),
  KEY `FK_8fff0a2eb983724ffb592d8888b` (`projectId`),
  KEY `FK_f4e83ae9a7f891c3a1855b13d10` (`programmeId`),
  KEY `FK_bbe8b48742e91d15a8dc81c72bb` (`policyId`),
  KEY `FK_c584a0d5a74c7cfb5bcc3ecf9f0` (`institutionId`),
  KEY `FK_97bfa5a1ec6a518ab85fcc48ecb` (`frequencyId`),
  KEY `FK_9854d4f137bb4a60c0bdabebd9e` (`deadlineId`),
  KEY `FK_6013016daf1af2c037427714c45` (`climateImpactId`),
  CONSTRAINT `FK_0422162f35e8064ddfb7f69bd9f` FOREIGN KEY (`subSectorId`) REFERENCES `sub_sector` (`id`),
  CONSTRAINT `FK_1391fff8fea9487096f3c512808` FOREIGN KEY (`climateChangeDataCategoryId`) REFERENCES `climate_change_data_category` (`id`),
  CONSTRAINT `FK_4057f643789f15dbd9da9f0cadc` FOREIGN KEY (`sectorId`) REFERENCES `sector` (`id`),
  CONSTRAINT `FK_57a80e11bc6a43e88b4f5f4dcc9` FOREIGN KEY (`unitOfMeasureId`) REFERENCES `unit_of_measure` (`id`),
  CONSTRAINT `FK_6013016daf1af2c037427714c45` FOREIGN KEY (`climateImpactId`) REFERENCES `climate_impact` (`id`),
  CONSTRAINT `FK_8fff0a2eb983724ffb592d8888b` FOREIGN KEY (`projectId`) REFERENCES `project_programme` (`id`),
  CONSTRAINT `FK_97bfa5a1ec6a518ab85fcc48ecb` FOREIGN KEY (`frequencyId`) REFERENCES `frequency` (`id`),
  CONSTRAINT `FK_9854d4f137bb4a60c0bdabebd9e` FOREIGN KEY (`deadlineId`) REFERENCES `deadline` (`id`),
  CONSTRAINT `FK_bbe8b48742e91d15a8dc81c72bb` FOREIGN KEY (`policyId`) REFERENCES `policy` (`id`),
  CONSTRAINT `FK_c584a0d5a74c7cfb5bcc3ecf9f0` FOREIGN KEY (`institutionId`) REFERENCES `institution` (`id`),
  CONSTRAINT `FK_f4e83ae9a7f891c3a1855b13d10` FOREIGN KEY (`programmeId`) REFERENCES `project_programme` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parameter`
--

LOCK TABLES `parameter` WRITE;
/*!40000 ALTER TABLE `parameter` DISABLE KEYS */;
INSERT INTO `parameter` VALUES ('','2025-11-18 02:37:50','','2020-11-18 02:37:50',0,1,'Parameter 1','1200g',1,1,1,0,3,4,2,4,1,1,1,2,1,0,50,1,4,'aaa','','',NULL,1,'2021-01-10 08:52:30.000000'),('','2020-11-18 02:40:05','','2020-11-18 02:40:05',0,2,'Parameter 2','1kb',1,1,1,0,2,2,2,3,1,1,1,1,1,0,100,NULL,4,'','','',NULL,NULL,'2021-01-10 08:53:14.000000'),('','2020-11-18 02:37:50','','2020-11-18 02:37:50',0,3,'Parameter 3','1200g',1,1,1,0,2,2,2,4,1,1,1,1,1,0,10,NULL,3,'','','',NULL,NULL,'2021-01-10 09:02:48.000000'),('','2020-11-18 02:40:05','','2020-11-18 02:40:05',0,4,'Parameter 4','1kb',1,1,1,0,2,2,2,3,1,1,1,1,1,1,0,NULL,4,'','','',NULL,NULL,NULL),('','2020-11-18 02:37:50','','2020-11-18 02:37:50',0,5,'Parameter 5','1200g',1,1,1,0,2,2,2,4,1,1,1,1,1,0,60,NULL,4,'','','',NULL,NULL,NULL),('','2020-11-18 02:40:05','','2020-11-18 02:40:05',0,6,'Parameter 6','1kb',1,1,1,0,2,2,2,3,1,1,1,1,1,0,1000,NULL,3,'','','',NULL,NULL,NULL),('','2020-11-18 02:37:50','','2020-11-18 02:37:50',0,7,'Parameter 7','1200g',1,1,1,0,2,2,2,4,1,1,1,1,1,0,250,NULL,3,'','','',NULL,NULL,NULL),('','2020-11-18 02:40:05','','2020-11-18 02:40:05',0,8,'Parameter 8','1kb',1,1,1,0,2,2,2,3,1,1,1,1,1,0,10,NULL,4,'','','',NULL,NULL,NULL),('-','2020-12-07 21:17:49','-','2020-12-07 21:17:49',0,13,'test mithun','123',1,1,1,0,3,2,2,3,1,NULL,8,1,1,1,0,NULL,4,'test','12','1234',NULL,NULL,NULL),('-','2020-12-11 20:26:22','-','2020-12-11 20:26:22',0,14,'Total Electricity Distribution Loss ','100 GWh',0,0,0,0,3,2,3,2,1,NULL,NULL,NULL,NULL,1,0,NULL,3,'Description Total Electricity Distribution Loss \n\nTotal Electricity Distribution Loss detail','','',NULL,1,NULL),('-','2020-12-11 20:36:53','-','2020-12-11 20:36:53',0,15,'Oil and Grease in Wastewater ','100',0,0,0,0,3,2,4,2,1,NULL,NULL,NULL,NULL,1,0,NULL,3,'Oil and Grease in Wastewater ','','',NULL,NULL,NULL),('-','2020-12-12 22:46:06','-','2020-12-12 22:46:06',0,16,'P1111111111','1200g',0,0,0,0,3,1,5,3,1,NULL,NULL,NULL,NULL,1,0,NULL,6,'aaaaaaaaaaaaaaa','','',NULL,NULL,'2021-01-10 08:47:39.000000'),('-','2020-12-18 12:45:30','-','2020-12-18 12:45:30',0,18,'P1','Rohan Map',0,0,0,0,3,1,5,3,1,NULL,NULL,NULL,NULL,1,0,NULL,4,'P1','10','1000',1,1,NULL),('-','2020-12-21 09:09:24','-','2020-12-21 09:09:24',0,19,'test 1','',0,0,0,0,3,1,2,3,1,NULL,NULL,NULL,NULL,1,0,NULL,6,'Test 111','0','0',1,1,'2021-01-07 06:03:57.000000'),('-','2020-12-25 07:57:06','-','2020-12-25 07:57:06',0,20,'P11111','Rohan Map',0,0,0,0,3,1,5,3,1,NULL,NULL,NULL,NULL,1,0,NULL,4,'aaaaaaaaa','Rohan Map','Rohan Map',1,1,'2021-01-09 12:07:35.000000'),('-','2020-12-25 21:02:56','-','2020-12-25 21:02:56',0,21,'a','Rohan Map',0,0,0,0,3,1,5,3,1,NULL,NULL,NULL,NULL,1,0,NULL,4,'a','Rohan Map','Rohan Map',1,1,'2021-01-09 11:51:34.000000'),('-','2020-12-27 11:06:18','-','2020-12-27 11:06:18',0,22,'P1111111111111','10',0,0,0,0,3,2,2,3,2,NULL,NULL,NULL,NULL,1,0,NULL,3,'2222222222222222','100000000000000','10000000000000000000',3,1,'2021-01-10 08:49:00.000000'),('-','2021-01-02 13:34:57','-','2021-01-02 13:34:57',0,25,'p11111111 p11111111 p11111111 p11111111 p11111111 p11111111','10',0,0,0,0,3,2,1,3,1,NULL,NULL,NULL,NULL,1,0,NULL,4,'p1111111111 p11111111 p11111111 p11111111 p11111111 p11111111 p11111111p11111111p11111111p11111111p11111111','10','100000',1,1,'2021-01-10 08:27:41.000000'),('-','2021-01-03 23:49:35','-','2021-01-03 23:49:35',0,26,'p77','11',0,0,0,0,3,1,2,3,1,NULL,NULL,NULL,NULL,1,0,NULL,4,'p77',NULL,NULL,1,1,NULL),('-','2021-01-08 11:00:13','-','2021-01-08 11:00:13',0,27,'p231222 sdjfda  ;sjdkljsa;  sdklsakd','100',0,0,0,0,3,1,2,3,1,NULL,NULL,NULL,NULL,1,0,NULL,4,'kdsjlsd;;a','100','1000000',1,1,NULL),('-','2021-01-09 04:46:38','-','2021-01-09 04:46:38',0,28,'test','10',0,0,0,0,3,1,2,3,1,NULL,NULL,NULL,NULL,0,0,NULL,4,'aaaaa','1000','10000',1,1,NULL),('-','2021-01-09 04:47:27','-','2021-01-09 04:47:27',0,29,'test rohan','10',0,0,0,0,3,1,1,3,1,NULL,NULL,NULL,NULL,1,0,NULL,5,'kasla','100','1000',1,1,NULL),('-','2021-01-09 09:48:09','-','2021-01-09 09:48:09',0,30,'Test param','10',0,0,0,0,3,3,2,3,1,NULL,NULL,NULL,NULL,1,0,NULL,4,'j;fj;a','1000','10000',1,1,NULL),('-','2021-01-10 07:41:14','-','2021-01-10 07:41:14',0,36,'p111','1',0,0,0,0,3,1,2,3,1,NULL,NULL,NULL,NULL,0,0,NULL,4,'sad;lsa;l',NULL,NULL,1,1,NULL),('-','2021-01-10 08:59:43','-','2021-01-10 08:59:43',0,37,'test123','10.111',0,0,0,0,3,1,2,3,1,NULL,NULL,NULL,NULL,1,0,NULL,4,'skdkjsk',NULL,NULL,1,1,NULL),('-','2021-01-10 09:18:07','-','2021-01-10 09:18:07',0,38,'test 123','10',0,0,0,0,3,2,5,3,1,NULL,NULL,NULL,NULL,0,0,NULL,4,'tetess',NULL,NULL,1,1,NULL),('-','2021-01-10 10:32:20','-','2021-01-10 10:32:20',0,39,'Test 222','1',0,0,0,0,3,1,2,3,1,NULL,NULL,NULL,NULL,1,0,NULL,4,'Test',NULL,NULL,1,1,NULL),('-','2021-01-10 12:24:38','-','2021-01-10 12:24:38',0,40,'abc aaaaaaaaaa','10',0,0,0,0,3,1,2,3,1,NULL,NULL,NULL,NULL,0,10,NULL,4,'jsjsdk',NULL,NULL,1,1,NULL),('-','2021-01-11 12:18:30','-','2021-01-11 12:18:30',0,41,'asfasaaaaaaaaaaaaaaaaaa','10000',0,0,0,0,3,1,2,3,1,NULL,NULL,NULL,NULL,1,0,NULL,4,'asda','1000','11111',1,2,NULL),('-','2021-01-11 12:18:30','-','2021-01-11 12:18:30',0,42,'asfas','10000',0,0,0,0,3,1,2,3,1,NULL,NULL,NULL,NULL,1,0,NULL,4,'asda','1000','11111',1,1,NULL),('-','2021-01-11 12:42:42','-','2021-01-11 12:42:42',0,43,'kdkdkdk','10',0,0,0,0,3,1,5,3,1,NULL,NULL,NULL,NULL,1,0,NULL,4,'kdkdkdkd','1','1000',1,1,NULL),('-','2021-01-11 12:43:35','-','2021-01-11 12:43:35',0,44,'naaajdjd','1',0,0,0,0,3,2,5,3,1,NULL,NULL,NULL,NULL,1,0,NULL,4,'nsdjskjkjds','11','1111',1,1,NULL),('-','2021-01-11 12:58:30','-','2021-01-11 12:58:30',0,45,'gagagag','200',0,0,0,0,3,1,2,3,1,NULL,NULL,NULL,NULL,1,0,NULL,4,'sdkkdjkds','20','1000',1,1,NULL),('-','2021-01-11 13:11:28','-','2021-01-11 13:11:28',0,46,'ksldf;lksajfla','10',0,0,0,0,3,1,2,3,1,NULL,NULL,NULL,NULL,1,0,NULL,4,'aaaassss',NULL,NULL,1,NULL,NULL),('-','2021-01-11 15:58:10','-','2021-01-11 15:58:10',0,47,'Test 2101111','10',0,0,0,0,3,1,3,3,1,NULL,NULL,NULL,NULL,1,0,NULL,4,'Test d','0','100',1,NULL,NULL),('-','2021-01-12 05:42:03','-','2021-01-12 05:42:03',0,48,'LVB 1','10',0,0,0,0,3,5,3,3,1,NULL,NULL,NULL,NULL,1,0,NULL,4,'ldsas','0','80',1,1,NULL),('-','2021-01-17 19:20:54','-','2021-01-17 19:20:54',0,49,'adsada','1000',0,0,0,0,3,1,5,3,1,NULL,NULL,NULL,NULL,NULL,0,NULL,4,'adads','100','10000',1,1,NULL);
/*!40000 ALTER TABLE `parameter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `parameter_location`
--

DROP TABLE IF EXISTS `parameter_location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `parameter_location` (
  `createdBy` varchar(255) NOT NULL,
  `createdOn` datetime NOT NULL,
  `editedBy` varchar(255) NOT NULL,
  `editedOn` datetime NOT NULL,
  `status` int NOT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  `isNational` tinyint NOT NULL,
  `parameterId` int DEFAULT NULL,
  `provinceId` int DEFAULT NULL,
  `districtId` int DEFAULT NULL,
  `divisionalSecretariatId` int DEFAULT NULL,
  `dataSourceId` int DEFAULT NULL,
  `isSpecificLocation` tinyint NOT NULL,
  `deletedAt` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_137c1647b9bddafbd4b17b09136` (`provinceId`),
  KEY `FK_9e4e11f2a24125584ee6c7012d0` (`districtId`),
  KEY `FK_63e438fde645f4f8b932d355c99` (`divisionalSecretariatId`),
  KEY `FK_94e1a6da183c124072a5bf80933` (`dataSourceId`),
  KEY `FK_af8cbc4967664c625d2289a9efe` (`parameterId`),
  CONSTRAINT `FK_137c1647b9bddafbd4b17b09136` FOREIGN KEY (`provinceId`) REFERENCES `province` (`id`),
  CONSTRAINT `FK_63e438fde645f4f8b932d355c99` FOREIGN KEY (`divisionalSecretariatId`) REFERENCES `divisional_secretariat` (`id`),
  CONSTRAINT `FK_94e1a6da183c124072a5bf80933` FOREIGN KEY (`dataSourceId`) REFERENCES `institution` (`id`),
  CONSTRAINT `FK_9e4e11f2a24125584ee6c7012d0` FOREIGN KEY (`districtId`) REFERENCES `district` (`id`),
  CONSTRAINT `FK_af8cbc4967664c625d2289a9efe` FOREIGN KEY (`parameterId`) REFERENCES `parameter` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=197 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parameter_location`
--

LOCK TABLES `parameter_location` WRITE;
/*!40000 ALTER TABLE `parameter_location` DISABLE KEYS */;
INSERT INTO `parameter_location` VALUES ('test','2020-11-15 00:00:00','test','2020-11-15 00:00:00',1,1,1,1,1,1,1,1,0,'2021-01-10 08:52:30.000000'),('test','2020-11-15 00:00:00','test','2020-11-15 00:00:00',1,2,1,2,2,1,1,2,0,'2021-01-10 08:53:14.000000'),('test','2020-11-15 00:00:00','test','2020-11-15 00:00:00',1,3,1,3,3,1,1,3,0,'2021-01-10 09:02:48.000000'),('test','2020-11-15 00:00:00','test','2020-11-15 00:00:00',1,4,1,4,NULL,NULL,NULL,3,0,NULL),('-','2020-12-07 21:18:13','-','2020-12-07 21:18:13',0,5,0,13,1,NULL,NULL,2,0,NULL),('-','2020-12-11 20:26:38','-','2020-12-11 20:26:38',0,6,0,14,1,NULL,NULL,1,0,NULL),('-','2020-12-11 20:26:38','-','2020-12-11 20:26:38',0,7,0,14,2,NULL,NULL,1,0,NULL),('-','2020-12-11 20:26:38','-','2020-12-11 20:26:38',0,8,0,14,3,NULL,NULL,1,0,NULL),('-','2020-12-11 20:26:38','-','2020-12-11 20:26:38',0,9,0,14,5,NULL,NULL,1,0,NULL),('-','2020-12-11 20:26:38','-','2020-12-11 20:26:38',0,10,0,14,4,NULL,NULL,1,0,NULL),('-','2020-12-11 20:26:38','-','2020-12-11 20:26:38',0,11,0,14,6,NULL,NULL,1,0,NULL),('-','2020-12-11 20:26:38','-','2020-12-11 20:26:38',0,12,0,14,7,NULL,NULL,1,0,NULL),('-','2020-12-11 20:26:38','-','2020-12-11 20:26:38',0,13,0,14,8,NULL,NULL,1,0,NULL),('-','2020-12-11 20:26:38','-','2020-12-11 20:26:38',0,14,0,14,9,NULL,NULL,NULL,0,NULL),('-','2020-12-11 20:37:04','-','2020-12-11 20:37:04',0,15,0,15,1,NULL,NULL,3,0,NULL),('-','2020-12-11 20:37:04','-','2020-12-11 20:37:04',0,16,0,15,2,NULL,NULL,3,0,NULL),('-','2020-12-11 20:37:04','-','2020-12-11 20:37:04',0,17,0,15,3,NULL,NULL,3,0,'2021-01-11 12:16:05.000000'),('-','2020-12-11 20:37:04','-','2020-12-11 20:37:04',0,18,0,15,5,NULL,NULL,NULL,0,'2021-01-11 12:16:05.000000'),('-','2020-12-11 20:37:04','-','2020-12-11 20:37:04',0,19,0,15,4,NULL,NULL,3,0,'2021-01-11 12:16:05.000000'),('-','2020-12-11 20:37:04','-','2020-12-11 20:37:04',0,20,0,15,6,NULL,NULL,NULL,0,'2021-01-11 12:16:05.000000'),('-','2020-12-11 20:37:04','-','2020-12-11 20:37:04',0,21,0,15,7,NULL,NULL,NULL,0,'2021-01-11 12:16:05.000000'),('-','2020-12-11 20:37:04','-','2020-12-11 20:37:04',0,22,0,15,8,NULL,NULL,NULL,0,'2021-01-11 12:16:05.000000'),('-','2020-12-11 20:37:04','-','2020-12-11 20:37:04',0,23,0,15,9,NULL,NULL,NULL,0,'2021-01-11 12:16:05.000000'),('-','2020-12-12 22:53:34','-','2020-12-12 22:53:34',0,24,1,16,NULL,NULL,NULL,1,0,'2021-01-10 08:47:39.000000'),('-','2020-12-15 12:44:06','-','2020-12-15 12:44:06',0,25,0,1,NULL,NULL,1,NULL,0,'2021-01-10 08:52:30.000000'),('-','2020-12-15 12:45:39','-','2020-12-15 12:45:39',0,26,0,1,NULL,NULL,1,NULL,0,'2021-01-10 08:52:30.000000'),('-','2020-12-15 12:45:39','-','2020-12-15 12:45:39',0,27,0,1,NULL,NULL,1,NULL,0,'2021-01-10 08:52:30.000000'),('-','2020-12-21 09:48:16','-','2020-12-21 09:48:16',0,28,0,2,1,NULL,NULL,NULL,0,'2021-01-10 08:53:14.000000'),('-','2020-12-21 09:48:16','-','2020-12-21 09:48:16',0,29,0,2,2,NULL,NULL,NULL,0,'2021-01-10 08:53:14.000000'),('-','2020-12-21 09:48:16','-','2020-12-21 09:48:16',0,30,0,2,3,NULL,NULL,NULL,0,'2021-01-10 08:53:14.000000'),('-','2020-12-21 09:48:16','-','2020-12-21 09:48:16',0,31,0,2,5,NULL,NULL,NULL,0,'2021-01-10 08:53:14.000000'),('-','2020-12-21 09:48:16','-','2020-12-21 09:48:16',0,32,0,2,4,NULL,NULL,NULL,0,'2021-01-10 08:53:14.000000'),('-','2020-12-21 09:48:16','-','2020-12-21 09:48:16',0,33,0,2,6,NULL,NULL,NULL,0,'2021-01-10 08:53:14.000000'),('-','2020-12-21 09:48:16','-','2020-12-21 09:48:16',0,34,0,2,7,NULL,NULL,NULL,0,'2021-01-10 08:53:14.000000'),('-','2020-12-21 09:48:16','-','2020-12-21 09:48:16',0,35,0,2,8,NULL,NULL,NULL,0,'2021-01-10 08:53:14.000000'),('-','2020-12-21 09:48:16','-','2020-12-21 09:48:16',0,36,0,2,9,NULL,NULL,NULL,0,'2021-01-10 08:53:14.000000'),('-','2020-12-22 09:46:22','-','2020-12-22 09:46:22',0,37,0,2,1,NULL,NULL,NULL,0,'2021-01-10 08:53:14.000000'),('-','2020-12-22 09:46:22','-','2020-12-22 09:46:22',0,38,0,2,2,NULL,NULL,NULL,0,'2021-01-10 08:53:14.000000'),('-','2020-12-22 09:46:22','-','2020-12-22 09:46:22',0,39,0,2,3,NULL,NULL,NULL,0,'2021-01-10 08:53:14.000000'),('-','2020-12-22 09:46:22','-','2020-12-22 09:46:22',0,40,0,2,5,NULL,NULL,NULL,0,'2021-01-10 08:53:14.000000'),('-','2020-12-22 09:46:22','-','2020-12-22 09:46:22',0,41,0,2,4,NULL,NULL,NULL,0,'2021-01-10 08:53:14.000000'),('-','2020-12-22 09:46:22','-','2020-12-22 09:46:22',0,42,0,2,6,NULL,NULL,NULL,0,'2021-01-10 08:53:14.000000'),('-','2020-12-22 09:46:22','-','2020-12-22 09:46:22',0,43,0,2,7,NULL,NULL,NULL,0,'2021-01-10 08:53:14.000000'),('-','2020-12-22 09:46:22','-','2020-12-22 09:46:22',0,44,0,2,8,NULL,NULL,NULL,0,'2021-01-10 08:53:14.000000'),('-','2020-12-22 09:46:22','-','2020-12-22 09:46:22',0,45,0,2,9,NULL,NULL,NULL,0,'2021-01-10 08:53:14.000000'),('-','2020-12-22 09:47:27','-','2020-12-22 09:47:27',0,46,0,2,1,NULL,NULL,NULL,0,'2021-01-10 08:53:14.000000'),('-','2020-12-22 09:47:27','-','2020-12-22 09:47:27',0,47,0,2,2,NULL,NULL,NULL,0,'2021-01-10 08:53:14.000000'),('-','2020-12-22 09:47:27','-','2020-12-22 09:47:27',0,48,0,2,3,NULL,NULL,NULL,0,'2021-01-10 08:53:14.000000'),('-','2020-12-22 09:47:27','-','2020-12-22 09:47:27',0,49,0,2,5,NULL,NULL,NULL,0,'2021-01-10 08:53:14.000000'),('-','2020-12-22 09:47:27','-','2020-12-22 09:47:27',0,50,0,2,4,NULL,NULL,NULL,0,'2021-01-10 08:53:14.000000'),('-','2020-12-22 09:47:27','-','2020-12-22 09:47:27',0,51,0,2,6,NULL,NULL,NULL,0,'2021-01-10 08:53:14.000000'),('-','2020-12-22 09:47:27','-','2020-12-22 09:47:27',0,52,0,2,7,NULL,NULL,NULL,0,'2021-01-10 08:53:14.000000'),('-','2020-12-22 09:47:27','-','2020-12-22 09:47:27',0,53,0,2,8,NULL,NULL,NULL,0,'2021-01-10 08:53:14.000000'),('-','2020-12-22 09:47:27','-','2020-12-22 09:47:27',0,54,0,2,9,NULL,NULL,NULL,0,'2021-01-10 08:53:14.000000'),('-','2020-12-25 07:57:13','-','2020-12-25 07:57:13',0,55,1,20,NULL,NULL,NULL,NULL,0,'2021-01-09 12:07:35.000000'),('-','2020-12-25 09:44:17','-','2020-12-25 09:44:17',0,56,0,13,1,NULL,NULL,NULL,0,NULL),('-','2020-12-25 09:44:17','-','2020-12-25 09:44:17',0,57,0,13,3,NULL,NULL,NULL,0,NULL),('-','2020-12-25 09:47:40','-','2020-12-25 09:47:40',0,58,0,13,1,NULL,NULL,NULL,0,NULL),('-','2020-12-25 09:47:40','-','2020-12-25 09:47:40',0,59,0,13,1,NULL,NULL,NULL,0,NULL),('-','2020-12-25 09:47:40','-','2020-12-25 09:47:40',0,60,0,13,3,NULL,NULL,NULL,0,NULL),('-','2020-12-25 09:47:40','-','2020-12-25 09:47:40',0,61,0,13,5,NULL,NULL,NULL,0,NULL),('-','2020-12-25 09:48:04','-','2020-12-25 09:48:04',0,62,0,13,1,NULL,NULL,NULL,0,NULL),('-','2020-12-25 09:48:04','-','2020-12-25 09:48:04',0,63,0,13,1,NULL,NULL,NULL,0,NULL),('-','2020-12-25 09:48:04','-','2020-12-25 09:48:04',0,64,0,13,3,NULL,NULL,NULL,0,NULL),('-','2020-12-25 09:48:04','-','2020-12-25 09:48:04',0,65,0,13,5,NULL,NULL,NULL,0,NULL),('-','2020-12-25 09:48:04','-','2020-12-25 09:48:04',0,66,0,13,2,NULL,NULL,NULL,0,NULL),('-','2020-12-25 09:48:46','-','2020-12-25 09:48:46',0,67,0,13,3,NULL,NULL,NULL,0,NULL),('-','2020-12-25 09:48:46','-','2020-12-25 09:48:46',0,68,0,13,5,NULL,NULL,NULL,0,NULL),('-','2020-12-25 09:48:46','-','2020-12-25 09:48:46',0,69,0,13,2,NULL,NULL,NULL,0,NULL),('-','2020-12-25 09:48:57','-','2020-12-25 09:48:57',0,70,0,13,3,NULL,NULL,NULL,0,NULL),('-','2020-12-25 09:48:57','-','2020-12-25 09:48:57',0,71,0,13,2,NULL,NULL,NULL,0,NULL),('-','2020-12-25 09:49:02','-','2020-12-25 09:49:02',0,72,0,13,3,NULL,NULL,1,0,NULL),('-','2020-12-25 09:49:02','-','2020-12-25 09:49:02',0,73,0,13,2,NULL,NULL,NULL,0,NULL),('-','2020-12-25 09:49:02','-','2020-12-25 09:49:02',0,74,0,13,1,NULL,NULL,NULL,0,NULL),('-','2020-12-25 10:02:23','-','2020-12-25 10:02:23',0,75,0,13,3,NULL,NULL,1,0,NULL),('-','2020-12-25 10:02:23','-','2020-12-25 10:02:23',0,76,0,13,4,NULL,NULL,2,0,NULL),('-','2020-12-25 10:08:12','-','2020-12-25 10:08:12',0,77,0,13,3,NULL,NULL,NULL,0,NULL),('-','2020-12-25 10:11:07','-','2020-12-25 10:11:07',0,78,0,13,5,NULL,NULL,NULL,0,NULL),('-','2020-12-25 10:15:12','-','2020-12-25 10:15:12',0,79,0,13,5,NULL,NULL,NULL,0,NULL),('-','2020-12-25 10:15:12','-','2020-12-25 10:15:12',0,80,0,13,6,NULL,NULL,NULL,0,NULL),('-','2020-12-25 20:29:58','-','2020-12-25 20:29:58',0,81,0,13,5,NULL,NULL,NULL,0,NULL),('-','2020-12-25 20:29:58','-','2020-12-25 20:29:58',0,82,0,13,6,NULL,NULL,NULL,0,NULL),('-','2020-12-25 20:29:58','-','2020-12-25 20:29:58',0,83,0,13,3,NULL,NULL,NULL,0,NULL),('-','2020-12-25 20:30:08','-','2020-12-25 20:30:08',0,84,0,13,5,NULL,NULL,1,0,NULL),('-','2020-12-25 20:30:08','-','2020-12-25 20:30:08',0,85,0,13,6,NULL,NULL,NULL,0,NULL),('-','2020-12-25 20:30:08','-','2020-12-25 20:30:08',0,86,0,13,3,NULL,NULL,NULL,0,NULL),('-','2020-12-25 20:30:08','-','2020-12-25 20:30:08',0,87,0,13,2,NULL,NULL,NULL,0,NULL),('-','2020-12-25 20:30:21','-','2020-12-25 20:30:21',0,88,0,13,1,NULL,NULL,NULL,0,NULL),('-','2020-12-25 20:30:24','-','2020-12-25 20:30:24',0,89,0,13,1,NULL,NULL,NULL,0,NULL),('-','2020-12-25 20:30:24','-','2020-12-25 20:30:24',0,90,0,13,5,NULL,NULL,NULL,0,NULL),('-','2020-12-25 20:30:27','-','2020-12-25 20:30:27',0,91,0,13,5,NULL,NULL,NULL,0,NULL),('-','2020-12-25 20:31:19','-','2020-12-25 20:31:19',0,92,0,13,1,NULL,NULL,1,0,NULL),('-','2020-12-25 20:31:19','-','2020-12-25 20:31:19',0,93,0,13,2,NULL,NULL,NULL,0,NULL),('-','2020-12-25 20:32:58','-','2020-12-25 20:32:58',0,94,0,13,1,NULL,NULL,NULL,0,NULL),('-','2020-12-25 20:32:58','-','2020-12-25 20:32:58',0,95,0,13,2,NULL,NULL,NULL,0,NULL),('-','2020-12-25 20:33:07','-','2020-12-25 20:33:07',0,96,0,13,1,NULL,NULL,NULL,0,NULL),('-','2020-12-25 20:33:07','-','2020-12-25 20:33:07',0,97,0,13,2,NULL,NULL,NULL,0,NULL),('-','2020-12-25 20:33:07','-','2020-12-25 20:33:07',0,98,0,13,3,NULL,NULL,NULL,0,NULL),('-','2020-12-25 20:43:21','-','2020-12-25 20:43:21',0,99,0,13,1,NULL,NULL,NULL,0,NULL),('-','2020-12-25 20:43:21','-','2020-12-25 20:43:21',0,100,0,13,2,NULL,NULL,NULL,0,NULL),('-','2020-12-25 20:43:21','-','2020-12-25 20:43:21',0,101,0,13,3,NULL,NULL,NULL,0,NULL),('-','2020-12-25 20:43:21','-','2020-12-25 20:43:21',0,102,0,13,5,NULL,NULL,NULL,0,NULL),('-','2020-12-25 20:43:29','-','2020-12-25 20:43:29',0,103,0,13,1,NULL,NULL,NULL,0,NULL),('-','2020-12-25 20:43:29','-','2020-12-25 20:43:29',0,104,0,13,2,NULL,NULL,NULL,0,NULL),('-','2020-12-25 20:43:29','-','2020-12-25 20:43:29',0,105,0,13,3,NULL,NULL,NULL,0,NULL),('-','2020-12-25 20:43:29','-','2020-12-25 20:43:29',0,106,0,13,5,NULL,NULL,NULL,0,NULL),('-','2020-12-25 20:49:45','-','2020-12-25 20:49:45',0,107,0,13,1,NULL,NULL,NULL,0,NULL),('-','2020-12-25 20:49:45','-','2020-12-25 20:49:45',0,108,0,13,2,NULL,NULL,NULL,0,NULL),('-','2020-12-25 20:49:45','-','2020-12-25 20:49:45',0,109,0,13,3,NULL,NULL,NULL,0,NULL),('-','2020-12-25 20:49:45','-','2020-12-25 20:49:45',0,110,0,13,5,NULL,NULL,NULL,0,NULL),('-','2020-12-25 20:49:55','-','2020-12-25 20:49:55',0,111,0,13,1,NULL,NULL,NULL,0,NULL),('-','2020-12-25 20:49:55','-','2020-12-25 20:49:55',0,112,0,13,2,NULL,NULL,NULL,0,NULL),('-','2020-12-25 20:49:55','-','2020-12-25 20:49:55',0,113,0,13,3,NULL,NULL,NULL,0,NULL),('-','2020-12-25 20:49:55','-','2020-12-25 20:49:55',0,114,0,13,5,NULL,NULL,NULL,0,NULL),('-','2020-12-25 20:49:55','-','2020-12-25 20:49:55',0,115,0,13,1,NULL,NULL,NULL,0,NULL),('-','2020-12-25 20:49:55','-','2020-12-25 20:49:55',0,116,0,13,2,NULL,NULL,NULL,0,NULL),('-','2020-12-25 20:49:55','-','2020-12-25 20:49:55',0,117,0,13,3,NULL,NULL,NULL,0,NULL),('-','2020-12-25 20:49:55','-','2020-12-25 20:49:55',0,118,0,13,5,NULL,NULL,NULL,0,NULL),('-','2020-12-25 20:50:05','-','2020-12-25 20:50:05',0,119,0,13,1,NULL,NULL,NULL,0,NULL),('-','2020-12-25 20:50:05','-','2020-12-25 20:50:05',0,120,0,13,2,NULL,NULL,NULL,0,NULL),('-','2020-12-25 20:50:05','-','2020-12-25 20:50:05',0,121,0,13,3,NULL,NULL,NULL,0,NULL),('-','2020-12-25 20:50:05','-','2020-12-25 20:50:05',0,122,0,13,5,NULL,NULL,NULL,0,NULL),('-','2020-12-25 20:50:05','-','2020-12-25 20:50:05',0,123,0,13,1,NULL,NULL,NULL,0,NULL),('-','2020-12-25 20:50:05','-','2020-12-25 20:50:05',0,124,0,13,2,NULL,NULL,NULL,0,NULL),('-','2020-12-25 20:50:05','-','2020-12-25 20:50:05',0,125,0,13,3,NULL,NULL,NULL,0,NULL),('-','2020-12-25 20:50:05','-','2020-12-25 20:50:05',0,126,0,13,5,NULL,NULL,NULL,0,NULL),('-','2020-12-25 20:50:05','-','2020-12-25 20:50:05',0,127,0,13,1,NULL,NULL,NULL,0,NULL),('-','2020-12-25 20:50:05','-','2020-12-25 20:50:05',0,128,0,13,2,NULL,NULL,NULL,0,NULL),('-','2020-12-25 20:50:05','-','2020-12-25 20:50:05',0,129,0,13,3,NULL,NULL,NULL,0,NULL),('-','2020-12-25 20:50:05','-','2020-12-25 20:50:05',0,130,0,13,5,NULL,NULL,NULL,0,NULL),('-','2020-12-25 20:50:05','-','2020-12-25 20:50:05',0,131,0,13,1,NULL,NULL,NULL,0,NULL),('-','2020-12-25 20:50:05','-','2020-12-25 20:50:05',0,132,0,13,2,NULL,NULL,NULL,0,NULL),('-','2020-12-25 20:50:05','-','2020-12-25 20:50:05',0,133,0,13,3,NULL,NULL,NULL,0,NULL),('-','2020-12-25 20:50:05','-','2020-12-25 20:50:05',0,134,0,13,5,NULL,NULL,NULL,0,NULL),('-','2020-12-25 20:51:21','-','2020-12-25 20:51:21',0,135,0,13,1,NULL,NULL,NULL,0,NULL),('-','2020-12-25 20:51:31','-','2020-12-25 20:51:31',0,136,0,13,1,NULL,NULL,NULL,0,NULL),('-','2020-12-25 20:51:31','-','2020-12-25 20:51:31',0,137,0,13,2,NULL,NULL,NULL,0,NULL),('-','2020-12-25 20:52:22','-','2020-12-25 20:52:22',0,138,0,13,2,NULL,NULL,NULL,0,NULL),('-','2020-12-25 21:02:03','-','2020-12-25 21:02:03',0,139,0,13,1,NULL,NULL,13,0,NULL),('-','2020-12-25 21:02:03','-','2020-12-25 21:02:03',0,140,0,13,2,NULL,NULL,13,0,NULL),('-','2020-12-25 21:03:01','-','2020-12-25 21:03:01',0,141,1,21,NULL,NULL,NULL,14,0,'2021-01-09 11:51:34.000000'),('-','2020-12-25 21:24:13','-','2020-12-25 21:24:13',0,142,0,13,3,NULL,NULL,1,0,NULL),('-','2020-12-25 21:24:21','-','2020-12-25 21:24:21',0,143,0,13,5,NULL,NULL,14,0,NULL),('-','2020-12-27 11:06:34','-','2020-12-27 11:06:34',0,144,0,22,1,NULL,NULL,NULL,0,'2021-01-10 08:49:00.000000'),('-','2020-12-27 11:06:34','-','2020-12-27 11:06:34',0,145,0,22,5,NULL,NULL,14,0,'2021-01-10 08:49:00.000000'),('-','2020-12-27 11:06:43','-','2020-12-27 11:06:43',0,146,0,22,3,NULL,NULL,1,0,'2021-01-10 08:49:00.000000'),('-','2020-12-28 12:47:55','-','2020-12-28 12:47:55',0,147,0,1,NULL,NULL,81,NULL,0,'2021-01-10 08:52:30.000000'),('-','2020-12-28 12:47:55','-','2020-12-28 12:47:55',0,148,0,1,NULL,NULL,300,NULL,0,'2021-01-10 08:52:30.000000'),('-','2021-01-02 13:35:09','-','2021-01-02 13:35:09',0,149,0,25,1,NULL,NULL,1,0,'2021-01-10 08:27:41.000000'),('-','2021-01-02 13:35:09','-','2021-01-02 13:35:09',0,150,0,25,5,NULL,NULL,NULL,0,'2021-01-10 08:27:41.000000'),('-','2021-01-02 13:35:09','-','2021-01-02 13:35:09',0,151,0,25,7,NULL,NULL,14,0,'2021-01-10 08:27:41.000000'),('-','2021-01-09 04:47:36','-','2021-01-09 04:47:36',0,152,1,29,NULL,NULL,NULL,19,0,NULL),('-','2021-01-09 09:48:29','-','2021-01-09 09:48:29',0,153,0,30,NULL,4,NULL,NULL,0,'2021-01-09 10:38:11.000000'),('-','2021-01-09 09:48:29','-','2021-01-09 09:48:29',0,154,0,30,NULL,21,NULL,NULL,0,'2021-01-09 10:38:11.000000'),('-','2021-01-09 09:48:29','-','2021-01-09 09:48:29',0,155,0,30,NULL,23,NULL,NULL,0,'2021-01-09 10:38:11.000000'),('-','2021-01-09 09:48:29','-','2021-01-09 09:48:29',0,156,0,30,NULL,24,NULL,1,0,'2021-01-09 10:38:11.000000'),('-','2021-01-09 09:48:49','-','2021-01-09 09:48:49',0,157,0,30,NULL,19,NULL,NULL,0,'2021-01-09 10:38:11.000000'),('-','2021-01-09 10:38:11','-','2021-01-09 10:38:11',0,158,0,30,NULL,4,NULL,NULL,0,'2021-01-09 10:38:20.000000'),('-','2021-01-09 10:38:11','-','2021-01-09 10:38:11',0,159,0,30,NULL,21,NULL,NULL,0,'2021-01-09 10:38:20.000000'),('-','2021-01-09 10:40:54','-','2021-01-09 10:40:54',0,160,0,30,NULL,23,NULL,NULL,0,'2021-01-09 10:41:04.000000'),('-','2021-01-09 10:40:54','-','2021-01-09 10:40:54',0,161,0,30,NULL,4,NULL,NULL,0,'2021-01-09 10:41:04.000000'),('-','2021-01-09 10:40:54','-','2021-01-09 10:40:54',0,162,0,30,NULL,21,NULL,NULL,0,'2021-01-09 10:41:04.000000'),('-','2021-01-09 10:40:54','-','2021-01-09 10:40:54',0,163,0,30,NULL,24,NULL,NULL,0,'2021-01-09 10:41:04.000000'),('-','2021-01-09 10:41:04','-','2021-01-09 10:41:04',0,164,0,30,NULL,5,NULL,NULL,0,'2021-01-09 10:46:14.000000'),('-','2021-01-09 10:41:04','-','2021-01-09 10:41:04',0,165,0,30,NULL,24,NULL,1,0,'2021-01-09 10:46:14.000000'),('-','2021-01-09 10:46:25','-','2021-01-09 10:46:25',0,166,0,30,NULL,23,NULL,NULL,0,'2021-01-09 10:46:45.000000'),('-','2021-01-09 10:46:25','-','2021-01-09 10:46:25',0,167,0,30,NULL,4,NULL,NULL,0,'2021-01-09 10:46:45.000000'),('-','2021-01-09 10:46:25','-','2021-01-09 10:46:25',0,168,0,30,NULL,21,NULL,NULL,0,'2021-01-09 10:46:45.000000'),('-','2021-01-09 10:46:55','-','2021-01-09 10:46:55',0,169,0,30,NULL,4,NULL,NULL,0,NULL),('-','2021-01-09 10:46:55','-','2021-01-09 10:46:55',0,170,0,30,NULL,21,NULL,NULL,0,NULL),('-','2021-01-09 10:46:55','-','2021-01-09 10:46:55',0,171,0,30,NULL,23,NULL,NULL,0,NULL),('-','2021-01-09 10:51:57','-','2021-01-09 10:51:57',0,172,0,30,NULL,18,NULL,1,0,NULL),('-','2021-01-09 10:51:57','-','2021-01-09 10:51:57',0,173,0,30,NULL,5,NULL,NULL,0,NULL),('-','2021-01-10 08:59:52','-','2021-01-10 08:59:52',0,174,1,37,NULL,NULL,NULL,2,0,NULL),('-','2021-01-10 09:59:20','-','2021-01-10 09:59:20',0,175,0,38,1,NULL,NULL,1,0,NULL),('-','2021-01-10 09:59:20','-','2021-01-10 09:59:20',0,176,0,38,2,NULL,NULL,NULL,0,'2021-01-10 10:26:31.000000'),('-','2021-01-10 09:59:20','-','2021-01-10 09:59:20',0,177,0,38,3,NULL,NULL,NULL,0,'2021-01-10 10:26:31.000000'),('-','2021-01-10 09:59:20','-','2021-01-10 09:59:20',0,178,0,38,9,NULL,NULL,NULL,0,'2021-01-10 10:26:31.000000'),('-','2021-01-10 09:59:20','-','2021-01-10 09:59:20',0,179,0,38,6,NULL,NULL,NULL,0,'2021-01-10 10:26:31.000000'),('-','2021-01-10 09:59:20','-','2021-01-10 09:59:20',0,180,0,38,7,NULL,NULL,NULL,0,'2021-01-10 10:26:31.000000'),('-','2021-01-10 09:59:20','-','2021-01-10 09:59:20',0,181,0,38,8,NULL,NULL,NULL,0,'2021-01-10 10:26:31.000000'),('-','2021-01-10 09:59:20','-','2021-01-10 09:59:20',0,182,0,38,4,NULL,NULL,NULL,0,'2021-01-10 10:26:31.000000'),('-','2021-01-10 09:59:20','-','2021-01-10 09:59:20',0,183,0,38,5,NULL,NULL,NULL,0,'2021-01-10 10:26:31.000000'),('-','2021-01-10 10:26:53','-','2021-01-10 10:26:53',0,184,0,38,3,NULL,NULL,14,0,'2021-01-10 10:36:20.000000'),('-','2021-01-10 10:29:44','-','2021-01-10 10:29:44',0,185,0,38,4,NULL,NULL,14,0,'2021-01-10 10:35:20.000000'),('-','2021-01-10 10:32:28','-','2021-01-10 10:32:28',0,186,1,39,NULL,NULL,NULL,14,0,NULL),('-','2021-01-10 10:36:33','-','2021-01-10 10:36:33',0,187,0,38,3,NULL,NULL,NULL,0,NULL),('-','2021-01-10 12:24:54','-','2021-01-10 12:24:54',0,188,1,40,NULL,NULL,NULL,1,0,NULL),('-','2021-01-11 12:19:30','-','2021-01-11 12:19:30',0,189,1,41,NULL,NULL,NULL,NULL,0,NULL),('-','2021-01-11 12:19:30','-','2021-01-11 12:19:30',0,190,1,41,NULL,NULL,NULL,NULL,0,NULL),('-','2021-01-11 12:43:00','-','2021-01-11 12:43:00',0,191,1,43,NULL,NULL,NULL,NULL,0,NULL),('-','2021-01-11 12:43:52','-','2021-01-11 12:43:52',0,192,0,44,3,NULL,NULL,NULL,0,NULL),('-','2021-01-11 12:43:52','-','2021-01-11 12:43:52',0,193,0,44,1,NULL,NULL,NULL,0,NULL),('-','2021-01-11 12:43:52','-','2021-01-11 12:43:52',0,194,0,44,6,NULL,NULL,NULL,0,NULL),('-','2021-01-11 15:58:18','-','2021-01-11 15:58:18',0,195,1,47,NULL,NULL,NULL,1,0,NULL),('-','2021-01-12 05:42:09','-','2021-01-12 05:42:09',0,196,0,48,NULL,NULL,NULL,1,1,NULL);
/*!40000 ALTER TABLE `parameter_location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `parameter_location_data`
--

DROP TABLE IF EXISTS `parameter_location_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `parameter_location_data` (
  `createdBy` varchar(255) NOT NULL,
  `createdOn` datetime NOT NULL,
  `editedBy` varchar(255) NOT NULL,
  `editedOn` datetime NOT NULL,
  `status` int NOT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  `parameterId` int NOT NULL,
  `requestedDate` datetime NOT NULL,
  `requestdYear` int DEFAULT NULL,
  `startDate` datetime NOT NULL,
  `endDate` datetime NOT NULL,
  `deadline` datetime DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  `valueInParameterStandard` varchar(255) DEFAULT NULL,
  `dataRequestNote` varchar(255) DEFAULT NULL,
  `notedataEntry` varchar(255) DEFAULT NULL,
  `notedataApprover` varchar(255) DEFAULT NULL,
  `notedataCCS` varchar(255) DEFAULT NULL,
  `chatURL` varchar(255) DEFAULT NULL,
  `parameterLocationId` int DEFAULT NULL,
  `frequencyId` int DEFAULT NULL,
  `frequencyDetailId` int DEFAULT NULL,
  `unitOfMeasureDataEntryId` int DEFAULT NULL,
  `unitOfMeasureInParameterStandardId` int DEFAULT NULL,
  `dataEntryDeadLine` datetime DEFAULT NULL,
  `dataEntryUserId` int DEFAULT NULL,
  `dataRequestStatusId` int DEFAULT NULL,
  `dataEnteryDeadline` datetime DEFAULT NULL,
  `reasonforExceedRange` varchar(255) DEFAULT NULL,
  `conversionUnitOfMeasurevalue` varchar(255) DEFAULT NULL,
  `conversionUOMeDataEntryId` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_c2412abf1eb184d60c549ce1d36` (`parameterLocationId`),
  KEY `FK_253a66bc6b97d1d11b4fa26af15` (`frequencyId`),
  KEY `FK_dd9a84a8d942cec81fd3b73b7e0` (`frequencyDetailId`),
  KEY `FK_9c1cfa7455137be993c748f4fb9` (`unitOfMeasureDataEntryId`),
  KEY `FK_91be78c2664f7d4f040f17b8f99` (`unitOfMeasureInParameterStandardId`),
  KEY `FK_b1156c18106ab99b7bd5d51a222` (`dataEntryUserId`),
  KEY `FK_d6b185d42c3fd8be7bd9b84ac6e` (`dataRequestStatusId`),
  KEY `FK_891ed4ee6762f67f7bb55c98edc` (`conversionUOMeDataEntryId`),
  CONSTRAINT `FK_253a66bc6b97d1d11b4fa26af15` FOREIGN KEY (`frequencyId`) REFERENCES `frequency` (`id`),
  CONSTRAINT `FK_891ed4ee6762f67f7bb55c98edc` FOREIGN KEY (`conversionUOMeDataEntryId`) REFERENCES `uom_conversion` (`id`),
  CONSTRAINT `FK_91be78c2664f7d4f040f17b8f99` FOREIGN KEY (`unitOfMeasureInParameterStandardId`) REFERENCES `unit_of_measure` (`id`),
  CONSTRAINT `FK_9c1cfa7455137be993c748f4fb9` FOREIGN KEY (`unitOfMeasureDataEntryId`) REFERENCES `unit_of_measure` (`id`),
  CONSTRAINT `FK_b1156c18106ab99b7bd5d51a222` FOREIGN KEY (`dataEntryUserId`) REFERENCES `user` (`id`),
  CONSTRAINT `FK_c2412abf1eb184d60c549ce1d36` FOREIGN KEY (`parameterLocationId`) REFERENCES `parameter_location` (`id`),
  CONSTRAINT `FK_d6b185d42c3fd8be7bd9b84ac6e` FOREIGN KEY (`dataRequestStatusId`) REFERENCES `data_request_status` (`id`),
  CONSTRAINT `FK_dd9a84a8d942cec81fd3b73b7e0` FOREIGN KEY (`frequencyDetailId`) REFERENCES `frequency_detail` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parameter_location_data`
--

LOCK TABLES `parameter_location_data` WRITE;
/*!40000 ALTER TABLE `parameter_location_data` DISABLE KEYS */;
INSERT INTO `parameter_location_data` VALUES ('','2020-12-01 23:22:26','','2020-12-01 23:22:26',0,9,1,'2020-12-01 23:22:26',NULL,'2019-01-01 00:00:00','2020-01-01 00:00:00','2020-12-14 00:00:00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,4,NULL,NULL,2,NULL,NULL,1,'2020-12-02 00:39:22',NULL,NULL,NULL),('','2020-12-02 00:36:58','','2020-12-02 00:36:58',0,10,3,'2020-12-02 00:36:58',NULL,'2021-01-01 00:00:00','2022-01-01 00:00:00','2023-02-01 00:00:00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,NULL,NULL,2,NULL,NULL,3,'2020-12-02 00:39:22',NULL,NULL,NULL),('','2020-12-02 00:37:27','','2020-12-02 00:37:27',0,11,1,'2020-12-02 00:37:27',NULL,'2021-01-01 00:00:00','2022-01-01 00:00:00','2023-02-02 00:00:00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,4,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL),('','2020-12-02 00:37:27','','2020-12-02 00:37:27',0,12,2,'2020-12-02 00:37:27',NULL,'2021-01-01 00:00:00','2022-01-01 00:00:00','2023-02-02 00:00:00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,4,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL),('','2020-12-02 00:39:22','','2020-12-02 00:39:22',0,13,1,'2020-12-02 00:39:22',NULL,'2022-01-01 00:00:00','2023-01-01 00:00:00','2023-12-01 00:00:00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,4,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL),('','2020-12-02 00:39:22','','2020-12-02 00:39:22',0,14,2,'2020-12-02 00:39:22',NULL,'2022-01-01 00:00:00','2023-01-01 00:00:00','2023-12-01 00:00:00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,4,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL),('','2020-12-02 17:57:18','','2020-12-02 17:57:18',0,15,1,'2020-12-02 17:57:18',NULL,'2020-01-01 00:00:00','2021-01-01 00:00:00','2021-03-03 00:00:00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,4,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL),('','2020-12-02 17:57:19','','2020-12-02 17:57:19',0,16,2,'2020-12-02 17:57:18',NULL,'2020-01-01 00:00:00','2021-01-01 00:00:00','2021-03-03 00:00:00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,4,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL),('-','2020-12-03 00:22:45','-','2021-12-03 00:22:45',0,17,4,'2020-12-03 00:22:45',NULL,'2003-01-01 00:00:00','2004-01-01 00:00:00','2020-12-10 00:00:00','1000500',NULL,NULL,NULL,NULL,NULL,NULL,4,4,NULL,NULL,2,NULL,3,7,'2020-12-09 00:00:00',NULL,NULL,NULL),('-','2020-12-03 00:23:40','-','2020-12-03 00:23:40',0,18,2,'2020-12-03 00:23:40',NULL,'2003-01-01 00:00:00','2004-01-01 00:00:00','2020-12-10 00:00:00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,4,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL),('-','2020-12-04 00:04:58','-','2020-12-04 00:04:58',0,19,1,'2020-12-04 00:04:58',NULL,'2020-02-01 00:00:00','2021-02-01 00:00:00','2021-12-02 00:00:00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,4,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL),('-','2020-12-04 00:09:07','-','2020-12-04 00:09:07',0,20,2,'2020-12-04 00:09:07',NULL,'2020-02-01 00:00:00','2021-02-01 00:00:00','2021-12-02 00:00:00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,4,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL),('-','2020-12-04 00:10:30','-','2020-12-04 00:10:30',0,21,4,'2020-12-04 00:10:30',NULL,'2020-02-01 00:00:00','2021-02-01 00:00:00','2021-12-02 00:00:00','1231231',NULL,NULL,NULL,NULL,NULL,NULL,4,4,NULL,NULL,2,NULL,3,7,'2020-12-09 00:00:00',NULL,NULL,NULL),('-','2020-12-04 00:14:42','-','2020-12-04 00:14:42',0,22,1,'2020-12-04 00:14:42',NULL,'2015-01-01 00:00:00','2016-01-01 00:00:00','2021-12-02 00:00:00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,4,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL),('-','2020-12-04 00:19:17','-','2020-12-04 00:19:17',0,23,2,'2020-12-04 00:19:17',NULL,'2015-01-01 00:00:00','2016-01-01 00:00:00','2021-12-02 00:00:00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,4,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL),('-','2020-12-04 00:21:26','-','2020-12-04 00:21:26',0,24,4,'2020-12-04 00:21:26',NULL,'2015-01-01 00:00:00','2016-01-01 00:00:00','2021-12-02 00:00:00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,4,NULL,NULL,2,NULL,2,3,'2020-12-02 00:39:22',NULL,NULL,NULL),('-','2020-12-04 00:23:07','-','2020-12-04 00:23:07',0,25,1,'2020-12-04 00:23:07',NULL,'2014-01-01 00:00:00','2015-01-01 00:00:00','2021-12-02 00:00:00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,4,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL),('-','2020-12-04 00:37:12','-','2020-12-04 00:37:12',0,26,1,'2020-12-04 00:37:12',NULL,'2013-01-01 00:00:00','2014-01-01 00:00:00','2020-12-22 00:00:00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,4,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL),('-','2020-12-10 11:34:40','-','2020-12-10 11:34:40',0,27,13,'2020-12-10 11:34:40',NULL,'2020-01-01 00:00:00','2021-01-01 00:00:00','2022-12-01 00:00:00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,4,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL),('-','2020-12-10 11:34:55','-','2020-12-10 11:34:55',0,28,4,'2020-12-10 11:34:55',NULL,'2020-01-01 00:00:00','2021-01-01 00:00:00','2022-12-01 00:00:00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,4,NULL,NULL,2,NULL,1,3,'2020-12-11 00:00:00',NULL,NULL,NULL),('-','2020-12-10 11:56:30','-','2020-12-10 11:56:30',0,29,4,'2020-12-10 11:56:30',NULL,'2005-01-01 00:00:00','2006-01-01 00:00:00','2020-12-17 00:00:00','4000234',NULL,NULL,NULL,NULL,NULL,NULL,4,4,NULL,NULL,2,NULL,3,7,'2020-12-11 00:00:00',NULL,NULL,NULL),('-','2020-12-10 17:06:02','-','2020-12-10 17:06:02',0,30,4,'2020-12-10 17:06:02',NULL,'2002-01-01 00:00:00','2003-01-01 00:00:00','2020-12-18 00:00:00','100',NULL,NULL,NULL,NULL,NULL,NULL,4,4,NULL,NULL,2,NULL,3,7,'2020-12-17 00:00:00',NULL,NULL,NULL),('-','2020-12-10 17:06:02','-','2020-12-10 17:06:02',0,31,13,'2020-12-10 17:06:02',NULL,'2002-01-01 00:00:00','2003-01-01 00:00:00','2020-12-18 00:00:00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,4,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL),('-','2020-12-10 17:18:39','-','2020-12-10 17:18:39',0,32,4,'2020-12-10 17:18:39',NULL,'2004-01-01 00:00:00','2005-01-01 00:00:00','2020-12-18 00:00:00','4.123',NULL,NULL,NULL,NULL,NULL,NULL,4,4,NULL,NULL,2,NULL,3,5,'2020-12-10 00:00:00',NULL,NULL,NULL),('-','2020-12-11 20:31:34','-','2021-01-11 19:04:07',0,33,14,'2020-12-11 20:31:34',NULL,'2020-01-01 00:00:00','2020-01-01 00:01:00','2020-12-31 00:00:00','11',NULL,NULL,NULL,NULL,NULL,NULL,7,3,NULL,NULL,3,NULL,2,2,'2020-12-30 00:00:00','',NULL,NULL),('-','2020-12-11 20:31:34','-','2020-12-11 20:31:34',0,34,14,'2020-12-11 20:31:34',NULL,'2020-01-01 00:00:00','2020-01-01 00:01:00','2020-12-31 00:00:00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,8,3,NULL,NULL,3,NULL,NULL,1,NULL,NULL,NULL,NULL),('-','2020-12-11 20:31:34','-','2020-12-11 20:31:34',0,35,14,'2020-12-11 20:31:34',NULL,'2020-01-01 00:00:00','2020-01-01 00:01:00','2020-12-31 00:00:00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,9,3,NULL,NULL,3,NULL,NULL,1,NULL,NULL,NULL,NULL),('-','2020-12-11 20:31:34','-','2020-12-11 20:31:34',0,36,14,'2020-12-11 20:31:34',NULL,'2020-01-01 00:00:00','2020-01-01 00:01:00','2020-12-31 00:00:00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,11,3,NULL,NULL,3,NULL,NULL,1,NULL,NULL,NULL,NULL),('-','2020-12-11 20:31:34','-','2020-12-11 20:31:34',0,37,14,'2020-12-11 20:31:34',NULL,'2020-01-01 00:00:00','2020-01-01 00:01:00','2020-12-31 00:00:00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,10,3,NULL,NULL,3,NULL,NULL,1,NULL,NULL,NULL,NULL),('-','2020-12-11 20:31:34','-','2020-12-11 20:31:34',0,38,14,'2020-12-11 20:31:34',NULL,'2020-01-01 00:00:00','2020-01-01 00:01:00','2020-12-31 00:00:00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,12,3,NULL,NULL,3,NULL,NULL,1,NULL,NULL,NULL,NULL),('-','2020-12-11 20:31:34','-','2020-12-11 20:31:34',0,39,14,'2020-12-11 20:31:34',NULL,'2020-01-01 00:00:00','2020-01-01 00:01:00','2020-12-31 00:00:00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,13,3,NULL,NULL,3,NULL,NULL,1,NULL,NULL,NULL,NULL),('-','2020-12-11 20:37:57','-','2020-12-11 20:37:57',0,40,15,'2020-12-11 20:37:57',NULL,'2020-01-01 00:00:00','2020-01-01 00:01:00','2020-12-31 00:00:00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,15,3,NULL,NULL,4,NULL,6,3,'2020-12-25 00:00:00',NULL,NULL,NULL),('-','2020-12-11 20:37:57','-','2021-12-11 20:37:57',0,41,15,'2020-12-11 20:37:57',NULL,'2020-01-01 00:00:00','2020-01-01 00:01:00','2020-12-31 00:00:00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,16,3,NULL,NULL,4,NULL,6,3,'2020-12-25 00:00:00',NULL,NULL,NULL),('-','2020-12-11 20:37:57','-','2020-12-11 20:37:57',0,42,15,'2020-12-11 20:37:57',NULL,'2020-01-01 00:00:00','2020-01-01 00:01:00','2020-12-31 00:00:00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,17,3,NULL,NULL,4,NULL,1,3,'2020-12-25 00:00:00',NULL,NULL,NULL),('-','2020-12-15 09:54:42','-','2020-12-15 09:54:42',0,43,4,'2020-12-15 09:54:42',NULL,'2021-02-01 00:00:00','2022-02-01 00:00:00','2022-03-01 00:00:00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,4,NULL,NULL,2,NULL,2,3,'2020-12-31 00:00:00',NULL,NULL,NULL),('-','2020-12-15 09:54:42','-','2020-12-15 09:54:42',0,44,13,'2020-12-15 09:54:42',NULL,'2021-02-01 00:00:00','2022-02-01 00:00:00','2022-03-01 00:00:00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,4,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL),('-','2020-12-21 08:44:24','-','2021-01-09 03:13:29',0,45,4,'2020-12-21 08:44:24',NULL,'2019-01-01 00:00:00','2020-01-01 00:00:00','2020-12-31 00:00:00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,4,NULL,NULL,2,NULL,63,3,'2021-03-18 00:00:00',NULL,NULL,NULL),('-','2020-12-27 11:13:01','-','2020-12-27 11:24:03',0,46,22,'2020-12-27 11:13:01',NULL,'2020-01-01 00:00:00','2020-02-01 00:00:00','2021-01-03 11:12:54','100',NULL,NULL,NULL,NULL,NULL,NULL,145,3,NULL,NULL,2,NULL,2,7,'2020-12-30 00:00:00',NULL,NULL,NULL),('-','2020-12-27 11:15:56','-','2020-12-27 11:24:16',0,47,22,'2020-12-27 11:15:56',NULL,'2020-02-01 00:00:00','2020-03-01 00:00:00','2021-01-03 11:15:50','300',NULL,NULL,NULL,NULL,NULL,NULL,145,3,NULL,NULL,2,NULL,2,7,'2020-12-30 00:00:00',NULL,NULL,NULL),('-','2020-12-31 19:40:11','-','2020-12-31 19:40:11',0,48,13,'2020-12-31 19:40:11',NULL,'2020-01-01 00:00:00','2021-01-01 00:00:00','2021-01-01 00:00:00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,143,4,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL),('-','2020-12-31 19:40:11','-','2020-12-31 19:40:11',0,49,21,'2020-12-31 19:40:11',NULL,'2020-01-01 00:00:00','2021-01-01 00:00:00','2021-01-01 00:00:00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,141,4,NULL,NULL,5,NULL,NULL,1,NULL,NULL,NULL,NULL),('-','2021-01-03 06:40:08','-','2021-01-03 07:12:53',0,50,25,'2021-01-03 06:40:08',NULL,'2021-01-01 00:00:00','2022-01-01 00:00:00','2022-01-31 00:00:00','102',NULL,NULL,NULL,NULL,NULL,NULL,149,4,NULL,NULL,1,NULL,42,7,'2021-01-30 00:00:00',NULL,NULL,NULL),('-','2021-01-09 00:35:56','-','2021-01-09 03:46:45',0,51,4,'2021-01-09 00:35:56',NULL,'2019-01-01 00:00:00','2019-12-31 00:00:00','2021-02-08 00:32:34','234.56',NULL,NULL,NULL,NULL,NULL,NULL,4,4,NULL,NULL,2,NULL,65,4,'2021-02-03 00:00:00','',NULL,NULL),('-','2021-01-09 03:12:28','-','2021-01-09 03:46:45',0,52,15,'2021-01-09 03:12:28',NULL,'2021-02-01 00:00:00','2021-02-28 00:00:00','2021-03-30 00:00:00','123',NULL,NULL,NULL,NULL,NULL,NULL,15,3,NULL,NULL,4,NULL,65,4,'2021-03-18 00:00:00','abc rason',NULL,NULL),('-','2021-01-09 03:12:28','-','2021-01-09 04:00:06',0,53,15,'2021-01-09 03:12:28',NULL,'2021-02-01 00:00:00','2021-02-28 00:00:00','2021-03-30 00:00:00','321',NULL,NULL,NULL,NULL,NULL,NULL,17,3,NULL,NULL,4,NULL,65,7,'2021-03-18 00:00:00','abc rason',NULL,NULL),('-','2021-01-09 03:12:28','-','2021-01-09 04:00:06',0,54,15,'2021-01-09 03:12:28',NULL,'2021-02-01 00:00:00','2021-02-28 00:00:00','2021-03-30 00:00:00','123.456',NULL,NULL,NULL,NULL,NULL,NULL,19,3,NULL,NULL,4,NULL,65,7,'2021-03-18 00:00:00','',NULL,NULL),('-','2021-01-09 03:12:28','-','2021-01-09 03:47:03',0,55,15,'2021-01-09 03:12:28',NULL,'2021-02-01 00:00:00','2021-02-28 00:00:00','2021-03-30 00:00:00','1144',NULL,NULL,NULL,NULL,NULL,NULL,16,3,NULL,NULL,4,NULL,65,2,'2021-03-18 00:00:00','',NULL,NULL),('-','2021-01-11 16:07:03','-','2021-01-11 16:07:03',0,56,47,'2021-01-11 16:07:02',NULL,'2019-01-01 00:00:00','2019-12-31 00:00:00','2021-02-10 16:06:45',NULL,NULL,NULL,NULL,NULL,NULL,NULL,195,4,NULL,NULL,3,NULL,NULL,1,NULL,NULL,NULL,NULL),('-','2021-01-11 17:07:16','-','2021-01-11 19:04:07',0,57,47,'2021-01-11 17:07:16',NULL,'2021-01-01 00:00:00','2021-12-31 00:00:00','2022-01-30 00:00:00','1110.12345',NULL,NULL,NULL,NULL,NULL,NULL,195,4,NULL,NULL,3,NULL,42,2,'2021-01-27 00:00:00','',NULL,NULL),('-','2021-01-11 18:59:09','-','2021-01-11 18:59:09',0,58,47,'2021-01-11 18:59:06',NULL,'2022-01-01 00:00:00','2022-12-31 00:00:00','2023-01-30 00:00:00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,195,4,NULL,NULL,3,NULL,NULL,1,NULL,NULL,NULL,NULL),('-','2021-01-12 05:42:43','-','2021-01-12 05:47:57',0,59,48,'2021-01-12 05:42:43',NULL,'2021-01-01 00:00:00','2021-12-31 00:00:00','2022-01-30 00:00:00','110',NULL,NULL,NULL,NULL,NULL,NULL,196,4,NULL,NULL,3,NULL,NULL,7,NULL,'',NULL,NULL),('-','2021-01-17 10:15:34','-','2021-01-17 10:15:34',0,60,40,'2021-01-17 10:15:33',NULL,'2021-01-01 00:00:00','2021-12-31 00:00:00','2022-01-30 00:00:00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,188,4,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL),('-','2021-01-17 10:16:20','-','2021-01-17 10:16:20',0,61,38,'2021-01-17 10:16:17',NULL,'2021-01-01 00:00:00','2021-12-31 00:00:00','2022-01-30 00:00:00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,175,4,NULL,NULL,5,NULL,NULL,1,NULL,NULL,NULL,NULL),('-','2021-01-17 10:33:01','-','2021-01-17 10:33:01',0,62,30,'2021-01-17 10:33:00',NULL,'2021-01-01 00:00:00','2021-12-31 00:00:00','2022-01-30 00:00:00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,172,4,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL),('-','2021-01-17 10:56:48','-','2021-01-17 10:56:48',0,63,13,'2021-01-17 10:56:48',NULL,'2021-01-01 00:00:00','2021-12-31 00:00:00','2022-01-30 00:00:00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,142,4,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL),('-','2021-01-17 11:28:13','-','2021-01-17 11:28:13',0,64,13,'2021-01-17 11:28:13',NULL,'2021-01-01 00:00:00','2021-12-31 00:00:00','2022-01-30 00:00:00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,142,4,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL),('-','2021-01-17 11:29:01','-','2021-01-17 11:29:01',0,65,13,'2021-01-17 11:29:01',NULL,'2021-01-01 00:00:00','2021-12-31 00:00:00','2022-01-30 00:00:00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,72,4,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL),('-','2021-01-17 11:29:01','-','2021-01-17 11:29:01',0,66,13,'2021-01-17 11:29:01',NULL,'2021-01-01 00:00:00','2021-12-31 00:00:00','2022-01-30 00:00:00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,75,4,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL),('-','2021-01-17 11:29:01','-','2021-01-17 11:29:01',0,67,13,'2021-01-17 11:29:01',NULL,'2021-01-01 00:00:00','2021-12-31 00:00:00','2022-01-30 00:00:00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,84,4,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL),('-','2021-01-17 11:29:01','-','2021-01-17 11:29:01',0,68,13,'2021-01-17 11:29:01',NULL,'2021-01-01 00:00:00','2021-12-31 00:00:00','2022-01-30 00:00:00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,92,4,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL),('-','2021-01-17 11:57:32','-','2021-01-17 11:57:32',0,69,40,'2021-01-17 11:57:31',NULL,'2017-01-01 00:00:00','2017-12-31 00:00:00','2021-02-16 11:57:14',NULL,NULL,NULL,NULL,NULL,NULL,NULL,188,4,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL),('-','2021-01-17 11:57:32','-','2021-01-24 16:02:59',0,70,13,'2021-01-17 11:57:31',NULL,'2017-01-01 00:00:00','2017-12-31 00:00:00','2021-02-16 11:57:14','100.03',NULL,NULL,NULL,NULL,NULL,NULL,142,4,NULL,4,2,NULL,42,6,'2021-01-26 00:00:00','','10003',15),('-','2021-01-17 11:57:32','-','2021-01-24 15:30:30',0,71,13,'2021-01-17 11:57:31',NULL,'2017-01-01 00:00:00','2017-12-31 00:00:00','2021-02-16 11:57:14','100.01',NULL,NULL,NULL,NULL,NULL,NULL,92,4,NULL,4,2,NULL,42,6,'2021-01-26 00:00:00','','10001',15),('-','2021-01-17 11:57:32','-','2021-01-17 12:29:58',0,72,13,'2021-01-17 11:57:31',NULL,'2017-01-01 00:00:00','2017-12-31 00:00:00','2021-02-16 11:57:14',NULL,NULL,NULL,NULL,NULL,NULL,NULL,84,4,NULL,NULL,2,NULL,42,3,'2021-01-26 00:00:00',NULL,NULL,NULL),('-','2021-01-17 12:08:18','-','2021-01-17 12:08:18',0,73,13,'2021-01-17 12:08:18',NULL,'2017-01-01 00:00:00','2017-12-31 00:00:00','2021-02-16 11:57:14',NULL,NULL,NULL,NULL,NULL,NULL,NULL,72,4,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL),('-','2021-01-17 12:08:18','-','2021-01-17 12:08:18',0,74,13,'2021-01-17 12:08:18',NULL,'2017-01-01 00:00:00','2017-12-31 00:00:00','2021-02-16 11:57:14',NULL,NULL,NULL,NULL,NULL,NULL,NULL,75,4,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL),('-','2021-01-17 12:08:18','-','2021-01-17 12:08:18',0,75,38,'2021-01-17 12:08:18',NULL,'2017-01-01 00:00:00','2017-12-31 00:00:00','2021-02-16 11:57:14',NULL,NULL,NULL,NULL,NULL,NULL,NULL,175,4,NULL,NULL,5,NULL,NULL,1,NULL,NULL,NULL,NULL),('-','2021-01-17 12:08:18','-','2021-01-17 12:08:18',0,76,30,'2021-01-17 12:08:18',NULL,'2017-01-01 00:00:00','2017-12-31 00:00:00','2021-02-16 11:57:14',NULL,NULL,NULL,NULL,NULL,NULL,NULL,172,4,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL),('-','2021-01-17 12:10:17','-','2021-01-17 12:10:17',0,77,47,'2021-01-17 12:10:17',NULL,'2017-01-01 00:00:00','2017-12-31 00:00:00','2021-02-16 11:57:14',NULL,NULL,NULL,NULL,NULL,NULL,NULL,195,4,NULL,NULL,3,NULL,NULL,1,NULL,NULL,NULL,NULL),('-','2021-01-17 12:10:17','-','2021-01-17 12:10:17',0,78,48,'2021-01-17 12:10:17',NULL,'2017-01-01 00:00:00','2017-12-31 00:00:00','2021-02-16 11:57:14',NULL,NULL,NULL,NULL,NULL,NULL,NULL,196,4,NULL,NULL,3,NULL,NULL,1,NULL,NULL,NULL,NULL),('-','2021-01-23 11:50:02','-','2021-01-23 11:50:02',0,79,48,'2021-01-23 11:50:01',NULL,'2022-01-01 00:00:00','2022-12-31 00:00:00','2023-01-30 00:00:00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,196,4,NULL,NULL,3,NULL,NULL,1,NULL,NULL,NULL,NULL),('-','2021-01-23 11:50:02','-','2021-01-23 11:50:02',0,80,38,'2021-01-23 11:50:01',NULL,'2022-01-01 00:00:00','2022-12-31 00:00:00','2023-01-30 00:00:00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,175,4,NULL,NULL,5,NULL,NULL,1,NULL,NULL,NULL,NULL),('-','2021-01-23 11:50:02','-','2021-01-23 11:50:02',0,81,40,'2021-01-23 11:50:01',NULL,'2022-01-01 00:00:00','2022-12-31 00:00:00','2023-01-30 00:00:00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,188,4,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL),('-','2021-01-23 20:11:56','-','2021-01-23 20:11:56',0,82,30,'2021-01-23 20:11:55',NULL,'2022-01-01 00:00:00','2022-12-31 00:00:00','2023-01-30 00:00:00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,172,4,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL),('-','2021-01-23 20:11:56','-','2021-01-23 20:11:56',0,83,13,'2021-01-23 20:11:55',NULL,'2022-01-01 00:00:00','2022-12-31 00:00:00','2023-01-30 00:00:00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,142,4,NULL,NULL,2,NULL,NULL,1,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `parameter_location_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `parameter_unit_of_measures_fordata_entry_unit_of_measure`
--

DROP TABLE IF EXISTS `parameter_unit_of_measures_fordata_entry_unit_of_measure`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `parameter_unit_of_measures_fordata_entry_unit_of_measure` (
  `parameterId` int NOT NULL,
  `unitOfMeasureId` int NOT NULL,
  PRIMARY KEY (`parameterId`,`unitOfMeasureId`),
  KEY `IDX_083322e3c68df9ffe0facf1e81` (`parameterId`),
  KEY `IDX_283dd9b59a6540d4fe3c0e7d26` (`unitOfMeasureId`),
  CONSTRAINT `FK_083322e3c68df9ffe0facf1e81f` FOREIGN KEY (`parameterId`) REFERENCES `parameter` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_283dd9b59a6540d4fe3c0e7d26d` FOREIGN KEY (`unitOfMeasureId`) REFERENCES `unit_of_measure` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parameter_unit_of_measures_fordata_entry_unit_of_measure`
--

LOCK TABLES `parameter_unit_of_measures_fordata_entry_unit_of_measure` WRITE;
/*!40000 ALTER TABLE `parameter_unit_of_measures_fordata_entry_unit_of_measure` DISABLE KEYS */;
/*!40000 ALTER TABLE `parameter_unit_of_measures_fordata_entry_unit_of_measure` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `policy`
--

DROP TABLE IF EXISTS `policy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `policy` (
  `createdBy` varchar(255) NOT NULL,
  `createdOn` datetime NOT NULL,
  `editedBy` varchar(255) NOT NULL,
  `editedOn` datetime NOT NULL,
  `status` int NOT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `proposedDateOfCommence` datetime NOT NULL,
  `influence` int NOT NULL,
  `description` varchar(2500) NOT NULL,
  `deletedAt` datetime(6) DEFAULT NULL,
  `formulationInstitutionId` int DEFAULT NULL,
  `originalFormulationInstitution` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_f14b3030867943c4c481950bf21` (`formulationInstitutionId`),
  CONSTRAINT `FK_f14b3030867943c4c481950bf21` FOREIGN KEY (`formulationInstitutionId`) REFERENCES `institution` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `policy`
--

LOCK TABLES `policy` WRITE;
/*!40000 ALTER TABLE `policy` DISABLE KEYS */;
INSERT INTO `policy` VALUES (' ','2020-11-15 00:00:00',' ','2020-11-15 00:00:00',0,1,'Policy 0001','0000-00-00 00:00:00',0,'','2021-01-07 05:47:41.000000',NULL,NULL),('','2020-12-07 22:14:00','','2020-12-07 22:14:00',0,2,'test policy ','0000-00-00 00:00:00',0,'',NULL,NULL,NULL),('','2020-12-21 09:14:41','','2020-12-21 09:14:41',0,3,'P1 aaaaaaaaaaaaaaaaaaa bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb ccccccccccccccccc ddddddddddddddddddddddddddddddddd','2020-12-03 00:00:00',1,'p1','2021-01-07 05:48:32.000000',1,NULL),('','2020-12-21 09:17:15','','2020-12-21 09:17:15',0,4,'P1 ccccccccccccccccccc dddddddddddddddddddddddddd fffffffffffffffffffffffffffffffffffff gggggggggggggggggggggggg ','2020-12-01 00:00:00',1,'a',NULL,NULL,NULL),('','2020-12-28 14:02:36','','2020-12-28 14:02:36',0,5,'1200g','2020-12-23 00:00:00',1,'aaaa\nbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb\nbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb\nbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb\ncccccccccccccccc ddddddddddddddddddddddddddd\n\n\nssssssssssssssss\n\nsssssssssssss',NULL,14,NULL),('','2021-01-12 10:10:46','','2021-01-12 10:10:46',0,6,'LONG TERM GENERATION EXPANSION PLAN','2018-01-01 00:00:00',1,'The Ceylon Electricity Board (CEB) is under a statutory duty to develop and maintain an efficient, coordinated and economical system of Electricity Supply for the whole of Sri Lanka. Therefore, CEB is required to generate or acquire sufficient amount of electricity to satisfy the demand. CEB methodically plans its development activities in order to provide reliable, quality electricity to the entire nation at affordable prices. This report presents the Generation Expansion Planning Studies carried out by the Transmission and Generation Planning Branch of the Ceylon Electricity Board for the period 2018-2037. The Report also includes information on the existing generation system, generation planning methodology, system demand forecast and investment and implementation plans for the proposed projects and recommends the adoption of the least cost plant sequence derived for the base case and also emphasizes the need to implement the plan to avoid energy shortfalls\n',NULL,1,NULL),('','2021-01-14 11:32:27','','2021-01-14 11:32:27',0,7,'test 123','2021-01-13 00:00:00',1,'aaaa',NULL,1,NULL),('','2021-01-14 11:32:59','','2021-01-14 11:32:59',0,8,'test 123','2021-01-13 00:00:00',1,'',NULL,1,NULL),('','2021-01-15 15:33:35','','2021-01-15 15:33:35',0,9,'test policy','2021-01-14 00:00:00',1,'',NULL,1,NULL);
/*!40000 ALTER TABLE `policy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `policy_climatechangedatacategory`
--

DROP TABLE IF EXISTS `policy_climatechangedatacategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `policy_climatechangedatacategory` (
  `policyId` int NOT NULL,
  `climateChangeDataCategoryId` int NOT NULL,
  PRIMARY KEY (`policyId`,`climateChangeDataCategoryId`),
  KEY `IDX_d52255215f9d09e56eda1ac1cb` (`policyId`),
  KEY `IDX_7a408d8fed387f9c91124e8853` (`climateChangeDataCategoryId`),
  CONSTRAINT `FK_7a408d8fed387f9c91124e8853a` FOREIGN KEY (`climateChangeDataCategoryId`) REFERENCES `climate_change_data_category` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_d52255215f9d09e56eda1ac1cb9` FOREIGN KEY (`policyId`) REFERENCES `policy` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `policy_climatechangedatacategory`
--

LOCK TABLES `policy_climatechangedatacategory` WRITE;
/*!40000 ALTER TABLE `policy_climatechangedatacategory` DISABLE KEYS */;
/*!40000 ALTER TABLE `policy_climatechangedatacategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `policy_data`
--

DROP TABLE IF EXISTS `policy_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `policy_data` (
  `createdBy` varchar(255) NOT NULL,
  `createdOn` datetime NOT NULL,
  `editedBy` varchar(255) NOT NULL,
  `editedOn` datetime NOT NULL,
  `status` int NOT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  `institutionId` int NOT NULL,
  `year` int NOT NULL,
  `requestedDate` datetime NOT NULL,
  `deadline` datetime DEFAULT NULL,
  `dataEntryDeadline` datetime DEFAULT NULL,
  `amendments` varchar(2500) DEFAULT NULL,
  `dataRequestNote` varchar(255) DEFAULT NULL,
  `noteDataEntry` varchar(255) DEFAULT NULL,
  `noteDataApprover` varchar(255) DEFAULT NULL,
  `noteDataCCS` varchar(255) DEFAULT NULL,
  `chatURL` varchar(255) DEFAULT NULL,
  `policyId` int DEFAULT NULL,
  `dataEntryUserId` int DEFAULT NULL,
  `dataRequestStatusId` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_df2e69754e2dff0c692d26d569e` (`policyId`),
  KEY `FK_8510c2617c92a031e7e750525f1` (`dataEntryUserId`),
  KEY `FK_0e8bd723eaf69cd19805816f650` (`dataRequestStatusId`),
  CONSTRAINT `FK_0e8bd723eaf69cd19805816f650` FOREIGN KEY (`dataRequestStatusId`) REFERENCES `data_request_status` (`id`),
  CONSTRAINT `FK_8510c2617c92a031e7e750525f1` FOREIGN KEY (`dataEntryUserId`) REFERENCES `user` (`id`),
  CONSTRAINT `FK_df2e69754e2dff0c692d26d569e` FOREIGN KEY (`policyId`) REFERENCES `policy` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `policy_data`
--

LOCK TABLES `policy_data` WRITE;
/*!40000 ALTER TABLE `policy_data` DISABLE KEYS */;
INSERT INTO `policy_data` VALUES ('-','2020-12-21 10:21:56','-','2021-01-11 19:15:42',0,1,1,2000,'2020-12-21 10:21:56','2020-12-22 00:00:00','2021-01-30 00:00:00','p1 update\np1 update\np1 update\np1 update\np1 update\np1 update\np1 update\np1 updatep1 update\np1 update\np1 update\np1 updatep1 update\np1 update\np1 update\np1 updatep1 update\np1 update\np1 update\np1 update',NULL,NULL,NULL,NULL,NULL,3,42,6),('-','2020-12-21 10:22:31','-','2021-01-02 22:35:57',0,2,1,2001,'2020-12-21 10:22:31','2020-12-22 00:00:00','2021-01-30 00:00:00',NULL,NULL,NULL,NULL,NULL,NULL,3,42,7),('-','2020-12-22 08:04:44','-','2021-01-11 19:15:56',0,3,1,2002,'2020-12-22 08:04:44','2020-12-31 00:00:00','2021-01-30 00:00:00','aaaa',NULL,NULL,NULL,NULL,NULL,3,42,6),('-','2020-12-31 19:15:19','-','2020-12-31 19:18:15',0,4,14,2000,'2020-12-31 19:15:19','2020-12-31 19:15:04','2020-12-31 19:15:27','Amendment 1 \nAmendment 1 \nAmendment 12\nAmendment 1 4\nAmendment 1 \n4\n\n\n\nAmendment 1 22',NULL,NULL,NULL,NULL,NULL,5,2,4),('-','2021-01-02 20:23:36','-','2021-01-02 22:36:18',0,5,1,2020,'2021-01-02 20:23:36','2021-01-14 00:00:00','2021-01-30 00:00:00','p1 update\r p1 update\r p1 update\r p1 updatep1 update\r p1 update\r p1 update\r p1 updatep1 update\r p1 update\r p1 update\r p1 updatep111 update\r p1 update\r p1 update\r p1 update',NULL,NULL,NULL,NULL,NULL,3,13,7);
/*!40000 ALTER TABLE `policy_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `policy_sector`
--

DROP TABLE IF EXISTS `policy_sector`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `policy_sector` (
  `policyId` int NOT NULL,
  `sectorId` int NOT NULL,
  PRIMARY KEY (`policyId`,`sectorId`),
  KEY `IDX_b87cb8c246ca3f93b6fdbe886a` (`policyId`),
  KEY `IDX_6bb7f6c820dd3dceb1fd471ef7` (`sectorId`),
  CONSTRAINT `FK_6bb7f6c820dd3dceb1fd471ef7a` FOREIGN KEY (`sectorId`) REFERENCES `sector` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_b87cb8c246ca3f93b6fdbe886af` FOREIGN KEY (`policyId`) REFERENCES `policy` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `policy_sector`
--

LOCK TABLES `policy_sector` WRITE;
/*!40000 ALTER TABLE `policy_sector` DISABLE KEYS */;
/*!40000 ALTER TABLE `policy_sector` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_funding_detail`
--

DROP TABLE IF EXISTS `project_funding_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `project_funding_detail` (
  `createdBy` varchar(255) NOT NULL,
  `createdOn` datetime NOT NULL,
  `editedBy` varchar(255) NOT NULL,
  `editedOn` datetime NOT NULL,
  `status` int NOT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  `projectProgrammeId` int NOT NULL,
  `donor` varchar(255) NOT NULL,
  `donorType` int NOT NULL,
  `initialInvestment` decimal(10,2) DEFAULT NULL,
  `annualFunding` decimal(10,2) DEFAULT NULL,
  `initialInvestmentCurrencyId` int DEFAULT NULL,
  `annualFundingCurrencyId` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_dbfa822d910267695efb76e3fae` (`initialInvestmentCurrencyId`),
  KEY `FK_1b99a5d53bc31768dbff7f39015` (`annualFundingCurrencyId`),
  CONSTRAINT `FK_1b99a5d53bc31768dbff7f39015` FOREIGN KEY (`annualFundingCurrencyId`) REFERENCES `currency` (`id`),
  CONSTRAINT `FK_dbfa822d910267695efb76e3fae` FOREIGN KEY (`initialInvestmentCurrencyId`) REFERENCES `currency` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_funding_detail`
--

LOCK TABLES `project_funding_detail` WRITE;
/*!40000 ALTER TABLE `project_funding_detail` DISABLE KEYS */;
INSERT INTO `project_funding_detail` VALUES ('-','2020-12-17 07:23:27','-','2020-12-17 07:23:27',0,1,1,'IMFABC',3,1231234.00,123456.00,3,3);
/*!40000 ALTER TABLE `project_funding_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_program_data`
--

DROP TABLE IF EXISTS `project_program_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `project_program_data` (
  `createdBy` varchar(255) NOT NULL,
  `createdOn` datetime NOT NULL,
  `editedBy` varchar(255) NOT NULL,
  `editedOn` datetime NOT NULL,
  `status` int NOT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  `year` int NOT NULL,
  `requestedDate` datetime NOT NULL,
  `deadline` datetime DEFAULT NULL,
  `dataEntryDeadline` datetime DEFAULT NULL,
  `projectProgress` varchar(2500) DEFAULT NULL,
  `requestedDataType1` varchar(255) DEFAULT NULL,
  `requestedDataType2` varchar(255) DEFAULT NULL,
  `dataRequestNote` varchar(255) DEFAULT NULL,
  `noteDataEntry` varchar(255) DEFAULT NULL,
  `noteDataApprover` varchar(255) DEFAULT NULL,
  `noteDataCCS` varchar(255) DEFAULT NULL,
  `chatURL` varchar(255) DEFAULT NULL,
  `projectProgramId` int DEFAULT NULL,
  `dataEntryUserId` int DEFAULT NULL,
  `projectStatusId` int DEFAULT NULL,
  `dataRequestStatusId` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_dac5c9418c8724cb620d3732fb4` (`projectProgramId`),
  KEY `FK_cc18fe6e7b67e39985c9676f6f5` (`dataEntryUserId`),
  KEY `FK_7b2b52cd73c41eee5bebc20779a` (`projectStatusId`),
  KEY `FK_2dc76e11ad2a4922cc8159ee418` (`dataRequestStatusId`),
  CONSTRAINT `FK_2dc76e11ad2a4922cc8159ee418` FOREIGN KEY (`dataRequestStatusId`) REFERENCES `data_request_status` (`id`),
  CONSTRAINT `FK_7b2b52cd73c41eee5bebc20779a` FOREIGN KEY (`projectStatusId`) REFERENCES `project_status` (`id`),
  CONSTRAINT `FK_cc18fe6e7b67e39985c9676f6f5` FOREIGN KEY (`dataEntryUserId`) REFERENCES `user` (`id`),
  CONSTRAINT `FK_dac5c9418c8724cb620d3732fb4` FOREIGN KEY (`projectProgramId`) REFERENCES `project_programme` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_program_data`
--

LOCK TABLES `project_program_data` WRITE;
/*!40000 ALTER TABLE `project_program_data` DISABLE KEYS */;
INSERT INTO `project_program_data` VALUES ('-','2020-12-11 09:31:11','-','2020-12-11 09:31:11',0,1,2000,'2020-12-11 09:31:11','2020-12-18 00:00:00','2020-12-11 00:00:00',NULL,'Annual Progress','Status of Operation',NULL,NULL,NULL,NULL,NULL,11,3,NULL,3),('-','2020-12-11 09:45:16','-','2020-12-11 09:45:16',0,2,2001,'2020-12-11 09:45:16','2020-12-17 00:00:00',NULL,NULL,'Annual Progress','Status of Operation',NULL,NULL,NULL,NULL,NULL,11,NULL,NULL,1),('-','2020-12-16 13:37:11','-','2020-12-16 13:37:11',0,3,2020,'2020-12-16 13:37:11','2020-12-31 00:00:00','2020-12-25 00:00:00','1. Project status description  goes here \n2. Project status description  goes here \n3. Project status description  goes here \n4. Project status description  goes here \n5. Project status description  goes here','Annual Progress','Status of Operation',NULL,NULL,NULL,NULL,NULL,8,2,2,7),('-','2020-12-31 19:41:03','-','2020-12-31 19:43:04',0,4,2000,'2020-12-31 19:41:03','2020-12-31 19:40:43','2020-12-31 19:41:11','aaaaaaaaa\nbbbbbbbbbbbbbbbbbbbbbb\nccccccc ddddddddddddddd\neeeeeeeeeee','Annual Progress','Status of Operation',NULL,NULL,NULL,NULL,NULL,8,3,2,2),('-','2021-01-02 18:08:06','-','2021-01-02 20:09:49',0,5,2020,'2021-01-02 18:08:06','2021-01-31 00:00:00','2021-01-31 00:00:00','Project Progress\nProject Progress1\nProject Progress3 Project Progress4\n\n\nProject Progress 5.5.5.5\n\nProject Progress 6','Annual Progress','Status of Operation',NULL,NULL,NULL,NULL,NULL,12,42,2,7);
/*!40000 ALTER TABLE `project_program_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_programme`
--

DROP TABLE IF EXISTS `project_programme`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `project_programme` (
  `createdBy` varchar(255) NOT NULL,
  `createdOn` datetime NOT NULL,
  `editedBy` varchar(255) NOT NULL,
  `editedOn` datetime NOT NULL,
  `status` int NOT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `proposedDateOfCommence` datetime NOT NULL,
  `projectStatusId` int DEFAULT NULL,
  `climateChangeDataCategoryId` int DEFAULT NULL,
  `sectorId` int DEFAULT NULL,
  `subSectorId` int DEFAULT NULL,
  `projectTypeId` int DEFAULT NULL,
  `isProject` tinyint NOT NULL,
  `longitude` decimal(10,6) DEFAULT '0.000000',
  `latitude` decimal(10,6) DEFAULT '0.000000',
  `ghgEmissions` varchar(255) DEFAULT NULL,
  `adaptationBenefits` varchar(255) DEFAULT NULL,
  `isPublicProponent` tinyint DEFAULT '0',
  `publicDonor` tinyint DEFAULT '0',
  `privateDonor` tinyint DEFAULT '0',
  `internationalDonor` tinyint DEFAULT '0',
  `privatePublicDonor` tinyint DEFAULT '0',
  `ngoDonor` tinyint DEFAULT '0',
  `financingSchemeId` int DEFAULT NULL,
  `directSDBenefitId` int DEFAULT NULL,
  `indirectSDBenefitId` int DEFAULT NULL,
  `provinceId` int DEFAULT NULL,
  `districtId` int DEFAULT NULL,
  `divisionalSecretariatId` int DEFAULT NULL,
  `projectDuration` decimal(5,1) NOT NULL DEFAULT '0.0',
  `dataSourceId` int DEFAULT NULL,
  `description` varchar(2500) NOT NULL,
  `scope` varchar(2500) DEFAULT NULL,
  `partiesInvolved` varchar(2500) DEFAULT NULL,
  `totalProjectCost` decimal(10,6) DEFAULT NULL,
  `outcomes` varchar(2500) DEFAULT NULL,
  `projectProponents` varchar(255) DEFAULT NULL,
  `implementingEntities` varchar(255) DEFAULT NULL,
  `executingEntity` varchar(255) DEFAULT NULL,
  `beneficiaries` varchar(255) DEFAULT NULL,
  `totalProjectCostCurrencyId` int DEFAULT NULL,
  `deletedAt` datetime(6) DEFAULT NULL,
  `isNational` tinyint DEFAULT NULL,
  `isSpecificLocation` tinyint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_106ed992950b2d800d6d4abefa5` (`projectStatusId`),
  KEY `FK_50440573a1ef41f28e305faf2b4` (`climateChangeDataCategoryId`),
  KEY `FK_696cb61bda6241bdc7e62fc2ab2` (`sectorId`),
  KEY `FK_1908041df927fe2c714d6e9086e` (`subSectorId`),
  KEY `FK_dc6d8b7ae9d296c87e318ac3267` (`projectTypeId`),
  KEY `FK_fd275fe2ac4c590220c0a4e70e6` (`financingSchemeId`),
  KEY `FK_0c9305775b4c5746455d66bab9d` (`directSDBenefitId`),
  KEY `FK_d3254ae9e8df0f2b3c8bd677671` (`indirectSDBenefitId`),
  KEY `FK_9ab01fb36ba80c0c3d7c69be4b1` (`provinceId`),
  KEY `FK_abedc12db6f3e4438bda16de517` (`districtId`),
  KEY `FK_174cf56ab9d5195029302620d26` (`divisionalSecretariatId`),
  KEY `FK_d0f8a29db265197c00250df8505` (`dataSourceId`),
  KEY `FK_1ebbbbcd313011fab1983e63f3e` (`totalProjectCostCurrencyId`),
  CONSTRAINT `FK_0c9305775b4c5746455d66bab9d` FOREIGN KEY (`directSDBenefitId`) REFERENCES `sd_benefit` (`id`),
  CONSTRAINT `FK_106ed992950b2d800d6d4abefa5` FOREIGN KEY (`projectStatusId`) REFERENCES `project_status` (`id`),
  CONSTRAINT `FK_174cf56ab9d5195029302620d26` FOREIGN KEY (`divisionalSecretariatId`) REFERENCES `divisional_secretariat` (`id`),
  CONSTRAINT `FK_1908041df927fe2c714d6e9086e` FOREIGN KEY (`subSectorId`) REFERENCES `sub_sector` (`id`),
  CONSTRAINT `FK_1ebbbbcd313011fab1983e63f3e` FOREIGN KEY (`totalProjectCostCurrencyId`) REFERENCES `currency` (`id`),
  CONSTRAINT `FK_50440573a1ef41f28e305faf2b4` FOREIGN KEY (`climateChangeDataCategoryId`) REFERENCES `climate_change_data_category` (`id`),
  CONSTRAINT `FK_696cb61bda6241bdc7e62fc2ab2` FOREIGN KEY (`sectorId`) REFERENCES `sector` (`id`),
  CONSTRAINT `FK_9ab01fb36ba80c0c3d7c69be4b1` FOREIGN KEY (`provinceId`) REFERENCES `province` (`id`),
  CONSTRAINT `FK_abedc12db6f3e4438bda16de517` FOREIGN KEY (`districtId`) REFERENCES `district` (`id`),
  CONSTRAINT `FK_d0f8a29db265197c00250df8505` FOREIGN KEY (`dataSourceId`) REFERENCES `institution` (`id`),
  CONSTRAINT `FK_d3254ae9e8df0f2b3c8bd677671` FOREIGN KEY (`indirectSDBenefitId`) REFERENCES `sd_benefit` (`id`),
  CONSTRAINT `FK_dc6d8b7ae9d296c87e318ac3267` FOREIGN KEY (`projectTypeId`) REFERENCES `project_type` (`id`),
  CONSTRAINT `FK_fd275fe2ac4c590220c0a4e70e6` FOREIGN KEY (`financingSchemeId`) REFERENCES `financing_scheme` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_programme`
--

LOCK TABLES `project_programme` WRITE;
/*!40000 ALTER TABLE `project_programme` DISABLE KEYS */;
INSERT INTO `project_programme` VALUES (' ','2020-11-15 00:00:00',' ','2020-11-15 00:00:00',0,1,'Project 1.','2020-11-15 00:00:00',1,1,1,1,1,0,80.954395,6.915624,NULL,NULL,0,0,0,0,0,0,NULL,NULL,NULL,2,1,165,0.0,1,'Des','aaaa',NULL,25.000000,NULL,NULL,NULL,NULL,NULL,3,NULL,0,0),(' ','2020-11-15 00:00:00',' ','2020-11-15 00:00:00',0,2,'Project 2','2020-11-15 00:00:00',1,1,2,1,1,0,79.899700,6.864900,NULL,NULL,0,0,0,0,0,0,NULL,NULL,NULL,1,1,165,0.0,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0),(' ','2020-11-15 00:00:00',' ','2020-11-15 00:00:00',0,3,'Project 3','2020-11-15 00:00:00',1,1,2,1,1,0,0.000000,0.000000,NULL,NULL,0,0,0,0,0,0,NULL,NULL,NULL,1,NULL,NULL,0.0,NULL,'aa','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,NULL,0,0),(' ','2020-11-15 00:00:00',' ','2020-11-15 00:00:00',0,4,'Project 4','2020-11-15 00:00:00',1,1,1,1,1,0,0.000000,0.000000,NULL,NULL,0,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,0.0,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0),(' ','2020-11-15 00:00:00',' ','2020-11-15 00:00:00',0,5,'Project 5','2020-11-15 00:00:00',1,1,2,1,1,0,0.000000,0.000000,NULL,NULL,0,0,0,0,0,0,NULL,NULL,NULL,1,1,158,0.0,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0),(' ','2020-11-15 00:00:00',' ','2020-11-15 00:00:00',0,6,'Project 6','2020-11-15 00:00:00',1,1,1,1,1,0,0.000000,0.000000,NULL,NULL,0,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,0.0,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0),(' ','2020-11-15 00:00:00',' ','2020-11-15 00:00:00',0,7,'Project 7','2020-11-15 00:00:00',1,1,1,1,1,0,0.000000,0.000000,NULL,NULL,0,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,0.0,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-12-21 08:42:13.000000',0,0),('','2020-11-25 23:17:01','','2020-11-25 23:17:01',0,8,'programeee','2020-11-25 00:00:00',1,4,1,NULL,1,1,0.000000,0.000000,'','',0,0,0,0,0,0,NULL,NULL,NULL,1,1,165,1.0,14,'a','a',NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,NULL,0,0),('','2020-11-26 21:39:33','','2020-11-26 21:39:33',0,9,'test pro','2020-11-26 00:00:00',1,3,1,NULL,2,1,0.000000,0.000000,'','',0,1,1,1,0,0,NULL,NULL,NULL,1,1,158,1.0,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0),('','2020-12-07 21:36:12','','2020-12-07 21:36:12',0,10,'test Project','2020-12-07 00:00:00',2,3,1,NULL,2,1,79.861244,6.927079,'2323','ewrwer',1,1,1,1,1,1,1,1,4,1,1,165,3.0,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0),('','2020-12-11 09:30:35','','2020-12-11 09:30:35',0,11,'DR proj 1a11111111111111111111111111222222222222222233333333333333 test test test qqqqqqqqqqqqqqqqq','2020-12-11 00:00:00',3,3,1,NULL,4,1,0.000000,0.000000,'','',0,0,0,0,0,0,NULL,NULL,NULL,3,8,277,1.0,3,'testtt','trsttttt',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0),('','2020-12-17 07:31:55','','2020-12-17 07:31:55',0,12,'energy conservation using wind technology','2020-12-17 00:00:00',1,3,1,NULL,2,1,79.982684,6.837054,'aaaaaaaaaaaaaaa','aaaaaaaaaaaaaaaa',0,1,0,0,0,0,2,2,4,1,1,165,10.0,1,'aaaaaaaaaaaaaaaaa ','ssssssssssssssssssssssssssssssss','aaaaaaaaaaaaa',0.300000,'aaaaaaaaaaaa','aaa','aaa','aaa','aaa',6,NULL,0,0),('','2020-12-17 12:52:30','','2020-12-17 12:52:30',0,13,'Ministry of Energy','2020-12-24 00:00:00',2,4,1,NULL,2,1,0.000000,0.000000,'','',0,0,0,0,0,0,NULL,NULL,NULL,1,NULL,NULL,100.0,1,'10000','11111',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0),('','2020-12-17 12:53:52','','2020-12-17 12:53:52',0,14,'1200g','2020-12-03 00:00:00',1,3,1,NULL,2,1,80.364920,6.823786,'','',0,0,0,0,0,0,NULL,NULL,NULL,3,NULL,NULL,7.5,1,'aaaa','aaaa',NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,NULL,0,0),('','2021-01-04 00:42:01','','2021-01-04 00:42:01',0,15,'aaaaaaaaaaa','2021-01-05 00:00:00',2,4,1,NULL,2,1,0.000000,0.000000,'','',0,0,0,0,0,0,NULL,NULL,NULL,1,NULL,NULL,10.0,2,'aaaaaa',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('','2021-01-04 01:12:56','','2021-01-04 01:12:56',0,16,'aaa','2021-01-12 00:00:00',2,4,1,NULL,5,1,0.000000,0.000000,'','',0,0,0,0,0,0,NULL,NULL,NULL,5,NULL,NULL,1.0,3,'aaaa','a',NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,NULL,0,0),('','2021-01-04 01:27:45','','2021-01-04 01:27:45',0,17,'1200g','2021-01-27 00:00:00',2,4,2,NULL,5,1,79.982147,6.946838,'','',0,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,0.0,1,'aaa',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,NULL,NULL,NULL),('','2021-01-12 10:08:36','','2021-01-12 10:08:36',0,18,'Establishment of large scale wind power plants of 514 MW','2013-01-01 00:00:00',2,3,1,NULL,3,0,0.000000,0.000000,'N/A','',1,0,0,0,0,0,NULL,1,4,NULL,NULL,NULL,17.0,1,'GHG emission reduction & Increase the renewable energy share in grid mix\n','N/A','N/A',NULL,'GHG Emission Reduction','CEB',NULL,'CEB',NULL,NULL,NULL,1,0),('','2021-01-14 11:31:48','','2021-01-14 11:31:48',0,19,'test 123','2021-01-13 00:00:00',5,3,1,NULL,2,1,0.000000,0.000000,'','',0,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,0.0,26,'aaaa',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('','2021-01-14 11:33:48','','2021-01-14 11:33:48',0,20,'test 123','2021-01-13 00:00:00',5,3,1,NULL,2,1,0.000000,0.000000,'','',0,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,0.0,1,'aaa',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('','2021-01-15 15:31:41','','2021-01-15 15:31:41',0,21,'test policy','2021-01-14 00:00:00',5,3,1,NULL,2,1,0.000000,0.000000,'','',0,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,0.0,1,'aaa',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `project_programme` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_status`
--

DROP TABLE IF EXISTS `project_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `project_status` (
  `createdBy` varchar(255) NOT NULL,
  `createdOn` datetime NOT NULL,
  `editedBy` varchar(255) NOT NULL,
  `editedOn` datetime NOT NULL,
  `status` int NOT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `sortOrder` int NOT NULL,
  `description` varchar(2500) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_status`
--

LOCK TABLES `project_status` WRITE;
/*!40000 ALTER TABLE `project_status` DISABLE KEYS */;
INSERT INTO `project_status` VALUES (' ','2020-11-15 00:00:00',' ','2020-11-15 00:00:00',0,1,'Proposed',1,''),(' ','2020-11-15 00:00:00',' ','2020-11-15 00:00:00',0,2,'Operational',2,''),(' ','2020-11-15 00:00:00',' ','2020-11-15 00:00:00',0,3,'Suspended',3,''),(' ','2020-11-15 00:00:00',' ','2020-11-15 00:00:00',0,4,'Postponed',4,''),(' ','2020-11-15 00:00:00',' ','2020-11-15 00:00:00',0,5,'Abondand',5,''),(' ','2020-11-15 00:00:00',' ','2020-11-15 00:00:00',0,6,'Clossed ',6,'');
/*!40000 ALTER TABLE `project_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_type`
--

DROP TABLE IF EXISTS `project_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `project_type` (
  `createdBy` varchar(255) NOT NULL,
  `createdOn` datetime NOT NULL,
  `editedBy` varchar(255) NOT NULL,
  `editedOn` datetime NOT NULL,
  `status` int NOT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `sortOrder` int NOT NULL,
  `description` varchar(2500) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_type`
--

LOCK TABLES `project_type` WRITE;
/*!40000 ALTER TABLE `project_type` DISABLE KEYS */;
INSERT INTO `project_type` VALUES (' ','2020-11-15 00:00:00',' ','2020-11-15 00:00:00',0,1,'Private Project',1,''),(' ','2020-11-15 00:00:00',' ','2020-11-15 00:00:00',0,2,'Government project',1,''),(' ','2020-11-15 00:00:00',' ','2020-11-15 00:00:00',0,3,'Public Private Partnership',2,''),(' ','2020-11-15 00:00:00',' ','2020-11-15 00:00:00',0,4,'NGO project',3,''),(' ','2020-11-15 00:00:00',' ','2020-11-15 00:00:00',0,5,'International Project',4,'');
/*!40000 ALTER TABLE `project_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `province`
--

DROP TABLE IF EXISTS `province`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `province` (
  `createdBy` varchar(255) NOT NULL,
  `createdOn` datetime NOT NULL,
  `editedBy` varchar(255) NOT NULL,
  `editedOn` datetime NOT NULL,
  `status` int NOT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `sortOrder` int NOT NULL,
  `description` varchar(2500) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `province`
--

LOCK TABLES `province` WRITE;
/*!40000 ALTER TABLE `province` DISABLE KEYS */;
INSERT INTO `province` VALUES ('','0000-00-00 00:00:00','','0000-00-00 00:00:00',0,1,'Central',1,''),('','0000-00-00 00:00:00','','0000-00-00 00:00:00',0,2,'Eastern',2,''),('','0000-00-00 00:00:00','','0000-00-00 00:00:00',0,3,'North Central',3,''),('','0000-00-00 00:00:00','','0000-00-00 00:00:00',0,4,'Northern',4,''),('','0000-00-00 00:00:00','','0000-00-00 00:00:00',0,5,'North Western',5,''),('','0000-00-00 00:00:00','','0000-00-00 00:00:00',0,6,'Sabaragamuwa',6,''),('','0000-00-00 00:00:00','','0000-00-00 00:00:00',0,7,'Southern',7,''),('','0000-00-00 00:00:00','','0000-00-00 00:00:00',0,8,'Uva',8,''),('','0000-00-00 00:00:00','','0000-00-00 00:00:00',0,9,'Western',9,'');
/*!40000 ALTER TABLE `province` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sd_benefit`
--

DROP TABLE IF EXISTS `sd_benefit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sd_benefit` (
  `createdBy` varchar(255) NOT NULL,
  `createdOn` datetime NOT NULL,
  `editedBy` varchar(255) NOT NULL,
  `editedOn` datetime NOT NULL,
  `status` int NOT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `sortOrder` int NOT NULL,
  `isDirectBenefit` tinyint NOT NULL,
  `isInDirectBenefit` tinyint NOT NULL,
  `description` varchar(2500) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sd_benefit`
--

LOCK TABLES `sd_benefit` WRITE;
/*!40000 ALTER TABLE `sd_benefit` DISABLE KEYS */;
INSERT INTO `sd_benefit` VALUES (' ','2020-11-15 00:00:00',' ','2020-11-15 00:00:00',0,1,'Direct SD benefit 1',1,1,0,''),(' ','2020-11-15 00:00:00',' ','2020-11-15 00:00:00',0,2,'Direct SD benefit 2',1,1,0,''),(' ','2020-11-15 00:00:00','  ','2020-11-15 00:00:00',0,3,'Indirect SD benefit 1',1,0,1,''),(' ','2020-11-15 00:00:00',' ','2020-11-15 00:00:00',0,4,'Indirect SD benefit 2',1,0,1,'');
/*!40000 ALTER TABLE `sd_benefit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sector`
--

DROP TABLE IF EXISTS `sector`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sector` (
  `createdBy` varchar(255) NOT NULL,
  `createdOn` datetime NOT NULL,
  `editedBy` varchar(255) NOT NULL,
  `editedOn` datetime NOT NULL,
  `status` int NOT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `sortOrder` int NOT NULL,
  `description` varchar(2500) NOT NULL,
  `climateChangeDataCategoryId` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_596c6d68cd66bf519473ae7182a` (`climateChangeDataCategoryId`),
  CONSTRAINT `FK_596c6d68cd66bf519473ae7182a` FOREIGN KEY (`climateChangeDataCategoryId`) REFERENCES `climate_change_data_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sector`
--

LOCK TABLES `sector` WRITE;
/*!40000 ALTER TABLE `sector` DISABLE KEYS */;
INSERT INTO `sector` VALUES (' ','2020-11-15 00:00:00',' ','2020-11-15 00:00:00',0,1,'Sector 1',1,'',3),(' ','2020-11-15 00:00:00',' ','2020-11-15 00:00:00',0,2,'Sector 2',1,'',NULL);
/*!40000 ALTER TABLE `sector` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sector_moe`
--

DROP TABLE IF EXISTS `sector_moe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sector_moe` (
  `createdBy` varchar(255) NOT NULL,
  `createdOn` datetime NOT NULL,
  `editedBy` varchar(255) NOT NULL,
  `editedOn` datetime NOT NULL,
  `status` int NOT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `sortOrder` int NOT NULL,
  `description` varchar(2500) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sector_moe`
--

LOCK TABLES `sector_moe` WRITE;
/*!40000 ALTER TABLE `sector_moe` DISABLE KEYS */;
INSERT INTO `sector_moe` VALUES (' ','2020-11-15 00:00:00',' ','2020-11-15 00:00:00',0,1,'Energy and Transport',1,''),(' ','2020-11-15 00:00:00',' ','2020-11-15 00:00:00',0,2,'Health',1,''),(' ','2020-11-15 00:00:00',' ','2020-11-15 00:00:00',0,3,'Wind',1,'');
/*!40000 ALTER TABLE `sector_moe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shopping_cart`
--

DROP TABLE IF EXISTS `shopping_cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shopping_cart` (
  `createdBy` varchar(255) NOT NULL,
  `createdOn` datetime NOT NULL,
  `editedBy` varchar(255) NOT NULL,
  `editedOn` datetime NOT NULL,
  `status` int NOT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  `sessionId` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `cartStatus` int NOT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `phoneNumber` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `streetAddress` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `province` varchar(255) DEFAULT NULL,
  `postalCode` int DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `userEmail` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shopping_cart`
--

LOCK TABLES `shopping_cart` WRITE;
/*!40000 ALTER TABLE `shopping_cart` DISABLE KEYS */;
INSERT INTO `shopping_cart` VALUES ('-','2020-12-18 13:53:25','-','2020-12-18 13:53:25',0,1,'6c3a4e64-f69e-43a6-933f-b82c0b07f6e7','6c3a4e64-f69e-43a6-933f-b82c0b07f6e7',1,'Rohan','Map2','+94 121 212-123_','r2@tt.com','','','',0,'',''),('-','2021-01-02 12:29:09','-','2021-01-02 12:29:09',0,2,'594d1726-bacd-423b-8f9b-87c1e17abc72','594d1726-bacd-423b-8f9b-87c1e17abc72',1,'Rohan','Map','+94 ___ ___-____','superadmin@ccsdsnlk.lk','','','',0,'',''),('-','2021-01-06 14:11:57','-','2021-01-06 14:11:57',0,3,'2ab89714-f78c-4d64-a751-0570070315b7','2ab89714-f78c-4d64-a751-0570070315b7',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,''),('-','2021-01-08 15:56:11','-','2021-01-08 15:56:11',0,4,'0fed1009-9bbb-4c3f-bef4-7521ba6f6825','0fed1009-9bbb-4c3f-bef4-7521ba6f6825',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'rpmdsndeo4@yopmail.com'),('-','2021-01-09 04:01:51','-','2021-01-09 04:01:51',0,5,'0284c970-4f99-4f5d-a001-6f5ea1845b75','0284c970-4f99-4f5d-a001-6f5ea1845b75',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'superadmin@ccsdsnlk.lk');
/*!40000 ALTER TABLE `shopping_cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shopping_cart_item`
--

DROP TABLE IF EXISTS `shopping_cart_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shopping_cart_item` (
  `createdBy` varchar(255) NOT NULL,
  `createdOn` datetime NOT NULL,
  `editedBy` varchar(255) NOT NULL,
  `editedOn` datetime NOT NULL,
  `status` int NOT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  `parameterLocationDataId` int NOT NULL,
  `parameterId` int NOT NULL,
  `parameterName` varchar(255) NOT NULL,
  `parameterDescription` varchar(2500) NOT NULL,
  `parameterLocation` varchar(255) NOT NULL,
  `dataProvider` varchar(255) NOT NULL,
  `value` varchar(255) NOT NULL,
  `unit` varchar(255) NOT NULL,
  `dataValidFrom` datetime NOT NULL,
  `dataValidTo` datetime NOT NULL,
  `price` int NOT NULL,
  `frequency` varchar(255) NOT NULL,
  `isActiveInCart` tinyint NOT NULL,
  `shoppingCartId` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_74abdeac2e0e8ecf7d2294641f4` (`shoppingCartId`),
  CONSTRAINT `FK_74abdeac2e0e8ecf7d2294641f4` FOREIGN KEY (`shoppingCartId`) REFERENCES `shopping_cart` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shopping_cart_item`
--

LOCK TABLES `shopping_cart_item` WRITE;
/*!40000 ALTER TABLE `shopping_cart_item` DISABLE KEYS */;
INSERT INTO `shopping_cart_item` VALUES ('-','2020-12-18 13:53:25','-','2020-12-18 13:53:25',0,1,17,4,'Parameter 4','','National','Sri Lanka Railways','1000500','gram','2003-01-01 00:00:00','2004-01-01 00:00:00',0,'Annualy',0,1),('-','2020-12-18 13:53:29','-','2020-12-18 13:53:29',0,2,21,4,'Parameter 4','','National','Sri Lanka Railways','1231231','gram','2020-02-01 00:00:00','2021-02-01 00:00:00',0,'Annualy',1,1),('-','2020-12-18 13:53:34','-','2020-12-18 13:53:34',0,3,29,4,'Parameter 4','','National','Sri Lanka Railways','4000234','gram','2005-01-01 00:00:00','2006-01-01 00:00:00',0,'Annualy',1,1),('-','2021-01-02 12:29:09','-','2021-01-02 12:29:09',0,4,17,4,'Parameter 4','','National','Sri Lanka Railways','1000500','gram','2003-01-01 00:00:00','2004-01-01 00:00:00',0,'Annualy',0,2),('-','2021-01-02 12:29:17','-','2021-01-02 12:29:17',0,5,29,4,'Parameter 4','','National','Sri Lanka Railways','4000234','gram','2005-01-01 00:00:00','2006-01-01 00:00:00',0,'Annualy',0,2),('-','2021-01-02 12:29:23','-','2021-01-02 12:29:23',0,6,30,4,'Parameter 4','','National','Sri Lanka Railways','100','gram','2002-01-01 00:00:00','2003-01-01 00:00:00',0,'Annualy',0,2),('-','2021-01-02 12:36:00','-','2021-01-02 12:36:00',0,7,21,4,'Parameter 4','','National','Sri Lanka Railways','1231231','gram','2020-02-01 00:00:00','2021-02-01 00:00:00',0,'Annualy',0,2),('-','2021-01-03 22:10:26','-','2021-01-03 22:10:26',0,8,50,25,'p11111111','p1111111111','Province: Central','Ministry of Energy','102','meter','2021-01-01 00:00:00','2022-01-01 00:00:00',0,'Annualy',1,2),('-','2021-01-06 14:11:57','-','2021-01-06 14:11:57',0,9,17,4,'Parameter 4','','National','Sri Lanka Railways','1000500','gram','2003-01-01 00:00:00','2004-01-01 00:00:00',0,'Annualy',1,3),('-','2021-01-06 14:12:00','-','2021-01-06 14:12:00',0,10,29,4,'Parameter 4','','National','Sri Lanka Railways','4000234','gram','2005-01-01 00:00:00','2006-01-01 00:00:00',0,'Annualy',1,3),('-','2021-01-06 14:12:04','-','2021-01-06 14:12:04',0,11,30,4,'Parameter 4','','National','Sri Lanka Railways','100','gram','2002-01-01 00:00:00','2003-01-01 00:00:00',0,'Annualy',1,3),('-','2021-01-08 15:56:11','-','2021-01-08 15:56:11',0,12,50,25,'p11111111','p1111111111','Province: Central','Ministry of Energy','102','meter','2021-01-01 00:00:00','2022-01-01 00:00:00',0,'Annualy',1,4),('-','2021-01-08 15:56:12','-','2021-01-08 15:56:12',0,13,17,4,'Parameter 4','','National','Sri Lanka Railways','1000500','gram','2003-01-01 00:00:00','2004-01-01 00:00:00',0,'Annualy',1,4),('-','2021-01-09 04:01:51','-','2021-01-09 04:01:51',0,14,17,4,'Parameter 4','','National','Sri Lanka Railways','1000500','gram','2003-01-01 00:00:00','2004-01-01 00:00:00',0,'Annualy',1,5),('-','2021-01-09 04:01:52','-','2021-01-09 04:01:52',0,15,50,25,'p11111111','p1111111111','Province: Central','Ministry of Energy','102','meter','2021-01-01 00:00:00','2022-01-01 00:00:00',0,'Annualy',1,5),('-','2021-01-09 04:01:53','-','2021-01-09 04:01:53',0,16,21,4,'Parameter 4','','National','Sri Lanka Railways','1231231','gram','2020-02-01 00:00:00','2021-02-01 00:00:00',0,'Annualy',1,5),('-','2021-01-09 04:02:21','-','2021-01-09 04:02:21',0,17,29,4,'Parameter 4','','National','Sri Lanka Railways','4000234','gram','2005-01-01 00:00:00','2006-01-01 00:00:00',0,'Annualy',1,5),('-','2021-01-09 04:02:23','-','2021-01-09 04:02:23',0,18,30,4,'Parameter 4','','National','Sri Lanka Railways','100','gram','2002-01-01 00:00:00','2003-01-01 00:00:00',0,'Annualy',1,5),('-','2021-01-17 20:12:07','-','2021-01-17 20:12:07',0,19,47,22,'P1111111111111','2222222222222222','Province: North Western','Ministry of Inovation','300','gram','2020-02-01 00:00:00','2020-03-01 00:00:00',0,'Monthly',1,5),('-','2021-01-17 20:15:36','-','2021-01-17 20:15:36',0,20,59,48,'LVB 1','ldsas','','Ministry of Energy','110','GWh','2021-01-01 00:00:00','2021-12-31 00:00:00',0,'Annualy',1,5);
/*!40000 ALTER TABLE `shopping_cart_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sub_sector`
--

DROP TABLE IF EXISTS `sub_sector`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sub_sector` (
  `createdBy` varchar(255) NOT NULL,
  `createdOn` datetime NOT NULL,
  `editedBy` varchar(255) NOT NULL,
  `editedOn` datetime NOT NULL,
  `status` int NOT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `sortOrder` int NOT NULL,
  `sectorId` int DEFAULT NULL,
  `description` varchar(2500) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_db2ad95adf971aec99e1159acd5` (`sectorId`),
  CONSTRAINT `FK_db2ad95adf971aec99e1159acd5` FOREIGN KEY (`sectorId`) REFERENCES `sector` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sub_sector`
--

LOCK TABLES `sub_sector` WRITE;
/*!40000 ALTER TABLE `sub_sector` DISABLE KEYS */;
INSERT INTO `sub_sector` VALUES (' ','2020-11-15 00:00:00',' ','2020-11-15 00:00:00',0,1,'S1-Sub1',1,1,''),('  ','2020-11-15 00:00:00',' ','2020-11-15 00:00:00',0,2,'S1-Sub2',1,1,''),(' ','2020-11-15 00:00:00',' ','2020-11-15 00:00:00',0,3,'S2-Sub1',1,2,''),('  ','2020-11-15 00:00:00',' ','2020-11-15 00:00:00',0,4,'S2-Sub2',1,2,'');
/*!40000 ALTER TABLE `sub_sector` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unit_of_measure`
--

DROP TABLE IF EXISTS `unit_of_measure`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `unit_of_measure` (
  `createdBy` varchar(255) NOT NULL,
  `createdOn` datetime NOT NULL,
  `editedBy` varchar(255) NOT NULL,
  `editedOn` datetime NOT NULL,
  `status` int NOT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `kindOfQuantity` varchar(255) NOT NULL,
  `print` varchar(255) NOT NULL,
  `isAMetricUnit` tinyint NOT NULL,
  `definitionValue` int NOT NULL,
  `definitionValueText` varchar(255) NOT NULL,
  `definitionUnit` varchar(255) NOT NULL,
  `description` varchar(2500) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unit_of_measure`
--

LOCK TABLES `unit_of_measure` WRITE;
/*!40000 ALTER TABLE `unit_of_measure` DISABLE KEYS */;
INSERT INTO `unit_of_measure` VALUES (' ','2020-11-14 00:00:00',' ','2020-11-14 00:00:00',0,1,'meter','length','m',1,1,'m','m','meter - desc'),(' ','2020-11-14 00:00:00',' ','2020-11-14 00:00:00',0,2,'gram','mass','g',1,1,'g','g','gram-desc'),('-','2020-12-11 20:15:55','-','2020-12-11 20:15:55',0,3,'GWh','Energy','GWh',0,1,'GWh','GWh','asdasd'),('-','2020-12-11 20:24:40','-','2020-12-11 20:24:40',0,4,'Number','mass','',1,0,'','','asdasda'),('-','2020-12-12 22:36:34','-','2020-12-12 22:36:34',0,5,'C','Electricity Generation','',1,0,'','','asdasd'),('-','2021-01-22 16:17:39','-','2021-01-22 16:17:39',0,6,'test','test','t',0,0,'','','test');
/*!40000 ALTER TABLE `unit_of_measure` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uom_conversion`
--

DROP TABLE IF EXISTS `uom_conversion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `uom_conversion` (
  `createdBy` varchar(255) NOT NULL,
  `createdOn` datetime NOT NULL,
  `editedBy` varchar(255) NOT NULL,
  `editedOn` datetime NOT NULL,
  `status` int NOT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  `conversionValue` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `unitOfMeasureId` int DEFAULT NULL,
  `relatedUnitOfMeasureId` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_7ba59a5ebc0c61f01867bad448a` (`unitOfMeasureId`),
  KEY `FK_03f1264dd113cfa3e4ece9d62f2` (`relatedUnitOfMeasureId`),
  CONSTRAINT `FK_03f1264dd113cfa3e4ece9d62f2` FOREIGN KEY (`relatedUnitOfMeasureId`) REFERENCES `unit_of_measure` (`id`),
  CONSTRAINT `FK_7ba59a5ebc0c61f01867bad448a` FOREIGN KEY (`unitOfMeasureId`) REFERENCES `unit_of_measure` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uom_conversion`
--

LOCK TABLES `uom_conversion` WRITE;
/*!40000 ALTER TABLE `uom_conversion` DISABLE KEYS */;
INSERT INTO `uom_conversion` VALUES ('-','2021-01-23 20:35:29','-','2021-01-23 20:35:29',0,15,100.000000,2,4),(' ','2020-11-14 00:00:00',' ','2020-11-14 00:00:00',0,16,1.000000,2,2);
/*!40000 ALTER TABLE `uom_conversion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `createdBy` varchar(255) NOT NULL,
  `createdOn` datetime NOT NULL,
  `editedBy` varchar(255) NOT NULL,
  `editedOn` datetime NOT NULL,
  `status` int NOT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  `firstName` varchar(255) NOT NULL,
  `lastName` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `designation` varchar(255) NOT NULL,
  `telephone` varchar(255) NOT NULL,
  `mobile` varchar(255) NOT NULL,
  `nic` varchar(255) NOT NULL,
  `salt` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `resetToken` varchar(255) NOT NULL,
  `userTypeId` int DEFAULT NULL,
  `institutionId` int DEFAULT NULL,
  `deletedAt` datetime(6) DEFAULT NULL,
  `canNotDelete` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `IDX_78a916df40e02a9deb1c4b75ed` (`username`),
  UNIQUE KEY `IDX_e12875dfb3b1d92d7d7c5377e2` (`email`),
  KEY `FK_29f29dffce2845a1abc901d4e85` (`userTypeId`),
  KEY `FK_ca0de218397aed2409d865d1580` (`institutionId`),
  CONSTRAINT `FK_29f29dffce2845a1abc901d4e85` FOREIGN KEY (`userTypeId`) REFERENCES `user_type` (`id`),
  CONSTRAINT `FK_ca0de218397aed2409d865d1580` FOREIGN KEY (`institutionId`) REFERENCES `institution` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('','2020-11-01 14:24:22','','2020-11-01 14:24:22',0,1,'Amal12','Kumara','rohan2@techtranz.com','rohan2@techtranz.com','Mr.','HOD1','+01 121 231-2311','+07 731 231-2322','0123456789','n/a','','',1,3,'2021-01-09 00:44:00.000000',0),('','2020-11-01 14:24:34','','2020-11-01 14:24:34',0,2,'Kamal','Perera','rohan3@techtranz.com','rohan3@techtranz.com','Mr.','HOD','0112123123','0773123123','0123456789','n/a','','',1,1,NULL,2),('','2020-11-03 17:20:22','','2020-11-03 17:20:22',0,3,'Sapumal','Disanayake','rohan1@techtranz.com','rohan1@techtranz.com','Mr','DOP','0112655677','0718567567','0718567567','n/a','','',1,1,NULL,0),('','2020-11-04 06:11:40','','2020-11-04 06:11:40',0,5,'Saman','Herath','saman@gmail.com','saman@gmail.com','Mr','HOD','0112858585','0718123123','0','n/a','','',1,1,NULL,0),('','2020-11-23 11:37:50','','2020-11-23 11:37:50',0,6,'Rohan','Map','r1@tt.com','r1@tt.com','Mr','HOD','+94 111 111-1111','+94 222 222-2222','121212122123','n/a','','',1,1,NULL,0),('','2020-11-23 11:40:56','','2020-11-23 11:40:56',0,7,'Rohan','Map2','r2@tt.com','r2@tt.com','Mr','Dr','+94 121 212-1223','+94 121 212-123_','111111111111','n/a','','',1,1,'2021-01-09 04:07:10.000000',0),('','2020-11-23 13:55:20','','2020-11-23 13:55:20',0,12,'Rohan','Map','aa@aa.aa','aa@aa.aa','Mr','HOD','+94 ___ ___-____','+94 ___ ___-____','1___________','$2b$10$X0tPmNIsTsU0jNd/4hAb7.','$2b$10$X0tPmNIsTsU0jNd/4hAb7.WOGpVJsdaZkf42xVQx7SBQ32gL1/43m','',1,1,NULL,0),('','2020-11-23 13:56:40','','2020-11-23 13:56:40',0,13,'Rohan','Map','aaaa@aa.aa','aaaa@aa.aa','Mr','HOD','+94 ___ ___-____','+94 ___ ___-____','1___________','$2b$10$QQRhnLyP/qRds560Enp6/e','$2b$10$QQRhnLyP/qRds560Enp6/evtS0euB0/Z3SIUIKPKPR.GeQTIH8V5i','7f0d79f4-3ebc-465e-9380-e1b789b67f9f',1,1,NULL,0),('-','2020-12-28 01:04:45','-','2020-12-28 01:04:45',0,19,'a','a','rohan2@techtranz.com2','rohan2@techtranz.com2','a','HOD','+94 111 111-1111','+94 111 111-1111','1111111_____','n/a','','',1,1,'2021-01-08 22:48:37.000000',0),('-','2020-12-28 01:28:45','-','2020-12-28 01:28:45',0,20,'Rohan','Map','a@aa.com','a@aa.com','Mr','HOD','+94 111 111-1111','+94 222 222-2222','333333333333','$2b$10$ywwsoImUkHbdSjHtpy..a.','$2b$10$ywwsoImUkHbdSjHtpy..a.fgCSie5nzKDxbb3hd0MiJSRlESwHsQq','',1,1,NULL,0),('-','2020-12-28 01:35:57','-','2020-12-28 01:35:57',0,21,'Rohan','Map','ab@aa.com','ab@aa.com','Mr','HOD','+94 111 111-1111','+94 222 222-2222','333333333333','$2b$10$m486/l9dnnTCooxdX3Kwre','$2b$10$m486/l9dnnTCooxdX3KwrebgXNX0sOiN7nB3QsGlcZJkR9k00YX4W','',1,1,NULL,0),('-','2020-12-28 01:58:28','-','2020-12-28 01:58:28',0,22,'Rohan','Map','abc@aa.com','abc@aa.com','Mr','HOD','+94 111 111-1111','+94 111 111-1111','111111111111','$2b$10$wp7GNdO1xYhJhMO/2UdF9u','$2b$10$wp7GNdO1xYhJhMO/2UdF9u/Dd54wvOL5bsWLyqEWgbXNEQRrnT8Wy','',1,1,NULL,0),('-','2020-12-28 02:02:21','-','2020-12-28 02:02:21',0,23,'Rohan','Map','abcd@aa.com','abcd@aa.com','Mr','HOD','+94 111 111-1111','+94 111 111-1111','111111111111','$2b$10$U15zEiGhvAOK9Win/uPt5O','$2b$10$U15zEiGhvAOK9Win/uPt5Oy0LIE6nC.j94CK1J4x0WyUlqbCO2FOK','',1,1,NULL,0),('-','2020-12-28 02:30:39','-','2020-12-28 02:30:39',0,24,'aa','aa','abcde@aa.com','abcde@aa.com','aa','HOD','+94 ___ ___-____','+94 ___ ___-____','1___________','$2b$10$TCMl1l/CkXmsG760d1njue','$2b$10$TCMl1l/CkXmsG760d1njuekifzuZyGcjcZpMBa0ZuPIkf1fcD37li','',1,1,'2021-01-08 22:48:46.000000',0),('-','2020-12-28 04:24:20','-','2020-12-28 04:24:20',0,25,'Ron','Map','rpm1@tt.com','rpm1@tt.com','Mr','HOD','+94 111 111-1111','+94 222 222-2222','111111111111','$2b$10$yzIGyLWtYxT82XR655In4.','$2b$10$yzIGyLWtYxT82XR655In4.DA5pvr6Mi987398MACQmzSKZdl4Q0li','',4,14,NULL,0),('-','2020-12-30 15:55:03','-','2020-12-30 15:55:03',0,42,'Rohan','DEO','rpmdsndeo1@yopmail.com','rpmdsndeo1@yopmail.com','Mr','HOD','+94 111 111-1111','+94 222 222-2222','111111111111','n/a','','',4,1,NULL,0),('-','2020-12-30 16:01:50','-','2020-12-30 16:01:50',0,43,'Rohan','Map','rpmdsndeo2@yopmail.com','rpmdsndeo2@yopmail.com','Mr','HOD','+94 111 111-1111','+94 111 111-1111','1___________','$2b$10$YONtjfqdUlPvCdXvSkbmDe','$2b$10$YONtjfqdUlPvCdXvSkbmDe054ID//e2WF5u2YqaYAND6U8z3E7Fuq','',4,1,NULL,0),('-','2020-12-30 16:20:30','-','2020-12-30 16:20:30',0,44,'Rohan','Map','rpmdsndeo3@yopmail.com','rpmdsndeo3@yopmail.com','Mr','HOD','+94 111 111-1111','+94 111 111-1111','1___________','$2b$10$vh6dL6Gw98EUIW.wS.Nu/e','$2b$10$vh6dL6Gw98EUIW.wS.Nu/eiKF7nEvvzPFtKk.QDUWGQ9ph6jaipm2','',4,1,NULL,0),('-','2020-12-30 17:50:50','-','2020-12-30 17:50:50',0,45,'Rohan','Map','rpmdsndeo4@yopmail.com','rpmdsndeo4@yopmail.com','Mr','HOD','+94 111 111-1111','+94 111 111-1111','111111111111','n/a','','',3,1,NULL,0),('-','2020-12-30 18:05:24','-','2020-12-30 18:05:24',0,46,'Rohan','Map','narek@theselectapp.com','narek@theselectapp.com','Mr','HOD','+94 ___ ___-____','+94 ___ ___-____','1___________','$2b$10$onhJiI8JQ.uwPDA1ocsBYe','$2b$10$onhJiI8JQ.uwPDA1ocsBYeeKK8fWmc1HJ3zmFoQjv/F9fiAgoeroy','',1,1,NULL,0),('-','2020-12-30 18:05:24','-','2020-12-30 18:05:24',0,47,'Rohan','Map','superadmin@ccsdsnlk.lk','superadmin@ccsdsnlk.lk','Mr','HOD','+94 ___ ___-____','+94 ___ ___-____','1___________','$2b$10$onhJiI8JQ.uwPDA1ocsBYe','$2b$10$onhJiI8JQ.uwPDA1ocsBYeeKK8fWmc1HJ3zmFoQjv/F9fiAgoeroy','',1,1,NULL,0),('-','2021-01-02 11:00:33','-','2021-01-02 11:00:33',0,48,'Rohan','Map','abc@abc.com','abc@abc.com','Mr.','HOD','+94 773 456-766_','+94 773 456-766_','1___________','$2b$10$PiIWNjfidjc13zLXA5RIau','$2b$10$PiIWNjfidjc13zLXA5RIau9fX.2XSxDkbknc1rUlXAgdEF05Di31u','',3,1,NULL,0),('-','2021-01-02 13:29:57','-','2021-01-02 13:29:57',0,49,'CCS','Admin1','ccsadmin1@aa.com','ccsadmin1@aa.com','Mr.','aa','+94 111 111-111','+94 111 111-111','111111111111','$2b$10$Q1mk2GghwvyxUIKBsbW0nO','$2b$10$Q1mk2GghwvyxUIKBsbW0nOlSretQCkU7iY01ap1KzAVv56QtqUa4y','',1,2,'2021-01-09 04:07:18.000000',0),('-','2021-01-03 08:19:26','-','2021-01-03 08:19:26',0,50,'Rohan','Map','ab01031@abc.com','ab01031@abc.com','Mr.','HOD','+94 11 111-1111','+94 22-222-2222','111111111111','$2b$10$/cDvPyjqjvC4mrMLCI1Wqu','$2b$10$/cDvPyjqjvC4mrMLCI1WquxLrcDMSM6GjThYyjDYq6yihYxTRmE2G','',1,1,NULL,0),('-','2021-01-03 13:10:56','-','2021-01-03 13:10:56',0,51,'INS_admin1','INS_admin1','insadmin@gmail.com','insadmin@gmail.com','Mr.','HOD','+94 11-111-1111','+94 22-222-2222','111111111111','$2b$10$spbhpcUmRcrIMK/y5FAmrO','$2b$10$spbhpcUmRcrIMK/y5FAmrOP5Q1Hn7AGpMWusXDAE20joOn00DY53i','',3,13,NULL,1),('-','2021-01-03 14:00:05','-','2021-01-03 14:00:05',0,52,'Test deo','Deo','testdeo1@gmail.com','testdeo1@gmail.com','Mr.','HOD','+94 11-111-1111','+94 22-222-2222','111111111111','$2b$10$2K.wYniHVThaZL/2dI6MI.','$2b$10$2K.wYniHVThaZL/2dI6MI.KUxI9BvFTiIY/RWRDKdz5w6RjD1dPU.','',4,13,NULL,0),('-','2021-01-03 14:00:52','-','2021-01-03 14:00:52',0,53,'Test deo','Deo','testdeo2@gmail.com','testdeo2@gmail.com','Mr.','HOD','+94 11-111-1111','+94 22-222-2222','111111111111','$2b$10$JliACJxJB2C5Vco6f8KWlO','$2b$10$JliACJxJB2C5Vco6f8KWlO3OO58WESygkYbCUcj7jolTTTqRSJCES','',4,13,'2021-01-08 22:54:17.000000',0),('-','2021-01-03 14:05:52','-','2021-01-03 14:05:52',0,54,'Test deo','Deo','testdeo3@gmail.com','testdeo3@gmail.com','Mr.','HOD','+94 11-111-1111','+94 22-222-2222','111111111111','$2b$10$/3arBMIydD5MTwuX8svlne','$2b$10$/3arBMIydD5MTwuX8svlne3VveGZLWl/53PyhUEtEBmBf23Hft6KG','',4,2,'2021-01-08 22:53:29.000000',0),('-','2021-01-03 14:06:44','-','2021-01-03 14:06:44',0,55,'Test deo','Deo','testdeo4@gmail.com','testdeo4@gmail.com','Mr.','HOD','+94 11-111-1111','+94 22-222-2222','111111111111','$2b$10$b3L5rT2l8S3/jgwTawO/w.','$2b$10$b3L5rT2l8S3/jgwTawO/w.Q.36SAvAXtSeIwIg7U12Hhsrwx327PS','',4,13,'2021-01-08 22:41:42.000000',0),('-','2021-01-04 07:41:41','-','2021-01-04 07:41:41',0,56,'Test','test 1','test@test.com','test@test.com','Mr.','1','+94 11-111-1111','+94 22-222-2222','111111111111','$2b$10$2Tz8rjvqQoXCkDTru/oho.','$2b$10$2Tz8rjvqQoXCkDTru/oho.sNjRGhCv.zr1pfGdVX6HvlFRD5K/fZu','',1,1,'2021-01-08 22:52:38.000000',0),('-','2021-01-07 18:53:30','-','2021-01-07 18:53:30',0,57,'Rohan','Map','aaaassn@aaa.com','aaaassn@aaa.com','Mr.','HOD','+94 11-111-1111','+94 22-222-2222','111111111111','$2b$10$wy2Z9XYt338iDI/BFep9iu','$2b$10$wy2Z9XYt338iDI/BFep9iuZdtgRFeDtIHlKmUPnmAa.qKQrbv6A8S','',1,17,NULL,0),('-','2021-01-07 18:55:59','-','2021-01-07 18:55:59',0,58,'Rohan','Map','aqw@aaa.aa','aqw@aaa.aa','Mr.','HOD','+94 __-___-____','+94 __-___-____','111111111111','$2b$10$.ivMQ56dZOejL8je2KN8X.','$2b$10$.ivMQ56dZOejL8je2KN8X.8osftDefF7GjekRrhn9BFFzZMAbsfm2','',1,17,NULL,0),('-','2021-01-08 21:36:22','-','2021-01-08 21:36:22',0,59,'Rohan','Map','awa@aws.aa','awa@aws.aa','Mr.','HOD','+94 11-111-1111','+94 11-111-1111','111111111111','$2b$10$nt1DZYDbhZ6VP7bEeF7aue','$2b$10$nt1DZYDbhZ6VP7bEeF7aue0udvJc3Ttn4ppLOp0wif2tiu0ChyU0y','',1,17,NULL,0),('-','2021-01-08 23:41:58','-','2021-01-08 23:41:58',0,60,'Rohan','Map','aws@aws.conm','aws@aws.conm','Mr.','HOD','+94 11-111-1111','+94 11-111-1111','111111111111','n/a','','',1,1,'2021-01-08 23:43:00.000000',0),('-','2021-01-08 23:45:36','-','2021-01-08 23:45:36',0,61,'aaaa','bbbbbbbbb','aws@asw.com','aws@asw.com','Mr.','eod','+94 11-111-1111','+94 22-222-2222','111111111111','n/a','','',1,1,NULL,0),('-','2021-01-09 00:36:43','-','2021-01-09 00:36:43',0,62,'Rohan','Map','abcia@tt.lk','abcia@tt.lk','Mr.','HOD','+94 __-___-____','+94 __-___-____','111111111111','$2b$10$M.mvWicbDkiHk8zJuKOs0u','$2b$10$M.mvWicbDkiHk8zJuKOs0u2f6v1AjGNlkpDXuS8xvkPE8MEgtt8wa','',3,3,NULL,0),('-','2021-01-09 00:44:36','-','2021-01-09 00:44:36',0,63,'Rohandeo','Mapdeo','abcdeo@tt.lk','abcdeo@tt.lk','Mr.','HOD','+94 __-___-____','+94 __-___-____','1___________','$2b$10$tARQ9SAk13tbkNoIQMYHyu','$2b$10$tARQ9SAk13tbkNoIQMYHyukTOYDXJEayrf.SBDtU3NtgQyUbE8IBK','',4,3,NULL,0),('-','2021-01-09 00:45:44','-','2021-01-09 00:45:44',0,64,'Rohan','Map','abcia1@tt.lk','abcia1@tt.lk','Mr.','HOD','+94 11-111-1111','+94 11-111-1111','111111111111','$2b$10$bhsC4.uqg0vxQq0kxH2ojO','$2b$10$bhsC4.uqg0vxQq0kxH2ojOhpgYquoobt5y/RZ0UadaF16rrGG1aBC','',4,3,NULL,0),('-','2021-01-09 00:47:12','-','2021-01-09 00:47:12',0,65,'Rohan','Map','abcia112@tt.lk','abcia112@tt.lk','Mr.','HOD','+94 __-___-____','+94 __-___-____','1___________','$2b$10$VAipxu1D2mh3BvJXmQiKOu','$2b$10$VAipxu1D2mh3BvJXmQiKOuG6cZz25mgH2AeNLtV13ZzS0mDPo4MGa','',4,3,NULL,0),('-','2021-01-09 19:06:42','-','2021-01-09 19:06:42',0,66,'aaaa','aaaaaaaaaaaaa','afa.aa@aa.aa','afa.aa@aa.aa','Mrs.','HOD','+94 __-___-____','+94 __-___-____','1___________','$2b$10$quR5j.A3ZfUzSBNsQ4H3R.','$2b$10$quR5j.A3ZfUzSBNsQ4H3R.U9NzdnxSRr/UYbgR3i/mkwFSe2Kk.Ua','',4,1,NULL,0),('-','2021-01-14 11:29:11','-','2021-01-14 11:29:11',0,67,'Rohan','Mapatuna','rohanprabath123@gmail.com','rohanprabath123@gmail.com','Mr.','HOD','+94 11-111-1111','+94 22-222-2222','111111111111','$2b$10$53WWvg1B2g/2SagOofXNJu','$2b$10$53WWvg1B2g/2SagOofXNJujIk39jvIvmZAikEvBS8Ic9taBIyqONa','',1,1,NULL,0),('-','2021-01-14 11:30:15','-','2021-01-14 11:30:15',0,68,'Rohan','Map','rohanprabath1234@gmail.com','rohanprabath1234@gmail.com','Mr.','111','+94 11-111-1111','+94 22-222-2222','111111111111','$2b$10$/0l4n7WKJL77VXa8eXNii.','$2b$10$/0l4n7WKJL77VXa8eXNii.y.QfKchkYHhDPYwoC8sutxGV6Cod1eu','',1,1,NULL,0),('-','2021-01-17 22:20:55','-','2021-01-17 22:20:55',0,69,'aaa','bbb','rohanprabath@gmail.com','rohanprabath@gmail.com','Mr.','HOD','94','94','1___________','$2b$10$htnbfLC1Ma0f5GLYgehS0u','$2b$10$htnbfLC1Ma0f5GLYgehS0u2AJydKsvqA0BRL0nmumyRFCL8ILO9ai','',1,1,NULL,0),('-','2021-01-26 07:44:02','-','2021-01-26 07:44:02',0,70,'Abc','xyz','avx@aax.xsd','avx@aax.xsd','Mr.','DEO','+94 11-111-1111','+94 22-222-2222','111111111111','$2b$10$vwhvzjDYWb4mR/L29tvgbe','$2b$10$vwhvzjDYWb4mR/L29tvgbeAVxcOod2VYLqAwvWAlnHZGGngkKtiw2','',2,1,NULL,0),('-','2021-01-26 07:45:01','-','2021-01-26 07:45:01',0,71,'sdjd;lsk',';l','qwe@qwe.aew','qwe@qwe.aew','Mr.','HOD','+94 11-111-1111','+94 22-222-2222','111111111111','$2b$10$z5L4S7m01nG70xybsAvFfe','$2b$10$z5L4S7m01nG70xybsAvFfeou9DxOfupG0gq7IOMGVglEODJfXKE3a','',4,1,NULL,0),('-','2021-01-26 07:46:17','-','2021-01-26 07:46:17',0,72,'Abc','aaa','abc.asdwaaaa@gmail.com','abc.asdwaaaa@gmail.com','Mr.','111','+94 11-111-1111','+94 22-222-2222','111111111111','$2b$10$ehW9qjlZPIRpSxKfe6RWKu','$2b$10$ehW9qjlZPIRpSxKfe6RWKuGev0typF/9jf2mFj72J2x6ru3K96KKm','',4,1,NULL,0),('-','2021-01-26 07:53:31','-','2021-01-26 07:53:31',0,73,'Test','test123','test123xxxxxxxxxx@gmail.com','test123xxxxxxxxxx@gmail.com','Mr.','1','+94 11-111-1111','+94 22-222-2222','111111111111','$2b$10$B7QtFVxD0Dyp9F0WHzVQIe','$2b$10$B7QtFVxD0Dyp9F0WHzVQIe3sUuS0SZOBivc36r0UN1LUEcHegkADi','',4,1,NULL,0),('-','2021-01-26 07:54:37','-','2021-01-26 07:54:37',0,74,'Test','test123','test123xxxxxxxxxxzzz@gmail.com','test123xxxxxxxxxxzzz@gmail.com','Mr.','1','+94 11-111-1111','+94 22-222-2222','111111111111','$2b$10$sBYuNcZMGpG9LIQ5PADvLO','$2b$10$sBYuNcZMGpG9LIQ5PADvLOvL4npjpHt1oeQaCRkcV7DMM0sM5EPV2','',4,1,NULL,0),('-','2021-01-26 08:01:15','-','2021-01-26 08:01:15',0,75,'A','B','aq123@aaaa.aa','aq123@aaaa.aa','Mr.','HOD','+94 11-111-1111','+94 22-222-2222','111111111111','$2b$10$QSM.3/w5CuM..0sTEjWnO.','$2b$10$QSM.3/w5CuM..0sTEjWnO.3z3tWKhPSr00/cH/yhhqnk9qi2o5Tue','',4,1,NULL,0),('-','2021-01-26 08:11:29','-','2021-01-26 08:11:29',0,76,'A','B','aq1234@aaaa.aa','aq1234@aaaa.aa','Mr.','HOD','+94 11-111-1111','+94 22-222-2222','111111111111','$2b$10$epY44QF4vC0paeAsYhAuke','$2b$10$epY44QF4vC0paeAsYhAukepmVNnzioG1H6luGkwW7WIU/dEIqTS2C','',4,1,NULL,0),('-','2021-01-26 08:14:13','-','2021-01-26 08:14:13',0,77,'Rohan','Map','test123qaz@aaaa.asx','test123qaz@aaaa.asx','Mr.','1111','+94 11-111-1111','+94 22-222-2222','222222222222','$2b$10$66rU/iH2oSKayFUt7vF5lu','$2b$10$66rU/iH2oSKayFUt7vF5lu1I.Pf.PXipbIEFKz22rMTq8COi42hFm','',4,1,NULL,0),('-','2021-01-26 08:18:12','-','2021-01-26 08:18:12',0,78,'test','tes2','test123weqwe@gmail.comx','test123weqwe@gmail.comx','Mr.','HOD','+94 11-111-1111','+94 22-222-2222','111111111111','$2b$10$u/Q/jkoNAEZmKd.iG7qFLu','$2b$10$u/Q/jkoNAEZmKd.iG7qFLughb3scKlAt..asPansWn3bTyfli38FO','',4,1,NULL,0);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_type`
--

DROP TABLE IF EXISTS `user_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_type` (
  `createdBy` varchar(255) NOT NULL,
  `createdOn` datetime NOT NULL,
  `editedBy` varchar(255) NOT NULL,
  `editedOn` datetime NOT NULL,
  `status` int NOT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `sortOrder` int NOT NULL,
  `description` varchar(2500) NOT NULL,
  `userRoleIdIdentity` varchar(255) NOT NULL,
  `userRoleNameIdentity` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_type`
--

LOCK TABLES `user_type` WRITE;
/*!40000 ALTER TABLE `user_type` DISABLE KEYS */;
INSERT INTO `user_type` VALUES ('','0000-00-00 00:00:00','','0000-00-00 00:00:00',0,1,'CCS-Admin',1,'','a5c43f88-5486-4532-8de5-47cb43fe1236','ccs-admin'),('','0000-00-00 00:00:00','','0000-00-00 00:00:00',0,2,'CCS-DEO',1,'','',''),('','0000-00-00 00:00:00','','0000-00-00 00:00:00',0,3,'Institutional Admin',1,'','715029ef-5d6a-46c2-ab77-3735ff5921bb','ins-admin'),('','0000-00-00 00:00:00','','0000-00-00 00:00:00',0,4,'Institutional DEO',1,'','a3526cfa-1aeb-4834-a715-309626797c42','ins-deo');
/*!40000 ALTER TABLE `user_type` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-01-29  8:34:58

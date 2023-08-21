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
  `description` varchar(255) NOT NULL,
  `sortOrder` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `climate_change_data_category`
--

LOCK TABLES `climate_change_data_category` WRITE;
/*!40000 ALTER TABLE `climate_change_data_category` DISABLE KEYS */;
INSERT INTO `climate_change_data_category` VALUES (' ','2020-11-14 00:00:00',' ','2020-11-14 00:00:00',0,1,'Weather & Climatic Data','Weather & Climatic Data',1),(' ','2020-11-14 00:00:00',' ','2020-11-14 00:00:00',0,2,'Mitigation data','Mitigation data',1),(' ','2020-11-14 00:00:00',' ','2020-11-14 00:00:00',0,3,'Adaptation Data','Adaptation Data',1),(' ','2020-11-14 00:00:00',' ','2020-11-14 00:00:00',0,4,'Disaster Data','Disaster Data',1),(' ','2020-11-14 00:00:00',' ','2020-11-14 00:00:00',0,5,'Information on Policies and Regulations','Information on Policies and Regulations',1);
/*!40000 ALTER TABLE `climate_change_data_category` ENABLE KEYS */;
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
  `description` varchar(255) NOT NULL,
  `sortOrder` int NOT NULL,
  `multificationFactor` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `currency`
--

LOCK TABLES `currency` WRITE;
/*!40000 ALTER TABLE `currency` DISABLE KEYS */;
INSERT INTO `currency` VALUES (' ','2020-11-20 00:00:00',' ','2020-11-20 00:00:00',1,1,'C1','C1',1,1);
/*!40000 ALTER TABLE `currency` ENABLE KEYS */;
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
  `description` varchar(255) NOT NULL,
  `sortOrder` int NOT NULL,
  `provinceId` int DEFAULT NULL,
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
INSERT INTO `district` VALUES ('','0000-00-00 00:00:00','','0000-00-00 00:00:00',0,1,'Kandy','Kandy',1,1),('','0000-00-00 00:00:00','','0000-00-00 00:00:00',0,2,'Matale','Matale',2,1),('','0000-00-00 00:00:00','','0000-00-00 00:00:00',0,3,'Nuwara Eliya','Nuwara Eliya',3,1),('','0000-00-00 00:00:00','','0000-00-00 00:00:00',0,4,'Ampara','Ampara',4,2),('','0000-00-00 00:00:00','','0000-00-00 00:00:00',0,5,'Batticaloa','Batticaloa',5,2),('','0000-00-00 00:00:00','','0000-00-00 00:00:00',0,6,'Trincomalee','Trincomalee',6,2),('','0000-00-00 00:00:00','','0000-00-00 00:00:00',0,7,'Anuradhapura','Anuradhapura',7,3),('','0000-00-00 00:00:00','','0000-00-00 00:00:00',0,8,'Polonnaruwa','Polonnaruwa',8,3),('','0000-00-00 00:00:00','','0000-00-00 00:00:00',0,9,'Kurunegala','Kurunegala',9,4),('','0000-00-00 00:00:00','','0000-00-00 00:00:00',0,10,'Puttalam','Puttalam',10,4),('','0000-00-00 00:00:00','','0000-00-00 00:00:00',0,11,'Jaffna','Jaffna',11,5),('','0000-00-00 00:00:00','','0000-00-00 00:00:00',0,12,'Kilinochchi','Kilinochchi',12,5),('','0000-00-00 00:00:00','','0000-00-00 00:00:00',0,13,'Mannar','Mannar',13,5),('','0000-00-00 00:00:00','','0000-00-00 00:00:00',0,14,'Mullaitivu','Mullaitivu',14,5),('','0000-00-00 00:00:00','','0000-00-00 00:00:00',0,15,'Vavuniya','Vavuniya',15,5),('','0000-00-00 00:00:00','','0000-00-00 00:00:00',0,16,'Kegalle','Kegalle',16,6),('','0000-00-00 00:00:00','','0000-00-00 00:00:00',0,17,'Ratnapura','Ratnapura',17,6),('','0000-00-00 00:00:00','','0000-00-00 00:00:00',0,18,'Galle','Galle',18,7),('','0000-00-00 00:00:00','','0000-00-00 00:00:00',0,19,'Hambantota','Hambantota',19,7),('','0000-00-00 00:00:00','','0000-00-00 00:00:00',0,20,'Matara','Matara',20,7),('','0000-00-00 00:00:00','','0000-00-00 00:00:00',0,21,'Badulla','Badulla',21,8),('','0000-00-00 00:00:00','','0000-00-00 00:00:00',0,22,'Moneragala','Moneragala',22,8),('','0000-00-00 00:00:00','','0000-00-00 00:00:00',0,23,'Colombo','Colombo',23,9),('','0000-00-00 00:00:00','','0000-00-00 00:00:00',0,24,'Gampaha','Gampaha',24,9),('','0000-00-00 00:00:00','','0000-00-00 00:00:00',0,25,'Kalutara','Kalutara',25,9);
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
  `description` varchar(255) NOT NULL,
  `sortOrder` int NOT NULL,
  `districtId` int DEFAULT NULL,
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
INSERT INTO `divisional_secretariat` VALUES ('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,1,'Sammanthurai','Sammanthurai',1,4),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,2,'Addalaichenai','Addalaichenai',1,4),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,3,'Nintavur','Nintavur',1,4),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,4,'Damana','Damana',1,4),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,5,'Alaiyadivembu','Alaiyadivembu',1,4),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,6,'Lahugala','Lahugala',1,4),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,7,'Irakkamam','Irakkamam',1,4),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,8,'Saindamarudu','Saindamarudu',1,4),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,9,'Padiyathalawa','Padiyathalawa',1,4),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,10,'Karaitivu','Karaitivu',1,4),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,11,'Kalmunai','Kalmunai',1,4),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,12,'Dehiaththa','Dehiaththa',1,4),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,13,'Akkaraipattu','Akkaraipattu',1,4),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,14,'Navithanveli','Navithanveli',1,4),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,15,'Uhana','Uhana',1,4),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,16,'Mahaoya','Mahaoya',1,4),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,17,'Ampara','Ampara',1,4),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,18,'Kalmunai','Kalmunai',1,4),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,19,'Pothuwil','Pothuwil',1,4),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,20,'Thirukkowil','Thirukkowil',1,4),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,21,'Rambewa','Rambewa',1,7),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,22,'Galenbindunuwewa','Galenbindunuwewa',1,7),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,23,'Nuwaragam','Nuwaragam',1,7),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,24,'Nochchiyagama','Nochchiyagama',1,7),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,25,'Horowpothana','Horowpothana',1,7),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,26,'Rajanganaya','Rajanganaya',1,7),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,27,'Nuwaragam','Nuwaragam',1,7),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,28,'Nachchaduwa','Nachchaduwa',1,7),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,29,'Thambutthegama','Thambutthegama',1,7),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,30,'Kekirawa','Kekirawa',1,7),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,31,'Medawachchiya','Medawachchiya',1,7),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,32,'Mahawilachchiya','Mahawilachchiya',1,7),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,33,'Mihinthale','Mihinthale',1,7),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,34,'Ipalogama','Ipalogama',1,7),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,35,'Thirappane','Thirappane',1,7),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,36,'Kahatagasdigiliya','Kahatagasdigiliya',1,7),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,37,'Thalawa','Thalawa',1,7),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,38,'Kebithigollewa','Kebithigollewa',1,7),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,39,'Galnewa','Galnewa',1,7),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,40,'Padaviya','Padaviya',1,7),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,41,'Palagala','Palagala',1,7),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,42,'Palugaswewa','Palugaswewa',1,7),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,43,'Badulla','Badulla',1,21),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,44,'Kandaketiya','Kandaketiya',1,21),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,45,'Bandarawela','Bandarawela',1,21),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,46,'Haputale','Haputale',1,21),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,47,'Soranathota','Soranathota',1,21),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,48,'Meegahakiula','Meegahakiula',1,21),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,49,'Rideemaliyadda','Rideemaliyadda',1,21),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,50,'Passara','Passara',1,21),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,51,'Lunugala','Lunugala',1,21),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,52,'Ella','Ella',1,21),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,53,'Welimada','Welimada',1,21),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,54,'Uva','Uva',1,21),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,55,'Haliela','Haliela',1,21),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,56,'Haldunmulla','Haldunmulla',1,21),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,57,'Mahiyanganaya','Mahiyanganaya',1,21),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,58,'Manmunai','Manmunai',1,5),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,59,'Koralaipattu','Koralaipattu',1,5),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,60,'Koralaipattu','Koralaipattu',1,5),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,61,'Manmunaipattu','Manmunaipattu',1,5),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,62,'Eravurpattu','Eravurpattu',1,5),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,63,'Manmunai','Manmunai',1,5),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,64,'Manmunai','Manmunai',1,5),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,65,'Kaththankudy','Kaththankudy',1,5),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,66,'Manmunai','Manmunai',1,5),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,67,'Porativu','Porativu',1,5),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,68,'Koralaipattu','Koralaipattu',1,5),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,69,'Koralaipattu','Koralaipattu',1,5),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,70,'Koralaipattu','Koralaipattu',1,5),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,71,'Eravur','Eravur',1,5),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,72,'Maharagama','Maharagama',1,23),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,73,'Thimbirigasyaya','Thimbirigasyaya',1,23),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,74,'Kesbewa','Kesbewa',1,23),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,75,'Sri','Sri',1,23),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,76,'Colombo','Colombo',1,23),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,77,'Padukka','Padukka',1,23),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,78,'Ratmalana','Ratmalana',1,23),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,79,'Homagama','Homagama',1,23),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,80,'Kolonnawa','Kolonnawa',1,23),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,81,'Kaduwela','Kaduwela',1,23),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,82,'Seethawaka-Hanwella','Seethawaka-Hanwella',1,23),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,83,'Dehiwala','Dehiwala',1,23),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,84,'Moratuwa','Moratuwa',1,23),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,85,'Balapitiya','Balapitiya',1,18),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,86,'Thawalama','Thawalama',1,18),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,87,'Yakkalamulla','Yakkalamulla',1,18),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,88,'Akmeemana','Akmeemana',1,18),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,89,'Elpitiya','Elpitiya',1,18),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,90,'Ambalangoda','Ambalangoda',1,18),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,91,'Karandeniya','Karandeniya',1,18),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,92,'Nagoda','Nagoda',1,18),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,93,'Galle','Galle',1,18),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,94,'Bope-Poddala','Bope-Poddala',1,18),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,95,'Habaraduwa','Habaraduwa',1,18),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,96,'Baddegama','Baddegama',1,18),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,97,'Hikkaduwa','Hikkaduwa',1,18),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,98,'Gonapinuwala','Gonapinuwala',1,18),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,99,'Valivitiya-Divithura','Valivitiya-Divithura',1,18),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,100,'Bentota','Bentota',1,18),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,101,'Niyagama','Niyagama',1,18),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,102,'Imaduwa','Imaduwa',1,18),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,103,'Neluwa','Neluwa',1,18),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,104,'Gampaha','Gampaha',1,24),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,105,'Attanagalla','Attanagalla',1,24),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,106,'Biyagama','Biyagama',1,24),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,107,'Divulapitiya','Divulapitiya',1,24),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,108,'Negombo','Negombo',1,24),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,109,'Dompe/Weke/Kirindiwala','Dompe/Weke/Kirindiwala',1,24),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,110,'Katana','Katana',1,24),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,111,'Wattala','Wattala',1,24),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,112,'Kelaniya','Kelaniya',1,24),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,113,'Ja-Ela','Ja-Ela',1,24),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,114,'Mirigama','Mirigama',1,24),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,115,'Minuwangoda','Minuwangoda',1,24),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,116,'Mahara','Mahara',1,24),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,117,'Beliatta','Beliatta',1,19),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,118,'Hambantota','Hambantota',1,19),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,119,'Tangalle','Tangalle',1,19),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,120,'Walasmulla','Walasmulla',1,19),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,121,'Weeraketiya','Weeraketiya',1,19),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,122,'Lunugamwehera','Lunugamwehera',1,19),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,123,'Okewela','Okewela',1,19),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,124,'Angunakolapelessa','Angunakolapelessa',1,19),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,125,'Katuwana','Katuwana',1,19),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,126,'Sooriyawewa','Sooriyawewa',1,19),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,127,'Tissamaharamaya','Tissamaharamaya',1,19),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,128,'Ambalantota','Ambalantota',1,19),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,129,'Karainagar','Karainagar',1,11),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,130,'Valikamam','Valikamam',1,11),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,131,'Valikamam','Valikamam',1,11),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,132,'Valikamam','Valikamam',1,11),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,133,'Valikamam','Valikamam',1,11),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,134,'Valikamam','Valikamam',1,11),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,135,'Nallur','Nallur',1,11),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,136,'Thenmaradchi','Thenmaradchi',1,11),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,137,'Wadamarachchi','Wadamarachchi',1,11),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,138,'Wadamarachchi','Wadamarachchi',1,11),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,139,'Wadamarachchi','Wadamarachchi',1,11),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,140,'Jaffna','Jaffna',1,11),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,141,'Island','Island',1,11),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,142,'Island','Island',1,11),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,143,'Delft','Delft',1,11),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,144,'Baduraliya-PalindaNuwara','Baduraliya-PalindaNuwara',1,25),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,145,'Millaniya','Millaniya',1,25),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,146,'Mathugama','Mathugama',1,25),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,147,'Panadura','Panadura',1,25),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,148,'Bandaragama','Bandaragama',1,25),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,149,'Horana','Horana',1,25),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,150,'Madurawala','Madurawala',1,25),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,151,'Beruwala','Beruwala',1,25),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,152,'Walallawita','Walallawita',1,25),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,153,'Dodangoda','Dodangoda',1,25),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,154,'Kalutara','Kalutara',1,25),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,155,'Ingiriya','Ingiriya',1,25),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,156,'Bulathsinhala','Bulathsinhala',1,25),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,157,'Agalawatta','Agalawatta',1,25),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,158,'Deltota','Deltota',1,1),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,159,'Thumpane','Thumpane',1,1),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,160,'Kundasale','Kundasale',1,1),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,161,'Udunuwara','Udunuwara',1,1),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,162,'Gangawatakorale','Gangawatakorale',1,1),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,163,'Pathahewaheta','Pathahewaheta',1,1),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,164,'Harispattuwa','Harispattuwa',1,1),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,165,'Akurana','Akurana',1,1),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,166,'Hatharaliyadda','Hatharaliyadda',1,1),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,167,'Pasbage','Pasbage',1,1),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,168,'Panwila','Panwila',1,1),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,169,'Doluwa','Doluwa',1,1),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,170,'Poojapitiya','Poojapitiya',1,1),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,171,'Pathadumbara','Pathadumbara',1,1),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,172,'Udapalatha','Udapalatha',1,1),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,173,'Ganga','Ganga',1,1),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,174,'Udadumbara','Udadumbara',1,1),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,175,'Yatinuwara','Yatinuwara',1,1),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,176,'Medadumbara','Medadumbara',1,1),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,177,'Minipe','Minipe',1,1),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,178,'Galigamuwa','Galigamuwa',1,16),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,179,'Kegalle','Kegalle',1,16),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,180,'Aranayake','Aranayake',1,16),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,181,'Dehiowita','Dehiowita',1,16),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,182,'Warakapola','Warakapola',1,16),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,183,'Rambukkana','Rambukkana',1,16),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,184,'Yatiyantota','Yatiyantota',1,16),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,185,'Bulathkohupitiya','Bulathkohupitiya',1,16),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,186,'Mawanella','Mawanella',1,16),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,187,'Deraniyagala','Deraniyagala',1,16),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,188,'Ruwanwella','Ruwanwella',1,16),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,189,'Pachchilaipallai','Pachchilaipallai',1,12),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,190,'Karachchi','Karachchi',1,12),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,191,'Kandawalai','Kandawalai',1,12),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,192,'Poonakary','Poonakary',1,12),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,193,'Maspotha','Maspotha',1,9),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,194,'Kuliyapitiya','Kuliyapitiya',1,9),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,195,'Polgahawela','Polgahawela',1,9),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,196,'Polpithigama','Polpithigama',1,9),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,197,'Mallawapitiya','Mallawapitiya',1,9),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,198,'Bmunakotuwa','Bmunakotuwa',1,9),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,199,'Kuliyapitiya','Kuliyapitiya',1,9),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,200,'Alwwa','Alwwa',1,9),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,201,'Udubaddawa','Udubaddawa',1,9),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,202,'Kotawehera','Kotawehera',1,9),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,203,'Bingiriya','Bingiriya',1,9),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,204,'Ambanpola','Ambanpola',1,9),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,205,'Nikaweratiya','Nikaweratiya',1,9),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,206,'Mawathagama','Mawathagama',1,9),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,207,'Narammala','Narammala',1,9),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,208,'Kurunagala','Kurunagala',1,9),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,209,'Ganewatta','Ganewatta',1,9),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,210,'Wariyapola','Wariyapola',1,9),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,211,'Ibbagamuwa','Ibbagamuwa',1,9),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,212,'Panduwasnuwara','Panduwasnuwara',1,9),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,213,'Pannala','Pannala',1,9),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,214,'Panduwasnuwara','Panduwasnuwara',1,9),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,215,'Rasnayakapura','Rasnayakapura',1,9),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,216,'Giribawa','Giribawa',1,9),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,217,'Mahawa','Mahawa',1,9),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,218,'Weerambugedara','Weerambugedara',1,9),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,219,'Kobeigane','Kobeigane',1,9),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,220,'Ridigama','Ridigama',1,9),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,221,'Ehetuwewa','Ehetuwewa',1,9),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,222,'Galgamuwa','Galgamuwa',1,9),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,223,'Mannar','Mannar',1,13),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,224,'Nanattan','Nanattan',1,13),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,225,'Manthai','Manthai',1,13),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,226,'Madhu','Madhu',1,13),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,227,'Musali','Musali',1,13),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,228,'Laggala','Laggala',1,2),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,229,'Naula','Naula',1,2),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,230,'Ukuwela','Ukuwela',1,2),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,231,'Yatawatta','Yatawatta',1,2),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,232,'Dambulla','Dambulla',1,2),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,233,'Pallepola','Pallepola',1,2),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,234,'Galewela','Galewela',1,2),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,235,'Wilgamuwa','Wilgamuwa',1,2),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,236,'Matale','Matale',1,2),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,237,'Ambangaga','Ambangaga',1,2),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,238,'Rathtota','Rathtota',1,2),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,239,'Matara(Four','Matara(Four',1,20),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,240,'Devinuwara','Devinuwara',1,20),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,241,'Kamburupitiya','Kamburupitiya',1,20),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,242,'Akuressa','Akuressa',1,20),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,243,'Athuraliya','Athuraliya',1,20),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,244,'Malimbada','Malimbada',1,20),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,245,'Kotapola','Kotapola',1,20),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,246,'Kirinda','Kirinda',1,20),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,247,'Dikwella','Dikwella',1,20),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,248,'Weligama','Weligama',1,20),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,249,'Hakmana','Hakmana',1,20),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,250,'Thihagoda','Thihagoda',1,20),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,251,'Pitabeddara','Pitabeddara',1,20),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,252,'Mulatiyana','Mulatiyana',1,20),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,253,'Pasgoda','Pasgoda',1,20),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,254,'Welipitiya','Welipitiya',1,20),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,255,'Badalkumbura','Badalkumbura',1,22),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,256,'Wellawaya','Wellawaya',1,22),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,257,'Monaragala','Monaragala',1,22),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,258,'Buththala','Buththala',1,22),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,259,'Katharagama','Katharagama',1,22),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,260,'Bibile','Bibile',1,22),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,261,'Medagama','Medagama',1,22),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,262,'Thanamalwila','Thanamalwila',1,22),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,263,'Sewanagala','Sewanagala',1,22),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,264,'Madulla','Madulla',1,22),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,265,'Siyabalanduwa','Siyabalanduwa',1,22),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,266,'Maritime','Maritime',1,14),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,267,'Manthei','Manthei',1,14),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,268,'Pudukudirippu','Pudukudirippu',1,14),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,269,'Oddusudan','Oddusudan',1,14),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,270,'Welioya','Welioya',1,14),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,271,'Thunukkai','Thunukkai',1,14),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,272,'Eliya','Eliya',1,3),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,273,'Eliya','Eliya',1,3),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,274,'Eliya','Eliya',1,3),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,275,'Eliya','Eliya',1,3),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,276,'Eliya','Eliya',1,3),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,277,'Dimbulagala','Dimbulagala',1,8),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,278,'Hingurakgoda','Hingurakgoda',1,8),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,279,'Elahera','Elahera',1,8),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,280,'Thamankaduwa','Thamankaduwa',1,8),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,281,'Welikanda','Welikanda',1,8),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,282,'Lankapura','Lankapura',1,8),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,283,'Madirigiriya','Madirigiriya',1,8),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,284,'Madampe','Madampe',1,10),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,285,'Anamaduwa','Anamaduwa',1,10),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,286,'Dankotuwa','Dankotuwa',1,10),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,287,'Nattandiya','Nattandiya',1,10),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,288,'Wennappuwa','Wennappuwa',1,10),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,289,'Chilaw/Halawatha','Chilaw/Halawatha',1,10),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,290,'Arachchikattuwa','Arachchikattuwa',1,10),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,291,'Mahakumbukkadawala','Mahakumbukkadawala',1,10),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,292,'Wanathavilluwa','Wanathavilluwa',1,10),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,293,'Nawagaththegama','Nawagaththegama',1,10),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,294,'Karuwalagaswewa','Karuwalagaswewa',1,10),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,295,'Mahawewa','Mahawewa',1,10),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,296,'Mundalama','Mundalama',1,10),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,297,'Pallama','Pallama',1,10),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,298,'Kalpitiya','Kalpitiya',1,10),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,299,'Putthalam','Putthalam',1,10),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,300,'Kahawatta','Kahawatta',1,17),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,301,'Embilipitiya','Embilipitiya',1,17),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,302,'Niwithigala','Niwithigala',1,17),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,303,'Kolonna','Kolonna',1,17),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,304,'Eheliyagoda','Eheliyagoda',1,17),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,305,'Kuruwita','Kuruwita',1,17),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,306,'Ratnapura','Ratnapura',1,17),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,307,'Elapatha','Elapatha',1,17),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,308,'Weligepola','Weligepola',1,17),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,309,'Kalawana','Kalawana',1,17),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,310,'Pelmadulla','Pelmadulla',1,17),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,311,'Opanayaka','Opanayaka',1,17),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,312,'Godakawela','Godakawela',1,17),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,313,'Balangoda','Balangoda',1,17),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,314,'Imbulpe','Imbulpe',1,17),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,315,'Kiriella','Kiriella',1,17),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,316,'Ayagama','Ayagama',1,17),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,317,'Trincomalee','Trincomalee',1,6),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,318,'Muthur','Muthur',1,6),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,319,'Verugal','Verugal',1,6),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,320,'Seruwila','Seruwila',1,6),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,321,'Padavisripura','Padavisripura',1,6),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,322,'Kuchchaweli','Kuchchaweli',1,6),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,323,'Thambalagamuwa','Thambalagamuwa',1,6),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,324,'Morawewa','Morawewa',1,6),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,325,'Gomarankadawala','Gomarankadawala',1,6),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,326,'Kinniya','Kinniya',1,6),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,327,'Kantale','Kantale',1,6),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,328,'Thoppur','Thoppur',1,6),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,329,'Vavuniya','Vavuniya',1,15),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,330,'Vengalacheddikulam','Vengalacheddikulam',1,15),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,331,'Vavuniya','Vavuniya',1,15),('admin','2020-11-01 00:00:00','admin','2020-11-01 00:00:00',0,332,'Vavuniya','Vavuniya',1,15);
/*!40000 ALTER TABLE `divisional_secretariat` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documents`
--

LOCK TABLES `documents` WRITE;
/*!40000 ALTER TABLE `documents` DISABLE KEYS */;
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
  `description` varchar(255) NOT NULL,
  `sortOrder` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `financing_scheme`
--

LOCK TABLES `financing_scheme` WRITE;
/*!40000 ALTER TABLE `financing_scheme` DISABLE KEYS */;
INSERT INTO `financing_scheme` VALUES (' ','2020-11-20 00:00:00',' ','2020-11-20 00:00:00',1,1,'FS1','FS1',1);
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
  `description` varchar(255) NOT NULL,
  `sortOrder` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `frequency`
--

LOCK TABLES `frequency` WRITE;
/*!40000 ALTER TABLE `frequency` DISABLE KEYS */;
INSERT INTO `frequency` VALUES ('test','2020-11-15 00:00:00','test','2020-11-15 00:00:00',1,1,'Daily','Day',1),('test','2020-11-15 00:00:00','test','2020-11-15 00:00:00',1,2,'Weekly','Week',1),('test','2020-11-15 00:00:00','test','2020-11-15 00:00:00',1,3,'Monthly','Month',1),('test','2020-11-15 00:00:00','test','2020-11-15 00:00:00',1,4,'Annualy','Annualy',1),('test','2020-11-15 00:00:00','test','2020-11-15 00:00:00',1,5,'Quarterly','Quarterly',1);
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
  `description` varchar(255) NOT NULL,
  `sortOrder` int NOT NULL,
  `numberOfDate` int NOT NULL,
  `numberofMonth` int NOT NULL,
  `numberOfYear` int NOT NULL,
  `frequencyId` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_87b2f7bf48ba3169fe857b372bc` (`frequencyId`),
  CONSTRAINT `FK_87b2f7bf48ba3169fe857b372bc` FOREIGN KEY (`frequencyId`) REFERENCES `frequency` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `frequency_detail`
--

LOCK TABLES `frequency_detail` WRITE;
/*!40000 ALTER TABLE `frequency_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `frequency_detail` ENABLE KEYS */;
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
  `description` varchar(255) NOT NULL,
  `sortOrder` int NOT NULL,
  `categoryId` int DEFAULT NULL,
  `provinceId` int DEFAULT NULL,
  `districtId` int DEFAULT NULL,
  `divisionalSecretariatId` int DEFAULT NULL,
  `parentInstitutionId` int DEFAULT NULL,
  `isNational` tinyint NOT NULL,
  `typeId` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_624b822b4a45197c6f0b88051bc` (`categoryId`),
  KEY `FK_3a8f2259e033ac457dee8b8a3ec` (`provinceId`),
  KEY `FK_354629b256d0b036bbddb67278e` (`districtId`),
  KEY `FK_f09f60c0ceb33b7c7af38eacecb` (`divisionalSecretariatId`),
  KEY `FK_3ca64cf0f964345e07b4c469bbe` (`parentInstitutionId`),
  KEY `FK_4893e540d687978250eb88fa2dc` (`typeId`),
  CONSTRAINT `FK_354629b256d0b036bbddb67278e` FOREIGN KEY (`districtId`) REFERENCES `district` (`id`),
  CONSTRAINT `FK_3a8f2259e033ac457dee8b8a3ec` FOREIGN KEY (`provinceId`) REFERENCES `province` (`id`),
  CONSTRAINT `FK_3ca64cf0f964345e07b4c469bbe` FOREIGN KEY (`parentInstitutionId`) REFERENCES `institution` (`id`),
  CONSTRAINT `FK_4893e540d687978250eb88fa2dc` FOREIGN KEY (`typeId`) REFERENCES `institution_type` (`id`),
  CONSTRAINT `FK_624b822b4a45197c6f0b88051bc` FOREIGN KEY (`categoryId`) REFERENCES `institution_category` (`id`),
  CONSTRAINT `FK_f09f60c0ceb33b7c7af38eacecb` FOREIGN KEY (`divisionalSecretariatId`) REFERENCES `divisional_secretariat` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `institution`
--

LOCK TABLES `institution` WRITE;
/*!40000 ALTER TABLE `institution` DISABLE KEYS */;
INSERT INTO `institution` VALUES ('','2020-11-08 17:52:42','','2020-11-08 17:52:42',0,1,'Ministry of Energy','Ministry of Energy',1,1,9,23,NULL,NULL,0,NULL),('','0000-00-00 00:00:00','','0000-00-00 00:00:00',0,2,'Ministry of helth','Ministry of helth',1,1,9,23,NULL,1,0,NULL),('','2020-11-08 17:47:56','','2020-11-08 17:47:56',0,3,'Sri Lanka Railways','Sri Lanka Railways colombo',0,3,NULL,NULL,NULL,NULL,0,1),('-','2020-12-02 21:28:23','-','2020-12-02 21:28:23',0,13,'SLTB','SLTB',0,3,9,NULL,NULL,NULL,0,1);
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
  `description` varchar(255) NOT NULL,
  `sortOrder` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `institution_category`
--

LOCK TABLES `institution_category` WRITE;
/*!40000 ALTER TABLE `institution_category` DISABLE KEYS */;
INSERT INTO `institution_category` VALUES ('','0000-00-00 00:00:00','','0000-00-00 00:00:00',0,1,'Semi-Givernment','Semi-Givernment',2),('','0000-00-00 00:00:00','','0000-00-00 00:00:00',0,2,'Private','Private',2),('','0000-00-00 00:00:00','','0000-00-00 00:00:00',0,3,'Government','Government',1);
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
  `description` varchar(255) NOT NULL,
  `sortOrder` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `institution_type`
--

LOCK TABLES `institution_type` WRITE;
/*!40000 ALTER TABLE `institution_type` DISABLE KEYS */;
INSERT INTO `institution_type` VALUES (' ','2020-11-01 00:00:00',' ','2020-11-01 00:00:00',0,1,'Data Provider','Data Provider',1);
/*!40000 ALTER TABLE `institution_type` ENABLE KEYS */;
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
  `description` varchar(255) NOT NULL,
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
  `sectorMoEId` int DEFAULT NULL,
  `projectId` int DEFAULT NULL,
  `programmeId` int DEFAULT NULL,
  `policyId` int DEFAULT NULL,
  `isPublicData` tinyint NOT NULL,
  `commercialValue` int NOT NULL,
  `frequencyId` int DEFAULT NULL,
  `institutionId` int DEFAULT NULL,
  `subSectorId` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_57a80e11bc6a43e88b4f5f4dcc9` (`unitOfMeasureId`),
  KEY `FK_1391fff8fea9487096f3c512808` (`climateChangeDataCategoryId`),
  KEY `FK_4057f643789f15dbd9da9f0cadc` (`sectorId`),
  KEY `FK_8fff0a2eb983724ffb592d8888b` (`projectId`),
  KEY `FK_f4e83ae9a7f891c3a1855b13d10` (`programmeId`),
  KEY `FK_bbe8b48742e91d15a8dc81c72bb` (`policyId`),
  KEY `FK_d3d7f9105728a26b17d26803c1e` (`sectorMoEId`),
  KEY `FK_97bfa5a1ec6a518ab85fcc48ecb` (`frequencyId`),
  KEY `FK_c584a0d5a74c7cfb5bcc3ecf9f0` (`institutionId`),
  KEY `FK_0422162f35e8064ddfb7f69bd9f` (`subSectorId`),
  CONSTRAINT `FK_0422162f35e8064ddfb7f69bd9f` FOREIGN KEY (`subSectorId`) REFERENCES `sub_sector` (`id`),
  CONSTRAINT `FK_1391fff8fea9487096f3c512808` FOREIGN KEY (`climateChangeDataCategoryId`) REFERENCES `climate_change_data_category` (`id`),
  CONSTRAINT `FK_4057f643789f15dbd9da9f0cadc` FOREIGN KEY (`sectorId`) REFERENCES `sector` (`id`),
  CONSTRAINT `FK_57a80e11bc6a43e88b4f5f4dcc9` FOREIGN KEY (`unitOfMeasureId`) REFERENCES `unit_of_measure` (`id`),
  CONSTRAINT `FK_8fff0a2eb983724ffb592d8888b` FOREIGN KEY (`projectId`) REFERENCES `project_programme` (`id`),
  CONSTRAINT `FK_97bfa5a1ec6a518ab85fcc48ecb` FOREIGN KEY (`frequencyId`) REFERENCES `frequency` (`id`),
  CONSTRAINT `FK_bbe8b48742e91d15a8dc81c72bb` FOREIGN KEY (`policyId`) REFERENCES `policy` (`id`),
  CONSTRAINT `FK_c584a0d5a74c7cfb5bcc3ecf9f0` FOREIGN KEY (`institutionId`) REFERENCES `institution` (`id`),
  CONSTRAINT `FK_d3d7f9105728a26b17d26803c1e` FOREIGN KEY (`sectorMoEId`) REFERENCES `sector_moe` (`id`),
  CONSTRAINT `FK_f4e83ae9a7f891c3a1855b13d10` FOREIGN KEY (`programmeId`) REFERENCES `project_programme` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parameter`
--

LOCK TABLES `parameter` WRITE;
/*!40000 ALTER TABLE `parameter` DISABLE KEYS */;
INSERT INTO `parameter` VALUES ('','2020-11-18 02:37:50','','2020-11-18 02:37:50',0,1,'Parameter 1','','1200g',1,1,1,0,2,2,2,4,1,1,1,2,1,0,0,NULL,NULL,NULL),('','2020-11-18 02:40:05','','2020-11-18 02:40:05',0,2,'Parameter 2','a','1kb',1,1,1,0,3,3,2,3,1,1,1,1,1,0,100,4,NULL,NULL),('','2020-11-18 02:37:50','','2020-11-18 02:37:50',0,3,'Parameter 3','','1200g',1,1,1,0,2,1,2,4,1,1,1,1,1,0,0,NULL,NULL,NULL),('','2020-11-18 02:40:05','','2020-11-18 02:40:05',0,4,'Parameter 4','','1kb',1,1,1,0,2,2,2,3,1,1,1,1,1,0,0,NULL,NULL,NULL),('','2020-11-18 02:37:50','','2020-11-18 02:37:50',0,5,'Parameter 5','','1200g',1,1,1,0,2,2,2,4,1,1,1,1,1,0,0,NULL,NULL,NULL),('','2020-11-18 02:40:05','','2020-11-18 02:40:05',0,6,'Parameter 6','','1kb',1,1,1,0,2,2,2,3,1,1,1,1,1,0,0,NULL,NULL,NULL),('','2020-11-18 02:37:50','','2020-11-18 02:37:50',0,7,'Parameter 7','','1200g',1,1,1,0,2,2,2,4,1,1,1,1,1,0,0,NULL,NULL,NULL),('','2020-11-18 02:40:05','','2020-11-18 02:40:05',0,8,'Parameter 8','','1kb',1,1,1,0,2,2,2,3,1,1,1,1,1,0,0,NULL,NULL,NULL),('','2020-11-25 18:32:55','','2020-11-25 18:32:55',0,16,'aa','aaaa','1200g',1,1,1,0,2,2,2,3,1,1,1,1,1,0,100,NULL,NULL,NULL),('','2020-11-26 07:30:30','','2020-11-26 07:30:30',0,19,'1200g','des','1200g',0,0,0,0,1,1,2,3,1,1,NULL,NULL,NULL,0,0,NULL,NULL,NULL),('','2020-11-26 07:38:39','','2020-11-26 07:38:39',0,20,'1200g','qq','1200g',0,0,0,0,3,4,2,3,1,1,NULL,NULL,NULL,0,0,NULL,NULL,NULL),('','2020-11-26 07:41:53','','2020-11-26 07:41:53',0,21,'P4','P4 d','p4sv',0,0,0,0,3,2,1,4,2,2,NULL,NULL,NULL,0,0,NULL,NULL,NULL),('','2020-11-26 07:43:13','','2020-11-26 07:43:13',0,22,'p5','p5d','p5sv',0,0,0,0,1,1,2,3,1,1,NULL,NULL,NULL,0,0,NULL,NULL,NULL),('','2020-11-26 07:46:33','','2020-11-26 07:46:33',0,23,'p5','p5d','p5sv',0,0,0,0,3,2,2,3,1,1,NULL,NULL,NULL,0,0,NULL,NULL,NULL),('-','2020-11-30 06:24:25','-','2020-11-30 06:24:25',0,24,'P1130','p1130','1200g',0,0,0,0,3,1,2,4,1,1,NULL,NULL,NULL,1,0,NULL,NULL,NULL),('-','2020-12-02 21:26:20','-','2020-12-02 21:26:20',0,25,'Number of Diesel Buses in Operation','Number of Diesel Buses in Operation Description','1000',0,0,0,0,3,1,1,2,2,1,NULL,NULL,NULL,1,0,4,NULL,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=1107 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parameter_location`
--

LOCK TABLES `parameter_location` WRITE;
/*!40000 ALTER TABLE `parameter_location` DISABLE KEYS */;
INSERT INTO `parameter_location` VALUES ('-','2020-11-28 10:38:56','-','2020-11-28 10:38:56',0,2,1,23,NULL,NULL,NULL,NULL),('-','2020-11-28 10:42:34','-','2020-11-28 10:42:34',0,3,0,23,NULL,NULL,NULL,NULL),('-','2020-11-28 10:43:16','-','2020-11-28 10:43:16',0,4,0,23,2,NULL,NULL,NULL),('-','2020-11-28 10:43:37','-','2020-11-28 10:43:37',0,5,0,23,NULL,21,NULL,NULL),('-','2020-11-28 10:43:51','-','2020-11-28 10:43:51',0,6,0,23,NULL,NULL,157,NULL),('-','2020-11-28 10:44:07','-','2020-11-28 10:44:07',0,7,1,23,NULL,NULL,NULL,NULL),('-','2020-11-28 10:44:20','-','2020-11-28 10:44:20',0,8,0,23,1,NULL,NULL,NULL),('-','2020-11-28 10:44:20','-','2020-11-28 10:44:20',0,9,0,23,2,NULL,NULL,NULL),('-','2020-11-28 10:44:20','-','2020-11-28 10:44:20',0,10,0,23,3,NULL,NULL,NULL),('-','2020-11-28 10:44:20','-','2020-11-28 10:44:20',0,11,0,23,5,NULL,NULL,NULL),('-','2020-11-28 10:44:20','-','2020-11-28 10:44:20',0,12,0,23,4,NULL,NULL,NULL),('-','2020-11-28 10:44:20','-','2020-11-28 10:44:20',0,13,0,23,6,NULL,NULL,NULL),('-','2020-11-28 10:44:20','-','2020-11-28 10:44:20',0,14,0,23,7,NULL,NULL,NULL),('-','2020-11-28 10:44:20','-','2020-11-28 10:44:20',0,15,0,23,8,NULL,NULL,NULL),('-','2020-11-28 10:44:20','-','2020-11-28 10:44:20',0,16,0,23,9,NULL,NULL,NULL),('-','2020-11-28 10:44:39','-','2020-11-28 10:44:39',0,17,0,23,NULL,4,NULL,NULL),('-','2020-11-28 10:44:39','-','2020-11-28 10:44:39',0,18,0,23,NULL,7,NULL,NULL),('-','2020-11-28 10:44:39','-','2020-11-28 10:44:39',0,19,0,23,NULL,21,NULL,NULL),('-','2020-11-28 10:44:39','-','2020-11-28 10:44:39',0,20,0,23,NULL,5,NULL,NULL),('-','2020-11-28 10:44:39','-','2020-11-28 10:44:39',0,21,0,23,NULL,23,NULL,NULL),('-','2020-11-28 10:44:39','-','2020-11-28 10:44:39',0,22,0,23,NULL,18,NULL,NULL),('-','2020-11-28 10:44:39','-','2020-11-28 10:44:39',0,23,0,23,NULL,24,NULL,NULL),('-','2020-11-28 10:44:39','-','2020-11-28 10:44:39',0,24,0,23,NULL,19,NULL,NULL),('-','2020-11-28 10:44:39','-','2020-11-28 10:44:39',0,25,0,23,NULL,11,NULL,NULL),('-','2020-11-28 10:44:39','-','2020-11-28 10:44:39',0,26,0,23,NULL,25,NULL,NULL),('-','2020-11-28 10:44:39','-','2020-11-28 10:44:39',0,27,0,23,NULL,1,NULL,NULL),('-','2020-11-28 10:44:39','-','2020-11-28 10:44:39',0,28,0,23,NULL,16,NULL,NULL),('-','2020-11-28 10:44:39','-','2020-11-28 10:44:39',0,29,0,23,NULL,12,NULL,NULL),('-','2020-11-28 10:44:39','-','2020-11-28 10:44:39',0,30,0,23,NULL,9,NULL,NULL),('-','2020-11-28 10:44:39','-','2020-11-28 10:44:39',0,31,0,23,NULL,13,NULL,NULL),('-','2020-11-28 10:44:39','-','2020-11-28 10:44:39',0,32,0,23,NULL,2,NULL,NULL),('-','2020-11-28 10:44:39','-','2020-11-28 10:44:39',0,33,0,23,NULL,20,NULL,NULL),('-','2020-11-28 10:44:39','-','2020-11-28 10:44:39',0,34,0,23,NULL,22,NULL,NULL),('-','2020-11-28 10:44:39','-','2020-11-28 10:44:39',0,35,0,23,NULL,14,NULL,NULL),('-','2020-11-28 10:44:39','-','2020-11-28 10:44:39',0,36,0,23,NULL,3,NULL,NULL),('-','2020-11-28 10:44:39','-','2020-11-28 10:44:39',0,37,0,23,NULL,8,NULL,NULL),('-','2020-11-28 10:44:39','-','2020-11-28 10:44:39',0,38,0,23,NULL,10,NULL,NULL),('-','2020-11-28 10:44:39','-','2020-11-28 10:44:39',0,39,0,23,NULL,17,NULL,NULL),('-','2020-11-28 10:44:39','-','2020-11-28 10:44:39',0,40,0,23,NULL,6,NULL,NULL),('-','2020-11-28 10:44:39','-','2020-11-28 10:44:39',0,41,0,23,NULL,15,NULL,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,42,0,23,NULL,NULL,2,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,43,0,23,NULL,NULL,157,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,44,0,23,NULL,NULL,13,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,45,0,23,NULL,NULL,88,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,46,0,23,NULL,NULL,165,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,47,0,23,NULL,NULL,242,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,48,0,23,NULL,NULL,5,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,49,0,23,NULL,NULL,200,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,50,0,23,NULL,NULL,90,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,51,0,23,NULL,NULL,128,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,52,0,23,NULL,NULL,237,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,53,0,23,NULL,NULL,204,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,54,0,23,NULL,NULL,17,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,55,0,23,NULL,NULL,285,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,56,0,23,NULL,NULL,124,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,57,0,23,NULL,NULL,290,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,58,0,23,NULL,NULL,180,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,59,0,23,NULL,NULL,243,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,60,0,23,NULL,NULL,105,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,61,0,23,NULL,NULL,316,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,62,0,23,NULL,NULL,255,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,63,0,23,NULL,NULL,96,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,64,0,23,NULL,NULL,43,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,65,0,23,NULL,NULL,144,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,66,0,23,NULL,NULL,313,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,67,0,23,NULL,NULL,85,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,68,0,23,NULL,NULL,148,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,69,0,23,NULL,NULL,45,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,70,0,23,NULL,NULL,117,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,71,0,23,NULL,NULL,100,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,72,0,23,NULL,NULL,151,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,73,0,23,NULL,NULL,260,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,74,0,23,NULL,NULL,203,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,75,0,23,NULL,NULL,106,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,76,0,23,NULL,NULL,198,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,77,0,23,NULL,NULL,94,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,78,0,23,NULL,NULL,185,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,79,0,23,NULL,NULL,156,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,80,0,23,NULL,NULL,258,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,81,0,23,NULL,NULL,289,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,82,0,23,NULL,NULL,76,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,83,0,23,NULL,NULL,4,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,84,0,23,NULL,NULL,232,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,85,0,23,NULL,NULL,286,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,86,0,23,NULL,NULL,12,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,87,0,23,NULL,NULL,181,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,88,0,23,NULL,NULL,83,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,89,0,23,NULL,NULL,143,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,90,0,23,NULL,NULL,158,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,91,0,23,NULL,NULL,187,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,92,0,23,NULL,NULL,240,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,93,0,23,NULL,NULL,247,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,94,0,23,NULL,NULL,277,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,95,0,23,NULL,NULL,107,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,96,0,23,NULL,NULL,153,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,97,0,23,NULL,NULL,169,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,98,0,23,NULL,NULL,109,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,99,0,23,NULL,NULL,304,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,100,0,23,NULL,NULL,221,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,101,0,23,NULL,NULL,279,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,102,0,23,NULL,NULL,307,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,103,0,23,NULL,NULL,276,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,104,0,23,NULL,NULL,275,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,105,0,23,NULL,NULL,274,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,106,0,23,NULL,NULL,273,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,107,0,23,NULL,NULL,272,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,108,0,23,NULL,NULL,52,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,109,0,23,NULL,NULL,89,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,110,0,23,NULL,NULL,301,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,111,0,23,NULL,NULL,71,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,112,0,23,NULL,NULL,62,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,113,0,23,NULL,NULL,22,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,114,0,23,NULL,NULL,234,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,115,0,23,NULL,NULL,222,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,116,0,23,NULL,NULL,178,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,117,0,23,NULL,NULL,93,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,118,0,23,NULL,NULL,39,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,119,0,23,NULL,NULL,104,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,120,0,23,NULL,NULL,209,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,121,0,23,NULL,NULL,173,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,122,0,23,NULL,NULL,162,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,123,0,23,NULL,NULL,216,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,124,0,23,NULL,NULL,312,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,125,0,23,NULL,NULL,325,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,126,0,23,NULL,NULL,98,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,127,0,23,NULL,NULL,95,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,128,0,23,NULL,NULL,249,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,129,0,23,NULL,NULL,56,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,130,0,23,NULL,NULL,55,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,131,0,23,NULL,NULL,118,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,132,0,23,NULL,NULL,46,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,133,0,23,NULL,NULL,164,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,134,0,23,NULL,NULL,166,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,135,0,23,NULL,NULL,97,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,136,0,23,NULL,NULL,278,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,137,0,23,NULL,NULL,79,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,138,0,23,NULL,NULL,149,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,139,0,23,NULL,NULL,25,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,140,0,23,NULL,NULL,211,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,141,0,23,NULL,NULL,102,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,142,0,23,NULL,NULL,314,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,143,0,23,NULL,NULL,155,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,144,0,23,NULL,NULL,34,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,145,0,23,NULL,NULL,7,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,146,0,23,NULL,NULL,142,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,147,0,23,NULL,NULL,141,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,148,0,23,NULL,NULL,113,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,149,0,23,NULL,NULL,140,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,150,0,23,NULL,NULL,81,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,151,0,23,NULL,NULL,36,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,152,0,23,NULL,NULL,300,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,153,0,23,NULL,NULL,309,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,154,0,23,NULL,NULL,18,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,155,0,23,NULL,NULL,11,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,156,0,23,NULL,NULL,298,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,157,0,23,NULL,NULL,154,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,158,0,23,NULL,NULL,241,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,159,0,23,NULL,NULL,44,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,160,0,23,NULL,NULL,191,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,161,0,23,NULL,NULL,327,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,162,0,23,NULL,NULL,190,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,163,0,23,NULL,NULL,129,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,164,0,23,NULL,NULL,10,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,165,0,23,NULL,NULL,91,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,166,0,23,NULL,NULL,294,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,167,0,23,NULL,NULL,110,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,168,0,23,NULL,NULL,259,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,169,0,23,NULL,NULL,65,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,170,0,23,NULL,NULL,125,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,171,0,23,NULL,NULL,38,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,172,0,23,NULL,NULL,179,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,173,0,23,NULL,NULL,30,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,174,0,23,NULL,NULL,112,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,175,0,23,NULL,NULL,74,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,176,0,23,NULL,NULL,326,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,177,0,23,NULL,NULL,315,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,178,0,23,NULL,NULL,246,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,179,0,23,NULL,NULL,219,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,180,0,23,NULL,NULL,303,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,181,0,23,NULL,NULL,80,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,182,0,23,NULL,NULL,59,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,183,0,23,NULL,NULL,60,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,184,0,23,NULL,NULL,70,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,185,0,23,NULL,NULL,69,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,186,0,23,NULL,NULL,68,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,187,0,23,NULL,NULL,245,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,188,0,23,NULL,NULL,202,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,189,0,23,NULL,NULL,322,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,190,0,23,NULL,NULL,199,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,191,0,23,NULL,NULL,194,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,192,0,23,NULL,NULL,160,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,193,0,23,NULL,NULL,208,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,194,0,23,NULL,NULL,305,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,195,0,23,NULL,NULL,228,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,196,0,23,NULL,NULL,6,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,197,0,23,NULL,NULL,282,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,198,0,23,NULL,NULL,51,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,199,0,23,NULL,NULL,122,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,200,0,23,NULL,NULL,284,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,201,0,23,NULL,NULL,226,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,202,0,23,NULL,NULL,283,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,203,0,23,NULL,NULL,264,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,204,0,23,NULL,NULL,150,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,205,0,23,NULL,NULL,291,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,206,0,23,NULL,NULL,16,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,207,0,23,NULL,NULL,116,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,208,0,23,NULL,NULL,72,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,209,0,23,NULL,NULL,217,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,210,0,23,NULL,NULL,295,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,211,0,23,NULL,NULL,32,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,212,0,23,NULL,NULL,57,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,213,0,23,NULL,NULL,244,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,214,0,23,NULL,NULL,197,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,215,0,23,NULL,NULL,58,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,216,0,23,NULL,NULL,63,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,217,0,23,NULL,NULL,66,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,218,0,23,NULL,NULL,64,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,219,0,23,NULL,NULL,61,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,220,0,23,NULL,NULL,223,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,221,0,23,NULL,NULL,225,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,222,0,23,NULL,NULL,267,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,223,0,23,NULL,NULL,266,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,224,0,23,NULL,NULL,193,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,225,0,23,NULL,NULL,236,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,226,0,23,NULL,NULL,239,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,227,0,23,NULL,NULL,146,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,228,0,23,NULL,NULL,186,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,229,0,23,NULL,NULL,206,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,230,0,23,NULL,NULL,176,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,231,0,23,NULL,NULL,261,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,232,0,23,NULL,NULL,31,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,233,0,23,NULL,NULL,48,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,234,0,23,NULL,NULL,33,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,235,0,23,NULL,NULL,145,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,236,0,23,NULL,NULL,177,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,237,0,23,NULL,NULL,115,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,238,0,23,NULL,NULL,114,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,239,0,23,NULL,NULL,257,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,240,0,23,NULL,NULL,84,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,241,0,23,NULL,NULL,324,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,242,0,23,NULL,NULL,252,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,243,0,23,NULL,NULL,296,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,244,0,23,NULL,NULL,227,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,245,0,23,NULL,NULL,318,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,246,0,23,NULL,NULL,28,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,247,0,23,NULL,NULL,92,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,248,0,23,NULL,NULL,135,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,249,0,23,NULL,NULL,224,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,250,0,23,NULL,NULL,207,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,251,0,23,NULL,NULL,287,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,252,0,23,NULL,NULL,229,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,253,0,23,NULL,NULL,14,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,254,0,23,NULL,NULL,293,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,255,0,23,NULL,NULL,108,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,256,0,23,NULL,NULL,103,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,257,0,23,NULL,NULL,205,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,258,0,23,NULL,NULL,3,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,259,0,23,NULL,NULL,302,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,260,0,23,NULL,NULL,101,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,261,0,23,NULL,NULL,24,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,262,0,23,NULL,NULL,27,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,263,0,23,NULL,NULL,23,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,264,0,23,NULL,NULL,269,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,265,0,23,NULL,NULL,123,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,266,0,23,NULL,NULL,311,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,267,0,23,NULL,NULL,189,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,268,0,23,NULL,NULL,321,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,269,0,23,NULL,NULL,40,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,270,0,23,NULL,NULL,9,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,271,0,23,NULL,NULL,77,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,272,0,23,NULL,NULL,41,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,273,0,23,NULL,NULL,297,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,274,0,23,NULL,NULL,233,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,275,0,23,NULL,NULL,42,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,276,0,23,NULL,NULL,147,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,277,0,23,NULL,NULL,214,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,278,0,23,NULL,NULL,212,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,279,0,23,NULL,NULL,213,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,280,0,23,NULL,NULL,168,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,281,0,23,NULL,NULL,167,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,282,0,23,NULL,NULL,253,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,283,0,23,NULL,NULL,50,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,284,0,23,NULL,NULL,171,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,285,0,23,NULL,NULL,163,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,286,0,23,NULL,NULL,310,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,287,0,23,NULL,NULL,251,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,288,0,23,NULL,NULL,195,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,289,0,23,NULL,NULL,196,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,290,0,23,NULL,NULL,170,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,291,0,23,NULL,NULL,192,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,292,0,23,NULL,NULL,67,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,293,0,23,NULL,NULL,19,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,294,0,23,NULL,NULL,268,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,295,0,23,NULL,NULL,299,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,296,0,23,NULL,NULL,26,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,297,0,23,NULL,NULL,21,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,298,0,23,NULL,NULL,183,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,299,0,23,NULL,NULL,215,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,300,0,23,NULL,NULL,238,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,301,0,23,NULL,NULL,78,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,302,0,23,NULL,NULL,306,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,303,0,23,NULL,NULL,49,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,304,0,23,NULL,NULL,220,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,305,0,23,NULL,NULL,188,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,306,0,23,NULL,NULL,8,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,307,0,23,NULL,NULL,1,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,308,0,23,NULL,NULL,82,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,309,0,23,NULL,NULL,320,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,310,0,23,NULL,NULL,263,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,311,0,23,NULL,NULL,265,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,312,0,23,NULL,NULL,126,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,313,0,23,NULL,NULL,47,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,314,0,23,NULL,NULL,75,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,315,0,23,NULL,NULL,119,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,316,0,23,NULL,NULL,37,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,317,0,23,NULL,NULL,280,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,318,0,23,NULL,NULL,323,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,319,0,23,NULL,NULL,29,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,320,0,23,NULL,NULL,262,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,321,0,23,NULL,NULL,86,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,322,0,23,NULL,NULL,136,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,323,0,23,NULL,NULL,250,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,324,0,23,NULL,NULL,73,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,325,0,23,NULL,NULL,35,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,326,0,23,NULL,NULL,20,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,327,0,23,NULL,NULL,328,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,328,0,23,NULL,NULL,159,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,329,0,23,NULL,NULL,271,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,330,0,23,NULL,NULL,127,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,331,0,23,NULL,NULL,317,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,332,0,23,NULL,NULL,174,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,333,0,23,NULL,NULL,172,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,334,0,23,NULL,NULL,201,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,335,0,23,NULL,NULL,161,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,336,0,23,NULL,NULL,15,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,337,0,23,NULL,NULL,230,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,338,0,23,NULL,NULL,54,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,339,0,23,NULL,NULL,134,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,340,0,23,NULL,NULL,133,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,341,0,23,NULL,NULL,132,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,342,0,23,NULL,NULL,130,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,343,0,23,NULL,NULL,131,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,344,0,23,NULL,NULL,99,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,345,0,23,NULL,NULL,332,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,346,0,23,NULL,NULL,329,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,347,0,23,NULL,NULL,331,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,348,0,23,NULL,NULL,330,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,349,0,23,NULL,NULL,319,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,350,0,23,NULL,NULL,137,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,351,0,23,NULL,NULL,138,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,352,0,23,NULL,NULL,139,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,353,0,23,NULL,NULL,152,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,354,0,23,NULL,NULL,120,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,355,0,23,NULL,NULL,292,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,356,0,23,NULL,NULL,182,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,357,0,23,NULL,NULL,210,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,358,0,23,NULL,NULL,111,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,359,0,23,NULL,NULL,121,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,360,0,23,NULL,NULL,218,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,361,0,23,NULL,NULL,248,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,362,0,23,NULL,NULL,308,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,363,0,23,NULL,NULL,281,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,364,0,23,NULL,NULL,53,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,365,0,23,NULL,NULL,270,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,366,0,23,NULL,NULL,254,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,367,0,23,NULL,NULL,256,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,368,0,23,NULL,NULL,288,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,369,0,23,NULL,NULL,235,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,370,0,23,NULL,NULL,87,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,371,0,23,NULL,NULL,231,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,372,0,23,NULL,NULL,175,NULL),('-','2020-11-28 11:26:30','-','2020-11-28 11:26:30',0,373,0,23,NULL,NULL,184,NULL),('-','2020-11-28 11:29:41','-','2020-11-28 11:29:41',0,374,1,23,NULL,NULL,NULL,NULL),('-','2020-11-28 11:30:03','-','2020-11-28 11:30:03',0,375,0,23,1,NULL,NULL,NULL),('-','2020-11-28 11:30:03','-','2020-11-28 11:30:03',0,376,0,23,3,NULL,NULL,NULL),('-','2020-11-28 11:30:03','-','2020-11-28 11:30:03',0,377,0,23,4,NULL,NULL,NULL),('-','2020-11-28 11:30:38','-','2020-11-28 11:30:38',0,378,0,23,NULL,4,NULL,NULL),('-','2020-11-28 11:30:38','-','2020-11-28 11:30:38',0,379,0,23,NULL,23,NULL,NULL),('-','2020-11-28 11:30:38','-','2020-11-28 11:30:38',0,380,0,23,NULL,17,NULL,NULL),('-','2020-11-28 11:30:38','-','2020-11-28 11:30:38',0,381,0,23,NULL,6,NULL,NULL),('-','2020-11-28 11:30:38','-','2020-11-28 11:30:38',0,382,0,23,NULL,3,NULL,NULL),('-','2020-11-28 11:30:38','-','2020-11-28 11:30:38',0,383,0,23,NULL,8,NULL,NULL),('-','2020-11-28 11:30:38','-','2020-11-28 11:30:38',0,384,0,23,NULL,12,NULL,NULL),('-','2020-11-28 11:30:38','-','2020-11-28 11:30:38',0,385,0,23,NULL,13,NULL,NULL),('-','2020-11-28 11:30:38','-','2020-11-28 11:30:38',0,386,0,23,NULL,2,NULL,NULL),('-','2020-11-28 11:30:38','-','2020-11-28 11:30:38',0,387,0,23,NULL,19,NULL,NULL),('-','2020-11-29 15:44:50','-','2020-11-29 15:44:50',0,388,0,23,1,NULL,NULL,NULL),('-','2020-11-29 15:44:50','-','2020-11-29 15:44:50',0,389,0,23,2,NULL,NULL,NULL),('-','2020-11-29 15:44:50','-','2020-11-29 15:44:50',0,390,0,23,3,NULL,NULL,NULL),('-','2020-11-29 15:44:50','-','2020-11-29 15:44:50',0,391,0,23,5,NULL,NULL,NULL),('-','2020-11-29 15:44:50','-','2020-11-29 15:44:50',0,392,0,23,4,NULL,NULL,NULL),('-','2020-11-29 15:44:50','-','2020-11-29 15:44:50',0,393,0,23,6,NULL,NULL,NULL),('-','2020-11-29 15:44:50','-','2020-11-29 15:44:50',0,394,0,23,7,NULL,NULL,NULL),('-','2020-11-29 15:44:50','-','2020-11-29 15:44:50',0,395,0,23,8,NULL,NULL,NULL),('-','2020-11-29 15:44:50','-','2020-11-29 15:44:50',0,396,0,23,9,NULL,NULL,NULL),('-','2020-11-29 15:44:59','-','2020-11-29 15:44:59',0,397,0,23,1,NULL,NULL,NULL),('-','2020-11-29 15:44:59','-','2020-11-29 15:44:59',0,398,0,23,2,NULL,NULL,NULL),('-','2020-11-29 15:44:59','-','2020-11-29 15:44:59',0,399,0,23,3,NULL,NULL,NULL),('-','2020-11-29 15:44:59','-','2020-11-29 15:44:59',0,400,0,23,5,NULL,NULL,NULL),('-','2020-11-29 15:44:59','-','2020-11-29 15:44:59',0,401,0,23,4,NULL,NULL,NULL),('-','2020-11-29 15:44:59','-','2020-11-29 15:44:59',0,402,0,23,6,NULL,NULL,NULL),('-','2020-11-29 15:44:59','-','2020-11-29 15:44:59',0,403,0,23,7,NULL,NULL,NULL),('-','2020-11-29 15:44:59','-','2020-11-29 15:44:59',0,404,0,23,8,NULL,NULL,NULL),('-','2020-11-29 15:44:59','-','2020-11-29 15:44:59',0,405,0,23,9,NULL,NULL,NULL),('-','2020-11-29 15:46:22','-','2020-11-29 15:46:22',0,406,1,23,NULL,NULL,NULL,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,407,0,23,NULL,NULL,2,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,408,0,23,NULL,NULL,157,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,409,0,23,NULL,NULL,13,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,410,0,23,NULL,NULL,88,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,411,0,23,NULL,NULL,165,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,412,0,23,NULL,NULL,242,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,413,0,23,NULL,NULL,5,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,414,0,23,NULL,NULL,200,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,415,0,23,NULL,NULL,90,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,416,0,23,NULL,NULL,128,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,417,0,23,NULL,NULL,237,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,418,0,23,NULL,NULL,204,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,419,0,23,NULL,NULL,17,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,420,0,23,NULL,NULL,285,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,421,0,23,NULL,NULL,124,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,422,0,23,NULL,NULL,290,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,423,0,23,NULL,NULL,180,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,424,0,23,NULL,NULL,243,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,425,0,23,NULL,NULL,105,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,426,0,23,NULL,NULL,316,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,427,0,23,NULL,NULL,255,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,428,0,23,NULL,NULL,96,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,429,0,23,NULL,NULL,43,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,430,0,23,NULL,NULL,144,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,431,0,23,NULL,NULL,313,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,432,0,23,NULL,NULL,85,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,433,0,23,NULL,NULL,148,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,434,0,23,NULL,NULL,45,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,435,0,23,NULL,NULL,117,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,436,0,23,NULL,NULL,100,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,437,0,23,NULL,NULL,151,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,438,0,23,NULL,NULL,260,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,439,0,23,NULL,NULL,203,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,440,0,23,NULL,NULL,106,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,441,0,23,NULL,NULL,198,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,442,0,23,NULL,NULL,94,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,443,0,23,NULL,NULL,185,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,444,0,23,NULL,NULL,156,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,445,0,23,NULL,NULL,258,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,446,0,23,NULL,NULL,289,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,447,0,23,NULL,NULL,76,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,448,0,23,NULL,NULL,4,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,449,0,23,NULL,NULL,232,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,450,0,23,NULL,NULL,286,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,451,0,23,NULL,NULL,12,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,452,0,23,NULL,NULL,181,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,453,0,23,NULL,NULL,83,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,454,0,23,NULL,NULL,143,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,455,0,23,NULL,NULL,158,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,456,0,23,NULL,NULL,187,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,457,0,23,NULL,NULL,240,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,458,0,23,NULL,NULL,247,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,459,0,23,NULL,NULL,277,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,460,0,23,NULL,NULL,107,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,461,0,23,NULL,NULL,153,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,462,0,23,NULL,NULL,169,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,463,0,23,NULL,NULL,109,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,464,0,23,NULL,NULL,304,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,465,0,23,NULL,NULL,221,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,466,0,23,NULL,NULL,279,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,467,0,23,NULL,NULL,307,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,468,0,23,NULL,NULL,276,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,469,0,23,NULL,NULL,275,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,470,0,23,NULL,NULL,274,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,471,0,23,NULL,NULL,273,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,472,0,23,NULL,NULL,272,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,473,0,23,NULL,NULL,52,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,474,0,23,NULL,NULL,89,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,475,0,23,NULL,NULL,301,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,476,0,23,NULL,NULL,71,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,477,0,23,NULL,NULL,62,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,478,0,23,NULL,NULL,22,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,479,0,23,NULL,NULL,234,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,480,0,23,NULL,NULL,222,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,481,0,23,NULL,NULL,178,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,482,0,23,NULL,NULL,93,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,483,0,23,NULL,NULL,39,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,484,0,23,NULL,NULL,104,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,485,0,23,NULL,NULL,209,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,486,0,23,NULL,NULL,173,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,487,0,23,NULL,NULL,162,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,488,0,23,NULL,NULL,216,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,489,0,23,NULL,NULL,312,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,490,0,23,NULL,NULL,325,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,491,0,23,NULL,NULL,98,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,492,0,23,NULL,NULL,95,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,493,0,23,NULL,NULL,249,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,494,0,23,NULL,NULL,56,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,495,0,23,NULL,NULL,55,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,496,0,23,NULL,NULL,118,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,497,0,23,NULL,NULL,46,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,498,0,23,NULL,NULL,164,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,499,0,23,NULL,NULL,166,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,500,0,23,NULL,NULL,97,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,501,0,23,NULL,NULL,278,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,502,0,23,NULL,NULL,79,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,503,0,23,NULL,NULL,149,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,504,0,23,NULL,NULL,25,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,505,0,23,NULL,NULL,211,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,506,0,23,NULL,NULL,102,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,507,0,23,NULL,NULL,314,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,508,0,23,NULL,NULL,155,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,509,0,23,NULL,NULL,34,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,510,0,23,NULL,NULL,7,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,511,0,23,NULL,NULL,142,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,512,0,23,NULL,NULL,141,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,513,0,23,NULL,NULL,113,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,514,0,23,NULL,NULL,140,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,515,0,23,NULL,NULL,81,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,516,0,23,NULL,NULL,36,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,517,0,23,NULL,NULL,300,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,518,0,23,NULL,NULL,309,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,519,0,23,NULL,NULL,18,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,520,0,23,NULL,NULL,11,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,521,0,23,NULL,NULL,298,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,522,0,23,NULL,NULL,154,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,523,0,23,NULL,NULL,241,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,524,0,23,NULL,NULL,44,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,525,0,23,NULL,NULL,191,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,526,0,23,NULL,NULL,327,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,527,0,23,NULL,NULL,190,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,528,0,23,NULL,NULL,129,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,529,0,23,NULL,NULL,10,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,530,0,23,NULL,NULL,91,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,531,0,23,NULL,NULL,294,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,532,0,23,NULL,NULL,110,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,533,0,23,NULL,NULL,259,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,534,0,23,NULL,NULL,65,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,535,0,23,NULL,NULL,125,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,536,0,23,NULL,NULL,38,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,537,0,23,NULL,NULL,179,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,538,0,23,NULL,NULL,30,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,539,0,23,NULL,NULL,112,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,540,0,23,NULL,NULL,74,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,541,0,23,NULL,NULL,326,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,542,0,23,NULL,NULL,315,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,543,0,23,NULL,NULL,246,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,544,0,23,NULL,NULL,219,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,545,0,23,NULL,NULL,303,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,546,0,23,NULL,NULL,80,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,547,0,23,NULL,NULL,59,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,548,0,23,NULL,NULL,60,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,549,0,23,NULL,NULL,70,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,550,0,23,NULL,NULL,69,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,551,0,23,NULL,NULL,68,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,552,0,23,NULL,NULL,245,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,553,0,23,NULL,NULL,202,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,554,0,23,NULL,NULL,322,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,555,0,23,NULL,NULL,199,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,556,0,23,NULL,NULL,194,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,557,0,23,NULL,NULL,160,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,558,0,23,NULL,NULL,208,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,559,0,23,NULL,NULL,305,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,560,0,23,NULL,NULL,228,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,561,0,23,NULL,NULL,6,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,562,0,23,NULL,NULL,282,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,563,0,23,NULL,NULL,51,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,564,0,23,NULL,NULL,122,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,565,0,23,NULL,NULL,284,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,566,0,23,NULL,NULL,226,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,567,0,23,NULL,NULL,283,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,568,0,23,NULL,NULL,264,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,569,0,23,NULL,NULL,150,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,570,0,23,NULL,NULL,291,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,571,0,23,NULL,NULL,16,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,572,0,23,NULL,NULL,116,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,573,0,23,NULL,NULL,72,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,574,0,23,NULL,NULL,217,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,575,0,23,NULL,NULL,295,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,576,0,23,NULL,NULL,32,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,577,0,23,NULL,NULL,57,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,578,0,23,NULL,NULL,244,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,579,0,23,NULL,NULL,197,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,580,0,23,NULL,NULL,58,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,581,0,23,NULL,NULL,63,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,582,0,23,NULL,NULL,66,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,583,0,23,NULL,NULL,64,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,584,0,23,NULL,NULL,61,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,585,0,23,NULL,NULL,223,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,586,0,23,NULL,NULL,225,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,587,0,23,NULL,NULL,267,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,588,0,23,NULL,NULL,266,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,589,0,23,NULL,NULL,193,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,590,0,23,NULL,NULL,236,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,591,0,23,NULL,NULL,239,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,592,0,23,NULL,NULL,146,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,593,0,23,NULL,NULL,186,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,594,0,23,NULL,NULL,206,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,595,0,23,NULL,NULL,176,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,596,0,23,NULL,NULL,261,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,597,0,23,NULL,NULL,31,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,598,0,23,NULL,NULL,48,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,599,0,23,NULL,NULL,33,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,600,0,23,NULL,NULL,145,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,601,0,23,NULL,NULL,177,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,602,0,23,NULL,NULL,115,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,603,0,23,NULL,NULL,114,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,604,0,23,NULL,NULL,257,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,605,0,23,NULL,NULL,84,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,606,0,23,NULL,NULL,324,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,607,0,23,NULL,NULL,252,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,608,0,23,NULL,NULL,296,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,609,0,23,NULL,NULL,227,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,610,0,23,NULL,NULL,318,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,611,0,23,NULL,NULL,28,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,612,0,23,NULL,NULL,92,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,613,0,23,NULL,NULL,135,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,614,0,23,NULL,NULL,224,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,615,0,23,NULL,NULL,207,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,616,0,23,NULL,NULL,287,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,617,0,23,NULL,NULL,229,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,618,0,23,NULL,NULL,14,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,619,0,23,NULL,NULL,293,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,620,0,23,NULL,NULL,108,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,621,0,23,NULL,NULL,103,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,622,0,23,NULL,NULL,205,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,623,0,23,NULL,NULL,3,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,624,0,23,NULL,NULL,302,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,625,0,23,NULL,NULL,101,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,626,0,23,NULL,NULL,24,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,627,0,23,NULL,NULL,27,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,628,0,23,NULL,NULL,23,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,629,0,23,NULL,NULL,269,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,630,0,23,NULL,NULL,123,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,631,0,23,NULL,NULL,311,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,632,0,23,NULL,NULL,189,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,633,0,23,NULL,NULL,321,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,634,0,23,NULL,NULL,40,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,635,0,23,NULL,NULL,9,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,636,0,23,NULL,NULL,77,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,637,0,23,NULL,NULL,41,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,638,0,23,NULL,NULL,297,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,639,0,23,NULL,NULL,233,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,640,0,23,NULL,NULL,42,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,641,0,23,NULL,NULL,147,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,642,0,23,NULL,NULL,214,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,643,0,23,NULL,NULL,212,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,644,0,23,NULL,NULL,213,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,645,0,23,NULL,NULL,168,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,646,0,23,NULL,NULL,167,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,647,0,23,NULL,NULL,253,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,648,0,23,NULL,NULL,50,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,649,0,23,NULL,NULL,171,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,650,0,23,NULL,NULL,163,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,651,0,23,NULL,NULL,310,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,652,0,23,NULL,NULL,251,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,653,0,23,NULL,NULL,195,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,654,0,23,NULL,NULL,196,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,655,0,23,NULL,NULL,170,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,656,0,23,NULL,NULL,192,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,657,0,23,NULL,NULL,67,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,658,0,23,NULL,NULL,19,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,659,0,23,NULL,NULL,268,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,660,0,23,NULL,NULL,299,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,661,0,23,NULL,NULL,26,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,662,0,23,NULL,NULL,21,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,663,0,23,NULL,NULL,183,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,664,0,23,NULL,NULL,215,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,665,0,23,NULL,NULL,238,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,666,0,23,NULL,NULL,78,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,667,0,23,NULL,NULL,306,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,668,0,23,NULL,NULL,49,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,669,0,23,NULL,NULL,220,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,670,0,23,NULL,NULL,188,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,671,0,23,NULL,NULL,8,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,672,0,23,NULL,NULL,1,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,673,0,23,NULL,NULL,82,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,674,0,23,NULL,NULL,320,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,675,0,23,NULL,NULL,263,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,676,0,23,NULL,NULL,265,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,677,0,23,NULL,NULL,126,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,678,0,23,NULL,NULL,47,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,679,0,23,NULL,NULL,75,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,680,0,23,NULL,NULL,119,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,681,0,23,NULL,NULL,37,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,682,0,23,NULL,NULL,280,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,683,0,23,NULL,NULL,323,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,684,0,23,NULL,NULL,29,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,685,0,23,NULL,NULL,262,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,686,0,23,NULL,NULL,86,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,687,0,23,NULL,NULL,136,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,688,0,23,NULL,NULL,250,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,689,0,23,NULL,NULL,73,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,690,0,23,NULL,NULL,35,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,691,0,23,NULL,NULL,20,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,692,0,23,NULL,NULL,328,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,693,0,23,NULL,NULL,159,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,694,0,23,NULL,NULL,271,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,695,0,23,NULL,NULL,127,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,696,0,23,NULL,NULL,317,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,697,0,23,NULL,NULL,174,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,698,0,23,NULL,NULL,172,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,699,0,23,NULL,NULL,201,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,700,0,23,NULL,NULL,161,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,701,0,23,NULL,NULL,15,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,702,0,23,NULL,NULL,230,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,703,0,23,NULL,NULL,54,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,704,0,23,NULL,NULL,134,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,705,0,23,NULL,NULL,133,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,706,0,23,NULL,NULL,132,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,707,0,23,NULL,NULL,130,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,708,0,23,NULL,NULL,131,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,709,0,23,NULL,NULL,99,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,710,0,23,NULL,NULL,332,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,711,0,23,NULL,NULL,329,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,712,0,23,NULL,NULL,331,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,713,0,23,NULL,NULL,330,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,714,0,23,NULL,NULL,319,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,715,0,23,NULL,NULL,137,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,716,0,23,NULL,NULL,138,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,717,0,23,NULL,NULL,139,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,718,0,23,NULL,NULL,152,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,719,0,23,NULL,NULL,120,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,720,0,23,NULL,NULL,292,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,721,0,23,NULL,NULL,182,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,722,0,23,NULL,NULL,210,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,723,0,23,NULL,NULL,111,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,724,0,23,NULL,NULL,121,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,725,0,23,NULL,NULL,218,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,726,0,23,NULL,NULL,248,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,727,0,23,NULL,NULL,308,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,728,0,23,NULL,NULL,281,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,729,0,23,NULL,NULL,53,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,730,0,23,NULL,NULL,270,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,731,0,23,NULL,NULL,254,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,732,0,23,NULL,NULL,256,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,733,0,23,NULL,NULL,288,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,734,0,23,NULL,NULL,235,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,735,0,23,NULL,NULL,87,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,736,0,23,NULL,NULL,231,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,737,0,23,NULL,NULL,175,NULL),('-','2020-11-29 15:46:47','-','2020-11-29 15:46:47',0,738,0,23,NULL,NULL,184,NULL),('-','2020-11-29 16:16:48','-','2020-11-29 16:16:48',0,739,0,23,1,NULL,NULL,NULL),('-','2020-11-29 19:59:00','-','2020-11-29 19:59:00',0,740,0,23,1,NULL,NULL,NULL),('-','2020-11-29 19:59:00','-','2020-11-29 19:59:00',0,741,0,23,3,NULL,NULL,NULL),('-','2020-11-29 19:59:00','-','2020-11-29 19:59:00',0,742,0,23,4,NULL,NULL,NULL),('-','2020-11-29 19:59:00','-','2020-11-29 19:59:00',0,743,0,23,7,NULL,NULL,NULL),('-','2020-11-29 19:59:00','-','2020-11-29 19:59:00',0,744,0,23,9,NULL,NULL,NULL),('-','2020-11-29 20:39:09','-','2020-11-29 20:39:09',0,745,0,21,1,NULL,NULL,NULL),('-','2020-11-29 20:39:09','-','2020-11-29 20:39:09',0,746,0,21,3,NULL,NULL,NULL),('-','2020-11-29 20:39:09','-','2020-11-29 20:39:09',0,747,0,21,4,NULL,NULL,NULL),('-','2020-11-29 20:39:09','-','2020-11-29 20:39:09',0,748,0,21,7,NULL,NULL,NULL),('-','2020-11-29 20:39:09','-','2020-11-29 20:39:09',0,749,0,21,9,NULL,NULL,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,750,0,20,NULL,NULL,2,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,751,0,20,NULL,NULL,13,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,752,0,20,NULL,NULL,88,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,753,0,20,NULL,NULL,165,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,754,0,20,NULL,NULL,242,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,755,0,20,NULL,NULL,5,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,756,0,20,NULL,NULL,200,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,757,0,20,NULL,NULL,90,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,758,0,20,NULL,NULL,128,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,759,0,20,NULL,NULL,237,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,760,0,20,NULL,NULL,204,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,761,0,20,NULL,NULL,17,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,762,0,20,NULL,NULL,285,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,763,0,20,NULL,NULL,124,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,764,0,20,NULL,NULL,290,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,765,0,20,NULL,NULL,180,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,766,0,20,NULL,NULL,243,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,767,0,20,NULL,NULL,105,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,768,0,20,NULL,NULL,316,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,769,0,20,NULL,NULL,255,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,770,0,20,NULL,NULL,96,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,771,0,20,NULL,NULL,43,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,772,0,20,NULL,NULL,144,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,773,0,20,NULL,NULL,313,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,774,0,20,NULL,NULL,85,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,775,0,20,NULL,NULL,148,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,776,0,20,NULL,NULL,45,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,777,0,20,NULL,NULL,117,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,778,0,20,NULL,NULL,100,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,779,0,20,NULL,NULL,151,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,780,0,20,NULL,NULL,260,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,781,0,20,NULL,NULL,203,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,782,0,20,NULL,NULL,106,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,783,0,20,NULL,NULL,198,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,784,0,20,NULL,NULL,94,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,785,0,20,NULL,NULL,185,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,786,0,20,NULL,NULL,156,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,787,0,20,NULL,NULL,258,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,788,0,20,NULL,NULL,289,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,789,0,20,NULL,NULL,76,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,790,0,20,NULL,NULL,4,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,791,0,20,NULL,NULL,232,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,792,0,20,NULL,NULL,286,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,793,0,20,NULL,NULL,12,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,794,0,20,NULL,NULL,181,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,795,0,20,NULL,NULL,83,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,796,0,20,NULL,NULL,143,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,797,0,20,NULL,NULL,158,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,798,0,20,NULL,NULL,187,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,799,0,20,NULL,NULL,240,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,800,0,20,NULL,NULL,247,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,801,0,20,NULL,NULL,277,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,802,0,20,NULL,NULL,107,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,803,0,20,NULL,NULL,153,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,804,0,20,NULL,NULL,169,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,805,0,20,NULL,NULL,109,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,806,0,20,NULL,NULL,304,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,807,0,20,NULL,NULL,221,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,808,0,20,NULL,NULL,279,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,809,0,20,NULL,NULL,307,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,810,0,20,NULL,NULL,276,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,811,0,20,NULL,NULL,275,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,812,0,20,NULL,NULL,274,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,813,0,20,NULL,NULL,273,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,814,0,20,NULL,NULL,272,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,815,0,20,NULL,NULL,52,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,816,0,20,NULL,NULL,89,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,817,0,20,NULL,NULL,301,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,818,0,20,NULL,NULL,71,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,819,0,20,NULL,NULL,62,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,820,0,20,NULL,NULL,22,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,821,0,20,NULL,NULL,234,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,822,0,20,NULL,NULL,222,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,823,0,20,NULL,NULL,178,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,824,0,20,NULL,NULL,93,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,825,0,20,NULL,NULL,39,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,826,0,20,NULL,NULL,104,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,827,0,20,NULL,NULL,209,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,828,0,20,NULL,NULL,173,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,829,0,20,NULL,NULL,162,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,830,0,20,NULL,NULL,216,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,831,0,20,NULL,NULL,312,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,832,0,20,NULL,NULL,325,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,833,0,20,NULL,NULL,98,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,834,0,20,NULL,NULL,95,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,835,0,20,NULL,NULL,249,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,836,0,20,NULL,NULL,56,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,837,0,20,NULL,NULL,55,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,838,0,20,NULL,NULL,118,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,839,0,20,NULL,NULL,46,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,840,0,20,NULL,NULL,164,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,841,0,20,NULL,NULL,166,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,842,0,20,NULL,NULL,97,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,843,0,20,NULL,NULL,278,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,844,0,20,NULL,NULL,79,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,845,0,20,NULL,NULL,149,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,846,0,20,NULL,NULL,25,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,847,0,20,NULL,NULL,211,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,848,0,20,NULL,NULL,102,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,849,0,20,NULL,NULL,314,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,850,0,20,NULL,NULL,155,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,851,0,20,NULL,NULL,34,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,852,0,20,NULL,NULL,7,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,853,0,20,NULL,NULL,142,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,854,0,20,NULL,NULL,141,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,855,0,20,NULL,NULL,113,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,856,0,20,NULL,NULL,140,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,857,0,20,NULL,NULL,81,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,858,0,20,NULL,NULL,36,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,859,0,20,NULL,NULL,300,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,860,0,20,NULL,NULL,309,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,861,0,20,NULL,NULL,18,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,862,0,20,NULL,NULL,11,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,863,0,20,NULL,NULL,298,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,864,0,20,NULL,NULL,154,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,865,0,20,NULL,NULL,241,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,866,0,20,NULL,NULL,44,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,867,0,20,NULL,NULL,191,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,868,0,20,NULL,NULL,327,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,869,0,20,NULL,NULL,190,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,870,0,20,NULL,NULL,129,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,871,0,20,NULL,NULL,10,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,872,0,20,NULL,NULL,91,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,873,0,20,NULL,NULL,294,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,874,0,20,NULL,NULL,110,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,875,0,20,NULL,NULL,259,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,876,0,20,NULL,NULL,65,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,877,0,20,NULL,NULL,125,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,878,0,20,NULL,NULL,38,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,879,0,20,NULL,NULL,179,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,880,0,20,NULL,NULL,30,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,881,0,20,NULL,NULL,112,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,882,0,20,NULL,NULL,74,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,883,0,20,NULL,NULL,326,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,884,0,20,NULL,NULL,315,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,885,0,20,NULL,NULL,246,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,886,0,20,NULL,NULL,219,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,887,0,20,NULL,NULL,303,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,888,0,20,NULL,NULL,80,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,889,0,20,NULL,NULL,59,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,890,0,20,NULL,NULL,60,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,891,0,20,NULL,NULL,70,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,892,0,20,NULL,NULL,69,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,893,0,20,NULL,NULL,68,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,894,0,20,NULL,NULL,245,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,895,0,20,NULL,NULL,202,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,896,0,20,NULL,NULL,322,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,897,0,20,NULL,NULL,199,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,898,0,20,NULL,NULL,194,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,899,0,20,NULL,NULL,160,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,900,0,20,NULL,NULL,208,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,901,0,20,NULL,NULL,305,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,902,0,20,NULL,NULL,228,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,903,0,20,NULL,NULL,6,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,904,0,20,NULL,NULL,282,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,905,0,20,NULL,NULL,51,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,906,0,20,NULL,NULL,122,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,907,0,20,NULL,NULL,284,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,908,0,20,NULL,NULL,226,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,909,0,20,NULL,NULL,283,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,910,0,20,NULL,NULL,264,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,911,0,20,NULL,NULL,150,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,912,0,20,NULL,NULL,291,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,913,0,20,NULL,NULL,16,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,914,0,20,NULL,NULL,116,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,915,0,20,NULL,NULL,72,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,916,0,20,NULL,NULL,217,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,917,0,20,NULL,NULL,295,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,918,0,20,NULL,NULL,32,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,919,0,20,NULL,NULL,57,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,920,0,20,NULL,NULL,244,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,921,0,20,NULL,NULL,197,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,922,0,20,NULL,NULL,58,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,923,0,20,NULL,NULL,63,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,924,0,20,NULL,NULL,66,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,925,0,20,NULL,NULL,64,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,926,0,20,NULL,NULL,61,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,927,0,20,NULL,NULL,223,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,928,0,20,NULL,NULL,225,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,929,0,20,NULL,NULL,267,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,930,0,20,NULL,NULL,266,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,931,0,20,NULL,NULL,193,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,932,0,20,NULL,NULL,236,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,933,0,20,NULL,NULL,239,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,934,0,20,NULL,NULL,146,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,935,0,20,NULL,NULL,186,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,936,0,20,NULL,NULL,206,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,937,0,20,NULL,NULL,176,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,938,0,20,NULL,NULL,261,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,939,0,20,NULL,NULL,31,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,940,0,20,NULL,NULL,48,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,941,0,20,NULL,NULL,33,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,942,0,20,NULL,NULL,145,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,943,0,20,NULL,NULL,177,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,944,0,20,NULL,NULL,115,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,945,0,20,NULL,NULL,114,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,946,0,20,NULL,NULL,257,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,947,0,20,NULL,NULL,84,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,948,0,20,NULL,NULL,324,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,949,0,20,NULL,NULL,252,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,950,0,20,NULL,NULL,296,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,951,0,20,NULL,NULL,227,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,952,0,20,NULL,NULL,318,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,953,0,20,NULL,NULL,28,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,954,0,20,NULL,NULL,92,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,955,0,20,NULL,NULL,135,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,956,0,20,NULL,NULL,224,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,957,0,20,NULL,NULL,207,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,958,0,20,NULL,NULL,287,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,959,0,20,NULL,NULL,229,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,960,0,20,NULL,NULL,14,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,961,0,20,NULL,NULL,293,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,962,0,20,NULL,NULL,108,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,963,0,20,NULL,NULL,103,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,964,0,20,NULL,NULL,205,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,965,0,20,NULL,NULL,3,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,966,0,20,NULL,NULL,302,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,967,0,20,NULL,NULL,101,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,968,0,20,NULL,NULL,24,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,969,0,20,NULL,NULL,27,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,970,0,20,NULL,NULL,23,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,971,0,20,NULL,NULL,269,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,972,0,20,NULL,NULL,123,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,973,0,20,NULL,NULL,311,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,974,0,20,NULL,NULL,189,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,975,0,20,NULL,NULL,321,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,976,0,20,NULL,NULL,40,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,977,0,20,NULL,NULL,9,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,978,0,20,NULL,NULL,77,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,979,0,20,NULL,NULL,41,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,980,0,20,NULL,NULL,297,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,981,0,20,NULL,NULL,233,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,982,0,20,NULL,NULL,42,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,983,0,20,NULL,NULL,147,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,984,0,20,NULL,NULL,214,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,985,0,20,NULL,NULL,212,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,986,0,20,NULL,NULL,213,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,987,0,20,NULL,NULL,168,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,988,0,20,NULL,NULL,167,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,989,0,20,NULL,NULL,253,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,990,0,20,NULL,NULL,50,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,991,0,20,NULL,NULL,171,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,992,0,20,NULL,NULL,163,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,993,0,20,NULL,NULL,310,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,994,0,20,NULL,NULL,251,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,995,0,20,NULL,NULL,195,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,996,0,20,NULL,NULL,196,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,997,0,20,NULL,NULL,170,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,998,0,20,NULL,NULL,192,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,999,0,20,NULL,NULL,67,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,1000,0,20,NULL,NULL,19,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,1001,0,20,NULL,NULL,268,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,1002,0,20,NULL,NULL,299,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,1003,0,20,NULL,NULL,26,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,1004,0,20,NULL,NULL,21,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,1005,0,20,NULL,NULL,183,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,1006,0,20,NULL,NULL,215,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,1007,0,20,NULL,NULL,238,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,1008,0,20,NULL,NULL,78,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,1009,0,20,NULL,NULL,306,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,1010,0,20,NULL,NULL,49,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,1011,0,20,NULL,NULL,220,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,1012,0,20,NULL,NULL,188,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,1013,0,20,NULL,NULL,8,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,1014,0,20,NULL,NULL,1,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,1015,0,20,NULL,NULL,82,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,1016,0,20,NULL,NULL,320,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,1017,0,20,NULL,NULL,263,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,1018,0,20,NULL,NULL,265,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,1019,0,20,NULL,NULL,126,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,1020,0,20,NULL,NULL,47,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,1021,0,20,NULL,NULL,75,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,1022,0,20,NULL,NULL,119,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,1023,0,20,NULL,NULL,37,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,1024,0,20,NULL,NULL,280,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,1025,0,20,NULL,NULL,323,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,1026,0,20,NULL,NULL,29,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,1027,0,20,NULL,NULL,262,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,1028,0,20,NULL,NULL,86,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,1029,0,20,NULL,NULL,136,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,1030,0,20,NULL,NULL,250,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,1031,0,20,NULL,NULL,73,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,1032,0,20,NULL,NULL,35,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,1033,0,20,NULL,NULL,20,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,1034,0,20,NULL,NULL,328,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,1035,0,20,NULL,NULL,159,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,1036,0,20,NULL,NULL,271,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,1037,0,20,NULL,NULL,127,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,1038,0,20,NULL,NULL,317,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,1039,0,20,NULL,NULL,174,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,1040,0,20,NULL,NULL,172,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,1041,0,20,NULL,NULL,201,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,1042,0,20,NULL,NULL,161,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,1043,0,20,NULL,NULL,15,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,1044,0,20,NULL,NULL,230,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,1045,0,20,NULL,NULL,54,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,1046,0,20,NULL,NULL,134,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,1047,0,20,NULL,NULL,133,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,1048,0,20,NULL,NULL,132,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,1049,0,20,NULL,NULL,130,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,1050,0,20,NULL,NULL,131,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,1051,0,20,NULL,NULL,99,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,1052,0,20,NULL,NULL,332,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,1053,0,20,NULL,NULL,329,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,1054,0,20,NULL,NULL,331,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,1055,0,20,NULL,NULL,330,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,1056,0,20,NULL,NULL,319,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,1057,0,20,NULL,NULL,137,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,1058,0,20,NULL,NULL,138,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,1059,0,20,NULL,NULL,139,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,1060,0,20,NULL,NULL,152,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,1061,0,20,NULL,NULL,120,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,1062,0,20,NULL,NULL,292,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,1063,0,20,NULL,NULL,182,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,1064,0,20,NULL,NULL,210,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,1065,0,20,NULL,NULL,111,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,1066,0,20,NULL,NULL,121,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,1067,0,20,NULL,NULL,218,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,1068,0,20,NULL,NULL,248,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,1069,0,20,NULL,NULL,308,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,1070,0,20,NULL,NULL,281,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,1071,0,20,NULL,NULL,53,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,1072,0,20,NULL,NULL,270,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,1073,0,20,NULL,NULL,254,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,1074,0,20,NULL,NULL,256,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,1075,0,20,NULL,NULL,288,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,1076,0,20,NULL,NULL,235,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,1077,0,20,NULL,NULL,87,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,1078,0,20,NULL,NULL,231,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,1079,0,20,NULL,NULL,175,NULL),('-','2020-11-29 21:29:03','-','2020-11-29 21:29:03',0,1080,0,20,NULL,NULL,184,NULL),('-','2020-11-30 07:06:52','-','2020-11-30 07:06:52',0,1081,1,24,NULL,NULL,NULL,2),('-','2020-11-30 08:01:56','-','2020-11-30 08:01:56',0,1082,1,24,NULL,NULL,NULL,1),('-','2020-11-30 08:11:59','-','2020-11-30 08:11:59',0,1083,1,24,NULL,NULL,NULL,3),('-','2020-12-02 11:57:28','-','2020-12-02 11:57:28',0,1084,0,1,1,NULL,NULL,NULL),('-','2020-12-02 11:57:28','-','2020-12-02 11:57:28',0,1085,0,1,2,NULL,NULL,NULL),('-','2020-12-02 11:57:28','-','2020-12-02 11:57:28',0,1086,0,1,3,NULL,NULL,NULL),('-','2020-12-02 11:57:28','-','2020-12-02 11:57:28',0,1087,0,1,5,NULL,NULL,NULL),('-','2020-12-02 11:57:28','-','2020-12-02 11:57:28',0,1088,0,1,4,NULL,NULL,NULL),('-','2020-12-02 11:57:28','-','2020-12-02 11:57:28',0,1089,0,1,6,NULL,NULL,NULL),('-','2020-12-02 11:57:28','-','2020-12-02 11:57:28',0,1090,0,1,7,NULL,NULL,NULL),('-','2020-12-02 11:57:28','-','2020-12-02 11:57:28',0,1091,0,1,8,NULL,NULL,NULL),('-','2020-12-02 11:57:28','-','2020-12-02 11:57:28',0,1092,0,1,9,NULL,NULL,NULL),('-','2020-12-02 11:58:53','-','2020-12-02 11:58:53',0,1093,1,3,NULL,NULL,NULL,3),('-','2020-12-02 14:35:49','-','2020-12-02 14:35:49',0,1094,0,2,NULL,4,NULL,3),('-','2020-12-02 14:35:49','-','2020-12-02 14:35:49',0,1095,0,2,NULL,21,NULL,1),('-','2020-12-02 14:35:49','-','2020-12-02 14:35:49',0,1096,0,2,NULL,18,NULL,2),('-','2020-12-02 14:42:24','-','2020-12-02 14:42:24',0,1097,0,8,1,NULL,NULL,NULL),('-','2020-12-02 14:42:24','-','2020-12-02 14:42:24',0,1098,0,8,2,NULL,NULL,NULL),('-','2020-12-02 14:42:24','-','2020-12-02 14:42:24',0,1099,0,8,3,NULL,NULL,NULL),('-','2020-12-02 14:42:24','-','2020-12-02 14:42:24',0,1100,0,8,5,NULL,NULL,NULL),('-','2020-12-02 14:42:24','-','2020-12-02 14:42:24',0,1101,0,8,4,NULL,NULL,NULL),('-','2020-12-02 14:42:24','-','2020-12-02 14:42:24',0,1102,0,8,6,NULL,NULL,NULL),('-','2020-12-02 14:42:24','-','2020-12-02 14:42:24',0,1103,0,8,7,NULL,NULL,NULL),('-','2020-12-02 14:42:24','-','2020-12-02 14:42:24',0,1104,0,8,8,NULL,NULL,1),('-','2020-12-02 14:42:24','-','2020-12-02 14:42:24',0,1105,0,8,9,NULL,NULL,NULL),('-','2020-12-02 21:27:41','-','2020-12-02 21:27:41',0,1106,1,25,NULL,NULL,NULL,13);
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
  `deadline` datetime DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  `valueInParameterStandard` varchar(255) DEFAULT NULL,
  `dataRequestNote` varchar(255) DEFAULT NULL,
  `notedataEntry` varchar(255) DEFAULT NULL,
  `notedataApprover` varchar(255) DEFAULT NULL,
  `notedataCCS` varchar(255) DEFAULT NULL,
  `chatURL` varchar(255) DEFAULT NULL,
  `unitOfMeasureDataEntryId` int DEFAULT NULL,
  `unitOfMeasureInParameterStandardId` int DEFAULT NULL,
  `parameterId` int NOT NULL,
  `requestedDate` datetime NOT NULL,
  `requestdYear` int DEFAULT NULL,
  `startDate` datetime NOT NULL,
  `endDate` datetime NOT NULL,
  `parameterLocationId` int DEFAULT NULL,
  `frequencyId` int DEFAULT NULL,
  `frequencyDetailId` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_9c1cfa7455137be993c748f4fb9` (`unitOfMeasureDataEntryId`),
  KEY `FK_91be78c2664f7d4f040f17b8f99` (`unitOfMeasureInParameterStandardId`),
  KEY `FK_c2412abf1eb184d60c549ce1d36` (`parameterLocationId`),
  KEY `FK_253a66bc6b97d1d11b4fa26af15` (`frequencyId`),
  KEY `FK_dd9a84a8d942cec81fd3b73b7e0` (`frequencyDetailId`),
  CONSTRAINT `FK_253a66bc6b97d1d11b4fa26af15` FOREIGN KEY (`frequencyId`) REFERENCES `frequency` (`id`),
  CONSTRAINT `FK_91be78c2664f7d4f040f17b8f99` FOREIGN KEY (`unitOfMeasureInParameterStandardId`) REFERENCES `unit_of_measure` (`id`),
  CONSTRAINT `FK_9c1cfa7455137be993c748f4fb9` FOREIGN KEY (`unitOfMeasureDataEntryId`) REFERENCES `unit_of_measure` (`id`),
  CONSTRAINT `FK_c2412abf1eb184d60c549ce1d36` FOREIGN KEY (`parameterLocationId`) REFERENCES `parameter_location` (`id`),
  CONSTRAINT `FK_dd9a84a8d942cec81fd3b73b7e0` FOREIGN KEY (`frequencyDetailId`) REFERENCES `frequency_detail` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parameter_location_data`
--

LOCK TABLES `parameter_location_data` WRITE;
/*!40000 ALTER TABLE `parameter_location_data` DISABLE KEYS */;
INSERT INTO `parameter_location_data` VALUES ('-','2020-12-03 00:16:59','-','2020-12-03 00:16:59',0,2,'2021-12-09 00:00:00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,2,'2020-12-03 00:16:59',NULL,'2020-02-01 00:00:00','2021-02-01 00:00:00',1095,4,NULL),('-','2020-12-03 00:22:48','-','2020-12-03 00:22:48',0,3,'2021-12-09 00:00:00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,2,'2020-12-03 00:22:48',NULL,'2020-02-01 00:00:00','2021-02-01 00:00:00',1094,4,NULL);
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
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `policy`
--

LOCK TABLES `policy` WRITE;
/*!40000 ALTER TABLE `policy` DISABLE KEYS */;
INSERT INTO `policy` VALUES (' ','2020-11-15 00:00:00',' ','2020-11-15 00:00:00',0,1,'Policy 0001','Policy 001');
/*!40000 ALTER TABLE `policy` ENABLE KEYS */;
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
  `description` varchar(255) NOT NULL,
  `proposedDateOfCommence` datetime NOT NULL,
  `scope` varchar(255) NOT NULL,
  `projectStatusId` int DEFAULT NULL,
  `climateChangeDataCategoryId` int DEFAULT NULL,
  `sectorId` int DEFAULT NULL,
  `subSectorId` int DEFAULT NULL,
  `projectTypeId` int DEFAULT NULL,
  `isProject` tinyint NOT NULL,
  `longitude` decimal(10,6) NOT NULL DEFAULT '0.000000',
  `latitude` decimal(10,6) NOT NULL DEFAULT '0.000000',
  `ghgEmissions` varchar(255) DEFAULT NULL,
  `adaptationBenefits` varchar(255) DEFAULT NULL,
  `isPublicProponent` tinyint NOT NULL DEFAULT '0',
  `partiesInvolved` varchar(255) DEFAULT NULL,
  `publicDonor` tinyint NOT NULL DEFAULT '0',
  `privateDonor` tinyint NOT NULL DEFAULT '0',
  `internationalDonor` tinyint NOT NULL DEFAULT '0',
  `privatePublicDonor` tinyint NOT NULL DEFAULT '0',
  `ngoDonor` tinyint NOT NULL DEFAULT '0',
  `fundingOrganization` varchar(255) DEFAULT NULL,
  `initialInvestment` decimal(10,6) DEFAULT NULL,
  `annualFunding` decimal(10,6) DEFAULT NULL,
  `initialInvestmentCurrencyId` int DEFAULT NULL,
  `annualFundingCurrencyId` int DEFAULT NULL,
  `financingSchemeId` int DEFAULT NULL,
  `directSDBenefitId` int DEFAULT NULL,
  `indirectSDBenefitId` int DEFAULT NULL,
  `provinceId` int DEFAULT NULL,
  `districtId` int DEFAULT NULL,
  `divisionalSecretariatId` int DEFAULT NULL,
  `projectDuration` decimal(5,1) NOT NULL DEFAULT '0.0',
  PRIMARY KEY (`id`),
  KEY `FK_106ed992950b2d800d6d4abefa5` (`projectStatusId`),
  KEY `FK_50440573a1ef41f28e305faf2b4` (`climateChangeDataCategoryId`),
  KEY `FK_696cb61bda6241bdc7e62fc2ab2` (`sectorId`),
  KEY `FK_1908041df927fe2c714d6e9086e` (`subSectorId`),
  KEY `FK_dc6d8b7ae9d296c87e318ac3267` (`projectTypeId`),
  KEY `FK_9fffc052079e56f40c05af60461` (`initialInvestmentCurrencyId`),
  KEY `FK_95dfd74c2e301d5618f44c16783` (`annualFundingCurrencyId`),
  KEY `FK_fd275fe2ac4c590220c0a4e70e6` (`financingSchemeId`),
  KEY `FK_0c9305775b4c5746455d66bab9d` (`directSDBenefitId`),
  KEY `FK_d3254ae9e8df0f2b3c8bd677671` (`indirectSDBenefitId`),
  KEY `FK_9ab01fb36ba80c0c3d7c69be4b1` (`provinceId`),
  KEY `FK_abedc12db6f3e4438bda16de517` (`districtId`),
  KEY `FK_174cf56ab9d5195029302620d26` (`divisionalSecretariatId`),
  CONSTRAINT `FK_0c9305775b4c5746455d66bab9d` FOREIGN KEY (`directSDBenefitId`) REFERENCES `sd_benefit` (`id`),
  CONSTRAINT `FK_106ed992950b2d800d6d4abefa5` FOREIGN KEY (`projectStatusId`) REFERENCES `project_status` (`id`),
  CONSTRAINT `FK_174cf56ab9d5195029302620d26` FOREIGN KEY (`divisionalSecretariatId`) REFERENCES `divisional_secretariat` (`id`),
  CONSTRAINT `FK_1908041df927fe2c714d6e9086e` FOREIGN KEY (`subSectorId`) REFERENCES `sub_sector` (`id`),
  CONSTRAINT `FK_50440573a1ef41f28e305faf2b4` FOREIGN KEY (`climateChangeDataCategoryId`) REFERENCES `climate_change_data_category` (`id`),
  CONSTRAINT `FK_696cb61bda6241bdc7e62fc2ab2` FOREIGN KEY (`sectorId`) REFERENCES `sector` (`id`),
  CONSTRAINT `FK_95dfd74c2e301d5618f44c16783` FOREIGN KEY (`annualFundingCurrencyId`) REFERENCES `currency` (`id`),
  CONSTRAINT `FK_9ab01fb36ba80c0c3d7c69be4b1` FOREIGN KEY (`provinceId`) REFERENCES `province` (`id`),
  CONSTRAINT `FK_9fffc052079e56f40c05af60461` FOREIGN KEY (`initialInvestmentCurrencyId`) REFERENCES `currency` (`id`),
  CONSTRAINT `FK_abedc12db6f3e4438bda16de517` FOREIGN KEY (`districtId`) REFERENCES `district` (`id`),
  CONSTRAINT `FK_d3254ae9e8df0f2b3c8bd677671` FOREIGN KEY (`indirectSDBenefitId`) REFERENCES `sd_benefit` (`id`),
  CONSTRAINT `FK_dc6d8b7ae9d296c87e318ac3267` FOREIGN KEY (`projectTypeId`) REFERENCES `project_type` (`id`),
  CONSTRAINT `FK_fd275fe2ac4c590220c0a4e70e6` FOREIGN KEY (`financingSchemeId`) REFERENCES `financing_scheme` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_programme`
--

LOCK TABLES `project_programme` WRITE;
/*!40000 ALTER TABLE `project_programme` DISABLE KEYS */;
INSERT INTO `project_programme` VALUES (' ','2020-11-15 00:00:00',' ','2020-11-15 00:00:00',0,1,'Project 1',' ','2020-11-15 00:00:00','scope',1,1,1,1,1,0,0.000000,0.000000,NULL,NULL,0,NULL,0,0,0,0,0,NULL,0.000000,0.000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.0),(' ','2020-11-15 00:00:00',' ','2020-11-15 00:00:00',0,2,'Project 2',' ','2020-11-15 00:00:00','scope',1,1,2,1,1,0,0.000000,0.000000,NULL,NULL,0,NULL,0,0,0,0,0,NULL,0.000000,0.000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.0),(' ','2020-11-15 00:00:00',' ','2020-11-15 00:00:00',0,3,'Project 3',' ','2020-11-15 00:00:00','scope',1,1,2,1,1,0,0.000000,0.000000,NULL,NULL,0,NULL,0,0,0,0,0,NULL,0.000000,0.000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.0),(' ','2020-11-15 00:00:00',' ','2020-11-15 00:00:00',0,4,'Project 4',' ','2020-11-15 00:00:00','scope',1,1,1,1,1,0,0.000000,0.000000,NULL,NULL,0,NULL,0,0,0,0,0,NULL,0.000000,0.000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.0),(' ','2020-11-15 00:00:00',' ','2020-11-15 00:00:00',0,5,'Project 5',' ','2020-11-15 00:00:00','scope',1,1,2,1,1,0,0.000000,0.000000,NULL,NULL,0,NULL,0,0,0,0,0,NULL,0.000000,0.000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.0),(' ','2020-11-15 00:00:00',' ','2020-11-15 00:00:00',0,6,'Project 6',' ','2020-11-15 00:00:00','scope',1,1,1,1,1,0,0.000000,0.000000,NULL,NULL,0,NULL,0,0,0,0,0,NULL,0.000000,0.000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.0),(' ','2020-11-15 00:00:00',' ','2020-11-15 00:00:00',0,7,'Project 7',' ','2020-11-15 00:00:00','scope',1,1,1,1,1,0,0.000000,0.000000,NULL,NULL,0,NULL,0,0,0,0,0,NULL,0.000000,0.000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.0),('','2020-11-30 08:58:07','','2020-11-30 08:58:07',0,8,'P1','D','2020-11-17 00:00:00','S',1,3,1,NULL,2,1,72.000000,10.000000,'GHB emmition','AAAA BBB',0,'P',1,0,1,0,0,'A',10.000000,20.000000,1,1,1,1,1,1,1,165,10.0);
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
  `description` varchar(255) NOT NULL,
  `sortOrder` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_status`
--

LOCK TABLES `project_status` WRITE;
/*!40000 ALTER TABLE `project_status` DISABLE KEYS */;
INSERT INTO `project_status` VALUES (' ','2020-11-15 00:00:00',' ','2020-11-15 00:00:00',0,1,'S1','s1',1);
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
  `description` varchar(255) NOT NULL,
  `sortOrder` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_type`
--

LOCK TABLES `project_type` WRITE;
/*!40000 ALTER TABLE `project_type` DISABLE KEYS */;
INSERT INTO `project_type` VALUES (' ','2020-11-15 00:00:00',' ','2020-11-15 00:00:00',0,1,'Project','Project',1),(' ','2020-11-15 00:00:00',' ','2020-11-15 00:00:00',0,2,'Programme','Programme',1);
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
  `description` varchar(255) NOT NULL,
  `sortOrder` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `province`
--

LOCK TABLES `province` WRITE;
/*!40000 ALTER TABLE `province` DISABLE KEYS */;
INSERT INTO `province` VALUES ('','0000-00-00 00:00:00','','0000-00-00 00:00:00',0,1,'Central','Central',1),('','0000-00-00 00:00:00','','0000-00-00 00:00:00',0,2,'Eastern','Eastern',2),('','0000-00-00 00:00:00','','0000-00-00 00:00:00',0,3,'North Central','North Central',3),('','0000-00-00 00:00:00','','0000-00-00 00:00:00',0,4,'Northern','Northern',4),('','0000-00-00 00:00:00','','0000-00-00 00:00:00',0,5,'North Western','North Western',5),('','0000-00-00 00:00:00','','0000-00-00 00:00:00',0,6,'Sabaragamuwa','Sabaragamuwa',6),('','0000-00-00 00:00:00','','0000-00-00 00:00:00',0,7,'Southern','Southern',7),('','0000-00-00 00:00:00','','0000-00-00 00:00:00',0,8,'Uva','Uva',8),('','0000-00-00 00:00:00','','0000-00-00 00:00:00',0,9,'Western','Western',9);
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
  `description` varchar(255) NOT NULL,
  `sortOrder` int NOT NULL,
  `isDirectBenefit` tinyint NOT NULL,
  `isInDirectBenefit` tinyint NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sd_benefit`
--

LOCK TABLES `sd_benefit` WRITE;
/*!40000 ALTER TABLE `sd_benefit` DISABLE KEYS */;
INSERT INTO `sd_benefit` VALUES (' ','2020-11-20 00:00:00',' ','2020-11-20 00:00:00',1,1,'B1','B1',1,1,0),(' ','2020-11-20 00:00:00',' ','2020-11-20 00:00:00',1,2,'B2','B2',1,0,1);
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
  `description` varchar(255) NOT NULL,
  `sortOrder` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sector`
--

LOCK TABLES `sector` WRITE;
/*!40000 ALTER TABLE `sector` DISABLE KEYS */;
INSERT INTO `sector` VALUES (' ','2020-11-15 00:00:00',' ','2020-11-15 00:00:00',0,1,'Sector 1','Sector 1',1),(' ','2020-11-15 00:00:00',' ','2020-11-15 00:00:00',0,2,'Sector 2','Sector 2',1);
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
  `description` varchar(255) NOT NULL,
  `sortOrder` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sector_moe`
--

LOCK TABLES `sector_moe` WRITE;
/*!40000 ALTER TABLE `sector_moe` DISABLE KEYS */;
INSERT INTO `sector_moe` VALUES (' ','2020-11-15 00:00:00',' ','2020-11-15 00:00:00',0,1,'Secot MoE 1','',1),(' ','2020-11-15 00:00:00',' ','2020-11-15 00:00:00',0,2,'Secot MoE 2',' ',1);
/*!40000 ALTER TABLE `sector_moe` ENABLE KEYS */;
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
  `description` varchar(255) NOT NULL,
  `sortOrder` int NOT NULL,
  `sectorId` int DEFAULT NULL,
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
INSERT INTO `sub_sector` VALUES (' ','2020-11-15 00:00:00',' ','2020-11-15 00:00:00',0,1,'S1-Sub1',' ',1,1),('  ','2020-11-15 00:00:00',' ','2020-11-15 00:00:00',0,2,'S1-Sub2',' ',1,1),(' ','2020-11-15 00:00:00',' ','2020-11-15 00:00:00',0,3,'S2-Sub1',' ',1,2),('  ','2020-11-15 00:00:00',' ','2020-11-15 00:00:00',0,4,'S2-Sub2',' ',1,2);
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unit_of_measure`
--

LOCK TABLES `unit_of_measure` WRITE;
/*!40000 ALTER TABLE `unit_of_measure` DISABLE KEYS */;
INSERT INTO `unit_of_measure` VALUES (' ','2020-11-14 00:00:00',' ','2020-11-14 00:00:00',0,1,'meter','length','m',1,1,'m','m'),(' ','2020-11-14 00:00:00',' ','2020-11-14 00:00:00',0,2,'gram','mass','g',1,1,'g','g');
/*!40000 ALTER TABLE `unit_of_measure` ENABLE KEYS */;
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
  PRIMARY KEY (`id`),
  UNIQUE KEY `IDX_78a916df40e02a9deb1c4b75ed` (`username`),
  UNIQUE KEY `IDX_e12875dfb3b1d92d7d7c5377e2` (`email`),
  KEY `FK_29f29dffce2845a1abc901d4e85` (`userTypeId`),
  KEY `FK_ca0de218397aed2409d865d1580` (`institutionId`),
  CONSTRAINT `FK_29f29dffce2845a1abc901d4e85` FOREIGN KEY (`userTypeId`) REFERENCES `user_type` (`id`),
  CONSTRAINT `FK_ca0de218397aed2409d865d1580` FOREIGN KEY (`institutionId`) REFERENCES `institution` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('','2020-11-01 14:24:22','','2020-11-01 14:24:22',0,1,'Amal12','Kumara','rohan2@techtranz.com','rohan2@techtranz.com','Mr.','HOD1','+01 121 231-2311','+07 731 231-2322','0123456789','n/a','','',1,3),('','2020-11-01 14:24:34','','2020-11-01 14:24:34',0,2,'Kamal','Perera','rohan3@techtranz.com','rohan3@techtranz.com','Mr.','HOD','0112123123','0773123123','0123456789','$2b$10$CjrGSm9fP/rUPX7C7ML6r.','$2b$10$CjrGSm9fP/rUPX7C7ML6r.Fsy5h6QkDM7wK.pxbmFCoZdGs5dc.1e','',1,1),('','2020-11-03 17:20:22','','2020-11-03 17:20:22',0,3,'Sapumal','Disanayake','rohan1@techtranz.com','rohan1@techtranz.com','Mr','DOP','0112655677','0718567567','0718567567','n/a','','',1,1),('','2020-11-04 06:11:40','','2020-11-04 06:11:40',0,5,'Saman','Herath','saman@gmail.com','saman@gmail.com','Mr','HOD','0112858585','0718123123','0','n/a','','',1,1),('','2020-11-23 11:37:50','','2020-11-23 11:37:50',0,6,'Rohan','Map','r1@tt.com','r1@tt.com','Mr','HOD','+94 111 111-1111','+94 222 222-2222','121212122123','n/a','','',1,1),('','2020-11-23 11:40:56','','2020-11-23 11:40:56',0,7,'Rohan','Map2','r2@tt.com','r2@tt.com','Mr','Dr','+94 121 212-1223','+94 121 212-123_','111111111111','n/a','','',1,1),('','2020-11-23 13:55:20','','2020-11-23 13:55:20',0,12,'Rohan','Map','aa@aa.aa','aa@aa.aa','Mr','HOD','+94 ___ ___-____','+94 ___ ___-____','1___________','$2b$10$X0tPmNIsTsU0jNd/4hAb7.','$2b$10$X0tPmNIsTsU0jNd/4hAb7.WOGpVJsdaZkf42xVQx7SBQ32gL1/43m','',1,1),('','2020-11-23 13:56:40','','2020-11-23 13:56:40',0,13,'Rohan','Map','aaaa@aa.aa','aaaa@aa.aa','Mr','HOD','+94 ___ ___-____','+94 ___ ___-____','1___________','$2b$10$QQRhnLyP/qRds560Enp6/e','$2b$10$QQRhnLyP/qRds560Enp6/evtS0euB0/Z3SIUIKPKPR.GeQTIH8V5i','7f0d79f4-3ebc-465e-9380-e1b789b67f9f',1,1);
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
  `description` varchar(255) NOT NULL,
  `sortOrder` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_type`
--

LOCK TABLES `user_type` WRITE;
/*!40000 ALTER TABLE `user_type` DISABLE KEYS */;
INSERT INTO `user_type` VALUES ('','0000-00-00 00:00:00','','0000-00-00 00:00:00',0,1,'CCS-Admin','CCS-Admin',1),('','0000-00-00 00:00:00','','0000-00-00 00:00:00',0,2,'CCS-DEU','CCS-Data entry user',1);
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

-- Dump completed on 2020-12-03  0:41:21

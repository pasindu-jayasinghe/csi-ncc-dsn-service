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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `institution`
--

LOCK TABLES `institution` WRITE;
/*!40000 ALTER TABLE `institution` DISABLE KEYS */;
INSERT INTO `institution` VALUES ('','2020-11-08 17:52:42','','2020-11-08 17:52:42',0,1,'Ministry of Energy','Ministry of Energy',1,1,9,23,NULL,NULL,0,NULL),('','0000-00-00 00:00:00','','0000-00-00 00:00:00',0,2,'Ministry of helth','Ministry of helth',1,1,9,23,NULL,1,0,NULL),('','2020-11-08 17:47:56','','2020-11-08 17:47:56',0,3,'Sri Lanka Railways','Sri Lanka Railways colombo',0,3,NULL,NULL,NULL,NULL,0,1);
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
  `subSectorId` int DEFAULT NULL,
  `sectorMoEId` int DEFAULT NULL,
  `projectId` int DEFAULT NULL,
  `programmeId` int DEFAULT NULL,
  `policyId` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_57a80e11bc6a43e88b4f5f4dcc9` (`unitOfMeasureId`),
  KEY `FK_1391fff8fea9487096f3c512808` (`climateChangeDataCategoryId`),
  KEY `FK_4057f643789f15dbd9da9f0cadc` (`sectorId`),
  KEY `FK_0422162f35e8064ddfb7f69bd9f` (`subSectorId`),
  KEY `FK_8fff0a2eb983724ffb592d8888b` (`projectId`),
  KEY `FK_f4e83ae9a7f891c3a1855b13d10` (`programmeId`),
  KEY `FK_bbe8b48742e91d15a8dc81c72bb` (`policyId`),
  KEY `FK_d3d7f9105728a26b17d26803c1e` (`sectorMoEId`),
  CONSTRAINT `FK_0422162f35e8064ddfb7f69bd9f` FOREIGN KEY (`subSectorId`) REFERENCES `sub_sector` (`id`),
  CONSTRAINT `FK_1391fff8fea9487096f3c512808` FOREIGN KEY (`climateChangeDataCategoryId`) REFERENCES `climate_change_data_category` (`id`),
  CONSTRAINT `FK_4057f643789f15dbd9da9f0cadc` FOREIGN KEY (`sectorId`) REFERENCES `sector` (`id`),
  CONSTRAINT `FK_57a80e11bc6a43e88b4f5f4dcc9` FOREIGN KEY (`unitOfMeasureId`) REFERENCES `unit_of_measure` (`id`),
  CONSTRAINT `FK_8fff0a2eb983724ffb592d8888b` FOREIGN KEY (`projectId`) REFERENCES `project_programme` (`id`),
  CONSTRAINT `FK_bbe8b48742e91d15a8dc81c72bb` FOREIGN KEY (`policyId`) REFERENCES `policy` (`id`),
  CONSTRAINT `FK_d3d7f9105728a26b17d26803c1e` FOREIGN KEY (`sectorMoEId`) REFERENCES `sector_moe` (`id`),
  CONSTRAINT `FK_f4e83ae9a7f891c3a1855b13d10` FOREIGN KEY (`programmeId`) REFERENCES `project_programme` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parameter`
--

LOCK TABLES `parameter` WRITE;
/*!40000 ALTER TABLE `parameter` DISABLE KEYS */;
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
  `sectorId` int DEFAULT NULL,
  `provinceId` int DEFAULT NULL,
  `districtId` int DEFAULT NULL,
  `divisionalSecretariatId` int DEFAULT NULL,
  `dataSourceId` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_a473ef22c33852ad6beddc8b533` (`sectorId`),
  KEY `FK_137c1647b9bddafbd4b17b09136` (`provinceId`),
  KEY `FK_9e4e11f2a24125584ee6c7012d0` (`districtId`),
  KEY `FK_63e438fde645f4f8b932d355c99` (`divisionalSecretariatId`),
  KEY `FK_94e1a6da183c124072a5bf80933` (`dataSourceId`),
  CONSTRAINT `FK_137c1647b9bddafbd4b17b09136` FOREIGN KEY (`provinceId`) REFERENCES `province` (`id`),
  CONSTRAINT `FK_63e438fde645f4f8b932d355c99` FOREIGN KEY (`divisionalSecretariatId`) REFERENCES `divisional_secretariat` (`id`),
  CONSTRAINT `FK_94e1a6da183c124072a5bf80933` FOREIGN KEY (`dataSourceId`) REFERENCES `institution` (`id`),
  CONSTRAINT `FK_9e4e11f2a24125584ee6c7012d0` FOREIGN KEY (`districtId`) REFERENCES `district` (`id`),
  CONSTRAINT `FK_a473ef22c33852ad6beddc8b533` FOREIGN KEY (`sectorId`) REFERENCES `parameter` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parameter_location`
--

LOCK TABLES `parameter_location` WRITE;
/*!40000 ALTER TABLE `parameter_location` DISABLE KEYS */;
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
  `deadline` datetime NOT NULL,
  `value` varchar(255) NOT NULL,
  `valueInParameterStandard` varchar(255) NOT NULL,
  `dataRequestNote` varchar(255) NOT NULL,
  `notedataEntry` varchar(255) NOT NULL,
  `notedataApprover` varchar(255) NOT NULL,
  `notedataCCS` varchar(255) NOT NULL,
  `chatURL` varchar(255) NOT NULL,
  `sectorId` int DEFAULT NULL,
  `unitOfMeasureDataEntryId` int DEFAULT NULL,
  `unitOfMeasureInParameterStandardId` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_fe6c0d22d53f5fd38de4a8fbb9f` (`sectorId`),
  KEY `FK_9c1cfa7455137be993c748f4fb9` (`unitOfMeasureDataEntryId`),
  KEY `FK_91be78c2664f7d4f040f17b8f99` (`unitOfMeasureInParameterStandardId`),
  CONSTRAINT `FK_91be78c2664f7d4f040f17b8f99` FOREIGN KEY (`unitOfMeasureInParameterStandardId`) REFERENCES `unit_of_measure` (`id`),
  CONSTRAINT `FK_9c1cfa7455137be993c748f4fb9` FOREIGN KEY (`unitOfMeasureDataEntryId`) REFERENCES `unit_of_measure` (`id`),
  CONSTRAINT `FK_fe6c0d22d53f5fd38de4a8fbb9f` FOREIGN KEY (`sectorId`) REFERENCES `parameter_location` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parameter_location_data`
--

LOCK TABLES `parameter_location_data` WRITE;
/*!40000 ALTER TABLE `parameter_location_data` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `policy`
--

LOCK TABLES `policy` WRITE;
/*!40000 ALTER TABLE `policy` DISABLE KEYS */;
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_programme`
--

LOCK TABLES `project_programme` WRITE;
/*!40000 ALTER TABLE `project_programme` DISABLE KEYS */;
/*!40000 ALTER TABLE `project_programme` ENABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_type`
--

LOCK TABLES `project_type` WRITE;
/*!40000 ALTER TABLE `project_type` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sector`
--

LOCK TABLES `sector` WRITE;
/*!40000 ALTER TABLE `sector` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sector_moe`
--

LOCK TABLES `sector_moe` WRITE;
/*!40000 ALTER TABLE `sector_moe` DISABLE KEYS */;
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sub_sector`
--

LOCK TABLES `sub_sector` WRITE;
/*!40000 ALTER TABLE `sub_sector` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('','2020-11-01 14:24:22','','2020-11-01 14:24:22',0,1,'Amal12','Kumara','rohan2@techtranz.com','rohan2@techtranz.com','Mr.','HOD1','0112123123','0773123123','0123456789','n/a','','',1,2),('','2020-11-01 14:24:34','','2020-11-01 14:24:34',0,2,'Kamal','Perera','rohan3@techtranz.com','rohan3@techtranz.com','Mr.','HOD','0112123123','0773123123','0123456789','$2b$10$CjrGSm9fP/rUPX7C7ML6r.','$2b$10$CjrGSm9fP/rUPX7C7ML6r.Fsy5h6QkDM7wK.pxbmFCoZdGs5dc.1e','',1,1),('','2020-11-03 17:20:22','','2020-11-03 17:20:22',0,3,'Sapumal','Disanayake','rohan1@techtranz.com','rohan1@techtranz.com','Mr','DOP','0112655677','0718567567','0718567567','n/a','','',1,1),('','2020-11-04 06:11:40','','2020-11-04 06:11:40',0,5,'Saman','Herath','saman@gmail.com','saman@gmail.com','Mr','HOD','0112858585','0718123123','0','n/a','','',1,1);
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

-- Dump completed on 2020-11-15 21:53:40

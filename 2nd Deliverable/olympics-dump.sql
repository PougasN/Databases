-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: olympicsdb
-- ------------------------------------------------------
-- Server version	8.0.25
DROP SCHEMA IF EXISTS olympicsdb;
CREATE SCHEMA olympicsdb;
USE olympicsdb;


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
-- Table structure for table `athlete`
--

DROP TABLE IF EXISTS `athlete`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `athlete` (
  `Athlete_id` int NOT NULL,
  `Athlete_Name` varchar(45) NOT NULL,
  `BirthDate` date NOT NULL,
  `Height` decimal(3,2) NOT NULL,
  `Weight` decimal(5,2) NOT NULL,
  `Gender` enum('male','female') NOT NULL,
  `Team_Team_Name` varchar(45) NOT NULL,
  PRIMARY KEY (`Athlete_id`),
  KEY `fk_Athlete_Team1_idx` (`Team_Team_Name`),
  CONSTRAINT `fk_Athlete_Team1` FOREIGN KEY (`Team_Team_Name`) REFERENCES `team` (`Team_Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `athlete`
--

LOCK TABLES `athlete` WRITE;
/*!40000 ALTER TABLE `athlete` DISABLE KEYS */;
INSERT INTO `athlete` VALUES (1,'Papadopooulos Geresimos','1950-01-01',1.23,123.00,'male','GREECE'),(2,'O pappous mou','1950-02-01',1.53,93.00,'male','GERMANY'),(3,'H giagia mou','1950-05-01',1.45,85.00,'female','AUSTRALIA'),(4,'Tsous The','1970-03-10',1.67,95.00,'male','GREECE'),(5,'Jim Sam','1974-06-01',1.83,94.00,'male','AUSTRALIA'),(6,'Sam Big','1984-08-23',1.29,65.00,'male','IRELAND'),(7,'Nick The Greek','1978-09-11',1.57,63.00,'male','GREECE'),(8,'Old Jo','1956-03-18',1.84,74.00,'male','USA'),(9,'Francis Manis','1995-04-05',1.64,75.00,'female','FRANCE'),(10,'Alberta Norton','1986-05-21',1.77,95.00,'female','ENGLAND'),(11,'Michael Schumacher','1983-05-11',1.47,86.00,'male','GERMANY'),(12,'Michael Jordan','1985-02-16',1.74,76.00,'male','USA'),(13,'Katerina Thanou','1972-11-09',1.56,85.00,'female','BRAZIL'),(14,'Kostas Kenteris','1968-05-10',1.76,85.00,'male','GREECE'),(15,'Mark McDonald','1978-08-10',1.99,112.00,'male','IRELAND'),(16,'Hin Kin','1968-08-11',1.76,95.00,'female','CHINA'),(17,'John Smith','1977-12-24',1.47,75.00,'male','AUSTRALIA'),(18,'Ronaldo dos Santos','1979-03-14',1.86,85.00,'male','BRAZIL'),(19,'Nick McJohn','1988-08-10',1.88,74.00,'male','IRELAND'),(20,'Zoe Black','1988-05-16',1.64,85.00,'female','USA');
/*!40000 ALTER TABLE `athlete` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`pantsousis`@`%`*/ /*!50003 TRIGGER `athlete_BEFORE_INSERT` BEFORE INSERT ON `athlete` FOR EACH ROW BEGIN
	IF(NEW.Height < 0.5) THEN
		SIGNAL SQLSTATE '22003' SET MESSAGE_TEXT = 'Invalid Height';
	END IF;
    IF(NEW.Weight < 20) THEN
		SIGNAL SQLSTATE '22003' SET MESSAGE_TEXT = 'Invalid Weight';
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`pantsousis`@`%`*/ /*!50003 TRIGGER `athlete_BEFORE_UPDATE` BEFORE UPDATE ON `athlete` FOR EACH ROW BEGIN
	IF(NEW.Height < 0.5) THEN
		SIGNAL SQLSTATE '22003' SET MESSAGE_TEXT = 'Invalid Height';
	END IF;
    IF(NEW.Weight < 20) THEN
		SIGNAL SQLSTATE '22003' SET MESSAGE_TEXT = 'Invalid Weight';
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `athlete_date_stadium`
--

DROP TABLE IF EXISTS `athlete_date_stadium`;
/*!50001 DROP VIEW IF EXISTS `athlete_date_stadium`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `athlete_date_stadium` AS SELECT 
 1 AS `Athlete_name`,
 1 AS `Sport_Date`,
 1 AS `Stadium_City`,
 1 AS `Stadium_Stadium_Name`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `athlete_has_sponsor`
--

DROP TABLE IF EXISTS `athlete_has_sponsor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `athlete_has_sponsor` (
  `Athlete_Athlete_id` int NOT NULL,
  `Sponsor_Sponsor_Name` varchar(45) NOT NULL,
  PRIMARY KEY (`Athlete_Athlete_id`,`Sponsor_Sponsor_Name`),
  KEY `fk_Athlete_has_Sponsor_Athlete1_idx` (`Athlete_Athlete_id`),
  CONSTRAINT `fk_Athlete_has_Sponsor_Athlete1` FOREIGN KEY (`Athlete_Athlete_id`) REFERENCES `athlete` (`Athlete_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `athlete_has_sponsor`
--

LOCK TABLES `athlete_has_sponsor` WRITE;
/*!40000 ALTER TABLE `athlete_has_sponsor` DISABLE KEYS */;
INSERT INTO `athlete_has_sponsor` VALUES (1,'Abibas'),(2,'Abibas'),(2,'Rebok'),(3,'Nikey'),(4,'Abibas'),(7,'Koko'),(11,'Papsi'),(14,'Merqakos'),(15,'Rebok'),(19,'Bebbie');
/*!40000 ALTER TABLE `athlete_has_sponsor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `athlete_has_sport`
--

DROP TABLE IF EXISTS `athlete_has_sport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `athlete_has_sport` (
  `Athlete_Athlete_id` int NOT NULL,
  `Sport_Olympics_Year` int NOT NULL,
  `Sport_Olympics_Season` enum('summer','winter') NOT NULL,
  `Sport_Sport_Name` varchar(45) NOT NULL,
  `Standings` int NOT NULL,
  `Performance` float DEFAULT NULL,
  `Round` varchar(45) NOT NULL,
  PRIMARY KEY (`Athlete_Athlete_id`,`Sport_Olympics_Year`,`Sport_Olympics_Season`,`Sport_Sport_Name`,`Round`),
  KEY `fk_Athlete_has_Sport_Sport1_idx` (`Sport_Olympics_Year`,`Sport_Olympics_Season`,`Sport_Sport_Name`),
  KEY `fk_Athlete_has_Sport_Athlete1_idx` (`Athlete_Athlete_id`),
  KEY `fk_Athlete_has_Sport_Sport1` (`Sport_Sport_Name`),
  CONSTRAINT `fk_Athlete_has_Sport_Athlete1` FOREIGN KEY (`Athlete_Athlete_id`) REFERENCES `athlete` (`Athlete_id`),
  CONSTRAINT `fk_Athlete_has_Sport_Sport1` FOREIGN KEY (`Sport_Sport_Name`) REFERENCES `sport` (`Sport_Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `athlete_has_sport`
--

LOCK TABLES `athlete_has_sport` WRITE;
/*!40000 ALTER TABLE `athlete_has_sport` DISABLE KEYS */;
INSERT INTO `athlete_has_sport` VALUES (1,2000,'summer','badmidon',1,NULL,'F'),(1,2004,'winter','tennis',3,NULL,'F'),(2,2004,'winter','tennis',1,NULL,'F'),(3,2004,'winter','tennis',2,NULL,'F'),(4,2000,'summer','badmidon',2,NULL,'F'),(5,2008,'summer','basketball',5,NULL,'SF'),(6,1996,'summer','100m-sprint',2,NULL,'F'),(6,2012,'winter','skiing',2,NULL,'F'),(7,1996,'summer','100m-sprint',3,NULL,'F'),(8,2000,'summer','badmidon',3,NULL,'F'),(9,2008,'summer','basketball',1,NULL,'F'),(10,1992,'summer','baseball',3,NULL,'F'),(10,2000,'summer','badmidon',4,NULL,'QF'),(11,2000,'summer','badmidon',5,NULL,'QF'),(11,2004,'winter','ice-hockey',1,NULL,'F'),(12,2008,'summer','handball',2,NULL,'F'),(12,2012,'winter','skiing',1,NULL,'F'),(13,1996,'summer','football',1,NULL,'F'),(14,1996,'summer','football',2,NULL,'F'),(15,1996,'summer','football',4,NULL,'SF'),(15,2004,'winter','ice-hockey',2,NULL,'F'),(16,1992,'summer','baseball',1,NULL,'F'),(16,2004,'winter','ice-hockey',5,NULL,'QF'),(17,2008,'winter','handball',5,NULL,'QF'),(18,2008,'summer','handball',5,NULL,'QF'),(19,2008,'winter','ice-hockey',6,NULL,'QF'),(19,2016,'summer','Gymnastics',1,NULL,'F'),(20,2016,'summer','Gymnastics',2,NULL,'F');
/*!40000 ALTER TABLE `athlete_has_sport` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`pantsousis`@`%`*/ /*!50003 TRIGGER `athlete_has_sport_BEFORE_INSERT` BEFORE INSERT ON `athlete_has_sport` FOR EACH ROW BEGIN
    IF(NEW.Standings <= 0) THEN
		SIGNAL SQLSTATE '22003' SET MESSAGE_TEXT = 'Invalid Standings value';
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `most_medals_per_olympics`
--

DROP TABLE IF EXISTS `most_medals_per_olympics`;
/*!50001 DROP VIEW IF EXISTS `most_medals_per_olympics`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `most_medals_per_olympics` AS SELECT 
 1 AS `Year`,
 1 AS `Season`,
 1 AS `City`,
 1 AS `Team_Name`,
 1 AS `Medals`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `olympics`
--

DROP TABLE IF EXISTS `olympics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `olympics` (
  `City` varchar(45) NOT NULL,
  `Country` varchar(45) NOT NULL,
  `Year` int NOT NULL,
  `Season` enum('summer','winter') NOT NULL,
  PRIMARY KEY (`Year`,`Season`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `olympics`
--

LOCK TABLES `olympics` WRITE;
/*!40000 ALTER TABLE `olympics` DISABLE KEYS */;
INSERT INTO `olympics` VALUES ('Sydney','Australia',1992,'summer'),('Atlanta','USA',1996,'summer'),('Kalamata','Greece',2000,'summer'),('Messini','Greece',2004,'winter'),('Berlin','Germany',2008,'summer'),('Moscow','Russia',2012,'winter'),('RiodeJaneiro','Brazil',2016,'summer');
/*!40000 ALTER TABLE `olympics` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`pantsousis`@`%`*/ /*!50003 TRIGGER `Olympics_BEFORE_INSERT` BEFORE INSERT ON `olympics` FOR EACH ROW BEGIN
	IF(NEW.Year < 1896) THEN
		SIGNAL SQLSTATE '22003' SET MESSAGE_TEXT = 'Invalid Oympics year';
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `sport`
--

DROP TABLE IF EXISTS `sport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sport` (
  `Sport_Name` varchar(45) NOT NULL,
  `Type` enum('individual','group') DEFAULT NULL,
  `Olympics_Year` int NOT NULL,
  `Olympics_Season` enum('summer','winter') NOT NULL,
  `Sport_Date` date DEFAULT NULL,
  PRIMARY KEY (`Sport_Name`,`Olympics_Year`,`Olympics_Season`),
  KEY `fk_Sport_Olympics1_idx` (`Olympics_Year`,`Olympics_Season`),
  CONSTRAINT `fk_Sport_Olympics1` FOREIGN KEY (`Olympics_Year`, `Olympics_Season`) REFERENCES `olympics` (`Year`, `Season`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sport`
--

LOCK TABLES `sport` WRITE;
/*!40000 ALTER TABLE `sport` DISABLE KEYS */;
INSERT INTO `sport` VALUES ('100m-sprint','individual',1996,'summer','1996-07-03'),('badmidon','group',2000,'summer','2000-06-06'),('baseball','group',1992,'summer','1992-06-25'),('basketball','group',2008,'summer','2008-06-12'),('football','group',1996,'summer','1996-06-16'),('Gymnastics','individual',2016,'summer','2016-07-11'),('handball','group',2008,'summer','2008-06-12'),('ice-hockey','group',2004,'winter','2004-06-11'),('skiing','individual',2012,'winter','2012-01-10'),('tennis','group',2004,'winter','2004-06-06');
/*!40000 ALTER TABLE `sport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stadium`
--

DROP TABLE IF EXISTS `stadium`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stadium` (
  `Stadium_Name` varchar(45) NOT NULL,
  `Capacity` int NOT NULL,
  `City` varchar(45) NOT NULL,
  PRIMARY KEY (`Stadium_Name`,`City`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stadium`
--

LOCK TABLES `stadium` WRITE;
/*!40000 ALTER TABLE `stadium` DISABLE KEYS */;
INSERT INTO `stadium` VALUES ('AUSSIES',55000,'Sydney'),('BRAZILEIROS',25000,'RiodeJaneiro'),('HOCKS',100000,'Atlanta'),('OLYMPISCHE',80000,'Berlin'),('PAMISOS',25000,'Messini'),('TOUMPA',30000,'Kalamata'),('TSAR',87000,'Moscow');
/*!40000 ALTER TABLE `stadium` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`pantsousis`@`%`*/ /*!50003 TRIGGER `stadium_BEFORE_INSERT` BEFORE INSERT ON `stadium` FOR EACH ROW BEGIN
    IF(NEW.Capacity <= 0) THEN
		SIGNAL SQLSTATE '22003' SET MESSAGE_TEXT = 'Invalid Capacity';
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `stadium_has_sport`
--

DROP TABLE IF EXISTS `stadium_has_sport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stadium_has_sport` (
  `Stadium_Stadium_Name` varchar(45) NOT NULL,
  `Stadium_City` varchar(45) NOT NULL,
  `Sport_Olympics_Year` int NOT NULL,
  `Sport_Olympics_Season` enum('summer','winter') NOT NULL,
  `Sport_Sport_Name` varchar(45) NOT NULL,
  PRIMARY KEY (`Stadium_Stadium_Name`,`Stadium_City`,`Sport_Olympics_Year`,`Sport_Olympics_Season`,`Sport_Sport_Name`),
  KEY `fk_Stadium_has_Sport_Sport1_idx` (`Sport_Olympics_Year`,`Sport_Olympics_Season`,`Sport_Sport_Name`),
  KEY `fk_Stadium_has_Sport_Stadium1_idx` (`Stadium_Stadium_Name`,`Stadium_City`),
  KEY `fk_Stadium_has_Sport_Sport1` (`Sport_Sport_Name`),
  CONSTRAINT `fk_Stadium_has_Sport_Sport1` FOREIGN KEY (`Sport_Sport_Name`) REFERENCES `sport` (`Sport_Name`),
  CONSTRAINT `fk_Stadium_has_Sport_Stadium1` FOREIGN KEY (`Stadium_Stadium_Name`, `Stadium_City`) REFERENCES `stadium` (`Stadium_Name`, `City`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stadium_has_sport`
--

LOCK TABLES `stadium_has_sport` WRITE;
/*!40000 ALTER TABLE `stadium_has_sport` DISABLE KEYS */;
INSERT INTO `stadium_has_sport` VALUES ('HOCKS','Atlanta',1996,'summer','100m-sprint'),('TOUMPA','Kalamata',2000,'summer','badmidon'),('AUSSIES','Sydney',1992,'summer','baseball'),('OLYMPISCHE','Berlin',2008,'summer','basketball'),('BRAZILEIROS','RiodeJaneiro',2016,'summer','Gymnastics'),('TSAR','Moscow',2012,'winter','skiing'),('PAMISOS','Messini',2004,'winter','tennis');
/*!40000 ALTER TABLE `stadium_has_sport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `team`
--

DROP TABLE IF EXISTS `team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `team` (
  `Team_Name` varchar(45) NOT NULL,
  `Country` enum('yes','no') NOT NULL,
  PRIMARY KEY (`Team_Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team`
--

LOCK TABLES `team` WRITE;
/*!40000 ALTER TABLE `team` DISABLE KEYS */;
INSERT INTO `team` VALUES ('AUSTRALIA','yes'),('BRAZIL','yes'),('CHINA','yes'),('ENGLAND','yes'),('FRANCE','yes'),('GERMANY','yes'),('GREECE','yes'),('IRELAND','yes'),('RUSSIA','yes'),('USA','yes');
/*!40000 ALTER TABLE `team` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `team_has_olympics`
--

DROP TABLE IF EXISTS `team_has_olympics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `team_has_olympics` (
  `Team_Team_Name` varchar(45) NOT NULL,
  `Olympics_Year` int NOT NULL,
  `Olympics_Season` enum('summer','winter') NOT NULL,
  PRIMARY KEY (`Team_Team_Name`,`Olympics_Year`,`Olympics_Season`),
  KEY `fk_Team_has_Olympics_Olympics1_idx` (`Olympics_Year`,`Olympics_Season`),
  KEY `fk_Team_has_Olympics_Team1_idx` (`Team_Team_Name`),
  CONSTRAINT `fk_Team_has_Olympics_Olympics1` FOREIGN KEY (`Olympics_Year`, `Olympics_Season`) REFERENCES `olympics` (`Year`, `Season`),
  CONSTRAINT `fk_Team_has_Olympics_Team1` FOREIGN KEY (`Team_Team_Name`) REFERENCES `team` (`Team_Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team_has_olympics`
--

LOCK TABLES `team_has_olympics` WRITE;
/*!40000 ALTER TABLE `team_has_olympics` DISABLE KEYS */;
INSERT INTO `team_has_olympics` VALUES ('AUSTRALIA',1992,'summer'),('USA',1996,'summer'),('GREECE',2000,'summer'),('GREECE',2004,'winter'),('GERMANY',2008,'summer'),('RUSSIA',2012,'winter'),('BRAZIL',2016,'summer');
/*!40000 ALTER TABLE `team_has_olympics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `athlete_date_stadium`
--

/*!50001 DROP VIEW IF EXISTS `athlete_date_stadium`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`pantsousis`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `athlete_date_stadium` AS select `athlete`.`Athlete_Name` AS `Athlete_name`,`sport`.`Sport_Date` AS `Sport_Date`,`stadium_has_sport`.`Stadium_City` AS `Stadium_City`,`stadium_has_sport`.`Stadium_Stadium_Name` AS `Stadium_Stadium_Name` from (((`athlete_has_sport` join `athlete` on((`athlete_has_sport`.`Athlete_Athlete_id` = `athlete`.`Athlete_id`))) join `sport` on(((`sport`.`Sport_Name` = `athlete_has_sport`.`Sport_Sport_Name`) and (`sport`.`Olympics_Year` = `athlete_has_sport`.`Sport_Olympics_Year`) and (`sport`.`Olympics_Season` = `athlete_has_sport`.`Sport_Olympics_Season`)))) join `stadium_has_sport` on(((`stadium_has_sport`.`Sport_Sport_Name` = `sport`.`Sport_Name`) and (`stadium_has_sport`.`Sport_Olympics_Season` = `athlete_has_sport`.`Sport_Olympics_Season`) and (`stadium_has_sport`.`Sport_Olympics_Year` = `athlete_has_sport`.`Sport_Olympics_Year`)))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `most_medals_per_olympics`
--

/*!50001 DROP VIEW IF EXISTS `most_medals_per_olympics`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`pantsousis`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `most_medals_per_olympics` AS select `d`.`Year` AS `Year`,`d`.`Season` AS `Season`,`d`.`City` AS `City`,`d`.`Team_Name` AS `Team_Name`,`d`.`Medals` AS `Medals` from (select `b`.`Year` AS `Year`,`b`.`Season` AS `Season`,`b`.`City` AS `City`,`a`.`Team_Name` AS `Team_Name`,count(`a`.`Team_Name`) AS `Medals` from ((select `athlete`.`Athlete_id` AS `Athlete_id`,`team`.`Team_Name` AS `Team_Name`,`athlete_has_sport`.`Sport_Olympics_Season` AS `Sport_Olympics_Season`,`athlete_has_sport`.`Sport_Olympics_Year` AS `Sport_Olympics_Year`,`athlete_has_sport`.`Sport_Sport_Name` AS `Sport_Sport_Name` from ((`athlete` join `team` on((`athlete`.`Team_Team_Name` = `team`.`Team_Name`))) join `athlete_has_sport` on((`athlete_has_sport`.`Athlete_Athlete_id` = `athlete`.`Athlete_id`))) where ((`athlete_has_sport`.`Standings` < 4) and (`athlete_has_sport`.`Round` = 'F'))) `a` join (select `olympics`.`City` AS `City`,`olympics`.`Country` AS `Country`,`olympics`.`Season` AS `Season`,`olympics`.`Year` AS `Year`,`sport`.`Sport_Name` AS `Sport_Name` from (`olympics` join `sport` on(((`sport`.`Olympics_Season` = `olympics`.`Season`) and (`sport`.`Olympics_Year` = `olympics`.`Year`))))) `b` on(((`b`.`Year` = `a`.`Sport_Olympics_Year`) and (`b`.`Season` = `a`.`Sport_Olympics_Season`) and (`b`.`Sport_Name` = `a`.`Sport_Sport_Name`)))) group by `a`.`Team_Name`,`b`.`Season`,`b`.`Year`,`b`.`City`) `d` where (`d`.`Team_Name`,`d`.`Year`,`d`.`Season`,`d`.`City`,`d`.`Medals`) in (select `c`.`Team_Name`,`c`.`Year`,`c`.`Season`,`c`.`City`,`c`.`Medals` from ((select `b`.`Year` AS `Year`,`b`.`Season` AS `Season`,`b`.`City` AS `City`,`a`.`Team_Name` AS `Team_Name`,count(`a`.`Team_Name`) AS `Medals` from ((select `athlete`.`Athlete_id` AS `Athlete_id`,`team`.`Team_Name` AS `Team_Name`,`athlete_has_sport`.`Sport_Olympics_Season` AS `Sport_Olympics_Season`,`athlete_has_sport`.`Sport_Olympics_Year` AS `Sport_Olympics_Year`,`athlete_has_sport`.`Sport_Sport_Name` AS `Sport_Sport_Name` from ((`athlete` join `team` on((`athlete`.`Team_Team_Name` = `team`.`Team_Name`))) join `athlete_has_sport` on((`athlete_has_sport`.`Athlete_Athlete_id` = `athlete`.`Athlete_id`))) where ((`athlete_has_sport`.`Standings` < 4) and (`athlete_has_sport`.`Round` = 'F'))) `a` join (select `olympics`.`City` AS `City`,`olympics`.`Country` AS `Country`,`olympics`.`Season` AS `Season`,`olympics`.`Year` AS `Year`,`sport`.`Sport_Name` AS `Sport_Name` from (`olympics` join `sport` on(((`sport`.`Olympics_Season` = `olympics`.`Season`) and (`sport`.`Olympics_Year` = `olympics`.`Year`))))) `b` on(((`b`.`Year` = `a`.`Sport_Olympics_Year`) and (`b`.`Season` = `a`.`Sport_Olympics_Season`) and (`b`.`Sport_Name` = `a`.`Sport_Sport_Name`)))) group by `a`.`Team_Name`,`b`.`Season`,`b`.`Year`,`b`.`City`) `temp` join (select `b`.`Year` AS `Year`,`b`.`Season` AS `Season`,`b`.`City` AS `City`,`a`.`Team_Name` AS `Team_Name`,count(`a`.`Team_Name`) AS `Medals` from ((select `athlete`.`Athlete_id` AS `Athlete_id`,`team`.`Team_Name` AS `Team_Name`,`athlete_has_sport`.`Sport_Olympics_Season` AS `Sport_Olympics_Season`,`athlete_has_sport`.`Sport_Olympics_Year` AS `Sport_Olympics_Year`,`athlete_has_sport`.`Sport_Sport_Name` AS `Sport_Sport_Name` from ((`athlete` join `team` on((`athlete`.`Team_Team_Name` = `team`.`Team_Name`))) join `athlete_has_sport` on((`athlete_has_sport`.`Athlete_Athlete_id` = `athlete`.`Athlete_id`))) where ((`athlete_has_sport`.`Standings` < 4) and (`athlete_has_sport`.`Round` = 'F'))) `a` join (select `olympics`.`City` AS `City`,`olympics`.`Country` AS `Country`,`olympics`.`Season` AS `Season`,`olympics`.`Year` AS `Year`,`sport`.`Sport_Name` AS `Sport_Name` from (`olympics` join `sport` on(((`sport`.`Olympics_Season` = `olympics`.`Season`) and (`sport`.`Olympics_Year` = `olympics`.`Year`))))) `b` on(((`b`.`Year` = `a`.`Sport_Olympics_Year`) and (`b`.`Season` = `a`.`Sport_Olympics_Season`) and (`b`.`Sport_Name` = `a`.`Sport_Sport_Name`)))) group by `a`.`Team_Name`,`b`.`Season`,`b`.`Year`,`b`.`City`) `c`) where ((`c`.`Medals` < `temp`.`Medals`) and (`c`.`Year` = `temp`.`Year`) and (`c`.`Season` = `temp`.`Season`))) is false */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-12-20  4:01:54

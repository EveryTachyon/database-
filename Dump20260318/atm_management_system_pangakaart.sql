-- MySQL dump 10.13  Distrib 8.0.44, for Win64 (x86_64)
--
-- Host: localhost    Database: atm_management_system
-- ------------------------------------------------------
-- Server version	8.0.44

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
-- Table structure for table `pangakaart`
--

DROP TABLE IF EXISTS `pangakaart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pangakaart` (
  `card_id` int NOT NULL AUTO_INCREMENT,
  `card_number` varchar(20) NOT NULL,
  `pin_code` varchar(255) NOT NULL,
  `account_id` int NOT NULL,
  `expiry_date` date NOT NULL,
  `status` enum('ACTIVE','BLOCKED','EXPIRED') DEFAULT 'ACTIVE',
  `withdrawal_limit` decimal(10,2) DEFAULT '1000.00',
  `daily_used` decimal(10,2) DEFAULT '0.00',
  `last_used_date` date DEFAULT NULL,
  `failed_attempts` int DEFAULT '0',
  `blocked_until` datetime DEFAULT NULL,
  PRIMARY KEY (`card_id`),
  UNIQUE KEY `card_number` (`card_number`),
  KEY `fk_card_account` (`account_id`),
  CONSTRAINT `fk_card_account` FOREIGN KEY (`account_id`) REFERENCES `konto` (`account_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pangakaart`
--

LOCK TABLES `pangakaart` WRITE;
/*!40000 ALTER TABLE `pangakaart` DISABLE KEYS */;
INSERT INTO `pangakaart` VALUES (1,'4000000000000001','1234',1,'2028-12-31','ACTIVE',1000.00,200.00,'2026-03-18',0,NULL),(2,'4000000000000002','2345',2,'2027-11-30','ACTIVE',1000.00,0.00,NULL,0,NULL),(3,'4000000000000003','3456',3,'2026-10-31','BLOCKED',1000.00,0.00,NULL,0,NULL),(4,'4000000000000004','4567',4,'2029-09-30','ACTIVE',1000.00,0.00,NULL,0,NULL);
/*!40000 ALTER TABLE `pangakaart` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-03-18  8:28:20

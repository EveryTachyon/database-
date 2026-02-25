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
-- Table structure for table `atm`
--

DROP TABLE IF EXISTS `atm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `atm` (
  `atm_id` int NOT NULL AUTO_INCREMENT,
  `location` varchar(150) NOT NULL,
  `status` enum('ACTIVE','OUT_OF_SERVICE','MAINTENANCE') DEFAULT 'ACTIVE',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`atm_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `atm`
--

LOCK TABLES `atm` WRITE;
/*!40000 ALTER TABLE `atm` DISABLE KEYS */;
INSERT INTO `atm` VALUES (1,'Tallinn City Center','ACTIVE','2026-02-25 12:01:04'),(2,'Tartu Shopping Mall','ACTIVE','2026-02-25 12:01:04'),(3,'Narva Train Station','MAINTENANCE','2026-02-25 12:01:04'),(4,'Pärnu Beach Area','ACTIVE','2026-02-25 12:01:04');
/*!40000 ALTER TABLE `atm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `klient`
--

DROP TABLE IF EXISTS `klient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `klient` (
  `customer_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `personal_code` varchar(20) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`customer_id`),
  UNIQUE KEY `personal_code` (`personal_code`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `klient`
--

LOCK TABLES `klient` WRITE;
/*!40000 ALTER TABLE `klient` DISABLE KEYS */;
INSERT INTO `klient` VALUES (1,'John Smith','39001010011','+3725551111','john@email.com','2026-02-25 12:01:04'),(2,'Anna Brown','49002020022','+3725552222','anna@email.com','2026-02-25 12:01:04'),(3,'Mark Taylor','39503030033','+3725553333','mark@email.com','2026-02-25 12:01:04'),(4,'Lisa White','49604040044','+3725554444','lisa@email.com','2026-02-25 12:01:04');
/*!40000 ALTER TABLE `klient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `konto`
--

DROP TABLE IF EXISTS `konto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `konto` (
  `account_id` int NOT NULL AUTO_INCREMENT,
  `account_number` varchar(34) NOT NULL,
  `balance` decimal(15,2) NOT NULL DEFAULT '0.00',
  `customer_id` int NOT NULL,
  `status` enum('ACTIVE','BLOCKED','CLOSED') DEFAULT 'ACTIVE',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`account_id`),
  UNIQUE KEY `account_number` (`account_number`),
  KEY `fk_account_customer` (`customer_id`),
  CONSTRAINT `fk_account_customer` FOREIGN KEY (`customer_id`) REFERENCES `klient` (`customer_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `konto`
--

LOCK TABLES `konto` WRITE;
/*!40000 ALTER TABLE `konto` DISABLE KEYS */;
INSERT INTO `konto` VALUES (1,'EE100000000000000001',1500.00,1,'ACTIVE','2026-02-25 12:01:04'),(2,'EE200000000000000002',3200.50,2,'ACTIVE','2026-02-25 12:01:04'),(3,'EE300000000000000003',500.75,3,'BLOCKED','2026-02-25 12:01:04'),(4,'EE400000000000000004',8000.00,4,'ACTIVE','2026-02-25 12:01:04');
/*!40000 ALTER TABLE `konto` ENABLE KEYS */;
UNLOCK TABLES;

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
INSERT INTO `pangakaart` VALUES (1,'4000000000000001','1234',1,'2028-12-31','ACTIVE'),(2,'4000000000000002','2345',2,'2027-11-30','ACTIVE'),(3,'4000000000000003','3456',3,'2026-10-31','BLOCKED'),(4,'4000000000000004','4567',4,'2029-09-30','ACTIVE');
/*!40000 ALTER TABLE `pangakaart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tehing`
--

DROP TABLE IF EXISTS `tehing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tehing` (
  `transaction_id` int NOT NULL AUTO_INCREMENT,
  `transaction_type` enum('WITHDRAW','DEPOSIT','BALANCE_CHECK','TRANSFER') NOT NULL,
  `amount` decimal(15,2) NOT NULL,
  `account_id` int NOT NULL,
  `atm_id` int NOT NULL,
  `transaction_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `status` enum('SUCCESS','FAILED','PENDING') DEFAULT 'SUCCESS',
  PRIMARY KEY (`transaction_id`),
  KEY `fk_transaction_account` (`account_id`),
  KEY `fk_transaction_atm` (`atm_id`),
  CONSTRAINT `fk_transaction_account` FOREIGN KEY (`account_id`) REFERENCES `konto` (`account_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_transaction_atm` FOREIGN KEY (`atm_id`) REFERENCES `atm` (`atm_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tehing`
--

LOCK TABLES `tehing` WRITE;
/*!40000 ALTER TABLE `tehing` DISABLE KEYS */;
INSERT INTO `tehing` VALUES (1,'WITHDRAW',200.00,1,1,'2026-02-25 12:01:04','SUCCESS'),(2,'DEPOSIT',500.00,2,2,'2026-02-25 12:01:04','SUCCESS'),(3,'BALANCE_CHECK',0.00,3,1,'2026-02-25 12:01:04','SUCCESS'),(4,'WITHDRAW',1000.00,4,4,'2026-02-25 12:01:04','FAILED');
/*!40000 ALTER TABLE `tehing` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-02-25 12:03:12

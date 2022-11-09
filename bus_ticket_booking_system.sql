-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: bus_ticket_booking_system
-- ------------------------------------------------------
-- Server version	8.0.30

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
-- Table structure for table `booking`
--

DROP TABLE IF EXISTS `booking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `booking` (
  `id` int NOT NULL AUTO_INCREMENT,
  `destination_id` int NOT NULL,
  `booking_date` varchar(30) NOT NULL,
  `journey_date` varchar(30) NOT NULL,
  `bus_id` int NOT NULL,
  `seat_numbers` varchar(150) NOT NULL,
  `passenger_id` int NOT NULL,
  `number_of_seat` int NOT NULL,
  `payment_status` varchar(10) NOT NULL,
  `status` varchar(10) NOT NULL,
  `note` varchar(220) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking`
--

LOCK TABLES `booking` WRITE;
/*!40000 ALTER TABLE `booking` DISABLE KEYS */;
INSERT INTO `booking` VALUES (1,31,'22-09-2022','22-09-2022',1,'1,2,3,4',2,4,'pending','success','note'),(2,32,'29-09-2022','29-09-2022',1,'1',2,1,'pending','success','note'),(3,32,'29-09-2022','29-09-2022',1,'2,3',2,2,'pending','success','note'),(4,31,'29-09-2022','29-09-2022',1,'1,2,3',2,3,'pending','success','note'),(5,31,'06-10-2022','06-10-2022',1,'1',2,1,'pending','success','note'),(6,32,'30-09-2022','30-09-2022',1,'1',2,1,'pending','success','note'),(7,32,'02-10-2022','02-10-2022',1,'1',2,1,'pending','success','note'),(8,32,'03-10-2022','03-10-2022',1,'1',2,1,'pending','success','note'),(9,32,'06-10-2022','06-10-2022',1,'1',2,1,'pending','success','note'),(10,32,'05-10-2022','05-10-2022',1,'1,2',2,2,'pending','success','note'),(11,32,'07-10-2022','07-10-2022',1,'1,2,3',2,3,'pending','success','note'),(12,32,'08-10-2022','08-10-2022',1,'1',2,1,'pending','success','note'),(13,32,'08-10-2022','08-10-2022',1,'2,3',2,2,'pending','success','note'),(14,32,'02-10-2022','02-10-2022',1,'2',2,1,'pending','success','note'),(15,32,'05-10-2022','05-10-2022',1,'3',2,1,'pending','success','note'),(16,32,'04-10-2022','04-10-2022',1,'1',2,1,'pending','success','note'),(17,32,'04-10-2022','04-10-2022',1,'2,3',2,2,'pending','success','note'),(18,32,'03-10-2022','03-10-2022',1,'2',2,1,'pending','success','note'),(19,32,'06-10-2022','06-10-2022',1,'2',2,1,'pending','success','note'),(20,32,'03-10-2022','03-10-2022',1,'2',2,1,'pending','success','note'),(21,32,'30-09-2022','30-09-2022',1,'2',2,1,'pending','success','note'),(22,32,'30-09-2022','30-09-2022',1,'2',2,1,'pending','success','note'),(23,32,'01-10-2022','01-10-2022',1,'1',2,1,'pending','success','note'),(24,31,'02-10-2022','02-10-2022',1,'1',2,1,'pending','success','note'),(25,31,'02-10-2022','02-10-2022',1,'2',2,1,'pending','success','note'),(26,31,'04-10-2022','04-10-2022',1,'1,2',2,2,'pending','success','note'),(27,31,'04-10-2022','04-10-2022',1,'3',2,1,'pending','success','note'),(28,31,'02-10-2022','02-10-2022',1,'2',2,1,'pending','success','note'),(29,31,'03-10-2022','03-10-2022',1,'1',2,1,'pending','success','note'),(30,31,'03-10-2022','03-10-2022',1,'2',2,1,'pending','success','note'),(31,31,'03-10-2022','03-10-2022',1,'2',2,1,'pending','success','note'),(32,31,'04-10-2022','04-10-2022',1,'3',2,1,'pending','success','note'),(33,31,'06-10-2022','06-10-2022',1,'2',2,1,'pending','success','note'),(34,31,'06-10-2022','06-10-2022',1,'2',2,1,'pending','success','note'),(35,31,'06-10-2022','06-10-2022',1,'2',2,1,'pending','success','note'),(36,31,'29-09-2022','29-09-2022',1,'4',2,1,'pending','success','note');
/*!40000 ALTER TABLE `booking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bus`
--

DROP TABLE IF EXISTS `bus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bus` (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(30) NOT NULL,
  `name` varchar(50) NOT NULL,
  `total_seat` int NOT NULL,
  `type` varchar(20) NOT NULL DEFAULT 'intercity',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bus`
--

LOCK TABLES `bus` WRITE;
/*!40000 ALTER TABLE `bus` DISABLE KEYS */;
INSERT INTO `bus` VALUES (1,'A-101','ESSAR',50,'Coach / Motor coach'),(2,'B-612','MVS',25,'Minicoach'),(4,'S-11A','BALAJI',40,'Single-decker bus'),(13,'SRIT-90','SRIT',50,'Double-decker bus'),(14,'S11','GVT BUS',50,'Double-decker bus');
/*!40000 ALTER TABLE `bus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `destinations`
--

DROP TABLE IF EXISTS `destinations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `destinations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `station_from` int NOT NULL,
  `station_to` int NOT NULL,
  `bus_id` int NOT NULL,
  `time` varchar(30) NOT NULL,
  `status` varchar(20) NOT NULL,
  `fare` varchar(5) NOT NULL,
  `last_activity` datetime NOT NULL,
  `last_modify_by` int NOT NULL,
  `total_seat` int NOT NULL,
  `seat_range` varchar(10) NOT NULL,
  `type` varchar(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `destinations`
--

LOCK TABLES `destinations` WRITE;
/*!40000 ALTER TABLE `destinations` DISABLE KEYS */;
INSERT INTO `destinations` VALUES (11,1,2,7,'4:30Am','active','40','2018-09-05 00:00:00',0,5,'1-5','up'),(12,1,3,7,'4:30Am','active','240','2018-09-05 00:00:00',0,50,'6-56','up'),(13,1,4,7,'4:30Am','active','280','2018-09-05 00:00:00',0,5,'57-61','up'),(14,1,2,2,'1:20AM','active','40','2018-09-05 00:00:00',0,20,'1-20','up'),(15,1,3,2,'1:20AM','active','240','2018-09-05 00:00:00',0,20,'21-40','up'),(16,1,4,2,'1:20AM','active','280','2018-09-05 00:00:00',0,10,'41-50','up'),(17,4,1,7,'2:50AM','active','240','2018-09-05 00:00:00',0,20,'1-20','up'),(18,4,3,7,'2:50AM','active','40','2018-09-05 00:00:00',0,50,'21-50','up'),(23,6,4,9,'10:50AM','active','480','2018-09-05 00:00:00',0,30,'21-50','up'),(25,6,2,9,'10:50AM','active','350','2018-09-05 00:00:00',0,20,'21-50','up'),(27,7,1,10,'10:50AM','active','480','2018-09-05 00:00:00',0,3,'1-3','up'),(28,7,3,10,'10:50AM','active','350','2018-09-05 00:00:00',0,4,'4-8','up'),(29,7,4,10,'10:50AM','active','900','2018-09-05 00:00:00',0,2,'9-10','up'),(30,7,1,8,'6AM','active','480','2018-09-05 00:00:00',0,2,'9-10','up'),(31,2,4,1,'9:00AM','active','30','2018-09-05 00:00:00',0,5,'1-5','up'),(32,2,9,1,'12:00PM','active','50','2018-09-05 00:00:00',0,4,'1-3','up'),(33,1,4,1,'9:00 AM','active','25','2018-09-05 00:00:00',0,10,'10-20','up');
/*!40000 ALTER TABLE `destinations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stations`
--

DROP TABLE IF EXISTS `stations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `address` varchar(70) NOT NULL,
  `contact` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stations`
--

LOCK TABLES `stations` WRITE;
/*!40000 ALTER TABLE `stations` DISABLE KEYS */;
INSERT INTO `stations` VALUES (1,'Ukkadam','Ukkadam, Bus Stand','+91 80987 03123'),(2,'Gandhipuram','Gandhipuram, Town Bus Stand','+91 98231 09212'),(3,'Singanallur','Singanallur, Bus Stand','+91 76232 09821'),(4,'Pollachi','Pollachi, Main Bus Stand','+91 63121 87231'),(6,'Thudiyalur','Thudiyalur, New Bus Stand','+91 90831 21361'),(8,'Saibaba Colony','Near Saibaba Kovil','+91 89231 43546'),(9,'Palakkad','Palakkad, Bus Stop.','+91 67991 09231');
/*!40000 ALTER TABLE `stations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone` varchar(13) NOT NULL,
  `address` varchar(200) NOT NULL,
  `password` varchar(150) NOT NULL,
  `rule` varchar(10) NOT NULL,
  `reg_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_activity` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Harrish','harrish@gmail.com','+91 98431 683','SRIT campus, pachapalayam, coimbatore','123','admin','2022-09-21 15:53:29','2022-09-21 17:00:05'),(2,'Kavi','kavi@gmail.com','+91 70940 513','Saibaba Colony, coimbatore','123','passenger','2022-09-17 16:07:40','2022-09-17 16:07:40');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-10-02 11:27:37

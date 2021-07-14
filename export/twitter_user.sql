-- MySQL dump 10.13  Distrib 8.0.24, for Win64 (x86_64)
--
-- Host: localhost    Database: twitter
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
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `FIRSTNAME` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `LASTNAME` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `PASSWORD_HASH` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `BORN` date NOT NULL,
  `JOINED` date NOT NULL,
  `BIOGRAPHY` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('1','1','1','ef797c8118f02dfb649607dd5d3f8c7623048c9c063d532cc95c5ed7a898a64f','2000-01-11','2014-01-01','I hate this project so much'),('2','2','2','ef797c8118f02dfb649607dd5d3f8c7623048c9c063d532cc95c5ed7a898a64f','2000-01-11','2014-01-01','I hate this project so much'),('f','l','4','6b86b273ff34fce19d6b804eff5a3f5747ada4eaa22f1d49c01e52ddb7875b4b','2002-02-02','2003-03-03','blah blah'),('Amirhossein','Najafi','AmirNajafi21','01c02776d7290e999c60af8413927df1d389690aab8cac12503066cf62e899f6','1998-01-03','2021-02-05','It was too long go read it yourself:)'),('Bardia','Ardakanian','BardiArdakanian','ee79976c9380d5e337fc1c095ece8c8f22f91f306ceeb161fa51fecede2c4ba1','2001-09-02','2021-02-05','CE AUT'),('foo','bar','blahblah1234','ef797c8118f02dfb649607dd5d3f8c7623048c9c063d532cc95c5ed7a898a64f','2000-01-11','2014-01-01','I hate this project so much'),('Keivan','Ipchi','keivanIphci','bb0f6a26de562e481bcbfcc0380fe6ddc7f6bcb2a2fa5cda912087863efef205','2002-04-15','2021-02-05','Relationship status: Neftlix and icecream'),('Mohammad','Salehi','M_salehi_V','afb47e00531153e93808589e43d02c11f6398c5bc877f7924cebca8211c8dd18','1999-11-23','2021-02-05','Mohammad Salehi son of Reza'),('negin','shadman','negz','ee79976c9380d5e337fc1c095ece8c8f22f91f306ceeb161fa51fecede2c4ba1','1997-02-23','2021-07-08','biography: '),('Omid','Dokhanchi','Stalin00','cf1aa821ddabafa6a16212eba3805fbcff92c6fc981d43967e1fca8657f8571c','2003-03-12','2021-02-05','hail hentai'),('Sina','Amini','Trueshinnyjesus','33a7d3da476a32ac237b3f603a1be62fad00299e0d4b5a8db8d913104edec629','2000-05-12','2021-02-05','My name is jeff');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-07-14  9:13:17

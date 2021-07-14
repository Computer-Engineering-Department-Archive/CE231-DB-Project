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
-- Table structure for table `tweet`
--

DROP TABLE IF EXISTS `tweet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tweet` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `USER_ID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `CONTENT` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `POSTAGE` date NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `USER_ID` (`USER_ID`),
  CONSTRAINT `tweet_ibfk_1` FOREIGN KEY (`USER_ID`) REFERENCES `user` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tweet`
--

LOCK TABLES `tweet` WRITE;
/*!40000 ALTER TABLE `tweet` DISABLE KEYS */;
INSERT INTO `tweet` VALUES (66,'bardiArdakanian','hello guys my name is jeff','2021-07-07'),(67,'bardiArdakanian','testing hashtag @autce','2021-07-07'),(68,'bardiArdakanian','testing hashtag #autce','2021-07-07'),(70,'bardiArdakanian','hello:) my firs tweet here yaaay','2021-07-08'),(71,'bardiArdakanian','first tweet:) idk what to say tbh..','2021-07-08'),(72,'bardiArdakanian','hello','2021-07-08'),(73,'negz','first tweet for sure, no bug this time','2021-07-08'),(74,'negz','finally. I debugged the bug:)','2021-07-08'),(75,'bardiArdakanian',' hello','2021-07-10'),(76,'bardiArdakanian','ah','2021-07-13'),(77,'negz','','2021-07-13'),(78,'negz','hello there mate','2021-07-13'),(79,'bardiArdakanian',' ah yes','2021-07-13');
/*!40000 ALTER TABLE `tweet` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `PulloutTag` AFTER INSERT ON `tweet` FOR EACH ROW BEGIN
    SET @CONTENT=(SELECT tweet.CONTENT 
					FROM twitter.tweet
					ORDER BY id DESC  
					LIMIT 1);
	
    SET @LEN=CHAR_LENGTH(@CONTENT);
                    
	SET @ID=(SELECT ID 
				FROM twitter.tweet
				ORDER BY id DESC  
				LIMIT 1);
                
	SET @P=LOCATE('#', @CONTENT);
    
    WHILE @P > 0 DO
		SET @TAG=SUBSTRING(@CONTENT, @P, 6);
        INSERT INTO twitter.hashtag VALUES(@ID, @TAG);
        
        SET @CONTENT=SUBSTRING(@CONTENT, @P + 6, @LEN - @P - 5);
        SET @P=LOCATE('#', @CONTENT);
	END WHILE;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-07-14  9:13:16

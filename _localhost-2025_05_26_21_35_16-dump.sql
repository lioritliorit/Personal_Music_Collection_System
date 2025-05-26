-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: music_collection
-- ------------------------------------------------------
-- Server version	8.0.19

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `albums`
--

DROP TABLE IF EXISTS `albums`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `albums` (
  `album_id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `release_date` date DEFAULT NULL,
  `artist_id` int NOT NULL,
  PRIMARY KEY (`album_id`),
  KEY `artist_id` (`artist_id`),
  CONSTRAINT `albums_ibfk_1` FOREIGN KEY (`artist_id`) REFERENCES `artists` (`artist_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `albums`
--

LOCK TABLES `albums` WRITE;
/*!40000 ALTER TABLE `albums` DISABLE KEYS */;
INSERT INTO `albums` VALUES (11,'Under the Surface','2019-02-22',101),(12,'Told you so','2014-03-13',101),(13,'Arrival','1976-10-11',102),(14,'A&A','2023-03-29',104),(15,'AB','2022-11-25',105),(16,'笙声不息','2016-05-13',106),(17,'','2025-05-20',107),(18,'','2025-05-20',108),(19,'笙声不息','2016-05-13',109),(20,'笙声不息','2016-05-13',110),(21,'故梦','2021-06-23',111),(22,'A&A','2023-03-29',112),(23,'笙声不息','2016-05-13',113),(24,'','2025-05-20',114),(25,'','2025-05-20',115),(26,'笙声不息','2016-05-13',116),(27,'笙声不息','2016-05-13',117),(28,'笙声不息','2016-05-13',118),(29,'Bad (Explicit)','2018-04-13',119),(30,'Bad (Explicit)','2018-04-13',120),(31,'Bad (Explicit)','2018-04-13',121),(32,'Bad (Explicit)','2018-04-13',122),(33,'笙声不息','2016-05-13',123),(34,'笙声不息','2016-05-13',124),(35,'','2025-05-20',125),(36,'笙声不息','2016-05-13',126),(37,'One Dream','2020-12-08',127),(38,'Bad (Explicit)','2018-04-13',128),(39,'笙声不息','2016-05-13',129),(40,'笙声不息','2016-05-13',130),(41,'A&A','2023-03-29',131),(42,'A&A','2023-03-29',132),(43,'A&A','2023-03-29',133),(44,'歌曲名称 1 (Explicit)','2021-02-16',134),(45,'陈慧娴音乐大全 101','2011-09-23',135),(46,'笙声不息','2016-05-13',136),(47,'','2025-05-26',137),(48,'歌手 第10期','2017-03-25',138),(49,'歌手 第10期','2017-03-25',139),(50,'','2025-05-26',140),(51,'','2025-05-26',141),(52,'笙声不息','2016-05-13',142);
/*!40000 ALTER TABLE `albums` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `artists`
--

DROP TABLE IF EXISTS `artists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `artists` (
  `artist_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`artist_id`)
) ENGINE=InnoDB AUTO_INCREMENT=143 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artists`
--

LOCK TABLES `artists` WRITE;
/*!40000 ALTER TABLE `artists` DISABLE KEYS */;
INSERT INTO `artists` VALUES (101,'Christopher','丹麦'),(102,'ABBA','瑞典'),(104,'NINEONE #','未知'),(105,'Linus Pryne','未知'),(106,'双笙 (陈元汐)','未知'),(107,'V.A.','未知'),(108,'哆啦B梦','未知'),(109,'双笙 (陈元汐)','未知'),(110,'双笙 (陈元汐)','未知'),(111,'执素兮','未知'),(112,'NINEONE #','未知'),(113,'双笙 (陈元汐)','未知'),(114,'木木的3D音乐实验室','未知'),(115,'V.A.','未知'),(116,'双笙 (陈元汐)','未知'),(117,'双笙 (陈元汐)','未知'),(118,'双笙 (陈元汐)','未知'),(119,'Christopher','未知'),(120,'Christopher','未知'),(121,'Christopher','未知'),(122,'Christopher','未知'),(123,'双笙 (陈元汐)','未知'),(124,'双笙 (陈元汐)','未知'),(125,'V.A.','未知'),(126,'双笙 (陈元汐)','未知'),(127,'Elias Kahkah','未知'),(128,'Christopher','未知'),(129,'双笙 (陈元汐)','未知'),(130,'双笙 (陈元汐)','未知'),(131,'NINEONE #','未知'),(132,'NINEONE #','未知'),(133,'NINEONE #','未知'),(134,'主要艺术家12','未知'),(135,'陈慧娴','未知'),(136,'双笙 (陈元汐)','未知'),(137,'DJ','未知'),(138,'梁博','未知'),(139,'梁博','未知'),(140,'DJ','未知'),(141,'DJ','未知'),(142,'双笙 (陈元汐)','未知');
/*!40000 ALTER TABLE `artists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `songs`
--

DROP TABLE IF EXISTS `songs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `songs` (
  `song_id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `duration` int NOT NULL COMMENT '秒数',
  `play_count` int DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `album_id` int NOT NULL,
  PRIMARY KEY (`song_id`),
  KEY `fk_song_album` (`album_id`),
  FULLTEXT KEY `ft_song_search` (`title`),
  CONSTRAINT `fk_song_album` FOREIGN KEY (`album_id`) REFERENCES `albums` (`album_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1051 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `songs`
--

LOCK TABLES `songs` WRITE;
/*!40000 ALTER TABLE `songs` DISABLE KEYS */;
INSERT INTO `songs` VALUES (1002,'Waterfall',188,8,'2025-04-08 09:07:35',12),(1003,'Dancing Queen',230,6,'2025-04-08 09:07:44',13),(1028,'Bad',191,8,'2025-05-20 09:42:16',38),(1033,'A&A',163,2,'2025-05-26 10:51:51',43),(1034,'歌曲名称 1',93,0,'2025-05-26 10:59:13',44),(1035,'夜半歌声',229,0,'2025-05-26 11:04:49',45),(1036,'故梦',284,0,'2025-05-26 11:09:32',46),(1037,'[并四]_怨苍天变了心[新鼓测试]',454,2,'2025-05-26 11:10:11',47),(1038,'男孩',311,0,'2025-05-26 11:10:17',48),(1044,'故梦',284,1,'2025-05-26 11:29:50',52),(1050,'念',180,0,'2025-05-26 12:58:19',26);
/*!40000 ALTER TABLE `songs` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `before_song_insert` BEFORE INSERT ON `songs` FOR EACH ROW BEGIN
    -- 检查歌曲标题是否为空
    IF NEW.title IS NULL OR NEW.title = '' THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = '歌曲标题不能为空';
    END IF;
    
    -- 设置默认播放次数为0
    SET NEW.play_count = 0;
    
    -- 设置创建时间为当前时间
    SET NEW.created_at = NOW();
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `user_favorite_details`
--

DROP TABLE IF EXISTS `user_favorite_details`;
/*!50001 DROP VIEW IF EXISTS `user_favorite_details`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `user_favorite_details` AS SELECT 
 1 AS `user_id`,
 1 AS `username`,
 1 AS `song_id`,
 1 AS `song_title`,
 1 AS `duration`,
 1 AS `play_count`,
 1 AS `artist_name`,
 1 AS `artist_nationality`,
 1 AS `album_name`,
 1 AS `album_release_date`,
 1 AS `favorite_date`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `user_favorites`
--

DROP TABLE IF EXISTS `user_favorites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_favorites` (
  `user_id` int NOT NULL,
  `song_id` int NOT NULL,
  `favorited_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`,`song_id`),
  KEY `song_id` (`song_id`),
  CONSTRAINT `user_favorites_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE,
  CONSTRAINT `user_favorites_ibfk_2` FOREIGN KEY (`song_id`) REFERENCES `songs` (`song_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_favorites`
--

LOCK TABLES `user_favorites` WRITE;
/*!40000 ALTER TABLE `user_favorites` DISABLE KEYS */;
INSERT INTO `user_favorites` VALUES (1,1002,'2025-05-26 09:18:15'),(1,1003,'2025-05-20 09:02:23'),(2,1002,'2025-05-26 12:42:15'),(3,1003,'2022-04-08 09:06:57');
/*!40000 ALTER TABLE `user_favorites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'小a','1','1@qq.com','2025-04-08 08:31:31'),(2,'小b','2','2@qq.com','2025-04-08 08:42:31'),(3,'小c','3','3@qq.com','2025-04-08 08:43:02');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `user_favorite_details`
--

/*!50001 DROP VIEW IF EXISTS `user_favorite_details`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `user_favorite_details` AS select `uf`.`user_id` AS `user_id`,`u`.`username` AS `username`,`s`.`song_id` AS `song_id`,`s`.`title` AS `song_title`,`s`.`duration` AS `duration`,`s`.`play_count` AS `play_count`,`a`.`name` AS `artist_name`,`a`.`country` AS `artist_nationality`,`al`.`title` AS `album_name`,`al`.`release_date` AS `album_release_date`,`uf`.`favorited_at` AS `favorite_date` from ((((`user_favorites` `uf` join `users` `u` on((`uf`.`user_id` = `u`.`user_id`))) join `songs` `s` on((`uf`.`song_id` = `s`.`song_id`))) join `albums` `al` on((`s`.`album_id` = `al`.`album_id`))) join `artists` `a` on((`al`.`artist_id` = `a`.`artist_id`))) */;
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

-- Dump completed on 2025-05-26 21:35:16

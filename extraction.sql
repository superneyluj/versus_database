-- MySQL dump 10.13  Distrib 8.0.30, for macos12.5 (arm64)
--
-- Host: localhost    Database: versus
-- ------------------------------------------------------
-- Server version	8.0.30

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
-- Table structure for table `actor`
--

DROP TABLE IF EXISTS `actor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `actor` (
  `id` int NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `age` varchar(3) DEFAULT NULL,
  `gender` char(1) DEFAULT NULL,
  `nationality` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actor`
--

LOCK TABLES `actor` WRITE;
/*!40000 ALTER TABLE `actor` DISABLE KEYS */;
INSERT INTO `actor` VALUES (1,'matthew','mcconaughey','52','M','americain'),(2,'leonardo','di caprio','47','M','americain'),(3,'bob','odenkirk','59','M','americain'),(4,'john david','washington','38','M','americain'),(5,'jack','nicholson','85','M','americain'),(6,'christian','bale','48','M','americain'),(7,'warren','clarke','88','M','americain'),(8,'robert','de niro','79','M','americain'),(9,'joe','pesci','79','M','americain'),(10,'matt ','damon','51','M','americain'),(11,'johny ','depp','59','M','americain'),(12,'bryan','cranston','66','M','americain'),(13,'damian','lewis','51','M','americain'),(14,'jared','harris','61','M','americain'),(15,'steve','carell','60','M','americain'),(16,'idris','elba','50','M','americain'),(17,'woody','harrelson','61','M','americain'),(18,'james','gandolfini','51','M','americain'),(19,'emilia','clark','35','M','britannique'),(20,'justin','roiland','42','M','americain');
/*!40000 ALTER TABLE `actor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movie`
--

DROP TABLE IF EXISTS `movie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movie` (
  `id` int NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `duration` time DEFAULT NULL,
  `realisator_name` varchar(255) DEFAULT NULL,
  `realisator_first_name` varchar(255) DEFAULT NULL,
  `synopsis` varchar(255) DEFAULT NULL,
  `category` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie`
--

LOCK TABLES `movie` WRITE;
/*!40000 ALTER TABLE `movie` DISABLE KEYS */;
INSERT INTO `movie` VALUES (1,'intersellar','02:49:00','christopher ','nolan','un trou noir','sci-fi'),(2,'inception','02:28:00','christopher ','nolan','histoire d un mec qui rêve','sci-fi'),(3,'tenet','02:30:00','christopher ','nolan','voyage dans le temps','sci-fi'),(4,'american psycho','01:41:00','marry','haron','psychopathe en vadrouille','drame'),(5,'shining','01:59:00','stanley','kubrick','hache porte','horreur'),(6,'orange mécanique','02:16:00','stanley','kubrick','violence','drame'),(7,'les affranchis','02:26:00','martin','scorsese','je suis marrant ?','gangsters'),(8,'casino','02:58:00','martin','scorsese','stylo gorge','gangsters'),(9,'seul sur mars','02:21:00','ridley','scott','solo','sci-fi'),(10,'transcendance','01:59:00','wally','pfister','cerveau -> ordinateur','sci-fi');
/*!40000 ALTER TABLE `movie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movie_disponibility`
--

DROP TABLE IF EXISTS `movie_disponibility`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movie_disponibility` (
  `id` int NOT NULL,
  `id_movie` int DEFAULT NULL,
  `id_platform` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_movie` (`id_movie`),
  KEY `id_platform` (`id_platform`),
  CONSTRAINT `movie_disponibility_ibfk_1` FOREIGN KEY (`id_movie`) REFERENCES `movie` (`id`),
  CONSTRAINT `movie_disponibility_ibfk_2` FOREIGN KEY (`id_platform`) REFERENCES `platform` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie_disponibility`
--

LOCK TABLES `movie_disponibility` WRITE;
/*!40000 ALTER TABLE `movie_disponibility` DISABLE KEYS */;
INSERT INTO `movie_disponibility` VALUES (1,1,5),(2,2,6),(3,3,1),(4,4,5),(5,5,5),(6,6,3),(7,7,1),(8,8,6),(9,9,2),(10,10,4);
/*!40000 ALTER TABLE `movie_disponibility` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movie_viewing`
--

DROP TABLE IF EXISTS `movie_viewing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movie_viewing` (
  `id` int NOT NULL,
  `id_movie` int DEFAULT NULL,
  `id_user` int DEFAULT NULL,
  `duration` time DEFAULT NULL,
  `starting_time` datetime DEFAULT NULL,
  `device` varchar(255) DEFAULT NULL,
  `rate` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_movie` (`id_movie`),
  KEY `id_user` (`id_user`),
  CONSTRAINT `movie_viewing_ibfk_1` FOREIGN KEY (`id_movie`) REFERENCES `movie` (`id`),
  CONSTRAINT `movie_viewing_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `utilisateur` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie_viewing`
--

LOCK TABLES `movie_viewing` WRITE;
/*!40000 ALTER TABLE `movie_viewing` DISABLE KEYS */;
INSERT INTO `movie_viewing` VALUES (1,8,15,'04:03:56','2020-02-18 04:34:04','tablette',83),(2,8,12,'02:13:23','2021-12-01 02:27:49','téléphone',86),(3,6,15,'01:16:47','2020-12-06 16:33:40','tv',99),(4,2,3,'04:41:34','2020-11-17 09:37:52','tablette',9),(5,7,2,'00:24:19','2020-05-26 09:21:44','tv',16),(6,8,9,'03:23:35','2022-09-12 00:06:16','tv',89),(7,8,5,'06:23:01','2022-03-12 09:31:02','tv',93),(8,4,7,'00:32:22','2020-12-31 17:07:39','tablette',8),(9,7,10,'01:14:49','2020-01-31 05:05:04','tablette',40),(10,5,10,'02:42:39','2022-05-09 09:09:24','tv',40),(11,10,11,'04:30:12','2021-09-09 11:20:25','téléphone',70),(12,5,10,'03:41:58','2021-07-05 06:32:13','tv',17);
/*!40000 ALTER TABLE `movie_viewing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `platform`
--

DROP TABLE IF EXISTS `platform`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `platform` (
  `id` int NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `price` decimal(4,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `platform`
--

LOCK TABLES `platform` WRITE;
/*!40000 ALTER TABLE `platform` DISABLE KEYS */;
INSERT INTO `platform` VALUES (1,'netflix',17.99),(2,'amazon prime',6.99),(3,'disney',8.99),(4,'mycanal',24.99),(5,'ocs',10.99),(6,'appletv',4.99),(7,'salto',6.99);
/*!40000 ALTER TABLE `platform` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `play_in_movie`
--

DROP TABLE IF EXISTS `play_in_movie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `play_in_movie` (
  `id` int NOT NULL,
  `id_movie` int DEFAULT NULL,
  `id_actor` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_movie` (`id_movie`),
  KEY `id_actor` (`id_actor`),
  CONSTRAINT `play_in_movie_ibfk_1` FOREIGN KEY (`id_movie`) REFERENCES `movie` (`id`),
  CONSTRAINT `play_in_movie_ibfk_2` FOREIGN KEY (`id_actor`) REFERENCES `actor` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `play_in_movie`
--

LOCK TABLES `play_in_movie` WRITE;
/*!40000 ALTER TABLE `play_in_movie` DISABLE KEYS */;
INSERT INTO `play_in_movie` VALUES (1,1,1),(2,2,2),(3,3,4),(4,4,6),(5,5,5),(6,6,7),(7,7,8),(8,7,9),(9,8,8),(10,8,9),(11,9,10),(12,10,11);
/*!40000 ALTER TABLE `play_in_movie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `play_in_tv_show`
--

DROP TABLE IF EXISTS `play_in_tv_show`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `play_in_tv_show` (
  `id` int NOT NULL,
  `id_tv_show` int DEFAULT NULL,
  `id_actor` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_tv_show` (`id_tv_show`),
  KEY `id_actor` (`id_actor`),
  CONSTRAINT `play_in_tv_show_ibfk_1` FOREIGN KEY (`id_tv_show`) REFERENCES `tv_show` (`id`),
  CONSTRAINT `play_in_tv_show_ibfk_2` FOREIGN KEY (`id_actor`) REFERENCES `actor` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `play_in_tv_show`
--

LOCK TABLES `play_in_tv_show` WRITE;
/*!40000 ALTER TABLE `play_in_tv_show` DISABLE KEYS */;
INSERT INTO `play_in_tv_show` VALUES (1,1,3),(2,1,12),(3,2,13),(4,3,14),(5,4,16),(6,5,18),(7,6,19),(8,7,20),(9,8,15),(10,9,1),(11,10,3);
/*!40000 ALTER TABLE `play_in_tv_show` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscription`
--

DROP TABLE IF EXISTS `subscription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subscription` (
  `id` int NOT NULL,
  `id_platform` int DEFAULT NULL,
  `id_user` int DEFAULT NULL,
  `subscription_date` datetime DEFAULT NULL,
  `payment_type` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_platform` (`id_platform`),
  KEY `id_user` (`id_user`),
  CONSTRAINT `subscription_ibfk_1` FOREIGN KEY (`id_platform`) REFERENCES `platform` (`id`),
  CONSTRAINT `subscription_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `utilisateur` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscription`
--

LOCK TABLES `subscription` WRITE;
/*!40000 ALTER TABLE `subscription` DISABLE KEYS */;
INSERT INTO `subscription` VALUES (1,7,16,'2022-02-11 17:31:55','mastercard'),(2,3,3,'2022-01-26 18:05:39','paypal'),(3,1,6,'2021-07-23 16:18:57','visa'),(4,7,2,'2021-09-17 17:33:10','mastercard'),(5,3,8,'2021-12-09 12:19:15','paypal'),(6,1,6,'2022-08-07 18:40:16','bitcoin'),(7,5,10,'2021-07-26 13:21:39','paypal'),(8,5,6,'2021-07-11 20:02:53','mastercard'),(9,4,2,'2020-05-03 12:03:59','bitcoin'),(10,7,1,'2020-06-22 05:25:33','paypal');
/*!40000 ALTER TABLE `subscription` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tv_show`
--

DROP TABLE IF EXISTS `tv_show`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tv_show` (
  `id` int NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `realisator_name` varchar(255) DEFAULT NULL,
  `realisator_first_name` varchar(255) DEFAULT NULL,
  `synopsis` varchar(255) DEFAULT NULL,
  `category` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tv_show`
--

LOCK TABLES `tv_show` WRITE;
/*!40000 ALTER TABLE `tv_show` DISABLE KEYS */;
INSERT INTO `tv_show` VALUES (1,'breaking bad','vince','gilligan','un cancéreux qui vend de la drogue','drame'),(2,'band of brothers','tom','hanks','des potes qui font la guerre','guerre'),(3,'chernobyl','craig','mazin','une centrale nucléaire qui explose','drame historique'),(4,'the wire','david','simon','la police et les voleurs','policière'),(5,'les sopranos','david','chase','les mafieux','drame'),(6,'game of thrones','david','benioff','des dragons et de la guerre','fantaisie'),(7,'rick et morty','dan ','harmon','un grand père et son petit fils','sci-fi'),(8,'the office','ricky ','gervais','un manager débile','sitcom'),(9,'true detective','nic','pizzolatto','les gentils flics','policière'),(10,'better call saul','vince','gilligan','un avocat véreux','drame');
/*!40000 ALTER TABLE `tv_show` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tv_show_disponibility`
--

DROP TABLE IF EXISTS `tv_show_disponibility`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tv_show_disponibility` (
  `id` int NOT NULL,
  `id_tv_show` int DEFAULT NULL,
  `id_platform` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_tv_show` (`id_tv_show`),
  KEY `id_platform` (`id_platform`),
  CONSTRAINT `tv_show_disponibility_ibfk_1` FOREIGN KEY (`id_tv_show`) REFERENCES `tv_show` (`id`),
  CONSTRAINT `tv_show_disponibility_ibfk_2` FOREIGN KEY (`id_platform`) REFERENCES `platform` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tv_show_disponibility`
--

LOCK TABLES `tv_show_disponibility` WRITE;
/*!40000 ALTER TABLE `tv_show_disponibility` DISABLE KEYS */;
INSERT INTO `tv_show_disponibility` VALUES (1,1,1),(2,2,6),(3,3,4),(4,4,4),(5,5,1),(6,6,4),(7,7,3),(8,8,4),(9,9,3),(10,10,2);
/*!40000 ALTER TABLE `tv_show_disponibility` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tv_show_viewing`
--

DROP TABLE IF EXISTS `tv_show_viewing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tv_show_viewing` (
  `id` int NOT NULL,
  `id_tv_show` int DEFAULT NULL,
  `id_user` int DEFAULT NULL,
  `duration` time DEFAULT NULL,
  `starting_time` datetime DEFAULT NULL,
  `device` varchar(255) DEFAULT NULL,
  `rate` int DEFAULT NULL,
  `season_number` int DEFAULT NULL,
  `epsiode_number` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_tv_show` (`id_tv_show`),
  KEY `id_user` (`id_user`),
  CONSTRAINT `tv_show_viewing_ibfk_1` FOREIGN KEY (`id_tv_show`) REFERENCES `tv_show` (`id`),
  CONSTRAINT `tv_show_viewing_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `utilisateur` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tv_show_viewing`
--

LOCK TABLES `tv_show_viewing` WRITE;
/*!40000 ALTER TABLE `tv_show_viewing` DISABLE KEYS */;
INSERT INTO `tv_show_viewing` VALUES (1,9,10,'00:31:38','2021-02-14 17:03:45','tablette',38,3,10),(2,9,16,'00:08:08','2020-08-03 02:57:41','téléphone',17,3,1),(3,6,2,'00:17:14','2020-07-02 06:04:17','tv',40,3,9),(4,5,1,'00:37:44','2021-10-01 07:03:06','tablette',91,3,8),(5,6,10,'00:16:00','2022-11-16 17:18:16','tv',56,1,12),(6,5,10,'00:15:31','2022-03-27 01:41:40','tv',26,4,9),(7,2,9,'00:10:45','2022-08-20 05:09:41','tv',96,4,1),(8,9,10,'00:31:21','2022-03-23 10:16:13','tablette',35,5,7),(9,6,8,'00:00:49','2022-07-31 16:53:47','tablette',78,3,6),(10,1,10,'00:08:33','2022-06-14 21:26:52','tv',38,3,3),(11,2,9,'00:34:00','2020-05-04 04:15:54','téléphone',62,5,6),(12,2,11,'00:08:15','2022-04-01 04:25:57','tv',93,5,9);
/*!40000 ALTER TABLE `tv_show_viewing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `utilisateur`
--

DROP TABLE IF EXISTS `utilisateur`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `utilisateur` (
  `id` int NOT NULL,
  `user_name` varchar(30) DEFAULT NULL,
  `user_first_name` varchar(30) DEFAULT NULL,
  `gender` char(1) DEFAULT NULL,
  `email_addr` varchar(50) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `user_login` varchar(255) DEFAULT NULL,
  `user_password` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `utilisateur_chk_1` CHECK (((`gender` like _utf8mb4'm') or (`gender` like _utf8mb4'f')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `utilisateur`
--

LOCK TABLES `utilisateur` WRITE;
/*!40000 ALTER TABLE `utilisateur` DISABLE KEYS */;
INSERT INTO `utilisateur` VALUES (1,'sicot','julien','M','sicot.julien@polytech.com','2000-07-24','sicot.julien','QRT77kwa','France'),(2,'jorand','antoine','M','jorand.antoine@polytech.com','1999-09-26','jorand.antoine','GYA68kby','France'),(3,'martino','ugo','M','martino.ugo@polytech.com','2003-02-14','martino.ugo','FSP45nud','France'),(4,'prevoteau','sullivan','M','prevoteau.sullivan@polytech.com','2000-02-04','prevoteau.sullivan','MKX03joo','France'),(5,'allouis','ambre','F','allouis.ambre@polytech.com','2002-09-02','allouis.ambre','EBU51njg','France'),(6,'bensalem','ilyes','M','bensalem.ilyes@polytech.com','1996-11-23','bensalem.ilyes','AKX17fnk','France'),(7,'bousquet','alexandre','M','bousquet.alexandre@polytech.com','1999-05-18','bousquet.alexandre','HYE41hzi','France'),(8,'canella','clement','M','canella.clément@polytech.com','2003-02-11','canella.clément','BZJ38uhj','France'),(9,'frantzen','maxime','M','frantzen.maxime@polytech.com','1997-08-27','frantzen.maxime','WEA29pcx','France'),(10,'grondin','clement','M','grondin.clément@polytech.com','2001-12-06','grondin.clément','NKB62hwj','France'),(11,'guillaume','solène','F','guillaume.solène@polytech.com','2003-01-21','guillaume.solène','DJQ33kou','France'),(12,'lecuivre','antoine','M','lecuivre.antoine@polytech.com','2000-07-10','lecuivre.antoine','OJS98fon','France'),(13,'moreau','jules','M','moreau.jules@polytech.com','1995-03-27','moreau.jules','PLY78wii','France'),(14,'rguibi','taha','M','rguibi.taha@polytech.com','1995-02-02','rguibi.taha','KRF38kgb','France'),(15,'scanzalupi','alexandre','M','scanzalupi.alexandre@polytech.com','2003-09-11','scanzalupi.alexandre','ZER51dxr','France'),(16,'benzaouia','oussama','M','benzaouia.oussama@polytech.com','2001-05-20','benzaouia.oussama','PZX14yoz','France'),(17,'robert','sylvain','M','robert.sylvain@polytech.com','1999-06-24','robert.sylvain','PSQ07jnc','France');
/*!40000 ALTER TABLE `utilisateur` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-10-05 11:17:15

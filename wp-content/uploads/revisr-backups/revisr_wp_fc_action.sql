
/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
DROP TABLE IF EXISTS `wp_fc_action`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_fc_action` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `review_status` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `actor_id` int(11) NOT NULL,
  `next_assign_actors` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `step_id` int(11) NOT NULL,
  `comments` mediumtext COLLATE utf8mb4_unicode_520_ci,
  `due_date` date DEFAULT NULL,
  `action_history_id` bigint(20) NOT NULL,
  `history_meta` longtext COLLATE utf8mb4_unicode_520_ci,
  `update_datetime` datetime NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `wp_fc_action` WRITE;
/*!40000 ALTER TABLE `wp_fc_action` DISABLE KEYS */;
INSERT INTO `wp_fc_action` VALUES (1,'complete',6,'[\"1\"]',3,'[{\"send_id\":6,\"comment\":\"\",\"comment_timestamp\":\"2018-10-30 15:25:02\"}]','2018-10-31',2,NULL,'2018-10-30 15:25:02'),(2,'complete',6,'[\"1\"]',3,'[{\"send_id\":6,\"comment\":\"\",\"comment_timestamp\":\"2018-10-30 15:31:08\"}]','2018-10-31',6,NULL,'2018-10-30 15:31:08'),(3,'complete',6,'[\"1\"]',3,'[{\"send_id\":6,\"comment\":\"\",\"comment_timestamp\":\"2018-10-31 12:21:05\"}]',NULL,10,NULL,'2018-10-31 12:21:05'),(4,'complete',6,'[\"1\"]',3,'[{\"send_id\":6,\"comment\":\"\",\"comment_timestamp\":\"2018-10-31 12:20:49\"}]',NULL,12,NULL,'2018-10-31 12:20:49'),(5,'abort_no_action',1,'',0,NULL,NULL,17,NULL,'2018-10-31 12:32:17'),(6,'complete',1,'[\"1\"]',3,'[{\"send_id\":1,\"comment\":\"\",\"comment_timestamp\":\"2018-10-31 19:27:43\"}]',NULL,20,NULL,'2018-10-31 19:27:43'),(7,'complete',1,'[\"1\"]',3,'[{\"send_id\":1,\"comment\":\"\",\"comment_timestamp\":\"2018-10-31 12:33:40\"}]',NULL,22,NULL,'2018-10-31 12:33:40'),(8,'complete',1,'[\"1\"]',3,'[{\"send_id\":1,\"comment\":\"\",\"comment_timestamp\":\"2018-11-01 15:32:05\"}]',NULL,29,NULL,'2018-11-01 15:32:05');
/*!40000 ALTER TABLE `wp_fc_action` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;


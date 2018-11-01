
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
DROP TABLE IF EXISTS `wp_fc_action_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_fc_action_history` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `action_status` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `comment` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `step_id` int(11) NOT NULL,
  `assign_actor_id` int(11) NOT NULL,
  `post_id` bigint(20) NOT NULL,
  `from_id` bigint(20) NOT NULL,
  `due_date` date DEFAULT NULL,
  `history_meta` longtext COLLATE utf8mb4_unicode_520_ci,
  `reminder_date` date DEFAULT NULL,
  `reminder_date_after` date DEFAULT NULL,
  `create_datetime` datetime NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `wp_fc_action_history` WRITE;
/*!40000 ALTER TABLE `wp_fc_action_history` DISABLE KEYS */;
INSERT INTO `wp_fc_action_history` VALUES (1,'submitted','[{\"send_id\":\"System\",\"comment\":\"Post\\/Page was submitted to the workflow by admin\",\"comment_timestamp\":\"2018-10-30 15:23:59\"}]',1,1,2699,0,NULL,NULL,NULL,NULL,'2018-10-30 15:23:59'),(2,'processed','[{\"send_id\":1,\"comment\":\"Please do not accept this\",\"comment_timestamp\":\"2018-10-30 15:23:59\"}]',1,-1,2699,1,'2018-10-31',NULL,NULL,NULL,'2018-10-30 15:23:59'),(3,'processed','[{\"send_id\":6,\"comment\":\"\",\"comment_timestamp\":\"2018-10-30 15:25:02\"}]',3,1,2699,2,'2018-10-31',NULL,NULL,NULL,'2018-10-30 15:25:02'),(4,'complete','',3,1,2699,3,NULL,NULL,NULL,NULL,'2018-10-30 15:25:45'),(5,'submitted','[{\"send_id\":\"System\",\"comment\":\"Post\\/Page was submitted to the workflow by Isaac Voth\",\"comment_timestamp\":\"2018-10-30 15:29:31\"}]',1,6,2703,0,NULL,NULL,NULL,NULL,'2018-10-30 15:29:31'),(6,'processed','[{\"send_id\":6,\"comment\":\"Please reject\",\"comment_timestamp\":\"2018-10-30 15:29:31\"}]',1,-1,2703,5,'2018-10-31',NULL,NULL,NULL,'2018-10-30 15:29:31'),(7,'processed','[{\"send_id\":6,\"comment\":\"\",\"comment_timestamp\":\"2018-10-30 15:31:08\"}]',3,1,2703,6,'2018-10-31',NULL,NULL,NULL,'2018-10-30 15:31:08'),(8,'complete','',3,1,2703,7,NULL,NULL,NULL,NULL,'2018-10-30 15:31:32'),(9,'submitted','[{\"send_id\":\"System\",\"comment\":\"Post\\/Page was submitted to the workflow by admin\",\"comment_timestamp\":\"2018-10-31 12:14:56\"}]',1,1,2734,0,NULL,NULL,NULL,NULL,'2018-10-31 12:14:56'),(10,'processed','[{\"send_id\":1,\"comment\":\"\",\"comment_timestamp\":\"2018-10-31 12:14:56\"}]',1,-1,2734,9,NULL,NULL,NULL,NULL,'2018-10-31 12:14:56'),(11,'submitted','[{\"send_id\":\"System\",\"comment\":\"Post\\/Page was submitted to the workflow by Ganesh Vetsa\",\"comment_timestamp\":\"2018-10-31 12:19:35\"}]',1,7,2736,0,NULL,NULL,NULL,NULL,'2018-10-31 12:19:35'),(12,'processed','[{\"send_id\":7,\"comment\":\"\",\"comment_timestamp\":\"2018-10-31 12:19:35\"}]',1,-1,2736,11,NULL,NULL,NULL,NULL,'2018-10-31 12:19:35'),(13,'processed','[{\"send_id\":6,\"comment\":\"\",\"comment_timestamp\":\"2018-10-31 12:20:49\"}]',3,1,2736,12,NULL,NULL,NULL,NULL,'2018-10-31 12:20:49'),(14,'processed','[{\"send_id\":6,\"comment\":\"\",\"comment_timestamp\":\"2018-10-31 12:21:05\"}]',3,1,2734,10,NULL,NULL,NULL,NULL,'2018-10-31 12:21:05'),(15,'complete','',3,1,2736,13,NULL,NULL,NULL,NULL,'2018-10-31 12:22:00'),(16,'submitted','[{\"send_id\":\"System\",\"comment\":\"Post\\/Page was submitted to the workflow by admin\",\"comment_timestamp\":\"2018-10-31 12:31:12\"}]',1,1,2739,0,NULL,NULL,NULL,NULL,'2018-10-31 12:31:12'),(17,'abort_no_action','[{\"send_id\":1,\"comment\":\"\",\"comment_timestamp\":\"2018-10-31 12:31:12\"}]',1,-1,2739,16,NULL,NULL,NULL,NULL,'2018-10-31 12:32:17'),(18,'aborted','[{\"send_id\":1,\"comment\":\"changed workflow\",\"comment_timestamp\":\"2018-10-31 12:32:17\"}]',1,1,2739,17,NULL,NULL,NULL,NULL,'2018-10-31 12:32:17'),(19,'submitted','[{\"send_id\":\"System\",\"comment\":\"Post\\/Page was submitted to the workflow by admin\",\"comment_timestamp\":\"2018-10-31 12:32:25\"}]',1,1,2739,0,NULL,NULL,NULL,NULL,'2018-10-31 12:30:00'),(20,'processed','[{\"send_id\":1,\"comment\":\"\",\"comment_timestamp\":\"2018-10-31 12:32:25\"}]',1,-1,2739,19,NULL,NULL,NULL,NULL,'2018-10-31 12:32:25'),(21,'submitted','[{\"send_id\":\"System\",\"comment\":\"Post\\/Page was submitted to the workflow by admin\",\"comment_timestamp\":\"2018-10-31 12:33:21\"}]',1,1,2741,0,NULL,NULL,NULL,NULL,'2018-10-31 12:33:20'),(22,'processed','[{\"send_id\":1,\"comment\":\"\",\"comment_timestamp\":\"2018-10-31 12:33:21\"}]',1,-1,2741,21,NULL,NULL,NULL,NULL,'2018-10-31 12:33:21'),(23,'processed','[{\"send_id\":1,\"comment\":\"\",\"comment_timestamp\":\"2018-10-31 12:33:40\"}]',3,1,2741,22,NULL,NULL,NULL,NULL,'2018-10-31 12:33:40'),(24,'complete','',3,1,2741,23,NULL,NULL,NULL,NULL,'2018-10-31 12:34:04'),(25,'processed','[{\"send_id\":1,\"comment\":\"\",\"comment_timestamp\":\"2018-10-31 19:27:43\"}]',3,1,2739,20,NULL,NULL,NULL,NULL,'2018-10-31 19:27:43'),(26,'complete','',3,1,2739,25,NULL,NULL,NULL,NULL,'2018-10-31 19:28:03'),(27,'complete','',3,1,2734,14,NULL,NULL,NULL,NULL,'2018-10-31 19:28:13'),(28,'submitted','[{\"send_id\":\"System\",\"comment\":\"Post\\/Page was submitted to the workflow by T R\",\"comment_timestamp\":\"2018-11-01 15:31:15\"}]',1,5,2764,0,NULL,NULL,NULL,NULL,'2018-11-01 15:31:15'),(29,'processed','[{\"send_id\":5,\"comment\":\"\",\"comment_timestamp\":\"2018-11-01 15:31:15\"}]',1,-1,2764,28,NULL,NULL,NULL,NULL,'2018-11-01 15:31:15'),(30,'processed','[{\"send_id\":1,\"comment\":\"\",\"comment_timestamp\":\"2018-11-01 15:32:05\"}]',3,1,2764,29,NULL,NULL,NULL,NULL,'2018-11-01 15:32:05'),(31,'complete','',3,1,2764,30,NULL,NULL,NULL,NULL,'2018-11-01 15:32:23');
/*!40000 ALTER TABLE `wp_fc_action_history` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;


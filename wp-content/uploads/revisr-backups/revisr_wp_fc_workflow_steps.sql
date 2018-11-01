
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
DROP TABLE IF EXISTS `wp_fc_workflow_steps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_fc_workflow_steps` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `step_info` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `process_info` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `workflow_id` int(11) NOT NULL,
  `create_datetime` datetime DEFAULT NULL,
  `update_datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `workflow_id` (`workflow_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `wp_fc_workflow_steps` WRITE;
/*!40000 ALTER TABLE `wp_fc_workflow_steps` DISABLE KEYS */;
INSERT INTO `wp_fc_workflow_steps` VALUES (1,'{\"process\":\"review\",\"step_name\":\"review\",\"assign_to_all\":0,\"task_assignee\":{\"roles\":[\"administrator\",\"editor\"],\"users\":[],\"groups\":[]},\"review_approval\":\"everyone\"}','{\"assign_subject\":\"\",\"assign_content\":\"\",\"reminder_subject\":\"\",\"reminder_content\":\"\"}',1,'2018-10-30 15:08:35','2018-10-31 12:32:02'),(2,'{\"process\":\"assignment\",\"step_name\":\"assignment\",\"assign_to_all\":0,\"task_assignee\":{\"roles\":[\"administrator\",\"author\",\"editor\"],\"users\":[],\"groups\":[]}}','{\"assign_subject\":\"\",\"assign_content\":\"\",\"reminder_subject\":\"\",\"reminder_content\":\"\"}',1,'2018-10-30 15:08:35','2018-10-31 12:30:11'),(3,'{\"process\":\"publish\",\"step_name\":\"publish\",\"assign_to_all\":0,\"task_assignee\":{\"roles\":[\"administrator\"],\"users\":[],\"groups\":[]}}','{\"assign_subject\":\"\",\"assign_content\":\"\",\"reminder_subject\":\"\",\"reminder_content\":\"\"}',1,'2018-10-30 15:08:35','2018-10-31 12:30:27'),(4,'{\"process\":\"assignment\",\"step_name\":\"assignment\",\"assign_to_all\":0,\"task_assignee\":{\"roles\":[\"author\"],\"users\":[],\"groups\":[]},\"assignee\":{},\"status\":\"\"}','{\"assign_subject\":\"\",\"assign_content\":\"\",\"reminder_subject\":\"\",\"reminder_content\":\"\"}',2,'2018-10-30 15:08:35','2018-10-30 15:08:35'),(5,'{\"process\":\"review\",\"step_name\":\"review\",\"assign_to_all\":0,\"task_assignee\":{\"roles\":[\"editor\"],\"users\":[],\"groups\":[]},\"assignee\":{},\"status\":\"\",\"review_approval\":\"everyone\"}','{\"assign_subject\":\"\",\"assign_content\":\"\",\"reminder_subject\":\"\",\"reminder_content\":\"\"}',2,'2018-10-30 15:08:35','2018-10-30 15:08:35'),(6,'{\"process\":\"publish\",\"step_name\":\"publish\",\"assign_to_all\":0,\"task_assignee\":{\"roles\":[\"administrator\"],\"users\":[],\"groups\":[]},\"assignee\":{},\"status\":\"\"}','{\"assign_subject\":\"\",\"assign_content\":\"\",\"reminder_subject\":\"\",\"reminder_content\":\"\"}',2,'2018-10-30 15:08:35','2018-10-30 15:08:35');
/*!40000 ALTER TABLE `wp_fc_workflow_steps` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;


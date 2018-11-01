
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
DROP TABLE IF EXISTS `wp_fc_workflows`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_fc_workflows` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_520_ci,
  `wf_info` longtext COLLATE utf8mb4_unicode_520_ci,
  `version` int(3) NOT NULL DEFAULT '1',
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `is_auto_submit` int(2) NOT NULL DEFAULT '0',
  `auto_submit_info` mediumtext COLLATE utf8mb4_unicode_520_ci,
  `is_valid` int(2) NOT NULL DEFAULT '0',
  `create_datetime` datetime DEFAULT NULL,
  `update_datetime` datetime DEFAULT NULL,
  `wf_additional_info` mediumtext COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `wp_fc_workflows` WRITE;
/*!40000 ALTER TABLE `wp_fc_workflows` DISABLE KEYS */;
INSERT INTO `wp_fc_workflows` VALUES (1,'Approval Flow','Editor edits. Admin publishes.','{\"steps\":{\"step0\":{\"fc_addid\":\"step0\",\"fc_label\":\"assignment\",\"fc_dbid\":\"2\",\"fc_process\":\"assignment\",\"fc_position\":[\"446px\",\"641px\"]},\"step1\":{\"fc_addid\":\"step1\",\"fc_label\":\"review\",\"fc_dbid\":\"1\",\"fc_process\":\"review\",\"fc_position\":[\"297px\",\"374px\"]},\"step2\":{\"fc_addid\":\"step2\",\"fc_label\":\"publish\",\"fc_dbid\":\"3\",\"fc_process\":\"publish\",\"fc_position\":[\"104px\",\"602px\"]}},\"conns\":{\"0\":{\"sourceId\":\"step2\",\"targetId\":\"step0\",\"post_status\":\"draft\",\"connset\":{\"connector\":\"StateMachine\",\"paintStyle\":{\"lineWidth\":3,\"strokeStyle\":\"red\"}}},\"1\":{\"sourceId\":\"step1\",\"targetId\":\"step0\",\"post_status\":\"draft\",\"connset\":{\"connector\":\"StateMachine\",\"paintStyle\":{\"lineWidth\":3,\"strokeStyle\":\"red\"}}},\"2\":{\"sourceId\":\"step0\",\"targetId\":\"step1\",\"post_status\":\"pending\",\"connset\":{\"connector\":\"StateMachine\",\"paintStyle\":{\"lineWidth\":3,\"strokeStyle\":\"blue\"}}},\"3\":{\"sourceId\":\"step2\",\"targetId\":\"step1\",\"post_status\":\"pending\",\"connset\":{\"connector\":\"StateMachine\",\"paintStyle\":{\"lineWidth\":3,\"strokeStyle\":\"red\"}}},\"4\":{\"sourceId\":\"step1\",\"targetId\":\"step2\",\"post_status\":\"ready-to-publish\",\"connset\":{\"connector\":\"StateMachine\",\"paintStyle\":{\"lineWidth\":3,\"strokeStyle\":\"blue\"}}}},\"first_step\":[{\"step\":\"step1\",\"post_status\":\"pending\"}]}',1,0,'2018-10-30','2019-10-30',0,NULL,1,'2018-10-30 15:08:35','2018-10-31 12:32:05','a:4:{s:16:\"wf_for_new_posts\";i:1;s:20:\"wf_for_revised_posts\";i:1;s:12:\"wf_for_roles\";a:9:{i:0;s:13:\"administrator\";i:1;s:6:\"author\";i:2;s:20:\"booked_booking_agent\";i:3;s:11:\"contributor\";i:4;s:8:\"customer\";i:5;s:6:\"editor\";i:6;s:12:\"shop_manager\";i:7;s:9:\"subeditor\";i:8;s:10:\"subscriber\";}s:17:\"wf_for_post_types\";a:1:{i:0;s:4:\"page\";}}'),(2,'The Workflow','the workflow','{\"steps\":{\"step0\":{\"fc_addid\":\"step0\",\"fc_label\":\"assignment\",\"fc_dbid\":4,\"fc_process\":\"assignment\",\"fc_position\":[\"431px\",\"576px\"]},\"step1\":{\"fc_addid\":\"step1\",\"fc_label\":\"review\",\"fc_dbid\":5,\"fc_process\":\"review\",\"fc_position\":[\"285px\",\"323px\"]},\"step2\":{\"fc_addid\":\"step2\",\"fc_label\":\"publish\",\"fc_dbid\":6,\"fc_process\":\"publish\",\"fc_position\":[\"104px\",\"602px\"]}},\"conns\":{\"0\":{\"sourceId\":\"step2\",\"targetId\":\"step0\",\"post_status\":\"draft\",\"connset\":{\"connector\":\"StateMachine\",\"paintStyle\":{\"lineWidth\":3,\"strokeStyle\":\"red\"}}},\"1\":{\"sourceId\":\"step1\",\"targetId\":\"step0\",\"post_status\":\"draft\",\"connset\":{\"connector\":\"StateMachine\",\"paintStyle\":{\"lineWidth\":3,\"strokeStyle\":\"red\"}}},\"2\":{\"sourceId\":\"step0\",\"targetId\":\"step1\",\"post_status\":\"pending\",\"connset\":{\"connector\":\"StateMachine\",\"paintStyle\":{\"lineWidth\":3,\"strokeStyle\":\"blue\"}}},\"3\":{\"sourceId\":\"step2\",\"targetId\":\"step1\",\"post_status\":\"pending\",\"connset\":{\"connector\":\"StateMachine\",\"paintStyle\":{\"lineWidth\":3,\"strokeStyle\":\"red\"}}},\"4\":{\"sourceId\":\"step1\",\"targetId\":\"step2\",\"post_status\":\"ready-to-publish\",\"connset\":{\"connector\":\"StateMachine\",\"paintStyle\":{\"lineWidth\":3,\"strokeStyle\":\"blue\"}}}},\"first_step\":[{\"step\":\"step1\",\"post_status\":\"draft\"}]}',2,1,NULL,NULL,0,NULL,0,'2018-10-31 12:24:14','2018-10-31 12:24:14','a:4:{s:16:\"wf_for_new_posts\";i:1;s:20:\"wf_for_revised_posts\";i:1;s:12:\"wf_for_roles\";a:8:{i:0;s:13:\"administrator\";i:1;s:6:\"author\";i:2;s:20:\"booked_booking_agent\";i:3;s:11:\"contributor\";i:4;s:8:\"customer\";i:5;s:6:\"editor\";i:6;s:12:\"shop_manager\";i:7;s:10:\"subscriber\";}s:17:\"wf_for_post_types\";a:1:{i:0;s:4:\"page\";}}');
/*!40000 ALTER TABLE `wp_fc_workflows` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;


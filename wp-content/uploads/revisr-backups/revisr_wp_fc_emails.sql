
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
DROP TABLE IF EXISTS `wp_fc_emails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_fc_emails` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `subject` mediumtext COLLATE utf8mb4_unicode_520_ci,
  `message` mediumtext COLLATE utf8mb4_unicode_520_ci,
  `from_user` int(11) DEFAULT NULL,
  `to_user` int(11) DEFAULT NULL,
  `action` int(2) DEFAULT '1',
  `history_id` bigint(20) DEFAULT NULL,
  `send_date` date DEFAULT NULL,
  `create_datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `wp_fc_emails` WRITE;
/*!40000 ALTER TABLE `wp_fc_emails` DISABLE KEYS */;
INSERT INTO `wp_fc_emails` VALUES (1,'[Advisar] You have an assignment','You have an assignment related to post - <a href=\"http://35.184.206.37/wp-admin/post.php?post=2699&action=edit&oasiswf=2\" target=\"_blank\">Hello From Admin</a><p><strong>Additionally,</strong> admin added the following comments:</p><p>Please do not accept this</p><p>Priority : Normal</p><p>Sign off date : October 30, 2018 3:23 pm</p><p>Due Date : October 31, 2018 </p>',NULL,6,0,2,'2018-10-30','2018-10-30 15:23:59'),(2,'[Advisar] You have an assignment','You have an assignment related to post - <a href=\"http://35.184.206.37/wp-admin/post.php?post=2699&action=edit&oasiswf=3\" target=\"_blank\">Hello From Admin</a><p>Priority : Normal</p><p>Sign off date : October 30, 2018 3:25 pm</p><p>Due Date : October 31, 2018 </p>',NULL,1,0,3,'2018-10-30','2018-10-30 15:25:02'),(3,'[Advisar] You have an assignment','You have an assignment related to post - <a href=\"http://35.184.206.37/wp-admin/post.php?post=2703&action=edit&oasiswf=6\" target=\"_blank\">Page for review</a><p><strong>Additionally,</strong> Isaac Voth added the following comments:</p><p>Please reject</p><p>Priority : Normal</p><p>Sign off date : October 30, 2018 3:29 pm</p><p>Due Date : October 31, 2018 </p>',NULL,6,0,6,'2018-10-30','2018-10-30 15:29:31'),(4,'[Advisar] You have an assignment','You have an assignment related to post - <a href=\"http://35.184.206.37/wp-admin/post.php?post=2703&action=edit&oasiswf=7\" target=\"_blank\">Page for review</a><p>Priority : Normal</p><p>Sign off date : October 30, 2018 3:31 pm</p><p>Due Date : October 31, 2018 </p>',NULL,1,0,7,'2018-10-30','2018-10-30 15:31:08'),(5,'[Advisar] You have an assignment','You have an assignment related to post - <a href=\"http://35.184.206.37/wp-admin/post.php?post=2734&action=edit&oasiswf=10\" target=\"_blank\">A New Page By Sub</a><p>Sign off date : October 31, 2018 12:14 pm</p>',NULL,6,0,10,'2018-10-31','2018-10-31 12:14:56'),(6,'[Advisar] You have an assignment','You have an assignment related to post - <a href=\"http://35.184.206.37/wp-admin/post.php?post=2736&action=edit&oasiswf=12\" target=\"_blank\">A new Page by Editor</a><p>Sign off date : October 31, 2018 12:19 pm</p>',NULL,6,0,12,'2018-10-31','2018-10-31 12:19:35'),(7,'[Advisar] You have an assignment','You have an assignment related to post - <a href=\"http://35.184.206.37/wp-admin/post.php?post=2736&action=edit&oasiswf=13\" target=\"_blank\">A new Page by Editor</a><p>Sign off date : October 31, 2018 12:20 pm</p>',NULL,1,0,13,'2018-10-31','2018-10-31 12:20:49'),(8,'[Advisar] You have an assignment','You have an assignment related to post - <a href=\"http://35.184.206.37/wp-admin/post.php?post=2734&action=edit&oasiswf=14\" target=\"_blank\">A New Page By Sub</a><p>Sign off date : October 31, 2018 12:21 pm</p>',NULL,1,0,14,'2018-10-31','2018-10-31 12:21:05'),(9,'[Advisar] You have an assignment','You have an assignment related to post - <a href=\"http://35.184.206.37/wp-admin/post.php?post=2739&action=edit&oasiswf=17\" target=\"_blank\">A new page by admin</a><p>Sign off date : October 31, 2018 12:31 pm</p>',NULL,1,0,17,'2018-10-31','2018-10-31 12:31:12'),(10,'[Advisar] You have an assignment','You have an assignment related to post - <a href=\"http://35.184.206.37/wp-admin/post.php?post=2739&action=edit&oasiswf=20\" target=\"_blank\">A new page by admin</a><p>Sign off date : October 31, 2018 12:32 pm</p>',NULL,1,0,20,'2018-10-31','2018-10-31 12:32:25'),(11,'[Advisar] You have an assignment','You have an assignment related to post - <a href=\"http://35.184.206.37/wp-admin/post.php?post=2741&action=edit&oasiswf=22\" target=\"_blank\">Another page by admin</a><p>Sign off date : October 31, 2018 12:33 pm</p>',NULL,1,0,22,'2018-10-31','2018-10-31 12:33:21'),(12,'[Advisar] You have an assignment','You have an assignment related to post - <a href=\"http://35.184.206.37/wp-admin/post.php?post=2741&action=edit&oasiswf=23\" target=\"_blank\">Another page by admin</a><p>Sign off date : October 31, 2018 12:33 pm</p>',NULL,1,0,23,'2018-10-31','2018-10-31 12:33:40'),(13,'[Advisar] You have an assignment','You have an assignment related to post - <a href=\"http://35.184.206.37/wp-admin/post.php?post=2739&action=edit&oasiswf=25\" target=\"_blank\">A new page by admin</a><p>Priority : Normal</p><p>Sign off date : October 31, 2018 7:27 pm</p>',NULL,1,0,25,'2018-10-31','2018-10-31 19:27:43'),(14,'[Advisar] You have an assignment','You have an assignment related to post - <a href=\"http://35.184.206.37/wp-admin/post.php?post=2764&action=edit&oasiswf=29\" target=\"_blank\">A Super New Page</a><p>Priority : Normal</p><p>Sign off date : November 1, 2018 3:31 pm</p>',NULL,1,0,29,'2018-11-01','2018-11-01 15:31:15'),(15,'[Advisar] You have an assignment','You have an assignment related to post - <a href=\"http://35.184.206.37/wp-admin/post.php?post=2764&action=edit&oasiswf=30\" target=\"_blank\">A Super New Page</a><p>Priority : Normal</p><p>Sign off date : November 1, 2018 3:32 pm</p>',NULL,1,0,30,'2018-11-01','2018-11-01 15:32:05');
/*!40000 ALTER TABLE `wp_fc_emails` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;


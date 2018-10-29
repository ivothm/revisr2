
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
DROP TABLE IF EXISTS `wp_revisr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_revisr` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `message` text,
  `event` varchar(42) NOT NULL,
  `user` varchar(60) DEFAULT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `wp_revisr` WRITE;
/*!40000 ALTER TABLE `wp_revisr` DISABLE KEYS */;
INSERT INTO `wp_revisr` VALUES (1,'2018-10-26 14:41:31','Successfully created a new repository.','init','admin'),(2,'2018-10-26 14:41:48','Successfully backed up the database.','backup','admin'),(3,'2018-10-26 14:43:44','Committed <a href=\"http://35.184.206.37/wp-admin/admin.php?page=revisr_view_commit&commit=716693b&success=true\">#716693b</a> to the local repository.','commit','admin'),(4,'2018-10-26 14:56:17','Successfully imported the database. ','import','admin'),(5,'2018-10-26 14:56:30','Successfully imported the database. ','import','admin'),(6,'2018-10-26 14:56:42','Successfully imported the database. ','import','admin'),(7,'2018-10-26 14:56:54','Successfully imported the database. ','import','admin'),(8,'2018-10-26 14:57:06','Successfully imported the database. ','import','admin'),(9,'2018-10-26 14:57:19','Successfully imported the database. ','import','admin'),(10,'2018-10-26 14:57:30','Successfully imported the database. ','import','admin'),(11,'2018-10-26 15:01:41','Successfully pushed 10 commits to origin/test.','push','admin'),(12,'2018-10-26 15:01:51','Successfully backed up the database.','backup','Revisr Bot'),(13,'2018-10-26 15:01:52','Successfully pushed 0 commits to origin/test.','push','Revisr Bot'),(14,'2018-10-26 15:01:52','Successfully backed up the database.','backup','Revisr Bot'),(15,'2018-10-26 15:01:56','Successfully pushed 1 commit to origin/test.','push','Revisr Bot'),(16,'2018-10-29 18:00:23','Successfully imported the database. <a href=\"http://35.184.206.37/wp-admin/admin-post.php?action=process_revert&amp;revert_type=db&amp;db_hash=5f212c5&amp;revisr_revert_nonce=d65131958d\">Undo</a>','import','admin'),(17,'2018-10-29 18:00:38','Successfully imported the database. ','import','admin'),(18,'2018-10-29 18:36:12','Successfully imported the database. <a href=\"http://35.184.206.37/wp-admin/admin-post.php?action=process_revert&amp;revert_type=db&amp;db_hash=2038f03&amp;revisr_revert_nonce=ec5cb2e8ae\">Undo</a>','import','admin'),(19,'2018-10-29 18:37:13','Successfully pushed 2 commits to origin/accept.','push','admin'),(20,'2018-10-29 18:37:24','Successfully backed up the database.','backup','Revisr Bot'),(21,'2018-10-29 18:37:24','Successfully pushed 0 commits to origin/accept.','push','Revisr Bot'),(22,'2018-10-29 18:37:24','Successfully backed up the database.','backup','Revisr Bot'),(23,'2018-10-29 18:37:25','Successfully pushed 0 commits to origin/accept.','push','Revisr Bot'),(24,'2018-10-29 18:44:21','Committed <a href=\"http://35.184.206.37/wp-admin/admin.php?page=revisr_view_commit&commit=05e2caf&success=true\">#05e2caf</a> to the local repository.','commit','admin'),(25,'2018-10-29 18:44:24','Successfully pushed 1 commit to origin/accept.','push','admin'),(26,'2018-10-29 18:44:32','Successfully backed up the database.','backup','Revisr Bot'),(27,'2018-10-29 18:44:36','Successfully pushed 1 commit to origin/accept.','push','Revisr Bot'),(28,'2018-10-29 18:44:45','Successfully backed up the database.','backup','Revisr Bot'),(29,'2018-10-29 18:44:48','Successfully pushed 1 commit to origin/accept.','push','Revisr Bot'),(30,'2018-10-29 18:44:56','Successfully backed up the database.','backup','Revisr Bot'),(31,'2018-10-29 18:44:59','Successfully pushed 1 commit to origin/accept.','push','Revisr Bot'),(32,'2018-10-29 18:45:06','Successfully backed up the database.','backup','Revisr Bot'),(33,'2018-10-29 18:45:12','Successfully pushed 1 commit to origin/accept.','push','Revisr Bot'),(34,'2018-10-29 18:45:22','Successfully backed up the database.','backup','Revisr Bot'),(35,'2018-10-29 18:45:26','Successfully pushed 1 commit to origin/accept.','push','Revisr Bot'),(36,'2018-10-29 18:45:33','Successfully backed up the database.','backup','Revisr Bot'),(37,'2018-10-29 18:45:37','Successfully pushed 1 commit to origin/accept.','push','Revisr Bot'),(38,'2018-10-29 18:45:44','Successfully backed up the database.','backup','Revisr Bot'),(39,'2018-10-29 18:45:47','Successfully pushed 1 commit to origin/accept.','push','Revisr Bot'),(40,'2018-10-29 18:45:54','Successfully backed up the database.','backup','Revisr Bot'),(41,'2018-10-29 18:45:58','Successfully pushed 1 commit to origin/accept.','push','Revisr Bot'),(42,'2018-10-29 18:46:06','Successfully backed up the database.','backup','Revisr Bot'),(43,'2018-10-29 18:46:11','Successfully pushed 1 commit to origin/accept.','push','Revisr Bot'),(44,'2018-10-29 18:46:19','Successfully backed up the database.','backup','Revisr Bot'),(45,'2018-10-29 18:46:23','Successfully pushed 1 commit to origin/accept.','push','Revisr Bot'),(46,'2018-10-29 18:46:29','Successfully backed up the database.','backup','Revisr Bot'),(47,'2018-10-29 18:46:33','Successfully pushed 1 commit to origin/accept.','push','Revisr Bot'),(48,'2018-10-29 18:46:41','Successfully backed up the database.','backup','Revisr Bot'),(49,'2018-10-29 18:46:44','Successfully pushed 1 commit to origin/accept.','push','Revisr Bot'),(50,'2018-10-29 18:46:52','Successfully backed up the database.','backup','Revisr Bot'),(51,'2018-10-29 18:46:55','Successfully pushed 1 commit to origin/accept.','push','Revisr Bot'),(52,'2018-10-29 18:47:02','Successfully backed up the database.','backup','Revisr Bot'),(53,'2018-10-29 18:47:07','Successfully pushed 1 commit to origin/accept.','push','Revisr Bot'),(54,'2018-10-29 18:47:20','Successfully backed up the database.','backup','Revisr Bot'),(55,'2018-10-29 18:47:24','Successfully pushed 1 commit to origin/accept.','push','Revisr Bot'),(56,'2018-10-29 18:47:31','Successfully backed up the database.','backup','Revisr Bot'),(57,'2018-10-29 18:47:35','Successfully pushed 1 commit to origin/accept.','push','Revisr Bot');
/*!40000 ALTER TABLE `wp_revisr` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;


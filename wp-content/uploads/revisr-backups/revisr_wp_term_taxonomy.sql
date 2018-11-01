
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
DROP TABLE IF EXISTS `wp_term_taxonomy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_term_taxonomy` (
  `term_taxonomy_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `term_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `taxonomy` varchar(32) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_taxonomy_id`),
  UNIQUE KEY `term_id_taxonomy` (`term_id`,`taxonomy`),
  KEY `taxonomy` (`taxonomy`)
) ENGINE=InnoDB AUTO_INCREMENT=134 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `wp_term_taxonomy` WRITE;
/*!40000 ALTER TABLE `wp_term_taxonomy` DISABLE KEYS */;
INSERT INTO `wp_term_taxonomy` VALUES (1,1,'category','',0,2),(2,2,'product_type','',0,14),(3,3,'product_type','',0,0),(4,4,'product_type','',0,0),(5,5,'product_type','',0,0),(6,6,'product_visibility','',0,0),(7,7,'product_visibility','',0,0),(8,8,'product_visibility','',0,0),(9,9,'product_visibility','',0,0),(10,10,'product_visibility','',0,0),(11,11,'product_visibility','',0,0),(12,12,'product_visibility','',0,2),(13,13,'product_visibility','',0,6),(14,14,'product_visibility','',0,3),(15,15,'product_cat','',0,0),(16,16,'category','',0,1),(17,17,'category','',0,0),(18,18,'category','',0,1),(19,19,'category','',0,1),(20,20,'category','',0,1),(21,21,'category','',0,0),(22,22,'category','',0,0),(23,23,'category','',0,1),(24,24,'category','',0,2),(25,25,'category','',0,0),(26,26,'category','',0,0),(27,27,'category','',0,1),(28,28,'category','',0,1),(29,29,'category','',0,0),(30,30,'category','',0,0),(31,31,'category','',0,0),(32,32,'category','',0,0),(33,33,'category','',0,0),(34,34,'post_tag','',0,3),(35,35,'post_tag','',0,0),(36,36,'post_tag','',0,0),(37,37,'post_tag','',0,1),(38,38,'post_tag','',0,1),(39,39,'post_tag','',0,4),(40,40,'post_tag','',0,0),(41,41,'post_tag','',0,0),(42,42,'post_tag','',0,2),(43,43,'post_tag','',0,0),(44,44,'post_tag','',0,0),(45,45,'post_tag','',0,1),(46,46,'post_tag','',0,0),(47,47,'post_tag','',0,2),(48,48,'post_tag','',0,1),(49,49,'post_tag','',0,5),(50,50,'post_tag','',0,0),(51,51,'post_tag','',0,0),(52,52,'post_tag','',0,0),(53,53,'post_tag','',0,0),(54,54,'post_tag','',0,2),(55,55,'post_tag','',0,5),(56,56,'post_tag','',0,0),(57,57,'post_tag','',0,0),(58,58,'post_tag','',0,2),(59,59,'post_tag','',0,0),(60,60,'post_tag','',0,0),(61,61,'post_tag','',0,1),(62,62,'post_tag','',0,0),(63,63,'product_tag','',0,0),(64,64,'stm_portfolio_category','',0,2),(65,65,'product_tag','',0,0),(66,66,'stm_service_category','',0,6),(67,67,'stm_service_category','',0,4),(68,68,'stm_testimonials_category','',0,2),(69,69,'stm_testimonials_category','',0,0),(70,70,'product_tag','',0,1),(71,71,'product_tag','',0,1),(72,72,'product_cat','',0,4),(73,73,'stm_works_category','',0,3),(74,74,'product_cat','',0,6),(75,75,'product_tag','',0,2),(76,76,'stm_service_category','',0,4),(77,77,'stm_works_category','',0,1),(78,78,'stm_works_category','',0,1),(79,79,'stm_works_category','',0,1),(80,80,'stm_portfolio_category','',0,3),(81,81,'product_cat','',74,2),(82,82,'product_tag','',0,1),(83,83,'product_tag','',0,1),(84,84,'product_tag','',0,1),(85,85,'product_tag','',0,1),(86,86,'product_cat','',0,3),(87,87,'product_tag','',0,1),(88,88,'stm_service_category','',0,4),(89,89,'product_tag','',0,1),(90,90,'product_tag','',0,0),(91,91,'product_tag','',0,0),(92,92,'product_tag','',0,1),(93,93,'product_cat','',0,2),(94,94,'stm_testimonials_category','',0,0),(95,95,'product_cat','',86,2),(96,96,'stm_service_category','',0,5),(97,97,'stm_works_category','',0,2),(98,98,'stm_portfolio_category','',0,3),(99,99,'product_cat','',74,4),(100,100,'stm_service_category','',0,5),(101,101,'product_tag','',0,1),(102,102,'product_tag','',0,1),(103,103,'stm_works_category','',0,1),(104,104,'product_tag','',0,1),(105,105,'product_tag','',0,1),(106,106,'product_cat','',86,1),(109,109,'nav_menu','',0,7),(110,110,'nav_menu','',0,8),(111,111,'nav_menu','',0,6),(112,112,'nav_menu','',0,20),(113,113,'post_status','New idea proposed.',0,0),(114,114,'post_status','An author has been assigned to the post.',0,0),(115,115,'post_status','The post is ready for publication.',0,0),(116,116,'workflow_state','Document is in the process of being written',0,0),(117,117,'workflow_state','Document is being edited and refined',0,0),(118,118,'workflow_state','Document is pending final review',0,0),(119,119,'workflow_state','Document is in its final form',0,0),(120,120,'post_status','YToyOntzOjExOiJkZXNjcmlwdGlvbiI7czoyOToiUG9zdCBpZGVhIGFzc2lnbmVkIHRvIHdyaXRlci4iO3M6ODoicG9zaXRpb24iO2k6Mjt9',0,0),(121,121,'post_status','YToyOntzOjExOiJkZXNjcmlwdGlvbiI7czo1MzoiUG9zdCBpcyBhIGRyYWZ0OyBub3QgcmVhZHkgZm9yIHJldmlldyBvciBwdWJsaWNhdGlvbi4iO3M6ODoicG9zaXRpb24iO2k6NDt9',0,0),(122,122,'post_status','YToyOntzOjExOiJkZXNjcmlwdGlvbiI7czozOToiUG9zdCBuZWVkcyB0byBiZSByZXZpZXdlZCBieSBhbiBlZGl0b3IuIjtzOjg6InBvc2l0aW9uIjtpOjU7fQ==',0,0),(123,123,'ef_editorial_meta','YTo0OntzOjExOiJkZXNjcmlwdGlvbiI7czozOToiV2hlbiB0aGUgZmlyc3QgZHJhZnQgbmVlZHMgdG8gYmUgcmVhZHkuIjtzOjg6InBvc2l0aW9uIjtpOjI7czo0OiJ0eXBlIjtzOjQ6ImRhdGUiO3M6ODoidmlld2FibGUiO2I6MDt9',0,0),(124,124,'ef_editorial_meta','YTo0OntzOjExOiJkZXNjcmlwdGlvbiI7czoyOToiV2hhdCB0aGUgcG9zdCBuZWVkcyB0byBjb3Zlci4iO3M6ODoicG9zaXRpb24iO2k6MztzOjQ6InR5cGUiO3M6OToicGFyYWdyYXBoIjtzOjg6InZpZXdhYmxlIjtiOjA7fQ==',0,0),(125,125,'ef_editorial_meta','YTo0OntzOjExOiJkZXNjcmlwdGlvbiI7czozNToiQ2hlY2tlZCBpZiB0aGlzIHBvc3QgbmVlZHMgYSBwaG90by4iO3M6ODoicG9zaXRpb24iO2k6NDtzOjQ6InR5cGUiO3M6ODoiY2hlY2tib3giO3M6ODoidmlld2FibGUiO2I6MDt9',0,0),(126,126,'ef_editorial_meta','YTo0OntzOjExOiJkZXNjcmlwdGlvbiI7czozMDoiUmVxdWlyZWQgcG9zdCBsZW5ndGggaW4gd29yZHMuIjtzOjg6InBvc2l0aW9uIjtpOjU7czo0OiJ0eXBlIjtzOjY6Im51bWJlciI7czo4OiJ2aWV3YWJsZSI7YjowO30=',0,0),(127,127,'ef_usergroup','YToyOntzOjExOiJkZXNjcmlwdGlvbiI7czozNzoiTWFraW5nIHN1cmUgdGhlIHF1YWxpdHkgaXMgdG9wLW5vdGNoLiI7czo4OiJ1c2VyX2lkcyI7YToxOntpOjA7aTo2O319',0,0),(128,128,'ef_usergroup','YToyOntzOjExOiJkZXNjcmlwdGlvbiI7czoyOToiQ2FwdHVyaW5nIHRoZSBzdG9yeSB2aXN1YWxseS4iO3M6ODoidXNlcl9pZHMiO2E6MDp7fX0=',0,0),(129,129,'ef_usergroup','YToyOntzOjExOiJkZXNjcmlwdGlvbiI7czozNDoiT3V0IGluIHRoZSBmaWVsZCwgd3JpdGluZyBzdG9yaWVzLiI7czo4OiJ1c2VyX2lkcyI7YToxOntpOjA7aTo3O319',0,0),(130,130,'ef_usergroup','YToyOntzOjExOiJkZXNjcmlwdGlvbiI7czozMzoiUHJvdmlkaW5nIGZlZWRiYWNrIGFuZCBkaXJlY3Rpb24uIjtzOjg6InVzZXJfaWRzIjthOjA6e319',0,0),(131,131,'following_users','',0,1),(132,132,'following_users','',0,1),(133,133,'post_status','What do you think of this?',0,0);
/*!40000 ALTER TABLE `wp_term_taxonomy` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;


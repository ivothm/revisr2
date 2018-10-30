
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
DROP TABLE IF EXISTS `wp_terms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_terms` (
  `term_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `slug` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `term_group` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_id`),
  KEY `slug` (`slug`(191)),
  KEY `name` (`name`(191))
) ENGINE=InnoDB AUTO_INCREMENT=120 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `wp_terms` WRITE;
/*!40000 ALTER TABLE `wp_terms` DISABLE KEYS */;
INSERT INTO `wp_terms` VALUES (1,'Uncategorized','uncategorized',0),(2,'simple','simple',0),(3,'grouped','grouped',0),(4,'variable','variable',0),(5,'external','external',0),(6,'exclude-from-search','exclude-from-search',0),(7,'exclude-from-catalog','exclude-from-catalog',0),(8,'featured','featured',0),(9,'outofstock','outofstock',0),(10,'rated-1','rated-1',0),(11,'rated-2','rated-2',0),(12,'rated-3','rated-3',0),(13,'rated-4','rated-4',0),(14,'rated-5','rated-5',0),(15,'Uncategorized','uncategorized',0),(16,'Business plans','business-plans',0),(17,'Business plans','business-plans-fr',0),(18,'Business plans','business-plans-de',0),(19,'Competitive research','competitive-research-analysis',0),(20,'Economics','economics',0),(21,'Finance &amp; accounting','finance-accounting',0),(22,'Finance &amp; accounting','finance-accounting-fr',0),(23,'Finance &amp; accounting','finance-accounting-de',0),(24,'Franchising','franchising',0),(25,'Funding trends','funding-trends',0),(26,'Funding trends','funding-trends-fr',0),(27,'Funding trends','funding-trends-de',0),(28,'Innovation','innovation',0),(29,'International','international',0),(30,'Non categorizzato','non-categorizzato',0),(31,'Non classifié(e)','non-classifiee',0),(32,'Sin categorizar','sin-categorizar',0),(33,'Unkategorisiert','unkategorisiert',0),(34,'401K','401k',0),(35,'401K','401k-fr',0),(36,'401K','401k-de',0),(37,'advisors','advisors',0),(38,'benchmarks','benchmarks',0),(39,'consulting','consulting',0),(40,'consulting','consulting-fr',0),(41,'consulting','consulting-de',0),(42,'finance','finance',0),(43,'finance','finance-fr',0),(44,'finance','finance-de',0),(45,'ideas','ideas',0),(46,'inventors','inventors',0),(47,'market','market',0),(48,'millenials','millenials',0),(49,'online services','online-services',0),(50,'online services','online-services-fr',0),(51,'online services','online-services-de',0),(52,'performance','performance',0),(53,'personal finance','personal-finance',0),(54,'planning','planning',0),(55,'portfolios','portfolios',0),(56,'portfolios','portfolios-fr',0),(57,'portfolios','portfolios-de',0),(58,'themeforest','themeforest',0),(59,'themeforest','themeforest-fr',0),(60,'themeforest','themeforest-de',0),(61,'tips','tips',0),(62,'wealth','wealth',0),(63,'401K','401k',0),(64,'Advanced Analytics','advanced-analytics',0),(65,'advisors','advisors',0),(66,'advisory','advisory',0),(67,'audit','audit',0),(68,'Background','background',0),(69,'Base','base',0),(70,'benchmarks','benchmarks',0),(71,'Book','book',0),(72,'Books','books',0),(73,'Business Services','business-services',0),(74,'Clothing','clothing',0),(75,'consulting','consulting',0),(76,'consulting','consulting',0),(77,'Consumer Products','consumer-products',0),(78,'Energy &amp; Environment','energy-environment',0),(79,'Financial Services','financial-services',0),(80,'Financial Services','financial-services',0),(81,'Hoodies','hoodies',0),(82,'ideas','ideas',0),(83,'inventors','inventors',0),(84,'market','market',0),(85,'millenials','millenials',0),(86,'Music','music',0),(87,'online services','online-services',0),(88,'operations','operations',0),(89,'performance','performance',0),(90,'personal finance','personal-finance',0),(91,'planning','planning',0),(92,'portfolios','portfolios',0),(93,'Posters','posters',0),(94,'Secondary','secondary',0),(95,'Singles','singles',0),(96,'strategy','strategy',0),(97,'Surface Transport &amp; Logistics','surface-transport-logistics',0),(98,'Surface Transport &amp; Logistics','surface-transport-logistics',0),(99,'T-shirts','t-shirts',0),(100,'tax','tax',0),(101,'Themeforest','themeforest',0),(102,'tips','tips',0),(103,'Travel &amp; Aviation','travel-aviation',0),(104,'wealth','wealth',0),(105,'WordPress','wordpress',0),(106,'Albums','albums',0),(109,'Sidebar Menu 1','sidebar-menu-1',0),(110,'Sidebar Menu 2','sidebar-menu-2',0),(111,'Sidebar Menu 3','sidebar-menu-3',0),(112,'Top Menu','top-menu',0),(113,'Pitch','pitch',0),(114,'With Author','with-author',0),(115,'Ready to Publish','ready-to-publish',0),(116,'In Progress','in-progress',0),(117,'Initial Draft','initial-draft',0),(118,'Under Review','under-review',0),(119,'Final','final',0);
/*!40000 ALTER TABLE `wp_terms` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;


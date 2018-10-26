
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
DROP TABLE IF EXISTS `wpstg0_termmeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wpstg0_termmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `term_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`meta_id`),
  KEY `term_id` (`term_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `wpstg0_termmeta` WRITE;
/*!40000 ALTER TABLE `wpstg0_termmeta` DISABLE KEYS */;
INSERT INTO `wpstg0_termmeta` VALUES (1,72,'order','0'),(2,74,'order','0'),(3,81,'order','0'),(4,86,'order','0'),(5,93,'order','0'),(6,95,'order','0'),(7,99,'order','0'),(8,106,'order','0'),(9,74,'product_count_product_cat','6'),(10,99,'product_count_product_cat','4'),(11,93,'product_count_product_cat','2'),(12,81,'product_count_product_cat','2'),(13,86,'product_count_product_cat','3'),(14,95,'product_count_product_cat','2'),(15,72,'product_count_product_cat','4'),(16,106,'product_count_product_cat','1'),(17,85,'product_count_product_tag','1'),(18,104,'product_count_product_tag','1'),(19,82,'product_count_product_tag','1'),(20,83,'product_count_product_tag','1'),(21,89,'product_count_product_tag','1'),(22,75,'product_count_product_tag','2'),(23,84,'product_count_product_tag','1'),(24,87,'product_count_product_tag','1'),(25,92,'product_count_product_tag','1'),(26,71,'product_count_product_tag','1'),(27,101,'product_count_product_tag','1'),(28,105,'product_count_product_tag','1'),(29,70,'product_count_product_tag','1'),(30,102,'product_count_product_tag','1');
/*!40000 ALTER TABLE `wpstg0_termmeta` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;


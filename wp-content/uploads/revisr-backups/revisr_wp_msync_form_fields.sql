
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
DROP TABLE IF EXISTS `wp_msync_form_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_msync_form_fields` (
  `field_id` smallint(6) NOT NULL AUTO_INCREMENT COMMENT 'field_id',
  `field_instance_id` smallint(6) NOT NULL COMMENT 'id of msync_field_list',
  `form_id` tinyint(4) NOT NULL COMMENT 'Form Id that this field belongs to',
  `label` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL COMMENT 'Label of Field',
  `placeholder` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL COMMENT 'Placeholder',
  `instruction` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL COMMENT 'Instruction',
  `input_type` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL COMMENT 'Input type of the field',
  `is_required` tinyint(1) NOT NULL COMMENT 'Is the field compulsory',
  `validation` varchar(10) COLLATE utf8mb4_unicode_520_ci NOT NULL COMMENT 'Validation Name',
  `default` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL COMMENT 'Default Value',
  `sort_position` tinyint(4) NOT NULL COMMENT 'Sort position',
  `active` tinyint(1) NOT NULL COMMENT 'Is active',
  `label_position` varchar(10) COLLATE utf8mb4_unicode_520_ci NOT NULL COMMENT 'Label Position',
  UNIQUE KEY `field_id` (`field_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci COMMENT='Marketo Form fields';
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `wp_msync_form_fields` WRITE;
/*!40000 ALTER TABLE `wp_msync_form_fields` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_msync_form_fields` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;


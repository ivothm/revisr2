
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
DROP TABLE IF EXISTS `wp_ult_marketo_forms_styles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_ult_marketo_forms_styles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `style_name` varchar(100) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `style` text COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `wp_ult_marketo_forms_styles` WRITE;
/*!40000 ALTER TABLE `wp_ult_marketo_forms_styles` DISABLE KEYS */;
INSERT INTO `wp_ult_marketo_forms_styles` VALUES (-1,'Clean Style','/* Override Layout */\r\n\r\n.umfwrap .mktoForm,\r\n.umfwrap .mktoForm * {\r\n	box-sizing: border-box;\r\n	padding:0px;\r\n}\r\n\r\n.umfwrap .mktoForm .mktoRequiredField .mktoAsterix,\r\n.umfwrap .mktoForm .mktoAsterix,\r\n.umfwrap .mktoForm .mktoClear,\r\n.umfwrap .mktoForm .mktoGutter,\r\n.umfwrap .mktoForm .mktoOffset,\r\n.umfwrap .mktoForm .mktoFormRow.hidden {\r\n	display: none;\r\n}\r\n\r\n.umfwrap .mktoHasWidth {\r\n	width: 100% !important;\r\n}\r\n\r\n.umfwrap .mktoButtonRow,\r\n.umfwrap .mktoForm,\r\n.umfwrap .mktoFormCol,\r\n.umfwrap .mktoField\r\n.umfwrap .mktoFieldWrap {\r\n	width: 100%;\r\n}\r\n\r\n.umfwrap .mktoForm .mktoFieldWrap {\r\n	float: none;\r\n}\r\n\r\n.umfwrap .mktoFormCol {\r\n	margin-bottom: 1em !important;\r\n}\r\n\r\n/* Two Column Rows */\r\n.umfwrap .mktoForm .mktoFormRow {\r\n	display: flex;\r\n}\r\n\r\n.umfwrap .mktoFormCol:nth-child(2){\r\n	margin-left: 10px;\r\n}\r\n\r\n.umfwrap .mktoFormCol:nth-last-child(3) {\r\n	margin-right: 10px;\r\n}\r\n\r\n/* Label */\r\n\r\n.umfwrap .mktoForm label {\r\n	font-family: Helvetica, Arial, sans-serif;\r\n	margin-bottom: 5px;\r\n	padding-top: 0;\r\n	font-size: 1em;\r\n}\r\n\r\n/* Inputs */\r\n\r\n.umfwrap .mktoForm input,\r\n.umfwrap .mktoForm input[type=text],\r\n.umfwrap .mktoForm input[type=url],\r\n.umfwrap .mktoForm input[type=email],\r\n.umfwrap .mktoForm input[type=tel],\r\n.umfwrap .mktoForm input[type=number],\r\n.umfwrap .mktoForm input[type=date],\r\n.umfwrap .mktoForm textarea.mktoField,\r\n.umfwrap .mktoForm select.mktoField {\r\n	font-family: Helvetica, Arial, sans-serif;\r\n	font-size: 1em;\r\n	height: auto;\r\n	padding: 8px 8px;\r\n	color: #333;\r\n	background-color: white;\r\n	border: 1px solid #ccc;\r\n}\r\n\r\n.umfwrap .mktoForm select.mktoField {\r\n	height: 33px;\r\n}\r\n\r\n\r\n/* Submit Button */\r\n\r\n.umfwrap .mktoForm .mktoButtonRow .mktoButtonWrap {\r\n	margin-left: 0px !important;\r\n}\r\n\r\n.umfwrap .mktoForm .mktoButtonRow .mktoButtonWrap button.mktoButton {\r\n	font-family: Helvetica, Arial, sans-serif;\r\n	background-image: none;\r\n	color: #fff;\r\n	background-color: #0A95B7;\r\n	font-size: 1em;\r\n	border: none;\r\n	padding: 11px 24px 9px 24px;\r\n	text-transform: uppercase;\r\n}\r\n.umfwrap .mktoForm .mktoButtonRow .mktoButtonWrap button.mktoButton:hover {\r\n	background-color: #16819e;\r\n}');
/*!40000 ALTER TABLE `wp_ult_marketo_forms_styles` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;


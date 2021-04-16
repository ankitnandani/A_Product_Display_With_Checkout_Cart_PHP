-- MariaDB dump 10.18  Distrib 10.4.17-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: storeDB
-- ------------------------------------------------------
-- Server version	10.4.17-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `store_categories`
--

DROP TABLE IF EXISTS `store_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `store_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(150) DEFAULT NULL,
  `category_desc` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `category_name` (`category_name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store_categories`
--

LOCK TABLES `store_categories` WRITE;
/*!40000 ALTER TABLE `store_categories` DISABLE KEYS */;
INSERT INTO `store_categories` VALUES (1,'COASTER SETS','A beautiful set of 6 coasters available in various colours and shapes'),(2,'MODERN TRAYS','Craftfully handmade trays, available in various shapes,sizes and colours'),(3,'WALL ART','Beautiful abstract work for redefining your corner');
/*!40000 ALTER TABLE `store_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store_item_color`
--

DROP TABLE IF EXISTS `store_item_color`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `store_item_color` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_id` int(11) NOT NULL,
  `item_color` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `store_item_item_color` (`item_id`),
  CONSTRAINT `store_item_item_color` FOREIGN KEY (`item_id`) REFERENCES `store_items` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store_item_color`
--

LOCK TABLES `store_item_color` WRITE;
/*!40000 ALTER TABLE `store_item_color` DISABLE KEYS */;
INSERT INTO `store_item_color` VALUES (1,1,'Aqua'),(2,1,'Cyan'),(3,1,'Bright Yellow'),(4,2,'Aqua'),(5,2,'Cyan'),(6,2,'Bright Yellow'),(7,3,'Aqua'),(8,3,'Cyan'),(9,3,'Bright Yelloe'),(10,4,'Aqua'),(11,4,'Cyan'),(12,5,'Aqua'),(13,5,'Cyan'),(14,6,'Aqua'),(15,6,'Cyan'),(16,7,'RGB Base'),(17,7,'Grey-Scale'),(18,8,'RGB Base'),(19,8,'Grey-Scale');
/*!40000 ALTER TABLE `store_item_color` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store_item_size`
--

DROP TABLE IF EXISTS `store_item_size`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `store_item_size` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_id` int(11) NOT NULL,
  `item_size` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `store_item_item_size` (`item_id`),
  CONSTRAINT `store_item_item_size` FOREIGN KEY (`item_id`) REFERENCES `store_items` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store_item_size`
--

LOCK TABLES `store_item_size` WRITE;
/*!40000 ALTER TABLE `store_item_size` DISABLE KEYS */;
INSERT INTO `store_item_size` VALUES (1,1,'Regular'),(2,1,'Extra-Large'),(3,2,'Regular'),(4,2,'Extra-Large'),(5,3,'Regular'),(6,3,'Portable'),(7,4,'Small'),(8,4,'Medium'),(9,4,'Large'),(10,5,'Small'),(11,5,'Medium'),(12,5,'Large'),(13,6,'Portable'),(14,6,'Regular'),(15,7,'Small (10x20)'),(16,7,'Medium (16x20)'),(17,7,'Large (20x30)'),(18,8,'Small (5x5)'),(19,8,'Portable (3x3)');
/*!40000 ALTER TABLE `store_item_size` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store_items`
--

DROP TABLE IF EXISTS `store_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `store_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL,
  `item_name` varchar(150) DEFAULT NULL,
  `item_price` float(8,2) DEFAULT NULL,
  `item_desc` text DEFAULT NULL,
  `item_image` varchar(50) DEFAULT NULL,
  `item_stock` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `item_category_id` (`category_id`),
  CONSTRAINT `item_category_id` FOREIGN KEY (`category_id`) REFERENCES `store_categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store_items`
--

LOCK TABLES `store_items` WRITE;
/*!40000 ALTER TABLE `store_items` DISABLE KEYS */;
INSERT INTO `store_items` VALUES (1,1,'Square Coaster Set',250.00,'A beautiful set of 6 coasters, square in shape, combined form a rectangle',NULL,10),(2,1,'Round Coaster Set',300.00,'An attractive set of 6 coasters, stackable for storage',NULL,10),(3,1,'Arc Coaster Set',200.00,'A portable set of 4 coasters, combined form a beautiful disk',NULL,10),(4,2,'Raised Border Rectangle Tray',500.00,'An abstract art painted on your regular rectangle tray',NULL,10),(5,2,'Raised Border Round Tray',550.00,'A new design round tray, with your favourite choice of base color abstract art',NULL,10),(6,2,'Portable Tray',300.00,'A camping tray painted with your favourite pattern of abstract',NULL,10),(7,3,'Hanging Wall Art',750.00,'An eye-catching piece of abstract for your corner',NULL,5),(8,3,'Table-Top Wall Art',950.00,'A stunning piece of art, for personalising your work des',NULL,5);
/*!40000 ALTER TABLE `store_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store_shoppertrack`
--

DROP TABLE IF EXISTS `store_shoppertrack`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `store_shoppertrack` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `session_id` varchar(32) DEFAULT NULL,
  `sel_item_id` int(11) DEFAULT NULL,
  `sel_item_qty` smallint(6) DEFAULT NULL,
  `sel_item_size` varchar(25) DEFAULT NULL,
  `sel_item_color` varchar(25) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store_shoppertrack`
--

LOCK TABLES `store_shoppertrack` WRITE;
/*!40000 ALTER TABLE `store_shoppertrack` DISABLE KEYS */;
INSERT INTO `store_shoppertrack` VALUES (2,'f6ov586ktbc6r50692egaog3fa',1,1,'Regular','Aqua','2021-04-12 18:32:30'),(3,'f6ov586ktbc6r50692egaog3fa',2,2,'Extra-Large','Aqua','2021-04-12 18:36:01'),(4,'f6ov586ktbc6r50692egaog3fa',8,1,'Small (5x5)','RGB Base','2021-04-12 19:27:19'),(5,'f6ov586ktbc6r50692egaog3fa',8,1,'Portable (3x3)','Grey-Scale','2021-04-12 19:27:26'),(6,'f6ov586ktbc6r50692egaog3fa',5,1,'Medium','Aqua','2021-04-12 19:28:13'),(7,'f6ov586ktbc6r50692egaog3fa',3,1,'Regular','Bright Yelloe','2021-04-12 19:29:01'),(8,'f6ov586ktbc6r50692egaog3fa',3,1,'Regular','Bright Yelloe','2021-04-12 19:29:14'),(9,'',7,1,'Small (10x20)','RGB Base','2021-04-16 10:31:35'),(10,'0qv56tpc5kdcklsa32k82sn6q4',6,1,'Portable','Aqua','2021-04-16 10:31:40'),(11,'0qv56tpc5kdcklsa32k82sn6q4',8,1,'Small (5x5)','RGB Base','2021-04-16 10:31:47');
/*!40000 ALTER TABLE `store_shoppertrack` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-04-16 15:45:43

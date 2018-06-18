-- MySQL dump 10.15  Distrib 10.0.32-MariaDB, for debian-linux-gnu (i686)
--
-- Host: 127.0.0.1    Database: test3
-- ------------------------------------------------------
-- Server version	10.0.32-MariaDB-0+deb8u1

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

--
-- Table structure for table `options`
--

DROP TABLE IF EXISTS `options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `options` (
  `product_id` int(11) DEFAULT NULL,
  `width` tinyint(4) DEFAULT NULL,
  `height` tinyint(4) DEFAULT NULL,
  `r` varchar(1) DEFAULT NULL,
  `radius` tinyint(4) DEFAULT NULL,
  `load` tinyint(4) DEFAULT NULL,
  `speed` varchar(2) DEFAULT NULL,
  `attr` varchar(10) DEFAULT NULL,
  `runflat` varchar(10) DEFAULT NULL,
  `inner_tire` varchar(5) DEFAULT NULL,
  `season` varchar(50) DEFAULT NULL,
  KEY `options_product_id_fk` (`product_id`),
  CONSTRAINT `options_product_id_fk` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `options`
--

LOCK TABLES `options` WRITE;
/*!40000 ALTER TABLE `options` DISABLE KEYS */;
/*!40000 ALTER TABLE `options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `brand` varchar(50) DEFAULT NULL,
  `model` varchar(100) DEFAULT NULL,
  `correct` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `src`
--

DROP TABLE IF EXISTS `src`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `src` (
  `name` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `src`
--

LOCK TABLES `src` WRITE;
/*!40000 ALTER TABLE `src` DISABLE KEYS */;
INSERT INTO `src` VALUES ('Toyo H08 195/75R16C 107/105S TL'),('Pirelli Winter SnowControl serie 3 175/70R14 84T TL'),('Pirelli Winter SnowControl serie 3 175/70R14 84T TL ?????? (????????????)'),('Toyo H08 195/75R16C 107/105S TL ??????'),('Pirelli Winter SnowControl serie 3 175/70R14 84T TL ?????? (????????????)'),('BFGoodrich Mud-Terrain T/A KM2 235/85R16 120/116Q TL ???????????'),('Pirelli Scorpion Ice & Snow 265/45R21 104H TL ?????? (????????????)'),('Pirelli Winter SottoZero Serie II 245/45R19 102V XL Run Flat * TL ?????? (????????????)'),('Nokian Hakkapeliitta R2 SUV/? 245/70R16 111R XL TL ?????? (????????????)'),('Pirelli Winter Carving Edge 225/50R17 98T XL TL ?????? (??????????)'),('Continental ContiCrossContact LX Sport 255/55R18 105H FR MO TL ???????????'),('BFGoodrich g-Force Stud 205/60R16 96Q XL TL ?????? (??????????)'),('BFGoodrich Winter Slalom KSI 225/60R17 99S TL ?????? (????????????)'),('Continental ContiSportContact 5 245/45R18 96W SSR FR TL ??????'),('Continental ContiSportContact 5 245/45R18 96W SSR FR TL ??????'),('Continental ContiWinterContact TS 830 P 205/60R16 92H SSR * TL ?????? (????????????)'),('Continental ContiWinterContact TS 830 P 225/45R18 95V XL SSR FR * TL ?????? (????????????)'),('Hankook Winter I*Cept Evo2 W320 255/35R19 96V XL TL/TT ?????? (????????????)'),('Mitas Sport Force+ 120/65R17 56W TL ??????');
/*!40000 ALTER TABLE `src` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-06-18 20:41:17

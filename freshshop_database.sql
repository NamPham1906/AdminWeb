CREATE DATABASE  IF NOT EXISTS `freshshopdb` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `freshshopdb`;
-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: localhost    Database: freshshopdb
-- ------------------------------------------------------
-- Server version	5.7.36-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `admins`
--

DROP TABLE IF EXISTS `admins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admins` (
  `ADMIN_ID` char(5) NOT NULL,
  `FIRSTNAME` varchar(50) DEFAULT NULL,
  `LASTNAME` varchar(50) DEFAULT NULL,
  `GENDER` enum('Female','Male') DEFAULT NULL,
  `DOB` date DEFAULT NULL,
  `EMAIL` varchar(50) DEFAULT NULL,
  `IMAGE` varchar(100) DEFAULT NULL,
  `USERNAME` varchar(50) DEFAULT NULL,
  `PASS` varchar(50) DEFAULT NULL,
  `ISDELETED` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`ADMIN_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admins`
--

LOCK TABLES `admins` WRITE;
/*!40000 ALTER TABLE `admins` DISABLE KEYS */;
INSERT INTO `admins` VALUES ('A0001','Maria','Iris','Female','1994-01-01','mariairis@gmail.com','/assets/images/accounts/face1.jpg','user01','pass123',0),('A0002','Colin','Delano','Male','1992-10-22','colindelano@gmail.com','/assets/images/accounts/face2.jpg','user02','pass123',0),('A0003','Bryce','Graham','Male','1988-03-14','brycegraham@gmail.com','/assets/images/accounts/face3.jpg','user03','pass123',0),('A0004','Amie','Charla','Female','1991-09-08','amiecharla@gmail.com','/assets/images/accounts/face4.jpg','user04','pass123',0);
/*!40000 ALTER TABLE `admins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bills`
--

DROP TABLE IF EXISTS `bills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bills` (
  `ORDER_ID` char(5) NOT NULL,
  `DELIVERY_ID` char(5) NOT NULL,
  `PAYMENT` varchar(50) DEFAULT NULL,
  `DISCOUNT` float DEFAULT NULL,
  `COUPON` float DEFAULT NULL,
  `TAX` float DEFAULT NULL,
  `SHIPPING_COST` float DEFAULT NULL,
  `ISDELETED` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`ORDER_ID`,`DELIVERY_ID`),
  KEY `fk_b_d` (`DELIVERY_ID`),
  CONSTRAINT `fk_b_d` FOREIGN KEY (`DELIVERY_ID`) REFERENCES `deliveries` (`DELIVERY_ID`),
  CONSTRAINT `fk_b_o` FOREIGN KEY (`ORDER_ID`) REFERENCES `orders` (`ORDER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bills`
--

LOCK TABLES `bills` WRITE;
/*!40000 ALTER TABLE `bills` DISABLE KEYS */;
INSERT INTO `bills` VALUES ('O0001','D0003','credit card',10,10,4,5,0),('O0002','D0001','cash on delivery',40,10,2,0,0),('O0002','D0002','cash on delivery',10,10,2,0,0),('O0003','D0004','credit card',20,15,2,5,0),('O0004','D0005','cash on delivery',30,0,4,0,0);
/*!40000 ALTER TABLE `bills` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carts`
--

DROP TABLE IF EXISTS `carts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carts` (
  `CLIENT_ID` char(5) NOT NULL,
  `PRODUCT_ID` char(5) NOT NULL,
  `QUANTITY` int(10) DEFAULT NULL,
  `ISDELETED` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`CLIENT_ID`,`PRODUCT_ID`),
  KEY `fk_c_pd` (`PRODUCT_ID`),
  CONSTRAINT `fk_c_cl` FOREIGN KEY (`CLIENT_ID`) REFERENCES `clients` (`CLIENT_ID`),
  CONSTRAINT `fk_c_pd` FOREIGN KEY (`PRODUCT_ID`) REFERENCES `products` (`PRODUCT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carts`
--

LOCK TABLES `carts` WRITE;
/*!40000 ALTER TABLE `carts` DISABLE KEYS */;
INSERT INTO `carts` VALUES ('C0001','P0001',2,0),('C0001','P0002',5,0),('C0003','P0001',5,0),('C0004','P0005',10,0);
/*!40000 ALTER TABLE `carts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clients`
--

DROP TABLE IF EXISTS `clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clients` (
  `CLIENT_ID` varchar(50) NOT NULL,
  `FIRSTNAME` varchar(50) DEFAULT NULL,
  `LASTNAME` varchar(50) DEFAULT NULL,
  `GENDER` enum('Female','Male') DEFAULT NULL,
  `DOB` date DEFAULT NULL,
  `PHONE` varchar(20) DEFAULT NULL,
  `IMAGE` varchar(100) DEFAULT NULL,
  `EMAIL` varchar(50) DEFAULT NULL,
  `PASS` varchar(1000) DEFAULT NULL,
  `ISDELETED` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`CLIENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clients`
--

LOCK TABLES `clients` WRITE;
/*!40000 ALTER TABLE `clients` DISABLE KEYS */;
INSERT INTO `clients` VALUES ('C0001','Diana','Granet','Female','2000-12-12','0909354345','/assets/images/clients/client01.jpg','dianagranet@gmail.com','$2b$10$ynlDhgqvyByZBD7w2E.6s.2JjKvRpaiVWryVJoPJveNPCHH4AG5ri',0),('C0002','Nicole','Quinn','Female','1995-01-06','0898161616','/assets/images/clients/client02.jpg','nicolequinn@gmail.com','$2b$10$ynlDhgqvyByZBD7w2E.6s.2JjKvRpaiVWryVJoPJveNPCHH4AG5ri',0),('C0003','Davis','Lambert','Male','1990-04-24','0797645456','/assets/images/clients/client03.jpg','davislambert@gmail.com','$2b$10$ynlDhgqvyByZBD7w2E.6s.2JjKvRpaiVWryVJoPJveNPCHH4AG5ri',0),('C0004','Cecelia','Brandy','Female','1989-01-18','0808483834','/assets/images/clients/client04.jpg','ceceliabrandy@gmail.com','$2b$10$ynlDhgqvyByZBD7w2E.6s.2JjKvRpaiVWryVJoPJveNPCHH4AG5ri',0);
/*!40000 ALTER TABLE `clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deliveries`
--

DROP TABLE IF EXISTS `deliveries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `deliveries` (
  `DELIVERY_ID` char(5) NOT NULL,
  `ORDER_ID` char(5) DEFAULT NULL,
  `CLIENT_ID` char(5) DEFAULT NULL,
  `DELIVERY_DAY` date DEFAULT NULL,
  `DELIVERY_STATUS` enum('FAILED','SUCCEED') DEFAULT NULL,
  `MANAGER` char(5) DEFAULT NULL,
  `ISDELETED` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`DELIVERY_ID`),
  KEY `fk_d_o` (`ORDER_ID`),
  KEY `fk_d_cl` (`CLIENT_ID`),
  KEY `fk_d_a` (`MANAGER`),
  CONSTRAINT `fk_d_a` FOREIGN KEY (`MANAGER`) REFERENCES `admins` (`ADMIN_ID`),
  CONSTRAINT `fk_d_cl` FOREIGN KEY (`CLIENT_ID`) REFERENCES `clients` (`CLIENT_ID`),
  CONSTRAINT `fk_d_o` FOREIGN KEY (`ORDER_ID`) REFERENCES `orders` (`ORDER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deliveries`
--

LOCK TABLES `deliveries` WRITE;
/*!40000 ALTER TABLE `deliveries` DISABLE KEYS */;
INSERT INTO `deliveries` VALUES ('D0001','O0002','C0001','2021-11-11','FAILED','A0001',0),('D0002','O0002','C0001','2021-11-12','SUCCEED','A0001',0),('D0003','O0001','C0003','2021-11-12','SUCCEED','A0003',0),('D0004','O0003','C0002','2021-11-13','SUCCEED','A0004',0),('D0005','O0004','C0004','2021-11-14','FAILED','A0001',0);
/*!40000 ALTER TABLE `deliveries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `ORDER_ID` char(5) NOT NULL,
  `ORDER_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ADDRESS` varchar(100) DEFAULT NULL,
  `MANAGER` char(5) DEFAULT NULL,
  `CLIENT_ID` char(5) DEFAULT NULL,
  `ISDELETED` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`ORDER_ID`),
  KEY `fk_o_cl` (`CLIENT_ID`),
  KEY `fk_o_a` (`MANAGER`),
  CONSTRAINT `fk_o_a` FOREIGN KEY (`MANAGER`) REFERENCES `admins` (`ADMIN_ID`),
  CONSTRAINT `fk_o_cl` FOREIGN KEY (`CLIENT_ID`) REFERENCES `clients` (`CLIENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES ('O0001','2021-11-10 11:34:09','23-5 Nguyen Van Cu, Phuong 1, Quan 5, Ho Chi Minh','A0004','C0003',0),('O0002','2021-11-10 12:02:31','62 Cong Hoa, Phuong 4, Quan Tan Binh, Ho Chi Minh','A0002','C0001',0),('O0003','2021-11-11 00:10:54','23-5 Nguyen Van Cu, Phuong 1, Quan 5, Ho Chi Minh','A0004','C0002',0),('O0004','2021-11-13 03:27:52','120 Hoang Hoa Tham, Phuong 2, Quan 4, Ho Chi Minh','A0002','C0004',0),('O0005','2021-11-14 07:18:02','62 Cong Hoa, Phuong 4, Quan Tan Binh, Ho Chi Minh','A0001','C0001',0),('O0006','2021-11-14 09:44:27','23-5 Nguyen Van Cu, Phuong 1, Quan 5, Ho Chi Minh','A0003','C0003',0);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders_detail`
--

DROP TABLE IF EXISTS `orders_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders_detail` (
  `ORDER_ID` char(5) NOT NULL,
  `PRODUCT_ID` char(5) NOT NULL,
  `QUANTITY` int(10) DEFAULT NULL,
  `PRICE` float DEFAULT NULL,
  `ISDELETED` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`ORDER_ID`,`PRODUCT_ID`),
  KEY `fk_od_p` (`PRODUCT_ID`),
  CONSTRAINT `fk_od_o` FOREIGN KEY (`ORDER_ID`) REFERENCES `orders` (`ORDER_ID`),
  CONSTRAINT `fk_od_p` FOREIGN KEY (`PRODUCT_ID`) REFERENCES `products` (`PRODUCT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders_detail`
--

LOCK TABLES `orders_detail` WRITE;
/*!40000 ALTER TABLE `orders_detail` DISABLE KEYS */;
INSERT INTO `orders_detail` VALUES ('O0001','P0001',5,40,0),('O0001','P0002',2,70,0),('O0002','P0005',7,30,0),('O0003','P0002',4,70,0),('O0004','P0001',5,40,0),('O0004','P0002',2,70,0),('O0004','P0005',7,30,0),('O0005','P0001',10,40,0),('O0006','P0002',4,70,0);
/*!40000 ALTER TABLE `orders_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders_return`
--

DROP TABLE IF EXISTS `orders_return`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders_return` (
  `ORDER_ID` char(5) NOT NULL,
  `CLIENT_ID` char(5) NOT NULL,
  `REASON` varchar(100) DEFAULT NULL,
  `ISDELETED` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`ORDER_ID`,`CLIENT_ID`),
  KEY `fk_or_cl` (`CLIENT_ID`),
  CONSTRAINT `fk_or_cl` FOREIGN KEY (`CLIENT_ID`) REFERENCES `clients` (`CLIENT_ID`),
  CONSTRAINT `fk_or_o` FOREIGN KEY (`ORDER_ID`) REFERENCES `orders` (`ORDER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders_return`
--

LOCK TABLES `orders_return` WRITE;
/*!40000 ALTER TABLE `orders_return` DISABLE KEYS */;
INSERT INTO `orders_return` VALUES ('O0004','C0004','damaged goods',0),('O0005','C0001','order is canceled',0),('O0006','C0003','order is canceled',0);
/*!40000 ALTER TABLE `orders_return` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `PRODUCT_ID` char(5) NOT NULL,
  `IMAGE` varchar(100) DEFAULT NULL,
  `PRODUCT_NAME` varchar(100) DEFAULT NULL,
  `PRODUCT_TYPE` varchar(50) DEFAULT NULL,
  `STONK` enum('IN STOCK','OUT STOCK') DEFAULT NULL,
  `QUANTITY` int(10) DEFAULT NULL,
  `SOLD` int(10) DEFAULT NULL,
  `PRICE` float DEFAULT NULL,
  `IMPORTDATE` date DEFAULT NULL,
  `IMPORTER` char(5) DEFAULT NULL,
  `DETAIL` varchar(200) DEFAULT NULL,
  `ISDELETED` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`PRODUCT_ID`),
  KEY `fk_p_ad` (`IMPORTER`),
  CONSTRAINT `fk_p_ad` FOREIGN KEY (`IMPORTER`) REFERENCES `admins` (`ADMIN_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES ('P0001','/assets/images/products/PD-01.jpg','CARROT','Root and tuberous','IN STOCK',50,50,40,'2021-11-05','A0001','carrot carrot carrot carrot carrot carrot carrot carrot carrot carrot carrot carrot carrot carrot carrot',0),('P0002','/assets/images/products/PD-02.jpg','POTATO','Root and tuberous','IN STOCK',28,62,70,'2021-11-10','A0001','potato potato potato potato potato potato potato potato potato potato potato potato potato potato potato',0),('P0003','/assets/images/products/PD-03.jpg','APPLE','Fruits','OUT STOCK',0,90,100,'2021-03-31','A0001','apple apple apple apple apple apple apple apple apple apple apple apple apple apple apple',0),('P0004','/assets/images/products/PD-04.jpg','TOMATO','Fruits','IN STOCK',33,67,30,'2021-10-28','A0003','tomato tomato tomato tomato tomato tomato tomato tomato tomato tomato tomato tomato tomato tomato tomato',0),('P0005','/assets/images/products/PD-05.jpg','GREEN ONION 200g','Bulbs','IN STOCK',50,45,40,'2021-11-05','A0003','green onion green onion green onion green onion green onion green onion green onion green onion green onion green onion green onion green onion green onion green onion green onion',0),('P0006','/assets/images/products/PD-06.jpg','GREEN ONION 500g','Bulbs','IN STOCK',25,45,75,'2021-11-05','A0003','green onion green onion green onion green onion green onion green onion green onion green onion green onion green onion green onion green onion green onion green onion green onion',0),('P0007','/assets/images/products/PD-07.jpg','CAULIFLOWER','Vegetables','IN STOCK',20,80,35,'2021-10-28','A0002','cauliflower cauliflower cauliflower cauliflower cauliflower cauliflower cauliflower cauliflower cauliflower cauliflower cauliflower cauliflower cauliflower cauliflower cauliflower',0),('P0008','/assets/images/products/PD-08.jpg','EGGPLANT','Vegetables','IN STOCK',50,50,25,'2021-11-05','A0001','eggplant eggplant eggplant eggplant eggplant eggplant eggplant eggplant eggplant eggplant eggplant eggplant eggplant eggplant eggplant',0),('P0009','/assets/images/products/PD-09.jpg','PUMPKIN','Vegetables','IN STOCK',38,62,35,'2021-11-10','A0001','pumpkin pumpkin pumpkin pumpkin pumpkin pumpkin pumpkin pumpkin pumpkin pumpkin pumpkin pumpkin pumpkin pumpkin pumpkin',0),('P0010','/assets/images/products/PD-10.jpg','PEAS 200g','Podded vegetables','IN STOCK',100,0,20,'2021-11-10','A0001','peas peas peas peas peas peas peas peas peas peas peas peas peas peas peas',0),('P0011','/assets/images/products/PD-11.jpg','PEAS 500g','Podded vegetables','IN STOCK',70,30,40,'2021-11-10','A0001','peas peas peas peas peas peas peas peas peas peas peas peas peas peas peas',0),('P0012','/assets/images/products/PD-12.jpg','LEMON 350g','Fruits','IN STOCK',77,23,25,'2021-10-28','A0003','lemon lemon lemon lemon lemon lemon lemon lemon lemon lemon lemon lemon lemon lemon lemon',0),('P0013','/assets/images/products/PD-13.jpg','GARLIC 150g','Bulbs','IN STOCK',122,38,10,'2021-11-10','A0003','garlic garlic garlic garlic garlic garlic garlic garlic garlic garlic garlic garlic garlic garlic garlic',0),('P0014','/assets/images/products/PD-14.jpg','SHALLOT 150g','Bulbs','IN STOCK',110,40,15,'2021-11-10','A0003','shallot shallot shallot shallot shallot shallot shallot shallot shallot shallot shallot shallot shallot shallot shallot',0),('P0015','/assets/images/products/PD-15.jpg','GREEN BEANS 200g','Podded vegetables','OUT STOCK',0,99,30,'2021-03-31','A0001','green beans green beans green beans green beans green beans green beans green beans green beans green beans green beans green beans green beans green beans green beans green beans',0),('P0016','/assets/images/products/PD-16.jpg','BLACK BEANS 200g','Podded vegetables','IN STOCK',38,62,30,'2021-10-28','A0002','black beans black beans black beans black beans black beans black beans black beans black beans black beans black beans black beans black beans black beans black beans black beans',0),('P0017','/assets/images/products/PD-17.jpg','BANANA','Fruits','IN STOCK',60,50,40,'2021-03-31','A0001','banana banana banana banana banana banana banana banana banana banana banana banana banana banana banana',0),('P0018','/assets/images/products/PD-18.jpg','GREEN BEANS 500g','Podded vegetables','IN STOCK',9,91,70,'2021-03-31','A0001','green beans green beans green beans green beans green beans green beans green beans green beans green beans green beans green beans green beans green beans green beans green beans',0),('P0019','/assets/images/products/PD-19.jpg','BLACK BEANS 500g','Podded vegetables','IN STOCK',16,84,70,'2021-10-28','A0002','black beans black beans black beans black beans black beans black beans black beans black beans black beans black beans black beans black beans black beans black beans black beans',0),('P0020','/assets/images/products/PD-20.jpg','PINEAPPLE','Fruits','IN STOCK',15,75,38,'2021-11-10','A0002','pineapple pineapple pineapple pineapple pineapple pineapple pineapple pineapple pineapple pineapple pineapple pineapple pineapple pineapple pineapple',0),('P0021','/assets/images/products/PD-21.jpg','SOYBEAN 200g','Podded vegetables','IN STOCK',65,25,19,'2021-03-31','A0001','soybean soybean soybean soybean soybean soybean soybean soybean soybean soybean soybean soybean soybean soybean soybean',0),('P0022','/assets/images/products/PD-22.jpg','SOYBEAN 500g','Podded vegetables','IN STOCK',40,50,40,'2021-03-31','A0001','soybean soybean soybean soybean soybean soybean soybean soybean soybean soybean soybean soybean soybean soybean soybean',0),('P0023','/assets/images/products/PD-23.jpg','PEAR','Fruits','IN STOCK',33,77,30,'2021-10-28','A0002','pear pear pear pear pear pear pear pear pear pear pear pear pear pear pear',0),('P0024','/assets/images/products/PD-24.jpg','LIME 200g','Fruits','OUT STOCK',0,110,25,'2021-10-28','A0002','lime lime lime lime lime lime lime lime lime lime lime lime lime lime lime',0),('P0025','/assets/images/products/PD-25.jpg','CABBAGE','Vegetables','IN STOCK',8,92,45,'2021-11-10','A0001','cabbage cabbage cabbage cabbage cabbage cabbage cabbage cabbage cabbage cabbage cabbage cabbage cabbage cabbage cabbage',0),('P0026','/assets/images/products/PD-26.jpg','MUSHROOM 200g','Vegetables','IN STOCK',20,80,50,'2021-11-10','A0001','mushroom mushroom mushroom mushroom mushroom mushroom mushroom mushroom mushroom mushroom mushroom mushroom mushroom mushroom mushroom',0),('P0027','/assets/images/products/PD-27.jpg','MUSHROOM 500g','Vegetables','IN STOCK',30,70,110,'2021-11-10','A0001','mushroom mushroom mushroom mushroom mushroom mushroom mushroom mushroom mushroom mushroom mushroom mushroom mushroom mushroom mushroom',0),('P0028','/assets/images/products/PD-28.jpg','CORN','Vegetables','IN STOCK',56,44,10,'2021-03-31','A0003','corn corn corn corn corn corn corn corn corn corn corn corn corn corn corn',0),('P0029','/assets/images/products/PD-29.jpg','CELERY 200g','Vegetables','IN STOCK',13,107,30,'2021-10-28','A0003','celery celery celery celery celery celery celery celery celery celery celery celery celery celery celery',0),('P0030','/assets/images/products/PD-30.jpg','STRAWBERRY 200g','Fruits','IN STOCK',17,83,60,'2021-11-10','A0003','strawberry strawberry strawberry strawberry strawberry strawberry strawberry strawberry strawberry strawberry strawberry strawberry strawberry strawberry strawberry',0),('P0031','/assets/images/products/PD-31.jpg','CHERRY 200g','Fruits','IN STOCK',28,72,55,'2021-11-10','A0003','cherry cherry cherry cherry cherry cherry cherry cherry cherry cherry cherry cherry cherry cherry cherry',0),('P0032','/assets/images/products/PD-32.jpg','STRAWBERRY 500g','Fruits','IN STOCK',20,60,120,'2021-11-10','A0003','strawberry strawberry strawberry strawberry strawberry strawberry strawberry strawberry strawberry strawberry strawberry strawberry strawberry strawberry strawberry',0),('P0033','/assets/images/products/PD-33.jpg','CHERRY 500g','Fruits','IN STOCK',3,107,120,'2021-11-10','A0003','cherry cherry cherry cherry cherry cherry cherry cherry cherry cherry cherry cherry cherry cherry cherry',0),('P0034','/assets/images/products/PD-34.jpg','BEET','Root and tuberous','IN STOCK',50,40,40,'2021-11-05','A0001','beet beet beet beet beet beet beet beet beet beet beet beet beet beet beet',0),('P0035','/assets/images/products/PD-35.jpg','SWEET POTATO','Root and tuberous','IN STOCK',50,50,35,'2021-11-10','A0001','sweet potato sweet potato sweet potato sweet potato sweet potato sweet potato sweet potato sweet potato sweet potato sweet potato sweet potato sweet potato sweet potato sweet potato sweet potato',0),('P0036','/assets/images/products/PD-36.jpg','GREEN GRAPES','Fruits','IN STOCK',19,91,35,'2021-03-31','A0002','green grapes green grapes green grapes green grapes green grapes green grapes green grapes green grapes green grapes green grapes green grapes green grapes green grapes green grapes green grapes',0),('P0037','/assets/images/products/PD-37.jpg','CHICKPEA 200g','Podded vegetables','IN STOCK',43,57,30,'2021-10-28','A0002','chichpea chichpea chichpea chichpea chichpea chichpea chichpea chichpea chichpea chichpea chichpea chichpea chichpea chichpea chichpea',0),('P0038','/assets/images/products/PD-38.jpg','RED ONION 200g','Bulbs','OUT STOCK',6,94,55,'2021-11-10','A0001','red onion red onion red onion red onion red onion red onion red onion red onion red onion red onion red onion red onion red onion red onion red onion',0),('P0039','/assets/images/products/PD-39.jpg','TARO','Root and tuberous','IN STOCK',12,88,20,'2021-11-10','A0004','taro taro taro taro taro taro taro taro taro taro taro taro taro taro taro',0),('P0040','/assets/images/products/PD-40.jpg','APRICOT','Fruits','IN STOCK',22,78,40,'2021-11-10','A0004','apricot apricot apricot apricot apricot apricot apricot apricot apricot apricot apricot apricot apricot apricot apricot',0),('P0041','/assets/images/products/PD-41.jpg','TURNIPS','Root and tuberous','OUT STOCK',0,101,30,'2021-03-31','A0004','carrot carrot carrot carrot carrot carrot carrot carrot carrot carrot carrot carrot carrot carrot carrot',0),('P0042','/assets/images/products/PD-42.jpg','PAPAYA','Fruits','IN STOCK',33,67,30,'2021-10-28','A0002','papaya papaya papaya papaya papaya papaya papaya papaya papaya papaya papaya papaya papaya papaya papaya',0),('P0043','/assets/images/products/PD-43.jpg','CUCUMBER','Vegetables','IN STOCK',50,50,25,'2021-11-05','A0001','cucumber cucumber cucumber cucumber cucumber cucumber cucumber cucumber cucumber cucumber cucumber cucumber cucumber cucumber cucumber',0),('P0044','/assets/images/products/PD-44.jpg','BELL PEPPER 350g','Vegetables','IN STOCK',28,72,25,'2021-11-10','A0001','bell pepper bell pepper bell pepper bell pepper bell pepper bell pepper bell pepper bell pepper bell pepper bell pepper bell pepper bell pepper bell pepper bell pepper bell pepper',0),('P0045','/assets/images/products/PD-45.jpg','MANGO','Fruits','IN STOCK',50,60,50,'2021-11-05','A0001','mango mango mango mango mango mango mango mango mango mango mango mango mango mango mango',0),('P0046','/assets/images/products/PD-46.jpg','BLUEBERRY 200g','Fruits','IN STOCK',28,62,50,'2021-11-10','A0004','blueberry blueberry blueberry blueberry blueberry blueberry blueberry blueberry blueberry blueberry blueberry blueberry blueberry blueberry blueberry',0),('P0047','/assets/images/products/PD-47.jpg','BLACKBERRY 200g','Fruits','IN STOCK',18,62,60,'2021-11-10','A0003','blackberry blackberry blackberry blackberry blackberry blackberry blackberry blackberry blackberry blackberry blackberry blackberry blackberry blackberry blackberry',0),('P0048','/assets/images/products/PD-48.jpg','BLUEBERRY 500g','Fruits','IN STOCK',10,80,110,'2021-11-10','A0004','blueberry blueberry blueberry blueberry blueberry blueberry blueberry blueberry blueberry blueberry blueberry blueberry blueberry blueberry blueberry',0),('P0049','/assets/images/products/PD-49.jpg','BLACKBERRY 500g','Fruits','IN STOCK',7,103,125,'2021-11-10','A0003','blackberry blackberry blackberry blackberry blackberry blackberry blackberry blackberry blackberry blackberry blackberry blackberry blackberry blackberry blackberry',0),('P0050','/assets/images/products/PD-50.jpg','PEACH','Fruits','IN STOCK',50,55,45,'2021-11-05','A0004','peach peach peach peach peach peach peach peach peach peach peach peach peach peach peach',0),('P0051','/assets/images/products/PD-51.jpg','ORANGE','Fruits','IN STOCK',28,72,30,'2021-11-10','A0001','orange orange orange orange orange orange orange orange orange orange orange orange orange orange orange',0),('P0052','/assets/images/products/PD-52.jpg','HOT PEPPER 100g','Vegetables','IN STOCK',69,21,9,'2021-03-31','A0004','hot pepper hot pepper hot pepper hot pepper hot pepper hot pepper hot pepper hot pepper hot pepper hot pepper hot pepper hot pepper hot pepper hot pepper hot pepper',0),('P0053','/assets/images/products/PD-53.jpg','BROCCOLI','Vegetables','IN STOCK',5,100,40,'2021-03-31','A0004','broccoli broccoli broccoli broccoli broccoli broccoli broccoli broccoli broccoli broccoli broccoli broccoli broccoli broccoli broccoli',0),('P0054','/assets/images/products/PD-54.jpg','WATERMELON','Fruits','IN STOCK',12,88,50,'2021-11-05','A0001','watermelon watermelon watermelon watermelon watermelon watermelon watermelon watermelon watermelon watermelon watermelon watermelon watermelon watermelon watermelon',0);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wishlists`
--

DROP TABLE IF EXISTS `wishlists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wishlists` (
  `CLIENT_ID` char(5) NOT NULL,
  `PRODUCT_ID` char(5) NOT NULL,
  `ISDELETED` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`CLIENT_ID`,`PRODUCT_ID`),
  KEY `fk_w_pd` (`PRODUCT_ID`),
  CONSTRAINT `fk_w_cl` FOREIGN KEY (`CLIENT_ID`) REFERENCES `clients` (`CLIENT_ID`),
  CONSTRAINT `fk_w_pd` FOREIGN KEY (`PRODUCT_ID`) REFERENCES `products` (`PRODUCT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wishlists`
--

LOCK TABLES `wishlists` WRITE;
/*!40000 ALTER TABLE `wishlists` DISABLE KEYS */;
INSERT INTO `wishlists` VALUES ('C0001','P0001',0),('C0002','P0003',0),('C0003','P0005',0),('C0004','P0003',0);
/*!40000 ALTER TABLE `wishlists` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-12-08 14:02:51

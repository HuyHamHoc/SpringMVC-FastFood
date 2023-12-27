-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: fastfood
-- ------------------------------------------------------
-- Server version	8.0.29

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
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Đồ Ăn'),(2,'Nước Uống');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `fullname` varchar(100) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `admin` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'user1@gmail.com','1234','tuan','user2.jpg',_binary '\0'),(7,'admin@gmail.com','123','Võ Gia Huy',NULL,_binary '');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderdetails`
--

DROP TABLE IF EXISTS `orderdetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orderdetails` (
  `id` int NOT NULL AUTO_INCREMENT,
  `orderid` int DEFAULT NULL,
  `productid` int DEFAULT NULL,
  `price` int DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `orderid` (`orderid`),
  KEY `productid` (`productid`),
  CONSTRAINT `orderdetails_ibfk_1` FOREIGN KEY (`orderid`) REFERENCES `orders` (`id`),
  CONSTRAINT `orderdetails_ibfk_2` FOREIGN KEY (`productid`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderdetails`
--

LOCK TABLES `orderdetails` WRITE;
/*!40000 ALTER TABLE `orderdetails` DISABLE KEYS */;
INSERT INTO `orderdetails` VALUES (1,2,2,35,3),(2,2,3,32,4),(3,2,4,25,4),(4,3,3,32,4),(5,3,4,25,4),(6,3,5,10,3),(7,4,3,32,2),(8,4,4,25,3),(9,5,3,32,3),(10,5,4,25,3),(11,6,3,32,2),(12,6,4,25,3),(13,7,3,32,2),(14,7,4,25,2),(15,8,3,32,2),(16,9,3,32,4);
/*!40000 ALTER TABLE `orderdetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `customerid` int DEFAULT NULL,
  `orderdate` datetime DEFAULT NULL,
  `address` varchar(500) DEFAULT NULL,
  `amount` int DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (2,1,'2023-12-11 00:00:00','QN',333,'good'),(3,1,'2023-12-11 00:00:00','QN',258,'deliveryman shoppe food nhớ giao nhanhh'),(4,1,'2023-12-11 00:00:00','USA',139,'okk'),(5,1,'2023-12-11 00:00:00','QN',171,'ok'),(6,1,'2023-12-11 00:00:00','QN',139,'ok'),(7,1,'2023-12-11 00:00:00','USA',114,'ok'),(8,1,'2023-12-11 00:00:00','USA',64,'ok'),(9,1,'2023-12-17 00:00:00','QN',128,'');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `price` varchar(100) DEFAULT NULL,
  `image` varchar(250) DEFAULT NULL,
  `categoryid` int DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Hambuger Gà','30','hbg1.jpg',1,10,'Hamburger gà không chỉ là một bữa ăn ngon miệng mà còn là một trải nghiệm vị giác đặc sắc. Với bánh hamburger giòn tan kết hợp với thịt gà mềm mại và thơm ngon, mỗi miếng ăn là một hành trình đầy hứng khởi qua các tầng vị. Hương vị đặc trưng của thịt gà được tăng cường bởi sự hòa quyện của các nguyên liệu khác như rau sống tươi ngon và sốt gia vị độc đáo'),(2,'Hambuger Bò','35','hbg2.jpg',1,10,'Hamburger bò không chỉ là một bữa ăn ngon miệng mà còn là một trải nghiệm vị giác đặc sắc. Với bánh hamburger giòn tan kết hợp với thịt bò mềm mại và thơm ngon, mỗi miếng ăn là một hành trình đầy hứng khởi qua các tầng vị. Hương vị đặc trưng của thịt bò được tăng cường bởi sự hòa quyện của các nguyên liệu khác như rau sống tươi ngon và sốt gia vị độc đáo'),(3,'Hambuger Tôm','32','hbg3.jpg',1,10,'Hamburger tôm không chỉ là một bữa ăn ngon miệng mà còn là một trải nghiệm vị giác đặc sắc. Với bánh hamburger giòn tan kết hợp với tôm mềm mại và thơm ngon, mỗi miếng ăn là một hành trình đầy hứng khởi qua các tầng vị. Hương vị đặc trưng của tôm được tăng cường bởi sự hòa quyện của các nguyên liệu khác như rau sống tươi ngon và sốt gia vị độc đáo'),(4,'Hambuger Trứng','25','hbg3.jpg',1,10,'Hamburger trứng không chỉ là một bữa ăn ngon miệng mà còn là một trải nghiệm vị giác đặc sắc. Với bánh hamburger giòn tan kết hợp với thơm ngon, mỗi miếng ăn là một hành trình đầy hứng khởi qua các tầng vị. Hương vị đặc trưng của trứng được tăng cường bởi sự hòa quyện của các nguyên liệu khác như rau sống tươi ngon và sốt gia vị độc đáo'),(5,'Khoai Tây Chiên Thường','10','kt1.jpg',1,10,'Sự hấp dẫn của khoai tây chiên đến từ sự kết hợp tuyệt vời giữa bề ngoài giòn tan và bên trong mềm mại. Lớp vỏ giòn bên ngoài được nướng chín vàng óng, tạo nên một bảo vệ hoàn hảo cho phần nhân bên trong.'),(6,'Khoai Tây Chiên Lắc Phô Mai','12','kt2.jpg',1,10,'Sự hấp dẫn của khoai tây chiên lắc phô mai đến từ sự kết hợp tuyệt vời giữa bề ngoài giòn tan và bên trong mềm mại. Lớp vỏ giòn bên ngoài được nướng chín vàng óng, tạo nên một bảo vệ hoàn hảo cho phần nhân bên trong.'),(7,'Khoai Tây Chiên Lắc Xí Muội','12','kt3.jpg',1,10,'Sự hấp dẫn của khoai tây chiên lắc xí muội đến từ sự kết hợp tuyệt vời giữa bề ngoài giòn tan và bên trong mềm mại. Lớp vỏ giòn bên ngoài được nướng chín vàng óng, tạo nên một bảo vệ hoàn hảo cho phần nhân bên trong.'),(8,'Khoai Tây Lốc Xoáy','15','kt4.jpg',1,10,'\nKhoai tây lốc xoáy không chỉ là một món ăn, mà là một trải nghiệm hấp dẫn đầy thú vị cho các tín đồ ẩm thực. Điểm độc đáo của hình dáng xoắn ốc tạo nên một màn trình diễn mắt mẽ, hấp dẫn mọi ánh nhìn và tạo ấn tượng mạnh mẽ ngay từ cái nhìn đầu tiên.'),(9,'Gà Rán','15','gr1.jpg',1,10,'\nBên ngoài, lớp vỏ giòn của gà rán tạo ra âm thanh giòn rụt khi bạn cắn vào, mở ra một thế giới hương vị hấp dẫn. Thịt gà bên trong được nướng chín đều, giữ lại độ ẩm và mềm mại, đồng thời thấm đượm hương vị của các loại gia vị sử dụng trong quá trình chuẩn bị.'),(10,'Gà Rán Phô Mai','20','gr2.jpg',1,10,'\nKhi bạn cắn vào chiếc gà rán phô mai, âm thanh giòn rụt của vỏ phô mai kết hợp với hương vị thơm ngon của thịt gà tạo nên một sự hấp dẫn khó cưỡng. Lớp phô mai tan chảy, béo ngậy, bao bọc quanh thịt gà, làm tăng thêm độ ngon và độ hấp dẫn của món ăn.'),(11,'Gà Rán Sốt Cay','20','gr3.jpg',1,10,'\n\nGà rán sốt cay là một sự kết hợp đầy bất ngờ giữa vị giòn tan và hương vị cay nồng, tạo nên một trải nghiệm ẩm thực đậm đà và hấp dẫn. Chiếc gà giòn mềm, được bao phủ bởi lớp vỏ cay nồng và hấp dẫn, đưa bạn vào một cuộc phiêu lưu vị giác không ngờ.'),(12,'Gà Rán Viên','18','gr4.jpg',1,10,'\n\nKhi bạn cắn vào gà viên, sự kết hợp tinh tế giữa vỏ giòn và nhân gà thơm ngon tạo nên một cảm giác đặc biệt. Hương vị đậm đà và thơm ngon của thịt gà được giữ nguyên và nâng lên bởi quá trình nướng chín tận cùng của vỏ. Sự hấp dẫn của gà viên đến từ sự cân bằng giữa vị giòn, ngon và hương vị tuyệt vời.'),(13,'Coca','10','coca.jpg',2,10,'<span style=\"color: rgb(0, 0, 0); font-family: -apple-system, system-ui, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, Oxygen-Sans, Ubuntu, Cantarell, &quot;Helvetica Neue&quot;, sans-serif; font-size: 18px; background-color: rgb(247, 247, 247);\">Coca-Cola truyền thống có vị ngọt đặc trưng, kết hợp giữa hương vị ngọt nhẹ của đường và chua thanh, tạo cảm giác sảng khoái. Hương vị này đậm đà, mượt mà, mang lại trải nghiệm thưởng thức đặc biệt</span><br>'),(14,'Monster','20','mst.jpg',2,10,'<span style=\"color: rgb(0, 0, 0); font-family: -apple-system, system-ui, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, Oxygen-Sans, Ubuntu, Cantarell, &quot;Helvetica Neue&quot;, sans-serif; font-size: 18px; background-color: rgb(247, 247, 247);\">Monster là một loại nước uống năng lượng phổ biến. Với hương vị đậm đà, ngọt và có cảm giác lạnh nhẹ, Monster mang lại năng lượng và sự tỉnh táo.&nbsp;</span><br>'),(15,'Pepsi','10','pepsi.jpg',2,10,'<span style=\"color: rgb(0, 0, 0); font-family: -apple-system, system-ui, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, Oxygen-Sans, Ubuntu, Cantarell, &quot;Helvetica Neue&quot;, sans-serif; font-size: 18px; background-color: rgb(247, 247, 247);\">Pepsi là một loại nước giải khát có ga, hương vị ngọt và sảng khoái. Với hương vị đặc trưng, Pepsi mang đến cảm giác mát lạnh và thỏa mãn.&nbsp;</span><br>'),(16,'Lavie','5','nl.jpg',2,10,'<span style=\"color: rgb(0, 0, 0); font-family: -apple-system, system-ui, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, Oxygen-Sans, Ubuntu, Cantarell, &quot;Helvetica Neue&quot;, sans-serif; font-size: 18px; background-color: rgb(247, 247, 247);\">Lavie là một thương hiệu nước khoáng tự nhiên phổ biến. Với nguồn gốc từ các suối và nguồn nước trong lành, Lavie mang đến nước uống tinh khiết, sạch và giàu khoáng chất.</span><br>'),(17,'Sting','15','st.jpg',2,10,'<span style=\"color: rgb(0, 0, 0); font-family: -apple-system, system-ui, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, Oxygen-Sans, Ubuntu, Cantarell, &quot;Helvetica Neue&quot;, sans-serif; font-size: 18px; background-color: rgb(247, 247, 247);\">Sting là một loại nước giải khát có ga và chứa caffeine cao. Với vị ngọt, chua và hương vị đặc trưng, Sting mang đến cảm giác tỉnh táo, năng động và sảng khoái.&nbsp;</span><br>'),(18,'7 up','10','nuoc7up.jpg',2,NULL,'<span style=\"color: rgb(0, 0, 0); font-family: -apple-system, system-ui, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, Oxygen-Sans, Ubuntu, Cantarell, &quot;Helvetica Neue&quot;, sans-serif; font-size: 18px; background-color: rgb(247, 247, 247);\">7UP là một loại nước giải khát không có cafein, có vị chua nhẹ và hương cam tự nhiên. Với hương vị tươi mát và sảng khoái, 7UP là lựa chọn thích hợp cho những người muốn thưởng thức nước uống nhẹ nhàng và không có ga.</span><br>');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-12-27 22:35:03

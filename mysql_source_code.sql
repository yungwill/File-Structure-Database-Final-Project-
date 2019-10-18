-- MySQL dump 10.14  Distrib 5.5.60-MariaDB, for Linux (x86_64)
--
-- Host: mariadb    Database: cs332a8
-- ------------------------------------------------------
-- Server version	5.5.60-MariaDB

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
-- Table structure for table `Course`
--

DROP TABLE IF EXISTS `Course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Course` (
  `C_Number` varchar(5) NOT NULL,
  `C_Title` varchar(20) DEFAULT NULL,
  `C_Textbook` varchar(50) DEFAULT NULL,
  `C_Units` int(3) DEFAULT NULL,
  `D_Number` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`C_Number`),
  KEY `D_Number` (`D_Number`),
  CONSTRAINT `Course_ibfk_1` FOREIGN KEY (`D_Number`) REFERENCES `Department` (`D_Number`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Course`
--

LOCK TABLES `Course` WRITE;
/*!40000 ALTER TABLE `Course` DISABLE KEYS */;
INSERT INTO `Course` VALUES ('21543','Advance Circuit Tech','Fundamentals of Electricity',3,'214567'),('32154','Communication Studie','Introduction to Communication',3,'314567'),('43215','Java Programming','Head First Java',3,'14567'),('54321','Intro to Data Struct','Data Structure and Algorithims',3,'14567');
/*!40000 ALTER TABLE `Course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Department`
--

DROP TABLE IF EXISTS `Department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Department` (
  `D_Number` varchar(10) NOT NULL DEFAULT '',
  `D_Name` varchar(50) DEFAULT NULL,
  `D_TelephoneNum` varchar(16) DEFAULT NULL,
  `Office_Location` varchar(20) DEFAULT NULL,
  `P_SSN` int(9) DEFAULT NULL,
  PRIMARY KEY (`D_Number`),
  KEY `P_SSN` (`P_SSN`),
  CONSTRAINT `Department_ibfk_1` FOREIGN KEY (`P_SSN`) REFERENCES `Professor` (`SSN`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Department`
--

LOCK TABLES `Department` WRITE;
/*!40000 ALTER TABLE `Department` DISABLE KEYS */;
INSERT INTO `Department` VALUES ('114567','Computer Science','9498795541','CS Room 506',234567891),('224567','Sports Communications','5234894424','C Room 402',123456789),('334567','MATH','6106674232','MATH 311',345678912);
/*!40000 ALTER TABLE `Department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Enrollment_Records`
--

DROP TABLE IF EXISTS `Enrollment_Records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Enrollment_Records` (
  `C_num` varchar(5) NOT NULL,
  `Sec_num` varchar(2) NOT NULL,
  `s_cwid` varchar(9) NOT NULL,
  `Grade` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`C_num`,`Sec_num`,`s_cwid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Enrollment_Records`
--

LOCK TABLES `Enrollment_Records` WRITE;
/*!40000 ALTER TABLE `Enrollment_Records` DISABLE KEYS */;
INSERT INTO `Enrollment_Records` VALUES ('21543','01','123456789','B+'),('21543','01','234567891','B'),('21543','01','345678912','B'),('21543','01','456789123','A-'),('21543','01','567891234','B+'),('21543','01','678912345','A-'),('21543','01','789123456','C-'),('21543','01','891234567','B'),('32154','01','123456789','B+'),('32154','01','234567891','A-'),('32154','01','345678912','C+'),('32154','01','456789123','B'),('32154','01','567891234','B+'),('32154','01','678912345','B-'),('32154','01','789123456','C+'),('32154','01','891234567','B'),('43215','01','222333444','B+'),('43215','02','111222333','A-'),('54321','01','111222333','B-'),('54321','02','222333444','B');
/*!40000 ALTER TABLE `Enrollment_Records` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Minor`
--

DROP TABLE IF EXISTS `Minor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Minor` (
  `d_num` varchar(10) NOT NULL,
  `cwid` varchar(9) NOT NULL,
  PRIMARY KEY (`d_num`,`cwid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Minor`
--

LOCK TABLES `Minor` WRITE;
/*!40000 ALTER TABLE `Minor` DISABLE KEYS */;
/*!40000 ALTER TABLE `Minor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Prequisite`
--

DROP TABLE IF EXISTS `Prequisite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Prequisite` (
  `C_Number` varchar(10) NOT NULL DEFAULT '',
  `Pre_CNumber` varchar(10) NOT NULL DEFAULT '',
  PRIMARY KEY (`C_Number`,`Pre_CNumber`),
  CONSTRAINT `Prequisite_ibfk_1` FOREIGN KEY (`C_Number`) REFERENCES `Course` (`C_Number`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Prequisite`
--

LOCK TABLES `Prequisite` WRITE;
/*!40000 ALTER TABLE `Prequisite` DISABLE KEYS */;
/*!40000 ALTER TABLE `Prequisite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Professor`
--

DROP TABLE IF EXISTS `Professor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Professor` (
  `SSN` int(9) NOT NULL DEFAULT '0',
  `P_Name` varchar(50) DEFAULT NULL,
  `P_Street` varchar(30) DEFAULT NULL,
  `P_City` varchar(30) DEFAULT NULL,
  `P_State` varchar(2) DEFAULT NULL,
  `P_Zipcode` int(5) DEFAULT NULL,
  `P_Area` int(3) DEFAULT NULL,
  `P_Phone` int(7) DEFAULT NULL,
  `P_Sex` char(1) DEFAULT NULL,
  `P_Title` varchar(5) DEFAULT NULL,
  `P_Salary` varchar(6) DEFAULT NULL,
  PRIMARY KEY (`SSN`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Professor`
--

LOCK TABLES `Professor` WRITE;
/*!40000 ALTER TABLE `Professor` DISABLE KEYS */;
INSERT INTO `Professor` VALUES (123456789,'Angela Harris','22nd Street','Westminister','CA',92684,714,4568741,'F','Mrs.','94,562'),(234567891,'Shwan Miller','4457 Dohney St.','Fullerton','CA',98745,987,8874567,'M','DR.','97,547'),(345678912,'Edward Pedro','3667 Meyer St.','Los Angeles','CA',32467,310,3214568,'M','Mr.','88,000');
/*!40000 ALTER TABLE `Professor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Section`
--

DROP TABLE IF EXISTS `Section`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Section` (
  `Sec_C_Num` varchar(5) NOT NULL DEFAULT '',
  `Sec_Number` varchar(2) NOT NULL DEFAULT '',
  `Classroom` varchar(8) DEFAULT NULL,
  `Meeting_Days` varchar(10) DEFAULT NULL,
  `Begin_Time` varchar(6) DEFAULT NULL,
  `End_Time` varchar(6) DEFAULT NULL,
  `Num_Seats` int(3) DEFAULT NULL,
  `P_SSN` int(9) DEFAULT NULL,
  PRIMARY KEY (`Sec_C_Num`,`Sec_Number`),
  KEY `P_SSN` (`P_SSN`),
  CONSTRAINT `Section_ibfk_1` FOREIGN KEY (`P_SSN`) REFERENCES `Professor` (`SSN`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Section`
--

LOCK TABLES `Section` WRITE;
/*!40000 ALTER TABLE `Section` DISABLE KEYS */;
INSERT INTO `Section` VALUES ('21543','01','SC 102','Tu/Th','8:00AM','9:30AM',48,123456789),('21543','02','SC 102','Mon/Wed','8:00AM','9:30AM',48,123456789),('32154','01','CS 204','Mon/Wed','1:00PM','2:30PM',55,234567891),('32154','02','CS 204','Tu/Th','1:00PM','2:230P',55,234567891),('43215','01','MATH 338','Mon/Wed','3:00PM','4:30PM',45,345678912),('43215','02','MATH 338','Mon/Wed','5:00PM','6:30PM',45,345678912);
/*!40000 ALTER TABLE `Section` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Student`
--

DROP TABLE IF EXISTS `Student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Student` (
  `cwid` varchar(9) NOT NULL,
  `fname` varchar(50) DEFAULT NULL,
  `lname` varchar(50) DEFAULT NULL,
  `address_st` varchar(50) DEFAULT NULL,
  `address_city` varchar(50) DEFAULT NULL,
  `address_state` varchar(50) DEFAULT NULL,
  `address_zip` int(6) DEFAULT NULL,
  `phone_area` int(3) DEFAULT NULL,
  `phone_num` int(7) DEFAULT NULL,
  `degree` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`cwid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Student`
--

LOCK TABLES `Student` WRITE;
/*!40000 ALTER TABLE `Student` DISABLE KEYS */;
INSERT INTO `Student` VALUES ('111222333','Sam','Smith','13 Grenada','Aliso Viejo','CA',92656,949,7771234,'Masters in Chemistry'),('123456789','Josh','Smith','3520 Summerfield Drive','Irvine','CA',92602,949,1234567,'Masters in Biology'),('222333444','Adam','Dahl','2510 Main St.','Costa Mesa','CA',92630,714,5554567,'Bachelor\'s in Computer Science'),('234567891','Derrick','William','2450 Linden Blvd.','Santa Ana','CA',92701,714,2345671,'Bachelor\'s in Communication'),('345678912','John','Lipinski','1323 Hummingbird Lane','San Deigo','CA',91932,619,5312065,'Bachelor\'s in Computer Science'),('456789123','Caira','Kerr','3375 Michelle Drive','Fullerton','CA',90621,714,3456712,'Masters in Electrical Engineering'),('567891234','Natalia','Lima','2745 Hoover Drive','Laguna Niguel','CA',92607,949,4567123,'Bachelor\'s in Physics'),('678912345','Alex','Salari','3648 Niguel Ave.','Aliso Viejo','CA',92656,714,5671234,'Masters in Computer Science'),('789123456','Sasha','Swift','3336 Sunset Blvd.','Hollywood','CA',90068,888,6712345,'Bachelor\'s in Health Science'),('891234567','Jose','Pedro','2558 Camino Rioja','Laguna Niguel','CA',92677,949,5587497,'Bachelor\'s in Business Administration');
/*!40000 ALTER TABLE `Student` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-12-19  0:55:37

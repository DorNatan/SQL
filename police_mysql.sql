DROP DATABASE IF EXISTS `police`;
CREATE DATABASE `police` CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `police`;

DROP TABLE IF EXISTS `ranks`;
CREATE TABLE `ranks` (
  `Rank_id` char(2) NOT NULL,
  `Rank_Title` varchar(50) DEFAULT NULL,
  `Base_Salary` int DEFAULT NULL,
  PRIMARY KEY (`Rank_id`)
) ;

INSERT INTO `ranks`
VALUES
 ('TR','Trooper',42500)
,('DT','Detective',70000)
,('SG','Sargent',85000)
,('CM','Commissioner',100000);

DROP TABLE IF EXISTS `stations`;
CREATE TABLE `stations` (
  `Station_id` int NOT NULL,
  `City` varchar(50) DEFAULT NULL,
  `manpower` int DEFAULT NULL,
  PRIMARY KEY (`Station_id`)
) ;

INSERT INTO `stations`
VALUES
 (99,'New York',120)
,(12,'New York',260)
,(50,'Zootropolis',356)
,(49,'Los Angeles',700);

DROP TABLE IF EXISTS `cops`;
CREATE TABLE `cops` (
  `Badge` char(7) NOT NULL,
  `Full_Name` varchar(50) DEFAULT NULL,
  `Station_id` int DEFAULT NULL,
  `Rank_id` char(2) DEFAULT NULL,
  `Superior_id` char(7) DEFAULT NULL,
  PRIMARY KEY (`Badge`),
  UNIQUE KEY `Badge_UNIQUE` (`Badge`)
  ) ;
  
  INSERT INTO `cops`
  VALUES
   ('A-11111','Agent K',12,NULL,NULL)
  ,('B-22222','Agent J',12,NULL,'A-11111')
  ,('C-33333','Marge Gunderson',37,'CM',NULL)
  ,('D-44444','Judy Hopps',50,'TR','C-33333')
  ,('E-55555','Jack Peralta',99,'DT','C-33333');
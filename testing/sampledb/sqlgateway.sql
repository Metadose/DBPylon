/*
SQLyog Community Edition- MySQL GUI v6.07
Host - 5.1.30-community : Database - sqlgateway
*********************************************************************
Server version : 5.1.30-community
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

create database if not exists `sqlgateway`;

USE `sqlgateway`;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

/*Table structure for table `auditlogs` */

DROP TABLE IF EXISTS `auditlogs`;

CREATE TABLE `auditlogs` (
  `ID` int(16) NOT NULL AUTO_INCREMENT,
  `Action` varchar(16) NOT NULL,
  `User` varchar(16) NOT NULL,
  `TargetTable` varchar(16) NOT NULL,
  `TargetID` int(16) NOT NULL,
  `Log` text NOT NULL,
  `DateTime` datetime NOT NULL,
  `Deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=63 DEFAULT CHARSET=latin1;

/*Data for the table `auditlogs` */

/*Table structure for table `credentials` */

DROP TABLE IF EXISTS `credentials`;

CREATE TABLE `credentials` (
  `ID` int(16) NOT NULL AUTO_INCREMENT,
  `Username` varchar(16) NOT NULL,
  `Password` text NOT NULL,
  `Deleted` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Data for the table `credentials` */

insert  into `credentials`(`ID`,`Username`,`Password`,`Deleted`) values (1,'Test1','Test1',0);
insert  into `credentials`(`ID`,`Username`,`Password`,`Deleted`) values (2,'Test2','Test2',0);
insert  into `credentials`(`ID`,`Username`,`Password`,`Deleted`) values (3,'Coffee','Java',0);
insert  into `credentials`(`ID`,`Username`,`Password`,`Deleted`) values (4,'Coffee','Latte',0);
insert  into `credentials`(`ID`,`Username`,`Password`,`Deleted`) values (5,'Coffee','Latte',0);
insert  into `credentials`(`ID`,`Username`,`Password`,`Deleted`) values (6,'Coffee','Latte',0);

/*Table structure for table `sales` */

DROP TABLE IF EXISTS `sales`;

CREATE TABLE `sales` (
  `ID` int(16) NOT NULL AUTO_INCREMENT,
  `SaleID` bigint(32) NOT NULL,
  `Name` varchar(128) NOT NULL,
  `BranchID` int(16) NOT NULL,
  `ItemID` int(16) NOT NULL,
  `Price` float NOT NULL,
  `Quantity` int(16) NOT NULL,
  `DateTime` datetime NOT NULL,
  `Details` text NOT NULL,
  `Deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;

/*Data for the table `sales` */

insert  into `sales`(`ID`,`SaleID`,`Name`,`BranchID`,`ItemID`,`Price`,`Quantity`,`DateTime`,`Details`,`Deleted`) values (1,12123455,'Pencil',23,1,10,2,'2014-12-01 15:10:25','',0);
insert  into `sales`(`ID`,`SaleID`,`Name`,`BranchID`,`ItemID`,`Price`,`Quantity`,`DateTime`,`Details`,`Deleted`) values (2,12123455,'Pencil',23,2,50,3,'2014-12-01 15:10:37','',1);
insert  into `sales`(`ID`,`SaleID`,`Name`,`BranchID`,`ItemID`,`Price`,`Quantity`,`DateTime`,`Details`,`Deleted`) values (3,12123455,'Pencil',23,3,2000,4,'2014-12-01 15:10:43','',1);
insert  into `sales`(`ID`,`SaleID`,`Name`,`BranchID`,`ItemID`,`Price`,`Quantity`,`DateTime`,`Details`,`Deleted`) values (4,1417418021031,'Pencil',23,1,10,2,'2014-12-01 15:13:41','null',0);
insert  into `sales`(`ID`,`SaleID`,`Name`,`BranchID`,`ItemID`,`Price`,`Quantity`,`DateTime`,`Details`,`Deleted`) values (5,1417418021031,'Pencil',23,2,50,20,'2014-12-01 15:13:41','null',0);
insert  into `sales`(`ID`,`SaleID`,`Name`,`BranchID`,`ItemID`,`Price`,`Quantity`,`DateTime`,`Details`,`Deleted`) values (6,1417418021031,'Pencil',23,3,2000,5,'2014-12-01 15:13:41','null',0);
insert  into `sales`(`ID`,`SaleID`,`Name`,`BranchID`,`ItemID`,`Price`,`Quantity`,`DateTime`,`Details`,`Deleted`) values (7,1417418219750,'Pencil',23,1,10,6,'2014-12-01 15:16:59','null',0);
insert  into `sales`(`ID`,`SaleID`,`Name`,`BranchID`,`ItemID`,`Price`,`Quantity`,`DateTime`,`Details`,`Deleted`) values (9,1417419495515,'Pencil',23,1,10,10,'2014-12-01 15:38:15','null',0);
insert  into `sales`(`ID`,`SaleID`,`Name`,`BranchID`,`ItemID`,`Price`,`Quantity`,`DateTime`,`Details`,`Deleted`) values (10,1417419495515,'Pencil',23,2,50,23,'2014-12-01 15:38:15','null',0);
insert  into `sales`(`ID`,`SaleID`,`Name`,`BranchID`,`ItemID`,`Price`,`Quantity`,`DateTime`,`Details`,`Deleted`) values (11,1417419495515,'Pencil',23,3,2000,23,'2014-12-01 15:38:15','null',0);
insert  into `sales`(`ID`,`SaleID`,`Name`,`BranchID`,`ItemID`,`Price`,`Quantity`,`DateTime`,`Details`,`Deleted`) values (13,1417419948031,'Pencil',23,2,50,12,'2014-12-01 15:45:48','null',0);
insert  into `sales`(`ID`,`SaleID`,`Name`,`BranchID`,`ItemID`,`Price`,`Quantity`,`DateTime`,`Details`,`Deleted`) values (14,1417426289015,'Pencil',23,1,10,1,'2014-12-01 17:31:29','null',0);
insert  into `sales`(`ID`,`SaleID`,`Name`,`BranchID`,`ItemID`,`Price`,`Quantity`,`DateTime`,`Details`,`Deleted`) values (16,1417495614703,'Pencil',23,2,50,12,'2014-12-02 12:46:54','null',1);
insert  into `sales`(`ID`,`SaleID`,`Name`,`BranchID`,`ItemID`,`Price`,`Quantity`,`DateTime`,`Details`,`Deleted`) values (17,1417496094093,'Pencil',23,3,2000,23,'2014-12-02 12:54:54','null',1);
insert  into `sales`(`ID`,`SaleID`,`Name`,`BranchID`,`ItemID`,`Price`,`Quantity`,`DateTime`,`Details`,`Deleted`) values (19,1417759599546,'Pencil',23,2,90,146,'2014-12-05 14:06:39','null',0);
insert  into `sales`(`ID`,`SaleID`,`Name`,`BranchID`,`ItemID`,`Price`,`Quantity`,`DateTime`,`Details`,`Deleted`) values (21,1418004957062,'Pencil',23,2,90,54,'2014-12-08 10:15:57','null',0);
insert  into `sales`(`ID`,`SaleID`,`Name`,`BranchID`,`ItemID`,`Price`,`Quantity`,`DateTime`,`Details`,`Deleted`) values (22,1418012970015,'Pencil',23,4,200,23,'2014-12-08 12:29:30','null',0);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;

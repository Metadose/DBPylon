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

insert  into `auditlogs`(`ID`,`Action`,`User`,`TargetTable`,`TargetID`,`Log`,`DateTime`,`Deleted`) values (1,'','','',0,'Action: Update\nID: 0\nTable: items\n\nquantityAvailable: 200\nquantitySold: 0\nprice: 10.0\nbarcode: 1234\nlimited: true\ndescription: Used to write\nname: Pencil\nbranchID: 1\ndetails: \ndeleted: false\n','2014-12-01 15:06:58',0);
insert  into `auditlogs`(`ID`,`Action`,`User`,`TargetTable`,`TargetID`,`Log`,`DateTime`,`Deleted`) values (2,'','','',0,'Action: Update\nID: 0\nTable: items\n\nquantityAvailable: 500\nquantitySold: 0\nprice: 50.0\nbarcode: 456\nlimited: true\ndescription: Used mostly everywhere\nname: Paper\nbranchID: 2\ndetails: \ndeleted: false\n','2014-12-01 15:07:52',0);
insert  into `auditlogs`(`ID`,`Action`,`User`,`TargetTable`,`TargetID`,`Log`,`DateTime`,`Deleted`) values (3,'','','',0,'Action: Update\nID: 0\nTable: items\n\nquantityAvailable: 80\nquantitySold: 0\nprice: 2000.0\nbarcode: 789\nlimited: true\ndescription: Eye protectors\nname: Eyeglasses\nbranchID: 1\ndetails: \ndeleted: false\n','2014-12-01 15:08:49',0);
insert  into `auditlogs`(`ID`,`Action`,`User`,`TargetTable`,`TargetID`,`Log`,`DateTime`,`Deleted`) values (4,'','','',0,'Action: Update\nID: 2\nTable: items\n\nquantityAvailable: 500\nquantitySold: 0\nprice: 50.0\nbarcode: 456\nlimited: true\ndescription: Used mostly everywhere\nname: Paper\nbranchID: 2\ndetails: \ndeleted: false\n\nquantityAvailable: 500\nquantitySold: 0\nprice: 50.0\nbarcode: 456\nlimited: true\ndescription: Used mostly everywhere\nname: Paper\nbranchID: 1\ndetails: \ndeleted: false\n','2014-12-01 15:08:57',0);
insert  into `auditlogs`(`ID`,`Action`,`User`,`TargetTable`,`TargetID`,`Log`,`DateTime`,`Deleted`) values (5,'','','',0,'Action: Update\nID: 1\nTable: items\n\nquantityAvailable: 200\nquantitySold: 0\nprice: 10.0\nbarcode: 1234\nlimited: true\ndescription: Used to write\nname: Pencil\nbranchID: 1\ndetails: \ndeleted: false\n\nquantityAvailable: 200\nquantitySold: 0\nprice: 10.0\nbarcode: 123\nlimited: true\ndescription: Used to write\nname: Pencil\nbranchID: 1\ndetails: \ndeleted: false\n','2014-12-01 15:09:15',0);
insert  into `auditlogs`(`ID`,`Action`,`User`,`TargetTable`,`TargetID`,`Log`,`DateTime`,`Deleted`) values (6,'','','',0,'Action: Add New Sales\nID: 0\nTable: \n\nitemID: 1\nprice: 10.0\nquantity: 2\ndateTime: 2014-12-01 15:10:25.531\nname: Pencil\nbranchID: 1\ndetails: null\ndeleted: false\n','2014-12-01 15:10:25',0);
insert  into `auditlogs`(`ID`,`Action`,`User`,`TargetTable`,`TargetID`,`Log`,`DateTime`,`Deleted`) values (7,'','','',0,'Action: Add New Sales\nID: 0\nTable: \n\nitemID: 2\nprice: 50.0\nquantity: 3\ndateTime: 2014-12-01 15:10:37.281\nname: Paper\nbranchID: 1\ndetails: null\ndeleted: false\n','2014-12-01 15:10:37',0);
insert  into `auditlogs`(`ID`,`Action`,`User`,`TargetTable`,`TargetID`,`Log`,`DateTime`,`Deleted`) values (8,'','','',0,'Action: Add New Sales\nID: 0\nTable: \n\nitemID: 3\nprice: 2000.0\nquantity: 4\ndateTime: 2014-12-01 15:10:43.265\nname: Eyeglasses\nbranchID: 1\ndetails: null\ndeleted: false\n','2014-12-01 15:10:43',0);
insert  into `auditlogs`(`ID`,`Action`,`User`,`TargetTable`,`TargetID`,`Log`,`DateTime`,`Deleted`) values (9,'','','',0,'Action: Add New Sales\nID: 0\nTable: \n\nsaleID: 1417418021031\nitemID: 1\nprice: 10.0\nquantity: 2\ndateTime: 2014-12-01 15:13:41.078\nname: Pencil\nbranchID: 1\ndetails: null\ndeleted: false\n','2014-12-01 15:13:41',0);
insert  into `auditlogs`(`ID`,`Action`,`User`,`TargetTable`,`TargetID`,`Log`,`DateTime`,`Deleted`) values (10,'','','',0,'Action: Add New Sales\nID: 0\nTable: \n\nsaleID: 1417418021031\nitemID: 2\nprice: 50.0\nquantity: 20\ndateTime: 2014-12-01 15:13:41.171\nname: Paper\nbranchID: 1\ndetails: null\ndeleted: false\n','2014-12-01 15:13:41',0);
insert  into `auditlogs`(`ID`,`Action`,`User`,`TargetTable`,`TargetID`,`Log`,`DateTime`,`Deleted`) values (11,'','','',0,'Action: Add New Sales\nID: 0\nTable: \n\nsaleID: 1417418021031\nitemID: 3\nprice: 2000.0\nquantity: 5\ndateTime: 2014-12-01 15:13:41.281\nname: Eyeglasses\nbranchID: 1\ndetails: null\ndeleted: false\n','2014-12-01 15:13:41',0);
insert  into `auditlogs`(`ID`,`Action`,`User`,`TargetTable`,`TargetID`,`Log`,`DateTime`,`Deleted`) values (12,'','','',0,'Action: Add New Sales\nID: 0\nTable: \n\nsaleID: 1417418219750\nitemID: 1\nprice: 10.0\nquantity: 6\ndateTime: 2014-12-01 15:16:59.781\nname: Pencil\nbranchID: 1\ndetails: null\ndeleted: false\n','2014-12-01 15:16:59',0);
insert  into `auditlogs`(`ID`,`Action`,`User`,`TargetTable`,`TargetID`,`Log`,`DateTime`,`Deleted`) values (13,'','','',0,'Action: Add New Sales\nID: 0\nTable: \n\nsaleID: 1417419427625\nitemID: 1\nprice: 10.0\nquantity: 12\ndateTime: 2014-12-01 15:37:18.812\nname: Pencil\nbranchID: 1\ndetails: null\ndeleted: false\n','2014-12-01 15:37:18',0);
insert  into `auditlogs`(`ID`,`Action`,`User`,`TargetTable`,`TargetID`,`Log`,`DateTime`,`Deleted`) values (14,'','','',0,'Action: Add New Sales\nID: 0\nTable: \n\nsaleID: 1417419495515\nitemID: 1\nprice: 10.0\nquantity: 10\ndateTime: 2014-12-01 15:38:15.562\nname: Pencil\nbranchID: 1\ndetails: null\ndeleted: false\n','2014-12-01 15:38:15',0);
insert  into `auditlogs`(`ID`,`Action`,`User`,`TargetTable`,`TargetID`,`Log`,`DateTime`,`Deleted`) values (15,'','','',0,'Action: Add New Sales\nID: 0\nTable: \n\nsaleID: 1417419495515\nitemID: 2\nprice: 50.0\nquantity: 23\ndateTime: 2014-12-01 15:38:15.656\nname: Paper\nbranchID: 1\ndetails: null\ndeleted: false\n','2014-12-01 15:38:15',0);
insert  into `auditlogs`(`ID`,`Action`,`User`,`TargetTable`,`TargetID`,`Log`,`DateTime`,`Deleted`) values (16,'','','',0,'Action: Add New Sales\nID: 0\nTable: \n\nsaleID: 1417419495515\nitemID: 3\nprice: 2000.0\nquantity: 23\ndateTime: 2014-12-01 15:38:15.734\nname: Eyeglasses\nbranchID: 1\ndetails: null\ndeleted: false\n','2014-12-01 15:38:15',0);
insert  into `auditlogs`(`ID`,`Action`,`User`,`TargetTable`,`TargetID`,`Log`,`DateTime`,`Deleted`) values (17,'','','',0,'Action: Delete\nID: 0\nTable: sales\n\nsaleID: 12123455\nitemID: 3\nprice: 2000.0\nquantity: 4\ndateTime: 2014-12-01 15:10:43.0\nname: Eyeglasses\nbranchID: 1\ndetails: \ndeleted: false\n','2014-12-01 15:39:31',0);
insert  into `auditlogs`(`ID`,`Action`,`User`,`TargetTable`,`TargetID`,`Log`,`DateTime`,`Deleted`) values (18,'','','',0,'Action: Delete\nID: 0\nTable: sales\n\nsaleID: 12123455\nitemID: 2\nprice: 50.0\nquantity: 3\ndateTime: 2014-12-01 15:10:37.0\nname: Paper\nbranchID: 1\ndetails: \ndeleted: false\n','2014-12-01 15:39:40',0);
insert  into `auditlogs`(`ID`,`Action`,`User`,`TargetTable`,`TargetID`,`Log`,`DateTime`,`Deleted`) values (19,'','','',0,'Action: Add New Sales\nID: 0\nTable: \n\nsaleID: 1417419915453\nitemID: 1\nprice: 10.0\nquantity: 12\ndateTime: 2014-12-01 15:45:18.921\nname: Pencil\nbranchID: 1\ndetails: null\ndeleted: false\n','2014-12-01 15:45:20',0);
insert  into `auditlogs`(`ID`,`Action`,`User`,`TargetTable`,`TargetID`,`Log`,`DateTime`,`Deleted`) values (20,'','','',0,'Action: Add New Sales\nID: 0\nTable: \n\nsaleID: 1417419948031\nitemID: 2\nprice: 50.0\nquantity: 12\ndateTime: 2014-12-01 15:45:48.062\nname: Paper\nbranchID: 1\ndetails: null\ndeleted: false\n','2014-12-01 15:45:48',0);
insert  into `auditlogs`(`ID`,`Action`,`User`,`TargetTable`,`TargetID`,`Log`,`DateTime`,`Deleted`) values (21,'','','',0,'Action: Add New Sales\nID: 0\nTable: \n\nsaleID: 1417426289015\nitemID: 1\nprice: 10.0\nquantity: 1\ndateTime: 2014-12-01 17:31:29.062\nname: Pencil\nbranchID: 1\ndetails: null\ndeleted: false\n','2014-12-01 17:31:29',0);
insert  into `auditlogs`(`ID`,`Action`,`User`,`TargetTable`,`TargetID`,`Log`,`DateTime`,`Deleted`) values (22,'','','',0,'Action: Add New Sales\nID: 0\nTable: \n\nsaleID: 1417495237859\nitemID: 1\nprice: 10.0\nquantity: 23\ndateTime: 2014-12-02 12:40:37.921\nname: Pencil\nbranchID: 1\ndetails: null\ndeleted: false\n','2014-12-02 12:40:37',0);
insert  into `auditlogs`(`ID`,`Action`,`User`,`TargetTable`,`TargetID`,`Log`,`DateTime`,`Deleted`) values (23,'','','',0,'Action: Update\nID: 3\nTable: items\n\nquantityAvailable: 48\nquantitySold: 32\nprice: 2000.0\nbarcode: 789\nlimited: true\ndescription: Eye protectors\nname: Eyeglasses\nbranchID: 1\ndetails: \ndeleted: false\n\nquantityAvailable: 120\nquantitySold: 32\nprice: 2000.0\nbarcode: 789\nlimited: true\ndescription: Eye protectors\nname: Eyeglasses\nbranchID: 1\ndetails: \ndeleted: false\n','2014-12-02 12:40:54',1);
insert  into `auditlogs`(`ID`,`Action`,`User`,`TargetTable`,`TargetID`,`Log`,`DateTime`,`Deleted`) values (24,'','','',0,'Action: Delete\nID: 0\nTable: auditlogs\n\nlog: Action: Update\nID: 3\nTable: items\n\nquantityAvailable: 48\nquantitySold: 32\nprice: 2000.0\nbarcode: 789\nlimited: true\ndescription: Eye protectors\nname: Eyeglasses\nbranchID: 1\ndetails: \ndeleted: false\n\nquantityAvailable: 120\nquantitySold: 32\nprice: 2000.0\nbarcode: 789\nlimited: true\ndescription: Eye protectors\nname: Eyeglasses\nbranchID: 1\ndetails: \ndeleted: false\n\ndateTime: 2014-12-02 12:40:54.0\ndeleted: false\n','2014-12-02 12:41:05',1);
insert  into `auditlogs`(`ID`,`Action`,`User`,`TargetTable`,`TargetID`,`Log`,`DateTime`,`Deleted`) values (25,'','','',0,'Action: Add New Sales\nID: 0\nTable: \n\nsaleID: 1417495614703\nitemID: 2\nprice: 50.0\nquantity: 12\ndateTime: 2014-12-02 12:46:54.75\nname: Paper\nbranchID: 1\ndetails: null\ndeleted: false\n','2014-12-02 12:46:54',0);
insert  into `auditlogs`(`ID`,`Action`,`User`,`TargetTable`,`TargetID`,`Log`,`DateTime`,`Deleted`) values (26,'','','',0,'Action: Add New Sales\nID: 0\nTable: \n\nsaleID: 1417496094093\nitemID: 3\nprice: 2000.0\nquantity: 23\ndateTime: 2014-12-02 12:54:54.125\nname: Eyeglasses\nbranchID: 1\ndetails: null\ndeleted: false\n','2014-12-02 12:54:54',0);
insert  into `auditlogs`(`ID`,`Action`,`User`,`TargetTable`,`TargetID`,`Log`,`DateTime`,`Deleted`) values (27,'','','',0,'Action: Delete\nID: 0\nTable: auditlogs\n\nlog: Action: Delete\nID: 0\nTable: auditlogs\n\nlog: Action: Update\nID: 3\nTable: items\n\nquantityAvailable: 48\nquantitySold: 32\nprice: 2000.0\nbarcode: 789\nlimited: true\ndescription: Eye protectors\nname: Eyeglasses\nbranchID: 1\ndetails: \ndeleted: false\n\nquantityAvailable: 120\nquantitySold: 32\nprice: 2000.0\nbarcode: 789\nlimited: true\ndescription: Eye protectors\nname: Eyeglasses\nbranchID: 1\ndetails: \ndeleted: false\n\ndateTime: 2014-12-02 12:40:54.0\ndeleted: false\n\ndateTime: 2014-12-02 12:41:05.0\ndeleted: false\n','2014-12-02 12:55:10',0);
insert  into `auditlogs`(`ID`,`Action`,`User`,`TargetTable`,`TargetID`,`Log`,`DateTime`,`Deleted`) values (28,'','','',0,'Action: Delete\nID: 0\nTable: sales\n\nsaleID: 1417419427625\nitemID: 1\nprice: 10.0\nquantity: 12\ndateTime: 2014-12-01 15:37:18.0\nname: Pencil\nbranchID: 1\ndetails: null\ndeleted: false\n','2014-12-03 11:15:12',0);
insert  into `auditlogs`(`ID`,`Action`,`User`,`TargetTable`,`TargetID`,`Log`,`DateTime`,`Deleted`) values (29,'','','',0,'Action: Add New Sales\nID: 0\nTable: \n\nsaleID: 1417589393671\nitemID: 1\nprice: 10.0\nquantity: 12\ndateTime: 2014-12-03 14:49:53.734\nname: Pencil\nbranchID: 1\ndetails: null\ndeleted: false\n','2014-12-03 14:49:53',0);
insert  into `auditlogs`(`ID`,`Action`,`User`,`TargetTable`,`TargetID`,`Log`,`DateTime`,`Deleted`) values (30,'','','',0,'Action: Update\nID: 0\nTable: expenses\n\nitemID: 0\nprice: 2400.5\nquantity: 0\ndateTime: 2014-06-11 23:02:30.0\nname: Electricity June\nbranchID: 1\ndetails: \ndeleted: false\n','2014-12-03 14:50:42',0);
insert  into `auditlogs`(`ID`,`Action`,`User`,`TargetTable`,`TargetID`,`Log`,`DateTime`,`Deleted`) values (31,'','','',0,'Action: Delete\nID: 0\nTable: sales\n\nsaleID: 1417589393671\nitemID: 1\nprice: 10.0\nquantity: 12\ndateTime: 2014-12-03 14:49:53.0\nname: Pencil\nbranchID: 1\ndetails: null\ndeleted: false\n','2014-12-05 10:25:41',0);
insert  into `auditlogs`(`ID`,`Action`,`User`,`TargetTable`,`TargetID`,`Log`,`DateTime`,`Deleted`) values (32,'','','',0,'Action: Delete\nID: 0\nTable: sales\n\nsaleID: 1417495237859\nitemID: 1\nprice: 10.0\nquantity: 23\ndateTime: 2014-12-02 12:40:37.0\nname: Pencil\nbranchID: 1\ndetails: null\ndeleted: false\n','2014-12-05 10:26:56',0);
insert  into `auditlogs`(`ID`,`Action`,`User`,`TargetTable`,`TargetID`,`Log`,`DateTime`,`Deleted`) values (33,'Update','(3) Jane Doe','items',3,'Action: Update\nID: 3\nTable: items\n\nquantityAvailable: 973\nquantitySold: 55\nprice: 2235.0\nbarcode: 789\nlimited: true\ndescription: Eye protectors\nname: Eyeglasses\nbranchID: 1\ndetails: \ndeleted: false\n\nquantityAvailable: 973\nquantitySold: 55\nprice: 223.0\nbarcode: 789\nlimited: true\ndescription: Eye protectors\nname: Eyeglasses\nbranchID: 1\ndetails: \ndeleted: false\n','2014-12-05 11:26:05',0);
insert  into `auditlogs`(`ID`,`Action`,`User`,`TargetTable`,`TargetID`,`Log`,`DateTime`,`Deleted`) values (34,'Update','(3) Jane Doe','items',3,'Action: Update\nID: 3\nTable: items\n\nquantityAvailable: 973\nquantitySold: 55\nprice: 2235.0\nbarcode: 789\nlimited: true\ndescription: Eye protectors\nname: Eyeglasses\nbranchID: 1\ndetails: \ndeleted: false\n\nquantityAvailable: 973\nquantitySold: 55\nprice: 2000.0\nbarcode: 789\nlimited: true\ndescription: Eye protectors\nname: Eyeglasses\nbranchID: 1\ndetails: \ndeleted: false\n','2014-12-05 11:29:17',0);
insert  into `auditlogs`(`ID`,`Action`,`User`,`TargetTable`,`TargetID`,`Log`,`DateTime`,`Deleted`) values (35,'null','null','null',0,'Action: Delete\nID: 0\nTable: sales\n\nsaleID: 1417496094093\nitemID: 3\nprice: 2000.0\nquantity: 23\ndateTime: 2014-12-02 12:54:54.0\nname: Eyeglasses\nbranchID: 1\ndetails: null\ndeleted: false\n','2014-12-05 11:32:42',0);
insert  into `auditlogs`(`ID`,`Action`,`User`,`TargetTable`,`TargetID`,`Log`,`DateTime`,`Deleted`) values (36,'Update','(3) Jane Doe','items',3,'Action: Update\nID: 3\nTable: items\n\nquantityAvailable: 973\nquantitySold: 55\nprice: 2000.0\nbarcode: 789\nlimited: true\ndescription: Eye protectors\nname: Eyeglasses\nbranchID: 1\ndetails: \ndeleted: false\n\nquantityAvailable: 973\nquantitySold: 55\nprice: 2523.0\nbarcode: 789\nlimited: true\ndescription: Eye protectors\nname: Eyeglasses\nbranchID: 1\ndetails: \ndeleted: false\n','2014-12-05 11:37:44',0);
insert  into `auditlogs`(`ID`,`Action`,`User`,`TargetTable`,`TargetID`,`Log`,`DateTime`,`Deleted`) values (37,'Delete','(3) Jane Doe','sales',16,'Action: Delete\nID: 0\nTable: sales\n\nsaleID: 1417495614703\nitemID: 2\nprice: 50.0\nquantity: 12\ndateTime: 2014-12-02 12:46:54.0\nname: Paper\nbranchID: 1\ndetails: null\ndeleted: false\n','2014-12-05 11:37:58',0);
insert  into `auditlogs`(`ID`,`Action`,`User`,`TargetTable`,`TargetID`,`Log`,`DateTime`,`Deleted`) values (38,'Update','(3) Jane Doe','items',2,'Action: Update\nID: 2\nTable: items\n\nquantityAvailable: 500\nquantitySold: 70\nprice: 50.0\nbarcode: 456\nlimited: true\ndescription: Used mostly everywhere\nname: Paper\nbranchID: 1\ndetails: \ndeleted: false\n\nquantityAvailable: 500\nquantitySold: 70\nprice: 25.0\nbarcode: 456\nlimited: true\ndescription: Used mostly everywhere\nname: Paper\nbranchID: 1\ndetails: \ndeleted: false\n','2014-12-05 11:38:19',0);
insert  into `auditlogs`(`ID`,`Action`,`User`,`TargetTable`,`TargetID`,`Log`,`DateTime`,`Deleted`) values (39,'Update','(3) Jane Doe','items',2,'Action: Update\nID: 2\nTable: items\n\nquantityAvailable: 500\nquantitySold: 70\nprice: 25.0\nbarcode: 456\nlimited: true\ndescription: Used mostly everywhere\nname: Paper\nbranchID: 1\ndetails: \ndeleted: false\n\nquantityAvailable: 500\nquantitySold: 70\nprice: 90.0\nbarcode: 456\nlimited: true\ndescription: Used mostly everywhere\nname: Paper\nbranchID: 1\ndetails: \ndeleted: false\n','2014-12-05 11:39:14',0);
insert  into `auditlogs`(`ID`,`Action`,`User`,`TargetTable`,`TargetID`,`Log`,`DateTime`,`Deleted`) values (40,'Update','(4) Carl Ramos','branches',0,'Action: Update\nID: 0\nTable: branches\n\nname: Main Branch\nbranchID: 1\ndetails: \ndeleted: false\n','2014-12-05 11:43:40',0);
insert  into `auditlogs`(`ID`,`Action`,`User`,`TargetTable`,`TargetID`,`Log`,`DateTime`,`Deleted`) values (41,'Add New Sales','(3) Jane Doe','sales',0,'Action: Add New Sales\nID: 0\nTable: sales\n\nsaleID: 1417759599546\nitemID: 2\nprice: 90.0\nquantity: 146\ndateTime: 2014-12-05 14:06:39.578\nname: Paper\nbranchID: 1\ndetails: null\ndeleted: false\n','2014-12-05 14:06:39',0);
insert  into `auditlogs`(`ID`,`Action`,`User`,`TargetTable`,`TargetID`,`Log`,`DateTime`,`Deleted`) values (42,'Update','(3) Jane Doe','items',3,'Action: Update\nID: 3\nTable: items\n\nquantityAvailable: 973\nquantitySold: 55\nprice: 2523.0\nbarcode: 789\nlimited: true\ndescription: Eye protectors\nname: Eyeglasses\nbranchID: 1\ndetails: \ndeleted: false\n\nquantityAvailable: 973\nquantitySold: 55\nprice: 2523.0\nbarcode: 789\nlimited: true\ndescription: Eye protectors\nname: Eyeglasses\nbranchID: 1\ndetails: \ndeleted: false\n','2014-12-05 15:57:08',0);
insert  into `auditlogs`(`ID`,`Action`,`User`,`TargetTable`,`TargetID`,`Log`,`DateTime`,`Deleted`) values (43,'Update','(3) Jane Doe','items',3,'Action: Update\nID: 3\nTable: items\n\nquantityAvailable: 973\nquantitySold: 55\nprice: 2523.0\nbarcode: 789\nlimited: true\ndescription: Eye protectors\nname: Eyeglasses\nbranchID: 1\ndetails: \ndeleted: false\n\nquantityAvailable: 973\nquantitySold: 55\nprice: 2523.0\nbarcode: 789\nlimited: false\ndescription: Eye protectors\nname: Eyeglasses\nbranchID: 1\ndetails: \ndeleted: false\n','2014-12-05 16:01:23',0);
insert  into `auditlogs`(`ID`,`Action`,`User`,`TargetTable`,`TargetID`,`Log`,`DateTime`,`Deleted`) values (44,'Add New Sales','(3) Jane Doe','sales',0,'Action: Add New Sales\nID: 0\nTable: sales\n\nsaleID: 1418004957062\nitemID: 1\nprice: 10.0\nquantity: 23\ndateTime: 2014-12-08 10:15:57.078\nname: Pencil\nbranchID: 1\ndetails: null\ndeleted: false\n','2014-12-08 10:15:57',0);
insert  into `auditlogs`(`ID`,`Action`,`User`,`TargetTable`,`TargetID`,`Log`,`DateTime`,`Deleted`) values (45,'Add New Sales','(3) Jane Doe','sales',0,'Action: Add New Sales\nID: 0\nTable: sales\n\nsaleID: 1418004957062\nitemID: 2\nprice: 90.0\nquantity: 54\ndateTime: 2014-12-08 10:15:57.203\nname: Paper\nbranchID: 1\ndetails: null\ndeleted: false\n','2014-12-08 10:15:57',0);
insert  into `auditlogs`(`ID`,`Action`,`User`,`TargetTable`,`TargetID`,`Log`,`DateTime`,`Deleted`) values (46,'Update','(3) Jane Doe','items',1,'Action: Update\nID: 1\nTable: items\n\nquantityAvailable: 97\nquantitySold: 103\nprice: 10.0\nbarcode: 123\nlimited: true\ndescription: Used to write\nname: Pencil\nbranchID: 1\ndetails: \ndeleted: false\n\nquantityAvailable: 97\nquantitySold: 103\nprice: 10.0\nbarcode: 123\nlimited: false\ndescription: Used to write\nname: Pencil\nbranchID: 1\ndetails: \ndeleted: false\n','2014-12-08 10:40:06',0);
insert  into `auditlogs`(`ID`,`Action`,`User`,`TargetTable`,`TargetID`,`Log`,`DateTime`,`Deleted`) values (47,'Update','(3) Jane Doe','items',3,'Action: Update\nID: 3\nTable: items\n\nquantityAvailable: 973\nquantitySold: 55\nprice: 2523.0\nbarcode: 789\nlimited: false\ndescription: Eye protectors\nname: Eyeglasses\nbranchID: 1\ndetails: \ndeleted: false\n\nquantityAvailable: 973\nquantitySold: 55\nprice: 2523.0\nbarcode: 789\nlimited: false\ndescription: Eye protectors\nname: Eyeglasses\nbranchID: 1\ndetails: \ndeleted: false\n','2014-12-08 10:40:13',0);
insert  into `auditlogs`(`ID`,`Action`,`User`,`TargetTable`,`TargetID`,`Log`,`DateTime`,`Deleted`) values (48,'Update','(3) Jane Doe','items',3,'Action: Update\nID: 3\nTable: items\n\nquantityAvailable: 973\nquantitySold: 55\nprice: 2523.0\nbarcode: 789\nlimited: false\ndescription: Eye protectors\nname: Eyeglasses\nbranchID: 1\ndetails: \ndeleted: false\n\nquantityAvailable: 973\nquantitySold: 55\nprice: 2523.0\nbarcode: 789\nlimited: false\ndescription: Eye protectors\nname: Eyeglasses\nbranchID: 1\ndetails: \ndeleted: false\n','2014-12-08 10:40:19',0);
insert  into `auditlogs`(`ID`,`Action`,`User`,`TargetTable`,`TargetID`,`Log`,`DateTime`,`Deleted`) values (49,'Update','(3) Jane Doe','items',3,'Action: Update\nID: 3\nTable: items\n\nquantityAvailable: 973\nquantitySold: 55\nprice: 2523.0\nbarcode: 789\nlimited: false\ndescription: Eye protectors\nname: Eyeglasses\nbranchID: 1\ndetails: \ndeleted: false\n\nquantityAvailable: 973\nquantitySold: 55\nprice: 2523.0\nbarcode: 789\nlimited: false\ndescription: Eye protectors\nname: Eyeglasses\nbranchID: 1\ndetails: \ndeleted: false\n','2014-12-08 10:40:50',0);
insert  into `auditlogs`(`ID`,`Action`,`User`,`TargetTable`,`TargetID`,`Log`,`DateTime`,`Deleted`) values (50,'Update','(3) Jane Doe','items',3,'Action: Update\nID: 3\nTable: items\n\nquantityAvailable: 973\nquantitySold: 55\nprice: 2523.0\nbarcode: 789\nlimited: false\ndescription: Eye protectors\nname: Eyeglasses\nbranchID: 1\ndetails: \ndeleted: false\n\nquantityAvailable: 973\nquantitySold: 55\nprice: 2523.0\nbarcode: 789\nlimited: false\ndescription: Eye protectors\nname: Eyeglasses\nbranchID: 1\ndetails: \ndeleted: false\n','2014-12-08 10:40:57',0);
insert  into `auditlogs`(`ID`,`Action`,`User`,`TargetTable`,`TargetID`,`Log`,`DateTime`,`Deleted`) values (51,'Update','(3) Jane Doe','items',1,'Action: Update\nID: 1\nTable: items\n\nquantityAvailable: 97\nquantitySold: 103\nprice: 10.0\nbarcode: 123\nlimited: false\ndescription: Used to write\nname: Pencil\nbranchID: 1\ndetails: \ndeleted: false\n\nquantityAvailable: 97\nquantitySold: 103\nprice: 10.0\nbarcode: 123\nlimited: false\ndescription: Used to write\nname: Pencil\nbranchID: 1\ndetails: \ndeleted: false\n','2014-12-08 10:41:09',0);
insert  into `auditlogs`(`ID`,`Action`,`User`,`TargetTable`,`TargetID`,`Log`,`DateTime`,`Deleted`) values (52,'Update','(3) Jane Doe','items',1,'Action: Update\nID: 1\nTable: items\n\nquantityAvailable: 97\nquantitySold: 103\nprice: 10.0\nbarcode: 123\nlimited: false\ndescription: Used to write\nname: Pencil\nbranchID: 1\ndetails: \ndeleted: false\n\nquantityAvailable: 97\nquantitySold: 103\nprice: 10.0\nbarcode: 123\nlimited: false\ndescription: Used to write\nname: Pencil\nbranchID: 1\ndetails: \ndeleted: false\n','2014-12-08 10:41:55',0);
insert  into `auditlogs`(`ID`,`Action`,`User`,`TargetTable`,`TargetID`,`Log`,`DateTime`,`Deleted`) values (53,'Update','(3) Jane Doe','items',1,'Action: Update\nID: 1\nTable: items\n\nquantityAvailable: 97\nquantitySold: 103\nprice: 10.0\nbarcode: 123\nlimited: false\ndescription: Used to write\nname: Pencil\nbranchID: 1\ndetails: \ndeleted: false\n\nquantityAvailable: 97\nquantitySold: 103\nprice: 10.0\nbarcode: 123\nlimited: false\ndescription: Used to write\nname: Pencil\nbranchID: 1\ndetails: \ndeleted: false\n','2014-12-08 10:43:17',0);
insert  into `auditlogs`(`ID`,`Action`,`User`,`TargetTable`,`TargetID`,`Log`,`DateTime`,`Deleted`) values (54,'Update','(3) Jane Doe','items',1,'Action: Update\nID: 1\nTable: items\n\nquantityAvailable: 97\nquantitySold: 103\nprice: 10.0\nbarcode: 123\nlimited: false\ndescription: Used to write\nname: Pencil\nbranchID: 1\ndetails: \ndeleted: false\n\nquantityAvailable: 97\nquantitySold: 103\nprice: 10.0\nbarcode: 123\nlimited: false\ndescription: Used to write\nname: Pencil\nbranchID: 1\ndetails: \ndeleted: false\n','2014-12-08 10:43:46',0);
insert  into `auditlogs`(`ID`,`Action`,`User`,`TargetTable`,`TargetID`,`Log`,`DateTime`,`Deleted`) values (55,'Update','(3) Jane Doe','items',1,'Action: Update\nID: 1\nTable: items\n\nquantityAvailable: 97\nquantitySold: 103\nprice: 10.0\nbarcode: 123\nlimited: false\ndescription: Used to write\nname: Pencil\nbranchID: 1\ndetails: \ndeleted: false\n\nquantityAvailable: 97\nquantitySold: 103\nprice: 10.0\nbarcode: 123\nlimited: false\ndescription: Used to write\nname: Pencil\nbranchID: 1\ndetails: \ndeleted: false\n','2014-12-08 10:46:50',0);
insert  into `auditlogs`(`ID`,`Action`,`User`,`TargetTable`,`TargetID`,`Log`,`DateTime`,`Deleted`) values (56,'Update','(3) Jane Doe','items',1,'Action: Update\nID: 1\nTable: items\n\nquantityAvailable: 97\nquantitySold: 103\nprice: 10.0\nbarcode: 123\nlimited: false\ndescription: Used to write\nname: Pencil\nbranchID: 1\ndetails: \ndeleted: false\n\nquantityAvailable: 97\nquantitySold: 103\nprice: 10.0\nbarcode: 123\nlimited: false\ndescription: Used to write\nname: Pencil\nbranchID: 1\ndetails: \ndeleted: false\n','2014-12-08 10:48:08',0);
insert  into `auditlogs`(`ID`,`Action`,`User`,`TargetTable`,`TargetID`,`Log`,`DateTime`,`Deleted`) values (57,'Update','(3) Jane Doe','items',2,'Action: Update\nID: 2\nTable: items\n\nquantityAvailable: 300\nquantitySold: 270\nprice: 90.0\nbarcode: 456\nlimited: true\ndescription: Used mostly everywhere\nname: Paper\nbranchID: 1\ndetails: \ndeleted: false\n\nquantityAvailable: 300\nquantitySold: 270\nprice: 90.0\nbarcode: 456\nlimited: false\ndescription: Used mostly everywhere\nname: Paper\nbranchID: 1\ndetails: \ndeleted: false\n','2014-12-08 12:23:33',0);
insert  into `auditlogs`(`ID`,`Action`,`User`,`TargetTable`,`TargetID`,`Log`,`DateTime`,`Deleted`) values (58,'Update','(3) Jane Doe','items',1,'Action: Update\nID: 1\nTable: items\n\nquantityAvailable: 97\nquantitySold: 103\nprice: 10.0\nbarcode: 123\nlimited: false\ndescription: Used to write\nname: Pencil\nbranchID: 1\ndetails: \ndeleted: false\n\nquantityAvailable: 97\nquantitySold: 103\nprice: 10.0\nbarcode: 123\nlimited: true\ndescription: Used to write\nname: Pencil\nbranchID: 1\ndetails: \ndeleted: false\n','2014-12-08 12:27:13',0);
insert  into `auditlogs`(`ID`,`Action`,`User`,`TargetTable`,`TargetID`,`Log`,`DateTime`,`Deleted`) values (59,'Update','(3) Jane Doe','items',2,'Action: Update\nID: 2\nTable: items\n\nquantityAvailable: 300\nquantitySold: 270\nprice: 90.0\nbarcode: 456\nlimited: false\ndescription: Used mostly everywhere\nname: Paper\nbranchID: 1\ndetails: \ndeleted: false\n\nquantityAvailable: 300\nquantitySold: 270\nprice: 90.0\nbarcode: 456\nlimited: true\ndescription: Used mostly everywhere\nname: Paper\nbranchID: 1\ndetails: \ndeleted: false\n','2014-12-08 12:27:17',0);
insert  into `auditlogs`(`ID`,`Action`,`User`,`TargetTable`,`TargetID`,`Log`,`DateTime`,`Deleted`) values (60,'Update','(3) Jane Doe','items',3,'Action: Update\nID: 3\nTable: items\n\nquantityAvailable: 973\nquantitySold: 55\nprice: 2523.0\nbarcode: 789\nlimited: false\ndescription: Eye protectors\nname: Eyeglasses\nbranchID: 1\ndetails: \ndeleted: false\n\nquantityAvailable: 973\nquantitySold: 55\nprice: 2523.0\nbarcode: 789\nlimited: true\ndescription: Eye protectors\nname: Eyeglasses\nbranchID: 1\ndetails: \ndeleted: false\n','2014-12-08 12:27:20',0);
insert  into `auditlogs`(`ID`,`Action`,`User`,`TargetTable`,`TargetID`,`Log`,`DateTime`,`Deleted`) values (61,'Update','(3) Jane Doe','items',0,'Action: Update\nID: 0\nTable: items\n\nquantityAvailable: 2000\nquantitySold: 0\nprice: 200.0\nbarcode: 143\nlimited: true\ndescription: For decoration.\nname: Flowers\nbranchID: 0\ndetails: \ndeleted: false\n','2014-12-08 12:28:41',0);
insert  into `auditlogs`(`ID`,`Action`,`User`,`TargetTable`,`TargetID`,`Log`,`DateTime`,`Deleted`) values (62,'Add New Sales','(3) Jane Doe','sales',0,'Action: Add New Sales\nID: 0\nTable: sales\n\nsaleID: 1418012970015\nitemID: 4\nprice: 200.0\nquantity: 23\ndateTime: 2014-12-08 12:29:30.046\nname: Flowers\nbranchID: 0\ndetails: null\ndeleted: false\n','2014-12-08 12:29:30',0);

/*Table structure for table `branches` */

DROP TABLE IF EXISTS `branches`;

CREATE TABLE `branches` (
  `ID` int(16) NOT NULL AUTO_INCREMENT,
  `Name` varchar(128) NOT NULL,
  `BranchID` int(16) NOT NULL,
  `Details` text NOT NULL,
  `Deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `branches` */

insert  into `branches`(`ID`,`Name`,`BranchID`,`Details`,`Deleted`) values (1,'Main Branch',1,'',0);

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

/*Table structure for table `details` */

DROP TABLE IF EXISTS `details`;

CREATE TABLE `details` (
  `ID` int(16) NOT NULL AUTO_INCREMENT,
  `Name` varchar(128) NOT NULL,
  `Details` text NOT NULL,
  `Deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `details` */

/*Table structure for table `expenses` */

DROP TABLE IF EXISTS `expenses`;

CREATE TABLE `expenses` (
  `ID` int(16) NOT NULL AUTO_INCREMENT,
  `Name` varchar(128) NOT NULL,
  `BranchID` int(16) NOT NULL,
  `ItemID` int(16) NOT NULL,
  `Price` float NOT NULL,
  `Quantity` int(16) NOT NULL,
  `DateTime` datetime NOT NULL,
  `Details` text NOT NULL,
  `Deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `expenses` */

insert  into `expenses`(`ID`,`Name`,`BranchID`,`ItemID`,`Price`,`Quantity`,`DateTime`,`Details`,`Deleted`) values (1,'Electricity June',1,0,2400.5,0,'2014-06-11 23:02:30','',0);

/*Table structure for table `items` */

DROP TABLE IF EXISTS `items`;

CREATE TABLE `items` (
  `ID` int(16) NOT NULL AUTO_INCREMENT,
  `Barcode` text NOT NULL,
  `Name` varchar(128) NOT NULL,
  `Price` float NOT NULL DEFAULT '0',
  `QuantityAvailable` int(16) NOT NULL DEFAULT '0',
  `QuantitySold` int(16) NOT NULL DEFAULT '0',
  `BranchID` int(16) NOT NULL,
  `Description` text NOT NULL,
  `Details` text NOT NULL,
  `Limited` tinyint(1) NOT NULL DEFAULT '1',
  `Deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `items` */

insert  into `items`(`ID`,`Barcode`,`Name`,`Price`,`QuantityAvailable`,`QuantitySold`,`BranchID`,`Description`,`Details`,`Limited`,`Deleted`) values (1,'123','Pencil',10,97,103,1,'Used to write','',1,0);
insert  into `items`(`ID`,`Barcode`,`Name`,`Price`,`QuantityAvailable`,`QuantitySold`,`BranchID`,`Description`,`Details`,`Limited`,`Deleted`) values (2,'456','Paper',90,300,270,1,'Used mostly everywhere','',1,0);
insert  into `items`(`ID`,`Barcode`,`Name`,`Price`,`QuantityAvailable`,`QuantitySold`,`BranchID`,`Description`,`Details`,`Limited`,`Deleted`) values (3,'789','Eyeglasses',2523,973,55,1,'Eye protectors','',1,0);
insert  into `items`(`ID`,`Barcode`,`Name`,`Price`,`QuantityAvailable`,`QuantitySold`,`BranchID`,`Description`,`Details`,`Limited`,`Deleted`) values (4,'143','Flowers',200,1977,23,0,'For decoration.','',1,0);

/*Table structure for table `licenses` */

DROP TABLE IF EXISTS `licenses`;

CREATE TABLE `licenses` (
  `ID` int(16) NOT NULL AUTO_INCREMENT,
  `Name` varchar(128) NOT NULL,
  `BranchID` int(16) NOT NULL,
  `License` varchar(256) NOT NULL,
  `Expiration` datetime NOT NULL,
  `Deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`BranchID`,`License`),
  UNIQUE KEY `ID` (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

/*Data for the table `licenses` */

insert  into `licenses`(`ID`,`Name`,`BranchID`,`License`,`Expiration`,`Deleted`) values (5,'My License',1,'109723207485417216761400055999834476457912255080892438105870914777567653394668','2015-11-25 12:12:13',0);

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

insert  into `sales`(`ID`,`SaleID`,`Name`,`BranchID`,`ItemID`,`Price`,`Quantity`,`DateTime`,`Details`,`Deleted`) values (1,12123455,'Pencil',1,1,10,2,'2014-12-01 15:10:25','',0);
insert  into `sales`(`ID`,`SaleID`,`Name`,`BranchID`,`ItemID`,`Price`,`Quantity`,`DateTime`,`Details`,`Deleted`) values (2,12123455,'Paper',1,2,50,3,'2014-12-01 15:10:37','',1);
insert  into `sales`(`ID`,`SaleID`,`Name`,`BranchID`,`ItemID`,`Price`,`Quantity`,`DateTime`,`Details`,`Deleted`) values (3,12123455,'Eyeglasses',1,3,2000,4,'2014-12-01 15:10:43','',1);
insert  into `sales`(`ID`,`SaleID`,`Name`,`BranchID`,`ItemID`,`Price`,`Quantity`,`DateTime`,`Details`,`Deleted`) values (4,1417418021031,'Pencil',1,1,10,2,'2014-12-01 15:13:41','null',0);
insert  into `sales`(`ID`,`SaleID`,`Name`,`BranchID`,`ItemID`,`Price`,`Quantity`,`DateTime`,`Details`,`Deleted`) values (5,1417418021031,'Paper',1,2,50,20,'2014-12-01 15:13:41','null',0);
insert  into `sales`(`ID`,`SaleID`,`Name`,`BranchID`,`ItemID`,`Price`,`Quantity`,`DateTime`,`Details`,`Deleted`) values (6,1417418021031,'Eyeglasses',1,3,2000,5,'2014-12-01 15:13:41','null',0);
insert  into `sales`(`ID`,`SaleID`,`Name`,`BranchID`,`ItemID`,`Price`,`Quantity`,`DateTime`,`Details`,`Deleted`) values (7,1417418219750,'Pencil',1,1,10,6,'2014-12-01 15:16:59','null',0);
insert  into `sales`(`ID`,`SaleID`,`Name`,`BranchID`,`ItemID`,`Price`,`Quantity`,`DateTime`,`Details`,`Deleted`) values (8,1417419427625,'Pencil',1,1,10,12,'2014-12-01 15:37:18','null',1);
insert  into `sales`(`ID`,`SaleID`,`Name`,`BranchID`,`ItemID`,`Price`,`Quantity`,`DateTime`,`Details`,`Deleted`) values (9,1417419495515,'Pencil',1,1,10,10,'2014-12-01 15:38:15','null',0);
insert  into `sales`(`ID`,`SaleID`,`Name`,`BranchID`,`ItemID`,`Price`,`Quantity`,`DateTime`,`Details`,`Deleted`) values (10,1417419495515,'Paper',1,2,50,23,'2014-12-01 15:38:15','null',0);
insert  into `sales`(`ID`,`SaleID`,`Name`,`BranchID`,`ItemID`,`Price`,`Quantity`,`DateTime`,`Details`,`Deleted`) values (11,1417419495515,'Eyeglasses',1,3,2000,23,'2014-12-01 15:38:15','null',0);
insert  into `sales`(`ID`,`SaleID`,`Name`,`BranchID`,`ItemID`,`Price`,`Quantity`,`DateTime`,`Details`,`Deleted`) values (12,1417419915453,'Pencil',1,1,10,12,'2014-12-01 15:45:18','null',0);
insert  into `sales`(`ID`,`SaleID`,`Name`,`BranchID`,`ItemID`,`Price`,`Quantity`,`DateTime`,`Details`,`Deleted`) values (13,1417419948031,'Paper',1,2,50,12,'2014-12-01 15:45:48','null',0);
insert  into `sales`(`ID`,`SaleID`,`Name`,`BranchID`,`ItemID`,`Price`,`Quantity`,`DateTime`,`Details`,`Deleted`) values (14,1417426289015,'Pencil',1,1,10,1,'2014-12-01 17:31:29','null',0);
insert  into `sales`(`ID`,`SaleID`,`Name`,`BranchID`,`ItemID`,`Price`,`Quantity`,`DateTime`,`Details`,`Deleted`) values (15,1417495237859,'Pencil',1,1,10,23,'2014-12-02 12:40:37','null',1);
insert  into `sales`(`ID`,`SaleID`,`Name`,`BranchID`,`ItemID`,`Price`,`Quantity`,`DateTime`,`Details`,`Deleted`) values (16,1417495614703,'Paper',1,2,50,12,'2014-12-02 12:46:54','null',1);
insert  into `sales`(`ID`,`SaleID`,`Name`,`BranchID`,`ItemID`,`Price`,`Quantity`,`DateTime`,`Details`,`Deleted`) values (17,1417496094093,'Eyeglasses',1,3,2000,23,'2014-12-02 12:54:54','null',1);
insert  into `sales`(`ID`,`SaleID`,`Name`,`BranchID`,`ItemID`,`Price`,`Quantity`,`DateTime`,`Details`,`Deleted`) values (18,1417589393671,'Pencil',1,1,10,12,'2014-12-03 14:49:53','null',1);
insert  into `sales`(`ID`,`SaleID`,`Name`,`BranchID`,`ItemID`,`Price`,`Quantity`,`DateTime`,`Details`,`Deleted`) values (19,1417759599546,'Paper',1,2,90,146,'2014-12-05 14:06:39','null',0);
insert  into `sales`(`ID`,`SaleID`,`Name`,`BranchID`,`ItemID`,`Price`,`Quantity`,`DateTime`,`Details`,`Deleted`) values (20,1418004957062,'Pencil',1,1,10,23,'2014-12-08 10:15:57','null',0);
insert  into `sales`(`ID`,`SaleID`,`Name`,`BranchID`,`ItemID`,`Price`,`Quantity`,`DateTime`,`Details`,`Deleted`) values (21,1418004957062,'Paper',1,2,90,54,'2014-12-08 10:15:57','null',0);
insert  into `sales`(`ID`,`SaleID`,`Name`,`BranchID`,`ItemID`,`Price`,`Quantity`,`DateTime`,`Details`,`Deleted`) values (22,1418012970015,'Flowers',0,4,200,23,'2014-12-08 12:29:30','null',0);

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `ID` int(16) NOT NULL AUTO_INCREMENT,
  `UserName` varchar(16) NOT NULL,
  `Password` text NOT NULL,
  `AccountType` int(4) NOT NULL DEFAULT '1',
  `Name` varchar(128) NOT NULL,
  `BranchID` int(16) NOT NULL,
  `Description` text NOT NULL,
  `Details` text NOT NULL,
  `Deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `users` */

insert  into `users`(`ID`,`UserName`,`Password`,`AccountType`,`Name`,`BranchID`,`Description`,`Details`,`Deleted`) values (1,'cashier1','cashier1',4,'John Doe',1,'Test account',' ',0);
insert  into `users`(`ID`,`UserName`,`Password`,`AccountType`,`Name`,`BranchID`,`Description`,`Details`,`Deleted`) values (2,'1qaz2wsx','1qaz2wsx',0,'Vic Cebedo',0,'Super Admin account',' ',0);
insert  into `users`(`ID`,`UserName`,`Password`,`AccountType`,`Name`,`BranchID`,`Description`,`Details`,`Deleted`) values (3,'bmanager1','bmanager1',3,'Jane Doe',1,'Test account',' ',0);
insert  into `users`(`ID`,`UserName`,`Password`,`AccountType`,`Name`,`BranchID`,`Description`,`Details`,`Deleted`) values (4,'gmanager1','gmanager1',2,'Carl Ramos',1,'Test account',' ',0);
insert  into `users`(`ID`,`UserName`,`Password`,`AccountType`,`Name`,`BranchID`,`Description`,`Details`,`Deleted`) values (5,'auditor1','auditor1',5,'Lito Bautista',1,'Test account',' ',0);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;

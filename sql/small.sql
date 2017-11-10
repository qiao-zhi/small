/*
SQLyog Ultimate v8.32 
MySQL - 5.7.10-log : Database - small
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`small` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `small`;

/*Table structure for table `register` */

DROP TABLE IF EXISTS `register`;

CREATE TABLE `register` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `xinghao` varchar(100) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `department` varchar(100) DEFAULT NULL,
  `unit` varchar(100) DEFAULT NULL,
  `number` int(11) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `totalPrice` float DEFAULT NULL,
  `come` varchar(100) DEFAULT NULL,
  `buyTime` date DEFAULT NULL,
  `usePerson` varchar(100) DEFAULT NULL,
  `handlePerson` varchar(100) DEFAULT NULL,
  `admini` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=utf8;

/*Data for the table `register` */

insert  into `register`(`id`,`name`,`xinghao`,`address`,`department`,`unit`,`number`,`price`,`totalPrice`,`come`,`buyTime`,`usePerson`,`handlePerson`,`admini`) values (10,'测试名称2',NULL,'测试地址2','测试部门2','测试单位2',1,1.5,1.5,'来源2','2017-08-23','使用人2','经办人2','管理员部门2'),(11,'测试名称2',NULL,'测试地址2','测试部门2','测试单位2',1,1.5,1.5,'来源2','2017-08-23','使用人2','经办人2','管理员部门2'),(14,'测试名称14',NULL,'测试地址2','测试部门2','测试单位2',1,1.5,1.5,'来源2','2017-08-23','使用人2','经办人2','管理员部门2'),(24,'测试名称2',NULL,'测试地址2','测试部门2','测试单位2',1,1.5,1.5,'来源2','2017-08-24','使用人2','经办人2','管理员部门2'),(25,'测试名称2',NULL,'测试地址2','测试部门2','测试单位2',1,1.5,1.5,'来源2','2017-08-24','使用人2','经办人2','管理员部门2'),(26,'测试名称2',NULL,'测试地址2','测试部门2','测试单位2',1,1.5,1.5,'来源2','2017-08-24','使用人2','经办人2','管理员部门2'),(27,'测试名称2',NULL,'测试地址2','测试部门2','测试单位2',1,1.5,1.5,'来源2','2017-08-24','使用人2','经办人2','管理员部门2'),(28,'测试名称2',NULL,'测试地址2','测试部门2','测试单位2',1,1.5,1.5,'来源2','2017-08-24','使用人2','经办人2','管理员部门2'),(29,'测试名称2',NULL,'测试地址2','测试部门2','测试单位2',1,1.5,1.5,'来源2','2017-08-24','使用人2','经办人2','管理员部门2'),(30,'测试名称2',NULL,'测试地址2','测试部门2','测试单位2',1,1.5,1.5,'来源2','2017-08-24','使用人2','经办人2','管理员部门2'),(31,'测试名称2',NULL,'测试地址2','测试部门2','测试单位2',1,1.5,1.5,'来源2','2017-08-24','使用人2','经办人2','管理员部门2'),(33,'测试名称2',NULL,'测试地址2','测试部门2','测试单位2',1,1.5,1.5,'来源2','2017-08-24','使用人2','经办人2','管理员部门2'),(34,'测试1588','是','是','是','是是',3,3002220000,3,'的','2017-08-31','使用人3','经办人5','管理员3'),(36,'zhangsan','w','s','s','s',4,2,3,'s','2017-08-24','本人','经办人5','管理员3'),(37,'测试','型号1','这是什么意思','部门','单位3',10,2,3,'s','2017-08-02','本人','经办人5','管理员3'),(38,'qlq','型号1','请求','部门5','s',10,1.5,3,'的','2017-08-02','使用人3','经办人5','管理员3'),(39,'qlq','型号1','请求','部门5','s',10,1.5,3,'的','2017-08-02','使用人3','经办人5','管理员3'),(40,'北京建设','大规模','太原','部门5','单位5',3,5,1.5,'国家','2017-02-17','乔利强','乔利强','乔利强'),(41,'北京建设','大规模','太原','部门5','单位5',3,5,1.5,'国家','2017-02-17','乔利强','乔利强','乔利强'),(42,'北京建设','大规模','太原','部门5','单位5',3,5,1.5,'国家','2017-02-17','乔利强','乔利强','乔利强'),(43,'北京建设','大规模','太原','部门5','单位5',3,5,1.5,'国家','2016-09-16','乔利强','乔利强','乔利强'),(44,'北京建设','大规模','太原','部门5','单位5',3,5,1.5,'国家','2016-09-16','乔利强','乔利强','乔利强'),(45,'北京建设','大规模','太原','部门5','单位5',3,5,1.5,'国家','2016-09-16','乔利强','乔利强','乔利强'),(46,'北京建设','大规模','太原','部门5','单位5',3,5,1.5,'国家','2016-09-16','乔利强','乔利强','乔利强'),(47,'北京建设','大规模','太原','部门5','单位5',3,5,1.5,'国家','2016-09-16','乔利强','乔利强','乔利强'),(48,'北京建设','大规模','太原','部门5','单位5',3,5,1.5,'国家','2016-09-16','乔利强','乔利强','乔利强'),(49,'北京建设','大规模','太原','部门5','单位5',3,5,1.5,'国家','2016-12-09','乔利强','乔利强','乔利强'),(50,'北京建设','大规模','太原','部门5','单位5',3,5,1.5,'国家','2016-12-09','乔利强','乔利强','乔利强'),(51,'北京建设','大规模','太原','部门5','单位5',3,5,1.5,'国家','2016-12-09','乔利强','乔利强','乔利强'),(52,'北京建设','大规模','太原','部门5','单位5',3,5,1.5,'国家','2016-12-09','乔利强','乔利强','乔利强'),(53,'北京建设','大规模','太原','部门5','单位5',3,5,1.5,'国家','2016-12-09','乔利强','乔利强','乔利强'),(54,'北京建设16','大型','太原','部门5','单位5',3,5,3,'国家','2017-04-13','乔利强','经办人5','乔利强'),(55,'太原建设','型号1','北京','部门5','s',3,5,1.5,'国家','2017-08-26','乔利强','经办人5','乔利强'),(56,'太原建设','型号1','北京','部门5','s',3,5,1.5,'国家','2017-08-26','乔利强','经办人5','乔利强'),(57,'北京建设','大规模','北京','s','单位5',3,1.5,1.5,'国家','2017-08-25','使用人3','乔利强','乔利强'),(58,'北京城乡建设','型号1','北京','部门5','单位5',3,5,3,'国家','2017-08-11','乔利强','经办人5','管理员3'),(59,'北京建设','大规模','太原','部门5','单位5',3,5,1.5,'国家','2017-08-16','使用人3','乔利强','管理员3'),(60,'北京建设','大规模','太原','部门5','单位5',3,5,1.5,'国家','2017-08-16','使用人3','乔利强','管理员3'),(61,'北京真核','大规模','山西','部门5','单位5',3,1.5,3,'国家','2017-08-09','使用人3','经办人5','乔利强'),(62,'北京建设','大规模','地点3','s','s',3,1.5,3,'的','2017-08-21','使用人3','乔利强','管理员3'),(63,'root','大规模','s','部门3','s',10,1.5,3,'国家','2017-08-02','乔利强','经办人5','乔利强'),(64,'qlq','大规模','请求','s','单位3',3,1.5,3,'的','2017-08-15','乔利强','乔利强','管理员5'),(65,'qlq','大规模','s','s','单位5',3,5,1.5,'的','2017-08-09','使用人3','乔利强','管理员5'),(66,'测试增加','大规模','s','s','单位3',10,1.5,1.5,'的','2017-08-12','乔利强','乔利强','管理员3'),(67,'北京建设','请求','s','s','单位5',5,5,3,'国家','2017-08-10','使用人3','经办人5','乔利强'),(68,'测试增加','大规模','太原','s','单位3',3,1.5,3,'的','2017-08-16','乔利强','乔利强','管理员3'),(69,'root','型号1','太原','部门5','单位5',3,5,1.5,'国家','2017-08-18','使用人3','经办人5','乔利强'),(70,'root','型号1','太原','部门5','单位5',3,5,1.5,'国家','2017-08-18','使用人3','经办人5','乔利强'),(71,'root','型号1','太原','部门5','单位5',3,5,1.5,'国家','2017-08-18','使用人3','经办人5','乔利强'),(72,'root','型号1','太原','部门5','单位5',3,5,1.5,'国家','2017-08-18','使用人3','经办人5','乔利强'),(73,'root','型号1','太原','部门5','单位5',3,5,1.5,'国家','2017-08-18','使用人3','经办人5','乔利强'),(74,'root','型号1','太原','部门5','单位5',3,5,1.5,'国家','2017-08-18','使用人3','经办人5','乔利强'),(76,'root','型号1','太原','部门5','单位5',3,5,1.5,'国家','2017-08-18','使用人3','经办人5','乔利强'),(77,'qlq','w','s','s','单位3',10,5,3,'国家','2017-08-17','乔利强','经办人5','管理员5'),(78,'测试增加','大规模','请求','部门3','单位3',5,1.5,1.5,'国家','2017-08-09','乔利强','乔利强','管理员3'),(79,'北京建设','大规模','s','s','s',5,1.5,1.5,'国家','2017-03-08','乔利强','经办人5','管理员5'),(80,'北京建设','型号1','请求','s','单位3',10,1.5,1.5,'国家','2017-08-10','乔利强','经办人5','管理员5'),(81,'测试增加','大规模','s','部门3','单位3',10,5,3,'的','2017-08-02','乔利强','经办人5','乔利强'),(82,'qlq','型号1','s','部门5','单位5',3,1.5,1.5,'国家','2017-08-02','乔利强','经办人5','乔利强'),(83,'测试增加','大规模','s','部门3','单位3',10,5,3,'的','2017-08-02','乔利强','经办人5','乔利强'),(84,'测试增加','大规模','s','部门3','单位3',10,5,3,'的','2017-08-02','乔利强','经办人5','乔利强'),(85,'测试增加','大规模','s','部门3','单位3',10,5,3,'的','2017-08-02','乔利强','经办人5','乔利强'),(86,'测试增加','大规模','s','部门3','单位3',10,5,3,'的','2017-08-02','乔利强','经办人5','乔利强'),(87,'测试增加','大规模','s','部门3','单位3',10,5,3,'的','2017-08-02','乔利强','经办人5','乔利强'),(88,'测试增加','大规模','s','部门3','单位3',10,5,3,'的','2017-08-02','乔利强','经办人5','乔利强'),(89,'测试增加','大规模','s','部门3','单位3',10,5,3,'的','2017-08-02','乔利强','经办人5','乔利强');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

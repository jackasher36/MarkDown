-- MySQL dump 10.13  Distrib 8.0.37, for macos14 (arm64)
--
-- Host: localhost    Database: jack
-- ------------------------------------------------------
-- Server version	8.0.37

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account` (
  `id` varchar(255) NOT NULL COMMENT '账号',
  `balance` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` VALUES ('1',496.76),('10',842.14),('2',263.63),('3',376.9),('4',491.76),('5',539.37),('6',443.74),('7',699.93),('8',31.75),('9',967.78);
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comments` (
  `message_time` datetime NOT NULL,
  `author` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `comment` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `publishtime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `studentid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES ('2024-02-23 00:00:00','Jack','Hello','2024-06-07 15:56:35',''),('2024-06-06 08:59:34','1111','111','2024-06-07 16:19:01',''),('2024-06-06 08:59:34','er\'te','er\'te\'r','2024-06-07 16:21:13',''),('2024-06-06 08:59:34','3453','34534','2024-06-07 16:22:12',''),('2024-06-06 08:59:34','3453','34534','2024-06-07 16:22:46',''),('2024-06-06 08:59:34','4444444','44444444','2024-06-07 16:23:07',''),('2024-06-06 08:59:34','Jack','Heloooooooooooo!','2024-06-07 17:03:34','202231061206'),('2024-06-06 08:59:34','Jack','Heloooooooooooo!222222222222','2024-06-07 17:04:13','202231061206'),('2024-06-06 08:59:34','JAck','Nice','2024-06-07 18:50:46','202231061206'),('2024-06-07 19:12:29','11','11','2024-06-07 19:13:35','202231061206'),('2024-06-07 19:12:29','22','22','2024-06-07 19:13:45','202231061206'),('2024-06-07 19:12:29','123','123','2024-06-07 19:23:30','202231061206'),('2024-06-07 19:12:29','234','2342','2024-06-07 19:26:51','202231061206'),('2024-06-07 19:12:29','22','22','2024-06-07 19:27:57','202231061206'),('2024-06-07 19:12:29','32','32','2024-06-07 19:28:46','202231061206'),('2024-06-07 19:12:29','aaa','aaa','2024-06-07 19:30:36','202231061206'),('2024-06-07 19:12:29','b','b','2024-06-07 19:31:10','202231061206'),('2024-06-07 19:12:29','c','c','2024-06-07 19:32:26','202231061206'),('2024-06-07 19:12:29','d','d','2024-06-07 19:32:51','202231061206'),('2024-06-07 19:12:29','d','d','2024-06-07 19:32:54','202231061206'),('2024-06-07 19:12:29','asa','asas','2024-06-07 19:33:18','202231061206'),('2024-06-07 19:12:29','Jack','经过81次的测试,终于完成了评论系统!!!!!!!!1111','2024-06-07 19:33:51','202231061206'),('2024-06-07 19:35:15','Jack','好bangbang','2024-06-07 19:36:18','202231061206'),('2024-06-07 19:35:15','Jack','好bangbang','2024-06-07 19:37:16','202231061206'),('2024-06-07 19:35:15','Jack','好bangbang','2024-06-07 19:37:49','202231061206'),('2024-06-07 19:35:15','Jack','好bangbang','2024-06-07 19:38:28','202231061206'),('2024-06-07 19:12:29','Jack','不错\r\n','2024-06-07 19:41:45','202231061206');
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `config_info`
--

DROP TABLE IF EXISTS `config_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `config_info` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) COLLATE utf8mb3_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `content` longtext COLLATE utf8mb3_bin NOT NULL COMMENT 'content',
  `md5` varchar(32) COLLATE utf8mb3_bin DEFAULT NULL COMMENT 'md5',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `src_user` text COLLATE utf8mb3_bin COMMENT 'source user',
  `src_ip` varchar(50) COLLATE utf8mb3_bin DEFAULT NULL COMMENT 'source ip',
  `app_name` varchar(128) COLLATE utf8mb3_bin DEFAULT NULL,
  `tenant_id` varchar(128) COLLATE utf8mb3_bin DEFAULT '' COMMENT '租户字段',
  `c_desc` varchar(256) COLLATE utf8mb3_bin DEFAULT NULL,
  `c_use` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `effect` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `type` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `c_schema` text COLLATE utf8mb3_bin,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_configinfo_datagrouptenant` (`data_id`,`group_id`,`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='config_info';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `config_info`
--

LOCK TABLES `config_info` WRITE;
/*!40000 ALTER TABLE `config_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `config_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `config_info_aggr`
--

DROP TABLE IF EXISTS `config_info_aggr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `config_info_aggr` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) COLLATE utf8mb3_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(255) COLLATE utf8mb3_bin NOT NULL COMMENT 'group_id',
  `datum_id` varchar(255) COLLATE utf8mb3_bin NOT NULL COMMENT 'datum_id',
  `content` longtext COLLATE utf8mb3_bin NOT NULL COMMENT '内容',
  `gmt_modified` datetime NOT NULL COMMENT '修改时间',
  `app_name` varchar(128) COLLATE utf8mb3_bin DEFAULT NULL,
  `tenant_id` varchar(128) COLLATE utf8mb3_bin DEFAULT '' COMMENT '租户字段',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_configinfoaggr_datagrouptenantdatum` (`data_id`,`group_id`,`tenant_id`,`datum_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='增加租户字段';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `config_info_aggr`
--

LOCK TABLES `config_info_aggr` WRITE;
/*!40000 ALTER TABLE `config_info_aggr` DISABLE KEYS */;
/*!40000 ALTER TABLE `config_info_aggr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `config_info_beta`
--

DROP TABLE IF EXISTS `config_info_beta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `config_info_beta` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) COLLATE utf8mb3_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) COLLATE utf8mb3_bin NOT NULL COMMENT 'group_id',
  `app_name` varchar(128) COLLATE utf8mb3_bin DEFAULT NULL COMMENT 'app_name',
  `content` longtext COLLATE utf8mb3_bin NOT NULL COMMENT 'content',
  `beta_ips` varchar(1024) COLLATE utf8mb3_bin DEFAULT NULL COMMENT 'betaIps',
  `md5` varchar(32) COLLATE utf8mb3_bin DEFAULT NULL COMMENT 'md5',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `src_user` text COLLATE utf8mb3_bin COMMENT 'source user',
  `src_ip` varchar(50) COLLATE utf8mb3_bin DEFAULT NULL COMMENT 'source ip',
  `tenant_id` varchar(128) COLLATE utf8mb3_bin DEFAULT '' COMMENT '租户字段',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_configinfobeta_datagrouptenant` (`data_id`,`group_id`,`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='config_info_beta';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `config_info_beta`
--

LOCK TABLES `config_info_beta` WRITE;
/*!40000 ALTER TABLE `config_info_beta` DISABLE KEYS */;
/*!40000 ALTER TABLE `config_info_beta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `config_info_tag`
--

DROP TABLE IF EXISTS `config_info_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `config_info_tag` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) COLLATE utf8mb3_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) COLLATE utf8mb3_bin NOT NULL COMMENT 'group_id',
  `tenant_id` varchar(128) COLLATE utf8mb3_bin DEFAULT '' COMMENT 'tenant_id',
  `tag_id` varchar(128) COLLATE utf8mb3_bin NOT NULL COMMENT 'tag_id',
  `app_name` varchar(128) COLLATE utf8mb3_bin DEFAULT NULL COMMENT 'app_name',
  `content` longtext COLLATE utf8mb3_bin NOT NULL COMMENT 'content',
  `md5` varchar(32) COLLATE utf8mb3_bin DEFAULT NULL COMMENT 'md5',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `src_user` text COLLATE utf8mb3_bin COMMENT 'source user',
  `src_ip` varchar(50) COLLATE utf8mb3_bin DEFAULT NULL COMMENT 'source ip',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_configinfotag_datagrouptenanttag` (`data_id`,`group_id`,`tenant_id`,`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='config_info_tag';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `config_info_tag`
--

LOCK TABLES `config_info_tag` WRITE;
/*!40000 ALTER TABLE `config_info_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `config_info_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `config_tags_relation`
--

DROP TABLE IF EXISTS `config_tags_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `config_tags_relation` (
  `id` bigint NOT NULL COMMENT 'id',
  `tag_name` varchar(128) COLLATE utf8mb3_bin NOT NULL COMMENT 'tag_name',
  `tag_type` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL COMMENT 'tag_type',
  `data_id` varchar(255) COLLATE utf8mb3_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) COLLATE utf8mb3_bin NOT NULL COMMENT 'group_id',
  `tenant_id` varchar(128) COLLATE utf8mb3_bin DEFAULT '' COMMENT 'tenant_id',
  `nid` bigint NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`nid`),
  UNIQUE KEY `uk_configtagrelation_configidtag` (`id`,`tag_name`,`tag_type`),
  KEY `idx_tenant_id` (`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='config_tag_relation';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `config_tags_relation`
--

LOCK TABLES `config_tags_relation` WRITE;
/*!40000 ALTER TABLE `config_tags_relation` DISABLE KEYS */;
/*!40000 ALTER TABLE `config_tags_relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group_capacity`
--

DROP TABLE IF EXISTS `group_capacity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `group_capacity` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `group_id` varchar(128) COLLATE utf8mb3_bin NOT NULL DEFAULT '' COMMENT 'Group ID，空字符表示整个集群',
  `quota` int unsigned NOT NULL DEFAULT '0' COMMENT '配额，0表示使用默认值',
  `usage` int unsigned NOT NULL DEFAULT '0' COMMENT '使用量',
  `max_size` int unsigned NOT NULL DEFAULT '0' COMMENT '单个配置大小上限，单位为字节，0表示使用默认值',
  `max_aggr_count` int unsigned NOT NULL DEFAULT '0' COMMENT '聚合子配置最大个数，，0表示使用默认值',
  `max_aggr_size` int unsigned NOT NULL DEFAULT '0' COMMENT '单个聚合数据的子配置大小上限，单位为字节，0表示使用默认值',
  `max_history_count` int unsigned NOT NULL DEFAULT '0' COMMENT '最大变更历史数量',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='集群、各Group容量信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_capacity`
--

LOCK TABLES `group_capacity` WRITE;
/*!40000 ALTER TABLE `group_capacity` DISABLE KEYS */;
/*!40000 ALTER TABLE `group_capacity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `his_config_info`
--

DROP TABLE IF EXISTS `his_config_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `his_config_info` (
  `id` bigint unsigned NOT NULL,
  `nid` bigint unsigned NOT NULL AUTO_INCREMENT,
  `data_id` varchar(255) COLLATE utf8mb3_bin NOT NULL,
  `group_id` varchar(128) COLLATE utf8mb3_bin NOT NULL,
  `app_name` varchar(128) COLLATE utf8mb3_bin DEFAULT NULL COMMENT 'app_name',
  `content` longtext COLLATE utf8mb3_bin NOT NULL,
  `md5` varchar(32) COLLATE utf8mb3_bin DEFAULT NULL,
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `src_user` text COLLATE utf8mb3_bin,
  `src_ip` varchar(50) COLLATE utf8mb3_bin DEFAULT NULL,
  `op_type` char(10) COLLATE utf8mb3_bin DEFAULT NULL,
  `tenant_id` varchar(128) COLLATE utf8mb3_bin DEFAULT '' COMMENT '租户字段',
  PRIMARY KEY (`nid`),
  KEY `idx_gmt_create` (`gmt_create`),
  KEY `idx_gmt_modified` (`gmt_modified`),
  KEY `idx_did` (`data_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='多租户改造';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `his_config_info`
--

LOCK TABLES `his_config_info` WRITE;
/*!40000 ALTER TABLE `his_config_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `his_config_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pages`
--

DROP TABLE IF EXISTS `pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pages` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '自增\n',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `author` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `content` varchar(2550) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `category` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `publictime` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=239 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pages`
--

LOCK TABLES `pages` WRITE;
/*!40000 ALTER TABLE `pages` DISABLE KEYS */;
INSERT INTO `pages` VALUES (136,'老师','女','行政管理部','贸易行业','2017-11-27 04:09:17'),(137,'客户服务经理','男','法律部','房地产业','2000-05-21 01:52:10'),(138,'婚礼筹办者','男','行政管理部','饮食业','2006-09-17 06:53:35'),(139,'理发师','男','行政管理部','金融服务业','2005-01-15 11:16:53'),(140,'办公室主管','女','法律部','咨询业','2013-06-05 23:28:25'),(141,'化妆师','男','公关部','贸易行业','2013-08-11 16:44:55'),(142,'医生','男','市场部','房地产业','2009-04-22 00:48:41'),(143,'办公室主管','女','生产部','工业','2021-03-13 17:50:13'),(144,'信息安全分析师','男','人力资源部','资讯科技业','2002-04-18 05:08:13'),(145,'销售经理','女','销售部','电讯業','2002-01-17 09:06:51'),(146,'纹身艺术家','女','工程部','咨询业','2018-07-04 09:58:40'),(147,'零售助理','女','生产部','制药业','2004-07-20 21:46:37'),(148,'理发师','女','会计及金融部','房地产业','2023-01-11 06:48:18'),(149,'团体领导','女','法律部','房地产业','2021-12-20 18:05:12'),(150,'财务分析师','女','研究及开发部','工程业','2014-10-24 05:06:55'),(151,'销售经理','男','公关部','金融服务业','2021-07-21 07:38:55'),(152,'园艺家','男','公关部','物流业','2011-01-09 02:12:10'),(153,'多媒体动画师','男','会计及金融部','电子行业','2009-09-16 20:04:33'),(154,'医生','女','生产部','咨询业','2014-12-29 08:29:14'),(155,'移动应用程式开发人员','女','研究及开发部','制造业','2007-01-15 18:36:48'),(156,'客户服务经理','女','会计及金融部','电讯業','2002-11-13 09:45:16'),(157,'软件开发员','女','工程部','制造业','2023-12-24 06:55:04'),(158,'UX / UI设计员','女','公关部','金融服务业','2007-02-26 18:14:38'),(159,'饲养员','女','采购部','资讯科技业','2006-07-08 16:11:02'),(160,'办公室文员','男','会计及金融部','工程业','2021-02-05 21:58:28'),(161,'歌手','女','产品质量部','电讯業','2005-01-22 04:23:04'),(162,'建筑师','男','产品质量部','电子行业','2015-11-15 14:22:17'),(163,'移动应用程式开发人员','女','市场部','物流业','2002-11-13 12:13:01'),(164,'导师','男','工程部','电讯業','2009-02-06 13:51:19'),(165,'专案经理','女','信息技术支持部','电讯業','2020-11-10 01:06:43'),(166,'水疗经理','女','外销部','房地产业','2009-04-07 07:43:05'),(167,'歌手','女','公关部','电子行业','2018-06-21 18:09:44'),(168,'社交媒体协调员','女','行政管理部','饮食业','2005-02-25 03:38:10'),(169,'农夫','男','信息技术支持部','工业','2020-03-23 05:51:35'),(170,'专案经理','男','外销部','制造业','2022-12-12 10:08:44'),(171,'商务记者','女','法律部','资讯科技业','2007-10-14 22:48:22'),(172,'专案经理','男','行政管理部','房地产业','2001-10-15 00:04:32'),(173,'市场总监','女','研究及开发部','制药业','2004-12-28 22:56:37'),(174,'园艺家','男','采购部','贸易行业','2013-02-08 11:22:56'),(175,'审计师','女','采购部','制药业','2007-06-21 02:25:17'),(176,'饲养员','女','销售部','工业','2011-03-15 23:42:48'),(177,'首席运营官','女','产品质量部','咨询业','2022-01-11 02:33:31'),(178,'技术支援人员','男','信息技术支持部','电讯業','2021-02-28 16:10:46'),(179,'数据库经理','男','会计及金融部','工程业','2017-09-15 04:36:04'),(180,'饲养员','男','服务支持部','电讯業','2024-06-01 08:44:46'),(181,'人力资源经理','男','市场部','工业','2009-11-21 10:27:51'),(182,'物流协调员','女','物流部','咨询业','2011-04-17 18:09:13'),(183,'婚礼筹办者','男','公关部','物流业','2020-08-18 07:57:02'),(184,'网页开发人员','女','市场部','电子行业','2021-04-14 21:32:05'),(185,'舞蹈演员','女','法律部','工程业','2011-01-21 10:23:40'),(186,'软件开发员','女','市场部','咨询业','2019-02-14 20:07:42'),(187,'美容师','男','生产部','电讯業','2018-03-30 14:19:07'),(188,'食品科学家','男','服务支持部','工业','2003-07-18 17:54:21'),(189,'首席运营官','女','行政管理部','物流业','2016-12-02 12:48:54'),(190,'工程师','女','服务支持部','金融服务业','2022-06-08 02:56:58'),(191,'作家','女','信息技术支持部','金融服务业','2010-04-02 05:46:40'),(192,'客戶協調員','男','市场部','资讯科技业','2000-01-12 01:35:59'),(193,'管家','男','会计及金融部','房地产业','2006-05-29 23:39:39'),(194,'运营经理','男','信息技术支持部','制造业','2013-02-16 10:58:54'),(195,'网页开发人员','男','工程部','制药业','2021-06-01 20:54:34'),(196,'老师','女','市场部','饮食业','2001-03-26 06:15:34'),(197,'客戶協調員','女','会计及金融部','工业','2003-06-28 16:25:26'),(198,'审计师','女','会计及金融部','贸易行业','2005-06-02 21:57:22'),(199,'客户服务经理','女','信息技术支持部','制造业','2015-01-31 15:29:52'),(200,'园艺家','女','会计及金融部','咨询业','2017-11-21 03:46:11'),(201,'审计师','女','采购部','咨询业','2010-03-23 14:38:09'),(202,'美容师','男','产品质量部','电讯業','2010-07-02 06:21:22'),(203,'活动经理','女','工程部','电子行业','2008-05-20 05:26:29'),(204,'工程师','男','公关部','资讯科技业','2017-02-05 05:42:27'),(205,'理发师','男','产品质量部','电子行业','2011-09-28 17:27:03'),(206,'保险销售代理','女','生产部','电讯業','2010-03-15 22:31:27'),(207,'牙齿矫正医生','男','产品质量部','电子行业','2014-04-09 01:54:51'),(208,'演员','男','信息技术支持部','物流业','2018-02-15 03:11:37'),(209,'化妆师','男','人力资源部','房地产业','2001-04-27 09:26:21'),(210,'多媒体动画师','女','公关部','工业','2014-07-07 10:42:19'),(211,'团体领导','女','市场部','资讯科技业','2000-11-30 11:58:21'),(212,'医生','女','外销部','金融服务业','2017-09-30 06:28:49'),(213,'UX / UI设计员','女','人力资源部','资讯科技业','2014-05-14 02:12:47'),(214,'作家','男','法律部','工程业','2020-06-02 19:50:55'),(215,'软件开发员','女','公关部','制造业','2011-09-22 11:37:10'),(216,'数据库经理','女','研究及开发部','房地产业','2017-08-21 14:55:16'),(217,'首席运营官','女','公关部','资讯科技业','2006-07-30 19:51:14'),(218,'纹身艺术家','女','信息技术支持部','工业','2011-12-10 12:41:46'),(219,'网页开发人员','男','工程部','工业','2003-12-02 20:18:04'),(220,'饲养员','女','工程部','电讯業','2021-09-29 15:50:48'),(221,'医生','男','生产部','饮食业','2016-04-27 23:18:29'),(222,'首席运营官','女','外销部','制造业','2002-05-06 00:10:54'),(223,'人力资源经理','男','生产部','电子行业','2014-05-12 13:59:32'),(224,'办公室文员','女','研究及开发部','贸易行业','2003-01-13 21:20:43'),(225,'制片人','女','产品质量部','制药业','2017-02-13 17:51:27'),(226,'管家','女','行政管理部','饮食业','2009-05-18 02:23:16'),(227,'歌手','女','采购部','制药业','2001-07-13 20:34:33'),(228,'制片人','女','信息技术支持部','工业','2000-09-02 08:18:24'),(229,'技术支援人员','女','研究及开发部','物流业','2005-06-10 09:04:35'),(230,'财务分析师','女','法律部','工程业','2008-12-07 20:53:42'),(231,'零售助理','女','销售部','制药业','2006-02-03 22:05:04'),(232,'运营经理','女','产品质量部','制造业','2009-08-04 18:26:31'),(233,'专案经理','女','服务支持部','物流业','2018-05-20 08:17:37'),(234,'网页开发人员','男','法律部','金融服务业','2014-09-18 00:39:39'),(235,'理发师','男','外销部','资讯科技业','2003-03-18 05:48:32'),(236,'aca','JACk','localDateTimelocalDateTimelocalDateTimelocalDateTimelocalDateTimelocalDateTimelocalDateTimelocalDateTimelocalDateTimelocalDateTimelocalDateTimelocalDateTimelocalDateTimelocalDateTimelocalDateTimelocalDateTimelocalDateTimelocalDateTimelocalDateTimelocalDateTimelocalDateTimelocalDateTimelocalDateTimelocalDateTimelocalDateTimelocalDateTimelocalDateTime','entertainment','2024-06-06 08:59:34'),(237,'33','333','3333333','study','2024-06-07 19:12:29'),(238,'欢迎使用325论坛','Jack','测试了81次,终于完成了评论系统的搭建,太辛苦了!!!!!!!111111111','entertainment','2024-06-07 19:35:15');
/*!40000 ALTER TABLE `pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pages_copy1`
--

DROP TABLE IF EXISTS `pages_copy1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pages_copy1` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '自增\n',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `author` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `content` varchar(2550) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `category` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `publictime` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=237 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pages_copy1`
--

LOCK TABLES `pages_copy1` WRITE;
/*!40000 ALTER TABLE `pages_copy1` DISABLE KEYS */;
INSERT INTO `pages_copy1` VALUES (136,'老师','女','行政管理部','贸易行业','2017-11-27 04:09:17'),(137,'客户服务经理','男','法律部','房地产业','2000-05-21 01:52:10'),(138,'婚礼筹办者','男','行政管理部','饮食业','2006-09-17 06:53:35'),(139,'理发师','男','行政管理部','金融服务业','2005-01-15 11:16:53'),(140,'办公室主管','女','法律部','咨询业','2013-06-05 23:28:25'),(141,'化妆师','男','公关部','贸易行业','2013-08-11 16:44:55'),(142,'医生','男','市场部','房地产业','2009-04-22 00:48:41'),(143,'办公室主管','女','生产部','工业','2021-03-13 17:50:13'),(144,'信息安全分析师','男','人力资源部','资讯科技业','2002-04-18 05:08:13'),(145,'销售经理','女','销售部','电讯業','2002-01-17 09:06:51'),(146,'纹身艺术家','女','工程部','咨询业','2018-07-04 09:58:40'),(147,'零售助理','女','生产部','制药业','2004-07-20 21:46:37'),(148,'理发师','女','会计及金融部','房地产业','2023-01-11 06:48:18'),(149,'团体领导','女','法律部','房地产业','2021-12-20 18:05:12'),(150,'财务分析师','女','研究及开发部','工程业','2014-10-24 05:06:55'),(151,'销售经理','男','公关部','金融服务业','2021-07-21 07:38:55'),(152,'园艺家','男','公关部','物流业','2011-01-09 02:12:10'),(153,'多媒体动画师','男','会计及金融部','电子行业','2009-09-16 20:04:33'),(154,'医生','女','生产部','咨询业','2014-12-29 08:29:14'),(155,'移动应用程式开发人员','女','研究及开发部','制造业','2007-01-15 18:36:48'),(156,'客户服务经理','女','会计及金融部','电讯業','2002-11-13 09:45:16'),(157,'软件开发员','女','工程部','制造业','2023-12-24 06:55:04'),(158,'UX / UI设计员','女','公关部','金融服务业','2007-02-26 18:14:38'),(159,'饲养员','女','采购部','资讯科技业','2006-07-08 16:11:02'),(160,'办公室文员','男','会计及金融部','工程业','2021-02-05 21:58:28'),(161,'歌手','女','产品质量部','电讯業','2005-01-22 04:23:04'),(162,'建筑师','男','产品质量部','电子行业','2015-11-15 14:22:17'),(163,'移动应用程式开发人员','女','市场部','物流业','2002-11-13 12:13:01'),(164,'导师','男','工程部','电讯業','2009-02-06 13:51:19'),(165,'专案经理','女','信息技术支持部','电讯業','2020-11-10 01:06:43'),(166,'水疗经理','女','外销部','房地产业','2009-04-07 07:43:05'),(167,'歌手','女','公关部','电子行业','2018-06-21 18:09:44'),(168,'社交媒体协调员','女','行政管理部','饮食业','2005-02-25 03:38:10'),(169,'农夫','男','信息技术支持部','工业','2020-03-23 05:51:35'),(170,'专案经理','男','外销部','制造业','2022-12-12 10:08:44'),(171,'商务记者','女','法律部','资讯科技业','2007-10-14 22:48:22'),(172,'专案经理','男','行政管理部','房地产业','2001-10-15 00:04:32'),(173,'市场总监','女','研究及开发部','制药业','2004-12-28 22:56:37'),(174,'园艺家','男','采购部','贸易行业','2013-02-08 11:22:56'),(175,'审计师','女','采购部','制药业','2007-06-21 02:25:17'),(176,'饲养员','女','销售部','工业','2011-03-15 23:42:48'),(177,'首席运营官','女','产品质量部','咨询业','2022-01-11 02:33:31'),(178,'技术支援人员','男','信息技术支持部','电讯業','2021-02-28 16:10:46'),(179,'数据库经理','男','会计及金融部','工程业','2017-09-15 04:36:04'),(180,'饲养员','男','服务支持部','电讯業','2024-06-01 08:44:46'),(181,'人力资源经理','男','市场部','工业','2009-11-21 10:27:51'),(182,'物流协调员','女','物流部','咨询业','2011-04-17 18:09:13'),(183,'婚礼筹办者','男','公关部','物流业','2020-08-18 07:57:02'),(184,'网页开发人员','女','市场部','电子行业','2021-04-14 21:32:05'),(185,'舞蹈演员','女','法律部','工程业','2011-01-21 10:23:40'),(186,'软件开发员','女','市场部','咨询业','2019-02-14 20:07:42'),(187,'美容师','男','生产部','电讯業','2018-03-30 14:19:07'),(188,'食品科学家','男','服务支持部','工业','2003-07-18 17:54:21'),(189,'首席运营官','女','行政管理部','物流业','2016-12-02 12:48:54'),(190,'工程师','女','服务支持部','金融服务业','2022-06-08 02:56:58'),(191,'作家','女','信息技术支持部','金融服务业','2010-04-02 05:46:40'),(192,'客戶協調員','男','市场部','资讯科技业','2000-01-12 01:35:59'),(193,'管家','男','会计及金融部','房地产业','2006-05-29 23:39:39'),(194,'运营经理','男','信息技术支持部','制造业','2013-02-16 10:58:54'),(195,'网页开发人员','男','工程部','制药业','2021-06-01 20:54:34'),(196,'老师','女','市场部','饮食业','2001-03-26 06:15:34'),(197,'客戶協調員','女','会计及金融部','工业','2003-06-28 16:25:26'),(198,'审计师','女','会计及金融部','贸易行业','2005-06-02 21:57:22'),(199,'客户服务经理','女','信息技术支持部','制造业','2015-01-31 15:29:52'),(200,'园艺家','女','会计及金融部','咨询业','2017-11-21 03:46:11'),(201,'审计师','女','采购部','咨询业','2010-03-23 14:38:09'),(202,'美容师','男','产品质量部','电讯業','2010-07-02 06:21:22'),(203,'活动经理','女','工程部','电子行业','2008-05-20 05:26:29'),(204,'工程师','男','公关部','资讯科技业','2017-02-05 05:42:27'),(205,'理发师','男','产品质量部','电子行业','2011-09-28 17:27:03'),(206,'保险销售代理','女','生产部','电讯業','2010-03-15 22:31:27'),(207,'牙齿矫正医生','男','产品质量部','电子行业','2014-04-09 01:54:51'),(208,'演员','男','信息技术支持部','物流业','2018-02-15 03:11:37'),(209,'化妆师','男','人力资源部','房地产业','2001-04-27 09:26:21'),(210,'多媒体动画师','女','公关部','工业','2014-07-07 10:42:19'),(211,'团体领导','女','市场部','资讯科技业','2000-11-30 11:58:21'),(212,'医生','女','外销部','金融服务业','2017-09-30 06:28:49'),(213,'UX / UI设计员','女','人力资源部','资讯科技业','2014-05-14 02:12:47'),(214,'作家','男','法律部','工程业','2020-06-02 19:50:55'),(215,'软件开发员','女','公关部','制造业','2011-09-22 11:37:10'),(216,'数据库经理','女','研究及开发部','房地产业','2017-08-21 14:55:16'),(217,'首席运营官','女','公关部','资讯科技业','2006-07-30 19:51:14'),(218,'纹身艺术家','女','信息技术支持部','工业','2011-12-10 12:41:46'),(219,'网页开发人员','男','工程部','工业','2003-12-02 20:18:04'),(220,'饲养员','女','工程部','电讯業','2021-09-29 15:50:48'),(221,'医生','男','生产部','饮食业','2016-04-27 23:18:29'),(222,'首席运营官','女','外销部','制造业','2002-05-06 00:10:54'),(223,'人力资源经理','男','生产部','电子行业','2014-05-12 13:59:32'),(224,'办公室文员','女','研究及开发部','贸易行业','2003-01-13 21:20:43'),(225,'制片人','女','产品质量部','制药业','2017-02-13 17:51:27'),(226,'管家','女','行政管理部','饮食业','2009-05-18 02:23:16'),(227,'歌手','女','采购部','制药业','2001-07-13 20:34:33'),(228,'制片人','女','信息技术支持部','工业','2000-09-02 08:18:24'),(229,'技术支援人员','女','研究及开发部','物流业','2005-06-10 09:04:35'),(230,'财务分析师','女','法律部','工程业','2008-12-07 20:53:42'),(231,'零售助理','女','销售部','制药业','2006-02-03 22:05:04'),(232,'运营经理','女','产品质量部','制造业','2009-08-04 18:26:31'),(233,'专案经理','女','服务支持部','物流业','2018-05-20 08:17:37'),(234,'网页开发人员','男','法律部','金融服务业','2014-09-18 00:39:39'),(235,'理发师','男','外销部','资讯科技业','2003-03-18 05:48:32'),(236,'aca','JACk','localDateTimelocalDateTimelocalDateTimelocalDateTimelocalDateTimelocalDateTimelocalDateTimelocalDateTimelocalDateTimelocalDateTimelocalDateTimelocalDateTimelocalDateTimelocalDateTimelocalDateTimelocalDateTimelocalDateTimelocalDateTimelocalDateTimelocalDateTimelocalDateTimelocalDateTimelocalDateTimelocalDateTimelocalDateTimelocalDateTimelocalDateTime','entertainment','2024-06-06 08:59:34');
/*!40000 ALTER TABLE `pages_copy1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permissions` (
  `role` varchar(50) NOT NULL,
  `resource` varchar(255) NOT NULL,
  `action` varchar(8) NOT NULL,
  UNIQUE KEY `uk_role_permission` (`role`,`resource`,`action`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `register`
--

DROP TABLE IF EXISTS `register`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `register` (
  `studentId` varchar(255) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`studentId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `register`
--

LOCK TABLES `register` WRITE;
/*!40000 ALTER TABLE `register` DISABLE KEYS */;
INSERT INTO `register` VALUES ('11','11','11'),('202231061107','casio233.','15756299567'),('202231061206','casio233.','15756299567'),('202231061207','casio233.','15756299567'),('202231061208','casio233.','15756299567'),('202231061209','casio233.','15756299567'),('202231061210','casio233.','15756299567'),('202231061211','casio233.','2'),('202231061216','casio233.','433'),('234','234234','15756299567'),('234234','23423...f','232'),('3333','3333','17882003956');
/*!40000 ALTER TABLE `register` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reviews` (
  `author` varchar(255) DEFAULT NULL,
  `id` varchar(255) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `publishtime` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews`
--

LOCK TABLES `reviews` WRITE;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
INSERT INTO `reviews` VALUES ('陈嘉伦','1','婴儿用品',NULL),('姚子异','10','保健，家庭及婴儿护理',NULL),('熊璐','100','汽车零配件',NULL),('程震南','11','保健，家庭及婴儿护理',NULL),('贾杰宏','12','行李及旅行装备',NULL),('夏嘉伦','13','工具与家居装饰',NULL),('林云熙','14','玩具与游戏',NULL),('韦致远','15','优质美容',NULL),('傅睿','16','艺术，手工艺品及缝纫',NULL),('阎致远','17','美容与个人护理',NULL),('谢晓明','18','应用程式及游戏',NULL),('黎杰宏','19','书本',NULL),('谢嘉伦','2','宠物用品',NULL),('钱致远','20','乐器用品',NULL),('杜震南','21','工业及科学用品',NULL),('杜云熙','22','工具与家居装饰',NULL),('22','222','22',NULL),('孟嘉伦','23','电脑与电子用品',NULL),('马晓明','24','服装，鞋子和珠宝',NULL),('唐璐','25','家电',NULL),('贾致远','26','收藏品及美术用品',NULL),('徐安琪','27','食品',NULL),('贺子异','28','服装，鞋子和珠宝',NULL),('侯嘉伦','29','行李及旅行装备',NULL),('雷子异','3','应用程式及游戏',NULL),('董宇宁','30','玩具与游戏',NULL),('梁詩涵','31','书本',NULL),('余詩涵','32','优质美容',NULL),('23423','32423','423',NULL),('何致远','33','CD及黑胶唱片',NULL),('贺宇宁','34','影视用品',NULL),('刘璐','35','手工制作',NULL),('常睿','36','电子游戏',NULL),('宋致远','37','艺术，手工艺品及缝纫',NULL),('严秀英','38','电脑与电子用品',NULL),('郝子异','39','手机及配件',NULL),('周睿','4','CD及黑胶唱片',NULL),('郑晓明','40','乐器用品',NULL),('田致远','41','手机及配件',NULL),('吴致远','42','宠物用品',NULL),('蔡震南','43','家电',NULL),('雷秀英','44','收藏品及美术用品',NULL),('夏子韬','45','婴儿用品',NULL),('梁睿','46','手机及配件',NULL),('傅詩涵','47','宠物用品',NULL),('石致远','48','CD及黑胶唱片',NULL),('苏子异','49','手机及配件',NULL),('陈杰宏','5','美容与个人护理',NULL),('钟云熙','50','影视用品',NULL),('向詩涵','51','花园与户外',NULL),('郑秀英','52','食品',NULL),('韦岚','53','花园与户外',NULL),('冯岚','54','汽车零配件',NULL),('谭睿','55','工业及科学用品',NULL),('赵詩涵','56','家居及厨房用具',NULL),('雷云熙','57','行李及旅行装备',NULL),('宋宇宁','58','优质美容',NULL),('袁云熙','59','工业及科学用品',NULL),('钱云熙','6','工业及科学用品',NULL),('曾子异','60','乐器用品',NULL),('常詩涵','61','手工制作',NULL),('林宇宁','62','乐器用品',NULL),('戴睿','63','电脑与电子用品',NULL),('程宇宁','64','艺术，手工艺品及缝纫',NULL),('武晓明','65','家电',NULL),('于子异','66','书本',NULL),('范宇宁','67','美容与个人护理',NULL),('廖子韬','68','美容与个人护理',NULL),('钟云熙','69','美容与个人护理',NULL),('袁嘉伦','7','影视用品',NULL),('邹璐','70','CD及黑胶唱片',NULL),('汤嘉伦','71','电脑与电子用品',NULL),('郭致远','72','宠物用品',NULL),('孙宇宁','73','玩具与游戏',NULL),('韩云熙','74','工业及科学用品',NULL),('陆晓明','75','电子游戏',NULL),('毛睿','76','手工制作',NULL),('尹宇宁','77','电子游戏',NULL),('魏睿','78','电子游戏',NULL),('程致远','79','收藏品及美术用品',NULL),('姜致远','8','应用程式及游戏',NULL),('熊子韬','80','家居及厨房用具',NULL),('傅安琪','81','食品',NULL),('夏子韬','82','其他',NULL),('周子异','83','花园与户外',NULL),('钟致远','84','应用程式及游戏',NULL),('江杰宏','85','CD及黑胶唱片',NULL),('梁璐','86','食品',NULL),('萧震南','87','工业及科学用品',NULL),('袁岚','88','其他',NULL),('高致远','89','应用程式及游戏',NULL),('魏晓明','9','艺术，手工艺品及缝纫',NULL),('严詩涵','90','行李及旅行装备',NULL),('田云熙','91','手机及配件',NULL),('董震南','92','食品',NULL),('侯詩涵','93','其他',NULL),('任宇宁','94','其他',NULL),('沈致远','95','花园与户外',NULL),('邵嘉伦','96','保健，家庭及婴儿护理',NULL),('吕杰宏','97','玩具与游戏',NULL),('严杰宏','98','美容与个人护理',NULL),('邵杰宏','99','玩具与游戏',NULL);
/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `username` varchar(50) NOT NULL,
  `role` varchar(50) NOT NULL,
  UNIQUE KEY `idx_user_role` (`username`,`role`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES ('nacos','ROLE_ADMIN');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tenant_capacity`
--

DROP TABLE IF EXISTS `tenant_capacity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tenant_capacity` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `tenant_id` varchar(128) COLLATE utf8mb3_bin NOT NULL DEFAULT '' COMMENT 'Tenant ID',
  `quota` int unsigned NOT NULL DEFAULT '0' COMMENT '配额，0表示使用默认值',
  `usage` int unsigned NOT NULL DEFAULT '0' COMMENT '使用量',
  `max_size` int unsigned NOT NULL DEFAULT '0' COMMENT '单个配置大小上限，单位为字节，0表示使用默认值',
  `max_aggr_count` int unsigned NOT NULL DEFAULT '0' COMMENT '聚合子配置最大个数',
  `max_aggr_size` int unsigned NOT NULL DEFAULT '0' COMMENT '单个聚合数据的子配置大小上限，单位为字节，0表示使用默认值',
  `max_history_count` int unsigned NOT NULL DEFAULT '0' COMMENT '最大变更历史数量',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_tenant_id` (`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='租户容量信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tenant_capacity`
--

LOCK TABLES `tenant_capacity` WRITE;
/*!40000 ALTER TABLE `tenant_capacity` DISABLE KEYS */;
/*!40000 ALTER TABLE `tenant_capacity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tenant_info`
--

DROP TABLE IF EXISTS `tenant_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tenant_info` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `kp` varchar(128) COLLATE utf8mb3_bin NOT NULL COMMENT 'kp',
  `tenant_id` varchar(128) COLLATE utf8mb3_bin DEFAULT '' COMMENT 'tenant_id',
  `tenant_name` varchar(128) COLLATE utf8mb3_bin DEFAULT '' COMMENT 'tenant_name',
  `tenant_desc` varchar(256) COLLATE utf8mb3_bin DEFAULT NULL COMMENT 'tenant_desc',
  `create_source` varchar(32) COLLATE utf8mb3_bin DEFAULT NULL COMMENT 'create_source',
  `gmt_create` bigint NOT NULL COMMENT '创建时间',
  `gmt_modified` bigint NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_tenant_info_kptenantid` (`kp`,`tenant_id`),
  KEY `idx_tenant_id` (`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='tenant_info';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tenant_info`
--

LOCK TABLES `tenant_info` WRITE;
/*!40000 ALTER TABLE `tenant_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `tenant_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`username` DESC) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('99','99'),('34534','34534'),('222','222'),('22','22');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `age` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Jackasher',21),(3,'Jackasher',21),(4,'Jackasher',21),(5,'Carl Coleman',712),(6,'Elaine Bennett',562),(7,'Lu Xiuying',536),(8,'Long Shihan',395),(9,'Yu Zhennan',713),(10,'William Alexander',65),(11,'Hsuan Ka Ming',631),(12,'Hsuan Wing Sze',947),(13,'Mok Chung Yin',679),(14,'Xiong Zhennan',940),(15,'Takahashi Hina',699),(16,'Fan Hiu Tung',485),(17,'Nomura Misaki',423),(18,'Zeng Lan',600),(19,'Mo Wing Fat',453),(20,'Chow Cho Yee',380),(21,'Anita Wagner',266),(22,'Tse Chieh Lun',273),(23,'Miyamoto Eita',587),(24,'Cai Shihan',792),(25,'Zhong Rui',723),(26,'Takagi Tsubasa',5),(27,'Kam Wing Suen',675),(28,'Victoria Morris',728),(29,'Mo Ho Yin',406),(30,'Meng Lan',858),(31,'Ronald Mitchell',77),(32,'Bernard Castro',972),(33,'Matsumoto Yota',252),(34,'Yokoyama Aoi',208),(35,'Takahashi Seiko',880),(36,'Kwan Tsz Hin',14),(37,'Yuan Xiuying',868),(38,'Lo Hiu Tung',212),(39,'Tan Yuning',47),(40,'Lori Gray',408),(41,'Ando Daichi',168),(42,'Cynthia Meyer',549),(43,'Wan Sau Man',147),(44,'Sato Mio',738),(45,'Fu Wing Suen',946),(46,'Xie Zitao',918),(47,'Ying Tin Wing',33),(48,'Jennifer Olson',762),(49,'Russell West',327);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-07-24 16:56:02

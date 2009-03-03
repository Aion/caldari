-- MySQL dump 10.10
--
-- Host: localhost    Database: realmd
-- ------------------------------------------------------
-- Server version	5.0.24a-Debian_9-log

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
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
CREATE TABLE `account` (
  `id` bigint(20) unsigned NOT NULL auto_increment COMMENT 'Identifier',
  `username` varchar(16) NOT NULL default '',
  `password` varchar(28) NOT NULL default '',
  `gmlevel` tinyint(3) unsigned NOT NULL default '0',
  `sessionkey` longtext,
  `v` longtext,
  `s` longtext,
  `email` varchar(320) NOT NULL default '',
  `joindate` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `banned` tinyint(3) unsigned NOT NULL default '0',
  `last_ip` varchar(30) NOT NULL default '127.0.0.1',
  `failed_logins` int(11) unsigned NOT NULL default '0',
  `locked` tinyint(3) unsigned NOT NULL default '0',
  `last_login` timestamp NOT NULL default '0000-00-00 00:00:00',
  `online` tinyint(4) NOT NULL default '0',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `idx_username` (`username`),
  KEY `idx_banned` (`banned`),
  KEY `idx_gmlevel` (`gmlevel`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Account System';

--
-- Dumping data for table `account`
--


/*!40000 ALTER TABLE `account` DISABLE KEYS */;
LOCK TABLES `account` WRITE;
INSERT INTO `account` VALUES (1,'administrator','administrator',3,'','0','0','','2006-04-25 10:18:56',0,'127.0.0.1',0,0,'0000-00-00 00:00:00',0),(2,'gamemaster','gamemaster',2,'','0','0','','2006-04-25 10:18:56',0,'127.0.0.1',0,0,'0000-00-00 00:00:00',0),(3,'moderator','moderator',1,'','0','0','','2006-04-25 10:19:35',0,'127.0.0.1',0,0,'0000-00-00 00:00:00',0),(4,'player','player',0,'','0','0','','2006-04-25 10:19:35',0,'127.0.0.1',0,0,'0000-00-00 00:00:00',0);
UNLOCK TABLES;
/*!40000 ALTER TABLE `account` ENABLE KEYS */;

--
-- Table structure for table `ip_banned`
--

DROP TABLE IF EXISTS `ip_banned`;
CREATE TABLE `ip_banned` (
  `ip` varchar(32) NOT NULL default '127.0.0.1',
  PRIMARY KEY  (`ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Banned IPs';

--
-- Dumping data for table `ip_banned`
--


/*!40000 ALTER TABLE `ip_banned` DISABLE KEYS */;
LOCK TABLES `ip_banned` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `ip_banned` ENABLE KEYS */;

--
-- Table structure for table `realmcharacters`
--

DROP TABLE IF EXISTS `realmcharacters`;
CREATE TABLE `realmcharacters` (
  `realmid` int(11) unsigned NOT NULL default '0',
  `acctid` bigint(20) unsigned NOT NULL,
  `numchars` tinyint(3) unsigned NOT NULL default '0',
  PRIMARY KEY  (`realmid`,`acctid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Realm Character Tracker';

--
-- Dumping data for table `realmcharacters`
--


/*!40000 ALTER TABLE `realmcharacters` DISABLE KEYS */;
LOCK TABLES `realmcharacters` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `realmcharacters` ENABLE KEYS */;

--
-- Table structure for table `realmlist`
--

DROP TABLE IF EXISTS `realmlist`;
CREATE TABLE `realmlist` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `name` varchar(32) NOT NULL default '',
  `address` varchar(32) NOT NULL default '127.0.0.1',
  `port` int(11) NOT NULL default '8085',
  `icon` tinyint(3) unsigned NOT NULL default '0',
  `color` tinyint(3) unsigned NOT NULL default '0',
  `timezone` tinyint(3) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `idx_name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Realm System';

--
-- Dumping data for table `realmlist`
--


/*!40000 ALTER TABLE `realmlist` DISABLE KEYS */;
LOCK TABLES `realmlist` WRITE;
INSERT INTO `realmlist` VALUES (1,'MaNGOS','127.0.0.1',8085,1,0,1);
UNLOCK TABLES;
/*!40000 ALTER TABLE `realmlist` ENABLE KEYS */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;


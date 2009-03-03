-- MySQL dump 10.10
--
-- Host: localhost    Database: mangos
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
-- Table structure for table `areatrigger_involvedrelation`
--

DROP TABLE IF EXISTS `areatrigger_involvedrelation`;
CREATE TABLE `areatrigger_involvedrelation` (
  `id` int(11) unsigned NOT NULL default '0' COMMENT 'Identifier',
  `quest` int(11) unsigned NOT NULL default '0' COMMENT 'Quest Identifier',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Trigger System';

--
-- Dumping data for table `areatrigger_involvedrelation`
--


/*!40000 ALTER TABLE `areatrigger_involvedrelation` DISABLE KEYS */;
LOCK TABLES `areatrigger_involvedrelation` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `areatrigger_involvedrelation` ENABLE KEYS */;

--
-- Table structure for table `areatrigger_tavern`
--

DROP TABLE IF EXISTS `areatrigger_tavern`;
CREATE TABLE `areatrigger_tavern` (
  `id` int(11) unsigned NOT NULL default '0' COMMENT 'Identifier',
  `name` text,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Trigger System';

--
-- Dumping data for table `areatrigger_tavern`
--


/*!40000 ALTER TABLE `areatrigger_tavern` DISABLE KEYS */;
LOCK TABLES `areatrigger_tavern` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `areatrigger_tavern` ENABLE KEYS */;

--
-- Table structure for table `areatrigger_template`
--

DROP TABLE IF EXISTS `areatrigger_template`;
CREATE TABLE `areatrigger_template` (
  `id` int(11) unsigned NOT NULL default '0' COMMENT 'Identifier',
  `name` text,
  `required_level` tinyint(3) unsigned NOT NULL default '0',
  `trigger_map` int(11) unsigned NOT NULL default '0',
  `trigger_position_x` float NOT NULL default '0',
  `trigger_position_y` float NOT NULL default '0',
  `trigger_position_z` float NOT NULL default '0',
  `target_map` int(11) unsigned NOT NULL default '0',
  `target_position_x` float NOT NULL default '0',
  `target_position_y` float NOT NULL default '0',
  `target_position_z` float NOT NULL default '0',
  `target_orientation` float NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Trigger System';

--
-- Dumping data for table `areatrigger_template`
--


/*!40000 ALTER TABLE `areatrigger_template` DISABLE KEYS */;
LOCK TABLES `areatrigger_template` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `areatrigger_template` ENABLE KEYS */;

--
-- Table structure for table `auctionhouse`
--

DROP TABLE IF EXISTS `auctionhouse`;
CREATE TABLE `auctionhouse` (
  `id` int(11) unsigned NOT NULL default '0',
  `auctioneerguid` int(11) unsigned NOT NULL default '0',
  `itemguid` int(11) unsigned NOT NULL default '0',
  `item_template` int(11) unsigned NOT NULL default '0' COMMENT 'Item Identifier',
  `itemowner` int(11) unsigned NOT NULL default '0',
  `buyoutprice` int(11) NOT NULL default '0',
  `time` bigint(40) NOT NULL default '0',
  `buyguid` int(11) unsigned NOT NULL default '0',
  `lastbid` int(11) NOT NULL default '0',
  `startbid` int(11) NOT NULL default '0',
  `deposit` int(11) NOT NULL default '0',
  `location` tinyint(3) unsigned NOT NULL default '3',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `auctionhouse`
--


/*!40000 ALTER TABLE `auctionhouse` DISABLE KEYS */;
LOCK TABLES `auctionhouse` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `auctionhouse` ENABLE KEYS */;

--
-- Table structure for table `bugreport`
--

DROP TABLE IF EXISTS `bugreport`;
CREATE TABLE `bugreport` (
  `id` int(11) NOT NULL auto_increment COMMENT 'Identifier',
  `type` varchar(255) NOT NULL default '',
  `content` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Debug System';

--
-- Dumping data for table `bugreport`
--


/*!40000 ALTER TABLE `bugreport` DISABLE KEYS */;
LOCK TABLES `bugreport` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `bugreport` ENABLE KEYS */;

--
-- Table structure for table `character`
--

DROP TABLE IF EXISTS `character`;
CREATE TABLE `character` (
  `guid` int(11) unsigned NOT NULL default '0' COMMENT 'Global Unique Identifier',
  `account` int(11) unsigned NOT NULL default '0' COMMENT 'Account Identifier',
  `data` longtext,
  `name` varchar(12) NOT NULL default '',
  `race` tinyint(3) unsigned NOT NULL default '0',
  `class` tinyint(3) unsigned NOT NULL default '0',
  `position_x` float NOT NULL default '0',
  `position_y` float NOT NULL default '0',
  `position_z` float NOT NULL default '0',
  `map` int(11) unsigned NOT NULL default '0' COMMENT 'Map Identifier',
  `orientation` float NOT NULL default '0',
  `taximask` longtext,
  `online` tinyint(3) unsigned NOT NULL default '0',
  `highest_rank` int(11) NOT NULL default '0',
  `standing` int(11) NOT NULL default '0',
  `rating` float NOT NULL default '0',
  `cinematic` tinyint(3) unsigned NOT NULL default '0',
  `totaltime` int(11) unsigned NOT NULL default '0',
  `leveltime` int(11) unsigned NOT NULL default '0',
  `logout_time` int(11) NOT NULL default '0',
  `is_logout_resting` tinyint(3) NOT NULL default '0',
  `rest_bonus` float NOT NULL default '0',
  `resettalents_cost` int(11) unsigned NOT NULL default '0',
  `resettalents_time` bigint(20) unsigned NOT NULL default '0',
  `trans_x` float NOT NULL default '0',
  `trans_y` float NOT NULL default '0',
  `trans_z` float NOT NULL default '0',
  `trans_o` float NOT NULL default '0',
  `transguid` bigint(20) unsigned NOT NULL default '0',
  `gmstate` tinyint(3) unsigned NOT NULL default '0',
  `stable_slots` tinyint(1) unsigned NOT NULL default '0',
  PRIMARY KEY  (`guid`),
  KEY `idx_account` (`account`),
  KEY `idx_online` (`online`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Player System';

--
-- Dumping data for table `character`
--


/*!40000 ALTER TABLE `character` DISABLE KEYS */;
LOCK TABLES `character` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `character` ENABLE KEYS */;

--
-- Table structure for table `character_action`
--

DROP TABLE IF EXISTS `character_action`;
CREATE TABLE `character_action` (
  `guid` int(11) unsigned NOT NULL default '0' COMMENT 'Global Unique Identifier',
  `button` tinyint(3) unsigned NOT NULL default '0',
  `action` smallint(5) unsigned NOT NULL default '0',
  `type` tinyint(3) unsigned NOT NULL default '0',
  `misc` tinyint(3) unsigned NOT NULL default '0',
  PRIMARY KEY  (`guid`,`button`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Player System';

--
-- Dumping data for table `character_action`
--


/*!40000 ALTER TABLE `character_action` DISABLE KEYS */;
LOCK TABLES `character_action` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `character_action` ENABLE KEYS */;

--
-- Table structure for table `character_aura`
--

DROP TABLE IF EXISTS `character_aura`;
CREATE TABLE `character_aura` (
  `guid` int(11) unsigned NOT NULL default '0' COMMENT 'Global Unique Identifier',
  `spell` int(11) unsigned NOT NULL default '0',
  `effect_index` int(11) unsigned NOT NULL default '0',
  `remaintime` int(11) NOT NULL default '0',
  PRIMARY KEY  (`guid`,`spell`,`effect_index`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Player System';

--
-- Dumping data for table `character_aura`
--


/*!40000 ALTER TABLE `character_aura` DISABLE KEYS */;
LOCK TABLES `character_aura` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `character_aura` ENABLE KEYS */;

--
-- Table structure for table `character_gifts`
--

DROP TABLE IF EXISTS `character_gifts`;
CREATE TABLE `character_gifts` (
  `guid` int(20) unsigned NOT NULL default '0',
  `item_guid` int(11) unsigned NOT NULL default '0',
  `entry` int(20) unsigned NOT NULL default '0',
  `flags` int(20) unsigned NOT NULL default '0',
  PRIMARY KEY  (`item_guid`),
  KEY `idx_guid` (`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `character_gifts`
--


/*!40000 ALTER TABLE `character_gifts` DISABLE KEYS */;
LOCK TABLES `character_gifts` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `character_gifts` ENABLE KEYS */;

--
-- Table structure for table `character_homebind`
--

DROP TABLE IF EXISTS `character_homebind`;
CREATE TABLE `character_homebind` (
  `guid` int(11) unsigned NOT NULL default '0' COMMENT 'Global Unique Identifier',
  `map` int(11) unsigned NOT NULL default '0' COMMENT 'Map Identifier',
  `zone` int(11) unsigned NOT NULL default '0' COMMENT 'Zone Identifier',
  `position_x` float NOT NULL default '0',
  `position_y` float NOT NULL default '0',
  `position_z` float NOT NULL default '0',
  PRIMARY KEY  (`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Player System';

--
-- Dumping data for table `character_homebind`
--


/*!40000 ALTER TABLE `character_homebind` DISABLE KEYS */;
LOCK TABLES `character_homebind` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `character_homebind` ENABLE KEYS */;


--
-- Table structure for table `character_instance`
--

DROP TABLE IF EXISTS `character_instance`;
CREATE TABLE `character_instance` (
  `guid` int(11) unsigned NOT NULL default '0',
  `map` int(11) unsigned NOT NULL default '0',
  `instance` bigint(40) NOT NULL default '0',
  `leader` int(11) unsigned NOT NULL default '0',
  PRIMARY KEY  (`guid`,`map`),
  KEY `instance` (`instance`),
  KEY `leader` (`leader`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


--
-- Dumping data for table `character_instance`
--


/*!40000 ALTER TABLE `character_instance` DISABLE KEYS */;
LOCK TABLES `character_instance` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `character_instance` ENABLE KEYS */;


--
-- Table structure for table `character_inventory`
--

DROP TABLE IF EXISTS `character_inventory`;
CREATE TABLE `character_inventory` (
  `guid` int(11) unsigned NOT NULL default '0' COMMENT 'Global Unique Identifier',
  `bag` int(11) unsigned NOT NULL default '0',
  `slot` tinyint(3) unsigned NOT NULL default '0',
  `item` int(11) unsigned NOT NULL default '0' COMMENT 'Item Global Unique Identifier',
  `item_template` int(11) unsigned NOT NULL default '0' COMMENT 'Item Identifier',
  PRIMARY KEY  (`item`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Player System';

--
-- Dumping data for table `character_inventory`
--


/*!40000 ALTER TABLE `character_inventory` DISABLE KEYS */;
LOCK TABLES `character_inventory` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `character_inventory` ENABLE KEYS */;

--
-- Table structure for table `character_kill`
--

DROP TABLE IF EXISTS `character_kill`;
CREATE TABLE `character_kill` (
  `guid` int(11) unsigned NOT NULL default '0' COMMENT 'Global Unique Identifier',
  `creature_template` int(11) unsigned NOT NULL default '0' COMMENT 'Creature Identifier',
  `honor` float NOT NULL default '0',
  `date` int(11) unsigned NOT NULL default '0',
  `type` tinyint(3) unsigned NOT NULL default '0',
  KEY `idx_guid` (`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Player System';

--
-- Dumping data for table `character_kill`
--


/*!40000 ALTER TABLE `character_kill` DISABLE KEYS */;
LOCK TABLES `character_kill` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `character_kill` ENABLE KEYS */;

--
-- Table structure for table `character_pet`
--

DROP TABLE IF EXISTS `character_pet`;
CREATE TABLE `character_pet` (
  `id` int(11) unsigned NOT NULL  default '0',
  `entry` int(11) unsigned NOT NULL default '0',
  `owner` int(11) unsigned NOT NULL default '0',
  `modelid` int(11) unsigned default '0',
  `level` int(11) unsigned NOT NULL default '1',
  `exp` int(11) unsigned NOT NULL default '0',
  `nextlvlexp` int(11) unsigned NOT NULL default '100',
  `spell1` int(11) unsigned NOT NULL default '0',
  `spell2` int(11) unsigned NOT NULL default '0',
  `spell3` int(11) unsigned NOT NULL default '0',
  `spell4` int(11) unsigned NOT NULL default '0',
  `action` int(11) unsigned NOT NULL default '0',
  `fealty` int(11) unsigned NOT NULL default '0',
  `loyalty` int(11) unsigned NOT NULL default '1',
  `trainpoint` int(11) unsigned NOT NULL default '0',
  `name` varchar(100) default 'Pet',
  `renamed` tinyint(1) unsigned NOT NULL default '0',
  `slot` int(11) unsigned NOT NULL default '0',
  `curhealth` int(11) unsigned NOT NULL default '1',
  `curmana` int(11) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `owner` (`owner`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Player System';

--
-- Dumping data for table `character_pet`
--


/*!40000 ALTER TABLE `character_pet` DISABLE KEYS */;
LOCK TABLES `character_pet` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `character_pet` ENABLE KEYS */;

--
-- Table structure for table `character_queststatus`
--

DROP TABLE IF EXISTS `character_queststatus`;
CREATE TABLE `character_queststatus` (
  `guid` int(11) unsigned NOT NULL default '0' COMMENT 'Global Unique Identifier',
  `quest` int(11) unsigned NOT NULL default '0' COMMENT 'Quest Identifier',
  `status` int(11) unsigned NOT NULL default '0',
  `rewarded` tinyint(1) unsigned NOT NULL default '0',
  `explored` tinyint(1) unsigned NOT NULL default '0',
  `timer` bigint(20) unsigned NOT NULL default '0',
  `mobcount1` int(11) unsigned NOT NULL default '0',
  `mobcount2` int(11) unsigned NOT NULL default '0',
  `mobcount3` int(11) unsigned NOT NULL default '0',
  `mobcount4` int(11) unsigned NOT NULL default '0',
  `itemcount1` int(11) unsigned NOT NULL default '0',
  `itemcount2` int(11) unsigned NOT NULL default '0',
  `itemcount3` int(11) unsigned NOT NULL default '0',
  `itemcount4` int(11) unsigned NOT NULL default '0',
  PRIMARY KEY  (`guid`,`quest`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Player System';

--
-- Dumping data for table `character_queststatus`
--


/*!40000 ALTER TABLE `character_queststatus` DISABLE KEYS */;
LOCK TABLES `character_queststatus` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `character_queststatus` ENABLE KEYS */;

--
-- Table structure for table `character_reputation`
--

DROP TABLE IF EXISTS `character_reputation`;
CREATE TABLE `character_reputation` (
  `guid` int(11) unsigned NOT NULL default '0' COMMENT 'Global Unique Identifier',
  `faction` int(11) unsigned NOT NULL default '0',
  `reputation` int(11) unsigned NOT NULL default '0' COMMENT 'Reputation Identifier',
  `standing` int(11) NOT NULL default '0',
  `flags` int(11) NOT NULL default '0',
  PRIMARY KEY  (`guid`,`faction`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Player System';

--
-- Dumping data for table `character_reputation`
--


/*!40000 ALTER TABLE `character_reputation` DISABLE KEYS */;
LOCK TABLES `character_reputation` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `character_reputation` ENABLE KEYS */;

--
-- Table structure for table `character_social`
--

DROP TABLE IF EXISTS `character_social`;
CREATE TABLE `character_social` (
  `guid` int(11) unsigned NOT NULL default '0' COMMENT 'Global Unique Identifier',
  `name` varchar(21) NOT NULL default '',
  `friend` int(11) unsigned NOT NULL default '0' COMMENT 'Character Global Unique Identifier',
  `flags` varchar(21) NOT NULL default '',
  PRIMARY KEY  (`guid`,`friend`,`flags`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Player System';

--
-- Dumping data for table `character_social`
--


/*!40000 ALTER TABLE `character_social` DISABLE KEYS */;
LOCK TABLES `character_social` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `character_social` ENABLE KEYS */;

--
-- Table structure for table `character_spell`
--

DROP TABLE IF EXISTS `character_spell`;
CREATE TABLE `character_spell` (
  `guid` int(11) unsigned NOT NULL default '0' COMMENT 'Global Unique Identifier',
  `spell` int(11) unsigned NOT NULL default '0' COMMENT 'Spell Identifier',
  `slot` int(11) unsigned NOT NULL default '0',
  `active` tinyint(3) unsigned NOT NULL default '1',
  PRIMARY KEY  (`guid`,`spell`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Player System';

--
-- Dumping data for table `character_spell`
--


/*!40000 ALTER TABLE `character_spell` DISABLE KEYS */;
LOCK TABLES `character_spell` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `character_spell` ENABLE KEYS */;

--
-- Table structure for table `character_spell_cooldown`
--

DROP TABLE IF EXISTS `character_spell_cooldown`;
CREATE TABLE `character_spell_cooldown` (
  `guid` int(11) unsigned NOT NULL default '0' COMMENT 'Global Unique Identifier, Low part',
  `spell` int(11) unsigned NOT NULL default '0' COMMENT 'Spell Identifier',
  `time` bigint(20) unsigned NOT NULL default '0',
  PRIMARY KEY  (`guid`,`spell`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `character_spell_cooldown`
--


/*!40000 ALTER TABLE `character_spell_cooldown` DISABLE KEYS */;
LOCK TABLES `character_spell_cooldown` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `character_spell_cooldown` ENABLE KEYS */;

--
-- Table structure for table `character_ticket`
--

DROP TABLE IF EXISTS `character_ticket`;
CREATE TABLE `character_ticket` (
  `ticket_id` int(11) NOT NULL auto_increment,
  `guid` int(11) unsigned NOT NULL default '0',
  `ticket_text` varchar(255) NOT NULL default '',
  `ticket_category` int(1) NOT NULL default '0',
  PRIMARY KEY  (`ticket_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Player System';

--
-- Dumping data for table `character_ticket`
--


/*!40000 ALTER TABLE `character_ticket` DISABLE KEYS */;
LOCK TABLES `character_ticket` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `character_ticket` ENABLE KEYS */;

--
-- Table structure for table `character_tutorial`
--

DROP TABLE IF EXISTS `character_tutorial`;
CREATE TABLE `character_tutorial` (
  `guid` int(11) unsigned NOT NULL default '0' COMMENT 'Global Unique Identifier',
  `tut0` int(11) unsigned NOT NULL default '0',
  `tut1` int(11) unsigned NOT NULL default '0',
  `tut2` int(11) unsigned NOT NULL default '0',
  `tut3` int(11) unsigned NOT NULL default '0',
  `tut4` int(11) unsigned NOT NULL default '0',
  `tut5` int(11) unsigned NOT NULL default '0',
  `tut6` int(11) unsigned NOT NULL default '0',
  `tut7` int(11) unsigned NOT NULL default '0',
  PRIMARY KEY  (`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Player System';

--
-- Dumping data for table `character_tutorial`
--


/*!40000 ALTER TABLE `character_tutorial` DISABLE KEYS */;
LOCK TABLES `character_tutorial` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `character_tutorial` ENABLE KEYS */;

--
-- Table structure for table `command`
--

DROP TABLE IF EXISTS `command`;
CREATE TABLE `command` (
  `name` varchar(50) NOT NULL default '',
  `security` tinyint(3) unsigned NOT NULL default '0',
  `help` longtext,
  PRIMARY KEY  (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Chat System';

--
-- Dumping data for table `command`
--


/*!40000 ALTER TABLE `command` DISABLE KEYS */;
LOCK TABLES `command` WRITE;
INSERT INTO `command` VALUES ('acct',0,'Syntax: .acct\r\n\r\nDisplay the access level of your account.'),('addgo',3,'Syntax: .addgo #id\r\n\r\nAdd a game object from game object templates to the world at your current location using the #id.\r\n\r\nNote: this is a copy of .gameobject.'),('additem',3,'Syntax: .additem #itemid/[#itemname]/#shift-click-item-link #itemcount\r\n\r\nAdds the specified number of items of id #itemid (or exact (!) name $itemname in brackets, or link created by shift-click at item in inventory or recipe) to your or selected character inventory. If #itemcount is omitted, only one item will be added.\r\n.'),('additemset',3,'Syntax: .additemset #itemsetid\r\n\r\nAdd items from itemset of id #itemsetid to your or selected character inventory. Will add by one example each item from itemset.'),('addmove',2,'Syntax: .addmove #creature_guid [#waittime]\r\n\r\nAdd your current location as a waypoint for creature with guid #creature_guid. And optional add wait time.'),('addquest',3,'Syntax: .addquest #quest_id\r\n\r\nAdd to character quest log quest #quest_id. Quest started from item can\'t be added by this command but correct .additem call provided in command output.'),('addtele',3,'Syntax: .addtele $name\r\n\r\nAdd current your position to .tele command target locations list with name $name.'),('AddSpawn',2,'Not yet implemented.'),('addspw',2,'Syntax: .addspw #creatureid\r\n\r\nSpawn a creature by the given template id of #creatureid.'),('addweapon',3,'Not yet implemented.'),('addvendoritem',2,'Syntax: .addvendoritem #itemId <#maxcount><#incrtime>\r\n\r\nAdd item #itemid to item list of selected vendor. Also optionally set max count item in vendor item list and time to item count restoring.'),('delvendoritem',2,'Syntax: .delvendoritem #itemId\r\n\r\nRemove item #itemid from item list of selected vendor.'),('allowmove',3,'Syntax: .allowmove\r\n\r\nEnable or disable movement for the selected creature.'),('anim',3,'Syntax: .anim #emoteid\r\n\r\nPlay emote #emoteid for your character.'),('announce',1,'Syntax: .announce $MessageToBroadcast\r\n\r\nSend a global message to all players online.'),('aura',3,'Syntax: .aura #spellid\r\n\r\nAdd the aura from spell #spellid to the selected Unit.'),('banaccount',3,'Syntax: .banaccount $name\r\n\r\nBan account $name (can be viewed by players by using the .pinfo command) and kick affected players currently logged in.'),('banip',3,'Syntax: .banip #ip\r\n\r\nBans logging into the server from computers with the provided IP address, and kicks all affected players.'),('bank',3,'Syntax: .bank\r\n\r\nShow your bank inventory.'),('changelevel',2,'Syntax: .changelevel #level\r\n\r\nChange the level of the selected creature to #level.\r\n\r\n#level may range from 1 to 63.'),('commands',0,'Syntax: .commands\r\n\r\nDisplay a list of available commands for your account level.'),('cooldown',3,'Syntax: .cooldown [#spell_id]\r\n\r\nRemove all (if spell_id not provided) or #spel_id spell cooldown from selected character or you (if no selection).'),('createguild',3,'Syntax: .createguild $GuildName $GuildLeaderName\r\n\r\nCreate a guild named $GuildName with the player $GuildLeaderName as leader.'),('cshutdown',3,'Syntax: .cshutdown Cancels shutdown'),('delete',2,'Syntax: .delete\r\n\r\nDelete the selected creature from the world.'),('delobject',2,'Syntax: .delobject #go_guid\r\nDelete gameobject with guid #go_guid.'),('deltele',3,'Syntax: .deltele $name\r\n\r\nRemove location with name $name for .tele command locations list.'),('delticket',2,'Syntax: .delticket all\r\n        .delticket #num\r\n        .delticket $character_name\r\n\rall to dalete all tickets at server, $character_name to delete ticket of this character, #num to delete ticket #num.'),('demorph',2,'Syntax: .demorph\r\n\r\nDemorph the selected player.'),('die',3,'Syntax: .die\r\n\r\nKill the selected player. If no player is selected, it will kill you.'),('dismount',0,'Syntax: .dismount\r\n\r\nDismount you, if you are mounted.'),('displayid',2,'Syntax: .displayid #displayid\r\n\r\nChange the model id of the selected creature to #displayid.'),('distance',3,'Syntax: .distance\r\n\r\nDisplay the distance from your character to the selected creature.'),('emote',3,'Syntax: .emote #emoteid\r\n\r\nMake the selected creature emote with an emote of id #emoteid.'),('explorecheat',3,'Syntax: .explorecheat #flag\r\n\r\nReveal  or hide all maps for the selected player. If no player is selected, hide or reveal maps to you.\r\n\r\nUse a #flag of value 1 to reveal, use a #flag value of 0 to hide all maps.'),('factionid',2,'Syntax: .factionid #factionid\r\n\r\nSet the faction of the selected creature to #factionid.'),('gameobject',3,'Syntax: .gameobject #id\r\n\r\nAdd a game object from game object templates to the world at your current position using the #id.'),('getvalue',3,'Syntax: .getvalue #field #isInt\r\n\r\nGet the field #field of the selected creature. If no creature is selected, get the content of your field.\r\n\r\nUse a #isInt of value 1 if the expected field content is an integer.'),('gmlist',0,'Syntax: .gmlist\r\n\r\nDisplay a list of available Game Masters.'),('gmoff',1,'Syntax: .gmoff\r\n\r\nDisable the <GM> prefix for your character.'),('gmon',1,'Syntax: .gmon\r\n\r\nEnable the <GM> prefix for your character.'),('go',3,'Syntax: .go #position_x #position_y #position_z #mapid\r\n\r\nTeleport to the given coordinates on the specified map.'),('gocreature',2,'Syntax: .gocreature #creature_guid\r\nTeleport your character to creature with guid #creature_guid.'),('goobject',1,'Syntax: .goobject #object_guid\r\nTeleport your character to gameobject with guid #object_guid'),('goname',1,'Syntax: .goname $charactername\r\n\r\nTeleport to the given character. Either specify the character name or click on the character\'s portrait, e.g. when you are in a group.'),('goxy',3,'Syntax: .goxy #x #y [#mapid]\r\n\r\nTeleport player to point with (#x,#y) coordinates at ground(water) level at map #mapid or same map if #mapid not provided.'),('gps',1,'Syntax: .gps\r\n\r\nDisplay the position information for a selected character or creature. Position information includes X, Y, Z, and orientation, map Id and zone Id'),('guid',2,'Syntax: .guid\r\n\r\nDisplay the GUID for the selected character.'),('help',0,'Syntax: .help $command\r\n\r\nDisplay usage instructions for the given $command.'),('hidearea',3,'Syntax: .hidearea #areaid\r\n\r\nHide the area of #areaid to the selected character. If no character is selected, hide this area to you.'),('hover',3,'Syntax: .hover #flag\r\n\r\nEnable or disable hover mode for your character.\r\n\r\nUse a #flag of value 1 to enable, use a #flag value of 0 to disable hover.'),('idleshutdown',3,'Syntax: .idleshutdown #delay|cancel\r\n\r\nShut the server down after #delay seconds if no active connections are present (no players) or cancel the shutdown if cancel value is used.'),('info',0,'Syntax: .info\r\n\r\nDisplay the number of connected players.'),('itemmove',2,'Syntax: .itemmove #sourceslotid #destinationslotid\r\n\r\nMove an item from slots #sourceslotid to #destinationslotid in your inventory\r\n\r\nNot yet implemented'),('kick',2,'Syntax: .kick [$charactername]\r\n\r\nKick the given character name from the world. If no character name is provided then the selected player (except for yourself) will be kicked.'),('learn',3,'Syntax: .learn #parameter\r\n\r\nSelected character learn a spell of id #parameter. A GM can use .learn all if he wants to learn all default spells for Game Masters, .learn all_lang to learn all languages, and .learn all_myclass to learn all spells available for his class (Character selection in these cases ignored).'),('setskill',3,'Syntax: .setskill #skill #level [#max]\r\n\r\nSet a skill of id #skill with a current skill value of #level and a maximum value of #max (or equal current maximum if not provide) for the selected character. If no character is selected, you learn the skill.'),('levelup',3,'Syntax: .levelup [$playername] [#numberoflevels]\r\n\r\nIncrease/decrease the level of character with $playername (or the selected if not name provided) by #numberoflevels Or +1 if no #numberoflevels provided). If #numberoflevels is omitted, the level will be increase by 1. If #numberoflevels is 0, the same level will be restarted. If no character is selected and name not provided, increase your level. Command can be used for offline character. All stats and dependent values recalculated. At level decrease talents can be reset if need. Also at level decrease equipped items with greater level requirement can be lost.'),('linkgrave',3,'Syntax: .linkgrave #graveyard_id [alliance|horde]\r\n\r\nLink current zone to graveyard for any (or alliance/horde faction ghosts). This let character ghost from zone teleport to graveyard after die if graveyard is nearest from linked to zone and accept ghost of this faction. Add only single graveyard at another map and only if no graveyards linked (or planned linked at same map).'),('listcreature',3,'Syntax: .listcreature #creature_id [#max_count]\r\n\r\nOutput creatures with creature id #creature_id found in world. Output creature guids and coordinates sorted by distance from character. Will be output maximum #max_count creatures. If #max_count not provided use 10 as default value.'),('listitem',3,'Syntax: .listitem #item_id [#max_count]\r\n\r\nOutput items with item id #item_id found in all character inventories, mails and auctions. Output item guids, item owner guid, owner account and owner name. Will be output maximum #max_count items. If #max_count not provided use 10 as default value.'),('listobject',3,'Syntax: .listobject #gameobject_id [#max_count]\r\n\r\nOutput gameobjects with gameobject id #gameobject_id found in world. Output gameobject guids and coordinates sorted by distance from character. Will be output maximum #max_count gameobject. If #max_count not provided use 10 as default value.'),('loadscripts',3,'Syntax: .loadscripts $scriptlibraryname\r\n\r\nUnload current and load the script library $scriptlibraryname or reload current if $scriptlibraryname omitted, in case you changed it while the server was running.'),('lockaccount',0,'Syntax: .lockaccount [on|off]\r\n\r\nAllow login from account only from current used IP or remove this requirement.'),('lookupitem',3,'Syntax: .lookupitem $itemname\r\n\r\nLooks up an item by $itemname, and returns all matches with their Item ID\'s.'),('lookupitemset',3,'Syntax: .lookupitemset $itemname\r\n\r\nLooks up an item set by $itemname, and returns all matches with their Item set ID\'s.'),('lookupcreature',3,'Syntax: .lookupcreature $namepart\r\n\r\nLooks up a creature by $namepart, and returns all matches with their creature ID\'s.'),('lookupobject',3,'Syntax: .lookupobject $objname\r\n\r\nLooks up an gameobject by $objname, and returns all matches with their Gameobject ID\'s.'),('lookupquest',3,'Syntax: .lookupquest $namepart\r\n\r\nLooks up a quest by $namepart, and returns all matches with their quest ID\'s.'),('lookupskill',3,'Syntax: .lookupskill $$namepart\r\n\r\nLooks up a skill by $namepart, and returns all matches with their skill ID\'s.'),('lookupspell',3,'Syntax: .lookupspell $namepart\r\n\r\nLooks up a spell by $namepart, and returns all matches with their spell ID\'s.'),('lookuptele',1,'Syntax: .lookuptele $substring\r\n\r\nSearch and output all .tele command locations with provide $substring in name.'),('maxskill',3,'Syntax: .maxskill\r\nSets all skills of the targeted player to their maximum values for its current level.'),('Mod32Value',3,'Syntax: .Mod32Value #field #value\r\n\r\nAdd #value to field #field of your character.'),('modify',1,'Syntax: .modify $parameter $value\r\n\r\nModify the value of various parameters. Use .help modify $parameter to get help on specific parameter usage.\r\n\r\nSupported parameters include hp, mana, rage, energy, money, speed, swim, scale, bit, bwalk, aspeed, faction, spell and tp.'),('modify aspeed',1,'Syntax: .modify aspeed #rate\r\n\r\nModify all speeds -run,swim,run back,swim back- of the selected player to \"normalbase speed for this move type\"*rate. If no player is selected, modify your speed.\r\n\r\n #rate may range from 0.1 to 10.'),('modify bit',1,'Syntax: .modify bit #field #bit\r\n\r\nToggle the #bit bit of the #field field for the selected player. If no player is selected, modify your character.'),('modify bwalk',1,'Syntax: .modify bwalk #rate\r\n\r\nModify the speed of the selected player while running backwards to \"normal walk back speed\"*rate. If no player is selected, modify your speed.\r\n\r\n #rate may range from 0.1 to 10.'),('modify energy',1,'Syntax: .modify energy #energy\r\n\r\nModify the energy of the selected player. If no player is selected, modify your energy.'),('modify faction',1,'Syntax: .modify faction #factionid #flagid #npcflagid #dynamicflagid\r\n\r\nModify the faction and flags of the selected creature. Without arguments, display the faction and flags of the selected creature.'),('modify money',1,'Syntax:\r\n.modify money #money\r\n.money #money\r\n\r\nAdd or remove money to the selected player. If no player is selected, modify your money.\r\n\r\n #gold can be negative to remove money.'),('modify hp',1,'Syntax: .modify hp #newhp\r\n\r\nModify the hp of the selected player. If no player is selected, modify your hp.'),('modify mana',1,'Syntax: .modify mana #newmana\r\n\r\nModify the mana of the selected player. If no player is selected, modify your mana.'),('modify rage',1,'Syntax: .modify rage #newrage\r\n\r\nModify the rage of the selected player. If no player is selected, modify your rage.'),('modify scale',1,''),('modify speed',1,'Syntax:\r\n.modify speed #rate\r\n.speed #rate\r\n\r\nModify the running speed of the selected player to \"normal base run speed\"*rate. If no player is selected, modify your speed.\r\n\r\n #rate may range from 0.1 to 10.'),('modify spell',1,''),('modify swim',1,'Syntax: .modify swim #rate\r\n\r\nModify the swim speed of the selected player to \"normal swim speed\"*rate. If no player is selected, modify your speed.\r\n\r\n #rate may range from 0.1 to 10.'),('money',1,'Syntax:\r\n.modify money #money\r\n.money #money\r\n\r\nAdd or remove money to the selected player. If no player is selected, modify your money.\r\n\r\n #gold can be negative to remove money.'),('morph',3,'Syntax: .morph #displayid\r\n\r\nChange your current model id to #displayid.'),('moveobject',2,'Syntax: .moveobject #goguid [#x #y #z]\r\n\r\nMove gameobject #goguid to character coordinates (or to (#x,#y,#z) coordinates if its provide).'),('name',2,'Syntax: .name $name\r\n\r\nChange the name of the selected creature or character to $name.\r\n\r\nCommand disabled.'),('namego',1,'Syntax: .namego $charactername\r\n\r\nTeleport the given character to you. Either specify the character name or click on the player\'s portrait, e.g. when you are in a group.'),('neargrave',3,'Syntax: .neargrave [alliance|horde]\r\n\r\nFind nearest graveyard linked to zone (or only nearest from accepts alliance or horde faction ghosts).'),('NewMail',3,'Syntax: .NewMail #flag\r\n\r\nSend a new mail notification with flag #flag.'),('npcflag',2,'Syntax: .npcflag #npcflag\r\n\r\nSet the NPC flags of creature template of the selected creature and selected creature to #npcflag. NPC flags will applied to all creatures of selected creature template after server restart or grid unload/load.'),('npcinfo',3,'Syntax: .npcinfo\r\n\r\nDisplay a list of details for the selected creature.\r\n\r\nThe list includes:\r\n- GUID, Faction, NPC flags, Entry ID, Model ID,\r\n- Level,\r\n- Health (current/maximum),\n\r\n- Field flags, dynamic flags, faction template, \r\n- Position information,\r\n- and the creature type, e.g. if the creature is a vendor.'),('npcinfoset',3,'Syntax: .npcinfoset\r\n\r\nTODO: Write me.'),('object',3,'Syntax: .object #displayid $save\r\n\r\nAdd a new object of type mailbox with the display id of #displayid to your current position. If $save is set to \'true\', save the object in the database.'),('password',0,'Syntax: .password $old_password $new_password $new_password\r\n\r\nChange your account password.'),('pinfo',2,'Syntax: .pinfo [$player_name] [rep]\r\n\r\nOutput account information for selected player or player find by $player_name. If \"rep\" parameter provided show reputation information for player.'),('playsound',1,'Syntax: .playsound #soundid\r\n\r\nPlay sound with #soundid.\r\nSound will be play only for you. Other players do not hear this.\r\nWarning: client may have more 5000 sounds...'),('prog',2,'Syntax: .prog\r\n\r\nTeleport you to Programmers Island.'),('QNM',3,'Syntax: .QNM #flag\r\n\r\nQuery next mail time with flag #flag.'),('recall',1,'Syntax: .recall [$playername]\r\n\r\nTeleport $playername or selected player to the place where he has been before last use of a teleportation command. If no $playername is entered and no player is selected, it will teleport you.'),('reload',3,'Not yet implemented.'),('removequest',3,'Syntax: .removequest #quest_id\r\n\r\nSet quest #quest_id state to not completed and not active (and remove from active quest list) for selected player.'),('reset',3,'Syntax:\r\n.reset level\r\n  Reset level to 1 including reset stats and talents.  Equipped items with greater level requirement can be lost.\r\n.reset spells\r\n  Removes all non-original spells from spellbook.\r\n.reset stats\r\n  Resets(recalculate) all stats of the targeted player to their original values at current level.\r\n.reset talents\r\n  Removes all talents of the targeted player.'),('respawn',3,'Syntax: .respawn\r\n\r\nRespawn all nearest creatures and GO without waiting respawn time expiration.'),('revive',3,'Syntax: .revive\r\n\r\nRevive the selected player. If no player is selected, it will revive you.'),('run',2,'Syntax: .run #flag\r\n\r\nEnable or disable running movement for a selected creature.\r\n\r\nUse a #flag of value 1 to enable, use a #flag value of 0 to disable running. Not yet implemented.'),('save',0,'Syntax: .save\r\n\r\nSaves your character.'),('saveall',1,'Syntax: .saveall\r\n\r\nSave all characters in game.'),('security',3,'Syntax: .security $name #level\r\n\r\nSet the security level of player $name to a level of #level.\r\n\r\n#level may range from 0 to 5.'),('setmovetype',2,'Syntax: .setmovetype [#creature_guid] stay/random/way\r\n\r\nSet for creature pointed by #creature_guid (or selected if #creature_guid not provided) movement type and move it to respawn position (if creature alive). Any existed waypoints for creature will be removed from database. If creature is dead then movement type will aplied at creature respawm.'),('setvalue',3,'Syntax: .setvalue #field #value #isInt\r\n\r\nSet the field #field of the selected creature with value #value. If no creature is selected, set the content of your field.\r\n\r\nUse a #isInt of value 1 if #value is an integer.'),('showarea',3,'Syntax: .showarea #areaid\r\n\r\nReveal the area of #areaid to the selected character. If no character is selected, reveal this area to you.'),('showhonor',0,'Syntax: .showhonor\r\n\r\nDisplay your honor ranking.'),('shutdown',3,'Syntax: .shutdown seconds'),('speed',1,'Syntax:\r\n.modify speed #rate\r\n.speed #rate\r\n\r\nModify the running speed of the selected player to \"normal base run speed\"*rate. If no player is selected, modify your speed.\r\n\r\n #rate may range from 0.1 to 10.'),('standstate',3,'Syntax: .standstate #emoteid\r\n\r\nChange the emote of your character while standing to #emoteid.'),('start',0,'Syntax: .start\r\n\r\nTeleport you to the starting area of your character.'),('subname',2,'Syntax: .subname $Name\r\n\r\nChange the subname of the selected creature or player to $Name.\r\n\r\nCommand disabled.'),('targetobject',2,'Syntax: .targetobject [#go_id|#go_name_part]\r\n\r\nLocate and show position nearest gameobject. If #go_id or #go_name_part provide then locate and show position of nearest gameobject with gameobject template id #go_id or name included #go_name_part as part.'),('taxicheat',1,'Syntax: .taxicheat #flag\r\n\r\nTemporary grant access or remove to all taxi routes for the selected character. If no character is selected, hide or reveal all routes to you.\r\n\r\nUse a #flag of value 1 to add access, use a #flag value of 0 to remove access. Visited taxi nodes sill accessible after removing access.'),('ticket',2,'Syntax: .ticket on\r\n        .ticket off\r\n        .ticket #num\r\n        .ticket $character_name\r\n\r\non/off for GMs to show or not a new ticket directly, $character_name to show ticket of this character, #num to show ticket #num.'),('transport',3,'Not yet implemented.'),('turnobject',2,'Syntax: .turnobject #goguid \r\n\r\nSet for gameobject #goguid orientation same as current character orientation.'),('unaura',3,'Syntax: .unaura #spellid\r\n\r\nRemove aura due to spell #spellid from the selected Unit.'),('unbanaccount',3,'Syntax: .unbanaccount $name\r\n\r\nUnban account $name.'),('unbanip',3,'Syntax: .unbanip #ip\r\n\r\nUnban the provided IP address from the server.'),('unlearn',3,'Syntax: .unlearn #startspell #endspell\r\n\r\nUnlearn for selected player the range of spells between id #startspell and #endspell. If no #endspell is provided, just unlearn spell of id #startspell.'),('update',3,'Syntax: .update #field #value\r\n\r\nUpdate the field #field of the selected character or creature with value #value.\r\n\r\nIf no #value is provided, display the content of field #field.'),('visible',1,'Syntax: .visible [0||1]\r\n\r\nOutput current visibility state or make GM visible(1) and invisible(0) for other players.'),('wchange',3,'Syntax: .wchange #weathertype #status\r\n\r\nSet current weather to #weathertype with an intensity of #status.\r\n\r\n#weathertype can be 1 for rain, 2 for snow, and 3 for sand. #status can be 0 for disabled, and 1 for enabled.'),('worldport',3,'Syntax: .worldport #map #position_x #position_y #position_z\r\n\r\nTeleport to the given coordinates on the specified continent (map).'),('whispers',1,'Syntax: .whispers on|off\r\nEnable/disable accepting whispers by GM from players. By default use mangosd.conf setting.'),('spawndist',2,'Syntax: .spawndist #dist\r\n\r\nAdjust spawndistance of selected creature to dist.'),('spawntime',2,'Syntax: .spawntime #time \r\n\r\nAdjust spawntime of selected creature to time.');
UNLOCK TABLES;
/*!40000 ALTER TABLE `command` ENABLE KEYS */;

--
-- Table structure for table `corpse`
--

DROP TABLE IF EXISTS `corpse`;
CREATE TABLE `corpse` (
  `guid` int(11) unsigned NOT NULL default '0' COMMENT 'Global Unique Identifier',
  `player` int(11) unsigned NOT NULL default '0' COMMENT 'Character Global Unique Identifier',
  `position_x` float NOT NULL default '0',
  `position_y` float NOT NULL default '0',
  `position_z` float NOT NULL default '0',
  `orientation` float NOT NULL default '0',
  `zone` int(11) unsigned NOT NULL default '38' COMMENT 'Zone Identifier',
  `map` int(11) unsigned NOT NULL default '0' COMMENT 'Map Identifier',
  `data` longtext,
  `time` timestamp NOT NULL default '0000-00-00 00:00:00',
  `bones_flag` tinyint(3) NOT NULL default '0',
  `instance` int(11) unsigned NOT NULL default '0',
  PRIMARY KEY  (`guid`),
  KEY `idx_bones_flag` (`bones_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Death System';

--
-- Dumping data for table `corpse`
--


/*!40000 ALTER TABLE `corpse` DISABLE KEYS */;
LOCK TABLES `corpse` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `corpse` ENABLE KEYS */;

--
-- Table structure for table `corpse_grid`
--

DROP TABLE IF EXISTS `corpse_grid`;
CREATE TABLE `corpse_grid` (
  `guid` int(11) unsigned NOT NULL default '0' COMMENT 'Global Unique Identifier',
  `position_x` int(11) NOT NULL default '0',
  `position_y` int(11) NOT NULL default '0',
  `cell_position_x` int(11) NOT NULL default '0',
  `cell_position_y` int(11) NOT NULL default '0',
  `grid` int(11) unsigned NOT NULL default '0' COMMENT 'Grid Identifier',
  `cell` int(11) unsigned NOT NULL default '0' COMMENT 'Cell Identifier',
  `map` int(11) unsigned NOT NULL default '0' COMMENT 'Map Identifier',
  UNIQUE KEY `idx_search` (`grid`,`cell`,`map`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Grid System';

--
-- Dumping data for table `corpse_grid`
--


/*!40000 ALTER TABLE `corpse_grid` DISABLE KEYS */;
LOCK TABLES `corpse_grid` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `corpse_grid` ENABLE KEYS */;

--
-- Table structure for table `creature`
--

DROP TABLE IF EXISTS `creature`;
CREATE TABLE `creature` (
  `guid` int(11) unsigned NOT NULL auto_increment COMMENT 'Global Unique Identifier',
  `id` int(11) unsigned NOT NULL default '0' COMMENT 'Creature Identifier',
  `map` int(11) unsigned NOT NULL default '0' COMMENT 'Map Identifier',
  `position_x` float NOT NULL default '0',
  `position_y` float NOT NULL default '0',
  `position_z` float NOT NULL default '0',
  `orientation` float NOT NULL default '0',
  `spawntimesecs` int(11) unsigned NOT NULL default '120',
  `spawndist` float NOT NULL default '5',
  `currentwaypoint` int(11) unsigned NOT NULL default '0',
  `spawn_position_x` float NOT NULL default '0',
  `spawn_position_y` float NOT NULL default '0',
  `spawn_position_z` float NOT NULL default '0',
  `spawn_orientation` float NOT NULL default '0',
  `curhealth` int(11) unsigned NOT NULL default '1',
  `curmana` int(11) unsigned NOT NULL default '0',
  `state` tinyint(3) unsigned NOT NULL default '0',
  `MovementType` tinyint(3) unsigned NOT NULL default '0',
  `auras` longtext,
  PRIMARY KEY  (`guid`),
  KEY `idx_map` (`map`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Creature System';

--
-- Dumping data for table `creature`
--


/*!40000 ALTER TABLE `creature` DISABLE KEYS */;
LOCK TABLES `creature` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `creature` ENABLE KEYS */;

--
-- Table structure for table `creature_grid`
--

DROP TABLE IF EXISTS `creature_grid`;
CREATE TABLE `creature_grid` (
  `guid` int(11) unsigned NOT NULL default '0' COMMENT 'Global Unique Identifier',
  `position_x` int(11) NOT NULL default '0',
  `position_y` int(11) NOT NULL default '0',
  `cell_position_x` int(11) NOT NULL default '0',
  `cell_position_y` int(11) NOT NULL default '0',
  `grid` int(11) unsigned NOT NULL default '0' COMMENT 'Grid Identifier',
  `cell` int(11) unsigned NOT NULL default '0' COMMENT 'Cell Identifier',
  `map` int(11) unsigned NOT NULL default '0' COMMENT 'Map Identifier',
  UNIQUE KEY `idx_search` (`grid`,`cell`,`map`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Exploration System';

--
-- Dumping data for table `creature_grid`
--


/*!40000 ALTER TABLE `creature_grid` DISABLE KEYS */;
LOCK TABLES `creature_grid` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `creature_grid` ENABLE KEYS */;

--
-- Table structure for table `creature_involvedrelation`
--

DROP TABLE IF EXISTS `creature_involvedrelation`;
CREATE TABLE `creature_involvedrelation` (
  `id` int(11) unsigned NOT NULL default '0' COMMENT 'Identifier',
  `quest` int(11) unsigned NOT NULL default '0' COMMENT 'Quest Identifier',
  PRIMARY KEY  (`id`,`quest`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Creature System';

--
-- Dumping data for table `creature_involvedrelation`
--


/*!40000 ALTER TABLE `creature_involvedrelation` DISABLE KEYS */;
LOCK TABLES `creature_involvedrelation` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `creature_involvedrelation` ENABLE KEYS */;

--
-- Table structure for table `creature_loot_template`
--

DROP TABLE IF EXISTS `creature_loot_template`;
CREATE TABLE `creature_loot_template` (
  `entry` int(11) unsigned NOT NULL default '0',
  `item` int(11) unsigned NOT NULL default '0',
  `ChanceOrRef` float NOT NULL default '100',
  `QuestChanceOrGroup` tinyint(3) NOT NULL default '0',
  `mincount` tinyint(3) unsigned NOT NULL default '1',
  `maxcount` tinyint(3) unsigned NOT NULL default '1',
  `quest_freeforall` tinyint(3) unsigned NOT NULL default '1',
  PRIMARY KEY  (`entry`,`item`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Loot System';

--
-- Dumping data for table `creature_loot_template`
--


/*!40000 ALTER TABLE `creature_loot_template` DISABLE KEYS */;
LOCK TABLES `creature_loot_template` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `creature_loot_template` ENABLE KEYS */;

--
-- Table structure for table `creature_movement`
--

DROP TABLE IF EXISTS `creature_movement`;
CREATE TABLE `creature_movement` (
  `id` int(11) unsigned NOT NULL default '0' COMMENT 'Identifier',
  `point` int(11) unsigned NOT NULL default '0',
  `position_x` float NOT NULL default '0',
  `position_y` float NOT NULL default '0',
  `position_z` float NOT NULL default '0',
  `waittime` tinyint(3) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`,`point`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Creature System';

--
-- Dumping data for table `creature_movement`
--


/*!40000 ALTER TABLE `creature_movement` DISABLE KEYS */;
LOCK TABLES `creature_movement` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `creature_movement` ENABLE KEYS */;


--
-- Table structure for table `creature_onkill_reputation`
--

DROP TABLE IF EXISTS `creature_onkill_reputation`;
CREATE TABLE `creature_onkill_reputation` (
  `creature_id` int(10) unsigned NOT NULL default '0' COMMENT 'Creature Identifier',
  `RewOnKillRepFaction1` int(10) default '0',
  `RewOnKillRepFaction2` int(10) default '0',
  `MaxStanding1` int(1) default '0',
  `IsTeamAward1` int(1) default '0',
  `RewOnKillRepValue1` int(10) default '0',
  `MaxStanding2` int(1) default '0',
  `IsTeamAward2` int(1) default '0',
  `RewOnKillRepValue2` int(10) default '0',
  PRIMARY KEY (`creature_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Creature OnKill Reputation gain';

--
-- Dumping data for table `creature_onkill_reputation`
--


/*!40000 ALTER TABLE `creature_onkill_reputation` DISABLE KEYS */;
LOCK TABLES `creature_onkill_reputation` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `creature_onkill_reputation` ENABLE KEYS */;


--
-- Table structure for table `creature_questrelation`
--

DROP TABLE IF EXISTS `creature_questrelation`;
CREATE TABLE `creature_questrelation` (
  `id` int(11) unsigned NOT NULL default '0' COMMENT 'Identifier',
  `quest` int(11) unsigned NOT NULL default '0' COMMENT 'Quest Identifier',
  PRIMARY KEY  (`id`,`quest`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Creature System';

--
-- Dumping data for table `creature_questrelation`
--


/*!40000 ALTER TABLE `creature_questrelation` DISABLE KEYS */;
LOCK TABLES `creature_questrelation` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `creature_questrelation` ENABLE KEYS */;

--
-- Table structure for table `creature_respawn`
--

DROP TABLE IF EXISTS `creature_respawn`;
CREATE TABLE `creature_respawn` (
  `guid` int(11) unsigned NOT NULL default '0' COMMENT 'Global Unique Identifier',
  `respawntime` bigint(40) NOT NULL default '0',
  `instance` int(11) unsigned NOT NULL default '0',
  PRIMARY KEY  (`guid`, `instance`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Grid Loading System';

--
-- Dumping data for table `creature_respawn`
--


/*!40000 ALTER TABLE `creature_respawn` DISABLE KEYS */;
LOCK TABLES `creature_respawn` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `creature_respawn` ENABLE KEYS */;

--
-- Table structure for table `creature_template`
--

DROP TABLE IF EXISTS `creature_template`;
CREATE TABLE `creature_template` (
  `entry` int(11) unsigned NOT NULL default '0',
  `modelid_m` int(11) unsigned default '0',
  `modelid_f` int(11) unsigned default '0',
  `name` varchar(100) NOT NULL default '0',
  `subname` varchar(100) default NULL,
  `minlevel` tinyint(3) unsigned default '1',
  `maxlevel` tinyint(3) unsigned default '1',
  `minhealth` int(5) unsigned default '0',
  `maxhealth` int(5) unsigned default '0',
  `minmana` int(5) unsigned default '0',
  `maxmana` int(5) unsigned default '0',
  `armor` int(10) unsigned NOT NULL default '0',
  `faction` int(4) unsigned default '0',
  `npcflag` int(4) unsigned default '0',
  `speed` float default '0',
  `rank` tinyint(3) unsigned default '0',
  `mindmg` float default '0',
  `maxdmg` float default '0',
  `attackpower` int(10) unsigned NOT NULL default '0',
  `baseattacktime` int(4) unsigned default '0',
  `rangeattacktime` int(4) unsigned default '0',
  `flags` int(11) unsigned default '0',
  `mount` int(5) unsigned default '0',
  `dynamicflags` int(11) unsigned default '0',
  `size` float default '0',
  `family` int(11) default '0',
  `bounding_radius` float default '0',
  `trainer_type` tinyint(3) default '0',
  `trainer_spell` int(11) unsigned default '0',
  `class` tinyint(3) unsigned default '0',
  `race` tinyint(3) unsigned default '0',
  `minrangedmg` float NOT NULL default '0',
  `maxrangedmg` float NOT NULL default '0',
  `rangedattackpower` smallint(5) unsigned NOT NULL default '0',
  `combat_reach` float NOT NULL default '0',
  `type` tinyint(3) unsigned default '0',
  `civilian` tinyint(3) unsigned NOT NULL default '0',
  `flag1` int(11) unsigned default '0',
  `equipmodel1` int(10) unsigned NOT NULL default '0',
  `equipmodel2` int(10) unsigned NOT NULL default '0',
  `equipmodel3` int(10) unsigned NOT NULL default '0',
  `equipinfo1` int(10) unsigned NOT NULL default '0',
  `equipinfo2` int(10) unsigned NOT NULL default '0',
  `equipinfo3` int(10) unsigned NOT NULL default '0',
  `equipslot1` int(10) unsigned NOT NULL default '0',
  `equipslot2` int(10) unsigned NOT NULL default '0',
  `equipslot3` int(10) unsigned NOT NULL default '0',
  `lootid` int(10) unsigned NOT NULL default '0',
  `pickpocketloot` int(10) unsigned NOT NULL default '0',
  `skinloot` int(10) unsigned NOT NULL default '0',
  `resistance1` int(10) unsigned NOT NULL default '0',
  `resistance2` int(10) unsigned NOT NULL default '0',
  `resistance3` int(10) unsigned NOT NULL default '0',
  `resistance4` int(10) unsigned NOT NULL default '0',
  `resistance5` int(10) unsigned NOT NULL default '0',
  `resistance6` int(10) unsigned NOT NULL default '0',
  `spell1` int(11) unsigned NOT NULL default '0',
  `spell2` int(11) unsigned NOT NULL default '0',
  `spell3` int(11) unsigned NOT NULL default '0',
  `spell4` int(11) unsigned NOT NULL default '0',
  `mingold` int(30) unsigned NOT NULL default '0',
  `maxgold` int(30) unsigned NOT NULL default '0',
  `AIName` varchar(128) NOT NULL default '',
  `MovementType` tinyint(3) unsigned NOT NULL default '0',
  `InhabitType` tinyint(1) unsigned NOT NULL default '3',
  `ScriptName` varchar(128) NOT NULL default '',
  PRIMARY KEY  (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Creature System';

--
-- Dumping data for table `creature_template`
--


/*!40000 ALTER TABLE `creature_template` DISABLE KEYS */;
LOCK TABLES `creature_template` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `creature_template` ENABLE KEYS */;

--
-- Table structure for table `disenchant_loot_template`
--

DROP TABLE IF EXISTS `disenchant_loot_template`;
CREATE TABLE `disenchant_loot_template` (
  `entry` int(11) unsigned NOT NULL default '0' COMMENT 'Recommended id selection: item_level*100 + item_quality',
  `item` int(11) unsigned NOT NULL default '0',
  `ChanceOrRef` float NOT NULL default '100',
  `QuestChanceOrGroup` tinyint(3) NOT NULL default '0',
  `mincount` tinyint(3) unsigned NOT NULL default '1',
  `maxcount` tinyint(3) unsigned NOT NULL default '1',
  `quest_freeforall` tinyint(3) unsigned NOT NULL default '1',
  PRIMARY KEY  (`entry`,`item`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Loot System';

--
-- Dumping data for table `disenchant_loot_template`
--


/*!40000 ALTER TABLE `disenchant_loot_template` DISABLE KEYS */;
LOCK TABLES `disenchant_loot_template` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `disenchant_loot_template` ENABLE KEYS */;

--
-- Table structure for table `fishing_loot_template`
--

DROP TABLE IF EXISTS `fishing_loot_template`;
CREATE TABLE `fishing_loot_template` (
  `entry` int(11) unsigned NOT NULL default '0',
  `item` int(11) unsigned NOT NULL default '0',
  `ChanceOrRef` float NOT NULL default '100',
  `QuestChanceOrGroup` tinyint(3) NOT NULL default '0',
  `mincount` tinyint(3) unsigned NOT NULL default '1',
  `maxcount` tinyint(3) unsigned NOT NULL default '1',
  `quest_freeforall` tinyint(3) unsigned NOT NULL default '1',
  PRIMARY KEY  (`entry`,`item`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Loot System';

--
-- Dumping data for table `fishing_loot_template`
--


/*!40000 ALTER TABLE `fishing_loot_template` DISABLE KEYS */;
LOCK TABLES `fishing_loot_template` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `fishing_loot_template` ENABLE KEYS */;

--
-- Table structure for table `game_graveyard_zone`
--

DROP TABLE IF EXISTS `game_graveyard_zone`;
CREATE TABLE `game_graveyard_zone` (
  `id` int(11) unsigned NOT NULL default '0',
  `ghost_map` int(11) unsigned NOT NULL default '0',
  `ghost_zone` int(11) unsigned NOT NULL default '0',
  `faction` int(11) unsigned NOT NULL default '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Trigger System';

--
-- Dumping data for table `game_graveyard_zone`
--


/*!40000 ALTER TABLE `game_graveyard_zone` DISABLE KEYS */;
LOCK TABLES `game_graveyard_zone` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `game_graveyard_zone` ENABLE KEYS */;

--
-- Table structure for table `game_tele`
--

DROP TABLE IF EXISTS `game_tele`;
CREATE TABLE `game_tele` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `position_x` float NOT NULL default '0',
  `position_y` float NOT NULL default '0',
  `position_z` float NOT NULL default '0',
  `orientation` float NOT NULL default '0',
  `map` int(11) unsigned NOT NULL default '0',
  `name` varchar(100) NOT NULL default '',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Tele Command';

--
-- Dumping data for table `game_tele`
--


/*!40000 ALTER TABLE `game_tele` DISABLE KEYS */;
LOCK TABLES `game_tele` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `game_tele` ENABLE KEYS */;

--
-- Table structure for table `game_weather`
--

DROP TABLE IF EXISTS `game_weather`;
CREATE TABLE `game_weather` (
  `zone` int(11) unsigned NOT NULL default '0',
  `spring_rain_chance` tinyint(3) unsigned NOT NULL default '25',
  `spring_snow_chance` tinyint(3) unsigned NOT NULL default '25',
  `spring_storm_chance` tinyint(3) unsigned NOT NULL default '25',
  `summer_rain_chance` tinyint(3) unsigned NOT NULL default '25',
  `summer_snow_chance` tinyint(3) unsigned NOT NULL default '25',
  `summer_storm_chance` tinyint(3) unsigned NOT NULL default '25',
  `fall_rain_chance` tinyint(3) unsigned NOT NULL default '25',
  `fall_snow_chance` tinyint(3) unsigned NOT NULL default '25',
  `fall_storm_chance` tinyint(3) unsigned NOT NULL default '25',
  `winter_rain_chance` tinyint(3) unsigned NOT NULL default '25',
  `winter_snow_chance` tinyint(3) unsigned NOT NULL default '25',
  `winter_storm_chance` tinyint(3) unsigned NOT NULL default '25',
  PRIMARY KEY  (`zone`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Weather System';

--
-- Dumping data for table `game_weather`
--


/*!40000 ALTER TABLE `game_weather` DISABLE KEYS */;
LOCK TABLES `game_weather` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `game_weather` ENABLE KEYS */;

--
-- Table structure for table `gameobject`
--

DROP TABLE IF EXISTS `gameobject`;
CREATE TABLE `gameobject` (
  `guid` int(11) unsigned NOT NULL auto_increment COMMENT 'Global Unique Identifier',
  `id` int(11) unsigned NOT NULL default '0' COMMENT 'Gameobject Identifier',
  `map` int(11) unsigned NOT NULL default '0' COMMENT 'Map Identifier',
  `position_x` float NOT NULL default '0',
  `position_y` float NOT NULL default '0',
  `position_z` float NOT NULL default '0',
  `orientation` float NOT NULL default '0',
  `rotation0` float NOT NULL default '0',
  `rotation1` float NOT NULL default '0',
  `rotation2` float NOT NULL default '0',
  `rotation3` float NOT NULL default '0',
  `loot` int(11) unsigned NOT NULL default '0',
  `spawntimesecs` int(11) unsigned NOT NULL default '0',
  `animprogress` int(11) unsigned NOT NULL default '0',
  `dynflags` int(11) unsigned NOT NULL default '0',
  PRIMARY KEY  (`guid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Gameobject System';

--
-- Dumping data for table `gameobject`
--


/*!40000 ALTER TABLE `gameobject` DISABLE KEYS */;
LOCK TABLES `gameobject` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `gameobject` ENABLE KEYS */;

--
-- Table structure for table `gameobject_grid`
--

DROP TABLE IF EXISTS `gameobject_grid`;
CREATE TABLE `gameobject_grid` (
  `guid` int(11) unsigned NOT NULL default '0' COMMENT 'Global Unique Identifier',
  `position_x` int(11) NOT NULL default '0',
  `position_y` int(11) NOT NULL default '0',
  `cell_position_x` int(11) NOT NULL default '0',
  `cell_position_y` int(11) NOT NULL default '0',
  `grid` int(11) unsigned NOT NULL default '0' COMMENT 'Grid Identifier',
  `cell` int(11) unsigned NOT NULL default '0' COMMENT 'Cell Identifier',
  `map` int(11) unsigned NOT NULL default '0' COMMENT 'Map Identifier',
  UNIQUE KEY `idx_search` (`grid`,`cell`,`map`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Grid System';

--
-- Dumping data for table `gameobject_grid`
--


/*!40000 ALTER TABLE `gameobject_grid` DISABLE KEYS */;
LOCK TABLES `gameobject_grid` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `gameobject_grid` ENABLE KEYS */;

--
-- Table structure for table `gameobject_involvedrelation`
--

DROP TABLE IF EXISTS `gameobject_involvedrelation`;
CREATE TABLE `gameobject_involvedrelation` (
  `id` int(11) unsigned NOT NULL default '0',
  `quest` int(11) unsigned NOT NULL default '0' COMMENT 'Quest Identifier',
  PRIMARY KEY  (`id`,`quest`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `gameobject_involvedrelation`
--


/*!40000 ALTER TABLE `gameobject_involvedrelation` DISABLE KEYS */;
LOCK TABLES `gameobject_involvedrelation` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `gameobject_involvedrelation` ENABLE KEYS */;

--
-- Table structure for table `gameobject_loot_template`
--

DROP TABLE IF EXISTS `gameobject_loot_template`;
CREATE TABLE `gameobject_loot_template` (
  `entry` int(11) unsigned NOT NULL default '0',
  `item` int(11) unsigned NOT NULL default '0',
  `ChanceOrRef` float NOT NULL default '100',
  `QuestChanceOrGroup` tinyint(3) NOT NULL default '0',
  `mincount` tinyint(3) unsigned NOT NULL default '1',
  `maxcount` tinyint(3) unsigned NOT NULL default '1',
  `quest_freeforall` tinyint(3) unsigned NOT NULL default '1',
  PRIMARY KEY  (`entry`,`item`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Loot System';

--
-- Dumping data for table `gameobject_loot_template`
--


/*!40000 ALTER TABLE `gameobject_loot_template` DISABLE KEYS */;
LOCK TABLES `gameobject_loot_template` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `gameobject_loot_template` ENABLE KEYS */;

--
-- Table structure for table `gameobject_questrelation`
--

DROP TABLE IF EXISTS `gameobject_questrelation`;
CREATE TABLE `gameobject_questrelation` (
  `id` int(11) unsigned NOT NULL default '0',
  `quest` int(11) unsigned NOT NULL default '0' COMMENT 'Quest Identifier',
  PRIMARY KEY  (`id`,`quest`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `gameobject_questrelation`
--


/*!40000 ALTER TABLE `gameobject_questrelation` DISABLE KEYS */;
LOCK TABLES `gameobject_questrelation` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `gameobject_questrelation` ENABLE KEYS */;

--
-- Table structure for table `gameobject_respawn`
--

DROP TABLE IF EXISTS `gameobject_respawn`;
CREATE TABLE `gameobject_respawn` (
  `guid` int(11) unsigned NOT NULL default '0' COMMENT 'Global Unique Identifier',
  `respawntime` bigint(40) NOT NULL default '0',
  `instance` int(11) unsigned NOT NULL default '0',
  PRIMARY KEY  (`guid`, `instance`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Grid Loading System';

--
-- Dumping data for table `gameobject_respawn`
--


/*!40000 ALTER TABLE `gameobject_respawn` DISABLE KEYS */;
LOCK TABLES `gameobject_respawn` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `gameobject_respawn` ENABLE KEYS */;

--
-- Table structure for table `gameobject_template`
--

DROP TABLE IF EXISTS `gameobject_template`;
CREATE TABLE `gameobject_template` (
  `entry` int(20) unsigned NOT NULL default '0',
  `type` int(11) unsigned NOT NULL default '0',
  `displayId` int(11) unsigned NOT NULL default '0',
  `name` varchar(100) NOT NULL default '0',
  `faction` int(4) unsigned NOT NULL default '0',
  `flags` int(4) unsigned NOT NULL default '0',
  `size` float NOT NULL default '1',
  `sound0` int(11) unsigned NOT NULL default '0',
  `sound1` int(11) unsigned NOT NULL default '0',
  `sound2` int(11) unsigned NOT NULL default '0',
  `sound3` int(11) unsigned NOT NULL default '0',
  `sound4` int(11) unsigned NOT NULL default '0',
  `sound5` int(11) unsigned NOT NULL default '0',
  `sound6` int(11) unsigned NOT NULL default '0',
  `sound7` int(11) unsigned NOT NULL default '0',
  `sound8` int(11) unsigned NOT NULL default '0',
  `sound9` int(11) unsigned NOT NULL default '0',
  `ScriptName` varchar(100) NOT NULL default '',
  PRIMARY KEY  (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Gameobject System';

--
-- Dumping data for table `gameobject_template`
--


/*!40000 ALTER TABLE `gameobject_template` DISABLE KEYS */;
LOCK TABLES `gameobject_template` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `gameobject_template` ENABLE KEYS */;

--
-- Table structure for table `group`
--

DROP TABLE IF EXISTS `group`;
CREATE TABLE `group` (
  `leaderGuid` int(11) NOT NULL,
  `lootMethod` tinyint(4) NOT NULL,
  `looterGuid` int(11) NOT NULL,
  `icon1` bigint(20) NOT NULL,
  `icon2` bigint(20) NOT NULL,
  `icon3` bigint(20) NOT NULL,
  `icon4` bigint(20) NOT NULL,
  `icon5` bigint(20) NOT NULL,
  `icon6` bigint(20) NOT NULL,
  `icon7` bigint(20) NOT NULL,
  `icon8` bigint(20) NOT NULL,
  `isRaid` TINYINT( 1 ) NOT NULL,
  PRIMARY KEY  (`leaderGuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Groups';

--
-- Dumping data for table `group`
--


/*!40000 ALTER TABLE `group` DISABLE KEYS */;
LOCK TABLES `group` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `group` ENABLE KEYS */;

--
-- Table structure for table `group_member`
--

DROP TABLE IF EXISTS `group_member`;
CREATE TABLE `group_member` (
  `leaderGuid` int(11) NOT NULL,
  `memberGuid` int(11) NOT NULL,
  `assistant` tinyint(1) NOT NULL,
  `subgroup` smallint(6) NOT NULL,
  PRIMARY KEY  (`leaderGuid`,`memberGuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Groups';

--
-- Dumping data for table `group_member`
--


/*!40000 ALTER TABLE `group_member` DISABLE KEYS */;
LOCK TABLES `group_member` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `group_member` ENABLE KEYS */;

--
-- Table structure for table `guild`
--

DROP TABLE IF EXISTS `guild`;
CREATE TABLE `guild` (
  `guildid` int(6) unsigned NOT NULL default '0',
  `name` varchar(255) NOT NULL default '',
  `leaderguid` int(6) unsigned NOT NULL default '0',
  `EmblemStyle` int(5) unsigned NOT NULL default '0',
  `EmblemColor` int(5) unsigned NOT NULL default '0',
  `BorderStyle` int(5) unsigned NOT NULL default '0',
  `BorderColor` int(5) unsigned NOT NULL default '0',
  `BackgroundColor` int(5) unsigned NOT NULL default '0',
  `info` text NOT NULL,
  `MOTD` varchar(255) NOT NULL default '',
  `createdate` datetime default NULL,
  PRIMARY KEY  (`guildid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Guild System';

--
-- Dumping data for table `guild`
--


/*!40000 ALTER TABLE `guild` DISABLE KEYS */;
LOCK TABLES `guild` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `guild` ENABLE KEYS */;

--
-- Table structure for table `guild_charter`
--

DROP TABLE IF EXISTS `guild_charter`;
CREATE TABLE `guild_charter` (
  `ownerguid` int(10) unsigned NOT NULL,
  `charterguid` int(10) unsigned default '0',
  `guildname` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`ownerguid`),
  UNIQUE KEY `index_ownerguid_charterguid` (`ownerguid`,`charterguid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Guild System';

--
-- Dumping data for table `guild_charter`
--


/*!40000 ALTER TABLE `guild_charter` DISABLE KEYS */;
LOCK TABLES `guild_charter` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `guild_charter` ENABLE KEYS */;

--
-- Table structure for table `guild_charter_sign`
--

DROP TABLE IF EXISTS `guild_charter_sign`;
CREATE TABLE `guild_charter_sign` (
  `ownerguid` int(10) unsigned NOT NULL,
  `charterguid` int(11) unsigned NOT NULL default '0',
  `playerguid` int(11) unsigned NOT NULL default '0',
  PRIMARY KEY  (`charterguid`,`playerguid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Guild System';

--
-- Dumping data for table `guild_charter_sign`
--


/*!40000 ALTER TABLE `guild_charter_sign` DISABLE KEYS */;
LOCK TABLES `guild_charter_sign` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `guild_charter_sign` ENABLE KEYS */;

--
-- Table structure for table `guild_member`
--

DROP TABLE IF EXISTS `guild_member`;
CREATE TABLE `guild_member` (
  `guildid` int(6) unsigned NOT NULL default '0',
  `guid` int(6) NOT NULL default '0',
  `rank` tinyint(2) unsigned NOT NULL default '0',
  `Pnote` varchar(255) NOT NULL default '',
  `OFFnote` varchar(255) NOT NULL default ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Guild System';

--
-- Dumping data for table `guild_member`
--


/*!40000 ALTER TABLE `guild_member` DISABLE KEYS */;
LOCK TABLES `guild_member` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `guild_member` ENABLE KEYS */;

--
-- Table structure for table `guild_rank`
--

DROP TABLE IF EXISTS `guild_rank`;
CREATE TABLE `guild_rank` (
  `guildid` int(6) unsigned NOT NULL default '0',
  `rid` int(11) unsigned NOT NULL,
  `rname` varchar(255) NOT NULL default '',
  `rights` int(3) unsigned NOT NULL default '0',
  PRIMARY KEY  (`guildid`,`rid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Guild System';

--
-- Dumping data for table `guild_rank`
--


/*!40000 ALTER TABLE `guild_rank` DISABLE KEYS */;
LOCK TABLES `guild_rank` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `guild_rank` ENABLE KEYS */;


--
-- Table structure for table `instance`
--

DROP TABLE IF EXISTS `instance`;
CREATE TABLE `instance` (
  `id` int(11) unsigned NOT NULL default '0',
  `map` int(11) unsigned NOT NULL default '0',
  `resettime` bigint(40) NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `map` (`map`),
  KEY `resettime` (`resettime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `instance`
--

/*!40000 ALTER TABLE `instance` DISABLE KEYS */;
LOCK TABLES `instance` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `instance` ENABLE KEYS */;


--
-- Table structure for table `instance_template`
--

DROP TABLE IF EXISTS `instance_template`;
CREATE TABLE `instance_template` (
  `map` int(11) unsigned NOT NULL,
  `levelMin` int(11) unsigned NOT NULL default '0',
  `levelMax` int(11) unsigned NOT NULL default '0',
  `maxPlayers` int(11) unsigned NOT NULL default '0',
  `reset_delay` int(20) unsigned NOT NULL default '0',
  `startLocX` float default NULL,
  `startLocY` float default NULL,
  `startLocZ` float default NULL,
  `startLocO` float default NULL,
  PRIMARY KEY  (`map`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `instance_template`
--

/*!40000 ALTER TABLE `instance_template` DISABLE KEYS */;
LOCK TABLES `instance_template` WRITE;
INSERT INTO `instance_template` VALUES (33, 22, 30, 10, 7200, NULL, NULL, NULL, NULL),(34, 24, 32, 10, 7200, NULL, NULL, NULL, NULL),(36, 15, 20, 10, 7200, NULL, NULL, NULL, NULL),(43, 15, 21, 10, 7200, NULL, NULL, NULL, NULL),(47, 29, 38, 10, 7200, NULL, NULL, NULL, NULL),(48, 24, 32, 10, 7200, NULL, NULL, NULL, NULL),(70, 35, 47, 10, 7200, NULL, NULL, NULL, NULL),(90, 29, 38, 10, 7200, NULL, NULL, NULL, NULL),(109, 45, 55, 10, 7200, NULL, NULL, NULL, NULL),(129, 37, 46, 10, 7200, NULL, NULL, NULL, NULL),(189, 34, 45, 10, 7200, NULL, NULL, NULL, NULL),(209, 44, 54, 10, 7200, NULL, NULL, NULL, NULL),(229, 58, 0, 10, 120000, 78.5083, -225.044, 49.839, 5.1),(230, 52, 0, 5, 7200, NULL, NULL, NULL, NULL),(249, 60, 0, 40, 432000, NULL, NULL, NULL, NULL),(289, 57, 0, 5, 7200, NULL, NULL, NULL, NULL),(309, 60, 0, 20, 259200, NULL, NULL, NULL, NULL),(329, 58, 60, 5, 7200, NULL, NULL, NULL, NULL),(349, 46, 55, 10, 7200, NULL, NULL, NULL, NULL),(389, 13, 18, 10, 7200, NULL, NULL, NULL, NULL),(409, 60, 0, 40, 604800, NULL, NULL, NULL, NULL),(429, 55, 60, 5, 7200, NULL, NULL, NULL, NULL),(469, 60, 0, 40, 604800, NULL, NULL, NULL, NULL),(509, 60, 0, 20, 259200, NULL, NULL, NULL, NULL),(531, 60, 0, 40, 604800, NULL, NULL, NULL, NULL),(533, 60, 0, 40, 604800, NULL, NULL, NULL, NULL);
UNLOCK TABLES;
/*!40000 ALTER TABLE `instance_template` ENABLE KEYS */;


--
-- Table structure for table `item_instance`
--

DROP TABLE IF EXISTS `item_instance`;
CREATE TABLE `item_instance` (
  `guid` int(11) unsigned NOT NULL default '0',
  `owner_guid` int(11) unsigned NOT NULL default '0',
  `data` longtext,
  PRIMARY KEY  (`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Item System';

--
-- Dumping data for table `item_instance`
--


/*!40000 ALTER TABLE `item_instance` DISABLE KEYS */;
LOCK TABLES `item_instance` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `item_instance` ENABLE KEYS */;

--
-- Table structure for table `item_loot_template`
--

DROP TABLE IF EXISTS `item_loot_template`;
CREATE TABLE `item_loot_template` (
  `entry` int(11) unsigned NOT NULL default '0',
  `item` int(11) unsigned NOT NULL default '0',
  `ChanceOrRef` float NOT NULL default '100',
  `QuestChanceOrGroup` tinyint(3) NOT NULL default '0',
  `mincount` tinyint(3) unsigned NOT NULL default '1',
  `maxcount` tinyint(3) unsigned NOT NULL default '1',
  `quest_freeforall` tinyint(3) unsigned NOT NULL default '1',
  PRIMARY KEY  (`entry`,`item`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Loot System';

--
-- Dumping data for table `item_loot_template`
--


/*!40000 ALTER TABLE `item_loot_template` DISABLE KEYS */;
LOCK TABLES `item_loot_template` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `item_loot_template` ENABLE KEYS */;

--
-- Table structure for table `item_template`
--

DROP TABLE IF EXISTS `item_template`;
CREATE TABLE `item_template` (
  `entry` int(255) unsigned NOT NULL default '0',
  `class` tinyint(3) unsigned NOT NULL default '0',
  `subclass` tinyint(3) unsigned NOT NULL default '0',
  `name` varchar(255) NOT NULL default '',
  `name2` varchar(255) NOT NULL default '',
  `name3` varchar(255) NOT NULL default '',
  `name4` varchar(255) NOT NULL default '',
  `displayid` int(11) unsigned NOT NULL default '0',
  `Quality` tinyint(3) unsigned NOT NULL default '0',
  `Flags` int(30) unsigned NOT NULL default '0',
  `BuyCount` tinyint(3) unsigned NOT NULL default '1',
  `BuyPrice` int(30) unsigned NOT NULL default '0',
  `SellPrice` int(30) unsigned NOT NULL default '0',
  `InventoryType` tinyint(3) unsigned NOT NULL default '0',
  `AllowableClass` mediumint(9) NOT NULL default '0',
  `AllowableRace` mediumint(9) NOT NULL default '0',
  `ItemLevel` int(30) unsigned NOT NULL default '0',
  `RequiredLevel` tinyint(3) unsigned NOT NULL default '0',
  `RequiredSkill` int(30) unsigned NOT NULL default '0',
  `RequiredSkillRank` int(30) unsigned NOT NULL default '0',
  `requiredspell` int(30) unsigned NOT NULL default '0',
  `requiredhonorrank` int(30) unsigned NOT NULL default '0',
  `RequiredCityRank` int(30) unsigned NOT NULL default '0',
  `RequiredReputationFaction` int(30) unsigned NOT NULL default '0',
  `RequiredReputationRank` int(30) unsigned NOT NULL default '0',
  `maxcount` smallint(5) unsigned NOT NULL default '0',
  `stackable` smallint(5) unsigned NOT NULL default '0',
  `ContainerSlots` tinyint(3) unsigned NOT NULL default '0',
  `stat_type1` tinyint(4) unsigned NOT NULL default '0',
  `stat_value1` smallint(6) NOT NULL default '0',
  `stat_type2` tinyint(4) unsigned NOT NULL default '0',
  `stat_value2` smallint(6) NOT NULL default '0',
  `stat_type3` tinyint(4) unsigned NOT NULL default '0',
  `stat_value3` smallint(6) NOT NULL default '0',
  `stat_type4` tinyint(4) unsigned NOT NULL default '0',
  `stat_value4` smallint(6) NOT NULL default '0',
  `stat_type5` tinyint(4) unsigned NOT NULL default '0',
  `stat_value5` smallint(6) NOT NULL default '0',
  `stat_type6` tinyint(4) unsigned NOT NULL default '0',
  `stat_value6` smallint(6) NOT NULL default '0',
  `stat_type7` tinyint(4) unsigned NOT NULL default '0',
  `stat_value7` smallint(6) NOT NULL default '0',
  `stat_type8` tinyint(4) unsigned NOT NULL default '0',
  `stat_value8` smallint(6) NOT NULL default '0',
  `stat_type9` tinyint(4) unsigned NOT NULL default '0',
  `stat_value9` smallint(6) NOT NULL default '0',
  `stat_type10` tinyint(4) unsigned NOT NULL default '0',
  `stat_value10` smallint(6) NOT NULL default '0',
  `dmg_min1` float NOT NULL default '0',
  `dmg_max1` float NOT NULL default '0',
  `dmg_type1` tinyint(3) unsigned NOT NULL default '0',
  `dmg_min2` float NOT NULL default '0',
  `dmg_max2` float NOT NULL default '0',
  `dmg_type2` tinyint(3) unsigned NOT NULL default '0',
  `dmg_min3` float NOT NULL default '0',
  `dmg_max3` float NOT NULL default '0',
  `dmg_type3` tinyint(3) unsigned NOT NULL default '0',
  `dmg_min4` float NOT NULL default '0',
  `dmg_max4` float NOT NULL default '0',
  `dmg_type4` tinyint(3) unsigned NOT NULL default '0',
  `dmg_min5` float NOT NULL default '0',
  `dmg_max5` float NOT NULL default '0',
  `dmg_type5` tinyint(3) unsigned NOT NULL default '0',
  `armor` int(30) unsigned NOT NULL default '0',
  `holy_res` int(30) unsigned NOT NULL default '0',
  `fire_res` int(30) unsigned NOT NULL default '0',
  `nature_res` int(30) unsigned NOT NULL default '0',
  `frost_res` int(30) unsigned NOT NULL default '0',
  `shadow_res` int(30) unsigned NOT NULL default '0',
  `arcane_res` int(30) unsigned NOT NULL default '0',
  `delay` int(11) unsigned NOT NULL default '1000',
  `ammo_type` int(30) unsigned NOT NULL default '0',
  `RangedModRange` float NOT NULL default '0',
  `spellid_1` int(30) unsigned NOT NULL default '0',
  `spelltrigger_1` int(30) unsigned NOT NULL default '0',
  `spellcharges_1` int(30) NOT NULL default '0',
  `spellcooldown_1` int(30) unsigned NOT NULL default '0',
  `spellcategory_1` int(30) unsigned NOT NULL default '0',
  `spellcategorycooldown_1` int(30) unsigned NOT NULL default '0',
  `spellid_2` int(30) unsigned NOT NULL default '0',
  `spelltrigger_2` int(30) unsigned NOT NULL default '0',
  `spellcharges_2` int(30) NOT NULL default '0',
  `spellcooldown_2` int(30) unsigned NOT NULL default '0',
  `spellcategory_2` int(30) unsigned NOT NULL default '0',
  `spellcategorycooldown_2` int(30) unsigned NOT NULL default '0',
  `spellid_3` int(30) unsigned NOT NULL default '0',
  `spelltrigger_3` int(30) unsigned NOT NULL default '0',
  `spellcharges_3` int(30) NOT NULL default '0',
  `spellcooldown_3` int(30) unsigned NOT NULL default '0',
  `spellcategory_3` int(30) unsigned NOT NULL default '0',
  `spellcategorycooldown_3` int(30) unsigned NOT NULL default '0',
  `spellid_4` int(30) unsigned NOT NULL default '0',
  `spelltrigger_4` int(30) unsigned NOT NULL default '0',
  `spellcharges_4` int(30) NOT NULL default '0',
  `spellcooldown_4` int(30) unsigned NOT NULL default '0',
  `spellcategory_4` int(30) unsigned NOT NULL default '0',
  `spellcategorycooldown_4` int(30) unsigned NOT NULL default '0',
  `spellid_5` int(30) unsigned NOT NULL default '0',
  `spelltrigger_5` int(30) unsigned NOT NULL default '0',
  `spellcharges_5` int(30) NOT NULL default '0',
  `spellcooldown_5` int(30) unsigned NOT NULL default '0',
  `spellcategory_5` int(30) unsigned NOT NULL default '0',
  `spellcategorycooldown_5` int(30) unsigned NOT NULL default '0',
  `bonding` tinyint(3) unsigned NOT NULL default '0',
  `description` varchar(255) NOT NULL default '',
  `PageText` int(30) unsigned NOT NULL default '0',
  `LanguageID` int(30) unsigned NOT NULL default '0',
  `PageMaterial` int(30) unsigned NOT NULL default '0',
  `startquest` int(30) unsigned NOT NULL default '0',
  `lockid` int(30) unsigned NOT NULL default '0',
  `Material` int(30) NOT NULL default '0',
  `sheath` int(30) unsigned NOT NULL default '0',
  `Extra` int(30) unsigned NOT NULL default '0',
  `block` int(30) unsigned NOT NULL default '0',
  `itemset` int(30) unsigned NOT NULL default '0',
  `MaxDurability` int(30) unsigned NOT NULL default '0',
  `area` int(30) unsigned NOT NULL default '0',
  `BagFamily` tinyint(3) unsigned NOT NULL default '0',
  `Unknown1` int(30) unsigned NOT NULL default '0',
  `ScriptName` varchar(100) NOT NULL default '',
  `DisenchantID` int(11) unsigned NOT NULL default '0',
  PRIMARY KEY  (`entry`),
  KEY `items_index` (`class`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Item System';

--
-- Dumping data for table `item_template`
--


/*!40000 ALTER TABLE `item_template` DISABLE KEYS */;
LOCK TABLES `item_template` WRITE;
INSERT INTO `item_template` VALUES (65020,0,0,'Tough Jerky','Tough Jerky','Tough Jerky','Tough Jerky',2473,1,0,6,25,1,0,2047,255,5,1,0,0,0,0,0,0,0,0,20,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1000,0,0,433,0,-1,0,11,1000,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,0,0,0,0,0,0,0,0,0,0,0,0,0,'internalItemHandler',0),(65021,0,0,'Refreshing Spring Water','Refreshing Spring Water','Refreshing Spring Water','Refreshing Spring Water',18084,1,0,6,25,1,0,2047,255,5,1,0,0,0,0,0,0,0,0,20,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1000,0,0,430,0,-1,0,59,1000,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,0,0,0,0,0,0,0,0,0,0,0,0,0,'internalItemHandler',0),(65022,0,0,'Darnassian Bleu','Darnassian Bleu','Darnassian Bleu','Darnassian Bleu',6353,1,0,6,25,1,0,2047,255,5,1,0,0,0,0,0,0,0,0,20,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1000,0,0,433,0,-1,0,11,1000,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,0,0,0,0,0,0,0,0,0,0,0,0,0,'internalItemHandler',0),(65023,2,16,'Small Throwing Knife','Small Throwing Knife','Small Throwing Knife','Small Throwing Knife',16754,1,0,1,15,0,25,2047,255,3,1,0,0,0,0,0,0,0,0,200,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2000,4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,0,0,0,0,1,0,0,0,0,0,0,0,0,'internalItemHandler',0),(65024,2,16,'Crude Throwing Axe','Crude Throwing Axe','Crude Throwing Axe','Crude Throwing Axe',20777,1,0,1,15,0,25,2047,255,3,1,0,0,0,0,0,0,0,0,200,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2000,4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,0,0,0,0,1,0,0,0,0,0,0,0,0,'internalItemHandler',0),(65025,0,0,'Shiny Red Apple','Shiny Red Apple','Shiny Red Apple','Shiny Red Apple',6410,1,0,6,25,1,0,2047,255,5,1,0,0,0,0,0,0,0,0,20,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1000,0,0,433,0,-1,0,11,100,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,0,0,0,0,0,0,0,0,0,0,0,0,0,'internalItemHandler',0),(65026,0,0,'Tough Hunk of Bread','Tough Hunk of Bread','Tough Hunk of Bread','Tough Hunk of Bread',6399,1,0,6,25,1,0,2047,255,5,1,0,0,0,0,0,0,0,0,20,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1000,0,0,433,0,-1,0,11,1000,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,0,0,0,0,0,0,0,0,0,0,0,0,0,'internalItemHandler',0),(65027,0,0,'Forest Mushroom Cap','Forest Mushroom Cap','Forest Mushroom Cap','Forest Mushroom Cap',15852,1,0,6,25,1,0,2047,255,5,1,0,0,0,0,0,0,0,0,20,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1000,0,0,433,0,-1,0,11,1000,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,0,0,0,0,0,0,0,0,0,0,0,0,0,'internalItemHandler',0),(25,2,7,'Worn Shortsword','Worn Shortsword','Worn Shortsword','Worn Shortsword',1542,1,0,1,35,7,21,32767,511,2,1,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1900,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,1,0,0,0,1,3,0,0,0,20,0,0,0,'internalItemHandler',0),(39,4,1,'Recruit\'s Pants','Recruit\'s Pants','Recruit\'s Pants','Recruit\'s Pants',9892,0,0,1,5,1,7,32767,511,1,1,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,0,0,0,0,7,0,0,0,0,25,0,0,0,'internalItemHandler',0),(40,4,0,'Recruit\'s Boots','Recruit\'s Boots','Recruit\'s Boots','Recruit\'s Boots',10141,1,0,1,4,1,8,32767,511,1,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,0,0,0,0,7,0,0,0,0,0,0,0,0,'internalItemHandler',0),(38,4,0,'Recruit\'s Shirt','Recruit\'s Shirt','Recruit\'s Shirt','Recruit\'s Shirt',9891,1,0,1,1,1,4,0,0,1,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,0,0,0,0,7,0,0,0,0,0,0,0,0,'internalItemHandler',0),(2362,4,6,'Worn Wooden Shield','Worn Wooden Shield','Worn Wooden Shield','Worn Wooden Shield',18730,0,0,1,7,1,14,32767,511,1,1,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,5,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,0,0,0,0,1,4,0,1,0,20,0,0,0,'internalItemHandler',0),(6948,15,0,'Hearthstone','Hearthstone','Hearthstone','Hearthstone',6418,1,64,1,0,0,0,32767,511,1,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,8690,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,'',0,0,0,0,0,0,0,0,0,0,0,0,0,0,'internalItemHandler',0),(14646,12,0,'Northshire Gift Voucher','Northshire Gift Voucher','Northshire Gift Voucher','Northshire Gift Voucher',18499,1,0,1,0,0,0,2047,255,1,1,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1000,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,4,'',0,0,0,5805,0,0,0,0,0,0,0,0,0,0,'internalItemHandler',0),(14647,12,0,'Coldridge Valley Gift Voucher','Coldridge Valley Gift Voucher','Coldridge Valley Gift Voucher','Coldridge Valley Gift Voucher',18499,1,0,1,0,0,0,2047,255,1,1,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1000,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,4,'',0,0,0,5841,0,0,0,0,0,0,0,0,0,0,'internalItemHandler',0),(14648,12,0,'Shadowglen Gift Voucher','Shadowglen Gift Voucher','Shadowglen Gift Voucher','Shadowglen Gift Voucher',18499,1,0,1,0,0,0,2047,255,1,1,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1000,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,4,'',0,0,0,5842,0,0,0,0,0,0,0,0,0,0,'internalItemHandler',0),(14649,12,0,'Valley of Trials Gift Voucher','Valley of Trials Gift Voucher','Valley of Trials Gift Voucher','Valley of Trials Gift Voucher',18499,1,0,1,0,0,0,2047,255,1,1,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1000,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,4,'',0,0,0,5843,0,0,0,0,0,0,0,0,0,0,'internalItemHandler',0),(14650,12,0,'Camp Narache Gift Voucher','Camp Narache Gift Voucher','Camp Narache Gift Voucher','Camp Narache Gift Voucher',18499,1,0,1,0,0,0,2047,255,1,1,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1000,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,4,'',0,0,0,5844,0,0,0,0,0,0,0,0,0,0,'internalItemHandler',0),(14651,12,0,'Deathknell Gift Voucher','Deathknell Gift Voucher','Deathknell Gift Voucher','Deathknell Gift Voucher',18499,1,0,1,0,0,0,2047,255,1,1,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1000,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,4,'',0,0,0,5847,0,0,0,0,0,0,0,0,0,0,'internalItemHandler',0),(43,4,0,'Squire\'s Boots','Squire\'s Boots','Squire\'s Boots','Squire\'s Boots',10272,1,0,1,4,1,8,2047,255,1,1,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1000,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,0,0,0,0,7,0,0,0,0,0,0,0,0,'internalItemHandler',0),(44,4,1,'Squire\'s Pants','Squire\'s Pants','Squire\'s Pants','Squire\'s Pants',9937,0,0,1,4,1,7,2047,255,1,1,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2,0,0,0,0,0,0,1000,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,0,0,0,0,7,0,0,0,0,25,0,0,0,'internalItemHandler',0),(45,4,0,'Squire\'s Shirt','Squire\'s Shirt','Squire\'s Shirt','Squire\'s Shirt',3265,1,0,1,1,1,4,2047,255,1,1,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1000,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,0,0,0,0,7,0,0,0,0,0,0,0,0,'internalItemHandler',0),(47,4,0,'Footpad\'s Shoes','Footpad\'s Shoes','Footpad\'s Shoes','Footpad\'s Shoes',9915,1,0,1,4,1,8,2047,255,1,1,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1000,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,0,0,0,0,7,0,0,0,0,0,0,0,0,'internalItemHandler',0),(48,4,1,'Footpad\'s Pants','Footpad\'s Pants','Footpad\'s Pants','Footpad\'s Pants',9913,0,0,1,4,1,7,2047,255,1,1,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2,0,0,0,0,0,0,1000,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,0,0,0,0,7,0,0,0,0,25,0,0,0,'internalItemHandler',0),(49,4,0,'Footpad\'s Shirt','Footpad\'s Shirt','Footpad\'s Shirt','Footpad\'s Shirt',9906,1,0,1,1,1,4,2047,255,1,1,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1000,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,0,0,0,0,7,0,0,0,0,0,0,0,0,'internalItemHandler',0),(51,4,0,'Neophyte\'s Boots','Neophyte\'s Boots','Neophyte\'s Boots','Neophyte\'s Boots',9946,1,0,1,5,1,8,2047,255,1,1,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1000,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,0,0,0,0,7,0,0,0,0,0,0,0,0,'internalItemHandler',0),(52,4,1,'Neophyte\'s Pants','Neophyte\'s Pants','Neophyte\'s Pants','Neophyte\'s Pants',9945,0,0,1,5,1,7,2047,255,1,1,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2,0,0,0,0,0,0,1000,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,0,0,0,0,7,0,0,0,0,25,0,0,0,'internalItemHandler',0),(53,4,0,'Neophyte\'s Shirt','Neophyte\'s Shirt','Neophyte\'s Shirt','Neophyte\'s Shirt',9944,1,0,1,1,1,4,2047,255,1,1,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1000,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,0,0,0,0,7,0,0,0,0,0,0,0,0,'internalItemHandler',0),(55,4,0,'Apprentice\'s Boots','Apprentice\'s Boots','Apprentice\'s Boots','Apprentice\'s Boots',9929,1,0,1,5,1,8,2047,255,1,1,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1000,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,0,0,0,0,7,0,0,0,0,0,0,0,0,'internalItemHandler',0),(56,4,1,'Apprentice\'s Robe','Apprentice\'s Robe','Apprentice\'s Robe','Apprentice\'s Robe',12647,0,0,1,5,1,20,2047,255,1,1,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,3,0,0,0,0,0,0,1000,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,0,0,0,0,7,0,0,0,0,35,0,0,0,'internalItemHandler',0),(57,4,1,'Acolyte\'s Robe','Acolyte\'s Robe','Acolyte\'s Robe','Acolyte\'s Robe',12645,0,0,1,5,1,20,2047,255,1,1,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,3,0,0,0,0,0,0,1000,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,0,0,0,0,7,0,0,0,0,35,0,0,0,'internalItemHandler',0),(59,4,0,'Acolyte\'s Shoes','Acolyte\'s Shoes','Acolyte\'s Shoes','Acolyte\'s Shoes',3261,1,0,1,5,1,8,2047,255,1,1,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1000,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,0,0,0,0,7,0,0,0,0,0,0,0,0,'internalItemHandler',0),(35,2,10,'Bent Staff','Bent Staff','Bent Staff','Bent Staff',472,1,0,1,47,9,17,2047,255,2,1,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,3,5,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2900,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,0,0,0,0,2,2,0,0,0,25,0,0,0,'internalItemHandler',0),(36,2,4,'Worn Mace','Worn Mace','Worn Mace','Worn Mace',5194,1,0,1,38,7,21,2047,255,2,1,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1900,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,0,0,0,0,2,3,0,0,0,20,0,0,0,'internalItemHandler',0),(37,2,0,'Worn Axe','Worn Axe','Worn Axe','Worn Axe',14029,1,0,1,38,7,21,2047,255,2,1,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2000,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,0,0,0,0,1,3,0,0,0,20,0,0,0,'internalItemHandler',0),(2361,2,5,'Battleworn Hammer','Battleworn Hammer','Battleworn Hammer','Battleworn Hammer',8690,1,0,1,45,9,17,2047,255,2,1,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,3,5,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2900,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,0,0,0,0,2,1,0,0,0,25,0,0,0,'internalItemHandler',0),(2092,2,15,'Worn Dagger','Worn Dagger','Worn Dagger','Worn Dagger',6442,1,0,1,35,7,13,2047,255,2,1,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1600,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,0,0,0,0,1,3,0,0,0,16,0,0,0,'internalItemHandler',0),(6096,4,0,'Apprentice\'s Shirt','Apprentice\'s Shirt','Apprentice\'s Shirt','Apprentice\'s Shirt',2163,1,0,1,1,1,4,2047,255,1,1,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1000,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,0,0,0,0,7,0,0,0,0,0,0,0,0,'internalItemHandler',0),(6097,4,0,'Acolyte\'s Shirt','Acolyte\'s Shirt','Acolyte\'s Shirt','Acolyte\'s Shirt',2470,1,0,1,1,1,4,2047,255,1,1,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1000,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,0,0,0,0,7,0,0,0,0,0,0,0,0,'internalItemHandler',0),(6098,4,1,'Neophyte\'s Robe','Neophyte\'s Robe','Neophyte\'s Robe','Neophyte\'s Robe',12679,0,0,1,4,1,20,2047,255,1,1,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,3,0,0,0,0,0,0,1000,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,0,0,0,0,7,0,0,0,0,35,0,0,0,'internalItemHandler',0),(1395,4,1,'Apprentice\'s Pants','Apprentice\'s Pants','Apprentice\'s Pants','Apprentice\'s Pants',9924,0,0,1,5,1,7,2047,255,1,1,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2,0,0,0,0,0,0,1000,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,0,0,0,0,7,0,0,0,0,25,0,0,0,'internalItemHandler',0),(1396,4,1,'Acolyte\'s Pants','Acolyte\'s Pants','Acolyte\'s Pants','Acolyte\'s Pants',3260,0,0,1,4,1,7,2047,255,1,1,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2,0,0,0,0,0,0,1000,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,0,0,0,0,7,0,0,0,0,25,0,0,0,'internalItemHandler',0),(6125,4,0,'Brawler\'s Harness','Brawler\'s Harness','Brawler\'s Harness','Brawler\'s Harness',9995,1,0,1,1,1,4,2047,255,1,1,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1000,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,0,0,0,0,7,0,0,0,0,0,0,0,0,'internalItemHandler',0),(6126,4,1,'Trapper\'s Pants','Trapper\'s Pants','Trapper\'s Pants','Trapper\'s Pants',10002,0,0,1,5,1,7,2047,255,1,1,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2,0,0,0,0,0,0,1000,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,0,0,0,0,7,0,0,0,0,25,0,0,0,'internalItemHandler',0),(6127,4,0,'Trapper\'s Boots','Trapper\'s Boots','Trapper\'s Boots','Trapper\'s Boots',10003,1,0,1,5,1,8,2047,255,1,1,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1000,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,0,0,0,0,7,0,0,0,0,0,0,0,0,'internalItemHandler',0),(6129,4,1,'Acolyte\'s Robe','Acolyte\'s Robe','Acolyte\'s Robe','Acolyte\'s Robe',12646,0,0,1,5,1,20,2047,255,1,1,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,3,0,0,0,0,0,0,1000,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,0,0,0,0,7,0,0,0,0,35,0,0,0,'internalItemHandler',0),(139,4,1,'Brawler\'s Pants','Brawler\'s Pants','Brawler\'s Pants','Brawler\'s Pants',9988,0,0,1,4,1,7,2047,255,1,1,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2,0,0,0,0,0,0,1000,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,0,0,0,0,7,0,0,0,0,25,0,0,0,'internalItemHandler',0),(140,4,0,'Brawler\'s Boots','Brawler\'s Boots','Brawler\'s Boots','Brawler\'s Boots',9992,1,0,1,4,1,8,2047,255,1,1,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1000,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,0,0,0,0,7,0,0,0,0,0,0,0,0,'internalItemHandler',0),(127,4,0,'Trapper\'s Shirt','Trapper\'s Shirt','Trapper\'s Shirt','Trapper\'s Shirt',9996,1,0,1,1,1,4,2047,255,1,1,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1000,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,0,0,0,0,7,0,0,0,0,0,0,0,0,'internalItemHandler',0),(120,4,1,'Thug Pants','Thug Pants','Thug Pants','Thug Pants',10006,0,0,1,4,1,7,2047,255,1,1,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2,0,0,0,0,0,0,1000,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,0,0,0,0,7,0,0,0,0,25,0,0,0,'internalItemHandler',0),(121,4,0,'Thug Boots','Thug Boots','Thug Boots','Thug Boots',10008,1,0,1,4,1,8,2047,255,1,1,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1000,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,0,0,0,0,7,0,0,0,0,0,0,0,0,'internalItemHandler',0),(147,4,1,'Rugged Trapper\'s Pants','Rugged Trapper\'s Pants','Rugged Trapper\'s Pants','Rugged Trapper\'s Pants',9975,0,0,1,5,1,7,2047,255,1,1,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2,0,0,0,0,0,0,1000,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,0,0,0,0,7,0,0,0,0,25,0,0,0,'internalItemHandler',0),(148,4,0,'Rugged Trapper\'s Shirt','Rugged Trapper\'s Shirt','Rugged Trapper\'s Shirt','Rugged Trapper\'s Shirt',9976,1,0,1,1,1,4,2047,255,1,1,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1000,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,0,0,0,0,7,0,0,0,0,0,0,0,0,'internalItemHandler',0),(153,4,2,'Primitive Kilt','Primitive Kilt','Primitive Kilt','Primitive Kilt',10050,0,0,1,5,1,7,2047,255,1,1,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,14,0,0,0,0,0,0,1000,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,0,0,0,0,8,0,0,0,0,30,0,0,0,'internalItemHandler',0),(154,4,0,'Primitive Mantle','Primitive Mantle','Primitive Mantle','Primitive Mantle',10058,1,0,1,1,1,4,2047,255,1,1,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1000,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,0,0,0,0,7,0,0,0,0,0,0,0,0,'internalItemHandler',0),(2101,1,2,'Light Quiver','Light Quiver','Light Quiver','Light Quiver',21328,1,0,1,4,1,18,2047,255,1,1,0,0,0,0,0,0,0,0,1,6,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1000,0,0,14824,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,'',0,0,0,0,0,0,0,0,0,0,0,0,0,0,'internalItemHandler',0),(2102,1,3,'Small Ammo Pouch','Small Ammo Pouch','Small Ammo Pouch','Small Ammo Pouch',1816,1,0,1,4,1,18,2047,255,1,1,0,0,0,0,0,0,0,0,1,6,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1000,0,0,14824,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,'',0,0,0,0,0,0,0,0,0,0,0,0,0,0,'internalItemHandler',0),(2105,4,0,'Thug Shirt','Thug Shirt','Thug Shirt','Thug Shirt',10005,1,0,1,5,1,4,2047,255,1,1,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1000,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,0,0,0,0,7,0,0,0,0,0,0,0,0,'internalItemHandler',0),(2504,2,2,'Worn Shortbow','Worn Shortbow','Worn Shortbow','Worn Shortbow',8106,1,0,1,29,5,15,2047,255,2,1,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2,5,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2300,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,0,0,0,0,2,0,0,0,0,20,0,0,0,'internalItemHandler',0),(2508,2,3,'Old Blunderbuss','Old Blunderbuss','Old Blunderbuss','Old Blunderbuss',6606,1,0,1,27,5,26,2047,255,2,1,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2,5,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2300,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,0,0,0,0,1,0,0,0,0,20,0,0,0,'internalItemHandler',0),(2512,6,2,'Rough Arrow','Rough Arrow','Rough Arrow','Rough Arrow',5996,1,0,1,10,0,24,2047,255,5,1,0,0,0,0,0,0,0,0,200,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,3000,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,0,0,0,0,2,0,0,0,0,0,0,1,0,'internalItemHandler',0),(2516,6,3,'Light Shot','Light Shot','Light Shot','Light Shot',5998,1,0,1,10,0,24,2047,255,5,1,0,0,0,0,0,0,0,0,200,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,3000,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,0,0,0,0,2,0,0,0,0,0,0,2,0,'internalItemHandler',0),(3661,2,10,'Handcrafted Staff','Handcrafted Staff','Handcrafted Staff','Handcrafted Staff',18530,1,0,1,45,9,17,2047,255,2,1,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,3,5,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2900,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,0,0,0,0,2,2,0,0,0,25,0,0,0,'internalItemHandler',0),(6119,4,1,'Neophyte\'s Robe','Neophyte\'s Robe','Neophyte\'s Robe','Neophyte\'s Robe',12681,0,0,1,4,1,20,2047,255,1,1,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,3,0,0,0,0,0,0,1000,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,0,0,0,0,7,0,0,0,0,35,0,0,0,'internalItemHandler',0),(6123,4,1,'Novice\'s Robe','Novice\'s Robe','Novice\'s Robe','Novice\'s Robe',12683,0,0,1,4,1,20,2047,255,1,1,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,3,0,0,0,0,0,0,1000,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,0,0,0,0,7,0,0,0,0,35,0,0,0,'internalItemHandler',0),(6124,4,1,'Novice\'s Pants','Novice\'s Pants','Novice\'s Pants','Novice\'s Pants',9987,0,0,1,5,1,7,2047,255,1,1,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2,0,0,0,0,0,0,1000,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,0,0,0,0,7,0,0,0,0,25,0,0,0,'internalItemHandler',0),(6134,4,0,'Primitive Mantle','Primitive Mantle','Primitive Mantle','Primitive Mantle',10108,1,0,1,1,1,4,2047,255,1,1,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1000,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,0,0,0,0,7,0,0,0,0,0,0,0,0,'internalItemHandler',0),(6135,4,2,'Primitive Kilt','Primitive Kilt','Primitive Kilt','Primitive Kilt',10109,0,0,1,5,1,7,2047,255,1,1,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,14,0,0,0,0,0,0,1000,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,0,0,0,0,8,0,0,0,0,30,0,0,0,'internalItemHandler',0),(6139,4,1,'Novice\'s Robe','Novice\'s Robe','Novice\'s Robe','Novice\'s Robe',12684,0,0,1,4,1,20,2047,255,1,1,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,3,0,0,0,0,0,0,1000,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,0,0,0,0,7,0,0,0,0,35,0,0,0,'internalItemHandler',0),(6140,4,1,'Apprentice\'s Robe','Apprentice\'s Robe','Apprentice\'s Robe','Apprentice\'s Robe',12649,0,0,1,4,1,20,2047,255,1,1,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,3,0,0,0,0,0,0,1000,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,0,0,0,0,7,0,0,0,0,35,0,0,0,'internalItemHandler',0),(6144,4,1,'Neophyte\'s Robe','Neophyte\'s Robe','Neophyte\'s Robe','Neophyte\'s Robe',12680,0,0,1,5,1,20,2047,255,1,1,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,3,0,0,0,0,0,0,1000,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,0,0,0,0,7,0,0,0,0,35,0,0,0,'internalItemHandler',0),(12282,2,1,'Worn Battleaxe','Worn Battleaxe','Worn Battleaxe','Worn Battleaxe',22291,1,0,1,43,8,17,2047,255,2,1,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,3,5,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2900,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,0,0,0,0,1,1,0,0,0,25,0,0,0,'internalItemHandler',0);
UNLOCK TABLES;
/*!40000 ALTER TABLE `item_template` ENABLE KEYS */;

--
-- Table structure for table `item_text`
--

DROP TABLE IF EXISTS `item_text`;
CREATE TABLE `item_text` (
  `id` int(11) NOT NULL default '0',
  `text` longtext,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Item System';

--
-- Dumping data for table `item_text`
--


/*!40000 ALTER TABLE `item_text` DISABLE KEYS */;
LOCK TABLES `item_text` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `item_text` ENABLE KEYS */;

--
-- Table structure for table `mail`
--

DROP TABLE IF EXISTS `mail`;
CREATE TABLE `mail` (
  `id` int(11) unsigned NOT NULL default '0' COMMENT 'Identifier',
  `messageType` tinyint(3) unsigned NOT NULL default '0',
  `sender` int(11) unsigned NOT NULL default '0' COMMENT 'Character Global Unique Identifier',
  `receiver` int(11) unsigned NOT NULL default '0' COMMENT 'Character Global Unique Identifier',
  `subject` longtext,
  `itemTextId` int(11) unsigned NOT NULL default '0',
  `item_guid` int(11) unsigned NOT NULL default '0' COMMENT 'Mail Item Global Unique Identifier',
  `item_template` int(11) unsigned NOT NULL default '0' COMMENT 'Item Identifier',
  `time` int(11) unsigned NOT NULL default '0',
  `money` int(11) unsigned NOT NULL default '0',
  `cod` int(11) unsigned NOT NULL default '0',
  `checked` tinyint(3) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `idx_receiver` (`receiver`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Mail System';

--
-- Dumping data for table `mail`
--


/*!40000 ALTER TABLE `mail` DISABLE KEYS */;
LOCK TABLES `mail` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `mail` ENABLE KEYS */;

--
-- Table structure for table `npc_gossip`
--

DROP TABLE IF EXISTS `npc_gossip`;
CREATE TABLE `npc_gossip` (
  `id` int(11) NOT NULL default '0',
  `npc_guid` int(11) NOT NULL default '0',
  `gossip_type` int(11) NOT NULL default '0',
  `textid` int(30) NOT NULL default '0',
  `option_count` int(30) default NULL,
  PRIMARY KEY  (`id`,`npc_guid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `npc_gossip`
--


/*!40000 ALTER TABLE `npc_gossip` DISABLE KEYS */;
LOCK TABLES `npc_gossip` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `npc_gossip` ENABLE KEYS */;

--
-- Table structure for table `npc_gossip_textid`
--

DROP TABLE IF EXISTS `npc_gossip_textid`;
CREATE TABLE `npc_gossip_textid` (
  `zoneid` int(11) unsigned NOT NULL default '0',
  `action` int(3) unsigned NOT NULL default '0',
  `textid` int(11) unsigned NOT NULL default '0',
  KEY `zoneid` (`zoneid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `npc_gossip_textid`
--


/*!40000 ALTER TABLE `npc_gossip_textid` DISABLE KEYS */;
LOCK TABLES `npc_gossip_textid` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `npc_gossip_textid` ENABLE KEYS */;

--
-- Table structure for table `npc_option`
--

DROP TABLE IF EXISTS `npc_option`;
CREATE TABLE `npc_option` (
  `id` int(11) unsigned NOT NULL default '0',
  `gossip_id` int(11) unsigned NOT NULL default '0',
  `npcflag` int(11) unsigned NOT NULL default '0',
  `icon` int(11) unsigned NOT NULL default '0',
  `action` int(11) unsigned NOT NULL default '0',
  `option` text,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `npc_option`
--


/*!40000 ALTER TABLE `npc_option` DISABLE KEYS */;
LOCK TABLES `npc_option` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `npc_option` ENABLE KEYS */;

--
-- Table structure for table `npc_text`
--

DROP TABLE IF EXISTS `npc_text`;
CREATE TABLE `npc_text` (
  `ID` int(11) NOT NULL default '0',
  `text0_0` longtext,
  `text0_1` longtext,
  `lang0` bigint(20) unsigned NOT NULL default '0',
  `prob0` float NOT NULL default '0',
  `em0_0` bigint(20) unsigned NOT NULL default '0',
  `em0_1` bigint(20) unsigned NOT NULL default '0',
  `em0_2` bigint(20) unsigned NOT NULL default '0',
  `em0_3` bigint(20) unsigned NOT NULL default '0',
  `em0_4` bigint(20) unsigned NOT NULL default '0',
  `em0_5` bigint(20) unsigned NOT NULL default '0',
  `text1_0` longtext,
  `text1_1` longtext,
  `lang1` bigint(20) unsigned NOT NULL default '0',
  `prob1` float NOT NULL default '0',
  `em1_0` bigint(20) unsigned NOT NULL default '0',
  `em1_1` bigint(20) unsigned NOT NULL default '0',
  `em1_2` bigint(20) unsigned NOT NULL default '0',
  `em1_3` bigint(20) unsigned NOT NULL default '0',
  `em1_4` bigint(20) unsigned NOT NULL default '0',
  `em1_5` bigint(20) unsigned NOT NULL default '0',
  `text2_0` longtext,
  `text2_1` longtext,
  `lang2` bigint(20) unsigned NOT NULL default '0',
  `prob2` float NOT NULL default '0',
  `em2_0` bigint(20) unsigned NOT NULL default '0',
  `em2_1` bigint(20) unsigned NOT NULL default '0',
  `em2_2` bigint(20) unsigned NOT NULL default '0',
  `em2_3` bigint(20) unsigned NOT NULL default '0',
  `em2_4` bigint(20) unsigned NOT NULL default '0',
  `em2_5` bigint(20) unsigned NOT NULL default '0',
  `text3_0` longtext,
  `text3_1` longtext,
  `lang3` bigint(20) unsigned NOT NULL default '0',
  `prob3` float NOT NULL default '0',
  `em3_0` bigint(20) unsigned NOT NULL default '0',
  `em3_1` bigint(20) unsigned NOT NULL default '0',
  `em3_2` bigint(20) unsigned NOT NULL default '0',
  `em3_3` bigint(20) unsigned NOT NULL default '0',
  `em3_4` bigint(20) unsigned NOT NULL default '0',
  `em3_5` bigint(20) unsigned NOT NULL default '0',
  `text4_0` longtext,
  `text4_1` longtext,
  `lang4` bigint(20) unsigned NOT NULL default '0',
  `prob4` float NOT NULL default '0',
  `em4_0` bigint(20) unsigned NOT NULL default '0',
  `em4_1` bigint(20) unsigned NOT NULL default '0',
  `em4_2` bigint(20) unsigned NOT NULL default '0',
  `em4_3` bigint(20) unsigned NOT NULL default '0',
  `em4_4` bigint(20) unsigned NOT NULL default '0',
  `em4_5` bigint(20) unsigned NOT NULL default '0',
  `text5_0` longtext,
  `text5_1` longtext,
  `lang5` bigint(20) unsigned NOT NULL default '0',
  `prob5` float NOT NULL default '0',
  `em5_0` bigint(20) unsigned NOT NULL default '0',
  `em5_1` bigint(20) unsigned NOT NULL default '0',
  `em5_2` bigint(20) unsigned NOT NULL default '0',
  `em5_3` bigint(20) unsigned NOT NULL default '0',
  `em5_4` bigint(20) unsigned NOT NULL default '0',
  `em5_5` bigint(20) unsigned NOT NULL default '0',
  `text6_0` longtext,
  `text6_1` longtext,
  `lang6` bigint(20) unsigned NOT NULL default '0',
  `prob6` float NOT NULL default '0',
  `em6_0` bigint(20) unsigned NOT NULL default '0',
  `em6_1` bigint(20) unsigned NOT NULL default '0',
  `em6_2` bigint(20) unsigned NOT NULL default '0',
  `em6_3` bigint(20) unsigned NOT NULL default '0',
  `em6_4` bigint(20) unsigned NOT NULL default '0',
  `em6_5` bigint(20) unsigned NOT NULL default '0',
  `text7_0` longtext,
  `text7_1` longtext,
  `lang7` bigint(20) unsigned NOT NULL default '0',
  `prob7` float NOT NULL default '0',
  `em7_0` bigint(20) unsigned NOT NULL default '0',
  `em7_1` bigint(20) unsigned NOT NULL default '0',
  `em7_2` bigint(20) unsigned NOT NULL default '0',
  `em7_3` bigint(20) unsigned NOT NULL default '0',
  `em7_4` bigint(20) unsigned NOT NULL default '0',
  `em7_5` bigint(20) unsigned NOT NULL default '0',
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `npc_text`
--


/*!40000 ALTER TABLE `npc_text` DISABLE KEYS */;
LOCK TABLES `npc_text` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `npc_text` ENABLE KEYS */;

--
-- Table structure for table `npc_trainer`
--

DROP TABLE IF EXISTS `npc_trainer`;
CREATE TABLE `npc_trainer` (
  `entry` int(11) NOT NULL default '0',
  `spell` int(11) NOT NULL default '0',
  `spellcost` int(11) default '0',
  `reqskill` int(11) unsigned default '0',
  `reqskillvalue` int(11) unsigned default '0',
  `reqlevel` int(11) unsigned default '0',
  UNIQUE KEY `entry_spell` (`entry`,`spell`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `npc_trainer`
--


/*!40000 ALTER TABLE `npc_trainer` DISABLE KEYS */;
LOCK TABLES `npc_trainer` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `npc_trainer` ENABLE KEYS */;

--
-- Table structure for table `npc_vendor`
--

DROP TABLE IF EXISTS `npc_vendor`;
CREATE TABLE `npc_vendor` (
  `entry` int(11) unsigned NOT NULL default '0',
  `item` int(11) unsigned NOT NULL default '0',
  `maxcount` tinyint(3) unsigned NOT NULL default '0',
  `incrtime` int(11) unsigned NOT NULL default '0',
  PRIMARY KEY  (`entry`,`item`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Npc System';

--
-- Dumping data for table `npc_vendor`
--


/*!40000 ALTER TABLE `npc_vendor` DISABLE KEYS */;
LOCK TABLES `npc_vendor` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `npc_vendor` ENABLE KEYS */;

--
-- Table structure for table `page_text`
--

DROP TABLE IF EXISTS `page_text`;
CREATE TABLE `page_text` (
  `entry` int(11) NOT NULL default '0',
  `text` longtext,
  `next_page` bigint(20) unsigned NOT NULL default '0',
  PRIMARY KEY  (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Item System';

--
-- Dumping data for table `page_text`
--


/*!40000 ALTER TABLE `page_text` DISABLE KEYS */;
LOCK TABLES `page_text` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `page_text` ENABLE KEYS */;

--
-- Table structure for table `pet_levelstats`
--

DROP TABLE IF EXISTS `pet_levelstats`;
CREATE TABLE `pet_levelstats` (
  `creature_entry` int(11) unsigned NOT NULL,
  `level` tinyint(3) unsigned NOT NULL,
  `hp` smallint(5) unsigned NOT NULL,
  `mana` smallint(5) unsigned NOT NULL,
  `str` smallint(5) unsigned NOT NULL,
  `agi` smallint(5) unsigned NOT NULL,
  `sta` smallint(5) unsigned NOT NULL,
  `int` smallint(5) unsigned NOT NULL,
  `spi` smallint(5) unsigned NOT NULL,
  PRIMARY KEY  (`creature_entry`,`level`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 PACK_KEYS=0 COMMENT='Stores pet levels stats.';

--
-- Dumping data for table `pet_levelstats`
--


/*!40000 ALTER TABLE `pet_levelstats` DISABLE KEYS */;
LOCK TABLES `pet_levelstats` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `pet_levelstats` ENABLE KEYS */;

--
-- Table structure for table `pet_name_generation`
--

DROP TABLE IF EXISTS `pet_name_generation`;
CREATE TABLE `pet_name_generation` (
  `id` int(11) NOT NULL auto_increment,
  `word` tinytext NOT NULL,
  `entry` int(11) NOT NULL default '0',
  `half` int(11) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=199 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pet_name_generation`
--


/*!40000 ALTER TABLE `pet_name_generation` DISABLE KEYS */;
LOCK TABLES `pet_name_generation` WRITE;
INSERT INTO `pet_name_generation` VALUES (1,'Aba',416,0),(2,'Az',416,0),(3,'Bel',416,0),(4,'Biz',416,0),(5,'Cho',416,0),(6,'Dag',416,0),(7,'Gak',416,0),(8,'Gar',416,0),(9,'Gho',416,0),(10,'Gob',416,0),(11,'Gra',416,0),(12,'Jak',416,0),(13,'Jub',416,0),(14,'Kar',416,0),(15,'Laz',416,0),(16,'Nal',416,0),(17,'Nok',416,0),(18,'Pag',416,0),(19,'Pig',416,0),(20,'Pip',416,0),(21,'Piz',416,0),(22,'Quz',416,0),(23,'Rui',416,0),(24,'Rul',416,0),(25,'Rup',416,0),(26,'Tar',416,0),(27,'Vol',416,0),(28,'Yaz',416,0),(29,'Zep',416,0),(30,'Zig',416,0),(31,'Zil',416,0),(32,'Zor',416,0),(33,'bis',416,1),(34,'gup',416,1),(35,'ham',416,1),(36,'jub',416,1),(37,'kin',416,1),(38,'kol',416,1),(39,'lop',416,1),(40,'loz',416,1),(41,'mat',416,1),(42,'mir',416,1),(43,'nam',416,1),(44,'nar',416,1),(45,'nik',416,1),(46,'nip',416,1),(47,'pad',416,1),(48,'pep',416,1),(49,'pit',416,1),(50,'qua',416,1),(51,'rai',416,1),(52,'rin',416,1),(53,'rot',416,1),(54,'tai',416,1),(55,'tal',416,1),(56,'tik',416,1),(57,'tip',416,1),(58,'tog',416,1),(59,'tuk',416,1),(60,'uri',416,1),(61,'yal',416,1),(62,'yap',416,1),(63,'Bar',1860,0),(64,'Bel',1860,0),(65,'Char',1860,0),(66,'Grak\'',1860,0),(67,'Graz\'',1860,0),(68,'Grim',1860,0),(69,'Hath',1860,0),(70,'Hel',1860,0),(71,'Hok',1860,0),(72,'Jhaz',1860,0),(73,'Jhom',1860,0),(74,'Kal\'',1860,0),(75,'Klath',1860,0),(76,'Krag',1860,0),(77,'Krak',1860,0),(78,'Mak',1860,0),(79,'Mezz',1860,0),(80,'Orm',1860,0),(81,'Phan',1860,0),(82,'Sar',1860,0),(83,'Tang',1860,0),(84,'Than',1860,0),(85,'Thog',1860,0),(86,'Thok',1860,0),(87,'Zang',1860,0),(88,'Zhar\'',1860,0),(89,'doc',1860,1),(90,'dok',1860,1),(91,'garth',1860,1),(92,'gore',1860,1),(93,'gorg',1860,1),(94,'grave',1860,1),(95,'gron',1860,1),(96,'juk',1860,1),(97,'kath',1860,1),(98,'kresh',1860,1),(99,'krit',1860,1),(100,'los',1860,1),(101,'mon',1860,1),(102,'mos',1860,1),(103,'moth',1860,1),(104,'nagma',1860,1),(105,'nak',1860,1),(106,'nar',1860,1),(107,'nos',1860,1),(108,'nuz',1860,1),(109,'phog',1860,1),(110,'rath',1860,1),(111,'tast',1860,1),(112,'taz',1860,1),(113,'thak',1860,1),(114,'thang',1860,1),(115,'thyk',1860,1),(116,'vhug',1860,1),(117,'zazt',1860,1),(118,'Ael',1863,0),(119,'Aez',1863,0),(120,'Ang',1863,0),(121,'Ban',1863,0),(122,'Bet',1863,0),(123,'Bro',1863,0),(124,'Bry',1863,0),(125,'Dir',1863,0),(126,'Dom',1863,0),(127,'Drus',1863,0),(128,'Fier',1863,0),(129,'Hel',1863,0),(130,'Kal',1863,0),(131,'Lyn',1863,0),(132,'Mir',1863,0),(133,'Nim',1863,0),(134,'Sar',1863,0),(135,'Sel',1863,0),(136,'Vil',1863,0),(137,'Zah',1863,0),(138,'aith',1863,1),(139,'anda',1863,1),(140,'antia',1863,1),(141,'lissa',1863,1),(142,'neri',1863,1),(143,'neth',1863,1),(144,'nia',1863,1),(145,'nva',1863,1),(146,'ola',1863,1),(147,'ona',1863,1),(148,'ora',1863,1),(149,'riana',1863,1),(150,'riel',1863,1),(151,'tai',1863,1),(152,'vina',1863,1),(153,'wena',1863,1),(154,'wyn',1863,1),(155,'yla',1863,1),(156,'yssa',1863,1),(157,'Flaa',417,0),(158,'Fzuu',417,0),(159,'Ghaa',417,0),(160,'Gree',417,0),(161,'Haa',417,0),(162,'Jhaa',417,0),(163,'Jhuu',417,0),(164,'Khaa',417,0),(165,'Khii',417,0),(166,'Khuu',417,0),(167,'Kree',417,0),(168,'Maa',417,0),(169,'Nhee',417,0),(170,'Phuu',417,0),(171,'Pryy',417,0),(172,'Sloo',417,0),(173,'Sruu',417,0),(174,'Traa',417,0),(175,'Zhaa',417,0),(176,'dhon',417,1),(177,'dhum',417,1),(178,'don',417,1),(179,'dym',417,1),(180,'fun',417,1),(181,'ghon',417,1),(182,'ghun',417,1),(183,'grom',417,1),(184,'grym',417,1),(185,'jhom',417,1),(186,'kun',417,1),(187,'mmon',417,1),(188,'mon',417,1),(189,'nam',417,1),(190,'nem',417,1),(191,'nhym',417,1),(192,'nom',417,1),(193,'phom',417,1),(194,'roon',417,1),(195,'tom',417,1),(196,'zhem',417,1),(197,'zhum',417,1),(198,'zun',417,1);
UNLOCK TABLES;
/*!40000 ALTER TABLE `pet_name_generation` ENABLE KEYS */;

--
-- Table structure for table `pickpocketing_loot_template`
--

DROP TABLE IF EXISTS `pickpocketing_loot_template`;
CREATE TABLE `pickpocketing_loot_template` (
  `entry` int(11) unsigned NOT NULL default '0',
  `item` int(11) unsigned NOT NULL default '0',
  `ChanceOrRef` float NOT NULL default '100',
  `QuestChanceOrGroup` tinyint(3) NOT NULL default '0',
  `mincount` tinyint(3) unsigned NOT NULL default '1',
  `maxcount` tinyint(3) unsigned NOT NULL default '1',
  `quest_freeforall` tinyint(3) unsigned NOT NULL default '1',
  PRIMARY KEY  (`entry`,`item`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Loot System';

--
-- Dumping data for table `pickpocketing_loot_template`
--


/*!40000 ALTER TABLE `pickpocketing_loot_template` DISABLE KEYS */;
LOCK TABLES `pickpocketing_loot_template` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `pickpocketing_loot_template` ENABLE KEYS */;

--
-- Table structure for table `player_levelstats`
--

DROP TABLE IF EXISTS `player_levelstats`;
CREATE TABLE `player_levelstats` (
  `race` tinyint(3) unsigned NOT NULL,
  `class` tinyint(3) unsigned NOT NULL,
  `level` tinyint(3) unsigned NOT NULL,
  `hp` smallint(5) unsigned NOT NULL,
  `mana` smallint(5) unsigned NOT NULL,
  `str` tinyint(3) unsigned NOT NULL,
  `agi` tinyint(3) unsigned NOT NULL,
  `sta` tinyint(3) unsigned NOT NULL,
  `int` tinyint(3) unsigned NOT NULL,
  `spi` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY  (`race`,`class`,`level`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 PACK_KEYS=0 COMMENT='Stores levels stats.';

--
-- Dumping data for table `player_levelstats`
--


/*!40000 ALTER TABLE `player_levelstats` DISABLE KEYS */;
LOCK TABLES `player_levelstats` WRITE;
INSERT INTO `player_levelstats` VALUES (1,1,1,60,0,23,20,22,20,21),(1,1,2,79,0,24,21,23,20,21),(1,1,3,98,0,25,21,24,20,22),(1,1,4,117,0,26,22,25,20,22),(1,1,5,136,0,28,23,26,20,22),(1,1,6,155,0,29,24,27,21,22),(1,1,7,174,0,30,24,28,21,23),(1,1,8,193,0,31,25,29,21,23),(1,1,9,212,0,32,26,30,21,23),(1,1,10,231,0,33,26,31,21,24),(1,1,11,250,0,35,27,33,21,24),(1,1,12,269,0,36,28,34,21,24),(1,1,13,288,0,37,29,35,21,25),(1,1,14,308,0,39,30,36,22,25),(1,1,15,329,0,40,30,37,22,25),(1,1,16,351,0,41,31,38,22,26),(1,1,17,374,0,42,32,40,22,26),(1,1,18,398,0,44,33,41,22,26),(1,1,19,398,0,44,33,41,22,26),(1,1,20,449,0,47,35,43,22,27),(1,1,21,476,0,48,35,45,23,27),(1,1,22,504,0,49,36,46,23,28),(1,1,23,533,0,51,37,47,23,28),(1,1,24,563,0,52,38,49,23,29),(1,1,25,594,0,54,39,50,23,29),(1,1,26,626,0,55,40,51,23,29),(1,1,27,659,0,57,41,53,23,30),(1,1,28,693,0,58,42,54,24,30),(1,1,29,728,0,60,43,56,24,31),(1,1,30,764,0,62,44,57,24,31),(1,1,31,801,0,63,45,58,24,31),(1,1,32,839,0,65,46,60,24,32),(1,1,33,878,0,66,47,61,24,32),(1,1,34,918,0,68,48,63,25,33),(1,1,35,959,0,70,49,64,25,33),(1,1,36,1001,0,72,50,66,25,34),(1,1,37,1045,0,73,51,68,25,34),(1,1,38,1091,0,75,52,69,25,34),(1,1,39,1139,0,77,53,71,26,35),(1,1,40,1189,0,79,54,72,26,35),(1,1,41,1241,0,80,56,74,26,36),(1,1,42,1295,0,82,57,76,26,36),(1,1,43,1351,0,84,58,77,26,37),(1,1,44,1409,0,86,59,79,26,37),(1,1,45,1469,0,88,60,81,27,38),(1,1,46,1531,0,90,61,83,27,38),(1,1,47,1595,0,92,63,84,27,39),(1,1,48,1661,0,94,64,86,27,39),(1,1,49,1729,0,96,65,88,28,40),(1,1,50,1799,0,98,66,90,28,40),(1,1,51,1871,0,100,68,92,28,42),(1,1,52,1945,0,102,69,94,28,42),(1,1,53,2021,0,104,70,96,28,43),(1,1,54,2099,0,106,72,98,29,44),(1,1,55,2179,0,109,73,100,29,44),(1,1,56,2261,0,111,74,102,29,45),(1,1,57,2345,0,113,76,104,29,45),(1,1,58,2431,0,115,77,106,30,46),(1,1,59,2519,0,118,79,108,30,46),(1,1,60,2609,0,120,80,110,30,47),(1,2,1,68,79,22,20,22,20,22),(1,2,2,76,99,23,21,23,21,23),(1,2,3,94,119,24,21,24,21,23),(1,2,4,112,140,25,22,25,22,24),(1,2,5,130,162,26,22,26,22,25),(1,2,6,148,185,27,23,27,23,25),(1,2,7,166,209,28,23,28,24,26),(1,2,8,184,234,29,24,28,24,26),(1,2,9,202,260,30,24,29,25,27),(1,2,10,220,287,31,25,30,25,28),(1,2,11,238,315,32,25,31,26,29),(1,2,12,256,344,33,26,32,27,29),(1,2,13,274,374,34,27,33,27,30),(1,2,14,292,405,35,27,34,28,31),(1,2,15,311,437,36,28,36,29,31),(1,2,16,331,470,38,28,37,29,32),(1,2,17,352,504,39,29,38,30,33),(1,2,18,374,539,40,30,39,31,34),(1,2,19,397,575,41,30,40,31,34),(1,2,20,421,612,42,31,41,32,35),(1,2,21,446,650,43,32,42,33,36),(1,2,22,472,689,45,32,43,34,37),(1,2,23,499,729,46,33,44,34,38),(1,2,24,527,770,47,34,46,35,38),(1,2,25,556,812,48,34,47,36,39),(1,2,26,586,854,50,35,48,37,40),(1,2,27,617,896,51,36,49,37,42),(1,2,28,649,938,52,36,50,38,43),(1,2,29,682,980,54,37,52,39,44),(1,2,30,716,1022,55,38,53,40,44),(1,2,31,751,1064,56,39,54,41,45),(1,2,32,787,1106,58,39,56,42,46),(1,2,33,824,1148,59,40,57,42,47),(1,2,34,862,1190,61,41,58,43,48),(1,2,35,901,1232,62,42,60,44,49),(1,2,36,941,1274,64,43,61,45,50),(1,2,37,982,1316,65,43,62,46,51),(1,2,38,1024,1358,67,44,64,47,52),(1,2,39,1067,1400,68,45,65,48,53),(1,2,40,1111,1442,70,46,67,49,54),(1,2,41,1156,1484,71,47,68,50,55),(1,2,42,1202,1526,73,47,70,51,56),(1,2,43,1249,1568,74,48,71,52,57),(1,2,44,1297,1610,76,49,73,52,58),(1,2,45,1346,1652,78,50,74,53,59),(1,2,46,1396,1694,79,51,76,54,60),(1,2,47,1447,1736,81,52,77,56,61),(1,2,48,1499,1778,83,53,79,57,63),(1,2,49,1552,1820,84,54,81,58,65),(1,2,50,1606,1862,86,55,82,59,66),(1,2,51,1661,1904,88,56,84,60,67),(1,2,52,1717,1946,90,57,86,61,68),(1,2,53,1774,1988,92,58,87,62,69),(1,2,54,1832,2030,93,59,89,63,70),(1,2,55,1891,2072,95,60,91,64,72),(1,2,56,1951,2114,97,61,93,65,73),(1,2,57,2012,2156,99,62,94,66,74),(1,2,58,2074,2198,101,63,96,68,75),(1,2,59,2137,2240,103,64,98,69,77),(1,2,60,2201,2282,105,65,100,70,78),(1,4,1,55,0,21,23,21,20,20),(1,4,2,72,0,22,24,22,20,21),(1,4,3,89,0,22,25,22,20,22),(1,4,4,106,0,23,27,23,21,22),(1,4,5,123,0,24,28,24,21,22),(1,4,6,140,0,24,29,24,21,23),(1,4,7,157,0,25,31,25,21,23),(1,4,8,174,0,26,32,25,21,23),(1,4,9,191,0,27,33,26,21,24),(1,4,10,208,0,27,35,27,22,24),(1,4,11,225,0,28,36,28,22,25),(1,4,12,242,0,29,37,28,22,25),(1,4,13,259,0,30,39,29,22,25),(1,4,14,276,0,30,40,30,22,26),(1,4,15,293,0,31,42,30,23,26),(1,4,16,311,0,32,43,31,23,27),(1,4,17,330,0,33,44,32,23,27),(1,4,18,350,0,34,46,33,23,27),(1,4,19,371,0,35,48,33,23,28),(1,4,20,393,0,35,49,34,24,28),(1,4,21,416,0,36,51,35,24,29),(1,4,22,440,0,37,52,36,24,29),(1,4,23,465,0,38,54,37,24,30),(1,4,24,491,0,39,55,37,25,30),(1,4,25,518,0,40,57,38,25,31),(1,4,26,546,0,41,59,39,25,31),(1,4,27,575,0,42,60,40,25,31),(1,4,28,605,0,43,62,41,25,32),(1,4,29,636,0,43,64,42,26,32),(1,4,30,668,0,44,66,42,26,33),(1,4,31,701,0,45,67,43,26,33),(1,4,32,735,0,46,69,44,26,34),(1,4,33,770,0,47,71,45,27,34),(1,4,34,806,0,48,73,46,27,35),(1,4,35,843,0,49,75,47,27,35),(1,4,36,881,0,51,77,48,28,36),(1,4,37,920,0,52,78,49,28,37),(1,4,38,960,0,53,80,50,28,37),(1,4,39,1001,0,54,82,51,28,38),(1,4,40,1043,0,55,84,52,29,38),(1,4,41,1086,0,56,86,53,29,39),(1,4,42,1130,0,57,88,54,29,39),(1,4,43,1175,0,58,90,55,29,40),(1,4,44,1221,0,59,93,56,30,40),(1,4,45,1268,0,61,95,57,30,42),(1,4,46,1316,0,62,97,58,30,43),(1,4,47,1365,0,63,99,59,31,43),(1,4,48,1415,0,64,101,60,31,44),(1,4,49,1466,0,65,103,62,31,45),(1,4,50,1518,0,67,106,63,32,45),(1,4,51,1571,0,68,108,64,32,46),(1,4,52,1625,0,69,110,65,32,46),(1,4,53,1680,0,70,113,66,33,47),(1,4,54,1736,0,72,115,67,33,48),(1,4,55,1793,0,73,117,69,33,48),(1,4,56,1851,0,74,120,70,34,49),(1,4,57,1910,0,76,122,71,34,50),(1,4,58,1970,0,77,125,72,34,51),(1,4,59,2031,0,79,127,74,35,51),(1,4,60,2093,0,80,130,75,35,52),(1,5,1,61,128,20,20,20,22,24),(1,5,2,67,184,20,20,20,23,25),(1,5,3,82,209,20,20,21,24,26),(1,5,4,97,235,21,21,21,25,28),(1,5,5,112,262,21,21,21,27,29),(1,5,6,127,290,21,21,22,28,30),(1,5,7,142,319,21,21,22,29,31),(1,5,8,157,349,21,22,22,30,32),(1,5,9,172,380,21,22,23,31,34),(1,5,10,187,427,22,22,23,33,35),(1,5,11,202,445,22,22,24,34,36),(1,5,12,217,479,22,23,24,35,38),(1,5,13,232,514,22,23,24,36,39),(1,5,14,247,550,22,23,25,38,40),(1,5,15,262,587,23,23,25,39,43),(1,5,16,277,625,23,24,26,40,44),(1,5,17,292,679,23,24,26,42,45),(1,5,18,307,704,23,24,26,43,47),(1,5,19,322,745,23,25,27,44,48),(1,5,20,337,787,24,25,27,46,50),(1,5,21,352,830,24,25,28,47,51),(1,5,22,368,889,24,25,28,49,53),(1,5,23,385,919,24,26,29,50,54),(1,5,24,403,980,25,26,29,52,56),(1,5,25,422,1012,25,26,30,53,57),(1,5,26,442,1075,25,27,30,55,59),(1,5,27,463,1109,25,27,30,56,61),(1,5,28,485,1174,25,27,31,58,63),(1,5,29,508,1210,26,28,31,59,65),(1,5,30,532,1262,26,28,32,61,67),(1,5,31,557,1330,26,28,32,63,68),(1,5,32,583,1369,26,29,33,64,70),(1,5,33,610,1438,27,29,33,66,72),(1,5,34,638,1492,27,29,34,68,73),(1,5,35,667,1531,27,30,34,69,75),(1,5,36,697,1585,28,30,35,71,77),(1,5,37,728,1654,28,30,36,73,79),(1,5,38,760,1708,28,31,36,75,81),(1,5,39,793,1747,28,31,37,76,84),(1,5,40,827,1801,29,31,37,78,85),(1,5,41,862,1870,29,32,38,80,87),(1,5,42,898,1924,29,32,38,82,89),(1,5,43,935,1978,29,33,39,84,91),(1,5,44,973,2032,30,33,39,86,93),(1,5,45,1012,2086,30,33,40,88,95),(1,5,46,1052,2140,30,34,41,90,97),(1,5,47,1093,2194,31,34,41,92,99),(1,5,48,1135,2248,31,35,42,94,102),(1,5,49,1178,2302,31,35,43,96,105),(1,5,50,1222,2356,32,35,43,98,107),(1,5,51,1267,2410,32,36,44,100,109),(1,5,52,1313,2464,32,36,44,102,111),(1,5,53,1360,2518,33,37,45,104,113),(1,5,54,1408,2572,33,37,46,106,116),(1,5,55,1457,2626,33,38,46,109,118),(1,5,56,1507,2680,34,38,47,111,120),(1,5,57,1558,2734,34,39,48,113,123),(1,5,58,1610,2788,34,39,49,115,126),(1,5,59,1663,2842,35,40,49,118,129),(1,5,60,1717,2896,35,40,50,120,131),(1,8,1,61,119,20,20,20,23,22),(1,8,2,67,190,20,20,20,24,24),(1,8,3,82,216,20,20,21,25,25),(1,8,4,97,243,20,21,21,27,26),(1,8,5,112,271,20,21,21,28,28),(1,8,6,127,300,21,21,21,29,29),(1,8,7,142,330,21,21,22,30,30),(1,8,8,157,346,21,21,22,31,31),(1,8,9,172,393,21,21,22,33,32),(1,8,10,187,426,21,22,23,34,34),(1,8,11,202,460,21,22,23,35,35),(1,8,12,217,495,21,22,23,37,36),(1,8,13,232,531,21,22,24,38,37),(1,8,14,247,568,22,22,24,39,39),(1,8,15,262,606,22,23,24,41,40),(1,8,16,277,645,22,23,25,42,42),(1,8,17,292,670,22,23,25,43,44),(1,8,18,307,726,22,23,25,45,45),(1,8,19,322,753,22,23,26,46,46),(1,8,20,337,811,22,24,26,48,48),(1,8,21,352,840,23,24,26,49,49),(1,8,22,367,900,23,24,27,51,51),(1,8,23,382,931,23,24,27,52,52),(1,8,24,398,993,23,25,28,54,54),(1,8,25,415,1026,23,25,28,55,55),(1,8,26,433,1090,23,25,28,57,57),(1,8,27,452,1140,23,25,29,59,58),(1,8,28,472,1176,24,25,29,60,60),(1,8,29,493,1242,24,26,30,62,61),(1,8,30,515,1293,24,26,30,64,64),(1,8,31,538,1329,24,26,30,65,66),(1,8,32,562,1395,24,26,31,67,67),(1,8,33,587,1446,24,27,31,69,69),(1,8,34,613,1482,25,27,32,70,71),(1,8,35,640,1533,25,27,32,72,72),(1,8,36,668,1584,25,28,33,74,74),(1,8,37,697,1650,25,28,33,76,76),(1,8,38,727,1701,25,28,33,78,78),(1,8,39,758,1752,26,28,34,80,79),(1,8,40,790,1788,26,29,34,81,81),(1,8,41,823,1839,26,29,35,83,84),(1,8,42,857,1890,26,29,35,85,86),(1,8,43,892,1941,26,29,36,87,88),(1,8,44,928,1992,26,30,36,89,90),(1,8,45,965,2043,27,30,37,91,92),(1,8,46,1003,2094,27,30,37,93,94),(1,8,47,1042,2145,27,31,38,95,96),(1,8,48,1082,2211,27,31,38,98,98),(1,8,49,1123,2262,28,31,39,100,100),(1,8,50,1165,2298,28,32,39,102,102),(1,8,51,1208,2349,28,32,40,104,105),(1,8,52,1252,2400,28,32,40,106,107),(1,8,53,1297,2451,28,33,41,108,109),(1,8,54,1343,2502,29,33,42,111,111),(1,8,55,1390,2553,29,33,42,113,114),(1,8,56,1438,2604,29,34,43,115,116),(1,8,57,1487,2655,29,34,43,118,118),(1,8,58,1537,2706,30,34,44,120,120),(1,8,59,1588,2757,30,35,44,123,123),(1,8,60,1640,2808,30,35,45,125,126),(1,9,1,53,109,20,20,21,22,22),(1,9,2,68,163,20,20,22,23,24),(1,9,3,83,187,21,21,22,24,25),(1,9,4,98,212,21,21,23,25,26),(1,9,5,113,238,21,21,23,26,27),(1,9,6,128,265,21,22,24,27,28),(1,9,7,143,293,22,22,24,28,30),(1,9,8,158,322,22,22,25,29,31),(1,9,9,173,352,22,23,25,30,32),(1,9,10,188,383,23,23,26,31,33),(1,9,11,203,415,23,24,26,33,34),(1,9,12,218,448,23,24,27,34,35),(1,9,13,233,482,24,24,27,35,37),(1,9,14,248,517,24,25,28,36,38),(1,9,15,263,553,24,25,29,37,39),(1,9,16,278,590,25,26,29,38,40),(1,9,17,293,628,25,26,30,40,43),(1,9,18,309,667,25,26,30,41,44),(1,9,19,326,707,26,27,31,42,45),(1,9,20,344,748,26,27,32,43,47),(1,9,21,363,790,26,28,32,45,48),(1,9,22,383,833,27,28,33,46,49),(1,9,23,404,877,27,29,34,47,51),(1,9,24,426,922,28,29,34,49,52),(1,9,25,449,968,28,30,35,50,54),(1,9,26,473,1015,28,30,36,51,55),(1,9,27,498,1063,29,30,36,53,56),(1,9,28,524,1112,29,31,37,54,58),(1,9,29,551,1162,30,31,38,56,59),(1,9,30,579,1213,30,32,38,57,61),(1,9,31,608,1264,30,32,39,58,64),(1,9,32,638,1315,31,33,40,60,65),(1,9,33,669,1366,31,33,41,61,67),(1,9,34,701,1417,32,34,41,63,68),(1,9,35,734,1468,32,34,42,64,70),(1,9,36,768,1519,33,35,43,66,72),(1,9,37,803,1570,33,36,44,68,73),(1,9,38,839,1621,33,36,45,69,75),(1,9,39,876,1672,34,37,45,71,77),(1,9,40,914,1723,34,37,46,72,78),(1,9,41,953,1774,35,38,47,74,80),(1,9,42,993,1825,35,38,48,76,82),(1,9,43,1024,1876,36,39,48,77,86),(1,9,44,1076,1927,36,39,50,79,86),(1,9,45,1119,1978,37,40,50,81,88),(1,9,46,1153,2029,37,41,51,83,90),(1,9,47,1208,2080,38,41,52,84,92),(1,9,48,1254,2131,38,42,53,86,94),(1,9,49,1301,2182,39,43,54,88,96),(1,9,50,1349,2233,39,43,55,90,98),(1,9,51,1398,2284,40,44,56,92,100),(1,9,52,1448,2335,40,44,57,94,102),(1,9,53,1489,2386,41,45,58,96,105),(1,9,54,1541,2437,42,46,59,98,107),(1,9,55,1604,2488,42,46,60,100,109),(1,9,56,1658,2539,43,47,61,102,111),(1,9,57,1713,2590,43,48,62,104,113),(1,9,58,1769,2641,44,49,63,106,116),(1,9,59,1826,2692,44,49,64,108,118),(1,9,60,1884,2743,45,50,65,110,120),(2,1,1,80,0,26,17,24,17,23),(2,1,2,99,0,27,18,25,17,23),(2,1,3,118,0,28,18,26,17,24),(2,1,4,137,0,29,19,27,17,24),(2,1,5,156,0,31,20,28,17,24),(2,1,6,175,0,32,21,29,18,24),(2,1,7,194,0,33,21,30,18,25),(2,1,8,213,0,34,22,31,18,25),(2,1,9,232,0,35,23,32,18,25),(2,1,10,251,0,36,23,33,18,26),(2,1,11,270,0,38,24,35,18,26),(2,1,12,289,0,39,25,36,18,26),(2,1,13,308,0,40,26,37,18,27),(2,1,14,328,0,42,27,38,19,27),(2,1,15,349,0,43,27,39,19,27),(2,1,16,371,0,44,28,40,19,28),(2,1,17,394,0,45,29,42,19,28),(2,1,18,418,0,47,30,43,19,28),(2,1,19,443,0,48,31,44,19,29),(2,1,20,469,0,50,32,45,19,29),(2,1,21,496,0,51,32,47,20,29),(2,1,22,524,0,52,33,48,20,30),(2,1,23,553,0,54,34,49,20,30),(2,1,24,583,0,55,35,51,20,31),(2,1,25,614,0,57,36,52,20,31),(2,1,26,646,0,58,37,53,20,31),(2,1,27,679,0,60,38,55,20,32),(2,1,28,713,0,61,39,56,21,32),(2,1,29,748,0,63,40,58,21,33),(2,1,30,784,0,65,41,59,21,33),(2,1,31,821,0,66,42,60,21,33),(2,1,32,859,0,68,43,62,21,34),(2,1,33,898,0,69,44,63,21,34),(2,1,34,938,0,71,45,65,22,35),(2,1,35,979,0,73,46,66,22,35),(2,1,36,1021,0,75,47,68,22,36),(2,1,37,1065,0,76,48,70,22,36),(2,1,38,1111,0,78,49,71,22,36),(2,1,39,1159,0,80,50,73,23,37),(2,1,40,1209,0,82,51,74,23,37),(2,1,41,1261,0,83,53,76,23,38),(2,1,42,1315,0,85,54,78,23,38),(2,1,43,1371,0,87,55,79,23,39),(2,1,44,1429,0,89,56,81,23,39),(2,1,45,1489,0,91,57,83,24,40),(2,1,46,1551,0,93,58,85,24,40),(2,1,47,1615,0,95,60,86,24,41),(2,1,48,1681,0,97,61,88,24,41),(2,1,49,1749,0,99,62,90,25,42),(2,1,50,1819,0,101,63,92,25,42),(2,1,51,1891,0,103,65,94,25,43),(2,1,52,1965,0,105,66,96,25,43),(2,1,53,2041,0,107,67,98,25,44),(2,1,54,2119,0,109,69,100,26,45),(2,1,55,2199,0,112,70,102,26,45),(2,1,56,2281,0,114,71,104,26,46),(2,1,57,2365,0,116,73,106,26,46),(2,1,58,2451,0,118,74,108,27,47),(2,1,59,2539,0,121,76,110,27,47),(2,1,60,2629,0,123,77,112,27,48),(2,3,1,76,80,23,20,23,17,24),(2,3,2,93,88,23,21,24,18,25),(2,3,3,110,109,24,22,25,18,25),(2,3,4,127,117,24,24,25,19,26),(2,3,5,144,140,25,25,26,19,26),(2,3,6,161,150,25,26,27,20,27),(2,3,7,178,175,25,27,28,20,27),(2,3,8,195,201,26,28,29,21,28),(2,3,9,212,228,26,30,30,21,29),(2,3,10,229,256,27,31,30,22,29),(2,3,11,246,285,27,32,31,22,30),(2,3,12,263,315,28,34,32,23,31),(2,3,13,280,346,28,35,33,24,31),(2,3,14,298,378,29,36,34,24,32),(2,3,15,317,411,29,38,35,25,32),(2,3,16,337,445,30,39,36,25,33),(2,3,17,358,480,30,40,37,26,34),(2,3,18,380,516,31,42,38,27,35),(2,3,19,403,553,31,43,39,27,35),(2,3,20,427,591,32,45,40,28,36),(2,3,21,452,630,32,46,41,29,37),(2,3,22,478,670,33,48,42,29,37),(2,3,23,505,711,33,49,43,30,38),(2,3,24,533,753,34,51,44,31,39),(2,3,25,562,796,34,52,45,31,40),(2,3,26,592,840,35,54,46,32,40),(2,3,27,623,885,35,56,47,33,41),(2,3,28,655,930,36,57,48,33,42),(2,3,29,688,975,36,59,49,34,43),(2,3,30,722,1020,37,61,50,35,43),(2,3,31,757,1065,37,62,52,36,44),(2,3,32,793,1110,38,64,53,36,45),(2,3,33,830,1155,39,66,54,37,46),(2,3,34,868,1200,39,67,55,38,47),(2,3,35,907,1245,40,69,56,39,48),(2,3,36,947,1290,41,71,58,40,49),(2,3,37,988,1335,41,73,59,40,49),(2,3,38,1030,1380,42,75,60,41,50),(2,3,39,1073,1425,42,77,61,42,51),(2,3,40,1117,1470,43,78,63,43,52),(2,3,41,1162,1515,44,80,64,44,53),(2,3,42,1208,1560,44,82,65,44,54),(2,3,43,1255,1605,45,84,66,45,55),(2,3,44,1303,1650,46,86,68,46,56),(2,3,45,1352,1695,46,88,69,47,57),(2,3,46,1402,1740,47,90,71,48,58),(2,3,47,1453,1785,48,92,72,49,59),(2,3,48,1505,1830,49,95,73,50,60),(2,3,49,1558,1875,49,97,75,51,61),(2,3,50,1612,1920,50,99,76,52,62),(2,3,51,1667,1965,51,101,78,53,63),(2,3,52,1723,2010,52,103,79,54,64),(2,3,53,1780,2055,52,105,81,55,65),(2,3,54,1838,2100,53,108,82,56,66),(2,3,55,1897,2145,54,110,84,57,67),(2,3,56,1957,2190,55,112,85,58,68),(2,3,57,2018,2235,56,115,87,59,70),(2,3,58,2080,2280,56,117,89,60,71),(2,3,59,2143,2325,57,120,90,61,72),(2,3,60,2207,2370,58,122,92,62,73),(2,4,1,75,0,24,20,23,17,23),(2,4,2,92,0,25,21,24,17,23),(2,4,3,109,0,25,22,24,17,24),(2,4,4,126,0,26,24,25,18,24),(2,4,5,143,0,27,25,26,18,24),(2,4,6,160,0,27,26,26,18,25),(2,4,7,177,0,28,28,27,18,25),(2,4,8,194,0,29,29,27,18,25),(2,4,9,211,0,30,30,28,18,26),(2,4,10,228,0,30,32,29,19,26),(2,4,11,245,0,31,33,30,19,27),(2,4,12,262,0,32,34,30,19,27),(2,4,13,279,0,33,36,31,19,27),(2,4,14,296,0,33,37,32,19,28),(2,4,15,313,0,34,39,32,20,28),(2,4,16,331,0,35,40,33,20,29),(2,4,17,350,0,36,41,34,20,29),(2,4,18,370,0,37,43,35,20,29),(2,4,19,370,0,37,43,35,20,29),(2,4,20,370,0,37,43,35,20,29),(2,4,21,436,0,39,48,37,21,31),(2,4,22,460,0,40,49,38,21,31),(2,4,23,485,0,41,51,39,21,32),(2,4,24,511,0,42,52,39,22,32),(2,4,25,538,0,43,54,40,22,33),(2,4,26,566,0,44,56,41,22,33),(2,4,27,595,0,45,57,42,22,33),(2,4,28,625,0,46,59,43,22,34),(2,4,29,656,0,46,61,44,23,34),(2,4,30,688,0,47,63,44,23,35),(2,4,31,721,0,48,64,45,23,35),(2,4,32,755,0,49,66,46,23,36),(2,4,33,790,0,50,68,47,24,36),(2,4,34,826,0,51,70,48,24,37),(2,4,35,863,0,52,72,49,24,37),(2,4,36,901,0,54,74,50,25,38),(2,4,37,940,0,55,75,51,25,39),(2,4,38,985,0,56,77,52,25,39),(2,4,39,1021,0,57,79,53,25,40),(2,4,40,1063,0,58,81,54,26,40),(2,4,41,1106,0,59,83,55,26,41),(2,4,42,1150,0,60,85,56,26,41),(2,4,43,1195,0,61,87,57,26,42),(2,4,44,1241,0,62,90,58,27,42),(2,4,45,1288,0,64,92,59,27,43),(2,4,46,1336,0,65,94,60,27,44),(2,4,47,1385,0,66,96,61,28,44),(2,4,48,1435,0,67,98,62,28,45),(2,4,49,1486,0,68,100,64,28,46),(2,4,50,1538,0,70,103,65,29,46),(2,4,51,1591,0,71,105,66,29,47),(2,4,52,1645,0,72,107,67,29,47),(2,4,53,1700,0,73,110,68,30,48),(2,4,54,1756,0,75,112,69,30,49),(2,4,55,1813,0,76,114,71,30,49),(2,4,56,1871,0,77,117,72,31,50),(2,4,57,1930,0,79,119,73,31,51),(2,4,58,1990,0,80,122,74,31,52),(2,4,59,2051,0,82,124,76,32,52),(2,4,60,2113,0,83,127,77,32,53),(2,7,1,97,71,24,17,23,18,25),(2,7,2,94,80,25,17,24,19,26),(2,7,3,111,88,25,18,25,20,27),(2,7,4,128,111,26,18,26,20,28),(2,7,5,145,135,27,19,26,21,29),(2,7,6,162,160,28,19,27,22,30),(2,7,7,179,186,29,19,28,23,31),(2,7,8,196,213,29,20,29,24,31),(2,7,9,213,256,30,20,30,25,32),(2,7,10,230,270,31,21,31,25,33),(2,7,11,247,300,32,21,32,26,34),(2,7,12,264,331,33,22,33,27,35),(2,7,13,281,363,33,22,34,28,36),(2,7,14,298,396,34,23,35,29,37),(2,7,15,315,430,35,23,36,30,39),(2,7,16,332,465,36,24,37,31,40),(2,7,17,350,501,37,24,38,32,41),(2,7,18,369,538,38,25,39,33,42),(2,7,19,389,576,39,25,40,34,43),(2,7,20,410,615,40,26,41,35,44),(2,7,21,432,655,41,26,42,36,45),(2,7,22,455,731,41,27,43,37,46),(2,7,23,479,738,42,27,44,38,47),(2,7,24,504,781,43,28,45,39,49),(2,7,25,530,825,44,28,47,40,50),(2,7,26,557,914,45,29,48,41,51),(2,7,27,585,916,46,29,49,42,52),(2,7,28,614,963,47,30,50,43,53),(2,7,29,644,1011,48,30,51,44,55),(2,7,30,675,1113,49,31,52,45,56),(2,7,31,707,1124,51,31,54,47,57),(2,7,32,740,1232,52,32,55,48,59),(2,7,33,774,1283,53,33,56,49,60),(2,7,34,809,1319,54,33,57,50,61),(2,7,35,845,1370,55,34,59,51,63),(2,7,36,882,1438,56,35,60,53,64),(2,7,37,920,1489,57,35,61,54,65),(2,7,38,959,1541,58,36,63,55,67),(2,7,39,999,1593,59,36,64,56,68),(2,7,40,1040,1643,61,37,65,58,70),(2,7,41,1082,1675,62,38,67,59,71),(2,7,42,1125,1697,63,38,68,60,73),(2,7,43,1169,1710,64,39,70,61,74),(2,7,44,1214,1761,66,40,71,63,76),(2,7,45,1260,1885,67,40,73,64,77),(2,7,46,1307,1952,68,41,74,66,79),(2,7,47,1355,2004,69,42,76,67,80),(2,7,48,1404,2055,71,43,77,68,82),(2,7,49,1454,2106,72,43,79,70,84),(2,7,50,1505,2142,73,44,80,71,85),(2,7,51,1557,2210,75,45,82,73,87),(2,7,52,1610,2261,76,46,83,74,89),(2,7,53,1664,2312,78,46,85,76,90),(2,7,54,1719,2334,79,47,87,77,92),(2,7,55,1775,2364,80,48,88,79,94),(2,7,56,1832,2415,82,49,90,80,96),(2,7,57,1890,2518,83,50,92,82,97),(2,7,58,1949,2570,85,50,93,84,99),(2,7,59,2009,2621,86,51,95,85,101),(2,7,60,2070,2700,88,52,97,87,103),(2,9,1,73,109,23,17,23,19,25),(2,9,2,88,118,23,17,24,20,26),(2,9,3,103,142,24,18,24,21,27),(2,9,4,118,167,24,18,25,22,28),(2,9,5,133,193,24,18,25,23,29),(2,9,6,148,220,24,19,26,24,30),(2,9,7,163,248,25,19,26,25,32),(2,9,8,178,277,25,19,27,26,33),(2,9,9,193,307,25,20,27,27,34),(2,9,10,208,338,26,20,28,28,35),(2,9,11,223,370,26,21,28,30,36),(2,9,12,238,403,26,21,29,31,37),(2,9,13,253,437,27,21,29,32,39),(2,9,14,268,472,27,22,30,33,40),(2,9,15,283,508,27,22,31,34,41),(2,9,16,298,545,28,23,31,35,42),(2,9,17,313,583,28,23,32,37,44),(2,9,18,329,622,28,23,32,38,45),(2,9,19,364,662,29,24,33,39,46),(2,9,20,376,703,29,24,34,40,48),(2,9,21,408,745,29,25,34,42,49),(2,9,22,408,788,30,25,34,43,50),(2,9,23,424,832,30,26,35,44,52),(2,9,24,446,877,31,26,35,46,53),(2,9,25,469,923,31,27,36,47,55),(2,9,26,493,970,31,27,37,48,56),(2,9,27,518,1018,32,27,37,50,57),(2,9,28,544,1067,32,28,38,51,59),(2,9,29,571,1117,33,28,39,53,60),(2,9,30,599,1168,33,29,39,54,62),(2,9,31,628,1219,33,29,40,55,64),(2,9,32,658,1270,34,30,41,57,65),(2,9,33,679,1321,34,30,41,58,68),(2,9,34,721,1372,35,31,42,60,68),(2,9,35,754,1423,35,31,43,61,70),(2,9,36,788,1474,36,32,44,63,71),(2,9,37,823,1525,36,33,45,65,73),(2,9,38,859,1576,36,33,46,66,75),(2,9,39,896,1627,37,34,46,68,77),(2,9,40,934,1678,37,34,47,69,78),(2,9,41,973,1729,38,35,47,71,80),(2,9,42,993,1780,38,35,47,73,83),(2,9,43,1054,1831,39,36,50,74,84),(2,9,44,1096,1882,39,36,51,76,85),(2,9,45,1139,1933,40,37,51,78,87),(2,9,46,1183,1984,40,38,52,80,89),(2,9,47,1228,2035,41,38,53,81,91),(2,9,48,1274,2086,41,39,53,83,93),(2,9,49,1321,2137,42,40,54,85,96),(2,9,50,1369,2188,42,40,56,87,97),(2,9,51,1408,2239,43,41,56,89,99),(2,9,52,1468,2290,43,41,58,91,101),(2,9,53,1519,2341,44,42,59,93,103),(2,9,54,1551,2392,45,43,60,95,105),(2,9,55,1624,2443,45,43,61,97,106),(2,9,56,1678,2494,46,44,62,99,109),(2,9,57,1727,2545,46,45,62,101,110),(2,9,58,1779,2596,47,46,64,103,114),(2,9,59,1836,2647,47,46,65,105,116),(2,9,60,1904,2698,48,47,66,107,118),(3,1,1,90,0,25,16,25,19,19),(3,1,2,109,0,26,17,26,19,19),(3,1,3,128,0,27,17,27,19,20),(3,1,4,147,0,28,18,28,19,20),(3,1,5,166,0,30,19,29,19,20),(3,1,6,185,0,31,20,30,20,20),(3,1,7,204,0,32,20,31,20,21),(3,1,8,223,0,33,21,32,20,21),(3,1,9,242,0,34,22,33,20,21),(3,1,10,261,0,35,22,34,20,22),(3,1,11,280,0,37,23,36,20,22),(3,1,12,299,0,38,24,37,20,22),(3,1,13,318,0,39,25,38,20,23),(3,1,14,338,0,41,26,39,21,23),(3,1,15,359,0,42,26,40,21,23),(3,1,16,381,0,43,27,41,21,24),(3,1,17,404,0,44,28,43,21,24),(3,1,18,428,0,46,29,44,21,24),(3,1,19,453,0,47,30,45,21,25),(3,1,20,479,0,49,31,46,21,25),(3,1,21,506,0,50,31,48,22,25),(3,1,22,534,0,51,32,49,22,26),(3,1,23,563,0,53,33,50,22,26),(3,1,24,593,0,54,34,52,22,27),(3,1,25,624,0,56,35,53,22,27),(3,1,26,656,0,57,36,54,22,27),(3,1,27,689,0,59,37,56,22,28),(3,1,28,723,0,60,38,57,23,28),(3,1,29,758,0,62,39,59,23,29),(3,1,30,794,0,64,40,60,23,29),(3,1,31,831,0,65,41,61,23,29),(3,1,32,869,0,67,42,63,23,30),(3,1,33,908,0,68,43,64,23,30),(3,1,34,948,0,70,44,66,24,31),(3,1,35,989,0,72,45,67,24,31),(3,1,36,1031,0,74,46,69,24,32),(3,1,37,1075,0,75,47,71,24,32),(3,1,38,1121,0,77,48,72,24,32),(3,1,39,1169,0,79,49,74,25,33),(3,1,40,1219,0,81,50,75,25,33),(3,1,41,1271,0,82,52,77,25,34),(3,1,42,1325,0,84,53,79,25,34),(3,1,43,1381,0,86,54,80,25,35),(3,1,44,1439,0,88,55,82,25,35),(3,1,45,1499,0,90,56,84,26,36),(3,1,46,1561,0,92,57,86,26,36),(3,1,47,1625,0,94,59,87,26,37),(3,1,48,1691,0,96,60,89,26,37),(3,1,49,1759,0,98,61,91,27,38),(3,1,50,1829,0,100,62,93,27,38),(3,1,51,1901,0,102,64,95,27,39),(3,1,52,1975,0,104,65,97,27,39),(3,1,53,2051,0,106,66,99,27,40),(3,1,54,2129,0,108,68,101,28,41),(3,1,55,2209,0,111,69,103,28,41),(3,1,56,2291,0,113,70,105,28,42),(3,1,57,2375,0,115,72,107,28,42),(3,1,58,2461,0,117,73,109,29,43),(3,1,59,2549,0,120,75,111,29,43),(3,1,60,2639,0,122,76,113,29,44),(3,2,1,88,79,24,16,25,19,20),(3,2,2,106,84,25,17,26,20,21),(3,2,3,124,104,26,17,27,20,21),(3,2,4,142,125,27,18,28,21,22),(3,2,5,160,147,28,18,29,21,23),(3,2,6,178,170,29,19,30,22,23),(3,2,7,196,194,30,19,31,23,24),(3,2,8,214,219,31,20,31,23,24),(3,2,9,232,245,32,20,32,24,25),(3,2,10,250,272,33,21,33,24,26),(3,2,11,268,300,34,21,34,25,27),(3,2,12,286,329,35,22,35,26,27),(3,2,13,304,359,36,23,36,26,28),(3,2,14,322,390,37,23,37,27,29),(3,2,15,341,422,38,24,39,28,29),(3,2,16,361,455,40,24,40,28,30),(3,2,17,382,489,41,25,41,29,31),(3,2,18,404,524,42,26,42,30,32),(3,2,19,427,560,43,26,43,30,32),(3,2,20,451,597,44,27,44,31,33),(3,2,21,476,635,45,28,45,32,34),(3,2,22,502,674,47,28,46,33,35),(3,2,23,529,714,48,29,47,33,36),(3,2,24,557,755,49,30,49,34,36),(3,2,25,586,797,50,30,50,35,37),(3,2,26,616,839,52,31,51,36,38),(3,2,27,647,881,53,32,52,36,39),(3,2,28,679,923,54,32,53,37,40),(3,2,29,712,965,56,33,55,38,41),(3,2,30,746,1007,57,34,56,39,41),(3,2,31,781,1049,58,35,57,40,42),(3,2,32,817,1091,60,35,59,41,43),(3,2,33,854,1133,61,36,60,41,44),(3,2,34,892,1175,63,37,61,42,45),(3,2,35,931,1217,64,38,63,43,46),(3,2,36,971,1259,66,39,64,44,47),(3,2,37,1012,1301,67,39,65,45,48),(3,2,38,1054,1343,69,40,67,46,49),(3,2,39,1097,1385,70,41,68,47,50),(3,2,40,1141,1427,72,42,70,48,51),(3,2,41,1186,1469,73,43,71,49,52),(3,2,42,1232,1511,75,43,73,50,53),(3,2,43,1279,1553,76,44,74,51,54),(3,2,44,1327,1595,78,45,76,51,55),(3,2,45,1376,1637,80,46,77,52,56),(3,2,46,1426,1679,81,47,79,53,57),(3,2,47,1477,1721,83,48,80,55,58),(3,2,48,1529,1763,85,49,82,56,59),(3,2,49,1582,1805,86,50,84,57,61),(3,2,50,1636,1847,88,51,85,58,62),(3,2,51,1691,1889,90,52,87,59,63),(3,2,52,1747,1931,92,53,89,60,64),(3,2,53,1804,1973,94,54,90,61,65),(3,2,54,1862,2015,95,55,92,62,66),(3,2,55,1921,2057,97,56,94,63,68),(3,2,56,1981,2099,99,57,96,64,69),(3,2,57,2042,2141,101,58,97,65,70),(3,2,58,2104,2183,103,59,99,67,71),(3,2,59,2167,2225,105,60,101,68,73),(3,2,60,2231,2267,107,61,103,69,74),(3,3,1,86,80,22,19,24,19,20),(3,3,2,103,90,22,20,25,20,21),(3,3,3,120,111,23,21,26,20,21),(3,3,4,137,133,23,23,26,21,22),(3,3,5,154,156,24,24,27,21,22),(3,3,6,171,180,24,25,28,22,23),(3,3,7,188,205,24,26,29,22,23),(3,3,8,205,231,25,27,30,23,24),(3,3,9,222,258,25,29,31,23,25),(3,3,10,239,286,26,30,31,24,25),(3,3,11,256,315,26,31,32,24,26),(3,3,12,273,345,27,33,33,25,27),(3,3,13,290,376,27,34,34,26,27),(3,3,14,308,408,28,35,35,26,28),(3,3,15,327,441,28,37,36,27,28),(3,3,16,347,475,29,38,37,27,29),(3,3,17,368,510,29,39,38,28,30),(3,3,18,390,546,30,41,39,29,31),(3,3,19,413,583,30,42,40,29,31),(3,3,20,437,621,31,44,41,30,32),(3,3,21,462,660,31,45,42,31,33),(3,3,22,488,700,32,47,43,31,33),(3,3,23,515,741,32,48,44,32,34),(3,3,24,543,783,33,50,45,33,35),(3,3,25,572,826,33,51,46,33,36),(3,3,26,602,870,34,53,47,34,36),(3,3,27,633,915,34,55,48,35,37),(3,3,28,665,960,35,56,49,35,38),(3,3,29,698,1005,35,58,50,36,39),(3,3,30,732,1050,36,60,51,37,39),(3,3,31,767,1095,36,61,53,38,40),(3,3,32,803,1140,37,63,54,38,41),(3,3,33,840,1185,38,65,55,39,42),(3,3,34,878,1230,38,66,56,40,43),(3,3,35,917,1275,39,68,57,41,44),(3,3,36,957,1320,40,70,59,42,45),(3,3,37,998,1365,40,72,60,42,45),(3,3,38,1040,1410,41,74,61,43,46),(3,3,39,1083,1455,41,76,62,44,47),(3,3,40,1127,1500,42,77,64,45,48),(3,3,41,1172,1545,43,79,65,46,49),(3,3,42,1218,1590,43,81,66,46,50),(3,3,43,1265,1635,44,83,67,47,51),(3,3,44,1313,1680,45,85,69,48,52),(3,3,45,1362,1725,45,87,70,49,53),(3,3,46,1412,1770,46,89,72,50,54),(3,3,47,1463,1815,47,91,73,51,55),(3,3,48,1515,1860,48,94,74,52,56),(3,3,49,1568,1905,48,96,76,53,57),(3,3,50,1622,1950,49,98,77,54,58),(3,3,51,1677,1995,50,100,79,55,59),(3,3,52,1733,2040,51,102,80,56,60),(3,3,53,1790,2085,51,104,82,57,61),(3,3,54,1848,2130,52,107,83,58,62),(3,3,55,1907,2175,53,109,85,59,63),(3,3,56,1967,2220,54,111,86,60,64),(3,3,57,2028,2265,55,114,88,61,66),(3,3,58,2090,2310,55,116,90,62,67),(3,3,59,2153,2355,56,119,91,63,68),(3,3,60,2217,2400,57,121,93,64,69),(3,4,1,85,0,23,19,24,19,19),(3,4,2,102,0,24,20,25,19,19),(3,4,3,119,0,24,21,25,19,20),(3,4,4,136,0,25,23,26,20,20),(3,4,5,153,0,26,24,27,20,20),(3,4,6,170,0,26,25,27,20,21),(3,4,7,187,0,27,27,28,20,21),(3,4,8,204,0,28,28,28,20,21),(3,4,9,221,0,29,29,29,20,22),(3,4,10,238,0,29,31,30,21,22),(3,4,11,255,0,30,32,31,21,23),(3,4,12,272,0,31,33,31,21,23),(3,4,13,289,0,32,35,32,21,23),(3,4,14,306,0,32,36,33,21,24),(3,4,15,323,0,33,38,33,22,24),(3,4,16,341,0,34,39,34,22,25),(3,4,17,360,0,35,40,35,22,25),(3,4,18,380,0,36,42,36,22,25),(3,4,19,401,0,37,44,36,22,26),(3,4,20,423,0,37,45,37,23,26),(3,4,21,446,0,38,47,38,23,27),(3,4,22,470,0,39,48,39,23,27),(3,4,23,495,0,40,50,40,23,28),(3,4,24,521,0,41,51,40,24,28),(3,4,25,548,0,42,53,41,24,29),(3,4,26,576,0,43,55,42,24,29),(3,4,27,605,0,44,56,43,24,29),(3,4,28,635,0,45,58,44,24,30),(3,4,29,666,0,45,60,45,25,30),(3,4,30,698,0,46,62,45,25,31),(3,4,31,731,0,47,63,46,25,31),(3,4,32,765,0,48,65,47,25,32),(3,4,33,800,0,49,67,48,26,32),(3,4,34,836,0,50,69,49,26,33),(3,4,35,873,0,51,71,50,26,33),(3,4,36,911,0,53,73,51,27,34),(3,4,37,950,0,54,74,52,27,35),(3,4,38,990,0,55,76,53,27,35),(3,4,39,1031,0,56,78,54,27,36),(3,4,40,1073,0,57,80,55,28,36),(3,4,41,1116,0,58,82,56,28,37),(3,4,42,1160,0,59,84,57,28,37),(3,4,43,1205,0,60,86,58,28,38),(3,4,44,1251,0,61,89,59,29,38),(3,4,45,1298,0,63,91,60,29,39),(3,4,46,1346,0,64,93,61,29,40),(3,4,47,1395,0,65,95,62,30,40),(3,4,48,1445,0,66,97,63,30,41),(3,4,49,1496,0,67,99,65,30,42),(3,4,50,1548,0,69,102,66,31,42),(3,4,51,1601,0,70,104,67,31,43),(3,4,52,1655,0,71,106,68,31,43),(3,4,53,1710,0,72,109,69,32,44),(3,4,54,1766,0,74,111,70,32,45),(3,4,55,1823,0,75,113,72,32,45),(3,4,56,1881,0,76,116,73,33,46),(3,4,57,1940,0,78,118,74,33,47),(3,4,58,2000,0,79,121,75,33,48),(3,4,59,2061,0,81,123,77,34,48),(3,4,60,2123,0,82,126,78,34,49),(3,5,1,91,128,22,16,23,21,22),(3,5,2,97,169,22,16,23,22,23),(3,5,3,112,194,22,16,24,23,24),(3,5,4,127,220,23,17,24,24,26),(3,5,5,142,247,23,17,24,26,27),(3,5,6,157,275,23,17,25,27,28),(3,5,7,172,304,23,17,25,28,29),(3,5,8,187,334,23,18,25,29,30),(3,5,9,202,365,23,18,26,30,32),(3,5,10,217,412,24,18,26,32,33),(3,5,11,232,430,24,18,27,33,34),(3,5,12,247,464,24,19,27,34,36),(3,5,13,262,499,24,19,27,35,37),(3,5,14,277,535,24,19,28,37,38),(3,5,15,292,572,25,19,28,38,40),(3,5,16,307,610,25,20,29,39,41),(3,5,17,322,664,25,20,29,41,42),(3,5,18,337,689,25,20,29,42,44),(3,5,19,352,730,25,21,30,43,45),(3,5,20,367,772,26,21,30,45,47),(3,5,21,382,815,26,21,31,46,48),(3,5,22,398,874,26,21,31,48,50),(3,5,23,415,904,26,22,32,49,51),(3,5,24,433,965,27,22,32,51,53),(3,5,25,452,997,27,22,33,52,54),(3,5,26,472,1060,27,23,33,54,56),(3,5,27,493,1094,27,23,33,55,58),(3,5,28,515,1159,27,23,34,57,59),(3,5,29,538,1195,28,24,34,58,61),(3,5,30,562,1247,28,24,35,60,63),(3,5,31,587,1315,28,24,35,62,64),(3,5,32,613,1354,28,25,36,63,66),(3,5,33,640,1423,29,25,36,65,68),(3,5,34,668,1477,29,25,37,67,69),(3,5,35,697,1516,29,26,37,68,71),(3,5,36,727,1570,30,26,38,70,73),(3,5,37,758,1639,30,26,39,72,75),(3,5,38,790,1693,30,27,39,74,77),(3,5,39,823,1732,30,27,40,75,79),(3,5,40,857,1786,31,27,40,77,80),(3,5,41,892,1855,31,28,41,79,82),(3,5,42,928,1909,31,28,41,81,84),(3,5,43,965,1963,31,29,42,83,86),(3,5,44,1003,2017,32,29,42,85,88),(3,5,45,1042,2071,32,29,43,87,90),(3,5,46,1082,2125,32,30,44,89,92),(3,5,47,1123,2179,33,30,44,91,94),(3,5,48,1165,2233,33,31,45,93,97),(3,5,49,1208,2287,33,31,46,95,99),(3,5,50,1252,2341,34,31,46,97,101),(3,5,51,1297,2395,34,32,47,99,103),(3,5,52,1343,2449,34,32,47,101,105),(3,5,53,1390,2503,35,33,48,103,107),(3,5,54,1438,2557,35,33,49,105,110),(3,5,55,1487,2611,35,34,49,108,112),(3,5,56,1537,2665,36,34,50,110,114),(3,5,57,1588,2719,36,35,51,112,117),(3,5,58,1640,2773,36,35,52,114,119),(3,5,59,1693,2827,37,36,52,117,122),(3,5,60,1747,2881,37,36,53,119,124),(4,1,1,50,0,20,25,21,20,20),(4,1,2,69,0,21,26,22,20,20),(4,1,3,88,0,22,26,23,20,21),(4,1,4,107,0,23,27,24,20,21),(4,1,5,126,0,25,28,25,20,21),(4,1,6,145,0,26,29,26,21,21),(4,1,7,164,0,27,29,27,21,22),(4,1,8,183,0,28,30,28,21,22),(4,1,9,202,0,29,31,29,21,22),(4,1,10,221,0,30,31,30,21,23),(4,1,11,240,0,32,32,32,21,23),(4,1,12,259,0,33,33,33,21,23),(4,1,13,278,0,34,34,34,21,24),(4,1,14,298,0,36,35,35,22,24),(4,1,15,319,0,37,35,36,22,24),(4,1,16,341,0,38,36,37,22,25),(4,1,17,364,0,39,37,39,22,25),(4,1,18,388,0,41,38,40,22,25),(4,1,19,413,0,42,39,41,22,26),(4,1,20,439,0,44,40,42,22,26),(4,1,21,466,0,45,40,44,23,26),(4,1,22,494,0,46,41,45,23,27),(4,1,23,523,0,48,42,46,23,27),(4,1,24,553,0,49,43,48,23,28),(4,1,25,584,0,51,44,49,23,28),(4,1,26,616,0,52,45,50,23,28),(4,1,27,649,0,54,46,52,23,29),(4,1,28,683,0,55,47,53,24,29),(4,1,29,718,0,57,48,55,24,30),(4,1,30,754,0,59,49,56,24,30),(4,1,31,791,0,60,50,57,24,30),(4,1,32,829,0,62,51,59,24,31),(4,1,33,868,0,63,52,60,24,31),(4,1,34,908,0,65,53,62,25,32),(4,1,35,949,0,67,54,63,25,32),(4,1,36,991,0,69,55,65,25,33),(4,1,37,1035,0,70,56,67,25,33),(4,1,38,1081,0,72,57,68,25,33),(4,1,39,1129,0,74,58,70,26,34),(4,1,40,1179,0,76,59,71,26,34),(4,1,41,1231,0,77,61,73,26,35),(4,1,42,1285,0,79,62,75,26,35),(4,1,43,1341,0,81,63,76,26,36),(4,1,44,1399,0,83,64,78,26,36),(4,1,45,1459,0,85,65,80,27,37),(4,1,46,1521,0,87,66,82,27,37),(4,1,47,1585,0,89,68,83,27,38),(4,1,48,1651,0,91,69,85,27,38),(4,1,49,1719,0,93,70,87,28,39),(4,1,50,1789,0,95,71,89,28,39),(4,1,51,1861,0,97,73,91,28,40),(4,1,52,1935,0,99,74,93,28,40),(4,1,53,2011,0,101,75,95,28,41),(4,1,54,2089,0,103,77,97,29,42),(4,1,55,2169,0,106,78,99,29,42),(4,1,56,2251,0,108,79,101,29,43),(4,1,57,2335,0,110,81,103,29,43),(4,1,58,2421,0,112,82,105,30,44),(4,1,59,2509,0,115,84,107,30,44),(4,1,60,2599,0,117,85,109,30,45),(4,3,1,46,80,17,28,20,20,21),(4,3,2,63,105,17,29,21,21,22),(4,3,3,80,126,18,30,22,21,22),(4,3,4,97,148,18,32,22,22,23),(4,3,5,114,171,19,33,23,22,23),(4,3,6,131,195,19,34,24,23,24),(4,3,7,148,220,19,35,25,23,24),(4,3,8,165,246,20,36,26,24,25),(4,3,9,182,273,20,38,27,24,26),(4,3,10,199,301,21,39,27,25,26),(4,3,11,216,330,21,40,28,25,27),(4,3,12,233,360,22,42,29,26,28),(4,3,13,250,391,22,43,30,27,28),(4,3,14,268,423,23,44,31,27,29),(4,3,15,287,456,23,46,32,28,29),(4,3,16,307,490,24,47,33,28,30),(4,3,17,328,525,24,48,34,29,31),(4,3,18,350,561,25,50,35,30,32),(4,3,19,373,598,25,51,36,30,32),(4,3,20,397,636,26,53,37,31,33),(4,3,21,422,675,26,54,38,32,34),(4,3,22,448,715,27,56,39,32,34),(4,3,23,475,756,27,57,40,33,35),(4,3,24,503,798,28,59,41,34,36),(4,3,25,532,841,28,60,42,34,37),(4,3,26,562,885,29,62,43,35,37),(4,3,27,593,930,29,64,44,36,38),(4,3,28,625,975,30,65,45,36,39),(4,3,29,658,1020,30,67,46,37,40),(4,3,30,692,1065,31,69,47,38,40),(4,3,31,727,1110,31,70,49,39,41),(4,3,32,763,1155,32,72,50,39,42),(4,3,33,800,1200,33,74,51,40,43),(4,3,34,838,1245,33,75,52,41,44),(4,3,35,877,1290,34,77,53,42,45),(4,3,36,917,1335,35,79,55,43,46),(4,3,37,958,1380,35,81,56,43,46),(4,3,38,1000,1425,36,83,57,44,47),(4,3,39,1043,1470,36,85,58,45,48),(4,3,40,1087,1515,37,86,60,46,49),(4,3,41,1132,1560,38,88,61,47,50),(4,3,42,1178,1605,38,90,62,47,51),(4,3,43,1225,1650,39,92,63,48,52),(4,3,44,1273,1695,40,94,65,49,53),(4,3,45,1322,1740,40,96,66,50,54),(4,3,46,1372,1785,41,98,68,51,55),(4,3,47,1423,1830,42,100,69,52,56),(4,3,48,1475,1875,43,103,70,53,57),(4,3,49,1528,1920,43,105,72,54,58),(4,3,50,1582,1965,44,107,73,55,59),(4,3,51,1637,2010,45,109,75,56,60),(4,3,52,1693,2055,46,111,76,57,61),(4,3,53,1750,2100,46,113,78,58,62),(4,3,54,1808,2145,47,116,79,59,63),(4,3,55,1867,2190,48,118,81,60,64),(4,3,56,1927,2235,49,120,82,61,65),(4,3,57,1988,2280,50,123,84,62,67),(4,3,58,2050,2325,50,125,86,63,68),(4,3,59,2113,2370,51,128,87,64,69),(4,3,60,2177,2415,52,130,89,65,70),(4,4,1,45,0,18,28,20,20,20),(4,4,2,62,0,19,29,21,20,20),(4,4,3,79,0,19,30,21,20,21),(4,4,4,96,0,20,32,22,21,21),(4,4,5,113,0,21,33,23,21,21),(4,4,6,130,0,21,34,23,21,22),(4,4,7,147,0,22,36,24,21,22),(4,4,8,164,0,23,37,24,21,22),(4,4,9,181,0,24,38,25,21,23),(4,4,10,198,0,24,40,26,22,23),(4,4,11,215,0,25,41,27,22,24),(4,4,12,232,0,26,42,27,22,24),(4,4,13,249,0,27,44,28,22,24),(4,4,14,266,0,27,45,29,22,25),(4,4,15,283,0,28,47,29,23,25),(4,4,16,301,0,29,48,30,23,26),(4,4,17,320,0,30,49,31,23,26),(4,4,18,340,0,31,51,32,23,26),(4,4,19,361,0,32,53,32,23,27),(4,4,20,383,0,32,54,33,24,27),(4,4,21,406,0,33,56,34,24,28),(4,4,22,430,0,34,57,35,24,28),(4,4,23,455,0,35,59,36,24,29),(4,4,24,481,0,36,60,36,25,29),(4,4,25,508,0,37,62,37,25,30),(4,4,26,536,0,38,64,38,25,30),(4,4,27,565,0,39,65,39,25,30),(4,4,28,595,0,40,67,40,25,31),(4,4,29,626,0,40,69,41,26,31),(4,4,30,658,0,41,71,41,26,32),(4,4,31,691,0,42,72,42,26,32),(4,4,32,725,0,43,74,43,26,33),(4,4,33,760,0,44,76,44,27,33),(4,4,34,796,0,45,78,45,27,34),(4,4,35,833,0,46,80,46,27,34),(4,4,36,871,0,48,82,47,28,35),(4,4,37,910,0,49,83,48,28,36),(4,4,38,950,0,50,85,49,28,36),(4,4,39,991,0,51,87,50,28,37),(4,4,40,1033,0,52,89,51,29,37),(4,4,41,1076,0,53,91,52,29,38),(4,4,42,1120,0,54,93,53,29,38),(4,4,43,1165,0,55,95,54,29,39),(4,4,44,1211,0,56,98,55,30,39),(4,4,45,1258,0,58,100,56,30,40),(4,4,46,1306,0,59,102,57,30,41),(4,4,47,1355,0,60,104,58,31,41),(4,4,48,1405,0,61,106,59,31,42),(4,4,49,1456,0,62,108,61,31,43),(4,4,50,1508,0,64,111,62,32,43),(4,4,51,1561,0,65,113,63,32,44),(4,4,52,1615,0,66,115,64,32,44),(4,4,53,1670,0,67,118,65,33,45),(4,4,54,1726,0,69,120,66,33,46),(4,4,55,1783,0,70,122,68,33,46),(4,4,56,1841,0,71,125,69,34,47),(4,4,57,1900,0,73,127,70,34,48),(4,4,58,1960,0,74,130,71,34,49),(4,4,59,2021,0,76,132,73,35,49),(4,4,60,2083,0,77,135,74,35,50),(4,5,1,51,128,17,25,19,22,23),(4,5,2,66,184,17,25,19,23,24),(4,5,3,72,209,17,25,20,24,25),(4,5,4,87,235,18,26,20,25,27),(4,5,5,102,262,18,26,20,27,28),(4,5,6,117,290,18,26,21,28,29),(4,5,7,132,319,18,26,21,29,30),(4,5,8,147,349,18,27,21,30,31),(4,5,9,162,380,18,27,22,31,33),(4,5,10,177,427,19,27,22,33,34),(4,5,11,192,445,19,27,23,34,35),(4,5,12,207,479,19,28,23,35,37),(4,5,13,222,514,19,28,23,36,38),(4,5,14,237,550,19,28,24,38,39),(4,5,15,252,587,20,28,24,39,41),(4,5,16,267,625,20,29,25,40,42),(4,5,17,282,679,20,29,25,42,43),(4,5,18,297,704,20,29,25,43,45),(4,5,19,312,745,20,30,26,44,46),(4,5,20,327,787,21,30,26,46,48),(4,5,21,342,830,21,30,27,47,49),(4,5,22,358,889,21,30,27,49,51),(4,5,23,375,919,21,31,28,50,52),(4,5,24,393,980,22,31,28,52,54),(4,5,25,412,1012,22,31,29,53,55),(4,5,26,432,1075,22,32,29,55,57),(4,5,27,453,1109,22,32,29,56,59),(4,5,28,475,1174,22,32,30,58,60),(4,5,29,498,1210,23,33,30,59,62),(4,5,30,522,1262,23,33,31,61,64),(4,5,31,547,1330,23,33,31,63,65),(4,5,32,573,1369,23,34,32,64,67),(4,5,33,600,1438,24,34,32,66,69),(4,5,34,628,1492,24,34,33,68,70),(4,5,35,657,1531,24,35,33,69,72),(4,5,36,687,1585,25,35,34,71,74),(4,5,37,718,1654,25,35,35,73,76),(4,5,38,750,1708,25,36,35,75,78),(4,5,39,783,1747,25,36,36,76,80),(4,5,40,817,1801,26,36,36,78,81),(4,5,41,852,1870,26,37,37,80,83),(4,5,42,888,1924,26,37,37,82,85),(4,5,43,925,1978,26,38,38,84,87),(4,5,44,963,2032,27,38,38,86,89),(4,5,45,1002,2086,27,38,39,88,91),(4,5,46,1042,2140,27,39,40,90,93),(4,5,47,1083,2194,28,39,40,92,95),(4,5,48,1125,2248,28,40,41,94,98),(4,5,49,1168,2302,28,40,42,96,100),(4,5,50,1212,2356,29,40,42,98,102),(4,5,51,1257,2410,29,41,43,100,104),(4,5,52,1303,2464,29,41,43,102,106),(4,5,53,1350,2518,30,42,44,104,108),(4,5,54,1398,2572,30,42,45,106,111),(4,5,55,1447,2626,30,43,45,109,113),(4,5,56,1497,2680,31,43,46,111,115),(4,5,57,1548,2734,31,44,47,113,118),(4,5,58,1600,2788,31,44,48,115,120),(4,5,59,1653,2842,32,45,48,118,123),(4,5,60,1707,2896,32,45,49,120,125),(4,11,1,53,67,18,25,19,22,22),(4,11,2,61,122,19,25,20,23,23),(4,11,3,78,145,19,26,20,24,24),(4,11,4,95,169,20,26,21,25,25),(4,11,5,112,194,20,27,21,26,26),(4,11,6,129,220,21,27,22,27,27),(4,11,7,146,247,21,28,23,28,28),(4,11,8,163,260,22,28,23,28,29),(4,11,9,180,289,22,29,24,29,30),(4,11,10,197,319,23,29,24,30,31),(4,11,11,214,350,23,30,25,31,33),(4,11,12,231,382,24,30,26,32,34),(4,11,13,248,415,24,31,26,33,35),(4,11,14,265,449,25,31,27,34,36),(4,11,15,282,499,26,32,28,36,37),(4,11,16,299,535,26,32,28,37,38),(4,11,17,316,572,27,33,29,38,40),(4,11,18,334,610,27,34,30,39,41),(4,11,19,353,649,28,34,30,40,42),(4,11,20,373,689,29,35,31,41,43),(4,11,21,394,730,29,35,32,42,45),(4,11,22,416,757,30,36,33,43,46),(4,11,23,439,800,31,37,33,44,47),(4,11,24,463,859,31,37,34,46,49),(4,11,25,488,904,32,38,35,47,50),(4,11,26,514,949,33,38,36,48,51),(4,11,27,541,979,33,39,36,49,53),(4,11,28,569,1024,34,40,37,50,54),(4,11,29,598,1084,35,40,38,52,56),(4,11,30,628,1129,35,41,39,53,57),(4,11,31,659,1159,36,42,40,54,58),(4,11,32,691,1219,37,42,41,56,60),(4,11,33,724,1264,38,43,41,57,61),(4,11,34,758,1294,38,44,42,58,63),(4,11,35,793,1354,39,44,43,60,64),(4,11,36,829,1384,40,45,44,61,66),(4,11,37,866,1429,41,46,45,62,68),(4,11,38,904,1489,42,46,46,64,69),(4,11,39,943,1519,42,47,47,65,71),(4,11,40,983,1579,43,48,48,67,72),(4,11,41,1024,1609,44,49,49,68,74),(4,11,42,1066,1669,45,49,50,70,76),(4,11,43,1109,1699,46,50,51,71,77),(4,11,44,1153,1759,47,51,51,73,79),(4,11,45,1198,1789,47,52,52,74,81),(4,11,46,1244,1849,48,53,53,76,83),(4,11,47,1291,1879,49,53,55,77,84),(4,11,48,1339,1924,50,54,56,79,86),(4,11,49,1388,1984,51,55,57,81,88),(4,11,50,1438,2014,52,56,58,82,90),(4,11,51,1489,2059,53,57,59,84,92),(4,11,52,1541,2119,54,58,60,86,94),(4,11,53,1594,2149,55,59,61,87,96),(4,11,54,1648,2194,56,59,62,89,98),(4,11,55,1703,2239,57,60,63,91,100),(4,11,56,1759,2284,58,61,64,93,102),(4,11,57,1816,2329,59,62,65,94,104),(4,11,58,1874,2374,60,63,67,96,106),(4,11,59,1933,2419,61,64,68,98,108),(4,11,60,1993,2464,62,65,69,100,110),(5,1,1,70,0,22,18,23,18,25),(5,1,2,89,0,23,19,24,18,25),(5,1,3,108,0,24,19,25,18,26),(5,1,4,127,0,25,20,26,18,26),(5,1,5,146,0,27,21,27,18,26),(5,1,6,165,0,28,22,28,19,26),(5,1,7,184,0,29,22,29,19,27),(5,1,8,203,0,30,23,30,19,27),(5,1,9,222,0,31,24,31,19,27),(5,1,10,241,0,32,24,32,19,28),(5,1,11,260,0,34,25,34,19,28),(5,1,12,279,0,35,26,35,19,28),(5,1,13,298,0,36,27,36,19,29),(5,1,14,318,0,38,28,37,20,29),(5,1,15,339,0,39,28,38,20,29),(5,1,16,361,0,40,29,39,20,30),(5,1,17,384,0,41,30,41,20,30),(5,1,18,408,0,43,31,42,20,30),(5,1,19,433,0,44,32,43,20,31),(5,1,20,459,0,46,33,44,20,31),(5,1,21,486,0,47,33,46,21,31),(5,1,22,514,0,48,34,47,21,32),(5,1,23,543,0,50,35,48,21,32),(5,1,24,573,0,51,36,50,21,33),(5,1,25,604,0,53,37,51,21,33),(5,1,26,636,0,54,38,52,21,33),(5,1,27,669,0,56,39,54,21,34),(5,1,28,703,0,57,40,55,22,34),(5,1,29,738,0,59,41,57,22,35),(5,1,30,774,0,61,42,58,22,35),(5,1,31,811,0,62,43,59,22,35),(5,1,32,849,0,64,44,61,22,36),(5,1,33,888,0,65,45,62,22,36),(5,1,34,928,0,67,46,64,23,37),(5,1,35,969,0,69,47,65,23,37),(5,1,36,1011,0,71,48,67,23,38),(5,1,37,1055,0,72,49,69,23,38),(5,1,38,1101,0,74,50,70,23,38),(5,1,39,1149,0,76,51,72,24,39),(5,1,40,1199,0,78,52,73,24,39),(5,1,41,1251,0,79,54,75,24,40),(5,1,42,1305,0,81,55,77,24,40),(5,1,43,1361,0,83,56,78,24,41),(5,1,44,1419,0,85,57,80,24,41),(5,1,45,1479,0,87,58,82,25,42),(5,1,46,1541,0,89,59,84,25,42),(5,1,47,1605,0,91,61,85,25,43),(5,1,48,1671,0,93,62,87,25,43),(5,1,49,1739,0,95,63,89,26,44),(5,1,50,1809,0,97,64,91,26,44),(5,1,51,1881,0,99,66,93,26,45),(5,1,52,1955,0,101,67,95,26,45),(5,1,53,2031,0,103,68,97,26,46),(5,1,54,2109,0,105,70,99,27,47),(5,1,55,2189,0,108,71,101,27,47),(5,1,56,2271,0,110,72,103,27,48),(5,1,57,2355,0,112,74,105,27,48),(5,1,58,2441,0,114,75,107,28,49),(5,1,59,2529,0,117,77,109,28,49),(5,1,60,2619,0,119,78,111,28,50),(5,4,1,65,0,20,21,22,18,25),(5,4,2,82,0,21,22,23,18,25),(5,4,3,99,0,21,23,23,18,26),(5,4,4,116,0,22,25,24,19,26),(5,4,5,133,0,23,26,25,19,26),(5,4,6,150,0,23,27,25,19,27),(5,4,7,167,0,24,29,26,19,27),(5,4,8,184,0,25,30,26,19,27),(5,4,9,201,0,26,31,27,19,28),(5,4,10,218,0,26,33,28,20,28),(5,4,11,235,0,27,34,29,20,29),(5,4,12,252,0,28,35,29,20,29),(5,4,13,269,0,29,37,30,20,29),(5,4,14,286,0,29,38,31,20,30),(5,4,15,303,0,30,40,31,21,30),(5,4,16,321,0,31,41,32,21,31),(5,4,17,340,0,32,42,33,21,31),(5,4,18,360,0,33,44,34,21,31),(5,4,19,381,0,34,46,34,21,32),(5,4,20,403,0,34,47,35,22,32),(5,4,21,426,0,35,49,36,22,33),(5,4,22,450,0,36,50,37,22,33),(5,4,23,475,0,37,52,38,22,34),(5,4,24,501,0,38,53,38,23,34),(5,4,25,528,0,39,55,39,23,35),(5,4,26,556,0,40,57,40,23,35),(5,4,27,585,0,41,58,41,23,35),(5,4,28,615,0,42,60,42,23,36),(5,4,29,646,0,42,62,43,24,36),(5,4,30,678,0,43,64,43,24,37),(5,4,31,711,0,44,65,44,24,37),(5,4,32,745,0,45,67,45,24,38),(5,4,33,780,0,46,69,46,25,38),(5,4,34,816,0,47,71,47,25,39),(5,4,35,853,0,48,73,48,25,39),(5,4,36,891,0,50,75,49,26,40),(5,4,37,930,0,51,76,50,26,41),(5,4,38,970,0,52,78,51,26,41),(5,4,39,1011,0,53,80,52,26,42),(5,4,40,1053,0,54,82,53,27,42),(5,4,41,1096,0,55,84,54,27,43),(5,4,42,1140,0,56,86,55,27,43),(5,4,43,1185,0,57,88,56,27,44),(5,4,44,1231,0,58,91,57,28,44),(5,4,45,1278,0,60,93,58,28,45),(5,4,46,1326,0,61,95,59,28,46),(5,4,47,1375,0,62,97,60,29,46),(5,4,48,1425,0,63,99,61,29,47),(5,4,49,1476,0,64,101,63,29,48),(5,4,50,1528,0,66,104,64,30,48),(5,4,51,1581,0,67,106,65,30,49),(5,4,52,1635,0,68,108,66,30,49),(5,4,53,1690,0,69,111,67,31,50),(5,4,54,1746,0,71,113,68,31,51),(5,4,55,1803,0,72,115,70,31,51),(5,4,56,1861,0,73,118,71,32,52),(5,4,57,1920,0,75,120,72,32,53),(5,4,58,1980,0,76,123,73,32,54),(5,4,59,2041,0,78,125,75,33,54),(5,4,60,2103,0,79,128,76,33,55),(5,5,1,71,128,19,18,21,20,28),(5,5,2,77,154,19,18,21,21,29),(5,5,3,92,179,19,18,22,22,30),(5,5,4,107,205,20,19,22,23,32),(5,5,5,122,232,20,19,22,25,33),(5,5,6,137,260,20,19,23,26,34),(5,5,7,152,289,20,19,23,27,35),(5,5,8,167,319,20,20,23,28,36),(5,5,9,182,350,20,20,24,29,38),(5,5,10,197,397,21,20,24,31,39),(5,5,11,212,415,21,20,25,32,40),(5,5,12,227,449,21,21,25,33,42),(5,5,13,242,484,21,21,25,34,43),(5,5,14,257,520,21,21,26,36,44),(5,5,15,272,557,22,21,26,37,46),(5,5,16,287,595,22,22,27,38,47),(5,5,17,302,649,22,22,27,40,48),(5,5,18,317,674,22,22,27,41,50),(5,5,19,332,715,22,23,28,42,51),(5,5,20,347,757,23,23,28,44,53),(5,5,21,362,800,23,23,29,45,54),(5,5,22,378,859,23,23,29,47,56),(5,5,23,395,889,23,24,30,48,57),(5,5,24,413,950,24,24,30,50,59),(5,5,25,432,982,24,24,31,51,60),(5,5,26,452,1045,24,25,31,53,62),(5,5,27,473,1079,24,25,31,54,64),(5,5,28,495,1144,24,25,32,56,65),(5,5,29,518,1180,25,26,32,57,67),(5,5,30,542,1232,25,26,33,59,69),(5,5,31,567,1300,25,26,33,61,70),(5,5,32,593,1339,25,27,34,62,72),(5,5,33,620,1408,26,27,34,64,74),(5,5,34,648,1462,26,27,35,66,75),(5,5,35,677,1501,26,28,35,67,77),(5,5,36,707,1555,27,28,36,69,79),(5,5,37,738,1624,27,28,37,71,81),(5,5,38,770,1678,27,29,37,73,83),(5,5,39,803,1717,27,29,38,74,85),(5,5,40,837,1771,28,29,38,76,86),(5,5,41,872,1840,28,30,39,78,88),(5,5,42,908,1894,28,30,39,80,90),(5,5,43,945,1948,28,31,40,82,92),(5,5,44,983,2002,29,31,40,84,94),(5,5,45,1022,2056,29,31,41,86,96),(5,5,46,1062,2110,29,32,42,88,98),(5,5,47,1103,2164,30,32,42,90,100),(5,5,48,1145,2218,30,33,43,92,103),(5,5,49,1188,2272,30,33,44,94,105),(5,5,50,1232,2326,31,33,44,96,107),(5,5,51,1277,2380,31,34,45,98,109),(5,5,52,1323,2434,31,34,45,100,111),(5,5,53,1370,2488,32,35,46,102,113),(5,5,54,1418,2542,32,35,47,104,116),(5,5,55,1467,2596,32,36,47,107,118),(5,5,56,1517,2650,33,36,48,109,120),(5,5,57,1568,2704,33,37,49,111,123),(5,5,58,1620,2758,33,37,50,113,125),(5,5,59,1673,2812,34,38,50,116,128),(5,5,60,1727,2866,34,38,51,118,130),(5,8,1,62,135,19,18,21,27,21),(5,8,2,77,160,19,18,21,22,28),(5,8,3,92,186,19,18,22,23,29),(5,8,4,107,213,19,19,22,25,30),(5,8,5,122,241,19,19,22,26,32),(5,8,6,137,270,20,19,22,27,33),(5,8,7,152,300,20,19,23,28,34),(5,8,8,167,316,20,19,23,29,35),(5,8,9,182,363,20,19,23,31,36),(5,8,10,197,396,20,20,24,32,38),(5,8,11,212,430,20,20,24,33,39),(5,8,12,227,465,20,20,24,35,40),(5,8,13,242,501,20,20,25,36,41),(5,8,14,257,538,21,20,25,37,43),(5,8,15,272,576,21,21,25,39,44),(5,8,16,287,615,21,21,26,40,45),(5,8,17,302,640,21,21,26,41,47),(5,8,18,317,696,21,21,26,43,48),(5,8,19,332,723,21,21,27,44,49),(5,8,20,347,781,21,22,27,46,51),(5,8,21,362,810,22,22,27,47,52),(5,8,22,377,870,22,22,28,49,54),(5,8,23,392,901,22,22,28,50,55),(5,8,24,408,963,22,23,29,52,57),(5,8,25,425,996,22,23,29,53,58),(5,8,26,443,1060,22,23,29,55,60),(5,8,27,462,1110,22,23,30,57,61),(5,8,28,482,1146,23,23,30,58,63),(5,8,29,503,1212,23,24,31,60,64),(5,8,30,525,1263,23,24,31,62,66),(5,8,31,548,1299,23,24,31,63,68),(5,8,32,572,1365,23,24,32,65,69),(5,8,33,597,1416,23,25,32,67,71),(5,8,34,623,1452,24,25,33,68,73),(5,8,35,650,1503,24,25,33,70,74),(5,8,36,678,1554,24,26,34,72,76),(5,8,37,707,1620,24,26,34,74,78),(5,8,38,737,1671,24,26,34,76,80),(5,8,39,768,1722,25,26,35,78,81),(5,8,40,800,1758,25,27,35,79,83),(5,8,41,833,1809,25,27,36,81,85),(5,8,42,867,1860,25,27,36,83,87),(5,8,43,902,1911,25,27,37,85,89),(5,8,44,938,1962,25,28,37,87,91),(5,8,45,975,2013,26,28,38,89,93),(5,8,46,1013,2064,26,28,38,91,95),(5,8,47,1052,2115,26,29,39,93,97),(5,8,48,1092,2181,26,29,39,96,99),(5,8,49,1133,2232,27,29,40,98,101),(5,8,50,1175,2268,27,30,40,100,103),(5,8,51,1218,2319,27,30,41,102,105),(5,8,52,1262,2370,27,30,41,104,107),(5,8,53,1307,2421,27,31,42,106,109),(5,8,54,1353,2472,28,31,43,109,111),(5,8,55,1400,2523,28,31,43,111,114),(5,8,56,1448,2574,28,32,44,113,116),(5,8,57,1497,2625,28,32,44,116,118),(5,8,58,1547,2676,29,32,45,118,120),(5,8,59,1598,2727,29,33,45,121,123),(5,8,60,1650,2778,29,33,46,123,125),(5,9,1,63,109,19,18,22,20,27),(5,9,2,78,133,19,18,23,21,28),(5,9,3,93,157,20,19,23,22,29),(5,9,4,108,182,20,19,24,23,30),(5,9,5,123,208,20,19,24,24,31),(5,9,6,138,235,20,20,25,25,32),(5,9,7,153,263,21,20,25,26,34),(5,9,8,168,292,21,20,26,27,35),(5,9,9,183,322,21,21,26,28,36),(5,9,10,198,353,22,21,27,29,37),(5,9,11,213,385,22,22,27,31,38),(5,9,12,228,418,22,22,28,32,39),(5,9,13,243,452,23,22,28,33,41),(5,9,14,258,487,23,23,29,34,42),(5,9,15,273,523,23,23,30,35,43),(5,9,16,288,560,24,24,30,36,44),(5,9,17,303,598,24,24,31,38,46),(5,9,18,319,637,24,24,31,39,47),(5,9,19,336,677,25,25,32,40,48),(5,9,20,354,718,25,25,33,41,50),(5,9,21,373,760,25,26,33,43,51),(5,9,22,393,803,26,26,34,44,52),(5,9,23,414,847,26,27,35,45,54),(5,9,24,436,892,27,27,35,47,55),(5,9,25,459,938,27,28,36,48,57),(5,9,26,483,985,27,28,37,49,58),(5,9,27,508,1033,28,28,37,51,59),(5,9,28,534,1082,28,29,38,52,61),(5,9,29,561,1132,29,29,39,54,62),(5,9,30,589,1183,29,30,39,55,64),(5,9,31,618,1234,29,30,40,56,66),(5,9,32,648,1285,30,31,41,58,67),(5,9,33,679,1336,30,31,42,59,69),(5,9,34,711,1387,31,32,42,61,70),(5,9,35,744,1438,31,32,43,62,72),(5,9,36,768,1489,32,33,43,64,75),(5,9,37,813,1540,32,34,45,66,75),(5,9,38,849,1591,32,34,46,67,77),(5,9,39,886,1642,33,35,46,69,79),(5,9,40,924,1693,33,35,47,70,80),(5,9,41,963,1744,34,36,48,72,82),(5,9,42,993,1795,34,36,48,74,85),(5,9,43,1044,1846,35,37,50,75,86),(5,9,44,1086,1897,35,37,51,77,87),(5,9,45,1129,1948,36,38,51,79,89),(5,9,46,1173,1999,36,39,52,81,90),(5,9,47,1218,2050,37,39,53,82,93),(5,9,48,1264,2101,37,40,54,84,95),(5,9,49,1311,2152,38,41,55,86,96),(5,9,50,1339,2203,38,41,56,88,99),(5,9,51,1398,2254,39,42,57,90,101),(5,9,52,1458,2305,39,42,58,92,103),(5,9,53,1509,2356,40,43,59,94,105),(5,9,54,1551,2407,41,44,60,96,107),(5,9,55,1594,2458,41,44,60,98,110),(5,9,56,1668,2509,42,45,62,100,111),(5,9,57,1723,2560,42,46,63,102,113),(5,9,58,1769,2611,43,47,63,104,116),(5,9,59,1836,2662,43,47,65,106,118),(5,9,60,1894,2713,44,48,66,108,120),(6,1,1,80,0,28,15,24,15,22),(6,1,2,103,0,29,16,25,15,22),(6,1,3,123,0,30,16,26,15,23),(6,1,4,144,0,31,17,27,15,23),(6,1,5,163,0,33,18,28,15,23),(6,1,6,183,0,34,19,29,16,23),(6,1,7,204,0,35,19,30,16,24),(6,1,8,223,0,36,20,31,16,24),(6,1,9,244,0,37,21,32,16,24),(6,1,10,264,0,38,21,33,16,25),(6,1,11,283,0,40,22,35,16,25),(6,1,12,302,0,41,23,36,16,25),(6,1,13,322,0,42,24,37,16,26),(6,1,14,344,0,44,25,38,17,26),(6,1,15,365,0,45,25,39,17,26),(6,1,16,390,0,46,26,40,17,27),(6,1,17,414,0,47,27,42,17,27),(6,1,18,438,0,49,28,43,17,27),(6,1,19,466,0,50,29,44,17,28),(6,1,20,491,0,52,30,45,17,28),(6,1,21,520,0,53,30,47,18,28),(6,1,22,550,0,54,31,48,18,29),(6,1,23,580,0,56,32,49,18,29),(6,1,24,611,0,57,33,51,18,30),(6,1,25,645,0,59,34,52,18,30),(6,1,26,677,0,60,35,53,18,30),(6,1,27,713,0,62,36,55,18,31),(6,1,28,748,0,63,37,56,19,31),(6,1,29,785,0,65,38,58,19,32),(6,1,30,824,0,67,39,59,19,32),(6,1,31,861,0,68,40,60,19,32),(6,1,32,902,0,70,41,62,19,33),(6,1,33,942,0,71,42,63,19,33),(6,1,34,984,0,73,43,65,20,34),(6,1,35,1028,0,75,44,66,20,34),(6,1,36,1071,0,77,45,68,20,35),(6,1,37,1117,0,78,46,70,20,35),(6,1,38,1167,0,80,47,71,20,35),(6,1,39,1217,0,82,48,73,21,36),(6,1,40,1268,0,84,49,74,21,36),(6,1,41,1324,0,85,51,76,21,37),(6,1,42,1381,0,87,52,78,21,37),(6,1,43,1440,0,89,53,79,21,38),(6,1,44,1500,0,91,54,81,21,38),(6,1,45,1563,0,93,55,83,22,39),(6,1,46,1629,0,95,56,85,22,39),(6,1,47,1696,0,97,58,86,22,40),(6,1,48,1764,0,99,59,88,22,40),(6,1,49,1836,0,101,60,90,23,41),(6,1,50,1910,0,103,61,92,23,41),(6,1,51,1986,0,105,63,94,23,42),(6,1,52,2062,0,107,64,96,23,42),(6,1,53,2142,0,109,65,98,23,43),(6,1,54,2225,0,111,67,100,24,44),(6,1,55,2309,0,114,68,102,24,44),(6,1,56,2395,0,116,69,104,24,45),(6,1,57,2483,0,118,71,106,24,45),(6,1,58,2574,0,120,72,108,25,46),(6,1,59,2666,0,123,74,110,25,46),(6,1,60,2760,0,125,75,112,25,47),(6,3,1,76,80,25,18,23,15,23),(6,3,2,97,86,25,19,24,16,24),(6,3,3,115,107,26,20,25,16,24),(6,3,4,133,115,26,22,25,17,25),(6,3,5,151,138,27,23,26,17,25),(6,3,6,168,148,27,24,27,18,26),(6,3,7,186,173,27,25,28,18,26),(6,3,8,204,185,28,26,29,19,27),(6,3,9,223,212,28,28,30,19,28),(6,3,10,239,226,29,29,30,20,28),(6,3,11,257,255,29,30,31,20,29),(6,3,12,275,285,30,32,32,21,30),(6,3,13,294,316,30,33,33,22,30),(6,3,14,312,348,31,34,34,22,31),(6,3,15,333,381,31,36,35,23,31),(6,3,16,354,415,32,37,36,23,32),(6,3,17,375,450,32,38,37,24,33),(6,3,18,399,486,33,40,38,25,34),(6,3,19,424,523,33,41,39,25,34),(6,3,20,448,561,34,43,40,26,35),(6,3,21,475,600,34,44,41,27,36),(6,3,22,501,640,35,46,42,27,36),(6,3,23,530,681,35,47,43,28,37),(6,3,24,559,723,36,49,44,29,38),(6,3,25,590,766,36,50,45,29,39),(6,3,26,622,810,37,52,46,30,39),(6,3,27,653,855,37,54,47,31,40),(6,3,28,687,900,38,55,48,31,41),(6,3,29,722,945,38,57,49,32,42),(6,3,30,758,990,39,59,50,33,42),(6,3,31,795,1035,39,60,52,34,43),(6,3,32,832,1080,40,62,53,34,44),(6,3,33,871,1125,41,64,54,35,45),(6,3,34,910,1170,41,65,55,36,46),(6,3,35,952,1215,42,67,56,37,47),(6,3,36,994,1260,43,69,58,38,48),(6,3,37,1036,1305,43,71,59,38,48),(6,3,38,1082,1350,44,73,60,39,49),(6,3,39,1126,1395,44,75,61,40,50),(6,3,40,1172,1440,45,76,63,41,51),(6,3,41,1221,1485,46,78,64,42,52),(6,3,42,1268,1530,46,80,65,42,53),(6,3,43,1318,1575,47,82,66,43,54),(6,3,44,1368,1620,48,84,68,44,55),(6,3,45,1419,1665,48,86,69,45,56),(6,3,46,1473,1710,49,88,71,46,57),(6,3,47,1525,1755,50,90,72,47,58),(6,3,48,1580,1800,51,93,73,48,59),(6,3,49,1636,1845,51,95,75,49,60),(6,3,50,1692,1890,52,97,76,50,61),(6,3,51,1750,1935,53,99,78,51,62),(6,3,52,1809,1980,54,101,79,52,63),(6,3,53,1869,2025,54,103,81,53,64),(6,3,54,1930,2070,55,106,82,54,65),(6,3,55,1991,2115,56,108,84,55,66),(6,3,56,2054,2160,57,110,85,56,67),(6,3,57,2119,2205,58,113,87,57,69),(6,3,58,2184,2250,58,115,89,58,70),(6,3,59,2250,2295,59,118,90,59,71),(6,3,60,2318,2340,60,120,92,60,72),(6,7,1,97,71,26,15,23,16,24),(6,7,2,98,78,27,15,24,17,25),(6,7,3,117,86,27,16,25,18,26),(6,7,4,133,109,28,16,26,18,27),(6,7,5,152,119,29,17,26,19,28),(6,7,6,170,130,30,17,27,20,29),(6,7,7,188,156,31,17,28,21,30),(6,7,8,205,183,31,18,29,22,30),(6,7,9,223,226,32,18,30,23,31),(6,7,10,241,240,33,19,31,23,32),(6,7,11,259,270,34,19,32,24,33),(6,7,12,277,301,35,20,33,25,34),(6,7,13,294,333,35,20,34,26,35),(6,7,14,312,366,36,21,35,27,36),(6,7,15,330,400,37,21,36,28,38),(6,7,16,349,435,38,22,37,29,39),(6,7,17,367,471,39,22,38,30,40),(6,7,18,388,508,40,23,39,31,41),(6,7,19,409,546,41,23,40,32,42),(6,7,20,430,585,42,24,41,33,43),(6,7,21,454,625,43,24,42,34,44),(6,7,22,477,666,43,25,43,35,45),(6,7,23,503,708,44,25,44,36,46),(6,7,24,530,789,45,26,45,37,48),(6,7,25,556,795,46,26,47,38,49),(6,7,26,585,840,47,27,48,39,50),(6,7,27,614,886,48,27,49,40,51),(6,7,28,645,933,49,28,50,41,52),(6,7,29,677,981,50,28,51,42,54),(6,7,30,708,1030,51,29,52,43,55),(6,7,31,742,1149,53,29,54,45,56),(6,7,32,777,1201,54,30,55,46,58),(6,7,33,813,1250,55,31,56,47,59),(6,7,34,848,1290,56,31,57,48,60),(6,7,35,887,1339,57,32,59,49,62),(6,7,36,926,1339,58,33,60,51,63),(6,7,37,966,1458,59,33,61,52,64),(6,7,38,1007,1471,60,34,63,53,66),(6,7,39,1049,1509,61,34,64,54,67),(6,7,40,1092,1612,63,35,65,56,69),(6,7,41,1137,1663,64,36,67,57,70),(6,7,42,1181,1700,65,36,68,58,72),(6,7,43,1226,1751,66,37,70,59,73),(6,7,44,1275,1818,68,38,71,61,75),(6,7,45,1323,1854,69,38,73,62,76),(6,7,46,1373,1921,70,39,74,64,78),(6,7,47,1423,1972,71,40,76,65,79),(6,7,48,1474,2008,73,41,77,66,81),(6,7,49,1527,2075,74,41,79,68,83),(6,7,50,1579,2111,75,42,80,69,84),(6,7,51,1634,2178,77,43,82,71,86),(6,7,52,1691,2230,78,44,83,72,88),(6,7,53,1747,2281,80,44,85,74,89),(6,7,54,1805,2304,81,45,87,75,91),(6,7,55,1864,2333,82,46,88,77,93),(6,7,56,1923,2384,84,47,90,78,95),(6,7,57,1983,2487,85,48,92,80,96),(6,7,58,2045,2538,87,48,93,82,98),(6,7,59,2109,2565,88,49,95,83,100),(6,7,60,2174,2590,90,50,97,85,102),(6,11,1,97,67,26,15,22,17,24),(6,11,2,97,75,27,15,23,18,25),(6,11,3,113,84,27,16,23,19,26),(6,11,4,132,94,28,16,24,20,27),(6,11,5,150,119,28,17,24,21,28),(6,11,6,168,145,29,17,25,22,29),(6,11,7,185,172,29,18,26,23,30),(6,11,8,203,185,30,18,26,23,31),(6,11,9,221,214,30,19,27,24,32),(6,11,10,239,244,31,19,27,25,33),(6,11,11,257,275,31,20,28,26,35),(6,11,12,274,307,32,20,29,27,36),(6,11,13,292,340,32,21,29,28,37),(6,11,14,310,374,33,21,30,29,38),(6,11,15,329,424,34,22,31,31,39),(6,11,16,347,460,34,22,31,32,40),(6,11,17,365,497,35,23,32,33,42),(6,11,18,383,535,35,24,33,34,43),(6,11,19,402,574,36,24,33,35,44),(6,11,20,425,614,37,25,34,36,45),(6,11,21,447,655,37,25,35,37,47),(6,11,22,470,682,38,26,36,38,48),(6,11,23,494,725,39,27,36,39,49),(6,11,24,518,784,39,27,37,41,51),(6,11,25,544,829,40,28,38,42,52),(6,11,26,573,874,41,28,39,43,53),(6,11,27,601,904,41,29,39,44,55),(6,11,28,630,949,42,30,40,45,56),(6,11,29,659,1009,43,30,41,47,58),(6,11,30,691,1054,43,31,42,48,59),(6,11,31,723,1084,44,32,43,49,60),(6,11,32,757,1144,45,32,44,51,62),(6,11,33,793,1189,46,33,44,52,63),(6,11,34,827,1219,46,34,45,53,65),(6,11,35,864,1279,47,34,46,55,66),(6,11,36,903,1309,48,35,47,56,68),(6,11,37,941,1354,49,36,48,57,70),(6,11,38,982,1414,50,36,49,59,71),(6,11,39,1022,1444,50,37,50,60,73),(6,11,40,1064,1504,51,38,51,62,74),(6,11,41,1108,1534,52,39,52,63,76),(6,11,42,1151,1594,53,39,53,65,78),(6,11,43,1197,1624,54,40,54,66,79),(6,11,44,1243,1684,55,41,54,68,81),(6,11,45,1290,1714,55,42,55,69,83),(6,11,46,1339,1774,56,43,56,71,85),(6,11,47,1388,1804,57,43,58,72,86),(6,11,48,1437,1849,58,44,59,74,88),(6,11,49,1490,1909,59,45,60,76,90),(6,11,50,1542,1939,60,46,61,77,92),(6,11,51,1596,1984,61,47,62,79,94),(6,11,52,1651,2044,62,48,63,81,96),(6,11,53,1706,2074,63,49,64,82,98),(6,11,54,1763,2119,64,49,65,84,100),(6,11,55,1820,2164,65,50,66,86,102),(6,11,56,1879,2209,66,51,67,88,104),(6,11,57,1940,2254,67,52,68,89,106),(6,11,58,2000,2299,68,53,70,91,108),(6,11,59,2063,2344,69,54,71,93,110),(6,11,60,2125,2389,70,55,72,95,112),(7,1,1,50,0,18,23,21,23,20),(7,1,2,69,0,19,24,22,24,20),(7,1,3,88,0,20,24,23,24,21),(7,1,4,107,0,21,25,24,24,21),(7,1,5,126,0,23,26,25,24,21),(7,1,6,145,0,24,27,26,25,21),(7,1,7,164,0,25,27,27,25,22),(7,1,8,183,0,26,28,28,25,22),(7,1,9,202,0,27,29,29,25,22),(7,1,10,221,0,28,29,30,25,23),(7,1,11,240,0,30,30,32,25,23),(7,1,12,259,0,31,31,33,25,23),(7,1,13,278,0,32,32,34,25,24),(7,1,14,298,0,34,33,35,26,24),(7,1,15,319,0,35,33,36,26,24),(7,1,16,341,0,36,34,37,26,25),(7,1,17,364,0,37,35,39,26,25),(7,1,18,388,0,39,36,40,26,25),(7,1,19,413,0,40,37,41,26,26),(7,1,20,439,0,42,38,42,26,26),(7,1,21,466,0,43,38,44,27,26),(7,1,22,494,0,44,39,45,27,27),(7,1,23,523,0,46,40,46,27,27),(7,1,24,553,0,47,41,48,27,28),(7,1,25,584,0,49,42,49,27,28),(7,1,26,616,0,50,43,50,27,28),(7,1,27,649,0,52,44,52,27,29),(7,1,28,683,0,53,45,53,28,29),(7,1,29,718,0,55,46,55,28,30),(7,1,30,754,0,57,47,56,28,30),(7,1,31,791,0,58,48,57,28,30),(7,1,32,829,0,60,49,59,28,31),(7,1,33,868,0,61,50,60,28,31),(7,1,34,908,0,63,51,62,29,32),(7,1,35,949,0,65,52,63,29,32),(7,1,36,991,0,67,53,65,29,33),(7,1,37,1070,0,68,54,67,29,33),(7,1,38,1081,0,70,55,68,29,33),(7,1,39,1129,0,72,56,70,30,34),(7,1,40,1179,0,74,57,71,30,34),(7,1,41,1231,0,75,59,73,30,35),(7,1,42,1285,0,77,60,75,30,35),(7,1,43,1341,0,79,61,76,30,36),(7,1,44,1399,0,81,62,78,30,36),(7,1,45,1459,0,83,63,80,32,37),(7,1,46,1521,0,85,64,82,32,37),(7,1,47,1585,0,87,66,83,32,38),(7,1,48,1651,0,89,67,85,32,38),(7,1,49,1719,0,91,68,87,33,39),(7,1,50,1789,0,93,69,89,33,39),(7,1,51,1861,0,95,71,91,33,40),(7,1,52,1935,0,97,72,93,33,40),(7,1,53,2011,0,99,73,95,33,41),(7,1,54,2089,0,101,75,97,34,42),(7,1,55,2169,0,104,76,99,34,42),(7,1,56,2251,0,106,77,101,34,43),(7,1,57,2335,0,108,79,103,34,43),(7,1,58,2421,0,110,80,105,35,44),(7,1,59,2509,0,113,82,107,35,44),(7,1,60,2599,0,115,83,109,35,45),(7,4,1,45,0,16,26,20,23,20),(7,4,2,62,0,17,27,21,24,20),(7,4,3,79,0,17,28,21,24,21),(7,4,4,96,0,18,30,22,25,21),(7,4,5,113,0,19,31,23,25,21),(7,4,6,130,0,19,32,23,25,22),(7,4,7,147,0,20,34,24,25,22),(7,4,8,164,0,21,35,24,25,22),(7,4,9,181,0,22,36,25,25,23),(7,4,10,198,0,22,38,26,26,23),(7,4,11,215,0,23,39,27,26,24),(7,4,12,232,0,24,40,27,26,24),(7,4,13,249,0,25,42,28,26,24),(7,4,14,266,0,25,43,29,26,25),(7,4,15,283,0,26,45,29,27,25),(7,4,16,301,0,27,46,30,27,26),(7,4,17,320,0,28,47,31,27,26),(7,4,18,340,0,29,49,32,27,26),(7,4,19,361,0,30,51,32,27,27),(7,4,20,383,0,30,52,33,28,27),(7,4,21,406,0,31,54,34,28,28),(7,4,22,430,0,32,55,35,28,28),(7,4,23,455,0,33,57,36,28,29),(7,4,24,481,0,34,58,36,29,29),(7,4,25,508,0,35,60,37,29,30),(7,4,26,536,0,36,62,38,29,30),(7,4,27,565,0,37,63,39,29,30),(7,4,28,595,0,38,65,40,29,31),(7,4,29,626,0,38,67,41,30,31),(7,4,30,658,0,39,69,41,30,32),(7,4,31,691,0,40,70,42,30,32),(7,4,32,725,0,41,72,43,30,33),(7,4,33,760,0,42,74,44,32,33),(7,4,34,796,0,43,76,45,32,34),(7,4,35,833,0,44,78,46,32,34),(7,4,36,871,0,46,80,47,33,35),(7,4,37,910,0,47,81,48,33,36),(7,4,38,950,0,48,83,49,33,36),(7,4,39,991,0,49,85,50,33,37),(7,4,40,1033,0,50,87,51,34,37),(7,4,41,1076,0,51,89,52,34,38),(7,4,42,1120,0,52,91,53,34,38),(7,4,43,1165,0,53,93,54,34,39),(7,4,44,1211,0,54,96,55,35,39),(7,4,45,1258,0,56,98,56,35,40),(7,4,46,1306,0,57,100,57,35,41),(7,4,47,1355,0,58,102,58,36,41),(7,4,48,1405,0,59,104,59,36,42),(7,4,49,1456,0,60,106,61,36,43),(7,4,50,1508,0,62,109,62,37,43),(7,4,51,1561,0,63,111,63,37,44),(7,4,52,1615,0,64,113,64,37,44),(7,4,53,1670,0,65,116,65,38,45),(7,4,54,1726,0,67,118,66,38,46),(7,4,55,1783,0,68,120,68,38,46),(7,4,56,1841,0,69,123,69,39,47),(7,4,57,1900,0,71,125,70,39,48),(7,4,58,1960,0,72,128,71,39,49),(7,4,59,2021,0,74,130,73,40,49),(7,4,60,2083,0,75,133,74,40,50),(7,8,1,51,119,15,23,19,26,22),(7,8,2,66,280,15,23,19,28,23),(7,8,3,72,306,15,23,20,29,24),(7,8,4,87,333,15,24,20,32,25),(7,8,5,102,391,15,24,20,33,27),(7,8,6,117,420,16,24,20,34,28),(7,8,7,132,450,16,24,21,35,29),(7,8,8,147,466,16,24,21,36,30),(7,8,9,162,513,16,24,21,38,31),(7,8,10,177,546,16,25,22,39,33),(7,8,11,192,580,16,25,22,40,34),(7,8,12,207,615,16,25,22,42,35),(7,8,13,222,636,16,25,23,43,36),(7,8,14,237,673,17,25,23,44,38),(7,8,15,252,711,17,26,23,46,39),(7,8,16,267,750,17,26,24,47,40),(7,8,17,282,775,17,26,24,48,42),(7,8,18,297,831,17,26,24,50,43),(7,8,19,312,858,17,26,25,51,44),(7,8,20,327,946,17,27,25,54,46),(7,8,21,342,975,18,27,25,55,47),(7,8,22,357,1035,18,27,26,57,49),(7,8,23,372,1066,18,27,26,58,50),(7,8,24,388,1128,18,28,27,60,52),(7,8,25,405,1161,18,28,27,61,53),(7,8,26,423,1225,18,28,27,63,55),(7,8,27,442,1260,18,28,28,65,56),(7,8,28,462,1296,19,28,28,66,58),(7,8,29,483,1362,19,29,29,68,59),(7,8,30,505,1413,19,29,29,70,61),(7,8,31,528,1449,19,29,29,71,63),(7,8,32,552,1515,19,29,30,74,64),(7,8,33,577,1596,19,30,30,76,66),(7,8,34,603,1632,20,30,31,77,68),(7,8,35,630,1683,20,30,31,79,69),(7,8,36,658,1734,20,31,32,81,71),(7,8,37,687,1800,20,31,32,83,73),(7,8,38,717,1836,20,31,32,85,75),(7,8,39,748,1887,21,31,33,87,76),(7,8,40,780,1923,21,32,33,88,78),(7,8,41,813,1974,21,32,34,90,80),(7,8,42,847,2025,21,32,34,92,82),(7,8,43,882,2076,21,32,35,95,84),(7,8,44,918,2157,21,33,35,97,86),(7,8,45,955,2208,22,33,36,99,88),(7,8,46,993,2259,22,33,36,101,90),(7,8,47,1032,2310,22,34,37,103,92),(7,8,48,1072,2361,22,34,37,106,94),(7,8,49,1113,2412,23,34,38,108,96),(7,8,50,1155,2448,23,35,38,110,98),(7,8,51,1198,2499,23,35,39,112,100),(7,8,52,1242,2550,23,35,39,114,102),(7,8,53,1287,2631,23,36,40,117,104),(7,8,54,1333,2682,24,36,41,120,106),(7,8,55,1380,2733,24,36,41,122,109),(7,8,56,1428,2784,24,37,42,124,111),(7,8,57,1477,2820,24,37,42,127,113),(7,8,58,1527,2871,25,37,43,129,115),(7,8,59,1578,2922,25,38,43,132,118),(7,8,60,1630,2973,25,38,44,133,120),(7,9,1,43,109,15,23,20,25,22),(7,9,2,58,223,15,23,21,27,23),(7,9,3,73,247,16,24,21,28,24),(7,9,4,88,272,16,24,22,29,25),(7,9,5,103,298,16,24,22,30,26),(7,9,6,118,325,16,25,23,32,27),(7,9,7,133,383,17,25,23,33,29),(7,9,8,148,412,17,25,24,34,30),(7,9,9,163,442,17,26,24,35,31),(7,9,10,178,473,18,26,25,36,32),(7,9,11,193,505,18,27,25,38,33),(7,9,12,208,538,18,27,26,39,34),(7,9,13,223,572,19,27,26,40,36),(7,9,14,238,607,19,28,27,41,37),(7,9,15,253,643,19,28,28,42,38),(7,9,16,268,665,20,29,28,43,39),(7,9,17,283,703,20,29,29,45,41),(7,9,18,299,742,20,29,29,46,42),(7,9,19,316,782,21,30,30,47,43),(7,9,20,334,823,21,30,31,48,45),(7,9,21,353,865,21,31,31,50,46),(7,9,22,373,908,22,31,32,51,47),(7,9,23,394,952,22,32,33,53,49),(7,9,24,416,1027,23,32,33,55,50),(7,9,25,439,1073,23,33,34,56,52),(7,9,26,463,1120,23,33,35,57,53),(7,9,27,488,1168,24,33,35,59,54),(7,9,28,514,1217,24,34,36,60,56),(7,9,29,541,1267,25,34,37,62,57),(7,9,30,569,1318,25,35,37,63,59),(7,9,31,588,1354,25,35,37,64,62),(7,9,32,628,1405,26,36,39,66,62),(7,9,33,659,1456,26,36,40,67,64),(7,9,34,691,1507,27,37,40,69,65),(7,9,35,724,1558,27,37,41,70,67),(7,9,36,758,1609,28,38,42,72,69),(7,9,37,793,1690,28,39,43,75,69),(7,9,38,829,1741,28,39,44,76,72),(7,9,39,866,1792,29,40,44,78,74),(7,9,40,904,1843,29,40,45,79,75),(7,9,41,943,1894,30,41,46,81,77),(7,9,42,983,1945,30,41,47,83,79),(7,9,43,1024,1996,31,42,48,84,81),(7,9,44,1066,2032,31,42,49,86,82),(7,9,45,1109,2083,32,43,49,88,84),(7,9,46,1153,2134,32,44,50,90,86),(7,9,47,1198,2185,33,44,51,91,88),(7,9,48,1234,2236,33,45,52,93,90),(7,9,49,1281,2317,34,46,53,96,92),(7,9,50,1339,2368,34,46,54,98,93),(7,9,51,1388,2419,35,47,55,100,96),(7,9,52,1418,2470,35,47,56,102,98),(7,9,53,1489,2521,36,48,57,104,100),(7,9,54,1541,2557,37,49,58,106,102),(7,9,55,1584,2608,37,49,58,108,104),(7,9,56,1648,2659,38,50,60,110,106),(7,9,57,1683,2710,38,51,61,112,108),(7,9,58,1759,2761,39,52,62,114,111),(7,9,59,1816,2842,39,52,63,117,111),(7,9,60,1874,2893,40,53,64,119,115),(8,1,1,70,0,24,22,23,16,21),(8,1,2,89,0,25,23,24,16,21),(8,1,3,108,0,26,23,25,16,22),(8,1,4,127,0,27,24,26,16,22),(8,1,5,146,0,29,25,27,16,22),(8,1,6,165,0,30,26,28,17,22),(8,1,7,184,0,31,26,29,17,23),(8,1,8,203,0,32,27,30,17,23),(8,1,9,222,0,33,28,31,17,23),(8,1,10,241,0,34,28,32,17,24),(8,1,11,260,0,36,29,34,17,24),(8,1,12,279,0,37,30,35,17,24),(8,1,13,298,0,38,31,36,17,25),(8,1,14,318,0,40,32,37,18,25),(8,1,15,339,0,41,32,38,18,25),(8,1,16,361,0,42,33,39,18,26),(8,1,17,384,0,43,34,41,18,26),(8,1,18,408,0,45,35,42,18,26),(8,1,19,433,0,46,36,43,18,27),(8,1,20,459,0,48,37,44,18,27),(8,1,21,486,0,49,37,46,19,27),(8,1,22,514,0,50,38,47,19,28),(8,1,23,543,0,52,39,48,19,28),(8,1,24,573,0,53,40,50,19,29),(8,1,25,604,0,55,41,51,19,29),(8,1,26,636,0,56,42,52,19,29),(8,1,27,669,0,58,43,54,19,30),(8,1,28,703,0,59,44,55,20,30),(8,1,29,738,0,61,45,57,20,31),(8,1,30,774,0,63,46,58,20,31),(8,1,31,811,0,64,47,59,20,31),(8,1,32,849,0,66,48,61,20,32),(8,1,33,888,0,67,49,62,20,32),(8,1,34,928,0,69,50,64,21,33),(8,1,35,969,0,71,51,65,21,33),(8,1,36,1011,0,73,52,67,21,34),(8,1,37,1055,0,74,53,69,21,34),(8,1,38,1101,0,76,54,70,21,34),(8,1,39,1149,0,78,55,72,22,35),(8,1,40,1199,0,80,56,73,22,35),(8,1,41,1251,0,81,58,75,22,36),(8,1,42,1310,0,83,59,77,22,36),(8,1,43,1361,0,85,60,78,22,37),(8,1,44,1419,0,87,61,80,22,37),(8,1,45,1529,0,89,62,82,23,38),(8,1,46,1541,0,91,63,84,23,38),(8,1,47,1605,0,93,65,85,23,39),(8,1,48,1671,0,95,66,87,23,39),(8,1,49,1739,0,97,67,89,24,40),(8,1,50,1809,0,99,68,91,24,40),(8,1,51,1881,0,101,70,93,24,41),(8,1,52,1955,0,103,71,95,24,41),(8,1,53,2031,0,105,72,97,24,42),(8,1,54,2109,0,107,74,99,25,43),(8,1,55,2189,0,110,75,101,25,43),(8,1,56,2271,0,112,76,103,25,44),(8,1,57,2355,0,114,78,105,25,44),(8,1,58,2441,0,116,79,107,26,45),(8,1,59,2529,0,119,81,109,26,45),(8,1,60,2619,0,121,82,111,26,46),(8,3,1,66,80,21,25,22,16,22),(8,3,2,83,87,21,26,23,17,23),(8,3,3,100,108,22,27,24,17,23),(8,3,4,117,116,22,29,24,18,24),(8,3,5,134,139,23,30,25,18,24),(8,3,6,151,149,23,31,26,19,25),(8,3,7,168,174,23,32,27,19,25),(8,3,8,185,186,24,33,28,20,26),(8,3,9,202,213,24,35,29,20,27),(8,3,10,219,241,25,36,29,21,27),(8,3,11,236,270,25,37,30,21,28),(8,3,12,253,300,26,39,31,22,29),(8,3,13,270,331,26,40,32,23,29),(8,3,14,288,363,27,41,33,23,30),(8,3,15,307,396,27,43,34,24,30),(8,3,16,327,430,28,44,35,24,31),(8,3,17,348,465,28,45,36,25,32),(8,3,18,370,501,29,47,37,26,33),(8,3,19,393,538,29,48,38,26,33),(8,3,20,417,576,30,50,39,27,34),(8,3,21,442,615,30,51,40,28,35),(8,3,22,468,655,31,53,41,28,35),(8,3,23,495,696,31,54,42,29,36),(8,3,24,523,738,32,56,43,30,37),(8,3,25,552,781,32,57,44,30,38),(8,3,26,582,825,33,59,45,31,38),(8,3,27,613,870,33,61,46,32,39),(8,3,28,645,915,34,62,47,32,40),(8,3,29,678,960,34,64,48,33,41),(8,3,30,712,1005,35,66,49,34,41),(8,3,31,747,1050,35,67,51,35,42),(8,3,32,783,1095,36,69,52,35,43),(8,3,33,820,1140,37,71,53,36,44),(8,3,34,858,1185,37,72,54,37,45),(8,3,35,897,1230,38,74,55,38,46),(8,3,36,937,1275,39,76,57,39,47),(8,3,37,978,1320,39,78,58,39,47),(8,3,38,1020,1365,40,80,59,40,48),(8,3,39,1063,1410,40,82,60,41,49),(8,3,40,1107,1455,41,83,62,42,50),(8,3,41,1152,1500,42,85,63,43,51),(8,3,42,1198,1545,42,87,64,43,52),(8,3,43,1245,1590,43,89,65,44,53),(8,3,44,1293,1635,44,91,67,45,54),(8,3,45,1342,1680,44,93,68,46,55),(8,3,46,1392,1725,45,95,70,47,56),(8,3,47,1443,1770,46,97,71,48,57),(8,3,48,1495,1815,47,100,72,49,58),(8,3,49,1548,1860,47,102,74,50,59),(8,3,50,1602,1905,48,104,75,51,60),(8,3,51,1657,1950,49,106,77,52,61),(8,3,52,1713,1995,50,108,78,53,62),(8,3,53,1770,2040,50,110,80,54,63),(8,3,54,1828,2085,51,113,81,55,64),(8,3,55,1887,2130,52,115,83,56,65),(8,3,56,1947,2175,53,117,84,57,66),(8,3,57,2008,2220,54,120,86,58,68),(8,3,58,2070,2265,54,122,88,59,69),(8,3,59,2133,2310,55,125,89,60,70),(8,3,60,2197,2355,56,127,91,61,71),(8,4,1,65,0,22,25,22,16,21),(8,4,2,82,0,23,26,23,16,21),(8,4,3,99,0,23,27,23,16,22),(8,4,4,116,0,24,29,24,17,22),(8,4,5,133,0,25,30,25,17,22),(8,4,6,150,0,25,31,25,17,23),(8,4,7,167,0,26,33,26,17,23),(8,4,8,184,0,27,34,26,17,23),(8,4,9,201,0,28,35,27,17,24),(8,4,10,218,0,28,37,28,18,24),(8,4,11,235,0,29,38,29,18,25),(8,4,12,252,0,30,39,29,18,25),(8,4,13,269,0,31,41,30,18,25),(8,4,14,286,0,31,42,31,18,26),(8,4,15,303,0,32,44,31,19,26),(8,4,16,321,0,33,45,32,19,27),(8,4,17,340,0,34,46,33,19,27),(8,4,18,360,0,35,48,34,19,27),(8,4,19,381,0,36,50,34,19,28),(8,4,20,403,0,36,51,35,20,28),(8,4,21,426,0,37,53,36,20,29),(8,4,22,450,0,38,54,37,20,29),(8,4,23,475,0,39,56,38,20,30),(8,4,24,501,0,40,57,38,21,30),(8,4,25,528,0,41,59,39,21,31),(8,4,26,556,0,42,61,40,21,31),(8,4,27,585,0,43,62,41,21,31),(8,4,28,615,0,44,64,42,21,32),(8,4,29,646,0,44,66,43,22,32),(8,4,30,678,0,45,68,43,22,33),(8,4,31,711,0,46,69,44,22,33),(8,4,32,745,0,47,71,45,22,34),(8,4,33,780,0,48,73,46,23,34),(8,4,34,816,0,49,75,47,23,35),(8,4,35,853,0,50,77,48,23,35),(8,4,36,891,0,52,79,49,24,36),(8,4,37,930,0,53,80,50,24,37),(8,4,38,970,0,54,82,51,24,37),(8,4,39,1011,0,55,84,52,24,38),(8,4,40,1053,0,56,86,53,25,38),(8,4,41,1096,0,57,88,54,25,39),(8,4,42,1140,0,58,90,55,25,39),(8,4,43,1185,0,59,92,56,25,40),(8,4,44,1231,0,60,95,57,26,40),(8,4,45,1278,0,62,97,58,26,41),(8,4,46,1326,0,63,99,59,26,42),(8,4,47,1375,0,64,101,60,27,42),(8,4,48,1425,0,65,103,61,27,43),(8,4,49,1476,0,66,105,63,27,44),(8,4,50,1528,0,68,108,64,28,44),(8,4,51,1581,0,69,110,65,28,45),(8,4,52,1635,0,70,112,66,28,45),(8,4,53,1690,0,71,115,67,29,46),(8,4,54,1746,0,73,117,68,29,47),(8,4,55,1803,0,74,119,70,29,47),(8,4,56,1861,0,75,122,71,30,48),(8,4,57,1920,0,77,124,72,30,49),(8,4,58,1980,0,78,127,73,30,50),(8,4,59,2041,0,80,129,75,31,50),(8,4,60,2103,0,81,132,76,31,51),(8,5,1,71,128,21,22,21,18,24),(8,5,2,77,138,21,22,21,19,25),(8,5,3,92,149,21,22,22,20,26),(8,5,4,107,175,22,23,22,21,28),(8,5,5,122,202,22,23,22,23,29),(8,5,6,137,230,22,23,23,24,30),(8,5,7,152,259,22,23,23,25,31),(8,5,8,167,289,22,24,23,26,32),(8,5,9,182,320,22,24,24,27,34),(8,5,10,197,367,23,24,24,29,35),(8,5,11,212,385,23,24,25,30,36),(8,5,12,227,419,23,25,25,31,38),(8,5,13,242,454,23,25,25,32,39),(8,5,14,257,490,23,25,26,34,40),(8,5,15,272,527,24,25,26,35,42),(8,5,16,287,565,24,26,27,36,43),(8,5,17,302,619,24,26,27,38,44),(8,5,18,317,644,24,26,27,39,46),(8,5,19,332,685,24,27,28,40,47),(8,5,20,347,727,25,27,28,42,49),(8,5,21,362,770,25,27,29,43,50),(8,5,22,378,829,25,27,29,45,52),(8,5,23,395,859,25,28,30,46,53),(8,5,24,413,920,26,28,30,48,55),(8,5,25,432,952,26,28,31,49,56),(8,5,26,452,1015,26,29,31,51,58),(8,5,27,473,1049,26,29,31,52,60),(8,5,28,495,1114,26,29,32,54,61),(8,5,29,518,1150,27,30,32,55,63),(8,5,30,542,1202,27,30,33,57,65),(8,5,31,567,1270,27,30,33,59,66),(8,5,32,593,1309,27,31,34,60,68),(8,5,33,620,1378,28,31,34,62,70),(8,5,34,648,1432,28,31,35,64,71),(8,5,35,677,1471,28,32,35,65,73),(8,5,36,707,1525,29,32,36,67,75),(8,5,37,738,1594,29,32,37,69,77),(8,5,38,770,1648,29,33,37,71,79),(8,5,39,803,1687,29,33,38,72,81),(8,5,40,837,1741,30,33,38,74,82),(8,5,41,872,1810,30,34,39,76,84),(8,5,42,908,1864,30,34,39,78,86),(8,5,43,945,1918,30,35,40,80,88),(8,5,44,983,1972,31,35,40,82,90),(8,5,45,1022,2026,31,35,41,84,92),(8,5,46,1062,2080,31,36,42,86,94),(8,5,47,1103,2134,32,36,42,88,96),(8,5,48,1145,2188,32,37,43,90,99),(8,5,49,1238,2242,32,37,44,92,101),(8,5,50,1252,2296,33,37,44,94,103),(8,5,51,1277,2350,33,38,45,96,105),(8,5,52,1323,2404,33,38,45,98,107),(8,5,53,1370,2458,34,39,46,100,109),(8,5,54,1418,2512,34,39,47,102,112),(8,5,55,1467,2566,34,40,47,105,114),(8,5,56,1517,2620,35,40,48,107,116),(8,5,57,1568,2674,35,41,49,109,119),(8,5,58,1620,2728,35,41,50,111,121),(8,5,59,1673,2782,36,42,50,114,124),(8,5,60,1727,2836,36,42,51,116,126),(8,7,1,87,71,22,22,22,17,23),(8,7,2,84,79,23,22,23,18,24),(8,7,3,101,87,23,23,24,19,25),(8,7,4,118,110,24,23,25,19,26),(8,7,5,135,120,25,24,25,20,27),(8,7,6,152,145,26,24,26,21,28),(8,7,7,169,171,27,24,27,22,29),(8,7,8,186,198,27,25,28,23,29),(8,7,9,203,241,28,25,29,24,30),(8,7,10,220,255,29,26,30,24,31),(8,7,11,237,285,30,26,31,25,32),(8,7,12,254,316,31,27,32,26,33),(8,7,13,271,348,31,27,33,27,34),(8,7,14,288,381,32,28,34,28,35),(8,7,15,305,415,33,28,35,29,37),(8,7,16,322,450,34,29,36,30,38),(8,7,17,340,486,35,29,37,31,39),(8,7,18,359,523,36,30,38,32,40),(8,7,19,379,589,37,30,39,33,41),(8,7,20,400,600,38,31,40,34,42),(8,7,21,422,640,39,31,41,35,43),(8,7,22,445,681,39,32,42,36,44),(8,7,23,469,723,40,32,43,37,45),(8,7,24,494,766,41,33,44,38,47),(8,7,25,520,810,42,33,46,39,48),(8,7,26,547,898,43,34,47,40,49),(8,7,27,575,947,44,34,48,41,50),(8,7,28,604,996,45,35,49,42,51),(8,7,29,634,996,46,35,50,43,53),(8,7,30,665,1045,47,36,51,44,54),(8,7,31,697,1165,49,36,53,46,55),(8,7,32,730,1216,50,37,54,47,57),(8,7,33,764,1277,51,38,55,48,58),(8,7,34,799,1304,52,38,56,49,59),(8,7,35,835,1355,53,39,58,50,61),(8,7,36,872,1412,54,40,59,52,62),(8,7,37,910,1473,55,40,60,53,63),(8,7,38,949,1525,56,41,62,54,65),(8,7,39,989,1561,57,41,63,55,66),(8,7,40,1030,1599,59,42,64,57,68),(8,7,41,1072,1627,60,43,66,58,69),(8,7,42,1115,1683,61,43,67,59,71),(8,7,43,1159,1716,62,44,69,60,72),(8,7,44,1204,1746,64,45,70,62,74),(8,7,45,1250,1780,65,45,72,63,75),(8,7,46,1297,1844,66,46,73,65,77),(8,7,47,1345,1988,67,47,75,66,78),(8,7,48,1394,2024,69,48,76,67,80),(8,7,49,1444,2077,70,48,78,69,82),(8,7,50,1495,2127,71,49,79,70,83),(8,7,51,1547,2177,73,50,81,72,85),(8,7,52,1600,2204,74,51,82,73,87),(8,7,53,1654,2235,76,51,84,75,88),(8,7,54,1709,2256,77,52,86,76,90),(8,7,55,1765,2286,78,53,87,78,92),(8,7,56,1822,2319,80,54,89,79,94),(8,7,57,1880,2384,81,55,91,81,95),(8,7,58,1939,2432,83,55,92,83,97),(8,7,59,1999,2481,84,56,94,84,99),(8,7,60,2060,2530,86,57,96,86,101),(8,8,1,71,119,21,22,21,19,23),(8,8,2,77,130,21,22,21,20,24),(8,8,3,92,156,21,22,22,21,25),(8,8,4,107,183,21,23,22,23,26),(8,8,5,122,211,21,23,22,24,28),(8,8,6,137,240,22,23,22,25,29),(8,8,7,152,270,22,23,23,26,30),(8,8,8,167,286,22,23,23,27,31),(8,8,9,182,333,22,23,23,29,32),(8,8,10,197,366,22,24,24,30,34),(8,8,11,212,400,22,24,24,31,35),(8,8,12,227,435,22,24,24,33,36),(8,8,13,242,471,22,24,25,34,37),(8,8,14,257,508,23,24,25,35,39),(8,8,15,272,546,23,25,25,37,40),(8,8,16,287,585,23,25,26,38,41),(8,8,17,302,610,23,25,26,39,43),(8,8,18,317,666,23,25,26,41,44),(8,8,19,332,693,23,25,27,42,45),(8,8,20,347,751,23,26,27,44,47),(8,8,21,362,780,24,26,27,45,48),(8,8,22,377,840,24,26,28,47,50),(8,8,23,392,871,24,26,28,48,51),(8,8,24,408,933,24,27,29,50,53),(8,8,25,425,966,24,27,29,51,54),(8,8,26,443,1030,24,27,29,53,56),(8,8,27,462,1080,24,27,30,55,57),(8,8,28,482,1116,25,27,30,56,59),(8,8,29,503,1182,25,28,31,58,60),(8,8,30,525,1233,25,28,31,60,62),(8,8,31,548,1269,25,28,31,61,64),(8,8,32,572,1335,25,28,32,63,65),(8,8,33,597,1386,25,29,32,65,67),(8,8,34,623,1422,26,29,33,66,69),(8,8,35,650,1473,26,29,33,68,70),(8,8,36,678,1524,26,30,34,70,72),(8,8,37,707,1590,26,30,34,72,74),(8,8,38,737,1641,26,30,34,74,76),(8,8,39,768,1692,27,30,35,76,77),(8,8,40,800,1728,27,31,35,77,79),(8,8,41,833,1779,27,31,36,79,81),(8,8,42,867,1830,27,31,36,81,83),(8,8,43,902,1881,27,31,37,83,85),(8,8,44,938,1932,27,32,37,85,87),(8,8,45,975,1983,28,32,38,87,89),(8,8,46,1013,2034,28,32,38,89,91),(8,8,47,1092,2085,28,33,39,91,93),(8,8,48,1102,2151,28,33,39,94,95),(8,8,49,1133,2202,29,33,40,96,97),(8,8,50,1175,2238,29,34,40,98,99),(8,8,51,1218,2289,29,34,41,100,101),(8,8,52,1262,2340,29,34,41,102,103),(8,8,53,1307,2391,29,35,42,104,105),(8,8,54,1353,2442,30,35,43,107,107),(8,8,55,1400,2508,30,35,43,109,110),(8,8,56,1448,2547,30,36,44,111,112),(8,8,57,1497,2595,30,36,44,114,114),(8,8,58,1547,2646,31,36,45,116,116),(8,8,59,1589,2697,31,37,45,119,119),(8,8,60,1650,2748,31,37,46,121,121);
UNLOCK TABLES;
/*!40000 ALTER TABLE `player_levelstats` ENABLE KEYS */;

--
-- Table structure for table `playercreateinfo`
--

DROP TABLE IF EXISTS `playercreateinfo`;
CREATE TABLE `playercreateinfo` (
  `race` tinyint(3) unsigned NOT NULL default '0',
  `class` tinyint(3) unsigned NOT NULL default '0',
  `map` mediumint(8) unsigned NOT NULL default '0',
  `zone` mediumint(8) unsigned NOT NULL default '0',
  `position_x` float NOT NULL default '0',
  `position_y` float NOT NULL default '0',
  `position_z` float NOT NULL default '0',
  `displayID` smallint(5) unsigned NOT NULL default '0',
  PRIMARY KEY  (`race`,`class`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `playercreateinfo`
--


/*!40000 ALTER TABLE `playercreateinfo` DISABLE KEYS */;
LOCK TABLES `playercreateinfo` WRITE;
INSERT INTO `playercreateinfo` VALUES (1,1,0,12,-8949,-132,84,49),(1,2,0,12,-8949,-132,84,49),(1,4,0,12,-8949,-132,84,49),(1,5,0,12,-8949,-132,84,49),(1,8,0,12,-8949,-132,84,49),(1,9,0,12,-8949,-132,84,49),(2,1,1,14,-618,-4251,39,51),(2,3,1,14,-618,-4251,39,51),(2,4,1,14,-618,-4251,39,51),(2,7,1,14,-618,-4251,39,51),(2,9,1,14,-618,-4251,39,51),(3,1,0,1,-6240,331,383,53),(3,2,0,1,-6240,331,383,53),(3,3,0,1,-6240,331,383,53),(3,4,0,1,-6240,331,383,53),(3,5,0,1,-6240,331,383,53),(4,1,1,141,10311,832,1327,55),(4,3,1,141,10311,832,1327,55),(4,4,1,141,10311,832,1327,55),(4,5,1,141,10311,832,1327,55),(4,11,1,141,10311,832,1327,55),(5,1,0,85,1676,1677,122,57),(5,4,0,85,1676,1677,122,57),(5,5,0,85,1676,1677,122,57),(5,8,0,85,1676,1677,122,57),(5,9,0,85,1676,1677,122,57),(6,1,1,215,-2917,-257,53,59),(6,3,1,215,-2917,-257,53,59),(6,7,1,215,-2917,-257,53,59),(6,11,1,215,-2917,-257,53,59),(7,1,0,1,-6240,331,383,1563),(7,4,0,1,-6340,331,383,1563),(7,8,0,1,-6340,331,383,1563),(7,9,0,1,-6340,331,383,1563),(8,1,1,14,-618,-4251,39,1478),(8,3,1,14,-618,-4251,39,1478),(8,4,1,14,-618,-4251,39,1478),(8,5,1,14,-618,-4251,39,1478),(8,7,1,14,-618,-4251,39,1478),(8,8,1,14,-618,-4251,39,1478);
UNLOCK TABLES;
/*!40000 ALTER TABLE `playercreateinfo` ENABLE KEYS */;

--
-- Table structure for table `playercreateinfo_action`
--

DROP TABLE IF EXISTS `playercreateinfo_action`;
CREATE TABLE `playercreateinfo_action` (
  `race` tinyint(3) unsigned NOT NULL default '0',
  `class` tinyint(3) unsigned NOT NULL default '0',
  `button` smallint(2) unsigned NOT NULL default '0',
  `action` smallint(6) unsigned NOT NULL default '0',
  `type` smallint(3) unsigned NOT NULL default '0',
  `misc` smallint(3) unsigned NOT NULL default '0',
  KEY `playercreateinfo_race_class_index` (`race`,`class`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `playercreateinfo_action`
--


/*!40000 ALTER TABLE `playercreateinfo_action` DISABLE KEYS */;
LOCK TABLES `playercreateinfo_action` WRITE;
INSERT INTO `playercreateinfo_action` VALUES (1,1,1,78,0,0),(1,1,0,6603,0,0),(1,1,11,65020,128,0),(1,2,2,635,0,0),(1,2,0,6603,0,0),(1,2,1,20154,0,0),(1,2,10,65021,128,0),(1,2,11,65022,128,0),(1,4,1,1752,0,0),(1,4,2,2098,0,0),(1,4,3,2764,0,0),(1,4,0,6603,0,0),(1,4,11,65022,128,0),(1,5,1,585,0,0),(1,5,2,2050,0,0),(1,5,0,6603,0,0),(1,5,10,65021,128,0),(1,5,11,65022,128,0),(1,8,1,133,0,0),(1,8,2,168,0,0),(1,8,0,6603,0,0),(1,8,10,65021,128,0),(1,8,11,65022,128,0),(1,9,1,686,0,0),(1,9,2,687,0,0),(1,9,0,6603,0,0),(1,9,10,65021,128,0),(1,9,11,65027,128,0),(2,1,1,78,0,0),(2,1,0,6603,0,0),(2,1,11,65020,128,0),(2,3,2,75,0,0),(2,3,1,2973,0,0),(2,3,0,6603,0,0),(2,3,11,65020,128,0),(2,3,10,65021,128,0),(2,4,10,0,128,0),(2,4,1,1752,0,0),(2,4,2,2098,0,0),(2,4,0,6603,0,0),(2,4,11,65020,128,0),(2,7,2,331,0,0),(2,7,1,403,0,0),(2,7,0,6603,0,0),(2,7,11,65020,128,0),(2,7,10,65021,128,0),(2,9,1,686,0,0),(2,9,2,687,0,0),(2,9,0,6603,0,0),(2,9,11,65020,128,0),(2,9,10,65021,128,0),(3,1,1,78,0,0),(3,1,0,6603,0,0),(3,1,11,65020,128,0),(3,2,2,635,0,0),(3,2,0,6603,0,0),(3,2,1,20154,0,0),(3,2,10,65021,128,0),(3,2,11,65026,128,0),(3,3,2,75,0,0),(3,3,1,2973,0,0),(3,3,0,6603,0,0),(3,3,11,65020,128,0),(3,3,10,65021,128,0),(3,4,1,1752,0,0),(3,4,2,2098,0,0),(3,4,3,2764,0,0),(3,4,0,6603,0,0),(3,4,11,65026,128,0),(3,5,1,585,0,0),(3,5,2,2050,0,0),(3,5,0,6603,0,0),(3,5,10,65021,128,0),(3,5,11,65026,128,0),(4,1,1,78,0,0),(4,1,0,6603,0,0),(4,1,11,65020,128,0),(4,3,2,75,0,0),(4,3,1,2973,0,0),(4,3,0,6603,0,0),(4,3,11,65020,128,0),(4,3,10,65021,128,0),(4,4,1,1752,0,0),(4,4,2,2098,0,0),(4,4,3,2764,0,0),(4,4,0,6603,0,0),(4,4,11,65026,128,0),(4,5,1,585,0,0),(4,5,2,2050,0,0),(4,5,0,6603,0,0),(4,5,10,65021,128,0),(4,5,11,65022,128,0),(4,11,1,5176,0,0),(4,11,2,5185,0,0),(4,11,0,6603,0,0),(4,11,10,65021,128,0),(4,11,11,65025,128,0),(5,1,11,65027,128,0),(5,1,0,6603,0,0),(5,1,1,78,0,0),(5,4,11,65027,128,0),(5,4,3,2764,0,0),(5,4,2,2098,0,0),(5,4,1,1752,0,0),(5,4,0,6603,0,0),(5,5,10,65021,128,0),(5,5,2,2050,0,0),(5,5,1,585,0,0),(5,5,11,65027,128,0),(5,5,0,6603,0,0),(5,8,11,65027,128,0),(5,8,10,65021,128,0),(5,8,2,168,0,0),(5,8,1,133,0,0),(5,8,0,6603,0,0),(5,9,1,686,0,0),(5,9,10,65021,128,0),(5,9,2,687,0,0),(5,9,11,65027,128,0),(5,9,0,6603,0,0),(6,1,1,78,0,0),(6,1,2,20549,0,0),(6,1,11,65026,128,0),(6,1,0,6603,0,0),(6,3,1,2973,0,0),(6,3,10,65021,128,0),(6,3,2,75,0,0),(6,3,3,20549,0,0),(6,3,11,65020,128,0),(6,3,0,6603,0,0),(6,7,1,403,0,0),(6,7,10,65021,128,0),(6,7,2,331,0,0),(6,7,3,20549,0,0),(6,7,11,65027,128,0),(6,7,0,6603,0,0),(6,11,1,5176,0,0),(6,11,10,65021,128,0),(6,11,2,5185,0,0),(6,11,3,20549,0,0),(6,11,11,65025,128,0),(6,11,0,6603,0,0),(7,1,11,65020,128,0),(7,1,1,78,0,0),(7,1,0,6603,0,0),(7,4,11,65020,128,0),(7,4,3,2764,0,0),(7,4,1,1752,0,0),(7,4,2,2098,0,0),(7,4,0,6603,0,0),(7,8,11,65025,128,0),(7,8,1,133,0,0),(7,8,2,168,0,0),(7,8,10,65021,128,0),(7,8,0,6603,0,0),(7,9,11,65027,128,0),(7,9,1,686,0,0),(7,9,2,687,0,0),(7,9,10,65021,128,0),(7,9,0,6603,0,0),(8,1,11,65020,128,0),(8,1,1,78,0,0),(8,1,3,2764,0,0),(8,1,0,6603,0,0),(8,3,10,65021,128,0),(8,3,11,65027,128,0),(8,3,1,2973,0,0),(8,3,2,75,0,0),(8,3,0,6603,0,0),(8,4,1,1752,0,0),(8,4,3,2764,0,0),(8,4,2,2098,0,0),(8,4,11,65020,128,0),(8,4,0,6603,0,0),(8,5,1,585,0,0),(8,5,10,65021,128,0),(8,5,2,2050,0,0),(8,5,11,65026,128,0),(8,5,0,6603,0,0),(8,7,1,403,0,0),(8,7,10,65021,128,0),(8,7,2,331,0,0),(8,7,11,65020,128,0),(8,7,0,6603,0,0),(8,8,1,133,0,0),(8,8,10,65021,128,0),(8,8,2,168,0,0),(8,8,11,65020,128,0),(8,8,0,6603,0,0);
UNLOCK TABLES;
/*!40000 ALTER TABLE `playercreateinfo_action` ENABLE KEYS */;

--
-- Table structure for table `playercreateinfo_item`
--

DROP TABLE IF EXISTS `playercreateinfo_item`;
CREATE TABLE `playercreateinfo_item` (
  `race` tinyint(3) unsigned NOT NULL default '0',
  `class` tinyint(3) unsigned NOT NULL default '0',
  `itemid` mediumint(8) unsigned NOT NULL default '0',
  `amount` tinyint(8) unsigned NOT NULL default '1',
  KEY `playercreateinfo_race_class_index` (`race`,`class`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `playercreateinfo_item`
--


/*!40000 ALTER TABLE `playercreateinfo_item` DISABLE KEYS */;
LOCK TABLES `playercreateinfo_item` WRITE;
INSERT INTO `playercreateinfo_item` VALUES (1,1,38,1),(1,1,39,1),(1,1,40,1),(1,1,25,1),(1,1,2362,1),(1,1,65020,4),(1,1,6948,1),(1,1,14646,1),(1,2,45,1),(1,2,44,1),(1,2,43,1),(1,2,2361,1),(1,2,6948,1),(1,2,65021,2),(1,2,65022,4),(1,2,14646,1),(1,4,49,1),(1,4,48,1),(1,4,47,1),(1,4,2092,1),(1,4,65023,100),(1,4,65022,4),(1,4,6948,1),(1,4,14646,1),(1,5,53,1),(1,5,6098,1),(1,5,52,1),(1,5,51,1),(1,5,36,1),(1,5,65021,2),(1,5,65022,4),(1,5,6948,1),(1,5,14646,1),(1,8,6096,1),(1,8,56,1),(1,8,1395,1),(1,8,55,1),(1,8,35,1),(1,8,65022,4),(1,8,65021,2),(1,8,6948,1),(1,8,14646,1),(1,9,6097,1),(1,9,57,1),(1,9,1396,1),(1,9,59,1),(1,9,2092,1),(1,9,65027,4),(1,9,65021,2),(1,9,6948,1),(1,9,14646,1),(2,1,6125,1),(2,1,139,1),(2,1,140,1),(2,1,12282,1),(2,1,6948,1),(2,1,65020,4),(2,1,14649,1),(2,3,127,1),(2,3,6126,1),(2,3,6127,1),(2,3,37,1),(2,3,2504,1),(2,3,65021,2),(2,3,65020,4),(2,3,6948,1),(2,3,14649,1),(2,3,2512,200),(2,3,2101,1),(2,4,2105,1),(2,4,120,1),(2,4,121,1),(2,4,2092,1),(2,4,65024,100),(2,4,65020,4),(2,4,6948,1),(2,4,14649,1),(2,7,154,1),(2,7,153,1),(2,7,36,1),(2,7,6948,1),(2,7,65020,4),(2,7,65021,2),(2,7,14649,1),(2,9,6129,1),(2,9,1396,1),(2,9,59,1),(2,9,2092,1),(2,9,6948,1),(2,9,65020,4),(2,9,65021,2),(2,9,14649,1),(3,1,38,1),(3,1,39,1),(3,1,40,1),(3,1,12282,1),(3,1,6948,1),(3,1,65020,4),(3,1,14647,1),(3,2,45,1),(3,2,44,1),(3,2,43,1),(3,2,2361,1),(3,2,65026,4),(3,2,65021,2),(3,2,6948,1),(3,2,14647,1),(3,3,148,1),(3,3,147,1),(3,3,129,1),(3,3,37,1),(3,3,2508,1),(3,3,65021,2),(3,3,65020,4),(3,3,6948,1),(3,3,14647,1),(3,3,2516,200),(3,3,2102,1),(3,4,49,1),(3,4,48,1),(3,4,47,1),(3,4,2092,1),(3,4,65024,100),(3,4,65026,4),(3,4,6948,1),(3,4,14647,1),(3,5,53,1),(3,5,6098,1),(3,5,52,1),(3,5,51,1),(3,5,36,1),(3,5,65021,2),(3,5,65026,4),(3,5,6948,1),(3,5,14647,1),(4,1,38,1),(4,1,39,1),(4,1,40,1),(4,1,25,1),(4,1,2362,1),(4,1,65020,4),(4,1,6948,1),(4,1,14648,1),(4,3,148,1),(4,3,147,1),(4,3,129,1),(4,3,2092,1),(4,3,2504,1),(4,3,65021,2),(4,3,65020,4),(4,3,6948,1),(4,3,14648,1),(4,3,2512,200),(4,3,2101,1),(4,4,49,1),(4,4,48,1),(4,4,47,1),(4,4,2092,1),(4,4,65023,100),(4,4,65026,4),(4,4,6948,1),(4,4,14648,1),(4,5,53,1),(4,5,6119,1),(4,5,52,1),(4,5,51,1),(4,5,36,1),(4,5,65022,4),(4,5,65021,2),(4,5,6948,1),(4,5,14648,1),(4,11,6123,1),(4,11,44,1),(4,11,3661,1),(4,11,65021,2),(4,11,65025,4),(4,11,6948,1),(4,11,14648,1),(5,1,6125,1),(5,1,139,1),(5,1,140,1),(5,1,25,1),(5,1,2362,1),(5,1,65027,4),(5,1,6948,1),(5,1,14651,1),(5,4,2105,1),(5,4,120,1),(5,4,121,1),(5,4,2092,1),(5,4,65023,100),(5,4,65027,4),(5,4,6948,1),(5,4,14651,1),(5,5,53,1),(5,5,6144,1),(5,5,52,1),(5,5,51,1),(5,5,36,1),(5,5,65027,4),(5,5,65021,2),(5,5,6948,1),(5,5,14651,1),(5,8,6096,1),(5,8,6140,1),(5,8,1395,1),(5,8,55,1),(5,8,35,1),(5,8,65027,4),(5,8,65021,2),(5,8,6948,1),(5,8,14651,1),(5,9,6129,1),(5,9,1396,1),(5,9,59,1),(5,9,2092,1),(5,9,65027,4),(5,9,65021,2),(5,9,6948,1),(5,9,14651,1),(6,1,6125,1),(6,1,139,1),(6,1,2361,1),(6,1,6948,1),(6,1,65026,4),(6,1,14650,1),(6,3,127,1),(6,3,6126,1),(6,3,37,1),(6,3,2508,1),(6,3,65021,2),(6,3,65020,4),(6,3,6948,1),(6,3,14650,1),(6,3,2516,200),(6,3,2102,1),(6,7,154,1),(6,7,153,1),(6,7,36,1),(6,7,6948,1),(6,7,65027,4),(6,7,65021,2),(6,7,14650,1),(6,11,6139,1),(6,11,6124,1),(6,11,35,1),(6,11,65021,2),(6,11,65025,4),(6,11,6948,1),(6,11,14650,1),(7,1,38,1),(7,1,39,1),(7,1,40,1),(7,1,25,1),(7,1,2362,1),(7,1,65020,4),(7,1,6948,1),(7,1,14647,1),(7,4,49,1),(7,4,48,1),(7,4,47,1),(7,4,2092,1),(7,4,65023,100),(7,4,65020,4),(7,4,6948,1),(7,4,14647,1),(7,8,6096,1),(7,8,56,1),(7,8,1395,1),(7,8,55,1),(7,8,35,1),(7,8,65025,4),(7,8,65021,2),(7,8,6948,1),(7,8,14647,1),(7,9,6097,1),(7,9,57,1),(7,9,1396,1),(7,9,59,1),(7,9,2092,1),(7,9,65021,2),(7,9,65027,4),(7,9,6948,1),(7,9,14647,1),(8,1,6125,1),(8,1,139,1),(8,1,140,1),(8,1,37,1),(8,1,2362,1),(8,1,65024,100),(8,1,65020,4),(8,1,6948,1),(8,1,14649,1),(8,3,127,1),(8,3,6126,1),(8,3,6127,1),(8,3,37,1),(8,3,2504,1),(8,3,65027,4),(8,3,65021,2),(8,3,2512,200),(8,3,2101,1),(8,3,14649,1),(8,3,6948,1),(8,4,2105,1),(8,4,120,1),(8,4,121,1),(8,4,2092,1),(8,4,65024,100),(8,4,65020,4),(8,4,6948,1),(8,4,14649,1),(8,5,53,1),(8,5,6144,1),(8,5,52,1),(8,5,36,1),(8,5,65026,4),(8,5,65021,2),(8,5,6948,1),(8,5,14649,1),(8,7,6134,1),(8,7,6135,1),(8,7,36,1),(8,7,65020,4),(8,7,65021,2),(8,7,6948,1),(8,7,14649,1),(8,8,6096,1),(8,8,6140,1),(8,8,1395,1),(8,8,55,1),(8,8,35,1),(8,8,65020,4),(8,8,65021,2),(8,8,6948,1),(8,8,14649,1);
UNLOCK TABLES;
/*!40000 ALTER TABLE `playercreateinfo_item` ENABLE KEYS */;

--
-- Table structure for table `playercreateinfo_skill`
--

DROP TABLE IF EXISTS `playercreateinfo_skill`;
CREATE TABLE `playercreateinfo_skill` (
  `race` tinyint(3) unsigned NOT NULL default '0',
  `class` tinyint(3) unsigned NOT NULL default '0',
  `Skill` mediumint(8) unsigned NOT NULL default '0',
  `Note` varchar(255) default NULL,
  PRIMARY KEY  (`race`,`class`,`Skill`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `playercreateinfo_skill`
--


/*!40000 ALTER TABLE `playercreateinfo_skill` DISABLE KEYS */;
LOCK TABLES `playercreateinfo_skill` WRITE;
INSERT INTO `playercreateinfo_skill` VALUES 
(1,1,183,'GENERIC (DND)'),(1,2,183,'GENERIC (DND)'),(1,4,183,'GENERIC (DND)'),(1,5,183,'GENERIC (DND)'),(1,8,183,'GENERIC (DND)'),(1,9,183,'GENERIC (DND)'),(2,1,183,'GENERIC (DND)'),(2,3,183,'GENERIC (DND)'),(2,4,183,'GENERIC (DND)'),(2,7,183,'GENERIC (DND)'),(2,9,183,'GENERIC (DND)'),(3,1,183,'GENERIC (DND)'),(3,2,183,'GENERIC (DND)'),(3,3,183,'GENERIC (DND)'),(3,4,183,'GENERIC (DND)'),(3,5,183,'GENERIC (DND)'),(4,1,183,'GENERIC (DND)'),(4,3,183,'GENERIC (DND)'),(4,4,183,'GENERIC (DND)'),(4,5,183,'GENERIC (DND)'),(4,11,183,'GENERIC (DND)'),(5,1,183,'GENERIC (DND)'),(5,4,183,'GENERIC (DND)'),(5,5,183,'GENERIC (DND)'),(5,8,183,'GENERIC (DND)'),(5,9,183,'GENERIC (DND)'),(6,1,183,'GENERIC (DND)'),(6,3,183,'GENERIC (DND)'),(6,7,183,'GENERIC (DND)'),(6,11,183,'GENERIC (DND)'),(7,1,183,'GENERIC (DND)'),(7,4,183,'GENERIC (DND)'),(7,8,183,'GENERIC (DND)'),(7,9,183,'GENERIC (DND)'),(8,1,183,'GENERIC (DND)'),(8,3,183,'GENERIC (DND)'),(8,4,183,'GENERIC (DND)'),(8,5,183,'GENERIC (DND)'),(8,7,183,'GENERIC (DND)'),(8,8,183,'GENERIC (DND)'),(1,8,6,'Frost'),(5,8,6,'Frost'),(7,8,6,'Frost'),(8,8,6,'Frost'),(1,8,8,'Fire'),(5,8,8,'Fire'),(7,8,8,'Fire'),(8,8,8,'Fire'),(1,1,26,'Arms'),(2,1,26,'Arms'),(3,1,26,'Arms'),(4,1,26,'Arms'),(5,1,26,'Arms'),(6,1,26,'Arms'),(7,1,26,'Arms'),(8,1,26,'Arms'),(1,4,38,'Combat'),(2,4,38,'Combat'),(3,4,38,'Combat'),(4,4,38,'Combat'),(5,4,38,'Combat'),(7,4,38,'Combat'),(8,4,38,'Combat'),(2,3,51,'Survival'),(3,3,51,'Survival'),(4,3,51,'Survival'),(6,3,51,'Survival'),(8,3,51,'Survival'),(1,5,56,'Holy'),(3,5,56,'Holy'),(4,5,56,'Holy'),(5,5,56,'Holy'),(8,5,56,'Holy'),(1,2,594,'Holy'),(3,2,594,'Holy'),(3,1,101,'Dwarven Racial'),(3,2,101,'Dwarven Racial'),(3,3,101,'Dwarven Racial'),(3,4,101,'Dwarven Racial'),(3,5,101,'Dwarven Racial'),(6,1,124,'Tauren Racial'),(6,3,124,'Tauren Racial'),(6,7,124,'Tauren Racial'),(6,11,124,'Tauren Racial'),(2,1,125,'Orc Racial'),(2,3,125,'Orc Racial'),(2,4,125,'Orc Racial'),(2,7,125,'Orc Racial'),(2,9,125,'Orc Racial'),(4,1,126,'Night Elf Racial'),(4,3,126,'Night Elf Racial'),(4,4,126,'Night Elf Racial'),(4,5,126,'Night Elf Racial'),(4,11,126,'Night Elf Racial'),(2,3,163,'Marksmanship'),(3,3,163,'Marksmanship'),(4,3,163,'Marksmanship'),(6,3,163,'Marksmanship'),(8,3,163,'Marksmanship'),(5,1,220,'Racial - Undead'),(5,4,220,'Racial - Undead'),(5,5,220,'Racial - Undead'),(5,8,220,'Racial - Undead'),(5,9,220,'Racial - Undead'),(1,4,253,'Assassination'),(2,4,253,'Assassination'),(3,4,253,'Assassination'),(4,4,253,'Assassination'),(5,4,253,'Assassination'),(7,4,253,'Assassination'),(8,4,253,'Assassination'),(1,9,354,'Demonology'),(2,9,354,'Demonology'),(5,9,354,'Demonology'),(7,9,354,'Demonology'),(2,7,374,'Restoration'),(6,7,374,'Restoration'),(8,7,374,'Restoration'),(4,11,573,'Restoration'),(6,11,573,'Restoration'),(2,7,375,'Elemental Combat'),(6,7,375,'Elemental Combat'),(8,7,375,'Elemental Combat'),(4,11,574,'Balance'),(6,11,574,'Balance'),(1,9,593,'Destruction'),(2,9,593,'Destruction'),(5,9,593,'Destruction'),(7,9,593,'Destruction'),(8,1,733,'Racial - Troll'),(8,3,733,'Racial - Troll'),(8,4,733,'Racial - Troll'),(8,5,733,'Racial - Troll'),(8,7,733,'Racial - Troll'),(8,8,733,'Racial - Troll'),(7,1,753,'Racial - Gnome'),(7,4,753,'Racial - Gnome'),(7,8,753,'Racial - Gnome'),(7,9,753,'Racial - Gnome'),(1,1,754,'Racial - Human'),(1,2,754,'Racial - Human'),(1,4,754,'Racial - Human'),(1,5,754,'Racial - Human'),(1,8,754,'Racial - Human'),(1,9,754,'Racial - Human');
UNLOCK TABLES;
/*!40000 ALTER TABLE `playercreateinfo_skill` ENABLE KEYS */;

--
-- Table structure for table `playercreateinfo_spell`
--

DROP TABLE IF EXISTS `playercreateinfo_spell`;
CREATE TABLE `playercreateinfo_spell` (
  `race` tinyint(3) unsigned NOT NULL default '0',
  `class` tinyint(3) unsigned NOT NULL default '0',
  `Spell` bigint(20) unsigned NOT NULL default '0',
  `Note` varchar(255) default NULL,
  `Active` tinyint(3) unsigned NOT NULL default '1',
  PRIMARY KEY  (`race`,`class`,`Spell`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `playercreateinfo_spell`
--


/*!40000 ALTER TABLE `playercreateinfo_spell` DISABLE KEYS */;
LOCK TABLES `playercreateinfo_spell` WRITE;
INSERT INTO `playercreateinfo_spell` VALUES (1,1,2382,'Generic',1),(1,1,3365,'Opening',1),(1,1,3050,'Detect',1),(1,1,6233,'Closing',1),(1,1,6246,'Closing',1),(1,1,6247,'Opening',1),(1,1,9125,'Generic',1),(1,1,2479,'Honorless Target',1),(1,1,6477,'Opening',1),(1,1,6478,'Opening',1),(1,1,6603,'Attack',1),(1,1,7266,'Duel',1),(1,1,7267,'Grovel',1),(1,1,7355,'Stuck',1),(1,1,8386,'Attacking',1),(1,1,21651,'Opening',1),(1,1,21652,'Closing',1),(1,1,22027,'Remove Insignia',1),(1,1,22810,'Opening - No Text',1),(1,1,20599,'Diplomacy',1),(1,1,20600,'Perception',1),(1,1,20597,'Sword Specialization',1),(1,1,20598,'The Human Spirit',1),(1,1,20864,'Mace Specialization',1),(1,1,9116,'Shield',1),(1,1,668,'Language Common',1),(1,1,9078,'Cloth',1),(1,1,204,'Defense',1),(1,1,81,'Dodge',1),(1,1,522,'SPELLDEFENSE (DND)',1),(1,1,107,'Block',1),(1,1,5301,'Defensive State (DND)',1),(1,1,201,'One-Handed Swords',1),(1,1,78,'Heroic Strike',1),(1,1,2457,'Battle Stance',1),(1,1,196,'One-Handed Axes',1),(1,1,8737,'Mail',1),(1,1,9077,'Leather',1),(1,1,198,'One-Handed Maces',1),(1,1,203,'Unarmed',1),(1,2,2382,'Generic',1),(1,2,3365,'Opening',1),(1,2,3050,'Detect',1),(1,2,6233,'Closing',1),(1,2,6246,'Closing',1),(1,2,6247,'Opening',1),(1,2,9125,'Generic',1),(1,2,2479,'Honorless Target',1),(1,2,6477,'Opening',1),(1,2,6478,'Opening',1),(1,2,6603,'Attack',1),(1,2,7266,'Duel',1),(1,2,7267,'Grovel',1),(1,2,7355,'Stuck',1),(1,2,8386,'Attacking',1),(1,2,21651,'Opening',1),(1,2,21652,'Closing',1),(1,2,22027,'Remove Insignia',1),(1,2,22810,'Opening - No Text',1),(1,2,20599,'Diplomacy',1),(1,2,20600,'Perception',1),(1,2,20597,'Sword Specialization',1),(1,2,20598,'The Human Spirit',1),(1,2,20864,'Mace Specialization',1),(1,2,9116,'Shield',1),(1,2,668,'Language Common',1),(1,2,9078,'Cloth',1),(1,2,635,'Holy Light',1),(1,2,20154,'Seal of Righteousness',1),(1,2,204,'Defense',1),(1,2,81,'Dodge',1),(1,2,522,'SPELLDEFENSE (DND)',1),(1,2,107,'Block',1),(1,2,199,'Two-Handed Maces',1),(1,2,8737,'Mail',1),(1,2,9077,'Leather',1),(1,2,198,'One-Handed Maces',1),(1,2,203,'Unarmed',1),(1,4,1180,'Daggers',1),(1,4,2382,'Generic',1),(1,4,3365,'Opening',1),(1,4,3050,'Detect',1),(1,4,6233,'Closing',1),(1,4,6246,'Closing',1),(1,4,6247,'Opening',1),(1,4,9125,'Generic',1),(1,4,2479,'Honorless Target',1),(1,4,6477,'Opening',1),(1,4,6478,'Opening',1),(1,4,6603,'Attack',1),(1,4,7266,'Duel',1),(1,4,7267,'Grovel',1),(1,4,7355,'Stuck',1),(1,4,8386,'Attacking',1),(1,4,21651,'Opening',1),(1,4,21652,'Closing',1),(1,4,22027,'Remove Insignia',1),(1,4,22810,'Opening - No Text',1),(1,4,20599,'Diplomacy',1),(1,4,20600,'Perception',1),(1,4,20597,'Sword Specialization',1),(1,4,20598,'The Human Spirit',1),(1,4,20864,'Mace Specialization',1),(1,4,668,'Language Common',1),(1,4,9078,'Cloth',1),(1,4,204,'Defense',1),(1,4,81,'Dodge',1),(1,4,522,'SPELLDEFENSE (DND)',1),(1,4,16092,'Defensive State (DND)',1),(1,4,2567,'Thrown',1),(1,4,2764,'Throw',1),(1,4,1752,'Sinister Strike',1),(1,4,21184,'Rogue Passive (DND)',1),(1,4,2098,'Eviscerate',1),(1,4,9077,'Leather',1),(1,4,203,'Unarmed',1),(1,5,2382,'Generic',1),(1,5,3365,'Opening',1),(1,5,3050,'Detect',1),(1,5,6233,'Closing',1),(1,5,6246,'Closing',1),(1,5,6247,'Opening',1),(1,5,9125,'Generic',1),(1,5,2479,'Honorless Target',1),(1,5,6477,'Opening',1),(1,5,6478,'Opening',1),(1,5,6603,'Attack',1),(1,5,7266,'Duel',1),(1,5,7267,'Grovel',1),(1,5,7355,'Stuck',1),(1,5,8386,'Attacking',1),(1,5,21651,'Opening',1),(1,5,21652,'Closing',1),(1,5,22027,'Remove Insignia',1),(1,5,22810,'Opening - No Text',1),(1,5,5009,'Wands',1),(1,5,5019,'Shoot',1),(1,5,20599,'Diplomacy',1),(1,5,20600,'Perception',1),(1,5,20597,'Sword Specialization',1),(1,5,20598,'The Human Spirit',1),(1,5,20864,'Mace Specialization',1),(1,5,668,'Language Common',1),(1,5,9078,'Cloth',1),(1,5,204,'Defense',1),(1,5,81,'Dodge',1),(1,5,522,'SPELLDEFENSE (DND)',1),(1,5,2050,'Lesser Heal',1),(1,5,585,'Smite',1),(1,5,198,'One-Handed Maces',1),(1,5,203,'Unarmed',1),(1,8,2382,'Generic',1),(1,8,3365,'Opening',1),(1,8,3050,'Detect',1),(1,8,6233,'Closing',1),(1,8,6246,'Closing',1),(1,8,6247,'Opening',1),(1,8,9125,'Generic',1),(1,8,2479,'Honorless Target',1),(1,8,6477,'Opening',1),(1,8,6478,'Opening',1),(1,8,6603,'Attack',1),(1,8,7266,'Duel',1),(1,8,7267,'Grovel',1),(1,8,7355,'Stuck',1),(1,8,8386,'Attacking',1),(1,8,21651,'Opening',1),(1,8,21652,'Closing',1),(1,8,22027,'Remove Insignia',1),(1,8,22810,'Opening - No Text',1),(1,8,5009,'Wands',1),(1,8,5019,'Shoot',1),(1,8,20599,'Diplomacy',1),(1,8,20600,'Perception',1),(1,8,20597,'Sword Specialization',1),(1,8,20598,'The Human Spirit',1),(1,8,20864,'Mace Specialization',1),(1,8,133,'Fireball',1),(1,8,668,'Language Common',1),(1,8,9078,'Cloth',1),(1,8,204,'Defense',1),(1,8,81,'Dodge',1),(1,8,522,'SPELLDEFENSE (DND)',1),(1,8,168,'Frost Armor',1),(1,8,227,'Staves',1),(1,8,203,'Unarmed',1),(1,9,1180,'Daggers',1),(1,9,2382,'Generic',1),(1,9,3365,'Opening',1),(1,9,3050,'Detect',1),(1,9,6233,'Closing',1),(1,9,6246,'Closing',1),(1,9,6247,'Opening',1),(1,9,9125,'Generic',1),(1,9,2479,'Honorless Target',1),(1,9,6477,'Opening',1),(1,9,6478,'Opening',1),(1,9,6603,'Attack',1),(1,9,7266,'Duel',1),(1,9,7267,'Grovel',1),(1,9,7355,'Stuck',1),(1,9,8386,'Attacking',1),(1,9,21651,'Opening',1),(1,9,21652,'Closing',1),(1,9,22027,'Remove Insignia',1),(1,9,22810,'Opening - No Text',1),(1,9,5009,'Wands',1),(1,9,5019,'Shoot',1),(1,9,20599,'Diplomacy',1),(1,9,20600,'Perception',1),(1,9,20597,'Sword Specialization',1),(1,9,20598,'The Human Spirit',1),(1,9,20864,'Mace Specialization',1),(1,9,686,'Shadow Bolt',1),(1,9,668,'Language Common',1),(1,9,687,'Demon Skin',1),(1,9,9078,'Cloth',1),(1,9,204,'Defense',1),(1,9,81,'Dodge',1),(1,9,522,'SPELLDEFENSE (DND)',1),(1,9,203,'Unarmed',1),(2,1,197,'Two-Handed Axes',1),(2,1,2382,'Generic',1),(2,1,3365,'Opening',1),(2,1,3050,'Detect',1),(2,1,6233,'Closing',1),(2,1,6246,'Closing',1),(2,1,6247,'Opening',1),(2,1,9125,'Generic',1),(2,1,2479,'Honorless Target',1),(2,1,6477,'Opening',1),(2,1,6478,'Opening',1),(2,1,6603,'Attack',1),(2,1,7266,'Duel',1),(2,1,7267,'Grovel',1),(2,1,7355,'Stuck',1),(2,1,8386,'Attacking',1),(2,1,21651,'Opening',1),(2,1,21652,'Closing',1),(2,1,22027,'Remove Insignia',1),(2,1,22810,'Opening - No Text',1),(2,1,669,'Language Orcish',1),(2,1,9116,'Shield',1),(2,1,21563,'Command',1),(2,1,20572,'Blood Fury',1),(2,1,20573,'Hardiness',1),(2,1,20574,'Axe Specialization',1),(2,1,9078,'Cloth',1),(2,1,204,'Defense',1),(2,1,81,'Dodge',1),(2,1,522,'SPELLDEFENSE (DND)',1),(2,1,107,'Block',1),(2,1,5301,'Defensive State (DND)',1),(2,1,201,'One-Handed Swords',1),(2,1,78,'Heroic Strike',1),(2,1,2457,'Battle Stance',1),(2,1,196,'One-Handed Axes',1),(2,1,8737,'Mail',1),(2,1,9077,'Leather',1),(2,1,203,'Unarmed',1),(2,3,2382,'Generic',1),(2,3,3365,'Opening',1),(2,3,3050,'Detect',1),(2,3,6233,'Closing',1),(2,3,6246,'Closing',1),(2,3,6247,'Opening',1),(2,3,9125,'Generic',1),(2,3,2479,'Honorless Target',1),(2,3,6477,'Opening',1),(2,3,6478,'Opening',1),(2,3,6603,'Attack',1),(2,3,7266,'Duel',1),(2,3,7267,'Grovel',1),(2,3,7355,'Stuck',1),(2,3,8386,'Attacking',1),(2,3,21651,'Opening',1),(2,3,21652,'Closing',1),(2,3,22027,'Remove Insignia',1),(2,3,22810,'Opening - No Text',1),(2,3,669,'Language Orcish',1),(2,3,20572,'Blood Fury',1),(2,3,20573,'Hardiness',1),(2,3,20574,'Axe Specialization',1),(2,3,20576,'Command',1),(2,3,9078,'Cloth',1),(2,3,204,'Defense',1),(2,3,81,'Dodge',1),(2,3,522,'SPELLDEFENSE (DND)',1),(2,3,13358,'Defensive State (DND)',1),(2,3,24949,'Defensive State 2 (DND)',1),(2,3,196,'One-Handed Axes',1),(2,3,2973,'Raptor Strike',1),(2,3,9077,'Leather',1),(2,3,264,'Bows',1),(2,3,75,'Auto Shot',1),(2,3,203,'Unarmed',1),(2,4,1180,'Daggers',1),(2,4,2382,'Generic',1),(2,4,3365,'Opening',1),(2,4,3050,'Detect',1),(2,4,6233,'Closing',1),(2,4,6246,'Closing',1),(2,4,6247,'Opening',1),(2,4,9125,'Generic',1),(2,4,2479,'Honorless Target',1),(2,4,6477,'Opening',1),(2,4,6478,'Opening',1),(2,4,6603,'Attack',1),(2,4,7266,'Duel',1),(2,4,7267,'Grovel',1),(2,4,7355,'Stuck',1),(2,4,8386,'Attacking',1),(2,4,21651,'Opening',1),(2,4,21652,'Closing',1),(2,4,22027,'Remove Insignia',1),(2,4,22810,'Opening - No Text',1),(2,4,669,'Language Orcish',1),(2,4,21563,'Command',1),(2,4,20572,'Blood Fury',1),(2,4,20573,'Hardiness',1),(2,4,20574,'Axe Specialization',1),(2,4,9078,'Cloth',1),(2,4,204,'Defense',1),(2,4,81,'Dodge',1),(2,4,522,'SPELLDEFENSE (DND)',1),(2,4,16092,'Defensive State (DND)',1),(2,4,2567,'Thrown',1),(2,4,2764,'Throw',1),(2,4,1752,'Sinister Strike',1),(2,4,21184,'Rogue Passive (DND)',1),(2,4,2098,'Eviscerate',1),(2,4,9077,'Leather',1),(2,4,203,'Unarmed',1),(2,7,2382,'Generic',1),(2,7,3365,'Opening',1),(2,7,3050,'Detect',1),(2,7,6233,'Closing',1),(2,7,6246,'Closing',1),(2,7,6247,'Opening',1),(2,7,9125,'Generic',1),(2,7,2479,'Honorless Target',1),(2,7,6477,'Opening',1),(2,7,6478,'Opening',1),(2,7,6603,'Attack',1),(2,7,7266,'Duel',1),(2,7,7267,'Grovel',1),(2,7,7355,'Stuck',1),(2,7,8386,'Attacking',1),(2,7,21651,'Opening',1),(2,7,21652,'Closing',1),(2,7,22027,'Remove Insignia',1),(2,7,22810,'Opening - No Text',1),(2,7,669,'Language Orcish',1),(2,7,9116,'Shield',1),(2,7,21563,'Command',1),(2,7,20572,'Blood Fury',1),(2,7,20573,'Hardiness',1),(2,7,20574,'Axe Specialization',1),(2,7,331,'Healing Wave',1),(2,7,403,'Lightning Bolt',1),(2,7,9078,'Cloth',1),(2,7,204,'Defense',1),(2,7,81,'Dodge',1),(2,7,522,'SPELLDEFENSE (DND)',1),(2,7,107,'Block',1),(2,7,227,'Staves',1),(2,7,9077,'Leather',1),(2,7,198,'One-Handed Maces',1),(2,7,203,'Unarmed',1),(2,9,1180,'Daggers',1),(2,9,2382,'Generic',1),(2,9,3365,'Opening',1),(2,9,3050,'Detect',1),(2,9,6233,'Closing',1),(2,9,6246,'Closing',1),(2,9,6247,'Opening',1),(2,9,9125,'Generic',1),(2,9,2479,'Honorless Target',1),(2,9,6477,'Opening',1),(2,9,6478,'Opening',1),(2,9,6603,'Attack',1),(2,9,7266,'Duel',1),(2,9,7267,'Grovel',1),(2,9,7355,'Stuck',1),(2,9,8386,'Attacking',1),(2,9,21651,'Opening',1),(2,9,21652,'Closing',1),(2,9,22027,'Remove Insignia',1),(2,9,22810,'Opening - No Text',1),(2,9,5009,'Wands',1),(2,9,5019,'Shoot',1),(2,9,669,'Language Orcish',1),(2,9,686,'Shadow Bolt',1),(2,9,20572,'Blood Fury',1),(2,9,20573,'Hardiness',1),(2,9,20574,'Axe Specialization',1),(2,9,20575,'Command',1),(2,9,687,'Demon Skin',1),(2,9,9078,'Cloth',1),(2,9,204,'Defense',1),(2,9,81,'Dodge',1),(2,9,522,'SPELLDEFENSE (DND)',1),(2,9,203,'Unarmed',1),(3,1,197,'Two-Handed Axes',1),(3,1,2382,'Generic',1),(3,1,3365,'Opening',1),(3,1,3050,'Detect',1),(3,1,6233,'Closing',1),(3,1,6246,'Closing',1),(3,1,6247,'Opening',1),(3,1,9125,'Generic',1),(3,1,2479,'Honorless Target',1),(3,1,6477,'Opening',1),(3,1,6478,'Opening',1),(3,1,6603,'Attack',1),(3,1,7266,'Duel',1),(3,1,7267,'Grovel',1),(3,1,7355,'Stuck',1),(3,1,8386,'Attacking',1),(3,1,21651,'Opening',1),(3,1,21652,'Closing',1),(3,1,22027,'Remove Insignia',1),(3,1,22810,'Opening - No Text',1),(3,1,9116,'Shield',1),(3,1,668,'Language Common',1),(3,1,9078,'Cloth',1),(3,1,204,'Defense',1),(3,1,81,'Dodge',1),(3,1,522,'SPELLDEFENSE (DND)',1),(3,1,107,'Block',1),(3,1,5301,'Defensive State (DND)',1),(3,1,78,'Heroic Strike',1),(3,1,2457,'Battle Stance',1),(3,1,196,'One-Handed Axes',1),(3,1,2481,'Find Treasure',1),(3,1,20596,'Frost Resistance',1),(3,1,20595,'Gun Specialization',1),(3,1,20594,'Stoneform',1),(3,1,672,'Language Dwarven',1),(3,1,8737,'Mail',1),(3,1,9077,'Leather',1),(3,1,198,'One-Handed Maces',1),(3,1,203,'Unarmed',1),(3,2,2382,'Generic',1),(3,2,3365,'Opening',1),(3,2,3050,'Detect',1),(3,2,6233,'Closing',1),(3,2,6246,'Closing',1),(3,2,6247,'Opening',1),(3,2,9125,'Generic',1),(3,2,2479,'Honorless Target',1),(3,2,6477,'Opening',1),(3,2,6478,'Opening',1),(3,2,6603,'Attack',1),(3,2,7266,'Duel',1),(3,2,7267,'Grovel',1),(3,2,7355,'Stuck',1),(3,2,8386,'Attacking',1),(3,2,21651,'Opening',1),(3,2,21652,'Closing',1),(3,2,22027,'Remove Insignia',1),(3,2,22810,'Opening - No Text',1),(3,2,9116,'Shield',1),(3,2,668,'Language Common',1),(3,2,9078,'Cloth',1),(3,2,635,'Holy Light',1),(3,2,20154,'Seal of Righteousness',1),(3,2,204,'Defense',1),(3,2,81,'Dodge',1),(3,2,522,'SPELLDEFENSE (DND)',1),(3,2,107,'Block',1),(3,2,2481,'Find Treasure',1),(3,2,20596,'Frost Resistance',1),(3,2,20595,'Gun Specialization',1),(3,2,20594,'Stoneform',1),(3,2,672,'Language Dwarven',1),(3,2,199,'Two-Handed Maces',1),(3,2,8737,'Mail',1),(3,2,9077,'Leather',1),(3,2,198,'One-Handed Maces',1),(3,2,203,'Unarmed',1),(3,3,2382,'Generic',1),(3,3,3365,'Opening',1),(3,3,3050,'Detect',1),(3,3,6233,'Closing',1),(3,3,6246,'Closing',1),(3,3,6247,'Opening',1),(3,3,9125,'Generic',1),(3,3,2479,'Honorless Target',1),(3,3,6477,'Opening',1),(3,3,6478,'Opening',1),(3,3,6603,'Attack',1),(3,3,7266,'Duel',1),(3,3,7267,'Grovel',1),(3,3,7355,'Stuck',1),(3,3,8386,'Attacking',1),(3,3,21651,'Opening',1),(3,3,21652,'Closing',1),(3,3,22027,'Remove Insignia',1),(3,3,22810,'Opening - No Text',1),(3,3,668,'Language Common',1),(3,3,9078,'Cloth',1),(3,3,204,'Defense',1),(3,3,81,'Dodge',1),(3,3,522,'SPELLDEFENSE (DND)',1),(3,3,13358,'Defensive State (DND)',1),(3,3,24949,'Defensive State 2 (DND)',1),(3,3,196,'One-Handed Axes',1),(3,3,2973,'Raptor Strike',1),(3,3,2481,'Find Treasure',1),(3,3,20596,'Frost Resistance',1),(3,3,20595,'Gun Specialization',1),(3,3,20594,'Stoneform',1),(3,3,672,'Language Dwarven',1),(3,3,9077,'Leather',1),(3,3,75,'Auto Shot',1),(3,3,266,'Guns',1),(3,3,203,'Unarmed',1),(3,4,1180,'Daggers',1),(3,4,2382,'Generic',1),(3,4,3365,'Opening',1),(3,4,3050,'Detect',1),(3,4,6233,'Closing',1),(3,4,6246,'Closing',1),(3,4,6247,'Opening',1),(3,4,9125,'Generic',1),(3,4,2479,'Honorless Target',1),(3,4,6477,'Opening',1),(3,4,6478,'Opening',1),(3,4,6603,'Attack',1),(3,4,7266,'Duel',1),(3,4,7267,'Grovel',1),(3,4,7355,'Stuck',1),(3,4,8386,'Attacking',1),(3,4,21651,'Opening',1),(3,4,21652,'Closing',1),(3,4,22027,'Remove Insignia',1),(3,4,22810,'Opening - No Text',1),(3,4,668,'Language Common',1),(3,4,9078,'Cloth',1),(3,4,204,'Defense',1),(3,4,81,'Dodge',1),(3,4,522,'SPELLDEFENSE (DND)',1),(3,4,16092,'Defensive State (DND)',1),(3,4,2567,'Thrown',1),(3,4,2764,'Throw',1),(3,4,1752,'Sinister Strike',1),(3,4,21184,'Rogue Passive (DND)',1),(3,4,2481,'Find Treasure',1),(3,4,20596,'Frost Resistance',1),(3,4,20595,'Gun Specialization',1),(3,4,20594,'Stoneform',1),(3,4,672,'Language Dwarven',1),(3,4,2098,'Eviscerate',1),(3,4,9077,'Leather',1),(3,4,203,'Unarmed',1),(3,5,2382,'Generic',1),(3,5,3365,'Opening',1),(3,5,3050,'Detect',1),(3,5,6233,'Closing',1),(3,5,6246,'Closing',1),(3,5,6247,'Opening',1),(3,5,9125,'Generic',1),(3,5,2479,'Honorless Target',1),(3,5,6477,'Opening',1),(3,5,6478,'Opening',1),(3,5,6603,'Attack',1),(3,5,7266,'Duel',1),(3,5,7267,'Grovel',1),(3,5,7355,'Stuck',1),(3,5,8386,'Attacking',1),(3,5,21651,'Opening',1),(3,5,21652,'Closing',1),(3,5,22027,'Remove Insignia',1),(3,5,22810,'Opening - No Text',1),(3,5,5009,'Wands',1),(3,5,5019,'Shoot',1),(3,5,668,'Language Common',1),(3,5,9078,'Cloth',1),(3,5,204,'Defense',1),(3,5,81,'Dodge',1),(3,5,522,'SPELLDEFENSE (DND)',1),(3,5,2050,'Lesser Heal',1),(3,5,585,'Smite',1),(3,5,2481,'Find Treasure',1),(3,5,20596,'Frost Resistance',1),(3,5,20595,'Gun Specialization',1),(3,5,20594,'Stoneform',1),(3,5,672,'Language Dwarven',1),(3,5,198,'One-Handed Maces',1),(3,5,203,'Unarmed',1),(4,1,1180,'Daggers',1),(4,1,2382,'Generic',1),(4,1,3365,'Opening',1),(4,1,3050,'Detect',1),(4,1,6233,'Closing',1),(4,1,6246,'Closing',1),(4,1,6247,'Opening',1),(4,1,9125,'Generic',1),(4,1,2479,'Honorless Target',1),(4,1,6477,'Opening',1),(4,1,6478,'Opening',1),(4,1,6603,'Attack',1),(4,1,7266,'Duel',1),(4,1,7267,'Grovel',1),(4,1,7355,'Stuck',1),(4,1,8386,'Attacking',1),(4,1,21651,'Opening',1),(4,1,21652,'Closing',1),(4,1,22027,'Remove Insignia',1),(4,1,22810,'Opening - No Text',1),(4,1,9116,'Shield',1),(4,1,668,'Language Common',1),(4,1,9078,'Cloth',1),(4,1,204,'Defense',1),(4,1,81,'Dodge',1),(4,1,522,'SPELLDEFENSE (DND)',1),(4,1,107,'Block',1),(4,1,5301,'Defensive State (DND)',1),(4,1,201,'One-Handed Swords',1),(4,1,78,'Heroic Strike',1),(4,1,2457,'Battle Stance',1),(4,1,671,'Language Darnassian',1),(4,1,8737,'Mail',1),(4,1,9077,'Leather',1),(4,1,198,'One-Handed Maces',1),(4,1,20580,'Shadowmeld',1),(4,1,20583,'Nature Resistance',1),(4,1,20582,'Quickness',1),(4,1,20585,'Wisp Spirit',1),(4,1,21009,'Shadowmeld Passive',1),(4,1,203,'Unarmed',1),(4,11,1180,'Daggers',1),(4,11,2382,'Generic',1),(4,11,3365,'Opening',1),(4,11,3050,'Detect',1),(4,11,6233,'Closing',1),(4,11,6246,'Closing',1),(4,11,6247,'Opening',1),(4,11,9125,'Generic',1),(4,11,2479,'Honorless Target',1),(4,11,6477,'Opening',1),(4,11,6478,'Opening',1),(4,11,6603,'Attack',1),(4,11,7266,'Duel',1),(4,11,7267,'Grovel',1),(4,11,7355,'Stuck',1),(4,11,8386,'Attacking',1),(4,11,21651,'Opening',1),(4,11,21652,'Closing',1),(4,11,22027,'Remove Insignia',1),(4,11,22810,'Opening - No Text',1),(4,11,5176,'Wrath',1),(4,11,5185,'Healing Touch',1),(4,11,668,'Language Common',1),(4,11,9078,'Cloth',1),(4,11,204,'Defense',1),(4,11,81,'Dodge',1),(4,11,522,'SPELLDEFENSE (DND)',1),(4,11,671,'Language Darnassian',1),(4,11,227,'Staves',1),(4,11,9077,'Leather',1),(4,11,20580,'Shadowmeld',1),(4,11,20583,'Nature Resistance',1),(4,11,20582,'Quickness',1),(4,11,20585,'Wisp Spirit',1),(4,11,21009,'Shadowmeld Passive',1),(4,11,203,'Unarmed',1),(4,3,1180,'Daggers',1),(4,3,2382,'Generic',1),(4,3,3365,'Opening',1),(4,3,3050,'Detect',1),(4,3,6233,'Closing',1),(4,3,6246,'Closing',1),(4,3,6247,'Opening',1),(4,3,9125,'Generic',1),(4,3,2479,'Honorless Target',1),(4,3,6477,'Opening',1),(4,3,6478,'Opening',1),(4,3,6603,'Attack',1),(4,3,7266,'Duel',1),(4,3,7267,'Grovel',1),(4,3,7355,'Stuck',1),(4,3,8386,'Attacking',1),(4,3,21651,'Opening',1),(4,3,21652,'Closing',1),(4,3,22027,'Remove Insignia',1),(4,3,22810,'Opening - No Text',1),(4,3,668,'Language Common',1),(4,3,9078,'Cloth',1),(4,3,204,'Defense',1),(4,3,81,'Dodge',1),(4,3,522,'SPELLDEFENSE (DND)',1),(4,3,13358,'Defensive State (DND)',1),(4,3,24949,'Defensive State 2 (DND)',1),(4,3,2973,'Raptor Strike',1),(4,3,671,'Language Darnassian',1),(4,3,9077,'Leather',1),(4,3,264,'Bows',1),(4,3,75,'Auto Shot',1),(4,3,20580,'Shadowmeld',1),(4,3,20583,'Nature Resistance',1),(4,3,20582,'Quickness',1),(4,3,20585,'Wisp Spirit',1),(4,3,21009,'Shadowmeld Passive',1),(4,3,203,'Unarmed',1),(4,4,1180,'Daggers',1),(4,4,2382,'Generic',1),(4,4,3365,'Opening',1),(4,4,3050,'Detect',1),(4,4,6233,'Closing',1),(4,4,6246,'Closing',1),(4,4,6247,'Opening',1),(4,4,9125,'Generic',1),(4,4,2479,'Honorless Target',1),(4,4,6477,'Opening',1),(4,4,6478,'Opening',1),(4,4,6603,'Attack',1),(4,4,7266,'Duel',1),(4,4,7267,'Grovel',1),(4,4,7355,'Stuck',1),(4,4,8386,'Attacking',1),(4,4,21651,'Opening',1),(4,4,21652,'Closing',1),(4,4,22027,'Remove Insignia',1),(4,4,22810,'Opening - No Text',1),(4,4,668,'Language Common',1),(4,4,9078,'Cloth',1),(4,4,204,'Defense',1),(4,4,81,'Dodge',1),(4,4,522,'SPELLDEFENSE (DND)',1),(4,4,16092,'Defensive State (DND)',1),(4,4,2567,'Thrown',1),(4,4,2764,'Throw',1),(4,4,1752,'Sinister Strike',1),(4,4,21184,'Rogue Passive (DND)',1),(4,4,671,'Language Darnassian',1),(4,4,2098,'Eviscerate',1),(4,4,9077,'Leather',1),(4,4,20580,'Shadowmeld',1),(4,4,20583,'Nature Resistance',1),(4,4,20582,'Quickness',1),(4,4,20585,'Wisp Spirit',1),(4,4,21009,'Shadowmeld Passive',1),(4,4,203,'Unarmed',1),(4,5,2382,'Generic',1),(4,5,3365,'Opening',1),(4,5,3050,'Detect',1),(4,5,6233,'Closing',1),(4,5,6246,'Closing',1),(4,5,6247,'Opening',1),(4,5,9125,'Generic',1),(4,5,2479,'Honorless Target',1),(4,5,6477,'Opening',1),(4,5,6478,'Opening',1),(4,5,6603,'Attack',1),(4,5,7266,'Duel',1),(4,5,7267,'Grovel',1),(4,5,7355,'Stuck',1),(4,5,8386,'Attacking',1),(4,5,21651,'Opening',1),(4,5,21652,'Closing',1),(4,5,22027,'Remove Insignia',1),(4,5,22810,'Opening - No Text',1),(4,5,5009,'Wands',1),(4,5,5019,'Shoot',1),(4,5,668,'Language Common',1),(4,5,9078,'Cloth',1),(4,5,204,'Defense',1),(4,5,81,'Dodge',1),(4,5,522,'SPELLDEFENSE (DND)',1),(4,5,2050,'Lesser Heal',1),(4,5,585,'Smite',1),(4,5,671,'Language Darnassian',1),(4,5,198,'One-Handed Maces',1),(4,5,20580,'Shadowmeld',1),(4,5,20583,'Nature Resistance',1),(4,5,20582,'Quickness',1),(4,5,20585,'Wisp Spirit',1),(4,5,21009,'Shadowmeld Passive',1),(4,5,203,'Unarmed',1),(5,1,1180,'Daggers',1),(5,1,2382,'Generic',1),(5,1,3365,'Opening',1),(5,1,3050,'Detect',1),(5,1,6233,'Closing',1),(5,1,6246,'Closing',1),(5,1,6247,'Opening',1),(5,1,9125,'Generic',1),(5,1,2479,'Honorless Target',1),(5,1,6477,'Opening',1),(5,1,6478,'Opening',1),(5,1,6603,'Attack',1),(5,1,7266,'Duel',1),(5,1,7267,'Grovel',1),(5,1,7355,'Stuck',1),(5,1,8386,'Attacking',1),(5,1,21651,'Opening',1),(5,1,21652,'Closing',1),(5,1,22027,'Remove Insignia',1),(5,1,22810,'Opening - No Text',1),(5,1,5227,'Underwater Breathing',1),(5,1,7744,'Will of the Forsaken',1),(5,1,20577,'Cannibalize',1),(5,1,20579,'Shadow Resistance',1),(5,1,669,'Language Orcish',1),(5,1,9116,'Shield',1),(5,1,9078,'Cloth',1),(5,1,17737,'Language Gutterspeak',1),(5,1,204,'Defense',1),(5,1,81,'Dodge',1),(5,1,522,'SPELLDEFENSE (DND)',1),(5,1,107,'Block',1),(5,1,5301,'Defensive State (DND)',1),(5,1,201,'One-Handed Swords',1),(5,1,202,'Two-Handed Swords',1),(5,1,78,'Heroic Strike',1),(5,1,2457,'Battle Stance',1),(5,1,8737,'Mail',1),(5,1,9077,'Leather',1),(5,1,203,'Unarmed',1),(5,4,1180,'Daggers',1),(5,4,2382,'Generic',1),(5,4,3365,'Opening',1),(5,4,3050,'Detect',1),(5,4,6233,'Closing',1),(5,4,6246,'Closing',1),(5,4,6247,'Opening',1),(5,4,9125,'Generic',1),(5,4,2479,'Honorless Target',1),(5,4,6477,'Opening',1),(5,4,6478,'Opening',1),(5,4,6603,'Attack',1),(5,4,7266,'Duel',1),(5,4,7267,'Grovel',1),(5,4,7355,'Stuck',1),(5,4,8386,'Attacking',1),(5,4,21651,'Opening',1),(5,4,21652,'Closing',1),(5,4,22027,'Remove Insignia',1),(5,4,22810,'Opening - No Text',1),(5,4,5227,'Underwater Breathing',1),(5,4,7744,'Will of the Forsaken',1),(5,4,20577,'Cannibalize',1),(5,4,20579,'Shadow Resistance',1),(5,4,669,'Language Orcish',1),(5,4,9078,'Cloth',1),(5,4,17737,'Language Gutterspeak',1),(5,4,204,'Defense',1),(5,4,81,'Dodge',1),(5,4,522,'SPELLDEFENSE (DND)',1),(5,4,16092,'Defensive State (DND)',1),(5,4,2567,'Thrown',1),(5,4,2764,'Throw',1),(5,4,1752,'Sinister Strike',1),(5,4,21184,'Rogue Passive (DND)',1),(5,4,2098,'Eviscerate',1),(5,4,9077,'Leather',1),(5,4,203,'Unarmed',1),(5,5,2382,'Generic',1),(5,5,3365,'Opening',1),(5,5,3050,'Detect',1),(5,5,6233,'Closing',1),(5,5,6246,'Closing',1),(5,5,6247,'Opening',1),(5,5,9125,'Generic',1),(5,5,2479,'Honorless Target',1),(5,5,6477,'Opening',1),(5,5,6478,'Opening',1),(5,5,6603,'Attack',1),(5,5,7266,'Duel',1),(5,5,7267,'Grovel',1),(5,5,7355,'Stuck',1),(5,5,8386,'Attacking',1),(5,5,21651,'Opening',1),(5,5,21652,'Closing',1),(5,5,22027,'Remove Insignia',1),(5,5,22810,'Opening - No Text',1),(5,5,5227,'Underwater Breathing',1),(5,5,7744,'Will of the Forsaken',1),(5,5,20577,'Cannibalize',1),(5,5,20579,'Shadow Resistance',1),(5,5,5009,'Wands',1),(5,5,5019,'Shoot',1),(5,5,669,'Language Orcish',1),(5,5,9078,'Cloth',1),(5,5,17737,'Language Gutterspeak',1),(5,5,204,'Defense',1),(5,5,81,'Dodge',1),(5,5,522,'SPELLDEFENSE (DND)',1),(5,5,2050,'Lesser Heal',1),(5,5,585,'Smite',1),(5,5,198,'One-Handed Maces',1),(5,5,203,'Unarmed',1),(5,8,2382,'Generic',1),(5,8,3365,'Opening',1),(5,8,3050,'Detect',1),(5,8,6233,'Closing',1),(5,8,6246,'Closing',1),(5,8,6247,'Opening',1),(5,8,9125,'Generic',1),(5,8,2479,'Honorless Target',1),(5,8,6477,'Opening',1),(5,8,6478,'Opening',1),(5,8,6603,'Attack',1),(5,8,7266,'Duel',1),(5,8,7267,'Grovel',1),(5,8,7355,'Stuck',1),(5,8,8386,'Attacking',1),(5,8,21651,'Opening',1),(5,8,21652,'Closing',1),(5,8,22027,'Remove Insignia',1),(5,8,22810,'Opening - No Text',1),(5,8,5227,'Underwater Breathing',1),(5,8,7744,'Will of the Forsaken',1),(5,8,20577,'Cannibalize',1),(5,8,20579,'Shadow Resistance',1),(5,8,5009,'Wands',1),(5,8,5019,'Shoot',1),(5,8,669,'Language Orcish',1),(5,8,133,'Fireball',1),(5,8,9078,'Cloth',1),(5,8,17737,'Language Gutterspeak',1),(5,8,204,'Defense',1),(5,8,81,'Dodge',1),(5,8,522,'SPELLDEFENSE (DND)',1),(5,8,168,'Frost Armor',1),(5,8,227,'Staves',1),(5,8,203,'Unarmed',1),(5,9,1180,'Daggers',1),(5,9,2382,'Generic',1),(5,9,3365,'Opening',1),(5,9,3050,'Detect',1),(5,9,6233,'Closing',1),(5,9,6246,'Closing',1),(5,9,6247,'Opening',1),(5,9,9125,'Generic',1),(5,9,2479,'Honorless Target',1),(5,9,6477,'Opening',1),(5,9,6478,'Opening',1),(5,9,6603,'Attack',1),(5,9,7266,'Duel',1),(5,9,7267,'Grovel',1),(5,9,7355,'Stuck',1),(5,9,8386,'Attacking',1),(5,9,21651,'Opening',1),(5,9,21652,'Closing',1),(5,9,22027,'Remove Insignia',1),(5,9,22810,'Opening - No Text',1),(5,9,5227,'Underwater Breathing',1),(5,9,7744,'Will of the Forsaken',1),(5,9,20577,'Cannibalize',1),(5,9,20579,'Shadow Resistance',1),(5,9,5009,'Wands',1),(5,9,5019,'Shoot',1),(5,9,669,'Language Orcish',1),(5,9,686,'Shadow Bolt',1),(5,9,687,'Demon Skin',1),(5,9,9078,'Cloth',1),(5,9,17737,'Language Gutterspeak',1),(5,9,204,'Defense',1),(5,9,81,'Dodge',1),(5,9,522,'SPELLDEFENSE (DND)',1),(5,9,203,'Unarmed',1),(6,1,2382,'Generic',1),(6,1,3365,'Opening',1),(6,1,3050,'Detect',1),(6,1,6233,'Closing',1),(6,1,6246,'Closing',1),(6,1,6247,'Opening',1),(6,1,9125,'Generic',1),(6,1,2479,'Honorless Target',1),(6,1,6477,'Opening',1),(6,1,6478,'Opening',1),(6,1,6603,'Attack',1),(6,1,7266,'Duel',1),(6,1,7267,'Grovel',1),(6,1,7355,'Stuck',1),(6,1,8386,'Attacking',1),(6,1,21651,'Opening',1),(6,1,21652,'Closing',1),(6,1,22027,'Remove Insignia',1),(6,1,22810,'Opening - No Text',1),(6,1,669,'Language Orcish',1),(6,1,20549,'War Stomp',1),(6,1,20550,'Endurance',1),(6,1,20551,'Nature Resistance',1),(6,1,20552,'Cultivation',1),(6,1,9116,'Shield',1),(6,1,9078,'Cloth',1),(6,1,204,'Defense',1),(6,1,81,'Dodge',1),(6,1,522,'SPELLDEFENSE (DND)',1),(6,1,107,'Block',1),(6,1,5301,'Defensive State (DND)',1),(6,1,78,'Heroic Strike',1),(6,1,2457,'Battle Stance',1),(6,1,196,'One-Handed Axes',1),(6,1,670,'Language Taurahe',1),(6,1,199,'Two-Handed Maces',1),(6,1,8737,'Mail',1),(6,1,9077,'Leather',1),(6,1,198,'One-Handed Maces',1),(6,1,203,'Unarmed',1),(6,11,2382,'Generic',1),(6,11,3365,'Opening',1),(6,11,3050,'Detect',1),(6,11,6233,'Closing',1),(6,11,6246,'Closing',1),(6,11,6247,'Opening',1),(6,11,9125,'Generic',1),(6,11,2479,'Honorless Target',1),(6,11,6477,'Opening',1),(6,11,6478,'Opening',1),(6,11,6603,'Attack',1),(6,11,7266,'Duel',1),(6,11,7267,'Grovel',1),(6,11,7355,'Stuck',1),(6,11,8386,'Attacking',1),(6,11,21651,'Opening',1),(6,11,21652,'Closing',1),(6,11,22027,'Remove Insignia',1),(6,11,22810,'Opening - No Text',1),(6,11,5176,'Wrath',1),(6,11,669,'Language Orcish',1),(6,11,20549,'War Stomp',1),(6,11,20550,'Endurance',1),(6,11,20551,'Nature Resistance',1),(6,11,20552,'Cultivation',1),(6,11,5185,'Healing Touch',1),(6,11,9078,'Cloth',1),(6,11,204,'Defense',1),(6,11,81,'Dodge',1),(6,11,522,'SPELLDEFENSE (DND)',1),(6,11,670,'Language Taurahe',1),(6,11,227,'Staves',1),(6,11,9077,'Leather',1),(6,11,198,'One-Handed Maces',1),(6,11,203,'Unarmed',1),(6,3,2382,'Generic',1),(6,3,3365,'Opening',1),(6,3,3050,'Detect',1),(6,3,6233,'Closing',1),(6,3,6246,'Closing',1),(6,3,6247,'Opening',1),(6,3,9125,'Generic',1),(6,3,2479,'Honorless Target',1),(6,3,6477,'Opening',1),(6,3,6478,'Opening',1),(6,3,6603,'Attack',1),(6,3,7266,'Duel',1),(6,3,7267,'Grovel',1),(6,3,7355,'Stuck',1),(6,3,8386,'Attacking',1),(6,3,21651,'Opening',1),(6,3,21652,'Closing',1),(6,3,22027,'Remove Insignia',1),(6,3,22810,'Opening - No Text',1),(6,3,669,'Language Orcish',1),(6,3,20549,'War Stomp',1),(6,3,20550,'Endurance',1),(6,3,20551,'Nature Resistance',1),(6,3,20552,'Cultivation',1),(6,3,9078,'Cloth',1),(6,3,204,'Defense',1),(6,3,81,'Dodge',1),(6,3,522,'SPELLDEFENSE (DND)',1),(6,3,13358,'Defensive State (DND)',1),(6,3,24949,'Defensive State 2 (DND)',1),(6,3,196,'One-Handed Axes',1),(6,3,2973,'Raptor Strike',1),(6,3,670,'Language Taurahe',1),(6,3,9077,'Leather',1),(6,3,75,'Auto Shot',1),(6,3,266,'Guns',1),(6,3,203,'Unarmed',1),(6,7,2382,'Generic',1),(6,7,3365,'Opening',1),(6,7,3050,'Detect',1),(6,7,6233,'Closing',1),(6,7,6246,'Closing',1),(6,7,6247,'Opening',1),(6,7,9125,'Generic',1),(6,7,2479,'Honorless Target',1),(6,7,6477,'Opening',1),(6,7,6478,'Opening',1),(6,7,6603,'Attack',1),(6,7,7266,'Duel',1),(6,7,7267,'Grovel',1),(6,7,7355,'Stuck',1),(6,7,8386,'Attacking',1),(6,7,21651,'Opening',1),(6,7,21652,'Closing',1),(6,7,22027,'Remove Insignia',1),(6,7,22810,'Opening - No Text',1),(6,7,669,'Language Orcish',1),(6,7,20549,'War Stomp',1),(6,7,20550,'Endurance',1),(6,7,20551,'Nature Resistance',1),(6,7,20552,'Cultivation',1),(6,7,9116,'Shield',1),(6,7,331,'Healing Wave',1),(6,7,403,'Lightning Bolt',1),(6,7,9078,'Cloth',1),(6,7,204,'Defense',1),(6,7,81,'Dodge',1),(6,7,522,'SPELLDEFENSE (DND)',1),(6,7,107,'Block',1),(6,7,670,'Language Taurahe',1),(6,7,227,'Staves',1),(6,7,9077,'Leather',1),(6,7,198,'One-Handed Maces',1),(6,7,203,'Unarmed',1),(7,1,1180,'Daggers',1),(7,1,2382,'Generic',1),(7,1,3365,'Opening',1),(7,1,3050,'Detect',1),(7,1,6233,'Closing',1),(7,1,6246,'Closing',1),(7,1,6247,'Opening',1),(7,1,9125,'Generic',1),(7,1,2479,'Honorless Target',1),(7,1,6477,'Opening',1),(7,1,6478,'Opening',1),(7,1,6603,'Attack',1),(7,1,7266,'Duel',1),(7,1,7267,'Grovel',1),(7,1,7355,'Stuck',1),(7,1,8386,'Attacking',1),(7,1,21651,'Opening',1),(7,1,21652,'Closing',1),(7,1,22027,'Remove Insignia',1),(7,1,22810,'Opening - No Text',1),(7,1,9116,'Shield',1),(7,1,668,'Language Common',1),(7,1,9078,'Cloth',1),(7,1,204,'Defense',1),(7,1,81,'Dodge',1),(7,1,522,'SPELLDEFENSE (DND)',1),(7,1,107,'Block',1),(7,1,5301,'Defensive State (DND)',1),(7,1,201,'One-Handed Swords',1),(7,1,20589,'Escape Artist',1),(7,1,20591,'Expansive Mind',1),(7,1,20593,'Engineering Specialization',1),(7,1,20592,'Arcane Resistance',1),(7,1,78,'Heroic Strike',1),(7,1,2457,'Battle Stance',1),(7,1,7340,'Language Gnomish',1),(7,1,8737,'Mail',1),(7,1,9077,'Leather',1),(7,1,198,'One-Handed Maces',1),(7,1,203,'Unarmed',1),(7,4,1180,'Daggers',1),(7,4,2382,'Generic',1),(7,4,3365,'Opening',1),(7,4,3050,'Detect',1),(7,4,6233,'Closing',1),(7,4,6246,'Closing',1),(7,4,6247,'Opening',1),(7,4,9125,'Generic',1),(7,4,2479,'Honorless Target',1),(7,4,6477,'Opening',1),(7,4,6478,'Opening',1),(7,4,6603,'Attack',1),(7,4,7266,'Duel',1),(7,4,7267,'Grovel',1),(7,4,7355,'Stuck',1),(7,4,8386,'Attacking',1),(7,4,21651,'Opening',1),(7,4,21652,'Closing',1),(7,4,22027,'Remove Insignia',1),(7,4,22810,'Opening - No Text',1),(7,4,668,'Language Common',1),(7,4,9078,'Cloth',1),(7,4,204,'Defense',1),(7,4,81,'Dodge',1),(7,4,522,'SPELLDEFENSE (DND)',1),(7,4,16092,'Defensive State (DND)',1),(7,4,20589,'Escape Artist',1),(7,4,20591,'Expansive Mind',1),(7,4,20593,'Engineering Specialization',1),(7,4,20592,'Arcane Resistance',1),(7,4,2567,'Thrown',1),(7,4,2764,'Throw',1),(7,4,1752,'Sinister Strike',1),(7,4,21184,'Rogue Passive (DND)',1),(7,4,2098,'Eviscerate',1),(7,4,7340,'Language Gnomish',1),(7,4,9077,'Leather',1),(7,4,203,'Unarmed',1),(7,8,2382,'Generic',1),(7,8,3365,'Opening',1),(7,8,3050,'Detect',1),(7,8,6233,'Closing',1),(7,8,6246,'Closing',1),(7,8,6247,'Opening',1),(7,8,9125,'Generic',1),(7,8,2479,'Honorless Target',1),(7,8,6477,'Opening',1),(7,8,6478,'Opening',1),(7,8,6603,'Attack',1),(7,8,7266,'Duel',1),(7,8,7267,'Grovel',1),(7,8,7355,'Stuck',1),(7,8,8386,'Attacking',1),(7,8,21651,'Opening',1),(7,8,21652,'Closing',1),(7,8,22027,'Remove Insignia',1),(7,8,22810,'Opening - No Text',1),(7,8,5009,'Wands',1),(7,8,5019,'Shoot',1),(7,8,133,'Fireball',1),(7,8,668,'Language Common',1),(7,8,9078,'Cloth',1),(7,8,204,'Defense',1),(7,8,81,'Dodge',1),(7,8,522,'SPELLDEFENSE (DND)',1),(7,8,20589,'Escape Artist',1),(7,8,20591,'Expansive Mind',1),(7,8,20593,'Engineering Specialization',1),(7,8,20592,'Arcane Resistance',1),(7,8,168,'Frost Armor',1),(7,8,227,'Staves',1),(7,8,7340,'Language Gnomish',1),(7,8,203,'Unarmed',1),(7,9,1180,'Daggers',1),(7,9,2382,'Generic',1),(7,9,3365,'Opening',1),(7,9,3050,'Detect',1),(7,9,6233,'Closing',1),(7,9,6246,'Closing',1),(7,9,6247,'Opening',1),(7,9,9125,'Generic',1),(7,9,2479,'Honorless Target',1),(7,9,6477,'Opening',1),(7,9,6478,'Opening',1),(7,9,6603,'Attack',1),(7,9,7266,'Duel',1),(7,9,7267,'Grovel',1),(7,9,7355,'Stuck',1),(7,9,8386,'Attacking',1),(7,9,21651,'Opening',1),(7,9,21652,'Closing',1),(7,9,22027,'Remove Insignia',1),(7,9,22810,'Opening - No Text',1),(7,9,5009,'Wands',1),(7,9,5019,'Shoot',1),(7,9,686,'Shadow Bolt',1),(7,9,668,'Language Common',1),(7,9,687,'Demon Skin',1),(7,9,9078,'Cloth',1),(7,9,204,'Defense',1),(7,9,81,'Dodge',1),(7,9,522,'SPELLDEFENSE (DND)',1),(7,9,20589,'Escape Artist',1),(7,9,20591,'Expansive Mind',1),(7,9,20593,'Engineering Specialization',1),(7,9,20592,'Arcane Resistance',1),(7,9,7340,'Language Gnomish',1),(7,9,203,'Unarmed',1),(8,1,1180,'Daggers',1),(8,1,2382,'Generic',1),(8,1,3365,'Opening',1),(8,1,3050,'Detect',1),(8,1,6233,'Closing',1),(8,1,6246,'Closing',1),(8,1,6247,'Opening',1),(8,1,9125,'Generic',1),(8,1,2479,'Honorless Target',1),(8,1,6477,'Opening',1),(8,1,6478,'Opening',1),(8,1,6603,'Attack',1),(8,1,7266,'Duel',1),(8,1,7267,'Grovel',1),(8,1,7355,'Stuck',1),(8,1,8386,'Attacking',1),(8,1,21651,'Opening',1),(8,1,21652,'Closing',1),(8,1,22027,'Remove Insignia',1),(8,1,22810,'Opening - No Text',1),(8,1,669,'Language Orcish',1),(8,1,9116,'Shield',1),(8,1,7341,'Language Troll',1),(8,1,9078,'Cloth',1),(8,1,204,'Defense',1),(8,1,81,'Dodge',1),(8,1,522,'SPELLDEFENSE (DND)',1),(8,1,107,'Block',1),(8,1,5301,'Defensive State (DND)',1),(8,1,23301,'Berserking',1),(8,1,20555,'Regeneration',1),(8,1,20557,'Beast Slaying',1),(8,1,20558,'Throwing Specialization',1),(8,1,26290,'Bow Specialization',1),(8,1,26296,'Berserking',1),(8,1,2567,'Thrown',1),(8,1,2764,'Throw',1),(8,1,78,'Heroic Strike',1),(8,1,2457,'Battle Stance',1),(8,1,196,'One-Handed Axes',1),(8,1,8737,'Mail',1),(8,1,9077,'Leather',1),(8,1,203,'Unarmed',1),(8,3,2382,'Generic',1),(8,3,3365,'Opening',1),(8,3,3050,'Detect',1),(8,3,6233,'Closing',1),(8,3,6246,'Closing',1),(8,3,6247,'Opening',1),(8,3,9125,'Generic',1),(8,3,2479,'Honorless Target',1),(8,3,6477,'Opening',1),(8,3,6478,'Opening',1),(8,3,6603,'Attack',1),(8,3,7266,'Duel',1),(8,3,7267,'Grovel',1),(8,3,7355,'Stuck',1),(8,3,8386,'Attacking',1),(8,3,21651,'Opening',1),(8,3,21652,'Closing',1),(8,3,22027,'Remove Insignia',1),(8,3,22810,'Opening - No Text',1),(8,3,669,'Language Orcish',1),(8,3,7341,'Language Troll',1),(8,3,9078,'Cloth',1),(8,3,204,'Defense',1),(8,3,81,'Dodge',1),(8,3,522,'SPELLDEFENSE (DND)',1),(8,3,13358,'Defensive State (DND)',1),(8,3,24949,'Defensive State 2 (DND)',1),(8,3,23301,'Berserking',1),(8,3,20554,'Berserking',1),(8,3,20555,'Regeneration',1),(8,3,20557,'Beast Slaying',1),(8,3,20558,'Throwing Specialization',1),(8,3,26290,'Bow Specialization',1),(8,3,196,'One-Handed Axes',1),(8,3,2973,'Raptor Strike',1),(8,3,9077,'Leather',1),(8,3,264,'Bows',1),(8,3,75,'Auto Shot',1),(8,3,203,'Unarmed',1),(8,4,1180,'Daggers',1),(8,4,2382,'Generic',1),(8,4,3365,'Opening',1),(8,4,3050,'Detect',1),(8,4,6233,'Closing',1),(8,4,6246,'Closing',1),(8,4,6247,'Opening',1),(8,4,9125,'Generic',1),(8,4,2479,'Honorless Target',1),(8,4,6477,'Opening',1),(8,4,6478,'Opening',1),(8,4,6603,'Attack',1),(8,4,7266,'Duel',1),(8,4,7267,'Grovel',1),(8,4,7355,'Stuck',1),(8,4,8386,'Attacking',1),(8,4,21651,'Opening',1),(8,4,21652,'Closing',1),(8,4,22027,'Remove Insignia',1),(8,4,22810,'Opening - No Text',1),(8,4,669,'Language Orcish',1),(8,4,7341,'Language Troll',1),(8,4,9078,'Cloth',1),(8,4,204,'Defense',1),(8,4,81,'Dodge',1),(8,4,522,'SPELLDEFENSE (DND)',1),(8,4,16092,'Defensive State (DND)',1),(8,4,23301,'Berserking',1),(8,4,20555,'Regeneration',1),(8,4,20557,'Beast Slaying',1),(8,4,20558,'Throwing Specialization',1),(8,4,26290,'Bow Specialization',1),(8,4,26297,'Berserking',1),(8,4,2567,'Thrown',1),(8,4,2764,'Throw',1),(8,4,1752,'Sinister Strike',1),(8,4,21184,'Rogue Passive (DND)',1),(8,4,2098,'Eviscerate',1),(8,4,9077,'Leather',1),(8,4,203,'Unarmed',1),(8,5,2382,'Generic',1),(8,5,3365,'Opening',1),(8,5,3050,'Detect',1),(8,5,6233,'Closing',1),(8,5,6246,'Closing',1),(8,5,6247,'Opening',1),(8,5,9125,'Generic',1),(8,5,2479,'Honorless Target',1),(8,5,6477,'Opening',1),(8,5,6478,'Opening',1),(8,5,6603,'Attack',1),(8,5,7266,'Duel',1),(8,5,7267,'Grovel',1),(8,5,7355,'Stuck',1),(8,5,8386,'Attacking',1),(8,5,21651,'Opening',1),(8,5,21652,'Closing',1),(8,5,22027,'Remove Insignia',1),(8,5,22810,'Opening - No Text',1),(8,5,5009,'Wands',1),(8,5,5019,'Shoot',1),(8,5,669,'Language Orcish',1),(8,5,7341,'Language Troll',1),(8,5,9078,'Cloth',1),(8,5,204,'Defense',1),(8,5,81,'Dodge',1),(8,5,522,'SPELLDEFENSE (DND)',1),(8,5,23301,'Berserking',1),(8,5,20554,'Berserking',1),(8,5,20555,'Regeneration',1),(8,5,20557,'Beast Slaying',1),(8,5,20558,'Throwing Specialization',1),(8,5,26290,'Bow Specialization',1),(8,5,2050,'Lesser Heal',1),(8,5,585,'Smite',1),(8,5,198,'One-Handed Maces',1),(8,5,203,'Unarmed',1),(8,7,2382,'Generic',1),(8,7,3365,'Opening',1),(8,7,3050,'Detect',1),(8,7,6233,'Closing',1),(8,7,6246,'Closing',1),(8,7,6247,'Opening',1),(8,7,9125,'Generic',1),(8,7,2479,'Honorless Target',1),(8,7,6477,'Opening',1),(8,7,6478,'Opening',1),(8,7,6603,'Attack',1),(8,7,7266,'Duel',1),(8,7,7267,'Grovel',1),(8,7,7355,'Stuck',1),(8,7,8386,'Attacking',1),(8,7,21651,'Opening',1),(8,7,21652,'Closing',1),(8,7,22027,'Remove Insignia',1),(8,7,22810,'Opening - No Text',1),(8,7,669,'Language Orcish',1),(8,7,9116,'Shield',1),(8,7,7341,'Language Troll',1),(8,7,331,'Healing Wave',1),(8,7,403,'Lightning Bolt',1),(8,7,9078,'Cloth',1),(8,7,204,'Defense',1),(8,7,81,'Dodge',1),(8,7,522,'SPELLDEFENSE (DND)',1),(8,7,107,'Block',1),(8,7,23301,'Berserking',1),(8,7,20554,'Berserking',1),(8,7,20555,'Regeneration',1),(8,7,20557,'Beast Slaying',1),(8,7,20558,'Throwing Specialization',1),(8,7,26290,'Bow Specialization',1),(8,7,227,'Staves',1),(8,7,9077,'Leather',1),(8,7,198,'One-Handed Maces',1),(8,7,203,'Unarmed',1),(8,8,2382,'Generic',1),(8,8,3365,'Opening',1),(8,8,3050,'Detect',1),(8,8,6233,'Closing',1),(8,8,6246,'Closing',1),(8,8,6247,'Opening',1),(8,8,9125,'Generic',1),(8,8,2479,'Honorless Target',1),(8,8,6477,'Opening',1),(8,8,6478,'Opening',1),(8,8,6603,'Attack',1),(8,8,7266,'Duel',1),(8,8,7267,'Grovel',1),(8,8,7355,'Stuck',1),(8,8,8386,'Attacking',1),(8,8,21651,'Opening',1),(8,8,21652,'Closing',1),(8,8,22027,'Remove Insignia',1),(8,8,22810,'Opening - No Text',1),(8,8,5009,'Wands',1),(8,8,5019,'Shoot',1),(8,8,669,'Language Orcish',1),(8,8,133,'Fireball',1),(8,8,7341,'Language Troll',1),(8,8,9078,'Cloth',1),(8,8,204,'Defense',1),(8,8,81,'Dodge',1),(8,8,522,'SPELLDEFENSE (DND)',1),(8,8,23301,'Berserking',1),(8,8,20554,'Berserking',1),(8,8,20555,'Regeneration',1),(8,8,20557,'Beast Slaying',1),(8,8,20558,'Throwing Specialization',1),(8,8,26290,'Bow Specialization',1),(8,8,168,'Frost Armor',1),(8,8,227,'Staves',1),(8,8,203,'Unarmed',1),(4,11,3025,'Cat Form Passive',0),(4,11,3122,'Tree Form Passive',0),(4,11,5419,'Travel Form Passive',0),(4,11,5421,'Aqua Form Passive',0),(4,11,1178,'Bear Form Passive',0),(4,11,9635,'Dire Bear Form Passive',0),(4,11,24905,'Moonkin Form Passive',0),(6,11,3025,'Cat Form Passive',0),(6,11,3122,'Tree Form Passive',0),(6,11,5419,'Travel Form Passive',0),(6,11,5421,'Aqua Form Passive',0),(6,11,1178,'Bear Form Passive',0),(6,11,9635,'Dire Bear Form Passive',0),(6,11,24905,'Moonkin Form Passive',0),(1,1,7376,'Defensive Stance Passive',0),(1,1,7381,'Berserker Stance Passive',0),(2,1,7376,'Defensive Stance Passive',0),(2,1,7381,'Berserker Stance Passive',0),(3,1,7376,'Defensive Stance Passive',0),(3,1,7381,'Berserker Stance Passive',0),(4,1,7376,'Defensive Stance Passive',0),(4,1,7381,'Berserker Stance Passive',0),(5,1,7376,'Defensive Stance Passive',0),(5,1,7381,'Berserker Stance Passive',0),(6,1,7376,'Defensive Stance Passive',0),(6,1,7381,'Berserker Stance Passive',0),(7,1,7376,'Defensive Stance Passive',0),(7,1,7381,'Berserker Stance Passive',0),(8,1,7376,'Defensive Stance Passive',0),(8,1,7381,'Berserker Stance Passive',0),('1','1','21156','Battle Stance Passive',0),('2','1','21156','Battle Stance Passive',0),('3','1','21156','Battle Stance Passive',0),('4','1','21156','Battle Stance Passive',0),('5','1','21156','Battle Stance Passive',0),('6','1','21156','Battle Stance Passive',0),('7','1','21156','Battle Stance Passive',0),('8','1','21156','Battle Stance Passive',0),('4','11','21178','Bear Form (Passive2)',0),('6','11','21178','Bear Form (Passive2)',0);

UNLOCK TABLES;
/*!40000 ALTER TABLE `playercreateinfo_spell` ENABLE KEYS */;

--
-- Table structure for table `quest_template`
--

DROP TABLE IF EXISTS `quest_template`;
CREATE TABLE `quest_template` (
  `entry` int(11) unsigned NOT NULL default '0',
  `ZoneId` int(11) unsigned NOT NULL default '0',
  `QuestSort` int(11) unsigned NOT NULL default '0',
  `MinLevel` int(11) unsigned NOT NULL default '0',
  `QuestLevel` int(11) unsigned NOT NULL default '0',
  `Type` int(11) unsigned NOT NULL default '0',
  `RequiredRaces` int(11) unsigned NOT NULL default '0',
  `RequiredClass` int(11) unsigned NOT NULL default '0',
  `RequiredSkill` int(11) unsigned NOT NULL default '0',
  `RequiredSkillValue` int(11) unsigned NOT NULL default '1',
  `RequiredRepFaction` int(11) unsigned NOT NULL default '0',
  `RequiredRepValue` int(11) unsigned NOT NULL default '0',
  `LimitTime` int(11) unsigned NOT NULL default '0',
  `SpecialFlags` int(11) unsigned NOT NULL default '0',
  `PrevQuestId` int(11) NOT NULL default '0',
  `NextQuestId` int(11) NOT NULL default '0',
  `ExclusiveGroup` int(11) unsigned NOT NULL default '0',
  `NextQuestInChain` int(11) unsigned NOT NULL default '0',
  `SrcItemId` int(11) unsigned NOT NULL default '0',
  `SrcItemCount` int(11) unsigned NOT NULL default '0',
  `SrcSpell` int(11) unsigned NOT NULL default '0',
  `Title` text,
  `Details` text,
  `Objectives` text,
  `OfferRewardText` text,
  `RequestItemsText` text,
  `EndText` text,
  `ObjectiveText1` text,
  `ObjectiveText2` text,
  `ObjectiveText3` text,
  `ObjectiveText4` text,
  `ReqItemId1` int(11) unsigned NOT NULL default '0',
  `ReqItemId2` int(11) unsigned NOT NULL default '0',
  `ReqItemId3` int(11) unsigned NOT NULL default '0',
  `ReqItemId4` int(11) unsigned NOT NULL default '0',
  `ReqItemCount1` int(11) unsigned NOT NULL default '0',
  `ReqItemCount2` int(11) unsigned NOT NULL default '0',
  `ReqItemCount3` int(11) unsigned NOT NULL default '0',
  `ReqItemCount4` int(11) unsigned NOT NULL default '0',
  `ReqSourceId1` int(11) unsigned NOT NULL default '0',
  `ReqSourceId2` int(11) unsigned NOT NULL default '0',
  `ReqSourceId3` int(11) unsigned NOT NULL default '0',
  `ReqSourceId4` int(11) unsigned NOT NULL default '0',
  `ReqSourceCount1` int(11) unsigned NOT NULL default '0',
  `ReqSourceCount2` int(11) unsigned NOT NULL default '0',
  `ReqSourceCount3` int(11) unsigned NOT NULL default '0',
  `ReqSourceCount4` int(11) unsigned NOT NULL default '0',
  `ReqSourceRef1` int(11) unsigned NOT NULL default '0',
  `ReqSourceRef2` int(11) unsigned NOT NULL default '0',
  `ReqSourceRef3` int(11) unsigned NOT NULL default '0',
  `ReqSourceRef4` int(11) unsigned NOT NULL default '0',
  `ReqCreatureOrGOId1` int(11) NOT NULL default '0',
  `ReqCreatureOrGOId2` int(11) NOT NULL default '0',
  `ReqCreatureOrGOId3` int(11) NOT NULL default '0',
  `ReqCreatureOrGOId4` int(11) NOT NULL default '0',
  `ReqCreatureOrGOCount1` int(11) unsigned NOT NULL default '0',
  `ReqCreatureOrGOCount2` int(11) unsigned NOT NULL default '0',
  `ReqCreatureOrGOCount3` int(11) unsigned NOT NULL default '0',
  `ReqCreatureOrGOCount4` int(11) unsigned NOT NULL default '0',
  `ReqSpellCast1` int(11) unsigned NOT NULL default '0',
  `ReqSpellCast2` int(11) unsigned NOT NULL default '0',
  `ReqSpellCast3` int(11) unsigned NOT NULL default '0',
  `ReqSpellCast4` int(11) unsigned NOT NULL default '0',
  `RewChoiceItemId1` int(11) unsigned NOT NULL default '0',
  `RewChoiceItemId2` int(11) unsigned NOT NULL default '0',
  `RewChoiceItemId3` int(11) unsigned NOT NULL default '0',
  `RewChoiceItemId4` int(11) unsigned NOT NULL default '0',
  `RewChoiceItemId5` int(11) unsigned NOT NULL default '0',
  `RewChoiceItemId6` int(11) unsigned NOT NULL default '0',
  `RewChoiceItemCount1` int(11) unsigned NOT NULL default '0',
  `RewChoiceItemCount2` int(11) unsigned NOT NULL default '0',
  `RewChoiceItemCount3` int(11) unsigned NOT NULL default '0',
  `RewChoiceItemCount4` int(11) unsigned NOT NULL default '0',
  `RewChoiceItemCount5` int(11) unsigned NOT NULL default '0',
  `RewChoiceItemCount6` int(11) unsigned NOT NULL default '0',
  `RewItemId1` int(11) unsigned NOT NULL default '0',
  `RewItemId2` int(11) unsigned NOT NULL default '0',
  `RewItemId3` int(11) unsigned NOT NULL default '0',
  `RewItemId4` int(11) unsigned NOT NULL default '0',
  `RewItemCount1` int(11) unsigned NOT NULL default '0',
  `RewItemCount2` int(11) unsigned NOT NULL default '0',
  `RewItemCount3` int(11) unsigned NOT NULL default '0',
  `RewItemCount4` int(11) unsigned NOT NULL default '0',
  `RewRepFaction1` int(11) unsigned NOT NULL default '0' COMMENT 'faction id from Faction.dbc in this case',
  `RewRepFaction2` int(11) unsigned NOT NULL default '0' COMMENT 'faction id from Faction.dbc in this case',
  `RewRepFaction3` int(11) unsigned NOT NULL default '0' COMMENT 'faction id from Faction.dbc in this case',
  `RewRepFaction4` int(11) unsigned NOT NULL default '0' COMMENT 'faction id from Faction.dbc in this case',
  `RewRepFaction5` int(11) unsigned NOT NULL default '0' COMMENT 'faction id from Faction.dbc in this case',
  `RewRepValue1` int(11) NOT NULL default '0',
  `RewRepValue2` int(11) NOT NULL default '0',
  `RewRepValue3` int(11) NOT NULL default '0',
  `RewRepValue4` int(11) NOT NULL default '0',
  `RewRepValue5` int(11) NOT NULL default '0',
  `RewOrReqMoney` int(11) NOT NULL default '0',
  `RewXP` int(11) unsigned NOT NULL default '0',
  `RewSpell` int(11) unsigned NOT NULL default '0',
  `PointMapId` int(11) unsigned NOT NULL default '0',
  `PointX` float NOT NULL default '0',
  `PointY` float NOT NULL default '0',
  `PointOpt` int(2) unsigned NOT NULL default '0',
  `OfferRewardEmote` int(11) unsigned NOT NULL default '0',
  `RequestItemsEmote` int(11) unsigned NOT NULL default '1',
  `CompleteScript` int(11) unsigned NOT NULL default '0',
  `Repeatable` tinyint(1) unsigned NOT NULL default '0',
  PRIMARY KEY  (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Quest System';

--
-- Dumping data for table `quest_template`
--


/*!40000 ALTER TABLE `quest_template` DISABLE KEYS */;
LOCK TABLES `quest_template` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `quest_template` ENABLE KEYS */;

--
-- Table structure for table `scripts`
--

DROP TABLE IF EXISTS `scripts`;
CREATE TABLE `scripts` (
  `id` int(11) unsigned NOT NULL default '0',
  `delay` int(11) unsigned NOT NULL default '0',
  `command` int(11) unsigned NOT NULL default '0',
  `datalong` int(11) unsigned NOT NULL default '0',
  `datalong2` int(11) unsigned NOT NULL default '0',
  `datatext` text NOT NULL,
  `x` float NOT NULL default '0',
  `y` float NOT NULL default '0',
  `z` float NOT NULL default '0',
  `o` float NOT NULL default '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `scripts`
--


/*!40000 ALTER TABLE `scripts` DISABLE KEYS */;
LOCK TABLES `scripts` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `scripts` ENABLE KEYS */;

--
-- Table structure for table `skinning_loot_template`
--

DROP TABLE IF EXISTS `skinning_loot_template`;
CREATE TABLE `skinning_loot_template` (
  `entry` int(11) unsigned NOT NULL default '0',
  `item` int(11) unsigned NOT NULL default '0',
  `ChanceOrRef` float NOT NULL default '100',
  `QuestChanceOrGroup` tinyint(3) NOT NULL default '0',
  `mincount` tinyint(3) unsigned NOT NULL default '1',
  `maxcount` tinyint(3) unsigned NOT NULL default '1',
  `quest_freeforall` tinyint(3) unsigned NOT NULL default '1',
  PRIMARY KEY  (`entry`,`item`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Loot System';

--
-- Dumping data for table `skinning_loot_template`
--


/*!40000 ALTER TABLE `skinning_loot_template` DISABLE KEYS */;
LOCK TABLES `skinning_loot_template` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `skinning_loot_template` ENABLE KEYS */;

--
-- Table structure for table `spell_chain`
--

DROP TABLE IF EXISTS `spell_chain`;
CREATE TABLE `spell_chain` (
  `spell_id` int(5) NOT NULL default '0',
  `prev_spell` int(5) NOT NULL default '0',
  `first_spell` int(5) NOT NULL default '0',
  `rank` tinyint(4) NOT NULL default '0',
  PRIMARY KEY  (`spell_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Spell Additinal Data';

--
-- Dumping data for table `spell_chain`
--


/*!40000 ALTER TABLE `spell_chain` DISABLE KEYS */;
LOCK TABLES `spell_chain` WRITE;
INSERT INTO `spell_chain` VALUES (8613,0,8613,1),(8617,8613,8613,2),(8618,8617,8613,3),(10768,8618,8613,4),(4036,0,4036,1),(4037,4036,4036,2),(4038,4037,4036,3),(12656,4038,4036,4),(2259,0,2259,1),(3101,2259,2259,2),(3464,3101,2259,3),(11611,3464,2259,4),(7411,0,7411,1),(7412,7411,7411,2),(7413,7412,7411,3),(13920,7413,7411,4),(3908,0,3908,1),(3909,3908,3908,2),(3910,3909,3908,3),(12180,3910,3908,4),(2108,0,2108,1),(3104,2108,2108,2),(3811,3104,2108,3),(10662,3811,2108,4),(10660,10662,2108,5),(10658,10662,2108,5),(10656,10662,2108,5),(7620,0,7620,1),(7731,7620,7620,2),(7732,7731,7620,3),(18248,7732,7620,4),(2575,0,2575,1),(2576,2575,2575,2),(3564,2576,2575,3),(10248,3564,2575,4),(3273,0,3273,1),(3274,3273,3273,2),(7924,3274,3273,3),(10846,7924,3273,4),(2018,0,2018,1),(3100,2018,2018,2),(3538,3100,2018,3),(9785,3538,2018,4),(9787,9785,2018,5),(9788,9785,2018,5),(1804,0,1804,1),(6461,1804,1804,2),(6463,6461,1804,3),(2550,0,2550,1),(3102,2550,2550,2),(3413,3102,2550,3),(18260,3413,2550,4),(2366,0,2366,1),(2368,2366,2366,2),(3570,2368,2366,3),(11993,3570,2366,4),(33388,0,33388,1),(33391,33388,33388,2),(10,0,10,1),(17,0,17,1),(53,0,53,1),(72,0,72,1),(78,0,78,1),(99,0,99,1),(100,0,100,1),(116,0,116,1),(118,0,118,1),(120,0,120,1),(122,0,122,1),(133,0,133,1),(136,0,136,1),(139,0,139,1),(143,133,133,2),(145,143,133,3),(168,0,168,1),(172,0,172,1),(205,116,116,2),(284,78,78,2),(285,284,78,3),(324,0,324,1),(325,324,324,2),(331,0,331,1),(332,331,331,2),(339,0,339,1),(348,0,348,1),(370,0,370,1),(403,0,403,1),(408,0,408,1),(421,0,421,1),(453,0,453,1),(465,0,465,1),(467,0,467,1),(469,0,469,1),(498,0,498,1),(527,0,527,1),(529,403,403,2),(543,0,543,1),(547,332,331,3),(548,529,403,3),(585,0,585,1),(586,0,586,1),(587,0,587,1),(588,0,588,1),(589,0,589,1),(591,585,585,2),(592,17,17,2),(594,589,589,2),(596,0,596,1),(597,587,587,2),(598,591,585,3),(600,592,17,3),(602,7128,588,3),(603,0,603,1),(604,0,604,1),(605,0,605,1),(633,0,633,1),(635,0,635,1),(639,635,635,2),(642,0,642,1),(643,10290,465,3),(647,639,635,3),(686,0,686,1),(687,0,687,1),(688,0,688,1),(689,0,689,1),(693,0,693,1),(694,0,694,1),(695,686,686,2),(696,687,687,2),(699,689,689,2),(702,0,702,1),(703,0,703,1),(704,0,704,1),(705,695,686,3),(706,0,706,1),(707,348,348,2),(709,699,689,3),(710,0,710,1),(724,0,724,1),(740,0,740,1),(755,0,755,1),(769,780,779,3),(770,0,770,1),(772,0,772,1),(774,0,774,1),(778,770,770,2),(779,0,779,1),(780,779,779,2),(781,0,781,1),(782,467,467,2),(837,205,116,3),(845,0,845,1),(853,0,853,1),(865,122,122,2),(879,0,879,1),(905,325,324,3),(913,547,331,4),(915,548,403,4),(930,421,421,2),(939,913,331,5),(943,915,403,5),(945,905,324,4),(959,939,331,6),(970,594,589,3),(974,0,974,1),(976,0,976,1),(980,0,980,1),(984,598,585,4),(988,527,527,2),(990,597,587,3),(992,970,589,4),(996,596,596,2),(1004,984,585,5),(1006,602,588,4),(1008,0,1008,1),(1014,980,980,2),(1020,642,642,2),(1022,0,1022,1),(1026,647,635,4),(1032,10291,465,5),(1042,1026,635,5),(1058,774,774,2),(1062,339,339,2),(1064,0,1064,1),(1075,782,467,3),(1079,0,1079,1),(1082,0,1082,1),(1086,706,706,2),(1088,705,686,4),(1094,707,348,3),(1098,0,1098,1),(1106,1088,686,5),(1108,702,702,2),(1120,0,1120,1),(1126,0,1126,1),(1130,0,1130,1),(1160,0,1160,1),(1243,0,1243,1),(1244,1243,1243,2),(1245,1244,1243,3),(1329,0,1329,1),(1430,1058,774,3),(1449,0,1449,1),(1454,0,1454,1),(1455,1454,1454,2),(1456,1455,1454,3),(1459,0,1459,1),(1460,1459,1459,2),(1461,1460,1459,3),(1463,0,1463,1),(1464,0,1464,1),(1490,0,1490,1),(1495,0,1495,1),(1499,0,1499,1),(1510,0,1510,1),(1513,0,1513,1),(1535,0,1535,1),(1608,285,78,4),(1671,72,72,2),(1672,1671,72,3),(1714,0,1714,1),(1715,0,1715,1),(1735,99,99,2),(1752,0,1752,1),(1757,1752,1752,2),(1758,1757,1752,3),(1759,1758,1752,4),(1760,1759,1752,5),(1766,0,1766,1),(1767,1766,1766,2),(1768,1767,1766,3),(1769,1768,1766,4),(1776,0,1776,1),(1777,1776,1776,2),(1784,0,1784,1),(1785,1784,1784,2),(1786,1785,1784,3),(1787,1786,1784,4),(1822,0,1822,1),(1823,1822,1822,2),(1824,1823,1822,3),(1850,0,1850,1),(1856,0,1856,1),(1857,1856,1856,2),(1943,0,1943,1),(1949,0,1949,1),(1966,0,1966,1),(1978,0,1978,1),(2006,0,2006,1),(2008,0,2008,1),(2010,2006,2006,2),(2048,25289,6673,8),(2050,0,2050,1),(2052,2050,2050,2),(2053,2052,2050,3),(2054,0,2054,1),(2055,2054,2054,2),(2060,0,2060,1),(2061,0,2061,1),(2062,0,2062,1),(2070,6770,6770,2),(2090,1430,774,4),(2091,2090,774,5),(2096,0,2096,1),(2098,0,2098,1),(2120,0,2120,1),(2121,2120,2120,2),(2136,0,2136,1),(2137,2136,2136,2),(2138,2137,2136,3),(2362,0,2362,1),(2589,53,53,2),(2590,2589,53,3),(2591,2590,53,4),(2637,0,2637,1),(2643,0,2643,1),(2651,0,2651,1),(2652,0,2652,1),(2767,992,589,5),(2791,1245,1243,4),(2800,633,633,2),(2812,0,2812,1),(2825,0,2825,1),(2835,0,2835,1),(2837,2835,2835,2),(2860,930,421,3),(2878,0,2878,1),(2894,0,2894,1),(2908,0,2908,1),(2912,0,2912,1),(2941,1094,348,4),(2944,0,2944,1),(2948,0,2948,1),(2973,0,2973,1),(2974,0,2974,1),(2983,0,2983,1),(3029,1082,1082,2),(3034,0,3034,1),(3044,0,3044,1),(3111,136,136,2),(3140,145,133,4),(3420,0,3420,1),(3421,3420,3420,2),(3472,1042,635,6),(3599,0,3599,1),(3627,2091,774,6),(3661,3111,136,3),(3662,3661,136,4),(3698,755,755,2),(3699,3698,755,3),(3700,3699,755,4),(3738,0,3738,1),(3747,600,17,4),(5138,0,5138,1),(5143,0,5143,1),(5144,5143,5143,2),(5145,5144,5143,3),(5159,1062,339,3),(5171,0,5171,1),(5176,0,5176,1),(5177,5176,5176,2),(5178,5177,5176,3),(5179,5178,5176,4),(5180,5179,5176,5),(5185,0,5185,1),(5186,5185,5185,2),(5187,5186,5185,3),(5188,5187,5185,4),(5189,5188,5185,5),(5196,5159,339,4),(5201,3029,1082,3),(5211,0,5211,1),(5215,0,5215,1),(5217,0,5217,1),(5221,0,5221,1),(5232,1126,1126,2),(5234,6756,1126,4),(5242,6673,6673,2),(5277,0,5277,1),(5308,0,5308,1),(5394,0,5394,1),(5484,0,5484,1),(5504,0,5504,1),(5505,5504,5504,2),(5506,5505,5504,3),(5570,0,5570,1),(5573,498,498,2),(5588,853,853,2),(5589,5588,853,3),(5599,1022,1022,2),(5614,879,879,2),(5615,5614,879,3),(5627,2878,2878,2),(5675,0,5675,1),(5676,0,5676,1),(5699,6202,6201,3),(5730,0,5730,1),(5740,0,5740,1),(5763,0,5763,1),(5782,0,5782,1),(5938,0,5938,1),(6041,943,403,6),(6060,1004,585,6),(6063,2055,2054,3),(6064,6063,2054,4),(6065,3747,17,5),(6066,6065,17,6),(6074,139,139,2),(6075,6074,139,3),(6076,6075,139,4),(6077,6076,139,5),(6078,6077,139,6),(6117,0,6117,1),(6127,5506,5504,4),(6129,990,587,4),(6131,865,122,3),(6141,10,10,2),(6143,0,6143,1),(6178,100,100,2),(6190,1160,1160,2),(6192,5242,6673,3),(6201,0,6201,1),(6202,6201,6201,2),(6205,1108,702,3),(6213,5782,5782,2),(6215,6213,5782,3),(6217,1014,980,3),(6219,5740,5740,2),(6222,172,172,2),(6223,6222,172,3),(6226,5138,5138,2),(6229,0,6229,1),(6343,0,6343,1),(6353,0,6353,1),(6363,3599,3599,2),(6364,6363,3599,3),(6365,6364,3599,4),(6366,0,6366,1),(6375,5394,5394,2),(6377,6375,5394,3),(6390,5730,5730,2),(6391,6390,5730,3),(6392,6391,5730,4),(6542,0,6542,1),(6546,772,772,2),(6547,6546,772,3),(6548,6547,772,4),(6552,0,6552,1),(6554,6552,6552,2),(6572,0,6572,1),(6574,6572,6572,2),(6673,0,6673,1),(6756,5232,1126,3),(6760,2098,2098,2),(6761,6760,2098,3),(6762,6761,2098,4),(6768,1966,1966,2),(6770,0,6770,1),(6774,5171,5171,2),(6778,5189,5185,6),(6780,5180,5176,6),(6783,5215,5215,2),(6785,0,6785,1),(6787,6785,6785,2),(6789,0,6789,1),(6793,5217,5217,2),(6798,5211,5211,2),(6800,5221,5221,2),(6807,0,6807,1),(6808,6807,6807,2),(6809,6808,6807,3),(6940,0,6940,1),(7128,588,588,2),(7294,0,7294,1),(7300,168,168,2),(7301,7300,168,3),(7302,0,7302,1),(7320,7302,7302,2),(7322,837,116,4),(7328,0,7328,1),(7369,845,845,2),(7372,1715,1715,2),(7373,7372,1715,3),(7379,6574,6572,3),(7384,0,7384,1),(7386,0,7386,1),(7400,694,694,2),(7402,7400,694,3),(7405,7386,7386,2),(7641,1106,686,6),(7646,6205,702,4),(7648,6223,172,4),(7651,709,689,4),(7658,704,704,2),(7659,7658,704,3),(7887,7384,7384,2),(8004,0,8004,1),(8005,959,331,7),(8008,8004,8004,2),(8010,8008,8004,3),(8012,370,370,2),(8017,0,8017,1),(8018,8017,8017,2),(8019,8018,8017,3),(8024,0,8024,1),(8027,8024,8024,2),(8030,8027,8024,3),(8033,0,8033,1),(8038,8033,8033,2),(8042,0,8042,1),(8044,8042,8042,2),(8045,8044,8042,3),(8046,8045,8042,4),(8050,0,8050,1),(8052,8050,8050,2),(8053,8052,8050,3),(8056,0,8056,1),(8058,8056,8056,2),(8071,0,8071,1),(8075,0,8075,1),(8092,0,8092,1),(8102,8092,8092,2),(8103,8102,8092,3),(8104,8103,8092,4),(8105,8104,8092,5),(8106,8105,8092,6),(8122,0,8122,1),(8124,8122,8122,2),(8129,0,8129,1),(8131,8129,8129,2),(8134,945,324,5),(8154,8071,8071,2),(8155,8154,8071,3),(8160,8075,8075,2),(8161,8160,8075,3),(8181,0,8181,1),(8184,0,8184,1),(8190,0,8190,1),(8192,453,453,2),(8198,6343,6343,2),(8204,8198,6343,3),(8205,8204,6343,4),(8227,0,8227,1),(8232,0,8232,1),(8235,8232,8232,2),(8249,8227,8227,2),(8288,1120,1120,2),(8289,8288,1120,3),(8380,7405,7386,3),(8400,3140,133,5),(8401,8400,133,6),(8402,8401,133,7),(8406,7322,116,5),(8407,8406,116,6),(8408,8407,116,7),(8412,2138,2136,4),(8413,8412,2136,5),(8416,5145,5143,4),(8417,8416,5143,5),(8422,2121,2120,3),(8423,8422,2120,4),(8427,6141,10,3),(8437,1449,1449,2),(8438,8437,1449,3),(8439,8438,1449,4),(8444,2948,2948,2),(8445,8444,2948,3),(8446,8445,2948,4),(8450,604,604,2),(8451,8450,604,3),(8455,1008,1008,2),(8457,543,543,2),(8458,8457,543,3),(8461,6143,6143,2),(8462,8461,6143,3),(8492,120,120,2),(8494,1463,1463,2),(8495,8494,1463,3),(8498,1535,1535,2),(8499,8498,1535,3),(8512,0,8512,1),(8621,1760,1752,6),(8623,6762,2098,5),(8624,8623,2098,6),(8629,1777,1776,3),(8631,703,703,2),(8632,8631,703,3),(8633,8632,703,4),(8637,6768,1966,3),(8639,1943,1943,2),(8640,8639,1943,3),(8643,408,408,2),(8647,0,8647,1),(8649,8647,8647,2),(8650,8649,8647,3),(8676,0,8676,1),(8681,0,8681,1),(8687,8681,8681,2),(8691,8687,8681,3),(8694,5763,5763,2),(8696,2983,2983,2),(8721,2591,53,5),(8724,8676,8676,2),(8725,8724,8676,3),(8820,1464,1464,2),(8835,0,8835,1),(8903,6778,5185,7),(8905,6780,5176,7),(8907,5234,1126,5),(8910,3627,774,7),(8914,1075,467,4),(8918,740,740,2),(8921,0,8921,1),(8924,8921,8921,2),(8925,8924,8921,3),(8926,8925,8921,4),(8927,8926,8921,5),(8928,8927,8921,6),(8929,8928,8921,7),(8936,0,8936,1),(8938,8936,8936,2),(8939,8938,8936,3),(8940,8939,8936,4),(8941,8940,8936,5),(8949,2912,2912,2),(8950,8949,2912,3),(8951,8950,2912,4),(8955,2908,2908,2),(8972,6809,6807,4),(8983,6798,5211,3),(8992,6800,5221,3),(8998,0,8998,1),(9000,8998,8998,2),(9005,0,9005,1),(9035,0,9035,1),(9472,2061,2061,2),(9473,9472,2061,3),(9474,9473,2061,4),(9484,0,9484,1),(9485,9484,9484,2),(9490,1735,99,3),(9492,1079,1079,2),(9493,9492,1079,3),(9578,586,586,2),(9579,9578,586,3),(9592,9579,586,4),(9745,8972,6807,5),(9747,9490,99,4),(9749,778,770,3),(9750,8941,8936,6),(9752,9493,1079,4),(9754,769,779,4),(9756,8914,467,5),(9758,8903,5185,8),(9821,1850,1850,2),(9823,9005,9005,2),(9827,9823,9005,3),(9829,8992,5221,4),(9830,9829,5221,5),(9833,8929,8921,8),(9834,9833,8921,9),(9835,9834,8921,10),(9839,8910,774,8),(9840,9839,774,9),(9841,9840,774,10),(9845,6793,5217,3),(9846,9845,5217,4),(9849,5201,1082,4),(9850,9849,1082,5),(9852,5196,339,5),(9853,9852,339,6),(9856,9750,8936,7),(9857,9856,8936,8),(9858,9857,8936,9),(9862,8918,740,3),(9863,9862,740,4),(9866,6787,6785,3),(9867,9866,6785,4),(9875,8951,2912,5),(9876,9875,2912,6),(9880,9745,6807,6),(9881,9880,6807,7),(9884,8907,1126,6),(9885,9884,1126,7),(9888,9758,5185,9),(9889,9888,5185,10),(9892,9000,8998,3),(9894,9752,1079,5),(9896,9894,1079,6),(9898,9747,99,5),(9901,8955,2908,3),(9904,1824,1822,4),(9907,9749,770,4),(9908,9754,779,5),(9910,9756,467,6),(9912,8905,5176,8),(9913,6783,5215,3),(10138,6127,5504,5),(10139,10138,5504,6),(10140,10139,5504,7),(10144,6129,587,5),(10145,10144,587,6),(10148,8402,133,8),(10149,10148,133,9),(10150,10149,133,10),(10151,10150,133,11),(10156,1461,1459,4),(10157,10156,1459,5),(10159,8492,120,3),(10160,10159,120,4),(10161,10160,120,5),(10169,8455,1008,3),(10170,10169,1008,4),(10173,8451,604,4),(10174,10173,604,5),(10177,8462,6143,4),(10179,8408,116,8),(10180,10179,116,9),(10181,10180,116,10),(10185,8427,10,4),(10186,10185,10,5),(10187,10186,10,6),(10191,8495,1463,4),(10192,10191,1463,5),(10193,10192,1463,6),(10197,8413,2136,6),(10199,10197,2136,7),(10201,8439,1449,5),(10202,10201,1449,6),(10205,8446,2948,5),(10206,10205,2948,6),(10207,10206,2948,7),(10211,8417,5143,6),(10212,10211,5143,7),(10215,8423,2120,5),(10216,10215,2120,6),(10219,7320,7302,3),(10220,10219,7302,4),(10223,8458,543,4),(10225,10223,543,5),(10230,6131,122,4),(10278,5599,1022,3),(10290,465,465,2),(10291,643,465,4),(10292,1032,465,6),(10293,10292,465,7),(10298,7294,7294,2),(10299,10298,7294,3),(10300,10299,7294,4),(10301,10300,7294,5),(10308,5589,853,4),(10310,2800,633,3),(10312,5615,879,4),(10313,10312,879,5),(10314,10313,879,6),(10318,2812,2812,2),(10322,7328,7328,2),(10324,10322,7328,3),(10326,5627,2878,3),(10328,3472,635,7),(10329,10328,635,8),(10391,6041,403,7),(10392,10391,403,8),(10395,8005,331,8),(10396,10395,331,9),(10399,8019,8017,4),(10406,8155,8071,4),(10407,10406,8071,5),(10408,10407,8071,6),(10412,8046,8042,5),(10413,10412,8042,6),(10414,10413,8042,7),(10427,6392,5730,5),(10428,10427,5730,6),(10431,8134,324,6),(10432,10431,324,7),(10437,6365,3599,5),(10438,10437,3599,6),(10442,8161,8075,4),(10447,8053,8050,4),(10448,10447,8050,5),(10456,8038,8033,3),(10462,6377,5394,4),(10463,10462,5394,5),(10466,8010,8004,4),(10467,10466,8004,5),(10468,10467,8004,6),(10472,8058,8056,3),(10473,10472,8056,4),(10478,8181,8181,2),(10479,10478,8181,3),(10486,8235,8232,3),(10495,5675,5675,2),(10496,10495,5675,3),(10497,10496,5675,4),(10526,8249,8227,3),(10537,8184,8184,2),(10538,10537,8184,3),(10585,8190,8190,2),(10586,10585,8190,3),(10587,10586,8190,4),(10595,0,10595,1),(10600,10595,10595,2),(10601,10600,10595,3),(10605,2860,421,4),(10613,8512,8512,2),(10614,10613,8512,3),(10622,1064,1064,2),(10623,10622,1064,3),(10627,8835,8835,2),(10797,0,10797,1),(10874,8131,8129,3),(10875,10874,8129,4),(10876,10875,8129,5),(10880,2010,2006,3),(10881,10880,2006,4),(10888,8124,8122,3),(10890,10888,8122,4),(10892,2767,589,6),(10893,10892,589,7),(10894,10893,589,8),(10898,6066,17,7),(10899,10898,17,8),(10900,10899,17,9),(10901,10900,17,10),(10909,2096,2096,2),(10911,605,605,2),(10912,10911,605,3),(10915,9474,2061,5),(10916,10915,2061,6),(10917,10916,2061,7),(10927,6078,139,7),(10928,10927,139,8),(10929,10928,139,9),(10933,6060,585,7),(10934,10933,585,8),(10937,2791,1243,5),(10938,10937,1243,6),(10941,9592,586,5),(10942,10941,586,6),(10945,8106,8092,7),(10946,10945,8092,8),(10947,10946,8092,9),(10951,1006,588,5),(10952,10951,588,6),(10953,8192,453,3),(10955,9485,9484,3),(10957,976,976,2),(10958,10957,976,3),(10960,996,596,3),(10961,10960,596,4),(10963,2060,2060,2),(10964,10963,2060,3),(10965,10964,2060,4),(11113,0,11113,1),(11197,8650,8647,4),(11198,11197,8647,5),(11267,8725,8676,4),(11268,11267,8676,5),(11269,11268,8676,6),(11273,8640,1943,4),(11274,11273,1943,5),(11275,11274,1943,6),(11279,8721,53,6),(11280,11279,53,7),(11281,11280,53,8),(11285,8629,1776,4),(11286,11285,1776,5),(11289,8633,703,5),(11290,11289,703,6),(11293,8621,1752,7),(11294,11293,1752,8),(11297,2070,6770,3),(11299,8624,2098,7),(11300,11299,2098,8),(11303,8637,1966,4),(11305,8696,2983,3),(11314,8499,1535,4),(11315,11314,1535,5),(11341,8691,8681,4),(11342,11341,8681,5),(11343,11342,8681,6),(11357,2837,2835,3),(11358,11357,2835,4),(11366,0,11366,1),(11400,8694,5763,3),(11426,0,11426,1),(11549,6192,6673,4),(11550,11549,6673,5),(11551,11550,6673,6),(11554,6190,1160,3),(11555,11554,1160,4),(11556,11555,1160,5),(11564,1608,78,5),(11565,11564,78,6),(11566,11565,78,7),(11567,11566,78,8),(11572,6548,772,5),(11573,11572,772,6),(11574,11573,772,7),(11578,6178,100,3),(11580,8205,6343,5),(11581,11580,6343,6),(11584,7887,7384,3),(11585,11584,7384,4),(11596,8380,7386,4),(11597,11596,7386,5),(11600,7379,6572,4),(11601,11600,6572,5),(11604,8820,1464,3),(11605,11604,1464,4),(11608,7369,845,3),(11609,11608,845,4),(11659,7641,686,7),(11660,11659,686,8),(11661,11660,686,9),(11665,2941,348,5),(11667,11665,348,6),(11668,11667,348,7),(11671,7648,172,5),(11672,11671,172,6),(11675,8289,1120,4),(11677,6219,5740,3),(11678,11677,5740,4),(11683,1949,1949,2),(11684,11683,1949,3),(11687,1456,1454,4),(11688,11687,1454,5),(11689,11688,1454,6),(11693,3700,755,5),(11694,11693,755,6),(11695,11694,755,7),(11699,7651,689,5),(11700,11699,689,6),(11703,6226,5138,3),(11704,11703,5138,4),(11707,7646,702,5),(11708,11707,702,6),(11711,6217,980,4),(11712,11711,980,5),(11713,11712,980,6),(11717,7659,704,4),(11719,1714,1714,2),(11721,1490,1490,2),(11722,11721,1490,3),(11725,1098,1098,2),(11726,11725,1098,3),(11729,5699,6201,4),(11730,11729,6201,5),(11733,1086,706,3),(11734,11733,706,4),(11735,11734,706,5),(11739,6229,6229,2),(11740,11739,6229,3),(12294,0,12294,1),(12505,11366,11366,2),(12522,12505,11366,3),(12523,12522,11366,4),(12524,12523,11366,5),(12525,12524,11366,6),(12526,12525,11366,7),(12824,118,118,2),(12825,12824,118,3),(12826,12825,118,4),(13018,11113,11113,2),(13019,13018,11113,3),(13020,13019,11113,4),(13021,13020,11113,5),(13031,11426,11426,2),(13032,13031,11426,3),(13033,13032,11426,4),(13165,0,13165,1),(13220,0,13220,1),(13228,13220,13220,2),(13229,13228,13220,3),(13230,13229,13220,4),(13542,3662,136,5),(13543,13542,136,6),(13544,13543,136,7),(13549,1978,1978,2),(13550,13549,1978,3),(13551,13550,1978,4),(13552,13551,1978,5),(13553,13552,1978,6),(13554,13553,1978,7),(13555,13554,1978,8),(13795,0,13795,1),(13813,0,13813,1),(13896,0,13896,1),(13908,0,13908,1),(14260,2973,2973,2),(14261,14260,2973,3),(14262,14261,2973,4),(14263,14262,2973,5),(14264,14263,2973,6),(14265,14264,2973,7),(14266,14265,2973,8),(14267,2974,2974,2),(14268,14267,2974,3),(14269,1495,1495,2),(14270,14269,1495,3),(14271,14270,1495,4),(14272,781,781,2),(14273,14272,781,3),(14274,20736,20736,2),(14279,3034,3034,2),(14280,14279,3034,3),(14281,3044,3044,2),(14282,14281,3044,3),(14283,14282,3044,4),(14284,14283,3044,5),(14285,14284,3044,6),(14286,14285,3044,7),(14287,14286,3044,8),(14288,2643,2643,2),(14289,14288,2643,3),(14290,14289,2643,4),(14294,1510,1510,2),(14295,14294,1510,3),(14302,13795,13795,2),(14303,14302,13795,3),(14304,14303,13795,4),(14305,14304,13795,5),(14310,1499,1499,2),(14311,14310,1499,3),(14316,13813,13813,2),(14317,14316,13813,3),(14318,13165,13165,2),(14319,14318,13165,3),(14320,14319,13165,4),(14321,14320,13165,5),(14322,14321,13165,6),(14323,1130,1130,2),(14324,14323,1130,3),(14325,14324,1130,4),(14326,1513,1513,2),(14327,14326,1513,3),(14752,0,14752,1),(14818,14752,14752,2),(14819,14818,14752,3),(14914,0,14914,1),(15107,0,15107,1),(15111,15107,15107,2),(15112,15111,15107,3),(15207,10392,403,9),(15208,15207,403,10),(15237,0,15237,1),(15261,15267,14914,8),(15262,14914,14914,2),(15263,15262,14914,3),(15264,15263,14914,4),(15265,15264,14914,5),(15266,15265,14914,6),(15267,15266,14914,7),(15407,0,15407,1),(15430,15237,15237,2),(15431,15430,15237,3),(15629,14274,20736,3),(15630,15629,20736,4),(15631,15630,20736,5),(15632,15631,20736,6),(16314,10399,8017,5),(16315,16314,8017,6),(16316,16315,8017,7),(16339,8030,8024,4),(16341,16339,8024,5),(16342,16341,8024,6),(16355,10456,8033,4),(16356,16355,8033,5),(16362,10486,8232,4),(16387,10526,8227,4),(16511,0,16511,1),(16689,0,16689,1),(16810,16689,16689,2),(16811,16810,16689,3),(16812,16811,16689,4),(16813,16812,16689,5),(16857,0,16857,1),(16914,0,16914,1),(17311,15407,15407,2),(17312,17311,15407,3),(17313,17312,15407,4),(17314,17313,15407,5),(17329,16813,16689,6),(17347,16511,16511,2),(17348,17347,16511,3),(17390,16857,16857,2),(17391,17390,16857,3),(17392,17391,16857,4),(17401,16914,16914,2),(17402,17401,16914,3),(17727,2362,2362,2),(17728,17727,2362,3),(17862,0,17862,1),(17877,0,17877,1),(17919,5676,5676,2),(17920,17919,5676,3),(17921,17920,5676,4),(17922,17921,5676,5),(17923,17922,5676,6),(17924,6353,6353,2),(17925,6789,6789,2),(17926,17925,6789,3),(17928,5484,5484,2),(17937,17862,17862,2),(17951,6366,6366,2),(17952,17951,6366,3),(17953,17952,6366,4),(17962,0,17962,1),(18137,0,18137,1),(18220,0,18220,1),(18265,0,18265,1),(18647,710,710,2),(18657,2637,2637,2),(18658,18657,2637,3),(18807,17314,15407,6),(18809,12526,11366,8),(18867,17877,17877,2),(18868,18867,17877,3),(18869,18868,17877,4),(18870,18869,17877,5),(18871,18870,17877,6),(18879,18265,18265,2),(18880,18879,18265,3),(18881,18880,18265,4),(18930,17962,17962,2),(18931,18930,17962,3),(18932,18931,17962,4),(18937,18220,18220,2),(18938,18937,18220,3),(19236,13908,13908,2),(19238,19236,13908,3),(19240,19238,13908,4),(19241,19240,13908,5),(19242,19241,13908,6),(19243,19242,13908,7),(19261,2652,2652,2),(19262,19261,2652,3),(19264,19262,2652,4),(19265,19264,2652,5),(19266,19265,2652,6),(19271,13896,13896,2),(19273,19271,13896,3),(19274,19273,13896,4),(19275,19274,13896,5),(19276,2944,2944,2),(19277,19276,2944,3),(19278,19277,2944,4),(19279,19278,2944,5),(19280,19279,2944,6),(19281,9035,9035,2),(19282,19281,9035,3),(19283,19282,9035,4),(19284,19283,9035,5),(19285,19284,9035,6),(19289,2651,2651,2),(19291,19289,2651,3),(19292,19291,2651,4),(19293,19292,2651,5),(19296,10797,10797,2),(19299,19296,10797,3),(19302,19299,10797,4),(19303,19302,10797,5),(19304,19303,10797,6),(19305,19304,10797,7),(19306,0,19306,1),(19308,18137,18137,2),(19309,19308,18137,3),(19310,19309,18137,4),(19311,19310,18137,5),(19312,19311,18137,6),(19386,0,19386,1),(19434,0,19434,1),(19506,0,19506,1),(19740,0,19740,1),(19742,0,19742,1),(19750,0,19750,1),(19834,19740,19740,2),(19835,19834,19740,3),(19836,19835,19740,4),(19837,19836,19740,5),(19838,19837,19740,6),(19850,19742,19742,2),(19852,19850,19742,3),(19853,19852,19742,4),(19854,19853,19742,5),(19876,0,19876,1),(19888,0,19888,1),(19891,0,19891,1),(19895,19876,19876,2),(19896,19895,19876,3),(19897,19888,19888,2),(19898,19897,19888,3),(19899,19891,19891,2),(19900,19899,19891,3),(19939,19750,19750,2),(19940,19939,19750,3),(19941,19940,19750,4),(19942,19941,19750,5),(19943,19942,19750,6),(19977,0,19977,1),(19978,19977,19977,2),(19979,19978,19977,3),(20043,0,20043,1),(20116,26573,26573,2),(20162,21082,21082,2),(20164,0,20164,1),(20165,0,20165,1),(20166,0,20166,1),(20190,20043,20043,2),(20243,0,20243,1),(20252,0,20252,1),(20287,21084,21084,2),(20288,20287,21084,3),(20289,20288,21084,4),(20290,20289,21084,5),(20291,20290,21084,6),(20292,20291,21084,7),(20293,20292,21084,8),(20305,20162,21082,3),(20306,20305,21082,4),(20307,20306,21082,5),(20308,20307,21082,6),(20347,20165,20165,2),(20348,20347,20165,3),(20349,20348,20165,4),(20356,20166,20166,2),(20357,20356,20166,3),(20375,0,20375,1),(20473,0,20473,1),(20484,0,20484,1),(20559,7402,694,4),(20560,20559,694,5),(20569,11609,845,5),(20609,2008,2008,2),(20610,20609,2008,3),(20616,20252,20252,2),(20617,20616,20252,3),(20658,5308,5308,2),(20660,20658,5308,3),(20661,20660,5308,4),(20662,20661,5308,5),(20729,6940,6940,2),(20736,0,20736,1),(20739,20484,20484,2),(20742,20739,20484,3),(20747,20742,20484,4),(20748,20747,20484,5),(20752,693,693,2),(20755,20752,693,3),(20756,20755,693,4),(20757,20756,693,5),(20770,10881,2006,5),(20772,10324,7328,4),(20773,20772,7328,5),(20776,20610,2008,4),(20777,20776,2008,5),(20900,19434,19434,2),(20901,20900,19434,3),(20902,20901,19434,4),(20903,20902,19434,5),(20904,20903,19434,6),(20905,19506,19506,2),(20906,20905,19506,3),(20909,19306,19306,2),(20910,20909,19306,3),(20911,0,20911,1),(20912,20911,20911,2),(20913,20912,20911,3),(20914,20913,20911,4),(20915,20375,20375,2),(20918,20915,20375,3),(20919,20918,20375,4),(20920,20919,20375,5),(20922,20116,26573,3),(20923,20922,26573,4),(20924,20923,26573,5),(20925,0,20925,1),(20927,20925,20925,2),(20928,20927,20925,3),(20929,20473,20473,2),(20930,20929,20473,3),(21082,0,21082,1),(21084,0,21084,1),(21551,12294,12294,2),(21552,21551,12294,3),(21553,21552,12294,4),(21562,0,21562,1),(21564,21562,21562,2),(21849,0,21849,1),(21850,21849,21849,2),(22568,0,22568,1),(22782,6117,6117,2),(22783,22782,6117,3),(22827,22568,22568,2),(22828,22827,22568,3),(22829,22828,22568,4),(22842,0,22842,1),(22895,22842,22842,2),(22896,22895,22842,3),(23028,0,23028,1),(23881,0,23881,1),(23892,23881,23881,2),(23893,23892,23881,3),(23894,23893,23881,4),(23922,0,23922,1),(23923,23922,23922,2),(23924,23923,23922,3),(23925,23924,23922,4),(24132,19386,19386,2),(24133,24132,19386,3),(24224,0,24224,1),(24239,24274,24275,3),(24248,31018,22568,6),(24274,24275,24275,2),(24275,0,24275,1),(24398,0,24398,1),(24974,5570,5570,2),(24975,24974,5570,3),(24976,24975,5570,4),(24977,24976,5570,5),(25286,11567,78,9),(25288,11601,6572,6),(25289,11551,6673,7),(25290,19854,19742,6),(25291,19838,19740,7),(25292,10329,635,9),(25294,14290,2643,5),(25295,13555,1978,9),(25296,14322,13165,7),(25297,9889,5185,11),(25298,9876,2912,7),(25299,9841,774,11),(25300,11281,53,9),(25302,11303,1966,5),(25304,10181,116,11),(25306,10151,133,12),(25307,11661,686,10),(25309,11668,348,8),(25311,11672,172,7),(25314,10965,2060,5),(25315,10929,139,10),(25316,10961,596,5),(25345,10212,5143,8),(25347,11358,2835,5),(25357,10396,331,10),(25359,10627,8835,3),(25361,10442,8075,5),(25782,0,25782,1),(25890,0,25890,1),(25894,0,25894,1),(25899,0,25899,1),(25916,25782,25782,2),(25918,25894,25894,2),(26573,0,26573,1),(27681,0,27681,1),(27683,0,27683,1),(27799,15431,15237,4),(27800,27799,15237,5),(27801,27800,15237,6),(27841,14819,14752,4),(27870,724,724,2),(27871,27870,724,3),(28609,10177,6143,5),(28610,11740,6229,4),(28612,10145,587,7),(29228,10448,8050,6),(31016,11300,2098,9),(31018,22829,22568,5);
UNLOCK TABLES;
/*!40000 ALTER TABLE `spell_chain` ENABLE KEYS */;

--
-- Table structure for table `spell_learn_skill`
--

DROP TABLE IF EXISTS `spell_learn_skill`;
CREATE TABLE `spell_learn_skill` (
  `entry` smallint(6) unsigned NOT NULL default '0',
  `SkillID` smallint(6) NOT NULL default '0',
  `Value` int(11) default '0',
  `MaxValue` int(11) default '0',
  PRIMARY KEY (`entry`),
  UNIQUE KEY spell_skill(`entry`,`SkillID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Item System';

--
-- Dumping data for table `spell_learn_skill`
--


/*!40000 ALTER TABLE `spell_learn_skill` DISABLE KEYS */;
LOCK TABLES `spell_learn_skill` WRITE;
INSERT INTO `spell_learn_skill` VALUES 
( 9078,415,  1,  1),( 9077,414,  1,  1),( 8737,413,  1,  1),(  750,293,  1,  1),( 9116,433,  1,  1),(  196, 44,  1,  0),(  197,172,  1,  0),(  227,136,  1,  0),(  198, 54,  1,  0),(  199,160,  1,  0),(  201, 43,  1,  0),(  202, 55,  1,  0),( 1180,173,  1,  0),(15590,473,  1,  0),(  200,229,  1,  0),( 3386,229,  1,  0),(  264, 45,  1,  0),( 5011,226,  1,  0),(  266, 46,  1,  0),( 2567,176,  1,  0),( 5009,228,  1,  0),( 2842, 40,  1,  0),(33388,762, 75, 75),(33391,762,150,150),( 1804,633,  1,  0),(  668, 98, -1, -1),(  669,109, -1, -1),(  670,115, -1, -1),(  671,113, -1, -1),(  672,111, -1, -1),(  813,137, -1, -1),(  814,138, -1, -1),(  815,139, -1, -1),(  816,140, -1, -1),(  817,141, -1, -1),( 7340,313, -1, -1),( 7341,315, -1, -1),(17737,673, -1, -1),(  204, 95,  1,  0),(  203,162,  1,  0);
UNLOCK TABLES;
/*!40000 ALTER TABLE `spell_learn_skill` ENABLE KEYS */;

--
-- Table structure for table `spell_learn_spell`
--

DROP TABLE IF EXISTS `spell_learn_spell`;
CREATE TABLE `spell_learn_spell` (
  `entry` smallint(6) unsigned NOT NULL default '0',
  `SpellID` smallint(6) unsigned NOT NULL default '0',
  `IfNoSpell` smallint(6) unsigned NOT NULL default '0',
  PRIMARY KEY (`entry`,`SpellID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Item System';

--
-- Dumping data for table `spell_learn_spell`
--

/*!40000 ALTER TABLE `spell_learn_spell` DISABLE KEYS */;
LOCK TABLES `spell_learn_spell` WRITE;
INSERT INTO `spell_learn_spell` VALUES 
(4036,3918,0),(4036,3919,0),(4036,3920,0),(3908,2387,0),(3908,2963,0),(7411,7418,0),(7411,7421,0),(7411,13262,0),(2259,2329,0),(2259,7183,0),(2259,2330,0),(2018,2663,0),(2018,12260,0),(2018,2660,0),(2018,3115,0),(2108,2152,0),(2108,9058,0),(2108,9059,0),(2108,2149,0),(2108,7126,0),(2108,2881,0),(2550,818,0),(2550,2540,0),(2550,2538,0),(2550,8604,0),(3273,3275,0),(7620,7738,0),(2575,2580,0),(2575,2656,0),(2575,2657,0),(2366,2383,0),(264,2480,75),(266,7918,75),(5011,7919,75),(2567,2764,0),(2842,8681,0);
UNLOCK TABLES;
/*!40000 ALTER TABLE `spell_learn_spell` ENABLE KEYS */;

--
-- Table structure for table `spell_proc_event`
--

DROP TABLE IF EXISTS `spell_proc_event`;
CREATE TABLE `spell_proc_event` (
  `entry` smallint(6) NOT NULL default '0',
  `SchoolMask` tinyint(4) NOT NULL default '0',
  `Category` smallint(6) NOT NULL default '0',
  `SkillID` smallint(6) NOT NULL default '0',
  `SpellFamilyMask` int(11) NOT NULL default '0',
  `procFlags` int(11) NOT NULL default '0',
  `ppmRate` float NOT NULL default '0',
  PRIMARY KEY  (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `spell_proc_event`
--


/*!40000 ALTER TABLE `spell_proc_event` DISABLE KEYS */;
LOCK TABLES `spell_proc_event` WRITE;
INSERT INTO `spell_proc_event` VALUES (6866,4,0,0,0,20564,0),(6870,0,0,0,0,0,0),(7131,0,0,0,0,664232,0),(9452,0,0,0,0,20,3),(9799,0,0,0,0,262144,0),(11119,2,0,0,0,65536,0),(11120,2,0,0,0,65536,0),(11129,2,0,0,0,131072,0),(11180,8,0,0,0,131072,0),(12846,2,0,0,0,65536,0),(12847,2,0,0,0,65536,0),(12848,2,0,0,0,65536,0),(13896,0,0,0,0,1048576,0),(14076,0,0,39,128,131072,0),(14094,0,0,39,128,131072,0),(14095,0,0,39,128,131072,0),(15286,16,0,0,0,131072,0),(18073,2,0,0,96,131072,0),(18096,2,0,0,96,131072,0),(19271,0,0,0,0,1048576,0),(19273,0,0,0,0,1048576,0),(19274,0,0,0,0,1048576,0),(19275,0,0,0,0,1048576,0),(20183,0,0,0,0,0,0),(20204,0,0,0,0,0,0),(20411,0,0,0,0,0,0),(20412,0,0,0,0,0,0),(20413,0,0,0,0,0,0),(20414,0,0,0,0,0,0),(20911,0,0,0,0,64,0),(20912,0,0,0,0,64,0),(20913,0,0,0,0,64,0),(20914,0,0,0,0,64,0),(21063,0,0,0,0,32768,0),(21893,0,0,0,0,2,0),(21978,0,0,0,0,131072,0),(22007,0,0,0,2099233,16384,0),(22697,32,0,0,0,664232,0),(23551,4,0,0,192,16384,0),(23552,0,0,0,0,1049602,0),(23572,4,0,0,192,16384,0),(24596,0,0,0,0,0,0),(25592,0,0,0,0,0,0),(25669,0,0,0,0,1,1),(25715,0,0,0,0,0,0),(25727,0,0,0,0,0,0),(25728,0,0,0,0,0,0),(25729,0,0,0,0,0,0),(25730,0,0,0,0,0,0),(25731,0,0,0,0,0,0),(25732,0,0,0,0,0,0),(25733,0,0,0,0,0,0),(25734,0,0,0,0,0,0),(25745,0,0,0,0,0,0),(25751,0,0,0,0,0,0),(25752,0,0,0,0,2,0),(25757,0,0,0,0,2,0),(25759,0,0,0,0,0,0),(25760,0,0,0,0,0,0),(25761,0,0,0,0,0,0),(25762,0,0,0,0,0,0),(25767,0,0,0,0,131072,0),(25820,0,0,0,0,1049602,0),(25899,0,0,0,0,64,0),(25906,0,0,0,0,131072,0),(25926,0,0,0,0,0,0),(25937,0,0,0,0,0,0),(25942,0,0,0,0,2,0),(25945,0,0,0,0,2,0),(25988,0,0,0,0,4263936,0),(26016,0,0,0,0,1,2),(26021,0,0,0,0,1,2),(26107,0,0,0,4063232,67108864,0),(26119,0,0,0,-1877999613,131072,0),(26128,0,0,0,0,33554432,0),(26135,0,0,0,8388608,16384,0),(26169,0,0,0,0,134217728,0),(26341,0,0,0,0,0,0),(26376,0,0,0,0,0,0),(26463,0,0,0,0,1048576,0),(26467,0,0,0,0,134217728,0),(26480,0,0,0,0,524289,3),(27200,0,0,0,0,0,0),(27419,0,0,0,0,1,3),(27420,0,0,0,0,0,0),(27498,0,0,0,0,1,3),(27521,0,0,0,0,16384,0),(27522,0,0,0,0,524289,0),(27539,0,0,0,0,131072,0),(27561,0,0,0,0,131072,0),(27656,0,0,0,0,1,3),(27688,0,0,0,0,1049602,0),(27774,0,0,0,0,16384,0),(27776,0,0,0,0,2,0),(27778,0,0,0,0,2,0),(27780,0,0,0,0,2,0),(27781,0,0,0,0,2,0),(27785,0,0,0,0,524288,0),(27787,0,0,0,0,1,3),(27811,0,0,0,0,8396800,0),(27815,0,0,0,0,8396800,0),(27816,0,0,0,0,8396800,0),(27852,0,0,0,0,32768,0),(27857,0,0,0,0,0,0),(27861,0,0,0,0,0,0),(27863,0,0,0,0,0,0),(27864,0,0,0,0,0,0),(27865,0,0,0,0,0,0),(27867,0,0,0,0,2,0),(28130,0,0,0,0,0,0),(28200,0,0,0,0,134217728,0),(28429,0,0,0,0,1,0),(28458,0,0,0,0,0,0),(28460,0,0,0,0,0,0),(28592,8,0,0,0,131072,0),(28593,8,0,0,0,131072,0),(28594,8,0,0,0,131072,0),(28595,8,0,0,0,131072,0),(28719,4,0,0,32,268435456,0),(28752,0,0,0,0,4194304,0),(28761,0,0,0,0,131072,0),(28764,0,0,0,0,1048576,0),(28771,0,0,0,0,131072,0),(28789,0,0,0,-1073717248,134217728,0),(28802,0,0,0,0,16384,0),(28809,1,0,56,4096,268435456,0),(28812,0,0,0,0,65536,0),(28816,0,0,0,0,1,3),(28823,4,0,374,192,134217728,0),(28845,0,0,0,0,512,0),(28847,4,0,573,32,16384,0),(28849,4,0,374,128,16384,0),(28881,0,0,0,0,0,0),(29062,0,0,0,0,8396800,0),(29064,0,0,0,0,8396800,0),(29065,0,0,0,0,8396800,0),(29074,10,0,0,0,65536,0),(29075,10,0,0,0,65536,0),(29076,10,0,0,0,65536,0),(29150,0,0,0,0,1,3),(29162,0,0,0,0,2,0),(29179,0,0,0,0,65536,0),(29180,0,0,0,0,65536,0),(29185,0,0,0,0,0,0),(29194,0,0,0,0,0,0),(29196,0,0,0,0,0,0),(29198,0,0,0,0,0,0),(29220,0,0,0,0,1,0),(29307,0,0,0,0,1,0),(29441,0,0,0,0,16777216,0),(29444,0,0,0,0,16777216,0),(29445,0,0,0,0,16777216,0),(29446,0,0,0,0,16777216,0),(29447,0,0,0,0,16777216,0),(29501,0,0,0,0,524288,3),(29526,0,0,0,0,0,0),(29624,0,0,0,0,524288,3),(29625,0,0,0,0,524288,3),(29626,0,0,0,0,524288,3),(29632,0,0,0,0,524288,3),(29633,0,0,0,0,524288,3),(29634,0,0,0,0,524288,3),(29635,0,0,0,0,524288,3),(29636,0,0,0,0,524288,3),(29637,0,0,0,0,524288,3),(30079,0,0,0,0,2,0),(30080,0,0,0,0,2,0),(30081,0,0,0,0,2,0),(30160,0,0,0,0,65536,0),(30802,0,0,0,0,4096,0),(30808,0,0,0,0,4096,0),(30809,0,0,0,0,4096,0),(30810,0,0,0,0,4096,0),(30811,0,0,0,0,4096,0),(31255,0,0,0,0,256,0),(31316,0,0,0,0,2,0),(25020,0,0,0,0,1026,0),(25023,0,0,0,0,2,0),(24949,0,0,0,0,32,0),(24658,0,0,0,0,16384,0),(24661,0,0,0,0,524289,0),(24574,0,0,0,0,1048578,0),(24256,0,0,0,0,524289,0),(24051,0,0,0,0,1,0),(23888,0,0,0,0,1,0),(23863,0,0,0,0,1,0),(23867,0,0,0,0,129,0),(23885,0,0,0,0,1,0),(23886,0,0,0,0,1,0),(23887,0,0,0,0,1,0),(23771,0,0,0,0,1,0),(23780,0,0,0,0,1048578,0),(23721,32,0,163,2048,131072,0),(23686,0,0,0,0,1,2),(23688,0,0,0,0,16384,0),(23689,0,0,0,0,1,4),(23695,0,0,26,2,131072,0),(23578,0,0,0,0,524288,2),(23581,0,0,0,0,1,2),(23548,0,0,0,0,64,0),(23378,0,0,0,0,2,0),(23305,0,0,0,0,1048578,0),(23340,0,0,0,0,2,0),(23255,0,0,0,0,69632,0),(23301,0,0,0,0,8192,0),(23303,0,0,0,0,8192,0),(23306,0,0,0,0,1048578,0),(22835,0,0,0,0,1,0),(22857,0,0,0,0,2,0),(22716,0,0,0,0,1,0),(22618,0,0,0,0,64,0),(22620,0,0,0,0,64,0),(22648,0,0,0,0,4096,0),(22438,0,0,0,0,2,0),(22413,0,0,0,0,1,0),(22283,0,0,0,0,1,0),(22285,0,0,0,0,1,0),(22286,0,0,0,0,1,0),(22287,0,0,0,0,1,0),(22288,0,0,0,0,1,0),(21969,0,0,0,0,2,0),(21911,0,0,0,0,1,0),(21853,0,0,0,0,2,0),(21882,0,0,0,0,4096,0),(21890,0,0,0,-362127634,131072,0),(21788,0,0,0,0,1,0),(21789,0,0,0,0,1,0),(21897,0,0,0,0,2,0),(21838,0,0,0,0,32768,0),(21841,0,0,0,0,1,0),(21645,0,0,0,0,1,0),(21747,0,0,0,0,1,0),(21387,0,0,0,0,2,0),(21329,0,0,0,0,2,0),(21334,0,0,0,0,32768,0),(21185,0,0,0,0,4,0),(21061,0,0,0,0,1,0),(21080,0,0,0,0,1,0),(21084,0,0,0,0,1,0),(21053,0,0,0,0,4,0),(20915,0,0,0,0,1,7),(20918,0,0,0,0,1,7),(20919,0,0,0,0,1,7),(20920,0,0,0,0,1,7),(20925,0,0,0,0,64,0),(20927,0,0,0,0,64,0),(20928,0,0,0,0,64,0),(20884,0,0,0,0,1,0),(20891,0,0,0,0,4096,0),(20896,0,0,0,0,1,0),(20847,0,0,0,0,2,0),(20809,0,0,0,0,1,0),(20705,0,0,0,0,8192,0),(20725,0,0,0,0,4096,0),(20563,0,0,0,0,1,0),(20545,0,0,0,0,1026,0),(20500,0,0,0,268435456,16384,0),(20501,0,0,0,268435456,16384,0),(20423,0,0,0,0,1,0),(20422,0,0,0,0,1,0),(20344,0,0,0,0,2,0),(20345,0,0,0,0,2,0),(20347,0,0,0,0,1,5),(20348,0,0,0,0,1,5),(20346,0,0,0,0,2,0),(20349,0,0,0,0,1,5),(20356,0,0,0,0,1,5),(20357,0,0,0,0,1,5),(20375,0,0,0,0,1,7),(20354,0,0,0,0,1049602,0),(20355,0,0,0,0,1049602,0),(20419,0,0,0,0,1,0),(20421,0,0,0,0,1,0),(20287,0,0,0,0,1,0),(20288,0,0,0,0,1,0),(20289,0,0,0,0,1,0),(20290,0,0,0,0,1,0),(20291,0,0,0,0,1,0),(20292,0,0,0,0,1,0),(20293,0,0,0,0,1,0),(20210,0,0,0,0,65536,0),(20212,0,0,0,0,65536,0),(20213,0,0,0,0,65536,0),(20214,0,0,0,0,65536,0),(20215,0,0,0,0,65536,0),(20179,0,0,0,0,270336,0),(20180,0,0,0,0,270336,0),(20181,0,0,0,0,270336,0),(20182,0,0,0,0,270336,0),(20185,0,0,0,0,2,0),(20186,0,0,0,0,1049602,0),(20230,0,0,0,0,2,0),(20234,1,0,0,32768,131072,0),(20235,0,0,0,32768,131072,0),(20135,0,0,0,0,270336,0),(20136,0,0,0,0,270336,0),(20137,0,0,0,0,270336,0),(20154,0,0,0,0,1,0),(20163,0,0,0,0,1,0),(20164,0,0,0,0,1,2),(20165,0,0,0,0,1,5),(20166,0,0,0,0,1,5),(20169,0,0,0,0,64,0),(20127,0,0,0,0,270336,0),(20130,0,0,0,0,270336,0),(20049,0,0,0,0,69632,0),(20056,0,0,0,0,69632,0),(20057,0,0,0,0,69632,0),(20058,0,0,0,0,69632,0),(20059,0,0,0,0,69632,0),(20177,0,0,0,0,270336,0),(19817,0,0,0,0,1,0),(19818,0,0,0,0,1,0),(19640,0,0,0,0,1,0),(19655,0,0,0,0,2,0),(19656,0,0,0,0,2,0),(19660,0,0,0,0,2,0),(19577,0,0,0,0,1,0),(19514,0,0,0,0,1026,0),(19449,0,0,0,0,2,0),(19396,0,0,0,0,1,0),(19407,32,0,0,512,131072,0),(19409,0,0,0,0,1048578,0),(19412,32,0,0,512,131072,0),(19413,32,0,0,512,131072,0),(19414,32,0,0,512,131072,0),(19415,32,0,0,512,131072,0),(19478,0,0,0,0,2,0),(19387,0,0,0,0,2097152,0),(19388,0,0,0,0,2097152,0),(19389,0,0,0,0,2097152,0),(19390,0,0,0,0,2097152,0),(19308,0,0,0,0,1049602,0),(19309,0,0,0,0,1049602,0),(19310,0,0,0,0,1049602,0),(19311,0,0,0,0,1049602,0),(19312,0,0,0,0,1049602,0),(19261,0,0,0,0,1,0),(19262,0,0,0,0,1,0),(19264,0,0,0,0,1,0),(19265,0,0,0,0,1,0),(19266,0,0,0,0,1,0),(19194,0,0,0,0,1,0),(19195,0,0,0,0,1,0),(19233,0,0,0,64,131072,0),(19234,0,0,0,64,131072,0),(19235,0,0,0,64,131072,0),(19228,0,0,0,64,131072,0),(19232,0,0,0,64,131072,0),(19184,0,0,0,0,2097152,0),(18979,0,0,0,0,1,0),(18983,0,0,0,0,4,0),(18943,0,0,0,0,1,0),(18799,0,0,0,0,2,0),(18800,0,0,0,0,8,0),(18815,0,0,0,0,2,0),(18816,0,0,0,0,2,0),(18847,0,0,0,0,1,0),(18765,0,0,0,0,128,0),(18542,0,0,0,0,1,0),(18186,0,0,0,0,1,0),(18189,6,0,0,0,131072,0),(18121,0,0,593,0,131072,0),(18122,0,0,593,0,131072,0),(18123,0,0,593,0,131072,0),(18137,0,0,0,0,1049602,0),(18146,0,0,0,0,2,0),(18167,0,0,0,0,1,0),(18119,0,0,593,0,131072,0),(18120,0,0,593,0,131072,0),(18097,0,0,0,0,2,0),(18100,0,0,0,0,2,0),(17793,16,0,593,1,65536,0),(17796,16,0,593,1,65536,0),(17801,16,0,593,1,65536,0),(17802,16,0,593,1,65536,0),(17803,16,0,593,1,65536,0),(17688,0,0,0,0,128,0),(17690,0,0,0,0,2,0),(17670,0,0,0,0,8,0),(17495,0,0,0,0,64,0),(17329,0,0,0,0,2,0),(17332,0,0,0,0,1,0),(17350,0,0,0,0,2,0),(17082,0,0,0,524288,16384,0),(17079,0,0,0,524288,16384,0),(17000,0,0,0,131072,131072,0),(17001,0,0,0,131072,131072,0),(17010,0,0,0,0,1,0),(16956,0,0,0,0,65536,0),(16957,0,0,0,0,65536,0),(16958,0,0,0,0,69632,0),(16961,0,0,0,0,69632,0),(16962,0,0,0,0,69632,0),(16963,0,0,0,0,69632,0),(16964,0,0,0,0,69632,0),(16982,0,0,0,0,1,0),(16923,0,0,574,4,131072,0),(16924,0,0,574,4,131072,0),(16925,0,0,574,4,131072,0),(16926,0,0,574,4,131072,0),(16952,0,0,0,233472,65536,0),(16954,0,0,0,233472,65536,0),(16955,0,0,0,233472,65536,0),(16880,0,0,0,0,268500992,0),(16850,0,0,574,4,131072,0),(16864,0,0,0,0,1,6),(16800,0,0,0,0,1,0),(16810,0,0,0,0,2,0),(16811,0,0,0,0,2,0),(16812,0,0,0,0,2,0),(16813,0,0,0,0,2,0),(16792,0,0,0,0,8192,0),(16843,0,0,0,0,1,0),(16689,0,0,0,0,2,0),(16624,0,0,0,0,64,0),(16611,0,0,0,0,2,0),(16615,0,0,0,0,1,0),(16620,0,0,0,0,2,0),(16550,0,0,0,0,8192,0),(16563,0,0,0,0,1,0),(16574,0,0,0,0,1,0),(16575,0,0,0,0,1,0),(16487,0,0,0,0,8658944,0),(16489,0,0,0,0,8658944,0),(16492,0,0,0,0,8658944,0),(16423,0,0,0,0,128,0),(16428,0,0,0,0,1,0),(16281,0,0,0,0,4096,0),(16282,0,0,0,0,4096,0),(16283,0,0,0,0,4096,0),(16284,0,0,0,0,4096,0),(16311,0,0,0,0,1,0),(16312,0,0,0,0,1,0),(16313,0,0,0,0,1,0),(16235,0,0,0,0,268435456,0),(16240,0,0,0,0,268435456,0),(16241,0,0,0,0,268435456,0),(16242,0,0,0,0,268435456,0),(16247,0,0,0,0,1,0),(16256,0,0,0,0,4096,0),(16164,14,0,0,0,16384,0),(16176,0,0,0,0,268435456,0),(16140,0,0,0,0,128,0),(16142,0,0,0,0,1,0),(16146,0,0,0,0,2048,0),(16092,0,0,0,0,32,0),(15978,0,0,0,0,1,0),(15876,0,0,0,0,2,0),(15852,0,0,0,0,1,0),(15784,0,0,0,0,2,0),(15730,0,0,0,0,1,0),(15733,0,0,0,0,1,0),(15849,0,0,0,0,1,0),(15636,0,0,0,0,1,0),(15641,0,0,0,0,1,0),(15644,0,0,0,0,2,0),(15650,0,0,0,0,1,0),(15567,0,0,0,0,1,0),(15568,0,0,0,0,1,0),(15569,0,0,0,0,1,0),(15573,0,0,0,0,1,0),(15594,0,0,0,0,2,0),(15599,0,0,0,0,1,0),(15600,0,0,0,0,1,0),(15506,0,0,0,0,1,0),(15507,0,0,0,0,1026,0),(15603,0,0,0,0,2,0),(15362,1,0,56,7680,268435456,0),(15363,1,0,56,7680,268435456,0),(15364,1,0,56,7680,268435456,0),(15365,1,0,56,7680,268435456,0),(15323,16,0,0,0,131072,0),(15324,16,0,0,0,131072,0),(15325,16,0,0,0,131072,0),(15326,16,0,0,0,131072,0),(15335,0,0,0,0,4,0),(15336,0,0,0,0,4,0),(15337,0,0,0,0,4,0),(15338,0,0,0,0,4,0),(15346,0,0,0,0,1,6),(15268,16,0,0,0,131072,0),(15270,0,0,0,0,4,0),(15277,0,0,0,0,1,6),(15088,0,0,0,0,4096,0),(15097,0,0,0,0,8192,0),(14892,1,0,56,7680,268435456,0),(14796,0,0,0,0,2048,0),(14869,0,0,0,0,1,0),(14774,0,0,0,0,8192,0),(14531,0,0,0,0,8192,0),(14186,0,0,0,1082131720,65536,0),(14190,0,0,0,1082131720,65536,0),(14193,0,0,0,1082131720,65536,0),(14194,0,0,0,1082131720,65536,0),(14195,0,0,0,1082131720,65536,0),(14144,0,0,0,0,4,0),(14148,0,0,0,0,4,0),(14150,0,0,0,0,4,0),(14152,0,0,0,0,4,0),(14154,0,0,0,0,4,0),(14156,0,0,0,4063232,131072,0),(14160,0,0,0,4063232,131072,0),(14161,0,0,0,4063232,131072,0),(14178,0,0,0,0,2,0),(14108,0,0,0,0,2,0),(14111,0,0,0,0,1,0),(14133,0,0,0,0,1,0),(14070,0,0,0,0,16,0),(14071,0,0,0,0,16,0),(13983,0,0,0,0,16,0),(13987,0,0,0,0,2,0),(13959,0,0,0,0,1048578,0),(13960,0,0,0,0,1,0),(13961,0,0,0,0,1,0),(13962,0,0,0,0,1,0),(13963,0,0,0,0,1,0),(13964,0,0,0,0,1,0),(13867,0,88,0,16,131072,0),(13879,0,0,0,0,2,0),(13886,0,0,0,0,1,0),(13754,0,88,0,16,131072,0),(13767,0,0,0,0,1,0),(13800,0,0,0,0,1,0),(13801,0,0,0,0,1,0),(13802,0,0,0,0,1,0),(13803,0,0,0,0,1,0),(13709,0,0,0,0,1,0),(13716,0,0,0,0,1026,0),(13616,0,0,0,0,1,0),(13585,0,0,0,0,1026,0),(13483,0,0,0,0,2,0),(13358,0,0,0,0,16,0),(13260,0,0,0,0,128,0),(13299,0,0,0,0,1,0),(13320,0,0,0,0,2,0),(13045,0,0,0,0,8658944,0),(13046,0,0,0,0,8658944,0),(13047,0,0,0,0,8658944,0),(13048,0,0,0,0,8658944,0),(13078,0,0,0,0,4,0),(13159,0,0,0,0,32768,0),(12999,0,0,0,0,1,0),(13000,0,0,0,0,1,0),(13001,0,0,0,0,1,0),(13002,0,0,0,0,1,0),(12947,0,0,0,0,1,0),(12958,0,88,257,2048,131072,0),(12971,0,0,0,0,69632,0),(12972,0,0,0,0,69632,0),(12973,0,0,0,0,69632,0),(12974,0,0,0,0,69632,0),(12849,0,0,0,0,69632,0),(12787,0,0,0,0,1,0),(12799,0,65,257,1024,131072,0),(12800,0,65,257,1024,131072,0),(12812,0,0,0,0,1,0),(12813,0,0,0,0,1,0),(12814,0,0,0,0,1,0),(12815,0,0,0,0,1,0),(12834,0,0,0,0,69632,0),(12782,0,0,0,0,64,0),(12724,0,0,0,0,64,0),(12725,0,0,0,0,64,0),(12726,0,0,0,0,64,0),(12727,0,0,0,0,64,0),(12797,0,65,257,1024,131072,0),(12867,0,0,0,0,69632,0),(12701,0,0,0,0,1,0),(12702,0,0,0,0,1,0),(12703,0,0,0,0,1,0),(12704,0,0,0,0,1,0),(12668,0,0,26,2,131072,0),(12598,0,88,237,16384,131072,0),(12544,0,0,0,0,2,0),(12546,0,0,0,0,1,0),(12550,0,0,0,0,1026,0),(12552,0,0,0,0,1,0),(12556,0,0,0,0,2,0),(12574,0,0,0,0,131072,0),(12575,0,0,0,0,131072,0),(12576,0,0,0,0,131072,0),(12577,0,0,0,0,131072,0),(12529,0,0,0,0,2,0),(12539,0,0,0,0,1,0),(12357,2,0,0,0,131072,0),(12358,2,0,0,0,131072,0),(12359,2,0,0,0,131072,0),(12360,2,0,0,0,131072,0),(12311,0,88,257,2048,131072,0),(12317,0,0,0,0,8658944,0),(12319,0,0,0,0,69632,0),(12322,0,0,0,0,1,0),(12246,0,0,0,0,2,0),(12254,0,0,0,0,1,0),(12281,0,0,0,0,1,0),(12284,0,0,0,0,1,0),(12289,0,0,26,2,131072,0),(12292,0,0,0,0,128,0),(12298,0,0,0,0,64,0),(12094,0,0,0,0,1,0),(11984,0,0,0,0,1,0),(12099,0,0,0,0,64,0),(11919,0,0,0,0,1,0),(11959,0,0,0,0,1,0),(11961,0,0,0,0,1,0),(11964,0,0,0,0,1,0),(12002,0,0,0,0,2,0),(12038,0,0,0,0,1,0),(11830,0,0,0,0,128,0),(11838,0,0,0,0,1,0),(11441,0,0,0,0,1,0),(11371,0,0,0,0,2,0),(11255,0,0,237,16384,131072,0),(11213,0,0,0,0,131072,0),(11103,2,0,0,0,131072,0),(10868,0,0,0,0,2048,0),(10727,0,0,0,0,1026,0),(10431,0,0,0,0,1049602,0),(10432,0,0,0,0,1049602,0),(10400,0,0,0,0,1,0),(10219,0,0,0,0,2,0),(10220,0,0,0,0,2,0),(10092,0,0,0,0,128,0),(10095,0,0,0,0,1,0),(10022,0,0,0,0,1,0),(9793,0,0,0,0,1,0),(9778,0,0,0,0,2,0),(9782,0,0,0,0,64,0),(9784,0,0,0,0,64,0),(9797,0,0,0,0,1,0),(9801,0,0,0,0,1,0),(9808,0,0,0,0,1,0),(9460,0,0,0,0,2,0),(9463,0,0,0,0,2,0),(9276,0,0,0,0,1,0),(9205,0,0,0,0,1,0),(9233,0,0,0,0,1,0),(9160,0,0,0,0,2,0),(9084,0,0,0,0,8,0),(8981,0,0,0,0,1,0),(8852,0,0,0,0,2,0),(8876,0,0,0,0,1,0),(8788,0,0,0,0,1026,0),(8612,0,0,0,0,2,0),(8601,0,0,0,0,1,0),(8397,0,0,0,0,2,0),(8247,0,0,0,0,1,0),(8224,0,0,0,0,2,0),(8134,0,0,0,0,1049602,0),(7999,0,0,0,0,2,0),(7849,0,0,0,0,2,0),(7806,0,0,0,0,1,0),(7807,0,0,0,0,1,0),(7808,0,0,0,0,1,0),(7721,0,0,0,0,1,0),(7722,0,0,0,0,1,0),(7723,0,0,0,0,1,0),(7724,0,0,0,0,1,0),(7725,0,0,0,0,1,0),(7726,0,0,0,0,1,0),(7711,0,0,0,0,1,0),(7601,0,0,0,0,2,0),(7614,0,0,0,0,2,0),(7615,0,0,0,0,2,0),(7616,0,0,0,0,2,0),(7617,0,0,0,0,1048578,0),(7618,0,0,0,0,2,0),(7619,0,0,0,0,1048578,0),(7445,0,0,0,0,2,0),(7446,0,0,0,0,2,0),(7276,0,0,0,0,1,0),(7300,0,0,0,0,2,0),(7301,0,0,0,0,2,0),(7302,0,0,0,0,2,0),(7320,0,0,0,0,2,0),(7486,0,0,0,0,1,0),(7095,0,0,0,0,1,0),(7098,0,0,0,0,1,0),(7102,0,0,0,0,1,0),(7103,0,0,0,0,2,0),(7137,0,0,0,0,1,0),(6909,0,0,0,0,1,0),(6921,0,0,0,0,1,0),(6923,0,0,0,0,1,0),(6947,0,0,0,0,1,0),(6961,0,0,0,0,1,0),(6867,0,0,0,0,1,0),(6871,0,0,0,0,1,0),(6750,0,0,0,0,1,0),(6752,0,0,0,0,1,0),(6645,0,0,0,0,1,0),(6592,0,0,0,0,1138,0),(6593,0,0,0,0,1,0),(6433,0,0,0,0,2,0),(6134,0,0,0,0,2,0),(6135,0,0,0,0,2,0),(5976,0,0,0,0,1,0),(5977,0,0,0,0,1,0),(5979,0,0,0,0,1,0),(5811,0,0,0,0,2,0),(5751,0,0,0,0,524288,0),(5752,0,0,0,0,524288,0),(5753,0,0,0,0,524288,0),(5754,0,0,0,0,524288,0),(5755,0,0,0,0,524288,0),(5756,0,0,0,0,524288,0),(5680,0,0,0,0,1,0),(5638,0,0,0,0,524288,0),(5639,0,0,0,0,524288,0),(5640,0,0,0,0,524288,0),(5641,0,0,0,0,524288,0),(5642,0,0,0,0,524288,0),(5643,0,0,0,0,524288,0),(5549,0,0,0,0,1,0),(5550,0,0,0,0,1,0),(5551,0,0,0,0,1,0),(5552,0,0,0,0,1,0),(5553,0,0,0,0,1,0),(5554,0,0,0,0,1,0),(5575,0,0,0,0,1,0),(5580,0,0,0,0,1,0),(5513,0,0,0,0,1,0),(5429,0,0,0,0,1,0),(5430,0,0,0,0,1,0),(5431,0,0,0,0,1,0),(5432,0,0,0,0,1,0),(5433,0,0,0,0,1,0),(5352,0,0,0,0,1,0),(5353,0,0,0,0,1,0),(5354,0,0,0,0,1,0),(5364,0,0,0,0,2,0),(5368,0,0,0,0,2,0),(5369,0,0,0,0,2,0),(5427,0,0,0,0,1,0),(5370,0,0,0,0,2,0),(5377,0,0,0,0,1,0),(5301,0,0,0,0,112,0),(5341,0,0,0,0,1,0),(5342,0,0,0,0,1,0),(5343,0,0,0,0,1,0),(5344,0,0,0,0,1,0),(5345,0,0,0,0,1,0),(5346,0,0,0,0,1,0),(5349,0,0,0,0,1,0),(5350,0,0,0,0,1,0),(5351,0,0,0,0,1,0),(5262,0,0,0,0,1,0),(5202,0,0,0,0,1,0),(5205,0,0,0,0,2,0),(5104,0,0,0,0,1,0),(5118,0,0,0,0,32768,0),(4932,0,0,0,0,2,0),(4951,0,0,0,0,2,0),(4525,0,0,0,0,2,0),(4495,0,0,0,0,1,0),(4496,0,0,0,0,1,0),(4512,0,0,0,0,2,0),(4387,0,0,0,0,1,0),(4388,0,0,0,0,1,0),(4389,0,0,0,0,1,0),(4390,0,0,0,0,1,0),(4315,0,0,0,0,1,0),(4317,0,0,0,0,1,0),(4493,0,0,0,0,1,0),(4494,0,0,0,0,1,0),(4279,0,0,0,0,1,0),(4283,0,0,0,0,1,0),(4284,0,0,0,0,1,0),(4241,0,0,0,0,1,0),(4242,0,0,0,0,1,0),(4245,0,0,0,0,1,0),(4144,0,0,0,0,1,0),(4161,0,0,0,0,2,0),(4112,0,0,0,0,2,0),(4113,0,0,0,0,2,0),(4114,0,0,0,0,2,0),(4115,0,0,0,0,2,0),(4133,0,0,0,0,2,0),(4136,0,0,0,0,2,0),(4138,0,0,0,0,2,0),(4140,0,0,0,0,2,0),(4142,0,0,0,0,4,0),(4070,0,0,0,0,2,0),(4051,0,0,0,0,128,0),(3637,0,0,0,0,2,0),(3582,0,0,0,0,1,0),(3616,0,0,0,0,1,0),(3509,0,0,0,0,1,0),(3512,0,0,0,0,1,0),(3424,0,0,0,0,1,0),(3440,0,0,0,0,1,0),(3436,0,0,0,0,2,0),(3439,0,0,0,0,2,0),(3394,0,0,0,0,1,0),(3417,0,0,0,0,1,0),(3418,0,0,0,0,2,0),(3338,0,0,0,0,2,0),(3284,0,0,0,0,2,0),(3235,0,0,0,0,2,0),(114,0,0,0,0,2,0),(168,0,0,0,0,2,0),(324,0,0,0,0,1049602,0),(325,0,0,0,0,1049602,0),(637,0,0,0,0,2,0),(646,0,0,0,0,2,0),(648,0,0,0,0,1,0),(742,0,0,0,0,1,0),(905,0,0,0,0,1049602,0),(945,0,0,0,0,1049602,0),(1028,0,0,0,0,2,0),(1034,0,0,0,0,1,0),(1048,0,0,0,0,2,0),(1707,5,99,0,0,16384,0),(2095,0,0,0,0,1139,0),(2652,0,0,0,0,1,0),(2689,0,0,0,0,4,0),(2852,0,0,0,0,2,0),(23547,0,0,0,0,32,0);
UNLOCK TABLES;
/*!40000 ALTER TABLE `spell_proc_event` ENABLE KEYS */;

--
-- Table structure for table `spell_scripts`
--

DROP TABLE IF EXISTS `spell_scripts`;
CREATE TABLE `spell_scripts` (
  `id` int(11) unsigned NOT NULL default '0',
  `delay` int(11) unsigned NOT NULL default '0',
  `command` int(11) unsigned NOT NULL default '0',
  `datalong` int(11) unsigned NOT NULL default '0',
  `datalong2` int(11) unsigned NOT NULL default '0',
  `datatext` text NOT NULL,
  `x` float NOT NULL default '0',
  `y` float NOT NULL default '0',
  `z` float NOT NULL default '0',
  `o` float NOT NULL default '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `spell_scripts`
--


/*!40000 ALTER TABLE `spell_scripts` DISABLE KEYS */;
LOCK TABLES `spell_scripts` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `spell_scripts` ENABLE KEYS */;

--
-- Table structure for table `spell_threat`
--

DROP TABLE IF EXISTS `spell_threat`;
CREATE TABLE `spell_threat` (
  `entry` int(10) unsigned NOT NULL,
  `Threat` int(11) NOT NULL,
  PRIMARY KEY  (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED;

--
-- Dumping data for table `spell_threat`
--


/*!40000 ALTER TABLE `spell_threat` DISABLE KEYS */;
LOCK TABLES `spell_threat` WRITE;
INSERT INTO `spell_threat` VALUES (1672,180),(9881,207),(11556,43),(11567,145),(11597,261),(11601,315),(11775,395),(14921,415),(24394,580),(24583,5),(25286,175),(25288,355),(25289,60),(78,20),(284,39),(285,59),(1608,78),(11564,98),(11565,118),(11566,137),(7386,100),(7405,140),(8380,180),(11596,220),(1715,61),(7372,101),(7373,141),(6572,155),(6574,195),(7379,235),(11600,275),(23922,160),(23923,190),(23924,220),(23925,250),(6809,89),(8972,118),(9745,148),(9880,178),(770,108),(778,108),(9749,108),(9907,108),(17735,200),(17750,300),(17751,450),(17752,600),(20736,100),(14274,200),(15629,300),(15630,400),(15631,500),(15632,600);
UNLOCK TABLES;
/*!40000 ALTER TABLE `spell_threat` ENABLE KEYS */;

--
-- Table structure for table `transports`
--

DROP TABLE IF EXISTS `transports`;
CREATE TABLE `transports` (
  `entry` int(11) unsigned NOT NULL default '0',
  `name` text,
  `period` int(11) unsigned NOT NULL default '0',
  PRIMARY KEY  (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Transports';

--
-- Dumping data for table `transports`
--


/*!40000 ALTER TABLE `transports` DISABLE KEYS */;
LOCK TABLES `transports` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `transports` ENABLE KEYS */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;



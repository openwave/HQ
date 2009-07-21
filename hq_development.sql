-- MySQL dump 10.10
--
-- Host: localhost    Database: hq_development
-- ------------------------------------------------------
-- Server version	5.0.24a-community-nt

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
-- Table structure for table `contacts`
--

DROP TABLE IF EXISTS `contacts`;
CREATE TABLE `contacts` (
  `id` int(11) NOT NULL auto_increment,
  `user_id` int(11) default NULL,
  `org_id` int(11) default NULL,
  `title` varchar(255) default NULL,
  `content` text,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `contacts`
--


/*!40000 ALTER TABLE `contacts` DISABLE KEYS */;
LOCK TABLES `contacts` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `contacts` ENABLE KEYS */;

--
-- Table structure for table `deal_disclaimers`
--

DROP TABLE IF EXISTS `deal_disclaimers`;
CREATE TABLE `deal_disclaimers` (
  `id` int(11) NOT NULL auto_increment,
  `deal_id` int(11) default NULL,
  `disclaimer_id` int(11) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `deal_disclaimers`
--


/*!40000 ALTER TABLE `deal_disclaimers` DISABLE KEYS */;
LOCK TABLES `deal_disclaimers` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `deal_disclaimers` ENABLE KEYS */;

--
-- Table structure for table `deals`
--

DROP TABLE IF EXISTS `deals`;
CREATE TABLE `deals` (
  `id` int(11) NOT NULL auto_increment,
  `org_id` int(11) default NULL,
  `deal_type` varchar(255) default NULL,
  `deal_value` varchar(255) default NULL,
  `title` varchar(255) default NULL,
  `description` varchar(255) default NULL,
  `rank` varchar(255) default '00',
  `position` int(11) default NULL,
  `photo_file_name` varchar(255) default NULL,
  `deals` varchar(255) default NULL,
  `photo_content_type` varchar(255) default NULL,
  `photo_file_size` int(11) default NULL,
  `photo_updated_at` datetime default NULL,
  `delta` tinyint(1) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `deals`
--


/*!40000 ALTER TABLE `deals` DISABLE KEYS */;
LOCK TABLES `deals` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `deals` ENABLE KEYS */;

--
-- Table structure for table `disclaimers`
--

DROP TABLE IF EXISTS `disclaimers`;
CREATE TABLE `disclaimers` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `disclaimers`
--


/*!40000 ALTER TABLE `disclaimers` DISABLE KEYS */;
LOCK TABLES `disclaimers` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `disclaimers` ENABLE KEYS */;

--
-- Table structure for table `events`
--

DROP TABLE IF EXISTS `events`;
CREATE TABLE `events` (
  `id` int(11) NOT NULL auto_increment,
  `org_id` int(11) default NULL,
  `title` varchar(255) default NULL,
  `description` varchar(255) default NULL,
  `street` varchar(255) default NULL,
  `locality` varchar(255) default NULL,
  `region` varchar(255) default NULL,
  `postal_code` varchar(255) default NULL,
  `country` varchar(255) default NULL,
  `starting_on` datetime default NULL,
  `ending_on` datetime default NULL,
  `image_file_name` varchar(255) default NULL,
  `image_content_type` varchar(255) default NULL,
  `image_file_size` int(11) default NULL,
  `image_updated_at` datetime default NULL,
  `age_requirement` varchar(255) default 'None',
  `delta` tinyint(1) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `events`
--


/*!40000 ALTER TABLE `events` DISABLE KEYS */;
LOCK TABLES `events` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `events` ENABLE KEYS */;

--
-- Table structure for table `facts`
--

DROP TABLE IF EXISTS `facts`;
CREATE TABLE `facts` (
  `id` int(11) NOT NULL auto_increment,
  `org_id` int(11) default NULL,
  `title` varchar(255) default NULL,
  `content` text,
  `delta` tinyint(1) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `facts`
--


/*!40000 ALTER TABLE `facts` DISABLE KEYS */;
LOCK TABLES `facts` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `facts` ENABLE KEYS */;

--
-- Table structure for table `flowings`
--

DROP TABLE IF EXISTS `flowings`;
CREATE TABLE `flowings` (
  `id` int(11) NOT NULL auto_increment,
  `org_id` int(11) default NULL,
  `title` varchar(255) default NULL,
  `content` text,
  `delta` tinyint(1) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `flowings`
--


/*!40000 ALTER TABLE `flowings` DISABLE KEYS */;
LOCK TABLES `flowings` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `flowings` ENABLE KEYS */;

--
-- Table structure for table `galleries`
--

DROP TABLE IF EXISTS `galleries`;
CREATE TABLE `galleries` (
  `id` int(11) NOT NULL auto_increment,
  `org_id` int(11) default NULL,
  `title` varchar(255) default NULL,
  `content` text,
  `position` int(11) NOT NULL default '1',
  `photos_count` int(11) NOT NULL default '0',
  `delta` tinyint(1) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `galleries`
--


/*!40000 ALTER TABLE `galleries` DISABLE KEYS */;
LOCK TABLES `galleries` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `galleries` ENABLE KEYS */;

--
-- Table structure for table `geocodes`
--

DROP TABLE IF EXISTS `geocodes`;
CREATE TABLE `geocodes` (
  `id` int(11) NOT NULL auto_increment,
  `latitude` decimal(15,12) default NULL,
  `longitude` decimal(15,12) default NULL,
  `query` varchar(255) default NULL,
  `street` varchar(255) default NULL,
  `locality` varchar(255) default NULL,
  `region` varchar(255) default NULL,
  `postal_code` varchar(255) default NULL,
  `country` varchar(255) default NULL,
  `precision` varchar(255) default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `geocodes_query_index` (`query`),
  KEY `geocodes_longitude_index` (`longitude`),
  KEY `geocodes_latitude_index` (`latitude`),
  KEY `geocodes_locality_index` (`locality`),
  KEY `geocodes_region_index` (`region`),
  KEY `geocodes_postal_code_index` (`postal_code`),
  KEY `geocodes_country_index` (`country`),
  KEY `geocodes_precision_index` (`precision`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `geocodes`
--


/*!40000 ALTER TABLE `geocodes` DISABLE KEYS */;
LOCK TABLES `geocodes` WRITE;
INSERT INTO `geocodes` VALUES (1,'40.752004000000','-74.001025000000','kottur\nchennai, NJ 10001',NULL,'New York','NY','10001','US','city'),(2,'33.972930000000','-118.247689000000','Manjunath Nagar\nBangalore, NJ 90001',NULL,'Los Angeles','CA','90001','US','city'),(3,'41.370899000000','-93.406369000000','RajajiNagar\nBangalore, NJ 50001',NULL,'Ackworth','IA','50001','US','city'),(4,'40.142780000000','-74.726723000000','Velachery\nChennai, NJ 35241',NULL,NULL,'NJ',NULL,'US','state'),(5,'40.142780000000','-74.726723000000','mg road\nbangalore, NJ 65987',NULL,NULL,'NJ',NULL,'US','state'),(6,'44.291620000000','-88.030194000000','mgroad\nbangalore, NJ 54126',NULL,'Holland','WI','54126','US','city'),(7,'40.142780000000','-74.726723000000','hawars road\nbangalore, NJ 69782',NULL,NULL,'NJ',NULL,'US','state');
UNLOCK TABLES;
/*!40000 ALTER TABLE `geocodes` ENABLE KEYS */;

--
-- Table structure for table `geocodings`
--

DROP TABLE IF EXISTS `geocodings`;
CREATE TABLE `geocodings` (
  `id` int(11) NOT NULL auto_increment,
  `geocodable_id` int(11) default NULL,
  `geocode_id` int(11) default NULL,
  `geocodable_type` varchar(255) default NULL,
  PRIMARY KEY  (`id`),
  KEY `geocodings_geocodable_type_index` (`geocodable_type`),
  KEY `geocodings_geocode_id_index` (`geocode_id`),
  KEY `geocodings_geocodable_id_index` (`geocodable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `geocodings`
--


/*!40000 ALTER TABLE `geocodings` DISABLE KEYS */;
LOCK TABLES `geocodings` WRITE;
INSERT INTO `geocodings` VALUES (1,1,1,'Org'),(2,2,2,'Org'),(3,3,3,'Org'),(4,4,4,'Org'),(5,5,5,'Org'),(6,6,6,'Org'),(7,7,7,'Org');
UNLOCK TABLES;
/*!40000 ALTER TABLE `geocodings` ENABLE KEYS */;

--
-- Table structure for table `highlights`
--

DROP TABLE IF EXISTS `highlights`;
CREATE TABLE `highlights` (
  `id` int(11) NOT NULL auto_increment,
  `org_id` int(11) default NULL,
  `title` varchar(255) default NULL,
  `content` text,
  `position` int(11) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `highlights`
--


/*!40000 ALTER TABLE `highlights` DISABLE KEYS */;
LOCK TABLES `highlights` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `highlights` ENABLE KEYS */;

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
CREATE TABLE `notifications` (
  `id` int(11) NOT NULL auto_increment,
  `user_id` int(11) default NULL,
  `org_id` int(11) default NULL,
  `promotion` tinyint(1) default NULL,
  `deal` tinyint(1) default NULL,
  `news` tinyint(1) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `notifications`
--


/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
LOCK TABLES `notifications` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;

--
-- Table structure for table `orgs`
--

DROP TABLE IF EXISTS `orgs`;
CREATE TABLE `orgs` (
  `id` int(11) NOT NULL auto_increment,
  `user_id` int(11) default NULL,
  `title` varchar(255) default NULL,
  `street` varchar(255) default NULL,
  `locality` varchar(255) default NULL,
  `region` varchar(255) default NULL,
  `postal_code` varchar(255) default NULL,
  `country` varchar(255) default NULL,
  `url` varchar(255) default NULL,
  `hq_url` varchar(255) default NULL,
  `contact_first_name` varchar(255) default NULL,
  `contact_last_name` varchar(255) default NULL,
  `contact_email` varchar(255) default NULL,
  `contact_phone_work` varchar(255) default NULL,
  `contact_phone_cell` varchar(255) default NULL,
  `is_authorized` tinyint(1) default NULL,
  `delta` tinyint(1) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  `rating_count` int(11) default NULL,
  `rating_total` decimal(10,0) default NULL,
  `rating_avg` decimal(10,2) default NULL,
  `contact_fax` varchar(255) default NULL,
  `three_word_desc` varchar(255) default NULL,
  `logo` tinyint(1) default '0',
  `image_file_name` varchar(255) default NULL,
  `image_content_type` varchar(255) default NULL,
  `image_file_size` varchar(255) default NULL,
  `video_count` int(11) default 0,
  `contact_24` blob,
  `map_it` blob,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `orgs`
--


/*!40000 ALTER TABLE `orgs` DISABLE KEYS */;
LOCK TABLES `orgs` WRITE;
INSERT INTO `orgs` VALUES (1,1,'Sathesh_Org_1','kottur','chennai','NJ','10001','US',NULL,'sathesh.chennai.com',NULL,NULL,NULL,NULL,NULL,1,1,'2009-06-10 23:05:58','2009-06-10 23:06:00',0,'0','0.00',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL),(2,1,'Sathesh_Org_2','Manjunath Nagar','Bangalore','NJ','90001','US',NULL,'sathesh.bangalore.com',NULL,NULL,NULL,NULL,NULL,0,1,'2009-06-10 23:06:59','2009-06-10 23:07:01',0,'0','0.00',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL),(3,1,'Sathesh_Org_3','RajajiNagar','Bangalore','NJ','50001','US',NULL,'sathesh.rajaji.com',NULL,NULL,NULL,NULL,NULL,1,1,'2009-06-10 23:07:50','2009-06-10 23:07:51',0,'0','0.00',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL),(4,2,'Santhosh_org_1','Velachery','Chennai','NJ','35241','US',NULL,'santhosh.chennai.com',NULL,NULL,NULL,NULL,NULL,1,1,'2009-06-10 23:11:38','2009-06-10 23:11:39',0,'0','0.00',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL),(5,2,'santhosh_org_2','mg road','bangalore','NJ','65987','US',NULL,'santhos.mgroad.com',NULL,NULL,NULL,NULL,NULL,1,1,'2009-06-10 23:12:33','2009-06-10 23:12:34',0,'0','0.00',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL),(6,3,'kannan_org_1','mgroad','bangalore','NJ','54126','US',NULL,'kannan.bangalore.com',NULL,NULL,NULL,NULL,NULL,1,1,'2009-06-10 23:13:49','2009-06-10 23:13:51',0,'0','0.00',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL),(7,3,'kannan_org_','hawars road','bangalore','NJ','69782','US',NULL,'kannan.com',NULL,NULL,NULL,NULL,NULL,1,1,'2009-06-10 23:14:35','2009-06-10 23:14:36',0,'0','0.00',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL);
UNLOCK TABLES;
/*!40000 ALTER TABLE `orgs` ENABLE KEYS */;

--
-- Table structure for table `photos`
--

DROP TABLE IF EXISTS `photos`;
CREATE TABLE `photos` (
  `id` int(11) NOT NULL auto_increment,
  `gallery_id` int(11) NOT NULL,
  `position` int(11) NOT NULL default '1',
  `title` varchar(128) default NULL,
  `image_file_name` varchar(255) default NULL,
  `image_content_type` varchar(255) default NULL,
  `image_file_size` int(11) default NULL,
  `image_updated_at` datetime default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `photos`
--


/*!40000 ALTER TABLE `photos` DISABLE KEYS */;
LOCK TABLES `photos` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `photos` ENABLE KEYS */;

--
-- Table structure for table `prices`
--

DROP TABLE IF EXISTS `prices`;
CREATE TABLE `prices` (
  `id` int(11) NOT NULL auto_increment,
  `org_id` int(11) default NULL,
  `group` varchar(255) default NULL,
  `title` varchar(255) default NULL,
  `price` decimal(10,0) default NULL,
  `description` text,
  `content` text,
  `photo_file_name` varchar(255) default NULL,
  `photo_content_type` varchar(255) default NULL,
  `string` varchar(255) default NULL,
  `photo_file_size` int(11) default NULL,
  `integer` int(11) default NULL,
  `photo_updated_at` datetime default NULL,
  `datetime` datetime default NULL,
  `position` int(11) default NULL,
  `delta` tinyint(1) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `prices`
--


/*!40000 ALTER TABLE `prices` DISABLE KEYS */;
LOCK TABLES `prices` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `prices` ENABLE KEYS */;

--
-- Table structure for table `profiles`
--

DROP TABLE IF EXISTS `profiles`;
CREATE TABLE `profiles` (
  `id` int(11) NOT NULL auto_increment,
  `org_id` int(11) NOT NULL,
  `content` text,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `profiles`
--


/*!40000 ALTER TABLE `profiles` DISABLE KEYS */;
LOCK TABLES `profiles` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `profiles` ENABLE KEYS */;

--
-- Table structure for table `ratings`
--

DROP TABLE IF EXISTS `ratings`;
CREATE TABLE `ratings` (
  `id` int(11) NOT NULL auto_increment,
  `rater_id` int(11) default NULL,
  `rated_id` int(11) default NULL,
  `rated_type` varchar(255) default NULL,
  `rating` decimal(10,0) default NULL,
  PRIMARY KEY  (`id`),
  KEY `index_ratings_on_rater_id` (`rater_id`),
  KEY `index_ratings_on_rated_type_and_rated_id` (`rated_type`,`rated_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ratings`
--


/*!40000 ALTER TABLE `ratings` DISABLE KEYS */;
LOCK TABLES `ratings` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `ratings` ENABLE KEYS */;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `schema_migrations`
--


/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
LOCK TABLES `schema_migrations` WRITE;
INSERT INTO `schema_migrations` VALUES ('20090427182535'),('20090428141749'),('20090428165949'),('20090428175020'),('20090429140515'),('20090429150339'),('20090429155435'),('20090429180213'),('20090429201044'),('20090430131903'),('20090430162334'),('20090504160549'),('20090504165853'),('20090504182125'),('20090505172130'),('20090505172131'),('20090505172132'),('20090505172133'),('20090505172134'),('20090505172136'),('20090505172137'),('20090505172138'),('20090609072408'),('20090609082424');
UNLOCK TABLES;
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;

--
-- Table structure for table `tabs`
--

DROP TABLE IF EXISTS `tabs`;
CREATE TABLE `tabs` (
  `id` int(11) NOT NULL auto_increment,
  `org_id` int(11) default NULL,
  `title` varchar(255) default NULL,
  `content` text,
  `position` int(11) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tabs`
--


/*!40000 ALTER TABLE `tabs` DISABLE KEYS */;
LOCK TABLES `tabs` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `tabs` ENABLE KEYS */;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) NOT NULL auto_increment,
  `first_name` varchar(255) default NULL,
  `last_name` varchar(255) default NULL,
  `street` varchar(255) default NULL,
  `street_2` varchar(255) default NULL,
  `locality` varchar(255) default NULL,
  `region` varchar(255) default NULL,
  `postal_code` varchar(255) default NULL,
  `country` varchar(255) default NULL,
  `phone` varchar(255) default NULL,
  `login` varchar(255) default NULL,
  `email` varchar(255) default NULL,
  `crypted_password` varchar(255) default NULL,
  `password_salt` varchar(255) default NULL,
  `persistence_token` varchar(255) default NULL,
  `login_count` int(11) default NULL,
  `last_request_at` datetime default NULL,
  `last_login_at` datetime default NULL,
  `current_login_at` datetime default NULL,
  `last_login_ip` varchar(255) default NULL,
  `current_login_ip` varchar(255) default NULL,
  `perishable_token` varchar(255) NOT NULL default '',
  `string` varchar(255) NOT NULL default '',
  `hq_staff` tinyint(1) default '0',
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--


/*!40000 ALTER TABLE `users` DISABLE KEYS */;
LOCK TABLES `users` WRITE;
INSERT INTO `users` VALUES (1,'Sathesh','Kumar',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'sathesh@rac.com','464e7cdb9447f96ca7c5def5ce76eeabc4c5e01742d58ac4dd0e287de3c3d7b6c5d3388918d21e3c1964450149d9f604d3ec97d7dd186f92eeaf646c4a0817d2','67342ae44042cac1912666e4e0174412969be0edc5375bc0af436e232bf26784d70dc7b6182879179a03c4e5dc594ded4cd92ba9aa08f508095a4eb555e18eb3','26130dfeac7ae19b74ceb33fc1da88ff44edbcde9fb4d040cdf9c8bb4534259adbfc85f634ff02ff65234fd83c6de4f6232f01263a67a6a8219ee607d93160b2',2,'2009-06-10 23:09:22','2009-06-10 23:05:05','2009-06-10 23:09:16','127.0.0.1','127.0.0.1','LIGiQBUKSb14dRxd0lEa','',0,'2009-06-10 23:05:05','2009-06-10 23:09:22'),(2,'Santhosh','Kumar',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'santhosh@rac.com','a5554d02d800a33fe56e02069ac0559116d3b787b2add6462d34654d48baac77ef179b66d0b2937e26fef739ed22ed4680db9135deac7da32c68b8f4f8fbb3c3','f65e6c1b793c197d956ea603a81be0d872ac34e78f9337ab172afae0b60ef2737c13a1d72b4930069cd61bee21534c87d333e1d8109800888d803fd231590d11','536106f5078ec1cd972932cc43875b5dc702212a3f83c7970004b23f44fbc941433baf03882b28d65f6add68d8ae108773b43892b4455e168da5a5c9aaa3aef3',1,'2009-06-10 23:12:41',NULL,'2009-06-10 23:10:30',NULL,'127.0.0.1','d3oMFxrlg4Vtmx6137U1','',0,'2009-06-10 23:10:30','2009-06-10 23:12:41'),(3,'kannan','kannan',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'kannan@rac.com','4eca78afb3781727e8efb7816b162347999bda7b0a65dc3e91645e0c0753d9327c74b6a962c28e566c218ba5a38c96b9df4529b95a01d7b2ac9a66329a1b2976','35fa10de03914a0a5d99fc8cfe6bb15dabc7280ac3308baf7f47c7470683e4a239fb70a5535d831f9a9397574c247122babbc631fa59ff3b7455e150f2556645','246af4ac2cd5de0ee1945b7248c6f98b380bcc8a6be9af560b83e1c8f5b58fcea9af69af7aa4daf4afa4d4684cfbec2e040dab35c39ae39c1282473c62b35eb8',1,'2009-06-10 23:14:37',NULL,'2009-06-10 23:13:08',NULL,'127.0.0.1','1xm15mClA58uKWGUjWeE','',0,'2009-06-10 23:13:08','2009-06-10 23:14:37');
UNLOCK TABLES;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

--
-- Table structure for table `videos`
--

DROP TABLE IF EXISTS `videos`;
CREATE TABLE `videos` (
  `id` int(11) NOT NULL auto_increment,
  `title` varchar(255) default NULL,
  `content` varchar(255) default NULL,
  `video_file_name` varchar(255) default NULL,
  `video_content_type` varchar(255) default NULL,
  `video_file_size` int(11) default NULL,
  `video_updated_at` datetime default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  `state` varchar(255) default NULL,
  `org_id` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `videos`
--


/*!40000 ALTER TABLE `videos` DISABLE KEYS */;
LOCK TABLES `videos` WRITE;
INSERT INTO `videos` VALUES (1,'Beer','Just for checking ','Bear.wmv','video/x-ms-wmv',4045744,'2009-06-10 23:16:06','2009-06-10 23:16:06','2009-06-10 23:16:06','pending',7);
UNLOCK TABLES;
/*!40000 ALTER TABLE `videos` ENABLE KEYS */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;


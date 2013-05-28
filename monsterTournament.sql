-- MySQL dump 10.11
--
-- Host: localhost    Database: torneosplay
-- ------------------------------------------------------
-- Server version	5.0.51b-community-nt-log

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
-- Current Database: `torneosplay`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `torneosplay` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `torneosplay`;

--
-- Table structure for table `administrador`
--

DROP TABLE IF EXISTS `administrador`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `administrador` (
  `id` int(11) NOT NULL auto_increment,
  `usuario` varchar(30) NOT NULL,
  `email` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `apellidos` varchar(30) NOT NULL,
  `avatar` varchar(100) NOT NULL default '/images/avatar/default.png',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `administrador`
--

LOCK TABLES `administrador` WRITE;
/*!40000 ALTER TABLE `administrador` DISABLE KEYS */;
INSERT INTO `administrador` VALUES (1,'paquito','prueba@falso.com','paquito','Francisco','Ramirez','/images/avatar/default.png'),(2,'she','she@prueba.com','she','Samantha','Ruiz','/images/avatar/default.png');
/*!40000 ALTER TABLE `administrador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clan`
--

DROP TABLE IF EXISTS `clan`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `clan` (
  `nombre` varchar(30) NOT NULL,
  `descripcion` varchar(400) NOT NULL,
  `creador` int(11) NOT NULL,
  `avatar` varchar(30) NOT NULL default 'clan/default.png',
  `id` int(11) NOT NULL auto_increment,
  `ganadas` int(11) NOT NULL default '0',
  `perdidas` int(11) NOT NULL default '0',
  `empatadas` int(11) NOT NULL default '0',
  `etiqueta` varchar(4) NOT NULL,
  `solicita` tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `clan`
--

LOCK TABLES `clan` WRITE;
/*!40000 ALTER TABLE `clan` DISABLE KEYS */;
INSERT INTO `clan` VALUES ('(WKYA) We will kick your asses','No temblamos ante nadie',9,'clan/1.png',1,0,0,0,'WKYA',1);
/*!40000 ALTER TABLE `clan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clan_has_juego`
--

DROP TABLE IF EXISTS `clan_has_juego`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `clan_has_juego` (
  `clan_id` int(11) NOT NULL,
  `juego_id` int(11) NOT NULL,
  PRIMARY KEY  (`clan_id`,`juego_id`),
  KEY `fk_clan_has_juego_juego1_idx` (`juego_id`),
  KEY `fk_clan_has_juego_clan1_idx` (`clan_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `clan_has_juego`
--

LOCK TABLES `clan_has_juego` WRITE;
/*!40000 ALTER TABLE `clan_has_juego` DISABLE KEYS */;
INSERT INTO `clan_has_juego` VALUES (1,1);
/*!40000 ALTER TABLE `clan_has_juego` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clan_has_partida`
--

DROP TABLE IF EXISTS `clan_has_partida`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `clan_has_partida` (
  `clan_id` int(11) NOT NULL,
  `partida_id` int(11) NOT NULL,
  `posicion` int(11) default NULL,
  PRIMARY KEY  (`clan_id`,`partida_id`),
  KEY `fk_clan_has_partida_partida1_idx` (`partida_id`),
  KEY `fk_clan_has_partida_clan1_idx` (`clan_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `clan_has_partida`
--

LOCK TABLES `clan_has_partida` WRITE;
/*!40000 ALTER TABLE `clan_has_partida` DISABLE KEYS */;
/*!40000 ALTER TABLE `clan_has_partida` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clan_has_premio`
--

DROP TABLE IF EXISTS `clan_has_premio`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `clan_has_premio` (
  `clan_id` int(11) NOT NULL,
  `premio_id` int(11) NOT NULL,
  `fechaentrega` datetime default NULL,
  PRIMARY KEY  (`clan_id`,`premio_id`),
  KEY `fk_clan_has_premio_premio1_idx` (`premio_id`),
  KEY `fk_clan_has_premio_clan_idx` (`clan_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `clan_has_premio`
--

LOCK TABLES `clan_has_premio` WRITE;
/*!40000 ALTER TABLE `clan_has_premio` DISABLE KEYS */;
/*!40000 ALTER TABLE `clan_has_premio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clan_has_torneo`
--

DROP TABLE IF EXISTS `clan_has_torneo`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `clan_has_torneo` (
  `clan_id` int(11) NOT NULL,
  `torneo_id` int(11) NOT NULL,
  `fecha` date default NULL,
  `lugar` int(11) default NULL,
  `posicion` int(11) default NULL,
  PRIMARY KEY  (`clan_id`,`torneo_id`),
  KEY `fk_clan_has_torneo_torneo1_idx` (`torneo_id`),
  KEY `fk_clan_has_torneo_clan1_idx` (`clan_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `clan_has_torneo`
--

LOCK TABLES `clan_has_torneo` WRITE;
/*!40000 ALTER TABLE `clan_has_torneo` DISABLE KEYS */;
/*!40000 ALTER TABLE `clan_has_torneo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clan_usuario`
--

DROP TABLE IF EXISTS `clan_usuario`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `clan_usuario` (
  `antiguedad` date NOT NULL,
  `clan_id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  PRIMARY KEY  (`clan_id`,`usuario_id`),
  KEY `fk_clan_usuario_clan1_idx` (`clan_id`),
  KEY `fk_clan_usuario_usuario1_idx` (`usuario_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `clan_usuario`
--

LOCK TABLES `clan_usuario` WRITE;
/*!40000 ALTER TABLE `clan_usuario` DISABLE KEYS */;
INSERT INTO `clan_usuario` VALUES ('2013-02-14',1,9);
/*!40000 ALTER TABLE `clan_usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `juego`
--

DROP TABLE IF EXISTS `juego`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `juego` (
  `id` int(11) NOT NULL auto_increment,
  `nombre` varchar(30) NOT NULL,
  `descripcion` varchar(1000) NOT NULL,
  `plataforma` varchar(30) NOT NULL default 'Multiples',
  `genero` varchar(30) NOT NULL,
  `jugadores` varchar(30) NOT NULL,
  `idioma` varchar(30) NOT NULL default 'Varios',
  `lanzamiento` varchar(50) NOT NULL,
  `imagen1` varchar(100) default NULL,
  `imagen2` varchar(100) default NULL,
  `imagen3` varchar(100) default NULL,
  `idusuario` int(11) NOT NULL,
  `validado` tinyint(1) NOT NULL,
  `administrador_id` int(11) NOT NULL,
  `video` varchar(100) default NULL,
  PRIMARY KEY  (`id`),
  KEY `fk_juego_administrador1_idx` (`administrador_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `juego`
--

LOCK TABLES `juego` WRITE;
/*!40000 ALTER TABLE `juego` DISABLE KEYS */;
INSERT INTO `juego` VALUES (1,'Uncharted 3 Drake`s Deception','Es un videojuego desarrollado por Naughty Dog y publicado por Sony Computer Entertainment. Lanzado al mercado estadounidense el 1 de noviembre de 2011. La historia se centra alrededor de Nathan Drake y su mentor Victor Sullivan que viajan alrededor del mundo buscando una legendaria ciudad perdida que finalmente les llevará a la Península Arábiga y el vasto desierto de Rub al-Jali, también conocido como el Cuarto Vacío. La legendaria ciudad perdida ha sido conocida por varios nombres, incluyendo \"Iram de las Columnas\" y el Atlantis de las Arenas. El juego se basa en las aventuras de T.E. Lawrence.','PS3','Accion','1-10','Varios','2011','1a1.jpg','1a2.jpg','1.jpg',9,1,1,'http://www.youtube.com/watch?v=DHHcM6aHPnE');
/*!40000 ALTER TABLE `juego` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `juego_has_usuario`
--

DROP TABLE IF EXISTS `juego_has_usuario`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `juego_has_usuario` (
  `juego_id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `fechadeinicio` date default NULL,
  PRIMARY KEY  (`juego_id`,`usuario_id`),
  KEY `fk_juego_has_usuario_usuario1_idx` (`usuario_id`),
  KEY `fk_juego_has_usuario_juego1_idx` (`juego_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `juego_has_usuario`
--

LOCK TABLES `juego_has_usuario` WRITE;
/*!40000 ALTER TABLE `juego_has_usuario` DISABLE KEYS */;
INSERT INTO `juego_has_usuario` VALUES (1,9,'2012-05-14'),(1,8,'2013-05-15'),(1,7,'2013-05-13'),(1,6,'2013-05-13');
/*!40000 ALTER TABLE `juego_has_usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mensaje_amigo`
--

DROP TABLE IF EXISTS `mensaje_amigo`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mensaje_amigo` (
  `id` int(11) NOT NULL auto_increment,
  `idusuario` int(11) default NULL,
  `idamigo` int(11) default NULL,
  `asunto` varchar(30) default NULL,
  `email` varchar(30) default NULL,
  `sitio` varchar(50) default NULL,
  `mensaje` varchar(1000) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mensaje_amigo`
--

LOCK TABLES `mensaje_amigo` WRITE;
/*!40000 ALTER TABLE `mensaje_amigo` DISABLE KEYS */;
INSERT INTO `mensaje_amigo` VALUES (1,7,8,'CW','r9dolfinho@hotmail.com','www.facebook.com/r9software','CW');
/*!40000 ALTER TABLE `mensaje_amigo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `partida`
--

DROP TABLE IF EXISTS `partida`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `partida` (
  `id` int(11) NOT NULL auto_increment,
  `tipo` int(11) NOT NULL,
  `fecha` datetime NOT NULL,
  `ronda` int(11) NOT NULL,
  `ganador` int(11) default NULL,
  `participantes` int(11) default NULL,
  `torneo_id` int(11) NOT NULL,
  PRIMARY KEY  (`id`,`torneo_id`),
  KEY `fk_partida_torneo1_idx` (`torneo_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `partida`
--

LOCK TABLES `partida` WRITE;
/*!40000 ALTER TABLE `partida` DISABLE KEYS */;
INSERT INTO `partida` VALUES (1,1,'2013-05-14 13:08:30',1,8,3,1),(2,1,'2013-05-16 13:09:10',2,7,3,1),(3,1,'2013-05-20 13:13:37',3,8,3,1);
/*!40000 ALTER TABLE `partida` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `premio`
--

DROP TABLE IF EXISTS `premio`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `premio` (
  `id` int(11) NOT NULL auto_increment,
  `descripcion` varchar(300) NOT NULL,
  `referencia` varchar(30) NOT NULL,
  `tipo` varchar(30) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `premio`
--

LOCK TABLES `premio` WRITE;
/*!40000 ALTER TABLE `premio` DISABLE KEYS */;
INSERT INTO `premio` VALUES (1,'Tarjeta de $10','xasd-axafas-xasfd','Premio individual');
/*!40000 ALTER TABLE `premio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `solicitud_amigo`
--

DROP TABLE IF EXISTS `solicitud_amigo`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `solicitud_amigo` (
  `id` int(11) NOT NULL auto_increment,
  `idusuario` int(11) default NULL,
  `idamigo` int(11) default NULL,
  `nombre` varchar(30) default NULL,
  `email` varchar(30) default NULL,
  `sitio` varchar(50) default NULL,
  `mensaje` varchar(1000) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `solicitud_amigo`
--

LOCK TABLES `solicitud_amigo` WRITE;
/*!40000 ALTER TABLE `solicitud_amigo` DISABLE KEYS */;
INSERT INTO `solicitud_amigo` VALUES (1,7,9,'usuario2','r9dolfinho@hotmail.com','www.facebook.com/r9software','                            Hola soy usuario2 y me gustaria añadirte como amigo :)\r\n                            ');
/*!40000 ALTER TABLE `solicitud_amigo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo`
--

DROP TABLE IF EXISTS `tipo`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `tipo` (
  `id` int(11) NOT NULL auto_increment,
  `nombre` varchar(30) NOT NULL,
  `descripcion` varchar(400) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `tipo`
--

LOCK TABLES `tipo` WRITE;
/*!40000 ALTER TABLE `tipo` DISABLE KEYS */;
INSERT INTO `tipo` VALUES (1,'Todos contra todos','Cada uno de los usuarios decide como equiparse en esta batalla de todos contra todos');
/*!40000 ALTER TABLE `tipo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `torneo`
--

DROP TABLE IF EXISTS `torneo`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `torneo` (
  `id` int(11) NOT NULL auto_increment,
  `nombre` varchar(30) NOT NULL,
  `descripcion` varchar(400) NOT NULL,
  `fechadeinicio` datetime NOT NULL,
  `fechatermino` datetime NOT NULL,
  `participantes` int(11) NOT NULL,
  `gratuito` tinyint(1) NOT NULL,
  `numeropartidas` int(11) NOT NULL,
  `tipo_id` int(11) NOT NULL,
  `premio_id` int(11) NOT NULL,
  `administrador_id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `juego_id` int(11) NOT NULL,
  `activo` tinyint(1) NOT NULL default '1',
  PRIMARY KEY  (`id`),
  KEY `fk_torneo_tipo1_idx` (`tipo_id`),
  KEY `fk_torneo_premio1_idx` (`premio_id`),
  KEY `fk_torneo_administrador1_idx` (`administrador_id`),
  KEY `fk_torneo_usuario1_idx` (`usuario_id`),
  KEY `fk_torneo_juego1_idx` (`juego_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `torneo`
--

LOCK TABLES `torneo` WRITE;
/*!40000 ALTER TABLE `torneo` DISABLE KEYS */;
INSERT INTO `torneo` VALUES (1,'TorneoU3','Torneo de uncharted 3','2013-05-14 12:36:21','2013-05-21 12:36:26',3,1,3,1,1,1,7,1,1);
/*!40000 ALTER TABLE `torneo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `torneo_clan`
--

DROP TABLE IF EXISTS `torneo_clan`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `torneo_clan` (
  `id` int(11) NOT NULL auto_increment,
  `nombre` varchar(30) NOT NULL,
  `descripcion` varchar(400) NOT NULL,
  `administrador` int(11) NOT NULL,
  `fechadeinicio` datetime NOT NULL,
  `fechatermino` datetime NOT NULL,
  `participantes` int(11) NOT NULL,
  `gratuito` tinyint(1) NOT NULL,
  `numeropartidas` int(11) NOT NULL,
  `tipo_id` int(11) NOT NULL,
  `premio_id` int(11) NOT NULL,
  `administrador_id` int(11) NOT NULL,
  `clan_id` int(11) NOT NULL,
  `juego_id` int(11) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `fk_torneo_tipo1_idx` (`tipo_id`),
  KEY `fk_torneo_premio1_idx` (`premio_id`),
  KEY `fk_torneo_administrador1_idx` (`administrador_id`),
  KEY `fk_torneo_clan1_idx` (`clan_id`),
  KEY `fk_torneo_juego1_idx` (`juego_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `torneo_clan`
--

LOCK TABLES `torneo_clan` WRITE;
/*!40000 ALTER TABLE `torneo_clan` DISABLE KEYS */;
/*!40000 ALTER TABLE `torneo_clan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `usuario` (
  `id` int(11) NOT NULL auto_increment,
  `usuario` varchar(30) NOT NULL,
  `email` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `apellidos` varchar(30) NOT NULL,
  `avatar` varchar(100) NOT NULL default 'images/avatar/default.png',
  `ganadas` int(11) NOT NULL default '0',
  `perdidas` int(11) NOT NULL default '0',
  `empatadas` int(11) NOT NULL default '0',
  `clan_id` int(11) default NULL,
  `torneosganados` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (6,'usuario1','usuario1@ejemplo.com','usuario1','usuario1','usuario1','images/avatar/default.png',0,3,0,0,0),(7,'usuario2','usuario2@ejemplo.com','usuario2','usuario2','usuario2','images/avatar/default.png',1,2,0,0,0),(8,'usuario3','usuario3@ejemplo.com','usuario3','usuario3','usuario3','images/avatar/default.png',2,1,0,0,1),(9,'r9software','r9software@facebook.com','rodolfo','Rodolfo','Abarca Rodriguez','images/avatar/1.png',0,0,0,1,0);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario_has_partida`
--

DROP TABLE IF EXISTS `usuario_has_partida`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `usuario_has_partida` (
  `usuario_id` int(11) NOT NULL,
  `partida_id` int(11) NOT NULL,
  `posicion` int(11) default NULL,
  PRIMARY KEY  (`usuario_id`,`partida_id`),
  KEY `fk_usuario_has_partida_partida1_idx` (`partida_id`),
  KEY `fk_usuario_has_partida_usuario1_idx` (`usuario_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `usuario_has_partida`
--

LOCK TABLES `usuario_has_partida` WRITE;
/*!40000 ALTER TABLE `usuario_has_partida` DISABLE KEYS */;
INSERT INTO `usuario_has_partida` VALUES (6,1,3),(7,1,2),(8,1,1),(6,2,2),(7,2,1),(8,2,3),(6,3,3),(7,3,2),(8,3,1);
/*!40000 ALTER TABLE `usuario_has_partida` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario_has_premio`
--

DROP TABLE IF EXISTS `usuario_has_premio`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `usuario_has_premio` (
  `usuario_id` int(11) NOT NULL,
  `premio_id` int(11) NOT NULL,
  `fechaentrega` datetime default NULL,
  PRIMARY KEY  (`usuario_id`,`premio_id`),
  KEY `fk_usuario_has_premio_premio1_idx` (`premio_id`),
  KEY `fk_usuario_has_premio_usuario1_idx` (`usuario_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `usuario_has_premio`
--

LOCK TABLES `usuario_has_premio` WRITE;
/*!40000 ALTER TABLE `usuario_has_premio` DISABLE KEYS */;
INSERT INTO `usuario_has_premio` VALUES (8,1,'2013-05-14 13:30:40');
/*!40000 ALTER TABLE `usuario_has_premio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario_has_torneo`
--

DROP TABLE IF EXISTS `usuario_has_torneo`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `usuario_has_torneo` (
  `usuario_id` int(11) NOT NULL,
  `torneo_id` int(11) NOT NULL,
  `fecha` date default NULL,
  `posicion` int(11) default NULL,
  PRIMARY KEY  (`usuario_id`,`torneo_id`),
  KEY `fk_usuario_has_torneo_torneo1_idx` (`torneo_id`),
  KEY `fk_usuario_has_torneo_usuario1_idx` (`usuario_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `usuario_has_torneo`
--

LOCK TABLES `usuario_has_torneo` WRITE;
/*!40000 ALTER TABLE `usuario_has_torneo` DISABLE KEYS */;
INSERT INTO `usuario_has_torneo` VALUES (6,1,'2013-05-21',3),(7,1,'2013-05-21',2),(8,1,'2013-05-21',1);
/*!40000 ALTER TABLE `usuario_has_torneo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario_has_usuario`
--

DROP TABLE IF EXISTS `usuario_has_usuario`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `usuario_has_usuario` (
  `usuario_id` int(11) NOT NULL,
  `usuario_id1` int(11) NOT NULL,
  KEY `fk_usuario_has_usuario_usuario2_idx` (`usuario_id1`),
  KEY `fk_usuario_has_usuario_usuario1_idx` (`usuario_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `usuario_has_usuario`
--

LOCK TABLES `usuario_has_usuario` WRITE;
/*!40000 ALTER TABLE `usuario_has_usuario` DISABLE KEYS */;
INSERT INTO `usuario_has_usuario` VALUES (7,8),(7,6),(6,8),(6,7),(8,6),(8,7);
/*!40000 ALTER TABLE `usuario_has_usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-05-28  6:56:29

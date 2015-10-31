# ************************************************************
# Sequel Pro SQL dump
# Version 4096
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# Host: 127.0.0.1 (MySQL 5.6.20)
# Database: colima
# Generation Time: 2015-10-31 05:32:25 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table admin
# ------------------------------------------------------------

DROP TABLE IF EXISTS `admin`;

CREATE TABLE `admin` (
  `nombre_usr` varchar(10) NOT NULL,
  `pwd` varchar(12) NOT NULL,
  PRIMARY KEY (`nombre_usr`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;

INSERT INTO `admin` (`nombre_usr`, `pwd`)
VALUES
	('admin1','1234');

/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table auth_group
# ------------------------------------------------------------

DROP TABLE IF EXISTS `auth_group`;

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table auth_group_permissions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `auth_group_permissions`;

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `auth_group__permission_id_1f49ccbbdc69d2fc_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_group__permission_id_1f49ccbbdc69d2fc_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permission_group_id_689710a9a73b7457_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table auth_permission
# ------------------------------------------------------------

DROP TABLE IF EXISTS `auth_permission`;

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  CONSTRAINT `auth__content_type_id_508cf46651277a81_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`)
VALUES
	(1,'Can add log entry',1,'add_logentry'),
	(2,'Can change log entry',1,'change_logentry'),
	(3,'Can delete log entry',1,'delete_logentry'),
	(4,'Can add permission',2,'add_permission'),
	(5,'Can change permission',2,'change_permission'),
	(6,'Can delete permission',2,'delete_permission'),
	(7,'Can add group',3,'add_group'),
	(8,'Can change group',3,'change_group'),
	(9,'Can delete group',3,'delete_group'),
	(10,'Can add user',4,'add_user'),
	(11,'Can change user',4,'change_user'),
	(12,'Can delete user',4,'delete_user'),
	(13,'Can add content type',5,'add_contenttype'),
	(14,'Can change content type',5,'change_contenttype'),
	(15,'Can delete content type',5,'delete_contenttype'),
	(16,'Can add session',6,'add_session'),
	(17,'Can change session',6,'change_session'),
	(18,'Can delete session',6,'delete_session'),
	(19,'Can add categoria',7,'add_categoria'),
	(20,'Can change categoria',7,'change_categoria'),
	(21,'Can delete categoria',7,'delete_categoria'),
	(22,'Can add admin',8,'add_admin'),
	(23,'Can change admin',8,'change_admin'),
	(24,'Can delete admin',8,'delete_admin'),
	(25,'Can add participacion',9,'add_participacion'),
	(26,'Can change participacion',9,'change_participacion'),
	(27,'Can delete participacion',9,'delete_participacion'),
	(28,'Can add pregunta',10,'add_pregunta'),
	(29,'Can change pregunta',10,'change_pregunta'),
	(30,'Can delete pregunta',10,'delete_pregunta'),
	(31,'Can add reporte',11,'add_reporte'),
	(32,'Can change reporte',11,'change_reporte'),
	(33,'Can delete reporte',11,'delete_reporte');

/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table auth_user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `auth_user`;

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table auth_user_groups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `auth_user_groups`;

CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_33ac548dcf5f8e37_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_33ac548dcf5f8e37_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_4b5ed4ffdb8fd9b0_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table auth_user_user_permissions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `auth_user_user_permissions`;

CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `auth_user_u_permission_id_384b62483d7071f0_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_user_u_permission_id_384b62483d7071f0_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissi_user_id_7f0938558328534a_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table Categoria
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Categoria`;

CREATE TABLE `Categoria` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `Categoria` WRITE;
/*!40000 ALTER TABLE `Categoria` DISABLE KEYS */;

INSERT INTO `Categoria` (`id`, `nombre`)
VALUES
	(1,'salud'),
	(2,'infraestructura'),
	(3,'senado'),
	(4,'leyes'),
	(5,'Arte y Ciencia');

/*!40000 ALTER TABLE `Categoria` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table django_admin_log
# ------------------------------------------------------------

DROP TABLE IF EXISTS `django_admin_log`;

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `djang_content_type_id_697914295151027a_fk_django_content_type_id` (`content_type_id`),
  KEY `django_admin_log_user_id_52fdd58701c5f563_fk_auth_user_id` (`user_id`),
  CONSTRAINT `djang_content_type_id_697914295151027a_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_52fdd58701c5f563_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table django_content_type
# ------------------------------------------------------------

DROP TABLE IF EXISTS `django_content_type`;

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_45f3b1d93ec8c61c_uniq` (`app_label`,`model`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;

INSERT INTO `django_content_type` (`id`, `app_label`, `model`)
VALUES
	(1,'admin','logentry'),
	(3,'auth','group'),
	(2,'auth','permission'),
	(4,'auth','user'),
	(8,'colimaApp','admin'),
	(7,'colimaApp','categoria'),
	(9,'colimaApp','participacion'),
	(10,'colimaApp','pregunta'),
	(11,'colimaApp','reporte'),
	(5,'contenttypes','contenttype'),
	(6,'sessions','session');

/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table django_migrations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `django_migrations`;

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`)
VALUES
	(1,'contenttypes','0001_initial','2015-10-27 00:52:25.179329'),
	(2,'auth','0001_initial','2015-10-27 00:52:27.861530'),
	(3,'admin','0001_initial','2015-10-27 00:52:28.486848'),
	(4,'contenttypes','0002_remove_content_type_name','2015-10-27 00:52:28.910846'),
	(5,'auth','0002_alter_permission_name_max_length','2015-10-27 00:52:29.157589'),
	(6,'auth','0003_alter_user_email_max_length','2015-10-27 00:52:29.371801'),
	(7,'auth','0004_alter_user_username_opts','2015-10-27 00:52:29.387574'),
	(8,'auth','0005_alter_user_last_login_null','2015-10-27 00:52:29.593745'),
	(9,'auth','0006_require_contenttypes_0002','2015-10-27 00:52:29.596638'),
	(10,'colimaApp','0001_initial','2015-10-27 00:52:29.619193'),
	(11,'sessions','0001_initial','2015-10-27 00:52:30.030844');

/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table django_session
# ------------------------------------------------------------

DROP TABLE IF EXISTS `django_session`;

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table participacion
# ------------------------------------------------------------

DROP TABLE IF EXISTS `participacion`;

CREATE TABLE `participacion` (
  `idPart` int(11) NOT NULL AUTO_INCREMENT,
  `descrip` varchar(20) NOT NULL,
  PRIMARY KEY (`idPart`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `participacion` WRITE;
/*!40000 ALTER TABLE `participacion` DISABLE KEYS */;

INSERT INTO `participacion` (`idPart`, `descrip`)
VALUES
	(1,'YO SUEÑO'),
	(2,'YO PROPONGO'),
	(3,'YO PARTICIPO');

/*!40000 ALTER TABLE `participacion` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table pregunta
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pregunta`;

CREATE TABLE `pregunta` (
  `idPregunta` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(200) NOT NULL,
  `latitud` float NOT NULL,
  `longitud` float NOT NULL,
  `urlVideo` varchar(200) DEFAULT NULL,
  `nombre` varchar(50) NOT NULL,
  `email` varchar(24) NOT NULL,
  `telefono` varchar(12) NOT NULL,
  `fecha` datetime NOT NULL,
  `contMail` tinyint(4) NOT NULL DEFAULT '0',
  `contTelefono` tinyint(4) NOT NULL DEFAULT '0',
  `contAmbos` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idPregunta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `pregunta` WRITE;
/*!40000 ALTER TABLE `pregunta` DISABLE KEYS */;

INSERT INTO `pregunta` (`idPregunta`, `descripcion`, `latitud`, `longitud`, `urlVideo`, `nombre`, `email`, `telefono`, `fecha`, `contMail`, `contTelefono`, `contAmbos`)
VALUES
	(1,'hola',5646.58,0.5847,'www.youtube.com','hollywood reichter','abc@live.com','57145522','2015-10-27 23:20:21',0,0,0),
	(2,'something cooler',1,2,'www.facebook.com','hollywood reichter','rana@rene.de','58155623','2015-10-27 23:21:08',0,0,1),
	(3,'bache?',5646.58,0.5847,'www.youtube.com','bambina chanel','abc@live.com','57145522','2015-10-27 23:21:58',1,0,0),
	(4,'bache?',5646.58,0.5847,'www.youtube.com','bambina chanel','abc@live.com','57145522','2015-10-27 23:31:43',0,1,0),
	(5,'bache?',5646.58,0.5847,'www.youtube.com','bambina chanel','abc@live.com','57145522','2015-10-27 23:31:53',1,1,0),
	(6,'bache?',5646.58,0.5847,'www.youtube.com','bambina chanel','abc@live.com','57145522','2015-10-27 23:32:29',1,0,0),
	(7,'por que el cielo es azul?',19.4873,-99.1548,'www.cooker.video.stark','Francelia Le Marshal','frau@hotmail.com','123456','2015-10-31 03:52:58',1,0,0);

/*!40000 ALTER TABLE `pregunta` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table reporte
# ------------------------------------------------------------

DROP TABLE IF EXISTS `reporte`;

CREATE TABLE `reporte` (
  `idReporte` int(11) NOT NULL AUTO_INCREMENT,
  `tipoPart` int(11) NOT NULL,
  `categoria_id` int(11) NOT NULL,
  `descripcion` varchar(200) NOT NULL,
  `latitud` float NOT NULL,
  `longitud` float NOT NULL,
  `urlVideo` varchar(200) DEFAULT 'na',
  `nombre` varchar(50) NOT NULL DEFAULT '',
  `email` varchar(24) NOT NULL DEFAULT '',
  `telefono` varchar(12) NOT NULL DEFAULT '',
  `fecha` datetime NOT NULL,
  `contMail` tinyint(4) NOT NULL DEFAULT '1',
  `contTelefono` tinyint(4) NOT NULL DEFAULT '0',
  `contAmbos` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idReporte`),
  KEY `tipoPart` (`tipoPart`),
  KEY `categoria_id` (`categoria_id`),
  CONSTRAINT `reporte_ibfk_1` FOREIGN KEY (`tipoPart`) REFERENCES `participacion` (`idPart`),
  CONSTRAINT `reporte_ibfk_2` FOREIGN KEY (`categoria_id`) REFERENCES `Categoria` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `reporte` WRITE;
/*!40000 ALTER TABLE `reporte` DISABLE KEYS */;

INSERT INTO `reporte` (`idReporte`, `tipoPart`, `categoria_id`, `descripcion`, `latitud`, `longitud`, `urlVideo`, `nombre`, `email`, `telefono`, `fecha`, `contMail`, `contTelefono`, `contAmbos`)
VALUES
	(1,2,1,'ewe',19.4883,-99.1349,'na','sebastian','hola@outllok','58155623','2015-02-12 00:00:00',1,0,0),
	(2,1,2,'heil',19.4871,-99.1331,'na','lerdo','faklfads','65464','2015-05-09 00:00:00',1,0,0),
	(3,1,1,'dfas',19.4878,-99.1345,'na','de tejada','fdadfas','49849','2015-07-06 00:00:00',1,0,0),
	(4,1,2,'sdfa',19.4893,-99.1546,'fdas','fads','','545125','2015-10-31 02:54:25',1,0,0),
	(5,2,1,'más hospitales',19.4893,-99.1546,'www.facebook.com','stark','bren','254156','2015-10-31 02:57:50',1,0,0),
	(6,3,1,'más gyms',19.4893,-99.1546,'www.stark.com','alguien','some@hotmail.com','57145522','2015-10-31 03:11:00',1,0,0),
	(7,1,2,'gatos',19.4893,-99.1546,'www.xmas,com','petra juls','part@hotmail.vom','456788','2015-10-31 05:28:57',1,0,0);

/*!40000 ALTER TABLE `reporte` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

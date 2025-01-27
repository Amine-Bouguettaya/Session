-- --------------------------------------------------------
-- Hôte:                         127.0.0.1
-- Version du serveur:           8.0.30 - MySQL Community Server - GPL
-- SE du serveur:                Win64
-- HeidiSQL Version:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Listage de la structure de la base pour session_amine
CREATE DATABASE IF NOT EXISTS `session_amine` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `session_amine`;

-- Listage de la structure de table session_amine. category
CREATE TABLE IF NOT EXISTS `category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name_category` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table session_amine.category : ~4 rows (environ)
INSERT INTO `category` (`id`, `name_category`) VALUES
	(1, 'Bureautique'),
	(2, 'Infophraphie'),
	(3, 'Développement web');

-- Listage de la structure de table session_amine. doctrine_migration_versions
CREATE TABLE IF NOT EXISTS `doctrine_migration_versions` (
  `version` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- Listage des données de la table session_amine.doctrine_migration_versions : ~2 rows (environ)
INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
	('DoctrineMigrations\\Version20250123103639', '2025-01-23 10:36:55', 253),
	('DoctrineMigrations\\Version20250123104216', '2025-01-23 10:42:20', 11),
	('DoctrineMigrations\\Version20250127142427', '2025-01-27 14:24:45', 144),
	('DoctrineMigrations\\Version20250127145449', '2025-01-27 14:55:00', 21),
	('DoctrineMigrations\\Version20250127145712', '2025-01-27 14:57:17', 9),
	('DoctrineMigrations\\Version20250127152406', '2025-01-27 15:24:14', 12);

-- Listage de la structure de table session_amine. formation
CREATE TABLE IF NOT EXISTS `formation` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name_formation` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table session_amine.formation : ~4 rows (environ)
INSERT INTO `formation` (`id`, `name_formation`) VALUES
	(1, 'DWWM'),
	(2, 'Comptable'),
	(3, 'RH'),
	(4, 'CDA'),
	(10, 'dsds');

-- Listage de la structure de table session_amine. messenger_messages
CREATE TABLE IF NOT EXISTS `messenger_messages` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `body` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `headers` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue_name` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `available_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `delivered_at` datetime DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)',
  PRIMARY KEY (`id`),
  KEY `IDX_75EA56E0FB7336F0` (`queue_name`),
  KEY `IDX_75EA56E0E3BD61CE` (`available_at`),
  KEY `IDX_75EA56E016BA31DB` (`delivered_at`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table session_amine.messenger_messages : ~0 rows (environ)
INSERT INTO `messenger_messages` (`id`, `body`, `headers`, `queue_name`, `created_at`, `available_at`, `delivered_at`) VALUES
	(1, 'O:36:\\"Symfony\\\\Component\\\\Messenger\\\\Envelope\\":2:{s:44:\\"\\0Symfony\\\\Component\\\\Messenger\\\\Envelope\\0stamps\\";a:1:{s:46:\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\";a:1:{i:0;O:46:\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\":1:{s:55:\\"\\0Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\0busName\\";s:21:\\"messenger.bus.default\\";}}}s:45:\\"\\0Symfony\\\\Component\\\\Messenger\\\\Envelope\\0message\\";O:51:\\"Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\":2:{s:60:\\"\\0Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\0message\\";O:39:\\"Symfony\\\\Bridge\\\\Twig\\\\Mime\\\\TemplatedEmail\\":5:{i:0;s:41:\\"registration/confirmation_email.html.twig\\";i:1;N;i:2;a:3:{s:9:\\"signedUrl\\";s:173:\\"http://127.0.0.1:8000/verify/email?expires=1737995197&signature=lva%2FSKSy%2Ff6xuADR3NKD1RgKlYqPFU9PPLWU%2F4E47O8%3D&token=o4Fk%2BjtMNsbFuZ%2FsUS2OdEGuxdaGPvJrZVgUp9vlzvc%3D\\";s:19:\\"expiresAtMessageKey\\";s:26:\\"%count% hour|%count% hours\\";s:20:\\"expiresAtMessageData\\";a:1:{s:7:\\"%count%\\";i:1;}}i:3;a:6:{i:0;N;i:1;N;i:2;N;i:3;N;i:4;a:0:{}i:5;a:2:{i:0;O:37:\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\":2:{s:46:\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\0headers\\";a:3:{s:4:\\"from\\";a:1:{i:0;O:47:\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\":5:{s:50:\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\";s:4:\\"From\\";s:56:\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\";i:76;s:50:\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\";N;s:53:\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\";s:5:\\"utf-8\\";s:58:\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\0addresses\\";a:1:{i:0;O:30:\\"Symfony\\\\Component\\\\Mime\\\\Address\\":2:{s:39:\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0address\\";s:19:\\"admin@traintrack.fr\\";s:36:\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0name\\";s:14:\\"TrainTrack Bot\\";}}}}s:2:\\"to\\";a:1:{i:0;O:47:\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\":5:{s:50:\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\";s:2:\\"To\\";s:56:\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\";i:76;s:50:\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\";N;s:53:\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\";s:5:\\"utf-8\\";s:58:\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\0addresses\\";a:1:{i:0;O:30:\\"Symfony\\\\Component\\\\Mime\\\\Address\\":2:{s:39:\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0address\\";s:13:\\"amine@test.fr\\";s:36:\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0name\\";s:0:\\"\\";}}}}s:7:\\"subject\\";a:1:{i:0;O:48:\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\UnstructuredHeader\\":5:{s:50:\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\";s:7:\\"Subject\\";s:56:\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\";i:76;s:50:\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\";N;s:53:\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\";s:5:\\"utf-8\\";s:55:\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\UnstructuredHeader\\0value\\";s:25:\\"Please Confirm your Email\\";}}}s:49:\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\0lineLength\\";i:76;}i:1;N;}}i:4;N;}s:61:\\"\\0Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\0envelope\\";N;}}', '[]', 'default', '2025-01-27 15:26:37', '2025-01-27 15:26:37', NULL);

-- Listage de la structure de table session_amine. module
CREATE TABLE IF NOT EXISTS `module` (
  `id` int NOT NULL AUTO_INCREMENT,
  `category_id` int DEFAULT NULL,
  `name_module` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_C24262812469DE2` (`category_id`),
  CONSTRAINT `FK_C24262812469DE2` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table session_amine.module : ~6 rows (environ)
INSERT INTO `module` (`id`, `category_id`, `name_module`) VALUES
	(1, 1, 'Word'),
	(2, 1, 'Excel'),
	(3, 1, 'PowerPoint'),
	(4, 3, 'HTML'),
	(5, 3, 'CSS'),
	(6, 3, 'JavaScript'),
	(7, 3, 'PHP'),
	(8, 3, 'blablabla');

-- Listage de la structure de table session_amine. programme
CREATE TABLE IF NOT EXISTS `programme` (
  `id` int NOT NULL AUTO_INCREMENT,
  `module_id` int DEFAULT NULL,
  `session_id` int DEFAULT NULL,
  `nb_jour` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_3DDCB9FFAFC2B591` (`module_id`),
  KEY `IDX_3DDCB9FF613FECDF` (`session_id`),
  CONSTRAINT `FK_3DDCB9FF613FECDF` FOREIGN KEY (`session_id`) REFERENCES `session` (`id`),
  CONSTRAINT `FK_3DDCB9FFAFC2B591` FOREIGN KEY (`module_id`) REFERENCES `module` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table session_amine.programme : ~14 rows (environ)
INSERT INTO `programme` (`id`, `module_id`, `session_id`, `nb_jour`) VALUES
	(1, 2, 4, 4),
	(2, 2, 3, 4),
	(3, 3, 4, 3),
	(4, 3, 3, 3),
	(5, 4, 1, 5),
	(6, 4, 2, 5),
	(7, 5, 1, 4),
	(8, 5, 2, 4),
	(10, 6, 2, 5),
	(11, 1, 5, 3),
	(12, 1, 6, 3),
	(13, 7, 8, 10),
	(14, 7, 7, 10),
	(15, 3, 1, 32),
	(17, 1, 3, 12),
	(19, 4, 4, 23);

-- Listage de la structure de table session_amine. session
CREATE TABLE IF NOT EXISTS `session` (
  `id` int NOT NULL AUTO_INCREMENT,
  `formation_id` int DEFAULT NULL,
  `name_session` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_debut` datetime NOT NULL,
  `date_fin` datetime NOT NULL,
  `nb_place` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_D044D5D45200282E` (`formation_id`),
  CONSTRAINT `FK_D044D5D45200282E` FOREIGN KEY (`formation_id`) REFERENCES `formation` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table session_amine.session : ~8 rows (environ)
INSERT INTO `session` (`id`, `formation_id`, `name_session`, `date_debut`, `date_fin`, `nb_place`) VALUES
	(1, 1, 'DEV WEB Mulhouse Fevrier 2025', '2025-02-01 08:30:00', '2025-05-23 17:00:00', 10),
	(2, 1, 'DEV WEB Strasbourg Fevrier 2025', '2025-02-01 08:30:00', '2025-05-23 17:00:00', 10),
	(3, 2, 'Comptable Strasbourg Fevrier 2025', '2025-02-01 08:30:00', '2025-05-23 17:00:00', 8),
	(4, 2, 'Comptable Mulhouse Fevrier 2025', '2025-02-01 08:30:00', '2025-05-23 17:00:00', 8),
	(5, 3, 'RH Mulhouse Fevrier 2025', '2025-02-01 08:30:00', '2025-05-23 17:00:00', 12),
	(6, 3, 'RH Strasbourg Fevrier 2025', '2025-02-01 08:30:00', '2025-05-23 17:00:00', 12),
	(7, 4, 'CDA Strasbourg Fevrier 2025', '2025-02-01 08:30:00', '2025-05-23 17:00:00', 14),
	(8, 4, 'CDA Mulhouse Fevrier 2025', '2025-02-01 08:30:00', '2025-05-23 17:00:00', 14),
	(9, 1, 'DEV WEB Mulhouse Fevrier 2024', '2024-02-01 08:30:00', '2024-05-23 17:00:00', 13),
	(10, 2, 'Comptable Mulhouse Novembre 2024', '2024-01-11 08:30:00', '2025-01-23 17:00:00', 9),
	(11, 3, 'RH Strasbourg Janvier 2024', '2024-01-01 08:30:00', '2025-04-24 17:00:00', 14),
	(23, 10, 'dsfds', '2022-01-01 00:00:00', '2022-01-01 00:00:00', 23);

-- Listage de la structure de table session_amine. session_stagiaire
CREATE TABLE IF NOT EXISTS `session_stagiaire` (
  `session_id` int NOT NULL,
  `stagiaire_id` int NOT NULL,
  PRIMARY KEY (`session_id`,`stagiaire_id`),
  KEY `IDX_C80B23B613FECDF` (`session_id`),
  KEY `IDX_C80B23BBBA93DD6` (`stagiaire_id`),
  CONSTRAINT `FK_C80B23B613FECDF` FOREIGN KEY (`session_id`) REFERENCES `session` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_C80B23BBBA93DD6` FOREIGN KEY (`stagiaire_id`) REFERENCES `stagiaire` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table session_amine.session_stagiaire : ~2 rows (environ)
INSERT INTO `session_stagiaire` (`session_id`, `stagiaire_id`) VALUES
	(1, 1),
	(1, 5),
	(2, 2),
	(3, 3);

-- Listage de la structure de table session_amine. stagiaire
CREATE TABLE IF NOT EXISTS `stagiaire` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `prenom` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `civilite` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `adresse` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `cp` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ville` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `telephone` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table session_amine.stagiaire : ~3 rows (environ)
INSERT INTO `stagiaire` (`id`, `nom`, `prenom`, `email`, `civilite`, `adresse`, `cp`, `ville`, `telephone`, `avatar`) VALUES
	(1, 'bouu', 'Amine', 'amine@test.fr', 'M.', '10 rue de la gare', '68100', 'Mulhouse', '0606060606', NULL),
	(2, 'personne1nom', 'personne1prenom', 'personne@test.fr', 'Mme', '13 rue du Rhin', '68100', 'Mulhouse', '0606060606', NULL),
	(3, 'personne2', 'personne2', 'personne2@exemple.fr', 'M.', '22 rue de la gare', '68200', 'Mulhouse', '0707070707', NULL),
	(4, 'personne4', 'personne4prenom', 'pers4@exemple.fr', 'Mme', '232 rue de strasbourg', '68100', 'Mulhouse', '0101010101', NULL),
	(5, 'Testt', 'testttaaa', 'test@exemple.fr', 'M.', '10 rue des gauffres', '68100', 'Mulhouse', '0303030303', NULL),
	(6, 'test6', 'test6', 'test6@exemple.fr', 'M.', '133 rue des chenilles', '68100', 'Mulhouse', '0101010101', NULL),
	(7, 'test8', 'test8', 'test8@test.fr', 'M.', '222 rue des ', '681700', 'Strasbourg', '0202020202', NULL),
	(8, 'test9', 'test9', 'test9@test.fr', 'Mme', '23 rue ', '67000', 'Strasbourg', '0000000000', NULL),
	(14, 'Nouveau', 'Nouveau', 'nouveau@exemple.fr', 'M.', '133 rue des chenilles', '68100', 'Mulhouse', '0101010101', NULL);

-- Listage de la structure de table session_amine. user
CREATE TABLE IF NOT EXISTS `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` json NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nom` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prenom` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_verified` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_IDENTIFIER_EMAIL` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table session_amine.user : ~1 rows (environ)
INSERT INTO `user` (`id`, `email`, `roles`, `password`, `nom`, `prenom`, `is_verified`) VALUES
	(1, 'amine@test.fr', '[]', '$2y$13$1iNIqAecuLNiehOr8dHTi.ECcqlhSrbPMLwCW/eYQLAx0k29albBa', 'amine', 'amine', 1);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;

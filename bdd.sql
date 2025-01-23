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
  `name_category` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table session_amine.category : ~3 rows (environ)
INSERT INTO `category` (`id`, `name_category`) VALUES
	(1, 'Bureautique'),
	(2, 'Infophraphie'),
	(3, 'Développement web'),
	(4, 'Test');

-- Listage de la structure de table session_amine. doctrine_migration_versions
CREATE TABLE IF NOT EXISTS `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8mb3_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- Listage des données de la table session_amine.doctrine_migration_versions : ~2 rows (environ)
INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
	('DoctrineMigrations\\Version20250123103639', '2025-01-23 10:36:55', 253),
	('DoctrineMigrations\\Version20250123104216', '2025-01-23 10:42:20', 11);

-- Listage de la structure de table session_amine. formation
CREATE TABLE IF NOT EXISTS `formation` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name_formation` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table session_amine.formation : ~4 rows (environ)
INSERT INTO `formation` (`id`, `name_formation`) VALUES
	(1, 'DWWM'),
	(2, 'Comptable'),
	(3, 'RH'),
	(4, 'CDA');

-- Listage de la structure de table session_amine. messenger_messages
CREATE TABLE IF NOT EXISTS `messenger_messages` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `body` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `headers` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue_name` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `available_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `delivered_at` datetime DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)',
  PRIMARY KEY (`id`),
  KEY `IDX_75EA56E0FB7336F0` (`queue_name`),
  KEY `IDX_75EA56E0E3BD61CE` (`available_at`),
  KEY `IDX_75EA56E016BA31DB` (`delivered_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table session_amine.messenger_messages : ~0 rows (environ)

-- Listage de la structure de table session_amine. module
CREATE TABLE IF NOT EXISTS `module` (
  `id` int NOT NULL AUTO_INCREMENT,
  `category_id` int DEFAULT NULL,
  `name_module` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_C24262812469DE2` (`category_id`),
  CONSTRAINT `FK_C24262812469DE2` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table session_amine.module : ~7 rows (environ)
INSERT INTO `module` (`id`, `category_id`, `name_module`) VALUES
	(1, 1, 'Word'),
	(2, 1, 'Excel'),
	(3, 1, 'PowerPoint'),
	(4, 3, 'HTML'),
	(5, 3, 'CSS'),
	(6, 3, 'JavaScript'),
	(7, 3, 'PHP');

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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
	(9, 6, 1, 5),
	(10, 6, 2, 5),
	(11, 1, 5, 3),
	(12, 1, 6, 3),
	(13, 7, 8, 10),
	(14, 7, 7, 10);

-- Listage de la structure de table session_amine. session
CREATE TABLE IF NOT EXISTS `session` (
  `id` int NOT NULL AUTO_INCREMENT,
  `formation_id` int DEFAULT NULL,
  `name_session` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_debut` datetime NOT NULL,
  `date_fin` datetime NOT NULL,
  `nb_place` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_D044D5D45200282E` (`formation_id`),
  CONSTRAINT `FK_D044D5D45200282E` FOREIGN KEY (`formation_id`) REFERENCES `formation` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table session_amine.session : ~8 rows (environ)
INSERT INTO `session` (`id`, `formation_id`, `name_session`, `date_debut`, `date_fin`, `nb_place`) VALUES
	(1, 1, 'DEV WEB Mulhouse Fevrier 2024', '2025-02-01 08:30:00', '2025-05-23 17:00:00', 10),
	(2, 1, 'DEV WEB Strasbourg Fevrier 2024', '2025-02-01 08:30:00', '2025-05-23 17:00:00', 10),
	(3, 2, 'Comptable Strasbourg Fevrier 2024', '2025-02-01 08:30:00', '2025-05-23 17:00:00', 8),
	(4, 2, 'Comptable Mulhouse Fevrier 2024', '2025-02-01 08:30:00', '2025-05-23 17:00:00', 8),
	(5, 3, 'RH Mulhouse Fevrier 2024', '2025-02-01 08:30:00', '2025-05-23 17:00:00', 12),
	(6, 3, 'RH Strasbourg Fevrier 2024', '2025-02-01 08:30:00', '2025-05-23 17:00:00', 12),
	(7, 4, 'CDA Strasbourg Fevrier 2024', '2025-02-01 08:30:00', '2025-05-23 17:00:00', 14),
	(8, 4, 'CDA Mulhouse Fevrier 2024', '2025-02-01 08:30:00', '2025-05-23 17:00:00', 14);

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

-- Listage des données de la table session_amine.session_stagiaire : ~3 rows (environ)
INSERT INTO `session_stagiaire` (`session_id`, `stagiaire_id`) VALUES
	(1, 1),
	(2, 2),
	(3, 3);

-- Listage de la structure de table session_amine. stagiaire
CREATE TABLE IF NOT EXISTS `stagiaire` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prenom` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `civilite` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `adresse` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cp` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ville` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telephone` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table session_amine.stagiaire : ~4 rows (environ)
INSERT INTO `stagiaire` (`id`, `nom`, `prenom`, `email`, `civilite`, `adresse`, `cp`, `ville`, `telephone`, `avatar`) VALUES
	(1, 'BOU', 'Amine', 'amine@test.fr', 'M', '10 rue de la gare', '68100', 'Mulhouse', '0606060606', NULL),
	(2, 'personne1nom', 'personne1prenom', 'personne@test.fr', 'Mme', '13 rue du Rhin', '68100', 'Mulhouse', '0606060606', NULL),
	(3, 'personne2', 'personne2', 'personne2@exemple.fr', 'M', '22 rue de la gare', '68200', 'Mulhouse', '0707070707', NULL),
	(4, 'personne4', 'personne4prenom', 'pers4@exemple.fr', 'Mme', '232 rue de strasbourg', '68100', 'Mulhouse', '0101010101', NULL);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;

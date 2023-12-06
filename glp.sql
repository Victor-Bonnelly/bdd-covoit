-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3307
-- Généré le : mer. 06 déc. 2023 à 13:35
-- Version du serveur : 10.6.5-MariaDB
-- Version de PHP : 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `glp`
--

-- --------------------------------------------------------

--
-- Structure de la table `centre`
--

DROP TABLE IF EXISTS `centre`;
CREATE TABLE IF NOT EXISTS `centre` (
  `id_centre` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(50) DEFAULT NULL,
  `adresse` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_centre`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `centre`
--

INSERT INTO `centre` (`id_centre`, `libelle`, `adresse`) VALUES
(1, 'Nextech Avignon', '60 Chemin de Fontanille, 84140 Avignon'),
(2, 'Nextech Pertuis', '180 Rue Philippe de Girard, 84120 Pertuis');

-- --------------------------------------------------------

--
-- Structure de la table `creer`
--

DROP TABLE IF EXISTS `creer`;
CREATE TABLE IF NOT EXISTS `creer` (
  `id_utilisateur` int(11) NOT NULL,
  `id_trajet` int(11) NOT NULL,
  PRIMARY KEY (`id_utilisateur`,`id_trajet`),
  KEY `id_trajet` (`id_trajet`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `effectuer`
--

DROP TABLE IF EXISTS `effectuer`;
CREATE TABLE IF NOT EXISTS `effectuer` (
  `id_trajet` int(11) NOT NULL,
  `id_joursemaine` int(11) NOT NULL,
  PRIMARY KEY (`id_trajet`,`id_joursemaine`),
  KEY `id_joursemaine` (`id_joursemaine`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `effectuer_1`
--

DROP TABLE IF EXISTS `effectuer_1`;
CREATE TABLE IF NOT EXISTS `effectuer_1` (
  `id_trajet` int(11) NOT NULL,
  `id_recurrence` int(11) NOT NULL,
  PRIMARY KEY (`id_trajet`,`id_recurrence`),
  KEY `id_recurrence` (`id_recurrence`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `envoyer__recevoir`
--

DROP TABLE IF EXISTS `envoyer__recevoir`;
CREATE TABLE IF NOT EXISTS `envoyer__recevoir` (
  `id_utilisateur` int(11) NOT NULL,
  `id_message` int(11) NOT NULL,
  PRIMARY KEY (`id_utilisateur`,`id_message`),
  KEY `id_message` (`id_message`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `joursemaine`
--

DROP TABLE IF EXISTS `joursemaine`;
CREATE TABLE IF NOT EXISTS `joursemaine` (
  `id_joursemaine` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_joursemaine`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `message`
--

DROP TABLE IF EXISTS `message`;
CREATE TABLE IF NOT EXISTS `message` (
  `id_message` int(11) NOT NULL AUTO_INCREMENT,
  `contenu` varchar(50) DEFAULT NULL,
  `heure` datetime DEFAULT NULL,
  PRIMARY KEY (`id_message`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `recurrence`
--

DROP TABLE IF EXISTS `recurrence`;
CREATE TABLE IF NOT EXISTS `recurrence` (
  `id_recurrence` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_recurrence`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `reserver`
--

DROP TABLE IF EXISTS `reserver`;
CREATE TABLE IF NOT EXISTS `reserver` (
  `id_utilisateur` int(11) NOT NULL,
  `id_trajet` int(11) NOT NULL,
  PRIMARY KEY (`id_utilisateur`,`id_trajet`),
  KEY `id_trajet` (`id_trajet`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `role`
--

DROP TABLE IF EXISTS `role`;
CREATE TABLE IF NOT EXISTS `role` (
  `id_role` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_role`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `role`
--

INSERT INTO `role` (`id_role`, `libelle`) VALUES
(1, 'Eleve'),
(2, 'Admin'),
(3, 'Modo');

-- --------------------------------------------------------

--
-- Structure de la table `trajet`
--

DROP TABLE IF EXISTS `trajet`;
CREATE TABLE IF NOT EXISTS `trajet` (
  `id_trajet` int(11) NOT NULL AUTO_INCREMENT,
  `date_trajet` date DEFAULT NULL,
  `heure_depart` time DEFAULT NULL,
  `heure_arrivee` varchar(50) DEFAULT NULL,
  `realise` tinyint(1) DEFAULT NULL,
  `supprime` tinyint(1) DEFAULT NULL,
  `nbr_places` int(11) DEFAULT NULL,
  `depart` varchar(50) DEFAULT NULL,
  `arrivee` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_trajet`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

DROP TABLE IF EXISTS `utilisateur`;
CREATE TABLE IF NOT EXISTS `utilisateur` (
  `id_utilisateur` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) DEFAULT NULL,
  `prenom` varchar(50) DEFAULT NULL,
  `bloque` tinyint(1) DEFAULT NULL,
  `mdp` varchar(50) DEFAULT NULL,
  `adresse` varchar(50) DEFAULT NULL,
  `photo` varchar(50) DEFAULT NULL,
  `id_role` int(11) DEFAULT NULL,
  `id_centre` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_utilisateur`),
  KEY `id_role` (`id_role`),
  KEY `id_centre` (`id_centre`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `utilisateur`
--

INSERT INTO `utilisateur` (`id_utilisateur`, `nom`, `prenom`, `bloque`, `mdp`, `adresse`, `photo`, `id_role`, `id_centre`) VALUES
(1, 'Doe', 'John', NULL, NULL, '123 Rue A', NULL, 1, 1),
(2, 'Smith', 'Jane', NULL, NULL, '456 Avenue B', NULL, 1, 1),
(3, 'Martin', 'Robert', NULL, NULL, '789 Boulevard C', NULL, 1, 2),
(4, 'Johnson', 'Emily', NULL, NULL, '1010 Rue D', NULL, 1, 1),
(5, 'Taylor', 'Michael', NULL, NULL, '1111 Avenue E', NULL, 1, 1),
(6, 'Anderson', 'Olivia', NULL, NULL, '1212 Boulevard F', NULL, 1, 2),
(7, 'Brown', 'William', NULL, NULL, '1313 Rue G', NULL, 1, 1),
(8, 'Jones', 'Sophia', NULL, NULL, '1414 Avenue H', NULL, 1, 1),
(9, 'Garcia', 'Daniel', NULL, NULL, '1515 Boulevard I', NULL, 1, 1),
(10, 'Davis', 'Isabella', NULL, NULL, '1616 Rue J', NULL, 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `voiture`
--

DROP TABLE IF EXISTS `voiture`;
CREATE TABLE IF NOT EXISTS `voiture` (
  `id_voiture` int(11) NOT NULL AUTO_INCREMENT,
  `marque` varchar(50) DEFAULT NULL,
  `modele` varchar(50) DEFAULT NULL,
  `couleur` varchar(50) DEFAULT NULL,
  `plaque` varchar(50) DEFAULT NULL,
  `nbr_places` int(11) DEFAULT NULL,
  `photo` varchar(50) DEFAULT NULL,
  `id_utilisateur` int(11) NOT NULL,
  PRIMARY KEY (`id_voiture`),
  UNIQUE KEY `id_utilisateur` (`id_utilisateur`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `voiture`
--

INSERT INTO `voiture` (`id_voiture`, `marque`, `modele`, `couleur`, `plaque`, `nbr_places`, `photo`, `id_utilisateur`) VALUES
(1, 'Toyota', 'Sedan', 'Rouge', 'ABC123', 5, NULL, 1),
(2, 'Honda', 'SUV', 'Bleu', 'DEF456', 7, NULL, 2),
(3, 'Ford', 'Coupé', 'Vert', 'GHI789', 2, NULL, 3),
(4, 'Chevrolet', 'Berline', 'Noir', 'JKL012', 4, NULL, 4),
(5, 'Nissan', 'Cabriolet', 'Blanc', 'MNO345', 2, NULL, 5),
(6, 'BMW', 'Hatchback', 'Gris', 'PQR678', 5, NULL, 6),
(7, 'Mercedes', 'Minivan', 'Jaune', 'STU901', 7, NULL, 7),
(8, 'Audi', 'Pickup', 'Marron', 'VWX234', 2, NULL, 8),
(9, 'Volkswagen', 'SUV', 'Orange', 'YZA567', 5, NULL, 9),
(10, 'Hyundai', 'Coupé', 'Violet', 'BCD890', 2, NULL, 10);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

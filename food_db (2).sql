-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : lun. 09 nov. 2020 à 00:46
-- Version du serveur :  10.4.14-MariaDB
-- Version de PHP : 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `food_db`
--

-- --------------------------------------------------------

--
-- Structure de la table `ingredient`
--

CREATE TABLE `ingredient` (
  `id_ingredient` int(11) NOT NULL,
  `libelle` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `ingredient`
--

INSERT INTO `ingredient` (`id_ingredient`, `libelle`) VALUES
(1, 'cerise'),
(2, 'lait'),
(3, 'oeuf'),
(4, 'sucre'),
(5, 'nutella');

-- --------------------------------------------------------

--
-- Structure de la table `login`
--

CREATE TABLE `login` (
  `id_personne` int(11) NOT NULL,
  `nom` varchar(20) NOT NULL,
  `mdp` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `login`
--

INSERT INTO `login` (`id_personne`, `nom`, `mdp`) VALUES
(1, 'Enzo', 'enzodu69'),
(2, 'Zozo', 'zozodu69'),
(3, 'Enzo690', 'jesuisbeau');

-- --------------------------------------------------------

--
-- Structure de la table `origine`
--

CREATE TABLE `origine` (
  `id_origine` int(11) NOT NULL,
  `libelle` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `origine`
--

INSERT INTO `origine` (`id_origine`, `libelle`) VALUES
(1, 'fr'),
(2, 'en'),
(3, 'ru');

-- --------------------------------------------------------

--
-- Structure de la table `panier`
--

CREATE TABLE `panier` (
  `id_personne` int(11) NOT NULL,
  `id_plat` int(11) NOT NULL,
  `quantite` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `panier`
--

INSERT INTO `panier` (`id_personne`, `id_plat`, `quantite`) VALUES
(1, 1, 6),
(1, 4, 3),
(3, 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `plat`
--

CREATE TABLE `plat` (
  `id_plat` int(11) NOT NULL,
  `prix` int(11) NOT NULL,
  `libelle` varchar(20) NOT NULL,
  `id_origine` int(11) NOT NULL,
  `poids` int(11) NOT NULL,
  `id_type_plat` int(11) NOT NULL,
  `id_type_nourriture` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `plat`
--

INSERT INTO `plat` (`id_plat`, `prix`, `libelle`, `id_origine`, `poids`, `id_type_plat`, `id_type_nourriture`) VALUES
(1, 15, 'clafouti', 1, 600, 1, 1),
(3, 20, 'pudding', 2, 900, 1, 1),
(4, 35, 'pancakes', 2, 500, 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `plat_ingredient`
--

CREATE TABLE `plat_ingredient` (
  `id_ingredient` int(11) NOT NULL,
  `id_plat` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `plat_ingredient`
--

INSERT INTO `plat_ingredient` (`id_ingredient`, `id_plat`) VALUES
(1, 1),
(2, 1),
(2, 3),
(2, 4),
(3, 1),
(3, 3),
(3, 4),
(4, 3),
(5, 3);

-- --------------------------------------------------------

--
-- Structure de la table `type_nourriture`
--

CREATE TABLE `type_nourriture` (
  `id_type_nourriture` int(11) NOT NULL,
  `libelle` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `type_nourriture`
--

INSERT INTO `type_nourriture` (`id_type_nourriture`, `libelle`) VALUES
(1, 'carnivore');

-- --------------------------------------------------------

--
-- Structure de la table `type_plat`
--

CREATE TABLE `type_plat` (
  `id_type_plat` int(11) NOT NULL,
  `libelle` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `type_plat`
--

INSERT INTO `type_plat` (`id_type_plat`, `libelle`) VALUES
(1, 'dessert');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `ingredient`
--
ALTER TABLE `ingredient`
  ADD PRIMARY KEY (`id_ingredient`);

--
-- Index pour la table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`id_personne`);

--
-- Index pour la table `origine`
--
ALTER TABLE `origine`
  ADD PRIMARY KEY (`id_origine`);

--
-- Index pour la table `panier`
--
ALTER TABLE `panier`
  ADD PRIMARY KEY (`id_personne`,`id_plat`),
  ADD KEY `id_plat` (`id_plat`);

--
-- Index pour la table `plat`
--
ALTER TABLE `plat`
  ADD PRIMARY KEY (`id_plat`),
  ADD KEY `id_type_plat` (`id_type_plat`) USING BTREE,
  ADD KEY `id_origine` (`id_origine`) USING BTREE,
  ADD KEY `id_type_nourriture` (`id_type_nourriture`) USING BTREE;

--
-- Index pour la table `plat_ingredient`
--
ALTER TABLE `plat_ingredient`
  ADD PRIMARY KEY (`id_ingredient`,`id_plat`),
  ADD KEY `id_plat` (`id_plat`);

--
-- Index pour la table `type_nourriture`
--
ALTER TABLE `type_nourriture`
  ADD PRIMARY KEY (`id_type_nourriture`);

--
-- Index pour la table `type_plat`
--
ALTER TABLE `type_plat`
  ADD PRIMARY KEY (`id_type_plat`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `ingredient`
--
ALTER TABLE `ingredient`
  MODIFY `id_ingredient` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `login`
--
ALTER TABLE `login`
  MODIFY `id_personne` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `origine`
--
ALTER TABLE `origine`
  MODIFY `id_origine` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `plat`
--
ALTER TABLE `plat`
  MODIFY `id_plat` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `type_nourriture`
--
ALTER TABLE `type_nourriture`
  MODIFY `id_type_nourriture` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `type_plat`
--
ALTER TABLE `type_plat`
  MODIFY `id_type_plat` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `panier`
--
ALTER TABLE `panier`
  ADD CONSTRAINT `panier_ibfk_1` FOREIGN KEY (`id_plat`) REFERENCES `plat` (`id_plat`),
  ADD CONSTRAINT `panier_ibfk_2` FOREIGN KEY (`id_personne`) REFERENCES `login` (`id_personne`);

--
-- Contraintes pour la table `plat`
--
ALTER TABLE `plat`
  ADD CONSTRAINT `plat_ibfk_2` FOREIGN KEY (`id_origine`) REFERENCES `origine` (`id_origine`),
  ADD CONSTRAINT `plat_ibfk_3` FOREIGN KEY (`id_type_plat`) REFERENCES `type_plat` (`id_type_plat`),
  ADD CONSTRAINT `plat_ibfk_4` FOREIGN KEY (`id_type_nourriture`) REFERENCES `type_nourriture` (`id_type_nourriture`);

--
-- Contraintes pour la table `plat_ingredient`
--
ALTER TABLE `plat_ingredient`
  ADD CONSTRAINT `plat_ingredient_ibfk_2` FOREIGN KEY (`id_plat`) REFERENCES `plat` (`id_plat`),
  ADD CONSTRAINT `plat_ingredient_ibfk_3` FOREIGN KEY (`id_ingredient`) REFERENCES `ingredient` (`id_ingredient`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

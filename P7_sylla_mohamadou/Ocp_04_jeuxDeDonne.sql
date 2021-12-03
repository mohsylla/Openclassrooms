-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:8889
-- Généré le : mar. 16 nov. 2021 à 22:35
-- Version du serveur :  5.7.34
-- Version de PHP : 7.4.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `projet7`
--

-- --------------------------------------------------------

--
-- Structure de la table `acheteur`
--

CREATE TABLE `acheteur` (
  `id` int(11) NOT NULL,
  `prenom` varchar(100) NOT NULL,
  `nom` varchar(100) NOT NULL,
  `sexe` char(1) NOT NULL,
  `mot_de_passe` char(15) NOT NULL,
  `tel` char(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `acheteur`
--

INSERT INTO `acheteur` (`id`, `prenom`, `nom`, `sexe`, `mot_de_passe`, `tel`) VALUES
(1, 'OC PIZZA', 'Responsable Groupe', 'F', 'OCPIZZA', '0601020304'),
(2, 'roger', 'milla', 'M', 'OCPIZZA', '0602020304'),
(3, 'hubert', 'durant', 'M', 'OCPIZZA', '0603020304'),
(4, 'Marc', 'krieg', 'M', 'OCPIZZA', '0604020304'),
(5, 'Daniel', 'dupont', 'F', 'OCPIZZA', '0601020304');

-- --------------------------------------------------------

--
-- Structure de la table `adresse`
--

CREATE TABLE `adresse` (
  `id` int(11) NOT NULL,
  `numero` char(10) NOT NULL,
  `voie` varchar(50) NOT NULL,
  `nom_rue` varchar(50) NOT NULL,
  `ville` varchar(50) NOT NULL,
  `code_postal` char(5) NOT NULL,
  `pays` varchar(50) NOT NULL,
  `point_de_vente_proche` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `adresse`
--

INSERT INTO `adresse` (`id`, `numero`, `voie`, `nom_rue`, `ville`, `code_postal`, `pays`, `point_de_vente_proche`) VALUES
(6, '2', 'rue', 'des Orfèvres', 'Strasbourg', '67000', 'France', 3),
(7, '2', 'rue', 'des pomme', 'Rennes', '35000', 'France', 3),
(8, '2', 'rue', 'des Orfèvres', 'Sannois', '95110', 'France', 3),
(9, '2', 'rue', 'des Orfèvres', 'Paris', '75001', 'France', 3),
(10, '2', 'rue', 'des Orfèvres', 'Strasbourg', '67000', 'France', 3);

-- --------------------------------------------------------

--
-- Structure de la table `article`
--

CREATE TABLE `article` (
  `id` int(11) NOT NULL,
  `libelle` varchar(100) NOT NULL,
  `taille` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `article`
--

INSERT INTO `article` (`id`, `libelle`, `taille`) VALUES
(1, 'Marguerite', 1),
(2, 'Reine', 1),
(3, 'Quatre Saisons', 1),
(4, 'Carnivore', 1),
(5, 'Oceane', 1);

-- --------------------------------------------------------

--
-- Structure de la table `ArticleIngredient`
--

CREATE TABLE `ArticleIngredient` (
  `article_id` int(11) NOT NULL,
  `ingredient_id` smallint(6) NOT NULL,
  `dose` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `clienWeb`
--

CREATE TABLE `clienWeb` (
  `id` int(11) NOT NULL,
  `anniversaire` date NOT NULL,
  `email` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `commandeClient`
--

CREATE TABLE `commandeClient` (
  `numero` int(11) NOT NULL,
  `acheteur_id` int(11) NOT NULL,
  `date_commande` date NOT NULL,
  `heure_commande` time NOT NULL,
  `mode_paiement_id` int(11) NOT NULL,
  `commande_payee` tinyint(1) NOT NULL,
  `commande_livree` tinyint(1) DEFAULT NULL,
  `point_vente_id` int(11) NOT NULL,
  `adresse_id` int(11) NOT NULL,
  `statut_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `employe`
--

CREATE TABLE `employe` (
  `id` int(11) NOT NULL,
  `nom` varchar(100) NOT NULL,
  `fonction_id` int(11) NOT NULL,
  `point_de_vente_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `fonction`
--

CREATE TABLE `fonction` (
  `id` int(11) NOT NULL,
  `libelle` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `fonction`
--

INSERT INTO `fonction` (`id`, `libelle`) VALUES
(1, 'Responsable Groupe'),
(2, 'Manager'),
(3, 'Pizzaiolo'),
(4, 'Livreur');

-- --------------------------------------------------------

--
-- Structure de la table `ingredient`
--

CREATE TABLE `ingredient` (
  `id` smallint(6) NOT NULL,
  `nom_ingredient` varchar(100) NOT NULL,
  `prix_ttc` decimal(3,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `ligneCommande`
--

CREATE TABLE `ligneCommande` (
  `numero_commande` int(11) NOT NULL,
  `article_id` int(11) NOT NULL,
  `quantite` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `modePaiement`
--

CREATE TABLE `modePaiement` (
  `id` int(11) NOT NULL,
  `libelle` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `pointDeVente`
--

CREATE TABLE `pointDeVente` (
  `id` int(11) NOT NULL,
  `nom_pizzeria` varchar(100) NOT NULL,
  `adresse_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `statut`
--

CREATE TABLE `statut` (
  `id` int(11) NOT NULL,
  `libelle` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `stock`
--

CREATE TABLE `stock` (
  `point_de_vente_id` int(11) NOT NULL,
  `ingredient_id` smallint(6) NOT NULL,
  `quantite_dose` smallint(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `acheteur`
--
ALTER TABLE `acheteur`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `adresse`
--
ALTER TABLE `adresse`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `article`
--
ALTER TABLE `article`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `ArticleIngredient`
--
ALTER TABLE `ArticleIngredient`
  ADD PRIMARY KEY (`article_id`,`ingredient_id`),
  ADD KEY `ingredient_articleingredient_fk` (`ingredient_id`);

--
-- Index pour la table `clienWeb`
--
ALTER TABLE `clienWeb`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `commandeClient`
--
ALTER TABLE `commandeClient`
  ADD PRIMARY KEY (`numero`),
  ADD KEY `modepaiement_commande_fk` (`mode_paiement_id`),
  ADD KEY `statut_commandeclient_fk` (`statut_id`),
  ADD KEY `adresse_commande_fk` (`adresse_id`),
  ADD KEY `pointdevente_commande_fk` (`point_vente_id`),
  ADD KEY `acheteur_commande_fk` (`acheteur_id`);

--
-- Index pour la table `employe`
--
ALTER TABLE `employe`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fonction_employe_fk` (`fonction_id`),
  ADD KEY `pointdevente_employe_fk` (`point_de_vente_id`);

--
-- Index pour la table `fonction`
--
ALTER TABLE `fonction`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `ingredient`
--
ALTER TABLE `ingredient`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `ligneCommande`
--
ALTER TABLE `ligneCommande`
  ADD PRIMARY KEY (`numero_commande`,`article_id`),
  ADD KEY `article_ligne_de_commande_fk` (`article_id`);

--
-- Index pour la table `modePaiement`
--
ALTER TABLE `modePaiement`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `pointDeVente`
--
ALTER TABLE `pointDeVente`
  ADD PRIMARY KEY (`id`),
  ADD KEY `adresse_pointdevente_fk` (`adresse_id`);

--
-- Index pour la table `statut`
--
ALTER TABLE `statut`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `stock`
--
ALTER TABLE `stock`
  ADD PRIMARY KEY (`point_de_vente_id`,`ingredient_id`),
  ADD KEY `ingredient_stock_fk` (`ingredient_id`);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `ArticleIngredient`
--
ALTER TABLE `ArticleIngredient`
  ADD CONSTRAINT `article_articleingredient_fk` FOREIGN KEY (`article_id`) REFERENCES `article` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `ingredient_articleingredient_fk` FOREIGN KEY (`ingredient_id`) REFERENCES `ingredient` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `clienWeb`
--
ALTER TABLE `clienWeb`
  ADD CONSTRAINT `acheteur_clienweb_fk` FOREIGN KEY (`id`) REFERENCES `acheteur` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `commandeClient`
--
ALTER TABLE `commandeClient`
  ADD CONSTRAINT `acheteur_commande_fk` FOREIGN KEY (`acheteur_id`) REFERENCES `acheteur` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `adresse_commande_fk` FOREIGN KEY (`adresse_id`) REFERENCES `adresse` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `modepaiement_commande_fk` FOREIGN KEY (`mode_paiement_id`) REFERENCES `modePaiement` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `pointdevente_commande_fk` FOREIGN KEY (`point_vente_id`) REFERENCES `pointDeVente` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `statut_commandeclient_fk` FOREIGN KEY (`statut_id`) REFERENCES `statut` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `employe`
--
ALTER TABLE `employe`
  ADD CONSTRAINT `acheteur_employe_fk` FOREIGN KEY (`id`) REFERENCES `acheteur` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fonction_employe_fk` FOREIGN KEY (`fonction_id`) REFERENCES `fonction` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `pointdevente_employe_fk` FOREIGN KEY (`point_de_vente_id`) REFERENCES `pointDeVente` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `ligneCommande`
--
ALTER TABLE `ligneCommande`
  ADD CONSTRAINT `article_ligne_de_commande_fk` FOREIGN KEY (`article_id`) REFERENCES `article` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `commande_ligne_de_commande_fk` FOREIGN KEY (`numero_commande`) REFERENCES `commandeClient` (`numero`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `pointDeVente`
--
ALTER TABLE `pointDeVente`
  ADD CONSTRAINT `adresse_pointdevente_fk` FOREIGN KEY (`adresse_id`) REFERENCES `adresse` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `stock`
--
ALTER TABLE `stock`
  ADD CONSTRAINT `ingredient_stock_fk` FOREIGN KEY (`ingredient_id`) REFERENCES `ingredient` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `pointdevente_stock_fk` FOREIGN KEY (`point_de_vente_id`) REFERENCES `pointDeVente` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

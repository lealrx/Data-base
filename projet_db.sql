-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : jeu. 12 mars 2020 à 10:46
-- Version du serveur :  10.4.11-MariaDB
-- Version de PHP : 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `projet_db`
--

-- --------------------------------------------------------

--
-- Structure de la table `affaire`
--

CREATE TABLE `affaire` (
  `id_affaire` bigint(20) NOT NULL,
  `description_affaire` varchar(255) DEFAULT NULL,
  `reference_affaire` varchar(255) DEFAULT NULL,
  `statut_affaire` varchar(255) DEFAULT NULL,
  `titre_affaire` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

CREATE TABLE `client` (
  `dtype` varchar(31) NOT NULL,
  `id_client` bigint(20) NOT NULL,
  `adresse_client` varchar(255) DEFAULT NULL,
  `tel_client` bigint(20) DEFAULT NULL,
  `nom_entreprise` varchar(255) DEFAULT NULL,
  `cin` bigint(20) DEFAULT NULL,
  `nom_part` varchar(255) DEFAULT NULL,
  `prenom_part` varchar(255) DEFAULT NULL,
  `user_client_id_utilisateur` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `document`
--

CREATE TABLE `document` (
  `id_document` bigint(20) NOT NULL,
  `date_creation_document` date DEFAULT NULL,
  `description_document` varchar(255) DEFAULT NULL,
  `nom_document` varchar(255) DEFAULT NULL,
  `affaire_doc_id_affaire` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `phase`
--

CREATE TABLE `phase` (
  `id_phase` bigint(20) NOT NULL,
  `date_debut` date DEFAULT NULL,
  `date_fin` date DEFAULT NULL,
  `nom_phase` varchar(255) DEFAULT NULL,
  `tache_phase_id_tache` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `profil`
--

CREATE TABLE `profil` (
  `id_utilisateur` bigint(20) NOT NULL,
  `id_role` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `role`
--

CREATE TABLE `role` (
  `id_role` bigint(20) NOT NULL,
  `libelle` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `tache`
--

CREATE TABLE `tache` (
  `id_tache` bigint(20) NOT NULL,
  `date_creation_tache` date DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `statut_audience` bit(1) NOT NULL,
  `titre_tache` varchar(255) DEFAULT NULL,
  `affaire_tache_id_affaire` bigint(20) DEFAULT NULL,
  `tribunal_tache_id_tribunal` bigint(20) DEFAULT NULL,
  `user_tache_id_utilisateur` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `tribunal`
--

CREATE TABLE `tribunal` (
  `id_tribunal` bigint(20) NOT NULL,
  `adresse` varchar(255) DEFAULT NULL,
  `fax` double DEFAULT NULL,
  `region` varchar(255) DEFAULT NULL,
  `tel_tribunal` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

CREATE TABLE `utilisateur` (
  `id_utilisateur` bigint(20) NOT NULL,
  `date_naissance` date DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `enabled` bit(1) NOT NULL,
  `image` longblob DEFAULT NULL,
  `nom_utilisateur` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `prenom_utilisateur` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `affaire`
--
ALTER TABLE `affaire`
  ADD PRIMARY KEY (`id_affaire`);

--
-- Index pour la table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`id_client`),
  ADD KEY `FKtjgampw052gjiu420wqr91jl1` (`user_client_id_utilisateur`);

--
-- Index pour la table `document`
--
ALTER TABLE `document`
  ADD PRIMARY KEY (`id_document`),
  ADD KEY `FKb9e7ie2bjgqryg2jomsy7ac1x` (`affaire_doc_id_affaire`);

--
-- Index pour la table `phase`
--
ALTER TABLE `phase`
  ADD PRIMARY KEY (`id_phase`),
  ADD KEY `FKn7refuej70vh0a45vt4cx6902` (`tache_phase_id_tache`);

--
-- Index pour la table `profil`
--
ALTER TABLE `profil`
  ADD PRIMARY KEY (`id_utilisateur`,`id_role`),
  ADD KEY `FKs4fmnq1qfcpfu26dypt7brumn` (`id_role`);

--
-- Index pour la table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id_role`);

--
-- Index pour la table `tache`
--
ALTER TABLE `tache`
  ADD PRIMARY KEY (`id_tache`),
  ADD KEY `FKr7t6rwlujn7bxb67ghvhcn9tv` (`affaire_tache_id_affaire`),
  ADD KEY `FKlphao4imbwg6lh90bbccvxdvo` (`tribunal_tache_id_tribunal`),
  ADD KEY `FKqsdp5c3msoxnyjut5lm74x3r` (`user_tache_id_utilisateur`);

--
-- Index pour la table `tribunal`
--
ALTER TABLE `tribunal`
  ADD PRIMARY KEY (`id_tribunal`);

--
-- Index pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD PRIMARY KEY (`id_utilisateur`),
  ADD UNIQUE KEY `UK_kq7nt5wyq9v9lpcpgxag2f24a` (`username`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `affaire`
--
ALTER TABLE `affaire`
  MODIFY `id_affaire` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `client`
--
ALTER TABLE `client`
  MODIFY `id_client` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `document`
--
ALTER TABLE `document`
  MODIFY `id_document` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `phase`
--
ALTER TABLE `phase`
  MODIFY `id_phase` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `role`
--
ALTER TABLE `role`
  MODIFY `id_role` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `tache`
--
ALTER TABLE `tache`
  MODIFY `id_tache` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `tribunal`
--
ALTER TABLE `tribunal`
  MODIFY `id_tribunal` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  MODIFY `id_utilisateur` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `client`
--
ALTER TABLE `client`
  ADD CONSTRAINT `FKtjgampw052gjiu420wqr91jl1` FOREIGN KEY (`user_client_id_utilisateur`) REFERENCES `utilisateur` (`id_utilisateur`);

--
-- Contraintes pour la table `document`
--
ALTER TABLE `document`
  ADD CONSTRAINT `FKb9e7ie2bjgqryg2jomsy7ac1x` FOREIGN KEY (`affaire_doc_id_affaire`) REFERENCES `affaire` (`id_affaire`);

--
-- Contraintes pour la table `phase`
--
ALTER TABLE `phase`
  ADD CONSTRAINT `FKn7refuej70vh0a45vt4cx6902` FOREIGN KEY (`tache_phase_id_tache`) REFERENCES `tache` (`id_tache`);

--
-- Contraintes pour la table `profil`
--
ALTER TABLE `profil`
  ADD CONSTRAINT `FK7xei445h7pdi8bj8l3fadp977` FOREIGN KEY (`id_utilisateur`) REFERENCES `utilisateur` (`id_utilisateur`),
  ADD CONSTRAINT `FKs4fmnq1qfcpfu26dypt7brumn` FOREIGN KEY (`id_role`) REFERENCES `role` (`id_role`);

--
-- Contraintes pour la table `tache`
--
ALTER TABLE `tache`
  ADD CONSTRAINT `FKlphao4imbwg6lh90bbccvxdvo` FOREIGN KEY (`tribunal_tache_id_tribunal`) REFERENCES `tribunal` (`id_tribunal`),
  ADD CONSTRAINT `FKqsdp5c3msoxnyjut5lm74x3r` FOREIGN KEY (`user_tache_id_utilisateur`) REFERENCES `utilisateur` (`id_utilisateur`),
  ADD CONSTRAINT `FKr7t6rwlujn7bxb67ghvhcn9tv` FOREIGN KEY (`affaire_tache_id_affaire`) REFERENCES `affaire` (`id_affaire`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

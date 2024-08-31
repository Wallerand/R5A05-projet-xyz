-- Version du serveur : 8.0.32
-- Version de PHP : 8.1.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `kanboard`
--

USE `kanboard`;

-- --------------------------------------------------------

--
-- Structure de la table `actions`
--

CREATE TABLE `actions` (
  `id` int NOT NULL,
  `project_id` int NOT NULL,
  `event_name` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `action_name` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `action_has_params`
--

CREATE TABLE `action_has_params` (
  `id` int NOT NULL,
  `action_id` int NOT NULL,
  `name` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `columns`
--

CREATE TABLE `columns` (
  `id` int NOT NULL,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` int NOT NULL,
  `project_id` int NOT NULL,
  `task_limit` int DEFAULT '0',
  `description` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `hide_in_dashboard` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `columns`
--

INSERT INTO `columns` (`id`, `title`, `position`, `project_id`, `task_limit`, `description`, `hide_in_dashboard`) VALUES
(1, 'Backlog', 1, 1, 0, '', 0),
(3, 'En cours', 3, 1, 0, '', 0),
(4, 'Terminé', 4, 1, 0, '', 0);

-- --------------------------------------------------------

--
-- Structure de la table `column_has_move_restrictions`
--

CREATE TABLE `column_has_move_restrictions` (
  `restriction_id` int NOT NULL,
  `project_id` int NOT NULL,
  `role_id` int NOT NULL,
  `src_column_id` int NOT NULL,
  `dst_column_id` int NOT NULL,
  `only_assigned` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `column_has_restrictions`
--

CREATE TABLE `column_has_restrictions` (
  `restriction_id` int NOT NULL,
  `project_id` int NOT NULL,
  `role_id` int NOT NULL,
  `column_id` int NOT NULL,
  `rule` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `comments`
--

CREATE TABLE `comments` (
  `id` int NOT NULL,
  `task_id` int NOT NULL,
  `user_id` int DEFAULT '0',
  `date_creation` bigint DEFAULT NULL,
  `comment` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `reference` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '',
  `date_modification` bigint DEFAULT NULL,
  `visibility` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'app-user'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `currencies`
--

CREATE TABLE `currencies` (
  `currency` char(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `rate` float DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `custom_filters`
--

CREATE TABLE `custom_filters` (
  `id` int NOT NULL,
  `filter` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `project_id` int NOT NULL,
  `user_id` int NOT NULL,
  `name` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_shared` tinyint(1) DEFAULT '0',
  `append` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `groups`
--

CREATE TABLE `groups` (
  `id` int NOT NULL,
  `external_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '',
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `group_has_users`
--

CREATE TABLE `group_has_users` (
  `group_id` int NOT NULL,
  `user_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `invites`
--

CREATE TABLE `invites` (
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `project_id` int NOT NULL,
  `token` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `last_logins`
--

CREATE TABLE `last_logins` (
  `id` int NOT NULL,
  `auth_type` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `ip` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_creation` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `links`
--

CREATE TABLE `links` (
  `id` int NOT NULL,
  `label` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `opposite_id` int DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `links`
--

INSERT INTO `links` (`id`, `label`, `opposite_id`) VALUES
(1, 'relates to', 0),
(2, 'blocks', 3),
(3, 'is blocked by', 2),
(4, 'duplicates', 5),
(5, 'is duplicated by', 4),
(6, 'is a parent of', 7),
(7, 'is a child of', 6),
(8, 'is a milestone of', 9),
(9, 'targets milestone', 8),
(10, 'is fixed by', 11),
(11, 'fixes', 10);

-- --------------------------------------------------------

--
-- Structure de la table `password_reset`
--

CREATE TABLE `password_reset` (
  `token` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int NOT NULL,
  `date_expiration` int NOT NULL,
  `date_creation` int NOT NULL,
  `ip` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_agent` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `plugin_schema_versions`
--

CREATE TABLE `plugin_schema_versions` (
  `plugin` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `version` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `predefined_task_descriptions`
--

CREATE TABLE `predefined_task_descriptions` (
  `id` int NOT NULL,
  `project_id` int NOT NULL,
  `title` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `projects`
--

CREATE TABLE `projects` (
  `id` int NOT NULL,
  `name` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint DEFAULT '1',
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_modified` bigint DEFAULT NULL,
  `is_public` tinyint(1) DEFAULT '0',
  `is_private` tinyint(1) DEFAULT '0',
  `description` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `identifier` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '',
  `start_date` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '',
  `end_date` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '',
  `owner_id` int DEFAULT '0',
  `priority_default` int DEFAULT '0',
  `priority_start` int DEFAULT '0',
  `priority_end` int DEFAULT '3',
  `email` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `predefined_email_subjects` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `per_swimlane_task_limits` int NOT NULL DEFAULT '0',
  `task_limit` int DEFAULT '0',
  `enable_global_tags` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `projects`
--

INSERT INTO `projects` (`id`, `name`, `is_active`, `token`, `last_modified`, `is_public`, `is_private`, `description`, `identifier`, `start_date`, `end_date`, `owner_id`, `priority_default`, `priority_start`, `priority_end`, `email`, `predefined_email_subjects`, `per_swimlane_task_limits`, `task_limit`, `enable_global_tags`) VALUES
(1, 'Projet XYZ', 1, '', 1725129277, 0, 0, '# À propos\r\n\r\nXYZ est une communauté musicale accessible sur invitation.\r\n\r\n- Le contenu est regroupé par semaine\r\n- Chaque utilisateur peut publier jusqu\'à 2 titres chaque semaine\r\n- La communauté détermine le classement de la semaine\r\n- Les utilisateurs peuvent écouter les contributions sans quitter l\'application (lecteurs tiers Youtube et Soundcloud)\r\n\r\n#### Caractéristiques techniques\r\n- Backend : PHP, framework Laravel \r\n- Frontend : HTML/CSS, SSR Blade', 'XYZ', '', '', 1, 0, 0, 3, '', NULL, 0, 0, 1);

-- --------------------------------------------------------

--
-- Structure de la table `project_activities`
--

CREATE TABLE `project_activities` (
  `id` int NOT NULL,
  `date_creation` bigint DEFAULT NULL,
  `event_name` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `creator_id` int DEFAULT NULL,
  `project_id` int DEFAULT NULL,
  `task_id` int DEFAULT NULL,
  `data` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `project_daily_column_stats`
--

CREATE TABLE `project_daily_column_stats` (
  `id` int NOT NULL,
  `day` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `project_id` int NOT NULL,
  `column_id` int NOT NULL,
  `total` int NOT NULL DEFAULT '0',
  `score` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `project_daily_column_stats`
--

INSERT INTO `project_daily_column_stats` (`id`, `day`, `project_id`, `column_id`, `total`, `score`) VALUES
(77, '2024-08-31', 1, 1, 22, 0),
(78, '2024-08-31', 1, 3, 2, 0);

-- --------------------------------------------------------

--
-- Structure de la table `project_daily_stats`
--

CREATE TABLE `project_daily_stats` (
  `id` int NOT NULL,
  `day` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `project_id` int NOT NULL,
  `avg_lead_time` int NOT NULL DEFAULT '0',
  `avg_cycle_time` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `project_daily_stats`
--

INSERT INTO `project_daily_stats` (`id`, `day`, `project_id`, `avg_lead_time`, `avg_cycle_time`) VALUES
(40, '2024-08-31', 1, 5098, 0);

-- --------------------------------------------------------

--
-- Structure de la table `project_has_categories`
--

CREATE TABLE `project_has_categories` (
  `id` int NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `project_id` int NOT NULL,
  `description` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `color_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `project_has_categories`
--

INSERT INTO `project_has_categories` (`id`, `name`, `project_id`, `description`, `color_id`) VALUES
(1, 'Base', 1, NULL, 'grey'),
(2, 'Authentification', 1, NULL, 'blue'),
(3, 'Inscription', 1, NULL, 'orange'),
(4, 'Profil', 1, NULL, 'red'),
(5, 'Contribution', 1, NULL, 'green'),
(6, 'Classement', 1, NULL, 'yellow');

-- --------------------------------------------------------

--
-- Structure de la table `project_has_files`
--

CREATE TABLE `project_has_files` (
  `id` int NOT NULL,
  `project_id` int NOT NULL,
  `name` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `path` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_image` tinyint(1) DEFAULT '0',
  `size` int NOT NULL DEFAULT '0',
  `user_id` int NOT NULL DEFAULT '0',
  `date` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `project_has_files`
--

INSERT INTO `project_has_files` (`id`, `project_id`, `name`, `path`, `is_image`, `size`, `user_id`, `date`) VALUES
(1, 1, 'auth.png', 'projects/1/41fff881a22018f69f52a71814c937a70665b4ec', 1, 47533, 1, 1725124289),
(2, 1, 'create.png', 'projects/1/53dae4f12405e50f704bfc5b13fe2406b8cbf979', 1, 55069, 1, 1725124289),
(3, 1, 'home.png', 'projects/1/8849bcce8b65602cc4f5e77261b8562d09901546', 1, 413065, 1, 1725124290),
(4, 1, 'profile.png', 'projects/1/679a40bf64e2d077d5a60e0d706ffad6f2da78ae', 1, 87879, 1, 1725124290),
(5, 1, 'signup-1.png', 'projects/1/9506e7362f50e86d26ce73a95b17811632b67258', 1, 79440, 1, 1725124290),
(6, 1, 'signup-2.png', 'projects/1/a7ea5f6f58ff8cd6e5038a7f97dcf99dc2d58c51', 1, 53204, 1, 1725124290),
(7, 1, 'track.png', 'projects/1/9f93c6e0b89a4fce5e1a7ce7803c19020194b60e', 1, 247375, 1, 1725124290),
(8, 1, 'week.png', 'projects/1/8ff0d8efbff9f550ce6d7015a460d0520071882f', 1, 237405, 1, 1725124290);

-- --------------------------------------------------------

--
-- Structure de la table `project_has_groups`
--

CREATE TABLE `project_has_groups` (
  `group_id` int NOT NULL,
  `project_id` int NOT NULL,
  `role` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `project_has_metadata`
--

CREATE TABLE `project_has_metadata` (
  `project_id` int NOT NULL,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '',
  `changed_by` int NOT NULL DEFAULT '0',
  `changed_on` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `project_has_notification_types`
--

CREATE TABLE `project_has_notification_types` (
  `id` int NOT NULL,
  `project_id` int NOT NULL,
  `notification_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `project_has_roles`
--

CREATE TABLE `project_has_roles` (
  `role_id` int NOT NULL,
  `role` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `project_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `project_has_users`
--

CREATE TABLE `project_has_users` (
  `project_id` int NOT NULL,
  `user_id` int NOT NULL,
  `role` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `project_has_users`
--

INSERT INTO `project_has_users` (`project_id`, `user_id`, `role`) VALUES
(1, 1, 'project-manager'),
(1, 2, 'project-member');

-- --------------------------------------------------------

--
-- Structure de la table `project_role_has_restrictions`
--

CREATE TABLE `project_role_has_restrictions` (
  `restriction_id` int NOT NULL,
  `project_id` int NOT NULL,
  `role_id` int NOT NULL,
  `rule` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `remember_me`
--

CREATE TABLE `remember_me` (
  `id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  `ip` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sequence` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `expiration` int DEFAULT NULL,
  `date_creation` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `schema_version`
--

CREATE TABLE `schema_version` (
  `version` int DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Déchargement des données de la table `schema_version`
--

INSERT INTO `schema_version` (`version`) VALUES
(139);

-- --------------------------------------------------------

--
-- Structure de la table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `expire_at` int NOT NULL,
  `data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `settings`
--

CREATE TABLE `settings` (
  `option` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `changed_by` int NOT NULL DEFAULT '0',
  `changed_on` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `settings`
--

INSERT INTO `settings` (`option`, `value`, `changed_by`, `changed_on`) VALUES
('api_token', 'c52be5ce4e25b093bf25b62ad752763a8013b781a4886c6287807ceb91b4', 0, 0),
('application_currency', 'EUR', 1, 1725136576),
('application_date_format', 'd/m/Y', 1, 1725120212),
('application_language', 'fr_FR', 1, 1725120212),
('application_stylesheet', '', 1, 1725120212),
('application_time_format', 'H:i', 1, 1725120212),
('application_timezone', 'Europe/Paris', 1, 1725120212),
('application_url', 'http://localhost:8045/', 1, 1725120212),
('board_columns', '', 1, 1725121553),
('board_highlight_period', '172800', 0, 0),
('board_private_refresh_interval', '10', 0, 0),
('board_public_refresh_interval', '60', 0, 0),
('calendar_project_tasks', 'date_started', 0, 0),
('calendar_user_subtasks_time_tracking', '0', 0, 0),
('calendar_user_tasks', 'date_started', 0, 0),
('cfd_include_closed_tasks', '1', 1, 1725121553),
('default_color', 'grey', 1, 1725121553),
('disable_private_project', '1', 1, 1725121553),
('integration_gravatar', '0', 0, 0),
('password_reset', '1', 1, 1725120212),
('project_categories', '', 1, 1725121553),
('subtask_restriction', '0', 1, 1725121553),
('subtask_time_tracking', '1', 1, 1725121553),
('webhook_token', '8724b19ae85c88343f019d3de6b25e5b4c7b42ae56551f92f2c0a5ae592f', 0, 0),
('webhook_url', '', 0, 0);

-- --------------------------------------------------------

--
-- Structure de la table `subtasks`
--

CREATE TABLE `subtasks` (
  `id` int NOT NULL,
  `title` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int DEFAULT '0',
  `time_estimated` float DEFAULT NULL,
  `time_spent` float DEFAULT NULL,
  `task_id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  `position` int DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `subtask_time_tracking`
--

CREATE TABLE `subtask_time_tracking` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `subtask_id` int NOT NULL,
  `start` bigint DEFAULT NULL,
  `end` bigint DEFAULT NULL,
  `time_spent` float DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `swimlanes`
--

CREATE TABLE `swimlanes` (
  `id` int NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` int DEFAULT '1',
  `is_active` int DEFAULT '1',
  `project_id` int DEFAULT NULL,
  `description` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `task_limit` int DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `swimlanes`
--

INSERT INTO `swimlanes` (`id`, `name`, `position`, `is_active`, `project_id`, `description`, `task_limit`) VALUES
(1, 'Par défaut', 1, 1, 1, '', 0);

-- --------------------------------------------------------

--
-- Structure de la table `tags`
--

CREATE TABLE `tags` (
  `id` int NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `project_id` int NOT NULL,
  `color_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `tasks`
--

CREATE TABLE `tasks` (
  `id` int NOT NULL,
  `title` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `date_creation` bigint DEFAULT NULL,
  `date_completed` bigint DEFAULT NULL,
  `date_due` bigint DEFAULT NULL,
  `color_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `project_id` int NOT NULL,
  `column_id` int NOT NULL,
  `owner_id` int DEFAULT '0',
  `position` int DEFAULT NULL,
  `score` int DEFAULT NULL,
  `is_active` tinyint DEFAULT '1',
  `category_id` int DEFAULT '0',
  `creator_id` int DEFAULT '0',
  `date_modification` int DEFAULT '0',
  `reference` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '',
  `date_started` bigint DEFAULT NULL,
  `time_spent` float DEFAULT '0',
  `time_estimated` float DEFAULT '0',
  `swimlane_id` int NOT NULL,
  `date_moved` bigint DEFAULT NULL,
  `recurrence_status` int NOT NULL DEFAULT '0',
  `recurrence_trigger` int NOT NULL DEFAULT '0',
  `recurrence_factor` int NOT NULL DEFAULT '0',
  `recurrence_timeframe` int NOT NULL DEFAULT '0',
  `recurrence_basedate` int NOT NULL DEFAULT '0',
  `recurrence_parent` int DEFAULT NULL,
  `recurrence_child` int DEFAULT NULL,
  `priority` int DEFAULT '0',
  `external_provider` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `external_uri` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `tasks`
--

INSERT INTO `tasks` (`id`, `title`, `description`, `date_creation`, `date_completed`, `date_due`, `color_id`, `project_id`, `column_id`, `owner_id`, `position`, `score`, `is_active`, `category_id`, `creator_id`, `date_modification`, `reference`, `date_started`, `time_spent`, `time_estimated`, `swimlane_id`, `date_moved`, `recurrence_status`, `recurrence_trigger`, `recurrence_factor`, `recurrence_timeframe`, `recurrence_basedate`, `recurrence_parent`, `recurrence_child`, `priority`, `external_provider`, `external_uri`) VALUES
(1, 'Installation de base', '# Description\r\n\r\nCette tâche vise à configurer l\'environnement de développement avant de débuter le travail.\r\n\r\n# Actions\r\n\r\n- Configurer Git\r\n\r\n```bash\r\n// Setup Git credentials\r\ngit config user.name \"Prénom Nom\"\r\ngit config user.email \"prenom.nom@etu.unilim.fr\"\r\n\r\n// Setup remote\r\ngit remote remove origin\r\ngit remote add origin <url>\r\n```\r\n\r\n- Ajouter les extensions VSC suivantes :\r\n\r\n  - [PHP Intelephense](https://marketplace.visualstudio.com/items?itemName=bmewburn.vscode-intelephense-client)\r\n  - [Laravel Blade Syntax](https://marketplace.visualstudio.com/items?itemName=onecentlin.laravel-blade)', 1725122177, NULL, 0, 'grey', 1, 3, 2, 1, 0, 1, 1, 1, 1725125974, '', 0, 0, 0, 1, 1725122190, 0, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL),
(2, 'Modélisation des utilisateurs', '# Description\r\n\r\nCette tâche vise à mettre à jour la configuration de base du modèle User pour correspondre aux spécifications du projet.\r\n\r\n# Règles de gestion\r\n\r\n- Doit inclure une adresse e-mail et un mot de passe\r\n- Peut inclure un avatar personnalisé\r\n- Le nom d’utilisateur est déterminé par l’application et suit le format suivant :\r\n    \r\n    `user{id}` où `id` correspond au numéro d’utilisateur d’une longueur minimale de 4 caractères\r\n    \r\n    Exemples:\r\n    \r\n    - Utilisateur n°1 : user0001\r\n    - Utilisateur n°532 : user0532\r\n\r\n# Ressources\r\n\r\n- https://laravel.com/docs/11.x/migrations\r\n- https://laravel.com/docs/11.x/eloquent\r\n- https://laravel.com/docs/11.x/eloquent-mutators#defining-an-accessor\r\n- https://www.php.net/manual/fr/function.str-pad.php', 1725123062, NULL, 0, 'blue', 1, 1, 2, 1, 0, 1, 2, 1, 1725123236, '', 0, 0, 0, 1, 1725123062, 0, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL),
(3, 'Formulaire de connexion', '# Description\r\n\r\nCette tâche vise à permettre à l’utilisateur de se connecter au moyen de son adresse e-mail et de son mot de passe.\r\n\r\n# Règles de gestion\r\n\r\n- Le formulaire de connexion doit être accessible à l’URL `/login`\r\n- La déconnexion doit passer par une requête POST à l’URL `/logout`\r\n\r\n# Ressources\r\n\r\n- https://laravel.com/docs/11.x/authentication', 1725123122, NULL, 0, 'blue', 1, 1, 2, 2, 0, 1, 2, 1, 1725123228, '', 0, 0, 0, 1, 1725123122, 0, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL),
(4, 'Modélisation des codes d’inscription', '# Description\r\n\r\nCette tâche vise à mettre en place la modélisation nécessaire pour prendre en charge l’inscription par code d’invitation.\r\n\r\n# Règles de gestion\r\n\r\n- Chaque compte dispose de 5 codes dʼinvitation générés dès lʼinscription\r\n\r\n# Ressources\r\n\r\n- https://laravel.com/docs/11.x/eloquent-relationships#one-to-many', 1725123220, NULL, 0, 'orange', 1, 1, 2, 3, 0, 1, 3, 1, 1725127595, '', 0, 0, 0, 1, 1725123220, 0, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL),
(5, 'Générateur de codes d’inscription', '# Description\r\n\r\nCette tâche vise à écriture la classe permettant de générer les codes d\'inscription.\r\n\r\n# Règles de gestion\r\n\r\n- Les codes doivent suivre le format suivant : ABCD-123-EFGH\r\n\r\n# Ressources\r\n\r\n- https://www.php.net/manual/fr/function.rand.php\r\n- https://laravel.com/docs/11.x/strings#method-str-random', 1725123220, NULL, 0, 'orange', 1, 1, 2, 4, 0, 1, 3, 1, 1725127484, '', 0, 0, 0, 1, 1725123220, 0, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL),
(6, 'Formulaires d’inscription', '# Description\r\n\r\nCette tâche vise à permettre à un utilisateur de s’inscrire à partir d’un code d’invitation valide.\r\n\r\n# Règles de gestion\r\n\r\n- Le parcours d’inscription doit être en 2 étapes :\r\n    1. Présentation de l’application et acceptation des conditions d’utilisation\r\n    2. Formulaire d’inscription (e-mail et mot de passe)\r\n- Le parcours d’inscription doit faire apparaitre le nom d’utilisateur, l’avatar et le nombre de contributions de l’utilisateur à l’origine de l’invitation\r\n- Chaque compte dispose de 5 codes d’invitation générés dès l’inscription', 1725123221, NULL, 0, 'orange', 1, 1, 2, 5, 0, 1, 3, 1, 1725127745, '', 0, 0, 0, 1, 1725123221, 0, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL),
(7, 'Confirmation d’inscription par e-mail', '# Description\r\n\r\nCette tâche vise à envoyer à l’utilisateur nouvellement inscrit une notification de confirmation d’inscription par e-mail.\r\n\r\n# Règles de gestion\r\n\r\n- A la fin du parcours d’inscription, un e-mail de confirmation incluant les codes d’invitation doit être envoyé à l’utilisateur\r\n- Le contenu de l\'e-mail doit correspondre à la pièce-jointe \"welcome-email.png\"\r\n\r\n# Ressources\r\n\r\n- https://laravel.com/docs/11.x/mail#generating-markdown-mailables', 1725123221, NULL, 0, 'orange', 1, 1, 2, 6, 0, 1, 3, 1, 1725127686, '', 0, 0, 0, 1, 1725123221, 0, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL),
(8, 'Modification du profil', '# Description\r\n\r\nCette tâche vise à permettre à l’utilisateur de mettre à jour son profil et d’afficher ses codes d’invitation.\r\n\r\n# Ressources\r\n\r\n- https://laravel.com/docs/11.x/filesystem#the-public-disk\r\n- https://laravel.com/docs/11.x/requests#storing-uploaded-files', 1725123277, NULL, 0, 'red', 1, 1, 2, 7, 0, 1, 4, 1, 1725124850, '', 0, 0, 0, 1, 1725123277, 0, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL),
(9, 'Modélisation des contributions', '# Description\r\n\r\nCette tâche consiste à ajouter la modélisation nécessaire à la fonctionnalité de contributions.\r\n\r\n# Règles de gestion\r\n\r\n- Les contributions ont un titre, un nom d\'artiste, un lien d\'écoute et une image de couverture récupérée à partir du lien d\'écoute', 1725123346, NULL, 0, 'green', 1, 1, 2, 8, 0, 1, 5, 1, 1725128576, '', 0, 0, 0, 1, 1725123346, 0, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL),
(10, 'Affichage d’une contribution', '', 1725123346, NULL, 0, 'green', 1, 1, 2, 9, 0, 1, 5, 1, 1725123346, '', NULL, 0, 0, 1, 1725123346, 0, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL),
(11, 'Formulaire de publication d’une contribution', '', 1725123346, NULL, 0, 'green', 1, 1, 2, 10, 0, 1, 5, 1, 1725127839, '', 0, 0, 0, 1, 1725123346, 0, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL),
(12, 'Lecteurs (base)', '# Description\r\n\r\nCette tâche vise à mettre en place les éléments de base permettant de prendre en charge les lecteurs tiers : \r\n- validation des URLs\r\n- récupération des codes d\'intégration (embed)\r\n- récupération de l\'image de couverture (thumbnail)\r\n\r\n# Ressources\r\n\r\n- https://www.php.net/manual/fr/language.oop5.interfaces.php\r\n- https://laravel.com/docs/11.x/validation#custom-validation-rules', 1725123346, NULL, 0, 'green', 1, 1, 2, 11, 0, 1, 5, 1, 1725128178, '', 0, 0, 0, 1, 1725123346, 0, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL),
(13, 'Lecteurs (Youtube)', '# Description\r\n\r\nCette tâche vise à prendre en charge les vidéos Youtube dans l\'application.\r\n\r\n# Ressources\r\n\r\n- Expression régulière\r\n\r\n```sh\r\n/^(?:http(?:s)?:\\/\\/)?(?:www\\.)?(?:m\\.)?(?:youtu\\.be\\/|youtube\\.com\\/(?:(?:watch)?\\?(?:.*&)?v(?:i)?=|(?:embed|v|vi|user|shorts)\\/))([^\\?&\\\"\'>]+)/\r\n```\r\n- https://stackoverflow.com/questions/2068344/how-do-i-get-a-youtube-video-thumbnail-from-the-youtube-api', 1725123346, NULL, 0, 'green', 1, 1, 2, 12, 0, 1, 5, 1, 1725128466, '', 0, 0, 0, 1, 1725123346, 0, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL),
(14, 'Lecteurs (Soundcloud)', '# Description\r\n\r\nCette tâche vise à prendre en charge les liens Soundcloud dans l\'application.\r\n\r\n# Ressources\r\n\r\n- Expressions régulières\r\n\r\n```sh\r\n(https?:\\/\\/(?:www.)?soundcloud.com\\/[\\w-]+\\/(?!sets\\/)?[\\w-]+)\r\n```\r\n```sh\r\n(https?:\\/\\/(?:www.)?soundcloud.com\\/[\\w-]+\\/(sets\\/)+[\\w-]+)\r\n```\r\n\r\n```sh\r\ntracks\\/?([0-9]+)\r\n```', 1725123346, NULL, 0, 'green', 1, 1, 2, 13, 0, 1, 5, 1, 1725128455, '', 0, 0, 0, 1, 1725123346, 0, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL),
(15, 'Modélisation des classements hebdomadaires', '', 1725123511, NULL, 0, 'yellow', 1, 1, 2, 14, 0, 1, 6, 1, 1725123511, '', NULL, 0, 0, 1, 1725123511, 0, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL),
(16, 'Ajout de la relation contribution <> classement', '', 1725123512, NULL, 0, 'yellow', 1, 1, 2, 15, 0, 1, 6, 1, 1725123512, '', NULL, 0, 0, 1, 1725123512, 0, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL),
(17, 'Affichage d\'un classement hebdomadaire', '', 1725123512, NULL, 0, 'yellow', 1, 1, 2, 16, 0, 1, 6, 1, 1725123512, '', NULL, 0, 0, 1, 1725123512, 0, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL),
(18, 'Affichage des 6 derniers classements sur la page d\'accueil', '', 1725123512, NULL, 0, 'yellow', 1, 1, 2, 17, 0, 1, 6, 1, 1725123512, '', NULL, 0, 0, 1, 1725123512, 0, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL),
(19, 'Restreindre les contributions à 2 max. par semaine', '# Description\r\n\r\nCette tâche vise à limiter le nombre de contributions à 2 max. par semaine.\r\n\r\nLa restriction doit être affichée à l\'utilisateur côté interface, et vérifiée côté serveur.\r\n\r\n# Ressources\r\n\r\n- https://laravel.com/docs/11.x/authorization', 1725123565, NULL, 0, 'yellow', 1, 1, 2, 18, 0, 1, 6, 1, 1725127979, '', 0, 0, 0, 1, 1725123565, 0, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL),
(20, 'Finaliser la page d\'accueil', '', 1725123676, NULL, 0, 'grey', 1, 1, 2, 19, 0, 1, 1, 1, 1725123676, '', 0, 0, 0, 1, 1725123676, 0, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL),
(21, 'Ajouter le nombre total de contributions en bas de page', '# Description\r\n\r\nCette tâche vise à ajouter le nombre total de contributions dans le pied de page de l’application.\r\n\r\n# Ressources\r\n\r\n- https://laravel.com/docs/11.x/views#view-composers', 1725123728, NULL, 0, 'grey', 1, 1, 2, 20, 0, 1, 1, 1, 1725123728, '', 0, 0, 0, 1, 1725123728, 0, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL),
(22, 'Modélisation des mentions “j’aime”', '# Description\r\n\r\nCette tâche vise à mettre en place la modélisation nécessaire pour permettre à un utilisateur d\'ajouter un “j”aime” sur une contribution.', 1725123931, NULL, 0, 'yellow', 1, 1, 2, 21, 0, 1, 6, 1, 1725127873, '', 0, 0, 0, 1, 1725123931, 0, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL),
(23, 'Formulaire ajouter une mention “j’aime”', '# Description\r\n\r\nCette tâche vise à permettre à un utilisateur de mettre “j”aime” sur une contribution.', 1725123955, NULL, 0, 'yellow', 1, 1, 2, 22, 0, 1, 6, 1, 1725127863, '', 0, 0, 0, 1, 1725123955, 0, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL),
(24, 'Installation des outils de débogage ', '# Description\r\n\r\nCette tâche vise à ajouter au projet les outils de débogage.\r\n\r\n# Ressources\r\n\r\n- [Larastan](https://github.com/larastan/larastan)\r\n- [Laravel Debugbar](https://github.com/barryvdh/laravel-debugbar)', 1725125961, NULL, 0, 'grey', 1, 3, 2, 2, 0, 1, 1, 1, 1725125964, '', 0, 0, 0, 1, 1725125964, 0, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `task_has_external_links`
--

CREATE TABLE `task_has_external_links` (
  `id` int NOT NULL,
  `link_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `dependency` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_creation` int NOT NULL,
  `date_modification` int NOT NULL,
  `task_id` int NOT NULL,
  `creator_id` int DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `task_has_files`
--

CREATE TABLE `task_has_files` (
  `id` int NOT NULL,
  `name` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `path` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_image` tinyint(1) DEFAULT '0',
  `task_id` int NOT NULL,
  `date` bigint DEFAULT NULL,
  `user_id` int NOT NULL DEFAULT '0',
  `size` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `task_has_files`
--

INSERT INTO `task_has_files` (`id`, `name`, `path`, `is_image`, `task_id`, `date`, `user_id`, `size`) VALUES
(1, 'welcome-email.png', 'tasks/7/5b01b1acb017fe4964e2fd13abfb6f948f503713', 1, 7, 1725127704, 1, 105456);

-- --------------------------------------------------------

--
-- Structure de la table `task_has_links`
--

CREATE TABLE `task_has_links` (
  `id` int NOT NULL,
  `link_id` int NOT NULL,
  `task_id` int NOT NULL,
  `opposite_task_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `task_has_metadata`
--

CREATE TABLE `task_has_metadata` (
  `task_id` int NOT NULL,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '',
  `changed_by` int NOT NULL DEFAULT '0',
  `changed_on` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `task_has_tags`
--

CREATE TABLE `task_has_tags` (
  `task_id` int NOT NULL,
  `tag_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `transitions`
--

CREATE TABLE `transitions` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `project_id` int NOT NULL,
  `task_id` int NOT NULL,
  `src_column_id` int NOT NULL,
  `dst_column_id` int NOT NULL,
  `date` bigint DEFAULT NULL,
  `time_spent` int DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `transitions`
--

INSERT INTO `transitions` (`id`, `user_id`, `project_id`, `task_id`, `src_column_id`, `dst_column_id`, `date`, `time_spent`) VALUES
(1, 1, 1, 1, 1, 3, 1725122190, 13),
(2, 1, 1, 24, 1, 3, 1725125964, 3);

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `username` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_ldap_user` tinyint(1) DEFAULT '0',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `google_id` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `github_id` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `notifications_enabled` tinyint(1) DEFAULT '0',
  `timezone` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `language` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `disable_login_form` tinyint(1) DEFAULT '0',
  `twofactor_activated` tinyint(1) DEFAULT '0',
  `twofactor_secret` char(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '',
  `notifications_filter` int DEFAULT '4',
  `nb_failed_login` int DEFAULT '0',
  `lock_expiration_date` bigint DEFAULT NULL,
  `gitlab_id` int DEFAULT NULL,
  `role` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'app-user',
  `is_active` tinyint(1) DEFAULT '1',
  `avatar_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `api_access_token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `filter` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `theme` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'light'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `is_ldap_user`, `name`, `email`, `google_id`, `github_id`, `notifications_enabled`, `timezone`, `language`, `disable_login_form`, `twofactor_activated`, `twofactor_secret`, `token`, `notifications_filter`, `nb_failed_login`, `lock_expiration_date`, `gitlab_id`, `role`, `is_active`, `avatar_path`, `api_access_token`, `filter`, `theme`) VALUES
(1, 'admin', '$2y$10$cf3kSd1RVukgPo9PrsKw7.N3/pjmEsMLPudNHcSu76lYvKpq80ai.', 0, 'administrateur', '', NULL, NULL, 0, '', '', 0, 0, NULL, '', 4, 0, 0, NULL, 'app-admin', 1, NULL, NULL, '', 'light'),
(2, 'dev', '$2y$10$iufUonmNQoXzEyr6nOq0Iet4CltxiOB7wSs5m66DeOh7ZJRuHEa3y', 0, 'développeur', '', NULL, NULL, 0, '', '', 0, 0, NULL, '', 4, 0, 0, NULL, 'app-user', 1, NULL, NULL, '', 'light');

-- --------------------------------------------------------

--
-- Structure de la table `user_has_metadata`
--

CREATE TABLE `user_has_metadata` (
  `user_id` int NOT NULL,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '',
  `changed_by` int NOT NULL DEFAULT '0',
  `changed_on` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `user_has_notifications`
--

CREATE TABLE `user_has_notifications` (
  `user_id` int NOT NULL,
  `project_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `user_has_notification_types`
--

CREATE TABLE `user_has_notification_types` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `notification_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `user_has_unread_notifications`
--

CREATE TABLE `user_has_unread_notifications` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `date_creation` bigint NOT NULL,
  `event_name` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `event_data` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `actions`
--
ALTER TABLE `actions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `project_id` (`project_id`);

--
-- Index pour la table `action_has_params`
--
ALTER TABLE `action_has_params`
  ADD PRIMARY KEY (`id`),
  ADD KEY `action_id` (`action_id`);

--
-- Index pour la table `columns`
--
ALTER TABLE `columns`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_title_project` (`title`,`project_id`),
  ADD KEY `columns_project_idx` (`project_id`);

--
-- Index pour la table `column_has_move_restrictions`
--
ALTER TABLE `column_has_move_restrictions`
  ADD PRIMARY KEY (`restriction_id`),
  ADD UNIQUE KEY `role_id` (`role_id`,`src_column_id`,`dst_column_id`),
  ADD KEY `project_id` (`project_id`),
  ADD KEY `src_column_id` (`src_column_id`),
  ADD KEY `dst_column_id` (`dst_column_id`);

--
-- Index pour la table `column_has_restrictions`
--
ALTER TABLE `column_has_restrictions`
  ADD PRIMARY KEY (`restriction_id`),
  ADD UNIQUE KEY `role_id` (`role_id`,`column_id`,`rule`),
  ADD KEY `project_id` (`project_id`),
  ADD KEY `column_id` (`column_id`);

--
-- Index pour la table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `comments_reference_idx` (`reference`),
  ADD KEY `comments_task_idx` (`task_id`);

--
-- Index pour la table `currencies`
--
ALTER TABLE `currencies`
  ADD UNIQUE KEY `currency` (`currency`);

--
-- Index pour la table `custom_filters`
--
ALTER TABLE `custom_filters`
  ADD PRIMARY KEY (`id`),
  ADD KEY `project_id` (`project_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Index pour la table `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Index pour la table `group_has_users`
--
ALTER TABLE `group_has_users`
  ADD UNIQUE KEY `group_id` (`group_id`,`user_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Index pour la table `invites`
--
ALTER TABLE `invites`
  ADD PRIMARY KEY (`email`,`token`);

--
-- Index pour la table `last_logins`
--
ALTER TABLE `last_logins`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Index pour la table `links`
--
ALTER TABLE `links`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `label` (`label`);

--
-- Index pour la table `password_reset`
--
ALTER TABLE `password_reset`
  ADD PRIMARY KEY (`token`),
  ADD KEY `user_id` (`user_id`);

--
-- Index pour la table `plugin_schema_versions`
--
ALTER TABLE `plugin_schema_versions`
  ADD PRIMARY KEY (`plugin`);

--
-- Index pour la table `predefined_task_descriptions`
--
ALTER TABLE `predefined_task_descriptions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `project_id` (`project_id`);

--
-- Index pour la table `projects`
--
ALTER TABLE `projects`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `project_activities`
--
ALTER TABLE `project_activities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `creator_id` (`creator_id`),
  ADD KEY `project_id` (`project_id`),
  ADD KEY `task_id` (`task_id`);

--
-- Index pour la table `project_daily_column_stats`
--
ALTER TABLE `project_daily_column_stats`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `project_daily_column_stats_idx` (`day`,`project_id`,`column_id`),
  ADD KEY `column_id` (`column_id`),
  ADD KEY `project_id` (`project_id`);

--
-- Index pour la table `project_daily_stats`
--
ALTER TABLE `project_daily_stats`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `project_daily_stats_idx` (`day`,`project_id`),
  ADD KEY `project_id` (`project_id`);

--
-- Index pour la table `project_has_categories`
--
ALTER TABLE `project_has_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_project_category` (`project_id`,`name`),
  ADD KEY `categories_project_idx` (`project_id`);

--
-- Index pour la table `project_has_files`
--
ALTER TABLE `project_has_files`
  ADD PRIMARY KEY (`id`),
  ADD KEY `project_id` (`project_id`);

--
-- Index pour la table `project_has_groups`
--
ALTER TABLE `project_has_groups`
  ADD UNIQUE KEY `group_id` (`group_id`,`project_id`),
  ADD KEY `project_id` (`project_id`);

--
-- Index pour la table `project_has_metadata`
--
ALTER TABLE `project_has_metadata`
  ADD UNIQUE KEY `project_id` (`project_id`,`name`);

--
-- Index pour la table `project_has_notification_types`
--
ALTER TABLE `project_has_notification_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `project_id` (`project_id`,`notification_type`);

--
-- Index pour la table `project_has_roles`
--
ALTER TABLE `project_has_roles`
  ADD PRIMARY KEY (`role_id`),
  ADD UNIQUE KEY `project_id` (`project_id`,`role`);

--
-- Index pour la table `project_has_users`
--
ALTER TABLE `project_has_users`
  ADD UNIQUE KEY `idx_project_user` (`project_id`,`user_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Index pour la table `project_role_has_restrictions`
--
ALTER TABLE `project_role_has_restrictions`
  ADD PRIMARY KEY (`restriction_id`),
  ADD UNIQUE KEY `role_id` (`role_id`,`rule`),
  ADD KEY `project_id` (`project_id`);

--
-- Index pour la table `remember_me`
--
ALTER TABLE `remember_me`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Index pour la table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`option`);

--
-- Index pour la table `subtasks`
--
ALTER TABLE `subtasks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subtasks_task_idx` (`task_id`);

--
-- Index pour la table `subtask_time_tracking`
--
ALTER TABLE `subtask_time_tracking`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `subtask_id` (`subtask_id`);

--
-- Index pour la table `swimlanes`
--
ALTER TABLE `swimlanes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`,`project_id`),
  ADD KEY `swimlanes_project_idx` (`project_id`);

--
-- Index pour la table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `project_id` (`project_id`,`name`);

--
-- Index pour la table `tasks`
--
ALTER TABLE `tasks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_task_active` (`is_active`),
  ADD KEY `column_id` (`column_id`),
  ADD KEY `tasks_reference_idx` (`reference`),
  ADD KEY `tasks_project_idx` (`project_id`),
  ADD KEY `tasks_swimlane_ibfk_1` (`swimlane_id`);

--
-- Index pour la table `task_has_external_links`
--
ALTER TABLE `task_has_external_links`
  ADD PRIMARY KEY (`id`),
  ADD KEY `task_id` (`task_id`);

--
-- Index pour la table `task_has_files`
--
ALTER TABLE `task_has_files`
  ADD PRIMARY KEY (`id`),
  ADD KEY `files_task_idx` (`task_id`);

--
-- Index pour la table `task_has_links`
--
ALTER TABLE `task_has_links`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `task_has_links_unique` (`link_id`,`task_id`,`opposite_task_id`),
  ADD KEY `opposite_task_id` (`opposite_task_id`),
  ADD KEY `task_has_links_task_index` (`task_id`);

--
-- Index pour la table `task_has_metadata`
--
ALTER TABLE `task_has_metadata`
  ADD UNIQUE KEY `task_id` (`task_id`,`name`);

--
-- Index pour la table `task_has_tags`
--
ALTER TABLE `task_has_tags`
  ADD UNIQUE KEY `tag_id` (`tag_id`,`task_id`),
  ADD KEY `task_id` (`task_id`);

--
-- Index pour la table `transitions`
--
ALTER TABLE `transitions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `src_column_id` (`src_column_id`),
  ADD KEY `dst_column_id` (`dst_column_id`),
  ADD KEY `transitions_task_index` (`task_id`),
  ADD KEY `transitions_project_index` (`project_id`),
  ADD KEY `transitions_user_index` (`user_id`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_username_idx` (`username`);

--
-- Index pour la table `user_has_metadata`
--
ALTER TABLE `user_has_metadata`
  ADD UNIQUE KEY `user_id` (`user_id`,`name`);

--
-- Index pour la table `user_has_notifications`
--
ALTER TABLE `user_has_notifications`
  ADD UNIQUE KEY `user_has_notifications_unique_idx` (`user_id`,`project_id`),
  ADD KEY `user_has_notifications_ibfk_2` (`project_id`);

--
-- Index pour la table `user_has_notification_types`
--
ALTER TABLE `user_has_notification_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_has_notification_types_user_idx` (`user_id`,`notification_type`);

--
-- Index pour la table `user_has_unread_notifications`
--
ALTER TABLE `user_has_unread_notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `actions`
--
ALTER TABLE `actions`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `action_has_params`
--
ALTER TABLE `action_has_params`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `columns`
--
ALTER TABLE `columns`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `column_has_move_restrictions`
--
ALTER TABLE `column_has_move_restrictions`
  MODIFY `restriction_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `column_has_restrictions`
--
ALTER TABLE `column_has_restrictions`
  MODIFY `restriction_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `custom_filters`
--
ALTER TABLE `custom_filters`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `groups`
--
ALTER TABLE `groups`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `last_logins`
--
ALTER TABLE `last_logins`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `links`
--
ALTER TABLE `links`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT pour la table `predefined_task_descriptions`
--
ALTER TABLE `predefined_task_descriptions`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `projects`
--
ALTER TABLE `projects`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `project_activities`
--
ALTER TABLE `project_activities`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `project_daily_column_stats`
--
ALTER TABLE `project_daily_column_stats`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;

--
-- AUTO_INCREMENT pour la table `project_daily_stats`
--
ALTER TABLE `project_daily_stats`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT pour la table `project_has_categories`
--
ALTER TABLE `project_has_categories`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `project_has_files`
--
ALTER TABLE `project_has_files`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `project_has_notification_types`
--
ALTER TABLE `project_has_notification_types`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `project_has_roles`
--
ALTER TABLE `project_has_roles`
  MODIFY `role_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `project_role_has_restrictions`
--
ALTER TABLE `project_role_has_restrictions`
  MODIFY `restriction_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `remember_me`
--
ALTER TABLE `remember_me`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `subtasks`
--
ALTER TABLE `subtasks`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `subtask_time_tracking`
--
ALTER TABLE `subtask_time_tracking`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `swimlanes`
--
ALTER TABLE `swimlanes`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `tags`
--
ALTER TABLE `tags`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `tasks`
--
ALTER TABLE `tasks`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT pour la table `task_has_external_links`
--
ALTER TABLE `task_has_external_links`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `task_has_files`
--
ALTER TABLE `task_has_files`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `task_has_links`
--
ALTER TABLE `task_has_links`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `transitions`
--
ALTER TABLE `transitions`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `user_has_notification_types`
--
ALTER TABLE `user_has_notification_types`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `user_has_unread_notifications`
--
ALTER TABLE `user_has_unread_notifications`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `actions`
--
ALTER TABLE `actions`
  ADD CONSTRAINT `actions_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `action_has_params`
--
ALTER TABLE `action_has_params`
  ADD CONSTRAINT `action_has_params_ibfk_1` FOREIGN KEY (`action_id`) REFERENCES `actions` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `columns`
--
ALTER TABLE `columns`
  ADD CONSTRAINT `columns_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `column_has_move_restrictions`
--
ALTER TABLE `column_has_move_restrictions`
  ADD CONSTRAINT `column_has_move_restrictions_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `column_has_move_restrictions_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `project_has_roles` (`role_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `column_has_move_restrictions_ibfk_3` FOREIGN KEY (`src_column_id`) REFERENCES `columns` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `column_has_move_restrictions_ibfk_4` FOREIGN KEY (`dst_column_id`) REFERENCES `columns` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `column_has_restrictions`
--
ALTER TABLE `column_has_restrictions`
  ADD CONSTRAINT `column_has_restrictions_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `column_has_restrictions_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `project_has_roles` (`role_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `column_has_restrictions_ibfk_3` FOREIGN KEY (`column_id`) REFERENCES `columns` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `custom_filters`
--
ALTER TABLE `custom_filters`
  ADD CONSTRAINT `custom_filters_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `custom_filters_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `group_has_users`
--
ALTER TABLE `group_has_users`
  ADD CONSTRAINT `group_has_users_ibfk_1` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `group_has_users_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `last_logins`
--
ALTER TABLE `last_logins`
  ADD CONSTRAINT `last_logins_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `password_reset`
--
ALTER TABLE `password_reset`
  ADD CONSTRAINT `password_reset_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `predefined_task_descriptions`
--
ALTER TABLE `predefined_task_descriptions`
  ADD CONSTRAINT `predefined_task_descriptions_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `project_activities`
--
ALTER TABLE `project_activities`
  ADD CONSTRAINT `project_activities_ibfk_1` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `project_activities_ibfk_2` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `project_activities_ibfk_3` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `project_daily_column_stats`
--
ALTER TABLE `project_daily_column_stats`
  ADD CONSTRAINT `project_daily_column_stats_ibfk_1` FOREIGN KEY (`column_id`) REFERENCES `columns` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `project_daily_column_stats_ibfk_2` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `project_daily_stats`
--
ALTER TABLE `project_daily_stats`
  ADD CONSTRAINT `project_daily_stats_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `project_has_categories`
--
ALTER TABLE `project_has_categories`
  ADD CONSTRAINT `project_has_categories_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `project_has_files`
--
ALTER TABLE `project_has_files`
  ADD CONSTRAINT `project_has_files_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `project_has_groups`
--
ALTER TABLE `project_has_groups`
  ADD CONSTRAINT `project_has_groups_ibfk_1` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `project_has_groups_ibfk_2` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `project_has_metadata`
--
ALTER TABLE `project_has_metadata`
  ADD CONSTRAINT `project_has_metadata_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `project_has_notification_types`
--
ALTER TABLE `project_has_notification_types`
  ADD CONSTRAINT `project_has_notification_types_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `project_has_roles`
--
ALTER TABLE `project_has_roles`
  ADD CONSTRAINT `project_has_roles_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `project_has_users`
--
ALTER TABLE `project_has_users`
  ADD CONSTRAINT `project_has_users_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `project_has_users_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `project_role_has_restrictions`
--
ALTER TABLE `project_role_has_restrictions`
  ADD CONSTRAINT `project_role_has_restrictions_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `project_role_has_restrictions_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `project_has_roles` (`role_id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `remember_me`
--
ALTER TABLE `remember_me`
  ADD CONSTRAINT `remember_me_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `subtasks`
--
ALTER TABLE `subtasks`
  ADD CONSTRAINT `subtasks_ibfk_1` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `subtask_time_tracking`
--
ALTER TABLE `subtask_time_tracking`
  ADD CONSTRAINT `subtask_time_tracking_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `subtask_time_tracking_ibfk_2` FOREIGN KEY (`subtask_id`) REFERENCES `subtasks` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `swimlanes`
--
ALTER TABLE `swimlanes`
  ADD CONSTRAINT `swimlanes_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `tasks`
--
ALTER TABLE `tasks`
  ADD CONSTRAINT `tasks_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tasks_ibfk_2` FOREIGN KEY (`column_id`) REFERENCES `columns` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tasks_swimlane_ibfk_1` FOREIGN KEY (`swimlane_id`) REFERENCES `swimlanes` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `task_has_external_links`
--
ALTER TABLE `task_has_external_links`
  ADD CONSTRAINT `task_has_external_links_ibfk_1` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `task_has_files`
--
ALTER TABLE `task_has_files`
  ADD CONSTRAINT `task_has_files_ibfk_1` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `task_has_links`
--
ALTER TABLE `task_has_links`
  ADD CONSTRAINT `task_has_links_ibfk_1` FOREIGN KEY (`link_id`) REFERENCES `links` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `task_has_links_ibfk_2` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `task_has_links_ibfk_3` FOREIGN KEY (`opposite_task_id`) REFERENCES `tasks` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `task_has_metadata`
--
ALTER TABLE `task_has_metadata`
  ADD CONSTRAINT `task_has_metadata_ibfk_1` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `task_has_tags`
--
ALTER TABLE `task_has_tags`
  ADD CONSTRAINT `task_has_tags_ibfk_1` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `task_has_tags_ibfk_2` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `transitions`
--
ALTER TABLE `transitions`
  ADD CONSTRAINT `transitions_ibfk_1` FOREIGN KEY (`src_column_id`) REFERENCES `columns` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transitions_ibfk_2` FOREIGN KEY (`dst_column_id`) REFERENCES `columns` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transitions_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transitions_ibfk_4` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transitions_ibfk_5` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `user_has_metadata`
--
ALTER TABLE `user_has_metadata`
  ADD CONSTRAINT `user_has_metadata_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `user_has_notifications`
--
ALTER TABLE `user_has_notifications`
  ADD CONSTRAINT `user_has_notifications_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_has_notifications_ibfk_2` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `user_has_notification_types`
--
ALTER TABLE `user_has_notification_types`
  ADD CONSTRAINT `user_has_notification_types_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `user_has_unread_notifications`
--
ALTER TABLE `user_has_unread_notifications`
  ADD CONSTRAINT `user_has_unread_notifications_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

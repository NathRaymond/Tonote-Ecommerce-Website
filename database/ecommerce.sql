-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3308
-- Generation Time: May 12, 2023 at 12:28 PM
-- Server version: 8.0.18
-- PHP Version: 7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecommerce`
--

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

DROP TABLE IF EXISTS `carts`;
CREATE TABLE IF NOT EXISTS `carts` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `carts_product_id_foreign` (`product_id`),
  KEY `carts_user_id_foreign` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2023_05_02_202428_create_products_table', 1),
(6, '2023_05_02_202536_create_carts_table', 1),
(7, '2023_05_10_183417_create_processings_table', 2),
(8, '2023_05_12_103418_add_client_id_processings_table', 3);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `processings`
--

DROP TABLE IF EXISTS `processings`;
CREATE TABLE IF NOT EXISTS `processings` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `client_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `client_id` int(11) NOT NULL,
  `client_address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_details` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `processings`
--

INSERT INTO `processings` (`id`, `client_name`, `client_id`, `client_address`, `order_details`, `amount`, `currency`, `created_at`, `updated_at`) VALUES
(1, 'AdebayoNathaniel', 1, '{\"line1\":\"No 1, Test street\",\"postal_code\":\"1234pobox\",\"city\":\"ilorin\",\"state\":\"Gombe State\",\"country\":\"Nigeria\"}', '{\"1\":{\"order_id\":1,\"quantity\":1},\"2\":{\"order_id\":2,\"quantity\":1},\"3\":{\"order_id\":3,\"quantity\":1}}', '1159', 'usd', '2023-05-12 11:19:17', '2023-05-12 11:19:17');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sale_price` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `slug`, `description`, `image_name`, `price`, `sale_price`, `created_at`, `updated_at`) VALUES
(1, 'Rerum sit nemo est qui.', 'rerum-sit-nemo-est-qui', 'Et placeat qui provident ipsum. A eum vel sunt at quis aut nam.', 'https://via.placeholder.com/140x300.png/004477?text=deleniti', '713', '663', '2023-05-02 20:03:13', '2023-05-02 20:03:13'),
(2, 'Ipsam ducimus quia ut.', 'ipsam-ducimus-quia-ut', 'Veniam rem quos quo. Ratione vitae sunt dicta debitis et voluptatum.', 'https://via.placeholder.com/140x300.png/002200?text=est', '369', '319', '2023-05-02 20:03:13', '2023-05-02 20:03:13'),
(3, 'In expedita est atque.', 'in-expedita-est-atque', 'Aut vero et molestiae quis ut odio. Dolores est voluptates optio sit.', 'https://via.placeholder.com/140x300.png/00ee88?text=velit', '227', '177', '2023-05-02 20:03:13', '2023-05-02 20:03:13'),
(4, 'Vel omnis odio quis non.', 'vel-omnis-odio-quis-non', 'Quod quo aut sit explicabo. Quia dolorem sit rem aut.', 'https://via.placeholder.com/140x300.png/002233?text=eveniet', '316', '266', '2023-05-02 20:03:13', '2023-05-02 20:03:13'),
(5, 'Veritatis quod modi ea.', 'veritatis-quod-modi-ea', 'Minima optio maiores ab et aut voluptates. Animi excepturi minus esse minima.', 'https://via.placeholder.com/140x300.png/00ff66?text=nostrum', '189', '139', '2023-05-02 20:03:13', '2023-05-02 20:03:13'),
(6, 'Quis cum iure et sed.', 'quis-cum-iure-et-sed', 'Aut rerum dolores eos modi. Dolorum neque saepe autem necessitatibus et possimus et sed.', 'https://via.placeholder.com/140x300.png/00aa22?text=cupiditate', '843', '793', '2023-05-02 20:03:13', '2023-05-02 20:03:13'),
(7, 'Sit suscipit enim sed.', 'sit-suscipit-enim-sed', 'Deserunt et aut et et aut voluptate. Iusto sequi eaque voluptatum et. Sit facilis provident non.', 'https://via.placeholder.com/140x300.png/00cc33?text=ut', '202', '152', '2023-05-02 20:03:13', '2023-05-02 20:03:13'),
(8, 'Tenetur quia vitae et.', 'tenetur-quia-vitae-et', 'Nobis ut a ullam. Sunt iste autem reiciendis ea. Minima sint voluptate qui consequatur in.', 'https://via.placeholder.com/140x300.png/00bbee?text=veritatis', '558', '508', '2023-05-02 20:03:13', '2023-05-02 20:03:13'),
(9, 'Culpa minus ea quia et.', 'culpa-minus-ea-quia-et', 'Dolores expedita ducimus esse minus eius. Et excepturi illo alias eius quo ut omnis reiciendis.', 'https://via.placeholder.com/140x300.png/00aadd?text=et', '418', '368', '2023-05-02 20:03:13', '2023-05-02 20:03:13'),
(10, 'Qui eos qui aut eaque.', 'qui-eos-qui-aut-eaque', 'Alias rerum placeat et. Tempore consequuntur dolores veniam tempora assumenda.', 'https://via.placeholder.com/140x300.png/00dd88?text=labore', '505', '455', '2023-05-02 20:03:13', '2023-05-02 20:03:13'),
(11, 'Qui facilis eos eos.', 'qui-facilis-eos-eos', 'Quia qui et repudiandae. Molestiae ipsa eos quis aut.', 'https://via.placeholder.com/140x300.png/00cc88?text=ipsa', '629', '579', '2023-05-02 20:03:13', '2023-05-02 20:03:13'),
(12, 'Cum at eos enim aut.', 'cum-at-eos-enim-aut', 'Temporibus quis dolores quae explicabo esse sunt in. Sunt dolore voluptatem quia.', 'https://via.placeholder.com/140x300.png/00eeff?text=quisquam', '358', '308', '2023-05-02 20:03:13', '2023-05-02 20:03:13'),
(13, 'Qui quis quo qui.', 'qui-quis-quo-qui', 'Ab facilis iure est vitae quisquam. Et ut expedita sed facere.', 'https://via.placeholder.com/140x300.png/005566?text=modi', '713', '663', '2023-05-02 20:03:13', '2023-05-02 20:03:13'),
(14, 'Quasi eum enim beatae.', 'quasi-eum-enim-beatae', 'Non vel et error ullam velit. Unde aliquid magni fugiat. Ullam aut ea laborum qui sed.', 'https://via.placeholder.com/140x300.png/00dd33?text=omnis', '419', '369', '2023-05-02 20:03:13', '2023-05-02 20:03:13'),
(15, 'Et fugit qui nemo.', 'et-fugit-qui-nemo', 'Perferendis quam cum et. Officiis laboriosam eum consectetur architecto enim amet voluptates.', 'https://via.placeholder.com/140x300.png/008844?text=aut', '224', '174', '2023-05-02 20:03:13', '2023-05-02 20:03:13'),
(16, 'Et illo in odio quia.', 'et-illo-in-odio-quia', 'Unde qui illum itaque placeat suscipit. Et aut odit placeat minus deserunt aspernatur.', 'https://via.placeholder.com/140x300.png/002277?text=magnam', '696', '646', '2023-05-02 20:03:13', '2023-05-02 20:03:13'),
(17, 'Quia quas maxime ut.', 'quia-quas-maxime-ut', 'Qui velit consectetur harum delectus. Quasi et ea laborum esse. Vel fugit facere aut.', 'https://via.placeholder.com/140x300.png/005588?text=laborum', '751', '701', '2023-05-02 20:03:13', '2023-05-02 20:03:13'),
(18, 'Qui sunt ut et hic qui.', 'qui-sunt-ut-et-hic-qui', 'Consequuntur odit aut in dicta pariatur perferendis. Provident voluptatem dolores aut aliquam.', 'https://via.placeholder.com/140x300.png/002222?text=facere', '759', '709', '2023-05-02 20:03:13', '2023-05-02 20:03:13'),
(19, 'Aut rem qui et aliquid.', 'aut-rem-qui-et-aliquid', 'Est aut tenetur eum ut. Totam amet rerum ducimus quo. Porro quia reprehenderit suscipit ratione.', 'https://via.placeholder.com/140x300.png/00aabb?text=et', '316', '266', '2023-05-02 20:03:13', '2023-05-02 20:03:13'),
(20, 'Et et at in deserunt et.', 'et-et-at-in-deserunt-et', 'Nulla magni velit provident modi. Repudiandae harum beatae nihil esse iure aut.', 'https://via.placeholder.com/140x300.png/003399?text=officiis', '168', '118', '2023-05-02 20:03:13', '2023-05-02 20:03:13'),
(21, 'Minus mollitia sed et.', 'minus-mollitia-sed-et', 'Natus nobis voluptatem ab a reiciendis. Est enim ducimus velit et maxime.', 'https://via.placeholder.com/140x300.png/00bbcc?text=neque', '311', '261', '2023-05-02 20:03:13', '2023-05-02 20:03:13'),
(22, 'Eos velit nihil ut et.', 'eos-velit-nihil-ut-et', 'Commodi vel amet doloremque quo aut sit. Quasi velit et voluptatem iure pariatur.', 'https://via.placeholder.com/140x300.png/00aaaa?text=id', '492', '442', '2023-05-02 20:03:13', '2023-05-02 20:03:13'),
(23, 'Et laborum eum in.', 'et-laborum-eum-in', 'Quas fugit accusantium rerum. Corporis recusandae ab voluptatem sint fuga recusandae.', 'https://via.placeholder.com/140x300.png/0055ff?text=non', '105', '55', '2023-05-02 20:03:13', '2023-05-02 20:03:13'),
(24, 'Odio qui expedita qui.', 'odio-qui-expedita-qui', 'Explicabo a qui dignissimos aut consequatur sit. Dolorem sed rerum ut ad.', 'https://via.placeholder.com/140x300.png/0088ee?text=expedita', '177', '127', '2023-05-02 20:03:13', '2023-05-02 20:03:13'),
(25, 'Eaque amet voluptas at.', 'eaque-amet-voluptas-at', 'Magni unde nulla itaque architecto sed. Quia eaque delectus deserunt accusamus.', 'https://via.placeholder.com/140x300.png/007744?text=quibusdam', '753', '703', '2023-05-02 20:03:13', '2023-05-02 20:03:13');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Adebayo Nathaniel', 'adebayonathaniel79@gmail.com', NULL, '$2y$10$kklkjhvnQWDiA2muTVx3UuhMl8BceKPEIG.9OdxBExU0al09qLSWy', NULL, '2023-05-02 23:49:51', '2023-05-02 23:49:51');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

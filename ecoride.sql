-- MySQL dump 10.13  Distrib 9.1.0, for Win64 (x86_64)
--
-- Host: localhost    Database: ecoride
-- ------------------------------------------------------
-- Server version	9.1.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `avis`
--

DROP TABLE IF EXISTS `avis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `avis` (
  `avis_id` int NOT NULL AUTO_INCREMENT,
  `commentaire` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `note` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `statut` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `utilisateur_id` int DEFAULT NULL,
  PRIMARY KEY (`avis_id`),
  KEY `utilisateur_id` (`utilisateur_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `avis`
--

LOCK TABLES `avis` WRITE;
/*!40000 ALTER TABLE `avis` DISABLE KEYS */;
/*!40000 ALTER TABLE `avis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache`
--

DROP TABLE IF EXISTS `cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache` (
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache`
--

LOCK TABLES `cache` WRITE;
/*!40000 ALTER TABLE `cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_locks`
--

DROP TABLE IF EXISTS `cache_locks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache_locks` (
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_locks`
--

LOCK TABLES `cache_locks` WRITE;
/*!40000 ALTER TABLE `cache_locks` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_locks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `configuration`
--

DROP TABLE IF EXISTS `configuration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `configuration` (
  `id_configuration` int NOT NULL AUTO_INCREMENT,
  `parametre_id` int DEFAULT NULL,
  PRIMARY KEY (`id_configuration`),
  KEY `parametre_id` (`parametre_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `configuration`
--

LOCK TABLES `configuration` WRITE;
/*!40000 ALTER TABLE `configuration` DISABLE KEYS */;
/*!40000 ALTER TABLE `configuration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contacts`
--

DROP TABLE IF EXISTS `contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contacts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contacts`
--

LOCK TABLES `contacts` WRITE;
/*!40000 ALTER TABLE `contacts` DISABLE KEYS */;
INSERT INTO `contacts` VALUES (1,'david','davistres@yahoo.fr','AAAAAAAAAAAAAAA','2025-02-18 07:37:37','2025-02-18 07:37:37'),(2,'D\'AMORE','davistres@yahoo.fr','AAAAAAA','2025-02-18 08:27:35','2025-02-18 08:27:35'),(3,'D\'AMORE','davistres@yahoo.fr','aaaa','2025-02-18 08:34:14','2025-02-18 08:34:14'),(4,'dd','dd@dd.fr','dff','2025-02-18 19:20:05','2025-02-18 19:20:05'),(5,'qq','qq@qq.fr','qq','2025-02-18 19:51:09','2025-02-18 19:51:09'),(6,'dd','dd@dd','ddddd','2025-02-18 21:03:40','2025-02-18 21:03:40'),(7,'dd','davistres@yahoo.fr','dd','2025-02-18 21:32:13','2025-02-18 21:32:13'),(8,'SHIMIZU','davistres@yahoo.fr','19/02/2025','2025-02-19 07:20:09','2025-02-19 07:20:09'),(9,'dd','dd@dd.fr','dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd','2025-02-19 09:50:31','2025-02-19 09:50:31'),(10,'dd','dd@dd.com','dd','2025-02-19 14:11:11','2025-02-19 14:11:11');
/*!40000 ALTER TABLE `contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_batches`
--

DROP TABLE IF EXISTS `job_batches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job_batches` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_batches`
--

LOCK TABLES `job_batches` WRITE;
/*!40000 ALTER TABLE `job_batches` DISABLE KEYS */;
/*!40000 ALTER TABLE `job_batches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint unsigned NOT NULL,
  `reserved_at` int unsigned DEFAULT NULL,
  `available_at` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marque`
--

DROP TABLE IF EXISTS `marque`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `marque` (
  `marque_id` int NOT NULL AUTO_INCREMENT,
  `libelle` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`marque_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marque`
--

LOCK TABLES `marque` WRITE;
/*!40000 ALTER TABLE `marque` DISABLE KEYS */;
/*!40000 ALTER TABLE `marque` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (20,'0001_01_01_000000_create_users_table',8),(21,'0001_01_01_000001_create_cache_table',8),(22,'0001_01_01_000002_create_jobs_table',8),(23,'2025_02_16_215158_create_trips_table',8),(24,'2025_02_16_215212_create_reservations_table',8),(7,'2025_02_17_201835_add_status_to_trips_table',4),(8,'2025_02_17_202508_add_status_to_trips_table',5),(19,'2025_02_17_203331_add_status_to_trips_table',7),(25,'2025_02_17_231758_create_contacts_table',9),(27,'2025_02_18_230314_add_role_to_users_table',10),(30,'2025_02_19_234704_rename_users_table',11),(31,'2025_02_20_003707_rename_utilisateur_id_to_id',12),(32,'2025_02_20_094055_add_columns_to_users_table',13),(34,'2025_02_20_115651_update_trips_table',14),(35,'2025_02_20_120245_drop_covoiturage_table',15);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `parametre`
--

DROP TABLE IF EXISTS `parametre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `parametre` (
  `parametre_id` int NOT NULL AUTO_INCREMENT,
  `propriete` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `valeur` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`parametre_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parametre`
--

LOCK TABLES `parametre` WRITE;
/*!40000 ALTER TABLE `parametre` DISABLE KEYS */;
/*!40000 ALTER TABLE `parametre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `participe`
--

DROP TABLE IF EXISTS `participe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `participe` (
  `utilisateur_id` int NOT NULL,
  `covoiturage_id` int NOT NULL,
  PRIMARY KEY (`utilisateur_id`,`covoiturage_id`),
  KEY `covoiturage_id` (`covoiturage_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `participe`
--

LOCK TABLES `participe` WRITE;
/*!40000 ALTER TABLE `participe` DISABLE KEYS */;
/*!40000 ALTER TABLE `participe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_reset_tokens`
--

LOCK TABLES `password_reset_tokens` WRITE;
/*!40000 ALTER TABLE `password_reset_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_reset_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `possede`
--

DROP TABLE IF EXISTS `possede`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `possede` (
  `utilisateur_id` int NOT NULL,
  `role_id` int NOT NULL,
  PRIMARY KEY (`utilisateur_id`,`role_id`),
  KEY `role_id` (`role_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `possede`
--

LOCK TABLES `possede` WRITE;
/*!40000 ALTER TABLE `possede` DISABLE KEYS */;
/*!40000 ALTER TABLE `possede` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservations`
--

DROP TABLE IF EXISTS `reservations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `trip_id` bigint unsigned NOT NULL,
  `status` enum('pending','confirmed','canceled') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `reservations_user_id_foreign` (`user_id`),
  KEY `reservations_trip_id_foreign` (`trip_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservations`
--

LOCK TABLES `reservations` WRITE;
/*!40000 ALTER TABLE `reservations` DISABLE KEYS */;
/*!40000 ALTER TABLE `reservations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `role_id` int NOT NULL AUTO_INCREMENT,
  `libelle` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES ('03LEhybzNlbmbFuJ0t0KvDaeexpu9oKeBr9txzWp',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36','YToyOntzOjY6Il90b2tlbiI7czo0MDoiaFd3Y1pwYnpQdTFsQnhMa1AxZjNXYTZzaHNjdzRnN3RrVWN2OTF1NSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1739904798),('zFBPqGMKVTUzdhNe1DNCE22OfHsGqIP5zkNJCNZw',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoidTFVM2FST1JoVHZiVGhiY1ZxVE5OTkdZVzR1YjZQWEtlTk9qZGhqdiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjk6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9jb250YWN0Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1739904911),('CYn9tUrokH4U7UOcSeD0lqHA8Lrm5cncpsUb86Z3',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiRms3SHR3TUdHNG1BaGViVlpFNzBWQVdhMUVOWjF1bGVranJEWWpWNyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9zb3VyY2VNYXAvYXNzZXRzL2Nzcy9zaGFkb3cuY3NzLm1hcCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1739904795),('WpsNMyRXIc2hSQBzz00IQuKupkwALaKNBDhR7rLx',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiYUt6cm5xdG8yVThuemlPNHVPWjZQT3N2cE5mMklJVTdCeVVTRWZjUSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9zb3VyY2VNYXAvYXNzZXRzL2Nzcy9zaGFkb3cuY3NzLm1hcCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1739904795),('CeyjzEfk8qgud0z1h6KslHHBCHHO6rflAO6VpAQh',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiVUZYOGxydkdTdzlEamJDSjJoOUk3MWJ4dmNEZXAzSG9xQlJ6NW5XOCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9zb3VyY2VNYXAvYXNzZXRzL2Nzcy9zaGFkb3cuY3NzLm1hcCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1739904795),('0Sq8f86wzd13JELWUmxUSuMcpFlNKB4cTV1wohbW',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiUlZzbkt6c3prOTY5dlp5ZTlGVVdLM1BodTA5c3lFaUZ1em9wZzB1SSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjk6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9jb250YWN0Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1739904770),('LKV0EmjL9bwVEPxC4E7UM25O3zGxHYcriHAiYFPV',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36','YToyOntzOjY6Il90b2tlbiI7czo0MDoidUkwN1Zublk0RHFaTmhmZWFpR2MzMUY0aWF0Nlk3bFE1TTVDTDBnUyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1739904474),('7hwNrUwTHTdPKA4VuwX9AxdAj5GbGTDjtrLwEpdm',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36','YToyOntzOjY6Il90b2tlbiI7czo0MDoiN1BGMzByQnV2c3pXemxpTElvRmpxWGJ1N1J6UDdESlFpYmJRYzNkTiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1739904761),('5YZveL16UOPXLojylGWovqy9Epd0bxpBzbtXhxha',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoicW9LeWZCNEZIeW1sdVBNSklTbDZqeWxOaTNuYmM1dmZMZHBTZE5vRyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1739897371),('m9v2x293yAuXX1Xgfh4uGlVqHfwm9AIj5Ae9iQRS',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiUlBDc1RtT3VVbGsxNm5CZXRxam5wSkZqeUVkMEZsRXQzVHB2dG9USSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjk6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9jb250YWN0Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1739897423),('G75H4xEttk6Yna7e2uIyTM5hbuuYk6BfaYUeljaT',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36','YToyOntzOjY6Il90b2tlbiI7czo0MDoicW9HVUFPVm13UGhucXJXc2JSSkJ4T3BiUGFmemNGQ3pzZDhQeHRSOCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1739897445),('G8SAKBgn3yx2Yly09oRBzkD0xHB2k5hKFoPBlNTK',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36','YToyOntzOjY6Il90b2tlbiI7czo0MDoiWW1ocnlyUEZ1M0Fja3YyRDVNdzlmSDVDWkszaDhQbEQ0N0VlVmpXbSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1739897465),('cvjP1n0ZDknPUuW1zigQyMtErh0Rk3ApoSBlf3rV',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiVFVkd0JoZE55TW1SVnhhSHIzazNoQ2FaVXBYWnV1OVhmNWNZMzZabSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9sb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1739897474),('7h0GqOjMlR3r8lEI9JXYCf2M8XmHXiHOAUcVmzoF',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36','YToyOntzOjY6Il90b2tlbiI7czo0MDoic2NTVkpma1ROYnd6SEhseWZGN0JTYm9XSllHSGJJQXM4Z3RjRnZsUiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1739897481),('ncocUessS6rwf06osfhKa7zrbBqt3i8arEotLCj8',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoidjkyTHZGWjdaWGFuNGpRN3lGZHJWeE5zSW85YzNPVk85VW1MTHNJQyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjk6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9jb250YWN0Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1739897498),('JAODI0ooMxrcVsT9XrLX5yx0MnM2aDVu19C7kmbk',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiTU1QUmVPdHkwSlhDMldmVE94RjBMTXpHZEFTdVNodk5rcVFaMDdYMSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9sb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1739897500),('5P2DUmogvZKCdzF08qx5pwKWWFbxUmUkNqZ2wyK8',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36','YToyOntzOjY6Il90b2tlbiI7czo0MDoiSVNIcjIwYk81N1UyN2Z2RFlqWHdoYlpHeUlEUHZhMVJXYlRneHczcyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1739897505),('hs0B2FNnTIpai04h4ZULVMaHE0et5V0pdZOc7e3R',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36','YToyOntzOjY6Il90b2tlbiI7czo0MDoiaW1ENmFXUXJtWmtwWjhwazd1Ymg0OXVvZXExSmRYcjFMUWRDVVlNSyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1739897705),('uRq33I6y7JmaSOVI1l3MaiTzbBePRfxJ977Aw8tL',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36','YToyOntzOjY6Il90b2tlbiI7czo0MDoiWWNxRFM5VjFFZ2NRZnd0YlN3MUwyN3FOajNIdXo0Sm9rdzFXVGtLeSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1739897716),('rmqgMPAsDqePsz73MQawrFIaXz8lbSmj4byatGMS',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiV0JQTDYwY05KTXhaZEdpS05qbElKWmZQY2VRSThpQTRuYzlwZXpTMyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9yZWdpc3RlciI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1739897721),('gTREqhYPLVtru28i4LUh9iMPiySRKTbwL5DZWAXb',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36','YToyOntzOjY6Il90b2tlbiI7czo0MDoiU3JtRWhqdEJPRXhwS3ROd1dtcWxhVkxBZWM3d3JGVEdZQjJWZ290byI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1739897771),('WimZUVAPCFBOH3LCEfkygIcGl0lMxzsKxOR5z5Gg',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoid2l0WGE5N1RVQ0NSQzI0WWZqUkRkRmxIemVaMkJ6aHpZTTQ5bmgyeCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9sb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1739897881),('tdulv734R1PhX6DyYPaZo1bdiRKYBDrdUx83Ya6j',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36','YToyOntzOjY6Il90b2tlbiI7czo0MDoiQjFERHZXVnBacWFJZUJlMlJtOTlUZkxXald0cE5JVUNYRTV2UHJsQSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1739897902),('cktvu0qnGMsQQYYCkaVHThXWmUSpuGUF7Tnnzy7a',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36','YToyOntzOjY6Il90b2tlbiI7czo0MDoiSWNwRDVCNEhpZHk4Y0VJMWRLQ09oakdjV1dlU1FlUFFnU2pDWEdHZSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1739898513),('iiUSoVJVHXVoGssLFYDDPJ1U0TeyBH2Doleh03mg',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36','YToyOntzOjY6Il90b2tlbiI7czo0MDoiMzdSZUxuTmNMTDNyeVQxYlA0YXduZlVzUGJaY1g5UjRmcmNhaHZ1eCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1739898917),('RuGOyVAvG6v1SQhVwUssGNkeJtaYgfTewSXcAHiV',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiV09LWVVoRTIwV1g0SDdQSjNtemM3SFRjUzJNNlowb21TNXdHSHBFQyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1739898927),('mipEkdGTwGJWiYNwShXzwfwImLA2lGMUi5vLSbig',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiYVhlMDJmdkdIZmFQb2JONkduSzgwOUc5VXpKR0J0dE9iV0FsNlFmNSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjk6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9jb250YWN0Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1739898949),('LE1oJMLusWcEcJrFF8LYQfzRAo29UfLNv7cRA0kq',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiR1gwTHNxdnlsdjVUM0JEUzJQdXJYQkt4b3Y3c3dVakdUdWpOQmNvdyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9zb3VyY2VNYXAvYXNzZXRzL2Nzcy9zaGFkb3cuY3NzLm1hcCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1739898964),('3pEIDXqsuus1JoYX3OozvFV1zEP4UfilWF0mN39J',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiTUV3NHp4cFJRZWY1TU41NmFWQjVwSkV0M2dNcDBCbXZqOWYxNkNhTCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9zb3VyY2VNYXAvYXNzZXRzL2Nzcy9zaGFkb3cuY3NzLm1hcCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1739898964),('eRvu7i2Zw8eqj9MtkPYSsuvvfG7Hc9eRdWOV2E8c',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoia1lxblR4TkZEM1VFY1liUDNHTjdRRzVFemRseHdwNkdUWGk2VjY1RSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9zb3VyY2VNYXAvYXNzZXRzL2Nzcy9zaGFkb3cuY3NzLm1hcCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1739898964),('WxD6S5ISpxOp7tXh3vB7Ry0sTEgqcMrCOz5M3OtJ',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36','YToyOntzOjY6Il90b2tlbiI7czo0MDoiNjB2eXk3b01oOUp1c3VQa1gxV0o3djhrcHVkYmZGMGtsbUVBZ21WUiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1739898965),('yfQvEKFLn2AvWnxB28919xeAizpk3j31BJfA4yq6',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiTjdDaDZWNzNBa1cyaVJBeFB6WHI2TXIzNFI3NmtxRFdxbkJzM0xPOSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9sb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1739898982),('wY1S5ofLexZdQuuk9h3u0fNojycH1FJc2AUcfkcR',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36','YToyOntzOjY6Il90b2tlbiI7czo0MDoiREw3ZXlmOHJtWHRiYTcwQm85QzlQaHVjQjJuU3V3eGtibTYyeFU3cCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1739898983),('sraWCJRWlsEBdRH3lZqUKExXHxdsKjKganqaNDac',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiYnFoWTdnNFBrR0Iya1BkWW41Z0piMG5xZUhRMDVTT3g1RnNEdDI1UCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjk6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9jb250YWN0Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1739899166),('YnYtN7Q7HcLRmSIxddM3cprK3kdek4vPqFv7dpYx',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiUWhwN2Z5QzN2eDFaeEVtTnNsUDlPNXpqTm1qYXFrUVBvTFF2R0ZnaCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9zb3VyY2VNYXAvYXNzZXRzL2Nzcy9zaGFkb3cuY3NzLm1hcCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1739899186),('U2ojTKDfFtzUaS5lDmFkCYXJ2RiWrTGE7JxrxZsn',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiTXNNN0thUVV4VVpsOVhUMHlEQW5WU1RadnZWRURkdER6Rjl3ZEg4OCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9zb3VyY2VNYXAvYXNzZXRzL2Nzcy9zaGFkb3cuY3NzLm1hcCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1739899186),('MDRpaADae16iMyjngAKa0kAEwCdawWiyKiCoSLGA',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoibElTYm9STE1TZFJTVTVXUmhSRDNreFQ0ejM1UUM4b3dIbm94ZWdUZiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9zb3VyY2VNYXAvYXNzZXRzL2Nzcy9zaGFkb3cuY3NzLm1hcCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1739899186),('TBP3iGOnr7F2iNoDg1f8w75PcnjMAlgNaKFv4Vx9',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36','YToyOntzOjY6Il90b2tlbiI7czo0MDoiYUZlMWl6NHJ6dGNldWVFNHlxdk5oU1AyTnUzOGZEOG5ZUHF4bGREYiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1739899207),('9x7UlR1HAYre80GTCFECeSAUDOBcnJ5dnCLKgHZw',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoibVFyNHFET0N0c2VNcFk2N3pVVDQ1OERzRTNjY2Nsa2czZFNYSUpNNSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjk6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9jb250YWN0Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1739899880),('872VbGCgAqe4CVUAcdGsRDkibLNtSHyCg2HCFToL',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiNU1HaHhFSHlYVkh4SWFBeUNqQU5HNkJMaExiakVXTUphMFVXSnVxbyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9sb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1739899884),('q9UPyIgNmUDyxpYA5HbMyPjU6yueSb03R0pX55zh',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36','YToyOntzOjY6Il90b2tlbiI7czo0MDoib2g2Z2NWY1FiQnhHRkNsYlpJU2tIbXNzcWcydm1qQ01lYktFMHZ3RiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1739899887),('AEGF0ol7Vj1EkSpsu7vdIJj0n1pLD8F6gVJZe6bK',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoibVVVUERGSEd3bUxWQ3dQRjN5bTJXTUp6ZWU0OWRMd1MxT0FwWkJQWiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjk6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9jb250YWN0Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1739904446),('bDo30VXiNvUkGKGyj3nweUx45oBPtho7AB8k8a93',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoickdZQTAwUnBXblBXdHg0Q2VBbzd5SmM4UkRjS05mSlBFajA3NWFzcyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9zb3VyY2VNYXAvYXNzZXRzL2Nzcy9zaGFkb3cuY3NzLm1hcCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1739904470),('dUpCBKFeW5UUQxPEbBSmxSlavrhjHYa6SJ6aNOuF',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiaWVBZzFiWWRqWlBNYkJYTE5aTTExVDloME9QVzh1QXZKWlBzZkVvTyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9zb3VyY2VNYXAvYXNzZXRzL2Nzcy9zaGFkb3cuY3NzLm1hcCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1739904470),('zFJARegC3vILwzI22SplkkrHAlVfAK7Rk1MVEihd',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiMndDakVqa0VoMldKR3dXaHN1YXU3Q2VEOU1PMFc1SjZmTndmWFZFWSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9zb3VyY2VNYXAvYXNzZXRzL2Nzcy9zaGFkb3cuY3NzLm1hcCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1739904470);
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trips`
--

DROP TABLE IF EXISTS `trips`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trips` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `driver_id` bigint unsigned NOT NULL,
  `lieu_depart` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lieu_arrivee` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` datetime NOT NULL,
  `heure_depart` time NOT NULL,
  `heure_arrivee` time NOT NULL,
  `prix_personne` double NOT NULL,
  `nb_place` int NOT NULL,
  `eco_friendly` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `statut` enum('en cours','termin├®','annul├®') COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `trips_driver_id_foreign` (`driver_id`),
  KEY `trips_user_id_foreign` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trips`
--

LOCK TABLES `trips` WRITE;
/*!40000 ALTER TABLE `trips` DISABLE KEYS */;
INSERT INTO `trips` VALUES (41,18,'Montpellier','Nice','2025-02-28 14:30:00','00:00:00','00:00:00',18.5,3,1,NULL,NULL,NULL,'en cours'),(40,17,'Nantes','Paris','2025-02-28 10:45:00','00:00:00','00:00:00',31,2,0,NULL,NULL,NULL,'en cours'),(39,16,'Toulouse','Bordeaux','2025-02-28 15:00:00','00:00:00','00:00:00',17.5,4,1,NULL,NULL,NULL,'en cours'),(38,15,'Lille','Rennes','2025-02-28 11:30:00','00:00:00','00:00:00',21,3,0,NULL,NULL,NULL,'en cours'),(37,14,'Paris','Strasbourg','2025-02-27 08:00:00','00:00:00','00:00:00',29,2,1,NULL,NULL,NULL,'en cours'),(36,13,'Bordeaux','Lille','2025-02-27 13:45:00','00:00:00','00:00:00',26.5,3,0,NULL,NULL,NULL,'en cours'),(35,12,'Marseille','Montpellier','2025-02-26 12:15:00','00:00:00','00:00:00',16,4,1,NULL,NULL,NULL,'en cours'),(34,11,'Lyon','Toulouse','2025-02-26 07:30:00','00:00:00','00:00:00',30,2,0,NULL,NULL,NULL,'en cours'),(33,10,'Rennes','Paris','2025-02-25 09:45:00','00:00:00','00:00:00',27,3,1,NULL,NULL,NULL,'en cours'),(32,9,'Strasbourg','Lyon','2025-02-25 08:30:00','00:00:00','00:00:00',23.5,2,0,NULL,NULL,NULL,'en cours'),(31,8,'Nice','Marseille','2025-02-24 16:45:00','00:00:00','00:00:00',14,4,1,NULL,NULL,NULL,'en cours'),(30,7,'Bordeaux','Nantes','2025-02-24 15:30:00','00:00:00','00:00:00',19.75,3,0,NULL,NULL,NULL,'en cours'),(29,6,'Montpellier','Toulouse','2025-02-23 14:00:00','00:00:00','00:00:00',22,2,1,NULL,NULL,NULL,'en cours'),(28,5,'Nantes','Rennes','2025-02-23 11:00:00','00:00:00','00:00:00',12.5,4,0,NULL,NULL,NULL,'en cours'),(27,4,'Toulouse','Bordeaux','2025-02-22 10:15:00','00:00:00','00:00:00',18,3,1,NULL,NULL,NULL,'en cours'),(26,3,'Lille','Strasbourg','2025-02-22 07:45:00','00:00:00','00:00:00',25,2,1,NULL,NULL,NULL,'en cours'),(25,2,'Marseille','Nice','2025-02-21 09:30:00','00:00:00','00:00:00',15,4,0,NULL,NULL,NULL,'en cours'),(24,1,'Paris','Lyon','2025-02-21 08:00:00','00:00:00','00:00:00',20.5,3,1,NULL,NULL,NULL,'en cours'),(42,19,'Lyon','Bordeaux','2025-02-28 16:00:00','00:00:00','00:00:00',25,4,0,NULL,NULL,NULL,'en cours'),(43,20,'Marseille','Lille','2025-02-28 08:15:00','00:00:00','00:00:00',35,2,1,NULL,NULL,NULL,'en cours');
/*!40000 ALTER TABLE `trips` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nom` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prenom` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pseudo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telephone` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `adresse` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_naissance` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` blob,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `role` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user',
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Test User',NULL,'User1','test@example.com','2025-02-17 20:50:18','$2y$12$9rACylggyrBmZBpiPWCGA.iFuwG/fUM4H2VS9yqiZBr99R/cpSVAu',NULL,NULL,NULL,NULL,'o4R5OaAaEa','2025-02-17 20:50:18','2025-02-18 22:53:54','user'),(2,'D\'AMORE',NULL,'User2','davistres@yahoo.fr',NULL,'$2y$12$Rc7mwLcWM0TBmHraiWAIKuDtXS3Rz7iDAfat7Kabwb/l3fDcaNndS',NULL,NULL,NULL,NULL,NULL,'2025-02-17 21:17:09','2025-02-18 22:53:54','user'),(3,'dd',NULL,'User3','dd@dd.fr',NULL,'$2y$12$ieI1xzkW1lRlHg5.Jw.R0.bUMGHA1QkHfEGwwj0U5pfWhlsraOLfe',NULL,NULL,NULL,NULL,NULL,'2025-02-18 21:00:05','2025-02-18 22:53:54','user'),(4,'cc',NULL,'User4','cc@cc.fr',NULL,'$2y$12$oEWWylU4rqdcBflVa1srNOLjtG5GFn561aYgmemOwBixUorAu0Eca',NULL,NULL,NULL,NULL,NULL,'2025-02-18 21:04:51','2025-02-18 22:53:54','user'),(5,'Admin',NULL,'User5','admin@ecoride.com',NULL,'$2y$12$uH0s80Jt7pbCxflvI2qDeu6Zhx9glczBQ2WlReZTzqso5bAQ7o.VG',NULL,NULL,NULL,NULL,NULL,'2025-02-18 22:06:06','2025-02-18 22:53:54','user'),(6,'Employ├®',NULL,'User6','employe@ecoride.com',NULL,'$2y$12$Yx2bJqoPwWhx4HfnHjKuLu6/3dVTT36GULvzGEJWwzVmecojz1re2',NULL,NULL,NULL,NULL,NULL,'2025-02-18 22:06:19','2025-02-18 22:53:54','user');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `voiture`
--

DROP TABLE IF EXISTS `voiture`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `voiture` (
  `voiture_id` int NOT NULL AUTO_INCREMENT,
  `modele` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `immatriculation` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `energie` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `couleur` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `date_premiere_immatriculation` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `marque_id` int DEFAULT NULL,
  `utilisateur_id` int DEFAULT NULL,
  PRIMARY KEY (`voiture_id`),
  UNIQUE KEY `UC_Voiture_Immatriculation` (`immatriculation`),
  KEY `idx_voiture_immatriculation` (`immatriculation`),
  KEY `marque_id` (`marque_id`),
  KEY `utilisateur_id` (`utilisateur_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `voiture`
--

LOCK TABLES `voiture` WRITE;
/*!40000 ALTER TABLE `voiture` DISABLE KEYS */;
/*!40000 ALTER TABLE `voiture` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-02-21 17:40:48

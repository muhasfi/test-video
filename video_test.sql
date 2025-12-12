-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versi server:                 8.0.30 - MySQL Community Server - GPL
-- OS Server:                    Win64
-- HeidiSQL Versi:               12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Membuang struktur basisdata untuk video_test
CREATE DATABASE IF NOT EXISTS `video_test` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `video_test`;

-- membuang struktur untuk table video_test.cache
CREATE TABLE IF NOT EXISTS `cache` (
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel video_test.cache: ~0 rows (lebih kurang)
DELETE FROM `cache`;

-- membuang struktur untuk table video_test.cache_locks
CREATE TABLE IF NOT EXISTS `cache_locks` (
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel video_test.cache_locks: ~0 rows (lebih kurang)
DELETE FROM `cache_locks`;

-- membuang struktur untuk table video_test.failed_jobs
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel video_test.failed_jobs: ~0 rows (lebih kurang)
DELETE FROM `failed_jobs`;

-- membuang struktur untuk table video_test.jobs
CREATE TABLE IF NOT EXISTS `jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint unsigned NOT NULL,
  `reserved_at` int unsigned DEFAULT NULL,
  `available_at` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel video_test.jobs: ~0 rows (lebih kurang)
DELETE FROM `jobs`;

-- membuang struktur untuk table video_test.job_batches
CREATE TABLE IF NOT EXISTS `job_batches` (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel video_test.job_batches: ~0 rows (lebih kurang)
DELETE FROM `job_batches`;

-- membuang struktur untuk table video_test.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel video_test.migrations: ~6 rows (lebih kurang)
DELETE FROM `migrations`;
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '0001_01_01_000000_create_users_table', 1),
	(2, '0001_01_01_000001_create_cache_table', 1),
	(3, '0001_01_01_000002_create_jobs_table', 1),
	(4, '2025_12_10_065041_videos', 1),
	(5, '2025_12_10_065051_create_video_requests_table', 1),
	(6, '2025_12_10_065234_create_video_accesses_table', 1);

-- membuang struktur untuk table video_test.password_reset_tokens
CREATE TABLE IF NOT EXISTS `password_reset_tokens` (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel video_test.password_reset_tokens: ~0 rows (lebih kurang)
DELETE FROM `password_reset_tokens`;

-- membuang struktur untuk table video_test.sessions
CREATE TABLE IF NOT EXISTS `sessions` (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `ip_address` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel video_test.sessions: ~14 rows (lebih kurang)
DELETE FROM `sessions`;
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
	('3fo0ysyHvBrTcAdQNzdDvoAQpAILNczn1vmDEZ2P', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiY1FaVkZONE5UamphNFE1dFN2UTB5Y3VrNnpjYU9MaERoWmhVUUlTMSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czozOiJ1cmwiO2E6MDp7fXM6OToiX3ByZXZpb3VzIjthOjI6e3M6MzoidXJsIjtzOjM0OiJodHRwOi8vbG9jYWxob3N0OjgwMDAvZGFmdGFyLXZpZGVvIjtzOjU6InJvdXRlIjtzOjEyOiJkYWZ0YXItdmlkZW8iO31zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxO30=', 1765462694),
	('7CCgVm1AZjuLYWTlPiC6ZUNYKQ3hnYbLd7L1FIFi', 4, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiQW05MTVINk52eFpRSkg1NE1uRFBsWVJWUDNzN0pmeHlCcnBGaU1tViI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9kYWZ0YXItdmlkZW8iO3M6NToicm91dGUiO3M6MTI6ImRhZnRhci12aWRlbyI7fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjQ7fQ==', 1765461333),
	('7rvnYcYdV3kZtu1qNyrxWi2qtirJJboye4yjmGfH', 6, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiMmRKNTdFTkpMVG1HMFBKUXJaOFRwd2pGWkVnR2QxUHltVlkyZlVaUyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDE6Imh0dHA6Ly8yMWQyY2Y1ZDQyZWQubmdyb2stZnJlZS5hcHAvdmlkZW9zIjtzOjU6InJvdXRlIjtzOjEyOiJ2aWRlb3MuaW5kZXgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aTo2O30=', 1765466028),
	('cMogNgFIBKkm1rqTs1rpvBAjIPQ5BB349bxd1j57', NULL, '127.0.0.1', 'WhatsApp/2.23.20.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicnZRM2dHTGFLSEZqSmtBS0hjYVV0R25iNm5jUnZIdE1qcUI5VXlmbSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDA6Imh0dHA6Ly9lYzM0YzlmY2U2NGQubmdyb2stZnJlZS5hcHAvbG9naW4iO3M6NToicm91dGUiO3M6NToibG9naW4iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1765461376),
	('DDaRVVv5bMm4XrtfLST2qJpvwheRy8QyorNYeHC4', NULL, '127.0.0.1', 'WhatsApp/2.23.20.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSGIxbk5uSTNYclA3NElUNGVUVXI4anRlOVl6M0xWWEFoOEhIN3hHZSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDA6Imh0dHA6Ly8yMWQyY2Y1ZDQyZWQubmdyb2stZnJlZS5hcHAvbG9naW4iO3M6NToicm91dGUiO3M6NToibG9naW4iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1765462751),
	('dvX9HJxxQczS53xBGHKJbyM4rDhUuBkTCz6JOdHx', NULL, '127.0.0.1', 'WhatsApp/2.23.20.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVE1va3E2UzhCSnZRTHR1eTE4VVlpZEFzNDlEazN2QzJYS3VlZWNueiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDA6Imh0dHA6Ly8yMWQyY2Y1ZDQyZWQubmdyb2stZnJlZS5hcHAvbG9naW4iO3M6NToicm91dGUiO3M6NToibG9naW4iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1765461863),
	('k5mnrhu8C2qDyX5TF3koHZBeYY1AYIEgJaZNRsDF', 6, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiM3R4aWFabmpnUldCWFRXazdHYWJGWTdEcVJRNk9tamFOMWZKbFRqZiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDE6Imh0dHA6Ly9lYzM0YzlmY2U2NGQubmdyb2stZnJlZS5hcHAvdmlkZW9zIjtzOjU6InJvdXRlIjtzOjEyOiJ2aWRlb3MuaW5kZXgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aTo2O30=', 1765461444),
	('k7KQeLMzqoXlQ0ht3073RoxYTpGy3sedaPU73La1', 6, '127.0.0.1', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Mobile Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiekJLTkc4QjNocG56djFZVFR5YVVvUktmUGkwajBuSnBORVRCY28xOCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDE6Imh0dHA6Ly8yMWQyY2Y1ZDQyZWQubmdyb2stZnJlZS5hcHAvdmlkZW9zIjtzOjU6InJvdXRlIjtzOjEyOiJ2aWRlb3MuaW5kZXgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aTo2O30=', 1765466431),
	('nCZx0u68pBSVOaTvaUcE7Dt3gEHWq0gwc4wXTNtZ', NULL, '127.0.0.1', 'WhatsApp/2.23.20.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRUd1U3hRd1hlZEVRcXNrZU5Id2ZCT3kxYzYyYnZJZDhnSDdwWHRqcSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly9lYzM0YzlmY2U2NGQubmdyb2stZnJlZS5hcHAiO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1765461376),
	('RSdcs3lGr8M0Rg26cWIGtTpta6IhuSCLishLv3b9', 6, '127.0.0.1', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Mobile Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoibnA1R2gyUEtDTldzQm9OSG0yVGtxQVhTdGdER2RBU1NQNk1qREFGRyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDQ6Imh0dHA6Ly8yMWQyY2Y1ZDQyZWQubmdyb2stZnJlZS5hcHAvZGFzaGJvYXJkIjtzOjU6InJvdXRlIjtzOjk6ImRhc2hib2FyZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjY7fQ==', 1765465978),
	('wmxI4t5JeL0W9ZsttgmKJgkAEtQL4IgglQHjPlsv', 6, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiWGVtSUxDcHR4SmlDQVFvUXZEVWdKUVlDNlNzbXZaMUhtRFFKT2J5ciI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDc6Imh0dHA6Ly8yMWQyY2Y1ZDQyZWQubmdyb2stZnJlZS5hcHAvZGFmdGFyLXZpZGVvIjtzOjU6InJvdXRlIjtzOjEyOiJkYWZ0YXItdmlkZW8iO31zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aTo2O30=', 1765463919),
	('x1ouWiN3VvLtLo5DHnjslW6Hc2tnAFTd6yGhq0OO', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoicWoyT1MwNUNxN2lna1NFNnkxdTdDb21rZ0puUXRONWtXbnRoVTV3eCI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czozNToiaHR0cDovL2xvY2FsaG9zdDo4MDAwL3ZpZGVvLzIvd2F0Y2giO31zOjk6Il9wcmV2aW91cyI7YToyOntzOjM6InVybCI7czoyNzoiaHR0cDovL2xvY2FsaG9zdDo4MDAwL2xvZ2luIjtzOjU6InJvdXRlIjtzOjU6ImxvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1765459556),
	('y7sAj0vr33uOPXwNMuPq1hr5mjEf9K2AMfVzbjFL', NULL, '127.0.0.1', 'WhatsApp/2.23.20.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYURSRXhZbjYwVDhYa3NpWWtySVFxSlNGb3BTUXg4aGN4RVJaUmo3YSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8yMWQyY2Y1ZDQyZWQubmdyb2stZnJlZS5hcHAiO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1765462750),
	('yLyj0PiDKMg6ZYRfXTKBqur823ZL9mGYsjcarr82', NULL, '127.0.0.1', 'WhatsApp/2.23.20.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTTBDZzBSQnRpTkVoUHpFOG1HUE9HN0pITGxBT052S250ZlJLek1MYiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8yMWQyY2Y1ZDQyZWQubmdyb2stZnJlZS5hcHAiO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1765461863),
	('yZVUcEzpuuu1nJHDOi1WS4u2NQYCcBrX2gdH8jbX', 6, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiMUdGNWFpOU54d2Y2QzVLUW1ia3lKRWtrbFJHUzhQWTNOOEpZUDZZWiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzU6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC92aWRlby82L3dhdGNoIjtzOjU6InJvdXRlIjtzOjIwOiJjdXN0b21lci52aWRlby53YXRjaCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjY7fQ==', 1765511906);

-- membuang struktur untuk table video_test.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_username_unique` (`username`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel video_test.users: ~4 rows (lebih kurang)
DELETE FROM `users`;
INSERT INTO `users` (`id`, `name`, `username`, `email`, `email_verified_at`, `password`, `role`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 'Mrs. Suzanne Dare', 'mccullough.ozella', 'addison.murray@example.net', '2025-12-10 01:10:25', '$2y$12$ZWQZnFuZsGo5G4tCeWzukeqEHv9eSMGgRpj4vB8yLQIZRI53vjlqq', 'admin', 'Oa0yjLu4DBtvsXptL9Ih4O6pNIT1RkVsGX8rAxKq40l7CtD82T6hjqzczrD3', '2025-12-10 01:10:26', '2025-12-10 01:10:26', NULL),
	(2, 'Test User', 'sam.mante', 'test@example.com', '2025-12-10 01:10:26', '$2y$12$JkN0HcN1eAr/ir0zA464Ke1tkc9qkmKtdsaoCSIipoKOO2dfish1O', 'customer', 'LL2ppnayTe', '2025-12-10 01:10:26', '2025-12-11 02:04:44', NULL),
	(4, 'hasfi', 'hasfi', 'hasfi@gmail.com', NULL, '$2y$12$sDhM6UzAUxBM2E/6RQylVOgOHnus0zfA8Dwn8oEP/OdfAxvIbzrWa', 'customer', NULL, '2025-12-10 01:50:36', '2025-12-10 01:50:36', NULL),
	(6, 'admin', 'admin', 'admin@gmail.com', NULL, '$2y$12$hm1z/2F5umgY1hW/5zJPkOjjo7obxzb9REOrVSI/KWdIaZzdSFWJe', 'admin', NULL, '2025-12-11 11:53:25', '2025-12-11 11:54:02', NULL),
	(8, 'hass1', 'hass1', 'hass1@gmail.com', NULL, '$2y$12$Zvgxf.LDv5uCn/hsU1tJueURB09wqwZOtr8W.RGijPyKhnfVtKAE.', 'customer', NULL, '2025-12-12 03:07:04', '2025-12-12 03:08:08', NULL),
	(9, 'Ed Collins', 'rachel.muller', 'oconner.khalil@example.net', '2025-12-12 03:59:41', '$2y$12$O3bNLyCBqnF6YQNF/5COLeRW1kz71VO59HqDZbKJwOH.i3lqewA76', 'admin', 'JDPlqjYX2G', '2025-12-12 03:59:41', '2025-12-12 03:59:41', NULL),
	(11, 'Milford Macejkovic', 'asia.graham', 'porter22@example.net', '2025-12-12 04:01:44', '$2y$12$rwKDjhWheSv44SME3czlUOZ4TG9XTQxIGJ1PoMPskKdmsmy6KuPKq', 'admin', 'qv4ICWJoCV', '2025-12-12 04:01:44', '2025-12-12 04:01:44', NULL),
	(13, 'Laura Zboncak Sr.', 'bkuhn', 'schultz.brenna@example.org', '2025-12-12 04:02:32', '$2y$12$2iWq3iwbHncrmGOtI3d9xOA9R.lGEJ8gGgq64sEoUnMnPzt30xuqK', 'admin', 'N9u5j1Cc2W', '2025-12-12 04:02:33', '2025-12-12 04:02:33', NULL);

-- membuang struktur untuk table video_test.videos
CREATE TABLE IF NOT EXISTS `videos` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `video_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel video_test.videos: ~11 rows (lebih kurang)
DELETE FROM `videos`;
INSERT INTO `videos` (`id`, `title`, `description`, `video_url`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 'test', 'test', 'https://www.youtube.com/watch?v=eknAn5hNC9k&list=RDUI2Ybr9e7KY&index=7', '2025-12-10 00:58:55', '2025-12-10 01:07:46', '2025-12-10 01:07:46'),
	(2, 'judul', 'test', 'http://localhost:8000/storage/videos/A0q1O7MydRhzSO1PtY69CrKK2q3voM85s4XQsZr6.mp4', '2025-12-10 02:09:39', '2025-12-11 13:55:18', '2025-12-11 13:55:18'),
	(3, 'roblox', 'test', 'http://localhost:8000/storage/videos/jcrAEwGAQ3qAbu53epD06FDi1TnQ8PbcbrockhdD.mp4', '2025-12-11 10:09:16', '2025-12-11 13:55:26', '2025-12-11 13:55:26'),
	(4, '1', 'twt', 'https://youtube.com/watch?v=jew368', '2025-12-11 10:09:45', '2025-12-12 03:08:58', '2025-12-12 03:08:58'),
	(6, 'video 3', 'video 3', 'http://localhost:8000/storage/videos/w1M2WqXxDoSajSOv9HQHvV8zsU7yX83PQQ858rLW.mp4', '2025-12-11 12:45:38', '2025-12-12 03:55:52', NULL),
	(7, 'test', 'test', 'http://localhost:8000/storage/videos/EmQYWRg2vsYadROHJLzmyv11P6WyL4U75Kwpotl5.mp4', '2025-12-11 12:54:05', '2025-12-11 13:55:14', '2025-12-11 13:55:14'),
	(8, 'Video 1', 'Vdideo 1', 'https://www.youtube.com/watch?v=eknAn5hNC9k&list=RDUI2Ybr9e7KY&index=7', '2025-12-11 12:54:27', '2025-12-11 12:54:27', NULL),
	(9, 'p', 'p', 'https://www.youtube.com/watch?v=eknAn5hNC9k&list=RDUI2Ybr9e7KY&index=7', '2025-12-11 13:15:09', '2025-12-12 03:08:48', '2025-12-12 03:08:48'),
	(10, 'video 2', 'video 2', 'https://www.youtube.com/watch?v=eknAn5hNC9k&list=RDUI2Ybr9e7KY&index=1', '2025-12-11 13:15:22', '2025-12-12 03:36:04', NULL),
	(11, 'Loker', 'Inpo', 'https://21d2cf5d42ed.ngrok-free.app/videos/create', '2025-12-11 14:24:37', '2025-12-12 03:08:28', '2025-12-12 03:08:28'),
	(12, 'Ini video 1', 'Nomer 1', 'https://youtube.com/watch?v=lvg740', '2025-12-11 14:30:17', '2025-12-12 03:36:47', NULL),
	(13, 'video 4', 'video 4', 'http://localhost:8000/storage/videos/9VYz4cXoBgEqByYLanor0IDWUxhy4f5jwcCOaJ9j.mp4', '2025-12-12 03:51:31', '2025-12-12 03:51:31', NULL);

-- membuang struktur untuk table video_test.video_accesses
CREATE TABLE IF NOT EXISTS `video_accesses` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `video_id` bigint unsigned NOT NULL,
  `start_access` timestamp NOT NULL,
  `end_access` timestamp NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `video_accesses_user_id_foreign` (`user_id`),
  KEY `video_accesses_video_id_foreign` (`video_id`),
  CONSTRAINT `video_accesses_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `video_accesses_video_id_foreign` FOREIGN KEY (`video_id`) REFERENCES `videos` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel video_test.video_accesses: ~5 rows (lebih kurang)
DELETE FROM `video_accesses`;
INSERT INTO `video_accesses` (`id`, `user_id`, `video_id`, `start_access`, `end_access`, `created_at`, `updated_at`) VALUES
	(14, 6, 4, '2025-12-11 14:15:23', '2025-12-11 15:15:23', '2025-12-11 14:15:23', '2025-12-11 14:15:23'),
	(15, 1, 4, '2025-12-11 14:17:11', '2025-12-11 15:17:11', '2025-12-11 14:17:11', '2025-12-11 14:17:11'),
	(16, 1, 10, '2025-12-11 14:17:57', '2025-12-11 15:17:57', '2025-12-11 14:17:57', '2025-12-11 14:17:57'),
	(17, 6, 6, '2025-12-11 14:18:38', '2025-12-11 15:18:38', '2025-12-11 14:18:38', '2025-12-11 14:18:38'),
	(18, 6, 12, '2025-12-11 14:30:40', '2025-12-11 15:30:40', '2025-12-11 14:30:40', '2025-12-11 14:30:40'),
	(19, 6, 8, '2025-12-12 03:50:17', '2025-12-12 04:50:17', '2025-12-12 03:50:17', '2025-12-12 03:50:17'),
	(20, 6, 13, '2025-12-12 03:53:38', '2025-12-12 05:53:38', '2025-12-12 03:53:38', '2025-12-12 03:53:38'),
	(21, 6, 6, '2025-12-12 03:56:34', '2025-12-12 04:56:34', '2025-12-12 03:56:34', '2025-12-12 03:56:34');

-- membuang struktur untuk table video_test.video_requests
CREATE TABLE IF NOT EXISTS `video_requests` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `video_id` bigint unsigned NOT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `video_requests_user_id_foreign` (`user_id`),
  KEY `video_requests_video_id_foreign` (`video_id`),
  CONSTRAINT `video_requests_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `video_requests_video_id_foreign` FOREIGN KEY (`video_id`) REFERENCES `videos` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel video_test.video_requests: ~7 rows (lebih kurang)
DELETE FROM `video_requests`;
INSERT INTO `video_requests` (`id`, `user_id`, `video_id`, `status`, `created_at`, `updated_at`) VALUES
	(21, 6, 4, 'approved', '2025-12-11 14:15:15', '2025-12-11 14:15:23'),
	(22, 1, 4, 'approved', '2025-12-11 14:17:05', '2025-12-11 14:17:11'),
	(23, 1, 10, 'approved', '2025-12-11 14:17:52', '2025-12-11 14:17:57'),
	(24, 6, 6, 'approved', '2025-12-11 14:18:28', '2025-12-11 14:18:38'),
	(25, 6, 8, 'rejected', '2025-12-11 14:20:58', '2025-12-11 14:21:09'),
	(26, 6, 12, 'approved', '2025-12-11 14:30:30', '2025-12-11 14:30:40'),
	(27, 6, 11, 'rejected', '2025-12-11 15:20:11', '2025-12-12 03:14:17'),
	(28, 6, 8, 'approved', '2025-12-12 03:48:23', '2025-12-12 03:50:19'),
	(29, 6, 13, 'approved', '2025-12-12 03:53:14', '2025-12-12 03:53:39'),
	(30, 6, 6, 'approved', '2025-12-12 03:56:22', '2025-12-12 03:56:34');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;

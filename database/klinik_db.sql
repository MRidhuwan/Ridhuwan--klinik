-- Adminer 4.8.1 MySQL 5.7.39 dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

SET NAMES utf8mb4;

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(10,	'2014_10_12_000000_create_users_table',	1),
(11,	'2014_10_12_100000_create_password_resets_table',	1),
(12,	'2019_08_19_000000_create_failed_jobs_table',	1),
(13,	'2019_12_14_000001_create_personal_access_tokens_table',	1),
(14,	'2022_02_09_144002_create_pegawai_table',	1),
(15,	'2022_02_09_144055_create_wilayah_table',	1),
(16,	'2022_02_11_131108_create_tindakan_table',	1),
(17,	'2022_02_11_131411_create_obat_table',	1),
(18,	'2022_02_12_063317_create_transaksi_table',	1);

DROP TABLE IF EXISTS `obat`;
CREATE TABLE `obat` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `nama_obat` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `biaya` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `obat` (`id`, `nama_obat`, `biaya`, `created_at`, `updated_at`) VALUES
(1,	'Syrup',	24000,	'2023-06-26 17:35:18',	'2023-06-26 17:35:18'),
(2,	'Mata',	20000,	'2023-06-26 18:37:58',	'2023-06-26 18:37:58');

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `pegawai`;
CREATE TABLE `pegawai` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `NIP` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tempat_lahir` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tanggal_lahir` date NOT NULL,
  `alamat` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `id_wilayah` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pegawai_nip_unique` (`NIP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `pegawai` (`id`, `NIP`, `name`, `tempat_lahir`, `tanggal_lahir`, `alamat`, `created_at`, `updated_at`, `id_wilayah`) VALUES
(2,	'202301',	'codingKU',	'depok',	'1990-03-01',	'awdepok',	'2023-06-26 23:58:33',	'2023-06-27 08:08:13',	3),
(4,	'202302',	'dede',	'testjkt',	'2023-06-03',	'a',	'2023-06-27 00:07:55',	'2023-06-27 00:07:55',	1),
(5,	'202303',	'coding pusing',	'testbandung',	'2023-05-30',	'apa saja',	'2023-06-27 08:11:57',	'2023-06-27 08:13:27',	3);

DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `tindakan`;
CREATE TABLE `tindakan` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `nama_tindakan` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `biaya` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `tindakan` (`id`, `nama_tindakan`, `biaya`, `created_at`, `updated_at`) VALUES
(1,	'Melakukan pengecekan Darah',	55000,	NULL,	NULL),
(2,	'Konsultasi Dokter',	40000,	NULL,	NULL),
(3,	'IGD',	50000,	'2023-06-26 17:34:44',	'2023-06-26 18:25:45'),
(4,	'Operasi',	25000000,	'2023-06-26 18:38:36',	'2023-06-26 18:38:36');

DROP TABLE IF EXISTS `transaksi`;
CREATE TABLE `transaksi` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `NIK_pasien` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama_pasien` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tanggal_lahir_pasien` date NOT NULL,
  `tanggal_pendaftaran` date NOT NULL,
  `keluhan` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_wilayah` int(11) DEFAULT NULL,
  `id_tindakan` int(11) DEFAULT NULL,
  `id_obat` int(11) DEFAULT NULL,
  `total_biaya` int(11) NOT NULL,
  `update_by` int(11) NOT NULL,
  `status_transaksi` enum('butuh_tindakan','butuh_pembayaran','Lunas/Selesai') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'butuh_tindakan',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `transaksi` (`id`, `NIK_pasien`, `nama_pasien`, `tanggal_lahir_pasien`, `tanggal_pendaftaran`, `keluhan`, `id_wilayah`, `id_tindakan`, `id_obat`, `total_biaya`, `update_by`, `status_transaksi`, `created_at`, `updated_at`) VALUES
(1,	'202314416256',	'yuni',	'2023-05-30',	'2023-06-27',	'sakit',	1,	2,	1,	64000,	1,	'Lunas/Selesai',	'2023-06-26 18:19:51',	'2023-06-26 18:22:54'),
(2,	'202314416257',	'DEDE',	'1976-01-27',	'2023-06-27',	'Mata',	2,	2,	1,	64000,	1,	'Lunas/Selesai',	'2023-06-26 18:36:36',	'2023-06-26 18:37:26'),
(3,	'202314416258',	'Test',	'2020-12-20',	'2023-06-27',	'Kecelekanan',	2,	NULL,	NULL,	0,	1,	'butuh_tindakan',	'2023-06-26 18:44:11',	'2023-06-26 18:44:11'),
(4,	'202314416257',	'yuni',	'2023-05-31',	'2023-06-27',	'seriawan',	3,	4,	2,	25020000,	1,	'Lunas/Selesai',	'2023-06-27 08:13:59',	'2023-06-27 08:14:53');

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` enum('superadmin','admin') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'admin',
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `id_pegawai` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `users` (`id`, `name`, `email`, `role`, `password`, `remember_token`, `created_at`, `updated_at`, `id_pegawai`) VALUES
(1,	'SuperAdmin',	'administrator@ridhuwan.test',	'superadmin',	'$2y$10$5aAmzKKvU/rgLk4z4u3qh.91pWgwye6VNDsgt9t549dGRbpHrv6C6',	NULL,	'2023-06-27 01:34:57',	NULL,	0),
(2,	'wawan',	'iwan@web.com',	'admin',	'$2y$10$NNd2CLJkgmgrxDhC0eoTh.o.wUGOXoCHEekjmSGl.nswJFzXKggEC',	NULL,	NULL,	NULL,	0),
(4,	'coding',	'ridhuwan200@gmail.com',	'superadmin',	'$2y$10$1C3c7U3FD20UHDK7D6rtLeHWLhD9HiKfk/hsmggkJ5hcJRf1Mi6Ym',	NULL,	'2023-06-26 23:58:33',	'2023-06-26 23:58:33',	2),
(5,	'dede',	'ridhuwan72@gmail.com',	'admin',	'$2y$10$LEDBHhW6qxndtoM7bgIjA..fBxR9yTg6syvxQvsS.XTEmYTQR4soC',	NULL,	'2023-06-27 00:07:55',	'2023-06-27 00:07:55',	4),
(6,	'coding',	'evanblaster_bsa@yahoo.com',	'admin',	'$2y$10$QS8O11znqkVDbSfUUam1Y./reA/ecNDqEiBOFDaWfOt8LFWk9Dm96',	NULL,	'2023-06-27 08:11:58',	'2023-06-27 08:11:58',	5);

DROP TABLE IF EXISTS `wilayah`;
CREATE TABLE `wilayah` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `nama_wilayah` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `alamat` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `wilayah` (`id`, `nama_wilayah`, `alamat`, `created_at`, `updated_at`) VALUES
(1,	'Banten',	'Serang Kota',	'2023-06-26 17:25:26',	'2023-06-27 00:10:27'),
(2,	'DKI',	'Jakarta',	'2023-06-26 18:25:30',	'2023-06-26 18:25:30'),
(3,	'Jawa Barat',	'Bandung',	'2023-06-27 00:10:42',	'2023-06-27 00:10:42');

-- 2023-06-27 15:45:04

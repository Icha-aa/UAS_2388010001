-- MySQL Schema untuk Siti Hijab Store
-- Versi: MySQL 8.0+

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

-- Database sudah dibuat via MYSQL_DATABASE di docker-compose
-- Cukup buat tabel di sini

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `nama_petugas` varchar(100) NOT NULL,
  `role` enum('admin','kasir') NOT NULL DEFAULT 'kasir',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE IF NOT EXISTS `products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(100) NOT NULL,
  `harga` int(11) NOT NULL,
  `deskripsi` text,
  `gambar` varchar(255) DEFAULT 'default.jpg',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Data awal users (password: 'password')
INSERT IGNORE INTO `users` (`username`, `password`, `nama_petugas`, `role`) VALUES
('admin',      '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'Siti Admin', 'admin'),
('kasir_icha', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'Icha Kasir', 'kasir');

-- Data awal produk
INSERT IGNORE INTO `products` (`nama`, `harga`, `deskripsi`) VALUES
('Pashmina Silk Premium',    75000,  'Bahan silk mewah, jatuh, lembut dan berkilau elegan.'),
('Segiempat Voal Ultrafine', 55000,  'Voal premium tegak di dahi, tidak mendengung, adem seharian.'),
('Khimar Ceruty Double Layer',120000,'Anggun dengan potongan double layer, syari dan tetap ringan.');

COMMIT;

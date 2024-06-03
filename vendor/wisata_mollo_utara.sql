-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Waktu pembuatan: 03 Jun 2024 pada 04.14
-- Versi server: 8.3.0
-- Versi PHP: 7.4.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `wisata_mollo_utara`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `auth`
--

CREATE TABLE `auth` (
  `id` int NOT NULL,
  `image` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `bg` varchar(35) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `auth`
--

INSERT INTO `auth` (`id`, `image`, `bg`) VALUES
(1, 'auth.jpg', '#17244a');

-- --------------------------------------------------------

--
-- Struktur dari tabel `desa`
--

CREATE TABLE `desa` (
  `id_desa` int NOT NULL,
  `desa` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `desa`
--

INSERT INTO `desa` (`id_desa`, `desa`) VALUES
(1, 'tes 1'),
(2, 'tes 2');

-- --------------------------------------------------------

--
-- Struktur dari tabel `fasilitas`
--

CREATE TABLE `fasilitas` (
  `id_fasilitas` int NOT NULL,
  `image_fasilitas` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `nama_fasilitas` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `fasilitas`
--

INSERT INTO `fasilitas` (`id_fasilitas`, `image_fasilitas`, `nama_fasilitas`) VALUES
(4, '', 'SPBU'),
(5, '', 'Puskesmas Kapan'),
(6, '', 'Polsek Mollo Utara'),
(7, '', 'Pasar Kapan'),
(8, '', 'Mutis Hill'),
(9, '', 'Masjid Al-taqwa'),
(10, '', 'Kantor Camat Mollo Utara'),
(11, '', 'Gereja STA. Maria Immaculata'),
(12, '', 'ATM BRI'),
(13, '', 'Apotik Pricilla');

-- --------------------------------------------------------

--
-- Struktur dari tabel `fasilitas_wisata`
--

CREATE TABLE `fasilitas_wisata` (
  `id_fasilitas_wisata` int NOT NULL,
  `id_fasilitas` int DEFAULT NULL,
  `id_wisata` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `fasilitas_wisata`
--

INSERT INTO `fasilitas_wisata` (`id_fasilitas_wisata`, `id_fasilitas`, `id_wisata`) VALUES
(17, 4, 38),
(18, 5, 38),
(19, 6, 38),
(20, 7, 38),
(21, 8, 38),
(27, 4, 50),
(36, 6, 4098),
(37, 7, 4098),
(38, 9, 4098),
(39, 8, 4093),
(40, 11, 4093),
(41, 12, 4093);

-- --------------------------------------------------------

--
-- Struktur dari tabel `galeri`
--

CREATE TABLE `galeri` (
  `id_galeri` int NOT NULL,
  `id_wisata` int DEFAULT NULL,
  `image_galeri` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `galeri`
--

INSERT INTO `galeri` (`id_galeri`, `id_wisata`, `image_galeri`, `created_at`, `updated_at`) VALUES
(3, 40, 'https://852207.tugasakhir.my.id/assets/img/galeri/2442973926.jpg', '2024-05-18 20:00:42', '2024-05-19 18:26:20'),
(4, 40, 'https://852207.tugasakhir.my.id/assets/img/galeri/1945785831.jpg', '2024-05-18 20:00:43', '2024-05-19 18:37:23'),
(5, 40, 'https://852207.tugasakhir.my.id/assets/img/galeri/1561099617.jpg', '2024-05-18 20:00:43', '2024-05-19 18:40:28'),
(6, 43, 'https://852207.tugasakhir.my.id/assets/img/galeri/3318380433.jpg', '2024-05-18 20:03:03', '2024-05-19 18:40:28'),
(7, 43, 'https://852207.tugasakhir.my.id/assets/img/galeri/4080694669.jpg', '2024-05-18 20:03:04', '2024-05-19 18:40:28'),
(8, 43, 'https://852207.tugasakhir.my.id/assets/img/galeri/4022842690.jpg', '2024-05-18 20:03:04', '2024-05-19 18:40:28'),
(9, 43, 'https://852207.tugasakhir.my.id/assets/img/galeri/708270147.jpg', '2024-05-18 20:03:05', '2024-05-19 18:40:28'),
(10, 41, 'https://852207.tugasakhir.my.id/assets/img/galeri/3798652387.jpg', '2024-05-18 20:05:06', '2024-05-19 18:40:28'),
(11, 41, 'https://852207.tugasakhir.my.id/assets/img/galeri/2792813542.jpg', '2024-05-18 20:05:07', '2024-05-19 18:40:28'),
(12, 41, 'https://852207.tugasakhir.my.id/assets/img/galeri/764704171.jpg', '2024-05-18 20:40:53', '2024-05-19 18:40:28'),
(13, 41, 'https://852207.tugasakhir.my.id/assets/img/galeri/1132450218.jpg', '2024-05-18 20:40:54', '2024-05-19 18:40:28'),
(14, 41, 'https://852207.tugasakhir.my.id/assets/img/galeri/3846936169.jpg', '2024-05-18 20:40:55', '2024-05-19 18:40:28'),
(15, 41, 'https://852207.tugasakhir.my.id/assets/img/galeri/2974900047.jpg', '2024-05-18 20:40:55', '2024-05-19 18:40:28'),
(16, 46, 'https://852207.tugasakhir.my.id/assets/img/galeri/2407681797.jpg', '2024-05-18 20:45:05', '2024-05-19 18:40:28'),
(17, 46, 'https://852207.tugasakhir.my.id/assets/img/galeri/321820252.jpg', '2024-05-18 20:45:06', '2024-05-19 18:40:28'),
(18, 46, 'https://852207.tugasakhir.my.id/assets/img/galeri/2337561360.jpg', '2024-05-18 20:45:07', '2024-05-19 18:40:28'),
(19, 46, 'https://852207.tugasakhir.my.id/assets/img/galeri/68464304.jpg', '2024-05-18 20:45:08', '2024-05-19 18:40:28'),
(20, 46, 'https://852207.tugasakhir.my.id/assets/img/galeri/3139702993.jpg', '2024-05-18 20:45:09', '2024-05-19 18:40:28'),
(21, 48, 'https://852207.tugasakhir.my.id/assets/img/galeri/3852165344.jpg', '2024-05-18 20:48:06', '2024-05-19 18:40:28'),
(22, 48, 'https://852207.tugasakhir.my.id/assets/img/galeri/784839493.jpg', '2024-05-18 20:48:07', '2024-05-19 18:40:28'),
(23, 48, 'https://852207.tugasakhir.my.id/assets/img/galeri/4213312653.jpg', '2024-05-18 20:48:08', '2024-05-19 18:40:28'),
(24, 48, 'https://852207.tugasakhir.my.id/assets/img/galeri/1224921245.jpg', '2024-05-18 20:48:09', '2024-05-19 18:40:28'),
(25, 48, 'https://852207.tugasakhir.my.id/assets/img/galeri/1741420337.jpg', '2024-05-18 20:48:10', '2024-05-19 18:40:28'),
(26, 48, 'https://852207.tugasakhir.my.id/assets/img/galeri/3678868869.jpg', '2024-05-18 20:48:11', '2024-05-19 18:40:28'),
(27, 50, 'https://852207.tugasakhir.my.id/assets/img/galeri/1163148438.jpg', '2024-05-18 20:51:16', '2024-05-19 18:40:28'),
(28, 50, 'https://852207.tugasakhir.my.id/assets/img/galeri/4200891127.jpg', '2024-05-18 20:51:17', '2024-05-19 18:40:28'),
(29, 50, 'https://852207.tugasakhir.my.id/assets/img/galeri/3284160056.jpg', '2024-05-18 20:51:18', '2024-05-19 18:40:28'),
(30, 50, 'https://852207.tugasakhir.my.id/assets/img/galeri/4246485853.jpg', '2024-05-18 20:51:19', '2024-05-19 18:40:28'),
(31, 50, 'https://852207.tugasakhir.my.id/assets/img/galeri/1918684925.jpg', '2024-05-18 20:51:20', '2024-05-19 18:40:28'),
(32, 39, 'https://852207.tugasakhir.my.id/assets/img/galeri/2807319656.jpg', '2024-05-18 20:53:32', '2024-05-19 18:40:28'),
(33, 39, 'https://852207.tugasakhir.my.id/assets/img/galeri/1090126909.jpg', '2024-05-18 20:53:33', '2024-05-19 18:40:28'),
(34, 39, 'https://852207.tugasakhir.my.id/assets/img/galeri/1435102636.jpg', '2024-05-18 20:53:34', '2024-05-19 18:40:28'),
(35, 39, 'https://852207.tugasakhir.my.id/assets/img/galeri/1800771785.jpg', '2024-05-18 20:53:34', '2024-05-19 18:40:28'),
(36, 39, 'https://852207.tugasakhir.my.id/assets/img/galeri/754311705.jpg', '2024-05-18 20:53:34', '2024-05-19 18:40:28'),
(37, 38, 'https://852207.tugasakhir.my.id/assets/img/galeri/3215316811.jpg', '2024-05-18 20:55:37', '2024-05-19 18:40:28'),
(38, 38, 'https://852207.tugasakhir.my.id/assets/img/galeri/4139475541.jpg', '2024-05-18 20:55:38', '2024-05-19 18:40:28'),
(39, 38, 'https://852207.tugasakhir.my.id/assets/img/galeri/1882132731.jpg', '2024-05-18 20:55:38', '2024-05-19 18:40:28'),
(40, 38, 'https://852207.tugasakhir.my.id/assets/img/galeri/1324574110.jpg', '2024-05-18 20:55:39', '2024-05-19 18:40:28'),
(41, 38, 'https://852207.tugasakhir.my.id/assets/img/galeri/875771646.jpg', '2024-05-18 20:55:40', '2024-05-19 18:40:28'),
(42, 38, 'https://852207.tugasakhir.my.id/assets/img/galeri/3144926046.jpg', '2024-05-18 20:55:41', '2024-05-19 18:40:28'),
(43, 38, 'https://852207.tugasakhir.my.id/assets/img/galeri/3249770558.jpg', '2024-05-18 20:55:42', '2024-05-19 18:40:28'),
(44, 45, 'https://852207.tugasakhir.my.id/assets/img/galeri/2375193569.jpg', '2024-05-18 20:57:32', '2024-05-19 18:40:28'),
(45, 45, 'https://852207.tugasakhir.my.id/assets/img/galeri/2773274401.jpg', '2024-05-18 20:57:33', '2024-05-19 18:40:28'),
(46, 45, 'https://852207.tugasakhir.my.id/assets/img/galeri/705444481.jpg', '2024-05-18 20:57:33', '2024-05-19 18:40:28'),
(47, 45, 'https://852207.tugasakhir.my.id/assets/img/galeri/2741287783.jpg', '2024-05-18 20:57:34', '2024-05-19 18:40:28'),
(48, 45, 'https://852207.tugasakhir.my.id/assets/img/galeri/1583372101.jpg', '2024-05-18 20:57:34', '2024-05-19 18:40:28'),
(49, 47, 'https://852207.tugasakhir.my.id/assets/img/galeri/41035348.jpg', '2024-05-18 20:59:05', '2024-05-19 18:40:28'),
(50, 47, 'https://852207.tugasakhir.my.id/assets/img/galeri/2024961332.jpg', '2024-05-18 20:59:06', '2024-05-19 18:40:28'),
(51, 47, 'https://852207.tugasakhir.my.id/assets/img/galeri/3347237717.jpg', '2024-05-18 20:59:07', '2024-05-19 18:40:28'),
(52, 47, 'https://852207.tugasakhir.my.id/assets/img/galeri/195469658.jpg', '2024-05-18 20:59:08', '2024-05-19 18:40:28'),
(53, 47, 'https://852207.tugasakhir.my.id/assets/img/galeri/2368918516.jpg', '2024-05-18 20:59:09', '2024-05-19 18:40:28'),
(54, 44, 'https://852207.tugasakhir.my.id/assets/img/galeri/3068044287.jpg', '2024-05-18 21:00:17', '2024-05-19 18:40:28'),
(55, 44, 'https://852207.tugasakhir.my.id/assets/img/galeri/1619476706.jpg', '2024-05-18 21:00:18', '2024-05-19 18:40:28'),
(56, 44, 'https://852207.tugasakhir.my.id/assets/img/galeri/1130235199.jpg', '2024-05-18 21:00:19', '2024-05-19 18:40:28'),
(57, 44, 'https://852207.tugasakhir.my.id/assets/img/galeri/4072834554.jpg', '2024-05-18 21:00:20', '2024-05-19 18:40:28'),
(58, 44, 'https://852207.tugasakhir.my.id/assets/img/galeri/480179212.jpg', '2024-05-18 21:00:20', '2024-05-19 18:40:28'),
(59, 42, 'https://852207.tugasakhir.my.id/assets/img/galeri/1778731622.jpg', '2024-05-18 21:02:55', '2024-05-19 18:40:28'),
(60, 42, 'https://852207.tugasakhir.my.id/assets/img/galeri/230697406.jpg', '2024-05-18 21:02:56', '2024-05-19 18:40:28'),
(61, 42, 'https://852207.tugasakhir.my.id/assets/img/galeri/80145756.jpg', '2024-05-18 21:02:57', '2024-05-19 18:40:28'),
(62, 42, 'https://852207.tugasakhir.my.id/assets/img/galeri/3254834084.jpg', '2024-05-18 21:02:57', '2024-05-19 18:40:28'),
(63, 42, 'https://852207.tugasakhir.my.id/assets/img/galeri/281352454.jpg', '2024-05-18 21:02:58', '2024-05-19 18:40:28');

-- --------------------------------------------------------

--
-- Struktur dari tabel `jenis_wisata`
--

CREATE TABLE `jenis_wisata` (
  `id_jenis_wisata` int NOT NULL,
  `jenis_wisata` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `jenis_wisata`
--

INSERT INTO `jenis_wisata` (`id_jenis_wisata`, `jenis_wisata`) VALUES
(1, 'Wisata Alam'),
(3, 'Wisata Religi'),
(4, 'Wisata Sejarah');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kontak`
--

CREATE TABLE `kontak` (
  `id_kontak` int NOT NULL,
  `username` varchar(75) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `email` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `phone` char(12) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `pesan` text COLLATE utf8mb4_general_ci,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `kontak`
--

INSERT INTO `kontak` (`id_kontak`, `username`, `email`, `phone`, `pesan`, `created_at`, `updated_at`) VALUES
(2, 'Redy', 'redylelan01@gmail.com', '087777439822', '', '2024-05-27 15:18:23', '2024-05-27 15:18:23');

-- --------------------------------------------------------

--
-- Struktur dari tabel `maps`
--

CREATE TABLE `maps` (
  `id_map` int NOT NULL,
  `id_tipe_lokasi` int NOT NULL DEFAULT '1',
  `id_lokasi` int DEFAULT NULL,
  `longitude` char(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `latitude` char(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `maps`
--

INSERT INTO `maps` (`id_map`, `id_tipe_lokasi`, `id_lokasi`, `longitude`, `latitude`, `created_at`, `updated_at`) VALUES
(17, 1, 39, '124.22810246786224', '-9.712599964611464', '2024-05-21 15:13:13', '2024-05-21 15:13:13'),
(18, 1, 42, '124.24008515066724', '-9.682982318759', '2024-05-21 15:16:24', '2024-05-21 15:16:24'),
(19, 1, 50, '124.28183446601348', '-9.835454523075754', '2024-05-21 15:44:52', '2024-05-21 15:44:52'),
(20, 1, 48, '124.21457559669649', '-9.63140433836451', '2024-05-21 15:53:15', '2024-05-21 15:53:15'),
(21, 1, 47, '124.27931251297835', '-9.77269506449171', '2024-05-21 15:56:05', '2024-05-21 15:56:05'),
(22, 1, 46, '124.23523964601188', '-9.694261533468609', '2024-05-21 15:57:59', '2024-05-21 15:57:59'),
(23, 1, 45, '124.2356471962622', '-9.695085725580538', '2024-05-21 15:58:37', '2024-05-21 15:58:37'),
(24, 1, 44, '124.23487674332397', '-9.680535325617058', '2024-05-21 15:59:23', '2024-05-21 15:59:23'),
(25, 1, 43, '124.23608837211971', '-9.677094109537888', '2024-05-21 16:00:07', '2024-05-21 16:00:07'),
(26, 1, 41, '124.21205409290376', '-9.718088137078741', '2024-05-21 16:01:25', '2024-05-21 16:01:25'),
(27, 1, 40, '124.26778570833966', '-9.721785367990561', '2024-05-21 16:02:00', '2024-05-21 16:02:00'),
(28, 1, 38, '124.22163718135438', '-9.70716586292323', '2024-05-21 16:04:08', '2024-05-21 16:04:08'),
(49, 1, 4096, '124.27268476786247', '-9.7334252720305', '2024-05-26 15:59:28', '2024-05-26 15:59:28'),
(50, 1, 4097, '124.27315207765302', '-9.73425640050158', '2024-05-26 16:00:29', '2024-05-26 16:00:29'),
(51, 1, 4095, '124.27559806601816', '-9.727368547878525', '2024-05-26 16:01:37', '2024-05-26 16:01:37'),
(52, 1, 4094, '124.27216441019087', '-9.731124020159129', '2024-05-26 16:02:35', '2024-05-26 16:02:35'),
(53, 1, 4092, '124.27205712183226', '-9.730330934178781', '2024-05-26 16:03:28', '2024-05-26 16:03:28'),
(54, 1, 4093, '124.28028036601158', '-9.73234432280602', '2024-05-26 16:04:19', '2024-05-26 16:04:19'),
(55, 1, 4091, '124.28357916019068', '-9.728474518503747', '2024-05-26 16:05:13', '2024-05-26 16:05:13'),
(56, 1, 4090, '124.27766757157364', '-9.728379347525859', '2024-05-26 16:05:48', '2024-05-26 16:05:48'),
(57, 1, 4089, '124.2739446654106', '-9.734142429895943', '2024-05-26 16:06:51', '2024-05-26 16:06:51'),
(58, 1, 4088, '124.27294305505369', '-9.74215024663748', '2024-05-26 16:19:06', '2024-05-26 16:19:06');

-- --------------------------------------------------------

--
-- Struktur dari tabel `polygon_maps`
--

CREATE TABLE `polygon_maps` (
  `id_pmap` int NOT NULL,
  `id_wisata` int DEFAULT NULL,
  `longitude` char(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `latitude` char(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `polygon_maps`
--

INSERT INTO `polygon_maps` (`id_pmap`, `id_wisata`, `longitude`, `latitude`, `created_at`, `updated_at`) VALUES
(38, 4098, '124.09194946289064', '-9.708718663165994', '2024-06-03 11:55:55', '2024-06-03 11:55:55'),
(39, 4098, '124.13487017154695', '-9.667092188303721', '2024-06-03 11:56:02', '2024-06-03 11:56:02'),
(40, 4098, '124.1654258966446', '-9.698566340639186', '2024-06-03 11:56:10', '2024-06-03 11:56:10');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tempat_wisata`
--

CREATE TABLE `tempat_wisata` (
  `id_wisata` int NOT NULL,
  `id_jenis_wisata` int NOT NULL DEFAULT '1',
  `id_desa` int NOT NULL DEFAULT '1',
  `image_wisata` varchar(75) COLLATE utf8mb4_general_ci NOT NULL,
  `nama_wisata` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `deskripsi` text COLLATE utf8mb4_general_ci,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tempat_wisata`
--

INSERT INTO `tempat_wisata` (`id_wisata`, `id_jenis_wisata`, `id_desa`, `image_wisata`, `nama_wisata`, `deskripsi`, `created_at`, `updated_at`) VALUES
(38, 1, 1, '3249770558.jpg', 'Danau Fatukoto', 'ika Anda mengidamkan memperoleh panorama berlainan termasuk bisa. Sebab, tidak jauh berasal dari perbukitan ini terkandung danau cantik yang tersembunyi di Desa Fatukoto, yaitu Danau Nausus atau sering juga disebut Danau Fatukoto. Danau ini begitu tenang dan indah. Selain itu, air danaunya berwarna hijau kecoklatan dan jadi tempat tinggal bagi ikan air tawar menjadi daya tarik tersendiri bagi wisatawan.Sementara itu, di sepanjang pinggiran danau juga terdapat pepohonan pinus. Anda sanggup sejenak enjoy di tepi danau.Dari Kota Kupang, Anda hanya perlu saat lebih kurang 3 jam 16 menitan memakai kendaraan roda dua menuju wisata ini', '2024-05-18 05:42:12', '2024-05-26 15:43:40'),
(39, 1, 1, '2807319656.jpg', 'Fatunausus', 'Berjarak tempuh 138 km dari Kupang dan 28 km dari kota Soe, terdapat sebuah spot alam yang kokoh berdiri yang disebut Fatunausus.Objek wisata yang bisa kalian eksplor setelah melalui perjalanan 3 jam dari Kupang ini merupakan tempat persembayangan bagi masyarakat suku Mollo yang mendiami sekitar batu tersebut. Di lokasi yang berketinggian 1.500 m di atas permukaan laut ini, menyuguhkan pemandangan alam yang sangat indah. Guratan pegunungan, lembah dan batu marmer berbentuk runcing ke arah langit menjadi daya tarik pengunjung yang datang.', '2024-05-18 05:42:12', '2024-05-26 15:38:11'),
(40, 1, 1, '1674693992.jpg', 'Sonaf Raja Mollo', 'Pusat Kerajaan Mollo yang berada di Sonaf Aijaobaki. Di tempat ini Anda dapat menyaksikan bekas peninggalan Kerajaan Mollo yang dipimpin oleh Raja Oematan.Sonaf merupakan istana tempat tinggal Raja atau Usif yang juga merupakan pusat dari sebuah kerajaan yang ada di Pulau Timor. Pulau Timor memiliki benyak Sonaf yang terbagi di beberapa bagian wilayah di Pulau Timor. Salah satu Sonaf di Pulau Timor yang masih berdiri sampai sekarang adalah Sonaf Ajaobaki. Jarak menuju Sonaf Ajaobaki dari Kota Kupang kurang lebih 128 kilometer Kemudahan untuk mencapai lokasi Sonaf Ajaobaki tergolong mudah untuk dicapai karena jalan menuju lokasi Sonaf Ajaobaki melewati jalanan aspal yang baik, dan lokasi Sonaf Ajapobaki yang berada di pinggir jalan raya.', '2024-05-18 05:42:12', '2024-05-26 15:33:51'),
(41, 1, 1, '2046531573.jpg', 'Panorama Alam Lelobatan', 'Panorama alam lelobatan terletak di kecamatan Mollo Utara jarak antara kota kupang dengan wisata ini ya itu 143 KM. Keunikan dari wisata ini adalah pemandangan alam yang sangat indah, padang rumput yang hijau , hewan milik warga seperti kuda dan sapi yang berkeliaran di pinggir jalan utama', '2024-05-18 05:42:12', '2024-05-26 15:28:55'),
(42, 1, 1, '230697406.jpg', 'Batu Marmer', 'Wisata alam yang dimiliki Nusa Tenggara Timur bisa dibilang tak pernah ada habisnya. Pesona yang dipancarkan tanah Timor selalu membuat semua mata terbelalak karena takjub. Seperti pesona Desa Tunua, dibekas tambang batu marmernya.Desa Tunua dikenal sebagai bekas lokasi tambang marmer, tepatnya di bukit Naetapan, yang beroperasi sejak tahun 2000, dengan luas 10,5 hektar. Tambang marmer ini mendapat penolakan dari masyarakat adat setempat disebabkan timbulnya kerusakan alam. Destinasi bekas tambang marmer di Desa Tunua ramai dikunjungi para traveler. Bongkahan batu marmer aneka bentuk dan tebing-tebing rata bekas kerja mesin tambang, menjadi penanda kekayaan alam orang Mollo yang sudah dieksploitasi.Wisata ini berada sekitar 137 kilometer dari Kota Kupang, ibu kota Provinsi Nusa Tenggara Timur.', '2024-05-18 05:42:12', '2024-05-26 15:20:33'),
(43, 1, 1, '4080694669.jpg', 'Panorama Alam Tunua', 'Panorama alam tunua terletak di desa tunua kecamatan Mollo Utara jarak antara kota kupang dengan wisata ini ya itu 139 KM. Keunikan dari wisata ini adalh pemandangan salib yang berada di atas batu besar, padang rumput yang hijau dan sangat luas dipinggiran jalan utama', '2024-05-18 05:42:13', '2024-05-25 18:20:43'),
(44, 1, 1, '4072834554.jpg', 'Bukit Bakium', 'Bukit Bikium termasuk salah satu tempat di Timor Tengah Selatan yang jarang dijamah wisatawan. Keindahannya masih benar-benar alami. Layak disambangi jika Teman Traveler sedang berada di Nusa Tenggara Timur.memakan waktu 3 jam 24 menit jika berangkat dari Kota Kupang, ibu kota Nusa Tenggara Timur. Akses jalannya sudah juga sangat bagus, diaspal halus hingga sampai tujuan utama.Begitu sampai di lokasi, Teman Traveler bakal dibuat terpesona dengan keindahan alam luar biasa indah. Kalian bisa melihat hamparan rumput hijau sambil sesekali mengamati hewan-hewan ternak milik masyarakat sekitar. Kehadiran sapi maupun kuda tersebut ikut mempercantik pemandangan sekitar bukit.', '2024-05-18 05:42:13', '2024-05-25 18:15:20'),
(45, 1, 1, '2741287783.jpg', 'Bukit Tomenas', 'Bukit Tomenas terletak di Desa Fatukoto, Mollo Utara, Timor Tengah Selatan. Lokasi ini berada sekitar 40 kilometer dari Kota Kupang, ibu kota provinsi,dan bisa ditempuh menggunakan kendaraan bermotor sekitar 3 jam 17 menit perjalanan.Ketika berada di Bukit Tomenas, mata traveler akan dimanja oleh suguhan hijau pepohonan, sejauh mata memandang. Terlihat pula kelokan jalan yang melingkari punggung bukit dan mempercantik pemandangan di sekitar bukit.', '2024-05-18 05:42:13', '2024-05-25 18:08:31'),
(46, 1, 1, '68464304.jpg', 'Panorama Alam Fatumnasi', 'Pemandangan di Fatumnasi didominasi oleh hamparan keindahan alam, bahkan sering disebut sebagai taman wisata. Sebagian besar wilayahnya masih berupa alam yang terjaga kelestariannya.panorama alam fatumnasi berjarak dari kota kupang sekitar 136 KM. Panorama alam yang dimaksudkan sepeti tumbuhnya ribuan pohon ampupu berusia ratusan tahun yang sangat indah ,adapun rumah berbentuk segitiga yang sangat unik.', '2024-05-18 05:42:13', '2024-05-25 18:05:58'),
(47, 1, 1, '2024961332.jpg', 'Bukit Cinta KM.12', 'Bukit Cinta KM.12 Merupakan wisata alam pertama menuju wisata alam berikutnya di wilayah mollo utara wisata ini berjarak dari kota kupang sekitar125 KM. Bukit ini terletak dipinggir jalan utama menuju cagar alam mutis. Bukit ini memiliki pemandangan alam yang indah dan sangat asri.', '2024-05-18 05:42:13', '2024-05-25 17:56:17'),
(48, 1, 1, '3852165344.jpg', 'Hutan Bonsai', 'Hutan Bonsai adalah jalur trekking menuju Puncak Gunung Mutis jarak antara hutan ini dengan kota kupang yaitu 143 KM. Hutan yang satu ini bukanlah hutan biasa, karena menampilkan pesona alam yang unik dan menarik.Hutan Bonsai Fatumnasi merupakan hutan bonsai yang sudah berumur ratusan tahun. Saya pribadi sangat kagum akan kelestariannya.Anda tahu sendiri, bahwa pohon bonsai memiliki nilai ekonomi yang sangat tinggi, apalagi jika sudah berumur ratusan tahun.', '2024-05-18 05:42:13', '2024-05-25 17:51:02'),
(50, 1, 1, '4246485853.jpg', 'Gua Maria Nonohonis', 'Gua Maria Nonohonis merupakan Gua Maria yang terletak di kabupaten Timor Tengah Selatan jarak antara gua ini dengan kota kupang sekitar 113 KM, Gua ini biasayanya dikunjungi oleh umat sebagai tempat berdoa bersama dan juga untuk semakin mengeratkan rasa persaudaraan di antara umat Katolik.', '2024-05-18 05:42:14', '2024-05-26 15:46:56'),
(4088, 1, 1, '295892626.jpg', 'SPBU', '', '2024-05-26 15:45:57', '2024-05-26 15:53:02'),
(4089, 1, 1, '1646537253.jpeg', 'Puskesmas Kapan', '', '2024-05-26 15:45:57', '2024-05-26 15:52:30'),
(4090, 1, 1, '2776017599.jpeg', 'Masjid Al-taqwa', '', '2024-05-26 15:45:57', '2024-05-26 15:51:55'),
(4091, 1, 1, '2267070829.jpeg', 'Gereja Sta. Maria Immaculata', '', '2024-05-26 15:45:57', '2024-05-26 15:51:15'),
(4092, 1, 1, '2132875933.jpeg', 'ATM BRI', '', '2024-05-26 15:45:57', '2024-05-26 15:50:35'),
(4093, 3, 1, '2843277696.jpeg', 'Mutis hill', '', '2024-05-26 15:45:57', '2024-06-03 11:04:46'),
(4094, 1, 1, '1269853930.jpeg', 'Pasar Kapan', '', '2024-05-26 15:45:57', '2024-05-26 15:49:34'),
(4095, 1, 1, '1854857079.jpeg', 'Apotik Pricilia', '', '2024-05-26 15:45:57', '2024-05-26 15:48:54'),
(4096, 4, 1, '302695052.jpeg', 'Polsek Mollo Utara', '', '2024-05-26 15:54:38', '2024-06-03 11:03:12'),
(4097, 4, 1, '1932478882.jpeg', 'Kantor Camat Mollo Utara', '', '2024-05-26 15:55:33', '2024-06-03 11:04:21'),
(4098, 3, 2, '556180812.jpg', 'tes', '', '2024-06-03 10:13:46', '2024-06-03 11:01:11');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tentang`
--

CREATE TABLE `tentang` (
  `id_tentang` int NOT NULL,
  `deskripsi` text COLLATE utf8mb4_general_ci,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tentang`
--

INSERT INTO `tentang` (`id_tentang`, `deskripsi`, `created_at`, `updated_at`) VALUES
(1, '<p>Kecamatan Mollo Utara berada di Kabupaten Timor Tengah Selatan, Provinsi NTT, Indonesia. Kecamatan Mollo Utara adalah 1 dari 32 kecamatan yang ada di wilayah Kabupaten Timor Tengah Selatan ( TTS ), Provinsi Nusa Tenggara Timur atau Provinsi NTT, Indonesia.</p>\r\n\r\n<p>Kecamatan Mollo Utara memiliki beragam daya tarik wisata seperti bukit-bukit, pegunungan yang indah, wisata budaya, wisata religi, serta potensi pariwisata alam. Namun, upaya pemetaan dan pemahaman yang mendalam tentang potensi ini masih terbatas. Berdasarkan data yang diperoleh dari penelitian ini terdapat 12 Obyek yang berpotensi menjadi tempat wisata di dan sekitaran Kecamatan Mollo Utara diantaranya yaitu Hutan Bonsai, Panorama Alam Fatumnasi, Bukit Bakium, Fatunausus, Bukit Tomenas, Danau Fatukoto, Panorama Alam Tunua, Batu Marmer, Sonaf Raja Mollo, Bukit Cinta KM.12, Panorama Alam Lelobatan, Gua Maria Nonohonis.</p>\r\n', '2024-05-18 13:54:21', '2024-05-26 16:32:00');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id_user` int NOT NULL,
  `id_role` int DEFAULT NULL,
  `id_active` int DEFAULT '2',
  `en_user` varchar(75) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `token` char(6) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `image` varchar(100) COLLATE utf8mb4_general_ci DEFAULT 'default.svg',
  `email` varchar(75) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `password` varchar(75) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id_user`, `id_role`, `id_active`, `en_user`, `token`, `name`, `image`, `email`, `password`, `created_at`, `updated_at`) VALUES
(1, 2, 1, NULL, NULL, 'admin', 'default.svg', 'admin@gmail.com', '$2y$10$//KMATh3ibPoI3nHFp7x/u7vnAbo2WyUgmI4x0CVVrH8ajFhMvbjG', '2024-04-25 02:00:59', '2024-04-25 02:00:59'),
(2, 1, 2, NULL, NULL, 'developer', 'default.svg', 'developer@gmail.com', '$2y$10$//KMATh3ibPoI3nHFp7x/u7vnAbo2WyUgmI4x0CVVrH8ajFhMvbjG', '2024-05-10 19:53:54', '2024-05-10 19:53:54'),
(3, 3, 1, '2y10oU32UsHP4uSOaLthmk2u11C2JvlTzzmUoyIDOBfMwaE9YteXFDa', '752422', 'iew', 'default.svg', 'irenpasu@gmail.com', '$2y$10$5RSChC9XBjzNfPivMWG5OOHiarHxNCKC9k6MV5/uWgkNhexTZON9G', '2024-05-20 07:27:48', '2024-05-20 07:28:35');

--
-- Trigger `users`
--
DELIMITER $$
CREATE TRIGGER `insert_users` BEFORE INSERT ON `users` FOR EACH ROW BEGIN
    SET NEW.id_role = (
        SELECT id_role
        FROM `user_role`
        ORDER BY id_role DESC
        LIMIT 1
    );
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `user_access_menu`
--

CREATE TABLE `user_access_menu` (
  `id_access_menu` int NOT NULL,
  `id_role` int DEFAULT NULL,
  `id_menu` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `user_access_menu`
--

INSERT INTO `user_access_menu` (`id_access_menu`, `id_role`, `id_menu`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 4),
(4, 1, 3),
(5, 1, 5),
(7, 2, 3),
(8, 2, 4),
(9, 2, 5);

-- --------------------------------------------------------

--
-- Struktur dari tabel `user_access_sub_menu`
--

CREATE TABLE `user_access_sub_menu` (
  `id_access_sub_menu` int NOT NULL,
  `id_role` int DEFAULT NULL,
  `id_sub_menu` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `user_access_sub_menu`
--

INSERT INTO `user_access_sub_menu` (`id_access_sub_menu`, `id_role`, `id_sub_menu`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 1, 4),
(5, 1, 5),
(6, 1, 6),
(7, 1, 7),
(8, 1, 8),
(9, 1, 9),
(10, 1, 10),
(11, 1, 11),
(12, 1, 12),
(13, 1, 13),
(14, 1, 14),
(15, 2, 7),
(16, 2, 8),
(17, 2, 9),
(18, 2, 10),
(19, 2, 11),
(20, 2, 12),
(21, 2, 13),
(22, 2, 14),
(23, 1, 15),
(24, 1, 16);

-- --------------------------------------------------------

--
-- Struktur dari tabel `user_menu`
--

CREATE TABLE `user_menu` (
  `id_menu` int NOT NULL,
  `menu` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `user_menu`
--

INSERT INTO `user_menu` (`id_menu`, `menu`) VALUES
(1, 'User Management'),
(2, 'Menu Management'),
(3, 'Data Wisata'),
(4, 'Data GIS'),
(5, 'Lainnya');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user_role`
--

CREATE TABLE `user_role` (
  `id_role` int NOT NULL,
  `role` varchar(35) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `user_role`
--

INSERT INTO `user_role` (`id_role`, `role`) VALUES
(1, 'Developer'),
(2, 'Administrator'),
(3, 'Member');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user_status`
--

CREATE TABLE `user_status` (
  `id_status` int NOT NULL,
  `status` varchar(35) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `user_status`
--

INSERT INTO `user_status` (`id_status`, `status`) VALUES
(1, 'Active'),
(2, 'No Active');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user_sub_menu`
--

CREATE TABLE `user_sub_menu` (
  `id_sub_menu` int NOT NULL,
  `id_menu` int DEFAULT NULL,
  `id_active` int DEFAULT '2',
  `title` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `url` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `icon` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `user_sub_menu`
--

INSERT INTO `user_sub_menu` (`id_sub_menu`, `id_menu`, `id_active`, `title`, `url`, `icon`) VALUES
(1, 1, 1, 'Users', 'users', 'fas fa-users'),
(2, 1, 1, 'Role', 'role', 'fas fa-user-cog'),
(3, 2, 1, 'Menu', 'menu', 'fas fa-fw fa-folder'),
(4, 2, 1, 'Sub Menu', 'sub-menu', 'fas fa-fw fa-folder-open'),
(5, 2, 1, 'Menu Access', 'menu-access', 'fas fa-user-lock'),
(6, 2, 1, 'Sub Menu Access', 'sub-menu-access', 'fas fa-user-lock'),
(7, 3, 1, 'Tempat Wisata', 'tempat-wisata', 'fas fa-torii-gate'),
(8, 3, 1, 'Fasilitas', 'fasilitas', 'fas fa-list-ul'),
(9, 3, 1, 'Galeri', 'galeri', 'fas fa-images'),
(10, 4, 1, 'Pemetaan', 'pemetaan', 'fas fa-map-signs'),
(11, 4, 1, 'Maps', 'maps', 'fas fa-map'),
(12, 4, 1, 'Polygon Mapping', 'polygon-mapping', 'fas fa-layer-group'),
(13, 5, 1, 'Tentang', 'tentang', 'fas fa-list-ul'),
(14, 5, 1, 'Kontak', 'kontak', 'fas fa-headset'),
(15, 3, 1, 'Jenis Wisata', 'jenis-wisata', 'fas fa-list'),
(16, 3, 1, 'Desa', 'desa', 'fas fa-list');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `auth`
--
ALTER TABLE `auth`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `desa`
--
ALTER TABLE `desa`
  ADD PRIMARY KEY (`id_desa`);

--
-- Indeks untuk tabel `fasilitas`
--
ALTER TABLE `fasilitas`
  ADD PRIMARY KEY (`id_fasilitas`);

--
-- Indeks untuk tabel `fasilitas_wisata`
--
ALTER TABLE `fasilitas_wisata`
  ADD PRIMARY KEY (`id_fasilitas_wisata`),
  ADD KEY `id_fasilitas` (`id_fasilitas`),
  ADD KEY `id_wisata` (`id_wisata`);

--
-- Indeks untuk tabel `galeri`
--
ALTER TABLE `galeri`
  ADD PRIMARY KEY (`id_galeri`),
  ADD KEY `id_wisata` (`id_wisata`);

--
-- Indeks untuk tabel `jenis_wisata`
--
ALTER TABLE `jenis_wisata`
  ADD PRIMARY KEY (`id_jenis_wisata`);

--
-- Indeks untuk tabel `kontak`
--
ALTER TABLE `kontak`
  ADD PRIMARY KEY (`id_kontak`);

--
-- Indeks untuk tabel `maps`
--
ALTER TABLE `maps`
  ADD PRIMARY KEY (`id_map`);

--
-- Indeks untuk tabel `polygon_maps`
--
ALTER TABLE `polygon_maps`
  ADD PRIMARY KEY (`id_pmap`),
  ADD KEY `id_wisata` (`id_wisata`);

--
-- Indeks untuk tabel `tempat_wisata`
--
ALTER TABLE `tempat_wisata`
  ADD PRIMARY KEY (`id_wisata`),
  ADD KEY `id_desa` (`id_desa`),
  ADD KEY `tempat_wisata_ibfk_1` (`id_jenis_wisata`);

--
-- Indeks untuk tabel `tentang`
--
ALTER TABLE `tentang`
  ADD PRIMARY KEY (`id_tentang`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user`),
  ADD KEY `id_role` (`id_role`),
  ADD KEY `id_active` (`id_active`);

--
-- Indeks untuk tabel `user_access_menu`
--
ALTER TABLE `user_access_menu`
  ADD PRIMARY KEY (`id_access_menu`),
  ADD KEY `id_role` (`id_role`),
  ADD KEY `id_menu` (`id_menu`);

--
-- Indeks untuk tabel `user_access_sub_menu`
--
ALTER TABLE `user_access_sub_menu`
  ADD PRIMARY KEY (`id_access_sub_menu`),
  ADD KEY `id_role` (`id_role`),
  ADD KEY `id_sub_menu` (`id_sub_menu`);

--
-- Indeks untuk tabel `user_menu`
--
ALTER TABLE `user_menu`
  ADD PRIMARY KEY (`id_menu`);

--
-- Indeks untuk tabel `user_role`
--
ALTER TABLE `user_role`
  ADD PRIMARY KEY (`id_role`);

--
-- Indeks untuk tabel `user_status`
--
ALTER TABLE `user_status`
  ADD PRIMARY KEY (`id_status`);

--
-- Indeks untuk tabel `user_sub_menu`
--
ALTER TABLE `user_sub_menu`
  ADD PRIMARY KEY (`id_sub_menu`),
  ADD KEY `id_menu` (`id_menu`),
  ADD KEY `id_active` (`id_active`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `auth`
--
ALTER TABLE `auth`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `desa`
--
ALTER TABLE `desa`
  MODIFY `id_desa` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `fasilitas`
--
ALTER TABLE `fasilitas`
  MODIFY `id_fasilitas` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT untuk tabel `fasilitas_wisata`
--
ALTER TABLE `fasilitas_wisata`
  MODIFY `id_fasilitas_wisata` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT untuk tabel `galeri`
--
ALTER TABLE `galeri`
  MODIFY `id_galeri` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT untuk tabel `jenis_wisata`
--
ALTER TABLE `jenis_wisata`
  MODIFY `id_jenis_wisata` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `kontak`
--
ALTER TABLE `kontak`
  MODIFY `id_kontak` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `maps`
--
ALTER TABLE `maps`
  MODIFY `id_map` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT untuk tabel `polygon_maps`
--
ALTER TABLE `polygon_maps`
  MODIFY `id_pmap` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT untuk tabel `tempat_wisata`
--
ALTER TABLE `tempat_wisata`
  MODIFY `id_wisata` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4099;

--
-- AUTO_INCREMENT untuk tabel `tentang`
--
ALTER TABLE `tentang`
  MODIFY `id_tentang` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id_user` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `user_access_menu`
--
ALTER TABLE `user_access_menu`
  MODIFY `id_access_menu` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `user_access_sub_menu`
--
ALTER TABLE `user_access_sub_menu`
  MODIFY `id_access_sub_menu` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT untuk tabel `user_menu`
--
ALTER TABLE `user_menu`
  MODIFY `id_menu` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `user_role`
--
ALTER TABLE `user_role`
  MODIFY `id_role` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `user_status`
--
ALTER TABLE `user_status`
  MODIFY `id_status` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `user_sub_menu`
--
ALTER TABLE `user_sub_menu`
  MODIFY `id_sub_menu` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `fasilitas_wisata`
--
ALTER TABLE `fasilitas_wisata`
  ADD CONSTRAINT `fasilitas_wisata_ibfk_1` FOREIGN KEY (`id_fasilitas`) REFERENCES `fasilitas` (`id_fasilitas`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fasilitas_wisata_ibfk_2` FOREIGN KEY (`id_wisata`) REFERENCES `tempat_wisata` (`id_wisata`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `galeri`
--
ALTER TABLE `galeri`
  ADD CONSTRAINT `galeri_ibfk_1` FOREIGN KEY (`id_wisata`) REFERENCES `tempat_wisata` (`id_wisata`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `polygon_maps`
--
ALTER TABLE `polygon_maps`
  ADD CONSTRAINT `polygon_maps_ibfk_1` FOREIGN KEY (`id_wisata`) REFERENCES `tempat_wisata` (`id_wisata`) ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tempat_wisata`
--
ALTER TABLE `tempat_wisata`
  ADD CONSTRAINT `tempat_wisata_ibfk_1` FOREIGN KEY (`id_jenis_wisata`) REFERENCES `jenis_wisata` (`id_jenis_wisata`) ON UPDATE CASCADE,
  ADD CONSTRAINT `tempat_wisata_ibfk_2` FOREIGN KEY (`id_desa`) REFERENCES `desa` (`id_desa`) ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`id_role`) REFERENCES `user_role` (`id_role`),
  ADD CONSTRAINT `users_ibfk_2` FOREIGN KEY (`id_active`) REFERENCES `user_status` (`id_status`);

--
-- Ketidakleluasaan untuk tabel `user_access_menu`
--
ALTER TABLE `user_access_menu`
  ADD CONSTRAINT `user_access_menu_ibfk_1` FOREIGN KEY (`id_role`) REFERENCES `user_role` (`id_role`),
  ADD CONSTRAINT `user_access_menu_ibfk_2` FOREIGN KEY (`id_menu`) REFERENCES `user_menu` (`id_menu`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `user_access_sub_menu`
--
ALTER TABLE `user_access_sub_menu`
  ADD CONSTRAINT `user_access_sub_menu_ibfk_1` FOREIGN KEY (`id_role`) REFERENCES `user_role` (`id_role`),
  ADD CONSTRAINT `user_access_sub_menu_ibfk_2` FOREIGN KEY (`id_sub_menu`) REFERENCES `user_sub_menu` (`id_sub_menu`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `user_sub_menu`
--
ALTER TABLE `user_sub_menu`
  ADD CONSTRAINT `user_sub_menu_ibfk_1` FOREIGN KEY (`id_menu`) REFERENCES `user_menu` (`id_menu`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_sub_menu_ibfk_2` FOREIGN KEY (`id_active`) REFERENCES `user_status` (`id_status`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

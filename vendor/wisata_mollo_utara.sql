-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Waktu pembuatan: 27 Jun 2024 pada 01.57
-- Versi server: 10.3.39-MariaDB-cll-lve
-- Versi PHP: 8.1.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `zjxtorpv_852207`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `auth`
--

CREATE TABLE `auth` (
  `id` int(11) NOT NULL,
  `image` varchar(50) DEFAULT NULL,
  `bg` varchar(35) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `auth`
--

INSERT INTO `auth` (`id`, `image`, `bg`) VALUES
(1, '2267070829.jpeg', '#040bec');

-- --------------------------------------------------------

--
-- Struktur dari tabel `desa`
--

CREATE TABLE `desa` (
  `id_desa` int(11) NOT NULL,
  `desa` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `desa`
--

INSERT INTO `desa` (`id_desa`, `desa`) VALUES
(1, 'Ajaobaki'),
(2, 'Bijaepunu'),
(3, 'Bosen'),
(4, 'Eon Besi'),
(5, 'Fatukoto'),
(6, 'Halmei'),
(7, 'Lusmolo'),
(8, 'Kokfeu'),
(9, 'Lelobatan'),
(10, 'Leloboko'),
(11, 'Nefokoko'),
(12, 'Netpala'),
(13, 'Obesi'),
(14, 'Sebot'),
(15, 'Taiftob'),
(16, 'Tofen'),
(17, 'Tomanat'),
(18, 'Tunua'),
(19, 'Nonohonis'),
(20, 'Fatumnasi'),
(21, 'Oelbubuk');

-- --------------------------------------------------------

--
-- Struktur dari tabel `fasilitas`
--

CREATE TABLE `fasilitas` (
  `id_fasilitas` int(11) NOT NULL,
  `image_fasilitas` varchar(100) NOT NULL,
  `nama_fasilitas` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `fasilitas`
--

INSERT INTO `fasilitas` (`id_fasilitas`, `image_fasilitas`, `nama_fasilitas`) VALUES
(4, '295892626.jpg', 'SPBU'),
(6, '302695052.jpeg', 'Polsek Mollo Utara'),
(7, '1269853930.jpeg', 'Pasar Kapan'),
(8, '2843277696.jpeg', 'Mutis Hill'),
(9, '2776017599.jpeg', 'Masjid Al-taqwa'),
(10, '1932478882.jpeg', 'Kantor Camat Mollo Utara'),
(11, '2267070829.jpeg', 'Gereja STA. Maria Immaculata'),
(12, '2132875933.jpeg', 'ATM BRI'),
(13, '1854857079.jpeg', 'Apotik Pricilla'),
(16, '1646537253.jpeg', 'Puskesmas Kapan'),
(17, '2150861489.jpg', 'WC Umum'),
(18, '1209620180.jpg', 'Kios'),
(19, '586656564.jpg', 'Warung Kopi'),
(20, '1823604784.jpg', 'Tempat Parkir');

-- --------------------------------------------------------

--
-- Struktur dari tabel `fasilitas_wisata`
--

CREATE TABLE `fasilitas_wisata` (
  `id_fasilitas_wisata` int(11) NOT NULL,
  `id_fasilitas` int(11) DEFAULT NULL,
  `id_wisata` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `fasilitas_wisata`
--

INSERT INTO `fasilitas_wisata` (`id_fasilitas_wisata`, `id_fasilitas`, `id_wisata`) VALUES
(74, 17, 4098),
(75, 18, 4098),
(76, 20, 4098),
(77, 20, 47),
(78, 17, 46),
(79, 18, 46),
(80, 19, 46),
(81, 20, 46),
(82, 17, 45),
(83, 18, 45),
(84, 19, 45),
(85, 20, 45),
(86, 18, 44),
(87, 20, 44),
(88, 20, 43),
(89, 20, 42),
(90, 18, 40),
(91, 20, 40),
(92, 20, 41),
(93, 17, 38),
(94, 19, 38),
(95, 20, 38),
(96, 17, 39),
(97, 20, 39),
(102, 17, 4099),
(103, 20, 4099);

-- --------------------------------------------------------

--
-- Struktur dari tabel `galeri`
--

CREATE TABLE `galeri` (
  `id_galeri` int(11) NOT NULL,
  `id_wisata` int(11) DEFAULT NULL,
  `image_galeri` varchar(100) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
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
  `id_jenis_wisata` int(11) NOT NULL,
  `jenis_wisata` varchar(50) DEFAULT NULL
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
  `id_kontak` int(11) NOT NULL,
  `username` varchar(75) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `phone` char(12) DEFAULT NULL,
  `pesan` text DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `kontak`
--

INSERT INTO `kontak` (`id_kontak`, `username`, `email`, `phone`, `pesan`, `created_at`, `updated_at`) VALUES
(3, 'cimo', 'willibardlelan548lelanfandi@gmail.com', '082147627768', 'tes', '2024-06-03 13:31:29', '2024-06-03 13:31:29'),
(4, 'sisil', 'lelanfandi@gmail.com', '123456789101', 'ghgvhgghvghvtghvgchggv8888', '2024-06-04 09:40:34', '2024-06-04 09:40:34'),
(5, 'cek cek', 'redy@gmail.com', '087777439822', 'halo apa kabar', '2024-06-05 15:57:11', '2024-06-05 15:57:11'),
(6, 'eldy', 'eldy@gmail.com', '081234617819', 'coba coba', '2024-06-08 00:11:38', '2024-06-08 00:11:38');

-- --------------------------------------------------------

--
-- Struktur dari tabel `maps`
--

CREATE TABLE `maps` (
  `id_map` int(11) NOT NULL,
  `id_tipe_lokasi` int(11) NOT NULL DEFAULT 1,
  `id_lokasi` int(11) DEFAULT NULL,
  `longitude` char(20) DEFAULT NULL,
  `latitude` char(20) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `maps`
--

INSERT INTO `maps` (`id_map`, `id_tipe_lokasi`, `id_lokasi`, `longitude`, `latitude`, `created_at`, `updated_at`) VALUES
(17, 1, 39, '124.22810246786224', '-9.712599964611464', '2024-05-21 15:13:13', '2024-05-21 15:13:13'),
(18, 1, 42, '124.24008515066724', '-9.682982318759', '2024-05-21 15:16:24', '2024-05-21 15:16:24'),
(21, 1, 47, '124.27931251297835', '-9.77269506449171', '2024-05-21 15:56:05', '2024-05-21 15:56:05'),
(22, 1, 46, '124.23523964601188', '-9.694261533468609', '2024-05-21 15:57:59', '2024-05-21 15:57:59'),
(23, 1, 45, '124.2356471962622', '-9.695085725580538', '2024-05-21 15:58:37', '2024-05-21 15:58:37'),
(24, 1, 44, '124.23487674332397', '-9.680535325617058', '2024-05-21 15:59:23', '2024-05-21 15:59:23'),
(25, 1, 43, '124.23608837211971', '-9.677094109537888', '2024-05-21 16:00:07', '2024-05-21 16:00:07'),
(26, 1, 41, '124.21205409290376', '-9.718088137078741', '2024-05-21 16:01:25', '2024-05-21 16:01:25'),
(27, 1, 40, '124.26778570833966', '-9.721785367990561', '2024-05-21 16:02:00', '2024-05-21 16:02:00'),
(28, 1, 38, '124.22163718135438', '-9.70716586292323', '2024-05-21 16:04:08', '2024-05-21 16:04:08'),
(59, 1, 4098, '124.28147028254524', '-9.835934903477195', '2024-06-03 13:57:20', '2024-06-03 13:57:20'),
(74, 1, 4099, '124.21451122368137', '-9.631457226397094', '2024-06-03 23:13:09', '2024-06-03 23:13:09');

-- --------------------------------------------------------

--
-- Struktur dari tabel `polygon_maps`
--

CREATE TABLE `polygon_maps` (
  `id_pmap` int(11) NOT NULL,
  `id_wisata` int(11) DEFAULT NULL,
  `longitude` char(20) DEFAULT NULL,
  `latitude` char(20) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `polygon_maps`
--

INSERT INTO `polygon_maps` (`id_pmap`, `id_wisata`, `longitude`, `latitude`, `created_at`, `updated_at`) VALUES
(119, 4098, '124.28077764809132', '-9.835300634925368', '2024-06-10 13:02:50', '2024-06-10 13:02:50'),
(120, 4098, '124.28056307137015', '-9.836992015025029', '2024-06-10 13:03:17', '2024-06-10 13:03:17'),
(121, 4098, '124.28197860717775', '-9.837795417539626', '2024-06-10 13:03:41', '2024-06-10 13:03:41'),
(123, 4098, '124.28206443786623', '-9.835681196202534', '2024-06-10 13:04:30', '2024-06-10 13:04:30'),
(132, 47, '124.28232461214067', '-9.775039582550043', '2024-06-11 12:05:42', '2024-06-11 12:05:42'),
(133, 47, '124.27785873413087', '-9.768103573474512', '2024-06-11 12:06:12', '2024-06-11 12:06:12'),
(134, 47, '124.27185058593751', '-9.770133639878413', '2024-06-11 12:06:47', '2024-06-11 12:06:47'),
(135, 47, '124.27064895629884', '-9.775039582550043', '2024-06-11 12:07:13', '2024-06-11 12:07:13'),
(136, 46, '124.23318386077882', '-9.696155118845988', '2024-06-11 12:09:14', '2024-06-11 12:09:14'),
(137, 46, '124.23550128936769', '-9.694505325523624', '2024-06-11 12:09:42', '2024-06-11 12:09:42'),
(138, 46, '124.23962116241456', '-9.690401958223282', '2024-06-11 12:10:12', '2024-06-11 12:10:12'),
(139, 46, '124.23674650490284', '-9.688371407389276', '2024-06-11 12:10:43', '2024-06-11 12:10:43'),
(140, 46, '124.23168182373048', '-9.690359655206239', '2024-06-11 12:11:15', '2024-06-11 12:11:15'),
(141, 45, '124.23148870468141', '-9.697466487235266', '2024-06-11 12:12:12', '2024-06-11 12:12:12'),
(142, 45, '124.23545837402344', '-9.694547628017885', '2024-06-11 12:12:42', '2024-06-11 12:12:42'),
(143, 45, '124.24369879066947', '-9.698397132658053', '2024-06-11 12:13:06', '2024-06-11 12:13:06'),
(144, 45, '124.2448139190674', '-9.703304129431634', '2024-06-11 12:13:35', '2024-06-11 12:13:35'),
(145, 45, '124.23717565834522', '-9.701738974470794', '2024-06-11 12:13:53', '2024-06-11 12:13:53'),
(146, 44, '124.23464298248292', '-9.682575809317825', '2024-06-11 12:17:23', '2024-06-11 12:17:23'),
(147, 44, '124.2370891571045', '-9.68287193719205', '2024-06-11 12:17:54', '2024-06-11 12:17:54'),
(148, 44, '124.23773288726808', '-9.681137470214324', '2024-06-11 12:18:26', '2024-06-11 12:18:26'),
(149, 44, '124.23683166503908', '-9.679022254460667', '2024-06-11 12:18:53', '2024-06-11 12:18:53'),
(150, 44, '124.23318386077882', '-9.678768427675164', '2024-06-11 12:19:27', '2024-06-11 12:19:27'),
(151, 44, '124.23228263854982', '-9.681814336442159', '2024-06-11 12:19:55', '2024-06-11 12:19:55'),
(152, 43, '124.23408508300783', '-9.678176164429853', '2024-06-11 12:21:23', '2024-06-11 12:21:23'),
(153, 43, '124.23721823841335', '-9.678768427675164', '2024-06-11 12:22:00', '2024-06-11 12:22:00'),
(154, 43, '124.2396640777588', '-9.676653197004912', '2024-06-11 12:22:27', '2024-06-11 12:22:27'),
(155, 43, '124.23992224037647', '-9.672676527299535', '2024-06-11 12:22:55', '2024-06-11 12:22:55'),
(156, 43, '124.23537254333498', '-9.671491978292936', '2024-06-11 12:23:29', '2024-06-11 12:23:29'),
(157, 43, '124.23335552215576', '-9.673734156813945', '2024-06-11 12:23:57', '2024-06-11 12:23:57'),
(158, 42, '124.23867702484132', '-9.68464869895314', '2024-06-11 12:25:09', '2024-06-11 12:25:09'),
(159, 42, '124.24120970070365', '-9.685156343443612', '2024-06-11 12:25:36', '2024-06-11 12:25:36'),
(160, 42, '124.24254007637504', '-9.683379584368883', '2024-06-11 12:25:57', '2024-06-11 12:25:57'),
(161, 42, '124.24189634621146', '-9.680672123891389', '2024-06-11 12:26:19', '2024-06-11 12:26:19'),
(162, 42, '124.23923492431642', '-9.681433599356854', '2024-06-11 12:26:57', '2024-06-11 12:26:57'),
(163, 42, '124.2382049560547', '-9.683337280466793', '2024-06-11 12:27:29', '2024-06-11 12:27:29'),
(164, 41, '124.2026710510254', '-9.723269788668793', '2024-06-11 12:28:36', '2024-06-11 12:28:36'),
(165, 41, '124.21674728393556', '-9.717178696853315', '2024-06-11 12:29:02', '2024-06-11 12:29:02'),
(166, 41, '124.21228408813478', '-9.712779506019892', '2024-06-11 12:29:43', '2024-06-11 12:29:43'),
(167, 41, '124.21056747436525', '-9.70939547372845', '2024-06-11 12:30:07', '2024-06-11 12:30:07'),
(168, 41, '124.20198440551759', '-9.710072282922983', '2024-06-11 12:30:33', '2024-06-11 12:30:33'),
(169, 41, '124.1954639554024', '-9.717686292074182', '2024-06-11 12:30:51', '2024-06-11 12:30:51'),
(170, 40, '124.26871776580812', '-9.722106567898356', '2024-06-11 12:32:32', '2024-06-11 12:32:32'),
(171, 40, '124.26687307655811', '-9.72013965811808', '2024-06-11 12:33:05', '2024-06-11 12:33:05'),
(172, 40, '124.26549978554249', '-9.720604949648239', '2024-06-11 12:33:35', '2024-06-11 12:33:35'),
(173, 40, '124.26601476967338', '-9.722000820354948', '2024-06-11 12:34:09', '2024-06-11 12:34:09'),
(174, 40, '124.26755938678981', '-9.7228256503067', '2024-06-11 12:34:35', '2024-06-11 12:34:35'),
(175, 39, '124.22644615173341', '-9.709014767955386', '2024-06-11 12:35:54', '2024-06-11 12:35:54'),
(176, 39, '124.22490186989307', '-9.711679699277012', '2024-06-11 12:36:26', '2024-06-11 12:36:26'),
(177, 39, '124.22790594398978', '-9.713963909240398', '2024-06-11 12:36:52', '2024-06-11 12:36:52'),
(178, 39, '124.23013754189014', '-9.712568005003797', '2024-06-11 12:37:25', '2024-06-11 12:37:25'),
(179, 39, '124.2292356491089', '-9.708845565250654', '2024-06-11 12:37:57', '2024-06-11 12:37:57'),
(180, 38, '124.22228403389457', '-9.708380257371822', '2024-06-11 12:39:03', '2024-06-11 12:39:03'),
(181, 38, '124.22348566353321', '-9.706053708280773', '2024-06-11 12:39:25', '2024-06-11 12:39:25'),
(182, 38, '124.22129698097709', '-9.705926805138326', '2024-06-11 12:39:52', '2024-06-11 12:39:52'),
(183, 38, '124.21919345855714', '-9.706772825179916', '2024-06-11 12:40:28', '2024-06-11 12:40:28'),
(184, 4099, '124.21902246773243', '-9.63891524679389', '2024-06-11 12:42:29', '2024-06-11 12:42:29'),
(185, 4099, '124.20954018831254', '-9.62901468123594', '2024-06-11 12:42:46', '2024-06-11 12:42:46'),
(186, 4099, '124.21589165925981', '-9.624106600939092', '2024-06-11 12:43:06', '2024-06-11 12:43:06'),
(187, 4099, '124.22189712524415', '-9.626814516128464', '2024-06-11 12:43:33', '2024-06-11 12:43:33'),
(188, 4099, '124.2251613736153', '-9.634768891434057', '2024-06-11 12:43:55', '2024-06-11 12:43:55');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tempat_wisata`
--

CREATE TABLE `tempat_wisata` (
  `id_wisata` int(11) NOT NULL,
  `id_jenis_wisata` int(11) NOT NULL DEFAULT 1,
  `id_desa` int(11) NOT NULL DEFAULT 1,
  `image_wisata` varchar(75) NOT NULL,
  `nama_wisata` varchar(100) DEFAULT NULL,
  `deskripsi` text DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tempat_wisata`
--

INSERT INTO `tempat_wisata` (`id_wisata`, `id_jenis_wisata`, `id_desa`, `image_wisata`, `nama_wisata`, `deskripsi`, `created_at`, `updated_at`) VALUES
(38, 1, 5, '1324574110.jpg', 'Danau Fatukoto', 'Wisata ini tidak jauh dari perbukitan  terdapat danau cantik yang tersembunyi di Desa Fatukoto, yaitu Danau Nausus atau sering juga disebut Danau Fatukoto. Danau ini begitu tenang dan indah. Selain itu, air danaunya berwarna hijau kecoklatan dan jadi tempat tinggal bagi ikan air tawar menjadi daya tarik tersendiri.Sementara itu, di sepanjang pinggiran danau juga terdapat pepohonan pinus. Dari Kota Kupang hanya perlu saat lebih kurang 3 jam 16 menitan memakai kendaraan roda dua menuju wisata ini', '2024-05-18 05:42:12', '2024-06-04 00:20:22'),
(39, 1, 5, '1090126909.jpg', 'Fatunausus', 'Berjarak tempuh 138 km dari Kupang dan 28 km dari kota Soe, terdapat sebuah spot alam yang kokoh berdiri yang disebut Fatunausus.Objek wisata yang bisa kalian eksplor setelah melalui perjalanan 3 jam dari Kupang ini merupakan tempat persembayangan bagi masyarakat suku Mollo yang mendiami sekitar batu tersebut. Di lokasi yang berketinggian 1.500 m di atas permukaan laut ini, menyuguhkan pemandangan alam yang sangat indah. Guratan pegunungan, lembah dan batu marmer berbentuk runcing ke arah langit menjadi daya tarik pengunjung yang datang.', '2024-05-18 05:42:12', '2024-06-04 01:47:08'),
(40, 4, 1, '335488449.jpg', 'Sonaf Raja Mollo', 'Pusat Kerajaan Mollo yang berada di Sonaf Aijaobaki. Di tempat ini Anda dapat menyaksikan bekas peninggalan Kerajaan Mollo yang dipimpin oleh Raja Oematan.Sonaf merupakan istana tempat tinggal Raja atau Usif yang juga merupakan pusat dari sebuah kerajaan yang ada di Pulau Timor. Pulau Timor memiliki benyak Sonaf yang terbagi di beberapa bagian wilayah di Pulau Timor. Salah satu Sonaf di Pulau Timor yang masih berdiri sampai sekarang adalah Sonaf Ajaobaki. Jarak menuju Sonaf Ajaobaki dari Kota Kupang kurang lebih 128 kilometer Kemudahan untuk mencapai lokasi Sonaf Ajaobaki tergolong mudah untuk dicapai karena jalan menuju lokasi Sonaf Ajaobaki melewati jalanan aspal yang baik, dan lokasi Sonaf Ajapobaki yang berada di pinggir jalan raya.', '2024-05-18 05:42:12', '2024-06-03 21:22:11'),
(41, 1, 9, '2046531573.jpg', 'Panorama Alam Lelobatan', 'Panorama alam lelobatan terletak di kecamatan Mollo Utara jarak antara kota kupang dengan wisata ini ya itu 143 KM. Keunikan dari wisata ini adalah pemandangan alam yang sangat indah, padang rumput yang hijau , hewan milik warga seperti kuda dan sapi yang berkeliaran di pinggir jalan utama', '2024-05-18 05:42:12', '2024-06-03 19:54:12'),
(42, 1, 18, '80145756.jpg', 'Batu Marmer', 'Wisata alam yang dimiliki Nusa Tenggara Timur bisa dibilang tak pernah ada habisnya. Pesona yang dipancarkan tanah Timor selalu membuat semua mata terbelalak karena takjub. Seperti pesona Desa Tunua, dibekas tambang batu marmernya.Desa Tunua dikenal sebagai bekas lokasi tambang marmer, tepatnya di bukit Naetapan, yang beroperasi sejak tahun 2000, dengan luas 10,5 hektar. Tambang marmer ini mendapat penolakan dari masyarakat adat setempat disebabkan timbulnya kerusakan alam. Destinasi bekas tambang marmer di Desa Tunua ramai dikunjungi para traveler. Bongkahan batu marmer aneka bentuk dan tebing-tebing rata bekas kerja mesin tambang, menjadi penanda kekayaan alam orang Mollo yang sudah dieksploitasi.Wisata ini berada sekitar 137 kilometer dari Kota Kupang, ibu kota Provinsi Nusa Tenggara Timur.', '2024-05-18 05:42:12', '2024-06-03 21:21:28'),
(43, 1, 18, '4080694669.jpg', 'Panorama Alam Tunua', 'Panorama alam tunua terletak di desa tunua kecamatan Mollo Utara jarak antara kota kupang dengan wisata ini ya itu 139 KM. Keunikan dari wisata ini adalh pemandangan salib yang berada di atas batu besar, padang rumput yang hijau dan sangat luas dipinggiran jalan utama', '2024-05-18 05:42:13', '2024-06-03 19:48:34'),
(44, 1, 18, '3068044287.jpg', 'Bukit Bakium', 'Bukit Bikium termasuk salah satu tempat di Timor Tengah Selatan. Keindahannya masih benar-benar alami.jarak yang ditempuh untuk mengunjungi tempat wisata ini memakan waktu 3 jam 24 menit jika berangkat dari Kota Kupang, ibu kota Nusa Tenggara Timur. Akses jalannya sudah juga sangat bagus, diaspal halus hingga sampai tujuan utama dengan keindahan alam luar biasa indah diatas bukit. Hamparan rumput hijau sambil sesekali mengamati hewan-hewan ternak milik masyarakat sekitar. Kehadiran sapi maupun kuda tersebut ikut mempercantik pemandangan sekitar bukit.', '2024-05-18 05:42:13', '2024-06-04 00:17:00'),
(45, 1, 5, '3826204355.jpg', 'Bukit Tomenas', 'Bukit Tomenas terletak di Desa Fatukoto, Mollo Utara, Timor Tengah Selatan. Lokasi ini berada sekitar 40 kilometer dari Kota Kupang, ibu kota provinsi,dan bisa ditempuh menggunakan kendaraan bermotor sekitar 3 jam 17 menit perjalanan.Ketika berada di Bukit Tomenas,  Hijaunya pepohonan, sejauh mata terlihat pula keelokan jalan yang melingkari punggung bukit dan mempercantik pemandangan di sekitar bukit.', '2024-05-18 05:42:13', '2024-06-04 00:14:01'),
(46, 1, 5, '68464304.jpg', 'Panorama Alam Fatukoto', 'Pemandangan di Fatumnasi didominasi oleh hamparan keindahan alam, bahkan sering disebut sebagai taman wisata. Sebagian besar wilayahnya masih berupa alam yang terjaga kelestariannya.panorama alam fatumnasi berjarak dari kota kupang sekitar 136 KM. Panorama alam yang dimaksudkan sepeti tumbuhnya ribuan pohon ampupu berusia ratusan tahun yang sangat indah ,adapun rumah berbentuk segitiga yang sangat unik.Tersedia warung kopi, wc umum dan tempat parkir di area wisata', '2024-05-18 05:42:13', '2024-06-05 11:53:44'),
(47, 1, 21, '2024961332.jpg', 'Bukit Cinta KM.12', 'Bukit Cinta KM.12 Merupakan wisata alam pertama menuju wisata alam berikutnya di wilayah mollo utara wisata ini berjarak dari kota kupang sekitar125 KM. Bukit ini terletak dipinggir jalan utama menuju cagar alam mutis. Bukit ini memiliki pemandangan alam yang indah dan sangat asri. wisata ini memiliki tempat parkir di area titik wisata.', '2024-05-18 05:42:13', '2024-06-05 11:52:53'),
(4098, 3, 19, '2770365583.jpeg', 'Gua Maria Nonohonis', 'Gua Maria Nonohonis merupakan Gua Maria yang terletak di kabupaten Timor Tengah Selatan jarak antaraa ini dengan kota kupang sekitar 113 KM, Gua ini biasayanya dikunjungi oleh umat sebagai tempat berdoa bersama dan juga untuk semakin mengeratkan rasa persaudaraan di antaraÂ umatÂ Katolik. Terdapat tempat parkir area titik lokasi dan kios di sekitar wisata ini ', '2024-06-03 10:13:46', '2024-06-05 11:51:01'),
(4099, 1, 20, '1741420337.jpg', 'Hutan Bonsai', 'Hutan Bonsai adalah jalur trekking menuju Puncak Gunung Mutis jarak antara hutan ini dengan kota kupang yaitu 143 KM. Hutan yang satu ini bukanlah hutan biasa, karena menampilkan pesona alam yang unik dan menarik.Hutan Bonsai Fatumnasi merupakan hutan bonsai yang sudah berumur ratusan tahun. Pohon bonsai sendiri memiliki nilai ekonomi yang sangat tinggi, apalagi jika sudah berumur ratusan tahun. ', '2024-06-03 19:38:59', '2024-06-07 23:58:14');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tentang`
--

CREATE TABLE `tentang` (
  `id_tentang` int(11) NOT NULL,
  `deskripsi` text DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
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
  `id_user` int(11) NOT NULL,
  `id_role` int(11) DEFAULT NULL,
  `id_active` int(11) DEFAULT 2,
  `en_user` varchar(75) DEFAULT NULL,
  `token` char(6) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `image` varchar(100) DEFAULT 'default.svg',
  `email` varchar(75) DEFAULT NULL,
  `password` varchar(75) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp()
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
  `id_access_menu` int(11) NOT NULL,
  `id_role` int(11) DEFAULT NULL,
  `id_menu` int(11) DEFAULT NULL
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
  `id_access_sub_menu` int(11) NOT NULL,
  `id_role` int(11) DEFAULT NULL,
  `id_sub_menu` int(11) DEFAULT NULL
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
(24, 1, 16),
(25, 2, 15),
(26, 2, 16);

-- --------------------------------------------------------

--
-- Struktur dari tabel `user_menu`
--

CREATE TABLE `user_menu` (
  `id_menu` int(11) NOT NULL,
  `menu` varchar(50) DEFAULT NULL
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
  `id_role` int(11) NOT NULL,
  `role` varchar(35) DEFAULT NULL
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
  `id_status` int(11) NOT NULL,
  `status` varchar(35) DEFAULT NULL
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
  `id_sub_menu` int(11) NOT NULL,
  `id_menu` int(11) DEFAULT NULL,
  `id_active` int(11) DEFAULT 2,
  `title` varchar(50) DEFAULT NULL,
  `url` varchar(50) DEFAULT NULL,
  `icon` varchar(50) DEFAULT NULL
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `desa`
--
ALTER TABLE `desa`
  MODIFY `id_desa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT untuk tabel `fasilitas`
--
ALTER TABLE `fasilitas`
  MODIFY `id_fasilitas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT untuk tabel `fasilitas_wisata`
--
ALTER TABLE `fasilitas_wisata`
  MODIFY `id_fasilitas_wisata` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=104;

--
-- AUTO_INCREMENT untuk tabel `galeri`
--
ALTER TABLE `galeri`
  MODIFY `id_galeri` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT untuk tabel `jenis_wisata`
--
ALTER TABLE `jenis_wisata`
  MODIFY `id_jenis_wisata` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `kontak`
--
ALTER TABLE `kontak`
  MODIFY `id_kontak` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `maps`
--
ALTER TABLE `maps`
  MODIFY `id_map` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=75;

--
-- AUTO_INCREMENT untuk tabel `polygon_maps`
--
ALTER TABLE `polygon_maps`
  MODIFY `id_pmap` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=189;

--
-- AUTO_INCREMENT untuk tabel `tempat_wisata`
--
ALTER TABLE `tempat_wisata`
  MODIFY `id_wisata` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4100;

--
-- AUTO_INCREMENT untuk tabel `tentang`
--
ALTER TABLE `tentang`
  MODIFY `id_tentang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `user_access_menu`
--
ALTER TABLE `user_access_menu`
  MODIFY `id_access_menu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `user_access_sub_menu`
--
ALTER TABLE `user_access_sub_menu`
  MODIFY `id_access_sub_menu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT untuk tabel `user_menu`
--
ALTER TABLE `user_menu`
  MODIFY `id_menu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `user_role`
--
ALTER TABLE `user_role`
  MODIFY `id_role` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `user_status`
--
ALTER TABLE `user_status`
  MODIFY `id_status` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `user_sub_menu`
--
ALTER TABLE `user_sub_menu`
  MODIFY `id_sub_menu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

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

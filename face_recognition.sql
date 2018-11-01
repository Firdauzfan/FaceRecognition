-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: 01 Nov 2018 pada 15.34
-- Versi Server: 5.7.24-0ubuntu0.18.04.1
-- PHP Version: 5.6.38-2+ubuntu18.04.1+deb.sury.org+1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `face_recognition`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `employee`
--

CREATE TABLE `employee` (
  `id` int(11) NOT NULL,
  `id_pegawai` bigint(20) NOT NULL,
  `id_telegram` int(11) NOT NULL,
  `nama_pegawai` varchar(30) NOT NULL,
  `email` varchar(30) NOT NULL,
  `no_hp` varchar(15) DEFAULT NULL,
  `divisi` varchar(30) NOT NULL,
  `warning1` varchar(50) DEFAULT NULL,
  `warning2` varchar(50) DEFAULT NULL,
  `warning3` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `employee`
--

INSERT INTO `employee` (`id`, `id_pegawai`, `id_telegram`, `nama_pegawai`, `email`, `no_hp`, `divisi`, `warning1`, `warning2`, `warning3`) VALUES
(1, 12345, 205017793, 'Firdauz Fanani', 'firdauzfanani@gmail.com', '081567920578', 'IT', NULL, NULL, NULL),
(2, 12346, 668662889, 'Riyadi Agung Suharto', '0', '0817737727', 'IT', NULL, NULL, NULL),
(3, 12347, 750150427, 'Teoderikus Ferdian', '0', '087839659675', 'Marketing', NULL, NULL, NULL),
(4, 12348, 376571445, 'Wahyudi Prasatia', '0', '085363236007', 'Marketing', NULL, NULL, NULL),
(5, 12349, 692286966, 'Muhammad Reiza Syaifullah', 'firdauz.fanani@mail.ugm.ac.id', '085274521796', 'HRD', NULL, NULL, NULL),
(6, 12340, 644107942, 'Liza A Barezi', 'lizabarezi@gspe.co.id', '085725180999', 'HRD', NULL, NULL, NULL),
(7, 12341, 764143199, 'Vicky Yuliandi Siahaan', '0', '08128552527', 'Produksi', NULL, NULL, NULL),
(8, 12342, 723606683, 'Faza Ghassani', '0', '089676824961', 'Produksi', NULL, NULL, NULL),
(9, 12343, 252488349, 'Muhammad Yasir Abdulazis', '0', '081703078960', 'Procurement', NULL, NULL, NULL),
(10, 12350, 757158209, 'Dwi Prasetyo', '0', '085224666426', 'Procurement', NULL, NULL, NULL),
(11, 12351, 670747420, 'Imam Sulton', '0', '081917558038', 'Security', NULL, NULL, NULL),
(12, 12354, 788061070, 'Abdul Rohman', '0', '085795735556', 'Resepsionis', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `face_absensi`
--

CREATE TABLE `face_absensi` (
  `id` bigint(20) NOT NULL,
  `employee_id` bigint(20) NOT NULL,
  `nama_pegawai` varchar(30) NOT NULL,
  `waktu_masuk` datetime NOT NULL,
  `waktu_keluar` datetime DEFAULT NULL,
  `kamera` varchar(30) NOT NULL,
  `note` varchar(30) DEFAULT NULL,
  `state` varchar(30) NOT NULL,
  `aktif_terlambat` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `face_absensi`
--

INSERT INTO `face_absensi` (`id`, `employee_id`, `nama_pegawai`, `waktu_masuk`, `waktu_keluar`, `kamera`, `note`, `state`, `aktif_terlambat`) VALUES
(1, 12345, 'Firdauz Fanani', '2018-10-31 06:36:16', NULL, 'kamera 1', 'Tepat Waktu', 'IN', 0),
(2, 12354, 'Abdul Rohman', '2018-10-31 07:25:39', NULL, 'kamera 1', 'Tepat Waktu', 'IN', 0),
(3, 12343, 'Muhammad Yasir Abdulazis', '2018-10-31 08:12:58', NULL, 'kamera 1', 'Tepat Waktu', 'IN', 0),
(4, 12347, 'Teoderikus Ferdian', '2018-10-31 08:17:59', NULL, 'kamera 1', 'Tepat Waktu', 'IN', 0),
(5, 12348, 'Wahyudi Prasatia', '2018-10-31 08:20:26', NULL, 'kamera 1', 'Tepat Waktu', 'IN', 0),
(6, 12342, 'Faza Ghassani', '2018-10-31 08:21:01', NULL, 'kamera 1', 'Tepat Waktu', 'IN', 0),
(7, 12350, 'Dwi Prasetyo', '2018-10-31 08:22:43', NULL, 'kamera 1', 'Tepat Waktu', 'IN', 0),
(8, 12341, 'Vicky Yuliandi Siahaan', '2018-10-31 08:23:18', NULL, 'kamera 1', 'Tepat Waktu', 'IN', 0),
(9, 12346, 'Riyadi Agung Suharto', '2018-10-31 11:24:36', NULL, 'kamera 1', 'Terlambat', 'IN', 1),
(10, 12349, 'Muhammad Reiza Syaifullah', '2018-10-31 08:30:35', NULL, 'kamera 1', 'Terlambat', 'IN', 1),
(11, 12340, 'Liza A Barezi', '2018-10-31 08:32:00', NULL, 'kamera 1', 'Terlambat', 'IN', 1),
(12, 12351, 'Imam Sulton', '2018-10-31 08:33:15', NULL, 'kamera 1', 'Terlambat', 'IN', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `face_keamanan`
--

CREATE TABLE `face_keamanan` (
  `id` bigint(20) NOT NULL,
  `nama` varchar(30) NOT NULL,
  `waktu` datetime NOT NULL,
  `kamera` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `face_keamanan`
--

INSERT INTO `face_keamanan` (`id`, `nama`, `waktu`, `kamera`) VALUES
(1, 'Firdauz Fanani', '2018-10-31 06:36:16', 'kamera 1'),
(2, 'Abdul Rohman', '2018-10-31 06:48:19', 'kamera 1'),
(3, 'Abdul Rohman', '2018-10-31 07:25:39', 'kamera 1'),
(4, 'Wahyudi Prasatia', '2018-10-31 07:57:36', 'kamera 1'),
(5, 'Muhammad Yasir Abdulazis', '2018-10-31 08:12:58', 'kamera 1'),
(6, 'Muhammad Yasir Abdulazis', '2018-10-31 08:13:11', 'kamera 1'),
(7, 'Teoderikus Ferdian', '2018-10-31 08:17:59', 'kamera 1'),
(8, 'Teoderikus Ferdian', '2018-10-31 08:18:05', 'kamera 1'),
(9, 'Wahyudi Prasatia', '2018-10-31 08:20:26', 'kamera 1'),
(10, 'Faza Ghassani', '2018-10-31 08:21:01', 'kamera 1'),
(11, 'Dwi Prasetyo', '2018-10-31 08:22:43', 'kamera 1'),
(12, 'Teoderikus Ferdian', '2018-10-31 08:22:48', 'kamera 1'),
(13, 'Vicky Yuliandi Siahaan', '2018-10-31 08:23:18', 'kamera 1'),
(14, 'Imam Sulton', '2018-10-31 08:29:16', 'kamera 1'),
(15, 'Muhammad Reiza Syaifullah', '2018-10-31 08:30:35', 'kamera 1'),
(16, 'Muhammad Reiza Syaifullah', '2018-10-31 08:31:00', 'kamera 1'),
(17, 'Liza A Barezi', '2018-10-31 08:32:00', 'kamera 1'),
(18, 'Liza A Barezi', '2018-10-31 08:33:15', 'kamera 1'),
(19, 'Imam Sulton', '2018-10-31 08:33:15', 'kamera 1'),
(20, 'Liza A Barezi', '2018-10-31 08:34:00', 'kamera 1'),
(21, 'Liza A Barezi', '2018-10-31 08:35:00', 'kamera 1'),
(22, 'Teoderikus Ferdian', '2018-10-31 09:53:20', 'kamera 1'),
(23, 'Riyadi Agung Suharto', '2018-10-31 11:24:35', 'kamera 1'),
(24, 'Abdul Rohman', '2018-10-31 11:24:56', 'kamera 1'),
(25, 'Firdauz Fanani', '2018-11-01 10:53:35', 'kamera 1'),
(26, 'Firdauz Fanani', '2018-11-01 10:54:00', 'kamera 1'),
(27, 'Firdauz Fanani', '2018-11-01 13:36:57', 'kamera 1'),
(28, 'Firdauz Fanani', '2018-11-01 13:37:00', 'kamera 1'),
(29, 'Firdauz Fanani', '2018-11-01 13:40:07', 'kamera 1'),
(30, 'Firdauz Fanani', '2018-11-01 13:41:32', 'kamera 1'),
(31, 'Firdauz Fanani', '2018-11-01 13:42:35', 'kamera 1'),
(32, 'Firdauz Fanani', '2018-11-01 13:43:28', 'kamera 1'),
(33, 'Firdauz Fanani', '2018-11-01 13:44:00', 'kamera 1'),
(34, 'Firdauz Fanani', '2018-11-01 13:45:00', 'kamera 1'),
(35, 'Firdauz Fanani', '2018-11-01 14:48:45', 'kamera 1'),
(36, 'Firdauz Fanani', '2018-11-01 14:49:00', 'kamera 1'),
(37, 'Firdauz Fanani', '2018-11-01 14:52:22', 'kamera 1'),
(38, 'Firdauz Fanani', '2018-11-01 14:53:00', 'kamera 1'),
(39, 'Firdauz Fanani', '2018-11-01 14:54:32', 'kamera 1'),
(40, 'Firdauz Fanani', '2018-11-01 14:55:00', 'kamera 1'),
(41, 'Firdauz Fanani', '2018-11-01 14:56:00', 'kamera 1'),
(42, 'Firdauz Fanani', '2018-11-01 14:57:21', 'kamera 1'),
(43, 'Firdauz Fanani', '2018-11-01 14:59:03', 'kamera 1'),
(44, 'Firdauz Fanani', '2018-11-01 15:00:00', 'kamera 1'),
(45, 'Firdauz Fanani', '2018-11-01 15:02:22', 'kamera 1'),
(46, 'Firdauz Fanani', '2018-11-01 15:03:00', 'kamera 1'),
(47, 'Firdauz Fanani', '2018-11-01 15:04:00', 'kamera 1'),
(48, 'Firdauz Fanani', '2018-11-01 15:05:00', 'kamera 1'),
(49, 'Firdauz Fanani', '2018-11-01 15:06:04', 'kamera 1'),
(50, 'Firdauz Fanani', '2018-11-01 15:07:00', 'kamera 1'),
(51, 'Firdauz Fanani', '2018-11-01 15:08:27', 'kamera 1'),
(52, 'Firdauz Fanani', '2018-11-01 15:09:02', 'kamera 1'),
(53, 'Firdauz Fanani', '2018-11-01 15:10:08', 'kamera 1'),
(54, 'Firdauz Fanani', '2018-11-01 15:16:14', 'kamera 1'),
(55, 'Firdauz Fanani', '2018-11-01 15:17:53', 'kamera 1'),
(56, 'Firdauz Fanani', '2018-11-01 15:18:18', 'kamera 1'),
(57, 'Firdauz Fanani', '2018-11-01 15:19:00', 'kamera 1'),
(58, 'Firdauz Fanani', '2018-11-01 15:21:26', 'kamera 1'),
(59, 'Firdauz Fanani', '2018-11-01 15:22:04', 'kamera 1'),
(60, 'Firdauz Fanani', '2018-11-01 15:23:00', 'kamera 1'),
(61, 'Firdauz Fanani', '2018-11-01 15:24:00', 'kamera 1'),
(62, 'Firdauz Fanani', '2018-11-01 15:25:49', 'kamera 1'),
(63, 'Firdauz Fanani', '2018-11-01 15:26:05', 'kamera 1'),
(64, 'Firdauz Fanani', '2018-11-01 15:27:13', 'kamera 1'),
(65, 'Firdauz Fanani', '2018-11-01 15:28:00', 'kamera 1'),
(66, 'Firdauz Fanani', '2018-11-01 15:29:10', 'kamera 1'),
(67, 'Firdauz Fanani', '2018-11-01 15:30:13', 'kamera 1'),
(68, 'Firdauz Fanani', '2018-11-01 15:31:00', 'kamera 1');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `face_absensi`
--
ALTER TABLE `face_absensi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `face_keamanan`
--
ALTER TABLE `face_keamanan`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `face_absensi`
--
ALTER TABLE `face_absensi`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `face_keamanan`
--
ALTER TABLE `face_keamanan`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 14, 2018 at 04:57 PM
-- Server version: 5.7.24-0ubuntu0.18.04.1
-- PHP Version: 7.2.10-0ubuntu0.18.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `absensi`
--

-- --------------------------------------------------------

--
-- Table structure for table `camera`
--

CREATE TABLE `camera` (
  `id_camera` int(100) NOT NULL,
  `nama_camera` varchar(50) NOT NULL,
  `rtsp_camera` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `camera`
--

INSERT INTO `camera` (`id_camera`, `nama_camera`, `rtsp_camera`) VALUES
(1, 'Kamera Mushola', 'rtsp://admin:gspe12345@192.168.0.26:554/PSIA/streaming/channels/101'),
(2, 'Kamera Ruang Mushola 1', 'rtsp://admin:gspe12345@192.168.0.26:554/PSIA/streaming/channels/201'),
(3, 'Kamera Ruang Kerja 1', 'rtsp://admin:gspe12345@192.168.0.26:554/PSIA/streaming/channels/301'),
(4, 'Kamera Ruang Kerja 2', 'rtsp://admin:gspe12345@192.168.0.26:554/PSIA/streaming/channels/401'),
(5, 'Kamera Lantai 2', 'rtsp://admin:gspe12345@192.168.0.26:554/PSIA/streaming/channels/501'),
(6, 'Kamera Lantai 3', 'rtsp://admin:gspe12345@192.168.0.26:554/PSIA/streaming/channels/601'),
(7, 'Kamera Lantai 3 Tangga', 'rtsp://admin:gspe12345@192.168.0.26:554/PSIA/streaming/channels/701'),
(8, 'Kamera Resepsionis', 'rtsp://admin:gspe12345@192.168.0.26:554/PSIA/streaming/channels/801'),
(9, 'Kamera Parkir 1', 'rtsp://admin:gspe12345@192.168.0.26:554/PSIA/streaming/channels/901'),
(10, 'Kamera Lantai 1', 'rtsp://admin:gspe12345@192.168.0.26:554/PSIA/streaming/channels/1001'),
(11, 'Kamera Parkir 2', 'rtsp://admin:gspe12345@192.168.0.26:554/PSIA/streaming/channels/1601');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `id` int(11) NOT NULL,
  `id_pegawai` bigint(20) NOT NULL,
  `id_telegram` int(11) NOT NULL,
  `nama_pegawai` varchar(30) NOT NULL,
  `email` varchar(30) NOT NULL,
  `no_hp` varchar(15) DEFAULT NULL,
  `divisi` varchar(30) NOT NULL,
  `jabatan` varchar(30) NOT NULL,
  `warning1` varchar(50) DEFAULT NULL,
  `warning2` varchar(50) DEFAULT NULL,
  `warning3` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`id`, `id_pegawai`, `id_telegram`, `nama_pegawai`, `email`, `no_hp`, `divisi`, `jabatan`, `warning1`, `warning2`, `warning3`) VALUES
(1, 12345, 205017793, 'Firdauz Fanani', 'firdauzfanani@gmail.com', '081567920578', 'IT', 'Manager IT', NULL, NULL, NULL),
(2, 12346, 668662889, 'Riyadi Agung Suharto', '0', '0817737727', 'IT', 'Manager IOT', 'Surat Peringatan 1', NULL, NULL),
(3, 12347, 750150427, 'Teoderikus Ferdian', '0', '087839659675', 'Marketing', 'Manager Marketing', NULL, NULL, NULL),
(4, 12348, 376571445, 'Wahyudi Prasatia', '0', '085363236007', 'Marketing', 'Staf', NULL, NULL, NULL),
(5, 12349, 692286966, 'Muhammad Reiza Syaifullah', 'firdauz.fanani@mail.ugm.ac.id', '085274521796', 'HRD', 'Manager HRD', NULL, NULL, NULL),
(6, 12340, 644107942, 'Liza A Barezi', 'lizabarezi@gspe.co.id', '085725180999', 'HRD', 'Staf', NULL, NULL, NULL),
(7, 12341, 764143199, 'Vicky Yuliandi Siahaan', '0', '08128552527', 'IT', 'Staf', NULL, NULL, NULL),
(8, 12342, 723606683, 'Faza Ghassani', '0', '089676824961', 'Produksi', 'Manager Produksi', NULL, NULL, NULL),
(9, 12343, 252488349, 'Muhammad Yasir Abdulazis', '0', '081703078960', 'Procurement', 'Staf', NULL, NULL, NULL),
(10, 12350, 757158209, 'Dwi Prasetyo', '0', '085224666426', 'Procurement', 'Staf', NULL, NULL, NULL),
(11, 12351, 670747420, 'Imam Sulthon', '0', '081917558038', 'Security', 'Staf', NULL, NULL, NULL),
(12, 12354, 788061070, 'Abdul Rohman', '0', '085795735556', 'Resepsionis', 'Staf', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `face_absensi`
--

CREATE TABLE `face_absensi` (
  `id` bigint(20) NOT NULL,
  `employee_id` bigint(20) NOT NULL,
  `nama_pegawai` varchar(30) NOT NULL,
  `waktu_masuk` datetime NOT NULL,
  `waktu_keluar` datetime DEFAULT NULL,
  `selisih_waktu` float DEFAULT NULL,
  `kamera` varchar(30) NOT NULL,
  `note` varchar(30) DEFAULT NULL,
  `state` varchar(30) NOT NULL,
  `aktif_terlambat` tinyint(1) DEFAULT NULL,
  `aktif_notif` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `face_absensi`
--

INSERT INTO `face_absensi` (`id`, `employee_id`, `nama_pegawai`, `waktu_masuk`, `waktu_keluar`, `selisih_waktu`, `kamera`, `note`, `state`, `aktif_terlambat`, `aktif_notif`) VALUES
(1, 12345, 'Firdauz Fanani', '2018-10-31 06:36:16', '2018-11-06 17:48:01', 0, 'kamera 1', 'Tepat Waktu', 'OUT', 0, 0),
(2, 12354, 'Abdul Rohman', '2018-10-31 07:25:39', '2018-11-02 17:39:35', 0, 'kamera 1', 'Tepat Waktu', 'OUT', 0, 0),
(3, 12343, 'Muhammad Yasir Abdulazis', '2018-10-31 08:12:58', '2018-11-06 19:11:33', 0, 'kamera 1', 'Tepat Waktu', 'OUT', 0, 0),
(4, 12347, 'Teoderikus Ferdian', '2018-10-31 08:17:59', '2018-11-02 17:39:19', 0, 'kamera 1', 'Tepat Waktu', 'OUT', 0, 0),
(5, 12348, 'Wahyudi Prasatia', '2018-10-31 08:20:26', '2018-11-02 17:37:00', 0, 'kamera 1', 'Tepat Waktu', 'OUT', 0, 0),
(6, 12342, 'Faza Ghassani', '2018-10-31 08:21:01', '2018-11-06 17:58:41', 0, 'kamera 1', 'Tepat Waktu', 'OUT', 0, 0),
(7, 12350, 'Dwi Prasetyo', '2018-10-31 08:22:43', '2018-11-02 18:02:02', 0, 'kamera 1', 'Tepat Waktu', 'OUT', 0, 0),
(8, 12341, 'Vicky Yuliandi Siahaan', '2018-10-31 08:23:18', '2018-11-01 17:48:33', 0, 'kamera 1', 'Tepat Waktu', 'OUT', 0, 0),
(9, 12349, 'Muhammad Reiza Syaifullah', '2018-10-31 08:30:35', '2018-11-02 17:47:51', 0, 'kamera 1', 'Terlambat', 'OUT', 1, 0),
(10, 12340, 'Liza A Barezi', '2018-10-31 08:32:00', '2018-11-02 17:36:36', 0, 'kamera 1', 'Terlambat', 'OUT', 0, 0),
(11, 12351, 'Imam Sulthon', '2018-10-31 08:33:15', '2018-10-31 18:05:42', 0, 'kamera 1', 'Terlambat', 'OUT', 1, 0),
(12, 12346, 'Riyadi Agung Suharto', '2018-10-31 11:24:36', '2018-11-05 18:17:45', 0, 'kamera 1', 'Terlambat', 'OUT', 0, 0),
(13, 12349, 'Muhammad Reiza Syaifullah', '2018-11-01 08:59:57', '2018-11-02 17:47:51', 0, 'kamera 1', 'Terlambat', 'OUT', 1, 0),
(14, 12354, 'Abdul Rohman', '2018-11-01 07:00:08', '2018-11-02 17:39:35', 0, 'kamera 1', 'Tepat Waktu', 'OUT', 0, 0),
(15, 12345, 'Firdauz Fanani', '2018-11-01 07:15:14', '2018-11-06 17:48:01', 0, 'kamera 1', 'Tepat Waktu', 'OUT', 0, 0),
(16, 12346, 'Riyadi Agung Suharto', '2018-11-01 07:19:43', '2018-11-05 18:17:45', 0, 'kamera 1', 'Tepat Waktu', 'OUT', 0, 0),
(17, 12340, 'Liza A Barezi', '2018-11-01 08:13:10', '2018-11-02 17:36:36', 0, 'kamera 1', 'Tepat Waktu', 'OUT', 0, 0),
(18, 12347, 'Teoderikus Ferdian', '2018-11-01 08:15:33', '2018-11-02 17:39:19', 0, 'kamera 1', 'Tepat Waktu', 'OUT', 0, 0),
(19, 12348, 'Wahyudi Prasatia', '2018-11-01 08:16:21', '2018-11-02 17:37:00', 0, 'kamera 1', 'Tepat Waktu', 'OUT', 0, 0),
(20, 12341, 'Vicky Yuliandi Siahaan', '2018-11-01 08:19:50', '2018-11-01 17:48:33', 0, 'kamera 1', 'Tepat Waktu', 'OUT', 0, 0),
(21, 12342, 'Faza Ghassani', '2018-11-01 08:21:29', '2018-11-06 17:58:41', 0, 'kamera 1', 'Tepat Waktu', 'OUT', 0, 0),
(22, 12343, 'Muhammad Yasir Abdulazis', '2018-11-01 08:26:51', '2018-11-06 19:11:33', 0, 'kamera 1', 'Tepat Waktu', 'OUT', 0, 0),
(23, 12351, 'Imam Sulthon', '2018-11-01 08:29:53', '2018-11-02 17:37:00', 0, 'kamera 1', 'Tepat Waktu', 'OUT', 0, 0),
(24, 12350, 'Dwi Prasetyo', '2018-11-01 08:49:30', '2018-11-02 18:02:02', 0, 'kamera 1', 'Terlambat', 'OUT', 1, 0),
(25, 12342, 'Faza Ghassani', '2018-11-02 08:45:32', '2018-11-06 17:58:41', 0, 'kamera 1', 'Terlambat', 'OUT', 1, 0),
(26, 12349, 'Muhammad Reiza Syaifullah', '2018-11-02 07:08:05', '2018-11-02 17:47:51', 0, 'kamera 1', 'Tepat Waktu', 'OUT', 0, 0),
(27, 12348, 'Wahyudi Prasatia', '2018-11-02 07:34:30', '2018-11-02 17:37:00', 0, 'kamera 1', 'Tepat Waktu', 'OUT', 0, 0),
(28, 12340, 'Liza A Barezi', '2018-11-02 07:40:34', '2018-11-02 17:36:36', 0, 'kamera 1', 'Tepat Waktu', 'OUT', 0, 0),
(29, 12354, 'Abdul Rohman', '2018-11-02 07:25:39', '2018-11-02 17:39:35', 0, 'kamera 1', 'Tepat Waktu', 'OUT', 0, 0),
(30, 12347, 'Teoderikus Ferdian', '2018-11-02 08:23:49', '2018-11-02 17:39:19', 0, 'kamera 1', 'Tepat Waktu', 'OUT', 0, 0),
(31, 12343, 'Muhammad Yasir Abdulazis', '2018-11-02 08:27:03', '2018-11-06 19:11:33', 0, 'kamera 1', 'Tepat Waktu', 'OUT', 0, 0),
(32, 12350, 'Dwi Prasetyo', '2018-11-02 08:29:09', '2018-11-02 18:02:02', 0, 'kamera 1', 'Tepat Waktu', 'OUT', 0, 0),
(33, 12345, 'Firdauz Fanani', '2018-11-02 09:08:22', '2018-11-06 17:48:01', 0, 'kamera 1', 'Terlambat', 'OUT', 0, 0),
(34, 12348, 'Wahyudi Prasatia', '2018-11-05 07:47:32', '2018-11-05 18:00:00', 0, 'kamera 1', 'Tepat Waktu', 'OUT', 0, 0),
(35, 12347, 'Teoderikus Ferdian', '2018-11-05 08:06:02', '2018-11-05 17:31:54', 0, 'kamera 1', 'Tepat Waktu', 'OUT', 0, 0),
(36, 12349, 'Muhammad Reiza Syaifullah', '2018-11-05 08:06:32', '2018-11-05 17:31:54', 0, 'kamera 1', 'Tepat Waktu', 'OUT', 0, 0),
(37, 12351, 'Imam Sulthon', '2018-11-05 08:25:24', '2018-11-05 17:31:54', 0, 'kamera 1', 'Tepat Waktu', 'OUT', 0, 0),
(38, 12350, 'Dwi Prasetyo', '2018-11-05 08:26:36', '2018-11-05 17:31:54', 0, 'kamera 1', 'Tepat Waktu', 'OUT', 0, 0),
(39, 12354, 'Abdul Rohman', '2018-11-05 08:26:45', '2018-11-05 17:31:54', 0, 'kamera 1', 'Tepat Waktu', 'OUT', 0, 0),
(40, 12345, 'Firdauz Fanani', '2018-11-05 08:26:45', '2018-11-06 17:48:01', 0, 'kamera 1', 'Tepat Waktu', 'OUT', 0, 0),
(41, 12342, 'Faza Ghassani', '2018-11-05 08:06:02', '2018-11-06 17:58:41', 0, 'kamera 1', 'Tepat Waktu', 'OUT', 0, 0),
(42, 12346, 'Riyadi Agung Suharto', '2018-11-05 08:23:18', '2018-11-05 18:17:45', 0, 'kamera 1', 'Tepat Waktu', 'OUT', 0, 0),
(43, 12341, 'Vicky Yuliandi Siahaan', '2018-11-05 08:23:18', '2018-11-05 17:31:54', 0, 'kamera 1', 'Tepat Waktu', 'OUT', 0, 0),
(44, 12354, 'Abdul Rohman', '2018-11-06 06:55:00', '2018-11-05 17:31:54', 0, 'kamera 1', 'Tepat Waktu', 'OUT', 0, 0),
(45, 12345, 'Firdauz Fanani', '2018-11-06 07:03:41', '2018-11-05 17:31:54', 0, 'kamera 1', 'Tepat Waktu', 'OUT', 0, 0),
(46, 12346, 'Riyadi Agung Suharto', '2018-11-06 07:08:46', '2018-11-05 17:31:54', 0, 'kamera 1', 'Tepat Waktu', 'OUT', 0, 0),
(47, 12350, 'Dwi Prasetyo', '2018-11-06 07:31:33', '2018-11-05 17:31:54', 0, 'kamera 1', 'Tepat Waktu', 'OUT', 0, 0),
(48, 12347, 'Teoderikus Ferdian', '2018-11-06 07:31:59', '2018-11-05 17:31:54', 0, 'kamera 1', 'Tepat Waktu', 'OUT', 0, 0),
(49, 12343, 'Muhammad Yasir Abdulazis', '2018-11-06 08:16:04', '2018-11-06 19:11:33', 0, 'kamera 1', 'Tepat Waktu', 'OUT', 0, 0),
(50, 12341, 'Vicky Yuliandi Siahaan', '2018-11-06 08:19:34', '2018-11-05 17:31:54', 0, 'kamera 1', 'Tepat Waktu', 'OUT', 0, 0),
(51, 12342, 'Faza Ghassani', '2018-11-06 08:24:07', '2018-11-06 17:58:41', 0, 'kamera 1', 'Tepat Waktu', 'OUT', 0, 0),
(52, 12340, 'Liza A Barezi', '2018-11-01 08:13:10', '2018-11-06 17:58:41', 0, 'kamera 1', 'Tepat Waktu', 'OUT', 0, 0),
(53, 12351, 'Imam Sulthon', '2018-11-06 08:29:15', '2018-11-06 17:58:41', 0, 'kamera 1', 'Tepat Waktu', 'OUT', 0, 0),
(54, 12354, 'Abdul Rohman', '2018-11-08 07:25:39', '2018-11-08 18:10:35', 0, 'kamera 1', 'Tepat Waktu', 'OUT', 0, 0),
(55, 12343, 'Muhammad Yasir Abdulazis', '2018-11-08 08:12:58', '2018-11-08 18:11:14', 0, 'kamera 1', 'Tepat Waktu', 'OUT', 0, 0),
(56, 12347, 'Teoderikus Ferdian', '2018-11-08 08:17:59', '2018-11-08 18:11:14', 0, 'kamera 1', 'Tepat Waktu', 'OUT', 0, 0),
(57, 12348, 'Wahyudi Prasatia', '2018-11-08 08:20:26', '2018-11-08 18:11:15', 0, 'kamera 1', 'Tepat Waktu', 'OUT', 0, 0),
(58, 12342, 'Faza Ghassani', '2018-11-08 08:21:01', '2018-11-08 18:11:14', 0, 'kamera 1', 'Tepat Waktu', 'OUT', 0, 0),
(59, 12350, 'Dwi Prasetyo', '2018-11-08 08:22:43', '2018-11-08 18:10:02', 0, 'kamera 1', 'Tepat Waktu', 'OUT', 0, 0),
(60, 12341, 'Vicky Yuliandi Siahaan', '2018-11-08 08:23:18', '2018-11-08 18:11:14', 0, 'kamera 1', 'Tepat Waktu', 'OUT', 0, 0),
(61, 12349, 'Muhammad Reiza Syaifullah', '2018-11-08 08:30:35', '2018-11-08 18:11:14', 0, 'kamera 1', 'Terlambat', 'OUT', 1, 0),
(62, 12340, 'Liza A Barezi', '2018-11-08 08:32:00', '2018-11-08 18:11:14', 0, 'kamera 1', 'Terlambat', 'OUT', 0, 0),
(63, 12351, 'Imam Sulthon', '2018-11-08 08:33:15', '2018-11-08 18:11:14', 0, 'kamera 1', 'Terlambat', 'OUT', 1, 0),
(64, 12346, 'Riyadi Agung Suharto', '2018-11-08 11:24:36', '2018-11-08 18:11:14', 0, 'kamera 1', 'Terlambat', 'OUT', 0, 0),
(65, 12345, 'Firdauz Fanani', '2018-11-08 16:44:01', '2018-11-08 18:11:14', 0, 'kamera 1', 'Terlambat', 'OUT', 0, 0),
(66, 12343, 'Muhammad Yasir Abdulazis', '2018-11-09 08:13:06', '2018-11-09 17:34:10', 0, 'kamera 1', 'Tepat Waktu', 'OUT', 0, 0),
(67, 12349, 'Muhammad Reiza Syaifullah', '2018-11-09 06:47:02', '2018-11-09 18:07:09', 0, 'kamera 1', 'Tepat Waktu', 'OUT', 0, 0),
(68, 12348, 'Wahyudi Prasatia', '2018-11-09 08:13:06', '2018-11-09 17:34:22', 0, 'kamera 1', 'Tepat Waktu', 'OUT', 0, 0),
(69, 12350, 'Dwi Prasetyo', '2018-11-09 08:15:30', '2018-11-09 18:07:06', 0, 'kamera 1', 'Tepat Waktu', 'OUT', 0, 0),
(70, 12347, 'Teoderikus Ferdian', '2018-11-09 08:15:43', '2018-11-09 17:52:44', 0, 'kamera 1', 'Tepat Waktu', 'OUT', 0, 0),
(71, 12354, 'Abdul Rohman', '2018-11-09 08:16:29', '2018-11-09 17:38:55', 0, 'kamera 1', 'Tepat Waktu', 'OUT', 0, 0),
(72, 12346, 'Riyadi Agung Suharto', '2018-11-09 08:22:09', '2018-11-09 17:52:42', 0, 'kamera 1', 'Tepat Waktu', 'OUT', 0, 0),
(73, 12340, 'Liza A Barezi', '2018-11-09 08:23:55', '2018-11-09 18:03:33', 0, 'kamera 1', 'Tepat Waktu', 'OUT', 0, 0),
(74, 12345, 'Firdauz Fanani', '2018-11-09 08:23:55', '2018-11-09 18:28:37', 0, 'kamera 1', 'Tepat Waktu', 'OUT', 0, 0),
(75, 12351, 'Imam Sulthon', '2018-11-09 08:29:56', '2018-11-09 17:34:06', 0, 'kamera 1', 'Tepat Waktu', 'OUT', 0, 0),
(76, 12341, 'Vicky Yuliandi Siahaan', '2018-11-09 08:30:02', '2018-11-09 17:42:18', 0.0333, 'kamera 1', 'Terlambat', 'OUT', 1, 0),
(77, 12342, 'Faza Ghassani', '2018-11-09 08:32:16', '2018-11-09 17:38:55', 2.2667, 'kamera 1', 'Terlambat', 'OUT', 1, 0),
(78, 12345, 'Firdauz Fanani', '2018-11-12 06:59:08', '2018-11-12 18:02:46', 0, 'kamera 1', 'Tepat Waktu', 'OUT', 0, 0),
(79, 12354, 'Abdul Rohman', '2018-11-12 07:01:30', '2018-11-12 18:10:25', 0, 'kamera 1', 'Tepat Waktu', 'OUT', 0, 0),
(80, 12342, 'Faza Ghassani', '2018-11-12 08:26:06', '2018-11-13 18:10:25', 0, 'kamera 1', 'Tepat Waktu', 'OUT', 0, 0),
(81, 12348, 'Wahyudi Prasatia', '2018-11-12 08:26:42', '2018-11-12 17:49:32', 0, 'kamera 1', 'Tepat Waktu', 'OUT', 0, 0),
(82, 12347, 'Teoderikus Ferdian', '2018-11-12 08:27:05', '2018-11-12 18:04:06', 0, 'kamera 1', 'Tepat Waktu', 'OUT', 0, 0),
(83, 12351, 'Imam Sulthon', '2018-11-12 08:28:01', '2018-11-12 18:09:10', 0, 'kamera 1', 'Tepat Waktu', 'OUT', 0, 0),
(84, 12349, 'Muhammad Reiza Syaifullah', '2018-11-12 08:31:09', '2018-11-12 18:17:01', 0, 'kamera 1', 'Tepat Waktu', 'OUT', 0, 0),
(85, 12341, 'Vicky Yuliandi Siahaan', '2018-11-12 08:32:23', '2018-11-12 18:10:32', 0, 'kamera 1', 'Tepat Waktu', 'OUT', 0, 0),
(86, 12340, 'Liza A Barezi', '2018-11-12 08:33:45', '2018-11-12 18:09:26', 0, 'kamera 1', 'Tepat Waktu', 'OUT', 0, 0),
(87, 12350, 'Dwi Prasetyo', '2018-11-12 08:39:04', '2018-11-12 18:17:04', 0, 'kamera 1', 'Tepat Waktu', 'OUT', 0, 0),
(88, 12343, 'Muhammad Yasir Abdulazis', '2018-11-12 08:43:34', '2018-11-12 17:41:08', 0, 'kamera 1', 'Tepat Waktu', 'OUT', 0, 0),
(89, 12346, 'Riyadi Agung Suharto', '2018-11-12 12:41:38', '2018-11-12 17:41:08', 236.633, 'kamera 1', 'Terlambat', 'OUT', 1, 0),
(90, 12345, 'Firdauz Fanani', '2018-11-13 06:31:55', '2018-11-13 17:49:09', 0, 'kamera 1', 'Tepat Waktu', 'OUT', 0, 0),
(91, 12349, 'Muhammad Reiza Syaifullah', '2018-11-13 06:32:00', '2018-11-13 18:23:08', 0, 'kamera 1', 'Tepat Waktu', 'OUT', 0, 0),
(92, 12354, 'Abdul Rohman', '2018-11-13 06:53:08', '2018-11-13 18:13:48', 0, 'kamera 1', 'Tepat Waktu', 'OUT', 0, 0),
(93, 12340, 'Liza A Barezi', '2018-11-13 08:14:23', '2018-11-13 17:54:50', 0, 'kamera 1', 'Tepat Waktu', 'OUT', 0, 0),
(94, 12347, 'Teoderikus Ferdian', '2018-11-13 08:15:37', '2018-11-13 17:51:06', 0, 'kamera 1', 'Tepat Waktu', 'OUT', 0, 0),
(95, 12348, 'Wahyudi Prasatia', '2018-11-13 08:15:37', '2018-11-13 17:51:35', 0, 'kamera 1', 'Tepat Waktu', 'OUT', 0, 0),
(96, 12351, 'Imam Sulthon', '2018-11-13 08:21:17', '2018-11-13 17:55:36', 0, 'kamera 1', 'Tepat Waktu', 'OUT', 0, 0),
(97, 12342, 'Faza Ghassani', '2018-11-13 08:26:39', '2018-11-13 17:55:09', 0, 'kamera 1', 'Tepat Waktu', 'OUT', 0, 0),
(98, 12343, 'Muhammad Yasir Abdulazis', '2018-11-13 08:27:04', '2018-11-13 17:45:27', 0, 'kamera 1', 'Tepat Waktu', 'OUT', 0, 0),
(99, 12350, 'Dwi Prasetyo', '2018-11-13 08:31:09', '2018-11-13 18:03:58', 0, 'kamera 1', 'Tepat Waktu', 'OUT', 0, 0),
(100, 12345, 'Firdauz Fanani', '2018-11-14 06:26:06', NULL, 0, 'kamera 1', 'Tepat Waktu', 'IN', 0, 0),
(101, 12349, 'Muhammad Reiza Syaifullah', '2018-11-14 06:26:50', NULL, 0, 'kamera 1', 'Tepat Waktu', 'IN', 0, 0),
(102, 12351, 'Imam Sulthon', '2018-11-14 08:17:52', NULL, 0, 'kamera 1', 'Tepat Waktu', 'IN', 0, 0),
(103, 12343, 'Muhammad Yasir Abdulazis', '2018-11-14 08:18:53', NULL, 0, 'kamera 1', 'Tepat Waktu', 'IN', 0, 0),
(104, 12354, 'Abdul Rohman', '2018-11-14 08:19:13', NULL, 0, 'kamera 1', 'Tepat Waktu', 'IN', 0, 0),
(105, 12340, 'Liza A Barezi', '2018-11-14 08:25:24', NULL, 0, 'kamera 1', 'Tepat Waktu', 'IN', 0, 0),
(106, 12342, 'Faza Ghassani', '2018-11-14 08:25:34', NULL, 0, 'kamera 1', 'Tepat Waktu', 'IN', 0, 0),
(107, 12347, 'Teoderikus Ferdian', '2018-11-14 08:25:59', NULL, 0, 'kamera 1', 'Tepat Waktu', 'IN', 0, 0),
(108, 12350, 'Dwi Prasetyo', '2018-11-14 08:35:21', NULL, 0, 'kamera 1', 'Tepat Waktu', 'IN', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `face_keamanan`
--

CREATE TABLE `face_keamanan` (
  `id` bigint(20) NOT NULL,
  `nama` varchar(30) NOT NULL,
  `waktu` datetime NOT NULL,
  `kamera` varchar(30) NOT NULL,
  `aktif_notif` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `face_keamanan`
--

INSERT INTO `face_keamanan` (`id`, `nama`, `waktu`, `kamera`, `aktif_notif`) VALUES
(1, 'Firdauz Fanani', '2018-10-31 06:36:16', 'kamera 1', 0),
(2, 'Abdul Rohman', '2018-10-31 06:48:19', 'kamera 1', 0),
(3, 'Abdul Rohman', '2018-10-31 07:25:39', 'kamera 1', 0),
(4, 'Wahyudi Prasatia', '2018-10-31 07:57:36', 'kamera 1', 0),
(5, 'Muhammad Yasir Abdulazis', '2018-10-31 08:12:58', 'kamera 1', 0),
(6, 'Muhammad Yasir Abdulazis', '2018-10-31 08:13:11', 'kamera 1', 0),
(7, 'Teoderikus Ferdian', '2018-10-31 08:17:59', 'kamera 1', 0),
(8, 'Teoderikus Ferdian', '2018-10-31 08:18:05', 'kamera 1', 0),
(9, 'Wahyudi Prasatia', '2018-10-31 08:20:26', 'kamera 1', 0),
(10, 'Faza Ghassani', '2018-10-31 08:21:01', 'kamera 1', 0),
(11, 'Dwi Prasetyo', '2018-10-31 08:22:43', 'kamera 1', 0),
(12, 'Teoderikus Ferdian', '2018-10-31 08:22:48', 'kamera 1', 0),
(13, 'Vicky Yuliandi Siahaan', '2018-10-31 08:23:18', 'kamera 1', 0),
(14, 'Imam Sulton', '2018-10-31 08:29:16', 'kamera 1', 0),
(15, 'Muhammad Reiza Syaifullah', '2018-10-31 08:30:35', 'kamera 1', 0),
(16, 'Muhammad Reiza Syaifullah', '2018-10-31 08:31:00', 'kamera 1', 0),
(17, 'Liza A Barezi', '2018-10-31 08:32:00', 'kamera 1', 0),
(18, 'Liza A Barezi', '2018-10-31 08:33:15', 'kamera 1', 0),
(19, 'Imam Sulton', '2018-10-31 08:33:15', 'kamera 1', 0),
(20, 'Liza A Barezi', '2018-10-31 08:34:00', 'kamera 1', 0),
(21, 'Liza A Barezi', '2018-10-31 08:35:00', 'kamera 1', 0),
(22, 'Teoderikus Ferdian', '2018-10-31 09:53:20', 'kamera 1', 0),
(23, 'Riyadi Agung Suharto', '2018-10-31 11:24:35', 'kamera 1', 0),
(24, 'Abdul Rohman', '2018-10-31 11:24:56', 'kamera 1', 0),
(25, 'Abdul Rohman', '2018-11-01 07:00:07', 'kamera 1', 0),
(26, 'Firdauz Fanani', '2018-11-01 07:12:35', 'kamera 1', 0),
(27, 'Firdauz Fanani', '2018-11-01 07:15:13', 'kamera 1', 0),
(28, 'Riyadi Agung Suharto', '2018-11-01 07:19:43', 'kamera 1', 0),
(29, 'Wahyudi Prasatia', '2018-11-01 08:11:13', 'kamera 1', 0),
(30, 'Liza A Barezi', '2018-11-01 08:13:10', 'kamera 1', 0),
(31, 'Teoderikus Ferdian', '2018-11-01 08:15:33', 'kamera 1', 0),
(32, 'Wahyudi Prasatia', '2018-11-01 08:16:21', 'kamera 1', 0),
(33, 'Teoderikus Ferdian', '2018-11-01 08:16:32', 'kamera 1', 0),
(34, 'Vicky Yuliandi Siahaan', '2018-11-01 08:17:08', 'kamera 1', 0),
(35, 'Vicky Yuliandi Siahaan', '2018-11-01 08:19:49', 'kamera 1', 0),
(36, 'Vicky Yuliandi Siahaan', '2018-11-01 08:20:26', 'kamera 1', 0),
(37, 'Faza Ghassani', '2018-11-01 08:21:30', 'kamera 1', 0),
(38, 'Muhammad Yasir Abdulazis', '2018-11-01 08:26:51', 'kamera 1', 0),
(39, 'Dwi Prasetyo', '2018-11-01 08:47:19', 'kamera 1', 0),
(40, 'Dwi Prasetyo', '2018-11-01 08:49:30', 'kamera 1', 0),
(41, 'Muhammad Reiza Syaifullah', '2018-11-01 08:59:09', 'kamera 1', 0),
(42, 'Muhammad Reiza Syaifullah', '2018-11-01 09:00:22', 'kamera 1', 0),
(43, 'Abdul Rohman', '2018-11-01 13:01:24', 'kamera 1', 0),
(44, 'Wahyudi Prasatia', '2018-11-01 13:48:02', 'kamera 1', 0),
(45, 'Wahyudi Prasatia', '2018-11-01 13:49:30', 'kamera 1', 0),
(46, 'Wahyudi Prasatia', '2018-11-01 13:50:22', 'kamera 1', 0),
(47, 'Abdul Rohman', '2018-11-01 13:57:33', 'kamera 1', 0),
(48, 'Abdul Rohman', '2018-11-01 14:02:57', 'kamera 1', 0),
(49, 'Abdul Rohman', '2018-11-01 14:36:50', 'kamera 1', 0),
(50, 'Abdul Rohman', '2018-11-01 14:37:00', 'kamera 1', 0),
(51, 'Firdauz Fanani', '2018-11-01 17:19:21', 'kamera 1', 0),
(52, 'Abdul Rohman', '2018-11-01 17:33:20', 'kamera 1', 0),
(53, 'Faza Ghassani', '2018-11-01 17:44:33', 'kamera 1', 0),
(54, 'Abdul Rohman', '2018-11-01 18:18:12', 'kamera 1', 0),
(55, 'Wahyudi Prasatia', '2018-11-01 18:19:28', 'kamera 1', 0),
(56, 'Imam Sulton', '2018-11-01 18:19:37', 'kamera 1', 0),
(57, 'Liza A Barezi', '2018-11-01 18:19:44', 'kamera 1', 0),
(58, 'Muhammad Reiza Syaifullah', '2018-11-01 18:19:56', 'kamera 1', 0),
(59, 'Muhammad Reiza Syaifullah', '2018-11-01 18:20:00', 'kamera 1', 0),
(60, 'Imam Sulton', '2018-11-01 18:20:00', 'kamera 1', 0),
(61, 'Riyadi Agung Suharto', '2018-11-01 18:20:48', 'kamera 1', 0),
(62, 'Riyadi Agung Suharto', '2018-11-01 18:21:00', 'kamera 1', 0),
(63, 'Dwi Prasetyo', '2018-11-01 18:22:25', 'kamera 1', 0),
(64, 'Muhammad Yasir Abdulazis', '2018-11-01 18:35:05', 'kamera 1', 0),
(65, 'Firdauz Fanani', '2018-11-05 07:15:31', 'kamera 1', 0),
(66, 'Firdauz Fanani', '2018-11-05 07:22:51', 'kamera 1', 0),
(67, 'Firdauz Fanani', '2018-11-05 07:25:51', 'kamera 1', 0),
(68, 'Firdauz Fanani', '2018-11-05 09:48:57', 'kamera 1', 0),
(69, 'Firdauz Fanani', '2018-11-05 09:49:00', 'kamera 1', 0),
(70, 'Firdauz Fanani', '2018-11-05 09:57:26', 'kamera 1', 0),
(71, 'Firdauz Fanani', '2018-11-05 09:58:33', 'kamera 1', 0),
(72, 'Firdauz Fanani', '2018-11-05 09:59:00', 'kamera 1', 0),
(73, 'Firdauz Fanani', '2018-11-05 16:46:30', 'kamera 1', 0),
(74, 'Firdauz Fanani', '2018-11-05 16:47:00', 'kamera 1', 0),
(75, 'Firdauz Fanani', '2018-11-05 16:51:08', 'kamera 1', 0),
(76, 'Firdauz Fanani', '2018-11-05 16:52:10', 'kamera 1', 0),
(77, 'Firdauz Fanani', '2018-11-05 16:53:00', 'kamera 1', 0),
(78, 'Firdauz Fanani', '2018-11-05 17:31:54', 'kamera 1', 0),
(79, 'Firdauz Fanani', '2018-11-05 17:32:00', 'kamera 1', 0),
(80, 'Riyadi Agung Suharto', '2018-11-05 18:17:45', 'kamera 1', 0),
(81, 'Abdul Rohman', '2018-11-06 06:55:00', 'kamera 1', 0),
(82, 'Firdauz Fanani', '2018-11-06 07:03:41', 'kamera 1', 0),
(83, 'Riyadi Agung Suharto', '2018-11-06 07:08:46', 'kamera 1', 0),
(84, 'Dwi Prasetyo', '2018-11-06 07:31:33', 'kamera 1', 0),
(85, 'Teoderikus Ferdian', '2018-11-06 07:31:59', 'kamera 1', 0),
(86, 'Dwi Prasetyo', '2018-11-06 07:32:57', 'kamera 1', 0),
(87, 'Dwi Prasetyo', '2018-11-06 07:34:14', 'kamera 1', 0),
(88, 'Teoderikus Ferdian', '2018-11-06 07:37:02', 'kamera 1', 0),
(89, 'Muhammad Yasir Abdulazis', '2018-11-06 08:16:04', 'kamera 1', 0),
(90, 'Vicky Yuliandi Siahaan', '2018-11-06 08:19:34', 'kamera 1', 0),
(91, 'Teoderikus Ferdian', '2018-11-06 08:21:08', 'kamera 1', 0),
(92, 'Muhammad Yasir Abdulazis', '2018-11-06 08:24:00', 'kamera 1', 0),
(93, 'Faza Ghassani', '2018-11-06 08:24:07', 'kamera 1', 0),
(94, 'Muhammad Yasir Abdulazis', '2018-11-06 16:08:04', 'kamera 1', 0),
(95, 'Firdauz Fanani', '2018-11-06 17:48:01', 'kamera 1', 0),
(96, 'Faza Ghassani', '2018-11-06 17:58:41', 'kamera 1', 0),
(97, 'Muhammad Yasir Abdulazis', '2018-11-06 19:11:33', 'kamera 1', 0),
(98, 'Firdauz Fanani', '2018-11-07 09:50:24', 'kamera 1', 0),
(99, 'Teoderikus Ferdian', '2018-11-07 13:34:46', 'kamera 1', 0),
(100, 'Firdauz Fanani', '2018-11-08 06:35:59', 'kamera 1', 0),
(101, 'Muhammad Yasir Abdulazis', '2018-11-08 06:36:05', 'kamera 1', 0),
(102, 'Firdauz Fanani', '2018-11-08 06:38:29', 'kamera 1', 0),
(103, 'Imam Sulton', '2018-11-08 09:56:25', 'kamera 1', 0),
(104, 'Muhammad Yasir Abdulazis', '2018-11-08 10:04:32', 'kamera 1', 0),
(105, 'Firdauz Fanani', '2018-11-08 10:46:31', 'kamera 1', 0),
(106, 'Faza Ghassani', '2018-11-08 10:47:18', 'kamera 1', 0),
(107, 'Firdauz Fanani', '2018-11-08 10:48:59', 'kamera 1', 0),
(108, 'Firdauz Fanani', '2018-11-08 11:06:28', 'kamera 1', 0),
(109, 'Firdauz Fanani', '2018-11-08 11:17:30', 'kamera 1', 0),
(110, 'Firdauz Fanani', '2018-11-08 11:19:22', 'kamera 1', 0),
(111, 'Firdauz Fanani', '2018-11-08 11:23:00', 'kamera 1', 0),
(112, 'Muhammad Yasir Abdulazis', '2018-11-08 11:39:53', 'kamera 1', 0),
(113, 'Firdauz Fanani', '2018-11-08 11:44:03', 'kamera 1', 0),
(114, 'Muhammad Yasir Abdulazis', '2018-11-08 11:46:45', 'kamera 1', 0),
(115, 'Wahyudi Prasatia', '2018-11-08 11:46:45', 'kamera 1', 0),
(116, 'Muhammad Yasir Abdulazis', '2018-11-08 11:50:38', 'kamera 1', 0),
(117, 'Firdauz Fanani', '2018-11-08 11:51:06', 'kamera 1', 0),
(118, 'Muhammad Yasir Abdulazis', '2018-11-08 11:56:03', 'kamera 1', 0),
(119, 'Vicky Yuliandi Siahaan', '2018-11-08 12:01:52', 'kamera 1', 0),
(120, 'Teoderikus Ferdian', '2018-11-08 12:01:52', 'kamera 1', 0),
(121, 'Vicky Yuliandi Siahaan', '2018-11-08 12:02:00', 'kamera 1', 0),
(122, 'Faza Ghassani', '2018-11-08 12:03:59', 'kamera 1', 0),
(123, 'Faza Ghassani', '2018-11-08 12:04:00', 'kamera 1', 0),
(124, 'Muhammad Yasir Abdulazis', '2018-11-08 12:04:18', 'kamera 1', 0),
(125, 'Muhammad Yasir Abdulazis', '2018-11-08 12:09:32', 'kamera 1', 0),
(126, 'Faza Ghassani', '2018-11-08 12:31:45', 'kamera 1', 0),
(127, 'Faza Ghassani', '2018-11-08 12:32:54', 'kamera 1', 0),
(128, 'Teoderikus Ferdian', '2018-11-08 12:56:47', 'kamera 1', 0),
(129, 'Muhammad Reiza Syaifullah', '2018-11-08 13:00:58', 'kamera 1', 0),
(130, 'Muhammad Reiza Syaifullah', '2018-11-08 13:01:00', 'kamera 1', 0),
(131, 'Muhammad Yasir Abdulazis', '2018-11-08 13:01:07', 'kamera 1', 0),
(132, 'Muhammad Yasir Abdulazis', '2018-11-08 13:04:16', 'kamera 1', 0),
(133, 'Abdul Rohman', '2018-11-08 13:04:16', 'kamera 1', 0),
(134, 'Muhammad Yasir Abdulazis', '2018-11-08 13:13:36', 'kamera 1', 0),
(135, 'Firdauz Fanani', '2018-11-08 13:18:16', 'kamera 1', 0),
(136, 'Faza Ghassani', '2018-11-08 13:23:31', 'kamera 1', 0),
(137, 'Muhammad Yasir Abdulazis', '2018-11-08 13:24:11', 'kamera 1', 0),
(138, 'Muhammad Yasir Abdulazis', '2018-11-08 13:26:33', 'kamera 1', 0),
(139, 'Faza Ghassani', '2018-11-08 13:28:29', 'kamera 1', 0),
(140, 'Wahyudi Prasatia', '2018-11-08 13:29:31', 'kamera 1', 0),
(141, 'Liza A Barezi', '2018-11-08 13:29:52', 'kamera 1', 0),
(142, 'Wahyudi Prasatia', '2018-11-08 13:30:00', 'kamera 1', 0),
(143, 'Faza Ghassani', '2018-11-08 13:33:15', 'kamera 1', 0),
(144, 'Faza Ghassani', '2018-11-08 13:34:18', 'kamera 1', 0),
(145, 'Wahyudi Prasatia', '2018-11-08 13:36:09', 'kamera 1', 0),
(146, 'Faza Ghassani', '2018-11-08 13:43:59', 'kamera 1', 0),
(147, 'Riyadi Agung Suharto', '2018-11-08 14:23:11', 'kamera 1', 0),
(148, 'Muhammad Yasir Abdulazis', '2018-11-08 14:32:43', 'kamera 1', 0),
(149, 'Firdauz Fanani', '2018-11-08 14:42:49', 'kamera 1', 0),
(150, 'Firdauz Fanani', '2018-11-08 14:43:00', 'kamera 1', 0),
(151, 'Firdauz Fanani', '2018-11-08 14:46:33', 'kamera 1', 0),
(152, 'Firdauz Fanani', '2018-11-08 14:47:01', 'kamera 1', 0),
(153, 'Firdauz Fanani', '2018-11-08 14:50:29', 'kamera 1', 0),
(154, 'Firdauz Fanani', '2018-11-08 14:51:13', 'kamera 1', 0),
(155, 'Firdauz Fanani', '2018-11-08 15:04:39', 'kamera 1', 0),
(156, 'Firdauz Fanani', '2018-11-08 15:05:01', 'kamera 1', 0),
(157, 'Muhammad Yasir Abdulazis', '2018-11-08 15:06:17', 'kamera 1', 0),
(158, 'Firdauz Fanani', '2018-11-08 15:18:59', 'kamera 1', 0),
(159, 'Firdauz Fanani', '2018-11-08 15:19:00', 'kamera 1', 0),
(160, 'Firdauz Fanani', '2018-11-08 15:21:32', 'kamera 1', 0),
(161, 'Firdauz Fanani', '2018-11-08 15:22:00', 'kamera 1', 0),
(162, 'Faza Ghassani', '2018-11-08 16:01:19', 'kamera 1', 0),
(163, 'Firdauz Fanani', '2018-11-08 16:06:17', 'kamera 1', 0),
(164, 'Firdauz Fanani', '2018-11-08 16:10:05', 'kamera 1', 0),
(165, 'Riyadi Agung Suharto', '2018-11-08 16:12:11', 'kamera 1', 0),
(166, 'Riyadi Agung Suharto', '2018-11-08 16:14:00', 'kamera 1', 0),
(167, 'Firdauz Fanani', '2018-11-08 16:16:50', 'kamera 1', 0),
(168, 'Firdauz Fanani', '2018-11-08 16:17:00', 'kamera 1', 0),
(169, 'Teoderikus Ferdian', '2018-11-08 16:28:24', 'kamera 1', 0),
(170, 'Liza A Barezi', '2018-11-08 16:30:30', 'kamera 1', 0),
(171, 'Firdauz Fanani', '2018-11-08 16:44:01', 'kamera 1', 0),
(172, 'Muhammad Yasir Abdulazis', '2018-11-08 16:51:39', 'kamera 1', 0),
(173, 'Muhammad Yasir Abdulazis', '2018-11-08 16:52:42', 'kamera 1', 0),
(174, 'Abdul Rohman', '2018-11-08 16:54:03', 'kamera 1', 0),
(175, 'Muhammad Yasir Abdulazis', '2018-11-08 16:57:31', 'kamera 1', 0),
(176, 'Firdauz Fanani', '2018-11-08 16:57:57', 'kamera 1', 0),
(177, 'Firdauz Fanani', '2018-11-08 16:58:00', 'kamera 1', 0),
(178, 'Firdauz Fanani', '2018-11-08 17:04:21', 'kamera 1', 0),
(179, 'Muhammad Yasir Abdulazis', '2018-11-08 17:05:39', 'kamera 1', 0),
(180, 'Firdauz Fanani', '2018-11-08 17:07:49', 'kamera 1', 0),
(181, 'Firdauz Fanani', '2018-11-08 17:08:01', 'kamera 1', 0),
(182, 'Muhammad Reiza Syaifullah', '2018-11-08 17:35:49', 'kamera 1', 0),
(183, 'Dwi Prasetyo', '2018-11-08 18:10:02', 'kamera 1', 0),
(184, 'Abdul Rohman', '2018-11-08 18:10:35', 'kamera 1', 0),
(185, 'Muhammad Yasir Abdulazis', '2018-11-08 18:11:14', 'kamera 1', 0),
(186, 'Wahyudi Prasatia', '2018-11-08 18:11:15', 'kamera 1', 0),
(187, 'Firdauz Fanani', '2018-11-09 06:46:22', 'kamera 1', 0),
(188, 'Firdauz Fanani', '2018-11-09 06:47:00', 'kamera 1', 0),
(189, 'Muhammad Reiza Syaifullah', '2018-11-09 06:47:02', 'kamera 1', 0),
(190, 'Firdauz Fanani', '2018-11-09 06:57:38', 'kamera 1', 0),
(191, 'Firdauz Fanani', '2018-11-09 06:58:26', 'kamera 1', 0),
(192, 'Firdauz Fanani', '2018-11-09 07:01:38', 'kamera 1', 0),
(193, 'Wahyudi Prasatia', '2018-11-09 08:13:06', 'kamera 1', 0),
(194, 'Wahyudi Prasatia', '2018-11-09 08:14:00', 'kamera 1', 0),
(195, 'Wahyudi Prasatia', '2018-11-09 08:15:12', 'kamera 1', 0),
(196, 'Dwi Prasetyo', '2018-11-09 08:15:30', 'kamera 1', 0),
(197, 'Teoderikus Ferdian', '2018-11-09 08:15:43', 'kamera 1', 0),
(198, 'Abdul Rohman', '2018-11-09 08:16:29', 'kamera 1', 0),
(199, 'Teoderikus Ferdian', '2018-11-09 08:21:05', 'kamera 1', 0),
(200, 'Riyadi Agung Suharto', '2018-11-09 08:22:09', 'kamera 1', 0),
(201, 'Liza A Barezi', '2018-11-09 08:23:55', 'kamera 1', 0),
(202, 'Liza A Barezi', '2018-11-09 08:24:00', 'kamera 1', 0),
(203, 'Abdul Rohman', '2018-11-09 08:26:22', 'kamera 1', 0),
(204, 'Muhammad Yasir Abdulazis', '2018-11-09 08:28:04', 'kamera 1', 0),
(205, 'Imam Sulton', '2018-11-09 08:29:56', 'kamera 1', 0),
(206, 'Vicky Yuliandi Siahaan', '2018-11-09 08:30:02', 'kamera 1', 0),
(207, 'Faza Ghassani', '2018-11-09 08:32:16', 'kamera 1', 0),
(208, 'Firdauz Fanani', '2018-11-09 08:43:00', 'kamera 1', 0),
(209, 'Imam Sulton', '2018-11-09 08:43:35', 'kamera 1', 0),
(210, 'Firdauz Fanani', '2018-11-09 08:46:39', 'kamera 1', 0),
(211, 'Firdauz Fanani', '2018-11-09 08:48:06', 'kamera 1', 0),
(212, 'Firdauz Fanani', '2018-11-09 08:50:11', 'kamera 1', 0),
(213, 'Wahyudi Prasatia', '2018-11-09 08:53:40', 'kamera 1', 0),
(214, 'Wahyudi Prasatia', '2018-11-09 08:54:00', 'kamera 1', 0),
(215, 'Riyadi Agung Suharto', '2018-11-09 08:55:51', 'kamera 1', 0),
(216, 'Riyadi Agung Suharto', '2018-11-09 08:56:23', 'kamera 1', 0),
(217, 'Firdauz Fanani', '2018-11-09 08:57:52', 'kamera 1', 0),
(218, 'Faza Ghassani', '2018-11-09 09:02:26', 'kamera 1', 0),
(219, 'Muhammad Yasir Abdulazis', '2018-11-09 09:08:51', 'kamera 1', 0),
(220, 'Firdauz Fanani', '2018-11-09 09:16:08', 'kamera 1', 0),
(221, 'Muhammad Yasir Abdulazis', '2018-11-09 09:16:41', 'kamera 1', 0),
(222, 'Teoderikus Ferdian', '2018-11-09 09:16:46', 'kamera 1', 0),
(223, 'Firdauz Fanani', '2018-11-09 09:18:05', 'kamera 1', 0),
(224, 'Firdauz Fanani', '2018-11-09 09:19:00', 'kamera 1', 0),
(225, 'Muhammad Yasir Abdulazis', '2018-11-09 09:21:06', 'kamera 1', 0),
(226, 'Faza Ghassani', '2018-11-09 09:21:55', 'kamera 1', 0),
(227, 'Faza Ghassani', '2018-11-09 09:22:00', 'kamera 1', 0),
(228, 'Faza Ghassani', '2018-11-09 09:23:18', 'kamera 1', 0),
(229, 'Firdauz Fanani', '2018-11-09 09:24:07', 'kamera 1', 0),
(230, 'Firdauz Fanani', '2018-11-09 09:26:05', 'kamera 1', 0),
(231, 'Firdauz Fanani', '2018-11-09 09:27:40', 'kamera 1', 0),
(232, 'Firdauz Fanani', '2018-11-09 09:28:00', 'kamera 1', 0),
(233, 'Firdauz Fanani', '2018-11-09 09:32:48', 'kamera 1', 0),
(234, 'Faza Ghassani', '2018-11-09 09:35:43', 'kamera 1', 0),
(235, 'Firdauz Fanani', '2018-11-09 09:56:42', 'kamera 1', 0),
(236, 'Firdauz Fanani', '2018-11-09 10:07:43', 'kamera 1', 0),
(237, 'Firdauz Fanani', '2018-11-09 10:12:25', 'kamera 1', 0),
(238, 'Liza A Barezi', '2018-11-09 10:12:35', 'kamera 1', 0),
(239, 'Faza Ghassani', '2018-11-09 10:13:25', 'kamera 1', 0),
(240, 'Firdauz Fanani', '2018-11-09 10:14:07', 'kamera 1', 0),
(241, 'Firdauz Fanani', '2018-11-09 10:15:23', 'kamera 1', 0),
(242, 'Faza Ghassani', '2018-11-09 10:29:11', 'kamera 1', 0),
(243, 'Muhammad Yasir Abdulazis', '2018-11-09 10:44:55', 'kamera 1', 0),
(244, 'Faza Ghassani', '2018-11-09 11:43:35', 'kamera 1', 0),
(245, 'Riyadi Agung Suharto', '2018-11-09 12:33:52', 'kamera 2', 0),
(246, 'Firdauz Fanani', '2018-11-09 12:40:41', 'kamera 1', 0),
(247, 'Firdauz Fanani', '2018-11-09 12:41:17', 'kamera 1', 0),
(248, 'Firdauz Fanani', '2018-11-09 12:59:48', 'kamera 1', 0),
(249, 'Firdauz Fanani', '2018-11-09 13:00:00', 'kamera 1', 0),
(250, 'Firdauz Fanani', '2018-11-09 14:08:21', 'kamera 1', 0),
(251, 'Firdauz Fanani', '2018-11-09 14:09:50', 'kamera 1', 0),
(252, 'Firdauz Fanani', '2018-11-09 14:10:00', 'kamera 1', 0),
(253, 'Faza Ghassani', '2018-11-09 14:11:06', 'kamera 1', 0),
(254, 'Firdauz Fanani', '2018-11-09 14:12:02', 'kamera 1', 0),
(255, 'Firdauz Fanani', '2018-11-09 14:19:50', 'kamera 1', 0),
(256, 'Firdauz Fanani', '2018-11-09 14:20:00', 'kamera 1', 0),
(257, 'Firdauz Fanani', '2018-11-09 14:23:58', 'kamera 1', 0),
(258, 'Firdauz Fanani', '2018-11-09 14:24:00', 'kamera 1', 0),
(259, 'Firdauz Fanani', '2018-11-09 14:28:53', 'kamera 1', 0),
(260, 'Firdauz Fanani', '2018-11-09 14:29:00', 'kamera 1', 0),
(261, 'Imam Sulton', '2018-11-09 14:41:57', 'kamera 1', 0),
(262, 'Firdauz Fanani', '2018-11-09 14:47:32', 'kamera 1', 0),
(263, 'Firdauz Fanani', '2018-11-09 14:50:36', 'kamera 1', 0),
(264, 'Firdauz Fanani', '2018-11-09 14:56:17', 'kamera 1', 0),
(265, 'Firdauz Fanani', '2018-11-09 14:58:03', 'kamera 1', 0),
(266, 'Firdauz Fanani', '2018-11-09 15:01:45', 'kamera 1', 0),
(267, 'Firdauz Fanani', '2018-11-09 15:03:24', 'kamera 1', 0),
(268, 'Muhammad Yasir Abdulazis', '2018-11-09 15:04:01', 'kamera 1', 0),
(269, 'Riyadi Agung Suharto', '2018-11-09 15:04:34', 'kamera 1', 0),
(270, 'Firdauz Fanani', '2018-11-09 15:06:12', 'kamera 1', 0),
(271, 'Firdauz Fanani', '2018-11-09 15:08:28', 'kamera 1', 0),
(272, 'Firdauz Fanani', '2018-11-09 15:13:29', 'kamera 1', 0),
(273, 'Muhammad Yasir Abdulazis', '2018-11-09 15:15:00', 'kamera 1', 0),
(274, 'Firdauz Fanani', '2018-11-09 15:15:07', 'kamera 1', 0),
(275, 'Riyadi Agung Suharto', '2018-11-09 15:16:40', 'kamera 1', 0),
(276, 'Muhammad Yasir Abdulazis', '2018-11-09 15:18:23', 'kamera 1', 0),
(277, 'Firdauz Fanani', '2018-11-09 15:18:37', 'kamera 1', 0),
(278, 'Faza Ghassani', '2018-11-09 15:18:49', 'kamera 1', 0),
(279, 'Firdauz Fanani', '2018-11-09 16:57:23', 'kamera 1', 0),
(280, 'Imam Sulthon', '2018-11-09 17:34:06', 'kamera 2', 0),
(281, 'Muhammad Yasir Abdulazis', '2018-11-09 17:34:10', 'kamera 2', 0),
(282, 'Wahyudi Prasatia', '2018-11-09 17:34:22', 'kamera 2', 0),
(283, 'Abdul Rohman', '2018-11-09 17:38:54', 'kamera 2', 0),
(284, 'Faza Ghassani', '2018-11-09 17:38:55', 'kamera 2', 0),
(285, 'Abdul Rohman', '2018-11-09 17:39:00', 'kamera 2', 0),
(286, 'Faza Ghassani', '2018-11-09 17:39:02', 'kamera 2', 0),
(287, 'Faza Ghassani', '2018-11-09 17:40:00', 'kamera 2', 0),
(288, 'Abdul Rohman', '2018-11-09 17:40:10', 'kamera 2', 0),
(289, 'Abdul Rohman', '2018-11-09 17:41:05', 'kamera 2', 0),
(290, 'Vicky Yuliandi Siahaan', '2018-11-09 17:42:18', 'kamera 2', 0),
(291, 'Riyadi Agung Suharto', '2018-11-09 17:52:42', 'kamera 1', 0),
(292, 'Teoderikus Ferdian', '2018-11-09 17:52:44', 'kamera 1', 0),
(293, 'Teoderikus Ferdian', '2018-11-09 17:53:08', 'kamera 1', 0),
(294, 'Vicky Yuliandi Siahaan', '2018-11-09 18:02:30', 'kamera 1', 0),
(295, 'Liza A Barezi', '2018-11-09 18:03:33', 'kamera 1', 0),
(296, 'Dwi Prasetyo', '2018-11-09 18:07:06', 'kamera 1', 0),
(297, 'Muhammad Reiza Syaifullah', '2018-11-09 18:07:09', 'kamera 1', 0),
(298, 'Firdauz Fanani', '2018-11-09 18:12:22', 'kamera 1', 0),
(299, 'Firdauz Fanani', '2018-11-09 18:16:02', 'kamera 1', 0),
(300, 'Firdauz Fanani', '2018-11-09 18:17:57', 'kamera 1', 0),
(301, 'Firdauz Fanani', '2018-11-09 18:18:00', 'kamera 1', 0),
(302, 'Dwi Prasetyo', '2018-11-09 18:18:22', 'kamera 1', 0),
(303, 'Firdauz Fanani', '2018-11-09 18:20:22', 'kamera 1', 0),
(304, 'Firdauz Fanani', '2018-11-09 18:21:51', 'kamera 1', 0),
(305, 'Firdauz Fanani', '2018-11-09 18:22:02', 'kamera 1', 0),
(306, 'Firdauz Fanani', '2018-11-09 18:23:40', 'kamera 1', 0),
(307, 'Firdauz Fanani', '2018-11-09 18:24:11', 'kamera 1', 0),
(308, 'Firdauz Fanani', '2018-11-09 18:26:08', 'kamera 1', 0),
(309, 'Firdauz Fanani', '2018-11-09 18:28:37', 'kamera 1', 0),
(310, 'Firdauz Fanani', '2018-11-12 06:40:05', 'kamera 1', 0),
(311, 'Firdauz Fanani', '2018-11-12 06:49:36', 'kamera 1', 0),
(312, 'Firdauz Fanani', '2018-11-12 06:54:38', 'kamera 1', 0),
(313, 'Firdauz Fanani', '2018-11-12 06:59:08', 'kamera 1', 0),
(314, 'Firdauz Fanani', '2018-11-12 07:01:19', 'kamera 1', 0),
(315, 'Abdul Rohman', '2018-11-12 07:01:30', 'kamera 1', 0),
(316, 'Faza Ghassani', '2018-11-12 08:26:06', 'kamera 1', 0),
(317, 'Wahyudi Prasatia', '2018-11-12 08:26:42', 'kamera 1', 0),
(318, 'Teoderikus Ferdian', '2018-11-12 08:27:05', 'kamera 1', 0),
(319, 'Imam Sulthon', '2018-11-12 08:28:01', 'kamera 1', 0),
(320, 'Muhammad Reiza Syaifullah', '2018-11-12 08:31:09', 'kamera 1', 0),
(321, 'Vicky Yuliandi Siahaan', '2018-11-12 08:32:23', 'kamera 1', 0),
(322, 'Vicky Yuliandi Siahaan', '2018-11-12 08:33:16', 'kamera 1', 0),
(323, 'Liza A Barezi', '2018-11-12 08:33:45', 'kamera 1', 0),
(324, 'Firdauz Fanani', '2018-11-12 08:33:50', 'kamera 1', 0),
(325, 'Liza A Barezi', '2018-11-12 08:34:00', 'kamera 1', 0),
(326, 'Dwi Prasetyo', '2018-11-12 08:39:04', 'kamera 1', 0),
(327, 'Faza Ghassani', '2018-11-12 08:39:41', 'kamera 1', 0),
(328, 'Muhammad Yasir Abdulazis', '2018-11-12 08:43:34', 'kamera 1', 0),
(329, 'Faza Ghassani', '2018-11-12 08:43:44', 'kamera 1', 0),
(330, 'Imam Sulthon', '2018-11-12 08:44:31', 'kamera 1', 0),
(331, 'Wahyudi Prasatia', '2018-11-12 11:34:32', 'kamera 1', 0),
(332, 'Teoderikus Ferdian', '2018-11-12 12:02:20', 'kamera 3', 0),
(333, 'Muhammad Yasir Abdulazis', '2018-11-12 12:02:44', 'kamera 3', 0),
(334, 'Firdauz Fanani', '2018-11-12 12:05:36', 'kamera 3', 0),
(335, 'Teoderikus Ferdian', '2018-11-12 12:07:40', 'kamera 3', 0),
(336, 'Abdul Rohman', '2018-11-12 12:08:09', 'kamera 3', 0),
(337, 'Riyadi Agung Suharto', '2018-11-12 12:41:38', 'kamera 1', 0),
(338, 'Abdul Rohman', '2018-11-12 12:48:50', 'kamera 1', 0),
(339, 'Liza A Barezi', '2018-11-12 12:52:30', 'kamera 1', 0),
(340, 'Riyadi Agung Suharto', '2018-11-12 12:59:04', 'kamera 1', 0),
(341, 'Firdauz Fanani', '2018-11-12 13:09:45', 'kamera 3', 0),
(342, 'Firdauz Fanani', '2018-11-12 13:10:15', 'kamera 3', 0),
(343, 'Faza Ghassani', '2018-11-12 13:18:18', 'kamera 3', 0),
(344, 'Teoderikus Ferdian', '2018-11-12 13:49:41', 'kamera 1', 0),
(345, 'Riyadi Agung Suharto', '2018-11-12 14:02:49', 'kamera 1', 0),
(346, 'Muhammad Yasir Abdulazis', '2018-11-12 17:41:08', 'kamera 1', 0),
(347, 'Wahyudi Prasatia', '2018-11-12 17:49:32', 'kamera 1', 0),
(348, 'Firdauz Fanani', '2018-11-12 18:02:46', 'kamera 1', 0),
(349, 'Firdauz Fanani', '2018-11-12 18:03:02', 'kamera 1', 0),
(350, 'Teoderikus Ferdian', '2018-11-12 18:04:06', 'kamera 1', 0),
(351, 'Imam Sulthon', '2018-11-12 18:09:10', 'kamera 1', 0),
(352, 'Liza A Barezi', '2018-11-12 18:09:26', 'kamera 1', 0),
(353, 'Abdul Rohman', '2018-11-12 18:10:25', 'kamera 1', 0),
(354, 'Vicky Yuliandi Siahaan', '2018-11-12 18:10:32', 'kamera 1', 0),
(355, 'Muhammad Reiza Syaifullah', '2018-11-12 18:17:01', 'kamera 1', 0),
(356, 'Dwi Prasetyo', '2018-11-12 18:17:04', 'kamera 1', 0),
(357, 'Abdul Rohman', '2018-11-12 18:21:39', 'kamera 1', 0),
(358, 'Abdul Rohman', '2018-11-12 18:37:17', 'kamera 1', 0),
(359, 'Firdauz Fanani', '2018-11-13 06:31:55', 'kamera 1', 0),
(360, 'Muhammad Reiza Syaifullah', '2018-11-13 06:32:00', 'kamera 1', 0),
(361, 'Abdul Rohman', '2018-11-13 06:53:08', 'kamera 1', 0),
(362, 'Liza A Barezi', '2018-11-13 08:14:23', 'kamera 1', 0),
(363, 'Teoderikus Ferdian', '2018-11-13 08:15:37', 'kamera 1', 0),
(364, 'Wahyudi Prasatia', '2018-11-13 08:15:37', 'kamera 1', 0),
(365, 'Imam Sulthon', '2018-11-13 08:21:17', 'kamera 1', 0),
(366, 'Faza Ghassani', '2018-11-13 08:26:39', 'kamera 1', 0),
(367, 'Muhammad Yasir Abdulazis', '2018-11-13 08:27:04', 'kamera 1', 0),
(368, 'Dwi Prasetyo', '2018-11-13 08:31:09', 'kamera 1', 0),
(369, 'Teoderikus Ferdian', '2018-11-13 08:31:11', 'kamera 1', 0),
(370, 'Firdauz Fanani', '2018-11-13 09:40:26', 'kamera 1', 0),
(371, 'Muhammad Yasir Abdulazis', '2018-11-13 09:43:24', 'kamera 1', 0),
(372, 'Muhammad Yasir Abdulazis', '2018-11-13 17:45:27', 'kamera 1', 0),
(373, 'Firdauz Fanani', '2018-11-13 17:49:09', 'kamera 1', 0),
(374, 'Teoderikus Ferdian', '2018-11-13 17:51:06', 'kamera 1', 0),
(375, 'Wahyudi Prasatia', '2018-11-13 17:51:35', 'kamera 1', 0),
(376, 'Liza A Barezi', '2018-11-13 17:54:50', 'kamera 1', 0),
(377, 'Liza A Barezi', '2018-11-13 17:55:00', 'kamera 1', 0),
(378, 'Faza Ghassani', '2018-11-13 17:55:09', 'kamera 1', 0),
(379, 'Imam Sulthon', '2018-11-13 17:55:36', 'kamera 1', 0),
(380, 'Dwi Prasetyo', '2018-11-13 18:03:58', 'kamera 1', 0),
(381, 'Dwi Prasetyo', '2018-11-13 18:04:02', 'kamera 1', 0),
(382, 'Abdul Rohman', '2018-11-13 18:13:48', 'kamera 1', 0),
(383, 'Muhammad Reiza Syaifullah', '2018-11-13 18:23:08', 'kamera 1', 0),
(384, 'Muhammad Yasir Abdulazis', '2018-11-13 18:47:50', 'kamera 1', 0),
(385, 'Dwi Prasetyo', '2018-11-13 19:00:20', 'kamera 1', 0),
(386, 'Firdauz Fanani', '2018-11-14 06:26:05', 'kamera 1', 0),
(387, 'Muhammad Reiza Syaifullah', '2018-11-14 06:26:50', 'kamera 1', 0),
(388, 'Imam Sulthon', '2018-11-14 08:17:52', 'kamera 1', 0),
(389, 'Imam Sulthon', '2018-11-14 08:18:04', 'kamera 1', 0),
(390, 'Muhammad Yasir Abdulazis', '2018-11-14 08:18:53', 'kamera 1', 0),
(391, 'Abdul Rohman', '2018-11-14 08:19:13', 'kamera 1', 0),
(392, 'Liza A Barezi', '2018-11-14 08:25:24', 'kamera 1', 0),
(393, 'Faza Ghassani', '2018-11-14 08:25:34', 'kamera 1', 0),
(394, 'Teoderikus Ferdian', '2018-11-14 08:25:59', 'kamera 1', 0),
(395, 'Teoderikus Ferdian', '2018-11-14 08:26:00', 'kamera 1', 0),
(396, 'Muhammad Yasir Abdulazis', '2018-11-14 08:32:34', 'kamera 1', 0),
(397, 'Muhammad Yasir Abdulazis', '2018-11-14 08:33:17', 'kamera 1', 0),
(398, 'Muhammad Yasir Abdulazis', '2018-11-14 08:34:32', 'kamera 1', 0),
(399, 'Dwi Prasetyo', '2018-11-14 08:35:21', 'kamera 1', 0);

-- --------------------------------------------------------

--
-- Table structure for table `ijin_absensi`
--

CREATE TABLE `ijin_absensi` (
  `id` bigint(20) NOT NULL,
  `nama_pegawai` varchar(30) NOT NULL,
  `ijin` varchar(30) NOT NULL,
  `alasan_ijin` longtext NOT NULL,
  `tanggal_ijin` date NOT NULL,
  `waktu_buat_ijin` datetime NOT NULL,
  `atasan` varchar(30) NOT NULL,
  `app` varchar(30) DEFAULT NULL,
  `app_by` varchar(30) DEFAULT NULL,
  `alasan_app_dpp` longtext
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
-- Indexes for table `ijin_absensi`
--
ALTER TABLE `ijin_absensi`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `face_absensi`
--
ALTER TABLE `face_absensi`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=109;
--
-- AUTO_INCREMENT for table `face_keamanan`
--
ALTER TABLE `face_keamanan`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=400;
--
-- AUTO_INCREMENT for table `ijin_absensi`
--
ALTER TABLE `ijin_absensi`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

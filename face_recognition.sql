-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 08, 2018 at 03:23 PM
-- Server version: 5.7.24-0ubuntu0.18.04.1
-- PHP Version: 7.2.10-0ubuntu0.18.04.1

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
  `warning1` varchar(50) DEFAULT NULL,
  `warning2` varchar(50) DEFAULT NULL,
  `warning3` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`id`, `id_pegawai`, `id_telegram`, `nama_pegawai`, `email`, `no_hp`, `divisi`, `warning1`, `warning2`, `warning3`) VALUES
(1, 12345, 205017793, 'Firdauz Fanani', 'firdauzfanani@gmail.com', '081567920578', 'IT', 'Surat Peringatan 1', 'Coaching By HRD', 'Penalty Sesuai Kesepakatan'),
(2, 12346, 668662889, 'Riyadi Agung Suharto', '0', '0817737727', 'IT', 'Surat Peringatan 1', NULL, NULL),
(3, 12347, 750150427, 'Teoderikus Ferdian', '0', '087839659675', 'Marketing', NULL, NULL, NULL),
(4, 12348, 376571445, 'Wahyudi Prasatia', '0', '085363236007', 'Marketing', NULL, NULL, NULL),
(5, 12349, 692286966, 'Muhammad Reiza Syaifullah', 'firdauz.fanani@mail.ugm.ac.id', '085274521796', 'HRD', NULL, NULL, NULL),
(6, 12340, 644107942, 'Liza A Barezi', 'lizabarezi@gspe.co.id', '085725180999', 'HRD', NULL, NULL, NULL),
(7, 12341, 764143199, 'Vicky Yuliandi Siahaan', '0', '08128552527', 'IT', NULL, NULL, NULL),
(8, 12342, 723606683, 'Faza Ghassani', '0', '089676824961', 'Produksi', NULL, NULL, NULL),
(9, 12343, 252488349, 'Muhammad Yasir Abdulazis', '0', '081703078960', 'Procurement', 'Surat Peringatan 1', 'Coaching By HRD', NULL),
(10, 12350, 757158209, 'Dwi Prasetyo', '0', '085224666426', 'Procurement', NULL, NULL, NULL),
(11, 12351, 670747420, 'Imam Sulton', '0', '081917558038', 'Security', NULL, NULL, NULL),
(12, 12354, 788061070, 'Abdul Rohman', '0', '085795735556', 'Resepsionis', NULL, NULL, NULL),
(13, 12356, 205017793, 'Gusli Arifin', 'gusli@gspe.com', '0851251235', 'Teknisi', NULL, NULL, NULL),
(14, 1235123, 205017793, 'Aneria', 'tes@gmail.com', '0751235123', 'tes', NULL, NULL, NULL);

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
(10, 12340, 'Liza A Barezi', '2018-10-31 08:32:00', '2018-11-02 17:36:36', 0, 'kamera 1', 'Terlambat', 'OUT', 1, 0),
(11, 12351, 'Imam Sulton', '2018-10-31 08:33:15', '2018-10-31 18:05:42', 0, 'kamera 1', 'Terlambat', 'OUT', 1, 0),
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
(23, 12351, 'Imam Sulton', '2018-11-01 08:29:53', '2018-11-02 17:37:00', 0, 'kamera 1', 'Tepat Waktu', 'OUT', 0, 0),
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
(37, 12351, 'Imam Sulton', '2018-11-05 08:25:24', '2018-11-05 17:31:54', 0, 'kamera 1', 'Tepat Waktu', 'OUT', 0, 0),
(38, 12350, 'Dwi Prasetyo', '2018-11-05 08:26:36', '2018-11-05 17:31:54', 0, 'kamera 1', 'Tepat Waktu', 'OUT', 0, 0),
(39, 12354, 'Abdul Rohman', '2018-11-05 08:26:45', '2018-11-05 17:31:54', 0, 'kamera 1', 'Tepat Waktu', 'OUT', 0, 0),
(40, 12345, 'Firdauz Fanani', '2018-11-05 08:26:45', '2018-11-06 17:48:01', 0, 'kamera 1', 'Tepat Waktu', 'OUT', 0, 0),
(41, 12342, 'Faza Ghassani', '2018-11-05 08:06:02', '2018-11-06 17:58:41', 0, 'kamera 1', 'Tepat Waktu', 'OUT', 0, 0),
(42, 12346, 'Riyadi Agung Suharto', '2018-11-05 08:23:18', '2018-11-05 18:17:45', 0, 'kamera 1', 'Tepat Waktu', 'OUT', 0, 0),
(43, 12341, 'Vicky Yuliandi Siahaan', '2018-11-05 08:23:18', '2018-11-05 17:31:54', 0, 'kamera 1', 'Tepat Waktu', 'OUT', 0, 0),
(44, 12354, 'Abdul Rohman', '2018-11-06 06:55:00', '2018-11-05 17:31:54', 0, 'kamera 1', 'Tepat Waktu', 'OUT', 0, 0),
(45, 12345, 'Firdauz Fanani', '2018-11-06 07:03:41', '2018-11-06 17:48:01', 0, 'kamera 1', 'Tepat Waktu', 'OUT', 0, 0),
(46, 12346, 'Riyadi Agung Suharto', '2018-11-06 07:08:46', '2018-11-05 17:31:54', 0, 'kamera 1', 'Tepat Waktu', 'OUT', 0, 0),
(47, 12350, 'Dwi Prasetyo', '2018-11-06 07:31:33', '2018-11-05 17:31:54', 0, 'kamera 1', 'Tepat Waktu', 'OUT', 0, 0),
(48, 12347, 'Teoderikus Ferdian', '2018-11-06 07:31:59', '2018-11-05 17:31:54', 0, 'kamera 1', 'Tepat Waktu', 'OUT', 0, 0),
(49, 12343, 'Muhammad Yasir Abdulazis', '2018-11-06 08:16:04', '2018-11-06 19:11:33', 0, 'kamera 1', 'Tepat Waktu', 'OUT', 0, 0),
(50, 12341, 'Vicky Yuliandi Siahaan', '2018-11-06 08:19:34', '2018-11-05 17:31:54', 0, 'kamera 1', 'Tepat Waktu', 'OUT', 0, 0),
(51, 12342, 'Faza Ghassani', '2018-11-06 08:24:07', '2018-11-06 17:58:41', 0, 'kamera 1', 'Tepat Waktu', 'OUT', 0, 0),
(52, 12340, 'Liza A Barezi', '2018-11-01 08:13:10', '2018-11-06 17:58:41', 0, 'kamera 1', 'Tepat Waktu', 'OUT', 0, 0),
(53, 12351, 'Imam Sulton', '2018-11-06 08:29:15', '2018-11-06 17:58:41', 0, 'kamera 1', 'Tepat Waktu', 'OUT', 0, 0);

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
(161, 'Firdauz Fanani', '2018-11-08 15:22:00', 'kamera 1', 0);

--
-- Indexes for dumped tables
--

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
-- AUTO_INCREMENT for table `face_absensi`
--
ALTER TABLE `face_absensi`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=92;
--
-- AUTO_INCREMENT for table `face_keamanan`
--
ALTER TABLE `face_keamanan`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=162;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Oct 31, 2018 at 05:33 AM
-- Server version: 10.1.36-MariaDB
-- PHP Version: 7.2.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
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
  `divisi` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`id`, `id_pegawai`, `id_telegram`, `nama_pegawai`, `email`, `divisi`) VALUES
(1, 12345, 205017793, 'Firdauz Fanani', 'firdauzfanani@gmail.com', 'IT'),
(2, 12346, 668662889, 'Riyadi Agung Suharto', '0', 'IT'),
(3, 12347, 750150427, 'Teoderikus Ferdian', '0', 'Marketing'),
(4, 12348, 376571445, 'Wahyudi Prasatia', '0', 'Marketing'),
(5, 12349, 692286966, 'Muhammad Reiza Syaifullah', 'firdauz.fanani@mail.ugm.ac.id', 'HRD'),
(6, 12340, 644107942, 'Liza A Barezi', 'lizabarezi@gspe.co.id', 'HRD'),
(7, 12341, 764143199, 'Vicky Yuliandi Siahaan', '0', 'Produksi'),
(8, 12342, 723606683, 'Faza Ghassani', '0', 'Produksi'),
(9, 12343, 252488349, 'Muhammad Yasir Abdulazis', '0', 'Procurement'),
(10, 12350, 757158209, 'Dwi Prasetyo', '0', 'Procurement'),
(11, 12351, 670747420, 'Imam Sulton', '0', 'Security'),
(12, 12354, 788061070, 'Abdul Rohman', '0', 'Resepsionis');

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
  `kamera` varchar(30) NOT NULL,
  `note` varchar(30) DEFAULT NULL,
  `state` varchar(30) NOT NULL,
  `aktif_terlambat` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `face_absensi`
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
(10, 12349, 'Muhammad Reiza Syaifullah', '2018-10-31 08:30:35', NULL, 'kamera 1', 'Terlambat', 'IN', 1),
(11, 12340, 'Liza A Barezi', '2018-10-31 08:32:00', NULL, 'kamera 1', 'Terlambat', 'IN', 1),
(12, 12351, 'Imam Sulton', '2018-10-31 08:33:15', NULL, 'kamera 1', 'Terlambat', 'IN', 1),
(13, 12346, 'Riyadi Agung Suharto', '2018-10-31 11:24:36', NULL, 'kamera 1', 'Terlambat', 'IN', 1);

-- --------------------------------------------------------

--
-- Table structure for table `face_keamanan`
--

CREATE TABLE `face_keamanan` (
  `id` bigint(20) NOT NULL,
  `nama` varchar(30) NOT NULL,
  `waktu` datetime NOT NULL,
  `kamera` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `face_keamanan`
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
(24, 'Abdul Rohman', '2018-10-31 11:24:56', 'kamera 1');

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
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `face_keamanan`
--
ALTER TABLE `face_keamanan`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

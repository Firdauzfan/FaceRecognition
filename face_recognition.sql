-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: 29 Okt 2018 pada 13.16
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
  `divisi` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `employee`
--

INSERT INTO `employee` (`id`, `id_pegawai`, `id_telegram`, `nama_pegawai`, `email`, `divisi`) VALUES
(1, 12345, 205017793, 'Firdauz Fanani', 'firdauzfanani@gmail.com', 'IT'),
(2, 12346, 668662889, 'Riyadi Agung Suharto', '0', 'IT'),
(3, 12347, 750150427, 'Teoderikus Ferdian', '0', 'Marketing'),
(4, 12348, 376571445, 'Wahyudi Prasatia', '0', 'Marketing'),
(5, 12349, 692286966, 'Muhammad Reiza Syaifullah', 'firdauz.fanani@mail.ugm.ac.id', 'HRD'),
(6, 12340, 764143199, 'Liza A Barezi', 'lizabarezi@gspe.co.id', 'HRD'),
(7, 12341, 764143199, 'Vicky Yuliandi Siahaan', '0', 'Produksi'),
(8, 12342, 723606683, 'Faza Ghassani', '0', 'Produksi'),
(9, 12343, 252488349, 'Muhammad Yasir Abdulazis', '0', 'Procurement'),
(10, 12350, 757158209, 'Dwi Prasetyo', '0', 'Procurement'),
(11, 12351, 670747420, 'Imam Sulton', '0', 'Security'),
(12, 12354, 788061070, 'Abdul Rohman', '0', 'Resepsionis');

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
  `state` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `face_keamanan`
--
ALTER TABLE `face_keamanan`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: May 18, 2019 at 04:09 PM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 7.3.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tugas5pbkk`
--

-- --------------------------------------------------------

--
-- Table structure for table `absensi`
--

CREATE TABLE `absensi` (
  `id` int(11) NOT NULL,
  `tanggal_waktu` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `pertemuan` int(11) NOT NULL,
  `mahasiswa_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `absensi`
--

INSERT INTO `absensi` (`id`, `tanggal_waktu`, `pertemuan`, `mahasiswa_id`) VALUES
(2, '2019-05-12 17:30:42', 1, 7),
(3, '2019-05-12 17:33:34', 1, 8),
(4, '2019-05-12 17:33:47', 2, 8),
(5, '2019-05-12 17:33:49', 3, 8),
(6, '2019-05-12 17:33:52', 4, 8),
(7, '2019-05-12 17:33:54', 5, 8),
(8, '2019-05-12 17:33:57', 6, 8),
(9, '2019-05-12 17:34:03', 3, 7),
(10, '2019-05-12 17:34:05', 5, 7);

-- --------------------------------------------------------

--
-- Table structure for table `mahasiswa`
--

CREATE TABLE `mahasiswa` (
  `id` int(11) NOT NULL,
  `nrp` varchar(30) NOT NULL,
  `nama` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `matakuliah_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mahasiswa`
--

INSERT INTO `mahasiswa` (`id`, `nrp`, `nama`, `password`, `matakuliah_id`) VALUES
(7, '164', 'hilmi', 'hilmi', 11),
(8, '057', 'naufalpf', 'naufalpf', 13),
(9, '050', 'akram', 'akram', 13),
(10, '058', 'test', 'test', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `matakuliah`
--

CREATE TABLE `matakuliah` (
  `id` int(11) NOT NULL,
  `nama` varchar(30) NOT NULL,
  `jumlah_pertemuan` int(11) NOT NULL,
  `semester` varchar(30) NOT NULL,
  `kelas` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `matakuliah`
--

INSERT INTO `matakuliah` (`id`, `nama`, `jumlah_pertemuan`, `semester`, `kelas`) VALUES
(11, 'PBKK', 16, '6', 'G'),
(12, 'PBKK', 16, '6', 'H'),
(13, 'IMK', 16, '6', 'H'),
(14, 'bdt', 16, '6', 'H');

-- --------------------------------------------------------

--
-- Table structure for table `pertemuan_matakuliah`
--

CREATE TABLE `pertemuan_matakuliah` (
  `id` int(11) NOT NULL,
  `pertemuan` int(11) NOT NULL,
  `jam_mulai` time NOT NULL,
  `jam_selesai` time NOT NULL,
  `ruangan` varchar(30) NOT NULL,
  `matakuliah_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pertemuan_matakuliah`
--

INSERT INTO `pertemuan_matakuliah` (`id`, `pertemuan`, `jam_mulai`, `jam_selesai`, `ruangan`, `matakuliah_id`) VALUES
(2, 1, '09:30:00', '12:30:00', '105a', 11),
(3, 1, '12:30:00', '15:00:00', '105a', 12),
(4, 1, '12:30:00', '15:00:00', '105a', 13),
(5, 1, '12:30:00', '15:00:00', '105a', 14),
(6, 2, '12:30:00', '15:00:00', '105a', 14),
(7, 3, '12:30:00', '15:00:00', '105a', 14),
(8, 4, '12:30:00', '15:00:00', '105a', 14);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `absensi`
--
ALTER TABLE `absensi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mahasiswa_id` (`mahasiswa_id`);

--
-- Indexes for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD PRIMARY KEY (`id`),
  ADD KEY `matakuliah_id` (`matakuliah_id`);

--
-- Indexes for table `matakuliah`
--
ALTER TABLE `matakuliah`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pertemuan_matakuliah`
--
ALTER TABLE `pertemuan_matakuliah`
  ADD PRIMARY KEY (`id`),
  ADD KEY `matakuliah_id` (`matakuliah_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `absensi`
--
ALTER TABLE `absensi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `matakuliah`
--
ALTER TABLE `matakuliah`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `pertemuan_matakuliah`
--
ALTER TABLE `pertemuan_matakuliah`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `absensi`
--
ALTER TABLE `absensi`
  ADD CONSTRAINT `absensi_ibfk_1` FOREIGN KEY (`mahasiswa_id`) REFERENCES `mahasiswa` (`id`),
  ADD CONSTRAINT `absensi_ibfk_2` FOREIGN KEY (`mahasiswa_id`) REFERENCES `mahasiswa` (`id`);

--
-- Constraints for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD CONSTRAINT `mahasiswa_ibfk_1` FOREIGN KEY (`matakuliah_id`) REFERENCES `matakuliah` (`id`),
  ADD CONSTRAINT `mahasiswa_ibfk_2` FOREIGN KEY (`matakuliah_id`) REFERENCES `matakuliah` (`id`);

--
-- Constraints for table `pertemuan_matakuliah`
--
ALTER TABLE `pertemuan_matakuliah`
  ADD CONSTRAINT `pertemuan_matakuliah_ibfk_1` FOREIGN KEY (`matakuliah_id`) REFERENCES `matakuliah` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

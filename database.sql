-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: db
-- Generation Time: Dec 19, 2024 at 07:21 AM
-- Server version: 8.3.0
-- PHP Version: 8.2.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `peminjaman_buku`
--

-- --------------------------------------------------------

--
-- Table structure for table `buku`
--

CREATE TABLE `buku` (
  `id_buku` int NOT NULL,
  `judul_buku` varchar(100) NOT NULL,
  `jenis_buku` varchar(100) NOT NULL,
  `tahun_terbit` year NOT NULL,
  `pengarang` varchar(100) NOT NULL,
  `penerbit` varchar(100) NOT NULL
) ENGINE=InnoDB;

--
-- Dumping data for table `buku`
--

INSERT INTO `buku` (`id_buku`, `judul_buku`, `jenis_buku`, `tahun_terbit`, `pengarang`, `penerbit`) VALUES
(1, 'Clean Code', 'Pemrograman', '2008', 'Robert C. Martin', 'Prentice Hall'),
(2, 'A Brief History of Humankind', 'Sejarah', '2011', 'Yuval Noah Harari', 'Harper'),
(3, 'The Pragmatic Programmer', 'Pemrograman', '1999', 'Andrew Hunt dan David Thomas', 'Addison-Wesley'),
(4, 'The Great Gatsby', 'Sastra', '1925', 'F. Scott Fitzgerald', "Charles Scribner\'s Sons"),
(5, 'Atomic Habits', 'Pengembangan Diri', '2018', 'James CLear', 'Avery');

-- --------------------------------------------------------

--
-- Table structure for table `kunjungan`
--

CREATE TABLE `kunjungan` (
  `id_kunjungan` int NOT NULL,
  `tanggal_kunjungan` date NOT NULL,
  `id_siswa` int NOT NULL,
  `jam_kunjungan` time NOT NULL,
  `id_petugas` int NOT NULL,
  `keterangan` varchar(255) DEFAULT NULL
) ENGINE=InnoDB;

--
-- Dumping data for table `kunjungan`
--

INSERT INTO `kunjungan` (`id_kunjungan`, `tanggal_kunjungan`, `id_siswa`, `jam_kunjungan`, `id_petugas`, `keterangan`) VALUES
(1, '2024-12-18', 2, '14:15:08', 1, NULL),
(2, '2024-12-20', 1, '21:15:08', 4, 'Terpisah Dari Rombongan'),
(3, '2024-12-19', 2, '15:16:09', 4, NULL),
(4, '2024-12-11', 4, '14:58:09', 4, NULL),
(5, '2024-12-11', 2, '14:15:08', 4, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `peminjaman`
--

CREATE TABLE `peminjaman` (
  `id_pinjam` int NOT NULL,
  `tanggal_pinjam` date NOT NULL,
  `id_buku` int NOT NULL,
  `id_petugas` int NOT NULL,
  `id_kunjungan` int NOT NULL,
  `id_siswa` int NOT NULL
) ENGINE=InnoDB;

--
-- Dumping data for table `peminjaman`
--

INSERT INTO `peminjaman` (`id_pinjam`, `tanggal_pinjam`, `id_buku`, `id_petugas`, `id_kunjungan`, `id_siswa`) VALUES
(1, '2024-12-19', 1, 1, 3, 2),
(2, '2024-12-17', 5, 5, 4, 3),
(3, '2024-12-17', 1, 5, 3, 2),
(4, '2024-12-06', 5, 4, 2, 2),
(5, '2024-12-18', 4, 5, 3, 2);

-- --------------------------------------------------------

--
-- Table structure for table `pengembalian`
--

CREATE TABLE `pengembalian` (
  `id_pengembalian` int NOT NULL,
  `id_pinjam` int NOT NULL,
  `id_siswa` int NOT NULL,
  `tanggal_kembali` date NOT NULL,
  `id_buku` int NOT NULL,
  `id_petugas` int NOT NULL
) ENGINE=InnoDB;

--
-- Dumping data for table `pengembalian`
--

INSERT INTO `pengembalian` (`id_pengembalian`, `id_pinjam`, `id_siswa`, `tanggal_kembali`, `id_buku`, `id_petugas`) VALUES
(1, 1, 2, '2025-01-03', 4, 4),
(2, 1, 1, '2025-01-03', 1, 3),
(3, 2, 5, '2025-01-24', 4, 5),
(4, 2, 1, '2025-01-22', 3, 2),
(5, 4, 5, '2025-01-09', 5, 1),
(6, 1, 1, '2025-01-10', 4, 5);

-- --------------------------------------------------------

--
-- Table structure for table `petugas`
--

CREATE TABLE `petugas` (
  `id_petugas` int NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `nama_petugas` varchar(100) NOT NULL,
  `nik` char(16) NOT NULL,
  `no_telepon` varchar(25) NOT NULL,
  `alamat` text NOT NULL
) ENGINE=InnoDB;

--
-- Dumping data for table `petugas`
--

INSERT INTO `petugas` (`id_petugas`, `username`, `password`, `nama_petugas`, `nik`, `no_telepon`, `alamat`) VALUES
(1, 'Alfian', '$2y$10$4dy1jP.TVmtzGQuP6Zr6j.lsE4dCw48VbhFhKamSZFRFkd/E13in6', 'Alfian Gading Saputra', '11111111111111', '0895363116378', 'JL Alfian, Banguntapan, Bantul'),
(2, 'Rasyid', '$2y$10$4dy1jP.TVmtzGQuP6Zr6j.lsE4dCw48VbhFhKamSZFRFkd/E13in6', 'Rasyid Prayogo', '2222222222222222', '0895123456789', 'JL Rasyid, Banguntapan, Bantul'),
(3, 'Rangga', '$2y$10$4dy1jP.TVmtzGQuP6Zr6j.lsE4dCw48VbhFhKamSZFRFkd/E13in6', 'Rangga Eka Pramana', '3333333333333333', '027512345678', 'JL Rangga, Sleman'),
(4, 'Arfan', '$2y$10$4dy1jP.TVmtzGQuP6Zr6j.lsE4dCw48VbhFhKamSZFRFkd/E13in6', 'Arfan Pria Pamungkas', '4444444444444444', '098767836573', 'JL Arfan, Pleret, Bantul'),
(5, 'Kunaka', '$2y$10$4dy1jP.TVmtzGQuP6Zr6j.lsE4dCw48VbhFhKamSZFRFkd/E13in6', 'Ariyel Kunaka Gustama', '5555555555555555', '089564837563', 'JL Kunaka, Imogiri, Bantul');

-- --------------------------------------------------------

--
-- Table structure for table `siswa`
--

CREATE TABLE `siswa` (
  `id_siswa` int NOT NULL,
  `nama_siswa` varchar(100) NOT NULL,
  `jenis_kelamin` enum('L','P') NOT NULL,
  `alamat` text NOT NULL,
  `id_petugas` int NOT NULL
) ENGINE=InnoDB;

--
-- Dumping data for table `siswa`
--

INSERT INTO `siswa` (`id_siswa`, `nama_siswa`, `jenis_kelamin`, `alamat`, `id_petugas`) VALUES
(1, 'Dery Wahyu Perdana', 'L', 'Jl Dery, Lampung', 1),
(2, 'Alfin Mardani', 'L', 'Jl Alfin, Solo, Jawa Tengah', 2),
(3, 'Farhan Habibi', 'L', 'JL Farhan, Medan, Sumatera Utara', 3),
(4, 'Rizqhul Dwi Rugani', 'L', 'JL Rizqhul, Papua Barat', 1),
(5, 'Dimas Prabowo', 'L', 'JL Dimas, Padang, Sumatera Barat', 3);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `buku`
--
ALTER TABLE `buku`
  ADD PRIMARY KEY (`id_buku`);

--
-- Indexes for table `kunjungan`
--
ALTER TABLE `kunjungan`
  ADD PRIMARY KEY (`id_kunjungan`),
  ADD KEY `id_siswa` (`id_siswa`,`id_petugas`),
  ADD KEY `id_petugas` (`id_petugas`);

--
-- Indexes for table `peminjaman`
--
ALTER TABLE `peminjaman`
  ADD PRIMARY KEY (`id_pinjam`),
  ADD KEY `id_buku` (`id_buku`,`id_petugas`,`id_kunjungan`,`id_siswa`),
  ADD KEY `id_petugas` (`id_petugas`),
  ADD KEY `id_siswa` (`id_siswa`),
  ADD KEY `id_kunjungan` (`id_kunjungan`);

--
-- Indexes for table `pengembalian`
--
ALTER TABLE `pengembalian`
  ADD PRIMARY KEY (`id_pengembalian`),
  ADD KEY `id_pinjam` (`id_pinjam`,`id_siswa`,`id_buku`,`id_petugas`),
  ADD KEY `id_buku` (`id_buku`),
  ADD KEY `id_petugas` (`id_petugas`),
  ADD KEY `id_siswa` (`id_siswa`);

--
-- Indexes for table `petugas`
--
ALTER TABLE `petugas`
  ADD PRIMARY KEY (`id_petugas`);

--
-- Indexes for table `siswa`
--
ALTER TABLE `siswa`
  ADD PRIMARY KEY (`id_siswa`),
  ADD KEY `id_petugas` (`id_petugas`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `buku`
--
ALTER TABLE `buku`
  MODIFY `id_buku` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `kunjungan`
--
ALTER TABLE `kunjungan`
  MODIFY `id_kunjungan` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `peminjaman`
--
ALTER TABLE `peminjaman`
  MODIFY `id_pinjam` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `pengembalian`
--
ALTER TABLE `pengembalian`
  MODIFY `id_pengembalian` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `petugas`
--
ALTER TABLE `petugas`
  MODIFY `id_petugas` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `siswa`
--
ALTER TABLE `siswa`
  MODIFY `id_siswa` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `kunjungan`
--
ALTER TABLE `kunjungan`
  ADD CONSTRAINT `kunjungan_ibfk_1` FOREIGN KEY (`id_siswa`) REFERENCES `siswa` (`id_siswa`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `kunjungan_ibfk_2` FOREIGN KEY (`id_petugas`) REFERENCES `petugas` (`id_petugas`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `peminjaman`
--
ALTER TABLE `peminjaman`
  ADD CONSTRAINT `peminjaman_ibfk_1` FOREIGN KEY (`id_buku`) REFERENCES `buku` (`id_buku`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `peminjaman_ibfk_2` FOREIGN KEY (`id_petugas`) REFERENCES `petugas` (`id_petugas`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `peminjaman_ibfk_3` FOREIGN KEY (`id_siswa`) REFERENCES `siswa` (`id_siswa`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `peminjaman_ibfk_4` FOREIGN KEY (`id_kunjungan`) REFERENCES `kunjungan` (`id_kunjungan`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `pengembalian`
--
ALTER TABLE `pengembalian`
  ADD CONSTRAINT `pengembalian_ibfk_1` FOREIGN KEY (`id_buku`) REFERENCES `buku` (`id_buku`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pengembalian_ibfk_2` FOREIGN KEY (`id_petugas`) REFERENCES `petugas` (`id_petugas`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pengembalian_ibfk_3` FOREIGN KEY (`id_siswa`) REFERENCES `siswa` (`id_siswa`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pengembalian_ibfk_4` FOREIGN KEY (`id_pinjam`) REFERENCES `peminjaman` (`id_pinjam`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `siswa`
--
ALTER TABLE `siswa`
  ADD CONSTRAINT `siswa_ibfk_1` FOREIGN KEY (`id_petugas`) REFERENCES `petugas` (`id_petugas`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

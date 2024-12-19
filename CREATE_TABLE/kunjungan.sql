CREATE TABLE `kunjungan` (
  `id_kunjungan` int NOT NULL,
  `tanggal_kunjungan` date NOT NULL,
  `id_siswa` int NOT NULL,
  `jam_kunjungan` time NOT NULL,
  `id_petugas` int NOT NULL,
  `keterangan` varchar(255) DEFAULT NULL
) ENGINE=InnoDB;

ALTER TABLE `kunjungan`
  ADD PRIMARY KEY (`id_kunjungan`),
  ADD KEY `id_siswa` (`id_siswa`,`id_petugas`),
  ADD KEY `id_petugas` (`id_petugas`);

ALTER TABLE `kunjungan`
  ADD CONSTRAINT `kunjungan_ibfk_1` FOREIGN KEY (`id_siswa`) REFERENCES `siswa` (`id_siswa`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `kunjungan_ibfk_2` FOREIGN KEY (`id_petugas`) REFERENCES `petugas` (`id_petugas`) ON DELETE CASCADE ON UPDATE CASCADE;
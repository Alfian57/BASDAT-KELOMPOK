CREATE TABLE `peminjaman` (
  `id_pinjam` int NOT NULL,
  `tanggal_pinjam` date NOT NULL,
  `id_buku` int NOT NULL,
  `id_petugas` int NOT NULL,
  `id_kunjungan` int NOT NULL,
  `id_siswa` int NOT NULL
) ENGINE=InnoDB;

ALTER TABLE `peminjaman`
  ADD PRIMARY KEY (`id_pinjam`),
  ADD KEY `id_buku` (`id_buku`,`id_petugas`,`id_kunjungan`,`id_siswa`),
  ADD KEY `id_petugas` (`id_petugas`),
  ADD KEY `id_siswa` (`id_siswa`),
  ADD KEY `id_kunjungan` (`id_kunjungan`);

ALTER TABLE `peminjaman`
  ADD CONSTRAINT `peminjaman_ibfk_1` FOREIGN KEY (`id_buku`) REFERENCES `buku` (`id_buku`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `peminjaman_ibfk_2` FOREIGN KEY (`id_petugas`) REFERENCES `petugas` (`id_petugas`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `peminjaman_ibfk_3` FOREIGN KEY (`id_siswa`) REFERENCES `siswa` (`id_siswa`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `peminjaman_ibfk_4` FOREIGN KEY (`id_kunjungan`) REFERENCES `kunjungan` (`id_kunjungan`) ON DELETE CASCADE ON UPDATE CASCADE;
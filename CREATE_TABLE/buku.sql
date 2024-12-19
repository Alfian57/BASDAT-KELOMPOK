CREATE TABLE `buku` (
  `id_buku` int NOT NULL,
  `judul_buku` varchar(100) NOT NULL,
  `jenis_buku` varchar(100) NOT NULL,
  `tahun_terbit` year NOT NULL,
  `pengarang` varchar(100) NOT NULL,
  `penerbit` varchar(100) NOT NULL
) ENGINE=InnoDB;

ALTER TABLE `buku`
  ADD PRIMARY KEY (`id_buku`);
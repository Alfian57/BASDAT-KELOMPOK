CREATE TABLE `petugas` (
  `id_petugas` int NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `nama_petugas` varchar(100) NOT NULL,
  `nik` char(16) NOT NULL,
  `no_telepon` varchar(25) NOT NULL,
  `alamat` text NOT NULL
) ENGINE=InnoDB;

ALTER TABLE `petugas`
  ADD PRIMARY KEY (`id_petugas`);
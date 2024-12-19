UPDATE `peminjaman`
SET `tanggal_pinjam` = '2023-10-01'
WHERE `id_pinjam` = 1;

UPDATE `peminjaman`
SET `id_buku` = 2
WHERE `id_pinjam` = 1;

UPDATE `peminjaman`
SET `id_petugas` = 3
WHERE `id_pinjam` = 1;

UPDATE `peminjaman`
SET `id_kunjungan` = 4
WHERE `id_pinjam` = 1;

UPDATE `peminjaman`
SET `id_siswa` = 5
WHERE `id_pinjam` = 1;
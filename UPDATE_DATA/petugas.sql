UPDATE `petugas`
SET `username` = 'username_baru',
        `password` = 'password_baru',
        `nama_petugas` = 'nama_petugas_baru',
        `nik` = 'nik_baru',
        `no_telepon` = 'no_telepon_baru',
        `alamat` = 'new_alamat'
WHERE `id_petugas` = 1;

UPDATE `petugas`
SET `username` = 'username_lainnya',
    `password` = 'password_lainnya',
    `nama_petugas` = 'nama_petugas_lainnya',
    `nik` = 'nik_lainnya',
    `no_telepon` = 'no_telepon_lainnya',
    `alamat` = 'alamat_lainnya'
WHERE `id_petugas` = 2;
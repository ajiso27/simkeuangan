-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 13 Mar 2022 pada 13.40
-- Versi server: 10.1.38-MariaDB
-- Versi PHP: 7.3.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sim_sekolah`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `catering`
--

CREATE TABLE `catering` (
  `id` int(11) NOT NULL,
  `id_siswa` smallint(6) NOT NULL,
  `nominal` varchar(12) NOT NULL,
  `tanggal` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `waktu` date NOT NULL,
  `time` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `catering`
--

INSERT INTO `catering` (`id`, `id_siswa`, `nominal`, `tanggal`, `waktu`, `time`) VALUES
(27, 8, '15000', '2019-12-18 09:15:55', '2020-01-09', '2019-12-18');

-- --------------------------------------------------------

--
-- Struktur dari tabel `gaji`
--

CREATE TABLE `gaji` (
  `id` int(11) NOT NULL,
  `id_guru` tinyint(4) NOT NULL,
  `periode` varchar(20) NOT NULL,
  `jam` varchar(4) NOT NULL,
  `nominal` varchar(12) NOT NULL,
  `time` date NOT NULL,
  `tanggal` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `guru`
--

CREATE TABLE `guru` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sex` enum('Pria','Wanita') NOT NULL,
  `nip` varchar(15) NOT NULL,
  `bidang` varchar(40) NOT NULL,
  `alamat` varchar(100) NOT NULL,
  `status` enum('Berhenti','Cuti','Aktif') NOT NULL,
  `number` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `guru`
--

INSERT INTO `guru` (`id`, `name`, `sex`, `nip`, `bidang`, `alamat`, `status`, `number`) VALUES
(3, 'Barikudin', 'Pria', '1201200221', 'Matematika', 'Jln Sutiyoso', 'Aktif', '0853-8833-2311'),
(4, 'Paramita', 'Wanita', '02130001231', 'Bahasa Indonesia', 'Jl. Tomat Merah', 'Aktif', '0852-9992-1212'),
(5, 'Safira', 'Wanita', '236546656', 'IPA', 'Jember', 'Aktif', '085464665'),
(6, 'Halima', 'Wanita', '25441454', 'PAI', 'jl Sentosa', 'Aktif', '056898989');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kelas`
--

CREATE TABLE `kelas` (
  `id` int(11) NOT NULL,
  `nama` varchar(15) NOT NULL,
  `wali` varchar(50) NOT NULL,
  `keterangan` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `kelas`
--

INSERT INTO `kelas` (`id`, `nama`, `wali`, `keterangan`) VALUES
(7, 'VII', 'Barikudin', ''),
(8, 'VIII', 'Paramita', ''),
(9, 'IX', 'Safira', '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `lainnya`
--

CREATE TABLE `lainnya` (
  `id` int(11) NOT NULL,
  `sekarang` varchar(15) NOT NULL,
  `time` date NOT NULL,
  `keterangan` varchar(100) NOT NULL,
  `nominal` varchar(12) NOT NULL,
  `tanggal` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `lainnya`
--

INSERT INTO `lainnya` (`id`, `sekarang`, `time`, `keterangan`, `nominal`, `tanggal`) VALUES
(7, '220313', '2022-03-13', 'Dana Komite', '20000000', '2022-03-13 08:17:19');

-- --------------------------------------------------------

--
-- Struktur dari tabel `laporan`
--

CREATE TABLE `laporan` (
  `id` int(11) NOT NULL,
  `saldo_awal` varchar(15) NOT NULL DEFAULT '0',
  `kas_masuk` varchar(15) DEFAULT '0',
  `kas_keluar` varchar(15) NOT NULL DEFAULT '0',
  `tanggal` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `laporan`
--

INSERT INTO `laporan` (`id`, `saldo_awal`, `kas_masuk`, `kas_keluar`, `tanggal`) VALUES
(15, '0', '20000000', '0', '2022-03-13');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pembayaran`
--

CREATE TABLE `pembayaran` (
  `id` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `nominal` varchar(12) NOT NULL,
  `tipe` enum('KM','KK') NOT NULL,
  `kode` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `pembayaran`
--

INSERT INTO `pembayaran` (`id`, `nama`, `nominal`, `tipe`, `kode`) VALUES
(1, 'Uang SPP', '70000', 'KM', 'KM-0001'),
(2, 'Uang Ujian', '50000', 'KM', 'KM-0002'),
(3, 'Uang Snack', '5000', 'KM', 'KM-0003'),
(4, 'Uang Catering', '15000', 'KM', 'KM-0004'),
(5, 'Uang Pendaftaran', '200000', 'KM', 'KM-0005'),
(6, 'Pembayaran Gaji', '40000', 'KK', 'KK-0001');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pendaftaran`
--

CREATE TABLE `pendaftaran` (
  `id` int(11) NOT NULL,
  `nominal` varchar(12) NOT NULL,
  `time` date NOT NULL,
  `siswa` varchar(50) NOT NULL,
  `tanggal` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pengeluaran`
--

CREATE TABLE `pengeluaran` (
  `id` int(11) NOT NULL,
  `nominal` varchar(12) NOT NULL,
  `sekarang` varchar(10) NOT NULL,
  `time` date NOT NULL,
  `keterangan` text NOT NULL,
  `tanggal` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `siswa`
--

CREATE TABLE `siswa` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `nis` varchar(15) NOT NULL,
  `sex` enum('Pria','Wanita') NOT NULL,
  `status` enum('Berhenti','Cuti','Aktif') NOT NULL,
  `wali` varchar(50) NOT NULL,
  `tempat` varchar(20) NOT NULL,
  `tanggal` date NOT NULL,
  `alamat` varchar(100) NOT NULL,
  `kelas` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `siswa`
--

INSERT INTO `siswa` (`id`, `name`, `nis`, `sex`, `status`, `wali`, `tempat`, `tanggal`, `alamat`, `kelas`) VALUES
(10, 'Suci Permata Sari', '123313134223', 'Wanita', 'Aktif', 'Musa Harun', 'Kampar', '2020-02-17', 'Jl. Simpang Lima', 6),
(11, 'Ahmad Dhairobbi', '1231314331', '', 'Aktif', 'Darmijan', 'Batu Guntung', '2002-07-25', 'Jln Kebakyoran Baru', 5),
(12, 'Safitri', '123', 'Pria', 'Aktif', 'Hendi', 'Bondowoso', '1995-03-16', 'Jl Sensasi', 7);

-- --------------------------------------------------------

--
-- Struktur dari tabel `snack`
--

CREATE TABLE `snack` (
  `id` int(11) NOT NULL,
  `id_siswa` smallint(6) NOT NULL,
  `tanggal` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `time` date NOT NULL,
  `waktu` date NOT NULL,
  `nominal` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `spp`
--

CREATE TABLE `spp` (
  `id` int(11) NOT NULL,
  `id_siswa` smallint(6) NOT NULL,
  `time` date NOT NULL,
  `bulan` varchar(20) NOT NULL,
  `nominal` varchar(12) NOT NULL,
  `tanggal` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tanggal`
--

CREATE TABLE `tanggal` (
  `id` int(11) NOT NULL,
  `tgl` date NOT NULL,
  `Keterangan` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tanggal`
--

INSERT INTO `tanggal` (`id`, `tgl`, `Keterangan`) VALUES
(3, '2020-06-01', 'Hari Pancasila'),
(4, '2020-05-22', 'Hari Buruh');

-- --------------------------------------------------------

--
-- Struktur dari tabel `temp`
--

CREATE TABLE `temp` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `nis` varchar(15) NOT NULL,
  `tempat` varchar(50) NOT NULL,
  `tanggal` date NOT NULL,
  `alamat` varchar(100) NOT NULL,
  `wali` varchar(100) NOT NULL,
  `sex` enum('Pria','Wanita') NOT NULL,
  `status` enum('Non-Aktif','Aktif') NOT NULL,
  `kelas` tinyint(4) NOT NULL,
  `bayar` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `ujian`
--

CREATE TABLE `ujian` (
  `id` int(11) NOT NULL,
  `id_siswa` smallint(6) NOT NULL,
  `nominal` varchar(15) NOT NULL,
  `periode` varchar(20) NOT NULL,
  `time` date NOT NULL,
  `tanggal` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `name` varchar(100) NOT NULL,
  `role` int(11) NOT NULL,
  `active` enum('1','0') NOT NULL,
  `gambar` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `name`, `role`, `active`, `gambar`) VALUES
(1, 'admin@gmail.com', '$2y$10$dFdQaba34BplJRnmCv54/uhoFLU0wlXCY4lRG/EG9FpX9fN1kzjq.', 'administrator', 1, '1', 'j.png');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `catering`
--
ALTER TABLE `catering`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `gaji`
--
ALTER TABLE `gaji`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `guru`
--
ALTER TABLE `guru`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `kelas`
--
ALTER TABLE `kelas`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `lainnya`
--
ALTER TABLE `lainnya`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `laporan`
--
ALTER TABLE `laporan`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `pendaftaran`
--
ALTER TABLE `pendaftaran`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `pengeluaran`
--
ALTER TABLE `pengeluaran`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `siswa`
--
ALTER TABLE `siswa`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `snack`
--
ALTER TABLE `snack`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `spp`
--
ALTER TABLE `spp`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tanggal`
--
ALTER TABLE `tanggal`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `temp`
--
ALTER TABLE `temp`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `ujian`
--
ALTER TABLE `ujian`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `catering`
--
ALTER TABLE `catering`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT untuk tabel `gaji`
--
ALTER TABLE `gaji`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `guru`
--
ALTER TABLE `guru`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `kelas`
--
ALTER TABLE `kelas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `lainnya`
--
ALTER TABLE `lainnya`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `laporan`
--
ALTER TABLE `laporan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT untuk tabel `pembayaran`
--
ALTER TABLE `pembayaran`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `pendaftaran`
--
ALTER TABLE `pendaftaran`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `pengeluaran`
--
ALTER TABLE `pengeluaran`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `siswa`
--
ALTER TABLE `siswa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT untuk tabel `snack`
--
ALTER TABLE `snack`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT untuk tabel `spp`
--
ALTER TABLE `spp`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `tanggal`
--
ALTER TABLE `tanggal`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `temp`
--
ALTER TABLE `temp`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `ujian`
--
ALTER TABLE `ujian`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

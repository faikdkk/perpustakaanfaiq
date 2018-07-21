-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 21 Jul 2018 pada 06.49
-- Versi Server: 10.1.21-MariaDB
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `perpustakaan_ari`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `buku`
--

CREATE TABLE `buku` (
  `kd_buku` char(5) NOT NULL,
  `judul` varchar(50) NOT NULL,
  `isbn` varchar(40) NOT NULL,
  `pengarang` varchar(50) NOT NULL,
  `halaman` int(4) NOT NULL,
  `jumlah` int(4) NOT NULL,
  `th_terbit` varchar(4) NOT NULL,
  `sinopsis` text NOT NULL,
  `kd_penerbit` char(3) NOT NULL,
  `kd_kategori` char(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `buku`
--

INSERT INTO `buku` (`kd_buku`, `judul`, `isbn`, `pengarang`, `halaman`, `jumlah`, `th_terbit`, `sinopsis`, `kd_penerbit`, `kd_kategori`) VALUES
('B0001', 'Basis Data', '111111111111', 'Fathansyah', 123, 10, '2014', '', 'P05', 'K14'),
('B0002', 'komunikasi data', '10101010101', 'hartanto', 79, 2, '2015', '', 'P02', 'K15'),
('B0003', 'JavaScript', '9781119028727', 'Nazruddin Safaat H', 900, 12, '2015', 'dfasdfa', 'P04', 'K15');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kategori`
--

CREATE TABLE `kategori` (
  `kd_kategori` char(3) NOT NULL,
  `nm_kategori` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `kategori`
--

INSERT INTO `kategori` (`kd_kategori`, `nm_kategori`) VALUES
('K01', 'Agama Islam'),
('K02', 'Matematika'),
('K03', 'Bahasa Indonesia'),
('K04', 'Bahasa Inggris'),
('K05', 'Ekonomi'),
('K06', 'Fisika'),
('K07', 'Sosiologi'),
('K08', 'Sejarah'),
('K09', 'Biologi'),
('K10', 'Geografi'),
('K11', 'Kimia'),
('K12', 'Pemograman Android'),
('K13', 'Pemograman Web'),
('K14', 'Pemograman Desktop'),
('K15', 'Komputer'),
('K16', 'Jaringan Komputer'),
('K17', 'Rekayasa Perangkat Lunak');

-- --------------------------------------------------------

--
-- Struktur dari tabel `modul`
--

CREATE TABLE `modul` (
  `id_modul` int(3) NOT NULL,
  `nama_modul` varchar(30) NOT NULL,
  `link` varchar(30) NOT NULL,
  `urutan` int(3) NOT NULL,
  `status` enum('admin','user') NOT NULL DEFAULT 'admin',
  `aktif` enum('Y','N') NOT NULL DEFAULT 'Y'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `modul`
--

INSERT INTO `modul` (`id_modul`, `nama_modul`, `link`, `urutan`, `status`, `aktif`) VALUES
(2, 'User', '?module=user', 1, 'user', 'Y'),
(3, 'Modul', '?module=modul', 2, 'admin', 'Y'),
(5, 'Kategori', '?module=kategori', 3, 'admin', 'Y'),
(26, 'Identitas Web', '?module=identitas', 11, 'admin', 'N'),
(25, 'Laporan', '?module=laporan', 10, 'admin', 'N'),
(24, 'Data Peminjaman', '?module=datapinjam', 9, 'admin', 'Y'),
(23, 'Peminjaman', '?module=peminjaman', 8, 'user', 'Y'),
(22, 'Pengadaan', '?module=pengadaan', 7, 'admin', 'Y'),
(21, 'Siswa', '?module=siswa', 6, 'admin', 'Y'),
(20, 'Buku', '?module=buku', 5, 'admin', 'Y'),
(19, 'Penerbit', '?module=penerbit', 4, 'admin', 'Y'),
(27, 'Pengembalian', '?module=pengembalian', 12, 'admin', 'Y'),
(28, 'Laporan Per Siswa', '?module=lap_persiswa', 13, 'admin', 'Y'),
(29, 'Laporan Bulan', '?module=lap_bulan', 14, 'admin', 'Y'),
(30, 'Grafik', '?module=grafik', 15, 'admin', 'Y');

-- --------------------------------------------------------

--
-- Struktur dari tabel `peminjaman`
--

CREATE TABLE `peminjaman` (
  `no_pinjam` char(6) NOT NULL,
  `tgl_pinjam` date NOT NULL,
  `tgl_kembali` date NOT NULL,
  `nisn` varchar(20) NOT NULL,
  `status` enum('Pinjam','Kembali') NOT NULL DEFAULT 'Pinjam',
  `username` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `peminjaman`
--

INSERT INTO `peminjaman` (`no_pinjam`, `tgl_pinjam`, `tgl_kembali`, `nisn`, `status`, `username`) VALUES
('PJ0003', '2018-07-19', '2018-07-22', 'A11.2015.08804', 'Kembali', 'admin'),
('PJ0002', '2018-07-19', '2018-07-25', 'A11.2013.07368', 'Pinjam', 'admin'),
('PJ0001', '2018-07-19', '2018-07-28', 'A11.2015.08804', 'Kembali', 'admin');

-- --------------------------------------------------------

--
-- Struktur dari tabel `peminjaman_detil`
--

CREATE TABLE `peminjaman_detil` (
  `no_pinjam` char(6) NOT NULL,
  `kd_buku` char(5) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `peminjaman_detil`
--

INSERT INTO `peminjaman_detil` (`no_pinjam`, `kd_buku`) VALUES
('PJ0003', 'B0003'),
('PJ0003', 'B0001'),
('PJ0002', 'B0003'),
('PJ0002', 'B0001'),
('PJ0001', 'B0002'),
('PJ0001', 'B0002'),
('PJ0001', 'B0001'),
('PJ0005', 'B0001'),
('PJ0005', 'B0001'),
('PJ0005', 'B0001'),
('PJ0001', 'B0001'),
('PJ0001', 'B0003'),
('PJ0002', 'B0001');

-- --------------------------------------------------------

--
-- Struktur dari tabel `penerbit`
--

CREATE TABLE `penerbit` (
  `kd_penerbit` char(3) NOT NULL,
  `nm_penerbit` varchar(30) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `penerbit`
--

INSERT INTO `penerbit` (`kd_penerbit`, `nm_penerbit`) VALUES
('P01', 'Erlangga'),
('P02', 'Kanisius'),
('P03', 'Intan Pariwara'),
('P04', 'Elex Media Komputindo'),
('P05', 'Andi Offset'),
('P06', 'PPDPN'),
('P08', 'Penerbit Andie');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pengadaan`
--

CREATE TABLE `pengadaan` (
  `no_pengadaan` char(5) NOT NULL,
  `tgl_pengadaan` date NOT NULL,
  `kd_buku` char(5) NOT NULL,
  `asal_buku` varchar(100) NOT NULL,
  `jumlah` int(2) NOT NULL,
  `keterangan` varchar(200) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `pengadaan`
--

INSERT INTO `pengadaan` (`no_pengadaan`, `tgl_pengadaan`, `kd_buku`, `asal_buku`, `jumlah`, `keterangan`) VALUES
('PG002', '2017-07-01', 'B0002', 'amik', 10, 'buku rpl'),
('PG003', '2017-06-29', 'B0004', 'bantuan pemda bekasi', 100, 'baru');

-- --------------------------------------------------------

--
-- Struktur dari tabel `siswa`
--

CREATE TABLE `siswa` (
  `nisn` varchar(20) NOT NULL,
  `nm_siswa` varchar(32) NOT NULL,
  `kelamin` varchar(32) NOT NULL,
  `kelas` varchar(30) NOT NULL,
  `tempat_lahir` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `siswa`
--

INSERT INTO `siswa` (`nisn`, `nm_siswa`, `kelamin`, `kelas`, `tempat_lahir`) VALUES
('A11.2015.08804', 'MOCHAMMAD FAIK PRATAMA', 'L', 'Teknik Informatika', 'Semarang'),
('A11.2013.07368', 'DANIEL KURNIAWAN', 'L', 'Teknik Informatika', 'Tegal'),
('A11.2012.06969', 'BENY DWI CAHYONO', 'L', 'Teknik Informatika', 'Semarang');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tmp_pinjam`
--

CREATE TABLE `tmp_pinjam` (
  `id` int(11) NOT NULL,
  `kd_buku` char(5) NOT NULL,
  `username` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `username` varchar(20) NOT NULL,
  `password` varchar(50) NOT NULL,
  `nama_lengkap` varchar(30) NOT NULL,
  `email` varchar(30) NOT NULL,
  `level` enum('admin','user') NOT NULL DEFAULT 'user',
  `blokir` enum('Y','N') NOT NULL DEFAULT 'N',
  `id_session` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`username`, `password`, `nama_lengkap`, `email`, `level`, `blokir`, `id_session`) VALUES
('admin', '21232f297a57a5a743894a0e4a801fc3', 'Administrator', 'admin@gmail.com', 'admin', 'N', '47n4fu512hgeqgt368hn0luph4'),
('faik', '3ff70c1c9599850942829a00dd6b9716', 'Mochammad Faik Pratama', 'faik01@gmail.com', 'user', 'N', 'l3pcq1on8nk16tgsudtu34fi65');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `buku`
--
ALTER TABLE `buku`
  ADD PRIMARY KEY (`kd_buku`),
  ADD KEY `kd_kategori` (`kd_kategori`),
  ADD KEY `kd_penerbit` (`kd_penerbit`);

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`kd_kategori`);

--
-- Indexes for table `modul`
--
ALTER TABLE `modul`
  ADD PRIMARY KEY (`id_modul`);

--
-- Indexes for table `peminjaman`
--
ALTER TABLE `peminjaman`
  ADD PRIMARY KEY (`no_pinjam`),
  ADD KEY `kd_siswa` (`nisn`),
  ADD KEY `username` (`username`);

--
-- Indexes for table `peminjaman_detil`
--
ALTER TABLE `peminjaman_detil`
  ADD KEY `no_pinjam` (`no_pinjam`);

--
-- Indexes for table `penerbit`
--
ALTER TABLE `penerbit`
  ADD PRIMARY KEY (`kd_penerbit`);

--
-- Indexes for table `pengadaan`
--
ALTER TABLE `pengadaan`
  ADD PRIMARY KEY (`no_pengadaan`),
  ADD KEY `kd_buku` (`kd_buku`);

--
-- Indexes for table `siswa`
--
ALTER TABLE `siswa`
  ADD PRIMARY KEY (`nisn`);

--
-- Indexes for table `tmp_pinjam`
--
ALTER TABLE `tmp_pinjam`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `modul`
--
ALTER TABLE `modul`
  MODIFY `id_modul` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
--
-- AUTO_INCREMENT for table `tmp_pinjam`
--
ALTER TABLE `tmp_pinjam`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

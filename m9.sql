-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 10 Nov 2025 pada 10.12
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `m9`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `departemen`
--

CREATE TABLE `departemen` (
  `NO_DEPT` char(15) NOT NULL,
  `NAMA_DEPT` char(35) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `dosen`
--

CREATE TABLE `dosen` (
  `id_dosen` int(11) NOT NULL,
  `nama_depan_dosen` varchar(50) NOT NULL,
  `nama_belakang_dosen` varchar(50) NOT NULL,
  `email_dosen` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `dosen`
--

INSERT INTO `dosen` (`id_dosen`, `nama_depan_dosen`, `nama_belakang_dosen`, `email_dosen`) VALUES
(1, 'Budi', 'Santoso', 'budi@kampus.ac.id'),
(2, 'Lina', 'Dewi', 'lina@kampus.ac.id'),
(3, 'Andi', 'Saputra', 'andi@kampus.ac.id');

-- --------------------------------------------------------

--
-- Struktur dari tabel `dosen_kuliah`
--

CREATE TABLE `dosen_kuliah` (
  `id_dosen` int(11) NOT NULL,
  `id_kuliah` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `dosen_kuliah`
--

INSERT INTO `dosen_kuliah` (`id_dosen`, `id_kuliah`) VALUES
(1, 101),
(1, 102),
(2, 103),
(3, 101);

-- --------------------------------------------------------

--
-- Struktur dari tabel `kuliah`
--

CREATE TABLE `kuliah` (
  `id_kuliah` int(11) NOT NULL,
  `nama_kuliah` varchar(100) NOT NULL,
  `no_dept` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `kuliah`
--

INSERT INTO `kuliah` (`id_kuliah`, `nama_kuliah`, `no_dept`) VALUES
(101, 'Basis Data', 'D01'),
(102, 'Pemrograman Web', 'D02'),
(103, 'Jaringan Komputer', 'D03');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pegawai`
--

CREATE TABLE `pegawai` (
  `NO_PEG` char(6) NOT NULL,
  `NAMA_PEGAWAI` char(40) NOT NULL,
  `NO_HP` char(15) NOT NULL,
  `NO_DEPT` char(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `departemen`
--
ALTER TABLE `departemen`
  ADD PRIMARY KEY (`NO_DEPT`);

--
-- Indeks untuk tabel `dosen`
--
ALTER TABLE `dosen`
  ADD PRIMARY KEY (`id_dosen`),
  ADD UNIQUE KEY `email_dosen` (`email_dosen`);

--
-- Indeks untuk tabel `dosen_kuliah`
--
ALTER TABLE `dosen_kuliah`
  ADD PRIMARY KEY (`id_dosen`,`id_kuliah`),
  ADD KEY `id_kuliah` (`id_kuliah`);

--
-- Indeks untuk tabel `kuliah`
--
ALTER TABLE `kuliah`
  ADD PRIMARY KEY (`id_kuliah`);

--
-- Indeks untuk tabel `pegawai`
--
ALTER TABLE `pegawai`
  ADD PRIMARY KEY (`NO_PEG`),
  ADD KEY `NO_DEPT` (`NO_DEPT`);

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `dosen_kuliah`
--
ALTER TABLE `dosen_kuliah`
  ADD CONSTRAINT `dosen_kuliah_ibfk_1` FOREIGN KEY (`id_dosen`) REFERENCES `dosen` (`id_dosen`),
  ADD CONSTRAINT `dosen_kuliah_ibfk_2` FOREIGN KEY (`id_kuliah`) REFERENCES `kuliah` (`id_kuliah`);

--
-- Ketidakleluasaan untuk tabel `pegawai`
--
ALTER TABLE `pegawai`
  ADD CONSTRAINT `pegawai_ibfk_1` FOREIGN KEY (`NO_DEPT`) REFERENCES `departemen` (`NO_DEPT`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

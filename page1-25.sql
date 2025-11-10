-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 10 Nov 2025 pada 14.50
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
-- Database: `page1-25`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `barang`
--

CREATE TABLE `barang` (
  `id_barang` varchar(10) NOT NULL,
  `nama_barang` varchar(50) DEFAULT NULL,
  `tanggal_terima` date DEFAULT NULL,
  `stok_barang` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `barang`
--

INSERT INTO `barang` (`id_barang`, `nama_barang`, `tanggal_terima`, `stok_barang`) VALUES
('BRG01', 'Laptop', '2024-01-10', 5),
('BRG02', 'Mouse', '2024-01-12', 10),
('BRG03', 'Keyboard', '2024-01-15', 7);

-- --------------------------------------------------------

--
-- Struktur dari tabel `biodata`
--

CREATE TABLE `biodata` (
  `no_mahasiswa` varchar(15) NOT NULL,
  `kd_jurusan` varchar(10) DEFAULT NULL,
  `nama` varchar(50) DEFAULT NULL,
  `alamat` varchar(50) DEFAULT NULL,
  `ipk` decimal(3,1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `biodata`
--

INSERT INTO `biodata` (`no_mahasiswa`, `kd_jurusan`, `nama`, `alamat`, `ipk`) VALUES
('210002', 'KD01', 'Rizal Samurai', 'Denpasar', 3.7),
('210012', 'KD02', 'Alexandra', 'Nusa dua', 3.3),
('210090', 'KD05', 'Gani Suprapto', 'Singaraja', 3.5),
('210098', 'KD01', 'Rina Gunawan Astuti', 'Denpasar', 3.3),
('210099', 'KD02', 'Nadine', 'Gianyar', 3.2),
('210100', 'KD04', 'Nama Baru', 'Alamat Baru', 0.0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `jurusan`
--

CREATE TABLE `jurusan` (
  `kd_jurusan` varchar(10) NOT NULL,
  `nama_jurusan` varchar(50) DEFAULT NULL,
  `ketua` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `jurusan`
--

INSERT INTO `jurusan` (`kd_jurusan`, `nama_jurusan`, `ketua`) VALUES
('KD02', 'Teknik Informatika', 'EnnySela,S.Kom.,M.Kom'),
('KD03', 'Tekhnik Komputer', 'Berta Bednar,S.Si,M.T.'),
('KM01', 'Sistem Informasi', 'Harnaningrum,S.Si');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pembelian`
--

CREATE TABLE `pembelian` (
  `id_pembeli` varchar(10) NOT NULL,
  `id_barang` varchar(10) DEFAULT NULL,
  `nama_pembeli` varchar(50) DEFAULT NULL,
  `tanggal_beli` date DEFAULT NULL,
  `jumlah_pembelian` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `pembelian`
--

INSERT INTO `pembelian` (`id_pembeli`, `id_barang`, `nama_pembeli`, `tanggal_beli`, `jumlah_pembelian`) VALUES
('P01', 'BRG01', 'Rian', '2024-02-01', 1),
('P02', 'BRG01', 'Nadia', '2024-02-02', 2),
('P03', 'BRG03', 'Sinta', '2024-02-03', 1),
('P04', 'BRG05', 'Ari', '2024-02-05', 1);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`id_barang`);

--
-- Indeks untuk tabel `biodata`
--
ALTER TABLE `biodata`
  ADD PRIMARY KEY (`no_mahasiswa`);

--
-- Indeks untuk tabel `jurusan`
--
ALTER TABLE `jurusan`
  ADD PRIMARY KEY (`kd_jurusan`);

--
-- Indeks untuk tabel `pembelian`
--
ALTER TABLE `pembelian`
  ADD PRIMARY KEY (`id_pembeli`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

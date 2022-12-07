-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 10, 2022 at 07:38 AM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pinjol`
--

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `ID_Customer` int(20) NOT NULL,
  `Nama` varchar(50) NOT NULL,
  `No_Telp` int(12) NOT NULL,
  `Jenis_Kelamin` varchar(10) NOT NULL,
  `Alamat` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `meminjamkan`
--

CREATE TABLE `meminjamkan` (
  `ID_PP` int(20) NOT NULL,
  `ID_Customer` int(20) NOT NULL,
  `Tanggal` date NOT NULL,
  `Deadline` date NOT NULL,
  `Tanggal_Pembayaran` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `pembayaran`
--

CREATE TABLE `pembayaran` (
  `ID_Pembayaran` int(20) NOT NULL,
  `ID_Customer` int(20) NOT NULL,
  `Jumlah` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `pembayaran_denda`
--

CREATE TABLE `pembayaran_denda` (
  `ID_Denda` int(20) NOT NULL,
  `ID_Customer` int(20) NOT NULL,
  `Jumlah` int(10) NOT NULL,
  `Jumlah_Denda` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `permintaan_peminjaman`
--

CREATE TABLE `permintaan_peminjaman` (
  `ID_PP` int(20) NOT NULL,
  `ID_Customer` int(20) NOT NULL,
  `Tanggal` date NOT NULL,
  `Jumlah` int(10) NOT NULL,
  `Deadline` date NOT NULL,
  `Tanggal_Pembayaran` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`ID_Customer`);

--
-- Indexes for table `meminjamkan`
--
ALTER TABLE `meminjamkan`
  ADD PRIMARY KEY (`ID_PP`) USING BTREE,
  ADD UNIQUE KEY `ID_Customer` (`ID_Customer`) USING BTREE;

--
-- Indexes for table `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD PRIMARY KEY (`ID_Pembayaran`),
  ADD UNIQUE KEY `ID_Customer` (`ID_Customer`) USING BTREE;

--
-- Indexes for table `pembayaran_denda`
--
ALTER TABLE `pembayaran_denda`
  ADD PRIMARY KEY (`ID_Denda`),
  ADD UNIQUE KEY `ID_Customer` (`ID_Customer`) USING BTREE;

--
-- Indexes for table `permintaan_peminjaman`
--
ALTER TABLE `permintaan_peminjaman`
  ADD PRIMARY KEY (`ID_PP`),
  ADD UNIQUE KEY `ID_Customer` (`ID_Customer`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

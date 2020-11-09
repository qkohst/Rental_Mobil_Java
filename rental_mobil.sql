-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 26, 2019 at 11:53 AM
-- Server version: 10.1.26-MariaDB
-- PHP Version: 7.1.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rental_mobil`
--

-- --------------------------------------------------------

--
-- Table structure for table `jenisservice`
--

CREATE TABLE `jenisservice` (
  `IDJENISSERVICE` varchar(5) NOT NULL,
  `NMJENISSERVICE` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jenisservice`
--

INSERT INTO `jenisservice` (`IDJENISSERVICE`, `NMJENISSERVICE`) VALUES
('SRV01', 'Tune Up'),
('SRV02', 'Ganti Oli');

-- --------------------------------------------------------

--
-- Table structure for table `karyawan`
--

CREATE TABLE `karyawan` (
  `NIK` varchar(20) NOT NULL,
  `NMKARYAWAN` varchar(50) NOT NULL,
  `ALMTKARYAWAN` varchar(50) NOT NULL,
  `TELPKARYAWAN` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `karyawan`
--

INSERT INTO `karyawan` (`NIK`, `NMKARYAWAN`, `ALMTKARYAWAN`, `TELPKARYAWAN`) VALUES
('123459876', 'Yusuf', 'Jl. Panglima Sudirman', '0356-443300');

-- --------------------------------------------------------

--
-- Table structure for table `kendaraan`
--

CREATE TABLE `kendaraan` (
  `NOPLAT` varchar(20) NOT NULL,
  `IDTYPE` varchar(5) NOT NULL,
  `KODEPEMILIK` varchar(6) NOT NULL,
  `KODE_SERVICE` varchar(5) NOT NULL,
  `TAHUN` varchar(4) NOT NULL,
  `TARIFPERJAM` decimal(10,0) NOT NULL,
  `STATUSRENTAL` varchar(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kendaraan`
--

INSERT INTO `kendaraan` (`NOPLAT`, `IDTYPE`, `KODEPEMILIK`, `KODE_SERVICE`, `TAHUN`, `TARIFPERJAM`, `STATUSRENTAL`) VALUES
('S 4074 P', 'TP01', 'PML001', 'SRV01', '2012', '25000', 'Tersedia'),
('S 5555 P', 'TP02', 'PML002', 'SRV01', '2012', '30000', 'Tersedia');

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `USERNAME` varchar(10) NOT NULL,
  `NIK` varchar(20) NOT NULL,
  `PASSWORD` varchar(10) NOT NULL,
  `TYPEUSER` varchar(15) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`USERNAME`, `NIK`, `PASSWORD`, `TYPEUSER`) VALUES
('Paket 3', '12456789', 'admin', 'Administrator');

-- --------------------------------------------------------

--
-- Table structure for table `merk`
--

CREATE TABLE `merk` (
  `KODEMERK` varchar(6) NOT NULL,
  `NMMERK` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `merk`
--

INSERT INTO `merk` (`KODEMERK`, `NMMERK`) VALUES
('MRK01', 'Kijang Inova'),
('MRK02', 'Toyota Avanza'),
('MRK03', 'Honda Jazz');

-- --------------------------------------------------------

--
-- Table structure for table `pelanggan`
--

CREATE TABLE `pelanggan` (
  `NOKTP` varchar(20) NOT NULL,
  `NAMAPEL` varchar(50) NOT NULL,
  `ALAMATPEL` varchar(50) NOT NULL,
  `TELPPEL` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pelanggan`
--

INSERT INTO `pelanggan` (`NOKTP`, `NAMAPEL`, `ALAMATPEL`, `TELPPEL`) VALUES
('1234567890', 'Ibrahim ', 'Palang', '0356-303058'),
('1234560987', 'Muhammad', 'Tuban', '0356-303000');

-- --------------------------------------------------------

--
-- Table structure for table `pemilik`
--

CREATE TABLE `pemilik` (
  `KODEPEMILIK` varchar(6) NOT NULL,
  `NMPEMILIK` varchar(20) NOT NULL,
  `ALMTPEMILIK` varchar(50) NOT NULL,
  `TELPPEMILIK` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pemilik`
--

INSERT INTO `pemilik` (`KODEPEMILIK`, `NMPEMILIK`, `ALMTPEMILIK`, `TELPPEMILIK`) VALUES
('PML001', 'Sulaiman', 'Palang', '08777822220'),
('PML002', 'Idris', 'Tuban', '08777800000');

-- --------------------------------------------------------

--
-- Table structure for table `service`
--

CREATE TABLE `service` (
  `KODE_SERVICE` varchar(5) NOT NULL,
  `IDJENISSERVICE` varchar(5) NOT NULL,
  `TGLSERVICE` date NOT NULL,
  `BIAYASERVICE` decimal(10,0) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `service`
--

INSERT INTO `service` (`KODE_SERVICE`, `IDJENISSERVICE`, `TGLSERVICE`, `BIAYASERVICE`) VALUES
('SRV02', 'JSS01', '2016-02-11', '125000'),
('SRV01', 'JSS01', '2016-02-12', '125000');

-- --------------------------------------------------------

--
-- Table structure for table `setoran`
--

CREATE TABLE `setoran` (
  `NOSETORAN` varchar(6) NOT NULL,
  `KODEPEMILIK` varchar(6) NOT NULL,
  `NIK` varchar(20) NOT NULL,
  `TGLSETORAN` date NOT NULL,
  `JUMLAH` decimal(10,0) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `setoran`
--

INSERT INTO `setoran` (`NOSETORAN`, `KODEPEMILIK`, `NIK`, `TGLSETORAN`, `JUMLAH`) VALUES
('1', 'PML001', '123456789', '2016-02-12', '100000'),
('2', 'PML002', '987654321', '2016-02-12', '120000');

-- --------------------------------------------------------

--
-- Table structure for table `sopir`
--

CREATE TABLE `sopir` (
  `IDSOPIR` varchar(6) NOT NULL,
  `NMSOPIR` varchar(50) NOT NULL,
  `ALMTSOPIR` varchar(50) NOT NULL,
  `TELPSOPIR` varchar(20) NOT NULL,
  `NOSIM` varchar(30) NOT NULL,
  `TERIFPERJAM` decimal(10,0) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sopir`
--

INSERT INTO `sopir` (`IDSOPIR`, `NMSOPIR`, `ALMTSOPIR`, `TELPSOPIR`, `NOSIM`, `TERIFPERJAM`) VALUES
('SPR01', 'Mujahidin', 'Tambakboyo', '0356-087654', '32194040', '50000'),
('SPR02', 'Mukminin', 'Palang', '0356-087000', '321940123', '45000');

-- --------------------------------------------------------

--
-- Table structure for table `transaksisewa`
--

CREATE TABLE `transaksisewa` (
  `NOTRANSAKSI` varchar(6) NOT NULL,
  `IDSOPIR` varchar(6) NOT NULL,
  `NOKTP` varchar(20) NOT NULL,
  `NOPLAT` varchar(20) NOT NULL,
  `NIK` varchar(20) NOT NULL,
  `TGLPESAN` date NOT NULL,
  `TGLPINJAM` date NOT NULL,
  `JAMPINJAM` time NOT NULL,
  `TGLKEMBALIRENCANA` date NOT NULL,
  `JAMKEMBALIRENCANA` time NOT NULL,
  `TGLKEMBALIREAL` date NOT NULL,
  `JAMKEMBALIREAL` time NOT NULL,
  `DENDA` decimal(10,0) NOT NULL,
  `KILOMETERPINJAM` decimal(5,0) NOT NULL,
  `KILOMETERKEMBALI` decimal(5,0) NOT NULL,
  `BBMPINJAM` decimal(3,0) NOT NULL,
  `BBMKEMBALI` decimal(3,0) NOT NULL,
  `KONDISIMOBILPINJAM` varchar(50) NOT NULL,
  `KONDISIMOBILKEMBALI` varchar(50) NOT NULL,
  `KERUSAKAN` varchar(225) DEFAULT NULL,
  `BIAYAKERUSAKAN` decimal(10,0) DEFAULT NULL,
  `BIAYABBM` decimal(10,0) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `type`
--

CREATE TABLE `type` (
  `IDTYPE` varchar(5) NOT NULL,
  `KODEMERK` varchar(6) NOT NULL,
  `NMTYPE` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `type`
--

INSERT INTO `type` (`IDTYPE`, `KODEMERK`, `NMTYPE`) VALUES
('TP01', 'MRK01', 'Sedan'),
('TP02', 'MRK02', 'Sport');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `jenisservice`
--
ALTER TABLE `jenisservice`
  ADD PRIMARY KEY (`IDJENISSERVICE`);

--
-- Indexes for table `karyawan`
--
ALTER TABLE `karyawan`
  ADD PRIMARY KEY (`NIK`);

--
-- Indexes for table `kendaraan`
--
ALTER TABLE `kendaraan`
  ADD PRIMARY KEY (`NOPLAT`),
  ADD KEY `FK_R10` (`KODE_SERVICE`),
  ADD KEY `FK_R3` (`IDTYPE`),
  ADD KEY `FK_R4` (`KODEPEMILIK`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`USERNAME`),
  ADD KEY `FK_R2` (`NIK`);

--
-- Indexes for table `merk`
--
ALTER TABLE `merk`
  ADD PRIMARY KEY (`KODEMERK`);

--
-- Indexes for table `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`NOKTP`);

--
-- Indexes for table `pemilik`
--
ALTER TABLE `pemilik`
  ADD PRIMARY KEY (`KODEPEMILIK`);

--
-- Indexes for table `service`
--
ALTER TABLE `service`
  ADD PRIMARY KEY (`KODE_SERVICE`),
  ADD KEY `FK_R8` (`IDJENISSERVICE`);

--
-- Indexes for table `setoran`
--
ALTER TABLE `setoran`
  ADD PRIMARY KEY (`NOSETORAN`),
  ADD KEY `FK_R7` (`KODEPEMILIK`),
  ADD KEY `FK_R9` (`NIK`);

--
-- Indexes for table `sopir`
--
ALTER TABLE `sopir`
  ADD PRIMARY KEY (`IDSOPIR`);

--
-- Indexes for table `transaksisewa`
--
ALTER TABLE `transaksisewa`
  ADD PRIMARY KEY (`NOTRANSAKSI`),
  ADD KEY `FK_R1` (`NOKTP`),
  ADD KEY `FK_R11` (`NIK`),
  ADD KEY `FK_R12` (`NOPLAT`),
  ADD KEY `FK_R5` (`IDSOPIR`);

--
-- Indexes for table `type`
--
ALTER TABLE `type`
  ADD PRIMARY KEY (`IDTYPE`),
  ADD KEY `FK_R6` (`KODEMERK`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

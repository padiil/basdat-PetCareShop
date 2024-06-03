-- phpMyAdmin SQL Dump
-- version 5.1.1deb5ubuntu1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 03, 2024 at 12:58 PM
-- Server version: 10.6.16-MariaDB-0ubuntu0.22.04.1
-- PHP Version: 8.2.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `petshop`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id_admin` int(11) NOT NULL,
  `nama_admin` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id_admin`, `nama_admin`, `username`, `password`) VALUES
(1, 'admin', 'admin', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `aksesoris`
--

CREATE TABLE `aksesoris` (
  `id_aksesoris` int(11) NOT NULL,
  `nama_aksesoris` varchar(100) DEFAULT NULL,
  `harga_aksesoris` decimal(10,2) DEFAULT NULL,
  `gambar_aksesoris` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `aksesoris`
--

INSERT INTO `aksesoris` (`id_aksesoris`, `nama_aksesoris`, `harga_aksesoris`, `gambar_aksesoris`) VALUES
(1, 'kalung kucing lonceng', '10000.00', 'https://images.tokopedia.net/img/cache/700/VqbcmM/2022/7/8/26b9a052-46cb-4dbb-8eee-41b06f338e07.jpg'),
(2, 'Hernes Dada Kcuing Dan Anjing', '13000.00', 'https://img.lazcdn.com/g/p/b5e258fb63b410752ddeeb2f92b315db.jpg_720x720q80.jpg'),
(3, 'Tali Tuntun Hewan', '5000.00', 'https://img.lazcdn.com/g/p/f9981e27a66712edbbf974fae6e188fe.jpg_720x720q80.jpg'),
(4, 'Pelindung Leher Kucing ', '14000.00', 'https://img.lazcdn.com/g/p/6eb98c1057c340f4516aa751a4ce59aa.jpg_720x720q80.jpg'),
(5, 'Baju Kucing ', '9500.00', 'https://down-id.img.susercontent.com/file/id-11134207-7r991-lueeljd0v8tk8e'),
(6, 'Topi Kucing ', '9500.00', 'https://s0.bukalapak.com/img/58983962203/s-463-463/data.jpeg.webp');

-- --------------------------------------------------------

--
-- Table structure for table `kandang`
--

CREATE TABLE `kandang` (
  `id_kandang` int(11) NOT NULL,
  `jumlah_kandang` int(11) DEFAULT NULL,
  `jumlah_kandang_kosong` int(11) DEFAULT NULL,
  `harga_kandang` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `makanan`
--

CREATE TABLE `makanan` (
  `id_makanan` int(11) NOT NULL,
  `nama_makanan` varchar(100) DEFAULT NULL,
  `harga_makanan` decimal(10,2) DEFAULT NULL,
  `gambar_makanan` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `makanan`
--

INSERT INTO `makanan` (`id_makanan`, `nama_makanan`, `harga_makanan`, `gambar_makanan`) VALUES
(1, 'whiskas tuna 1.2kg', '50000.00', 'https://images.tokopedia.net/img/cache/700/product-1/2019/9/17/71160237/71160237_3884916d-2433-4ef2-a512-32259a294fce_425_425'),
(2, 'Royal Canin (400g)', '88000.00', 'https://www.static-src.com/wcsstore/Indraprastha/images/catalog/full//82/MTA-2106350/royal-canin_cat-food---makanan-kucing-royal-canin-kitten-persian-32-400-gram_full02.jpg'),
(7, 'Excel Rasa Ikan Tuna (500g)', '13000.00', 'https://images.tokopedia.net/img/cache/500-square/VqbcmM/2021/9/14/8a08b9fc-3af6-4e8b-aa29-fca4e7380b1d.jpg'),
(17, 'Life Cat Kaleng Tuna (400g)', '14000.00', 'https://d2qjkwm11akmwu.cloudfront.net/products/740470_26-3-2021_14-22-48-1665824668.webp'),
(18, 'Snack Kucing ME-O Creamy (Sapack)', '20000.00', 'https://images.tokopedia.net/img/cache/700/VqbcmM/2023/1/4/6d683ebc-9ba9-4087-87cd-6442b3113cb6.jpg'),
(19, 'Snack Kucing PEIEN (Satuan)', '2100.00', 'https://www.static-src.com/wcsstore/Indraprastha/images/catalog/full//104/MTA-76602973/no_brand_snack_kucing_peien_creamy_treats_-_cemilan_liquid_-_cat_food_murah_full01_l73bgn3g.jpg'),
(20, 'Dog Choice', '20000.00', 'https://www.static-src.com/wcsstore/Indraprastha/images/catalog/full//107/MTA-3968288/petshop_murah_dog_choize__adult_beef_flavour_-_makanan_anjing_-20kg-_full02.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `obat`
--

CREATE TABLE `obat` (
  `id_obat` int(11) NOT NULL,
  `nama_obat` varchar(100) DEFAULT NULL,
  `jenis_obat` varchar(50) DEFAULT NULL,
  `harga_obat` decimal(10,2) DEFAULT NULL,
  `gambar_obat` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `obat`
--

INSERT INTO `obat` (`id_obat`, `nama_obat`, `jenis_obat`, `harga_obat`, `gambar_obat`) VALUES
(1, 'obat diare kucing 30ml', NULL, '15000.00', 'https://www.static-src.com/wcsstore/Indraprastha/images/catalog/full//84/MTA-2254502/tamasindo_obat-diare-kucing-mencret-sakit-perut-primacat_full05.jpg'),
(2, 'Ketosol 100ml', NULL, '225000.00', 'https://www.static-src.com/wcsstore/Indraprastha/images/catalog/full//94/MTA-90059400/br-m036969-06937_-obat-hewan-ketosol-100-analgesik-antipiretik_full01.jpg'),
(3, 'Vet OI LA INJEKSI AntiBiotik', NULL, '130000.00', 'https://down-id.img.susercontent.com/file/b02ae8c2b4e3376b4b1162f74b233216'),
(4, 'Fertilife 100ml', NULL, '237000.00', 'https://www.static-src.com/wcsstore/Indraprastha/images/catalog/full//97/MTA-93121189/oem_oem_full01.jpg'),
(5, 'interspectin L 100ml', NULL, '210000.00', 'https://images.tokopedia.net/img/cache/500-square/product-1/2017/9/9/5851677/5851677_bef624a0-4d61-4f75-ac77-b89d50d0d32f_640_400.jpeg'),
(6, 'Medoxy LA 100ml', NULL, '2720000.00', 'https://down-id.img.susercontent.com/file/id-11134207-7qul9-lhwrax9q0gno58'),
(7, 'Ambicat', NULL, '50000.00', 'https://s4.bukalapak.com/img/90843539692/large/data.jpeg');

-- --------------------------------------------------------

--
-- Table structure for table `pelanggan`
--

CREATE TABLE `pelanggan` (
  `id_pelanggan` int(11) NOT NULL,
  `nama_pelanggan` varchar(100) DEFAULT NULL,
  `alamat_pelanggan` varchar(150) DEFAULT NULL,
  `no_telepon_pelanggan` varchar(15) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pelanggan`
--

INSERT INTO `pelanggan` (`id_pelanggan`, `nama_pelanggan`, `alamat_pelanggan`, `no_telepon_pelanggan`, `email`, `password`) VALUES
(8, 'agus', 'jl. jalannya kapan', '087', 'agus@gmail.com', '123');

-- --------------------------------------------------------

--
-- Table structure for table `transaksi_jasa`
--

CREATE TABLE `transaksi_jasa` (
  `id_transaksi_jasa` int(11) NOT NULL,
  `id_pelanggan` int(11) DEFAULT NULL,
  `id_kandang` int(11) DEFAULT NULL,
  `jumlah_kandang` int(11) DEFAULT NULL,
  `waktu` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transaksi_produk`
--

CREATE TABLE `transaksi_produk` (
  `id_transaksi_produk` int(11) NOT NULL,
  `id_pelanggan` int(11) DEFAULT NULL,
  `id_makanan` int(11) DEFAULT NULL,
  `id_aksesoris` int(11) DEFAULT NULL,
  `id_obat` int(11) DEFAULT NULL,
  `harga_obat` decimal(10,2) DEFAULT NULL,
  `harga_makanan` decimal(10,2) DEFAULT NULL,
  `harga_aksesoris` decimal(10,2) DEFAULT NULL,
  `jumlah_obat` int(11) DEFAULT NULL,
  `jumlah_makanan` int(11) DEFAULT NULL,
  `jumlah_aksesoris` int(11) DEFAULT NULL,
  `waktu` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id_admin`);

--
-- Indexes for table `aksesoris`
--
ALTER TABLE `aksesoris`
  ADD PRIMARY KEY (`id_aksesoris`);

--
-- Indexes for table `kandang`
--
ALTER TABLE `kandang`
  ADD PRIMARY KEY (`id_kandang`);

--
-- Indexes for table `makanan`
--
ALTER TABLE `makanan`
  ADD PRIMARY KEY (`id_makanan`);

--
-- Indexes for table `obat`
--
ALTER TABLE `obat`
  ADD PRIMARY KEY (`id_obat`);

--
-- Indexes for table `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`id_pelanggan`);

--
-- Indexes for table `transaksi_jasa`
--
ALTER TABLE `transaksi_jasa`
  ADD PRIMARY KEY (`id_transaksi_jasa`),
  ADD KEY `id_pelanggan` (`id_pelanggan`),
  ADD KEY `id_kandang` (`id_kandang`);

--
-- Indexes for table `transaksi_produk`
--
ALTER TABLE `transaksi_produk`
  ADD PRIMARY KEY (`id_transaksi_produk`),
  ADD KEY `id_pelanggan` (`id_pelanggan`),
  ADD KEY `id_makanan` (`id_makanan`),
  ADD KEY `id_aksesoris` (`id_aksesoris`),
  ADD KEY `id_obat` (`id_obat`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id_admin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `aksesoris`
--
ALTER TABLE `aksesoris`
  MODIFY `id_aksesoris` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `kandang`
--
ALTER TABLE `kandang`
  MODIFY `id_kandang` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `makanan`
--
ALTER TABLE `makanan`
  MODIFY `id_makanan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `obat`
--
ALTER TABLE `obat`
  MODIFY `id_obat` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `pelanggan`
--
ALTER TABLE `pelanggan`
  MODIFY `id_pelanggan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `transaksi_jasa`
--
ALTER TABLE `transaksi_jasa`
  MODIFY `id_transaksi_jasa` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transaksi_produk`
--
ALTER TABLE `transaksi_produk`
  MODIFY `id_transaksi_produk` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `transaksi_jasa`
--
ALTER TABLE `transaksi_jasa`
  ADD CONSTRAINT `transaksi_jasa_ibfk_1` FOREIGN KEY (`id_pelanggan`) REFERENCES `pelanggan` (`id_pelanggan`),
  ADD CONSTRAINT `transaksi_jasa_ibfk_2` FOREIGN KEY (`id_kandang`) REFERENCES `kandang` (`id_kandang`);

--
-- Constraints for table `transaksi_produk`
--
ALTER TABLE `transaksi_produk`
  ADD CONSTRAINT `transaksi_produk_ibfk_1` FOREIGN KEY (`id_pelanggan`) REFERENCES `pelanggan` (`id_pelanggan`),
  ADD CONSTRAINT `transaksi_produk_ibfk_2` FOREIGN KEY (`id_makanan`) REFERENCES `makanan` (`id_makanan`),
  ADD CONSTRAINT `transaksi_produk_ibfk_3` FOREIGN KEY (`id_aksesoris`) REFERENCES `aksesoris` (`id_aksesoris`),
  ADD CONSTRAINT `transaksi_produk_ibfk_4` FOREIGN KEY (`id_obat`) REFERENCES `obat` (`id_obat`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

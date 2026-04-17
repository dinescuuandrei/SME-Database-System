-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 17, 2026 at 07:33 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `firma_imm`
--

-- --------------------------------------------------------

--
-- Table structure for table `angajati`
--

CREATE TABLE `angajati` (
  `id_angajat` int(11) NOT NULL,
  `nume` varchar(100) NOT NULL,
  `functie` varchar(100) DEFAULT NULL,
  `salariu` decimal(10,2) DEFAULT NULL,
  `sporuri` decimal(10,2) DEFAULT NULL,
  `ore_suplimentare` int(11) DEFAULT NULL,
  `concedii` int(11) DEFAULT NULL,
  `telefon` varchar(20) DEFAULT NULL,
  `adresa` varchar(255) DEFAULT NULL,
  `varsta` int(11) DEFAULT NULL,
  `sef_direct` int(11) DEFAULT NULL,
  `id_departament` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `angajati`
--

INSERT INTO `angajati` (`id_angajat`, `nume`, `functie`, `salariu`, `sporuri`, `ore_suplimentare`, `concedii`, `telefon`, `adresa`, `varsta`, `sef_direct`, `id_departament`) VALUES
(1, 'Ion Popescu', 'Manager Productie', 5500.00, 500.00, 10, 20, '0722123456', 'Str. Fabricii 10', 45, NULL, 1),
(2, 'Maria Ionescu', 'Manager Financiar', 6000.00, 600.00, 5, 18, '0722987654', 'Str. Economiei 5', 40, NULL, 2),
(3, 'Andrei Georgescu', 'HR Specialist', 4000.00, 300.00, 8, 22, '0722456789', 'Str. Resursei 3', 35, NULL, 3),
(4, 'Elena Stan', 'Marketing Specialist', 4200.00, 350.00, 6, 19, '0722345678', 'Str. Promotiei 7', 32, NULL, 4),
(5, 'Cristian Dobre', 'Operator Productie', 3000.00, 200.00, 12, 25, '0722123987', 'Str. Fabricii 12', 28, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `clienti`
--

CREATE TABLE `clienti` (
  `id_client` int(11) NOT NULL,
  `nume` varchar(100) NOT NULL,
  `adresa` varchar(255) DEFAULT NULL,
  `telefon` varchar(20) DEFAULT NULL,
  `fidelitate` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `clienti`
--

INSERT INTO `clienti` (`id_client`, `nume`, `adresa`, `telefon`, `fidelitate`) VALUES
(1, 'SC ElectroHome SRL', 'Str. Aparatelor 10', '0312345678', 1),
(2, 'SC CasaPlus SRL', 'Str. Locuintei 22', '0318765432', 0);

-- --------------------------------------------------------

--
-- Table structure for table `comenzi`
--

CREATE TABLE `comenzi` (
  `id_comanda` int(11) NOT NULL,
  `id_client` int(11) DEFAULT NULL,
  `id_produs` int(11) DEFAULT NULL,
  `cantitate` int(11) DEFAULT NULL,
  `data_comanda` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `comenzi`
--

INSERT INTO `comenzi` (`id_comanda`, `id_client`, `id_produs`, `cantitate`, `data_comanda`) VALUES
(1, 1, 1, 5, '2025-11-15'),
(2, 2, 2, 3, '2025-11-18');

-- --------------------------------------------------------

--
-- Table structure for table `concurenti`
--

CREATE TABLE `concurenti` (
  `id_concurent` int(11) NOT NULL,
  `nume` varchar(100) NOT NULL,
  `zona_distributie` varchar(255) DEFAULT NULL,
  `cota_piata` decimal(5,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `concurenti`
--

INSERT INTO `concurenti` (`id_concurent`, `nume`, `zona_distributie`, `cota_piata`) VALUES
(1, 'ElectroSpare', 'Zona Sud', 15.50),
(2, 'HomeParts', 'Zona Nord', 10.75);

-- --------------------------------------------------------

--
-- Table structure for table `departamente`
--

CREATE TABLE `departamente` (
  `id_departament` int(11) NOT NULL,
  `denumire` varchar(100) NOT NULL,
  `responsabil` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `departamente`
--

INSERT INTO `departamente` (`id_departament`, `denumire`, `responsabil`) VALUES
(1, 'Productie', 'Ion Popescu'),
(2, 'Financiar', 'Maria Ionescu'),
(3, 'Resurse Umane', 'Andrei Georgescu'),
(4, 'Marketing', 'Elena Stan');

-- --------------------------------------------------------

--
-- Table structure for table `furnizori`
--

CREATE TABLE `furnizori` (
  `id_furnizor` int(11) NOT NULL,
  `nume` varchar(100) NOT NULL,
  `adresa` varchar(255) DEFAULT NULL,
  `telefon` varchar(20) DEFAULT NULL,
  `tip_furnizare` enum('Material','Piesa') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `furnizori`
--

INSERT INTO `furnizori` (`id_furnizor`, `nume`, `adresa`, `telefon`, `tip_furnizare`) VALUES
(1, 'MetalCom', 'Str. Uzinei 15', '0213456789', 'Material'),
(2, 'ElectroParts', 'Str. Tehnicii 20', '0219876543', 'Piesa');

-- --------------------------------------------------------

--
-- Table structure for table `materiale`
--

CREATE TABLE `materiale` (
  `id_material` int(11) NOT NULL,
  `denumire` varchar(100) NOT NULL,
  `unitate_masura` varchar(50) DEFAULT NULL,
  `pret` decimal(10,2) DEFAULT NULL,
  `stoc` int(11) DEFAULT NULL,
  `id_furnizor` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `materiale`
--

INSERT INTO `materiale` (`id_material`, `denumire`, `unitate_masura`, `pret`, `stoc`, `id_furnizor`) VALUES
(1, 'Tabla Otel', 'kg', 5.50, 1000, 1),
(2, 'Plastic ABS', 'kg', 3.20, 500, 1);

-- --------------------------------------------------------

--
-- Table structure for table `piese_componenta`
--

CREATE TABLE `piese_componenta` (
  `id_piesa` int(11) NOT NULL,
  `denumire` varchar(100) NOT NULL,
  `pret` decimal(10,2) DEFAULT NULL,
  `stoc` int(11) DEFAULT NULL,
  `id_furnizor` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `piese_componenta`
--

INSERT INTO `piese_componenta` (`id_piesa`, `denumire`, `pret`, `stoc`, `id_furnizor`) VALUES
(1, 'Motor Frigider', 120.00, 50, 2),
(2, 'Rezistenta Masina Spalat', 80.00, 70, 2);

-- --------------------------------------------------------

--
-- Table structure for table `produse_finite`
--

CREATE TABLE `produse_finite` (
  `id_produs` int(11) NOT NULL,
  `denumire` varchar(100) NOT NULL,
  `pret` decimal(10,2) DEFAULT NULL,
  `stoc` int(11) DEFAULT NULL,
  `mod_obtinere` enum('Asamblare','Executie') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `produse_finite`
--

INSERT INTO `produse_finite` (`id_produs`, `denumire`, `pret`, `stoc`, `mod_obtinere`) VALUES
(1, 'Set Piese Frigider', 300.00, 20, 'Asamblare'),
(2, 'Piesa Masina Spalat', 150.00, 30, 'Executie');

-- --------------------------------------------------------

--
-- Table structure for table `proiecte`
--

CREATE TABLE `proiecte` (
  `id_proiect` int(11) NOT NULL,
  `denumire` varchar(100) NOT NULL,
  `termen` date DEFAULT NULL,
  `responsabil_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `proiecte`
--

INSERT INTO `proiecte` (`id_proiect`, `denumire`, `termen`, `responsabil_id`) VALUES
(1, 'Asamblare Piese Frigider', '2025-12-31', 1),
(2, 'Executie Piese Masina de Spalat', '2025-11-30', 5);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `angajati`
--
ALTER TABLE `angajati`
  ADD PRIMARY KEY (`id_angajat`),
  ADD KEY `sef_direct` (`sef_direct`),
  ADD KEY `id_departament` (`id_departament`);

--
-- Indexes for table `clienti`
--
ALTER TABLE `clienti`
  ADD PRIMARY KEY (`id_client`);

--
-- Indexes for table `comenzi`
--
ALTER TABLE `comenzi`
  ADD PRIMARY KEY (`id_comanda`),
  ADD KEY `id_client` (`id_client`),
  ADD KEY `id_produs` (`id_produs`);

--
-- Indexes for table `concurenti`
--
ALTER TABLE `concurenti`
  ADD PRIMARY KEY (`id_concurent`);

--
-- Indexes for table `departamente`
--
ALTER TABLE `departamente`
  ADD PRIMARY KEY (`id_departament`);

--
-- Indexes for table `furnizori`
--
ALTER TABLE `furnizori`
  ADD PRIMARY KEY (`id_furnizor`);

--
-- Indexes for table `materiale`
--
ALTER TABLE `materiale`
  ADD PRIMARY KEY (`id_material`),
  ADD KEY `id_furnizor` (`id_furnizor`);

--
-- Indexes for table `piese_componenta`
--
ALTER TABLE `piese_componenta`
  ADD PRIMARY KEY (`id_piesa`),
  ADD KEY `id_furnizor` (`id_furnizor`);

--
-- Indexes for table `produse_finite`
--
ALTER TABLE `produse_finite`
  ADD PRIMARY KEY (`id_produs`);

--
-- Indexes for table `proiecte`
--
ALTER TABLE `proiecte`
  ADD PRIMARY KEY (`id_proiect`),
  ADD KEY `responsabil_id` (`responsabil_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `angajati`
--
ALTER TABLE `angajati`
  MODIFY `id_angajat` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `clienti`
--
ALTER TABLE `clienti`
  MODIFY `id_client` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `comenzi`
--
ALTER TABLE `comenzi`
  MODIFY `id_comanda` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `concurenti`
--
ALTER TABLE `concurenti`
  MODIFY `id_concurent` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `departamente`
--
ALTER TABLE `departamente`
  MODIFY `id_departament` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `furnizori`
--
ALTER TABLE `furnizori`
  MODIFY `id_furnizor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `materiale`
--
ALTER TABLE `materiale`
  MODIFY `id_material` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `piese_componenta`
--
ALTER TABLE `piese_componenta`
  MODIFY `id_piesa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `produse_finite`
--
ALTER TABLE `produse_finite`
  MODIFY `id_produs` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `proiecte`
--
ALTER TABLE `proiecte`
  MODIFY `id_proiect` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `angajati`
--
ALTER TABLE `angajati`
  ADD CONSTRAINT `angajati_ibfk_1` FOREIGN KEY (`sef_direct`) REFERENCES `angajati` (`id_angajat`) ON DELETE SET NULL,
  ADD CONSTRAINT `angajati_ibfk_2` FOREIGN KEY (`id_departament`) REFERENCES `departamente` (`id_departament`) ON DELETE CASCADE;

--
-- Constraints for table `comenzi`
--
ALTER TABLE `comenzi`
  ADD CONSTRAINT `comenzi_ibfk_1` FOREIGN KEY (`id_client`) REFERENCES `clienti` (`id_client`) ON DELETE CASCADE,
  ADD CONSTRAINT `comenzi_ibfk_2` FOREIGN KEY (`id_produs`) REFERENCES `produse_finite` (`id_produs`) ON DELETE CASCADE;

--
-- Constraints for table `materiale`
--
ALTER TABLE `materiale`
  ADD CONSTRAINT `materiale_ibfk_1` FOREIGN KEY (`id_furnizor`) REFERENCES `furnizori` (`id_furnizor`) ON DELETE SET NULL;

--
-- Constraints for table `piese_componenta`
--
ALTER TABLE `piese_componenta`
  ADD CONSTRAINT `piese_componenta_ibfk_1` FOREIGN KEY (`id_furnizor`) REFERENCES `furnizori` (`id_furnizor`) ON DELETE SET NULL;

--
-- Constraints for table `proiecte`
--
ALTER TABLE `proiecte`
  ADD CONSTRAINT `proiecte_ibfk_1` FOREIGN KEY (`responsabil_id`) REFERENCES `angajati` (`id_angajat`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

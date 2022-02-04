-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 20, 2022 at 04:28 PM
-- Server version: 10.4.19-MariaDB
-- PHP Version: 7.3.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `skript`
--

-- --------------------------------------------------------

--
-- Table structure for table `app_user`
--

CREATE TABLE `app_user` (
  `id` int(11) NOT NULL,
  `username` varchar(250) NOT NULL,
  `password` varchar(200) NOT NULL,
  `email` varchar(250) NOT NULL,
  `broj_telefona` varchar(50) NOT NULL,
  `steceno_obrazovanje` varchar(250) NOT NULL,
  `id_radno_mesto` int(11) DEFAULT NULL,
  `id_rola` int(11) NOT NULL DEFAULT 3
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `app_user`
--

INSERT INTO `app_user` (`id`, `username`, `password`, `email`, `broj_telefona`, `steceno_obrazovanje`, `id_radno_mesto`, `id_rola`) VALUES
(5, 'IsidoraJovaanovic', '$2a$12$ARoXEw/FMNb.kfYgF.nxteW9wCmEXhHLG20pYO9aQCV92EX0A8LcC', 'isidora@gmai.com', '+38166203220', 'diplomirani inzinjer elektonike', 3, 1),
(6, 'PeraPeric', '$2a$12$KfX3WEpBepa1zbmIZznD1ugU9y0cck0Zdidd0UYkbeQYQb5tXXTne', 'pera@gmail.com', '+381656666452', 'diplomirani inzinjer tehnologije ', 2, 2),
(9, 'MarkoMarkovic', '$2a$12$.CWYwDQRqwF.gkiph87Cd.Jj38intgQ4z2.t1JNdfbnk2veT0AEJu', 'marko@gmail.com', '+38166204420', 'diplomirani pravnik', 5, 3),
(10, 'TeodoraIvkovic', '$2b$12$NSNs50ho.x726ap8UUy.pO7LoO1yukF18nkC9.geobYtm7GriHGny', 'tea@gmail.com', '066/858585', 'Diplomirani ekonomista', 1, 3),
(55, 'JovanaMikic', '$2b$12$giLAnVP3LJUb4hvPMBABHerD84XOubZluEoOp08/TWPI8ZnC2WHqi', 'inaantic997@gmail.com', '+38168888888', 'diplomirani pravnik', 1, 3),
(56, 'JovanaMikic', '$2b$12$7r.CcAI2CS6690e3eUBjC.N7pkPJeJtLHPKvWb6sr6TE8F3KZrM6S', 'isidorajov97@gmail.com', '+38168888888', 'diplomirani pravnik', 1, 3),
(65, 'JelenaMircic', '$2b$12$BPJEull.5Pioyh.a7N4Kxe6ZSikftC7u9Z9ukdtcsTTXb1XAygiYK', 'jekaa@gmail.com', '+38168888888', 'diplomirani pravnik', 1, 3),
(66, 'MikaMikic', '$2b$12$AesB35Wd9GteZgLGi1ydjuL66hbWAiRWBw8gf7guOpxh8sW0SJUD.', 'mika@gmail.com', '+38168888888', 'diplomirani pravnik', 1, 3),
(67, 'KikaMitorvic', '$2b$12$CLS.trHqmRZUma6WArecpenWXXyIoHvYqs6Gxb0g/AAZUSMP5FoGW', 'kika@gmail.com', '+38168888888', 'diplomirani pravnik', 1, 3),
(68, 'Milkaaa', '$2b$12$EIGiOTg7xvjJhVN6dMu1hu477Iuq31BkNmazlfZygQEjYybOUdxbS', 'milkaa@gmail.com', '+38168888888', 'diplomirani pravnik', 1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `dostuni_kursevi`
--

CREATE TABLE `dostuni_kursevi` (
  `id` int(11) NOT NULL,
  `naziv` varchar(250) NOT NULL,
  `trajanje` varchar(50) NOT NULL,
  `uslov_polaganja` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `dostuni_kursevi`
--

INSERT INTO `dostuni_kursevi` (`id`, `naziv`, `trajanje`, `uslov_polaganja`) VALUES
(1, 'Sigurnost na mrezi', '4h', '80%'),
(2, 'Prva pomoc', '5h', '85%'),
(3, 'Upravljanje pozicijama', '3h', '70%'),
(4, 'Sprecavanje Korupcije', '2h', '85%'),
(5, 'Zastita zivotne sredine', '1h', '60%');

-- --------------------------------------------------------

--
-- Table structure for table `istorija_polaganja_kurseva`
--

CREATE TABLE `istorija_polaganja_kurseva` (
  `id` int(11) NOT NULL,
  `id_kursa` int(11) NOT NULL,
  `id_usera` int(11) NOT NULL,
  `ocena` int(11) NOT NULL,
  `zavrsen` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `istorija_polaganja_kurseva`
--

INSERT INTO `istorija_polaganja_kurseva` (`id`, `id_kursa`, `id_usera`, `ocena`, `zavrsen`) VALUES
(1, 5, 6, 98, 1),
(2, 3, 9, 98, 1),
(3, 1, 65, 79, 1),
(4, 2, 5, 98, 1),
(5, 4, 6, 98, 1);

-- --------------------------------------------------------

--
-- Table structure for table `radna_mesta`
--

CREATE TABLE `radna_mesta` (
  `id` int(11) NOT NULL,
  `naziv` varchar(250) NOT NULL,
  `opis` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `radna_mesta`
--

INSERT INTO `radna_mesta` (`id`, `naziv`, `opis`) VALUES
(1, 'Administrative Assistant', 'Most administrative assistant duties revolve around managing and distributing information within an office. This generally includes answering phones, taking memos and maintaining files. Administrative assistants may also be in charge of sending and receiving correspondence, as well as greeting clients and customers.'),
(2, 'Executive Assistant', 'Executive Assistants screen all visitors and determine what level of support they need while offering polite, professional customer service. They manage the executive\'s daily calendar, including scheduling meetings, confirming appointments, writing itineraries and arranging for transportation.'),
(3, 'Marketing Manager', 'A marketing manager is responsible for managing the promotion and positioning of a brand or the products and services that a company sells. Typically marketing managers are employed to attract more customers to buy from the company and to raise brand awareness through the creation of marketing campaigns.'),
(4, 'Customer Service Representative', 'Serves customers by providing product and service information and resolving product and service problems. Attracts potential customers by answering product and service questions and suggesting information about other products and services.'),
(5, 'Sales Manager', 'Sales managers are responsible for leading sales teams to reach sales targets. Sales managers are primarily tasked with hiring and training team members, setting quotas, evaluating and adjusting performance, and developing processes that drive sales. Sales managers are oftentimes expected to travel.');

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `id` int(11) NOT NULL,
  `naziv` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`id`, `naziv`) VALUES
(1, 'admin'),
(2, 'moderator'),
(3, 'korisnik');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `app_user`
--
ALTER TABLE `app_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `id_radnoMesto` (`id_radno_mesto`),
  ADD KEY `id_rola` (`id_rola`);

--
-- Indexes for table `dostuni_kursevi`
--
ALTER TABLE `dostuni_kursevi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `istorija_polaganja_kurseva`
--
ALTER TABLE `istorija_polaganja_kurseva`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_kursa` (`id_kursa`),
  ADD KEY `id_usera` (`id_usera`);

--
-- Indexes for table `radna_mesta`
--
ALTER TABLE `radna_mesta`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `app_user`
--
ALTER TABLE `app_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT for table `dostuni_kursevi`
--
ALTER TABLE `dostuni_kursevi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `istorija_polaganja_kurseva`
--
ALTER TABLE `istorija_polaganja_kurseva`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `radna_mesta`
--
ALTER TABLE `radna_mesta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `app_user`
--
ALTER TABLE `app_user`
  ADD CONSTRAINT `id_radnoMesto` FOREIGN KEY (`id_radno_mesto`) REFERENCES `radna_mesta` (`id`),
  ADD CONSTRAINT `id_rola` FOREIGN KEY (`id_rola`) REFERENCES `role` (`id`);

--
-- Constraints for table `istorija_polaganja_kurseva`
--
ALTER TABLE `istorija_polaganja_kurseva`
  ADD CONSTRAINT `id_kursa` FOREIGN KEY (`id_kursa`) REFERENCES `dostuni_kursevi` (`id`),
  ADD CONSTRAINT `id_usera` FOREIGN KEY (`id_usera`) REFERENCES `app_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

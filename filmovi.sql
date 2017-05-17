-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 16, 2017 at 02:18 PM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 7.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `filmovi`
--

-- --------------------------------------------------------

--
-- Table structure for table `film`
--

CREATE TABLE `film` (
  `FilmId` int(11) NOT NULL,
  `Naziv` varchar(20) COLLATE utf8_bin NOT NULL,
  `VrijemeTrajanja` int(11) NOT NULL,
  `RedateljId` int(11) NOT NULL,
  `ZanrId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `film`
--

INSERT INTO `film` (`FilmId`, `Naziv`, `VrijemeTrajanja`, `RedateljId`, `ZanrId`) VALUES
(1, 'Hobbit', 90, 1, 1),
(2, 'Casino', 120, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `redatelj`
--

CREATE TABLE `redatelj` (
  `RedateljId` int(11) NOT NULL,
  `Ime` varchar(20) COLLATE utf8_bin NOT NULL,
  `Prezime` varchar(20) COLLATE utf8_bin NOT NULL,
  `DatumRodjenja` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `redatelj`
--

INSERT INTO `redatelj` (`RedateljId`, `Ime`, `Prezime`, `DatumRodjenja`) VALUES
(1, 'Pete', 'Jackson', '1961-05-09'),
(2, 'Martin ', 'Scorsese', '1960-05-09');

-- --------------------------------------------------------

--
-- Table structure for table `zanr`
--

CREATE TABLE `zanr` (
  `ZanrId` int(11) NOT NULL,
  `Naziv` varchar(20) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `zanr`
--

INSERT INTO `zanr` (`ZanrId`, `Naziv`) VALUES
(1, 'Akcijski');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `film`
--
ALTER TABLE `film`
  ADD PRIMARY KEY (`FilmId`),
  ADD KEY `redatelj` (`RedateljId`),
  ADD KEY `zanr` (`ZanrId`);

--
-- Indexes for table `redatelj`
--
ALTER TABLE `redatelj`
  ADD PRIMARY KEY (`RedateljId`);

--
-- Indexes for table `zanr`
--
ALTER TABLE `zanr`
  ADD PRIMARY KEY (`ZanrId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `film`
--
ALTER TABLE `film`
  MODIFY `FilmId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `redatelj`
--
ALTER TABLE `redatelj`
  MODIFY `RedateljId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `zanr`
--
ALTER TABLE `zanr`
  MODIFY `ZanrId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `film`
--
ALTER TABLE `film`
  ADD CONSTRAINT `redatelj` FOREIGN KEY (`RedateljId`) REFERENCES `redatelj` (`RedateljId`),
  ADD CONSTRAINT `zanr` FOREIGN KEY (`ZanrId`) REFERENCES `zanr` (`ZanrId`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

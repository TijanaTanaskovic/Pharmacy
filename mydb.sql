-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Sep 18, 2021 at 01:08 AM
-- Server version: 10.4.10-MariaDB
-- PHP Version: 7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mydb`
--

-- --------------------------------------------------------

--
-- Table structure for table `apoteka`
--

DROP TABLE IF EXISTS `apoteka`;
CREATE TABLE IF NOT EXISTS `apoteka` (
  `ID_apoteka` int(11) NOT NULL,
  `ime` varchar(45) NOT NULL,
  `grad` varchar(45) NOT NULL,
  `ulica` varchar(45) NOT NULL,
  `broj` int(11) NOT NULL,
  PRIMARY KEY (`ID_apoteka`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `dobavljac`
--

DROP TABLE IF EXISTS `dobavljac`;
CREATE TABLE IF NOT EXISTS `dobavljac` (
  `ID_dobavljaca` int(11) NOT NULL,
  `grad_dobavljaca` varchar(45) NOT NULL,
  `ulica_dobavljača` varchar(45) NOT NULL,
  `broj_dobavljača` int(11) NOT NULL,
  `ime_dobavljaca` varchar(45) NOT NULL,
  `kontakt` int(11) NOT NULL,
  PRIMARY KEY (`ID_dobavljaca`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dobavljac`
--

INSERT INTO `dobavljac` (`ID_dobavljaca`, `grad_dobavljaca`, `ulica_dobavljača`, `broj_dobavljača`, `ime_dobavljaca`, `kontakt`) VALUES
(1, 'Kragujevac', 'Dr Jovana Rsirica', 20, 'Pearls', 123456),
(2, 'Beograd', 'Knjeginje Milice', 75, 'Draganovic', 555333);

-- --------------------------------------------------------

--
-- Table structure for table `lek`
--

DROP TABLE IF EXISTS `lek`;
CREATE TABLE IF NOT EXISTS `lek` (
  `tip` varchar(45) NOT NULL,
  `ime_leka` varchar(45) NOT NULL,
  `Proizvod_ID_proizvoda` int(11) NOT NULL,
  PRIMARY KEY (`Proizvod_ID_proizvoda`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lek`
--

INSERT INTO `lek` (`tip`, `ime_leka`, `Proizvod_ID_proizvoda`) VALUES
('bez recepta', 'Paracetamol', 1),
('na recept', 'Bromazepam', 2);

-- --------------------------------------------------------

--
-- Table structure for table `obezbeduje`
--

DROP TABLE IF EXISTS `obezbeduje`;
CREATE TABLE IF NOT EXISTS `obezbeduje` (
  `ID_proizvoda` int(11) NOT NULL,
  `ID_dobavljaca` int(11) NOT NULL,
  PRIMARY KEY (`ID_proizvoda`,`ID_dobavljaca`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `obezbeduje`
--

INSERT INTO `obezbeduje` (`ID_proizvoda`, `ID_dobavljaca`) VALUES
(1, 1),
(2, 1),
(3, 2),
(4, 2);

-- --------------------------------------------------------

--
-- Table structure for table `ostaliproizvodi`
--

DROP TABLE IF EXISTS `ostaliproizvodi`;
CREATE TABLE IF NOT EXISTS `ostaliproizvodi` (
  `ime` varchar(45) NOT NULL,
  `namena` varchar(45) NOT NULL,
  `Proizvod_ID_proizvoda` int(11) NOT NULL,
  PRIMARY KEY (`Proizvod_ID_proizvoda`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ostaliproizvodi`
--

INSERT INTO `ostaliproizvodi` (`ime`, `namena`, `Proizvod_ID_proizvoda`) VALUES
('Cicaplast krema', 'kozmetika', 3),
('Krema za ruke', 'kozmetika', 4);

-- --------------------------------------------------------

--
-- Table structure for table `pacijent`
--

DROP TABLE IF EXISTS `pacijent`;
CREATE TABLE IF NOT EXISTS `pacijent` (
  `jmbg_pacijenta` int(11) NOT NULL,
  `ime_pacijenta` varchar(45) NOT NULL,
  `prezime_pacijenta` varchar(45) NOT NULL,
  PRIMARY KEY (`jmbg_pacijenta`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `prodaje`
--

DROP TABLE IF EXISTS `prodaje`;
CREATE TABLE IF NOT EXISTS `prodaje` (
  `jmbg` int(11) NOT NULL,
  `ID_proizvoda` int(11) NOT NULL,
  PRIMARY KEY (`jmbg`,`ID_proizvoda`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `proizvod`
--

DROP TABLE IF EXISTS `proizvod`;
CREATE TABLE IF NOT EXISTS `proizvod` (
  `ID_proizvoda` int(11) NOT NULL,
  `cena` int(11) NOT NULL,
  PRIMARY KEY (`ID_proizvoda`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `proizvod`
--

INSERT INTO `proizvod` (`ID_proizvoda`, `cena`) VALUES
(1, 170),
(2, 500),
(3, 2000),
(4, 200);

-- --------------------------------------------------------

--
-- Table structure for table `recept`
--

DROP TABLE IF EXISTS `recept`;
CREATE TABLE IF NOT EXISTS `recept` (
  `ID_recepta` int(11) NOT NULL,
  `opis` varchar(45) NOT NULL,
  `jmbg_pacijenta` int(11) NOT NULL,
  PRIMARY KEY (`ID_recepta`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sadrži`
--

DROP TABLE IF EXISTS `sadrži`;
CREATE TABLE IF NOT EXISTS `sadrži` (
  `ID_proizvoda` int(11) NOT NULL,
  `ID_recepta` int(11) NOT NULL,
  PRIMARY KEY (`ID_proizvoda`,`ID_recepta`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `zaposleni`
--

DROP TABLE IF EXISTS `zaposleni`;
CREATE TABLE IF NOT EXISTS `zaposleni` (
  `jmbg` int(13) NOT NULL,
  `datum_zaposlenja` date NOT NULL,
  `ime_zaposlenog` varchar(45) NOT NULL,
  `prezime_zaposlenog` varchar(45) NOT NULL,
  `ID_apoteke` int(11) NOT NULL,
  PRIMARY KEY (`jmbg`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `zaposleni`
--

INSERT INTO `zaposleni` (`jmbg`, `datum_zaposlenja`, `ime_zaposlenog`, `prezime_zaposlenog`, `ID_apoteke`) VALUES
(987654, '2011-01-01', 'Milica', 'Kesic', 1),
(12345678, '2014-04-12', 'Tijana', 'Tanaskovic', 1);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

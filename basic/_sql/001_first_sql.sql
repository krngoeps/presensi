-- phpMyAdmin SQL Dump
-- version 4.0.10.9
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jul 29, 2015 at 02:30 PM
-- Server version: 5.6.14
-- PHP Version: 5.6.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `presensi`
--

-- --------------------------------------------------------

--
-- Table structure for table `group`
--

CREATE TABLE IF NOT EXISTS `group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `group`
--

INSERT INTO `group` (`id`, `nama`) VALUES
(1, 'admin'),
(2, 'pemerhati');

-- --------------------------------------------------------

--
-- Table structure for table `jemaat`
--

CREATE TABLE IF NOT EXISTS `jemaat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(100) NOT NULL,
  `panggilan` varchar(100) NOT NULL,
  `angkatan` year(4) NOT NULL,
  `jenis_kelamin` enum('cowok','cewek') NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `jemaat`
--

INSERT INTO `jemaat` (`id`, `nama`, `panggilan`, `angkatan`, `jenis_kelamin`) VALUES
(1, 'Antonius Budi Kurniawan', 'Toni', 2011, 'cowok'),
(2, 'Indira Despuanitara Batara Randa', 'Indira', 2013, 'cewek');

-- --------------------------------------------------------

--
-- Table structure for table `kebaktian`
--

CREATE TABLE IF NOT EXISTS `kebaktian` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tanggal` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `kebaktian`
--

INSERT INTO `kebaktian` (`id`, `tanggal`) VALUES
(1, '2015-07-26');

-- --------------------------------------------------------

--
-- Table structure for table `presensi`
--

CREATE TABLE IF NOT EXISTS `presensi` (
  `id_kebaktian` int(11) NOT NULL,
  `id_jemaat` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  KEY `id_kebaktian` (`id_kebaktian`),
  KEY `id_jemaat` (`id_jemaat`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `presensi`
--

INSERT INTO `presensi` (`id_kebaktian`, `id_jemaat`, `status`) VALUES
(1, 1, 1),
(1, 2, 0);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(128) NOT NULL,
  `password` varchar(128) NOT NULL,
  `id_group` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  KEY `id_group` (`id_group`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `id_group`) VALUES
(1, 'admin', '21232f297a57a5a743894a0e4a801fc3', 1),
(2, 'ebedkm', 'c3e1b2b7787d8a4466e3c2a126a14fc2', 2);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `presensi`
--
ALTER TABLE `presensi`
  ADD CONSTRAINT `presensi_jemaat` FOREIGN KEY (`id_jemaat`) REFERENCES `jemaat` (`id`),
  ADD CONSTRAINT `presensi_kebaktian` FOREIGN KEY (`id_kebaktian`) REFERENCES `kebaktian` (`id`);

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_group` FOREIGN KEY (`id_group`) REFERENCES `group` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
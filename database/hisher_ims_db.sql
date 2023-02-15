-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3308
-- Generation Time: Feb 15, 2023 at 12:22 AM
-- Server version: 5.7.31
-- PHP Version: 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hisher_ims_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `app_category`
--

DROP TABLE IF EXISTS `app_category`;
CREATE TABLE IF NOT EXISTS `app_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` varchar(255) NOT NULL,
  `created_date` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=100008 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `app_category`
--

INSERT INTO `app_category` (`id`, `name`, `description`, `created_date`) VALUES
(100001, 'Oil', 'Conventional, Part synthetic, Full synthetic, and etc', '2022-01-12 07:05:03.827721'),
(100002, 'Moto Engine Parts', 'Moto Engine Parts', '2022-01-12 07:06:07.612028'),
(100003, 'Moto Body and Frame', 'Moto Body and Frame', '2022-01-12 07:53:01.509124'),
(100004, 'Moto Ignition Parts', 'Moto Ignition Parts', '2022-01-13 02:11:43.840794'),
(100005, 'Moto Riding & Protective Gear', 'Moto Riding & Protective Gear', '2022-01-14 03:35:39.792971'),
(100006, 'Moto Mirrors and Components', 'Moto Mirrors and Components', '2022-01-15 13:31:46.510838'),
(100007, 'Steering Wheel', 'Steering Wheels', '2022-01-24 17:11:06.979845');

-- --------------------------------------------------------

--
-- Table structure for table `app_product`
--

DROP TABLE IF EXISTS `app_product`;
CREATE TABLE IF NOT EXISTS `app_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `img` varchar(100) DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `brand` varchar(50) NOT NULL,
  `description` varchar(255) NOT NULL,
  `created_date` datetime(6) NOT NULL,
  `category_id` int(11) NOT NULL,
  `supplier_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `app_product_category_id_023742a5` (`category_id`),
  KEY `app_product_supplier_id_d98de20e` (`supplier_id`)
) ENGINE=MyISAM AUTO_INCREMENT=100016 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `app_product`
--

INSERT INTO `app_product` (`id`, `img`, `name`, `brand`, `description`, `created_date`, `category_id`, `supplier_id`) VALUES
(100001, 'media/images/images_12_utrgok', 'Honda SCOOTER Motorcyle Oil 10W- 30MB', 'Honda', 'Gasoline Motorcycle Oil \r\nApplicable for : Automatic/ Scooter Motorcyle\r\nContent: 0.8L\r\nSL 10W- 30MB\r\nHonda Genuine Oil 4T SL 10W30 MB is a premium friction modified gasoline engine oil for four-stroke motorcycles.', '2022-01-12 07:09:03.927944', 100001, 100001),
(100002, 'media/images/images_11_vahz2y', 'Scooter Gear Oil Shell', 'Shell', 'Shell  Advance \r\nScooter Gear Oil\r\n15W-40\r\nContent: 120ML', '2022-01-12 07:13:07.421445', 100001, 100003),
(100003, 'media/images/8d6f04f21ee4c05a9e04224c01b9310e_qnheyh', 'Yamalube Motorcycle Oil Automatic Oil', 'Yamaha', '4 STROKE ENGINE OIL\r\n API Service SL\r\n JASO MB\r\n SAE 20W-40', '2022-01-12 07:14:43.332643', 100001, 100001),
(100004, 'media/images/images_10_hv5wy1', 'Motul Scooter LE 1Liter', 'Motul', '100% Synthetic low emission high performance motor oil designed to meet today’s 4-stroke engines for powerful and recent scooters for which manufacturers recommends JASO MB specification. It provides effective control of piston deposit, wear and bearing c', '2022-01-12 07:36:07.865812', 100001, 100003),
(100005, '', 'Shell Advance 4T AX7 Scooter 10W-40 800Ml', 'Shell', 'Shell Advance 4T AX7 Scooter is an ideal oil for modern 4-stroke scooters which tend to undergo high stress from daily commutes in start-stop traffic, particularly in hot and humid climates.\r\nShell Advance 4T AX7 Scooter offers excellent oil-performance r', '2022-01-12 07:42:55.216341', 100001, 100003),
(100006, 'media/images/18bbd7f18a018b16009fc52ac0ecb7ee_a3mcim', 'DENSO STARTER RELAY(156700-3220)12v', 'DENSO', 'High quality \r\nDenso starter relay \r\nMODEL-156700-3220 (12v)\r\nUse to start your engine\r\nCompatible to yamaha mio i 125', '2022-01-12 07:47:31.376507', 100002, 100002),
(100007, 'media/images/cc40ad47be403b676a0a48f7b2333907_u1j9pk', 'Mio Switch Handle Kitaco (RIGHT)', 'Kitaco', 'Brand: Kitaco\r\nDescription: Right Switch Handle\r\nQty: 1pc\r\nCOMPATIBLE FOR:\r\nMio I125\r\nMio Sporty\r\nMio Soul', '2022-01-12 07:53:58.328332', 100003, 100002),
(100008, 'media/images/download_1_nfw8zl', '6 pin cdi socket', 'Generic', '6 pin cdi socket\r\ncan use to motorcycle model', '2022-01-12 07:55:53.150928', 100002, 100002),
(100009, 'media/images/40e31a28bb0466c94f1a8e642f306e55_uxefyx', 'Starter relay socket 4 or 5 pin', 'Generic', 'Relay socket for\r\nMulti purpose relay\r\ncan use to 4 pin or 5 pin\r\nstarter relay\r\nlike denso 4 pin and omron\r\n5 pin starter relay', '2022-01-12 07:58:46.630213', 100003, 100002),
(100010, 'media/images/e1ee8af8e12cf7b8019a44ea5f65ae3b_qddffz', 'Yamalube Blue Core 1 Liter Scooter Oil', 'Yamaha', 'YAMALUBE  BLUE CORE\r\n4 Stroke Motor Oil\r\nAPI Service SL\r\nSAE 10-40\r\nThe Winning Formula for Automatic Engines.\r\nFully synthetic base for AUTOMATIC motorcycle only.', '2022-01-14 04:53:13.017631', 100001, 100003),
(100011, 'media/images/029f9ecbbc5db57154b4df33ae82598c_vmwev4', 'Motul Scooter Gear Oil', 'Motul', 'Product Features:\r\n- Very high lubricating power to withstand successive full speed start-ups and stops in city driving conditions.\r\n- Oil film thickness remains sufficient in the various driving conditions, idle, sharp', '2022-01-14 05:02:27.592163', 100001, 100001),
(100012, 'media/images/8795482c00f60856b6491c96ddb4d79c_raxobr', 'Kixx Scooter Gear Oil 120Ml', 'Kixx', 'Kixx Scooter Gear Oil\r\nAPI GL-5\r\n80W-90', '2022-01-15 01:39:51.782816', 100001, 100001),
(100013, 'media/images/lihua_nnlyiq', 'Lihua Rectifier Fullwave', 'Lihua', 'Brand: Lihua\r\nModel No : GY6\r\nDescription: Voltage Regulator/Rectifier 5pin\r\nXPost Integrated\r\n  (min 0.1kg, max 5kg)\r\nJ&T Express\r\n  (max 20kg)\r\nBlack Arrow Integrated\r\n  (max 5kg)\r\nBlack Arrow (Own Packaging)\r\n  (max 50kg)', '2022-01-19 03:10:47.044302', 100004, 100002),
(100014, '', 'Yamalube Gear Oil 100ML', 'Yamaha', 'This Gear Oil is specially formulated and designed with reflecting the latest technology using additive to absorb extreme pressure as a result of heavy load and high speed usage.', '2022-01-19 11:51:08.947169', 100001, 100001),
(100015, '', 'Steering Wheel', 'Honda', 'Honda Steering Wheel', '2022-01-24 17:13:49.904362', 100007, 100009);

-- --------------------------------------------------------

--
-- Table structure for table `app_saleslineitem`
--

DROP TABLE IF EXISTS `app_saleslineitem`;
CREATE TABLE IF NOT EXISTS `app_saleslineitem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_name` varchar(50) NOT NULL,
  `qty` int(11) NOT NULL,
  `price` decimal(11,2) NOT NULL,
  `amount` decimal(11,2) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `sales_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `app_saleslineitem_product_id_40c5a17b` (`product_id`),
  KEY `app_saleslineitem_sales_id_fc390ccc` (`sales_id`)
) ENGINE=MyISAM AUTO_INCREMENT=100020 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `app_saleslineitem`
--

INSERT INTO `app_saleslineitem` (`id`, `product_name`, `qty`, `price`, `amount`, `product_id`, `sales_id`) VALUES
(100001, 'Yamalube Motorcycle Oil Automatic Oil', 1, '295.00', '295.00', 100003, 100001),
(100002, 'Motul Scooter Gear Oil', 1, '189.00', '189.00', 100011, 100002),
(100003, 'DENSO STARTER RELAY(156700-3220)12v', 1, '179.00', '179.00', 100006, 100002),
(100004, 'DENSO STARTER RELAY(156700-3220)12v', 1, '179.00', '179.00', 100006, 100003),
(100005, 'Yamalube Gear Oil 100ML', 2, '75.00', '150.00', 100014, 100004),
(100006, 'Motul Scooter Gear Oil', 2, '189.00', '378.00', 100011, 100004),
(100007, 'DENSO STARTER RELAY(156700-3220)12v', 5, '179.00', '895.00', 100006, 100005),
(100008, 'Motul Scooter Gear Oil', 4, '189.00', '756.00', 100011, 100005),
(100009, '6 pin cdi socket', 2, '79.00', '158.00', 100008, 100006),
(100010, 'Yamalube Motorcycle Oil Automatic Oil', 1, '295.00', '295.00', 100003, 100006),
(100011, 'Motul Scooter Gear Oil', 1, '189.00', '189.00', 100011, 100006),
(100012, 'Honda SCOOTER Motorcyle Oil 10W- 30MB', 10, '265.00', '2650.00', 100001, 100007),
(100013, 'Kixx Scooter Gear Oil 120Ml', 2, '65.00', '130.00', 100012, 100008),
(100014, 'Yamalube Gear Oil 100ML', 1, '75.00', '75.00', 100014, 100008),
(100015, 'Yamalube Motorcycle Oil Automatic Oil', 1, '295.00', '295.00', 100003, 100009),
(100016, 'Kixx Scooter Gear Oil 120Ml', 2, '65.00', '130.00', 100012, 100009),
(100017, 'Motul Scooter Gear Oil', 2, '189.00', '378.00', 100011, 100010),
(100018, 'Yamalube Gear Oil 100ML', 2, '75.00', '150.00', 100014, 100011),
(100019, 'DENSO STARTER RELAY(156700-3220)12v', 10, '179.00', '1790.00', 100006, 100011);

-- --------------------------------------------------------

--
-- Table structure for table `app_salesorder`
--

DROP TABLE IF EXISTS `app_salesorder`;
CREATE TABLE IF NOT EXISTS `app_salesorder` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `buyer_name` varchar(50) NOT NULL,
  `date` date NOT NULL,
  `due_date` date NOT NULL,
  `message` longtext,
  `total_amount` decimal(11,2) DEFAULT NULL,
  `status` varchar(10) NOT NULL,
  `created_date` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=100012 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `app_salesorder`
--

INSERT INTO `app_salesorder` (`id`, `buyer_name`, `date`, `due_date`, `message`, `total_amount`, `status`, `created_date`) VALUES
(100001, 'James Bryan', '2022-01-21', '2022-01-21', 'James Bryan', '295.00', 'Approved', '2022-01-21 20:57:41.227864'),
(100002, 'Ken Douma', '2022-01-21', '2022-01-22', 'Ken Douma\r\n09950291885', '368.00', 'Approved', '2022-01-21 21:05:32.511442'),
(100003, 'John Lee', '2022-01-21', '2022-01-26', 'John Lee\r\n09176542341', '179.00', 'Approved', '2022-01-21 21:14:53.697777'),
(100004, 'Christopher Robins', '2022-01-21', '2022-01-26', 'Christopher Robins\r\n09759832145', '528.00', 'Cancelled', '2022-01-21 21:18:05.718299'),
(100005, 'Ryan Gutierrez', '2022-01-21', '2022-01-25', 'Ryan Gutierrez\r\n091754325641', '1651.00', 'Approved', '2022-01-21 21:19:46.636845'),
(100006, 'Joseph Esquerra', '2022-01-21', '2022-01-26', 'Joseph Esquerra\r\n09950281765', '642.00', 'Approved', '2022-01-21 21:25:09.251678'),
(100007, 'John Carter', '2022-01-21', '2022-01-24', 'John Carter\r\n09175654321', '2650.00', 'Approved', '2022-01-21 21:29:15.230507'),
(100008, 'James Cojuangco', '2022-01-23', '2022-01-27', 'James Cojuango\r\n09760102345', '205.00', 'Approved', '2022-01-23 19:13:03.497615'),
(100009, 'Robert Cruz', '2022-01-24', '2022-01-26', 'Robert Cruz\r\n09950291838\r\nImus, Cavite', '425.00', 'Approved', '2022-01-24 17:19:20.858257'),
(100010, 'Aldrian Barias', '2023-02-10', '2023-02-11', '', '378.00', 'Approved', '2023-02-10 16:27:08.512406'),
(100011, 'James Brian', '2023-02-11', '2023-02-15', '', '1940.00', 'Approved', '2023-02-11 10:06:33.960696');

-- --------------------------------------------------------

--
-- Table structure for table `app_stock`
--

DROP TABLE IF EXISTS `app_stock`;
CREATE TABLE IF NOT EXISTS `app_stock` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `qty` int(11) NOT NULL,
  `retail_price` decimal(11,2) NOT NULL,
  `purch_price` decimal(11,2) NOT NULL,
  `reorder_qty` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `app_stock_product_id_5884f433` (`product_id`)
) ENGINE=MyISAM AUTO_INCREMENT=100010 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `app_stock`
--

INSERT INTO `app_stock` (`id`, `qty`, `retail_price`, `purch_price`, `reorder_qty`, `product_id`) VALUES
(100001, 17, '295.00', '265.00', 10, 100003),
(100002, 36, '75.00', '65.00', 20, 100014),
(100003, 21, '65.00', '45.00', 10, 100012),
(100004, 31, '179.00', '150.00', 20, 100006),
(100005, 12, '189.00', '159.00', 10, 100011),
(100006, 18, '79.00', '59.00', 10, 100008),
(100007, 50, '75.00', '65.00', 10, 100002),
(100008, 10, '265.00', '245.00', 10, 100001),
(100009, 20, '1500.00', '1350.00', 20, 100015);

-- --------------------------------------------------------

--
-- Table structure for table `app_stockin`
--

DROP TABLE IF EXISTS `app_stockin`;
CREATE TABLE IF NOT EXISTS `app_stockin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_name` varchar(50) NOT NULL,
  `supplier_name` varchar(50) NOT NULL,
  `previous_qty` int(11) NOT NULL,
  `qty_added` int(11) NOT NULL,
  `total_qty` int(11) NOT NULL,
  `purch_price` decimal(11,2) NOT NULL,
  `total_purchase` decimal(11,2) NOT NULL,
  `remarks` varchar(255) NOT NULL,
  `created_date` datetime(6) NOT NULL,
  `encoder` varchar(50) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `app_stockin_product_id_395083a7` (`product_id`)
) ENGINE=MyISAM AUTO_INCREMENT=100011 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `app_stockin`
--

INSERT INTO `app_stockin` (`id`, `product_name`, `supplier_name`, `previous_qty`, `qty_added`, `total_qty`, `purch_price`, `total_purchase`, `remarks`, `created_date`, `encoder`, `product_id`) VALUES
(100001, 'Yamalube Motorcycle Oil Automatic Oil', 'Justino Corporation', 0, 20, 20, '265.00', '5300.00', '20 Added', '2022-01-21 20:56:35.656229', 'aldrian500', 100003),
(100002, 'Yamalube Gear Oil 100ML', 'Justino Corporation', 0, 40, 40, '65.00', '2600.00', '', '2022-01-21 21:00:32.212198', 'aldrian500', 100014),
(100003, 'Kixx Scooter Gear Oil 120Ml', 'Justino Corporation', 0, 25, 25, '45.00', '1125.00', '', '2022-01-21 21:01:14.708135', 'aldrian500', 100012),
(100004, 'DENSO STARTER RELAY(156700-3220)12v', 'RHM Motorycle Parts and Accessories.', 0, 50, 50, '150.00', '7500.00', '50 Stocks', '2022-01-21 21:02:10.116038', 'aldrian500', 100006),
(100005, 'Motul Scooter Gear Oil', 'Justino Corporation', 0, 20, 20, '159.00', '3180.00', '20 Motul Scooter Gear Oil', '2022-01-21 21:03:44.866074', 'aldrian500', 100011),
(100006, '6 pin cdi socket', 'RHM Motorycle Parts and Accessories.', 0, 20, 20, '59.00', '1180.00', '', '2022-01-21 21:23:02.299890', 'aldrian500', 100008),
(100007, 'Scooter Gear Oil Shell', 'Triple A', 0, 50, 50, '65.00', '3250.00', '', '2022-01-21 21:24:04.151429', 'aldrian500', 100002),
(100008, 'Honda SCOOTER Motorcyle Oil 10W- 30MB', 'Justino Corporation', 0, 20, 20, '245.00', '4900.00', '20 Stocks', '2022-01-21 21:28:29.281492', 'aldrian500', 100001),
(100009, 'Steering Wheel', 'Jeremy Brias', 0, 20, 20, '1350.00', '27000.00', '20 stocks', '2022-01-24 17:15:01.784508', 'ianbarias5', 100015),
(100010, 'Steering Wheel', 'Jeremy Brias', 18, 2, 20, '1350.00', '2700.00', '', '2023-02-11 10:10:54.042798', 'admin', 100015);

-- --------------------------------------------------------

--
-- Table structure for table `app_stockout`
--

DROP TABLE IF EXISTS `app_stockout`;
CREATE TABLE IF NOT EXISTS `app_stockout` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_name` varchar(50) NOT NULL,
  `supplier_name` varchar(50) NOT NULL,
  `previous_qty` int(11) NOT NULL,
  `qty_selled` int(11) NOT NULL,
  `qty_left` int(11) NOT NULL,
  `retail_price` decimal(11,2) NOT NULL,
  `total_sales` decimal(11,2) NOT NULL,
  `created_date` datetime(6) NOT NULL,
  `encoder` varchar(50) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `app_stockout_product_id_c9874002` (`product_id`)
) ENGINE=MyISAM AUTO_INCREMENT=100018 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `app_stockout`
--

INSERT INTO `app_stockout` (`id`, `product_name`, `supplier_name`, `previous_qty`, `qty_selled`, `qty_left`, `retail_price`, `total_sales`, `created_date`, `encoder`, `product_id`) VALUES
(100001, 'Yamalube Motorcycle Oil Automatic Oil', 'Justino Corporation', 20, 1, 19, '295.00', '295.00', '2022-01-21 20:57:41.778131', 'aldrian500', 100003),
(100002, 'Motul Scooter Gear Oil', 'Justino Corporation', 20, 1, 19, '189.00', '189.00', '2022-01-21 21:10:36.371676', 'aldrian500', 100011),
(100003, 'DENSO STARTER RELAY(156700-3220)12v', 'RHM Motorycle Parts and Accessories.', 48, 1, 47, '179.00', '179.00', '2022-01-21 21:10:36.797380', 'aldrian500', 100006),
(100004, 'DENSO STARTER RELAY(156700-3220)12v', 'RHM Motorycle Parts and Accessories.', 47, 1, 46, '179.00', '179.00', '2022-01-21 21:15:39.525947', 'aldrian500', 100006),
(100005, 'DENSO STARTER RELAY(156700-3220)12v', 'RHM Motorycle Parts and Accessories.', 46, 5, 41, '179.00', '895.00', '2022-01-21 21:19:47.151568', 'aldrian500', 100006),
(100006, 'Motul Scooter Gear Oil', 'Justino Corporation', 19, 4, 15, '189.00', '756.00', '2022-01-21 21:19:47.744010', 'aldrian500', 100011),
(100007, '6 pin cdi socket', 'RHM Motorycle Parts and Accessories.', 20, 2, 18, '79.00', '158.00', '2022-01-21 21:25:29.945286', 'aldrian500', 100008),
(100008, 'Yamalube Motorcycle Oil Automatic Oil', 'Justino Corporation', 19, 1, 18, '295.00', '295.00', '2022-01-21 21:25:30.367780', 'aldrian500', 100003),
(100009, 'Motul Scooter Gear Oil', 'Justino Corporation', 15, 1, 14, '189.00', '189.00', '2022-01-21 21:25:30.792282', 'aldrian500', 100011),
(100010, 'Honda SCOOTER Motorcyle Oil 10W- 30MB', 'Justino Corporation', 20, 10, 10, '265.00', '2650.00', '2022-01-21 21:29:15.814342', 'aldrian500', 100001),
(100011, 'Kixx Scooter Gear Oil 120Ml', 'Justino Corporation', 25, 2, 23, '65.00', '130.00', '2022-01-23 19:14:39.085780', 'admin', 100012),
(100012, 'Yamalube Gear Oil 100ML', 'Justino Corporation', 39, 1, 38, '75.00', '75.00', '2022-01-23 19:14:39.501936', 'admin', 100014),
(100013, 'Yamalube Motorcycle Oil Automatic Oil', 'Justino Corporation', 18, 1, 17, '295.00', '295.00', '2022-01-24 17:20:29.227078', 'ianbarias5', 100003),
(100014, 'Kixx Scooter Gear Oil 120Ml', 'Justino Corporation', 23, 2, 21, '65.00', '130.00', '2022-01-24 17:20:29.230079', 'ianbarias5', 100012),
(100015, 'Motul Scooter Gear Oil', 'Justino Corporation', 14, 2, 12, '189.00', '378.00', '2023-02-10 16:27:19.654413', 'admin', 100011),
(100016, 'Yamalube Gear Oil 100ML', 'Justino Corporation', 38, 2, 36, '75.00', '150.00', '2023-02-11 10:06:33.991702', 'admin', 100014),
(100017, 'DENSO STARTER RELAY(156700-3220)12v', 'RHM Motorycle Parts and Accessories.', 41, 10, 31, '179.00', '1790.00', '2023-02-11 10:06:34.004705', 'admin', 100006);

-- --------------------------------------------------------

--
-- Table structure for table `app_stockpullout`
--

DROP TABLE IF EXISTS `app_stockpullout`;
CREATE TABLE IF NOT EXISTS `app_stockpullout` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_name` varchar(50) NOT NULL,
  `supplier_name` varchar(50) NOT NULL,
  `previous_qty` int(11) NOT NULL,
  `qty_pullout` int(11) NOT NULL,
  `qty_left` int(11) NOT NULL,
  `purch_price` decimal(11,2) NOT NULL,
  `total_pullout` decimal(11,2) NOT NULL,
  `remarks` varchar(255) NOT NULL,
  `created_date` datetime(6) NOT NULL,
  `encoder` varchar(50) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `app_stockpullout_product_id_38a19349` (`product_id`)
) ENGINE=MyISAM AUTO_INCREMENT=100004 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `app_stockpullout`
--

INSERT INTO `app_stockpullout` (`id`, `product_name`, `supplier_name`, `previous_qty`, `qty_pullout`, `qty_left`, `purch_price`, `total_pullout`, `remarks`, `created_date`, `encoder`, `product_id`) VALUES
(100001, 'DENSO STARTER RELAY(156700-3220)12v', 'RHM Motorycle Parts and Accessories.', 50, 2, 48, '150.00', '300.00', '2 Damaged Products', '2022-01-21 21:04:04.876106', 'aldrian500', 100006),
(100002, 'Yamalube Gear Oil 100ML', 'Justino Corporation', 40, 1, 39, '65.00', '65.00', '1 damaged', '2022-01-21 21:27:04.371419', 'aldrian500', 100014),
(100003, 'Steering Wheel', 'Jeremy Brias', 20, 2, 18, '1350.00', '2700.00', '2 Damaged Products', '2022-01-24 17:15:52.523843', 'ianbarias5', 100015);

-- --------------------------------------------------------

--
-- Table structure for table `app_supplier`
--

DROP TABLE IF EXISTS `app_supplier`;
CREATE TABLE IF NOT EXISTS `app_supplier` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `address` varchar(255) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phonenum` varchar(50) NOT NULL,
  `created_date` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=100011 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `app_supplier`
--

INSERT INTO `app_supplier` (`id`, `name`, `address`, `email`, `phonenum`, `created_date`) VALUES
(100001, 'Justino Corporation', '2461 Sunrise St., Tambo, Paranaque City, Metro Manila 1700, Philippines', 'sales@justinocorporation.com', '9950291856', '2022-01-12 06:54:32.967387'),
(100002, 'RHM Motorycle Parts and Accessories.', 'Palicon IV Imus City, Cavite', 'markreyes6@gmail.com', '', '2022-01-12 06:55:09.430291'),
(100003, 'Triple A', '4114 Dasmariñas, Philippines', 'albertmorate21@yahoo.com', '9239038313', '2022-01-12 06:57:27.430186'),
(100004, 'Lucky Se7en Inc.', '20 Narra Rd, San Antonio, San Pedro, 4023 Laguna', 'hrannperez.lsi@gmail.com', '9452382265', '2022-01-12 06:59:47.637059'),
(100005, 'Battery Masters Inc.', '337, Alabang Zapote Road, Barangay Pamplona, Las Piñas, 1720 Metro Manila', 'edwingracia15@gmail.com', '9158340730', '2022-01-12 07:02:54.957311'),
(100006, 'R2A', 'R2A', 'r2a2015@gmail.com', '', '2022-01-12 07:18:51.442802'),
(100007, 'Jay Moto Parts and Accessories', 'Palico IV Imus City, Cavite', 'jaymoto2005@gmail.com', '9950291867', '2022-01-13 02:12:53.310987'),
(100008, 'AT Corporation', 'Palico IV Imus City, Cavite', 'sales@atcorporation.com', '9950291865', '2022-01-15 13:53:20.806547'),
(100009, 'Jeremy Brias', 'Bacoor Cavite', 'jeremybrias@gmail.com', '9950291845', '2022-01-24 11:46:51.793325');

-- --------------------------------------------------------

--
-- Table structure for table `app_userprofile`
--

DROP TABLE IF EXISTS `app_userprofile`;
CREATE TABLE IF NOT EXISTS `app_userprofile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phonenum` varchar(50) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `avatar` varchar(100) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=100005 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `app_userprofile`
--

INSERT INTO `app_userprofile` (`id`, `phonenum`, `gender`, `avatar`, `user_id`) VALUES
(100001, '9950291848', 'Male', 'media/images/FB_IMG_1642153086468_y3pkgx', 100001),
(100002, '', 'Male', 'media/images/251860386_10220588091800823_7048196429209819771_n_pkbkfc', 100002),
(100003, '9760102815', 'Male', '', 100003),
(100004, '0988782121', 'Male', '', 100004);

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `auth_group`
--

INSERT INTO `auth_group` (`id`, `name`) VALUES
(4, 'Admin'),
(3, 'Staff');

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_group_id_b120cbf9` (`group_id`),
  KEY `auth_group_permissions_permission_id_84c5c92e` (`permission_id`)
) ENGINE=MyISAM AUTO_INCREMENT=181 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `auth_group_permissions`
--

INSERT INTO `auth_group_permissions` (`id`, `group_id`, `permission_id`) VALUES
(120, 3, 612),
(119, 3, 611),
(118, 3, 610),
(117, 3, 609),
(116, 3, 608),
(115, 3, 607),
(114, 3, 606),
(113, 3, 605),
(112, 3, 604),
(111, 3, 603),
(110, 3, 602),
(109, 3, 601),
(108, 3, 600),
(107, 3, 599),
(106, 3, 598),
(105, 3, 597),
(104, 3, 596),
(103, 3, 595),
(102, 3, 594),
(101, 3, 593),
(100, 3, 592),
(99, 3, 591),
(98, 3, 590),
(97, 3, 589),
(96, 3, 588),
(95, 3, 587),
(94, 3, 586),
(93, 3, 585),
(92, 3, 584),
(91, 3, 583),
(90, 3, 582),
(89, 3, 581),
(88, 3, 580),
(87, 3, 579),
(86, 3, 578),
(85, 3, 577),
(84, 3, 24),
(83, 3, 23),
(82, 3, 22),
(81, 3, 21),
(80, 3, 20),
(79, 3, 19),
(78, 3, 18),
(77, 3, 17),
(76, 3, 16),
(75, 3, 15),
(74, 3, 14),
(73, 3, 13),
(72, 3, 12),
(71, 3, 11),
(70, 3, 10),
(69, 3, 9),
(68, 3, 8),
(67, 3, 7),
(66, 3, 6),
(65, 3, 5),
(64, 3, 4),
(63, 3, 3),
(62, 3, 2),
(61, 3, 1),
(121, 4, 1),
(122, 4, 2),
(123, 4, 3),
(124, 4, 4),
(125, 4, 5),
(126, 4, 6),
(127, 4, 7),
(128, 4, 8),
(129, 4, 9),
(130, 4, 10),
(131, 4, 11),
(132, 4, 12),
(133, 4, 13),
(134, 4, 14),
(135, 4, 15),
(136, 4, 16),
(137, 4, 17),
(138, 4, 18),
(139, 4, 19),
(140, 4, 20),
(141, 4, 21),
(142, 4, 22),
(143, 4, 23),
(144, 4, 24),
(145, 4, 577),
(146, 4, 578),
(147, 4, 579),
(148, 4, 580),
(149, 4, 581),
(150, 4, 582),
(151, 4, 583),
(152, 4, 584),
(153, 4, 585),
(154, 4, 586),
(155, 4, 587),
(156, 4, 588),
(157, 4, 589),
(158, 4, 590),
(159, 4, 591),
(160, 4, 592),
(161, 4, 593),
(162, 4, 594),
(163, 4, 595),
(164, 4, 596),
(165, 4, 597),
(166, 4, 598),
(167, 4, 599),
(168, 4, 600),
(169, 4, 601),
(170, 4, 602),
(171, 4, 603),
(172, 4, 604),
(173, 4, 605),
(174, 4, 606),
(175, 4, 607),
(176, 4, 608),
(177, 4, 609),
(178, 4, 610),
(179, 4, 611),
(180, 4, 612);

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  KEY `auth_permission_content_type_id_2f476e4b` (`content_type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=709 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add supplier', 7, 'add_supplier'),
(26, 'Can change supplier', 7, 'change_supplier'),
(27, 'Can delete supplier', 7, 'delete_supplier'),
(28, 'Can view supplier', 7, 'view_supplier'),
(29, 'Can add category', 8, 'add_category'),
(30, 'Can change category', 8, 'change_category'),
(31, 'Can delete category', 8, 'delete_category'),
(32, 'Can view category', 8, 'view_category'),
(33, 'Can add user profile', 9, 'add_userprofile'),
(34, 'Can change user profile', 9, 'change_userprofile'),
(35, 'Can delete user profile', 9, 'delete_userprofile'),
(36, 'Can view user profile', 9, 'view_userprofile'),
(37, 'Can add user profile', 10, 'add_userprofile'),
(38, 'Can change user profile', 10, 'change_userprofile'),
(39, 'Can delete user profile', 10, 'delete_userprofile'),
(40, 'Can view user profile', 10, 'view_userprofile'),
(41, 'Can add user profile', 11, 'add_userprofile'),
(42, 'Can change user profile', 11, 'change_userprofile'),
(43, 'Can delete user profile', 11, 'delete_userprofile'),
(44, 'Can view user profile', 11, 'view_userprofile'),
(45, 'Can add user profile', 12, 'add_userprofile'),
(46, 'Can change user profile', 12, 'change_userprofile'),
(47, 'Can delete user profile', 12, 'delete_userprofile'),
(48, 'Can view user profile', 12, 'view_userprofile'),
(49, 'Can add user profile', 13, 'add_userprofile'),
(50, 'Can change user profile', 13, 'change_userprofile'),
(51, 'Can delete user profile', 13, 'delete_userprofile'),
(52, 'Can view user profile', 13, 'view_userprofile'),
(53, 'Can add user profile', 14, 'add_userprofile'),
(54, 'Can change user profile', 14, 'change_userprofile'),
(55, 'Can delete user profile', 14, 'delete_userprofile'),
(56, 'Can view user profile', 14, 'view_userprofile'),
(57, 'Can add product', 15, 'add_product'),
(58, 'Can change product', 15, 'change_product'),
(59, 'Can delete product', 15, 'delete_product'),
(60, 'Can view product', 15, 'view_product'),
(61, 'Can add product', 16, 'add_product'),
(62, 'Can change product', 16, 'change_product'),
(63, 'Can delete product', 16, 'delete_product'),
(64, 'Can view product', 16, 'view_product'),
(65, 'Can add product', 17, 'add_product'),
(66, 'Can change product', 17, 'change_product'),
(67, 'Can delete product', 17, 'delete_product'),
(68, 'Can view product', 17, 'view_product'),
(69, 'Can add user profile', 18, 'add_userprofile'),
(70, 'Can change user profile', 18, 'change_userprofile'),
(71, 'Can delete user profile', 18, 'delete_userprofile'),
(72, 'Can view user profile', 18, 'view_userprofile'),
(73, 'Can add product', 19, 'add_product'),
(74, 'Can change product', 19, 'change_product'),
(75, 'Can delete product', 19, 'delete_product'),
(76, 'Can view product', 19, 'view_product'),
(77, 'Can add category', 20, 'add_category'),
(78, 'Can change category', 20, 'change_category'),
(79, 'Can delete category', 20, 'delete_category'),
(80, 'Can view category', 20, 'view_category'),
(81, 'Can add stock', 21, 'add_stock'),
(82, 'Can change stock', 21, 'change_stock'),
(83, 'Can delete stock', 21, 'delete_stock'),
(84, 'Can view stock', 21, 'view_stock'),
(85, 'Can add user profile', 22, 'add_userprofile'),
(86, 'Can change user profile', 22, 'change_userprofile'),
(87, 'Can delete user profile', 22, 'delete_userprofile'),
(88, 'Can view user profile', 22, 'view_userprofile'),
(89, 'Can add stock', 23, 'add_stock'),
(90, 'Can change stock', 23, 'change_stock'),
(91, 'Can delete stock', 23, 'delete_stock'),
(92, 'Can view stock', 23, 'view_stock'),
(93, 'Can add product', 24, 'add_product'),
(94, 'Can change product', 24, 'change_product'),
(95, 'Can delete product', 24, 'delete_product'),
(96, 'Can view product', 24, 'view_product'),
(97, 'Can add category', 25, 'add_category'),
(98, 'Can change category', 25, 'change_category'),
(99, 'Can delete category', 25, 'delete_category'),
(100, 'Can view category', 25, 'view_category'),
(101, 'Can add user profile', 26, 'add_userprofile'),
(102, 'Can change user profile', 26, 'change_userprofile'),
(103, 'Can delete user profile', 26, 'delete_userprofile'),
(104, 'Can view user profile', 26, 'view_userprofile'),
(105, 'Can add category', 27, 'add_category'),
(106, 'Can change category', 27, 'change_category'),
(107, 'Can delete category', 27, 'delete_category'),
(108, 'Can view category', 27, 'view_category'),
(109, 'Can add product', 28, 'add_product'),
(110, 'Can change product', 28, 'change_product'),
(111, 'Can delete product', 28, 'delete_product'),
(112, 'Can view product', 28, 'view_product'),
(113, 'Can add stock', 29, 'add_stock'),
(114, 'Can change stock', 29, 'change_stock'),
(115, 'Can delete stock', 29, 'delete_stock'),
(116, 'Can view stock', 29, 'view_stock'),
(117, 'Can add user profile', 30, 'add_userprofile'),
(118, 'Can change user profile', 30, 'change_userprofile'),
(119, 'Can delete user profile', 30, 'delete_userprofile'),
(120, 'Can view user profile', 30, 'view_userprofile'),
(121, 'Can add product', 31, 'add_product'),
(122, 'Can change product', 31, 'change_product'),
(123, 'Can delete product', 31, 'delete_product'),
(124, 'Can view product', 31, 'view_product'),
(125, 'Can add category', 32, 'add_category'),
(126, 'Can change category', 32, 'change_category'),
(127, 'Can delete category', 32, 'delete_category'),
(128, 'Can view category', 32, 'view_category'),
(129, 'Can add stock', 33, 'add_stock'),
(130, 'Can change stock', 33, 'change_stock'),
(131, 'Can delete stock', 33, 'delete_stock'),
(132, 'Can view stock', 33, 'view_stock'),
(133, 'Can add user profile', 34, 'add_userprofile'),
(134, 'Can change user profile', 34, 'change_userprofile'),
(135, 'Can delete user profile', 34, 'delete_userprofile'),
(136, 'Can view user profile', 34, 'view_userprofile'),
(137, 'Can add stock', 35, 'add_stock'),
(138, 'Can change stock', 35, 'change_stock'),
(139, 'Can delete stock', 35, 'delete_stock'),
(140, 'Can view stock', 35, 'view_stock'),
(141, 'Can add product', 36, 'add_product'),
(142, 'Can change product', 36, 'change_product'),
(143, 'Can delete product', 36, 'delete_product'),
(144, 'Can view product', 36, 'view_product'),
(145, 'Can add category', 37, 'add_category'),
(146, 'Can change category', 37, 'change_category'),
(147, 'Can delete category', 37, 'delete_category'),
(148, 'Can view category', 37, 'view_category'),
(149, 'Can add user profile', 38, 'add_userprofile'),
(150, 'Can change user profile', 38, 'change_userprofile'),
(151, 'Can delete user profile', 38, 'delete_userprofile'),
(152, 'Can view user profile', 38, 'view_userprofile'),
(153, 'Can add category', 39, 'add_category'),
(154, 'Can change category', 39, 'change_category'),
(155, 'Can delete category', 39, 'delete_category'),
(156, 'Can view category', 39, 'view_category'),
(157, 'Can add product', 40, 'add_product'),
(158, 'Can change product', 40, 'change_product'),
(159, 'Can delete product', 40, 'delete_product'),
(160, 'Can view product', 40, 'view_product'),
(161, 'Can add stock', 41, 'add_stock'),
(162, 'Can change stock', 41, 'change_stock'),
(163, 'Can delete stock', 41, 'delete_stock'),
(164, 'Can view stock', 41, 'view_stock'),
(165, 'Can add user profile', 42, 'add_userprofile'),
(166, 'Can change user profile', 42, 'change_userprofile'),
(167, 'Can delete user profile', 42, 'delete_userprofile'),
(168, 'Can view user profile', 42, 'view_userprofile'),
(169, 'Can add category', 43, 'add_category'),
(170, 'Can change category', 43, 'change_category'),
(171, 'Can delete category', 43, 'delete_category'),
(172, 'Can view category', 43, 'view_category'),
(173, 'Can add product', 44, 'add_product'),
(174, 'Can change product', 44, 'change_product'),
(175, 'Can delete product', 44, 'delete_product'),
(176, 'Can view product', 44, 'view_product'),
(177, 'Can add stock', 45, 'add_stock'),
(178, 'Can change stock', 45, 'change_stock'),
(179, 'Can delete stock', 45, 'delete_stock'),
(180, 'Can view stock', 45, 'view_stock'),
(181, 'Can add supplier', 46, 'add_supplier'),
(182, 'Can change supplier', 46, 'change_supplier'),
(183, 'Can delete supplier', 46, 'delete_supplier'),
(184, 'Can view supplier', 46, 'view_supplier'),
(185, 'Can add user profile', 47, 'add_userprofile'),
(186, 'Can change user profile', 47, 'change_userprofile'),
(187, 'Can delete user profile', 47, 'delete_userprofile'),
(188, 'Can view user profile', 47, 'view_userprofile'),
(189, 'Can add category', 48, 'add_category'),
(190, 'Can change category', 48, 'change_category'),
(191, 'Can delete category', 48, 'delete_category'),
(192, 'Can view category', 48, 'view_category'),
(193, 'Can add stock', 49, 'add_stock'),
(194, 'Can change stock', 49, 'change_stock'),
(195, 'Can delete stock', 49, 'delete_stock'),
(196, 'Can view stock', 49, 'view_stock'),
(197, 'Can add product', 50, 'add_product'),
(198, 'Can change product', 50, 'change_product'),
(199, 'Can delete product', 50, 'delete_product'),
(200, 'Can view product', 50, 'view_product'),
(201, 'Can add supplier', 51, 'add_supplier'),
(202, 'Can change supplier', 51, 'change_supplier'),
(203, 'Can delete supplier', 51, 'delete_supplier'),
(204, 'Can view supplier', 51, 'view_supplier'),
(205, 'Can add supplier', 52, 'add_supplier'),
(206, 'Can change supplier', 52, 'change_supplier'),
(207, 'Can delete supplier', 52, 'delete_supplier'),
(208, 'Can view supplier', 52, 'view_supplier'),
(209, 'Can add category', 53, 'add_category'),
(210, 'Can change category', 53, 'change_category'),
(211, 'Can delete category', 53, 'delete_category'),
(212, 'Can view category', 53, 'view_category'),
(213, 'Can add product', 54, 'add_product'),
(214, 'Can change product', 54, 'change_product'),
(215, 'Can delete product', 54, 'delete_product'),
(216, 'Can view product', 54, 'view_product'),
(217, 'Can add user profile', 55, 'add_userprofile'),
(218, 'Can change user profile', 55, 'change_userprofile'),
(219, 'Can delete user profile', 55, 'delete_userprofile'),
(220, 'Can view user profile', 55, 'view_userprofile'),
(221, 'Can add stock', 56, 'add_stock'),
(222, 'Can change stock', 56, 'change_stock'),
(223, 'Can delete stock', 56, 'delete_stock'),
(224, 'Can view stock', 56, 'view_stock'),
(225, 'Can add supplier', 57, 'add_supplier'),
(226, 'Can change supplier', 57, 'change_supplier'),
(227, 'Can delete supplier', 57, 'delete_supplier'),
(228, 'Can view supplier', 57, 'view_supplier'),
(229, 'Can add user profile', 58, 'add_userprofile'),
(230, 'Can change user profile', 58, 'change_userprofile'),
(231, 'Can delete user profile', 58, 'delete_userprofile'),
(232, 'Can view user profile', 58, 'view_userprofile'),
(233, 'Can add category', 59, 'add_category'),
(234, 'Can change category', 59, 'change_category'),
(235, 'Can delete category', 59, 'delete_category'),
(236, 'Can view category', 59, 'view_category'),
(237, 'Can add stock', 60, 'add_stock'),
(238, 'Can change stock', 60, 'change_stock'),
(239, 'Can delete stock', 60, 'delete_stock'),
(240, 'Can view stock', 60, 'view_stock'),
(241, 'Can add product', 61, 'add_product'),
(242, 'Can change product', 61, 'change_product'),
(243, 'Can delete product', 61, 'delete_product'),
(244, 'Can view product', 61, 'view_product'),
(245, 'Can add user profile', 62, 'add_userprofile'),
(246, 'Can change user profile', 62, 'change_userprofile'),
(247, 'Can delete user profile', 62, 'delete_userprofile'),
(248, 'Can view user profile', 62, 'view_userprofile'),
(249, 'Can add supplier', 63, 'add_supplier'),
(250, 'Can change supplier', 63, 'change_supplier'),
(251, 'Can delete supplier', 63, 'delete_supplier'),
(252, 'Can view supplier', 63, 'view_supplier'),
(253, 'Can add stock', 64, 'add_stock'),
(254, 'Can change stock', 64, 'change_stock'),
(255, 'Can delete stock', 64, 'delete_stock'),
(256, 'Can view stock', 64, 'view_stock'),
(257, 'Can add category', 65, 'add_category'),
(258, 'Can change category', 65, 'change_category'),
(259, 'Can delete category', 65, 'delete_category'),
(260, 'Can view category', 65, 'view_category'),
(261, 'Can add product', 66, 'add_product'),
(262, 'Can change product', 66, 'change_product'),
(263, 'Can delete product', 66, 'delete_product'),
(264, 'Can view product', 66, 'view_product'),
(265, 'Can add user profile', 67, 'add_userprofile'),
(266, 'Can change user profile', 67, 'change_userprofile'),
(267, 'Can delete user profile', 67, 'delete_userprofile'),
(268, 'Can view user profile', 67, 'view_userprofile'),
(269, 'Can add product', 68, 'add_product'),
(270, 'Can change product', 68, 'change_product'),
(271, 'Can delete product', 68, 'delete_product'),
(272, 'Can view product', 68, 'view_product'),
(273, 'Can add category', 69, 'add_category'),
(274, 'Can change category', 69, 'change_category'),
(275, 'Can delete category', 69, 'delete_category'),
(276, 'Can view category', 69, 'view_category'),
(277, 'Can add supplier', 70, 'add_supplier'),
(278, 'Can change supplier', 70, 'change_supplier'),
(279, 'Can delete supplier', 70, 'delete_supplier'),
(280, 'Can view supplier', 70, 'view_supplier'),
(281, 'Can add stock', 71, 'add_stock'),
(282, 'Can change stock', 71, 'change_stock'),
(283, 'Can delete stock', 71, 'delete_stock'),
(284, 'Can view stock', 71, 'view_stock'),
(285, 'Can add user profile', 72, 'add_userprofile'),
(286, 'Can change user profile', 72, 'change_userprofile'),
(287, 'Can delete user profile', 72, 'delete_userprofile'),
(288, 'Can view user profile', 72, 'view_userprofile'),
(289, 'Can add product', 73, 'add_product'),
(290, 'Can change product', 73, 'change_product'),
(291, 'Can delete product', 73, 'delete_product'),
(292, 'Can view product', 73, 'view_product'),
(293, 'Can add category', 74, 'add_category'),
(294, 'Can change category', 74, 'change_category'),
(295, 'Can delete category', 74, 'delete_category'),
(296, 'Can view category', 74, 'view_category'),
(297, 'Can add stock', 75, 'add_stock'),
(298, 'Can change stock', 75, 'change_stock'),
(299, 'Can delete stock', 75, 'delete_stock'),
(300, 'Can view stock', 75, 'view_stock'),
(301, 'Can add supplier', 76, 'add_supplier'),
(302, 'Can change supplier', 76, 'change_supplier'),
(303, 'Can delete supplier', 76, 'delete_supplier'),
(304, 'Can view supplier', 76, 'view_supplier'),
(305, 'Can add user profile', 77, 'add_userprofile'),
(306, 'Can change user profile', 77, 'change_userprofile'),
(307, 'Can delete user profile', 77, 'delete_userprofile'),
(308, 'Can view user profile', 77, 'view_userprofile'),
(309, 'Can add stock', 78, 'add_stock'),
(310, 'Can change stock', 78, 'change_stock'),
(311, 'Can delete stock', 78, 'delete_stock'),
(312, 'Can view stock', 78, 'view_stock'),
(313, 'Can add product', 79, 'add_product'),
(314, 'Can change product', 79, 'change_product'),
(315, 'Can delete product', 79, 'delete_product'),
(316, 'Can view product', 79, 'view_product'),
(317, 'Can add category', 80, 'add_category'),
(318, 'Can change category', 80, 'change_category'),
(319, 'Can delete category', 80, 'delete_category'),
(320, 'Can view category', 80, 'view_category'),
(321, 'Can add supplier', 81, 'add_supplier'),
(322, 'Can change supplier', 81, 'change_supplier'),
(323, 'Can delete supplier', 81, 'delete_supplier'),
(324, 'Can view supplier', 81, 'view_supplier'),
(325, 'Can add user profile', 82, 'add_userprofile'),
(326, 'Can change user profile', 82, 'change_userprofile'),
(327, 'Can delete user profile', 82, 'delete_userprofile'),
(328, 'Can view user profile', 82, 'view_userprofile'),
(329, 'Can add stock', 83, 'add_stock'),
(330, 'Can change stock', 83, 'change_stock'),
(331, 'Can delete stock', 83, 'delete_stock'),
(332, 'Can view stock', 83, 'view_stock'),
(333, 'Can add category', 84, 'add_category'),
(334, 'Can change category', 84, 'change_category'),
(335, 'Can delete category', 84, 'delete_category'),
(336, 'Can view category', 84, 'view_category'),
(337, 'Can add product', 85, 'add_product'),
(338, 'Can change product', 85, 'change_product'),
(339, 'Can delete product', 85, 'delete_product'),
(340, 'Can view product', 85, 'view_product'),
(341, 'Can add supplier', 86, 'add_supplier'),
(342, 'Can change supplier', 86, 'change_supplier'),
(343, 'Can delete supplier', 86, 'delete_supplier'),
(344, 'Can view supplier', 86, 'view_supplier'),
(345, 'Can add user profile', 87, 'add_userprofile'),
(346, 'Can change user profile', 87, 'change_userprofile'),
(347, 'Can delete user profile', 87, 'delete_userprofile'),
(348, 'Can view user profile', 87, 'view_userprofile'),
(349, 'Can add product', 88, 'add_product'),
(350, 'Can change product', 88, 'change_product'),
(351, 'Can delete product', 88, 'delete_product'),
(352, 'Can view product', 88, 'view_product'),
(353, 'Can add category', 89, 'add_category'),
(354, 'Can change category', 89, 'change_category'),
(355, 'Can delete category', 89, 'delete_category'),
(356, 'Can view category', 89, 'view_category'),
(357, 'Can add supplier', 90, 'add_supplier'),
(358, 'Can change supplier', 90, 'change_supplier'),
(359, 'Can delete supplier', 90, 'delete_supplier'),
(360, 'Can view supplier', 90, 'view_supplier'),
(361, 'Can add stock', 91, 'add_stock'),
(362, 'Can change stock', 91, 'change_stock'),
(363, 'Can delete stock', 91, 'delete_stock'),
(364, 'Can view stock', 91, 'view_stock'),
(365, 'Can add user profile', 92, 'add_userprofile'),
(366, 'Can change user profile', 92, 'change_userprofile'),
(367, 'Can delete user profile', 92, 'delete_userprofile'),
(368, 'Can view user profile', 92, 'view_userprofile'),
(369, 'Can add supplier', 93, 'add_supplier'),
(370, 'Can change supplier', 93, 'change_supplier'),
(371, 'Can delete supplier', 93, 'delete_supplier'),
(372, 'Can view supplier', 93, 'view_supplier'),
(373, 'Can add product', 94, 'add_product'),
(374, 'Can change product', 94, 'change_product'),
(375, 'Can delete product', 94, 'delete_product'),
(376, 'Can view product', 94, 'view_product'),
(377, 'Can add category', 95, 'add_category'),
(378, 'Can change category', 95, 'change_category'),
(379, 'Can delete category', 95, 'delete_category'),
(380, 'Can view category', 95, 'view_category'),
(381, 'Can add stock', 96, 'add_stock'),
(382, 'Can change stock', 96, 'change_stock'),
(383, 'Can delete stock', 96, 'delete_stock'),
(384, 'Can view stock', 96, 'view_stock'),
(385, 'Can add user profile', 97, 'add_userprofile'),
(386, 'Can change user profile', 97, 'change_userprofile'),
(387, 'Can delete user profile', 97, 'delete_userprofile'),
(388, 'Can view user profile', 97, 'view_userprofile'),
(389, 'Can add supplier', 98, 'add_supplier'),
(390, 'Can change supplier', 98, 'change_supplier'),
(391, 'Can delete supplier', 98, 'delete_supplier'),
(392, 'Can view supplier', 98, 'view_supplier'),
(393, 'Can add stock', 99, 'add_stock'),
(394, 'Can change stock', 99, 'change_stock'),
(395, 'Can delete stock', 99, 'delete_stock'),
(396, 'Can view stock', 99, 'view_stock'),
(397, 'Can add category', 100, 'add_category'),
(398, 'Can change category', 100, 'change_category'),
(399, 'Can delete category', 100, 'delete_category'),
(400, 'Can view category', 100, 'view_category'),
(401, 'Can add product', 101, 'add_product'),
(402, 'Can change product', 101, 'change_product'),
(403, 'Can delete product', 101, 'delete_product'),
(404, 'Can view product', 101, 'view_product'),
(405, 'Can add user profile', 102, 'add_userprofile'),
(406, 'Can change user profile', 102, 'change_userprofile'),
(407, 'Can delete user profile', 102, 'delete_userprofile'),
(408, 'Can view user profile', 102, 'view_userprofile'),
(409, 'Can add supplier', 103, 'add_supplier'),
(410, 'Can change supplier', 103, 'change_supplier'),
(411, 'Can delete supplier', 103, 'delete_supplier'),
(412, 'Can view supplier', 103, 'view_supplier'),
(413, 'Can add product', 104, 'add_product'),
(414, 'Can change product', 104, 'change_product'),
(415, 'Can delete product', 104, 'delete_product'),
(416, 'Can view product', 104, 'view_product'),
(417, 'Can add category', 105, 'add_category'),
(418, 'Can change category', 105, 'change_category'),
(419, 'Can delete category', 105, 'delete_category'),
(420, 'Can view category', 105, 'view_category'),
(421, 'Can add stock', 106, 'add_stock'),
(422, 'Can change stock', 106, 'change_stock'),
(423, 'Can delete stock', 106, 'delete_stock'),
(424, 'Can view stock', 106, 'view_stock'),
(425, 'Can add user profile', 107, 'add_userprofile'),
(426, 'Can change user profile', 107, 'change_userprofile'),
(427, 'Can delete user profile', 107, 'delete_userprofile'),
(428, 'Can view user profile', 107, 'view_userprofile'),
(429, 'Can add stock', 108, 'add_stock'),
(430, 'Can change stock', 108, 'change_stock'),
(431, 'Can delete stock', 108, 'delete_stock'),
(432, 'Can view stock', 108, 'view_stock'),
(433, 'Can add product', 109, 'add_product'),
(434, 'Can change product', 109, 'change_product'),
(435, 'Can delete product', 109, 'delete_product'),
(436, 'Can view product', 109, 'view_product'),
(437, 'Can add category', 110, 'add_category'),
(438, 'Can change category', 110, 'change_category'),
(439, 'Can delete category', 110, 'delete_category'),
(440, 'Can view category', 110, 'view_category'),
(441, 'Can add supplier', 111, 'add_supplier'),
(442, 'Can change supplier', 111, 'change_supplier'),
(443, 'Can delete supplier', 111, 'delete_supplier'),
(444, 'Can view supplier', 111, 'view_supplier'),
(445, 'Can add user profile', 112, 'add_userprofile'),
(446, 'Can change user profile', 112, 'change_userprofile'),
(447, 'Can delete user profile', 112, 'delete_userprofile'),
(448, 'Can view user profile', 112, 'view_userprofile'),
(449, 'Can add supplier', 113, 'add_supplier'),
(450, 'Can change supplier', 113, 'change_supplier'),
(451, 'Can delete supplier', 113, 'delete_supplier'),
(452, 'Can view supplier', 113, 'view_supplier'),
(453, 'Can add category', 114, 'add_category'),
(454, 'Can change category', 114, 'change_category'),
(455, 'Can delete category', 114, 'delete_category'),
(456, 'Can view category', 114, 'view_category'),
(457, 'Can add stock', 115, 'add_stock'),
(458, 'Can change stock', 115, 'change_stock'),
(459, 'Can delete stock', 115, 'delete_stock'),
(460, 'Can view stock', 115, 'view_stock'),
(461, 'Can add product', 116, 'add_product'),
(462, 'Can change product', 116, 'change_product'),
(463, 'Can delete product', 116, 'delete_product'),
(464, 'Can view product', 116, 'view_product'),
(465, 'Can add user profile', 117, 'add_userprofile'),
(466, 'Can change user profile', 117, 'change_userprofile'),
(467, 'Can delete user profile', 117, 'delete_userprofile'),
(468, 'Can view user profile', 117, 'view_userprofile'),
(469, 'Can add stock', 118, 'add_stock'),
(470, 'Can change stock', 118, 'change_stock'),
(471, 'Can delete stock', 118, 'delete_stock'),
(472, 'Can view stock', 118, 'view_stock'),
(473, 'Can add supplier', 119, 'add_supplier'),
(474, 'Can change supplier', 119, 'change_supplier'),
(475, 'Can delete supplier', 119, 'delete_supplier'),
(476, 'Can view supplier', 119, 'view_supplier'),
(477, 'Can add product', 120, 'add_product'),
(478, 'Can change product', 120, 'change_product'),
(479, 'Can delete product', 120, 'delete_product'),
(480, 'Can view product', 120, 'view_product'),
(481, 'Can add category', 121, 'add_category'),
(482, 'Can change category', 121, 'change_category'),
(483, 'Can delete category', 121, 'delete_category'),
(484, 'Can view category', 121, 'view_category'),
(485, 'Can add user profile', 122, 'add_userprofile'),
(486, 'Can change user profile', 122, 'change_userprofile'),
(487, 'Can delete user profile', 122, 'delete_userprofile'),
(488, 'Can view user profile', 122, 'view_userprofile'),
(489, 'Can add stock', 123, 'add_stock'),
(490, 'Can change stock', 123, 'change_stock'),
(491, 'Can delete stock', 123, 'delete_stock'),
(492, 'Can view stock', 123, 'view_stock'),
(493, 'Can add product', 124, 'add_product'),
(494, 'Can change product', 124, 'change_product'),
(495, 'Can delete product', 124, 'delete_product'),
(496, 'Can view product', 124, 'view_product'),
(497, 'Can add category', 125, 'add_category'),
(498, 'Can change category', 125, 'change_category'),
(499, 'Can delete category', 125, 'delete_category'),
(500, 'Can view category', 125, 'view_category'),
(501, 'Can add supplier', 126, 'add_supplier'),
(502, 'Can change supplier', 126, 'change_supplier'),
(503, 'Can delete supplier', 126, 'delete_supplier'),
(504, 'Can view supplier', 126, 'view_supplier'),
(505, 'Can add purchase order', 127, 'add_purchaseorder'),
(506, 'Can change purchase order', 127, 'change_purchaseorder'),
(507, 'Can delete purchase order', 127, 'delete_purchaseorder'),
(508, 'Can view purchase order', 127, 'view_purchaseorder'),
(509, 'Can add purchase line item', 128, 'add_purchaselineitem'),
(510, 'Can change purchase line item', 128, 'change_purchaselineitem'),
(511, 'Can delete purchase line item', 128, 'delete_purchaselineitem'),
(512, 'Can view purchase line item', 128, 'view_purchaselineitem'),
(513, 'Can add user profile', 129, 'add_userprofile'),
(514, 'Can change user profile', 129, 'change_userprofile'),
(515, 'Can delete user profile', 129, 'delete_userprofile'),
(516, 'Can view user profile', 129, 'view_userprofile'),
(517, 'Can add category', 130, 'add_category'),
(518, 'Can change category', 130, 'change_category'),
(519, 'Can delete category', 130, 'delete_category'),
(520, 'Can view category', 130, 'view_category'),
(521, 'Can add purchase line item', 131, 'add_purchaselineitem'),
(522, 'Can change purchase line item', 131, 'change_purchaselineitem'),
(523, 'Can delete purchase line item', 131, 'delete_purchaselineitem'),
(524, 'Can view purchase line item', 131, 'view_purchaselineitem'),
(525, 'Can add supplier', 132, 'add_supplier'),
(526, 'Can change supplier', 132, 'change_supplier'),
(527, 'Can delete supplier', 132, 'delete_supplier'),
(528, 'Can view supplier', 132, 'view_supplier'),
(529, 'Can add stock', 133, 'add_stock'),
(530, 'Can change stock', 133, 'change_stock'),
(531, 'Can delete stock', 133, 'delete_stock'),
(532, 'Can view stock', 133, 'view_stock'),
(533, 'Can add product', 134, 'add_product'),
(534, 'Can change product', 134, 'change_product'),
(535, 'Can delete product', 134, 'delete_product'),
(536, 'Can view product', 134, 'view_product'),
(537, 'Can add purchase order', 135, 'add_purchaseorder'),
(538, 'Can change purchase order', 135, 'change_purchaseorder'),
(539, 'Can delete purchase order', 135, 'delete_purchaseorder'),
(540, 'Can view purchase order', 135, 'view_purchaseorder'),
(541, 'Can add stock in log', 136, 'add_stockinlog'),
(542, 'Can change stock in log', 136, 'change_stockinlog'),
(543, 'Can delete stock in log', 136, 'delete_stockinlog'),
(544, 'Can view stock in log', 136, 'view_stockinlog'),
(545, 'Can add stock out log', 137, 'add_stockoutlog'),
(546, 'Can change stock out log', 137, 'change_stockoutlog'),
(547, 'Can delete stock out log', 137, 'delete_stockoutlog'),
(548, 'Can view stock out log', 137, 'view_stockoutlog'),
(549, 'Can add user profile', 138, 'add_userprofile'),
(550, 'Can change user profile', 138, 'change_userprofile'),
(551, 'Can delete user profile', 138, 'delete_userprofile'),
(552, 'Can view user profile', 138, 'view_userprofile'),
(553, 'Can add category', 139, 'add_category'),
(554, 'Can change category', 139, 'change_category'),
(555, 'Can delete category', 139, 'delete_category'),
(556, 'Can view category', 139, 'view_category'),
(557, 'Can add sales order', 140, 'add_salesorder'),
(558, 'Can change sales order', 140, 'change_salesorder'),
(559, 'Can delete sales order', 140, 'delete_salesorder'),
(560, 'Can view sales order', 140, 'view_salesorder'),
(561, 'Can add supplier', 141, 'add_supplier'),
(562, 'Can change supplier', 141, 'change_supplier'),
(563, 'Can delete supplier', 141, 'delete_supplier'),
(564, 'Can view supplier', 141, 'view_supplier'),
(565, 'Can add stock', 142, 'add_stock'),
(566, 'Can change stock', 142, 'change_stock'),
(567, 'Can delete stock', 142, 'delete_stock'),
(568, 'Can view stock', 142, 'view_stock'),
(569, 'Can add product', 143, 'add_product'),
(570, 'Can change product', 143, 'change_product'),
(571, 'Can delete product', 143, 'delete_product'),
(572, 'Can view product', 143, 'view_product'),
(573, 'Can add purchase item', 144, 'add_purchaseitem'),
(574, 'Can change purchase item', 144, 'change_purchaseitem'),
(575, 'Can delete purchase item', 144, 'delete_purchaseitem'),
(576, 'Can view purchase item', 144, 'view_purchaseitem'),
(577, 'Can add stock in log', 145, 'add_stockinlog'),
(578, 'Can change stock in log', 145, 'change_stockinlog'),
(579, 'Can delete stock in log', 145, 'delete_stockinlog'),
(580, 'Can view stock in log', 145, 'view_stockinlog'),
(581, 'Can add stock out log', 146, 'add_stockoutlog'),
(582, 'Can change stock out log', 146, 'change_stockoutlog'),
(583, 'Can delete stock out log', 146, 'delete_stockoutlog'),
(584, 'Can view stock out log', 146, 'view_stockoutlog'),
(585, 'Can add user profile', 147, 'add_userprofile'),
(586, 'Can change user profile', 147, 'change_userprofile'),
(587, 'Can delete user profile', 147, 'delete_userprofile'),
(588, 'Can view user profile', 147, 'view_userprofile'),
(589, 'Can add sales item', 148, 'add_salesitem'),
(590, 'Can change sales item', 148, 'change_salesitem'),
(591, 'Can delete sales item', 148, 'delete_salesitem'),
(592, 'Can view sales item', 148, 'view_salesitem'),
(593, 'Can add sales order', 149, 'add_salesorder'),
(594, 'Can change sales order', 149, 'change_salesorder'),
(595, 'Can delete sales order', 149, 'delete_salesorder'),
(596, 'Can view sales order', 149, 'view_salesorder'),
(597, 'Can add stock', 150, 'add_stock'),
(598, 'Can change stock', 150, 'change_stock'),
(599, 'Can delete stock', 150, 'delete_stock'),
(600, 'Can view stock', 150, 'view_stock'),
(601, 'Can add category', 151, 'add_category'),
(602, 'Can change category', 151, 'change_category'),
(603, 'Can delete category', 151, 'delete_category'),
(604, 'Can view category', 151, 'view_category'),
(605, 'Can add product', 152, 'add_product'),
(606, 'Can change product', 152, 'change_product'),
(607, 'Can delete product', 152, 'delete_product'),
(608, 'Can view product', 152, 'view_product'),
(609, 'Can add supplier', 153, 'add_supplier'),
(610, 'Can change supplier', 153, 'change_supplier'),
(611, 'Can delete supplier', 153, 'delete_supplier'),
(612, 'Can view supplier', 153, 'view_supplier'),
(613, 'Can add sales line item', 148, 'add_saleslineitem'),
(614, 'Can change sales line item', 148, 'change_saleslineitem'),
(615, 'Can delete sales line item', 148, 'delete_saleslineitem'),
(616, 'Can view sales line item', 148, 'view_saleslineitem'),
(617, 'Can add stock discard log', 154, 'add_stockdiscardlog'),
(618, 'Can change stock discard log', 154, 'change_stockdiscardlog'),
(619, 'Can delete stock discard log', 154, 'delete_stockdiscardlog'),
(620, 'Can view stock discard log', 154, 'view_stockdiscardlog'),
(621, 'Can add stock pull out log', 154, 'add_stockpulloutlog'),
(622, 'Can change stock pull out log', 154, 'change_stockpulloutlog'),
(623, 'Can delete stock pull out log', 154, 'delete_stockpulloutlog'),
(624, 'Can view stock pull out log', 154, 'view_stockpulloutlog'),
(625, 'Can add user profile', 155, 'add_userprofile'),
(626, 'Can change user profile', 155, 'change_userprofile'),
(627, 'Can delete user profile', 155, 'delete_userprofile'),
(628, 'Can view user profile', 155, 'view_userprofile'),
(629, 'Can add supplier', 156, 'add_supplier'),
(630, 'Can change supplier', 156, 'change_supplier'),
(631, 'Can delete supplier', 156, 'delete_supplier'),
(632, 'Can view supplier', 156, 'view_supplier'),
(633, 'Can add stock out', 157, 'add_stockout'),
(634, 'Can change stock out', 157, 'change_stockout'),
(635, 'Can delete stock out', 157, 'delete_stockout'),
(636, 'Can view stock out', 157, 'view_stockout'),
(637, 'Can add product', 158, 'add_product'),
(638, 'Can change product', 158, 'change_product'),
(639, 'Can delete product', 158, 'delete_product'),
(640, 'Can view product', 158, 'view_product'),
(641, 'Can add stock pull out', 159, 'add_stockpullout'),
(642, 'Can change stock pull out', 159, 'change_stockpullout'),
(643, 'Can delete stock pull out', 159, 'delete_stockpullout'),
(644, 'Can view stock pull out', 159, 'view_stockpullout'),
(645, 'Can add category', 160, 'add_category'),
(646, 'Can change category', 160, 'change_category'),
(647, 'Can delete category', 160, 'delete_category'),
(648, 'Can view category', 160, 'view_category'),
(649, 'Can add sales order', 161, 'add_salesorder'),
(650, 'Can change sales order', 161, 'change_salesorder'),
(651, 'Can delete sales order', 161, 'delete_salesorder'),
(652, 'Can view sales order', 161, 'view_salesorder'),
(653, 'Can add stock', 162, 'add_stock'),
(654, 'Can change stock', 162, 'change_stock'),
(655, 'Can delete stock', 162, 'delete_stock'),
(656, 'Can view stock', 162, 'view_stock'),
(657, 'Can add stock in', 163, 'add_stockin'),
(658, 'Can change stock in', 163, 'change_stockin'),
(659, 'Can delete stock in', 163, 'delete_stockin'),
(660, 'Can view stock in', 163, 'view_stockin'),
(661, 'Can add sales line item', 164, 'add_saleslineitem'),
(662, 'Can change sales line item', 164, 'change_saleslineitem'),
(663, 'Can delete sales line item', 164, 'delete_saleslineitem'),
(664, 'Can view sales line item', 164, 'view_saleslineitem'),
(665, 'Can add stock pull out', 165, 'add_stockpullout'),
(666, 'Can change stock pull out', 165, 'change_stockpullout'),
(667, 'Can delete stock pull out', 165, 'delete_stockpullout'),
(668, 'Can view stock pull out', 165, 'view_stockpullout'),
(669, 'Can add user profile', 166, 'add_userprofile'),
(670, 'Can change user profile', 166, 'change_userprofile'),
(671, 'Can delete user profile', 166, 'delete_userprofile'),
(672, 'Can view user profile', 166, 'view_userprofile'),
(673, 'Can add sales line item', 167, 'add_saleslineitem'),
(674, 'Can change sales line item', 167, 'change_saleslineitem'),
(675, 'Can delete sales line item', 167, 'delete_saleslineitem'),
(676, 'Can view sales line item', 167, 'view_saleslineitem'),
(677, 'Can add stock', 168, 'add_stock'),
(678, 'Can change stock', 168, 'change_stock'),
(679, 'Can delete stock', 168, 'delete_stock'),
(680, 'Can view stock', 168, 'view_stock'),
(681, 'Can add category', 169, 'add_category'),
(682, 'Can change category', 169, 'change_category'),
(683, 'Can delete category', 169, 'delete_category'),
(684, 'Can view category', 169, 'view_category'),
(685, 'Can add stock out', 170, 'add_stockout'),
(686, 'Can change stock out', 170, 'change_stockout'),
(687, 'Can delete stock out', 170, 'delete_stockout'),
(688, 'Can view stock out', 170, 'view_stockout'),
(689, 'Can add stock in', 171, 'add_stockin'),
(690, 'Can change stock in', 171, 'change_stockin'),
(691, 'Can delete stock in', 171, 'delete_stockin'),
(692, 'Can view stock in', 171, 'view_stockin'),
(693, 'Can add supplier', 172, 'add_supplier'),
(694, 'Can change supplier', 172, 'change_supplier'),
(695, 'Can delete supplier', 172, 'delete_supplier'),
(696, 'Can view supplier', 172, 'view_supplier'),
(697, 'Can add stock pull out', 173, 'add_stockpullout'),
(698, 'Can change stock pull out', 173, 'change_stockpullout'),
(699, 'Can delete stock pull out', 173, 'delete_stockpullout'),
(700, 'Can view stock pull out', 173, 'view_stockpullout'),
(701, 'Can add sales order', 174, 'add_salesorder'),
(702, 'Can change sales order', 174, 'change_salesorder'),
(703, 'Can delete sales order', 174, 'delete_salesorder'),
(704, 'Can view sales order', 174, 'view_salesorder'),
(705, 'Can add product', 175, 'add_product'),
(706, 'Can change product', 175, 'change_product'),
(707, 'Can delete product', 175, 'delete_product'),
(708, 'Can view product', 175, 'view_product');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE IF NOT EXISTS `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=100005 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(100002, 'pbkdf2_sha256$150000$8LiafY3TKwEq$dTdPvwWcUlZ9DHrIizgHqFgllAn8t3Qz5cUngtInDgg=', '2022-01-20 23:32:09.433912', 1, 'rhyanfuenzalida1', 'Rhyan', 'Fuenzalida', 'rhyanfuenzalida1@gmail.com', 1, 1, '2022-01-20 10:49:43.988261'),
(100000, 'pbkdf2_sha256$150000$tbA4lSUlc0a0$25z0p7cYQclcsssMKHToIRGsQk4IZfDaC970VdByV1w=', '2023-02-14 08:18:53.039426', 1, 'admin', 'Admin', '', '', 1, 1, '2022-01-11 18:26:37.000000'),
(100001, 'pbkdf2_sha256$150000$ZeArJiaLzu7Z$r4iJW3T4E6tBZB51TPNhHPiNnUwx/AIIQJ36OKz4HHY=', '2022-01-24 17:30:07.967589', 1, 'aldrian500', 'Aldrian', 'Barias', 'aldrian.barias@cvsu.edu.ph', 1, 1, '2022-01-12 08:43:33.507854'),
(100003, 'pbkdf2_sha256$150000$LJFd6HCRfmsv$/tbzEZFhsC703/Ua4vNbS0rUW1u9KLakkJkMv+ZonJo=', '2022-01-24 17:01:21.275450', 0, 'ianbarias5', 'Ian', 'Barias', 'ianbarias5@gmail.com', 1, 0, '2022-01-20 10:52:08.559858'),
(100004, 'pbkdf2_sha256$150000$LCuiLTfPEsCS$74otfOvbMWfhnNCm/4dMHF97ClFGv9IstAURkI9iWzs=', '2022-01-21 00:02:20.939702', 0, 'BoyStaff1', 'Boy', 'Staff', 'boystaff1@gmail.com', 1, 1, '2022-01-20 23:46:51.286831');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_user_id_6a12ed8b` (`user_id`),
  KEY `auth_user_groups_group_id_97559544` (`group_id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `auth_user_groups`
--

INSERT INTO `auth_user_groups` (`id`, `user_id`, `group_id`) VALUES
(9, 59, 4);

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_user_id_a95ead1b` (`user_id`),
  KEY `auth_user_user_permissions_permission_id_1fbb5f2c` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=413 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(409, '2022-01-11 18:26:37.806439', '74', 'admin', 1, '[{\"added\": {}}]', 4, 59),
(410, '2022-01-11 18:26:59.964730', '74', 'admin', 2, '[{\"changed\": {\"fields\": [\"first_name\"]}}]', 4, 59),
(406, '2022-01-11 18:25:09.989712', '68', 'allyson567', 3, '', 4, 59),
(407, '2022-01-11 18:25:09.990712', '73', 'ianbarias500', 3, '', 4, 59),
(408, '2022-01-11 18:25:09.990712', '72', 'jayian500', 3, '', 4, 59),
(398, '2021-12-09 13:25:08.048860', '1', 'allybarias@gmail.com', 2, '[{\"changed\": {\"fields\": [\"avatar\"]}}]', 147, 59),
(399, '2021-12-09 13:25:41.851773', '3', 'asdasdsasa@gmail.co', 1, '[{\"added\": {}}]', 147, 59),
(400, '2021-12-09 13:25:57.896336', '4', 'aldrianbarias5@gmail.com', 1, '[{\"added\": {}}]', 147, 59),
(401, '2021-12-09 13:32:02.013048', '3', 'Staff', 1, '[{\"added\": {}}]', 3, 59),
(402, '2021-12-09 13:32:08.464850', '4', 'Admin', 1, '[{\"added\": {}}]', 3, 59),
(403, '2021-12-09 13:32:26.655233', '59', 'aldrian5', 2, '[{\"changed\": {\"fields\": [\"groups\"]}}]', 4, 59),
(411, '2022-01-11 18:28:29.966141', '74', 'admin', 2, '[{\"changed\": {\"fields\": [\"is_staff\", \"is_superuser\"]}}]', 4, 59),
(397, '2021-12-09 13:25:03.404065', '2', 'bariasaldrian@gmail.com', 2, '[{\"changed\": {\"fields\": [\"avatar\"]}}]', 147, 59),
(395, '2021-12-07 17:54:00.165888', '1', 'Stock-In', 1, '[{\"product_id\": \"1\", \"product_name\": \"Throttle\", \"supplier_name\": \"Aldrian Barias\", \"adjustment\": \"Stock-In\", \"qty_adj\": \"56\", \"f_qty\": \"156\", \"purch_price\": \"78.00\", \"retail_price\": \"99.00\", \"encoded_by\": \"aldrian5\", \"prev_qty\": \"100\"}]', 142, 59),
(396, '2021-12-07 18:09:44.049659', '2', 'Stock-Out', 1, '[{\"product_id\": \"2\", \"product_name\": \"Throttle\", \"supplier_name\": \"Aldrian Barias\", \"adjustment\": \"Stock-Out\", \"qty_adj\": \"32\", \"f_qty\": \"68\", \"purch_price\": \"56\", \"retail_price\": \"88.00\", \"encoded_by\": \"aldrian5\", \"prev_qty\": \"100\"}]', 142, 59),
(384, '2021-12-07 10:42:50.027084', '55', 'aldrian234', 3, '', 4, 59),
(385, '2021-12-07 10:42:50.027084', '60', 'barias2', 3, '', 4, 59),
(386, '2021-12-07 10:42:50.028084', '53', 'fghfghg', 3, '', 4, 59),
(387, '2021-12-07 10:42:50.028084', '56', 'ianb35004', 3, '', 4, 59),
(388, '2021-12-07 10:42:50.028084', '54', 'sdfsdf', 3, '', 4, 59),
(389, '2021-12-07 10:43:01.574168', '59', 'aldrian5', 2, '[{\"changed\": {\"fields\": [\"first_name\", \"last_name\"]}}]', 4, 59),
(390, '2021-12-07 10:43:34.100303', '59', 'aldrian5', 2, '[]', 4, 59),
(391, '2021-12-07 12:54:06.257457', '62', 'allybarias6', 2, '[{\"changed\": {\"fields\": [\"is_staff\", \"is_superuser\"]}}]', 4, 59),
(392, '2021-12-07 12:55:03.535248', '63', 'ianb2002', 2, '[{\"changed\": {\"fields\": [\"is_staff\", \"is_superuser\"]}}]', 4, 59),
(393, '2021-12-07 15:59:29.746751', '1', 'Stock-In', 1, '[{\"product_id\": \"1\", \"product_name\": \"Throttle\", \"supplier_name\": \"Aldrian Barias\", \"adjustment\": \"Stock-In\", \"qty_adj\": \"0\", \"f_qty\": \"98\", \"purch_price\": \"92.55\", \"retail_price\": \"145.00\", \"encoded_by\": \"aldrian5\", \"prev_qty\": \"98\"}]', 133, 59),
(382, '2021-12-07 10:42:27.323263', '2', 'Staff', 3, '', 3, 59),
(383, '2021-12-07 10:42:50.027084', '57', 'aldrian', 3, '', 4, 59),
(381, '2021-12-07 10:42:27.322263', '1', 'Admin', 3, '', 3, 59),
(380, '2021-12-07 09:31:41.452951', '59', 'aldrian5', 2, '[{\"changed\": {\"fields\": [\"groups\"]}}]', 4, 59),
(412, '2022-01-20 10:32:42.644512', '76', 'rhyanfuenzalida1', 2, '[{\"changed\": {\"fields\": [\"is_staff\"]}}]', 4, 75);

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=MyISAM AUTO_INCREMENT=176 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(2, 'auth', 'permission'),
(3, 'auth', 'group'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session'),
(174, 'app', 'salesorder'),
(173, 'app', 'stockpullout'),
(172, 'app', 'supplier'),
(171, 'app', 'stockin'),
(170, 'app', 'stockout'),
(169, 'app', 'category'),
(168, 'app', 'stock'),
(167, 'app', 'saleslineitem'),
(166, 'app', 'userprofile'),
(175, 'app', 'product');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=91 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2021-10-18 08:27:52.668104'),
(2, 'auth', '0001_initial', '2021-10-18 08:27:53.643157'),
(3, 'admin', '0001_initial', '2021-10-18 08:27:53.884966'),
(4, 'admin', '0002_logentry_remove_auto_add', '2021-10-18 08:27:53.889966'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2021-10-18 08:27:53.894967'),
(6, 'contenttypes', '0002_remove_content_type_name', '2021-10-18 08:27:53.987388'),
(7, 'auth', '0002_alter_permission_name_max_length', '2021-10-18 08:27:54.038207'),
(8, 'auth', '0003_alter_user_email_max_length', '2021-10-18 08:27:54.088235'),
(9, 'auth', '0004_alter_user_username_opts', '2021-10-18 08:27:54.092236'),
(10, 'auth', '0005_alter_user_last_login_null', '2021-10-18 08:27:54.137480'),
(11, 'auth', '0006_require_contenttypes_0002', '2021-10-18 08:27:54.139480'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2021-10-18 08:27:54.143481'),
(13, 'auth', '0008_alter_user_username_max_length', '2021-10-18 08:27:54.195357'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2021-10-18 08:27:54.245698'),
(15, 'auth', '0010_alter_group_name_max_length', '2021-10-18 08:27:54.304769'),
(16, 'auth', '0011_update_proxy_permissions', '2021-10-18 08:27:54.310770'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2021-10-18 08:27:54.362425'),
(18, 'sessions', '0001_initial', '2021-10-18 08:27:54.479749'),
(80, 'app', '0001_initial', '2022-01-11 21:18:41.303889'),
(81, 'app', '0002_auto_20220113_1232', '2022-01-13 12:32:15.340934'),
(82, 'app', '0003_auto_20220113_1337', '2022-01-13 17:20:06.159088'),
(83, 'app', '0004_auto_20220113_1410', '2022-01-13 17:20:06.168090'),
(84, 'app', '0005_auto_20220113_1506', '2022-01-13 17:20:06.177092'),
(85, 'app', '0006_auto_20220113_1613', '2022-01-13 17:20:06.370143'),
(86, 'app', '0007_auto_20220113_1614', '2022-01-13 17:20:06.694739'),
(87, 'app', '0008_auto_20220113_1624', '2022-01-13 17:20:06.704742'),
(88, 'app', '0009_auto_20220113_1720', '2022-01-13 17:20:09.881152'),
(89, 'app', '0010_auto_20220113_1754', '2022-01-13 17:54:56.037568'),
(90, 'app', '0011_auto_20220113_2349', '2022-01-13 23:49:49.051225');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('ep5hww1961ga2sv8ojaonppwamxa4h3x', '.eJxVjEEOwiAQRe_C2hBgKIhL9z0DYYZBqoYmpV0Z765NutDtf-_9l4hpW2vcOi9xyuIitDj9bpjowW0H-Z7abZY0t3WZUO6KPGiX45z5eT3cv4Oaev3WTCEoMBY0JkdBeRiyZ5UsFiqFaICCylmtDWvnCcF6gqLObLQDsFa8P-UtN44:1mcoJo:QjEJvwjCTm4Y2VYoZgt1MGWyOxyNjues7oiKO2pxafo', '2021-11-02 12:34:12.054312'),
('teip019o3m7kr42a256dq7i8sxtwuca4', '.eJxVjEEOwiAQRe_C2hBgKIhL9z0DYYZBqoYmpV0Z765NutDtf-_9l4hpW2vcOi9xyuIitDj9bpjowW0H-Z7abZY0t3WZUO6KPGiX45z5eT3cv4Oaev3WTCEoMBY0JkdBeRiyZ5UsFiqFaICCylmtDWvnCcF6gqLObLQDsFa8P-UtN44:1mcouQ:iKu-Z_66wxkTTl-Zmmf16UEr3T6ZX88Jh3EhHbpnl5U', '2021-11-02 13:12:02.210598'),
('fned0105yknqtkd603jgya1a1moxnkw1', 'OWNhY2MzZDEyNThiYzRjZGFkYzI4NTFjMjQxODIwODMyMWE1MzEwMjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIwM2M2ODI4ZWU4ZTc2N2IyOTA3MTRhNWFlYzY1OTgyMTBmZjAzZTNhIn0=', '2021-12-12 12:48:48.861449'),
('bnv6oxpafj8zypdieh7b4sdlq0uke1a4', 'OWNhY2MzZDEyNThiYzRjZGFkYzI4NTFjMjQxODIwODMyMWE1MzEwMjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIwM2M2ODI4ZWU4ZTc2N2IyOTA3MTRhNWFlYzY1OTgyMTBmZjAzZTNhIn0=', '2021-12-13 10:20:21.094827'),
('b231xkwc1nlpt6mcyv9j3122qzpuuirw', 'OWNhY2MzZDEyNThiYzRjZGFkYzI4NTFjMjQxODIwODMyMWE1MzEwMjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIwM2M2ODI4ZWU4ZTc2N2IyOTA3MTRhNWFlYzY1OTgyMTBmZjAzZTNhIn0=', '2021-12-13 16:27:30.359795'),
('xnzxk1kwh2btzgnq58wva8vokrlw4x0y', 'YmZjNDMxOTEyMTg5ZDI5NTFkNWYxYzFmNDA2ZDM5NGE5Y2E2MmMwMTp7Il9hdXRoX3VzZXJfaWQiOiI2OCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNTQ5ODc5NmE1NTFmMWY2MGU0MWJiZjBkYTY3M2I5NTIzYmZkZGExMiJ9', '2022-01-01 22:29:49.854425'),
('m1ofu9z09pqt4mq6a1ocl9aie3etc04d', 'NmMwNmU0NzM0YzBhNjIxYzM4ZjhiZmMxY2JkZWQ3MzgyMmM3ZGVjYTp7Il9hdXRoX3VzZXJfaWQiOiI1OSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMjE5NTdjOGNkNWJiYWY3MGZkNjRhZWQzZmM5MmYyYTJlNjViOThlMSJ9', '2022-01-02 21:22:29.920197'),
('rmxq25t6nj4curz8050ty212yx1elyjl', 'ODg3ZjZlMjE1MDdiYjVlYmM0YWU1ZmEzYmYxYTU3NjdmYWNjMzM0Nzp7Il9hdXRoX3VzZXJfaWQiOiI3NSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNDU0NGUxYmI0ODBhNWQ2YTI4ZDhhZGVlNzBjMzE1MGE2YmI0ZDIyNiJ9', '2022-01-26 13:05:17.779069'),
('zw1833qznehr8s2behuvc9905112928g', 'MDgzZTNiMGYzMWI3MTU3NzQxNGY5NTIzZDk4OTVjNzYyZWZmMjY2MTp7Il9hdXRoX3VzZXJfaWQiOiI3NCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNGNkNjgzYmU4ZGMwNzk5NzkwOTJmOGVhMmUwZDMwZjAyNDZmN2M1NyJ9', '2022-01-26 16:57:40.472678'),
('pmaypas1bhaobj99xp6kdnvs1gvmx3hp', 'MDgzZTNiMGYzMWI3MTU3NzQxNGY5NTIzZDk4OTVjNzYyZWZmMjY2MTp7Il9hdXRoX3VzZXJfaWQiOiI3NCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNGNkNjgzYmU4ZGMwNzk5NzkwOTJmOGVhMmUwZDMwZjAyNDZmN2M1NyJ9', '2022-01-26 16:57:42.550567'),
('r5jdvh2aletk1tw97uygxjni9h6yt2z6', 'MDgzZTNiMGYzMWI3MTU3NzQxNGY5NTIzZDk4OTVjNzYyZWZmMjY2MTp7Il9hdXRoX3VzZXJfaWQiOiI3NCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNGNkNjgzYmU4ZGMwNzk5NzkwOTJmOGVhMmUwZDMwZjAyNDZmN2M1NyJ9', '2022-01-26 16:57:45.698443'),
('4qb6i5fgwuatvmzvn4xoxk4uzk8rnk8a', 'MDgzZTNiMGYzMWI3MTU3NzQxNGY5NTIzZDk4OTVjNzYyZWZmMjY2MTp7Il9hdXRoX3VzZXJfaWQiOiI3NCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNGNkNjgzYmU4ZGMwNzk5NzkwOTJmOGVhMmUwZDMwZjAyNDZmN2M1NyJ9', '2022-01-26 16:57:47.497172'),
('oqtmt1mnrmhlk8ldferzlhf5ni2b6f0x', 'MDgzZTNiMGYzMWI3MTU3NzQxNGY5NTIzZDk4OTVjNzYyZWZmMjY2MTp7Il9hdXRoX3VzZXJfaWQiOiI3NCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNGNkNjgzYmU4ZGMwNzk5NzkwOTJmOGVhMmUwZDMwZjAyNDZmN2M1NyJ9', '2022-01-26 16:57:47.692230'),
('vaci20ri90h7gvk6lhqn0303v6spg6yg', 'MDgzZTNiMGYzMWI3MTU3NzQxNGY5NTIzZDk4OTVjNzYyZWZmMjY2MTp7Il9hdXRoX3VzZXJfaWQiOiI3NCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNGNkNjgzYmU4ZGMwNzk5NzkwOTJmOGVhMmUwZDMwZjAyNDZmN2M1NyJ9', '2022-01-26 16:57:47.992856'),
('4b3f752o4w5fy8eyroom736jwan75p7m', 'MDgzZTNiMGYzMWI3MTU3NzQxNGY5NTIzZDk4OTVjNzYyZWZmMjY2MTp7Il9hdXRoX3VzZXJfaWQiOiI3NCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNGNkNjgzYmU4ZGMwNzk5NzkwOTJmOGVhMmUwZDMwZjAyNDZmN2M1NyJ9', '2022-01-26 16:57:48.156104'),
('9y63qv3p8dcfw0tqd2u6qn0py9hy6mgb', 'MDgzZTNiMGYzMWI3MTU3NzQxNGY5NTIzZDk4OTVjNzYyZWZmMjY2MTp7Il9hdXRoX3VzZXJfaWQiOiI3NCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNGNkNjgzYmU4ZGMwNzk5NzkwOTJmOGVhMmUwZDMwZjAyNDZmN2M1NyJ9', '2022-01-26 16:57:50.786729'),
('jll8nkupj7el2eoonzw0xb6lqab3bks3', 'ODg3ZjZlMjE1MDdiYjVlYmM0YWU1ZmEzYmYxYTU3NjdmYWNjMzM0Nzp7Il9hdXRoX3VzZXJfaWQiOiI3NSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNDU0NGUxYmI0ODBhNWQ2YTI4ZDhhZGVlNzBjMzE1MGE2YmI0ZDIyNiJ9', '2022-01-26 15:27:38.186769'),
('eac2xu7w1ndizffwhm8xa9wxtmyz16r9', 'MDgzZTNiMGYzMWI3MTU3NzQxNGY5NTIzZDk4OTVjNzYyZWZmMjY2MTp7Il9hdXRoX3VzZXJfaWQiOiI3NCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNGNkNjgzYmU4ZGMwNzk5NzkwOTJmOGVhMmUwZDMwZjAyNDZmN2M1NyJ9', '2022-01-26 09:16:23.416501'),
('edgt25jnyf4gf65gg63597dst1ia7aln', 'ODg3ZjZlMjE1MDdiYjVlYmM0YWU1ZmEzYmYxYTU3NjdmYWNjMzM0Nzp7Il9hdXRoX3VzZXJfaWQiOiI3NSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNDU0NGUxYmI0ODBhNWQ2YTI4ZDhhZGVlNzBjMzE1MGE2YmI0ZDIyNiJ9', '2022-01-26 12:06:19.832353'),
('2lc3eheudi4bxy72p7xbbrad5evq4j5v', 'MDgzZTNiMGYzMWI3MTU3NzQxNGY5NTIzZDk4OTVjNzYyZWZmMjY2MTp7Il9hdXRoX3VzZXJfaWQiOiI3NCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNGNkNjgzYmU4ZGMwNzk5NzkwOTJmOGVhMmUwZDMwZjAyNDZmN2M1NyJ9', '2022-01-26 13:06:51.807433'),
('pvq6ybfugf5i15u6dcqm36stc5q0zqk9', 'MDgzZTNiMGYzMWI3MTU3NzQxNGY5NTIzZDk4OTVjNzYyZWZmMjY2MTp7Il9hdXRoX3VzZXJfaWQiOiI3NCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNGNkNjgzYmU4ZGMwNzk5NzkwOTJmOGVhMmUwZDMwZjAyNDZmN2M1NyJ9', '2022-01-26 17:30:14.320298'),
('mvkq6aascd9m2zsjlyo5c9gly2cf2hau', 'YWMxNTk0MzgzNTg1OGEzYmRjYzk5Y2FkZmU0MmE4YzA5NzYyNGFlODp7Il9hdXRoX3VzZXJfaWQiOiIxMDAwMDAiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjRjZDY4M2JlOGRjMDc5OTc5MDkyZjhlYTJlMGQzMGYwMjQ2ZjdjNTciLCJzdGF0dXMiOiJQZW5kaW5nIn0=', '2022-02-06 19:13:04.041161'),
('40o4o61zpqbwo1mfrywd7vdh0eo4a5jc', 'MDgzZTNiMGYzMWI3MTU3NzQxNGY5NTIzZDk4OTVjNzYyZWZmMjY2MTp7Il9hdXRoX3VzZXJfaWQiOiI3NCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNGNkNjgzYmU4ZGMwNzk5NzkwOTJmOGVhMmUwZDMwZjAyNDZmN2M1NyJ9', '2022-01-27 08:11:53.967756'),
('bxdv3o2go826r3a5kk82j16u4aisen4r', 'MDgzZTNiMGYzMWI3MTU3NzQxNGY5NTIzZDk4OTVjNzYyZWZmMjY2MTp7Il9hdXRoX3VzZXJfaWQiOiI3NCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNGNkNjgzYmU4ZGMwNzk5NzkwOTJmOGVhMmUwZDMwZjAyNDZmN2M1NyJ9', '2022-01-27 02:17:40.222098'),
('sji8n017i2hfknzcylivaxe0y3uce8qw', 'MDgzZTNiMGYzMWI3MTU3NzQxNGY5NTIzZDk4OTVjNzYyZWZmMjY2MTp7Il9hdXRoX3VzZXJfaWQiOiI3NCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNGNkNjgzYmU4ZGMwNzk5NzkwOTJmOGVhMmUwZDMwZjAyNDZmN2M1NyJ9', '2022-01-27 02:17:42.287894'),
('rjv6x4rwrxp272m9b36niu28u3grohdh', 'ZDQ3YjUyZjY2NDY1YmU5YmFmNTA3ZWU1Yzg3MDRmYjUxMjA5MTlhMTp7Il9hdXRoX3VzZXJfaWQiOiIxMDAwMDAiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjRjZDY4M2JlOGRjMDc5OTc5MDkyZjhlYTJlMGQzMGYwMjQ2ZjdjNTcifQ==', '2022-02-04 20:57:44.755132'),
('f9jxufwzvt7wjtne5xtxwo86nwgrdt1i', 'MDgzZTNiMGYzMWI3MTU3NzQxNGY5NTIzZDk4OTVjNzYyZWZmMjY2MTp7Il9hdXRoX3VzZXJfaWQiOiI3NCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNGNkNjgzYmU4ZGMwNzk5NzkwOTJmOGVhMmUwZDMwZjAyNDZmN2M1NyJ9', '2022-01-27 11:23:26.247300'),
('x8uq4li2siefnlbk95wszlub48u7wzkm', 'NTVkMmVkYmU0ZTFlYmEyNTJlNDA0ZjBiZTU2NDE4YmZhZDgyYWMyZTp7Il9hdXRoX3VzZXJfaWQiOiIxMDAwMDEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjA0NDQyOGJiZDc3ODAxZDI5ZjJlNjIwZDBhODUzMzcwNTRhYTUyZmMifQ==', '2022-02-07 10:53:03.374091'),
('5kx1gft66ia36dda0ppvzxdoo1v5gzvb', 'MDgzZTNiMGYzMWI3MTU3NzQxNGY5NTIzZDk4OTVjNzYyZWZmMjY2MTp7Il9hdXRoX3VzZXJfaWQiOiI3NCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNGNkNjgzYmU4ZGMwNzk5NzkwOTJmOGVhMmUwZDMwZjAyNDZmN2M1NyJ9', '2022-01-28 00:03:14.856208'),
('gth73ci6tytv6of56qh9b36k9cmciypq', 'NmMwNmU0NzM0YzBhNjIxYzM4ZjhiZmMxY2JkZWQ3MzgyMmM3ZGVjYTp7Il9hdXRoX3VzZXJfaWQiOiI1OSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMjE5NTdjOGNkNWJiYWY3MGZkNjRhZWQzZmM5MmYyYTJlNjViOThlMSJ9', '2022-01-30 15:13:24.099599'),
('n379db6rvg8e4ivcidgeh160rdg2sdyf', 'MjNiMzEyYWZkYTkwY2NhM2U5ZGJhNzIzZDczMGVkOWUyZDJlYzlmMTp7Il9hdXRoX3VzZXJfaWQiOiI3NSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNTIzNTk1ZTU5MTdhMWRiMzg0NzA2MDNjYjE2ZTdhNThhMDRkYzkyMyJ9', '2022-01-29 01:52:08.168981'),
('lpyry915e6acef0hyb7lsevo99tdunrr', 'NTVkMmVkYmU0ZTFlYmEyNTJlNDA0ZjBiZTU2NDE4YmZhZDgyYWMyZTp7Il9hdXRoX3VzZXJfaWQiOiIxMDAwMDEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjA0NDQyOGJiZDc3ODAxZDI5ZjJlNjIwZDBhODUzMzcwNTRhYTUyZmMifQ==', '2022-02-03 14:39:19.797210'),
('i1mmdvf2bpw73r3klcg96hlo1mr972ts', 'ZDQ3YjUyZjY2NDY1YmU5YmFmNTA3ZWU1Yzg3MDRmYjUxMjA5MTlhMTp7Il9hdXRoX3VzZXJfaWQiOiIxMDAwMDAiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjRjZDY4M2JlOGRjMDc5OTc5MDkyZjhlYTJlMGQzMGYwMjQ2ZjdjNTcifQ==', '2022-02-04 13:24:40.360664'),
('kay1p59kf8c6n7okqclg1511t1da9y71', 'YTAzMGEyNTQzMDMzMjk4NDJhNjQxMWIzZTIyMjZiMjcxMTBhZDI5ZTp7Il9hdXRoX3VzZXJfaWQiOiIxMDAwMDEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjA0NDQyOGJiZDc3ODAxZDI5ZjJlNjIwZDBhODUzMzcwNTRhYTUyZmMiLCJzdGF0dXMiOiJBcHByb3ZlZCJ9', '2022-02-04 21:29:16.093421'),
('kklcq6cj1vz0o1rrqowpdcvfnlmt69kq', 'NTMzOTU2Mzg3NTllNzhjMzEyMmM3MzA0YWMwMWQxZGQzNGU0MDdiNTp7Il9hdXRoX3VzZXJfaWQiOiIxMDAwMDAiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjFmNjNlY2U3NTdmMzI3MDM5ZjRkZjEyZTdmYzhjNzNhZmJkNzA2YjcifQ==', '2023-02-28 08:18:43.740449');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 17, 2023 at 06:53 PM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `carrental`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `UserName` varchar(100) NOT NULL,
  `Password` varchar(100) NOT NULL,
  `updationDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `UserName`, `Password`, `updationDate`) VALUES
(1, 'admin', '9580ab5d9db022c73d6678b07c86c9db', '2023-07-15 11:20:34');

-- --------------------------------------------------------

--
-- Table structure for table `manager`
--

CREATE TABLE `manager` (
  `id` int(11) NOT NULL,
  `UserName` varchar(100) NOT NULL,
  `Password` varchar(100) NOT NULL,
  `updationDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `manager`
--

INSERT INTO `manager` (`id`, `UserName`, `Password`, `updationDate`) VALUES
(1, 'manager', 'manager@12345', '2023-07-16 12:22:38');

-- --------------------------------------------------------

--
-- Table structure for table `tblbooking`
--

CREATE TABLE `tblbooking` (
  `id` int(11) NOT NULL,
  `BookingNumber` bigint(12) DEFAULT NULL,
  `userEmail` varchar(100) DEFAULT NULL,
  `VehicleId` int(11) DEFAULT NULL,
  `FromDate` varchar(20) DEFAULT NULL,
  `ToDate` varchar(20) DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  `Status` int(11) DEFAULT NULL,
  `PostingDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `LastUpdationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblbooking`
--

INSERT INTO `tblbooking` (`id`, `BookingNumber`, `userEmail`, `VehicleId`, `FromDate`, `ToDate`, `message`, `Status`, `PostingDate`, `LastUpdationDate`) VALUES
(3, 566122780, 'atifah@gmail.com', 2, '2023-07-17', '2023-07-18', 'Does the car available on that date?', 1, '2023-07-16 10:14:14', '2023-07-16 19:32:01'),
(4, 513613216, 'atifah@gmail.com', 3, '2023-07-20', '2023-07-23', 'is the date available?', 0, '2023-07-16 11:25:10', NULL),
(5, 931185187, 'atifah@gmail.com', 9, '2023-07-28', '2023-07-29', '.', 0, '2023-07-17 13:30:43', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tblbrands`
--

CREATE TABLE `tblbrands` (
  `id` int(11) NOT NULL,
  `BrandName` varchar(120) NOT NULL,
  `CreationDate` timestamp NULL DEFAULT current_timestamp(),
  `UpdationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblbrands`
--

INSERT INTO `tblbrands` (`id`, `BrandName`, `CreationDate`, `UpdationDate`) VALUES
(1, 'Honda', '2017-06-18 16:24:34', '2023-07-16 07:05:52'),
(2, 'BMW', '2017-06-18 16:24:50', NULL),
(3, 'Audi', '2017-06-18 16:25:03', NULL),
(4, 'Nissan', '2017-06-18 16:25:13', NULL),
(5, 'Toyota', '2017-06-18 16:25:24', NULL),
(7, 'Volkswagen', '2017-06-19 06:22:13', '2023-07-15 17:30:35');

-- --------------------------------------------------------

--
-- Table structure for table `tblcontactusinfo`
--

CREATE TABLE `tblcontactusinfo` (
  `id` int(11) NOT NULL,
  `Address` tinytext DEFAULT NULL,
  `EmailId` varchar(255) DEFAULT NULL,
  `ContactNo` char(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblcontactusinfo`
--

INSERT INTO `tblcontactusinfo` (`id`, `Address`, `EmailId`, `ContactNo`) VALUES
(1, 'Flora Damansara, PJU 8/9, Petaling Jaya, Selangor D.E.', 'syiokwheels@gmail.com', '0136580014');

-- --------------------------------------------------------

--
-- Table structure for table `tblcontactusquery`
--

CREATE TABLE `tblcontactusquery` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `EmailId` varchar(120) DEFAULT NULL,
  `ContactNumber` char(11) DEFAULT NULL,
  `Message` longtext DEFAULT NULL,
  `PostingDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblcontactusquery`
--

INSERT INTO `tblcontactusquery` (`id`, `name`, `EmailId`, `ContactNumber`, `Message`, `PostingDate`, `status`) VALUES
(2, 'atifah', 'atifah@gmail.com', '0112337480', 'Do you have a Toyota Vios car?', '2023-07-16 06:22:08', 1),
(3, 'husna', 'husna@gmail.com', '0111315934', 'do you have any car for business trip rental?', '2023-07-17 13:32:34', NULL),
(4, 'husna', 'husna@gmail.com', '0111315934', 'do you have any car for business trip rental?', '2023-07-17 15:04:15', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tblreport`
--

CREATE TABLE `tblreport` (
  `id` int(11) NOT NULL,
  `booking_id` int(11) DEFAULT NULL,
  `vehicle_id` int(11) DEFAULT NULL,
  `booking_number` varchar(50) DEFAULT NULL,
  `date_diff` int(11) DEFAULT NULL,
  `user_count` int(11) DEFAULT NULL,
  `subscriber_count` int(11) DEFAULT NULL,
  `testimonial_count` int(11) DEFAULT NULL,
  `report_date` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tblreport`
--

INSERT INTO `tblreport` (`id`, `booking_id`, `vehicle_id`, `booking_number`, `date_diff`, `user_count`, `subscriber_count`, `testimonial_count`, `report_date`) VALUES
(1, 1, 1, '123456789', 2, 2, 1, 1, '2023-07-17'),
(2, 2, 4, '987456321', 5, 2, 1, 1, '2023-07-17'),
(3, 3, 2, '566122780', 1, 2, 1, 1, '2023-07-17'),
(4, 4, 3, '513613216', 3, 2, 1, 1, '2023-07-17');

-- --------------------------------------------------------

--
-- Table structure for table `tblsubscribers`
--

CREATE TABLE `tblsubscribers` (
  `id` int(11) NOT NULL,
  `SubscriberEmail` varchar(120) DEFAULT NULL,
  `PostingDate` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblsubscribers`
--

INSERT INTO `tblsubscribers` (`id`, `SubscriberEmail`, `PostingDate`) VALUES
(6, 'atifah@gmail.com', '2023-07-16 06:17:40'),
(7, 'amira@gmail.com', '2023-07-17 13:31:14');

-- --------------------------------------------------------

--
-- Table structure for table `tbltestimonial`
--

CREATE TABLE `tbltestimonial` (
  `id` int(11) NOT NULL,
  `UserEmail` varchar(100) NOT NULL,
  `Testimonial` mediumtext NOT NULL,
  `PostingDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbltestimonial`
--

INSERT INTO `tbltestimonial` (`id`, `UserEmail`, `Testimonial`, `PostingDate`, `status`) VALUES
(2, 'atifah@gmail.com', 'Nice car for rental', '2023-07-17 15:26:14', NULL),
(3, 'najwa@gmail.com', 'Great experiences. Really clean car', '2023-07-17 16:01:21', NULL),
(4, 'amira@gmail.com', 'I highly recommend their services to anyone in need of a reliable and convenient car rental solution.', '2023-07-17 16:03:10', NULL),
(5, 'maisarah@gmail.com', 'The vehicle was in excellent condition, and the entire process was smooth and hassle-free.', '2023-07-17 16:04:17', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tblusers`
--

CREATE TABLE `tblusers` (
  `id` int(11) NOT NULL,
  `FullName` varchar(120) DEFAULT NULL,
  `EmailId` varchar(100) DEFAULT NULL,
  `Password` varchar(100) DEFAULT NULL,
  `ContactNo` char(11) DEFAULT NULL,
  `dob` varchar(100) DEFAULT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `City` varchar(100) DEFAULT NULL,
  `Country` varchar(100) DEFAULT NULL,
  `RegDate` timestamp NULL DEFAULT current_timestamp(),
  `UpdationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblusers`
--

INSERT INTO `tblusers` (`id`, `FullName`, `EmailId`, `Password`, `ContactNo`, `dob`, `Address`, `City`, `Country`, `RegDate`, `UpdationDate`) VALUES
(2, 'Atifah', 'atifah@gmail.com', '422ce526256fcf879658aa5b93e91339', '0112337480', NULL, NULL, NULL, NULL, '2023-07-16 06:11:09', NULL),
(3, 'Amira', 'amira@gmail.com', '0ae39049910b110bea964228da2c9faa', '0142973874', NULL, NULL, NULL, NULL, '2023-07-17 15:59:02', NULL),
(4, 'Maisarah', 'maisarah@gmail.com', '8272dc80798b5c25230a50809ea54c3f', '0135429262', NULL, NULL, NULL, NULL, '2023-07-17 15:59:53', NULL),
(5, 'Najwa', 'najwa@gmail.com', 'f9e9b682232ab616ffde1efbb0e914d0', '0124832529', NULL, NULL, NULL, NULL, '2023-07-17 16:00:27', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tblvehicles`
--

CREATE TABLE `tblvehicles` (
  `id` int(11) NOT NULL,
  `VehiclesTitle` varchar(150) DEFAULT NULL,
  `VehiclesBrand` int(11) DEFAULT NULL,
  `VehiclesOverview` longtext DEFAULT NULL,
  `PricePerDay` int(11) DEFAULT NULL,
  `FuelType` varchar(100) DEFAULT NULL,
  `ModelYear` int(6) DEFAULT NULL,
  `SeatingCapacity` int(11) DEFAULT NULL,
  `Vimage1` varchar(120) DEFAULT NULL,
  `Vimage2` varchar(120) DEFAULT NULL,
  `Vimage3` varchar(120) DEFAULT NULL,
  `Vimage4` varchar(120) DEFAULT NULL,
  `Vimage5` varchar(120) DEFAULT NULL,
  `AirConditioner` int(11) DEFAULT NULL,
  `PowerDoorLocks` int(11) DEFAULT NULL,
  `AntiLockBrakingSystem` int(11) DEFAULT NULL,
  `BrakeAssist` int(11) DEFAULT NULL,
  `PowerSteering` int(11) DEFAULT NULL,
  `DriverAirbag` int(11) DEFAULT NULL,
  `PassengerAirbag` int(11) DEFAULT NULL,
  `PowerWindows` int(11) DEFAULT NULL,
  `CDPlayer` int(11) DEFAULT NULL,
  `CentralLocking` int(11) DEFAULT NULL,
  `CrashSensor` int(11) DEFAULT NULL,
  `LeatherSeats` int(11) DEFAULT NULL,
  `RegDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `UpdationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblvehicles`
--

INSERT INTO `tblvehicles` (`id`, `VehiclesTitle`, `VehiclesBrand`, `VehiclesOverview`, `PricePerDay`, `FuelType`, `ModelYear`, `SeatingCapacity`, `Vimage1`, `Vimage2`, `Vimage3`, `Vimage4`, `Vimage5`, `AirConditioner`, `PowerDoorLocks`, `AntiLockBrakingSystem`, `BrakeAssist`, `PowerSteering`, `DriverAirbag`, `PassengerAirbag`, `PowerWindows`, `CDPlayer`, `CentralLocking`, `CrashSensor`, `LeatherSeats`, `RegDate`, `UpdationDate`) VALUES
(2, 'BMW 5 Series', 2, 'The BMW 5 Series is a luxury executive car produced by the German automaker BMW. It is renowned for its sophisticated design, powerful performance, and advanced technology features. The 5 Series offers a range of engine options, including petrol and hybrid models, providing a balance of efficiency and thrilling driving dynamics.', 800, 'Petrol', 2018, 5, 'BMW-5-Series-Exterior-102005.jpg', 'BMW-5-Series-New-Exterior-89729.jpg', 'BMW-5-Series-Exterior-102006.jpg', 'BMW-5-Series-Interior-102021.jpg', 'BMW-5-Series-Interior-102022.jpg', 1, 1, 1, 1, 1, 1, 1, 1, NULL, 1, 1, 1, '2020-07-07 07:12:02', '2023-07-16 19:29:35'),
(3, 'Audi Q8', 3, 'The Audi Q8 is a premium SUV crafted by the German manufacturer Audi. It embodies a blend of luxury, sportiness, and versatility. The Q8 features a sleek and imposing exterior design with a spacious and comfortable interior, offering advanced technology and safety features. Its powerful engines and quattro all-wheel drive deliver impressive performance both on and off the road, making it a top choice for those seeking a premium SUV experience.', 550, 'Petrol', 2017, 5, 'audi-q8-front-view4.jpg', '1920x1080_MTC_XL_framed_Audi-Odessa-Armaturen_Spiegelung_CC_v05.jpg', 'audi1.jpg', '1audiq8.jpg', 'audi-q8-front-view4.jpeg', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, '2020-07-07 07:19:21', '2023-07-16 19:29:58'),
(4, 'Nissan Kicks', 4, 'The Nissan Kicks is a compact crossover SUV produced by the Japanese automaker Nissan. It is designed to offer style, practicality, and affordability in a compact package. The Kicks stands out with its bold and modern exterior design, spacious interior, and an array of advanced safety and technology features, including smartphone integration and driver-assistance systems. ', 500, 'Petrol', 2020, 5, 'front-left-side-47.jpg', 'kicksmodelimage.jpg', 'download.jpg', 'kicksmodelimage.jpg', '', 1, NULL, NULL, 1, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, '2020-07-07 07:25:28', '2023-07-16 19:30:22'),
(5, 'Nissan GT-R', 4, ' The Nissan GT-R, often referred to as the \"Godzilla,\" is a high-performance sports car manufactured by Nissan. It features a powerful twin-turbocharged V6 engine, advanced all-wheel drive system, and cutting-edge technology that enables exceptional acceleration and handling, making it a favorite among driving enthusiasts and sports car aficionados around the world.', 800, 'Petrol', 2020, 5, 'Nissan-GTR-Right-Front-Three-Quarter-84895.jpg', 'Best-Nissan-Cars-in-India-New-and-Used-1.jpg', '2bb3bc938e734f462e45ed83be05165d.jpg', '2020-nissan-gtr-rakuda-tan-semi-aniline-leather-interior.jpg', 'images.jpg', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, '2020-07-07 07:34:17', '2023-07-16 19:30:46'),
(6, 'Nissan Sunny 2020', 4, 'The Nissan Sunny is a compact sedan produced by Nissan. The 2020 model of the Sunny offers a practical and reliable transportation option with a focus on fuel efficiency and affordability. It features a comfortable interior, ample trunk space, and a range of standard safety and convenience features, making it an ideal choice for daily commuting and urban driving.', 400, 'CNG', 2018, 5, 'Nissan-Sunny-Right-Front-Three-Quarter-48975_ol.jpg', 'images (1).jpg', 'Nissan-Sunny-Interior-114977.jpg', 'nissan-sunny-8a29f53-500x375.jpg', 'new-nissan-sunny-photo.jpg', 1, 1, NULL, 1, 1, 1, 1, 1, 1, 1, 1, 1, '2020-07-07 09:12:49', '2023-07-16 06:57:18'),
(7, 'Toyota Fortuner', 5, 'The Toyota Fortuner is a mid-size SUV produced by the Japanese automaker Toyota. Known for its rugged and versatile nature, the Fortuner combines off-road capabilities with on-road comfort. With its spacious interior, powerful engine options, and advanced safety features, the Fortuner is designed to tackle various terrains and provide a reliable and comfortable driving experience for both urban and adventurous journeys.', 550, 'Petrol', 2020, 5, '2015_Toyota_Fortuner_(New_Zealand).jpg', 'toyota-fortuner-legender-rear-quarters-6e57.jpg', 'zw-toyota-fortuner-2020-2.jpg', 'download (1).jpg', '', NULL, NULL, NULL, NULL, NULL, 1, 1, 1, NULL, 1, 1, 1, '2020-07-07 09:17:46', '2023-07-16 19:31:11'),
(9, 'Toyota Alphard', 5, 'The Toyota Alphard is a luxury minivan produced by the Japanese automaker Toyota. It offers a spacious and refined interior with versatile seating arrangements, making it ideal for large families or executive transport. The Alphard showcases advanced comfort features, including plush seating, premium materials, and cutting-edge technology, providing a luxurious and comfortable driving experience.', 800, 'Petrol', 2020, 8, 'alphard1.png', 'alphard3.jpg', 'alphard2.jpeg', 'alphard4.jpg', '', 1, 1, 1, 1, 1, 1, 1, 1, 1, NULL, 1, 1, '2023-07-16 07:01:52', '2023-07-16 07:11:35'),
(10, 'Toyota Vios', 5, 'The Toyota Vios is a compact sedan manufactured by Toyota, designed with practicality and efficiency in mind. It offers a comfortable and spacious interior, making it suitable for both daily commuting and longer journeys. With its reliable performance, fuel-efficient engines, and a reputation for low maintenance costs, the Vios is a popular choice among individuals and families looking for a dependable and affordable compact sedan.', 450, 'Petrol', 2022, 5, 'vios1.jpg', 'vios2.jpg', 'vios3.jpg', 'vios2.jpg', '', 1, 1, 1, 1, 1, 1, 1, 1, 1, NULL, 1, NULL, '2023-07-16 07:04:44', NULL),
(11, 'Honda City', 1, 'The Honda City is a compact sedan manufactured by Honda, renowned for its practicality, comfort, and fuel efficiency. With its spacious cabin and well-designed interior, the City offers a comfortable and enjoyable driving experience for both the driver and passengers. Equipped with advanced safety features and a range of engine options, the Honda City combines reliability and affordability, making it a popular choice in the compact sedan segment.', 450, 'Petrol', 2022, 5, 'city1.jpg', 'city2.jpg', 'city3.jpg', 'city2.jpg', '', 1, 1, 1, 1, 1, 1, 1, 1, 1, NULL, 1, NULL, '2023-07-16 07:08:50', NULL),
(12, 'Honda Civic', 1, 'The Honda Civic is a compact car produced by Honda that has become an icon in the automotive industry. Known for its reliability, fuel efficiency, and engaging driving dynamics, the Civic has established a reputation for being practical and fun to drive. With its sleek design, comfortable interior, and a range of advanced safety and technology features, the Civic offers a well-rounded driving experience suitable for daily commuting and enjoyable road trips.', 480, 'Petrol', 2022, 5, 'civic1.jpeg', 'civic2.jpg', 'civic3.jpg', 'civic2.jpg', '', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, NULL, '2023-07-16 07:11:04', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `manager`
--
ALTER TABLE `manager`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblbooking`
--
ALTER TABLE `tblbooking`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblbrands`
--
ALTER TABLE `tblbrands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblcontactusinfo`
--
ALTER TABLE `tblcontactusinfo`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblcontactusquery`
--
ALTER TABLE `tblcontactusquery`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblreport`
--
ALTER TABLE `tblreport`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblsubscribers`
--
ALTER TABLE `tblsubscribers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbltestimonial`
--
ALTER TABLE `tbltestimonial`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblusers`
--
ALTER TABLE `tblusers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `EmailId` (`EmailId`);

--
-- Indexes for table `tblvehicles`
--
ALTER TABLE `tblvehicles`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `manager`
--
ALTER TABLE `manager`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tblbooking`
--
ALTER TABLE `tblbooking`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tblbrands`
--
ALTER TABLE `tblbrands`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tblcontactusinfo`
--
ALTER TABLE `tblcontactusinfo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tblcontactusquery`
--
ALTER TABLE `tblcontactusquery`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tblreport`
--
ALTER TABLE `tblreport`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tblsubscribers`
--
ALTER TABLE `tblsubscribers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tbltestimonial`
--
ALTER TABLE `tbltestimonial`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tblusers`
--
ALTER TABLE `tblusers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tblvehicles`
--
ALTER TABLE `tblvehicles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 20, 2022 at 04:06 AM
-- Server version: 10.3.15-MariaDB
-- PHP Version: 7.2.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `obbs`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbladmin`
--

CREATE TABLE `tbladmin` (
  `ID` int(10) NOT NULL,
  `AdminName` varchar(120) DEFAULT NULL,
  `UserName` varchar(120) DEFAULT NULL,
  `MobileNumber` bigint(10) DEFAULT NULL,
  `Email` varchar(200) DEFAULT NULL,
  `Password` varchar(120) DEFAULT NULL,
  `AdminRegdate` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbladmin`
--

INSERT INTO `tbladmin` (`ID`, `AdminName`, `UserName`, `MobileNumber`, `Email`, `Password`, `AdminRegdate`) VALUES
(1, 'Admin', 'admin', 5689784589, 'admin@gmail.com', 'f925916e2754e5e03f75dd58a5733251', '2023-01-21 11:48:13'),
(2, 'Ganesh', 'admin', 828298983, 'ganesh22@gmail.com', 'fa1d87bc7f85769ea9dee2e4957321ae', '2023-03-22 11:50:15');

-- --------------------------------------------------------

--
-- Table structure for table `tblbooking`
--

CREATE TABLE `tblbooking` (
  `ID` int(10) NOT NULL,
  `BookingID` int(10) DEFAULT NULL,
  `ServiceID` int(10) DEFAULT NULL,
  `UserID` int(5) DEFAULT NULL,
  `BookingFrom` date DEFAULT NULL,
  `BookingTo` date DEFAULT NULL,
  `EventType` varchar(200) DEFAULT NULL,
  `Numberofguest` int(10) DEFAULT NULL,
  `Message` mediumtext DEFAULT NULL,
  `BookingDate` timestamp NULL DEFAULT current_timestamp(),
  `Remark` varchar(200) DEFAULT NULL,
  `Status` varchar(200) DEFAULT NULL,
  `UpdationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tblbooking`
--

INSERT INTO `tblbooking` (`ID`, `BookingID`, `ServiceID`, `UserID`, `BookingFrom`, `BookingTo`, `EventType`, `Numberofguest`, `Message`, `BookingDate`, `Remark`, `Status`, `UpdationDate`) VALUES
(1, 422701608, 1, 3, '2023-02-17', '2023-02-19', 'Wedding', 200, 'NA', '2023-02-16 06:58:08', 'Approved', 'Approved', '2023-02-16 07:32:01'),
(2, 697339619, 2, 4, '2023-02-20', '2023-02-22', 'Anniversary', 200, 'NA', '2023-02-19 15:24:38', 'Your booking is cancelled', 'Cancelled', '2023-02-19 15:59:38'),
(3, 347642822, 4, 5, '2023-02-27', '2023-02-28', 'Pre Engagement', 25, 'NA', '2023-02-19 17:51:30', 'Approved', 'Approved', '2023-02-19 17:52:24');

-- --------------------------------------------------------

--
-- Table structure for table `tblcontact`
--

CREATE TABLE `tblcontact` (
  `ID` int(10) NOT NULL,
  `Name` varchar(200) DEFAULT NULL,
  `Email` varchar(200) DEFAULT NULL,
  `Message` mediumtext DEFAULT NULL,
  `EnquiryDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `IsRead` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tblcontact`
--

INSERT INTO `tblcontact` (`ID`, `Name`, `Email`, `Message`, `EnquiryDate`, `IsRead`) VALUES
(1, 'Aditya', 'adi@gmail.com', 'cost of is valueable', '2023-02-05 07:26:24', 1),
(2, 'Yash Bablya', 'yash@gmail.com', 'Nice service', '2023-02-09 12:48:40', 1),
(3, 'Ajay Dangle', 'ajay@gmail.com', 'Want to know price of birthday party', '2023-03-16 12:51:06', 1),
(4, 'Ganesh', 'ganesh@gmail.com', 'lovely decoration', '2023-03-19 17:53:03', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbleventtype`
--

CREATE TABLE `tbleventtype` (
  `ID` int(10) NOT NULL,
  `EventType` varchar(200) DEFAULT NULL,
  `CreationDate` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbleventtype`
--

INSERT INTO `tbleventtype` (`ID`, `EventType`, `CreationDate`) VALUES
(1, 'Anniversary', '2023-01-22 07:01:39'),
(2, 'Birthday Party', '2023-01-22 07:02:34'),
(3, 'Charity', '2023-01-22 07:02:43'),
(4, 'College', '2023-01-22 07:03:11'),
(5, 'Concert', '2023-01-22 07:03:35'),
(6, 'Engagement', '2023-01-22 07:03:51'),
(7, 'Get Together', '2023-01-22 07:04:04'),
(8, 'Night Club', '2023-01-22 07:04:26'),
(9, 'Post Wedding', '2023-01-22 07:05:01'),
(10, 'Pre Engagement', '2023-01-22 07:05:18'),
(11, 'Wedding', '2023-01-22 07:06:07');

-- --------------------------------------------------------

--
-- Table structure for table `tblpage`
--

CREATE TABLE `tblpage` (
  `ID` int(10) NOT NULL,
  `PageType` varchar(100) DEFAULT NULL,
  `PageTitle` mediumtext DEFAULT NULL,
  `PageDescription` mediumtext DEFAULT NULL,
  `Email` varchar(200) DEFAULT NULL,
  `MobileNumber` bigint(10) DEFAULT NULL,
  `UpdationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tblpage`
--

INSERT INTO `tblpage` (`ID`, `PageType`, `PageTitle`, `PageDescription`, `Email`, `MobileNumber`, `UpdationDate`) VALUES
-- (1, 'aboutus', 'About Us', '<b>Online Banquet Booking System</b><div><b>OBBS is one of the Internet\'s largest and trusted Online Banquet Booking Service. OBBShas done several placements locally &amp; globally for top artists.</b></div><div><b><br></b></div><div><b>&nbsp;Test data for testing.&nbsp;</b></div>', NULL, NULL, '2022-02-19 17:54:36'),
(1, 'contactus', 'Contact Us', 'D-204, little flower Andheri(e),mum:-61', 'nourish@help.com', 9136701673, '2023-03-19 17:54:52');

-- --------------------------------------------------------

--
-- Table structure for table `tblservice`
--

CREATE TABLE `tblservice` (
  `ID` int(10) NOT NULL,
  `ServiceName` varchar(200) DEFAULT NULL,
  `SerDes` varchar(250) NOT NULL,
  `ServicePrice` varchar(200) DEFAULT NULL,
  `CreationDate` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tblservice`
--

INSERT INTO `tblservice` (`ID`, `ServiceName`, `SerDes`, `ServicePrice`, `CreationDate`) VALUES
(1, 'Birthday Part', '("Join us for a night of fun and celeration as we raise a glass an birthday! With delicious food and great music, its sure to be a remember party".)', '20,000', '2023-03-24 07:17:43'),
(2, 'Private Part', '("Celebrate your next private party at Nourish, a cozy and elegant venue with delicious food, friendly service and a stylish dinning room.Contact us for make your party special".)', '25,000', '2023-03-24 07:17:43'),
(3, 'Custom Party', '("Make your next celebration unforgettable by hosting it at Nourish! Our delicious food and tailor the event to your specific needs and preference".)', '30,000', '2023-03-24 07:19:14'),
(4, 'Party DJ', '("we install the DJ equipment 1 hour before your selected event start time")', '25,000', '2020-01-24 07:18:32');

-- --------------------------------------------------------

--
-- Table structure for table `tbluser`
--

CREATE TABLE `tbluser` (
  `ID` int(10) NOT NULL,
  `FullName` varchar(200) DEFAULT NULL,
  `MobileNumber` bigint(10) DEFAULT NULL,
  `Email` varchar(200) DEFAULT NULL,
  `Password` varchar(200) DEFAULT NULL,
  `RegDate` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbluser`
--

INSERT INTO `tbluser` (`ID`, `FullName`, `MobileNumber`, `Email`, `Password`, `RegDate`) VALUES
(1, 'Ganesh', 9879878979, 'ganesh@gmail.com', 'fa1d87bc7f85769ea9dee2e4957321ae', '2023-03-15 09:15:51'),
(2, 'Aditya', 9579878687, 'adi@gmail.com', 'c46335eb267e2e1cde5b017acb4cd799', '2023-03-15 09:16:44'),
(3, 'Yash', 9465465464, 'yash@gmail.com', 'c296539f3286a899d8b3f6632fd62274', '2023-03-15 12:07:55'),
(4, 'Ajay', 1234569879, 'ajay@gmail.com', '29e457082db729fa1059d4294ede3909', '2023-03-19 15:17:04');

--
-- Table structure for table `reservation`
--

CREATE TABLE `reservation` (
  `reserve_id` int(10) NOT NULL,
  `resid` int(10) NOT NULL,
  `UserID` int(5) DEFAULT NULL,
  `no_of_guest` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(100) NOT NULL,
  `date_res` varchar(100) NOT NULL,
  `time` varchar(100) NOT NULL,
  `suggestions` varchar(100) NOT NULL,
  `Remark` varchar(200) DEFAULT NULL,
  `Status` varchar(200) DEFAULT NULL,
  `UpdationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `reservation`
--

INSERT INTO `reservation` (`reserve_id`,`resid` ,`UserID`, `no_of_guest`, `email`, `phone`, `date_res`, `time`, `suggestions`, `Remark`, `Status`, `UpdationDate`) VALUES
(1,984752749 , '10', 2, 'ganesh@gmail.com', '9087676543', '2023-03-14', '15:00', 'breakfast', 'Approved', 'Approved', '2023-02-16 07:32:01'),
(2,357389471 , '15', 3, 'adi@gmail.com', '9087676546', '2023-03-30', '18:00', 'lunch', 'Approved', 'Approved', '2023-02-19 17:52:24');


--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbladmin`
--
ALTER TABLE `tbladmin`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tblbooking`
--
ALTER TABLE `tblbooking`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ServiceID` (`ServiceID`),
  ADD KEY `EventType` (`EventType`);

--
-- Indexes for table `tblcontact`
--
ALTER TABLE `tblcontact`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tbleventtype`
--
ALTER TABLE `tbleventtype`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `EventType` (`EventType`);

--
-- Indexes for table `tblpage`
--
ALTER TABLE `tblpage`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tblservice`
--
ALTER TABLE `tblservice`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ID` (`ID`);

--
-- Indexes for table `tbluser`
--
ALTER TABLE `tbluser`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `reservation`
--
ALTER TABLE `reservation`
  ADD PRIMARY KEY (`reserve_id`);


--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbladmin`
--
ALTER TABLE `tbladmin`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tblbooking`
--
ALTER TABLE `tblbooking`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tblcontact`
--
ALTER TABLE `tblcontact`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tbleventtype`
--
ALTER TABLE `tbleventtype`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `tblpage`
--
ALTER TABLE `tblpage`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tblservice`
--
ALTER TABLE `tblservice`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `tbluser`
--
ALTER TABLE `tbluser`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `reservation`
--
ALTER TABLE `reservation`
  MODIFY `reserve_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;


--
-- Constraints for dumped tables
--

--
-- Constraints for table `tblbooking`
--
ALTER TABLE `tblbooking`
  ADD CONSTRAINT `serivdi` FOREIGN KEY (`ServiceID`) REFERENCES `tblservice` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

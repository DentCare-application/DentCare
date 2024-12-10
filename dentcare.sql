-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 10, 2024 at 10:32 PM
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
-- Database: `dentcare`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `email`, `password`) VALUES
(1, 'admin@gmail.com', 'admin123');

-- --------------------------------------------------------

--
-- Table structure for table `appointments`
--

CREATE TABLE `appointments` (
  `id` int(11) NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `doctor` varchar(255) NOT NULL,
  `appointment_date` date NOT NULL,
  `appointment_time` time NOT NULL,
  `message` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `doctor_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `appointments`
--

INSERT INTO `appointments` (`id`, `full_name`, `email`, `phone`, `doctor`, `appointment_date`, `appointment_time`, `message`, `created_at`, `doctor_id`) VALUES
(1, 'Mohit Sharma', 'mohit@gmail.com', '4162764534', 'Dr. Carter', '2024-11-25', '10:00:00', 'I want to have routine check-up', '2024-11-21 19:09:02', 1),
(2, 'Rahul', 'rahul@gmail.com', '7893457689', '', '2024-12-27', '11:00:00', 'It&#039;s my first meet up with doctor.....', '2024-12-10 21:12:29', 1);

-- --------------------------------------------------------

--
-- Table structure for table `doctors`
--

CREATE TABLE `doctors` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `specialization` varchar(100) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `doctors`
--

INSERT INTO `doctors` (`id`, `name`, `specialization`, `email`, `password`, `phone`) VALUES
(1, 'Dr. Adams', 'Cosmetic Dentist', 'admascos@gmail.com', 'adams123', '1234567890'),
(2, 'Dr. Carter', 'Endodontist', 'carter234@gmail.com', 'carter123', '9876545876'),
(3, 'Dr. Rivera', 'Periodontist', 'rivera45@gmail.com', 'rivera123', '7347232552'),
(4, 'Dr. Nguyen', 'Prosthodontist', 'Nigyen234@gmail.com', 'nig123', '9876940391');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`) VALUES
(1, 'Mohit Sharma', 'mohit@gmail.com', '$2y$10$cNXf6eYq8tJ1cwR5B8lixOHJy9VkQxepFet.qaRXniKlUvUSL.6jS'),
(2, 'Rahul', 'rahul@gmail.com', '$2y$10$k57ap85TrAtC.wXlSC7h1eL0rIdG2NVBb6JSggGshU/kL22Acdo6y'),
(3, 'Rahul', 'rahul@gmail.com', '$2y$10$/hTMNVHVDP89deegjf2bbeaEtU42qNE9.bHpcIMXmJG27UBV55mF.'),
(4, 'Sachin', 'sachin@gmail.com', '$2y$10$94kMZMpl3iW2r0kkYaSBEuSyJ2svvAxFIVFGTIlfzAylJ3oYFwKUW'),
(5, 'chinku', 'chinku@gmail.com', '$2y$10$6afDz9wOiPlnilZkKMKKBuu4tZoS0W2ojOILxy5GENznqnr6EHvCe'),
(6, 'tinku', 'tinku@gmail.com', '$2y$10$s9Ah0fFk71dGgqVvbDf8geH0RwZ7Japhgbb8Zd0IkU0LmxYYvyLCy');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `appointments`
--
ALTER TABLE `appointments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `doctors`
--
ALTER TABLE `doctors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `appointments`
--
ALTER TABLE `appointments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `doctors`
--
ALTER TABLE `doctors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

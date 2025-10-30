-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 30, 2025 at 08:47 AM
-- Server version: 9.3.0
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hiber2`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int NOT NULL,
  `fullName` varchar(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `fullName`, `password`, `username`) VALUES
(1, 'Admin', '1234', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` int NOT NULL,
  `paymentDate` datetime(6) DEFAULT NULL,
  `petId` int NOT NULL,
  `razorpayOrderId` varchar(255) DEFAULT NULL,
  `razorpayPaymentId` varchar(255) DEFAULT NULL,
  `razorpaySignature` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`id`, `paymentDate`, `petId`, `razorpayOrderId`, `razorpayPaymentId`, `razorpaySignature`) VALUES
(1, '2025-10-27 09:53:47.293000', 1, 'order_RYMd08jFcQjjBF', 'pay_RYMdG14p2eZHzo', '2389f8a4245c85827849ca72388430906781a83c4295b1a4cab33c8db9ffd9f4'),
(2, '2025-10-27 10:05:14.930000', 1, 'order_RYMov4V7IqcL6d', 'pay_RYMpV8vlLXBKvv', 'cafd40c6393a5ac5aebedc35a6450005984976f40f48bddbf5b4f97af3bca6af'),
(3, '2025-10-27 10:06:38.823000', 1, 'order_RYMqknOaOq5R6y', 'pay_RYMqya0udSuuhu', 'eacbed9b9e7f47c710122b72bff3a0a065fd3457513c1dc3fddca5070ff1a0d3'),
(4, '2025-10-27 10:15:19.428000', 1, 'order_RYMzoINIkRNhAp', 'pay_RYN00s6cGmXr2h', '4ba433bbf12062c77ff3078e6bfe9dfebb61bfc975f92eca8432326528337b62'),
(5, '2025-10-27 10:15:59.218000', 1, 'order_RYN0V2BuMeyqKe', 'pay_RYN0qvXCbI3TeK', '8af22722a8e9b3b26ac36cffa5fe9acf5f58ebd54117b201fc610a17b60967b4'),
(6, '2025-10-27 11:41:38.646000', 15, 'order_RYOT39OyNCDNGA', 'pay_RYOTKdyojYbQeQ', 'bf9558c58880ac97f5587c30dc6016df3711fd3a983d37a587191cfb6fa41de7');

-- --------------------------------------------------------

--
-- Table structure for table `pets`
--

CREATE TABLE `pets` (
  `id` int NOT NULL,
  `name` varchar(100) NOT NULL,
  `type` varchar(50) DEFAULT NULL,
  `description` text,
  `imagePath` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `pets`
--

INSERT INTO `pets` (`id`, `name`, `type`, `description`, `imagePath`, `status`) VALUES
(1, 'Golden Retriever', 'Dog', 'Friendly and playful. Great with families!', 'images/dog1.jpg', 'sold'),
(2, 'Persian Cat', 'Cat', 'Elegant and calm. Loves a cozy nap.', 'images/cat1.jpg', 'Available'),
(3, 'African Grey Parrot', 'Bird', 'Highly intelligent. Can mimic speech!', 'images/parrot1.jpg', 'Available'),
(5, 'Beagle', 'Dog', 'Curious and merry. Loves to sniff around!', 'images/dog3.jpg', 'Available'),
(6, 'Bulldog', 'Dog', 'Gentle and dependable. Great companion.', 'images/dog4.jpg', 'Available'),
(7, 'Poodle', 'Dog', 'Intelligent and elegant. Hypoallergenic.', 'images/dog5.jpg', 'Available'),
(8, 'Siamese Cat', 'Cat', 'Vocal and social. Loves people!', 'images/cat2.jpg', 'Available'),
(9, 'Maine Coon', 'Cat', 'Large and gentle. Great with kids.', 'images/cat3.jpg', 'Available'),
(10, 'Bengal Cat', 'Cat', 'Energetic and playful. Exotic look.', 'images/cat4.jpg', 'Available'),
(11, 'Ragdoll Cat', 'Cat', 'Affectionate and relaxed. Great lap cat.', 'images/cat5.jpg', 'Available'),
(12, 'Budgerigar', 'Bird', 'Small, colorful, and loves to chirp.', 'images/parrot2.jpg', 'Available'),
(13, 'Cockatiel', 'Bird', 'Friendly and easy to tame. Great pet bird.', 'images/parrot3.jpg', 'Available'),
(14, 'Macaw', 'Bird', 'Large and stunning. Very social.', 'images/parrot4.jpg', 'Available'),
(15, 'Lovebird', 'Bird', 'Affectionate and playful. Bonds deeply.', 'images/parrot5.jpg', 'sold'),
(19, 'Labrador Retriever', 'Dog', 'Energetic and loving. Great swimmers!', 'images/dog2.jpg', 'Available');

-- --------------------------------------------------------

--
-- Table structure for table `pet_details`
--

CREATE TABLE `pet_details` (
  `id` int NOT NULL,
  `age` int NOT NULL,
  `atmosphere` varchar(255) DEFAULT NULL,
  `breed` varchar(255) DEFAULT NULL,
  `height` int NOT NULL,
  `weight` int NOT NULL,
  `pet_id` int DEFAULT NULL,
  `price` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `pet_details`
--

INSERT INTO `pet_details` (`id`, `age`, `atmosphere`, `breed`, `height`, `weight`, `pet_id`, `price`) VALUES
(1, 5, 'Friendly and active', 'Golden Retriever', 60, 30, 1, 1),
(2, 3, 'Elegant and calm', 'Persian', 25, 6, 2, 9000),
(3, 7, 'Highly intelligent', 'African Grey', 40, 0, 3, 9000),
(7, 4, 'Curious and merry', 'Beagle', 45, 14, 5, 8500),
(8, 6, 'Gentle and dependable', 'Bulldog', 40, 24, 6, 9500),
(9, 3, 'Intelligent and elegant', 'Poodle', 38, 18, 7, 10000),
(10, 2, 'Vocal and social', 'Siamese', 28, 5, 8, 8500),
(11, 4, 'Large and gentle', 'Maine Coon', 30, 9, 9, 8800),
(12, 3, 'Energetic and playful', 'Bengal', 26, 7, 10, 8900),
(13, 2, 'Affectionate and relaxed', 'Ragdoll', 30, 8, 11, 9200),
(14, 1, 'Small and colorful', 'Budgerigar', 15, 0, 12, 2000),
(15, 2, 'Friendly and easy to tame', 'Cockatiel', 20, 0, 13, 2500),
(16, 5, 'Large and stunning', 'Macaw', 55, 1, 14, 15000),
(17, 3, 'Affectionate and playful', 'Lovebird', 18, 0, 15, 2200),
(18, 4, 'Energetic and loving', 'Labrador Retriever', 58, 28, 19, 9500);

-- --------------------------------------------------------

--
-- Table structure for table `pet_donations`
--

CREATE TABLE `pet_donations` (
  `id` int NOT NULL,
  `age` int NOT NULL,
  `breed` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `donor_name` varchar(255) DEFAULT NULL,
  `pet_name` varchar(255) DEFAULT NULL,
  `isAvailable` tinyint(1) DEFAULT '1',
  `is_available` bit(1) DEFAULT NULL,
  `atmosphere` varchar(255) DEFAULT NULL,
  `height` double NOT NULL,
  `price` double NOT NULL,
  `weight` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `pet_donations`
--

INSERT INTO `pet_donations` (`id`, `age`, `breed`, `description`, `donor_name`, `pet_name`, `isAvailable`, `is_available`, `atmosphere`, `height`, `price`, `weight`) VALUES
(1, 4, 'bulldog', 'jks', 'markad satyajit', 'dog', 1, b'0', NULL, 0, 0, 0),
(2, 5, 'bulldog', 'jhhb', 'markad suhas', 'cat', 1, b'0', NULL, 0, 0, 0),
(4, 5, 'bulldog', 'nn', 'markad suhas', 'cat', 1, b'0', NULL, 0, 0, 0),
(5, 5, 'bulldog', 'nn', 'markad suhas', 'cat', 1, b'0', NULL, 0, 0, 0),
(6, 5, 'bulldog', 'nn', 'markad suhas', 'cat', 1, b'1', 'Indoor', 120, 2500, 1.2),
(7, 5, 'bulldog', 'nn', 'markad suhas', 'cat', 1, b'1', 'Indoor', 120, 2500, 1.2);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `fullName` varchar(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `name`, `fullName`, `password`, `username`) VALUES
(1, 'rajp66228@gamil.com', 'Raju Vishnu Puri', 'Raju Vishnu Puri', 'Rajp@123', 'Rajp@123'),
(2, NULL, NULL, 'raju puri', '1234', 'rajp66228@gmail.com'),
(3, NULL, NULL, 'puriraj514@gmail.com', '1234', 'puriraj514@gmail.com'),
(4, NULL, NULL, 'Raju Vishnu Puri', '1234', '74aniketpatil@gmail.com');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_mi8vkhus4xbdbqcac2jm4spvd` (`username`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pets`
--
ALTER TABLE `pets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pet_details`
--
ALTER TABLE `pet_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK7l4mfcyu99dxxta5ce4rvok1c` (`pet_id`);

--
-- Indexes for table `pet_donations`
--
ALTER TABLE `pet_donations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_r43af9ap4edm43mmtq01oddj6` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `pets`
--
ALTER TABLE `pets`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `pet_details`
--
ALTER TABLE `pet_details`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `pet_donations`
--
ALTER TABLE `pet_donations`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `pet_details`
--
ALTER TABLE `pet_details`
  ADD CONSTRAINT `FK7l4mfcyu99dxxta5ce4rvok1c` FOREIGN KEY (`pet_id`) REFERENCES `pets` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

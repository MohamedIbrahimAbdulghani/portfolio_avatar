-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 26, 2023 at 02:17 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `portfolio-avatar`
--

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `message` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `portfolio`
--

CREATE TABLE `portfolio` (
  `id` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `portfolio`
--

INSERT INTO `portfolio` (`id`, `image`, `description`, `user_id`) VALUES
(52, '2023-bmw-x7-xdrive40i-106-1661662114.jpg', '<p>oh, sorry i forgit upload my photo<br></p>', 45),
(55, '296153401_3349989138608147_5738072484164584422_n.jpg', '<p>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Quisquam, nesciunt? Voluptates aspernatur eius est ut maxime inventore nemo similique minima unde, earum consequatur reiciendis, suscipit, cumque eaque recusandae. Culpa, iusto?</p>', 46),
(58, '297263235_3350384941901900_691325776279678635_n.jpg', '<p>Lorem ipsum, dolor sit amet consectetur adipisicing elit. Qui quas nemo, perferendis officiis similique id! Rerum harum eaque nulla consectetur? Cupiditate animi porro sunt quod officia vero illo expedita dicta.Lorem ipsum, dolor sit amet consectetur adipisicing elit. Qui quas nemo, perferendis officiis similique id! Rerum harum eaque nulla consectetur? Cupiditate animi porro sunt quod officia vero illo expedita dicta.Lorem ipsum, dolor sit amet consectetur adipisicing elit. Qui quas nemo, perferendis officiis similique id! Rerum harum eaque nulla consectetur? Cupiditate animi porro sunt quod officia vero illo expedita dicta.Lorem ipsum, dolor sit amet consectetur adipisicing elit. Qui quas nemo, perferendis officiis similique id! Rerum harum eaque nulla consectetur? Cupiditate animi porro sunt quod officia vero illo expedita dicta.Lorem ipsum, dolor sit amet consectetur adipisicing elit. Qui quas nemo, perferendis officiis similique id! Rerum harum eaque nulla consectetur? Cupiditate animi porro sunt quod officia vero illo expedita dicta.<br></p>', 45),
(63, '293594950_588503819510665_5614241328969551857_n.jpg', '<p>hello, my name is mohamed ibrahim abdulghani <br></p>', 45);

-- --------------------------------------------------------

--
-- Table structure for table `setting`
--

CREATE TABLE `setting` (
  `id` int(11) NOT NULL,
  `image_avatar` varchar(255) NOT NULL,
  `about` text NOT NULL,
  `title` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `name`, `email`, `password`) VALUES
(45, 'mohamed ibrahim abdulghani', 'mohamedibrahimabdulghani@gmail.com', '1'),
(46, 'ahmed', 'ahmed@gmail.com', '123'),
(47, 'rana', 'rana@gmail.com', '1'),
(48, 'alaa', 'alaa@hotmail.com', '01022153598'),
(49, 'rana hosny', 'ranahosny@gmail.com', '1');

-- --------------------------------------------------------

--
-- Stand-in structure for view `user_portfolio`
-- (See below for the actual view)
--
CREATE TABLE `user_portfolio` (
`id` int(11)
,`name` varchar(255)
,`description` text
,`image` varchar(255)
);

-- --------------------------------------------------------

--
-- Structure for view `user_portfolio`
--
DROP TABLE IF EXISTS `user_portfolio`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `user_portfolio`  AS SELECT `portfolio`.`id` AS `id`, `user`.`name` AS `name`, `portfolio`.`description` AS `description`, `portfolio`.`image` AS `image` FROM (`portfolio` join `user` on(`user`.`id` = `portfolio`.`user_id`)) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `portfolio`
--
ALTER TABLE `portfolio`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `setting`
--
ALTER TABLE `setting`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `portfolio`
--
ALTER TABLE `portfolio`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT for table `setting`
--
ALTER TABLE `setting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `portfolio`
--
ALTER TABLE `portfolio`
  ADD CONSTRAINT `portfolio_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `setting`
--
ALTER TABLE `setting`
  ADD CONSTRAINT `setting_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

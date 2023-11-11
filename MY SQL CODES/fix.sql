-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 09, 2023 at 07:49 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gym`
--




--  TASK
--+--------------------------------------------------------------------------------------------------------------------------+
--+ in this excercise "FIX MY MySQL code" you are required to make sure all queries execute succesfully                      |
-- for every table and the entire database. You are also required to perform some tasks that have been asked in comment form |
-- at every table. all the results/queries should be added below the tables where it is written '-- YOUR QUERY HERE--'.      |
--+ This covers most if not all of what we have done in this weeks class. Cheers!                                            |
-----------------------------------------------------------------------------------------------------------------------------+
-- NOTE: YOU MUST CREATE THE DATABASE "GYM" IN ORDER TO USE IT 




--
-- Table structure for table `billing`
--


	CREATE TABLE `billing` ( 
        `id` int NOT NULL, 
        `name` varchar(20) NOT NULL,
         `date` date NOT NULL,
        `amount` decimal(10, 2) NOT NULL
          ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
--
-- Dumping data for table `billing
--

INSERT INTO `billing` (`id` `name`, `date`, `amount`) VALUES
('1', 'BillAzam', '12-06-2022', '5000'), -- perform concatenation for the names to have spaces in between them
('1', 'Taha Azam' '12-06-2022', '5000'), -- perform on amout (sum, average, count, and aggregate), also perform grouping using names in an ascending order
('2', 'Sara', '12-06-2022', '45000'); -- show the existing tables in the database
--- also alter the amount to be in decimal form from its current integer form
-- YOUR QUERY HERE--
INSERT INTO `billing` (`id`, `name`, `date`, `amount`) 
VALUES ('1', 'Bill Azam', '2022-06-12', '5000'), 
('1', 'Taha Azam', '2022-06-12', '5000'),
 ('2', 'Sara', '2022-06-12', '45000');

	SELECT `name`, SUM(`amount`) AS total_amount, AVG(`amount`) AS average_amount, COUNT(*) AS record_count FROM `billing` GROUP BY `name` ORDER BY `name` ASC;
	SHOW TABLES;
	ALTER TABLE `billing` MODIFY `amount` DECIMAL(10, 2);



-- --------------------------------------------------------

--
-- Table structure for table `coach`
--

CREATE TABLE `coach` (
  `id` varchar(20) NOT NULL,
  `name` varchar(20) NOT NULL,
  `date` varchar(20) NOT NULL
  `experience` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `coach`
--

INSERT INTO `coach` (`id`, `name` date`, `experience`) VALUES
('1', 'John', '12-06-2002', '2') -- add 3 more coaches 
-- YOUR QUERY HERE--

-- --------------------------------------------------------
INSERT INTO `coach` (`id`, `name`, `date`, `experience`) VALUES
('1', 'John', '2002-06-12', '2'), 
('2', 'Saka', '2005-03-21', '5'),
 ('3', 'Susan', '1998-08-15', '10'), 
 ('4', 'Brian', '2010-11-30', '1');

--
-- Table structure for table `member`
--


CREATE TABLE `member` ( 
    `id` int(20) NOT NULL, 
    `name` varchar(20) NOT NULL, 
    `date` date NOT NULL, 
    `dob` date NOT NULL, 
    `phone` varchar(20) NOT NULL,
     `coach` int(20) NOT NULL 
     ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table `member`
--

INSERT INTO `member` (`id`, `name`, `date`, `dob`, `phone`, `coach`) VALUES
('1', 'Taayyab', '06 August 2012', '21-july-1998', '03422506772', 'john'); -- add 2 more members
-- YOUR QUERY HERE--

-- --------------------------------------------------------
INSERT INTO `member` (`id`, `name`, `date`, `dob`, `phone`, `coach`) VALUES 
('1', 'Taayyab', '2012-08-06', '1998-07-21', '03422506772', 1),
 ('2', 'Vera', '2010-05-14', '1995-12-03', '1234567890', 2),
  ('3', 'Adhiambo', '2015-11-19', '2000-04-25', '9876543210', 3);


--
-- Table structure for table `receptionist`
--

CREATE TABLE `receptionist` ( 
    `id` int(20) NOT NULL, 
    `name` varchar(20) NOT NULL,
     `date` date NOT NULL, 
     `address` varchar(100) NOT NULL,
     `phone` varchar(20) NOT NULL 
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `receptionist`
--

INSERT INTO `receptionist` (`id`, `name`, `date`, `address` `phone`) VALUES
('1', 'Sras'vati', '12-06-2002', 'sa - 140, Maputo', 'sada'); -- add 5 more receprionists
COMMIT

-- YOUR QUERY HERE--


INSERT INTO `receptionist` (`id`, `name`, `date`, `address`, `phone`) VALUES 
('1', 'Sarasvati', '2002-06-12', 'sa - 140, Maputo', '1234567890'), 
('2', 'Deno', '2000-01-15', '123 Saika', '9876543210'),
 ('3', 'Vero', '1998-11-25', '456 Ngong', '5555555555'), 
 ('4', 'Biko', '2005-08-03', '789 Karen', '1111111111'),
  ('5', 'Eve', '2010-04-17', '101 Pipline', '9999999999'),
   ('6', 'Azziad', '2008-09-09', '222 Nyanza', '7777777777');

---
-- perform an inner join, outer join, left join and right join for the table receptionist and coach.
-- The joins should include the id, foreign key, name of the left table and address on the right table.
-- Make the first 4 ID's of the tables to match and leave the rest of the table as it is.
-- Display your joined table
-- Display your database


-- YOUR QUERY HERE--
--THE JOINS QUERY----------------
---INNER JOIN---

SELECT r.id AS receptionist_id,
 r.name AS receptionist_name, r.address AS receptionist_address, 
 c.id AS coach_id, c.name AS coach_name FROM `receptionist` r INNER JOIN `coach` c ON r.id = c.id WHERE r.id <= 4;

---OUTER JOIN---

----LEFT JOIN--- RIGHT JOIN---


/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

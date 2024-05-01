-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 01, 2024 at 06:48 PM
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
-- Database: `production_automation`
--

-- --------------------------------------------------------

--
-- Table structure for table `bundles`
--

CREATE TABLE `bundles` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `bundle_code` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bundles`
--

INSERT INTO `bundles` (`id`, `order_id`, `bundle_code`) VALUES
(621, 27, 1),
(622, 27, 2),
(623, 27, 3),
(624, 27, 4),
(625, 27, 5),
(626, 27, 6),
(627, 27, 7),
(628, 27, 8),
(629, 27, 9),
(630, 27, 10);

-- --------------------------------------------------------

--
-- Table structure for table `buyers`
--

CREATE TABLE `buyers` (
  `id` int(11) NOT NULL,
  `company_name` varchar(100) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `address` text NOT NULL,
  `contract_person` varchar(50) NOT NULL,
  `bank_info` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `buyers`
--

INSERT INTO `buyers` (`id`, `company_name`, `email`, `phone`, `address`, `contract_person`, `bank_info`) VALUES
(7, 'Adidas AG ', ' adidasag@gmail.com', ' 01701005060', ' Germany', 'Jony', 'DBDL,AC(7017015314486)'),
(8, 'BCBG Maxazria', ' bcbg@gmail.com', ' 01714613653', ' United States', 'Sajib', 'BRAC NO: 73133468847'),
(9, 'Lululemon Athletica', ' hgjdhg@gmail.com', ' 01754675321', ' France', 'Spaitdn', 'BRAC NO: 73133468847'),
(10, 'Ross Stores ', ' example@gmai.com', ' 01987654376', ' United States', 'Anvir', 'DBDL,AC(7017015314486)');

-- --------------------------------------------------------

--
-- Table structure for table `buyer_payment`
--

CREATE TABLE `buyer_payment` (
  `id` int(11) NOT NULL,
  `buyer_id` int(11) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `date` date NOT NULL,
  `method` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `buyer_payment`
--

INSERT INTO `buyer_payment` (`id`, `buyer_id`, `amount`, `date`, `method`) VALUES
(81, 9, 10000.00, '2024-01-22', 'NAGAD'),
(82, 8, 10000.00, '2024-01-02', 'NAGAD');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`) VALUES
(1, 'Fabric'),
(2, 'Color'),
(3, 'Botton'),
(4, 'Pin'),
(5, 'Ditergen');

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`id`, `name`) VALUES
(5, 'Admin'),
(6, 'HR'),
(7, 'Accounts'),
(8, 'Marketing'),
(9, 'Qulality Control'),
(10, 'worker');

-- --------------------------------------------------------

--
-- Table structure for table `error_reports`
--

CREATE TABLE `error_reports` (
  `id` int(11) NOT NULL,
  `machine_id` int(11) NOT NULL,
  `error_time` timestamp NULL DEFAULT NULL,
  `error` varchar(255) DEFAULT NULL,
  `note` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `error_reports`
--

INSERT INTO `error_reports` (`id`, `machine_id`, `error_time`, `error`, `note`) VALUES
(4, 2, '2024-01-02 13:32:00', 'Falt', 'Voltage');

-- --------------------------------------------------------

--
-- Table structure for table `expense`
--

CREATE TABLE `expense` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `expense_category`
--

CREATE TABLE `expense_category` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `expense_category`
--

INSERT INTO `expense_category` (`id`, `name`) VALUES
(2, 'Shoping'),
(3, 'Traveling');

-- --------------------------------------------------------

--
-- Table structure for table `finished_product`
--

CREATE TABLE `finished_product` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `quantity` decimal(10,2) NOT NULL,
  `unit_id` int(11) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `finished_product_wastage`
--

CREATE TABLE `finished_product_wastage` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `quantity` decimal(10,2) NOT NULL,
  `unit_id` int(11) NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `machines`
--

CREATE TABLE `machines` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `model` varchar(255) NOT NULL,
  `error` enum('yes','no') NOT NULL DEFAULT 'no',
  `error_time` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `machines`
--

INSERT INTO `machines` (`id`, `name`, `type`, `model`, `error`, `error_time`) VALUES
(1, 'fabric selection', 'manual', 'NA', 'no', NULL),
(2, 'cutting machine', 'cutter', 'A0456', 'no', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `material_wastage`
--

CREATE TABLE `material_wastage` (
  `id` int(11) NOT NULL,
  `material_id` int(11) NOT NULL,
  `quantity` decimal(10,2) NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `material_wastage`
--

INSERT INTO `material_wastage` (`id`, `material_id`, `quantity`, `date`) VALUES
(1, 1, 0.00, '2023-12-06 00:00:00'),
(2, 1, 200.00, '2023-12-05 00:00:00'),
(3, 3, 150.00, '2023-12-10 00:00:00'),
(4, 3, 90.00, '2023-12-17 00:00:00'),
(5, 2, 45.00, '2023-12-29 00:00:00'),
(6, 2, 100.00, '2024-05-01 00:00:00'),
(7, 2, 100.00, '2024-05-01 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `material_wastage_dump`
--

CREATE TABLE `material_wastage_dump` (
  `id` int(11) NOT NULL,
  `material_id` int(11) NOT NULL,
  `quantity` decimal(10,2) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `material_wastage_dump`
--

INSERT INTO `material_wastage_dump` (`id`, `material_id`, `quantity`, `date`) VALUES
(1, 1, 40.00, '2023-12-20'),
(4, 1, 11.00, '2023-12-29'),
(5, 1, 11.00, '2023-12-29'),
(6, 2, 5.00, '2023-12-28'),
(7, 3, 5.00, '2023-12-29');

-- --------------------------------------------------------

--
-- Table structure for table `material_wastage_sale`
--

CREATE TABLE `material_wastage_sale` (
  `id` int(11) NOT NULL,
  `invoice_id` int(11) NOT NULL,
  `material_id` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `secondary_buyer_id` int(11) NOT NULL,
  `quantity` decimal(10,2) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `material_wastage_sale`
--

INSERT INTO `material_wastage_sale` (`id`, `invoice_id`, `material_id`, `price`, `secondary_buyer_id`, `quantity`, `date`) VALUES
(1, 623885553, 1, 111.00, 1, 20.00, '2023-12-20'),
(2, 646594764, 1, 44.00, 1, 56.00, '2023-12-29');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `invoice` bigint(20) NOT NULL,
  `project_id` int(11) NOT NULL,
  `buyer_id` int(11) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `quantity` decimal(10,2) NOT NULL,
  `unit_id` int(11) NOT NULL,
  `project_manager_id` int(11) NOT NULL,
  `supervisor_id` int(11) NOT NULL,
  `rate` decimal(10,2) NOT NULL,
  `total_price` bigint(255) NOT NULL,
  `paid_amount` int(255) NOT NULL,
  `status` enum('running','finished','','') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `invoice`, `project_id`, `buyer_id`, `start_date`, `end_date`, `quantity`, `unit_id`, `project_manager_id`, `supervisor_id`, `rate`, `total_price`, `paid_amount`, `status`) VALUES
(27, 2373131, 4, 7, '2024-05-01', '2025-01-01', 10.00, 1, 45, 44, 95.00, 9500, 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `processing_steps`
--

CREATE TABLE `processing_steps` (
  `id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `processing_steps`
--

INSERT INTO `processing_steps` (`id`, `project_id`, `title`) VALUES
(35, 4, 'Fabrice Selecting'),
(36, 4, 'Designing'),
(37, 4, 'Cutting'),
(38, 4, 'Fitting'),
(39, 4, 'Packeting'),
(40, 5, 'Fabrice Selecting'),
(41, 5, 'Fittiong'),
(42, 5, 'Packeting'),
(43, 6, 'Fabrice Selecting'),
(44, 6, 'Designing'),
(45, 6, 'Fitting'),
(46, 6, 'packeting'),
(47, 7, 'Fabrice Selecting'),
(48, 7, 'Designing'),
(49, 7, 'cutting'),
(50, 7, 'Fitting'),
(51, 7, 'packeting'),
(58, 8, 'Fabrice Selecting'),
(59, 8, 'Cutting'),
(60, 8, 'Sweing');

-- --------------------------------------------------------

--
-- Table structure for table `projects`
--

CREATE TABLE `projects` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `details` text NOT NULL,
  `prossesing_steps` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `projects`
--

INSERT INTO `projects` (`id`, `name`, `details`, `prossesing_steps`) VALUES
(4, 'T-shirt', 'Easy Quality', '5'),
(5, 'Hoodie', 'Local Size', '3'),
(6, 'shirts', 'Bangladesh is one of the leading exporters', '4'),
(7, 'jeans', 'Bangladesh’s aquaculture industry', '5'),
(8, 'test_project', 'hfhgdfuc', '3');

-- --------------------------------------------------------

--
-- Table structure for table `project_materials`
--

CREATE TABLE `project_materials` (
  `id` int(11) NOT NULL,
  `material_id` int(11) NOT NULL,
  `quantity` decimal(10,2) NOT NULL,
  `order_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `project_materials`
--

INSERT INTO `project_materials` (`id`, `material_id`, `quantity`, `order_id`) VALUES
(1, 3, 200.00, 3),
(2, 1, 200.00, 5);

-- --------------------------------------------------------

--
-- Table structure for table `purchase`
--

CREATE TABLE `purchase` (
  `id` int(11) NOT NULL,
  `invoice_id` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `material_id` int(11) NOT NULL,
  `supplier_id` int(11) NOT NULL,
  `quantity` decimal(10,2) NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `purchase`
--

INSERT INTO `purchase` (`id`, `invoice_id`, `price`, `material_id`, `supplier_id`, `quantity`, `date`) VALUES
(12, 245518384, 1400000.00, 1, 1, 200.00, '2024-01-01 20:09:58'),
(13, 245518384, 5000000.00, 2, 3, 1000.00, '2024-01-01 20:09:58');

-- --------------------------------------------------------

--
-- Table structure for table `raw_materials`
--

CREATE TABLE `raw_materials` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `unit_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `raw_materials`
--

INSERT INTO `raw_materials` (`id`, `name`, `price`, `unit_id`, `category_id`) VALUES
(1, 'Fabrics', 7000.00, 2, 1),
(2, 'Threard', 5000.00, 2, 2),
(3, 'Botam', 1200.00, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `return_from_buyer`
--

CREATE TABLE `return_from_buyer` (
  `id` int(11) NOT NULL,
  `date` date NOT NULL,
  `invoice_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `quantity` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `return_from_buyer`
--

INSERT INTO `return_from_buyer` (`id`, `date`, `invoice_id`, `order_id`, `quantity`) VALUES
(14, '2024-01-02', 687541016, 24, 15.00);

-- --------------------------------------------------------

--
-- Table structure for table `secondary_buyer`
--

CREATE TABLE `secondary_buyer` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `address` text NOT NULL,
  `email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `secondary_buyer`
--

INSERT INTO `secondary_buyer` (`id`, `name`, `phone`, `address`, `email`) VALUES
(1, 'shart', '01714613653', 'dhaka', 'nur@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `shipping`
--

CREATE TABLE `shipping` (
  `id` int(11) NOT NULL,
  `invoice_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `quantity` decimal(10,2) NOT NULL,
  `unit_id` int(11) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `shipping`
--

INSERT INTO `shipping` (`id`, `invoice_id`, `order_id`, `quantity`, `unit_id`, `date`) VALUES
(23, 687541016, 24, 50.00, 2, '2024-01-02'),
(24, 772863554, 24, 10.00, 2, '2024-01-02');

-- --------------------------------------------------------

--
-- Table structure for table `stock_out`
--

CREATE TABLE `stock_out` (
  `id` int(11) NOT NULL,
  `invoice_id` int(11) NOT NULL,
  `material_id` int(11) NOT NULL,
  `quantity` decimal(10,2) NOT NULL,
  `user_id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `project_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `stock_return`
--

CREATE TABLE `stock_return` (
  `id` int(11) NOT NULL,
  `invoice_id` int(11) NOT NULL,
  `quantity` decimal(10,2) NOT NULL,
  `date` date NOT NULL,
  `material_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `stock_return`
--

INSERT INTO `stock_return` (`id`, `invoice_id`, `quantity`, `date`, `material_id`) VALUES
(1, 604614674, 50.00, '2023-12-11', 1),
(2, 358457994, 150.00, '2023-12-11', 1);

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

CREATE TABLE `suppliers` (
  `id` int(11) NOT NULL,
  `company_name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `address` text NOT NULL,
  `contract_person` varchar(50) NOT NULL,
  `bank_info` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `suppliers`
--

INSERT INTO `suppliers` (`id`, `company_name`, `email`, `phone`, `address`, `contract_person`, `bank_info`) VALUES
(1, 'Rezaul', 'rezaul@gmail.com', '01785102654', 'Dhaka,Bangladesh', 'Shouli', 'BRAC BANK AC :9732463567'),
(2, 'Anam', 'anam@gmail.com', '01714613653', 'Dhanmondi', 'Foysal', 'BRAC BANK AC :9732463567'),
(3, 'Shauli', ' anambrurjkdhfhdi@gmail.com', ' 01701005060', 'Mirpur', 'Sajib', ' DBDL,AC(7017015314486)');

-- --------------------------------------------------------

--
-- Table structure for table `supplier_payment`
--

CREATE TABLE `supplier_payment` (
  `id` int(11) NOT NULL,
  `supplier_id` int(11) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `method` varchar(100) NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `supplier_payment`
--

INSERT INTO `supplier_payment` (`id`, `supplier_id`, `amount`, `method`, `date`) VALUES
(1, 1, 12000.00, ' DBBL', '2023-12-05 00:00:00'),
(2, 1, 12000.00, ' BKASH', '2023-12-04 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `transfers`
--

CREATE TABLE `transfers` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `processing_steps_id` int(11) NOT NULL,
  `bundle_id` int(11) NOT NULL,
  `received_date` datetime DEFAULT NULL,
  `transfer_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transfers`
--

INSERT INTO `transfers` (`id`, `order_id`, `processing_steps_id`, `bundle_id`, `received_date`, `transfer_date`) VALUES
(49, 27, 35, 621, '2024-05-01 16:58:35', '2024-05-02 16:58:35'),
(50, 27, 36, 622, '2024-05-01 16:58:58', '2024-05-01 17:02:58'),
(51, 27, 36, 623, '2024-05-01 16:59:47', '0000-00-00 00:00:00'),
(52, 27, 38, 624, '2024-05-01 17:00:06', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `units`
--

CREATE TABLE `units` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `units`
--

INSERT INTO `units` (`id`, `name`) VALUES
(1, 'Metter'),
(2, 'Pices'),
(3, 'KG'),
(4, 'Bundle');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `department_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `address` text NOT NULL,
  `photo` varchar(255) NOT NULL,
  `designation` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `department_id`, `name`, `email`, `password`, `phone`, `address`, `photo`, `designation`) VALUES
(42, 5, 'helal', 'helal@gmail.com', '827ccb0eea8a706c4c34a16891f84e7b', '123', 'dhaka', '', 'CEO'),
(43, 5, 'devhelal', 'devhelal@gmail.com', '827ccb0eea8a706c4c34a16891f84e7b', '01811121902', 'dh', '', 'CEO'),
(44, 5, 'supervisor', 'supervisor@devhelal.com', '827ccb0eea8a706c4c34a16891f84e7b', '01811121902', 'dhaka', '', 'Supervisor'),
(45, 5, 'manager', 'manager@devhelal.com', '827ccb0eea8a706c4c34a16891f84e7b', '01811121902', 'dhaka', '', 'Manager'),
(46, 10, 'worker1', 'worker@devhelal.com', '827ccb0eea8a706c4c34a16891f84e7b', '01811121902', 'dhaka', '', 'Worker'),
(47, 10, 'worker2', 'worker2@devhelal.com', '827ccb0eea8a706c4c34a16891f84e7b', '01811121902', 'dhaka', '', 'Worker'),
(48, 10, 'worker3', 'worker3@devhelal.com', '827ccb0eea8a706c4c34a16891f84e7b', '01811121902', 'dhaka', '', 'Worker'),
(49, 10, 'worker4', 'worker4@devhelal.com', '827ccb0eea8a706c4c34a16891f84e7b', '01811121902', 'dhaka', '', 'Worker'),
(50, 10, 'worker5', 'worker5@devhelal.com', '827ccb0eea8a706c4c34a16891f84e7b', '01811121902', 'dhaka', '', 'Worker');

-- --------------------------------------------------------

--
-- Table structure for table `worker_assign`
--

CREATE TABLE `worker_assign` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `processing_steps_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `duration` decimal(10,2) NOT NULL,
  `machine_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `worker_assign`
--

INSERT INTO `worker_assign` (`id`, `order_id`, `processing_steps_id`, `user_id`, `duration`, `machine_id`) VALUES
(40, 27, 35, 46, 15.00, 1),
(41, 27, 36, 47, 15.00, 2),
(42, 27, 37, 48, 15.00, 3),
(43, 27, 38, 49, 10.00, 4),
(44, 27, 39, 50, 20.00, 5);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bundles`
--
ALTER TABLE `bundles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `buyers`
--
ALTER TABLE `buyers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `buyer_payment`
--
ALTER TABLE `buyer_payment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `buyer_id` (`buyer_id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `error_reports`
--
ALTER TABLE `error_reports`
  ADD PRIMARY KEY (`id`),
  ADD KEY `machine_id` (`machine_id`);

--
-- Indexes for table `expense`
--
ALTER TABLE `expense`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `expense_category`
--
ALTER TABLE `expense_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `finished_product`
--
ALTER TABLE `finished_product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `unit_id` (`unit_id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `finished_product_wastage`
--
ALTER TABLE `finished_product_wastage`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `unit_id` (`unit_id`);

--
-- Indexes for table `machines`
--
ALTER TABLE `machines`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `material_wastage`
--
ALTER TABLE `material_wastage`
  ADD PRIMARY KEY (`id`),
  ADD KEY `material_id` (`material_id`);

--
-- Indexes for table `material_wastage_dump`
--
ALTER TABLE `material_wastage_dump`
  ADD PRIMARY KEY (`id`),
  ADD KEY `material_id` (`material_id`);

--
-- Indexes for table `material_wastage_sale`
--
ALTER TABLE `material_wastage_sale`
  ADD PRIMARY KEY (`id`),
  ADD KEY `secondar_buyer_id` (`secondary_buyer_id`),
  ADD KEY `material_id` (`material_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `project_id` (`project_id`),
  ADD KEY `buyer_id` (`buyer_id`),
  ADD KEY `unit_id` (`unit_id`),
  ADD KEY `project_manager_id` (`project_manager_id`),
  ADD KEY `supervisor_id` (`supervisor_id`);

--
-- Indexes for table `processing_steps`
--
ALTER TABLE `processing_steps`
  ADD PRIMARY KEY (`id`),
  ADD KEY `project_id` (`project_id`);

--
-- Indexes for table `projects`
--
ALTER TABLE `projects`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `project_materials`
--
ALTER TABLE `project_materials`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `purchase`
--
ALTER TABLE `purchase`
  ADD PRIMARY KEY (`id`),
  ADD KEY `supplier_id` (`supplier_id`),
  ADD KEY `material_id` (`material_id`);

--
-- Indexes for table `raw_materials`
--
ALTER TABLE `raw_materials`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `unit_id` (`unit_id`);

--
-- Indexes for table `return_from_buyer`
--
ALTER TABLE `return_from_buyer`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `secondary_buyer`
--
ALTER TABLE `secondary_buyer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shipping`
--
ALTER TABLE `shipping`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `unit_id` (`unit_id`);

--
-- Indexes for table `stock_out`
--
ALTER TABLE `stock_out`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `material_id` (`material_id`);

--
-- Indexes for table `stock_return`
--
ALTER TABLE `stock_return`
  ADD PRIMARY KEY (`id`),
  ADD KEY `material_id` (`material_id`),
  ADD KEY `invoice_id` (`invoice_id`);

--
-- Indexes for table `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `supplier_payment`
--
ALTER TABLE `supplier_payment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `supplier_id` (`supplier_id`);

--
-- Indexes for table `transfers`
--
ALTER TABLE `transfers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bundle_id` (`bundle_id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `process_step_id` (`processing_steps_id`);

--
-- Indexes for table `units`
--
ALTER TABLE `units`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `department_id` (`department_id`);

--
-- Indexes for table `worker_assign`
--
ALTER TABLE `worker_assign`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `processing_steps_id` (`processing_steps_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `machine_id` (`machine_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bundles`
--
ALTER TABLE `bundles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=631;

--
-- AUTO_INCREMENT for table `buyers`
--
ALTER TABLE `buyers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `buyer_payment`
--
ALTER TABLE `buyer_payment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=83;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `error_reports`
--
ALTER TABLE `error_reports`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `expense`
--
ALTER TABLE `expense`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `expense_category`
--
ALTER TABLE `expense_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `finished_product`
--
ALTER TABLE `finished_product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `finished_product_wastage`
--
ALTER TABLE `finished_product_wastage`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `machines`
--
ALTER TABLE `machines`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `material_wastage`
--
ALTER TABLE `material_wastage`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `material_wastage_dump`
--
ALTER TABLE `material_wastage_dump`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `material_wastage_sale`
--
ALTER TABLE `material_wastage_sale`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `processing_steps`
--
ALTER TABLE `processing_steps`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `projects`
--
ALTER TABLE `projects`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `project_materials`
--
ALTER TABLE `project_materials`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `purchase`
--
ALTER TABLE `purchase`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `raw_materials`
--
ALTER TABLE `raw_materials`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `return_from_buyer`
--
ALTER TABLE `return_from_buyer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `secondary_buyer`
--
ALTER TABLE `secondary_buyer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `shipping`
--
ALTER TABLE `shipping`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `stock_out`
--
ALTER TABLE `stock_out`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `stock_return`
--
ALTER TABLE `stock_return`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `supplier_payment`
--
ALTER TABLE `supplier_payment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `transfers`
--
ALTER TABLE `transfers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `units`
--
ALTER TABLE `units`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `worker_assign`
--
ALTER TABLE `worker_assign`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bundles`
--
ALTER TABLE `bundles`
  ADD CONSTRAINT `bundles_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `buyer_payment`
--
ALTER TABLE `buyer_payment`
  ADD CONSTRAINT `buyer_payment_ibfk_1` FOREIGN KEY (`buyer_id`) REFERENCES `buyers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `expense`
--
ALTER TABLE `expense`
  ADD CONSTRAINT `expense_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `expense_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `expense_ibfk_3` FOREIGN KEY (`category_id`) REFERENCES `expense_category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `finished_product`
--
ALTER TABLE `finished_product`
  ADD CONSTRAINT `finished_product_ibfk_1` FOREIGN KEY (`unit_id`) REFERENCES `units` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `finished_product_ibfk_2` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `finished_product_wastage`
--
ALTER TABLE `finished_product_wastage`
  ADD CONSTRAINT `finished_product_wastage_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `finished_product_wastage_ibfk_2` FOREIGN KEY (`unit_id`) REFERENCES `units` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `material_wastage`
--
ALTER TABLE `material_wastage`
  ADD CONSTRAINT `material_wastage_ibfk_1` FOREIGN KEY (`material_id`) REFERENCES `raw_materials` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `material_wastage_dump`
--
ALTER TABLE `material_wastage_dump`
  ADD CONSTRAINT `material_wastage_dump_ibfk_1` FOREIGN KEY (`material_id`) REFERENCES `raw_materials` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `material_wastage_sale`
--
ALTER TABLE `material_wastage_sale`
  ADD CONSTRAINT `material_wastage_sale_ibfk_1` FOREIGN KEY (`secondary_buyer_id`) REFERENCES `secondary_buyer` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `material_wastage_sale_ibfk_2` FOREIGN KEY (`material_id`) REFERENCES `raw_materials` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`buyer_id`) REFERENCES `buyers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `orders_ibfk_3` FOREIGN KEY (`unit_id`) REFERENCES `units` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `orders_ibfk_4` FOREIGN KEY (`project_manager_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `orders_ibfk_5` FOREIGN KEY (`supervisor_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `processing_steps`
--
ALTER TABLE `processing_steps`
  ADD CONSTRAINT `processing_steps_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `purchase`
--
ALTER TABLE `purchase`
  ADD CONSTRAINT `purchase_ibfk_1` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `purchase_ibfk_2` FOREIGN KEY (`material_id`) REFERENCES `raw_materials` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `raw_materials`
--
ALTER TABLE `raw_materials`
  ADD CONSTRAINT `raw_materials_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `raw_materials_ibfk_2` FOREIGN KEY (`unit_id`) REFERENCES `units` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `stock_out`
--
ALTER TABLE `stock_out`
  ADD CONSTRAINT `stock_out_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `stock_out_ibfk_2` FOREIGN KEY (`material_id`) REFERENCES `raw_materials` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `stock_return`
--
ALTER TABLE `stock_return`
  ADD CONSTRAINT `stock_return_ibfk_1` FOREIGN KEY (`material_id`) REFERENCES `raw_materials` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `supplier_payment`
--
ALTER TABLE `supplier_payment`
  ADD CONSTRAINT `supplier_payment_ibfk_1` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `transfers`
--
ALTER TABLE `transfers`
  ADD CONSTRAINT `process_step_id` FOREIGN KEY (`processing_steps_id`) REFERENCES `processing_steps` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `transfers_ibfk_1` FOREIGN KEY (`bundle_id`) REFERENCES `bundles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `transfers_ibfk_2` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `worker_assign`
--
ALTER TABLE `worker_assign`
  ADD CONSTRAINT `worker_assign_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `worker_assign_ibfk_2` FOREIGN KEY (`processing_steps_id`) REFERENCES `processing_steps` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `worker_assign_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

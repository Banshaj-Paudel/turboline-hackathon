-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 18, 2024 at 08:31 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `databasesaadhanu`
--

-- --------------------------------------------------------

--
-- Table structure for table `products_vehicles`
--

CREATE TABLE `products_vehicles` (
  `vehicle_id` int(11) NOT NULL,
  `vehicle_name` varchar(100) NOT NULL,
  `vehicle_category` varchar(100) NOT NULL,
  `vehicle_description` varchar(255) NOT NULL,
  `vehicle_image` varchar(255) NOT NULL,
  `vehicle_price` varchar(12) NOT NULL,
  `vehicle_special_offer` int(2) NOT NULL,
  `vehicle_color` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `products_vehicles`
--

INSERT INTO `products_vehicles` (`vehicle_id`, `vehicle_name`, `vehicle_category`, `vehicle_description`, `vehicle_image`, `vehicle_price`, `vehicle_special_offer`, `vehicle_color`) VALUES
(1, 'Toyota Corolla', 'Car', '• Engine: 1.8L 4-cylinder\n• Horsepower: 139 hp\n• Torque: 126 lb-ft\n• Transmission: CVT\n• Fuel Efficiency: 30/38 MPG\n• Drivetrain: Front-Wheel Drive (FWD)', 'nexon.png', '20000', 0, 'White'),
(2, 'Honda Civic', 'Car', '• Engine: 2.0L 4-cylinder\n• Horsepower: 158 hp\n• Torque: 138 lb-ft\n• Transmission: 6-speed manual / CVT\n• Fuel Efficiency: 31/40 MPG\n• Drivetrain: Front-Wheel Drive (FWD)', 'suzuki swift.png\r\n', '22000', 1, 'Black'),
(3, 'Ford Mustang', 'Car', '• Engine: 5.0L V8\n• Horsepower: 450 hp\n• Torque: 410 lb-ft\n• Transmission: 6-speed manual / 10-speed automatic\n• Fuel Efficiency: 15/24 MPG\n• Drivetrain: Rear-Wheel Drive (RWD)', 'i20.png', '35000', 1, 'Red'),
(4, 'Chevrolet Camaro', 'Car', '• Engine: 6.2L V8\n• Horsepower: 455 hp\n• Torque: 455 lb-ft\n• Transmission: 6-speed manual / 10-speed automatic\n• Fuel Efficiency: 16/24 MPG\n• Drivetrain: Rear-Wheel Drive (RWD)', 'kiaseltos.png\r\n', '37000', 0, 'Blue'),
(5, 'Tesla Model S', 'Car', '• Engine: Dual Electric Motors\n• Horsepower: 670 hp\n• Torque: Instant torque from electric motors\n• Transmission: Single-speed automatic\n• Fuel Efficiency: Equivalent to 124 MPGe\n• Drivetrain: All-Wheel Drive (AWD)', 'tesla_model_s.jpg', '80000', 0, 'Silver'),
(6, 'BMW 3 Series', 'Car', '• Engine: 2.0L TwinPower Turbo 4-cylinder\n• Horsepower: 255 hp\n• Torque: 295 lb-ft\n• Transmission: 8-speed automatic\n• Fuel Efficiency: 26/36 MPG\n• Drivetrain: Rear-Wheel Drive (RWD)', 'bmw_3_series.jpg', '45000', 1, 'Grey'),
(7, 'Audi A4', 'Car', '• Engine: 2.0L TFSI Turbo 4-cylinder\n• Horsepower: 261 hp\n• Torque: 273 lb-ft\n• Transmission: 7-speed S tronic dual-clutch\n• Fuel Efficiency: 24/31 MPG\n• Drivetrain: All-Wheel Drive (AWD)', 'audi_a4.jpg', '43000', 0, 'Black'),
(8, 'Mercedes-Benz C-Class', 'Car', '• Engine: 2.0L Inline-4 Turbo\n• Horsepower: 255 hp\n• Torque: 273 lb-ft\n• Transmission: 9-speed automatic\n• Fuel Efficiency: 24/35 MPG\n• Drivetrain: Rear-Wheel Drive (RWD)', 'mercedes_c_class.jpg', '50000', 1, 'White'),
(9, 'Hyundai Sonata', 'Car', '• Engine: 2.5L 4-cylinder\n• Horsepower: 191 hp\n• Torque: 181 lb-ft\n• Transmission: 8-speed automatic\n• Fuel Efficiency: 28/38 MPG\n• Drivetrain: Front-Wheel Drive (FWD)', 'hyundai_sonata.jpg', '25000', 0, 'Blue'),
(10, 'Kia Optima', 'Car', '• Engine: 1.6L Turbo 4-cylinder\n• Horsepower: 180 hp\n• Torque: 195 lb-ft\n• Transmission: 7-speed dual-clutch automatic\n• Fuel Efficiency: 27/37 MPG\n• Drivetrain: Front-Wheel Drive (FWD)', 'kia_optima.jpg', '24000', 0, 'Red'),
(11, 'Yamaha YZF-R3', 'Bike', '• Engine: 321cc liquid-cooled DOHC inline twin-cylinder\n• Horsepower: 42 hp\n• Torque: 21.8 lb-ft\n• Transmission: 6-speed\n• Top Speed: 112 mph\n• Fuel Efficiency: 56 MPG\n• Drivetrain: Chain Drive', 'xpulse.png', '5500', 1, 'Blue'),
(12, 'Kawasaki Ninja 400', 'Bike', '• Engine: 399cc liquid-cooled parallel twin-cylinder\n• Horsepower: 49 hp\n• Torque: 28 lb-ft\n• Transmission: 6-speed\n• Top Speed: 118 mph\n• Fuel Efficiency: 50 MPG\n• Drivetrain: Chain Drive', 'diio.png', '6000', 0, 'Green'),
(13, 'Honda CBR500R', 'Bike', '• Engine: 471cc liquid-cooled parallel twin-cylinder\n• Horsepower: 47 hp\n• Torque: 32 lb-ft\n• Transmission: 6-speed\n• Top Speed: 116 mph\n• Fuel Efficiency: 70 MPG\n• Drivetrain: Chain Drive', 'ray125.png', '7000', 0, 'Red'),
(14, 'Suzuki GSX-R600', 'Bike', '• Engine: 599cc liquid-cooled 4-cylinder\n• Horsepower: 124 hp\n• Torque: 51 lb-ft\n• Transmission: 6-speed\n• Top Speed: 155 mph\n• Fuel Efficiency: 45 MPG\n• Drivetrain: Chain Drive', 'tvs raid.png', '9000', 1, 'White'),
(15, 'Ducati Monster 821', 'Bike', '• Engine: 821cc Testastretta 11° L-Twin\n• Horsepower: 109 hp\n• Torque: 63 lb-ft\n• Transmission: 6-speed\n• Top Speed: 140 mph\n• Fuel Efficiency: 41 MPG\n• Drivetrain: Chain Drive', 'ducati_monster_821.jpg', '12000', 0, 'Red'),
(16, 'Harley-Davidson Iron 883', 'Bike', '• Engine: 883cc Air-cooled Evolution V-Twin\n• Horsepower: 50 hp\n• Torque: 54 lb-ft\n• Transmission: 5-speed\n• Top Speed: 105 mph\n• Fuel Efficiency: 51 MPG\n• Drivetrain: Belt Drive', 'harley_iron_883.jpg', '10000', 1, 'Black'),
(17, 'Triumph Street Triple', 'Bike', '• Engine: 765cc liquid-cooled DOHC inline 3-cylinder\n• Horsepower: 121 hp\n• Torque: 58 lb-ft\n• Transmission: 6-speed\n• Top Speed: 150 mph\n• Fuel Efficiency: 48 MPG\n• Drivetrain: Chain Drive', 'triumph_street_triple.jpg', '11000', 0, 'Silver'),
(18, 'BMW S1000RR', 'Bike', '• Engine: 999cc liquid-cooled inline 4-cylinder\n• Horsepower: 199 hp\n• Torque: 83 lb-ft\n• Transmission: 6-speed\n• Top Speed: 186 mph\n• Fuel Efficiency: 44 MPG\n• Drivetrain: Chain Drive', 'bmw_s1000rr.jpg', '18000', 1, 'Blue'),
(19, 'KTM Duke 390', 'Bike', '• Engine: 373cc single-cylinder\n• Horsepower: 43 hp\n• Torque: 27 lb-ft\n• Transmission: 6-speed\n• Top Speed: 104 mph\n• Fuel Efficiency: 70 MPG\n• Drivetrain: Chain Drive', 'ktm_duke_390.jpg', '6000', 0, 'Orange'),
(20, 'Royal Enfield Classic 500', 'Bike', '• Engine: 499cc single-cylinder\n• Horsepower: 27 hp\n• Torque: 41 lb-ft\n• Transmission: 5-speed\n• Top Speed: 80 mph\n• Fuel Efficiency: 70 MPG\n• Drivetrain: Chain Drive', 'royal_enfield_classic_500.jpg', '8000', 0, 'Green');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `products_vehicles`
--
ALTER TABLE `products_vehicles`
  ADD PRIMARY KEY (`vehicle_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `products_vehicles`
--
ALTER TABLE `products_vehicles`
  MODIFY `vehicle_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

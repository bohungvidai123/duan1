-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Dec 03, 2024 at 07:46 PM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `duan1`
--

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `brand_id` int NOT NULL,
  `brand_name` varchar(50) NOT NULL,
  `image` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`brand_id`, `brand_name`, `image`) VALUES
(1, 'Apple', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTA5r0_FrSjm2OgttQLwh_CnVCnzbJ7dLv6oA&s'),
(2, 'Samsung', 'https://ibrand.vn/wp-content/uploads/2024/08/dc36c1d02dfe2ec192b7ec6d2289cb2d-1.png'),
(3, 'Oppo', 'https://mondialbrand.com/wp-content/uploads/2023/12/oppo-logo.png');

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `cart_id` int NOT NULL,
  `total_price` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `carts`
--

INSERT INTO `carts` (`cart_id`, `total_price`) VALUES
(1, 0),
(2, NULL),
(3, NULL),
(4, NULL),
(6, NULL),
(7, NULL),
(8, NULL),
(9, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cart_details`
--

CREATE TABLE `cart_details` (
  `cart_id` int NOT NULL,
  `phone_id` int NOT NULL,
  `quantity` smallint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `comment_id` int NOT NULL,
  `user_id` int NOT NULL,
  `phone_id` int NOT NULL,
  `content` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`comment_id`, `user_id`, `phone_id`, `content`, `comment_date`) VALUES
(9, 4, 42, 'hello boi', '2024-12-03'),
(10, 11, 43, 'tammmm', '2024-12-03'),
(11, 4, 43, 'afgfdg', '2024-12-03');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int NOT NULL,
  `user_id` int NOT NULL,
  `order_date` date NOT NULL,
  `address` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` smallint NOT NULL,
  `pay_method` smallint DEFAULT NULL,
  `number_phone` varchar(50) DEFAULT NULL,
  `total_price` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `user_id`, `order_date`, `address`, `status`, `pay_method`, `number_phone`, `total_price`) VALUES
(26, 11, '2024-12-03', 'nha cua hung', 0, 2, '35275427', 12000000),
(27, 11, '2024-12-03', 'nha cua hung', 1, 2, '24366', 12000000);

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `order_id` int NOT NULL,
  `phone_id` int NOT NULL,
  `quantity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`order_id`, `phone_id`, `quantity`) VALUES
(26, 43, 1),
(27, 43, 1);

-- --------------------------------------------------------

--
-- Table structure for table `phones`
--

CREATE TABLE `phones` (
  `phone_id` int NOT NULL,
  `name` varchar(50) NOT NULL,
  `brand_id` int NOT NULL,
  `price` int NOT NULL,
  `description` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `chip` varchar(50) NOT NULL,
  `ram` smallint NOT NULL,
  `camera` varchar(50) NOT NULL,
  `capacity` int NOT NULL,
  `display` varchar(50) NOT NULL,
  `hidden` tinyint(1) NOT NULL,
  `image_phone` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `phones`
--

INSERT INTO `phones` (`phone_id`, `name`, `brand_id`, `price`, `description`, `chip`, `ram`, `camera`, `capacity`, `display`, `hidden`, `image_phone`) VALUES
(4, 'iPhone X', 1, 2300000, 'Với thiết kế cực kỳ tinh xảo, độ hoàn thiện của máy là trên cả tuyệt vời. Chuẩn kháng nước và bụi bẩn cũng được nâng lên IP68 gúp bảo về máy tốt hơn. Viền màn hình đã được tối ưu rất mảnh, khu vực phía trên là phần tai thỏ để chứa camera tự sướng, loa thoại và nhiều cảm biến khác.', 'Apple A11 Bionic', 2, '12', 64, '6', 1, 'assets/images/iphoneX.webp'),
(5, 'Samsung A15', 2, 5000000, '“Hạ cánh” ở phân khúc smartphone 5 triệu đồng vào đúng thời điểm mua sắm nhộn nhịp nhất năm, Galaxy A15 là lựa chọn đáng để bạn trao gửi niềm tin khi sở hữu nhiều đặc điểm thường thấy ở dòng Galaxy S cao cấp, Samsung cũng cho thấy sự tinh tế khi mang tới bộ tính năng thực dụng và chiều lòng người dùng phổ thông.', 'SNAP DRAGON 900', 8, '60', 256, '12', 0, 'assets/images/samsunga15.jpg'),
(42, 'iPhone 15', 1, 16000000, '“iPhone 15 và iPhone 15 Plus thể hiện một bước nhảy vọt lớn với những cải tiến tuyệt vời về camera mang đến cảm hứng sáng tạo, Dynamic Island trực quan cùng các tính năng như Roadside Assistance thông qua vệ tinh tạo ra sự khác biệt lớn trong cuộc sống của người dùng.', 'A18 Biomnic', 8, '60', 512, '8', 0, 'assets/images/iphone15promax.jpg'),
(43, 'iPhone 13 Pro', 1, 12000000, 'iPhone 13 là một trong những mẫu smartphone nổi bật của Apple, được ra mắt vào tháng 9 năm 2021. Đây là phiên bản nâng cấp của dòng iPhone 12, với nhiều cải tiến về hiệu năng, camera, thời lượng pin và thiết kế.', 'Apple A15 Bionic', 8, '24', 512, '8', 0, 'assets/images/iphone13pro.jpg'),
(44, 'Oppo Reno 10', 3, 7000000, 'Oppo Reno 10 là dòng điện thoại tầm trung của Oppo, ra mắt vào năm 2023, thuộc dòng Reno Series. Reno 10 mang lại sự kết hợp hoàn hảo giữa hiệu suất mạnh mẽ, thiết kế tinh tế và các tính năng hiện đại, đáp ứng nhu cầu của người dùng yêu thích chụp ảnh, giải trí và sử dụng lâu dài. Dòng sản phẩm này bao gồm các phiên bản khác nhau, với các tính năng và cấu hình nâng cấp tùy theo từng mẫu.', 'Snap Dragon 800', 6, '12', 256, '12', 0, 'assets/images/opporeno10.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int NOT NULL,
  `cart_id` int DEFAULT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `number_phone` varchar(50) DEFAULT NULL,
  `full_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `create_at` date NOT NULL,
  `avarta` varchar(500) NOT NULL,
  `role` varchar(50) NOT NULL,
  `gender` smallint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `cart_id`, `username`, `password`, `number_phone`, `full_name`, `create_at`, `avarta`, `role`, `gender`) VALUES
(1, 1, 'bohungvidai', 'Tranhung1', '0327493056', 'Bố Hưng Vĩ Đại', '2024-11-20', 'fdgfdg', 'admin', 1),
(2, NULL, 'hungadmin', 'Tranhung1', '0327493056', 'Tran Dinh Hung', '2024-11-21', 'aaaa', 'admin', 1),
(4, 6, 'hungdeptrai', 'adsaf', '02354754843', 'Cụ Hưng', '2024-11-28', 'assets/images/avatar2.jpg', 'user', 1),
(11, 9, 'hungvidai', '1', '01348', 'Hello', '2024-12-03', 'assets/images/tải xuống (2).jpg', 'user', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`brand_id`);

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`cart_id`);

--
-- Indexes for table `cart_details`
--
ALTER TABLE `cart_details`
  ADD PRIMARY KEY (`cart_id`,`phone_id`),
  ADD KEY `fk_cart_details_phone` (`phone_id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`comment_id`),
  ADD KEY `fk_comment_phone` (`phone_id`),
  ADD KEY `fk_comment_user` (`user_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `fk_order` (`user_id`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`order_id`,`phone_id`),
  ADD KEY `fk_order_details_phone` (`phone_id`);

--
-- Indexes for table `phones`
--
ALTER TABLE `phones`
  ADD PRIMARY KEY (`phone_id`),
  ADD KEY `fk_brand` (`brand_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `fk_cart` (`cart_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `brand_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `cart_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `comment_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `phones`
--
ALTER TABLE `phones`
  MODIFY `phone_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart_details`
--
ALTER TABLE `cart_details`
  ADD CONSTRAINT `fk_cart_details_cart` FOREIGN KEY (`cart_id`) REFERENCES `carts` (`cart_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_cart_details_phone` FOREIGN KEY (`phone_id`) REFERENCES `phones` (`phone_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `fk_comment_phone` FOREIGN KEY (`phone_id`) REFERENCES `phones` (`phone_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_comment_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `fk_order` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `fk_order_details_order` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_order_details_phone` FOREIGN KEY (`phone_id`) REFERENCES `phones` (`phone_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `phones`
--
ALTER TABLE `phones`
  ADD CONSTRAINT `fk_brand` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`brand_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `fk_cart` FOREIGN KEY (`cart_id`) REFERENCES `carts` (`cart_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

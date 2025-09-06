-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Aug 06, 2025 at 06:00 AM
-- Server version: 10.11.10-MariaDB-log
-- PHP Version: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `u562451777_agileproject`
--

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `visitor_id` varchar(64) NOT NULL,
  `widget_id` varchar(64) DEFAULT NULL,
  `message` text NOT NULL,
  `sender_type` enum('visitor','agent') NOT NULL,
  `read` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `file_path` varchar(500) DEFAULT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  `file_size` varchar(50) DEFAULT NULL,
  `file_type` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `user_id`, `visitor_id`, `widget_id`, `message`, `sender_type`, `read`, `created_at`, `file_path`, `file_name`, `file_size`, `file_type`) VALUES
(3, 1, '1', NULL, 'hey dear how are you doing', 'agent', 0, '2025-05-20 12:12:46', NULL, NULL, NULL, NULL),
(4, 1, '1', NULL, 'can we hang out', 'agent', 0, '2025-05-20 12:12:54', NULL, NULL, NULL, NULL),
(5, 1, '1', NULL, 'today or tomorrow', 'agent', 0, '2025-05-20 12:12:59', NULL, NULL, NULL, NULL),
(6, 1, '12', '450a6c5bead35a8c3648a923a33da5a5', 'Test message for widget: 450a6c5bead35a8c3648a923a33da5a5 - Time: 2025-05-20 12:37:11', 'visitor', 1, '2025-05-20 12:37:11', NULL, NULL, NULL, NULL),
(7, 2, '13', '1d12f103859a704a890683a311761a7e', 'Test message for widget: 1d12f103859a704a890683a311761a7e - Time: 2025-05-20 12:37:11', 'visitor', 0, '2025-05-20 12:37:11', NULL, NULL, NULL, NULL),
(8, 3, '14', '22fb66ed96e13f73235a851dc213acf7', 'Test message for widget: 22fb66ed96e13f73235a851dc213acf7 - Time: 2025-05-20 12:37:11', 'visitor', 0, '2025-05-20 12:37:11', NULL, NULL, NULL, NULL),
(9, 4, '15', 'e899bca97a62bad5a59141af89af96c6', 'Test message for widget: e899bca97a62bad5a59141af89af96c6 - Time: 2025-05-20 12:37:11', 'visitor', 0, '2025-05-20 12:37:11', NULL, NULL, NULL, NULL),
(10, 1, '12', '450a6c5bead35a8c3648a923a33da5a5', 'Test message for widget: 450a6c5bead35a8c3648a923a33da5a5 - Time: 2025-05-20 12:37:32', 'visitor', 1, '2025-05-20 12:37:32', NULL, NULL, NULL, NULL),
(11, 2, '13', '1d12f103859a704a890683a311761a7e', 'Test message for widget: 1d12f103859a704a890683a311761a7e - Time: 2025-05-20 12:37:32', 'visitor', 0, '2025-05-20 12:37:32', NULL, NULL, NULL, NULL),
(12, 3, '14', '22fb66ed96e13f73235a851dc213acf7', 'Test message for widget: 22fb66ed96e13f73235a851dc213acf7 - Time: 2025-05-20 12:37:32', 'visitor', 0, '2025-05-20 12:37:32', NULL, NULL, NULL, NULL),
(13, 4, '15', 'e899bca97a62bad5a59141af89af96c6', 'Test message for widget: e899bca97a62bad5a59141af89af96c6 - Time: 2025-05-20 12:37:32', 'visitor', 0, '2025-05-20 12:37:32', NULL, NULL, NULL, NULL),
(14, 1, '12', '450a6c5bead35a8c3648a923a33da5a5', 'how are you doing bro', 'agent', 0, '2025-05-20 12:37:57', NULL, NULL, NULL, NULL),
(15, 1, '12', '450a6c5bead35a8c3648a923a33da5a5', 'Test message for widget: 450a6c5bead35a8c3648a923a33da5a5 - Time: 2025-05-20 12:46:43', 'visitor', 1, '2025-05-20 12:46:44', NULL, NULL, NULL, NULL),
(16, 2, '13', '1d12f103859a704a890683a311761a7e', 'Test message for widget: 1d12f103859a704a890683a311761a7e - Time: 2025-05-20 12:46:44', 'visitor', 0, '2025-05-20 12:46:44', NULL, NULL, NULL, NULL),
(17, 3, '14', '22fb66ed96e13f73235a851dc213acf7', 'Test message for widget: 22fb66ed96e13f73235a851dc213acf7 - Time: 2025-05-20 12:46:44', 'visitor', 0, '2025-05-20 12:46:44', NULL, NULL, NULL, NULL),
(18, 4, '15', 'e899bca97a62bad5a59141af89af96c6', 'Test message for widget: e899bca97a62bad5a59141af89af96c6 - Time: 2025-05-20 12:46:44', 'visitor', 0, '2025-05-20 12:46:44', NULL, NULL, NULL, NULL),
(19, 1, '12', '450a6c5bead35a8c3648a923a33da5a5', 'Test message for widget: 450a6c5bead35a8c3648a923a33da5a5 - Time: 2025-05-20 13:27:42', 'visitor', 1, '2025-05-20 13:27:42', NULL, NULL, NULL, NULL),
(20, 2, '13', '1d12f103859a704a890683a311761a7e', 'Test message for widget: 1d12f103859a704a890683a311761a7e - Time: 2025-05-20 13:27:42', 'visitor', 0, '2025-05-20 13:27:42', NULL, NULL, NULL, NULL),
(21, 3, '14', '22fb66ed96e13f73235a851dc213acf7', 'Test message for widget: 22fb66ed96e13f73235a851dc213acf7 - Time: 2025-05-20 13:27:42', 'visitor', 0, '2025-05-20 13:27:43', NULL, NULL, NULL, NULL),
(22, 4, '15', 'e899bca97a62bad5a59141af89af96c6', 'Test message for widget: e899bca97a62bad5a59141af89af96c6 - Time: 2025-05-20 13:27:43', 'visitor', 0, '2025-05-20 13:27:43', NULL, NULL, NULL, NULL),
(23, 1, '12', '450a6c5bead35a8c3648a923a33da5a5', 'Test message for widget: 450a6c5bead35a8c3648a923a33da5a5 - Time: 2025-05-20 13:27:49', 'visitor', 1, '2025-05-20 13:27:49', NULL, NULL, NULL, NULL),
(24, 2, '13', '1d12f103859a704a890683a311761a7e', 'Test message for widget: 1d12f103859a704a890683a311761a7e - Time: 2025-05-20 13:27:49', 'visitor', 0, '2025-05-20 13:27:49', NULL, NULL, NULL, NULL),
(25, 3, '14', '22fb66ed96e13f73235a851dc213acf7', 'Test message for widget: 22fb66ed96e13f73235a851dc213acf7 - Time: 2025-05-20 13:27:49', 'visitor', 0, '2025-05-20 13:27:49', NULL, NULL, NULL, NULL),
(26, 4, '15', 'e899bca97a62bad5a59141af89af96c6', 'Test message for widget: e899bca97a62bad5a59141af89af96c6 - Time: 2025-05-20 13:27:49', 'visitor', 0, '2025-05-20 13:27:49', NULL, NULL, NULL, NULL),
(27, 1, '12', '450a6c5bead35a8c3648a923a33da5a5', 'Test message for widget: 450a6c5bead35a8c3648a923a33da5a5 - Time: 2025-05-20 13:27:52', 'visitor', 1, '2025-05-20 13:27:52', NULL, NULL, NULL, NULL),
(28, 2, '13', '1d12f103859a704a890683a311761a7e', 'Test message for widget: 1d12f103859a704a890683a311761a7e - Time: 2025-05-20 13:27:52', 'visitor', 0, '2025-05-20 13:27:52', NULL, NULL, NULL, NULL),
(29, 3, '14', '22fb66ed96e13f73235a851dc213acf7', 'Test message for widget: 22fb66ed96e13f73235a851dc213acf7 - Time: 2025-05-20 13:27:52', 'visitor', 0, '2025-05-20 13:27:52', NULL, NULL, NULL, NULL),
(30, 4, '15', 'e899bca97a62bad5a59141af89af96c6', 'Test message for widget: e899bca97a62bad5a59141af89af96c6 - Time: 2025-05-20 13:27:52', 'visitor', 0, '2025-05-20 13:27:52', NULL, NULL, NULL, NULL),
(31, 1, '12', '450a6c5bead35a8c3648a923a33da5a5', 'Test message for widget: 450a6c5bead35a8c3648a923a33da5a5 - Time: 2025-05-20 13:27:55', 'visitor', 1, '2025-05-20 13:27:55', NULL, NULL, NULL, NULL),
(32, 2, '13', '1d12f103859a704a890683a311761a7e', 'Test message for widget: 1d12f103859a704a890683a311761a7e - Time: 2025-05-20 13:27:55', 'visitor', 0, '2025-05-20 13:27:55', NULL, NULL, NULL, NULL),
(33, 3, '14', '22fb66ed96e13f73235a851dc213acf7', 'Test message for widget: 22fb66ed96e13f73235a851dc213acf7 - Time: 2025-05-20 13:27:55', 'visitor', 0, '2025-05-20 13:27:55', NULL, NULL, NULL, NULL),
(34, 4, '15', 'e899bca97a62bad5a59141af89af96c6', 'Test message for widget: e899bca97a62bad5a59141af89af96c6 - Time: 2025-05-20 13:27:55', 'visitor', 0, '2025-05-20 13:27:55', NULL, NULL, NULL, NULL),
(35, 1, '12', '450a6c5bead35a8c3648a923a33da5a5', 'Test message for widget: 450a6c5bead35a8c3648a923a33da5a5 - Time: 2025-05-20 13:27:57', 'visitor', 1, '2025-05-20 13:27:58', NULL, NULL, NULL, NULL),
(36, 2, '13', '1d12f103859a704a890683a311761a7e', 'Test message for widget: 1d12f103859a704a890683a311761a7e - Time: 2025-05-20 13:27:58', 'visitor', 0, '2025-05-20 13:27:58', NULL, NULL, NULL, NULL),
(37, 3, '14', '22fb66ed96e13f73235a851dc213acf7', 'Test message for widget: 22fb66ed96e13f73235a851dc213acf7 - Time: 2025-05-20 13:27:58', 'visitor', 0, '2025-05-20 13:27:58', NULL, NULL, NULL, NULL),
(38, 4, '15', 'e899bca97a62bad5a59141af89af96c6', 'Test message for widget: e899bca97a62bad5a59141af89af96c6 - Time: 2025-05-20 13:27:58', 'visitor', 0, '2025-05-20 13:27:58', NULL, NULL, NULL, NULL),
(39, 1, '12', '450a6c5bead35a8c3648a923a33da5a5', 'Test message for widget: 450a6c5bead35a8c3648a923a33da5a5 - Time: 2025-05-20 13:28:00', 'visitor', 1, '2025-05-20 13:28:00', NULL, NULL, NULL, NULL),
(40, 2, '13', '1d12f103859a704a890683a311761a7e', 'Test message for widget: 1d12f103859a704a890683a311761a7e - Time: 2025-05-20 13:28:00', 'visitor', 0, '2025-05-20 13:28:00', NULL, NULL, NULL, NULL),
(41, 3, '14', '22fb66ed96e13f73235a851dc213acf7', 'Test message for widget: 22fb66ed96e13f73235a851dc213acf7 - Time: 2025-05-20 13:28:00', 'visitor', 0, '2025-05-20 13:28:00', NULL, NULL, NULL, NULL),
(42, 4, '15', 'e899bca97a62bad5a59141af89af96c6', 'Test message for widget: e899bca97a62bad5a59141af89af96c6 - Time: 2025-05-20 13:28:00', 'visitor', 0, '2025-05-20 13:28:00', NULL, NULL, NULL, NULL),
(43, 1, '12', '450a6c5bead35a8c3648a923a33da5a5', 'hi how are you doing', 'agent', 0, '2025-05-20 14:11:33', NULL, NULL, NULL, NULL),
(44, 1, '12', '450a6c5bead35a8c3648a923a33da5a5', 'hey dear', 'agent', 0, '2025-05-20 14:16:42', NULL, NULL, NULL, NULL),
(45, 1, '12', '450a6c5bead35a8c3648a923a33da5a5', 'how are you doing sir', 'agent', 0, '2025-05-20 14:18:22', NULL, NULL, NULL, NULL),
(46, 1, '12', '450a6c5bead35a8c3648a923a33da5a5', 'how can we help you today', 'agent', 0, '2025-05-20 14:18:28', NULL, NULL, NULL, NULL),
(47, 1, '12', '450a6c5bead35a8c3648a923a33da5a5', 'on your projects needs', 'agent', 0, '2025-05-20 14:18:33', NULL, NULL, NULL, NULL),
(48, 1, '12', '450a6c5bead35a8c3648a923a33da5a5', 'Hey dear', 'agent', 0, '2025-05-20 14:28:46', NULL, NULL, NULL, NULL),
(49, 1, '11', NULL, 'hi dear', 'agent', 0, '2025-05-20 14:54:50', NULL, NULL, NULL, NULL),
(50, 1, '392062780', '450a6c5bead35a8c3648a923a33da5a5', 'fhii', 'visitor', 1, '2025-05-21 11:43:13', NULL, NULL, NULL, NULL),
(51, 1, '392062780', '450a6c5bead35a8c3648a923a33da5a5', 'how are you doing', 'visitor', 1, '2025-05-21 11:48:03', NULL, NULL, NULL, NULL),
(52, 1, '392062780', '450a6c5bead35a8c3648a923a33da5a5', 'hoowowowowows', 'visitor', 1, '2025-05-21 11:48:29', NULL, NULL, NULL, NULL),
(53, 1, '561901154', '450a6c5bead35a8c3648a923a33da5a5', 'mr man', 'visitor', 1, '2025-05-21 13:48:50', NULL, NULL, NULL, NULL),
(54, 1, '561901154', '450a6c5bead35a8c3648a923a33da5a5', 'how are you', 'agent', 0, '2025-05-21 13:49:07', NULL, NULL, NULL, NULL),
(55, 1, '561901154', '450a6c5bead35a8c3648a923a33da5a5', 'mr woman', 'visitor', 1, '2025-05-21 13:49:36', NULL, NULL, NULL, NULL),
(56, 1, '561901154', '450a6c5bead35a8c3648a923a33da5a5', 'nice one man good job', 'agent', 0, '2025-05-21 13:49:56', NULL, NULL, NULL, NULL),
(57, 1, '561901154', '450a6c5bead35a8c3648a923a33da5a5', 'how are you doing', 'visitor', 1, '2025-05-21 14:10:07', NULL, NULL, NULL, NULL),
(58, 1, '561901154', '450a6c5bead35a8c3648a923a33da5a5', 'mr mr mrm', 'visitor', 1, '2025-05-21 14:10:16', NULL, NULL, NULL, NULL),
(59, 1, '561901154', '450a6c5bead35a8c3648a923a33da5a5', 'that snice', 'agent', 0, '2025-05-21 14:10:21', NULL, NULL, NULL, NULL),
(60, 1, '561901154', '450a6c5bead35a8c3648a923a33da5a5', 'faith hey', 'visitor', 1, '2025-05-21 14:12:16', NULL, NULL, NULL, NULL),
(61, 1, '561901154', '450a6c5bead35a8c3648a923a33da5a5', 'how are you', 'agent', 0, '2025-05-21 14:12:23', NULL, NULL, NULL, NULL),
(62, 7, '71605010', '0bf351b30ef39ce5e5ade1b92ccce937', 'hi', 'visitor', 1, '2025-05-21 20:20:47', NULL, NULL, NULL, NULL),
(63, 1, '914806592', '450a6c5bead35a8c3648a923a33da5a5', 'Hi how do I withdraw', 'visitor', 1, '2025-05-21 21:09:15', NULL, NULL, NULL, NULL),
(64, 1, '914806592', '450a6c5bead35a8c3648a923a33da5a5', 'Hey', 'visitor', 1, '2025-05-21 21:09:25', NULL, NULL, NULL, NULL),
(65, 1, '914806592', '450a6c5bead35a8c3648a923a33da5a5', 'It’s simple click on the link okay this one below 👇🏻', 'agent', 0, '2025-05-21 21:12:04', NULL, NULL, NULL, NULL),
(66, 1, '276859223', '450a6c5bead35a8c3648a923a33da5a5', 'Pastor how can I join this platform', 'visitor', 1, '2025-05-22 05:11:13', NULL, NULL, NULL, NULL),
(67, 1, '276859223', '450a6c5bead35a8c3648a923a33da5a5', 'It’s simple ooo just click on the link and acesss jt', 'agent', 0, '2025-05-22 05:13:15', NULL, NULL, NULL, NULL),
(68, 1, '276859223', '450a6c5bead35a8c3648a923a33da5a5', 'It’s simple click the link', 'agent', 0, '2025-05-22 07:19:16', NULL, NULL, NULL, NULL),
(69, 7, '209458135', '0bf351b30ef39ce5e5ade1b92ccce937', 'Oi', 'visitor', 1, '2025-05-22 12:23:22', NULL, NULL, NULL, NULL),
(70, 7, '209458135', '0bf351b30ef39ce5e5ade1b92ccce937', 'Preciso do código de verificação', 'visitor', 1, '2025-05-22 12:23:31', NULL, NULL, NULL, NULL),
(71, 7, '209458135', '0bf351b30ef39ce5e5ade1b92ccce937', '?', 'visitor', 1, '2025-05-22 13:00:42', NULL, NULL, NULL, NULL),
(72, 7, '9894110', '0bf351b30ef39ce5e5ade1b92ccce937', 'Olá', 'visitor', 1, '2025-05-22 13:44:36', NULL, NULL, NULL, NULL),
(73, 7, '9894110', '0bf351b30ef39ce5e5ade1b92ccce937', 'Gostaria de fazer uma transferência para uma conta no Brasil', 'visitor', 1, '2025-05-22 13:45:13', NULL, NULL, NULL, NULL),
(74, 1, '276859223', '450a6c5bead35a8c3648a923a33da5a5', 'Shksjss ns', 'agent', 0, '2025-05-22 13:47:04', NULL, NULL, NULL, NULL),
(75, 7, '9894110', '0bf351b30ef39ce5e5ade1b92ccce937', 'Hello 👋', 'agent', 0, '2025-05-22 13:47:25', NULL, NULL, NULL, NULL),
(76, 1, '276859223', '450a6c5bead35a8c3648a923a33da5a5', 'Hejehjeene', 'agent', 0, '2025-05-22 13:47:31', NULL, NULL, NULL, NULL),
(77, 7, '9894110', '0bf351b30ef39ce5e5ade1b92ccce937', 'Please provide a screenshot of your account dashboard', 'agent', 0, '2025-05-22 13:48:16', NULL, NULL, NULL, NULL),
(78, 7, '9894110', '0bf351b30ef39ce5e5ade1b92ccce937', 'Não consigo anexar a captura de tela', 'visitor', 1, '2025-05-22 13:49:07', NULL, NULL, NULL, NULL),
(79, 7, '9894110', '0bf351b30ef39ce5e5ade1b92ccce937', 'Anexar', 'visitor', 1, '2025-05-22 13:49:15', NULL, NULL, NULL, NULL),
(80, 7, '6685565', '0bf351b30ef39ce5e5ade1b92ccce937', 'Hello 👋', 'visitor', 1, '2025-05-22 13:50:56', NULL, NULL, NULL, NULL),
(81, 7, '9894110', '0bf351b30ef39ce5e5ade1b92ccce937', 'Oi', 'visitor', 1, '2025-05-22 13:51:50', NULL, NULL, NULL, NULL),
(82, 7, '9894110', '0bf351b30ef39ce5e5ade1b92ccce937', 'Eu não estou conseguindo anexar a captura de tela', 'visitor', 1, '2025-05-22 13:52:07', NULL, NULL, NULL, NULL),
(83, 7, '9894110', '0bf351b30ef39ce5e5ade1b92ccce937', 'Oi', 'visitor', 1, '2025-05-22 13:53:26', NULL, NULL, NULL, NULL),
(84, 7, '9894110', '0bf351b30ef39ce5e5ade1b92ccce937', 'Olá', 'visitor', 1, '2025-05-22 14:12:02', NULL, NULL, NULL, NULL),
(85, 7, '9894110', '0bf351b30ef39ce5e5ade1b92ccce937', 'Estou tentando fazer uma transferência e não sei qual o código de verificação solicitado', 'visitor', 1, '2025-05-22 14:12:34', NULL, NULL, NULL, NULL),
(86, 7, '9894110', '0bf351b30ef39ce5e5ade1b92ccce937', 'Pode me ajudar', 'visitor', 1, '2025-05-22 14:12:40', NULL, NULL, NULL, NULL),
(87, 7, '9894110', '0bf351b30ef39ce5e5ade1b92ccce937', 'A transferência é via paypal', 'visitor', 1, '2025-05-22 14:12:57', NULL, NULL, NULL, NULL),
(88, 7, '9894110', '0bf351b30ef39ce5e5ade1b92ccce937', 'Oi', 'visitor', 1, '2025-05-22 14:31:54', NULL, NULL, NULL, NULL),
(89, 7, '9894110', '0bf351b30ef39ce5e5ade1b92ccce937', 'Oi', 'visitor', 1, '2025-05-22 14:31:58', NULL, NULL, NULL, NULL),
(90, 7, '9894110', '0bf351b30ef39ce5e5ade1b92ccce937', 'Eu preciso do primeiro código de verificação', 'visitor', 1, '2025-05-22 17:25:53', NULL, NULL, NULL, NULL),
(91, 7, '9894110', '0bf351b30ef39ce5e5ade1b92ccce937', 'Olá', 'visitor', 1, '2025-05-22 17:26:27', NULL, NULL, NULL, NULL),
(92, 7, '9894110', '0bf351b30ef39ce5e5ade1b92ccce937', 'Olá', 'visitor', 1, '2025-05-22 17:26:33', NULL, NULL, NULL, NULL),
(93, 7, '9894110', '0bf351b30ef39ce5e5ade1b92ccce937', 'Olá', 'visitor', 1, '2025-05-22 17:28:25', NULL, NULL, NULL, NULL),
(94, 7, '9894110', '0bf351b30ef39ce5e5ade1b92ccce937', 'Olá', 'visitor', 1, '2025-05-22 17:31:15', NULL, NULL, NULL, NULL),
(95, 7, '9894110', '0bf351b30ef39ce5e5ade1b92ccce937', 'Hi', 'visitor', 1, '2025-05-22 17:31:21', NULL, NULL, NULL, NULL),
(96, 7, '9894110', '0bf351b30ef39ce5e5ade1b92ccce937', 'Hi', 'visitor', 1, '2025-05-22 17:31:27', NULL, NULL, NULL, NULL),
(97, 7, '9894110', '0bf351b30ef39ce5e5ade1b92ccce937', 'Oi', 'visitor', 1, '2025-05-22 17:31:53', NULL, NULL, NULL, NULL),
(98, 1, '392062780', '450a6c5bead35a8c3648a923a33da5a5', 'niga', 'visitor', 1, '2025-05-22 17:31:59', NULL, NULL, NULL, NULL),
(99, 7, '9894110', '0bf351b30ef39ce5e5ade1b92ccce937', 'Hello', 'agent', 0, '2025-05-22 17:36:00', NULL, NULL, NULL, NULL),
(100, 7, '9894110', '0bf351b30ef39ce5e5ade1b92ccce937', 'Please provide a screenshot of your account dashboard', 'agent', 0, '2025-05-22 17:36:14', NULL, NULL, NULL, NULL),
(101, 1, '276859223', '450a6c5bead35a8c3648a923a33da5a5', 'hi how are you doing dear', 'agent', 0, '2025-05-22 17:46:25', NULL, NULL, NULL, NULL),
(102, 1, '276859223', '450a6c5bead35a8c3648a923a33da5a5', '❤️❤️😍😍👍😍😍❤️😮😮', 'agent', 0, '2025-05-22 17:46:40', NULL, NULL, NULL, NULL),
(103, 7, '9894110', '0bf351b30ef39ce5e5ade1b92ccce937', 'Olá', 'visitor', 1, '2025-05-22 18:02:44', NULL, NULL, NULL, NULL),
(104, 7, '9894110', '0bf351b30ef39ce5e5ade1b92ccce937', 'Preciso do primeiro código de verificação', 'visitor', 1, '2025-05-22 18:03:04', NULL, NULL, NULL, NULL),
(105, 7, '209458135', '0bf351b30ef39ce5e5ade1b92ccce937', '?', 'visitor', 1, '2025-05-22 18:08:09', NULL, NULL, NULL, NULL),
(106, 7, '9894110', '0bf351b30ef39ce5e5ade1b92ccce937', 'Olá', 'visitor', 1, '2025-05-22 18:13:58', NULL, NULL, NULL, NULL),
(107, 7, '9894110', '0bf351b30ef39ce5e5ade1b92ccce937', 'USD 2000,00 Saque bancário Saque de Bitcoin Saque via Paypal Saque Skrill Saldo atual USD 2000,00 Saldo do Razão USD 0,00 Saldo disponível USD 2000,00 Saldo Reembolsável USD 0,00 Registros de transações', 'visitor', 1, '2025-05-22 18:14:39', NULL, NULL, NULL, NULL),
(108, 7, '9894110', '0bf351b30ef39ce5e5ade1b92ccce937', 'Rapariga', 'visitor', 1, '2025-05-22 18:18:42', NULL, NULL, NULL, NULL),
(109, 1, '606813160', NULL, 'hey dear', 'agent', 0, '2025-05-22 18:20:30', NULL, NULL, NULL, NULL),
(110, 1, '606813160', NULL, 'hkdsahfkdasfd', 'agent', 0, '2025-05-22 18:36:09', NULL, NULL, NULL, NULL),
(111, 7, '9894110', '0bf351b30ef39ce5e5ade1b92ccce937', 'Hello please provide a screenshot of your account dashboard', 'agent', 0, '2025-05-22 20:55:59', NULL, NULL, NULL, NULL),
(112, 7, '209458135', '0bf351b30ef39ce5e5ade1b92ccce937', 'Hello please provide a screenshot of your account dashboard', 'agent', 0, '2025-05-22 20:56:44', NULL, NULL, NULL, NULL),
(113, 7, '728917863', '0bf351b30ef39ce5e5ade1b92ccce937', 'Necesito el código de verificación donde puedo encontrarlo', 'visitor', 1, '2025-05-22 21:52:21', NULL, NULL, NULL, NULL),
(114, 7, '728917863', '0bf351b30ef39ce5e5ade1b92ccce937', 'Localizarlo *', 'visitor', 1, '2025-05-22 21:52:31', NULL, NULL, NULL, NULL),
(115, 7, '728917863', '0bf351b30ef39ce5e5ade1b92ccce937', 'Hello', 'agent', 0, '2025-05-22 22:21:36', NULL, NULL, NULL, NULL),
(116, 7, '728917863', '0bf351b30ef39ce5e5ade1b92ccce937', 'Hola', 'visitor', 0, '2025-05-22 22:37:22', NULL, NULL, NULL, NULL),
(117, 7, '728917863', '0bf351b30ef39ce5e5ade1b92ccce937', 'Hola?', 'visitor', 0, '2025-05-22 22:40:11', NULL, NULL, NULL, NULL),
(118, 7, '728917863', '0bf351b30ef39ce5e5ade1b92ccce937', 'Me dirías donde encontrar el código de verificación por favor?', 'visitor', 0, '2025-05-22 22:45:28', NULL, NULL, NULL, NULL),
(119, 7, '728917863', '0bf351b30ef39ce5e5ade1b92ccce937', 'Quería sacar un dinero que tenia pero no estoy pudiendo', 'visitor', 0, '2025-05-22 22:45:39', NULL, NULL, NULL, NULL),
(120, 7, '728917863', '0bf351b30ef39ce5e5ade1b92ccce937', 'Le llegan mis mensajes? Se me borran a mi', 'visitor', 0, '2025-05-22 22:46:06', NULL, NULL, NULL, NULL),
(121, 7, '728917863', '0bf351b30ef39ce5e5ade1b92ccce937', 'Necesitaría el código de verificación por favor', 'visitor', 0, '2025-05-22 22:46:19', NULL, NULL, NULL, NULL),
(122, 7, '728917863', '0bf351b30ef39ce5e5ade1b92ccce937', 'Me mandaría a wsp?', 'visitor', 0, '2025-05-22 22:47:31', NULL, NULL, NULL, NULL),
(123, 7, '728917863', '0bf351b30ef39ce5e5ade1b92ccce937', '3435070221', 'visitor', 0, '2025-05-22 22:47:35', NULL, NULL, NULL, NULL),
(124, 7, '44826975', '0bf351b30ef39ce5e5ade1b92ccce937', 'Md. Aminul Islam <amin.raj26465@gmail.com>9:52 PM (2 minutes ago) to UNIFIEDSAVEBank Dear Sir, I,m Md Aminul Islam from Bangladesh. You informed me through mail that $2000 has been deposited to my account via shyreginsfinancial. I,m new and don,t have any knowledge of how to operate your banking system to withdraw money, and also don\'t know  how much money should be kept as balance and how much I can withdraw. When I tried to withdraw money I did not receive any verification code through my email or any other means. Tell me the details  at your earliest convenience. Best Regards MdWe are glad to inform you that your Account has been credited with Balance: $2000We wish you successful trading!  Kind regards, UNIFIEDSAVEBank On Thu, May 22, 2025 at 7:15 PM UNIFIEDSAVEBank <support@unifiedsavebank.com> wrote:  MdWe are glad to inform you that your Account has been credited with Balance: $2000We wish you successful trading!  Kind regards, UNIFIEDSAVEBank On Thu, May 22, 2025 at 8:56 AM skyreignsfinancial <support@skyreignsfinancial.com> wrote: Show quoted text   On Thu, May 22, 2025 at 8:56 AM skyreignsfinancial <support@skyreignsfinancial.com> wrote: Show quoted text I need your kind assistance and support please sir.', 'visitor', 0, '2025-05-23 01:59:01', NULL, NULL, NULL, NULL),
(125, 7, '44826975', '0bf351b30ef39ce5e5ade1b92ccce937', 'Md. Aminul Islam <amin.raj26465@gmail.com>9:52 PM (2 minutes ago) to UNIFIEDSAVEBank Dear Sir, I,m Md Aminul Islam from Bangladesh. You informed me through mail that $2000 has been deposited to my account via shyreginsfinancial. I,m new and don,t have any knowledge of how to operate your banking system to withdraw money, and also don\'t know  how much money should be kept as balance and how much I can withdraw. When I tried to withdraw money I did not receive any verification code through my email or any other means. Tell me the details  at your earliest convenience. Best Regards MdWe are glad to inform you that your Account has been credited with Balance: $2000We wish you successful trading!  Kind regards, UNIFIEDSAVEBank On Thu, May 22, 2025 at 7:15 PM UNIFIEDSAVEBank <support@unifiedsavebank.com> wrote:  MdWe are glad to inform you that your Account has been credited with Balance: $2000We wish you successful trading!  Kind regards, UNIFIEDSAVEBank On Thu, May 22, 2025 at 8:56 AM skyreignsfinancial <support@skyreignsfinancial.com> wrote: Show quoted text   On Thu, May 22, 2025 at 8:56 AM skyreignsfinancial <support@skyreignsfinancial.com> wrote: Show quoted text I need your kind assistance and support please sir.', 'visitor', 0, '2025-05-23 02:03:12', NULL, NULL, NULL, NULL),
(126, 7, '44826975', '0bf351b30ef39ce5e5ade1b92ccce937', 'Hello Ma\'am,  Hope this note will find you in good health and spirit. I am attaching the screen shot of my new account as you instructed/advice earlier. I think it will fulfil your requirement. Thanking you, your faithfully, Md Aminul Islam.', 'visitor', 0, '2025-05-23 02:05:37', NULL, NULL, NULL, NULL),
(127, 7, '71605010', '0bf351b30ef39ce5e5ade1b92ccce937', 'hi sir', 'visitor', 1, '2025-05-23 03:49:37', NULL, NULL, NULL, NULL),
(128, 1, '392062780', '450a6c5bead35a8c3648a923a33da5a5', 'rweqrewq', 'visitor', 1, '2025-05-23 06:32:49', NULL, NULL, NULL, NULL),
(129, 7, '71605010', '0bf351b30ef39ce5e5ade1b92ccce937', 'fdafsd', 'visitor', 1, '2025-05-23 06:33:11', NULL, NULL, NULL, NULL),
(130, 7, '510469212', '0bf351b30ef39ce5e5ade1b92ccce937', 'Dear SIr,', 'visitor', 1, '2025-05-23 14:33:59', NULL, NULL, NULL, NULL),
(131, 7, '510469212', '0bf351b30ef39ce5e5ade1b92ccce937', 'Hello', 'visitor', 1, '2025-05-23 14:34:35', NULL, NULL, NULL, NULL),
(132, 7, '510469212', '0bf351b30ef39ce5e5ade1b92ccce937', 'I need a little help', 'visitor', 1, '2025-05-23 14:35:18', NULL, NULL, NULL, NULL),
(133, 7, '510469212', '0bf351b30ef39ce5e5ade1b92ccce937', 'Dear SIr,  Please be informed that I am a new account holder of your bank. I have a account in skyreignsfinancial and have some money. Now, I want to withdraw some money but a Verification code is needed. This verification code is not received in my mail.  Account Details is Given Below:  Account Name: Md Aminul Islam Email ID: amin.raj26465@gmail.com', 'visitor', 1, '2025-05-23 14:45:40', NULL, NULL, NULL, NULL),
(134, 1, '392062780', '450a6c5bead35a8c3648a923a33da5a5', 'lego 2', 'visitor', 1, '2025-05-23 16:01:21', NULL, NULL, NULL, NULL),
(135, 1, '392062780', '450a6c5bead35a8c3648a923a33da5a5', 'lego 3', 'visitor', 1, '2025-05-23 16:59:47', NULL, NULL, NULL, NULL),
(136, 1, '392062780', '450a6c5bead35a8c3648a923a33da5a5', 'lego 6', 'visitor', 1, '2025-05-23 17:12:38', NULL, NULL, NULL, NULL),
(137, 7, '691268193', '0bf351b30ef39ce5e5ade1b92ccce937', 'Hello, I am looking assistance in how I am able to withdrawn my funds off my account', 'visitor', 1, '2025-05-23 17:13:43', NULL, NULL, NULL, NULL),
(138, 1, '392062780', '450a6c5bead35a8c3648a923a33da5a5', 'lego 8', 'visitor', 1, '2025-05-23 17:52:26', NULL, NULL, NULL, NULL),
(139, 7, '313479238', '0bf351b30ef39ce5e5ade1b92ccce937', 'Do i pay to make transaction?', 'visitor', 1, '2025-05-24 02:29:26', NULL, NULL, NULL, NULL),
(140, 1, '768284356', NULL, 'hi zi', 'agent', 0, '2025-05-24 06:06:59', NULL, NULL, NULL, NULL),
(141, 1, '392062780', '450a6c5bead35a8c3648a923a33da5a5', 'will', 'visitor', 1, '2025-05-24 06:08:16', NULL, NULL, NULL, NULL),
(142, 7, '669161987', '0bf351b30ef39ce5e5ade1b92ccce937', 'Guide me how to transfer Money to Indian bank', 'visitor', 1, '2025-05-24 06:14:22', NULL, NULL, NULL, NULL),
(143, 7, '71605010', '0bf351b30ef39ce5e5ade1b92ccce937', 'hi', 'visitor', 1, '2025-05-24 08:36:50', NULL, NULL, NULL, NULL),
(144, 1, '392062780', '450a6c5bead35a8c3648a923a33da5a5', 'dsa', 'visitor', 1, '2025-05-24 09:16:44', NULL, NULL, NULL, NULL),
(145, 1, '392062780', '450a6c5bead35a8c3648a923a33da5a5', 'hi', 'visitor', 1, '2025-05-24 09:39:31', NULL, NULL, NULL, NULL),
(146, 7, '71605010', '0bf351b30ef39ce5e5ade1b92ccce937', 'hi', 'visitor', 1, '2025-05-24 09:41:32', NULL, NULL, NULL, NULL),
(147, 1, '392062780', '450a6c5bead35a8c3648a923a33da5a5', 'fdafdas', 'visitor', 1, '2025-05-24 09:54:57', NULL, NULL, NULL, NULL),
(148, 1, '392062780', '450a6c5bead35a8c3648a923a33da5a5', 'fdaf', 'visitor', 1, '2025-05-24 10:04:56', NULL, NULL, NULL, NULL),
(149, 1, '392062780', '450a6c5bead35a8c3648a923a33da5a5', 'Sorry, we\'re currently offline. Please leave a message and we\'ll get back to you soon.', 'agent', 0, '2025-05-24 10:04:56', NULL, NULL, NULL, NULL),
(150, 1, '392062780', '450a6c5bead35a8c3648a923a33da5a5', 'fasdfdas', 'visitor', 1, '2025-05-24 10:05:05', NULL, NULL, NULL, NULL),
(151, 1, '392062780', '450a6c5bead35a8c3648a923a33da5a5', 'Sorry, we\'re currently offline. Please leave a message and we\'ll get back to you soon.', 'agent', 0, '2025-05-24 10:05:05', NULL, NULL, NULL, NULL),
(152, 1, '392062780', '450a6c5bead35a8c3648a923a33da5a5', 'paipai', 'visitor', 1, '2025-05-24 10:10:29', NULL, NULL, NULL, NULL),
(153, 1, '392062780', '450a6c5bead35a8c3648a923a33da5a5', 'Sorry, we\'re currently offline. Please leave a message and we\'ll get back to you soon.', 'agent', 0, '2025-05-24 10:10:29', NULL, NULL, NULL, NULL),
(154, 1, '392062780', '450a6c5bead35a8c3648a923a33da5a5', 'how are you doing ?', 'agent', 0, '2025-05-24 10:10:48', NULL, NULL, NULL, NULL),
(155, 1, '392062780', '450a6c5bead35a8c3648a923a33da5a5', 'hkh', 'visitor', 1, '2025-05-24 10:19:22', NULL, NULL, NULL, NULL),
(156, 1, '392062780', '450a6c5bead35a8c3648a923a33da5a5', 'Sorry, we\'re currently offline. Please leave a message and we\'ll get back to you soon.', 'agent', 0, '2025-05-24 10:19:22', NULL, NULL, NULL, NULL),
(157, 1, '392062780', '450a6c5bead35a8c3648a923a33da5a5', 'niggga', 'agent', 0, '2025-05-24 10:19:40', NULL, NULL, NULL, NULL),
(158, 10, '915602673', '42c78363c73d9247f7e4599d3e0d81f0', 'gi', 'visitor', 0, '2025-05-24 15:18:51', NULL, NULL, NULL, NULL),
(159, 10, '915602673', '42c78363c73d9247f7e4599d3e0d81f0', 'Thanks for your message! We\'re currently offline, but we\'ll get back to you as soon as possible.', 'agent', 0, '2025-05-24 15:18:51', NULL, NULL, NULL, NULL),
(160, 7, '669161987', '0bf351b30ef39ce5e5ade1b92ccce937', 'Hello', 'agent', 0, '2025-05-24 22:38:09', NULL, NULL, NULL, NULL),
(161, 7, '669161987', '0bf351b30ef39ce5e5ade1b92ccce937', 'How to transfer to my Indian bank account?', 'visitor', 1, '2025-05-25 00:15:42', NULL, NULL, NULL, NULL),
(162, 7, '669161987', '0bf351b30ef39ce5e5ade1b92ccce937', 'Thanks for your message! We\'re currently offline, but we\'ll get back to you as soon as possible.', 'agent', 0, '2025-05-25 00:15:42', NULL, NULL, NULL, NULL),
(163, 7, '669161987', '0bf351b30ef39ce5e5ade1b92ccce937', 'Ok..', 'visitor', 1, '2025-05-25 00:18:17', NULL, NULL, NULL, NULL),
(164, 7, '669161987', '0bf351b30ef39ce5e5ade1b92ccce937', 'Thanks for your message! We\'re currently offline, but we\'ll get back to you as soon as possible.', 'agent', 0, '2025-05-25 00:18:17', NULL, NULL, NULL, NULL),
(165, 7, '669161987', '0bf351b30ef39ce5e5ade1b92ccce937', 'What is first verification code?', 'visitor', 1, '2025-05-25 00:20:26', NULL, NULL, NULL, NULL),
(166, 7, '669161987', '0bf351b30ef39ce5e5ade1b92ccce937', 'Thanks for your message! We\'re currently offline, but we\'ll get back to you as soon as possible.', 'agent', 0, '2025-05-25 00:20:26', NULL, NULL, NULL, NULL),
(167, 7, '915602678', '0bf351b30ef39ce5e5ade1b92ccce937', 'Mi código de confirmación', 'visitor', 0, '2025-05-25 10:18:01', NULL, NULL, NULL, NULL),
(168, 7, '915602678', '0bf351b30ef39ce5e5ade1b92ccce937', 'Thanks for your message! We\'re currently offline, but we\'ll get back to you as soon as possible.', 'agent', 0, '2025-05-25 10:18:01', NULL, NULL, NULL, NULL),
(169, 7, '915602682', '0bf351b30ef39ce5e5ade1b92ccce937', 'Здравейте', 'visitor', 0, '2025-05-25 16:39:08', NULL, NULL, NULL, NULL),
(170, 7, '915602682', '0bf351b30ef39ce5e5ade1b92ccce937', 'Thanks for your message! We\'re currently offline, but we\'ll get back to you as soon as possible.', 'agent', 0, '2025-05-25 16:39:08', NULL, NULL, NULL, NULL),
(171, 7, '915602682', '0bf351b30ef39ce5e5ade1b92ccce937', 'Искам код за верификация за да мога да си прехвърля парите ,моля', 'visitor', 0, '2025-05-25 16:39:30', NULL, NULL, NULL, NULL),
(172, 7, '915602682', '0bf351b30ef39ce5e5ade1b92ccce937', 'Thanks for your message! We\'re currently offline, but we\'ll get back to you as soon as possible.', 'agent', 0, '2025-05-25 16:39:30', NULL, NULL, NULL, NULL),
(173, 10, '915602683', '42c78363c73d9247f7e4599d3e0d81f0', 'hi', 'visitor', 0, '2025-05-25 17:17:12', NULL, NULL, NULL, NULL),
(174, 10, '915602683', '42c78363c73d9247f7e4599d3e0d81f0', 'Thanks for your message! We\'re currently offline, but we\'ll get back to you as soon as possible.', 'agent', 0, '2025-05-25 17:17:12', NULL, NULL, NULL, NULL),
(175, 10, '915602683', '42c78363c73d9247f7e4599d3e0d81f0', 'jljlk', 'visitor', 0, '2025-05-25 17:17:34', NULL, NULL, NULL, NULL),
(176, 10, '915602683', '42c78363c73d9247f7e4599d3e0d81f0', 'Thanks for your message! We\'re currently offline, but we\'ll get back to you as soon as possible.', 'agent', 0, '2025-05-25 17:17:34', NULL, NULL, NULL, NULL),
(177, 10, '915602683', '42c78363c73d9247f7e4599d3e0d81f0', 'popleee', 'visitor', 0, '2025-05-25 17:18:02', NULL, NULL, NULL, NULL),
(178, 10, '915602683', '42c78363c73d9247f7e4599d3e0d81f0', 'Thanks for your message! We\'re currently offline, but we\'ll get back to you as soon as possible.', 'agent', 0, '2025-05-25 17:18:02', NULL, NULL, NULL, NULL),
(179, 7, '71605010', '0bf351b30ef39ce5e5ade1b92ccce937', 'hi', 'visitor', 0, '2025-05-25 17:18:52', NULL, NULL, NULL, NULL),
(180, 7, '71605010', '0bf351b30ef39ce5e5ade1b92ccce937', 'Thanks for your message! We\'re currently offline, but we\'ll get back to you as soon as possible.', 'agent', 0, '2025-05-25 17:18:52', NULL, NULL, NULL, NULL),
(181, 10, '915602683', '42c78363c73d9247f7e4599d3e0d81f0', 'hi', 'visitor', 0, '2025-05-25 17:57:20', NULL, NULL, NULL, NULL),
(182, 10, '915602683', '42c78363c73d9247f7e4599d3e0d81f0', 'Thanks for your message! We\'re currently offline, but we\'ll get back to you as soon as possible.', 'agent', 0, '2025-05-25 17:57:20', NULL, NULL, NULL, NULL),
(183, 10, '915602683', '42c78363c73d9247f7e4599d3e0d81f0', 'hi', 'visitor', 0, '2025-05-25 17:57:26', NULL, NULL, NULL, NULL),
(184, 10, '915602683', '42c78363c73d9247f7e4599d3e0d81f0', 'Thanks for your message! We\'re currently offline, but we\'ll get back to you as soon as possible.', 'agent', 0, '2025-05-25 17:57:26', NULL, NULL, NULL, NULL),
(185, 10, '915602683', '42c78363c73d9247f7e4599d3e0d81f0', 'hjk', 'visitor', 0, '2025-05-25 17:57:28', NULL, NULL, NULL, NULL),
(186, 10, '915602683', '42c78363c73d9247f7e4599d3e0d81f0', 'Thanks for your message! We\'re currently offline, but we\'ll get back to you as soon as possible.', 'agent', 0, '2025-05-25 17:57:28', NULL, NULL, NULL, NULL),
(187, 7, '915602684', '0bf351b30ef39ce5e5ade1b92ccce937', '?', 'visitor', 1, '2025-05-25 18:16:40', NULL, NULL, NULL, NULL),
(188, 7, '915602684', '0bf351b30ef39ce5e5ade1b92ccce937', 'Thanks for your message! We\'re currently offline, but we\'ll get back to you as soon as possible.', 'agent', 0, '2025-05-25 18:16:40', NULL, NULL, NULL, NULL),
(189, 7, '915602684', '0bf351b30ef39ce5e5ade1b92ccce937', 'Hello, could you please help me go feceive the vetift code for withdrawing my money to my local banck account from here? Thanks', 'visitor', 1, '2025-05-25 18:18:48', NULL, NULL, NULL, NULL),
(190, 7, '915602684', '0bf351b30ef39ce5e5ade1b92ccce937', 'Thanks for your message! We\'re currently offline, but we\'ll get back to you as soon as possible.', 'agent', 0, '2025-05-25 18:18:48', NULL, NULL, NULL, NULL),
(191, 7, '915602684', '0bf351b30ef39ce5e5ade1b92ccce937', 'Hello, could you please help me go receive the verification code for withdrawing my money to my local banck account from here? Thanks', 'visitor', 1, '2025-05-25 18:20:08', NULL, NULL, NULL, NULL),
(192, 7, '915602684', '0bf351b30ef39ce5e5ade1b92ccce937', 'Thanks for your message! We\'re currently offline, but we\'ll get back to you as soon as possible.', 'agent', 0, '2025-05-25 18:20:08', NULL, NULL, NULL, NULL),
(193, 1, '768284356', '450a6c5bead35a8c3648a923a33da5a5', 'hih', 'visitor', 1, '2025-05-25 18:20:12', NULL, NULL, NULL, NULL),
(194, 1, '768284356', '450a6c5bead35a8c3648a923a33da5a5', 'Sorry, we\'re currently offline. Please leave a message and we\'ll get back to you soon.', 'agent', 0, '2025-05-25 18:20:12', NULL, NULL, NULL, NULL),
(195, 1, '768284356', '450a6c5bead35a8c3648a923a33da5a5', 'nkjkj', 'visitor', 1, '2025-05-25 18:20:15', NULL, NULL, NULL, NULL),
(196, 1, '768284356', '450a6c5bead35a8c3648a923a33da5a5', 'Sorry, we\'re currently offline. Please leave a message and we\'ll get back to you soon.', 'agent', 0, '2025-05-25 18:20:15', NULL, NULL, NULL, NULL),
(197, 10, '915602683', '42c78363c73d9247f7e4599d3e0d81f0', 'dasfdsa', 'visitor', 0, '2025-05-25 18:20:46', NULL, NULL, NULL, NULL),
(198, 10, '915602683', '42c78363c73d9247f7e4599d3e0d81f0', 'Thanks for your message! We\'re currently offline, but we\'ll get back to you as soon as possible.', 'agent', 0, '2025-05-25 18:20:46', NULL, NULL, NULL, NULL),
(199, 1, '768284356', '450a6c5bead35a8c3648a923a33da5a5', 'kh', 'visitor', 1, '2025-05-25 18:50:05', NULL, NULL, NULL, NULL),
(200, 1, '768284356', '450a6c5bead35a8c3648a923a33da5a5', 'Sorry, we\'re currently offline. Please leave a message and we\'ll get back to you soon.', 'agent', 0, '2025-05-25 18:50:05', NULL, NULL, NULL, NULL),
(201, 10, '915602685', '42c78363c73d9247f7e4599d3e0d81f0', 'fdhkfdjkfjdskajfdfsdadfd', 'visitor', 0, '2025-05-25 19:00:20', NULL, NULL, NULL, NULL),
(202, 10, '915602685', '42c78363c73d9247f7e4599d3e0d81f0', 'Thanks for your message! We\'re currently offline, but we\'ll get back to you as soon as possible.', 'agent', 0, '2025-05-25 19:00:20', NULL, NULL, NULL, NULL),
(203, 10, '915602685', '42c78363c73d9247f7e4599d3e0d81f0', 'hey', 'visitor', 0, '2025-05-25 19:06:25', NULL, NULL, NULL, NULL),
(204, 10, '915602685', '42c78363c73d9247f7e4599d3e0d81f0', 'Thanks for your message! We\'re currently offline, but we\'ll get back to you as soon as possible.', 'agent', 0, '2025-05-25 19:06:25', NULL, NULL, NULL, NULL),
(205, 1, '915602686', '450a6c5bead35a8c3648a923a33da5a5', 'his sir', 'visitor', 1, '2025-05-25 19:09:17', NULL, NULL, NULL, NULL),
(206, 1, '915602686', '450a6c5bead35a8c3648a923a33da5a5', 'Sorry, we\'re currently offline. Please leave a message and we\'ll get back to you soon.', 'agent', 0, '2025-05-25 19:09:17', NULL, NULL, NULL, NULL),
(207, 1, '915602686', '450a6c5bead35a8c3648a923a33da5a5', 'how are you doing', 'agent', 0, '2025-05-25 19:09:40', NULL, NULL, NULL, NULL),
(208, 7, '915602688', '0bf351b30ef39ce5e5ade1b92ccce937', '???', 'visitor', 1, '2025-05-25 20:46:34', NULL, NULL, NULL, NULL),
(209, 7, '915602688', '0bf351b30ef39ce5e5ade1b92ccce937', 'Thanks for your message! We\'re currently offline, but we\'ll get back to you as soon as possible.', 'agent', 0, '2025-05-25 20:46:34', NULL, NULL, NULL, NULL),
(210, 7, '915602684', '0bf351b30ef39ce5e5ade1b92ccce937', 'Hello', 'agent', 0, '2025-05-25 21:26:53', NULL, NULL, NULL, NULL),
(211, 7, '915602684', '0bf351b30ef39ce5e5ade1b92ccce937', 'How can we be of help to you?', 'agent', 0, '2025-05-25 21:27:09', NULL, NULL, NULL, NULL),
(212, 7, '915602689', '0bf351b30ef39ce5e5ade1b92ccce937', 'Hola', 'visitor', 0, '2025-05-26 05:40:03', NULL, NULL, NULL, NULL),
(213, 7, '915602689', '0bf351b30ef39ce5e5ade1b92ccce937', 'Thanks for your message! We\'re currently offline, but we\'ll get back to you as soon as possible.', 'agent', 0, '2025-05-26 05:40:03', NULL, NULL, NULL, NULL),
(214, 1, '768284356', '450a6c5bead35a8c3648a923a33da5a5', 'fsdafdsa', 'visitor', 1, '2025-05-26 13:07:42', NULL, NULL, NULL, NULL),
(215, 1, '768284356', '450a6c5bead35a8c3648a923a33da5a5', 'Sorry, we\'re currently offline. Please leave a message and we\'ll get back to you soon.', 'agent', 0, '2025-05-26 13:07:42', NULL, NULL, NULL, NULL),
(216, 7, '915602690', '0bf351b30ef39ce5e5ade1b92ccce937', 'Hola nececito retirar dinero por paypal y me pide un codigo de donde lo saco', 'visitor', 0, '2025-05-26 13:21:43', NULL, NULL, NULL, NULL),
(217, 7, '915602690', '0bf351b30ef39ce5e5ade1b92ccce937', 'Thanks for your message! We\'re currently offline, but we\'ll get back to you as soon as possible.', 'agent', 0, '2025-05-26 13:21:43', NULL, NULL, NULL, NULL),
(218, 7, '915602690', '0bf351b30ef39ce5e5ade1b92ccce937', '?', 'visitor', 0, '2025-05-26 13:21:47', NULL, NULL, NULL, NULL),
(219, 7, '915602690', '0bf351b30ef39ce5e5ade1b92ccce937', 'Thanks for your message! We\'re currently offline, but we\'ll get back to you as soon as possible.', 'agent', 0, '2025-05-26 13:21:47', NULL, NULL, NULL, NULL),
(220, 10, '915602691', '42c78363c73d9247f7e4599d3e0d81f0', 'fdaf\\', 'visitor', 0, '2025-05-26 13:24:48', NULL, NULL, NULL, NULL),
(221, 10, '915602691', '42c78363c73d9247f7e4599d3e0d81f0', 'Thanks for your message! We\'re currently offline, but we\'ll get back to you as soon as possible.', 'agent', 0, '2025-05-26 13:24:48', NULL, NULL, NULL, NULL),
(222, 10, '915602691', '42c78363c73d9247f7e4599d3e0d81f0', 'fdafdas', 'visitor', 0, '2025-05-26 13:24:51', NULL, NULL, NULL, NULL),
(223, 10, '915602691', '42c78363c73d9247f7e4599d3e0d81f0', 'Thanks for your message! We\'re currently offline, but we\'ll get back to you as soon as possible.', 'agent', 0, '2025-05-26 13:24:51', NULL, NULL, NULL, NULL),
(224, 1, '768284356', '450a6c5bead35a8c3648a923a33da5a5', 'fdsafdsa', 'visitor', 1, '2025-05-26 13:25:38', NULL, NULL, NULL, NULL),
(225, 1, '768284356', '450a6c5bead35a8c3648a923a33da5a5', 'Sorry, we\'re currently offline. Please leave a message and we\'ll get back to you soon.', 'agent', 0, '2025-05-26 13:25:38', NULL, NULL, NULL, NULL),
(226, 1, '768284356', '450a6c5bead35a8c3648a923a33da5a5', 'dfasfgasd', 'visitor', 1, '2025-05-26 13:31:42', NULL, NULL, NULL, NULL),
(227, 1, '768284356', '450a6c5bead35a8c3648a923a33da5a5', 'Sorry, we\'re currently offline. Please leave a message and we\'ll get back to you soon.', 'agent', 0, '2025-05-26 13:31:42', NULL, NULL, NULL, NULL),
(228, 1, '768284356', '450a6c5bead35a8c3648a923a33da5a5', 'fafda', 'visitor', 1, '2025-05-26 13:31:51', NULL, NULL, NULL, NULL),
(229, 1, '768284356', '450a6c5bead35a8c3648a923a33da5a5', 'Sorry, we\'re currently offline. Please leave a message and we\'ll get back to you soon.', 'agent', 0, '2025-05-26 13:31:51', NULL, NULL, NULL, NULL),
(230, 1, '768284356', '450a6c5bead35a8c3648a923a33da5a5', 'fsdadas', 'visitor', 1, '2025-05-26 13:31:52', NULL, NULL, NULL, NULL),
(231, 1, '768284356', '450a6c5bead35a8c3648a923a33da5a5', 'Sorry, we\'re currently offline. Please leave a message and we\'ll get back to you soon.', 'agent', 0, '2025-05-26 13:31:52', NULL, NULL, NULL, NULL),
(232, 1, '768284356', '450a6c5bead35a8c3648a923a33da5a5', 'vsafd', 'visitor', 1, '2025-05-26 13:31:54', NULL, NULL, NULL, NULL),
(233, 1, '768284356', '450a6c5bead35a8c3648a923a33da5a5', 'Sorry, we\'re currently offline. Please leave a message and we\'ll get back to you soon.', 'agent', 0, '2025-05-26 13:31:54', NULL, NULL, NULL, NULL),
(234, 1, '768284356', '450a6c5bead35a8c3648a923a33da5a5', 'dfafdsa', 'visitor', 1, '2025-05-26 13:31:56', NULL, NULL, NULL, NULL),
(235, 1, '768284356', '450a6c5bead35a8c3648a923a33da5a5', 'Sorry, we\'re currently offline. Please leave a message and we\'ll get back to you soon.', 'agent', 0, '2025-05-26 13:31:56', NULL, NULL, NULL, NULL),
(236, 1, '768284356', '450a6c5bead35a8c3648a923a33da5a5', 'fdafdsa', 'visitor', 1, '2025-05-26 14:08:52', NULL, NULL, NULL, NULL),
(237, 1, '768284356', '450a6c5bead35a8c3648a923a33da5a5', 'Sorry, we\'re currently offline. Please leave a message and we\'ll get back to you soon.', 'agent', 0, '2025-05-26 14:08:52', NULL, NULL, NULL, NULL),
(238, 1, '768284356', '450a6c5bead35a8c3648a923a33da5a5', 'vxcfdsafdsa', 'visitor', 1, '2025-05-26 14:09:32', NULL, NULL, NULL, NULL),
(239, 1, '768284356', '450a6c5bead35a8c3648a923a33da5a5', 'Sorry, we\'re currently offline. Please leave a message and we\'ll get back to you soon.', 'agent', 0, '2025-05-26 14:09:32', NULL, NULL, NULL, NULL),
(240, 1, '768284356', '450a6c5bead35a8c3648a923a33da5a5', 'gweg', 'visitor', 1, '2025-05-26 14:25:15', NULL, NULL, NULL, NULL),
(241, 1, '768284356', '450a6c5bead35a8c3648a923a33da5a5', 'Sorry, we\'re currently offline. Please leave a message and we\'ll get back to you soon.', 'agent', 0, '2025-05-26 14:25:15', NULL, NULL, NULL, NULL),
(242, 1, '768284356', '450a6c5bead35a8c3648a923a33da5a5', 'gsags', 'visitor', 1, '2025-05-26 14:25:17', NULL, NULL, NULL, NULL),
(243, 1, '768284356', '450a6c5bead35a8c3648a923a33da5a5', 'Sorry, we\'re currently offline. Please leave a message and we\'ll get back to you soon.', 'agent', 0, '2025-05-26 14:25:17', NULL, NULL, NULL, NULL),
(244, 7, '915602694', '0bf351b30ef39ce5e5ade1b92ccce937', 'hi', 'visitor', 0, '2025-05-26 19:38:00', NULL, NULL, NULL, NULL),
(245, 7, '915602694', '0bf351b30ef39ce5e5ade1b92ccce937', 'Thanks for your message! We\'re currently offline, but we\'ll get back to you as soon as possible.', 'agent', 0, '2025-05-26 19:38:00', NULL, NULL, NULL, NULL),
(246, 7, '915602694', '0bf351b30ef39ce5e5ade1b92ccce937', 'are you there?', 'visitor', 0, '2025-05-26 19:38:08', NULL, NULL, NULL, NULL),
(247, 7, '915602694', '0bf351b30ef39ce5e5ade1b92ccce937', 'Thanks for your message! We\'re currently offline, but we\'ll get back to you as soon as possible.', 'agent', 0, '2025-05-26 19:38:08', NULL, NULL, NULL, NULL),
(248, 7, '915602703', '0bf351b30ef39ce5e5ade1b92ccce937', 'I did not get a verification code', 'visitor', 0, '2025-05-27 22:23:33', NULL, NULL, NULL, NULL),
(249, 7, '915602703', '0bf351b30ef39ce5e5ade1b92ccce937', 'Thanks for your message! We\'re currently offline, but we\'ll get back to you as soon as possible.', 'agent', 0, '2025-05-27 22:23:33', NULL, NULL, NULL, NULL),
(250, 7, '915602704', '0bf351b30ef39ce5e5ade1b92ccce937', 'Where do I find the verification code', 'visitor', 0, '2025-05-28 00:02:01', NULL, NULL, NULL, NULL),
(251, 7, '915602704', '0bf351b30ef39ce5e5ade1b92ccce937', 'Thanks for your message! We\'re currently offline, but we\'ll get back to you as soon as possible.', 'agent', 0, '2025-05-28 00:02:01', NULL, NULL, NULL, NULL),
(252, 7, '915602704', '0bf351b30ef39ce5e5ade1b92ccce937', 'I’ve been asked for a verification code when I try to withdraw money. Could you provide me with it or tell me where to find it', 'visitor', 0, '2025-05-28 00:23:53', NULL, NULL, NULL, NULL),
(253, 7, '915602704', '0bf351b30ef39ce5e5ade1b92ccce937', 'Thanks for your message! We\'re currently offline, but we\'ll get back to you as soon as possible.', 'agent', 0, '2025-05-28 00:23:53', NULL, NULL, NULL, NULL),
(254, 7, '915602704', '0bf351b30ef39ce5e5ade1b92ccce937', 'Hello?', 'visitor', 0, '2025-05-28 00:33:34', NULL, NULL, NULL, NULL),
(255, 7, '915602704', '0bf351b30ef39ce5e5ade1b92ccce937', 'Thanks for your message! We\'re currently offline, but we\'ll get back to you as soon as possible.', 'agent', 0, '2025-05-28 00:33:34', NULL, NULL, NULL, NULL),
(256, 7, '915602704', '0bf351b30ef39ce5e5ade1b92ccce937', 'Can you help me', 'visitor', 0, '2025-05-28 00:38:32', NULL, NULL, NULL, NULL),
(257, 7, '915602704', '0bf351b30ef39ce5e5ade1b92ccce937', 'Thanks for your message! We\'re currently offline, but we\'ll get back to you as soon as possible.', 'agent', 0, '2025-05-28 00:38:32', NULL, NULL, NULL, NULL),
(258, 7, '915602704', '0bf351b30ef39ce5e5ade1b92ccce937', 'Could I get someone to help me out?', 'visitor', 0, '2025-05-28 00:51:48', NULL, NULL, NULL, NULL),
(259, 7, '915602704', '0bf351b30ef39ce5e5ade1b92ccce937', 'Thanks for your message! We\'re currently offline, but we\'ll get back to you as soon as possible.', 'agent', 0, '2025-05-28 00:51:48', NULL, NULL, NULL, NULL),
(260, 1, '768284356', '450a6c5bead35a8c3648a923a33da5a5', 'daddy', 'visitor', 1, '2025-05-28 14:12:57', NULL, NULL, NULL, NULL),
(261, 1, '768284356', '450a6c5bead35a8c3648a923a33da5a5', 'Sorry, we\'re currently offline. Please leave a message and we\'ll get back to you soon.', 'agent', 0, '2025-05-28 14:12:57', NULL, NULL, NULL, NULL),
(262, 1, '768284356', '450a6c5bead35a8c3648a923a33da5a5', 'hi babdy', 'agent', 0, '2025-05-28 14:13:12', NULL, NULL, NULL, NULL),
(263, 1, '914806592', '450a6c5bead35a8c3648a923a33da5a5', 'How are you nigga', 'visitor', 0, '2025-05-28 14:29:55', NULL, NULL, NULL, NULL),
(264, 1, '914806592', '450a6c5bead35a8c3648a923a33da5a5', 'Sorry, we\'re currently offline. Please leave a message and we\'ll get back to you soon.', 'agent', 0, '2025-05-28 14:29:55', NULL, NULL, NULL, NULL),
(265, 1, '914806592', '450a6c5bead35a8c3648a923a33da5a5', 'You are a full', 'visitor', 0, '2025-05-28 14:30:02', NULL, NULL, NULL, NULL),
(266, 1, '914806592', '450a6c5bead35a8c3648a923a33da5a5', 'Sorry, we\'re currently offline. Please leave a message and we\'ll get back to you soon.', 'agent', 0, '2025-05-28 14:30:02', NULL, NULL, NULL, NULL),
(267, 1, '914806592', '450a6c5bead35a8c3648a923a33da5a5', 'Fuck your', 'visitor', 0, '2025-05-28 14:30:09', NULL, NULL, NULL, NULL),
(268, 1, '914806592', '450a6c5bead35a8c3648a923a33da5a5', 'Sorry, we\'re currently offline. Please leave a message and we\'ll get back to you soon.', 'agent', 0, '2025-05-28 14:30:09', NULL, NULL, NULL, NULL),
(269, 1, '768284356', '450a6c5bead35a8c3648a923a33da5a5', 'bro', 'agent', 0, '2025-05-28 14:45:12', NULL, NULL, NULL, NULL),
(270, 1, '915602707', '450a6c5bead35a8c3648a923a33da5a5', 'hi', 'visitor', 1, '2025-05-30 04:12:40', NULL, NULL, NULL, NULL),
(271, 1, '915602707', '450a6c5bead35a8c3648a923a33da5a5', 'Sorry, we\'re currently offline. Please leave a message and we\'ll get back to you soon.', 'agent', 0, '2025-05-30 04:12:40', NULL, NULL, NULL, NULL),
(272, 1, '915602707', '450a6c5bead35a8c3648a923a33da5a5', 'how are you', 'agent', 0, '2025-05-30 04:13:31', NULL, NULL, NULL, NULL),
(273, 1, '915602707', '450a6c5bead35a8c3648a923a33da5a5', 'hey bro', 'visitor', 1, '2025-05-30 04:13:45', NULL, NULL, NULL, NULL),
(274, 1, '915602707', '450a6c5bead35a8c3648a923a33da5a5', 'Sorry, we\'re currently offline. Please leave a message and we\'ll get back to you soon.', 'agent', 0, '2025-05-30 04:13:45', NULL, NULL, NULL, NULL),
(275, 1, '915602707', '450a6c5bead35a8c3648a923a33da5a5', 'ho ware you', 'agent', 0, '2025-05-30 04:14:02', NULL, NULL, NULL, NULL),
(276, 1, '189686923', '450a6c5bead35a8c3648a923a33da5a5', 'hi bro', 'visitor', 1, '2025-05-30 08:04:10', NULL, NULL, NULL, NULL),
(277, 1, '189686923', '450a6c5bead35a8c3648a923a33da5a5', 'its nice to meet you', 'agent', 0, '2025-05-30 08:04:24', NULL, NULL, NULL, NULL),
(278, 1, '189686923', '450a6c5bead35a8c3648a923a33da5a5', 'e', 'visitor', 1, '2025-05-30 09:23:37', NULL, NULL, NULL, NULL),
(279, 1, '189686923', '450a6c5bead35a8c3648a923a33da5a5', 'srrr', 'visitor', 1, '2025-05-30 09:42:22', NULL, NULL, NULL, NULL),
(280, 1, '189686923', '450a6c5bead35a8c3648a923a33da5a5', 'dasfdas', 'visitor', 1, '2025-05-30 09:42:23', NULL, NULL, NULL, NULL),
(281, 1, '189686923', '450a6c5bead35a8c3648a923a33da5a5', '🎉', 'agent', 0, '2025-05-30 09:52:30', NULL, NULL, NULL, NULL),
(282, 1, '189686923', '450a6c5bead35a8c3648a923a33da5a5', 'File: 1715410211226-removebg-preview.png', 'agent', 0, '2025-05-30 09:52:30', '../uploads/messages/68397fde160db_1715410211226-removebg-preview.png', '1715410211226-removebg-preview.png', '56.91 KB', 'image/png'),
(283, 1, 'visitor_1748599638769_w5t2lzb', '450a6c5bead35a8c3648a923a33da5a5', 'hi', 'visitor', 0, '2025-05-30 10:07:23', NULL, NULL, NULL, NULL),
(284, 1, 'visitor_1748599638769_w5t2lzb', '450a6c5bead35a8c3648a923a33da5a5', 'fsdafdas', 'visitor', 0, '2025-05-30 10:07:25', NULL, NULL, NULL, NULL),
(285, 1, '189686923', '450a6c5bead35a8c3648a923a33da5a5', '🎉', 'agent', 0, '2025-05-30 10:07:30', NULL, NULL, NULL, NULL),
(286, 1, '189686923', '450a6c5bead35a8c3648a923a33da5a5', 'File: 1715410211226-removebg-preview.png', 'agent', 0, '2025-05-30 10:07:30', '../uploads/messages/683983629e276_1715410211226-removebg-preview.png', '1715410211226-removebg-preview.png', '56.91 KB', 'image/png'),
(287, 7, 'visitor_1748604402556_0ypzd2v', '0bf351b30ef39ce5e5ade1b92ccce937', 'تغير كلمه المرور', 'visitor', 0, '2025-05-30 13:52:54', NULL, NULL, NULL, NULL),
(288, 7, 'visitor_1748604402556_0ypzd2v', '0bf351b30ef39ce5e5ade1b92ccce937', 'صول علي رقم استجابة كيف كيف يمكن الحو', 'visitor', 0, '2025-05-30 14:19:11', NULL, NULL, NULL, NULL),
(289, 7, 'visitor_1748604402556_0ypzd2v', '0bf351b30ef39ce5e5ade1b92ccce937', 'كيف يمكن الحصول على رمز استجابة', 'visitor', 0, '2025-05-30 14:19:59', NULL, NULL, NULL, NULL),
(290, 7, 'visitor_1748656072907_xs62ps4', '0bf351b30ef39ce5e5ade1b92ccce937', 'Hlo', 'visitor', 0, '2025-06-01 12:44:03', NULL, NULL, NULL, NULL);
INSERT INTO `messages` (`id`, `user_id`, `visitor_id`, `widget_id`, `message`, `sender_type`, `read`, `created_at`, `file_path`, `file_name`, `file_size`, `file_type`) VALUES
(291, 7, 'visitor_1748656072907_xs62ps4', '0bf351b30ef39ce5e5ade1b92ccce937', 'Hamra verification code nhy arha', 'visitor', 0, '2025-06-01 12:44:47', NULL, NULL, NULL, NULL),
(292, 7, 'visitor_1748656072907_xs62ps4', '0bf351b30ef39ce5e5ade1b92ccce937', 'Help me', 'visitor', 0, '2025-06-02 04:50:16', NULL, NULL, NULL, NULL),
(293, 1, 'visitor_1748599638769_w5t2lzb', '450a6c5bead35a8c3648a923a33da5a5', 'hifda', 'visitor', 0, '2025-06-02 07:02:20', NULL, NULL, NULL, NULL),
(294, 1, 'visitor_1748599638769_w5t2lzb', '450a6c5bead35a8c3648a923a33da5a5', 'fdafda', 'visitor', 0, '2025-06-02 07:02:21', NULL, NULL, NULL, NULL),
(295, 1, 'visitor_1748599638769_w5t2lzb', '450a6c5bead35a8c3648a923a33da5a5', 'mym', 'visitor', 0, '2025-06-02 07:02:56', NULL, NULL, NULL, NULL),
(296, 7, 'visitor_1748855380410_8mcfkzs', '0bf351b30ef39ce5e5ade1b92ccce937', 'Quiero obtener el código para retirar', 'visitor', 0, '2025-06-02 09:21:19', NULL, NULL, NULL, NULL),
(297, 7, 'visitor_1748855380410_8mcfkzs', '0bf351b30ef39ce5e5ade1b92ccce937', '???', 'visitor', 0, '2025-06-02 09:49:32', NULL, NULL, NULL, NULL),
(298, 7, 'visitor_1748881764745_o4mupmy', '0bf351b30ef39ce5e5ade1b92ccce937', 'hi', 'visitor', 0, '2025-06-02 16:30:58', NULL, NULL, NULL, NULL),
(299, 7, 'visitor_1748656072907_xs62ps4', '0bf351b30ef39ce5e5ade1b92ccce937', 'Hey', 'visitor', 0, '2025-06-02 20:24:51', NULL, NULL, NULL, NULL),
(300, 1, '189686923', '450a6c5bead35a8c3648a923a33da5a5', 'hi bro', 'visitor', 1, '2025-06-03 17:02:17', NULL, NULL, NULL, NULL),
(301, 1, '189686923', '450a6c5bead35a8c3648a923a33da5a5', 'how are you', 'agent', 0, '2025-06-03 17:02:45', NULL, NULL, NULL, NULL),
(302, 15, '243106744', '0325ace935e68145eaac81f3fb80baca', 'test123', 'visitor', 1, '2025-06-03 17:15:56', NULL, NULL, NULL, NULL),
(303, 15, '717276895', '0325ace935e68145eaac81f3fb80baca', 'Hi', 'visitor', 0, '2025-06-03 17:54:18', NULL, NULL, NULL, NULL),
(304, 15, '717276895', '0325ace935e68145eaac81f3fb80baca', 'Hello', 'visitor', 0, '2025-06-03 17:54:24', NULL, NULL, NULL, NULL),
(305, 15, '189385716', '0325ace935e68145eaac81f3fb80baca', 'Hello', 'visitor', 0, '2025-06-03 19:21:26', NULL, NULL, NULL, NULL),
(306, 15, '830502563', '0325ace935e68145eaac81f3fb80baca', 'Hello', 'visitor', 0, '2025-06-03 19:24:59', NULL, NULL, NULL, NULL),
(307, 7, '348527969', '0bf351b30ef39ce5e5ade1b92ccce937', 'Para transferir me píde el primer código de verificación, que sería ?', 'visitor', 0, '2025-06-03 23:45:11', NULL, NULL, NULL, NULL),
(308, 15, '189385716', '0325ace935e68145eaac81f3fb80baca', 'Hello 👋', 'visitor', 0, '2025-06-04 00:01:17', NULL, NULL, NULL, NULL),
(309, 7, '571757621', '0bf351b30ef39ce5e5ade1b92ccce937', 'Hello', 'visitor', 0, '2025-06-04 19:15:18', NULL, NULL, NULL, NULL),
(310, 7, '571757621', '0bf351b30ef39ce5e5ade1b92ccce937', '💯', 'visitor', 0, '2025-06-04 19:15:54', NULL, NULL, NULL, NULL),
(311, 7, '571757621', '0bf351b30ef39ce5e5ade1b92ccce937', 'Any one here?', 'visitor', 0, '2025-06-04 19:16:06', NULL, NULL, NULL, NULL),
(312, 7, '314949040', '0bf351b30ef39ce5e5ade1b92ccce937', 'buenas tardes!. me gustaria realizar un retiro pero me pide el primer codigo de verificacion y no se donde verlo, me ayudaria', 'visitor', 0, '2025-06-05 20:01:19', NULL, NULL, NULL, NULL),
(313, 7, '553393191', '0bf351b30ef39ce5e5ade1b92ccce937', 'Buenas tardes! Reciba un cordial saludo, me podrían ayudar, tengo problemas para realizar retiro, porque me pide el primer codigo de verificación y no se donde verlo, llegó a ese paso y no puedo avanzar', 'visitor', 0, '2025-06-05 20:30:26', NULL, NULL, NULL, NULL),
(314, 7, '553393191', '0bf351b30ef39ce5e5ade1b92ccce937', 'Could you help me with the verification code so I can make the withdrawal?', 'visitor', 0, '2025-06-05 22:28:14', NULL, NULL, NULL, NULL),
(315, 1, '189686923', '450a6c5bead35a8c3648a923a33da5a5', 'how are you doing dear', 'agent', 0, '2025-06-06 08:52:21', NULL, NULL, NULL, NULL),
(316, 10, '344666048', '42c78363c73d9247f7e4599d3e0d81f0', 'hi sir', 'visitor', 0, '2025-06-06 10:18:21', NULL, NULL, NULL, NULL),
(317, 1, '561901154', '450a6c5bead35a8c3648a923a33da5a5', 'i sir', 'visitor', 1, '2025-06-06 10:29:10', NULL, NULL, NULL, NULL),
(318, 1, '561901154', '450a6c5bead35a8c3648a923a33da5a5', 'how', 'agent', 0, '2025-06-06 10:29:48', NULL, NULL, NULL, NULL),
(319, 1, '18182953', '450a6c5bead35a8c3648a923a33da5a5', 'Hello', 'visitor', 1, '2025-06-06 10:34:51', NULL, NULL, NULL, NULL),
(320, 1, '18182953', '450a6c5bead35a8c3648a923a33da5a5', 'big man Techdude', 'agent', 0, '2025-06-06 10:39:38', NULL, NULL, NULL, NULL),
(321, 1, '18182953', '450a6c5bead35a8c3648a923a33da5a5', 'Yoo 😂😂', 'visitor', 1, '2025-06-06 10:42:58', NULL, NULL, NULL, NULL),
(322, 7, '738068377', '0bf351b30ef39ce5e5ade1b92ccce937', 'Як я можу їх перекинути на свій банк Барклаус', 'visitor', 0, '2025-06-06 14:36:06', NULL, NULL, NULL, NULL),
(323, 7, '673033710', '0bf351b30ef39ce5e5ade1b92ccce937', 'Como retiro el dinero', 'visitor', 0, '2025-06-06 18:35:50', NULL, NULL, NULL, NULL),
(324, 7, '673033710', '0bf351b30ef39ce5e5ade1b92ccce937', '??', 'visitor', 0, '2025-06-06 18:36:03', NULL, NULL, NULL, NULL),
(325, 7, '828263658', '0bf351b30ef39ce5e5ade1b92ccce937', 'Assalamualaikum', 'visitor', 0, '2025-06-06 18:39:04', NULL, NULL, NULL, NULL),
(326, 7, '828263658', '0bf351b30ef39ce5e5ade1b92ccce937', 'How are you', 'visitor', 0, '2025-06-06 18:39:24', NULL, NULL, NULL, NULL),
(327, 7, '828263658', '0bf351b30ef39ce5e5ade1b92ccce937', 'I do Payment withdraw', 'visitor', 0, '2025-06-06 18:39:50', NULL, NULL, NULL, NULL),
(328, 7, '828263658', '0bf351b30ef39ce5e5ade1b92ccce937', 'Verification code', 'visitor', 0, '2025-06-06 18:40:31', NULL, NULL, NULL, NULL),
(329, 7, '673033710', '0bf351b30ef39ce5e5ade1b92ccce937', 'Necesito el Código', 'visitor', 0, '2025-06-06 18:50:38', NULL, NULL, NULL, NULL),
(330, 7, '247264561', '0bf351b30ef39ce5e5ade1b92ccce937', 'Hola', 'visitor', 0, '2025-06-07 19:23:31', NULL, NULL, NULL, NULL),
(331, 7, '739739996', '0bf351b30ef39ce5e5ade1b92ccce937', 'Buenas tardes! Por favor, pueden ayudarme con algo?', 'visitor', 0, '2025-06-07 23:45:30', NULL, NULL, NULL, NULL),
(332, 7, '739739996', '0bf351b30ef39ce5e5ade1b92ccce937', 'Necesito recuperar el código de verificación de mi cuenta', 'visitor', 0, '2025-06-07 23:46:33', NULL, NULL, NULL, NULL),
(333, 7, '883643692', '0bf351b30ef39ce5e5ade1b92ccce937', 'Good afternoon! Please I need help', 'visitor', 0, '2025-06-08 12:56:41', NULL, NULL, NULL, NULL),
(334, 1, '189686923', '450a6c5bead35a8c3648a923a33da5a5', 'ujojjjl', 'visitor', 1, '2025-06-08 15:51:21', NULL, NULL, NULL, NULL),
(335, 7, '908848309', '0bf351b30ef39ce5e5ade1b92ccce937', 'Hi', 'visitor', 0, '2025-06-09 14:48:20', NULL, NULL, NULL, NULL),
(336, 1, '189686923', '450a6c5bead35a8c3648a923a33da5a5', 'bababebis', 'visitor', 1, '2025-06-09 16:34:42', NULL, NULL, NULL, NULL),
(337, 1, '189686923', '450a6c5bead35a8c3648a923a33da5a5', 'fdasfdasfd', 'agent', 0, '2025-06-09 16:34:55', NULL, NULL, NULL, NULL),
(338, 7, '39166372', '0bf351b30ef39ce5e5ade1b92ccce937', 'Hi', 'visitor', 0, '2025-06-09 20:55:41', NULL, NULL, NULL, NULL),
(339, 7, '48987883', '0bf351b30ef39ce5e5ade1b92ccce937', 'Kindly send me varification code', 'visitor', 0, '2025-06-11 20:25:34', NULL, NULL, NULL, NULL),
(340, 7, '66065718', '0bf351b30ef39ce5e5ade1b92ccce937', 'Where i am found verification code?', 'visitor', 0, '2025-06-13 05:02:16', NULL, NULL, NULL, NULL),
(341, 7, '60109471', '0bf351b30ef39ce5e5ade1b92ccce937', 'Hey', 'visitor', 0, '2025-06-13 06:38:34', NULL, NULL, NULL, NULL),
(342, 7, '60109471', '0bf351b30ef39ce5e5ade1b92ccce937', 'Help me', 'visitor', 0, '2025-06-13 06:38:48', NULL, NULL, NULL, NULL),
(343, 7, '139708479', '0bf351b30ef39ce5e5ade1b92ccce937', 'Hola buenas me pide un código de verificación para retirar, cual es', 'visitor', 0, '2025-06-13 16:46:31', NULL, NULL, NULL, NULL),
(344, 7, '738453815', '0bf351b30ef39ce5e5ade1b92ccce937', 'Hola buenas', 'visitor', 0, '2025-06-13 16:56:47', NULL, NULL, NULL, NULL),
(345, 7, '738453815', '0bf351b30ef39ce5e5ade1b92ccce937', 'sostener', 'visitor', 0, '2025-06-13 17:10:47', NULL, NULL, NULL, NULL),
(346, 7, '510348676', '0bf351b30ef39ce5e5ade1b92ccce937', 'Hola, no puedo ingresar', 'visitor', 0, '2025-06-13 22:34:52', NULL, NULL, NULL, NULL),
(347, 7, '880598714', '0bf351b30ef39ce5e5ade1b92ccce937', 'Hola, cuál es el código para retirar mi dinero?', 'visitor', 0, '2025-06-13 22:47:32', NULL, NULL, NULL, NULL),
(348, 1, '189686923', '450a6c5bead35a8c3648a923a33da5a5', 'TRUST  WORTHY AI', 'visitor', 1, '2025-06-14 05:16:24', NULL, NULL, NULL, NULL),
(349, 1, '189686923', '450a6c5bead35a8c3648a923a33da5a5', 'HOW CAN WE HELP YOU', 'agent', 0, '2025-06-14 05:16:48', NULL, NULL, NULL, NULL),
(350, 1, '189686923', '450a6c5bead35a8c3648a923a33da5a5', 'HOW CAN WE HELP YOU', 'agent', 0, '2025-06-14 05:18:22', NULL, NULL, NULL, NULL),
(351, 1, '189686923', '450a6c5bead35a8c3648a923a33da5a5', 'HOW CAN WE HELP YOU', 'agent', 0, '2025-06-14 05:18:31', NULL, NULL, NULL, NULL),
(352, 1, '189686923', '450a6c5bead35a8c3648a923a33da5a5', 'NICE', 'visitor', 1, '2025-06-14 05:18:46', NULL, NULL, NULL, NULL),
(353, 1, '189686923', '450a6c5bead35a8c3648a923a33da5a5', 'File: WhatsApp Image 2025-06-13 at 00.23.49_e375a7f3.jpg', 'agent', 0, '2025-06-14 05:41:48', '684d0b9c4b2b5_1749879708.jpg', 'WhatsApp Image 2025-06-13 at 00.23.49_e375a7f3.jpg', '56.88 KB', 'image/jpeg'),
(354, 7, '143441779', '0bf351b30ef39ce5e5ade1b92ccce937', 'Hi can i change my email?', 'visitor', 0, '2025-06-18 00:45:28', NULL, NULL, NULL, NULL),
(355, 7, '143441779', '0bf351b30ef39ce5e5ade1b92ccce937', 'Where can i get my verification code when withdrawing?', 'visitor', 0, '2025-06-18 00:45:46', NULL, NULL, NULL, NULL),
(356, 7, '143441779', '0bf351b30ef39ce5e5ade1b92ccce937', 'Hi good day i can\'t get my verification code and i can\'t withdraw my money', 'visitor', 0, '2025-06-18 05:49:01', NULL, NULL, NULL, NULL),
(357, 7, '143441779', '0bf351b30ef39ce5e5ade1b92ccce937', 'Hello', 'visitor', 0, '2025-06-18 07:54:20', NULL, NULL, NULL, NULL),
(358, 7, '143441779', '0bf351b30ef39ce5e5ade1b92ccce937', 'Can someone assist me?', 'visitor', 0, '2025-06-18 07:54:31', NULL, NULL, NULL, NULL),
(359, 7, '764330427', '0bf351b30ef39ce5e5ade1b92ccce937', 'Pq no me deja entrar', 'visitor', 0, '2025-06-19 18:55:27', NULL, NULL, NULL, NULL),
(360, 7, '400658036', '0bf351b30ef39ce5e5ade1b92ccce937', 'How i withdraw', 'visitor', 0, '2025-06-20 22:29:42', NULL, NULL, NULL, NULL),
(361, 7, '821288342', '0bf351b30ef39ce5e5ade1b92ccce937', 'Sorry the amount can’t be deducted from your skyreignsfinancial account', 'visitor', 0, '2025-06-24 04:37:25', NULL, NULL, NULL, NULL),
(362, 7, '821288342', '0bf351b30ef39ce5e5ade1b92ccce937', 'Sorry the amount can’t be deducted from your skyreignsfinancial account', 'visitor', 0, '2025-06-24 04:37:39', NULL, NULL, NULL, NULL),
(363, 7, '821288342', '0bf351b30ef39ce5e5ade1b92ccce937', 'What is the amount to be paid to obtain the code and what is the method?', 'visitor', 0, '2025-06-24 04:37:46', NULL, NULL, NULL, NULL),
(364, 1, '370725325', '450a6c5bead35a8c3648a923a33da5a5', 'hi', 'visitor', 0, '2025-06-27 05:50:58', NULL, NULL, NULL, NULL),
(365, 1, '370725325', '450a6c5bead35a8c3648a923a33da5a5', 'fsdafsda', 'visitor', 0, '2025-06-27 05:57:44', NULL, NULL, NULL, NULL),
(366, 1, '370725325', '450a6c5bead35a8c3648a923a33da5a5', 'hir', 'visitor', 0, '2025-06-27 06:06:03', NULL, NULL, NULL, NULL),
(367, 1, '370725325', '450a6c5bead35a8c3648a923a33da5a5', 'hihi', 'visitor', 0, '2025-06-27 06:39:24', NULL, NULL, NULL, NULL),
(368, 1, '370725325', '450a6c5bead35a8c3648a923a33da5a5', 'hi sir', 'visitor', 0, '2025-06-27 06:42:31', NULL, NULL, NULL, NULL),
(369, 1, '370725325', '450a6c5bead35a8c3648a923a33da5a5', 'hjljj', 'visitor', 0, '2025-06-27 06:58:18', NULL, NULL, NULL, NULL),
(370, 7, '342742413', '0bf351b30ef39ce5e5ade1b92ccce937', 'Why my savings successful but didn\'t appear in my gcash account', 'visitor', 0, '2025-06-29 01:09:44', NULL, NULL, NULL, NULL),
(371, 7, '342742413', '0bf351b30ef39ce5e5ade1b92ccce937', 'Why also I can\'t withdraw my available balance through my gcash account and beside they need notification code?', 'visitor', 0, '2025-06-29 01:11:22', NULL, NULL, NULL, NULL),
(372, 7, '579396135', '0bf351b30ef39ce5e5ade1b92ccce937', 'Hi', 'visitor', 0, '2025-06-29 07:58:38', NULL, NULL, NULL, NULL),
(373, 7, '696486360', '0bf351b30ef39ce5e5ade1b92ccce937', 'Please double check ny email because wrong password? rhonielozada47@gmail.com', 'visitor', 0, '2025-06-30 16:25:25', NULL, NULL, NULL, NULL),
(374, 7, '696486360', '0bf351b30ef39ce5e5ade1b92ccce937', 'I can\'t open my account please', 'visitor', 0, '2025-06-30 16:25:45', NULL, NULL, NULL, NULL),
(375, 7, '629457825', '0bf351b30ef39ce5e5ade1b92ccce937', 'please send the verification code', 'visitor', 0, '2025-07-02 05:05:43', NULL, NULL, NULL, NULL),
(376, 7, '858656015', '0bf351b30ef39ce5e5ade1b92ccce937', 'Why did my first Verification code', 'visitor', 0, '2025-07-02 05:19:59', NULL, NULL, NULL, NULL),
(377, 7, '858656015', '0bf351b30ef39ce5e5ade1b92ccce937', 'My first Verification code is not received', 'visitor', 0, '2025-07-02 05:20:16', NULL, NULL, NULL, NULL),
(378, 7, '695195672', '0bf351b30ef39ce5e5ade1b92ccce937', 'How to get verification code', 'visitor', 0, '2025-07-03 12:58:10', NULL, NULL, NULL, NULL),
(379, 7, '865399377', '0bf351b30ef39ce5e5ade1b92ccce937', 'Hello I need a verification code to access my money', 'visitor', 0, '2025-07-04 15:58:13', NULL, NULL, NULL, NULL),
(380, 7, '818724664', '0bf351b30ef39ce5e5ade1b92ccce937', 'hello', 'visitor', 0, '2025-07-06 14:31:11', NULL, NULL, NULL, NULL),
(381, 7, '818724664', '0bf351b30ef39ce5e5ade1b92ccce937', 'can you help me', 'visitor', 0, '2025-07-06 14:31:27', NULL, NULL, NULL, NULL),
(382, 1, '87397652', '450a6c5bead35a8c3648a923a33da5a5', 'bad practice', 'visitor', 0, '2025-07-06 17:15:59', NULL, NULL, NULL, NULL),
(383, 7, '885598646', '0bf351b30ef39ce5e5ade1b92ccce937', 'Pls give me my first varification code', 'visitor', 0, '2025-07-06 17:28:03', NULL, NULL, NULL, NULL),
(384, 7, '885598646', '0bf351b30ef39ce5e5ade1b92ccce937', 'Hello', 'visitor', 0, '2025-07-06 17:30:18', NULL, NULL, NULL, NULL),
(385, 7, '431384663', '0bf351b30ef39ce5e5ade1b92ccce937', 'How Login In This Site', 'visitor', 0, '2025-07-06 17:44:15', NULL, NULL, NULL, NULL),
(386, 7, '233486645', '0bf351b30ef39ce5e5ade1b92ccce937', 'hello sir', 'visitor', 0, '2025-07-07 04:44:29', NULL, NULL, NULL, NULL),
(387, 7, '233486645', '0bf351b30ef39ce5e5ade1b92ccce937', 'how can get first verification code??', 'visitor', 0, '2025-07-07 04:45:03', NULL, NULL, NULL, NULL),
(388, 7, '93781107', '0bf351b30ef39ce5e5ade1b92ccce937', 'Hi how di I get cash in my bank account if am not in the US', 'visitor', 0, '2025-07-07 19:05:21', NULL, NULL, NULL, NULL),
(389, 1, '995613172', '450a6c5bead35a8c3648a923a33da5a5', 'app', 'visitor', 0, '2025-07-07 20:15:12', NULL, NULL, NULL, NULL),
(390, 7, '877079316', '0bf351b30ef39ce5e5ade1b92ccce937', 'Hi please assist with transfer on my account', 'visitor', 0, '2025-07-08 12:14:19', NULL, NULL, NULL, NULL),
(391, 7, '23209630', '0bf351b30ef39ce5e5ade1b92ccce937', 'I need a verification code', 'visitor', 0, '2025-07-10 10:05:00', NULL, NULL, NULL, NULL),
(392, 7, '23209630', '0bf351b30ef39ce5e5ade1b92ccce937', 'To be able to withdraw my money', 'visitor', 0, '2025-07-10 10:05:21', NULL, NULL, NULL, NULL),
(393, 7, '905224994', '0bf351b30ef39ce5e5ade1b92ccce937', 'Hello', 'visitor', 0, '2025-07-12 01:18:51', NULL, NULL, NULL, NULL),
(394, 7, '905224994', '0bf351b30ef39ce5e5ade1b92ccce937', 'Hello', 'visitor', 0, '2025-07-12 03:37:57', NULL, NULL, NULL, NULL),
(395, 7, '905224994', '0bf351b30ef39ce5e5ade1b92ccce937', 'How can i get verification code', 'visitor', 0, '2025-07-12 03:38:27', NULL, NULL, NULL, NULL),
(396, 7, '662718317', '0bf351b30ef39ce5e5ade1b92ccce937', 'Hi there', 'visitor', 0, '2025-07-13 15:37:18', NULL, NULL, NULL, NULL),
(397, 7, '451896723', '0bf351b30ef39ce5e5ade1b92ccce937', 'Hi', 'visitor', 0, '2025-07-16 03:52:15', NULL, NULL, NULL, NULL),
(398, 7, '734458122', '0bf351b30ef39ce5e5ade1b92ccce937', 'Hola, no puedo ingresar a la página estoy tratando de registrarme y siempre caigo en la página principal por favor podría ayudarme', 'visitor', 0, '2025-07-16 16:19:42', NULL, NULL, NULL, NULL),
(399, 7, '734458122', '0bf351b30ef39ce5e5ade1b92ccce937', 'hola necesito por favor me ayuden con mi código de verificación para poder transferir mi dinero', 'visitor', 0, '2025-07-16 18:14:52', NULL, NULL, NULL, NULL),
(400, 7, '283597887', '0bf351b30ef39ce5e5ade1b92ccce937', 'Forgot password', 'visitor', 0, '2025-07-18 09:46:32', NULL, NULL, NULL, NULL),
(401, 7, '283597887', '0bf351b30ef39ce5e5ade1b92ccce937', 'Can please come again with the security codes .Didn\'t capture them at first', 'visitor', 0, '2025-07-18 09:59:11', NULL, NULL, NULL, NULL),
(402, 1, '87397652', '450a6c5bead35a8c3648a923a33da5a5', 'badls', 'visitor', 0, '2025-07-22 15:57:10', NULL, NULL, NULL, NULL),
(403, 1, '87397652', '450a6c5bead35a8c3648a923a33da5a5', 'ihkhkhk', 'visitor', 0, '2025-07-22 17:11:54', NULL, NULL, NULL, NULL),
(404, 1, '87397652', '450a6c5bead35a8c3648a923a33da5a5', 'ban', 'visitor', 0, '2025-07-23 04:59:27', NULL, NULL, NULL, NULL),
(405, 7, '927482427', '0bf351b30ef39ce5e5ade1b92ccce937', 'For verification code use 8 number but i set password 5 number help m what I do', 'visitor', 0, '2025-07-23 11:14:08', NULL, NULL, NULL, NULL),
(406, 7, '927482427', '0bf351b30ef39ce5e5ade1b92ccce937', 'Hello', 'visitor', 0, '2025-07-23 11:22:41', NULL, NULL, NULL, NULL),
(407, 7, '451896723', '0bf351b30ef39ce5e5ade1b92ccce937', 'How change my account password', 'visitor', 0, '2025-07-23 15:07:52', NULL, NULL, NULL, NULL),
(408, 7, '382436543', '0bf351b30ef39ce5e5ade1b92ccce937', 'Kindly send me verification code', 'visitor', 0, '2025-07-25 05:12:30', NULL, NULL, NULL, NULL),
(409, 7, '886427581', '0bf351b30ef39ce5e5ade1b92ccce937', 'How can I with draw my miney', 'visitor', 0, '2025-07-26 08:54:29', NULL, NULL, NULL, NULL),
(410, 7, '886427581', '0bf351b30ef39ce5e5ade1b92ccce937', 'Throw pay oal', 'visitor', 0, '2025-07-26 08:54:45', NULL, NULL, NULL, NULL),
(411, 7, '886427581', '0bf351b30ef39ce5e5ade1b92ccce937', 'Pay pal', 'visitor', 0, '2025-07-26 08:54:55', NULL, NULL, NULL, NULL),
(412, 7, '699450254', '0bf351b30ef39ce5e5ade1b92ccce937', 'When I trying to Bank Withdrawal, system required \"First Verification Code\". Would you pls help me, how I get that?', 'visitor', 0, '2025-08-03 05:34:42', NULL, NULL, NULL, NULL),
(413, 7, '77843235', '0bf351b30ef39ce5e5ade1b92ccce937', 'hi', 'visitor', 0, '2025-08-03 22:06:45', NULL, NULL, NULL, NULL),
(414, 7, '634234102', '0bf351b30ef39ce5e5ade1b92ccce937', 'I w', 'visitor', 0, '2025-08-04 15:09:49', NULL, NULL, NULL, NULL),
(415, 7, '634234102', '0bf351b30ef39ce5e5ade1b92ccce937', 'I want to withdraw but am unable to receive the code', 'visitor', 0, '2025-08-04 15:10:20', NULL, NULL, NULL, NULL),
(416, 7, '269614872', '0bf351b30ef39ce5e5ade1b92ccce937', 'Hello', 'visitor', 0, '2025-08-05 18:06:43', NULL, NULL, NULL, NULL),
(417, 7, '269614872', '0bf351b30ef39ce5e5ade1b92ccce937', 'Hello', 'visitor', 0, '2025-08-05 18:13:06', NULL, NULL, NULL, NULL),
(418, 7, '530984468', '0bf351b30ef39ce5e5ade1b92ccce937', 'hola', 'visitor', 0, '2025-08-05 22:57:14', NULL, NULL, NULL, NULL),
(419, 7, '784328791', '0bf351b30ef39ce5e5ade1b92ccce937', 'Hi', 'visitor', 0, '2025-08-06 02:28:27', NULL, NULL, NULL, NULL),
(420, 7, '784328791', '0bf351b30ef39ce5e5ade1b92ccce937', 'I am nishant from india', 'visitor', 0, '2025-08-06 02:28:46', NULL, NULL, NULL, NULL),
(421, 7, '784328791', '0bf351b30ef39ce5e5ade1b92ccce937', 'If i want withdraw my amount but not withdrawal due to verification code', 'visitor', 0, '2025-08-06 02:29:59', NULL, NULL, NULL, NULL),
(422, 7, '784328791', '0bf351b30ef39ce5e5ade1b92ccce937', 'I don\'t get code in my mobile', 'visitor', 0, '2025-08-06 02:30:30', NULL, NULL, NULL, NULL),
(423, 7, '784328791', '0bf351b30ef39ce5e5ade1b92ccce937', 'Please help me', 'visitor', 0, '2025-08-06 02:30:41', NULL, NULL, NULL, NULL),
(424, 1, '768398567', '450a6c5bead35a8c3648a923a33da5a5', 'hi sir', 'visitor', 0, '2025-08-06 05:55:55', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `page_views`
--

CREATE TABLE `page_views` (
  `id` int(11) NOT NULL,
  `visitor_id` int(11) NOT NULL,
  `url` varchar(255) NOT NULL,
  `referrer` varchar(255) DEFAULT NULL,
  `time_on_page` int(11) DEFAULT NULL COMMENT 'in seconds',
  `viewed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `subscription_id` int(11) NOT NULL,
  `payment_method` enum('paystack','flutterwave','moniepoint','manual') NOT NULL,
  `transaction_reference` varchar(255) DEFAULT NULL,
  `amount` decimal(10,2) NOT NULL,
  `status` enum('pending','completed','failed') NOT NULL DEFAULT 'pending',
  `payment_proof` varchar(255) DEFAULT NULL COMMENT 'For manual payments',
  `admin_notes` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`id`, `user_id`, `subscription_id`, `payment_method`, `transaction_reference`, `amount`, `status`, `payment_proof`, `admin_notes`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'manual', 'LVS-0FFBC43C773B2DCF', 5000.00, 'completed', 'uploads/payments/6828162e486d9_moniepoint.png', NULL, '2025-05-17 04:52:42', '2025-05-17 11:51:34'),
(2, 1, 3, 'flutterwave', 'LVS-7073795F0CAB2AA4', 20000.00, 'pending', NULL, NULL, '2025-05-17 11:39:46', '2025-05-17 11:39:46'),
(3, 2, 3, 'flutterwave', 'LVS-E7E10239A7C0837C', 20000.00, 'pending', NULL, NULL, '2025-05-17 13:08:45', '2025-05-17 13:08:45'),
(4, 7, 1, 'flutterwave', 'LVS-00ABE31A4C2DEFF5', 5000.00, 'pending', NULL, NULL, '2025-05-22 00:16:19', '2025-05-22 00:16:19'),
(5, 7, 1, 'manual', 'LVS-AFF0ED88DB840438', 5000.00, 'pending', NULL, NULL, '2025-05-22 00:16:47', '2025-05-22 00:16:47'),
(6, 7, 1, 'manual', 'LVS-B627CEB1E9EA8519', 5000.00, 'completed', 'uploads/payments/682f292c20086_IMG_5835.png', NULL, '2025-05-22 13:38:21', '2025-05-22 13:45:10'),
(7, 10, 2, 'manual', 'LVS-324C423A833A7F4A', 10000.00, 'completed', 'uploads/payments/6831a0829cb70_JUNIORDICEGLOBALPAY Logo - Original - 5000x5000.png', NULL, '2025-05-24 10:33:20', '2025-05-24 10:34:59'),
(8, 11, 1, 'manual', 'LVS-F8B4D9B2CCF48C0C', 5000.00, 'pending', NULL, NULL, '2025-05-25 19:19:27', '2025-05-25 19:19:27'),
(9, 11, 1, 'manual', 'LVS-09AB0EE1275F5149', 5000.00, 'pending', NULL, NULL, '2025-05-25 19:19:28', '2025-05-25 19:19:28'),
(10, 11, 1, 'flutterwave', 'LVS-8D98E095DAB6D5F3', 5000.00, 'pending', NULL, NULL, '2025-05-25 19:19:42', '2025-05-25 19:19:42'),
(11, 11, 1, 'manual', 'LVS-3FC8FC4A747E54F0', 5000.00, 'pending', NULL, NULL, '2025-05-25 19:21:43', '2025-05-25 19:21:43'),
(12, 15, 2, 'manual', 'LVS-0DBAE876240464FC', 10000.00, 'completed', 'uploads/payments/683f2b9c91f92_WhatsApp Image 2025-06-03 at 10.05.22_2e0b8a0d.jpg', NULL, '2025-06-03 17:04:13', '2025-06-03 17:07:48'),
(13, 24, 1, 'flutterwave', 'LVS-B7C78FBCBBA2B1E7', 5000.00, 'pending', NULL, NULL, '2025-06-14 09:14:37', '2025-06-14 09:14:37');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(11) NOT NULL,
  `site_name` varchar(100) NOT NULL DEFAULT 'Live Support',
  `site_url` varchar(255) NOT NULL DEFAULT 'https://agileproject.site',
  `site_logo` varchar(255) DEFAULT NULL,
  `admin_email` varchar(100) NOT NULL,
  `smtp_host` varchar(100) DEFAULT NULL,
  `smtp_port` int(11) DEFAULT NULL,
  `smtp_user` varchar(100) DEFAULT NULL,
  `smtp_pass` varchar(255) DEFAULT NULL,
  `currency` varchar(10) NOT NULL DEFAULT 'NGN',
  `paystack_public_key` varchar(255) DEFAULT NULL,
  `paystack_secret_key` varchar(255) DEFAULT NULL,
  `flutterwave_public_key` varchar(255) DEFAULT NULL,
  `flutterwave_secret_key` varchar(255) DEFAULT NULL,
  `moniepoint_api_key` varchar(255) DEFAULT NULL,
  `moniepoint_merchant_id` varchar(255) DEFAULT NULL,
  `manual_payment_instructions` text DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `site_name`, `site_url`, `site_logo`, `admin_email`, `smtp_host`, `smtp_port`, `smtp_user`, `smtp_pass`, `currency`, `paystack_public_key`, `paystack_secret_key`, `flutterwave_public_key`, `flutterwave_secret_key`, `moniepoint_api_key`, `moniepoint_merchant_id`, `manual_payment_instructions`, `updated_at`) VALUES
(1, 'Agile Project', 'https://agileproject.site', 'assets/images/logo.png', 'admin@agileproject.site', 'smtp.hostinger.com', 466, 'support@agileproject.site', '4hAC/P^Cz', 'NGN', '', '', 'FLWPUBK-cb12522b267ee420e6b5b224626d62c8-X', 'FLWSECK-adce33bf20d539b4b9255ea83c0d1134-196dde56cc5vt-X', '', '', 'Please make payment to our bank account and upload proof of payment.\r\n\r\nBANK NAME: OPAY\r\n\r\nACCOUNT NAME: EBISINTEI DENNIS\r\n\r\nACCOUNT NUMBER: 8029074091', '2025-05-21 07:41:32');

-- --------------------------------------------------------

--
-- Table structure for table `subscriptions`
--

CREATE TABLE `subscriptions` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `duration` int(11) NOT NULL COMMENT 'in days',
  `message_limit` int(11) NOT NULL,
  `visitor_limit` int(11) NOT NULL DEFAULT 1000,
  `allow_file_upload` tinyint(1) NOT NULL DEFAULT 0,
  `features` text DEFAULT NULL,
  `status` enum('active','inactive') DEFAULT 'active',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `subscriptions`
--

INSERT INTO `subscriptions` (`id`, `name`, `price`, `duration`, `message_limit`, `visitor_limit`, `allow_file_upload`, `features`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Basic', 5000.00, 30, 1000, 1000, 0, 'Basic chat widget\nEmail notifications only\n1,000 monthly messages\n1,000 visitor limit\n24/7 chat availability\nNo file uploads', 'active', '2025-05-16 21:52:44', '2025-06-03 16:06:51'),
(2, 'Standard', 10000.00, 30, 5000, 5000, 1, 'Advanced chat widget\nEmail & SMS notifications\n5,000 monthly messages\n5,000 visitor limit\nVisitor tracking\nImage file uploads only\nChat history', 'active', '2025-05-16 21:52:44', '2025-06-03 16:06:51'),
(3, 'Premium', 20000.00, 30, 20000, 20000, 1, 'Premium chat widget\nPriority support\n20,000 monthly messages\n20,000 visitor limit\nAdvanced analytics\nMultiple agents support\nAPI access\nAll file types upload\nCustom branding', 'active', '2025-05-16 21:52:44', '2025-06-03 16:06:51');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `api_key` varchar(64) NOT NULL,
  `widget_id` varchar(32) NOT NULL,
  `fcm_token` varchar(255) DEFAULT NULL,
  `subscription_id` int(11) DEFAULT NULL,
  `subscription_status` enum('active','inactive','expired') DEFAULT 'inactive',
  `subscription_expiry` date DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `last_activity` timestamp NULL DEFAULT current_timestamp() COMMENT 'Tracks when user was last active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `api_key`, `widget_id`, `fcm_token`, `subscription_id`, `subscription_status`, `subscription_expiry`, `created_at`, `updated_at`, `last_activity`) VALUES
(1, 'admin', 'admin@agileproject.site', '$2y$10$.nr3NO3R/my.qNCdJRNsyuX/gJU.52m6zpZoWDcNyP6AKetrnAyIq', '07ebcedba03db045a20a4d8af24ab46dbf2819cfcf2e459e08bc2eef39029468', '450a6c5bead35a8c3648a923a33da5a5', NULL, 3, 'active', '2025-06-16', '2025-05-16 21:52:44', '2025-05-23 16:05:04', '2025-05-20 14:02:51'),
(2, 'Ebisintei Dennis', 'emailebisintei@gmail.com', '$2y$10$WAZkOD7ap0Fei9SZgfJ8I.nzVwfWjhTcuSdSgdLVOPw6dcCFBufiO', 'ffcf952f728be8caf9e03dee01b9e0e29438bc905f00a8a652caa7a3c5705feb', '1d12f103859a704a890683a311761a7e', NULL, NULL, 'active', NULL, '2025-05-17 12:50:13', '2025-05-18 13:48:06', '2025-05-20 14:02:51'),
(3, 'Victor', 'vailwallet126@gmail.com', '$2y$10$3tO6Bd9ThCK1.yf8KBGijuqryhK99B1UyNHCcBaDBGqZwIOUq5vta', 'eb35785ce1f70724a375381e32a7c11cb75d031687d9db6df87177de74537243', '22fb66ed96e13f73235a851dc213acf7', NULL, NULL, 'inactive', NULL, '2025-05-17 13:12:16', '2025-05-17 13:12:16', '2025-05-20 14:02:51'),
(4, 'Fidel A Loredo', 'taylorava794@gmail.com', '$2y$10$iD/7KdDV.TfSUEvE1NjTN.xPeKmfJoCApNxDCMx5ES/MpD.s1GwFS', '8ba44866dc23aeaac503e55a4338aa17fa09ef9fdd161cb35ae38d38f31ffdc5', 'e899bca97a62bad5a59141af89af96c6', NULL, NULL, 'inactive', NULL, '2025-05-19 06:58:49', '2025-05-19 06:58:49', '2025-05-20 14:02:51'),
(5, 'Sibai Prince Pereladou', 'pereladousibai@gmail.com', '$2y$10$Xa5T0iQh3Z5UXRWukeYxfel0VfyeDieXJ/0Km79bnAz69PWJjlHNy', 'bec4edaaa805d8ecf325fe00b2dddbb0d15d8865cbf27478fcf9e2ebcd26fbc1', '6135b2a602a3ac9bc25a01d6c3636a1c', NULL, NULL, 'inactive', NULL, '2025-05-21 05:08:03', '2025-05-21 05:08:03', '2025-05-21 05:08:03'),
(6, 'Amos Seiyefa', 'cleverseiyefa121@gmail.com', '$2y$10$/pFv/ijRONTazDPXhDc5f.LV4OcmcVA8dYd3W1yIUD3P.PdFNL5JG', '1c237d700d1fc09211532390975e85eb603f016e9897539bbc8701c38ca3e0eb', 'd46c4fb6a33f41269e9cae2cfad64378', NULL, NULL, 'inactive', NULL, '2025-05-21 07:32:31', '2025-05-21 07:32:31', '2025-05-21 07:32:31'),
(7, 'Skyreignsfinancial', 'support@skyreignsfinancial.com', '$2y$10$SU6mR9eBizzbZN.WQ0.CzuN4fc4gWTdgvs6L1xhmXKLf8rtDWhfs6', '5062e05672e346462e17e686f1bfeb352be8ebb997a41fd1ccb74c9945bdecd8', '0bf351b30ef39ce5e5ade1b92ccce937', NULL, 1, 'active', '2025-06-21', '2025-05-21 19:54:25', '2025-05-22 13:45:10', '2025-05-21 19:54:25'),
(8, 'Godswill  Osain', 'godswillosain035@gmail.com', '$2y$10$UzUv8/HPpoegyvoEsvpZReRk63ipbQss.VTOeMBD2OLOgZW/5M8Ay', 'ef411bb87cea3c6c4776fd89bdc4a3ab9a91490c96cab4be2eb214ccecdf26a8', 'f6bcb1837d34f22b39fb4b7b6fdc54d4', NULL, NULL, 'inactive', NULL, '2025-05-22 15:43:25', '2025-05-22 15:43:25', '2025-05-22 15:43:25'),
(9, 'Godswill Osain', 'godswillosain034@gmail.com', '$2y$10$8yhJ/a/qpszAQ6mekJLzU.ScFCIIcUn3ccfyIXVi79VCLT4GsQxKm', '9ec081ea6f23bab5aa2dcab1bba014f4b52e746b9a59dfe579554e29939849b9', '587dfffda5a16536736c02e1a8aa6abd', NULL, NULL, 'inactive', NULL, '2025-05-22 15:46:00', '2025-05-22 15:46:00', '2025-05-22 15:46:00'),
(10, 'aboy uk', 'wilsorsn@gmail.com', '$2y$10$DoGPLJCrzWMCiv3vUntgeumeEsm8nbjhOzJ4vgNsN8H7cXz9xYwki', '095db45aa54e93afbbbe6249b6e53ad6b9909ee872c0ee08c70af741791a2583', '42c78363c73d9247f7e4599d3e0d81f0', NULL, 2, 'active', '2025-06-23', '2025-05-24 10:29:00', '2025-05-24 10:34:59', '2025-05-24 10:29:00'),
(11, 'Ikoto Tari', 'ikototari180@gmail.com', '$2y$10$yEhEyf9Rar41AqxbnflmnOuIV9/ZMb4k.TPjkhyGoDNj53EAUPdai', '302b6848098c62215d6fc60b9f7551991287a7da4f9d76a12821b47ed3be3662', 'cfe7fb26df345366c586ab17b5714ad0', NULL, NULL, 'inactive', NULL, '2025-05-25 19:17:19', '2025-05-25 19:17:19', '2025-05-25 19:17:19'),
(12, 'fIgIbeKT', 'sandirichz41@gmail.com', '$2y$10$63UpbBmodrRU.BCLZYYUl.lNcioZYCs8DLM/frONES2VjxXf2FdRa', '9610816a6106c5146f04312404f0ddc4c2ced79a306d682a02af0713ed2fc154', 'a8d9bdedd130e6404aad9bd7a8116bba', NULL, NULL, 'inactive', NULL, '2025-05-30 01:19:54', '2025-05-30 01:19:54', '2025-05-30 01:19:54'),
(13, 'Progress', 'progressigelege@gmail.com', '$2y$10$wWuLJHuN15X310CPndvjgewRMwUajbxXNUm94/WE2fudy.HaVqkDC', 'df7b307cb89f7eac8722772a64b9852b8ae44b59fcc43a67c2272c58f387dbaf', 'cdc133648b81c3544350f04a91822874', NULL, NULL, 'inactive', NULL, '2025-05-30 21:08:40', '2025-05-30 21:08:40', '2025-05-30 21:08:40'),
(14, 'fTdvmzaWF', 'silvestrgev@gmail.com', '$2y$10$L7jQrzNk0yvqgq10DFeNX.fWKgjGdhO1/LUQVFmTvXtDiHk2Om/3W', '14e0cc9849b5187d166194835e973890a57db083e72077e08ed8fc995c5f423b', 'ec6d32e8b380a2581589e5f46c3e315b', NULL, NULL, 'inactive', NULL, '2025-06-03 15:21:18', '2025-06-03 15:21:18', '2025-06-03 15:21:18'),
(15, 'juniordiceglobalpay', 'support@juniordiceglobalpay.com', '$2y$10$nCoyVv6k2U/eLjVdGQyuiOpLyJ8R1ZdnZZZ0IDOp1Oe6bLgXnQ.ye', '56d509dc934d8332830f7eade3289e8c775f7a52896c7a648a98e1c2d231413e', '0325ace935e68145eaac81f3fb80baca', NULL, 2, 'active', '2025-07-03', '2025-06-03 17:03:46', '2025-06-03 17:07:48', '2025-06-03 17:03:46'),
(16, 'eixNzhxuGdQFFOT', 'marybrown407632@yahoo.com', '$2y$10$n/lq3djBYzTcOj3TZjxKu.DpHE0YZR8eO788ZQTaN6gGBbuLb5qXS', 'd280d5f577fbf2f4596e319df96db0c8c44efa645c1b9a4b0e9a41c8eced4065', 'e9921833e6923181ffd6343b22e486f2', NULL, NULL, 'inactive', NULL, '2025-06-04 05:05:51', '2025-06-04 05:05:51', '2025-06-04 05:05:51'),
(17, 'YKqglRVs', 'valcleme56@gmail.com', '$2y$10$cJPKjNDbF4ZnaJerfVAeeOqDUQrRFiLZ5FE2Ua97/mbGEzrw2hcmO', '293b52f2051e4a419182b3b0b322f31192783003bd9a6128e878c86814dd6664', '7c6fbafa081e9fc817a6a97810cadb48', NULL, NULL, 'inactive', NULL, '2025-06-04 09:41:31', '2025-06-04 09:41:31', '2025-06-04 09:41:31'),
(18, 'rrPRyGGf', 'ramossheila457902@yahoo.com', '$2y$10$WCz3zq4QBCsxW9j3h8y.fuqDL3oc7Oa.F2c/WlqbTVruU5teQMSKG', '6e0f175adc8c2e4212b9b83caf0a97f2626a3b007e57390e03d4331f96baf4a0', '90e42876fa90ba16931bfb0f3841d7d3', NULL, NULL, 'inactive', NULL, '2025-06-05 02:23:59', '2025-06-05 02:23:59', '2025-06-05 02:23:59'),
(19, 'NAYUYUTY282005NEWETREWT', 'ldwxipzq@wildbmail.com', '$2y$10$VgVPPJYmv5kmwozIYmdD8eKW8n61/OkRryuldApTdHaXJu7cJAfKW', '2d5dba05f02f9731936195acb1fda8b87c129f347358767453b3cb57770d5fb9', 'cadd2e2ddccd4189bb6e370bde58bb6b', NULL, NULL, 'inactive', NULL, '2025-06-08 13:50:57', '2025-06-08 13:50:57', '2025-06-08 13:50:57'),
(20, 'polxDVfG', 'silviyamayo@gmail.com', '$2y$10$3tXiaBv1.nnR5.8UOmj6auUfCfOaq010ArMmvqaLsKDuOacfYHcnu', '7aa0c29acf46c9b0255aa54c668376cf5dfda9ef3c1914d4870de896ef913d20', '78283817c52ff18c94a77d9f68b3953f', NULL, NULL, 'inactive', NULL, '2025-06-09 12:08:13', '2025-06-09 12:08:13', '2025-06-09 12:08:13'),
(21, 'zgnYNNXtuQGl', 'zavalinsf@gmail.com', '$2y$10$2B2P7bqI8oZKlrncTW29eOcOoHKkAN6fWUS8sh7VD17t8RwcwI6ge', '6d4f46aae220ecff711660e4d0be66eda7795437f79970befb1499e98a0d0a41', 'a4b580aa970c286dd506f528303cfb6e', NULL, NULL, 'inactive', NULL, '2025-06-09 16:29:33', '2025-06-09 16:29:33', '2025-06-09 16:29:33'),
(22, 'NAEWTRER282005NEWETREWT', 'pwmpvwfd@aurevoirmail.com', '$2y$10$CoYUE55u.o8oSWttkyddMeNHck0X86kN7nd0eHTYaPp/SBDA8yH5q', '118c25760d70870fa4429211675e379f66751f8fd47638b2beda2148f153cf10', '8a672e35e5871eeedb51edd96cc7709e', NULL, NULL, 'inactive', NULL, '2025-06-11 22:57:55', '2025-06-11 22:57:55', '2025-06-11 22:57:55'),
(23, 'NAERTERHTE105355NEYHRTGE', 'lmjpveer@aurevoirmail.com', '$2y$10$KplTshJ4cxDdyxJKs92gYufvBQ7tGDpIHJCKskdvMSqaTNpNT15Zm', 'b37cef9a0ef05d169adce2bd029c2fe517c2cfcb64dbf21369bbbbf8a3edc91b', 'e5eb286d66c31d4f373183d62136aaf1', NULL, NULL, 'inactive', NULL, '2025-06-12 14:19:44', '2025-06-12 14:19:44', '2025-06-12 14:19:44'),
(24, 'fidelityholding.net', 'support@fidelityholding.net', '$2y$10$mdvHE6Hir8JPRzs97Ag9eOkuMPb1l5xqwMz08.xNrNW/hSnUZL4SK', 'e05c4e9692ba45f735f46fd36d884825d4ca5dc22d1ba50cfef9ef8bc8786b39', '8eae7ed055c91b425025ce3646bd63fc', NULL, NULL, 'inactive', NULL, '2025-06-14 06:01:20', '2025-06-14 06:01:20', '2025-06-14 06:01:20'),
(25, 'qefsxTSmFifLq', 'asselainlf1@gmail.com', '$2y$10$s4X9bLIX2AGmHb0/Pm4IReLRnEMYPS0TSVGTcu6NksozRUYfRwy.W', '2dc92ecf8f3a23398659c634c7b34c97531c68062559abcb8e4a73a3792500ff', '1c4a4b45f21632bd919f12a8dc67a37d', NULL, NULL, 'inactive', NULL, '2025-06-16 14:12:57', '2025-06-16 14:12:57', '2025-06-16 14:12:57'),
(26, 'UqRpIluN', 'quinniolondal@gmail.com', '$2y$10$yOjJyYEZRgu4.rj3YOy8KeaAmCxamymDgK5OgQLpHa8bFosRsH2n2', 'eaada4cfe3fcf97238c7863cf791bdac72e35dec0c752275566a11bc19378434', '4d015c89f7d8b9438ea26d5c6a775745', NULL, NULL, 'inactive', NULL, '2025-06-21 08:37:26', '2025-06-21 08:37:26', '2025-06-21 08:37:26'),
(27, 'Clement Kalu Okereke', 'inspikalu@gmail.com', '$2y$10$m/uOyTmGneAqrMrrw5ps0..ytf6m0xrlZOjB08qmcTeAuXMWyxeWq', '9f911fa59e2a8e7e41866d2269376c7ef4669013fd1c5bd0601440c4566d2792', '7550525c9e96debc96506782c5b6a8b2', NULL, NULL, 'inactive', NULL, '2025-06-23 11:57:57', '2025-06-23 11:57:57', '2025-06-23 11:57:57'),
(28, 'kwfifQcWezKD', 'mcmahonmakisd@gmail.com', '$2y$10$U7QD.ABSTwJfm0cnXrIKpe/wJNomj.slCM1zcnNnBDd.AVNO.Cbhq', '44701ff81444785a21a1c2abbb530606124dc14b945e00c63e77847625cef293', '3a83347ba705f2929746178f46ed0bc3', NULL, NULL, 'inactive', NULL, '2025-06-26 18:57:19', '2025-06-26 18:57:19', '2025-06-26 18:57:19'),
(29, 'NAYUYUTY888752NEHTYHYHTR', 'szqvascg@bientotmail.com', '$2y$10$i0tobOQbSQlUGH9uG2zRq.JG..3M7CRM2Kl8WzPIsd.aH3YC5HeKq', 'c79b300b0815baad8cf457fbb9095d8df48cb5aea9b2c6d09e443bc22792a094', '2e88e6de472c8d665fbc3abffc0db8ac', NULL, NULL, 'inactive', NULL, '2025-06-29 01:05:50', '2025-06-29 01:05:50', '2025-06-29 01:05:50'),
(30, 'NATREGTEGH693366NEYRTHYT', 'hisgtxif@bonjourfmail.com', '$2y$10$5A9kbG621HQwA1IAVWUh6uWkmRBR9Xz0NKEDHbfbVKNrFv8qkhHHO', 'b1407b3520c11ebee5104bc3f26ff97dffb5332b6250be507677785c019d971e', 'fd3801b557d5a8ca609c4b466749fbf0', NULL, NULL, 'inactive', NULL, '2025-06-29 05:21:47', '2025-06-29 05:21:47', '2025-06-29 05:21:47'),
(31, 'eeluDVSUJQ', 'filissinghh@gmail.com', '$2y$10$kOlq9ZZJQsM2w8iLpm70KusCIA8Rf1GUb09dy7PZRsjZoLb1npOXy', '406d6ed8f8217d7e4d4f11fbccf661e5bf41c8b1695ac3f54accfeebbed9af6b', '3085a4173f9b53666dd050d332c489ad', NULL, NULL, 'inactive', NULL, '2025-06-30 04:28:12', '2025-06-30 04:28:12', '2025-06-30 04:28:12'),
(32, 'AjozesvFch', 'uyidalefos705@gmail.com', '$2y$10$2QPvchdxPJf5tn5G5OtBNehp3vaYtnmufqU5EIeo5s/lzkiXUrkJi', '5465516d1883ade278a33fca58e28a9ebf4ae3ced575d24692e4e3a969af649e', '13eeb6fd9dad7a6efe567468671c2085', NULL, NULL, 'inactive', NULL, '2025-07-04 17:31:18', '2025-07-04 17:31:18', '2025-07-04 17:31:18'),
(33, 'brXlKZLTu', 'vehaden842@gmail.com', '$2y$10$/EMqw8J3yEuIfSVBF8a2LO0wiLaz0GIC8aGvCI1WpCxrn.5EZt04i', '9512df0e27ca4cf040ee29211e91d4a67e27292a96aed4572f6f11fe21fba11f', '84141c52d356229aa19b39ae485bb008', NULL, NULL, 'inactive', NULL, '2025-07-04 18:02:14', '2025-07-04 18:02:14', '2025-07-04 18:02:14'),
(34, 'zJDCZvCcFGz', 'novevazeju460@gmail.com', '$2y$10$oc9OPNb1L3mjzWxnI.8r/.gr7.S7Chzqz3Wl8luO4lCdVb/F3cSkK', 'd27af73ebee3c4e5d05698dfcf7ff2cc45986d0c6dc6dd6a4901b7a12727dc79', '494c004d94fb25406c6268561a2e16bf', NULL, NULL, 'inactive', NULL, '2025-07-05 07:23:21', '2025-07-05 07:23:21', '2025-07-05 07:23:21'),
(35, 'EpzlWxAgKfRVX', 'fopeloj446@gmail.com', '$2y$10$wJnvC1EcesB7R1IYkXJcau2cXJrYMZXjDyQrNDQ4RzBBLAWFFwriC', '000d2f8091e73aaee6142e204a00a7746e036d327cce759f8195d3dadab42c2b', 'c8818e7709bbe9738e0cb18efe7c6d3b', NULL, NULL, 'inactive', NULL, '2025-07-05 11:16:15', '2025-07-05 11:16:15', '2025-07-05 11:16:15'),
(36, 'wQWOMtXqCS', 'unucokonav14@gmail.com', '$2y$10$7XVDA6hYtKOfrQS8jhHhfuRBqXC3ehFFW92KOAAlhTPngdZGO7sKm', '1ee4f6ceb01c8ef71882f2e98db93d2edd6369e507922239ea4d7812235dfcd6', '8799b55a5a5eddfe463ad147dc30eb3d', NULL, NULL, 'inactive', NULL, '2025-07-05 14:27:25', '2025-07-05 14:27:25', '2025-07-05 14:27:25'),
(37, 'XzgfephGAWM', 'pekapivax60@gmail.com', '$2y$10$uvprrZkih9ko5Jvhy3hQRu0BFfAYQa6HOeoabQm/tQAX..49W.xMq', '918c9e16214d40944fd38e9f736b872bb96b73218b9e5b7c131d1d1869c95b77', '45077a0fe0297ca606bcd009aa17db1e', NULL, NULL, 'inactive', NULL, '2025-07-06 04:58:42', '2025-07-06 04:58:42', '2025-07-06 04:58:42'),
(38, 'wgptpZMcXPWkcg', 'farrebekn1981@gmail.com', '$2y$10$H6xpl7aQTw.WGgiy/9x.ZO./PW2bXMzL3GHEMRHlWq1BCJDsfdmCW', '8c72c7c533e7d9bf6557a1ec2d746caa0b856e1e3daeacf513db500d364477c3', '8e4246820a6c16a4b12bb98c933a957e', NULL, NULL, 'inactive', NULL, '2025-07-06 05:24:08', '2025-07-06 05:24:08', '2025-07-06 05:24:08'),
(39, 'gXRwTvDfzHZFky', 'byrdmelor91@gmail.com', '$2y$10$011bBhbdB72ZX7gB3hup7OVAw5bMstvtMN4j5OHtvsBYjQUsB8IyS', 'f2f266d42ebc7444075e4f35ec03338dc78b86557658485561a7b1eb2e2cb48c', 'afb454e31282cd6a6f44a5b153fd797e', NULL, NULL, 'inactive', NULL, '2025-07-06 12:04:56', '2025-07-06 12:04:56', '2025-07-06 12:04:56'),
(40, 'qDylGnzNBITcTaa', 'aselbiok4@gmail.com', '$2y$10$jRRqW3lcWOtemlxkOOJGUuOJxu6X857uohvIFas8CLFrbOgfxaGS.', '2157516f8e0eff98a93d34f3d1cb2ec11f777a2999f744d9c8b094b49f42bd05', 'bbdaaab09295e7fc7fcbeb283a83d33a', NULL, NULL, 'inactive', NULL, '2025-07-06 17:33:02', '2025-07-06 17:33:02', '2025-07-06 17:33:02'),
(41, 'OKKRbIyAki', 'tracy.alexander1994@yahoo.com', '$2y$10$CZIVfI2VML4Hj5/lecpIIOq17J4fVEhaZzw/U6nagCwIFfvI2i/xe', '73c3df87863685a8e2ace2cc97651454b5750439cacb13950f2e0ee830ae6eb8', 'ff6a6a599faafeb9de6c05e9222a3e53', NULL, NULL, 'inactive', NULL, '2025-07-07 01:42:18', '2025-07-07 01:42:18', '2025-07-07 01:42:18'),
(42, 'LiOlNnwlCZXqr', 'christinejackson5131@yahoo.com', '$2y$10$w7DWtdVAAKQt5AiH.5d4g.ol492tmGzybbcOkcxJRUP5SPprcnDgq', '8e4157f375c19fda4e09cf644aea8aa4930c207b4910c843436d558634c8e021', 'fedcc9775b4acae4f116e2c41c5bc052', NULL, NULL, 'inactive', NULL, '2025-07-08 14:21:57', '2025-07-08 14:21:57', '2025-07-08 14:21:57'),
(43, 'xjVTircfcENPeuR', 'watkinslanni2@gmail.com', '$2y$10$Vp5LD4Pq1tZbY3wYCmjqluujviZ1gw5AtWSx9vLTGqL0Qu/XutdY6', 'c8bb2f04b88ff52660ad91012cb26826540727e5e65495d4da8b16b18811ec86', '3f5814670740b022d35164cea5627e62', NULL, NULL, 'inactive', NULL, '2025-07-08 20:01:19', '2025-07-08 20:01:19', '2025-07-08 20:01:19'),
(44, 'MUEaUlUSyTcoX', 'akeikirkvj@gmail.com', '$2y$10$v51L8DH60jhzL1ArnQNrwOzIl/06En1hACwfb2UI1Ok/rj6DVn6fK', '80d806018097df6f56db189ec3c554957172322806a073e4840e8da927a3028c', 'f41a81611aa03411cb3808bdc0f12eb5', NULL, NULL, 'inactive', NULL, '2025-07-09 15:15:04', '2025-07-09 15:15:04', '2025-07-09 15:15:04'),
(45, 'AflYrqylCFD', 'qazenucixos204@gmail.com', '$2y$10$p0TcaJppOaH1n5xw9.UQu.QXF7xJ0I2ytlbHIHs0zAnvob1PUe1QW', '6fcfe267708e310abbee8eb83e5c1d66e4025666d4bba80e01b930efe80126ce', '8e331d973bdf6eaa9339820ad5980593', NULL, NULL, 'inactive', NULL, '2025-07-09 18:57:48', '2025-07-09 18:57:48', '2025-07-09 18:57:48'),
(46, 'hXUejClJucmvWS', 'curulinos38@gmail.com', '$2y$10$.7wcF3gKXDpN0lptW9GWf.KsujI4cyGiBhWt9VNnV9xEYN.MlSLw6', 'c354cea66c32f3a973edf1ad3bffbb12149320743231a714943b5ce58a9bf06d', '7cfa4f11baa712d1feffb156b559e220', NULL, NULL, 'inactive', NULL, '2025-07-10 00:35:05', '2025-07-10 00:35:05', '2025-07-10 00:35:05'),
(47, 'IJrbsrCTLetW', 'jessicalouis6952@yahoo.com', '$2y$10$zETW/DVKWLG4jXbPiRaYw.xm.PgsTyoQyq3RE.IzMWWgtF2BGK7k6', 'aebb2f4c97154056e6abd9ac3a855d78e17840b3a7e65856e2e3c1990ffa25e8', '6a95df3f7a55818df3794966a79fead2', NULL, NULL, 'inactive', NULL, '2025-07-10 03:24:04', '2025-07-10 03:24:04', '2025-07-10 03:24:04'),
(48, 'dkGCInFSYN', 'arudidapona400@gmail.com', '$2y$10$TtdeQ8lMnzZdoAzIiXPNZOlk56eJg.yk1lrwRYDB3meDz9LS/4KUm', '1127a03053f5d985c2cb384f9fa6db50e93bf9560e006b9073fd6f340042e1d0', '268367f9c3be07671a48a821269d103b', NULL, NULL, 'inactive', NULL, '2025-07-10 17:04:38', '2025-07-10 17:04:38', '2025-07-10 17:04:38'),
(49, 'pUyiRpwuIvALda', 'clay.ebony1361@yahoo.com', '$2y$10$EvAnT9gEwogyYzJCEbosYes3XJnocrUu3Nd4LUPDkVBfAHJRIjQXi', '6fef4bb6474b3538026a27c1533274ca8b930c1eea88cf9c2f75dce3d5e3eecd', 'd4a5987d1edf3d01cf2d677b0ff7e5b6', NULL, NULL, 'inactive', NULL, '2025-07-11 07:07:51', '2025-07-11 07:07:51', '2025-07-11 07:07:51'),
(50, 'mxxSfZHhB', 'melissa_gutierrez1986@yahoo.com', '$2y$10$wSmU9AT4Ys0nqyqfAWlekuITbeq3Iio9p8PHj4kLZs0GUDFJAiECC', 'a34d0f268aa0267f41b5e7fc86ab15dc4831033d93a34bce8f23471f5acdc4a3', '072d84b8f22af302182c6c297d1661ac', NULL, NULL, 'inactive', NULL, '2025-07-11 08:16:42', '2025-07-11 08:16:42', '2025-07-11 08:16:42'),
(51, 'wZfYiJkMyvt', 'kotaquwo106@gmail.com', '$2y$10$z7/EGVjZyoCRyO657/oeA.M32q2bJmBn33a0Ar9AX6fzeDLavGH0y', '5a82e2cacee6239deda231e6d788827535451e195f0ce55e997c3dad68a2f603', 'b3f7be44652aabffaa6af7a47ce65b74', NULL, NULL, 'inactive', NULL, '2025-07-11 17:25:41', '2025-07-11 17:25:41', '2025-07-11 17:25:41'),
(52, 'qZguNQXNtaORc', 'joycmaksz@gmail.com', '$2y$10$Q2OaQ1voKYgmF5Xl22dzgOnYlzxp1tkhj2rv8D66QWGkj50WRcpO2', '78dc010d23d7f2b0b30d4676466f65f73f9bb8d9e6e6320ab314e4c6ac848a36', 'ff8a3b3b1cef69a00455be103dba08e7', NULL, NULL, 'inactive', NULL, '2025-07-12 04:37:03', '2025-07-12 04:37:03', '2025-07-12 04:37:03'),
(53, 'FbvDZePCo', 'mertonavilaz27@gmail.com', '$2y$10$xXL6HcYTK/BhM1x5K5TMX.MJ0f5waRhoBSvPYSmwvjpBM6nmFONZm', '73a5f4d5addbfdf140d68222eca277cf825b7757b57b7ba541941ae8ef6f93a6', 'c24f3e965cc2e90824ee51d5d9689c8e', NULL, NULL, 'inactive', NULL, '2025-07-12 22:05:51', '2025-07-12 22:05:51', '2025-07-12 22:05:51'),
(54, 'ovZTpQplL', 'dunnpirszb@gmail.com', '$2y$10$TvdSJkXR4nSgjr/02WXZ4.m8X3MAxrBz3/cP1I92WXsn8ecM2YIaK', 'fefa8f4a40ac9091a168322500af0b0c88fac8e232152f162f486d90cd42843c', '56a4ce5f001bf9e6978495d65f0ce0ea', NULL, NULL, 'inactive', NULL, '2025-07-13 11:03:32', '2025-07-13 11:03:32', '2025-07-13 11:03:32'),
(55, 'FZGlgzLBmQPJ', 'zhardinv30@gmail.com', '$2y$10$wa5SITYuTMd8lCyh67P10uRjBqc1VrrceK7MnrHx63FhGP8ZGy8m2', '2a12fb1b45901914e5caa4784516fa11e81c6c3f5f4e3f9459660c63d80534cd', '92eb30f5326af6bcdc00ae4a6422b893', NULL, NULL, 'inactive', NULL, '2025-07-13 11:53:44', '2025-07-13 11:53:44', '2025-07-13 11:53:44'),
(56, 'qSPMnhoiaBBFfv', 'zekhuertahs34@gmail.com', '$2y$10$u6CmyVhLTEcJH3M9Zp58keO8oCwvnm/l8X/hWoYpnV7Fs5j5fZqeu', 'eab15589bac47cc0e53b2ca35429c7b8b3fd619f2249c0af7bd98d7c8d198c8b', 'bcab4ae113f91f2d3f7c9bd2fb003b8f', NULL, NULL, 'inactive', NULL, '2025-07-14 09:08:03', '2025-07-14 09:08:03', '2025-07-14 09:08:03'),
(57, 'pDwGtmiGcKUP', 'allencarter549791@yahoo.com', '$2y$10$DvVjWV7NQ8NrkIc68aKnFeGDH40ayfJo0uL0jnz70OiYW3sk9hlGq', '818022f1650596332a3681e2d5231359f956ecad6413a25e67cf8b2033afe38c', '6f10623e9e7ffecc86dc5a7dfc1ef336', NULL, NULL, 'inactive', NULL, '2025-07-14 13:06:50', '2025-07-14 13:06:50', '2025-07-14 13:06:50'),
(58, 'gilCpVAHDQsDPfg', 'april_grant4298@yahoo.com', '$2y$10$TYPHWnq09m40r1Xc/kxZc.EGrDwRbPHi6smCIEGwRvWU9WY6lKvWW', '19a91973768a0e4e33a13225e95f911967588ff38cd33b89acab616c57cf7961', 'c5ab702c9e7a2c51daf30947e50f4841', NULL, NULL, 'inactive', NULL, '2025-07-15 01:31:25', '2025-07-15 01:31:25', '2025-07-15 01:31:25'),
(59, 'GfWZHXKGtSRiv', 'fonzhaasyz@gmail.com', '$2y$10$HH57ELClEl/UQplYsg4fN.j9cqkJqRB18PmDUZMbi23d1LnWvMebS', '53cc8301ef884868f1727684f2c1fd8a2137d91f7c498b98b281db51fd13b91c', '19233d12f7da783591b9961c3f19e72a', NULL, NULL, 'inactive', NULL, '2025-07-15 04:29:21', '2025-07-15 04:29:21', '2025-07-15 04:29:21'),
(60, 'uTbIxetp', 'stoneleila1993@gmail.com', '$2y$10$hbeS1nzGhQd/WnS9XBH3pOAj8CzNSazoWqKUpP.1oWA/9gCxCd0l2', '91b925043d6ad49ad8fd4d31ddb14d0a51c339de8f7b0a93c279d61df3a24b59', '1bfa652092bc89a6fceab3cf41d8ba4b', NULL, NULL, 'inactive', NULL, '2025-07-15 05:12:18', '2025-07-15 05:12:18', '2025-07-15 05:12:18'),
(61, 'mnudCfastRh', 'nwarrenu2003@gmail.com', '$2y$10$1foB0t2hr3O1bOyQdosrUOJRf5NjS6/xMnWXL5IueC.eIpQMImDk6', 'e5bbb997ae7ea1f1d07778617690a60639a90219f497bdcc420c2b4f32aa25bf', '94e176b8f61fbefa33c577f0bddf0f6d', NULL, NULL, 'inactive', NULL, '2025-07-15 13:29:57', '2025-07-15 13:29:57', '2025-07-15 13:29:57'),
(62, 'AvuusXJZxjRoy', 'melissaray27133@yahoo.com', '$2y$10$wNLSylsskGUJyUJFRRk6JOvX1eB0LDiKCmmlF5w4K80nNQhzFPI5C', 'df59fc669cfd5d23121ced6b56f060c27908cebb2066b80ba6eb37ac99011c57', '0b627a5bb899c83c3195e3c7d0d1cad5', NULL, NULL, 'inactive', NULL, '2025-07-16 06:15:12', '2025-07-16 06:15:12', '2025-07-16 06:15:12'),
(63, 'OiRJDhVOTIqqEBo', 'oprakingm17@gmail.com', '$2y$10$dUp2mYTEDIwbF7rNcH78M.Edp.c8eRV6UdPZFqZ6uGO5Vl9Z4DaEi', 'a6e42431b8b6accc8cdc26d6f18f63da0eb23d1995033cbea05fd878913bd1bc', '7a3c3201112e93aa37bbe798bfce9edb', NULL, NULL, 'inactive', NULL, '2025-07-16 16:42:12', '2025-07-16 16:42:12', '2025-07-16 16:42:12'),
(64, 'Mfuehudwj hiwjswdwidjwidji jdiwjswihdfeufhiwj ijdiwjwihdiwkdoq jiwjdwidjwifjei jwdodkwofjiehiehgiejd', 'nomin.momin+171m5@mail.ru', '$2y$10$lUFZK6KAFiObY8FV8UK6qevxQWcqV8ryR3jrXA/Zx.UtGvet.l1lC', 'e13b9e0fd6515d4b85e26e2432f394f217af59ea2008479bbbb483ef3ef5200b', '36260873030b5fc8b66f5b7de0a2a34c', NULL, NULL, 'inactive', NULL, '2025-07-17 09:14:30', '2025-07-17 09:14:30', '2025-07-17 09:14:30'),
(65, 'lZkdAmwZpcyvRh', 'royselena620247@yahoo.com', '$2y$10$VeROi33xPo7UtS2KqfBSR.jprTILfRlGjpj/I6CXcZjAaRYqkgHA2', 'd2ab6a8c305c013948f31d2a75f39949267e3a4c2d113edd85dd603e56d750dd', '1e35ffb50c68f022f7f6f8ec7a2b3ca2', NULL, NULL, 'inactive', NULL, '2025-07-20 05:47:32', '2025-07-20 05:47:32', '2025-07-20 05:47:32'),
(66, 'IkdkdREZ', 'tyradavis2002@yahoo.com', '$2y$10$1XKPhHsfQsaLHLHXwFvEp.TJ8re9SpuJJW5wgYN0SYmk183wbWH3S', 'bebec7501a0d02104bad5e825b1b44bd12e66a6f9293a47d48c1fdbc07bf6197', '596e252d9b28bba054ada6ac5720908e', NULL, NULL, 'inactive', NULL, '2025-07-20 07:19:22', '2025-07-20 07:19:22', '2025-07-20 07:19:22'),
(67, 'UarLMEDQBfqaKni', 'tuteyewav42@gmail.com', '$2y$10$caUfWcLSRWx2twA8nCdniupo.A.e.wprMiIKVXyAVUzRNf11rYNk6', '003f2e0bf46cb67b3c0cf80f8db4df70c8e72adb93ac63a46b09220aa3b4378d', '098439ae13bf98687b7dbed1c1166a3c', NULL, NULL, 'inactive', NULL, '2025-07-20 09:09:30', '2025-07-20 09:09:30', '2025-07-20 09:09:30'),
(68, 'qiqCodfQDBkTGVx', 'jtreisi53@gmail.com', '$2y$10$c0VlwbE4TAwU71qHD4y0sOaBFYDYyJLVl91alSPp5xt85ZhMh774K', '8534d55a7bc933286baca4380cb08d8a1ec71802e7db97547f76edeb671f2eb8', '6d8f51a408d419ec3060c5d65b51447d', NULL, NULL, 'inactive', NULL, '2025-07-20 22:46:33', '2025-07-20 22:46:33', '2025-07-20 22:46:33'),
(69, 'zCAPUguBUumP', 'summersmontgomerieg@gmail.com', '$2y$10$bvE./piHklJSKm46eWym.etZ01S8rzcMpfv2vZggYR1XOdo4VWoPa', '110504bdbd658c1f200a5c3bb6c83c85d5a718db55b9979182459e4976b7a777', '7e1d9888ae1173b1b3608235575a73cd', NULL, NULL, 'inactive', NULL, '2025-07-20 23:12:38', '2025-07-20 23:12:38', '2025-07-20 23:12:38'),
(70, 'ucsuYVaszeBHpZE', 'kgarciaw9@gmail.com', '$2y$10$4sqk4VqVRm/ipM4mHp6BY.ikDt8yuxUfY43xsp.nAK1b5uJKfh506', '97123c8144a9dd5561fb8b1b73c437549e9a264ab963f7f9dcc9f9f948bcb09a', '8e8c95d9dcaed6e9f4b8896c9eab8927', NULL, NULL, 'inactive', NULL, '2025-07-21 13:40:53', '2025-07-21 13:40:53', '2025-07-21 13:40:53'),
(71, 'ysoxnlKSCt', 'lukssnowa39@gmail.com', '$2y$10$zLhibI6vJlHNoApHRnzUyeLAg1.ly7adjIcU5u5KdAhr310GE9qnK', '896705da208f6673e2474dafdf5089624bdc2a15f24577ef8ae9b6492c143892', '59e5caa174b0cc36f6e88f1cd4e0c7be', NULL, NULL, 'inactive', NULL, '2025-07-22 05:30:01', '2025-07-22 05:30:01', '2025-07-22 05:30:01'),
(72, 'dAkEjkmmy', 'kolinrichmondln@gmail.com', '$2y$10$W8tKXlJcrFMdBtAEvKzdO.QCc6alvEvrf.pRas9d2Bv1UqNhDUmPi', '433290e89adb0241b79694a5ffbf727dd91a4c445a0facc5c8d7bd2e7027803f', '5e18cf9537e02de8a66f1a3bb404ace3', NULL, NULL, 'inactive', NULL, '2025-07-22 11:08:29', '2025-07-22 11:08:29', '2025-07-22 11:08:29'),
(73, 'HPWcQQFLDYvYU', 'kingmegan158790@yahoo.com', '$2y$10$k8q6cibPgMvQKu.iZCRYtuzcfJzh6Pt7bEhKHRXUd9Fo7Bm3AS552', '7d44a77dfde476c2c5b8ee24642a6b8ee1dd2b51f2f3ebf96b6b09c3045c7b94', '1926ca50e4fe648f7b8272057212c689', NULL, NULL, 'inactive', NULL, '2025-07-23 03:50:20', '2025-07-23 03:50:20', '2025-07-23 03:50:20'),
(74, 'pwALwnkSD', 'deziyibu77@gmail.com', '$2y$10$gOy8KR7TTRKJm0FZjQ7/yef6rYz4q5uVE1gR8UA2i41BY/r68sQbW', '1d861e3062d828f410d0f0d8b99888618d5b6290b9bcdc5101d5160ef409e394', 'ea0f66ad736110110d86e0a023df091a', NULL, NULL, 'inactive', NULL, '2025-07-23 05:25:24', '2025-07-23 05:25:24', '2025-07-23 05:25:24'),
(75, 'KFBQbBtEpWLVU', 'kimaggaim2001@gmail.com', '$2y$10$jFIdGdOxeBGOIVWkuDX6UeJ09y0FIc3E/38vIh0KF93SFQtnTB7mi', '6270d21a50aa265f4af356f4c2a882bc11806cfded2cbf0deb260c507fbaa642', '22a6979bc301e0d2c369c92be59eb19e', NULL, NULL, 'inactive', NULL, '2025-07-23 09:52:48', '2025-07-23 09:52:48', '2025-07-23 09:52:48'),
(76, 'wNSTNgPS', 'hduffyba2005@gmail.com', '$2y$10$ZJ2JeqmabBi/sF4uhdRL1.bzg61w55sEvdCxqsbdT4eX2Ss4GQAWi', '033826a51405a86e5028830e11d2a3b6446cf43e6d37c0153e08ac2532c4bf12', '24bc75a6bd8058b3b988bf8c723d2d94', NULL, NULL, 'inactive', NULL, '2025-07-23 17:20:55', '2025-07-23 17:20:55', '2025-07-23 17:20:55'),
(77, 'DHnYvIIUFugyHkg', 'kgalvansm1994@gmail.com', '$2y$10$FikZPhVGeD23aoG3ckGzMeMoliJfYCUZV0XGmTvG80Q3HA/s7xy5.', '6beb63d298a44d48dbde980b554a6754f55e478a33fafb30ed6592bd1ad2c8ca', '300fa1608852852af88a2a97693abfa8', NULL, NULL, 'inactive', NULL, '2025-07-23 21:47:16', '2025-07-23 21:47:16', '2025-07-23 21:47:16'),
(78, 'GxDLLiTKSLJE', 'whittlematthew631440@yahoo.com', '$2y$10$UcrpwSF1KOgRYzMYQkKdHuE5kqd039EQJLCUlBEU8yi.W8WObNuPW', 'af26232f681a995a2b783d36d93e7691728c8252409a36e15c3453dcf16b07fb', 'd5052e953a442ac9e3f37e9b3ffe5f76', NULL, NULL, 'inactive', NULL, '2025-07-25 01:22:15', '2025-07-25 01:22:15', '2025-07-25 01:22:15'),
(79, 'KSnAUXrxHyp', 'axojisar16@gmail.com', '$2y$10$0AxPJcu0L0FrcwlTFUH3PO7kY0Y3GGv3iqcxLItQp.HDZ.DzBRHXu', 'cc9cc0192bf6243865d3594ecea00bf5d93db8c71cf6e4b32e99db057500b5f5', 'c67d8354e4bc10caca59f61305c7aa55', NULL, NULL, 'inactive', NULL, '2025-07-25 23:37:09', '2025-07-25 23:37:09', '2025-07-25 23:37:09'),
(80, 'IuyllvkEbMhJL', 'youngdaniel777023@yahoo.com', '$2y$10$Bj93EQg1NI1l3eSk8grU4O/qeFCqnCFAoFBFXg7OoHysNqtDHYJR6', 'f43f1c4fbefef8d657d8da59c295c8d4a09bb618dfd8281d042e0db9f45573f3', 'cba759cf7f83a166be62af91c60a6a7d', NULL, NULL, 'inactive', NULL, '2025-07-26 07:07:02', '2025-07-26 07:07:02', '2025-07-26 07:07:02'),
(81, 'RniRuEEbEE', 'adinozas28@gmail.com', '$2y$10$aHniBVmVm9ZyHj.T4eNa2.TkjR7Gk7TGa0MVT3sUreAxs95pyiBqq', '41d55804561d55bdd21656e811f539a5a9144ac6e6d983bf103d453302678754', '12e4ece60e5026fe9101d295c0aa7f5a', NULL, NULL, 'inactive', NULL, '2025-07-26 16:54:20', '2025-07-26 16:54:20', '2025-07-26 16:54:20'),
(82, 'cqxRysDWezhXjf', 'aneniqeqo040@gmail.com', '$2y$10$Hel62MPveJdZcaM97tDFBuLQsDjCtHIfwrfwuur5eDkjEU8t6qJYa', '9e479fefc84889ed8ca5f87681822ca2575d885f4a511240f49e9f7ef66624f6', '38948efcdb6d3bb6aad6bfab437103ca', NULL, NULL, 'inactive', NULL, '2025-07-26 21:39:27', '2025-07-26 21:39:27', '2025-07-26 21:39:27'),
(83, 'kiavFUWH', 'moxapowati025@gmail.com', '$2y$10$OmybXgRiNr4Zqhpz68gVuuxZWVsu9BppXyc8CO3ft3kp03Uu9HXLW', '3c5f5fc4e2ccae8fdc2389f005925231aef2273f29625261fba3f397f87095e6', 'b619a16a129cc238769e7a8d0f07fd9f', NULL, NULL, 'inactive', NULL, '2025-07-27 00:19:34', '2025-07-27 00:19:34', '2025-07-27 00:19:34'),
(84, 'OCRBpjnsQiUAw', 'ashleygarvin432205@yahoo.com', '$2y$10$ZOHz5pCN2mv/WMphO134iO2PsBrgDjzY/WGrxb0SUypwd.jgGnSlW', '0e05a72d6408883798aa1ed62a0be42d8153ae0de6aafb561418c7fb645ec8f9', 'c8967b3c20c2415dd8d2ed1a5aeb6a3d', NULL, NULL, 'inactive', NULL, '2025-07-27 03:01:54', '2025-07-27 03:01:54', '2025-07-27 03:01:54'),
(85, 'FMFDoiIzipBDyAB', 'sotoorianie@gmail.com', '$2y$10$Nt4TT/0HhUPxTVTN8KQDsOnuZISu7XJC0seUJ60t1CpQex/dtDhRK', '974c97c08970740bdfeeb38cb1ca69a9108a1a78f95e036bf17e2deea9780c8a', '9789fc7d9e06e546f845105a8dbef588', NULL, NULL, 'inactive', NULL, '2025-07-27 11:12:46', '2025-07-27 11:12:46', '2025-07-27 11:12:46'),
(86, 'QingoqVLaqF', 'matagabriellao41@gmail.com', '$2y$10$7Ybn9rycBS9QOPl4t4vuRexCufEYVQg8mVYxrob7xssK7oL/ZbBoy', '78320f088cd7e014fe34015621aa57027df5501c0c550e4e1638ad5453674738', '2ea0cd36afef257680405bec05d940e5', NULL, NULL, 'inactive', NULL, '2025-07-27 23:19:09', '2025-07-27 23:19:09', '2025-07-27 23:19:09'),
(87, 'oKggdavdtAhT', 'rrothnf99@gmail.com', '$2y$10$EN6BHdQD2u.Qv3ZvhaH9HOHL5MsbkMIHSyzI.bWB9LjURmAAQEHkq', 'c12c4af1cf1e531b7759a90c91d9306ecaa87c5b4d484657ea240df9d9cb8203', 'f1a59b964f5ad24914ebddb66ff8362a', NULL, NULL, 'inactive', NULL, '2025-07-28 09:57:24', '2025-07-28 09:57:24', '2025-07-28 09:57:24'),
(88, 'AjeNhkCcInyemb', 'adusexifaj86@gmail.com', '$2y$10$P/tGt7IE.GjEIXTGN6msWOMyNxWLS1dD9upm5gcNDzvK7DwldI8wS', 'd3ab3118d31f6e2f599ecb4e5cbe78e884ec43dbbcc8abeacef98b333153e9e8', 'a9c788df28ab014b9db16752d2931be1', NULL, NULL, 'inactive', NULL, '2025-07-28 13:01:08', '2025-07-28 13:01:08', '2025-07-28 13:01:08'),
(89, 'zWQzfVbzjqgrbJ', 'jennifersabo931685@yahoo.com', '$2y$10$/Pj2ChJid1kG5ftJebDCs.dPFXgPaslsVgAQ7PHoCBY/5C5C.hJQ6', '5f29688c2426086fc9ebb8793837079c425e07645deb700276f4fe4805c51439', '12f2ecf6535dfca09045971af1569e52', NULL, NULL, 'inactive', NULL, '2025-07-28 15:36:48', '2025-07-28 15:36:48', '2025-07-28 15:36:48'),
(90, 'BxYLcfKRXifrM', 'dkarlisa64@gmail.com', '$2y$10$ppRBBtCT6BKrqt2qjXW32ebm7Z91jenLfsi/gOdQaPbLHpC.d3Xpy', 'ceffc7fd4cf2ad55a2f0985740e9183f58577bad212cf8810fec48da762064cb', '67dbbf54c09f406248b706403c794f27', NULL, NULL, 'inactive', NULL, '2025-07-28 17:11:07', '2025-07-28 17:11:07', '2025-07-28 17:11:07'),
(91, 'adpDUABuaUDq', 'diyuqeho156@gmail.com', '$2y$10$lfWOnGBibfiLwOgOLi0xb.qiP/elaRUt.93MqY8pbnEkgBk2s3B02', 'f9c2b4150fd69a2019274f894d708995085eefdfcc4409ea1910648ba5032384', 'adff30d056b9cd6051a48b4cf5d22e90', NULL, NULL, 'inactive', NULL, '2025-07-29 02:00:52', '2025-07-29 02:00:52', '2025-07-29 02:00:52'),
(92, 'KRoFlHROtzGL', 'mitchelleibrahamxs8@gmail.com', '$2y$10$9OYijJq7hFMinFPY1ygHveYE16zz0JaI6SXjfZCth.0mliwYnkFKy', '4919b121be056b87f94031205265b7fc3fb374722516492becadb17ad1be7990', 'c16fd6453616929c12eb0fcb274403cf', NULL, NULL, 'inactive', NULL, '2025-07-29 15:03:08', '2025-07-29 15:03:08', '2025-07-29 15:03:08'),
(93, 'SuqnTQUOpKTq', 'ajosezaxeko031@gmail.com', '$2y$10$pFo0uWhF.yewQJSBEPLTQ.np3VZNjuPWYrk3g9Wj9wF.Q0kGIviSO', 'f745af45f9f02bf6779e7083665c3b66eb591c03485472c449d7f917ffbbe75f', 'e2ceee3de8ec90d657b155e670fc6b45', NULL, NULL, 'inactive', NULL, '2025-07-29 17:43:17', '2025-07-29 17:43:17', '2025-07-29 17:43:17'),
(94, 'fgdYuUBjVjre', 'teransbdy3@gmail.com', '$2y$10$HS2BY9kVPYYpUlqin14x1uabpbdxbAWNSFqD38CkgVp2Ru9McU.Ra', '312b6471f83a641f4c74241f949e91f8be2cd486aad9afa62874e2b1c19f20cb', '742d437218560796271012e1b5ac9058', NULL, NULL, 'inactive', NULL, '2025-07-29 19:03:59', '2025-07-29 19:03:59', '2025-07-29 19:03:59'),
(95, 'GhjIXKqCre', 'beardarli1995@gmail.com', '$2y$10$c/graB2w..cNfC2Z2l4MK.HAp/sc96Nh4PDd6diZuJEb9XY8pOhXG', '74e9814a6529f20a970e68ae696247f37e738bbb276d874c01de9ec3b814771f', '93047e0c3810b0f40f0378f0515d82f6', NULL, NULL, 'inactive', NULL, '2025-07-29 19:47:42', '2025-07-29 19:47:42', '2025-07-29 19:47:42'),
(96, 'dLkaWRkiY', 'joycemeiblu7@gmail.com', '$2y$10$AIgZrEmr4QSCqoYq3ryQLuCn8pGEFkIceoK6lO.VECkhddlb8mtIK', '2247f3d38d41d3b70c3e2cdfbaca9b2f2b8e047f4c4af9d039cfc83163a93dce', '54beab80e64c68ad20f16b94dc24dee0', NULL, NULL, 'inactive', NULL, '2025-07-29 23:54:32', '2025-07-29 23:54:32', '2025-07-29 23:54:32'),
(97, 'GvahsFhWbfDfk', 'itanritz92@gmail.com', '$2y$10$nY9aaCeu8vr20R4GjWlrMO6xsNvmRCeIuLXEtrzTCbL5J0z9uWCEG', '601f7c10b01da08ee4032433a810fed90639ad712975ff4ab23c29daff349063', '7e794280434bd0e9d240db0519e69b00', NULL, NULL, 'inactive', NULL, '2025-07-30 01:36:50', '2025-07-30 01:36:50', '2025-07-30 01:36:50'),
(98, 'YPbageADOUa', 'pasuguwume092@gmail.com', '$2y$10$bh7pKv.D2iaMQ8zP2YubquvyEbvE5qN58l7QHQ4obLO0Um3D2A6cG', 'd7fb48afdbe7e1b795e49421884188e3ecf90893427922ddde2c40b8aef6e09b', '91dc9bd872e5a15ee58d1061637e81ff', NULL, NULL, 'inactive', NULL, '2025-07-30 09:23:53', '2025-07-30 09:23:53', '2025-07-30 09:23:53'),
(99, 'iFcqiipZDZdOtC', 'jenningsheilis@gmail.com', '$2y$10$.P7CErgrNrSS0U.EGdj5Me3ga9Jwi3P247tNfunWlLs8RE9VwUIy6', 'f1a30d7edd6e5977aac2b34ba8a401621631215314e510394c1d53e1caaca1c8', 'd7f5efd78d61e0f406aebd406d558df4', NULL, NULL, 'inactive', NULL, '2025-07-30 17:15:09', '2025-07-30 17:15:09', '2025-07-30 17:15:09'),
(100, 'YQBcvDwwlQCXTUW', 'valentainhq@gmail.com', '$2y$10$XIkIJSwd8kkt3aem4y6vD.QH2bsSA16zSN2SwPJ.nydA1szGdp23W', 'dec062c72603b754473b5e067d70f404a374ddba882b6fbcf8bfdc8915d7c861', 'cca63d66763bc2976af999c69b860ff9', NULL, NULL, 'inactive', NULL, '2025-07-30 20:49:23', '2025-07-30 20:49:23', '2025-07-30 20:49:23'),
(101, 'Eric Monroe', 'emonroe726@gmailot.com', '$2y$10$s5Q.gx0Dh9RketEcTNjAY.63ZN4NKyg4B3dLp1hEMoJ7u69wFArKC', '33bd5a9694f927fede82655e37cc3d541f2ddc4644324adaa2b1d8b4b31cdb82', '1cdcd33ea8bda4474bb3299b4da5539a', NULL, NULL, 'inactive', NULL, '2025-07-30 22:58:43', '2025-07-30 22:58:43', '2025-07-30 22:58:43'),
(102, 'JVcgsMDhBp', 'aqogike739@gmail.com', '$2y$10$a4OX93PR5rZhLLb/Ka8lH.DbstjWKUyyYguv/8bIHPrwa0tXljX/.', 'be58ba4db0aa83f8460fdbc2ae6d56ed3273eb5df6103876ee211659a189d41f', '5cfd561384ec86c88cc87f1bf38941d6', NULL, NULL, 'inactive', NULL, '2025-08-01 18:45:57', '2025-08-01 18:45:57', '2025-08-01 18:45:57'),
(103, 'HfvGlwnKi', 'etilugopo719@gmail.com', '$2y$10$CDwPKrgMjpXL4YdCaB2zZutmYiMIxpQfVDl04bgEOClGyP90Eqhxy', 'd5dd5bd3d7b6c1be26fb4bd7f340185d506521305f5df587f0551968700a00dc', '78a331d41475cfb6488c0b2bd399dc2f', NULL, NULL, 'inactive', NULL, '2025-08-01 21:36:04', '2025-08-01 21:36:04', '2025-08-01 21:36:04'),
(104, 'yTfRLltX', 'aralfn8@gmail.com', '$2y$10$ajNqCBZ0EG7hj061aB/By.B9je4L9Solj2mpGjPPQpCYWQuBTBEgG', '40b0586379ad84b7a68a06df20d13a94cb2b06dc318a6fc46ffd88e25f3e4c5e', '43341c6dc342e26fa09ea75ae4687a64', NULL, NULL, 'inactive', NULL, '2025-08-02 18:17:14', '2025-08-02 18:17:14', '2025-08-02 18:17:14'),
(105, 'bemcSUqTW', 'tempestcrosbys@gmail.com', '$2y$10$JNT5lJ1elooqyAeknvwC/uDkMyCdvwiHbfvUxSHv86xuDF1CR89Ka', 'e61a25786c0032ad711b3a9b9b48e1343756ad66405136261c30b144727af0f6', 'a6b86a32280f0a24f0d9f0697c5b5f58', NULL, NULL, 'inactive', NULL, '2025-08-02 23:25:24', '2025-08-02 23:25:24', '2025-08-02 23:25:24'),
(106, 'twRqUWlZdHdx', 'jennifercoleman898367@yahoo.com', '$2y$10$vonqQ0ZkLvpdzCk6.d7q8.QZPDwRWUGxvrnIBPXPUXB42yVNWXpJW', '872fe7fa1c23565b8b34229df55f2f8292f8208dcc86e7f0802e20402e7dd0f1', '76888f7594eeb79e206fc014f7d61fa0', NULL, NULL, 'inactive', NULL, '2025-08-03 01:48:20', '2025-08-03 01:48:20', '2025-08-03 01:48:20'),
(107, 'PbTtvwXIepmyJvY', 'nealdikki1986@gmail.com', '$2y$10$JraCiD2KtKIMwgB1G0XOMupNIzt3PWLK38MOwMgId/U3iZ/I9XDty', '9eda0cf0bb0a3a30b0b24065c7cfba39d5e3286ee94e91904a487300a4d8180a', 'c456767c6220431857810ceec4f15507', NULL, NULL, 'inactive', NULL, '2025-08-03 13:16:34', '2025-08-03 13:16:34', '2025-08-03 13:16:34'),
(108, 'pKudCOXLEKBMLGC', 'lasssusie232380@yahoo.com', '$2y$10$YoWacU4vc4vJVMZd4BAi1.hIKO5XqbRs7OHaHWlNzlXH6chD1kkzm', 'e1ea0099f24a8e572c47796b5109ffee7659745ce4c966a0dc27b8a3d94f3ef8', 'b64c3c0e2d952d9cea53f5422beb31f7', NULL, NULL, 'inactive', NULL, '2025-08-03 19:45:41', '2025-08-03 19:45:41', '2025-08-03 19:45:41'),
(109, 'LCurKovbCgLZ', 'andrewpolega1987@yahoo.com', '$2y$10$4PLfr.ABegbRD0drOFAa.eH83dKLnh1umNMsRvbf4RG/IORu0dSmm', '131b3163aed23f85e794e15a7723bc9f6fd838ad8d23985e19a2bf8e6a6a31e7', 'f5c97c3d7a88674fc53525212d16cd3e', NULL, NULL, 'inactive', NULL, '2025-08-04 04:13:12', '2025-08-04 04:13:12', '2025-08-04 04:13:12'),
(110, 'kvKSQdqCr', 'aqaqozapeq215@gmail.com', '$2y$10$PJeCDOHgi6IWq2ySAdt9tOByDiKuKNKgiuuTvdGPHwyCiBak/ip6W', '3a2956a134e855e769eb0d918c94df876a9c1a7d368b852e1638608845b0902c', 'f0b44fa1e9e2e637f38c1db8818af6ed', NULL, NULL, 'inactive', NULL, '2025-08-04 05:21:16', '2025-08-04 05:21:16', '2025-08-04 05:21:16'),
(111, 'wIyyrQVeBIxnrA', 'gravesary959914@yahoo.com', '$2y$10$lLgYeZBxs/AEN5Lv2drbBejXZBMtdRzS2EVxf/KL7EchK5zk2dkzS', '62ca8b305b15e4f49e8ecc79e53d146df0a689b7fdb232e4ce2f7f7e2bdc161c', '07f68087d288b77e6eeb4827924c4517', NULL, NULL, 'inactive', NULL, '2025-08-04 10:47:31', '2025-08-04 10:47:31', '2025-08-04 10:47:31'),
(112, 'HsMGgiqpedgOA', 'hayesamber304945@yahoo.com', '$2y$10$46Jq35ZGdqmmhLLY43zH5e/FmWh/Mc1SU5tZbCefkp5kx3onBpw7G', '37e4d2df17f9d801002ae891cde00fc114e8b07c511df512db6372d3ac7eb6de', 'e7ed0053c797b1e833a29cd9fe2d3018', NULL, NULL, 'inactive', NULL, '2025-08-04 12:44:33', '2025-08-04 12:44:33', '2025-08-04 12:44:33'),
(113, 'nKRBOFfqP', 'andersonteal118877@yahoo.com', '$2y$10$S8tyYrIHpMLrd9dMtSje4.NqyOJBcxbwbaJsxGj36FwkH/irLSGue', 'c38445e0c038438a7672356f20e58de8b3c4db0c8111d4d39ae66b181561479c', '7fb5eb1307b6b6a43b01bee2dddb624a', NULL, NULL, 'inactive', NULL, '2025-08-04 19:05:50', '2025-08-04 19:05:50', '2025-08-04 19:05:50'),
(114, 'FdgzGwbqkMY', 'ehuduwuru873@gmail.com', '$2y$10$53wRQxKEaOJv655wNavPreMk79VwLig99sKEPRbbYYZRSN4UZqLna', 'a2a5a4ec8265e774c08ad12e69f2938f856df1cb253adb1a1deb913891a4ed5f', 'aec6cca84f91a9a672f04b0733df93e0', NULL, NULL, 'inactive', NULL, '2025-08-05 00:31:57', '2025-08-05 00:31:57', '2025-08-05 00:31:57');

-- --------------------------------------------------------

--
-- Table structure for table `visitors`
--

CREATE TABLE `visitors` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `last_active` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `status` enum('active','inactive','blocked') DEFAULT 'active',
  `device_type` varchar(50) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `browser` varchar(100) DEFAULT NULL,
  `last_activity` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `visitors`
--

INSERT INTO `visitors` (`id`, `user_id`, `name`, `email`, `url`, `ip_address`, `user_agent`, `created_at`, `last_active`, `status`, `device_type`, `country`, `browser`, `last_activity`) VALUES
(1, 1, 'Test Visitor', 'test@example.com', 'https://test-site.com', '102.90.96.30', 'API Test Script', '2025-05-20 06:23:26', '2025-05-20 12:12:59', 'active', NULL, NULL, NULL, NULL),
(2, 1, 'Test Visitor', 'test@example.com', 'https://test-site.com', '102.90.96.30', 'API Test Script', '2025-05-20 11:37:57', '2025-05-20 11:37:57', 'active', NULL, NULL, NULL, NULL),
(3, 1, 'Test Visitor', 'test@example.com', 'https://test-site.com', '102.90.96.30', 'API Test Script', '2025-05-20 11:38:05', '2025-05-20 11:38:05', 'active', NULL, NULL, NULL, NULL),
(4, 1, 'Test Visitor', 'test@example.com', 'https://test-site.com', '102.90.96.30', 'API Test Script', '2025-05-20 11:38:08', '2025-05-20 11:38:08', 'active', NULL, NULL, NULL, NULL),
(5, 1, 'Test Visitor', 'test@example.com', 'https://test-site.com', '102.90.96.30', 'API Test Script', '2025-05-20 11:38:09', '2025-05-20 11:38:09', 'active', NULL, NULL, NULL, NULL),
(6, 1, 'Test Visitor', 'test@example.com', 'https://test-site.com', '102.90.96.30', 'API Test Script', '2025-05-20 11:38:10', '2025-05-20 11:38:10', 'active', NULL, NULL, NULL, NULL),
(7, 1, 'Test Visitor', 'test@example.com', 'https://test-site.com', '102.90.96.30', 'API Test Script', '2025-05-20 11:38:10', '2025-05-20 11:38:10', 'active', NULL, NULL, NULL, NULL),
(8, 1, 'Test Visitor', 'test@example.com', 'https://test-site.com', '102.90.96.30', 'API Test Script', '2025-05-20 11:38:11', '2025-05-20 11:38:11', 'active', NULL, NULL, NULL, NULL),
(9, 1, 'Test Visitor', 'test@example.com', 'https://test-site.com', '102.90.96.30', 'API Test Script', '2025-05-20 11:38:12', '2025-05-20 11:38:12', 'active', NULL, NULL, NULL, NULL),
(10, 1, 'Test Visitor', 'test@example.com', 'https://test-site.com', '102.90.96.30', 'API Test Script', '2025-05-20 11:38:58', '2025-05-20 11:38:58', 'active', NULL, NULL, NULL, NULL),
(11, 1, 'Test Visitor', 'test@example.com', 'https://test-site.com', '102.90.96.30', 'API Test Script', '2025-05-20 12:17:10', '2025-05-20 14:54:50', 'active', NULL, NULL, NULL, NULL),
(12, 1, NULL, NULL, 'https://widget-test.com', '2a02:4780:2b:2034:0:2186:5541:1', 'Widget Test Script', '2025-05-20 12:23:01', '2025-05-20 14:28:46', 'active', NULL, NULL, NULL, NULL),
(13, 2, NULL, NULL, 'https://widget-test.com', '2a02:4780:2b:2034:0:2186:5541:1', 'Widget Test Script', '2025-05-20 12:23:01', '2025-05-20 13:28:00', 'active', NULL, NULL, NULL, NULL),
(14, 3, NULL, NULL, 'https://widget-test.com', '2a02:4780:2b:2034:0:2186:5541:1', 'Widget Test Script', '2025-05-20 12:23:01', '2025-05-20 13:28:00', 'active', NULL, NULL, NULL, NULL),
(15, 4, NULL, NULL, 'https://widget-test.com', '2a02:4780:2b:2034:0:2186:5541:1', 'Widget Test Script', '2025-05-20 12:23:01', '2025-05-20 13:28:00', 'active', NULL, NULL, NULL, NULL),
(782001, 1, NULL, NULL, 'https://agileproject.site/#tgWebAppData=user%3D%257B%2522id%2522%253A6887731456%252C%2522first_name%2522%253A%2522Jessica%2522%252C%2522last_name%2522%253A%2522Mariam%2522%252C%2522username%2522%253A%2522jessicamariam10%2522%252C%2522language_code%2522%25', '105.116.7.201', 'Mozilla/5.0 (iPhone; CPU iPhone OS 18_5 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/15E148', '2025-05-21 23:23:38', '2025-05-21 23:23:38', 'active', NULL, NULL, NULL, NULL),
(6685565, 7, NULL, NULL, 'https://skyreignsfinancial.com/', '105.116.0.113', 'Mozilla/5.0 (iPhone; CPU iPhone OS 18_5 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Mobile/15E148 Safari/604.1', '2025-05-22 13:50:56', '2025-05-22 13:50:56', 'active', NULL, NULL, NULL, NULL),
(6824327, 1, NULL, NULL, 'https://agileproject.site/index.php', '66.249.70.169', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.7151.119 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '2025-07-09 09:49:37', '2025-07-09 09:49:37', 'active', NULL, NULL, NULL, NULL),
(9894110, 7, NULL, NULL, 'https://skyreignsfinancial.com/app/Account/finapp.bragherstudio/view4/index.php', '179.190.200.2', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Mobile Safari/537.36', '2025-05-22 13:44:36', '2025-05-22 20:55:59', 'active', NULL, NULL, NULL, NULL),
(18182953, 1, NULL, NULL, 'https://remottejob.com/', '105.120.130.207', 'Mozilla/5.0 (iPhone; CPU iPhone OS 17_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/131.0.6778.134 Mobile/15E148 Safari/604.1', '2025-06-06 10:34:51', '2025-06-06 10:42:58', 'active', NULL, NULL, NULL, NULL),
(23209630, 7, NULL, NULL, 'https://skyreignsfinancial.com/app/login.php', '165.16.184.171', 'Mozilla/5.0 (Linux; Android 12; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.7151.115 Mobile Safari/537.36', '2025-07-10 10:05:00', '2025-07-10 10:05:21', 'active', NULL, NULL, NULL, NULL),
(26233182, 7, NULL, NULL, 'https://skyreignsfinancial.com/', '40.77.188.220', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/112.0.0.0 Safari/537.36', '2025-06-08 20:30:53', '2025-06-08 20:30:53', 'active', NULL, NULL, NULL, NULL),
(30069709, 1, NULL, NULL, 'https://agileproject.site/', '35.91.205.2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', '2025-05-22 16:20:32', '2025-05-22 16:20:32', 'active', NULL, NULL, NULL, NULL),
(30484800, 1, NULL, NULL, 'https://agileproject.site/', '202.8.43.78', 'Mozilla/5.0 (compatible; AhrefsBot/7.0; +http://ahrefs.com/robot/)', '2025-07-27 07:17:01', '2025-07-27 07:17:01', 'active', NULL, NULL, NULL, NULL),
(39166372, 7, NULL, NULL, 'http://skyreignsfinancial.com/app/Account/finapp.bragherstudio/view4/index.php', '103.174.5.149', 'Mozilla/5.0 (Linux; Android 14; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.7103.125 Mobile Safari/537.36', '2025-06-09 20:55:41', '2025-06-09 20:55:41', 'active', NULL, NULL, NULL, NULL),
(41746190, 1, NULL, NULL, 'https://agileproject.site/', '45.88.222.22', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-09 17:36:39', '2025-06-09 17:44:13', 'active', NULL, NULL, NULL, NULL),
(43224163, 1, NULL, NULL, 'https://agileproject.site/', '197.210.227.190', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '2025-05-22 21:58:19', '2025-06-23 11:19:17', 'active', NULL, NULL, NULL, NULL),
(44826975, 7, NULL, NULL, 'https://skyreignsfinancial.com/', '182.48.82.6', 'Mozilla/5.0 (Linux; Android 9; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.7103.88 Mobile Safari/537.36', '2025-05-23 01:59:01', '2025-05-23 02:05:37', 'active', NULL, NULL, NULL, NULL),
(45236120, 1, NULL, NULL, 'https://agileproject.site/', '104.253.214.182', 'Mozilla/5.0 (iPhone; CPU iPhone OS 17_4_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/123.0.6312.52 Mobile/15E148 Safari/604.1', '2025-05-22 23:59:03', '2025-05-22 23:59:03', 'active', NULL, NULL, NULL, NULL),
(48987883, 7, NULL, NULL, 'https://skyreignsfinancial.com/app/Account/finapp.bragherstudio/view4/index.php', '2409:408a:2c99:ddde:db40:cea9:80d8:93dd', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Mobile Safari/537.36', '2025-06-11 20:25:34', '2025-06-11 20:25:34', 'active', NULL, NULL, NULL, NULL),
(59318808, 1, NULL, NULL, 'https://agileproject.site/', '66.249.64.37', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.7103.113 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '2025-06-12 08:29:24', '2025-06-12 08:29:24', 'active', NULL, NULL, NULL, NULL),
(60109471, 7, NULL, NULL, 'https://skyreignsfinancial.com/app/Account/finapp.bragherstudio/view4/index.php', '2402:ad80:137:c3b:d1dd:4be4:b1b2:736e', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/28.0 Chrome/130.0.0.0 Mobile Safari/537.36', '2025-06-13 06:38:34', '2025-06-13 06:38:48', 'active', NULL, NULL, NULL, NULL),
(66065718, 7, NULL, NULL, 'https://skyreignsfinancial.com/app/Account/finapp.bragherstudio/view4/index.php', '103.167.15.5', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Mobile Safari/537.36', '2025-06-13 05:02:16', '2025-06-13 05:02:16', 'active', NULL, NULL, NULL, NULL),
(67224022, 1, NULL, NULL, 'https://agileproject.site/index.php', '66.249.74.5', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.7103.92 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '2025-06-04 02:39:32', '2025-06-04 02:39:32', 'active', NULL, NULL, NULL, NULL),
(71605010, 7, NULL, NULL, 'https://skyreignsfinancial.com/', '102.90.99.169', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '2025-05-21 20:20:47', '2025-05-25 17:18:52', 'active', NULL, NULL, NULL, NULL),
(72111545, 7, NULL, NULL, 'https://skyreignsfinancial.com/', '40.77.188.97', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/112.0.0.0 Safari/537.36', '2025-06-04 20:39:04', '2025-06-04 20:39:04', 'active', NULL, NULL, NULL, NULL),
(75756145, 7, NULL, NULL, 'https://skyreignsfinancial.com/app/login.php', '40.77.189.73', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/136.0.0.0 Safari/537.36', '2025-07-01 15:29:32', '2025-07-01 15:29:32', 'active', NULL, NULL, NULL, NULL),
(77843235, 7, NULL, NULL, 'https://www.skyreignsfinancial.com/app/login.php', '2803:2d60:1612:81b:8c6c:8b45:7b0d:7fa0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-08-03 22:06:45', '2025-08-03 22:06:45', 'active', NULL, NULL, NULL, NULL),
(79849839, 1, NULL, NULL, 'https://agileproject.site/', '45.254.254.119', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0', '2025-07-20 16:01:25', '2025-07-20 16:01:25', 'active', NULL, NULL, NULL, NULL),
(87397652, 1, NULL, NULL, 'http://localhost/agileproject/', '102.90.97.132', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:140.0) Gecko/20100101 Firefox/140.0', '2025-07-06 17:15:59', '2025-07-23 04:59:27', 'active', NULL, NULL, NULL, NULL),
(87457817, 1, NULL, NULL, 'https://agileproject.site/', '44.248.244.230', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/68.0.3440.106 Safari/537.36', '2025-06-08 11:44:50', '2025-06-08 11:44:50', 'active', NULL, NULL, NULL, NULL),
(88796426, 1, NULL, NULL, 'https://agileproject.site/index.php', '66.249.64.225', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.7151.68 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '2025-06-23 06:40:19', '2025-06-23 06:40:19', 'active', NULL, NULL, NULL, NULL),
(93487333, 1, NULL, NULL, 'https://diniochat.com/', '3.81.172.59', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', '2025-06-23 22:03:31', '2025-06-23 22:03:31', 'active', NULL, NULL, NULL, NULL),
(93781107, 7, NULL, NULL, 'https://skyreignsfinancial.com/app/login.php', '197.185.241.55', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Mobile Safari/537.36', '2025-07-07 19:05:21', '2025-07-07 19:05:21', 'active', NULL, NULL, NULL, NULL),
(97147023, 1, NULL, NULL, 'https://agileproject.site/', '205.169.39.3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/117.0.5938.132 Safari/537.36', '2025-05-23 12:57:36', '2025-05-23 12:57:36', 'active', NULL, NULL, NULL, NULL),
(102103584, 7, NULL, NULL, 'https://skyreignsfinancial.com/app/login.php', '40.77.178.240', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/136.0.0.0 Safari/537.36', '2025-07-30 02:35:54', '2025-07-30 02:35:54', 'active', NULL, NULL, NULL, NULL),
(109286055, 1, NULL, NULL, 'https://agileproject.site/', '205.169.39.43', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/117.0.5938.132 Safari/537.36', '2025-07-17 22:07:01', '2025-07-17 22:07:01', 'active', NULL, NULL, NULL, NULL),
(117129464, 1, NULL, NULL, 'https://agileproject.site/', '35.88.54.197', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/68.0.3440.106 Safari/537.36', '2025-06-23 10:45:11', '2025-06-23 10:45:11', 'active', NULL, NULL, NULL, NULL),
(120606935, 1, NULL, NULL, 'https://agileproject.site/', '52.13.53.150', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/68.0.3440.106 Safari/537.36', '2025-06-05 10:38:24', '2025-06-05 10:38:24', 'active', NULL, NULL, NULL, NULL),
(124441550, 1, NULL, NULL, 'https://agileproject.site/', '35.232.210.170', 'Mozilla/5.0 (iPhone; CPU iPhone OS 17_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.5 Mobile/15E148 Safari/604.1', '2025-07-24 16:38:13', '2025-07-24 16:38:13', 'active', NULL, NULL, NULL, NULL),
(138435120, 1, NULL, NULL, 'https://agileproject.site/', '44.248.244.230', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/68.0.3440.106 Safari/537.36', '2025-06-08 11:48:01', '2025-06-08 11:48:01', 'active', NULL, NULL, NULL, NULL),
(139371432, 1, NULL, NULL, 'https://remottejob.com/', '205.169.39.41', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/117.0.5938.132 Safari/537.36', '2025-05-22 05:42:24', '2025-05-22 05:42:24', 'active', NULL, NULL, NULL, NULL),
(139708479, 7, NULL, NULL, 'https://skyreignsfinancial.com/app/Account/finapp.bragherstudio/view4/index.php', '212.183.242.149', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Mobile Safari/537.36', '2025-06-13 16:46:31', '2025-06-13 16:46:31', 'active', NULL, NULL, NULL, NULL),
(143441779, 7, NULL, NULL, 'https://skyreignsfinancial.com/app/login.php', '2001:4454:4bb:9400:a8ac:a21e:e22f:c489', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Mobile Safari/537.36', '2025-06-18 00:45:28', '2025-06-18 07:54:31', 'active', NULL, NULL, NULL, NULL),
(144656948, 7, NULL, NULL, 'https://skyreignsfinancial.com/about-us.php', '40.77.190.191', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/112.0.0.0 Safari/537.36', '2025-06-10 12:52:41', '2025-06-10 12:52:41', 'active', NULL, NULL, NULL, NULL),
(155145120, 1, NULL, NULL, 'https://agileproject.site/', '197.210.227.131', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Mobile Safari/537.36', '2025-05-22 07:20:53', '2025-05-22 07:20:53', 'active', NULL, NULL, NULL, NULL),
(162076518, 1, NULL, NULL, 'https://agileproject.site/', '105.235.193.251', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Mobile Safari/537.36', '2025-06-13 15:24:05', '2025-06-13 15:24:05', 'active', NULL, NULL, NULL, NULL),
(163885916, 7, NULL, NULL, 'https://skyreignsfinancial.com/app/login.php', '40.77.189.251', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/112.0.0.0 Safari/537.36', '2025-06-23 06:31:13', '2025-06-23 06:31:13', 'active', NULL, NULL, NULL, NULL),
(165498266, 1, NULL, NULL, 'https://agileproject.site/', '66.249.70.167', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; Googlebot/2.1; +http://www.google.com/bot.html) Chrome/137.0.7151.119 Safari/537.36', '2025-07-30 07:47:11', '2025-07-30 07:47:11', 'active', NULL, NULL, NULL, NULL),
(175291776, 1, NULL, NULL, 'https://turkishcustomsservice.com/', '2001:41d0:80a:3a00::', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:115.0) Gecko/20100101 Chrome/115.0.0.0 Safari/537.36', '2025-07-25 02:28:22', '2025-07-25 02:28:22', 'active', NULL, NULL, NULL, NULL),
(186206427, 1, NULL, NULL, 'https://agileproject.site/#tgWebAppData=user%3D%257B%2522id%2522%253A6635037636%252C%2522first_name%2522%253A%2522Ebisintei%2522%252C%2522last_name%2522%253A%2522%2522%252C%2522username%2522%253A%2522ebisintei%2522%252C%2522language_code%2522%253A%2522en%', '102.90.99.169', 'Mozilla/5.0 (Linux; Android 12; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.7103.60 Mobile Safari/537.36 Telegram-Android/11.9.2 (Vivo V2027; Android 12; SDK 31; AVERAGE)', '2025-05-22 02:43:53', '2025-05-25 19:56:57', 'active', NULL, NULL, NULL, NULL),
(189385716, 15, NULL, NULL, 'https://juniordiceglobalpay.com/banking/user/dashboard.php', '105.33.255.191', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Mobile Safari/537.36', '2025-06-03 19:21:26', '2025-06-04 00:01:17', 'active', NULL, NULL, NULL, NULL),
(189686923, 1, NULL, NULL, 'https://agileproject.site/', '102.90.101.229', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '2025-05-30 08:04:06', '2025-07-01 14:46:00', 'active', NULL, NULL, NULL, NULL),
(193885272, 1, NULL, NULL, 'https://agileproject.site/', '205.169.39.97', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.79 Safari/537.36', '2025-05-23 12:53:30', '2025-05-23 12:53:30', 'active', NULL, NULL, NULL, NULL),
(206429365, 1, NULL, NULL, 'https://agileproject.site/', '35.86.199.6', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/68.0.3440.106 Safari/537.36', '2025-07-29 10:31:37', '2025-07-29 10:31:37', 'active', NULL, NULL, NULL, NULL),
(206790963, 1, NULL, NULL, 'https://www.olutus.com/', '40.77.177.157', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/136.0.0.0 Safari/537.36', '2025-07-16 12:24:31', '2025-07-16 12:24:31', 'active', NULL, NULL, NULL, NULL),
(209458135, 7, NULL, NULL, 'https://skyreignsfinancial.com/app/Account/finapp.bragherstudio/view4/index.php', '2804:388:c3e7:9c2a:3bbf:2877:3435:d152', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Mobile Safari/537.36', '2025-05-22 12:23:22', '2025-05-22 20:56:44', 'active', NULL, NULL, NULL, NULL),
(210146808, 1, NULL, NULL, 'https://diniochat.com/', '205.169.39.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/117.0.5938.132 Safari/537.36', '2025-07-23 04:21:15', '2025-07-23 04:21:15', 'active', NULL, NULL, NULL, NULL),
(211104801, 1, NULL, NULL, 'https://agileproject.site/', '35.88.44.248', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/68.0.3440.106 Safari/537.36', '2025-06-14 09:49:26', '2025-06-14 09:49:26', 'active', NULL, NULL, NULL, NULL),
(221711418, 1, NULL, NULL, 'https://agileproject.site/', '66.249.64.228', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.7151.119 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '2025-07-15 11:37:50', '2025-07-15 11:37:50', 'active', NULL, NULL, NULL, NULL),
(224774482, 1, NULL, NULL, 'https://agileproject.site/', '66.249.64.227', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; Googlebot/2.1; +http://www.google.com/bot.html) Chrome/137.0.7151.119 Safari/537.36', '2025-07-26 20:37:49', '2025-07-26 20:37:49', 'active', NULL, NULL, NULL, NULL),
(231433789, 10, NULL, NULL, 'https://remottejob.com/', '205.169.39.51', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/117.0.5938.132 Safari/537.36', '2025-06-04 10:16:59', '2025-06-04 10:16:59', 'active', NULL, NULL, NULL, NULL),
(232557231, 1, NULL, NULL, 'https://diniochat.com/', '54.166.238.34', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', '2025-06-12 16:59:21', '2025-06-12 16:59:21', 'active', NULL, NULL, NULL, NULL),
(233486645, 7, NULL, NULL, 'https://skyreignsfinancial.com/app/login.php', '103.68.118.27', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Mobile Safari/537.36', '2025-07-07 04:44:29', '2025-07-07 04:45:03', 'active', NULL, NULL, NULL, NULL),
(236698558, 1, NULL, NULL, 'https://agileproject.site/', '205.169.39.102', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.79 Safari/537.36', '2025-07-17 22:03:13', '2025-07-17 22:03:13', 'active', NULL, NULL, NULL, NULL),
(241895082, 1, NULL, NULL, 'https://agileproject.site/', '18.246.249.160', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/68.0.3440.106 Safari/537.36', '2025-07-14 15:12:03', '2025-07-14 15:12:03', 'active', NULL, NULL, NULL, NULL),
(243106744, 15, NULL, NULL, 'https://juniordiceglobalpay.com/', '102.90.100.188', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-03 17:15:56', '2025-06-03 17:15:56', 'active', NULL, NULL, NULL, NULL),
(247264561, 7, NULL, NULL, 'https://skyreignsfinancial.com/app/Account/finapp.bragherstudio/view4/transactions.php', '2600:387:f:6915::9', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Mobile Safari/537.36', '2025-06-07 19:23:31', '2025-06-07 19:23:31', 'active', NULL, NULL, NULL, NULL),
(250198997, 7, NULL, NULL, 'https://skyreignsfinancial.com/app/login.php', '40.77.188.219', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/112.0.0.0 Safari/537.36', '2025-06-04 15:33:53', '2025-06-04 15:33:53', 'active', NULL, NULL, NULL, NULL),
(253813987, 7, NULL, NULL, 'https://skyreignsfinancial.com/', '40.77.190.37', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/112.0.0.0 Safari/537.36', '2025-06-12 20:48:03', '2025-06-12 20:48:03', 'active', NULL, NULL, NULL, NULL),
(254665953, 7, NULL, NULL, 'https://skyreignsfinancial.com/app/login.php', '40.77.179.131', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/136.0.0.0 Safari/537.36', '2025-07-19 06:15:48', '2025-07-19 06:15:48', 'active', NULL, NULL, NULL, NULL),
(257861746, 1, NULL, NULL, 'https://agileproject.site/', '17.246.19.97', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.4 Safari/605.1.15 (Applebot/0.1; +http://www.apple.com/go/applebot)', '2025-07-07 02:39:39', '2025-07-07 02:39:39', 'active', NULL, NULL, NULL, NULL),
(265972410, 1, NULL, NULL, 'https://agileproject.site/', '105.116.0.113', 'Mozilla/5.0 (iPhone; CPU iPhone OS 18_5 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Mobile/15E148 Safari/604.1 Ddg/18.5', '2025-05-22 17:29:05', '2025-05-22 17:29:05', 'active', NULL, NULL, NULL, NULL),
(267838494, 1, NULL, NULL, 'https://agileproject.site/', '44.250.107.242', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/68.0.3440.106 Safari/537.36', '2025-06-26 09:58:13', '2025-06-26 09:58:13', 'active', NULL, NULL, NULL, NULL),
(269533041, 1, NULL, NULL, 'https://agileproject.site/', '102.90.99.169', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '2025-05-22 05:28:14', '2025-05-22 08:45:20', 'active', NULL, NULL, NULL, NULL),
(269614872, 7, NULL, NULL, 'http://www.skyreignsfinancial.com/app/login.php', '2401:4900:808e:5de3::123c:d23f', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Mobile Safari/537.36', '2025-08-05 18:06:43', '2025-08-05 18:13:06', 'active', NULL, NULL, NULL, NULL),
(271836406, 1, NULL, NULL, 'https://agileproject.site/index.php', '66.249.64.39', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; Googlebot/2.1; +http://www.google.com/bot.html) Chrome/137.0.7151.119 Safari/537.36', '2025-07-20 03:19:41', '2025-07-20 03:19:41', 'active', NULL, NULL, NULL, NULL),
(273650805, 1, NULL, NULL, 'https://agileproject.site/', '44.249.242.71', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/68.0.3440.106 Safari/537.36', '2025-07-05 11:47:20', '2025-07-05 11:47:20', 'active', NULL, NULL, NULL, NULL),
(274478773, 1, NULL, NULL, 'https://agileproject.site/', '102.90.98.76', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-04 21:51:31', '2025-07-07 15:55:46', 'active', NULL, NULL, NULL, NULL),
(276859223, 1, NULL, NULL, 'https://agileproject.site//account/dashboard.php', '102.90.99.169', 'Mozilla/5.0 (iPhone; CPU iPhone OS 18_4_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/15E148', '2025-05-21 21:11:05', '2025-05-22 17:46:40', 'active', NULL, NULL, NULL, NULL),
(276892811, 1, NULL, NULL, 'https://agileproject.site/', '103.120.170.9', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-19 20:58:27', '2025-06-19 21:20:13', 'active', NULL, NULL, NULL, NULL),
(283597887, 7, NULL, NULL, 'https://skyreignsfinancial.com/app/login.php', '197.221.253.43', 'Mozilla/5.0 (Linux; Android 14; SAMSUNG SM-A055F) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/22.0 Chrome/111.0.5563.116 Mobile Safari/537.36', '2025-07-18 09:46:32', '2025-07-18 09:59:11', 'active', NULL, NULL, NULL, NULL),
(286217922, 1, NULL, NULL, 'https://agileproject.site/', '206.217.139.200', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Mobile Safari/537.36', '2025-07-19 05:31:18', '2025-07-19 05:31:18', 'active', NULL, NULL, NULL, NULL),
(286362086, 1, NULL, NULL, 'https://agileproject.site/index.php', '66.249.70.167', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.7151.119 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '2025-08-06 00:19:02', '2025-08-06 00:19:02', 'active', NULL, NULL, NULL, NULL),
(286587400, 1, NULL, NULL, 'https://agileproject.site/', '34.72.176.129', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/125.0.6422.60 Safari/537.36', '2025-06-21 16:10:55', '2025-06-21 16:10:55', 'active', NULL, NULL, NULL, NULL),
(291065344, 1, NULL, NULL, 'http://www.olutus.com/', '40.77.178.139', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/136.0.0.0 Safari/537.36', '2025-07-24 02:23:36', '2025-07-24 02:23:36', 'active', NULL, NULL, NULL, NULL),
(305595614, 1, NULL, NULL, 'https://agileproject.site/', '205.169.39.21', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/117.0.5938.132 Safari/537.36', '2025-06-09 19:04:20', '2025-06-09 19:04:20', 'active', NULL, NULL, NULL, NULL),
(313479238, 7, NULL, NULL, 'https://skyreignsfinancial.com/', '2401:4900:1730:e643:2:1:beca:470b', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Mobile Safari/537.36', '2025-05-24 02:29:26', '2025-05-24 02:29:26', 'active', NULL, NULL, NULL, NULL),
(313480294, 7, NULL, NULL, 'http://skyreignsfinancial.com/', '40.77.190.106', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/112.0.0.0 Safari/537.36', '2025-06-09 19:38:21', '2025-06-09 19:38:21', 'active', NULL, NULL, NULL, NULL),
(314949040, 7, NULL, NULL, 'https://skyreignsfinancial.com/app/Account/finapp.bragherstudio/view4/index.php', '200.82.143.29', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', '2025-06-05 20:01:19', '2025-06-05 20:01:19', 'active', NULL, NULL, NULL, NULL),
(316121317, 1, NULL, NULL, 'https://agileproject.site/index.php', '66.249.64.39', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.7151.119 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '2025-07-20 03:19:40', '2025-07-20 03:19:40', 'active', NULL, NULL, NULL, NULL),
(317354636, 1, NULL, NULL, 'https://agileproject.site/#tgWebAppData=user%3D%257B%2522id%2522%253A7010309563%252C%2522first_name%2522%253A%2522Patricia%2522%252C%2522last_name%2522%253A%2522Barbara%2522%252C%2522username%2522%253A%2522PatriciaBarbara90%2522%252C%2522language_code%252', '105.113.8.74', 'Mozilla/5.0 (iPhone; CPU iPhone OS 18_2 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/15E148', '2025-06-03 17:42:33', '2025-06-03 17:55:04', 'active', NULL, NULL, NULL, NULL),
(324433472, 1, NULL, NULL, 'https://agileproject.site/', '102.90.116.22', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Mobile Safari/537.36', '2025-06-08 18:07:14', '2025-06-08 18:07:14', 'active', NULL, NULL, NULL, NULL),
(329946120, 7, NULL, NULL, 'https://skyreignsfinancial.com/app/login.php', '65.55.210.5', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/136.0.0.0 Safari/537.36', '2025-07-27 06:28:47', '2025-07-27 06:28:47', 'active', NULL, NULL, NULL, NULL),
(338101924, 1, NULL, NULL, 'https://agileproject.site/index.php', '66.249.64.234', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; Googlebot/2.1; +http://www.google.com/bot.html) Chrome/137.0.7151.68 Safari/537.36', '2025-06-29 08:41:13', '2025-06-29 08:41:13', 'active', NULL, NULL, NULL, NULL),
(342742413, 7, NULL, NULL, 'http://www.skyreignsfinancial.com/app/login.php', '49.149.65.9', 'Mozilla/5.0 (Linux; Android 12; CPH2471 Build/SP1A.210812.016) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/137.0.7151.115 Mobile Safari/537.36', '2025-06-29 01:09:44', '2025-06-29 01:11:22', 'active', NULL, NULL, NULL, NULL),
(344666048, 10, NULL, NULL, 'https://remottejob.com/', '102.90.115.214', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-06 10:18:21', '2025-06-06 10:18:21', 'active', NULL, NULL, NULL, NULL),
(348527969, 7, NULL, NULL, 'https://skyreignsfinancial.com/app/Account/finapp.bragherstudio/view4/index.php', '2803:9800:9093:8c83:ccc4:f644:ac9d:add7', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Mobile Safari/537.36', '2025-06-03 23:45:11', '2025-06-03 23:45:11', 'active', NULL, NULL, NULL, NULL),
(353350216, 1, NULL, NULL, 'https://agileproject.site/', '105.120.130.203', 'Mozilla/5.0 (iPhone; CPU iPhone OS 17_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/131.0.6778.134 Mobile/15E148 Safari/604.1', '2025-06-08 18:07:51', '2025-06-10 20:27:46', 'active', NULL, NULL, NULL, NULL),
(353559142, 1, NULL, NULL, 'https://turkishcustomsservice.com/', '51.89.162.155', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:115.0) Gecko/20100101 Chrome/115.0.0.0 Safari/537.36', '2025-07-26 04:40:36', '2025-07-26 04:40:36', 'active', NULL, NULL, NULL, NULL),
(354045897, 1, NULL, NULL, 'https://diniochat.com/', '205.169.39.5', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/117.0.5938.132 Safari/537.36', '2025-07-23 22:58:53', '2025-07-23 22:58:53', 'active', NULL, NULL, NULL, NULL),
(356445631, 1, NULL, NULL, 'https://agileproject.site/', '66.249.70.167', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.7151.119 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '2025-07-30 07:47:12', '2025-07-30 07:47:12', 'active', NULL, NULL, NULL, NULL),
(358766906, 1, NULL, NULL, 'https://agileproject.site/', '102.88.110.237', 'Mozilla/5.0 (iPhone; CPU iPhone OS 17_6_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.6 Mobile/15E148 Safari/604.1', '2025-06-10 16:07:47', '2025-06-10 16:07:47', 'active', NULL, NULL, NULL, NULL),
(363343516, 1, NULL, NULL, 'https://agileproject.site/', '83.32.116.73', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0', '2025-07-20 15:56:24', '2025-07-20 15:56:24', 'active', NULL, NULL, NULL, NULL),
(363664575, 1, NULL, NULL, 'https://agileproject.site/', '167.114.3.106', '\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36\"', '2025-07-22 09:37:15', '2025-07-22 09:37:15', 'active', NULL, NULL, NULL, NULL),
(370725325, 1, NULL, NULL, 'http://localhost/agileproject/', '102.90.116.208', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-27 05:50:58', '2025-06-27 06:58:18', 'active', NULL, NULL, NULL, NULL),
(380541340, 1, NULL, NULL, 'https://agileproject.site/', '66.249.70.171', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.7151.119 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '2025-07-09 13:56:05', '2025-07-09 13:56:05', 'active', NULL, NULL, NULL, NULL),
(382436543, 7, NULL, NULL, 'https://skyreignsfinancial.com/app/login.php', '2401:ba80:a350:fe7c:1855:5846:9c5d:aacb', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Mobile Safari/537.36', '2025-07-25 05:12:30', '2025-07-25 05:12:30', 'active', NULL, NULL, NULL, NULL),
(386567683, 1, NULL, NULL, 'https://agileproject.site/', '102.88.110.237', 'Mozilla/5.0 (iPhone; CPU iPhone OS 17_6_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.6 Mobile/15E148 Safari/604.1', '2025-06-11 10:03:57', '2025-06-11 10:03:57', 'active', NULL, NULL, NULL, NULL),
(392062780, 1, NULL, NULL, 'https://olutus.com/', '102.90.99.169', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '2025-05-21 11:43:13', '2025-05-24 10:19:40', 'active', NULL, NULL, NULL, NULL),
(400658036, 7, NULL, NULL, 'https://skyreignsfinancial.com/app/login.php', '169.0.94.131', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Mobile Safari/537.36', '2025-06-20 22:29:42', '2025-06-20 22:29:42', 'active', NULL, NULL, NULL, NULL),
(416383515, 1, NULL, NULL, 'https://www.olutus.com/', '40.77.189.55', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/112.0.0.0 Safari/537.36', '2025-06-14 04:31:35', '2025-06-14 04:31:35', 'active', NULL, NULL, NULL, NULL),
(431354175, 1, NULL, NULL, 'https://www.olutus.com/', '40.77.188.223', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/112.0.0.0 Safari/537.36', '2025-06-10 20:35:28', '2025-06-10 20:35:28', 'active', NULL, NULL, NULL, NULL),
(431384663, 7, NULL, NULL, 'https://skyreignsfinancial.com/app/login.php', '2401:4900:7436:ded:7cab:e5ff:fe08:3a74', 'Mozilla/5.0 (Linux; Android 15; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.7151.117 Mobile Safari/537.36', '2025-07-06 17:44:15', '2025-07-06 17:44:15', 'active', NULL, NULL, NULL, NULL),
(432518239, 1, NULL, NULL, 'https://diniochat.com/', '60.216.105.162', 'Mozilla/5.0 (Linux; Android 7.0; SM-G950U Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.6422.26 Mobile Safari/537.36', '2025-06-21 13:59:20', '2025-06-21 13:59:20', 'active', NULL, NULL, NULL, NULL),
(435018096, 1, NULL, NULL, 'https://agileproject.site/', '17.241.219.43', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.4 Safari/605.1.15 (Applebot/0.1; +http://www.apple.com/go/applebot)', '2025-06-19 03:10:11', '2025-06-19 03:10:11', 'active', NULL, NULL, NULL, NULL),
(436082135, 1, NULL, NULL, 'https://agileproject.site/', '35.89.192.118', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/68.0.3440.106 Safari/537.36', '2025-07-08 09:50:28', '2025-07-08 09:50:28', 'active', NULL, NULL, NULL, NULL),
(449045197, 1, NULL, NULL, 'https://agileproject.site/', '102.88.113.246', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Mobile Safari/537.36', '2025-06-26 06:58:19', '2025-06-26 06:58:19', 'active', NULL, NULL, NULL, NULL),
(449481974, 1, NULL, NULL, 'https://agileproject.site/', '66.249.64.225', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; Googlebot/2.1; +http://www.google.com/bot.html) Chrome/137.0.7151.68 Safari/537.36', '2025-06-19 05:48:13', '2025-06-19 05:48:13', 'active', NULL, NULL, NULL, NULL),
(450177839, 1, NULL, NULL, 'https://agileproject.site/', '2c0f:2a80:c8:5610:76c1:5b4d:8140:9619', 'Mozilla/5.0 (X11; Linux x86_64; rv:139.0) Gecko/20100101 Firefox/139.0', '2025-06-23 11:19:19', '2025-06-23 11:19:57', 'active', NULL, NULL, NULL, NULL),
(451896723, 7, NULL, NULL, 'https://skyreignsfinancial.com/app/login.php', '51.158.232.122', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Mobile Safari/537.36', '2025-07-16 03:52:15', '2025-07-23 15:07:52', 'active', NULL, NULL, NULL, NULL),
(454798822, 1, NULL, NULL, 'https://agileproject.site//contact.php', '167.114.3.106', '\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36\"', '2025-07-22 09:37:23', '2025-07-22 09:37:23', 'active', NULL, NULL, NULL, NULL),
(470224716, 1, NULL, NULL, 'https://agileproject.site/', '18.246.208.177', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/68.0.3440.106 Safari/537.36', '2025-07-20 12:34:27', '2025-07-20 12:34:27', 'active', NULL, NULL, NULL, NULL),
(474060837, 1, NULL, NULL, 'https://www.turkishcustomsservice.com/', '40.77.190.214', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/136.0.0.0 Safari/537.36', '2025-07-08 19:44:03', '2025-07-08 19:44:03', 'active', NULL, NULL, NULL, NULL),
(479844355, 1, NULL, NULL, 'https://agileproject.site/', '2c0f:2a80:a4b:f410:2ce6:d4a7:f9d8:f2b0', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Mobile Safari/537.36', '2025-06-14 14:44:16', '2025-06-14 14:44:42', 'active', NULL, NULL, NULL, NULL),
(486077845, 1, NULL, NULL, 'https://agileproject.site/', '54.37.10.247', '\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36\"', '2025-07-22 09:37:10', '2025-07-22 09:37:10', 'active', NULL, NULL, NULL, NULL),
(493428501, 1, NULL, NULL, 'https://agileproject.site/', '105.116.0.113', 'Mozilla/5.0 (iPhone; CPU iPhone OS 18_5 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Mobile/15E148 Safari/604.1', '2025-05-22 20:54:42', '2025-05-22 20:54:42', 'active', NULL, NULL, NULL, NULL),
(493858203, 1, NULL, NULL, 'https://diniochat.com/', '52.15.80.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.6045.0 Safari/537.36', '2025-06-29 12:26:46', '2025-06-29 12:26:46', 'active', NULL, NULL, NULL, NULL),
(498677522, 1, NULL, NULL, 'https://agileproject.site/', '205.169.39.43', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/117.0.5938.132 Safari/537.36', '2025-06-21 16:15:28', '2025-06-21 16:15:28', 'active', NULL, NULL, NULL, NULL),
(504749627, 1, NULL, NULL, 'https://agileproject.site/', '104.197.69.115', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/125.0.6422.60 Safari/537.36', '2025-07-17 22:02:53', '2025-07-17 22:02:53', 'active', NULL, NULL, NULL, NULL),
(509190872, 1, NULL, NULL, 'https://agileproject.site/', '102.90.97.132', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:140.0) Gecko/20100101 Firefox/140.0', '2025-07-06 16:04:39', '2025-07-06 16:04:39', 'active', NULL, NULL, NULL, NULL),
(510348676, 7, NULL, NULL, 'https://skyreignsfinancial.com/app/login.php', '186.141.134.92', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Mobile Safari/537.36', '2025-06-13 22:34:52', '2025-06-13 22:34:52', 'active', NULL, NULL, NULL, NULL),
(510469212, 7, NULL, NULL, 'https://www.skyreignsfinancial.com/app/Account/finapp.bragherstudio/view4/index.php', '182.48.82.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '2025-05-23 14:33:59', '2025-05-23 14:45:40', 'active', NULL, NULL, NULL, NULL),
(510780732, 1, NULL, NULL, 'https://agileproject.site/', '35.91.205.2', 'Mozilla/5.0 (Linux; Android 8.0.0; SM-G965U Build/R16NW) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.111 Mobile Safari/537.36', '2025-05-22 16:20:36', '2025-05-22 16:20:36', 'active', NULL, NULL, NULL, NULL),
(515053694, 7, NULL, NULL, 'https://skyreignsfinancial.com/', '207.46.13.17', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/112.0.0.0 Safari/537.36', '2025-06-04 20:23:33', '2025-06-04 20:23:33', 'active', NULL, NULL, NULL, NULL),
(518060756, 1, NULL, NULL, 'http://www.olutus.com/', '40.77.179.162', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/136.0.0.0 Safari/537.36', '2025-08-05 16:41:18', '2025-08-05 16:41:18', 'active', NULL, NULL, NULL, NULL),
(522505035, 1, NULL, NULL, 'https://diniochat.com/', '54.91.247.133', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', '2025-06-12 16:35:05', '2025-06-12 16:35:05', 'active', NULL, NULL, NULL, NULL),
(525101922, 1, NULL, NULL, 'https://diniochat.com/', '69.160.160.59', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/92.0.4515.107 Safari/537.36', '2025-07-14 01:07:46', '2025-07-14 01:07:46', 'active', NULL, NULL, NULL, NULL),
(525629200, 1, NULL, NULL, 'https://agileproject.site/', '66.249.64.227', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.7151.119 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '2025-07-26 20:37:31', '2025-07-26 20:37:31', 'active', NULL, NULL, NULL, NULL),
(530984468, 7, NULL, NULL, 'https://www.skyreignsfinancial.com/app/login.php', '38.25.50.72', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-08-05 22:57:14', '2025-08-05 22:57:14', 'active', NULL, NULL, NULL, NULL),
(540309834, 1, NULL, NULL, 'https://agileproject.site/', '34.122.147.229', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/125.0.6422.60 Safari/537.36', '2025-05-23 12:53:16', '2025-05-23 12:53:16', 'active', NULL, NULL, NULL, NULL),
(542859168, 7, NULL, NULL, 'https://skyreignsfinancial.com/app/login.php', '40.77.190.86', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/112.0.0.0 Safari/537.36', '2025-06-13 20:27:05', '2025-06-13 20:27:05', 'active', NULL, NULL, NULL, NULL),
(546052336, 1, NULL, NULL, 'https://agileproject.site/', '66.249.64.224', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; Googlebot/2.1; +http://www.google.com/bot.html) Chrome/137.0.7151.68 Safari/537.36', '2025-06-21 15:06:11', '2025-06-21 15:06:11', 'active', NULL, NULL, NULL, NULL),
(553393191, 7, NULL, NULL, 'https://skyreignsfinancial.com/app/Account/finapp.bragherstudio/view4/index.php', '200.82.143.31', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Mobile Safari/537.36', '2025-06-05 20:30:26', '2025-06-05 22:28:14', 'active', NULL, NULL, NULL, NULL),
(555485722, 1, NULL, NULL, 'https://agileproject.site/', '102.90.47.18', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Mobile Safari/537.36', '2025-07-31 12:01:13', '2025-07-31 12:01:13', 'active', NULL, NULL, NULL, NULL),
(556812823, 1, NULL, NULL, 'https://agileproject.site/index.php', '66.249.70.167', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.7151.119 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '2025-07-13 06:13:17', '2025-07-13 06:13:17', 'active', NULL, NULL, NULL, NULL),
(561759963, 1, NULL, NULL, 'https://agileproject.site/', '205.169.39.200', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.79 Safari/537.36', '2025-06-21 16:11:07', '2025-06-21 16:11:07', 'active', NULL, NULL, NULL, NULL),
(561901154, 1, NULL, NULL, 'https://remottejob.com/', '102.90.99.169', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '2025-05-21 13:48:50', '2025-06-06 10:29:48', 'active', NULL, NULL, NULL, NULL),
(571376296, 1, NULL, NULL, 'https://agileproject.site/', '34.215.157.232', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/68.0.3440.106 Safari/537.36', '2025-07-23 14:07:41', '2025-07-23 14:07:41', 'active', NULL, NULL, NULL, NULL),
(571757621, 7, NULL, NULL, 'https://skyreignsfinancial.com/', '105.116.0.111', 'Mozilla/5.0 (iPhone; CPU iPhone OS 18_5 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Mobile/15E148 Safari/604.1', '2025-06-04 19:15:18', '2025-06-04 19:16:06', 'active', NULL, NULL, NULL, NULL),
(573776111, 1, NULL, NULL, 'https://agileproject.site/index.php', '66.249.64.224', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.7151.68 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '2025-06-18 13:45:07', '2025-06-18 13:45:07', 'active', NULL, NULL, NULL, NULL),
(576587960, 1, NULL, NULL, 'https://agileproject.site/', '221.217.124.115', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/133.0.0.0 Safari/537.36', '2025-06-23 23:37:56', '2025-06-23 23:38:06', 'active', NULL, NULL, NULL, NULL),
(578448476, 1, NULL, NULL, 'https://agileproject.site/', '66.249.64.227', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.7151.119 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '2025-07-26 20:37:52', '2025-07-26 20:37:52', 'active', NULL, NULL, NULL, NULL),
(578955582, 1, NULL, NULL, 'https://agileproject.site/', '54.186.10.59', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/68.0.3440.106 Safari/537.36', '2025-06-11 10:51:27', '2025-06-11 10:51:27', 'active', NULL, NULL, NULL, NULL),
(579396135, 7, NULL, NULL, 'https://skyreignsfinancial.com/app/login.php', '103.109.239.227', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Mobile Safari/537.36', '2025-06-29 07:58:38', '2025-06-29 07:58:38', 'active', NULL, NULL, NULL, NULL),
(591701995, 1, NULL, NULL, 'https://agileproject.site/', '66.249.64.36', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.7103.113 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '2025-06-11 13:39:04', '2025-06-11 13:39:04', 'active', NULL, NULL, NULL, NULL),
(592729896, 1, NULL, NULL, 'https://agileproject.site/#tgWebAppData=user%3D%257B%2522id%2522%253A6635037636%252C%2522first_name%2522%253A%2522Ebisintei%2522%252C%2522last_name%2522%253A%2522%2522%252C%2522username%2522%253A%2522ebisintei%2522%252C%2522language_code%2522%253A%2522en%', '102.90.100.188', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36 Edg/136.0.0.0', '2025-06-03 17:14:31', '2025-06-03 17:14:41', 'active', NULL, NULL, NULL, NULL),
(597697672, 1, NULL, NULL, 'https://agileproject.site/', '66.249.64.227', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.7151.119 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '2025-07-18 13:42:31', '2025-07-18 13:42:31', 'active', NULL, NULL, NULL, NULL),
(600922864, 1, NULL, NULL, 'https://agileproject.site/', '66.249.64.234', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.7151.68 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '2025-06-21 15:06:11', '2025-06-21 15:06:11', 'active', NULL, NULL, NULL, NULL),
(602664381, 1, NULL, NULL, 'https://agileproject.site/', '136.0.88.165', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', '2025-06-27 21:15:43', '2025-06-27 21:15:43', 'active', NULL, NULL, NULL, NULL),
(606813160, 1, NULL, NULL, 'https://agileproject.site/', '105.116.0.113', 'Mozilla/5.0 (iPhone; CPU iPhone OS 18_5 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Mobile/15E148 Safari/604.1 Ddg/18.5', '2025-05-22 17:35:12', '2025-05-22 18:36:09', 'active', NULL, NULL, NULL, NULL);
INSERT INTO `visitors` (`id`, `user_id`, `name`, `email`, `url`, `ip_address`, `user_agent`, `created_at`, `last_active`, `status`, `device_type`, `country`, `browser`, `last_activity`) VALUES
(619456966, 1, NULL, NULL, 'https://agileproject.site/', '66.249.64.234', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; Googlebot/2.1; +http://www.google.com/bot.html) Chrome/137.0.7151.68 Safari/537.36', '2025-06-29 08:41:14', '2025-06-29 08:41:14', 'active', NULL, NULL, NULL, NULL),
(621976168, 7, NULL, NULL, 'https://skyreignsfinancial.com/app/login.php', '40.77.188.98', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/136.0.0.0 Safari/537.36', '2025-07-04 06:36:28', '2025-07-04 06:36:28', 'active', NULL, NULL, NULL, NULL),
(629457825, 7, NULL, NULL, 'https://skyreignsfinancial.com/app/login.php', '220.247.164.24', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-02 05:05:43', '2025-07-02 05:05:43', 'active', NULL, NULL, NULL, NULL),
(634234102, 7, NULL, NULL, 'https://skyreignsfinancial.com/app/login.php', '173.249.39.107', 'Mozilla/5.0 (Linux; Android 13; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.7204.168 Mobile Safari/537.36', '2025-08-04 15:09:49', '2025-08-04 15:10:20', 'active', NULL, NULL, NULL, NULL),
(655360233, 1, NULL, NULL, 'https://agileproject.site/', '146.112.163.42', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', '2025-07-25 03:36:45', '2025-07-25 03:36:45', 'active', NULL, NULL, NULL, NULL),
(662718317, 7, NULL, NULL, 'https://skyreignsfinancial.com/app/login.php', '94.75.206.226', 'Mozilla/5.0 (iPhone; CPU iPhone OS 18_5 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Mobile/15E148 Safari/604.1', '2025-07-13 15:37:18', '2025-07-13 15:37:18', 'active', NULL, NULL, NULL, NULL),
(664302050, 1, NULL, NULL, 'https://agileproject.site//contact.php', '194.35.121.221', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-30 22:59:19', '2025-07-30 23:00:16', 'active', NULL, NULL, NULL, NULL),
(666689088, 1, NULL, NULL, 'https://agileproject.site/', '66.249.64.234', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.7151.68 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '2025-06-29 08:41:15', '2025-06-29 08:41:15', 'active', NULL, NULL, NULL, NULL),
(669161987, 7, NULL, NULL, 'https://www.skyreignsfinancial.com/app/Account/finapp.bragherstudio/view4/app-cards.php', '2401:4900:4a99:5c75:2:1:bf40:4d52', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Mobile Safari/537.36', '2025-05-24 06:14:22', '2025-05-25 00:20:26', 'active', NULL, NULL, NULL, NULL),
(673033710, 7, NULL, NULL, 'https://skyreignsfinancial.com/app/Account/finapp.bragherstudio/view4/index.php', '131.196.112.163', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Mobile Safari/537.36', '2025-06-06 18:35:50', '2025-06-06 18:50:38', 'active', NULL, NULL, NULL, NULL),
(678796304, 1, NULL, NULL, 'https://agileproject.site/', '66.249.64.39', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.7151.119 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '2025-07-20 03:19:41', '2025-07-20 03:19:41', 'active', NULL, NULL, NULL, NULL),
(684838634, 1, NULL, NULL, 'https://agileproject.site//contact.php', '116.202.20.228', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', '2025-06-12 21:50:36', '2025-06-12 21:50:36', 'active', NULL, NULL, NULL, NULL),
(685883043, 1, NULL, NULL, 'https://agileproject.site/', '84.239.27.165', 'Mozilla/5.0 (iPhone; CPU iPhone OS 18_3_2 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.3.1 Mobile/15E148 Safari/604.1', '2025-07-05 07:38:33', '2025-07-05 07:39:43', 'active', NULL, NULL, NULL, NULL),
(687997657, 1, NULL, NULL, 'https://agileproject.site/', '49.13.121.114', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', '2025-06-12 16:30:51', '2025-06-12 16:30:51', 'active', NULL, NULL, NULL, NULL),
(688937799, 1, NULL, NULL, 'https://agileproject.site//about.php', '2001:41d0:701:1100::2444', '\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36\"', '2025-07-22 09:37:12', '2025-07-22 09:37:12', 'active', NULL, NULL, NULL, NULL),
(691268193, 7, NULL, NULL, 'https://www.skyreignsfinancial.com/app/Account/finapp.bragherstudio/view4/index.php', '67.230.43.132', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '2025-05-23 17:13:43', '2025-05-23 17:13:43', 'active', NULL, NULL, NULL, NULL),
(695195672, 7, NULL, NULL, 'https://skyreignsfinancial.com/app/login.php', '182.183.37.110', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Mobile Safari/537.36', '2025-07-03 12:58:10', '2025-07-03 12:58:10', 'active', NULL, NULL, NULL, NULL),
(696486360, 7, NULL, NULL, 'http://www.skyreignsfinancial.com/app/login.php', '49.149.65.9', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Mobile Safari/537.36', '2025-06-30 16:25:25', '2025-06-30 16:25:45', 'active', NULL, NULL, NULL, NULL),
(698341669, 1, NULL, NULL, 'https://agileproject.site/', '54.201.68.110', 'Mozilla/5.0 (Linux; Android 8.0.0; SM-G965U Build/R16NW) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.111 Mobile Safari/537.36', '2025-05-22 07:26:52', '2025-05-22 07:26:52', 'active', NULL, NULL, NULL, NULL),
(699389925, 1, NULL, NULL, 'https://agileproject.site/', '66.249.70.170', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; Googlebot/2.1; +http://www.google.com/bot.html) Chrome/137.0.7151.119 Safari/537.36', '2025-07-09 13:56:05', '2025-07-09 13:56:05', 'active', NULL, NULL, NULL, NULL),
(699450254, 7, NULL, NULL, 'https://skyreignsfinancial.com/app/login.php', '103.141.174.233', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-08-03 05:34:42', '2025-08-03 05:34:42', 'active', NULL, NULL, NULL, NULL),
(699658294, 7, NULL, NULL, 'https://skyreignsfinancial.com/app/login.php', '40.77.190.92', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/112.0.0.0 Safari/537.36', '2025-06-09 13:32:08', '2025-06-09 13:32:08', 'active', NULL, NULL, NULL, NULL),
(703857871, 1, NULL, NULL, 'https://agileproject.site/', '102.90.103.229', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Mobile Safari/537.36', '2025-05-22 10:12:43', '2025-05-22 10:12:43', 'active', NULL, NULL, NULL, NULL),
(704840265, 1, NULL, NULL, 'https://agileproject.site/', '66.249.64.40', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; Googlebot/2.1; +http://www.google.com/bot.html) Chrome/137.0.7151.119 Safari/537.36', '2025-07-20 03:19:42', '2025-07-20 03:19:42', 'active', NULL, NULL, NULL, NULL),
(706940783, 1, NULL, NULL, 'https://diniochat.com/', '205.169.39.58', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/117.0.5938.132 Safari/537.36', '2025-06-26 04:12:26', '2025-06-26 04:12:26', 'active', NULL, NULL, NULL, NULL),
(710405165, 1, NULL, NULL, 'https://agileproject.site/', '185.202.220.92', 'Mozilla/5.0 (iPhone; CPU iPhone OS 18_4_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/136.0.7103.91 Mobile/15E148 Safari/604.1', '2025-05-23 08:42:04', '2025-05-23 08:42:04', 'active', NULL, NULL, NULL, NULL),
(713633002, 1, NULL, NULL, 'https://diniochat.com/', '40.77.177.98', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/136.0.0.0 Safari/537.36', '2025-07-23 10:02:53', '2025-07-23 10:02:53', 'active', NULL, NULL, NULL, NULL),
(717276895, 15, NULL, NULL, 'https://juniordiceglobalpay.com/', '105.113.8.74', 'Mozilla/5.0 (iPhone; CPU iPhone OS 18_2 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.2 Mobile/22C152 Safari/604.1', '2025-06-03 17:54:18', '2025-06-03 17:54:24', 'active', NULL, NULL, NULL, NULL),
(728917863, 7, NULL, NULL, 'https://skyreignsfinancial.com/app/Account/finapp.bragherstudio/view4/index.php', '181.1.161.131', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Mobile Safari/537.36', '2025-05-22 21:52:21', '2025-05-22 22:47:35', 'active', NULL, NULL, NULL, NULL),
(734458122, 7, NULL, NULL, 'https://skyreignsfinancial.com/app/login.php', '190.6.43.43', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Mobile Safari/537.36', '2025-07-16 16:19:42', '2025-07-16 18:14:52', 'active', NULL, NULL, NULL, NULL),
(738068377, 7, NULL, NULL, 'https://www.skyreignsfinancial.com/app/Account/finapp.bragherstudio/view4/index.php', '2a00:23c7:8954:ac01:dc57:12d8:29bb:9a1f', 'Mozilla/5.0 (iPhone; CPU iPhone OS 18_5 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Mobile/15E148 Safari/604.1', '2025-06-06 14:36:06', '2025-06-06 14:36:06', 'active', NULL, NULL, NULL, NULL),
(738453815, 7, NULL, NULL, 'https://www.skyreignsfinancial.com/app/Account/finapp.bragherstudio/view4/index.php', '212.183.242.149', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-13 16:56:47', '2025-06-13 17:10:47', 'active', NULL, NULL, NULL, NULL),
(739739996, 7, NULL, NULL, 'https://skyreignsfinancial.com/app/Account/finapp.bragherstudio/view4/settings.php', '102.213.52.29', 'Mozilla/5.0 (Linux; Android 14; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.7103.125 Mobile Safari/537.36', '2025-06-07 23:45:30', '2025-06-07 23:46:33', 'active', NULL, NULL, NULL, NULL),
(746545452, 7, NULL, NULL, 'https://skyreignsfinancial.com/app/login.php', '40.77.177.174', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/136.0.0.0 Safari/537.36', '2025-07-28 16:26:41', '2025-07-28 16:26:41', 'active', NULL, NULL, NULL, NULL),
(751155782, 7, NULL, NULL, 'https://skyreignsfinancial.com/', '40.77.190.148', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/112.0.0.0 Safari/537.36', '2025-05-23 20:03:52', '2025-05-23 20:03:52', 'active', NULL, NULL, NULL, NULL),
(756392044, 1, NULL, NULL, 'https://agileproject.site/', '202.8.43.78', 'Mozilla/5.0 (compatible; AhrefsBot/7.0; +http://ahrefs.com/robot/)', '2025-06-26 12:02:16', '2025-06-26 12:02:16', 'active', NULL, NULL, NULL, NULL),
(762351443, 1, NULL, NULL, 'http://www.olutus.com/', '40.77.190.209', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/136.0.0.0 Safari/537.36', '2025-07-03 06:34:38', '2025-07-03 06:34:38', 'active', NULL, NULL, NULL, NULL),
(764330427, 7, NULL, NULL, 'https://skyreignsfinancial.com/app/login.php', '152.206.199.213', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Mobile Safari/537.36', '2025-06-19 18:55:27', '2025-06-19 18:55:27', 'active', NULL, NULL, NULL, NULL),
(765262161, 1, NULL, NULL, 'https://agileproject.site/', '54.201.68.110', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', '2025-05-22 07:26:48', '2025-05-22 07:26:48', 'active', NULL, NULL, NULL, NULL),
(768284356, 1, NULL, NULL, 'https://agileproject.site/', '102.90.117.50', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '2025-05-22 08:56:35', '2025-05-28 14:45:12', 'active', NULL, NULL, NULL, NULL),
(768398567, 1, NULL, NULL, 'https://agileproject.site/', '185.190.141.65', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-30 12:15:38', '2025-08-06 05:55:55', 'active', NULL, NULL, NULL, NULL),
(769396050, 7, NULL, NULL, 'https://skyreignsfinancial.com/app/login.php', '40.77.188.64', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/112.0.0.0 Safari/537.36', '2025-06-27 04:31:11', '2025-06-27 04:31:11', 'active', NULL, NULL, NULL, NULL),
(777101699, 7, NULL, NULL, 'https://skyreignsfinancial.com/app/login.php', '40.77.189.87', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/112.0.0.0 Safari/537.36', '2025-06-18 17:28:37', '2025-06-18 17:28:37', 'active', NULL, NULL, NULL, NULL),
(784221135, 1, NULL, NULL, 'https://agileproject.site/#tgWebAppData=user%3D%257B%2522id%2522%253A5001534207%252C%2522first_name%2522%253A%2522Code%2522%252C%2522last_name%2522%253A%2522Master%2522%252C%2522username%2522%253A%2522code_master9906%2522%252C%2522language_code%2522%253A%', '102.90.98.151', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_2 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/15E148', '2025-05-21 22:01:07', '2025-05-21 22:01:07', 'active', NULL, NULL, NULL, NULL),
(784328791, 7, NULL, NULL, 'https://skyreignsfinancial.com/app/login.php', '2409:408a:1c33:62a6::484a:2515', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 SamsungBrowser/7.4 Chrome/138.0.7204.168 Safari/537.36', '2025-08-06 02:28:27', '2025-08-06 02:30:41', 'active', NULL, NULL, NULL, NULL),
(791411053, 1, NULL, NULL, 'https://agileproject.site/', '197.210.54.227', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/28.0 Chrome/130.0.0.0 Mobile Safari/537.36', '2025-06-04 21:54:06', '2025-06-04 21:54:06', 'active', NULL, NULL, NULL, NULL),
(792074616, 1, NULL, NULL, 'https://agileproject.site/', '35.164.235.121', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/68.0.3440.106 Safari/537.36', '2025-07-17 11:08:49', '2025-07-17 11:08:49', 'active', NULL, NULL, NULL, NULL),
(796107515, 7, NULL, NULL, 'https://skyreignsfinancial.com/app/login.php', '40.77.190.182', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/136.0.0.0 Safari/537.36', '2025-06-29 03:35:28', '2025-06-29 03:35:28', 'active', NULL, NULL, NULL, NULL),
(798977764, 1, NULL, NULL, 'https://agileproject.site/', '105.116.0.113', 'Mozilla/5.0 (iPhone; CPU iPhone OS 18_5 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Mobile/15E148 Safari/604.1', '2025-05-22 13:37:35', '2025-05-22 13:37:35', 'active', NULL, NULL, NULL, NULL),
(802431139, 1, NULL, NULL, 'https://agileproject.site/', '34.217.121.134', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/68.0.3440.106 Safari/537.36', '2025-07-02 14:26:22', '2025-07-02 14:26:22', 'active', NULL, NULL, NULL, NULL),
(803338301, 1, NULL, NULL, 'https://agileproject.site/', '105.113.75.17', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Mobile Safari/537.36', '2025-06-14 14:42:17', '2025-06-14 14:42:17', 'active', NULL, NULL, NULL, NULL),
(810928151, 1, NULL, NULL, 'https://agileproject.site//about.php', '157.90.241.205', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', '2025-06-12 21:19:39', '2025-06-12 21:19:39', 'active', NULL, NULL, NULL, NULL),
(818724664, 7, NULL, NULL, 'https://skyreignsfinancial.com/app/login.php', '45.244.10.231', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-07-06 14:31:11', '2025-07-06 14:31:27', 'active', NULL, NULL, NULL, NULL),
(821288342, 7, NULL, NULL, 'https://skyreignsfinancial.com/app/login.php', '94.47.32.251', 'Mozilla/5.0 (Linux; Android 12; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.7204.3 Mobile Safari/537.36', '2025-06-24 04:37:25', '2025-06-24 04:37:46', 'active', NULL, NULL, NULL, NULL),
(825421932, 1, NULL, NULL, 'https://www.olutus.com/', '40.77.179.146', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/136.0.0.0 Safari/537.36', '2025-07-15 22:52:09', '2025-07-15 22:52:09', 'active', NULL, NULL, NULL, NULL),
(825669043, 1, NULL, NULL, 'https://agileproject.site/', '18.236.196.79', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/68.0.3440.106 Safari/537.36', '2025-07-11 12:26:59', '2025-07-11 12:26:59', 'active', NULL, NULL, NULL, NULL),
(828263658, 7, NULL, NULL, 'https://skyreignsfinancial.com/app/Account/finapp.bragherstudio/view4/index.php', '2404:1c40:483:b543:1846:67e1:bcb9:e290', 'Mozilla/5.0 (Linux; Android 14; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.7151.61 Mobile Safari/537.36', '2025-06-06 18:39:04', '2025-06-06 18:40:31', 'active', NULL, NULL, NULL, NULL),
(830502563, 15, NULL, NULL, 'https://juniordiceglobalpay.com/banking//user/loan.php', '2401:4900:1c3f:cf4b:308d:1e1:5889:38b3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-03 19:24:59', '2025-06-03 19:24:59', 'active', NULL, NULL, NULL, NULL),
(832513946, 1, NULL, NULL, 'https://diniochat.com/', '54.174.140.70', 'Mozilla/5.0 (X11; Linux aarch64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/131.0.6778.33 Safari/537.36', '2025-06-14 00:43:25', '2025-06-14 00:43:25', 'active', NULL, NULL, NULL, NULL),
(835160615, 1, NULL, NULL, 'https://agileproject.site/', '102.90.118.73', 'Mozilla/5.0 (iPhone; CPU iPhone OS 18_4_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.4 Mobile/15E148 Safari/604.1', '2025-05-22 14:01:33', '2025-05-26 12:23:18', 'active', NULL, NULL, NULL, NULL),
(849288196, 1, NULL, NULL, 'https://diniochat.com/', '40.77.177.110', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/136.0.0.0 Safari/537.36', '2025-07-16 03:35:20', '2025-07-16 03:35:20', 'active', NULL, NULL, NULL, NULL),
(858656015, 7, NULL, NULL, 'https://skyreignsfinancial.com/app/login.php', '119.155.187.93', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Mobile Safari/537.36', '2025-07-02 05:19:59', '2025-07-02 05:20:16', 'active', NULL, NULL, NULL, NULL),
(859064919, 1, NULL, NULL, 'https://agileproject.site/index.php', '66.249.70.169', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; Googlebot/2.1; +http://www.google.com/bot.html) Chrome/137.0.7151.119 Safari/537.36', '2025-07-09 09:49:36', '2025-07-09 09:49:36', 'active', NULL, NULL, NULL, NULL),
(865188878, 7, NULL, NULL, 'https://skyreignsfinancial.com/app/login.php', '40.77.190.214', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/112.0.0.0 Safari/537.36', '2025-06-06 01:35:40', '2025-06-06 01:35:40', 'active', NULL, NULL, NULL, NULL),
(865399377, 7, NULL, NULL, 'https://skyreignsfinancial.com/app/login.php', '102.66.181.112', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Mobile Safari/537.36', '2025-07-04 15:58:13', '2025-07-04 15:58:13', 'active', NULL, NULL, NULL, NULL),
(869125141, 1, NULL, NULL, 'https://agileproject.site/index.php', '66.249.64.234', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.7151.68 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '2025-06-29 08:41:12', '2025-06-29 08:41:12', 'active', NULL, NULL, NULL, NULL),
(876552325, 1, NULL, NULL, 'https://agileproject.site/index.php', '66.249.64.224', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; Googlebot/2.1; +http://www.google.com/bot.html) Chrome/137.0.7151.68 Safari/537.36', '2025-06-18 13:45:06', '2025-06-18 13:45:06', 'active', NULL, NULL, NULL, NULL),
(877079316, 7, NULL, NULL, 'https://www.skyreignsfinancial.com/app/login.php', '41.180.71.158', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Mobile Safari/537.36', '2025-07-08 12:14:19', '2025-07-08 12:14:19', 'active', NULL, NULL, NULL, NULL),
(880598714, 7, NULL, NULL, 'https://skyreignsfinancial.com/app/Account/finapp.bragherstudio/view4/settings.php', '187.191.39.86', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Mobile Safari/537.36', '2025-06-13 22:47:32', '2025-06-13 22:47:32', 'active', NULL, NULL, NULL, NULL),
(883643692, 7, NULL, NULL, 'http://www.skyreignsfinancial.com/app/Account/finapp.bragherstudio/view4/index.php', '102.213.52.29', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Mobile Safari/537.36', '2025-06-08 12:56:41', '2025-06-08 12:56:41', 'active', NULL, NULL, NULL, NULL),
(885598646, 7, NULL, NULL, 'https://skyreignsfinancial.com/app/login.php', '103.109.92.197', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.7151.115 Mobile Safari/537.36', '2025-07-06 17:28:03', '2025-07-06 17:30:18', 'active', NULL, NULL, NULL, NULL),
(886427581, 7, NULL, NULL, 'https://skyreignsfinancial.com/app/login.php', '39.62.208.65', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Mobile Safari/537.36', '2025-07-26 08:54:29', '2025-07-26 08:54:55', 'active', NULL, NULL, NULL, NULL),
(896710270, 1, NULL, NULL, 'https://agileproject.site/', '154.161.184.197', 'Mozilla/5.0 (iPhone; CPU iPhone OS 18_0_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.0.1 Mobile/15E148 Safari/604.1', '2025-05-22 15:42:41', '2025-05-22 15:42:41', 'active', NULL, NULL, NULL, NULL),
(900043237, 1, NULL, NULL, 'https://agileproject.site/', '66.249.64.225', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.7151.68 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '2025-06-19 05:48:13', '2025-06-19 05:48:13', 'active', NULL, NULL, NULL, NULL),
(901288399, 1, NULL, NULL, 'https://agileproject.site/', '69.160.160.58', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/80.0.3987.163 Safari/537.36', '2025-06-06 16:20:41', '2025-06-06 16:20:41', 'active', NULL, NULL, NULL, NULL),
(902848352, 1, NULL, NULL, 'https://www.turkishcustomsservice.com/', '40.77.179.162', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/136.0.0.0 Safari/537.36', '2025-07-28 20:36:41', '2025-07-28 20:36:41', 'active', NULL, NULL, NULL, NULL),
(905224994, 7, NULL, NULL, 'https://skyreignsfinancial.com/app/login.php', '2407:c00:e000:af14:1:0:e251:64fe', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Mobile Safari/537.36', '2025-07-12 01:18:51', '2025-07-12 03:38:27', 'active', NULL, NULL, NULL, NULL),
(906982505, 7, NULL, NULL, 'https://skyreignsfinancial.com/app/login.php', '65.55.210.149', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/136.0.0.0 Safari/537.36', '2025-07-10 18:26:35', '2025-07-10 18:26:35', 'active', NULL, NULL, NULL, NULL),
(908848309, 7, NULL, NULL, 'https://skyreignsfinancial.com/app/login.php', '103.24.16.20', 'Mozilla/5.0 (Linux; Android 14; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.7151.61 Mobile Safari/537.36', '2025-06-09 14:48:20', '2025-06-09 14:48:20', 'active', NULL, NULL, NULL, NULL),
(914806592, 1, NULL, NULL, 'https://agileproject.site/', '102.90.99.169', 'Mozilla/5.0 (iPhone; CPU iPhone OS 18_4_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/136.0.7103.91 Mobile/15E148 Safari/604.1', '2025-05-21 21:08:49', '2025-07-05 07:36:11', 'active', NULL, NULL, NULL, NULL),
(915602670, 1, NULL, NULL, 'https://agileproject.site/', '104.253.214.126', 'Mozilla/5.0 (iPhone; CPU iPhone OS 17_4_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/123.0.6312.52 Mobile/15E148 Safari/604.1', '2025-05-22 23:59:02', '2025-05-22 23:59:02', 'active', NULL, NULL, NULL, NULL),
(915602671, 7, NULL, NULL, 'https://skyreignsfinancial.com/app/login.php', '40.77.190.110', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/112.0.0.0 Safari/537.36', '2025-05-24 13:36:00', '2025-05-24 13:36:00', 'active', NULL, NULL, NULL, NULL),
(915602672, 7, NULL, NULL, 'https://skyreignsfinancial.com/index.php', '40.77.188.195', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/112.0.0.0 Safari/537.36', '2025-05-24 13:49:15', '2025-05-24 13:49:15', 'active', NULL, NULL, NULL, NULL),
(915602673, 10, NULL, NULL, 'https://remottejob.com/', '102.90.97.169', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '2025-05-24 15:18:51', '2025-05-24 15:18:51', 'active', NULL, NULL, NULL, NULL),
(915602674, 1, NULL, NULL, 'https://agileproject.site/', '34.220.126.110', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/68.0.3440.106 Safari/537.36', '2025-05-24 20:59:40', '2025-05-24 20:59:40', 'active', NULL, NULL, NULL, NULL),
(915602675, 1, NULL, NULL, 'https://agileproject.site/', '105.116.10.42', 'Mozilla/5.0 (iPhone; CPU iPhone OS 18_5 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Mobile/15E148 Safari/604.1', '2025-05-24 22:36:00', '2025-05-25 21:25:36', 'active', NULL, NULL, NULL, NULL),
(915602676, 1, NULL, NULL, 'https://diniochat.com/', '34.207.55.7', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', '2025-05-24 23:53:38', '2025-05-24 23:53:38', 'active', NULL, NULL, NULL, NULL),
(915602677, 1, NULL, NULL, 'https://diniochat.com/', '2001:bc8:1da0:15:b6b5:2fff:fe54:46ec', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.3', '2025-05-25 00:17:15', '2025-05-25 00:17:15', 'active', NULL, NULL, NULL, NULL),
(915602678, 7, NULL, NULL, 'https://skyreignsfinancial.com/app/Account/finapp.bragherstudio/view4/settings.php', '152.206.192.0', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Mobile Safari/537.36', '2025-05-25 10:18:01', '2025-05-25 10:18:01', 'active', NULL, NULL, NULL, NULL),
(915602679, 1, NULL, NULL, 'https://diniochat.com/', '2001:bc8:701:1d:ba2a:72ff:fee0:8c42', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.3', '2025-05-25 12:10:45', '2025-05-25 12:10:45', 'active', NULL, NULL, NULL, NULL),
(915602680, 1, NULL, NULL, 'https://www.turkishcustomsservice.com/', '40.77.189.116', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/112.0.0.0 Safari/537.36', '2025-05-25 15:18:24', '2025-05-25 15:18:24', 'active', NULL, NULL, NULL, NULL),
(915602681, 1, NULL, NULL, 'https://agileproject.site/', '202.8.43.78', 'Mozilla/5.0 (compatible; AhrefsBot/7.0; +http://ahrefs.com/robot/)', '2025-05-25 15:52:20', '2025-05-25 15:52:20', 'active', NULL, NULL, NULL, NULL),
(915602682, 7, NULL, NULL, 'https://skyreignsfinancial.com/app/Account/finapp.bragherstudio/view4/index.php', '89.215.130.34', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Mobile Safari/537.36', '2025-05-25 16:39:08', '2025-05-25 16:39:30', 'active', NULL, NULL, NULL, NULL),
(915602683, 10, NULL, NULL, 'https://remottejob.com/', '105.113.118.185', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '2025-05-25 17:17:12', '2025-05-25 18:20:46', 'active', NULL, NULL, NULL, NULL),
(915602684, 7, NULL, NULL, 'https://skyreignsfinancial.com/app/Account/finapp.bragherstudio/view4/index.php', '212.39.89.195', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Mobile Safari/537.36', '2025-05-25 18:16:40', '2025-05-25 21:27:09', 'active', NULL, NULL, NULL, NULL),
(915602685, 10, NULL, NULL, 'https://remottejob.com/', '105.113.57.149', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '2025-05-25 19:00:20', '2025-05-25 19:06:25', 'active', NULL, NULL, NULL, NULL),
(915602686, 1, NULL, NULL, 'https://tazanglobalcentral.com/about.html', '105.113.57.149', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '2025-05-25 19:09:17', '2025-05-25 19:09:40', 'active', NULL, NULL, NULL, NULL),
(915602687, 1, NULL, NULL, 'https://agileproject.site/#tgWebAppData=user%3D%257B%2522id%2522%253A7782795850%252C%2522first_name%2522%253A%2522Tazan%2522%252C%2522last_name%2522%253A%2522Agency%2522%252C%2522username%2522%253A%2522TazanAgency%2522%252C%2522language_code%2522%253A%252', '105.113.80.137', 'Mozilla/5.0 (iPhone; CPU iPhone OS 18_4_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/15E148', '2025-05-25 19:59:28', '2025-06-03 17:36:59', 'active', NULL, NULL, NULL, NULL),
(915602688, 7, NULL, NULL, 'https://skyreignsfinancial.com/app/Account/finapp.bragherstudio/view4/index.php', '2a01:5a8:437:a7de:196c:1924:137f:eb16', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Mobile Safari/537.36', '2025-05-25 20:46:34', '2025-05-25 20:46:34', 'active', NULL, NULL, NULL, NULL),
(915602689, 7, NULL, NULL, 'https://skyreignsfinancial.com/app/Account/finapp.bragherstudio/view4/index.php', '200.88.238.75', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Mobile Safari/537.36', '2025-05-26 05:40:03', '2025-05-26 05:40:03', 'active', NULL, NULL, NULL, NULL),
(915602690, 7, NULL, NULL, 'https://skyreignsfinancial.com/app/Account/finapp.bragherstudio/view4/index.php', '186.12.68.147', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Mobile Safari/537.36', '2025-05-26 13:21:43', '2025-05-26 13:21:47', 'active', NULL, NULL, NULL, NULL),
(915602691, 10, NULL, NULL, 'https://remottejob.com/', '102.90.80.47', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '2025-05-26 13:24:48', '2025-05-26 13:24:51', 'active', NULL, NULL, NULL, NULL),
(915602692, 1, NULL, NULL, 'https://diniochat.com/', '40.77.190.119', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/112.0.0.0 Safari/537.36', '2025-05-26 16:54:03', '2025-05-26 16:54:03', 'active', NULL, NULL, NULL, NULL),
(915602693, 1, NULL, NULL, 'https://diniochat.com/', '49.13.22.153', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', '2025-05-26 18:28:21', '2025-05-26 18:28:21', 'active', NULL, NULL, NULL, NULL),
(915602694, 7, NULL, NULL, 'http://www.skyreignsfinancial.com/app/Account/finapp.bragherstudio/view4/index.php', '197.38.105.125', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', '2025-05-26 19:38:00', '2025-05-26 19:38:08', 'active', NULL, NULL, NULL, NULL),
(915602695, 1, NULL, NULL, 'https://diniochat.com/', '205.169.39.19', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/117.0.5938.132 Safari/537.36', '2025-05-26 23:37:46', '2025-05-26 23:37:46', 'active', NULL, NULL, NULL, NULL),
(915602696, 1, NULL, NULL, 'https://diniochat.com/', '2001:bc8:1201:1f:ba2a:72ff:fee1:1aae', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.3', '2025-05-27 06:30:45', '2025-05-27 06:30:45', 'active', NULL, NULL, NULL, NULL),
(915602697, 1, NULL, NULL, 'https://agileproject.site/index.php', '66.249.64.38', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.7103.92 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '2025-05-27 11:40:49', '2025-05-27 18:57:31', 'active', NULL, NULL, NULL, NULL),
(915602698, 1, NULL, NULL, 'https://agileproject.site/', '205.169.39.231', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.79 Safari/537.36', '2025-05-27 13:50:05', '2025-05-27 13:50:05', 'active', NULL, NULL, NULL, NULL),
(915602699, 1, NULL, NULL, 'https://agileproject.site/', '205.169.39.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/117.0.5938.132 Safari/537.36', '2025-05-27 13:51:07', '2025-05-27 13:51:07', 'active', NULL, NULL, NULL, NULL),
(915602700, 1, NULL, NULL, 'https://agileproject.site/', '34.118.23.71', 'Mozilla/5.0 (iPhone13,2; U; CPU iPhone OS 14_0 like Mac OS X) AppleWebKit/602.1.50 (KHTML, like Gecko) Version/10.0 Mobile/15E148 Safari/602.1', '2025-05-27 13:51:25', '2025-05-27 13:51:25', 'active', NULL, NULL, NULL, NULL),
(915602701, 1, NULL, NULL, 'https://agileproject.site/index.php', '66.249.64.36', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.7103.92 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '2025-05-27 18:57:31', '2025-05-27 18:57:31', 'active', NULL, NULL, NULL, NULL),
(915602702, 7, NULL, NULL, 'https://skyreignsfinancial.com/', '40.77.189.176', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/112.0.0.0 Safari/537.36', '2025-05-27 19:56:48', '2025-05-27 19:56:48', 'active', NULL, NULL, NULL, NULL),
(915602703, 7, NULL, NULL, 'https://skyreignsfinancial.com/app/Account/finapp.bragherstudio/view4/settings.php', '102.66.151.138', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/24.0 Chrome/117.0.0.0 Mobile Safari/537.36', '2025-05-27 22:23:33', '2025-05-27 22:23:33', 'active', NULL, NULL, NULL, NULL),
(915602704, 7, NULL, NULL, 'https://skyreignsfinancial.com/app/Account/finapp.bragherstudio/view4/index.php', '87.129.229.234', 'Mozilla/5.0 (iPhone; CPU iPhone OS 18_5 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Mobile/15E148 Safari/604.1', '2025-05-28 00:02:01', '2025-05-28 00:51:48', 'active', NULL, NULL, NULL, NULL),
(915602705, 1, NULL, NULL, 'https://diniochat.com/', '205.169.39.15', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/117.0.5938.132 Safari/537.36', '2025-05-28 00:44:01', '2025-05-28 00:44:01', 'active', NULL, NULL, NULL, NULL),
(915602706, 1, NULL, NULL, 'https://agileproject.site/', '54.70.154.186', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/68.0.3440.106 Safari/537.36', '2025-05-28 06:59:19', '2025-05-28 06:59:19', 'active', NULL, NULL, NULL, NULL),
(915602707, 1, NULL, NULL, 'https://agileproject.site/', '102.90.101.229', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '2025-05-30 04:12:28', '2025-05-30 04:14:18', 'active', NULL, NULL, NULL, NULL),
(915602708, 1, NULL, NULL, 'https://agileproject.site/', '102.90.101.229', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '2025-05-30 10:07:23', '2025-05-30 10:07:23', 'active', NULL, NULL, NULL, NULL),
(915602709, 1, NULL, NULL, 'https://agileproject.site/', '102.90.101.229', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', '2025-05-30 10:07:25', '2025-05-30 10:07:25', 'active', NULL, NULL, NULL, NULL),
(915602710, 7, NULL, NULL, 'https://skyreignsfinancial.com/app/Account/finapp.bragherstudio/view4/settings.php', '41.95.215.192', 'Mozilla/5.0 (Linux; Android 12; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.7103.60 Mobile Safari/537.36', '2025-05-30 13:52:54', '2025-05-30 13:52:54', 'active', NULL, NULL, NULL, NULL),
(915602711, 7, NULL, NULL, 'https://skyreignsfinancial.com/app/Account/finapp.bragherstudio/view4/index.php', '41.95.215.192', 'Mozilla/5.0 (Linux; Android 12; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.7103.60 Mobile Safari/537.36', '2025-05-30 14:19:11', '2025-05-30 14:19:11', 'active', NULL, NULL, NULL, NULL),
(915602712, 7, NULL, NULL, 'https://skyreignsfinancial.com/app/Account/finapp.bragherstudio/view4/index.php', '41.95.215.192', 'Mozilla/5.0 (Linux; Android 12; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.7103.60 Mobile Safari/537.36', '2025-05-30 14:19:59', '2025-05-30 14:19:59', 'active', NULL, NULL, NULL, NULL),
(915602713, 7, NULL, NULL, 'https://skyreignsfinancial.com/app/Account/finapp.bragherstudio/view4/index.php', '2402:e000:51d:ea72:d1dd:4be4:b1b2:736e', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/28.0 Chrome/130.0.0.0 Mobile Safari/537.36', '2025-06-01 12:44:03', '2025-06-01 12:44:03', 'active', NULL, NULL, NULL, NULL),
(915602714, 7, NULL, NULL, 'https://skyreignsfinancial.com/app/Account/finapp.bragherstudio/view4/index.php', '2402:e000:51d:ea72:d1dd:4be4:b1b2:736e', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/28.0 Chrome/130.0.0.0 Mobile Safari/537.36', '2025-06-01 12:44:47', '2025-06-01 12:44:47', 'active', NULL, NULL, NULL, NULL),
(915602715, 7, NULL, NULL, 'https://skyreignsfinancial.com/app/Account/finapp.bragherstudio/view4/index.php', '223.123.6.184', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/28.0 Chrome/130.0.0.0 Mobile Safari/537.36', '2025-06-02 04:50:16', '2025-06-02 04:50:16', 'active', NULL, NULL, NULL, NULL),
(915602716, 1, NULL, NULL, 'https://agileproject.site/', '105.113.82.17', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-02 07:02:20', '2025-06-02 07:02:20', 'active', NULL, NULL, NULL, NULL),
(915602717, 1, NULL, NULL, 'https://agileproject.site/', '105.113.82.17', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-02 07:02:21', '2025-06-02 07:02:21', 'active', NULL, NULL, NULL, NULL),
(915602718, 1, NULL, NULL, 'https://agileproject.site/', '105.113.82.17', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-02 07:02:56', '2025-06-02 07:02:56', 'active', NULL, NULL, NULL, NULL),
(915602719, 7, NULL, NULL, 'https://skyreignsfinancial.com/app/Account/finapp.bragherstudio/view4/index.php', '2806:265:348f:7eb:fdca:6633:7110:2464', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Mobile Safari/537.36', '2025-06-02 09:21:19', '2025-06-02 09:21:19', 'active', NULL, NULL, NULL, NULL),
(915602720, 7, NULL, NULL, 'https://skyreignsfinancial.com/app/Account/finapp.bragherstudio/view4/index.php', '2806:265:348f:7eb:fdca:6633:7110:2464', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Mobile Safari/537.36', '2025-06-02 09:49:32', '2025-06-02 09:49:32', 'active', NULL, NULL, NULL, NULL),
(915602721, 7, NULL, NULL, 'https://skyreignsfinancial.com/app/Account/finapp.bragherstudio/view4/index.php', '197.38.133.188', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', '2025-06-02 16:30:58', '2025-06-02 16:30:58', 'active', NULL, NULL, NULL, NULL),
(915602722, 7, NULL, NULL, 'https://skyreignsfinancial.com/app/Account/finapp.bragherstudio/view4/settings.php', '39.44.7.40', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/28.0 Chrome/130.0.0.0 Mobile Safari/537.36', '2025-06-02 20:24:51', '2025-06-02 20:24:51', 'active', NULL, NULL, NULL, NULL),
(927482427, 7, NULL, NULL, 'https://skyreignsfinancial.com/app/login.php', '46.101.169.116', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Mobile Safari/537.36', '2025-07-23 11:14:08', '2025-07-23 11:22:41', 'active', NULL, NULL, NULL, NULL),
(933652052, 1, NULL, NULL, 'https://agileproject.site/', '17.241.75.86', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.4 Safari/605.1.15 (Applebot/0.1; +http://www.apple.com/go/applebot)', '2025-06-19 04:25:45', '2025-06-19 04:25:45', 'active', NULL, NULL, NULL, NULL),
(938188181, 1, NULL, NULL, 'https://agileproject.site/', '54.213.227.57', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/68.0.3440.106 Safari/537.36', '2025-08-01 10:11:13', '2025-08-01 10:11:13', 'active', NULL, NULL, NULL, NULL),
(953033286, 1, NULL, NULL, 'https://agileproject.site/', '102.88.110.237', 'Mozilla/5.0 (iPhone; CPU iPhone OS 17_6_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.6 Mobile/15E148 Safari/604.1', '2025-06-10 15:50:02', '2025-06-10 15:54:30', 'active', NULL, NULL, NULL, NULL),
(974792759, 1, NULL, NULL, 'https://agileproject.site/index.php', '66.249.70.168', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.7151.119 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '2025-07-30 07:47:11', '2025-07-30 07:47:11', 'active', NULL, NULL, NULL, NULL),
(975862131, 1, NULL, NULL, 'https://agileproject.site/', '66.249.64.234', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.7151.68 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '2025-06-25 06:27:26', '2025-06-25 06:27:26', 'active', NULL, NULL, NULL, NULL),
(983038825, 1, NULL, NULL, 'https://agileproject.site/index.php', '66.249.70.168', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; Googlebot/2.1; +http://www.google.com/bot.html) Chrome/137.0.7151.119 Safari/537.36', '2025-07-30 07:47:10', '2025-07-30 07:47:10', 'active', NULL, NULL, NULL, NULL),
(986006526, 1, NULL, NULL, 'https://agileproject.site/', '34.221.62.187', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/68.0.3440.106 Safari/537.36', '2025-06-17 10:07:10', '2025-06-17 10:07:10', 'active', NULL, NULL, NULL, NULL),
(995613172, 1, NULL, NULL, 'http://localhost/agileproject/', '160.238.37.38', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-07-07 20:15:12', '2025-07-07 20:15:12', 'active', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `visitors_backup`
--

CREATE TABLE `visitors_backup` (
  `id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ip_address` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `user_agent` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `last_active` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `visitors_backup`
--

INSERT INTO `visitors_backup` (`id`, `user_id`, `name`, `email`, `url`, `ip_address`, `user_agent`, `created_at`, `last_active`) VALUES
('', 1, 'Test Visitor', 'test@example.com', 'https://test-site.com', '102.90.96.30', 'API Test Script', '2025-05-20 06:23:26', '2025-05-20 06:23:26');

-- --------------------------------------------------------

--
-- Table structure for table `widget_settings`
--

CREATE TABLE `widget_settings` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `widget_id` varchar(64) NOT NULL,
  `theme_color` varchar(20) NOT NULL DEFAULT '#3498db',
  `text_color` varchar(20) NOT NULL DEFAULT '#ffffff',
  `position` enum('bottom_right','bottom_left','top_right','top_left') NOT NULL DEFAULT 'bottom_right',
  `welcome_message` text DEFAULT NULL,
  `offline_message` text DEFAULT NULL,
  `display_name` varchar(100) DEFAULT NULL,
  `logo_url` varchar(255) DEFAULT NULL,
  `custom_css` text DEFAULT NULL,
  `mobile_enabled` tinyint(1) NOT NULL DEFAULT 1,
  `show_branding` tinyint(1) NOT NULL DEFAULT 1,
  `auto_popup` tinyint(1) NOT NULL DEFAULT 0,
  `auto_popup_delay` int(11) DEFAULT 10,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `widget_settings`
--

INSERT INTO `widget_settings` (`id`, `user_id`, `widget_id`, `theme_color`, `text_color`, `position`, `welcome_message`, `offline_message`, `display_name`, `logo_url`, `custom_css`, `mobile_enabled`, `show_branding`, `auto_popup`, `auto_popup_delay`, `updated_at`) VALUES
(1, 1, '450a6c5bead35a8c3648a923a33da5a5', '#3498db', '#ffffff', 'bottom_right', 'Hello! How can we help you today?', 'Sorry, we\'re currently offline. Please leave a message and we\'ll get back to you soon.', 'admin', NULL, NULL, 1, 1, 0, 10, '2025-05-21 03:21:57'),
(2, 2, '1d12f103859a704a890683a311761a7e', '#3498db', '#ffffff', 'bottom_right', 'Hello! How can we help you today?', 'Sorry, we\'re currently offline. Please leave a message and we\'ll get back to you soon.', 'Ebisintei Dennis', NULL, NULL, 1, 1, 0, 10, '2025-06-03 16:06:51'),
(3, 3, '22fb66ed96e13f73235a851dc213acf7', '#3498db', '#ffffff', 'bottom_right', 'Hello! How can we help you today?', 'Sorry, we\'re currently offline. Please leave a message and we\'ll get back to you soon.', 'Victor', NULL, NULL, 1, 1, 0, 10, '2025-06-03 16:06:51'),
(4, 4, 'e899bca97a62bad5a59141af89af96c6', '#3498db', '#ffffff', 'bottom_right', 'Hello! How can we help you today?', 'Sorry, we\'re currently offline. Please leave a message and we\'ll get back to you soon.', 'Fidel A Loredo', NULL, NULL, 1, 1, 0, 10, '2025-06-03 16:06:51'),
(5, 5, '6135b2a602a3ac9bc25a01d6c3636a1c', '#3498db', '#ffffff', 'bottom_right', 'Hello! How can we help you today?', 'Sorry, we\'re currently offline. Please leave a message and we\'ll get back to you soon.', 'Sibai Prince Pereladou', NULL, NULL, 1, 1, 0, 10, '2025-06-03 16:06:51'),
(6, 6, 'd46c4fb6a33f41269e9cae2cfad64378', '#3498db', '#ffffff', 'bottom_right', 'Hello! How can we help you today?', 'Sorry, we\'re currently offline. Please leave a message and we\'ll get back to you soon.', 'Amos Seiyefa', NULL, NULL, 1, 1, 0, 10, '2025-06-03 16:06:51'),
(7, 7, '0bf351b30ef39ce5e5ade1b92ccce937', '#3498db', '#ffffff', 'bottom_right', 'Hello! How can we help you today?', 'Sorry, we\'re currently offline. Please leave a message and we\'ll get back to you soon.', 'Skyreignsfinancial', NULL, NULL, 1, 1, 0, 10, '2025-06-03 16:06:51'),
(8, 8, 'f6bcb1837d34f22b39fb4b7b6fdc54d4', '#3498db', '#ffffff', 'bottom_right', 'Hello! How can we help you today?', 'Sorry, we\'re currently offline. Please leave a message and we\'ll get back to you soon.', 'Godswill  Osain', NULL, NULL, 1, 1, 0, 10, '2025-06-03 16:06:51'),
(9, 9, '587dfffda5a16536736c02e1a8aa6abd', '#3498db', '#ffffff', 'bottom_right', 'Hello! How can we help you today?', 'Sorry, we\'re currently offline. Please leave a message and we\'ll get back to you soon.', 'Godswill Osain', NULL, NULL, 1, 1, 0, 10, '2025-06-03 16:06:51'),
(10, 10, '42c78363c73d9247f7e4599d3e0d81f0', '#3498db', '#ffffff', 'bottom_right', 'Hello! How can we help you today?', 'Sorry, we\'re currently offline. Please leave a message and we\'ll get back to you soon.', 'aboy uk', NULL, NULL, 1, 1, 0, 10, '2025-06-03 16:06:51'),
(11, 11, 'cfe7fb26df345366c586ab17b5714ad0', '#3498db', '#ffffff', 'bottom_right', 'Hello! How can we help you today?', 'Sorry, we\'re currently offline. Please leave a message and we\'ll get back to you soon.', 'Ikoto Tari', NULL, NULL, 1, 1, 0, 10, '2025-06-03 16:06:51'),
(12, 12, 'a8d9bdedd130e6404aad9bd7a8116bba', '#3498db', '#ffffff', 'bottom_right', 'Hello! How can we help you today?', 'Sorry, we\'re currently offline. Please leave a message and we\'ll get back to you soon.', 'fIgIbeKT', NULL, NULL, 1, 1, 0, 10, '2025-06-03 16:06:51'),
(13, 13, 'cdc133648b81c3544350f04a91822874', '#3498db', '#ffffff', 'bottom_right', 'Hello! How can we help you today?', 'Sorry, we\'re currently offline. Please leave a message and we\'ll get back to you soon.', 'Progress', NULL, NULL, 1, 1, 0, 10, '2025-06-03 16:06:51'),
(14, 14, 'ec6d32e8b380a2581589e5f46c3e315b', '#3498db', '#ffffff', 'bottom_right', 'Hello! How can we help you today?', 'Sorry, we\'re currently offline. Please leave a message and we\'ll get back to you soon.', 'fTdvmzaWF', NULL, NULL, 1, 1, 0, 10, '2025-06-03 16:06:51');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `visitor_id` (`visitor_id`);

--
-- Indexes for table `page_views`
--
ALTER TABLE `page_views`
  ADD PRIMARY KEY (`id`),
  ADD KEY `visitor_id` (`visitor_id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `subscription_id` (`subscription_id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscriptions`
--
ALTER TABLE `subscriptions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `api_key` (`api_key`),
  ADD UNIQUE KEY `widget_id` (`widget_id`),
  ADD KEY `idx_widget_id` (`widget_id`),
  ADD KEY `idx_subscription_expiry` (`subscription_expiry`);

--
-- Indexes for table `visitors`
--
ALTER TABLE `visitors`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `widget_settings`
--
ALTER TABLE `widget_settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_widget` (`user_id`,`widget_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=425;

--
-- AUTO_INCREMENT for table `page_views`
--
ALTER TABLE `page_views`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `subscriptions`
--
ALTER TABLE `subscriptions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=115;

--
-- AUTO_INCREMENT for table `visitors`
--
ALTER TABLE `visitors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=995613173;

--
-- AUTO_INCREMENT for table `widget_settings`
--
ALTER TABLE `widget_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `messages`
--
ALTER TABLE `messages`
  ADD CONSTRAINT `messages_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `page_views`
--
ALTER TABLE `page_views`
  ADD CONSTRAINT `page_views_ibfk_1` FOREIGN KEY (`visitor_id`) REFERENCES `visitors` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `payments_ibfk_2` FOREIGN KEY (`subscription_id`) REFERENCES `subscriptions` (`id`);

--
-- Constraints for table `visitors`
--
ALTER TABLE `visitors`
  ADD CONSTRAINT `visitors_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `widget_settings`
--
ALTER TABLE `widget_settings`
  ADD CONSTRAINT `widget_settings_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

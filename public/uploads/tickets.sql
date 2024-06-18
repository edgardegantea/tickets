-- phpMyAdmin SQL Dump
-- version 4.9.11
-- https://www.phpmyadmin.net/
--
-- Host: db5013939844.hosting-data.io
-- Generation Time: Jun 18, 2024 at 01:26 PM
-- Server version: 10.6.15-MariaDB-1:10.6.15+maria~deb11-log
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dbs11655286`
--

create database tickets;
use tickets;

-- --------------------------------------------------------

--
-- Table structure for table `adjuntos_mensaje`
--

CREATE TABLE `adjuntos_mensaje` (
  `id` int(11) NOT NULL,
  `mensaje_id` int(11) NOT NULL,
  `file_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `areas`
--

CREATE TABLE `areas` (
  `id` int(12) NOT NULL,
  `name` varchar(150) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `email` varchar(80) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `areas`
--

INSERT INTO `areas` (`id`, `name`, `description`, `phone`, `email`, `active`, `created_at`, `updated_at`) VALUES
(1, 'Ingeniería Informática', NULL, '2312066656', 'div.inf@teziutlan.tecnm.mx', 1, '2023-07-31 16:55:41', '2023-07-31 16:55:41'),
(2, 'Departamento de personal', 'Departamento de personal. Se permitirá agregar usuarios adscritos a este departamento con previa validación del administrador del sistema.', '2313114000', 'departamento.personal@teziutlan.tecnm.mx', 1, '2023-07-31 16:18:49', '2023-07-31 16:18:49'),
(3, 'Igeniería en Mecatrónica', '', '', '', 1, '2023-08-07 15:33:23', '2023-08-07 15:38:14'),
(4, 'Ingeniería Mecatronica', '', '2313114000', 'div.ime@teziutlan.tecnm.mx', 1, '2023-08-07 16:20:38', '2023-08-07 16:20:38'),
(5, 'Desarrollo Academico', 'Desarrollo Academico', '', 'dda_dteziutlan@tecnm.mx', 1, '2023-10-04 12:55:24', '2023-10-04 12:55:24'),
(6, 'Recursos Financieros', '', '', '', 1, '2023-10-20 15:04:56', '2023-10-20 15:04:56'),
(7, 'Planeación y Vinculación', '', '', '', 1, '2023-10-20 15:05:45', '2023-10-20 15:05:45'),
(8, 'Recursos Materiales', '', '', '', 1, '2023-10-27 11:32:41', '2023-10-27 11:32:41');

-- --------------------------------------------------------

--
-- Table structure for table `attachments`
--

CREATE TABLE `attachments` (
  `id` int(11) NOT NULL,
  `ticket_id` int(11) NOT NULL,
  `file_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `attachments`
--

INSERT INTO `attachments` (`id`, `ticket_id`, `file_name`) VALUES
(6, 21, '1695417046_ec015c8fc69c2f7630ba.docx'),
(8, 23, '1696438599_ec37b96c144730a94ed5.docx'),
(9, 25, '1696456052_a0eff9a8d601a7090929.pdf'),
(10, 26, '1696457452_120cd3fd89fff7e60a5c.pdf'),
(11, 26, '1696457452_202743f8e9ecca24d1de.pdf'),
(12, 26, '1696457452_8803554bc2ad8ceb7468.pdf'),
(13, 26, '1696457452_1a7df92bdac445fab4ec.pdf'),
(14, 26, '1696457452_02a63cc95a566e1bdeb4.pdf'),
(15, 26, '1696457452_6d22b8d696ebaef89248.pdf'),
(16, 27, '1696543999_7f1d6e33101a9e7fed2b.pdf'),
(17, 27, '1696543999_57e87f059a65da68c956.pdf'),
(18, 27, '1696543999_d4c7e66ad946c0f682f5.pdf'),
(24, 31, '1697836484_89da1b915e8870459203.pdf'),
(25, 32, '1698425338_4d653fc6b25ac8269a42.docx'),
(26, 33, '1698429095_3e3108ebc4c6e316497f.pdf'),
(27, 33, '1698429095_7527bf20f6f870d7e890.pdf'),
(28, 36, '1699069590_47c9420de657dfaa9653.pdf'),
(29, 37, '1699639963_a05f3630196dad057caf.pdf'),
(30, 39, '1702330352_42935b7175ea309a36ed.pdf'),
(31, 39, '1702330352_e2db46016d3883f746c6.pdf'),
(32, 39, '1702330352_c74fa32dc000b75c1cad.docx'),
(33, 39, '1702330352_e83bfe36c6563f490fc0.png'),
(34, 40, '1702570040_2f54d119d9dc039e0246.jpg'),
(35, 42, '1705073563_3cab4f6d81921c0dac99.docx'),
(36, 43, '1705357104_111c10cc2a93e9e34e1d.docx'),
(38, 46, '1706140073_c5bc24f3b662612981af.zip'),
(39, 47, '1706154211_1f30664fe27240f5e2f3.pdf'),
(40, 54, '1706722530_8156c099ffef503aec96.docx'),
(41, 55, '1706820181_02d7996e7c28ac3ec7bb.txt'),
(42, 56, '1707846275_665a208d9eace3669252.pdf'),
(43, 56, '1707846275_c8bbbfbb14125cd051c4.pdf'),
(44, 57, '1708378983_71a9b3030179dbaae831.jpg'),
(45, 58, '1708454043_f6c09046837e870749df.zip'),
(47, 60, '1708622067_db521e039cf66a53ceda.zip'),
(48, 61, '1708704424_b4b1d01ee9d9406b9b88.png'),
(49, 62, '1709055123_10423d6b3cf6ad4fc7e1.rar'),
(50, 63, '1709148505_57526c7a76e6aba15584.zip'),
(51, 64, '1709228471_128d2d0a88adf1db0b72.zip'),
(52, 65, '1710204052_97f95fe73b1b70fc9414.pdf'),
(53, 66, '1710960280_926bbeafea49d6fd079f.pdf'),
(54, 67, '1711039669_c4b8ec006850eb4c17fc.pdf'),
(55, 67, '1711039669_072788890fbc9b34ddbe.pdf'),
(56, 67, '1711039669_0b6e49ec782626ce8170.jpeg'),
(57, 67, '1711039669_ffe9c10069e2c6da0c4d.jpeg'),
(58, 69, '1713379786_679b27b22d686389ad08.xlsx'),
(59, 70, '1713485546_53c7371bfc2c5533af3e.zip'),
(60, 71, '1713560487_442ca7ac442e8119637d.docx'),
(61, 71, '1713560487_43d2637fee937d2aa131.docx'),
(62, 72, '1715365027_b43233b1c44f395d226d.zip'),
(63, 73, '1716240994_9a5edba49078b84aee8f.jpeg'),
(64, 73, '1716240994_20cebb8f1c08ddf6db4f.jpeg'),
(65, 73, '1716240994_1cca7dc67d223c1faf62.pdf'),
(66, 73, '1716240994_3ccc4c5982f37baf5251.jpeg'),
(67, 74, '1716843973_00646f89cd754a34f493.zip'),
(68, 75, '1717006883_dd276d3fbb8c9f5d81b7.pdf'),
(69, 77, '1718141526_330c3bbcb3b9e260abd9.rar');

-- --------------------------------------------------------

--
-- Table structure for table `bitacoras`
--

CREATE TABLE `bitacoras` (
  `id` int(11) NOT NULL,
  `ticket` int(11) NOT NULL,
  `mensaje` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(12) NOT NULL,
  `name` varchar(150) NOT NULL,
  `slug` varchar(150) NOT NULL,
  `description` text DEFAULT NULL,
  `updated_at` datetime NOT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `description`, `updated_at`, `created_at`) VALUES
(1, 'Website', 'Website', 'Website', '2023-07-31 15:17:28', '2023-07-31 15:17:28'),
(2, 'Personal', 'personal', 'Personal', '2023-07-31 15:17:28', '2023-07-31 15:17:28'),
(3, 'Académico', 'Académico', 'Académico', '2023-07-31 15:17:28', '2023-07-31 15:17:28'),
(4, 'Residencia profesional', 'residencia-profesional', 'Residencia profesional', '2023-07-31 15:17:28', '2023-07-31 15:17:28'),
(5, 'Capacitación', 'capacitación', 'Capacitación', '2023-07-31 15:17:28', '2023-07-31 15:17:28'),
(6, 'Comisión', 'comisión', 'Comisión', '2023-07-31 15:17:28', '2023-07-31 15:17:28');

-- --------------------------------------------------------

--
-- Table structure for table `mensajes`
--

CREATE TABLE `mensajes` (
  `id` int(11) NOT NULL,
  `ticket_id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `mensaje` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `mensajes`
--

INSERT INTO `mensajes` (`id`, `ticket_id`, `usuario_id`, `mensaje`, `created_at`, `updated_at`, `deleted_at`) VALUES
(6, 24, 3, 'http://encuesta.mapaches.info/index.php/637546?lang=es-MX', '2023-10-04 17:27:22', '2023-10-04 13:27:22', NULL),
(7, 27, 3, 'Resuelto', '2023-10-06 13:52:28', '2023-10-06 09:52:28', NULL),
(8, 21, 3, 'https://teziutlan.tecnm.mx/index.php/oferta-educativa/ingenieria-en-gestion-empresarial/', '2023-10-06 14:12:30', '2023-10-06 10:12:30', NULL),
(9, 23, 3, 'Proceso concluido, se pide su validación. Gracias', '2023-10-09 19:57:25', '2023-10-09 15:57:25', NULL),
(10, 23, 3, 'https://teziutlan.tecnm.mx/index.php/oferta-educativa/ingenieria-mecatronica/', '2023-10-09 19:57:31', '2023-10-09 15:57:31', NULL),
(11, 26, 3, 'Se pide especificar cambios. Gracias', '2023-10-09 20:02:32', '2023-10-09 16:02:32', NULL),
(12, 26, 14, 'Rediseño de página web del programa \r\n\r\nColocar el objetivo del programa \r\nColocar el perfil de ingreso \r\nColocar las retículas de las dos especialidades en los dos sistemas \r\nColocar el nombre de las dos especialidades y sus respectivos objetivos \r\nQuitar objetivos educacionales (OE). IIA no tiene OE \r\nQuitar atributos de egreso (AE). Por acreditación con COMEAA no debe tener AE', '2023-10-09 20:13:53', '2023-10-09 16:13:53', NULL),
(13, 23, 12, 'Se válida la información.', '2023-10-10 15:28:41', '2023-10-10 11:28:41', NULL),
(17, 31, 3, 'https://teziutlan.tecnm.mx/index.php/normatividad/', '2023-10-20 19:24:21', '2023-10-20 15:24:21', NULL),
(18, 30, 3, 'La información se encuentra en correo, en la proxima ocasión mandar por este medio  o enlace. Gracias', '2023-10-23 14:16:44', '2023-10-23 10:16:44', NULL),
(19, 30, 3, 'https://teziutlan.tecnm.mx/index.php/estados-financieros-3er-trimestre-2023/', '2023-10-23 15:31:10', '2023-10-23 11:31:10', NULL),
(20, 32, 3, 'Actividad resuelta, favor de validar', '2023-10-27 15:20:19', '2023-10-27 11:20:19', NULL),
(21, 32, 3, 'https://teziutlan.tecnm.mx/index.php/aspirantes/', '2023-10-27 15:20:25', '2023-10-27 11:20:25', NULL),
(22, 32, 21, 'El ticket fue atendido de acuerdo a la solicitud realizada. ¡Muchas gracias! por su apoyo.', '2023-10-27 16:17:34', '2023-10-27 12:17:34', NULL),
(23, 33, 3, 'Proceso concluido, se pide su validación. Gracias', '2023-10-27 18:59:17', '2023-10-27 14:59:17', NULL),
(24, 34, 3, 'https://teziutlan.tecnm.mx/index.php/transparencia/programa-presupuestario/', '2023-11-03 20:10:49', '2023-11-03 16:10:49', NULL),
(25, 35, 3, 'https://teziutlan.tecnm.mx/index.php/transparencia/programa-presupuestario/', '2023-11-03 20:13:27', '2023-11-03 16:13:27', NULL),
(26, 36, 3, 'https://teziutlan.tecnm.mx/index.php/movilidad-academica/', '2023-11-06 20:20:18', '2023-11-06 15:20:18', NULL),
(27, 36, 3, 'en espera de su validación', '2023-11-06 20:20:26', '2023-11-06 15:20:26', NULL),
(28, 38, 3, 'Hecho', '2023-12-08 14:49:33', '2023-12-08 09:49:33', NULL),
(29, 41, 3, 'Se recomienda que termine en zacapoaxtla el mayor grado de vance y se proporciona número de céular para seguimiento ', '2023-12-14 19:42:04', '2023-12-14 14:42:04', NULL),
(30, 40, 3, 'hecho', '2023-12-14 20:11:58', '2023-12-14 15:11:58', NULL),
(31, 42, 3, 'hecho', '2024-01-15 19:50:35', '2024-01-15 14:50:35', NULL),
(32, 42, 21, 'Muchas gracias. Confirmo.', '2024-01-15 21:09:34', '2024-01-15 16:09:34', NULL),
(33, 50, 3, 'Hecho', '2024-01-26 17:22:44', '2024-01-26 12:22:44', NULL),
(34, 55, 3, 'hecho', '2024-02-02 16:57:42', '2024-02-02 11:57:42', NULL),
(35, 56, 3, 'hechi', '2024-02-15 21:25:01', '2024-02-15 16:25:01', NULL),
(36, 62, 3, 'https://teziutlan.tecnm.mx/index.php/si-archivos/', '2024-03-05 17:31:45', '2024-03-05 12:31:45', NULL),
(37, 63, 3, 'www.teziutlan.tecnm.mx', '2024-03-05 19:28:07', '2024-03-05 14:28:07', NULL),
(38, 64, 3, 'www.teziutlan.tecnm.mx', '2024-03-05 19:28:42', '2024-03-05 14:28:42', NULL),
(39, 65, 3, 'https://teziutlan.tecnm.mx/index.php/transparencia/estados-financieros/', '2024-03-14 16:44:51', '2024-03-14 12:44:51', NULL),
(40, 66, 3, 'En trayecto', '2024-04-08 20:14:42', '2024-04-08 16:14:42', NULL),
(41, 68, 3, 'Realizado el 4 de abril', '2024-04-12 19:17:37', '2024-04-12 15:17:37', NULL),
(42, 65, 3, 'resuelto el 11 de marzo', '2024-04-12 19:18:09', '2024-04-12 15:18:09', NULL),
(43, 67, 3, 'HECHO', '2024-04-15 03:14:10', '2024-04-14 23:14:10', NULL),
(44, 70, 3, 'hecho', '2024-04-21 11:11:29', '2024-04-21 07:11:29', NULL),
(45, 66, 3, 'hecho', '2024-04-21 11:17:04', '2024-04-21 07:17:04', NULL),
(46, 71, 3, 'hecho', '2024-04-21 11:22:01', '2024-04-21 07:22:01', NULL),
(47, 69, 3, 'hecho', '2024-04-21 11:27:00', '2024-04-21 07:27:00', NULL),
(48, 69, 27, 'Falta agregar el link con el archivo adjunto.  Gracias.', '2024-04-22 15:17:09', '2024-04-22 11:17:09', NULL),
(49, 72, 3, 'hecho', '2024-05-10 16:41:33', '2024-05-10 12:41:33', NULL),
(50, 76, 3, 'Hecho', '2024-06-17 18:56:49', '2024-06-17 14:56:49', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `priorities`
--

CREATE TABLE `priorities` (
  `id` varchar(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `slug` varchar(50) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `priorities`
--

INSERT INTO `priorities` (`id`, `name`, `slug`, `created_at`, `updated_at`, `deleted_at`) VALUES
('pr1', 'Urgente', 'urgente', '2023-07-31 15:17:37', '2023-07-31 15:17:37', NULL),
('pr2', 'Alta', 'alta', '2023-07-31 15:17:37', '2023-07-31 15:17:37', NULL),
('pr3', 'Media', 'media', '2023-07-31 15:17:37', '2023-07-31 15:17:37', NULL),
('pr4', 'Baja', 'baja', '2023-07-31 15:17:37', '2023-07-31 15:17:37', NULL),
('pr5', 'No prioritario', 'no-prioritario', '2023-07-31 15:17:37', '2023-07-31 15:17:37', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `status`
--

CREATE TABLE `status` (
  `id` varchar(5) NOT NULL,
  `name` varchar(20) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `status`
--

INSERT INTO `status` (`id`, `name`, `created_at`, `updated_at`) VALUES
('s01', 'No iniciado', '2023-07-31 15:37:25', '2023-07-31 15:37:25'),
('s02', 'Iniciado', '2023-07-31 15:37:25', '2023-07-31 15:37:25'),
('s03', 'En revisión', '2023-07-31 15:37:25', '2023-07-31 15:37:25'),
('s04', 'En proceso', '2023-07-31 15:37:25', '2023-07-31 15:37:25'),
('s05', 'Finalizado', '2023-07-31 15:37:25', '2023-07-31 15:37:25'),
('s06', 'Abierto', '2023-07-31 15:37:25', '2023-07-31 15:37:25'),
('s07', 'Re-abierto', '2023-07-31 15:37:25', '2023-07-31 15:37:25'),
('s08', 'Cerrado', '2023-07-31 15:37:25', '2023-07-31 15:37:25');

-- --------------------------------------------------------

--
-- Table structure for table `tickets`
--

CREATE TABLE `tickets` (
  `id` int(11) NOT NULL,
  `usuario` int(11) NOT NULL,
  `category` int(12) NOT NULL,
  `priority` varchar(11) NOT NULL,
  `title` varchar(150) NOT NULL,
  `slug` varchar(150) NOT NULL,
  `description` text NOT NULL,
  `url` varchar(255) DEFAULT NULL,
  `status` varchar(5) NOT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `email` varchar(80) DEFAULT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  `remote` varchar(50) DEFAULT NULL,
  `dateMeeting` datetime DEFAULT NULL,
  `hourMeeting` time DEFAULT NULL,
  `ok` tinyint(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `tickets`
--

INSERT INTO `tickets` (`id`, `usuario`, `category`, `priority`, `title`, `slug`, `description`, `url`, `status`, `phone`, `email`, `file_name`, `remote`, `dateMeeting`, `hourMeeting`, `ok`, `created_at`, `updated_at`, `deleted_at`) VALUES
(21, 10, 1, 'pr2', 'Solicitud cambio de OE del PE de IGE', 'cambiar-los-5-objetivos-educacionales-del-pe-de-ige-por-los-3-que-estóy-anexando-a-esta-petición-muchas-gracias', 'Cambiar los 5 Objetivos Educacionales del PE de IGE, por los 3 que estóy anexando a esta petición.  Muchas gracias', '', 's08', NULL, NULL, NULL, NULL, NULL, NULL, 1, '2023-09-22 15:10:46', '2023-10-06 10:12:36', NULL),
(23, 12, 1, 'pr1', 'Modificicación de Información', 'corrección-de-información-sobre-la-licenciatura-en-ingeniería-mecatrónica-publicada-en-la-página-oficial-del-instituto', 'Corrección de Información sobre la Licenciatura en Ingeniería Mecatrónica,  Publicada  en la Página Oficial del Instituto', 'https://teziutlan.tecnm.mx/index.php/oferta-educativa/ingenieria-mecatronica/', 's08', NULL, NULL, NULL, NULL, NULL, NULL, 1, '2023-10-04 10:56:39', '2023-10-10 13:05:37', NULL),
(24, 13, 3, 'pr2', 'Solicitud de encuesta', 'se-requiere-realizar-la-encuesta-de-satisfacción-relacionada-con-el-curso-de-inducción-a-los-grupos-de-primer-semestre-escolarizados-de-todas-las-carr', 'Se requiere realizar la encuesta de satisfacción relacionada con el curso de inducción a los grupos de primer semestre escolarizados de todas las carreras, por lo que se solicita, diseño de encuesta en línea y link para su publicación así como de la determinación de los resultados obtenidos.', '', 's08', NULL, NULL, NULL, NULL, NULL, NULL, 1, '2023-10-04 13:07:09', '2023-10-04 13:27:29', NULL),
(25, 14, 1, 'pr5', 'Actualizar retícula de la Lic. en Turismo', 'subdirección-académica-envió-retícula-actualizada-institucional', 'Subdirección académica envió retícula actualizada (institucional)', '', 's08', NULL, NULL, NULL, NULL, NULL, NULL, 1, '2023-10-04 15:47:32', '2023-10-09 13:40:59', NULL),
(26, 14, 1, 'pr5', 'Actualizar página web de la Ing. en Industrias Alimentarias', 'es-necesario-actualizar-página-web-del-programa-de-ing-en-industrias-alimentarias', 'Es necesario actualizar página web del programa de Ing. en Industrias Alimentarias', '', 's01', NULL, NULL, NULL, NULL, NULL, NULL, 1, '2023-10-04 16:10:52', '2023-10-04 16:10:52', NULL),
(27, 3, 1, 'pr1', 'Actualizar retículas de Informática y Animación Digital ', 'actualizar-retículas-de-informática-y-animación', 'Actualizar retículas de Informática y Animación', '', 's08', NULL, NULL, NULL, NULL, NULL, NULL, 1, '2023-10-05 16:13:19', '2023-10-06 09:55:33', NULL),
(30, 20, 1, 'pr1', 'Solicitud Actualización página Institucional Estados Financieros 3er Trimestre', 'actualización-página-institucional-información-financiera-correspondiente-al-3er-trimestre-2023', 'Actualización página Institucional Información financiera correspondiente al 3er trimestre 2023.', 'https://liveitsteziutlanedu-my.sharepoint.com/:f:/g/personal/rosalinda_calixto_live_itsteziutlan_edu_mx/EhVj5srn55VFm1wZMyd87vIBo2ZoKCPKnymhQg9ajOKtZw?e=puB4lD', 's08', NULL, NULL, NULL, NULL, NULL, NULL, 1, '2023-10-19 13:54:47', '2023-10-23 11:31:15', NULL),
(31, 17, 1, 'pr3', 'Solicitud de Publicación del PDI 2019 - 2024', 'solicito-atentamente-la-publicación-del-programa-de-desarrollo-institucional-pdi-2019-2024-en-el-sitio-web-institucional-con-la-finalidad-de-dar-cumpl', 'Solicito atentamente la publicación del Programa de Desarrollo Institucional (PDI) 2019-2024 en el sitio web Institucional con la finalidad de dar cumplimiento al requerimiento del Indicador 6.1. Liderazgo institucional del Marco de Referencia de CACEI para la acreditación de la carrera de Ingeniería Industrial.\r\nCabe aclarar que este documento debe permanecer publicado hasta que termine su vigencia y se cuente con el PDI del siguiente periodo.\r\n', 'https://teziutlan.tecnm.mx/index.php/normatividad/', 's08', NULL, NULL, NULL, NULL, NULL, NULL, 1, '2023-10-20 15:14:44', '2023-10-20 15:26:59', NULL),
(32, 21, 1, 'pr2', 'Proceso de admisión 2024', 'se-solicita-la-colaboración-para-actualizar-la-información-publicada-en-el-apartado-de-aspirantes-menú-comunidad-tec-dentro-del-sitio-web-instituciona', 'Se solicita la colaboración para actualizar la información publicada en el apartado de \"Aspirantes\" Menú \"COMUNIDAD TEC\", dentro del sitio web institucional www.teziutlan.tecnm.mx, además de ocultar temporalmente el recuadro ubicado en la parte inferior derecha de esta ventana, donde se direcciona al usuario al portal de Pagos en línea del Gobierno de Puebla. Esto último se debe a que, el Proceso de admisión enero 2024 no considera que el/la aspirante realice su pago directamente en el portal antes mencionado. Se adjunta archivo donde se incluye la información que se debe actualizar.', 'https://teziutlan.tecnm.mx/index.php/aspirantes/', 's08', NULL, NULL, NULL, NULL, NULL, NULL, 1, '2023-10-27 10:48:58', '2023-10-27 14:59:47', NULL),
(33, 22, 1, 'pr1', 'Sustitución de Archivos PDF Publicados', 'sustituir-los-archivos-en-formato-pdf-de-inventario-general-de-bienes-inmuebles-2o-trimestre-2023-e-inventario-general-de-bienes-muebles-2o-trimestre-', 'Sustituir los archivos en formato PDF de Inventario General de Bienes Inmuebles 2o Trimestre 2023 e Inventario General de Bienes Muebles 2o Trimestre 2023 en la Sección Información Financiera', '', 's08', NULL, NULL, NULL, NULL, NULL, NULL, 1, '2023-10-27 11:51:35', '2023-11-03 16:41:05', NULL),
(34, 17, 1, 'pr1', 'Actualización del Apartado del Programa Presupuestario.', 'con-atención-a-la-circular-cacep-st-1092023-emitido-por-el-consejo-de-armonización-contable-del-estado-de-puebla-en-la-que-pide-la-liga-donde-se-encue', 'Con atención a la Circular CACEP-ST-109/2023 emitido por el Consejo de Armonización Contable del Estado de Puebla, en la que pide la liga donde se encuentra publicada la información referente al cumplimiento de las obligaciones establecidas en la Ley General de Contabilidad Gubernamental, solicito la actualización de la información publicada en el sitio web institucional en el apartado Transparencia-Programa Presupuestario, mismo que podrá descargar de la siguiente liga: https://teziutlan-my.sharepoint.com/:f:/g/personal/edgar_av_teziutlan_tecnm_mx/Eh1u2Q2IuvtMngmXfod9mnwBrFZDtuSwcLYoB0bwjYsGOQ?e=TH1Ix8', 'https://teziutlan.tecnm.mx/index.php/transparencia/programa-presupuestario/', 's08', NULL, NULL, NULL, NULL, NULL, NULL, 1, '2023-11-03 11:50:33', '2023-11-03 16:10:52', NULL),
(35, 17, 1, 'pr1', 'Actualización del Responsable de Información en sitio web', 'con-atención-a-la-circular-cacep-st-1092023-emitido-por-el-consejo-de-armonización-contable-del-estado-de-puebla-en-la-que-pide-la-liga-donde-se-encue', 'Con atención a la Circular CACEP-ST-109/2023 emitido por el Consejo de Armonización Contable del Estado de Puebla, en la que pide la liga donde se encuentra publicada la información referente al cumplimiento de las obligaciones establecidas en la Ley General de Contabilidad Gubernamental, solicito la actualización del Responsable de la Información publicada en el sitio web institucional en el apartado Transparencia-Programa Presupuestario, quedando de la siguiente forma:\r\n\r\nÁrea: Subdirección de Planeación\r\nTitular:  Edgar Aburto Valdez\r\nUbicación Administrativa: Edificio G – Unidad de Planeación \r\nTeléfono: 231 31 1 40 00 – Ext. 301\r\nCorreo Electrónico: edgar.av@teziutlan.tecnm.mx\r\n Fecha de actualización: viernes 03 de noviembre de 2023', 'https://teziutlan.tecnm.mx/index.php/transparencia/programa-presupuestario/', 's08', NULL, NULL, NULL, NULL, NULL, NULL, 1, '2023-11-03 11:52:13', '2023-11-03 16:13:30', NULL),
(36, 23, 3, 'pr1', 'Publicación de Convocatorias Movilidad Estudiantil', 'invitar-al-alumnado-a-seleccionar-asignaturas-de-su-interés-para-cursarlas-en-otras-universidades-nacionales-e-internacionales-y-de-esta-manera-foment', 'Invitar al alumnado a seleccionar asignaturas de su interés para cursarlas en otras universidades nacionales e internacionales y de esta manera fomentar la movilidad estudiantil.', '', 's08', NULL, NULL, NULL, NULL, NULL, NULL, 1, '2023-11-03 21:46:30', '2023-12-08 09:11:24', NULL),
(37, 13, 3, 'pr1', 'Publicacion en página oficial convocatoria Evaluación Docente Agosto-Diciembre 2023', 'publicación-oficial-del-proceso-de-evaluación-docente-que-inicia-10-de-noviembre-2023', 'Publicación oficial del proceso de evaluación docente que inicia 10 de noviembre 2023.', '', 's08', NULL, NULL, NULL, NULL, NULL, NULL, 1, '2023-11-10 12:12:43', '2023-12-08 09:11:32', NULL),
(38, 20, 1, 'pr1', 'Adicionar link  pagína institucional apartado Transparencia/Estados Financieros 2023', 'favor-de-agregar-el-link-httpssevachaciendagobmxentes-en-el-apartado-transparencia-estados-financieros-2023', 'Favor de agregar el link https://sevac.hacienda.gob.mx/entes en el apartado Transparencia, estados financieros 2023', 'https://sevac.hacienda.gob.mx/entes', 's08', NULL, NULL, NULL, NULL, NULL, NULL, 1, '2023-12-08 09:31:10', '2023-12-08 09:49:37', NULL),
(39, 3, 1, 'pr1', 'Proceso de  reinscripción semestre enero junio 2024', 'httpsteziutlantecnmmxindexphpportfolioproceso-de-reinscripcion-semestre-enero-junio-2024', 'https://teziutlan.tecnm.mx/index.php/portfolio/proceso-de-reinscripcion-semestre-enero-junio-2024/', 'https://teziutlan.tecnm.mx/index.php/portfolio/proceso-de-reinscripcion-semestre-enero-junio-2024/', 's08', NULL, NULL, NULL, NULL, NULL, NULL, 1, '2023-12-11 15:32:32', '2023-12-11 15:32:47', NULL),
(40, 21, 1, 'pr2', 'Publicación de banner en sección de slider', 'solicitud-de-publicación-de-banner-recibido-por-parte-de-la-dirección-de-cooperación-y-difusión-del-tecnológico-nacional-de-méxico-para-la-difusión-de', 'Solicitud de publicación de banner recibido por parte de la Dirección de Cooperación y Difusión del Tecnológico Nacional de México, para la difusión de sus redes sociales institucionales, el cual deberá estar vinculado al siguiente link: https://linktr.ee/TecnologicoNacionaldeMexico', 'https://linktr.ee/TecnologicoNacionaldeMexico', 's08', NULL, NULL, NULL, NULL, NULL, NULL, 1, '2023-12-14 10:07:20', '2023-12-14 15:12:01', NULL),
(41, 3, 3, 'pr4', 'SOLICITU DE INFORMACIÓN PARA CONVALIDACIÓN ', 'el-alumno-cesara-aldáir-martínez-baez-solicita-proceso-de-convalidación-no-obstante-no-cuenta-con-baja-definitiva-en-zacapoaxtla', 'El alumno Cesara Aldáir Martínez Baez, solicita proceso de convalidación, no obstante no cuenta con baja definitiva en Zacapoaxtla..', '', 's08', NULL, NULL, NULL, NULL, NULL, NULL, 1, '2023-12-14 14:41:16', '2023-12-14 14:42:07', NULL),
(42, 21, 1, 'pr2', 'Actualización de información en sitio web institucional', 'se-solicita-la-colaboración-para-actualizar-la-información-publicada-en-el-apartado-de-aspirantes-menú-comunidad-tec-dentro-del-sitio-web-instituciona', 'Se solicita la colaboración para actualizar la información publicada en el apartado de \"Aspirantes\" Menú \"COMUNIDAD TEC\", dentro del sitio web institucional www.teziutlan.tecnm.mx, además de mostrar nuevamente el recuadro ubicado en la parte inferior derecha de esta ventana, donde al usuario se le direcciona al portal de Pagos en línea del Gobierno de Puebla. Se adjunta archivo donde se incluye la información que se debe actualizar.', '', 's08', NULL, NULL, NULL, NULL, NULL, NULL, 1, '2024-01-12 09:32:43', '2024-01-24 21:44:08', NULL),
(43, 25, 2, 'pr1', 'PUBLICACIÓN DE CONVOCATORIA', 'publicación-de-la-convocatoria', 'Publicación de la Convocatoria ', '', 's01', NULL, NULL, NULL, NULL, NULL, NULL, 1, '2024-01-15 16:18:24', '2024-01-15 16:18:24', NULL),
(44, 26, 1, 'pr2', 'Link de página Moodle', 'se-requiere-la-actualización-del-link-de-plataforma-moodle-en-la-página-web-institucional', 'Se requiere la actualización del link de plataforma Moodle en la página web institucional', 'https://tie.teziutlan.tecnm.mx/m24/', 's08', NULL, NULL, NULL, NULL, NULL, NULL, 1, '2024-01-19 16:56:36', '2024-01-24 21:43:50', NULL),
(46, 20, 1, 'pr1', 'Actualización información estados financieros 4to trim 23', 'carga-en-el-apartado-de-transparencia-estados-financieros-del-cuatro-trimestre-2023', 'Carga en el apartado de transparencia, estados financieros del cuatro trimestre 2023.', '', 's08', NULL, NULL, NULL, NULL, NULL, NULL, 1, '2024-01-24 17:47:53', '2024-02-15 16:25:24', NULL),
(47, 3, 1, 'pr2', 'Actulizar reglamento de Estudiantes', 'actualizar-el-reglamento-de-estudiantes-httpsteziutlantecnmmxwp-contentuploadsreglamento-de-estudiantes_itsteziutlanpdf', 'Actualizar el reglamento de estudiantes https://teziutlan.tecnm.mx/wp-content/uploads/REGLAMENTO-DE-ESTUDIANTES_ITSTEZIUTLAN.pdf', 'https://teziutlan.tecnm.mx/wp-content/uploads/REGLAMENTO-DE-ESTUDIANTES_ITSTEZIUTLAN.pdf', 's08', NULL, NULL, NULL, NULL, NULL, NULL, 1, '2024-01-24 21:43:31', '2024-02-20 16:44:37', NULL),
(48, 27, 1, 'pr2', 'Denuncias ciudadanas', 'dentro-del-menú-transparencia-eliminar-el-texto-respecto-del-segundo-trimestre-del-2023-el-instituto-tecnológico-superior-de-teziutlán-no-cuenta-con-d', 'dentro del menú “Transparencia”, Eliminar el texto: \r\n Respecto del Segundo trimestre del 2023, el Instituto Tecnológico Superior de Teziutlán, no cuenta con denuncias en trámite por incumplimiento a las obligaciones de transparencia \r\ny agregar:\r\n3er. trimestre de 2023 ', 'https://transparencia.puebla.gob.mx/docs/adjuntos/66/1010_1696364845_1950ed54432b5b73ee0405398c5c067c.xlsx ', 's08', NULL, NULL, NULL, NULL, NULL, NULL, 1, '2024-01-26 11:18:34', '2024-01-26 12:34:50', NULL),
(49, 27, 1, 'pr2', 'Denuncias ciudadanas', 'agregar-4to-trimestre-de-2023', 'Agregar:            4to trimestre de 2023', 'https://transparencia.puebla.gob.mx/docs/adjuntos/66/1010_1704926304_8dda1271c45fb8e2b85d0894ce105d20.xlsx ', 's08', NULL, NULL, NULL, NULL, NULL, NULL, 1, '2024-01-26 11:20:28', '2024-01-26 12:34:33', NULL),
(50, 27, 1, 'pr2', 'índice de los expedientes clasificados como reservados', 'dentro-del-apartado-índice-de-los-expedientes-clasificados-como-reservados-del-menú-transparencia-de-la-página-institucional-agregar-reporte-expedient', 'Dentro del apartado “índice de los expedientes clasificados como reservados” del menú “Transparencia” de la página Institucional, agregar: \r\nREPORTE EXPEDIENTES RESERVADOS 2o. SEMESTRE 2023 ', 'https://transparencia.puebla.gob.mx/docs/adjuntos/66/1010_1705517559_45e060229dda3577820cb5773ff9ff25.xlsx ', 's08', NULL, NULL, NULL, NULL, NULL, NULL, 1, '2024-01-26 11:23:10', '2024-01-26 12:22:49', NULL),
(51, 27, 1, 'pr1', 'Denuncias ciudadanas', 'agregar1er-trimestrehttpstransparenciapueblagobmxdocsadjuntos661010_1682103406_42aa4d81de7f0bcf31f285f1a9116d4exlsx', '\r\n\r\nagregar:\r\n1er trimestre\r\nhttps://transparencia.puebla.gob.mx/docs/adjuntos/66/1010_1682103406_42aa4d81de7f0bcf31f285f1a9116d4e.xlsx\r\n', 'https://transparencia.puebla.gob.mx/docs/adjuntos/66/1010_1682103406_42aa4d81de7f0bcf31f285f1a9116d4e.xlsx', 's08', NULL, NULL, NULL, NULL, NULL, NULL, 1, '2024-01-29 10:25:38', '2024-02-01 12:22:59', NULL),
(52, 27, 1, 'pr1', 'Denuncias ciudadanas', 'agregar-2do-trimestre-2023-httpstransparenciapueblagobmxdocsadjuntos661010_1689182249_9c1c5d4214b3e75e0010a43209335d3cxlsx', 'agregar: 2do trimestre 2023 \r\nhttps://transparencia.puebla.gob.mx/docs/adjuntos/66/1010_1689182249_9c1c5d4214b3e75e0010a43209335d3c.xlsx\r\n', 'https://transparencia.puebla.gob.mx/docs/adjuntos/66/1010_1689182249_9c1c5d4214b3e75e0010a43209335d3c.xlsx', 's08', NULL, NULL, NULL, NULL, NULL, NULL, 1, '2024-01-29 10:26:29', '2024-02-01 12:15:35', NULL),
(53, 27, 1, 'pr1', 'ÍNDICE DE EXPEDIENTES RESERVADOS', 'agregarreporte-expedientes-reservados-1er-sem-2023httpstransparenciapueblagobmxdocsadjuntos661010_1688502165_16b5a5c1e5c587bbb393368d42191cabxlsx', 'AGREGAR:\r\nREPORTE EXPEDIENTES RESERVADOS 1er. SEM 2023\r\nhttps://transparencia.puebla.gob.mx/docs/adjuntos/66/1010_1688502165_16b5a5c1e5c587bbb393368d42191cab.xlsx', 'https://transparencia.puebla.gob.mx/docs/adjuntos/66/1010_1688502165_16b5a5c1e5c587bbb393368d42191cab.xlsx', 's08', NULL, NULL, NULL, NULL, NULL, NULL, 1, '2024-01-29 10:31:47', '2024-02-01 12:14:55', NULL),
(54, 28, 1, 'pr1', 'Subir convocatoria de publicaciones', 'subir-convocatoria-de-publicaciones-2024-para-personal-docente', 'Subir convocatoria de publicaciones 2024 para personal docente', '', 's01', NULL, NULL, NULL, NULL, NULL, NULL, 1, '2024-01-31 11:35:30', '2024-01-31 11:35:30', NULL),
(55, 12, 1, 'pr1', 'Modificar OE', 'modificar-los-objetivos-educaciones-del-pe-ya-que-fueron-modificados-para-la-certificación-cacei-2024', 'Modificar los Objetivos Educaciones del PE, ya que fueron modificados para la certificación CACEI 2024', 'https://teziutlan.tecnm.mx/index.php/oferta-educativa/ingenieria-mecatronica/', 's08', NULL, NULL, NULL, NULL, NULL, NULL, 1, '2024-02-01 14:43:01', '2024-02-02 11:57:44', NULL),
(56, 22, 2, 'pr1', 'Publicación de Inventario de Bienes Muebles e Inventario de Bienes Inmuebles del 4o Trimestre de 2023 en el apartado de Estados Financieros de la Secc', 'publicar', 'Publicar', '', 's08', NULL, NULL, NULL, NULL, NULL, NULL, 1, '2024-02-13 11:44:35', '2024-02-15 16:25:04', NULL),
(57, 21, 1, 'pr2', 'Solicitud de publicación de banner en la sección de slider del sitio web institucional www.teziutlan.tecnm.mx', 'solicitud-de-publicación-de-banner-slider-cultura-de-paz-1-compartido-por-la-coordinación-del-sistema-de-gestión-de-igualdad-de-género-y-no-discrimina', 'Solicitud de publicación de banner (Slider Cultura de Paz #1) compartido por la Coordinación del Sistema de Gestión de Igualdad de Género y No Discriminación de la Dirección de Aseguramiento de la Calidad del TecNM.', '', 's08', NULL, NULL, NULL, NULL, NULL, NULL, 1, '2024-02-19 15:43:03', '2024-02-19 16:06:01', NULL),
(58, 21, 1, 'pr2', 'Solicitud de publicación de convocatoria de admisión 2024 en sitio web institucional www.teziutlan.tecnm.mx', 'solicitud-de-publicación-de-la-convocatoria-correspondiente-al-proceso-de-admisión-2024-en-el-sitio-web-institucional-del-itst-se-adjunta-convocatoria', 'Solicitud de publicación de la convocatoria correspondiente al Proceso de admisión 2024 en el sitio web institucional del ITST. Se adjunta convocatoria en pdf, word y diseño para sección de slider.', '', 's08', NULL, NULL, NULL, NULL, NULL, NULL, 1, '2024-02-20 12:34:03', '2024-02-20 16:32:16', NULL),
(60, 29, 3, 'pr2', 'Concurso de Ciencias Básicas y Ciencias Económico Administrativas 2024, Educación Media Superior', 'se-solicita-publicar-la-convocatoria-en-la-página-principal-de-la-webperiodo-de-publicación-del-23-de-febreo-al-16-de-marzo-de-2024se-solicita-que-el-', 'Se solicita publicar la convocatoria en la página principal de la web\r\nPeriodo de publicación: Del 23 de febreo al 16 de marzo de 2024\r\nSe solicita que el temario quede habilitado para descarga del interesado.', '', 's08', NULL, NULL, NULL, NULL, NULL, NULL, 1, '2024-02-22 11:14:27', '2024-02-23 11:45:20', NULL),
(61, 29, 3, 'pr1', 'Banner de Ciencias Básicas y Ciencias Económico Administrativas', 'favor-de-agregarlo-a-la-publicación-de-la-convocatoria-de-ciencias-básicas-y-ciencias-económico-administrativas', 'Favor de agregarlo a la publicación de la Convocatoria de Ciencias Básicas y Ciencias Económico Administrativas', '', 's08', NULL, NULL, NULL, NULL, NULL, NULL, 1, '2024-02-23 10:07:04', '2024-02-23 11:45:17', NULL),
(62, 27, 1, 'pr2', 'Publicación de archivos dentro del menú INSTITUCIÓN', 'se-requiere-la-publicación-de-los-archivos-incluidos-en-la-carpeta-comprimida-archivos-para-publicar-en-la-página-institucional-dentro-del-menú-instit', 'Se requiere la publicación de los archivos incluidos en la carpeta comprimida \"ARCHIVOS PARA PUBLICAR\", en la página institucional dentro del menú \"INSTITUCIÓN\" con el nombre  \"Sistema Institucional de Archivos\", de acuerdo al archivo en word \"MENU\" incluido en la carpeta comprimida.', '', 's08', NULL, NULL, NULL, NULL, NULL, NULL, 1, '2024-02-27 11:32:03', '2024-03-05 12:31:49', NULL),
(63, 21, 1, 'pr2', 'Solicitud de cambios en sitio web institucional (www.teziutlan.tecnm.mx) con motivo de la Veda electoral 2024.', 'en-apego-a-las-acciones-preventivas-implementadas-por-la-administración-pública-estatal-con-motivo-del-proceso-electoral-2024-y-en-atención-a-las-disp', 'En apego a las acciones preventivas implementadas por la Administración Pública Estatal, con motivo del Proceso Electoral 2024 y en atención a las disposiciones legales y normativas en material electoral, solicito de su amable colaboración para modificar temporalmente el contenido incluido dentro del sitio web institucional www.teziutlan.tecnm.mx, de acuerdo a la siguiente solicitud:\r\n\r\n1.	Modificar el esquema cromático del sitio web en general, basado en la escala de grises que se adjunta a esta solicitud.\r\n2.	Colocar el diseño adjunto en el encabezado del sitio web.\r\n3.	Incluir una ventana emergente con la siguiente leyenda: “En apego a las acciones preventivas implementadas por la Administración Pública Estatal, con motivo del Proceso Electoral 2024, este contenido será modificado temporalmente en atención a las disposiciones legales y normativas en material electoral”, la cual debe aparecer en la ventana principal al momento de abrir el sitio web.\r\n\r\nEstos cambios deben ser vigentes a partir de las 12:00 horas del día jueves 29 de febrero del presente año, hasta las 23:59 horas del domingo 2 de junio del presente año.\r\n\r\nEn caso de tener alguna duda, estoy atento. Muchas gracias.', '', 's08', NULL, NULL, NULL, NULL, NULL, NULL, 1, '2024-02-28 13:28:25', '2024-03-05 14:28:10', NULL),
(64, 21, 1, 'pr1', 'Solicitud de cambios en sitio web institucional con motivo de proceso de veda electoral', 'solicito-de-su-amable-apoyo-para-realizar-los-siguientes-cambios-en-el-sitio-web-institucional-wwwteziutlantecnmmx1-eliminar-los-banners-sigue-nuestra', 'Solicito de su amable apoyo para realizar los siguientes cambios en el sitio web institucional (www.teziutlan.tecnm.mx).\r\n\r\n1. Eliminar los banners: Sigue nuestras redes sociales oficiales del TecNM / TecNM por una cultura de paz y violencia y Bolsa de trabajo OCC.\r\n2. Sustituir los banners: Convocatoria del proceso de admisión 2024 y 8vo. Concurso de Ciencias Básicas y Ciencias Económico-Administrativas 2024, por los que se adjuntan.\r\n\r\nMuchas gracias.', '', 's08', NULL, NULL, NULL, NULL, NULL, NULL, 1, '2024-02-29 11:41:11', '2024-03-05 14:28:45', NULL),
(65, 20, 1, 'pr1', 'Solicitud publicacion archivo pag TEC', 'conta-me-solicito-el-auditor-externo-publicara-el-resultado-de-la-evaluación-sevac-se-pudiera-a-un-lado-de-la-dirección-del-sevac-o-abajo-me-apoye-en-', 'CONTA ME SOLICITO EL AUDITOR EXTERNO PUBLICARA EL RESULTADO DE LA EVALUACIÓN SEVAC, SE PUDIERA A UN LADO DE LA DIRECCIÓN DEL SEVAC O ABAJO ME APOYE EN PUBLICAR LOS RESULTADOS DE LA ENCUESTA DE FAVOR.', '', 's08', NULL, NULL, NULL, NULL, NULL, NULL, 1, '2024-03-11 18:40:51', '2024-04-12 15:18:12', NULL),
(66, 30, 1, 'pr2', 'Actualización de Atributos de Egreso', 'actualización-de-atributos-de-egreso', 'actualización de Atributos de egreso', '', 's08', NULL, NULL, NULL, NULL, NULL, NULL, 1, '2024-03-20 12:44:40', '2024-04-21 07:17:11', NULL),
(67, 31, 1, 'pr1', 'solicitud para subir artes de slider y Convocatorias de Maestrías para la Página Web Institucional', 'estimado-contador-agustin-ronzon-jimenezespero-que-este-mensaje-le-encuentre-bien-le-escribo-para-informarle-que-hemos-concluido-con-la-elaboración-de', 'Estimado Contador Agustin Ronzon Jimenez,\r\n\r\nEspero que este mensaje le encuentre bien. Le escribo para informarle que hemos concluido con la elaboración de los artes destinados al slider de la página web del Tec de Teziutlán, así como las convocatorias de las dos maestrías que nuestra institución está ofreciendo actualmente.\r\n\r\nHe adjuntado los archivos correspondientes a este correo. Para el slider de la página principal, encontrará los artes que hemos diseñado con el objetivo de captar la atención de nuestros visitantes y promover eficazmente las actividades y novedades de nuestro Tecnológico.\r\n\r\nEn cuanto a las convocatorias de las maestrías, he incluido tanto los diseños como los textos definitivos que deberán acompañarlos. Estos han sido cuidadosamente preparados para proporcionar toda la información necesaria de manera clara y concisa, asegurando que los interesados puedan entender fácilmente cómo formar parte de nuestros programas de posgrado.\r\n\r\nLe agradecería si pudiera proceder con la actualización de la página web institucional, colocando el material provisto en las secciones correspondientes. Es importante para nosotros mantener nuestra comunidad informada.\r\n\r\nAgradezco de antemano su colaboración en este asunto.\r\nSaludos cordiales ', '', 's08', NULL, NULL, NULL, NULL, NULL, NULL, 1, '2024-03-21 10:47:49', '2024-04-14 23:14:14', NULL),
(68, 33, 1, 'pr1', 'Solicitud de Cambio de Número Telefónico Oficial de la línea de admisión del ITST', 'actualmente-el-número-telefónico-oficial-de-la-línea-de-admisión-que-figura-en-nuestros-registros-redes-sociales-y-en-la-página-institucional-es-231-2', 'Actualmente, el número telefónico oficial de la línea de admisión que figura en nuestros registros, redes sociales y en la página institucional es 231-205-8393. Sin embargo, debido a problemas técnicos, nos gustaría solicitar amablemente el cambio de este número por el siguiente:\r\n\r\nNuevo Número Telefónico: 231-156-2527\r\n\r\nNos gustaría que este nuevo número sea actualizado lo antes posible en todos nuestros materiales institucionales, incluyendo nuestra página web, directorio interno y cualquier otro sitio oficial donde se mencione nuestro número de contacto de la línea de admisión del ITST.\r\n\r\nPor favor, háganos saber si es necesario completar algún formulario adicional o proporcionar más detalles para facilitar este cambio. Estamos disponibles para colaborar en cualquier proceso que sea necesario para llevar a cabo esta actualización de manera efectiva.\r\n\r\nAgradecemos de antemano su atención a esta solicitud y quedamos a la espera de su pronta respuesta.\r\n\r\nSANTIAGO MIGUEL ACOSTA \r\nJEFE DEL DEPARTAMENTO DE VINCULACIÓN  ', 'https://teziutlan.tecnm.mx/index.php/convocatoria-admision-2024/', 's08', NULL, NULL, NULL, NULL, NULL, NULL, 1, '2024-04-04 12:36:58', '2024-04-12 15:17:40', NULL),
(69, 27, 1, 'pr2', 'Denuncias Ciudadanas', 'en-el-menú-denuncias-ciudadanas-de-la-sección-transparencia-favor-de-agregar-el-archivo-anexo-correspondiente-al-1er-trimestre-2024', 'En el menú \"DENUNCIAS CIUDADANAS\" de la sección \"TRANSPARENCIA\", favor de agregar  el archivo anexo correspondiente al 1er trimestre 2024', '', 's08', NULL, NULL, NULL, NULL, NULL, NULL, 1, '2024-04-17 12:49:46', '2024-04-21 07:27:02', NULL),
(70, 20, 1, 'pr1', 'Actualización pagina transparencia edos financieros', 'estimado-contador-adjuntos-zip-de-los-estados-financieros-correspondientes-al-primer-trimestre-2024-para-que-me-apoye-en-publicarlos-en-la-página-inst', 'Estimado contador adjuntos zip de los estados financieros correspondientes al primer trimestre 2024 para que me apoye en publicarlos en la página Institucional para poder así elaborar la fracción de transparencia de la pagina del SIPOT. De antemano agradezco su atención.', '', 's08', NULL, NULL, NULL, NULL, NULL, NULL, 1, '2024-04-18 18:12:26', '2024-04-21 07:11:33', NULL),
(71, 12, 1, 'pr1', 'Modificación de información publicada en la pagina institucional', 'modificación-de-información-publicada-por-modificaciones-de-próxima-acreditación-por-parte-de-cacei', 'Modificación de información publicada por modificaciones de próxima acreditación por parte de CACEI', '', 's08', NULL, NULL, NULL, NULL, NULL, NULL, 1, '2024-04-19 15:01:27', '2024-04-21 07:22:03', NULL),
(72, 20, 1, 'pr1', 'Actualización pagina Institucional', 'de-favor-conta-nos-pudiera-apoyar-con-subir-lo-más-pronto-posible-la-presente-información-de-antemano-agradezco-el-apoyo', 'De favor conta nos pudiera apoyar con subir lo más pronto posible la presente información. De antemano agradezco el apoyo.', '', 's08', NULL, NULL, NULL, NULL, NULL, NULL, 1, '2024-05-10 12:17:07', '2024-05-10 12:41:36', NULL),
(73, 31, 1, 'pr2', 'solicitud para subir a la pagina del tec de teziutlan la convocatoria de los cursos de verano', 'me-dirijo-a-usted-para-solicitar-amablemente-su-apoyo-en-la-publicación-de-la-convocatoria-de-los-cursos-de-verano-en-la-página-web-del-instituto-tecn', 'Me dirijo a usted para solicitar amablemente su apoyo en la publicación de la convocatoria de los cursos de verano en la página web del Instituto Tecnológico de Teziutlán. Estos cursos representan una excelente oportunidad para que nuestros estudiantes y la comunidad en general continúen con su formación académica.', '', 's08', NULL, NULL, NULL, NULL, NULL, NULL, 1, '2024-05-20 15:36:34', '2024-05-29 15:27:03', NULL),
(74, 20, 1, 'pr1', 'SUSTITUCIÓN ESTADOS DE CUENTA 4TO TRIMESTRE 2023', 'estimado-contador-reciba-un-cordial-saludo-a-su-vez-sirva-el-mismo-para-solicitar-su-invaluable-apoyo-en-sustituir-los-estados-financieros-correspondi', 'ESTIMADO CONTADOR RECIBA UN CORDIAL SALUDO A SU VEZ SIRVA EL MISMO PARA SOLICITAR SU INVALUABLE APOYO EN SUSTITUIR LOS ESTADOS FINANCIEROS CORRESPONDIENTES AL 4TRO TRIMESTRE 2023, LO MAS PRONTO POSIBLE DERIVADO OBSERVACIÓN DE AUDITORIA EXTERNA. QUEDO PENDIENTE DE ANTEMANO AGRADEZCO SU ATENCIÓN.', '', 's08', NULL, NULL, NULL, NULL, NULL, NULL, 1, '2024-05-27 15:06:13', '2024-05-29 15:56:37', NULL),
(75, 20, 1, 'pr1', 'SUSTITUCION MANUAL DE CONTABILIDAD GUBERNAMENTAL PAG INSTITUCIONAL', 'estimado-conta-disculpe-le-moleste-con-este-documento-que-igual-me-lo-están-solicitando-pero-ahora-de-la-asep-pues-publique-el-universal-y-quieren-el-', 'ESTIMADO CONTA DISCULPE LE MOLESTE CON ESTE DOCUMENTO QUE IGUAL ME LO ESTÁN SOLICITANDO PERO AHORA DE LA ASEP PUES PUBLIQUE EL UNIVERSAL Y QUIEREN EL INSTITUCIONAL, DE ANTEMANO LE AGRADEZCO EL APOYO PARA CON UNA SERVIDORA.', '', 's08', NULL, NULL, NULL, NULL, NULL, NULL, 1, '2024-05-29 12:21:23', '2024-05-29 15:56:27', NULL),
(76, 31, 1, 'pr2', 'Solicitud para Restaurar los Colores en la Página Web del Tec de Teziutlán', 'me-dirijo-a-usted-para-solicitar-que-se-restauren-los-colores-originales-en-la-página-web-de-nuestra-institución-como-es-de-su-conocimiento-la-veda-el', 'Me dirijo a usted para solicitar que se restauren los colores originales en la página web de nuestra institución. Como es de su conocimiento, la veda electoral ha concluido, por lo que consideramos oportuno volver a la versión colorida de nuestro sitio web para mantener una presentación más atractiva y dinámica para nuestros usuarios.\r\n\r\nAgradezco de antemano su pronta atención a esta solicitud y quedo a su disposición para cualquier duda o requerimiento adicional.', '', 's01', NULL, NULL, NULL, NULL, NULL, NULL, 1, '2024-06-03 13:44:50', '2024-06-03 13:44:50', NULL),
(77, 38, 1, 'pr2', 'Actualización del Apartado del Programa Presupuestario en el WebSite', 'solicito-de-la-manera-más-atenta-realizar-la-actualización-del-programa-presupuestario-publicado-en-el-sitio-web-institucional-ubicado-en-la-siguiente', 'Solicito de la manera más atenta, realizar la actualización del Programa Presupuestario publicado en el sitio web Institucional, ubicado en la siguiente ruta:\r\nInicio -> Transparencia -> Programa Presupuestario\r\nhttps://teziutlan.tecnm.mx/index.php/transparencia/programa-presupuestario/\r\n\r\nActualización 1:\r\nAdición del 3er. y 4to. Informe de Evaluación 2023 en la carpeta correspondiente\r\nActualización 2:\r\nTodos los documentos que conforman la Carpeta “Programa Presupuestario y Evaluaciones (SEE) 2023 (con los 4 Informes de Evaluación), deberán ser reubicados en el “Histórico del Programa Presupuestario y Evaluaciones (SEE)”.\r\n Actualización 3:\r\nCrear el apartado “Programa Presupuestario y Evaluaciones (SEE) 2024, mismo que deberá mostrar los formatos contenidos en las carpetas:\r\n1.	Programa Presupuestario 2024\r\n2.	Informes de Evaluación (SEE) 2024\r\n\r\nEs decir, esta información deberá ser la que aparezca como información vigente de 2024.\r\nAgradezco mucho su atención.', 'https://teziutlan.tecnm.mx/index.php/transparencia/programa-presupuestario/', 's01', NULL, NULL, NULL, NULL, NULL, NULL, 1, '2024-06-11 15:32:06', '2024-06-11 15:32:06', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(80) NOT NULL,
  `apaterno` varchar(80) NOT NULL,
  `amaterno` varchar(80) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone_no` varchar(20) NOT NULL,
  `role` varchar(20) NOT NULL,
  `password` varchar(255) NOT NULL,
  `reset_token` varchar(100) DEFAULT NULL,
  `reset_expiration` datetime DEFAULT NULL,
  `area` int(12) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `apaterno`, `amaterno`, `email`, `phone_no`, `role`, `password`, `reset_token`, `reset_expiration`, `area`, `image`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Edgar', 'Degante', 'Aguilar', 'edgar.degante.a@gmail.com', '2312066656', 'admin', '$2y$10$d0a2qJnv2ft8C9aDcJVTrOKlTH2fC7OVXDdnLv.TjgCkAv6AvLWpq', NULL, NULL, 1, '1690836671_bb7025b7df6f35e76784.jpg', '2023-07-31 14:51:11', '2024-06-05 13:39:24', NULL),
(2, 'Admin', 'Admin', 'Admin', 'admin@mail.com', '2312066656', 'admin', '$2y$10$MMtwPCzsKsLN1WOpw3ZM6eE2WXnar2pDNN5a2KpjuiP3qpqcJzxF.', NULL, NULL, 1, NULL, '2023-08-07 10:41:15', '2023-08-07 10:41:15', NULL),
(3, 'Agustín', 'Ronzón', 'Jiménez', 'agustin.rj@teziutlan.tecnm.mx', '2313114000', 'admin', '$2y$10$hnTIeXGThJziYeLwwbr/oubjec0vby6GS3wLBsesfUrNrkwVQTX66', NULL, NULL, 1, NULL, '2023-07-31 15:00:07', '2023-07-31 15:00:07', NULL),
(4, 'Edgar', 'Degante ', 'Aguilar ', 'edgar.da@teziutlan.tecnm.mx', '2312066656', 'usuario', '$2y$10$JCdgK9Xu5jwdOpAYYMY9/uaEedKFLoOCVKEWAejA1Vsro5Eml.LV.', NULL, NULL, 1, '1690837688_e990e8bdaf1d932f8a2c.jpg', '2023-07-31 15:08:08', '2023-07-31 15:08:08', NULL),
(5, 'Isaidán', 'Rojas', 'Reyes', 'isaidan.rr@teziutlan.tecnm.mx', '2313114000', 'usuario', '$2y$10$cDAwUC1PUIiPp2ySHHlwNuz.eKClNaLJUoe0SSEChC3rMab.RBJOi', NULL, NULL, 1, '1690842033_ba7ff83a5aefd0db1067.jpg', '2023-07-31 16:20:33', '2023-12-05 14:30:02', NULL),
(6, 'Emmanuel', 'Vázquez', 'Benito', 'emmanuel.vb@teziutlan.tecnm.mx', '1234567890', 'usuario', '$2y$10$VPaeHMKEpuuSpdFmPhkodupArb7zrV8GPKSvLSpoN6aJpxJqDCpu.', NULL, NULL, 1, '1690842324_a61f9f13198a8ddbbcd5.jpg', '2023-07-31 16:25:24', '2023-07-31 16:25:24', NULL),
(7, 'Yasser', 'Marin', 'Lombard', 'yasser.ml@teziutlan.tecnm.mx', '2311234567', 'usuario', '$2y$10$IgGSzAQjy6kDiU7fwGnY1ODzUFuxBTGfWVIQ0olZYFLjOWN8oscAa', NULL, NULL, 1, NULL, '2023-08-07 12:17:58', '2023-08-07 12:17:58', NULL),
(8, 'Miriam', 'Vazquez', 'Evaristo', 'miriam.ve@teziutlan.tecnm.mx', '2313269832', 'usuario', '$2y$10$9Sjc6qR/W4XJT4tpFTIv.eHyUNl1ygDKXW1C6ZTYkm9KyiDXiVQ5K', NULL, NULL, 1, NULL, '2023-08-07 15:15:46', '2023-08-07 15:15:46', NULL),
(9, '', '', '', '', '', 'usuario', '$2y$10$u4DGvH0rXgvqEHaRK3LxT.10WiP/ZYJkKk8VIHVEVMj9XM5YjOnnS', NULL, NULL, 1, NULL, '2023-08-07 15:40:06', '2023-08-07 15:40:06', NULL),
(10, 'David', 'Castillo', 'Oyarzabal', 'davidcastillooyarzabal@gmail.com', '2313114000', 'usuario', '$2y$10$VEXxUm/LovG0yNSRyucra.gbOHQslPV3H3a4dCAPJ4DfJdGJyxdmm', NULL, NULL, 1, NULL, '2023-09-22 14:17:20', '2023-09-22 14:17:20', NULL),
(11, 'Rosa Nelly', 'Aragón', 'Francisco', 'rosanelly.aragon@live.itsteziutlan.edu.mx', '2313870244', 'usuario', '$2y$10$SGxPzEiDiNjQaM9sjk9ZA.mZAM3XkegnqXbynH0o3UVEb1FBvsSH6', NULL, NULL, 1, NULL, '2023-09-26 15:44:56', '2023-09-26 15:44:56', NULL),
(12, 'JULIO C', 'CAMARGO', 'SANTOS', 'julio.cs@teziutlan.tecnm.mx', '2313114000', 'usuario', '$2y$10$Gdktu8PJUbQgnkYVhtO2bey8/2K5bSAnQQCbRYCubdRI.AQ9Owirm', NULL, NULL, 3, NULL, '2023-10-04 10:16:02', '2023-10-04 10:16:02', NULL),
(13, 'JULIO CÉSAR', 'RUÍZ', 'AGUILAR', 'dda_dteziutlan@tecnm.mx', '2311084525', 'usuario', '$2y$10$IxhgwfHFFQz6qEl5jnXDweJph7WfeVjr7UBPyzWtSTJMGK20V5GzK', NULL, NULL, 5, NULL, '2023-10-04 12:57:50', '2023-10-04 12:57:50', NULL),
(14, 'Heladio Gabriel', 'Méndez', 'Prince', 'heladio.mp@teziutlan.tecnm.mx', '2261154734', 'usuario', '$2y$10$NlsfZ6xuQI9vE5OuSezRluB/EUUa9Bk2DwsobcoTmwFpjsc5vC4fS', NULL, NULL, 1, NULL, '2023-10-04 15:45:41', '2023-10-04 15:45:41', NULL),
(15, 'Edgar', 'Degante', 'Aguilar', 'admin@mail.com', '2312066656', 'usuario', '$2y$10$dYVI6WGawUEW5trKUBAVd.MQFV7ObFQoBFE/wJW6s0c08HqYPnGYS', NULL, NULL, 1, NULL, '2023-10-11 12:24:06', '2023-10-11 12:24:06', NULL),
(16, 'edgar', 'degante', 'aguilar', 'admin2@mail.com', '1321561616', 'usuario', '$2y$10$G6Cux3Vx.7wPViKLrG9cK.puVb9G/Jh2KSGhaQ3q/J3.SR9qjEKrm', NULL, NULL, 1, NULL, '2023-10-11 12:26:02', '2023-10-11 12:26:02', NULL),
(17, 'Edgar', 'Aburto', 'Valdez', 'edgar.av@teziutlan.tecnm.mx', '2313114000', 'usuario', '$2y$10$3kyfnFO3FEzzxIDopzmXTukTQFMio5.O1We.s71vR6vp5K0K.gFSW', '7d0ef137641d49ab487445233cf27b8fdd3fab1d2ad5351071aad6a6706836501099b792accba070c222a5daf3be899f52f8', '2024-06-11 12:28:38', 1, NULL, '2023-10-12 12:52:25', '2024-06-11 11:28:38', NULL),
(18, 'Diego', 'Maza', 'Sánchez', 'diego.ms@teziutlan.tecnm.mx', '2313114000', 'usuario', '$2y$10$RyjgBq3CgisZ59PQCBOIoeM6/BnXr911AY2BWdnJRP3QmlGyesuze', NULL, NULL, 5, NULL, '2023-10-14 15:00:24', '2023-10-14 15:00:24', NULL),
(19, 'María del Carmen ', 'Leal', 'MARTINEZ', 'carmenmichellemartinez2502@gmail.com', '2311763111', 'usuario', '$2y$10$PBSigxdzwfjyzU9TyCg9sOStyw.mf7oQJ02SvZ6hFQ0eB/EJdkybO', NULL, NULL, 1, '1697574084_44d2eb7aac60e2d49c7f.jpg', '2023-10-17 14:21:24', '2023-10-17 14:21:24', NULL),
(20, 'Rosa Linda', 'Calixto', 'Madrid', 'rosalinda.calixto@live.itsteziutlan.edu.mx', '2312328948', 'usuario', '$2y$10$TS/P8jxyzkqJtNhjEAxbDu1QPHMNPGPIIVDbp8b81FeVzi4huZ5WO', NULL, NULL, 2, NULL, '2023-10-19 13:51:59', '2023-10-19 13:51:59', NULL),
(21, 'Alhan', 'Espinoza de los Monteros', 'Ortiz', 'alhan.eo@teziutlan.tecnm.mx', '2313114000', 'usuario', '$2y$10$PcK95O4z/Z6LfGvbmf3kEed4z6Z2717ryZiGG0N8jBEO0dbiH3H8S', NULL, NULL, 7, NULL, '2023-10-27 10:38:46', '2024-02-19 15:38:22', NULL),
(22, 'Rebeca', 'Sedano', 'Luján', 'rebeca.sedano@live.itsteziutlan.edu.mx', '2311100815', 'usuario', '$2y$10$7M7hes3CEi6d7wLK0lVuY.KiUWiHcsNsf1O/yGP5KDZtWmKZvLRXC', NULL, NULL, 8, NULL, '2023-10-27 11:38:13', '2023-10-27 11:38:13', NULL),
(23, 'Myriam', 'Sánchez', 'Pérez', 'myriam.sp@teziutlan.tecnm.mx', '2311078289', 'usuario', '$2y$10$GkI5Dl1bZj1RKN.CCrpo5.fCodSfFFID2b3Voq3knGWSWfyTNmTBu', NULL, NULL, 1, '1699062624_bd1544f06ae2a6613eb9.jpg', '2023-11-03 19:50:24', '2023-11-03 19:50:24', NULL),
(24, 'Dulce María ', 'Guzmán ', 'Mendoza ', 'l19te0650@teziutlan.tecnm.mx', '2311539428', 'usuario', '$2y$10$7d1yVJw38mMsqPXbnDYj0ed1ut0qUWZGo0UkN41ruq3UXH7Q/MMnu', NULL, NULL, 1, NULL, '2023-11-15 11:49:38', '2023-11-15 11:49:38', NULL),
(25, 'Isaidan', 'Rojas', 'Reyes', 'isaidanjared.rojas@live.itsteziutlan.edu.mx', '2331216291', 'usuario', '$2y$10$pyGyMx02V6buTGureWvki.NVUS0NplOydo3VS.B.R1ytoJGEOj7CO', NULL, NULL, 2, NULL, '2024-01-15 16:13:34', '2024-01-15 16:13:34', NULL),
(26, 'Héctor ', 'Vicenteño', 'Vicenteño', 'hectorvr78@gmail.com', '2313114000', 'usuario', '$2y$10$dC2K8Ty3/DdYY1HrlS6BCOONJlYat4bS/L06PEGENWnTtgF2olBc.', NULL, NULL, 1, NULL, '2024-01-19 16:44:45', '2024-01-19 16:44:45', NULL),
(27, 'Leticia', 'Aguilar', 'Rodríguez', 'josebernardo.bello@live.itsteziutlan.edu.mx', '2311761251', 'usuario', '$2y$10$xUBaR.NRpO9kJIzyCffbb.s8v.WZ9ki7d7AC1.iaVb4UCklkR1G2K', NULL, NULL, 7, NULL, '2024-01-26 11:05:45', '2024-01-26 11:05:45', NULL),
(28, 'Julio Víctor', 'Galindo', 'Rojas', 'julio.gr@teziutlan.tecnm.mx', '2313227768', 'usuario', '$2y$10$LQJyn/3/S9Sg3cwQ7TmQAuX0hBwkcWaRGLxHrcHi2S0z0V4jL49Hi', NULL, NULL, 1, NULL, '2024-01-30 16:52:54', '2024-01-30 16:52:54', NULL),
(29, 'Paula', 'Durán', 'Méndez', 'paula.dm@teziutlan.tecnm.mx', '2311178683', 'usuario', '$2y$10$t6zZbauHs6wVb9KScPw/0e/L0Vh/Q3lDwaUyohVgJfj12l.1vaxme', NULL, NULL, 1, NULL, '2024-02-21 14:32:31', '2024-02-21 14:32:31', NULL),
(30, 'Victor Hugo', 'Vázquez', 'Nochebuena', 'victor.vn@teziutlan.tecnm.mx', '2313114001', 'usuario', '$2y$10$wV3gfD6MWkj6rDTRmJMEseRc3nA1N4oCQ8LuNJnGp1uwcHWsEsreS', NULL, NULL, 7, NULL, '2024-03-20 12:34:53', '2024-03-20 12:34:53', NULL),
(31, 'CHRISTIAN ALEJANDRO', 'PARRA', 'VAZQUEZ', 'christian.pv@teziutlan.tecnm.mx', '2311321950', 'usuario', '$2y$10$hReSVSemwZelsAhKZxahu.de94PijnNWiWdfChjV30dFHfYq7NzZm', NULL, NULL, 7, NULL, '2024-03-21 10:43:29', '2024-03-21 10:43:29', NULL),
(32, 'Luz Celia', 'Valera', 'Manilla', 'luz.vm@teziutlan.tecnm.mx', '2331467174', 'usuario', '$2y$10$VcOEw6VVTy/TW3rqE0tBFu4gE4ZnTeBcH22fB2GqZ1L.EVXkKKsgK', NULL, NULL, 7, NULL, '2024-04-04 12:01:34', '2024-04-04 12:01:34', NULL),
(33, 'Santiago Miguel ', 'Acosta ', 'Hernández ', 'vinculacion@teziutlan.tecnm.mx', '2311562527', 'usuario', '$2y$10$uZX5qvEHsXH4U4GsH6zHwOmLX.wagjtexWGPuo8g0MYOasbHIN12m', NULL, NULL, 7, NULL, '2024-04-04 12:07:43', '2024-04-04 12:07:43', NULL),
(34, 'Julio Víctor', 'Galindo', 'Rojas', 'julio.gr@teziutlan.tecnm.mx', '2313227768', 'usuario', '$2y$10$1Su2O1BMArce1q66yxwNzupX43VTQX2X45GcPW5nUOQJ/s1t8yIxy', NULL, NULL, 1, NULL, '2024-04-29 11:32:11', '2024-04-29 12:46:50', NULL),
(35, 'Julio Víctor', 'Galindo', 'Rojas', 'julio.gr@teziutlan.tecnm.mx', '2313227768', 'usuario', '$2y$10$QKiZocAXUD6T.ftf7KHbP.z1iKvQyfM63h1SAyN.XYR0mD59PLMJ.', NULL, NULL, 1, NULL, '2024-04-29 11:33:31', '2024-04-29 12:55:53', NULL),
(36, 'Edgar', 'Degante', 'Aguilar', 'edgardegantea@outlook.com', '2312051120', 'usuario', '$2y$10$GUnv2MbkyTUpBytYRtwFdemfbL6QE.pKBt0VOGbAlFlMZJlDb7wCS', NULL, NULL, 1, NULL, '2024-06-05 09:11:31', '2024-06-05 09:11:31', NULL),
(37, 'Edgar ', 'Aburto', 'Valdez', 'edgar.av@teziutlan.tecnm.mx', '2311538130', 'usuario', '$2y$10$qGZgD1g3aanVPnINgft0feCBmpl2.uraW2/bie62Qf3iK9IPy/CBm', NULL, NULL, 1, NULL, '2024-06-11 11:32:49', '2024-06-11 11:32:49', NULL),
(38, 'Minerva Marlene ', 'Mendoza', 'Rosales', 'minerva.mr@teziutlan.tecnm.mx', '2311513117', 'usuario', '$2y$10$BFTXWgjbhvLTFt3KdnkeKO2zr7ad3C15DEDaTnoOWjVtswh/HOAPS', NULL, NULL, 1, NULL, '2024-06-11 11:39:29', '2024-06-11 11:39:29', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `adjuntos_mensaje`
--
ALTER TABLE `adjuntos_mensaje`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mensaje_id` (`mensaje_id`);

--
-- Indexes for table `areas`
--
ALTER TABLE `areas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attachments`
--
ALTER TABLE `attachments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ticket_id` (`ticket_id`);

--
-- Indexes for table `bitacoras`
--
ALTER TABLE `bitacoras`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ticket` (`ticket`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mensajes`
--
ALTER TABLE `mensajes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ticket_id` (`ticket_id`),
  ADD KEY `usuario_id` (`usuario_id`);

--
-- Indexes for table `priorities`
--
ALTER TABLE `priorities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `status`
--
ALTER TABLE `status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category` (`category`),
  ADD KEY `priority` (`priority`),
  ADD KEY `status` (`status`),
  ADD KEY `usuario` (`usuario`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `area` (`area`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `adjuntos_mensaje`
--
ALTER TABLE `adjuntos_mensaje`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `areas`
--
ALTER TABLE `areas`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `attachments`
--
ALTER TABLE `attachments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

--
-- AUTO_INCREMENT for table `bitacoras`
--
ALTER TABLE `bitacoras`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `mensajes`
--
ALTER TABLE `mensajes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `tickets`
--
ALTER TABLE `tickets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `adjuntos_mensaje`
--
ALTER TABLE `adjuntos_mensaje`
  ADD CONSTRAINT `adjuntos_mensaje_ibfk_1` FOREIGN KEY (`mensaje_id`) REFERENCES `mensajes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `attachments`
--
ALTER TABLE `attachments`
  ADD CONSTRAINT `attachments_ibfk_1` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `bitacoras`
--
ALTER TABLE `bitacoras`
  ADD CONSTRAINT `bitacoras_ibfk_1` FOREIGN KEY (`ticket`) REFERENCES `tickets` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `mensajes`
--
ALTER TABLE `mensajes`
  ADD CONSTRAINT `mensajes_ibfk_1` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tickets`
--
ALTER TABLE `tickets`
  ADD CONSTRAINT `tickets_ibfk_1` FOREIGN KEY (`usuario`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tickets_ibfk_2` FOREIGN KEY (`category`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tickets_ibfk_3` FOREIGN KEY (`priority`) REFERENCES `priorities` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tickets_ibfk_4` FOREIGN KEY (`status`) REFERENCES `status` (`id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`area`) REFERENCES `areas` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

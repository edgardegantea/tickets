-- phpMyAdmin SQL Dump
-- version 4.9.11
-- https://www.phpmyadmin.net/
--
-- Host: db5013939844.hosting-data.io
-- Generation Time: Oct 11, 2023 at 06:45 PM
-- Server version: 10.6.15-MariaDB-1:10.6.15+maria~deb11-log
-- PHP Version: 7.0.33-0+deb9u12

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
(5, 'Desarrollo Academico', 'Desarrollo Academico', '', 'dda_dteziutlan@tecnm.mx', 1, '2023-10-04 12:55:24', '2023-10-04 12:55:24');

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
(19, 28, '1697048916_cd350eabeff1dcb5486f.pdf'),
(20, 29, '1697049661_9f3f5c131674329aff0b.pdf'),
(21, 29, '1697049661_fb739ba780ecbc2ff1ff.csv'),
(22, 29, '1697049661_f8d0be5a9859485678d2.pdf'),
(23, 29, '1697049661_4721f05260393e4cd2fb.csv');

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
(14, 28, 16, 'Podrá revisar el archivo adjunto?', '2023-10-11 16:29:05', '2023-10-11 12:29:05', NULL),
(15, 28, 2, 'claro que sí', '2023-10-11 16:30:33', '2023-10-11 12:30:33', NULL),
(16, 28, 16, 'Gracias por atender la petición', '2023-10-11 16:31:28', '2023-10-11 12:31:28', NULL);

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
(28, 16, 3, 'pr4', 'ticket de prueba', 'ticket-de-prueba', 'ticket de prueba', '', 's01', NULL, NULL, NULL, NULL, NULL, NULL, 1, '2023-10-11 12:28:36', '2023-10-11 12:28:36', NULL),
(29, 16, 3, 'pr4', 'otro ticket con varios archivos', 'djasñdñlasdñl', 'djasñdñlasdñl', '', 's01', NULL, NULL, NULL, NULL, NULL, NULL, 1, '2023-10-11 12:41:01', '2023-10-11 12:41:01', NULL);

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
  `area` int(12) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `apaterno`, `amaterno`, `email`, `phone_no`, `role`, `password`, `area`, `image`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Edgar', 'Degante', 'Aguilar', 'edgar.degante.a@gmail.com', '2312066656', 'admin', '$2y$10$iD4QMKLt2dmn.sCTn.SUzuiHF.nw42HWtlFT.Df/8s/2QV81fuyVa', 1, '1690836671_bb7025b7df6f35e76784.jpg', '2023-07-31 14:51:11', '2023-07-31 14:51:40', NULL),
(2, 'Admin', 'Admin', 'Admin', 'admin@mail.com', '2312066656', 'admin', '$2y$10$MMtwPCzsKsLN1WOpw3ZM6eE2WXnar2pDNN5a2KpjuiP3qpqcJzxF.', 1, NULL, '2023-08-07 10:41:15', '2023-08-07 10:41:15', NULL),
(3, 'Agustín', 'Ronzón', 'Jiménez', 'agustin.rj@teziutlan.tecnm.mx', '2313114000', 'admin', '$2y$10$hnTIeXGThJziYeLwwbr/oubjec0vby6GS3wLBsesfUrNrkwVQTX66', 1, NULL, '2023-07-31 15:00:07', '2023-07-31 15:00:07', NULL),
(4, 'Edgar', 'Degante ', 'Aguilar ', 'edgar.da@teziutlan.tecnm.mx', '2312066656', 'usuario', '$2y$10$JCdgK9Xu5jwdOpAYYMY9/uaEedKFLoOCVKEWAejA1Vsro5Eml.LV.', 1, '1690837688_e990e8bdaf1d932f8a2c.jpg', '2023-07-31 15:08:08', '2023-07-31 15:08:08', NULL),
(5, 'Isaidán', 'Rojas', 'Reyes', 'isaidan.rr@teziutlan.tecnm.mx', '2313114000', 'usuario', '$2y$10$dHE21zNACERSmD5f0Nkt0.SNKgDNmysHO0xyvQmLpdxIBnBXDcPOO', 2, '1690842033_ba7ff83a5aefd0db1067.jpg', '2023-07-31 16:20:33', '2023-07-31 16:20:33', NULL),
(6, 'Emmanuel', 'Vázquez', 'Benito', 'emmanuel.vb@teziutlan.tecnm.mx', '1234567890', 'usuario', '$2y$10$VPaeHMKEpuuSpdFmPhkodupArb7zrV8GPKSvLSpoN6aJpxJqDCpu.', 1, '1690842324_a61f9f13198a8ddbbcd5.jpg', '2023-07-31 16:25:24', '2023-07-31 16:25:24', NULL),
(7, 'Yasser', 'Marin', 'Lombard', 'yasser.ml@teziutlan.tecnm.mx', '2311234567', 'usuario', '$2y$10$IgGSzAQjy6kDiU7fwGnY1ODzUFuxBTGfWVIQ0olZYFLjOWN8oscAa', 1, NULL, '2023-08-07 12:17:58', '2023-08-07 12:17:58', NULL),
(8, 'Miriam', 'Vazquez', 'Evaristo', 'miriam.ve@teziutlan.tecnm.mx', '2313269832', 'usuario', '$2y$10$9Sjc6qR/W4XJT4tpFTIv.eHyUNl1ygDKXW1C6ZTYkm9KyiDXiVQ5K', 1, NULL, '2023-08-07 15:15:46', '2023-08-07 15:15:46', NULL),
(9, '', '', '', '', '', 'usuario', '$2y$10$u4DGvH0rXgvqEHaRK3LxT.10WiP/ZYJkKk8VIHVEVMj9XM5YjOnnS', 1, NULL, '2023-08-07 15:40:06', '2023-08-07 15:40:06', NULL),
(10, 'David', 'Castillo', 'Oyarzabal', 'davidcastillooyarzabal@gmail.com', '2313114000', 'usuario', '$2y$10$VEXxUm/LovG0yNSRyucra.gbOHQslPV3H3a4dCAPJ4DfJdGJyxdmm', 1, NULL, '2023-09-22 14:17:20', '2023-09-22 14:17:20', NULL),
(11, 'Rosa Nelly', 'Aragón', 'Francisco', 'rosanelly.aragon@live.itsteziutlan.edu.mx', '2313870244', 'usuario', '$2y$10$SGxPzEiDiNjQaM9sjk9ZA.mZAM3XkegnqXbynH0o3UVEb1FBvsSH6', 1, NULL, '2023-09-26 15:44:56', '2023-09-26 15:44:56', NULL),
(12, 'JULIO C', 'CAMARGO', 'SANTOS', 'julio.cs@teziutlan.tecnm.mx', '2313114000', 'usuario', '$2y$10$Gdktu8PJUbQgnkYVhtO2bey8/2K5bSAnQQCbRYCubdRI.AQ9Owirm', 3, NULL, '2023-10-04 10:16:02', '2023-10-04 10:16:02', NULL),
(13, 'JULIO CÉSAR', 'RUÍZ', 'AGUILAR', 'dda_dteziutlan@tecnm.mx', '2311084525', 'usuario', '$2y$10$IxhgwfHFFQz6qEl5jnXDweJph7WfeVjr7UBPyzWtSTJMGK20V5GzK', 5, NULL, '2023-10-04 12:57:50', '2023-10-04 12:57:50', NULL),
(14, 'Heladio Gabriel', 'Méndez', 'Prince', 'heladio.mp@teziutlan.tecnm.mx', '2261154734', 'usuario', '$2y$10$NlsfZ6xuQI9vE5OuSezRluB/EUUa9Bk2DwsobcoTmwFpjsc5vC4fS', 1, NULL, '2023-10-04 15:45:41', '2023-10-04 15:45:41', NULL),
(15, 'Edgar', 'Degante', 'Aguilar', 'admin@mail.com', '2312066656', 'usuario', '$2y$10$dYVI6WGawUEW5trKUBAVd.MQFV7ObFQoBFE/wJW6s0c08HqYPnGYS', 1, NULL, '2023-10-11 12:24:06', '2023-10-11 12:24:06', NULL),
(16, 'edgar', 'degante', 'aguilar', 'admin2@mail.com', '1321561616', 'usuario', '$2y$10$G6Cux3Vx.7wPViKLrG9cK.puVb9G/Jh2KSGhaQ3q/J3.SR9qjEKrm', 1, NULL, '2023-10-11 12:26:02', '2023-10-11 12:26:02', NULL);

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
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `attachments`
--
ALTER TABLE `attachments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `tickets`
--
ALTER TABLE `tickets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

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

-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 22, 2017 at 02:04 AM
-- Server version: 5.7.14
-- PHP Version: 5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `zsmotor_sitiov2`
--

-- --------------------------------------------------------

--
-- Table structure for table `sitio_administradores`
--

CREATE TABLE `sitio_administradores` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `perfil_id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(80) NOT NULL,
  `email` varchar(200) NOT NULL,
  `clave` varchar(40) NOT NULL,
  `activo` tinyint(1) UNSIGNED DEFAULT '1',
  `eliminado` tinyint(1) UNSIGNED DEFAULT '0',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sitio_administradores`
--

INSERT INTO `sitio_administradores` (`id`, `perfil_id`, `nombre`, `email`, `clave`, `activo`, `eliminado`, `created`, `modified`) VALUES
(1, 1, 'Sistemas Reach Latam', 'sistemas@reach-latam.com', '7a5b995ee411dc6ba1060c8a441d532ee43f9631', 1, 0, '2017-11-12 01:11:18', '2017-11-12 01:11:18');

-- --------------------------------------------------------

--
-- Table structure for table `sitio_banners`
--

CREATE TABLE `sitio_banners` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `administrador_id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(60) NOT NULL,
  `descripcion` varchar(80) DEFAULT NULL,
  `imagen` varchar(100) DEFAULT NULL,
  `imagen_mobile` varchar(100) DEFAULT NULL,
  `programado` tinyint(1) UNSIGNED DEFAULT '0',
  `fecha_inicio` datetime DEFAULT NULL,
  `fecha_termino` datetime DEFAULT NULL,
  `activo` tinyint(1) UNSIGNED DEFAULT '1',
  `eliminado` tinyint(1) UNSIGNED DEFAULT '0',
  `orden` int(10) UNSIGNED DEFAULT '0',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sitio_campo_paginas`
--

CREATE TABLE `sitio_campo_paginas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `pagina_id` bigint(20) UNSIGNED NOT NULL,
  `identificador` varchar(80) NOT NULL,
  `nombre` varchar(80) DEFAULT NULL,
  `valor` varchar(100) NOT NULL,
  `activo` tinyint(1) UNSIGNED DEFAULT '1',
  `eliminado` tinyint(1) UNSIGNED DEFAULT '0',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sitio_cargas`
--

CREATE TABLE `sitio_cargas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `administrador_id` bigint(20) UNSIGNED DEFAULT NULL,
  `identificador` varchar(80) NOT NULL,
  `ejecutando` tinyint(1) UNSIGNED DEFAULT '1',
  `error` tinyint(1) UNSIGNED DEFAULT '0',
  `ultimo_mensaje` text,
  `productos_total` int(10) UNSIGNED DEFAULT '0',
  `productos_nuevos` int(10) UNSIGNED DEFAULT '0',
  `productos_modificados` int(10) UNSIGNED DEFAULT '0',
  `productos_eliminados` int(10) UNSIGNED DEFAULT '0',
  `manual` tinyint(1) UNSIGNED DEFAULT '0',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sitio_categorias`
--

CREATE TABLE `sitio_categorias` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `parent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `nombre` varchar(80) NOT NULL,
  `slug` varchar(80) NOT NULL,
  `slug_full` varchar(80) NOT NULL,
  `producto_count` int(10) UNSIGNED DEFAULT '0',
  `activo` tinyint(1) UNSIGNED DEFAULT '1',
  `eliminado` tinyint(1) UNSIGNED DEFAULT '0',
  `privado` tinyint(1) UNSIGNED DEFAULT '0',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sitio_categorias`
--

INSERT INTO `sitio_categorias` (`id`, `parent_id`, `nombre`, `slug`, `slug_full`, `producto_count`, `activo`, `eliminado`, `privado`, `created`, `modified`) VALUES
(1, 0, 'Llantas', 'llantas', 'llantas', 0, 1, 0, 0, '2017-11-21 00:00:00', '2017-11-21 00:00:00'),
(2, 0, 'Neumáticos', 'neumaticos', 'neumaticos', 0, 1, 0, 0, '2017-11-21 00:00:00', '2017-11-21 00:00:00'),
(3, 0, 'Accesorios', 'accesorios', 'accesorios', 0, 1, 0, 0, '2017-11-21 00:00:00', '2017-11-21 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `sitio_categoria_paginas`
--

CREATE TABLE `sitio_categoria_paginas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(80) NOT NULL,
  `slug` varchar(100) NOT NULL,
  `activo` tinyint(1) UNSIGNED DEFAULT '1',
  `eliminado` tinyint(1) UNSIGNED DEFAULT '0',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sitio_clientes`
--

CREATE TABLE `sitio_clientes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `administrador_id` bigint(20) UNSIGNED DEFAULT NULL,
  `nombre` varchar(80) NOT NULL,
  `imagen` varchar(100) DEFAULT NULL,
  `activo` tinyint(1) UNSIGNED DEFAULT '1',
  `eliminado` tinyint(1) UNSIGNED DEFAULT '0',
  `created` varchar(80) DEFAULT NULL,
  `modified` varchar(80) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sitio_compras`
--

CREATE TABLE `sitio_compras` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `usuario_id` bigint(20) UNSIGNED NOT NULL,
  `estado_compra_id` bigint(20) UNSIGNED NOT NULL,
  `retiro_sucursal` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `direccion_id` bigint(20) UNSIGNED DEFAULT NULL,
  `sucursal_id` bigint(20) UNSIGNED DEFAULT NULL,
  `subtotal` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `valor_despacho` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `despacho_gratis` tinyint(1) UNSIGNED DEFAULT '0',
  `total_descuentos` int(10) UNSIGNED DEFAULT '0',
  `total` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `pagado` tinyint(1) UNSIGNED DEFAULT '0',
  `aceptado` tinyint(1) UNSIGNED DEFAULT '0',
  `reversado` tinyint(1) UNSIGNED DEFAULT '0',
  `tbk_orden_compra` varchar(26) DEFAULT NULL,
  `tbk_tipo_transaccion` varchar(50) DEFAULT NULL,
  `tbk_respuesta` int(2) DEFAULT NULL,
  `tbk_monto` int(10) DEFAULT NULL,
  `tbk_codigo_autorizacion` varchar(6) DEFAULT NULL,
  `tbk_final_numero_tarjeta` int(4) DEFAULT NULL,
  `tbk_fecha_contable` int(4) DEFAULT NULL,
  `tbk_fecha_transaccion` int(4) DEFAULT NULL,
  `tbk_hora_transaccion` int(6) DEFAULT NULL,
  `tbk_id_sesion` varchar(61) DEFAULT NULL,
  `tbk_id_transaccion` int(20) DEFAULT NULL,
  `tbk_tipo_pago` varchar(2) DEFAULT NULL,
  `tbk_numero_cuotas` int(2) DEFAULT NULL,
  `tbk_vci` varchar(3) DEFAULT NULL,
  `tbk_mac` text,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sitio_comunas`
--

CREATE TABLE `sitio_comunas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(80) NOT NULL,
  `region_id` bigint(20) UNSIGNED NOT NULL,
  `activo` tinyint(1) UNSIGNED DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sitio_configuraciones`
--

CREATE TABLE `sitio_configuraciones` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `administrador_id` bigint(20) UNSIGNED NOT NULL,
  `identificador` varchar(60) NOT NULL,
  `valor` text NOT NULL,
  `descripcion` varchar(120) DEFAULT NULL,
  `activo` tinyint(1) UNSIGNED DEFAULT '1',
  `eliminado` tinyint(1) UNSIGNED DEFAULT '0',
  `oculto` tinyint(1) UNSIGNED DEFAULT '0',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sitio_detalle_cargas`
--

CREATE TABLE `sitio_detalle_cargas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `carga_id` bigint(20) UNSIGNED NOT NULL,
  `error` tinyint(1) UNSIGNED DEFAULT '0',
  `mensaje` text NOT NULL,
  `created` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sitio_detalle_compras`
--

CREATE TABLE `sitio_detalle_compras` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `compra_id` bigint(20) UNSIGNED NOT NULL,
  `producto_id` bigint(20) UNSIGNED NOT NULL,
  `cantidad` int(10) UNSIGNED DEFAULT '1',
  `precio_unitario` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `total` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sitio_direcciones`
--

CREATE TABLE `sitio_direcciones` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `usuario_id` bigint(20) UNSIGNED NOT NULL,
  `tipo_direccion_id` bigint(20) UNSIGNED NOT NULL,
  `comuna_id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(80) DEFAULT NULL,
  `calle` varchar(60) NOT NULL,
  `numero` varchar(10) NOT NULL,
  `depto` varchar(20) DEFAULT NULL,
  `codigo_postal` int(7) UNSIGNED NOT NULL,
  `telefono` varchar(60) DEFAULT NULL,
  `observaciones` varchar(200) DEFAULT NULL,
  `activo` tinyint(1) UNSIGNED DEFAULT '1',
  `eliminado` tinyint(1) UNSIGNED DEFAULT '0',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sitio_emails`
--

CREATE TABLE `sitio_emails` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `compra_id` bigint(20) UNSIGNED DEFAULT NULL,
  `asunto` varchar(200) DEFAULT NULL,
  `destinatario_email` text,
  `destinatario_nombre` text,
  `remitente_email` text,
  `remitente_nombre` text,
  `cc` text,
  `bcc` text,
  `procesado` tinyint(1) UNSIGNED DEFAULT '0',
  `enviado` tinyint(1) UNSIGNED DEFAULT '0',
  `reintentos` int(10) UNSIGNED DEFAULT '0',
  `html` text,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sitio_encargado_sucursales`
--

CREATE TABLE `sitio_encargado_sucursales` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sucursal_id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(80) NOT NULL,
  `email` varchar(80) DEFAULT NULL,
  `cargo` varchar(80) DEFAULT NULL,
  `activo` tinyint(1) UNSIGNED DEFAULT '1',
  `eliminado` tinyint(1) UNSIGNED DEFAULT '0',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sitio_estado_compras`
--

CREATE TABLE `sitio_estado_compras` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(60) NOT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sitio_marcas`
--

CREATE TABLE `sitio_marcas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(80) NOT NULL,
  `slug` varchar(120) NOT NULL,
  `producto_count` int(10) UNSIGNED DEFAULT '0',
  `activo` tinyint(1) UNSIGNED DEFAULT '1',
  `eliminado` tinyint(1) UNSIGNED DEFAULT '0',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sitio_marcas`
--

INSERT INTO `sitio_marcas` (`id`, `nombre`, `slug`, `producto_count`, `activo`, `eliminado`, `created`, `modified`) VALUES
(107, 'Safari', 'safari', 0, 1, 0, NULL, NULL),
(108, 'Naonis S.r.l.', 'naonis-s-r-l', 0, 1, 0, NULL, NULL),
(109, 'Sinmarca', 'sinmarca', 0, 1, 0, NULL, NULL),
(110, 'Fangle  Tunning R-1', 'fangle-tunning-r-1', 0, 1, 0, NULL, NULL),
(111, 'Takahara', 'takahara', 0, 1, 0, NULL, NULL),
(112, 'Tactix', 'tactix', 0, 1, 0, NULL, NULL),
(113, 'Hub', 'hub', 0, 1, 0, NULL, NULL),
(114, 'Simota', 'simota', 0, 1, 0, NULL, NULL),
(115, 'Ruian Kangertai', 'ruian-kangertai', 0, 1, 0, NULL, NULL),
(116, 'Auto Gauge', 'auto-gauge', 0, 1, 0, NULL, NULL),
(117, 'Dubai Chile', 'dubai-chile', 0, 1, 0, NULL, NULL),
(118, 'Jinhuiju Car Decoration Compan', 'jinhuiju-car-decoration-compan', 0, 1, 0, NULL, NULL),
(119, 'Import Export Amir Ltda', 'import-export-amir-ltda', 0, 1, 0, NULL, NULL),
(120, 'Zhenjiang Sunworld', 'zhenjiang-sunworld', 0, 1, 0, NULL, NULL),
(121, 'Imagem S.a', 'imagem-s-a', 0, 1, 0, NULL, NULL),
(122, 'Sequoia Pacific', 'sequoia-pacific', 0, 1, 0, NULL, NULL),
(123, 'Zhejiang Yuanzheng', 'zhejiang-yuanzheng', 0, 1, 0, NULL, NULL),
(124, 'Yuan Cheng Auto Accesories', 'yuan-cheng-auto-accesories', 0, 1, 0, NULL, NULL),
(125, 'Ruian Jiabeir', 'ruian-jiabeir', 0, 1, 0, NULL, NULL),
(126, 'Tekmotor', 'tekmotor', 0, 1, 0, NULL, NULL),
(127, 'Ningbo Xinlu Polyurethane', 'ningbo-xinlu-polyurethane', 0, 1, 0, NULL, NULL),
(128, 'Shaft Interprises', 'shaft-interprises', 0, 1, 0, NULL, NULL),
(129, 'Pirelli Neumaticos Chile Ltltd', 'pirelli-neumaticos-chile-ltltd', 0, 1, 0, NULL, NULL),
(130, 'Rottweiler', 'rottweiler', 0, 1, 0, NULL, NULL),
(131, 'Lite-on', 'lite-on', 0, 1, 0, NULL, NULL),
(132, 'Benbawang Automotive Tech', 'benbawang-automotive-tech', 0, 1, 0, NULL, NULL),
(133, 'Bancon', 'bancon', 0, 1, 0, NULL, NULL),
(134, 'Jsl Car', 'jsl-car', 0, 1, 0, NULL, NULL),
(135, 'King Cobra', 'king-cobra', 0, 1, 0, NULL, NULL),
(136, 'Emasa S.a', 'emasa-s-a', 0, 1, 0, NULL, NULL),
(137, 'Yang Huainternacional Tra', 'yang-huainternacional-tra', 0, 1, 0, NULL, NULL),
(138, 'Black&decker', 'black-decker', 0, 1, 0, NULL, NULL),
(139, 'Wanli', 'wanli', 0, 1, 0, NULL, NULL),
(140, 'Desity Traffic', 'desity-traffic', 0, 1, 0, NULL, NULL),
(141, 'Guangzhou Winfor', 'guangzhou-winfor', 0, 1, 0, NULL, NULL),
(142, 'Henan Hualei Auto', 'henan-hualei-auto', 0, 1, 0, NULL, NULL),
(143, 'Tradesman Truck', 'tradesman-truck', 0, 1, 0, NULL, NULL),
(144, 'Foshan Zhihui Metal', 'foshan-zhihui-metal', 0, 1, 0, NULL, NULL),
(145, 'Tower Popular Industrial', 'tower-popular-industrial', 0, 1, 0, NULL, NULL),
(146, 'King Rack Industrial Co', 'king-rack-industrial-co', 0, 1, 0, NULL, NULL),
(147, 'Qee', 'qee', 0, 1, 0, NULL, NULL),
(148, 'Macrotel S.a', 'macrotel-s-a', 0, 1, 0, NULL, NULL),
(149, 'Momo Tires', 'momo-tires', 0, 1, 0, NULL, NULL),
(150, 'Continental', 'continental', 0, 1, 0, NULL, NULL),
(151, 'Rydanz', 'rydanz', 0, 1, 0, NULL, NULL),
(152, 'Neumaticos Sunny', 'neumaticos-sunny', 0, 1, 0, NULL, NULL),
(153, 'Neumaticos Durun', 'neumaticos-durun', 0, 1, 0, NULL, NULL),
(154, 'Bct', 'bct', 0, 1, 0, NULL, NULL),
(155, 'Maxxis', 'maxxis', 0, 1, 0, NULL, NULL),
(156, 'Nexen', 'nexen', 0, 1, 0, NULL, NULL),
(157, 'Hifly', 'hifly', 0, 1, 0, NULL, NULL),
(158, 'Michelin', 'michelin', 0, 1, 0, NULL, NULL),
(159, 'Dunlop', 'dunlop', 0, 1, 0, NULL, NULL),
(160, 'Neumaticos Ling Long', 'neumaticos-ling-long', 0, 1, 0, NULL, NULL),
(161, 'Nitto', 'nitto', 0, 1, 0, NULL, NULL),
(162, 'Ilink', 'ilink', 0, 1, 0, NULL, NULL),
(163, 'Goodride', 'goodride', 0, 1, 0, NULL, NULL),
(164, 'Triangle', 'triangle', 0, 1, 0, NULL, NULL),
(165, 'Runway', 'runway', 0, 1, 0, NULL, NULL),
(166, 'Qingdao Zeal-line', 'qingdao-zeal-line', 0, 1, 0, NULL, NULL),
(167, 'Thule', 'thule', 0, 1, 0, NULL, NULL),
(168, 'Malco Products', 'malco-products', 0, 1, 0, NULL, NULL),
(169, 'Repnac', 'repnac', 0, 1, 0, NULL, NULL),
(170, 'Riveros Saic', 'riveros-saic', 0, 1, 0, NULL, NULL),
(171, 'Bosch', 'bosch', 0, 1, 0, NULL, NULL),
(172, 'Bubba Autoparts', 'bubba-autoparts', 0, 1, 0, NULL, NULL),
(173, 'C Denham', 'c-denham', 0, 1, 0, NULL, NULL),
(174, 'Mann', 'mann', 0, 1, 0, NULL, NULL),
(175, 'Lucas Blandford', 'lucas-blandford', 0, 1, 0, NULL, NULL),
(176, 'Motorcraft', 'motorcraft', 0, 1, 0, NULL, NULL),
(177, 'Neumachile', 'neumachile', 0, 1, 0, NULL, NULL),
(178, 'Dacar Baterias', 'dacar-baterias', 0, 1, 0, NULL, NULL),
(179, 'Kyb', 'kyb', 0, 1, 0, NULL, NULL),
(180, 'Aceites Atm', 'aceites-atm', 0, 1, 0, NULL, NULL),
(181, 'FIRMA  MAIL ', 'firma-mail', 0, 0, 0, NULL, NULL),
(182, 'Mobil', 'mobil', 0, 1, 0, NULL, NULL),
(183, 'Amalie', 'amalie', 0, 1, 0, NULL, NULL),
(184, 'Kumho', 'kumho', 0, 1, 0, NULL, NULL),
(185, 'Haida', 'haida', 0, 1, 0, NULL, NULL),
(186, 'Sumitomo', 'sumitomo', 0, 1, 0, NULL, NULL),
(187, 'Goodyear', 'goodyear', 0, 1, 0, NULL, NULL),
(188, 'Windforce', 'windforce', 0, 1, 0, NULL, NULL),
(189, 'Zeta  Ztr', 'zeta-ztr', 0, 1, 0, NULL, NULL),
(190, 'Westlake', 'westlake', 0, 1, 0, NULL, NULL),
(191, 'Pace', 'pace', 0, 1, 0, NULL, NULL),
(192, 'Yokohama', 'yokohama', 0, 1, 0, NULL, NULL),
(193, 'Sonar', 'sonar', 0, 1, 0, NULL, NULL),
(194, 'Ceat', 'ceat', 0, 1, 0, NULL, NULL),
(195, 'Hankook', 'hankook', 0, 1, 0, NULL, NULL),
(196, 'Doblestar', 'doblestar', 0, 1, 0, NULL, NULL),
(197, 'Zhejaing Baokang Wheel', 'zhejaing-baokang-wheel', 0, 1, 0, NULL, NULL),
(198, 'Neum./llanats Pacifico', 'neum-llanats-pacifico', 0, 1, 0, NULL, NULL),
(199, 'Ningbo Motor  Zumbowh', 'ningbo-motor-zumbowh', 0, 1, 0, NULL, NULL),
(200, 'Kaiping Foreing Commercial', 'kaiping-foreing-commercial', 0, 1, 0, NULL, NULL),
(201, 'American Racing Wheel Pros', 'american-racing-wheel-pros', 0, 1, 0, NULL, NULL),
(202, 'Zhong', 'zhong', 0, 1, 0, NULL, NULL),
(203, 'Zhao Hermano', 'zhao-hermano', 0, 1, 0, NULL, NULL),
(204, 'Js International Trading', 'js-international-trading', 0, 1, 0, NULL, NULL),
(205, 'Zhejiang Putian Integrated Hou', 'zhejiang-putian-integrated-hou', 0, 1, 0, NULL, NULL),
(206, 'Guangzhou Liancheng', 'guangzhou-liancheng', 0, 1, 0, NULL, NULL),
(207, 'Sammoon Lighting', 'sammoon-lighting', 0, 1, 0, NULL, NULL),
(208, 'Winjet', 'winjet', 0, 1, 0, NULL, NULL),
(209, 'Yl Neblinero', 'yl-neblinero', 0, 1, 0, NULL, NULL),
(210, 'Tl Neblinero High Guality', 'tl-neblinero-high-guality', 0, 1, 0, NULL, NULL),
(211, 'Jing Jyun Industry', 'jing-jyun-industry', 0, 1, 0, NULL, NULL),
(212, 'Hella', 'hella', 0, 1, 0, NULL, NULL),
(213, 'Palm Beach Motoring', 'palm-beach-motoring', 0, 1, 0, NULL, NULL),
(214, 'Haining Eurode', 'haining-eurode', 0, 1, 0, NULL, NULL),
(215, 'Salfa', 'salfa', 0, 1, 0, NULL, NULL),
(216, 'Electronica Megatel S.a.', 'electronica-megatel-s-a', 0, 1, 0, NULL, NULL),
(217, 'Der Jaan Industry', 'der-jaan-industry', 0, 1, 0, NULL, NULL),
(218, 'Chemical Guys', 'chemical-guys', 0, 1, 0, NULL, NULL),
(219, 'Brillotek', 'brillotek', 0, 1, 0, NULL, NULL),
(220, 'Lake Country', 'lake-country', 0, 1, 0, NULL, NULL),
(221, 'Smart Inc.', 'smart-inc', 0, 1, 0, NULL, NULL),
(222, 'Multicenter Ltda.', 'multicenter-ltda', 0, 1, 0, NULL, NULL),
(223, 'Multimex S.a.', 'multimex-s-a', 0, 1, 0, NULL, NULL),
(224, 'Cadence', 'cadence', 0, 1, 0, NULL, NULL),
(225, 'Bld Motor Cycle', 'bld-motor-cycle', 0, 1, 0, NULL, NULL),
(226, 'Uni', 'uni', 0, 1, 0, NULL, NULL),
(227, 'Off Road Center', 'off-road-center', 0, 1, 0, NULL, NULL),
(228, 'Buyang Group', 'buyang-group', 0, 1, 0, NULL, NULL),
(229, 'Jiansu Susun  Group', 'jiansu-susun-group', 0, 1, 0, NULL, NULL),
(230, 'Bai Tai Industrial', 'bai-tai-industrial', 0, 1, 0, NULL, NULL),
(231, 'Tiantai Jiaxuan', 'tiantai-jiaxuan', 0, 1, 0, NULL, NULL),
(232, 'Lifeng Auto Acce', 'lifeng-auto-acce', 0, 1, 0, NULL, NULL),
(233, 'Homgs', 'homgs', 0, 1, 0, NULL, NULL),
(234, 'Lanxi Huamao Auto Deco', 'lanxi-huamao-auto-deco', 0, 1, 0, NULL, NULL),
(235, 'Supa', 'supa', 0, 1, 0, NULL, NULL),
(236, 'New World', 'new-world', 0, 1, 0, NULL, NULL),
(237, 'Evotaiwan', 'evotaiwan', 0, 1, 0, NULL, NULL),
(238, 'Hangzou  Easternsources', 'hangzou-easternsources', 0, 1, 0, NULL, NULL),
(239, 'Etna', 'etna', 0, 1, 0, NULL, NULL),
(240, 'Meguiars', 'meguiars', 0, 1, 0, NULL, NULL),
(241, 'Welfull Group', 'welfull-group', 0, 1, 0, NULL, NULL),
(242, 'Bridgestone', 'bridgestone', 0, 1, 0, NULL, NULL),
(243, 'Lih Yann Industrial', 'lih-yann-industrial', 0, 1, 0, NULL, NULL),
(244, 'Gtl Global Tone Limited', 'gtl-global-tone-limited', 0, 1, 0, NULL, NULL),
(245, 'Roadstone', 'roadstone', 0, 1, 0, NULL, NULL),
(246, 'Toyo', 'toyo', 0, 1, 0, NULL, NULL),
(247, 'Yal Neblinero Lynx Eye', 'yal-neblinero-lynx-eye', 0, 1, 0, NULL, NULL),
(248, 'Zs Motor', 'zs-motor', 0, 1, 0, NULL, NULL),
(249, 'Aceite Shell', 'aceite-shell', 0, 1, 0, NULL, NULL),
(250, 'Joyroad', 'joyroad', 0, 1, 0, NULL, NULL),
(251, 'Gap', 'gap', 0, 1, 0, NULL, NULL),
(252, '', '', 0, 1, 0, NULL, NULL),
(253, 'Adriazola rtpos sa            ', 'ADRIAZOLA-RTPOS-SA------------', 0, 1, 0, NULL, NULL),
(254, 'Aliance                       ', 'ALIANCE-----------------------', 0, 1, 0, NULL, NULL),
(255, 'Falken                        ', 'FALKEN------------------------', 0, 1, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sitio_noticias`
--

CREATE TABLE `sitio_noticias` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `administrador_id` bigint(20) UNSIGNED NOT NULL,
  `titulo` varchar(80) NOT NULL,
  `slug` varchar(100) NOT NULL,
  `extracto` varchar(80) DEFAULT NULL,
  `cuerpo` varchar(80) NOT NULL,
  `imagen` varchar(100) DEFAULT NULL,
  `imagen_mobile` varchar(100) DEFAULT NULL,
  `activo` tinyint(1) UNSIGNED DEFAULT '1',
  `eliminado` tinyint(1) UNSIGNED DEFAULT '0',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sitio_paginas`
--

CREATE TABLE `sitio_paginas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `administrador_id` bigint(20) UNSIGNED DEFAULT NULL,
  `categoria_pagina_id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(80) NOT NULL,
  `slug` varchar(100) NOT NULL,
  `activo` tinyint(1) UNSIGNED DEFAULT '1',
  `eliminado` tinyint(1) UNSIGNED DEFAULT '0',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sitio_perfiles`
--

CREATE TABLE `sitio_perfiles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(60) NOT NULL,
  `ilimitado` tinyint(1) UNSIGNED DEFAULT '1',
  `permisos` text,
  `activo` tinyint(1) UNSIGNED DEFAULT '1',
  `eliminado` tinyint(1) UNSIGNED DEFAULT '0',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sitio_perfiles`
--

INSERT INTO `sitio_perfiles` (`id`, `nombre`, `ilimitado`, `permisos`, `activo`, `eliminado`, `created`, `modified`) VALUES
(1, 'Administrador', 1, NULL, 1, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sitio_productos`
--

CREATE TABLE `sitio_productos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_erp` bigint(20) UNSIGNED DEFAULT NULL,
  `sku` varchar(40) NOT NULL,
  `nombre` varchar(200) NOT NULL,
  `slug` varchar(250) NOT NULL,
  `descripcion` text,
  `ficha` text,
  `categoria_id` bigint(20) UNSIGNED NOT NULL,
  `marca_id` bigint(20) UNSIGNED DEFAULT NULL,
  `stock` int(11) NOT NULL DEFAULT '0',
  `stock_fisico` int(11) DEFAULT '0',
  `stock_compra` int(11) DEFAULT '0',
  `precio_publico` int(10) UNSIGNED DEFAULT '0',
  `oferta_publico` tinyint(1) UNSIGNED DEFAULT '0',
  `dcto_publico` float UNSIGNED DEFAULT '0',
  `preciofinal_publico` int(10) UNSIGNED DEFAULT '0',
  `precio_mayorista` int(10) UNSIGNED DEFAULT '0',
  `oferta_mayorista` tinyint(1) UNSIGNED DEFAULT '0',
  `dcto_mayorista` float UNSIGNED DEFAULT '0',
  `preciofinal_mayorista` int(10) UNSIGNED DEFAULT '0',
  `apernaduras` varchar(20) DEFAULT NULL,
  `apernadura1` varchar(80) DEFAULT NULL,
  `apernadura2` varchar(80) DEFAULT NULL,
  `aro` int(11) NOT NULL DEFAULT '0',
  `ancho` int(11) DEFAULT '0',
  `perfil` int(11) DEFAULT '0',
  `fecha_modificacion` date DEFAULT NULL,
  `hora_modificacion` time DEFAULT NULL,
  `stock_b015` int(11) DEFAULT '0',
  `stock_b301` int(11) DEFAULT '0',
  `stock_b401` int(11) DEFAULT '0',
  `stock_b701` int(11) DEFAULT '0',
  `stock_b901` int(11) DEFAULT '0',
  `stock_bclm` int(11) DEFAULT '0',
  `stock_bvtm` int(11) DEFAULT '0',
  `stock_blco` int(11) DEFAULT '0',
  `activo` tinyint(1) UNSIGNED DEFAULT '1',
  `agotado` tinyint(1) UNSIGNED DEFAULT '0',
  `eliminado` tinyint(1) UNSIGNED DEFAULT '0',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sitio_productos`
--

INSERT INTO `sitio_productos` (`id`, `id_erp`, `sku`, `nombre`, `slug`, `descripcion`, `ficha`, `categoria_id`, `marca_id`, `stock`, `stock_fisico`, `stock_compra`, `precio_publico`, `oferta_publico`, `dcto_publico`, `preciofinal_publico`, `precio_mayorista`, `oferta_mayorista`, `dcto_mayorista`, `preciofinal_mayorista`, `apernaduras`, `apernadura1`, `apernadura2`, `aro`, `ancho`, `perfil`, `fecha_modificacion`, `hora_modificacion`, `stock_b015`, `stock_b301`, `stock_b401`, `stock_b701`, `stock_b901`, `stock_bclm`, `stock_bvtm`, `stock_blco`, `activo`, `agotado`, `eliminado`, `created`, `modified`) VALUES
(387, NULL, 'NE70000160001', 'NEUMATICO 700 X 16 HIFLY                          ', 'neumatico-700-x-16-hifly-ne70000160001', 'NEUMATICO 700 X 16 HIFLY                          ', '', 2, 157, 4, 0, 0, 72653, 0, 0, 72653, 72653, 0, 0, 72653, NULL, NULL, NULL, 16, 700, 16, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(388, NULL, 'NE32115150001', 'NEUMATICO MAXXIS 32X11.50 R15 6PR MA-751 MAXXIS   ', 'neumatico-maxxis-32x11-50-r15-6pr-ma-751-maxxis-ne32115150001', 'NEUMATICO MAXXIS 32X11.50 R15 6PR MA-751 MAXXIS   ', '', 2, 155, 1, 0, 0, 85855, 0, 0, 85855, 85855, 0, 0, 85855, NULL, NULL, NULL, 16, 700, 16, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(389, NULL, 'NE31535200005', 'NEUMATICO PIRELLI 315/35ZR20 106Y PZERO (F)       ', 'neumatico-pirelli-315-35zr20-106y-pzero-f-ne31535200005', 'NEUMATICO PIRELLI 315/35ZR20 106Y PZERO (F)       ', '', 2, 129, 12, 0, 0, 458900, 0, 0, 458900, 458900, 0, 20, 367120, NULL, NULL, NULL, 20, 315, 35, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(390, NULL, 'NE31535200004', 'NEUMATICO MOMO 315/35ZR20 110Y XL M-30 TOPRUN W-S ', 'neumatico-momo-315-35zr20-110y-xl-m-30-toprun-w-s-ne31535200004', 'NEUMATICO MOMO 315/35ZR20 110Y XL M-30 TOPRUN W-S ', '', 2, 149, 24, 0, 0, 239900, 0, 0, 239900, 226492, 0, 30, 158544, NULL, NULL, NULL, 20, 315, 35, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(391, NULL, 'NE31535200001', 'NEUMATICO PIRELLI 315/35 ZR20 110Y XL PZERO RFT   ', 'neumatico-pirelli-315-35-zr20-110y-xl-pzero-rft-ne31535200001', 'NEUMATICO PIRELLI 315/35 ZR20 110Y XL PZERO RFT   ', '', 2, 129, 9, 0, 0, 619900, 0, 0, 619900, 619900, 0, 20, 495919, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(392, NULL, 'NE31105150010', 'NEUMATICO 31X10.50R15 AUTOGUARD JB42 109Q 6PR     ', 'neumatico-31x10-50r15-autoguard-jb42-109q-6pr-ne31105150010', 'NEUMATICO 31X10.50R15 AUTOGUARD JB42 109Q 6PR     ', '', 2, 154, 64, 0, 0, 79800, 1, 30, 55860, 67830, 1, 30, 47481, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(393, NULL, 'NE31105150009', 'NEUMATICO PIRELLI 31X10.50R15 109S SCORP. ATR WL  ', 'neumatico-pirelli-31x10-50r15-109s-scorp-atr-wl-ne31105150009', 'NEUMATICO PIRELLI 31X10.50R15 109S SCORP. ATR WL  ', '', 2, 129, 8, 0, 0, 130900, 0, 0, 130900, 130900, 0, 5, 124355, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(394, NULL, 'NE31105150008', 'NEUMATICO DUNLOP 31X10.5R15 AT3                   ', 'neumatico-dunlop-31x10-5r15-at3-ne31105150008', 'NEUMATICO DUNLOP 31X10.5R15 AT3                   ', '', 2, 159, 2, 0, 0, 67385, 0, 0, 67385, 67385, 0, 0, 67385, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(395, NULL, 'NE31105150007', 'NEUMATICO DUNLOP 31X10.50 MT1                     ', 'neumatico-dunlop-31x10-50-mt1-ne31105150007', 'NEUMATICO DUNLOP 31X10.50 MT1                     ', '', 2, 159, 1, 0, 0, 103604, 0, 0, 103604, 103604, 0, 0, 103604, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(396, NULL, 'NE31105150006', 'NEUMATICO MICHELIN 31X10.50 LTX                   ', 'neumatico-michelin-31x10-50-ltx-ne31105150006', 'NEUMATICO MICHELIN 31X10.50 LTX                   ', '', 2, 158, 1, 0, 0, 106166, 0, 0, 106166, 106166, 0, 0, 106166, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(397, NULL, 'NE31105150004', 'NEUMATICO SUNNY 31X10.5R15 SN288                  ', 'neumatico-sunny-31x10-5r15-sn288-ne31105150004', 'NEUMATICO SUNNY 31X10.5R15 SN288                  ', '', 2, 152, 1, 0, 0, 52592, 0, 0, 52592, 52592, 0, 0, 52592, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(398, NULL, 'NE31105150003', 'NEUMATICO WANLI 31X10.50 S2080                    ', 'neumatico-wanli-31x10-50-s2080-ne31105150003', 'NEUMATICO WANLI 31X10.50 S2080                    ', '', 2, 139, 1, 0, 0, 52400, 0, 0, 52400, 52400, 0, 0, 52400, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(399, NULL, 'NE31105150002', 'NEUMATICO SUNNY 31X10.50R15LT SN288C 6 109 S      ', 'neumatico-sunny-31x10-50r15lt-sn288c-6-109-s-ne31105150002', 'NEUMATICO SUNNY 31X10.50R15LT SN288C 6 109 S      ', '', 2, 152, 7, 0, 0, 59555, 0, 0, 59555, 59555, 0, 0, 59555, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(400, NULL, 'NE31105150001', 'NEUMATICO PIRELLI 31X10.50R15 109Q SCORP. MUD WL  ', 'neumatico-pirelli-31x10-50r15-109q-scorp-mud-wl-ne31105150001', 'NEUMATICO PIRELLI 31X10.50R15 109Q SCORP. MUD WL  ', '', 2, 129, 12, 0, 0, 138900, 0, 0, 138900, 138900, 0, 5, 131956, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(401, NULL, 'NE31101500001', 'NEUMATICO RYDANZ LT31X10.5R15 6PR 109Q R09        ', 'neumatico-rydanz-lt31x10-5r15-6pr-109q-r09-ne31101500001', 'NEUMATICO RYDANZ LT31X10.5R15 6PR 109Q R09        ', '', 2, 151, 53, 0, 0, 100490, 0, 0, 100490, 89405, 0, 30, 62583, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(402, NULL, 'NE30950150001', 'NEUMATICO PIRELLI 30X9.50R15LT 104Q SCORP. MUD    ', 'neumatico-pirelli-30x9-50r15lt-104q-scorp-mud-ne30950150001', 'NEUMATICO PIRELLI 30X9.50R15LT 104Q SCORP. MUD    ', '', 2, 129, 1, 0, 0, 113900, 0, 0, 113900, 113900, 0, 5, 108204, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(403, NULL, 'NE30540220001', 'NEUMATICO NITTO 305/40R22 144H NT-420S 31.6       ', 'neumatico-nitto-305-40r22-144h-nt-420s-31-6-ne30540220001', 'NEUMATICO NITTO 305/40R22 144H NT-420S 31.6       ', '', 2, 161, 2, 0, 0, 97420, 0, 0, 97420, 97419, 0, 0, 97419, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(404, NULL, 'NE30530200003', 'NEUMATICO PIRELLI 305/30ZR20 103Y XL PZERO (N0)   ', 'neumatico-pirelli-305-30zr20-103y-xl-pzero-n0-ne30530200003', 'NEUMATICO PIRELLI 305/30ZR20 103Y XL PZERO (N0)   ', '', 2, 129, 15, 0, 0, 519900, 0, 0, 519900, 519900, 0, 20, 415920, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(405, NULL, 'NE30530200002', 'NEUMATICO PIRELLI 305/30ZR20 103Y XL PZERO (L)    ', 'neumatico-pirelli-305-30zr20-103y-xl-pzero-l-ne30530200002', 'NEUMATICO PIRELLI 305/30ZR20 103Y XL PZERO (L)    ', '', 2, 129, 2, 0, 0, 519900, 0, 0, 519900, 519900, 0, 20, 415920, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(406, NULL, 'NE30530200001', 'NEUMATICO PIRELLI 305/30ZR20 103Y XL PZERO (N1)   ', 'neumatico-pirelli-305-30zr20-103y-xl-pzero-n1-ne30530200001', 'NEUMATICO PIRELLI 305/30ZR20 103Y XL PZERO (N1)   ', '', 2, 129, 18, 0, 0, 399900, 0, 0, 399900, 399900, 0, 20, 319920, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(407, NULL, 'NE30530190001', 'NEUMATICO PIRELLI 305/30ZR19 102Y XL PZERO (N2)   ', 'neumatico-pirelli-305-30zr19-102y-xl-pzero-n2-ne30530190001', 'NEUMATICO PIRELLI 305/30ZR19 102Y XL PZERO (N2)   ', '', 2, 129, 18, 0, 0, 329900, 0, 0, 329900, 329900, 0, 5, 313406, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(408, NULL, 'NE30091500001', 'NEUMATICO RYDANZ 30X9.5R15 104Q R09               ', 'neumatico-rydanz-30x9-5r15-104q-r09-ne30091500001', 'NEUMATICO RYDANZ 30X9.5R15 104Q R09               ', '', 2, 151, 8, 0, 0, 90900, 0, 0, 90900, 88298, 0, 30, 61809, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(409, NULL, 'NE29550150001', 'NEUMATICO DUNLOP 295/50R15 A15 SPORT GT           ', 'neumatico-dunlop-295-50r15-a15-sport-gt-ne29550150001', 'NEUMATICO DUNLOP 295/50R15 A15 SPORT GT           ', '', 2, 159, 1, 0, 0, 88031, 0, 0, 88031, 88031, 0, 0, 88031, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(410, NULL, 'NE29540200001', 'NEUMATICO PIRELLI 295/40ZR20 110Y PZERO ROSSO (AO)', 'neumatico-pirelli-295-40zr20-110y-pzero-rosso-ao-ne29540200001', 'NEUMATICO PIRELLI 295/40ZR20 110Y PZERO ROSSO (AO)', '', 2, 129, 4, 0, 0, 423900, 0, 0, 423900, 423899, 0, 20, 339119, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(411, NULL, 'NE29535210005', 'NEUMATICO PIRELLI 295 35/ZR21 107Y PZERO (MO)     ', 'neumatico-pirelli-295-35-zr21-107y-pzero-mo-ne29535210005', 'NEUMATICO PIRELLI 295 35/ZR21 107Y PZERO (MO)     ', '', 2, 129, 4, 0, 0, 369900, 0, 0, 369900, 369900, 0, 20, 295920, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(412, NULL, 'NE29535210001', 'NEUMATICO PIRELLI 295/35R21 107Y XL PZERO (N1) GB ', 'neumatico-pirelli-295-35r21-107y-xl-pzero-n1-gb-ne29535210001', 'NEUMATICO PIRELLI 295/35R21 107Y XL PZERO (N1) GB ', '', 2, 129, 9, 0, 0, 369900, 0, 0, 369900, 369900, 0, 10, 332910, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(413, NULL, 'NE29535200004', 'NEUMATICO PIRELLI 295/35ZR20 105Y XL PZERO (N1)   ', 'neumatico-pirelli-295-35zr20-105y-xl-pzero-n1-ne29535200004', 'NEUMATICO PIRELLI 295/35ZR20 105Y XL PZERO (N1)   ', '', 2, 129, 17, 0, 0, 359900, 0, 0, 359900, 359900, 0, 10, 323910, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(414, NULL, 'NE29535200002', 'NEUMATICO PIRELLI 295/35ZR20 105Y XL PZERO (N0)   ', 'neumatico-pirelli-295-35zr20-105y-xl-pzero-n0-ne29535200002', 'NEUMATICO PIRELLI 295/35ZR20 105Y XL PZERO (N0)   ', '', 2, 129, 1, 0, 0, 384900, 0, 0, 384900, 384900, 0, 5, 365655, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(415, NULL, 'NE29530200004', 'NEUMATICO PIRELLI 295/30ZR20 101Y XL PZERO (AMS)  ', 'neumatico-pirelli-295-30zr20-101y-xl-pzero-ams-ne29530200004', 'NEUMATICO PIRELLI 295/30ZR20 101Y XL PZERO (AMS)  ', '', 2, 129, 11, 0, 0, 429900, 0, 0, 429900, 429901, 0, 15, 365416, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(416, NULL, 'NE29530200003', 'NEUMATICO PIRELLI 295/30ZR20 101Y PZERO           ', 'neumatico-pirelli-295-30zr20-101y-pzero-ne29530200003', 'NEUMATICO PIRELLI 295/30ZR20 101Y PZERO           ', '', 2, 129, 7, 0, 0, 569745, 0, 0, 569745, 410937, 0, 5, 390390, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(417, NULL, 'NE29530200002', 'NEUMATICO PIRELLI 295/30ZR20 101Y XL PZERO (N0)   ', 'neumatico-pirelli-295-30zr20-101y-xl-pzero-n0-ne29530200002', 'NEUMATICO PIRELLI 295/30ZR20 101Y XL PZERO (N0)   ', '', 2, 129, 10, 0, 0, 344900, 0, 0, 344900, 344900, 0, 5, 327655, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(418, NULL, 'NE29530190001', 'NEUMATICO PIRELLI 295/30ZR19 100Y PZERO (N2)      ', 'neumatico-pirelli-295-30zr19-100y-pzero-n2-ne29530190001', 'NEUMATICO PIRELLI 295/30ZR19 100Y PZERO (N2)      ', '', 2, 129, 9, 0, 0, 290900, 0, 0, 290900, 290900, 0, 3, 282173, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(419, NULL, 'NE29530180001', 'NEUMATICO PIRELLI 295/30ZR18 PZERO ROSSO (N4)     ', 'neumatico-pirelli-295-30zr18-pzero-rosso-n4-ne29530180001', 'NEUMATICO PIRELLI 295/30ZR18 PZERO ROSSO (N4)     ', '', 2, 129, 4, 0, 0, 226900, 0, 0, 226900, 226900, 0, 0, 226900, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(420, NULL, 'NE28575160003', 'NEUMATICO RYDANZ LT285/75R16 10PR 126/123R R09    ', 'neumatico-rydanz-lt285-75r16-10pr-126-123r-r09-ne28575160003', 'NEUMATICO RYDANZ LT285/75R16 10PR 126/123R R09    ', '', 2, 151, 22, 0, 0, 128900, 0, 0, 128900, 134028, 0, 30, 93820, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(421, NULL, 'NE28570170004', 'NEUMATICO RYDANZ LT285/70R17 10PR 121/118S R09    ', 'neumatico-rydanz-lt285-70r17-10pr-121-118s-r09-ne28570170004', 'NEUMATICO RYDANZ LT285/70R17 10PR 121/118S R09    ', '', 2, 151, 19, 0, 0, 135490, 0, 0, 135490, 121475, 0, 30, 85033, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(422, NULL, 'NE28570170001', 'NEUMATICO PIRELLI 28570R17 116Q SCORP. MTR        ', 'neumatico-pirelli-28570r17-116q-scorp-mtr-ne28570170001', 'NEUMATICO PIRELLI 28570R17 116Q SCORP. MTR        ', '', 2, 129, 8, 0, 0, 189900, 0, 0, 189900, 189900, 0, 20, 151920, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(423, NULL, 'NE28555180001', 'NEUMATICO PIRELLI 285/55R18 113V SCORP. ZERO      ', 'neumatico-pirelli-285-55r18-113v-scorp-zero-ne28555180001', 'NEUMATICO PIRELLI 285/55R18 113V SCORP. ZERO      ', '', 2, 129, 10, 0, 0, 229900, 0, 0, 229900, 229900, 0, 10, 206910, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(424, NULL, 'NE28545200001', 'NEUMATICO PIRELLI 285/4520 112Y SCORP. VERDE (AO) ', 'neumatico-pirelli-285-4520-112y-scorp-verde-ao-ne28545200001', 'NEUMATICO PIRELLI 285/4520 112Y SCORP. VERDE (AO) ', '', 2, 129, 1, 0, 0, 389900, 0, 0, 389900, 389900, 0, 20, 311920, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(425, NULL, 'NE28540220001', 'NEUMATICO PIRELLI 285/40ZR22 110Y XL PZERO (B)    ', 'neumatico-pirelli-285-40zr22-110y-xl-pzero-b-ne28540220001', 'NEUMATICO PIRELLI 285/40ZR22 110Y XL PZERO (B)    ', '', 2, 129, 8, 0, 0, 752900, 0, 0, 752900, 752900, 0, 20, 602320, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(426, NULL, 'NE28540190002', 'NEU CONTINENTAL 285/40ZR19 (103Y) FR CSC 3 N0     ', 'neu-continental-285-40zr19-103y-fr-csc-3-n0-ne28540190002', 'NEU CONTINENTAL 285/40ZR19 (103Y) FR CSC 3 N0     ', '', 2, 150, 10, 0, 0, 375155, 0, 0, 375155, 375155, 1, 30, 262608, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(427, NULL, 'NE28540190001', 'NEUMATICO PIRELLI 285/40ZR19 103Y PZERO (N1)      ', 'neumatico-pirelli-285-40zr19-103y-pzero-n1-ne28540190001', 'NEUMATICO PIRELLI 285/40ZR19 103Y PZERO (N1)      ', '', 2, 129, 9, 0, 0, 299900, 0, 0, 299900, 299900, 0, 20, 239921, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(428, NULL, 'NE28535200002', 'NEUMATICO PIRELLI 285/35ZR20 100Y PZERO (MGT)     ', 'neumatico-pirelli-285-35zr20-100y-pzero-mgt-ne28535200002', 'NEUMATICO PIRELLI 285/35ZR20 100Y PZERO (MGT)     ', '', 2, 129, 10, 0, 0, 399900, 0, 0, 399900, 399900, 0, 20, 319920, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(429, NULL, 'NE28535200001', 'NEUMATICO PIRELLI 285/35ZR20 100Y PZERO           ', 'neumatico-pirelli-285-35zr20-100y-pzero-ne28535200001', 'NEUMATICO PIRELLI 285/35ZR20 100Y PZERO           ', '', 2, 129, 7, 0, 0, 399900, 0, 0, 399900, 399900, 0, 20, 319920, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(430, NULL, 'NE28535190005', 'NEUMATICO PIRELLI 285/35ZR19 99Y ROSSO (F)        ', 'neumatico-pirelli-285-35zr19-99y-rosso-f-ne28535190005', 'NEUMATICO PIRELLI 285/35ZR19 99Y ROSSO (F)        ', '', 2, 129, 4, 0, 0, 349900, 0, 0, 349900, 349900, 0, 10, 314911, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(431, NULL, 'NE28535190002', 'NEUMATICO PIRELLI 285/35ZR19 99Y PZERO CORSA RIGHT', 'neumatico-pirelli-285-35zr19-99y-pzero-corsa-right-ne28535190002', 'NEUMATICO PIRELLI 285/35ZR19 99Y PZERO CORSA RIGHT', '', 2, 129, 1, 0, 0, 216900, 0, 0, 216900, 216900, 0, 0, 216900, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(432, NULL, 'NE28535180001', 'NEUMATICO PIRELLI 285/35R18 97Y PZERO (MO)        ', 'neumatico-pirelli-285-35r18-97y-pzero-mo-ne28535180001', 'NEUMATICO PIRELLI 285/35R18 97Y PZERO (MO)        ', '', 2, 129, 6, 0, 0, 299900, 0, 0, 299900, 299900, 0, 20, 239921, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(433, NULL, 'NE28530210001', 'NEUMATICO PIRELLI 285/30ZR21100Y PZERO (RO1)(NCS) ', 'neumatico-pirelli-285-30zr21100y-pzero-ro1-ncs-ne28530210001', 'NEUMATICO PIRELLI 285/30ZR21100Y PZERO (RO1)(NCS) ', '', 2, 129, 11, 0, 0, 499900, 0, 0, 499900, 499900, 0, 20, 399920, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(434, NULL, 'NE28530200001', 'NEUMATICO PIRELLI 285/30ZR20 99Y PZERO DE         ', 'neumatico-pirelli-285-30zr20-99y-pzero-de-ne28530200001', 'NEUMATICO PIRELLI 285/30ZR20 99Y PZERO DE         ', '', 2, 129, 6, 0, 0, 498900, 0, 0, 498900, 498900, 0, 20, 399120, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(435, NULL, 'NE28530190002', 'NEUMATICO PIRELLI 285/30ZR19 98Y XL PZERO (MO)    ', 'neumatico-pirelli-285-30zr19-98y-xl-pzero-mo-ne28530190002', 'NEUMATICO PIRELLI 285/30ZR19 98Y XL PZERO (MO)    ', '', 2, 129, 24, 0, 0, 379900, 0, 0, 379900, 379900, 0, 20, 303920, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(436, NULL, 'NE28530190001', 'NEUMATICO PIRELLI 285/30R19 98Y PZERO (MO)        ', 'neumatico-pirelli-285-30r19-98y-pzero-mo-ne28530190001', 'NEUMATICO PIRELLI 285/30R19 98Y PZERO (MO)        ', '', 2, 129, 9, 0, 0, 379900, 0, 0, 379900, 379900, 0, 20, 303920, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(437, NULL, 'NE28530180002', 'NEUMATICO PIRELLI 285/30ZR18 PZERO ROSSO (N4)     ', 'neumatico-pirelli-285-30zr18-pzero-rosso-n4-ne28530180002', 'NEUMATICO PIRELLI 285/30ZR18 PZERO ROSSO (N4)     ', '', 2, 129, 8, 0, 0, 379900, 0, 0, 379900, 379900, 0, 20, 303920, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(438, NULL, 'NE27565180001', 'NEUMATICO PIRELLI 275/65R18 116H SCORP. ATR WL    ', 'neumatico-pirelli-275-65r18-116h-scorp-atr-wl-ne27565180001', 'NEUMATICO PIRELLI 275/65R18 116H SCORP. ATR WL    ', '', 2, 129, 3, 0, 0, 209900, 0, 0, 209900, 209901, 0, 15, 178416, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(439, NULL, 'NE27565170001', 'NEUMATICO RYDANZ 275/65R17 115H R09               ', 'neumatico-rydanz-275-65r17-115h-r09-ne27565170001', 'NEUMATICO RYDANZ 275/65R17 115H R09               ', '', 2, 151, 20, 0, 0, 102900, 0, 0, 102900, 106029, 0, 30, 74220, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(440, NULL, 'NE27560200003', 'NEUMATICO RYDANZ 275/60R20 115H R09               ', 'neumatico-rydanz-275-60r20-115h-r09-ne27560200003', 'NEUMATICO RYDANZ 275/60R20 115H R09               ', '', 2, 151, 8, 0, 0, 129900, 0, 0, 129900, 135285, 0, 30, 94700, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(441, NULL, 'NE27555200002', 'NEUMATICO PIRELLI 275/55R20 111H SCORP. STR       ', 'neumatico-pirelli-275-55r20-111h-scorp-str-ne27555200002', 'NEUMATICO PIRELLI 275/55R20 111H SCORP. STR       ', '', 2, 129, 6, 0, 0, 204900, 0, 0, 204900, 204900, 0, 10, 184411, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(442, NULL, 'NE27555200001', 'NEUMATICO PIRELLI 275/55R20 111S SCORP. ATR WL    ', 'neumatico-pirelli-275-55r20-111s-scorp-atr-wl-ne27555200001', 'NEUMATICO PIRELLI 275/55R20 111S SCORP. ATR WL    ', '', 2, 129, 2, 0, 0, 203900, 0, 0, 203900, 203901, 0, 0, 203901, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(443, NULL, 'NE27555190001', 'NEUMATICO PIRELLI 275/55R19 111V SCORP. ZERO (MO) ', 'neumatico-pirelli-275-55r19-111v-scorp-zero-mo-ne27555190001', 'NEUMATICO PIRELLI 275/55R19 111V SCORP. ZERO (MO) ', '', 2, 129, 10, 0, 0, 239900, 0, 0, 239900, 239900, 0, 20, 191921, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(444, NULL, 'NE27550200001', 'NEUMATICO PIRELLI 275/50R20 109H SCORP. VERDE (MO)', 'neumatico-pirelli-275-50r20-109h-scorp-verde-mo-ne27550200001', 'NEUMATICO PIRELLI 275/50R20 109H SCORP. VERDE (MO)', '', 2, 129, 1, 0, 0, 154900, 0, 0, 154900, 154900, 0, 0, 154900, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(445, NULL, 'NE27545210001', 'NEUMATICO PIRELLI 275/45R21 110VSCORP. VEAS (LR)  ', 'neumatico-pirelli-275-45r21-110vscorp-veas-lr-ne27545210001', 'NEUMATICO PIRELLI 275/45R21 110VSCORP. VEAS (LR)  ', '', 2, 129, 35, 0, 0, 399900, 0, 0, 399900, 399900, 0, 20, 319920, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(446, NULL, 'NE27545200004', 'NEUMATICO PIRELLI 275/45R20 110H SCORP. ZERO (AO) ', 'neumatico-pirelli-275-45r20-110h-scorp-zero-ao-ne27545200004', 'NEUMATICO PIRELLI 275/45R20 110H SCORP. ZERO (AO) ', '', 2, 129, 22, 0, 0, 299900, 0, 0, 299900, 299900, 0, 20, 239921, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(447, NULL, 'NE27545200003', 'NEUMATICO PIRELLI 275/45R20 110V SCORP. VEAS (N0) ', 'neumatico-pirelli-275-45r20-110v-scorp-veas-n0-ne27545200003', 'NEUMATICO PIRELLI 275/45R20 110V SCORP. VEAS (N0) ', '', 2, 129, 6, 0, 0, 294900, 0, 0, 294900, 294900, 0, 20, 235920, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(448, NULL, 'NE27545200002', 'NEUMATICO PIRELLI 275/45ZR20 110Y PZERO ROSSO (AO)', 'neumatico-pirelli-275-45zr20-110y-pzero-rosso-ao-ne27545200002', 'NEUMATICO PIRELLI 275/45ZR20 110Y PZERO ROSSO (AO)', '', 2, 129, 17, 0, 0, 347900, 0, 0, 347900, 347900, 0, 15, 295715, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(449, NULL, 'NE27545190004', 'NEUMATICO PIRELLI 275/45ZR19 108Y XL PZERO (B)    ', 'neumatico-pirelli-275-45zr19-108y-xl-pzero-b-ne27545190004', 'NEUMATICO PIRELLI 275/45ZR19 108Y XL PZERO (B)    ', '', 2, 129, 6, 0, 0, 379900, 0, 0, 379900, 379900, 0, 10, 341911, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(450, NULL, 'NE27545180003', 'NEU CONTINENTAL 275/45ZR18 (103Y) FR SC5 N0       ', 'neu-continental-275-45zr18-103y-fr-sc5-n0-ne27545180003', 'NEU CONTINENTAL 275/45ZR18 (103Y) FR SC5 N0       ', '', 2, 150, 2, 0, 0, 324805, 0, 0, 324805, 324805, 1, 30, 227364, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(451, NULL, 'NE27545180002', 'NEUMATICO PIRELLI 275/45ZR18 103Y PZERO (N0)      ', 'neumatico-pirelli-275-45zr18-103y-pzero-n0-ne27545180002', 'NEUMATICO PIRELLI 275/45ZR18 103Y PZERO (N0)      ', '', 2, 129, 9, 0, 0, 299900, 0, 0, 299900, 299900, 0, 10, 269910, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(452, NULL, 'NE27540220002', 'NEUMATICO PIRELLI 275/40R22 108Y PZERO (LR)(NCS)  ', 'neumatico-pirelli-275-40r22-108y-pzero-lr-ncs-ne27540220002', 'NEUMATICO PIRELLI 275/40R22 108Y PZERO (LR)(NCS)  ', '', 2, 129, 8, 0, 0, 488900, 0, 0, 488900, 488900, 0, 20, 391120, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(453, NULL, 'NE27540210001', 'NEUMATICO PIRELLI 275/40R21 107Y XL SC. VERDE NCS ', 'neumatico-pirelli-275-40r21-107y-xl-sc-verde-ncs-ne27540210001', 'NEUMATICO PIRELLI 275/40R21 107Y XL SC. VERDE NCS ', '', 2, 129, 1, 0, 0, 429900, 0, 0, 429900, 429901, 0, 20, 343921, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(454, NULL, 'NE27540200007', 'NEUMATICO PIRELLI 275/40ZR20 106Y PZERO ROSSO (N1)', 'neumatico-pirelli-275-40zr20-106y-pzero-rosso-n1-ne27540200007', 'NEUMATICO PIRELLI 275/40ZR20 106Y PZERO ROSSO (N1)', '', 2, 129, 8, 0, 0, 349900, 0, 0, 349900, 349900, 0, 20, 279920, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(455, NULL, 'NE27540200006', 'NEUMATICO MOMO 275/40ZR20 106Y XL M-30 TOPRUN W-S ', 'neumatico-momo-275-40zr20-106y-xl-m-30-toprun-w-s-ne27540200006', 'NEUMATICO MOMO 275/40ZR20 106Y XL M-30 TOPRUN W-S ', '', 2, 149, 50, 0, 0, 209000, 0, 0, 209000, 178438, 0, 30, 124907, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(456, NULL, 'NE27540200005', 'NEUMATICO MOMO 275/40ZR20 106Y XL M-9 ALUSION W-S ', 'neumatico-momo-275-40zr20-106y-xl-m-9-alusion-w-s-ne27540200005', 'NEUMATICO MOMO 275/40ZR20 106Y XL M-9 ALUSION W-S ', '', 2, 149, 19, 0, 0, 209000, 0, 0, 209000, 168164, 0, 30, 117715, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(457, NULL, 'NE27540200003', 'NEUMATICO MOMO 275/40ZR20 106Y XL M-30 TOPRUN RFT ', 'neumatico-momo-275-40zr20-106y-xl-m-30-toprun-rft-ne27540200003', 'NEUMATICO MOMO 275/40ZR20 106Y XL M-30 TOPRUN RFT ', '', 2, 149, 10, 0, 0, 329900, 0, 0, 329900, 285481, 0, 30, 199837, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(458, NULL, 'NE27540200002', 'NEUMATICO PIRELLI 275/40ZR20 106Y SCORP. ZERO     ', 'neumatico-pirelli-275-40zr20-106y-scorp-zero-ne27540200002', 'NEUMATICO PIRELLI 275/40ZR20 106Y SCORP. ZERO     ', '', 2, 129, 2, 0, 0, 190025, 0, 0, 190025, 190025, 0, 0, 190025, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(459, NULL, 'NE27540200001', 'NEUMATICO PIRELLI 275/40ZR20 106Y XL PZERO        ', 'neumatico-pirelli-275-40zr20-106y-xl-pzero-ne27540200001', 'NEUMATICO PIRELLI 275/40ZR20 106Y XL PZERO        ', '', 2, 129, 9, 0, 0, 273900, 0, 0, 273900, 273900, 0, 10, 246510, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(460, NULL, 'NE27540190006', 'NEU CONTINENTAL  275/40R19 101W CSC 3 SSR * FR    ', 'neu-continental-275-40r19-101w-csc-3-ssr-fr-ne27540190006', 'NEU CONTINENTAL  275/40R19 101W CSC 3 SSR * FR    ', '', 2, 150, 4, 0, 0, 367555, 0, 0, 367555, 367555, 1, 30, 257289, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(461, NULL, 'NE27540190005', 'NEUMATICO PIRELLI 275/40R19 101Y PZERO RFT (*)    ', 'neumatico-pirelli-275-40r19-101y-pzero-rft-ne27540190005', 'NEUMATICO PIRELLI 275/40R19 101Y PZERO RFT (*)    ', '', 2, 129, 3, 0, 0, 360900, 0, 0, 360900, 360900, 0, 3, 350073, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(462, NULL, 'NE27540180001', 'NEUMATICO PIRELLI 275/40R18 99Y P7 CINT. RFT      ', 'neumatico-pirelli-275-40r18-99y-p7-cint-rft-ne27540180001', 'NEUMATICO PIRELLI 275/40R18 99Y P7 CINT. RFT      ', '', 2, 129, 10, 0, 0, 375900, 0, 0, 375900, 375900, 0, 20, 300720, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(463, NULL, 'NE27535210001', 'NEUMATICO PIRELLI 275/35ZR21 103Y PZERO (B)       ', 'neumatico-pirelli-275-35zr21-103y-pzero-b-ne27535210001', 'NEUMATICO PIRELLI 275/35ZR21 103Y PZERO (B)       ', '', 2, 129, 3, 0, 0, 152125, 0, 0, 152125, 152125, 0, 0, 152125, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(464, NULL, 'NE27535200005', 'NEUMATICO PIRELLI 275/35ZR20 102Y PZERO (RO1)(NCS)', 'neumatico-pirelli-275-35zr20-102y-pzero-ro1-ncs-ne27535200005', 'NEUMATICO PIRELLI 275/35ZR20 102Y PZERO (RO1)(NCS)', '', 2, 129, 6, 0, 0, 379900, 0, 0, 379900, 379900, 0, 20, 303920, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(465, NULL, 'NE27535200004', 'NEUMATICO PIRELLI 275/35ZR20 102Y PZERO ROSSO (B) ', 'neumatico-pirelli-275-35zr20-102y-pzero-rosso-b-ne27535200004', 'NEUMATICO PIRELLI 275/35ZR20 102Y PZERO ROSSO (B) ', '', 2, 129, 1, 0, 0, 371900, 0, 0, 371900, 371900, 0, 10, 334710, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(466, NULL, 'NE27535200001', 'NEUMATICO PIRELLI 275/35R20 102Y XL PZERO RFT     ', 'neumatico-pirelli-275-35r20-102y-xl-pzero-rft-ne27535200001', 'NEUMATICO PIRELLI 275/35R20 102Y XL PZERO RFT     ', '', 2, 129, 3, 0, 0, 389900, 0, 0, 389900, 389900, 0, 20, 311920, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(467, NULL, 'NE27535190002', 'NEUMATICO MOMO 275/35R19 100Y XL M-30 TOPRUN RFT  ', 'neumatico-momo-275-35r19-100y-xl-m-30-toprun-rft-ne27535190002', 'NEUMATICO MOMO 275/35R19 100Y XL M-30 TOPRUN RFT  ', '', 2, 149, 18, 0, 0, 249900, 0, 0, 249900, 277312, 0, 30, 194119, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(468, NULL, 'NE27535180003', 'NEUMATICO PIRELLI 275/35R18 95Y PZERO RFT RO      ', 'neumatico-pirelli-275-35r18-95y-pzero-rft-ro-ne27535180003', 'NEUMATICO PIRELLI 275/35R18 95Y PZERO RFT RO      ', '', 2, 129, 4, 0, 0, 375900, 0, 0, 375900, 375900, 0, 10, 338310, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(469, NULL, 'NE27535180002', 'NEUMATICO PIRELLI 275/35R18 95Y PZERO ROSSO (MO)  ', 'neumatico-pirelli-275-35r18-95y-pzero-rosso-mo-ne27535180002', 'NEUMATICO PIRELLI 275/35R18 95Y PZERO ROSSO (MO)  ', '', 2, 129, 10, 0, 0, 299900, 0, 0, 299900, 299900, 0, 10, 269910, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(470, NULL, 'NE27530210001', 'NEUMATICO PIRELLI 275/30R21 98Y XL PZERO RFT      ', 'neumatico-pirelli-275-30r21-98y-xl-pzero-rft-ne27530210001', 'NEUMATICO PIRELLI 275/30R21 98Y XL PZERO RFT      ', '', 2, 129, 4, 0, 0, 401550, 0, 0, 401550, 401550, 0, 0, 401550, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(471, NULL, 'NE26575160008', 'NEUMATICO RYDANZ 265/75R16 116S R09               ', 'neumatico-rydanz-265-75r16-116s-r09-ne26575160008', 'NEUMATICO RYDANZ 265/75R16 116S R09               ', '', 2, 151, 80, 0, 0, 112490, 0, 0, 112490, 98686, 0, 30, 69080, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(472, NULL, 'NE26575160007', 'NEUMATICO WANLI LT265/75R16 M105 123/120Q         ', 'neumatico-wanli-lt265-75r16-m105-123-120q-ne26575160007', 'NEUMATICO WANLI LT265/75R16 M105 123/120Q         ', '', 2, 139, 2, 0, 0, 99900, 0, 0, 99900, 84628, 0, 0, 84628, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(473, NULL, 'NE26575160005', 'NEUMATICO PIRELLI LT265/75R16 123R SCORP. STR-A   ', 'neumatico-pirelli-lt265-75r16-123r-scorp-str-a-ne26575160005', 'NEUMATICO PIRELLI LT265/75R16 123R SCORP. STR-A   ', '', 2, 129, 3, 0, 0, 90900, 0, 0, 90900, 90901, 0, 0, 90901, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(474, NULL, 'NE26575160004', 'NEUMATICO PIRELLI 265/75R16 123S SCORP. ATR WL    ', 'neumatico-pirelli-265-75r16-123s-scorp-atr-wl-ne26575160004', 'NEUMATICO PIRELLI 265/75R16 123S SCORP. ATR WL    ', '', 2, 129, 44, 0, 0, 136900, 0, 0, 136900, 136900, 0, 3, 132793, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(475, NULL, 'NE26575160002', 'NEUMATICO DURUN 265/75R16-10PR GREEN M/T YTR08    ', 'neumatico-durun-265-75r16-10pr-green-m-t-ytr08-ne26575160002', 'NEUMATICO DURUN 265/75R16-10PR GREEN M/T YTR08    ', '', 2, 153, 3, 0, 0, 86199, 0, 0, 86199, 86199, 0, 0, 86199, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(476, NULL, 'NE26575160001', 'NEUMATICO AUTOGUARD P265/75R16 116S JB45          ', 'neumatico-autoguard-p265-75r16-116s-jb45-ne26575160001', 'NEUMATICO AUTOGUARD P265/75R16 116S JB45          ', '', 2, 154, 5, 0, 0, 46682, 0, 0, 46682, 46681, 0, 0, 46681, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(477, NULL, 'NE26570170008', 'NEUMATICO RYDANZ LT265/70R17-10PR 121/118S R09    ', 'neumatico-rydanz-lt265-70r17-10pr-121-118s-r09-ne26570170008', 'NEUMATICO RYDANZ LT265/70R17-10PR 121/118S R09    ', '', 2, 151, 49, 0, 0, 110900, 0, 0, 110900, 116490, 0, 30, 81544, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(478, NULL, 'NE26570170006', 'NEUMATICO WANLI 265/70R17 115T S-1606             ', 'neumatico-wanli-265-70r17-115t-s-1606-ne26570170006', 'NEUMATICO WANLI 265/70R17 115T S-1606             ', '', 2, 139, 3, 0, 0, 82900, 0, 0, 82900, 82943, 0, 30, 58060, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(479, NULL, 'NE26570170004', 'NEUMATICO PIRELLI 265/70R17 121/118S SCORP. STR   ', 'neumatico-pirelli-265-70r17-121-118s-scorp-str-ne26570170004', 'NEUMATICO PIRELLI 265/70R17 121/118S SCORP. STR   ', '', 2, 129, 22, 0, 0, 141900, 0, 0, 141900, 141900, 0, 0, 141900, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(480, NULL, 'NE26570170003', 'NEUMATICO PIRELLI 265/70R17 113T SCORP. ATR       ', 'neumatico-pirelli-265-70r17-113t-scorp-atr-ne26570170003', 'NEUMATICO PIRELLI 265/70R17 113T SCORP. ATR       ', '', 2, 129, 22, 0, 0, 158900, 0, 0, 158900, 158900, 0, 0, 158900, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(481, NULL, 'NE26570170002', 'NEUMATICO MAXXIS 265/70 R17 8PR MT-753            ', 'neumatico-maxxis-265-70-r17-8pr-mt-753-ne26570170002', 'NEUMATICO MAXXIS 265/70 R17 8PR MT-753            ', '', 2, 155, 1, 0, 0, 69869, 0, 0, 69869, 69870, 0, 0, 69870, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(482, NULL, 'NE26570170001', 'NEUMATICO PIRELLI LT 265/70R17 121/118S SCORP. ATR', 'neumatico-pirelli-lt-265-70r17-121-118s-scorp-atr-ne26570170001', 'NEUMATICO PIRELLI LT 265/70R17 121/118S SCORP. ATR', '', 2, 129, 1, 0, 0, 158900, 0, 0, 158900, 158900, 0, 15, 135065, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(483, NULL, 'NE26570160007', 'NEUMATICO RYDANZ 265/70R16 112S R09               ', 'neumatico-rydanz-265-70r16-112s-r09-ne26570160007', 'NEUMATICO RYDANZ 265/70R16 112S R09               ', '', 2, 151, 371, 0, 0, 79849, 1, 30, 55894, 79849, 1, 30, 55894, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(484, NULL, 'NE26570160005', 'NEUMATICO PIRELLI P265/70R16 112T SCORP. ATR      ', 'neumatico-pirelli-p265-70r16-112t-scorp-atr-ne26570160005', 'NEUMATICO PIRELLI P265/70R16 112T SCORP. ATR      ', '', 2, 129, 4, 0, 0, 131900, 0, 0, 131900, 131900, 0, 10, 118710, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(485, NULL, 'NE26570160003', 'NEUMATICO PIRELLI 265/70R16 112H SCORP. STR       ', 'neumatico-pirelli-265-70r16-112h-scorp-str-ne26570160003', 'NEUMATICO PIRELLI 265/70R16 112H SCORP. STR       ', '', 2, 129, 1, 0, 0, 76900, 0, 0, 76900, 76900, 0, 0, 76900, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(486, NULL, 'NE26570150003', 'NEUMATICO RYDANZ 265/70R15 112S R09               ', 'neumatico-rydanz-265-70r15-112s-r09-ne26570150003', 'NEUMATICO RYDANZ 265/70R15 112S R09               ', '', 2, 151, 27, 0, 0, 100490, 0, 0, 100490, 78016, 0, 30, 54611, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(487, NULL, 'NE26570150001', 'NEUMATICO MAXXIS 265/70R15 HT-750 112S            ', 'neumatico-maxxis-265-70r15-ht-750-112s-ne26570150001', 'NEUMATICO MAXXIS 265/70R15 HT-750 112S            ', '', 2, 155, 2, 0, 0, 74828, 0, 0, 74828, 74828, 0, 0, 74828, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(488, NULL, 'NE26565170005', 'NEUMATICO RYDANZ 265/65R17 112H R06               ', 'neumatico-rydanz-265-65r17-112h-r06-ne26565170005', 'NEUMATICO RYDANZ 265/65R17 112H R06               ', '', 2, 151, 20, 0, 0, 89900, 0, 0, 89900, 93240, 0, 30, 65268, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(489, NULL, 'NE26565170003', 'NEUMATICO WANLI 265/65R17 112S  C069              ', 'neumatico-wanli-265-65r17-112s-c069-ne26565170003', 'NEUMATICO WANLI 265/65R17 112S  C069              ', '', 2, 139, 2, 0, 0, 79900, 0, 0, 79900, 79968, 0, 30, 55978, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(490, NULL, 'NE26565170002', 'NEUMATICO PIRELLI 265/65R17 112T SCORP. ATR       ', 'neumatico-pirelli-265-65r17-112t-scorp-atr-ne26565170002', 'NEUMATICO PIRELLI 265/65R17 112T SCORP. ATR       ', '', 2, 129, 5, 0, 0, 141900, 0, 0, 141900, 141900, 0, 5, 134806, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(491, NULL, 'NE26565170001', 'NEUMATICO PIRELLI P265/65R17 112H SCORP. STR      ', 'neumatico-pirelli-p265-65r17-112h-scorp-str-ne26565170001', 'NEUMATICO PIRELLI P265/65R17 112H SCORP. STR      ', '', 2, 129, 7, 0, 0, 141900, 0, 0, 141900, 141900, 0, 3, 137644, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(492, NULL, 'NE26560180003', 'NEUMATICO PIRELLI 265/60R18 110H SCORP. ATR       ', 'neumatico-pirelli-265-60r18-110h-scorp-atr-ne26560180003', 'NEUMATICO PIRELLI 265/60R18 110H SCORP. ATR       ', '', 2, 129, 9, 0, 0, 199900, 0, 0, 199900, 199900, 0, 15, 169915, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(493, NULL, 'NE26550200002', 'NEUMATICO RYDANZ 265/50R20 111H XL R09            ', 'neumatico-rydanz-265-50r20-111h-xl-r09-ne26550200002', 'NEUMATICO RYDANZ 265/50R20 111H XL R09            ', '', 2, 151, 3, 0, 0, 123900, 0, 0, 123900, 117156, 0, 30, 82009, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(494, NULL, 'NE26550190002', 'NEUMATICO PIRELLI 265/50R19 110V SCORP. VEAS (N0) ', 'neumatico-pirelli-265-50r19-110v-scorp-veas-n0-ne26550190002', 'NEUMATICO PIRELLI 265/50R19 110V SCORP. VEAS (N0) ', '', 2, 129, 50, 0, 0, 259900, 0, 0, 259900, 259900, 0, 20, 207919, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(495, NULL, 'NE26550190001', 'NEUMATICO PIRELLI 265/50R19 110Y XL PZERO (N0)    ', 'neumatico-pirelli-265-50r19-110y-xl-pzero-n0-ne26550190001', 'NEUMATICO PIRELLI 265/50R19 110Y XL PZERO (N0)    ', '', 2, 129, 12, 0, 0, 324900, 0, 0, 324900, 324900, 0, 20, 259920, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(496, NULL, 'NE26545200002', 'NEUMATICO PIRELLI 265/45R20 104Y PZERO (N0)       ', 'neumatico-pirelli-265-45r20-104y-pzero-n0-ne26545200002', 'NEUMATICO PIRELLI 265/45R20 104Y PZERO (N0)       ', '', 2, 129, 4, 0, 0, 337900, 0, 0, 337900, 337900, 0, 20, 270320, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(497, NULL, 'NE26545180001', 'NEUMATICO PIRELLI 265/45ZR18 101Y P-ZERO4 (N1)    ', 'neumatico-pirelli-265-45zr18-101y-p-zero4-n1-ne26545180001', 'NEUMATICO PIRELLI 265/45ZR18 101Y P-ZERO4 (N1)    ', '', 2, 129, 9, 0, 0, 299900, 0, 0, 299900, 299900, 0, 20, 239921, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(498, NULL, 'NE26540210001', 'NEU CONTINENTAL 265/40R21 105Y CROSS CONTACT UHP  ', 'neu-continental-265-40r21-105y-cross-contact-uhp-ne26540210001', 'NEU CONTINENTAL 265/40R21 105Y CROSS CONTACT UHP  ', '', 2, 150, 4, 0, 0, 379905, 0, 0, 379905, 379905, 1, 30, 265934, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(499, NULL, 'NE26540200001', 'NEUMATICO PIRELLI 265/40R20 104Y PZERO (AO)       ', 'neumatico-pirelli-265-40r20-104y-pzero-ao-ne26540200001', 'NEUMATICO PIRELLI 265/40R20 104Y PZERO (AO)       ', '', 2, 129, 5, 0, 0, 261900, 0, 0, 261900, 261900, 0, 0, 261900, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(500, NULL, 'NE26540190001', 'NEUMATICO PIRELLI 265/40ZR19 98Y PZERO (N0)       ', 'neumatico-pirelli-265-40zr19-98y-pzero-n0-ne26540190001', 'NEUMATICO PIRELLI 265/40ZR19 98Y PZERO (N0)       ', '', 2, 129, 2, 0, 0, 469900, 0, 0, 469900, 469900, 0, 20, 375920, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(501, NULL, 'NE26535200002', 'NEUMATICO PIRELLI 265/35ZR20 95Y PZERO (N0)       ', 'neumatico-pirelli-265-35zr20-95y-pzero-n0-ne26535200002', 'NEUMATICO PIRELLI 265/35ZR20 95Y PZERO (N0)       ', '', 2, 129, 9, 0, 0, 299900, 0, 0, 299900, 299900, 0, 10, 269910, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(502, NULL, 'NE26535190007', 'NEU CONTINENTAL 265/35ZR19 98Y MO CSC 5 FR        ', 'neu-continental-265-35zr19-98y-mo-csc-5-fr-ne26535190007', 'NEU CONTINENTAL 265/35ZR19 98Y MO CSC 5 FR        ', '', 2, 150, 4, 0, 0, 307900, 0, 0, 307900, 307899, 1, 30, 215529, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(503, NULL, 'NE26535190005', 'NEUMATICO PIRELLI 265/35ZR19 94Y PZERO (N2)       ', 'neumatico-pirelli-265-35zr19-94y-pzero-n2-ne26535190005', 'NEUMATICO PIRELLI 265/35ZR19 94Y PZERO (N2)       ', '', 2, 129, 16, 0, 0, 349900, 0, 0, 349900, 349900, 0, 10, 314911, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(504, NULL, 'NE26535180005', 'NEU CONTINENTAL 265/35R18 CSC3 97Y MO FR          ', 'neu-continental-265-35r18-csc3-97y-mo-fr-ne26535180005', 'NEU CONTINENTAL 265/35R18 CSC3 97Y MO FR          ', '', 2, 150, 1, 0, 0, 360905, 0, 0, 360905, 360906, 1, 30, 252633, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(505, NULL, 'NE26535180002', 'NEUMATICO PIRELLI 265/35R18 97Y XL PZERO (MO)     ', 'neumatico-pirelli-265-35r18-97y-xl-pzero-mo-ne26535180002', 'NEUMATICO PIRELLI 265/35R18 97Y XL PZERO (MO)     ', '', 2, 129, 17, 0, 0, 220900, 0, 0, 220900, 220900, 0, 20, 176720, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(506, NULL, 'NE26535180001', 'NEUMATICO PIRELLI 265/35ZR18 93Y PZERO ROSSO (N4) ', 'neumatico-pirelli-265-35zr18-93y-pzero-rosso-n4-ne26535180001', 'NEUMATICO PIRELLI 265/35ZR18 93Y PZERO ROSSO (N4) ', '', 2, 129, 9, 0, 0, 220900, 0, 0, 220900, 220900, 0, 3, 214273, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(507, NULL, 'NE26530200001', 'NEUMATICO PIRELLI 265/30ZR20 94Y PZERO (R01)      ', 'neumatico-pirelli-265-30zr20-94y-pzero-r01-ne26530200001', 'NEUMATICO PIRELLI 265/30ZR20 94Y PZERO (R01)      ', '', 2, 129, 7, 0, 0, 269900, 0, 0, 269900, 269073, 0, 0, 269073, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(508, NULL, 'NE25575150003', 'NEUMATICO PIRELLI LT255/75R15 109S SCORP. ATR     ', 'neumatico-pirelli-lt255-75r15-109s-scorp-atr-ne25575150003', 'NEUMATICO PIRELLI LT255/75R15 109S SCORP. ATR     ', '', 2, 129, 16, 0, 0, 129900, 0, 0, 129900, 129900, 0, 20, 103920, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(509, NULL, 'NE25575150002', 'NEUMATICO PIRELLI 255/75R15 109/105S SCORP. ATR   ', 'neumatico-pirelli-255-75r15-109-105s-scorp-atr-ne25575150002', 'NEUMATICO PIRELLI 255/75R15 109/105S SCORP. ATR   ', '', 2, 129, 2, 0, 0, 71900, 0, 0, 71900, 71900, 0, 0, 71900, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(510, NULL, 'NE25575150001', 'NEUMATICO PIRELLI 255/75R15 109/105S SCORP. S/T   ', 'neumatico-pirelli-255-75r15-109-105s-scorp-s-t-ne25575150001', 'NEUMATICO PIRELLI 255/75R15 109/105S SCORP. S/T   ', '', 2, 129, 4, 0, 0, 92900, 0, 0, 92900, 92900, 0, 0, 92900, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(511, NULL, 'NE25570180002', 'NEUMATICO PIRELLI 255/70R18 112S SCORP. STR       ', 'neumatico-pirelli-255-70r18-112s-scorp-str-ne25570180002', 'NEUMATICO PIRELLI 255/70R18 112S SCORP. STR       ', '', 2, 129, 11, 0, 0, 106900, 0, 0, 106900, 106315, 0, 0, 106315, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(512, NULL, 'NE25570160004', 'NEUMATICO PIRELLI P255/70R16 109H SCORP. STR      ', 'neumatico-pirelli-p255-70r16-109h-scorp-str-ne25570160004', 'NEUMATICO PIRELLI P255/70R16 109H SCORP. STR      ', '', 2, 129, 4, 0, 0, 126900, 0, 0, 126900, 126900, 0, 3, 123094, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(513, NULL, 'NE25570160003', 'NEUMATICO PIRELLI P255/70R16 109T SCORP. ATR      ', 'neumatico-pirelli-p255-70r16-109t-scorp-atr-ne25570160003', 'NEUMATICO PIRELLI P255/70R16 109T SCORP. ATR      ', '', 2, 129, 6, 0, 0, 126900, 0, 0, 126900, 126900, 0, 3, 123094, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(514, NULL, 'NE25565170001', 'NEUMATICO PIRELLI 255/65R17 110T SCORP. ATR       ', 'neumatico-pirelli-255-65r17-110t-scorp-atr-ne25565170001', 'NEUMATICO PIRELLI 255/65R17 110T SCORP. ATR       ', '', 2, 129, 15, 0, 0, 134900, 0, 0, 134900, 134900, 0, 3, 130852, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(515, NULL, 'NE25565160001', 'NEUMATICO PIRELLI 255/65R16 109H SCORP. STR       ', 'neumatico-pirelli-255-65r16-109h-scorp-str-ne25565160001', 'NEUMATICO PIRELLI 255/65R16 109H SCORP. STR       ', '', 2, 129, 22, 0, 0, 132900, 0, 0, 132900, 132900, 0, 5, 126255, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(516, NULL, 'NE25560180003', 'NEUMATICO PIRELLI 255/60R18 112T XL SCORP. ATR    ', 'neumatico-pirelli-255-60r18-112t-xl-scorp-atr-ne25560180003', 'NEUMATICO PIRELLI 255/60R18 112T XL SCORP. ATR    ', '', 2, 129, 91, 0, 0, 179788, 1, 30, 125852, 152820, 1, 30, 106974, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(517, NULL, 'NE25560180002', 'NEUMATICO PIRELLI 255/60R18 112H SCORP. VEAS      ', 'neumatico-pirelli-255-60r18-112h-scorp-veas-ne25560180002', 'NEUMATICO PIRELLI 255/60R18 112H SCORP. VEAS      ', '', 2, 129, 17, 0, 0, 153900, 0, 0, 153900, 153900, 0, 5, 146206, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(518, NULL, 'NE25560150002', 'NEUMATICO DUNLOP 255/60R15 A15 SPORT GT           ', 'neumatico-dunlop-255-60r15-a15-sport-gt-ne25560150002', 'NEUMATICO DUNLOP 255/60R15 A15 SPORT GT           ', '', 2, 159, 1, 0, 0, 83784, 0, 0, 83784, 83783, 0, 0, 83783, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(519, NULL, 'NE25555200003', 'NEU PIRELLI 255/55R20 110Y XL SCORP. VERDE A/S LR ', 'neu-pirelli-255-55r20-110y-xl-scorp-verde-a-s-lr-ne25555200003', 'NEU PIRELLI 255/55R20 110Y XL SCORP. VERDE A/S LR ', '', 2, 129, 8, 0, 0, 359900, 0, 0, 359900, 359900, 0, 10, 323910, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(520, NULL, 'NE25555200002', 'NEUMATICO PIRELLI 255/55R20 110W XL SCOR VEAS (LR)', 'neumatico-pirelli-255-55r20-110w-xl-scor-veas-lr-ne25555200002', 'NEUMATICO PIRELLI 255/55R20 110W XL SCOR VEAS (LR)', '', 2, 129, 8, 0, 0, 318900, 0, 0, 318900, 249900, 0, 5, 237405, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(521, NULL, 'NE25555190002', 'NEUMATICO PIRELLI 255/55R19 111V XL SCORP. ZERO   ', 'neumatico-pirelli-255-55r19-111v-xl-scorp-zero-ne25555190002', 'NEUMATICO PIRELLI 255/55R19 111V XL SCORP. ZERO   ', '', 2, 129, 30, 0, 0, 239900, 0, 0, 239900, 239900, 0, 20, 191921, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(522, NULL, 'NE25555180014', 'NEU CONTINENTAL 255/55R18 105W CCC UHP MO ML      ', 'neu-continental-255-55r18-105w-ccc-uhp-mo-ml-ne25555180014', 'NEU CONTINENTAL 255/55R18 105W CCC UHP MO ML      ', '', 2, 150, 4, 0, 0, 203205, 0, 0, 203205, 203206, 1, 30, 142244, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(523, NULL, 'NE25555180013', 'NEUMATICO MOMO 255/55ZR18 109Y XL M-9 ALUSION W-S ', 'neumatico-momo-255-55zr18-109y-xl-m-9-alusion-w-s-ne25555180013', 'NEUMATICO MOMO 255/55ZR18 109Y XL M-9 ALUSION W-S ', '', 2, 149, 36, 0, 0, 139900, 0, 0, 139900, 143564, 0, 30, 100494, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(524, NULL, 'NE25555180012', 'NEUMATICO PIRELLI 255/55R18 109V XL SCORP. VERDE  ', 'neumatico-pirelli-255-55r18-109v-xl-scorp-verde-ne25555180012', 'NEUMATICO PIRELLI 255/55R18 109V XL SCORP. VERDE  ', '', 2, 129, 1, 0, 0, 179900, 0, 0, 179900, 179899, 0, 5, 170904, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(525, NULL, 'NE25555180011', 'NEUMATICO PIRELLI 255/55R18 109V XL SCO VE RFT (*)', 'neumatico-pirelli-255-55r18-109v-xl-sco-ve-rft-ne25555180011', 'NEUMATICO PIRELLI 255/55R18 109V XL SCO VE RFT (*)', '', 2, 129, 17, 0, 0, 289900, 0, 0, 289900, 289899, 0, 20, 231919, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(526, NULL, 'NE25555180006', 'NEUMATICO PIRELLI 255/55R18 109V XL SCOR ZERO (N0)', 'neumatico-pirelli-255-55r18-109v-xl-scor-zero-n0-ne25555180006', 'NEUMATICO PIRELLI 255/55R18 109V XL SCOR ZERO (N0)', '', 2, 129, 20, 0, 0, 218900, 0, 0, 218900, 218900, 0, 20, 175120, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(527, NULL, 'NE25555180002', 'NEUMATICO DUNLOP 255/55R18 109V PT2               ', 'neumatico-dunlop-255-55r18-109v-pt2-ne25555180002', 'NEUMATICO DUNLOP 255/55R18 109V PT2               ', '', 2, 159, 1, 0, 0, 81599, 0, 0, 81599, 81599, 0, 0, 81599, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(528, NULL, 'NE25555180001', 'NEUMATICO MICHELIN 255/55R18 4X4 SINCROME         ', 'neumatico-michelin-255-55r18-4x4-sincrome-ne25555180001', 'NEUMATICO MICHELIN 255/55R18 4X4 SINCROME         ', '', 2, 158, 1, 0, 0, 168880, 0, 0, 168880, 168880, 0, 0, 168880, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL);
INSERT INTO `sitio_productos` (`id`, `id_erp`, `sku`, `nombre`, `slug`, `descripcion`, `ficha`, `categoria_id`, `marca_id`, `stock`, `stock_fisico`, `stock_compra`, `precio_publico`, `oferta_publico`, `dcto_publico`, `preciofinal_publico`, `precio_mayorista`, `oferta_mayorista`, `dcto_mayorista`, `preciofinal_mayorista`, `apernaduras`, `apernadura1`, `apernadura2`, `aro`, `ancho`, `perfil`, `fecha_modificacion`, `hora_modificacion`, `stock_b015`, `stock_b301`, `stock_b401`, `stock_b701`, `stock_b901`, `stock_bclm`, `stock_bvtm`, `stock_blco`, `activo`, `agotado`, `eliminado`, `created`, `modified`) VALUES
(529, NULL, 'NE25550200003', 'NEUMATICO PIRELLI 255/50R20 109W XL PZERO (J)     ', 'neumatico-pirelli-255-50r20-109w-xl-pzero-j-ne25550200003', 'NEUMATICO PIRELLI 255/50R20 109W XL PZERO (J)     ', '', 2, 129, 13, 0, 0, 379900, 0, 0, 379900, 379900, 0, 20, 303920, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(530, NULL, 'NE25550200001', 'NEUMATICO PIRELLI 255/50R20 109Y SCORP. ZERO      ', 'neumatico-pirelli-255-50r20-109y-scorp-zero-ne25550200001', 'NEUMATICO PIRELLI 255/50R20 109Y SCORP. ZERO      ', '', 2, 129, 12, 0, 0, 239900, 0, 0, 239900, 239900, 0, 10, 215910, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(531, NULL, 'NE25550190011', 'NEUMATICO MOMO 255/50ZR19 107Y XL M-9 ALUSION W-S ', 'neumatico-momo-255-50zr19-107y-xl-m-9-alusion-w-s-ne25550190011', 'NEUMATICO MOMO 255/50ZR19 107Y XL M-9 ALUSION W-S ', '', 2, 149, 21, 0, 0, 169900, 0, 0, 169900, 173988, 0, 30, 121792, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(532, NULL, 'NE25550190010', 'NEUMATICO MOMO 255/50R19 107Y XL M-30 TOPRUN W-S  ', 'neumatico-momo-255-50r19-107y-xl-m-30-toprun-w-s-ne25550190010', 'NEUMATICO MOMO 255/50R19 107Y XL M-30 TOPRUN W-S  ', '', 2, 149, 38, 0, 0, 169900, 0, 0, 169900, 175825, 0, 30, 123077, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(533, NULL, 'NE25550190004', 'NEUMATICO PIRELLI 255/50R19 103W SCORP. VERDE (MO)', 'neumatico-pirelli-255-50r19-103w-scorp-verde-mo-ne25550190004', 'NEUMATICO PIRELLI 255/50R19 103W SCORP. VERDE (MO)', '', 2, 129, 13, 0, 0, 269900, 0, 0, 269900, 269900, 0, 20, 215921, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(534, NULL, 'NE25550190002', 'NEUMATICO PIRELLI 255/50R19 103W PZERO ROSSO (MO) ', 'neumatico-pirelli-255-50r19-103w-pzero-rosso-mo-ne25550190002', 'NEUMATICO PIRELLI 255/50R19 103W PZERO ROSSO (MO) ', '', 2, 129, 17, 0, 0, 262900, 0, 0, 262900, 262900, 0, 20, 210319, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(535, NULL, 'NE25550190001', 'NEU PIRELLI 255/50ZR19 107Y XL SCORP. ZERO ASIM   ', 'neu-pirelli-255-50zr19-107y-xl-scorp-zero-asim-ne25550190001', 'NEU PIRELLI 255/50ZR19 107Y XL SCORP. ZERO ASIM   ', '', 2, 129, 18, 0, 0, 199900, 0, 0, 199900, 199900, 0, 10, 179910, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(536, NULL, 'NE25545200003', 'NEUMATICO PIRELLI 255/45R20 101W SC.VERDE RFT (MO)', 'neumatico-pirelli-255-45r20-101w-sc-verde-rft-mo-ne25545200003', 'NEUMATICO PIRELLI 255/45R20 101W SC.VERDE RFT (MO)', '', 2, 129, 17, 0, 0, 447900, 0, 0, 447900, 447901, 0, 20, 358321, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(537, NULL, 'NE25545200002', 'NEU PIRELLI 255/45R20 105V XL SCORP. ZERO ASIM    ', 'neu-pirelli-255-45r20-105v-xl-scorp-zero-asim-ne25545200002', 'NEU PIRELLI 255/45R20 105V XL SCORP. ZERO ASIM    ', '', 2, 129, 14, 0, 0, 299900, 0, 0, 299900, 299900, 0, 20, 239921, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(538, NULL, 'NE25545200001', 'NEUMATICO PIRELLI 255/45R20 101W SCORP. VERDE (MO)', 'neumatico-pirelli-255-45r20-101w-scorp-verde-mo-ne25545200001', 'NEUMATICO PIRELLI 255/45R20 101W SCORP. VERDE (MO)', '', 2, 129, 8, 0, 0, 249900, 0, 0, 249900, 249900, 0, 5, 237405, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(539, NULL, 'NE25545190001', 'NEUMATICO PIRELLI 255/45R19 104Y PZERO (AO)       ', 'neumatico-pirelli-255-45r19-104y-pzero-ao-ne25545190001', 'NEUMATICO PIRELLI 255/45R19 104Y PZERO (AO)       ', '', 2, 129, 4, 0, 0, 249900, 0, 0, 249900, 249900, 0, 20, 199920, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(540, NULL, 'NE25545180004', 'NEUMATICO PIRELLI 255/45R18 99W P7 CINT. RFT (*)  ', 'neumatico-pirelli-255-45r18-99w-p7-cint-rft-ne25545180004', 'NEUMATICO PIRELLI 255/45R18 99W P7 CINT. RFT (*)  ', '', 2, 129, 4, 0, 0, 349900, 0, 0, 349900, 349900, 0, 20, 279920, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(541, NULL, 'NE25545180003', 'NEUMATICO PIRELLI 255/45R18 99Y PZERO (AO)        ', 'neumatico-pirelli-255-45r18-99y-pzero-ao-ne25545180003', 'NEUMATICO PIRELLI 255/45R18 99Y PZERO (AO)        ', '', 2, 129, 14, 0, 0, 219900, 0, 0, 219900, 219900, 0, 20, 175920, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(542, NULL, 'NE25545180002', 'NEUMATICO PIRELLI 255/45R18 99Y PZERO             ', 'neumatico-pirelli-255-45r18-99y-pzero-ne25545180002', 'NEUMATICO PIRELLI 255/45R18 99Y PZERO             ', '', 2, 129, 2, 0, 0, 249900, 0, 0, 249900, 249900, 0, 10, 224910, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(543, NULL, 'NE25545180001', 'NEUMATICO PIRELLI 255/45R18 99Y PZERO ROSSO (MO)  ', 'neumatico-pirelli-255-45r18-99y-pzero-rosso-mo-ne25545180001', 'NEUMATICO PIRELLI 255/45R18 99Y PZERO ROSSO (MO)  ', '', 2, 129, 16, 0, 0, 229900, 0, 0, 229900, 229900, 0, 20, 183919, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(544, NULL, 'NE25540190001', 'NEUMATICO PIRELLI 255/40R19 96H SCORP. VEAS       ', 'neumatico-pirelli-255-40r19-96h-scorp-veas-ne25540190001', 'NEUMATICO PIRELLI 255/40R19 96H SCORP. VEAS       ', '', 2, 129, 1, 0, 0, 124900, 0, 0, 124900, 124915, 0, 0, 124915, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(545, NULL, 'NE25540180006', 'NEUMATICO PIRELLI 255/40R18 95Y P7 CINT. RFT      ', 'neumatico-pirelli-255-40r18-95y-p7-cint-rft-ne25540180006', 'NEUMATICO PIRELLI 255/40R18 95Y P7 CINT. RFT      ', '', 2, 129, 5, 0, 0, 349900, 0, 0, 349900, 349900, 0, 5, 332405, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(546, NULL, 'NE25540180004', 'NEUMATICO PIRELLI 255/40ZR18 99Y PZERO ROSSO (MO) ', 'neumatico-pirelli-255-40zr18-99y-pzero-rosso-mo-ne25540180004', 'NEUMATICO PIRELLI 255/40ZR18 99Y PZERO ROSSO (MO) ', '', 2, 129, 7, 0, 0, 178900, 0, 0, 178900, 178486, 0, 0, 178486, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(547, NULL, 'NE25540170003', 'NEUMATICO PIRELLI 255/40R17 94W PZERO RFT         ', 'neumatico-pirelli-255-40r17-94w-pzero-rft-ne25540170003', 'NEUMATICO PIRELLI 255/40R17 94W PZERO RFT         ', '', 2, 129, 5, 0, 0, 184900, 0, 0, 184900, 184900, 0, 5, 175655, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(548, NULL, 'NE25540170002', 'NEUMATICO PIRELLI 255/40ZR17 PZERO ROSSO (N3)     ', 'neumatico-pirelli-255-40zr17-pzero-rosso-n3-ne25540170002', 'NEUMATICO PIRELLI 255/40ZR17 PZERO ROSSO (N3)     ', '', 2, 129, 3, 0, 0, 114900, 0, 0, 114900, 114153, 0, 0, 114153, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(549, NULL, 'NE25535200003', 'NEUMATICO 255/35ZR20 97Y XL P-ZERO4 (J)           ', 'neumatico-255-35zr20-97y-xl-p-zero4-j-ne25535200003', 'NEUMATICO 255/35ZR20 97Y XL P-ZERO4 (J)           ', '', 2, 129, 1, 0, 0, 255900, 0, 0, 255900, 255900, 0, 10, 230310, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(550, NULL, 'NE25535190010', 'NEUMATICO PIRELLI 255/35ZR19 96Y XL PZERO (MO)    ', 'neumatico-pirelli-255-35zr19-96y-xl-pzero-mo-ne25535190010', 'NEUMATICO PIRELLI 255/35ZR19 96Y XL PZERO (MO)    ', '', 2, 129, 29, 0, 0, 252900, 0, 0, 252900, 252900, 0, 20, 202320, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(551, NULL, 'NE25535190007', 'NEUMATICO MOMO 255/35ZR19 96Y XL M-3 OUTRUN W-S   ', 'neumatico-momo-255-35zr19-96y-xl-m-3-outrun-w-s-ne25535190007', 'NEUMATICO MOMO 255/35ZR19 96Y XL M-3 OUTRUN W-S   ', '', 2, 149, 31, 0, 0, 154900, 0, 0, 154900, 159004, 0, 30, 111303, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(552, NULL, 'NE25535190005', 'NEUMATICO PIRELLI 255/35R19 96Y XL PZERO (MO)     ', 'neumatico-pirelli-255-35r19-96y-xl-pzero-mo-ne25535190005', 'NEUMATICO PIRELLI 255/35R19 96Y XL PZERO (MO)     ', '', 2, 129, 1, 0, 0, 259900, 0, 0, 259900, 259900, 0, 10, 233910, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(553, NULL, 'NE25535180007', 'NEU CONTINENTAL 255/35R18 94Y CSC5 FR XL          ', 'neu-continental-255-35r18-94y-csc5-fr-xl-ne25535180007', 'NEU CONTINENTAL 255/35R18 94Y CSC5 FR XL          ', '', 2, 150, 11, 0, 0, 236455, 0, 0, 236455, 236455, 1, 30, 165518, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(554, NULL, 'NE25535180006', 'NEUMATICO MOMO 255/35ZR18 94Y XL M-3 OUTRUN W-S   ', 'neumatico-momo-255-35zr18-94y-xl-m-3-outrun-w-s-ne25535180006', 'NEUMATICO MOMO 255/35ZR18 94Y XL M-3 OUTRUN W-S   ', '', 2, 149, 18, 0, 0, 134900, 0, 0, 134900, 131575, 0, 30, 92102, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(555, NULL, 'NE25535180004', 'NEU CONTINENTAL  255/35R18 94Y XL FR SC3 MO       ', 'neu-continental-255-35r18-94y-xl-fr-sc3-mo-ne25535180004', 'NEU CONTINENTAL  255/35R18 94Y XL FR SC3 MO       ', '', 2, 150, 5, 0, 0, 339900, 0, 0, 339900, 339900, 1, 30, 237930, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(556, NULL, 'NE25535180003', 'NEUMATICO PIRELLI 255/35ZR18 94Y XL PZERO (MO)    ', 'neumatico-pirelli-255-35zr18-94y-xl-pzero-mo-ne25535180003', 'NEUMATICO PIRELLI 255/35ZR18 94Y XL PZERO (MO)    ', '', 2, 129, 12, 0, 0, 199900, 0, 0, 199900, 199900, 0, 20, 159919, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(557, NULL, 'NE25535180001', 'NEUMATICO PIRELLI 255/35R18 90Y PZERO RFT         ', 'neumatico-pirelli-255-35r18-90y-pzero-rft-ne25535180001', 'NEUMATICO PIRELLI 255/35R18 90Y PZERO RFT         ', '', 2, 129, 25, 0, 0, 299900, 0, 0, 299900, 299900, 0, 3, 290903, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(558, NULL, 'NE25530190002', 'NEU CONTINENTAL 255/30R19 91Y CSC 5P MO FR        ', 'neu-continental-255-30r19-91y-csc-5p-mo-fr-ne25530190002', 'NEU CONTINENTAL 255/30R19 91Y CSC 5P MO FR        ', '', 2, 150, 2, 0, 0, 311505, 0, 0, 311505, 311505, 1, 30, 218053, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(559, NULL, 'NE25530190001', 'NEUMATICO PIRELLI 255/30ZR19 91Y XL PZERO         ', 'neumatico-pirelli-255-30zr19-91y-xl-pzero-ne25530190001', 'NEUMATICO PIRELLI 255/30ZR19 91Y XL PZERO         ', '', 2, 129, 2, 0, 0, 299900, 0, 0, 299900, 299900, 0, 15, 254915, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(560, NULL, 'NE24575170001', 'NEUMATICO RYDANZ LT245/75R17 10PR 121/118S R09    ', 'neumatico-rydanz-lt245-75r17-10pr-121-118s-r09-ne24575170001', 'NEUMATICO RYDANZ LT245/75R17 10PR 121/118S R09    ', '', 2, 151, 40, 0, 0, 116490, 0, 0, 116490, 120022, 0, 30, 84015, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(561, NULL, 'NE24575160011', 'NEUMATICO PIRELLI LT245/75/16 120Q SCORP. MTR     ', 'neumatico-pirelli-lt245-75-16-120q-scorp-mtr-ne24575160011', 'NEUMATICO PIRELLI LT245/75/16 120Q SCORP. MTR     ', '', 2, 129, 12, 0, 0, 136900, 0, 0, 136900, 136900, 0, 5, 130055, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(562, NULL, 'NE24575160010', 'NEUMATICO RYDANZ 245/75R16 109S R09               ', 'neumatico-rydanz-245-75r16-109s-r09-ne24575160010', 'NEUMATICO RYDANZ 245/75R16 109S R09               ', '', 2, 151, 269, 0, 0, 89900, 0, 0, 89900, 67711, 0, 30, 47398, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(563, NULL, 'NE24575160009', 'NEUMATICO 245/75 R16 111S UD4S AUTOGUARD          ', 'neumatico-245-75-r16-111s-ud4s-autoguard-ne24575160009', 'NEUMATICO 245/75 R16 111S UD4S AUTOGUARD          ', '', 2, 154, 1, 0, 0, 47514, 0, 0, 47514, 47513, 0, 0, 47513, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(564, NULL, 'NE24575160005', 'NEUMATICO SUNNY 245/75R16 106T SN268C             ', 'neumatico-sunny-245-75r16-106t-sn268c-ne24575160005', 'NEUMATICO SUNNY 245/75R16 106T SN268C             ', '', 2, 152, 2, 0, 0, 50514, 0, 0, 50514, 50513, 0, 0, 50513, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(565, NULL, 'NE24575160004', 'NEUMATICO PIRELLI 245/75R16 120R SCORP. ATR       ', 'neumatico-pirelli-245-75r16-120r-scorp-atr-ne24575160004', 'NEUMATICO PIRELLI 245/75R16 120R SCORP. ATR       ', '', 2, 129, 46, 0, 0, 149900, 0, 0, 149900, 149900, 0, 15, 127414, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(566, NULL, 'NE24570160012', 'NEUMATICO WANLI LT245/70R16 S-2082 113/110S       ', 'neumatico-wanli-lt245-70r16-s-2082-113-110s-ne24570160012', 'NEUMATICO WANLI LT245/70R16 S-2082 113/110S       ', '', 2, 139, 5, 0, 0, 84900, 0, 0, 84900, 84847, 0, 5, 80605, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(567, NULL, 'NE24570160006', 'NEUMATICO SUNNY 245/70R16 SN-3606                 ', 'neumatico-sunny-245-70r16-sn-3606-ne24570160006', 'NEUMATICO SUNNY 245/70R16 SN-3606                 ', '', 2, 152, 1, 0, 0, 42751, 0, 0, 42751, 42751, 0, 0, 42751, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(568, NULL, 'NE24570160002', 'NEUMATICO PIRELLI 245/70R16 113T SCORP. ATR       ', 'neumatico-pirelli-245-70r16-113t-scorp-atr-ne24570160002', 'NEUMATICO PIRELLI 245/70R16 113T SCORP. ATR       ', '', 2, 129, 20, 0, 0, 103900, 0, 0, 103900, 103900, 0, 0, 103900, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(569, NULL, 'NE24570160001', 'NEUMATICO DUNLOP 245 70 R16 AT3                   ', 'neumatico-dunlop-245-70-r16-at3-ne24570160001', 'NEUMATICO DUNLOP 245 70 R16 AT3                   ', '', 2, 159, 1, 0, 0, 75278, 0, 0, 75278, 75278, 0, 0, 75278, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(570, NULL, 'NE24565170006', 'NEUMATICO RYDANZ 245/65R17 107H R09               ', 'neumatico-rydanz-245-65r17-107h-r09-ne24565170006', 'NEUMATICO RYDANZ 245/65R17 107H R09               ', '', 2, 151, 14, 0, 0, 94490, 0, 0, 94490, 97822, 0, 30, 68475, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(571, NULL, 'NE24565170005', 'NEUMATICO WANLI 245/65R17 107 T - S-1606          ', 'neumatico-wanli-245-65r17-107-t-s-1606-ne24565170005', 'NEUMATICO WANLI 245/65R17 107 T - S-1606          ', '', 2, 139, 26, 0, 0, 83990, 0, 0, 83990, 77350, 0, 5, 73482, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(572, NULL, 'NE24565170004', 'NEUMATICO PIRELLI 245/65R17 111T XL SCORP. ATR    ', 'neumatico-pirelli-245-65r17-111t-xl-scorp-atr-ne24565170004', 'NEUMATICO PIRELLI 245/65R17 111T XL SCORP. ATR    ', '', 2, 129, 15, 0, 0, 148900, 0, 0, 148900, 148900, 0, 10, 134009, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(573, NULL, 'NE24565170003', 'NEUMATICO GOODRIDE 245/65R17 107HSU307            ', 'neumatico-goodride-245-65r17-107hsu307-ne24565170003', 'NEUMATICO GOODRIDE 245/65R17 107HSU307            ', '', 2, 163, 1, 0, 0, 46967, 0, 0, 46967, 46967, 0, 0, 46967, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(574, NULL, 'NE24565170001', 'NEUMATICO SUNNY P245/65R17 SN3606 107T            ', 'neumatico-sunny-p245-65r17-sn3606-107t-ne24565170001', 'NEUMATICO SUNNY P245/65R17 SN3606 107T            ', '', 2, 152, 1, 0, 0, 51235, 0, 0, 51235, 51235, 0, 0, 51235, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(575, NULL, 'NE24555170001', 'NEUMATICO PIRELLI 245/55R17 102W PZERO ROSSO      ', 'neumatico-pirelli-245-55r17-102w-pzero-rosso-ne24555170001', 'NEUMATICO PIRELLI 245/55R17 102W PZERO ROSSO      ', '', 2, 129, 6, 0, 0, 81900, 0, 0, 81900, 81901, 0, 0, 81901, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(576, NULL, 'NE24550180006', 'NEU CONTINENTAL 245/50R18 100Y CSC 3 SSR          ', 'neu-continental-245-50r18-100y-csc-3-ssr-ne24550180006', 'NEU CONTINENTAL 245/50R18 100Y CSC 3 SSR          ', '', 2, 150, 7, 0, 0, 299155, 0, 0, 299155, 299155, 1, 30, 209409, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(577, NULL, 'NE24550180005', 'NEUMATICO MOMO 245/50R18 100Y M-30 TOPRUN RFT     ', 'neumatico-momo-245-50r18-100y-m-30-toprun-rft-ne24550180005', 'NEUMATICO MOMO 245/50R18 100Y M-30 TOPRUN RFT     ', '', 2, 149, 16, 0, 0, 249900, 0, 0, 249900, 262929, 0, 30, 184050, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(578, NULL, 'NE24550180001', 'NEUMATICO PIRELLI 245/50R18 100W P7 CINT.RFT      ', 'neumatico-pirelli-245-50r18-100w-p7-cint-rft-ne24550180001', 'NEUMATICO PIRELLI 245/50R18 100W P7 CINT.RFT      ', '', 2, 129, 14, 0, 0, 399900, 0, 0, 399900, 399900, 0, 20, 319920, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL),
(579, NULL, 'NE24545200001', 'NEUMATICO PIRELLI 245/45ZR20 103Y PZERO           ', 'neumatico-pirelli-245-45zr20-103y-pzero-ne24545200001', 'NEUMATICO PIRELLI 245/45ZR20 103Y PZERO           ', '', 2, 129, 17, 0, 0, 242900, 0, 0, 242900, 242900, 0, 0, 242900, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sitio_regiones`
--

CREATE TABLE `sitio_regiones` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(80) NOT NULL,
  `numero` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sitio_servicios`
--

CREATE TABLE `sitio_servicios` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(80) NOT NULL,
  `slug` varchar(100) NOT NULL,
  `descripcion_corta` varchar(100) DEFAULT NULL,
  `descripcion` text,
  `imagen` varchar(100) DEFAULT NULL,
  `imagen_mobile` varchar(100) DEFAULT NULL,
  `activo` tinyint(1) UNSIGNED DEFAULT '1',
  `eliminado` tinyint(1) UNSIGNED DEFAULT '0',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sitio_servicios_sucursales`
--

CREATE TABLE `sitio_servicios_sucursales` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `servicio_id` bigint(20) UNSIGNED NOT NULL,
  `sucursal_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sitio_sucursales`
--

CREATE TABLE `sitio_sucursales` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `administrador_id` bigint(20) UNSIGNED NOT NULL,
  `tipo_sucursal_id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(80) NOT NULL,
  `slug` varchar(100) NOT NULL,
  `direccion` varchar(80) DEFAULT NULL,
  `telefono` varchar(60) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `hr_semana` varchar(60) DEFAULT NULL,
  `hr_sabado` varchar(60) DEFAULT NULL,
  `hr_domingo` varchar(60) DEFAULT NULL,
  `imagen` varchar(100) DEFAULT NULL,
  `latitud` float DEFAULT NULL,
  `longitud` float DEFAULT NULL,
  `retiro_sucursal` tinyint(1) DEFAULT NULL,
  `activo` tinyint(1) UNSIGNED DEFAULT '1',
  `eliminado` tinyint(1) UNSIGNED DEFAULT '0',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sitio_tipo_direcciones`
--

CREATE TABLE `sitio_tipo_direcciones` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sitio_tipo_sucursales`
--

CREATE TABLE `sitio_tipo_sucursales` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sitio_tipo_usuarios`
--

CREATE TABLE `sitio_tipo_usuarios` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(60) NOT NULL,
  `usuario_count` int(11) DEFAULT NULL,
  `activo` tinyint(1) UNSIGNED NOT NULL DEFAULT '1',
  `eliminado` tinyint(1) UNSIGNED DEFAULT '0',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sitio_usuarios`
--

CREATE TABLE `sitio_usuarios` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tipo_usuario_id` bigint(20) UNSIGNED DEFAULT NULL,
  `rut` int(11) DEFAULT NULL,
  `dv` varchar(1) DEFAULT NULL,
  `nombre` varchar(60) DEFAULT NULL,
  `apellido_paterno` varchar(60) DEFAULT NULL,
  `apellido_materno` varchar(60) DEFAULT NULL,
  `genero` varchar(20) DEFAULT NULL,
  `email` varchar(200) NOT NULL,
  `clave` varchar(40) NOT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `codigo` varchar(40) DEFAULT NULL,
  `codigo_expiracion` datetime DEFAULT NULL,
  `direccion_count` int(10) UNSIGNED DEFAULT '0',
  `activo` tinyint(1) UNSIGNED DEFAULT '1',
  `eliminado` tinyint(1) UNSIGNED DEFAULT '0',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sitio_vehiculos`
--

CREATE TABLE `sitio_vehiculos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(200) NOT NULL,
  `marca` varchar(80) NOT NULL,
  `modelo` varchar(80) NOT NULL,
  `version` varchar(80) NOT NULL,
  `apernadura` varchar(80) DEFAULT NULL,
  `aro` varchar(80) NOT NULL,
  `ancho` varchar(80) DEFAULT NULL,
  `perfil` varchar(80) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `sitio_administradores`
--
ALTER TABLE `sitio_administradores`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UQ_EMAIL` (`email`),
  ADD KEY `IX_FK_PERFIL_ADMINISTRADOR` (`perfil_id`);

--
-- Indexes for table `sitio_banners`
--
ALTER TABLE `sitio_banners`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IX_FK_ADMINISTRADOR_BANNER` (`administrador_id`);

--
-- Indexes for table `sitio_campo_paginas`
--
ALTER TABLE `sitio_campo_paginas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UN_NOMBRE` (`identificador`),
  ADD UNIQUE KEY `UN_SLUG` (`valor`),
  ADD KEY `IX_FK_PAGINA_CAMPOPAGINA` (`pagina_id`);

--
-- Indexes for table `sitio_cargas`
--
ALTER TABLE `sitio_cargas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IX_FK_ADMINISTRADOR_CARGA` (`administrador_id`);

--
-- Indexes for table `sitio_categorias`
--
ALTER TABLE `sitio_categorias`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sitio_categoria_paginas`
--
ALTER TABLE `sitio_categoria_paginas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UN_NOMBRE` (`nombre`),
  ADD UNIQUE KEY `UN_SLUG` (`slug`);

--
-- Indexes for table `sitio_clientes`
--
ALTER TABLE `sitio_clientes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UN_NOMBRE` (`nombre`),
  ADD KEY `IX_FK_ADMINISTRADOR_CLIENTE` (`administrador_id`);

--
-- Indexes for table `sitio_compras`
--
ALTER TABLE `sitio_compras`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IX_FK_USUARIO_COMPRA` (`usuario_id`),
  ADD KEY `IX_FK_ESTADOCOMPRA_COMPRA` (`estado_compra_id`),
  ADD KEY `IX_FK_DIRECCION_COMPRA` (`direccion_id`),
  ADD KEY `IX_FK_SUCURSAL_COMPRA` (`sucursal_id`);

--
-- Indexes for table `sitio_comunas`
--
ALTER TABLE `sitio_comunas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UN_NOMBRE` (`nombre`),
  ADD KEY `IX_FK_REGION_COMUNA` (`region_id`);

--
-- Indexes for table `sitio_configuraciones`
--
ALTER TABLE `sitio_configuraciones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IX_FK_ADMINISTRADOR_CONFIGURACION` (`administrador_id`);

--
-- Indexes for table `sitio_detalle_cargas`
--
ALTER TABLE `sitio_detalle_cargas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IX_FK_CARGA_DETALLECARGA` (`carga_id`);

--
-- Indexes for table `sitio_detalle_compras`
--
ALTER TABLE `sitio_detalle_compras`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IX_FK_COMPRA_DETALLECOMPRA` (`compra_id`),
  ADD KEY `IX_FK_PRODUCTO_DETALLECOMPRA` (`producto_id`);

--
-- Indexes for table `sitio_direcciones`
--
ALTER TABLE `sitio_direcciones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IX_FK_USUARIO_DIRECCION` (`usuario_id`),
  ADD KEY `IX_FK_COMUNA_DIRECCION` (`comuna_id`),
  ADD KEY `IX_FK_TIPODIRECCION_DIRECCION` (`tipo_direccion_id`);

--
-- Indexes for table `sitio_emails`
--
ALTER TABLE `sitio_emails`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IX_FK_COMPRA_EMAIL` (`compra_id`);

--
-- Indexes for table `sitio_encargado_sucursales`
--
ALTER TABLE `sitio_encargado_sucursales`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IX_FK_SUCURSAL_ENCARGADOSUCURSAL` (`sucursal_id`);

--
-- Indexes for table `sitio_estado_compras`
--
ALTER TABLE `sitio_estado_compras`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UN_NOMBRE` (`nombre`);

--
-- Indexes for table `sitio_marcas`
--
ALTER TABLE `sitio_marcas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sitio_noticias`
--
ALTER TABLE `sitio_noticias`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IX_FK_ADMINISTRADOR_NOTICIA` (`administrador_id`);

--
-- Indexes for table `sitio_paginas`
--
ALTER TABLE `sitio_paginas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UN_NOMBRE` (`nombre`),
  ADD KEY `IX_FK_ADMINISTRADOR_PAGINA` (`administrador_id`),
  ADD KEY `IX_FK_CATEGORIAPAGINA_PAGINA` (`categoria_pagina_id`);

--
-- Indexes for table `sitio_perfiles`
--
ALTER TABLE `sitio_perfiles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UN_NOMBRE` (`nombre`);

--
-- Indexes for table `sitio_productos`
--
ALTER TABLE `sitio_productos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UN_SKU` (`sku`),
  ADD UNIQUE KEY `UN_ID_ERP` (`id_erp`),
  ADD KEY `IX_FK_CATEGORIA_PRODUCTO` (`categoria_id`),
  ADD KEY `IX_FK_MARCA_PRODUCTO` (`marca_id`),
  ADD KEY `IX_SKU` (`sku`),
  ADD KEY `IX_ARO` (`aro`),
  ADD KEY `IX_PERFIL` (`perfil`),
  ADD KEY `IX_ANCHO` (`ancho`),
  ADD KEY `IX_APERNADURAS` (`apernaduras`),
  ADD KEY `IX_APERNADURA1` (`apernadura1`),
  ADD KEY `IX_APERNADURA2` (`apernadura2`);

--
-- Indexes for table `sitio_regiones`
--
ALTER TABLE `sitio_regiones`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UN_NOMBRE` (`nombre`);

--
-- Indexes for table `sitio_servicios`
--
ALTER TABLE `sitio_servicios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nombre` (`nombre`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- Indexes for table `sitio_servicios_sucursales`
--
ALTER TABLE `sitio_servicios_sucursales`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IX_FK_SERVICIO_SERVICIOSUCURSAL` (`servicio_id`),
  ADD KEY `IX_FK_SUCURSAL_SERVICIOSUCURSAL` (`sucursal_id`);

--
-- Indexes for table `sitio_sucursales`
--
ALTER TABLE `sitio_sucursales`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UN_NOMBRE` (`nombre`),
  ADD UNIQUE KEY `UN_SLUG` (`slug`),
  ADD KEY `IX_FK_TIPOSUCURSAL_SUCURSAL` (`tipo_sucursal_id`),
  ADD KEY `IX_FK_ADMINISTRADOR_SUCURSAL` (`administrador_id`);

--
-- Indexes for table `sitio_tipo_direcciones`
--
ALTER TABLE `sitio_tipo_direcciones`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UN_NOMBRE` (`nombre`);

--
-- Indexes for table `sitio_tipo_sucursales`
--
ALTER TABLE `sitio_tipo_sucursales`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UN_NOMBRE` (`nombre`);

--
-- Indexes for table `sitio_tipo_usuarios`
--
ALTER TABLE `sitio_tipo_usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UN_NOMBRE` (`nombre`);

--
-- Indexes for table `sitio_usuarios`
--
ALTER TABLE `sitio_usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UN_EMAIL` (`email`),
  ADD KEY `IX_FK_TIPOUSUARIO_USUARIO` (`tipo_usuario_id`);

--
-- Indexes for table `sitio_vehiculos`
--
ALTER TABLE `sitio_vehiculos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UN_NOMBRE` (`nombre`),
  ADD KEY `IX_MARCA` (`marca`),
  ADD KEY `IX_MODELO` (`modelo`),
  ADD KEY `IX_VERSION` (`version`),
  ADD KEY `IX_APERNADURA` (`apernadura`),
  ADD KEY `IX_ARO` (`aro`),
  ADD KEY `IX_ANCHO` (`ancho`),
  ADD KEY `IX_PERFIL` (`perfil`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `sitio_administradores`
--
ALTER TABLE `sitio_administradores`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `sitio_banners`
--
ALTER TABLE `sitio_banners`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sitio_campo_paginas`
--
ALTER TABLE `sitio_campo_paginas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sitio_cargas`
--
ALTER TABLE `sitio_cargas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sitio_categorias`
--
ALTER TABLE `sitio_categorias`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `sitio_categoria_paginas`
--
ALTER TABLE `sitio_categoria_paginas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sitio_clientes`
--
ALTER TABLE `sitio_clientes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sitio_compras`
--
ALTER TABLE `sitio_compras`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sitio_comunas`
--
ALTER TABLE `sitio_comunas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sitio_configuraciones`
--
ALTER TABLE `sitio_configuraciones`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sitio_detalle_cargas`
--
ALTER TABLE `sitio_detalle_cargas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sitio_detalle_compras`
--
ALTER TABLE `sitio_detalle_compras`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sitio_direcciones`
--
ALTER TABLE `sitio_direcciones`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sitio_emails`
--
ALTER TABLE `sitio_emails`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sitio_encargado_sucursales`
--
ALTER TABLE `sitio_encargado_sucursales`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sitio_estado_compras`
--
ALTER TABLE `sitio_estado_compras`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sitio_marcas`
--
ALTER TABLE `sitio_marcas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=256;
--
-- AUTO_INCREMENT for table `sitio_noticias`
--
ALTER TABLE `sitio_noticias`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sitio_paginas`
--
ALTER TABLE `sitio_paginas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sitio_perfiles`
--
ALTER TABLE `sitio_perfiles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `sitio_productos`
--
ALTER TABLE `sitio_productos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=580;
--
-- AUTO_INCREMENT for table `sitio_regiones`
--
ALTER TABLE `sitio_regiones`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sitio_servicios`
--
ALTER TABLE `sitio_servicios`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sitio_servicios_sucursales`
--
ALTER TABLE `sitio_servicios_sucursales`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sitio_sucursales`
--
ALTER TABLE `sitio_sucursales`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sitio_tipo_direcciones`
--
ALTER TABLE `sitio_tipo_direcciones`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sitio_tipo_sucursales`
--
ALTER TABLE `sitio_tipo_sucursales`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sitio_tipo_usuarios`
--
ALTER TABLE `sitio_tipo_usuarios`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sitio_usuarios`
--
ALTER TABLE `sitio_usuarios`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sitio_vehiculos`
--
ALTER TABLE `sitio_vehiculos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `sitio_administradores`
--
ALTER TABLE `sitio_administradores`
  ADD CONSTRAINT `FK_PERFIL_ADMINISTRADOR` FOREIGN KEY (`perfil_id`) REFERENCES `sitio_perfiles` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `sitio_banners`
--
ALTER TABLE `sitio_banners`
  ADD CONSTRAINT `FK_ADMINISTRADOR_BANNER` FOREIGN KEY (`administrador_id`) REFERENCES `sitio_administradores` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `sitio_campo_paginas`
--
ALTER TABLE `sitio_campo_paginas`
  ADD CONSTRAINT `FK_PAGINA_CAMPOPAGINA` FOREIGN KEY (`pagina_id`) REFERENCES `sitio_paginas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `sitio_cargas`
--
ALTER TABLE `sitio_cargas`
  ADD CONSTRAINT `FK_ADMINISTRADOR_CARGA` FOREIGN KEY (`administrador_id`) REFERENCES `sitio_administradores` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `sitio_clientes`
--
ALTER TABLE `sitio_clientes`
  ADD CONSTRAINT `FK_ADMINISTRADOR_CLIENTE` FOREIGN KEY (`administrador_id`) REFERENCES `sitio_administradores` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `sitio_compras`
--
ALTER TABLE `sitio_compras`
  ADD CONSTRAINT `FK_DIRECCION_COMPRA` FOREIGN KEY (`direccion_id`) REFERENCES `sitio_direcciones` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_ESTADOCOMPRA_COMPRA` FOREIGN KEY (`estado_compra_id`) REFERENCES `sitio_estado_compras` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_SUCURSAL_COMPRA` FOREIGN KEY (`sucursal_id`) REFERENCES `sitio_sucursales` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_USUARIO_COMPRA` FOREIGN KEY (`usuario_id`) REFERENCES `sitio_usuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `sitio_comunas`
--
ALTER TABLE `sitio_comunas`
  ADD CONSTRAINT `FK_REGION_COMUNA` FOREIGN KEY (`region_id`) REFERENCES `sitio_regiones` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `sitio_configuraciones`
--
ALTER TABLE `sitio_configuraciones`
  ADD CONSTRAINT `FK_ADMINISTRADOR_CONFIGURACION` FOREIGN KEY (`administrador_id`) REFERENCES `sitio_administradores` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `sitio_detalle_cargas`
--
ALTER TABLE `sitio_detalle_cargas`
  ADD CONSTRAINT `FK_CARGA_DETALLECARGA` FOREIGN KEY (`carga_id`) REFERENCES `sitio_cargas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `sitio_detalle_compras`
--
ALTER TABLE `sitio_detalle_compras`
  ADD CONSTRAINT `FK_COMPRA_DETALLECOMPRA` FOREIGN KEY (`compra_id`) REFERENCES `sitio_compras` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_PRODUCTO_DETALLECOMPRA` FOREIGN KEY (`producto_id`) REFERENCES `sitio_productos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `sitio_direcciones`
--
ALTER TABLE `sitio_direcciones`
  ADD CONSTRAINT `FK_COMUNA_DIRECCION` FOREIGN KEY (`comuna_id`) REFERENCES `sitio_comunas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_TIPODIRECCION_DIRECCION` FOREIGN KEY (`tipo_direccion_id`) REFERENCES `sitio_tipo_direcciones` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_USUARIO_DIRECCION` FOREIGN KEY (`usuario_id`) REFERENCES `sitio_usuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `sitio_emails`
--
ALTER TABLE `sitio_emails`
  ADD CONSTRAINT `FK_COMPRA_EMAIL` FOREIGN KEY (`compra_id`) REFERENCES `sitio_compras` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `sitio_encargado_sucursales`
--
ALTER TABLE `sitio_encargado_sucursales`
  ADD CONSTRAINT `FK_SUCURSAL_ENCARGADOSUCURSAL` FOREIGN KEY (`sucursal_id`) REFERENCES `sitio_sucursales` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `sitio_noticias`
--
ALTER TABLE `sitio_noticias`
  ADD CONSTRAINT `FK_ADMINISTRADOR_NOTICIA` FOREIGN KEY (`administrador_id`) REFERENCES `sitio_administradores` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `sitio_paginas`
--
ALTER TABLE `sitio_paginas`
  ADD CONSTRAINT `FK_ADMINISTRADOR_PAGINA` FOREIGN KEY (`administrador_id`) REFERENCES `sitio_administradores` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_CATEGORIAPAGINA_PAGINA` FOREIGN KEY (`categoria_pagina_id`) REFERENCES `sitio_categoria_paginas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `sitio_productos`
--
ALTER TABLE `sitio_productos`
  ADD CONSTRAINT `FK_CATEGORIA_PRODUCTO` FOREIGN KEY (`categoria_id`) REFERENCES `sitio_categorias` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_MARCA_PRODUCTO` FOREIGN KEY (`marca_id`) REFERENCES `sitio_marcas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `sitio_servicios_sucursales`
--
ALTER TABLE `sitio_servicios_sucursales`
  ADD CONSTRAINT `FK_SERVICIO_SERVICIOSUCURSAL` FOREIGN KEY (`servicio_id`) REFERENCES `sitio_servicios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_SUCURSAL_SERVICIOSUCURSAL` FOREIGN KEY (`sucursal_id`) REFERENCES `sitio_sucursales` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `sitio_sucursales`
--
ALTER TABLE `sitio_sucursales`
  ADD CONSTRAINT `FK_ADMINISTRADOR_SUCURSAL` FOREIGN KEY (`administrador_id`) REFERENCES `sitio_administradores` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_TIPOSUCURSAL_SUCURSAL` FOREIGN KEY (`tipo_sucursal_id`) REFERENCES `sitio_tipo_sucursales` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `sitio_usuarios`
--
ALTER TABLE `sitio_usuarios`
  ADD CONSTRAINT `FK_TIPOUSUARIO_USUARIO` FOREIGN KEY (`tipo_usuario_id`) REFERENCES `sitio_tipo_usuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

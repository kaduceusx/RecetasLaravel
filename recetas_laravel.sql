-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 19-03-2021 a las 13:17:04
-- Versión del servidor: 10.4.18-MariaDB
-- Versión de PHP: 7.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `recetas_laravel`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria_recetas`
--

CREATE TABLE `categoria_recetas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `categoria_recetas`
--

INSERT INTO `categoria_recetas` (`id`, `nombre`, `created_at`, `updated_at`) VALUES
(1, 'Comida Mexicana', '2021-03-18 06:09:42', '2021-03-18 06:09:42'),
(2, 'Comida Italiana', '2021-03-18 06:09:42', '2021-03-18 06:09:42'),
(3, 'Comida Argentina', '2021-03-18 06:09:42', '2021-03-18 06:09:42'),
(4, 'Comida Española', '2021-03-18 06:09:42', '2021-03-18 06:09:42'),
(5, 'Postres', '2021-03-18 06:09:42', '2021-03-18 06:09:42'),
(6, 'Ensaladas', '2021-03-18 06:09:42', '2021-03-18 06:09:42'),
(7, 'Desayunos', '2021-03-18 06:09:42', '2021-03-18 06:09:42');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `likes_receta`
--

CREATE TABLE `likes_receta` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `receta_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `likes_receta`
--

INSERT INTO `likes_receta` (`id`, `user_id`, `receta_id`, `created_at`, `updated_at`) VALUES
(9, 2, 1, NULL, NULL),
(22, 1, 1, NULL, NULL),
(23, 1, 2, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2021_03_16_115453_create_recetas_table', 1),
(5, '2021_03_17_151034_create_perfils_table', 1),
(6, '2021_03_18_083405_create_likes_receta_pivot_table', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `perfils`
--

CREATE TABLE `perfils` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `biografia` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `imagen` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `perfils`
--

INSERT INTO `perfils` (`id`, `user_id`, `biografia`, `imagen`, `created_at`, `updated_at`) VALUES
(1, 1, '<div><br>Lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsa aliquid eligendi quis id dolorem! Ullam aliquam, commodi deleniti vero enim tenetur doloremque inventore cum quo odit repellat nostrum totam repellendus.<br><br>Lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsa aliquid eligendi quis id dolorem! Ullam aliquam, commodi deleniti vero enim tenetur doloremque inventore cum quo odit repellat nostrum totam repellendus.Lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsa aliquid eligendi quis id dolorem! Ullam aliquam, commodi deleniti vero enim tenetur doloremque inventore cum quo odit repellat nostrum totam repellendus.Lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsa aliquid eligendi quis id dolorem! Ullam aliquam, commodi deleniti vero enim tenetur doloremque inventore cum quo odit repellat nostrum totam repellendus.Lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsa aliquid eligendi quis id dolorem! Ullam aliquam, commodi deleniti vero enim tenetur doloremque inventore cum quo odit repellat nostrum totam repellendu</div>', 'upload-perfiles/Ff5pOqVoC6dTeMdLDjUAtgff8usQbc4F0nwrnGva.png', '2021-03-18 06:09:43', '2021-03-18 06:10:28'),
(2, 2, '<div>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Est facere illum facilis possimus, id amet reprehenderit reiciendis atque distinctio. Totam reiciendis, maxime voluptas veniam voluptates iusto nemo dicta. Fugiat, doloremque.Lorem ipsum dolor sit, amet consectetur adipisicing elit. Est facere illum facilis possimus, id amet reprehenderit reiciendis atque distinctio. Totam reiciendis, maxime voluptas veniam voluptates iusto nemo dicta. Fugiat, doloremque.</div>', 'upload-perfiles/uCJ92pDOWMbB55VlpBfhWtYSlGCxDdS9aaBnEmwV.jpg', '2021-03-18 06:09:43', '2021-03-18 06:54:06'),
(3, 3, NULL, NULL, '2021-03-18 14:41:26', '2021-03-18 14:41:26');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `recetas`
--

CREATE TABLE `recetas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `titulo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ingredientes` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `preparacion` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `imagen` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `categoria_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `recetas`
--

INSERT INTO `recetas` (`id`, `titulo`, `ingredientes`, `preparacion`, `imagen`, `user_id`, `categoria_id`, `created_at`, `updated_at`) VALUES
(1, 'Pizza Carbonara', '<ul><li>Harina</li><li>Agua</li><li>Sal</li><li>Huevo</li></ul>', '<ol><li>Primero se mezcla el agua y la harina&nbsp;</li><li>Amasas&nbsp;</li></ol>', 'upload-recetas/dchvCArJBGmelVz0Ody1NRHma7aPHYpgaYqVkIBa.jpg', 1, 2, '2021-03-18 06:14:46', '2021-03-18 10:30:42'),
(2, 'Salmón', '<ul><li>Pescado&nbsp;</li></ul>', '<ol><li>Poner en la planca&nbsp;</li></ol>', 'upload-recetas/juqYjpgy7VWbSKxHxtBqo61aJ2Nl5JCfWjZsNLYo.jpg', 1, 4, '2021-03-18 06:19:49', '2021-03-18 10:30:58'),
(3, 'Tortilla De Patatas', '<ul><li>Patatas&nbsp;</li><li>Huevo&nbsp;</li><li>Aceite de oliva&nbsp;</li></ul>', '<ol><li>Cortar patatas&nbsp;</li><li>Dorar en aceite.&nbsp;</li></ol>', 'upload-recetas/vCCgAkrG8VtHoZpLaPtzp1afUp4pu3YVpfxMYOhw.jpg', 1, 4, '2021-03-18 06:21:40', '2021-03-18 10:31:28'),
(4, 'Corte Argentino', '<ul><li>Carne&nbsp;</li></ul>', '<ol><li>Cortar carne en trozos.</li><li>Poner la carne en la brasa.</li></ol>', 'upload-recetas/aC1YnzTY8L6Qgb50ttIppqWrvJH7FH4u2cRZPXbI.jpg', 1, 3, '2021-03-18 06:22:51', '2021-03-18 10:37:38'),
(5, 'Crepes', '<ul><li>Harina</li><li>Azúcar</li></ul>', '<ol><li>Mezclar harina con ...</li></ol>', 'upload-recetas/2sOViCJnq7SBhZwZ4eLOBA2zEJts78YPSW7IOjAd.jpg', 1, 5, '2021-03-18 06:23:57', '2021-03-18 06:23:57'),
(6, 'Zumo De Naranja', '<ul><li>Naranajas</li></ul>', '<ol><li>Exprimir naranjas.</li></ol>', 'upload-recetas/mv2uM0XICDVuIjsXHa1rQ6TNoH0oNJP0hkjs2q1r.jpg', 1, 7, '2021-03-18 06:24:43', '2021-03-18 06:24:43'),
(7, 'Ensalada Mixta', '<ul><li>Lechuga.&nbsp;</li><li>Tomate.&nbsp;</li><li>Atún.&nbsp;</li></ul>', '<ol><li>Cortar lechuga</li><li>Cortar tomates.</li></ol>', 'upload-recetas/mpvE5XFHYynq6acpFh3XhZ38xWpjfhlmdUQoVtxc.jpg', 1, 6, '2021-03-18 06:38:37', '2021-03-18 10:37:05'),
(8, 'Pizza Vegetal', '<ul><li>Harina.&nbsp;</li><li>Verduras&nbsp;</li></ul>', '<div>Amasar la harina.<br>Después tal cosa.</div>', 'upload-recetas/ww6JARb0QIyLiRvrLXblgwmSHjlm6Zzu2SdE6a9E.jpg', 1, 2, '2021-03-18 06:39:39', '2021-03-18 10:36:50'),
(9, 'Hamburguesas Picantes', '<ul><li>Carne.</li><li>Pan</li><li>Chile picante</li></ul>', '<ol><li>Colocar la hamburguesa en la plancha</li><li>Agregar mucho chile.</li></ol>', 'upload-recetas/o1Szwc3xkoAeuf9UTiDR9QPm0jty2tT5z0GHS2C0.jpg', 2, 1, '2021-03-18 06:53:20', '2021-03-18 06:53:20');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `url`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Luis', 'luis@luis.com', NULL, '$2y$10$nBaEmMS1dsvMydddpXWbE.ESyDXtEalEFZvm1gjsXW6/hWhDKv7g6', 'http://luis.com', NULL, '2021-03-18 06:09:43', '2021-03-18 06:10:28'),
(2, 'fernando', 'fernando@fernando.com', NULL, '$2y$10$DEgWocz38k4m.3.YKUz83udehxG5qfUv6jnIjSJNL7MViZt/q.lgi', 'http://fernando.com', NULL, '2021-03-18 06:09:43', '2021-03-18 06:09:43'),
(3, 'Sandra', 'sandra@sandra.com', NULL, '$2y$10$GyrPay9hdM7lUNLY8YMOquuTFuQxOtQPU/n5NqLYXeWImFt2Da4MK', 'Http://sandra.com', NULL, '2021-03-18 14:41:26', '2021-03-18 14:41:26');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categoria_recetas`
--
ALTER TABLE `categoria_recetas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indices de la tabla `likes_receta`
--
ALTER TABLE `likes_receta`
  ADD PRIMARY KEY (`id`),
  ADD KEY `likes_receta_user_id_foreign` (`user_id`),
  ADD KEY `likes_receta_receta_id_foreign` (`receta_id`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indices de la tabla `perfils`
--
ALTER TABLE `perfils`
  ADD PRIMARY KEY (`id`),
  ADD KEY `perfils_user_id_foreign` (`user_id`);

--
-- Indices de la tabla `recetas`
--
ALTER TABLE `recetas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `recetas_user_id_foreign` (`user_id`),
  ADD KEY `recetas_categoria_id_foreign` (`categoria_id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categoria_recetas`
--
ALTER TABLE `categoria_recetas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `likes_receta`
--
ALTER TABLE `likes_receta`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `perfils`
--
ALTER TABLE `perfils`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `recetas`
--
ALTER TABLE `recetas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `likes_receta`
--
ALTER TABLE `likes_receta`
  ADD CONSTRAINT `likes_receta_receta_id_foreign` FOREIGN KEY (`receta_id`) REFERENCES `recetas` (`id`),
  ADD CONSTRAINT `likes_receta_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `perfils`
--
ALTER TABLE `perfils`
  ADD CONSTRAINT `perfils_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `recetas`
--
ALTER TABLE `recetas`
  ADD CONSTRAINT `recetas_categoria_id_foreign` FOREIGN KEY (`categoria_id`) REFERENCES `categoria_recetas` (`id`),
  ADD CONSTRAINT `recetas_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

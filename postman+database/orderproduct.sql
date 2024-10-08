-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 08, 2024 at 01:28 PM
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
-- Database: `orderproduct`
--

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(21, '2014_10_12_000000_create_users_table', 1),
(22, '2014_10_12_100000_create_password_resets_table', 1),
(23, '2019_08_19_000000_create_failed_jobs_table', 1),
(24, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(25, '2024_10_06_093202_create_products_table', 1),
(26, '2024_10_06_093242_create_orders_table', 1),
(27, '2024_10_06_181501_create_order_products_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `uuid`, `user_id`, `created_at`, `updated_at`) VALUES
(8, '57469449-3e7c-4f44-a116-f46654946ebc', 3, '2024-10-07 15:15:37', '2024-10-07 15:15:37'),
(9, 'dbd9e166-8a26-416d-a2ee-6550b780be9b', 3, '2024-10-07 15:44:03', '2024-10-07 15:44:03'),
(10, 'da1f7bed-cf18-45fe-ad7e-78d1c335a3c8', 3, '2024-10-07 15:50:42', '2024-10-07 15:50:42'),
(11, '69d5350e-8042-4e07-ad35-9738dac83a99', 3, '2024-10-07 16:35:59', '2024-10-07 16:35:59'),
(12, 'e9aa4466-51d6-4900-bda6-e97a0b56c76f', 3, '2024-10-07 16:39:28', '2024-10-07 16:39:28'),
(13, 'c9e23cfe-77b0-4f09-9741-5d244d9c78d2', 3, '2024-10-07 16:40:38', '2024-10-07 16:40:38'),
(14, 'c3d3ebb4-33fc-42db-b1f8-49bdbe6f6123', 3, '2024-10-07 16:54:03', '2024-10-07 16:54:03'),
(15, 'f2203087-ef77-4538-8652-1175ea032b18', 3, '2024-10-07 16:58:59', '2024-10-07 16:58:59');

-- --------------------------------------------------------

--
-- Table structure for table `order_products`
--

CREATE TABLE `order_products` (
  `id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `order_id` bigint UNSIGNED NOT NULL,
  `quantity` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_products`
--

INSERT INTO `order_products` (`id`, `product_id`, `order_id`, `quantity`, `created_at`, `updated_at`) VALUES
(1, 1, 11, 4, '2024-10-07 16:35:59', '2024-10-07 16:35:59'),
(2, 1, 13, 4, '2024-10-07 16:40:38', '2024-10-07 16:40:38'),
(3, 1, 14, 4, '2024-10-07 16:54:03', '2024-10-07 16:54:03'),
(4, 1, 15, 4, '2024-10-07 16:58:59', '2024-10-07 16:58:59'),
(5, 2, 15, 2, '2024-10-07 16:58:59', '2024-10-07 16:58:59');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 3, 'token-name', 'ef9e02d7a6643ce0f98ef554ee91790452464fe4b3db063b8ae74aeb3b16ef42', '[\"*\"]', NULL, NULL, '2024-10-07 11:05:41', '2024-10-07 11:05:41'),
(2, 'App\\Models\\User', 3, 'token-name', 'a800282e739b03a25a9bcb835105883f52757499fa0707d2089f45f410b5a74b', '[\"*\"]', NULL, NULL, '2024-10-07 11:08:52', '2024-10-07 11:08:52'),
(3, 'App\\Models\\User', 3, 'token-name', 'f670c3b7799b44a1f2b33527ed0c09fcb3e70683a1e8588ac2a15492b00beb1b', '[\"*\"]', NULL, NULL, '2024-10-07 13:08:29', '2024-10-07 13:08:29'),
(4, 'App\\Models\\User', 3, 'token-name', 'bcb8500afadccc0254e3435669cb6e021a3c9cbb94ca7903c7a1104ef0a94a93', '[\"*\"]', '2024-10-07 16:58:59', NULL, '2024-10-07 14:42:55', '2024-10-07 16:58:59'),
(5, 'App\\Models\\User', 3, 'token-name', '643ebc02d2302d692877b06625aa8e11ebf2cc73f0c4dde43def852cd1a5d5b0', '[\"*\"]', '2024-10-08 09:50:21', NULL, '2024-10-08 09:01:30', '2024-10-08 09:50:21');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `uuid`, `name`, `description`, `price`, `created_at`, `updated_at`) VALUES
(1, '9f2a9e45-12c6-4057-a625-dc3acd688fa2', 'tel', 'etc.....', 656780.00, '2024-10-22 15:18:12', '2024-10-24 15:18:12'),
(2, '3d321d2a-9893-4ff2-a1f5-55937e9f0a55', 'phone', 'tttt', 123000.00, NULL, NULL),
(4, '3034a118-d4de-4661-8e9b-553e53a23b5e', 'qui', 'Ut veritatis ratione dolor officia.', 66.83, '2024-10-08 10:21:10', '2024-10-08 10:21:10'),
(5, 'e5d90f3b-216f-4752-9e88-0f4bfb1e72a9', 'dolores', 'Architecto tempora eius consectetur facere eos qui.', 61.17, '2024-10-08 10:21:10', '2024-10-08 10:21:10'),
(6, '07528a13-b5de-4bf2-8546-53e25820f6c9', 'sequi', 'Rerum ex quod magni.', 99.91, '2024-10-08 10:21:10', '2024-10-08 10:21:10'),
(7, 'fd1f9043-e14f-47c8-bf4f-93ff8264a4b3', 'veniam', 'Magnam non saepe quis expedita.', 59.09, '2024-10-08 10:21:10', '2024-10-08 10:21:10'),
(8, 'a173e033-74ed-4d2f-82f4-ff05653ca71c', 'deleniti', 'Nobis ipsum quia nihil doloribus.', 21.12, '2024-10-08 10:21:10', '2024-10-08 10:21:10'),
(9, 'a8ef05ba-64f9-4b9b-bdfc-4bd8b2bdaff4', 'ipsa', 'Ut consequuntur ullam commodi ducimus repellat.', 64.71, '2024-10-08 10:21:10', '2024-10-08 10:21:10'),
(10, 'c7d96f1d-5bc6-4ef2-b32d-d3f4d909784c', 'repudiandae', 'Velit sunt aperiam ut autem quae.', 89.58, '2024-10-08 10:21:10', '2024-10-08 10:21:10'),
(11, '37d92a0e-bd5c-4cc1-b615-908534f4c7e3', 'modi', 'Quia sint rerum harum odit sed sed et laboriosam.', 23.35, '2024-10-08 10:21:10', '2024-10-08 10:21:10'),
(12, '27285de7-fa1d-44c4-baa5-18b8fd6bc708', 'ab', 'Debitis ut ipsa placeat aspernatur occaecati porro libero.', 55.10, '2024-10-08 10:21:10', '2024-10-08 10:21:10'),
(13, '538d0445-c379-4750-b069-17a320480b6b', 'facere', 'Aut nemo id saepe reprehenderit dignissimos.', 13.63, '2024-10-08 10:21:10', '2024-10-08 10:21:10'),
(14, '5a9f5a8a-b9ab-41a6-8b6b-2de2d2a7e3b9', 'adipisci', 'Dolor odio sed fugit itaque molestiae.', 31.77, '2024-10-08 10:21:10', '2024-10-08 10:21:10'),
(15, '8212810a-f5ff-422f-b875-2a50c278da0d', 'laborum', 'Vero id magni culpa quia.', 4.79, '2024-10-08 10:21:10', '2024-10-08 10:21:10'),
(16, 'b982c8ab-a939-44ac-a1a8-76eb65924979', 'officiis', 'Incidunt dolor numquam ratione qui et ut.', 83.07, '2024-10-08 10:21:10', '2024-10-08 10:21:10'),
(17, 'cb6be366-0b0e-4673-9f27-994b86000500', 'ut', 'Earum quo dignissimos explicabo qui harum facilis.', 29.41, '2024-10-08 10:21:10', '2024-10-08 10:21:10'),
(18, 'da80435c-c121-4de8-a545-148cde5c8b75', 'ipsa', 'Qui sed qui et accusamus et et.', 15.40, '2024-10-08 10:21:10', '2024-10-08 10:21:10'),
(19, '8f3fd54f-bde8-4d33-8821-8da41a4792ae', 'et', 'Enim autem vel ipsa vel error suscipit ut saepe.', 70.69, '2024-10-08 10:21:10', '2024-10-08 10:21:10'),
(20, 'b428fd7f-190d-4366-997b-0b794b41018a', 'quo', 'Quasi non temporibus quo et in dolorem sed.', 63.11, '2024-10-08 10:21:10', '2024-10-08 10:21:10'),
(21, '66343009-401e-454b-951f-818102a7c722', 'amet', 'Molestias culpa laboriosam earum.', 96.69, '2024-10-08 10:21:10', '2024-10-08 10:21:10'),
(22, '179321ac-9618-4ce2-8e65-35636254085f', 'recusandae', 'Animi pariatur adipisci iste nobis minus praesentium.', 44.13, '2024-10-08 10:21:10', '2024-10-08 10:21:10'),
(23, '6b1dd68e-802f-4b74-9b2e-958ed3b6c10a', 'corporis', 'Porro mollitia ut est similique.', 83.65, '2024-10-08 10:21:10', '2024-10-08 10:21:10'),
(24, 'a650e64e-6e01-4e32-a683-f8ab201bec53', 'voluptatem', 'Dolore dolorem in ipsa reiciendis dolorum laborum mollitia.', 3.57, '2024-10-08 10:21:10', '2024-10-08 10:21:10'),
(25, '6f7f2fdb-228e-477e-abf4-e719cdc1fb49', 'accusamus', 'Error voluptatem asperiores sint eos.', 17.56, '2024-10-08 10:21:10', '2024-10-08 10:21:10'),
(26, '918be150-70a2-4b87-9034-4b88a064636a', 'quidem', 'Qui consequatur rerum sed reprehenderit corrupti.', 91.99, '2024-10-08 10:21:10', '2024-10-08 10:21:10'),
(27, '26cfc4af-c59d-489b-9e2b-046ac1167b20', 'veritatis', 'Quam voluptas ipsum odit quis qui hic.', 84.90, '2024-10-08 10:21:10', '2024-10-08 10:21:10'),
(28, '29439ded-f9c2-4c06-a09a-899b2ae28137', 'consequatur', 'Corrupti voluptate aut in iusto qui.', 98.04, '2024-10-08 10:21:10', '2024-10-08 10:21:10'),
(29, '16021a49-5428-444e-ad6e-e32a18114a6b', 'fuga', 'Omnis sapiente adipisci quas est accusantium.', 77.08, '2024-10-08 10:21:10', '2024-10-08 10:21:10'),
(30, '20d63f5b-9c88-4118-9365-b28188fc513f', 'quas', 'Eaque ratione porro quam et dolorem expedita nihil.', 2.98, '2024-10-08 10:21:10', '2024-10-08 10:21:10'),
(31, '331173b4-afb0-4048-81db-02d6dd2d3442', 'dolore', 'Error perferendis laudantium necessitatibus quasi occaecati inventore.', 79.13, '2024-10-08 10:21:10', '2024-10-08 10:21:10'),
(32, 'b0f61e79-39a8-4f2b-bccc-1d594fe72563', 'mollitia', 'Et voluptatum aspernatur vel libero corporis animi repudiandae dolor.', 97.85, '2024-10-08 10:21:10', '2024-10-08 10:21:10'),
(33, '2aa06cdc-e1ff-4684-8037-ae2d5c714892', 'aperiam', 'Aut et voluptas quis ipsum dicta voluptas voluptatem.', 89.05, '2024-10-08 10:21:10', '2024-10-08 10:21:10'),
(34, '3525fb64-fed4-4385-af60-5c01f6578c5a', 'nostrum', 'Earum dicta voluptatem beatae ab vel.', 56.67, '2024-10-08 10:21:10', '2024-10-08 10:21:10'),
(35, 'd08655fa-3de1-4b52-b046-b5733e265cef', 'distinctio', 'Quibusdam similique quas rerum in sit sed aut distinctio.', 97.10, '2024-10-08 10:21:10', '2024-10-08 10:21:10'),
(36, 'b3780888-1465-441b-b912-a09a056aeebd', 'qui', 'Ut quasi non qui itaque nihil eum dicta.', 84.93, '2024-10-08 10:21:10', '2024-10-08 10:21:10'),
(37, '7e6d43c7-bc99-45df-a98b-858648c04ef9', 'est', 'Velit qui accusamus consequatur quo in laborum aut.', 31.70, '2024-10-08 10:21:10', '2024-10-08 10:21:10'),
(38, '9568d14f-e019-440f-8797-9e0f51d9c0a5', 'placeat', 'Dolores est a eius nostrum quo.', 95.15, '2024-10-08 10:21:10', '2024-10-08 10:21:10'),
(39, '7e924540-bceb-4074-b2f2-3f58dfce58f6', 'tempore', 'Doloribus omnis quis nostrum et id quisquam.', 7.10, '2024-10-08 10:21:10', '2024-10-08 10:21:10'),
(40, '313a2e10-4660-4c5c-a143-ee34ac02c64e', 'nemo', 'Placeat vel recusandae quae suscipit eveniet commodi.', 48.12, '2024-10-08 10:21:10', '2024-10-08 10:21:10'),
(41, '7a48a58e-fde3-4151-8423-d4d1f9994a14', 'voluptas', 'Iure veritatis voluptatem natus aspernatur aliquam ut.', 31.11, '2024-10-08 10:21:10', '2024-10-08 10:21:10'),
(42, '9225df7c-df3d-450d-b78c-fa1ed553dabd', 'omnis', 'Dolor sed magnam voluptatem quod velit molestiae.', 48.73, '2024-10-08 10:21:10', '2024-10-08 10:21:10'),
(43, 'ae20f5c4-6763-40a2-9761-9d7e1a673d14', 'illum', 'Commodi eum facilis nobis ipsam aut.', 65.25, '2024-10-08 10:21:10', '2024-10-08 10:21:10'),
(44, '213b4a71-cfce-4061-9695-6dfec5a64ff4', 'expedita', 'Molestias magni a aspernatur pariatur.', 1.76, '2024-10-08 10:21:10', '2024-10-08 10:21:10'),
(45, '1f841e76-8d64-4c63-aa15-36a30689af2f', 'atque', 'Iste et officiis dolores eum similique ea.', 73.67, '2024-10-08 10:21:10', '2024-10-08 10:21:10'),
(46, '2a2110f8-e578-4be7-a777-a3765d905534', 'ipsa', 'Consectetur beatae atque nihil ipsum accusantium vero libero.', 95.71, '2024-10-08 10:21:10', '2024-10-08 10:21:10'),
(47, '6b0d007d-4833-4ada-a465-6b3af2b9544b', 'delectus', 'Qui et dolorem quod quos consectetur omnis consequatur omnis.', 88.64, '2024-10-08 10:21:10', '2024-10-08 10:21:10'),
(48, 'a61d34ae-a52b-4cab-814c-68dbccf022b7', 'aut', 'Iste corporis harum sequi.', 9.83, '2024-10-08 10:21:10', '2024-10-08 10:21:10'),
(49, '35d3e664-6acc-4b4b-b998-f5f4db1a0fc8', 'laboriosam', 'Voluptatem cumque et nihil facilis.', 71.42, '2024-10-08 10:21:10', '2024-10-08 10:21:10'),
(50, '9bc0f2a0-4db1-47be-ac66-c0c515caa28c', 'nulla', 'Dolore est provident in nemo.', 53.71, '2024-10-08 10:21:10', '2024-10-08 10:21:10'),
(51, '0de822b3-feda-44c6-82e9-f08bc47c7cd3', 'et', 'Architecto et quis voluptatem saepe quo nobis qui.', 33.62, '2024-10-08 10:21:10', '2024-10-08 10:21:10'),
(52, '92da26d1-def9-42fe-b91e-48513cb366cb', 'dolores', 'Cum eos quod delectus labore omnis voluptates.', 67.02, '2024-10-08 10:21:10', '2024-10-08 10:21:10'),
(53, 'd8ddee02-a021-4400-b4b2-1bf2f86cea00', 'beatae', 'Voluptas iusto voluptas voluptatem consequatur.', 99.31, '2024-10-08 10:21:10', '2024-10-08 10:21:10'),
(54, '9c5ab24c-4607-47c8-8544-f9f5dee3a306', 'soluta', 'Non alias expedita ducimus ex nesciunt modi voluptatem.', 52.10, '2024-10-08 10:21:10', '2024-10-08 10:21:10'),
(55, '2d679ad8-65df-4518-a62f-482292bb4e86', 'neque', 'Quia voluptatibus officia numquam consequatur est voluptatem.', 59.41, '2024-10-08 10:21:10', '2024-10-08 10:21:10'),
(56, '49770579-7828-4fb9-9650-6b500066124b', 'dolorum', 'Quas voluptatum dicta sint est.', 11.69, '2024-10-08 10:21:10', '2024-10-08 10:21:10'),
(57, 'e38a4fb4-4c99-4815-ab5b-5c73c085301d', 'libero', 'Commodi a et nesciunt magnam.', 22.52, '2024-10-08 10:21:10', '2024-10-08 10:21:10'),
(58, '9cff5350-b43e-41ff-8da8-577b6ae711c2', 'harum', 'Ut voluptatum et delectus vel accusamus adipisci possimus.', 66.82, '2024-10-08 10:21:10', '2024-10-08 10:21:10'),
(59, 'ef8e8d4b-f772-4a01-bfc3-25378fcebf77', 'necessitatibus', 'Ut non dolor quidem dolorem odio.', 7.32, '2024-10-08 10:21:10', '2024-10-08 10:21:10'),
(60, 'f1edf359-6ae2-4db5-bb89-d5badd11db8d', 'cum', 'Et maiores illum mollitia voluptatem ipsam.', 4.37, '2024-10-08 10:21:10', '2024-10-08 10:21:10'),
(61, '1a7c2841-d209-4646-a668-cae04e3f28c3', 'minus', 'Accusantium dolorum laudantium odit aliquid.', 42.96, '2024-10-08 10:21:10', '2024-10-08 10:21:10'),
(62, '6a525a0d-3a83-4cb5-8828-ea7d0cb3798d', 'excepturi', 'Qui at nulla sed.', 87.66, '2024-10-08 10:21:10', '2024-10-08 10:21:10'),
(63, '60ee6522-2fd9-4a25-bb1e-b553f3468953', 'enim', 'Numquam earum non quo deleniti ut ut.', 55.02, '2024-10-08 10:21:10', '2024-10-08 10:21:10'),
(64, '0d796cb7-81cd-45ef-9535-aa7686d6ec38', 'sint', 'Nesciunt quo mollitia id libero totam molestiae iste nihil.', 59.40, '2024-10-08 10:21:10', '2024-10-08 10:21:10'),
(65, '606d6ad8-30d2-4240-b74e-9d99c0a3e79d', 'omnis', 'Rem ab dicta magni commodi et eum voluptatem.', 53.74, '2024-10-08 10:21:10', '2024-10-08 10:21:10'),
(66, '2bc001dc-5224-4b75-8a1c-85563d077224', 'aut', 'Cupiditate cupiditate illo sit et nulla.', 72.61, '2024-10-08 10:21:10', '2024-10-08 10:21:10'),
(67, '8b9f3981-5a5d-4e96-8d1f-762bebb94754', 'reprehenderit', 'Molestiae rerum vel eligendi eveniet.', 5.32, '2024-10-08 10:21:10', '2024-10-08 10:21:10'),
(68, '74f51da7-40e1-47b1-9358-efe67e2611ea', 'totam', 'Doloremque dolor optio non dolor provident dolorem enim.', 88.04, '2024-10-08 10:21:10', '2024-10-08 10:21:10'),
(69, '2b6de651-3656-4fee-b88d-baaf44991fff', 'culpa', 'Nam est quis nemo dicta hic.', 11.08, '2024-10-08 10:21:10', '2024-10-08 10:21:10'),
(70, '5c027948-565a-4c40-a824-0a141ae173da', 'dolore', 'Facilis cum repudiandae rem dolor.', 17.96, '2024-10-08 10:21:10', '2024-10-08 10:21:10'),
(71, '3031952f-26d6-4085-ac90-30cb0e2d5233', 'eligendi', 'Cumque sed sint qui voluptas nulla.', 62.06, '2024-10-08 10:21:10', '2024-10-08 10:21:10'),
(72, 'd43727dd-c4de-4510-9e29-6fd132817a6c', 'qui', 'Et nulla distinctio officia soluta animi soluta sint.', 16.70, '2024-10-08 10:21:10', '2024-10-08 10:21:10'),
(73, 'a387eaf4-f2d0-44f3-92e3-504c29760cc0', 'architecto', 'Sequi doloribus iusto sequi rerum hic veritatis recusandae tempora.', 61.54, '2024-10-08 10:21:10', '2024-10-08 10:21:10'),
(74, '9b0030af-1801-4a3f-9b4e-a84b9b4905fd', 'voluptatem', 'Earum pariatur ut cupiditate aliquid debitis et accusantium.', 78.50, '2024-10-08 10:21:10', '2024-10-08 10:21:10'),
(75, 'c600c919-dd0d-4848-b37c-46ddd873e15c', 'et', 'Velit et quae quia iure rerum.', 55.13, '2024-10-08 10:21:10', '2024-10-08 10:21:10'),
(76, '6d7d5744-07a4-42d5-8bf3-b128eb41bd0c', 'ullam', 'Doloremque ut tempora ut sed animi magni.', 67.20, '2024-10-08 10:21:10', '2024-10-08 10:21:10'),
(77, '2f06ee01-fa48-440b-af15-606b4d5800bf', 'mollitia', 'Ipsa quia quas non perferendis quis.', 40.66, '2024-10-08 10:21:10', '2024-10-08 10:21:10'),
(78, 'e89c492c-75c1-475b-8654-5f7e0fcb8a2e', 'aut', 'Officiis iste ut et quis dolorum.', 76.35, '2024-10-08 10:21:10', '2024-10-08 10:21:10'),
(79, '90303438-74a8-4c37-bff3-04e0a9369159', 'sed', 'Dolores nobis modi qui sit.', 52.69, '2024-10-08 10:21:10', '2024-10-08 10:21:10'),
(80, '034dbfbe-35e3-4081-94cb-0abc4886a4fc', 'et', 'Praesentium numquam voluptatum amet dolorem veritatis sed est.', 81.06, '2024-10-08 10:21:10', '2024-10-08 10:21:10'),
(81, 'f5f89130-6662-43fd-b509-b1fcf93a18e0', 'eum', 'Consequatur nihil aut nihil voluptatem.', 10.27, '2024-10-08 10:21:10', '2024-10-08 10:21:10'),
(82, '184c565c-a17c-43bd-8770-9bb73fde0c7a', 'dignissimos', 'Impedit unde iusto assumenda praesentium neque a.', 18.32, '2024-10-08 10:21:10', '2024-10-08 10:21:10'),
(83, '7976037e-4995-4a3e-8452-43b120e2356f', 'rerum', 'Soluta dolorem ut aspernatur corrupti sit ullam iure.', 61.60, '2024-10-08 10:21:10', '2024-10-08 10:21:10'),
(84, '325c2542-9c7e-491e-b3e6-90c1ff46de2f', 'doloremque', 'Dolorum non odit ut quam.', 77.18, '2024-10-08 10:21:10', '2024-10-08 10:21:10'),
(85, '65c4d473-304f-41c5-9943-9a504fd248ff', 'vitae', 'Ullam in quis eligendi soluta.', 72.29, '2024-10-08 10:21:10', '2024-10-08 10:21:10'),
(86, '60c375d8-ad20-4d27-a5da-a25447093628', 'consequuntur', 'Qui quo totam quas maxime et quisquam.', 11.11, '2024-10-08 10:21:10', '2024-10-08 10:21:10'),
(87, '1a57b03e-4488-40dc-acfe-d699e1203ca3', 'doloribus', 'Quidem enim dolorem soluta et esse quo et.', 20.55, '2024-10-08 10:21:10', '2024-10-08 10:21:10'),
(88, '42fb80a7-0e85-4326-bf8d-2174b955b116', 'maiores', 'Beatae perferendis veritatis ea et.', 10.19, '2024-10-08 10:21:10', '2024-10-08 10:21:10'),
(89, '42aaffdf-2923-483f-992d-bbd818a1feb7', 'quos', 'Voluptatem dolore est numquam blanditiis natus occaecati magni laborum.', 66.25, '2024-10-08 10:21:10', '2024-10-08 10:21:10'),
(90, '70b1f53f-8b7f-4283-bc2f-e7d72fc13945', 'animi', 'Nostrum atque perspiciatis assumenda ipsum reprehenderit.', 54.07, '2024-10-08 10:21:10', '2024-10-08 10:21:10'),
(91, 'a4791f81-2f06-46e4-bb55-fc5e519ea98b', 'rerum', 'Aliquid minus consequatur sed.', 53.17, '2024-10-08 10:21:10', '2024-10-08 10:21:10'),
(92, '050212ed-cf25-4a99-a4ad-52f7807921df', 'pariatur', 'Dolores ut tempora est consequuntur non velit quae.', 91.67, '2024-10-08 10:21:10', '2024-10-08 10:21:10'),
(93, '00968e2f-6751-4991-a009-b90e5ae5bf67', 'quibusdam', 'Sed aliquam ducimus error quo.', 97.40, '2024-10-08 10:21:10', '2024-10-08 10:21:10'),
(94, '82199ed6-ba88-4f69-bc6c-5962fc6d555b', 'qui', 'Nam maxime aspernatur molestiae atque velit corporis.', 70.28, '2024-10-08 10:21:10', '2024-10-08 10:21:10'),
(95, '5f1186e4-2042-435e-a150-38417bce6ece', 'nam', 'Ex deleniti beatae quidem vero totam.', 75.47, '2024-10-08 10:21:10', '2024-10-08 10:21:10'),
(96, '1951bfe7-334f-486e-aac9-e316bd5351ad', 'similique', 'Est eius perspiciatis dolorem.', 46.68, '2024-10-08 10:21:10', '2024-10-08 10:21:10'),
(97, '4ee8aa10-fe97-4d7f-9045-61eef9406541', 'sunt', 'Modi labore non et saepe.', 59.39, '2024-10-08 10:21:10', '2024-10-08 10:21:10'),
(98, '539b77c5-fc98-49ea-876f-21f899795672', 'quaerat', 'Voluptatem aspernatur tenetur unde at nesciunt occaecati explicabo qui.', 96.69, '2024-10-08 10:21:10', '2024-10-08 10:21:10'),
(99, '738895d9-37d3-41e1-8c2b-383e9f68129b', 'perspiciatis', 'Inventore consectetur reiciendis expedita impedit voluptatum praesentium.', 48.83, '2024-10-08 10:21:10', '2024-10-08 10:21:10'),
(100, 'd8b15131-9995-4313-bbbc-04ef93b4d33f', 'est', 'Est optio natus ut.', 90.53, '2024-10-08 10:21:10', '2024-10-08 10:21:10'),
(101, '136aac20-9b6f-40dd-8afc-d2bc6d56eef9', 'aut', 'Corrupti corporis similique et repellendus omnis fugit id.', 24.13, '2024-10-08 10:21:10', '2024-10-08 10:21:10'),
(102, 'a46eed2e-6927-4980-9efb-104ce6b43da0', 'aut', 'Voluptatibus cupiditate quo ut omnis at.', 85.14, '2024-10-08 10:21:10', '2024-10-08 10:21:10'),
(103, 'cec9ca6e-90f1-4a5f-8d75-334e6e75a318', 'rerum', 'Est dolorem ut ratione adipisci beatae earum.', 59.44, '2024-10-08 10:21:10', '2024-10-08 10:21:10');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `uuid`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, '287034e1-7128-4ed7-afd9-10a9277925c5', 'nnn', 'tgh@hotmail.com', NULL, '$2y$10$AiIqI3hUQ3PLiSoqVtZ0ae.SYbgy3DgPLpHa8T/SklqkwiG253gB2', NULL, '2024-10-07 08:49:45', '2024-10-07 08:49:45'),
(2, 'ccd38c7c-2406-46ea-8073-df3cab39c32c', 'najwa', 'tgrrh@hotmail.com', NULL, '$2y$10$x2KjNH6gYcrJHI/Zd5CCpOLr946H/0v0t8Yn/9EaM5z2KzIAYPhzK', NULL, '2024-10-07 08:59:31', '2024-10-07 08:59:31'),
(3, '2586c047-6544-470f-92f0-8150c331130d', 'najwamoad', 'najwa@hotmail.com', NULL, '$2y$10$dMbaAaOrphLDQ8m2nWed2Ovepavyw/yk9aF8mDxggcJSmaes5Mjqu', NULL, '2024-10-07 09:50:38', '2024-10-07 09:50:38'),
(4, '7e994864-4ebf-4f1e-b20d-d6408694e9a3', 'najwamoad', 'najwaii@hotmail.com', NULL, '$2y$10$UQ5lkKud51MfpF4tS..UkejsClGvvQ4WcBS0F8Bc7D6rnhrZOsZiy', NULL, '2024-10-08 10:01:15', '2024-10-08 10:01:15'),
(5, 'd7c1b014-1915-42a5-b553-cb0d671523a3', 'najwamoad', 'najwiii@hotmail.com', NULL, '$2y$10$lYoopcziWrgGZyF35Kkhz.oI/5rFzGpZOVMQXXibecaJWlDUPCV2e', NULL, '2024-10-08 10:03:02', '2024-10-08 10:03:02'),
(6, '2e113dfa-680a-45ad-9c26-aa12fcadae21', 'Erica Senger MD', 'cassin.johnpaul@example.net', '2024-10-08 10:16:02', '$2y$10$2hQrAd3J/CUJBXDQd0gAuuYmesleffLVtHxf83IT5kfVc3B1OV1IW', 'OB7tdHISu3', '2024-10-08 10:16:06', '2024-10-08 10:16:06'),
(7, '5673ad99-11d8-4e04-87f9-cdaaa02b9a3e', 'Mrs. Yesenia Gerhold', 'vtillman@example.com', '2024-10-08 10:16:02', '$2y$10$1DsfSmz4dpX5klif5pTzE.Yyy57ut.pjhziRztaxSuVdvnuvb9Opa', 'rM3139t6IA', '2024-10-08 10:16:06', '2024-10-08 10:16:06'),
(8, '57c53c70-3bf2-420f-940f-8c4eb5ec3153', 'Mrs. Kaylee Stehr III', 'juanita.hessel@example.com', '2024-10-08 10:16:02', '$2y$10$nd24icPRQWkH.jl8oG/vcunEfnGxbPpH5YmlLRdTWQ6ARo4E4LKMG', 'D4rrbNcOY1', '2024-10-08 10:16:06', '2024-10-08 10:16:06'),
(9, 'bdd07561-f982-4294-9263-48de09ca9497', 'Ms. Florida Halvorson IV', 'ocorwin@example.org', '2024-10-08 10:16:02', '$2y$10$QKxIABUfMpNAKB5o8tFFXu3kx.go8c2UDjFEoqqYgJY0dzk1apOci', 'fKxIC09vT0', '2024-10-08 10:16:06', '2024-10-08 10:16:06'),
(10, '3a29dc55-82f9-45fb-bb2a-b175bae16bc7', 'Mrs. Bethany Smith', 'rodriguez.israel@example.com', '2024-10-08 10:16:02', '$2y$10$UyiN2W4QFmGNpsdf6iWvJOVlOav4wcu6tBJ7tki0hcJBIVBmfSjr.', 'q7gsd3BbzG', '2024-10-08 10:16:06', '2024-10-08 10:16:06'),
(11, 'c37397d4-9b63-4ab3-8070-f09bdac06250', 'Mrs. Candida Vandervort III', 'fredrick78@example.org', '2024-10-08 10:16:02', '$2y$10$X4RByOVGZ.xd5qG1n4pkt.QEDCZDuq8Qq0ljt3cPE0odPvl.3T3j.', 'PEVKPVj8yz', '2024-10-08 10:16:06', '2024-10-08 10:16:06'),
(12, '0c3dc99b-73bb-4ed4-a944-526f8a118343', 'Demario Boyle Jr.', 'stroman.trent@example.org', '2024-10-08 10:16:02', '$2y$10$5HbJTx126H4HnJ3VZoCRPu6IRZ1O/0kxOvPAPgEypEIrj.ZhMJDPG', 'nDuTfDAeNF', '2024-10-08 10:16:06', '2024-10-08 10:16:06'),
(13, 'ba45d005-a448-4c1a-880c-651aea01faa5', 'Maudie Gottlieb', 'deonte37@example.net', '2024-10-08 10:16:03', '$2y$10$A0dBNW.Obn7//uuZzmHNTukBKNrpe2ptUfW3SkCsiSQ7A5BG58Wii', 'aQM4uXOPom', '2024-10-08 10:16:06', '2024-10-08 10:16:06'),
(14, 'c58f5081-92e3-4938-85d3-5342fef7af67', 'Vivian Davis', 'bernice.kautzer@example.com', '2024-10-08 10:16:03', '$2y$10$eiep8g5KiEmqb13U8mzjrO/XIHBHSk7iUzL5JtKDmV1mF4guOOp5a', 'B0OydBG35A', '2024-10-08 10:16:06', '2024-10-08 10:16:06'),
(15, '4d553d1a-f918-4a80-8b99-8a9fd54d57a0', 'Mr. Jessy Hilpert V', 'jast.chelsey@example.org', '2024-10-08 10:16:03', '$2y$10$rvNo893Ix91eSYAOEY/NLemMxshln1eW/ONc65FZbReRVNgBPiU9y', 'zxhOc9uhay', '2024-10-08 10:16:06', '2024-10-08 10:16:06'),
(16, '1f2145b3-95a7-4c20-b502-17f5b957824b', 'Elvis Bernhard', 'brionna19@example.com', '2024-10-08 10:16:03', '$2y$10$iZB1WOBZtehR1EONODkur.at5r25JMdFstBLCiA7h3cJwwJolXJDu', 'Ou6OhO1lx3', '2024-10-08 10:16:06', '2024-10-08 10:16:06'),
(17, 'e5e65515-daaf-4004-b5e3-538af0a8ab0d', 'Shaina Carter', 'connie86@example.com', '2024-10-08 10:16:03', '$2y$10$Gno8NUzuX4aDjZiD3zTKsecdc.Q7PcW/MHPSqPZ.nda2zDbljaOJy', 'n8vYm5K6pl', '2024-10-08 10:16:06', '2024-10-08 10:16:06'),
(18, 'af686227-7575-43a6-8e4a-121daa64124a', 'Miss Maia Lehner', 'halie.aufderhar@example.com', '2024-10-08 10:16:03', '$2y$10$DNKSUQDttvggkiJn3FkQMOIvoaqcSgoi6TEU3Vjacy5oWWFunZBr.', 'bXlE3dTnB2', '2024-10-08 10:16:06', '2024-10-08 10:16:06'),
(19, '9cb01eda-1a40-4103-8247-90280f6fd564', 'Bernie Bartell', 'eherzog@example.com', '2024-10-08 10:16:03', '$2y$10$HYHLgk/6bqIFRjAkhhRK4OBGlWAg89NxiSLEZynXJ7cWtaXKunZ8O', 'J0HGWj3vjv', '2024-10-08 10:16:06', '2024-10-08 10:16:06'),
(20, '16cfa67c-5efd-4382-be32-19305e527615', 'Erling Gerhold', 'reggie08@example.com', '2024-10-08 10:16:03', '$2y$10$1hT7FMB1T3lYjIHraPkQHexWaTPnCVL2HKmaPsNpZGJtpdavnP8Ae', 'f9MdwXRAPt', '2024-10-08 10:16:06', '2024-10-08 10:16:06'),
(21, '0d756316-9c76-4eb7-bb45-c896404c96b4', 'Mr. Osbaldo Zulauf', 'abeatty@example.net', '2024-10-08 10:16:03', '$2y$10$U89yXyiHOyOw9AryS2Yz5eJ5V8SUEvM8Iy.ypM//q6OcCtQGUjC6q', '4saZUGUpuO', '2024-10-08 10:16:06', '2024-10-08 10:16:06'),
(22, 'f0e13958-1ade-45da-a618-f357f1dca6ca', 'Anthony Labadie', 'herminia.casper@example.org', '2024-10-08 10:16:03', '$2y$10$Z3VwMNqTguI/n92j3Bzbx.j1rSGpa16BLYThlg0l/NKaSNcyWdvw6', 'KqEEFck5lo', '2024-10-08 10:16:06', '2024-10-08 10:16:06'),
(23, '6c6234bf-ff27-4b46-a52c-42433877c757', 'Murray Stanton IV', 'othiel@example.com', '2024-10-08 10:16:03', '$2y$10$k8iOE7zCma6F2ikKlkYF2OsQDHCNmEWleLH8NewqOrLi9eL2cddtq', 'eooo4CoIO7', '2024-10-08 10:16:06', '2024-10-08 10:16:06'),
(24, '3bf163dc-370e-4d66-a76f-5c8b71cbc313', 'Ms. Nichole Marquardt', 'mitchell.daphnee@example.org', '2024-10-08 10:16:03', '$2y$10$G7CwcU5.YITorz.PF7ZmhOAo8auVRGVwwocj8LfgzmbqZJvLXx1fy', 'EyngR3I4be', '2024-10-08 10:16:06', '2024-10-08 10:16:06'),
(25, 'e5a6c8e2-9243-40af-b51b-921b6160c6b0', 'Ms. Carolanne Bernier III', 'lemke.elmore@example.net', '2024-10-08 10:16:03', '$2y$10$HwnTI2v14s4DLEU4hiKe4.FJtFTcJt0bdB1IDeQJ/M9x66327CmRW', 'P3rHooYzxt', '2024-10-08 10:16:06', '2024-10-08 10:16:06'),
(26, '42941bc2-2616-4bc8-b436-9042140ac051', 'Miss Gregoria Kerluke', 'ludie86@example.net', '2024-10-08 10:16:03', '$2y$10$bYLZ.OO5NAEwTCzZSELGqurssCvSCJegAjtu2z50yHnbjR3IEey1q', 'vJK0RMg1z6', '2024-10-08 10:16:06', '2024-10-08 10:16:06'),
(27, '3637aba3-e244-47a3-b6c4-f3ccd2d6ef0c', 'Olaf Considine', 'kaci94@example.org', '2024-10-08 10:16:04', '$2y$10$Ig9x0xD6Rp.Ld4dlEjdXwOnXQLufPorI6i51FUbtB2IPxaAOx5gmu', 'dj0LwpIOF0', '2024-10-08 10:16:06', '2024-10-08 10:16:06'),
(28, '12dfa322-1f0c-4405-9377-e2394117a490', 'Julius Kozey', 'ybernier@example.com', '2024-10-08 10:16:04', '$2y$10$pUBRV3Q0dEXbVr5OwH9qNevOJgAuRHkh2uFHkoCRBnX66f2Ctef..', 'c6X0Hi0coy', '2024-10-08 10:16:06', '2024-10-08 10:16:06'),
(29, '430a1ac6-4bf2-42ed-ba94-42162bb1fc03', 'Mohammed King DDS', 'dibbert.benedict@example.org', '2024-10-08 10:16:04', '$2y$10$lO96a0vjl5nitGlVh2EMTOz2hAtGV16d8s4L13HaJyt1abzdPdQDu', 'LVfb2od7eD', '2024-10-08 10:16:06', '2024-10-08 10:16:06'),
(30, '394513a5-2b0c-4cad-8c5f-05bed871b2d1', 'Dr. Dean Krajcik', 'tanner75@example.org', '2024-10-08 10:16:04', '$2y$10$lcoYpnxrrlvfsad/iM83B.BTue7no.SIPzpQ9R8nnhetxbb2npYkK', '9NCm69q3mw', '2024-10-08 10:16:06', '2024-10-08 10:16:06'),
(31, 'd157419b-7863-42c7-93ee-936bde86a98f', 'Breanna Green', 'keith29@example.com', '2024-10-08 10:16:04', '$2y$10$cR5fPmHfn/fQnVUg36X/qu76trxVJNHFB4AK66NfZ0pWZQwWUTEwa', 'L5viomwU23', '2024-10-08 10:16:06', '2024-10-08 10:16:06'),
(32, '5fd14ca8-d7ce-45c1-881e-45f937409415', 'Reba Murazik', 'rroberts@example.net', '2024-10-08 10:16:04', '$2y$10$jWayUENen/Qjc5ZJEm0CB.MC5Wj0OAdEJogX2CSja3/4g88skFRci', 'BIWlLsQKNE', '2024-10-08 10:16:06', '2024-10-08 10:16:06'),
(33, 'c2c9c07f-8fef-4e35-bab7-89d3d8258044', 'Mrs. Gwendolyn Russel', 'wava94@example.net', '2024-10-08 10:16:04', '$2y$10$uIIfXZRFdlIz9hKrIesqPuyNGC9acRYNCN6SOtruh0O3qgGibe3fO', 'vfwOb2o7w1', '2024-10-08 10:16:06', '2024-10-08 10:16:06'),
(34, '7423ae1f-b64e-4806-81b8-88f007667fe0', 'Dudley Hoeger', 'mathew.jenkins@example.com', '2024-10-08 10:16:04', '$2y$10$gRLtrUH5qsSkgXiNzeb67uYSxr7frmyIxlrhLOPCOvivPfyZ48ue.', 'NjTBLnJMiL', '2024-10-08 10:16:06', '2024-10-08 10:16:06'),
(35, 'a17a1af9-bb30-48fc-8a67-e3839f590635', 'Orlo Hane', 'toby25@example.com', '2024-10-08 10:16:04', '$2y$10$UwRV4VQniQ1NeODSsFZevudt0.5X0xnQPLHEmSgditFaTJsOnBWce', 'MRgw3Ay9vZ', '2024-10-08 10:16:06', '2024-10-08 10:16:06'),
(36, '3180dc65-15b9-408c-89d5-7e14a630b3cd', 'Effie Breitenberg V', 'vickie56@example.com', '2024-10-08 10:16:04', '$2y$10$CpMcm8OnxUYAPGTD75B5MO0fyVe/7NRNKoasrAzTUzwjssbRb0hoq', 'Kq1sRieiGd', '2024-10-08 10:16:06', '2024-10-08 10:16:06'),
(37, '650f75d1-1e04-42a0-b8a2-b6721adb43ba', 'Dr. Guido Hahn DDS', 'ybauch@example.net', '2024-10-08 10:16:04', '$2y$10$u7yQkb28nCZUomzJG7Hpcupj.C5AP82d7Fm0vz3uiIOPkHT7xQtFq', 'D7t1pPIifO', '2024-10-08 10:16:06', '2024-10-08 10:16:06'),
(38, '26bacb44-9674-4d20-996d-d6bf87d13631', 'Raphaelle Herman', 'katlynn.pfannerstill@example.org', '2024-10-08 10:16:04', '$2y$10$JH1KZ6LvkLOgQfg1APbwWO9foogb85fPllHz5YbPhnwzWLH8xL0cu', 'pdUHrbE9qv', '2024-10-08 10:16:06', '2024-10-08 10:16:06'),
(39, '835e0131-2465-4295-8ebb-092ef72a0095', 'Mozelle Cormier', 'brain.friesen@example.com', '2024-10-08 10:16:04', '$2y$10$YOF8ORIPQDjLY6fNWd6SouYX1cBYJSGCO4ZFD.ix0vbqFHDGaueY6', 'Ypp91r1jmh', '2024-10-08 10:16:06', '2024-10-08 10:16:06'),
(40, 'd8544f69-3a62-4cce-8507-ba1dfcc50e15', 'Mr. Brent Bradtke', 'vwatsica@example.net', '2024-10-08 10:16:04', '$2y$10$VXHIA5QLkdQ.RF8W1aFAqe1tsIa8J6TibKEodrbNQUrETU5tblv8q', 'FbPHNeQAE0', '2024-10-08 10:16:06', '2024-10-08 10:16:06'),
(41, 'c6e74d8a-9916-4169-ba7f-bc72b9f7f699', 'Kiara Wiza V', 'hhintz@example.com', '2024-10-08 10:16:04', '$2y$10$XQRTN6iXa/SJtnJ7JyEg6uGxu3sTpWvkqm/3nKLLnksG3DyCpaH4K', 'UvpiRF4ed8', '2024-10-08 10:16:06', '2024-10-08 10:16:06'),
(42, '3c224328-f75d-458c-9fe4-f4be7b5a423d', 'Faustino Tremblay MD', 'cloyd.zulauf@example.org', '2024-10-08 10:16:05', '$2y$10$pv9.PSdQbY/57q.nE7OGEuh7vaWqsal4Q5QlV0xtDd5x0zTvCob.q', 'vcxzLShkyI', '2024-10-08 10:16:06', '2024-10-08 10:16:06'),
(43, 'f793e4c4-cc16-40ac-9c82-f50138d95fcd', 'Ona Lueilwitz III', 'mohr.easton@example.org', '2024-10-08 10:16:05', '$2y$10$Sw7GCMtzxxTeyiwUYwBuM.50cXytaFbGwDif17cgmqLd4huAXROey', 'U8modukFZn', '2024-10-08 10:16:06', '2024-10-08 10:16:06'),
(44, '53c0c13d-d169-43d6-a652-47ed89d701d7', 'Samson Kutch', 'bailey61@example.com', '2024-10-08 10:16:05', '$2y$10$Gp0pQG3NIuiIplE9iDUnB.0elK5f2owjLYPoTltVU//Yd2DpzuhOW', 'eiK4acSvgE', '2024-10-08 10:16:06', '2024-10-08 10:16:06'),
(45, '159b1adf-c43c-4db5-ad19-21ce9a3f4b7c', 'Miss Albertha Homenick', 'serena.torp@example.org', '2024-10-08 10:16:05', '$2y$10$aVLZVgazifvX6/9s8tkZT.bbfvuj4eJlGr.4DNt82V3BPw65wbqvy', 'AkObtTRlUW', '2024-10-08 10:16:06', '2024-10-08 10:16:06'),
(46, '69d63cdc-aed7-4ebb-80e0-a1d15559b14b', 'Martine Lockman', 'schuppe.noemi@example.net', '2024-10-08 10:16:05', '$2y$10$ivLULFhCe57p7gDzBqoCI.vDQ1llCFYOs5eylXQtjfAZ.I5lH8h9e', '97oOnBom2r', '2024-10-08 10:16:06', '2024-10-08 10:16:06'),
(47, '453e9ec8-e9aa-4b0a-b2ea-ce8f77dc69e2', 'Isaac Kuhn', 'breanne25@example.org', '2024-10-08 10:16:05', '$2y$10$Oi32q9q7z2LL8J3f7f18xe9CmUW8oH9gCbpAMTVCIIJQjx.VaWod2', 'PSkIqJrjrq', '2024-10-08 10:16:06', '2024-10-08 10:16:06'),
(48, 'b0086de1-c462-4d2c-994c-493d5b254867', 'Prof. Floy Lowe', 'shawna47@example.com', '2024-10-08 10:16:05', '$2y$10$3HBM1.wjBUvFt7QeXAH.Tue8gxW1JfbmaNMRyGQjxDUmHOfdvpZxe', 'EJJt7Gile8', '2024-10-08 10:16:06', '2024-10-08 10:16:06'),
(49, '4abf7e37-e06e-40b4-896d-3be13bccd4f1', 'Lavern Cronin', 'prosacco.domenico@example.com', '2024-10-08 10:16:05', '$2y$10$x60V4PS5isjB3cwwAZ9b7epVXDbQt./.c7bsCQ2ooSq/w6Q/WQF86', 'MK7DohNVx7', '2024-10-08 10:16:06', '2024-10-08 10:16:06'),
(50, 'fab35587-15ad-4909-8fbb-448f79bce48a', 'Prof. Lauriane Herman', 'bartell.jayme@example.net', '2024-10-08 10:16:05', '$2y$10$yBkxipHi25evEQRyrvP/b.RlfoIdnBp25s098.H6egx2hDvuVE3JO', 'AkF8qoHgbj', '2024-10-08 10:16:06', '2024-10-08 10:16:06'),
(51, 'fa6169f6-9b39-496c-a9f7-e5f6f39cae54', 'Lonnie Larkin', 'kariane89@example.net', '2024-10-08 10:16:05', '$2y$10$ocUkGhBtgBFAI.Au3ZgfI.PhhKgyFolC/WZH3kygwNzZ7enDC092S', 'R2f50dsnnR', '2024-10-08 10:16:06', '2024-10-08 10:16:06'),
(52, 'a457b9e8-bec1-4f21-97fa-496f58e6fa15', 'Rosanna Hettinger PhD', 'hartmann.mollie@example.com', '2024-10-08 10:16:05', '$2y$10$hiZeRxYyJ6.FcErzhThwYucSg2Xoe8pBc/tzO0gEAPKGGzO3TkwHG', '67SgptobDb', '2024-10-08 10:16:06', '2024-10-08 10:16:06'),
(53, '70f24400-4434-4a8a-8722-d80f000453dd', 'Dr. Collin Douglas', 'creola.mclaughlin@example.com', '2024-10-08 10:16:05', '$2y$10$UE57xCpMvay2jpi3XzJ7ROagqoLq6ipeoDxgXh7h21BPv35PSRBQq', 'QIyrO98iI9', '2024-10-08 10:16:06', '2024-10-08 10:16:06'),
(54, '23849bb8-ce1b-4f37-8a85-b571ab8e5b38', 'Tad Barrows', 'quitzon.herta@example.com', '2024-10-08 10:16:05', '$2y$10$iHzDqP/vNL2MIoF.BZOeReWqvWjGecgwzF4nMmqg.Dns8rGhXuPwy', 'lR5ulxZoOS', '2024-10-08 10:16:06', '2024-10-08 10:16:06'),
(55, '4e47d7ec-31ff-4444-9f69-500aae19f505', 'Prof. Graciela Koelpin', 'lstracke@example.net', '2024-10-08 10:16:05', '$2y$10$xeZCnyXFqhHh8gGXAw8EduWeUGu/t079AEhzL9eFAucMwI9jzdRWW', 'c7eX4HSEuL', '2024-10-08 10:16:06', '2024-10-08 10:16:06');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_user_id_foreign` (`user_id`);

--
-- Indexes for table `order_products`
--
ALTER TABLE `order_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_products_product_id_foreign` (`product_id`),
  ADD KEY `order_products_order_id_foreign` (`order_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `order_products`
--
ALTER TABLE `order_products`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=104;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `order_products`
--
ALTER TABLE `order_products`
  ADD CONSTRAINT `order_products_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

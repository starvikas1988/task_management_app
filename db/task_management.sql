-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 04, 2024 at 07:03 PM
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
-- Database: `task_management`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(13, '2014_10_12_000000_create_users_table', 1),
(14, '2014_10_12_100000_create_password_resets_table', 1),
(15, '2019_08_19_000000_create_failed_jobs_table', 1),
(16, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(17, '2024_09_03_134658_create_tasks_table', 1),
(18, '2024_09_03_134919_create_categories_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(120, 'App\\Models\\User', 11, 'myTaskdata', '0822bf2e84b0078818f4ff753c601fa1a6092a9547fa2c6d51849edb93cff226', '[\"*\"]', NULL, NULL, '2024-09-04 10:53:40', '2024-09-04 10:53:40');

-- --------------------------------------------------------

--
-- Table structure for table `tasks`
--

CREATE TABLE `tasks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `due_date` date NOT NULL,
  `priority` enum('Low','Medium','High') NOT NULL,
  `status` enum('Completed','Incomplete') NOT NULL DEFAULT 'Incomplete',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tasks`
--

INSERT INTO `tasks` (`id`, `user_id`, `title`, `description`, `due_date`, `priority`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'Et voluptatem placeat voluptatem repellat qui blanditiis quasi et.', 'Provident qui numquam mollitia. Nihil aut perferendis pariatur voluptatem porro. Aut molestiae error laboriosam accusantium.', '2024-08-30', 'High', 'Incomplete', '2024-09-04 08:15:13', '2024-09-04 08:15:13'),
(2, 2, 'Maiores sint similique incidunt iure itaque.', 'Sed earum occaecati ipsum error illo. Reprehenderit sunt eos corrupti provident. Aspernatur sunt dolores fuga perferendis. Et voluptates rem quam aut placeat.', '2024-09-01', 'Low', 'Incomplete', '2024-09-04 08:15:13', '2024-09-04 08:15:13'),
(3, 3, 'Et aperiam beatae distinctio non unde.', 'Saepe maiores odio culpa ex nam ut et. Est deserunt ea aliquid reprehenderit eum. Repellendus explicabo est fugiat enim. Tempore omnis nostrum aut cupiditate labore.', '2024-09-30', 'Low', 'Completed', '2024-09-04 08:15:13', '2024-09-04 08:15:13'),
(4, 4, 'Iste laudantium consectetur occaecati quae eos ea.', 'Non esse eum accusantium qui ipsam fuga voluptas. Non cumque et dolorem ducimus quod. Ex est aliquam aliquid qui.', '2024-08-27', 'Medium', 'Incomplete', '2024-09-04 08:15:13', '2024-09-04 08:15:13'),
(5, 5, 'Iure illo repudiandae et pariatur quam numquam accusamus.', 'Ad aliquam odio consequatur rerum id autem. Voluptas amet cumque tempora et enim perferendis. Voluptas qui excepturi dolorem et quo esse recusandae.', '2024-08-23', 'Medium', 'Incomplete', '2024-09-04 08:15:13', '2024-09-04 08:15:13'),
(6, 6, 'Incidunt voluptas vel aut voluptates perferendis.', 'Vel labore eius et eum. Dolores modi non molestias dicta. Eius et qui dolores nihil. Pariatur et ea iure dicta.', '2024-09-18', 'High', 'Incomplete', '2024-09-04 08:15:13', '2024-09-04 08:15:13'),
(7, 7, 'Necessitatibus in ut incidunt perspiciatis ut qui.', 'Illum harum consequuntur cumque nostrum tempore optio. Iusto et nostrum culpa illo magni qui maiores. Voluptatem fugiat optio est illum at.', '2024-08-13', 'Medium', 'Completed', '2024-09-04 08:15:13', '2024-09-04 08:15:13'),
(8, 11, 'Laborum hic distinctio quos ex eaque qui nam.', 'Beatae autem in earum harum quo rerum. Aspernatur quam culpa est consequatur voluptas necessitatibus quia. Et ipsum ut vitae quis necessitatibus reprehenderit. Consequatur quia ratione quae enim.', '2024-09-04', 'Low', 'Incomplete', '2024-09-04 08:15:13', '2024-09-04 08:15:13'),
(9, 9, 'Impedit et magnam sequi minima repellendus.', 'Perferendis explicabo rerum voluptas voluptas voluptates et. Aut ut sed inventore sunt. Amet mollitia nesciunt aliquam quo ad. Dolores quia aliquam et voluptatibus distinctio ducimus et sapiente. Labore quia ratione dolores explicabo praesentium.', '2024-10-02', 'High', 'Completed', '2024-09-04 08:15:13', '2024-09-04 08:15:13'),
(10, 11, 'Voluptatum beatae veritatis rerum eos.', 'Consectetur autem recusandae facilis dolores assumenda voluptatibus cupiditate. Debitis ad similique velit voluptas cumque consequatur. Pariatur omnis consequatur facere deleniti. Est odio iusto hic officia et hic.', '2024-09-22', 'Medium', 'Completed', '2024-09-04 08:15:13', '2024-09-04 08:15:13');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Otto Kiehn', 'gkoepp@example.com', '2024-09-04 08:15:13', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'WlDSyvxDmJ', '2024-09-04 08:15:13', '2024-09-04 08:15:13'),
(2, 'Modesta Mann', 'carmela77@example.net', '2024-09-04 08:15:13', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'jdwxppIa6U', '2024-09-04 08:15:13', '2024-09-04 08:15:13'),
(3, 'Mrs. Adah Doyle PhD', 'jakubowski.spencer@example.com', '2024-09-04 08:15:13', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'CfpWeM9URT', '2024-09-04 08:15:13', '2024-09-04 08:15:13'),
(4, 'Leanna Bins DVM', 'lwiegand@example.com', '2024-09-04 08:15:13', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'DrQfCYRqiU', '2024-09-04 08:15:13', '2024-09-04 08:15:13'),
(5, 'Darren Weissnat', 'haylee.wolf@example.com', '2024-09-04 08:15:13', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'juod76tNfD', '2024-09-04 08:15:13', '2024-09-04 08:15:13'),
(6, 'Leif Larkin', 'carmelo57@example.net', '2024-09-04 08:15:13', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'Ilys0p0rKb', '2024-09-04 08:15:13', '2024-09-04 08:15:13'),
(7, 'Dr. Clifford Kassulke', 'steuber.lauretta@example.org', '2024-09-04 08:15:13', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'FQZDhQRJZf', '2024-09-04 08:15:13', '2024-09-04 08:15:13'),
(8, 'Arno Pagac', 'stevie.bailey@example.org', '2024-09-04 08:15:13', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'IFBsXYb9Iz', '2024-09-04 08:15:13', '2024-09-04 08:15:13'),
(9, 'Arvilla Brown', 'marks.melvin@example.org', '2024-09-04 08:15:13', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'PdGy5kK2hx', '2024-09-04 08:15:13', '2024-09-04 08:15:13'),
(10, 'Avery Orn', 'okub@example.org', '2024-09-04 08:15:13', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'OZ3ctfLEIz', '2024-09-04 08:15:13', '2024-09-04 08:15:13'),
(11, 'Vikas Pandey', 'starvikass@gmail.com', NULL, '$2y$10$L9Zsp5p4jHssGVOt9gRW7uf8nSBoK7Up9XRcLS5zmG4yoCVrlt7b2', NULL, '2024-09-04 08:16:24', '2024-09-04 08:16:24');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `tasks`
--
ALTER TABLE `tasks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tasks_user_id_foreign` (`user_id`);

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
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=121;

--
-- AUTO_INCREMENT for table `tasks`
--
ALTER TABLE `tasks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tasks`
--
ALTER TABLE `tasks`
  ADD CONSTRAINT `tasks_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

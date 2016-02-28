-- --------------------------------------------------------
-- Хост:                         127.0.0.1
-- Версия сервера:               5.5.45 - MySQL Community Server (GPL)
-- ОС Сервера:                   Win32
-- HeidiSQL Версия:              9.3.0.4984
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Дамп структуры для таблица shop.administrators
CREATE TABLE IF NOT EXISTS `administrators` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(190) NOT NULL,
  `password` varchar(60) NOT NULL,
  `name` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `administrators_username_unique` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы shop.administrators: ~1 rows (приблизительно)
DELETE FROM `administrators`;
/*!40000 ALTER TABLE `administrators` DISABLE KEYS */;
INSERT INTO `administrators` (`id`, `username`, `password`, `name`, `remember_token`, `created_at`, `updated_at`) VALUES
	(1, 'admin', '$2y$10$8UkZrnVaiMquDEjjo/5kouS4WvehcXYzZxakLsQnH/u.7k0t9GjnK', 'Admin', 'J2oyRF9KUb1DP1MApqslVS7EL30kgDou6dlSL0gmFOshXFK4fRiaAPVaUwTj', '2016-02-06 13:10:06', '2016-02-06 22:42:29');
/*!40000 ALTER TABLE `administrators` ENABLE KEYS */;


-- Дамп структуры для таблица shop.callbacks
CREATE TABLE IF NOT EXISTS `callbacks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы shop.callbacks: ~2 rows (приблизительно)
DELETE FROM `callbacks`;
/*!40000 ALTER TABLE `callbacks` DISABLE KEYS */;
INSERT INTO `callbacks` (`id`, `name`, `email`, `phone`, `created_at`, `updated_at`) VALUES
	(1, 'Артём', '', '+996552502446', '2016-02-22 21:53:56', '2016-02-22 21:53:56'),
	(2, 'Владислав', '', '0772847683', '2016-02-24 23:13:14', '2016-02-24 23:13:14');
/*!40000 ALTER TABLE `callbacks` ENABLE KEYS */;


-- Дамп структуры для таблица shop.categories
CREATE TABLE IF NOT EXISTS `categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `slug` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `parent_id` int(11) DEFAULT '0',
  `status` int(11) NOT NULL,
  `order` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы shop.categories: ~3 rows (приблизительно)
DELETE FROM `categories`;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` (`id`, `slug`, `image`, `parent_id`, `status`, `order`, `created_at`, `updated_at`) VALUES
	(3, 'vechernie-platya', '', 0, 1, 0, '2016-02-26 16:05:02', '2016-02-26 16:12:32'),
	(4, 'bolshie-platya', '', 0, 1, 1, '2016-02-26 16:10:37', '2016-02-28 15:04:21'),
	(5, 'detskie-platya', '', 3, 1, 2, '2016-02-26 16:11:12', '2016-02-26 16:11:12');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;


-- Дамп структуры для таблица shop.category_translations
CREATE TABLE IF NOT EXISTS `category_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int(10) unsigned NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text,
  `seo_title` varchar(255) DEFAULT NULL,
  `seo_description` varchar(255) DEFAULT NULL,
  `seo_keywords` varchar(255) DEFAULT NULL,
  `locale` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `category_translations_category_id_locale_unique` (`category_id`,`locale`),
  KEY `category_translations_locale_index` (`locale`),
  CONSTRAINT `category_translations_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы shop.category_translations: ~3 rows (приблизительно)
DELETE FROM `category_translations`;
/*!40000 ALTER TABLE `category_translations` DISABLE KEYS */;
INSERT INTO `category_translations` (`id`, `category_id`, `title`, `description`, `seo_title`, `seo_description`, `seo_keywords`, `locale`) VALUES
	(3, 3, 'Вечерние платья', '<p>Произвести вечерние платья в Киргизии, легко, так как расположено множество швейников. Рабочая сила не так дорога, и тем самым получаются недорогие вечерние платья оптом. Приобрести вечерние платья оптом в Бишкеке для вас не составит никакого труда, ведь у нас налаженная схема доставки по всей России, а также по Белоруссии и Казахстану.</p>\r\n\r\n<p>Приобретая вечерние платья оптом от производителя, вы не переплачиваете перекупщикам, тем самым экономите свои деньги. Производя платья, мы конкурируем со многими странами, и чтобы оставаться в &laquo;тренде&raquo; постоянно развиваем свои линейки производства.</p>\r\n\r\n<p>У нас вы можете приобрести вечерние платья оптом недорого, особенно в разделе скидки и остатки коллекций. &nbsp;Вообще в Киргизии все дешево, по сравнению с Россией и Казахстаном, где мало того, что конкуренция огромна, но также найти производителя, является большой задачей.</p>\r\n\r\n<p>Выпуская свою марку &laquo;Sabrina&raquo; &nbsp;мы стали развивать дилерские связи по всей России, Казахстану и Белоруссии, так как из-за таможни и прочих сложностей,&nbsp; наши бирки срезали и ставили Российские, наша марка оставалась незамеченной. В связи со входом в таможенный союз,&nbsp; у нас появилась возможность, показывать свой бренд на выставках и прочих распространенных местах.</p>\r\n\r\n<p>В нашем ассортименте, вы можете приобрести вечерние платья больших размеров оптом, которые пользуются не меньшей популярностью, чем на стройных девушек. Также в нашем ассортименте имеются такие платья как коктейльные, посмотреть можете по ссылке</p>\r\n', NULL, NULL, NULL, 'ru'),
	(4, 4, 'Большие платья', '', '', '', '', 'ru'),
	(5, 5, 'Детские платья', '', NULL, NULL, NULL, 'ru');
/*!40000 ALTER TABLE `category_translations` ENABLE KEYS */;


-- Дамп структуры для таблица shop.feedbacks
CREATE TABLE IF NOT EXISTS `feedbacks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы shop.feedbacks: ~1 rows (приблизительно)
DELETE FROM `feedbacks`;
/*!40000 ALTER TABLE `feedbacks` DISABLE KEYS */;
INSERT INTO `feedbacks` (`id`, `name`, `email`, `phone`, `message`, `created_at`, `updated_at`) VALUES
	(1, 'Артём', 'webapace@gmail.com', '+996552502446', 'Повседневная практика показывает, что рамки и место обучения кадров играет важную роль!', '2016-02-13 10:32:54', '2016-02-13 10:32:54');
/*!40000 ALTER TABLE `feedbacks` ENABLE KEYS */;


-- Дамп структуры для таблица shop.locations
CREATE TABLE IF NOT EXISTS `locations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `lat` varchar(255) DEFAULT NULL,
  `lng` varchar(255) DEFAULT NULL,
  `marker_id` int(10) unsigned NOT NULL,
  `map_id` int(10) unsigned NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `locations_marker_id_foreign` (`marker_id`),
  KEY `locations_map_id_foreign` (`map_id`),
  CONSTRAINT `locations_map_id_foreign` FOREIGN KEY (`map_id`) REFERENCES `maps` (`id`),
  CONSTRAINT `locations_marker_id_foreign` FOREIGN KEY (`marker_id`) REFERENCES `markers` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы shop.locations: ~3 rows (приблизительно)
DELETE FROM `locations`;
/*!40000 ALTER TABLE `locations` DISABLE KEYS */;
INSERT INTO `locations` (`id`, `lat`, `lng`, `marker_id`, `map_id`, `status`, `created_at`, `updated_at`) VALUES
	(1, '42.937745277719685', ' 74.62047116458393', 2, 2, 1, '2016-02-07 12:31:17', '2016-02-07 12:46:25'),
	(2, '42.83508178093922', ' 74.62059722840763', 3, 2, 1, '2016-02-07 12:35:42', '2016-02-18 19:51:56'),
	(3, '42.876600897669036', ' 74.61208590865112', 1, 1, 1, '2016-02-07 12:50:04', '2016-02-07 23:33:32');
/*!40000 ALTER TABLE `locations` ENABLE KEYS */;


-- Дамп структуры для таблица shop.location_translations
CREATE TABLE IF NOT EXISTS `location_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `location_id` int(10) unsigned NOT NULL,
  `title` varchar(255) NOT NULL,
  `text` text,
  `locale` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `location_translations_location_id_locale_unique` (`location_id`,`locale`),
  KEY `location_translations_locale_index` (`locale`),
  CONSTRAINT `location_translations_location_id_foreign` FOREIGN KEY (`location_id`) REFERENCES `locations` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы shop.location_translations: ~6 rows (приблизительно)
DELETE FROM `location_translations`;
/*!40000 ALTER TABLE `location_translations` DISABLE KEYS */;
INSERT INTO `location_translations` (`id`, `location_id`, `title`, `text`, `locale`) VALUES
	(1, 1, 'Рыбатекcт', '<p>Идейные соображения высшего порядка, а также сложившаяся структура</p>', 'ru'),
	(2, 2, 'Рыбатекcт', '<p>Идейные соображения высшего порядка, а также сложившаяся структура</p>\r\n', 'ru'),
	(3, 3, 'Рыбатекcт', '<p>Идейные соображения высшего порядка, а также сложившаяся структура</p>', 'ru'),
	(4, 1, 'Lorem ipsum', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit</p>', 'en'),
	(5, 2, 'Lorem ipsum', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit</p>', 'en'),
	(6, 3, 'Lorem ipsum', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit</p>', 'en');
/*!40000 ALTER TABLE `location_translations` ENABLE KEYS */;


-- Дамп структуры для таблица shop.maps
CREATE TABLE IF NOT EXISTS `maps` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `style` text,
  `width` varchar(255) NOT NULL,
  `height` varchar(255) NOT NULL,
  `zoom` int(11) DEFAULT '16',
  `lat` varchar(255) DEFAULT NULL,
  `lng` varchar(255) DEFAULT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы shop.maps: ~2 rows (приблизительно)
DELETE FROM `maps`;
/*!40000 ALTER TABLE `maps` DISABLE KEYS */;
INSERT INTO `maps` (`id`, `title`, `style`, `width`, `height`, `zoom`, `lat`, `lng`, `status`, `created_at`, `updated_at`) VALUES
	(1, 'Офисы', '[ { "stylers": [ { "saturation": -100 } ] } ]', '640px', '480px', 16, '42.87476501989281', ' 74.61223007738568', 1, '2016-02-06 21:41:23', '2016-02-11 23:20:25'),
	(2, 'Торговые точки', '[ { "stylers": [ { "saturation": -100 } ] } ]', '100%', '480px', 11, '42.90144866942692', ' 74.61840318143345', 1, '2016-02-06 21:42:10', '2016-02-08 16:19:31');
/*!40000 ALTER TABLE `maps` ENABLE KEYS */;


-- Дамп структуры для таблица shop.markers
CREATE TABLE IF NOT EXISTS `markers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `uri` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы shop.markers: ~3 rows (приблизительно)
DELETE FROM `markers`;
/*!40000 ALTER TABLE `markers` DISABLE KEYS */;
INSERT INTO `markers` (`id`, `title`, `uri`, `created_at`, `updated_at`) VALUES
	(1, 'Красный', 'images/uploads/0c7d4e1aa4527cb4bb3c2498db4a9bea.png', '2016-02-06 23:29:05', '2016-02-07 12:41:32'),
	(2, 'Зелёный', 'images/uploads/a9cf2357856a4d4c0b91f40d705e958f.png', '2016-02-07 12:44:15', '2016-02-07 12:44:15'),
	(3, 'Синий', 'images/uploads/39bde4542c7a0d6ab73a8023f8a060a4.png', '2016-02-07 12:45:59', '2016-02-07 12:45:59');
/*!40000 ALTER TABLE `markers` ENABLE KEYS */;


-- Дамп структуры для таблица shop.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Дамп данных таблицы shop.migrations: ~27 rows (приблизительно)
DELETE FROM `migrations`;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` (`migration`, `batch`) VALUES
	('2014_10_12_000000_create_users_table', 1),
	('2014_10_12_100000_create_password_resets_table', 1),
	('2014_10_12_104748_create_administrators_table', 1),
	('2016_02_06_131130_create_maps_table', 2),
	('2016_02_06_131157_create_locations_table', 2),
	('2016_02_06_131206_create_markers_table', 2),
	('2016_02_06_132742_change_fields_locations_table', 3),
	('2016_02_06_214609_add_fields_maps_table', 4),
	('2016_02_06_220938_add_fields_maps_table', 5),
	('2016_02_06_231639_add_fields_locations_table', 6),
	('2016_02_07_233900_remove_fields_markers_table', 7),
	('2016_02_08_160808_add_fields_maps_table', 7),
	('2016_02_08_161522_add_fields_maps_table', 8),
	('2016_02_10_104835_change_fields_locations_table', 9),
	('2016_02_10_105500_create_locations_translations_table', 10),
	('2016_02_10_114602_create_locations_translations_table', 11),
	('2016_02_10_115138_create_location_translations_table', 12),
	('2016_02_11_224626_create_feedbacks_table', 13),
	('2016_02_15_212108_create_reviews_table', 14),
	('2016_02_15_215013_add_fields_reviews_table', 15),
	('2016_02_22_203520_create_callbacks_table', 16),
	('2016_02_23_192653_create_slideshows_table', 17),
	('2016_02_24_193004_create_widgets_table', 18),
	('2016_02_24_212828_create_settings_table', 19),
	('2016_02_24_214924_add_fields_widgets_table', 20),
	('2016_02_24_221633_add_fields_settings_table', 21),
	('2016_02_26_133433_create_categories_table', 22);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;


-- Дамп структуры для таблица shop.password_resets
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  KEY `password_resets_email_index` (`email`),
  KEY `password_resets_token_index` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Дамп данных таблицы shop.password_resets: ~0 rows (приблизительно)
DELETE FROM `password_resets`;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;


-- Дамп структуры для таблица shop.reviews
CREATE TABLE IF NOT EXISTS `reviews` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `slug` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `status` tinyint(1) NOT NULL,
  `order` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `reviews_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы shop.reviews: ~6 rows (приблизительно)
DELETE FROM `reviews`;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
INSERT INTO `reviews` (`id`, `slug`, `image`, `status`, `order`, `created_at`, `updated_at`) VALUES
	(1, 'node-1', 'images/uploads/d51d1d29657f1cda132ac6f3a468e78b.jpg', 1, 0, '2016-02-17 08:30:00', '2016-02-18 19:47:08'),
	(2, 'node-2', 'images/uploads/2abeff0fe8ff68ba43328eda469d3259.jpg', 1, 1, '2016-02-17 19:33:50', '2016-02-17 19:33:50'),
	(3, 'node-3', 'images/uploads/a0ff396f19f938ab0d57ae05f550404d.jpg', 1, 2, '2016-02-17 19:33:56', '2016-02-17 19:33:56'),
	(4, 'node-4', 'images/uploads/1097dd08a0116fff59e422ec3474a6cf.jpg', 1, 3, '2016-02-17 19:33:58', '2016-02-17 19:33:58'),
	(5, 'node-5', 'images/uploads/f8d65fabe9964368594f95f88500361d.jpg', 1, 4, '2016-02-17 19:34:00', '2016-02-17 19:34:00'),
	(6, 'node-6', 'images/uploads/b637dff69d10e21657f990ba6a890f49.jpg', 1, 5, '2016-02-17 19:34:03', '2016-02-17 20:13:57');
/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;


-- Дамп структуры для таблица shop.review_translations
CREATE TABLE IF NOT EXISTS `review_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `review_id` int(10) unsigned NOT NULL,
  `title` varchar(255) NOT NULL,
  `position` varchar(255) DEFAULT NULL,
  `teaser` text NOT NULL,
  `text` text NOT NULL,
  `locale` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `review_translations_review_id_locale_unique` (`review_id`,`locale`),
  KEY `review_translations_locale_index` (`locale`),
  CONSTRAINT `review_translations_review_id_foreign` FOREIGN KEY (`review_id`) REFERENCES `reviews` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы shop.review_translations: ~17 rows (приблизительно)
DELETE FROM `review_translations`;
/*!40000 ALTER TABLE `review_translations` DISABLE KEYS */;
INSERT INTO `review_translations` (`id`, `review_id`, `title`, `position`, `teaser`, `text`, `locale`) VALUES
	(1, 1, 'Алексей', 'Дизайнер', 'С другой стороны постоянное информационно-пропагандистское обеспечение нашей деятельности позволяет выполнять важные задания по разработке форм развития. Таким образом укрепление и развитие структуры обеспечивает широкому кругу (специалистов) участие в формировании направлений прогрессивного развития. ', '<p>С другой стороны постоянное информационно-пропагандистское обеспечение нашей деятельности позволяет выполнять важные задания по разработке форм развития. Таким образом укрепление и развитие структуры обеспечивает широкому кругу (специалистов) участие в формировании направлений прогрессивного развития.</p>\r\n\r\n<p>Разнообразный и богатый опыт новая модель организационной деятельности в значительной степени обуславливает создание дальнейших направлений развития. Идейные соображения высшего порядка, а также рамки и место обучения кадров позволяет выполнять важные задания по разработке новых предложений.</p>\r\n', 'ru'),
	(2, 2, 'Алексей', 'Дизайнер', 'С другой стороны постоянное информационно-пропагандистское обеспечение нашей деятельности позволяет выполнять важные задания по разработке форм развития. Таким образом укрепление и развитие структуры обеспечивает широкому кругу (специалистов) участие в формировании направлений прогрессивного развития. ', '<p>С другой стороны постоянное информационно-пропагандистское обеспечение нашей деятельности позволяет выполнять важные задания по разработке форм развития. Таким образом укрепление и развитие структуры обеспечивает широкому кругу (специалистов) участие в формировании направлений прогрессивного развития.</p>\r\n\r\n<p>Разнообразный и богатый опыт новая модель организационной деятельности в значительной степени обуславливает создание дальнейших направлений развития. Идейные соображения высшего порядка, а также рамки и место обучения кадров позволяет выполнять важные задания по разработке новых предложений.</p>\r\n', 'ru'),
	(3, 3, 'Алексей', 'Дизайнер', 'С другой стороны постоянное информационно-пропагандистское обеспечение нашей деятельности позволяет выполнять важные задания по разработке форм развития. Таким образом укрепление и развитие структуры обеспечивает широкому кругу (специалистов) участие в формировании направлений прогрессивного развития. ', '<p>С другой стороны постоянное информационно-пропагандистское обеспечение нашей деятельности позволяет выполнять важные задания по разработке форм развития. Таким образом укрепление и развитие структуры обеспечивает широкому кругу (специалистов) участие в формировании направлений прогрессивного развития.</p>\r\n\r\n<p>Разнообразный и богатый опыт новая модель организационной деятельности в значительной степени обуславливает создание дальнейших направлений развития. Идейные соображения высшего порядка, а также рамки и место обучения кадров позволяет выполнять важные задания по разработке новых предложений.</p>\r\n', 'ru'),
	(4, 4, 'Алексей', 'Дизайнер', 'С другой стороны постоянное информационно-пропагандистское обеспечение нашей деятельности позволяет выполнять важные задания по разработке форм развития. Таким образом укрепление и развитие структуры обеспечивает широкому кругу (специалистов) участие в формировании направлений прогрессивного развития. ', '<p>С другой стороны постоянное информационно-пропагандистское обеспечение нашей деятельности позволяет выполнять важные задания по разработке форм развития. Таким образом укрепление и развитие структуры обеспечивает широкому кругу (специалистов) участие в формировании направлений прогрессивного развития.</p>\r\n\r\n<p>Разнообразный и богатый опыт новая модель организационной деятельности в значительной степени обуславливает создание дальнейших направлений развития. Идейные соображения высшего порядка, а также рамки и место обучения кадров позволяет выполнять важные задания по разработке новых предложений.</p>\r\n', 'ru'),
	(5, 5, 'Алексей', 'Дизайнер', 'С другой стороны постоянное информационно-пропагандистское обеспечение нашей деятельности позволяет выполнять важные задания по разработке форм развития. Таким образом укрепление и развитие структуры обеспечивает широкому кругу (специалистов) участие в формировании направлений прогрессивного развития. ', '<p>С другой стороны постоянное информационно-пропагандистское обеспечение нашей деятельности позволяет выполнять важные задания по разработке форм развития. Таким образом укрепление и развитие структуры обеспечивает широкому кругу (специалистов) участие в формировании направлений прогрессивного развития.</p>\r\n\r\n<p>Разнообразный и богатый опыт новая модель организационной деятельности в значительной степени обуславливает создание дальнейших направлений развития. Идейные соображения высшего порядка, а также рамки и место обучения кадров позволяет выполнять важные задания по разработке новых предложений.</p>\r\n', 'ru'),
	(6, 6, 'Алексей', 'Дизайнер', 'С другой стороны постоянное информационно-пропагандистское обеспечение нашей деятельности позволяет выполнять важные задания по разработке форм развития. Таким образом укрепление и развитие структуры обеспечивает широкому кругу (специалистов) участие в формировании направлений прогрессивного развития. ', '<p>С другой стороны постоянное информационно-пропагандистское обеспечение нашей деятельности позволяет выполнять важные задания по разработке форм развития. Таким образом укрепление и развитие структуры обеспечивает широкому кругу (специалистов) участие в формировании направлений прогрессивного развития.</p>\r\n\r\n<p>Разнообразный и богатый опыт новая модель организационной деятельности в значительной степени обуславливает создание дальнейших направлений развития. Идейные соображения высшего порядка, а также рамки и место обучения кадров позволяет выполнять важные задания по разработке новых предложений.</p>\r\n', 'ru'),
	(7, 6, 'Alex', 'Designer', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer sed odio nec nunc accumsan posuere vel quis urna. Nullam tristique felis mi, sit amet lobortis magna porta accumsan. Nullam ipsum augue, mattis quis arcu pretium, semper fringilla dolor. Mauris sed est porttitor nibh consectetur rutrum et sed odio. Aenean interdum maximus est, at euismod ante mattis ut.', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer sed odio nec nunc accumsan posuere vel quis urna. Nullam tristique felis mi, sit amet lobortis magna porta accumsan. Nullam ipsum augue, mattis quis arcu pretium, semper fringilla dolor. Mauris sed est porttitor nibh consectetur rutrum et sed odio. Aenean interdum maximus est, at euismod ante mattis ut. Praesent eget lacinia lorem. In ac maximus neque, facilisis pretium lorem. Phasellus congue nisl est, non tristique eros dignissim vel.</p>\r\n\r\n<p>Morbi eget odio pretium velit tincidunt euismod eu ac arcu. Etiam vestibulum non erat at mattis. Nunc fringilla, metus gravida ornare aliquet, sapien leo fermentum nisl, sit amet mollis augue neque sed arcu. Aliquam posuere lacus ut congue luctus. Etiam volutpat nisi vitae fermentum molestie. Praesent nec massa congue, eleifend quam at, suscipit odio. Praesent lacinia placerat mauris elementum viverra. Sed auctor eros iaculis diam posuere, vel ullamcorper diam scelerisque. Praesent eleifend porttitor sagittis. Integer vel lacus sit amet mauris aliquet maximus. Aliquam tincidunt eleifend interdum. Ut in risus nec lectus ullamcorper rutrum. In sed elit consequat, pellentesque metus quis, bibendum neque. Etiam at lobortis mi. Sed at facilisis nisi. Maecenas nec rhoncus enim, a eleifend orci.</p>\r\n', 'en'),
	(8, 5, 'Alex', 'Designer', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer sed odio nec nunc accumsan posuere vel quis urna. Nullam tristique felis mi, sit amet lobortis magna porta accumsan. Nullam ipsum augue, mattis quis arcu pretium, semper fringilla dolor. Mauris sed est porttitor nibh consectetur rutrum et sed odio. Aenean interdum maximus est, at euismod ante mattis ut.', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer sed odio nec nunc accumsan posuere vel quis urna. Nullam tristique felis mi, sit amet lobortis magna porta accumsan. Nullam ipsum augue, mattis quis arcu pretium, semper fringilla dolor. Mauris sed est porttitor nibh consectetur rutrum et sed odio. Aenean interdum maximus est, at euismod ante mattis ut. Praesent eget lacinia lorem. In ac maximus neque, facilisis pretium lorem. Phasellus congue nisl est, non tristique eros dignissim vel.</p>\r\n\r\n<p>Morbi eget odio pretium velit tincidunt euismod eu ac arcu. Etiam vestibulum non erat at mattis. Nunc fringilla, metus gravida ornare aliquet, sapien leo fermentum nisl, sit amet mollis augue neque sed arcu. Aliquam posuere lacus ut congue luctus. Etiam volutpat nisi vitae fermentum molestie. Praesent nec massa congue, eleifend quam at, suscipit odio. Praesent lacinia placerat mauris elementum viverra. Sed auctor eros iaculis diam posuere, vel ullamcorper diam scelerisque. Praesent eleifend porttitor sagittis. Integer vel lacus sit amet mauris aliquet maximus. Aliquam tincidunt eleifend interdum. Ut in risus nec lectus ullamcorper rutrum. In sed elit consequat, pellentesque metus quis, bibendum neque. Etiam at lobortis mi. Sed at facilisis nisi. Maecenas nec rhoncus enim, a eleifend orci.</p>\r\n', 'en'),
	(9, 4, 'Alex', 'Designer', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer sed odio nec nunc accumsan posuere vel quis urna. Nullam tristique felis mi, sit amet lobortis magna porta accumsan. Nullam ipsum augue, mattis quis arcu pretium, semper fringilla dolor. Mauris sed est porttitor nibh consectetur rutrum et sed odio. Aenean interdum maximus est, at euismod ante mattis ut.', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer sed odio nec nunc accumsan posuere vel quis urna. Nullam tristique felis mi, sit amet lobortis magna porta accumsan. Nullam ipsum augue, mattis quis arcu pretium, semper fringilla dolor. Mauris sed est porttitor nibh consectetur rutrum et sed odio. Aenean interdum maximus est, at euismod ante mattis ut. Praesent eget lacinia lorem. In ac maximus neque, facilisis pretium lorem. Phasellus congue nisl est, non tristique eros dignissim vel.</p>\r\n\r\n<p>Morbi eget odio pretium velit tincidunt euismod eu ac arcu. Etiam vestibulum non erat at mattis. Nunc fringilla, metus gravida ornare aliquet, sapien leo fermentum nisl, sit amet mollis augue neque sed arcu. Aliquam posuere lacus ut congue luctus. Etiam volutpat nisi vitae fermentum molestie. Praesent nec massa congue, eleifend quam at, suscipit odio. Praesent lacinia placerat mauris elementum viverra. Sed auctor eros iaculis diam posuere, vel ullamcorper diam scelerisque. Praesent eleifend porttitor sagittis. Integer vel lacus sit amet mauris aliquet maximus. Aliquam tincidunt eleifend interdum. Ut in risus nec lectus ullamcorper rutrum. In sed elit consequat, pellentesque metus quis, bibendum neque. Etiam at lobortis mi. Sed at facilisis nisi. Maecenas nec rhoncus enim, a eleifend orci.</p>\r\n', 'en'),
	(10, 1, 'Alex', 'Designer', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer sed odio nec nunc accumsan posuere vel quis urna. Nullam tristique felis mi, sit amet lobortis magna porta accumsan. Nullam ipsum augue, mattis quis arcu pretium, semper fringilla dolor. Mauris sed est porttitor nibh consectetur rutrum et sed odio. Aenean interdum maximus est, at euismod ante mattis ut.', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer sed odio nec nunc accumsan posuere vel quis urna. Nullam tristique felis mi, sit amet lobortis magna porta accumsan. Nullam ipsum augue, mattis quis arcu pretium, semper fringilla dolor. Mauris sed est porttitor nibh consectetur rutrum et sed odio. Aenean interdum maximus est, at euismod ante mattis ut. Praesent eget lacinia lorem. In ac maximus neque, facilisis pretium lorem. Phasellus congue nisl est, non tristique eros dignissim vel.</p>\r\n\r\n<p>Morbi eget odio pretium velit tincidunt euismod eu ac arcu. Etiam vestibulum non erat at mattis. Nunc fringilla, metus gravida ornare aliquet, sapien leo fermentum nisl, sit amet mollis augue neque sed arcu. Aliquam posuere lacus ut congue luctus. Etiam volutpat nisi vitae fermentum molestie. Praesent nec massa congue, eleifend quam at, suscipit odio. Praesent lacinia placerat mauris elementum viverra. Sed auctor eros iaculis diam posuere, vel ullamcorper diam scelerisque. Praesent eleifend porttitor sagittis. Integer vel lacus sit amet mauris aliquet maximus. Aliquam tincidunt eleifend interdum. Ut in risus nec lectus ullamcorper rutrum. In sed elit consequat, pellentesque metus quis, bibendum neque. Etiam at lobortis mi. Sed at facilisis nisi. Maecenas nec rhoncus enim, a eleifend orci.</p>\r\n', 'en'),
	(11, 2, 'Alex', 'Designer', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer sed odio nec nunc accumsan posuere vel quis urna. Nullam tristique felis mi, sit amet lobortis magna porta accumsan. Nullam ipsum augue, mattis quis arcu pretium, semper fringilla dolor. Mauris sed est porttitor nibh consectetur rutrum et sed odio. Aenean interdum maximus est, at euismod ante mattis ut.', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer sed odio nec nunc accumsan posuere vel quis urna. Nullam tristique felis mi, sit amet lobortis magna porta accumsan. Nullam ipsum augue, mattis quis arcu pretium, semper fringilla dolor. Mauris sed est porttitor nibh consectetur rutrum et sed odio. Aenean interdum maximus est, at euismod ante mattis ut. Praesent eget lacinia lorem. In ac maximus neque, facilisis pretium lorem. Phasellus congue nisl est, non tristique eros dignissim vel.</p>\r\n\r\n<p>Morbi eget odio pretium velit tincidunt euismod eu ac arcu. Etiam vestibulum non erat at mattis. Nunc fringilla, metus gravida ornare aliquet, sapien leo fermentum nisl, sit amet mollis augue neque sed arcu. Aliquam posuere lacus ut congue luctus. Etiam volutpat nisi vitae fermentum molestie. Praesent nec massa congue, eleifend quam at, suscipit odio. Praesent lacinia placerat mauris elementum viverra. Sed auctor eros iaculis diam posuere, vel ullamcorper diam scelerisque. Praesent eleifend porttitor sagittis. Integer vel lacus sit amet mauris aliquet maximus. Aliquam tincidunt eleifend interdum. Ut in risus nec lectus ullamcorper rutrum. In sed elit consequat, pellentesque metus quis, bibendum neque. Etiam at lobortis mi. Sed at facilisis nisi. Maecenas nec rhoncus enim, a eleifend orci.</p>\r\n', 'en'),
	(12, 3, 'Alex', 'Designer', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer sed odio nec nunc accumsan posuere vel quis urna. Nullam tristique felis mi, sit amet lobortis magna porta accumsan. Nullam ipsum augue, mattis quis arcu pretium, semper fringilla dolor. Mauris sed est porttitor nibh consectetur rutrum et sed odio. Aenean interdum maximus est, at euismod ante mattis ut.', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer sed odio nec nunc accumsan posuere vel quis urna. Nullam tristique felis mi, sit amet lobortis magna porta accumsan. Nullam ipsum augue, mattis quis arcu pretium, semper fringilla dolor. Mauris sed est porttitor nibh consectetur rutrum et sed odio. Aenean interdum maximus est, at euismod ante mattis ut. Praesent eget lacinia lorem. In ac maximus neque, facilisis pretium lorem. Phasellus congue nisl est, non tristique eros dignissim vel.</p>\r\n\r\n<p>Morbi eget odio pretium velit tincidunt euismod eu ac arcu. Etiam vestibulum non erat at mattis. Nunc fringilla, metus gravida ornare aliquet, sapien leo fermentum nisl, sit amet mollis augue neque sed arcu. Aliquam posuere lacus ut congue luctus. Etiam volutpat nisi vitae fermentum molestie. Praesent nec massa congue, eleifend quam at, suscipit odio. Praesent lacinia placerat mauris elementum viverra. Sed auctor eros iaculis diam posuere, vel ullamcorper diam scelerisque. Praesent eleifend porttitor sagittis. Integer vel lacus sit amet mauris aliquet maximus. Aliquam tincidunt eleifend interdum. Ut in risus nec lectus ullamcorper rutrum. In sed elit consequat, pellentesque metus quis, bibendum neque. Etiam at lobortis mi. Sed at facilisis nisi. Maecenas nec rhoncus enim, a eleifend orci.</p>\r\n', 'en');
/*!40000 ALTER TABLE `review_translations` ENABLE KEYS */;


-- Дамп структуры для таблица shop.settings
CREATE TABLE IF NOT EXISTS `settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `value` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `settings_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы shop.settings: ~1 rows (приблизительно)
DELETE FROM `settings`;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` (`id`, `title`, `value`, `slug`, `created_at`, `updated_at`) VALUES
	(1, 'E-mail', 'webapace@gmail.com', 'email', '2016-02-24 22:22:54', '2016-02-24 22:22:54');
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;


-- Дамп структуры для таблица shop.slideshows
CREATE TABLE IF NOT EXISTS `slideshows` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `image` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `order` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы shop.slideshows: ~3 rows (приблизительно)
DELETE FROM `slideshows`;
/*!40000 ALTER TABLE `slideshows` DISABLE KEYS */;
INSERT INTO `slideshows` (`id`, `image`, `status`, `order`, `created_at`, `updated_at`) VALUES
	(1, 'images/uploads/83b2168e1464c768127530b49a7a15f1.jpg', 1, 1, '2016-02-23 20:30:28', '2016-02-23 21:38:51'),
	(2, 'images/uploads/45a44c2cc0bb9ffbad50d3deca8197dd.jpg', 1, 0, '2016-02-23 20:30:55', '2016-02-26 11:47:13'),
	(3, 'images/uploads/594997f548e5ee4ca0b101f3adf84d3f.jpg', 1, 2, '2016-02-23 20:35:21', '2016-02-23 21:27:25');
/*!40000 ALTER TABLE `slideshows` ENABLE KEYS */;


-- Дамп структуры для таблица shop.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(60) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Дамп данных таблицы shop.users: ~0 rows (приблизительно)
DELETE FROM `users`;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;


-- Дамп структуры для таблица shop.widgets
CREATE TABLE IF NOT EXISTS `widgets` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `slug` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `widgets_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы shop.widgets: ~4 rows (приблизительно)
DELETE FROM `widgets`;
/*!40000 ALTER TABLE `widgets` DISABLE KEYS */;
INSERT INTO `widgets` (`id`, `slug`, `created_at`, `updated_at`) VALUES
	(1, 'reviews', '2016-02-24 20:13:18', '2016-02-24 20:13:18'),
	(2, 'feedback', '2016-02-24 20:16:42', '2016-02-24 20:16:42'),
	(3, 'location', '2016-02-24 20:17:34', '2016-02-24 20:17:34'),
	(4, 'callback', '2016-02-24 20:18:21', '2016-02-24 21:02:44');
/*!40000 ALTER TABLE `widgets` ENABLE KEYS */;


-- Дамп структуры для таблица shop.widget_translations
CREATE TABLE IF NOT EXISTS `widget_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `widget_id` int(10) unsigned NOT NULL,
  `title` varchar(255) NOT NULL,
  `locale` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `widget_translations_widget_id_locale_unique` (`widget_id`,`locale`),
  KEY `widget_translations_locale_index` (`locale`),
  CONSTRAINT `widget_translations_widget_id_foreign` FOREIGN KEY (`widget_id`) REFERENCES `widgets` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы shop.widget_translations: ~8 rows (приблизительно)
DELETE FROM `widget_translations`;
/*!40000 ALTER TABLE `widget_translations` DISABLE KEYS */;
INSERT INTO `widget_translations` (`id`, `widget_id`, `title`, `locale`) VALUES
	(1, 1, 'Отзывы', 'ru'),
	(2, 1, 'Reviews', 'en'),
	(3, 2, 'Обратная свзяь', 'ru'),
	(4, 2, 'Feedback', 'en'),
	(5, 3, 'Location', 'en'),
	(6, 3, 'Местоположение', 'ru'),
	(7, 4, 'Заказать звонок', 'ru'),
	(8, 4, 'Callback', 'en');
/*!40000 ALTER TABLE `widget_translations` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

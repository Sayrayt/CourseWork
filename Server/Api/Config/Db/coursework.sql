-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Июл 01 2023 г., 22:22
-- Версия сервера: 8.0.30
-- Версия PHP: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `coursework`
--

-- --------------------------------------------------------

--
-- Структура таблицы `actors`
--

CREATE TABLE `actors` (
  `id` bigint NOT NULL,
  `actor` varchar(256) NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `actors`
--

INSERT INTO `actors` (`id`, `actor`, `description`) VALUES
(1, 'Джонни Дэпп', 'Джон Кри́стофер (Джо́нни) Депп. род. 9 июня 1963, Оуэнсборо, Кентукки — американский актёр, кинорежиссёр, музыкант, сценарист и продюсер.');

-- --------------------------------------------------------

--
-- Структура таблицы `bookmarks`
--

CREATE TABLE `bookmarks` (
  `user_id` bigint NOT NULL,
  `film_id` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `bookmarks`
--

INSERT INTO `bookmarks` (`user_id`, `film_id`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `characters_of_film`
--

CREATE TABLE `characters_of_film` (
  `id` bigint NOT NULL,
  `character_of_film` varchar(256) NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `characters_of_film`
--

INSERT INTO `characters_of_film` (`id`, `character_of_film`, `description`) VALUES
(1, 'Главный герой', 'Журналист, которого преследует жажда американской мечты');

-- --------------------------------------------------------

--
-- Структура таблицы `direct`
--

CREATE TABLE `direct` (
  `director_id` bigint NOT NULL,
  `film_id` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `direct`
--

INSERT INTO `direct` (`director_id`, `film_id`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `directors`
--

CREATE TABLE `directors` (
  `id` bigint NOT NULL,
  `director` varchar(256) NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `directors`
--

INSERT INTO `directors` (`id`, `director`, `description`) VALUES
(1, 'Терри Гиллиам', 
'Рост: 1.75 м, Дата рождения 22 ноября 1940,Скорпион,\r\nМесто рождения: Миннеаполис, Миннесота, США,\r\nСупруга: Мэгги Уэстон, трое детей\r\nВсего фильмов: 149');

-- --------------------------------------------------------

--
-- Структура таблицы `films`
--

CREATE TABLE `films` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `production_year` int NOT NULL,
  `premiere_date` varchar(256) NOT NULL,
  `time` varchar(255) NOT NULL,
  `genre_of_film` varchar(256) NOT NULL,
  `country` varchar(256) NOT NULL,
  `literature_id` bigint NOT NULL,
  `movie_cover` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `films`
--

INSERT INTO `films` (`id`, `name`, `production_year`, `premiere_date`, `time`, `genre_of_film`, `country`, `literature_id`, `movie_cover`) VALUES
(1, 'Страх и ненависть в Лас-Вегасе', 
1998, '15 мая 1998', '118 минут', 'комедия', 'США', 1,
'ссылка');

-- --------------------------------------------------------   

--
-- Структура таблицы `literature`
--

CREATE TABLE `literature` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `author` varchar(255) NOT NULL,
  `genre_of_literature` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `literature`
--

INSERT INTO `literature` (`id`, `name`, `author`, `genre_of_literature`) VALUES
(1, 'Страх и отвращение в Лас-Вегасе', 'Хантер Томпсон', 'Роман');

-- --------------------------------------------------------

--
-- Структура таблицы `movies_watched`
--

CREATE TABLE `movies_watched` (
  `film_id` bigint NOT NULL,
  `user_id` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `movies_watched`
--

INSERT INTO `movies_watched` (`film_id`, `user_id`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `producers`
--

CREATE TABLE `producers` (
  `id` bigint NOT NULL,
  `producer` varchar(256) NOT NULL,
  `description` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `producers`
--

INSERT INTO `producers` (`id`, `producer`, `description`) VALUES
(1, 'Патрик Кассаветти', 'Дата рождения: сентябрь 1950 г., Супруга Милли Барнс, 3 детей, всего 49 фильмов');

-- --------------------------------------------------------

--
-- Структура таблицы `produces`
--

CREATE TABLE `produces` (
  `producer_id` bigint NOT NULL,
  `film_id` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `produces`
--

INSERT INTO `produces` (`producer_id`, `film_id`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `reviews`
--

CREATE TABLE `reviews` (
  `id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `film_id` bigint NOT NULL,
  `review` varchar(256) NOT NULL,
  `rating` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `reviews`
--

INSERT INTO `reviews` (`id`, `user_id`, `film_id`, `review`, `rating`) VALUES
(1, 1, 1, 'Классный фильм!', 2);

-- --------------------------------------------------------

--
-- Структура таблицы `starring`
--

CREATE TABLE `starring` (
  `actor_id` bigint NOT NULL,
  `film_id` bigint NOT NULL,
  `character_id` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `starring`
--

INSERT INTO `starring` (`actor_id`, `film_id`, `character_id`) VALUES
(1, 1, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `login` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `is_admin` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `login`, `password`, `name`, `token`, `is_admin`) VALUES
(3, 'nikita', '123', 'nikita', '42ecebeebad8d363f95f2d03d42ad442', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `user_profile_information`
--

CREATE TABLE `user_profile_information` (
  `id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `status` varchar(256) NOT NULL,
  `personal_information` varchar(256) NOT NULL,
  `avatar` varchar(256) NOT NULL,
  `country` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `user_profile_information`
--

INSERT INTO `user_profile_information` (`id`, `user_id`, `status`, `personal_information`, `avatar`, `country`) VALUES
(1, 3, 'Отдыхаю', 'Всем привет, я люблю ужасы', 'Ссылка на картинку', 'Россия');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `actors`
--
ALTER TABLE `actors`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `bookmarks`
--
ALTER TABLE `bookmarks`
  ADD UNIQUE KEY `user_id` (`user_id`),
  ADD UNIQUE KEY `film_id` (`film_id`);

--
-- Индексы таблицы `characters_of_film`
--
ALTER TABLE `characters_of_film`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `direct`
--
ALTER TABLE `direct`
  ADD UNIQUE KEY `film_id` (`film_id`);

--
-- Индексы таблицы `directors`
--
ALTER TABLE `directors`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `films`
--
ALTER TABLE `films`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `literature_id` (`literature_id`);

--
-- Индексы таблицы `literature`
--
ALTER TABLE `literature`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `movies_watched`
--
ALTER TABLE `movies_watched`
  ADD UNIQUE KEY `film_id` (`film_id`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Индексы таблицы `producers`
--
ALTER TABLE `producers`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `produces`
--
ALTER TABLE `produces`
  ADD UNIQUE KEY `film_id` (`film_id`);

--
-- Индексы таблицы `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `film_id` (`film_id`);

--
-- Индексы таблицы `starring`
--
ALTER TABLE `starring`
  ADD UNIQUE KEY `film_id` (`film_id`),
  ADD KEY `actor_id` (`actor_id`),
  ADD KEY `character_id` (`character_id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `user_profile_information`
--
ALTER TABLE `user_profile_information`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `actors`
--
ALTER TABLE `actors`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `characters_of_film`
--
ALTER TABLE `characters_of_film`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `directors`
--
ALTER TABLE `directors`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `films`
--
ALTER TABLE `films`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `literature`
--
ALTER TABLE `literature`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `producers`
--
ALTER TABLE `producers`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT для таблицы `user_profile_information`
--
ALTER TABLE `user_profile_information`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

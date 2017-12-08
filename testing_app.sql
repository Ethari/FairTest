-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Czas generowania: 08 Gru 2017, 13:11
-- Wersja serwera: 10.1.21-MariaDB
-- Wersja PHP: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `testing_app`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `course`
--

CREATE TABLE `course` (
  `course_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `owner` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `course`
--

INSERT INTO `course` (`course_id`, `name`, `owner`) VALUES
  (56, 'Internet Technologies', 1),
  (58, 'Diploma Seminar', 1);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `generated_test`
--

CREATE TABLE `generated_test` (
  `id` int(11) NOT NULL,
  `scheduled_test_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `random_test` longtext CHARACTER SET utf8 NOT NULL,
  `time_started` int(22) NOT NULL,
  `ended` tinyint(1) NOT NULL DEFAULT '0',
  `max_points` double DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `generated_test`
--

INSERT INTO `generated_test` (`id`, `scheduled_test_id`, `student_id`, `random_test`, `time_started`, `ended`, `max_points`) VALUES
  (54, 57, 22, 'a:6:{i:0;a:8:{s:11:\"question_id\";s:2:\"69\";s:18:\"parametric_formula\";N;s:11:\"description\";s:110:\"<p>Mark correct sentences as&nbsp;<strong>True</strong> and incorrect ones as&nbsp;<strong>False.</strong></p>\";s:4:\"type\";s:10:\"true_false\";s:21:\"correct_answer_points\";s:1:\"3\";s:23:\"incorrect_answer_points\";s:2:\"-1\";s:14:\"automatic_eval\";s:1:\"1\";s:7:\"answers\";a:5:{i:0;a:4:{s:2:\"id\";s:2:\"41\";s:11:\"question_id\";s:2:\"69\";s:11:\"description\";s:17:\"I like drive car.\";s:6:\"answer\";s:4:\"true\";}i:1;a:4:{s:2:\"id\";s:2:\"43\";s:11:\"question_id\";s:2:\"69\";s:11:\"description\";s:20:\"I am a good student.\";s:6:\"answer\";s:4:\"true\";}i:2;a:4:{s:2:\"id\";s:2:\"44\";s:11:\"question_id\";s:2:\"69\";s:11:\"description\";s:18:\"This not good car.\";s:6:\"answer\";s:5:\"false\";}i:3;a:4:{s:2:\"id\";s:2:\"42\";s:11:\"question_id\";s:2:\"69\";s:11:\"description\";s:23:\"I enjoy driving my car.\";s:6:\"answer\";s:4:\"true\";}i:4;a:4:{s:2:\"id\";s:2:\"45\";s:11:\"question_id\";s:2:\"69\";s:11:\"description\";s:11:\"Potato bad.\";s:6:\"answer\";s:5:\"false\";}}}i:1;a:8:{s:11:\"question_id\";s:2:\"67\";s:18:\"parametric_formula\";N;s:11:\"description\";s:31:\"<p>Where is your car?&nbsp;</p>\";s:4:\"type\";s:15:\"multiple_choice\";s:21:\"correct_answer_points\";s:1:\"3\";s:23:\"incorrect_answer_points\";s:2:\"-1\";s:14:\"automatic_eval\";s:1:\"1\";s:7:\"answers\";a:5:{i:0;a:4:{s:2:\"id\";s:2:\"51\";s:11:\"question_id\";s:2:\"67\";s:11:\"description\";s:35:\"Mine car is parked near the school.\";s:6:\"answer\";s:5:\"false\";}i:1;a:4:{s:2:\"id\";s:2:\"52\";s:11:\"question_id\";s:2:\"67\";s:11:\"description\";s:47:\"Is parked between the red car and the blue car.\";s:6:\"answer\";s:5:\"false\";}i:2;a:4:{s:2:\"id\";s:2:\"50\";s:11:\"question_id\";s:2:\"67\";s:11:\"description\";s:29:\"This is parked on the street.\";s:6:\"answer\";s:5:\"false\";}i:3;a:4:{s:2:\"id\";s:2:\"53\";s:11:\"question_id\";s:2:\"67\";s:11:\"description\";s:36:\"It is parked in front of your house.\";s:6:\"answer\";s:4:\"true\";}i:4;a:4:{s:2:\"id\";s:2:\"54\";s:11:\"question_id\";s:2:\"67\";s:11:\"description\";s:20:\" It is to the house.\";s:6:\"answer\";s:5:\"false\";}}}i:2;a:7:{s:11:\"question_id\";s:2:\"68\";s:18:\"parametric_formula\";N;s:11:\"description\";s:57:\"<p>Write a short description of your morning routine.</p>\";s:4:\"type\";s:13:\"open_question\";s:21:\"correct_answer_points\";s:1:\"5\";s:23:\"incorrect_answer_points\";s:1:\"0\";s:14:\"automatic_eval\";s:1:\"0\";}i:3;a:8:{s:11:\"question_id\";s:2:\"66\";s:18:\"parametric_formula\";N;s:11:\"description\";s:64:\"<p>Marcello is driving too fast. Select the correct comment.</p>\";s:4:\"type\";s:15:\"multiple_choice\";s:21:\"correct_answer_points\";s:1:\"3\";s:23:\"incorrect_answer_points\";s:2:\"-1\";s:14:\"automatic_eval\";s:1:\"1\";s:7:\"answers\";a:6:{i:0;a:4:{s:2:\"id\";s:2:\"44\";s:11:\"question_id\";s:2:\"66\";s:11:\"description\";s:13:\"Slowing down!\";s:6:\"answer\";s:5:\"false\";}i:1;a:4:{s:2:\"id\";s:2:\"46\";s:11:\"question_id\";s:2:\"66\";s:11:\"description\";s:14:\"Slow you down!\";s:6:\"answer\";s:5:\"false\";}i:2;a:4:{s:2:\"id\";s:2:\"48\";s:11:\"question_id\";s:2:\"66\";s:11:\"description\";s:20:\"Don\'t drive so fast!\";s:6:\"answer\";s:4:\"true\";}i:3;a:4:{s:2:\"id\";s:2:\"45\";s:11:\"question_id\";s:2:\"66\";s:11:\"description\";s:18:\"Not to drive fast!\";s:6:\"answer\";s:5:\"false\";}i:4;a:4:{s:2:\"id\";s:2:\"49\";s:11:\"question_id\";s:2:\"66\";s:11:\"description\";s:10:\"Slow down!\";s:6:\"answer\";s:4:\"true\";}i:5;a:4:{s:2:\"id\";s:2:\"47\";s:11:\"question_id\";s:2:\"66\";s:11:\"description\";s:17:\"Don\'t fast drive!\";s:6:\"answer\";s:5:\"false\";}}}i:4;a:9:{s:11:\"question_id\";s:2:\"72\";s:18:\"parametric_formula\";s:18:\"return( $B - $Z );\";s:11:\"description\";s:65:\"<p>John has 6 apples. He eats 3 . of them. How many are left?</p>\";s:4:\"type\";s:10:\"parametric\";s:21:\"correct_answer_points\";s:1:\"1\";s:23:\"incorrect_answer_points\";s:1:\"0\";s:14:\"automatic_eval\";s:1:\"0\";s:10:\"parameters\";a:2:{i:0;a:4:{s:11:\"question_id\";s:2:\"72\";s:9:\"parameter\";s:1:\"B\";s:16:\"parameter_values\";a:3:{i:0;s:1:\"5\";i:1;s:1:\"6\";i:2;s:2:\"10\";}s:12:\"rolled_value\";s:1:\"6\";}i:1;a:4:{s:11:\"question_id\";s:2:\"72\";s:9:\"parameter\";s:1:\"Z\";s:16:\"parameter_values\";a:3:{i:0;s:1:\"2\";i:1;s:1:\"3\";i:2;s:1:\"1\";}s:12:\"rolled_value\";s:1:\"3\";}}s:17:\"calculated_result\";i:3;}i:5;a:9:{s:11:\"question_id\";s:2:\"70\";s:18:\"parametric_formula\";s:21:\"return($A + $B - $C);\";s:11:\"description\";s:72:\"<p>What is the result of this equation?</p>\n<p>223965 + 10 - 359 = ?</p>\";s:4:\"type\";s:10:\"parametric\";s:21:\"correct_answer_points\";s:1:\"4\";s:23:\"incorrect_answer_points\";s:2:\"-2\";s:14:\"automatic_eval\";s:1:\"1\";s:10:\"parameters\";a:3:{i:0;a:4:{s:11:\"question_id\";s:2:\"70\";s:9:\"parameter\";s:1:\"A\";s:16:\"parameter_values\";s:10:\"student_id\";s:12:\"rolled_value\";s:6:\"223965\";}i:1;a:4:{s:11:\"question_id\";s:2:\"70\";s:9:\"parameter\";s:1:\"B\";s:16:\"parameter_values\";a:12:{i:0;s:1:\"1\";i:1;s:1:\"2\";i:2;s:1:\"3\";i:3;s:1:\"4\";i:4;s:1:\"5\";i:5;s:1:\"6\";i:6;s:1:\"7\";i:7;s:1:\"9\";i:8;s:2:\"10\";i:9;s:2:\"22\";i:10;s:2:\"12\";i:11;s:2:\"35\";}s:12:\"rolled_value\";s:2:\"10\";}i:2;a:4:{s:11:\"question_id\";s:2:\"70\";s:9:\"parameter\";s:1:\"C\";s:16:\"parameter_values\";a:7:{i:0;s:2:\"12\";i:1;s:1:\"3\";i:2;s:1:\"4\";i:3;s:1:\"1\";i:4;s:2:\"11\";i:5;s:1:\"2\";i:6;s:3:\"359\";}s:12:\"rolled_value\";s:3:\"359\";}}s:17:\"calculated_result\";i:223616;}}', 1512257730, 0, 19);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `groups`
--

CREATE TABLE `groups` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `day` varchar(255) NOT NULL,
  `hour` varchar(255) NOT NULL,
  `owner` int(11) DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `groups`
--

INSERT INTO `groups` (`id`, `name`, `day`, `hour`, `owner`, `course_id`) VALUES
  (31, 'Internet Technologies 1', 'Monday', '3 : 15 PM', 1, 56),
  (32, 'Diploma Seminar 1', 'Monday', '1 : 22 PM', 1, 58);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `groups_students`
--

CREATE TABLE `groups_students` (
  `student_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Zrzut danych tabeli `groups_students`
--

INSERT INTO `groups_students` (`student_id`, `group_id`) VALUES
  (4, 31),
  (4, 32),
  (5, 31),
  (5, 32),
  (6, 31),
  (6, 32),
  (7, 31),
  (7, 32),
  (10, 31),
  (10, 32),
  (11, 31),
  (11, 32),
  (12, 31),
  (12, 32),
  (19, 32),
  (22, 31),
  (22, 32);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `multiple_choice_question`
--

CREATE TABLE `multiple_choice_question` (
  `id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `description` varchar(255) NOT NULL,
  `answer` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `multiple_choice_question`
--

INSERT INTO `multiple_choice_question` (`id`, `question_id`, `description`, `answer`) VALUES
  (44, 66, 'Slowing down!', 'false'),
  (45, 66, 'Not to drive fast!', 'false'),
  (46, 66, 'Slow you down!', 'false'),
  (47, 66, 'Don\'t fast drive!', 'false'),
  (48, 66, 'Don\'t drive so fast!', 'true'),
  (49, 66, 'Slow down!', 'true'),
  (50, 67, 'This is parked on the street.', 'false'),
  (51, 67, 'Mine car is parked near the school.', 'false'),
  (52, 67, 'Is parked between the red car and the blue car.', 'false'),
  (53, 67, 'It is parked in front of your house.', 'true'),
  (54, 67, ' It is to the house.', 'false'),
  (55, 71, 'Berlin', 'false'),
  (56, 71, 'Warsaw', 'true'),
  (57, 71, 'Gdansk', 'false');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `parametric_question`
--

CREATE TABLE `parametric_question` (
  `question_id` int(11) NOT NULL,
  `parameter` varchar(255) NOT NULL,
  `parameter_values` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `parametric_question`
--

INSERT INTO `parametric_question` (`question_id`, `parameter`, `parameter_values`) VALUES
  (70, 'A', 's:10:\"student_id\";'),
  (70, 'B', 'a:12:{i:0;s:1:\"1\";i:1;s:1:\"2\";i:2;s:1:\"3\";i:3;s:1:\"4\";i:4;s:1:\"5\";i:5;s:1:\"6\";i:6;s:1:\"7\";i:7;s:1:\"9\";i:8;s:2:\"10\";i:9;s:2:\"22\";i:10;s:2:\"12\";i:11;s:2:\"35\";}'),
  (70, 'C', 'a:7:{i:0;s:2:\"12\";i:1;s:1:\"3\";i:2;s:1:\"4\";i:3;s:1:\"1\";i:4;s:2:\"11\";i:5;s:1:\"2\";i:6;s:3:\"359\";}'),
  (72, 'B', 'a:3:{i:0;s:1:\"5\";i:1;s:1:\"6\";i:2;s:2:\"10\";}'),
  (72, 'Z', 'a:3:{i:0;s:1:\"2\";i:1;s:1:\"3\";i:2;s:1:\"1\";}'),
  (73, 'z', 'a:4:{i:0;s:1:\"1\";i:1;s:1:\"4\";i:2;s:1:\"5\";i:3;s:1:\"2\";}'),
  (73, 'B', 'a:4:{i:0;s:1:\"6\";i:1;s:1:\"1\";i:2;s:1:\"2\";i:3;s:1:\"3\";}');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `question`
--

CREATE TABLE `question` (
  `id` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `description` text NOT NULL,
  `tags` text NOT NULL,
  `date_added` datetime NOT NULL,
  `parametric_formula` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `question`
--

INSERT INTO `question` (`id`, `type`, `description`, `tags`, `date_added`, `parametric_formula`) VALUES
  (66, 2, '<p>Marcello is driving too fast. Select the correct comment.</p>', 'english, beginner', '2017-11-28 16:33:54', NULL),
  (67, 2, '<p>Where is your car?&nbsp;</p>', 'english, beginner', '2017-11-28 16:35:22', NULL),
  (68, 3, '<p>Write a short description of your morning routine.</p>', 'english, beginner, essay', '2017-11-28 16:35:59', NULL),
  (69, 1, '<p>Mark correct sentences as&nbsp;<strong>True</strong> and incorrect ones as&nbsp;<strong>False.</strong></p>', 'english, beginner', '2017-11-28 16:37:52', NULL),
  (70, 4, '<p>What is the result of this equation?</p>\n<p>{{A}} + {{B}} - {{C}} = ?</p>', 'math, basic, equation', '2017-11-28 16:39:26', 'return($A + $B - $C);'),
  (71, 2, '<p>What is the capital of Poland?</p>', 'geography, poland', '2017-11-30 13:37:11', NULL),
  (72, 4, '<p>John has {{B}} apples. He eats {{Z}} . of them. How many are left?</p>', '', '2017-11-30 13:38:51', 'return( $B - $Z );'),
  (73, 4, '<p>Jas ma {{z}} jablek. Zje {{B}} ile zostanie</p>', '', '2017-12-03 19:49:50', 'return( $z - $B );');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `question_types`
--

CREATE TABLE `question_types` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `page` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `question_types`
--

INSERT INTO `question_types` (`id`, `name`, `page`) VALUES
  (1, 'True or False', 'true_false'),
  (2, 'Multiple Choice', 'multiple_choice'),
  (3, 'Open Question', 'open_question'),
  (4, 'Parametric Question', 'parametric');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `student`
--

CREATE TABLE `student` (
  `user_id` int(11) NOT NULL,
  `studentIndex` varchar(255) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `student`
--

INSERT INTO `student` (`user_id`, `studentIndex`) VALUES
  (4, '220641'),
  (5, '220643'),
  (6, '218890'),
  (7, '220621'),
  (10, '220634'),
  (11, '223288'),
  (12, '223212'),
  (19, '220649'),
  (22, '223965');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `test`
--

CREATE TABLE `test` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `topic` text NOT NULL,
  `owner` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `test`
--

INSERT INTO `test` (`id`, `name`, `topic`, `owner`) VALUES
  (17, 'Beginner English', 'Phrases', 1),
  (18, 'new_test_18', 'new_topic_18', 1);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `tests_questions`
--

CREATE TABLE `tests_questions` (
  `test_id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `correct_answer_points` float NOT NULL DEFAULT '1',
  `incorrect_answer_points` float NOT NULL DEFAULT '0',
  `automatic_eval` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `tests_questions`
--

INSERT INTO `tests_questions` (`test_id`, `question_id`, `correct_answer_points`, `incorrect_answer_points`, `automatic_eval`) VALUES
  (17, 66, 3, -1, 1),
  (17, 69, 3, -1, 1),
  (17, 70, 4, -2, 1),
  (17, 67, 3, -1, 1),
  (17, 68, 5, 0, 0),
  (17, 72, 1, 0, 0),
  (17, 73, 1, 0, 0);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `test_results`
--

CREATE TABLE `test_results` (
  `generated_test_id` int(11) NOT NULL,
  `result` longtext NOT NULL,
  `fully_evaluated` tinyint(1) NOT NULL,
  `time_finished` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `test_schedule`
--

CREATE TABLE `test_schedule` (
  `id` int(11) NOT NULL,
  `test_id` int(11) NOT NULL,
  `start_time` datetime NOT NULL,
  `end_time` datetime NOT NULL,
  `result_presentation_type` enum('specify_time','manual','end_of_exam') NOT NULL,
  `test_time` int(11) NOT NULL,
  `result_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `test_schedule`
--

INSERT INTO `test_schedule` (`id`, `test_id`, `start_time`, `end_time`, `result_presentation_type`, `test_time`, `result_date`) VALUES
  (48, 17, '2017-11-28 16:40:00', '2017-11-28 16:45:00', 'end_of_exam', 30, NULL),
  (49, 17, '2017-11-28 16:46:00', '2017-11-28 16:51:00', 'end_of_exam', 30, NULL),
  (50, 17, '2017-11-28 17:05:00', '2017-11-28 17:10:00', 'end_of_exam', 20, NULL),
  (51, 17, '2017-11-28 17:08:00', '2017-11-28 17:15:00', 'end_of_exam', 30, NULL),
  (52, 17, '2017-11-28 17:12:00', '2017-11-28 17:16:00', 'end_of_exam', 30, NULL),
  (53, 17, '2017-11-28 17:16:00', '2017-11-28 17:20:00', 'end_of_exam', 30, NULL),
  (54, 17, '2017-11-28 17:19:00', '2017-11-28 17:23:00', 'end_of_exam', 20, NULL),
  (55, 17, '2017-11-28 17:23:00', '2017-11-28 17:26:00', 'end_of_exam', 20, NULL),
  (56, 17, '2017-11-28 17:32:00', '2017-11-28 17:36:00', 'end_of_exam', 30, NULL),
  (57, 17, '2017-12-03 00:34:00', '2017-12-03 01:34:00', 'end_of_exam', 45, NULL);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `test_schedule_group`
--

CREATE TABLE `test_schedule_group` (
  `scheduled_test_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `test_schedule_group`
--

INSERT INTO `test_schedule_group` (`scheduled_test_id`, `group_id`) VALUES
  (48, 31),
  (49, 31),
  (50, 31),
  (51, 31),
  (52, 31),
  (53, 31),
  (54, 31),
  (55, 31),
  (56, 31),
  (57, 32);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `test_student_answers`
--

CREATE TABLE `test_student_answers` (
  `scheduled_test_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `subquestion_id` int(11) NOT NULL,
  `answer` longtext CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `test_student_answers`
--

INSERT INTO `test_student_answers` (`scheduled_test_id`, `student_id`, `question_id`, `subquestion_id`, `answer`) VALUES
  (54, 22, 70, 0, '223616');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `true_false_question`
--

CREATE TABLE `true_false_question` (
  `id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `description` varchar(255) CHARACTER SET utf8 NOT NULL,
  `answer` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `true_false_question`
--

INSERT INTO `true_false_question` (`id`, `question_id`, `description`, `answer`) VALUES
  (41, 69, 'I like drive car.', 'true'),
  (42, 69, 'I enjoy driving my car.', 'true'),
  (43, 69, 'I am a good student.', 'true'),
  (44, 69, 'This not good car.', 'false'),
  (45, 69, 'Potato bad.', 'false');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `firstName` varchar(255) CHARACTER SET utf8 NOT NULL,
  `lastName` varchar(255) CHARACTER SET utf8 NOT NULL,
  `username` varchar(255) CHARACTER SET utf8 NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 NOT NULL,
  `type` enum('student','teacher') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `user`
--

INSERT INTO `user` (`id`, `firstName`, `lastName`, `username`, `password`, `type`) VALUES
  (4, 'Paulina ', 'Binas', '220641', 'd4.uXoif7DOKc', 'student'),
  (5, 'Patryk ', 'Bresso', '220643', 'd47fYVSRVxlbM', 'student'),
  (6, 'Tenzin ', 'Choewang', '218890', 'd4n8AzxCujKbA', 'student'),
  (7, 'Szymon Andrzej', 'Hajduk', '220621', 'd4oljvunxP5k2', 'student'),
  (10, 'Piotr Dawid', 'Miłkowski', '220634', 'd4EUi60NUI2v6', 'student'),
  (11, 'Tsvetan Tsvetanov', 'Ovedenski', '223288', 'd483ZjB7tAnGU', 'student'),
  (12, 'Rupali ', 'Sharma', '223212', 'd40u8izkRplX.', 'student'),
  (18, 'Jan', 'Kowalski', 'mikolaj', 'd49hNgtS5xwtg', 'teacher'),
  (19, 'Aleksandra Dominika', 'Michalewska', '220649', 'd4Wax17I5kkGY', 'student'),
  (22, 'Mikołaj', 'Szewczyk', '223965', 'd49hNgtS5xwtg', 'student');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indexes for table `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`course_id`),
  ADD KEY `course_id` (`course_id`);

--
-- Indexes for table `generated_test`
--
ALTER TABLE `generated_test`
  ADD PRIMARY KEY (`id`),
  ADD KEY `scheduled_test_id` (`scheduled_test_id`),
  ADD KEY `student_id` (`student_id`);

--
-- Indexes for table `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `course_id` (`course_id`);

--
-- Indexes for table `groups_students`
--
ALTER TABLE `groups_students`
  ADD UNIQUE KEY `unique_index` (`student_id`,`group_id`),
  ADD KEY `student_id` (`student_id`),
  ADD KEY `group_id` (`group_id`);

--
-- Indexes for table `multiple_choice_question`
--
ALTER TABLE `multiple_choice_question`
  ADD PRIMARY KEY (`id`),
  ADD KEY `question_id` (`question_id`);

--
-- Indexes for table `parametric_question`
--
ALTER TABLE `parametric_question`
  ADD KEY `question_id` (`question_id`);

--
-- Indexes for table `question`
--
ALTER TABLE `question`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `question_types`
--
ALTER TABLE `question_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `test`
--
ALTER TABLE `test`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tests_questions`
--
ALTER TABLE `tests_questions`
  ADD KEY `test_id` (`test_id`),
  ADD KEY `question_id` (`question_id`);

--
-- Indexes for table `test_results`
--
ALTER TABLE `test_results`
  ADD KEY `generated_test_id` (`generated_test_id`);

--
-- Indexes for table `test_schedule`
--
ALTER TABLE `test_schedule`
  ADD PRIMARY KEY (`id`),
  ADD KEY `test_id` (`test_id`);

--
-- Indexes for table `test_schedule_group`
--
ALTER TABLE `test_schedule_group`
  ADD KEY `scheduled_test_id` (`scheduled_test_id`),
  ADD KEY `group_id` (`group_id`);

--
-- Indexes for table `test_student_answers`
--
ALTER TABLE `test_student_answers`
  ADD UNIQUE KEY `unique_index` (`scheduled_test_id`,`student_id`,`question_id`,`subquestion_id`),
  ADD KEY `scheduled_test_id` (`scheduled_test_id`),
  ADD KEY `student_id` (`student_id`),
  ADD KEY `question_id` (`question_id`),
  ADD KEY `subquestion_id` (`subquestion_id`);

--
-- Indexes for table `true_false_question`
--
ALTER TABLE `true_false_question`
  ADD PRIMARY KEY (`id`),
  ADD KEY `question_id` (`question_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT dla tabeli `course`
--
ALTER TABLE `course`
  MODIFY `course_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;
--
-- AUTO_INCREMENT dla tabeli `generated_test`
--
ALTER TABLE `generated_test`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;
--
-- AUTO_INCREMENT dla tabeli `groups`
--
ALTER TABLE `groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;
--
-- AUTO_INCREMENT dla tabeli `multiple_choice_question`
--
ALTER TABLE `multiple_choice_question`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;
--
-- AUTO_INCREMENT dla tabeli `question`
--
ALTER TABLE `question`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=74;
--
-- AUTO_INCREMENT dla tabeli `question_types`
--
ALTER TABLE `question_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT dla tabeli `test`
--
ALTER TABLE `test`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT dla tabeli `test_schedule`
--
ALTER TABLE `test_schedule`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;
--
-- AUTO_INCREMENT dla tabeli `true_false_question`
--
ALTER TABLE `true_false_question`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;
--
-- AUTO_INCREMENT dla tabeli `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `generated_test`
--
ALTER TABLE `generated_test`
  ADD CONSTRAINT `generated_test_ibfk_1` FOREIGN KEY (`scheduled_test_id`) REFERENCES `test_schedule` (`id`),
  ADD CONSTRAINT `generated_test_ibfk_2` FOREIGN KEY (`student_id`) REFERENCES `user` (`id`) ON DELETE CASCADE;

--
-- Ograniczenia dla tabeli `groups`
--
ALTER TABLE `groups`
  ADD CONSTRAINT `groups_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`) ON DELETE CASCADE;

--
-- Ograniczenia dla tabeli `groups_students`
--
ALTER TABLE `groups_students`
  ADD CONSTRAINT `groups_students_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `user` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `groups_students_ibfk_2` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE CASCADE;

--
-- Ograniczenia dla tabeli `multiple_choice_question`
--
ALTER TABLE `multiple_choice_question`
  ADD CONSTRAINT `multiple_choice_question_ibfk_1` FOREIGN KEY (`question_id`) REFERENCES `question` (`id`) ON DELETE CASCADE;

--
-- Ograniczenia dla tabeli `parametric_question`
--
ALTER TABLE `parametric_question`
  ADD CONSTRAINT `parametric_question_ibfk_1` FOREIGN KEY (`question_id`) REFERENCES `question` (`id`) ON DELETE CASCADE;

--
-- Ograniczenia dla tabeli `student`
--
ALTER TABLE `student`
  ADD CONSTRAINT `student_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE;

--
-- Ograniczenia dla tabeli `tests_questions`
--
ALTER TABLE `tests_questions`
  ADD CONSTRAINT `tests_questions_ibfk_1` FOREIGN KEY (`test_id`) REFERENCES `test` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tests_questions_ibfk_2` FOREIGN KEY (`question_id`) REFERENCES `question` (`id`) ON DELETE CASCADE;

--
-- Ograniczenia dla tabeli `test_results`
--
ALTER TABLE `test_results`
  ADD CONSTRAINT `test_results_ibfk_1` FOREIGN KEY (`generated_test_id`) REFERENCES `generated_test` (`id`) ON DELETE CASCADE;

--
-- Ograniczenia dla tabeli `test_schedule`
--
ALTER TABLE `test_schedule`
  ADD CONSTRAINT `test_schedule_ibfk_2` FOREIGN KEY (`test_id`) REFERENCES `test` (`id`) ON DELETE CASCADE;

--
-- Ograniczenia dla tabeli `test_schedule_group`
--
ALTER TABLE `test_schedule_group`
  ADD CONSTRAINT `test_schedule_group_ibfk_1` FOREIGN KEY (`scheduled_test_id`) REFERENCES `test_schedule` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `test_schedule_group_ibfk_2` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE CASCADE;

--
-- Ograniczenia dla tabeli `test_student_answers`
--
ALTER TABLE `test_student_answers`
  ADD CONSTRAINT `test_student_answers_ibfk_2` FOREIGN KEY (`student_id`) REFERENCES `user` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `test_student_answers_ibfk_3` FOREIGN KEY (`question_id`) REFERENCES `question` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `test_student_answers_ibfk_5` FOREIGN KEY (`scheduled_test_id`) REFERENCES `generated_test` (`id`) ON DELETE CASCADE;

--
-- Ograniczenia dla tabeli `true_false_question`
--
ALTER TABLE `true_false_question`
  ADD CONSTRAINT `true_false_question_ibfk_1` FOREIGN KEY (`question_id`) REFERENCES `question` (`id`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

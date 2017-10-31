-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Czas generowania: 21 Cze 2017, 16:37
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
(37, 'Physics', 1),
(48, 'Java', 1),
(49, 'Programming', 1),
(50, 'Preparatory Project', 1),
(51, 'C++', 1),
(52, 'Presentation', 1);

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
(16, 'C++ group', 'Wednesday', '7 : 22 PM', 1, 51),
(18, 'Presentation group', 'Monday', '6 : 15 PM', 1, 52),
(19, 'JavaHava', 'Monday', '11 : 30 AM', 1, 48);

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
(175, 16),
(176, 16),
(177, 16),
(178, 16),
(179, 16),
(180, 16),
(181, 16),
(182, 16),
(183, 16),
(184, 16),
(185, 16),
(186, 16),
(187, 16),
(188, 16);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `multiple_choice_question`
--

CREATE TABLE `multiple_choice_question` (
  `question_id` int(11) NOT NULL,
  `description` varchar(255) NOT NULL,
  `answer` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `multiple_choice_question`
--

INSERT INTO `multiple_choice_question` (`question_id`, `description`, `answer`) VALUES
(32, 'Code is correct', 'true'),
(32, 'Code is not correct', 'false'),
(33, 'Echo of number', 'true'),
(33, 'Somethn', 'false'),
(33, 'asdasd', 'false'),
(34, 'integer', 'true'),
(34, 'string', 'true'),
(34, 'class', 'true'),
(34, 'boolean', 'true'),
(35, 'asdasd', 'false'),
(36, 'asd', 'false'),
(37, 'the spreading of the infection to the sinuses.', 'true'),
(37, 'damage to the olfactory nerve.', 'false'),
(37, 'destruction of white blood cells.', 'false'),
(37, 'congestion of the mucous membrane in the nose', 'false'),
(38, 'hinder … incentive', 'false'),
(38, 'thwart … refuge', 'false'),
(38, 'impede … deterrent', 'true'),
(38, 'permit … provocation', 'false'),
(39, 'meticulous', 'true'),
(39, 'lackadaisical', 'false'),
(39, 'apathetic', 'false'),
(39, 'relaxed', 'false'),
(39, 'lethargic', 'false'),
(42, '1', 'false'),
(42, '2', 'true'),
(42, '3', 'false'),
(42, '4', 'false'),
(49, 'This code looks good', 'true'),
(49, 'B', 'false'),
(49, 'C', 'false'),
(49, 'D', 'false');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `question`
--

CREATE TABLE `question` (
  `id` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `description` text NOT NULL,
  `tags` text NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `question`
--

INSERT INTO `question` (`id`, `type`, `description`, `tags`, `date_added`) VALUES
(37, 2, '<p><strong>Frequent use of sprays, oils, and antiseptics in the nose during a bad cold may result in:</strong></p>', 'medicine, illness, nose', '2017-06-07 18:01:16'),
(38, 2, '<p>The threat of rain didn&rsquo;t &hellip; her stroll through the grounds. Even the first drops were no &hellip;, and she continued her walk.</p>', 'english, words', '2017-06-07 18:03:28'),
(39, 2, '<p>Jane is a(n) &hellip; student. She reads every page of her textbooks and studies for hours before every test.</p>', 'english, words, fill the gaps', '2017-06-07 18:05:12'),
(40, 3, '<p>What is the difference between arrays and collection?</p>', 'programming, array, collection, data ', '2017-06-07 18:18:04'),
(41, 3, '<p><em></em>What is the relationship between a class and an object?</p>', 'class, object, oop', '2017-06-07 18:19:03'),
(42, 2, '<p style=\"text-align: left;\">What is the value of that function?</p>\n<pre class=\"language-php\"><code>    public function insertQuestionBase($attributes){\n        $values = $attributes;\n        $values[\'date_added\'] = date(\'Y-m-d H:i:s\');\n        ChromePhp::log($values);\n        $this-&gt;db-&gt;insert(\'question\', $values);\n        $id = $this-&gt;db-&gt;insert_id();\n        ChromePhp::log($id);\n\n        return $id;\n    }</code></pre>', '', '2017-06-07 19:11:53'),
(43, 3, '<p>What is your name?</p>', 'name, something', '2017-06-07 19:12:34'),
(44, 1, '<p>asdasd</p>', 'oop, program', '2017-06-07 19:26:09'),
(45, 3, '<p>Some kind of question</p>', 'test, question', '2017-06-14 15:00:47'),
(47, 3, '<pre>public function getQuestions(){<br />    $sql = \"SELECT q.id, q.description, q.tags, q.date_added, qt.name as type FROM question q JOIN question_types qt ON q.type = qt.id;\";<br />    $query = $this-&gt;db-&gt;query($sql);<br /><br />    return $query-&gt;result_array();<br />}</pre>', 'asdasd', '2017-06-21 12:45:33'),
(48, 1, '<p>Some description of the question.</p>', 'programming', '2017-06-21 12:50:46'),
(49, 2, '<pre class=\"language-markup\"><code>&lt;div class=\"panel panel-default\"&gt;\n            &lt;div class=\"panel-heading\"&gt;\n                &lt;h3 class=\"panel-title\"&gt;&lt;i class=\"fa fa-bar-chart-o fa-fw\"&gt;&lt;/i&gt; Tests&lt;/h3&gt;\n            &lt;/div&gt;\n            &lt;div class=\"panel-body\"&gt;\n                &lt;div id=\"tests_list\"&gt;\n                    &lt;div id = \"group_success\" class=\"alert alert-success alert-dismissible\" role=\"alert\" style = \"display:none;\"&gt;\n                        &lt;button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\"&gt;\n                            &lt;span aria-hidden=\"true\"&gt;&amp;times;&lt;/span&gt;\n                        &lt;/button&gt;\n                        &lt;strong&gt;Success!&lt;/strong&gt; Test created.\n                    &lt;/div&gt;</code></pre>', 'programming, something', '2017-06-21 13:07:14');

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
(3, 'Open Question', 'open_question');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `student`
--

CREATE TABLE `student` (
  `id` int(11) NOT NULL,
  `firstName` varchar(255) CHARACTER SET utf16 COLLATE utf16_bin NOT NULL,
  `lastName` varchar(255) CHARACTER SET utf16 COLLATE utf16_bin NOT NULL,
  `studentIndex` varchar(255) NOT NULL,
  `password` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `student`
--

INSERT INTO `student` (`id`, `firstName`, `lastName`, `studentIndex`, `password`) VALUES
(175, 'Micha³ Franciszek', 'Biernacki', '200056', 'd447ZGy60S5og'),
(176, 'Paulina ', 'Binas', '220641', 'd4.uXoif7DOKc'),
(177, 'Patryk ', 'Bresso', '220643', 'd47fYVSRVxlbM'),
(178, 'Tenzin ', 'Choewang', '218890', 'd4n8AzxCujKbA'),
(179, 'Szymon Andrzej', 'Hajduk', '220621', 'd4oljvunxP5k2'),
(180, 'Mateusz ', 'Kawula', '212894', 'd4OaiqESg7vUY'),
(181, 'Aleksandra Dominika', 'Michalewska', '220649', 'd4Wax17I5kkGY'),
(182, 'Piotr Dawid', 'Mi³kowski', '220634', 'd4EUi60NUI2v6'),
(183, 'Tsvetan Tsvetanov', 'Ovedenski', '223288', 'd483ZjB7tAnGU'),
(184, 'Rupali ', 'Sharma', '223212', 'd40u8izkRplX.'),
(185, 'Adrian Jaros³aw', 'Szczerbiñski', '220655', 'd44w/1a2mCtQ2'),
(186, 'Dilziyodbek ', 'Usmonov', '222078', 'd4uAdsgl6bkT2'),
(187, 'Mateusz Wojciech', 'Woda', '220636', 'd4aVhEF0SErQ.'),
(188, 'Ivan ', 'Yushchuk', '219681', 'd40ZZkb/zYHlc');

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
(10, 'new_test_10', 'new_topic_10', 1);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `tests_questions`
--

CREATE TABLE `tests_questions` (
  `test_id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `tests_questions`
--

INSERT INTO `tests_questions` (`test_id`, `question_id`) VALUES
(10, 49),
(10, 48),
(10, 37),
(10, 45);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `true_false_question`
--

CREATE TABLE `true_false_question` (
  `question_id` int(11) NOT NULL,
  `description` varchar(255) NOT NULL,
  `answer` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `true_false_question`
--

INSERT INTO `true_false_question` (`question_id`, `description`, `answer`) VALUES
(28, '\"Hello\" is a string.', '0'),
(28, 'Strings can be concatenated with numbers in PHP.', '0'),
(28, '+ is used to concatenate strings.', '0'),
(28, 'Test', '0'),
(29, 'asdasd', '0'),
(29, 'asd', '0'),
(29, 'asd', '0'),
(29, 'asd', '0'),
(29, 'asd', '0'),
(30, 'To be or not to be', 'true'),
(30, 'q1', 'true'),
(30, 'asd', 'true'),
(30, 'asd', 'false'),
(30, 'asd', 'true'),
(31, 'Code is correct', ''),
(31, 'Code is not correct', ''),
(44, 'test', 'true'),
(44, 'tesadas', 'false'),
(46, 'This code is nice', 'true'),
(46, 'Question is useful', 'false'),
(46, 'This is false', 'false'),
(46, 'Some true question', 'true'),
(46, 'And another one', 'true'),
(48, 'Some true answer', 'true'),
(48, 'Some false answer', 'false'),
(48, 'Some true answer', 'true'),
(48, 'Some false answer', 'false'),
(48, 'Some true answer', 'true');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `firstName` varchar(255) NOT NULL,
  `lastName` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `user`
--

INSERT INTO `user` (`id`, `firstName`, `lastName`, `username`, `password`) VALUES
(1, 'asdasd', 'asdasd', 'Mikolaj', 'asd'),
(2, 'Test', 'test', 'test123', '1234'),
(3, 'okasopdkpao', 'oaksdopaskdo', 'ekoaskdo', '1234'),
(4, 'okasopdkpao', 'oaksdopaskdo', 'ekoaskdo2', '1234'),
(5, '123', '123', 'test', '123');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indexes for table `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`course_id`);

--
-- Indexes for table `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `groups_students`
--
ALTER TABLE `groups_students`
  ADD UNIQUE KEY `unique_index` (`student_id`,`group_id`);

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
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `studentIndex` (`studentIndex`);

--
-- Indexes for table `test`
--
ALTER TABLE `test`
  ADD PRIMARY KEY (`id`);

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
  MODIFY `course_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;
--
-- AUTO_INCREMENT dla tabeli `groups`
--
ALTER TABLE `groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT dla tabeli `question`
--
ALTER TABLE `question`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;
--
-- AUTO_INCREMENT dla tabeli `question_types`
--
ALTER TABLE `question_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT dla tabeli `student`
--
ALTER TABLE `student`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=189;
--
-- AUTO_INCREMENT dla tabeli `test`
--
ALTER TABLE `test`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT dla tabeli `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
